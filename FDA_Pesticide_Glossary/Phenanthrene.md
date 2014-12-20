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
-3.210046, -1.268094, -2.774632, 1, 0, 0, 1,
-2.82585, 0.7315156, -3.209913, 1, 0.007843138, 0, 1,
-2.794096, 1.642479, -0.6783455, 1, 0.01176471, 0, 1,
-2.745919, 0.02463418, -1.568187, 1, 0.01960784, 0, 1,
-2.71893, -0.7313794, -1.043246, 1, 0.02352941, 0, 1,
-2.565632, 1.466881, -0.4456027, 1, 0.03137255, 0, 1,
-2.550139, 1.743869, -1.747929, 1, 0.03529412, 0, 1,
-2.545452, 2.234991, -1.350551, 1, 0.04313726, 0, 1,
-2.354332, -1.043583, -1.969589, 1, 0.04705882, 0, 1,
-2.193399, -1.525154, -3.283878, 1, 0.05490196, 0, 1,
-2.185297, 0.7917918, 1.238611, 1, 0.05882353, 0, 1,
-2.180029, 1.028989, -2.006059, 1, 0.06666667, 0, 1,
-2.166151, 0.1138378, -1.504292, 1, 0.07058824, 0, 1,
-2.159523, 2.351167, -0.5475298, 1, 0.07843138, 0, 1,
-2.140004, 0.6333911, -1.077128, 1, 0.08235294, 0, 1,
-2.092695, -0.4064496, -4.097793, 1, 0.09019608, 0, 1,
-2.09257, 1.063345, -2.088758, 1, 0.09411765, 0, 1,
-2.046495, 1.153755, -1.181312, 1, 0.1019608, 0, 1,
-1.994763, 0.8826326, -1.324123, 1, 0.1098039, 0, 1,
-1.992727, -0.7775854, -2.503944, 1, 0.1137255, 0, 1,
-1.981628, 0.05762361, 0.4926144, 1, 0.1215686, 0, 1,
-1.977298, -0.03336689, -2.052208, 1, 0.1254902, 0, 1,
-1.968179, -0.01906196, -2.191867, 1, 0.1333333, 0, 1,
-1.959657, 0.2579688, -1.371052, 1, 0.1372549, 0, 1,
-1.921984, -0.1405984, -2.627168, 1, 0.145098, 0, 1,
-1.907731, 1.199974, -0.3452215, 1, 0.1490196, 0, 1,
-1.891475, -0.9792475, -0.698514, 1, 0.1568628, 0, 1,
-1.878225, -0.2933556, -2.838007, 1, 0.1607843, 0, 1,
-1.869103, 0.6555386, -0.8182728, 1, 0.1686275, 0, 1,
-1.861791, -0.984576, -3.289634, 1, 0.172549, 0, 1,
-1.834575, 0.7672035, -0.6675062, 1, 0.1803922, 0, 1,
-1.830969, -1.558183, -2.600791, 1, 0.1843137, 0, 1,
-1.816223, 0.1632277, 0.3296286, 1, 0.1921569, 0, 1,
-1.809023, 0.3482001, -1.16498, 1, 0.1960784, 0, 1,
-1.785739, 0.09463286, -0.4908397, 1, 0.2039216, 0, 1,
-1.754349, 3.540422, -1.729358, 1, 0.2117647, 0, 1,
-1.753532, -1.894028, -2.411846, 1, 0.2156863, 0, 1,
-1.752643, 1.488936, -0.1354702, 1, 0.2235294, 0, 1,
-1.739299, 0.4145946, -1.243203, 1, 0.227451, 0, 1,
-1.734031, 0.1294606, -1.423629, 1, 0.2352941, 0, 1,
-1.725952, 0.1959, -2.021775, 1, 0.2392157, 0, 1,
-1.71851, -0.8196291, -3.000585, 1, 0.2470588, 0, 1,
-1.701425, 0.2734479, -2.901902, 1, 0.2509804, 0, 1,
-1.700273, -0.4441796, -2.573273, 1, 0.2588235, 0, 1,
-1.700233, -1.662663, -1.325337, 1, 0.2627451, 0, 1,
-1.68202, -0.3555807, -2.928925, 1, 0.2705882, 0, 1,
-1.677109, -1.330914, -2.156642, 1, 0.2745098, 0, 1,
-1.677001, -1.564885, -4.041787, 1, 0.282353, 0, 1,
-1.66941, 0.1495803, -0.5345175, 1, 0.2862745, 0, 1,
-1.656811, 0.4653533, -0.5114076, 1, 0.2941177, 0, 1,
-1.651529, -0.052006, -1.731717, 1, 0.3019608, 0, 1,
-1.648879, 1.233271, 0.2365391, 1, 0.3058824, 0, 1,
-1.628177, 0.542899, -2.874821, 1, 0.3137255, 0, 1,
-1.576277, -1.078904, -2.468859, 1, 0.3176471, 0, 1,
-1.575924, 0.4188533, -1.389068, 1, 0.3254902, 0, 1,
-1.573167, 1.671166, -0.4529908, 1, 0.3294118, 0, 1,
-1.57229, -0.2687907, -0.9542118, 1, 0.3372549, 0, 1,
-1.56415, 0.4574628, -1.171653, 1, 0.3411765, 0, 1,
-1.563994, -0.1588039, -2.294974, 1, 0.3490196, 0, 1,
-1.556529, -0.2602733, -2.684967, 1, 0.3529412, 0, 1,
-1.518548, -0.8296073, -1.37262, 1, 0.3607843, 0, 1,
-1.499767, -0.6759642, -2.211756, 1, 0.3647059, 0, 1,
-1.491676, -0.4360422, -1.805806, 1, 0.372549, 0, 1,
-1.489267, 1.842121, -0.2980479, 1, 0.3764706, 0, 1,
-1.482947, 0.5167574, -2.282211, 1, 0.3843137, 0, 1,
-1.472758, -0.6234089, -2.598454, 1, 0.3882353, 0, 1,
-1.468228, -0.3838889, -0.6479775, 1, 0.3960784, 0, 1,
-1.457195, 0.1501235, -1.063231, 1, 0.4039216, 0, 1,
-1.447171, -1.109025, -1.342598, 1, 0.4078431, 0, 1,
-1.444835, -1.003794, -2.105547, 1, 0.4156863, 0, 1,
-1.442366, -0.3527036, -2.955479, 1, 0.4196078, 0, 1,
-1.433545, 1.042553, -0.3274488, 1, 0.427451, 0, 1,
-1.432574, 0.006771014, -1.147711, 1, 0.4313726, 0, 1,
-1.431613, 0.4463709, -1.575628, 1, 0.4392157, 0, 1,
-1.417419, 0.6837556, -0.2963142, 1, 0.4431373, 0, 1,
-1.41541, -1.465041, -3.173808, 1, 0.4509804, 0, 1,
-1.410835, 0.5414965, -1.361307, 1, 0.454902, 0, 1,
-1.404956, -0.5168049, -1.653248, 1, 0.4627451, 0, 1,
-1.404197, -1.51886, -1.843774, 1, 0.4666667, 0, 1,
-1.390963, 1.768101, 0.1237057, 1, 0.4745098, 0, 1,
-1.383536, -1.860556, -2.959286, 1, 0.4784314, 0, 1,
-1.3778, -0.02653812, -4.019034, 1, 0.4862745, 0, 1,
-1.363547, 0.2417804, -1.124239, 1, 0.4901961, 0, 1,
-1.361845, -1.510664, -2.012425, 1, 0.4980392, 0, 1,
-1.355276, -0.4045818, -3.142025, 1, 0.5058824, 0, 1,
-1.351765, 0.3474543, -0.9240633, 1, 0.509804, 0, 1,
-1.348934, -0.005549878, -1.427236, 1, 0.5176471, 0, 1,
-1.337732, 0.4980089, -0.8188589, 1, 0.5215687, 0, 1,
-1.333278, 0.08927481, -1.282454, 1, 0.5294118, 0, 1,
-1.329473, 1.184995, 0.3793978, 1, 0.5333334, 0, 1,
-1.327501, -0.3651904, -1.483767, 1, 0.5411765, 0, 1,
-1.317922, -0.8353485, -0.701111, 1, 0.5450981, 0, 1,
-1.31012, 0.3932084, -0.508496, 1, 0.5529412, 0, 1,
-1.308197, -1.50796, -2.563013, 1, 0.5568628, 0, 1,
-1.308037, -0.390569, -0.3407081, 1, 0.5647059, 0, 1,
-1.300065, 0.05092463, 0.2678342, 1, 0.5686275, 0, 1,
-1.297252, 0.3273495, -0.5937256, 1, 0.5764706, 0, 1,
-1.294452, 1.068146, -0.8506513, 1, 0.5803922, 0, 1,
-1.294393, -0.5795742, -0.8427866, 1, 0.5882353, 0, 1,
-1.291061, -0.5409772, -1.827633, 1, 0.5921569, 0, 1,
-1.277189, -1.012433, -1.36621, 1, 0.6, 0, 1,
-1.276948, -0.9983077, -2.449289, 1, 0.6078432, 0, 1,
-1.276546, -0.1825819, -1.09777, 1, 0.6117647, 0, 1,
-1.270002, -1.778404, -2.405886, 1, 0.6196079, 0, 1,
-1.269501, -0.8659372, -4.273741, 1, 0.6235294, 0, 1,
-1.266036, 0.8680719, -1.17887, 1, 0.6313726, 0, 1,
-1.248583, 2.18733, 0.7311395, 1, 0.6352941, 0, 1,
-1.246274, -1.309458, -2.364347, 1, 0.6431373, 0, 1,
-1.237537, -2.793728, -3.999525, 1, 0.6470588, 0, 1,
-1.230572, -0.5578299, -1.308459, 1, 0.654902, 0, 1,
-1.224951, 0.3297773, -1.931695, 1, 0.6588235, 0, 1,
-1.211457, -0.4254493, -1.961105, 1, 0.6666667, 0, 1,
-1.206936, 1.03808, -2.24806, 1, 0.6705883, 0, 1,
-1.20578, -0.0489415, -2.225479, 1, 0.6784314, 0, 1,
-1.205448, -1.266447, -1.753042, 1, 0.682353, 0, 1,
-1.20513, -1.306766, -2.627443, 1, 0.6901961, 0, 1,
-1.204574, -0.03092657, -2.506367, 1, 0.6941177, 0, 1,
-1.199417, -0.1752604, -1.831894, 1, 0.7019608, 0, 1,
-1.198775, -2.038147, -4.889284, 1, 0.7098039, 0, 1,
-1.198278, 0.1897722, 0.1635151, 1, 0.7137255, 0, 1,
-1.194379, 1.24976, -1.609255, 1, 0.7215686, 0, 1,
-1.181781, -2.431941, -2.433658, 1, 0.7254902, 0, 1,
-1.180103, -0.4216674, -1.022377, 1, 0.7333333, 0, 1,
-1.176807, 0.2382747, -0.133689, 1, 0.7372549, 0, 1,
-1.169632, -1.864274, -4.616281, 1, 0.7450981, 0, 1,
-1.16862, -0.2289878, -2.216478, 1, 0.7490196, 0, 1,
-1.168543, 0.5419195, -1.871149, 1, 0.7568628, 0, 1,
-1.165152, -0.2252192, -2.056408, 1, 0.7607843, 0, 1,
-1.164313, 0.3789232, -2.44418, 1, 0.7686275, 0, 1,
-1.163205, -1.302179, -0.5291984, 1, 0.772549, 0, 1,
-1.161546, -0.2792507, -2.682123, 1, 0.7803922, 0, 1,
-1.157307, -0.6724437, -2.268169, 1, 0.7843137, 0, 1,
-1.157104, -1.985742, -2.21883, 1, 0.7921569, 0, 1,
-1.151622, 0.6677218, 1.13786, 1, 0.7960784, 0, 1,
-1.14805, 0.3479384, -1.812267, 1, 0.8039216, 0, 1,
-1.137287, -0.9385761, -3.470669, 1, 0.8117647, 0, 1,
-1.130013, 0.6709635, 0.125282, 1, 0.8156863, 0, 1,
-1.129333, -0.1259194, -2.029497, 1, 0.8235294, 0, 1,
-1.119149, 0.1077247, -2.188494, 1, 0.827451, 0, 1,
-1.118429, 0.9183809, -2.100919, 1, 0.8352941, 0, 1,
-1.113168, -0.5900843, -2.999371, 1, 0.8392157, 0, 1,
-1.112227, -0.4076864, -2.294979, 1, 0.8470588, 0, 1,
-1.109364, 1.258842, -0.7068468, 1, 0.8509804, 0, 1,
-1.108359, 0.5265125, -1.301105, 1, 0.8588235, 0, 1,
-1.104164, -0.2975443, -2.723837, 1, 0.8627451, 0, 1,
-1.099617, 0.3604069, -1.660212, 1, 0.8705882, 0, 1,
-1.09787, 0.04977733, -2.608296, 1, 0.8745098, 0, 1,
-1.08716, -0.3576879, -0.8029007, 1, 0.8823529, 0, 1,
-1.082018, -0.2228587, -2.023369, 1, 0.8862745, 0, 1,
-1.077872, -0.2141075, -2.727028, 1, 0.8941177, 0, 1,
-1.068235, 0.05720584, -2.093348, 1, 0.8980392, 0, 1,
-1.058322, 0.8760817, -1.976877, 1, 0.9058824, 0, 1,
-1.054514, 0.6116401, -0.6100835, 1, 0.9137255, 0, 1,
-1.054342, -2.12906, -3.530208, 1, 0.9176471, 0, 1,
-1.051736, 0.1992253, -0.864836, 1, 0.9254902, 0, 1,
-1.05001, 1.436977, -0.9440229, 1, 0.9294118, 0, 1,
-1.042583, 0.5965301, 0.6052845, 1, 0.9372549, 0, 1,
-1.036224, -0.3369531, -0.5948649, 1, 0.9411765, 0, 1,
-1.021114, 1.209897, -0.3169434, 1, 0.9490196, 0, 1,
-1.020452, -1.768092, -3.563717, 1, 0.9529412, 0, 1,
-1.015016, -0.05949636, -1.445356, 1, 0.9607843, 0, 1,
-1.011008, -0.6661808, -1.341852, 1, 0.9647059, 0, 1,
-1.010912, -0.9064505, -3.73663, 1, 0.972549, 0, 1,
-1.002679, 0.04850711, -1.155812, 1, 0.9764706, 0, 1,
-0.992358, -1.125296, -3.823648, 1, 0.9843137, 0, 1,
-0.991111, -2.589079, -5.213478, 1, 0.9882353, 0, 1,
-0.9842079, 0.484702, -1.367223, 1, 0.9960784, 0, 1,
-0.9804498, -0.09749508, -1.419605, 0.9960784, 1, 0, 1,
-0.979301, 0.04797659, -0.4923379, 0.9921569, 1, 0, 1,
-0.9745633, -1.398362, -2.020552, 0.9843137, 1, 0, 1,
-0.9726313, 0.7831601, 0.9856967, 0.9803922, 1, 0, 1,
-0.9673464, 0.3628953, -0.7125032, 0.972549, 1, 0, 1,
-0.9652156, 0.5919278, -0.5986267, 0.9686275, 1, 0, 1,
-0.9624839, -0.588889, -3.149808, 0.9607843, 1, 0, 1,
-0.9618773, 0.2750694, -1.847026, 0.9568627, 1, 0, 1,
-0.960932, -0.4780828, -1.090783, 0.9490196, 1, 0, 1,
-0.9584568, -0.02765833, -0.7369505, 0.945098, 1, 0, 1,
-0.9555743, 0.3960027, 0.6451797, 0.9372549, 1, 0, 1,
-0.9481925, 0.09647392, -2.054804, 0.9333333, 1, 0, 1,
-0.9435075, 0.9105043, -1.502965, 0.9254902, 1, 0, 1,
-0.9359642, 1.493167, -0.4783646, 0.9215686, 1, 0, 1,
-0.9350285, -0.09831917, -1.583997, 0.9137255, 1, 0, 1,
-0.9317034, 0.8667052, 1.370787, 0.9098039, 1, 0, 1,
-0.9264895, -0.9539987, -2.499819, 0.9019608, 1, 0, 1,
-0.9217826, 0.1232919, -2.308303, 0.8941177, 1, 0, 1,
-0.9161664, -1.409297, -0.8312665, 0.8901961, 1, 0, 1,
-0.9150867, 0.4605749, -2.364827, 0.8823529, 1, 0, 1,
-0.9130331, 2.158253, 0.9292779, 0.8784314, 1, 0, 1,
-0.900194, 0.591935, -0.2750522, 0.8705882, 1, 0, 1,
-0.899821, -0.155814, -1.569901, 0.8666667, 1, 0, 1,
-0.8949792, 2.43311, 0.003684893, 0.8588235, 1, 0, 1,
-0.8909495, 0.6246337, -0.09189778, 0.854902, 1, 0, 1,
-0.8810478, -0.3189035, -0.5601141, 0.8470588, 1, 0, 1,
-0.8771282, 0.868894, -2.073632, 0.8431373, 1, 0, 1,
-0.8736063, 1.280896, -1.025179, 0.8352941, 1, 0, 1,
-0.8723971, 0.1383551, -1.101847, 0.8313726, 1, 0, 1,
-0.8659932, 0.8674505, 1.574539, 0.8235294, 1, 0, 1,
-0.8633595, -0.6988446, -3.754082, 0.8196079, 1, 0, 1,
-0.861009, -1.560254, -3.122591, 0.8117647, 1, 0, 1,
-0.858627, -0.3579763, -3.464246, 0.8078431, 1, 0, 1,
-0.857399, -0.3613586, -3.641447, 0.8, 1, 0, 1,
-0.8573932, 1.487337, 0.4457394, 0.7921569, 1, 0, 1,
-0.8521757, 0.05196004, -3.380784, 0.7882353, 1, 0, 1,
-0.8471621, -0.7165695, -3.096856, 0.7803922, 1, 0, 1,
-0.8351694, 0.004491944, -0.6150277, 0.7764706, 1, 0, 1,
-0.8339783, -0.9542316, -2.276073, 0.7686275, 1, 0, 1,
-0.8326539, -0.5584934, -1.198191, 0.7647059, 1, 0, 1,
-0.8312576, 1.80959, -1.958254, 0.7568628, 1, 0, 1,
-0.82535, 1.002815, -0.008935465, 0.7529412, 1, 0, 1,
-0.8088666, 0.7118383, -3.250161, 0.7450981, 1, 0, 1,
-0.8051567, -0.599466, -2.870187, 0.7411765, 1, 0, 1,
-0.8010677, -1.063221, -2.046152, 0.7333333, 1, 0, 1,
-0.7875924, 1.64543, -0.3802582, 0.7294118, 1, 0, 1,
-0.7872384, 0.6524187, 0.06132402, 0.7215686, 1, 0, 1,
-0.7854758, -0.6296276, -1.866401, 0.7176471, 1, 0, 1,
-0.785368, 1.10304, -1.228726, 0.7098039, 1, 0, 1,
-0.7837954, -0.115237, -0.8637142, 0.7058824, 1, 0, 1,
-0.7809827, -1.515677, -3.065205, 0.6980392, 1, 0, 1,
-0.7756872, -0.6432331, -2.895998, 0.6901961, 1, 0, 1,
-0.7756398, -2.43253, -2.77443, 0.6862745, 1, 0, 1,
-0.7668304, 0.813826, 1.317467, 0.6784314, 1, 0, 1,
-0.7576749, -0.352469, -2.489082, 0.6745098, 1, 0, 1,
-0.7572868, -0.0647155, -0.4133033, 0.6666667, 1, 0, 1,
-0.7567706, -1.223723, -2.109244, 0.6627451, 1, 0, 1,
-0.7543132, -0.2972473, -1.1069, 0.654902, 1, 0, 1,
-0.7537911, -0.3137536, -1.157813, 0.6509804, 1, 0, 1,
-0.7497531, 0.7601427, -1.36002, 0.6431373, 1, 0, 1,
-0.7481443, 1.69451, -0.6334871, 0.6392157, 1, 0, 1,
-0.7394434, 0.2006187, -1.019834, 0.6313726, 1, 0, 1,
-0.739089, 1.066338, -0.2490792, 0.627451, 1, 0, 1,
-0.738986, -0.02549365, -1.991732, 0.6196079, 1, 0, 1,
-0.7383139, -0.2329733, -1.642178, 0.6156863, 1, 0, 1,
-0.7367184, 0.3405043, -0.5273296, 0.6078432, 1, 0, 1,
-0.733989, -0.2216956, -0.1831526, 0.6039216, 1, 0, 1,
-0.722223, -1.433652, -3.292954, 0.5960785, 1, 0, 1,
-0.7204502, -0.05727526, -1.097885, 0.5882353, 1, 0, 1,
-0.7197795, 0.8025982, -2.329749, 0.5843138, 1, 0, 1,
-0.7194644, 1.102114, 0.721823, 0.5764706, 1, 0, 1,
-0.7119681, -0.904336, -3.077567, 0.572549, 1, 0, 1,
-0.7114766, 0.4494553, -1.400982, 0.5647059, 1, 0, 1,
-0.706489, 0.7167557, -0.8416901, 0.5607843, 1, 0, 1,
-0.706291, 0.9377679, -1.055162, 0.5529412, 1, 0, 1,
-0.7050347, -0.5662153, -0.2003908, 0.5490196, 1, 0, 1,
-0.7045605, 0.001020238, -2.359808, 0.5411765, 1, 0, 1,
-0.7031088, -0.4992307, -0.9468233, 0.5372549, 1, 0, 1,
-0.7028367, 0.1562097, -0.03228163, 0.5294118, 1, 0, 1,
-0.6939452, -0.1550674, -1.790377, 0.5254902, 1, 0, 1,
-0.6926181, -1.94396, -2.805614, 0.5176471, 1, 0, 1,
-0.6825586, -0.01170303, -2.360221, 0.5137255, 1, 0, 1,
-0.6822734, -1.229048, -1.446445, 0.5058824, 1, 0, 1,
-0.6820955, -0.4460965, -2.962627, 0.5019608, 1, 0, 1,
-0.680411, -0.08302016, -1.145686, 0.4941176, 1, 0, 1,
-0.6755908, 0.6408604, -1.798962, 0.4862745, 1, 0, 1,
-0.6747555, -0.009073563, -0.0655408, 0.4823529, 1, 0, 1,
-0.6731283, -0.5292236, -3.004737, 0.4745098, 1, 0, 1,
-0.6686075, -0.7883798, -2.030238, 0.4705882, 1, 0, 1,
-0.6675418, 2.375676, -0.1775174, 0.4627451, 1, 0, 1,
-0.6658922, -0.0768066, -2.81349, 0.4588235, 1, 0, 1,
-0.661496, 2.201751, 0.02427841, 0.4509804, 1, 0, 1,
-0.6560052, 0.4075831, -1.253732, 0.4470588, 1, 0, 1,
-0.6559673, -1.086233, -3.81431, 0.4392157, 1, 0, 1,
-0.6544652, 1.260268, -0.08579987, 0.4352941, 1, 0, 1,
-0.6534324, 0.6841943, 0.03459937, 0.427451, 1, 0, 1,
-0.6497457, -0.6016987, -1.485517, 0.4235294, 1, 0, 1,
-0.645402, 1.251134, 0.440061, 0.4156863, 1, 0, 1,
-0.6308408, -0.7217079, -1.547953, 0.4117647, 1, 0, 1,
-0.6250694, -0.2561643, -2.771414, 0.4039216, 1, 0, 1,
-0.6246638, 0.3158437, -2.202827, 0.3960784, 1, 0, 1,
-0.6233527, -0.1219618, -3.599741, 0.3921569, 1, 0, 1,
-0.6162492, 2.692266, 0.5794232, 0.3843137, 1, 0, 1,
-0.610275, -1.534199, -2.267874, 0.3803922, 1, 0, 1,
-0.6051696, 1.922549, -3.037788, 0.372549, 1, 0, 1,
-0.6025937, 1.989185, -0.5709623, 0.3686275, 1, 0, 1,
-0.6012274, 0.4530185, -1.368874, 0.3607843, 1, 0, 1,
-0.5970675, -0.2369995, -1.684168, 0.3568628, 1, 0, 1,
-0.5962388, -1.086716, -3.301783, 0.3490196, 1, 0, 1,
-0.591204, 0.02438219, -0.6828612, 0.345098, 1, 0, 1,
-0.5910969, 0.59074, -2.467429, 0.3372549, 1, 0, 1,
-0.5906179, -0.5665161, -1.738206, 0.3333333, 1, 0, 1,
-0.5883297, 1.168476, -0.3040794, 0.3254902, 1, 0, 1,
-0.5860512, -0.3431381, -1.829833, 0.3215686, 1, 0, 1,
-0.5785269, 1.87889, 0.09053975, 0.3137255, 1, 0, 1,
-0.5725079, 0.3070372, -1.207351, 0.3098039, 1, 0, 1,
-0.565201, -0.2635749, -0.8756604, 0.3019608, 1, 0, 1,
-0.5628069, -0.6122411, -2.314342, 0.2941177, 1, 0, 1,
-0.55932, -0.02377279, -1.336722, 0.2901961, 1, 0, 1,
-0.5577285, -0.6336401, -1.852206, 0.282353, 1, 0, 1,
-0.5554115, -0.6397491, -4.074995, 0.2784314, 1, 0, 1,
-0.5510326, -1.701624, -4.639766, 0.2705882, 1, 0, 1,
-0.5485238, -1.101109, -2.883499, 0.2666667, 1, 0, 1,
-0.5440106, 0.6589743, 1.233061, 0.2588235, 1, 0, 1,
-0.5429636, 0.001846929, -2.778541, 0.254902, 1, 0, 1,
-0.5409864, -0.05360329, -3.168445, 0.2470588, 1, 0, 1,
-0.5386719, 1.245747, -1.225323, 0.2431373, 1, 0, 1,
-0.5343841, -1.797995, -2.965192, 0.2352941, 1, 0, 1,
-0.5326225, -0.1456197, -2.505023, 0.2313726, 1, 0, 1,
-0.5115448, -0.582391, -2.486496, 0.2235294, 1, 0, 1,
-0.5098025, 0.3153074, 0.2967458, 0.2196078, 1, 0, 1,
-0.5074674, -2.139616, -2.308767, 0.2117647, 1, 0, 1,
-0.5072215, 0.7556607, -2.447347, 0.2078431, 1, 0, 1,
-0.5059658, -1.406739, -3.422063, 0.2, 1, 0, 1,
-0.5009751, 0.7834679, -0.5951568, 0.1921569, 1, 0, 1,
-0.500645, 1.184711, -0.4806027, 0.1882353, 1, 0, 1,
-0.4980498, 1.112912, -2.222912, 0.1803922, 1, 0, 1,
-0.4975421, 0.844776, 0.187765, 0.1764706, 1, 0, 1,
-0.4940517, 0.1117129, -1.401987, 0.1686275, 1, 0, 1,
-0.4912795, -0.4858063, -4.855066, 0.1647059, 1, 0, 1,
-0.4892391, -0.7847099, -3.182983, 0.1568628, 1, 0, 1,
-0.4849676, 0.6930388, -0.9725701, 0.1529412, 1, 0, 1,
-0.4827194, -0.5771165, -2.667491, 0.145098, 1, 0, 1,
-0.4814829, 0.7190473, 0.9816011, 0.1411765, 1, 0, 1,
-0.4771281, 0.8390803, -0.2711655, 0.1333333, 1, 0, 1,
-0.4701848, 0.2534585, -1.189453, 0.1294118, 1, 0, 1,
-0.4683453, 1.249413, 0.8279752, 0.1215686, 1, 0, 1,
-0.4673042, -0.7561722, -3.202859, 0.1176471, 1, 0, 1,
-0.4528402, 1.370767, -0.538534, 0.1098039, 1, 0, 1,
-0.4452991, 0.2142935, -1.700772, 0.1058824, 1, 0, 1,
-0.4443657, -1.119523, -2.95565, 0.09803922, 1, 0, 1,
-0.4417588, -0.8484221, -1.191252, 0.09019608, 1, 0, 1,
-0.437556, 1.166008, -0.3922519, 0.08627451, 1, 0, 1,
-0.437343, 1.090541, -0.4496906, 0.07843138, 1, 0, 1,
-0.434548, -0.01624146, -2.374912, 0.07450981, 1, 0, 1,
-0.4332322, -0.08019631, -2.729332, 0.06666667, 1, 0, 1,
-0.4317757, -0.4659004, -1.901908, 0.0627451, 1, 0, 1,
-0.428622, 0.7583533, 0.3488508, 0.05490196, 1, 0, 1,
-0.4228545, 0.0108341, -2.637327, 0.05098039, 1, 0, 1,
-0.4214946, -0.2714286, -0.7148787, 0.04313726, 1, 0, 1,
-0.4182401, 1.119887, 0.8619193, 0.03921569, 1, 0, 1,
-0.4130788, 0.4607171, -1.644364, 0.03137255, 1, 0, 1,
-0.41233, 0.3878202, -1.346665, 0.02745098, 1, 0, 1,
-0.3975595, 0.8748971, 0.08160489, 0.01960784, 1, 0, 1,
-0.3969128, 0.6184273, -1.771069, 0.01568628, 1, 0, 1,
-0.3836602, -0.5545914, -1.042114, 0.007843138, 1, 0, 1,
-0.3823256, 0.1081561, 0.2727779, 0.003921569, 1, 0, 1,
-0.3793327, 0.5542699, -0.8131341, 0, 1, 0.003921569, 1,
-0.3785706, 0.5627059, -3.353566, 0, 1, 0.01176471, 1,
-0.3743578, 0.3014382, 2.187215, 0, 1, 0.01568628, 1,
-0.369608, -0.2676418, -2.9224, 0, 1, 0.02352941, 1,
-0.3693562, 0.04068679, -0.2240319, 0, 1, 0.02745098, 1,
-0.3628326, 0.5922617, -1.299978, 0, 1, 0.03529412, 1,
-0.3625954, 0.155621, -0.8040503, 0, 1, 0.03921569, 1,
-0.3506097, 1.461982, 1.079708, 0, 1, 0.04705882, 1,
-0.3461773, -0.05321892, -2.248165, 0, 1, 0.05098039, 1,
-0.3439398, -0.4272262, -2.321881, 0, 1, 0.05882353, 1,
-0.3425082, 0.1852508, -1.493548, 0, 1, 0.0627451, 1,
-0.3387748, -0.2807811, -2.555901, 0, 1, 0.07058824, 1,
-0.3345093, 1.206834, -0.2568125, 0, 1, 0.07450981, 1,
-0.3343794, 1.143979, 1.352632, 0, 1, 0.08235294, 1,
-0.3273858, 2.447125, -1.487584, 0, 1, 0.08627451, 1,
-0.3263258, 0.4647428, 0.1769779, 0, 1, 0.09411765, 1,
-0.324382, -1.286536, -3.048267, 0, 1, 0.1019608, 1,
-0.3229503, -0.936747, -4.155243, 0, 1, 0.1058824, 1,
-0.3203996, 0.4945061, -2.303773, 0, 1, 0.1137255, 1,
-0.3201875, -0.6755639, -2.873664, 0, 1, 0.1176471, 1,
-0.3190564, -0.8560587, -1.384046, 0, 1, 0.1254902, 1,
-0.3153988, -0.9997924, -2.491532, 0, 1, 0.1294118, 1,
-0.3074697, 0.6205519, 1.047728, 0, 1, 0.1372549, 1,
-0.3060482, 0.6086434, -0.01031572, 0, 1, 0.1411765, 1,
-0.3036493, -0.7291597, -2.783626, 0, 1, 0.1490196, 1,
-0.2988698, 1.162407, 1.716166, 0, 1, 0.1529412, 1,
-0.2979688, 0.02058576, -1.123221, 0, 1, 0.1607843, 1,
-0.2941253, 1.185031, -0.6862801, 0, 1, 0.1647059, 1,
-0.2932346, 0.1125578, -2.38007, 0, 1, 0.172549, 1,
-0.2913693, 0.8223826, 0.4736598, 0, 1, 0.1764706, 1,
-0.2902119, 0.9222583, -1.534588, 0, 1, 0.1843137, 1,
-0.2883341, 1.385153, -0.6921026, 0, 1, 0.1882353, 1,
-0.2865033, -2.174183, -2.51255, 0, 1, 0.1960784, 1,
-0.2860676, -1.516683, -3.545058, 0, 1, 0.2039216, 1,
-0.2792273, -0.4597531, -1.899202, 0, 1, 0.2078431, 1,
-0.2749279, 0.1471078, -0.6963941, 0, 1, 0.2156863, 1,
-0.2748367, -0.2556851, -2.273368, 0, 1, 0.2196078, 1,
-0.2731715, -0.2556905, -0.9859067, 0, 1, 0.227451, 1,
-0.2674973, 1.08856, 0.1090623, 0, 1, 0.2313726, 1,
-0.2672187, 0.4097955, 0.3091784, 0, 1, 0.2392157, 1,
-0.2582696, -1.346311, -2.655225, 0, 1, 0.2431373, 1,
-0.2557501, -0.9716804, -2.350232, 0, 1, 0.2509804, 1,
-0.2551769, -0.4864895, -2.543019, 0, 1, 0.254902, 1,
-0.2524771, -0.9839781, -4.384382, 0, 1, 0.2627451, 1,
-0.2497658, 0.6539223, 0.09299421, 0, 1, 0.2666667, 1,
-0.2474088, -0.7182856, -2.731343, 0, 1, 0.2745098, 1,
-0.2387357, 0.8358734, -0.7413943, 0, 1, 0.2784314, 1,
-0.2360625, -1.616652, -3.493638, 0, 1, 0.2862745, 1,
-0.2355798, -0.6050816, -1.931467, 0, 1, 0.2901961, 1,
-0.2355707, 2.00382, 0.1225446, 0, 1, 0.2980392, 1,
-0.228276, -0.2376559, -3.958831, 0, 1, 0.3058824, 1,
-0.228052, 0.9400749, -0.4167612, 0, 1, 0.3098039, 1,
-0.222105, 1.124865, 1.149499, 0, 1, 0.3176471, 1,
-0.2216661, 0.5100935, -0.6686188, 0, 1, 0.3215686, 1,
-0.2208615, 0.07644928, -1.307017, 0, 1, 0.3294118, 1,
-0.2174712, 0.9120239, 0.4379632, 0, 1, 0.3333333, 1,
-0.2118204, 0.4447795, 1.288782, 0, 1, 0.3411765, 1,
-0.2118076, 0.1202166, -0.7209049, 0, 1, 0.345098, 1,
-0.2103811, -0.4117267, -1.933834, 0, 1, 0.3529412, 1,
-0.2087149, 1.014278, -0.9400672, 0, 1, 0.3568628, 1,
-0.2075778, -0.6696475, -3.873476, 0, 1, 0.3647059, 1,
-0.2071264, -1.25043, -3.986542, 0, 1, 0.3686275, 1,
-0.2068502, -1.953069, -3.8046, 0, 1, 0.3764706, 1,
-0.2045299, -1.142324, -2.201139, 0, 1, 0.3803922, 1,
-0.2029677, 0.8667061, -0.5662175, 0, 1, 0.3882353, 1,
-0.2026528, 0.07369325, -2.069731, 0, 1, 0.3921569, 1,
-0.2011577, -2.000127, -3.252792, 0, 1, 0.4, 1,
-0.1971652, -2.017029, -4.051659, 0, 1, 0.4078431, 1,
-0.1960426, -0.3495943, -1.297861, 0, 1, 0.4117647, 1,
-0.1945983, 0.5383776, -0.6863975, 0, 1, 0.4196078, 1,
-0.1917786, 1.748602, 1.038363, 0, 1, 0.4235294, 1,
-0.1912559, -0.2903055, -2.205439, 0, 1, 0.4313726, 1,
-0.1864119, 0.1712277, -0.7223454, 0, 1, 0.4352941, 1,
-0.1857911, -0.2046085, -3.49551, 0, 1, 0.4431373, 1,
-0.1837923, 1.403172, -0.3770517, 0, 1, 0.4470588, 1,
-0.1793392, 0.8083171, -0.0926271, 0, 1, 0.454902, 1,
-0.1760086, -0.1714447, 0.5849974, 0, 1, 0.4588235, 1,
-0.1675362, -0.9264689, -3.627439, 0, 1, 0.4666667, 1,
-0.1669655, -0.5682082, -1.57686, 0, 1, 0.4705882, 1,
-0.1660808, -0.4964429, -4.527906, 0, 1, 0.4784314, 1,
-0.1611826, 0.4233834, -1.307549, 0, 1, 0.4823529, 1,
-0.1611216, 0.1418882, -0.4291652, 0, 1, 0.4901961, 1,
-0.1598394, 3.384693, 0.4335675, 0, 1, 0.4941176, 1,
-0.1579586, 0.2149602, -1.863726, 0, 1, 0.5019608, 1,
-0.1569685, 0.02058717, 0.00186005, 0, 1, 0.509804, 1,
-0.1540321, 1.061965, 0.1213111, 0, 1, 0.5137255, 1,
-0.1540172, -0.8789104, -3.009232, 0, 1, 0.5215687, 1,
-0.1507738, 1.229616, -0.8533677, 0, 1, 0.5254902, 1,
-0.1490474, 0.8148001, -0.9287008, 0, 1, 0.5333334, 1,
-0.1482854, 0.1409484, 1.279941, 0, 1, 0.5372549, 1,
-0.1481732, 0.2874864, 0.2550048, 0, 1, 0.5450981, 1,
-0.1479157, -0.1663077, -3.17639, 0, 1, 0.5490196, 1,
-0.1476969, -0.1216954, -2.060221, 0, 1, 0.5568628, 1,
-0.1472435, 0.339251, 0.4733515, 0, 1, 0.5607843, 1,
-0.1455957, -1.142208, -3.353953, 0, 1, 0.5686275, 1,
-0.1448587, -0.3995538, -2.845032, 0, 1, 0.572549, 1,
-0.1447016, 1.865924, 0.9884226, 0, 1, 0.5803922, 1,
-0.1434166, 0.2567556, -0.2491592, 0, 1, 0.5843138, 1,
-0.1432973, -1.179971, -5.130426, 0, 1, 0.5921569, 1,
-0.1431355, 0.1866769, -0.9985693, 0, 1, 0.5960785, 1,
-0.1367418, -0.6920614, -6.162501, 0, 1, 0.6039216, 1,
-0.1322733, -0.5296976, -3.291645, 0, 1, 0.6117647, 1,
-0.1319226, 0.1856517, 0.4591994, 0, 1, 0.6156863, 1,
-0.1293773, 0.6034412, -1.430654, 0, 1, 0.6235294, 1,
-0.1267255, -1.576593, -2.195755, 0, 1, 0.627451, 1,
-0.124584, -1.608139, -3.170003, 0, 1, 0.6352941, 1,
-0.1219489, -0.5635762, -1.222163, 0, 1, 0.6392157, 1,
-0.1193053, -0.41582, -3.328934, 0, 1, 0.6470588, 1,
-0.114349, -0.4949025, -2.636919, 0, 1, 0.6509804, 1,
-0.1137588, 0.1657644, -1.032909, 0, 1, 0.6588235, 1,
-0.1119899, -0.3739157, -1.989614, 0, 1, 0.6627451, 1,
-0.1109775, 0.956018, 0.7351806, 0, 1, 0.6705883, 1,
-0.1080739, -1.651962, -1.96822, 0, 1, 0.6745098, 1,
-0.1051327, -1.484514, -3.598907, 0, 1, 0.682353, 1,
-0.1046601, 0.6284797, -1.989182, 0, 1, 0.6862745, 1,
-0.09801424, -0.01367265, -2.347382, 0, 1, 0.6941177, 1,
-0.09172103, 0.6342651, 0.4182137, 0, 1, 0.7019608, 1,
-0.08834156, 0.2605652, -0.06083189, 0, 1, 0.7058824, 1,
-0.08020964, -0.1126565, -2.150369, 0, 1, 0.7137255, 1,
-0.07992589, -0.01702013, -2.674119, 0, 1, 0.7176471, 1,
-0.079632, 1.427351, 2.262857, 0, 1, 0.7254902, 1,
-0.07817411, 0.4279523, -0.2712694, 0, 1, 0.7294118, 1,
-0.07158628, 0.1396455, 0.2382308, 0, 1, 0.7372549, 1,
-0.06409067, 0.3244697, 0.04530163, 0, 1, 0.7411765, 1,
-0.06023295, 0.132311, -0.01368422, 0, 1, 0.7490196, 1,
-0.05754974, -0.0532131, -2.010185, 0, 1, 0.7529412, 1,
-0.05730628, 0.3013981, -0.9241905, 0, 1, 0.7607843, 1,
-0.0523408, -0.5405887, -2.125909, 0, 1, 0.7647059, 1,
-0.05080892, -0.3747123, -5.727445, 0, 1, 0.772549, 1,
-0.05005271, 1.901861, 0.3700522, 0, 1, 0.7764706, 1,
-0.04747522, -0.002418658, -1.731636, 0, 1, 0.7843137, 1,
-0.04554996, 0.400019, -2.276779, 0, 1, 0.7882353, 1,
-0.04416447, -0.8973911, -2.285305, 0, 1, 0.7960784, 1,
-0.04091453, 0.9642787, 0.8495499, 0, 1, 0.8039216, 1,
-0.03989605, 1.155991, -0.8113065, 0, 1, 0.8078431, 1,
-0.03883442, 0.3722195, -0.5631074, 0, 1, 0.8156863, 1,
-0.03379747, 0.1195498, -0.6254714, 0, 1, 0.8196079, 1,
-0.03179937, -0.1041222, -3.291462, 0, 1, 0.827451, 1,
-0.03025024, 0.9938164, -0.08886584, 0, 1, 0.8313726, 1,
-0.02452873, -1.424943, -2.949084, 0, 1, 0.8392157, 1,
-0.02410853, 1.073255, 1.587712, 0, 1, 0.8431373, 1,
-0.02329541, -0.8860385, -2.532703, 0, 1, 0.8509804, 1,
-0.02296341, 1.141504, -3.814429, 0, 1, 0.854902, 1,
-0.02109687, 0.3857988, 1.297549, 0, 1, 0.8627451, 1,
-0.02019886, -0.8600563, -3.039322, 0, 1, 0.8666667, 1,
-0.02003318, 0.6424589, 0.359774, 0, 1, 0.8745098, 1,
-0.01351888, -1.050311, -2.928257, 0, 1, 0.8784314, 1,
-0.01324661, -0.1672465, -3.527589, 0, 1, 0.8862745, 1,
-0.0121381, -0.8237804, -2.407656, 0, 1, 0.8901961, 1,
-0.008922627, -0.7906876, -2.359625, 0, 1, 0.8980392, 1,
-0.0001037005, 0.3857645, -0.5178123, 0, 1, 0.9058824, 1,
0.001633758, 0.3701933, 0.7830817, 0, 1, 0.9098039, 1,
0.002175024, 0.9492472, 0.05630111, 0, 1, 0.9176471, 1,
0.003006857, -0.6916482, 2.610288, 0, 1, 0.9215686, 1,
0.006350181, 0.6323222, -0.2410469, 0, 1, 0.9294118, 1,
0.00931942, 0.7492044, 0.9864738, 0, 1, 0.9333333, 1,
0.01000893, 0.02104577, -0.3135526, 0, 1, 0.9411765, 1,
0.01061257, 0.8390395, -0.2196156, 0, 1, 0.945098, 1,
0.01164295, 0.638084, 0.2971259, 0, 1, 0.9529412, 1,
0.0131662, -0.07922809, 3.417944, 0, 1, 0.9568627, 1,
0.01372508, 0.6636201, 1.5272, 0, 1, 0.9647059, 1,
0.01397854, -0.4923708, 2.976057, 0, 1, 0.9686275, 1,
0.01544121, -0.5609611, 3.545737, 0, 1, 0.9764706, 1,
0.01575192, 0.9759967, 1.062678, 0, 1, 0.9803922, 1,
0.01644875, 0.634287, 0.02943457, 0, 1, 0.9882353, 1,
0.01815275, -1.502306, 3.739922, 0, 1, 0.9921569, 1,
0.01836988, 0.7022358, 0.7692932, 0, 1, 1, 1,
0.02430161, 2.276076, -1.283413, 0, 0.9921569, 1, 1,
0.02441123, 2.243798, -0.8749974, 0, 0.9882353, 1, 1,
0.02556212, -1.338976, 3.267486, 0, 0.9803922, 1, 1,
0.02786436, 0.5072128, 0.2773871, 0, 0.9764706, 1, 1,
0.02838009, -0.3125484, 2.48732, 0, 0.9686275, 1, 1,
0.02928316, 0.2268441, -1.081108, 0, 0.9647059, 1, 1,
0.02941054, 0.2491197, -0.2772559, 0, 0.9568627, 1, 1,
0.03090763, 1.285764, 0.4198264, 0, 0.9529412, 1, 1,
0.03104085, 0.9474438, 0.5741783, 0, 0.945098, 1, 1,
0.03300586, 0.5031078, -0.3737612, 0, 0.9411765, 1, 1,
0.03448847, 1.17691, -1.100144, 0, 0.9333333, 1, 1,
0.03468278, 0.2864626, 0.04523425, 0, 0.9294118, 1, 1,
0.03484648, -1.394002, 3.856352, 0, 0.9215686, 1, 1,
0.0378437, -0.9104863, 1.969163, 0, 0.9176471, 1, 1,
0.03872011, 0.9967476, 1.18867, 0, 0.9098039, 1, 1,
0.04252985, 1.609986, 0.321266, 0, 0.9058824, 1, 1,
0.04441165, -1.220279, 3.011362, 0, 0.8980392, 1, 1,
0.04611959, 0.1668465, 2.068592, 0, 0.8901961, 1, 1,
0.04940769, -0.5226119, 4.013524, 0, 0.8862745, 1, 1,
0.04990287, -0.7057488, 2.230117, 0, 0.8784314, 1, 1,
0.05231053, -0.683337, 3.489255, 0, 0.8745098, 1, 1,
0.06008536, -0.8100821, 2.271495, 0, 0.8666667, 1, 1,
0.06156433, 0.7189537, 0.2744004, 0, 0.8627451, 1, 1,
0.062746, 1.390661, -1.372214, 0, 0.854902, 1, 1,
0.06428879, -2.015626, 1.588822, 0, 0.8509804, 1, 1,
0.06559592, 0.6460969, 1.611248, 0, 0.8431373, 1, 1,
0.06697969, -1.210309, 4.813978, 0, 0.8392157, 1, 1,
0.06711295, -1.378168, 5.766844, 0, 0.8313726, 1, 1,
0.07017639, -0.964313, 2.92289, 0, 0.827451, 1, 1,
0.07524642, -0.4283686, 3.629256, 0, 0.8196079, 1, 1,
0.0791717, -0.4668763, 1.522673, 0, 0.8156863, 1, 1,
0.08104545, -0.8843199, 1.575394, 0, 0.8078431, 1, 1,
0.08677743, -1.386387, 1.495419, 0, 0.8039216, 1, 1,
0.08697724, -0.4180294, 3.179878, 0, 0.7960784, 1, 1,
0.08823427, -1.891774, 5.056052, 0, 0.7882353, 1, 1,
0.09364206, 0.1709741, -0.5815579, 0, 0.7843137, 1, 1,
0.09450335, -1.20519, 3.110342, 0, 0.7764706, 1, 1,
0.09520791, -0.9034297, 2.165124, 0, 0.772549, 1, 1,
0.101613, -0.5195428, 4.017571, 0, 0.7647059, 1, 1,
0.1022773, -0.3973056, 4.015465, 0, 0.7607843, 1, 1,
0.1042513, -0.9963565, 2.55956, 0, 0.7529412, 1, 1,
0.1076881, -0.5042512, 3.519347, 0, 0.7490196, 1, 1,
0.1095209, -0.02239626, 1.941125, 0, 0.7411765, 1, 1,
0.1135523, 0.7273842, 0.8862367, 0, 0.7372549, 1, 1,
0.1140394, 1.420583, -0.4879448, 0, 0.7294118, 1, 1,
0.114628, 1.516623, -0.4174277, 0, 0.7254902, 1, 1,
0.117089, 1.315388, -1.641079, 0, 0.7176471, 1, 1,
0.1191809, -0.342748, 1.949432, 0, 0.7137255, 1, 1,
0.1239721, -0.1159455, 2.198148, 0, 0.7058824, 1, 1,
0.1272511, -1.363353, 0.8065013, 0, 0.6980392, 1, 1,
0.1279885, 0.2745135, 2.313832, 0, 0.6941177, 1, 1,
0.1306695, 0.2154791, 0.376624, 0, 0.6862745, 1, 1,
0.1350997, -1.047906, 3.558621, 0, 0.682353, 1, 1,
0.1366643, -0.2933252, 2.91177, 0, 0.6745098, 1, 1,
0.138514, -0.8705476, 3.078251, 0, 0.6705883, 1, 1,
0.1417594, 1.170404, -1.456643, 0, 0.6627451, 1, 1,
0.1426108, 0.8251852, -0.5233999, 0, 0.6588235, 1, 1,
0.1445293, -0.1993863, 3.511959, 0, 0.6509804, 1, 1,
0.149459, 0.9726446, 0.7935911, 0, 0.6470588, 1, 1,
0.1506192, -0.45904, 0.8011419, 0, 0.6392157, 1, 1,
0.1509208, -1.539513, 3.781381, 0, 0.6352941, 1, 1,
0.1516349, -0.2742404, 2.710148, 0, 0.627451, 1, 1,
0.1519989, -0.236744, 3.41065, 0, 0.6235294, 1, 1,
0.1539464, -1.083185, 2.307076, 0, 0.6156863, 1, 1,
0.155818, -0.2096523, 3.151713, 0, 0.6117647, 1, 1,
0.1564663, 0.2709485, -0.6071232, 0, 0.6039216, 1, 1,
0.1614866, -1.546927, 3.413492, 0, 0.5960785, 1, 1,
0.164164, 0.6776144, 0.9005337, 0, 0.5921569, 1, 1,
0.1642225, 0.7153851, 1.325553, 0, 0.5843138, 1, 1,
0.1678345, -1.198565, 1.561665, 0, 0.5803922, 1, 1,
0.1679935, 0.2717644, 0.06360976, 0, 0.572549, 1, 1,
0.1690488, -1.416859, 3.179978, 0, 0.5686275, 1, 1,
0.1749719, -1.965959, 3.612143, 0, 0.5607843, 1, 1,
0.1770113, -0.7627814, 2.791357, 0, 0.5568628, 1, 1,
0.1877889, 0.2599775, -0.4557782, 0, 0.5490196, 1, 1,
0.1900615, -0.4761922, 5.625604, 0, 0.5450981, 1, 1,
0.1901741, -0.4644767, 1.698207, 0, 0.5372549, 1, 1,
0.1912123, -0.2022533, 2.364039, 0, 0.5333334, 1, 1,
0.1921672, -0.4348535, 2.303968, 0, 0.5254902, 1, 1,
0.1979484, 0.1896797, 1.125631, 0, 0.5215687, 1, 1,
0.1998187, 0.5416648, -0.5149035, 0, 0.5137255, 1, 1,
0.2001058, 0.229379, -0.7817764, 0, 0.509804, 1, 1,
0.2010922, -0.8352271, 3.907481, 0, 0.5019608, 1, 1,
0.2027628, -0.6032649, 1.603503, 0, 0.4941176, 1, 1,
0.2070533, -0.8046483, 2.560328, 0, 0.4901961, 1, 1,
0.2148378, 0.9200523, -0.6008646, 0, 0.4823529, 1, 1,
0.2156356, 0.09330158, 3.175767, 0, 0.4784314, 1, 1,
0.2174099, -0.1411738, 2.918648, 0, 0.4705882, 1, 1,
0.2183957, 0.2362223, 2.038554, 0, 0.4666667, 1, 1,
0.2215826, 1.460964, 1.594471, 0, 0.4588235, 1, 1,
0.2230404, -1.194998, 3.881892, 0, 0.454902, 1, 1,
0.2241758, -1.747734, 4.343062, 0, 0.4470588, 1, 1,
0.2244565, 1.501998, 1.857226, 0, 0.4431373, 1, 1,
0.2254745, 1.651115, 1.593792, 0, 0.4352941, 1, 1,
0.2258743, 0.7052783, -1.170149, 0, 0.4313726, 1, 1,
0.2264252, -0.1508791, 0.9064381, 0, 0.4235294, 1, 1,
0.2266112, -0.4445328, 5.284445, 0, 0.4196078, 1, 1,
0.2272083, -0.3778318, 2.210087, 0, 0.4117647, 1, 1,
0.2282798, 0.7043384, 1.08983, 0, 0.4078431, 1, 1,
0.2294886, -1.063187, 2.910714, 0, 0.4, 1, 1,
0.2299558, -0.1273242, 0.63451, 0, 0.3921569, 1, 1,
0.2395918, -0.09753468, 1.751848, 0, 0.3882353, 1, 1,
0.2413711, -0.732105, 0.8730472, 0, 0.3803922, 1, 1,
0.2422532, -0.1149549, 2.61703, 0, 0.3764706, 1, 1,
0.2524744, -0.9333576, 3.800757, 0, 0.3686275, 1, 1,
0.254575, 0.05344708, 2.001738, 0, 0.3647059, 1, 1,
0.2551545, -0.429435, 1.126335, 0, 0.3568628, 1, 1,
0.2551674, -1.48881, 2.12137, 0, 0.3529412, 1, 1,
0.2587047, 0.9299651, -0.2802706, 0, 0.345098, 1, 1,
0.2589684, 0.662012, -1.580584, 0, 0.3411765, 1, 1,
0.2610188, -0.5944675, 2.043875, 0, 0.3333333, 1, 1,
0.2614906, 0.9547775, -0.7919769, 0, 0.3294118, 1, 1,
0.2682789, -1.706719, 1.348884, 0, 0.3215686, 1, 1,
0.2710005, -0.8206722, 3.617794, 0, 0.3176471, 1, 1,
0.2837437, 0.6076304, 0.02984584, 0, 0.3098039, 1, 1,
0.2839499, -0.4485628, 2.063536, 0, 0.3058824, 1, 1,
0.2841732, 0.2623586, 1.415366, 0, 0.2980392, 1, 1,
0.2848564, -1.291368, 1.59674, 0, 0.2901961, 1, 1,
0.2854684, -0.2712652, 2.612367, 0, 0.2862745, 1, 1,
0.2875023, 0.574552, -0.8134038, 0, 0.2784314, 1, 1,
0.2877589, -1.330248, 2.581234, 0, 0.2745098, 1, 1,
0.2912271, 0.2677015, -0.3134044, 0, 0.2666667, 1, 1,
0.2930129, 0.2034005, 1.294201, 0, 0.2627451, 1, 1,
0.2947402, -0.9378778, 5.228425, 0, 0.254902, 1, 1,
0.3095683, -1.067517, 4.044205, 0, 0.2509804, 1, 1,
0.3117658, 0.6885437, -0.02185491, 0, 0.2431373, 1, 1,
0.3123335, -0.5155577, 2.700853, 0, 0.2392157, 1, 1,
0.3134634, 0.4220767, -0.01548587, 0, 0.2313726, 1, 1,
0.3136342, 1.147308, -0.9288425, 0, 0.227451, 1, 1,
0.3150231, 1.218152, -0.5908102, 0, 0.2196078, 1, 1,
0.3208515, 1.487628, 2.430989, 0, 0.2156863, 1, 1,
0.3211782, -1.133494, 2.878593, 0, 0.2078431, 1, 1,
0.3248649, 0.6216258, -0.465515, 0, 0.2039216, 1, 1,
0.3263282, -0.7891203, 1.454342, 0, 0.1960784, 1, 1,
0.3344732, 0.07406431, 2.718759, 0, 0.1882353, 1, 1,
0.3364535, -1.031792, 2.195276, 0, 0.1843137, 1, 1,
0.3394746, -1.152526, 2.862653, 0, 0.1764706, 1, 1,
0.34363, 1.214623, -0.1407013, 0, 0.172549, 1, 1,
0.3493023, 0.7124936, 0.5699409, 0, 0.1647059, 1, 1,
0.3497658, -1.139886, 3.512535, 0, 0.1607843, 1, 1,
0.3511448, 0.3631374, 1.06822, 0, 0.1529412, 1, 1,
0.3531922, 0.006986684, 0.8475613, 0, 0.1490196, 1, 1,
0.3599372, 2.008925, 0.3794616, 0, 0.1411765, 1, 1,
0.3604189, 0.6335886, 0.5987281, 0, 0.1372549, 1, 1,
0.3615861, -0.6258572, 1.055803, 0, 0.1294118, 1, 1,
0.362072, -1.437334, 3.40427, 0, 0.1254902, 1, 1,
0.3628835, -2.607826, 0.8675565, 0, 0.1176471, 1, 1,
0.3636567, 0.9570909, 2.722162, 0, 0.1137255, 1, 1,
0.3638249, -0.7068437, 3.178455, 0, 0.1058824, 1, 1,
0.3645966, 0.03626013, -0.469256, 0, 0.09803922, 1, 1,
0.3768319, 0.6610559, 2.367, 0, 0.09411765, 1, 1,
0.3776457, 0.1109522, 0.05930319, 0, 0.08627451, 1, 1,
0.3799974, 0.4386611, 2.185146, 0, 0.08235294, 1, 1,
0.3803747, -1.05379, 2.59252, 0, 0.07450981, 1, 1,
0.3815191, 0.3498589, -0.1600459, 0, 0.07058824, 1, 1,
0.3842791, -0.0665239, 2.618565, 0, 0.0627451, 1, 1,
0.3887901, 0.3399786, 1.078506, 0, 0.05882353, 1, 1,
0.392283, -0.07720264, 2.14061, 0, 0.05098039, 1, 1,
0.3940442, 2.79033, -0.08945348, 0, 0.04705882, 1, 1,
0.3946197, 0.7264913, 1.919344, 0, 0.03921569, 1, 1,
0.3957653, 0.7514067, 2.478987, 0, 0.03529412, 1, 1,
0.3979415, 0.4677309, -0.3167371, 0, 0.02745098, 1, 1,
0.400087, 3.365669, 1.202375, 0, 0.02352941, 1, 1,
0.4045314, -0.3481096, 2.950825, 0, 0.01568628, 1, 1,
0.4081123, 0.8352364, 0.7081291, 0, 0.01176471, 1, 1,
0.4093533, -0.9775152, 2.145555, 0, 0.003921569, 1, 1,
0.4100772, -1.543843, 2.474085, 0.003921569, 0, 1, 1,
0.4134194, -0.1042905, 3.08231, 0.007843138, 0, 1, 1,
0.416626, -0.4566375, 3.070155, 0.01568628, 0, 1, 1,
0.4176107, 0.9559686, -0.263303, 0.01960784, 0, 1, 1,
0.4183679, -0.4533218, 3.136065, 0.02745098, 0, 1, 1,
0.4232817, 1.101586, 0.7220438, 0.03137255, 0, 1, 1,
0.4253145, 0.5572671, -0.0004468894, 0.03921569, 0, 1, 1,
0.4324373, 0.1970998, 1.52157, 0.04313726, 0, 1, 1,
0.434098, -0.3820852, 2.221053, 0.05098039, 0, 1, 1,
0.4441878, -0.2180399, 3.240508, 0.05490196, 0, 1, 1,
0.4448996, -0.9061488, 2.837052, 0.0627451, 0, 1, 1,
0.4493244, 0.7612455, 0.03471418, 0.06666667, 0, 1, 1,
0.4525644, 1.855615, 0.952817, 0.07450981, 0, 1, 1,
0.4578076, -0.2863856, 3.11581, 0.07843138, 0, 1, 1,
0.4599078, 0.1191791, 2.581155, 0.08627451, 0, 1, 1,
0.4603303, 0.1498048, 0.4420096, 0.09019608, 0, 1, 1,
0.4639678, 0.9106541, 0.4085763, 0.09803922, 0, 1, 1,
0.4660894, 0.06781241, 1.736989, 0.1058824, 0, 1, 1,
0.4720883, -0.1460734, 3.394103, 0.1098039, 0, 1, 1,
0.4756073, -2.397337, 4.412343, 0.1176471, 0, 1, 1,
0.4774248, -0.06823363, 1.823422, 0.1215686, 0, 1, 1,
0.4775988, -0.4527754, 2.251903, 0.1294118, 0, 1, 1,
0.4816506, -0.340876, 3.016937, 0.1333333, 0, 1, 1,
0.4821443, 0.139081, -0.02954547, 0.1411765, 0, 1, 1,
0.4865632, 0.7362768, 1.94019, 0.145098, 0, 1, 1,
0.4891068, -0.09218755, 2.803796, 0.1529412, 0, 1, 1,
0.4898399, 0.3258197, 0.9939305, 0.1568628, 0, 1, 1,
0.4908869, 0.5508409, -0.6656597, 0.1647059, 0, 1, 1,
0.4943258, -1.135925, 1.171331, 0.1686275, 0, 1, 1,
0.4946814, 1.69467, -0.1362789, 0.1764706, 0, 1, 1,
0.4978504, 0.5557189, 3.058937, 0.1803922, 0, 1, 1,
0.5022671, 0.3890639, 0.7902289, 0.1882353, 0, 1, 1,
0.5046243, 2.59292, -0.4496441, 0.1921569, 0, 1, 1,
0.5048201, 2.018591, -0.2540235, 0.2, 0, 1, 1,
0.5055532, 1.478651, -0.04078902, 0.2078431, 0, 1, 1,
0.5118436, 1.473374, -0.8761844, 0.2117647, 0, 1, 1,
0.5198144, 1.296492, 1.041841, 0.2196078, 0, 1, 1,
0.5217389, 0.8869778, 0.7804543, 0.2235294, 0, 1, 1,
0.5227262, 0.2123505, 1.321659, 0.2313726, 0, 1, 1,
0.5278119, 0.8737683, 0.07654816, 0.2352941, 0, 1, 1,
0.5308192, -1.324884, 2.294579, 0.2431373, 0, 1, 1,
0.5319635, -0.7452163, 5.112562, 0.2470588, 0, 1, 1,
0.534275, 1.482987, -0.003524591, 0.254902, 0, 1, 1,
0.5343218, -0.7709537, 2.847265, 0.2588235, 0, 1, 1,
0.5354636, 0.06840113, 0.2695648, 0.2666667, 0, 1, 1,
0.5382985, -1.471932, 4.316057, 0.2705882, 0, 1, 1,
0.5396262, 1.761791, 0.6018126, 0.2784314, 0, 1, 1,
0.5439788, -2.213255, 2.018142, 0.282353, 0, 1, 1,
0.5444687, -0.5169387, 1.873953, 0.2901961, 0, 1, 1,
0.546516, 0.1999782, 1.480408, 0.2941177, 0, 1, 1,
0.5486845, 1.91167, 0.1431658, 0.3019608, 0, 1, 1,
0.5517336, -0.5339172, 3.446183, 0.3098039, 0, 1, 1,
0.5517992, -0.3785678, 3.061627, 0.3137255, 0, 1, 1,
0.5523111, 0.09786301, 0.5057296, 0.3215686, 0, 1, 1,
0.5539716, -0.0005175092, 1.052347, 0.3254902, 0, 1, 1,
0.559912, -0.04959699, 0.5262128, 0.3333333, 0, 1, 1,
0.5643402, 0.6253322, 1.283947, 0.3372549, 0, 1, 1,
0.5668849, 0.7663478, 0.6546832, 0.345098, 0, 1, 1,
0.5686548, 1.543963, -1.00318, 0.3490196, 0, 1, 1,
0.5701784, -0.6695005, 3.100406, 0.3568628, 0, 1, 1,
0.5762594, -2.080501, 0.8908584, 0.3607843, 0, 1, 1,
0.5791603, 0.9374507, -0.5298133, 0.3686275, 0, 1, 1,
0.5807437, -0.9404629, 0.7520003, 0.372549, 0, 1, 1,
0.5819867, 0.3705267, 1.38875, 0.3803922, 0, 1, 1,
0.5860478, -0.1002889, 2.263911, 0.3843137, 0, 1, 1,
0.5908495, -0.6567819, 2.994687, 0.3921569, 0, 1, 1,
0.5927559, -0.1749626, 0.5703675, 0.3960784, 0, 1, 1,
0.6023716, 1.760654, 0.2541358, 0.4039216, 0, 1, 1,
0.610756, 1.599787, 0.3944593, 0.4117647, 0, 1, 1,
0.6112742, -0.8467649, 2.842611, 0.4156863, 0, 1, 1,
0.6131949, 1.433788, -1.327239, 0.4235294, 0, 1, 1,
0.6132023, 0.849445, 0.7319385, 0.427451, 0, 1, 1,
0.6133618, -0.07865388, 0.9728044, 0.4352941, 0, 1, 1,
0.6139828, 1.865446, -0.9384425, 0.4392157, 0, 1, 1,
0.6147655, -0.1142228, 1.400781, 0.4470588, 0, 1, 1,
0.6161509, -0.4112914, 0.5409167, 0.4509804, 0, 1, 1,
0.6184642, 0.4103351, 1.732335, 0.4588235, 0, 1, 1,
0.6209894, 1.966771, 0.5970185, 0.4627451, 0, 1, 1,
0.6231596, -0.7578737, 4.96645, 0.4705882, 0, 1, 1,
0.6347623, -1.225441, 1.956827, 0.4745098, 0, 1, 1,
0.6385792, 0.22523, 1.219099, 0.4823529, 0, 1, 1,
0.6415955, 0.7024705, 1.979226, 0.4862745, 0, 1, 1,
0.6425509, 0.7220317, 0.4135192, 0.4941176, 0, 1, 1,
0.6433276, 0.6353617, 1.863633, 0.5019608, 0, 1, 1,
0.6463225, 0.5398467, 1.593625, 0.5058824, 0, 1, 1,
0.654393, -0.3402597, 3.458316, 0.5137255, 0, 1, 1,
0.668444, -0.6350409, 2.569107, 0.5176471, 0, 1, 1,
0.6717387, 2.123941, -0.0258674, 0.5254902, 0, 1, 1,
0.6720232, 0.6980761, 1.251811, 0.5294118, 0, 1, 1,
0.6740062, -1.005425, 2.221199, 0.5372549, 0, 1, 1,
0.6744797, -1.91685, 2.897216, 0.5411765, 0, 1, 1,
0.6773286, 0.02506926, -0.2228695, 0.5490196, 0, 1, 1,
0.6861627, -3.77635, 2.688429, 0.5529412, 0, 1, 1,
0.6861842, 0.1897146, 1.112481, 0.5607843, 0, 1, 1,
0.6881502, -0.8231766, 2.359509, 0.5647059, 0, 1, 1,
0.6892561, 0.1355727, 1.265583, 0.572549, 0, 1, 1,
0.692213, -0.6038285, 0.3756486, 0.5764706, 0, 1, 1,
0.6961569, 0.563359, 0.3061871, 0.5843138, 0, 1, 1,
0.7037567, 0.33346, 0.1058494, 0.5882353, 0, 1, 1,
0.7063008, 1.069318, -0.9923132, 0.5960785, 0, 1, 1,
0.7110831, -2.056922, 1.59721, 0.6039216, 0, 1, 1,
0.7119938, -1.59101, 4.199526, 0.6078432, 0, 1, 1,
0.7265158, 0.3594698, 0.4102227, 0.6156863, 0, 1, 1,
0.7294475, -0.5857349, 4.250543, 0.6196079, 0, 1, 1,
0.7315167, 2.136645, 0.6192942, 0.627451, 0, 1, 1,
0.7446122, -0.3939071, 3.003579, 0.6313726, 0, 1, 1,
0.7454957, 0.1962894, 0.1693919, 0.6392157, 0, 1, 1,
0.7473715, 0.421696, 2.08818, 0.6431373, 0, 1, 1,
0.7483799, 0.6859246, 0.855021, 0.6509804, 0, 1, 1,
0.749242, -1.619188, 3.059167, 0.654902, 0, 1, 1,
0.755478, 1.102071, 0.9077871, 0.6627451, 0, 1, 1,
0.7675392, 1.318817, 0.601009, 0.6666667, 0, 1, 1,
0.7705497, -0.3580299, 1.479514, 0.6745098, 0, 1, 1,
0.7720215, 0.3779946, 1.196492, 0.6784314, 0, 1, 1,
0.7745629, -2.178586, 3.340003, 0.6862745, 0, 1, 1,
0.774747, -0.8062071, 2.494591, 0.6901961, 0, 1, 1,
0.7758687, -0.9180371, 1.780821, 0.6980392, 0, 1, 1,
0.7824928, -0.2916151, 0.5452674, 0.7058824, 0, 1, 1,
0.7896147, 0.1493832, 2.529863, 0.7098039, 0, 1, 1,
0.7914443, 0.4557443, 1.259559, 0.7176471, 0, 1, 1,
0.7969883, -0.8828604, 2.405765, 0.7215686, 0, 1, 1,
0.7994496, 0.9171014, 1.610093, 0.7294118, 0, 1, 1,
0.799818, 1.034693, -0.2658571, 0.7333333, 0, 1, 1,
0.8041729, 0.847633, -0.589195, 0.7411765, 0, 1, 1,
0.8056845, 0.844034, 1.269011, 0.7450981, 0, 1, 1,
0.8074149, -0.003817647, 1.146909, 0.7529412, 0, 1, 1,
0.8093796, 1.270663, 0.06746207, 0.7568628, 0, 1, 1,
0.8148791, 1.96403, -1.49996, 0.7647059, 0, 1, 1,
0.8162795, -1.459564, 4.780368, 0.7686275, 0, 1, 1,
0.8213785, -0.4688945, 3.641411, 0.7764706, 0, 1, 1,
0.8225118, -0.5586951, 2.062361, 0.7803922, 0, 1, 1,
0.8243676, -0.7435537, 1.609154, 0.7882353, 0, 1, 1,
0.8251004, -1.190945, 4.091184, 0.7921569, 0, 1, 1,
0.8287961, 1.333405, 0.6893027, 0.8, 0, 1, 1,
0.8288829, 0.8858197, 1.455264, 0.8078431, 0, 1, 1,
0.8298106, -1.067583, 1.50984, 0.8117647, 0, 1, 1,
0.8299201, 0.8693963, 1.398186, 0.8196079, 0, 1, 1,
0.8334613, -0.3408024, 2.47489, 0.8235294, 0, 1, 1,
0.8390195, -0.6828232, 1.763171, 0.8313726, 0, 1, 1,
0.8481054, 0.2021919, -0.4933205, 0.8352941, 0, 1, 1,
0.8493131, -0.8775972, 2.177233, 0.8431373, 0, 1, 1,
0.8509055, 0.8016263, 1.636191, 0.8470588, 0, 1, 1,
0.853472, -0.7282713, 3.06989, 0.854902, 0, 1, 1,
0.8548231, 1.061136, 0.4269996, 0.8588235, 0, 1, 1,
0.8559926, 1.438474, 1.470152, 0.8666667, 0, 1, 1,
0.8562618, 0.9948865, -0.8749233, 0.8705882, 0, 1, 1,
0.8612021, 1.329214, -0.2773777, 0.8784314, 0, 1, 1,
0.8620602, 0.2250485, 1.665494, 0.8823529, 0, 1, 1,
0.8650116, 0.1576505, 1.78471, 0.8901961, 0, 1, 1,
0.8729572, -0.8581005, 2.111073, 0.8941177, 0, 1, 1,
0.8741349, 0.224581, -0.03437111, 0.9019608, 0, 1, 1,
0.8768935, 0.1052527, 2.240312, 0.9098039, 0, 1, 1,
0.8810723, 0.3412743, 0.3515305, 0.9137255, 0, 1, 1,
0.8879221, 0.08250291, 0.6076292, 0.9215686, 0, 1, 1,
0.8896762, 0.8411533, 1.634831, 0.9254902, 0, 1, 1,
0.9018804, -0.6202981, 0.305699, 0.9333333, 0, 1, 1,
0.9077853, -0.7009551, 0.9629305, 0.9372549, 0, 1, 1,
0.9162338, 0.7110762, 1.051484, 0.945098, 0, 1, 1,
0.9177193, 0.07548314, 0.7554225, 0.9490196, 0, 1, 1,
0.9193984, -0.2278318, 2.054648, 0.9568627, 0, 1, 1,
0.9296005, -0.01313471, 3.248872, 0.9607843, 0, 1, 1,
0.9305888, -0.1868991, 3.262649, 0.9686275, 0, 1, 1,
0.9320422, -1.397238, 2.510722, 0.972549, 0, 1, 1,
0.9320905, 0.8611772, 1.668481, 0.9803922, 0, 1, 1,
0.93934, -0.7808411, 3.193417, 0.9843137, 0, 1, 1,
0.9436514, -2.379886, 4.474522, 0.9921569, 0, 1, 1,
0.9437442, -0.07538968, 1.066171, 0.9960784, 0, 1, 1,
0.94553, -0.8523597, 3.659069, 1, 0, 0.9960784, 1,
0.9469973, -1.532285, 1.254869, 1, 0, 0.9882353, 1,
0.9509463, -0.9485269, 1.931147, 1, 0, 0.9843137, 1,
0.9539035, 0.09036102, 1.424696, 1, 0, 0.9764706, 1,
0.9551447, -0.6479332, 2.878836, 1, 0, 0.972549, 1,
0.9551644, 1.154466, 0.1173608, 1, 0, 0.9647059, 1,
0.9626337, 0.3581362, 1.608429, 1, 0, 0.9607843, 1,
0.9666317, -0.8554194, 3.340951, 1, 0, 0.9529412, 1,
0.9682972, 0.4423057, 0.6196182, 1, 0, 0.9490196, 1,
0.9717271, -0.1408152, 2.012323, 1, 0, 0.9411765, 1,
0.972382, -1.888659, 2.521787, 1, 0, 0.9372549, 1,
0.9756815, 1.584723, -1.667732, 1, 0, 0.9294118, 1,
0.9761092, 0.6811003, 2.296557, 1, 0, 0.9254902, 1,
0.9809895, -0.1076578, 2.421543, 1, 0, 0.9176471, 1,
0.9836203, -1.874529, 2.322844, 1, 0, 0.9137255, 1,
0.9893005, -0.1616786, 3.292407, 1, 0, 0.9058824, 1,
0.9912733, -0.4861118, 2.75145, 1, 0, 0.9019608, 1,
0.9971059, -0.540986, 1.167282, 1, 0, 0.8941177, 1,
0.9980556, 1.496243, 0.395028, 1, 0, 0.8862745, 1,
1.005672, -0.2105381, 0.1275331, 1, 0, 0.8823529, 1,
1.010985, 1.414493, -1.569484, 1, 0, 0.8745098, 1,
1.014779, -0.8807148, 3.895139, 1, 0, 0.8705882, 1,
1.031096, -0.7095415, 1.199302, 1, 0, 0.8627451, 1,
1.032395, 0.7295559, 2.026557, 1, 0, 0.8588235, 1,
1.03424, -0.2413497, 2.435785, 1, 0, 0.8509804, 1,
1.041154, 0.7125444, 2.893026, 1, 0, 0.8470588, 1,
1.042694, -0.8180733, 3.149955, 1, 0, 0.8392157, 1,
1.044026, 0.2027624, 1.963292, 1, 0, 0.8352941, 1,
1.045134, -0.3582319, 1.093508, 1, 0, 0.827451, 1,
1.045247, 0.3230142, 0.8628083, 1, 0, 0.8235294, 1,
1.047825, 0.4370225, 1.452762, 1, 0, 0.8156863, 1,
1.053158, 1.558809, 1.204578, 1, 0, 0.8117647, 1,
1.056881, -0.7716399, 1.581392, 1, 0, 0.8039216, 1,
1.069537, -0.986724, 3.009321, 1, 0, 0.7960784, 1,
1.079501, -0.7425485, 1.666162, 1, 0, 0.7921569, 1,
1.08061, 1.475373, 0.3365528, 1, 0, 0.7843137, 1,
1.082702, -0.104386, 1.578246, 1, 0, 0.7803922, 1,
1.084261, -0.05447414, 2.093475, 1, 0, 0.772549, 1,
1.089687, -1.162911, 2.655681, 1, 0, 0.7686275, 1,
1.091488, 1.370952, 0.4563711, 1, 0, 0.7607843, 1,
1.09359, -0.267849, 2.474962, 1, 0, 0.7568628, 1,
1.096765, -0.04392032, 1.235922, 1, 0, 0.7490196, 1,
1.098678, -0.5638564, 1.78287, 1, 0, 0.7450981, 1,
1.107027, -1.428783, 3.113911, 1, 0, 0.7372549, 1,
1.12624, 1.910161, 0.6602573, 1, 0, 0.7333333, 1,
1.126372, -0.0324108, 2.358722, 1, 0, 0.7254902, 1,
1.135962, -1.222447, 0.7913966, 1, 0, 0.7215686, 1,
1.137175, 0.246912, 0.8662333, 1, 0, 0.7137255, 1,
1.142259, -0.2600875, 1.976706, 1, 0, 0.7098039, 1,
1.143904, -0.6443617, 2.331438, 1, 0, 0.7019608, 1,
1.155444, 0.4542365, 0.4094184, 1, 0, 0.6941177, 1,
1.157171, 0.7542701, -0.1509183, 1, 0, 0.6901961, 1,
1.157865, 1.56271, 1.791228, 1, 0, 0.682353, 1,
1.158124, -1.938593, 1.338931, 1, 0, 0.6784314, 1,
1.162883, -1.331292, 4.322138, 1, 0, 0.6705883, 1,
1.166275, 0.6127744, 0.3127231, 1, 0, 0.6666667, 1,
1.172243, -0.7445834, 1.699264, 1, 0, 0.6588235, 1,
1.178264, 0.1078788, 0.8329037, 1, 0, 0.654902, 1,
1.184084, -1.916293, 2.9809, 1, 0, 0.6470588, 1,
1.186997, -0.6672968, 1.041577, 1, 0, 0.6431373, 1,
1.203023, 0.5275846, 1.429054, 1, 0, 0.6352941, 1,
1.20522, -0.8010334, 1.330358, 1, 0, 0.6313726, 1,
1.208201, -1.478165, 1.438977, 1, 0, 0.6235294, 1,
1.208421, 1.957993, 2.007765, 1, 0, 0.6196079, 1,
1.211921, 1.579473, 0.8686202, 1, 0, 0.6117647, 1,
1.212317, 1.410868, -0.0573907, 1, 0, 0.6078432, 1,
1.215264, -0.7830133, 1.786092, 1, 0, 0.6, 1,
1.217479, -0.5781916, 1.535518, 1, 0, 0.5921569, 1,
1.218559, 0.3723216, 1.364882, 1, 0, 0.5882353, 1,
1.255348, -0.3493427, 2.240265, 1, 0, 0.5803922, 1,
1.258561, 1.50765, 1.634397, 1, 0, 0.5764706, 1,
1.271422, 2.009962, -1.88177, 1, 0, 0.5686275, 1,
1.272778, 0.05792213, 1.994405, 1, 0, 0.5647059, 1,
1.277306, -0.7778809, 1.818936, 1, 0, 0.5568628, 1,
1.279078, 0.7364325, 1.154315, 1, 0, 0.5529412, 1,
1.288259, -1.410092, 1.428957, 1, 0, 0.5450981, 1,
1.288335, 0.5987731, 1.901146, 1, 0, 0.5411765, 1,
1.299297, -0.4989515, 0.9839766, 1, 0, 0.5333334, 1,
1.311066, -1.574117, 3.137265, 1, 0, 0.5294118, 1,
1.311094, 0.5902085, 0.2970563, 1, 0, 0.5215687, 1,
1.323907, -0.3426485, 2.880598, 1, 0, 0.5176471, 1,
1.33276, 1.169243, 0.1996396, 1, 0, 0.509804, 1,
1.341243, 1.086344, -0.3109075, 1, 0, 0.5058824, 1,
1.342357, 1.87681, 0.7762412, 1, 0, 0.4980392, 1,
1.346433, 0.9089601, 1.035908, 1, 0, 0.4901961, 1,
1.348422, 0.2515894, 0.3120977, 1, 0, 0.4862745, 1,
1.349151, 2.054112, 1.003621, 1, 0, 0.4784314, 1,
1.349312, -0.7010046, 4.138614, 1, 0, 0.4745098, 1,
1.350224, 0.3655464, 0.9770654, 1, 0, 0.4666667, 1,
1.36997, -0.1044415, 0.209453, 1, 0, 0.4627451, 1,
1.395009, -0.8713849, 2.898449, 1, 0, 0.454902, 1,
1.407073, -0.1682568, 3.532854, 1, 0, 0.4509804, 1,
1.414248, -1.071512, 1.943226, 1, 0, 0.4431373, 1,
1.423136, -1.268646, 1.08349, 1, 0, 0.4392157, 1,
1.437825, 1.183763, 0.5030078, 1, 0, 0.4313726, 1,
1.444696, -1.951723, 0.8345387, 1, 0, 0.427451, 1,
1.445332, -0.6900726, 0.7264968, 1, 0, 0.4196078, 1,
1.445397, 1.427341, -0.06192987, 1, 0, 0.4156863, 1,
1.455549, -0.782254, 1.384645, 1, 0, 0.4078431, 1,
1.45634, -0.3760375, 1.444999, 1, 0, 0.4039216, 1,
1.459284, 0.2655896, 2.224878, 1, 0, 0.3960784, 1,
1.460539, -1.418107, 2.262007, 1, 0, 0.3882353, 1,
1.491123, -0.2514825, 2.088098, 1, 0, 0.3843137, 1,
1.4918, -0.6195929, 1.519769, 1, 0, 0.3764706, 1,
1.49211, 0.4164994, 2.767447, 1, 0, 0.372549, 1,
1.494426, 1.416584, 1.215395, 1, 0, 0.3647059, 1,
1.495693, 1.759007, -0.8473914, 1, 0, 0.3607843, 1,
1.508533, -0.5044122, 3.365931, 1, 0, 0.3529412, 1,
1.514074, -1.641184, 3.289567, 1, 0, 0.3490196, 1,
1.521552, -0.5920051, 1.67739, 1, 0, 0.3411765, 1,
1.526563, 1.582535, 1.379734, 1, 0, 0.3372549, 1,
1.533605, 0.7049203, 2.293191, 1, 0, 0.3294118, 1,
1.536833, -0.3240963, 1.758199, 1, 0, 0.3254902, 1,
1.544089, 0.1135935, 1.399593, 1, 0, 0.3176471, 1,
1.55038, 0.9533776, 1.297353, 1, 0, 0.3137255, 1,
1.550702, -0.7151865, 2.239715, 1, 0, 0.3058824, 1,
1.559779, 0.2834081, 2.476548, 1, 0, 0.2980392, 1,
1.565611, -0.02377525, 0.4800008, 1, 0, 0.2941177, 1,
1.572478, 0.3530039, 1.263152, 1, 0, 0.2862745, 1,
1.57758, 0.04818589, 3.100262, 1, 0, 0.282353, 1,
1.598389, -1.569692, 3.909051, 1, 0, 0.2745098, 1,
1.613635, 1.013243, -0.04221974, 1, 0, 0.2705882, 1,
1.634203, -0.08477154, 3.245443, 1, 0, 0.2627451, 1,
1.654768, 0.5225089, 0.2668316, 1, 0, 0.2588235, 1,
1.664771, -0.4969788, 2.179335, 1, 0, 0.2509804, 1,
1.667326, 0.4054691, 0.7366525, 1, 0, 0.2470588, 1,
1.670691, 0.349443, 1.311187, 1, 0, 0.2392157, 1,
1.671631, 1.394794, 0.7219605, 1, 0, 0.2352941, 1,
1.671858, 1.461517, 4.259561, 1, 0, 0.227451, 1,
1.67557, -0.6734523, 3.337251, 1, 0, 0.2235294, 1,
1.68265, -1.274503, 2.186944, 1, 0, 0.2156863, 1,
1.689997, -0.9307112, 3.573182, 1, 0, 0.2117647, 1,
1.706419, 1.247293, 1.386261, 1, 0, 0.2039216, 1,
1.719854, 0.5513579, 1.535504, 1, 0, 0.1960784, 1,
1.741885, 1.233757, 2.260576, 1, 0, 0.1921569, 1,
1.784601, 0.7516515, 0.003704153, 1, 0, 0.1843137, 1,
1.821081, -0.108507, 1.834386, 1, 0, 0.1803922, 1,
1.84711, 1.504306, 0.1364756, 1, 0, 0.172549, 1,
1.858484, -0.3588335, 1.096524, 1, 0, 0.1686275, 1,
1.866951, 0.648203, 1.31568, 1, 0, 0.1607843, 1,
1.871252, -1.699527, 1.52548, 1, 0, 0.1568628, 1,
1.874804, 0.5758697, 1.261805, 1, 0, 0.1490196, 1,
1.896987, -0.09479315, 0.6344816, 1, 0, 0.145098, 1,
1.901678, 1.597615, 1.537356, 1, 0, 0.1372549, 1,
1.906694, 0.7380229, 0.6042962, 1, 0, 0.1333333, 1,
2.083244, 2.228156, 1.020188, 1, 0, 0.1254902, 1,
2.094732, 1.308147, 0.4847521, 1, 0, 0.1215686, 1,
2.143645, -0.2411442, 0.7116406, 1, 0, 0.1137255, 1,
2.206475, 0.9543796, 1.732444, 1, 0, 0.1098039, 1,
2.215564, -1.065259, 2.720526, 1, 0, 0.1019608, 1,
2.23568, 1.393703, -0.7546137, 1, 0, 0.09411765, 1,
2.236356, 0.2021897, 0.6097449, 1, 0, 0.09019608, 1,
2.273867, 0.4071889, 3.036784, 1, 0, 0.08235294, 1,
2.29209, -0.9038503, 2.107918, 1, 0, 0.07843138, 1,
2.386474, 2.019167, 0.5359297, 1, 0, 0.07058824, 1,
2.406926, 0.1564897, 4.072816, 1, 0, 0.06666667, 1,
2.407058, -0.03600292, 0.3687428, 1, 0, 0.05882353, 1,
2.424795, -0.4845199, 2.583065, 1, 0, 0.05490196, 1,
2.447064, 1.20482, 1.299309, 1, 0, 0.04705882, 1,
2.52386, -0.6245565, 1.929432, 1, 0, 0.04313726, 1,
2.540911, 0.3592148, 0.5633841, 1, 0, 0.03529412, 1,
2.554708, 0.06576569, 1.422394, 1, 0, 0.03137255, 1,
2.6273, -0.5864832, -0.9446366, 1, 0, 0.02352941, 1,
2.65383, 1.090677, 1.747228, 1, 0, 0.01960784, 1,
2.682254, -0.6119204, 1.452898, 1, 0, 0.01176471, 1,
3.16569, 0.6459836, 0.4362135, 1, 0, 0.007843138, 1
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
-0.02217805, -5.016543, -8.184525, 0, -0.5, 0.5, 0.5,
-0.02217805, -5.016543, -8.184525, 1, -0.5, 0.5, 0.5,
-0.02217805, -5.016543, -8.184525, 1, 1.5, 0.5, 0.5,
-0.02217805, -5.016543, -8.184525, 0, 1.5, 0.5, 0.5
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
-4.290733, -0.1179639, -8.184525, 0, -0.5, 0.5, 0.5,
-4.290733, -0.1179639, -8.184525, 1, -0.5, 0.5, 0.5,
-4.290733, -0.1179639, -8.184525, 1, 1.5, 0.5, 0.5,
-4.290733, -0.1179639, -8.184525, 0, 1.5, 0.5, 0.5
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
-4.290733, -5.016543, -0.1978285, 0, -0.5, 0.5, 0.5,
-4.290733, -5.016543, -0.1978285, 1, -0.5, 0.5, 0.5,
-4.290733, -5.016543, -0.1978285, 1, 1.5, 0.5, 0.5,
-4.290733, -5.016543, -0.1978285, 0, 1.5, 0.5, 0.5
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
-3, -3.886102, -6.341442,
3, -3.886102, -6.341442,
-3, -3.886102, -6.341442,
-3, -4.074509, -6.648622,
-2, -3.886102, -6.341442,
-2, -4.074509, -6.648622,
-1, -3.886102, -6.341442,
-1, -4.074509, -6.648622,
0, -3.886102, -6.341442,
0, -4.074509, -6.648622,
1, -3.886102, -6.341442,
1, -4.074509, -6.648622,
2, -3.886102, -6.341442,
2, -4.074509, -6.648622,
3, -3.886102, -6.341442,
3, -4.074509, -6.648622
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
-3, -4.451322, -7.262983, 0, -0.5, 0.5, 0.5,
-3, -4.451322, -7.262983, 1, -0.5, 0.5, 0.5,
-3, -4.451322, -7.262983, 1, 1.5, 0.5, 0.5,
-3, -4.451322, -7.262983, 0, 1.5, 0.5, 0.5,
-2, -4.451322, -7.262983, 0, -0.5, 0.5, 0.5,
-2, -4.451322, -7.262983, 1, -0.5, 0.5, 0.5,
-2, -4.451322, -7.262983, 1, 1.5, 0.5, 0.5,
-2, -4.451322, -7.262983, 0, 1.5, 0.5, 0.5,
-1, -4.451322, -7.262983, 0, -0.5, 0.5, 0.5,
-1, -4.451322, -7.262983, 1, -0.5, 0.5, 0.5,
-1, -4.451322, -7.262983, 1, 1.5, 0.5, 0.5,
-1, -4.451322, -7.262983, 0, 1.5, 0.5, 0.5,
0, -4.451322, -7.262983, 0, -0.5, 0.5, 0.5,
0, -4.451322, -7.262983, 1, -0.5, 0.5, 0.5,
0, -4.451322, -7.262983, 1, 1.5, 0.5, 0.5,
0, -4.451322, -7.262983, 0, 1.5, 0.5, 0.5,
1, -4.451322, -7.262983, 0, -0.5, 0.5, 0.5,
1, -4.451322, -7.262983, 1, -0.5, 0.5, 0.5,
1, -4.451322, -7.262983, 1, 1.5, 0.5, 0.5,
1, -4.451322, -7.262983, 0, 1.5, 0.5, 0.5,
2, -4.451322, -7.262983, 0, -0.5, 0.5, 0.5,
2, -4.451322, -7.262983, 1, -0.5, 0.5, 0.5,
2, -4.451322, -7.262983, 1, 1.5, 0.5, 0.5,
2, -4.451322, -7.262983, 0, 1.5, 0.5, 0.5,
3, -4.451322, -7.262983, 0, -0.5, 0.5, 0.5,
3, -4.451322, -7.262983, 1, -0.5, 0.5, 0.5,
3, -4.451322, -7.262983, 1, 1.5, 0.5, 0.5,
3, -4.451322, -7.262983, 0, 1.5, 0.5, 0.5
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
-3.305682, -2, -6.341442,
-3.305682, 2, -6.341442,
-3.305682, -2, -6.341442,
-3.469857, -2, -6.648622,
-3.305682, 0, -6.341442,
-3.469857, 0, -6.648622,
-3.305682, 2, -6.341442,
-3.469857, 2, -6.648622
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
"0",
"2"
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
-3.798208, -2, -7.262983, 0, -0.5, 0.5, 0.5,
-3.798208, -2, -7.262983, 1, -0.5, 0.5, 0.5,
-3.798208, -2, -7.262983, 1, 1.5, 0.5, 0.5,
-3.798208, -2, -7.262983, 0, 1.5, 0.5, 0.5,
-3.798208, 0, -7.262983, 0, -0.5, 0.5, 0.5,
-3.798208, 0, -7.262983, 1, -0.5, 0.5, 0.5,
-3.798208, 0, -7.262983, 1, 1.5, 0.5, 0.5,
-3.798208, 0, -7.262983, 0, 1.5, 0.5, 0.5,
-3.798208, 2, -7.262983, 0, -0.5, 0.5, 0.5,
-3.798208, 2, -7.262983, 1, -0.5, 0.5, 0.5,
-3.798208, 2, -7.262983, 1, 1.5, 0.5, 0.5,
-3.798208, 2, -7.262983, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.305682, -3.886102, -6,
-3.305682, -3.886102, 4,
-3.305682, -3.886102, -6,
-3.469857, -4.074509, -6,
-3.305682, -3.886102, -4,
-3.469857, -4.074509, -4,
-3.305682, -3.886102, -2,
-3.469857, -4.074509, -2,
-3.305682, -3.886102, 0,
-3.469857, -4.074509, 0,
-3.305682, -3.886102, 2,
-3.469857, -4.074509, 2,
-3.305682, -3.886102, 4,
-3.469857, -4.074509, 4
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
"-6",
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
-3.798208, -4.451322, -6, 0, -0.5, 0.5, 0.5,
-3.798208, -4.451322, -6, 1, -0.5, 0.5, 0.5,
-3.798208, -4.451322, -6, 1, 1.5, 0.5, 0.5,
-3.798208, -4.451322, -6, 0, 1.5, 0.5, 0.5,
-3.798208, -4.451322, -4, 0, -0.5, 0.5, 0.5,
-3.798208, -4.451322, -4, 1, -0.5, 0.5, 0.5,
-3.798208, -4.451322, -4, 1, 1.5, 0.5, 0.5,
-3.798208, -4.451322, -4, 0, 1.5, 0.5, 0.5,
-3.798208, -4.451322, -2, 0, -0.5, 0.5, 0.5,
-3.798208, -4.451322, -2, 1, -0.5, 0.5, 0.5,
-3.798208, -4.451322, -2, 1, 1.5, 0.5, 0.5,
-3.798208, -4.451322, -2, 0, 1.5, 0.5, 0.5,
-3.798208, -4.451322, 0, 0, -0.5, 0.5, 0.5,
-3.798208, -4.451322, 0, 1, -0.5, 0.5, 0.5,
-3.798208, -4.451322, 0, 1, 1.5, 0.5, 0.5,
-3.798208, -4.451322, 0, 0, 1.5, 0.5, 0.5,
-3.798208, -4.451322, 2, 0, -0.5, 0.5, 0.5,
-3.798208, -4.451322, 2, 1, -0.5, 0.5, 0.5,
-3.798208, -4.451322, 2, 1, 1.5, 0.5, 0.5,
-3.798208, -4.451322, 2, 0, 1.5, 0.5, 0.5,
-3.798208, -4.451322, 4, 0, -0.5, 0.5, 0.5,
-3.798208, -4.451322, 4, 1, -0.5, 0.5, 0.5,
-3.798208, -4.451322, 4, 1, 1.5, 0.5, 0.5,
-3.798208, -4.451322, 4, 0, 1.5, 0.5, 0.5
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
-3.305682, -3.886102, -6.341442,
-3.305682, 3.650174, -6.341442,
-3.305682, -3.886102, 5.945785,
-3.305682, 3.650174, 5.945785,
-3.305682, -3.886102, -6.341442,
-3.305682, -3.886102, 5.945785,
-3.305682, 3.650174, -6.341442,
-3.305682, 3.650174, 5.945785,
-3.305682, -3.886102, -6.341442,
3.261326, -3.886102, -6.341442,
-3.305682, -3.886102, 5.945785,
3.261326, -3.886102, 5.945785,
-3.305682, 3.650174, -6.341442,
3.261326, 3.650174, -6.341442,
-3.305682, 3.650174, 5.945785,
3.261326, 3.650174, 5.945785,
3.261326, -3.886102, -6.341442,
3.261326, 3.650174, -6.341442,
3.261326, -3.886102, 5.945785,
3.261326, 3.650174, 5.945785,
3.261326, -3.886102, -6.341442,
3.261326, -3.886102, 5.945785,
3.261326, 3.650174, -6.341442,
3.261326, 3.650174, 5.945785
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
var radius = 8.458107;
var distance = 37.63107;
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
mvMatrix.translate( 0.02217805, 0.1179639, 0.1978285 );
mvMatrix.scale( 1.392578, 1.213474, 0.7442746 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.63107);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Phenanthrene<-read.table("Phenanthrene.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Phenanthrene$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phenanthrene' not found
```

```r
y<-Phenanthrene$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phenanthrene' not found
```

```r
z<-Phenanthrene$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phenanthrene' not found
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
-3.210046, -1.268094, -2.774632, 0, 0, 1, 1, 1,
-2.82585, 0.7315156, -3.209913, 1, 0, 0, 1, 1,
-2.794096, 1.642479, -0.6783455, 1, 0, 0, 1, 1,
-2.745919, 0.02463418, -1.568187, 1, 0, 0, 1, 1,
-2.71893, -0.7313794, -1.043246, 1, 0, 0, 1, 1,
-2.565632, 1.466881, -0.4456027, 1, 0, 0, 1, 1,
-2.550139, 1.743869, -1.747929, 0, 0, 0, 1, 1,
-2.545452, 2.234991, -1.350551, 0, 0, 0, 1, 1,
-2.354332, -1.043583, -1.969589, 0, 0, 0, 1, 1,
-2.193399, -1.525154, -3.283878, 0, 0, 0, 1, 1,
-2.185297, 0.7917918, 1.238611, 0, 0, 0, 1, 1,
-2.180029, 1.028989, -2.006059, 0, 0, 0, 1, 1,
-2.166151, 0.1138378, -1.504292, 0, 0, 0, 1, 1,
-2.159523, 2.351167, -0.5475298, 1, 1, 1, 1, 1,
-2.140004, 0.6333911, -1.077128, 1, 1, 1, 1, 1,
-2.092695, -0.4064496, -4.097793, 1, 1, 1, 1, 1,
-2.09257, 1.063345, -2.088758, 1, 1, 1, 1, 1,
-2.046495, 1.153755, -1.181312, 1, 1, 1, 1, 1,
-1.994763, 0.8826326, -1.324123, 1, 1, 1, 1, 1,
-1.992727, -0.7775854, -2.503944, 1, 1, 1, 1, 1,
-1.981628, 0.05762361, 0.4926144, 1, 1, 1, 1, 1,
-1.977298, -0.03336689, -2.052208, 1, 1, 1, 1, 1,
-1.968179, -0.01906196, -2.191867, 1, 1, 1, 1, 1,
-1.959657, 0.2579688, -1.371052, 1, 1, 1, 1, 1,
-1.921984, -0.1405984, -2.627168, 1, 1, 1, 1, 1,
-1.907731, 1.199974, -0.3452215, 1, 1, 1, 1, 1,
-1.891475, -0.9792475, -0.698514, 1, 1, 1, 1, 1,
-1.878225, -0.2933556, -2.838007, 1, 1, 1, 1, 1,
-1.869103, 0.6555386, -0.8182728, 0, 0, 1, 1, 1,
-1.861791, -0.984576, -3.289634, 1, 0, 0, 1, 1,
-1.834575, 0.7672035, -0.6675062, 1, 0, 0, 1, 1,
-1.830969, -1.558183, -2.600791, 1, 0, 0, 1, 1,
-1.816223, 0.1632277, 0.3296286, 1, 0, 0, 1, 1,
-1.809023, 0.3482001, -1.16498, 1, 0, 0, 1, 1,
-1.785739, 0.09463286, -0.4908397, 0, 0, 0, 1, 1,
-1.754349, 3.540422, -1.729358, 0, 0, 0, 1, 1,
-1.753532, -1.894028, -2.411846, 0, 0, 0, 1, 1,
-1.752643, 1.488936, -0.1354702, 0, 0, 0, 1, 1,
-1.739299, 0.4145946, -1.243203, 0, 0, 0, 1, 1,
-1.734031, 0.1294606, -1.423629, 0, 0, 0, 1, 1,
-1.725952, 0.1959, -2.021775, 0, 0, 0, 1, 1,
-1.71851, -0.8196291, -3.000585, 1, 1, 1, 1, 1,
-1.701425, 0.2734479, -2.901902, 1, 1, 1, 1, 1,
-1.700273, -0.4441796, -2.573273, 1, 1, 1, 1, 1,
-1.700233, -1.662663, -1.325337, 1, 1, 1, 1, 1,
-1.68202, -0.3555807, -2.928925, 1, 1, 1, 1, 1,
-1.677109, -1.330914, -2.156642, 1, 1, 1, 1, 1,
-1.677001, -1.564885, -4.041787, 1, 1, 1, 1, 1,
-1.66941, 0.1495803, -0.5345175, 1, 1, 1, 1, 1,
-1.656811, 0.4653533, -0.5114076, 1, 1, 1, 1, 1,
-1.651529, -0.052006, -1.731717, 1, 1, 1, 1, 1,
-1.648879, 1.233271, 0.2365391, 1, 1, 1, 1, 1,
-1.628177, 0.542899, -2.874821, 1, 1, 1, 1, 1,
-1.576277, -1.078904, -2.468859, 1, 1, 1, 1, 1,
-1.575924, 0.4188533, -1.389068, 1, 1, 1, 1, 1,
-1.573167, 1.671166, -0.4529908, 1, 1, 1, 1, 1,
-1.57229, -0.2687907, -0.9542118, 0, 0, 1, 1, 1,
-1.56415, 0.4574628, -1.171653, 1, 0, 0, 1, 1,
-1.563994, -0.1588039, -2.294974, 1, 0, 0, 1, 1,
-1.556529, -0.2602733, -2.684967, 1, 0, 0, 1, 1,
-1.518548, -0.8296073, -1.37262, 1, 0, 0, 1, 1,
-1.499767, -0.6759642, -2.211756, 1, 0, 0, 1, 1,
-1.491676, -0.4360422, -1.805806, 0, 0, 0, 1, 1,
-1.489267, 1.842121, -0.2980479, 0, 0, 0, 1, 1,
-1.482947, 0.5167574, -2.282211, 0, 0, 0, 1, 1,
-1.472758, -0.6234089, -2.598454, 0, 0, 0, 1, 1,
-1.468228, -0.3838889, -0.6479775, 0, 0, 0, 1, 1,
-1.457195, 0.1501235, -1.063231, 0, 0, 0, 1, 1,
-1.447171, -1.109025, -1.342598, 0, 0, 0, 1, 1,
-1.444835, -1.003794, -2.105547, 1, 1, 1, 1, 1,
-1.442366, -0.3527036, -2.955479, 1, 1, 1, 1, 1,
-1.433545, 1.042553, -0.3274488, 1, 1, 1, 1, 1,
-1.432574, 0.006771014, -1.147711, 1, 1, 1, 1, 1,
-1.431613, 0.4463709, -1.575628, 1, 1, 1, 1, 1,
-1.417419, 0.6837556, -0.2963142, 1, 1, 1, 1, 1,
-1.41541, -1.465041, -3.173808, 1, 1, 1, 1, 1,
-1.410835, 0.5414965, -1.361307, 1, 1, 1, 1, 1,
-1.404956, -0.5168049, -1.653248, 1, 1, 1, 1, 1,
-1.404197, -1.51886, -1.843774, 1, 1, 1, 1, 1,
-1.390963, 1.768101, 0.1237057, 1, 1, 1, 1, 1,
-1.383536, -1.860556, -2.959286, 1, 1, 1, 1, 1,
-1.3778, -0.02653812, -4.019034, 1, 1, 1, 1, 1,
-1.363547, 0.2417804, -1.124239, 1, 1, 1, 1, 1,
-1.361845, -1.510664, -2.012425, 1, 1, 1, 1, 1,
-1.355276, -0.4045818, -3.142025, 0, 0, 1, 1, 1,
-1.351765, 0.3474543, -0.9240633, 1, 0, 0, 1, 1,
-1.348934, -0.005549878, -1.427236, 1, 0, 0, 1, 1,
-1.337732, 0.4980089, -0.8188589, 1, 0, 0, 1, 1,
-1.333278, 0.08927481, -1.282454, 1, 0, 0, 1, 1,
-1.329473, 1.184995, 0.3793978, 1, 0, 0, 1, 1,
-1.327501, -0.3651904, -1.483767, 0, 0, 0, 1, 1,
-1.317922, -0.8353485, -0.701111, 0, 0, 0, 1, 1,
-1.31012, 0.3932084, -0.508496, 0, 0, 0, 1, 1,
-1.308197, -1.50796, -2.563013, 0, 0, 0, 1, 1,
-1.308037, -0.390569, -0.3407081, 0, 0, 0, 1, 1,
-1.300065, 0.05092463, 0.2678342, 0, 0, 0, 1, 1,
-1.297252, 0.3273495, -0.5937256, 0, 0, 0, 1, 1,
-1.294452, 1.068146, -0.8506513, 1, 1, 1, 1, 1,
-1.294393, -0.5795742, -0.8427866, 1, 1, 1, 1, 1,
-1.291061, -0.5409772, -1.827633, 1, 1, 1, 1, 1,
-1.277189, -1.012433, -1.36621, 1, 1, 1, 1, 1,
-1.276948, -0.9983077, -2.449289, 1, 1, 1, 1, 1,
-1.276546, -0.1825819, -1.09777, 1, 1, 1, 1, 1,
-1.270002, -1.778404, -2.405886, 1, 1, 1, 1, 1,
-1.269501, -0.8659372, -4.273741, 1, 1, 1, 1, 1,
-1.266036, 0.8680719, -1.17887, 1, 1, 1, 1, 1,
-1.248583, 2.18733, 0.7311395, 1, 1, 1, 1, 1,
-1.246274, -1.309458, -2.364347, 1, 1, 1, 1, 1,
-1.237537, -2.793728, -3.999525, 1, 1, 1, 1, 1,
-1.230572, -0.5578299, -1.308459, 1, 1, 1, 1, 1,
-1.224951, 0.3297773, -1.931695, 1, 1, 1, 1, 1,
-1.211457, -0.4254493, -1.961105, 1, 1, 1, 1, 1,
-1.206936, 1.03808, -2.24806, 0, 0, 1, 1, 1,
-1.20578, -0.0489415, -2.225479, 1, 0, 0, 1, 1,
-1.205448, -1.266447, -1.753042, 1, 0, 0, 1, 1,
-1.20513, -1.306766, -2.627443, 1, 0, 0, 1, 1,
-1.204574, -0.03092657, -2.506367, 1, 0, 0, 1, 1,
-1.199417, -0.1752604, -1.831894, 1, 0, 0, 1, 1,
-1.198775, -2.038147, -4.889284, 0, 0, 0, 1, 1,
-1.198278, 0.1897722, 0.1635151, 0, 0, 0, 1, 1,
-1.194379, 1.24976, -1.609255, 0, 0, 0, 1, 1,
-1.181781, -2.431941, -2.433658, 0, 0, 0, 1, 1,
-1.180103, -0.4216674, -1.022377, 0, 0, 0, 1, 1,
-1.176807, 0.2382747, -0.133689, 0, 0, 0, 1, 1,
-1.169632, -1.864274, -4.616281, 0, 0, 0, 1, 1,
-1.16862, -0.2289878, -2.216478, 1, 1, 1, 1, 1,
-1.168543, 0.5419195, -1.871149, 1, 1, 1, 1, 1,
-1.165152, -0.2252192, -2.056408, 1, 1, 1, 1, 1,
-1.164313, 0.3789232, -2.44418, 1, 1, 1, 1, 1,
-1.163205, -1.302179, -0.5291984, 1, 1, 1, 1, 1,
-1.161546, -0.2792507, -2.682123, 1, 1, 1, 1, 1,
-1.157307, -0.6724437, -2.268169, 1, 1, 1, 1, 1,
-1.157104, -1.985742, -2.21883, 1, 1, 1, 1, 1,
-1.151622, 0.6677218, 1.13786, 1, 1, 1, 1, 1,
-1.14805, 0.3479384, -1.812267, 1, 1, 1, 1, 1,
-1.137287, -0.9385761, -3.470669, 1, 1, 1, 1, 1,
-1.130013, 0.6709635, 0.125282, 1, 1, 1, 1, 1,
-1.129333, -0.1259194, -2.029497, 1, 1, 1, 1, 1,
-1.119149, 0.1077247, -2.188494, 1, 1, 1, 1, 1,
-1.118429, 0.9183809, -2.100919, 1, 1, 1, 1, 1,
-1.113168, -0.5900843, -2.999371, 0, 0, 1, 1, 1,
-1.112227, -0.4076864, -2.294979, 1, 0, 0, 1, 1,
-1.109364, 1.258842, -0.7068468, 1, 0, 0, 1, 1,
-1.108359, 0.5265125, -1.301105, 1, 0, 0, 1, 1,
-1.104164, -0.2975443, -2.723837, 1, 0, 0, 1, 1,
-1.099617, 0.3604069, -1.660212, 1, 0, 0, 1, 1,
-1.09787, 0.04977733, -2.608296, 0, 0, 0, 1, 1,
-1.08716, -0.3576879, -0.8029007, 0, 0, 0, 1, 1,
-1.082018, -0.2228587, -2.023369, 0, 0, 0, 1, 1,
-1.077872, -0.2141075, -2.727028, 0, 0, 0, 1, 1,
-1.068235, 0.05720584, -2.093348, 0, 0, 0, 1, 1,
-1.058322, 0.8760817, -1.976877, 0, 0, 0, 1, 1,
-1.054514, 0.6116401, -0.6100835, 0, 0, 0, 1, 1,
-1.054342, -2.12906, -3.530208, 1, 1, 1, 1, 1,
-1.051736, 0.1992253, -0.864836, 1, 1, 1, 1, 1,
-1.05001, 1.436977, -0.9440229, 1, 1, 1, 1, 1,
-1.042583, 0.5965301, 0.6052845, 1, 1, 1, 1, 1,
-1.036224, -0.3369531, -0.5948649, 1, 1, 1, 1, 1,
-1.021114, 1.209897, -0.3169434, 1, 1, 1, 1, 1,
-1.020452, -1.768092, -3.563717, 1, 1, 1, 1, 1,
-1.015016, -0.05949636, -1.445356, 1, 1, 1, 1, 1,
-1.011008, -0.6661808, -1.341852, 1, 1, 1, 1, 1,
-1.010912, -0.9064505, -3.73663, 1, 1, 1, 1, 1,
-1.002679, 0.04850711, -1.155812, 1, 1, 1, 1, 1,
-0.992358, -1.125296, -3.823648, 1, 1, 1, 1, 1,
-0.991111, -2.589079, -5.213478, 1, 1, 1, 1, 1,
-0.9842079, 0.484702, -1.367223, 1, 1, 1, 1, 1,
-0.9804498, -0.09749508, -1.419605, 1, 1, 1, 1, 1,
-0.979301, 0.04797659, -0.4923379, 0, 0, 1, 1, 1,
-0.9745633, -1.398362, -2.020552, 1, 0, 0, 1, 1,
-0.9726313, 0.7831601, 0.9856967, 1, 0, 0, 1, 1,
-0.9673464, 0.3628953, -0.7125032, 1, 0, 0, 1, 1,
-0.9652156, 0.5919278, -0.5986267, 1, 0, 0, 1, 1,
-0.9624839, -0.588889, -3.149808, 1, 0, 0, 1, 1,
-0.9618773, 0.2750694, -1.847026, 0, 0, 0, 1, 1,
-0.960932, -0.4780828, -1.090783, 0, 0, 0, 1, 1,
-0.9584568, -0.02765833, -0.7369505, 0, 0, 0, 1, 1,
-0.9555743, 0.3960027, 0.6451797, 0, 0, 0, 1, 1,
-0.9481925, 0.09647392, -2.054804, 0, 0, 0, 1, 1,
-0.9435075, 0.9105043, -1.502965, 0, 0, 0, 1, 1,
-0.9359642, 1.493167, -0.4783646, 0, 0, 0, 1, 1,
-0.9350285, -0.09831917, -1.583997, 1, 1, 1, 1, 1,
-0.9317034, 0.8667052, 1.370787, 1, 1, 1, 1, 1,
-0.9264895, -0.9539987, -2.499819, 1, 1, 1, 1, 1,
-0.9217826, 0.1232919, -2.308303, 1, 1, 1, 1, 1,
-0.9161664, -1.409297, -0.8312665, 1, 1, 1, 1, 1,
-0.9150867, 0.4605749, -2.364827, 1, 1, 1, 1, 1,
-0.9130331, 2.158253, 0.9292779, 1, 1, 1, 1, 1,
-0.900194, 0.591935, -0.2750522, 1, 1, 1, 1, 1,
-0.899821, -0.155814, -1.569901, 1, 1, 1, 1, 1,
-0.8949792, 2.43311, 0.003684893, 1, 1, 1, 1, 1,
-0.8909495, 0.6246337, -0.09189778, 1, 1, 1, 1, 1,
-0.8810478, -0.3189035, -0.5601141, 1, 1, 1, 1, 1,
-0.8771282, 0.868894, -2.073632, 1, 1, 1, 1, 1,
-0.8736063, 1.280896, -1.025179, 1, 1, 1, 1, 1,
-0.8723971, 0.1383551, -1.101847, 1, 1, 1, 1, 1,
-0.8659932, 0.8674505, 1.574539, 0, 0, 1, 1, 1,
-0.8633595, -0.6988446, -3.754082, 1, 0, 0, 1, 1,
-0.861009, -1.560254, -3.122591, 1, 0, 0, 1, 1,
-0.858627, -0.3579763, -3.464246, 1, 0, 0, 1, 1,
-0.857399, -0.3613586, -3.641447, 1, 0, 0, 1, 1,
-0.8573932, 1.487337, 0.4457394, 1, 0, 0, 1, 1,
-0.8521757, 0.05196004, -3.380784, 0, 0, 0, 1, 1,
-0.8471621, -0.7165695, -3.096856, 0, 0, 0, 1, 1,
-0.8351694, 0.004491944, -0.6150277, 0, 0, 0, 1, 1,
-0.8339783, -0.9542316, -2.276073, 0, 0, 0, 1, 1,
-0.8326539, -0.5584934, -1.198191, 0, 0, 0, 1, 1,
-0.8312576, 1.80959, -1.958254, 0, 0, 0, 1, 1,
-0.82535, 1.002815, -0.008935465, 0, 0, 0, 1, 1,
-0.8088666, 0.7118383, -3.250161, 1, 1, 1, 1, 1,
-0.8051567, -0.599466, -2.870187, 1, 1, 1, 1, 1,
-0.8010677, -1.063221, -2.046152, 1, 1, 1, 1, 1,
-0.7875924, 1.64543, -0.3802582, 1, 1, 1, 1, 1,
-0.7872384, 0.6524187, 0.06132402, 1, 1, 1, 1, 1,
-0.7854758, -0.6296276, -1.866401, 1, 1, 1, 1, 1,
-0.785368, 1.10304, -1.228726, 1, 1, 1, 1, 1,
-0.7837954, -0.115237, -0.8637142, 1, 1, 1, 1, 1,
-0.7809827, -1.515677, -3.065205, 1, 1, 1, 1, 1,
-0.7756872, -0.6432331, -2.895998, 1, 1, 1, 1, 1,
-0.7756398, -2.43253, -2.77443, 1, 1, 1, 1, 1,
-0.7668304, 0.813826, 1.317467, 1, 1, 1, 1, 1,
-0.7576749, -0.352469, -2.489082, 1, 1, 1, 1, 1,
-0.7572868, -0.0647155, -0.4133033, 1, 1, 1, 1, 1,
-0.7567706, -1.223723, -2.109244, 1, 1, 1, 1, 1,
-0.7543132, -0.2972473, -1.1069, 0, 0, 1, 1, 1,
-0.7537911, -0.3137536, -1.157813, 1, 0, 0, 1, 1,
-0.7497531, 0.7601427, -1.36002, 1, 0, 0, 1, 1,
-0.7481443, 1.69451, -0.6334871, 1, 0, 0, 1, 1,
-0.7394434, 0.2006187, -1.019834, 1, 0, 0, 1, 1,
-0.739089, 1.066338, -0.2490792, 1, 0, 0, 1, 1,
-0.738986, -0.02549365, -1.991732, 0, 0, 0, 1, 1,
-0.7383139, -0.2329733, -1.642178, 0, 0, 0, 1, 1,
-0.7367184, 0.3405043, -0.5273296, 0, 0, 0, 1, 1,
-0.733989, -0.2216956, -0.1831526, 0, 0, 0, 1, 1,
-0.722223, -1.433652, -3.292954, 0, 0, 0, 1, 1,
-0.7204502, -0.05727526, -1.097885, 0, 0, 0, 1, 1,
-0.7197795, 0.8025982, -2.329749, 0, 0, 0, 1, 1,
-0.7194644, 1.102114, 0.721823, 1, 1, 1, 1, 1,
-0.7119681, -0.904336, -3.077567, 1, 1, 1, 1, 1,
-0.7114766, 0.4494553, -1.400982, 1, 1, 1, 1, 1,
-0.706489, 0.7167557, -0.8416901, 1, 1, 1, 1, 1,
-0.706291, 0.9377679, -1.055162, 1, 1, 1, 1, 1,
-0.7050347, -0.5662153, -0.2003908, 1, 1, 1, 1, 1,
-0.7045605, 0.001020238, -2.359808, 1, 1, 1, 1, 1,
-0.7031088, -0.4992307, -0.9468233, 1, 1, 1, 1, 1,
-0.7028367, 0.1562097, -0.03228163, 1, 1, 1, 1, 1,
-0.6939452, -0.1550674, -1.790377, 1, 1, 1, 1, 1,
-0.6926181, -1.94396, -2.805614, 1, 1, 1, 1, 1,
-0.6825586, -0.01170303, -2.360221, 1, 1, 1, 1, 1,
-0.6822734, -1.229048, -1.446445, 1, 1, 1, 1, 1,
-0.6820955, -0.4460965, -2.962627, 1, 1, 1, 1, 1,
-0.680411, -0.08302016, -1.145686, 1, 1, 1, 1, 1,
-0.6755908, 0.6408604, -1.798962, 0, 0, 1, 1, 1,
-0.6747555, -0.009073563, -0.0655408, 1, 0, 0, 1, 1,
-0.6731283, -0.5292236, -3.004737, 1, 0, 0, 1, 1,
-0.6686075, -0.7883798, -2.030238, 1, 0, 0, 1, 1,
-0.6675418, 2.375676, -0.1775174, 1, 0, 0, 1, 1,
-0.6658922, -0.0768066, -2.81349, 1, 0, 0, 1, 1,
-0.661496, 2.201751, 0.02427841, 0, 0, 0, 1, 1,
-0.6560052, 0.4075831, -1.253732, 0, 0, 0, 1, 1,
-0.6559673, -1.086233, -3.81431, 0, 0, 0, 1, 1,
-0.6544652, 1.260268, -0.08579987, 0, 0, 0, 1, 1,
-0.6534324, 0.6841943, 0.03459937, 0, 0, 0, 1, 1,
-0.6497457, -0.6016987, -1.485517, 0, 0, 0, 1, 1,
-0.645402, 1.251134, 0.440061, 0, 0, 0, 1, 1,
-0.6308408, -0.7217079, -1.547953, 1, 1, 1, 1, 1,
-0.6250694, -0.2561643, -2.771414, 1, 1, 1, 1, 1,
-0.6246638, 0.3158437, -2.202827, 1, 1, 1, 1, 1,
-0.6233527, -0.1219618, -3.599741, 1, 1, 1, 1, 1,
-0.6162492, 2.692266, 0.5794232, 1, 1, 1, 1, 1,
-0.610275, -1.534199, -2.267874, 1, 1, 1, 1, 1,
-0.6051696, 1.922549, -3.037788, 1, 1, 1, 1, 1,
-0.6025937, 1.989185, -0.5709623, 1, 1, 1, 1, 1,
-0.6012274, 0.4530185, -1.368874, 1, 1, 1, 1, 1,
-0.5970675, -0.2369995, -1.684168, 1, 1, 1, 1, 1,
-0.5962388, -1.086716, -3.301783, 1, 1, 1, 1, 1,
-0.591204, 0.02438219, -0.6828612, 1, 1, 1, 1, 1,
-0.5910969, 0.59074, -2.467429, 1, 1, 1, 1, 1,
-0.5906179, -0.5665161, -1.738206, 1, 1, 1, 1, 1,
-0.5883297, 1.168476, -0.3040794, 1, 1, 1, 1, 1,
-0.5860512, -0.3431381, -1.829833, 0, 0, 1, 1, 1,
-0.5785269, 1.87889, 0.09053975, 1, 0, 0, 1, 1,
-0.5725079, 0.3070372, -1.207351, 1, 0, 0, 1, 1,
-0.565201, -0.2635749, -0.8756604, 1, 0, 0, 1, 1,
-0.5628069, -0.6122411, -2.314342, 1, 0, 0, 1, 1,
-0.55932, -0.02377279, -1.336722, 1, 0, 0, 1, 1,
-0.5577285, -0.6336401, -1.852206, 0, 0, 0, 1, 1,
-0.5554115, -0.6397491, -4.074995, 0, 0, 0, 1, 1,
-0.5510326, -1.701624, -4.639766, 0, 0, 0, 1, 1,
-0.5485238, -1.101109, -2.883499, 0, 0, 0, 1, 1,
-0.5440106, 0.6589743, 1.233061, 0, 0, 0, 1, 1,
-0.5429636, 0.001846929, -2.778541, 0, 0, 0, 1, 1,
-0.5409864, -0.05360329, -3.168445, 0, 0, 0, 1, 1,
-0.5386719, 1.245747, -1.225323, 1, 1, 1, 1, 1,
-0.5343841, -1.797995, -2.965192, 1, 1, 1, 1, 1,
-0.5326225, -0.1456197, -2.505023, 1, 1, 1, 1, 1,
-0.5115448, -0.582391, -2.486496, 1, 1, 1, 1, 1,
-0.5098025, 0.3153074, 0.2967458, 1, 1, 1, 1, 1,
-0.5074674, -2.139616, -2.308767, 1, 1, 1, 1, 1,
-0.5072215, 0.7556607, -2.447347, 1, 1, 1, 1, 1,
-0.5059658, -1.406739, -3.422063, 1, 1, 1, 1, 1,
-0.5009751, 0.7834679, -0.5951568, 1, 1, 1, 1, 1,
-0.500645, 1.184711, -0.4806027, 1, 1, 1, 1, 1,
-0.4980498, 1.112912, -2.222912, 1, 1, 1, 1, 1,
-0.4975421, 0.844776, 0.187765, 1, 1, 1, 1, 1,
-0.4940517, 0.1117129, -1.401987, 1, 1, 1, 1, 1,
-0.4912795, -0.4858063, -4.855066, 1, 1, 1, 1, 1,
-0.4892391, -0.7847099, -3.182983, 1, 1, 1, 1, 1,
-0.4849676, 0.6930388, -0.9725701, 0, 0, 1, 1, 1,
-0.4827194, -0.5771165, -2.667491, 1, 0, 0, 1, 1,
-0.4814829, 0.7190473, 0.9816011, 1, 0, 0, 1, 1,
-0.4771281, 0.8390803, -0.2711655, 1, 0, 0, 1, 1,
-0.4701848, 0.2534585, -1.189453, 1, 0, 0, 1, 1,
-0.4683453, 1.249413, 0.8279752, 1, 0, 0, 1, 1,
-0.4673042, -0.7561722, -3.202859, 0, 0, 0, 1, 1,
-0.4528402, 1.370767, -0.538534, 0, 0, 0, 1, 1,
-0.4452991, 0.2142935, -1.700772, 0, 0, 0, 1, 1,
-0.4443657, -1.119523, -2.95565, 0, 0, 0, 1, 1,
-0.4417588, -0.8484221, -1.191252, 0, 0, 0, 1, 1,
-0.437556, 1.166008, -0.3922519, 0, 0, 0, 1, 1,
-0.437343, 1.090541, -0.4496906, 0, 0, 0, 1, 1,
-0.434548, -0.01624146, -2.374912, 1, 1, 1, 1, 1,
-0.4332322, -0.08019631, -2.729332, 1, 1, 1, 1, 1,
-0.4317757, -0.4659004, -1.901908, 1, 1, 1, 1, 1,
-0.428622, 0.7583533, 0.3488508, 1, 1, 1, 1, 1,
-0.4228545, 0.0108341, -2.637327, 1, 1, 1, 1, 1,
-0.4214946, -0.2714286, -0.7148787, 1, 1, 1, 1, 1,
-0.4182401, 1.119887, 0.8619193, 1, 1, 1, 1, 1,
-0.4130788, 0.4607171, -1.644364, 1, 1, 1, 1, 1,
-0.41233, 0.3878202, -1.346665, 1, 1, 1, 1, 1,
-0.3975595, 0.8748971, 0.08160489, 1, 1, 1, 1, 1,
-0.3969128, 0.6184273, -1.771069, 1, 1, 1, 1, 1,
-0.3836602, -0.5545914, -1.042114, 1, 1, 1, 1, 1,
-0.3823256, 0.1081561, 0.2727779, 1, 1, 1, 1, 1,
-0.3793327, 0.5542699, -0.8131341, 1, 1, 1, 1, 1,
-0.3785706, 0.5627059, -3.353566, 1, 1, 1, 1, 1,
-0.3743578, 0.3014382, 2.187215, 0, 0, 1, 1, 1,
-0.369608, -0.2676418, -2.9224, 1, 0, 0, 1, 1,
-0.3693562, 0.04068679, -0.2240319, 1, 0, 0, 1, 1,
-0.3628326, 0.5922617, -1.299978, 1, 0, 0, 1, 1,
-0.3625954, 0.155621, -0.8040503, 1, 0, 0, 1, 1,
-0.3506097, 1.461982, 1.079708, 1, 0, 0, 1, 1,
-0.3461773, -0.05321892, -2.248165, 0, 0, 0, 1, 1,
-0.3439398, -0.4272262, -2.321881, 0, 0, 0, 1, 1,
-0.3425082, 0.1852508, -1.493548, 0, 0, 0, 1, 1,
-0.3387748, -0.2807811, -2.555901, 0, 0, 0, 1, 1,
-0.3345093, 1.206834, -0.2568125, 0, 0, 0, 1, 1,
-0.3343794, 1.143979, 1.352632, 0, 0, 0, 1, 1,
-0.3273858, 2.447125, -1.487584, 0, 0, 0, 1, 1,
-0.3263258, 0.4647428, 0.1769779, 1, 1, 1, 1, 1,
-0.324382, -1.286536, -3.048267, 1, 1, 1, 1, 1,
-0.3229503, -0.936747, -4.155243, 1, 1, 1, 1, 1,
-0.3203996, 0.4945061, -2.303773, 1, 1, 1, 1, 1,
-0.3201875, -0.6755639, -2.873664, 1, 1, 1, 1, 1,
-0.3190564, -0.8560587, -1.384046, 1, 1, 1, 1, 1,
-0.3153988, -0.9997924, -2.491532, 1, 1, 1, 1, 1,
-0.3074697, 0.6205519, 1.047728, 1, 1, 1, 1, 1,
-0.3060482, 0.6086434, -0.01031572, 1, 1, 1, 1, 1,
-0.3036493, -0.7291597, -2.783626, 1, 1, 1, 1, 1,
-0.2988698, 1.162407, 1.716166, 1, 1, 1, 1, 1,
-0.2979688, 0.02058576, -1.123221, 1, 1, 1, 1, 1,
-0.2941253, 1.185031, -0.6862801, 1, 1, 1, 1, 1,
-0.2932346, 0.1125578, -2.38007, 1, 1, 1, 1, 1,
-0.2913693, 0.8223826, 0.4736598, 1, 1, 1, 1, 1,
-0.2902119, 0.9222583, -1.534588, 0, 0, 1, 1, 1,
-0.2883341, 1.385153, -0.6921026, 1, 0, 0, 1, 1,
-0.2865033, -2.174183, -2.51255, 1, 0, 0, 1, 1,
-0.2860676, -1.516683, -3.545058, 1, 0, 0, 1, 1,
-0.2792273, -0.4597531, -1.899202, 1, 0, 0, 1, 1,
-0.2749279, 0.1471078, -0.6963941, 1, 0, 0, 1, 1,
-0.2748367, -0.2556851, -2.273368, 0, 0, 0, 1, 1,
-0.2731715, -0.2556905, -0.9859067, 0, 0, 0, 1, 1,
-0.2674973, 1.08856, 0.1090623, 0, 0, 0, 1, 1,
-0.2672187, 0.4097955, 0.3091784, 0, 0, 0, 1, 1,
-0.2582696, -1.346311, -2.655225, 0, 0, 0, 1, 1,
-0.2557501, -0.9716804, -2.350232, 0, 0, 0, 1, 1,
-0.2551769, -0.4864895, -2.543019, 0, 0, 0, 1, 1,
-0.2524771, -0.9839781, -4.384382, 1, 1, 1, 1, 1,
-0.2497658, 0.6539223, 0.09299421, 1, 1, 1, 1, 1,
-0.2474088, -0.7182856, -2.731343, 1, 1, 1, 1, 1,
-0.2387357, 0.8358734, -0.7413943, 1, 1, 1, 1, 1,
-0.2360625, -1.616652, -3.493638, 1, 1, 1, 1, 1,
-0.2355798, -0.6050816, -1.931467, 1, 1, 1, 1, 1,
-0.2355707, 2.00382, 0.1225446, 1, 1, 1, 1, 1,
-0.228276, -0.2376559, -3.958831, 1, 1, 1, 1, 1,
-0.228052, 0.9400749, -0.4167612, 1, 1, 1, 1, 1,
-0.222105, 1.124865, 1.149499, 1, 1, 1, 1, 1,
-0.2216661, 0.5100935, -0.6686188, 1, 1, 1, 1, 1,
-0.2208615, 0.07644928, -1.307017, 1, 1, 1, 1, 1,
-0.2174712, 0.9120239, 0.4379632, 1, 1, 1, 1, 1,
-0.2118204, 0.4447795, 1.288782, 1, 1, 1, 1, 1,
-0.2118076, 0.1202166, -0.7209049, 1, 1, 1, 1, 1,
-0.2103811, -0.4117267, -1.933834, 0, 0, 1, 1, 1,
-0.2087149, 1.014278, -0.9400672, 1, 0, 0, 1, 1,
-0.2075778, -0.6696475, -3.873476, 1, 0, 0, 1, 1,
-0.2071264, -1.25043, -3.986542, 1, 0, 0, 1, 1,
-0.2068502, -1.953069, -3.8046, 1, 0, 0, 1, 1,
-0.2045299, -1.142324, -2.201139, 1, 0, 0, 1, 1,
-0.2029677, 0.8667061, -0.5662175, 0, 0, 0, 1, 1,
-0.2026528, 0.07369325, -2.069731, 0, 0, 0, 1, 1,
-0.2011577, -2.000127, -3.252792, 0, 0, 0, 1, 1,
-0.1971652, -2.017029, -4.051659, 0, 0, 0, 1, 1,
-0.1960426, -0.3495943, -1.297861, 0, 0, 0, 1, 1,
-0.1945983, 0.5383776, -0.6863975, 0, 0, 0, 1, 1,
-0.1917786, 1.748602, 1.038363, 0, 0, 0, 1, 1,
-0.1912559, -0.2903055, -2.205439, 1, 1, 1, 1, 1,
-0.1864119, 0.1712277, -0.7223454, 1, 1, 1, 1, 1,
-0.1857911, -0.2046085, -3.49551, 1, 1, 1, 1, 1,
-0.1837923, 1.403172, -0.3770517, 1, 1, 1, 1, 1,
-0.1793392, 0.8083171, -0.0926271, 1, 1, 1, 1, 1,
-0.1760086, -0.1714447, 0.5849974, 1, 1, 1, 1, 1,
-0.1675362, -0.9264689, -3.627439, 1, 1, 1, 1, 1,
-0.1669655, -0.5682082, -1.57686, 1, 1, 1, 1, 1,
-0.1660808, -0.4964429, -4.527906, 1, 1, 1, 1, 1,
-0.1611826, 0.4233834, -1.307549, 1, 1, 1, 1, 1,
-0.1611216, 0.1418882, -0.4291652, 1, 1, 1, 1, 1,
-0.1598394, 3.384693, 0.4335675, 1, 1, 1, 1, 1,
-0.1579586, 0.2149602, -1.863726, 1, 1, 1, 1, 1,
-0.1569685, 0.02058717, 0.00186005, 1, 1, 1, 1, 1,
-0.1540321, 1.061965, 0.1213111, 1, 1, 1, 1, 1,
-0.1540172, -0.8789104, -3.009232, 0, 0, 1, 1, 1,
-0.1507738, 1.229616, -0.8533677, 1, 0, 0, 1, 1,
-0.1490474, 0.8148001, -0.9287008, 1, 0, 0, 1, 1,
-0.1482854, 0.1409484, 1.279941, 1, 0, 0, 1, 1,
-0.1481732, 0.2874864, 0.2550048, 1, 0, 0, 1, 1,
-0.1479157, -0.1663077, -3.17639, 1, 0, 0, 1, 1,
-0.1476969, -0.1216954, -2.060221, 0, 0, 0, 1, 1,
-0.1472435, 0.339251, 0.4733515, 0, 0, 0, 1, 1,
-0.1455957, -1.142208, -3.353953, 0, 0, 0, 1, 1,
-0.1448587, -0.3995538, -2.845032, 0, 0, 0, 1, 1,
-0.1447016, 1.865924, 0.9884226, 0, 0, 0, 1, 1,
-0.1434166, 0.2567556, -0.2491592, 0, 0, 0, 1, 1,
-0.1432973, -1.179971, -5.130426, 0, 0, 0, 1, 1,
-0.1431355, 0.1866769, -0.9985693, 1, 1, 1, 1, 1,
-0.1367418, -0.6920614, -6.162501, 1, 1, 1, 1, 1,
-0.1322733, -0.5296976, -3.291645, 1, 1, 1, 1, 1,
-0.1319226, 0.1856517, 0.4591994, 1, 1, 1, 1, 1,
-0.1293773, 0.6034412, -1.430654, 1, 1, 1, 1, 1,
-0.1267255, -1.576593, -2.195755, 1, 1, 1, 1, 1,
-0.124584, -1.608139, -3.170003, 1, 1, 1, 1, 1,
-0.1219489, -0.5635762, -1.222163, 1, 1, 1, 1, 1,
-0.1193053, -0.41582, -3.328934, 1, 1, 1, 1, 1,
-0.114349, -0.4949025, -2.636919, 1, 1, 1, 1, 1,
-0.1137588, 0.1657644, -1.032909, 1, 1, 1, 1, 1,
-0.1119899, -0.3739157, -1.989614, 1, 1, 1, 1, 1,
-0.1109775, 0.956018, 0.7351806, 1, 1, 1, 1, 1,
-0.1080739, -1.651962, -1.96822, 1, 1, 1, 1, 1,
-0.1051327, -1.484514, -3.598907, 1, 1, 1, 1, 1,
-0.1046601, 0.6284797, -1.989182, 0, 0, 1, 1, 1,
-0.09801424, -0.01367265, -2.347382, 1, 0, 0, 1, 1,
-0.09172103, 0.6342651, 0.4182137, 1, 0, 0, 1, 1,
-0.08834156, 0.2605652, -0.06083189, 1, 0, 0, 1, 1,
-0.08020964, -0.1126565, -2.150369, 1, 0, 0, 1, 1,
-0.07992589, -0.01702013, -2.674119, 1, 0, 0, 1, 1,
-0.079632, 1.427351, 2.262857, 0, 0, 0, 1, 1,
-0.07817411, 0.4279523, -0.2712694, 0, 0, 0, 1, 1,
-0.07158628, 0.1396455, 0.2382308, 0, 0, 0, 1, 1,
-0.06409067, 0.3244697, 0.04530163, 0, 0, 0, 1, 1,
-0.06023295, 0.132311, -0.01368422, 0, 0, 0, 1, 1,
-0.05754974, -0.0532131, -2.010185, 0, 0, 0, 1, 1,
-0.05730628, 0.3013981, -0.9241905, 0, 0, 0, 1, 1,
-0.0523408, -0.5405887, -2.125909, 1, 1, 1, 1, 1,
-0.05080892, -0.3747123, -5.727445, 1, 1, 1, 1, 1,
-0.05005271, 1.901861, 0.3700522, 1, 1, 1, 1, 1,
-0.04747522, -0.002418658, -1.731636, 1, 1, 1, 1, 1,
-0.04554996, 0.400019, -2.276779, 1, 1, 1, 1, 1,
-0.04416447, -0.8973911, -2.285305, 1, 1, 1, 1, 1,
-0.04091453, 0.9642787, 0.8495499, 1, 1, 1, 1, 1,
-0.03989605, 1.155991, -0.8113065, 1, 1, 1, 1, 1,
-0.03883442, 0.3722195, -0.5631074, 1, 1, 1, 1, 1,
-0.03379747, 0.1195498, -0.6254714, 1, 1, 1, 1, 1,
-0.03179937, -0.1041222, -3.291462, 1, 1, 1, 1, 1,
-0.03025024, 0.9938164, -0.08886584, 1, 1, 1, 1, 1,
-0.02452873, -1.424943, -2.949084, 1, 1, 1, 1, 1,
-0.02410853, 1.073255, 1.587712, 1, 1, 1, 1, 1,
-0.02329541, -0.8860385, -2.532703, 1, 1, 1, 1, 1,
-0.02296341, 1.141504, -3.814429, 0, 0, 1, 1, 1,
-0.02109687, 0.3857988, 1.297549, 1, 0, 0, 1, 1,
-0.02019886, -0.8600563, -3.039322, 1, 0, 0, 1, 1,
-0.02003318, 0.6424589, 0.359774, 1, 0, 0, 1, 1,
-0.01351888, -1.050311, -2.928257, 1, 0, 0, 1, 1,
-0.01324661, -0.1672465, -3.527589, 1, 0, 0, 1, 1,
-0.0121381, -0.8237804, -2.407656, 0, 0, 0, 1, 1,
-0.008922627, -0.7906876, -2.359625, 0, 0, 0, 1, 1,
-0.0001037005, 0.3857645, -0.5178123, 0, 0, 0, 1, 1,
0.001633758, 0.3701933, 0.7830817, 0, 0, 0, 1, 1,
0.002175024, 0.9492472, 0.05630111, 0, 0, 0, 1, 1,
0.003006857, -0.6916482, 2.610288, 0, 0, 0, 1, 1,
0.006350181, 0.6323222, -0.2410469, 0, 0, 0, 1, 1,
0.00931942, 0.7492044, 0.9864738, 1, 1, 1, 1, 1,
0.01000893, 0.02104577, -0.3135526, 1, 1, 1, 1, 1,
0.01061257, 0.8390395, -0.2196156, 1, 1, 1, 1, 1,
0.01164295, 0.638084, 0.2971259, 1, 1, 1, 1, 1,
0.0131662, -0.07922809, 3.417944, 1, 1, 1, 1, 1,
0.01372508, 0.6636201, 1.5272, 1, 1, 1, 1, 1,
0.01397854, -0.4923708, 2.976057, 1, 1, 1, 1, 1,
0.01544121, -0.5609611, 3.545737, 1, 1, 1, 1, 1,
0.01575192, 0.9759967, 1.062678, 1, 1, 1, 1, 1,
0.01644875, 0.634287, 0.02943457, 1, 1, 1, 1, 1,
0.01815275, -1.502306, 3.739922, 1, 1, 1, 1, 1,
0.01836988, 0.7022358, 0.7692932, 1, 1, 1, 1, 1,
0.02430161, 2.276076, -1.283413, 1, 1, 1, 1, 1,
0.02441123, 2.243798, -0.8749974, 1, 1, 1, 1, 1,
0.02556212, -1.338976, 3.267486, 1, 1, 1, 1, 1,
0.02786436, 0.5072128, 0.2773871, 0, 0, 1, 1, 1,
0.02838009, -0.3125484, 2.48732, 1, 0, 0, 1, 1,
0.02928316, 0.2268441, -1.081108, 1, 0, 0, 1, 1,
0.02941054, 0.2491197, -0.2772559, 1, 0, 0, 1, 1,
0.03090763, 1.285764, 0.4198264, 1, 0, 0, 1, 1,
0.03104085, 0.9474438, 0.5741783, 1, 0, 0, 1, 1,
0.03300586, 0.5031078, -0.3737612, 0, 0, 0, 1, 1,
0.03448847, 1.17691, -1.100144, 0, 0, 0, 1, 1,
0.03468278, 0.2864626, 0.04523425, 0, 0, 0, 1, 1,
0.03484648, -1.394002, 3.856352, 0, 0, 0, 1, 1,
0.0378437, -0.9104863, 1.969163, 0, 0, 0, 1, 1,
0.03872011, 0.9967476, 1.18867, 0, 0, 0, 1, 1,
0.04252985, 1.609986, 0.321266, 0, 0, 0, 1, 1,
0.04441165, -1.220279, 3.011362, 1, 1, 1, 1, 1,
0.04611959, 0.1668465, 2.068592, 1, 1, 1, 1, 1,
0.04940769, -0.5226119, 4.013524, 1, 1, 1, 1, 1,
0.04990287, -0.7057488, 2.230117, 1, 1, 1, 1, 1,
0.05231053, -0.683337, 3.489255, 1, 1, 1, 1, 1,
0.06008536, -0.8100821, 2.271495, 1, 1, 1, 1, 1,
0.06156433, 0.7189537, 0.2744004, 1, 1, 1, 1, 1,
0.062746, 1.390661, -1.372214, 1, 1, 1, 1, 1,
0.06428879, -2.015626, 1.588822, 1, 1, 1, 1, 1,
0.06559592, 0.6460969, 1.611248, 1, 1, 1, 1, 1,
0.06697969, -1.210309, 4.813978, 1, 1, 1, 1, 1,
0.06711295, -1.378168, 5.766844, 1, 1, 1, 1, 1,
0.07017639, -0.964313, 2.92289, 1, 1, 1, 1, 1,
0.07524642, -0.4283686, 3.629256, 1, 1, 1, 1, 1,
0.0791717, -0.4668763, 1.522673, 1, 1, 1, 1, 1,
0.08104545, -0.8843199, 1.575394, 0, 0, 1, 1, 1,
0.08677743, -1.386387, 1.495419, 1, 0, 0, 1, 1,
0.08697724, -0.4180294, 3.179878, 1, 0, 0, 1, 1,
0.08823427, -1.891774, 5.056052, 1, 0, 0, 1, 1,
0.09364206, 0.1709741, -0.5815579, 1, 0, 0, 1, 1,
0.09450335, -1.20519, 3.110342, 1, 0, 0, 1, 1,
0.09520791, -0.9034297, 2.165124, 0, 0, 0, 1, 1,
0.101613, -0.5195428, 4.017571, 0, 0, 0, 1, 1,
0.1022773, -0.3973056, 4.015465, 0, 0, 0, 1, 1,
0.1042513, -0.9963565, 2.55956, 0, 0, 0, 1, 1,
0.1076881, -0.5042512, 3.519347, 0, 0, 0, 1, 1,
0.1095209, -0.02239626, 1.941125, 0, 0, 0, 1, 1,
0.1135523, 0.7273842, 0.8862367, 0, 0, 0, 1, 1,
0.1140394, 1.420583, -0.4879448, 1, 1, 1, 1, 1,
0.114628, 1.516623, -0.4174277, 1, 1, 1, 1, 1,
0.117089, 1.315388, -1.641079, 1, 1, 1, 1, 1,
0.1191809, -0.342748, 1.949432, 1, 1, 1, 1, 1,
0.1239721, -0.1159455, 2.198148, 1, 1, 1, 1, 1,
0.1272511, -1.363353, 0.8065013, 1, 1, 1, 1, 1,
0.1279885, 0.2745135, 2.313832, 1, 1, 1, 1, 1,
0.1306695, 0.2154791, 0.376624, 1, 1, 1, 1, 1,
0.1350997, -1.047906, 3.558621, 1, 1, 1, 1, 1,
0.1366643, -0.2933252, 2.91177, 1, 1, 1, 1, 1,
0.138514, -0.8705476, 3.078251, 1, 1, 1, 1, 1,
0.1417594, 1.170404, -1.456643, 1, 1, 1, 1, 1,
0.1426108, 0.8251852, -0.5233999, 1, 1, 1, 1, 1,
0.1445293, -0.1993863, 3.511959, 1, 1, 1, 1, 1,
0.149459, 0.9726446, 0.7935911, 1, 1, 1, 1, 1,
0.1506192, -0.45904, 0.8011419, 0, 0, 1, 1, 1,
0.1509208, -1.539513, 3.781381, 1, 0, 0, 1, 1,
0.1516349, -0.2742404, 2.710148, 1, 0, 0, 1, 1,
0.1519989, -0.236744, 3.41065, 1, 0, 0, 1, 1,
0.1539464, -1.083185, 2.307076, 1, 0, 0, 1, 1,
0.155818, -0.2096523, 3.151713, 1, 0, 0, 1, 1,
0.1564663, 0.2709485, -0.6071232, 0, 0, 0, 1, 1,
0.1614866, -1.546927, 3.413492, 0, 0, 0, 1, 1,
0.164164, 0.6776144, 0.9005337, 0, 0, 0, 1, 1,
0.1642225, 0.7153851, 1.325553, 0, 0, 0, 1, 1,
0.1678345, -1.198565, 1.561665, 0, 0, 0, 1, 1,
0.1679935, 0.2717644, 0.06360976, 0, 0, 0, 1, 1,
0.1690488, -1.416859, 3.179978, 0, 0, 0, 1, 1,
0.1749719, -1.965959, 3.612143, 1, 1, 1, 1, 1,
0.1770113, -0.7627814, 2.791357, 1, 1, 1, 1, 1,
0.1877889, 0.2599775, -0.4557782, 1, 1, 1, 1, 1,
0.1900615, -0.4761922, 5.625604, 1, 1, 1, 1, 1,
0.1901741, -0.4644767, 1.698207, 1, 1, 1, 1, 1,
0.1912123, -0.2022533, 2.364039, 1, 1, 1, 1, 1,
0.1921672, -0.4348535, 2.303968, 1, 1, 1, 1, 1,
0.1979484, 0.1896797, 1.125631, 1, 1, 1, 1, 1,
0.1998187, 0.5416648, -0.5149035, 1, 1, 1, 1, 1,
0.2001058, 0.229379, -0.7817764, 1, 1, 1, 1, 1,
0.2010922, -0.8352271, 3.907481, 1, 1, 1, 1, 1,
0.2027628, -0.6032649, 1.603503, 1, 1, 1, 1, 1,
0.2070533, -0.8046483, 2.560328, 1, 1, 1, 1, 1,
0.2148378, 0.9200523, -0.6008646, 1, 1, 1, 1, 1,
0.2156356, 0.09330158, 3.175767, 1, 1, 1, 1, 1,
0.2174099, -0.1411738, 2.918648, 0, 0, 1, 1, 1,
0.2183957, 0.2362223, 2.038554, 1, 0, 0, 1, 1,
0.2215826, 1.460964, 1.594471, 1, 0, 0, 1, 1,
0.2230404, -1.194998, 3.881892, 1, 0, 0, 1, 1,
0.2241758, -1.747734, 4.343062, 1, 0, 0, 1, 1,
0.2244565, 1.501998, 1.857226, 1, 0, 0, 1, 1,
0.2254745, 1.651115, 1.593792, 0, 0, 0, 1, 1,
0.2258743, 0.7052783, -1.170149, 0, 0, 0, 1, 1,
0.2264252, -0.1508791, 0.9064381, 0, 0, 0, 1, 1,
0.2266112, -0.4445328, 5.284445, 0, 0, 0, 1, 1,
0.2272083, -0.3778318, 2.210087, 0, 0, 0, 1, 1,
0.2282798, 0.7043384, 1.08983, 0, 0, 0, 1, 1,
0.2294886, -1.063187, 2.910714, 0, 0, 0, 1, 1,
0.2299558, -0.1273242, 0.63451, 1, 1, 1, 1, 1,
0.2395918, -0.09753468, 1.751848, 1, 1, 1, 1, 1,
0.2413711, -0.732105, 0.8730472, 1, 1, 1, 1, 1,
0.2422532, -0.1149549, 2.61703, 1, 1, 1, 1, 1,
0.2524744, -0.9333576, 3.800757, 1, 1, 1, 1, 1,
0.254575, 0.05344708, 2.001738, 1, 1, 1, 1, 1,
0.2551545, -0.429435, 1.126335, 1, 1, 1, 1, 1,
0.2551674, -1.48881, 2.12137, 1, 1, 1, 1, 1,
0.2587047, 0.9299651, -0.2802706, 1, 1, 1, 1, 1,
0.2589684, 0.662012, -1.580584, 1, 1, 1, 1, 1,
0.2610188, -0.5944675, 2.043875, 1, 1, 1, 1, 1,
0.2614906, 0.9547775, -0.7919769, 1, 1, 1, 1, 1,
0.2682789, -1.706719, 1.348884, 1, 1, 1, 1, 1,
0.2710005, -0.8206722, 3.617794, 1, 1, 1, 1, 1,
0.2837437, 0.6076304, 0.02984584, 1, 1, 1, 1, 1,
0.2839499, -0.4485628, 2.063536, 0, 0, 1, 1, 1,
0.2841732, 0.2623586, 1.415366, 1, 0, 0, 1, 1,
0.2848564, -1.291368, 1.59674, 1, 0, 0, 1, 1,
0.2854684, -0.2712652, 2.612367, 1, 0, 0, 1, 1,
0.2875023, 0.574552, -0.8134038, 1, 0, 0, 1, 1,
0.2877589, -1.330248, 2.581234, 1, 0, 0, 1, 1,
0.2912271, 0.2677015, -0.3134044, 0, 0, 0, 1, 1,
0.2930129, 0.2034005, 1.294201, 0, 0, 0, 1, 1,
0.2947402, -0.9378778, 5.228425, 0, 0, 0, 1, 1,
0.3095683, -1.067517, 4.044205, 0, 0, 0, 1, 1,
0.3117658, 0.6885437, -0.02185491, 0, 0, 0, 1, 1,
0.3123335, -0.5155577, 2.700853, 0, 0, 0, 1, 1,
0.3134634, 0.4220767, -0.01548587, 0, 0, 0, 1, 1,
0.3136342, 1.147308, -0.9288425, 1, 1, 1, 1, 1,
0.3150231, 1.218152, -0.5908102, 1, 1, 1, 1, 1,
0.3208515, 1.487628, 2.430989, 1, 1, 1, 1, 1,
0.3211782, -1.133494, 2.878593, 1, 1, 1, 1, 1,
0.3248649, 0.6216258, -0.465515, 1, 1, 1, 1, 1,
0.3263282, -0.7891203, 1.454342, 1, 1, 1, 1, 1,
0.3344732, 0.07406431, 2.718759, 1, 1, 1, 1, 1,
0.3364535, -1.031792, 2.195276, 1, 1, 1, 1, 1,
0.3394746, -1.152526, 2.862653, 1, 1, 1, 1, 1,
0.34363, 1.214623, -0.1407013, 1, 1, 1, 1, 1,
0.3493023, 0.7124936, 0.5699409, 1, 1, 1, 1, 1,
0.3497658, -1.139886, 3.512535, 1, 1, 1, 1, 1,
0.3511448, 0.3631374, 1.06822, 1, 1, 1, 1, 1,
0.3531922, 0.006986684, 0.8475613, 1, 1, 1, 1, 1,
0.3599372, 2.008925, 0.3794616, 1, 1, 1, 1, 1,
0.3604189, 0.6335886, 0.5987281, 0, 0, 1, 1, 1,
0.3615861, -0.6258572, 1.055803, 1, 0, 0, 1, 1,
0.362072, -1.437334, 3.40427, 1, 0, 0, 1, 1,
0.3628835, -2.607826, 0.8675565, 1, 0, 0, 1, 1,
0.3636567, 0.9570909, 2.722162, 1, 0, 0, 1, 1,
0.3638249, -0.7068437, 3.178455, 1, 0, 0, 1, 1,
0.3645966, 0.03626013, -0.469256, 0, 0, 0, 1, 1,
0.3768319, 0.6610559, 2.367, 0, 0, 0, 1, 1,
0.3776457, 0.1109522, 0.05930319, 0, 0, 0, 1, 1,
0.3799974, 0.4386611, 2.185146, 0, 0, 0, 1, 1,
0.3803747, -1.05379, 2.59252, 0, 0, 0, 1, 1,
0.3815191, 0.3498589, -0.1600459, 0, 0, 0, 1, 1,
0.3842791, -0.0665239, 2.618565, 0, 0, 0, 1, 1,
0.3887901, 0.3399786, 1.078506, 1, 1, 1, 1, 1,
0.392283, -0.07720264, 2.14061, 1, 1, 1, 1, 1,
0.3940442, 2.79033, -0.08945348, 1, 1, 1, 1, 1,
0.3946197, 0.7264913, 1.919344, 1, 1, 1, 1, 1,
0.3957653, 0.7514067, 2.478987, 1, 1, 1, 1, 1,
0.3979415, 0.4677309, -0.3167371, 1, 1, 1, 1, 1,
0.400087, 3.365669, 1.202375, 1, 1, 1, 1, 1,
0.4045314, -0.3481096, 2.950825, 1, 1, 1, 1, 1,
0.4081123, 0.8352364, 0.7081291, 1, 1, 1, 1, 1,
0.4093533, -0.9775152, 2.145555, 1, 1, 1, 1, 1,
0.4100772, -1.543843, 2.474085, 1, 1, 1, 1, 1,
0.4134194, -0.1042905, 3.08231, 1, 1, 1, 1, 1,
0.416626, -0.4566375, 3.070155, 1, 1, 1, 1, 1,
0.4176107, 0.9559686, -0.263303, 1, 1, 1, 1, 1,
0.4183679, -0.4533218, 3.136065, 1, 1, 1, 1, 1,
0.4232817, 1.101586, 0.7220438, 0, 0, 1, 1, 1,
0.4253145, 0.5572671, -0.0004468894, 1, 0, 0, 1, 1,
0.4324373, 0.1970998, 1.52157, 1, 0, 0, 1, 1,
0.434098, -0.3820852, 2.221053, 1, 0, 0, 1, 1,
0.4441878, -0.2180399, 3.240508, 1, 0, 0, 1, 1,
0.4448996, -0.9061488, 2.837052, 1, 0, 0, 1, 1,
0.4493244, 0.7612455, 0.03471418, 0, 0, 0, 1, 1,
0.4525644, 1.855615, 0.952817, 0, 0, 0, 1, 1,
0.4578076, -0.2863856, 3.11581, 0, 0, 0, 1, 1,
0.4599078, 0.1191791, 2.581155, 0, 0, 0, 1, 1,
0.4603303, 0.1498048, 0.4420096, 0, 0, 0, 1, 1,
0.4639678, 0.9106541, 0.4085763, 0, 0, 0, 1, 1,
0.4660894, 0.06781241, 1.736989, 0, 0, 0, 1, 1,
0.4720883, -0.1460734, 3.394103, 1, 1, 1, 1, 1,
0.4756073, -2.397337, 4.412343, 1, 1, 1, 1, 1,
0.4774248, -0.06823363, 1.823422, 1, 1, 1, 1, 1,
0.4775988, -0.4527754, 2.251903, 1, 1, 1, 1, 1,
0.4816506, -0.340876, 3.016937, 1, 1, 1, 1, 1,
0.4821443, 0.139081, -0.02954547, 1, 1, 1, 1, 1,
0.4865632, 0.7362768, 1.94019, 1, 1, 1, 1, 1,
0.4891068, -0.09218755, 2.803796, 1, 1, 1, 1, 1,
0.4898399, 0.3258197, 0.9939305, 1, 1, 1, 1, 1,
0.4908869, 0.5508409, -0.6656597, 1, 1, 1, 1, 1,
0.4943258, -1.135925, 1.171331, 1, 1, 1, 1, 1,
0.4946814, 1.69467, -0.1362789, 1, 1, 1, 1, 1,
0.4978504, 0.5557189, 3.058937, 1, 1, 1, 1, 1,
0.5022671, 0.3890639, 0.7902289, 1, 1, 1, 1, 1,
0.5046243, 2.59292, -0.4496441, 1, 1, 1, 1, 1,
0.5048201, 2.018591, -0.2540235, 0, 0, 1, 1, 1,
0.5055532, 1.478651, -0.04078902, 1, 0, 0, 1, 1,
0.5118436, 1.473374, -0.8761844, 1, 0, 0, 1, 1,
0.5198144, 1.296492, 1.041841, 1, 0, 0, 1, 1,
0.5217389, 0.8869778, 0.7804543, 1, 0, 0, 1, 1,
0.5227262, 0.2123505, 1.321659, 1, 0, 0, 1, 1,
0.5278119, 0.8737683, 0.07654816, 0, 0, 0, 1, 1,
0.5308192, -1.324884, 2.294579, 0, 0, 0, 1, 1,
0.5319635, -0.7452163, 5.112562, 0, 0, 0, 1, 1,
0.534275, 1.482987, -0.003524591, 0, 0, 0, 1, 1,
0.5343218, -0.7709537, 2.847265, 0, 0, 0, 1, 1,
0.5354636, 0.06840113, 0.2695648, 0, 0, 0, 1, 1,
0.5382985, -1.471932, 4.316057, 0, 0, 0, 1, 1,
0.5396262, 1.761791, 0.6018126, 1, 1, 1, 1, 1,
0.5439788, -2.213255, 2.018142, 1, 1, 1, 1, 1,
0.5444687, -0.5169387, 1.873953, 1, 1, 1, 1, 1,
0.546516, 0.1999782, 1.480408, 1, 1, 1, 1, 1,
0.5486845, 1.91167, 0.1431658, 1, 1, 1, 1, 1,
0.5517336, -0.5339172, 3.446183, 1, 1, 1, 1, 1,
0.5517992, -0.3785678, 3.061627, 1, 1, 1, 1, 1,
0.5523111, 0.09786301, 0.5057296, 1, 1, 1, 1, 1,
0.5539716, -0.0005175092, 1.052347, 1, 1, 1, 1, 1,
0.559912, -0.04959699, 0.5262128, 1, 1, 1, 1, 1,
0.5643402, 0.6253322, 1.283947, 1, 1, 1, 1, 1,
0.5668849, 0.7663478, 0.6546832, 1, 1, 1, 1, 1,
0.5686548, 1.543963, -1.00318, 1, 1, 1, 1, 1,
0.5701784, -0.6695005, 3.100406, 1, 1, 1, 1, 1,
0.5762594, -2.080501, 0.8908584, 1, 1, 1, 1, 1,
0.5791603, 0.9374507, -0.5298133, 0, 0, 1, 1, 1,
0.5807437, -0.9404629, 0.7520003, 1, 0, 0, 1, 1,
0.5819867, 0.3705267, 1.38875, 1, 0, 0, 1, 1,
0.5860478, -0.1002889, 2.263911, 1, 0, 0, 1, 1,
0.5908495, -0.6567819, 2.994687, 1, 0, 0, 1, 1,
0.5927559, -0.1749626, 0.5703675, 1, 0, 0, 1, 1,
0.6023716, 1.760654, 0.2541358, 0, 0, 0, 1, 1,
0.610756, 1.599787, 0.3944593, 0, 0, 0, 1, 1,
0.6112742, -0.8467649, 2.842611, 0, 0, 0, 1, 1,
0.6131949, 1.433788, -1.327239, 0, 0, 0, 1, 1,
0.6132023, 0.849445, 0.7319385, 0, 0, 0, 1, 1,
0.6133618, -0.07865388, 0.9728044, 0, 0, 0, 1, 1,
0.6139828, 1.865446, -0.9384425, 0, 0, 0, 1, 1,
0.6147655, -0.1142228, 1.400781, 1, 1, 1, 1, 1,
0.6161509, -0.4112914, 0.5409167, 1, 1, 1, 1, 1,
0.6184642, 0.4103351, 1.732335, 1, 1, 1, 1, 1,
0.6209894, 1.966771, 0.5970185, 1, 1, 1, 1, 1,
0.6231596, -0.7578737, 4.96645, 1, 1, 1, 1, 1,
0.6347623, -1.225441, 1.956827, 1, 1, 1, 1, 1,
0.6385792, 0.22523, 1.219099, 1, 1, 1, 1, 1,
0.6415955, 0.7024705, 1.979226, 1, 1, 1, 1, 1,
0.6425509, 0.7220317, 0.4135192, 1, 1, 1, 1, 1,
0.6433276, 0.6353617, 1.863633, 1, 1, 1, 1, 1,
0.6463225, 0.5398467, 1.593625, 1, 1, 1, 1, 1,
0.654393, -0.3402597, 3.458316, 1, 1, 1, 1, 1,
0.668444, -0.6350409, 2.569107, 1, 1, 1, 1, 1,
0.6717387, 2.123941, -0.0258674, 1, 1, 1, 1, 1,
0.6720232, 0.6980761, 1.251811, 1, 1, 1, 1, 1,
0.6740062, -1.005425, 2.221199, 0, 0, 1, 1, 1,
0.6744797, -1.91685, 2.897216, 1, 0, 0, 1, 1,
0.6773286, 0.02506926, -0.2228695, 1, 0, 0, 1, 1,
0.6861627, -3.77635, 2.688429, 1, 0, 0, 1, 1,
0.6861842, 0.1897146, 1.112481, 1, 0, 0, 1, 1,
0.6881502, -0.8231766, 2.359509, 1, 0, 0, 1, 1,
0.6892561, 0.1355727, 1.265583, 0, 0, 0, 1, 1,
0.692213, -0.6038285, 0.3756486, 0, 0, 0, 1, 1,
0.6961569, 0.563359, 0.3061871, 0, 0, 0, 1, 1,
0.7037567, 0.33346, 0.1058494, 0, 0, 0, 1, 1,
0.7063008, 1.069318, -0.9923132, 0, 0, 0, 1, 1,
0.7110831, -2.056922, 1.59721, 0, 0, 0, 1, 1,
0.7119938, -1.59101, 4.199526, 0, 0, 0, 1, 1,
0.7265158, 0.3594698, 0.4102227, 1, 1, 1, 1, 1,
0.7294475, -0.5857349, 4.250543, 1, 1, 1, 1, 1,
0.7315167, 2.136645, 0.6192942, 1, 1, 1, 1, 1,
0.7446122, -0.3939071, 3.003579, 1, 1, 1, 1, 1,
0.7454957, 0.1962894, 0.1693919, 1, 1, 1, 1, 1,
0.7473715, 0.421696, 2.08818, 1, 1, 1, 1, 1,
0.7483799, 0.6859246, 0.855021, 1, 1, 1, 1, 1,
0.749242, -1.619188, 3.059167, 1, 1, 1, 1, 1,
0.755478, 1.102071, 0.9077871, 1, 1, 1, 1, 1,
0.7675392, 1.318817, 0.601009, 1, 1, 1, 1, 1,
0.7705497, -0.3580299, 1.479514, 1, 1, 1, 1, 1,
0.7720215, 0.3779946, 1.196492, 1, 1, 1, 1, 1,
0.7745629, -2.178586, 3.340003, 1, 1, 1, 1, 1,
0.774747, -0.8062071, 2.494591, 1, 1, 1, 1, 1,
0.7758687, -0.9180371, 1.780821, 1, 1, 1, 1, 1,
0.7824928, -0.2916151, 0.5452674, 0, 0, 1, 1, 1,
0.7896147, 0.1493832, 2.529863, 1, 0, 0, 1, 1,
0.7914443, 0.4557443, 1.259559, 1, 0, 0, 1, 1,
0.7969883, -0.8828604, 2.405765, 1, 0, 0, 1, 1,
0.7994496, 0.9171014, 1.610093, 1, 0, 0, 1, 1,
0.799818, 1.034693, -0.2658571, 1, 0, 0, 1, 1,
0.8041729, 0.847633, -0.589195, 0, 0, 0, 1, 1,
0.8056845, 0.844034, 1.269011, 0, 0, 0, 1, 1,
0.8074149, -0.003817647, 1.146909, 0, 0, 0, 1, 1,
0.8093796, 1.270663, 0.06746207, 0, 0, 0, 1, 1,
0.8148791, 1.96403, -1.49996, 0, 0, 0, 1, 1,
0.8162795, -1.459564, 4.780368, 0, 0, 0, 1, 1,
0.8213785, -0.4688945, 3.641411, 0, 0, 0, 1, 1,
0.8225118, -0.5586951, 2.062361, 1, 1, 1, 1, 1,
0.8243676, -0.7435537, 1.609154, 1, 1, 1, 1, 1,
0.8251004, -1.190945, 4.091184, 1, 1, 1, 1, 1,
0.8287961, 1.333405, 0.6893027, 1, 1, 1, 1, 1,
0.8288829, 0.8858197, 1.455264, 1, 1, 1, 1, 1,
0.8298106, -1.067583, 1.50984, 1, 1, 1, 1, 1,
0.8299201, 0.8693963, 1.398186, 1, 1, 1, 1, 1,
0.8334613, -0.3408024, 2.47489, 1, 1, 1, 1, 1,
0.8390195, -0.6828232, 1.763171, 1, 1, 1, 1, 1,
0.8481054, 0.2021919, -0.4933205, 1, 1, 1, 1, 1,
0.8493131, -0.8775972, 2.177233, 1, 1, 1, 1, 1,
0.8509055, 0.8016263, 1.636191, 1, 1, 1, 1, 1,
0.853472, -0.7282713, 3.06989, 1, 1, 1, 1, 1,
0.8548231, 1.061136, 0.4269996, 1, 1, 1, 1, 1,
0.8559926, 1.438474, 1.470152, 1, 1, 1, 1, 1,
0.8562618, 0.9948865, -0.8749233, 0, 0, 1, 1, 1,
0.8612021, 1.329214, -0.2773777, 1, 0, 0, 1, 1,
0.8620602, 0.2250485, 1.665494, 1, 0, 0, 1, 1,
0.8650116, 0.1576505, 1.78471, 1, 0, 0, 1, 1,
0.8729572, -0.8581005, 2.111073, 1, 0, 0, 1, 1,
0.8741349, 0.224581, -0.03437111, 1, 0, 0, 1, 1,
0.8768935, 0.1052527, 2.240312, 0, 0, 0, 1, 1,
0.8810723, 0.3412743, 0.3515305, 0, 0, 0, 1, 1,
0.8879221, 0.08250291, 0.6076292, 0, 0, 0, 1, 1,
0.8896762, 0.8411533, 1.634831, 0, 0, 0, 1, 1,
0.9018804, -0.6202981, 0.305699, 0, 0, 0, 1, 1,
0.9077853, -0.7009551, 0.9629305, 0, 0, 0, 1, 1,
0.9162338, 0.7110762, 1.051484, 0, 0, 0, 1, 1,
0.9177193, 0.07548314, 0.7554225, 1, 1, 1, 1, 1,
0.9193984, -0.2278318, 2.054648, 1, 1, 1, 1, 1,
0.9296005, -0.01313471, 3.248872, 1, 1, 1, 1, 1,
0.9305888, -0.1868991, 3.262649, 1, 1, 1, 1, 1,
0.9320422, -1.397238, 2.510722, 1, 1, 1, 1, 1,
0.9320905, 0.8611772, 1.668481, 1, 1, 1, 1, 1,
0.93934, -0.7808411, 3.193417, 1, 1, 1, 1, 1,
0.9436514, -2.379886, 4.474522, 1, 1, 1, 1, 1,
0.9437442, -0.07538968, 1.066171, 1, 1, 1, 1, 1,
0.94553, -0.8523597, 3.659069, 1, 1, 1, 1, 1,
0.9469973, -1.532285, 1.254869, 1, 1, 1, 1, 1,
0.9509463, -0.9485269, 1.931147, 1, 1, 1, 1, 1,
0.9539035, 0.09036102, 1.424696, 1, 1, 1, 1, 1,
0.9551447, -0.6479332, 2.878836, 1, 1, 1, 1, 1,
0.9551644, 1.154466, 0.1173608, 1, 1, 1, 1, 1,
0.9626337, 0.3581362, 1.608429, 0, 0, 1, 1, 1,
0.9666317, -0.8554194, 3.340951, 1, 0, 0, 1, 1,
0.9682972, 0.4423057, 0.6196182, 1, 0, 0, 1, 1,
0.9717271, -0.1408152, 2.012323, 1, 0, 0, 1, 1,
0.972382, -1.888659, 2.521787, 1, 0, 0, 1, 1,
0.9756815, 1.584723, -1.667732, 1, 0, 0, 1, 1,
0.9761092, 0.6811003, 2.296557, 0, 0, 0, 1, 1,
0.9809895, -0.1076578, 2.421543, 0, 0, 0, 1, 1,
0.9836203, -1.874529, 2.322844, 0, 0, 0, 1, 1,
0.9893005, -0.1616786, 3.292407, 0, 0, 0, 1, 1,
0.9912733, -0.4861118, 2.75145, 0, 0, 0, 1, 1,
0.9971059, -0.540986, 1.167282, 0, 0, 0, 1, 1,
0.9980556, 1.496243, 0.395028, 0, 0, 0, 1, 1,
1.005672, -0.2105381, 0.1275331, 1, 1, 1, 1, 1,
1.010985, 1.414493, -1.569484, 1, 1, 1, 1, 1,
1.014779, -0.8807148, 3.895139, 1, 1, 1, 1, 1,
1.031096, -0.7095415, 1.199302, 1, 1, 1, 1, 1,
1.032395, 0.7295559, 2.026557, 1, 1, 1, 1, 1,
1.03424, -0.2413497, 2.435785, 1, 1, 1, 1, 1,
1.041154, 0.7125444, 2.893026, 1, 1, 1, 1, 1,
1.042694, -0.8180733, 3.149955, 1, 1, 1, 1, 1,
1.044026, 0.2027624, 1.963292, 1, 1, 1, 1, 1,
1.045134, -0.3582319, 1.093508, 1, 1, 1, 1, 1,
1.045247, 0.3230142, 0.8628083, 1, 1, 1, 1, 1,
1.047825, 0.4370225, 1.452762, 1, 1, 1, 1, 1,
1.053158, 1.558809, 1.204578, 1, 1, 1, 1, 1,
1.056881, -0.7716399, 1.581392, 1, 1, 1, 1, 1,
1.069537, -0.986724, 3.009321, 1, 1, 1, 1, 1,
1.079501, -0.7425485, 1.666162, 0, 0, 1, 1, 1,
1.08061, 1.475373, 0.3365528, 1, 0, 0, 1, 1,
1.082702, -0.104386, 1.578246, 1, 0, 0, 1, 1,
1.084261, -0.05447414, 2.093475, 1, 0, 0, 1, 1,
1.089687, -1.162911, 2.655681, 1, 0, 0, 1, 1,
1.091488, 1.370952, 0.4563711, 1, 0, 0, 1, 1,
1.09359, -0.267849, 2.474962, 0, 0, 0, 1, 1,
1.096765, -0.04392032, 1.235922, 0, 0, 0, 1, 1,
1.098678, -0.5638564, 1.78287, 0, 0, 0, 1, 1,
1.107027, -1.428783, 3.113911, 0, 0, 0, 1, 1,
1.12624, 1.910161, 0.6602573, 0, 0, 0, 1, 1,
1.126372, -0.0324108, 2.358722, 0, 0, 0, 1, 1,
1.135962, -1.222447, 0.7913966, 0, 0, 0, 1, 1,
1.137175, 0.246912, 0.8662333, 1, 1, 1, 1, 1,
1.142259, -0.2600875, 1.976706, 1, 1, 1, 1, 1,
1.143904, -0.6443617, 2.331438, 1, 1, 1, 1, 1,
1.155444, 0.4542365, 0.4094184, 1, 1, 1, 1, 1,
1.157171, 0.7542701, -0.1509183, 1, 1, 1, 1, 1,
1.157865, 1.56271, 1.791228, 1, 1, 1, 1, 1,
1.158124, -1.938593, 1.338931, 1, 1, 1, 1, 1,
1.162883, -1.331292, 4.322138, 1, 1, 1, 1, 1,
1.166275, 0.6127744, 0.3127231, 1, 1, 1, 1, 1,
1.172243, -0.7445834, 1.699264, 1, 1, 1, 1, 1,
1.178264, 0.1078788, 0.8329037, 1, 1, 1, 1, 1,
1.184084, -1.916293, 2.9809, 1, 1, 1, 1, 1,
1.186997, -0.6672968, 1.041577, 1, 1, 1, 1, 1,
1.203023, 0.5275846, 1.429054, 1, 1, 1, 1, 1,
1.20522, -0.8010334, 1.330358, 1, 1, 1, 1, 1,
1.208201, -1.478165, 1.438977, 0, 0, 1, 1, 1,
1.208421, 1.957993, 2.007765, 1, 0, 0, 1, 1,
1.211921, 1.579473, 0.8686202, 1, 0, 0, 1, 1,
1.212317, 1.410868, -0.0573907, 1, 0, 0, 1, 1,
1.215264, -0.7830133, 1.786092, 1, 0, 0, 1, 1,
1.217479, -0.5781916, 1.535518, 1, 0, 0, 1, 1,
1.218559, 0.3723216, 1.364882, 0, 0, 0, 1, 1,
1.255348, -0.3493427, 2.240265, 0, 0, 0, 1, 1,
1.258561, 1.50765, 1.634397, 0, 0, 0, 1, 1,
1.271422, 2.009962, -1.88177, 0, 0, 0, 1, 1,
1.272778, 0.05792213, 1.994405, 0, 0, 0, 1, 1,
1.277306, -0.7778809, 1.818936, 0, 0, 0, 1, 1,
1.279078, 0.7364325, 1.154315, 0, 0, 0, 1, 1,
1.288259, -1.410092, 1.428957, 1, 1, 1, 1, 1,
1.288335, 0.5987731, 1.901146, 1, 1, 1, 1, 1,
1.299297, -0.4989515, 0.9839766, 1, 1, 1, 1, 1,
1.311066, -1.574117, 3.137265, 1, 1, 1, 1, 1,
1.311094, 0.5902085, 0.2970563, 1, 1, 1, 1, 1,
1.323907, -0.3426485, 2.880598, 1, 1, 1, 1, 1,
1.33276, 1.169243, 0.1996396, 1, 1, 1, 1, 1,
1.341243, 1.086344, -0.3109075, 1, 1, 1, 1, 1,
1.342357, 1.87681, 0.7762412, 1, 1, 1, 1, 1,
1.346433, 0.9089601, 1.035908, 1, 1, 1, 1, 1,
1.348422, 0.2515894, 0.3120977, 1, 1, 1, 1, 1,
1.349151, 2.054112, 1.003621, 1, 1, 1, 1, 1,
1.349312, -0.7010046, 4.138614, 1, 1, 1, 1, 1,
1.350224, 0.3655464, 0.9770654, 1, 1, 1, 1, 1,
1.36997, -0.1044415, 0.209453, 1, 1, 1, 1, 1,
1.395009, -0.8713849, 2.898449, 0, 0, 1, 1, 1,
1.407073, -0.1682568, 3.532854, 1, 0, 0, 1, 1,
1.414248, -1.071512, 1.943226, 1, 0, 0, 1, 1,
1.423136, -1.268646, 1.08349, 1, 0, 0, 1, 1,
1.437825, 1.183763, 0.5030078, 1, 0, 0, 1, 1,
1.444696, -1.951723, 0.8345387, 1, 0, 0, 1, 1,
1.445332, -0.6900726, 0.7264968, 0, 0, 0, 1, 1,
1.445397, 1.427341, -0.06192987, 0, 0, 0, 1, 1,
1.455549, -0.782254, 1.384645, 0, 0, 0, 1, 1,
1.45634, -0.3760375, 1.444999, 0, 0, 0, 1, 1,
1.459284, 0.2655896, 2.224878, 0, 0, 0, 1, 1,
1.460539, -1.418107, 2.262007, 0, 0, 0, 1, 1,
1.491123, -0.2514825, 2.088098, 0, 0, 0, 1, 1,
1.4918, -0.6195929, 1.519769, 1, 1, 1, 1, 1,
1.49211, 0.4164994, 2.767447, 1, 1, 1, 1, 1,
1.494426, 1.416584, 1.215395, 1, 1, 1, 1, 1,
1.495693, 1.759007, -0.8473914, 1, 1, 1, 1, 1,
1.508533, -0.5044122, 3.365931, 1, 1, 1, 1, 1,
1.514074, -1.641184, 3.289567, 1, 1, 1, 1, 1,
1.521552, -0.5920051, 1.67739, 1, 1, 1, 1, 1,
1.526563, 1.582535, 1.379734, 1, 1, 1, 1, 1,
1.533605, 0.7049203, 2.293191, 1, 1, 1, 1, 1,
1.536833, -0.3240963, 1.758199, 1, 1, 1, 1, 1,
1.544089, 0.1135935, 1.399593, 1, 1, 1, 1, 1,
1.55038, 0.9533776, 1.297353, 1, 1, 1, 1, 1,
1.550702, -0.7151865, 2.239715, 1, 1, 1, 1, 1,
1.559779, 0.2834081, 2.476548, 1, 1, 1, 1, 1,
1.565611, -0.02377525, 0.4800008, 1, 1, 1, 1, 1,
1.572478, 0.3530039, 1.263152, 0, 0, 1, 1, 1,
1.57758, 0.04818589, 3.100262, 1, 0, 0, 1, 1,
1.598389, -1.569692, 3.909051, 1, 0, 0, 1, 1,
1.613635, 1.013243, -0.04221974, 1, 0, 0, 1, 1,
1.634203, -0.08477154, 3.245443, 1, 0, 0, 1, 1,
1.654768, 0.5225089, 0.2668316, 1, 0, 0, 1, 1,
1.664771, -0.4969788, 2.179335, 0, 0, 0, 1, 1,
1.667326, 0.4054691, 0.7366525, 0, 0, 0, 1, 1,
1.670691, 0.349443, 1.311187, 0, 0, 0, 1, 1,
1.671631, 1.394794, 0.7219605, 0, 0, 0, 1, 1,
1.671858, 1.461517, 4.259561, 0, 0, 0, 1, 1,
1.67557, -0.6734523, 3.337251, 0, 0, 0, 1, 1,
1.68265, -1.274503, 2.186944, 0, 0, 0, 1, 1,
1.689997, -0.9307112, 3.573182, 1, 1, 1, 1, 1,
1.706419, 1.247293, 1.386261, 1, 1, 1, 1, 1,
1.719854, 0.5513579, 1.535504, 1, 1, 1, 1, 1,
1.741885, 1.233757, 2.260576, 1, 1, 1, 1, 1,
1.784601, 0.7516515, 0.003704153, 1, 1, 1, 1, 1,
1.821081, -0.108507, 1.834386, 1, 1, 1, 1, 1,
1.84711, 1.504306, 0.1364756, 1, 1, 1, 1, 1,
1.858484, -0.3588335, 1.096524, 1, 1, 1, 1, 1,
1.866951, 0.648203, 1.31568, 1, 1, 1, 1, 1,
1.871252, -1.699527, 1.52548, 1, 1, 1, 1, 1,
1.874804, 0.5758697, 1.261805, 1, 1, 1, 1, 1,
1.896987, -0.09479315, 0.6344816, 1, 1, 1, 1, 1,
1.901678, 1.597615, 1.537356, 1, 1, 1, 1, 1,
1.906694, 0.7380229, 0.6042962, 1, 1, 1, 1, 1,
2.083244, 2.228156, 1.020188, 1, 1, 1, 1, 1,
2.094732, 1.308147, 0.4847521, 0, 0, 1, 1, 1,
2.143645, -0.2411442, 0.7116406, 1, 0, 0, 1, 1,
2.206475, 0.9543796, 1.732444, 1, 0, 0, 1, 1,
2.215564, -1.065259, 2.720526, 1, 0, 0, 1, 1,
2.23568, 1.393703, -0.7546137, 1, 0, 0, 1, 1,
2.236356, 0.2021897, 0.6097449, 1, 0, 0, 1, 1,
2.273867, 0.4071889, 3.036784, 0, 0, 0, 1, 1,
2.29209, -0.9038503, 2.107918, 0, 0, 0, 1, 1,
2.386474, 2.019167, 0.5359297, 0, 0, 0, 1, 1,
2.406926, 0.1564897, 4.072816, 0, 0, 0, 1, 1,
2.407058, -0.03600292, 0.3687428, 0, 0, 0, 1, 1,
2.424795, -0.4845199, 2.583065, 0, 0, 0, 1, 1,
2.447064, 1.20482, 1.299309, 0, 0, 0, 1, 1,
2.52386, -0.6245565, 1.929432, 1, 1, 1, 1, 1,
2.540911, 0.3592148, 0.5633841, 1, 1, 1, 1, 1,
2.554708, 0.06576569, 1.422394, 1, 1, 1, 1, 1,
2.6273, -0.5864832, -0.9446366, 1, 1, 1, 1, 1,
2.65383, 1.090677, 1.747228, 1, 1, 1, 1, 1,
2.682254, -0.6119204, 1.452898, 1, 1, 1, 1, 1,
3.16569, 0.6459836, 0.4362135, 1, 1, 1, 1, 1
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
var radius = 10.30398;
var distance = 36.1923;
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
mvMatrix.translate( 0.02217817, 0.1179638, 0.1978285 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.1923);
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
