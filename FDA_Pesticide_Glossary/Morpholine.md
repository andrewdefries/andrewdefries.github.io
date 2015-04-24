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
-3.023957, 0.7994156, -1.824889, 1, 0, 0, 1,
-2.774402, -0.1229698, 0.08448569, 1, 0.007843138, 0, 1,
-2.662615, -0.9477686, -0.8898335, 1, 0.01176471, 0, 1,
-2.595617, -0.05407456, -3.464135, 1, 0.01960784, 0, 1,
-2.458478, -1.049099, -1.890777, 1, 0.02352941, 0, 1,
-2.453241, 1.087531, -0.2949023, 1, 0.03137255, 0, 1,
-2.414577, -0.5172295, -2.451859, 1, 0.03529412, 0, 1,
-2.390239, 0.9725527, -1.746423, 1, 0.04313726, 0, 1,
-2.362406, -1.825664, -0.8491689, 1, 0.04705882, 0, 1,
-2.31608, -1.076481, -2.136446, 1, 0.05490196, 0, 1,
-2.289491, -2.771027, -2.543229, 1, 0.05882353, 0, 1,
-2.221798, 2.209743, -0.3834856, 1, 0.06666667, 0, 1,
-2.19866, 0.537037, 0.04066773, 1, 0.07058824, 0, 1,
-2.176357, 0.158472, -1.132359, 1, 0.07843138, 0, 1,
-2.140938, 0.5560262, -2.526195, 1, 0.08235294, 0, 1,
-2.124536, 0.3987902, -0.4313737, 1, 0.09019608, 0, 1,
-2.12261, 0.7888218, 0.1635686, 1, 0.09411765, 0, 1,
-2.103513, -0.7553231, -3.475686, 1, 0.1019608, 0, 1,
-2.046837, 0.3224408, -2.165485, 1, 0.1098039, 0, 1,
-2.035819, -0.5486771, -0.7466483, 1, 0.1137255, 0, 1,
-2.034942, -0.1837377, -3.218427, 1, 0.1215686, 0, 1,
-1.935735, -0.5528163, -3.860363, 1, 0.1254902, 0, 1,
-1.934659, -0.2885407, -2.964132, 1, 0.1333333, 0, 1,
-1.930048, 1.463216, -0.6026326, 1, 0.1372549, 0, 1,
-1.927636, 0.289464, -0.2998758, 1, 0.145098, 0, 1,
-1.912864, 0.1723042, -1.668548, 1, 0.1490196, 0, 1,
-1.909931, -0.5245301, -4.447663, 1, 0.1568628, 0, 1,
-1.905158, -0.2028661, -2.649109, 1, 0.1607843, 0, 1,
-1.882894, -0.02258035, -1.564356, 1, 0.1686275, 0, 1,
-1.878065, 0.7057474, -2.454816, 1, 0.172549, 0, 1,
-1.870414, -0.460326, -1.660913, 1, 0.1803922, 0, 1,
-1.856099, 0.08227655, -1.270068, 1, 0.1843137, 0, 1,
-1.833512, -1.631851, -2.592344, 1, 0.1921569, 0, 1,
-1.82811, 0.2406918, 0.05732233, 1, 0.1960784, 0, 1,
-1.825256, 0.904157, -1.871387, 1, 0.2039216, 0, 1,
-1.824372, -0.5240008, -1.451271, 1, 0.2117647, 0, 1,
-1.814728, 1.49638, -1.316873, 1, 0.2156863, 0, 1,
-1.783133, -0.4220219, -1.459662, 1, 0.2235294, 0, 1,
-1.776933, -0.9098125, -2.101295, 1, 0.227451, 0, 1,
-1.761922, -0.4428335, -2.167274, 1, 0.2352941, 0, 1,
-1.743784, 1.183265, -2.484437, 1, 0.2392157, 0, 1,
-1.741728, 0.4608414, -2.534637, 1, 0.2470588, 0, 1,
-1.738149, -0.479293, -1.610607, 1, 0.2509804, 0, 1,
-1.71801, -0.1545268, -2.802853, 1, 0.2588235, 0, 1,
-1.694096, -0.9499818, -3.247555, 1, 0.2627451, 0, 1,
-1.683034, -1.102843, -2.453716, 1, 0.2705882, 0, 1,
-1.667967, -1.329051, -1.887315, 1, 0.2745098, 0, 1,
-1.664552, 0.1458912, -0.9031668, 1, 0.282353, 0, 1,
-1.620936, 0.1686588, -2.025487, 1, 0.2862745, 0, 1,
-1.609156, 1.137193, -2.547759, 1, 0.2941177, 0, 1,
-1.604818, 0.9310918, -0.2528011, 1, 0.3019608, 0, 1,
-1.602828, 0.03764659, -0.2526848, 1, 0.3058824, 0, 1,
-1.602675, -1.52733, -2.126811, 1, 0.3137255, 0, 1,
-1.596058, 0.4014877, -0.7900673, 1, 0.3176471, 0, 1,
-1.590167, -0.8285093, -2.751028, 1, 0.3254902, 0, 1,
-1.585848, -1.211422, -4.17416, 1, 0.3294118, 0, 1,
-1.585152, 0.8061876, -1.55348, 1, 0.3372549, 0, 1,
-1.565461, -1.322558, -1.859825, 1, 0.3411765, 0, 1,
-1.553003, 0.4362467, 0.1647672, 1, 0.3490196, 0, 1,
-1.551305, 0.5570527, -1.94246, 1, 0.3529412, 0, 1,
-1.524065, 0.7075446, -2.076146, 1, 0.3607843, 0, 1,
-1.519196, 0.5184106, -0.05284449, 1, 0.3647059, 0, 1,
-1.516152, -1.139363, -1.930511, 1, 0.372549, 0, 1,
-1.51371, 0.2795174, -3.508811, 1, 0.3764706, 0, 1,
-1.50279, -1.947882, -0.7828029, 1, 0.3843137, 0, 1,
-1.497488, 1.311732, -1.165617, 1, 0.3882353, 0, 1,
-1.481065, 0.2035838, 0.8056048, 1, 0.3960784, 0, 1,
-1.479602, 1.120364, -3.062175, 1, 0.4039216, 0, 1,
-1.470052, 0.9573671, 0.02810796, 1, 0.4078431, 0, 1,
-1.46971, 0.06218967, -1.374585, 1, 0.4156863, 0, 1,
-1.46218, -0.09839106, -1.662023, 1, 0.4196078, 0, 1,
-1.451898, -0.1443073, -1.72541, 1, 0.427451, 0, 1,
-1.442923, -0.216567, -1.986115, 1, 0.4313726, 0, 1,
-1.439831, 1.5462, -0.4636967, 1, 0.4392157, 0, 1,
-1.436297, -0.09093893, -2.645535, 1, 0.4431373, 0, 1,
-1.433169, -2.552182, -4.29367, 1, 0.4509804, 0, 1,
-1.426861, -0.7037193, -1.488256, 1, 0.454902, 0, 1,
-1.426777, 0.2760923, -0.2447015, 1, 0.4627451, 0, 1,
-1.418404, 2.363187, -1.477283, 1, 0.4666667, 0, 1,
-1.416133, 1.561545, -0.8705757, 1, 0.4745098, 0, 1,
-1.415625, 0.6967396, -0.7647358, 1, 0.4784314, 0, 1,
-1.413444, -0.04770484, -1.546023, 1, 0.4862745, 0, 1,
-1.411299, -0.9256904, -4.107735, 1, 0.4901961, 0, 1,
-1.401419, 0.755917, -2.263587, 1, 0.4980392, 0, 1,
-1.401199, -1.177894, -3.694344, 1, 0.5058824, 0, 1,
-1.386769, -0.06067984, -2.790875, 1, 0.509804, 0, 1,
-1.384425, 0.1017956, -2.278493, 1, 0.5176471, 0, 1,
-1.359597, 0.2966956, -1.994745, 1, 0.5215687, 0, 1,
-1.358694, 0.5989649, -2.469502, 1, 0.5294118, 0, 1,
-1.358252, 0.2406544, 0.2645164, 1, 0.5333334, 0, 1,
-1.350132, -1.607541, -2.526204, 1, 0.5411765, 0, 1,
-1.34056, -0.50262, -0.566072, 1, 0.5450981, 0, 1,
-1.328906, 0.3033589, -1.455391, 1, 0.5529412, 0, 1,
-1.325902, 0.3313913, -0.5709653, 1, 0.5568628, 0, 1,
-1.324832, -1.512074, -1.166612, 1, 0.5647059, 0, 1,
-1.32311, 0.8419068, -1.202324, 1, 0.5686275, 0, 1,
-1.315345, 0.7730253, -0.3428448, 1, 0.5764706, 0, 1,
-1.309457, 0.7531037, 0.1336415, 1, 0.5803922, 0, 1,
-1.309068, -0.3525381, -1.42074, 1, 0.5882353, 0, 1,
-1.297337, 1.026284, -0.1656996, 1, 0.5921569, 0, 1,
-1.291316, -0.1137651, -2.31537, 1, 0.6, 0, 1,
-1.285559, -0.01929054, -1.871049, 1, 0.6078432, 0, 1,
-1.272667, 0.0470477, -2.349596, 1, 0.6117647, 0, 1,
-1.250242, -0.785619, -1.155914, 1, 0.6196079, 0, 1,
-1.247079, 1.273616, 1.293775, 1, 0.6235294, 0, 1,
-1.244618, -0.2746666, -3.272256, 1, 0.6313726, 0, 1,
-1.243447, 0.8633686, 2.833706, 1, 0.6352941, 0, 1,
-1.241763, 1.03542, -1.858504, 1, 0.6431373, 0, 1,
-1.237208, 1.849473, -0.01931416, 1, 0.6470588, 0, 1,
-1.227965, -1.795412, -2.937486, 1, 0.654902, 0, 1,
-1.216947, -1.599853, -1.717348, 1, 0.6588235, 0, 1,
-1.212754, 0.4484614, -0.08287957, 1, 0.6666667, 0, 1,
-1.200512, -0.003761522, -2.198871, 1, 0.6705883, 0, 1,
-1.199518, 1.225835, 0.1055868, 1, 0.6784314, 0, 1,
-1.197481, 1.388317, -2.394984, 1, 0.682353, 0, 1,
-1.196928, -0.03769524, -1.048578, 1, 0.6901961, 0, 1,
-1.188172, 1.580812, -0.3223031, 1, 0.6941177, 0, 1,
-1.18107, 0.8573542, 0.142289, 1, 0.7019608, 0, 1,
-1.180839, 0.1961825, -2.389789, 1, 0.7098039, 0, 1,
-1.178524, 0.616066, -0.7002106, 1, 0.7137255, 0, 1,
-1.17784, 0.5705098, -1.046144, 1, 0.7215686, 0, 1,
-1.170684, 0.750273, -1.834515, 1, 0.7254902, 0, 1,
-1.159064, -1.250735, -0.9573804, 1, 0.7333333, 0, 1,
-1.156484, -0.2368007, -0.2600189, 1, 0.7372549, 0, 1,
-1.136458, 0.01554223, -2.737521, 1, 0.7450981, 0, 1,
-1.130898, 0.4175423, -0.8133427, 1, 0.7490196, 0, 1,
-1.129113, 1.065449, -1.296486, 1, 0.7568628, 0, 1,
-1.12679, 0.4984023, 0.5737628, 1, 0.7607843, 0, 1,
-1.109745, -0.02168251, -1.58448, 1, 0.7686275, 0, 1,
-1.105952, 2.030304, 1.482146, 1, 0.772549, 0, 1,
-1.105544, -1.636048, -3.577491, 1, 0.7803922, 0, 1,
-1.104775, 0.9430246, -1.294511, 1, 0.7843137, 0, 1,
-1.103751, 0.5662194, -0.04408196, 1, 0.7921569, 0, 1,
-1.103259, 0.5907313, -0.1106952, 1, 0.7960784, 0, 1,
-1.102719, 1.165952, -0.01612444, 1, 0.8039216, 0, 1,
-1.102131, -0.9613991, -2.338265, 1, 0.8117647, 0, 1,
-1.094995, -0.2381021, 0.02930092, 1, 0.8156863, 0, 1,
-1.076882, 2.678276, -1.542975, 1, 0.8235294, 0, 1,
-1.076861, -0.5153992, -2.186657, 1, 0.827451, 0, 1,
-1.07298, 0.7742001, 1.761923, 1, 0.8352941, 0, 1,
-1.066293, 0.1424773, -1.816366, 1, 0.8392157, 0, 1,
-1.064072, 2.635473, -0.3791866, 1, 0.8470588, 0, 1,
-1.063248, -0.5823579, -1.785839, 1, 0.8509804, 0, 1,
-1.062109, 0.5949374, -0.1654458, 1, 0.8588235, 0, 1,
-1.057277, 0.5513119, -1.202892, 1, 0.8627451, 0, 1,
-1.055338, -0.7855528, -3.563324, 1, 0.8705882, 0, 1,
-1.053562, -0.3065121, -1.728421, 1, 0.8745098, 0, 1,
-1.048995, -0.4343469, -1.516552, 1, 0.8823529, 0, 1,
-1.043795, -1.166782, -3.963387, 1, 0.8862745, 0, 1,
-1.038915, -2.683973, -2.477273, 1, 0.8941177, 0, 1,
-1.038562, -1.416305, -2.743788, 1, 0.8980392, 0, 1,
-1.038121, -0.2932553, -0.8106872, 1, 0.9058824, 0, 1,
-1.034458, -0.4644245, -2.928932, 1, 0.9137255, 0, 1,
-1.034013, -0.3956253, -0.382877, 1, 0.9176471, 0, 1,
-1.031087, 0.2594027, -2.781153, 1, 0.9254902, 0, 1,
-1.023133, 0.4590943, -2.391308, 1, 0.9294118, 0, 1,
-1.02223, 0.1608178, 0.10861, 1, 0.9372549, 0, 1,
-1.015225, 0.7823643, 0.6314037, 1, 0.9411765, 0, 1,
-1.013476, -0.4098109, -0.2252169, 1, 0.9490196, 0, 1,
-1.01191, -1.831869, -1.748412, 1, 0.9529412, 0, 1,
-0.998473, 1.20679, 0.3206599, 1, 0.9607843, 0, 1,
-0.9940801, -0.2840272, -0.1779357, 1, 0.9647059, 0, 1,
-0.991564, 1.036678, -1.550783, 1, 0.972549, 0, 1,
-0.987324, 1.72016, -0.4642148, 1, 0.9764706, 0, 1,
-0.9852338, 1.246472, 0.1999822, 1, 0.9843137, 0, 1,
-0.9812824, 1.230139, -1.723063, 1, 0.9882353, 0, 1,
-0.9780348, 0.3889768, -0.7545998, 1, 0.9960784, 0, 1,
-0.9708967, 0.8039221, -0.5560246, 0.9960784, 1, 0, 1,
-0.9624076, 1.358241, -0.2524822, 0.9921569, 1, 0, 1,
-0.9594318, -1.26692, -1.936799, 0.9843137, 1, 0, 1,
-0.9585121, 0.9347439, -1.986061, 0.9803922, 1, 0, 1,
-0.9583846, -0.7474514, -1.610865, 0.972549, 1, 0, 1,
-0.9536751, 0.07643311, -3.117123, 0.9686275, 1, 0, 1,
-0.9526375, -0.421749, -2.356466, 0.9607843, 1, 0, 1,
-0.9458885, 0.02665698, -1.818086, 0.9568627, 1, 0, 1,
-0.9387349, 0.04317487, -1.496171, 0.9490196, 1, 0, 1,
-0.9379688, -0.2800213, -1.041164, 0.945098, 1, 0, 1,
-0.918837, -0.08715476, -2.006464, 0.9372549, 1, 0, 1,
-0.91386, -0.06118738, -2.555954, 0.9333333, 1, 0, 1,
-0.9131364, -0.453566, -0.4871891, 0.9254902, 1, 0, 1,
-0.912389, 1.117389, 0.0889366, 0.9215686, 1, 0, 1,
-0.9113901, 0.5115134, -1.612971, 0.9137255, 1, 0, 1,
-0.9103494, 0.2957324, 0.1448887, 0.9098039, 1, 0, 1,
-0.9102979, -0.1521049, -3.192637, 0.9019608, 1, 0, 1,
-0.9029937, -0.4880645, -2.200232, 0.8941177, 1, 0, 1,
-0.8905344, 0.2581389, -2.182963, 0.8901961, 1, 0, 1,
-0.8824757, 0.3809318, -1.01804, 0.8823529, 1, 0, 1,
-0.8783104, 0.943688, 1.296524, 0.8784314, 1, 0, 1,
-0.8716361, -0.1375316, -1.120499, 0.8705882, 1, 0, 1,
-0.8710665, -0.9465784, -1.934313, 0.8666667, 1, 0, 1,
-0.8668067, 1.345648, -0.2928312, 0.8588235, 1, 0, 1,
-0.8651679, -0.5192419, -1.465745, 0.854902, 1, 0, 1,
-0.865056, -1.694864, -2.297763, 0.8470588, 1, 0, 1,
-0.8641058, 1.679947, -1.181925, 0.8431373, 1, 0, 1,
-0.8616961, 0.09740607, -0.4302008, 0.8352941, 1, 0, 1,
-0.8578583, -0.5385134, -1.579532, 0.8313726, 1, 0, 1,
-0.8537419, 0.760985, -0.2594902, 0.8235294, 1, 0, 1,
-0.844253, 0.8310801, -1.440849, 0.8196079, 1, 0, 1,
-0.8440734, 0.6172062, 0.3997824, 0.8117647, 1, 0, 1,
-0.8409635, 1.071447, -2.558548, 0.8078431, 1, 0, 1,
-0.8405044, -1.765344, -1.577246, 0.8, 1, 0, 1,
-0.829614, -1.459092, -1.367441, 0.7921569, 1, 0, 1,
-0.8243304, 0.9557428, 0.03541989, 0.7882353, 1, 0, 1,
-0.8212544, -1.581542, -3.376065, 0.7803922, 1, 0, 1,
-0.8173764, 0.6667234, -1.001282, 0.7764706, 1, 0, 1,
-0.811935, -0.5992672, -2.059543, 0.7686275, 1, 0, 1,
-0.8054693, 0.5403258, 0.3292755, 0.7647059, 1, 0, 1,
-0.8045732, 0.3478577, -0.4927632, 0.7568628, 1, 0, 1,
-0.8043365, 0.1472789, -2.653688, 0.7529412, 1, 0, 1,
-0.8026602, -2.37271, -2.607179, 0.7450981, 1, 0, 1,
-0.79426, 0.6585417, -0.7474006, 0.7411765, 1, 0, 1,
-0.7924142, -0.5461554, -2.834318, 0.7333333, 1, 0, 1,
-0.792103, -0.9066582, -3.760998, 0.7294118, 1, 0, 1,
-0.7840641, -0.2425226, -4.618534, 0.7215686, 1, 0, 1,
-0.7814546, 1.297487, -2.02224, 0.7176471, 1, 0, 1,
-0.7811413, 0.6581414, 0.2626734, 0.7098039, 1, 0, 1,
-0.7808956, -0.3425678, -1.576135, 0.7058824, 1, 0, 1,
-0.7709442, 0.3733701, -2.242363, 0.6980392, 1, 0, 1,
-0.7683507, 0.311866, 0.2911683, 0.6901961, 1, 0, 1,
-0.7624094, -1.402533, -3.213478, 0.6862745, 1, 0, 1,
-0.7582223, -0.5004379, -2.959535, 0.6784314, 1, 0, 1,
-0.7515114, -0.5450565, -0.8690182, 0.6745098, 1, 0, 1,
-0.7469875, 0.6014467, 0.3608482, 0.6666667, 1, 0, 1,
-0.746115, 0.2262999, -0.6387443, 0.6627451, 1, 0, 1,
-0.7439821, 0.04624175, -2.036387, 0.654902, 1, 0, 1,
-0.7403594, 0.8476776, -0.5725394, 0.6509804, 1, 0, 1,
-0.736057, -0.7507132, -1.390621, 0.6431373, 1, 0, 1,
-0.7355992, 0.2037174, -0.1156363, 0.6392157, 1, 0, 1,
-0.7347835, -0.2086226, -1.109606, 0.6313726, 1, 0, 1,
-0.7282558, 0.1754413, -1.856536, 0.627451, 1, 0, 1,
-0.7256998, 1.192756, -0.2782544, 0.6196079, 1, 0, 1,
-0.719669, 1.88439, -0.1162104, 0.6156863, 1, 0, 1,
-0.7163728, -0.5193501, -0.04856175, 0.6078432, 1, 0, 1,
-0.709343, 1.773658, -0.1529866, 0.6039216, 1, 0, 1,
-0.7048071, 0.09914181, -2.475165, 0.5960785, 1, 0, 1,
-0.7022075, -0.2120103, -0.365071, 0.5882353, 1, 0, 1,
-0.7019655, -0.05079367, -0.8562357, 0.5843138, 1, 0, 1,
-0.6977677, 0.709102, -2.695519, 0.5764706, 1, 0, 1,
-0.6967501, -0.2433539, -1.822258, 0.572549, 1, 0, 1,
-0.6944463, -0.4543663, -1.997583, 0.5647059, 1, 0, 1,
-0.6903111, -2.015134, -2.893339, 0.5607843, 1, 0, 1,
-0.6885215, 0.4256436, -0.808273, 0.5529412, 1, 0, 1,
-0.6872252, 0.1483796, -0.187866, 0.5490196, 1, 0, 1,
-0.6855654, 0.1172206, -2.054928, 0.5411765, 1, 0, 1,
-0.6846339, 1.232406, -2.629133, 0.5372549, 1, 0, 1,
-0.6840569, 0.2103887, -2.071221, 0.5294118, 1, 0, 1,
-0.6828756, 0.5209952, -0.1427821, 0.5254902, 1, 0, 1,
-0.6803811, -0.5607032, -1.902293, 0.5176471, 1, 0, 1,
-0.6775263, 0.2755885, -1.881728, 0.5137255, 1, 0, 1,
-0.669979, -0.5625107, -3.081916, 0.5058824, 1, 0, 1,
-0.6687772, 0.7538382, -2.436885, 0.5019608, 1, 0, 1,
-0.6663249, 0.5333115, -0.1963082, 0.4941176, 1, 0, 1,
-0.6660787, 0.16534, -0.3573979, 0.4862745, 1, 0, 1,
-0.6634369, 0.2503173, -1.200232, 0.4823529, 1, 0, 1,
-0.6558698, 0.8995385, 0.1076651, 0.4745098, 1, 0, 1,
-0.6543075, -2.090756, -3.609371, 0.4705882, 1, 0, 1,
-0.6542614, 0.7145665, 0.415047, 0.4627451, 1, 0, 1,
-0.6510106, 0.872004, -0.5219637, 0.4588235, 1, 0, 1,
-0.6497285, 1.712874, 1.084823, 0.4509804, 1, 0, 1,
-0.6472318, -0.4652835, -1.264999, 0.4470588, 1, 0, 1,
-0.6469598, 0.6130918, 1.161104, 0.4392157, 1, 0, 1,
-0.6468521, -0.3032318, -2.332299, 0.4352941, 1, 0, 1,
-0.6429035, -0.4056867, -1.578854, 0.427451, 1, 0, 1,
-0.6415648, -0.4246047, -1.560479, 0.4235294, 1, 0, 1,
-0.6403889, -1.145774, -2.705216, 0.4156863, 1, 0, 1,
-0.6379023, 1.158618, 0.2849372, 0.4117647, 1, 0, 1,
-0.636956, -0.6659147, -2.779911, 0.4039216, 1, 0, 1,
-0.6362073, 0.1387146, -2.385836, 0.3960784, 1, 0, 1,
-0.6341258, 0.8059338, -0.9793957, 0.3921569, 1, 0, 1,
-0.6264647, -0.7207627, -2.115191, 0.3843137, 1, 0, 1,
-0.6232908, 1.145238, -0.2852115, 0.3803922, 1, 0, 1,
-0.6204645, -0.2861185, -2.19685, 0.372549, 1, 0, 1,
-0.6162143, 1.284109, 1.549492, 0.3686275, 1, 0, 1,
-0.61216, -0.4996328, -1.982889, 0.3607843, 1, 0, 1,
-0.6119488, 0.03026379, -2.945208, 0.3568628, 1, 0, 1,
-0.6115889, -0.0584115, -2.456909, 0.3490196, 1, 0, 1,
-0.6107383, -0.321875, -1.260389, 0.345098, 1, 0, 1,
-0.610011, -0.9232678, -1.624357, 0.3372549, 1, 0, 1,
-0.6087803, 0.5330839, -0.5660404, 0.3333333, 1, 0, 1,
-0.6086113, -0.548728, -1.504666, 0.3254902, 1, 0, 1,
-0.6080565, 1.038735, -1.101205, 0.3215686, 1, 0, 1,
-0.603202, 1.536249, -0.5928, 0.3137255, 1, 0, 1,
-0.6000467, -1.358481, -2.387491, 0.3098039, 1, 0, 1,
-0.5982743, -1.926067, -4.388033, 0.3019608, 1, 0, 1,
-0.5980731, -1.567566, -2.616136, 0.2941177, 1, 0, 1,
-0.5975764, 1.711789, -0.263021, 0.2901961, 1, 0, 1,
-0.5959677, 1.642009, -1.467112, 0.282353, 1, 0, 1,
-0.5945797, 0.08143771, -2.048089, 0.2784314, 1, 0, 1,
-0.5935834, 1.690676, 0.0333636, 0.2705882, 1, 0, 1,
-0.5849446, -0.0470662, 0.2134839, 0.2666667, 1, 0, 1,
-0.5836378, 0.009902753, -1.050454, 0.2588235, 1, 0, 1,
-0.5785322, -0.9981244, -3.216953, 0.254902, 1, 0, 1,
-0.5730094, -0.8864483, -3.956871, 0.2470588, 1, 0, 1,
-0.5692058, 1.195331, -1.02475, 0.2431373, 1, 0, 1,
-0.563814, 0.7012753, -0.1253247, 0.2352941, 1, 0, 1,
-0.5628638, 0.2766361, -0.9519753, 0.2313726, 1, 0, 1,
-0.5562493, 0.3925383, 0.6240478, 0.2235294, 1, 0, 1,
-0.551735, 1.777664, -1.211039, 0.2196078, 1, 0, 1,
-0.5506727, 0.7720445, 1.292753, 0.2117647, 1, 0, 1,
-0.5453275, -0.4411512, -0.9616417, 0.2078431, 1, 0, 1,
-0.5416989, -0.02450827, -2.279215, 0.2, 1, 0, 1,
-0.5398437, 1.025089, 0.2687694, 0.1921569, 1, 0, 1,
-0.5386275, -0.2047889, -1.700905, 0.1882353, 1, 0, 1,
-0.5344415, -0.2000312, -2.459512, 0.1803922, 1, 0, 1,
-0.5328976, -0.1858089, -3.276301, 0.1764706, 1, 0, 1,
-0.5266544, -0.8787779, -3.473732, 0.1686275, 1, 0, 1,
-0.5261608, 0.4671844, -2.608216, 0.1647059, 1, 0, 1,
-0.522972, -0.4523784, -2.370863, 0.1568628, 1, 0, 1,
-0.5176716, 0.03938473, -1.319779, 0.1529412, 1, 0, 1,
-0.5174615, 1.982218, -1.044147, 0.145098, 1, 0, 1,
-0.5174321, -1.410349, -1.708387, 0.1411765, 1, 0, 1,
-0.5163019, -0.2043596, -1.273606, 0.1333333, 1, 0, 1,
-0.5105338, 0.5172439, 0.7346658, 0.1294118, 1, 0, 1,
-0.5078152, -1.794158, -1.71871, 0.1215686, 1, 0, 1,
-0.5029889, -0.5149523, -3.456086, 0.1176471, 1, 0, 1,
-0.5008544, -0.8169972, -1.574706, 0.1098039, 1, 0, 1,
-0.4996226, 2.157231, -0.4686238, 0.1058824, 1, 0, 1,
-0.4949954, 1.155481, -0.6663163, 0.09803922, 1, 0, 1,
-0.492215, -0.04932763, -1.226769, 0.09019608, 1, 0, 1,
-0.4892847, -0.4612511, -2.891675, 0.08627451, 1, 0, 1,
-0.4848042, -0.6817803, -2.683939, 0.07843138, 1, 0, 1,
-0.4844207, -0.5558346, -2.774453, 0.07450981, 1, 0, 1,
-0.4831181, -0.3707989, -1.882374, 0.06666667, 1, 0, 1,
-0.4808965, 0.7587503, -1.011262, 0.0627451, 1, 0, 1,
-0.4761011, 1.130297, -1.904154, 0.05490196, 1, 0, 1,
-0.474551, 0.0187471, -3.171813, 0.05098039, 1, 0, 1,
-0.4687466, 0.8439512, 0.4958023, 0.04313726, 1, 0, 1,
-0.4687317, 0.4214312, -2.405901, 0.03921569, 1, 0, 1,
-0.4674005, -1.017569, -2.568538, 0.03137255, 1, 0, 1,
-0.459558, 0.625037, -1.147568, 0.02745098, 1, 0, 1,
-0.4594109, 1.393241, -1.014545, 0.01960784, 1, 0, 1,
-0.4558445, -1.397707, -1.457106, 0.01568628, 1, 0, 1,
-0.4517294, -0.7550868, -2.818713, 0.007843138, 1, 0, 1,
-0.4509193, -0.2164219, -2.128659, 0.003921569, 1, 0, 1,
-0.4440413, -0.07696529, -2.096735, 0, 1, 0.003921569, 1,
-0.4390863, 0.4804783, -0.4107348, 0, 1, 0.01176471, 1,
-0.4324137, -0.5002075, -0.9981692, 0, 1, 0.01568628, 1,
-0.4306299, -1.661201, -3.449818, 0, 1, 0.02352941, 1,
-0.4283893, 0.3260985, -1.155163, 0, 1, 0.02745098, 1,
-0.4276602, -0.8984927, -0.9870927, 0, 1, 0.03529412, 1,
-0.4262843, 0.2452816, -1.406086, 0, 1, 0.03921569, 1,
-0.4243107, 0.2095873, -1.044354, 0, 1, 0.04705882, 1,
-0.4239779, 0.1731146, -1.340232, 0, 1, 0.05098039, 1,
-0.4230427, 0.1118503, -2.367975, 0, 1, 0.05882353, 1,
-0.4153214, 0.70122, -0.600582, 0, 1, 0.0627451, 1,
-0.4137306, 2.198889, 0.2415746, 0, 1, 0.07058824, 1,
-0.4123476, -1.141095, -5.153447, 0, 1, 0.07450981, 1,
-0.4059764, 2.228177, -0.5322704, 0, 1, 0.08235294, 1,
-0.4020015, -0.3367132, -1.40355, 0, 1, 0.08627451, 1,
-0.4008116, -0.3545442, -1.181195, 0, 1, 0.09411765, 1,
-0.4003249, -0.8574365, -1.239678, 0, 1, 0.1019608, 1,
-0.3946852, 0.3285599, -1.413797, 0, 1, 0.1058824, 1,
-0.3917534, 0.1550163, -1.815837, 0, 1, 0.1137255, 1,
-0.3865015, 1.33135, -0.3526662, 0, 1, 0.1176471, 1,
-0.3862254, -0.5746499, -3.258251, 0, 1, 0.1254902, 1,
-0.3860338, 0.5795435, -0.8489286, 0, 1, 0.1294118, 1,
-0.382394, 1.410041, -0.416381, 0, 1, 0.1372549, 1,
-0.3812052, -0.07985727, -1.23316, 0, 1, 0.1411765, 1,
-0.3752605, 0.9182834, -0.5997304, 0, 1, 0.1490196, 1,
-0.3735754, -0.77273, -1.808375, 0, 1, 0.1529412, 1,
-0.3735466, 0.7921528, -0.005288831, 0, 1, 0.1607843, 1,
-0.3666198, 0.2470982, -0.5854355, 0, 1, 0.1647059, 1,
-0.3630677, -0.9885104, -2.926656, 0, 1, 0.172549, 1,
-0.3609117, -0.1316949, -1.835065, 0, 1, 0.1764706, 1,
-0.3604133, -1.017236, -3.148936, 0, 1, 0.1843137, 1,
-0.3592636, 1.14297, 0.7200004, 0, 1, 0.1882353, 1,
-0.3575737, 0.3351713, -1.589566, 0, 1, 0.1960784, 1,
-0.3534265, -0.9997909, -2.460912, 0, 1, 0.2039216, 1,
-0.3525368, 1.409748, -1.024864, 0, 1, 0.2078431, 1,
-0.351456, 0.08812921, 0.3636751, 0, 1, 0.2156863, 1,
-0.3500605, 1.198815, -0.9116257, 0, 1, 0.2196078, 1,
-0.3499964, 1.071687, -1.114046, 0, 1, 0.227451, 1,
-0.3398334, 1.574113, 0.3916522, 0, 1, 0.2313726, 1,
-0.3387433, 0.2058281, -0.02679692, 0, 1, 0.2392157, 1,
-0.3386004, 1.828853, -1.591147, 0, 1, 0.2431373, 1,
-0.3376487, 0.02680579, -1.56427, 0, 1, 0.2509804, 1,
-0.3366551, 1.034321, 0.6854485, 0, 1, 0.254902, 1,
-0.3365918, -0.7684566, -4.001295, 0, 1, 0.2627451, 1,
-0.3315793, -1.213291, -1.323054, 0, 1, 0.2666667, 1,
-0.3280917, 0.6026958, -0.008420028, 0, 1, 0.2745098, 1,
-0.3276659, -0.3364359, -1.643376, 0, 1, 0.2784314, 1,
-0.3230771, 2.217845, -0.1246482, 0, 1, 0.2862745, 1,
-0.3216563, 0.5971977, -0.04267008, 0, 1, 0.2901961, 1,
-0.3210595, -2.523525, -3.39023, 0, 1, 0.2980392, 1,
-0.3182287, -0.4585555, -2.199544, 0, 1, 0.3058824, 1,
-0.3128481, 0.9843617, -2.190251, 0, 1, 0.3098039, 1,
-0.3117465, 0.4010805, -0.8512933, 0, 1, 0.3176471, 1,
-0.3086446, -0.9611365, -2.863648, 0, 1, 0.3215686, 1,
-0.2986309, 0.5320072, -0.4265134, 0, 1, 0.3294118, 1,
-0.2985105, 1.14968, -1.148901, 0, 1, 0.3333333, 1,
-0.2908929, -2.873656, -4.516951, 0, 1, 0.3411765, 1,
-0.2872496, -0.179157, -3.00689, 0, 1, 0.345098, 1,
-0.2865557, -1.52074, -4.004912, 0, 1, 0.3529412, 1,
-0.2810533, -0.461052, -3.092813, 0, 1, 0.3568628, 1,
-0.2744473, 2.365831, -0.08617777, 0, 1, 0.3647059, 1,
-0.267249, 0.001546553, -1.487974, 0, 1, 0.3686275, 1,
-0.2652431, -0.006737965, -2.511072, 0, 1, 0.3764706, 1,
-0.265206, 1.602507, -1.063032, 0, 1, 0.3803922, 1,
-0.2621349, -0.2824259, -1.490911, 0, 1, 0.3882353, 1,
-0.2554872, 2.198713, -0.7304732, 0, 1, 0.3921569, 1,
-0.2550187, -1.21497, -1.817397, 0, 1, 0.4, 1,
-0.25331, 1.535158, 1.846253, 0, 1, 0.4078431, 1,
-0.2525429, 0.2080368, -0.1351067, 0, 1, 0.4117647, 1,
-0.2519961, 0.9899572, -0.2903541, 0, 1, 0.4196078, 1,
-0.2508285, -0.3405592, -3.55946, 0, 1, 0.4235294, 1,
-0.2485151, -1.236, -3.028206, 0, 1, 0.4313726, 1,
-0.2480318, 0.6796829, -1.688799, 0, 1, 0.4352941, 1,
-0.2440406, 0.8579067, -0.119587, 0, 1, 0.4431373, 1,
-0.2421742, 3.394311, 0.2186857, 0, 1, 0.4470588, 1,
-0.2421251, -0.7613553, -4.146214, 0, 1, 0.454902, 1,
-0.2412688, -0.6383569, -2.997185, 0, 1, 0.4588235, 1,
-0.2387313, 0.4268577, -0.2206376, 0, 1, 0.4666667, 1,
-0.2378205, 0.8796489, -0.1883684, 0, 1, 0.4705882, 1,
-0.2323395, 0.4374959, 0.09233642, 0, 1, 0.4784314, 1,
-0.2322655, 0.6862869, -0.8015982, 0, 1, 0.4823529, 1,
-0.2320178, 0.3947542, 0.007359254, 0, 1, 0.4901961, 1,
-0.2300211, 0.7696288, 0.3475249, 0, 1, 0.4941176, 1,
-0.226853, -0.7913186, -3.637644, 0, 1, 0.5019608, 1,
-0.2224339, -0.1087821, -2.157563, 0, 1, 0.509804, 1,
-0.2216523, -1.898031, -3.840235, 0, 1, 0.5137255, 1,
-0.2185119, -1.323938, -3.63022, 0, 1, 0.5215687, 1,
-0.2179882, 1.922071, 0.3136579, 0, 1, 0.5254902, 1,
-0.2177197, 0.3891893, -1.680848, 0, 1, 0.5333334, 1,
-0.2096236, 0.2131712, -0.4355921, 0, 1, 0.5372549, 1,
-0.2085685, -0.03801373, -4.676837, 0, 1, 0.5450981, 1,
-0.2074731, 0.1894461, 0.3335518, 0, 1, 0.5490196, 1,
-0.2073213, 0.7891918, 0.1196695, 0, 1, 0.5568628, 1,
-0.2072064, 0.05722638, 0.221879, 0, 1, 0.5607843, 1,
-0.2047651, -0.4491683, -1.563453, 0, 1, 0.5686275, 1,
-0.2038231, 0.4264758, -0.09274352, 0, 1, 0.572549, 1,
-0.2024931, -0.6767946, -1.913004, 0, 1, 0.5803922, 1,
-0.20149, -0.1689233, 0.301307, 0, 1, 0.5843138, 1,
-0.2011253, -1.867517, -2.536638, 0, 1, 0.5921569, 1,
-0.2009113, -1.293952, -1.983527, 0, 1, 0.5960785, 1,
-0.1995247, -1.441021, -4.215292, 0, 1, 0.6039216, 1,
-0.1942358, -0.4828794, -2.836394, 0, 1, 0.6117647, 1,
-0.191155, 0.2632524, 0.3772254, 0, 1, 0.6156863, 1,
-0.1830143, -0.391876, -3.266625, 0, 1, 0.6235294, 1,
-0.1809864, 0.7065532, -0.3126378, 0, 1, 0.627451, 1,
-0.1789023, -0.7897934, -3.401203, 0, 1, 0.6352941, 1,
-0.1779472, -0.8985371, -3.841756, 0, 1, 0.6392157, 1,
-0.17314, -0.6888114, -1.184415, 0, 1, 0.6470588, 1,
-0.1699676, 0.2633221, -0.4125406, 0, 1, 0.6509804, 1,
-0.1696399, 0.1621573, -0.4175698, 0, 1, 0.6588235, 1,
-0.1695714, -2.123757, -3.159447, 0, 1, 0.6627451, 1,
-0.1640388, -0.4121929, -3.207135, 0, 1, 0.6705883, 1,
-0.1590104, -1.737566, -2.254554, 0, 1, 0.6745098, 1,
-0.1518379, -0.5453686, -4.842097, 0, 1, 0.682353, 1,
-0.1490413, -2.564009, -3.259586, 0, 1, 0.6862745, 1,
-0.1476, 0.7052069, -0.7376634, 0, 1, 0.6941177, 1,
-0.1473447, -1.3459, -4.309326, 0, 1, 0.7019608, 1,
-0.1455479, 0.8234946, -0.3112967, 0, 1, 0.7058824, 1,
-0.1412202, 0.1312148, -0.2819, 0, 1, 0.7137255, 1,
-0.1383817, 1.41192, -0.5399933, 0, 1, 0.7176471, 1,
-0.1366506, -1.828697, -3.38194, 0, 1, 0.7254902, 1,
-0.1314988, 1.468709, -0.8223112, 0, 1, 0.7294118, 1,
-0.12621, 1.072153, 0.04899526, 0, 1, 0.7372549, 1,
-0.1252381, 1.335346, -0.0202322, 0, 1, 0.7411765, 1,
-0.1174304, 2.200222, -0.5955266, 0, 1, 0.7490196, 1,
-0.1162889, -0.1171911, -3.731762, 0, 1, 0.7529412, 1,
-0.1146576, -0.5217876, -2.750389, 0, 1, 0.7607843, 1,
-0.1130849, -0.4122443, -2.386362, 0, 1, 0.7647059, 1,
-0.1093021, 0.3944187, -0.958212, 0, 1, 0.772549, 1,
-0.1080746, 0.7387828, 0.3728983, 0, 1, 0.7764706, 1,
-0.1050929, -0.02737285, -2.184771, 0, 1, 0.7843137, 1,
-0.09995602, -0.1597341, -1.935374, 0, 1, 0.7882353, 1,
-0.09935286, -0.6963075, -2.109188, 0, 1, 0.7960784, 1,
-0.09482177, -0.194618, -4.621675, 0, 1, 0.8039216, 1,
-0.09237929, -1.58971, -4.639153, 0, 1, 0.8078431, 1,
-0.09041122, 1.068543, -1.562085, 0, 1, 0.8156863, 1,
-0.08920132, -0.115873, -3.251051, 0, 1, 0.8196079, 1,
-0.08857793, 1.035199, -0.6486536, 0, 1, 0.827451, 1,
-0.08706355, 0.3303089, -0.1968095, 0, 1, 0.8313726, 1,
-0.08610278, -1.002366, -2.644575, 0, 1, 0.8392157, 1,
-0.07433097, -0.5458935, -0.9218897, 0, 1, 0.8431373, 1,
-0.06655233, -0.2095248, -4.248535, 0, 1, 0.8509804, 1,
-0.06446534, 0.4059137, 0.1397703, 0, 1, 0.854902, 1,
-0.06024189, -0.3945899, -2.552951, 0, 1, 0.8627451, 1,
-0.06019022, 0.9098199, 0.1592764, 0, 1, 0.8666667, 1,
-0.05315958, 0.7876682, -1.066633, 0, 1, 0.8745098, 1,
-0.05306377, 1.265179, -0.01303375, 0, 1, 0.8784314, 1,
-0.04948246, 2.227865, 0.3960676, 0, 1, 0.8862745, 1,
-0.04945458, -0.3056719, -3.166792, 0, 1, 0.8901961, 1,
-0.04614853, -0.1697649, -2.807055, 0, 1, 0.8980392, 1,
-0.0442227, -0.5188313, -2.224744, 0, 1, 0.9058824, 1,
-0.04389822, -0.8791189, -5.505221, 0, 1, 0.9098039, 1,
-0.0425889, -0.8372609, -3.357768, 0, 1, 0.9176471, 1,
-0.04220753, 0.4623249, -0.1976801, 0, 1, 0.9215686, 1,
-0.03474155, 0.4206415, -0.785741, 0, 1, 0.9294118, 1,
-0.02836665, 1.183031, 0.2038448, 0, 1, 0.9333333, 1,
-0.02319037, -0.5613175, -4.429915, 0, 1, 0.9411765, 1,
-0.02210321, -1.205333, -2.450608, 0, 1, 0.945098, 1,
-0.01718725, -1.223636, -2.418769, 0, 1, 0.9529412, 1,
-0.01420737, 1.525427, 0.3949348, 0, 1, 0.9568627, 1,
-0.01257765, 0.7287982, -0.5772896, 0, 1, 0.9647059, 1,
-0.01104824, 0.8641924, -0.1613095, 0, 1, 0.9686275, 1,
-0.008707734, 1.753493, -0.72103, 0, 1, 0.9764706, 1,
-0.007412818, -1.601565, -2.235773, 0, 1, 0.9803922, 1,
-0.007058941, -1.640281, -3.018476, 0, 1, 0.9882353, 1,
-0.003374834, -1.32697, -4.141348, 0, 1, 0.9921569, 1,
0.0004967448, 0.9734938, 0.2558862, 0, 1, 1, 1,
0.0008165967, -0.1497499, 3.273234, 0, 0.9921569, 1, 1,
0.001282906, 0.8560659, -0.09766506, 0, 0.9882353, 1, 1,
0.008141838, 0.2487327, -0.19917, 0, 0.9803922, 1, 1,
0.009113525, -1.155004, 3.390013, 0, 0.9764706, 1, 1,
0.0134105, 0.6962094, 0.8529165, 0, 0.9686275, 1, 1,
0.01932195, -1.66302, 3.116692, 0, 0.9647059, 1, 1,
0.02370708, 0.2663928, -1.817317, 0, 0.9568627, 1, 1,
0.02592041, -0.5657119, 1.502656, 0, 0.9529412, 1, 1,
0.02788261, -0.3797444, 2.738695, 0, 0.945098, 1, 1,
0.03053858, -0.3767231, 2.260836, 0, 0.9411765, 1, 1,
0.03571641, -2.424876, 3.053721, 0, 0.9333333, 1, 1,
0.03599219, 0.04549119, -1.194945, 0, 0.9294118, 1, 1,
0.044128, -0.0119309, 2.166622, 0, 0.9215686, 1, 1,
0.04592148, -0.6510177, 2.564442, 0, 0.9176471, 1, 1,
0.05255391, 0.5350463, 0.6634927, 0, 0.9098039, 1, 1,
0.0527785, 1.497215, -1.375162, 0, 0.9058824, 1, 1,
0.05985871, 2.224059, -0.5708951, 0, 0.8980392, 1, 1,
0.06185369, -0.2799332, 1.186319, 0, 0.8901961, 1, 1,
0.06520898, -0.5846457, 3.168394, 0, 0.8862745, 1, 1,
0.06590158, -0.1101883, 1.459657, 0, 0.8784314, 1, 1,
0.06662295, -1.141678, 3.918835, 0, 0.8745098, 1, 1,
0.06851206, 1.046911, -0.3336084, 0, 0.8666667, 1, 1,
0.06975482, 1.774581, -1.06625, 0, 0.8627451, 1, 1,
0.07226384, -0.7473548, 1.458686, 0, 0.854902, 1, 1,
0.07325186, -1.024348, 5.234884, 0, 0.8509804, 1, 1,
0.0861291, -0.7413678, 2.204931, 0, 0.8431373, 1, 1,
0.08756942, -0.4173106, 3.03365, 0, 0.8392157, 1, 1,
0.08992232, 0.6674445, 1.328393, 0, 0.8313726, 1, 1,
0.09500833, -1.29203, 4.610939, 0, 0.827451, 1, 1,
0.09862196, -1.015056, 1.979847, 0, 0.8196079, 1, 1,
0.09880225, 0.2824118, 0.615256, 0, 0.8156863, 1, 1,
0.1000865, 0.09757355, 0.8980255, 0, 0.8078431, 1, 1,
0.1011979, 1.144554, -0.4900194, 0, 0.8039216, 1, 1,
0.1029032, 0.5422367, 0.5450016, 0, 0.7960784, 1, 1,
0.1030367, 1.855957, 1.097883, 0, 0.7882353, 1, 1,
0.1051119, 0.4442582, -2.132314, 0, 0.7843137, 1, 1,
0.1051394, -2.970243, 3.296537, 0, 0.7764706, 1, 1,
0.107138, 0.3409345, 0.06207015, 0, 0.772549, 1, 1,
0.1094698, -1.063977, 3.087337, 0, 0.7647059, 1, 1,
0.1103855, -1.378339, 2.909287, 0, 0.7607843, 1, 1,
0.1123578, -0.5827568, 3.04905, 0, 0.7529412, 1, 1,
0.1187606, -0.6686749, 2.845219, 0, 0.7490196, 1, 1,
0.1202822, -1.432977, 2.500997, 0, 0.7411765, 1, 1,
0.1206649, -0.3371824, 4.041563, 0, 0.7372549, 1, 1,
0.1210726, 0.6832831, -0.05529155, 0, 0.7294118, 1, 1,
0.1246747, 0.8175457, 1.422898, 0, 0.7254902, 1, 1,
0.1321042, 0.7157374, -0.2254083, 0, 0.7176471, 1, 1,
0.1332747, 0.7071618, 1.375351, 0, 0.7137255, 1, 1,
0.1333952, -0.6788077, 2.65776, 0, 0.7058824, 1, 1,
0.1376163, 0.9223179, -0.06691549, 0, 0.6980392, 1, 1,
0.1396886, 0.4698002, 0.4080197, 0, 0.6941177, 1, 1,
0.1400903, -0.219173, 2.322542, 0, 0.6862745, 1, 1,
0.1432343, -0.1418959, 1.83439, 0, 0.682353, 1, 1,
0.1498708, -1.106605, 1.965372, 0, 0.6745098, 1, 1,
0.1530939, 0.3974441, -0.997853, 0, 0.6705883, 1, 1,
0.1535076, -0.2257384, 1.656563, 0, 0.6627451, 1, 1,
0.156928, -0.1348403, 0.8007277, 0, 0.6588235, 1, 1,
0.1621885, 0.1724672, 0.6395422, 0, 0.6509804, 1, 1,
0.16247, 0.607261, -1.055715, 0, 0.6470588, 1, 1,
0.1624979, 1.108419, -0.4473385, 0, 0.6392157, 1, 1,
0.1635006, 1.620623, -0.4303946, 0, 0.6352941, 1, 1,
0.1669907, 0.9889301, -0.2928465, 0, 0.627451, 1, 1,
0.1711939, -0.08742223, 3.175385, 0, 0.6235294, 1, 1,
0.1737473, 0.6472631, -0.4039341, 0, 0.6156863, 1, 1,
0.1758547, 0.6167986, 1.966376, 0, 0.6117647, 1, 1,
0.1815822, -0.5725729, 2.239605, 0, 0.6039216, 1, 1,
0.1825589, 0.3256368, 1.753442, 0, 0.5960785, 1, 1,
0.1826259, 0.5709391, -0.4631859, 0, 0.5921569, 1, 1,
0.1842305, 0.5234723, 0.5600088, 0, 0.5843138, 1, 1,
0.1860475, -1.587387, 2.732004, 0, 0.5803922, 1, 1,
0.1864845, -0.1822057, 1.183905, 0, 0.572549, 1, 1,
0.1897533, 0.2068121, 0.4931227, 0, 0.5686275, 1, 1,
0.1902591, 0.6758923, 0.6393234, 0, 0.5607843, 1, 1,
0.2051085, 0.1475235, -0.01343433, 0, 0.5568628, 1, 1,
0.2064275, 1.092506, -0.02776413, 0, 0.5490196, 1, 1,
0.2068756, -1.039794, 2.998437, 0, 0.5450981, 1, 1,
0.2100359, 0.2663401, -0.7108111, 0, 0.5372549, 1, 1,
0.2141932, 1.377369, -1.686123, 0, 0.5333334, 1, 1,
0.2271107, 0.1186314, 0.5952501, 0, 0.5254902, 1, 1,
0.2272055, 1.306108, -0.1182908, 0, 0.5215687, 1, 1,
0.2291966, -0.280382, 2.854699, 0, 0.5137255, 1, 1,
0.2310699, -1.394081, 3.796544, 0, 0.509804, 1, 1,
0.2322057, -0.6891562, 2.734587, 0, 0.5019608, 1, 1,
0.2331266, 0.3573447, 2.470501, 0, 0.4941176, 1, 1,
0.2336299, 1.016258, 1.88123, 0, 0.4901961, 1, 1,
0.2341127, 0.2568413, 0.5217178, 0, 0.4823529, 1, 1,
0.2382748, 0.7417628, -0.19156, 0, 0.4784314, 1, 1,
0.2394027, 0.05118502, 0.7398736, 0, 0.4705882, 1, 1,
0.2395223, 0.195273, 1.571345, 0, 0.4666667, 1, 1,
0.2396093, -0.4440795, 2.464943, 0, 0.4588235, 1, 1,
0.2487705, -0.6369457, 3.259972, 0, 0.454902, 1, 1,
0.2507929, -0.321663, 3.735901, 0, 0.4470588, 1, 1,
0.2518672, 0.307491, -0.4993077, 0, 0.4431373, 1, 1,
0.2533185, -0.742297, 2.122518, 0, 0.4352941, 1, 1,
0.2541754, -1.23496, 1.356707, 0, 0.4313726, 1, 1,
0.2593531, -0.1469131, 4.14553, 0, 0.4235294, 1, 1,
0.2614755, -0.3009104, 4.058681, 0, 0.4196078, 1, 1,
0.2653861, -0.8027689, 1.319742, 0, 0.4117647, 1, 1,
0.2664727, 0.7824638, 0.6745512, 0, 0.4078431, 1, 1,
0.2699253, 0.6964488, 1.874509, 0, 0.4, 1, 1,
0.2716567, -0.04341804, 2.20041, 0, 0.3921569, 1, 1,
0.2761302, 1.446029, 1.58951, 0, 0.3882353, 1, 1,
0.2766251, -1.715742, 2.140363, 0, 0.3803922, 1, 1,
0.2839157, 0.7136022, 0.8481622, 0, 0.3764706, 1, 1,
0.2842534, 2.396731, 1.393322, 0, 0.3686275, 1, 1,
0.2892309, 0.771455, -1.224618, 0, 0.3647059, 1, 1,
0.2914797, -0.05859165, 2.062886, 0, 0.3568628, 1, 1,
0.2922247, -1.677789, 1.255107, 0, 0.3529412, 1, 1,
0.2942791, 0.4199736, 1.902427, 0, 0.345098, 1, 1,
0.2959617, 0.5003861, -1.250095, 0, 0.3411765, 1, 1,
0.2995724, -0.8679579, 2.563194, 0, 0.3333333, 1, 1,
0.3000851, 1.188525, 2.299612, 0, 0.3294118, 1, 1,
0.3011794, 0.1107053, 1.240303, 0, 0.3215686, 1, 1,
0.3075564, 1.447973, -0.8474339, 0, 0.3176471, 1, 1,
0.3099186, -0.9917073, 5.654819, 0, 0.3098039, 1, 1,
0.3117466, -1.021024, 2.821453, 0, 0.3058824, 1, 1,
0.3152415, -0.4445052, 1.189717, 0, 0.2980392, 1, 1,
0.3217921, 0.2890517, -0.1485119, 0, 0.2901961, 1, 1,
0.322955, 0.4708019, 0.3958214, 0, 0.2862745, 1, 1,
0.3259977, 0.4298935, 2.076184, 0, 0.2784314, 1, 1,
0.3273037, -0.8274083, 2.431472, 0, 0.2745098, 1, 1,
0.3299637, -0.7011443, 3.161213, 0, 0.2666667, 1, 1,
0.3327622, -0.5746729, 2.14227, 0, 0.2627451, 1, 1,
0.3333084, -0.7526543, 1.584502, 0, 0.254902, 1, 1,
0.335278, 0.6220875, -0.8801246, 0, 0.2509804, 1, 1,
0.3398416, 0.4181385, 0.6116808, 0, 0.2431373, 1, 1,
0.3400886, -1.630938, 2.046479, 0, 0.2392157, 1, 1,
0.3418523, -0.6021925, 2.055175, 0, 0.2313726, 1, 1,
0.3420799, 0.2319674, 0.660067, 0, 0.227451, 1, 1,
0.3521225, 2.391608, 1.233465, 0, 0.2196078, 1, 1,
0.3522477, -0.6518019, 2.843236, 0, 0.2156863, 1, 1,
0.3526835, 0.3718002, 0.8339995, 0, 0.2078431, 1, 1,
0.3550526, -0.07376812, 1.508298, 0, 0.2039216, 1, 1,
0.3551041, 0.8136104, 0.2870004, 0, 0.1960784, 1, 1,
0.3567764, -0.09256779, 1.200998, 0, 0.1882353, 1, 1,
0.3581738, -1.698812, 2.311863, 0, 0.1843137, 1, 1,
0.3660709, 0.7856469, 0.8112359, 0, 0.1764706, 1, 1,
0.37472, 0.8200304, 1.811017, 0, 0.172549, 1, 1,
0.3771393, -0.7396726, 2.157586, 0, 0.1647059, 1, 1,
0.3780571, 0.9960529, 1.585769, 0, 0.1607843, 1, 1,
0.3786054, -0.835529, 2.227725, 0, 0.1529412, 1, 1,
0.3843123, 0.2839917, 1.647667, 0, 0.1490196, 1, 1,
0.3864864, -0.3526839, 3.899664, 0, 0.1411765, 1, 1,
0.3927155, -0.5803055, 2.447597, 0, 0.1372549, 1, 1,
0.3992973, 1.33591, -0.5593215, 0, 0.1294118, 1, 1,
0.3995463, -0.9353111, 2.544877, 0, 0.1254902, 1, 1,
0.4041788, -1.005918, 3.643077, 0, 0.1176471, 1, 1,
0.4059833, 0.9837139, 0.5591459, 0, 0.1137255, 1, 1,
0.4117904, -0.2405299, 1.098193, 0, 0.1058824, 1, 1,
0.4122757, -0.3959499, 0.4334571, 0, 0.09803922, 1, 1,
0.4143163, 0.2701008, 0.5247653, 0, 0.09411765, 1, 1,
0.4154752, -0.6910096, 1.899453, 0, 0.08627451, 1, 1,
0.4155054, 0.8131071, -0.6718667, 0, 0.08235294, 1, 1,
0.4191193, -0.2501056, 2.281982, 0, 0.07450981, 1, 1,
0.4213826, 0.2650807, 1.139915, 0, 0.07058824, 1, 1,
0.4293979, -1.366435, 3.300897, 0, 0.0627451, 1, 1,
0.4343329, -0.6616454, 1.612027, 0, 0.05882353, 1, 1,
0.4350898, 0.2111468, -2.225265, 0, 0.05098039, 1, 1,
0.4352591, -0.5630414, 5.230231, 0, 0.04705882, 1, 1,
0.4386234, -0.33257, 4.046722, 0, 0.03921569, 1, 1,
0.4471554, -1.048051, 4.251197, 0, 0.03529412, 1, 1,
0.4474485, 0.8545976, 0.5194988, 0, 0.02745098, 1, 1,
0.4541595, -0.9560553, 4.08775, 0, 0.02352941, 1, 1,
0.4576214, 0.4714651, 3.472159, 0, 0.01568628, 1, 1,
0.4589183, 0.4252343, 0.002992388, 0, 0.01176471, 1, 1,
0.4597404, 0.4035243, 1.613836, 0, 0.003921569, 1, 1,
0.4688172, -1.373466, 2.848975, 0.003921569, 0, 1, 1,
0.4725004, -1.56208, 3.421733, 0.007843138, 0, 1, 1,
0.4774286, -1.131242, 2.592726, 0.01568628, 0, 1, 1,
0.484739, 1.970755, 1.789691, 0.01960784, 0, 1, 1,
0.485411, -0.905651, 2.647893, 0.02745098, 0, 1, 1,
0.4892308, -0.07085796, 1.343211, 0.03137255, 0, 1, 1,
0.4965797, 2.669196, -1.956225, 0.03921569, 0, 1, 1,
0.4983563, -2.205205, 3.303224, 0.04313726, 0, 1, 1,
0.5029957, 0.1266283, 0.5701284, 0.05098039, 0, 1, 1,
0.5041853, -0.4747299, 1.882472, 0.05490196, 0, 1, 1,
0.5097809, 0.05073395, 0.897222, 0.0627451, 0, 1, 1,
0.5103794, -0.4758377, 4.005193, 0.06666667, 0, 1, 1,
0.5106884, -1.204713, 2.739729, 0.07450981, 0, 1, 1,
0.510811, -0.8907014, 2.563761, 0.07843138, 0, 1, 1,
0.5130646, 0.2146272, 2.966259, 0.08627451, 0, 1, 1,
0.5223513, 0.5894955, -0.9455689, 0.09019608, 0, 1, 1,
0.5255228, -0.2213937, 2.159873, 0.09803922, 0, 1, 1,
0.5284101, -1.342022, 2.249527, 0.1058824, 0, 1, 1,
0.5358137, -0.1703854, 3.521014, 0.1098039, 0, 1, 1,
0.5386946, -0.621351, 3.429206, 0.1176471, 0, 1, 1,
0.5395523, 0.06437849, 1.6364, 0.1215686, 0, 1, 1,
0.5434902, 0.9237813, 1.198351, 0.1294118, 0, 1, 1,
0.5454025, 1.303637, 1.457949, 0.1333333, 0, 1, 1,
0.5481923, -1.650678, 2.066937, 0.1411765, 0, 1, 1,
0.5522519, -0.6961799, 2.281326, 0.145098, 0, 1, 1,
0.5523171, -1.435705, 3.153442, 0.1529412, 0, 1, 1,
0.5603839, 0.05823594, 2.760614, 0.1568628, 0, 1, 1,
0.561594, -0.0944237, 0.9008017, 0.1647059, 0, 1, 1,
0.5635957, 0.09351667, 0.7935932, 0.1686275, 0, 1, 1,
0.5658657, 0.1819624, 1.149197, 0.1764706, 0, 1, 1,
0.5669933, 0.001639852, 2.925366, 0.1803922, 0, 1, 1,
0.5835682, 0.42497, -0.5885411, 0.1882353, 0, 1, 1,
0.5845265, -1.171031, 3.569626, 0.1921569, 0, 1, 1,
0.5857193, -0.5097647, 3.804312, 0.2, 0, 1, 1,
0.5862647, 0.2900248, 2.32745, 0.2078431, 0, 1, 1,
0.5865931, -0.5297747, 0.7077066, 0.2117647, 0, 1, 1,
0.5896435, -0.464871, 2.604339, 0.2196078, 0, 1, 1,
0.5927199, 1.364363, 1.331181, 0.2235294, 0, 1, 1,
0.5948633, -0.1906788, 2.473207, 0.2313726, 0, 1, 1,
0.602904, -1.628808, 3.644316, 0.2352941, 0, 1, 1,
0.6067334, 1.100807, 1.494607, 0.2431373, 0, 1, 1,
0.608577, 2.12462, 0.5764126, 0.2470588, 0, 1, 1,
0.6093554, -0.4010544, 1.066722, 0.254902, 0, 1, 1,
0.6109973, -0.3450272, 3.556518, 0.2588235, 0, 1, 1,
0.6112353, -1.042679, 2.341504, 0.2666667, 0, 1, 1,
0.6171352, -0.3628772, 3.537093, 0.2705882, 0, 1, 1,
0.6174828, 0.9187031, 1.689579, 0.2784314, 0, 1, 1,
0.6187813, 1.204694, -1.887581, 0.282353, 0, 1, 1,
0.6232061, -0.4512622, -0.1721377, 0.2901961, 0, 1, 1,
0.6259888, -1.222208, 2.730148, 0.2941177, 0, 1, 1,
0.6339546, 0.736846, 0.4667933, 0.3019608, 0, 1, 1,
0.6368365, 1.057617, -0.4970648, 0.3098039, 0, 1, 1,
0.6372068, -0.5985447, 3.81498, 0.3137255, 0, 1, 1,
0.6404267, 0.6420376, 1.70622, 0.3215686, 0, 1, 1,
0.641946, 0.731984, 0.9607521, 0.3254902, 0, 1, 1,
0.6426204, 0.6492671, 0.4406741, 0.3333333, 0, 1, 1,
0.6440554, -0.4069262, 2.991204, 0.3372549, 0, 1, 1,
0.644266, -0.7070166, 1.494428, 0.345098, 0, 1, 1,
0.6470977, -0.07679217, 1.548602, 0.3490196, 0, 1, 1,
0.6475256, 1.298905, 0.4093592, 0.3568628, 0, 1, 1,
0.6528633, 0.09916849, 0.408226, 0.3607843, 0, 1, 1,
0.6548573, 1.788362, 0.8537998, 0.3686275, 0, 1, 1,
0.6550264, -2.023537, 1.831661, 0.372549, 0, 1, 1,
0.6594347, 0.6057407, 0.1841437, 0.3803922, 0, 1, 1,
0.6597645, 2.644505, -1.66009, 0.3843137, 0, 1, 1,
0.6618463, 0.855988, 0.7023835, 0.3921569, 0, 1, 1,
0.6645303, -1.35242, 3.107723, 0.3960784, 0, 1, 1,
0.6654297, 0.6153017, 1.05531, 0.4039216, 0, 1, 1,
0.666349, 0.8933181, 2.147756, 0.4117647, 0, 1, 1,
0.6744421, 0.07757761, 1.26965, 0.4156863, 0, 1, 1,
0.6745878, 0.8546749, 1.097295, 0.4235294, 0, 1, 1,
0.6769406, -0.6982002, 4.23822, 0.427451, 0, 1, 1,
0.679904, -0.7479995, 4.593158, 0.4352941, 0, 1, 1,
0.6840942, -0.8022764, 2.431791, 0.4392157, 0, 1, 1,
0.688737, -0.7140055, 2.755846, 0.4470588, 0, 1, 1,
0.6896802, 0.8190491, 2.840921, 0.4509804, 0, 1, 1,
0.6921483, 0.6510103, 0.5193028, 0.4588235, 0, 1, 1,
0.6923711, 2.222699, -0.2707555, 0.4627451, 0, 1, 1,
0.6928743, -1.334434, 2.623213, 0.4705882, 0, 1, 1,
0.6929945, -1.014727, 2.713474, 0.4745098, 0, 1, 1,
0.697086, 1.103496, 1.242783, 0.4823529, 0, 1, 1,
0.7036284, -0.2636202, 3.603178, 0.4862745, 0, 1, 1,
0.7108875, -0.9980574, 2.585796, 0.4941176, 0, 1, 1,
0.7141185, -0.8070605, 1.754221, 0.5019608, 0, 1, 1,
0.7172732, 0.2828016, 1.048939, 0.5058824, 0, 1, 1,
0.7184601, -1.489579, 2.75292, 0.5137255, 0, 1, 1,
0.7228871, -0.3608321, 1.278262, 0.5176471, 0, 1, 1,
0.7268417, 1.600466, 0.2298325, 0.5254902, 0, 1, 1,
0.7296075, 0.3654265, 0.7618357, 0.5294118, 0, 1, 1,
0.730758, 0.4648697, 0.6528396, 0.5372549, 0, 1, 1,
0.7308148, 0.8475863, 2.75608, 0.5411765, 0, 1, 1,
0.7400693, 0.5879542, 1.581202, 0.5490196, 0, 1, 1,
0.7428026, -0.9481488, 2.450874, 0.5529412, 0, 1, 1,
0.7444838, -0.8469121, 2.040444, 0.5607843, 0, 1, 1,
0.7474105, 1.033858, 1.348934, 0.5647059, 0, 1, 1,
0.7483958, 0.915463, 1.854552, 0.572549, 0, 1, 1,
0.7497615, 0.1930871, 0.8674117, 0.5764706, 0, 1, 1,
0.7536411, -1.111688, 1.973023, 0.5843138, 0, 1, 1,
0.763393, 0.451722, -1.201668, 0.5882353, 0, 1, 1,
0.7653531, -0.5559834, 2.712912, 0.5960785, 0, 1, 1,
0.7681675, -1.184038, 3.253243, 0.6039216, 0, 1, 1,
0.7688406, -0.9929112, 2.700243, 0.6078432, 0, 1, 1,
0.7747872, 0.692259, 1.171669, 0.6156863, 0, 1, 1,
0.7756466, 0.3766224, 2.422928, 0.6196079, 0, 1, 1,
0.7761508, 0.02736799, -0.06659251, 0.627451, 0, 1, 1,
0.7762617, -1.260968, 3.132613, 0.6313726, 0, 1, 1,
0.7777494, 0.6914178, -0.01612212, 0.6392157, 0, 1, 1,
0.7787382, -0.4277489, 3.855568, 0.6431373, 0, 1, 1,
0.7796124, 1.725094, -0.05820202, 0.6509804, 0, 1, 1,
0.7813174, -0.3557965, 3.148085, 0.654902, 0, 1, 1,
0.7817209, 1.388282, 1.875436, 0.6627451, 0, 1, 1,
0.7821795, -0.5070658, 2.175042, 0.6666667, 0, 1, 1,
0.7831391, -0.1229628, 1.085852, 0.6745098, 0, 1, 1,
0.784529, 3.560055, 0.9218368, 0.6784314, 0, 1, 1,
0.7860826, -0.3099917, 1.931725, 0.6862745, 0, 1, 1,
0.7933154, -0.4423396, 2.442656, 0.6901961, 0, 1, 1,
0.8033592, -1.367839, 4.174018, 0.6980392, 0, 1, 1,
0.8053836, 1.079887, 0.8750556, 0.7058824, 0, 1, 1,
0.8086717, 0.1199447, 2.11813, 0.7098039, 0, 1, 1,
0.8170989, -0.9343951, 3.285882, 0.7176471, 0, 1, 1,
0.8179511, 0.1020611, 0.424001, 0.7215686, 0, 1, 1,
0.8181737, -0.434467, 1.542798, 0.7294118, 0, 1, 1,
0.8226526, -1.703202, 0.299738, 0.7333333, 0, 1, 1,
0.8236154, 0.6042623, 0.7416246, 0.7411765, 0, 1, 1,
0.8239095, 0.9904656, -0.5542817, 0.7450981, 0, 1, 1,
0.8239556, -1.101018, 1.236218, 0.7529412, 0, 1, 1,
0.8246076, -0.6827039, 1.936886, 0.7568628, 0, 1, 1,
0.8269839, 1.591641, -0.2910911, 0.7647059, 0, 1, 1,
0.8297628, -1.375034, 4.044406, 0.7686275, 0, 1, 1,
0.8359008, -0.2342872, 0.9275267, 0.7764706, 0, 1, 1,
0.8443988, -2.362225, 1.571318, 0.7803922, 0, 1, 1,
0.853201, 0.5564883, 0.1783335, 0.7882353, 0, 1, 1,
0.8603103, 0.2161304, 1.25345, 0.7921569, 0, 1, 1,
0.8634896, 1.54698, -0.71003, 0.8, 0, 1, 1,
0.8635313, -1.693616, 2.433183, 0.8078431, 0, 1, 1,
0.8645943, -1.629719, 3.174785, 0.8117647, 0, 1, 1,
0.8672124, 0.7227237, 0.5678058, 0.8196079, 0, 1, 1,
0.8680387, -0.1624211, 0.175282, 0.8235294, 0, 1, 1,
0.8688506, 0.3016434, 1.883701, 0.8313726, 0, 1, 1,
0.8712806, -0.9236553, 1.282448, 0.8352941, 0, 1, 1,
0.8747665, -0.4834289, 2.895069, 0.8431373, 0, 1, 1,
0.8776092, -0.6486214, 1.816978, 0.8470588, 0, 1, 1,
0.8792811, 0.8604139, 1.257824, 0.854902, 0, 1, 1,
0.8827755, -0.7590068, 1.453678, 0.8588235, 0, 1, 1,
0.8893046, -1.246426, 1.296648, 0.8666667, 0, 1, 1,
0.8908784, -0.09540545, 0.04389578, 0.8705882, 0, 1, 1,
0.8948135, 0.8920041, 1.287249, 0.8784314, 0, 1, 1,
0.9102473, 0.9558836, 1.838442, 0.8823529, 0, 1, 1,
0.9117095, 0.3678842, 0.7086154, 0.8901961, 0, 1, 1,
0.9128625, -0.8773872, 3.819633, 0.8941177, 0, 1, 1,
0.9156501, -0.8608239, 4.113968, 0.9019608, 0, 1, 1,
0.9222726, -0.9891295, 1.636835, 0.9098039, 0, 1, 1,
0.9295139, 2.436761, 0.7698285, 0.9137255, 0, 1, 1,
0.933441, -0.2055906, 1.305358, 0.9215686, 0, 1, 1,
0.9368137, -1.041119, 3.814202, 0.9254902, 0, 1, 1,
0.9439032, -1.079792, 0.4606058, 0.9333333, 0, 1, 1,
0.9445796, -0.1871611, 0.1078688, 0.9372549, 0, 1, 1,
0.9498702, -0.6566696, 4.291335, 0.945098, 0, 1, 1,
0.950739, -1.187137, 1.740057, 0.9490196, 0, 1, 1,
0.9514218, -0.1785618, 0.8218982, 0.9568627, 0, 1, 1,
0.9534881, -0.4547718, 3.462786, 0.9607843, 0, 1, 1,
0.9539042, -2.411784, 2.116094, 0.9686275, 0, 1, 1,
0.9558238, 0.1625975, 1.220599, 0.972549, 0, 1, 1,
0.9564346, 1.987187, -1.388128, 0.9803922, 0, 1, 1,
0.9582064, 1.798791, -0.6715623, 0.9843137, 0, 1, 1,
0.9718564, 0.2553303, 1.706517, 0.9921569, 0, 1, 1,
0.9723186, -0.2772067, 1.813321, 0.9960784, 0, 1, 1,
0.9746105, 1.288501, 2.774026, 1, 0, 0.9960784, 1,
0.9763474, -0.03649393, 1.463598, 1, 0, 0.9882353, 1,
0.9793427, 1.072277, -0.5124529, 1, 0, 0.9843137, 1,
0.9854349, 0.6851515, 0.8244886, 1, 0, 0.9764706, 1,
0.9877812, -0.6523883, 3.121927, 1, 0, 0.972549, 1,
0.989945, -1.086856, 3.672261, 1, 0, 0.9647059, 1,
0.9905306, 1.616566, 1.339092, 1, 0, 0.9607843, 1,
0.9978208, 0.1558578, 2.203191, 1, 0, 0.9529412, 1,
1.00437, -0.1486471, 1.784689, 1, 0, 0.9490196, 1,
1.008632, -0.375306, 2.303999, 1, 0, 0.9411765, 1,
1.021188, -0.4661578, 1.271818, 1, 0, 0.9372549, 1,
1.021861, -1.98061, 2.703678, 1, 0, 0.9294118, 1,
1.024674, 0.3304928, 1.173336, 1, 0, 0.9254902, 1,
1.026952, -0.02103517, 1.297376, 1, 0, 0.9176471, 1,
1.044493, 0.4810058, -0.01020207, 1, 0, 0.9137255, 1,
1.044621, 0.1429256, 2.015119, 1, 0, 0.9058824, 1,
1.047388, 0.5064452, 1.205206, 1, 0, 0.9019608, 1,
1.050049, 0.3144871, -0.06776426, 1, 0, 0.8941177, 1,
1.050671, 1.127617, 0.7553136, 1, 0, 0.8862745, 1,
1.059634, -0.7051017, 2.821809, 1, 0, 0.8823529, 1,
1.061072, -1.805182, 2.16513, 1, 0, 0.8745098, 1,
1.06937, -0.2634541, 0.8176305, 1, 0, 0.8705882, 1,
1.077846, 1.427101, 1.896663, 1, 0, 0.8627451, 1,
1.081692, -0.569149, 2.455298, 1, 0, 0.8588235, 1,
1.083774, 0.3433716, 1.127108, 1, 0, 0.8509804, 1,
1.086593, 0.8989287, 0.3658132, 1, 0, 0.8470588, 1,
1.093983, 0.5887244, 0.4695, 1, 0, 0.8392157, 1,
1.106894, -0.2851592, 2.286088, 1, 0, 0.8352941, 1,
1.112662, -0.3562663, 0.3142847, 1, 0, 0.827451, 1,
1.121999, -0.03131471, 0.8145946, 1, 0, 0.8235294, 1,
1.128029, -0.0304038, 0.8846106, 1, 0, 0.8156863, 1,
1.130685, 2.280443, 0.5419872, 1, 0, 0.8117647, 1,
1.133948, -0.8634625, 2.664799, 1, 0, 0.8039216, 1,
1.140263, 0.7803124, 1.186998, 1, 0, 0.7960784, 1,
1.146508, 0.6275838, 1.441736, 1, 0, 0.7921569, 1,
1.155057, -0.2577511, 0.5711244, 1, 0, 0.7843137, 1,
1.15613, 1.131532, 0.4209222, 1, 0, 0.7803922, 1,
1.159131, 1.18506, 0.3740226, 1, 0, 0.772549, 1,
1.175135, 1.599603, 0.2716331, 1, 0, 0.7686275, 1,
1.18304, -0.9048442, 1.942916, 1, 0, 0.7607843, 1,
1.188538, -1.293437, 2.370358, 1, 0, 0.7568628, 1,
1.190667, 0.2057057, 0.4604494, 1, 0, 0.7490196, 1,
1.195079, 0.3265965, 1.56034, 1, 0, 0.7450981, 1,
1.200258, -0.7364467, 2.696484, 1, 0, 0.7372549, 1,
1.207771, 0.6926767, -0.134787, 1, 0, 0.7333333, 1,
1.221949, 0.7518293, 1.682878, 1, 0, 0.7254902, 1,
1.232219, -0.5832514, 3.539288, 1, 0, 0.7215686, 1,
1.238228, -0.4391442, -0.1015341, 1, 0, 0.7137255, 1,
1.248941, -0.02514993, 2.063408, 1, 0, 0.7098039, 1,
1.25472, 0.8146812, 2.874461, 1, 0, 0.7019608, 1,
1.257489, -1.860444, 1.803701, 1, 0, 0.6941177, 1,
1.260193, 0.1288694, 1.879108, 1, 0, 0.6901961, 1,
1.267675, -0.7402977, 1.830099, 1, 0, 0.682353, 1,
1.274595, -1.017648, 0.8533338, 1, 0, 0.6784314, 1,
1.2836, 0.3017279, 0.736397, 1, 0, 0.6705883, 1,
1.287249, 2.012681, -1.229059, 1, 0, 0.6666667, 1,
1.289326, 0.07679798, 0.1739885, 1, 0, 0.6588235, 1,
1.29211, 1.089414, -0.9181224, 1, 0, 0.654902, 1,
1.296084, 0.4989798, -0.2395534, 1, 0, 0.6470588, 1,
1.310857, 0.6002874, 3.530928, 1, 0, 0.6431373, 1,
1.311618, 0.6271265, -0.3307868, 1, 0, 0.6352941, 1,
1.319167, -0.8718535, 1.83725, 1, 0, 0.6313726, 1,
1.327252, 0.2784781, 1.19415, 1, 0, 0.6235294, 1,
1.328225, 0.7301651, 0.1000952, 1, 0, 0.6196079, 1,
1.328685, 0.4937622, 0.2929983, 1, 0, 0.6117647, 1,
1.329679, 0.1487969, 2.902512, 1, 0, 0.6078432, 1,
1.332242, 0.2937516, 2.509105, 1, 0, 0.6, 1,
1.342074, 0.1952521, -0.4483719, 1, 0, 0.5921569, 1,
1.346939, -0.6011049, 2.834253, 1, 0, 0.5882353, 1,
1.351886, 0.9631504, 0.8121784, 1, 0, 0.5803922, 1,
1.358381, 0.1498805, 0.2960212, 1, 0, 0.5764706, 1,
1.361567, -0.5889404, 2.420974, 1, 0, 0.5686275, 1,
1.370157, -0.9862733, 1.955647, 1, 0, 0.5647059, 1,
1.37194, 0.8020383, -1.246295, 1, 0, 0.5568628, 1,
1.378307, 1.632366, -2.347553, 1, 0, 0.5529412, 1,
1.405663, 2.645316, -1.010123, 1, 0, 0.5450981, 1,
1.408127, 0.9783623, 1.112549, 1, 0, 0.5411765, 1,
1.418522, -0.1735088, 2.091658, 1, 0, 0.5333334, 1,
1.424388, -0.5111358, 1.605392, 1, 0, 0.5294118, 1,
1.433615, -0.31053, 2.453138, 1, 0, 0.5215687, 1,
1.438617, 0.4489005, -0.09878226, 1, 0, 0.5176471, 1,
1.442604, 2.618626, 0.07767923, 1, 0, 0.509804, 1,
1.443721, -0.4028769, 2.082118, 1, 0, 0.5058824, 1,
1.463074, 0.5011218, 0.6937685, 1, 0, 0.4980392, 1,
1.490385, 0.2569973, 2.463736, 1, 0, 0.4901961, 1,
1.490752, -1.413986, 2.194297, 1, 0, 0.4862745, 1,
1.492258, -1.661763, 2.020036, 1, 0, 0.4784314, 1,
1.497388, -0.6882638, 2.156092, 1, 0, 0.4745098, 1,
1.51638, 0.2400892, -0.1973212, 1, 0, 0.4666667, 1,
1.536773, -0.03077701, 0.6094384, 1, 0, 0.4627451, 1,
1.537178, -0.4706565, 0.9630474, 1, 0, 0.454902, 1,
1.539945, 1.628639, -0.3039508, 1, 0, 0.4509804, 1,
1.539973, 0.9415887, 0.8971469, 1, 0, 0.4431373, 1,
1.544166, 0.1007634, 2.360003, 1, 0, 0.4392157, 1,
1.550401, 1.586197, -0.3230958, 1, 0, 0.4313726, 1,
1.553214, -0.3648554, 2.297271, 1, 0, 0.427451, 1,
1.585742, -1.329703, 1.322676, 1, 0, 0.4196078, 1,
1.605087, 1.669245, 0.6989679, 1, 0, 0.4156863, 1,
1.611145, 0.6439933, 0.5389682, 1, 0, 0.4078431, 1,
1.615627, -0.7169353, 1.654434, 1, 0, 0.4039216, 1,
1.620664, 0.4385704, 2.500845, 1, 0, 0.3960784, 1,
1.622822, 0.3035989, 2.128685, 1, 0, 0.3882353, 1,
1.634361, -0.8893024, 1.66609, 1, 0, 0.3843137, 1,
1.64062, 0.5666409, 1.861693, 1, 0, 0.3764706, 1,
1.640801, -0.03011617, 1.48022, 1, 0, 0.372549, 1,
1.656681, -0.5121755, 3.067518, 1, 0, 0.3647059, 1,
1.670116, -0.1757355, 0.01219036, 1, 0, 0.3607843, 1,
1.684979, 0.818902, 0.443646, 1, 0, 0.3529412, 1,
1.686484, 0.6637077, 0.2957425, 1, 0, 0.3490196, 1,
1.698258, -0.6769454, 2.63704, 1, 0, 0.3411765, 1,
1.711269, 0.7741811, 0.6967895, 1, 0, 0.3372549, 1,
1.715452, -0.7703706, 3.185532, 1, 0, 0.3294118, 1,
1.719992, -1.052109, 1.241819, 1, 0, 0.3254902, 1,
1.722676, -0.5944818, 3.05507, 1, 0, 0.3176471, 1,
1.739561, 2.053977, 0.00623498, 1, 0, 0.3137255, 1,
1.742409, 0.1970981, 4.073002, 1, 0, 0.3058824, 1,
1.74318, -0.404079, 2.155772, 1, 0, 0.2980392, 1,
1.752665, 0.5592718, 2.516417, 1, 0, 0.2941177, 1,
1.768843, -0.5058533, 2.003189, 1, 0, 0.2862745, 1,
1.769233, 1.247187, -0.01428836, 1, 0, 0.282353, 1,
1.772805, -1.80991, 3.72178, 1, 0, 0.2745098, 1,
1.78633, -0.3436594, -0.5244869, 1, 0, 0.2705882, 1,
1.787083, -0.4927447, 1.342308, 1, 0, 0.2627451, 1,
1.799574, -0.06125789, 1.856878, 1, 0, 0.2588235, 1,
1.80675, 1.342231, -0.6122742, 1, 0, 0.2509804, 1,
1.806761, -0.5877879, 0.5520419, 1, 0, 0.2470588, 1,
1.82296, 0.3230691, -0.02953747, 1, 0, 0.2392157, 1,
1.838132, -0.5360088, 3.782109, 1, 0, 0.2352941, 1,
1.897967, -1.398133, 2.956998, 1, 0, 0.227451, 1,
1.898974, 1.100995, -0.06613152, 1, 0, 0.2235294, 1,
1.912217, -0.8617405, 2.198414, 1, 0, 0.2156863, 1,
1.919868, -0.08278227, 0.718195, 1, 0, 0.2117647, 1,
1.960528, 0.562642, 0.2450043, 1, 0, 0.2039216, 1,
1.962508, 2.770255, 0.4480601, 1, 0, 0.1960784, 1,
1.965857, 1.711867, 0.9018307, 1, 0, 0.1921569, 1,
1.971768, -0.1259337, 3.008809, 1, 0, 0.1843137, 1,
2.00572, -1.073796, 2.234992, 1, 0, 0.1803922, 1,
2.017119, -0.6457781, 2.273401, 1, 0, 0.172549, 1,
2.019072, 1.112103, 0.6034874, 1, 0, 0.1686275, 1,
2.021128, -0.8165148, 1.904556, 1, 0, 0.1607843, 1,
2.034565, -0.8226724, 1.519761, 1, 0, 0.1568628, 1,
2.069837, 0.5001504, 3.180539, 1, 0, 0.1490196, 1,
2.083451, -0.2855444, 1.351628, 1, 0, 0.145098, 1,
2.114631, -1.146732, 2.274137, 1, 0, 0.1372549, 1,
2.130584, -0.4299312, 1.02916, 1, 0, 0.1333333, 1,
2.138834, 0.120199, 1.203011, 1, 0, 0.1254902, 1,
2.158258, -0.7688565, 2.489982, 1, 0, 0.1215686, 1,
2.161052, 0.438486, -0.6758636, 1, 0, 0.1137255, 1,
2.177716, -0.1376026, 1.118337, 1, 0, 0.1098039, 1,
2.234719, -0.3566926, 2.16357, 1, 0, 0.1019608, 1,
2.240728, -0.8200656, 2.298921, 1, 0, 0.09411765, 1,
2.247474, 0.6765903, 1.850797, 1, 0, 0.09019608, 1,
2.257802, 1.493951, 0.4137228, 1, 0, 0.08235294, 1,
2.297224, 1.331489, -0.3924709, 1, 0, 0.07843138, 1,
2.454823, -0.5550183, 0.2916916, 1, 0, 0.07058824, 1,
2.459318, -1.156943, 0.7929845, 1, 0, 0.06666667, 1,
2.462432, -0.3463898, -0.2891181, 1, 0, 0.05882353, 1,
2.63511, 0.6903573, 1.228, 1, 0, 0.05490196, 1,
2.638723, 0.7688795, 0.5137343, 1, 0, 0.04705882, 1,
2.67298, 0.1713402, 0.2759129, 1, 0, 0.04313726, 1,
2.743901, 0.2855158, 1.619927, 1, 0, 0.03529412, 1,
2.762035, 0.9904042, 0.7552487, 1, 0, 0.03137255, 1,
2.7726, -0.5779334, 1.644571, 1, 0, 0.02352941, 1,
3.047604, 0.08694433, 1.506339, 1, 0, 0.01960784, 1,
3.295422, 0.591959, 1.86852, 1, 0, 0.01176471, 1,
3.382472, 1.997952, 0.1269315, 1, 0, 0.007843138, 1
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
0.1792576, -4.077128, -7.396848, 0, -0.5, 0.5, 0.5,
0.1792576, -4.077128, -7.396848, 1, -0.5, 0.5, 0.5,
0.1792576, -4.077128, -7.396848, 1, 1.5, 0.5, 0.5,
0.1792576, -4.077128, -7.396848, 0, 1.5, 0.5, 0.5
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
-4.109847, 0.2949063, -7.396848, 0, -0.5, 0.5, 0.5,
-4.109847, 0.2949063, -7.396848, 1, -0.5, 0.5, 0.5,
-4.109847, 0.2949063, -7.396848, 1, 1.5, 0.5, 0.5,
-4.109847, 0.2949063, -7.396848, 0, 1.5, 0.5, 0.5
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
-4.109847, -4.077128, 0.07479882, 0, -0.5, 0.5, 0.5,
-4.109847, -4.077128, 0.07479882, 1, -0.5, 0.5, 0.5,
-4.109847, -4.077128, 0.07479882, 1, 1.5, 0.5, 0.5,
-4.109847, -4.077128, 0.07479882, 0, 1.5, 0.5, 0.5
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
-3, -3.068197, -5.672621,
3, -3.068197, -5.672621,
-3, -3.068197, -5.672621,
-3, -3.236352, -5.959992,
-2, -3.068197, -5.672621,
-2, -3.236352, -5.959992,
-1, -3.068197, -5.672621,
-1, -3.236352, -5.959992,
0, -3.068197, -5.672621,
0, -3.236352, -5.959992,
1, -3.068197, -5.672621,
1, -3.236352, -5.959992,
2, -3.068197, -5.672621,
2, -3.236352, -5.959992,
3, -3.068197, -5.672621,
3, -3.236352, -5.959992
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
-3, -3.572662, -6.534735, 0, -0.5, 0.5, 0.5,
-3, -3.572662, -6.534735, 1, -0.5, 0.5, 0.5,
-3, -3.572662, -6.534735, 1, 1.5, 0.5, 0.5,
-3, -3.572662, -6.534735, 0, 1.5, 0.5, 0.5,
-2, -3.572662, -6.534735, 0, -0.5, 0.5, 0.5,
-2, -3.572662, -6.534735, 1, -0.5, 0.5, 0.5,
-2, -3.572662, -6.534735, 1, 1.5, 0.5, 0.5,
-2, -3.572662, -6.534735, 0, 1.5, 0.5, 0.5,
-1, -3.572662, -6.534735, 0, -0.5, 0.5, 0.5,
-1, -3.572662, -6.534735, 1, -0.5, 0.5, 0.5,
-1, -3.572662, -6.534735, 1, 1.5, 0.5, 0.5,
-1, -3.572662, -6.534735, 0, 1.5, 0.5, 0.5,
0, -3.572662, -6.534735, 0, -0.5, 0.5, 0.5,
0, -3.572662, -6.534735, 1, -0.5, 0.5, 0.5,
0, -3.572662, -6.534735, 1, 1.5, 0.5, 0.5,
0, -3.572662, -6.534735, 0, 1.5, 0.5, 0.5,
1, -3.572662, -6.534735, 0, -0.5, 0.5, 0.5,
1, -3.572662, -6.534735, 1, -0.5, 0.5, 0.5,
1, -3.572662, -6.534735, 1, 1.5, 0.5, 0.5,
1, -3.572662, -6.534735, 0, 1.5, 0.5, 0.5,
2, -3.572662, -6.534735, 0, -0.5, 0.5, 0.5,
2, -3.572662, -6.534735, 1, -0.5, 0.5, 0.5,
2, -3.572662, -6.534735, 1, 1.5, 0.5, 0.5,
2, -3.572662, -6.534735, 0, 1.5, 0.5, 0.5,
3, -3.572662, -6.534735, 0, -0.5, 0.5, 0.5,
3, -3.572662, -6.534735, 1, -0.5, 0.5, 0.5,
3, -3.572662, -6.534735, 1, 1.5, 0.5, 0.5,
3, -3.572662, -6.534735, 0, 1.5, 0.5, 0.5
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
-3.120053, -2, -5.672621,
-3.120053, 3, -5.672621,
-3.120053, -2, -5.672621,
-3.285019, -2, -5.959992,
-3.120053, -1, -5.672621,
-3.285019, -1, -5.959992,
-3.120053, 0, -5.672621,
-3.285019, 0, -5.959992,
-3.120053, 1, -5.672621,
-3.285019, 1, -5.959992,
-3.120053, 2, -5.672621,
-3.285019, 2, -5.959992,
-3.120053, 3, -5.672621,
-3.285019, 3, -5.959992
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
-3.61495, -2, -6.534735, 0, -0.5, 0.5, 0.5,
-3.61495, -2, -6.534735, 1, -0.5, 0.5, 0.5,
-3.61495, -2, -6.534735, 1, 1.5, 0.5, 0.5,
-3.61495, -2, -6.534735, 0, 1.5, 0.5, 0.5,
-3.61495, -1, -6.534735, 0, -0.5, 0.5, 0.5,
-3.61495, -1, -6.534735, 1, -0.5, 0.5, 0.5,
-3.61495, -1, -6.534735, 1, 1.5, 0.5, 0.5,
-3.61495, -1, -6.534735, 0, 1.5, 0.5, 0.5,
-3.61495, 0, -6.534735, 0, -0.5, 0.5, 0.5,
-3.61495, 0, -6.534735, 1, -0.5, 0.5, 0.5,
-3.61495, 0, -6.534735, 1, 1.5, 0.5, 0.5,
-3.61495, 0, -6.534735, 0, 1.5, 0.5, 0.5,
-3.61495, 1, -6.534735, 0, -0.5, 0.5, 0.5,
-3.61495, 1, -6.534735, 1, -0.5, 0.5, 0.5,
-3.61495, 1, -6.534735, 1, 1.5, 0.5, 0.5,
-3.61495, 1, -6.534735, 0, 1.5, 0.5, 0.5,
-3.61495, 2, -6.534735, 0, -0.5, 0.5, 0.5,
-3.61495, 2, -6.534735, 1, -0.5, 0.5, 0.5,
-3.61495, 2, -6.534735, 1, 1.5, 0.5, 0.5,
-3.61495, 2, -6.534735, 0, 1.5, 0.5, 0.5,
-3.61495, 3, -6.534735, 0, -0.5, 0.5, 0.5,
-3.61495, 3, -6.534735, 1, -0.5, 0.5, 0.5,
-3.61495, 3, -6.534735, 1, 1.5, 0.5, 0.5,
-3.61495, 3, -6.534735, 0, 1.5, 0.5, 0.5
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
-3.120053, -3.068197, -4,
-3.120053, -3.068197, 4,
-3.120053, -3.068197, -4,
-3.285019, -3.236352, -4,
-3.120053, -3.068197, -2,
-3.285019, -3.236352, -2,
-3.120053, -3.068197, 0,
-3.285019, -3.236352, 0,
-3.120053, -3.068197, 2,
-3.285019, -3.236352, 2,
-3.120053, -3.068197, 4,
-3.285019, -3.236352, 4
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
-3.61495, -3.572662, -4, 0, -0.5, 0.5, 0.5,
-3.61495, -3.572662, -4, 1, -0.5, 0.5, 0.5,
-3.61495, -3.572662, -4, 1, 1.5, 0.5, 0.5,
-3.61495, -3.572662, -4, 0, 1.5, 0.5, 0.5,
-3.61495, -3.572662, -2, 0, -0.5, 0.5, 0.5,
-3.61495, -3.572662, -2, 1, -0.5, 0.5, 0.5,
-3.61495, -3.572662, -2, 1, 1.5, 0.5, 0.5,
-3.61495, -3.572662, -2, 0, 1.5, 0.5, 0.5,
-3.61495, -3.572662, 0, 0, -0.5, 0.5, 0.5,
-3.61495, -3.572662, 0, 1, -0.5, 0.5, 0.5,
-3.61495, -3.572662, 0, 1, 1.5, 0.5, 0.5,
-3.61495, -3.572662, 0, 0, 1.5, 0.5, 0.5,
-3.61495, -3.572662, 2, 0, -0.5, 0.5, 0.5,
-3.61495, -3.572662, 2, 1, -0.5, 0.5, 0.5,
-3.61495, -3.572662, 2, 1, 1.5, 0.5, 0.5,
-3.61495, -3.572662, 2, 0, 1.5, 0.5, 0.5,
-3.61495, -3.572662, 4, 0, -0.5, 0.5, 0.5,
-3.61495, -3.572662, 4, 1, -0.5, 0.5, 0.5,
-3.61495, -3.572662, 4, 1, 1.5, 0.5, 0.5,
-3.61495, -3.572662, 4, 0, 1.5, 0.5, 0.5
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
-3.120053, -3.068197, -5.672621,
-3.120053, 3.65801, -5.672621,
-3.120053, -3.068197, 5.822219,
-3.120053, 3.65801, 5.822219,
-3.120053, -3.068197, -5.672621,
-3.120053, -3.068197, 5.822219,
-3.120053, 3.65801, -5.672621,
-3.120053, 3.65801, 5.822219,
-3.120053, -3.068197, -5.672621,
3.478569, -3.068197, -5.672621,
-3.120053, -3.068197, 5.822219,
3.478569, -3.068197, 5.822219,
-3.120053, 3.65801, -5.672621,
3.478569, 3.65801, -5.672621,
-3.120053, 3.65801, 5.822219,
3.478569, 3.65801, 5.822219,
3.478569, -3.068197, -5.672621,
3.478569, 3.65801, -5.672621,
3.478569, -3.068197, 5.822219,
3.478569, 3.65801, 5.822219,
3.478569, -3.068197, -5.672621,
3.478569, -3.068197, 5.822219,
3.478569, 3.65801, -5.672621,
3.478569, 3.65801, 5.822219
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
var radius = 7.936666;
var distance = 35.31112;
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
mvMatrix.translate( -0.1792576, -0.2949063, -0.07479882 );
mvMatrix.scale( 1.300465, 1.275798, 0.746533 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.31112);
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
Morpholine<-read.table("Morpholine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Morpholine$V2
```

```
## Error in eval(expr, envir, enclos): object 'Morpholine' not found
```

```r
y<-Morpholine$V3
```

```
## Error in eval(expr, envir, enclos): object 'Morpholine' not found
```

```r
z<-Morpholine$V4
```

```
## Error in eval(expr, envir, enclos): object 'Morpholine' not found
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
-3.023957, 0.7994156, -1.824889, 0, 0, 1, 1, 1,
-2.774402, -0.1229698, 0.08448569, 1, 0, 0, 1, 1,
-2.662615, -0.9477686, -0.8898335, 1, 0, 0, 1, 1,
-2.595617, -0.05407456, -3.464135, 1, 0, 0, 1, 1,
-2.458478, -1.049099, -1.890777, 1, 0, 0, 1, 1,
-2.453241, 1.087531, -0.2949023, 1, 0, 0, 1, 1,
-2.414577, -0.5172295, -2.451859, 0, 0, 0, 1, 1,
-2.390239, 0.9725527, -1.746423, 0, 0, 0, 1, 1,
-2.362406, -1.825664, -0.8491689, 0, 0, 0, 1, 1,
-2.31608, -1.076481, -2.136446, 0, 0, 0, 1, 1,
-2.289491, -2.771027, -2.543229, 0, 0, 0, 1, 1,
-2.221798, 2.209743, -0.3834856, 0, 0, 0, 1, 1,
-2.19866, 0.537037, 0.04066773, 0, 0, 0, 1, 1,
-2.176357, 0.158472, -1.132359, 1, 1, 1, 1, 1,
-2.140938, 0.5560262, -2.526195, 1, 1, 1, 1, 1,
-2.124536, 0.3987902, -0.4313737, 1, 1, 1, 1, 1,
-2.12261, 0.7888218, 0.1635686, 1, 1, 1, 1, 1,
-2.103513, -0.7553231, -3.475686, 1, 1, 1, 1, 1,
-2.046837, 0.3224408, -2.165485, 1, 1, 1, 1, 1,
-2.035819, -0.5486771, -0.7466483, 1, 1, 1, 1, 1,
-2.034942, -0.1837377, -3.218427, 1, 1, 1, 1, 1,
-1.935735, -0.5528163, -3.860363, 1, 1, 1, 1, 1,
-1.934659, -0.2885407, -2.964132, 1, 1, 1, 1, 1,
-1.930048, 1.463216, -0.6026326, 1, 1, 1, 1, 1,
-1.927636, 0.289464, -0.2998758, 1, 1, 1, 1, 1,
-1.912864, 0.1723042, -1.668548, 1, 1, 1, 1, 1,
-1.909931, -0.5245301, -4.447663, 1, 1, 1, 1, 1,
-1.905158, -0.2028661, -2.649109, 1, 1, 1, 1, 1,
-1.882894, -0.02258035, -1.564356, 0, 0, 1, 1, 1,
-1.878065, 0.7057474, -2.454816, 1, 0, 0, 1, 1,
-1.870414, -0.460326, -1.660913, 1, 0, 0, 1, 1,
-1.856099, 0.08227655, -1.270068, 1, 0, 0, 1, 1,
-1.833512, -1.631851, -2.592344, 1, 0, 0, 1, 1,
-1.82811, 0.2406918, 0.05732233, 1, 0, 0, 1, 1,
-1.825256, 0.904157, -1.871387, 0, 0, 0, 1, 1,
-1.824372, -0.5240008, -1.451271, 0, 0, 0, 1, 1,
-1.814728, 1.49638, -1.316873, 0, 0, 0, 1, 1,
-1.783133, -0.4220219, -1.459662, 0, 0, 0, 1, 1,
-1.776933, -0.9098125, -2.101295, 0, 0, 0, 1, 1,
-1.761922, -0.4428335, -2.167274, 0, 0, 0, 1, 1,
-1.743784, 1.183265, -2.484437, 0, 0, 0, 1, 1,
-1.741728, 0.4608414, -2.534637, 1, 1, 1, 1, 1,
-1.738149, -0.479293, -1.610607, 1, 1, 1, 1, 1,
-1.71801, -0.1545268, -2.802853, 1, 1, 1, 1, 1,
-1.694096, -0.9499818, -3.247555, 1, 1, 1, 1, 1,
-1.683034, -1.102843, -2.453716, 1, 1, 1, 1, 1,
-1.667967, -1.329051, -1.887315, 1, 1, 1, 1, 1,
-1.664552, 0.1458912, -0.9031668, 1, 1, 1, 1, 1,
-1.620936, 0.1686588, -2.025487, 1, 1, 1, 1, 1,
-1.609156, 1.137193, -2.547759, 1, 1, 1, 1, 1,
-1.604818, 0.9310918, -0.2528011, 1, 1, 1, 1, 1,
-1.602828, 0.03764659, -0.2526848, 1, 1, 1, 1, 1,
-1.602675, -1.52733, -2.126811, 1, 1, 1, 1, 1,
-1.596058, 0.4014877, -0.7900673, 1, 1, 1, 1, 1,
-1.590167, -0.8285093, -2.751028, 1, 1, 1, 1, 1,
-1.585848, -1.211422, -4.17416, 1, 1, 1, 1, 1,
-1.585152, 0.8061876, -1.55348, 0, 0, 1, 1, 1,
-1.565461, -1.322558, -1.859825, 1, 0, 0, 1, 1,
-1.553003, 0.4362467, 0.1647672, 1, 0, 0, 1, 1,
-1.551305, 0.5570527, -1.94246, 1, 0, 0, 1, 1,
-1.524065, 0.7075446, -2.076146, 1, 0, 0, 1, 1,
-1.519196, 0.5184106, -0.05284449, 1, 0, 0, 1, 1,
-1.516152, -1.139363, -1.930511, 0, 0, 0, 1, 1,
-1.51371, 0.2795174, -3.508811, 0, 0, 0, 1, 1,
-1.50279, -1.947882, -0.7828029, 0, 0, 0, 1, 1,
-1.497488, 1.311732, -1.165617, 0, 0, 0, 1, 1,
-1.481065, 0.2035838, 0.8056048, 0, 0, 0, 1, 1,
-1.479602, 1.120364, -3.062175, 0, 0, 0, 1, 1,
-1.470052, 0.9573671, 0.02810796, 0, 0, 0, 1, 1,
-1.46971, 0.06218967, -1.374585, 1, 1, 1, 1, 1,
-1.46218, -0.09839106, -1.662023, 1, 1, 1, 1, 1,
-1.451898, -0.1443073, -1.72541, 1, 1, 1, 1, 1,
-1.442923, -0.216567, -1.986115, 1, 1, 1, 1, 1,
-1.439831, 1.5462, -0.4636967, 1, 1, 1, 1, 1,
-1.436297, -0.09093893, -2.645535, 1, 1, 1, 1, 1,
-1.433169, -2.552182, -4.29367, 1, 1, 1, 1, 1,
-1.426861, -0.7037193, -1.488256, 1, 1, 1, 1, 1,
-1.426777, 0.2760923, -0.2447015, 1, 1, 1, 1, 1,
-1.418404, 2.363187, -1.477283, 1, 1, 1, 1, 1,
-1.416133, 1.561545, -0.8705757, 1, 1, 1, 1, 1,
-1.415625, 0.6967396, -0.7647358, 1, 1, 1, 1, 1,
-1.413444, -0.04770484, -1.546023, 1, 1, 1, 1, 1,
-1.411299, -0.9256904, -4.107735, 1, 1, 1, 1, 1,
-1.401419, 0.755917, -2.263587, 1, 1, 1, 1, 1,
-1.401199, -1.177894, -3.694344, 0, 0, 1, 1, 1,
-1.386769, -0.06067984, -2.790875, 1, 0, 0, 1, 1,
-1.384425, 0.1017956, -2.278493, 1, 0, 0, 1, 1,
-1.359597, 0.2966956, -1.994745, 1, 0, 0, 1, 1,
-1.358694, 0.5989649, -2.469502, 1, 0, 0, 1, 1,
-1.358252, 0.2406544, 0.2645164, 1, 0, 0, 1, 1,
-1.350132, -1.607541, -2.526204, 0, 0, 0, 1, 1,
-1.34056, -0.50262, -0.566072, 0, 0, 0, 1, 1,
-1.328906, 0.3033589, -1.455391, 0, 0, 0, 1, 1,
-1.325902, 0.3313913, -0.5709653, 0, 0, 0, 1, 1,
-1.324832, -1.512074, -1.166612, 0, 0, 0, 1, 1,
-1.32311, 0.8419068, -1.202324, 0, 0, 0, 1, 1,
-1.315345, 0.7730253, -0.3428448, 0, 0, 0, 1, 1,
-1.309457, 0.7531037, 0.1336415, 1, 1, 1, 1, 1,
-1.309068, -0.3525381, -1.42074, 1, 1, 1, 1, 1,
-1.297337, 1.026284, -0.1656996, 1, 1, 1, 1, 1,
-1.291316, -0.1137651, -2.31537, 1, 1, 1, 1, 1,
-1.285559, -0.01929054, -1.871049, 1, 1, 1, 1, 1,
-1.272667, 0.0470477, -2.349596, 1, 1, 1, 1, 1,
-1.250242, -0.785619, -1.155914, 1, 1, 1, 1, 1,
-1.247079, 1.273616, 1.293775, 1, 1, 1, 1, 1,
-1.244618, -0.2746666, -3.272256, 1, 1, 1, 1, 1,
-1.243447, 0.8633686, 2.833706, 1, 1, 1, 1, 1,
-1.241763, 1.03542, -1.858504, 1, 1, 1, 1, 1,
-1.237208, 1.849473, -0.01931416, 1, 1, 1, 1, 1,
-1.227965, -1.795412, -2.937486, 1, 1, 1, 1, 1,
-1.216947, -1.599853, -1.717348, 1, 1, 1, 1, 1,
-1.212754, 0.4484614, -0.08287957, 1, 1, 1, 1, 1,
-1.200512, -0.003761522, -2.198871, 0, 0, 1, 1, 1,
-1.199518, 1.225835, 0.1055868, 1, 0, 0, 1, 1,
-1.197481, 1.388317, -2.394984, 1, 0, 0, 1, 1,
-1.196928, -0.03769524, -1.048578, 1, 0, 0, 1, 1,
-1.188172, 1.580812, -0.3223031, 1, 0, 0, 1, 1,
-1.18107, 0.8573542, 0.142289, 1, 0, 0, 1, 1,
-1.180839, 0.1961825, -2.389789, 0, 0, 0, 1, 1,
-1.178524, 0.616066, -0.7002106, 0, 0, 0, 1, 1,
-1.17784, 0.5705098, -1.046144, 0, 0, 0, 1, 1,
-1.170684, 0.750273, -1.834515, 0, 0, 0, 1, 1,
-1.159064, -1.250735, -0.9573804, 0, 0, 0, 1, 1,
-1.156484, -0.2368007, -0.2600189, 0, 0, 0, 1, 1,
-1.136458, 0.01554223, -2.737521, 0, 0, 0, 1, 1,
-1.130898, 0.4175423, -0.8133427, 1, 1, 1, 1, 1,
-1.129113, 1.065449, -1.296486, 1, 1, 1, 1, 1,
-1.12679, 0.4984023, 0.5737628, 1, 1, 1, 1, 1,
-1.109745, -0.02168251, -1.58448, 1, 1, 1, 1, 1,
-1.105952, 2.030304, 1.482146, 1, 1, 1, 1, 1,
-1.105544, -1.636048, -3.577491, 1, 1, 1, 1, 1,
-1.104775, 0.9430246, -1.294511, 1, 1, 1, 1, 1,
-1.103751, 0.5662194, -0.04408196, 1, 1, 1, 1, 1,
-1.103259, 0.5907313, -0.1106952, 1, 1, 1, 1, 1,
-1.102719, 1.165952, -0.01612444, 1, 1, 1, 1, 1,
-1.102131, -0.9613991, -2.338265, 1, 1, 1, 1, 1,
-1.094995, -0.2381021, 0.02930092, 1, 1, 1, 1, 1,
-1.076882, 2.678276, -1.542975, 1, 1, 1, 1, 1,
-1.076861, -0.5153992, -2.186657, 1, 1, 1, 1, 1,
-1.07298, 0.7742001, 1.761923, 1, 1, 1, 1, 1,
-1.066293, 0.1424773, -1.816366, 0, 0, 1, 1, 1,
-1.064072, 2.635473, -0.3791866, 1, 0, 0, 1, 1,
-1.063248, -0.5823579, -1.785839, 1, 0, 0, 1, 1,
-1.062109, 0.5949374, -0.1654458, 1, 0, 0, 1, 1,
-1.057277, 0.5513119, -1.202892, 1, 0, 0, 1, 1,
-1.055338, -0.7855528, -3.563324, 1, 0, 0, 1, 1,
-1.053562, -0.3065121, -1.728421, 0, 0, 0, 1, 1,
-1.048995, -0.4343469, -1.516552, 0, 0, 0, 1, 1,
-1.043795, -1.166782, -3.963387, 0, 0, 0, 1, 1,
-1.038915, -2.683973, -2.477273, 0, 0, 0, 1, 1,
-1.038562, -1.416305, -2.743788, 0, 0, 0, 1, 1,
-1.038121, -0.2932553, -0.8106872, 0, 0, 0, 1, 1,
-1.034458, -0.4644245, -2.928932, 0, 0, 0, 1, 1,
-1.034013, -0.3956253, -0.382877, 1, 1, 1, 1, 1,
-1.031087, 0.2594027, -2.781153, 1, 1, 1, 1, 1,
-1.023133, 0.4590943, -2.391308, 1, 1, 1, 1, 1,
-1.02223, 0.1608178, 0.10861, 1, 1, 1, 1, 1,
-1.015225, 0.7823643, 0.6314037, 1, 1, 1, 1, 1,
-1.013476, -0.4098109, -0.2252169, 1, 1, 1, 1, 1,
-1.01191, -1.831869, -1.748412, 1, 1, 1, 1, 1,
-0.998473, 1.20679, 0.3206599, 1, 1, 1, 1, 1,
-0.9940801, -0.2840272, -0.1779357, 1, 1, 1, 1, 1,
-0.991564, 1.036678, -1.550783, 1, 1, 1, 1, 1,
-0.987324, 1.72016, -0.4642148, 1, 1, 1, 1, 1,
-0.9852338, 1.246472, 0.1999822, 1, 1, 1, 1, 1,
-0.9812824, 1.230139, -1.723063, 1, 1, 1, 1, 1,
-0.9780348, 0.3889768, -0.7545998, 1, 1, 1, 1, 1,
-0.9708967, 0.8039221, -0.5560246, 1, 1, 1, 1, 1,
-0.9624076, 1.358241, -0.2524822, 0, 0, 1, 1, 1,
-0.9594318, -1.26692, -1.936799, 1, 0, 0, 1, 1,
-0.9585121, 0.9347439, -1.986061, 1, 0, 0, 1, 1,
-0.9583846, -0.7474514, -1.610865, 1, 0, 0, 1, 1,
-0.9536751, 0.07643311, -3.117123, 1, 0, 0, 1, 1,
-0.9526375, -0.421749, -2.356466, 1, 0, 0, 1, 1,
-0.9458885, 0.02665698, -1.818086, 0, 0, 0, 1, 1,
-0.9387349, 0.04317487, -1.496171, 0, 0, 0, 1, 1,
-0.9379688, -0.2800213, -1.041164, 0, 0, 0, 1, 1,
-0.918837, -0.08715476, -2.006464, 0, 0, 0, 1, 1,
-0.91386, -0.06118738, -2.555954, 0, 0, 0, 1, 1,
-0.9131364, -0.453566, -0.4871891, 0, 0, 0, 1, 1,
-0.912389, 1.117389, 0.0889366, 0, 0, 0, 1, 1,
-0.9113901, 0.5115134, -1.612971, 1, 1, 1, 1, 1,
-0.9103494, 0.2957324, 0.1448887, 1, 1, 1, 1, 1,
-0.9102979, -0.1521049, -3.192637, 1, 1, 1, 1, 1,
-0.9029937, -0.4880645, -2.200232, 1, 1, 1, 1, 1,
-0.8905344, 0.2581389, -2.182963, 1, 1, 1, 1, 1,
-0.8824757, 0.3809318, -1.01804, 1, 1, 1, 1, 1,
-0.8783104, 0.943688, 1.296524, 1, 1, 1, 1, 1,
-0.8716361, -0.1375316, -1.120499, 1, 1, 1, 1, 1,
-0.8710665, -0.9465784, -1.934313, 1, 1, 1, 1, 1,
-0.8668067, 1.345648, -0.2928312, 1, 1, 1, 1, 1,
-0.8651679, -0.5192419, -1.465745, 1, 1, 1, 1, 1,
-0.865056, -1.694864, -2.297763, 1, 1, 1, 1, 1,
-0.8641058, 1.679947, -1.181925, 1, 1, 1, 1, 1,
-0.8616961, 0.09740607, -0.4302008, 1, 1, 1, 1, 1,
-0.8578583, -0.5385134, -1.579532, 1, 1, 1, 1, 1,
-0.8537419, 0.760985, -0.2594902, 0, 0, 1, 1, 1,
-0.844253, 0.8310801, -1.440849, 1, 0, 0, 1, 1,
-0.8440734, 0.6172062, 0.3997824, 1, 0, 0, 1, 1,
-0.8409635, 1.071447, -2.558548, 1, 0, 0, 1, 1,
-0.8405044, -1.765344, -1.577246, 1, 0, 0, 1, 1,
-0.829614, -1.459092, -1.367441, 1, 0, 0, 1, 1,
-0.8243304, 0.9557428, 0.03541989, 0, 0, 0, 1, 1,
-0.8212544, -1.581542, -3.376065, 0, 0, 0, 1, 1,
-0.8173764, 0.6667234, -1.001282, 0, 0, 0, 1, 1,
-0.811935, -0.5992672, -2.059543, 0, 0, 0, 1, 1,
-0.8054693, 0.5403258, 0.3292755, 0, 0, 0, 1, 1,
-0.8045732, 0.3478577, -0.4927632, 0, 0, 0, 1, 1,
-0.8043365, 0.1472789, -2.653688, 0, 0, 0, 1, 1,
-0.8026602, -2.37271, -2.607179, 1, 1, 1, 1, 1,
-0.79426, 0.6585417, -0.7474006, 1, 1, 1, 1, 1,
-0.7924142, -0.5461554, -2.834318, 1, 1, 1, 1, 1,
-0.792103, -0.9066582, -3.760998, 1, 1, 1, 1, 1,
-0.7840641, -0.2425226, -4.618534, 1, 1, 1, 1, 1,
-0.7814546, 1.297487, -2.02224, 1, 1, 1, 1, 1,
-0.7811413, 0.6581414, 0.2626734, 1, 1, 1, 1, 1,
-0.7808956, -0.3425678, -1.576135, 1, 1, 1, 1, 1,
-0.7709442, 0.3733701, -2.242363, 1, 1, 1, 1, 1,
-0.7683507, 0.311866, 0.2911683, 1, 1, 1, 1, 1,
-0.7624094, -1.402533, -3.213478, 1, 1, 1, 1, 1,
-0.7582223, -0.5004379, -2.959535, 1, 1, 1, 1, 1,
-0.7515114, -0.5450565, -0.8690182, 1, 1, 1, 1, 1,
-0.7469875, 0.6014467, 0.3608482, 1, 1, 1, 1, 1,
-0.746115, 0.2262999, -0.6387443, 1, 1, 1, 1, 1,
-0.7439821, 0.04624175, -2.036387, 0, 0, 1, 1, 1,
-0.7403594, 0.8476776, -0.5725394, 1, 0, 0, 1, 1,
-0.736057, -0.7507132, -1.390621, 1, 0, 0, 1, 1,
-0.7355992, 0.2037174, -0.1156363, 1, 0, 0, 1, 1,
-0.7347835, -0.2086226, -1.109606, 1, 0, 0, 1, 1,
-0.7282558, 0.1754413, -1.856536, 1, 0, 0, 1, 1,
-0.7256998, 1.192756, -0.2782544, 0, 0, 0, 1, 1,
-0.719669, 1.88439, -0.1162104, 0, 0, 0, 1, 1,
-0.7163728, -0.5193501, -0.04856175, 0, 0, 0, 1, 1,
-0.709343, 1.773658, -0.1529866, 0, 0, 0, 1, 1,
-0.7048071, 0.09914181, -2.475165, 0, 0, 0, 1, 1,
-0.7022075, -0.2120103, -0.365071, 0, 0, 0, 1, 1,
-0.7019655, -0.05079367, -0.8562357, 0, 0, 0, 1, 1,
-0.6977677, 0.709102, -2.695519, 1, 1, 1, 1, 1,
-0.6967501, -0.2433539, -1.822258, 1, 1, 1, 1, 1,
-0.6944463, -0.4543663, -1.997583, 1, 1, 1, 1, 1,
-0.6903111, -2.015134, -2.893339, 1, 1, 1, 1, 1,
-0.6885215, 0.4256436, -0.808273, 1, 1, 1, 1, 1,
-0.6872252, 0.1483796, -0.187866, 1, 1, 1, 1, 1,
-0.6855654, 0.1172206, -2.054928, 1, 1, 1, 1, 1,
-0.6846339, 1.232406, -2.629133, 1, 1, 1, 1, 1,
-0.6840569, 0.2103887, -2.071221, 1, 1, 1, 1, 1,
-0.6828756, 0.5209952, -0.1427821, 1, 1, 1, 1, 1,
-0.6803811, -0.5607032, -1.902293, 1, 1, 1, 1, 1,
-0.6775263, 0.2755885, -1.881728, 1, 1, 1, 1, 1,
-0.669979, -0.5625107, -3.081916, 1, 1, 1, 1, 1,
-0.6687772, 0.7538382, -2.436885, 1, 1, 1, 1, 1,
-0.6663249, 0.5333115, -0.1963082, 1, 1, 1, 1, 1,
-0.6660787, 0.16534, -0.3573979, 0, 0, 1, 1, 1,
-0.6634369, 0.2503173, -1.200232, 1, 0, 0, 1, 1,
-0.6558698, 0.8995385, 0.1076651, 1, 0, 0, 1, 1,
-0.6543075, -2.090756, -3.609371, 1, 0, 0, 1, 1,
-0.6542614, 0.7145665, 0.415047, 1, 0, 0, 1, 1,
-0.6510106, 0.872004, -0.5219637, 1, 0, 0, 1, 1,
-0.6497285, 1.712874, 1.084823, 0, 0, 0, 1, 1,
-0.6472318, -0.4652835, -1.264999, 0, 0, 0, 1, 1,
-0.6469598, 0.6130918, 1.161104, 0, 0, 0, 1, 1,
-0.6468521, -0.3032318, -2.332299, 0, 0, 0, 1, 1,
-0.6429035, -0.4056867, -1.578854, 0, 0, 0, 1, 1,
-0.6415648, -0.4246047, -1.560479, 0, 0, 0, 1, 1,
-0.6403889, -1.145774, -2.705216, 0, 0, 0, 1, 1,
-0.6379023, 1.158618, 0.2849372, 1, 1, 1, 1, 1,
-0.636956, -0.6659147, -2.779911, 1, 1, 1, 1, 1,
-0.6362073, 0.1387146, -2.385836, 1, 1, 1, 1, 1,
-0.6341258, 0.8059338, -0.9793957, 1, 1, 1, 1, 1,
-0.6264647, -0.7207627, -2.115191, 1, 1, 1, 1, 1,
-0.6232908, 1.145238, -0.2852115, 1, 1, 1, 1, 1,
-0.6204645, -0.2861185, -2.19685, 1, 1, 1, 1, 1,
-0.6162143, 1.284109, 1.549492, 1, 1, 1, 1, 1,
-0.61216, -0.4996328, -1.982889, 1, 1, 1, 1, 1,
-0.6119488, 0.03026379, -2.945208, 1, 1, 1, 1, 1,
-0.6115889, -0.0584115, -2.456909, 1, 1, 1, 1, 1,
-0.6107383, -0.321875, -1.260389, 1, 1, 1, 1, 1,
-0.610011, -0.9232678, -1.624357, 1, 1, 1, 1, 1,
-0.6087803, 0.5330839, -0.5660404, 1, 1, 1, 1, 1,
-0.6086113, -0.548728, -1.504666, 1, 1, 1, 1, 1,
-0.6080565, 1.038735, -1.101205, 0, 0, 1, 1, 1,
-0.603202, 1.536249, -0.5928, 1, 0, 0, 1, 1,
-0.6000467, -1.358481, -2.387491, 1, 0, 0, 1, 1,
-0.5982743, -1.926067, -4.388033, 1, 0, 0, 1, 1,
-0.5980731, -1.567566, -2.616136, 1, 0, 0, 1, 1,
-0.5975764, 1.711789, -0.263021, 1, 0, 0, 1, 1,
-0.5959677, 1.642009, -1.467112, 0, 0, 0, 1, 1,
-0.5945797, 0.08143771, -2.048089, 0, 0, 0, 1, 1,
-0.5935834, 1.690676, 0.0333636, 0, 0, 0, 1, 1,
-0.5849446, -0.0470662, 0.2134839, 0, 0, 0, 1, 1,
-0.5836378, 0.009902753, -1.050454, 0, 0, 0, 1, 1,
-0.5785322, -0.9981244, -3.216953, 0, 0, 0, 1, 1,
-0.5730094, -0.8864483, -3.956871, 0, 0, 0, 1, 1,
-0.5692058, 1.195331, -1.02475, 1, 1, 1, 1, 1,
-0.563814, 0.7012753, -0.1253247, 1, 1, 1, 1, 1,
-0.5628638, 0.2766361, -0.9519753, 1, 1, 1, 1, 1,
-0.5562493, 0.3925383, 0.6240478, 1, 1, 1, 1, 1,
-0.551735, 1.777664, -1.211039, 1, 1, 1, 1, 1,
-0.5506727, 0.7720445, 1.292753, 1, 1, 1, 1, 1,
-0.5453275, -0.4411512, -0.9616417, 1, 1, 1, 1, 1,
-0.5416989, -0.02450827, -2.279215, 1, 1, 1, 1, 1,
-0.5398437, 1.025089, 0.2687694, 1, 1, 1, 1, 1,
-0.5386275, -0.2047889, -1.700905, 1, 1, 1, 1, 1,
-0.5344415, -0.2000312, -2.459512, 1, 1, 1, 1, 1,
-0.5328976, -0.1858089, -3.276301, 1, 1, 1, 1, 1,
-0.5266544, -0.8787779, -3.473732, 1, 1, 1, 1, 1,
-0.5261608, 0.4671844, -2.608216, 1, 1, 1, 1, 1,
-0.522972, -0.4523784, -2.370863, 1, 1, 1, 1, 1,
-0.5176716, 0.03938473, -1.319779, 0, 0, 1, 1, 1,
-0.5174615, 1.982218, -1.044147, 1, 0, 0, 1, 1,
-0.5174321, -1.410349, -1.708387, 1, 0, 0, 1, 1,
-0.5163019, -0.2043596, -1.273606, 1, 0, 0, 1, 1,
-0.5105338, 0.5172439, 0.7346658, 1, 0, 0, 1, 1,
-0.5078152, -1.794158, -1.71871, 1, 0, 0, 1, 1,
-0.5029889, -0.5149523, -3.456086, 0, 0, 0, 1, 1,
-0.5008544, -0.8169972, -1.574706, 0, 0, 0, 1, 1,
-0.4996226, 2.157231, -0.4686238, 0, 0, 0, 1, 1,
-0.4949954, 1.155481, -0.6663163, 0, 0, 0, 1, 1,
-0.492215, -0.04932763, -1.226769, 0, 0, 0, 1, 1,
-0.4892847, -0.4612511, -2.891675, 0, 0, 0, 1, 1,
-0.4848042, -0.6817803, -2.683939, 0, 0, 0, 1, 1,
-0.4844207, -0.5558346, -2.774453, 1, 1, 1, 1, 1,
-0.4831181, -0.3707989, -1.882374, 1, 1, 1, 1, 1,
-0.4808965, 0.7587503, -1.011262, 1, 1, 1, 1, 1,
-0.4761011, 1.130297, -1.904154, 1, 1, 1, 1, 1,
-0.474551, 0.0187471, -3.171813, 1, 1, 1, 1, 1,
-0.4687466, 0.8439512, 0.4958023, 1, 1, 1, 1, 1,
-0.4687317, 0.4214312, -2.405901, 1, 1, 1, 1, 1,
-0.4674005, -1.017569, -2.568538, 1, 1, 1, 1, 1,
-0.459558, 0.625037, -1.147568, 1, 1, 1, 1, 1,
-0.4594109, 1.393241, -1.014545, 1, 1, 1, 1, 1,
-0.4558445, -1.397707, -1.457106, 1, 1, 1, 1, 1,
-0.4517294, -0.7550868, -2.818713, 1, 1, 1, 1, 1,
-0.4509193, -0.2164219, -2.128659, 1, 1, 1, 1, 1,
-0.4440413, -0.07696529, -2.096735, 1, 1, 1, 1, 1,
-0.4390863, 0.4804783, -0.4107348, 1, 1, 1, 1, 1,
-0.4324137, -0.5002075, -0.9981692, 0, 0, 1, 1, 1,
-0.4306299, -1.661201, -3.449818, 1, 0, 0, 1, 1,
-0.4283893, 0.3260985, -1.155163, 1, 0, 0, 1, 1,
-0.4276602, -0.8984927, -0.9870927, 1, 0, 0, 1, 1,
-0.4262843, 0.2452816, -1.406086, 1, 0, 0, 1, 1,
-0.4243107, 0.2095873, -1.044354, 1, 0, 0, 1, 1,
-0.4239779, 0.1731146, -1.340232, 0, 0, 0, 1, 1,
-0.4230427, 0.1118503, -2.367975, 0, 0, 0, 1, 1,
-0.4153214, 0.70122, -0.600582, 0, 0, 0, 1, 1,
-0.4137306, 2.198889, 0.2415746, 0, 0, 0, 1, 1,
-0.4123476, -1.141095, -5.153447, 0, 0, 0, 1, 1,
-0.4059764, 2.228177, -0.5322704, 0, 0, 0, 1, 1,
-0.4020015, -0.3367132, -1.40355, 0, 0, 0, 1, 1,
-0.4008116, -0.3545442, -1.181195, 1, 1, 1, 1, 1,
-0.4003249, -0.8574365, -1.239678, 1, 1, 1, 1, 1,
-0.3946852, 0.3285599, -1.413797, 1, 1, 1, 1, 1,
-0.3917534, 0.1550163, -1.815837, 1, 1, 1, 1, 1,
-0.3865015, 1.33135, -0.3526662, 1, 1, 1, 1, 1,
-0.3862254, -0.5746499, -3.258251, 1, 1, 1, 1, 1,
-0.3860338, 0.5795435, -0.8489286, 1, 1, 1, 1, 1,
-0.382394, 1.410041, -0.416381, 1, 1, 1, 1, 1,
-0.3812052, -0.07985727, -1.23316, 1, 1, 1, 1, 1,
-0.3752605, 0.9182834, -0.5997304, 1, 1, 1, 1, 1,
-0.3735754, -0.77273, -1.808375, 1, 1, 1, 1, 1,
-0.3735466, 0.7921528, -0.005288831, 1, 1, 1, 1, 1,
-0.3666198, 0.2470982, -0.5854355, 1, 1, 1, 1, 1,
-0.3630677, -0.9885104, -2.926656, 1, 1, 1, 1, 1,
-0.3609117, -0.1316949, -1.835065, 1, 1, 1, 1, 1,
-0.3604133, -1.017236, -3.148936, 0, 0, 1, 1, 1,
-0.3592636, 1.14297, 0.7200004, 1, 0, 0, 1, 1,
-0.3575737, 0.3351713, -1.589566, 1, 0, 0, 1, 1,
-0.3534265, -0.9997909, -2.460912, 1, 0, 0, 1, 1,
-0.3525368, 1.409748, -1.024864, 1, 0, 0, 1, 1,
-0.351456, 0.08812921, 0.3636751, 1, 0, 0, 1, 1,
-0.3500605, 1.198815, -0.9116257, 0, 0, 0, 1, 1,
-0.3499964, 1.071687, -1.114046, 0, 0, 0, 1, 1,
-0.3398334, 1.574113, 0.3916522, 0, 0, 0, 1, 1,
-0.3387433, 0.2058281, -0.02679692, 0, 0, 0, 1, 1,
-0.3386004, 1.828853, -1.591147, 0, 0, 0, 1, 1,
-0.3376487, 0.02680579, -1.56427, 0, 0, 0, 1, 1,
-0.3366551, 1.034321, 0.6854485, 0, 0, 0, 1, 1,
-0.3365918, -0.7684566, -4.001295, 1, 1, 1, 1, 1,
-0.3315793, -1.213291, -1.323054, 1, 1, 1, 1, 1,
-0.3280917, 0.6026958, -0.008420028, 1, 1, 1, 1, 1,
-0.3276659, -0.3364359, -1.643376, 1, 1, 1, 1, 1,
-0.3230771, 2.217845, -0.1246482, 1, 1, 1, 1, 1,
-0.3216563, 0.5971977, -0.04267008, 1, 1, 1, 1, 1,
-0.3210595, -2.523525, -3.39023, 1, 1, 1, 1, 1,
-0.3182287, -0.4585555, -2.199544, 1, 1, 1, 1, 1,
-0.3128481, 0.9843617, -2.190251, 1, 1, 1, 1, 1,
-0.3117465, 0.4010805, -0.8512933, 1, 1, 1, 1, 1,
-0.3086446, -0.9611365, -2.863648, 1, 1, 1, 1, 1,
-0.2986309, 0.5320072, -0.4265134, 1, 1, 1, 1, 1,
-0.2985105, 1.14968, -1.148901, 1, 1, 1, 1, 1,
-0.2908929, -2.873656, -4.516951, 1, 1, 1, 1, 1,
-0.2872496, -0.179157, -3.00689, 1, 1, 1, 1, 1,
-0.2865557, -1.52074, -4.004912, 0, 0, 1, 1, 1,
-0.2810533, -0.461052, -3.092813, 1, 0, 0, 1, 1,
-0.2744473, 2.365831, -0.08617777, 1, 0, 0, 1, 1,
-0.267249, 0.001546553, -1.487974, 1, 0, 0, 1, 1,
-0.2652431, -0.006737965, -2.511072, 1, 0, 0, 1, 1,
-0.265206, 1.602507, -1.063032, 1, 0, 0, 1, 1,
-0.2621349, -0.2824259, -1.490911, 0, 0, 0, 1, 1,
-0.2554872, 2.198713, -0.7304732, 0, 0, 0, 1, 1,
-0.2550187, -1.21497, -1.817397, 0, 0, 0, 1, 1,
-0.25331, 1.535158, 1.846253, 0, 0, 0, 1, 1,
-0.2525429, 0.2080368, -0.1351067, 0, 0, 0, 1, 1,
-0.2519961, 0.9899572, -0.2903541, 0, 0, 0, 1, 1,
-0.2508285, -0.3405592, -3.55946, 0, 0, 0, 1, 1,
-0.2485151, -1.236, -3.028206, 1, 1, 1, 1, 1,
-0.2480318, 0.6796829, -1.688799, 1, 1, 1, 1, 1,
-0.2440406, 0.8579067, -0.119587, 1, 1, 1, 1, 1,
-0.2421742, 3.394311, 0.2186857, 1, 1, 1, 1, 1,
-0.2421251, -0.7613553, -4.146214, 1, 1, 1, 1, 1,
-0.2412688, -0.6383569, -2.997185, 1, 1, 1, 1, 1,
-0.2387313, 0.4268577, -0.2206376, 1, 1, 1, 1, 1,
-0.2378205, 0.8796489, -0.1883684, 1, 1, 1, 1, 1,
-0.2323395, 0.4374959, 0.09233642, 1, 1, 1, 1, 1,
-0.2322655, 0.6862869, -0.8015982, 1, 1, 1, 1, 1,
-0.2320178, 0.3947542, 0.007359254, 1, 1, 1, 1, 1,
-0.2300211, 0.7696288, 0.3475249, 1, 1, 1, 1, 1,
-0.226853, -0.7913186, -3.637644, 1, 1, 1, 1, 1,
-0.2224339, -0.1087821, -2.157563, 1, 1, 1, 1, 1,
-0.2216523, -1.898031, -3.840235, 1, 1, 1, 1, 1,
-0.2185119, -1.323938, -3.63022, 0, 0, 1, 1, 1,
-0.2179882, 1.922071, 0.3136579, 1, 0, 0, 1, 1,
-0.2177197, 0.3891893, -1.680848, 1, 0, 0, 1, 1,
-0.2096236, 0.2131712, -0.4355921, 1, 0, 0, 1, 1,
-0.2085685, -0.03801373, -4.676837, 1, 0, 0, 1, 1,
-0.2074731, 0.1894461, 0.3335518, 1, 0, 0, 1, 1,
-0.2073213, 0.7891918, 0.1196695, 0, 0, 0, 1, 1,
-0.2072064, 0.05722638, 0.221879, 0, 0, 0, 1, 1,
-0.2047651, -0.4491683, -1.563453, 0, 0, 0, 1, 1,
-0.2038231, 0.4264758, -0.09274352, 0, 0, 0, 1, 1,
-0.2024931, -0.6767946, -1.913004, 0, 0, 0, 1, 1,
-0.20149, -0.1689233, 0.301307, 0, 0, 0, 1, 1,
-0.2011253, -1.867517, -2.536638, 0, 0, 0, 1, 1,
-0.2009113, -1.293952, -1.983527, 1, 1, 1, 1, 1,
-0.1995247, -1.441021, -4.215292, 1, 1, 1, 1, 1,
-0.1942358, -0.4828794, -2.836394, 1, 1, 1, 1, 1,
-0.191155, 0.2632524, 0.3772254, 1, 1, 1, 1, 1,
-0.1830143, -0.391876, -3.266625, 1, 1, 1, 1, 1,
-0.1809864, 0.7065532, -0.3126378, 1, 1, 1, 1, 1,
-0.1789023, -0.7897934, -3.401203, 1, 1, 1, 1, 1,
-0.1779472, -0.8985371, -3.841756, 1, 1, 1, 1, 1,
-0.17314, -0.6888114, -1.184415, 1, 1, 1, 1, 1,
-0.1699676, 0.2633221, -0.4125406, 1, 1, 1, 1, 1,
-0.1696399, 0.1621573, -0.4175698, 1, 1, 1, 1, 1,
-0.1695714, -2.123757, -3.159447, 1, 1, 1, 1, 1,
-0.1640388, -0.4121929, -3.207135, 1, 1, 1, 1, 1,
-0.1590104, -1.737566, -2.254554, 1, 1, 1, 1, 1,
-0.1518379, -0.5453686, -4.842097, 1, 1, 1, 1, 1,
-0.1490413, -2.564009, -3.259586, 0, 0, 1, 1, 1,
-0.1476, 0.7052069, -0.7376634, 1, 0, 0, 1, 1,
-0.1473447, -1.3459, -4.309326, 1, 0, 0, 1, 1,
-0.1455479, 0.8234946, -0.3112967, 1, 0, 0, 1, 1,
-0.1412202, 0.1312148, -0.2819, 1, 0, 0, 1, 1,
-0.1383817, 1.41192, -0.5399933, 1, 0, 0, 1, 1,
-0.1366506, -1.828697, -3.38194, 0, 0, 0, 1, 1,
-0.1314988, 1.468709, -0.8223112, 0, 0, 0, 1, 1,
-0.12621, 1.072153, 0.04899526, 0, 0, 0, 1, 1,
-0.1252381, 1.335346, -0.0202322, 0, 0, 0, 1, 1,
-0.1174304, 2.200222, -0.5955266, 0, 0, 0, 1, 1,
-0.1162889, -0.1171911, -3.731762, 0, 0, 0, 1, 1,
-0.1146576, -0.5217876, -2.750389, 0, 0, 0, 1, 1,
-0.1130849, -0.4122443, -2.386362, 1, 1, 1, 1, 1,
-0.1093021, 0.3944187, -0.958212, 1, 1, 1, 1, 1,
-0.1080746, 0.7387828, 0.3728983, 1, 1, 1, 1, 1,
-0.1050929, -0.02737285, -2.184771, 1, 1, 1, 1, 1,
-0.09995602, -0.1597341, -1.935374, 1, 1, 1, 1, 1,
-0.09935286, -0.6963075, -2.109188, 1, 1, 1, 1, 1,
-0.09482177, -0.194618, -4.621675, 1, 1, 1, 1, 1,
-0.09237929, -1.58971, -4.639153, 1, 1, 1, 1, 1,
-0.09041122, 1.068543, -1.562085, 1, 1, 1, 1, 1,
-0.08920132, -0.115873, -3.251051, 1, 1, 1, 1, 1,
-0.08857793, 1.035199, -0.6486536, 1, 1, 1, 1, 1,
-0.08706355, 0.3303089, -0.1968095, 1, 1, 1, 1, 1,
-0.08610278, -1.002366, -2.644575, 1, 1, 1, 1, 1,
-0.07433097, -0.5458935, -0.9218897, 1, 1, 1, 1, 1,
-0.06655233, -0.2095248, -4.248535, 1, 1, 1, 1, 1,
-0.06446534, 0.4059137, 0.1397703, 0, 0, 1, 1, 1,
-0.06024189, -0.3945899, -2.552951, 1, 0, 0, 1, 1,
-0.06019022, 0.9098199, 0.1592764, 1, 0, 0, 1, 1,
-0.05315958, 0.7876682, -1.066633, 1, 0, 0, 1, 1,
-0.05306377, 1.265179, -0.01303375, 1, 0, 0, 1, 1,
-0.04948246, 2.227865, 0.3960676, 1, 0, 0, 1, 1,
-0.04945458, -0.3056719, -3.166792, 0, 0, 0, 1, 1,
-0.04614853, -0.1697649, -2.807055, 0, 0, 0, 1, 1,
-0.0442227, -0.5188313, -2.224744, 0, 0, 0, 1, 1,
-0.04389822, -0.8791189, -5.505221, 0, 0, 0, 1, 1,
-0.0425889, -0.8372609, -3.357768, 0, 0, 0, 1, 1,
-0.04220753, 0.4623249, -0.1976801, 0, 0, 0, 1, 1,
-0.03474155, 0.4206415, -0.785741, 0, 0, 0, 1, 1,
-0.02836665, 1.183031, 0.2038448, 1, 1, 1, 1, 1,
-0.02319037, -0.5613175, -4.429915, 1, 1, 1, 1, 1,
-0.02210321, -1.205333, -2.450608, 1, 1, 1, 1, 1,
-0.01718725, -1.223636, -2.418769, 1, 1, 1, 1, 1,
-0.01420737, 1.525427, 0.3949348, 1, 1, 1, 1, 1,
-0.01257765, 0.7287982, -0.5772896, 1, 1, 1, 1, 1,
-0.01104824, 0.8641924, -0.1613095, 1, 1, 1, 1, 1,
-0.008707734, 1.753493, -0.72103, 1, 1, 1, 1, 1,
-0.007412818, -1.601565, -2.235773, 1, 1, 1, 1, 1,
-0.007058941, -1.640281, -3.018476, 1, 1, 1, 1, 1,
-0.003374834, -1.32697, -4.141348, 1, 1, 1, 1, 1,
0.0004967448, 0.9734938, 0.2558862, 1, 1, 1, 1, 1,
0.0008165967, -0.1497499, 3.273234, 1, 1, 1, 1, 1,
0.001282906, 0.8560659, -0.09766506, 1, 1, 1, 1, 1,
0.008141838, 0.2487327, -0.19917, 1, 1, 1, 1, 1,
0.009113525, -1.155004, 3.390013, 0, 0, 1, 1, 1,
0.0134105, 0.6962094, 0.8529165, 1, 0, 0, 1, 1,
0.01932195, -1.66302, 3.116692, 1, 0, 0, 1, 1,
0.02370708, 0.2663928, -1.817317, 1, 0, 0, 1, 1,
0.02592041, -0.5657119, 1.502656, 1, 0, 0, 1, 1,
0.02788261, -0.3797444, 2.738695, 1, 0, 0, 1, 1,
0.03053858, -0.3767231, 2.260836, 0, 0, 0, 1, 1,
0.03571641, -2.424876, 3.053721, 0, 0, 0, 1, 1,
0.03599219, 0.04549119, -1.194945, 0, 0, 0, 1, 1,
0.044128, -0.0119309, 2.166622, 0, 0, 0, 1, 1,
0.04592148, -0.6510177, 2.564442, 0, 0, 0, 1, 1,
0.05255391, 0.5350463, 0.6634927, 0, 0, 0, 1, 1,
0.0527785, 1.497215, -1.375162, 0, 0, 0, 1, 1,
0.05985871, 2.224059, -0.5708951, 1, 1, 1, 1, 1,
0.06185369, -0.2799332, 1.186319, 1, 1, 1, 1, 1,
0.06520898, -0.5846457, 3.168394, 1, 1, 1, 1, 1,
0.06590158, -0.1101883, 1.459657, 1, 1, 1, 1, 1,
0.06662295, -1.141678, 3.918835, 1, 1, 1, 1, 1,
0.06851206, 1.046911, -0.3336084, 1, 1, 1, 1, 1,
0.06975482, 1.774581, -1.06625, 1, 1, 1, 1, 1,
0.07226384, -0.7473548, 1.458686, 1, 1, 1, 1, 1,
0.07325186, -1.024348, 5.234884, 1, 1, 1, 1, 1,
0.0861291, -0.7413678, 2.204931, 1, 1, 1, 1, 1,
0.08756942, -0.4173106, 3.03365, 1, 1, 1, 1, 1,
0.08992232, 0.6674445, 1.328393, 1, 1, 1, 1, 1,
0.09500833, -1.29203, 4.610939, 1, 1, 1, 1, 1,
0.09862196, -1.015056, 1.979847, 1, 1, 1, 1, 1,
0.09880225, 0.2824118, 0.615256, 1, 1, 1, 1, 1,
0.1000865, 0.09757355, 0.8980255, 0, 0, 1, 1, 1,
0.1011979, 1.144554, -0.4900194, 1, 0, 0, 1, 1,
0.1029032, 0.5422367, 0.5450016, 1, 0, 0, 1, 1,
0.1030367, 1.855957, 1.097883, 1, 0, 0, 1, 1,
0.1051119, 0.4442582, -2.132314, 1, 0, 0, 1, 1,
0.1051394, -2.970243, 3.296537, 1, 0, 0, 1, 1,
0.107138, 0.3409345, 0.06207015, 0, 0, 0, 1, 1,
0.1094698, -1.063977, 3.087337, 0, 0, 0, 1, 1,
0.1103855, -1.378339, 2.909287, 0, 0, 0, 1, 1,
0.1123578, -0.5827568, 3.04905, 0, 0, 0, 1, 1,
0.1187606, -0.6686749, 2.845219, 0, 0, 0, 1, 1,
0.1202822, -1.432977, 2.500997, 0, 0, 0, 1, 1,
0.1206649, -0.3371824, 4.041563, 0, 0, 0, 1, 1,
0.1210726, 0.6832831, -0.05529155, 1, 1, 1, 1, 1,
0.1246747, 0.8175457, 1.422898, 1, 1, 1, 1, 1,
0.1321042, 0.7157374, -0.2254083, 1, 1, 1, 1, 1,
0.1332747, 0.7071618, 1.375351, 1, 1, 1, 1, 1,
0.1333952, -0.6788077, 2.65776, 1, 1, 1, 1, 1,
0.1376163, 0.9223179, -0.06691549, 1, 1, 1, 1, 1,
0.1396886, 0.4698002, 0.4080197, 1, 1, 1, 1, 1,
0.1400903, -0.219173, 2.322542, 1, 1, 1, 1, 1,
0.1432343, -0.1418959, 1.83439, 1, 1, 1, 1, 1,
0.1498708, -1.106605, 1.965372, 1, 1, 1, 1, 1,
0.1530939, 0.3974441, -0.997853, 1, 1, 1, 1, 1,
0.1535076, -0.2257384, 1.656563, 1, 1, 1, 1, 1,
0.156928, -0.1348403, 0.8007277, 1, 1, 1, 1, 1,
0.1621885, 0.1724672, 0.6395422, 1, 1, 1, 1, 1,
0.16247, 0.607261, -1.055715, 1, 1, 1, 1, 1,
0.1624979, 1.108419, -0.4473385, 0, 0, 1, 1, 1,
0.1635006, 1.620623, -0.4303946, 1, 0, 0, 1, 1,
0.1669907, 0.9889301, -0.2928465, 1, 0, 0, 1, 1,
0.1711939, -0.08742223, 3.175385, 1, 0, 0, 1, 1,
0.1737473, 0.6472631, -0.4039341, 1, 0, 0, 1, 1,
0.1758547, 0.6167986, 1.966376, 1, 0, 0, 1, 1,
0.1815822, -0.5725729, 2.239605, 0, 0, 0, 1, 1,
0.1825589, 0.3256368, 1.753442, 0, 0, 0, 1, 1,
0.1826259, 0.5709391, -0.4631859, 0, 0, 0, 1, 1,
0.1842305, 0.5234723, 0.5600088, 0, 0, 0, 1, 1,
0.1860475, -1.587387, 2.732004, 0, 0, 0, 1, 1,
0.1864845, -0.1822057, 1.183905, 0, 0, 0, 1, 1,
0.1897533, 0.2068121, 0.4931227, 0, 0, 0, 1, 1,
0.1902591, 0.6758923, 0.6393234, 1, 1, 1, 1, 1,
0.2051085, 0.1475235, -0.01343433, 1, 1, 1, 1, 1,
0.2064275, 1.092506, -0.02776413, 1, 1, 1, 1, 1,
0.2068756, -1.039794, 2.998437, 1, 1, 1, 1, 1,
0.2100359, 0.2663401, -0.7108111, 1, 1, 1, 1, 1,
0.2141932, 1.377369, -1.686123, 1, 1, 1, 1, 1,
0.2271107, 0.1186314, 0.5952501, 1, 1, 1, 1, 1,
0.2272055, 1.306108, -0.1182908, 1, 1, 1, 1, 1,
0.2291966, -0.280382, 2.854699, 1, 1, 1, 1, 1,
0.2310699, -1.394081, 3.796544, 1, 1, 1, 1, 1,
0.2322057, -0.6891562, 2.734587, 1, 1, 1, 1, 1,
0.2331266, 0.3573447, 2.470501, 1, 1, 1, 1, 1,
0.2336299, 1.016258, 1.88123, 1, 1, 1, 1, 1,
0.2341127, 0.2568413, 0.5217178, 1, 1, 1, 1, 1,
0.2382748, 0.7417628, -0.19156, 1, 1, 1, 1, 1,
0.2394027, 0.05118502, 0.7398736, 0, 0, 1, 1, 1,
0.2395223, 0.195273, 1.571345, 1, 0, 0, 1, 1,
0.2396093, -0.4440795, 2.464943, 1, 0, 0, 1, 1,
0.2487705, -0.6369457, 3.259972, 1, 0, 0, 1, 1,
0.2507929, -0.321663, 3.735901, 1, 0, 0, 1, 1,
0.2518672, 0.307491, -0.4993077, 1, 0, 0, 1, 1,
0.2533185, -0.742297, 2.122518, 0, 0, 0, 1, 1,
0.2541754, -1.23496, 1.356707, 0, 0, 0, 1, 1,
0.2593531, -0.1469131, 4.14553, 0, 0, 0, 1, 1,
0.2614755, -0.3009104, 4.058681, 0, 0, 0, 1, 1,
0.2653861, -0.8027689, 1.319742, 0, 0, 0, 1, 1,
0.2664727, 0.7824638, 0.6745512, 0, 0, 0, 1, 1,
0.2699253, 0.6964488, 1.874509, 0, 0, 0, 1, 1,
0.2716567, -0.04341804, 2.20041, 1, 1, 1, 1, 1,
0.2761302, 1.446029, 1.58951, 1, 1, 1, 1, 1,
0.2766251, -1.715742, 2.140363, 1, 1, 1, 1, 1,
0.2839157, 0.7136022, 0.8481622, 1, 1, 1, 1, 1,
0.2842534, 2.396731, 1.393322, 1, 1, 1, 1, 1,
0.2892309, 0.771455, -1.224618, 1, 1, 1, 1, 1,
0.2914797, -0.05859165, 2.062886, 1, 1, 1, 1, 1,
0.2922247, -1.677789, 1.255107, 1, 1, 1, 1, 1,
0.2942791, 0.4199736, 1.902427, 1, 1, 1, 1, 1,
0.2959617, 0.5003861, -1.250095, 1, 1, 1, 1, 1,
0.2995724, -0.8679579, 2.563194, 1, 1, 1, 1, 1,
0.3000851, 1.188525, 2.299612, 1, 1, 1, 1, 1,
0.3011794, 0.1107053, 1.240303, 1, 1, 1, 1, 1,
0.3075564, 1.447973, -0.8474339, 1, 1, 1, 1, 1,
0.3099186, -0.9917073, 5.654819, 1, 1, 1, 1, 1,
0.3117466, -1.021024, 2.821453, 0, 0, 1, 1, 1,
0.3152415, -0.4445052, 1.189717, 1, 0, 0, 1, 1,
0.3217921, 0.2890517, -0.1485119, 1, 0, 0, 1, 1,
0.322955, 0.4708019, 0.3958214, 1, 0, 0, 1, 1,
0.3259977, 0.4298935, 2.076184, 1, 0, 0, 1, 1,
0.3273037, -0.8274083, 2.431472, 1, 0, 0, 1, 1,
0.3299637, -0.7011443, 3.161213, 0, 0, 0, 1, 1,
0.3327622, -0.5746729, 2.14227, 0, 0, 0, 1, 1,
0.3333084, -0.7526543, 1.584502, 0, 0, 0, 1, 1,
0.335278, 0.6220875, -0.8801246, 0, 0, 0, 1, 1,
0.3398416, 0.4181385, 0.6116808, 0, 0, 0, 1, 1,
0.3400886, -1.630938, 2.046479, 0, 0, 0, 1, 1,
0.3418523, -0.6021925, 2.055175, 0, 0, 0, 1, 1,
0.3420799, 0.2319674, 0.660067, 1, 1, 1, 1, 1,
0.3521225, 2.391608, 1.233465, 1, 1, 1, 1, 1,
0.3522477, -0.6518019, 2.843236, 1, 1, 1, 1, 1,
0.3526835, 0.3718002, 0.8339995, 1, 1, 1, 1, 1,
0.3550526, -0.07376812, 1.508298, 1, 1, 1, 1, 1,
0.3551041, 0.8136104, 0.2870004, 1, 1, 1, 1, 1,
0.3567764, -0.09256779, 1.200998, 1, 1, 1, 1, 1,
0.3581738, -1.698812, 2.311863, 1, 1, 1, 1, 1,
0.3660709, 0.7856469, 0.8112359, 1, 1, 1, 1, 1,
0.37472, 0.8200304, 1.811017, 1, 1, 1, 1, 1,
0.3771393, -0.7396726, 2.157586, 1, 1, 1, 1, 1,
0.3780571, 0.9960529, 1.585769, 1, 1, 1, 1, 1,
0.3786054, -0.835529, 2.227725, 1, 1, 1, 1, 1,
0.3843123, 0.2839917, 1.647667, 1, 1, 1, 1, 1,
0.3864864, -0.3526839, 3.899664, 1, 1, 1, 1, 1,
0.3927155, -0.5803055, 2.447597, 0, 0, 1, 1, 1,
0.3992973, 1.33591, -0.5593215, 1, 0, 0, 1, 1,
0.3995463, -0.9353111, 2.544877, 1, 0, 0, 1, 1,
0.4041788, -1.005918, 3.643077, 1, 0, 0, 1, 1,
0.4059833, 0.9837139, 0.5591459, 1, 0, 0, 1, 1,
0.4117904, -0.2405299, 1.098193, 1, 0, 0, 1, 1,
0.4122757, -0.3959499, 0.4334571, 0, 0, 0, 1, 1,
0.4143163, 0.2701008, 0.5247653, 0, 0, 0, 1, 1,
0.4154752, -0.6910096, 1.899453, 0, 0, 0, 1, 1,
0.4155054, 0.8131071, -0.6718667, 0, 0, 0, 1, 1,
0.4191193, -0.2501056, 2.281982, 0, 0, 0, 1, 1,
0.4213826, 0.2650807, 1.139915, 0, 0, 0, 1, 1,
0.4293979, -1.366435, 3.300897, 0, 0, 0, 1, 1,
0.4343329, -0.6616454, 1.612027, 1, 1, 1, 1, 1,
0.4350898, 0.2111468, -2.225265, 1, 1, 1, 1, 1,
0.4352591, -0.5630414, 5.230231, 1, 1, 1, 1, 1,
0.4386234, -0.33257, 4.046722, 1, 1, 1, 1, 1,
0.4471554, -1.048051, 4.251197, 1, 1, 1, 1, 1,
0.4474485, 0.8545976, 0.5194988, 1, 1, 1, 1, 1,
0.4541595, -0.9560553, 4.08775, 1, 1, 1, 1, 1,
0.4576214, 0.4714651, 3.472159, 1, 1, 1, 1, 1,
0.4589183, 0.4252343, 0.002992388, 1, 1, 1, 1, 1,
0.4597404, 0.4035243, 1.613836, 1, 1, 1, 1, 1,
0.4688172, -1.373466, 2.848975, 1, 1, 1, 1, 1,
0.4725004, -1.56208, 3.421733, 1, 1, 1, 1, 1,
0.4774286, -1.131242, 2.592726, 1, 1, 1, 1, 1,
0.484739, 1.970755, 1.789691, 1, 1, 1, 1, 1,
0.485411, -0.905651, 2.647893, 1, 1, 1, 1, 1,
0.4892308, -0.07085796, 1.343211, 0, 0, 1, 1, 1,
0.4965797, 2.669196, -1.956225, 1, 0, 0, 1, 1,
0.4983563, -2.205205, 3.303224, 1, 0, 0, 1, 1,
0.5029957, 0.1266283, 0.5701284, 1, 0, 0, 1, 1,
0.5041853, -0.4747299, 1.882472, 1, 0, 0, 1, 1,
0.5097809, 0.05073395, 0.897222, 1, 0, 0, 1, 1,
0.5103794, -0.4758377, 4.005193, 0, 0, 0, 1, 1,
0.5106884, -1.204713, 2.739729, 0, 0, 0, 1, 1,
0.510811, -0.8907014, 2.563761, 0, 0, 0, 1, 1,
0.5130646, 0.2146272, 2.966259, 0, 0, 0, 1, 1,
0.5223513, 0.5894955, -0.9455689, 0, 0, 0, 1, 1,
0.5255228, -0.2213937, 2.159873, 0, 0, 0, 1, 1,
0.5284101, -1.342022, 2.249527, 0, 0, 0, 1, 1,
0.5358137, -0.1703854, 3.521014, 1, 1, 1, 1, 1,
0.5386946, -0.621351, 3.429206, 1, 1, 1, 1, 1,
0.5395523, 0.06437849, 1.6364, 1, 1, 1, 1, 1,
0.5434902, 0.9237813, 1.198351, 1, 1, 1, 1, 1,
0.5454025, 1.303637, 1.457949, 1, 1, 1, 1, 1,
0.5481923, -1.650678, 2.066937, 1, 1, 1, 1, 1,
0.5522519, -0.6961799, 2.281326, 1, 1, 1, 1, 1,
0.5523171, -1.435705, 3.153442, 1, 1, 1, 1, 1,
0.5603839, 0.05823594, 2.760614, 1, 1, 1, 1, 1,
0.561594, -0.0944237, 0.9008017, 1, 1, 1, 1, 1,
0.5635957, 0.09351667, 0.7935932, 1, 1, 1, 1, 1,
0.5658657, 0.1819624, 1.149197, 1, 1, 1, 1, 1,
0.5669933, 0.001639852, 2.925366, 1, 1, 1, 1, 1,
0.5835682, 0.42497, -0.5885411, 1, 1, 1, 1, 1,
0.5845265, -1.171031, 3.569626, 1, 1, 1, 1, 1,
0.5857193, -0.5097647, 3.804312, 0, 0, 1, 1, 1,
0.5862647, 0.2900248, 2.32745, 1, 0, 0, 1, 1,
0.5865931, -0.5297747, 0.7077066, 1, 0, 0, 1, 1,
0.5896435, -0.464871, 2.604339, 1, 0, 0, 1, 1,
0.5927199, 1.364363, 1.331181, 1, 0, 0, 1, 1,
0.5948633, -0.1906788, 2.473207, 1, 0, 0, 1, 1,
0.602904, -1.628808, 3.644316, 0, 0, 0, 1, 1,
0.6067334, 1.100807, 1.494607, 0, 0, 0, 1, 1,
0.608577, 2.12462, 0.5764126, 0, 0, 0, 1, 1,
0.6093554, -0.4010544, 1.066722, 0, 0, 0, 1, 1,
0.6109973, -0.3450272, 3.556518, 0, 0, 0, 1, 1,
0.6112353, -1.042679, 2.341504, 0, 0, 0, 1, 1,
0.6171352, -0.3628772, 3.537093, 0, 0, 0, 1, 1,
0.6174828, 0.9187031, 1.689579, 1, 1, 1, 1, 1,
0.6187813, 1.204694, -1.887581, 1, 1, 1, 1, 1,
0.6232061, -0.4512622, -0.1721377, 1, 1, 1, 1, 1,
0.6259888, -1.222208, 2.730148, 1, 1, 1, 1, 1,
0.6339546, 0.736846, 0.4667933, 1, 1, 1, 1, 1,
0.6368365, 1.057617, -0.4970648, 1, 1, 1, 1, 1,
0.6372068, -0.5985447, 3.81498, 1, 1, 1, 1, 1,
0.6404267, 0.6420376, 1.70622, 1, 1, 1, 1, 1,
0.641946, 0.731984, 0.9607521, 1, 1, 1, 1, 1,
0.6426204, 0.6492671, 0.4406741, 1, 1, 1, 1, 1,
0.6440554, -0.4069262, 2.991204, 1, 1, 1, 1, 1,
0.644266, -0.7070166, 1.494428, 1, 1, 1, 1, 1,
0.6470977, -0.07679217, 1.548602, 1, 1, 1, 1, 1,
0.6475256, 1.298905, 0.4093592, 1, 1, 1, 1, 1,
0.6528633, 0.09916849, 0.408226, 1, 1, 1, 1, 1,
0.6548573, 1.788362, 0.8537998, 0, 0, 1, 1, 1,
0.6550264, -2.023537, 1.831661, 1, 0, 0, 1, 1,
0.6594347, 0.6057407, 0.1841437, 1, 0, 0, 1, 1,
0.6597645, 2.644505, -1.66009, 1, 0, 0, 1, 1,
0.6618463, 0.855988, 0.7023835, 1, 0, 0, 1, 1,
0.6645303, -1.35242, 3.107723, 1, 0, 0, 1, 1,
0.6654297, 0.6153017, 1.05531, 0, 0, 0, 1, 1,
0.666349, 0.8933181, 2.147756, 0, 0, 0, 1, 1,
0.6744421, 0.07757761, 1.26965, 0, 0, 0, 1, 1,
0.6745878, 0.8546749, 1.097295, 0, 0, 0, 1, 1,
0.6769406, -0.6982002, 4.23822, 0, 0, 0, 1, 1,
0.679904, -0.7479995, 4.593158, 0, 0, 0, 1, 1,
0.6840942, -0.8022764, 2.431791, 0, 0, 0, 1, 1,
0.688737, -0.7140055, 2.755846, 1, 1, 1, 1, 1,
0.6896802, 0.8190491, 2.840921, 1, 1, 1, 1, 1,
0.6921483, 0.6510103, 0.5193028, 1, 1, 1, 1, 1,
0.6923711, 2.222699, -0.2707555, 1, 1, 1, 1, 1,
0.6928743, -1.334434, 2.623213, 1, 1, 1, 1, 1,
0.6929945, -1.014727, 2.713474, 1, 1, 1, 1, 1,
0.697086, 1.103496, 1.242783, 1, 1, 1, 1, 1,
0.7036284, -0.2636202, 3.603178, 1, 1, 1, 1, 1,
0.7108875, -0.9980574, 2.585796, 1, 1, 1, 1, 1,
0.7141185, -0.8070605, 1.754221, 1, 1, 1, 1, 1,
0.7172732, 0.2828016, 1.048939, 1, 1, 1, 1, 1,
0.7184601, -1.489579, 2.75292, 1, 1, 1, 1, 1,
0.7228871, -0.3608321, 1.278262, 1, 1, 1, 1, 1,
0.7268417, 1.600466, 0.2298325, 1, 1, 1, 1, 1,
0.7296075, 0.3654265, 0.7618357, 1, 1, 1, 1, 1,
0.730758, 0.4648697, 0.6528396, 0, 0, 1, 1, 1,
0.7308148, 0.8475863, 2.75608, 1, 0, 0, 1, 1,
0.7400693, 0.5879542, 1.581202, 1, 0, 0, 1, 1,
0.7428026, -0.9481488, 2.450874, 1, 0, 0, 1, 1,
0.7444838, -0.8469121, 2.040444, 1, 0, 0, 1, 1,
0.7474105, 1.033858, 1.348934, 1, 0, 0, 1, 1,
0.7483958, 0.915463, 1.854552, 0, 0, 0, 1, 1,
0.7497615, 0.1930871, 0.8674117, 0, 0, 0, 1, 1,
0.7536411, -1.111688, 1.973023, 0, 0, 0, 1, 1,
0.763393, 0.451722, -1.201668, 0, 0, 0, 1, 1,
0.7653531, -0.5559834, 2.712912, 0, 0, 0, 1, 1,
0.7681675, -1.184038, 3.253243, 0, 0, 0, 1, 1,
0.7688406, -0.9929112, 2.700243, 0, 0, 0, 1, 1,
0.7747872, 0.692259, 1.171669, 1, 1, 1, 1, 1,
0.7756466, 0.3766224, 2.422928, 1, 1, 1, 1, 1,
0.7761508, 0.02736799, -0.06659251, 1, 1, 1, 1, 1,
0.7762617, -1.260968, 3.132613, 1, 1, 1, 1, 1,
0.7777494, 0.6914178, -0.01612212, 1, 1, 1, 1, 1,
0.7787382, -0.4277489, 3.855568, 1, 1, 1, 1, 1,
0.7796124, 1.725094, -0.05820202, 1, 1, 1, 1, 1,
0.7813174, -0.3557965, 3.148085, 1, 1, 1, 1, 1,
0.7817209, 1.388282, 1.875436, 1, 1, 1, 1, 1,
0.7821795, -0.5070658, 2.175042, 1, 1, 1, 1, 1,
0.7831391, -0.1229628, 1.085852, 1, 1, 1, 1, 1,
0.784529, 3.560055, 0.9218368, 1, 1, 1, 1, 1,
0.7860826, -0.3099917, 1.931725, 1, 1, 1, 1, 1,
0.7933154, -0.4423396, 2.442656, 1, 1, 1, 1, 1,
0.8033592, -1.367839, 4.174018, 1, 1, 1, 1, 1,
0.8053836, 1.079887, 0.8750556, 0, 0, 1, 1, 1,
0.8086717, 0.1199447, 2.11813, 1, 0, 0, 1, 1,
0.8170989, -0.9343951, 3.285882, 1, 0, 0, 1, 1,
0.8179511, 0.1020611, 0.424001, 1, 0, 0, 1, 1,
0.8181737, -0.434467, 1.542798, 1, 0, 0, 1, 1,
0.8226526, -1.703202, 0.299738, 1, 0, 0, 1, 1,
0.8236154, 0.6042623, 0.7416246, 0, 0, 0, 1, 1,
0.8239095, 0.9904656, -0.5542817, 0, 0, 0, 1, 1,
0.8239556, -1.101018, 1.236218, 0, 0, 0, 1, 1,
0.8246076, -0.6827039, 1.936886, 0, 0, 0, 1, 1,
0.8269839, 1.591641, -0.2910911, 0, 0, 0, 1, 1,
0.8297628, -1.375034, 4.044406, 0, 0, 0, 1, 1,
0.8359008, -0.2342872, 0.9275267, 0, 0, 0, 1, 1,
0.8443988, -2.362225, 1.571318, 1, 1, 1, 1, 1,
0.853201, 0.5564883, 0.1783335, 1, 1, 1, 1, 1,
0.8603103, 0.2161304, 1.25345, 1, 1, 1, 1, 1,
0.8634896, 1.54698, -0.71003, 1, 1, 1, 1, 1,
0.8635313, -1.693616, 2.433183, 1, 1, 1, 1, 1,
0.8645943, -1.629719, 3.174785, 1, 1, 1, 1, 1,
0.8672124, 0.7227237, 0.5678058, 1, 1, 1, 1, 1,
0.8680387, -0.1624211, 0.175282, 1, 1, 1, 1, 1,
0.8688506, 0.3016434, 1.883701, 1, 1, 1, 1, 1,
0.8712806, -0.9236553, 1.282448, 1, 1, 1, 1, 1,
0.8747665, -0.4834289, 2.895069, 1, 1, 1, 1, 1,
0.8776092, -0.6486214, 1.816978, 1, 1, 1, 1, 1,
0.8792811, 0.8604139, 1.257824, 1, 1, 1, 1, 1,
0.8827755, -0.7590068, 1.453678, 1, 1, 1, 1, 1,
0.8893046, -1.246426, 1.296648, 1, 1, 1, 1, 1,
0.8908784, -0.09540545, 0.04389578, 0, 0, 1, 1, 1,
0.8948135, 0.8920041, 1.287249, 1, 0, 0, 1, 1,
0.9102473, 0.9558836, 1.838442, 1, 0, 0, 1, 1,
0.9117095, 0.3678842, 0.7086154, 1, 0, 0, 1, 1,
0.9128625, -0.8773872, 3.819633, 1, 0, 0, 1, 1,
0.9156501, -0.8608239, 4.113968, 1, 0, 0, 1, 1,
0.9222726, -0.9891295, 1.636835, 0, 0, 0, 1, 1,
0.9295139, 2.436761, 0.7698285, 0, 0, 0, 1, 1,
0.933441, -0.2055906, 1.305358, 0, 0, 0, 1, 1,
0.9368137, -1.041119, 3.814202, 0, 0, 0, 1, 1,
0.9439032, -1.079792, 0.4606058, 0, 0, 0, 1, 1,
0.9445796, -0.1871611, 0.1078688, 0, 0, 0, 1, 1,
0.9498702, -0.6566696, 4.291335, 0, 0, 0, 1, 1,
0.950739, -1.187137, 1.740057, 1, 1, 1, 1, 1,
0.9514218, -0.1785618, 0.8218982, 1, 1, 1, 1, 1,
0.9534881, -0.4547718, 3.462786, 1, 1, 1, 1, 1,
0.9539042, -2.411784, 2.116094, 1, 1, 1, 1, 1,
0.9558238, 0.1625975, 1.220599, 1, 1, 1, 1, 1,
0.9564346, 1.987187, -1.388128, 1, 1, 1, 1, 1,
0.9582064, 1.798791, -0.6715623, 1, 1, 1, 1, 1,
0.9718564, 0.2553303, 1.706517, 1, 1, 1, 1, 1,
0.9723186, -0.2772067, 1.813321, 1, 1, 1, 1, 1,
0.9746105, 1.288501, 2.774026, 1, 1, 1, 1, 1,
0.9763474, -0.03649393, 1.463598, 1, 1, 1, 1, 1,
0.9793427, 1.072277, -0.5124529, 1, 1, 1, 1, 1,
0.9854349, 0.6851515, 0.8244886, 1, 1, 1, 1, 1,
0.9877812, -0.6523883, 3.121927, 1, 1, 1, 1, 1,
0.989945, -1.086856, 3.672261, 1, 1, 1, 1, 1,
0.9905306, 1.616566, 1.339092, 0, 0, 1, 1, 1,
0.9978208, 0.1558578, 2.203191, 1, 0, 0, 1, 1,
1.00437, -0.1486471, 1.784689, 1, 0, 0, 1, 1,
1.008632, -0.375306, 2.303999, 1, 0, 0, 1, 1,
1.021188, -0.4661578, 1.271818, 1, 0, 0, 1, 1,
1.021861, -1.98061, 2.703678, 1, 0, 0, 1, 1,
1.024674, 0.3304928, 1.173336, 0, 0, 0, 1, 1,
1.026952, -0.02103517, 1.297376, 0, 0, 0, 1, 1,
1.044493, 0.4810058, -0.01020207, 0, 0, 0, 1, 1,
1.044621, 0.1429256, 2.015119, 0, 0, 0, 1, 1,
1.047388, 0.5064452, 1.205206, 0, 0, 0, 1, 1,
1.050049, 0.3144871, -0.06776426, 0, 0, 0, 1, 1,
1.050671, 1.127617, 0.7553136, 0, 0, 0, 1, 1,
1.059634, -0.7051017, 2.821809, 1, 1, 1, 1, 1,
1.061072, -1.805182, 2.16513, 1, 1, 1, 1, 1,
1.06937, -0.2634541, 0.8176305, 1, 1, 1, 1, 1,
1.077846, 1.427101, 1.896663, 1, 1, 1, 1, 1,
1.081692, -0.569149, 2.455298, 1, 1, 1, 1, 1,
1.083774, 0.3433716, 1.127108, 1, 1, 1, 1, 1,
1.086593, 0.8989287, 0.3658132, 1, 1, 1, 1, 1,
1.093983, 0.5887244, 0.4695, 1, 1, 1, 1, 1,
1.106894, -0.2851592, 2.286088, 1, 1, 1, 1, 1,
1.112662, -0.3562663, 0.3142847, 1, 1, 1, 1, 1,
1.121999, -0.03131471, 0.8145946, 1, 1, 1, 1, 1,
1.128029, -0.0304038, 0.8846106, 1, 1, 1, 1, 1,
1.130685, 2.280443, 0.5419872, 1, 1, 1, 1, 1,
1.133948, -0.8634625, 2.664799, 1, 1, 1, 1, 1,
1.140263, 0.7803124, 1.186998, 1, 1, 1, 1, 1,
1.146508, 0.6275838, 1.441736, 0, 0, 1, 1, 1,
1.155057, -0.2577511, 0.5711244, 1, 0, 0, 1, 1,
1.15613, 1.131532, 0.4209222, 1, 0, 0, 1, 1,
1.159131, 1.18506, 0.3740226, 1, 0, 0, 1, 1,
1.175135, 1.599603, 0.2716331, 1, 0, 0, 1, 1,
1.18304, -0.9048442, 1.942916, 1, 0, 0, 1, 1,
1.188538, -1.293437, 2.370358, 0, 0, 0, 1, 1,
1.190667, 0.2057057, 0.4604494, 0, 0, 0, 1, 1,
1.195079, 0.3265965, 1.56034, 0, 0, 0, 1, 1,
1.200258, -0.7364467, 2.696484, 0, 0, 0, 1, 1,
1.207771, 0.6926767, -0.134787, 0, 0, 0, 1, 1,
1.221949, 0.7518293, 1.682878, 0, 0, 0, 1, 1,
1.232219, -0.5832514, 3.539288, 0, 0, 0, 1, 1,
1.238228, -0.4391442, -0.1015341, 1, 1, 1, 1, 1,
1.248941, -0.02514993, 2.063408, 1, 1, 1, 1, 1,
1.25472, 0.8146812, 2.874461, 1, 1, 1, 1, 1,
1.257489, -1.860444, 1.803701, 1, 1, 1, 1, 1,
1.260193, 0.1288694, 1.879108, 1, 1, 1, 1, 1,
1.267675, -0.7402977, 1.830099, 1, 1, 1, 1, 1,
1.274595, -1.017648, 0.8533338, 1, 1, 1, 1, 1,
1.2836, 0.3017279, 0.736397, 1, 1, 1, 1, 1,
1.287249, 2.012681, -1.229059, 1, 1, 1, 1, 1,
1.289326, 0.07679798, 0.1739885, 1, 1, 1, 1, 1,
1.29211, 1.089414, -0.9181224, 1, 1, 1, 1, 1,
1.296084, 0.4989798, -0.2395534, 1, 1, 1, 1, 1,
1.310857, 0.6002874, 3.530928, 1, 1, 1, 1, 1,
1.311618, 0.6271265, -0.3307868, 1, 1, 1, 1, 1,
1.319167, -0.8718535, 1.83725, 1, 1, 1, 1, 1,
1.327252, 0.2784781, 1.19415, 0, 0, 1, 1, 1,
1.328225, 0.7301651, 0.1000952, 1, 0, 0, 1, 1,
1.328685, 0.4937622, 0.2929983, 1, 0, 0, 1, 1,
1.329679, 0.1487969, 2.902512, 1, 0, 0, 1, 1,
1.332242, 0.2937516, 2.509105, 1, 0, 0, 1, 1,
1.342074, 0.1952521, -0.4483719, 1, 0, 0, 1, 1,
1.346939, -0.6011049, 2.834253, 0, 0, 0, 1, 1,
1.351886, 0.9631504, 0.8121784, 0, 0, 0, 1, 1,
1.358381, 0.1498805, 0.2960212, 0, 0, 0, 1, 1,
1.361567, -0.5889404, 2.420974, 0, 0, 0, 1, 1,
1.370157, -0.9862733, 1.955647, 0, 0, 0, 1, 1,
1.37194, 0.8020383, -1.246295, 0, 0, 0, 1, 1,
1.378307, 1.632366, -2.347553, 0, 0, 0, 1, 1,
1.405663, 2.645316, -1.010123, 1, 1, 1, 1, 1,
1.408127, 0.9783623, 1.112549, 1, 1, 1, 1, 1,
1.418522, -0.1735088, 2.091658, 1, 1, 1, 1, 1,
1.424388, -0.5111358, 1.605392, 1, 1, 1, 1, 1,
1.433615, -0.31053, 2.453138, 1, 1, 1, 1, 1,
1.438617, 0.4489005, -0.09878226, 1, 1, 1, 1, 1,
1.442604, 2.618626, 0.07767923, 1, 1, 1, 1, 1,
1.443721, -0.4028769, 2.082118, 1, 1, 1, 1, 1,
1.463074, 0.5011218, 0.6937685, 1, 1, 1, 1, 1,
1.490385, 0.2569973, 2.463736, 1, 1, 1, 1, 1,
1.490752, -1.413986, 2.194297, 1, 1, 1, 1, 1,
1.492258, -1.661763, 2.020036, 1, 1, 1, 1, 1,
1.497388, -0.6882638, 2.156092, 1, 1, 1, 1, 1,
1.51638, 0.2400892, -0.1973212, 1, 1, 1, 1, 1,
1.536773, -0.03077701, 0.6094384, 1, 1, 1, 1, 1,
1.537178, -0.4706565, 0.9630474, 0, 0, 1, 1, 1,
1.539945, 1.628639, -0.3039508, 1, 0, 0, 1, 1,
1.539973, 0.9415887, 0.8971469, 1, 0, 0, 1, 1,
1.544166, 0.1007634, 2.360003, 1, 0, 0, 1, 1,
1.550401, 1.586197, -0.3230958, 1, 0, 0, 1, 1,
1.553214, -0.3648554, 2.297271, 1, 0, 0, 1, 1,
1.585742, -1.329703, 1.322676, 0, 0, 0, 1, 1,
1.605087, 1.669245, 0.6989679, 0, 0, 0, 1, 1,
1.611145, 0.6439933, 0.5389682, 0, 0, 0, 1, 1,
1.615627, -0.7169353, 1.654434, 0, 0, 0, 1, 1,
1.620664, 0.4385704, 2.500845, 0, 0, 0, 1, 1,
1.622822, 0.3035989, 2.128685, 0, 0, 0, 1, 1,
1.634361, -0.8893024, 1.66609, 0, 0, 0, 1, 1,
1.64062, 0.5666409, 1.861693, 1, 1, 1, 1, 1,
1.640801, -0.03011617, 1.48022, 1, 1, 1, 1, 1,
1.656681, -0.5121755, 3.067518, 1, 1, 1, 1, 1,
1.670116, -0.1757355, 0.01219036, 1, 1, 1, 1, 1,
1.684979, 0.818902, 0.443646, 1, 1, 1, 1, 1,
1.686484, 0.6637077, 0.2957425, 1, 1, 1, 1, 1,
1.698258, -0.6769454, 2.63704, 1, 1, 1, 1, 1,
1.711269, 0.7741811, 0.6967895, 1, 1, 1, 1, 1,
1.715452, -0.7703706, 3.185532, 1, 1, 1, 1, 1,
1.719992, -1.052109, 1.241819, 1, 1, 1, 1, 1,
1.722676, -0.5944818, 3.05507, 1, 1, 1, 1, 1,
1.739561, 2.053977, 0.00623498, 1, 1, 1, 1, 1,
1.742409, 0.1970981, 4.073002, 1, 1, 1, 1, 1,
1.74318, -0.404079, 2.155772, 1, 1, 1, 1, 1,
1.752665, 0.5592718, 2.516417, 1, 1, 1, 1, 1,
1.768843, -0.5058533, 2.003189, 0, 0, 1, 1, 1,
1.769233, 1.247187, -0.01428836, 1, 0, 0, 1, 1,
1.772805, -1.80991, 3.72178, 1, 0, 0, 1, 1,
1.78633, -0.3436594, -0.5244869, 1, 0, 0, 1, 1,
1.787083, -0.4927447, 1.342308, 1, 0, 0, 1, 1,
1.799574, -0.06125789, 1.856878, 1, 0, 0, 1, 1,
1.80675, 1.342231, -0.6122742, 0, 0, 0, 1, 1,
1.806761, -0.5877879, 0.5520419, 0, 0, 0, 1, 1,
1.82296, 0.3230691, -0.02953747, 0, 0, 0, 1, 1,
1.838132, -0.5360088, 3.782109, 0, 0, 0, 1, 1,
1.897967, -1.398133, 2.956998, 0, 0, 0, 1, 1,
1.898974, 1.100995, -0.06613152, 0, 0, 0, 1, 1,
1.912217, -0.8617405, 2.198414, 0, 0, 0, 1, 1,
1.919868, -0.08278227, 0.718195, 1, 1, 1, 1, 1,
1.960528, 0.562642, 0.2450043, 1, 1, 1, 1, 1,
1.962508, 2.770255, 0.4480601, 1, 1, 1, 1, 1,
1.965857, 1.711867, 0.9018307, 1, 1, 1, 1, 1,
1.971768, -0.1259337, 3.008809, 1, 1, 1, 1, 1,
2.00572, -1.073796, 2.234992, 1, 1, 1, 1, 1,
2.017119, -0.6457781, 2.273401, 1, 1, 1, 1, 1,
2.019072, 1.112103, 0.6034874, 1, 1, 1, 1, 1,
2.021128, -0.8165148, 1.904556, 1, 1, 1, 1, 1,
2.034565, -0.8226724, 1.519761, 1, 1, 1, 1, 1,
2.069837, 0.5001504, 3.180539, 1, 1, 1, 1, 1,
2.083451, -0.2855444, 1.351628, 1, 1, 1, 1, 1,
2.114631, -1.146732, 2.274137, 1, 1, 1, 1, 1,
2.130584, -0.4299312, 1.02916, 1, 1, 1, 1, 1,
2.138834, 0.120199, 1.203011, 1, 1, 1, 1, 1,
2.158258, -0.7688565, 2.489982, 0, 0, 1, 1, 1,
2.161052, 0.438486, -0.6758636, 1, 0, 0, 1, 1,
2.177716, -0.1376026, 1.118337, 1, 0, 0, 1, 1,
2.234719, -0.3566926, 2.16357, 1, 0, 0, 1, 1,
2.240728, -0.8200656, 2.298921, 1, 0, 0, 1, 1,
2.247474, 0.6765903, 1.850797, 1, 0, 0, 1, 1,
2.257802, 1.493951, 0.4137228, 0, 0, 0, 1, 1,
2.297224, 1.331489, -0.3924709, 0, 0, 0, 1, 1,
2.454823, -0.5550183, 0.2916916, 0, 0, 0, 1, 1,
2.459318, -1.156943, 0.7929845, 0, 0, 0, 1, 1,
2.462432, -0.3463898, -0.2891181, 0, 0, 0, 1, 1,
2.63511, 0.6903573, 1.228, 0, 0, 0, 1, 1,
2.638723, 0.7688795, 0.5137343, 0, 0, 0, 1, 1,
2.67298, 0.1713402, 0.2759129, 1, 1, 1, 1, 1,
2.743901, 0.2855158, 1.619927, 1, 1, 1, 1, 1,
2.762035, 0.9904042, 0.7552487, 1, 1, 1, 1, 1,
2.7726, -0.5779334, 1.644571, 1, 1, 1, 1, 1,
3.047604, 0.08694433, 1.506339, 1, 1, 1, 1, 1,
3.295422, 0.591959, 1.86852, 1, 1, 1, 1, 1,
3.382472, 1.997952, 0.1269315, 1, 1, 1, 1, 1
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
var radius = 9.786611;
var distance = 34.37506;
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
mvMatrix.translate( -0.1792576, -0.2949061, -0.07479882 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.37506);
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