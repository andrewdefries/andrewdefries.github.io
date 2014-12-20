---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.179001, -0.3623375, -1.820218, 1, 0, 0, 1,
-3.054773, 0.01201037, -1.238174, 1, 0.007843138, 0, 1,
-2.968507, 0.4980375, -1.755332, 1, 0.01176471, 0, 1,
-2.678835, -2.423182, -3.141529, 1, 0.01960784, 0, 1,
-2.531125, -1.250933, -0.7120699, 1, 0.02352941, 0, 1,
-2.444304, 1.082467, -1.288561, 1, 0.03137255, 0, 1,
-2.421789, -1.372504, -2.279807, 1, 0.03529412, 0, 1,
-2.403879, -0.5827996, -0.3398883, 1, 0.04313726, 0, 1,
-2.39766, -0.145747, -3.0024, 1, 0.04705882, 0, 1,
-2.328603, 2.66204, -0.1421973, 1, 0.05490196, 0, 1,
-2.311728, -0.8513186, -0.1462413, 1, 0.05882353, 0, 1,
-2.293186, -0.948577, 0.4287832, 1, 0.06666667, 0, 1,
-2.243521, -0.5740873, -2.781, 1, 0.07058824, 0, 1,
-2.230459, 0.4406813, -0.5283013, 1, 0.07843138, 0, 1,
-2.208638, -0.3778505, -0.1024859, 1, 0.08235294, 0, 1,
-2.208084, 0.2386972, -1.375775, 1, 0.09019608, 0, 1,
-2.190239, -0.8790503, -2.161421, 1, 0.09411765, 0, 1,
-2.170984, -1.998975, -2.059944, 1, 0.1019608, 0, 1,
-2.092422, -0.4889621, -2.972371, 1, 0.1098039, 0, 1,
-2.087741, 0.9889757, 0.5295457, 1, 0.1137255, 0, 1,
-2.077206, 0.4232359, -1.756565, 1, 0.1215686, 0, 1,
-2.026269, -0.9637523, -2.679622, 1, 0.1254902, 0, 1,
-2.020874, -0.4658888, -2.308433, 1, 0.1333333, 0, 1,
-2.010015, -0.3644044, -1.997354, 1, 0.1372549, 0, 1,
-1.968335, 0.6569873, -1.827395, 1, 0.145098, 0, 1,
-1.952552, 0.585874, -0.1450133, 1, 0.1490196, 0, 1,
-1.940166, -0.9980048, -0.6777424, 1, 0.1568628, 0, 1,
-1.934241, 0.6159463, -1.453557, 1, 0.1607843, 0, 1,
-1.908018, 0.09373381, 1.497425, 1, 0.1686275, 0, 1,
-1.895854, 0.45175, 0.9153955, 1, 0.172549, 0, 1,
-1.871978, -0.8888797, -1.616154, 1, 0.1803922, 0, 1,
-1.848894, -1.031021, -1.787589, 1, 0.1843137, 0, 1,
-1.827147, -0.2315486, -0.6835623, 1, 0.1921569, 0, 1,
-1.820844, -0.5757748, -3.012835, 1, 0.1960784, 0, 1,
-1.820325, 0.7610304, -2.036345, 1, 0.2039216, 0, 1,
-1.794182, -0.9710777, -2.274828, 1, 0.2117647, 0, 1,
-1.780663, -0.3037179, 0.1164149, 1, 0.2156863, 0, 1,
-1.756196, -1.938054, -2.609442, 1, 0.2235294, 0, 1,
-1.741895, 0.2112843, 0.7169366, 1, 0.227451, 0, 1,
-1.716048, -0.4985816, -1.64504, 1, 0.2352941, 0, 1,
-1.699932, 0.593389, -3.202182, 1, 0.2392157, 0, 1,
-1.674996, -0.2617304, -2.652357, 1, 0.2470588, 0, 1,
-1.662711, -0.6597814, -2.289298, 1, 0.2509804, 0, 1,
-1.660106, 1.799371, -0.7219319, 1, 0.2588235, 0, 1,
-1.640896, 0.2823714, -0.9818121, 1, 0.2627451, 0, 1,
-1.640801, 0.998755, -0.6696526, 1, 0.2705882, 0, 1,
-1.63155, 0.8177033, -0.568014, 1, 0.2745098, 0, 1,
-1.624054, -1.010999, -2.696565, 1, 0.282353, 0, 1,
-1.620165, -0.363883, -2.064511, 1, 0.2862745, 0, 1,
-1.617128, 0.2657712, -0.939519, 1, 0.2941177, 0, 1,
-1.615965, 0.9025987, -1.266671, 1, 0.3019608, 0, 1,
-1.615414, 1.574982, -1.307444, 1, 0.3058824, 0, 1,
-1.614613, -1.276471, -2.192285, 1, 0.3137255, 0, 1,
-1.598556, 0.2068463, 0.6006054, 1, 0.3176471, 0, 1,
-1.589562, -0.6132247, -3.186439, 1, 0.3254902, 0, 1,
-1.58189, 0.4102336, -1.298242, 1, 0.3294118, 0, 1,
-1.571119, -0.5689151, -2.445109, 1, 0.3372549, 0, 1,
-1.57066, -0.4811527, -1.94284, 1, 0.3411765, 0, 1,
-1.549882, -0.3656745, -0.5406075, 1, 0.3490196, 0, 1,
-1.548072, -1.744529, -3.42165, 1, 0.3529412, 0, 1,
-1.528669, 1.290506, -0.4121993, 1, 0.3607843, 0, 1,
-1.512591, -0.04096119, -0.7305178, 1, 0.3647059, 0, 1,
-1.49892, -0.2162115, -0.4118336, 1, 0.372549, 0, 1,
-1.494888, 0.9654997, 0.2907499, 1, 0.3764706, 0, 1,
-1.494643, -0.3589996, -2.154762, 1, 0.3843137, 0, 1,
-1.489283, 0.3176508, -3.769807, 1, 0.3882353, 0, 1,
-1.487391, -0.4098323, -1.755309, 1, 0.3960784, 0, 1,
-1.470578, -1.236887, -1.979102, 1, 0.4039216, 0, 1,
-1.470248, -0.2096171, -1.956429, 1, 0.4078431, 0, 1,
-1.468115, 1.088043, -1.423391, 1, 0.4156863, 0, 1,
-1.464908, -1.006147, -1.293741, 1, 0.4196078, 0, 1,
-1.457326, -0.6709164, -2.749714, 1, 0.427451, 0, 1,
-1.452132, -1.428527, -2.370897, 1, 0.4313726, 0, 1,
-1.446028, 0.1262731, -3.039444, 1, 0.4392157, 0, 1,
-1.423199, -0.5647033, -2.392561, 1, 0.4431373, 0, 1,
-1.399639, -0.6215499, -0.8065522, 1, 0.4509804, 0, 1,
-1.398841, -0.05762273, -2.343971, 1, 0.454902, 0, 1,
-1.397405, -1.260197, -4.129532, 1, 0.4627451, 0, 1,
-1.389588, -1.630687, -0.9326376, 1, 0.4666667, 0, 1,
-1.38338, -1.121616, -4.681031, 1, 0.4745098, 0, 1,
-1.378938, 0.05638166, -0.8880251, 1, 0.4784314, 0, 1,
-1.378585, -0.2038236, -0.6384627, 1, 0.4862745, 0, 1,
-1.372268, -1.025701, -2.674207, 1, 0.4901961, 0, 1,
-1.371351, -0.7361696, -1.744697, 1, 0.4980392, 0, 1,
-1.351433, 0.6231724, -1.760946, 1, 0.5058824, 0, 1,
-1.343074, 0.5633716, -2.478411, 1, 0.509804, 0, 1,
-1.337727, 0.8566923, -2.28583, 1, 0.5176471, 0, 1,
-1.334991, 0.3435279, 0.4806858, 1, 0.5215687, 0, 1,
-1.325307, -0.4668197, -1.962913, 1, 0.5294118, 0, 1,
-1.323646, -0.02231663, -1.746118, 1, 0.5333334, 0, 1,
-1.314092, -0.3976842, -1.325716, 1, 0.5411765, 0, 1,
-1.307972, 0.01144728, -0.7124423, 1, 0.5450981, 0, 1,
-1.306644, -0.7405525, -2.806402, 1, 0.5529412, 0, 1,
-1.304761, -1.620226, -0.5037662, 1, 0.5568628, 0, 1,
-1.297802, 0.1182295, -2.306464, 1, 0.5647059, 0, 1,
-1.294859, 0.6701259, -1.979334, 1, 0.5686275, 0, 1,
-1.288959, 1.591585, 0.3159057, 1, 0.5764706, 0, 1,
-1.288598, -1.707569, -2.143714, 1, 0.5803922, 0, 1,
-1.286106, 1.010967, -0.6280832, 1, 0.5882353, 0, 1,
-1.286021, 0.6549551, 0.4082954, 1, 0.5921569, 0, 1,
-1.27172, -0.9426113, -1.779275, 1, 0.6, 0, 1,
-1.260454, -0.1953816, -1.924164, 1, 0.6078432, 0, 1,
-1.254087, 0.03884476, -1.757905, 1, 0.6117647, 0, 1,
-1.240416, 1.036332, -0.970642, 1, 0.6196079, 0, 1,
-1.218453, 0.3935875, -1.06004, 1, 0.6235294, 0, 1,
-1.215936, 0.942732, -1.68483, 1, 0.6313726, 0, 1,
-1.214264, -0.5803269, -0.6659575, 1, 0.6352941, 0, 1,
-1.213987, 0.6162382, -1.880019, 1, 0.6431373, 0, 1,
-1.205865, -1.117112, -1.70313, 1, 0.6470588, 0, 1,
-1.188845, -0.6740335, -1.287848, 1, 0.654902, 0, 1,
-1.186008, -1.56699, -1.896417, 1, 0.6588235, 0, 1,
-1.18184, -0.01535524, -1.223296, 1, 0.6666667, 0, 1,
-1.178711, -2.178126, -1.858677, 1, 0.6705883, 0, 1,
-1.176863, 2.117662, -0.953012, 1, 0.6784314, 0, 1,
-1.176675, 0.1478817, -1.342035, 1, 0.682353, 0, 1,
-1.175197, 1.737933, -0.3668634, 1, 0.6901961, 0, 1,
-1.158648, -0.4962416, -3.123863, 1, 0.6941177, 0, 1,
-1.157722, -0.5101002, -2.884484, 1, 0.7019608, 0, 1,
-1.135426, 0.7379358, -0.3933008, 1, 0.7098039, 0, 1,
-1.135092, -0.6062552, -0.9053506, 1, 0.7137255, 0, 1,
-1.131971, 2.222711, -3.131196, 1, 0.7215686, 0, 1,
-1.127515, 0.6456326, -1.753984, 1, 0.7254902, 0, 1,
-1.127363, 0.4075247, -0.4613321, 1, 0.7333333, 0, 1,
-1.124398, 0.5449978, -1.060842, 1, 0.7372549, 0, 1,
-1.120183, 0.998638, -4.214858, 1, 0.7450981, 0, 1,
-1.110191, -1.026082, -2.208774, 1, 0.7490196, 0, 1,
-1.109215, 0.2961535, -0.1499899, 1, 0.7568628, 0, 1,
-1.104446, -1.277593, -3.266757, 1, 0.7607843, 0, 1,
-1.104388, -0.7273183, -2.158702, 1, 0.7686275, 0, 1,
-1.093782, -0.4823534, -2.575092, 1, 0.772549, 0, 1,
-1.091127, 0.9684095, -0.9632059, 1, 0.7803922, 0, 1,
-1.09102, -0.02024291, -1.745576, 1, 0.7843137, 0, 1,
-1.089945, 1.746238, -1.876689, 1, 0.7921569, 0, 1,
-1.088478, 0.1159406, -1.536037, 1, 0.7960784, 0, 1,
-1.088449, -1.10207, -3.263778, 1, 0.8039216, 0, 1,
-1.081918, -1.024599, -2.934923, 1, 0.8117647, 0, 1,
-1.068002, -0.5130756, -1.937874, 1, 0.8156863, 0, 1,
-1.066076, 0.7195153, 0.01163979, 1, 0.8235294, 0, 1,
-1.056923, 0.005273555, -0.6645304, 1, 0.827451, 0, 1,
-1.050551, -1.147579, -1.550632, 1, 0.8352941, 0, 1,
-1.050262, 1.006822, -0.224139, 1, 0.8392157, 0, 1,
-1.046531, 0.9250864, -1.573214, 1, 0.8470588, 0, 1,
-1.044326, 0.5217647, 0.409325, 1, 0.8509804, 0, 1,
-1.041544, -0.1531095, -1.792561, 1, 0.8588235, 0, 1,
-1.030656, 0.1731105, -1.150862, 1, 0.8627451, 0, 1,
-1.030347, -1.222405, -3.668135, 1, 0.8705882, 0, 1,
-1.030004, -0.6538221, -1.928195, 1, 0.8745098, 0, 1,
-1.026576, 0.5564528, -0.5967951, 1, 0.8823529, 0, 1,
-1.026055, 1.227762, -0.5739104, 1, 0.8862745, 0, 1,
-1.025125, 0.8534924, -0.3325331, 1, 0.8941177, 0, 1,
-1.024569, 1.49325, 0.1740242, 1, 0.8980392, 0, 1,
-1.016961, -1.911662, -0.1974871, 1, 0.9058824, 0, 1,
-1.011741, -0.01185416, -0.2143193, 1, 0.9137255, 0, 1,
-1.002736, 2.768885, -0.125103, 1, 0.9176471, 0, 1,
-0.9953786, 0.08475712, -1.445263, 1, 0.9254902, 0, 1,
-0.9854929, -0.4714072, -1.874861, 1, 0.9294118, 0, 1,
-0.9768994, 2.116913, -0.4383748, 1, 0.9372549, 0, 1,
-0.9732636, 0.140006, -1.303096, 1, 0.9411765, 0, 1,
-0.9651995, 1.626628, -1.960523, 1, 0.9490196, 0, 1,
-0.9631311, 0.4231905, -1.793072, 1, 0.9529412, 0, 1,
-0.9598413, -1.11081, -0.1893661, 1, 0.9607843, 0, 1,
-0.9569007, -0.8479105, -1.960984, 1, 0.9647059, 0, 1,
-0.9546165, -0.3163005, -2.29477, 1, 0.972549, 0, 1,
-0.9382687, -0.2013409, -1.8731, 1, 0.9764706, 0, 1,
-0.9296226, -0.376877, -3.176426, 1, 0.9843137, 0, 1,
-0.9274691, 0.01923685, -2.404132, 1, 0.9882353, 0, 1,
-0.9266692, -0.05108099, -1.385642, 1, 0.9960784, 0, 1,
-0.9228609, 1.367412, 0.355407, 0.9960784, 1, 0, 1,
-0.9227635, 1.574543, -2.50353, 0.9921569, 1, 0, 1,
-0.9206882, 1.01374, -1.427412, 0.9843137, 1, 0, 1,
-0.9139294, -0.4620099, -3.035934, 0.9803922, 1, 0, 1,
-0.9132116, -0.2409678, -2.513072, 0.972549, 1, 0, 1,
-0.9128734, 0.6829038, -2.855494, 0.9686275, 1, 0, 1,
-0.9085964, -0.8066092, -2.085327, 0.9607843, 1, 0, 1,
-0.9041381, 0.372021, -0.1868964, 0.9568627, 1, 0, 1,
-0.9031401, 0.9097882, 0.2736749, 0.9490196, 1, 0, 1,
-0.9014376, 2.760643, 2.200588, 0.945098, 1, 0, 1,
-0.8981689, -1.484061, -2.697939, 0.9372549, 1, 0, 1,
-0.8956955, 1.636883, -1.114533, 0.9333333, 1, 0, 1,
-0.891167, -0.1543453, -2.882186, 0.9254902, 1, 0, 1,
-0.8871858, -0.5525023, -2.188904, 0.9215686, 1, 0, 1,
-0.8812333, 0.515386, -2.059519, 0.9137255, 1, 0, 1,
-0.8684812, 0.2212057, -0.3873151, 0.9098039, 1, 0, 1,
-0.8612754, 0.260052, -1.298823, 0.9019608, 1, 0, 1,
-0.8565817, -0.07301585, -0.6777463, 0.8941177, 1, 0, 1,
-0.8517717, 0.4576, -0.9413061, 0.8901961, 1, 0, 1,
-0.8454393, -0.1257225, -1.482892, 0.8823529, 1, 0, 1,
-0.8441462, 0.1221406, -0.9640952, 0.8784314, 1, 0, 1,
-0.8439955, 0.02505449, -2.079164, 0.8705882, 1, 0, 1,
-0.8425843, 1.388413, 0.5924594, 0.8666667, 1, 0, 1,
-0.837157, -0.9577612, -0.9694864, 0.8588235, 1, 0, 1,
-0.8286719, -0.1916978, -4.064541, 0.854902, 1, 0, 1,
-0.825143, 1.400104, -2.253373, 0.8470588, 1, 0, 1,
-0.82105, 0.7918002, 0.2663611, 0.8431373, 1, 0, 1,
-0.8198532, 0.09268367, -2.607996, 0.8352941, 1, 0, 1,
-0.8194101, 0.5725527, -0.6072222, 0.8313726, 1, 0, 1,
-0.8178245, -1.493847, -3.305106, 0.8235294, 1, 0, 1,
-0.8167228, -1.550315, -3.420853, 0.8196079, 1, 0, 1,
-0.8158645, -0.8062727, -2.854448, 0.8117647, 1, 0, 1,
-0.815385, 1.887977, -1.326929, 0.8078431, 1, 0, 1,
-0.8090595, 1.018215, -1.012427, 0.8, 1, 0, 1,
-0.7946578, -1.345737, -2.284296, 0.7921569, 1, 0, 1,
-0.7936998, 0.1317381, -0.3754338, 0.7882353, 1, 0, 1,
-0.7878782, 0.428758, -0.5519167, 0.7803922, 1, 0, 1,
-0.7802932, 0.3482285, -1.029661, 0.7764706, 1, 0, 1,
-0.7789635, -0.4544951, -0.2190419, 0.7686275, 1, 0, 1,
-0.7761926, -0.3513199, -3.167018, 0.7647059, 1, 0, 1,
-0.7697635, 0.1643905, -0.9978397, 0.7568628, 1, 0, 1,
-0.7695004, 0.1948217, -2.873859, 0.7529412, 1, 0, 1,
-0.7645277, -2.098046, -4.198607, 0.7450981, 1, 0, 1,
-0.7639869, -0.1080793, -1.59221, 0.7411765, 1, 0, 1,
-0.7631287, 0.890026, 0.2349806, 0.7333333, 1, 0, 1,
-0.7492916, 1.761116, 0.293374, 0.7294118, 1, 0, 1,
-0.7474056, -0.461856, -1.166241, 0.7215686, 1, 0, 1,
-0.7452112, -0.2326628, -1.348718, 0.7176471, 1, 0, 1,
-0.739482, 0.6206907, 0.3740549, 0.7098039, 1, 0, 1,
-0.7392606, 0.4975621, 1.79521, 0.7058824, 1, 0, 1,
-0.7352434, -1.170393, -3.567894, 0.6980392, 1, 0, 1,
-0.7351592, -1.68584, -2.049191, 0.6901961, 1, 0, 1,
-0.7345322, -1.128396, -3.092775, 0.6862745, 1, 0, 1,
-0.7318622, 0.06480487, -2.244723, 0.6784314, 1, 0, 1,
-0.7286066, 0.2877609, -1.124154, 0.6745098, 1, 0, 1,
-0.7133592, 1.8662, -0.6011565, 0.6666667, 1, 0, 1,
-0.7040076, -0.8132741, -1.621025, 0.6627451, 1, 0, 1,
-0.7028399, -0.67807, -3.015872, 0.654902, 1, 0, 1,
-0.7028012, -0.4879298, -1.185048, 0.6509804, 1, 0, 1,
-0.7015844, 1.667501, 0.5339093, 0.6431373, 1, 0, 1,
-0.7003861, 1.297667, -0.5965099, 0.6392157, 1, 0, 1,
-0.6967391, 1.415711, 0.4167391, 0.6313726, 1, 0, 1,
-0.6941532, 0.07263888, -3.02699, 0.627451, 1, 0, 1,
-0.6933494, 0.8006285, -0.244719, 0.6196079, 1, 0, 1,
-0.689729, 0.6659349, 0.00891754, 0.6156863, 1, 0, 1,
-0.6879333, 0.4907714, -0.1825318, 0.6078432, 1, 0, 1,
-0.6871558, -0.1148291, -3.312917, 0.6039216, 1, 0, 1,
-0.6855946, 0.4281611, -1.96487, 0.5960785, 1, 0, 1,
-0.6839513, -0.5845063, -2.71663, 0.5882353, 1, 0, 1,
-0.680481, 0.328435, -0.7602566, 0.5843138, 1, 0, 1,
-0.6792714, -1.457712, -1.164794, 0.5764706, 1, 0, 1,
-0.6788932, 0.07479936, -0.425221, 0.572549, 1, 0, 1,
-0.6761066, 1.519929, -0.252762, 0.5647059, 1, 0, 1,
-0.6709337, -1.346417, -1.873441, 0.5607843, 1, 0, 1,
-0.663274, 1.315391, -1.788293, 0.5529412, 1, 0, 1,
-0.6622304, -0.5629857, -2.19436, 0.5490196, 1, 0, 1,
-0.6607147, -0.3105584, -2.815251, 0.5411765, 1, 0, 1,
-0.6606607, 0.2776848, -1.060487, 0.5372549, 1, 0, 1,
-0.6579691, 1.517935, 0.6974092, 0.5294118, 1, 0, 1,
-0.657495, -0.06191961, -1.743015, 0.5254902, 1, 0, 1,
-0.6574008, 1.092404, -1.983564, 0.5176471, 1, 0, 1,
-0.6537878, 1.183447, -1.826607, 0.5137255, 1, 0, 1,
-0.650575, 1.283978, -0.5977558, 0.5058824, 1, 0, 1,
-0.6484472, 1.427191, -1.574591, 0.5019608, 1, 0, 1,
-0.6472901, -1.36345, -1.722468, 0.4941176, 1, 0, 1,
-0.6467578, -0.8150737, -3.109897, 0.4862745, 1, 0, 1,
-0.636368, -0.2642036, -1.284491, 0.4823529, 1, 0, 1,
-0.6265567, -0.5823317, -3.365805, 0.4745098, 1, 0, 1,
-0.6189094, 0.07209174, -0.9011025, 0.4705882, 1, 0, 1,
-0.6180087, -0.2796535, -3.147463, 0.4627451, 1, 0, 1,
-0.6033255, -0.2285064, -1.183658, 0.4588235, 1, 0, 1,
-0.6018216, -0.3375732, 0.02363552, 0.4509804, 1, 0, 1,
-0.5977494, 2.175493, 0.5086398, 0.4470588, 1, 0, 1,
-0.5957581, -1.677663, -2.305165, 0.4392157, 1, 0, 1,
-0.5898823, 1.182444, -0.4557135, 0.4352941, 1, 0, 1,
-0.5891492, -1.03003, -3.093912, 0.427451, 1, 0, 1,
-0.5868923, -0.5966569, -4.801889, 0.4235294, 1, 0, 1,
-0.5841151, -1.059124, -2.859357, 0.4156863, 1, 0, 1,
-0.5826342, 0.5359631, -1.076567, 0.4117647, 1, 0, 1,
-0.5806692, -0.4008606, -2.902958, 0.4039216, 1, 0, 1,
-0.5784947, -0.1050693, -1.648541, 0.3960784, 1, 0, 1,
-0.5758405, -2.327894, -2.96771, 0.3921569, 1, 0, 1,
-0.574312, 1.187263, -1.11632, 0.3843137, 1, 0, 1,
-0.5729218, 0.03278843, -2.06928, 0.3803922, 1, 0, 1,
-0.5607139, 1.364678, 0.7563668, 0.372549, 1, 0, 1,
-0.5605016, 1.094009, 0.157658, 0.3686275, 1, 0, 1,
-0.5569748, -0.8613063, -2.649129, 0.3607843, 1, 0, 1,
-0.5516014, -0.2349968, -1.430834, 0.3568628, 1, 0, 1,
-0.5462018, 2.609565, 0.4711797, 0.3490196, 1, 0, 1,
-0.545123, 0.5602186, -0.4560408, 0.345098, 1, 0, 1,
-0.5436858, -0.28768, -1.667316, 0.3372549, 1, 0, 1,
-0.5413913, -0.02267641, -1.765303, 0.3333333, 1, 0, 1,
-0.5407835, -0.4546114, -3.364614, 0.3254902, 1, 0, 1,
-0.5234937, 1.443959, -0.7761414, 0.3215686, 1, 0, 1,
-0.5083219, 0.02544305, -1.746818, 0.3137255, 1, 0, 1,
-0.5076255, 1.928793, 2.207184, 0.3098039, 1, 0, 1,
-0.5073841, -0.9628559, -1.387656, 0.3019608, 1, 0, 1,
-0.498893, -0.4906293, -2.035422, 0.2941177, 1, 0, 1,
-0.4981883, -2.664479, -2.720986, 0.2901961, 1, 0, 1,
-0.498133, 1.099312, -0.3686253, 0.282353, 1, 0, 1,
-0.4956897, -1.077523, -1.278976, 0.2784314, 1, 0, 1,
-0.4904003, -0.30343, -1.794976, 0.2705882, 1, 0, 1,
-0.4839115, 1.835479, -2.472799, 0.2666667, 1, 0, 1,
-0.4798636, 0.5261142, -1.35877, 0.2588235, 1, 0, 1,
-0.4795323, -0.1769147, -2.328369, 0.254902, 1, 0, 1,
-0.4783983, 0.2192205, -0.9392697, 0.2470588, 1, 0, 1,
-0.4773888, -0.5845651, -2.534278, 0.2431373, 1, 0, 1,
-0.4749607, -1.546447, -2.816403, 0.2352941, 1, 0, 1,
-0.4749408, -0.9956068, -3.876413, 0.2313726, 1, 0, 1,
-0.4715808, -0.4429044, -3.288625, 0.2235294, 1, 0, 1,
-0.4712891, -0.8408054, -3.303707, 0.2196078, 1, 0, 1,
-0.4692836, -0.1371025, -1.618164, 0.2117647, 1, 0, 1,
-0.4670092, -0.7091573, -2.385949, 0.2078431, 1, 0, 1,
-0.4565878, -0.770545, -2.131503, 0.2, 1, 0, 1,
-0.4515727, -1.484234, -2.258847, 0.1921569, 1, 0, 1,
-0.4477188, 0.8561924, 1.029863, 0.1882353, 1, 0, 1,
-0.4464875, -0.8555489, -3.891706, 0.1803922, 1, 0, 1,
-0.4428042, -1.027254, -1.675969, 0.1764706, 1, 0, 1,
-0.430781, -0.495268, -2.850436, 0.1686275, 1, 0, 1,
-0.4284696, 0.7985166, -0.2471645, 0.1647059, 1, 0, 1,
-0.4273826, 0.03505451, -0.4081652, 0.1568628, 1, 0, 1,
-0.4257332, -0.2849447, -2.936746, 0.1529412, 1, 0, 1,
-0.415498, 0.2495646, -0.1653704, 0.145098, 1, 0, 1,
-0.4111849, 1.608338, 1.346525, 0.1411765, 1, 0, 1,
-0.4109834, 0.9197928, -2.331642, 0.1333333, 1, 0, 1,
-0.4040871, 0.8205062, -2.030059, 0.1294118, 1, 0, 1,
-0.401755, -0.06952897, -2.943474, 0.1215686, 1, 0, 1,
-0.4014612, -2.234738, -1.120801, 0.1176471, 1, 0, 1,
-0.3960835, -2.067715, -2.725896, 0.1098039, 1, 0, 1,
-0.3937746, -1.085166, -2.135107, 0.1058824, 1, 0, 1,
-0.3894687, 0.2908771, -0.8324955, 0.09803922, 1, 0, 1,
-0.3870361, 0.6634484, -1.288905, 0.09019608, 1, 0, 1,
-0.3843946, -0.7545618, -2.522395, 0.08627451, 1, 0, 1,
-0.383308, 1.761187, -1.352048, 0.07843138, 1, 0, 1,
-0.3802316, -0.109024, -1.465959, 0.07450981, 1, 0, 1,
-0.3799578, -1.696095, -3.479147, 0.06666667, 1, 0, 1,
-0.3797579, -1.120733, -4.916834, 0.0627451, 1, 0, 1,
-0.3797427, -0.3182458, -3.64178, 0.05490196, 1, 0, 1,
-0.3794469, 1.106806, 1.316638, 0.05098039, 1, 0, 1,
-0.3724315, -0.343915, -3.507207, 0.04313726, 1, 0, 1,
-0.3696393, 1.423412, -0.5663082, 0.03921569, 1, 0, 1,
-0.3650796, -0.6454064, -4.113041, 0.03137255, 1, 0, 1,
-0.3642285, 0.1202051, -1.959584, 0.02745098, 1, 0, 1,
-0.3629565, -0.9197492, -2.217075, 0.01960784, 1, 0, 1,
-0.3585564, 1.396153, 0.04477037, 0.01568628, 1, 0, 1,
-0.3556473, -0.6284352, -4.700581, 0.007843138, 1, 0, 1,
-0.3532211, 2.018867, -0.1821781, 0.003921569, 1, 0, 1,
-0.3529471, 0.4520179, -1.645678, 0, 1, 0.003921569, 1,
-0.3510369, 1.126093, -2.461337, 0, 1, 0.01176471, 1,
-0.3496857, -0.6829907, -3.006376, 0, 1, 0.01568628, 1,
-0.3479405, 0.2769544, -1.760767, 0, 1, 0.02352941, 1,
-0.3449082, 0.06614504, -1.599972, 0, 1, 0.02745098, 1,
-0.3442347, 0.2132007, -2.675977, 0, 1, 0.03529412, 1,
-0.3422116, -0.7286969, -3.190329, 0, 1, 0.03921569, 1,
-0.3422003, -0.1858586, -4.399549, 0, 1, 0.04705882, 1,
-0.3366581, -1.737973, -1.860049, 0, 1, 0.05098039, 1,
-0.3365465, 0.2757876, -2.142979, 0, 1, 0.05882353, 1,
-0.3359428, 0.7108924, 0.4579927, 0, 1, 0.0627451, 1,
-0.3348118, 0.2147006, -0.1377517, 0, 1, 0.07058824, 1,
-0.3346052, -0.002482596, -0.972729, 0, 1, 0.07450981, 1,
-0.331744, -1.097329, -1.77103, 0, 1, 0.08235294, 1,
-0.3291048, -1.66961, -3.250087, 0, 1, 0.08627451, 1,
-0.3284138, 0.2700332, -2.005451, 0, 1, 0.09411765, 1,
-0.3281707, 0.9349306, -0.1121459, 0, 1, 0.1019608, 1,
-0.3264883, -0.1615954, -2.805928, 0, 1, 0.1058824, 1,
-0.3197062, -0.4287467, -1.868922, 0, 1, 0.1137255, 1,
-0.3176996, 1.946323, 0.2914347, 0, 1, 0.1176471, 1,
-0.3168073, 0.6934961, -0.2683328, 0, 1, 0.1254902, 1,
-0.3153372, -0.3513099, -1.603564, 0, 1, 0.1294118, 1,
-0.3140936, -0.9008924, -2.187897, 0, 1, 0.1372549, 1,
-0.3086189, -1.107334, -3.48377, 0, 1, 0.1411765, 1,
-0.2985694, 2.034517, 0.1830318, 0, 1, 0.1490196, 1,
-0.2961987, -0.4046241, -2.933503, 0, 1, 0.1529412, 1,
-0.2958121, -2.461185, -3.494056, 0, 1, 0.1607843, 1,
-0.2956554, 0.8223167, -0.980848, 0, 1, 0.1647059, 1,
-0.2914966, -0.380098, -2.292916, 0, 1, 0.172549, 1,
-0.2838621, -0.3981942, -3.798732, 0, 1, 0.1764706, 1,
-0.2811675, -0.2928464, -2.446683, 0, 1, 0.1843137, 1,
-0.2776662, 0.9076456, -1.004134, 0, 1, 0.1882353, 1,
-0.2757852, -0.6810628, -2.255236, 0, 1, 0.1960784, 1,
-0.2699386, 0.9336102, -0.6313999, 0, 1, 0.2039216, 1,
-0.2686596, 1.774788, 0.5328893, 0, 1, 0.2078431, 1,
-0.2657425, 0.5592175, -1.270862, 0, 1, 0.2156863, 1,
-0.2655476, 0.5772256, -2.355652, 0, 1, 0.2196078, 1,
-0.2609363, -0.69186, -3.182195, 0, 1, 0.227451, 1,
-0.2560651, 1.413499, 0.05237617, 0, 1, 0.2313726, 1,
-0.2559881, -0.7377692, -3.943175, 0, 1, 0.2392157, 1,
-0.2554924, -0.3706836, -4.178992, 0, 1, 0.2431373, 1,
-0.2530535, -0.6447114, -3.788129, 0, 1, 0.2509804, 1,
-0.2501851, -1.4682, -3.153225, 0, 1, 0.254902, 1,
-0.2455493, 0.8166266, -1.459425, 0, 1, 0.2627451, 1,
-0.2451949, -0.9306331, -2.072164, 0, 1, 0.2666667, 1,
-0.2439819, 0.2536856, 0.9747036, 0, 1, 0.2745098, 1,
-0.2376503, 1.304139, 0.172033, 0, 1, 0.2784314, 1,
-0.2350556, 0.5413514, -0.4086548, 0, 1, 0.2862745, 1,
-0.2194965, -1.421999, -2.844003, 0, 1, 0.2901961, 1,
-0.2181339, -0.2970125, -4.007979, 0, 1, 0.2980392, 1,
-0.2177162, 0.3419976, 0.907671, 0, 1, 0.3058824, 1,
-0.2142443, 2.487208, 2.414217, 0, 1, 0.3098039, 1,
-0.2094285, 0.7274361, -0.2241527, 0, 1, 0.3176471, 1,
-0.2077701, -0.2682572, -2.429248, 0, 1, 0.3215686, 1,
-0.1990724, -0.6083741, -3.123765, 0, 1, 0.3294118, 1,
-0.1962971, -0.4177524, -2.810376, 0, 1, 0.3333333, 1,
-0.1922173, 1.184581, -1.369246, 0, 1, 0.3411765, 1,
-0.1920554, -0.8743707, -4.946073, 0, 1, 0.345098, 1,
-0.1851803, 0.5002435, -0.1727534, 0, 1, 0.3529412, 1,
-0.1820358, -0.001022787, -1.42093, 0, 1, 0.3568628, 1,
-0.1803989, 0.535623, 0.3816465, 0, 1, 0.3647059, 1,
-0.1800189, 1.294273, 1.724888, 0, 1, 0.3686275, 1,
-0.1769066, 1.963919, -1.375124, 0, 1, 0.3764706, 1,
-0.1681449, 0.2515639, 0.7869148, 0, 1, 0.3803922, 1,
-0.1681399, -0.4565006, -3.698565, 0, 1, 0.3882353, 1,
-0.1664004, 1.341668, -0.9683743, 0, 1, 0.3921569, 1,
-0.1582963, 0.6885766, 0.4354375, 0, 1, 0.4, 1,
-0.1558624, 0.4414762, -0.8394588, 0, 1, 0.4078431, 1,
-0.1516589, 0.3680659, 0.7201118, 0, 1, 0.4117647, 1,
-0.1509004, 1.12894, 0.5463679, 0, 1, 0.4196078, 1,
-0.1473075, -0.7070449, -3.253384, 0, 1, 0.4235294, 1,
-0.1464005, 0.6392262, 0.5341211, 0, 1, 0.4313726, 1,
-0.1460204, 0.5622505, -0.9794727, 0, 1, 0.4352941, 1,
-0.1389556, -0.5496587, -4.600415, 0, 1, 0.4431373, 1,
-0.1370636, 0.788973, 0.96623, 0, 1, 0.4470588, 1,
-0.1364038, -0.4744055, -5.464784, 0, 1, 0.454902, 1,
-0.1320051, 0.5142953, -0.4441959, 0, 1, 0.4588235, 1,
-0.1316339, -0.4308173, -2.350574, 0, 1, 0.4666667, 1,
-0.1312199, 0.5230683, 0.06861053, 0, 1, 0.4705882, 1,
-0.1299037, -0.4610527, -4.360816, 0, 1, 0.4784314, 1,
-0.1280068, 0.6509237, -0.1506198, 0, 1, 0.4823529, 1,
-0.1225739, -0.842982, -2.761431, 0, 1, 0.4901961, 1,
-0.1218914, 0.388832, 0.5509714, 0, 1, 0.4941176, 1,
-0.1218133, -0.4435664, -3.168816, 0, 1, 0.5019608, 1,
-0.1205651, 0.09544601, 0.1106638, 0, 1, 0.509804, 1,
-0.1197059, -1.00628, -3.163282, 0, 1, 0.5137255, 1,
-0.1167139, -0.1849726, -2.176369, 0, 1, 0.5215687, 1,
-0.114978, -2.358298, -3.798342, 0, 1, 0.5254902, 1,
-0.1129245, -0.2365762, -3.607396, 0, 1, 0.5333334, 1,
-0.1114896, -1.470754, -3.027855, 0, 1, 0.5372549, 1,
-0.1084154, -0.321257, -2.546657, 0, 1, 0.5450981, 1,
-0.1039189, -1.831861, -2.511858, 0, 1, 0.5490196, 1,
-0.1028742, 0.6081757, 0.05711582, 0, 1, 0.5568628, 1,
-0.1027769, 1.588476, 0.4116137, 0, 1, 0.5607843, 1,
-0.101324, 0.08741695, -0.7117509, 0, 1, 0.5686275, 1,
-0.09918825, 0.3179599, 0.2321608, 0, 1, 0.572549, 1,
-0.09821946, -0.7697232, -2.345114, 0, 1, 0.5803922, 1,
-0.0960668, -0.08154691, -2.435648, 0, 1, 0.5843138, 1,
-0.09542045, -2.273256, -2.475587, 0, 1, 0.5921569, 1,
-0.09519984, -0.1542834, -2.734889, 0, 1, 0.5960785, 1,
-0.0944437, 2.252124, -0.293049, 0, 1, 0.6039216, 1,
-0.08365262, -0.2358363, -4.265205, 0, 1, 0.6117647, 1,
-0.08343513, 0.5450698, -0.448537, 0, 1, 0.6156863, 1,
-0.08068784, 0.1569805, -1.9161, 0, 1, 0.6235294, 1,
-0.08051546, -0.5748021, -3.301893, 0, 1, 0.627451, 1,
-0.07950132, -2.998693, -3.522791, 0, 1, 0.6352941, 1,
-0.07733392, 0.2972948, 0.6926174, 0, 1, 0.6392157, 1,
-0.07585062, 0.801532, 0.1244054, 0, 1, 0.6470588, 1,
-0.0723166, 0.5132549, 0.8750293, 0, 1, 0.6509804, 1,
-0.07226709, 0.4249969, 0.3405114, 0, 1, 0.6588235, 1,
-0.07153159, 1.28037, -1.035929, 0, 1, 0.6627451, 1,
-0.07060226, -0.1091801, -1.977536, 0, 1, 0.6705883, 1,
-0.06888206, -0.1514974, -2.814566, 0, 1, 0.6745098, 1,
-0.06868552, -0.106838, -4.89494, 0, 1, 0.682353, 1,
-0.06459805, 0.102286, 0.4396745, 0, 1, 0.6862745, 1,
-0.0640392, -1.284564, -4.276066, 0, 1, 0.6941177, 1,
-0.06280598, -0.294974, -1.21354, 0, 1, 0.7019608, 1,
-0.05941471, 0.8675863, 0.06844108, 0, 1, 0.7058824, 1,
-0.05682679, 0.5957547, 0.6329077, 0, 1, 0.7137255, 1,
-0.0541674, -0.944813, -3.025271, 0, 1, 0.7176471, 1,
-0.05366615, -1.172521, -3.016993, 0, 1, 0.7254902, 1,
-0.04526426, -0.150457, -1.169632, 0, 1, 0.7294118, 1,
-0.04310413, -0.01514238, -1.259661, 0, 1, 0.7372549, 1,
-0.04259024, -1.209568, -1.92604, 0, 1, 0.7411765, 1,
-0.03499533, -0.8384255, -2.382514, 0, 1, 0.7490196, 1,
-0.03478504, 0.3492449, 0.543714, 0, 1, 0.7529412, 1,
-0.03349626, 0.4011858, -0.4087811, 0, 1, 0.7607843, 1,
-0.03138322, -0.6203222, -0.8030471, 0, 1, 0.7647059, 1,
-0.02964371, 0.002483079, 0.4460656, 0, 1, 0.772549, 1,
-0.02839405, -0.5647263, -2.627682, 0, 1, 0.7764706, 1,
-0.02830628, 0.562531, 0.3743308, 0, 1, 0.7843137, 1,
-0.02805967, -1.923171, -1.218869, 0, 1, 0.7882353, 1,
-0.02587835, -1.300464, -2.732571, 0, 1, 0.7960784, 1,
-0.02219019, -0.3493725, -2.878481, 0, 1, 0.8039216, 1,
-0.02087459, -0.7549031, -2.77895, 0, 1, 0.8078431, 1,
-0.0176582, 1.730278, -0.09389636, 0, 1, 0.8156863, 1,
-0.0154232, 1.445038, -1.678385, 0, 1, 0.8196079, 1,
-0.01295748, 0.1759019, -0.6410913, 0, 1, 0.827451, 1,
-0.007591201, 0.2560845, -0.9851998, 0, 1, 0.8313726, 1,
-0.007329206, 0.1956104, -0.2450438, 0, 1, 0.8392157, 1,
-0.006746324, 0.8983504, 0.6516147, 0, 1, 0.8431373, 1,
-0.005728814, 1.660154, -0.6717536, 0, 1, 0.8509804, 1,
-0.004062342, 0.2417765, -0.8361341, 0, 1, 0.854902, 1,
-0.002267963, -0.6224527, -2.991858, 0, 1, 0.8627451, 1,
-0.00024378, 0.8814023, 0.2132252, 0, 1, 0.8666667, 1,
0.001558141, 0.2486334, -0.8237236, 0, 1, 0.8745098, 1,
0.003083369, -0.4735048, 3.408409, 0, 1, 0.8784314, 1,
0.003137871, 0.5054523, 0.2640764, 0, 1, 0.8862745, 1,
0.003783696, -0.6736293, 4.826429, 0, 1, 0.8901961, 1,
0.01223316, -1.163839, 3.761613, 0, 1, 0.8980392, 1,
0.01265132, 0.2297881, -0.4453983, 0, 1, 0.9058824, 1,
0.01714454, -1.583657, 4.4245, 0, 1, 0.9098039, 1,
0.0260769, 0.2282377, 1.661586, 0, 1, 0.9176471, 1,
0.02851668, 0.07321764, 2.560359, 0, 1, 0.9215686, 1,
0.03006057, -0.569152, 3.042152, 0, 1, 0.9294118, 1,
0.03238956, -0.8394586, 2.562912, 0, 1, 0.9333333, 1,
0.03353695, 0.02821388, 1.562914, 0, 1, 0.9411765, 1,
0.03480808, 0.4362468, 0.9522186, 0, 1, 0.945098, 1,
0.03496267, 0.2289376, 0.5658875, 0, 1, 0.9529412, 1,
0.03712374, 0.02570028, 1.876162, 0, 1, 0.9568627, 1,
0.03834392, 0.882835, 0.466519, 0, 1, 0.9647059, 1,
0.04181259, 0.1633435, 1.243461, 0, 1, 0.9686275, 1,
0.04308445, -0.7320294, 2.969825, 0, 1, 0.9764706, 1,
0.04439804, -0.09054339, 2.304807, 0, 1, 0.9803922, 1,
0.046051, 1.58795, 0.4676089, 0, 1, 0.9882353, 1,
0.04626637, -1.377017, 3.768349, 0, 1, 0.9921569, 1,
0.05174934, 1.766168, 0.9434548, 0, 1, 1, 1,
0.05244527, 1.031101, -1.39678, 0, 0.9921569, 1, 1,
0.05367113, 0.5753128, 1.42526, 0, 0.9882353, 1, 1,
0.05779092, 0.8722973, 1.692075, 0, 0.9803922, 1, 1,
0.05808891, -0.8928978, 2.111491, 0, 0.9764706, 1, 1,
0.05876525, -0.41503, 2.613469, 0, 0.9686275, 1, 1,
0.05887138, -0.7312338, 3.177697, 0, 0.9647059, 1, 1,
0.06179344, 0.8465934, 0.6113673, 0, 0.9568627, 1, 1,
0.06225025, -0.232638, 3.541016, 0, 0.9529412, 1, 1,
0.06557172, -2.000959, 3.69044, 0, 0.945098, 1, 1,
0.06986155, 0.08838376, 2.519496, 0, 0.9411765, 1, 1,
0.07081309, 0.9380031, 0.4460393, 0, 0.9333333, 1, 1,
0.07284969, 1.370795, -0.1740307, 0, 0.9294118, 1, 1,
0.07310738, -0.07178754, 4.380704, 0, 0.9215686, 1, 1,
0.07854506, -0.6561676, 2.34085, 0, 0.9176471, 1, 1,
0.07903636, 0.5653654, 0.9067291, 0, 0.9098039, 1, 1,
0.08448253, 0.4838223, 0.7122387, 0, 0.9058824, 1, 1,
0.08486652, 1.182896, -0.5469823, 0, 0.8980392, 1, 1,
0.08513641, -0.1554421, 3.677913, 0, 0.8901961, 1, 1,
0.08581287, -0.3092415, 2.975878, 0, 0.8862745, 1, 1,
0.08666744, -0.869279, 2.548863, 0, 0.8784314, 1, 1,
0.08854689, 0.1486758, -0.2934326, 0, 0.8745098, 1, 1,
0.08918368, -1.127888, 2.895885, 0, 0.8666667, 1, 1,
0.09276085, 1.112618, -1.611099, 0, 0.8627451, 1, 1,
0.09667357, 0.553074, 1.161089, 0, 0.854902, 1, 1,
0.09842703, -0.448065, 2.829756, 0, 0.8509804, 1, 1,
0.1000805, -1.451137, 2.682222, 0, 0.8431373, 1, 1,
0.1049256, 0.4275279, -0.6609346, 0, 0.8392157, 1, 1,
0.109621, 0.8849091, 0.8788741, 0, 0.8313726, 1, 1,
0.1119824, 2.171184, 0.7486965, 0, 0.827451, 1, 1,
0.1245652, 0.8138229, -0.08789767, 0, 0.8196079, 1, 1,
0.1298317, -1.600635, 2.8462, 0, 0.8156863, 1, 1,
0.1299768, -0.4204034, 4.323567, 0, 0.8078431, 1, 1,
0.1308469, -0.1929556, 1.688881, 0, 0.8039216, 1, 1,
0.131986, 0.8802104, -0.07693752, 0, 0.7960784, 1, 1,
0.1328923, 1.621844, -0.1651074, 0, 0.7882353, 1, 1,
0.1351756, -0.004402163, 1.028273, 0, 0.7843137, 1, 1,
0.138178, -1.571098, 2.42747, 0, 0.7764706, 1, 1,
0.1432605, -0.604223, 3.373548, 0, 0.772549, 1, 1,
0.1438835, 0.870868, -0.1830796, 0, 0.7647059, 1, 1,
0.1440169, -0.8183337, 3.638708, 0, 0.7607843, 1, 1,
0.144948, 0.17146, -0.254465, 0, 0.7529412, 1, 1,
0.1459017, 0.1399204, -0.8025405, 0, 0.7490196, 1, 1,
0.1469893, -1.066116, 2.149355, 0, 0.7411765, 1, 1,
0.1480668, 0.6565078, 0.6431381, 0, 0.7372549, 1, 1,
0.1483502, 3.327243, 1.000748, 0, 0.7294118, 1, 1,
0.1547576, 0.8186421, 0.5207328, 0, 0.7254902, 1, 1,
0.1558126, 1.189673, -0.6565398, 0, 0.7176471, 1, 1,
0.1565995, -0.1283811, 0.3766632, 0, 0.7137255, 1, 1,
0.1566896, -1.818189, 3.071517, 0, 0.7058824, 1, 1,
0.1688277, -0.7250468, 0.5421993, 0, 0.6980392, 1, 1,
0.1771947, 1.761868, -0.3704527, 0, 0.6941177, 1, 1,
0.1780082, 0.2124184, 0.8483815, 0, 0.6862745, 1, 1,
0.179736, 0.2718709, 2.084497, 0, 0.682353, 1, 1,
0.1858988, 1.085211, -0.3441422, 0, 0.6745098, 1, 1,
0.1903488, 1.399588, -1.553543, 0, 0.6705883, 1, 1,
0.1906912, 0.2241382, -0.09643675, 0, 0.6627451, 1, 1,
0.1955938, 1.183988, -0.02449507, 0, 0.6588235, 1, 1,
0.1967185, -0.3055282, 1.896599, 0, 0.6509804, 1, 1,
0.2019798, -1.121531, 1.195334, 0, 0.6470588, 1, 1,
0.2035089, 1.171355, 0.4751111, 0, 0.6392157, 1, 1,
0.2039294, 0.8969959, 0.05872037, 0, 0.6352941, 1, 1,
0.2049872, -2.059498, 2.21574, 0, 0.627451, 1, 1,
0.2088207, 0.1796199, 1.574178, 0, 0.6235294, 1, 1,
0.2176802, -0.1702122, 1.230839, 0, 0.6156863, 1, 1,
0.2191844, 0.7831117, -0.2517802, 0, 0.6117647, 1, 1,
0.2198541, 0.1649763, 1.055476, 0, 0.6039216, 1, 1,
0.2209127, 0.3431133, -0.6075705, 0, 0.5960785, 1, 1,
0.2221015, 0.6684002, 0.691943, 0, 0.5921569, 1, 1,
0.2257941, 1.052391, 1.517425, 0, 0.5843138, 1, 1,
0.2265222, -0.1032216, 2.659151, 0, 0.5803922, 1, 1,
0.2275307, -0.1308821, 1.025419, 0, 0.572549, 1, 1,
0.2281746, 1.73637, 1.035109, 0, 0.5686275, 1, 1,
0.2323317, 0.8784305, -1.421832, 0, 0.5607843, 1, 1,
0.2362128, -1.299853, 2.970204, 0, 0.5568628, 1, 1,
0.2366309, -1.030913, 1.147318, 0, 0.5490196, 1, 1,
0.237669, 0.2204663, -0.0516355, 0, 0.5450981, 1, 1,
0.2401594, 1.292466, -0.4408068, 0, 0.5372549, 1, 1,
0.2440197, -0.581891, 1.778782, 0, 0.5333334, 1, 1,
0.244268, -1.043319, 4.771441, 0, 0.5254902, 1, 1,
0.2453264, -0.195552, 2.264049, 0, 0.5215687, 1, 1,
0.2468906, -1.35698, 3.374009, 0, 0.5137255, 1, 1,
0.2484874, -0.8052549, 2.602122, 0, 0.509804, 1, 1,
0.2486964, -0.02854659, 2.331558, 0, 0.5019608, 1, 1,
0.2497143, 0.7364472, 0.8901842, 0, 0.4941176, 1, 1,
0.2582285, 0.1724448, 1.621723, 0, 0.4901961, 1, 1,
0.2592279, -0.8224437, 3.99244, 0, 0.4823529, 1, 1,
0.2639731, 1.084613, -0.3871647, 0, 0.4784314, 1, 1,
0.2654294, -0.4893477, 3.084076, 0, 0.4705882, 1, 1,
0.2670887, 0.365563, 2.850927, 0, 0.4666667, 1, 1,
0.2689407, -0.06595756, 0.6285069, 0, 0.4588235, 1, 1,
0.2753193, 1.345152, 1.15909, 0, 0.454902, 1, 1,
0.2777222, -0.9319152, 2.331525, 0, 0.4470588, 1, 1,
0.2782626, 0.1782385, 1.476458, 0, 0.4431373, 1, 1,
0.2794938, -0.5932723, 2.473682, 0, 0.4352941, 1, 1,
0.2844205, -0.05230987, 2.135714, 0, 0.4313726, 1, 1,
0.2845095, 0.6529368, -0.1927949, 0, 0.4235294, 1, 1,
0.2848271, 1.000924, -0.6116322, 0, 0.4196078, 1, 1,
0.2854338, 0.1708717, 0.688705, 0, 0.4117647, 1, 1,
0.2869778, -0.1589435, 2.255834, 0, 0.4078431, 1, 1,
0.291671, -0.5673766, 3.90048, 0, 0.4, 1, 1,
0.2922236, 1.167314, -0.3849736, 0, 0.3921569, 1, 1,
0.2923499, 0.01691231, 3.982368, 0, 0.3882353, 1, 1,
0.2937187, 2.197833, -1.102034, 0, 0.3803922, 1, 1,
0.2940241, -0.4212954, 2.340042, 0, 0.3764706, 1, 1,
0.2955035, -0.0343598, 2.560636, 0, 0.3686275, 1, 1,
0.3021827, 0.2429542, 1.145981, 0, 0.3647059, 1, 1,
0.3039742, -2.292583, 2.684275, 0, 0.3568628, 1, 1,
0.3147406, 0.2902823, -0.1952981, 0, 0.3529412, 1, 1,
0.3168985, 0.1868189, -1.120095, 0, 0.345098, 1, 1,
0.317054, 0.1934504, 1.290529, 0, 0.3411765, 1, 1,
0.3171901, 0.3554971, -0.6558611, 0, 0.3333333, 1, 1,
0.318173, 0.4056101, 0.7119438, 0, 0.3294118, 1, 1,
0.3184721, 0.3817582, 1.331594, 0, 0.3215686, 1, 1,
0.3186388, -0.3685246, 2.622668, 0, 0.3176471, 1, 1,
0.3206027, -1.326597, 3.235682, 0, 0.3098039, 1, 1,
0.3223648, -0.5993714, 1.962526, 0, 0.3058824, 1, 1,
0.3310041, 0.1273574, 1.622908, 0, 0.2980392, 1, 1,
0.3318267, 1.607097, 0.3476617, 0, 0.2901961, 1, 1,
0.3339822, -2.969997, 3.598706, 0, 0.2862745, 1, 1,
0.3349527, -1.085203, 4.234028, 0, 0.2784314, 1, 1,
0.3363375, -0.3011057, 3.367476, 0, 0.2745098, 1, 1,
0.3398469, -0.9855149, 2.216105, 0, 0.2666667, 1, 1,
0.3413492, 1.360427, -0.2653656, 0, 0.2627451, 1, 1,
0.3487988, 1.370349, -0.09300942, 0, 0.254902, 1, 1,
0.3508835, -0.1556362, 2.437179, 0, 0.2509804, 1, 1,
0.3515426, -2.487311, 2.838609, 0, 0.2431373, 1, 1,
0.3535311, 1.632899, 0.03793224, 0, 0.2392157, 1, 1,
0.3548682, -1.654052, 2.821992, 0, 0.2313726, 1, 1,
0.3551466, 0.6196871, 0.6121825, 0, 0.227451, 1, 1,
0.3562702, 0.8407647, 0.9562363, 0, 0.2196078, 1, 1,
0.3565256, 0.4626439, 0.2589951, 0, 0.2156863, 1, 1,
0.3581119, 1.439488, 0.2040965, 0, 0.2078431, 1, 1,
0.3634994, -0.5343673, 4.268584, 0, 0.2039216, 1, 1,
0.3648601, 1.195547, -0.155423, 0, 0.1960784, 1, 1,
0.3707188, 0.3432834, 0.8580523, 0, 0.1882353, 1, 1,
0.372329, -0.9108225, 2.649811, 0, 0.1843137, 1, 1,
0.3758855, -1.133231, 0.8455015, 0, 0.1764706, 1, 1,
0.3809066, -0.688189, 2.624856, 0, 0.172549, 1, 1,
0.3835206, -0.09877383, 1.123765, 0, 0.1647059, 1, 1,
0.3867208, -0.3987805, 1.856225, 0, 0.1607843, 1, 1,
0.389921, -0.4947176, 0.8876381, 0, 0.1529412, 1, 1,
0.3900061, 2.423219, -1.302402, 0, 0.1490196, 1, 1,
0.3916838, 0.03326795, 0.7815412, 0, 0.1411765, 1, 1,
0.3919532, 1.790061, 0.4164852, 0, 0.1372549, 1, 1,
0.3927228, 0.2000934, 2.136391, 0, 0.1294118, 1, 1,
0.3969135, 0.4301737, 3.530795, 0, 0.1254902, 1, 1,
0.3972684, -1.204148, 2.532306, 0, 0.1176471, 1, 1,
0.3990482, 0.7617502, 0.05195132, 0, 0.1137255, 1, 1,
0.4011049, 0.03958192, 2.824152, 0, 0.1058824, 1, 1,
0.4038509, 0.9746568, -0.1289666, 0, 0.09803922, 1, 1,
0.4077742, 0.08920189, 0.9488594, 0, 0.09411765, 1, 1,
0.4090734, 0.1228142, 2.214855, 0, 0.08627451, 1, 1,
0.4221037, 1.855336, 0.6597608, 0, 0.08235294, 1, 1,
0.4238734, -0.4186538, 2.724904, 0, 0.07450981, 1, 1,
0.4241104, -0.6150947, 3.479252, 0, 0.07058824, 1, 1,
0.424623, 0.3363462, 1.398133, 0, 0.0627451, 1, 1,
0.4295595, -0.4900658, 1.817869, 0, 0.05882353, 1, 1,
0.4369172, 0.4118282, 0.4730102, 0, 0.05098039, 1, 1,
0.4370481, 1.070471, -0.8865939, 0, 0.04705882, 1, 1,
0.4383818, 0.5736132, -0.7621986, 0, 0.03921569, 1, 1,
0.4398593, -0.2858619, 2.466156, 0, 0.03529412, 1, 1,
0.4423109, 0.63725, 2.49718, 0, 0.02745098, 1, 1,
0.4428048, 0.5399103, 0.05661765, 0, 0.02352941, 1, 1,
0.4449612, -0.4896685, 3.472874, 0, 0.01568628, 1, 1,
0.4451044, -0.7942836, 3.401832, 0, 0.01176471, 1, 1,
0.4631564, 1.151273, 2.717915, 0, 0.003921569, 1, 1,
0.4640654, 0.1231314, 1.259157, 0.003921569, 0, 1, 1,
0.4641307, -1.340004, 2.332657, 0.007843138, 0, 1, 1,
0.4648671, -0.8904719, 1.276629, 0.01568628, 0, 1, 1,
0.4758112, 0.2813081, 0.881478, 0.01960784, 0, 1, 1,
0.4760621, 0.3677564, 2.572945, 0.02745098, 0, 1, 1,
0.4778586, -0.3035438, 2.185367, 0.03137255, 0, 1, 1,
0.4786127, 0.3889075, 1.667443, 0.03921569, 0, 1, 1,
0.4859841, 1.004905, 1.304051, 0.04313726, 0, 1, 1,
0.4976274, 0.4361863, 0.6406679, 0.05098039, 0, 1, 1,
0.5021184, -1.1798, 2.412041, 0.05490196, 0, 1, 1,
0.5039535, -0.9472947, 1.990876, 0.0627451, 0, 1, 1,
0.5046958, -0.171189, 3.249194, 0.06666667, 0, 1, 1,
0.5058004, -0.1550308, 0.8258455, 0.07450981, 0, 1, 1,
0.5125306, -0.2630519, 3.476894, 0.07843138, 0, 1, 1,
0.5204462, 0.5362603, -1.966028, 0.08627451, 0, 1, 1,
0.5205815, 0.330077, 1.06952, 0.09019608, 0, 1, 1,
0.524129, 0.8291794, 1.993579, 0.09803922, 0, 1, 1,
0.5244794, -0.9911624, 4.401244, 0.1058824, 0, 1, 1,
0.529762, -0.1940968, 3.731095, 0.1098039, 0, 1, 1,
0.5304679, 0.9307315, 0.5492371, 0.1176471, 0, 1, 1,
0.5337886, -0.5045901, 2.741813, 0.1215686, 0, 1, 1,
0.5343382, -0.01044212, 2.708802, 0.1294118, 0, 1, 1,
0.5359523, 0.7872283, 0.9060358, 0.1333333, 0, 1, 1,
0.5395692, -0.2249527, 1.253937, 0.1411765, 0, 1, 1,
0.5421659, 0.2271315, 1.75268, 0.145098, 0, 1, 1,
0.5423576, -0.7820331, 3.871163, 0.1529412, 0, 1, 1,
0.5425279, -1.219822, 1.059979, 0.1568628, 0, 1, 1,
0.5426037, 1.594681, 2.385102, 0.1647059, 0, 1, 1,
0.5438042, -1.035482, 3.321341, 0.1686275, 0, 1, 1,
0.5446644, 0.008658146, 1.195406, 0.1764706, 0, 1, 1,
0.5467542, 0.206074, 1.683337, 0.1803922, 0, 1, 1,
0.5472261, -1.665896, 2.301997, 0.1882353, 0, 1, 1,
0.5514295, 1.327523, 0.6835291, 0.1921569, 0, 1, 1,
0.5519043, 0.1303926, 1.12751, 0.2, 0, 1, 1,
0.5525469, -1.037956, 3.077709, 0.2078431, 0, 1, 1,
0.5547013, -0.8060308, 1.263089, 0.2117647, 0, 1, 1,
0.5624703, 0.02836059, 2.691516, 0.2196078, 0, 1, 1,
0.5627123, 0.2842242, 3.353442, 0.2235294, 0, 1, 1,
0.5627753, -1.432571, 3.0181, 0.2313726, 0, 1, 1,
0.5718425, 0.537829, -0.288176, 0.2352941, 0, 1, 1,
0.5749214, 1.118614, 2.477159, 0.2431373, 0, 1, 1,
0.5761061, 0.244957, 1.714418, 0.2470588, 0, 1, 1,
0.5786731, -0.9637834, 1.38712, 0.254902, 0, 1, 1,
0.5824947, 0.2531444, 0.5359859, 0.2588235, 0, 1, 1,
0.5840595, -0.4933656, 1.49042, 0.2666667, 0, 1, 1,
0.5845201, -1.302579, 3.609497, 0.2705882, 0, 1, 1,
0.5847287, 1.054242, -0.375831, 0.2784314, 0, 1, 1,
0.5864262, -0.4429354, 3.235635, 0.282353, 0, 1, 1,
0.5874557, -1.17567, 3.663396, 0.2901961, 0, 1, 1,
0.5889325, -1.385293, 4.013019, 0.2941177, 0, 1, 1,
0.5896919, 1.779544, 0.6640478, 0.3019608, 0, 1, 1,
0.5899869, 0.2547731, 0.8683352, 0.3098039, 0, 1, 1,
0.5932888, 0.1129073, 1.144169, 0.3137255, 0, 1, 1,
0.5976925, 0.1105537, 0.8274545, 0.3215686, 0, 1, 1,
0.6004189, -0.2711478, 2.316581, 0.3254902, 0, 1, 1,
0.6014816, 1.050904, -0.429775, 0.3333333, 0, 1, 1,
0.6015663, -0.8335562, 3.187762, 0.3372549, 0, 1, 1,
0.6031799, -0.02639775, 2.127555, 0.345098, 0, 1, 1,
0.6038904, 0.6022609, 0.7780566, 0.3490196, 0, 1, 1,
0.6082122, -1.272035, 4.141972, 0.3568628, 0, 1, 1,
0.609412, 0.8143468, 1.714239, 0.3607843, 0, 1, 1,
0.6104767, -0.7766744, 2.677389, 0.3686275, 0, 1, 1,
0.6107504, 1.350028, 0.1623709, 0.372549, 0, 1, 1,
0.6164117, -0.1878369, 3.824149, 0.3803922, 0, 1, 1,
0.6193147, 1.649536, -1.189426, 0.3843137, 0, 1, 1,
0.6224381, -1.066454, 3.770446, 0.3921569, 0, 1, 1,
0.6242727, 0.7959037, 0.8116995, 0.3960784, 0, 1, 1,
0.6316524, -1.034722, 3.62778, 0.4039216, 0, 1, 1,
0.6373181, -0.4539181, 1.968966, 0.4117647, 0, 1, 1,
0.6373968, 0.1352138, 0.8334891, 0.4156863, 0, 1, 1,
0.6394797, -2.195171, 2.722419, 0.4235294, 0, 1, 1,
0.642534, 0.04734669, 1.212178, 0.427451, 0, 1, 1,
0.6579957, 0.2628753, -0.2931781, 0.4352941, 0, 1, 1,
0.6679841, -0.6370682, -0.2088419, 0.4392157, 0, 1, 1,
0.6683816, -0.4453575, 3.218343, 0.4470588, 0, 1, 1,
0.6700541, -0.7309023, 2.970217, 0.4509804, 0, 1, 1,
0.6709144, 1.539571, -0.1573037, 0.4588235, 0, 1, 1,
0.6716259, 0.367931, 1.473414, 0.4627451, 0, 1, 1,
0.6762735, 0.4083288, 3.345849, 0.4705882, 0, 1, 1,
0.677086, 0.3208889, 1.262825, 0.4745098, 0, 1, 1,
0.6776374, -1.276942, 2.24352, 0.4823529, 0, 1, 1,
0.6804911, 0.9044493, -0.1724771, 0.4862745, 0, 1, 1,
0.7015893, 1.104978, 1.012056, 0.4941176, 0, 1, 1,
0.7026821, -0.04058228, 1.752135, 0.5019608, 0, 1, 1,
0.7029886, -0.06505436, 2.184896, 0.5058824, 0, 1, 1,
0.7092006, 1.422187, 1.107862, 0.5137255, 0, 1, 1,
0.7110309, -0.6997096, 2.436899, 0.5176471, 0, 1, 1,
0.7118439, 0.6881568, 0.8513285, 0.5254902, 0, 1, 1,
0.7159478, -0.741459, 2.138534, 0.5294118, 0, 1, 1,
0.717038, 0.8899542, 1.569666, 0.5372549, 0, 1, 1,
0.7175367, -0.7829142, 1.629422, 0.5411765, 0, 1, 1,
0.7175637, -0.232371, 0.9372896, 0.5490196, 0, 1, 1,
0.7206698, -0.6588567, -0.2768695, 0.5529412, 0, 1, 1,
0.7217811, -1.772725, 1.543396, 0.5607843, 0, 1, 1,
0.7349067, 0.4362645, 1.439077, 0.5647059, 0, 1, 1,
0.7372279, 1.057398, 3.540622, 0.572549, 0, 1, 1,
0.7412829, 1.299646, 1.325381, 0.5764706, 0, 1, 1,
0.7535957, -0.5989384, 2.050033, 0.5843138, 0, 1, 1,
0.7555516, -1.71735, 3.970996, 0.5882353, 0, 1, 1,
0.7560802, 0.068322, 1.893209, 0.5960785, 0, 1, 1,
0.7636881, 0.2497037, 1.868872, 0.6039216, 0, 1, 1,
0.7670717, 0.1184741, 0.5111472, 0.6078432, 0, 1, 1,
0.7719992, -0.721485, 2.355356, 0.6156863, 0, 1, 1,
0.77212, -0.8518812, 0.8338714, 0.6196079, 0, 1, 1,
0.772458, -1.027649, 4.922223, 0.627451, 0, 1, 1,
0.7748127, -0.3418035, 2.353502, 0.6313726, 0, 1, 1,
0.7775114, 1.471833, 1.627338, 0.6392157, 0, 1, 1,
0.7862722, 0.8097669, -0.1225772, 0.6431373, 0, 1, 1,
0.7926324, 0.2291657, 3.154768, 0.6509804, 0, 1, 1,
0.7947793, 1.224194, 0.6328726, 0.654902, 0, 1, 1,
0.7954029, 0.2750843, -0.3131829, 0.6627451, 0, 1, 1,
0.7954411, -0.9377879, 2.349902, 0.6666667, 0, 1, 1,
0.8043373, -0.1894092, 3.396842, 0.6745098, 0, 1, 1,
0.8046743, 0.3111576, 2.728624, 0.6784314, 0, 1, 1,
0.809529, 0.5503236, 1.364429, 0.6862745, 0, 1, 1,
0.8096222, 0.5423878, 1.237072, 0.6901961, 0, 1, 1,
0.8115849, -1.144574, 3.28245, 0.6980392, 0, 1, 1,
0.8120592, -1.589645, 2.440311, 0.7058824, 0, 1, 1,
0.8140978, 0.09732378, 1.408873, 0.7098039, 0, 1, 1,
0.814478, -1.839713, 3.663634, 0.7176471, 0, 1, 1,
0.8174848, -0.2426563, 1.367439, 0.7215686, 0, 1, 1,
0.822223, -0.539685, 2.643029, 0.7294118, 0, 1, 1,
0.8259751, 0.4401921, 0.1376915, 0.7333333, 0, 1, 1,
0.8278936, -0.3156737, 1.388354, 0.7411765, 0, 1, 1,
0.8288959, -0.3517252, 1.828338, 0.7450981, 0, 1, 1,
0.8404593, 1.223846, 2.112423, 0.7529412, 0, 1, 1,
0.8409728, -0.6630977, 0.681537, 0.7568628, 0, 1, 1,
0.8432156, 0.5073092, 1.070739, 0.7647059, 0, 1, 1,
0.8458727, -0.3007245, 1.229573, 0.7686275, 0, 1, 1,
0.8475763, -0.385157, 1.425564, 0.7764706, 0, 1, 1,
0.8477784, -0.0225896, 1.395541, 0.7803922, 0, 1, 1,
0.8586743, -0.03318163, 1.130272, 0.7882353, 0, 1, 1,
0.8636126, 0.8651988, 2.21019, 0.7921569, 0, 1, 1,
0.8654948, -0.2617345, 3.7212, 0.8, 0, 1, 1,
0.8658909, -0.9665206, -0.4162793, 0.8078431, 0, 1, 1,
0.8661717, -0.2900611, 1.976564, 0.8117647, 0, 1, 1,
0.8738835, 0.7431047, -0.3826063, 0.8196079, 0, 1, 1,
0.8948238, 1.071375, 2.381226, 0.8235294, 0, 1, 1,
0.9014236, 0.8776679, -0.5800807, 0.8313726, 0, 1, 1,
0.9017062, 1.082604, 1.291945, 0.8352941, 0, 1, 1,
0.9033098, -0.004102026, 0.4234819, 0.8431373, 0, 1, 1,
0.9070758, -0.9861372, 4.089099, 0.8470588, 0, 1, 1,
0.9079679, 0.6667435, 2.211555, 0.854902, 0, 1, 1,
0.9084491, 1.205179, -0.3725103, 0.8588235, 0, 1, 1,
0.9137893, -1.387102, 2.529953, 0.8666667, 0, 1, 1,
0.9143566, -0.4214732, 3.417583, 0.8705882, 0, 1, 1,
0.9192314, 0.9554374, 3.672734, 0.8784314, 0, 1, 1,
0.9244174, -0.3120004, 0.5060585, 0.8823529, 0, 1, 1,
0.9358801, -0.9086354, 2.479578, 0.8901961, 0, 1, 1,
0.9381937, 0.108648, 0.6834334, 0.8941177, 0, 1, 1,
0.9390547, -0.282982, 1.187466, 0.9019608, 0, 1, 1,
0.9398368, 1.88384, 0.2359924, 0.9098039, 0, 1, 1,
0.9405221, 1.441453, 1.44281, 0.9137255, 0, 1, 1,
0.9442075, 0.7430895, 1.055861, 0.9215686, 0, 1, 1,
0.9445947, 0.5585648, 0.6498309, 0.9254902, 0, 1, 1,
0.9472398, 0.3167137, 0.9180292, 0.9333333, 0, 1, 1,
0.9538567, -0.9788112, 2.528005, 0.9372549, 0, 1, 1,
0.9621974, 0.3994435, 0.5370002, 0.945098, 0, 1, 1,
0.9627598, 0.1426819, 1.986764, 0.9490196, 0, 1, 1,
0.9683196, 1.120732, 1.868163, 0.9568627, 0, 1, 1,
0.9731937, -1.046349, 1.893581, 0.9607843, 0, 1, 1,
0.9737408, 0.5751565, -0.4373407, 0.9686275, 0, 1, 1,
0.9783818, 0.1880589, 1.632148, 0.972549, 0, 1, 1,
0.985254, -0.452307, 2.039415, 0.9803922, 0, 1, 1,
0.9863971, 0.3323548, 0.2431324, 0.9843137, 0, 1, 1,
0.9977542, -0.02346335, 3.922699, 0.9921569, 0, 1, 1,
0.998411, -0.6321661, 2.227543, 0.9960784, 0, 1, 1,
1.008275, 0.317327, 0.7407257, 1, 0, 0.9960784, 1,
1.009446, 1.587116, 1.655468, 1, 0, 0.9882353, 1,
1.018815, -0.9070383, 3.114039, 1, 0, 0.9843137, 1,
1.019022, -1.651291, 1.383364, 1, 0, 0.9764706, 1,
1.019331, -1.188121, 4.117065, 1, 0, 0.972549, 1,
1.023968, -0.885602, 1.937135, 1, 0, 0.9647059, 1,
1.027351, -0.9451646, 2.111392, 1, 0, 0.9607843, 1,
1.030237, -0.2736009, 0.7655817, 1, 0, 0.9529412, 1,
1.040498, -1.141942, 1.29587, 1, 0, 0.9490196, 1,
1.040747, 0.6194831, 0.4073921, 1, 0, 0.9411765, 1,
1.043277, 0.09160753, 1.068287, 1, 0, 0.9372549, 1,
1.048772, -0.6054493, 0.8591203, 1, 0, 0.9294118, 1,
1.055946, -1.321795, 2.614524, 1, 0, 0.9254902, 1,
1.06452, -0.07453693, 2.964565, 1, 0, 0.9176471, 1,
1.072487, 0.5760121, -0.6361192, 1, 0, 0.9137255, 1,
1.083871, -0.3215083, 0.6541194, 1, 0, 0.9058824, 1,
1.08658, -0.7136611, 0.8738418, 1, 0, 0.9019608, 1,
1.091772, -0.1826492, 2.001351, 1, 0, 0.8941177, 1,
1.09391, 0.5537207, 1.084973, 1, 0, 0.8862745, 1,
1.097859, -0.6135089, 3.604627, 1, 0, 0.8823529, 1,
1.102908, -1.079781, 2.172153, 1, 0, 0.8745098, 1,
1.106995, -0.9054435, 2.750358, 1, 0, 0.8705882, 1,
1.111021, -0.3339172, 1.282344, 1, 0, 0.8627451, 1,
1.11296, 0.2870583, 1.878916, 1, 0, 0.8588235, 1,
1.123439, -1.209271, 2.786008, 1, 0, 0.8509804, 1,
1.135399, -0.7185699, 1.754093, 1, 0, 0.8470588, 1,
1.136054, 1.632531, -1.389707, 1, 0, 0.8392157, 1,
1.166386, -2.629503, 2.437723, 1, 0, 0.8352941, 1,
1.170773, -1.047991, 1.757701, 1, 0, 0.827451, 1,
1.179027, -0.8170261, 1.287046, 1, 0, 0.8235294, 1,
1.182777, -0.3086793, 2.348625, 1, 0, 0.8156863, 1,
1.184871, 0.5497324, 0.5050529, 1, 0, 0.8117647, 1,
1.193628, 0.367816, 1.933911, 1, 0, 0.8039216, 1,
1.201478, 1.013611, 1.293391, 1, 0, 0.7960784, 1,
1.202184, -0.03787709, 1.702176, 1, 0, 0.7921569, 1,
1.216536, 0.4917816, 2.531716, 1, 0, 0.7843137, 1,
1.217295, 0.6329392, 3.390109, 1, 0, 0.7803922, 1,
1.217457, 1.275756, -0.8452095, 1, 0, 0.772549, 1,
1.218656, -0.839814, 1.874634, 1, 0, 0.7686275, 1,
1.218795, 0.02884141, 2.72117, 1, 0, 0.7607843, 1,
1.219774, -0.5305408, 0.2194708, 1, 0, 0.7568628, 1,
1.240398, -1.19381, 1.820931, 1, 0, 0.7490196, 1,
1.243976, 0.3883617, 1.135321, 1, 0, 0.7450981, 1,
1.244257, -0.1751845, 2.510159, 1, 0, 0.7372549, 1,
1.244364, -0.9372813, 2.442871, 1, 0, 0.7333333, 1,
1.250625, -0.01650835, 1.680592, 1, 0, 0.7254902, 1,
1.253176, 2.114874, 0.4563914, 1, 0, 0.7215686, 1,
1.261103, -0.1746362, 2.709914, 1, 0, 0.7137255, 1,
1.261907, -1.335973, 2.301973, 1, 0, 0.7098039, 1,
1.263507, 0.01061186, 1.06415, 1, 0, 0.7019608, 1,
1.274863, -0.1222739, 2.140223, 1, 0, 0.6941177, 1,
1.274908, -0.7964008, 2.613208, 1, 0, 0.6901961, 1,
1.281002, -1.837716, 3.852259, 1, 0, 0.682353, 1,
1.2816, -0.2714307, 1.143647, 1, 0, 0.6784314, 1,
1.284868, 1.551467, 2.513863, 1, 0, 0.6705883, 1,
1.285959, 0.2465126, 1.11101, 1, 0, 0.6666667, 1,
1.287011, 1.687445, 0.7169868, 1, 0, 0.6588235, 1,
1.294873, 0.05751303, 0.1519797, 1, 0, 0.654902, 1,
1.30235, 1.073891, 0.1509968, 1, 0, 0.6470588, 1,
1.30384, -2.3542, 1.138581, 1, 0, 0.6431373, 1,
1.306417, -0.2548304, 3.394699, 1, 0, 0.6352941, 1,
1.307568, -1.173224, 2.110852, 1, 0, 0.6313726, 1,
1.311272, 0.3347611, 1.453489, 1, 0, 0.6235294, 1,
1.314273, 1.047464, 2.318226, 1, 0, 0.6196079, 1,
1.321695, 2.970065, 1.726872, 1, 0, 0.6117647, 1,
1.324059, 1.633986, -0.102326, 1, 0, 0.6078432, 1,
1.326178, 0.109951, 1.678484, 1, 0, 0.6, 1,
1.342082, 0.3713913, 1.290532, 1, 0, 0.5921569, 1,
1.343529, 0.4317172, 1.600903, 1, 0, 0.5882353, 1,
1.344673, 0.6595439, 2.411652, 1, 0, 0.5803922, 1,
1.353605, -0.5766948, 2.490954, 1, 0, 0.5764706, 1,
1.356906, 0.7788575, 1.656368, 1, 0, 0.5686275, 1,
1.364382, -1.633015, 0.4650099, 1, 0, 0.5647059, 1,
1.368576, 2.723414, 2.154901, 1, 0, 0.5568628, 1,
1.369996, 0.7791636, 1.518912, 1, 0, 0.5529412, 1,
1.379405, -0.7850327, 4.576399, 1, 0, 0.5450981, 1,
1.391238, 0.1825717, 1.522617, 1, 0, 0.5411765, 1,
1.392149, 0.2419524, 0.825797, 1, 0, 0.5333334, 1,
1.393994, -0.1023834, 1.181138, 1, 0, 0.5294118, 1,
1.41745, -0.1286176, 1.223007, 1, 0, 0.5215687, 1,
1.429554, 1.635541, 0.6884182, 1, 0, 0.5176471, 1,
1.451998, 1.446533, 1.174671, 1, 0, 0.509804, 1,
1.465298, -0.698267, 2.196233, 1, 0, 0.5058824, 1,
1.469511, 1.424421, 1.214746, 1, 0, 0.4980392, 1,
1.475122, -0.9545317, 3.497234, 1, 0, 0.4901961, 1,
1.490438, -0.8607916, 1.724828, 1, 0, 0.4862745, 1,
1.491079, -1.198063, 1.743077, 1, 0, 0.4784314, 1,
1.495109, 0.5991144, 1.563675, 1, 0, 0.4745098, 1,
1.499305, 0.1926026, 3.287414, 1, 0, 0.4666667, 1,
1.510302, -0.8138952, 2.496064, 1, 0, 0.4627451, 1,
1.51061, -0.2146634, 1.364952, 1, 0, 0.454902, 1,
1.513224, -1.424766, 1.767762, 1, 0, 0.4509804, 1,
1.513411, 0.6723169, 1.330527, 1, 0, 0.4431373, 1,
1.517813, -0.3670309, 1.425193, 1, 0, 0.4392157, 1,
1.517841, -0.2558675, -0.6806794, 1, 0, 0.4313726, 1,
1.519214, 0.6997213, 1.030419, 1, 0, 0.427451, 1,
1.519391, -0.5365978, 0.3146088, 1, 0, 0.4196078, 1,
1.528935, 1.381147, 1.784414, 1, 0, 0.4156863, 1,
1.531652, -0.5899665, 2.705451, 1, 0, 0.4078431, 1,
1.533018, 0.2192081, 1.134795, 1, 0, 0.4039216, 1,
1.533155, -1.348204, 1.899989, 1, 0, 0.3960784, 1,
1.53346, -0.1919366, 0.7311903, 1, 0, 0.3882353, 1,
1.545199, -0.1960598, 1.997723, 1, 0, 0.3843137, 1,
1.546853, 0.1474038, 2.620589, 1, 0, 0.3764706, 1,
1.56705, -0.4431559, -0.02471772, 1, 0, 0.372549, 1,
1.567202, 0.5085061, 0.7644075, 1, 0, 0.3647059, 1,
1.574607, 1.348065, -0.4974197, 1, 0, 0.3607843, 1,
1.577984, -0.3471035, 2.320141, 1, 0, 0.3529412, 1,
1.582624, -1.026155, 0.7565536, 1, 0, 0.3490196, 1,
1.592316, 0.3302563, 1.923503, 1, 0, 0.3411765, 1,
1.608957, 0.376632, 0.6986101, 1, 0, 0.3372549, 1,
1.619916, 0.1382227, 1.946118, 1, 0, 0.3294118, 1,
1.627382, -0.06983873, -0.01223771, 1, 0, 0.3254902, 1,
1.633137, -0.6662168, 2.539846, 1, 0, 0.3176471, 1,
1.63882, 1.052993, 1.561253, 1, 0, 0.3137255, 1,
1.647281, 0.5828705, 0.02068499, 1, 0, 0.3058824, 1,
1.649455, 0.2359412, 2.609819, 1, 0, 0.2980392, 1,
1.680605, -0.3022111, 2.656296, 1, 0, 0.2941177, 1,
1.682453, 0.2323221, 0.7032947, 1, 0, 0.2862745, 1,
1.686427, -0.4640359, 1.185195, 1, 0, 0.282353, 1,
1.689549, -0.718127, 1.674294, 1, 0, 0.2745098, 1,
1.692634, -0.6862441, 1.87015, 1, 0, 0.2705882, 1,
1.696097, 0.4361272, 0.7742731, 1, 0, 0.2627451, 1,
1.698143, 0.1064911, 1.797796, 1, 0, 0.2588235, 1,
1.698526, 0.7003311, 1.31606, 1, 0, 0.2509804, 1,
1.736644, -0.3036516, 2.250635, 1, 0, 0.2470588, 1,
1.740615, 0.1411617, 2.136251, 1, 0, 0.2392157, 1,
1.755617, 0.5665231, -0.2152067, 1, 0, 0.2352941, 1,
1.759601, 0.7346786, 0.9253839, 1, 0, 0.227451, 1,
1.801464, -0.09798431, 0.6782663, 1, 0, 0.2235294, 1,
1.811313, 0.8580549, 1.652109, 1, 0, 0.2156863, 1,
1.858981, -0.754986, 2.30501, 1, 0, 0.2117647, 1,
1.862033, 0.6280367, 2.578152, 1, 0, 0.2039216, 1,
1.865632, 0.8036648, -0.963298, 1, 0, 0.1960784, 1,
1.867878, -2.015057, 2.572626, 1, 0, 0.1921569, 1,
1.88645, 1.330088, 1.614502, 1, 0, 0.1843137, 1,
1.893004, 0.5299829, -0.287052, 1, 0, 0.1803922, 1,
1.93182, 0.1768524, 2.47617, 1, 0, 0.172549, 1,
1.94163, -1.11007, 1.853657, 1, 0, 0.1686275, 1,
1.941648, 1.266516, -0.928136, 1, 0, 0.1607843, 1,
1.980838, 0.9111529, 1.231642, 1, 0, 0.1568628, 1,
2.027964, -0.8933123, 2.381532, 1, 0, 0.1490196, 1,
2.089278, -0.3672874, 2.893463, 1, 0, 0.145098, 1,
2.10898, -0.582978, 2.157741, 1, 0, 0.1372549, 1,
2.114236, -1.121507, 2.647055, 1, 0, 0.1333333, 1,
2.13575, 0.01392952, 1.572803, 1, 0, 0.1254902, 1,
2.160966, 0.8360236, 1.363687, 1, 0, 0.1215686, 1,
2.162506, 0.0174945, 1.566287, 1, 0, 0.1137255, 1,
2.173338, -0.7289504, 0.9582646, 1, 0, 0.1098039, 1,
2.173857, -0.1103807, 4.915279, 1, 0, 0.1019608, 1,
2.217141, 2.233167, -1.831563, 1, 0, 0.09411765, 1,
2.220961, -0.6667163, 3.148688, 1, 0, 0.09019608, 1,
2.231342, 2.06098, 0.879864, 1, 0, 0.08235294, 1,
2.232722, 0.1977078, 0.03160521, 1, 0, 0.07843138, 1,
2.255153, -0.296163, 2.174697, 1, 0, 0.07058824, 1,
2.261744, 1.536574, 1.392596, 1, 0, 0.06666667, 1,
2.276916, -1.018881, 2.548626, 1, 0, 0.05882353, 1,
2.323179, -0.4498162, 0.2603165, 1, 0, 0.05490196, 1,
2.445244, -0.4508756, 1.948622, 1, 0, 0.04705882, 1,
2.465311, 1.779423, 1.862776, 1, 0, 0.04313726, 1,
2.473073, 1.64989, 1.101296, 1, 0, 0.03529412, 1,
2.477076, -1.000891, 0.8901479, 1, 0, 0.03137255, 1,
2.480398, 0.5109401, 1.448233, 1, 0, 0.02352941, 1,
2.519718, -0.1684371, 1.023668, 1, 0, 0.01960784, 1,
2.612962, 0.5074295, 0.5099338, 1, 0, 0.01176471, 1,
3.225965, -1.058491, 0.8770899, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.02348185, -4.070939, -7.225382, 0, -0.5, 0.5, 0.5,
0.02348185, -4.070939, -7.225382, 1, -0.5, 0.5, 0.5,
0.02348185, -4.070939, -7.225382, 1, 1.5, 0.5, 0.5,
0.02348185, -4.070939, -7.225382, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.264643, 0.1642754, -7.225382, 0, -0.5, 0.5, 0.5,
-4.264643, 0.1642754, -7.225382, 1, -0.5, 0.5, 0.5,
-4.264643, 0.1642754, -7.225382, 1, 1.5, 0.5, 0.5,
-4.264643, 0.1642754, -7.225382, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.264643, -4.070939, -0.2712805, 0, -0.5, 0.5, 0.5,
-4.264643, -4.070939, -0.2712805, 1, -0.5, 0.5, 0.5,
-4.264643, -4.070939, -0.2712805, 1, 1.5, 0.5, 0.5,
-4.264643, -4.070939, -0.2712805, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-3, -3.093581, -5.620589,
3, -3.093581, -5.620589,
-3, -3.093581, -5.620589,
-3, -3.256474, -5.888055,
-2, -3.093581, -5.620589,
-2, -3.256474, -5.888055,
-1, -3.093581, -5.620589,
-1, -3.256474, -5.888055,
0, -3.093581, -5.620589,
0, -3.256474, -5.888055,
1, -3.093581, -5.620589,
1, -3.256474, -5.888055,
2, -3.093581, -5.620589,
2, -3.256474, -5.888055,
3, -3.093581, -5.620589,
3, -3.256474, -5.888055
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3, -3.58226, -6.422986, 0, -0.5, 0.5, 0.5,
-3, -3.58226, -6.422986, 1, -0.5, 0.5, 0.5,
-3, -3.58226, -6.422986, 1, 1.5, 0.5, 0.5,
-3, -3.58226, -6.422986, 0, 1.5, 0.5, 0.5,
-2, -3.58226, -6.422986, 0, -0.5, 0.5, 0.5,
-2, -3.58226, -6.422986, 1, -0.5, 0.5, 0.5,
-2, -3.58226, -6.422986, 1, 1.5, 0.5, 0.5,
-2, -3.58226, -6.422986, 0, 1.5, 0.5, 0.5,
-1, -3.58226, -6.422986, 0, -0.5, 0.5, 0.5,
-1, -3.58226, -6.422986, 1, -0.5, 0.5, 0.5,
-1, -3.58226, -6.422986, 1, 1.5, 0.5, 0.5,
-1, -3.58226, -6.422986, 0, 1.5, 0.5, 0.5,
0, -3.58226, -6.422986, 0, -0.5, 0.5, 0.5,
0, -3.58226, -6.422986, 1, -0.5, 0.5, 0.5,
0, -3.58226, -6.422986, 1, 1.5, 0.5, 0.5,
0, -3.58226, -6.422986, 0, 1.5, 0.5, 0.5,
1, -3.58226, -6.422986, 0, -0.5, 0.5, 0.5,
1, -3.58226, -6.422986, 1, -0.5, 0.5, 0.5,
1, -3.58226, -6.422986, 1, 1.5, 0.5, 0.5,
1, -3.58226, -6.422986, 0, 1.5, 0.5, 0.5,
2, -3.58226, -6.422986, 0, -0.5, 0.5, 0.5,
2, -3.58226, -6.422986, 1, -0.5, 0.5, 0.5,
2, -3.58226, -6.422986, 1, 1.5, 0.5, 0.5,
2, -3.58226, -6.422986, 0, 1.5, 0.5, 0.5,
3, -3.58226, -6.422986, 0, -0.5, 0.5, 0.5,
3, -3.58226, -6.422986, 1, -0.5, 0.5, 0.5,
3, -3.58226, -6.422986, 1, 1.5, 0.5, 0.5,
3, -3.58226, -6.422986, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.275075, -2, -5.620589,
-3.275075, 3, -5.620589,
-3.275075, -2, -5.620589,
-3.440003, -2, -5.888055,
-3.275075, -1, -5.620589,
-3.440003, -1, -5.888055,
-3.275075, 0, -5.620589,
-3.440003, 0, -5.888055,
-3.275075, 1, -5.620589,
-3.440003, 1, -5.888055,
-3.275075, 2, -5.620589,
-3.440003, 2, -5.888055,
-3.275075, 3, -5.620589,
-3.440003, 3, -5.888055
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.769859, -2, -6.422986, 0, -0.5, 0.5, 0.5,
-3.769859, -2, -6.422986, 1, -0.5, 0.5, 0.5,
-3.769859, -2, -6.422986, 1, 1.5, 0.5, 0.5,
-3.769859, -2, -6.422986, 0, 1.5, 0.5, 0.5,
-3.769859, -1, -6.422986, 0, -0.5, 0.5, 0.5,
-3.769859, -1, -6.422986, 1, -0.5, 0.5, 0.5,
-3.769859, -1, -6.422986, 1, 1.5, 0.5, 0.5,
-3.769859, -1, -6.422986, 0, 1.5, 0.5, 0.5,
-3.769859, 0, -6.422986, 0, -0.5, 0.5, 0.5,
-3.769859, 0, -6.422986, 1, -0.5, 0.5, 0.5,
-3.769859, 0, -6.422986, 1, 1.5, 0.5, 0.5,
-3.769859, 0, -6.422986, 0, 1.5, 0.5, 0.5,
-3.769859, 1, -6.422986, 0, -0.5, 0.5, 0.5,
-3.769859, 1, -6.422986, 1, -0.5, 0.5, 0.5,
-3.769859, 1, -6.422986, 1, 1.5, 0.5, 0.5,
-3.769859, 1, -6.422986, 0, 1.5, 0.5, 0.5,
-3.769859, 2, -6.422986, 0, -0.5, 0.5, 0.5,
-3.769859, 2, -6.422986, 1, -0.5, 0.5, 0.5,
-3.769859, 2, -6.422986, 1, 1.5, 0.5, 0.5,
-3.769859, 2, -6.422986, 0, 1.5, 0.5, 0.5,
-3.769859, 3, -6.422986, 0, -0.5, 0.5, 0.5,
-3.769859, 3, -6.422986, 1, -0.5, 0.5, 0.5,
-3.769859, 3, -6.422986, 1, 1.5, 0.5, 0.5,
-3.769859, 3, -6.422986, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.275075, -3.093581, -4,
-3.275075, -3.093581, 4,
-3.275075, -3.093581, -4,
-3.440003, -3.256474, -4,
-3.275075, -3.093581, -2,
-3.440003, -3.256474, -2,
-3.275075, -3.093581, 0,
-3.440003, -3.256474, 0,
-3.275075, -3.093581, 2,
-3.440003, -3.256474, 2,
-3.275075, -3.093581, 4,
-3.440003, -3.256474, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.769859, -3.58226, -4, 0, -0.5, 0.5, 0.5,
-3.769859, -3.58226, -4, 1, -0.5, 0.5, 0.5,
-3.769859, -3.58226, -4, 1, 1.5, 0.5, 0.5,
-3.769859, -3.58226, -4, 0, 1.5, 0.5, 0.5,
-3.769859, -3.58226, -2, 0, -0.5, 0.5, 0.5,
-3.769859, -3.58226, -2, 1, -0.5, 0.5, 0.5,
-3.769859, -3.58226, -2, 1, 1.5, 0.5, 0.5,
-3.769859, -3.58226, -2, 0, 1.5, 0.5, 0.5,
-3.769859, -3.58226, 0, 0, -0.5, 0.5, 0.5,
-3.769859, -3.58226, 0, 1, -0.5, 0.5, 0.5,
-3.769859, -3.58226, 0, 1, 1.5, 0.5, 0.5,
-3.769859, -3.58226, 0, 0, 1.5, 0.5, 0.5,
-3.769859, -3.58226, 2, 0, -0.5, 0.5, 0.5,
-3.769859, -3.58226, 2, 1, -0.5, 0.5, 0.5,
-3.769859, -3.58226, 2, 1, 1.5, 0.5, 0.5,
-3.769859, -3.58226, 2, 0, 1.5, 0.5, 0.5,
-3.769859, -3.58226, 4, 0, -0.5, 0.5, 0.5,
-3.769859, -3.58226, 4, 1, -0.5, 0.5, 0.5,
-3.769859, -3.58226, 4, 1, 1.5, 0.5, 0.5,
-3.769859, -3.58226, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.275075, -3.093581, -5.620589,
-3.275075, 3.422132, -5.620589,
-3.275075, -3.093581, 5.078028,
-3.275075, 3.422132, 5.078028,
-3.275075, -3.093581, -5.620589,
-3.275075, -3.093581, 5.078028,
-3.275075, 3.422132, -5.620589,
-3.275075, 3.422132, 5.078028,
-3.275075, -3.093581, -5.620589,
3.322039, -3.093581, -5.620589,
-3.275075, -3.093581, 5.078028,
3.322039, -3.093581, 5.078028,
-3.275075, 3.422132, -5.620589,
3.322039, 3.422132, -5.620589,
-3.275075, 3.422132, 5.078028,
3.322039, 3.422132, 5.078028,
3.322039, -3.093581, -5.620589,
3.322039, 3.422132, -5.620589,
3.322039, -3.093581, 5.078028,
3.322039, 3.422132, 5.078028,
3.322039, -3.093581, -5.620589,
3.322039, -3.093581, 5.078028,
3.322039, 3.422132, -5.620589,
3.322039, 3.422132, 5.078028
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.559869;
var distance = 33.63471;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.02348185, -0.1642754, 0.2712805 );
mvMatrix.scale( 1.239008, 1.254487, 0.7640126 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.63471);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 16);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
mepiquat_chloride<-read.table("mepiquat_chloride.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-mepiquat_chloride$V2
```

```
## Error in eval(expr, envir, enclos): object 'mepiquat_chloride' not found
```

```r
y<-mepiquat_chloride$V3
```

```
## Error in eval(expr, envir, enclos): object 'mepiquat_chloride' not found
```

```r
z<-mepiquat_chloride$V4
```

```
## Error in eval(expr, envir, enclos): object 'mepiquat_chloride' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.179001, -0.3623375, -1.820218, 0, 0, 1, 1, 1,
-3.054773, 0.01201037, -1.238174, 1, 0, 0, 1, 1,
-2.968507, 0.4980375, -1.755332, 1, 0, 0, 1, 1,
-2.678835, -2.423182, -3.141529, 1, 0, 0, 1, 1,
-2.531125, -1.250933, -0.7120699, 1, 0, 0, 1, 1,
-2.444304, 1.082467, -1.288561, 1, 0, 0, 1, 1,
-2.421789, -1.372504, -2.279807, 0, 0, 0, 1, 1,
-2.403879, -0.5827996, -0.3398883, 0, 0, 0, 1, 1,
-2.39766, -0.145747, -3.0024, 0, 0, 0, 1, 1,
-2.328603, 2.66204, -0.1421973, 0, 0, 0, 1, 1,
-2.311728, -0.8513186, -0.1462413, 0, 0, 0, 1, 1,
-2.293186, -0.948577, 0.4287832, 0, 0, 0, 1, 1,
-2.243521, -0.5740873, -2.781, 0, 0, 0, 1, 1,
-2.230459, 0.4406813, -0.5283013, 1, 1, 1, 1, 1,
-2.208638, -0.3778505, -0.1024859, 1, 1, 1, 1, 1,
-2.208084, 0.2386972, -1.375775, 1, 1, 1, 1, 1,
-2.190239, -0.8790503, -2.161421, 1, 1, 1, 1, 1,
-2.170984, -1.998975, -2.059944, 1, 1, 1, 1, 1,
-2.092422, -0.4889621, -2.972371, 1, 1, 1, 1, 1,
-2.087741, 0.9889757, 0.5295457, 1, 1, 1, 1, 1,
-2.077206, 0.4232359, -1.756565, 1, 1, 1, 1, 1,
-2.026269, -0.9637523, -2.679622, 1, 1, 1, 1, 1,
-2.020874, -0.4658888, -2.308433, 1, 1, 1, 1, 1,
-2.010015, -0.3644044, -1.997354, 1, 1, 1, 1, 1,
-1.968335, 0.6569873, -1.827395, 1, 1, 1, 1, 1,
-1.952552, 0.585874, -0.1450133, 1, 1, 1, 1, 1,
-1.940166, -0.9980048, -0.6777424, 1, 1, 1, 1, 1,
-1.934241, 0.6159463, -1.453557, 1, 1, 1, 1, 1,
-1.908018, 0.09373381, 1.497425, 0, 0, 1, 1, 1,
-1.895854, 0.45175, 0.9153955, 1, 0, 0, 1, 1,
-1.871978, -0.8888797, -1.616154, 1, 0, 0, 1, 1,
-1.848894, -1.031021, -1.787589, 1, 0, 0, 1, 1,
-1.827147, -0.2315486, -0.6835623, 1, 0, 0, 1, 1,
-1.820844, -0.5757748, -3.012835, 1, 0, 0, 1, 1,
-1.820325, 0.7610304, -2.036345, 0, 0, 0, 1, 1,
-1.794182, -0.9710777, -2.274828, 0, 0, 0, 1, 1,
-1.780663, -0.3037179, 0.1164149, 0, 0, 0, 1, 1,
-1.756196, -1.938054, -2.609442, 0, 0, 0, 1, 1,
-1.741895, 0.2112843, 0.7169366, 0, 0, 0, 1, 1,
-1.716048, -0.4985816, -1.64504, 0, 0, 0, 1, 1,
-1.699932, 0.593389, -3.202182, 0, 0, 0, 1, 1,
-1.674996, -0.2617304, -2.652357, 1, 1, 1, 1, 1,
-1.662711, -0.6597814, -2.289298, 1, 1, 1, 1, 1,
-1.660106, 1.799371, -0.7219319, 1, 1, 1, 1, 1,
-1.640896, 0.2823714, -0.9818121, 1, 1, 1, 1, 1,
-1.640801, 0.998755, -0.6696526, 1, 1, 1, 1, 1,
-1.63155, 0.8177033, -0.568014, 1, 1, 1, 1, 1,
-1.624054, -1.010999, -2.696565, 1, 1, 1, 1, 1,
-1.620165, -0.363883, -2.064511, 1, 1, 1, 1, 1,
-1.617128, 0.2657712, -0.939519, 1, 1, 1, 1, 1,
-1.615965, 0.9025987, -1.266671, 1, 1, 1, 1, 1,
-1.615414, 1.574982, -1.307444, 1, 1, 1, 1, 1,
-1.614613, -1.276471, -2.192285, 1, 1, 1, 1, 1,
-1.598556, 0.2068463, 0.6006054, 1, 1, 1, 1, 1,
-1.589562, -0.6132247, -3.186439, 1, 1, 1, 1, 1,
-1.58189, 0.4102336, -1.298242, 1, 1, 1, 1, 1,
-1.571119, -0.5689151, -2.445109, 0, 0, 1, 1, 1,
-1.57066, -0.4811527, -1.94284, 1, 0, 0, 1, 1,
-1.549882, -0.3656745, -0.5406075, 1, 0, 0, 1, 1,
-1.548072, -1.744529, -3.42165, 1, 0, 0, 1, 1,
-1.528669, 1.290506, -0.4121993, 1, 0, 0, 1, 1,
-1.512591, -0.04096119, -0.7305178, 1, 0, 0, 1, 1,
-1.49892, -0.2162115, -0.4118336, 0, 0, 0, 1, 1,
-1.494888, 0.9654997, 0.2907499, 0, 0, 0, 1, 1,
-1.494643, -0.3589996, -2.154762, 0, 0, 0, 1, 1,
-1.489283, 0.3176508, -3.769807, 0, 0, 0, 1, 1,
-1.487391, -0.4098323, -1.755309, 0, 0, 0, 1, 1,
-1.470578, -1.236887, -1.979102, 0, 0, 0, 1, 1,
-1.470248, -0.2096171, -1.956429, 0, 0, 0, 1, 1,
-1.468115, 1.088043, -1.423391, 1, 1, 1, 1, 1,
-1.464908, -1.006147, -1.293741, 1, 1, 1, 1, 1,
-1.457326, -0.6709164, -2.749714, 1, 1, 1, 1, 1,
-1.452132, -1.428527, -2.370897, 1, 1, 1, 1, 1,
-1.446028, 0.1262731, -3.039444, 1, 1, 1, 1, 1,
-1.423199, -0.5647033, -2.392561, 1, 1, 1, 1, 1,
-1.399639, -0.6215499, -0.8065522, 1, 1, 1, 1, 1,
-1.398841, -0.05762273, -2.343971, 1, 1, 1, 1, 1,
-1.397405, -1.260197, -4.129532, 1, 1, 1, 1, 1,
-1.389588, -1.630687, -0.9326376, 1, 1, 1, 1, 1,
-1.38338, -1.121616, -4.681031, 1, 1, 1, 1, 1,
-1.378938, 0.05638166, -0.8880251, 1, 1, 1, 1, 1,
-1.378585, -0.2038236, -0.6384627, 1, 1, 1, 1, 1,
-1.372268, -1.025701, -2.674207, 1, 1, 1, 1, 1,
-1.371351, -0.7361696, -1.744697, 1, 1, 1, 1, 1,
-1.351433, 0.6231724, -1.760946, 0, 0, 1, 1, 1,
-1.343074, 0.5633716, -2.478411, 1, 0, 0, 1, 1,
-1.337727, 0.8566923, -2.28583, 1, 0, 0, 1, 1,
-1.334991, 0.3435279, 0.4806858, 1, 0, 0, 1, 1,
-1.325307, -0.4668197, -1.962913, 1, 0, 0, 1, 1,
-1.323646, -0.02231663, -1.746118, 1, 0, 0, 1, 1,
-1.314092, -0.3976842, -1.325716, 0, 0, 0, 1, 1,
-1.307972, 0.01144728, -0.7124423, 0, 0, 0, 1, 1,
-1.306644, -0.7405525, -2.806402, 0, 0, 0, 1, 1,
-1.304761, -1.620226, -0.5037662, 0, 0, 0, 1, 1,
-1.297802, 0.1182295, -2.306464, 0, 0, 0, 1, 1,
-1.294859, 0.6701259, -1.979334, 0, 0, 0, 1, 1,
-1.288959, 1.591585, 0.3159057, 0, 0, 0, 1, 1,
-1.288598, -1.707569, -2.143714, 1, 1, 1, 1, 1,
-1.286106, 1.010967, -0.6280832, 1, 1, 1, 1, 1,
-1.286021, 0.6549551, 0.4082954, 1, 1, 1, 1, 1,
-1.27172, -0.9426113, -1.779275, 1, 1, 1, 1, 1,
-1.260454, -0.1953816, -1.924164, 1, 1, 1, 1, 1,
-1.254087, 0.03884476, -1.757905, 1, 1, 1, 1, 1,
-1.240416, 1.036332, -0.970642, 1, 1, 1, 1, 1,
-1.218453, 0.3935875, -1.06004, 1, 1, 1, 1, 1,
-1.215936, 0.942732, -1.68483, 1, 1, 1, 1, 1,
-1.214264, -0.5803269, -0.6659575, 1, 1, 1, 1, 1,
-1.213987, 0.6162382, -1.880019, 1, 1, 1, 1, 1,
-1.205865, -1.117112, -1.70313, 1, 1, 1, 1, 1,
-1.188845, -0.6740335, -1.287848, 1, 1, 1, 1, 1,
-1.186008, -1.56699, -1.896417, 1, 1, 1, 1, 1,
-1.18184, -0.01535524, -1.223296, 1, 1, 1, 1, 1,
-1.178711, -2.178126, -1.858677, 0, 0, 1, 1, 1,
-1.176863, 2.117662, -0.953012, 1, 0, 0, 1, 1,
-1.176675, 0.1478817, -1.342035, 1, 0, 0, 1, 1,
-1.175197, 1.737933, -0.3668634, 1, 0, 0, 1, 1,
-1.158648, -0.4962416, -3.123863, 1, 0, 0, 1, 1,
-1.157722, -0.5101002, -2.884484, 1, 0, 0, 1, 1,
-1.135426, 0.7379358, -0.3933008, 0, 0, 0, 1, 1,
-1.135092, -0.6062552, -0.9053506, 0, 0, 0, 1, 1,
-1.131971, 2.222711, -3.131196, 0, 0, 0, 1, 1,
-1.127515, 0.6456326, -1.753984, 0, 0, 0, 1, 1,
-1.127363, 0.4075247, -0.4613321, 0, 0, 0, 1, 1,
-1.124398, 0.5449978, -1.060842, 0, 0, 0, 1, 1,
-1.120183, 0.998638, -4.214858, 0, 0, 0, 1, 1,
-1.110191, -1.026082, -2.208774, 1, 1, 1, 1, 1,
-1.109215, 0.2961535, -0.1499899, 1, 1, 1, 1, 1,
-1.104446, -1.277593, -3.266757, 1, 1, 1, 1, 1,
-1.104388, -0.7273183, -2.158702, 1, 1, 1, 1, 1,
-1.093782, -0.4823534, -2.575092, 1, 1, 1, 1, 1,
-1.091127, 0.9684095, -0.9632059, 1, 1, 1, 1, 1,
-1.09102, -0.02024291, -1.745576, 1, 1, 1, 1, 1,
-1.089945, 1.746238, -1.876689, 1, 1, 1, 1, 1,
-1.088478, 0.1159406, -1.536037, 1, 1, 1, 1, 1,
-1.088449, -1.10207, -3.263778, 1, 1, 1, 1, 1,
-1.081918, -1.024599, -2.934923, 1, 1, 1, 1, 1,
-1.068002, -0.5130756, -1.937874, 1, 1, 1, 1, 1,
-1.066076, 0.7195153, 0.01163979, 1, 1, 1, 1, 1,
-1.056923, 0.005273555, -0.6645304, 1, 1, 1, 1, 1,
-1.050551, -1.147579, -1.550632, 1, 1, 1, 1, 1,
-1.050262, 1.006822, -0.224139, 0, 0, 1, 1, 1,
-1.046531, 0.9250864, -1.573214, 1, 0, 0, 1, 1,
-1.044326, 0.5217647, 0.409325, 1, 0, 0, 1, 1,
-1.041544, -0.1531095, -1.792561, 1, 0, 0, 1, 1,
-1.030656, 0.1731105, -1.150862, 1, 0, 0, 1, 1,
-1.030347, -1.222405, -3.668135, 1, 0, 0, 1, 1,
-1.030004, -0.6538221, -1.928195, 0, 0, 0, 1, 1,
-1.026576, 0.5564528, -0.5967951, 0, 0, 0, 1, 1,
-1.026055, 1.227762, -0.5739104, 0, 0, 0, 1, 1,
-1.025125, 0.8534924, -0.3325331, 0, 0, 0, 1, 1,
-1.024569, 1.49325, 0.1740242, 0, 0, 0, 1, 1,
-1.016961, -1.911662, -0.1974871, 0, 0, 0, 1, 1,
-1.011741, -0.01185416, -0.2143193, 0, 0, 0, 1, 1,
-1.002736, 2.768885, -0.125103, 1, 1, 1, 1, 1,
-0.9953786, 0.08475712, -1.445263, 1, 1, 1, 1, 1,
-0.9854929, -0.4714072, -1.874861, 1, 1, 1, 1, 1,
-0.9768994, 2.116913, -0.4383748, 1, 1, 1, 1, 1,
-0.9732636, 0.140006, -1.303096, 1, 1, 1, 1, 1,
-0.9651995, 1.626628, -1.960523, 1, 1, 1, 1, 1,
-0.9631311, 0.4231905, -1.793072, 1, 1, 1, 1, 1,
-0.9598413, -1.11081, -0.1893661, 1, 1, 1, 1, 1,
-0.9569007, -0.8479105, -1.960984, 1, 1, 1, 1, 1,
-0.9546165, -0.3163005, -2.29477, 1, 1, 1, 1, 1,
-0.9382687, -0.2013409, -1.8731, 1, 1, 1, 1, 1,
-0.9296226, -0.376877, -3.176426, 1, 1, 1, 1, 1,
-0.9274691, 0.01923685, -2.404132, 1, 1, 1, 1, 1,
-0.9266692, -0.05108099, -1.385642, 1, 1, 1, 1, 1,
-0.9228609, 1.367412, 0.355407, 1, 1, 1, 1, 1,
-0.9227635, 1.574543, -2.50353, 0, 0, 1, 1, 1,
-0.9206882, 1.01374, -1.427412, 1, 0, 0, 1, 1,
-0.9139294, -0.4620099, -3.035934, 1, 0, 0, 1, 1,
-0.9132116, -0.2409678, -2.513072, 1, 0, 0, 1, 1,
-0.9128734, 0.6829038, -2.855494, 1, 0, 0, 1, 1,
-0.9085964, -0.8066092, -2.085327, 1, 0, 0, 1, 1,
-0.9041381, 0.372021, -0.1868964, 0, 0, 0, 1, 1,
-0.9031401, 0.9097882, 0.2736749, 0, 0, 0, 1, 1,
-0.9014376, 2.760643, 2.200588, 0, 0, 0, 1, 1,
-0.8981689, -1.484061, -2.697939, 0, 0, 0, 1, 1,
-0.8956955, 1.636883, -1.114533, 0, 0, 0, 1, 1,
-0.891167, -0.1543453, -2.882186, 0, 0, 0, 1, 1,
-0.8871858, -0.5525023, -2.188904, 0, 0, 0, 1, 1,
-0.8812333, 0.515386, -2.059519, 1, 1, 1, 1, 1,
-0.8684812, 0.2212057, -0.3873151, 1, 1, 1, 1, 1,
-0.8612754, 0.260052, -1.298823, 1, 1, 1, 1, 1,
-0.8565817, -0.07301585, -0.6777463, 1, 1, 1, 1, 1,
-0.8517717, 0.4576, -0.9413061, 1, 1, 1, 1, 1,
-0.8454393, -0.1257225, -1.482892, 1, 1, 1, 1, 1,
-0.8441462, 0.1221406, -0.9640952, 1, 1, 1, 1, 1,
-0.8439955, 0.02505449, -2.079164, 1, 1, 1, 1, 1,
-0.8425843, 1.388413, 0.5924594, 1, 1, 1, 1, 1,
-0.837157, -0.9577612, -0.9694864, 1, 1, 1, 1, 1,
-0.8286719, -0.1916978, -4.064541, 1, 1, 1, 1, 1,
-0.825143, 1.400104, -2.253373, 1, 1, 1, 1, 1,
-0.82105, 0.7918002, 0.2663611, 1, 1, 1, 1, 1,
-0.8198532, 0.09268367, -2.607996, 1, 1, 1, 1, 1,
-0.8194101, 0.5725527, -0.6072222, 1, 1, 1, 1, 1,
-0.8178245, -1.493847, -3.305106, 0, 0, 1, 1, 1,
-0.8167228, -1.550315, -3.420853, 1, 0, 0, 1, 1,
-0.8158645, -0.8062727, -2.854448, 1, 0, 0, 1, 1,
-0.815385, 1.887977, -1.326929, 1, 0, 0, 1, 1,
-0.8090595, 1.018215, -1.012427, 1, 0, 0, 1, 1,
-0.7946578, -1.345737, -2.284296, 1, 0, 0, 1, 1,
-0.7936998, 0.1317381, -0.3754338, 0, 0, 0, 1, 1,
-0.7878782, 0.428758, -0.5519167, 0, 0, 0, 1, 1,
-0.7802932, 0.3482285, -1.029661, 0, 0, 0, 1, 1,
-0.7789635, -0.4544951, -0.2190419, 0, 0, 0, 1, 1,
-0.7761926, -0.3513199, -3.167018, 0, 0, 0, 1, 1,
-0.7697635, 0.1643905, -0.9978397, 0, 0, 0, 1, 1,
-0.7695004, 0.1948217, -2.873859, 0, 0, 0, 1, 1,
-0.7645277, -2.098046, -4.198607, 1, 1, 1, 1, 1,
-0.7639869, -0.1080793, -1.59221, 1, 1, 1, 1, 1,
-0.7631287, 0.890026, 0.2349806, 1, 1, 1, 1, 1,
-0.7492916, 1.761116, 0.293374, 1, 1, 1, 1, 1,
-0.7474056, -0.461856, -1.166241, 1, 1, 1, 1, 1,
-0.7452112, -0.2326628, -1.348718, 1, 1, 1, 1, 1,
-0.739482, 0.6206907, 0.3740549, 1, 1, 1, 1, 1,
-0.7392606, 0.4975621, 1.79521, 1, 1, 1, 1, 1,
-0.7352434, -1.170393, -3.567894, 1, 1, 1, 1, 1,
-0.7351592, -1.68584, -2.049191, 1, 1, 1, 1, 1,
-0.7345322, -1.128396, -3.092775, 1, 1, 1, 1, 1,
-0.7318622, 0.06480487, -2.244723, 1, 1, 1, 1, 1,
-0.7286066, 0.2877609, -1.124154, 1, 1, 1, 1, 1,
-0.7133592, 1.8662, -0.6011565, 1, 1, 1, 1, 1,
-0.7040076, -0.8132741, -1.621025, 1, 1, 1, 1, 1,
-0.7028399, -0.67807, -3.015872, 0, 0, 1, 1, 1,
-0.7028012, -0.4879298, -1.185048, 1, 0, 0, 1, 1,
-0.7015844, 1.667501, 0.5339093, 1, 0, 0, 1, 1,
-0.7003861, 1.297667, -0.5965099, 1, 0, 0, 1, 1,
-0.6967391, 1.415711, 0.4167391, 1, 0, 0, 1, 1,
-0.6941532, 0.07263888, -3.02699, 1, 0, 0, 1, 1,
-0.6933494, 0.8006285, -0.244719, 0, 0, 0, 1, 1,
-0.689729, 0.6659349, 0.00891754, 0, 0, 0, 1, 1,
-0.6879333, 0.4907714, -0.1825318, 0, 0, 0, 1, 1,
-0.6871558, -0.1148291, -3.312917, 0, 0, 0, 1, 1,
-0.6855946, 0.4281611, -1.96487, 0, 0, 0, 1, 1,
-0.6839513, -0.5845063, -2.71663, 0, 0, 0, 1, 1,
-0.680481, 0.328435, -0.7602566, 0, 0, 0, 1, 1,
-0.6792714, -1.457712, -1.164794, 1, 1, 1, 1, 1,
-0.6788932, 0.07479936, -0.425221, 1, 1, 1, 1, 1,
-0.6761066, 1.519929, -0.252762, 1, 1, 1, 1, 1,
-0.6709337, -1.346417, -1.873441, 1, 1, 1, 1, 1,
-0.663274, 1.315391, -1.788293, 1, 1, 1, 1, 1,
-0.6622304, -0.5629857, -2.19436, 1, 1, 1, 1, 1,
-0.6607147, -0.3105584, -2.815251, 1, 1, 1, 1, 1,
-0.6606607, 0.2776848, -1.060487, 1, 1, 1, 1, 1,
-0.6579691, 1.517935, 0.6974092, 1, 1, 1, 1, 1,
-0.657495, -0.06191961, -1.743015, 1, 1, 1, 1, 1,
-0.6574008, 1.092404, -1.983564, 1, 1, 1, 1, 1,
-0.6537878, 1.183447, -1.826607, 1, 1, 1, 1, 1,
-0.650575, 1.283978, -0.5977558, 1, 1, 1, 1, 1,
-0.6484472, 1.427191, -1.574591, 1, 1, 1, 1, 1,
-0.6472901, -1.36345, -1.722468, 1, 1, 1, 1, 1,
-0.6467578, -0.8150737, -3.109897, 0, 0, 1, 1, 1,
-0.636368, -0.2642036, -1.284491, 1, 0, 0, 1, 1,
-0.6265567, -0.5823317, -3.365805, 1, 0, 0, 1, 1,
-0.6189094, 0.07209174, -0.9011025, 1, 0, 0, 1, 1,
-0.6180087, -0.2796535, -3.147463, 1, 0, 0, 1, 1,
-0.6033255, -0.2285064, -1.183658, 1, 0, 0, 1, 1,
-0.6018216, -0.3375732, 0.02363552, 0, 0, 0, 1, 1,
-0.5977494, 2.175493, 0.5086398, 0, 0, 0, 1, 1,
-0.5957581, -1.677663, -2.305165, 0, 0, 0, 1, 1,
-0.5898823, 1.182444, -0.4557135, 0, 0, 0, 1, 1,
-0.5891492, -1.03003, -3.093912, 0, 0, 0, 1, 1,
-0.5868923, -0.5966569, -4.801889, 0, 0, 0, 1, 1,
-0.5841151, -1.059124, -2.859357, 0, 0, 0, 1, 1,
-0.5826342, 0.5359631, -1.076567, 1, 1, 1, 1, 1,
-0.5806692, -0.4008606, -2.902958, 1, 1, 1, 1, 1,
-0.5784947, -0.1050693, -1.648541, 1, 1, 1, 1, 1,
-0.5758405, -2.327894, -2.96771, 1, 1, 1, 1, 1,
-0.574312, 1.187263, -1.11632, 1, 1, 1, 1, 1,
-0.5729218, 0.03278843, -2.06928, 1, 1, 1, 1, 1,
-0.5607139, 1.364678, 0.7563668, 1, 1, 1, 1, 1,
-0.5605016, 1.094009, 0.157658, 1, 1, 1, 1, 1,
-0.5569748, -0.8613063, -2.649129, 1, 1, 1, 1, 1,
-0.5516014, -0.2349968, -1.430834, 1, 1, 1, 1, 1,
-0.5462018, 2.609565, 0.4711797, 1, 1, 1, 1, 1,
-0.545123, 0.5602186, -0.4560408, 1, 1, 1, 1, 1,
-0.5436858, -0.28768, -1.667316, 1, 1, 1, 1, 1,
-0.5413913, -0.02267641, -1.765303, 1, 1, 1, 1, 1,
-0.5407835, -0.4546114, -3.364614, 1, 1, 1, 1, 1,
-0.5234937, 1.443959, -0.7761414, 0, 0, 1, 1, 1,
-0.5083219, 0.02544305, -1.746818, 1, 0, 0, 1, 1,
-0.5076255, 1.928793, 2.207184, 1, 0, 0, 1, 1,
-0.5073841, -0.9628559, -1.387656, 1, 0, 0, 1, 1,
-0.498893, -0.4906293, -2.035422, 1, 0, 0, 1, 1,
-0.4981883, -2.664479, -2.720986, 1, 0, 0, 1, 1,
-0.498133, 1.099312, -0.3686253, 0, 0, 0, 1, 1,
-0.4956897, -1.077523, -1.278976, 0, 0, 0, 1, 1,
-0.4904003, -0.30343, -1.794976, 0, 0, 0, 1, 1,
-0.4839115, 1.835479, -2.472799, 0, 0, 0, 1, 1,
-0.4798636, 0.5261142, -1.35877, 0, 0, 0, 1, 1,
-0.4795323, -0.1769147, -2.328369, 0, 0, 0, 1, 1,
-0.4783983, 0.2192205, -0.9392697, 0, 0, 0, 1, 1,
-0.4773888, -0.5845651, -2.534278, 1, 1, 1, 1, 1,
-0.4749607, -1.546447, -2.816403, 1, 1, 1, 1, 1,
-0.4749408, -0.9956068, -3.876413, 1, 1, 1, 1, 1,
-0.4715808, -0.4429044, -3.288625, 1, 1, 1, 1, 1,
-0.4712891, -0.8408054, -3.303707, 1, 1, 1, 1, 1,
-0.4692836, -0.1371025, -1.618164, 1, 1, 1, 1, 1,
-0.4670092, -0.7091573, -2.385949, 1, 1, 1, 1, 1,
-0.4565878, -0.770545, -2.131503, 1, 1, 1, 1, 1,
-0.4515727, -1.484234, -2.258847, 1, 1, 1, 1, 1,
-0.4477188, 0.8561924, 1.029863, 1, 1, 1, 1, 1,
-0.4464875, -0.8555489, -3.891706, 1, 1, 1, 1, 1,
-0.4428042, -1.027254, -1.675969, 1, 1, 1, 1, 1,
-0.430781, -0.495268, -2.850436, 1, 1, 1, 1, 1,
-0.4284696, 0.7985166, -0.2471645, 1, 1, 1, 1, 1,
-0.4273826, 0.03505451, -0.4081652, 1, 1, 1, 1, 1,
-0.4257332, -0.2849447, -2.936746, 0, 0, 1, 1, 1,
-0.415498, 0.2495646, -0.1653704, 1, 0, 0, 1, 1,
-0.4111849, 1.608338, 1.346525, 1, 0, 0, 1, 1,
-0.4109834, 0.9197928, -2.331642, 1, 0, 0, 1, 1,
-0.4040871, 0.8205062, -2.030059, 1, 0, 0, 1, 1,
-0.401755, -0.06952897, -2.943474, 1, 0, 0, 1, 1,
-0.4014612, -2.234738, -1.120801, 0, 0, 0, 1, 1,
-0.3960835, -2.067715, -2.725896, 0, 0, 0, 1, 1,
-0.3937746, -1.085166, -2.135107, 0, 0, 0, 1, 1,
-0.3894687, 0.2908771, -0.8324955, 0, 0, 0, 1, 1,
-0.3870361, 0.6634484, -1.288905, 0, 0, 0, 1, 1,
-0.3843946, -0.7545618, -2.522395, 0, 0, 0, 1, 1,
-0.383308, 1.761187, -1.352048, 0, 0, 0, 1, 1,
-0.3802316, -0.109024, -1.465959, 1, 1, 1, 1, 1,
-0.3799578, -1.696095, -3.479147, 1, 1, 1, 1, 1,
-0.3797579, -1.120733, -4.916834, 1, 1, 1, 1, 1,
-0.3797427, -0.3182458, -3.64178, 1, 1, 1, 1, 1,
-0.3794469, 1.106806, 1.316638, 1, 1, 1, 1, 1,
-0.3724315, -0.343915, -3.507207, 1, 1, 1, 1, 1,
-0.3696393, 1.423412, -0.5663082, 1, 1, 1, 1, 1,
-0.3650796, -0.6454064, -4.113041, 1, 1, 1, 1, 1,
-0.3642285, 0.1202051, -1.959584, 1, 1, 1, 1, 1,
-0.3629565, -0.9197492, -2.217075, 1, 1, 1, 1, 1,
-0.3585564, 1.396153, 0.04477037, 1, 1, 1, 1, 1,
-0.3556473, -0.6284352, -4.700581, 1, 1, 1, 1, 1,
-0.3532211, 2.018867, -0.1821781, 1, 1, 1, 1, 1,
-0.3529471, 0.4520179, -1.645678, 1, 1, 1, 1, 1,
-0.3510369, 1.126093, -2.461337, 1, 1, 1, 1, 1,
-0.3496857, -0.6829907, -3.006376, 0, 0, 1, 1, 1,
-0.3479405, 0.2769544, -1.760767, 1, 0, 0, 1, 1,
-0.3449082, 0.06614504, -1.599972, 1, 0, 0, 1, 1,
-0.3442347, 0.2132007, -2.675977, 1, 0, 0, 1, 1,
-0.3422116, -0.7286969, -3.190329, 1, 0, 0, 1, 1,
-0.3422003, -0.1858586, -4.399549, 1, 0, 0, 1, 1,
-0.3366581, -1.737973, -1.860049, 0, 0, 0, 1, 1,
-0.3365465, 0.2757876, -2.142979, 0, 0, 0, 1, 1,
-0.3359428, 0.7108924, 0.4579927, 0, 0, 0, 1, 1,
-0.3348118, 0.2147006, -0.1377517, 0, 0, 0, 1, 1,
-0.3346052, -0.002482596, -0.972729, 0, 0, 0, 1, 1,
-0.331744, -1.097329, -1.77103, 0, 0, 0, 1, 1,
-0.3291048, -1.66961, -3.250087, 0, 0, 0, 1, 1,
-0.3284138, 0.2700332, -2.005451, 1, 1, 1, 1, 1,
-0.3281707, 0.9349306, -0.1121459, 1, 1, 1, 1, 1,
-0.3264883, -0.1615954, -2.805928, 1, 1, 1, 1, 1,
-0.3197062, -0.4287467, -1.868922, 1, 1, 1, 1, 1,
-0.3176996, 1.946323, 0.2914347, 1, 1, 1, 1, 1,
-0.3168073, 0.6934961, -0.2683328, 1, 1, 1, 1, 1,
-0.3153372, -0.3513099, -1.603564, 1, 1, 1, 1, 1,
-0.3140936, -0.9008924, -2.187897, 1, 1, 1, 1, 1,
-0.3086189, -1.107334, -3.48377, 1, 1, 1, 1, 1,
-0.2985694, 2.034517, 0.1830318, 1, 1, 1, 1, 1,
-0.2961987, -0.4046241, -2.933503, 1, 1, 1, 1, 1,
-0.2958121, -2.461185, -3.494056, 1, 1, 1, 1, 1,
-0.2956554, 0.8223167, -0.980848, 1, 1, 1, 1, 1,
-0.2914966, -0.380098, -2.292916, 1, 1, 1, 1, 1,
-0.2838621, -0.3981942, -3.798732, 1, 1, 1, 1, 1,
-0.2811675, -0.2928464, -2.446683, 0, 0, 1, 1, 1,
-0.2776662, 0.9076456, -1.004134, 1, 0, 0, 1, 1,
-0.2757852, -0.6810628, -2.255236, 1, 0, 0, 1, 1,
-0.2699386, 0.9336102, -0.6313999, 1, 0, 0, 1, 1,
-0.2686596, 1.774788, 0.5328893, 1, 0, 0, 1, 1,
-0.2657425, 0.5592175, -1.270862, 1, 0, 0, 1, 1,
-0.2655476, 0.5772256, -2.355652, 0, 0, 0, 1, 1,
-0.2609363, -0.69186, -3.182195, 0, 0, 0, 1, 1,
-0.2560651, 1.413499, 0.05237617, 0, 0, 0, 1, 1,
-0.2559881, -0.7377692, -3.943175, 0, 0, 0, 1, 1,
-0.2554924, -0.3706836, -4.178992, 0, 0, 0, 1, 1,
-0.2530535, -0.6447114, -3.788129, 0, 0, 0, 1, 1,
-0.2501851, -1.4682, -3.153225, 0, 0, 0, 1, 1,
-0.2455493, 0.8166266, -1.459425, 1, 1, 1, 1, 1,
-0.2451949, -0.9306331, -2.072164, 1, 1, 1, 1, 1,
-0.2439819, 0.2536856, 0.9747036, 1, 1, 1, 1, 1,
-0.2376503, 1.304139, 0.172033, 1, 1, 1, 1, 1,
-0.2350556, 0.5413514, -0.4086548, 1, 1, 1, 1, 1,
-0.2194965, -1.421999, -2.844003, 1, 1, 1, 1, 1,
-0.2181339, -0.2970125, -4.007979, 1, 1, 1, 1, 1,
-0.2177162, 0.3419976, 0.907671, 1, 1, 1, 1, 1,
-0.2142443, 2.487208, 2.414217, 1, 1, 1, 1, 1,
-0.2094285, 0.7274361, -0.2241527, 1, 1, 1, 1, 1,
-0.2077701, -0.2682572, -2.429248, 1, 1, 1, 1, 1,
-0.1990724, -0.6083741, -3.123765, 1, 1, 1, 1, 1,
-0.1962971, -0.4177524, -2.810376, 1, 1, 1, 1, 1,
-0.1922173, 1.184581, -1.369246, 1, 1, 1, 1, 1,
-0.1920554, -0.8743707, -4.946073, 1, 1, 1, 1, 1,
-0.1851803, 0.5002435, -0.1727534, 0, 0, 1, 1, 1,
-0.1820358, -0.001022787, -1.42093, 1, 0, 0, 1, 1,
-0.1803989, 0.535623, 0.3816465, 1, 0, 0, 1, 1,
-0.1800189, 1.294273, 1.724888, 1, 0, 0, 1, 1,
-0.1769066, 1.963919, -1.375124, 1, 0, 0, 1, 1,
-0.1681449, 0.2515639, 0.7869148, 1, 0, 0, 1, 1,
-0.1681399, -0.4565006, -3.698565, 0, 0, 0, 1, 1,
-0.1664004, 1.341668, -0.9683743, 0, 0, 0, 1, 1,
-0.1582963, 0.6885766, 0.4354375, 0, 0, 0, 1, 1,
-0.1558624, 0.4414762, -0.8394588, 0, 0, 0, 1, 1,
-0.1516589, 0.3680659, 0.7201118, 0, 0, 0, 1, 1,
-0.1509004, 1.12894, 0.5463679, 0, 0, 0, 1, 1,
-0.1473075, -0.7070449, -3.253384, 0, 0, 0, 1, 1,
-0.1464005, 0.6392262, 0.5341211, 1, 1, 1, 1, 1,
-0.1460204, 0.5622505, -0.9794727, 1, 1, 1, 1, 1,
-0.1389556, -0.5496587, -4.600415, 1, 1, 1, 1, 1,
-0.1370636, 0.788973, 0.96623, 1, 1, 1, 1, 1,
-0.1364038, -0.4744055, -5.464784, 1, 1, 1, 1, 1,
-0.1320051, 0.5142953, -0.4441959, 1, 1, 1, 1, 1,
-0.1316339, -0.4308173, -2.350574, 1, 1, 1, 1, 1,
-0.1312199, 0.5230683, 0.06861053, 1, 1, 1, 1, 1,
-0.1299037, -0.4610527, -4.360816, 1, 1, 1, 1, 1,
-0.1280068, 0.6509237, -0.1506198, 1, 1, 1, 1, 1,
-0.1225739, -0.842982, -2.761431, 1, 1, 1, 1, 1,
-0.1218914, 0.388832, 0.5509714, 1, 1, 1, 1, 1,
-0.1218133, -0.4435664, -3.168816, 1, 1, 1, 1, 1,
-0.1205651, 0.09544601, 0.1106638, 1, 1, 1, 1, 1,
-0.1197059, -1.00628, -3.163282, 1, 1, 1, 1, 1,
-0.1167139, -0.1849726, -2.176369, 0, 0, 1, 1, 1,
-0.114978, -2.358298, -3.798342, 1, 0, 0, 1, 1,
-0.1129245, -0.2365762, -3.607396, 1, 0, 0, 1, 1,
-0.1114896, -1.470754, -3.027855, 1, 0, 0, 1, 1,
-0.1084154, -0.321257, -2.546657, 1, 0, 0, 1, 1,
-0.1039189, -1.831861, -2.511858, 1, 0, 0, 1, 1,
-0.1028742, 0.6081757, 0.05711582, 0, 0, 0, 1, 1,
-0.1027769, 1.588476, 0.4116137, 0, 0, 0, 1, 1,
-0.101324, 0.08741695, -0.7117509, 0, 0, 0, 1, 1,
-0.09918825, 0.3179599, 0.2321608, 0, 0, 0, 1, 1,
-0.09821946, -0.7697232, -2.345114, 0, 0, 0, 1, 1,
-0.0960668, -0.08154691, -2.435648, 0, 0, 0, 1, 1,
-0.09542045, -2.273256, -2.475587, 0, 0, 0, 1, 1,
-0.09519984, -0.1542834, -2.734889, 1, 1, 1, 1, 1,
-0.0944437, 2.252124, -0.293049, 1, 1, 1, 1, 1,
-0.08365262, -0.2358363, -4.265205, 1, 1, 1, 1, 1,
-0.08343513, 0.5450698, -0.448537, 1, 1, 1, 1, 1,
-0.08068784, 0.1569805, -1.9161, 1, 1, 1, 1, 1,
-0.08051546, -0.5748021, -3.301893, 1, 1, 1, 1, 1,
-0.07950132, -2.998693, -3.522791, 1, 1, 1, 1, 1,
-0.07733392, 0.2972948, 0.6926174, 1, 1, 1, 1, 1,
-0.07585062, 0.801532, 0.1244054, 1, 1, 1, 1, 1,
-0.0723166, 0.5132549, 0.8750293, 1, 1, 1, 1, 1,
-0.07226709, 0.4249969, 0.3405114, 1, 1, 1, 1, 1,
-0.07153159, 1.28037, -1.035929, 1, 1, 1, 1, 1,
-0.07060226, -0.1091801, -1.977536, 1, 1, 1, 1, 1,
-0.06888206, -0.1514974, -2.814566, 1, 1, 1, 1, 1,
-0.06868552, -0.106838, -4.89494, 1, 1, 1, 1, 1,
-0.06459805, 0.102286, 0.4396745, 0, 0, 1, 1, 1,
-0.0640392, -1.284564, -4.276066, 1, 0, 0, 1, 1,
-0.06280598, -0.294974, -1.21354, 1, 0, 0, 1, 1,
-0.05941471, 0.8675863, 0.06844108, 1, 0, 0, 1, 1,
-0.05682679, 0.5957547, 0.6329077, 1, 0, 0, 1, 1,
-0.0541674, -0.944813, -3.025271, 1, 0, 0, 1, 1,
-0.05366615, -1.172521, -3.016993, 0, 0, 0, 1, 1,
-0.04526426, -0.150457, -1.169632, 0, 0, 0, 1, 1,
-0.04310413, -0.01514238, -1.259661, 0, 0, 0, 1, 1,
-0.04259024, -1.209568, -1.92604, 0, 0, 0, 1, 1,
-0.03499533, -0.8384255, -2.382514, 0, 0, 0, 1, 1,
-0.03478504, 0.3492449, 0.543714, 0, 0, 0, 1, 1,
-0.03349626, 0.4011858, -0.4087811, 0, 0, 0, 1, 1,
-0.03138322, -0.6203222, -0.8030471, 1, 1, 1, 1, 1,
-0.02964371, 0.002483079, 0.4460656, 1, 1, 1, 1, 1,
-0.02839405, -0.5647263, -2.627682, 1, 1, 1, 1, 1,
-0.02830628, 0.562531, 0.3743308, 1, 1, 1, 1, 1,
-0.02805967, -1.923171, -1.218869, 1, 1, 1, 1, 1,
-0.02587835, -1.300464, -2.732571, 1, 1, 1, 1, 1,
-0.02219019, -0.3493725, -2.878481, 1, 1, 1, 1, 1,
-0.02087459, -0.7549031, -2.77895, 1, 1, 1, 1, 1,
-0.0176582, 1.730278, -0.09389636, 1, 1, 1, 1, 1,
-0.0154232, 1.445038, -1.678385, 1, 1, 1, 1, 1,
-0.01295748, 0.1759019, -0.6410913, 1, 1, 1, 1, 1,
-0.007591201, 0.2560845, -0.9851998, 1, 1, 1, 1, 1,
-0.007329206, 0.1956104, -0.2450438, 1, 1, 1, 1, 1,
-0.006746324, 0.8983504, 0.6516147, 1, 1, 1, 1, 1,
-0.005728814, 1.660154, -0.6717536, 1, 1, 1, 1, 1,
-0.004062342, 0.2417765, -0.8361341, 0, 0, 1, 1, 1,
-0.002267963, -0.6224527, -2.991858, 1, 0, 0, 1, 1,
-0.00024378, 0.8814023, 0.2132252, 1, 0, 0, 1, 1,
0.001558141, 0.2486334, -0.8237236, 1, 0, 0, 1, 1,
0.003083369, -0.4735048, 3.408409, 1, 0, 0, 1, 1,
0.003137871, 0.5054523, 0.2640764, 1, 0, 0, 1, 1,
0.003783696, -0.6736293, 4.826429, 0, 0, 0, 1, 1,
0.01223316, -1.163839, 3.761613, 0, 0, 0, 1, 1,
0.01265132, 0.2297881, -0.4453983, 0, 0, 0, 1, 1,
0.01714454, -1.583657, 4.4245, 0, 0, 0, 1, 1,
0.0260769, 0.2282377, 1.661586, 0, 0, 0, 1, 1,
0.02851668, 0.07321764, 2.560359, 0, 0, 0, 1, 1,
0.03006057, -0.569152, 3.042152, 0, 0, 0, 1, 1,
0.03238956, -0.8394586, 2.562912, 1, 1, 1, 1, 1,
0.03353695, 0.02821388, 1.562914, 1, 1, 1, 1, 1,
0.03480808, 0.4362468, 0.9522186, 1, 1, 1, 1, 1,
0.03496267, 0.2289376, 0.5658875, 1, 1, 1, 1, 1,
0.03712374, 0.02570028, 1.876162, 1, 1, 1, 1, 1,
0.03834392, 0.882835, 0.466519, 1, 1, 1, 1, 1,
0.04181259, 0.1633435, 1.243461, 1, 1, 1, 1, 1,
0.04308445, -0.7320294, 2.969825, 1, 1, 1, 1, 1,
0.04439804, -0.09054339, 2.304807, 1, 1, 1, 1, 1,
0.046051, 1.58795, 0.4676089, 1, 1, 1, 1, 1,
0.04626637, -1.377017, 3.768349, 1, 1, 1, 1, 1,
0.05174934, 1.766168, 0.9434548, 1, 1, 1, 1, 1,
0.05244527, 1.031101, -1.39678, 1, 1, 1, 1, 1,
0.05367113, 0.5753128, 1.42526, 1, 1, 1, 1, 1,
0.05779092, 0.8722973, 1.692075, 1, 1, 1, 1, 1,
0.05808891, -0.8928978, 2.111491, 0, 0, 1, 1, 1,
0.05876525, -0.41503, 2.613469, 1, 0, 0, 1, 1,
0.05887138, -0.7312338, 3.177697, 1, 0, 0, 1, 1,
0.06179344, 0.8465934, 0.6113673, 1, 0, 0, 1, 1,
0.06225025, -0.232638, 3.541016, 1, 0, 0, 1, 1,
0.06557172, -2.000959, 3.69044, 1, 0, 0, 1, 1,
0.06986155, 0.08838376, 2.519496, 0, 0, 0, 1, 1,
0.07081309, 0.9380031, 0.4460393, 0, 0, 0, 1, 1,
0.07284969, 1.370795, -0.1740307, 0, 0, 0, 1, 1,
0.07310738, -0.07178754, 4.380704, 0, 0, 0, 1, 1,
0.07854506, -0.6561676, 2.34085, 0, 0, 0, 1, 1,
0.07903636, 0.5653654, 0.9067291, 0, 0, 0, 1, 1,
0.08448253, 0.4838223, 0.7122387, 0, 0, 0, 1, 1,
0.08486652, 1.182896, -0.5469823, 1, 1, 1, 1, 1,
0.08513641, -0.1554421, 3.677913, 1, 1, 1, 1, 1,
0.08581287, -0.3092415, 2.975878, 1, 1, 1, 1, 1,
0.08666744, -0.869279, 2.548863, 1, 1, 1, 1, 1,
0.08854689, 0.1486758, -0.2934326, 1, 1, 1, 1, 1,
0.08918368, -1.127888, 2.895885, 1, 1, 1, 1, 1,
0.09276085, 1.112618, -1.611099, 1, 1, 1, 1, 1,
0.09667357, 0.553074, 1.161089, 1, 1, 1, 1, 1,
0.09842703, -0.448065, 2.829756, 1, 1, 1, 1, 1,
0.1000805, -1.451137, 2.682222, 1, 1, 1, 1, 1,
0.1049256, 0.4275279, -0.6609346, 1, 1, 1, 1, 1,
0.109621, 0.8849091, 0.8788741, 1, 1, 1, 1, 1,
0.1119824, 2.171184, 0.7486965, 1, 1, 1, 1, 1,
0.1245652, 0.8138229, -0.08789767, 1, 1, 1, 1, 1,
0.1298317, -1.600635, 2.8462, 1, 1, 1, 1, 1,
0.1299768, -0.4204034, 4.323567, 0, 0, 1, 1, 1,
0.1308469, -0.1929556, 1.688881, 1, 0, 0, 1, 1,
0.131986, 0.8802104, -0.07693752, 1, 0, 0, 1, 1,
0.1328923, 1.621844, -0.1651074, 1, 0, 0, 1, 1,
0.1351756, -0.004402163, 1.028273, 1, 0, 0, 1, 1,
0.138178, -1.571098, 2.42747, 1, 0, 0, 1, 1,
0.1432605, -0.604223, 3.373548, 0, 0, 0, 1, 1,
0.1438835, 0.870868, -0.1830796, 0, 0, 0, 1, 1,
0.1440169, -0.8183337, 3.638708, 0, 0, 0, 1, 1,
0.144948, 0.17146, -0.254465, 0, 0, 0, 1, 1,
0.1459017, 0.1399204, -0.8025405, 0, 0, 0, 1, 1,
0.1469893, -1.066116, 2.149355, 0, 0, 0, 1, 1,
0.1480668, 0.6565078, 0.6431381, 0, 0, 0, 1, 1,
0.1483502, 3.327243, 1.000748, 1, 1, 1, 1, 1,
0.1547576, 0.8186421, 0.5207328, 1, 1, 1, 1, 1,
0.1558126, 1.189673, -0.6565398, 1, 1, 1, 1, 1,
0.1565995, -0.1283811, 0.3766632, 1, 1, 1, 1, 1,
0.1566896, -1.818189, 3.071517, 1, 1, 1, 1, 1,
0.1688277, -0.7250468, 0.5421993, 1, 1, 1, 1, 1,
0.1771947, 1.761868, -0.3704527, 1, 1, 1, 1, 1,
0.1780082, 0.2124184, 0.8483815, 1, 1, 1, 1, 1,
0.179736, 0.2718709, 2.084497, 1, 1, 1, 1, 1,
0.1858988, 1.085211, -0.3441422, 1, 1, 1, 1, 1,
0.1903488, 1.399588, -1.553543, 1, 1, 1, 1, 1,
0.1906912, 0.2241382, -0.09643675, 1, 1, 1, 1, 1,
0.1955938, 1.183988, -0.02449507, 1, 1, 1, 1, 1,
0.1967185, -0.3055282, 1.896599, 1, 1, 1, 1, 1,
0.2019798, -1.121531, 1.195334, 1, 1, 1, 1, 1,
0.2035089, 1.171355, 0.4751111, 0, 0, 1, 1, 1,
0.2039294, 0.8969959, 0.05872037, 1, 0, 0, 1, 1,
0.2049872, -2.059498, 2.21574, 1, 0, 0, 1, 1,
0.2088207, 0.1796199, 1.574178, 1, 0, 0, 1, 1,
0.2176802, -0.1702122, 1.230839, 1, 0, 0, 1, 1,
0.2191844, 0.7831117, -0.2517802, 1, 0, 0, 1, 1,
0.2198541, 0.1649763, 1.055476, 0, 0, 0, 1, 1,
0.2209127, 0.3431133, -0.6075705, 0, 0, 0, 1, 1,
0.2221015, 0.6684002, 0.691943, 0, 0, 0, 1, 1,
0.2257941, 1.052391, 1.517425, 0, 0, 0, 1, 1,
0.2265222, -0.1032216, 2.659151, 0, 0, 0, 1, 1,
0.2275307, -0.1308821, 1.025419, 0, 0, 0, 1, 1,
0.2281746, 1.73637, 1.035109, 0, 0, 0, 1, 1,
0.2323317, 0.8784305, -1.421832, 1, 1, 1, 1, 1,
0.2362128, -1.299853, 2.970204, 1, 1, 1, 1, 1,
0.2366309, -1.030913, 1.147318, 1, 1, 1, 1, 1,
0.237669, 0.2204663, -0.0516355, 1, 1, 1, 1, 1,
0.2401594, 1.292466, -0.4408068, 1, 1, 1, 1, 1,
0.2440197, -0.581891, 1.778782, 1, 1, 1, 1, 1,
0.244268, -1.043319, 4.771441, 1, 1, 1, 1, 1,
0.2453264, -0.195552, 2.264049, 1, 1, 1, 1, 1,
0.2468906, -1.35698, 3.374009, 1, 1, 1, 1, 1,
0.2484874, -0.8052549, 2.602122, 1, 1, 1, 1, 1,
0.2486964, -0.02854659, 2.331558, 1, 1, 1, 1, 1,
0.2497143, 0.7364472, 0.8901842, 1, 1, 1, 1, 1,
0.2582285, 0.1724448, 1.621723, 1, 1, 1, 1, 1,
0.2592279, -0.8224437, 3.99244, 1, 1, 1, 1, 1,
0.2639731, 1.084613, -0.3871647, 1, 1, 1, 1, 1,
0.2654294, -0.4893477, 3.084076, 0, 0, 1, 1, 1,
0.2670887, 0.365563, 2.850927, 1, 0, 0, 1, 1,
0.2689407, -0.06595756, 0.6285069, 1, 0, 0, 1, 1,
0.2753193, 1.345152, 1.15909, 1, 0, 0, 1, 1,
0.2777222, -0.9319152, 2.331525, 1, 0, 0, 1, 1,
0.2782626, 0.1782385, 1.476458, 1, 0, 0, 1, 1,
0.2794938, -0.5932723, 2.473682, 0, 0, 0, 1, 1,
0.2844205, -0.05230987, 2.135714, 0, 0, 0, 1, 1,
0.2845095, 0.6529368, -0.1927949, 0, 0, 0, 1, 1,
0.2848271, 1.000924, -0.6116322, 0, 0, 0, 1, 1,
0.2854338, 0.1708717, 0.688705, 0, 0, 0, 1, 1,
0.2869778, -0.1589435, 2.255834, 0, 0, 0, 1, 1,
0.291671, -0.5673766, 3.90048, 0, 0, 0, 1, 1,
0.2922236, 1.167314, -0.3849736, 1, 1, 1, 1, 1,
0.2923499, 0.01691231, 3.982368, 1, 1, 1, 1, 1,
0.2937187, 2.197833, -1.102034, 1, 1, 1, 1, 1,
0.2940241, -0.4212954, 2.340042, 1, 1, 1, 1, 1,
0.2955035, -0.0343598, 2.560636, 1, 1, 1, 1, 1,
0.3021827, 0.2429542, 1.145981, 1, 1, 1, 1, 1,
0.3039742, -2.292583, 2.684275, 1, 1, 1, 1, 1,
0.3147406, 0.2902823, -0.1952981, 1, 1, 1, 1, 1,
0.3168985, 0.1868189, -1.120095, 1, 1, 1, 1, 1,
0.317054, 0.1934504, 1.290529, 1, 1, 1, 1, 1,
0.3171901, 0.3554971, -0.6558611, 1, 1, 1, 1, 1,
0.318173, 0.4056101, 0.7119438, 1, 1, 1, 1, 1,
0.3184721, 0.3817582, 1.331594, 1, 1, 1, 1, 1,
0.3186388, -0.3685246, 2.622668, 1, 1, 1, 1, 1,
0.3206027, -1.326597, 3.235682, 1, 1, 1, 1, 1,
0.3223648, -0.5993714, 1.962526, 0, 0, 1, 1, 1,
0.3310041, 0.1273574, 1.622908, 1, 0, 0, 1, 1,
0.3318267, 1.607097, 0.3476617, 1, 0, 0, 1, 1,
0.3339822, -2.969997, 3.598706, 1, 0, 0, 1, 1,
0.3349527, -1.085203, 4.234028, 1, 0, 0, 1, 1,
0.3363375, -0.3011057, 3.367476, 1, 0, 0, 1, 1,
0.3398469, -0.9855149, 2.216105, 0, 0, 0, 1, 1,
0.3413492, 1.360427, -0.2653656, 0, 0, 0, 1, 1,
0.3487988, 1.370349, -0.09300942, 0, 0, 0, 1, 1,
0.3508835, -0.1556362, 2.437179, 0, 0, 0, 1, 1,
0.3515426, -2.487311, 2.838609, 0, 0, 0, 1, 1,
0.3535311, 1.632899, 0.03793224, 0, 0, 0, 1, 1,
0.3548682, -1.654052, 2.821992, 0, 0, 0, 1, 1,
0.3551466, 0.6196871, 0.6121825, 1, 1, 1, 1, 1,
0.3562702, 0.8407647, 0.9562363, 1, 1, 1, 1, 1,
0.3565256, 0.4626439, 0.2589951, 1, 1, 1, 1, 1,
0.3581119, 1.439488, 0.2040965, 1, 1, 1, 1, 1,
0.3634994, -0.5343673, 4.268584, 1, 1, 1, 1, 1,
0.3648601, 1.195547, -0.155423, 1, 1, 1, 1, 1,
0.3707188, 0.3432834, 0.8580523, 1, 1, 1, 1, 1,
0.372329, -0.9108225, 2.649811, 1, 1, 1, 1, 1,
0.3758855, -1.133231, 0.8455015, 1, 1, 1, 1, 1,
0.3809066, -0.688189, 2.624856, 1, 1, 1, 1, 1,
0.3835206, -0.09877383, 1.123765, 1, 1, 1, 1, 1,
0.3867208, -0.3987805, 1.856225, 1, 1, 1, 1, 1,
0.389921, -0.4947176, 0.8876381, 1, 1, 1, 1, 1,
0.3900061, 2.423219, -1.302402, 1, 1, 1, 1, 1,
0.3916838, 0.03326795, 0.7815412, 1, 1, 1, 1, 1,
0.3919532, 1.790061, 0.4164852, 0, 0, 1, 1, 1,
0.3927228, 0.2000934, 2.136391, 1, 0, 0, 1, 1,
0.3969135, 0.4301737, 3.530795, 1, 0, 0, 1, 1,
0.3972684, -1.204148, 2.532306, 1, 0, 0, 1, 1,
0.3990482, 0.7617502, 0.05195132, 1, 0, 0, 1, 1,
0.4011049, 0.03958192, 2.824152, 1, 0, 0, 1, 1,
0.4038509, 0.9746568, -0.1289666, 0, 0, 0, 1, 1,
0.4077742, 0.08920189, 0.9488594, 0, 0, 0, 1, 1,
0.4090734, 0.1228142, 2.214855, 0, 0, 0, 1, 1,
0.4221037, 1.855336, 0.6597608, 0, 0, 0, 1, 1,
0.4238734, -0.4186538, 2.724904, 0, 0, 0, 1, 1,
0.4241104, -0.6150947, 3.479252, 0, 0, 0, 1, 1,
0.424623, 0.3363462, 1.398133, 0, 0, 0, 1, 1,
0.4295595, -0.4900658, 1.817869, 1, 1, 1, 1, 1,
0.4369172, 0.4118282, 0.4730102, 1, 1, 1, 1, 1,
0.4370481, 1.070471, -0.8865939, 1, 1, 1, 1, 1,
0.4383818, 0.5736132, -0.7621986, 1, 1, 1, 1, 1,
0.4398593, -0.2858619, 2.466156, 1, 1, 1, 1, 1,
0.4423109, 0.63725, 2.49718, 1, 1, 1, 1, 1,
0.4428048, 0.5399103, 0.05661765, 1, 1, 1, 1, 1,
0.4449612, -0.4896685, 3.472874, 1, 1, 1, 1, 1,
0.4451044, -0.7942836, 3.401832, 1, 1, 1, 1, 1,
0.4631564, 1.151273, 2.717915, 1, 1, 1, 1, 1,
0.4640654, 0.1231314, 1.259157, 1, 1, 1, 1, 1,
0.4641307, -1.340004, 2.332657, 1, 1, 1, 1, 1,
0.4648671, -0.8904719, 1.276629, 1, 1, 1, 1, 1,
0.4758112, 0.2813081, 0.881478, 1, 1, 1, 1, 1,
0.4760621, 0.3677564, 2.572945, 1, 1, 1, 1, 1,
0.4778586, -0.3035438, 2.185367, 0, 0, 1, 1, 1,
0.4786127, 0.3889075, 1.667443, 1, 0, 0, 1, 1,
0.4859841, 1.004905, 1.304051, 1, 0, 0, 1, 1,
0.4976274, 0.4361863, 0.6406679, 1, 0, 0, 1, 1,
0.5021184, -1.1798, 2.412041, 1, 0, 0, 1, 1,
0.5039535, -0.9472947, 1.990876, 1, 0, 0, 1, 1,
0.5046958, -0.171189, 3.249194, 0, 0, 0, 1, 1,
0.5058004, -0.1550308, 0.8258455, 0, 0, 0, 1, 1,
0.5125306, -0.2630519, 3.476894, 0, 0, 0, 1, 1,
0.5204462, 0.5362603, -1.966028, 0, 0, 0, 1, 1,
0.5205815, 0.330077, 1.06952, 0, 0, 0, 1, 1,
0.524129, 0.8291794, 1.993579, 0, 0, 0, 1, 1,
0.5244794, -0.9911624, 4.401244, 0, 0, 0, 1, 1,
0.529762, -0.1940968, 3.731095, 1, 1, 1, 1, 1,
0.5304679, 0.9307315, 0.5492371, 1, 1, 1, 1, 1,
0.5337886, -0.5045901, 2.741813, 1, 1, 1, 1, 1,
0.5343382, -0.01044212, 2.708802, 1, 1, 1, 1, 1,
0.5359523, 0.7872283, 0.9060358, 1, 1, 1, 1, 1,
0.5395692, -0.2249527, 1.253937, 1, 1, 1, 1, 1,
0.5421659, 0.2271315, 1.75268, 1, 1, 1, 1, 1,
0.5423576, -0.7820331, 3.871163, 1, 1, 1, 1, 1,
0.5425279, -1.219822, 1.059979, 1, 1, 1, 1, 1,
0.5426037, 1.594681, 2.385102, 1, 1, 1, 1, 1,
0.5438042, -1.035482, 3.321341, 1, 1, 1, 1, 1,
0.5446644, 0.008658146, 1.195406, 1, 1, 1, 1, 1,
0.5467542, 0.206074, 1.683337, 1, 1, 1, 1, 1,
0.5472261, -1.665896, 2.301997, 1, 1, 1, 1, 1,
0.5514295, 1.327523, 0.6835291, 1, 1, 1, 1, 1,
0.5519043, 0.1303926, 1.12751, 0, 0, 1, 1, 1,
0.5525469, -1.037956, 3.077709, 1, 0, 0, 1, 1,
0.5547013, -0.8060308, 1.263089, 1, 0, 0, 1, 1,
0.5624703, 0.02836059, 2.691516, 1, 0, 0, 1, 1,
0.5627123, 0.2842242, 3.353442, 1, 0, 0, 1, 1,
0.5627753, -1.432571, 3.0181, 1, 0, 0, 1, 1,
0.5718425, 0.537829, -0.288176, 0, 0, 0, 1, 1,
0.5749214, 1.118614, 2.477159, 0, 0, 0, 1, 1,
0.5761061, 0.244957, 1.714418, 0, 0, 0, 1, 1,
0.5786731, -0.9637834, 1.38712, 0, 0, 0, 1, 1,
0.5824947, 0.2531444, 0.5359859, 0, 0, 0, 1, 1,
0.5840595, -0.4933656, 1.49042, 0, 0, 0, 1, 1,
0.5845201, -1.302579, 3.609497, 0, 0, 0, 1, 1,
0.5847287, 1.054242, -0.375831, 1, 1, 1, 1, 1,
0.5864262, -0.4429354, 3.235635, 1, 1, 1, 1, 1,
0.5874557, -1.17567, 3.663396, 1, 1, 1, 1, 1,
0.5889325, -1.385293, 4.013019, 1, 1, 1, 1, 1,
0.5896919, 1.779544, 0.6640478, 1, 1, 1, 1, 1,
0.5899869, 0.2547731, 0.8683352, 1, 1, 1, 1, 1,
0.5932888, 0.1129073, 1.144169, 1, 1, 1, 1, 1,
0.5976925, 0.1105537, 0.8274545, 1, 1, 1, 1, 1,
0.6004189, -0.2711478, 2.316581, 1, 1, 1, 1, 1,
0.6014816, 1.050904, -0.429775, 1, 1, 1, 1, 1,
0.6015663, -0.8335562, 3.187762, 1, 1, 1, 1, 1,
0.6031799, -0.02639775, 2.127555, 1, 1, 1, 1, 1,
0.6038904, 0.6022609, 0.7780566, 1, 1, 1, 1, 1,
0.6082122, -1.272035, 4.141972, 1, 1, 1, 1, 1,
0.609412, 0.8143468, 1.714239, 1, 1, 1, 1, 1,
0.6104767, -0.7766744, 2.677389, 0, 0, 1, 1, 1,
0.6107504, 1.350028, 0.1623709, 1, 0, 0, 1, 1,
0.6164117, -0.1878369, 3.824149, 1, 0, 0, 1, 1,
0.6193147, 1.649536, -1.189426, 1, 0, 0, 1, 1,
0.6224381, -1.066454, 3.770446, 1, 0, 0, 1, 1,
0.6242727, 0.7959037, 0.8116995, 1, 0, 0, 1, 1,
0.6316524, -1.034722, 3.62778, 0, 0, 0, 1, 1,
0.6373181, -0.4539181, 1.968966, 0, 0, 0, 1, 1,
0.6373968, 0.1352138, 0.8334891, 0, 0, 0, 1, 1,
0.6394797, -2.195171, 2.722419, 0, 0, 0, 1, 1,
0.642534, 0.04734669, 1.212178, 0, 0, 0, 1, 1,
0.6579957, 0.2628753, -0.2931781, 0, 0, 0, 1, 1,
0.6679841, -0.6370682, -0.2088419, 0, 0, 0, 1, 1,
0.6683816, -0.4453575, 3.218343, 1, 1, 1, 1, 1,
0.6700541, -0.7309023, 2.970217, 1, 1, 1, 1, 1,
0.6709144, 1.539571, -0.1573037, 1, 1, 1, 1, 1,
0.6716259, 0.367931, 1.473414, 1, 1, 1, 1, 1,
0.6762735, 0.4083288, 3.345849, 1, 1, 1, 1, 1,
0.677086, 0.3208889, 1.262825, 1, 1, 1, 1, 1,
0.6776374, -1.276942, 2.24352, 1, 1, 1, 1, 1,
0.6804911, 0.9044493, -0.1724771, 1, 1, 1, 1, 1,
0.7015893, 1.104978, 1.012056, 1, 1, 1, 1, 1,
0.7026821, -0.04058228, 1.752135, 1, 1, 1, 1, 1,
0.7029886, -0.06505436, 2.184896, 1, 1, 1, 1, 1,
0.7092006, 1.422187, 1.107862, 1, 1, 1, 1, 1,
0.7110309, -0.6997096, 2.436899, 1, 1, 1, 1, 1,
0.7118439, 0.6881568, 0.8513285, 1, 1, 1, 1, 1,
0.7159478, -0.741459, 2.138534, 1, 1, 1, 1, 1,
0.717038, 0.8899542, 1.569666, 0, 0, 1, 1, 1,
0.7175367, -0.7829142, 1.629422, 1, 0, 0, 1, 1,
0.7175637, -0.232371, 0.9372896, 1, 0, 0, 1, 1,
0.7206698, -0.6588567, -0.2768695, 1, 0, 0, 1, 1,
0.7217811, -1.772725, 1.543396, 1, 0, 0, 1, 1,
0.7349067, 0.4362645, 1.439077, 1, 0, 0, 1, 1,
0.7372279, 1.057398, 3.540622, 0, 0, 0, 1, 1,
0.7412829, 1.299646, 1.325381, 0, 0, 0, 1, 1,
0.7535957, -0.5989384, 2.050033, 0, 0, 0, 1, 1,
0.7555516, -1.71735, 3.970996, 0, 0, 0, 1, 1,
0.7560802, 0.068322, 1.893209, 0, 0, 0, 1, 1,
0.7636881, 0.2497037, 1.868872, 0, 0, 0, 1, 1,
0.7670717, 0.1184741, 0.5111472, 0, 0, 0, 1, 1,
0.7719992, -0.721485, 2.355356, 1, 1, 1, 1, 1,
0.77212, -0.8518812, 0.8338714, 1, 1, 1, 1, 1,
0.772458, -1.027649, 4.922223, 1, 1, 1, 1, 1,
0.7748127, -0.3418035, 2.353502, 1, 1, 1, 1, 1,
0.7775114, 1.471833, 1.627338, 1, 1, 1, 1, 1,
0.7862722, 0.8097669, -0.1225772, 1, 1, 1, 1, 1,
0.7926324, 0.2291657, 3.154768, 1, 1, 1, 1, 1,
0.7947793, 1.224194, 0.6328726, 1, 1, 1, 1, 1,
0.7954029, 0.2750843, -0.3131829, 1, 1, 1, 1, 1,
0.7954411, -0.9377879, 2.349902, 1, 1, 1, 1, 1,
0.8043373, -0.1894092, 3.396842, 1, 1, 1, 1, 1,
0.8046743, 0.3111576, 2.728624, 1, 1, 1, 1, 1,
0.809529, 0.5503236, 1.364429, 1, 1, 1, 1, 1,
0.8096222, 0.5423878, 1.237072, 1, 1, 1, 1, 1,
0.8115849, -1.144574, 3.28245, 1, 1, 1, 1, 1,
0.8120592, -1.589645, 2.440311, 0, 0, 1, 1, 1,
0.8140978, 0.09732378, 1.408873, 1, 0, 0, 1, 1,
0.814478, -1.839713, 3.663634, 1, 0, 0, 1, 1,
0.8174848, -0.2426563, 1.367439, 1, 0, 0, 1, 1,
0.822223, -0.539685, 2.643029, 1, 0, 0, 1, 1,
0.8259751, 0.4401921, 0.1376915, 1, 0, 0, 1, 1,
0.8278936, -0.3156737, 1.388354, 0, 0, 0, 1, 1,
0.8288959, -0.3517252, 1.828338, 0, 0, 0, 1, 1,
0.8404593, 1.223846, 2.112423, 0, 0, 0, 1, 1,
0.8409728, -0.6630977, 0.681537, 0, 0, 0, 1, 1,
0.8432156, 0.5073092, 1.070739, 0, 0, 0, 1, 1,
0.8458727, -0.3007245, 1.229573, 0, 0, 0, 1, 1,
0.8475763, -0.385157, 1.425564, 0, 0, 0, 1, 1,
0.8477784, -0.0225896, 1.395541, 1, 1, 1, 1, 1,
0.8586743, -0.03318163, 1.130272, 1, 1, 1, 1, 1,
0.8636126, 0.8651988, 2.21019, 1, 1, 1, 1, 1,
0.8654948, -0.2617345, 3.7212, 1, 1, 1, 1, 1,
0.8658909, -0.9665206, -0.4162793, 1, 1, 1, 1, 1,
0.8661717, -0.2900611, 1.976564, 1, 1, 1, 1, 1,
0.8738835, 0.7431047, -0.3826063, 1, 1, 1, 1, 1,
0.8948238, 1.071375, 2.381226, 1, 1, 1, 1, 1,
0.9014236, 0.8776679, -0.5800807, 1, 1, 1, 1, 1,
0.9017062, 1.082604, 1.291945, 1, 1, 1, 1, 1,
0.9033098, -0.004102026, 0.4234819, 1, 1, 1, 1, 1,
0.9070758, -0.9861372, 4.089099, 1, 1, 1, 1, 1,
0.9079679, 0.6667435, 2.211555, 1, 1, 1, 1, 1,
0.9084491, 1.205179, -0.3725103, 1, 1, 1, 1, 1,
0.9137893, -1.387102, 2.529953, 1, 1, 1, 1, 1,
0.9143566, -0.4214732, 3.417583, 0, 0, 1, 1, 1,
0.9192314, 0.9554374, 3.672734, 1, 0, 0, 1, 1,
0.9244174, -0.3120004, 0.5060585, 1, 0, 0, 1, 1,
0.9358801, -0.9086354, 2.479578, 1, 0, 0, 1, 1,
0.9381937, 0.108648, 0.6834334, 1, 0, 0, 1, 1,
0.9390547, -0.282982, 1.187466, 1, 0, 0, 1, 1,
0.9398368, 1.88384, 0.2359924, 0, 0, 0, 1, 1,
0.9405221, 1.441453, 1.44281, 0, 0, 0, 1, 1,
0.9442075, 0.7430895, 1.055861, 0, 0, 0, 1, 1,
0.9445947, 0.5585648, 0.6498309, 0, 0, 0, 1, 1,
0.9472398, 0.3167137, 0.9180292, 0, 0, 0, 1, 1,
0.9538567, -0.9788112, 2.528005, 0, 0, 0, 1, 1,
0.9621974, 0.3994435, 0.5370002, 0, 0, 0, 1, 1,
0.9627598, 0.1426819, 1.986764, 1, 1, 1, 1, 1,
0.9683196, 1.120732, 1.868163, 1, 1, 1, 1, 1,
0.9731937, -1.046349, 1.893581, 1, 1, 1, 1, 1,
0.9737408, 0.5751565, -0.4373407, 1, 1, 1, 1, 1,
0.9783818, 0.1880589, 1.632148, 1, 1, 1, 1, 1,
0.985254, -0.452307, 2.039415, 1, 1, 1, 1, 1,
0.9863971, 0.3323548, 0.2431324, 1, 1, 1, 1, 1,
0.9977542, -0.02346335, 3.922699, 1, 1, 1, 1, 1,
0.998411, -0.6321661, 2.227543, 1, 1, 1, 1, 1,
1.008275, 0.317327, 0.7407257, 1, 1, 1, 1, 1,
1.009446, 1.587116, 1.655468, 1, 1, 1, 1, 1,
1.018815, -0.9070383, 3.114039, 1, 1, 1, 1, 1,
1.019022, -1.651291, 1.383364, 1, 1, 1, 1, 1,
1.019331, -1.188121, 4.117065, 1, 1, 1, 1, 1,
1.023968, -0.885602, 1.937135, 1, 1, 1, 1, 1,
1.027351, -0.9451646, 2.111392, 0, 0, 1, 1, 1,
1.030237, -0.2736009, 0.7655817, 1, 0, 0, 1, 1,
1.040498, -1.141942, 1.29587, 1, 0, 0, 1, 1,
1.040747, 0.6194831, 0.4073921, 1, 0, 0, 1, 1,
1.043277, 0.09160753, 1.068287, 1, 0, 0, 1, 1,
1.048772, -0.6054493, 0.8591203, 1, 0, 0, 1, 1,
1.055946, -1.321795, 2.614524, 0, 0, 0, 1, 1,
1.06452, -0.07453693, 2.964565, 0, 0, 0, 1, 1,
1.072487, 0.5760121, -0.6361192, 0, 0, 0, 1, 1,
1.083871, -0.3215083, 0.6541194, 0, 0, 0, 1, 1,
1.08658, -0.7136611, 0.8738418, 0, 0, 0, 1, 1,
1.091772, -0.1826492, 2.001351, 0, 0, 0, 1, 1,
1.09391, 0.5537207, 1.084973, 0, 0, 0, 1, 1,
1.097859, -0.6135089, 3.604627, 1, 1, 1, 1, 1,
1.102908, -1.079781, 2.172153, 1, 1, 1, 1, 1,
1.106995, -0.9054435, 2.750358, 1, 1, 1, 1, 1,
1.111021, -0.3339172, 1.282344, 1, 1, 1, 1, 1,
1.11296, 0.2870583, 1.878916, 1, 1, 1, 1, 1,
1.123439, -1.209271, 2.786008, 1, 1, 1, 1, 1,
1.135399, -0.7185699, 1.754093, 1, 1, 1, 1, 1,
1.136054, 1.632531, -1.389707, 1, 1, 1, 1, 1,
1.166386, -2.629503, 2.437723, 1, 1, 1, 1, 1,
1.170773, -1.047991, 1.757701, 1, 1, 1, 1, 1,
1.179027, -0.8170261, 1.287046, 1, 1, 1, 1, 1,
1.182777, -0.3086793, 2.348625, 1, 1, 1, 1, 1,
1.184871, 0.5497324, 0.5050529, 1, 1, 1, 1, 1,
1.193628, 0.367816, 1.933911, 1, 1, 1, 1, 1,
1.201478, 1.013611, 1.293391, 1, 1, 1, 1, 1,
1.202184, -0.03787709, 1.702176, 0, 0, 1, 1, 1,
1.216536, 0.4917816, 2.531716, 1, 0, 0, 1, 1,
1.217295, 0.6329392, 3.390109, 1, 0, 0, 1, 1,
1.217457, 1.275756, -0.8452095, 1, 0, 0, 1, 1,
1.218656, -0.839814, 1.874634, 1, 0, 0, 1, 1,
1.218795, 0.02884141, 2.72117, 1, 0, 0, 1, 1,
1.219774, -0.5305408, 0.2194708, 0, 0, 0, 1, 1,
1.240398, -1.19381, 1.820931, 0, 0, 0, 1, 1,
1.243976, 0.3883617, 1.135321, 0, 0, 0, 1, 1,
1.244257, -0.1751845, 2.510159, 0, 0, 0, 1, 1,
1.244364, -0.9372813, 2.442871, 0, 0, 0, 1, 1,
1.250625, -0.01650835, 1.680592, 0, 0, 0, 1, 1,
1.253176, 2.114874, 0.4563914, 0, 0, 0, 1, 1,
1.261103, -0.1746362, 2.709914, 1, 1, 1, 1, 1,
1.261907, -1.335973, 2.301973, 1, 1, 1, 1, 1,
1.263507, 0.01061186, 1.06415, 1, 1, 1, 1, 1,
1.274863, -0.1222739, 2.140223, 1, 1, 1, 1, 1,
1.274908, -0.7964008, 2.613208, 1, 1, 1, 1, 1,
1.281002, -1.837716, 3.852259, 1, 1, 1, 1, 1,
1.2816, -0.2714307, 1.143647, 1, 1, 1, 1, 1,
1.284868, 1.551467, 2.513863, 1, 1, 1, 1, 1,
1.285959, 0.2465126, 1.11101, 1, 1, 1, 1, 1,
1.287011, 1.687445, 0.7169868, 1, 1, 1, 1, 1,
1.294873, 0.05751303, 0.1519797, 1, 1, 1, 1, 1,
1.30235, 1.073891, 0.1509968, 1, 1, 1, 1, 1,
1.30384, -2.3542, 1.138581, 1, 1, 1, 1, 1,
1.306417, -0.2548304, 3.394699, 1, 1, 1, 1, 1,
1.307568, -1.173224, 2.110852, 1, 1, 1, 1, 1,
1.311272, 0.3347611, 1.453489, 0, 0, 1, 1, 1,
1.314273, 1.047464, 2.318226, 1, 0, 0, 1, 1,
1.321695, 2.970065, 1.726872, 1, 0, 0, 1, 1,
1.324059, 1.633986, -0.102326, 1, 0, 0, 1, 1,
1.326178, 0.109951, 1.678484, 1, 0, 0, 1, 1,
1.342082, 0.3713913, 1.290532, 1, 0, 0, 1, 1,
1.343529, 0.4317172, 1.600903, 0, 0, 0, 1, 1,
1.344673, 0.6595439, 2.411652, 0, 0, 0, 1, 1,
1.353605, -0.5766948, 2.490954, 0, 0, 0, 1, 1,
1.356906, 0.7788575, 1.656368, 0, 0, 0, 1, 1,
1.364382, -1.633015, 0.4650099, 0, 0, 0, 1, 1,
1.368576, 2.723414, 2.154901, 0, 0, 0, 1, 1,
1.369996, 0.7791636, 1.518912, 0, 0, 0, 1, 1,
1.379405, -0.7850327, 4.576399, 1, 1, 1, 1, 1,
1.391238, 0.1825717, 1.522617, 1, 1, 1, 1, 1,
1.392149, 0.2419524, 0.825797, 1, 1, 1, 1, 1,
1.393994, -0.1023834, 1.181138, 1, 1, 1, 1, 1,
1.41745, -0.1286176, 1.223007, 1, 1, 1, 1, 1,
1.429554, 1.635541, 0.6884182, 1, 1, 1, 1, 1,
1.451998, 1.446533, 1.174671, 1, 1, 1, 1, 1,
1.465298, -0.698267, 2.196233, 1, 1, 1, 1, 1,
1.469511, 1.424421, 1.214746, 1, 1, 1, 1, 1,
1.475122, -0.9545317, 3.497234, 1, 1, 1, 1, 1,
1.490438, -0.8607916, 1.724828, 1, 1, 1, 1, 1,
1.491079, -1.198063, 1.743077, 1, 1, 1, 1, 1,
1.495109, 0.5991144, 1.563675, 1, 1, 1, 1, 1,
1.499305, 0.1926026, 3.287414, 1, 1, 1, 1, 1,
1.510302, -0.8138952, 2.496064, 1, 1, 1, 1, 1,
1.51061, -0.2146634, 1.364952, 0, 0, 1, 1, 1,
1.513224, -1.424766, 1.767762, 1, 0, 0, 1, 1,
1.513411, 0.6723169, 1.330527, 1, 0, 0, 1, 1,
1.517813, -0.3670309, 1.425193, 1, 0, 0, 1, 1,
1.517841, -0.2558675, -0.6806794, 1, 0, 0, 1, 1,
1.519214, 0.6997213, 1.030419, 1, 0, 0, 1, 1,
1.519391, -0.5365978, 0.3146088, 0, 0, 0, 1, 1,
1.528935, 1.381147, 1.784414, 0, 0, 0, 1, 1,
1.531652, -0.5899665, 2.705451, 0, 0, 0, 1, 1,
1.533018, 0.2192081, 1.134795, 0, 0, 0, 1, 1,
1.533155, -1.348204, 1.899989, 0, 0, 0, 1, 1,
1.53346, -0.1919366, 0.7311903, 0, 0, 0, 1, 1,
1.545199, -0.1960598, 1.997723, 0, 0, 0, 1, 1,
1.546853, 0.1474038, 2.620589, 1, 1, 1, 1, 1,
1.56705, -0.4431559, -0.02471772, 1, 1, 1, 1, 1,
1.567202, 0.5085061, 0.7644075, 1, 1, 1, 1, 1,
1.574607, 1.348065, -0.4974197, 1, 1, 1, 1, 1,
1.577984, -0.3471035, 2.320141, 1, 1, 1, 1, 1,
1.582624, -1.026155, 0.7565536, 1, 1, 1, 1, 1,
1.592316, 0.3302563, 1.923503, 1, 1, 1, 1, 1,
1.608957, 0.376632, 0.6986101, 1, 1, 1, 1, 1,
1.619916, 0.1382227, 1.946118, 1, 1, 1, 1, 1,
1.627382, -0.06983873, -0.01223771, 1, 1, 1, 1, 1,
1.633137, -0.6662168, 2.539846, 1, 1, 1, 1, 1,
1.63882, 1.052993, 1.561253, 1, 1, 1, 1, 1,
1.647281, 0.5828705, 0.02068499, 1, 1, 1, 1, 1,
1.649455, 0.2359412, 2.609819, 1, 1, 1, 1, 1,
1.680605, -0.3022111, 2.656296, 1, 1, 1, 1, 1,
1.682453, 0.2323221, 0.7032947, 0, 0, 1, 1, 1,
1.686427, -0.4640359, 1.185195, 1, 0, 0, 1, 1,
1.689549, -0.718127, 1.674294, 1, 0, 0, 1, 1,
1.692634, -0.6862441, 1.87015, 1, 0, 0, 1, 1,
1.696097, 0.4361272, 0.7742731, 1, 0, 0, 1, 1,
1.698143, 0.1064911, 1.797796, 1, 0, 0, 1, 1,
1.698526, 0.7003311, 1.31606, 0, 0, 0, 1, 1,
1.736644, -0.3036516, 2.250635, 0, 0, 0, 1, 1,
1.740615, 0.1411617, 2.136251, 0, 0, 0, 1, 1,
1.755617, 0.5665231, -0.2152067, 0, 0, 0, 1, 1,
1.759601, 0.7346786, 0.9253839, 0, 0, 0, 1, 1,
1.801464, -0.09798431, 0.6782663, 0, 0, 0, 1, 1,
1.811313, 0.8580549, 1.652109, 0, 0, 0, 1, 1,
1.858981, -0.754986, 2.30501, 1, 1, 1, 1, 1,
1.862033, 0.6280367, 2.578152, 1, 1, 1, 1, 1,
1.865632, 0.8036648, -0.963298, 1, 1, 1, 1, 1,
1.867878, -2.015057, 2.572626, 1, 1, 1, 1, 1,
1.88645, 1.330088, 1.614502, 1, 1, 1, 1, 1,
1.893004, 0.5299829, -0.287052, 1, 1, 1, 1, 1,
1.93182, 0.1768524, 2.47617, 1, 1, 1, 1, 1,
1.94163, -1.11007, 1.853657, 1, 1, 1, 1, 1,
1.941648, 1.266516, -0.928136, 1, 1, 1, 1, 1,
1.980838, 0.9111529, 1.231642, 1, 1, 1, 1, 1,
2.027964, -0.8933123, 2.381532, 1, 1, 1, 1, 1,
2.089278, -0.3672874, 2.893463, 1, 1, 1, 1, 1,
2.10898, -0.582978, 2.157741, 1, 1, 1, 1, 1,
2.114236, -1.121507, 2.647055, 1, 1, 1, 1, 1,
2.13575, 0.01392952, 1.572803, 1, 1, 1, 1, 1,
2.160966, 0.8360236, 1.363687, 0, 0, 1, 1, 1,
2.162506, 0.0174945, 1.566287, 1, 0, 0, 1, 1,
2.173338, -0.7289504, 0.9582646, 1, 0, 0, 1, 1,
2.173857, -0.1103807, 4.915279, 1, 0, 0, 1, 1,
2.217141, 2.233167, -1.831563, 1, 0, 0, 1, 1,
2.220961, -0.6667163, 3.148688, 1, 0, 0, 1, 1,
2.231342, 2.06098, 0.879864, 0, 0, 0, 1, 1,
2.232722, 0.1977078, 0.03160521, 0, 0, 0, 1, 1,
2.255153, -0.296163, 2.174697, 0, 0, 0, 1, 1,
2.261744, 1.536574, 1.392596, 0, 0, 0, 1, 1,
2.276916, -1.018881, 2.548626, 0, 0, 0, 1, 1,
2.323179, -0.4498162, 0.2603165, 0, 0, 0, 1, 1,
2.445244, -0.4508756, 1.948622, 0, 0, 0, 1, 1,
2.465311, 1.779423, 1.862776, 1, 1, 1, 1, 1,
2.473073, 1.64989, 1.101296, 1, 1, 1, 1, 1,
2.477076, -1.000891, 0.8901479, 1, 1, 1, 1, 1,
2.480398, 0.5109401, 1.448233, 1, 1, 1, 1, 1,
2.519718, -0.1684371, 1.023668, 1, 1, 1, 1, 1,
2.612962, 0.5074295, 0.5099338, 1, 1, 1, 1, 1,
3.225965, -1.058491, 0.8770899, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.420949;
var distance = 33.09068;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.02348185, -0.1642754, 0.2712805 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.09068);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
