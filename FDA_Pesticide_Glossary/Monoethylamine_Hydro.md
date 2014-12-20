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
-4.202165, -1.582195, -3.129865, 1, 0, 0, 1,
-2.764383, -0.09506169, -1.219343, 1, 0.007843138, 0, 1,
-2.75661, -0.5690635, -1.326165, 1, 0.01176471, 0, 1,
-2.750781, 0.868804, -2.215698, 1, 0.01960784, 0, 1,
-2.696219, -0.5526479, -2.51552, 1, 0.02352941, 0, 1,
-2.682447, 0.7490172, -0.6403649, 1, 0.03137255, 0, 1,
-2.496505, 0.6969699, -0.1348773, 1, 0.03529412, 0, 1,
-2.482817, 0.5022816, -0.9298629, 1, 0.04313726, 0, 1,
-2.435705, -0.7146077, -2.559218, 1, 0.04705882, 0, 1,
-2.430577, -0.004709674, -1.851162, 1, 0.05490196, 0, 1,
-2.37271, -1.635526, -2.490669, 1, 0.05882353, 0, 1,
-2.349223, -1.331731, -2.531016, 1, 0.06666667, 0, 1,
-2.345704, -1.335743, -3.329527, 1, 0.07058824, 0, 1,
-2.33989, 0.4628534, -2.466979, 1, 0.07843138, 0, 1,
-2.329278, -1.764194, -3.006645, 1, 0.08235294, 0, 1,
-2.313102, 0.04357067, 0.7819953, 1, 0.09019608, 0, 1,
-2.273674, -0.09458783, -2.568215, 1, 0.09411765, 0, 1,
-2.216531, 0.4747175, 0.2677664, 1, 0.1019608, 0, 1,
-2.196629, -0.405209, -2.072461, 1, 0.1098039, 0, 1,
-2.188888, -0.6561351, -1.57969, 1, 0.1137255, 0, 1,
-2.111891, -0.02245683, -1.287926, 1, 0.1215686, 0, 1,
-2.086503, 1.96242, 0.2801699, 1, 0.1254902, 0, 1,
-2.082971, -0.6001166, -1.105821, 1, 0.1333333, 0, 1,
-2.059198, -0.8315161, -1.455835, 1, 0.1372549, 0, 1,
-2.029854, -0.4595858, 0.01148468, 1, 0.145098, 0, 1,
-1.97123, 0.6181139, -2.013202, 1, 0.1490196, 0, 1,
-1.939784, 0.6449819, -1.307612, 1, 0.1568628, 0, 1,
-1.928171, -0.8446678, -2.010275, 1, 0.1607843, 0, 1,
-1.919282, -1.356499, -2.533329, 1, 0.1686275, 0, 1,
-1.880164, 0.4549134, -3.504768, 1, 0.172549, 0, 1,
-1.863578, -0.3339019, -3.330955, 1, 0.1803922, 0, 1,
-1.85619, -0.6556974, -2.387667, 1, 0.1843137, 0, 1,
-1.855418, -0.6200553, -2.769114, 1, 0.1921569, 0, 1,
-1.85158, -1.231476, -2.29626, 1, 0.1960784, 0, 1,
-1.843936, 0.6525952, -1.030926, 1, 0.2039216, 0, 1,
-1.833516, -1.090894, -2.193748, 1, 0.2117647, 0, 1,
-1.830007, 0.8673108, 0.05214949, 1, 0.2156863, 0, 1,
-1.829772, -0.01158992, -3.39835, 1, 0.2235294, 0, 1,
-1.827129, 0.4730784, -0.3391082, 1, 0.227451, 0, 1,
-1.817889, -0.3038054, -3.425129, 1, 0.2352941, 0, 1,
-1.786201, -1.378973, -3.310069, 1, 0.2392157, 0, 1,
-1.78591, 0.07722275, -1.010578, 1, 0.2470588, 0, 1,
-1.774675, 1.086712, -0.03272986, 1, 0.2509804, 0, 1,
-1.771595, -0.6620528, -3.465774, 1, 0.2588235, 0, 1,
-1.770156, -2.690579, -2.780018, 1, 0.2627451, 0, 1,
-1.754302, -0.4936266, -1.924298, 1, 0.2705882, 0, 1,
-1.745651, 0.8173808, 0.9203176, 1, 0.2745098, 0, 1,
-1.740485, 0.4426616, -1.347287, 1, 0.282353, 0, 1,
-1.73671, 1.365127, -1.05283, 1, 0.2862745, 0, 1,
-1.735042, -0.7003696, -1.552681, 1, 0.2941177, 0, 1,
-1.720448, 0.3952367, -1.38552, 1, 0.3019608, 0, 1,
-1.699071, -0.09252605, -1.890151, 1, 0.3058824, 0, 1,
-1.698344, 0.5756815, -1.226964, 1, 0.3137255, 0, 1,
-1.692214, 3.287608, -2.375294, 1, 0.3176471, 0, 1,
-1.676176, -0.5442569, -4.612644, 1, 0.3254902, 0, 1,
-1.675001, -0.0760524, 0.703346, 1, 0.3294118, 0, 1,
-1.660593, 0.6245295, -1.68666, 1, 0.3372549, 0, 1,
-1.648306, -0.3022277, -2.016899, 1, 0.3411765, 0, 1,
-1.639179, 0.6823087, -1.261153, 1, 0.3490196, 0, 1,
-1.621341, -0.2341795, -0.8608676, 1, 0.3529412, 0, 1,
-1.61423, -0.01803753, 0.009111921, 1, 0.3607843, 0, 1,
-1.610524, -0.9507625, -2.851772, 1, 0.3647059, 0, 1,
-1.591858, -0.06562635, -1.62403, 1, 0.372549, 0, 1,
-1.566602, -1.263999, -1.756644, 1, 0.3764706, 0, 1,
-1.556709, -1.093881, -2.05641, 1, 0.3843137, 0, 1,
-1.536897, -1.480654, -4.129675, 1, 0.3882353, 0, 1,
-1.533725, -1.256683, -2.450264, 1, 0.3960784, 0, 1,
-1.529065, 0.2952684, -1.780964, 1, 0.4039216, 0, 1,
-1.527064, 0.07841851, -0.8374336, 1, 0.4078431, 0, 1,
-1.518065, -1.705254, -5.148237, 1, 0.4156863, 0, 1,
-1.508205, -1.342944, -1.216053, 1, 0.4196078, 0, 1,
-1.489038, 0.009895195, -0.8616091, 1, 0.427451, 0, 1,
-1.486511, -1.069201, -2.984744, 1, 0.4313726, 0, 1,
-1.470188, -1.567898, -1.730277, 1, 0.4392157, 0, 1,
-1.469276, 0.5990945, -2.292045, 1, 0.4431373, 0, 1,
-1.464201, -0.3051852, 0.7093079, 1, 0.4509804, 0, 1,
-1.459612, 1.008559, -0.6536493, 1, 0.454902, 0, 1,
-1.43528, 0.4284898, -3.188646, 1, 0.4627451, 0, 1,
-1.435093, 0.3481852, 0.007883721, 1, 0.4666667, 0, 1,
-1.432774, 0.06382541, -1.841737, 1, 0.4745098, 0, 1,
-1.426353, -0.5277523, -1.00154, 1, 0.4784314, 0, 1,
-1.423324, -0.9470308, -2.438892, 1, 0.4862745, 0, 1,
-1.419265, 1.153713, -1.299571, 1, 0.4901961, 0, 1,
-1.416591, -0.4373116, -2.165506, 1, 0.4980392, 0, 1,
-1.405836, -0.5823072, -1.817722, 1, 0.5058824, 0, 1,
-1.404586, -0.04982514, -1.690344, 1, 0.509804, 0, 1,
-1.401355, 0.3736091, -0.6215991, 1, 0.5176471, 0, 1,
-1.400102, -0.2143309, -3.116262, 1, 0.5215687, 0, 1,
-1.390078, -0.9508083, -3.135075, 1, 0.5294118, 0, 1,
-1.380232, -0.3204198, -2.1141, 1, 0.5333334, 0, 1,
-1.374544, -0.9878185, -2.932607, 1, 0.5411765, 0, 1,
-1.373957, -0.9998561, -3.227339, 1, 0.5450981, 0, 1,
-1.341727, -1.283949, -1.795552, 1, 0.5529412, 0, 1,
-1.328061, 0.9013684, -2.782084, 1, 0.5568628, 0, 1,
-1.327399, -1.735367, -2.539405, 1, 0.5647059, 0, 1,
-1.326774, 1.666693, -0.4618798, 1, 0.5686275, 0, 1,
-1.326054, 1.886983, -0.9231976, 1, 0.5764706, 0, 1,
-1.321665, -0.3870696, -1.662972, 1, 0.5803922, 0, 1,
-1.320657, 0.7396463, -2.024092, 1, 0.5882353, 0, 1,
-1.318687, -0.05169819, -0.806516, 1, 0.5921569, 0, 1,
-1.318582, 0.7198713, -1.136766, 1, 0.6, 0, 1,
-1.315066, -0.1288804, -3.438003, 1, 0.6078432, 0, 1,
-1.302145, -0.2106262, -2.630051, 1, 0.6117647, 0, 1,
-1.299043, 0.1464685, -0.4302661, 1, 0.6196079, 0, 1,
-1.297626, 1.070188, 0.008459293, 1, 0.6235294, 0, 1,
-1.297393, 0.3892064, -0.4356523, 1, 0.6313726, 0, 1,
-1.291481, -0.6686273, 0.5646302, 1, 0.6352941, 0, 1,
-1.287217, -1.19432, -1.726445, 1, 0.6431373, 0, 1,
-1.280455, -0.2714803, -2.518743, 1, 0.6470588, 0, 1,
-1.278444, -0.2621977, -0.2506169, 1, 0.654902, 0, 1,
-1.274932, -1.566609, -2.083483, 1, 0.6588235, 0, 1,
-1.261987, -1.076658, -2.036493, 1, 0.6666667, 0, 1,
-1.258168, 0.6452473, -0.9039463, 1, 0.6705883, 0, 1,
-1.234843, -0.1462989, -1.694577, 1, 0.6784314, 0, 1,
-1.230507, -1.685109, -2.31197, 1, 0.682353, 0, 1,
-1.21779, 1.384457, -0.3391694, 1, 0.6901961, 0, 1,
-1.210084, -0.2856286, -2.754296, 1, 0.6941177, 0, 1,
-1.207738, 0.4031675, 0.1335322, 1, 0.7019608, 0, 1,
-1.205575, -0.7420493, -3.154092, 1, 0.7098039, 0, 1,
-1.205189, -1.078265, -2.292544, 1, 0.7137255, 0, 1,
-1.196275, 0.2167419, -2.017276, 1, 0.7215686, 0, 1,
-1.194789, -1.877243, -3.781441, 1, 0.7254902, 0, 1,
-1.184493, 0.5272686, -0.9882092, 1, 0.7333333, 0, 1,
-1.182686, 0.3060787, -1.052135, 1, 0.7372549, 0, 1,
-1.180339, -1.61419, -2.819385, 1, 0.7450981, 0, 1,
-1.179311, 0.1066715, -1.610056, 1, 0.7490196, 0, 1,
-1.160463, -0.1700908, -0.9252923, 1, 0.7568628, 0, 1,
-1.150837, 0.7482218, -1.061954, 1, 0.7607843, 0, 1,
-1.148801, 0.8738561, -0.4758244, 1, 0.7686275, 0, 1,
-1.142837, -0.05831259, -2.827754, 1, 0.772549, 0, 1,
-1.131072, 0.4898122, -2.074668, 1, 0.7803922, 0, 1,
-1.129196, 0.261943, -2.079483, 1, 0.7843137, 0, 1,
-1.126352, -0.1121187, -1.695364, 1, 0.7921569, 0, 1,
-1.124601, -0.5019054, 0.4218867, 1, 0.7960784, 0, 1,
-1.120874, -1.368047, -1.693387, 1, 0.8039216, 0, 1,
-1.109332, -0.4765875, -1.955158, 1, 0.8117647, 0, 1,
-1.099738, 1.007768, 0.5884201, 1, 0.8156863, 0, 1,
-1.083117, 0.9348505, 0.4253164, 1, 0.8235294, 0, 1,
-1.082532, -0.2723688, -1.954595, 1, 0.827451, 0, 1,
-1.080647, 0.07785675, -3.920355, 1, 0.8352941, 0, 1,
-1.079345, -0.8917896, -2.529876, 1, 0.8392157, 0, 1,
-1.072292, 0.8427995, -0.9583664, 1, 0.8470588, 0, 1,
-1.071777, 0.3178588, -1.21779, 1, 0.8509804, 0, 1,
-1.071187, -0.6302235, -2.712528, 1, 0.8588235, 0, 1,
-1.066143, 0.6152241, -0.8151188, 1, 0.8627451, 0, 1,
-1.062241, -2.058327, -2.873399, 1, 0.8705882, 0, 1,
-1.059631, 0.5144597, -1.956276, 1, 0.8745098, 0, 1,
-1.058902, -0.09532603, -0.7879828, 1, 0.8823529, 0, 1,
-1.054713, 1.650658, -1.740714, 1, 0.8862745, 0, 1,
-1.050487, -0.8105218, -2.852608, 1, 0.8941177, 0, 1,
-1.047832, 0.1803488, -1.753226, 1, 0.8980392, 0, 1,
-1.044845, 0.7343156, -1.947772, 1, 0.9058824, 0, 1,
-1.04438, 1.090037, -1.475029, 1, 0.9137255, 0, 1,
-1.042388, -1.327475, -2.149101, 1, 0.9176471, 0, 1,
-1.037809, -1.295661, -4.102441, 1, 0.9254902, 0, 1,
-1.033986, 1.186129, -0.5636188, 1, 0.9294118, 0, 1,
-1.026353, -0.8959579, -1.274069, 1, 0.9372549, 0, 1,
-1.013948, -0.3676388, -2.032525, 1, 0.9411765, 0, 1,
-1.013227, -0.1779536, -3.13344, 1, 0.9490196, 0, 1,
-1.013052, 0.7527826, 0.8955979, 1, 0.9529412, 0, 1,
-1.012201, -0.1136789, -1.49855, 1, 0.9607843, 0, 1,
-1.008994, -1.633485, -2.850378, 1, 0.9647059, 0, 1,
-1.004705, 0.7021575, -1.067682, 1, 0.972549, 0, 1,
-0.9980842, -0.3543829, -1.891608, 1, 0.9764706, 0, 1,
-0.9921632, -1.484571, -4.010919, 1, 0.9843137, 0, 1,
-0.9913539, 1.286715, 0.08500297, 1, 0.9882353, 0, 1,
-0.9890244, 0.09995184, -0.9928852, 1, 0.9960784, 0, 1,
-0.9857204, 0.1896647, -1.212479, 0.9960784, 1, 0, 1,
-0.9789501, -0.1371056, -1.21585, 0.9921569, 1, 0, 1,
-0.9739841, 0.0550432, 0.4115565, 0.9843137, 1, 0, 1,
-0.9735682, 1.092036, -1.29419, 0.9803922, 1, 0, 1,
-0.9710571, 0.2455089, -0.02997917, 0.972549, 1, 0, 1,
-0.9674684, -0.263686, -0.1981431, 0.9686275, 1, 0, 1,
-0.9668351, -1.854837, -3.337554, 0.9607843, 1, 0, 1,
-0.9611585, -1.339161, -1.173744, 0.9568627, 1, 0, 1,
-0.959589, 0.4258207, -0.3121195, 0.9490196, 1, 0, 1,
-0.9572707, 1.023658, -1.244639, 0.945098, 1, 0, 1,
-0.946126, -0.3694987, -2.17711, 0.9372549, 1, 0, 1,
-0.945416, -1.055786, -3.160499, 0.9333333, 1, 0, 1,
-0.9356984, -0.1861891, -1.584908, 0.9254902, 1, 0, 1,
-0.9355348, 0.06975415, -0.7316729, 0.9215686, 1, 0, 1,
-0.9283931, 0.1178189, -1.056104, 0.9137255, 1, 0, 1,
-0.9274718, -1.189588, -4.142977, 0.9098039, 1, 0, 1,
-0.9271652, -1.821453, -3.072807, 0.9019608, 1, 0, 1,
-0.9239334, -0.07440832, -1.997583, 0.8941177, 1, 0, 1,
-0.9216281, -0.4354755, -1.924736, 0.8901961, 1, 0, 1,
-0.9209641, -1.031528, -1.480618, 0.8823529, 1, 0, 1,
-0.9151809, -1.073287, -1.76125, 0.8784314, 1, 0, 1,
-0.9101058, 1.177399, -0.5897627, 0.8705882, 1, 0, 1,
-0.9095452, 0.7908553, -1.845319, 0.8666667, 1, 0, 1,
-0.9070404, -0.0518021, -1.716972, 0.8588235, 1, 0, 1,
-0.9061923, 0.7368342, 1.153276, 0.854902, 1, 0, 1,
-0.9022294, 0.8998086, -1.93867, 0.8470588, 1, 0, 1,
-0.9002647, -1.861855, -2.542296, 0.8431373, 1, 0, 1,
-0.8994722, 0.03789033, -2.673122, 0.8352941, 1, 0, 1,
-0.8993218, -0.613587, -0.4781425, 0.8313726, 1, 0, 1,
-0.8890643, -1.176848, -3.008358, 0.8235294, 1, 0, 1,
-0.8824061, 1.46338, 1.947003, 0.8196079, 1, 0, 1,
-0.8812868, -0.1130613, -1.416937, 0.8117647, 1, 0, 1,
-0.8808101, 0.6788091, -0.7817045, 0.8078431, 1, 0, 1,
-0.8764634, 0.5010417, -1.236584, 0.8, 1, 0, 1,
-0.876283, 0.8092134, 0.4569156, 0.7921569, 1, 0, 1,
-0.875261, -0.1974383, -0.6199128, 0.7882353, 1, 0, 1,
-0.8733126, -0.1084215, -3.423158, 0.7803922, 1, 0, 1,
-0.8641397, 1.029385, -0.3865177, 0.7764706, 1, 0, 1,
-0.8619018, 0.3881467, 0.5978808, 0.7686275, 1, 0, 1,
-0.8595002, 2.658345, 0.7860465, 0.7647059, 1, 0, 1,
-0.8564582, -1.475319, -1.677534, 0.7568628, 1, 0, 1,
-0.8544037, -0.9290138, -4.848509, 0.7529412, 1, 0, 1,
-0.8533285, 0.1099844, -0.05043467, 0.7450981, 1, 0, 1,
-0.8529343, 2.154321, -1.406977, 0.7411765, 1, 0, 1,
-0.8512174, -0.1770618, -2.926982, 0.7333333, 1, 0, 1,
-0.8437008, 0.2539804, -1.430768, 0.7294118, 1, 0, 1,
-0.8383388, -1.08268, -2.009652, 0.7215686, 1, 0, 1,
-0.8354025, 1.261393, -0.753583, 0.7176471, 1, 0, 1,
-0.8350213, 0.5735222, -0.2451812, 0.7098039, 1, 0, 1,
-0.8349403, 1.244839, -1.211468, 0.7058824, 1, 0, 1,
-0.8323138, 0.2978728, -0.4277386, 0.6980392, 1, 0, 1,
-0.8292506, -0.1048527, -0.5412591, 0.6901961, 1, 0, 1,
-0.8279102, 0.3515585, -3.179169, 0.6862745, 1, 0, 1,
-0.8269702, 1.066403, -0.7875421, 0.6784314, 1, 0, 1,
-0.823993, -2.123468, -3.499445, 0.6745098, 1, 0, 1,
-0.8234156, 0.5604906, -2.01846, 0.6666667, 1, 0, 1,
-0.8131577, 0.6627454, -1.451858, 0.6627451, 1, 0, 1,
-0.811487, 1.497522, -1.603498, 0.654902, 1, 0, 1,
-0.8106745, 0.5802828, -1.396734, 0.6509804, 1, 0, 1,
-0.8066078, -0.7872694, -3.057338, 0.6431373, 1, 0, 1,
-0.8010537, -2.277277, -2.096106, 0.6392157, 1, 0, 1,
-0.7960919, -1.47107, -3.439032, 0.6313726, 1, 0, 1,
-0.7957538, -0.4208532, -1.72493, 0.627451, 1, 0, 1,
-0.7914674, 1.472914, -0.7487121, 0.6196079, 1, 0, 1,
-0.7861364, -0.8765569, -2.799329, 0.6156863, 1, 0, 1,
-0.7860652, -1.329312, -0.8155244, 0.6078432, 1, 0, 1,
-0.7788641, 0.9165829, -2.441131, 0.6039216, 1, 0, 1,
-0.7773173, 1.178876, 0.352668, 0.5960785, 1, 0, 1,
-0.77712, 0.5563887, 0.5666257, 0.5882353, 1, 0, 1,
-0.7769867, -0.7622994, -4.352708, 0.5843138, 1, 0, 1,
-0.774383, -0.873268, -2.465248, 0.5764706, 1, 0, 1,
-0.7722653, 0.4364581, -2.158506, 0.572549, 1, 0, 1,
-0.7702077, -0.1508326, -2.158931, 0.5647059, 1, 0, 1,
-0.7692937, 0.1839729, 0.0623422, 0.5607843, 1, 0, 1,
-0.7684108, 0.3840954, -0.9615651, 0.5529412, 1, 0, 1,
-0.7659323, -1.008057, -3.915343, 0.5490196, 1, 0, 1,
-0.7633277, -0.0627346, -4.11349, 0.5411765, 1, 0, 1,
-0.7596776, -0.01048705, -0.8936338, 0.5372549, 1, 0, 1,
-0.7585196, 0.7587095, 0.9754789, 0.5294118, 1, 0, 1,
-0.7518526, 1.151852, -0.5019866, 0.5254902, 1, 0, 1,
-0.7508574, -2.286132, -4.158119, 0.5176471, 1, 0, 1,
-0.7463175, 0.9139933, -2.546693, 0.5137255, 1, 0, 1,
-0.7369018, 0.7016447, -0.754473, 0.5058824, 1, 0, 1,
-0.7288013, -0.8618314, -1.268466, 0.5019608, 1, 0, 1,
-0.7275366, -0.8285334, -1.872063, 0.4941176, 1, 0, 1,
-0.7266435, -1.900904, -3.972071, 0.4862745, 1, 0, 1,
-0.7187193, 0.931792, -0.3290707, 0.4823529, 1, 0, 1,
-0.7156056, -0.7259733, -0.3611681, 0.4745098, 1, 0, 1,
-0.7153991, -1.281073, -1.367005, 0.4705882, 1, 0, 1,
-0.7149429, -0.7784793, -2.244717, 0.4627451, 1, 0, 1,
-0.7123866, -0.509036, -1.634068, 0.4588235, 1, 0, 1,
-0.7116587, -0.4775928, -2.275781, 0.4509804, 1, 0, 1,
-0.7109886, -1.221324, -2.700805, 0.4470588, 1, 0, 1,
-0.7000958, -1.231097, -2.36381, 0.4392157, 1, 0, 1,
-0.6996697, 2.250854, 0.6414712, 0.4352941, 1, 0, 1,
-0.6987741, -0.649946, -2.647157, 0.427451, 1, 0, 1,
-0.6943595, -1.449211, -0.3088531, 0.4235294, 1, 0, 1,
-0.6879051, 0.7514054, -0.9690716, 0.4156863, 1, 0, 1,
-0.687598, -2.583455, -2.537258, 0.4117647, 1, 0, 1,
-0.6867095, -1.284171, -3.451465, 0.4039216, 1, 0, 1,
-0.6813847, -0.4198796, -1.769748, 0.3960784, 1, 0, 1,
-0.6806484, -0.7504487, -1.009984, 0.3921569, 1, 0, 1,
-0.6802275, 0.0226471, 0.9768931, 0.3843137, 1, 0, 1,
-0.6768058, -0.5259385, -1.121112, 0.3803922, 1, 0, 1,
-0.6756205, 1.08692, 0.1432153, 0.372549, 1, 0, 1,
-0.6753899, 1.709903, 0.4607113, 0.3686275, 1, 0, 1,
-0.6629779, -0.4588234, -1.387837, 0.3607843, 1, 0, 1,
-0.6617368, -0.9038684, -1.664872, 0.3568628, 1, 0, 1,
-0.6583714, 0.5852146, 0.0683402, 0.3490196, 1, 0, 1,
-0.6576122, 0.4172507, -2.361178, 0.345098, 1, 0, 1,
-0.6433377, -0.7582931, -0.4760711, 0.3372549, 1, 0, 1,
-0.6405138, -1.636976, -2.134307, 0.3333333, 1, 0, 1,
-0.6393434, -1.609546, -2.854883, 0.3254902, 1, 0, 1,
-0.6336288, 0.3600276, -0.7941104, 0.3215686, 1, 0, 1,
-0.6295492, -0.9124407, -2.758985, 0.3137255, 1, 0, 1,
-0.6277495, -0.0507386, -2.592315, 0.3098039, 1, 0, 1,
-0.6237574, -0.7455938, -1.842649, 0.3019608, 1, 0, 1,
-0.6170915, -2.008188, -0.91318, 0.2941177, 1, 0, 1,
-0.6137899, 1.427659, 1.39059, 0.2901961, 1, 0, 1,
-0.613519, 1.195109, -2.096322, 0.282353, 1, 0, 1,
-0.6101345, -1.110063, -2.621116, 0.2784314, 1, 0, 1,
-0.6067425, -0.03953826, -1.642629, 0.2705882, 1, 0, 1,
-0.6026077, -0.5849635, -2.406317, 0.2666667, 1, 0, 1,
-0.5905121, 0.6582383, -1.66289, 0.2588235, 1, 0, 1,
-0.5875013, -0.4804866, -2.574019, 0.254902, 1, 0, 1,
-0.5829118, 1.6053, -1.132277, 0.2470588, 1, 0, 1,
-0.5803484, -0.3401429, -4.573986, 0.2431373, 1, 0, 1,
-0.5783641, 1.228229, -0.04589339, 0.2352941, 1, 0, 1,
-0.5781423, 1.41465, -1.308636, 0.2313726, 1, 0, 1,
-0.5771879, 0.87751, -0.06657432, 0.2235294, 1, 0, 1,
-0.5769988, -0.2017971, -3.126346, 0.2196078, 1, 0, 1,
-0.5759044, 0.1368678, -2.992953, 0.2117647, 1, 0, 1,
-0.5696727, -1.818884, -3.606995, 0.2078431, 1, 0, 1,
-0.5692155, -0.2664421, -3.046932, 0.2, 1, 0, 1,
-0.5629416, 1.083524, -2.553806, 0.1921569, 1, 0, 1,
-0.5626901, -0.9772803, -1.402637, 0.1882353, 1, 0, 1,
-0.5588865, 0.6433382, -0.9299946, 0.1803922, 1, 0, 1,
-0.5582966, 1.530686, 0.5061532, 0.1764706, 1, 0, 1,
-0.557359, 0.04531433, -1.366318, 0.1686275, 1, 0, 1,
-0.5548664, 0.9556485, -1.107909, 0.1647059, 1, 0, 1,
-0.5525195, 0.9915503, -0.9297642, 0.1568628, 1, 0, 1,
-0.5491154, 0.9196368, -0.2051138, 0.1529412, 1, 0, 1,
-0.5477855, 0.2580676, -1.864713, 0.145098, 1, 0, 1,
-0.5303718, 1.01395, -0.2017802, 0.1411765, 1, 0, 1,
-0.5209305, 1.082725, -0.6294419, 0.1333333, 1, 0, 1,
-0.5182385, 0.4142413, 0.7076288, 0.1294118, 1, 0, 1,
-0.5047088, 0.5317368, -0.8625774, 0.1215686, 1, 0, 1,
-0.5024586, -1.200764, -2.779189, 0.1176471, 1, 0, 1,
-0.4979256, -0.9027457, -2.17431, 0.1098039, 1, 0, 1,
-0.4952627, 0.4885789, -0.1979966, 0.1058824, 1, 0, 1,
-0.4923389, 0.5343611, -2.136023, 0.09803922, 1, 0, 1,
-0.4902127, 0.1249833, -1.051237, 0.09019608, 1, 0, 1,
-0.4875131, -0.4786185, -2.5898, 0.08627451, 1, 0, 1,
-0.4834398, -0.3137782, -2.924402, 0.07843138, 1, 0, 1,
-0.4811154, 1.284318, -0.03922079, 0.07450981, 1, 0, 1,
-0.4753393, -0.6295857, -2.627522, 0.06666667, 1, 0, 1,
-0.473307, 0.9850597, -1.186785, 0.0627451, 1, 0, 1,
-0.4669135, -0.05330044, -0.0381239, 0.05490196, 1, 0, 1,
-0.4654107, -1.456875, -2.012866, 0.05098039, 1, 0, 1,
-0.4626124, 1.188445, 0.3864389, 0.04313726, 1, 0, 1,
-0.4593875, -2.286793, -3.678171, 0.03921569, 1, 0, 1,
-0.4527161, 0.1763286, -0.4445458, 0.03137255, 1, 0, 1,
-0.4521618, -1.943872, -2.771238, 0.02745098, 1, 0, 1,
-0.4516354, 0.4288197, 0.4766813, 0.01960784, 1, 0, 1,
-0.4499668, 1.157284, -1.499928, 0.01568628, 1, 0, 1,
-0.4483368, -1.78869, -3.533615, 0.007843138, 1, 0, 1,
-0.4452882, -0.1288814, -2.101984, 0.003921569, 1, 0, 1,
-0.4412976, 0.03566996, -1.177153, 0, 1, 0.003921569, 1,
-0.4402873, 0.9032848, -1.495981, 0, 1, 0.01176471, 1,
-0.4394477, 0.1305773, 0.2852445, 0, 1, 0.01568628, 1,
-0.4357746, 0.2546096, -0.4915672, 0, 1, 0.02352941, 1,
-0.4317921, -0.1657877, -1.517204, 0, 1, 0.02745098, 1,
-0.4308941, 1.181231, -0.0767404, 0, 1, 0.03529412, 1,
-0.4298452, -0.1726259, -1.229368, 0, 1, 0.03921569, 1,
-0.4287995, -0.4316799, -2.080265, 0, 1, 0.04705882, 1,
-0.4216403, -0.9486212, -2.33293, 0, 1, 0.05098039, 1,
-0.4214088, -0.8361393, -1.27005, 0, 1, 0.05882353, 1,
-0.4182026, -0.4806919, -2.968503, 0, 1, 0.0627451, 1,
-0.4173903, 0.03287926, -2.170802, 0, 1, 0.07058824, 1,
-0.4163684, 0.9801349, -0.4418738, 0, 1, 0.07450981, 1,
-0.4125995, -1.383324, -3.872805, 0, 1, 0.08235294, 1,
-0.4117453, -0.8264043, -0.4005398, 0, 1, 0.08627451, 1,
-0.4014772, -0.7956015, -3.291238, 0, 1, 0.09411765, 1,
-0.3970598, -0.7866842, -2.528441, 0, 1, 0.1019608, 1,
-0.3970116, -0.7983148, -2.094819, 0, 1, 0.1058824, 1,
-0.3964528, 0.8036448, 0.4087987, 0, 1, 0.1137255, 1,
-0.3947627, 1.425673, 1.198228, 0, 1, 0.1176471, 1,
-0.3945007, 0.7575441, -0.475657, 0, 1, 0.1254902, 1,
-0.3920236, 0.6470165, 1.439481, 0, 1, 0.1294118, 1,
-0.3915114, -1.087212, -1.259839, 0, 1, 0.1372549, 1,
-0.3851081, 1.236803, -0.3779727, 0, 1, 0.1411765, 1,
-0.3814846, -0.1801798, -0.02109711, 0, 1, 0.1490196, 1,
-0.3805045, 0.6073672, -0.5511889, 0, 1, 0.1529412, 1,
-0.3797815, 0.7183306, -1.01285, 0, 1, 0.1607843, 1,
-0.3741274, 1.418475, -0.9311361, 0, 1, 0.1647059, 1,
-0.3658507, -0.5258045, -2.283363, 0, 1, 0.172549, 1,
-0.3658016, -1.428094, -1.939819, 0, 1, 0.1764706, 1,
-0.3616237, -0.9634628, -3.045889, 0, 1, 0.1843137, 1,
-0.3613916, 1.347891, 0.4175889, 0, 1, 0.1882353, 1,
-0.3611982, -0.9537546, -2.262686, 0, 1, 0.1960784, 1,
-0.3542475, -0.7646437, -3.1587, 0, 1, 0.2039216, 1,
-0.3510379, 0.004976611, -1.6368, 0, 1, 0.2078431, 1,
-0.3451352, -1.779546, -2.629504, 0, 1, 0.2156863, 1,
-0.3388609, 0.01717522, -0.6325264, 0, 1, 0.2196078, 1,
-0.3374249, -1.333092, -2.073066, 0, 1, 0.227451, 1,
-0.3223714, 0.648955, -1.337611, 0, 1, 0.2313726, 1,
-0.3197809, -0.748058, -2.821367, 0, 1, 0.2392157, 1,
-0.3183874, -0.1800992, -1.334581, 0, 1, 0.2431373, 1,
-0.3036299, 0.1208913, -1.36312, 0, 1, 0.2509804, 1,
-0.3013591, 1.090928, 1.173204, 0, 1, 0.254902, 1,
-0.2950001, -0.2431924, -3.605532, 0, 1, 0.2627451, 1,
-0.287409, 1.758249, -0.714794, 0, 1, 0.2666667, 1,
-0.2866392, 0.9723654, -0.4555053, 0, 1, 0.2745098, 1,
-0.2864157, 0.5359682, -1.149392, 0, 1, 0.2784314, 1,
-0.2849864, -1.618799, -4.516496, 0, 1, 0.2862745, 1,
-0.2816023, -1.643336, -2.190182, 0, 1, 0.2901961, 1,
-0.2790947, -1.133289, -3.347245, 0, 1, 0.2980392, 1,
-0.2701716, -1.004027, -0.9959321, 0, 1, 0.3058824, 1,
-0.2691407, -1.957996, -2.904542, 0, 1, 0.3098039, 1,
-0.2686569, -0.2729881, -2.393864, 0, 1, 0.3176471, 1,
-0.2664374, 2.155139, -0.6543013, 0, 1, 0.3215686, 1,
-0.2648727, -1.188272, -1.433707, 0, 1, 0.3294118, 1,
-0.2621193, -1.323951, -3.94172, 0, 1, 0.3333333, 1,
-0.2556293, 2.637746, -0.1845916, 0, 1, 0.3411765, 1,
-0.2533625, 1.470935, -1.747171, 0, 1, 0.345098, 1,
-0.2502947, -0.6304096, -4.706958, 0, 1, 0.3529412, 1,
-0.2499222, 0.533268, 1.75071, 0, 1, 0.3568628, 1,
-0.2484258, -0.9481489, -4.053591, 0, 1, 0.3647059, 1,
-0.243001, 1.193848, 0.8778368, 0, 1, 0.3686275, 1,
-0.2424899, -0.3143377, -2.854206, 0, 1, 0.3764706, 1,
-0.2407602, 0.6503264, -0.3146508, 0, 1, 0.3803922, 1,
-0.2404469, 0.8819039, 0.4203491, 0, 1, 0.3882353, 1,
-0.2376974, -0.2182312, -1.465708, 0, 1, 0.3921569, 1,
-0.2323083, -0.02079812, -3.575875, 0, 1, 0.4, 1,
-0.2314081, 0.5092418, 0.0717365, 0, 1, 0.4078431, 1,
-0.2289877, -1.683171, -2.324879, 0, 1, 0.4117647, 1,
-0.2242648, -0.07293782, -1.359914, 0, 1, 0.4196078, 1,
-0.2234647, 0.463846, -0.4912275, 0, 1, 0.4235294, 1,
-0.2225664, 0.7172238, 1.464633, 0, 1, 0.4313726, 1,
-0.2216998, -1.106728, -4.498283, 0, 1, 0.4352941, 1,
-0.2208645, -0.04223553, -1.381024, 0, 1, 0.4431373, 1,
-0.2185563, -1.475536, -0.9419637, 0, 1, 0.4470588, 1,
-0.218483, 2.063855, 0.554328, 0, 1, 0.454902, 1,
-0.2170973, -0.8438988, -4.064386, 0, 1, 0.4588235, 1,
-0.20844, 0.4264296, -0.5108297, 0, 1, 0.4666667, 1,
-0.2070208, 0.1962577, 0.1512795, 0, 1, 0.4705882, 1,
-0.2068256, 0.2375195, -2.847273, 0, 1, 0.4784314, 1,
-0.2014351, 1.630262, -0.06155333, 0, 1, 0.4823529, 1,
-0.2007744, 0.7884483, -0.7717099, 0, 1, 0.4901961, 1,
-0.1805492, -0.09566933, -2.388581, 0, 1, 0.4941176, 1,
-0.1798674, -0.1271104, -2.175496, 0, 1, 0.5019608, 1,
-0.1774441, -1.578108, -3.973529, 0, 1, 0.509804, 1,
-0.1736812, -3.680447, -4.629334, 0, 1, 0.5137255, 1,
-0.1723595, -0.2981193, -2.245812, 0, 1, 0.5215687, 1,
-0.1661571, 0.201437, -1.92066, 0, 1, 0.5254902, 1,
-0.1652231, 0.7246076, 0.1631283, 0, 1, 0.5333334, 1,
-0.1624097, 1.566775, -0.448524, 0, 1, 0.5372549, 1,
-0.1577768, 0.8337095, -0.9905869, 0, 1, 0.5450981, 1,
-0.1550901, 0.5846217, 1.979644, 0, 1, 0.5490196, 1,
-0.152101, 1.431809, -1.569738, 0, 1, 0.5568628, 1,
-0.1501815, 1.197143, 0.1390492, 0, 1, 0.5607843, 1,
-0.1482698, -0.7742324, -5.048462, 0, 1, 0.5686275, 1,
-0.1459525, -0.2474802, -1.912859, 0, 1, 0.572549, 1,
-0.1454933, -0.02723427, -2.086703, 0, 1, 0.5803922, 1,
-0.1381594, -0.449744, -2.846741, 0, 1, 0.5843138, 1,
-0.1381093, 0.9165257, -2.452826, 0, 1, 0.5921569, 1,
-0.1373157, -0.2394021, -0.8319057, 0, 1, 0.5960785, 1,
-0.1364112, 0.7956114, -0.1389424, 0, 1, 0.6039216, 1,
-0.1353342, 0.09758036, -0.3158954, 0, 1, 0.6117647, 1,
-0.1340533, -1.507478, -2.566801, 0, 1, 0.6156863, 1,
-0.1333691, 1.505932, -0.2857361, 0, 1, 0.6235294, 1,
-0.1330767, -1.154011, -3.269178, 0, 1, 0.627451, 1,
-0.1318645, 1.09834, 1.34075, 0, 1, 0.6352941, 1,
-0.1303901, -0.04784595, -1.255358, 0, 1, 0.6392157, 1,
-0.1268772, -0.2137283, -2.881022, 0, 1, 0.6470588, 1,
-0.1234047, -0.5474935, -1.821212, 0, 1, 0.6509804, 1,
-0.1223019, -1.717853, -2.881037, 0, 1, 0.6588235, 1,
-0.1216221, -0.411846, -2.509576, 0, 1, 0.6627451, 1,
-0.1211659, 0.739608, 0.09438583, 0, 1, 0.6705883, 1,
-0.1194139, 0.3060932, -1.124596, 0, 1, 0.6745098, 1,
-0.1178802, -1.045985, -3.345136, 0, 1, 0.682353, 1,
-0.1151574, -0.2157506, -3.545319, 0, 1, 0.6862745, 1,
-0.1140252, 1.271393, 0.3965812, 0, 1, 0.6941177, 1,
-0.1113282, -0.05948898, -0.4714783, 0, 1, 0.7019608, 1,
-0.1111634, -2.246213, -3.072578, 0, 1, 0.7058824, 1,
-0.1110344, -1.35801, -3.997661, 0, 1, 0.7137255, 1,
-0.09689641, 0.01713724, -1.299322, 0, 1, 0.7176471, 1,
-0.09603924, -0.1825423, -3.0296, 0, 1, 0.7254902, 1,
-0.09603238, 0.6830831, 1.484739, 0, 1, 0.7294118, 1,
-0.09278201, -0.003529803, -3.323304, 0, 1, 0.7372549, 1,
-0.08865468, 1.508079, -0.1158037, 0, 1, 0.7411765, 1,
-0.08386025, 0.3154446, -0.8005093, 0, 1, 0.7490196, 1,
-0.08385795, 1.414886, 1.313029, 0, 1, 0.7529412, 1,
-0.08027621, 0.698589, 0.265475, 0, 1, 0.7607843, 1,
-0.07952622, -0.2271249, -1.75847, 0, 1, 0.7647059, 1,
-0.07463606, 0.7820579, -0.5796073, 0, 1, 0.772549, 1,
-0.07329036, 1.057252, 1.284723, 0, 1, 0.7764706, 1,
-0.07314409, 0.3169399, 1.067699, 0, 1, 0.7843137, 1,
-0.07085575, 0.4146013, -0.4434769, 0, 1, 0.7882353, 1,
-0.06866562, -0.5696027, -2.986378, 0, 1, 0.7960784, 1,
-0.06588329, 0.3557051, 2.851019, 0, 1, 0.8039216, 1,
-0.06437182, 0.9240894, -0.6071773, 0, 1, 0.8078431, 1,
-0.06349446, -0.2099927, -1.818913, 0, 1, 0.8156863, 1,
-0.0604801, 0.5296678, 0.1990337, 0, 1, 0.8196079, 1,
-0.05860795, 2.147348, 0.6019123, 0, 1, 0.827451, 1,
-0.05664005, 0.614202, 0.3293715, 0, 1, 0.8313726, 1,
-0.05076413, 0.1714276, -2.083406, 0, 1, 0.8392157, 1,
-0.04538861, -0.3354583, -3.220732, 0, 1, 0.8431373, 1,
-0.04433053, 0.7079656, -0.533161, 0, 1, 0.8509804, 1,
-0.0439807, 0.1266018, -0.09899992, 0, 1, 0.854902, 1,
-0.04268054, 1.671059, 0.1292364, 0, 1, 0.8627451, 1,
-0.03786269, -0.3261125, -3.000129, 0, 1, 0.8666667, 1,
-0.03308005, -0.7884037, -4.114101, 0, 1, 0.8745098, 1,
-0.03067945, -0.2445736, -2.73487, 0, 1, 0.8784314, 1,
-0.03041849, 0.9274578, 1.579082, 0, 1, 0.8862745, 1,
-0.02878882, -0.5196327, -3.873579, 0, 1, 0.8901961, 1,
-0.0277342, 1.132456, -0.9324167, 0, 1, 0.8980392, 1,
-0.02553325, 0.1276749, 0.121716, 0, 1, 0.9058824, 1,
-0.0252878, 0.8943934, -0.9326826, 0, 1, 0.9098039, 1,
-0.02367825, -1.418258, -2.169898, 0, 1, 0.9176471, 1,
-0.02242408, -0.1450537, -3.924923, 0, 1, 0.9215686, 1,
-0.02069373, -1.240606, -2.220287, 0, 1, 0.9294118, 1,
-0.01811088, -1.079904, -3.372234, 0, 1, 0.9333333, 1,
-0.01636458, 0.2807081, 0.697577, 0, 1, 0.9411765, 1,
-0.01511211, -0.311494, -5.681327, 0, 1, 0.945098, 1,
-0.01289815, -2.843915, -3.191672, 0, 1, 0.9529412, 1,
-0.01107936, -0.4008458, -3.858014, 0, 1, 0.9568627, 1,
-0.007586144, -0.4759063, -1.225121, 0, 1, 0.9647059, 1,
-0.005017892, -0.62488, -2.909257, 0, 1, 0.9686275, 1,
0.000866337, -0.527049, 1.699986, 0, 1, 0.9764706, 1,
0.001704257, 0.3280209, -0.09718949, 0, 1, 0.9803922, 1,
0.001804479, -0.7673039, 3.091109, 0, 1, 0.9882353, 1,
0.007795868, 0.5619555, -1.809359, 0, 1, 0.9921569, 1,
0.01092936, -1.258254, 4.252708, 0, 1, 1, 1,
0.01304704, 0.05903785, -1.064152, 0, 0.9921569, 1, 1,
0.02485695, -1.366806, 2.19014, 0, 0.9882353, 1, 1,
0.03002563, 1.029632, -0.7616092, 0, 0.9803922, 1, 1,
0.03481101, -0.7217752, 3.71642, 0, 0.9764706, 1, 1,
0.03813661, 0.8145986, -0.8948499, 0, 0.9686275, 1, 1,
0.03899, 1.388292, 0.6855564, 0, 0.9647059, 1, 1,
0.04047113, 0.01392294, 1.417477, 0, 0.9568627, 1, 1,
0.04249822, -0.9575142, 2.504162, 0, 0.9529412, 1, 1,
0.04266588, -1.050549, 4.383247, 0, 0.945098, 1, 1,
0.04315567, -0.2721133, 3.134777, 0, 0.9411765, 1, 1,
0.04535181, 1.205469, 0.6056898, 0, 0.9333333, 1, 1,
0.05145251, -0.07637592, 2.140368, 0, 0.9294118, 1, 1,
0.05425071, -0.7090947, 4.630321, 0, 0.9215686, 1, 1,
0.05481445, 0.5104682, -0.9894856, 0, 0.9176471, 1, 1,
0.0577324, 0.6531662, -0.3017058, 0, 0.9098039, 1, 1,
0.05776088, 1.048881, -1.581276, 0, 0.9058824, 1, 1,
0.05780278, -1.197512, 2.078283, 0, 0.8980392, 1, 1,
0.05797015, 1.405022, 0.1950291, 0, 0.8901961, 1, 1,
0.0583684, 1.852321, -0.5974588, 0, 0.8862745, 1, 1,
0.06000821, -1.855234, 2.814718, 0, 0.8784314, 1, 1,
0.06250598, 0.4714717, 0.1968706, 0, 0.8745098, 1, 1,
0.06259418, 0.2762953, -1.392129, 0, 0.8666667, 1, 1,
0.0655167, -1.179788, 1.951881, 0, 0.8627451, 1, 1,
0.06874374, 1.565522, 1.964041, 0, 0.854902, 1, 1,
0.07005716, 0.4940389, -0.9162961, 0, 0.8509804, 1, 1,
0.07113845, -1.9703, 4.085639, 0, 0.8431373, 1, 1,
0.0736254, 1.757441, -1.340654, 0, 0.8392157, 1, 1,
0.07384167, 0.01911951, 2.017694, 0, 0.8313726, 1, 1,
0.07478721, 1.533173, -1.193034, 0, 0.827451, 1, 1,
0.07523211, 0.5299299, -1.206062, 0, 0.8196079, 1, 1,
0.07771513, -0.01613391, 0.8864771, 0, 0.8156863, 1, 1,
0.07781681, -0.1851497, 2.889839, 0, 0.8078431, 1, 1,
0.07858282, -1.86111, 1.703982, 0, 0.8039216, 1, 1,
0.08095752, 0.6662534, 0.4959757, 0, 0.7960784, 1, 1,
0.09326916, -0.5144144, 2.318573, 0, 0.7882353, 1, 1,
0.0956124, -0.107305, 2.44417, 0, 0.7843137, 1, 1,
0.09724228, 0.7160718, -0.3982014, 0, 0.7764706, 1, 1,
0.09895793, -0.5475688, 2.843162, 0, 0.772549, 1, 1,
0.0995298, 0.06084302, 1.304971, 0, 0.7647059, 1, 1,
0.1002266, -0.8170059, 2.93827, 0, 0.7607843, 1, 1,
0.1037879, 0.1678783, -0.9826502, 0, 0.7529412, 1, 1,
0.1044479, 0.6837512, 0.6550012, 0, 0.7490196, 1, 1,
0.1056572, -1.696773, 3.251817, 0, 0.7411765, 1, 1,
0.1068095, 0.7251172, 0.2467993, 0, 0.7372549, 1, 1,
0.10947, 0.3463619, 0.5052328, 0, 0.7294118, 1, 1,
0.1107487, -0.5575635, 2.11723, 0, 0.7254902, 1, 1,
0.1122761, -0.8349625, 3.20509, 0, 0.7176471, 1, 1,
0.1127148, 0.05231552, 1.128287, 0, 0.7137255, 1, 1,
0.116931, 0.9751554, -1.438207, 0, 0.7058824, 1, 1,
0.1180032, 0.9040601, -0.6244254, 0, 0.6980392, 1, 1,
0.1217347, -0.2543384, 1.443594, 0, 0.6941177, 1, 1,
0.1256169, 0.3688291, -0.7417923, 0, 0.6862745, 1, 1,
0.1328486, -0.6361533, 3.180244, 0, 0.682353, 1, 1,
0.1332335, 0.06981412, -0.7724062, 0, 0.6745098, 1, 1,
0.1334013, -0.06823608, 0.6333734, 0, 0.6705883, 1, 1,
0.1466244, 0.5671108, 0.7815328, 0, 0.6627451, 1, 1,
0.1466786, -1.163059, 1.936922, 0, 0.6588235, 1, 1,
0.1499229, 1.390703, -0.8334568, 0, 0.6509804, 1, 1,
0.1506687, -0.1447338, 2.472403, 0, 0.6470588, 1, 1,
0.1531219, 1.203588, 1.757163, 0, 0.6392157, 1, 1,
0.1563541, 1.041459, 0.08653805, 0, 0.6352941, 1, 1,
0.158022, 0.026011, 0.1071295, 0, 0.627451, 1, 1,
0.1583749, 0.3315578, -1.295367, 0, 0.6235294, 1, 1,
0.1597549, -0.4123999, 3.586546, 0, 0.6156863, 1, 1,
0.1609707, 0.5076687, -0.7551497, 0, 0.6117647, 1, 1,
0.1621954, -0.06911025, 2.699511, 0, 0.6039216, 1, 1,
0.1641681, 0.4723383, 0.9573262, 0, 0.5960785, 1, 1,
0.1698596, 0.08199365, 1.323861, 0, 0.5921569, 1, 1,
0.170806, 0.2215166, 0.6718078, 0, 0.5843138, 1, 1,
0.1728812, 0.3966882, -0.8243418, 0, 0.5803922, 1, 1,
0.1743721, -0.6587741, 1.79116, 0, 0.572549, 1, 1,
0.176703, -1.450159, 1.809634, 0, 0.5686275, 1, 1,
0.178239, -1.099637, 3.608081, 0, 0.5607843, 1, 1,
0.1802812, 0.6913062, 0.3573449, 0, 0.5568628, 1, 1,
0.1841893, 1.386297, 1.401442, 0, 0.5490196, 1, 1,
0.1851556, 1.413292, 0.8009916, 0, 0.5450981, 1, 1,
0.1857863, 2.137325, 0.8767341, 0, 0.5372549, 1, 1,
0.1909829, 0.09990522, 0.7179568, 0, 0.5333334, 1, 1,
0.1912272, -0.2068549, 2.483757, 0, 0.5254902, 1, 1,
0.1946512, -0.5155, 1.820411, 0, 0.5215687, 1, 1,
0.1954823, -0.6473343, 2.682771, 0, 0.5137255, 1, 1,
0.2032846, 0.3047489, 0.9976754, 0, 0.509804, 1, 1,
0.2039846, -0.1171115, 1.684829, 0, 0.5019608, 1, 1,
0.2055013, -0.2908716, 3.007684, 0, 0.4941176, 1, 1,
0.2122655, 0.2761526, 1.164826, 0, 0.4901961, 1, 1,
0.2124699, 1.140368, 0.8045273, 0, 0.4823529, 1, 1,
0.2201976, -1.535286, 3.235499, 0, 0.4784314, 1, 1,
0.2211922, 0.2021549, 3.263864, 0, 0.4705882, 1, 1,
0.227024, 0.3577175, 0.911113, 0, 0.4666667, 1, 1,
0.2273522, 0.1194374, 1.487566, 0, 0.4588235, 1, 1,
0.2277127, -0.5636248, 2.829787, 0, 0.454902, 1, 1,
0.2278426, -1.062885, 2.405485, 0, 0.4470588, 1, 1,
0.2343318, -1.265382, 2.961693, 0, 0.4431373, 1, 1,
0.2344784, 0.1568263, 0.9286622, 0, 0.4352941, 1, 1,
0.2364043, -1.006686, 3.076676, 0, 0.4313726, 1, 1,
0.2399987, -0.5376696, 2.835734, 0, 0.4235294, 1, 1,
0.2400793, 0.8201954, -0.9031951, 0, 0.4196078, 1, 1,
0.2417777, -0.5797723, 3.143302, 0, 0.4117647, 1, 1,
0.2420693, 0.39375, -0.8407366, 0, 0.4078431, 1, 1,
0.2448989, -1.62147, 1.424371, 0, 0.4, 1, 1,
0.2545489, -0.2813148, 0.4985804, 0, 0.3921569, 1, 1,
0.2567894, 1.511366, -0.9182433, 0, 0.3882353, 1, 1,
0.2608086, -1.167269, 3.078555, 0, 0.3803922, 1, 1,
0.2639095, 1.560272, 0.5635901, 0, 0.3764706, 1, 1,
0.2649118, -1.626664, 1.871459, 0, 0.3686275, 1, 1,
0.2658754, 0.938257, 0.9912279, 0, 0.3647059, 1, 1,
0.2695036, -1.878094, 1.965485, 0, 0.3568628, 1, 1,
0.2700874, -1.111931, 3.476426, 0, 0.3529412, 1, 1,
0.2746395, 1.150647, 0.4586035, 0, 0.345098, 1, 1,
0.279188, 0.1093186, 1.659275, 0, 0.3411765, 1, 1,
0.2812952, 0.5771051, -1.423447, 0, 0.3333333, 1, 1,
0.2837611, -0.1152307, 1.115528, 0, 0.3294118, 1, 1,
0.2839976, -0.02826384, 1.3495, 0, 0.3215686, 1, 1,
0.2886539, -0.8581067, 3.658276, 0, 0.3176471, 1, 1,
0.2910218, -1.0696, 4.55988, 0, 0.3098039, 1, 1,
0.2911943, -2.704556, 3.34058, 0, 0.3058824, 1, 1,
0.3048251, 0.270182, 2.561576, 0, 0.2980392, 1, 1,
0.3113521, 0.3087203, 1.602353, 0, 0.2901961, 1, 1,
0.314277, 0.7305685, 2.046346, 0, 0.2862745, 1, 1,
0.3163995, -1.146684, 5.435362, 0, 0.2784314, 1, 1,
0.3247102, 0.1454145, 1.622807, 0, 0.2745098, 1, 1,
0.3257378, -0.9514049, 1.700349, 0, 0.2666667, 1, 1,
0.3328568, 0.6777814, 0.9077114, 0, 0.2627451, 1, 1,
0.3345988, -0.4842202, 3.394883, 0, 0.254902, 1, 1,
0.3357764, 0.07179849, 0.1731472, 0, 0.2509804, 1, 1,
0.3497487, 0.9755573, -0.5357063, 0, 0.2431373, 1, 1,
0.3509214, 1.549251, 0.9287573, 0, 0.2392157, 1, 1,
0.3528892, 0.6568104, 0.1480724, 0, 0.2313726, 1, 1,
0.3564577, 1.053101, -0.7928444, 0, 0.227451, 1, 1,
0.3574503, -0.5621566, 2.486887, 0, 0.2196078, 1, 1,
0.3614526, -0.1205701, 1.988187, 0, 0.2156863, 1, 1,
0.3748019, 0.7529544, 0.95777, 0, 0.2078431, 1, 1,
0.3766984, 0.9957559, 0.750316, 0, 0.2039216, 1, 1,
0.382015, 0.1847268, 2.107184, 0, 0.1960784, 1, 1,
0.3827394, -0.6605131, 2.751034, 0, 0.1882353, 1, 1,
0.3835971, 0.8847114, 0.2216254, 0, 0.1843137, 1, 1,
0.3853616, 0.7057372, 0.3979904, 0, 0.1764706, 1, 1,
0.3870038, 0.3650857, -0.8876705, 0, 0.172549, 1, 1,
0.3940875, -0.4016418, 0.9904436, 0, 0.1647059, 1, 1,
0.3942491, 0.2111959, 0.4123727, 0, 0.1607843, 1, 1,
0.3998874, 0.3278522, 0.1670034, 0, 0.1529412, 1, 1,
0.402689, 1.22453, 0.2905435, 0, 0.1490196, 1, 1,
0.4036505, 2.332515, 0.8179733, 0, 0.1411765, 1, 1,
0.404471, -0.8018029, 2.312199, 0, 0.1372549, 1, 1,
0.406576, -0.9032775, 2.24529, 0, 0.1294118, 1, 1,
0.4101853, -0.3457722, 0.8719406, 0, 0.1254902, 1, 1,
0.4121155, -0.09333196, 1.579718, 0, 0.1176471, 1, 1,
0.4121743, 0.3953383, 0.4686302, 0, 0.1137255, 1, 1,
0.4128794, -1.872264, 4.01034, 0, 0.1058824, 1, 1,
0.4181048, 1.840778, 2.827776, 0, 0.09803922, 1, 1,
0.4185139, 0.07164054, 3.595064, 0, 0.09411765, 1, 1,
0.4230082, 0.431627, 0.643619, 0, 0.08627451, 1, 1,
0.4269525, 1.675075, 0.6213915, 0, 0.08235294, 1, 1,
0.4270721, -0.7220013, 2.646164, 0, 0.07450981, 1, 1,
0.4307021, -0.4187121, 1.620597, 0, 0.07058824, 1, 1,
0.4309705, 1.168979, 0.1446621, 0, 0.0627451, 1, 1,
0.4346914, -1.385878, 2.339032, 0, 0.05882353, 1, 1,
0.434836, 0.37751, 2.385702, 0, 0.05098039, 1, 1,
0.4422644, 0.1808228, 0.938071, 0, 0.04705882, 1, 1,
0.4441546, 1.223838, 0.2968661, 0, 0.03921569, 1, 1,
0.4491177, -0.1917392, 1.563316, 0, 0.03529412, 1, 1,
0.4503688, 0.2453691, 3.351888, 0, 0.02745098, 1, 1,
0.4522276, 1.102489, 0.2520799, 0, 0.02352941, 1, 1,
0.459375, -1.272868, 3.776402, 0, 0.01568628, 1, 1,
0.4624985, 0.3393103, -0.01640945, 0, 0.01176471, 1, 1,
0.470295, -0.9634566, 5.18595, 0, 0.003921569, 1, 1,
0.4711263, 0.0803344, 1.665306, 0.003921569, 0, 1, 1,
0.4785169, 0.08292467, 0.1008742, 0.007843138, 0, 1, 1,
0.4802841, 0.02040129, 3.23273, 0.01568628, 0, 1, 1,
0.4815415, -0.6599139, 1.578817, 0.01960784, 0, 1, 1,
0.4826187, -0.307052, 1.703004, 0.02745098, 0, 1, 1,
0.4903883, 0.4479754, 1.647454, 0.03137255, 0, 1, 1,
0.4912013, 0.8705381, 0.4677003, 0.03921569, 0, 1, 1,
0.491471, 0.6951035, -0.200022, 0.04313726, 0, 1, 1,
0.4917413, 0.5408954, 2.086007, 0.05098039, 0, 1, 1,
0.4955913, 0.5041009, 0.3452254, 0.05490196, 0, 1, 1,
0.4965461, 1.431843, -0.732284, 0.0627451, 0, 1, 1,
0.4978414, 0.6386096, 0.5804675, 0.06666667, 0, 1, 1,
0.5043222, -0.2495672, 1.572183, 0.07450981, 0, 1, 1,
0.5082544, 0.4389665, 1.685928, 0.07843138, 0, 1, 1,
0.5113669, 1.583668, -0.07784745, 0.08627451, 0, 1, 1,
0.5117472, 0.9759915, -0.3066138, 0.09019608, 0, 1, 1,
0.5120127, 0.8079119, -0.2031238, 0.09803922, 0, 1, 1,
0.5124964, 0.03561918, 1.860456, 0.1058824, 0, 1, 1,
0.521762, -1.183099, 2.497002, 0.1098039, 0, 1, 1,
0.5219641, -0.4305715, 1.041289, 0.1176471, 0, 1, 1,
0.5279867, 0.7718265, 1.038098, 0.1215686, 0, 1, 1,
0.5341137, -0.662961, 3.32224, 0.1294118, 0, 1, 1,
0.5372777, -0.06974505, -1.188763, 0.1333333, 0, 1, 1,
0.5385736, -0.7391173, 2.870582, 0.1411765, 0, 1, 1,
0.5392009, 0.4829665, -0.3460694, 0.145098, 0, 1, 1,
0.5448071, 0.3353887, 2.031912, 0.1529412, 0, 1, 1,
0.5457699, -0.5321569, 1.721766, 0.1568628, 0, 1, 1,
0.5484344, 0.6523039, -0.4510804, 0.1647059, 0, 1, 1,
0.5511436, -0.3088632, 1.190674, 0.1686275, 0, 1, 1,
0.5519179, 0.1411093, 1.173531, 0.1764706, 0, 1, 1,
0.5527349, -0.005799538, -0.05159571, 0.1803922, 0, 1, 1,
0.5527902, -0.5420207, 1.094982, 0.1882353, 0, 1, 1,
0.5572463, -0.327695, 2.387966, 0.1921569, 0, 1, 1,
0.5576325, 1.36138, 1.650046, 0.2, 0, 1, 1,
0.5683479, 1.690966, 0.3812756, 0.2078431, 0, 1, 1,
0.5704287, 0.4647089, 1.215531, 0.2117647, 0, 1, 1,
0.572891, -0.3298418, 0.5899179, 0.2196078, 0, 1, 1,
0.5733405, 0.4333108, 0.6862628, 0.2235294, 0, 1, 1,
0.5745087, -0.2073831, 2.813689, 0.2313726, 0, 1, 1,
0.5849705, -0.02189225, 2.661122, 0.2352941, 0, 1, 1,
0.5851271, 3.034474, -0.8008559, 0.2431373, 0, 1, 1,
0.5942692, 0.7168975, 1.199712, 0.2470588, 0, 1, 1,
0.5945828, -2.098159, 4.305668, 0.254902, 0, 1, 1,
0.6005269, 0.002855771, 0.8090654, 0.2588235, 0, 1, 1,
0.6008859, -0.09910613, 1.016856, 0.2666667, 0, 1, 1,
0.6014831, 0.8919677, 0.02170855, 0.2705882, 0, 1, 1,
0.604283, -0.9630591, 2.125055, 0.2784314, 0, 1, 1,
0.6072059, -2.879018, 3.550424, 0.282353, 0, 1, 1,
0.6074906, -0.7811373, 3.130075, 0.2901961, 0, 1, 1,
0.6102102, -0.3689149, 1.012288, 0.2941177, 0, 1, 1,
0.6105833, 1.226704, 1.453547, 0.3019608, 0, 1, 1,
0.6107872, 1.825143, -0.2546582, 0.3098039, 0, 1, 1,
0.6123311, -0.8193697, 2.895593, 0.3137255, 0, 1, 1,
0.6147172, 1.058836, 1.526611, 0.3215686, 0, 1, 1,
0.6176093, 1.085306, -0.6698588, 0.3254902, 0, 1, 1,
0.6177407, -2.313692, 3.811881, 0.3333333, 0, 1, 1,
0.6188247, -1.37475, 3.107577, 0.3372549, 0, 1, 1,
0.619166, 0.3833369, 1.30533, 0.345098, 0, 1, 1,
0.6222746, 1.347928, -2.458097, 0.3490196, 0, 1, 1,
0.6222817, 0.9866779, 1.213972, 0.3568628, 0, 1, 1,
0.6225606, 1.357189, 0.3040275, 0.3607843, 0, 1, 1,
0.624631, -0.6990554, 2.805821, 0.3686275, 0, 1, 1,
0.6259173, 0.6653307, -0.6300889, 0.372549, 0, 1, 1,
0.6273023, -1.856785, 1.788773, 0.3803922, 0, 1, 1,
0.6284853, -0.6928778, 3.195261, 0.3843137, 0, 1, 1,
0.6305716, -1.938234, 2.497411, 0.3921569, 0, 1, 1,
0.6351526, 1.513933, 0.510391, 0.3960784, 0, 1, 1,
0.6353505, -0.01553613, 0.8326622, 0.4039216, 0, 1, 1,
0.6377351, -0.3228679, 1.956287, 0.4117647, 0, 1, 1,
0.6400304, 0.03676514, 0.04204807, 0.4156863, 0, 1, 1,
0.6407053, 0.7184433, 1.227931, 0.4235294, 0, 1, 1,
0.6455316, -0.02135307, 1.192292, 0.427451, 0, 1, 1,
0.6455389, 1.376888, 1.190239, 0.4352941, 0, 1, 1,
0.6476601, -1.558035, 2.980408, 0.4392157, 0, 1, 1,
0.654678, -0.3347157, 2.99589, 0.4470588, 0, 1, 1,
0.6606299, 0.166125, 3.107617, 0.4509804, 0, 1, 1,
0.6687973, -0.7182606, 1.599659, 0.4588235, 0, 1, 1,
0.6701028, 1.343601, 0.2673269, 0.4627451, 0, 1, 1,
0.6730324, 0.03441187, 0.9068504, 0.4705882, 0, 1, 1,
0.6751476, 0.3909135, 0.8807781, 0.4745098, 0, 1, 1,
0.678713, 0.4724379, 1.753437, 0.4823529, 0, 1, 1,
0.6834083, 0.5173919, 0.3343992, 0.4862745, 0, 1, 1,
0.6851536, -0.4089839, 0.5329548, 0.4941176, 0, 1, 1,
0.6865637, -1.560297, 3.391925, 0.5019608, 0, 1, 1,
0.6877145, -0.6428004, 2.787978, 0.5058824, 0, 1, 1,
0.6882919, -1.381725, 2.499517, 0.5137255, 0, 1, 1,
0.6893394, 1.006368, 1.687032, 0.5176471, 0, 1, 1,
0.6895924, -0.292947, 1.148933, 0.5254902, 0, 1, 1,
0.6940473, 0.2599026, 0.7095575, 0.5294118, 0, 1, 1,
0.6964971, -0.4408808, 2.481124, 0.5372549, 0, 1, 1,
0.6990275, 0.1030146, 0.9553483, 0.5411765, 0, 1, 1,
0.7002133, -0.5045319, 1.990031, 0.5490196, 0, 1, 1,
0.7027049, -0.6984962, 1.193518, 0.5529412, 0, 1, 1,
0.704765, -0.5080863, 3.380168, 0.5607843, 0, 1, 1,
0.7056918, -1.419295, 3.922932, 0.5647059, 0, 1, 1,
0.7086751, 0.6556414, 1.059178, 0.572549, 0, 1, 1,
0.7097721, 1.807838, -1.456319, 0.5764706, 0, 1, 1,
0.7139601, -2.404596, 4.846781, 0.5843138, 0, 1, 1,
0.7200993, 1.808573, 1.055116, 0.5882353, 0, 1, 1,
0.7268067, 0.7543047, 0.339207, 0.5960785, 0, 1, 1,
0.7279202, -0.3051916, 2.461674, 0.6039216, 0, 1, 1,
0.7306962, 0.1527967, 3.267729, 0.6078432, 0, 1, 1,
0.7312293, 0.5797773, -0.02979502, 0.6156863, 0, 1, 1,
0.7326164, 0.719372, 0.4803451, 0.6196079, 0, 1, 1,
0.7330508, 0.3705377, 1.733839, 0.627451, 0, 1, 1,
0.735607, 1.151634, 1.128543, 0.6313726, 0, 1, 1,
0.7400783, 0.3028447, -0.2181607, 0.6392157, 0, 1, 1,
0.7414576, 0.8009853, -0.5723156, 0.6431373, 0, 1, 1,
0.7417453, -0.07857774, 2.023509, 0.6509804, 0, 1, 1,
0.7480049, 1.102247, -0.3357166, 0.654902, 0, 1, 1,
0.7550497, 2.579698, 1.434525, 0.6627451, 0, 1, 1,
0.7560337, 0.1853488, 0.2041295, 0.6666667, 0, 1, 1,
0.7653173, 0.05186952, 4.250654, 0.6745098, 0, 1, 1,
0.7683095, 0.4570041, 0.7698471, 0.6784314, 0, 1, 1,
0.7703381, -1.047133, 2.643719, 0.6862745, 0, 1, 1,
0.7876474, 2.046024, 0.4221263, 0.6901961, 0, 1, 1,
0.7913761, 0.05762462, 3.050919, 0.6980392, 0, 1, 1,
0.7960814, 1.644196, 0.7215649, 0.7058824, 0, 1, 1,
0.7981504, -0.06287625, 1.722969, 0.7098039, 0, 1, 1,
0.8015846, -0.2789167, 0.7026834, 0.7176471, 0, 1, 1,
0.8045022, 0.4267143, 1.748826, 0.7215686, 0, 1, 1,
0.8048008, -0.8402881, 2.156606, 0.7294118, 0, 1, 1,
0.8055951, 0.8682847, -0.02215134, 0.7333333, 0, 1, 1,
0.8157976, 1.182773, 0.4664084, 0.7411765, 0, 1, 1,
0.8184686, 0.8853912, 0.9317383, 0.7450981, 0, 1, 1,
0.8192664, 1.737379, 1.788694, 0.7529412, 0, 1, 1,
0.8195967, -2.800018, 3.377327, 0.7568628, 0, 1, 1,
0.8226222, 0.4810744, 1.801478, 0.7647059, 0, 1, 1,
0.8260373, 0.9424176, -0.07638898, 0.7686275, 0, 1, 1,
0.8273661, 1.828743, 1.44305, 0.7764706, 0, 1, 1,
0.8291445, 0.841491, -0.5085577, 0.7803922, 0, 1, 1,
0.83481, -0.9519944, 1.066901, 0.7882353, 0, 1, 1,
0.837514, 0.5526215, -0.6087255, 0.7921569, 0, 1, 1,
0.8378013, 0.2126341, 2.427116, 0.8, 0, 1, 1,
0.8378879, -0.03923536, 1.768626, 0.8078431, 0, 1, 1,
0.8431694, 1.331749, 0.09049845, 0.8117647, 0, 1, 1,
0.8455328, -0.928214, 2.210592, 0.8196079, 0, 1, 1,
0.8491004, -0.211207, 2.144089, 0.8235294, 0, 1, 1,
0.8494119, 0.5793374, 0.5195701, 0.8313726, 0, 1, 1,
0.849613, -0.9233628, 2.714313, 0.8352941, 0, 1, 1,
0.8555776, -1.864991, 4.810038, 0.8431373, 0, 1, 1,
0.8810261, -0.03877849, 1.805378, 0.8470588, 0, 1, 1,
0.8864374, -0.2351454, 2.518229, 0.854902, 0, 1, 1,
0.8934335, 1.647305, 2.101788, 0.8588235, 0, 1, 1,
0.9137699, -2.351766, 2.212479, 0.8666667, 0, 1, 1,
0.923369, -0.2196316, 1.146942, 0.8705882, 0, 1, 1,
0.9266998, 1.069577, -0.8975937, 0.8784314, 0, 1, 1,
0.9375833, -1.20927, 2.989902, 0.8823529, 0, 1, 1,
0.9412519, -0.07951991, 3.313585, 0.8901961, 0, 1, 1,
0.9419653, -1.175546, 2.609803, 0.8941177, 0, 1, 1,
0.948292, -0.8414316, 2.683155, 0.9019608, 0, 1, 1,
0.9539762, 1.254802, 2.449124, 0.9098039, 0, 1, 1,
0.959775, -0.107221, 2.79534, 0.9137255, 0, 1, 1,
0.9624751, 0.2844942, 0.7993093, 0.9215686, 0, 1, 1,
0.9650009, 0.7918639, -0.2945883, 0.9254902, 0, 1, 1,
0.9656562, 0.1481744, 2.001022, 0.9333333, 0, 1, 1,
0.9765126, -0.0361258, 0.5114803, 0.9372549, 0, 1, 1,
0.9822212, -1.065354, 3.770911, 0.945098, 0, 1, 1,
0.9867151, 0.3295386, 1.310127, 0.9490196, 0, 1, 1,
0.9908847, -1.620538, 3.360355, 0.9568627, 0, 1, 1,
0.991992, 1.109641, 1.937203, 0.9607843, 0, 1, 1,
0.9967274, 0.1605549, 2.131157, 0.9686275, 0, 1, 1,
1.003662, 0.0674063, -0.8033576, 0.972549, 0, 1, 1,
1.009078, 0.4666757, 1.082264, 0.9803922, 0, 1, 1,
1.019847, -0.5527711, 0.6229582, 0.9843137, 0, 1, 1,
1.021134, 1.618272, 0.8228012, 0.9921569, 0, 1, 1,
1.027237, -0.6777831, 2.69268, 0.9960784, 0, 1, 1,
1.030144, -0.9280651, 2.850013, 1, 0, 0.9960784, 1,
1.03265, 1.296757, 1.633625, 1, 0, 0.9882353, 1,
1.038614, 0.1539413, 3.381205, 1, 0, 0.9843137, 1,
1.040106, 0.3554556, 1.106991, 1, 0, 0.9764706, 1,
1.040457, -0.9452934, 2.988912, 1, 0, 0.972549, 1,
1.041647, 1.249767, -2.143776, 1, 0, 0.9647059, 1,
1.049822, 0.958724, 0.3978399, 1, 0, 0.9607843, 1,
1.051011, 1.203014, 0.822278, 1, 0, 0.9529412, 1,
1.058363, 0.8045259, 1.729877, 1, 0, 0.9490196, 1,
1.071418, 1.344684, 0.6701041, 1, 0, 0.9411765, 1,
1.088769, -0.05844998, 1.510914, 1, 0, 0.9372549, 1,
1.088817, 0.6360165, 2.747518, 1, 0, 0.9294118, 1,
1.089969, 2.787385, 1.410579, 1, 0, 0.9254902, 1,
1.09134, 1.420495, -1.101687, 1, 0, 0.9176471, 1,
1.092379, 0.7668208, 2.434735, 1, 0, 0.9137255, 1,
1.093374, 1.086692, 3.834463, 1, 0, 0.9058824, 1,
1.101059, -0.1661419, 1.383558, 1, 0, 0.9019608, 1,
1.10284, 1.164881, 0.3339918, 1, 0, 0.8941177, 1,
1.103201, 1.737461, 1.834594, 1, 0, 0.8862745, 1,
1.106947, -0.8093024, 1.144636, 1, 0, 0.8823529, 1,
1.115528, 0.4101269, 1.71707, 1, 0, 0.8745098, 1,
1.117361, 0.3806555, 1.440742, 1, 0, 0.8705882, 1,
1.119328, -0.6529807, 1.610069, 1, 0, 0.8627451, 1,
1.121024, 1.402897, 0.247489, 1, 0, 0.8588235, 1,
1.12419, -0.6711568, 3.66682, 1, 0, 0.8509804, 1,
1.129212, 0.02737094, 2.267966, 1, 0, 0.8470588, 1,
1.131681, -0.8687998, 1.814152, 1, 0, 0.8392157, 1,
1.133644, 1.659814, 0.9483534, 1, 0, 0.8352941, 1,
1.134192, -0.6440948, 2.430971, 1, 0, 0.827451, 1,
1.13547, 0.8010285, -0.0465944, 1, 0, 0.8235294, 1,
1.13644, 0.4508251, 0.7392909, 1, 0, 0.8156863, 1,
1.140668, -1.409883, 2.865712, 1, 0, 0.8117647, 1,
1.143138, 0.03230555, 0.7463665, 1, 0, 0.8039216, 1,
1.148014, -0.5809124, 1.700969, 1, 0, 0.7960784, 1,
1.169902, 0.4868813, 0.05334519, 1, 0, 0.7921569, 1,
1.179734, 0.1788769, 2.140557, 1, 0, 0.7843137, 1,
1.197851, 0.1003672, 2.361202, 1, 0, 0.7803922, 1,
1.201468, -1.675894, 1.253261, 1, 0, 0.772549, 1,
1.203568, -0.5791357, 1.593213, 1, 0, 0.7686275, 1,
1.206888, 0.01370164, 2.110035, 1, 0, 0.7607843, 1,
1.211699, 0.03967817, 2.307145, 1, 0, 0.7568628, 1,
1.215702, -1.360778, 2.788228, 1, 0, 0.7490196, 1,
1.217764, 0.09499589, 1.268614, 1, 0, 0.7450981, 1,
1.218676, 0.451243, 2.853409, 1, 0, 0.7372549, 1,
1.223843, 0.3240632, 2.687182, 1, 0, 0.7333333, 1,
1.225656, 0.1876233, 1.90132, 1, 0, 0.7254902, 1,
1.23216, -1.639799, 2.822534, 1, 0, 0.7215686, 1,
1.236537, -0.1480307, 1.376539, 1, 0, 0.7137255, 1,
1.242981, 0.8307167, 0.8453358, 1, 0, 0.7098039, 1,
1.248082, 0.2491604, 1.444154, 1, 0, 0.7019608, 1,
1.253775, 0.2009763, 1.052809, 1, 0, 0.6941177, 1,
1.260323, 0.2468124, 2.281409, 1, 0, 0.6901961, 1,
1.263747, -0.8500229, 1.291081, 1, 0, 0.682353, 1,
1.266905, -1.135035, 2.376614, 1, 0, 0.6784314, 1,
1.273342, 0.4442252, 1.21479, 1, 0, 0.6705883, 1,
1.275239, -0.06187151, 3.231408, 1, 0, 0.6666667, 1,
1.281414, 0.3087841, 0.5521868, 1, 0, 0.6588235, 1,
1.291554, -0.7082703, 0.4649973, 1, 0, 0.654902, 1,
1.292502, -1.428822, 1.96314, 1, 0, 0.6470588, 1,
1.296475, -0.07323219, 3.201859, 1, 0, 0.6431373, 1,
1.299511, -0.852716, -0.0102105, 1, 0, 0.6352941, 1,
1.30405, 1.00321, -0.1687324, 1, 0, 0.6313726, 1,
1.306694, 0.9442233, 0.4940411, 1, 0, 0.6235294, 1,
1.308377, 0.2495121, 2.741232, 1, 0, 0.6196079, 1,
1.309689, 1.363105, -0.6566021, 1, 0, 0.6117647, 1,
1.312701, 0.01605659, 2.152575, 1, 0, 0.6078432, 1,
1.316003, 1.755818, 1.407103, 1, 0, 0.6, 1,
1.316015, 0.3228978, 0.9880873, 1, 0, 0.5921569, 1,
1.317028, 0.6392929, 1.519059, 1, 0, 0.5882353, 1,
1.32026, 0.832832, 2.35698, 1, 0, 0.5803922, 1,
1.330736, -0.02330291, -0.1561474, 1, 0, 0.5764706, 1,
1.333344, -2.129165, 2.782533, 1, 0, 0.5686275, 1,
1.337761, -1.860895, 1.648295, 1, 0, 0.5647059, 1,
1.338465, -1.70111, 1.881325, 1, 0, 0.5568628, 1,
1.339126, 0.700725, 1.258645, 1, 0, 0.5529412, 1,
1.339162, 0.3122395, 0.244622, 1, 0, 0.5450981, 1,
1.346804, 0.4102794, 0.1434795, 1, 0, 0.5411765, 1,
1.35137, -1.109445, 2.349318, 1, 0, 0.5333334, 1,
1.360859, -1.256162, 1.317663, 1, 0, 0.5294118, 1,
1.360906, 0.6361278, 1.196404, 1, 0, 0.5215687, 1,
1.367293, -0.2289537, 2.521894, 1, 0, 0.5176471, 1,
1.370231, 0.7575178, -0.2783625, 1, 0, 0.509804, 1,
1.382525, -1.226185, 1.127322, 1, 0, 0.5058824, 1,
1.385317, -1.345465, 2.668546, 1, 0, 0.4980392, 1,
1.397905, 1.076041, -0.2045989, 1, 0, 0.4901961, 1,
1.409419, -0.6276492, 2.758151, 1, 0, 0.4862745, 1,
1.410271, 0.5214617, 1.295149, 1, 0, 0.4784314, 1,
1.414544, 0.6578978, 1.486523, 1, 0, 0.4745098, 1,
1.414568, -0.7593968, 0.4685896, 1, 0, 0.4666667, 1,
1.417543, 1.63515, 0.2144957, 1, 0, 0.4627451, 1,
1.418628, -1.245122, 1.939769, 1, 0, 0.454902, 1,
1.419084, 1.52771, 1.277144, 1, 0, 0.4509804, 1,
1.419494, 0.2955698, 0.3125469, 1, 0, 0.4431373, 1,
1.426267, -0.3066868, 1.070818, 1, 0, 0.4392157, 1,
1.428085, -0.004664426, 1.307472, 1, 0, 0.4313726, 1,
1.429208, -2.339214, 4.518001, 1, 0, 0.427451, 1,
1.446447, 1.345449, 0.9485555, 1, 0, 0.4196078, 1,
1.461525, -0.7160515, 2.268298, 1, 0, 0.4156863, 1,
1.496751, 0.6364848, 1.441626, 1, 0, 0.4078431, 1,
1.526233, -0.3505178, 2.015035, 1, 0, 0.4039216, 1,
1.533737, -0.8046159, 2.724705, 1, 0, 0.3960784, 1,
1.540739, 1.28092, 0.02786925, 1, 0, 0.3882353, 1,
1.54125, 0.5422449, 0.9312591, 1, 0, 0.3843137, 1,
1.563997, 0.4871567, 1.726586, 1, 0, 0.3764706, 1,
1.566637, 0.1414642, 2.773747, 1, 0, 0.372549, 1,
1.566795, -0.9303859, 2.845667, 1, 0, 0.3647059, 1,
1.586819, -1.195489, 3.890511, 1, 0, 0.3607843, 1,
1.591383, -0.3619706, 1.758775, 1, 0, 0.3529412, 1,
1.600941, -0.3042267, 1.728097, 1, 0, 0.3490196, 1,
1.61418, 0.6981889, 1.996503, 1, 0, 0.3411765, 1,
1.622029, -0.4473203, 0.7697018, 1, 0, 0.3372549, 1,
1.622206, -0.6166565, 2.407135, 1, 0, 0.3294118, 1,
1.623687, -1.177307, 3.325853, 1, 0, 0.3254902, 1,
1.625825, -0.2632187, 2.953096, 1, 0, 0.3176471, 1,
1.629283, 0.1460045, 2.498741, 1, 0, 0.3137255, 1,
1.635642, 0.8359013, -0.1568284, 1, 0, 0.3058824, 1,
1.640582, -0.718372, 0.9551525, 1, 0, 0.2980392, 1,
1.643374, -0.5150641, 1.347918, 1, 0, 0.2941177, 1,
1.648625, 0.653765, 0.8032877, 1, 0, 0.2862745, 1,
1.654384, -0.4673859, 1.888792, 1, 0, 0.282353, 1,
1.662312, 0.5579548, 1.225311, 1, 0, 0.2745098, 1,
1.664333, 0.3650613, 1.771394, 1, 0, 0.2705882, 1,
1.679303, 0.4194907, 0.1871195, 1, 0, 0.2627451, 1,
1.683731, -1.059289, 1.557627, 1, 0, 0.2588235, 1,
1.691639, 1.012475, 0.231692, 1, 0, 0.2509804, 1,
1.692026, 1.553585, -1.116467, 1, 0, 0.2470588, 1,
1.733445, -1.267252, 1.857511, 1, 0, 0.2392157, 1,
1.734534, -0.2396099, 0.2289948, 1, 0, 0.2352941, 1,
1.735564, -0.4198371, 0.53496, 1, 0, 0.227451, 1,
1.737226, 0.1142903, 1.501858, 1, 0, 0.2235294, 1,
1.754451, -1.267903, 2.651628, 1, 0, 0.2156863, 1,
1.772701, -0.8973246, 1.775919, 1, 0, 0.2117647, 1,
1.780334, -1.642767, 0.9313605, 1, 0, 0.2039216, 1,
1.782008, -0.1440458, 1.410986, 1, 0, 0.1960784, 1,
1.839674, 2.012277, 1.83784, 1, 0, 0.1921569, 1,
1.845954, 0.5184944, -1.111447, 1, 0, 0.1843137, 1,
1.857292, 2.542292, 2.423705, 1, 0, 0.1803922, 1,
1.868986, 1.052375, -0.1117845, 1, 0, 0.172549, 1,
1.87194, -0.3686823, 0.4259076, 1, 0, 0.1686275, 1,
1.881739, -1.778248, 2.641035, 1, 0, 0.1607843, 1,
1.915559, -0.9151142, 3.313027, 1, 0, 0.1568628, 1,
1.929971, -1.515719, 3.070584, 1, 0, 0.1490196, 1,
1.937772, 0.8493884, 1.209954, 1, 0, 0.145098, 1,
1.94611, -0.292911, 1.774517, 1, 0, 0.1372549, 1,
1.965581, -0.7732286, 1.735726, 1, 0, 0.1333333, 1,
1.973435, -0.1881281, 3.37634, 1, 0, 0.1254902, 1,
1.986522, 0.5852334, 0.2228354, 1, 0, 0.1215686, 1,
1.988721, -0.953513, 1.820981, 1, 0, 0.1137255, 1,
2.023799, -0.5688255, 2.051912, 1, 0, 0.1098039, 1,
2.026623, -2.75191, 2.221664, 1, 0, 0.1019608, 1,
2.029154, -0.1911109, 0.5093785, 1, 0, 0.09411765, 1,
2.032711, -0.56811, 2.31495, 1, 0, 0.09019608, 1,
2.035011, -1.512817, 2.266088, 1, 0, 0.08235294, 1,
2.102366, -0.5708796, 2.311138, 1, 0, 0.07843138, 1,
2.169847, -0.127434, 2.372843, 1, 0, 0.07058824, 1,
2.19499, -0.06973676, 2.39282, 1, 0, 0.06666667, 1,
2.241152, 0.7878428, 1.795239, 1, 0, 0.05882353, 1,
2.252225, -1.309173, 0.6303279, 1, 0, 0.05490196, 1,
2.422089, 0.9089837, 2.150797, 1, 0, 0.04705882, 1,
2.634298, -0.4552232, 2.842095, 1, 0, 0.04313726, 1,
2.65261, -1.142772, 1.671462, 1, 0, 0.03529412, 1,
2.693422, 1.130769, 0.2475924, 1, 0, 0.03137255, 1,
2.740186, -0.704136, 0.3442082, 1, 0, 0.02352941, 1,
2.85343, -1.137882, 2.288428, 1, 0, 0.01960784, 1,
2.946704, -0.6310408, 2.562344, 1, 0, 0.01176471, 1,
3.236561, -0.678607, 2.537735, 1, 0, 0.007843138, 1
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
-0.4828018, -4.861532, -7.565606, 0, -0.5, 0.5, 0.5,
-0.4828018, -4.861532, -7.565606, 1, -0.5, 0.5, 0.5,
-0.4828018, -4.861532, -7.565606, 1, 1.5, 0.5, 0.5,
-0.4828018, -4.861532, -7.565606, 0, 1.5, 0.5, 0.5
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
-5.463028, -0.1964197, -7.565606, 0, -0.5, 0.5, 0.5,
-5.463028, -0.1964197, -7.565606, 1, -0.5, 0.5, 0.5,
-5.463028, -0.1964197, -7.565606, 1, 1.5, 0.5, 0.5,
-5.463028, -0.1964197, -7.565606, 0, 1.5, 0.5, 0.5
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
-5.463028, -4.861532, -0.1229825, 0, -0.5, 0.5, 0.5,
-5.463028, -4.861532, -0.1229825, 1, -0.5, 0.5, 0.5,
-5.463028, -4.861532, -0.1229825, 1, 1.5, 0.5, 0.5,
-5.463028, -4.861532, -0.1229825, 0, 1.5, 0.5, 0.5
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
-4, -3.784968, -5.848078,
2, -3.784968, -5.848078,
-4, -3.784968, -5.848078,
-4, -3.964395, -6.134333,
-2, -3.784968, -5.848078,
-2, -3.964395, -6.134333,
0, -3.784968, -5.848078,
0, -3.964395, -6.134333,
2, -3.784968, -5.848078,
2, -3.964395, -6.134333
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
"-4",
"-2",
"0",
"2"
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
-4, -4.32325, -6.706842, 0, -0.5, 0.5, 0.5,
-4, -4.32325, -6.706842, 1, -0.5, 0.5, 0.5,
-4, -4.32325, -6.706842, 1, 1.5, 0.5, 0.5,
-4, -4.32325, -6.706842, 0, 1.5, 0.5, 0.5,
-2, -4.32325, -6.706842, 0, -0.5, 0.5, 0.5,
-2, -4.32325, -6.706842, 1, -0.5, 0.5, 0.5,
-2, -4.32325, -6.706842, 1, 1.5, 0.5, 0.5,
-2, -4.32325, -6.706842, 0, 1.5, 0.5, 0.5,
0, -4.32325, -6.706842, 0, -0.5, 0.5, 0.5,
0, -4.32325, -6.706842, 1, -0.5, 0.5, 0.5,
0, -4.32325, -6.706842, 1, 1.5, 0.5, 0.5,
0, -4.32325, -6.706842, 0, 1.5, 0.5, 0.5,
2, -4.32325, -6.706842, 0, -0.5, 0.5, 0.5,
2, -4.32325, -6.706842, 1, -0.5, 0.5, 0.5,
2, -4.32325, -6.706842, 1, 1.5, 0.5, 0.5,
2, -4.32325, -6.706842, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.313745, -3, -5.848078,
-4.313745, 3, -5.848078,
-4.313745, -3, -5.848078,
-4.505293, -3, -6.134333,
-4.313745, -2, -5.848078,
-4.505293, -2, -6.134333,
-4.313745, -1, -5.848078,
-4.505293, -1, -6.134333,
-4.313745, 0, -5.848078,
-4.505293, 0, -6.134333,
-4.313745, 1, -5.848078,
-4.505293, 1, -6.134333,
-4.313745, 2, -5.848078,
-4.505293, 2, -6.134333,
-4.313745, 3, -5.848078,
-4.505293, 3, -6.134333
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
"-3",
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
-4.888387, -3, -6.706842, 0, -0.5, 0.5, 0.5,
-4.888387, -3, -6.706842, 1, -0.5, 0.5, 0.5,
-4.888387, -3, -6.706842, 1, 1.5, 0.5, 0.5,
-4.888387, -3, -6.706842, 0, 1.5, 0.5, 0.5,
-4.888387, -2, -6.706842, 0, -0.5, 0.5, 0.5,
-4.888387, -2, -6.706842, 1, -0.5, 0.5, 0.5,
-4.888387, -2, -6.706842, 1, 1.5, 0.5, 0.5,
-4.888387, -2, -6.706842, 0, 1.5, 0.5, 0.5,
-4.888387, -1, -6.706842, 0, -0.5, 0.5, 0.5,
-4.888387, -1, -6.706842, 1, -0.5, 0.5, 0.5,
-4.888387, -1, -6.706842, 1, 1.5, 0.5, 0.5,
-4.888387, -1, -6.706842, 0, 1.5, 0.5, 0.5,
-4.888387, 0, -6.706842, 0, -0.5, 0.5, 0.5,
-4.888387, 0, -6.706842, 1, -0.5, 0.5, 0.5,
-4.888387, 0, -6.706842, 1, 1.5, 0.5, 0.5,
-4.888387, 0, -6.706842, 0, 1.5, 0.5, 0.5,
-4.888387, 1, -6.706842, 0, -0.5, 0.5, 0.5,
-4.888387, 1, -6.706842, 1, -0.5, 0.5, 0.5,
-4.888387, 1, -6.706842, 1, 1.5, 0.5, 0.5,
-4.888387, 1, -6.706842, 0, 1.5, 0.5, 0.5,
-4.888387, 2, -6.706842, 0, -0.5, 0.5, 0.5,
-4.888387, 2, -6.706842, 1, -0.5, 0.5, 0.5,
-4.888387, 2, -6.706842, 1, 1.5, 0.5, 0.5,
-4.888387, 2, -6.706842, 0, 1.5, 0.5, 0.5,
-4.888387, 3, -6.706842, 0, -0.5, 0.5, 0.5,
-4.888387, 3, -6.706842, 1, -0.5, 0.5, 0.5,
-4.888387, 3, -6.706842, 1, 1.5, 0.5, 0.5,
-4.888387, 3, -6.706842, 0, 1.5, 0.5, 0.5
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
-4.313745, -3.784968, -4,
-4.313745, -3.784968, 4,
-4.313745, -3.784968, -4,
-4.505293, -3.964395, -4,
-4.313745, -3.784968, -2,
-4.505293, -3.964395, -2,
-4.313745, -3.784968, 0,
-4.505293, -3.964395, 0,
-4.313745, -3.784968, 2,
-4.505293, -3.964395, 2,
-4.313745, -3.784968, 4,
-4.505293, -3.964395, 4
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
-4.888387, -4.32325, -4, 0, -0.5, 0.5, 0.5,
-4.888387, -4.32325, -4, 1, -0.5, 0.5, 0.5,
-4.888387, -4.32325, -4, 1, 1.5, 0.5, 0.5,
-4.888387, -4.32325, -4, 0, 1.5, 0.5, 0.5,
-4.888387, -4.32325, -2, 0, -0.5, 0.5, 0.5,
-4.888387, -4.32325, -2, 1, -0.5, 0.5, 0.5,
-4.888387, -4.32325, -2, 1, 1.5, 0.5, 0.5,
-4.888387, -4.32325, -2, 0, 1.5, 0.5, 0.5,
-4.888387, -4.32325, 0, 0, -0.5, 0.5, 0.5,
-4.888387, -4.32325, 0, 1, -0.5, 0.5, 0.5,
-4.888387, -4.32325, 0, 1, 1.5, 0.5, 0.5,
-4.888387, -4.32325, 0, 0, 1.5, 0.5, 0.5,
-4.888387, -4.32325, 2, 0, -0.5, 0.5, 0.5,
-4.888387, -4.32325, 2, 1, -0.5, 0.5, 0.5,
-4.888387, -4.32325, 2, 1, 1.5, 0.5, 0.5,
-4.888387, -4.32325, 2, 0, 1.5, 0.5, 0.5,
-4.888387, -4.32325, 4, 0, -0.5, 0.5, 0.5,
-4.888387, -4.32325, 4, 1, -0.5, 0.5, 0.5,
-4.888387, -4.32325, 4, 1, 1.5, 0.5, 0.5,
-4.888387, -4.32325, 4, 0, 1.5, 0.5, 0.5
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
-4.313745, -3.784968, -5.848078,
-4.313745, 3.392128, -5.848078,
-4.313745, -3.784968, 5.602113,
-4.313745, 3.392128, 5.602113,
-4.313745, -3.784968, -5.848078,
-4.313745, -3.784968, 5.602113,
-4.313745, 3.392128, -5.848078,
-4.313745, 3.392128, 5.602113,
-4.313745, -3.784968, -5.848078,
3.348142, -3.784968, -5.848078,
-4.313745, -3.784968, 5.602113,
3.348142, -3.784968, 5.602113,
-4.313745, 3.392128, -5.848078,
3.348142, 3.392128, -5.848078,
-4.313745, 3.392128, 5.602113,
3.348142, 3.392128, 5.602113,
3.348142, -3.784968, -5.848078,
3.348142, 3.392128, -5.848078,
3.348142, -3.784968, 5.602113,
3.348142, 3.392128, 5.602113,
3.348142, -3.784968, -5.848078,
3.348142, -3.784968, 5.602113,
3.348142, 3.392128, -5.848078,
3.348142, 3.392128, 5.602113
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
var radius = 8.295145;
var distance = 36.90604;
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
mvMatrix.translate( 0.4828018, 0.1964197, 0.1229825 );
mvMatrix.scale( 1.170583, 1.249652, 0.7832947 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.90604);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
Monoethylamine_Hydro<-read.table("Monoethylamine_Hydro.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Monoethylamine_Hydro$V2
```

```
## Error in eval(expr, envir, enclos): object 'Monoethylamine_Hydro' not found
```

```r
y<-Monoethylamine_Hydro$V3
```

```
## Error in eval(expr, envir, enclos): object 'Monoethylamine_Hydro' not found
```

```r
z<-Monoethylamine_Hydro$V4
```

```
## Error in eval(expr, envir, enclos): object 'Monoethylamine_Hydro' not found
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
-4.202165, -1.582195, -3.129865, 0, 0, 1, 1, 1,
-2.764383, -0.09506169, -1.219343, 1, 0, 0, 1, 1,
-2.75661, -0.5690635, -1.326165, 1, 0, 0, 1, 1,
-2.750781, 0.868804, -2.215698, 1, 0, 0, 1, 1,
-2.696219, -0.5526479, -2.51552, 1, 0, 0, 1, 1,
-2.682447, 0.7490172, -0.6403649, 1, 0, 0, 1, 1,
-2.496505, 0.6969699, -0.1348773, 0, 0, 0, 1, 1,
-2.482817, 0.5022816, -0.9298629, 0, 0, 0, 1, 1,
-2.435705, -0.7146077, -2.559218, 0, 0, 0, 1, 1,
-2.430577, -0.004709674, -1.851162, 0, 0, 0, 1, 1,
-2.37271, -1.635526, -2.490669, 0, 0, 0, 1, 1,
-2.349223, -1.331731, -2.531016, 0, 0, 0, 1, 1,
-2.345704, -1.335743, -3.329527, 0, 0, 0, 1, 1,
-2.33989, 0.4628534, -2.466979, 1, 1, 1, 1, 1,
-2.329278, -1.764194, -3.006645, 1, 1, 1, 1, 1,
-2.313102, 0.04357067, 0.7819953, 1, 1, 1, 1, 1,
-2.273674, -0.09458783, -2.568215, 1, 1, 1, 1, 1,
-2.216531, 0.4747175, 0.2677664, 1, 1, 1, 1, 1,
-2.196629, -0.405209, -2.072461, 1, 1, 1, 1, 1,
-2.188888, -0.6561351, -1.57969, 1, 1, 1, 1, 1,
-2.111891, -0.02245683, -1.287926, 1, 1, 1, 1, 1,
-2.086503, 1.96242, 0.2801699, 1, 1, 1, 1, 1,
-2.082971, -0.6001166, -1.105821, 1, 1, 1, 1, 1,
-2.059198, -0.8315161, -1.455835, 1, 1, 1, 1, 1,
-2.029854, -0.4595858, 0.01148468, 1, 1, 1, 1, 1,
-1.97123, 0.6181139, -2.013202, 1, 1, 1, 1, 1,
-1.939784, 0.6449819, -1.307612, 1, 1, 1, 1, 1,
-1.928171, -0.8446678, -2.010275, 1, 1, 1, 1, 1,
-1.919282, -1.356499, -2.533329, 0, 0, 1, 1, 1,
-1.880164, 0.4549134, -3.504768, 1, 0, 0, 1, 1,
-1.863578, -0.3339019, -3.330955, 1, 0, 0, 1, 1,
-1.85619, -0.6556974, -2.387667, 1, 0, 0, 1, 1,
-1.855418, -0.6200553, -2.769114, 1, 0, 0, 1, 1,
-1.85158, -1.231476, -2.29626, 1, 0, 0, 1, 1,
-1.843936, 0.6525952, -1.030926, 0, 0, 0, 1, 1,
-1.833516, -1.090894, -2.193748, 0, 0, 0, 1, 1,
-1.830007, 0.8673108, 0.05214949, 0, 0, 0, 1, 1,
-1.829772, -0.01158992, -3.39835, 0, 0, 0, 1, 1,
-1.827129, 0.4730784, -0.3391082, 0, 0, 0, 1, 1,
-1.817889, -0.3038054, -3.425129, 0, 0, 0, 1, 1,
-1.786201, -1.378973, -3.310069, 0, 0, 0, 1, 1,
-1.78591, 0.07722275, -1.010578, 1, 1, 1, 1, 1,
-1.774675, 1.086712, -0.03272986, 1, 1, 1, 1, 1,
-1.771595, -0.6620528, -3.465774, 1, 1, 1, 1, 1,
-1.770156, -2.690579, -2.780018, 1, 1, 1, 1, 1,
-1.754302, -0.4936266, -1.924298, 1, 1, 1, 1, 1,
-1.745651, 0.8173808, 0.9203176, 1, 1, 1, 1, 1,
-1.740485, 0.4426616, -1.347287, 1, 1, 1, 1, 1,
-1.73671, 1.365127, -1.05283, 1, 1, 1, 1, 1,
-1.735042, -0.7003696, -1.552681, 1, 1, 1, 1, 1,
-1.720448, 0.3952367, -1.38552, 1, 1, 1, 1, 1,
-1.699071, -0.09252605, -1.890151, 1, 1, 1, 1, 1,
-1.698344, 0.5756815, -1.226964, 1, 1, 1, 1, 1,
-1.692214, 3.287608, -2.375294, 1, 1, 1, 1, 1,
-1.676176, -0.5442569, -4.612644, 1, 1, 1, 1, 1,
-1.675001, -0.0760524, 0.703346, 1, 1, 1, 1, 1,
-1.660593, 0.6245295, -1.68666, 0, 0, 1, 1, 1,
-1.648306, -0.3022277, -2.016899, 1, 0, 0, 1, 1,
-1.639179, 0.6823087, -1.261153, 1, 0, 0, 1, 1,
-1.621341, -0.2341795, -0.8608676, 1, 0, 0, 1, 1,
-1.61423, -0.01803753, 0.009111921, 1, 0, 0, 1, 1,
-1.610524, -0.9507625, -2.851772, 1, 0, 0, 1, 1,
-1.591858, -0.06562635, -1.62403, 0, 0, 0, 1, 1,
-1.566602, -1.263999, -1.756644, 0, 0, 0, 1, 1,
-1.556709, -1.093881, -2.05641, 0, 0, 0, 1, 1,
-1.536897, -1.480654, -4.129675, 0, 0, 0, 1, 1,
-1.533725, -1.256683, -2.450264, 0, 0, 0, 1, 1,
-1.529065, 0.2952684, -1.780964, 0, 0, 0, 1, 1,
-1.527064, 0.07841851, -0.8374336, 0, 0, 0, 1, 1,
-1.518065, -1.705254, -5.148237, 1, 1, 1, 1, 1,
-1.508205, -1.342944, -1.216053, 1, 1, 1, 1, 1,
-1.489038, 0.009895195, -0.8616091, 1, 1, 1, 1, 1,
-1.486511, -1.069201, -2.984744, 1, 1, 1, 1, 1,
-1.470188, -1.567898, -1.730277, 1, 1, 1, 1, 1,
-1.469276, 0.5990945, -2.292045, 1, 1, 1, 1, 1,
-1.464201, -0.3051852, 0.7093079, 1, 1, 1, 1, 1,
-1.459612, 1.008559, -0.6536493, 1, 1, 1, 1, 1,
-1.43528, 0.4284898, -3.188646, 1, 1, 1, 1, 1,
-1.435093, 0.3481852, 0.007883721, 1, 1, 1, 1, 1,
-1.432774, 0.06382541, -1.841737, 1, 1, 1, 1, 1,
-1.426353, -0.5277523, -1.00154, 1, 1, 1, 1, 1,
-1.423324, -0.9470308, -2.438892, 1, 1, 1, 1, 1,
-1.419265, 1.153713, -1.299571, 1, 1, 1, 1, 1,
-1.416591, -0.4373116, -2.165506, 1, 1, 1, 1, 1,
-1.405836, -0.5823072, -1.817722, 0, 0, 1, 1, 1,
-1.404586, -0.04982514, -1.690344, 1, 0, 0, 1, 1,
-1.401355, 0.3736091, -0.6215991, 1, 0, 0, 1, 1,
-1.400102, -0.2143309, -3.116262, 1, 0, 0, 1, 1,
-1.390078, -0.9508083, -3.135075, 1, 0, 0, 1, 1,
-1.380232, -0.3204198, -2.1141, 1, 0, 0, 1, 1,
-1.374544, -0.9878185, -2.932607, 0, 0, 0, 1, 1,
-1.373957, -0.9998561, -3.227339, 0, 0, 0, 1, 1,
-1.341727, -1.283949, -1.795552, 0, 0, 0, 1, 1,
-1.328061, 0.9013684, -2.782084, 0, 0, 0, 1, 1,
-1.327399, -1.735367, -2.539405, 0, 0, 0, 1, 1,
-1.326774, 1.666693, -0.4618798, 0, 0, 0, 1, 1,
-1.326054, 1.886983, -0.9231976, 0, 0, 0, 1, 1,
-1.321665, -0.3870696, -1.662972, 1, 1, 1, 1, 1,
-1.320657, 0.7396463, -2.024092, 1, 1, 1, 1, 1,
-1.318687, -0.05169819, -0.806516, 1, 1, 1, 1, 1,
-1.318582, 0.7198713, -1.136766, 1, 1, 1, 1, 1,
-1.315066, -0.1288804, -3.438003, 1, 1, 1, 1, 1,
-1.302145, -0.2106262, -2.630051, 1, 1, 1, 1, 1,
-1.299043, 0.1464685, -0.4302661, 1, 1, 1, 1, 1,
-1.297626, 1.070188, 0.008459293, 1, 1, 1, 1, 1,
-1.297393, 0.3892064, -0.4356523, 1, 1, 1, 1, 1,
-1.291481, -0.6686273, 0.5646302, 1, 1, 1, 1, 1,
-1.287217, -1.19432, -1.726445, 1, 1, 1, 1, 1,
-1.280455, -0.2714803, -2.518743, 1, 1, 1, 1, 1,
-1.278444, -0.2621977, -0.2506169, 1, 1, 1, 1, 1,
-1.274932, -1.566609, -2.083483, 1, 1, 1, 1, 1,
-1.261987, -1.076658, -2.036493, 1, 1, 1, 1, 1,
-1.258168, 0.6452473, -0.9039463, 0, 0, 1, 1, 1,
-1.234843, -0.1462989, -1.694577, 1, 0, 0, 1, 1,
-1.230507, -1.685109, -2.31197, 1, 0, 0, 1, 1,
-1.21779, 1.384457, -0.3391694, 1, 0, 0, 1, 1,
-1.210084, -0.2856286, -2.754296, 1, 0, 0, 1, 1,
-1.207738, 0.4031675, 0.1335322, 1, 0, 0, 1, 1,
-1.205575, -0.7420493, -3.154092, 0, 0, 0, 1, 1,
-1.205189, -1.078265, -2.292544, 0, 0, 0, 1, 1,
-1.196275, 0.2167419, -2.017276, 0, 0, 0, 1, 1,
-1.194789, -1.877243, -3.781441, 0, 0, 0, 1, 1,
-1.184493, 0.5272686, -0.9882092, 0, 0, 0, 1, 1,
-1.182686, 0.3060787, -1.052135, 0, 0, 0, 1, 1,
-1.180339, -1.61419, -2.819385, 0, 0, 0, 1, 1,
-1.179311, 0.1066715, -1.610056, 1, 1, 1, 1, 1,
-1.160463, -0.1700908, -0.9252923, 1, 1, 1, 1, 1,
-1.150837, 0.7482218, -1.061954, 1, 1, 1, 1, 1,
-1.148801, 0.8738561, -0.4758244, 1, 1, 1, 1, 1,
-1.142837, -0.05831259, -2.827754, 1, 1, 1, 1, 1,
-1.131072, 0.4898122, -2.074668, 1, 1, 1, 1, 1,
-1.129196, 0.261943, -2.079483, 1, 1, 1, 1, 1,
-1.126352, -0.1121187, -1.695364, 1, 1, 1, 1, 1,
-1.124601, -0.5019054, 0.4218867, 1, 1, 1, 1, 1,
-1.120874, -1.368047, -1.693387, 1, 1, 1, 1, 1,
-1.109332, -0.4765875, -1.955158, 1, 1, 1, 1, 1,
-1.099738, 1.007768, 0.5884201, 1, 1, 1, 1, 1,
-1.083117, 0.9348505, 0.4253164, 1, 1, 1, 1, 1,
-1.082532, -0.2723688, -1.954595, 1, 1, 1, 1, 1,
-1.080647, 0.07785675, -3.920355, 1, 1, 1, 1, 1,
-1.079345, -0.8917896, -2.529876, 0, 0, 1, 1, 1,
-1.072292, 0.8427995, -0.9583664, 1, 0, 0, 1, 1,
-1.071777, 0.3178588, -1.21779, 1, 0, 0, 1, 1,
-1.071187, -0.6302235, -2.712528, 1, 0, 0, 1, 1,
-1.066143, 0.6152241, -0.8151188, 1, 0, 0, 1, 1,
-1.062241, -2.058327, -2.873399, 1, 0, 0, 1, 1,
-1.059631, 0.5144597, -1.956276, 0, 0, 0, 1, 1,
-1.058902, -0.09532603, -0.7879828, 0, 0, 0, 1, 1,
-1.054713, 1.650658, -1.740714, 0, 0, 0, 1, 1,
-1.050487, -0.8105218, -2.852608, 0, 0, 0, 1, 1,
-1.047832, 0.1803488, -1.753226, 0, 0, 0, 1, 1,
-1.044845, 0.7343156, -1.947772, 0, 0, 0, 1, 1,
-1.04438, 1.090037, -1.475029, 0, 0, 0, 1, 1,
-1.042388, -1.327475, -2.149101, 1, 1, 1, 1, 1,
-1.037809, -1.295661, -4.102441, 1, 1, 1, 1, 1,
-1.033986, 1.186129, -0.5636188, 1, 1, 1, 1, 1,
-1.026353, -0.8959579, -1.274069, 1, 1, 1, 1, 1,
-1.013948, -0.3676388, -2.032525, 1, 1, 1, 1, 1,
-1.013227, -0.1779536, -3.13344, 1, 1, 1, 1, 1,
-1.013052, 0.7527826, 0.8955979, 1, 1, 1, 1, 1,
-1.012201, -0.1136789, -1.49855, 1, 1, 1, 1, 1,
-1.008994, -1.633485, -2.850378, 1, 1, 1, 1, 1,
-1.004705, 0.7021575, -1.067682, 1, 1, 1, 1, 1,
-0.9980842, -0.3543829, -1.891608, 1, 1, 1, 1, 1,
-0.9921632, -1.484571, -4.010919, 1, 1, 1, 1, 1,
-0.9913539, 1.286715, 0.08500297, 1, 1, 1, 1, 1,
-0.9890244, 0.09995184, -0.9928852, 1, 1, 1, 1, 1,
-0.9857204, 0.1896647, -1.212479, 1, 1, 1, 1, 1,
-0.9789501, -0.1371056, -1.21585, 0, 0, 1, 1, 1,
-0.9739841, 0.0550432, 0.4115565, 1, 0, 0, 1, 1,
-0.9735682, 1.092036, -1.29419, 1, 0, 0, 1, 1,
-0.9710571, 0.2455089, -0.02997917, 1, 0, 0, 1, 1,
-0.9674684, -0.263686, -0.1981431, 1, 0, 0, 1, 1,
-0.9668351, -1.854837, -3.337554, 1, 0, 0, 1, 1,
-0.9611585, -1.339161, -1.173744, 0, 0, 0, 1, 1,
-0.959589, 0.4258207, -0.3121195, 0, 0, 0, 1, 1,
-0.9572707, 1.023658, -1.244639, 0, 0, 0, 1, 1,
-0.946126, -0.3694987, -2.17711, 0, 0, 0, 1, 1,
-0.945416, -1.055786, -3.160499, 0, 0, 0, 1, 1,
-0.9356984, -0.1861891, -1.584908, 0, 0, 0, 1, 1,
-0.9355348, 0.06975415, -0.7316729, 0, 0, 0, 1, 1,
-0.9283931, 0.1178189, -1.056104, 1, 1, 1, 1, 1,
-0.9274718, -1.189588, -4.142977, 1, 1, 1, 1, 1,
-0.9271652, -1.821453, -3.072807, 1, 1, 1, 1, 1,
-0.9239334, -0.07440832, -1.997583, 1, 1, 1, 1, 1,
-0.9216281, -0.4354755, -1.924736, 1, 1, 1, 1, 1,
-0.9209641, -1.031528, -1.480618, 1, 1, 1, 1, 1,
-0.9151809, -1.073287, -1.76125, 1, 1, 1, 1, 1,
-0.9101058, 1.177399, -0.5897627, 1, 1, 1, 1, 1,
-0.9095452, 0.7908553, -1.845319, 1, 1, 1, 1, 1,
-0.9070404, -0.0518021, -1.716972, 1, 1, 1, 1, 1,
-0.9061923, 0.7368342, 1.153276, 1, 1, 1, 1, 1,
-0.9022294, 0.8998086, -1.93867, 1, 1, 1, 1, 1,
-0.9002647, -1.861855, -2.542296, 1, 1, 1, 1, 1,
-0.8994722, 0.03789033, -2.673122, 1, 1, 1, 1, 1,
-0.8993218, -0.613587, -0.4781425, 1, 1, 1, 1, 1,
-0.8890643, -1.176848, -3.008358, 0, 0, 1, 1, 1,
-0.8824061, 1.46338, 1.947003, 1, 0, 0, 1, 1,
-0.8812868, -0.1130613, -1.416937, 1, 0, 0, 1, 1,
-0.8808101, 0.6788091, -0.7817045, 1, 0, 0, 1, 1,
-0.8764634, 0.5010417, -1.236584, 1, 0, 0, 1, 1,
-0.876283, 0.8092134, 0.4569156, 1, 0, 0, 1, 1,
-0.875261, -0.1974383, -0.6199128, 0, 0, 0, 1, 1,
-0.8733126, -0.1084215, -3.423158, 0, 0, 0, 1, 1,
-0.8641397, 1.029385, -0.3865177, 0, 0, 0, 1, 1,
-0.8619018, 0.3881467, 0.5978808, 0, 0, 0, 1, 1,
-0.8595002, 2.658345, 0.7860465, 0, 0, 0, 1, 1,
-0.8564582, -1.475319, -1.677534, 0, 0, 0, 1, 1,
-0.8544037, -0.9290138, -4.848509, 0, 0, 0, 1, 1,
-0.8533285, 0.1099844, -0.05043467, 1, 1, 1, 1, 1,
-0.8529343, 2.154321, -1.406977, 1, 1, 1, 1, 1,
-0.8512174, -0.1770618, -2.926982, 1, 1, 1, 1, 1,
-0.8437008, 0.2539804, -1.430768, 1, 1, 1, 1, 1,
-0.8383388, -1.08268, -2.009652, 1, 1, 1, 1, 1,
-0.8354025, 1.261393, -0.753583, 1, 1, 1, 1, 1,
-0.8350213, 0.5735222, -0.2451812, 1, 1, 1, 1, 1,
-0.8349403, 1.244839, -1.211468, 1, 1, 1, 1, 1,
-0.8323138, 0.2978728, -0.4277386, 1, 1, 1, 1, 1,
-0.8292506, -0.1048527, -0.5412591, 1, 1, 1, 1, 1,
-0.8279102, 0.3515585, -3.179169, 1, 1, 1, 1, 1,
-0.8269702, 1.066403, -0.7875421, 1, 1, 1, 1, 1,
-0.823993, -2.123468, -3.499445, 1, 1, 1, 1, 1,
-0.8234156, 0.5604906, -2.01846, 1, 1, 1, 1, 1,
-0.8131577, 0.6627454, -1.451858, 1, 1, 1, 1, 1,
-0.811487, 1.497522, -1.603498, 0, 0, 1, 1, 1,
-0.8106745, 0.5802828, -1.396734, 1, 0, 0, 1, 1,
-0.8066078, -0.7872694, -3.057338, 1, 0, 0, 1, 1,
-0.8010537, -2.277277, -2.096106, 1, 0, 0, 1, 1,
-0.7960919, -1.47107, -3.439032, 1, 0, 0, 1, 1,
-0.7957538, -0.4208532, -1.72493, 1, 0, 0, 1, 1,
-0.7914674, 1.472914, -0.7487121, 0, 0, 0, 1, 1,
-0.7861364, -0.8765569, -2.799329, 0, 0, 0, 1, 1,
-0.7860652, -1.329312, -0.8155244, 0, 0, 0, 1, 1,
-0.7788641, 0.9165829, -2.441131, 0, 0, 0, 1, 1,
-0.7773173, 1.178876, 0.352668, 0, 0, 0, 1, 1,
-0.77712, 0.5563887, 0.5666257, 0, 0, 0, 1, 1,
-0.7769867, -0.7622994, -4.352708, 0, 0, 0, 1, 1,
-0.774383, -0.873268, -2.465248, 1, 1, 1, 1, 1,
-0.7722653, 0.4364581, -2.158506, 1, 1, 1, 1, 1,
-0.7702077, -0.1508326, -2.158931, 1, 1, 1, 1, 1,
-0.7692937, 0.1839729, 0.0623422, 1, 1, 1, 1, 1,
-0.7684108, 0.3840954, -0.9615651, 1, 1, 1, 1, 1,
-0.7659323, -1.008057, -3.915343, 1, 1, 1, 1, 1,
-0.7633277, -0.0627346, -4.11349, 1, 1, 1, 1, 1,
-0.7596776, -0.01048705, -0.8936338, 1, 1, 1, 1, 1,
-0.7585196, 0.7587095, 0.9754789, 1, 1, 1, 1, 1,
-0.7518526, 1.151852, -0.5019866, 1, 1, 1, 1, 1,
-0.7508574, -2.286132, -4.158119, 1, 1, 1, 1, 1,
-0.7463175, 0.9139933, -2.546693, 1, 1, 1, 1, 1,
-0.7369018, 0.7016447, -0.754473, 1, 1, 1, 1, 1,
-0.7288013, -0.8618314, -1.268466, 1, 1, 1, 1, 1,
-0.7275366, -0.8285334, -1.872063, 1, 1, 1, 1, 1,
-0.7266435, -1.900904, -3.972071, 0, 0, 1, 1, 1,
-0.7187193, 0.931792, -0.3290707, 1, 0, 0, 1, 1,
-0.7156056, -0.7259733, -0.3611681, 1, 0, 0, 1, 1,
-0.7153991, -1.281073, -1.367005, 1, 0, 0, 1, 1,
-0.7149429, -0.7784793, -2.244717, 1, 0, 0, 1, 1,
-0.7123866, -0.509036, -1.634068, 1, 0, 0, 1, 1,
-0.7116587, -0.4775928, -2.275781, 0, 0, 0, 1, 1,
-0.7109886, -1.221324, -2.700805, 0, 0, 0, 1, 1,
-0.7000958, -1.231097, -2.36381, 0, 0, 0, 1, 1,
-0.6996697, 2.250854, 0.6414712, 0, 0, 0, 1, 1,
-0.6987741, -0.649946, -2.647157, 0, 0, 0, 1, 1,
-0.6943595, -1.449211, -0.3088531, 0, 0, 0, 1, 1,
-0.6879051, 0.7514054, -0.9690716, 0, 0, 0, 1, 1,
-0.687598, -2.583455, -2.537258, 1, 1, 1, 1, 1,
-0.6867095, -1.284171, -3.451465, 1, 1, 1, 1, 1,
-0.6813847, -0.4198796, -1.769748, 1, 1, 1, 1, 1,
-0.6806484, -0.7504487, -1.009984, 1, 1, 1, 1, 1,
-0.6802275, 0.0226471, 0.9768931, 1, 1, 1, 1, 1,
-0.6768058, -0.5259385, -1.121112, 1, 1, 1, 1, 1,
-0.6756205, 1.08692, 0.1432153, 1, 1, 1, 1, 1,
-0.6753899, 1.709903, 0.4607113, 1, 1, 1, 1, 1,
-0.6629779, -0.4588234, -1.387837, 1, 1, 1, 1, 1,
-0.6617368, -0.9038684, -1.664872, 1, 1, 1, 1, 1,
-0.6583714, 0.5852146, 0.0683402, 1, 1, 1, 1, 1,
-0.6576122, 0.4172507, -2.361178, 1, 1, 1, 1, 1,
-0.6433377, -0.7582931, -0.4760711, 1, 1, 1, 1, 1,
-0.6405138, -1.636976, -2.134307, 1, 1, 1, 1, 1,
-0.6393434, -1.609546, -2.854883, 1, 1, 1, 1, 1,
-0.6336288, 0.3600276, -0.7941104, 0, 0, 1, 1, 1,
-0.6295492, -0.9124407, -2.758985, 1, 0, 0, 1, 1,
-0.6277495, -0.0507386, -2.592315, 1, 0, 0, 1, 1,
-0.6237574, -0.7455938, -1.842649, 1, 0, 0, 1, 1,
-0.6170915, -2.008188, -0.91318, 1, 0, 0, 1, 1,
-0.6137899, 1.427659, 1.39059, 1, 0, 0, 1, 1,
-0.613519, 1.195109, -2.096322, 0, 0, 0, 1, 1,
-0.6101345, -1.110063, -2.621116, 0, 0, 0, 1, 1,
-0.6067425, -0.03953826, -1.642629, 0, 0, 0, 1, 1,
-0.6026077, -0.5849635, -2.406317, 0, 0, 0, 1, 1,
-0.5905121, 0.6582383, -1.66289, 0, 0, 0, 1, 1,
-0.5875013, -0.4804866, -2.574019, 0, 0, 0, 1, 1,
-0.5829118, 1.6053, -1.132277, 0, 0, 0, 1, 1,
-0.5803484, -0.3401429, -4.573986, 1, 1, 1, 1, 1,
-0.5783641, 1.228229, -0.04589339, 1, 1, 1, 1, 1,
-0.5781423, 1.41465, -1.308636, 1, 1, 1, 1, 1,
-0.5771879, 0.87751, -0.06657432, 1, 1, 1, 1, 1,
-0.5769988, -0.2017971, -3.126346, 1, 1, 1, 1, 1,
-0.5759044, 0.1368678, -2.992953, 1, 1, 1, 1, 1,
-0.5696727, -1.818884, -3.606995, 1, 1, 1, 1, 1,
-0.5692155, -0.2664421, -3.046932, 1, 1, 1, 1, 1,
-0.5629416, 1.083524, -2.553806, 1, 1, 1, 1, 1,
-0.5626901, -0.9772803, -1.402637, 1, 1, 1, 1, 1,
-0.5588865, 0.6433382, -0.9299946, 1, 1, 1, 1, 1,
-0.5582966, 1.530686, 0.5061532, 1, 1, 1, 1, 1,
-0.557359, 0.04531433, -1.366318, 1, 1, 1, 1, 1,
-0.5548664, 0.9556485, -1.107909, 1, 1, 1, 1, 1,
-0.5525195, 0.9915503, -0.9297642, 1, 1, 1, 1, 1,
-0.5491154, 0.9196368, -0.2051138, 0, 0, 1, 1, 1,
-0.5477855, 0.2580676, -1.864713, 1, 0, 0, 1, 1,
-0.5303718, 1.01395, -0.2017802, 1, 0, 0, 1, 1,
-0.5209305, 1.082725, -0.6294419, 1, 0, 0, 1, 1,
-0.5182385, 0.4142413, 0.7076288, 1, 0, 0, 1, 1,
-0.5047088, 0.5317368, -0.8625774, 1, 0, 0, 1, 1,
-0.5024586, -1.200764, -2.779189, 0, 0, 0, 1, 1,
-0.4979256, -0.9027457, -2.17431, 0, 0, 0, 1, 1,
-0.4952627, 0.4885789, -0.1979966, 0, 0, 0, 1, 1,
-0.4923389, 0.5343611, -2.136023, 0, 0, 0, 1, 1,
-0.4902127, 0.1249833, -1.051237, 0, 0, 0, 1, 1,
-0.4875131, -0.4786185, -2.5898, 0, 0, 0, 1, 1,
-0.4834398, -0.3137782, -2.924402, 0, 0, 0, 1, 1,
-0.4811154, 1.284318, -0.03922079, 1, 1, 1, 1, 1,
-0.4753393, -0.6295857, -2.627522, 1, 1, 1, 1, 1,
-0.473307, 0.9850597, -1.186785, 1, 1, 1, 1, 1,
-0.4669135, -0.05330044, -0.0381239, 1, 1, 1, 1, 1,
-0.4654107, -1.456875, -2.012866, 1, 1, 1, 1, 1,
-0.4626124, 1.188445, 0.3864389, 1, 1, 1, 1, 1,
-0.4593875, -2.286793, -3.678171, 1, 1, 1, 1, 1,
-0.4527161, 0.1763286, -0.4445458, 1, 1, 1, 1, 1,
-0.4521618, -1.943872, -2.771238, 1, 1, 1, 1, 1,
-0.4516354, 0.4288197, 0.4766813, 1, 1, 1, 1, 1,
-0.4499668, 1.157284, -1.499928, 1, 1, 1, 1, 1,
-0.4483368, -1.78869, -3.533615, 1, 1, 1, 1, 1,
-0.4452882, -0.1288814, -2.101984, 1, 1, 1, 1, 1,
-0.4412976, 0.03566996, -1.177153, 1, 1, 1, 1, 1,
-0.4402873, 0.9032848, -1.495981, 1, 1, 1, 1, 1,
-0.4394477, 0.1305773, 0.2852445, 0, 0, 1, 1, 1,
-0.4357746, 0.2546096, -0.4915672, 1, 0, 0, 1, 1,
-0.4317921, -0.1657877, -1.517204, 1, 0, 0, 1, 1,
-0.4308941, 1.181231, -0.0767404, 1, 0, 0, 1, 1,
-0.4298452, -0.1726259, -1.229368, 1, 0, 0, 1, 1,
-0.4287995, -0.4316799, -2.080265, 1, 0, 0, 1, 1,
-0.4216403, -0.9486212, -2.33293, 0, 0, 0, 1, 1,
-0.4214088, -0.8361393, -1.27005, 0, 0, 0, 1, 1,
-0.4182026, -0.4806919, -2.968503, 0, 0, 0, 1, 1,
-0.4173903, 0.03287926, -2.170802, 0, 0, 0, 1, 1,
-0.4163684, 0.9801349, -0.4418738, 0, 0, 0, 1, 1,
-0.4125995, -1.383324, -3.872805, 0, 0, 0, 1, 1,
-0.4117453, -0.8264043, -0.4005398, 0, 0, 0, 1, 1,
-0.4014772, -0.7956015, -3.291238, 1, 1, 1, 1, 1,
-0.3970598, -0.7866842, -2.528441, 1, 1, 1, 1, 1,
-0.3970116, -0.7983148, -2.094819, 1, 1, 1, 1, 1,
-0.3964528, 0.8036448, 0.4087987, 1, 1, 1, 1, 1,
-0.3947627, 1.425673, 1.198228, 1, 1, 1, 1, 1,
-0.3945007, 0.7575441, -0.475657, 1, 1, 1, 1, 1,
-0.3920236, 0.6470165, 1.439481, 1, 1, 1, 1, 1,
-0.3915114, -1.087212, -1.259839, 1, 1, 1, 1, 1,
-0.3851081, 1.236803, -0.3779727, 1, 1, 1, 1, 1,
-0.3814846, -0.1801798, -0.02109711, 1, 1, 1, 1, 1,
-0.3805045, 0.6073672, -0.5511889, 1, 1, 1, 1, 1,
-0.3797815, 0.7183306, -1.01285, 1, 1, 1, 1, 1,
-0.3741274, 1.418475, -0.9311361, 1, 1, 1, 1, 1,
-0.3658507, -0.5258045, -2.283363, 1, 1, 1, 1, 1,
-0.3658016, -1.428094, -1.939819, 1, 1, 1, 1, 1,
-0.3616237, -0.9634628, -3.045889, 0, 0, 1, 1, 1,
-0.3613916, 1.347891, 0.4175889, 1, 0, 0, 1, 1,
-0.3611982, -0.9537546, -2.262686, 1, 0, 0, 1, 1,
-0.3542475, -0.7646437, -3.1587, 1, 0, 0, 1, 1,
-0.3510379, 0.004976611, -1.6368, 1, 0, 0, 1, 1,
-0.3451352, -1.779546, -2.629504, 1, 0, 0, 1, 1,
-0.3388609, 0.01717522, -0.6325264, 0, 0, 0, 1, 1,
-0.3374249, -1.333092, -2.073066, 0, 0, 0, 1, 1,
-0.3223714, 0.648955, -1.337611, 0, 0, 0, 1, 1,
-0.3197809, -0.748058, -2.821367, 0, 0, 0, 1, 1,
-0.3183874, -0.1800992, -1.334581, 0, 0, 0, 1, 1,
-0.3036299, 0.1208913, -1.36312, 0, 0, 0, 1, 1,
-0.3013591, 1.090928, 1.173204, 0, 0, 0, 1, 1,
-0.2950001, -0.2431924, -3.605532, 1, 1, 1, 1, 1,
-0.287409, 1.758249, -0.714794, 1, 1, 1, 1, 1,
-0.2866392, 0.9723654, -0.4555053, 1, 1, 1, 1, 1,
-0.2864157, 0.5359682, -1.149392, 1, 1, 1, 1, 1,
-0.2849864, -1.618799, -4.516496, 1, 1, 1, 1, 1,
-0.2816023, -1.643336, -2.190182, 1, 1, 1, 1, 1,
-0.2790947, -1.133289, -3.347245, 1, 1, 1, 1, 1,
-0.2701716, -1.004027, -0.9959321, 1, 1, 1, 1, 1,
-0.2691407, -1.957996, -2.904542, 1, 1, 1, 1, 1,
-0.2686569, -0.2729881, -2.393864, 1, 1, 1, 1, 1,
-0.2664374, 2.155139, -0.6543013, 1, 1, 1, 1, 1,
-0.2648727, -1.188272, -1.433707, 1, 1, 1, 1, 1,
-0.2621193, -1.323951, -3.94172, 1, 1, 1, 1, 1,
-0.2556293, 2.637746, -0.1845916, 1, 1, 1, 1, 1,
-0.2533625, 1.470935, -1.747171, 1, 1, 1, 1, 1,
-0.2502947, -0.6304096, -4.706958, 0, 0, 1, 1, 1,
-0.2499222, 0.533268, 1.75071, 1, 0, 0, 1, 1,
-0.2484258, -0.9481489, -4.053591, 1, 0, 0, 1, 1,
-0.243001, 1.193848, 0.8778368, 1, 0, 0, 1, 1,
-0.2424899, -0.3143377, -2.854206, 1, 0, 0, 1, 1,
-0.2407602, 0.6503264, -0.3146508, 1, 0, 0, 1, 1,
-0.2404469, 0.8819039, 0.4203491, 0, 0, 0, 1, 1,
-0.2376974, -0.2182312, -1.465708, 0, 0, 0, 1, 1,
-0.2323083, -0.02079812, -3.575875, 0, 0, 0, 1, 1,
-0.2314081, 0.5092418, 0.0717365, 0, 0, 0, 1, 1,
-0.2289877, -1.683171, -2.324879, 0, 0, 0, 1, 1,
-0.2242648, -0.07293782, -1.359914, 0, 0, 0, 1, 1,
-0.2234647, 0.463846, -0.4912275, 0, 0, 0, 1, 1,
-0.2225664, 0.7172238, 1.464633, 1, 1, 1, 1, 1,
-0.2216998, -1.106728, -4.498283, 1, 1, 1, 1, 1,
-0.2208645, -0.04223553, -1.381024, 1, 1, 1, 1, 1,
-0.2185563, -1.475536, -0.9419637, 1, 1, 1, 1, 1,
-0.218483, 2.063855, 0.554328, 1, 1, 1, 1, 1,
-0.2170973, -0.8438988, -4.064386, 1, 1, 1, 1, 1,
-0.20844, 0.4264296, -0.5108297, 1, 1, 1, 1, 1,
-0.2070208, 0.1962577, 0.1512795, 1, 1, 1, 1, 1,
-0.2068256, 0.2375195, -2.847273, 1, 1, 1, 1, 1,
-0.2014351, 1.630262, -0.06155333, 1, 1, 1, 1, 1,
-0.2007744, 0.7884483, -0.7717099, 1, 1, 1, 1, 1,
-0.1805492, -0.09566933, -2.388581, 1, 1, 1, 1, 1,
-0.1798674, -0.1271104, -2.175496, 1, 1, 1, 1, 1,
-0.1774441, -1.578108, -3.973529, 1, 1, 1, 1, 1,
-0.1736812, -3.680447, -4.629334, 1, 1, 1, 1, 1,
-0.1723595, -0.2981193, -2.245812, 0, 0, 1, 1, 1,
-0.1661571, 0.201437, -1.92066, 1, 0, 0, 1, 1,
-0.1652231, 0.7246076, 0.1631283, 1, 0, 0, 1, 1,
-0.1624097, 1.566775, -0.448524, 1, 0, 0, 1, 1,
-0.1577768, 0.8337095, -0.9905869, 1, 0, 0, 1, 1,
-0.1550901, 0.5846217, 1.979644, 1, 0, 0, 1, 1,
-0.152101, 1.431809, -1.569738, 0, 0, 0, 1, 1,
-0.1501815, 1.197143, 0.1390492, 0, 0, 0, 1, 1,
-0.1482698, -0.7742324, -5.048462, 0, 0, 0, 1, 1,
-0.1459525, -0.2474802, -1.912859, 0, 0, 0, 1, 1,
-0.1454933, -0.02723427, -2.086703, 0, 0, 0, 1, 1,
-0.1381594, -0.449744, -2.846741, 0, 0, 0, 1, 1,
-0.1381093, 0.9165257, -2.452826, 0, 0, 0, 1, 1,
-0.1373157, -0.2394021, -0.8319057, 1, 1, 1, 1, 1,
-0.1364112, 0.7956114, -0.1389424, 1, 1, 1, 1, 1,
-0.1353342, 0.09758036, -0.3158954, 1, 1, 1, 1, 1,
-0.1340533, -1.507478, -2.566801, 1, 1, 1, 1, 1,
-0.1333691, 1.505932, -0.2857361, 1, 1, 1, 1, 1,
-0.1330767, -1.154011, -3.269178, 1, 1, 1, 1, 1,
-0.1318645, 1.09834, 1.34075, 1, 1, 1, 1, 1,
-0.1303901, -0.04784595, -1.255358, 1, 1, 1, 1, 1,
-0.1268772, -0.2137283, -2.881022, 1, 1, 1, 1, 1,
-0.1234047, -0.5474935, -1.821212, 1, 1, 1, 1, 1,
-0.1223019, -1.717853, -2.881037, 1, 1, 1, 1, 1,
-0.1216221, -0.411846, -2.509576, 1, 1, 1, 1, 1,
-0.1211659, 0.739608, 0.09438583, 1, 1, 1, 1, 1,
-0.1194139, 0.3060932, -1.124596, 1, 1, 1, 1, 1,
-0.1178802, -1.045985, -3.345136, 1, 1, 1, 1, 1,
-0.1151574, -0.2157506, -3.545319, 0, 0, 1, 1, 1,
-0.1140252, 1.271393, 0.3965812, 1, 0, 0, 1, 1,
-0.1113282, -0.05948898, -0.4714783, 1, 0, 0, 1, 1,
-0.1111634, -2.246213, -3.072578, 1, 0, 0, 1, 1,
-0.1110344, -1.35801, -3.997661, 1, 0, 0, 1, 1,
-0.09689641, 0.01713724, -1.299322, 1, 0, 0, 1, 1,
-0.09603924, -0.1825423, -3.0296, 0, 0, 0, 1, 1,
-0.09603238, 0.6830831, 1.484739, 0, 0, 0, 1, 1,
-0.09278201, -0.003529803, -3.323304, 0, 0, 0, 1, 1,
-0.08865468, 1.508079, -0.1158037, 0, 0, 0, 1, 1,
-0.08386025, 0.3154446, -0.8005093, 0, 0, 0, 1, 1,
-0.08385795, 1.414886, 1.313029, 0, 0, 0, 1, 1,
-0.08027621, 0.698589, 0.265475, 0, 0, 0, 1, 1,
-0.07952622, -0.2271249, -1.75847, 1, 1, 1, 1, 1,
-0.07463606, 0.7820579, -0.5796073, 1, 1, 1, 1, 1,
-0.07329036, 1.057252, 1.284723, 1, 1, 1, 1, 1,
-0.07314409, 0.3169399, 1.067699, 1, 1, 1, 1, 1,
-0.07085575, 0.4146013, -0.4434769, 1, 1, 1, 1, 1,
-0.06866562, -0.5696027, -2.986378, 1, 1, 1, 1, 1,
-0.06588329, 0.3557051, 2.851019, 1, 1, 1, 1, 1,
-0.06437182, 0.9240894, -0.6071773, 1, 1, 1, 1, 1,
-0.06349446, -0.2099927, -1.818913, 1, 1, 1, 1, 1,
-0.0604801, 0.5296678, 0.1990337, 1, 1, 1, 1, 1,
-0.05860795, 2.147348, 0.6019123, 1, 1, 1, 1, 1,
-0.05664005, 0.614202, 0.3293715, 1, 1, 1, 1, 1,
-0.05076413, 0.1714276, -2.083406, 1, 1, 1, 1, 1,
-0.04538861, -0.3354583, -3.220732, 1, 1, 1, 1, 1,
-0.04433053, 0.7079656, -0.533161, 1, 1, 1, 1, 1,
-0.0439807, 0.1266018, -0.09899992, 0, 0, 1, 1, 1,
-0.04268054, 1.671059, 0.1292364, 1, 0, 0, 1, 1,
-0.03786269, -0.3261125, -3.000129, 1, 0, 0, 1, 1,
-0.03308005, -0.7884037, -4.114101, 1, 0, 0, 1, 1,
-0.03067945, -0.2445736, -2.73487, 1, 0, 0, 1, 1,
-0.03041849, 0.9274578, 1.579082, 1, 0, 0, 1, 1,
-0.02878882, -0.5196327, -3.873579, 0, 0, 0, 1, 1,
-0.0277342, 1.132456, -0.9324167, 0, 0, 0, 1, 1,
-0.02553325, 0.1276749, 0.121716, 0, 0, 0, 1, 1,
-0.0252878, 0.8943934, -0.9326826, 0, 0, 0, 1, 1,
-0.02367825, -1.418258, -2.169898, 0, 0, 0, 1, 1,
-0.02242408, -0.1450537, -3.924923, 0, 0, 0, 1, 1,
-0.02069373, -1.240606, -2.220287, 0, 0, 0, 1, 1,
-0.01811088, -1.079904, -3.372234, 1, 1, 1, 1, 1,
-0.01636458, 0.2807081, 0.697577, 1, 1, 1, 1, 1,
-0.01511211, -0.311494, -5.681327, 1, 1, 1, 1, 1,
-0.01289815, -2.843915, -3.191672, 1, 1, 1, 1, 1,
-0.01107936, -0.4008458, -3.858014, 1, 1, 1, 1, 1,
-0.007586144, -0.4759063, -1.225121, 1, 1, 1, 1, 1,
-0.005017892, -0.62488, -2.909257, 1, 1, 1, 1, 1,
0.000866337, -0.527049, 1.699986, 1, 1, 1, 1, 1,
0.001704257, 0.3280209, -0.09718949, 1, 1, 1, 1, 1,
0.001804479, -0.7673039, 3.091109, 1, 1, 1, 1, 1,
0.007795868, 0.5619555, -1.809359, 1, 1, 1, 1, 1,
0.01092936, -1.258254, 4.252708, 1, 1, 1, 1, 1,
0.01304704, 0.05903785, -1.064152, 1, 1, 1, 1, 1,
0.02485695, -1.366806, 2.19014, 1, 1, 1, 1, 1,
0.03002563, 1.029632, -0.7616092, 1, 1, 1, 1, 1,
0.03481101, -0.7217752, 3.71642, 0, 0, 1, 1, 1,
0.03813661, 0.8145986, -0.8948499, 1, 0, 0, 1, 1,
0.03899, 1.388292, 0.6855564, 1, 0, 0, 1, 1,
0.04047113, 0.01392294, 1.417477, 1, 0, 0, 1, 1,
0.04249822, -0.9575142, 2.504162, 1, 0, 0, 1, 1,
0.04266588, -1.050549, 4.383247, 1, 0, 0, 1, 1,
0.04315567, -0.2721133, 3.134777, 0, 0, 0, 1, 1,
0.04535181, 1.205469, 0.6056898, 0, 0, 0, 1, 1,
0.05145251, -0.07637592, 2.140368, 0, 0, 0, 1, 1,
0.05425071, -0.7090947, 4.630321, 0, 0, 0, 1, 1,
0.05481445, 0.5104682, -0.9894856, 0, 0, 0, 1, 1,
0.0577324, 0.6531662, -0.3017058, 0, 0, 0, 1, 1,
0.05776088, 1.048881, -1.581276, 0, 0, 0, 1, 1,
0.05780278, -1.197512, 2.078283, 1, 1, 1, 1, 1,
0.05797015, 1.405022, 0.1950291, 1, 1, 1, 1, 1,
0.0583684, 1.852321, -0.5974588, 1, 1, 1, 1, 1,
0.06000821, -1.855234, 2.814718, 1, 1, 1, 1, 1,
0.06250598, 0.4714717, 0.1968706, 1, 1, 1, 1, 1,
0.06259418, 0.2762953, -1.392129, 1, 1, 1, 1, 1,
0.0655167, -1.179788, 1.951881, 1, 1, 1, 1, 1,
0.06874374, 1.565522, 1.964041, 1, 1, 1, 1, 1,
0.07005716, 0.4940389, -0.9162961, 1, 1, 1, 1, 1,
0.07113845, -1.9703, 4.085639, 1, 1, 1, 1, 1,
0.0736254, 1.757441, -1.340654, 1, 1, 1, 1, 1,
0.07384167, 0.01911951, 2.017694, 1, 1, 1, 1, 1,
0.07478721, 1.533173, -1.193034, 1, 1, 1, 1, 1,
0.07523211, 0.5299299, -1.206062, 1, 1, 1, 1, 1,
0.07771513, -0.01613391, 0.8864771, 1, 1, 1, 1, 1,
0.07781681, -0.1851497, 2.889839, 0, 0, 1, 1, 1,
0.07858282, -1.86111, 1.703982, 1, 0, 0, 1, 1,
0.08095752, 0.6662534, 0.4959757, 1, 0, 0, 1, 1,
0.09326916, -0.5144144, 2.318573, 1, 0, 0, 1, 1,
0.0956124, -0.107305, 2.44417, 1, 0, 0, 1, 1,
0.09724228, 0.7160718, -0.3982014, 1, 0, 0, 1, 1,
0.09895793, -0.5475688, 2.843162, 0, 0, 0, 1, 1,
0.0995298, 0.06084302, 1.304971, 0, 0, 0, 1, 1,
0.1002266, -0.8170059, 2.93827, 0, 0, 0, 1, 1,
0.1037879, 0.1678783, -0.9826502, 0, 0, 0, 1, 1,
0.1044479, 0.6837512, 0.6550012, 0, 0, 0, 1, 1,
0.1056572, -1.696773, 3.251817, 0, 0, 0, 1, 1,
0.1068095, 0.7251172, 0.2467993, 0, 0, 0, 1, 1,
0.10947, 0.3463619, 0.5052328, 1, 1, 1, 1, 1,
0.1107487, -0.5575635, 2.11723, 1, 1, 1, 1, 1,
0.1122761, -0.8349625, 3.20509, 1, 1, 1, 1, 1,
0.1127148, 0.05231552, 1.128287, 1, 1, 1, 1, 1,
0.116931, 0.9751554, -1.438207, 1, 1, 1, 1, 1,
0.1180032, 0.9040601, -0.6244254, 1, 1, 1, 1, 1,
0.1217347, -0.2543384, 1.443594, 1, 1, 1, 1, 1,
0.1256169, 0.3688291, -0.7417923, 1, 1, 1, 1, 1,
0.1328486, -0.6361533, 3.180244, 1, 1, 1, 1, 1,
0.1332335, 0.06981412, -0.7724062, 1, 1, 1, 1, 1,
0.1334013, -0.06823608, 0.6333734, 1, 1, 1, 1, 1,
0.1466244, 0.5671108, 0.7815328, 1, 1, 1, 1, 1,
0.1466786, -1.163059, 1.936922, 1, 1, 1, 1, 1,
0.1499229, 1.390703, -0.8334568, 1, 1, 1, 1, 1,
0.1506687, -0.1447338, 2.472403, 1, 1, 1, 1, 1,
0.1531219, 1.203588, 1.757163, 0, 0, 1, 1, 1,
0.1563541, 1.041459, 0.08653805, 1, 0, 0, 1, 1,
0.158022, 0.026011, 0.1071295, 1, 0, 0, 1, 1,
0.1583749, 0.3315578, -1.295367, 1, 0, 0, 1, 1,
0.1597549, -0.4123999, 3.586546, 1, 0, 0, 1, 1,
0.1609707, 0.5076687, -0.7551497, 1, 0, 0, 1, 1,
0.1621954, -0.06911025, 2.699511, 0, 0, 0, 1, 1,
0.1641681, 0.4723383, 0.9573262, 0, 0, 0, 1, 1,
0.1698596, 0.08199365, 1.323861, 0, 0, 0, 1, 1,
0.170806, 0.2215166, 0.6718078, 0, 0, 0, 1, 1,
0.1728812, 0.3966882, -0.8243418, 0, 0, 0, 1, 1,
0.1743721, -0.6587741, 1.79116, 0, 0, 0, 1, 1,
0.176703, -1.450159, 1.809634, 0, 0, 0, 1, 1,
0.178239, -1.099637, 3.608081, 1, 1, 1, 1, 1,
0.1802812, 0.6913062, 0.3573449, 1, 1, 1, 1, 1,
0.1841893, 1.386297, 1.401442, 1, 1, 1, 1, 1,
0.1851556, 1.413292, 0.8009916, 1, 1, 1, 1, 1,
0.1857863, 2.137325, 0.8767341, 1, 1, 1, 1, 1,
0.1909829, 0.09990522, 0.7179568, 1, 1, 1, 1, 1,
0.1912272, -0.2068549, 2.483757, 1, 1, 1, 1, 1,
0.1946512, -0.5155, 1.820411, 1, 1, 1, 1, 1,
0.1954823, -0.6473343, 2.682771, 1, 1, 1, 1, 1,
0.2032846, 0.3047489, 0.9976754, 1, 1, 1, 1, 1,
0.2039846, -0.1171115, 1.684829, 1, 1, 1, 1, 1,
0.2055013, -0.2908716, 3.007684, 1, 1, 1, 1, 1,
0.2122655, 0.2761526, 1.164826, 1, 1, 1, 1, 1,
0.2124699, 1.140368, 0.8045273, 1, 1, 1, 1, 1,
0.2201976, -1.535286, 3.235499, 1, 1, 1, 1, 1,
0.2211922, 0.2021549, 3.263864, 0, 0, 1, 1, 1,
0.227024, 0.3577175, 0.911113, 1, 0, 0, 1, 1,
0.2273522, 0.1194374, 1.487566, 1, 0, 0, 1, 1,
0.2277127, -0.5636248, 2.829787, 1, 0, 0, 1, 1,
0.2278426, -1.062885, 2.405485, 1, 0, 0, 1, 1,
0.2343318, -1.265382, 2.961693, 1, 0, 0, 1, 1,
0.2344784, 0.1568263, 0.9286622, 0, 0, 0, 1, 1,
0.2364043, -1.006686, 3.076676, 0, 0, 0, 1, 1,
0.2399987, -0.5376696, 2.835734, 0, 0, 0, 1, 1,
0.2400793, 0.8201954, -0.9031951, 0, 0, 0, 1, 1,
0.2417777, -0.5797723, 3.143302, 0, 0, 0, 1, 1,
0.2420693, 0.39375, -0.8407366, 0, 0, 0, 1, 1,
0.2448989, -1.62147, 1.424371, 0, 0, 0, 1, 1,
0.2545489, -0.2813148, 0.4985804, 1, 1, 1, 1, 1,
0.2567894, 1.511366, -0.9182433, 1, 1, 1, 1, 1,
0.2608086, -1.167269, 3.078555, 1, 1, 1, 1, 1,
0.2639095, 1.560272, 0.5635901, 1, 1, 1, 1, 1,
0.2649118, -1.626664, 1.871459, 1, 1, 1, 1, 1,
0.2658754, 0.938257, 0.9912279, 1, 1, 1, 1, 1,
0.2695036, -1.878094, 1.965485, 1, 1, 1, 1, 1,
0.2700874, -1.111931, 3.476426, 1, 1, 1, 1, 1,
0.2746395, 1.150647, 0.4586035, 1, 1, 1, 1, 1,
0.279188, 0.1093186, 1.659275, 1, 1, 1, 1, 1,
0.2812952, 0.5771051, -1.423447, 1, 1, 1, 1, 1,
0.2837611, -0.1152307, 1.115528, 1, 1, 1, 1, 1,
0.2839976, -0.02826384, 1.3495, 1, 1, 1, 1, 1,
0.2886539, -0.8581067, 3.658276, 1, 1, 1, 1, 1,
0.2910218, -1.0696, 4.55988, 1, 1, 1, 1, 1,
0.2911943, -2.704556, 3.34058, 0, 0, 1, 1, 1,
0.3048251, 0.270182, 2.561576, 1, 0, 0, 1, 1,
0.3113521, 0.3087203, 1.602353, 1, 0, 0, 1, 1,
0.314277, 0.7305685, 2.046346, 1, 0, 0, 1, 1,
0.3163995, -1.146684, 5.435362, 1, 0, 0, 1, 1,
0.3247102, 0.1454145, 1.622807, 1, 0, 0, 1, 1,
0.3257378, -0.9514049, 1.700349, 0, 0, 0, 1, 1,
0.3328568, 0.6777814, 0.9077114, 0, 0, 0, 1, 1,
0.3345988, -0.4842202, 3.394883, 0, 0, 0, 1, 1,
0.3357764, 0.07179849, 0.1731472, 0, 0, 0, 1, 1,
0.3497487, 0.9755573, -0.5357063, 0, 0, 0, 1, 1,
0.3509214, 1.549251, 0.9287573, 0, 0, 0, 1, 1,
0.3528892, 0.6568104, 0.1480724, 0, 0, 0, 1, 1,
0.3564577, 1.053101, -0.7928444, 1, 1, 1, 1, 1,
0.3574503, -0.5621566, 2.486887, 1, 1, 1, 1, 1,
0.3614526, -0.1205701, 1.988187, 1, 1, 1, 1, 1,
0.3748019, 0.7529544, 0.95777, 1, 1, 1, 1, 1,
0.3766984, 0.9957559, 0.750316, 1, 1, 1, 1, 1,
0.382015, 0.1847268, 2.107184, 1, 1, 1, 1, 1,
0.3827394, -0.6605131, 2.751034, 1, 1, 1, 1, 1,
0.3835971, 0.8847114, 0.2216254, 1, 1, 1, 1, 1,
0.3853616, 0.7057372, 0.3979904, 1, 1, 1, 1, 1,
0.3870038, 0.3650857, -0.8876705, 1, 1, 1, 1, 1,
0.3940875, -0.4016418, 0.9904436, 1, 1, 1, 1, 1,
0.3942491, 0.2111959, 0.4123727, 1, 1, 1, 1, 1,
0.3998874, 0.3278522, 0.1670034, 1, 1, 1, 1, 1,
0.402689, 1.22453, 0.2905435, 1, 1, 1, 1, 1,
0.4036505, 2.332515, 0.8179733, 1, 1, 1, 1, 1,
0.404471, -0.8018029, 2.312199, 0, 0, 1, 1, 1,
0.406576, -0.9032775, 2.24529, 1, 0, 0, 1, 1,
0.4101853, -0.3457722, 0.8719406, 1, 0, 0, 1, 1,
0.4121155, -0.09333196, 1.579718, 1, 0, 0, 1, 1,
0.4121743, 0.3953383, 0.4686302, 1, 0, 0, 1, 1,
0.4128794, -1.872264, 4.01034, 1, 0, 0, 1, 1,
0.4181048, 1.840778, 2.827776, 0, 0, 0, 1, 1,
0.4185139, 0.07164054, 3.595064, 0, 0, 0, 1, 1,
0.4230082, 0.431627, 0.643619, 0, 0, 0, 1, 1,
0.4269525, 1.675075, 0.6213915, 0, 0, 0, 1, 1,
0.4270721, -0.7220013, 2.646164, 0, 0, 0, 1, 1,
0.4307021, -0.4187121, 1.620597, 0, 0, 0, 1, 1,
0.4309705, 1.168979, 0.1446621, 0, 0, 0, 1, 1,
0.4346914, -1.385878, 2.339032, 1, 1, 1, 1, 1,
0.434836, 0.37751, 2.385702, 1, 1, 1, 1, 1,
0.4422644, 0.1808228, 0.938071, 1, 1, 1, 1, 1,
0.4441546, 1.223838, 0.2968661, 1, 1, 1, 1, 1,
0.4491177, -0.1917392, 1.563316, 1, 1, 1, 1, 1,
0.4503688, 0.2453691, 3.351888, 1, 1, 1, 1, 1,
0.4522276, 1.102489, 0.2520799, 1, 1, 1, 1, 1,
0.459375, -1.272868, 3.776402, 1, 1, 1, 1, 1,
0.4624985, 0.3393103, -0.01640945, 1, 1, 1, 1, 1,
0.470295, -0.9634566, 5.18595, 1, 1, 1, 1, 1,
0.4711263, 0.0803344, 1.665306, 1, 1, 1, 1, 1,
0.4785169, 0.08292467, 0.1008742, 1, 1, 1, 1, 1,
0.4802841, 0.02040129, 3.23273, 1, 1, 1, 1, 1,
0.4815415, -0.6599139, 1.578817, 1, 1, 1, 1, 1,
0.4826187, -0.307052, 1.703004, 1, 1, 1, 1, 1,
0.4903883, 0.4479754, 1.647454, 0, 0, 1, 1, 1,
0.4912013, 0.8705381, 0.4677003, 1, 0, 0, 1, 1,
0.491471, 0.6951035, -0.200022, 1, 0, 0, 1, 1,
0.4917413, 0.5408954, 2.086007, 1, 0, 0, 1, 1,
0.4955913, 0.5041009, 0.3452254, 1, 0, 0, 1, 1,
0.4965461, 1.431843, -0.732284, 1, 0, 0, 1, 1,
0.4978414, 0.6386096, 0.5804675, 0, 0, 0, 1, 1,
0.5043222, -0.2495672, 1.572183, 0, 0, 0, 1, 1,
0.5082544, 0.4389665, 1.685928, 0, 0, 0, 1, 1,
0.5113669, 1.583668, -0.07784745, 0, 0, 0, 1, 1,
0.5117472, 0.9759915, -0.3066138, 0, 0, 0, 1, 1,
0.5120127, 0.8079119, -0.2031238, 0, 0, 0, 1, 1,
0.5124964, 0.03561918, 1.860456, 0, 0, 0, 1, 1,
0.521762, -1.183099, 2.497002, 1, 1, 1, 1, 1,
0.5219641, -0.4305715, 1.041289, 1, 1, 1, 1, 1,
0.5279867, 0.7718265, 1.038098, 1, 1, 1, 1, 1,
0.5341137, -0.662961, 3.32224, 1, 1, 1, 1, 1,
0.5372777, -0.06974505, -1.188763, 1, 1, 1, 1, 1,
0.5385736, -0.7391173, 2.870582, 1, 1, 1, 1, 1,
0.5392009, 0.4829665, -0.3460694, 1, 1, 1, 1, 1,
0.5448071, 0.3353887, 2.031912, 1, 1, 1, 1, 1,
0.5457699, -0.5321569, 1.721766, 1, 1, 1, 1, 1,
0.5484344, 0.6523039, -0.4510804, 1, 1, 1, 1, 1,
0.5511436, -0.3088632, 1.190674, 1, 1, 1, 1, 1,
0.5519179, 0.1411093, 1.173531, 1, 1, 1, 1, 1,
0.5527349, -0.005799538, -0.05159571, 1, 1, 1, 1, 1,
0.5527902, -0.5420207, 1.094982, 1, 1, 1, 1, 1,
0.5572463, -0.327695, 2.387966, 1, 1, 1, 1, 1,
0.5576325, 1.36138, 1.650046, 0, 0, 1, 1, 1,
0.5683479, 1.690966, 0.3812756, 1, 0, 0, 1, 1,
0.5704287, 0.4647089, 1.215531, 1, 0, 0, 1, 1,
0.572891, -0.3298418, 0.5899179, 1, 0, 0, 1, 1,
0.5733405, 0.4333108, 0.6862628, 1, 0, 0, 1, 1,
0.5745087, -0.2073831, 2.813689, 1, 0, 0, 1, 1,
0.5849705, -0.02189225, 2.661122, 0, 0, 0, 1, 1,
0.5851271, 3.034474, -0.8008559, 0, 0, 0, 1, 1,
0.5942692, 0.7168975, 1.199712, 0, 0, 0, 1, 1,
0.5945828, -2.098159, 4.305668, 0, 0, 0, 1, 1,
0.6005269, 0.002855771, 0.8090654, 0, 0, 0, 1, 1,
0.6008859, -0.09910613, 1.016856, 0, 0, 0, 1, 1,
0.6014831, 0.8919677, 0.02170855, 0, 0, 0, 1, 1,
0.604283, -0.9630591, 2.125055, 1, 1, 1, 1, 1,
0.6072059, -2.879018, 3.550424, 1, 1, 1, 1, 1,
0.6074906, -0.7811373, 3.130075, 1, 1, 1, 1, 1,
0.6102102, -0.3689149, 1.012288, 1, 1, 1, 1, 1,
0.6105833, 1.226704, 1.453547, 1, 1, 1, 1, 1,
0.6107872, 1.825143, -0.2546582, 1, 1, 1, 1, 1,
0.6123311, -0.8193697, 2.895593, 1, 1, 1, 1, 1,
0.6147172, 1.058836, 1.526611, 1, 1, 1, 1, 1,
0.6176093, 1.085306, -0.6698588, 1, 1, 1, 1, 1,
0.6177407, -2.313692, 3.811881, 1, 1, 1, 1, 1,
0.6188247, -1.37475, 3.107577, 1, 1, 1, 1, 1,
0.619166, 0.3833369, 1.30533, 1, 1, 1, 1, 1,
0.6222746, 1.347928, -2.458097, 1, 1, 1, 1, 1,
0.6222817, 0.9866779, 1.213972, 1, 1, 1, 1, 1,
0.6225606, 1.357189, 0.3040275, 1, 1, 1, 1, 1,
0.624631, -0.6990554, 2.805821, 0, 0, 1, 1, 1,
0.6259173, 0.6653307, -0.6300889, 1, 0, 0, 1, 1,
0.6273023, -1.856785, 1.788773, 1, 0, 0, 1, 1,
0.6284853, -0.6928778, 3.195261, 1, 0, 0, 1, 1,
0.6305716, -1.938234, 2.497411, 1, 0, 0, 1, 1,
0.6351526, 1.513933, 0.510391, 1, 0, 0, 1, 1,
0.6353505, -0.01553613, 0.8326622, 0, 0, 0, 1, 1,
0.6377351, -0.3228679, 1.956287, 0, 0, 0, 1, 1,
0.6400304, 0.03676514, 0.04204807, 0, 0, 0, 1, 1,
0.6407053, 0.7184433, 1.227931, 0, 0, 0, 1, 1,
0.6455316, -0.02135307, 1.192292, 0, 0, 0, 1, 1,
0.6455389, 1.376888, 1.190239, 0, 0, 0, 1, 1,
0.6476601, -1.558035, 2.980408, 0, 0, 0, 1, 1,
0.654678, -0.3347157, 2.99589, 1, 1, 1, 1, 1,
0.6606299, 0.166125, 3.107617, 1, 1, 1, 1, 1,
0.6687973, -0.7182606, 1.599659, 1, 1, 1, 1, 1,
0.6701028, 1.343601, 0.2673269, 1, 1, 1, 1, 1,
0.6730324, 0.03441187, 0.9068504, 1, 1, 1, 1, 1,
0.6751476, 0.3909135, 0.8807781, 1, 1, 1, 1, 1,
0.678713, 0.4724379, 1.753437, 1, 1, 1, 1, 1,
0.6834083, 0.5173919, 0.3343992, 1, 1, 1, 1, 1,
0.6851536, -0.4089839, 0.5329548, 1, 1, 1, 1, 1,
0.6865637, -1.560297, 3.391925, 1, 1, 1, 1, 1,
0.6877145, -0.6428004, 2.787978, 1, 1, 1, 1, 1,
0.6882919, -1.381725, 2.499517, 1, 1, 1, 1, 1,
0.6893394, 1.006368, 1.687032, 1, 1, 1, 1, 1,
0.6895924, -0.292947, 1.148933, 1, 1, 1, 1, 1,
0.6940473, 0.2599026, 0.7095575, 1, 1, 1, 1, 1,
0.6964971, -0.4408808, 2.481124, 0, 0, 1, 1, 1,
0.6990275, 0.1030146, 0.9553483, 1, 0, 0, 1, 1,
0.7002133, -0.5045319, 1.990031, 1, 0, 0, 1, 1,
0.7027049, -0.6984962, 1.193518, 1, 0, 0, 1, 1,
0.704765, -0.5080863, 3.380168, 1, 0, 0, 1, 1,
0.7056918, -1.419295, 3.922932, 1, 0, 0, 1, 1,
0.7086751, 0.6556414, 1.059178, 0, 0, 0, 1, 1,
0.7097721, 1.807838, -1.456319, 0, 0, 0, 1, 1,
0.7139601, -2.404596, 4.846781, 0, 0, 0, 1, 1,
0.7200993, 1.808573, 1.055116, 0, 0, 0, 1, 1,
0.7268067, 0.7543047, 0.339207, 0, 0, 0, 1, 1,
0.7279202, -0.3051916, 2.461674, 0, 0, 0, 1, 1,
0.7306962, 0.1527967, 3.267729, 0, 0, 0, 1, 1,
0.7312293, 0.5797773, -0.02979502, 1, 1, 1, 1, 1,
0.7326164, 0.719372, 0.4803451, 1, 1, 1, 1, 1,
0.7330508, 0.3705377, 1.733839, 1, 1, 1, 1, 1,
0.735607, 1.151634, 1.128543, 1, 1, 1, 1, 1,
0.7400783, 0.3028447, -0.2181607, 1, 1, 1, 1, 1,
0.7414576, 0.8009853, -0.5723156, 1, 1, 1, 1, 1,
0.7417453, -0.07857774, 2.023509, 1, 1, 1, 1, 1,
0.7480049, 1.102247, -0.3357166, 1, 1, 1, 1, 1,
0.7550497, 2.579698, 1.434525, 1, 1, 1, 1, 1,
0.7560337, 0.1853488, 0.2041295, 1, 1, 1, 1, 1,
0.7653173, 0.05186952, 4.250654, 1, 1, 1, 1, 1,
0.7683095, 0.4570041, 0.7698471, 1, 1, 1, 1, 1,
0.7703381, -1.047133, 2.643719, 1, 1, 1, 1, 1,
0.7876474, 2.046024, 0.4221263, 1, 1, 1, 1, 1,
0.7913761, 0.05762462, 3.050919, 1, 1, 1, 1, 1,
0.7960814, 1.644196, 0.7215649, 0, 0, 1, 1, 1,
0.7981504, -0.06287625, 1.722969, 1, 0, 0, 1, 1,
0.8015846, -0.2789167, 0.7026834, 1, 0, 0, 1, 1,
0.8045022, 0.4267143, 1.748826, 1, 0, 0, 1, 1,
0.8048008, -0.8402881, 2.156606, 1, 0, 0, 1, 1,
0.8055951, 0.8682847, -0.02215134, 1, 0, 0, 1, 1,
0.8157976, 1.182773, 0.4664084, 0, 0, 0, 1, 1,
0.8184686, 0.8853912, 0.9317383, 0, 0, 0, 1, 1,
0.8192664, 1.737379, 1.788694, 0, 0, 0, 1, 1,
0.8195967, -2.800018, 3.377327, 0, 0, 0, 1, 1,
0.8226222, 0.4810744, 1.801478, 0, 0, 0, 1, 1,
0.8260373, 0.9424176, -0.07638898, 0, 0, 0, 1, 1,
0.8273661, 1.828743, 1.44305, 0, 0, 0, 1, 1,
0.8291445, 0.841491, -0.5085577, 1, 1, 1, 1, 1,
0.83481, -0.9519944, 1.066901, 1, 1, 1, 1, 1,
0.837514, 0.5526215, -0.6087255, 1, 1, 1, 1, 1,
0.8378013, 0.2126341, 2.427116, 1, 1, 1, 1, 1,
0.8378879, -0.03923536, 1.768626, 1, 1, 1, 1, 1,
0.8431694, 1.331749, 0.09049845, 1, 1, 1, 1, 1,
0.8455328, -0.928214, 2.210592, 1, 1, 1, 1, 1,
0.8491004, -0.211207, 2.144089, 1, 1, 1, 1, 1,
0.8494119, 0.5793374, 0.5195701, 1, 1, 1, 1, 1,
0.849613, -0.9233628, 2.714313, 1, 1, 1, 1, 1,
0.8555776, -1.864991, 4.810038, 1, 1, 1, 1, 1,
0.8810261, -0.03877849, 1.805378, 1, 1, 1, 1, 1,
0.8864374, -0.2351454, 2.518229, 1, 1, 1, 1, 1,
0.8934335, 1.647305, 2.101788, 1, 1, 1, 1, 1,
0.9137699, -2.351766, 2.212479, 1, 1, 1, 1, 1,
0.923369, -0.2196316, 1.146942, 0, 0, 1, 1, 1,
0.9266998, 1.069577, -0.8975937, 1, 0, 0, 1, 1,
0.9375833, -1.20927, 2.989902, 1, 0, 0, 1, 1,
0.9412519, -0.07951991, 3.313585, 1, 0, 0, 1, 1,
0.9419653, -1.175546, 2.609803, 1, 0, 0, 1, 1,
0.948292, -0.8414316, 2.683155, 1, 0, 0, 1, 1,
0.9539762, 1.254802, 2.449124, 0, 0, 0, 1, 1,
0.959775, -0.107221, 2.79534, 0, 0, 0, 1, 1,
0.9624751, 0.2844942, 0.7993093, 0, 0, 0, 1, 1,
0.9650009, 0.7918639, -0.2945883, 0, 0, 0, 1, 1,
0.9656562, 0.1481744, 2.001022, 0, 0, 0, 1, 1,
0.9765126, -0.0361258, 0.5114803, 0, 0, 0, 1, 1,
0.9822212, -1.065354, 3.770911, 0, 0, 0, 1, 1,
0.9867151, 0.3295386, 1.310127, 1, 1, 1, 1, 1,
0.9908847, -1.620538, 3.360355, 1, 1, 1, 1, 1,
0.991992, 1.109641, 1.937203, 1, 1, 1, 1, 1,
0.9967274, 0.1605549, 2.131157, 1, 1, 1, 1, 1,
1.003662, 0.0674063, -0.8033576, 1, 1, 1, 1, 1,
1.009078, 0.4666757, 1.082264, 1, 1, 1, 1, 1,
1.019847, -0.5527711, 0.6229582, 1, 1, 1, 1, 1,
1.021134, 1.618272, 0.8228012, 1, 1, 1, 1, 1,
1.027237, -0.6777831, 2.69268, 1, 1, 1, 1, 1,
1.030144, -0.9280651, 2.850013, 1, 1, 1, 1, 1,
1.03265, 1.296757, 1.633625, 1, 1, 1, 1, 1,
1.038614, 0.1539413, 3.381205, 1, 1, 1, 1, 1,
1.040106, 0.3554556, 1.106991, 1, 1, 1, 1, 1,
1.040457, -0.9452934, 2.988912, 1, 1, 1, 1, 1,
1.041647, 1.249767, -2.143776, 1, 1, 1, 1, 1,
1.049822, 0.958724, 0.3978399, 0, 0, 1, 1, 1,
1.051011, 1.203014, 0.822278, 1, 0, 0, 1, 1,
1.058363, 0.8045259, 1.729877, 1, 0, 0, 1, 1,
1.071418, 1.344684, 0.6701041, 1, 0, 0, 1, 1,
1.088769, -0.05844998, 1.510914, 1, 0, 0, 1, 1,
1.088817, 0.6360165, 2.747518, 1, 0, 0, 1, 1,
1.089969, 2.787385, 1.410579, 0, 0, 0, 1, 1,
1.09134, 1.420495, -1.101687, 0, 0, 0, 1, 1,
1.092379, 0.7668208, 2.434735, 0, 0, 0, 1, 1,
1.093374, 1.086692, 3.834463, 0, 0, 0, 1, 1,
1.101059, -0.1661419, 1.383558, 0, 0, 0, 1, 1,
1.10284, 1.164881, 0.3339918, 0, 0, 0, 1, 1,
1.103201, 1.737461, 1.834594, 0, 0, 0, 1, 1,
1.106947, -0.8093024, 1.144636, 1, 1, 1, 1, 1,
1.115528, 0.4101269, 1.71707, 1, 1, 1, 1, 1,
1.117361, 0.3806555, 1.440742, 1, 1, 1, 1, 1,
1.119328, -0.6529807, 1.610069, 1, 1, 1, 1, 1,
1.121024, 1.402897, 0.247489, 1, 1, 1, 1, 1,
1.12419, -0.6711568, 3.66682, 1, 1, 1, 1, 1,
1.129212, 0.02737094, 2.267966, 1, 1, 1, 1, 1,
1.131681, -0.8687998, 1.814152, 1, 1, 1, 1, 1,
1.133644, 1.659814, 0.9483534, 1, 1, 1, 1, 1,
1.134192, -0.6440948, 2.430971, 1, 1, 1, 1, 1,
1.13547, 0.8010285, -0.0465944, 1, 1, 1, 1, 1,
1.13644, 0.4508251, 0.7392909, 1, 1, 1, 1, 1,
1.140668, -1.409883, 2.865712, 1, 1, 1, 1, 1,
1.143138, 0.03230555, 0.7463665, 1, 1, 1, 1, 1,
1.148014, -0.5809124, 1.700969, 1, 1, 1, 1, 1,
1.169902, 0.4868813, 0.05334519, 0, 0, 1, 1, 1,
1.179734, 0.1788769, 2.140557, 1, 0, 0, 1, 1,
1.197851, 0.1003672, 2.361202, 1, 0, 0, 1, 1,
1.201468, -1.675894, 1.253261, 1, 0, 0, 1, 1,
1.203568, -0.5791357, 1.593213, 1, 0, 0, 1, 1,
1.206888, 0.01370164, 2.110035, 1, 0, 0, 1, 1,
1.211699, 0.03967817, 2.307145, 0, 0, 0, 1, 1,
1.215702, -1.360778, 2.788228, 0, 0, 0, 1, 1,
1.217764, 0.09499589, 1.268614, 0, 0, 0, 1, 1,
1.218676, 0.451243, 2.853409, 0, 0, 0, 1, 1,
1.223843, 0.3240632, 2.687182, 0, 0, 0, 1, 1,
1.225656, 0.1876233, 1.90132, 0, 0, 0, 1, 1,
1.23216, -1.639799, 2.822534, 0, 0, 0, 1, 1,
1.236537, -0.1480307, 1.376539, 1, 1, 1, 1, 1,
1.242981, 0.8307167, 0.8453358, 1, 1, 1, 1, 1,
1.248082, 0.2491604, 1.444154, 1, 1, 1, 1, 1,
1.253775, 0.2009763, 1.052809, 1, 1, 1, 1, 1,
1.260323, 0.2468124, 2.281409, 1, 1, 1, 1, 1,
1.263747, -0.8500229, 1.291081, 1, 1, 1, 1, 1,
1.266905, -1.135035, 2.376614, 1, 1, 1, 1, 1,
1.273342, 0.4442252, 1.21479, 1, 1, 1, 1, 1,
1.275239, -0.06187151, 3.231408, 1, 1, 1, 1, 1,
1.281414, 0.3087841, 0.5521868, 1, 1, 1, 1, 1,
1.291554, -0.7082703, 0.4649973, 1, 1, 1, 1, 1,
1.292502, -1.428822, 1.96314, 1, 1, 1, 1, 1,
1.296475, -0.07323219, 3.201859, 1, 1, 1, 1, 1,
1.299511, -0.852716, -0.0102105, 1, 1, 1, 1, 1,
1.30405, 1.00321, -0.1687324, 1, 1, 1, 1, 1,
1.306694, 0.9442233, 0.4940411, 0, 0, 1, 1, 1,
1.308377, 0.2495121, 2.741232, 1, 0, 0, 1, 1,
1.309689, 1.363105, -0.6566021, 1, 0, 0, 1, 1,
1.312701, 0.01605659, 2.152575, 1, 0, 0, 1, 1,
1.316003, 1.755818, 1.407103, 1, 0, 0, 1, 1,
1.316015, 0.3228978, 0.9880873, 1, 0, 0, 1, 1,
1.317028, 0.6392929, 1.519059, 0, 0, 0, 1, 1,
1.32026, 0.832832, 2.35698, 0, 0, 0, 1, 1,
1.330736, -0.02330291, -0.1561474, 0, 0, 0, 1, 1,
1.333344, -2.129165, 2.782533, 0, 0, 0, 1, 1,
1.337761, -1.860895, 1.648295, 0, 0, 0, 1, 1,
1.338465, -1.70111, 1.881325, 0, 0, 0, 1, 1,
1.339126, 0.700725, 1.258645, 0, 0, 0, 1, 1,
1.339162, 0.3122395, 0.244622, 1, 1, 1, 1, 1,
1.346804, 0.4102794, 0.1434795, 1, 1, 1, 1, 1,
1.35137, -1.109445, 2.349318, 1, 1, 1, 1, 1,
1.360859, -1.256162, 1.317663, 1, 1, 1, 1, 1,
1.360906, 0.6361278, 1.196404, 1, 1, 1, 1, 1,
1.367293, -0.2289537, 2.521894, 1, 1, 1, 1, 1,
1.370231, 0.7575178, -0.2783625, 1, 1, 1, 1, 1,
1.382525, -1.226185, 1.127322, 1, 1, 1, 1, 1,
1.385317, -1.345465, 2.668546, 1, 1, 1, 1, 1,
1.397905, 1.076041, -0.2045989, 1, 1, 1, 1, 1,
1.409419, -0.6276492, 2.758151, 1, 1, 1, 1, 1,
1.410271, 0.5214617, 1.295149, 1, 1, 1, 1, 1,
1.414544, 0.6578978, 1.486523, 1, 1, 1, 1, 1,
1.414568, -0.7593968, 0.4685896, 1, 1, 1, 1, 1,
1.417543, 1.63515, 0.2144957, 1, 1, 1, 1, 1,
1.418628, -1.245122, 1.939769, 0, 0, 1, 1, 1,
1.419084, 1.52771, 1.277144, 1, 0, 0, 1, 1,
1.419494, 0.2955698, 0.3125469, 1, 0, 0, 1, 1,
1.426267, -0.3066868, 1.070818, 1, 0, 0, 1, 1,
1.428085, -0.004664426, 1.307472, 1, 0, 0, 1, 1,
1.429208, -2.339214, 4.518001, 1, 0, 0, 1, 1,
1.446447, 1.345449, 0.9485555, 0, 0, 0, 1, 1,
1.461525, -0.7160515, 2.268298, 0, 0, 0, 1, 1,
1.496751, 0.6364848, 1.441626, 0, 0, 0, 1, 1,
1.526233, -0.3505178, 2.015035, 0, 0, 0, 1, 1,
1.533737, -0.8046159, 2.724705, 0, 0, 0, 1, 1,
1.540739, 1.28092, 0.02786925, 0, 0, 0, 1, 1,
1.54125, 0.5422449, 0.9312591, 0, 0, 0, 1, 1,
1.563997, 0.4871567, 1.726586, 1, 1, 1, 1, 1,
1.566637, 0.1414642, 2.773747, 1, 1, 1, 1, 1,
1.566795, -0.9303859, 2.845667, 1, 1, 1, 1, 1,
1.586819, -1.195489, 3.890511, 1, 1, 1, 1, 1,
1.591383, -0.3619706, 1.758775, 1, 1, 1, 1, 1,
1.600941, -0.3042267, 1.728097, 1, 1, 1, 1, 1,
1.61418, 0.6981889, 1.996503, 1, 1, 1, 1, 1,
1.622029, -0.4473203, 0.7697018, 1, 1, 1, 1, 1,
1.622206, -0.6166565, 2.407135, 1, 1, 1, 1, 1,
1.623687, -1.177307, 3.325853, 1, 1, 1, 1, 1,
1.625825, -0.2632187, 2.953096, 1, 1, 1, 1, 1,
1.629283, 0.1460045, 2.498741, 1, 1, 1, 1, 1,
1.635642, 0.8359013, -0.1568284, 1, 1, 1, 1, 1,
1.640582, -0.718372, 0.9551525, 1, 1, 1, 1, 1,
1.643374, -0.5150641, 1.347918, 1, 1, 1, 1, 1,
1.648625, 0.653765, 0.8032877, 0, 0, 1, 1, 1,
1.654384, -0.4673859, 1.888792, 1, 0, 0, 1, 1,
1.662312, 0.5579548, 1.225311, 1, 0, 0, 1, 1,
1.664333, 0.3650613, 1.771394, 1, 0, 0, 1, 1,
1.679303, 0.4194907, 0.1871195, 1, 0, 0, 1, 1,
1.683731, -1.059289, 1.557627, 1, 0, 0, 1, 1,
1.691639, 1.012475, 0.231692, 0, 0, 0, 1, 1,
1.692026, 1.553585, -1.116467, 0, 0, 0, 1, 1,
1.733445, -1.267252, 1.857511, 0, 0, 0, 1, 1,
1.734534, -0.2396099, 0.2289948, 0, 0, 0, 1, 1,
1.735564, -0.4198371, 0.53496, 0, 0, 0, 1, 1,
1.737226, 0.1142903, 1.501858, 0, 0, 0, 1, 1,
1.754451, -1.267903, 2.651628, 0, 0, 0, 1, 1,
1.772701, -0.8973246, 1.775919, 1, 1, 1, 1, 1,
1.780334, -1.642767, 0.9313605, 1, 1, 1, 1, 1,
1.782008, -0.1440458, 1.410986, 1, 1, 1, 1, 1,
1.839674, 2.012277, 1.83784, 1, 1, 1, 1, 1,
1.845954, 0.5184944, -1.111447, 1, 1, 1, 1, 1,
1.857292, 2.542292, 2.423705, 1, 1, 1, 1, 1,
1.868986, 1.052375, -0.1117845, 1, 1, 1, 1, 1,
1.87194, -0.3686823, 0.4259076, 1, 1, 1, 1, 1,
1.881739, -1.778248, 2.641035, 1, 1, 1, 1, 1,
1.915559, -0.9151142, 3.313027, 1, 1, 1, 1, 1,
1.929971, -1.515719, 3.070584, 1, 1, 1, 1, 1,
1.937772, 0.8493884, 1.209954, 1, 1, 1, 1, 1,
1.94611, -0.292911, 1.774517, 1, 1, 1, 1, 1,
1.965581, -0.7732286, 1.735726, 1, 1, 1, 1, 1,
1.973435, -0.1881281, 3.37634, 1, 1, 1, 1, 1,
1.986522, 0.5852334, 0.2228354, 0, 0, 1, 1, 1,
1.988721, -0.953513, 1.820981, 1, 0, 0, 1, 1,
2.023799, -0.5688255, 2.051912, 1, 0, 0, 1, 1,
2.026623, -2.75191, 2.221664, 1, 0, 0, 1, 1,
2.029154, -0.1911109, 0.5093785, 1, 0, 0, 1, 1,
2.032711, -0.56811, 2.31495, 1, 0, 0, 1, 1,
2.035011, -1.512817, 2.266088, 0, 0, 0, 1, 1,
2.102366, -0.5708796, 2.311138, 0, 0, 0, 1, 1,
2.169847, -0.127434, 2.372843, 0, 0, 0, 1, 1,
2.19499, -0.06973676, 2.39282, 0, 0, 0, 1, 1,
2.241152, 0.7878428, 1.795239, 0, 0, 0, 1, 1,
2.252225, -1.309173, 0.6303279, 0, 0, 0, 1, 1,
2.422089, 0.9089837, 2.150797, 0, 0, 0, 1, 1,
2.634298, -0.4552232, 2.842095, 1, 1, 1, 1, 1,
2.65261, -1.142772, 1.671462, 1, 1, 1, 1, 1,
2.693422, 1.130769, 0.2475924, 1, 1, 1, 1, 1,
2.740186, -0.704136, 0.3442082, 1, 1, 1, 1, 1,
2.85343, -1.137882, 2.288428, 1, 1, 1, 1, 1,
2.946704, -0.6310408, 2.562344, 1, 1, 1, 1, 1,
3.236561, -0.678607, 2.537735, 1, 1, 1, 1, 1
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
var radius = 10.16478;
var distance = 35.70337;
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
mvMatrix.translate( 0.4828019, 0.1964197, 0.1229825 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.70337);
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
