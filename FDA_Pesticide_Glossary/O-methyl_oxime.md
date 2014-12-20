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
-3.189485, -0.8512175, -2.913539, 1, 0, 0, 1,
-2.903918, -1.061255, -0.3544622, 1, 0.007843138, 0, 1,
-2.880413, -0.9758554, -2.830906, 1, 0.01176471, 0, 1,
-2.825956, -0.3027408, -1.49294, 1, 0.01960784, 0, 1,
-2.667587, 0.2398395, -1.453514, 1, 0.02352941, 0, 1,
-2.657212, -1.256069, -3.234987, 1, 0.03137255, 0, 1,
-2.643589, 0.9036141, -1.738635, 1, 0.03529412, 0, 1,
-2.612584, -0.2634543, -0.7743307, 1, 0.04313726, 0, 1,
-2.589381, 0.2633865, -2.010018, 1, 0.04705882, 0, 1,
-2.553853, 0.5036691, -3.011236, 1, 0.05490196, 0, 1,
-2.531055, -0.2288458, -1.528422, 1, 0.05882353, 0, 1,
-2.438454, 1.064116, -1.093654, 1, 0.06666667, 0, 1,
-2.400677, 0.1276781, -1.717904, 1, 0.07058824, 0, 1,
-2.378651, -0.538146, -0.7204551, 1, 0.07843138, 0, 1,
-2.318421, 0.6630746, -1.320299, 1, 0.08235294, 0, 1,
-2.193832, -0.954107, -0.9639937, 1, 0.09019608, 0, 1,
-2.164823, -0.1504935, 0.3975101, 1, 0.09411765, 0, 1,
-2.161687, 2.041696, -0.2271083, 1, 0.1019608, 0, 1,
-2.150336, -0.4290102, -2.901868, 1, 0.1098039, 0, 1,
-2.130226, 0.5102307, -1.113682, 1, 0.1137255, 0, 1,
-2.098221, 1.115838, -0.880398, 1, 0.1215686, 0, 1,
-2.087444, 0.9426995, -1.897543, 1, 0.1254902, 0, 1,
-2.081288, 1.954294, -0.3637991, 1, 0.1333333, 0, 1,
-2.050148, -0.2208631, -1.339342, 1, 0.1372549, 0, 1,
-2.041235, -0.7679775, -1.153253, 1, 0.145098, 0, 1,
-2.032335, -0.1495866, -1.462135, 1, 0.1490196, 0, 1,
-1.988468, -0.5272658, -1.838303, 1, 0.1568628, 0, 1,
-1.982421, 0.2993883, -1.770394, 1, 0.1607843, 0, 1,
-1.948649, 0.001805688, -2.774294, 1, 0.1686275, 0, 1,
-1.94049, 0.5156457, -1.335681, 1, 0.172549, 0, 1,
-1.936279, 0.4265755, -0.5559178, 1, 0.1803922, 0, 1,
-1.933179, -0.2721645, -0.900268, 1, 0.1843137, 0, 1,
-1.925428, -0.5862495, -4.870999, 1, 0.1921569, 0, 1,
-1.92404, -0.7095811, -1.152587, 1, 0.1960784, 0, 1,
-1.91131, -0.6832521, -3.28435, 1, 0.2039216, 0, 1,
-1.911105, -0.2699456, -0.4441463, 1, 0.2117647, 0, 1,
-1.865183, -0.079568, -0.4248655, 1, 0.2156863, 0, 1,
-1.859228, 0.7037306, -1.678874, 1, 0.2235294, 0, 1,
-1.839174, -0.06207695, -1.004588, 1, 0.227451, 0, 1,
-1.830252, 0.3467735, -1.555697, 1, 0.2352941, 0, 1,
-1.801597, -0.4539621, -2.149039, 1, 0.2392157, 0, 1,
-1.800779, -1.148974, -3.094113, 1, 0.2470588, 0, 1,
-1.793953, 0.145253, -3.507385, 1, 0.2509804, 0, 1,
-1.78755, 0.7657626, -2.855299, 1, 0.2588235, 0, 1,
-1.782258, 0.5629726, -0.4185172, 1, 0.2627451, 0, 1,
-1.778258, -0.8921745, -2.002418, 1, 0.2705882, 0, 1,
-1.777471, -0.6713881, -1.880025, 1, 0.2745098, 0, 1,
-1.777073, -1.306099, -2.841304, 1, 0.282353, 0, 1,
-1.759105, 0.0925013, -1.241428, 1, 0.2862745, 0, 1,
-1.734642, -0.5123652, -1.691289, 1, 0.2941177, 0, 1,
-1.730723, -0.3734612, 0.1152183, 1, 0.3019608, 0, 1,
-1.727296, 1.128536, -0.6268756, 1, 0.3058824, 0, 1,
-1.723313, -0.6712242, -3.390259, 1, 0.3137255, 0, 1,
-1.705547, 0.06420168, -1.484627, 1, 0.3176471, 0, 1,
-1.705202, 1.140164, -0.1030079, 1, 0.3254902, 0, 1,
-1.694081, -0.03220802, -2.424024, 1, 0.3294118, 0, 1,
-1.68608, 0.880463, -0.5275536, 1, 0.3372549, 0, 1,
-1.673126, 1.093279, 0.4728322, 1, 0.3411765, 0, 1,
-1.645165, -0.1855342, -0.6900295, 1, 0.3490196, 0, 1,
-1.637492, 1.258116, -1.081727, 1, 0.3529412, 0, 1,
-1.615052, -0.5498037, -1.181095, 1, 0.3607843, 0, 1,
-1.602489, -1.92545, -0.4082718, 1, 0.3647059, 0, 1,
-1.594734, 1.095457, 1.573566, 1, 0.372549, 0, 1,
-1.592327, -0.2764465, -0.4243928, 1, 0.3764706, 0, 1,
-1.552857, 0.7500966, -2.290083, 1, 0.3843137, 0, 1,
-1.551718, -1.289639, -2.286845, 1, 0.3882353, 0, 1,
-1.542648, -0.551887, -2.084619, 1, 0.3960784, 0, 1,
-1.53732, 1.099458, 0.7958974, 1, 0.4039216, 0, 1,
-1.531744, -1.453408, -2.745951, 1, 0.4078431, 0, 1,
-1.528808, 0.2459883, -1.305698, 1, 0.4156863, 0, 1,
-1.52481, 1.639858, -1.922721, 1, 0.4196078, 0, 1,
-1.511347, 0.3618703, -2.16322, 1, 0.427451, 0, 1,
-1.502587, 1.403497, -1.400577, 1, 0.4313726, 0, 1,
-1.501141, 1.539872, -1.563106, 1, 0.4392157, 0, 1,
-1.482321, 0.3714758, -1.313634, 1, 0.4431373, 0, 1,
-1.481907, -0.4079796, -1.871465, 1, 0.4509804, 0, 1,
-1.472065, -0.2920505, -1.932551, 1, 0.454902, 0, 1,
-1.429959, -0.1906176, -0.2320851, 1, 0.4627451, 0, 1,
-1.428876, 0.9504731, -2.391339, 1, 0.4666667, 0, 1,
-1.40428, -0.2401376, -3.834353, 1, 0.4745098, 0, 1,
-1.398557, -0.01158271, -1.75849, 1, 0.4784314, 0, 1,
-1.385179, -0.4484729, -1.935882, 1, 0.4862745, 0, 1,
-1.38222, -1.247451, -1.586634, 1, 0.4901961, 0, 1,
-1.382161, 0.6205888, -2.380471, 1, 0.4980392, 0, 1,
-1.376031, 0.3376204, -1.824952, 1, 0.5058824, 0, 1,
-1.362363, 0.4390883, -1.163883, 1, 0.509804, 0, 1,
-1.352166, -1.084191, -2.17596, 1, 0.5176471, 0, 1,
-1.343668, -0.7778642, -0.6295025, 1, 0.5215687, 0, 1,
-1.339453, 0.7523029, -1.29647, 1, 0.5294118, 0, 1,
-1.333714, 1.015363, -1.635306, 1, 0.5333334, 0, 1,
-1.332506, -1.031484, -3.445295, 1, 0.5411765, 0, 1,
-1.331456, 1.284814, -0.8832274, 1, 0.5450981, 0, 1,
-1.323767, -0.03937491, -2.07006, 1, 0.5529412, 0, 1,
-1.321649, 1.013872, -2.317893, 1, 0.5568628, 0, 1,
-1.315609, 0.5592194, -0.3165292, 1, 0.5647059, 0, 1,
-1.31503, 0.02531803, -1.388573, 1, 0.5686275, 0, 1,
-1.31085, -0.6185736, -2.114994, 1, 0.5764706, 0, 1,
-1.302845, -0.4056925, -3.536508, 1, 0.5803922, 0, 1,
-1.279524, -0.9447362, -0.835743, 1, 0.5882353, 0, 1,
-1.271177, -0.5211793, -3.912721, 1, 0.5921569, 0, 1,
-1.261808, 2.398502, -0.3187175, 1, 0.6, 0, 1,
-1.234545, 0.5012239, -1.814768, 1, 0.6078432, 0, 1,
-1.232526, 0.1283002, -1.965227, 1, 0.6117647, 0, 1,
-1.228489, 0.4129213, -1.518208, 1, 0.6196079, 0, 1,
-1.21334, 0.4354869, -1.562407, 1, 0.6235294, 0, 1,
-1.212797, -0.05081677, -1.326967, 1, 0.6313726, 0, 1,
-1.207933, 0.2297371, -2.80251, 1, 0.6352941, 0, 1,
-1.20437, 1.032259, -2.038116, 1, 0.6431373, 0, 1,
-1.201002, 1.832272, -0.3010498, 1, 0.6470588, 0, 1,
-1.199872, -0.951416, -0.9687619, 1, 0.654902, 0, 1,
-1.184303, 1.462787, -1.194728, 1, 0.6588235, 0, 1,
-1.176029, -1.745911, -1.528564, 1, 0.6666667, 0, 1,
-1.159866, -0.6083058, -3.178589, 1, 0.6705883, 0, 1,
-1.156654, -0.6091064, -2.44121, 1, 0.6784314, 0, 1,
-1.153791, -0.633012, -2.612663, 1, 0.682353, 0, 1,
-1.147645, -1.074222, -1.510945, 1, 0.6901961, 0, 1,
-1.144007, 1.398176, -0.6282062, 1, 0.6941177, 0, 1,
-1.141926, 0.07295882, -1.278435, 1, 0.7019608, 0, 1,
-1.140152, -0.7662911, -2.180735, 1, 0.7098039, 0, 1,
-1.128706, 1.00764, -2.4764, 1, 0.7137255, 0, 1,
-1.125585, -2.193171, -2.713644, 1, 0.7215686, 0, 1,
-1.125235, 0.1987186, -1.646477, 1, 0.7254902, 0, 1,
-1.118001, -0.6203854, -2.853831, 1, 0.7333333, 0, 1,
-1.117491, 0.2951157, -1.515951, 1, 0.7372549, 0, 1,
-1.110178, 0.4290599, -1.264112, 1, 0.7450981, 0, 1,
-1.108491, 1.030519, -1.304563, 1, 0.7490196, 0, 1,
-1.104649, 0.9551843, 0.3180649, 1, 0.7568628, 0, 1,
-1.10437, 0.062952, -0.2283879, 1, 0.7607843, 0, 1,
-1.102969, 1.028808, -1.459635, 1, 0.7686275, 0, 1,
-1.08358, -0.7690931, -2.834484, 1, 0.772549, 0, 1,
-1.059518, 2.424638, -0.7197186, 1, 0.7803922, 0, 1,
-1.055323, -0.3298302, -1.771968, 1, 0.7843137, 0, 1,
-1.040958, -0.06006997, -1.349228, 1, 0.7921569, 0, 1,
-1.032495, -1.60742, -3.772432, 1, 0.7960784, 0, 1,
-1.03232, -0.1671253, -0.7337871, 1, 0.8039216, 0, 1,
-1.026642, -1.670162, -2.554725, 1, 0.8117647, 0, 1,
-1.024701, -0.2361144, -1.214807, 1, 0.8156863, 0, 1,
-1.023085, -1.15462, -4.522374, 1, 0.8235294, 0, 1,
-1.019772, -1.389511, -4.003076, 1, 0.827451, 0, 1,
-1.017415, -0.4514924, -3.409987, 1, 0.8352941, 0, 1,
-1.006275, 1.036251, 0.1277658, 1, 0.8392157, 0, 1,
-1.003391, -1.494084, -3.167856, 1, 0.8470588, 0, 1,
-0.9981308, -0.2800568, -2.45421, 1, 0.8509804, 0, 1,
-0.9960212, 0.3090515, -0.07069759, 1, 0.8588235, 0, 1,
-0.9944617, -1.045618, -3.110559, 1, 0.8627451, 0, 1,
-0.9919025, 0.5505424, -0.9446234, 1, 0.8705882, 0, 1,
-0.98884, 0.1932643, -1.475699, 1, 0.8745098, 0, 1,
-0.9886517, -0.05851424, -0.6795373, 1, 0.8823529, 0, 1,
-0.9885806, 1.480085, -0.3097045, 1, 0.8862745, 0, 1,
-0.9760264, 0.1135127, -0.9324233, 1, 0.8941177, 0, 1,
-0.9741625, 1.469628, -1.454506, 1, 0.8980392, 0, 1,
-0.9721978, 0.2405834, -2.967299, 1, 0.9058824, 0, 1,
-0.9721639, -1.073353, -2.058262, 1, 0.9137255, 0, 1,
-0.9691431, 0.2524383, -1.81422, 1, 0.9176471, 0, 1,
-0.968994, -0.469343, -2.592753, 1, 0.9254902, 0, 1,
-0.968102, 1.621943, -1.470276, 1, 0.9294118, 0, 1,
-0.9638139, -0.567578, -2.064473, 1, 0.9372549, 0, 1,
-0.9436613, 0.7147872, -2.01683, 1, 0.9411765, 0, 1,
-0.9363427, -0.1718697, -0.2735008, 1, 0.9490196, 0, 1,
-0.9351147, 0.2854301, -2.05144, 1, 0.9529412, 0, 1,
-0.9342801, 1.809935, -1.240127, 1, 0.9607843, 0, 1,
-0.9329804, 0.3996963, -2.513351, 1, 0.9647059, 0, 1,
-0.9318272, 0.812981, -1.297586, 1, 0.972549, 0, 1,
-0.9315333, 0.2779033, -1.324076, 1, 0.9764706, 0, 1,
-0.9170945, 0.1968619, -3.527336, 1, 0.9843137, 0, 1,
-0.8959535, -0.9041435, -3.163999, 1, 0.9882353, 0, 1,
-0.8949394, -0.3702872, -3.537141, 1, 0.9960784, 0, 1,
-0.8877477, -1.582083, -3.381284, 0.9960784, 1, 0, 1,
-0.8861287, 1.545399, -1.292197, 0.9921569, 1, 0, 1,
-0.8812943, 1.807676, -0.8309962, 0.9843137, 1, 0, 1,
-0.8806501, 1.532031, -1.168333, 0.9803922, 1, 0, 1,
-0.8767735, -0.4399605, -1.390855, 0.972549, 1, 0, 1,
-0.8755435, -0.355108, 0.9158406, 0.9686275, 1, 0, 1,
-0.8650705, 0.569459, -1.425663, 0.9607843, 1, 0, 1,
-0.8633324, 0.9806958, -0.1729419, 0.9568627, 1, 0, 1,
-0.8594662, -0.1532599, -1.309232, 0.9490196, 1, 0, 1,
-0.8591087, -0.0661694, -1.493238, 0.945098, 1, 0, 1,
-0.8581064, 1.446965, 0.6351262, 0.9372549, 1, 0, 1,
-0.8559306, 0.7620645, -0.1405837, 0.9333333, 1, 0, 1,
-0.8536351, 1.617983, -1.512799, 0.9254902, 1, 0, 1,
-0.8503467, 1.775063, -0.3663166, 0.9215686, 1, 0, 1,
-0.8473222, -0.1087576, -0.1604783, 0.9137255, 1, 0, 1,
-0.8378927, -1.497543, -1.534484, 0.9098039, 1, 0, 1,
-0.837634, -1.959891, -0.6020989, 0.9019608, 1, 0, 1,
-0.8341997, 0.569505, -1.84913, 0.8941177, 1, 0, 1,
-0.8300896, -0.6819274, -1.4996, 0.8901961, 1, 0, 1,
-0.8240049, 0.7765561, -0.02030444, 0.8823529, 1, 0, 1,
-0.8237352, 1.546862, 0.4703516, 0.8784314, 1, 0, 1,
-0.8203219, -1.126294, -2.145716, 0.8705882, 1, 0, 1,
-0.8174304, -1.61908, -2.069394, 0.8666667, 1, 0, 1,
-0.8164729, 0.004920417, -0.7773322, 0.8588235, 1, 0, 1,
-0.8158856, -1.632564, -1.519365, 0.854902, 1, 0, 1,
-0.8140884, -1.025044, -3.031303, 0.8470588, 1, 0, 1,
-0.8122447, 0.983057, 1.427755, 0.8431373, 1, 0, 1,
-0.8111279, 0.08177771, -0.5139759, 0.8352941, 1, 0, 1,
-0.8058472, 0.6875456, -1.323694, 0.8313726, 1, 0, 1,
-0.8020242, -0.7491238, -1.990231, 0.8235294, 1, 0, 1,
-0.8012385, 0.1209406, -1.639951, 0.8196079, 1, 0, 1,
-0.7982174, 0.1632783, -2.692673, 0.8117647, 1, 0, 1,
-0.7960831, 1.372655, -0.3647509, 0.8078431, 1, 0, 1,
-0.7945037, -0.5045505, -2.864869, 0.8, 1, 0, 1,
-0.7931452, 0.4398596, -0.5443111, 0.7921569, 1, 0, 1,
-0.792914, -0.6607946, -2.099944, 0.7882353, 1, 0, 1,
-0.7888141, -1.050785, -2.727624, 0.7803922, 1, 0, 1,
-0.7879838, -1.190138, -3.201912, 0.7764706, 1, 0, 1,
-0.7876573, 0.4561091, -1.651702, 0.7686275, 1, 0, 1,
-0.7868286, -0.6621481, -2.372304, 0.7647059, 1, 0, 1,
-0.7844816, -0.6615482, -3.761447, 0.7568628, 1, 0, 1,
-0.7803754, -0.6344836, -1.483378, 0.7529412, 1, 0, 1,
-0.7801642, -0.8731882, -2.327259, 0.7450981, 1, 0, 1,
-0.7762759, 2.35092, 1.199413, 0.7411765, 1, 0, 1,
-0.7756695, 0.6242521, 0.0927567, 0.7333333, 1, 0, 1,
-0.7745949, 0.06919052, -1.479034, 0.7294118, 1, 0, 1,
-0.7700801, 1.30419, 1.275542, 0.7215686, 1, 0, 1,
-0.7645947, 0.6060096, -0.1791062, 0.7176471, 1, 0, 1,
-0.7629471, -1.387047, -2.051815, 0.7098039, 1, 0, 1,
-0.7624745, -1.346848, -0.7145453, 0.7058824, 1, 0, 1,
-0.7619118, -1.239631, -2.615515, 0.6980392, 1, 0, 1,
-0.75946, -0.5826385, -3.227752, 0.6901961, 1, 0, 1,
-0.7522928, -0.04736131, -2.095883, 0.6862745, 1, 0, 1,
-0.7507532, -0.8277357, -2.825824, 0.6784314, 1, 0, 1,
-0.7491032, -0.7711979, -2.914986, 0.6745098, 1, 0, 1,
-0.7427828, -1.012429, -3.184773, 0.6666667, 1, 0, 1,
-0.7427451, -1.983739, -3.083256, 0.6627451, 1, 0, 1,
-0.7419431, -0.1938142, -0.09610151, 0.654902, 1, 0, 1,
-0.7376899, 0.1546444, -2.107107, 0.6509804, 1, 0, 1,
-0.7363713, -0.06413323, -2.137129, 0.6431373, 1, 0, 1,
-0.7304858, 0.2909224, -1.019683, 0.6392157, 1, 0, 1,
-0.7289113, -0.7559881, -2.32729, 0.6313726, 1, 0, 1,
-0.7282233, 0.708843, -0.2535771, 0.627451, 1, 0, 1,
-0.7282001, -0.6956877, -3.546505, 0.6196079, 1, 0, 1,
-0.724371, -1.037615, -1.865848, 0.6156863, 1, 0, 1,
-0.7210999, -1.251409, -3.038129, 0.6078432, 1, 0, 1,
-0.7204071, 1.083057, -0.5928223, 0.6039216, 1, 0, 1,
-0.7183381, -1.220131, -1.323332, 0.5960785, 1, 0, 1,
-0.7142305, -1.192879, -2.663286, 0.5882353, 1, 0, 1,
-0.7135408, 1.206458, -1.03011, 0.5843138, 1, 0, 1,
-0.7096494, 0.8668954, -0.9367581, 0.5764706, 1, 0, 1,
-0.7085542, 1.671852, 2.360243, 0.572549, 1, 0, 1,
-0.7080362, -0.4131796, -1.984546, 0.5647059, 1, 0, 1,
-0.708006, -0.9071939, -4.325438, 0.5607843, 1, 0, 1,
-0.7078068, -1.330048, -1.771544, 0.5529412, 1, 0, 1,
-0.7051656, -0.4550791, -3.509685, 0.5490196, 1, 0, 1,
-0.7004115, 0.1290671, -1.618182, 0.5411765, 1, 0, 1,
-0.698186, 0.02748391, -1.032065, 0.5372549, 1, 0, 1,
-0.6971301, 0.3464031, -0.3615209, 0.5294118, 1, 0, 1,
-0.6955457, -0.567978, -1.093634, 0.5254902, 1, 0, 1,
-0.6914816, 0.8252835, -1.75831, 0.5176471, 1, 0, 1,
-0.6901753, 0.3063318, 0.1348146, 0.5137255, 1, 0, 1,
-0.6899848, 0.08658973, -0.3658139, 0.5058824, 1, 0, 1,
-0.6877758, 1.818663, 0.217141, 0.5019608, 1, 0, 1,
-0.6797577, -0.6475259, -3.384266, 0.4941176, 1, 0, 1,
-0.6767673, 0.5932168, -1.17539, 0.4862745, 1, 0, 1,
-0.6762769, 0.1653416, -0.8056937, 0.4823529, 1, 0, 1,
-0.6736516, 1.820312, -2.021895, 0.4745098, 1, 0, 1,
-0.6687527, -0.6442211, -2.04154, 0.4705882, 1, 0, 1,
-0.6684921, -0.224947, -3.552369, 0.4627451, 1, 0, 1,
-0.6661789, -0.773978, -1.869836, 0.4588235, 1, 0, 1,
-0.6656974, 0.1662595, -1.009535, 0.4509804, 1, 0, 1,
-0.66427, -0.149091, -0.6737354, 0.4470588, 1, 0, 1,
-0.6626431, -1.382454, -1.770524, 0.4392157, 1, 0, 1,
-0.662504, 1.338594, -1.205212, 0.4352941, 1, 0, 1,
-0.6597293, -0.7731588, -1.993165, 0.427451, 1, 0, 1,
-0.6572892, 0.05907389, -0.646427, 0.4235294, 1, 0, 1,
-0.6519805, -1.561189, -2.549938, 0.4156863, 1, 0, 1,
-0.6429769, -0.1522594, -2.291833, 0.4117647, 1, 0, 1,
-0.6391119, -0.8413659, -2.766397, 0.4039216, 1, 0, 1,
-0.637356, 0.8239983, -0.6770731, 0.3960784, 1, 0, 1,
-0.6314275, 1.485766, -0.5651994, 0.3921569, 1, 0, 1,
-0.6263456, 0.7664399, -1.126779, 0.3843137, 1, 0, 1,
-0.6258562, -0.9829788, -3.975781, 0.3803922, 1, 0, 1,
-0.618029, -0.08411523, -2.246459, 0.372549, 1, 0, 1,
-0.6141145, -2.380809, -2.257161, 0.3686275, 1, 0, 1,
-0.6091835, -1.854467, -1.326188, 0.3607843, 1, 0, 1,
-0.6075428, 1.430637, -1.196331, 0.3568628, 1, 0, 1,
-0.6071248, -0.8454389, -1.864646, 0.3490196, 1, 0, 1,
-0.6066671, 0.2967228, -1.364331, 0.345098, 1, 0, 1,
-0.6041683, 0.006610371, -1.966814, 0.3372549, 1, 0, 1,
-0.6040043, -0.4224347, -2.484429, 0.3333333, 1, 0, 1,
-0.6019087, 1.226141, -2.013076, 0.3254902, 1, 0, 1,
-0.5957133, 0.5657388, 0.5227138, 0.3215686, 1, 0, 1,
-0.5949288, 0.796872, -2.027891, 0.3137255, 1, 0, 1,
-0.5890949, 0.298294, -1.053802, 0.3098039, 1, 0, 1,
-0.5836836, -0.3446011, -2.056946, 0.3019608, 1, 0, 1,
-0.5749469, 1.459924, 0.04833821, 0.2941177, 1, 0, 1,
-0.5646588, -0.7669452, -2.721523, 0.2901961, 1, 0, 1,
-0.5631744, -1.069981, -3.010378, 0.282353, 1, 0, 1,
-0.5541686, -0.1079645, -3.115035, 0.2784314, 1, 0, 1,
-0.5347518, -1.16711, -2.5497, 0.2705882, 1, 0, 1,
-0.5326538, 0.01304725, -0.74167, 0.2666667, 1, 0, 1,
-0.5274637, 0.134462, -1.253589, 0.2588235, 1, 0, 1,
-0.5271431, -0.9688911, -1.553055, 0.254902, 1, 0, 1,
-0.5250674, -0.2930513, -2.363642, 0.2470588, 1, 0, 1,
-0.52294, 1.040443, 2.426702, 0.2431373, 1, 0, 1,
-0.5194968, -0.2437876, -2.619596, 0.2352941, 1, 0, 1,
-0.5187016, -2.013613, -4.215437, 0.2313726, 1, 0, 1,
-0.508208, 2.323324, 0.4931011, 0.2235294, 1, 0, 1,
-0.5080728, -0.2233089, -2.089031, 0.2196078, 1, 0, 1,
-0.5060206, -0.1659044, -2.41487, 0.2117647, 1, 0, 1,
-0.5048548, -1.057247, -2.685172, 0.2078431, 1, 0, 1,
-0.5000385, 1.591724, -2.474447, 0.2, 1, 0, 1,
-0.4965577, -1.385465, -0.966145, 0.1921569, 1, 0, 1,
-0.4921212, -0.8415467, -3.144838, 0.1882353, 1, 0, 1,
-0.491729, -1.121215, -3.948474, 0.1803922, 1, 0, 1,
-0.4890545, 1.047914, 0.5947628, 0.1764706, 1, 0, 1,
-0.4879099, 0.2409199, -3.305722, 0.1686275, 1, 0, 1,
-0.4869561, -1.581136, -2.88834, 0.1647059, 1, 0, 1,
-0.4864371, -1.462871, -3.69871, 0.1568628, 1, 0, 1,
-0.4811119, -1.216761, -3.181822, 0.1529412, 1, 0, 1,
-0.4790453, -1.713441, -3.531145, 0.145098, 1, 0, 1,
-0.4736999, -0.3070149, -2.110959, 0.1411765, 1, 0, 1,
-0.4705138, -0.05437906, -0.8519486, 0.1333333, 1, 0, 1,
-0.4687945, -0.1572215, -1.297948, 0.1294118, 1, 0, 1,
-0.4676228, -1.384593, -2.28722, 0.1215686, 1, 0, 1,
-0.4674347, -0.6931766, -1.9362, 0.1176471, 1, 0, 1,
-0.4665512, 0.08013479, -1.117845, 0.1098039, 1, 0, 1,
-0.4622689, 0.1810153, -3.535664, 0.1058824, 1, 0, 1,
-0.4606098, 0.6520657, 0.924378, 0.09803922, 1, 0, 1,
-0.4592701, 1.734878, -0.7833678, 0.09019608, 1, 0, 1,
-0.4561698, 0.483327, -1.134337, 0.08627451, 1, 0, 1,
-0.4525334, -0.04248989, -0.5029718, 0.07843138, 1, 0, 1,
-0.4474953, 1.105393, -1.362912, 0.07450981, 1, 0, 1,
-0.446667, 2.049488, 0.2778723, 0.06666667, 1, 0, 1,
-0.4465637, 0.6815845, 0.3419492, 0.0627451, 1, 0, 1,
-0.440008, -0.05178462, -0.9136631, 0.05490196, 1, 0, 1,
-0.4371161, 0.3515294, -2.486833, 0.05098039, 1, 0, 1,
-0.4343271, 1.255277, 0.4164726, 0.04313726, 1, 0, 1,
-0.4311977, 1.045446, 0.3892428, 0.03921569, 1, 0, 1,
-0.4244221, -0.3768649, -5.108101, 0.03137255, 1, 0, 1,
-0.4220068, -0.3357894, -2.107919, 0.02745098, 1, 0, 1,
-0.4196575, 0.1521693, -1.127241, 0.01960784, 1, 0, 1,
-0.4159303, -0.9234992, -2.753945, 0.01568628, 1, 0, 1,
-0.4152652, -0.5288495, -2.252735, 0.007843138, 1, 0, 1,
-0.4114256, 0.03411123, -1.686855, 0.003921569, 1, 0, 1,
-0.4086985, 1.08263, 0.1344829, 0, 1, 0.003921569, 1,
-0.4065774, 0.1039971, -1.030662, 0, 1, 0.01176471, 1,
-0.4034306, 2.179463, -1.352326, 0, 1, 0.01568628, 1,
-0.4010186, 1.502099, -0.2879966, 0, 1, 0.02352941, 1,
-0.3997662, -0.7364543, -2.228889, 0, 1, 0.02745098, 1,
-0.3991891, -0.2251615, -3.572, 0, 1, 0.03529412, 1,
-0.3989949, 0.1265997, -1.012946, 0, 1, 0.03921569, 1,
-0.397148, -1.243105, -1.637895, 0, 1, 0.04705882, 1,
-0.3958911, -0.1930824, -1.246692, 0, 1, 0.05098039, 1,
-0.391716, 0.5577739, -0.5766956, 0, 1, 0.05882353, 1,
-0.3907834, 0.9545622, 0.2755327, 0, 1, 0.0627451, 1,
-0.3901694, 0.802427, -0.3747547, 0, 1, 0.07058824, 1,
-0.3855178, -1.066391, -3.685816, 0, 1, 0.07450981, 1,
-0.3842582, -0.7354689, -2.580473, 0, 1, 0.08235294, 1,
-0.3840368, 1.775167, -1.163621, 0, 1, 0.08627451, 1,
-0.3824172, 0.7832804, -1.275052, 0, 1, 0.09411765, 1,
-0.3820292, 0.8898752, -2.803765, 0, 1, 0.1019608, 1,
-0.3813363, -0.5762663, -2.376332, 0, 1, 0.1058824, 1,
-0.3787149, -0.2420343, -0.8890179, 0, 1, 0.1137255, 1,
-0.3769794, -1.318331, -3.243438, 0, 1, 0.1176471, 1,
-0.3753666, 0.4736532, -0.3603922, 0, 1, 0.1254902, 1,
-0.3751229, -0.1671654, -1.03907, 0, 1, 0.1294118, 1,
-0.3743409, -2.243943, -4.093981, 0, 1, 0.1372549, 1,
-0.3729439, -1.792118, -2.898962, 0, 1, 0.1411765, 1,
-0.3704567, 1.242017, 0.03696562, 0, 1, 0.1490196, 1,
-0.3679744, -0.05333391, -2.354695, 0, 1, 0.1529412, 1,
-0.3664684, 1.715154, 0.5315287, 0, 1, 0.1607843, 1,
-0.3653899, 0.1161185, -2.895782, 0, 1, 0.1647059, 1,
-0.3638653, 1.546077, -0.330263, 0, 1, 0.172549, 1,
-0.3637564, 0.9442196, -1.096748, 0, 1, 0.1764706, 1,
-0.3610653, 0.6212034, -0.1041307, 0, 1, 0.1843137, 1,
-0.3580934, -1.978138, -3.407641, 0, 1, 0.1882353, 1,
-0.3558049, 1.626797, 0.3736541, 0, 1, 0.1960784, 1,
-0.3549986, -0.5193164, -1.323436, 0, 1, 0.2039216, 1,
-0.3538747, -0.8577218, -4.300222, 0, 1, 0.2078431, 1,
-0.3530783, 1.485771, 0.940335, 0, 1, 0.2156863, 1,
-0.3507684, -0.3871163, -3.253974, 0, 1, 0.2196078, 1,
-0.3507625, -0.704278, -1.362865, 0, 1, 0.227451, 1,
-0.3502993, 0.05889205, 0.9361206, 0, 1, 0.2313726, 1,
-0.3477033, 0.09844644, -1.090682, 0, 1, 0.2392157, 1,
-0.3475922, 0.06277171, -1.234771, 0, 1, 0.2431373, 1,
-0.3416385, -0.5505847, -4.453219, 0, 1, 0.2509804, 1,
-0.3403568, 0.9455562, -0.6284769, 0, 1, 0.254902, 1,
-0.3386517, -1.421709, -3.152237, 0, 1, 0.2627451, 1,
-0.3348332, -0.1893745, -1.959388, 0, 1, 0.2666667, 1,
-0.3326902, 0.3336183, -1.674703, 0, 1, 0.2745098, 1,
-0.3326814, 0.7499287, 2.639215, 0, 1, 0.2784314, 1,
-0.3253745, -0.8556566, -2.942085, 0, 1, 0.2862745, 1,
-0.3210752, 2.015481, -0.8632185, 0, 1, 0.2901961, 1,
-0.3198238, -1.211287, -2.645483, 0, 1, 0.2980392, 1,
-0.3144467, -0.9545527, -1.357121, 0, 1, 0.3058824, 1,
-0.3133038, 0.6222777, 1.147038, 0, 1, 0.3098039, 1,
-0.3117076, -1.421501, -3.020244, 0, 1, 0.3176471, 1,
-0.3087972, 0.787163, -0.1577346, 0, 1, 0.3215686, 1,
-0.3037949, 1.390009, 0.272204, 0, 1, 0.3294118, 1,
-0.2919702, 0.9522355, 0.7477131, 0, 1, 0.3333333, 1,
-0.2801436, 1.756835, -0.3561968, 0, 1, 0.3411765, 1,
-0.2799332, -0.3135904, -0.1700993, 0, 1, 0.345098, 1,
-0.2795757, -1.420204, -2.814848, 0, 1, 0.3529412, 1,
-0.2794602, 0.5295969, -0.1461396, 0, 1, 0.3568628, 1,
-0.2784569, 0.4043156, -2.069399, 0, 1, 0.3647059, 1,
-0.2775166, 0.3547106, -1.779733, 0, 1, 0.3686275, 1,
-0.2766514, 1.760141, -0.9962891, 0, 1, 0.3764706, 1,
-0.2740119, -1.046667, -3.267138, 0, 1, 0.3803922, 1,
-0.2652914, 0.7846082, 1.260448, 0, 1, 0.3882353, 1,
-0.2621695, 0.8262467, 0.6662606, 0, 1, 0.3921569, 1,
-0.2610621, 0.9108319, -0.5631963, 0, 1, 0.4, 1,
-0.2602369, -1.306155, -3.878034, 0, 1, 0.4078431, 1,
-0.2541826, -0.01810939, -0.8482939, 0, 1, 0.4117647, 1,
-0.2470249, 1.455294, -0.6002026, 0, 1, 0.4196078, 1,
-0.2469578, -1.211331, -4.631392, 0, 1, 0.4235294, 1,
-0.2448459, -0.604557, -3.562302, 0, 1, 0.4313726, 1,
-0.2413539, 0.3850515, -0.1919294, 0, 1, 0.4352941, 1,
-0.2378926, 0.1023889, -0.5079157, 0, 1, 0.4431373, 1,
-0.2374507, -0.6477137, -4.399371, 0, 1, 0.4470588, 1,
-0.2349462, 1.386821, -2.296643, 0, 1, 0.454902, 1,
-0.2338449, -0.240785, -2.073985, 0, 1, 0.4588235, 1,
-0.2297285, -0.8484566, -2.87448, 0, 1, 0.4666667, 1,
-0.2278708, -0.7418956, -1.418264, 0, 1, 0.4705882, 1,
-0.2256043, -0.03224833, -2.201351, 0, 1, 0.4784314, 1,
-0.2208712, -0.1861405, -1.450601, 0, 1, 0.4823529, 1,
-0.2190634, -2.152717, -4.916765, 0, 1, 0.4901961, 1,
-0.2168541, 0.8595866, -1.646054, 0, 1, 0.4941176, 1,
-0.2097237, 0.00943636, -1.38112, 0, 1, 0.5019608, 1,
-0.2052593, -0.06845129, -1.129732, 0, 1, 0.509804, 1,
-0.2037411, -0.4858299, -0.9665051, 0, 1, 0.5137255, 1,
-0.2017083, 0.1204505, -2.228386, 0, 1, 0.5215687, 1,
-0.1947446, -0.7897145, -4.555298, 0, 1, 0.5254902, 1,
-0.1937879, -0.4281623, -2.524144, 0, 1, 0.5333334, 1,
-0.1844771, 1.218963, -2.478374, 0, 1, 0.5372549, 1,
-0.1805019, 0.220534, -1.720649, 0, 1, 0.5450981, 1,
-0.1793707, 0.2732854, -0.7934452, 0, 1, 0.5490196, 1,
-0.1788137, -0.4885737, -3.812315, 0, 1, 0.5568628, 1,
-0.1780194, 0.001065119, -4.201342, 0, 1, 0.5607843, 1,
-0.1778738, -1.653464, -4.407688, 0, 1, 0.5686275, 1,
-0.1755223, -0.08693942, -2.072413, 0, 1, 0.572549, 1,
-0.1741748, -0.002445129, -2.395597, 0, 1, 0.5803922, 1,
-0.1732127, -0.7302774, -1.970027, 0, 1, 0.5843138, 1,
-0.1732005, -1.370659, -4.689708, 0, 1, 0.5921569, 1,
-0.1726285, 0.9076576, 0.8189094, 0, 1, 0.5960785, 1,
-0.1709391, 0.9074965, -1.89973, 0, 1, 0.6039216, 1,
-0.1657092, 0.785343, 2.16115, 0, 1, 0.6117647, 1,
-0.1637199, 0.7889411, 0.2488552, 0, 1, 0.6156863, 1,
-0.1631387, 0.4106318, -0.8791754, 0, 1, 0.6235294, 1,
-0.1605555, 1.029077, -1.058867, 0, 1, 0.627451, 1,
-0.1480493, -1.445855, -2.900913, 0, 1, 0.6352941, 1,
-0.1465001, 1.057491, -0.6389151, 0, 1, 0.6392157, 1,
-0.144848, 0.8569891, -1.068014, 0, 1, 0.6470588, 1,
-0.1367472, 0.9443085, 0.4735096, 0, 1, 0.6509804, 1,
-0.1328595, 0.979335, -0.5073638, 0, 1, 0.6588235, 1,
-0.1323929, 0.6877562, 0.08944648, 0, 1, 0.6627451, 1,
-0.1312228, -2.166841, -1.53793, 0, 1, 0.6705883, 1,
-0.1273384, 0.1144496, -1.159209, 0, 1, 0.6745098, 1,
-0.1267561, -1.090901, -1.373168, 0, 1, 0.682353, 1,
-0.1248061, -0.3185574, -1.731985, 0, 1, 0.6862745, 1,
-0.1212294, -0.2417737, -2.026356, 0, 1, 0.6941177, 1,
-0.1161465, -0.9242201, -2.747981, 0, 1, 0.7019608, 1,
-0.1108135, -0.01102577, -1.918321, 0, 1, 0.7058824, 1,
-0.1094745, -0.2138629, -2.633775, 0, 1, 0.7137255, 1,
-0.1093785, 0.6253916, -0.9417686, 0, 1, 0.7176471, 1,
-0.09974514, -0.8540499, -1.721897, 0, 1, 0.7254902, 1,
-0.09888136, -1.236243, -1.739967, 0, 1, 0.7294118, 1,
-0.09415219, 1.725133, -0.4731848, 0, 1, 0.7372549, 1,
-0.09353451, 1.782768, 0.9273294, 0, 1, 0.7411765, 1,
-0.08889046, -0.362457, -2.307322, 0, 1, 0.7490196, 1,
-0.08624224, 0.4682505, -1.276715, 0, 1, 0.7529412, 1,
-0.08602076, 0.1333836, -0.2720659, 0, 1, 0.7607843, 1,
-0.08541416, -0.1228156, -3.10435, 0, 1, 0.7647059, 1,
-0.08384272, 0.3443874, -1.387341, 0, 1, 0.772549, 1,
-0.08211622, 0.7343137, 1.201809, 0, 1, 0.7764706, 1,
-0.08043149, 0.2352372, -0.7069246, 0, 1, 0.7843137, 1,
-0.07611883, -0.3509813, -3.87187, 0, 1, 0.7882353, 1,
-0.07259305, -0.01037335, -1.499912, 0, 1, 0.7960784, 1,
-0.06982186, 0.05682816, -1.815603, 0, 1, 0.8039216, 1,
-0.06743739, 0.7949519, -0.2766782, 0, 1, 0.8078431, 1,
-0.06646639, -1.323102, -2.141204, 0, 1, 0.8156863, 1,
-0.06567781, 1.400734, -1.632369, 0, 1, 0.8196079, 1,
-0.06058591, -0.1694407, -3.428982, 0, 1, 0.827451, 1,
-0.05766745, -1.198761, -3.274848, 0, 1, 0.8313726, 1,
-0.05704166, 0.2952695, -1.138485, 0, 1, 0.8392157, 1,
-0.05634867, 1.280255, 0.1057867, 0, 1, 0.8431373, 1,
-0.05608391, 1.679418, 0.5364358, 0, 1, 0.8509804, 1,
-0.05404339, 0.2568298, -0.4727686, 0, 1, 0.854902, 1,
-0.05244052, 1.333715, 0.1721118, 0, 1, 0.8627451, 1,
-0.04646317, -0.2945138, -3.513743, 0, 1, 0.8666667, 1,
-0.04603979, -0.2097507, -3.088103, 0, 1, 0.8745098, 1,
-0.04478626, -1.252146, -2.931399, 0, 1, 0.8784314, 1,
-0.04319683, 0.6640893, 1.855176, 0, 1, 0.8862745, 1,
-0.03778072, -1.69887, -1.095585, 0, 1, 0.8901961, 1,
-0.02846768, 0.0510699, 0.1553284, 0, 1, 0.8980392, 1,
-0.0279336, 0.3925388, -0.6486181, 0, 1, 0.9058824, 1,
-0.02777093, 1.203688, 0.6448288, 0, 1, 0.9098039, 1,
-0.02521802, 0.02877603, -1.627465, 0, 1, 0.9176471, 1,
-0.02305789, -0.09786666, -3.48937, 0, 1, 0.9215686, 1,
-0.02267477, -0.4521347, -2.957581, 0, 1, 0.9294118, 1,
-0.01862505, -0.6693764, -3.792576, 0, 1, 0.9333333, 1,
-0.01840897, 0.9330023, 0.2048198, 0, 1, 0.9411765, 1,
-0.01808836, -0.3162768, -3.825887, 0, 1, 0.945098, 1,
-0.01465715, 1.852801, -0.4922196, 0, 1, 0.9529412, 1,
-0.01397309, -0.3194416, -3.320641, 0, 1, 0.9568627, 1,
-0.01165856, 0.2036755, -0.1443046, 0, 1, 0.9647059, 1,
-0.009599984, -1.63959, -3.678901, 0, 1, 0.9686275, 1,
-0.006552274, -0.7232395, -3.933022, 0, 1, 0.9764706, 1,
-0.004010084, 0.4348448, -1.248119, 0, 1, 0.9803922, 1,
-0.00353812, 0.08280703, -0.9683045, 0, 1, 0.9882353, 1,
-0.002538613, 2.613834, -0.02128944, 0, 1, 0.9921569, 1,
-0.002106983, -0.9526232, -2.450882, 0, 1, 1, 1,
0.001530114, -0.2666011, 3.029486, 0, 0.9921569, 1, 1,
0.003392235, -0.6284028, 3.795768, 0, 0.9882353, 1, 1,
0.004521037, 0.172027, 1.161452, 0, 0.9803922, 1, 1,
0.007073101, 0.2041596, 1.166986, 0, 0.9764706, 1, 1,
0.008094836, -0.7742885, 3.941716, 0, 0.9686275, 1, 1,
0.0100862, 0.4701135, 0.2552844, 0, 0.9647059, 1, 1,
0.01528534, -0.7775884, 2.921986, 0, 0.9568627, 1, 1,
0.0161518, 0.01656218, 1.149963, 0, 0.9529412, 1, 1,
0.01997744, 0.1883332, 0.2139959, 0, 0.945098, 1, 1,
0.02941088, -0.4504662, 2.385593, 0, 0.9411765, 1, 1,
0.03447911, 0.2211685, -2.170024, 0, 0.9333333, 1, 1,
0.03718023, 0.3673138, 1.467322, 0, 0.9294118, 1, 1,
0.03785208, -0.8389759, 2.870236, 0, 0.9215686, 1, 1,
0.0387739, -1.028251, 3.309642, 0, 0.9176471, 1, 1,
0.04162697, 1.266231, -0.9401073, 0, 0.9098039, 1, 1,
0.04181881, -0.5518906, 1.930671, 0, 0.9058824, 1, 1,
0.04585147, -1.816799, 3.766675, 0, 0.8980392, 1, 1,
0.04913715, -0.5287287, 3.203316, 0, 0.8901961, 1, 1,
0.05815629, 0.5210412, 0.2984697, 0, 0.8862745, 1, 1,
0.05840749, 1.204759, -0.5393751, 0, 0.8784314, 1, 1,
0.05915388, -1.555514, 1.980908, 0, 0.8745098, 1, 1,
0.06540361, 1.993104, 0.812229, 0, 0.8666667, 1, 1,
0.06752723, -1.759623, 1.108573, 0, 0.8627451, 1, 1,
0.06799329, -0.8831996, 2.093025, 0, 0.854902, 1, 1,
0.07000848, -0.8270547, 2.576916, 0, 0.8509804, 1, 1,
0.07080702, 1.204631, -1.552721, 0, 0.8431373, 1, 1,
0.07084505, 0.1415239, 1.678535, 0, 0.8392157, 1, 1,
0.07153021, -0.2783947, 2.057386, 0, 0.8313726, 1, 1,
0.07429566, -0.6662279, 3.864093, 0, 0.827451, 1, 1,
0.07553694, -0.6416309, 2.19849, 0, 0.8196079, 1, 1,
0.07672015, -0.3143785, 0.9415373, 0, 0.8156863, 1, 1,
0.0776283, -1.114514, 2.492189, 0, 0.8078431, 1, 1,
0.07819624, 0.2417846, 2.707865, 0, 0.8039216, 1, 1,
0.07829762, -0.8599364, 3.755399, 0, 0.7960784, 1, 1,
0.08183236, 1.049176, 0.575949, 0, 0.7882353, 1, 1,
0.0866305, -1.189188, 2.722372, 0, 0.7843137, 1, 1,
0.0867665, 0.1166102, -0.3973425, 0, 0.7764706, 1, 1,
0.09465016, -0.348996, 3.470686, 0, 0.772549, 1, 1,
0.09491704, 0.2127698, 0.03814011, 0, 0.7647059, 1, 1,
0.09628052, -1.409592, 3.191594, 0, 0.7607843, 1, 1,
0.09756155, -2.442226, 2.752888, 0, 0.7529412, 1, 1,
0.09888764, -1.44525, 4.005477, 0, 0.7490196, 1, 1,
0.1021195, -1.45427, 3.012213, 0, 0.7411765, 1, 1,
0.1044148, -1.733961, 3.174638, 0, 0.7372549, 1, 1,
0.1115799, 0.02411787, 1.527541, 0, 0.7294118, 1, 1,
0.1128888, 0.3930146, -0.04279446, 0, 0.7254902, 1, 1,
0.1182132, 0.3823916, 0.8869495, 0, 0.7176471, 1, 1,
0.1203807, 0.9468289, 1.475304, 0, 0.7137255, 1, 1,
0.1228303, 1.009236, -0.9183361, 0, 0.7058824, 1, 1,
0.1231109, 1.013556, 0.7317488, 0, 0.6980392, 1, 1,
0.1258959, 1.506122, -0.1281898, 0, 0.6941177, 1, 1,
0.1336575, 0.188583, 1.32803, 0, 0.6862745, 1, 1,
0.1419378, 1.24438, 2.036543, 0, 0.682353, 1, 1,
0.1421391, -0.7343295, 2.787167, 0, 0.6745098, 1, 1,
0.1445614, -1.507535, 4.078847, 0, 0.6705883, 1, 1,
0.1478042, 1.477694, 0.5157985, 0, 0.6627451, 1, 1,
0.1494407, -0.2955704, 3.01552, 0, 0.6588235, 1, 1,
0.1542951, -0.895791, 2.635361, 0, 0.6509804, 1, 1,
0.1653231, 0.2217216, -0.2446266, 0, 0.6470588, 1, 1,
0.1656662, 0.1787243, 1.226706, 0, 0.6392157, 1, 1,
0.1675027, 1.394027, 3.132348, 0, 0.6352941, 1, 1,
0.1679471, 1.110739, 1.713033, 0, 0.627451, 1, 1,
0.1693282, 1.594259, 0.366623, 0, 0.6235294, 1, 1,
0.1744234, -1.299454, 4.283204, 0, 0.6156863, 1, 1,
0.177325, 0.6783464, -1.941411, 0, 0.6117647, 1, 1,
0.1778325, -0.4116411, 1.541047, 0, 0.6039216, 1, 1,
0.1802359, -0.313221, 3.69378, 0, 0.5960785, 1, 1,
0.1803439, -0.2938697, 1.518716, 0, 0.5921569, 1, 1,
0.1880699, 0.2734931, 0.6326908, 0, 0.5843138, 1, 1,
0.188721, -0.8113461, 3.548955, 0, 0.5803922, 1, 1,
0.1952138, -0.8342138, 3.043994, 0, 0.572549, 1, 1,
0.1960966, 0.766213, -0.8148272, 0, 0.5686275, 1, 1,
0.1962776, -1.337713, 4.064447, 0, 0.5607843, 1, 1,
0.1991411, 0.4378557, 0.9052241, 0, 0.5568628, 1, 1,
0.2012919, -0.707373, 4.662573, 0, 0.5490196, 1, 1,
0.2044623, -0.3832356, 0.6576321, 0, 0.5450981, 1, 1,
0.2055427, -0.6662023, 3.255415, 0, 0.5372549, 1, 1,
0.2059387, 0.2416834, -0.6955428, 0, 0.5333334, 1, 1,
0.2096175, -1.309236, 2.525188, 0, 0.5254902, 1, 1,
0.2111326, 0.7898535, 1.197879, 0, 0.5215687, 1, 1,
0.212706, 0.303435, -0.1112679, 0, 0.5137255, 1, 1,
0.2184324, -0.6455735, 1.514242, 0, 0.509804, 1, 1,
0.2226315, 1.08482, -0.4421078, 0, 0.5019608, 1, 1,
0.2233409, -0.1509439, 2.092222, 0, 0.4941176, 1, 1,
0.224096, -0.3726866, 3.063694, 0, 0.4901961, 1, 1,
0.2262842, -0.7254598, 3.386032, 0, 0.4823529, 1, 1,
0.2358988, 1.372545, -0.7279271, 0, 0.4784314, 1, 1,
0.237456, 0.02351459, 1.955551, 0, 0.4705882, 1, 1,
0.2395719, -0.2183316, 2.733561, 0, 0.4666667, 1, 1,
0.2410222, -1.542922, 2.129616, 0, 0.4588235, 1, 1,
0.2416451, 0.6240212, 1.40012, 0, 0.454902, 1, 1,
0.2423113, -0.8848581, 4.882137, 0, 0.4470588, 1, 1,
0.2465524, -0.8311573, 4.457031, 0, 0.4431373, 1, 1,
0.2499999, 0.955892, -0.1764818, 0, 0.4352941, 1, 1,
0.2515661, -1.290102, 1.615864, 0, 0.4313726, 1, 1,
0.25688, -1.40358, 2.771233, 0, 0.4235294, 1, 1,
0.2593227, -0.1248508, 2.725478, 0, 0.4196078, 1, 1,
0.2613583, 0.6549481, -0.465027, 0, 0.4117647, 1, 1,
0.2616991, -0.398179, 4.148049, 0, 0.4078431, 1, 1,
0.2635628, 0.1259619, 2.954724, 0, 0.4, 1, 1,
0.2649376, 0.5738526, 0.3810696, 0, 0.3921569, 1, 1,
0.2670046, -0.3238105, 1.156564, 0, 0.3882353, 1, 1,
0.2676865, -1.368281, 4.589257, 0, 0.3803922, 1, 1,
0.268178, -0.3328052, 2.152833, 0, 0.3764706, 1, 1,
0.2683177, 0.1692115, 0.3447856, 0, 0.3686275, 1, 1,
0.2702756, -1.22362, 2.62247, 0, 0.3647059, 1, 1,
0.2710997, 0.2244663, 2.261495, 0, 0.3568628, 1, 1,
0.2733561, -1.004812, 1.468954, 0, 0.3529412, 1, 1,
0.273546, 0.9745739, 0.9232689, 0, 0.345098, 1, 1,
0.2763847, -0.6747716, 3.31366, 0, 0.3411765, 1, 1,
0.278571, 0.5508888, 2.116126, 0, 0.3333333, 1, 1,
0.2801051, -0.9821385, 3.919926, 0, 0.3294118, 1, 1,
0.2801773, 0.435219, 1.041295, 0, 0.3215686, 1, 1,
0.2840758, -1.308687, 1.252417, 0, 0.3176471, 1, 1,
0.2855524, 0.7313908, 0.7762451, 0, 0.3098039, 1, 1,
0.2877741, -0.4877404, 3.403063, 0, 0.3058824, 1, 1,
0.2879761, 1.27967, 0.5472286, 0, 0.2980392, 1, 1,
0.2880586, -0.8225869, 2.925526, 0, 0.2901961, 1, 1,
0.2893371, 1.284048, -0.4276515, 0, 0.2862745, 1, 1,
0.2902127, -0.4289111, 1.913331, 0, 0.2784314, 1, 1,
0.2950698, -0.5232431, 3.336744, 0, 0.2745098, 1, 1,
0.2963201, 0.1844897, 2.457698, 0, 0.2666667, 1, 1,
0.2986044, -0.4167421, 3.902237, 0, 0.2627451, 1, 1,
0.2999173, -0.5616143, 3.133646, 0, 0.254902, 1, 1,
0.3039352, 0.9719358, 0.5713517, 0, 0.2509804, 1, 1,
0.3081186, 1.226194, -1.135863, 0, 0.2431373, 1, 1,
0.3239018, 0.03422477, 3.608325, 0, 0.2392157, 1, 1,
0.3258285, -1.084702, 2.808172, 0, 0.2313726, 1, 1,
0.3295984, -0.6863972, 2.173422, 0, 0.227451, 1, 1,
0.3314986, -0.9829677, 3.310389, 0, 0.2196078, 1, 1,
0.3341632, -1.005495, 3.674655, 0, 0.2156863, 1, 1,
0.3409454, 2.453478, 1.014679, 0, 0.2078431, 1, 1,
0.3415517, 0.1589661, 2.70832, 0, 0.2039216, 1, 1,
0.3437382, 0.1638183, 1.761448, 0, 0.1960784, 1, 1,
0.3437723, 0.7368312, 0.9421297, 0, 0.1882353, 1, 1,
0.3444556, -1.367947, 3.546002, 0, 0.1843137, 1, 1,
0.3476098, -0.4769708, 2.241823, 0, 0.1764706, 1, 1,
0.3483415, 0.6199132, 0.1854346, 0, 0.172549, 1, 1,
0.3487622, 1.175187, -0.125274, 0, 0.1647059, 1, 1,
0.349348, -0.3492449, 3.244393, 0, 0.1607843, 1, 1,
0.3496739, -0.3141822, 3.047019, 0, 0.1529412, 1, 1,
0.3507214, 1.865781, 0.9463568, 0, 0.1490196, 1, 1,
0.3553929, -0.3803096, 2.105731, 0, 0.1411765, 1, 1,
0.3569414, 1.834908, 0.1346698, 0, 0.1372549, 1, 1,
0.3606908, 1.838825, -1.718339, 0, 0.1294118, 1, 1,
0.3611627, 0.1282068, 1.133381, 0, 0.1254902, 1, 1,
0.362825, -0.7392711, 3.037153, 0, 0.1176471, 1, 1,
0.3643674, -0.411626, 1.098206, 0, 0.1137255, 1, 1,
0.365422, -2.237233, 4.062495, 0, 0.1058824, 1, 1,
0.3670265, 0.1977522, 2.110641, 0, 0.09803922, 1, 1,
0.3681258, 0.5484909, 1.772877, 0, 0.09411765, 1, 1,
0.3718848, 1.196554, -0.03763317, 0, 0.08627451, 1, 1,
0.3733037, -0.7882749, 3.389267, 0, 0.08235294, 1, 1,
0.373436, 1.032481, 0.4281605, 0, 0.07450981, 1, 1,
0.3763705, -1.400686, 1.102475, 0, 0.07058824, 1, 1,
0.3803506, -0.7579929, 2.993773, 0, 0.0627451, 1, 1,
0.383031, 0.8493913, 1.286071, 0, 0.05882353, 1, 1,
0.3839554, 0.9361557, -0.2666107, 0, 0.05098039, 1, 1,
0.3846715, -1.048943, 2.273041, 0, 0.04705882, 1, 1,
0.3856594, 1.416924, 0.6690577, 0, 0.03921569, 1, 1,
0.3859234, 0.921308, 1.227566, 0, 0.03529412, 1, 1,
0.3868448, -1.155206, 3.4793, 0, 0.02745098, 1, 1,
0.387368, -0.1938236, 1.005225, 0, 0.02352941, 1, 1,
0.3935584, 0.1163427, 1.744317, 0, 0.01568628, 1, 1,
0.397886, 1.796446, -0.1556372, 0, 0.01176471, 1, 1,
0.3983668, 0.8379204, -1.386204, 0, 0.003921569, 1, 1,
0.4020662, 1.819936, -0.4319324, 0.003921569, 0, 1, 1,
0.4054434, 1.978632, -1.486383, 0.007843138, 0, 1, 1,
0.4076422, -0.434585, 3.188484, 0.01568628, 0, 1, 1,
0.4078522, -0.2132208, 2.269695, 0.01960784, 0, 1, 1,
0.4086953, 1.500391, 0.7700351, 0.02745098, 0, 1, 1,
0.4225287, 0.658272, 0.5372226, 0.03137255, 0, 1, 1,
0.4257577, 0.8289062, -0.1151369, 0.03921569, 0, 1, 1,
0.426671, -0.8888472, 2.526833, 0.04313726, 0, 1, 1,
0.4315698, 0.133592, 0.2767155, 0.05098039, 0, 1, 1,
0.4395347, -0.5619137, 3.251904, 0.05490196, 0, 1, 1,
0.4422593, 0.002917551, 0.6530133, 0.0627451, 0, 1, 1,
0.4425337, 1.0332, 3.113918, 0.06666667, 0, 1, 1,
0.4464996, 0.8279685, 0.2430382, 0.07450981, 0, 1, 1,
0.4468268, 0.3696532, 0.8750201, 0.07843138, 0, 1, 1,
0.4492201, 1.02989, 0.3893816, 0.08627451, 0, 1, 1,
0.4512278, 0.5301793, -1.398112, 0.09019608, 0, 1, 1,
0.4545705, -1.588571, 2.872661, 0.09803922, 0, 1, 1,
0.4626545, 0.8015492, 2.257605, 0.1058824, 0, 1, 1,
0.4662911, 0.2956084, 1.232977, 0.1098039, 0, 1, 1,
0.4694542, -1.233197, 2.340215, 0.1176471, 0, 1, 1,
0.4706822, -1.896223, 4.201451, 0.1215686, 0, 1, 1,
0.4733829, 0.2807604, 0.4482928, 0.1294118, 0, 1, 1,
0.4771022, 0.7674648, 1.204665, 0.1333333, 0, 1, 1,
0.4812847, 0.2362235, 0.6949239, 0.1411765, 0, 1, 1,
0.4813548, 0.6922401, 0.8860777, 0.145098, 0, 1, 1,
0.481896, -0.3858695, 1.743199, 0.1529412, 0, 1, 1,
0.4841045, 1.339948, 0.109174, 0.1568628, 0, 1, 1,
0.4850707, -0.7985094, 2.261943, 0.1647059, 0, 1, 1,
0.4970776, -0.4114695, -0.2085923, 0.1686275, 0, 1, 1,
0.5007924, -1.031057, 2.085655, 0.1764706, 0, 1, 1,
0.5048541, -0.6477296, 1.892288, 0.1803922, 0, 1, 1,
0.5061675, 0.09241158, 2.251431, 0.1882353, 0, 1, 1,
0.5132672, -1.444214, 2.63077, 0.1921569, 0, 1, 1,
0.5212985, 1.063222, -1.506442, 0.2, 0, 1, 1,
0.5244985, -1.372558, 2.781928, 0.2078431, 0, 1, 1,
0.5300487, 0.7234741, 0.9360735, 0.2117647, 0, 1, 1,
0.5302866, 1.379837, 0.7534018, 0.2196078, 0, 1, 1,
0.5308098, -0.4007939, 0.3387674, 0.2235294, 0, 1, 1,
0.5312597, 1.302311, -0.1655029, 0.2313726, 0, 1, 1,
0.535311, 1.417929, 0.3859409, 0.2352941, 0, 1, 1,
0.5379637, -1.322294, 2.608473, 0.2431373, 0, 1, 1,
0.5415707, 0.6287773, 1.789761, 0.2470588, 0, 1, 1,
0.5498943, -2.150113, 3.004879, 0.254902, 0, 1, 1,
0.5500103, -0.4890733, 4.37137, 0.2588235, 0, 1, 1,
0.5546951, 0.03395977, 2.424636, 0.2666667, 0, 1, 1,
0.5566304, -1.418285, 3.543467, 0.2705882, 0, 1, 1,
0.5652319, -1.662036, 1.327268, 0.2784314, 0, 1, 1,
0.5666344, 0.09727638, 2.070453, 0.282353, 0, 1, 1,
0.5786645, 0.5070044, -0.9261569, 0.2901961, 0, 1, 1,
0.5827332, -0.1971646, 2.271459, 0.2941177, 0, 1, 1,
0.5837896, 0.0162885, 0.7036945, 0.3019608, 0, 1, 1,
0.5872402, 0.6216807, 1.321226, 0.3098039, 0, 1, 1,
0.5939474, -0.1832552, 0.4521663, 0.3137255, 0, 1, 1,
0.5954491, 1.591974, -1.134566, 0.3215686, 0, 1, 1,
0.5955618, -0.8175306, 3.351086, 0.3254902, 0, 1, 1,
0.6122906, -0.3890645, 1.436612, 0.3333333, 0, 1, 1,
0.6152695, -2.108912, 3.055753, 0.3372549, 0, 1, 1,
0.617708, -1.514543, 2.162741, 0.345098, 0, 1, 1,
0.6222172, 1.42407, 0.8886164, 0.3490196, 0, 1, 1,
0.6239924, 0.2231188, 1.559478, 0.3568628, 0, 1, 1,
0.6334406, -0.2153435, 1.468303, 0.3607843, 0, 1, 1,
0.6336886, -1.656619, 3.3591, 0.3686275, 0, 1, 1,
0.6337703, -0.6859233, 3.381038, 0.372549, 0, 1, 1,
0.6378831, 0.5359206, 0.5322939, 0.3803922, 0, 1, 1,
0.6389999, -0.5380119, 2.267471, 0.3843137, 0, 1, 1,
0.6429216, -1.197039, 3.335983, 0.3921569, 0, 1, 1,
0.6436568, -1.563225, 2.882254, 0.3960784, 0, 1, 1,
0.6441132, 0.4761621, 1.57654, 0.4039216, 0, 1, 1,
0.6455699, 0.0340218, 0.2665365, 0.4117647, 0, 1, 1,
0.6462933, 0.9657545, 2.135258, 0.4156863, 0, 1, 1,
0.6473403, 0.5764354, 0.0159396, 0.4235294, 0, 1, 1,
0.6484048, 0.6043187, -1.234936, 0.427451, 0, 1, 1,
0.6516173, -0.6352791, 3.450786, 0.4352941, 0, 1, 1,
0.654227, -0.591844, 3.214168, 0.4392157, 0, 1, 1,
0.6650923, 2.355236, 0.4353527, 0.4470588, 0, 1, 1,
0.6658027, 0.6279845, 1.245874, 0.4509804, 0, 1, 1,
0.6667836, 0.4812847, 1.543924, 0.4588235, 0, 1, 1,
0.6722566, -0.07631528, 2.796334, 0.4627451, 0, 1, 1,
0.6729853, 0.7417777, 0.08360263, 0.4705882, 0, 1, 1,
0.6731722, -0.4391401, 3.543603, 0.4745098, 0, 1, 1,
0.6737986, -0.7614143, 4.161075, 0.4823529, 0, 1, 1,
0.6742551, -0.3334785, 0.9000279, 0.4862745, 0, 1, 1,
0.6771408, 1.100797, 1.394359, 0.4941176, 0, 1, 1,
0.6889408, -0.1684059, 2.410743, 0.5019608, 0, 1, 1,
0.6897091, -0.06400166, 1.536684, 0.5058824, 0, 1, 1,
0.6904252, -0.8962346, 2.355396, 0.5137255, 0, 1, 1,
0.6972207, 0.5289477, -0.512994, 0.5176471, 0, 1, 1,
0.6974516, -2.499825, 2.932579, 0.5254902, 0, 1, 1,
0.6990926, 0.8104542, 1.476151, 0.5294118, 0, 1, 1,
0.6992846, 0.3863978, 0.3311495, 0.5372549, 0, 1, 1,
0.7007373, 1.559395, 0.9692247, 0.5411765, 0, 1, 1,
0.7015803, 0.8759822, -0.3634345, 0.5490196, 0, 1, 1,
0.7064462, 1.219152, -0.2233756, 0.5529412, 0, 1, 1,
0.7076132, 0.08782645, -0.7445783, 0.5607843, 0, 1, 1,
0.7096721, 0.2697439, 0.296479, 0.5647059, 0, 1, 1,
0.7159789, -0.6240249, 2.325269, 0.572549, 0, 1, 1,
0.7233889, 0.9591532, 2.085489, 0.5764706, 0, 1, 1,
0.7290033, 0.02526789, 2.13157, 0.5843138, 0, 1, 1,
0.7301394, -0.445232, 1.273813, 0.5882353, 0, 1, 1,
0.7315004, -0.2410152, 1.531562, 0.5960785, 0, 1, 1,
0.7326872, -1.051727, 2.470551, 0.6039216, 0, 1, 1,
0.733025, 0.185106, 1.189729, 0.6078432, 0, 1, 1,
0.7338417, 1.782499, -0.4860925, 0.6156863, 0, 1, 1,
0.73581, 0.4991478, 0.7204776, 0.6196079, 0, 1, 1,
0.7387983, -0.5163975, 1.81348, 0.627451, 0, 1, 1,
0.7429776, -0.7484058, -0.8886878, 0.6313726, 0, 1, 1,
0.7448865, -1.788643, 3.641834, 0.6392157, 0, 1, 1,
0.7456984, -1.321801, 2.049726, 0.6431373, 0, 1, 1,
0.7457395, 1.311712, 0.3207484, 0.6509804, 0, 1, 1,
0.7483817, -0.9102176, 3.407886, 0.654902, 0, 1, 1,
0.7585789, -1.490373, 3.468519, 0.6627451, 0, 1, 1,
0.7607097, -1.373893, 0.4351743, 0.6666667, 0, 1, 1,
0.7642286, 0.6273407, -0.1819867, 0.6745098, 0, 1, 1,
0.7698364, -0.9448134, 2.926032, 0.6784314, 0, 1, 1,
0.7709147, -0.1778066, 2.503783, 0.6862745, 0, 1, 1,
0.7710708, -0.1668345, 1.01704, 0.6901961, 0, 1, 1,
0.7743068, 0.1137622, 1.679624, 0.6980392, 0, 1, 1,
0.7750475, 1.262492, 1.988207, 0.7058824, 0, 1, 1,
0.779688, 0.0708084, 2.921527, 0.7098039, 0, 1, 1,
0.7807438, -1.710914, 2.855241, 0.7176471, 0, 1, 1,
0.7837397, -0.6747017, 4.161801, 0.7215686, 0, 1, 1,
0.7852198, 0.7382687, 3.429174, 0.7294118, 0, 1, 1,
0.7906817, -0.105061, -0.3399108, 0.7333333, 0, 1, 1,
0.7944596, -0.5426003, 3.281547, 0.7411765, 0, 1, 1,
0.8007103, -0.6373132, 2.363239, 0.7450981, 0, 1, 1,
0.8060771, 0.6451215, 1.448869, 0.7529412, 0, 1, 1,
0.8068648, -0.1926184, 1.158249, 0.7568628, 0, 1, 1,
0.8097112, 0.7573683, 0.9014015, 0.7647059, 0, 1, 1,
0.8104855, -0.4327574, 2.0495, 0.7686275, 0, 1, 1,
0.8201628, 1.573575, -0.7483463, 0.7764706, 0, 1, 1,
0.8274224, 0.1585617, 1.317876, 0.7803922, 0, 1, 1,
0.8330309, 0.708992, -0.1055645, 0.7882353, 0, 1, 1,
0.8353039, 0.3894606, 0.6434535, 0.7921569, 0, 1, 1,
0.8354902, -1.321585, 1.869363, 0.8, 0, 1, 1,
0.8365166, -0.6348123, 1.59043, 0.8078431, 0, 1, 1,
0.8410755, -0.3994226, 3.107879, 0.8117647, 0, 1, 1,
0.8482621, -0.8647507, 1.86319, 0.8196079, 0, 1, 1,
0.8510509, -0.2093073, 1.41175, 0.8235294, 0, 1, 1,
0.8576828, 1.023846, -0.2729244, 0.8313726, 0, 1, 1,
0.8609377, 0.6312972, 0.5025462, 0.8352941, 0, 1, 1,
0.8638254, 0.6435165, 0.9383157, 0.8431373, 0, 1, 1,
0.8674489, -0.01387701, 1.786247, 0.8470588, 0, 1, 1,
0.8710101, -1.490048, 3.606778, 0.854902, 0, 1, 1,
0.8710102, -0.106353, 0.8668032, 0.8588235, 0, 1, 1,
0.875616, 0.1692342, 2.420724, 0.8666667, 0, 1, 1,
0.8772179, -0.3781071, 0.6837181, 0.8705882, 0, 1, 1,
0.8788386, 0.1907835, 0.8622521, 0.8784314, 0, 1, 1,
0.8799133, -0.1979605, 2.309811, 0.8823529, 0, 1, 1,
0.8821583, -1.839529, 0.6965909, 0.8901961, 0, 1, 1,
0.8931027, -0.4601655, 4.613764, 0.8941177, 0, 1, 1,
0.8945965, 0.5565612, 1.86459, 0.9019608, 0, 1, 1,
0.9016041, -1.995185, 2.235034, 0.9098039, 0, 1, 1,
0.9043669, 0.2982909, -0.6927685, 0.9137255, 0, 1, 1,
0.9087293, -0.6627427, 0.9436761, 0.9215686, 0, 1, 1,
0.9115022, -0.6001088, 2.12267, 0.9254902, 0, 1, 1,
0.9129235, -1.5492, 3.451806, 0.9333333, 0, 1, 1,
0.9162031, -0.6393486, 1.527127, 0.9372549, 0, 1, 1,
0.918422, 0.7468954, 0.6427639, 0.945098, 0, 1, 1,
0.9201084, 0.6440747, 0.06081026, 0.9490196, 0, 1, 1,
0.9208203, -0.6946498, 2.547935, 0.9568627, 0, 1, 1,
0.92882, 1.346803, 0.1023133, 0.9607843, 0, 1, 1,
0.9334373, -1.2581, 2.774203, 0.9686275, 0, 1, 1,
0.9451314, -0.03963405, 1.494796, 0.972549, 0, 1, 1,
0.947282, -0.2890861, 2.453978, 0.9803922, 0, 1, 1,
0.9517751, -0.5066308, 1.880166, 0.9843137, 0, 1, 1,
0.9659323, 1.451473, 0.8660655, 0.9921569, 0, 1, 1,
0.9683337, 1.246776, 1.354511, 0.9960784, 0, 1, 1,
0.9683734, 0.02958355, 2.349127, 1, 0, 0.9960784, 1,
0.9711574, -0.7940251, 3.414853, 1, 0, 0.9882353, 1,
0.9775298, -1.372731, 3.190076, 1, 0, 0.9843137, 1,
0.9843129, -1.603997, 2.403442, 1, 0, 0.9764706, 1,
1.002071, 0.1871919, 2.960235, 1, 0, 0.972549, 1,
1.003917, -2.117666, 3.683029, 1, 0, 0.9647059, 1,
1.015005, -1.16024, 2.951983, 1, 0, 0.9607843, 1,
1.015276, 1.131625, 1.296626, 1, 0, 0.9529412, 1,
1.017899, -0.7320561, 2.529331, 1, 0, 0.9490196, 1,
1.018701, 0.9825932, 0.2325568, 1, 0, 0.9411765, 1,
1.029648, 0.3437378, -0.2893092, 1, 0, 0.9372549, 1,
1.03572, -0.966253, 4.614205, 1, 0, 0.9294118, 1,
1.039571, -0.2149474, 1.136687, 1, 0, 0.9254902, 1,
1.039782, 0.4589509, 3.078682, 1, 0, 0.9176471, 1,
1.040024, 0.2437511, 0.9036337, 1, 0, 0.9137255, 1,
1.043913, 1.657043, -0.2849688, 1, 0, 0.9058824, 1,
1.046703, -0.2772784, 0.5517266, 1, 0, 0.9019608, 1,
1.051866, -1.074759, 3.829806, 1, 0, 0.8941177, 1,
1.05214, 1.640491, 0.3520046, 1, 0, 0.8862745, 1,
1.05534, -0.4446123, 0.1213425, 1, 0, 0.8823529, 1,
1.060599, -0.8668911, 1.146059, 1, 0, 0.8745098, 1,
1.063565, -1.504009, 1.3226, 1, 0, 0.8705882, 1,
1.063777, -0.4910737, -0.02024479, 1, 0, 0.8627451, 1,
1.068133, 0.5215173, 0.997709, 1, 0, 0.8588235, 1,
1.078267, 0.8071263, -0.07586404, 1, 0, 0.8509804, 1,
1.079923, -0.2844481, 1.827722, 1, 0, 0.8470588, 1,
1.080752, -0.9356001, 1.186919, 1, 0, 0.8392157, 1,
1.084593, -0.9673588, 3.474689, 1, 0, 0.8352941, 1,
1.093387, -0.2451076, 3.703593, 1, 0, 0.827451, 1,
1.097062, 0.3796499, 1.334339, 1, 0, 0.8235294, 1,
1.100209, 2.636916, 1.009388, 1, 0, 0.8156863, 1,
1.104633, 1.30778, 0.3461839, 1, 0, 0.8117647, 1,
1.105669, -0.1714427, 2.018021, 1, 0, 0.8039216, 1,
1.134082, -0.3726711, 1.446375, 1, 0, 0.7960784, 1,
1.137679, 0.4519596, 1.898201, 1, 0, 0.7921569, 1,
1.138292, 0.3177677, 0.5853536, 1, 0, 0.7843137, 1,
1.138772, -1.20238, 3.732664, 1, 0, 0.7803922, 1,
1.13988, 0.5953766, 0.4957973, 1, 0, 0.772549, 1,
1.148649, 0.998064, 1.213558, 1, 0, 0.7686275, 1,
1.149913, -0.560809, 1.331931, 1, 0, 0.7607843, 1,
1.153893, -0.5918827, 2.649989, 1, 0, 0.7568628, 1,
1.158913, 0.8701628, 0.9521704, 1, 0, 0.7490196, 1,
1.166265, 0.512164, -0.3005925, 1, 0, 0.7450981, 1,
1.167438, 0.9417784, 0.2359958, 1, 0, 0.7372549, 1,
1.170588, 0.8624477, 0.9544798, 1, 0, 0.7333333, 1,
1.170698, 0.4030026, 1.615776, 1, 0, 0.7254902, 1,
1.174588, -0.4566325, 3.026458, 1, 0, 0.7215686, 1,
1.179415, 1.189719, 0.7022902, 1, 0, 0.7137255, 1,
1.180995, -1.208611, 1.564528, 1, 0, 0.7098039, 1,
1.18816, 0.3387296, 1.069553, 1, 0, 0.7019608, 1,
1.19836, 2.493295, 1.213522, 1, 0, 0.6941177, 1,
1.200568, -0.533343, 0.7974426, 1, 0, 0.6901961, 1,
1.212635, 1.598087, 0.1975508, 1, 0, 0.682353, 1,
1.21722, 0.03684041, 2.06843, 1, 0, 0.6784314, 1,
1.221009, -0.8565198, 1.533754, 1, 0, 0.6705883, 1,
1.227954, -2.466325, 2.759147, 1, 0, 0.6666667, 1,
1.228511, 1.259271, 0.3614868, 1, 0, 0.6588235, 1,
1.230436, 1.075543, -0.1114007, 1, 0, 0.654902, 1,
1.230854, 1.210973, 1.241324, 1, 0, 0.6470588, 1,
1.242137, 0.864952, -0.4344264, 1, 0, 0.6431373, 1,
1.244243, 0.6181509, 1.164931, 1, 0, 0.6352941, 1,
1.250746, -0.5311319, 3.472944, 1, 0, 0.6313726, 1,
1.251611, -0.3533874, 0.9102408, 1, 0, 0.6235294, 1,
1.252147, 1.430323, -0.08992624, 1, 0, 0.6196079, 1,
1.26557, -1.169658, 3.92149, 1, 0, 0.6117647, 1,
1.269464, 0.8124285, 0.4426911, 1, 0, 0.6078432, 1,
1.270827, 0.5215912, 0.2835131, 1, 0, 0.6, 1,
1.271872, -0.9142676, 2.549185, 1, 0, 0.5921569, 1,
1.276943, 0.4737881, 0.2647484, 1, 0, 0.5882353, 1,
1.28496, 0.4078345, 2.242315, 1, 0, 0.5803922, 1,
1.291292, 0.5539422, 1.535358, 1, 0, 0.5764706, 1,
1.29439, -1.007489, 3.30393, 1, 0, 0.5686275, 1,
1.315107, 0.2532893, 0.3701085, 1, 0, 0.5647059, 1,
1.316885, 1.731035, 1.756547, 1, 0, 0.5568628, 1,
1.318966, 0.4316297, 2.467413, 1, 0, 0.5529412, 1,
1.321042, 0.3267615, 0.8224219, 1, 0, 0.5450981, 1,
1.323692, -0.4922693, 2.073556, 1, 0, 0.5411765, 1,
1.329582, -0.7542843, 2.792626, 1, 0, 0.5333334, 1,
1.333805, 1.233788, 1.133586, 1, 0, 0.5294118, 1,
1.343124, -1.092381, 1.674377, 1, 0, 0.5215687, 1,
1.350531, -1.34208, 0.7792773, 1, 0, 0.5176471, 1,
1.378159, -0.949299, 0.7132392, 1, 0, 0.509804, 1,
1.381022, 0.8051845, 0.5071046, 1, 0, 0.5058824, 1,
1.385135, 1.11575, -0.02479337, 1, 0, 0.4980392, 1,
1.385269, -0.3527509, 2.655031, 1, 0, 0.4901961, 1,
1.399415, -0.1395271, 2.521489, 1, 0, 0.4862745, 1,
1.405686, -0.7796346, 2.79393, 1, 0, 0.4784314, 1,
1.412019, -0.6752344, 1.782328, 1, 0, 0.4745098, 1,
1.42404, 0.8052248, 1.998965, 1, 0, 0.4666667, 1,
1.424298, -1.967355, 2.5122, 1, 0, 0.4627451, 1,
1.43044, 0.4457117, 0.844624, 1, 0, 0.454902, 1,
1.430611, 0.4692083, 0.1787192, 1, 0, 0.4509804, 1,
1.431026, -1.247562, 2.132488, 1, 0, 0.4431373, 1,
1.443246, -0.02761806, 1.822, 1, 0, 0.4392157, 1,
1.444621, 0.8735168, 0.8933957, 1, 0, 0.4313726, 1,
1.460876, -0.2022396, 1.258449, 1, 0, 0.427451, 1,
1.464609, -1.424832, 2.891265, 1, 0, 0.4196078, 1,
1.474459, 0.7222279, 1.281137, 1, 0, 0.4156863, 1,
1.474564, 0.5357075, -0.377894, 1, 0, 0.4078431, 1,
1.477199, 0.4961507, -0.03502116, 1, 0, 0.4039216, 1,
1.484418, 1.666229, -0.6358428, 1, 0, 0.3960784, 1,
1.502587, 0.9556084, -2.018767, 1, 0, 0.3882353, 1,
1.505104, 2.081146, -0.5923827, 1, 0, 0.3843137, 1,
1.505559, -0.954378, 1.262439, 1, 0, 0.3764706, 1,
1.508631, 0.09620928, 2.446806, 1, 0, 0.372549, 1,
1.513437, 0.4292974, 2.199193, 1, 0, 0.3647059, 1,
1.517864, -0.2538716, 0.5374374, 1, 0, 0.3607843, 1,
1.548004, -1.013859, 4.154088, 1, 0, 0.3529412, 1,
1.549062, -0.1305676, 2.350716, 1, 0, 0.3490196, 1,
1.563119, -0.3689249, 1.924899, 1, 0, 0.3411765, 1,
1.568963, 0.1497616, 1.711975, 1, 0, 0.3372549, 1,
1.578099, -1.682126, 3.670295, 1, 0, 0.3294118, 1,
1.58555, 1.760375, 0.1409273, 1, 0, 0.3254902, 1,
1.589828, 0.1493027, 2.223818, 1, 0, 0.3176471, 1,
1.596535, 1.51324, 1.392732, 1, 0, 0.3137255, 1,
1.599832, 0.06926437, 0.8661178, 1, 0, 0.3058824, 1,
1.600037, 0.805173, 1.617665, 1, 0, 0.2980392, 1,
1.609336, 0.6778718, -0.2973103, 1, 0, 0.2941177, 1,
1.611342, 0.5479377, 0.546923, 1, 0, 0.2862745, 1,
1.614318, -0.2612958, 3.05707, 1, 0, 0.282353, 1,
1.616154, -0.4056509, 1.039711, 1, 0, 0.2745098, 1,
1.633641, -0.687263, 1.467441, 1, 0, 0.2705882, 1,
1.642346, -1.290415, 1.97737, 1, 0, 0.2627451, 1,
1.64298, 0.3610698, 0.1878473, 1, 0, 0.2588235, 1,
1.647422, -1.8256, 3.298162, 1, 0, 0.2509804, 1,
1.654428, 0.7947611, -0.8452286, 1, 0, 0.2470588, 1,
1.65813, -0.8365337, 1.027522, 1, 0, 0.2392157, 1,
1.670987, 0.9936792, 2.89974, 1, 0, 0.2352941, 1,
1.671344, 0.0749726, 2.788787, 1, 0, 0.227451, 1,
1.694883, -0.8117992, 2.150281, 1, 0, 0.2235294, 1,
1.70974, -0.0807308, 3.658906, 1, 0, 0.2156863, 1,
1.719101, 1.155343, 1.22671, 1, 0, 0.2117647, 1,
1.720189, 2.092861, 1.393344, 1, 0, 0.2039216, 1,
1.741622, -1.779288, 3.273619, 1, 0, 0.1960784, 1,
1.742443, 1.138608, 0.6065794, 1, 0, 0.1921569, 1,
1.793664, 0.8024251, 3.262314, 1, 0, 0.1843137, 1,
1.802839, -0.7307405, 1.862644, 1, 0, 0.1803922, 1,
1.8087, -0.6445099, 3.505339, 1, 0, 0.172549, 1,
1.844738, -0.558926, 1.931435, 1, 0, 0.1686275, 1,
1.887074, 0.1787342, 1.339958, 1, 0, 0.1607843, 1,
1.934014, 0.4282508, 0.4122595, 1, 0, 0.1568628, 1,
1.935256, -0.5938241, 2.367536, 1, 0, 0.1490196, 1,
1.936453, 0.6844189, 0.6994705, 1, 0, 0.145098, 1,
1.943495, -1.036078, 2.749815, 1, 0, 0.1372549, 1,
1.954705, -0.5701707, 1.868978, 1, 0, 0.1333333, 1,
1.956209, -1.418664, 4.763617, 1, 0, 0.1254902, 1,
1.976829, 0.02304979, 1.958395, 1, 0, 0.1215686, 1,
1.988573, -1.491231, 1.957798, 1, 0, 0.1137255, 1,
2.069038, 0.1752906, 1.271873, 1, 0, 0.1098039, 1,
2.103761, 0.4443335, 1.023055, 1, 0, 0.1019608, 1,
2.214474, 3.070748, 1.267672, 1, 0, 0.09411765, 1,
2.221836, 0.6775193, -0.0331376, 1, 0, 0.09019608, 1,
2.231983, -0.3037006, 2.039392, 1, 0, 0.08235294, 1,
2.232308, 0.2294955, 1.669041, 1, 0, 0.07843138, 1,
2.237946, 0.2980199, 1.527534, 1, 0, 0.07058824, 1,
2.388682, -1.200605, 3.012713, 1, 0, 0.06666667, 1,
2.406296, 1.787545, 0.4459738, 1, 0, 0.05882353, 1,
2.463752, -0.05162911, 1.676761, 1, 0, 0.05490196, 1,
2.500087, 0.6365017, -0.4414474, 1, 0, 0.04705882, 1,
2.53867, -1.784396, 1.825912, 1, 0, 0.04313726, 1,
2.581057, -1.681587, 2.289958, 1, 0, 0.03529412, 1,
2.592506, -0.4382608, 2.504472, 1, 0, 0.03137255, 1,
2.725096, -0.03529889, 4.007109, 1, 0, 0.02352941, 1,
2.840933, -0.6581948, 1.44292, 1, 0, 0.01960784, 1,
2.987343, -1.987964, 2.817402, 1, 0, 0.01176471, 1,
3.130941, -1.132657, -0.913083, 1, 0, 0.007843138, 1
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
-0.02927196, -3.444037, -6.801447, 0, -0.5, 0.5, 0.5,
-0.02927196, -3.444037, -6.801447, 1, -0.5, 0.5, 0.5,
-0.02927196, -3.444037, -6.801447, 1, 1.5, 0.5, 0.5,
-0.02927196, -3.444037, -6.801447, 0, 1.5, 0.5, 0.5
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
-4.260798, 0.2854615, -6.801447, 0, -0.5, 0.5, 0.5,
-4.260798, 0.2854615, -6.801447, 1, -0.5, 0.5, 0.5,
-4.260798, 0.2854615, -6.801447, 1, 1.5, 0.5, 0.5,
-4.260798, 0.2854615, -6.801447, 0, 1.5, 0.5, 0.5
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
-4.260798, -3.444037, -0.1129823, 0, -0.5, 0.5, 0.5,
-4.260798, -3.444037, -0.1129823, 1, -0.5, 0.5, 0.5,
-4.260798, -3.444037, -0.1129823, 1, 1.5, 0.5, 0.5,
-4.260798, -3.444037, -0.1129823, 0, 1.5, 0.5, 0.5
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
-3, -2.583384, -5.257955,
3, -2.583384, -5.257955,
-3, -2.583384, -5.257955,
-3, -2.726826, -5.515203,
-2, -2.583384, -5.257955,
-2, -2.726826, -5.515203,
-1, -2.583384, -5.257955,
-1, -2.726826, -5.515203,
0, -2.583384, -5.257955,
0, -2.726826, -5.515203,
1, -2.583384, -5.257955,
1, -2.726826, -5.515203,
2, -2.583384, -5.257955,
2, -2.726826, -5.515203,
3, -2.583384, -5.257955,
3, -2.726826, -5.515203
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
-3, -3.013711, -6.029701, 0, -0.5, 0.5, 0.5,
-3, -3.013711, -6.029701, 1, -0.5, 0.5, 0.5,
-3, -3.013711, -6.029701, 1, 1.5, 0.5, 0.5,
-3, -3.013711, -6.029701, 0, 1.5, 0.5, 0.5,
-2, -3.013711, -6.029701, 0, -0.5, 0.5, 0.5,
-2, -3.013711, -6.029701, 1, -0.5, 0.5, 0.5,
-2, -3.013711, -6.029701, 1, 1.5, 0.5, 0.5,
-2, -3.013711, -6.029701, 0, 1.5, 0.5, 0.5,
-1, -3.013711, -6.029701, 0, -0.5, 0.5, 0.5,
-1, -3.013711, -6.029701, 1, -0.5, 0.5, 0.5,
-1, -3.013711, -6.029701, 1, 1.5, 0.5, 0.5,
-1, -3.013711, -6.029701, 0, 1.5, 0.5, 0.5,
0, -3.013711, -6.029701, 0, -0.5, 0.5, 0.5,
0, -3.013711, -6.029701, 1, -0.5, 0.5, 0.5,
0, -3.013711, -6.029701, 1, 1.5, 0.5, 0.5,
0, -3.013711, -6.029701, 0, 1.5, 0.5, 0.5,
1, -3.013711, -6.029701, 0, -0.5, 0.5, 0.5,
1, -3.013711, -6.029701, 1, -0.5, 0.5, 0.5,
1, -3.013711, -6.029701, 1, 1.5, 0.5, 0.5,
1, -3.013711, -6.029701, 0, 1.5, 0.5, 0.5,
2, -3.013711, -6.029701, 0, -0.5, 0.5, 0.5,
2, -3.013711, -6.029701, 1, -0.5, 0.5, 0.5,
2, -3.013711, -6.029701, 1, 1.5, 0.5, 0.5,
2, -3.013711, -6.029701, 0, 1.5, 0.5, 0.5,
3, -3.013711, -6.029701, 0, -0.5, 0.5, 0.5,
3, -3.013711, -6.029701, 1, -0.5, 0.5, 0.5,
3, -3.013711, -6.029701, 1, 1.5, 0.5, 0.5,
3, -3.013711, -6.029701, 0, 1.5, 0.5, 0.5
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
-3.284292, -2, -5.257955,
-3.284292, 3, -5.257955,
-3.284292, -2, -5.257955,
-3.447042, -2, -5.515203,
-3.284292, -1, -5.257955,
-3.447042, -1, -5.515203,
-3.284292, 0, -5.257955,
-3.447042, 0, -5.515203,
-3.284292, 1, -5.257955,
-3.447042, 1, -5.515203,
-3.284292, 2, -5.257955,
-3.447042, 2, -5.515203,
-3.284292, 3, -5.257955,
-3.447042, 3, -5.515203
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
-3.772544, -2, -6.029701, 0, -0.5, 0.5, 0.5,
-3.772544, -2, -6.029701, 1, -0.5, 0.5, 0.5,
-3.772544, -2, -6.029701, 1, 1.5, 0.5, 0.5,
-3.772544, -2, -6.029701, 0, 1.5, 0.5, 0.5,
-3.772544, -1, -6.029701, 0, -0.5, 0.5, 0.5,
-3.772544, -1, -6.029701, 1, -0.5, 0.5, 0.5,
-3.772544, -1, -6.029701, 1, 1.5, 0.5, 0.5,
-3.772544, -1, -6.029701, 0, 1.5, 0.5, 0.5,
-3.772544, 0, -6.029701, 0, -0.5, 0.5, 0.5,
-3.772544, 0, -6.029701, 1, -0.5, 0.5, 0.5,
-3.772544, 0, -6.029701, 1, 1.5, 0.5, 0.5,
-3.772544, 0, -6.029701, 0, 1.5, 0.5, 0.5,
-3.772544, 1, -6.029701, 0, -0.5, 0.5, 0.5,
-3.772544, 1, -6.029701, 1, -0.5, 0.5, 0.5,
-3.772544, 1, -6.029701, 1, 1.5, 0.5, 0.5,
-3.772544, 1, -6.029701, 0, 1.5, 0.5, 0.5,
-3.772544, 2, -6.029701, 0, -0.5, 0.5, 0.5,
-3.772544, 2, -6.029701, 1, -0.5, 0.5, 0.5,
-3.772544, 2, -6.029701, 1, 1.5, 0.5, 0.5,
-3.772544, 2, -6.029701, 0, 1.5, 0.5, 0.5,
-3.772544, 3, -6.029701, 0, -0.5, 0.5, 0.5,
-3.772544, 3, -6.029701, 1, -0.5, 0.5, 0.5,
-3.772544, 3, -6.029701, 1, 1.5, 0.5, 0.5,
-3.772544, 3, -6.029701, 0, 1.5, 0.5, 0.5
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
-3.284292, -2.583384, -4,
-3.284292, -2.583384, 4,
-3.284292, -2.583384, -4,
-3.447042, -2.726826, -4,
-3.284292, -2.583384, -2,
-3.447042, -2.726826, -2,
-3.284292, -2.583384, 0,
-3.447042, -2.726826, 0,
-3.284292, -2.583384, 2,
-3.447042, -2.726826, 2,
-3.284292, -2.583384, 4,
-3.447042, -2.726826, 4
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
-3.772544, -3.013711, -4, 0, -0.5, 0.5, 0.5,
-3.772544, -3.013711, -4, 1, -0.5, 0.5, 0.5,
-3.772544, -3.013711, -4, 1, 1.5, 0.5, 0.5,
-3.772544, -3.013711, -4, 0, 1.5, 0.5, 0.5,
-3.772544, -3.013711, -2, 0, -0.5, 0.5, 0.5,
-3.772544, -3.013711, -2, 1, -0.5, 0.5, 0.5,
-3.772544, -3.013711, -2, 1, 1.5, 0.5, 0.5,
-3.772544, -3.013711, -2, 0, 1.5, 0.5, 0.5,
-3.772544, -3.013711, 0, 0, -0.5, 0.5, 0.5,
-3.772544, -3.013711, 0, 1, -0.5, 0.5, 0.5,
-3.772544, -3.013711, 0, 1, 1.5, 0.5, 0.5,
-3.772544, -3.013711, 0, 0, 1.5, 0.5, 0.5,
-3.772544, -3.013711, 2, 0, -0.5, 0.5, 0.5,
-3.772544, -3.013711, 2, 1, -0.5, 0.5, 0.5,
-3.772544, -3.013711, 2, 1, 1.5, 0.5, 0.5,
-3.772544, -3.013711, 2, 0, 1.5, 0.5, 0.5,
-3.772544, -3.013711, 4, 0, -0.5, 0.5, 0.5,
-3.772544, -3.013711, 4, 1, -0.5, 0.5, 0.5,
-3.772544, -3.013711, 4, 1, 1.5, 0.5, 0.5,
-3.772544, -3.013711, 4, 0, 1.5, 0.5, 0.5
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
-3.284292, -2.583384, -5.257955,
-3.284292, 3.154307, -5.257955,
-3.284292, -2.583384, 5.031991,
-3.284292, 3.154307, 5.031991,
-3.284292, -2.583384, -5.257955,
-3.284292, -2.583384, 5.031991,
-3.284292, 3.154307, -5.257955,
-3.284292, 3.154307, 5.031991,
-3.284292, -2.583384, -5.257955,
3.225748, -2.583384, -5.257955,
-3.284292, -2.583384, 5.031991,
3.225748, -2.583384, 5.031991,
-3.284292, 3.154307, -5.257955,
3.225748, 3.154307, -5.257955,
-3.284292, 3.154307, 5.031991,
3.225748, 3.154307, 5.031991,
3.225748, -2.583384, -5.257955,
3.225748, 3.154307, -5.257955,
3.225748, -2.583384, 5.031991,
3.225748, 3.154307, 5.031991,
3.225748, -2.583384, -5.257955,
3.225748, -2.583384, 5.031991,
3.225748, 3.154307, -5.257955,
3.225748, 3.154307, 5.031991
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
var radius = 7.187638;
var distance = 31.97861;
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
mvMatrix.translate( 0.02927196, -0.2854615, 0.1129823 );
mvMatrix.scale( 1.193759, 1.35445, 0.7552436 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.97861);
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
O-methyl_oxime<-read.table("O-methyl_oxime.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-O-methyl_oxime$V2
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
y<-O-methyl_oxime$V3
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
z<-O-methyl_oxime$V4
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
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
-3.189485, -0.8512175, -2.913539, 0, 0, 1, 1, 1,
-2.903918, -1.061255, -0.3544622, 1, 0, 0, 1, 1,
-2.880413, -0.9758554, -2.830906, 1, 0, 0, 1, 1,
-2.825956, -0.3027408, -1.49294, 1, 0, 0, 1, 1,
-2.667587, 0.2398395, -1.453514, 1, 0, 0, 1, 1,
-2.657212, -1.256069, -3.234987, 1, 0, 0, 1, 1,
-2.643589, 0.9036141, -1.738635, 0, 0, 0, 1, 1,
-2.612584, -0.2634543, -0.7743307, 0, 0, 0, 1, 1,
-2.589381, 0.2633865, -2.010018, 0, 0, 0, 1, 1,
-2.553853, 0.5036691, -3.011236, 0, 0, 0, 1, 1,
-2.531055, -0.2288458, -1.528422, 0, 0, 0, 1, 1,
-2.438454, 1.064116, -1.093654, 0, 0, 0, 1, 1,
-2.400677, 0.1276781, -1.717904, 0, 0, 0, 1, 1,
-2.378651, -0.538146, -0.7204551, 1, 1, 1, 1, 1,
-2.318421, 0.6630746, -1.320299, 1, 1, 1, 1, 1,
-2.193832, -0.954107, -0.9639937, 1, 1, 1, 1, 1,
-2.164823, -0.1504935, 0.3975101, 1, 1, 1, 1, 1,
-2.161687, 2.041696, -0.2271083, 1, 1, 1, 1, 1,
-2.150336, -0.4290102, -2.901868, 1, 1, 1, 1, 1,
-2.130226, 0.5102307, -1.113682, 1, 1, 1, 1, 1,
-2.098221, 1.115838, -0.880398, 1, 1, 1, 1, 1,
-2.087444, 0.9426995, -1.897543, 1, 1, 1, 1, 1,
-2.081288, 1.954294, -0.3637991, 1, 1, 1, 1, 1,
-2.050148, -0.2208631, -1.339342, 1, 1, 1, 1, 1,
-2.041235, -0.7679775, -1.153253, 1, 1, 1, 1, 1,
-2.032335, -0.1495866, -1.462135, 1, 1, 1, 1, 1,
-1.988468, -0.5272658, -1.838303, 1, 1, 1, 1, 1,
-1.982421, 0.2993883, -1.770394, 1, 1, 1, 1, 1,
-1.948649, 0.001805688, -2.774294, 0, 0, 1, 1, 1,
-1.94049, 0.5156457, -1.335681, 1, 0, 0, 1, 1,
-1.936279, 0.4265755, -0.5559178, 1, 0, 0, 1, 1,
-1.933179, -0.2721645, -0.900268, 1, 0, 0, 1, 1,
-1.925428, -0.5862495, -4.870999, 1, 0, 0, 1, 1,
-1.92404, -0.7095811, -1.152587, 1, 0, 0, 1, 1,
-1.91131, -0.6832521, -3.28435, 0, 0, 0, 1, 1,
-1.911105, -0.2699456, -0.4441463, 0, 0, 0, 1, 1,
-1.865183, -0.079568, -0.4248655, 0, 0, 0, 1, 1,
-1.859228, 0.7037306, -1.678874, 0, 0, 0, 1, 1,
-1.839174, -0.06207695, -1.004588, 0, 0, 0, 1, 1,
-1.830252, 0.3467735, -1.555697, 0, 0, 0, 1, 1,
-1.801597, -0.4539621, -2.149039, 0, 0, 0, 1, 1,
-1.800779, -1.148974, -3.094113, 1, 1, 1, 1, 1,
-1.793953, 0.145253, -3.507385, 1, 1, 1, 1, 1,
-1.78755, 0.7657626, -2.855299, 1, 1, 1, 1, 1,
-1.782258, 0.5629726, -0.4185172, 1, 1, 1, 1, 1,
-1.778258, -0.8921745, -2.002418, 1, 1, 1, 1, 1,
-1.777471, -0.6713881, -1.880025, 1, 1, 1, 1, 1,
-1.777073, -1.306099, -2.841304, 1, 1, 1, 1, 1,
-1.759105, 0.0925013, -1.241428, 1, 1, 1, 1, 1,
-1.734642, -0.5123652, -1.691289, 1, 1, 1, 1, 1,
-1.730723, -0.3734612, 0.1152183, 1, 1, 1, 1, 1,
-1.727296, 1.128536, -0.6268756, 1, 1, 1, 1, 1,
-1.723313, -0.6712242, -3.390259, 1, 1, 1, 1, 1,
-1.705547, 0.06420168, -1.484627, 1, 1, 1, 1, 1,
-1.705202, 1.140164, -0.1030079, 1, 1, 1, 1, 1,
-1.694081, -0.03220802, -2.424024, 1, 1, 1, 1, 1,
-1.68608, 0.880463, -0.5275536, 0, 0, 1, 1, 1,
-1.673126, 1.093279, 0.4728322, 1, 0, 0, 1, 1,
-1.645165, -0.1855342, -0.6900295, 1, 0, 0, 1, 1,
-1.637492, 1.258116, -1.081727, 1, 0, 0, 1, 1,
-1.615052, -0.5498037, -1.181095, 1, 0, 0, 1, 1,
-1.602489, -1.92545, -0.4082718, 1, 0, 0, 1, 1,
-1.594734, 1.095457, 1.573566, 0, 0, 0, 1, 1,
-1.592327, -0.2764465, -0.4243928, 0, 0, 0, 1, 1,
-1.552857, 0.7500966, -2.290083, 0, 0, 0, 1, 1,
-1.551718, -1.289639, -2.286845, 0, 0, 0, 1, 1,
-1.542648, -0.551887, -2.084619, 0, 0, 0, 1, 1,
-1.53732, 1.099458, 0.7958974, 0, 0, 0, 1, 1,
-1.531744, -1.453408, -2.745951, 0, 0, 0, 1, 1,
-1.528808, 0.2459883, -1.305698, 1, 1, 1, 1, 1,
-1.52481, 1.639858, -1.922721, 1, 1, 1, 1, 1,
-1.511347, 0.3618703, -2.16322, 1, 1, 1, 1, 1,
-1.502587, 1.403497, -1.400577, 1, 1, 1, 1, 1,
-1.501141, 1.539872, -1.563106, 1, 1, 1, 1, 1,
-1.482321, 0.3714758, -1.313634, 1, 1, 1, 1, 1,
-1.481907, -0.4079796, -1.871465, 1, 1, 1, 1, 1,
-1.472065, -0.2920505, -1.932551, 1, 1, 1, 1, 1,
-1.429959, -0.1906176, -0.2320851, 1, 1, 1, 1, 1,
-1.428876, 0.9504731, -2.391339, 1, 1, 1, 1, 1,
-1.40428, -0.2401376, -3.834353, 1, 1, 1, 1, 1,
-1.398557, -0.01158271, -1.75849, 1, 1, 1, 1, 1,
-1.385179, -0.4484729, -1.935882, 1, 1, 1, 1, 1,
-1.38222, -1.247451, -1.586634, 1, 1, 1, 1, 1,
-1.382161, 0.6205888, -2.380471, 1, 1, 1, 1, 1,
-1.376031, 0.3376204, -1.824952, 0, 0, 1, 1, 1,
-1.362363, 0.4390883, -1.163883, 1, 0, 0, 1, 1,
-1.352166, -1.084191, -2.17596, 1, 0, 0, 1, 1,
-1.343668, -0.7778642, -0.6295025, 1, 0, 0, 1, 1,
-1.339453, 0.7523029, -1.29647, 1, 0, 0, 1, 1,
-1.333714, 1.015363, -1.635306, 1, 0, 0, 1, 1,
-1.332506, -1.031484, -3.445295, 0, 0, 0, 1, 1,
-1.331456, 1.284814, -0.8832274, 0, 0, 0, 1, 1,
-1.323767, -0.03937491, -2.07006, 0, 0, 0, 1, 1,
-1.321649, 1.013872, -2.317893, 0, 0, 0, 1, 1,
-1.315609, 0.5592194, -0.3165292, 0, 0, 0, 1, 1,
-1.31503, 0.02531803, -1.388573, 0, 0, 0, 1, 1,
-1.31085, -0.6185736, -2.114994, 0, 0, 0, 1, 1,
-1.302845, -0.4056925, -3.536508, 1, 1, 1, 1, 1,
-1.279524, -0.9447362, -0.835743, 1, 1, 1, 1, 1,
-1.271177, -0.5211793, -3.912721, 1, 1, 1, 1, 1,
-1.261808, 2.398502, -0.3187175, 1, 1, 1, 1, 1,
-1.234545, 0.5012239, -1.814768, 1, 1, 1, 1, 1,
-1.232526, 0.1283002, -1.965227, 1, 1, 1, 1, 1,
-1.228489, 0.4129213, -1.518208, 1, 1, 1, 1, 1,
-1.21334, 0.4354869, -1.562407, 1, 1, 1, 1, 1,
-1.212797, -0.05081677, -1.326967, 1, 1, 1, 1, 1,
-1.207933, 0.2297371, -2.80251, 1, 1, 1, 1, 1,
-1.20437, 1.032259, -2.038116, 1, 1, 1, 1, 1,
-1.201002, 1.832272, -0.3010498, 1, 1, 1, 1, 1,
-1.199872, -0.951416, -0.9687619, 1, 1, 1, 1, 1,
-1.184303, 1.462787, -1.194728, 1, 1, 1, 1, 1,
-1.176029, -1.745911, -1.528564, 1, 1, 1, 1, 1,
-1.159866, -0.6083058, -3.178589, 0, 0, 1, 1, 1,
-1.156654, -0.6091064, -2.44121, 1, 0, 0, 1, 1,
-1.153791, -0.633012, -2.612663, 1, 0, 0, 1, 1,
-1.147645, -1.074222, -1.510945, 1, 0, 0, 1, 1,
-1.144007, 1.398176, -0.6282062, 1, 0, 0, 1, 1,
-1.141926, 0.07295882, -1.278435, 1, 0, 0, 1, 1,
-1.140152, -0.7662911, -2.180735, 0, 0, 0, 1, 1,
-1.128706, 1.00764, -2.4764, 0, 0, 0, 1, 1,
-1.125585, -2.193171, -2.713644, 0, 0, 0, 1, 1,
-1.125235, 0.1987186, -1.646477, 0, 0, 0, 1, 1,
-1.118001, -0.6203854, -2.853831, 0, 0, 0, 1, 1,
-1.117491, 0.2951157, -1.515951, 0, 0, 0, 1, 1,
-1.110178, 0.4290599, -1.264112, 0, 0, 0, 1, 1,
-1.108491, 1.030519, -1.304563, 1, 1, 1, 1, 1,
-1.104649, 0.9551843, 0.3180649, 1, 1, 1, 1, 1,
-1.10437, 0.062952, -0.2283879, 1, 1, 1, 1, 1,
-1.102969, 1.028808, -1.459635, 1, 1, 1, 1, 1,
-1.08358, -0.7690931, -2.834484, 1, 1, 1, 1, 1,
-1.059518, 2.424638, -0.7197186, 1, 1, 1, 1, 1,
-1.055323, -0.3298302, -1.771968, 1, 1, 1, 1, 1,
-1.040958, -0.06006997, -1.349228, 1, 1, 1, 1, 1,
-1.032495, -1.60742, -3.772432, 1, 1, 1, 1, 1,
-1.03232, -0.1671253, -0.7337871, 1, 1, 1, 1, 1,
-1.026642, -1.670162, -2.554725, 1, 1, 1, 1, 1,
-1.024701, -0.2361144, -1.214807, 1, 1, 1, 1, 1,
-1.023085, -1.15462, -4.522374, 1, 1, 1, 1, 1,
-1.019772, -1.389511, -4.003076, 1, 1, 1, 1, 1,
-1.017415, -0.4514924, -3.409987, 1, 1, 1, 1, 1,
-1.006275, 1.036251, 0.1277658, 0, 0, 1, 1, 1,
-1.003391, -1.494084, -3.167856, 1, 0, 0, 1, 1,
-0.9981308, -0.2800568, -2.45421, 1, 0, 0, 1, 1,
-0.9960212, 0.3090515, -0.07069759, 1, 0, 0, 1, 1,
-0.9944617, -1.045618, -3.110559, 1, 0, 0, 1, 1,
-0.9919025, 0.5505424, -0.9446234, 1, 0, 0, 1, 1,
-0.98884, 0.1932643, -1.475699, 0, 0, 0, 1, 1,
-0.9886517, -0.05851424, -0.6795373, 0, 0, 0, 1, 1,
-0.9885806, 1.480085, -0.3097045, 0, 0, 0, 1, 1,
-0.9760264, 0.1135127, -0.9324233, 0, 0, 0, 1, 1,
-0.9741625, 1.469628, -1.454506, 0, 0, 0, 1, 1,
-0.9721978, 0.2405834, -2.967299, 0, 0, 0, 1, 1,
-0.9721639, -1.073353, -2.058262, 0, 0, 0, 1, 1,
-0.9691431, 0.2524383, -1.81422, 1, 1, 1, 1, 1,
-0.968994, -0.469343, -2.592753, 1, 1, 1, 1, 1,
-0.968102, 1.621943, -1.470276, 1, 1, 1, 1, 1,
-0.9638139, -0.567578, -2.064473, 1, 1, 1, 1, 1,
-0.9436613, 0.7147872, -2.01683, 1, 1, 1, 1, 1,
-0.9363427, -0.1718697, -0.2735008, 1, 1, 1, 1, 1,
-0.9351147, 0.2854301, -2.05144, 1, 1, 1, 1, 1,
-0.9342801, 1.809935, -1.240127, 1, 1, 1, 1, 1,
-0.9329804, 0.3996963, -2.513351, 1, 1, 1, 1, 1,
-0.9318272, 0.812981, -1.297586, 1, 1, 1, 1, 1,
-0.9315333, 0.2779033, -1.324076, 1, 1, 1, 1, 1,
-0.9170945, 0.1968619, -3.527336, 1, 1, 1, 1, 1,
-0.8959535, -0.9041435, -3.163999, 1, 1, 1, 1, 1,
-0.8949394, -0.3702872, -3.537141, 1, 1, 1, 1, 1,
-0.8877477, -1.582083, -3.381284, 1, 1, 1, 1, 1,
-0.8861287, 1.545399, -1.292197, 0, 0, 1, 1, 1,
-0.8812943, 1.807676, -0.8309962, 1, 0, 0, 1, 1,
-0.8806501, 1.532031, -1.168333, 1, 0, 0, 1, 1,
-0.8767735, -0.4399605, -1.390855, 1, 0, 0, 1, 1,
-0.8755435, -0.355108, 0.9158406, 1, 0, 0, 1, 1,
-0.8650705, 0.569459, -1.425663, 1, 0, 0, 1, 1,
-0.8633324, 0.9806958, -0.1729419, 0, 0, 0, 1, 1,
-0.8594662, -0.1532599, -1.309232, 0, 0, 0, 1, 1,
-0.8591087, -0.0661694, -1.493238, 0, 0, 0, 1, 1,
-0.8581064, 1.446965, 0.6351262, 0, 0, 0, 1, 1,
-0.8559306, 0.7620645, -0.1405837, 0, 0, 0, 1, 1,
-0.8536351, 1.617983, -1.512799, 0, 0, 0, 1, 1,
-0.8503467, 1.775063, -0.3663166, 0, 0, 0, 1, 1,
-0.8473222, -0.1087576, -0.1604783, 1, 1, 1, 1, 1,
-0.8378927, -1.497543, -1.534484, 1, 1, 1, 1, 1,
-0.837634, -1.959891, -0.6020989, 1, 1, 1, 1, 1,
-0.8341997, 0.569505, -1.84913, 1, 1, 1, 1, 1,
-0.8300896, -0.6819274, -1.4996, 1, 1, 1, 1, 1,
-0.8240049, 0.7765561, -0.02030444, 1, 1, 1, 1, 1,
-0.8237352, 1.546862, 0.4703516, 1, 1, 1, 1, 1,
-0.8203219, -1.126294, -2.145716, 1, 1, 1, 1, 1,
-0.8174304, -1.61908, -2.069394, 1, 1, 1, 1, 1,
-0.8164729, 0.004920417, -0.7773322, 1, 1, 1, 1, 1,
-0.8158856, -1.632564, -1.519365, 1, 1, 1, 1, 1,
-0.8140884, -1.025044, -3.031303, 1, 1, 1, 1, 1,
-0.8122447, 0.983057, 1.427755, 1, 1, 1, 1, 1,
-0.8111279, 0.08177771, -0.5139759, 1, 1, 1, 1, 1,
-0.8058472, 0.6875456, -1.323694, 1, 1, 1, 1, 1,
-0.8020242, -0.7491238, -1.990231, 0, 0, 1, 1, 1,
-0.8012385, 0.1209406, -1.639951, 1, 0, 0, 1, 1,
-0.7982174, 0.1632783, -2.692673, 1, 0, 0, 1, 1,
-0.7960831, 1.372655, -0.3647509, 1, 0, 0, 1, 1,
-0.7945037, -0.5045505, -2.864869, 1, 0, 0, 1, 1,
-0.7931452, 0.4398596, -0.5443111, 1, 0, 0, 1, 1,
-0.792914, -0.6607946, -2.099944, 0, 0, 0, 1, 1,
-0.7888141, -1.050785, -2.727624, 0, 0, 0, 1, 1,
-0.7879838, -1.190138, -3.201912, 0, 0, 0, 1, 1,
-0.7876573, 0.4561091, -1.651702, 0, 0, 0, 1, 1,
-0.7868286, -0.6621481, -2.372304, 0, 0, 0, 1, 1,
-0.7844816, -0.6615482, -3.761447, 0, 0, 0, 1, 1,
-0.7803754, -0.6344836, -1.483378, 0, 0, 0, 1, 1,
-0.7801642, -0.8731882, -2.327259, 1, 1, 1, 1, 1,
-0.7762759, 2.35092, 1.199413, 1, 1, 1, 1, 1,
-0.7756695, 0.6242521, 0.0927567, 1, 1, 1, 1, 1,
-0.7745949, 0.06919052, -1.479034, 1, 1, 1, 1, 1,
-0.7700801, 1.30419, 1.275542, 1, 1, 1, 1, 1,
-0.7645947, 0.6060096, -0.1791062, 1, 1, 1, 1, 1,
-0.7629471, -1.387047, -2.051815, 1, 1, 1, 1, 1,
-0.7624745, -1.346848, -0.7145453, 1, 1, 1, 1, 1,
-0.7619118, -1.239631, -2.615515, 1, 1, 1, 1, 1,
-0.75946, -0.5826385, -3.227752, 1, 1, 1, 1, 1,
-0.7522928, -0.04736131, -2.095883, 1, 1, 1, 1, 1,
-0.7507532, -0.8277357, -2.825824, 1, 1, 1, 1, 1,
-0.7491032, -0.7711979, -2.914986, 1, 1, 1, 1, 1,
-0.7427828, -1.012429, -3.184773, 1, 1, 1, 1, 1,
-0.7427451, -1.983739, -3.083256, 1, 1, 1, 1, 1,
-0.7419431, -0.1938142, -0.09610151, 0, 0, 1, 1, 1,
-0.7376899, 0.1546444, -2.107107, 1, 0, 0, 1, 1,
-0.7363713, -0.06413323, -2.137129, 1, 0, 0, 1, 1,
-0.7304858, 0.2909224, -1.019683, 1, 0, 0, 1, 1,
-0.7289113, -0.7559881, -2.32729, 1, 0, 0, 1, 1,
-0.7282233, 0.708843, -0.2535771, 1, 0, 0, 1, 1,
-0.7282001, -0.6956877, -3.546505, 0, 0, 0, 1, 1,
-0.724371, -1.037615, -1.865848, 0, 0, 0, 1, 1,
-0.7210999, -1.251409, -3.038129, 0, 0, 0, 1, 1,
-0.7204071, 1.083057, -0.5928223, 0, 0, 0, 1, 1,
-0.7183381, -1.220131, -1.323332, 0, 0, 0, 1, 1,
-0.7142305, -1.192879, -2.663286, 0, 0, 0, 1, 1,
-0.7135408, 1.206458, -1.03011, 0, 0, 0, 1, 1,
-0.7096494, 0.8668954, -0.9367581, 1, 1, 1, 1, 1,
-0.7085542, 1.671852, 2.360243, 1, 1, 1, 1, 1,
-0.7080362, -0.4131796, -1.984546, 1, 1, 1, 1, 1,
-0.708006, -0.9071939, -4.325438, 1, 1, 1, 1, 1,
-0.7078068, -1.330048, -1.771544, 1, 1, 1, 1, 1,
-0.7051656, -0.4550791, -3.509685, 1, 1, 1, 1, 1,
-0.7004115, 0.1290671, -1.618182, 1, 1, 1, 1, 1,
-0.698186, 0.02748391, -1.032065, 1, 1, 1, 1, 1,
-0.6971301, 0.3464031, -0.3615209, 1, 1, 1, 1, 1,
-0.6955457, -0.567978, -1.093634, 1, 1, 1, 1, 1,
-0.6914816, 0.8252835, -1.75831, 1, 1, 1, 1, 1,
-0.6901753, 0.3063318, 0.1348146, 1, 1, 1, 1, 1,
-0.6899848, 0.08658973, -0.3658139, 1, 1, 1, 1, 1,
-0.6877758, 1.818663, 0.217141, 1, 1, 1, 1, 1,
-0.6797577, -0.6475259, -3.384266, 1, 1, 1, 1, 1,
-0.6767673, 0.5932168, -1.17539, 0, 0, 1, 1, 1,
-0.6762769, 0.1653416, -0.8056937, 1, 0, 0, 1, 1,
-0.6736516, 1.820312, -2.021895, 1, 0, 0, 1, 1,
-0.6687527, -0.6442211, -2.04154, 1, 0, 0, 1, 1,
-0.6684921, -0.224947, -3.552369, 1, 0, 0, 1, 1,
-0.6661789, -0.773978, -1.869836, 1, 0, 0, 1, 1,
-0.6656974, 0.1662595, -1.009535, 0, 0, 0, 1, 1,
-0.66427, -0.149091, -0.6737354, 0, 0, 0, 1, 1,
-0.6626431, -1.382454, -1.770524, 0, 0, 0, 1, 1,
-0.662504, 1.338594, -1.205212, 0, 0, 0, 1, 1,
-0.6597293, -0.7731588, -1.993165, 0, 0, 0, 1, 1,
-0.6572892, 0.05907389, -0.646427, 0, 0, 0, 1, 1,
-0.6519805, -1.561189, -2.549938, 0, 0, 0, 1, 1,
-0.6429769, -0.1522594, -2.291833, 1, 1, 1, 1, 1,
-0.6391119, -0.8413659, -2.766397, 1, 1, 1, 1, 1,
-0.637356, 0.8239983, -0.6770731, 1, 1, 1, 1, 1,
-0.6314275, 1.485766, -0.5651994, 1, 1, 1, 1, 1,
-0.6263456, 0.7664399, -1.126779, 1, 1, 1, 1, 1,
-0.6258562, -0.9829788, -3.975781, 1, 1, 1, 1, 1,
-0.618029, -0.08411523, -2.246459, 1, 1, 1, 1, 1,
-0.6141145, -2.380809, -2.257161, 1, 1, 1, 1, 1,
-0.6091835, -1.854467, -1.326188, 1, 1, 1, 1, 1,
-0.6075428, 1.430637, -1.196331, 1, 1, 1, 1, 1,
-0.6071248, -0.8454389, -1.864646, 1, 1, 1, 1, 1,
-0.6066671, 0.2967228, -1.364331, 1, 1, 1, 1, 1,
-0.6041683, 0.006610371, -1.966814, 1, 1, 1, 1, 1,
-0.6040043, -0.4224347, -2.484429, 1, 1, 1, 1, 1,
-0.6019087, 1.226141, -2.013076, 1, 1, 1, 1, 1,
-0.5957133, 0.5657388, 0.5227138, 0, 0, 1, 1, 1,
-0.5949288, 0.796872, -2.027891, 1, 0, 0, 1, 1,
-0.5890949, 0.298294, -1.053802, 1, 0, 0, 1, 1,
-0.5836836, -0.3446011, -2.056946, 1, 0, 0, 1, 1,
-0.5749469, 1.459924, 0.04833821, 1, 0, 0, 1, 1,
-0.5646588, -0.7669452, -2.721523, 1, 0, 0, 1, 1,
-0.5631744, -1.069981, -3.010378, 0, 0, 0, 1, 1,
-0.5541686, -0.1079645, -3.115035, 0, 0, 0, 1, 1,
-0.5347518, -1.16711, -2.5497, 0, 0, 0, 1, 1,
-0.5326538, 0.01304725, -0.74167, 0, 0, 0, 1, 1,
-0.5274637, 0.134462, -1.253589, 0, 0, 0, 1, 1,
-0.5271431, -0.9688911, -1.553055, 0, 0, 0, 1, 1,
-0.5250674, -0.2930513, -2.363642, 0, 0, 0, 1, 1,
-0.52294, 1.040443, 2.426702, 1, 1, 1, 1, 1,
-0.5194968, -0.2437876, -2.619596, 1, 1, 1, 1, 1,
-0.5187016, -2.013613, -4.215437, 1, 1, 1, 1, 1,
-0.508208, 2.323324, 0.4931011, 1, 1, 1, 1, 1,
-0.5080728, -0.2233089, -2.089031, 1, 1, 1, 1, 1,
-0.5060206, -0.1659044, -2.41487, 1, 1, 1, 1, 1,
-0.5048548, -1.057247, -2.685172, 1, 1, 1, 1, 1,
-0.5000385, 1.591724, -2.474447, 1, 1, 1, 1, 1,
-0.4965577, -1.385465, -0.966145, 1, 1, 1, 1, 1,
-0.4921212, -0.8415467, -3.144838, 1, 1, 1, 1, 1,
-0.491729, -1.121215, -3.948474, 1, 1, 1, 1, 1,
-0.4890545, 1.047914, 0.5947628, 1, 1, 1, 1, 1,
-0.4879099, 0.2409199, -3.305722, 1, 1, 1, 1, 1,
-0.4869561, -1.581136, -2.88834, 1, 1, 1, 1, 1,
-0.4864371, -1.462871, -3.69871, 1, 1, 1, 1, 1,
-0.4811119, -1.216761, -3.181822, 0, 0, 1, 1, 1,
-0.4790453, -1.713441, -3.531145, 1, 0, 0, 1, 1,
-0.4736999, -0.3070149, -2.110959, 1, 0, 0, 1, 1,
-0.4705138, -0.05437906, -0.8519486, 1, 0, 0, 1, 1,
-0.4687945, -0.1572215, -1.297948, 1, 0, 0, 1, 1,
-0.4676228, -1.384593, -2.28722, 1, 0, 0, 1, 1,
-0.4674347, -0.6931766, -1.9362, 0, 0, 0, 1, 1,
-0.4665512, 0.08013479, -1.117845, 0, 0, 0, 1, 1,
-0.4622689, 0.1810153, -3.535664, 0, 0, 0, 1, 1,
-0.4606098, 0.6520657, 0.924378, 0, 0, 0, 1, 1,
-0.4592701, 1.734878, -0.7833678, 0, 0, 0, 1, 1,
-0.4561698, 0.483327, -1.134337, 0, 0, 0, 1, 1,
-0.4525334, -0.04248989, -0.5029718, 0, 0, 0, 1, 1,
-0.4474953, 1.105393, -1.362912, 1, 1, 1, 1, 1,
-0.446667, 2.049488, 0.2778723, 1, 1, 1, 1, 1,
-0.4465637, 0.6815845, 0.3419492, 1, 1, 1, 1, 1,
-0.440008, -0.05178462, -0.9136631, 1, 1, 1, 1, 1,
-0.4371161, 0.3515294, -2.486833, 1, 1, 1, 1, 1,
-0.4343271, 1.255277, 0.4164726, 1, 1, 1, 1, 1,
-0.4311977, 1.045446, 0.3892428, 1, 1, 1, 1, 1,
-0.4244221, -0.3768649, -5.108101, 1, 1, 1, 1, 1,
-0.4220068, -0.3357894, -2.107919, 1, 1, 1, 1, 1,
-0.4196575, 0.1521693, -1.127241, 1, 1, 1, 1, 1,
-0.4159303, -0.9234992, -2.753945, 1, 1, 1, 1, 1,
-0.4152652, -0.5288495, -2.252735, 1, 1, 1, 1, 1,
-0.4114256, 0.03411123, -1.686855, 1, 1, 1, 1, 1,
-0.4086985, 1.08263, 0.1344829, 1, 1, 1, 1, 1,
-0.4065774, 0.1039971, -1.030662, 1, 1, 1, 1, 1,
-0.4034306, 2.179463, -1.352326, 0, 0, 1, 1, 1,
-0.4010186, 1.502099, -0.2879966, 1, 0, 0, 1, 1,
-0.3997662, -0.7364543, -2.228889, 1, 0, 0, 1, 1,
-0.3991891, -0.2251615, -3.572, 1, 0, 0, 1, 1,
-0.3989949, 0.1265997, -1.012946, 1, 0, 0, 1, 1,
-0.397148, -1.243105, -1.637895, 1, 0, 0, 1, 1,
-0.3958911, -0.1930824, -1.246692, 0, 0, 0, 1, 1,
-0.391716, 0.5577739, -0.5766956, 0, 0, 0, 1, 1,
-0.3907834, 0.9545622, 0.2755327, 0, 0, 0, 1, 1,
-0.3901694, 0.802427, -0.3747547, 0, 0, 0, 1, 1,
-0.3855178, -1.066391, -3.685816, 0, 0, 0, 1, 1,
-0.3842582, -0.7354689, -2.580473, 0, 0, 0, 1, 1,
-0.3840368, 1.775167, -1.163621, 0, 0, 0, 1, 1,
-0.3824172, 0.7832804, -1.275052, 1, 1, 1, 1, 1,
-0.3820292, 0.8898752, -2.803765, 1, 1, 1, 1, 1,
-0.3813363, -0.5762663, -2.376332, 1, 1, 1, 1, 1,
-0.3787149, -0.2420343, -0.8890179, 1, 1, 1, 1, 1,
-0.3769794, -1.318331, -3.243438, 1, 1, 1, 1, 1,
-0.3753666, 0.4736532, -0.3603922, 1, 1, 1, 1, 1,
-0.3751229, -0.1671654, -1.03907, 1, 1, 1, 1, 1,
-0.3743409, -2.243943, -4.093981, 1, 1, 1, 1, 1,
-0.3729439, -1.792118, -2.898962, 1, 1, 1, 1, 1,
-0.3704567, 1.242017, 0.03696562, 1, 1, 1, 1, 1,
-0.3679744, -0.05333391, -2.354695, 1, 1, 1, 1, 1,
-0.3664684, 1.715154, 0.5315287, 1, 1, 1, 1, 1,
-0.3653899, 0.1161185, -2.895782, 1, 1, 1, 1, 1,
-0.3638653, 1.546077, -0.330263, 1, 1, 1, 1, 1,
-0.3637564, 0.9442196, -1.096748, 1, 1, 1, 1, 1,
-0.3610653, 0.6212034, -0.1041307, 0, 0, 1, 1, 1,
-0.3580934, -1.978138, -3.407641, 1, 0, 0, 1, 1,
-0.3558049, 1.626797, 0.3736541, 1, 0, 0, 1, 1,
-0.3549986, -0.5193164, -1.323436, 1, 0, 0, 1, 1,
-0.3538747, -0.8577218, -4.300222, 1, 0, 0, 1, 1,
-0.3530783, 1.485771, 0.940335, 1, 0, 0, 1, 1,
-0.3507684, -0.3871163, -3.253974, 0, 0, 0, 1, 1,
-0.3507625, -0.704278, -1.362865, 0, 0, 0, 1, 1,
-0.3502993, 0.05889205, 0.9361206, 0, 0, 0, 1, 1,
-0.3477033, 0.09844644, -1.090682, 0, 0, 0, 1, 1,
-0.3475922, 0.06277171, -1.234771, 0, 0, 0, 1, 1,
-0.3416385, -0.5505847, -4.453219, 0, 0, 0, 1, 1,
-0.3403568, 0.9455562, -0.6284769, 0, 0, 0, 1, 1,
-0.3386517, -1.421709, -3.152237, 1, 1, 1, 1, 1,
-0.3348332, -0.1893745, -1.959388, 1, 1, 1, 1, 1,
-0.3326902, 0.3336183, -1.674703, 1, 1, 1, 1, 1,
-0.3326814, 0.7499287, 2.639215, 1, 1, 1, 1, 1,
-0.3253745, -0.8556566, -2.942085, 1, 1, 1, 1, 1,
-0.3210752, 2.015481, -0.8632185, 1, 1, 1, 1, 1,
-0.3198238, -1.211287, -2.645483, 1, 1, 1, 1, 1,
-0.3144467, -0.9545527, -1.357121, 1, 1, 1, 1, 1,
-0.3133038, 0.6222777, 1.147038, 1, 1, 1, 1, 1,
-0.3117076, -1.421501, -3.020244, 1, 1, 1, 1, 1,
-0.3087972, 0.787163, -0.1577346, 1, 1, 1, 1, 1,
-0.3037949, 1.390009, 0.272204, 1, 1, 1, 1, 1,
-0.2919702, 0.9522355, 0.7477131, 1, 1, 1, 1, 1,
-0.2801436, 1.756835, -0.3561968, 1, 1, 1, 1, 1,
-0.2799332, -0.3135904, -0.1700993, 1, 1, 1, 1, 1,
-0.2795757, -1.420204, -2.814848, 0, 0, 1, 1, 1,
-0.2794602, 0.5295969, -0.1461396, 1, 0, 0, 1, 1,
-0.2784569, 0.4043156, -2.069399, 1, 0, 0, 1, 1,
-0.2775166, 0.3547106, -1.779733, 1, 0, 0, 1, 1,
-0.2766514, 1.760141, -0.9962891, 1, 0, 0, 1, 1,
-0.2740119, -1.046667, -3.267138, 1, 0, 0, 1, 1,
-0.2652914, 0.7846082, 1.260448, 0, 0, 0, 1, 1,
-0.2621695, 0.8262467, 0.6662606, 0, 0, 0, 1, 1,
-0.2610621, 0.9108319, -0.5631963, 0, 0, 0, 1, 1,
-0.2602369, -1.306155, -3.878034, 0, 0, 0, 1, 1,
-0.2541826, -0.01810939, -0.8482939, 0, 0, 0, 1, 1,
-0.2470249, 1.455294, -0.6002026, 0, 0, 0, 1, 1,
-0.2469578, -1.211331, -4.631392, 0, 0, 0, 1, 1,
-0.2448459, -0.604557, -3.562302, 1, 1, 1, 1, 1,
-0.2413539, 0.3850515, -0.1919294, 1, 1, 1, 1, 1,
-0.2378926, 0.1023889, -0.5079157, 1, 1, 1, 1, 1,
-0.2374507, -0.6477137, -4.399371, 1, 1, 1, 1, 1,
-0.2349462, 1.386821, -2.296643, 1, 1, 1, 1, 1,
-0.2338449, -0.240785, -2.073985, 1, 1, 1, 1, 1,
-0.2297285, -0.8484566, -2.87448, 1, 1, 1, 1, 1,
-0.2278708, -0.7418956, -1.418264, 1, 1, 1, 1, 1,
-0.2256043, -0.03224833, -2.201351, 1, 1, 1, 1, 1,
-0.2208712, -0.1861405, -1.450601, 1, 1, 1, 1, 1,
-0.2190634, -2.152717, -4.916765, 1, 1, 1, 1, 1,
-0.2168541, 0.8595866, -1.646054, 1, 1, 1, 1, 1,
-0.2097237, 0.00943636, -1.38112, 1, 1, 1, 1, 1,
-0.2052593, -0.06845129, -1.129732, 1, 1, 1, 1, 1,
-0.2037411, -0.4858299, -0.9665051, 1, 1, 1, 1, 1,
-0.2017083, 0.1204505, -2.228386, 0, 0, 1, 1, 1,
-0.1947446, -0.7897145, -4.555298, 1, 0, 0, 1, 1,
-0.1937879, -0.4281623, -2.524144, 1, 0, 0, 1, 1,
-0.1844771, 1.218963, -2.478374, 1, 0, 0, 1, 1,
-0.1805019, 0.220534, -1.720649, 1, 0, 0, 1, 1,
-0.1793707, 0.2732854, -0.7934452, 1, 0, 0, 1, 1,
-0.1788137, -0.4885737, -3.812315, 0, 0, 0, 1, 1,
-0.1780194, 0.001065119, -4.201342, 0, 0, 0, 1, 1,
-0.1778738, -1.653464, -4.407688, 0, 0, 0, 1, 1,
-0.1755223, -0.08693942, -2.072413, 0, 0, 0, 1, 1,
-0.1741748, -0.002445129, -2.395597, 0, 0, 0, 1, 1,
-0.1732127, -0.7302774, -1.970027, 0, 0, 0, 1, 1,
-0.1732005, -1.370659, -4.689708, 0, 0, 0, 1, 1,
-0.1726285, 0.9076576, 0.8189094, 1, 1, 1, 1, 1,
-0.1709391, 0.9074965, -1.89973, 1, 1, 1, 1, 1,
-0.1657092, 0.785343, 2.16115, 1, 1, 1, 1, 1,
-0.1637199, 0.7889411, 0.2488552, 1, 1, 1, 1, 1,
-0.1631387, 0.4106318, -0.8791754, 1, 1, 1, 1, 1,
-0.1605555, 1.029077, -1.058867, 1, 1, 1, 1, 1,
-0.1480493, -1.445855, -2.900913, 1, 1, 1, 1, 1,
-0.1465001, 1.057491, -0.6389151, 1, 1, 1, 1, 1,
-0.144848, 0.8569891, -1.068014, 1, 1, 1, 1, 1,
-0.1367472, 0.9443085, 0.4735096, 1, 1, 1, 1, 1,
-0.1328595, 0.979335, -0.5073638, 1, 1, 1, 1, 1,
-0.1323929, 0.6877562, 0.08944648, 1, 1, 1, 1, 1,
-0.1312228, -2.166841, -1.53793, 1, 1, 1, 1, 1,
-0.1273384, 0.1144496, -1.159209, 1, 1, 1, 1, 1,
-0.1267561, -1.090901, -1.373168, 1, 1, 1, 1, 1,
-0.1248061, -0.3185574, -1.731985, 0, 0, 1, 1, 1,
-0.1212294, -0.2417737, -2.026356, 1, 0, 0, 1, 1,
-0.1161465, -0.9242201, -2.747981, 1, 0, 0, 1, 1,
-0.1108135, -0.01102577, -1.918321, 1, 0, 0, 1, 1,
-0.1094745, -0.2138629, -2.633775, 1, 0, 0, 1, 1,
-0.1093785, 0.6253916, -0.9417686, 1, 0, 0, 1, 1,
-0.09974514, -0.8540499, -1.721897, 0, 0, 0, 1, 1,
-0.09888136, -1.236243, -1.739967, 0, 0, 0, 1, 1,
-0.09415219, 1.725133, -0.4731848, 0, 0, 0, 1, 1,
-0.09353451, 1.782768, 0.9273294, 0, 0, 0, 1, 1,
-0.08889046, -0.362457, -2.307322, 0, 0, 0, 1, 1,
-0.08624224, 0.4682505, -1.276715, 0, 0, 0, 1, 1,
-0.08602076, 0.1333836, -0.2720659, 0, 0, 0, 1, 1,
-0.08541416, -0.1228156, -3.10435, 1, 1, 1, 1, 1,
-0.08384272, 0.3443874, -1.387341, 1, 1, 1, 1, 1,
-0.08211622, 0.7343137, 1.201809, 1, 1, 1, 1, 1,
-0.08043149, 0.2352372, -0.7069246, 1, 1, 1, 1, 1,
-0.07611883, -0.3509813, -3.87187, 1, 1, 1, 1, 1,
-0.07259305, -0.01037335, -1.499912, 1, 1, 1, 1, 1,
-0.06982186, 0.05682816, -1.815603, 1, 1, 1, 1, 1,
-0.06743739, 0.7949519, -0.2766782, 1, 1, 1, 1, 1,
-0.06646639, -1.323102, -2.141204, 1, 1, 1, 1, 1,
-0.06567781, 1.400734, -1.632369, 1, 1, 1, 1, 1,
-0.06058591, -0.1694407, -3.428982, 1, 1, 1, 1, 1,
-0.05766745, -1.198761, -3.274848, 1, 1, 1, 1, 1,
-0.05704166, 0.2952695, -1.138485, 1, 1, 1, 1, 1,
-0.05634867, 1.280255, 0.1057867, 1, 1, 1, 1, 1,
-0.05608391, 1.679418, 0.5364358, 1, 1, 1, 1, 1,
-0.05404339, 0.2568298, -0.4727686, 0, 0, 1, 1, 1,
-0.05244052, 1.333715, 0.1721118, 1, 0, 0, 1, 1,
-0.04646317, -0.2945138, -3.513743, 1, 0, 0, 1, 1,
-0.04603979, -0.2097507, -3.088103, 1, 0, 0, 1, 1,
-0.04478626, -1.252146, -2.931399, 1, 0, 0, 1, 1,
-0.04319683, 0.6640893, 1.855176, 1, 0, 0, 1, 1,
-0.03778072, -1.69887, -1.095585, 0, 0, 0, 1, 1,
-0.02846768, 0.0510699, 0.1553284, 0, 0, 0, 1, 1,
-0.0279336, 0.3925388, -0.6486181, 0, 0, 0, 1, 1,
-0.02777093, 1.203688, 0.6448288, 0, 0, 0, 1, 1,
-0.02521802, 0.02877603, -1.627465, 0, 0, 0, 1, 1,
-0.02305789, -0.09786666, -3.48937, 0, 0, 0, 1, 1,
-0.02267477, -0.4521347, -2.957581, 0, 0, 0, 1, 1,
-0.01862505, -0.6693764, -3.792576, 1, 1, 1, 1, 1,
-0.01840897, 0.9330023, 0.2048198, 1, 1, 1, 1, 1,
-0.01808836, -0.3162768, -3.825887, 1, 1, 1, 1, 1,
-0.01465715, 1.852801, -0.4922196, 1, 1, 1, 1, 1,
-0.01397309, -0.3194416, -3.320641, 1, 1, 1, 1, 1,
-0.01165856, 0.2036755, -0.1443046, 1, 1, 1, 1, 1,
-0.009599984, -1.63959, -3.678901, 1, 1, 1, 1, 1,
-0.006552274, -0.7232395, -3.933022, 1, 1, 1, 1, 1,
-0.004010084, 0.4348448, -1.248119, 1, 1, 1, 1, 1,
-0.00353812, 0.08280703, -0.9683045, 1, 1, 1, 1, 1,
-0.002538613, 2.613834, -0.02128944, 1, 1, 1, 1, 1,
-0.002106983, -0.9526232, -2.450882, 1, 1, 1, 1, 1,
0.001530114, -0.2666011, 3.029486, 1, 1, 1, 1, 1,
0.003392235, -0.6284028, 3.795768, 1, 1, 1, 1, 1,
0.004521037, 0.172027, 1.161452, 1, 1, 1, 1, 1,
0.007073101, 0.2041596, 1.166986, 0, 0, 1, 1, 1,
0.008094836, -0.7742885, 3.941716, 1, 0, 0, 1, 1,
0.0100862, 0.4701135, 0.2552844, 1, 0, 0, 1, 1,
0.01528534, -0.7775884, 2.921986, 1, 0, 0, 1, 1,
0.0161518, 0.01656218, 1.149963, 1, 0, 0, 1, 1,
0.01997744, 0.1883332, 0.2139959, 1, 0, 0, 1, 1,
0.02941088, -0.4504662, 2.385593, 0, 0, 0, 1, 1,
0.03447911, 0.2211685, -2.170024, 0, 0, 0, 1, 1,
0.03718023, 0.3673138, 1.467322, 0, 0, 0, 1, 1,
0.03785208, -0.8389759, 2.870236, 0, 0, 0, 1, 1,
0.0387739, -1.028251, 3.309642, 0, 0, 0, 1, 1,
0.04162697, 1.266231, -0.9401073, 0, 0, 0, 1, 1,
0.04181881, -0.5518906, 1.930671, 0, 0, 0, 1, 1,
0.04585147, -1.816799, 3.766675, 1, 1, 1, 1, 1,
0.04913715, -0.5287287, 3.203316, 1, 1, 1, 1, 1,
0.05815629, 0.5210412, 0.2984697, 1, 1, 1, 1, 1,
0.05840749, 1.204759, -0.5393751, 1, 1, 1, 1, 1,
0.05915388, -1.555514, 1.980908, 1, 1, 1, 1, 1,
0.06540361, 1.993104, 0.812229, 1, 1, 1, 1, 1,
0.06752723, -1.759623, 1.108573, 1, 1, 1, 1, 1,
0.06799329, -0.8831996, 2.093025, 1, 1, 1, 1, 1,
0.07000848, -0.8270547, 2.576916, 1, 1, 1, 1, 1,
0.07080702, 1.204631, -1.552721, 1, 1, 1, 1, 1,
0.07084505, 0.1415239, 1.678535, 1, 1, 1, 1, 1,
0.07153021, -0.2783947, 2.057386, 1, 1, 1, 1, 1,
0.07429566, -0.6662279, 3.864093, 1, 1, 1, 1, 1,
0.07553694, -0.6416309, 2.19849, 1, 1, 1, 1, 1,
0.07672015, -0.3143785, 0.9415373, 1, 1, 1, 1, 1,
0.0776283, -1.114514, 2.492189, 0, 0, 1, 1, 1,
0.07819624, 0.2417846, 2.707865, 1, 0, 0, 1, 1,
0.07829762, -0.8599364, 3.755399, 1, 0, 0, 1, 1,
0.08183236, 1.049176, 0.575949, 1, 0, 0, 1, 1,
0.0866305, -1.189188, 2.722372, 1, 0, 0, 1, 1,
0.0867665, 0.1166102, -0.3973425, 1, 0, 0, 1, 1,
0.09465016, -0.348996, 3.470686, 0, 0, 0, 1, 1,
0.09491704, 0.2127698, 0.03814011, 0, 0, 0, 1, 1,
0.09628052, -1.409592, 3.191594, 0, 0, 0, 1, 1,
0.09756155, -2.442226, 2.752888, 0, 0, 0, 1, 1,
0.09888764, -1.44525, 4.005477, 0, 0, 0, 1, 1,
0.1021195, -1.45427, 3.012213, 0, 0, 0, 1, 1,
0.1044148, -1.733961, 3.174638, 0, 0, 0, 1, 1,
0.1115799, 0.02411787, 1.527541, 1, 1, 1, 1, 1,
0.1128888, 0.3930146, -0.04279446, 1, 1, 1, 1, 1,
0.1182132, 0.3823916, 0.8869495, 1, 1, 1, 1, 1,
0.1203807, 0.9468289, 1.475304, 1, 1, 1, 1, 1,
0.1228303, 1.009236, -0.9183361, 1, 1, 1, 1, 1,
0.1231109, 1.013556, 0.7317488, 1, 1, 1, 1, 1,
0.1258959, 1.506122, -0.1281898, 1, 1, 1, 1, 1,
0.1336575, 0.188583, 1.32803, 1, 1, 1, 1, 1,
0.1419378, 1.24438, 2.036543, 1, 1, 1, 1, 1,
0.1421391, -0.7343295, 2.787167, 1, 1, 1, 1, 1,
0.1445614, -1.507535, 4.078847, 1, 1, 1, 1, 1,
0.1478042, 1.477694, 0.5157985, 1, 1, 1, 1, 1,
0.1494407, -0.2955704, 3.01552, 1, 1, 1, 1, 1,
0.1542951, -0.895791, 2.635361, 1, 1, 1, 1, 1,
0.1653231, 0.2217216, -0.2446266, 1, 1, 1, 1, 1,
0.1656662, 0.1787243, 1.226706, 0, 0, 1, 1, 1,
0.1675027, 1.394027, 3.132348, 1, 0, 0, 1, 1,
0.1679471, 1.110739, 1.713033, 1, 0, 0, 1, 1,
0.1693282, 1.594259, 0.366623, 1, 0, 0, 1, 1,
0.1744234, -1.299454, 4.283204, 1, 0, 0, 1, 1,
0.177325, 0.6783464, -1.941411, 1, 0, 0, 1, 1,
0.1778325, -0.4116411, 1.541047, 0, 0, 0, 1, 1,
0.1802359, -0.313221, 3.69378, 0, 0, 0, 1, 1,
0.1803439, -0.2938697, 1.518716, 0, 0, 0, 1, 1,
0.1880699, 0.2734931, 0.6326908, 0, 0, 0, 1, 1,
0.188721, -0.8113461, 3.548955, 0, 0, 0, 1, 1,
0.1952138, -0.8342138, 3.043994, 0, 0, 0, 1, 1,
0.1960966, 0.766213, -0.8148272, 0, 0, 0, 1, 1,
0.1962776, -1.337713, 4.064447, 1, 1, 1, 1, 1,
0.1991411, 0.4378557, 0.9052241, 1, 1, 1, 1, 1,
0.2012919, -0.707373, 4.662573, 1, 1, 1, 1, 1,
0.2044623, -0.3832356, 0.6576321, 1, 1, 1, 1, 1,
0.2055427, -0.6662023, 3.255415, 1, 1, 1, 1, 1,
0.2059387, 0.2416834, -0.6955428, 1, 1, 1, 1, 1,
0.2096175, -1.309236, 2.525188, 1, 1, 1, 1, 1,
0.2111326, 0.7898535, 1.197879, 1, 1, 1, 1, 1,
0.212706, 0.303435, -0.1112679, 1, 1, 1, 1, 1,
0.2184324, -0.6455735, 1.514242, 1, 1, 1, 1, 1,
0.2226315, 1.08482, -0.4421078, 1, 1, 1, 1, 1,
0.2233409, -0.1509439, 2.092222, 1, 1, 1, 1, 1,
0.224096, -0.3726866, 3.063694, 1, 1, 1, 1, 1,
0.2262842, -0.7254598, 3.386032, 1, 1, 1, 1, 1,
0.2358988, 1.372545, -0.7279271, 1, 1, 1, 1, 1,
0.237456, 0.02351459, 1.955551, 0, 0, 1, 1, 1,
0.2395719, -0.2183316, 2.733561, 1, 0, 0, 1, 1,
0.2410222, -1.542922, 2.129616, 1, 0, 0, 1, 1,
0.2416451, 0.6240212, 1.40012, 1, 0, 0, 1, 1,
0.2423113, -0.8848581, 4.882137, 1, 0, 0, 1, 1,
0.2465524, -0.8311573, 4.457031, 1, 0, 0, 1, 1,
0.2499999, 0.955892, -0.1764818, 0, 0, 0, 1, 1,
0.2515661, -1.290102, 1.615864, 0, 0, 0, 1, 1,
0.25688, -1.40358, 2.771233, 0, 0, 0, 1, 1,
0.2593227, -0.1248508, 2.725478, 0, 0, 0, 1, 1,
0.2613583, 0.6549481, -0.465027, 0, 0, 0, 1, 1,
0.2616991, -0.398179, 4.148049, 0, 0, 0, 1, 1,
0.2635628, 0.1259619, 2.954724, 0, 0, 0, 1, 1,
0.2649376, 0.5738526, 0.3810696, 1, 1, 1, 1, 1,
0.2670046, -0.3238105, 1.156564, 1, 1, 1, 1, 1,
0.2676865, -1.368281, 4.589257, 1, 1, 1, 1, 1,
0.268178, -0.3328052, 2.152833, 1, 1, 1, 1, 1,
0.2683177, 0.1692115, 0.3447856, 1, 1, 1, 1, 1,
0.2702756, -1.22362, 2.62247, 1, 1, 1, 1, 1,
0.2710997, 0.2244663, 2.261495, 1, 1, 1, 1, 1,
0.2733561, -1.004812, 1.468954, 1, 1, 1, 1, 1,
0.273546, 0.9745739, 0.9232689, 1, 1, 1, 1, 1,
0.2763847, -0.6747716, 3.31366, 1, 1, 1, 1, 1,
0.278571, 0.5508888, 2.116126, 1, 1, 1, 1, 1,
0.2801051, -0.9821385, 3.919926, 1, 1, 1, 1, 1,
0.2801773, 0.435219, 1.041295, 1, 1, 1, 1, 1,
0.2840758, -1.308687, 1.252417, 1, 1, 1, 1, 1,
0.2855524, 0.7313908, 0.7762451, 1, 1, 1, 1, 1,
0.2877741, -0.4877404, 3.403063, 0, 0, 1, 1, 1,
0.2879761, 1.27967, 0.5472286, 1, 0, 0, 1, 1,
0.2880586, -0.8225869, 2.925526, 1, 0, 0, 1, 1,
0.2893371, 1.284048, -0.4276515, 1, 0, 0, 1, 1,
0.2902127, -0.4289111, 1.913331, 1, 0, 0, 1, 1,
0.2950698, -0.5232431, 3.336744, 1, 0, 0, 1, 1,
0.2963201, 0.1844897, 2.457698, 0, 0, 0, 1, 1,
0.2986044, -0.4167421, 3.902237, 0, 0, 0, 1, 1,
0.2999173, -0.5616143, 3.133646, 0, 0, 0, 1, 1,
0.3039352, 0.9719358, 0.5713517, 0, 0, 0, 1, 1,
0.3081186, 1.226194, -1.135863, 0, 0, 0, 1, 1,
0.3239018, 0.03422477, 3.608325, 0, 0, 0, 1, 1,
0.3258285, -1.084702, 2.808172, 0, 0, 0, 1, 1,
0.3295984, -0.6863972, 2.173422, 1, 1, 1, 1, 1,
0.3314986, -0.9829677, 3.310389, 1, 1, 1, 1, 1,
0.3341632, -1.005495, 3.674655, 1, 1, 1, 1, 1,
0.3409454, 2.453478, 1.014679, 1, 1, 1, 1, 1,
0.3415517, 0.1589661, 2.70832, 1, 1, 1, 1, 1,
0.3437382, 0.1638183, 1.761448, 1, 1, 1, 1, 1,
0.3437723, 0.7368312, 0.9421297, 1, 1, 1, 1, 1,
0.3444556, -1.367947, 3.546002, 1, 1, 1, 1, 1,
0.3476098, -0.4769708, 2.241823, 1, 1, 1, 1, 1,
0.3483415, 0.6199132, 0.1854346, 1, 1, 1, 1, 1,
0.3487622, 1.175187, -0.125274, 1, 1, 1, 1, 1,
0.349348, -0.3492449, 3.244393, 1, 1, 1, 1, 1,
0.3496739, -0.3141822, 3.047019, 1, 1, 1, 1, 1,
0.3507214, 1.865781, 0.9463568, 1, 1, 1, 1, 1,
0.3553929, -0.3803096, 2.105731, 1, 1, 1, 1, 1,
0.3569414, 1.834908, 0.1346698, 0, 0, 1, 1, 1,
0.3606908, 1.838825, -1.718339, 1, 0, 0, 1, 1,
0.3611627, 0.1282068, 1.133381, 1, 0, 0, 1, 1,
0.362825, -0.7392711, 3.037153, 1, 0, 0, 1, 1,
0.3643674, -0.411626, 1.098206, 1, 0, 0, 1, 1,
0.365422, -2.237233, 4.062495, 1, 0, 0, 1, 1,
0.3670265, 0.1977522, 2.110641, 0, 0, 0, 1, 1,
0.3681258, 0.5484909, 1.772877, 0, 0, 0, 1, 1,
0.3718848, 1.196554, -0.03763317, 0, 0, 0, 1, 1,
0.3733037, -0.7882749, 3.389267, 0, 0, 0, 1, 1,
0.373436, 1.032481, 0.4281605, 0, 0, 0, 1, 1,
0.3763705, -1.400686, 1.102475, 0, 0, 0, 1, 1,
0.3803506, -0.7579929, 2.993773, 0, 0, 0, 1, 1,
0.383031, 0.8493913, 1.286071, 1, 1, 1, 1, 1,
0.3839554, 0.9361557, -0.2666107, 1, 1, 1, 1, 1,
0.3846715, -1.048943, 2.273041, 1, 1, 1, 1, 1,
0.3856594, 1.416924, 0.6690577, 1, 1, 1, 1, 1,
0.3859234, 0.921308, 1.227566, 1, 1, 1, 1, 1,
0.3868448, -1.155206, 3.4793, 1, 1, 1, 1, 1,
0.387368, -0.1938236, 1.005225, 1, 1, 1, 1, 1,
0.3935584, 0.1163427, 1.744317, 1, 1, 1, 1, 1,
0.397886, 1.796446, -0.1556372, 1, 1, 1, 1, 1,
0.3983668, 0.8379204, -1.386204, 1, 1, 1, 1, 1,
0.4020662, 1.819936, -0.4319324, 1, 1, 1, 1, 1,
0.4054434, 1.978632, -1.486383, 1, 1, 1, 1, 1,
0.4076422, -0.434585, 3.188484, 1, 1, 1, 1, 1,
0.4078522, -0.2132208, 2.269695, 1, 1, 1, 1, 1,
0.4086953, 1.500391, 0.7700351, 1, 1, 1, 1, 1,
0.4225287, 0.658272, 0.5372226, 0, 0, 1, 1, 1,
0.4257577, 0.8289062, -0.1151369, 1, 0, 0, 1, 1,
0.426671, -0.8888472, 2.526833, 1, 0, 0, 1, 1,
0.4315698, 0.133592, 0.2767155, 1, 0, 0, 1, 1,
0.4395347, -0.5619137, 3.251904, 1, 0, 0, 1, 1,
0.4422593, 0.002917551, 0.6530133, 1, 0, 0, 1, 1,
0.4425337, 1.0332, 3.113918, 0, 0, 0, 1, 1,
0.4464996, 0.8279685, 0.2430382, 0, 0, 0, 1, 1,
0.4468268, 0.3696532, 0.8750201, 0, 0, 0, 1, 1,
0.4492201, 1.02989, 0.3893816, 0, 0, 0, 1, 1,
0.4512278, 0.5301793, -1.398112, 0, 0, 0, 1, 1,
0.4545705, -1.588571, 2.872661, 0, 0, 0, 1, 1,
0.4626545, 0.8015492, 2.257605, 0, 0, 0, 1, 1,
0.4662911, 0.2956084, 1.232977, 1, 1, 1, 1, 1,
0.4694542, -1.233197, 2.340215, 1, 1, 1, 1, 1,
0.4706822, -1.896223, 4.201451, 1, 1, 1, 1, 1,
0.4733829, 0.2807604, 0.4482928, 1, 1, 1, 1, 1,
0.4771022, 0.7674648, 1.204665, 1, 1, 1, 1, 1,
0.4812847, 0.2362235, 0.6949239, 1, 1, 1, 1, 1,
0.4813548, 0.6922401, 0.8860777, 1, 1, 1, 1, 1,
0.481896, -0.3858695, 1.743199, 1, 1, 1, 1, 1,
0.4841045, 1.339948, 0.109174, 1, 1, 1, 1, 1,
0.4850707, -0.7985094, 2.261943, 1, 1, 1, 1, 1,
0.4970776, -0.4114695, -0.2085923, 1, 1, 1, 1, 1,
0.5007924, -1.031057, 2.085655, 1, 1, 1, 1, 1,
0.5048541, -0.6477296, 1.892288, 1, 1, 1, 1, 1,
0.5061675, 0.09241158, 2.251431, 1, 1, 1, 1, 1,
0.5132672, -1.444214, 2.63077, 1, 1, 1, 1, 1,
0.5212985, 1.063222, -1.506442, 0, 0, 1, 1, 1,
0.5244985, -1.372558, 2.781928, 1, 0, 0, 1, 1,
0.5300487, 0.7234741, 0.9360735, 1, 0, 0, 1, 1,
0.5302866, 1.379837, 0.7534018, 1, 0, 0, 1, 1,
0.5308098, -0.4007939, 0.3387674, 1, 0, 0, 1, 1,
0.5312597, 1.302311, -0.1655029, 1, 0, 0, 1, 1,
0.535311, 1.417929, 0.3859409, 0, 0, 0, 1, 1,
0.5379637, -1.322294, 2.608473, 0, 0, 0, 1, 1,
0.5415707, 0.6287773, 1.789761, 0, 0, 0, 1, 1,
0.5498943, -2.150113, 3.004879, 0, 0, 0, 1, 1,
0.5500103, -0.4890733, 4.37137, 0, 0, 0, 1, 1,
0.5546951, 0.03395977, 2.424636, 0, 0, 0, 1, 1,
0.5566304, -1.418285, 3.543467, 0, 0, 0, 1, 1,
0.5652319, -1.662036, 1.327268, 1, 1, 1, 1, 1,
0.5666344, 0.09727638, 2.070453, 1, 1, 1, 1, 1,
0.5786645, 0.5070044, -0.9261569, 1, 1, 1, 1, 1,
0.5827332, -0.1971646, 2.271459, 1, 1, 1, 1, 1,
0.5837896, 0.0162885, 0.7036945, 1, 1, 1, 1, 1,
0.5872402, 0.6216807, 1.321226, 1, 1, 1, 1, 1,
0.5939474, -0.1832552, 0.4521663, 1, 1, 1, 1, 1,
0.5954491, 1.591974, -1.134566, 1, 1, 1, 1, 1,
0.5955618, -0.8175306, 3.351086, 1, 1, 1, 1, 1,
0.6122906, -0.3890645, 1.436612, 1, 1, 1, 1, 1,
0.6152695, -2.108912, 3.055753, 1, 1, 1, 1, 1,
0.617708, -1.514543, 2.162741, 1, 1, 1, 1, 1,
0.6222172, 1.42407, 0.8886164, 1, 1, 1, 1, 1,
0.6239924, 0.2231188, 1.559478, 1, 1, 1, 1, 1,
0.6334406, -0.2153435, 1.468303, 1, 1, 1, 1, 1,
0.6336886, -1.656619, 3.3591, 0, 0, 1, 1, 1,
0.6337703, -0.6859233, 3.381038, 1, 0, 0, 1, 1,
0.6378831, 0.5359206, 0.5322939, 1, 0, 0, 1, 1,
0.6389999, -0.5380119, 2.267471, 1, 0, 0, 1, 1,
0.6429216, -1.197039, 3.335983, 1, 0, 0, 1, 1,
0.6436568, -1.563225, 2.882254, 1, 0, 0, 1, 1,
0.6441132, 0.4761621, 1.57654, 0, 0, 0, 1, 1,
0.6455699, 0.0340218, 0.2665365, 0, 0, 0, 1, 1,
0.6462933, 0.9657545, 2.135258, 0, 0, 0, 1, 1,
0.6473403, 0.5764354, 0.0159396, 0, 0, 0, 1, 1,
0.6484048, 0.6043187, -1.234936, 0, 0, 0, 1, 1,
0.6516173, -0.6352791, 3.450786, 0, 0, 0, 1, 1,
0.654227, -0.591844, 3.214168, 0, 0, 0, 1, 1,
0.6650923, 2.355236, 0.4353527, 1, 1, 1, 1, 1,
0.6658027, 0.6279845, 1.245874, 1, 1, 1, 1, 1,
0.6667836, 0.4812847, 1.543924, 1, 1, 1, 1, 1,
0.6722566, -0.07631528, 2.796334, 1, 1, 1, 1, 1,
0.6729853, 0.7417777, 0.08360263, 1, 1, 1, 1, 1,
0.6731722, -0.4391401, 3.543603, 1, 1, 1, 1, 1,
0.6737986, -0.7614143, 4.161075, 1, 1, 1, 1, 1,
0.6742551, -0.3334785, 0.9000279, 1, 1, 1, 1, 1,
0.6771408, 1.100797, 1.394359, 1, 1, 1, 1, 1,
0.6889408, -0.1684059, 2.410743, 1, 1, 1, 1, 1,
0.6897091, -0.06400166, 1.536684, 1, 1, 1, 1, 1,
0.6904252, -0.8962346, 2.355396, 1, 1, 1, 1, 1,
0.6972207, 0.5289477, -0.512994, 1, 1, 1, 1, 1,
0.6974516, -2.499825, 2.932579, 1, 1, 1, 1, 1,
0.6990926, 0.8104542, 1.476151, 1, 1, 1, 1, 1,
0.6992846, 0.3863978, 0.3311495, 0, 0, 1, 1, 1,
0.7007373, 1.559395, 0.9692247, 1, 0, 0, 1, 1,
0.7015803, 0.8759822, -0.3634345, 1, 0, 0, 1, 1,
0.7064462, 1.219152, -0.2233756, 1, 0, 0, 1, 1,
0.7076132, 0.08782645, -0.7445783, 1, 0, 0, 1, 1,
0.7096721, 0.2697439, 0.296479, 1, 0, 0, 1, 1,
0.7159789, -0.6240249, 2.325269, 0, 0, 0, 1, 1,
0.7233889, 0.9591532, 2.085489, 0, 0, 0, 1, 1,
0.7290033, 0.02526789, 2.13157, 0, 0, 0, 1, 1,
0.7301394, -0.445232, 1.273813, 0, 0, 0, 1, 1,
0.7315004, -0.2410152, 1.531562, 0, 0, 0, 1, 1,
0.7326872, -1.051727, 2.470551, 0, 0, 0, 1, 1,
0.733025, 0.185106, 1.189729, 0, 0, 0, 1, 1,
0.7338417, 1.782499, -0.4860925, 1, 1, 1, 1, 1,
0.73581, 0.4991478, 0.7204776, 1, 1, 1, 1, 1,
0.7387983, -0.5163975, 1.81348, 1, 1, 1, 1, 1,
0.7429776, -0.7484058, -0.8886878, 1, 1, 1, 1, 1,
0.7448865, -1.788643, 3.641834, 1, 1, 1, 1, 1,
0.7456984, -1.321801, 2.049726, 1, 1, 1, 1, 1,
0.7457395, 1.311712, 0.3207484, 1, 1, 1, 1, 1,
0.7483817, -0.9102176, 3.407886, 1, 1, 1, 1, 1,
0.7585789, -1.490373, 3.468519, 1, 1, 1, 1, 1,
0.7607097, -1.373893, 0.4351743, 1, 1, 1, 1, 1,
0.7642286, 0.6273407, -0.1819867, 1, 1, 1, 1, 1,
0.7698364, -0.9448134, 2.926032, 1, 1, 1, 1, 1,
0.7709147, -0.1778066, 2.503783, 1, 1, 1, 1, 1,
0.7710708, -0.1668345, 1.01704, 1, 1, 1, 1, 1,
0.7743068, 0.1137622, 1.679624, 1, 1, 1, 1, 1,
0.7750475, 1.262492, 1.988207, 0, 0, 1, 1, 1,
0.779688, 0.0708084, 2.921527, 1, 0, 0, 1, 1,
0.7807438, -1.710914, 2.855241, 1, 0, 0, 1, 1,
0.7837397, -0.6747017, 4.161801, 1, 0, 0, 1, 1,
0.7852198, 0.7382687, 3.429174, 1, 0, 0, 1, 1,
0.7906817, -0.105061, -0.3399108, 1, 0, 0, 1, 1,
0.7944596, -0.5426003, 3.281547, 0, 0, 0, 1, 1,
0.8007103, -0.6373132, 2.363239, 0, 0, 0, 1, 1,
0.8060771, 0.6451215, 1.448869, 0, 0, 0, 1, 1,
0.8068648, -0.1926184, 1.158249, 0, 0, 0, 1, 1,
0.8097112, 0.7573683, 0.9014015, 0, 0, 0, 1, 1,
0.8104855, -0.4327574, 2.0495, 0, 0, 0, 1, 1,
0.8201628, 1.573575, -0.7483463, 0, 0, 0, 1, 1,
0.8274224, 0.1585617, 1.317876, 1, 1, 1, 1, 1,
0.8330309, 0.708992, -0.1055645, 1, 1, 1, 1, 1,
0.8353039, 0.3894606, 0.6434535, 1, 1, 1, 1, 1,
0.8354902, -1.321585, 1.869363, 1, 1, 1, 1, 1,
0.8365166, -0.6348123, 1.59043, 1, 1, 1, 1, 1,
0.8410755, -0.3994226, 3.107879, 1, 1, 1, 1, 1,
0.8482621, -0.8647507, 1.86319, 1, 1, 1, 1, 1,
0.8510509, -0.2093073, 1.41175, 1, 1, 1, 1, 1,
0.8576828, 1.023846, -0.2729244, 1, 1, 1, 1, 1,
0.8609377, 0.6312972, 0.5025462, 1, 1, 1, 1, 1,
0.8638254, 0.6435165, 0.9383157, 1, 1, 1, 1, 1,
0.8674489, -0.01387701, 1.786247, 1, 1, 1, 1, 1,
0.8710101, -1.490048, 3.606778, 1, 1, 1, 1, 1,
0.8710102, -0.106353, 0.8668032, 1, 1, 1, 1, 1,
0.875616, 0.1692342, 2.420724, 1, 1, 1, 1, 1,
0.8772179, -0.3781071, 0.6837181, 0, 0, 1, 1, 1,
0.8788386, 0.1907835, 0.8622521, 1, 0, 0, 1, 1,
0.8799133, -0.1979605, 2.309811, 1, 0, 0, 1, 1,
0.8821583, -1.839529, 0.6965909, 1, 0, 0, 1, 1,
0.8931027, -0.4601655, 4.613764, 1, 0, 0, 1, 1,
0.8945965, 0.5565612, 1.86459, 1, 0, 0, 1, 1,
0.9016041, -1.995185, 2.235034, 0, 0, 0, 1, 1,
0.9043669, 0.2982909, -0.6927685, 0, 0, 0, 1, 1,
0.9087293, -0.6627427, 0.9436761, 0, 0, 0, 1, 1,
0.9115022, -0.6001088, 2.12267, 0, 0, 0, 1, 1,
0.9129235, -1.5492, 3.451806, 0, 0, 0, 1, 1,
0.9162031, -0.6393486, 1.527127, 0, 0, 0, 1, 1,
0.918422, 0.7468954, 0.6427639, 0, 0, 0, 1, 1,
0.9201084, 0.6440747, 0.06081026, 1, 1, 1, 1, 1,
0.9208203, -0.6946498, 2.547935, 1, 1, 1, 1, 1,
0.92882, 1.346803, 0.1023133, 1, 1, 1, 1, 1,
0.9334373, -1.2581, 2.774203, 1, 1, 1, 1, 1,
0.9451314, -0.03963405, 1.494796, 1, 1, 1, 1, 1,
0.947282, -0.2890861, 2.453978, 1, 1, 1, 1, 1,
0.9517751, -0.5066308, 1.880166, 1, 1, 1, 1, 1,
0.9659323, 1.451473, 0.8660655, 1, 1, 1, 1, 1,
0.9683337, 1.246776, 1.354511, 1, 1, 1, 1, 1,
0.9683734, 0.02958355, 2.349127, 1, 1, 1, 1, 1,
0.9711574, -0.7940251, 3.414853, 1, 1, 1, 1, 1,
0.9775298, -1.372731, 3.190076, 1, 1, 1, 1, 1,
0.9843129, -1.603997, 2.403442, 1, 1, 1, 1, 1,
1.002071, 0.1871919, 2.960235, 1, 1, 1, 1, 1,
1.003917, -2.117666, 3.683029, 1, 1, 1, 1, 1,
1.015005, -1.16024, 2.951983, 0, 0, 1, 1, 1,
1.015276, 1.131625, 1.296626, 1, 0, 0, 1, 1,
1.017899, -0.7320561, 2.529331, 1, 0, 0, 1, 1,
1.018701, 0.9825932, 0.2325568, 1, 0, 0, 1, 1,
1.029648, 0.3437378, -0.2893092, 1, 0, 0, 1, 1,
1.03572, -0.966253, 4.614205, 1, 0, 0, 1, 1,
1.039571, -0.2149474, 1.136687, 0, 0, 0, 1, 1,
1.039782, 0.4589509, 3.078682, 0, 0, 0, 1, 1,
1.040024, 0.2437511, 0.9036337, 0, 0, 0, 1, 1,
1.043913, 1.657043, -0.2849688, 0, 0, 0, 1, 1,
1.046703, -0.2772784, 0.5517266, 0, 0, 0, 1, 1,
1.051866, -1.074759, 3.829806, 0, 0, 0, 1, 1,
1.05214, 1.640491, 0.3520046, 0, 0, 0, 1, 1,
1.05534, -0.4446123, 0.1213425, 1, 1, 1, 1, 1,
1.060599, -0.8668911, 1.146059, 1, 1, 1, 1, 1,
1.063565, -1.504009, 1.3226, 1, 1, 1, 1, 1,
1.063777, -0.4910737, -0.02024479, 1, 1, 1, 1, 1,
1.068133, 0.5215173, 0.997709, 1, 1, 1, 1, 1,
1.078267, 0.8071263, -0.07586404, 1, 1, 1, 1, 1,
1.079923, -0.2844481, 1.827722, 1, 1, 1, 1, 1,
1.080752, -0.9356001, 1.186919, 1, 1, 1, 1, 1,
1.084593, -0.9673588, 3.474689, 1, 1, 1, 1, 1,
1.093387, -0.2451076, 3.703593, 1, 1, 1, 1, 1,
1.097062, 0.3796499, 1.334339, 1, 1, 1, 1, 1,
1.100209, 2.636916, 1.009388, 1, 1, 1, 1, 1,
1.104633, 1.30778, 0.3461839, 1, 1, 1, 1, 1,
1.105669, -0.1714427, 2.018021, 1, 1, 1, 1, 1,
1.134082, -0.3726711, 1.446375, 1, 1, 1, 1, 1,
1.137679, 0.4519596, 1.898201, 0, 0, 1, 1, 1,
1.138292, 0.3177677, 0.5853536, 1, 0, 0, 1, 1,
1.138772, -1.20238, 3.732664, 1, 0, 0, 1, 1,
1.13988, 0.5953766, 0.4957973, 1, 0, 0, 1, 1,
1.148649, 0.998064, 1.213558, 1, 0, 0, 1, 1,
1.149913, -0.560809, 1.331931, 1, 0, 0, 1, 1,
1.153893, -0.5918827, 2.649989, 0, 0, 0, 1, 1,
1.158913, 0.8701628, 0.9521704, 0, 0, 0, 1, 1,
1.166265, 0.512164, -0.3005925, 0, 0, 0, 1, 1,
1.167438, 0.9417784, 0.2359958, 0, 0, 0, 1, 1,
1.170588, 0.8624477, 0.9544798, 0, 0, 0, 1, 1,
1.170698, 0.4030026, 1.615776, 0, 0, 0, 1, 1,
1.174588, -0.4566325, 3.026458, 0, 0, 0, 1, 1,
1.179415, 1.189719, 0.7022902, 1, 1, 1, 1, 1,
1.180995, -1.208611, 1.564528, 1, 1, 1, 1, 1,
1.18816, 0.3387296, 1.069553, 1, 1, 1, 1, 1,
1.19836, 2.493295, 1.213522, 1, 1, 1, 1, 1,
1.200568, -0.533343, 0.7974426, 1, 1, 1, 1, 1,
1.212635, 1.598087, 0.1975508, 1, 1, 1, 1, 1,
1.21722, 0.03684041, 2.06843, 1, 1, 1, 1, 1,
1.221009, -0.8565198, 1.533754, 1, 1, 1, 1, 1,
1.227954, -2.466325, 2.759147, 1, 1, 1, 1, 1,
1.228511, 1.259271, 0.3614868, 1, 1, 1, 1, 1,
1.230436, 1.075543, -0.1114007, 1, 1, 1, 1, 1,
1.230854, 1.210973, 1.241324, 1, 1, 1, 1, 1,
1.242137, 0.864952, -0.4344264, 1, 1, 1, 1, 1,
1.244243, 0.6181509, 1.164931, 1, 1, 1, 1, 1,
1.250746, -0.5311319, 3.472944, 1, 1, 1, 1, 1,
1.251611, -0.3533874, 0.9102408, 0, 0, 1, 1, 1,
1.252147, 1.430323, -0.08992624, 1, 0, 0, 1, 1,
1.26557, -1.169658, 3.92149, 1, 0, 0, 1, 1,
1.269464, 0.8124285, 0.4426911, 1, 0, 0, 1, 1,
1.270827, 0.5215912, 0.2835131, 1, 0, 0, 1, 1,
1.271872, -0.9142676, 2.549185, 1, 0, 0, 1, 1,
1.276943, 0.4737881, 0.2647484, 0, 0, 0, 1, 1,
1.28496, 0.4078345, 2.242315, 0, 0, 0, 1, 1,
1.291292, 0.5539422, 1.535358, 0, 0, 0, 1, 1,
1.29439, -1.007489, 3.30393, 0, 0, 0, 1, 1,
1.315107, 0.2532893, 0.3701085, 0, 0, 0, 1, 1,
1.316885, 1.731035, 1.756547, 0, 0, 0, 1, 1,
1.318966, 0.4316297, 2.467413, 0, 0, 0, 1, 1,
1.321042, 0.3267615, 0.8224219, 1, 1, 1, 1, 1,
1.323692, -0.4922693, 2.073556, 1, 1, 1, 1, 1,
1.329582, -0.7542843, 2.792626, 1, 1, 1, 1, 1,
1.333805, 1.233788, 1.133586, 1, 1, 1, 1, 1,
1.343124, -1.092381, 1.674377, 1, 1, 1, 1, 1,
1.350531, -1.34208, 0.7792773, 1, 1, 1, 1, 1,
1.378159, -0.949299, 0.7132392, 1, 1, 1, 1, 1,
1.381022, 0.8051845, 0.5071046, 1, 1, 1, 1, 1,
1.385135, 1.11575, -0.02479337, 1, 1, 1, 1, 1,
1.385269, -0.3527509, 2.655031, 1, 1, 1, 1, 1,
1.399415, -0.1395271, 2.521489, 1, 1, 1, 1, 1,
1.405686, -0.7796346, 2.79393, 1, 1, 1, 1, 1,
1.412019, -0.6752344, 1.782328, 1, 1, 1, 1, 1,
1.42404, 0.8052248, 1.998965, 1, 1, 1, 1, 1,
1.424298, -1.967355, 2.5122, 1, 1, 1, 1, 1,
1.43044, 0.4457117, 0.844624, 0, 0, 1, 1, 1,
1.430611, 0.4692083, 0.1787192, 1, 0, 0, 1, 1,
1.431026, -1.247562, 2.132488, 1, 0, 0, 1, 1,
1.443246, -0.02761806, 1.822, 1, 0, 0, 1, 1,
1.444621, 0.8735168, 0.8933957, 1, 0, 0, 1, 1,
1.460876, -0.2022396, 1.258449, 1, 0, 0, 1, 1,
1.464609, -1.424832, 2.891265, 0, 0, 0, 1, 1,
1.474459, 0.7222279, 1.281137, 0, 0, 0, 1, 1,
1.474564, 0.5357075, -0.377894, 0, 0, 0, 1, 1,
1.477199, 0.4961507, -0.03502116, 0, 0, 0, 1, 1,
1.484418, 1.666229, -0.6358428, 0, 0, 0, 1, 1,
1.502587, 0.9556084, -2.018767, 0, 0, 0, 1, 1,
1.505104, 2.081146, -0.5923827, 0, 0, 0, 1, 1,
1.505559, -0.954378, 1.262439, 1, 1, 1, 1, 1,
1.508631, 0.09620928, 2.446806, 1, 1, 1, 1, 1,
1.513437, 0.4292974, 2.199193, 1, 1, 1, 1, 1,
1.517864, -0.2538716, 0.5374374, 1, 1, 1, 1, 1,
1.548004, -1.013859, 4.154088, 1, 1, 1, 1, 1,
1.549062, -0.1305676, 2.350716, 1, 1, 1, 1, 1,
1.563119, -0.3689249, 1.924899, 1, 1, 1, 1, 1,
1.568963, 0.1497616, 1.711975, 1, 1, 1, 1, 1,
1.578099, -1.682126, 3.670295, 1, 1, 1, 1, 1,
1.58555, 1.760375, 0.1409273, 1, 1, 1, 1, 1,
1.589828, 0.1493027, 2.223818, 1, 1, 1, 1, 1,
1.596535, 1.51324, 1.392732, 1, 1, 1, 1, 1,
1.599832, 0.06926437, 0.8661178, 1, 1, 1, 1, 1,
1.600037, 0.805173, 1.617665, 1, 1, 1, 1, 1,
1.609336, 0.6778718, -0.2973103, 1, 1, 1, 1, 1,
1.611342, 0.5479377, 0.546923, 0, 0, 1, 1, 1,
1.614318, -0.2612958, 3.05707, 1, 0, 0, 1, 1,
1.616154, -0.4056509, 1.039711, 1, 0, 0, 1, 1,
1.633641, -0.687263, 1.467441, 1, 0, 0, 1, 1,
1.642346, -1.290415, 1.97737, 1, 0, 0, 1, 1,
1.64298, 0.3610698, 0.1878473, 1, 0, 0, 1, 1,
1.647422, -1.8256, 3.298162, 0, 0, 0, 1, 1,
1.654428, 0.7947611, -0.8452286, 0, 0, 0, 1, 1,
1.65813, -0.8365337, 1.027522, 0, 0, 0, 1, 1,
1.670987, 0.9936792, 2.89974, 0, 0, 0, 1, 1,
1.671344, 0.0749726, 2.788787, 0, 0, 0, 1, 1,
1.694883, -0.8117992, 2.150281, 0, 0, 0, 1, 1,
1.70974, -0.0807308, 3.658906, 0, 0, 0, 1, 1,
1.719101, 1.155343, 1.22671, 1, 1, 1, 1, 1,
1.720189, 2.092861, 1.393344, 1, 1, 1, 1, 1,
1.741622, -1.779288, 3.273619, 1, 1, 1, 1, 1,
1.742443, 1.138608, 0.6065794, 1, 1, 1, 1, 1,
1.793664, 0.8024251, 3.262314, 1, 1, 1, 1, 1,
1.802839, -0.7307405, 1.862644, 1, 1, 1, 1, 1,
1.8087, -0.6445099, 3.505339, 1, 1, 1, 1, 1,
1.844738, -0.558926, 1.931435, 1, 1, 1, 1, 1,
1.887074, 0.1787342, 1.339958, 1, 1, 1, 1, 1,
1.934014, 0.4282508, 0.4122595, 1, 1, 1, 1, 1,
1.935256, -0.5938241, 2.367536, 1, 1, 1, 1, 1,
1.936453, 0.6844189, 0.6994705, 1, 1, 1, 1, 1,
1.943495, -1.036078, 2.749815, 1, 1, 1, 1, 1,
1.954705, -0.5701707, 1.868978, 1, 1, 1, 1, 1,
1.956209, -1.418664, 4.763617, 1, 1, 1, 1, 1,
1.976829, 0.02304979, 1.958395, 0, 0, 1, 1, 1,
1.988573, -1.491231, 1.957798, 1, 0, 0, 1, 1,
2.069038, 0.1752906, 1.271873, 1, 0, 0, 1, 1,
2.103761, 0.4443335, 1.023055, 1, 0, 0, 1, 1,
2.214474, 3.070748, 1.267672, 1, 0, 0, 1, 1,
2.221836, 0.6775193, -0.0331376, 1, 0, 0, 1, 1,
2.231983, -0.3037006, 2.039392, 0, 0, 0, 1, 1,
2.232308, 0.2294955, 1.669041, 0, 0, 0, 1, 1,
2.237946, 0.2980199, 1.527534, 0, 0, 0, 1, 1,
2.388682, -1.200605, 3.012713, 0, 0, 0, 1, 1,
2.406296, 1.787545, 0.4459738, 0, 0, 0, 1, 1,
2.463752, -0.05162911, 1.676761, 0, 0, 0, 1, 1,
2.500087, 0.6365017, -0.4414474, 0, 0, 0, 1, 1,
2.53867, -1.784396, 1.825912, 1, 1, 1, 1, 1,
2.581057, -1.681587, 2.289958, 1, 1, 1, 1, 1,
2.592506, -0.4382608, 2.504472, 1, 1, 1, 1, 1,
2.725096, -0.03529889, 4.007109, 1, 1, 1, 1, 1,
2.840933, -0.6581948, 1.44292, 1, 1, 1, 1, 1,
2.987343, -1.987964, 2.817402, 1, 1, 1, 1, 1,
3.130941, -1.132657, -0.913083, 1, 1, 1, 1, 1
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
var radius = 9.04259;
var distance = 31.76172;
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
mvMatrix.translate( 0.02927184, -0.2854615, 0.1129823 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.76172);
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
