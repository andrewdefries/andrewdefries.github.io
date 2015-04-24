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
-3.449136, 0.9087356, -0.8691013, 1, 0, 0, 1,
-3.369434, -0.8111066, -0.1359626, 1, 0.007843138, 0, 1,
-3.351778, -0.3368884, -0.5344496, 1, 0.01176471, 0, 1,
-2.728419, -0.2443954, -0.3450185, 1, 0.01960784, 0, 1,
-2.557976, 0.3866832, -1.908162, 1, 0.02352941, 0, 1,
-2.494329, 0.9168481, -3.580547, 1, 0.03137255, 0, 1,
-2.487813, 0.7600564, -0.3690903, 1, 0.03529412, 0, 1,
-2.417069, -0.7369834, -1.425927, 1, 0.04313726, 0, 1,
-2.382489, 1.097887, -2.196519, 1, 0.04705882, 0, 1,
-2.348851, -1.548227, -4.241155, 1, 0.05490196, 0, 1,
-2.328457, -0.02414812, -1.674894, 1, 0.05882353, 0, 1,
-2.30149, 0.4102229, -1.576717, 1, 0.06666667, 0, 1,
-2.252031, -0.3739106, -1.803694, 1, 0.07058824, 0, 1,
-2.251826, -0.6866712, -3.022601, 1, 0.07843138, 0, 1,
-2.246548, -0.4218174, -3.077311, 1, 0.08235294, 0, 1,
-2.239121, -0.8086807, -2.179894, 1, 0.09019608, 0, 1,
-2.16377, 0.2829701, -0.3768136, 1, 0.09411765, 0, 1,
-2.130814, 0.2177526, -2.395865, 1, 0.1019608, 0, 1,
-2.125323, -0.6907145, -1.230528, 1, 0.1098039, 0, 1,
-2.120195, -0.004955882, -2.145212, 1, 0.1137255, 0, 1,
-2.081332, 0.2190071, -1.499485, 1, 0.1215686, 0, 1,
-2.069648, -0.7015111, -2.97375, 1, 0.1254902, 0, 1,
-2.065077, 0.2620663, -1.23517, 1, 0.1333333, 0, 1,
-2.034682, -0.08437262, -1.194037, 1, 0.1372549, 0, 1,
-2.02986, -0.1727006, -2.513558, 1, 0.145098, 0, 1,
-2.029859, -0.08597613, -2.041507, 1, 0.1490196, 0, 1,
-2.008116, -1.471443, -3.087895, 1, 0.1568628, 0, 1,
-1.996871, 0.254261, -1.93385, 1, 0.1607843, 0, 1,
-1.992861, -0.3390293, -2.344566, 1, 0.1686275, 0, 1,
-1.975299, 0.351007, -0.4247494, 1, 0.172549, 0, 1,
-1.939649, -1.250528, -3.264071, 1, 0.1803922, 0, 1,
-1.914277, -0.9218499, -2.274528, 1, 0.1843137, 0, 1,
-1.90568, 1.151491, -0.05901483, 1, 0.1921569, 0, 1,
-1.899873, -0.280788, -1.878333, 1, 0.1960784, 0, 1,
-1.896523, -0.2013684, 0.130223, 1, 0.2039216, 0, 1,
-1.88986, -0.4608446, -3.183078, 1, 0.2117647, 0, 1,
-1.880949, -0.06710534, -1.415603, 1, 0.2156863, 0, 1,
-1.872326, 0.07220531, -1.345014, 1, 0.2235294, 0, 1,
-1.869792, 1.383655, -1.641214, 1, 0.227451, 0, 1,
-1.869504, 0.6334045, -1.67119, 1, 0.2352941, 0, 1,
-1.860471, -0.8299873, -1.469247, 1, 0.2392157, 0, 1,
-1.852166, 0.08747754, -1.3783, 1, 0.2470588, 0, 1,
-1.827037, 0.5734769, -0.6095577, 1, 0.2509804, 0, 1,
-1.819293, 1.421729, -1.653665, 1, 0.2588235, 0, 1,
-1.816868, -1.898514, -3.256057, 1, 0.2627451, 0, 1,
-1.80541, 0.6744975, 0.3047927, 1, 0.2705882, 0, 1,
-1.796658, -0.5334492, -0.4211043, 1, 0.2745098, 0, 1,
-1.768311, 0.9225577, 0.1349089, 1, 0.282353, 0, 1,
-1.753212, 0.6923993, -0.439505, 1, 0.2862745, 0, 1,
-1.747792, 0.7701708, -0.4890494, 1, 0.2941177, 0, 1,
-1.741386, -0.5380563, -0.8502015, 1, 0.3019608, 0, 1,
-1.740859, -0.2532015, -3.296477, 1, 0.3058824, 0, 1,
-1.727319, 1.004548, -1.475262, 1, 0.3137255, 0, 1,
-1.717963, 0.2302722, -1.523091, 1, 0.3176471, 0, 1,
-1.694368, 0.739947, -1.894272, 1, 0.3254902, 0, 1,
-1.679047, 1.283389, -0.292503, 1, 0.3294118, 0, 1,
-1.67471, 1.13379, -1.195477, 1, 0.3372549, 0, 1,
-1.652754, -1.500273, -3.326452, 1, 0.3411765, 0, 1,
-1.65008, 0.6733513, -1.772985, 1, 0.3490196, 0, 1,
-1.634622, 0.8470921, -2.543672, 1, 0.3529412, 0, 1,
-1.629465, -1.536611, -1.867327, 1, 0.3607843, 0, 1,
-1.628774, -0.4902118, -0.654865, 1, 0.3647059, 0, 1,
-1.623093, 0.4320317, -3.372341, 1, 0.372549, 0, 1,
-1.619551, 0.7701645, -1.988442, 1, 0.3764706, 0, 1,
-1.607334, -0.216482, -3.595549, 1, 0.3843137, 0, 1,
-1.604437, -0.1180282, -3.623337, 1, 0.3882353, 0, 1,
-1.601284, 0.9741149, -0.6528709, 1, 0.3960784, 0, 1,
-1.587899, 0.6502559, -0.07079495, 1, 0.4039216, 0, 1,
-1.567072, 1.578403, 0.06780103, 1, 0.4078431, 0, 1,
-1.560618, -0.6221529, -3.328256, 1, 0.4156863, 0, 1,
-1.558969, 1.272417, -0.6133339, 1, 0.4196078, 0, 1,
-1.554476, 1.490781, 1.672028, 1, 0.427451, 0, 1,
-1.546932, 0.955135, -2.227004, 1, 0.4313726, 0, 1,
-1.54403, 0.1591572, -3.209414, 1, 0.4392157, 0, 1,
-1.543878, 1.919268, -0.1535794, 1, 0.4431373, 0, 1,
-1.530732, 2.384171, -2.393996, 1, 0.4509804, 0, 1,
-1.526224, -1.470082, -1.089294, 1, 0.454902, 0, 1,
-1.515671, 1.587608, -0.3592259, 1, 0.4627451, 0, 1,
-1.498248, -2.062838, -3.096237, 1, 0.4666667, 0, 1,
-1.489947, -0.4657837, -2.390854, 1, 0.4745098, 0, 1,
-1.479392, -0.2151427, -0.4963468, 1, 0.4784314, 0, 1,
-1.473523, 1.955199, -1.784681, 1, 0.4862745, 0, 1,
-1.465978, -0.7845293, -2.518598, 1, 0.4901961, 0, 1,
-1.460117, -0.9242015, -3.076707, 1, 0.4980392, 0, 1,
-1.429719, 1.656549, -1.496333, 1, 0.5058824, 0, 1,
-1.427028, -0.234165, -2.148738, 1, 0.509804, 0, 1,
-1.416904, -1.297714, -3.619754, 1, 0.5176471, 0, 1,
-1.408549, 0.6183408, -0.5712339, 1, 0.5215687, 0, 1,
-1.401179, -0.3445964, 0.7410985, 1, 0.5294118, 0, 1,
-1.385981, 0.3669825, -2.194427, 1, 0.5333334, 0, 1,
-1.359632, -0.11728, -2.779571, 1, 0.5411765, 0, 1,
-1.346652, 0.7404487, -1.434311, 1, 0.5450981, 0, 1,
-1.332336, -1.197751, -1.601883, 1, 0.5529412, 0, 1,
-1.32658, 1.838454, -0.1510755, 1, 0.5568628, 0, 1,
-1.322982, -0.5581971, -0.5624012, 1, 0.5647059, 0, 1,
-1.317147, 0.2075479, -1.782453, 1, 0.5686275, 0, 1,
-1.31288, 2.251538, -0.2308154, 1, 0.5764706, 0, 1,
-1.307603, 0.1648626, -1.387248, 1, 0.5803922, 0, 1,
-1.304128, -1.1775, -0.5395413, 1, 0.5882353, 0, 1,
-1.3006, 1.305905, -2.49243, 1, 0.5921569, 0, 1,
-1.291197, -0.006327659, -1.66692, 1, 0.6, 0, 1,
-1.285104, -0.6805789, -2.67291, 1, 0.6078432, 0, 1,
-1.283932, -0.5668887, -1.957521, 1, 0.6117647, 0, 1,
-1.277309, -0.6726311, -3.338278, 1, 0.6196079, 0, 1,
-1.270876, -1.170151, -1.800933, 1, 0.6235294, 0, 1,
-1.261516, 1.234092, -0.5971661, 1, 0.6313726, 0, 1,
-1.255586, 0.9638879, -0.573441, 1, 0.6352941, 0, 1,
-1.254404, -0.2685398, -1.774331, 1, 0.6431373, 0, 1,
-1.246018, -0.02217012, 1.214201, 1, 0.6470588, 0, 1,
-1.237829, -1.397909, -2.884055, 1, 0.654902, 0, 1,
-1.236951, 0.2026527, -1.528648, 1, 0.6588235, 0, 1,
-1.221154, -1.91421, -1.741864, 1, 0.6666667, 0, 1,
-1.217729, -0.04858982, -2.323669, 1, 0.6705883, 0, 1,
-1.214511, -0.5553665, -2.180637, 1, 0.6784314, 0, 1,
-1.210501, -0.852871, -2.162987, 1, 0.682353, 0, 1,
-1.210387, 0.8987398, -0.07688533, 1, 0.6901961, 0, 1,
-1.209578, -0.212664, -2.005773, 1, 0.6941177, 0, 1,
-1.209409, -0.7616853, -3.185198, 1, 0.7019608, 0, 1,
-1.20829, 2.23734, 0.8623441, 1, 0.7098039, 0, 1,
-1.206559, -0.198576, -2.338656, 1, 0.7137255, 0, 1,
-1.205964, 0.01854987, -1.076869, 1, 0.7215686, 0, 1,
-1.193678, -0.07042077, -0.6256396, 1, 0.7254902, 0, 1,
-1.182455, -0.02303621, -0.6040741, 1, 0.7333333, 0, 1,
-1.169091, 0.3905716, 0.6115406, 1, 0.7372549, 0, 1,
-1.165491, -1.335005, -2.544007, 1, 0.7450981, 0, 1,
-1.159481, -0.8036808, -3.297812, 1, 0.7490196, 0, 1,
-1.159208, -0.5722455, -2.157135, 1, 0.7568628, 0, 1,
-1.153242, 0.9087949, -1.251832, 1, 0.7607843, 0, 1,
-1.145449, 0.08070981, -0.9330647, 1, 0.7686275, 0, 1,
-1.14033, 1.265886, -0.06124011, 1, 0.772549, 0, 1,
-1.13245, -1.127488, -2.586648, 1, 0.7803922, 0, 1,
-1.131848, 0.1208491, -1.629689, 1, 0.7843137, 0, 1,
-1.129556, 0.4523858, -0.7316005, 1, 0.7921569, 0, 1,
-1.126392, -0.5181791, -1.984822, 1, 0.7960784, 0, 1,
-1.120214, -1.1196, -3.505912, 1, 0.8039216, 0, 1,
-1.117346, 0.7302433, -0.308744, 1, 0.8117647, 0, 1,
-1.1106, 0.6311505, -0.001714879, 1, 0.8156863, 0, 1,
-1.106495, -0.003632212, -0.04772424, 1, 0.8235294, 0, 1,
-1.102668, 1.274547, 0.2176526, 1, 0.827451, 0, 1,
-1.102506, -1.13781, -2.219074, 1, 0.8352941, 0, 1,
-1.10081, 0.6290441, -1.393787, 1, 0.8392157, 0, 1,
-1.09771, 0.9060215, 0.6202904, 1, 0.8470588, 0, 1,
-1.089581, 0.1264348, -0.1386602, 1, 0.8509804, 0, 1,
-1.083207, -0.7013804, -3.374042, 1, 0.8588235, 0, 1,
-1.076989, -0.1642595, -2.05352, 1, 0.8627451, 0, 1,
-1.072341, 0.3013233, -0.1575406, 1, 0.8705882, 0, 1,
-1.06864, -1.273722, -3.296672, 1, 0.8745098, 0, 1,
-1.064562, 0.3867732, -0.4956208, 1, 0.8823529, 0, 1,
-1.059314, -1.260689, -0.7030837, 1, 0.8862745, 0, 1,
-1.052195, 1.185024, -1.168493, 1, 0.8941177, 0, 1,
-1.049473, 0.08596359, -2.362864, 1, 0.8980392, 0, 1,
-1.039936, 0.7468006, 0.004737033, 1, 0.9058824, 0, 1,
-1.034036, 0.5058635, -1.376432, 1, 0.9137255, 0, 1,
-1.029864, 0.1471873, -2.124269, 1, 0.9176471, 0, 1,
-1.028053, 0.4513293, -0.7834731, 1, 0.9254902, 0, 1,
-1.023916, 0.9926105, -0.2097087, 1, 0.9294118, 0, 1,
-1.020033, -1.114916, -3.686574, 1, 0.9372549, 0, 1,
-1.017753, 1.827333, -1.2152, 1, 0.9411765, 0, 1,
-1.013616, -0.06145191, -1.989773, 1, 0.9490196, 0, 1,
-1.010723, 0.06633537, -1.963924, 1, 0.9529412, 0, 1,
-1.009158, 0.1722842, -1.097159, 1, 0.9607843, 0, 1,
-1.008188, -0.2521165, -2.035246, 1, 0.9647059, 0, 1,
-0.9995151, 0.007277661, -1.302572, 1, 0.972549, 0, 1,
-0.97921, 0.2366456, -1.00829, 1, 0.9764706, 0, 1,
-0.9686026, -0.2192937, -2.661741, 1, 0.9843137, 0, 1,
-0.9587178, -1.26629, -1.663852, 1, 0.9882353, 0, 1,
-0.9508346, -0.5473104, -3.587733, 1, 0.9960784, 0, 1,
-0.9452628, -0.3328848, -1.930769, 0.9960784, 1, 0, 1,
-0.9443574, 0.5966855, -1.367417, 0.9921569, 1, 0, 1,
-0.9429386, -0.06409866, -1.691716, 0.9843137, 1, 0, 1,
-0.9388348, 0.7080092, -0.9826893, 0.9803922, 1, 0, 1,
-0.93844, 1.307709, -3.803876, 0.972549, 1, 0, 1,
-0.9369546, 0.1468714, -2.111986, 0.9686275, 1, 0, 1,
-0.9318693, -0.1222165, -2.232889, 0.9607843, 1, 0, 1,
-0.9306132, 0.658613, -0.543995, 0.9568627, 1, 0, 1,
-0.9258415, 0.7241583, -1.804918, 0.9490196, 1, 0, 1,
-0.919863, 1.184954, -0.6117797, 0.945098, 1, 0, 1,
-0.9171101, -0.104374, -1.508063, 0.9372549, 1, 0, 1,
-0.9167243, 0.5175126, -1.154405, 0.9333333, 1, 0, 1,
-0.9157501, -1.080016, -2.281002, 0.9254902, 1, 0, 1,
-0.9140216, 1.9597, -0.6676192, 0.9215686, 1, 0, 1,
-0.9136419, -1.218226, -3.060304, 0.9137255, 1, 0, 1,
-0.9128674, -1.368997, -1.927409, 0.9098039, 1, 0, 1,
-0.9040643, 0.4022743, 0.9606524, 0.9019608, 1, 0, 1,
-0.8871248, -0.1969945, -2.929022, 0.8941177, 1, 0, 1,
-0.8835636, -0.5673416, -1.834429, 0.8901961, 1, 0, 1,
-0.8807856, -0.9443865, -3.958396, 0.8823529, 1, 0, 1,
-0.8759308, 0.1522935, -2.001797, 0.8784314, 1, 0, 1,
-0.8753468, -0.1667271, -1.525682, 0.8705882, 1, 0, 1,
-0.8750814, 0.3066957, 0.5316703, 0.8666667, 1, 0, 1,
-0.8725612, -0.01169278, -4.45921, 0.8588235, 1, 0, 1,
-0.868113, 0.5696098, 0.4545719, 0.854902, 1, 0, 1,
-0.8672282, -0.6324512, -1.444049, 0.8470588, 1, 0, 1,
-0.8667836, 0.1670059, -1.419432, 0.8431373, 1, 0, 1,
-0.8651486, 1.692135, -1.215082, 0.8352941, 1, 0, 1,
-0.8644773, -0.4261878, -1.726048, 0.8313726, 1, 0, 1,
-0.8620622, 1.04865, 0.5473543, 0.8235294, 1, 0, 1,
-0.8542225, -0.2092645, -0.7188168, 0.8196079, 1, 0, 1,
-0.8473542, 2.52253, 1.107254, 0.8117647, 1, 0, 1,
-0.8473498, 0.09388599, -1.463292, 0.8078431, 1, 0, 1,
-0.8461049, 0.3926028, -1.128286, 0.8, 1, 0, 1,
-0.8457692, 0.5366612, -1.110852, 0.7921569, 1, 0, 1,
-0.8437505, -1.060073, -2.648206, 0.7882353, 1, 0, 1,
-0.8418416, 0.1194851, -1.0908, 0.7803922, 1, 0, 1,
-0.8408983, -0.1371551, -3.759858, 0.7764706, 1, 0, 1,
-0.8368118, -0.2696675, -3.225719, 0.7686275, 1, 0, 1,
-0.8357997, 1.703456, -3.020816, 0.7647059, 1, 0, 1,
-0.8349959, -1.819715, -0.8977883, 0.7568628, 1, 0, 1,
-0.8340172, 0.1106577, -0.1804784, 0.7529412, 1, 0, 1,
-0.8321466, -1.36764, -2.893838, 0.7450981, 1, 0, 1,
-0.8305532, 0.9488568, -0.1738435, 0.7411765, 1, 0, 1,
-0.8232325, 0.8720162, -0.6579713, 0.7333333, 1, 0, 1,
-0.8211297, -0.8080818, -1.921911, 0.7294118, 1, 0, 1,
-0.8208552, -0.1457482, -1.468037, 0.7215686, 1, 0, 1,
-0.8108069, -0.9058405, -2.544157, 0.7176471, 1, 0, 1,
-0.8071967, 0.1955915, -0.4600556, 0.7098039, 1, 0, 1,
-0.8065005, -0.1666234, -0.5234959, 0.7058824, 1, 0, 1,
-0.8057684, -1.424835, -3.316219, 0.6980392, 1, 0, 1,
-0.802367, -1.0056, -3.799452, 0.6901961, 1, 0, 1,
-0.7930511, -0.5448635, -2.560997, 0.6862745, 1, 0, 1,
-0.7922804, -0.3293241, -2.926721, 0.6784314, 1, 0, 1,
-0.7887822, -0.7986484, -1.661692, 0.6745098, 1, 0, 1,
-0.78866, -0.2471799, -3.41063, 0.6666667, 1, 0, 1,
-0.787512, 0.07592883, -1.414811, 0.6627451, 1, 0, 1,
-0.7866807, 0.8176782, -0.8199288, 0.654902, 1, 0, 1,
-0.7857189, -0.423459, -1.992082, 0.6509804, 1, 0, 1,
-0.784099, 0.8709376, -0.7311382, 0.6431373, 1, 0, 1,
-0.783331, -0.9826264, -1.415951, 0.6392157, 1, 0, 1,
-0.7794298, -0.9692865, -2.020578, 0.6313726, 1, 0, 1,
-0.777882, -0.7242782, -2.050601, 0.627451, 1, 0, 1,
-0.7753832, -0.01621317, -2.060641, 0.6196079, 1, 0, 1,
-0.771422, -0.05038933, -2.171225, 0.6156863, 1, 0, 1,
-0.7647858, 1.221419, -0.9307561, 0.6078432, 1, 0, 1,
-0.7540601, -1.287306, -1.064507, 0.6039216, 1, 0, 1,
-0.7509416, 0.8836794, -1.533882, 0.5960785, 1, 0, 1,
-0.7484051, -0.2045085, 0.3488887, 0.5882353, 1, 0, 1,
-0.7472775, 3.035598, 1.139728, 0.5843138, 1, 0, 1,
-0.7418438, -1.190222, -2.356445, 0.5764706, 1, 0, 1,
-0.7404684, -0.7521175, -1.883561, 0.572549, 1, 0, 1,
-0.7404629, -0.538822, -3.086182, 0.5647059, 1, 0, 1,
-0.7379946, -1.269126, -1.874819, 0.5607843, 1, 0, 1,
-0.7335757, 0.9583248, -0.9493886, 0.5529412, 1, 0, 1,
-0.7324536, -1.144311, -2.256065, 0.5490196, 1, 0, 1,
-0.7283445, 0.3525402, -0.5467486, 0.5411765, 1, 0, 1,
-0.7231008, 0.9267965, 0.5327036, 0.5372549, 1, 0, 1,
-0.7172057, -1.123436, -0.004253763, 0.5294118, 1, 0, 1,
-0.7140503, -0.8596752, -3.660724, 0.5254902, 1, 0, 1,
-0.7063385, -0.5293395, -2.984516, 0.5176471, 1, 0, 1,
-0.7061707, -0.9955299, -2.018943, 0.5137255, 1, 0, 1,
-0.7061182, 1.614094, -0.6014069, 0.5058824, 1, 0, 1,
-0.7054587, -2.69501, -2.839013, 0.5019608, 1, 0, 1,
-0.7024208, -1.754113, -0.5840304, 0.4941176, 1, 0, 1,
-0.6898821, -0.4674595, -2.642903, 0.4862745, 1, 0, 1,
-0.6892969, -1.353777, -1.740499, 0.4823529, 1, 0, 1,
-0.6888468, -2.023324, -4.060294, 0.4745098, 1, 0, 1,
-0.6860927, 1.783808, -0.3745759, 0.4705882, 1, 0, 1,
-0.6840406, -0.386361, -2.385171, 0.4627451, 1, 0, 1,
-0.6832049, 0.06211219, -1.942885, 0.4588235, 1, 0, 1,
-0.682474, -0.08950538, -3.211814, 0.4509804, 1, 0, 1,
-0.6770289, 0.4251396, -0.06747007, 0.4470588, 1, 0, 1,
-0.6743904, 0.1818711, 0.1721657, 0.4392157, 1, 0, 1,
-0.6625288, -1.289054, -1.894545, 0.4352941, 1, 0, 1,
-0.6595416, -0.365918, -2.534283, 0.427451, 1, 0, 1,
-0.6586791, -0.5816883, -3.118179, 0.4235294, 1, 0, 1,
-0.6575542, 0.8999289, 0.4178722, 0.4156863, 1, 0, 1,
-0.6562645, -0.446901, -3.019027, 0.4117647, 1, 0, 1,
-0.6504785, -2.166713, -4.923736, 0.4039216, 1, 0, 1,
-0.6483451, 0.5186473, -2.36634, 0.3960784, 1, 0, 1,
-0.6415526, -0.117669, -1.025911, 0.3921569, 1, 0, 1,
-0.6365286, -1.779251, -2.884809, 0.3843137, 1, 0, 1,
-0.6271434, 1.010439, 0.8278018, 0.3803922, 1, 0, 1,
-0.6271231, -2.000448, -3.143011, 0.372549, 1, 0, 1,
-0.6270657, -1.357788, -2.27122, 0.3686275, 1, 0, 1,
-0.6257095, -1.796701, -2.57233, 0.3607843, 1, 0, 1,
-0.6214439, -1.795488, -2.384721, 0.3568628, 1, 0, 1,
-0.6130404, -0.306774, -0.2683459, 0.3490196, 1, 0, 1,
-0.6101863, 1.17597, -0.2534929, 0.345098, 1, 0, 1,
-0.6072438, -0.2076094, -2.460988, 0.3372549, 1, 0, 1,
-0.6009064, -0.1091252, -2.249378, 0.3333333, 1, 0, 1,
-0.5979152, -0.8073121, -2.98126, 0.3254902, 1, 0, 1,
-0.5948018, -0.6410472, -2.136494, 0.3215686, 1, 0, 1,
-0.5940968, 0.06563954, -1.931075, 0.3137255, 1, 0, 1,
-0.5938907, -1.8432, -1.912535, 0.3098039, 1, 0, 1,
-0.5921813, -0.9681922, -2.061147, 0.3019608, 1, 0, 1,
-0.5903245, 0.3468131, -2.895294, 0.2941177, 1, 0, 1,
-0.5882363, 0.317841, -2.431135, 0.2901961, 1, 0, 1,
-0.5850052, 0.2702628, -0.3099804, 0.282353, 1, 0, 1,
-0.5838659, 0.2405891, -3.276735, 0.2784314, 1, 0, 1,
-0.5824946, 0.5628869, -0.6072307, 0.2705882, 1, 0, 1,
-0.5824709, -0.1471612, -2.535562, 0.2666667, 1, 0, 1,
-0.5799788, 1.63475, -1.14621, 0.2588235, 1, 0, 1,
-0.5759185, 1.4317, -0.1786855, 0.254902, 1, 0, 1,
-0.5672091, -0.1814312, -1.81854, 0.2470588, 1, 0, 1,
-0.5612327, 0.1207048, 0.4560817, 0.2431373, 1, 0, 1,
-0.5604711, -0.6477298, -3.827807, 0.2352941, 1, 0, 1,
-0.5600598, 0.4566449, -1.623636, 0.2313726, 1, 0, 1,
-0.5559649, -1.706201, -3.485055, 0.2235294, 1, 0, 1,
-0.5558438, -0.01417356, -1.763966, 0.2196078, 1, 0, 1,
-0.5522765, 0.9778475, -1.219383, 0.2117647, 1, 0, 1,
-0.55132, -0.2412363, -2.113761, 0.2078431, 1, 0, 1,
-0.5505297, 0.9487598, -0.1908402, 0.2, 1, 0, 1,
-0.5489774, -1.161409, -2.43297, 0.1921569, 1, 0, 1,
-0.5478003, 1.808391, -0.6936609, 0.1882353, 1, 0, 1,
-0.5445769, -0.5837464, -3.247808, 0.1803922, 1, 0, 1,
-0.5399596, -1.450594, -3.840317, 0.1764706, 1, 0, 1,
-0.5379614, 1.780207, -0.2534267, 0.1686275, 1, 0, 1,
-0.5343694, 0.2397907, -0.8651729, 0.1647059, 1, 0, 1,
-0.5311742, 1.227508, 1.792442, 0.1568628, 1, 0, 1,
-0.5309014, -0.2083739, -1.917039, 0.1529412, 1, 0, 1,
-0.5308324, 1.231469, -0.6738532, 0.145098, 1, 0, 1,
-0.529567, -0.2327616, -3.903771, 0.1411765, 1, 0, 1,
-0.5259524, 0.07399591, -0.1457299, 0.1333333, 1, 0, 1,
-0.5250043, 0.803537, 0.5259222, 0.1294118, 1, 0, 1,
-0.5243427, -0.6467396, -3.523473, 0.1215686, 1, 0, 1,
-0.524329, -0.4247645, -2.669593, 0.1176471, 1, 0, 1,
-0.5232206, -0.1533385, -2.520528, 0.1098039, 1, 0, 1,
-0.521815, 1.370387, 0.2455813, 0.1058824, 1, 0, 1,
-0.5184531, -1.165022, -2.152567, 0.09803922, 1, 0, 1,
-0.5156634, -0.5886964, -4.100439, 0.09019608, 1, 0, 1,
-0.5121658, -1.749599, -2.770383, 0.08627451, 1, 0, 1,
-0.5115932, -0.3377998, -1.750085, 0.07843138, 1, 0, 1,
-0.5111393, 0.4613114, -0.3140568, 0.07450981, 1, 0, 1,
-0.5081948, 0.1502094, -2.060791, 0.06666667, 1, 0, 1,
-0.5065827, -1.253012, -1.059831, 0.0627451, 1, 0, 1,
-0.5028835, 0.4787538, 0.584714, 0.05490196, 1, 0, 1,
-0.5018985, 0.7936687, -0.07356208, 0.05098039, 1, 0, 1,
-0.5004991, -0.6445924, -1.927665, 0.04313726, 1, 0, 1,
-0.4992989, 0.2319444, -1.490614, 0.03921569, 1, 0, 1,
-0.497756, -1.234708, -3.565795, 0.03137255, 1, 0, 1,
-0.4973553, -0.6132329, -2.758814, 0.02745098, 1, 0, 1,
-0.4963374, -0.2049909, -1.49967, 0.01960784, 1, 0, 1,
-0.4952157, 1.620198, -1.011156, 0.01568628, 1, 0, 1,
-0.4945733, -1.034595, -1.312102, 0.007843138, 1, 0, 1,
-0.4919081, 1.149665, 0.2770387, 0.003921569, 1, 0, 1,
-0.4898396, 0.5952955, -0.6733501, 0, 1, 0.003921569, 1,
-0.4871587, -0.7333056, -0.947103, 0, 1, 0.01176471, 1,
-0.481836, -0.6648035, -3.246828, 0, 1, 0.01568628, 1,
-0.4815597, 0.991183, 0.3294433, 0, 1, 0.02352941, 1,
-0.4799224, 1.058584, -1.42033, 0, 1, 0.02745098, 1,
-0.4790775, -1.402935, -2.608243, 0, 1, 0.03529412, 1,
-0.4777076, 1.524076, -2.12079, 0, 1, 0.03921569, 1,
-0.4772458, -1.690315, -1.510904, 0, 1, 0.04705882, 1,
-0.4755054, 0.6415012, -2.436881, 0, 1, 0.05098039, 1,
-0.472727, -1.418324, -1.733288, 0, 1, 0.05882353, 1,
-0.4680766, -0.3857479, -1.681625, 0, 1, 0.0627451, 1,
-0.467942, -0.97101, -2.760777, 0, 1, 0.07058824, 1,
-0.4638496, 0.8372888, 0.1969348, 0, 1, 0.07450981, 1,
-0.4631574, -0.2801769, -3.685843, 0, 1, 0.08235294, 1,
-0.4580497, -1.160768, -2.536641, 0, 1, 0.08627451, 1,
-0.4562144, -1.747299, -6.187631, 0, 1, 0.09411765, 1,
-0.4540995, -1.67278, -3.88552, 0, 1, 0.1019608, 1,
-0.4531187, 0.7419115, 0.9943093, 0, 1, 0.1058824, 1,
-0.4527902, 1.445573, -0.152511, 0, 1, 0.1137255, 1,
-0.4494897, -0.9483743, -3.588658, 0, 1, 0.1176471, 1,
-0.4490418, 2.735836, -1.898249, 0, 1, 0.1254902, 1,
-0.4431405, 1.996861, -0.5285487, 0, 1, 0.1294118, 1,
-0.4408492, -2.1218, -3.286378, 0, 1, 0.1372549, 1,
-0.4408018, -1.205677, -1.56538, 0, 1, 0.1411765, 1,
-0.4398557, -1.718985, -3.813195, 0, 1, 0.1490196, 1,
-0.4355085, 0.01644908, -1.899172, 0, 1, 0.1529412, 1,
-0.427159, -1.052128, -1.415594, 0, 1, 0.1607843, 1,
-0.4247092, 0.7886935, -2.407372, 0, 1, 0.1647059, 1,
-0.4232456, -0.2508514, -2.85619, 0, 1, 0.172549, 1,
-0.4227845, -0.2543496, -1.17405, 0, 1, 0.1764706, 1,
-0.4197217, 0.5215989, -1.397544, 0, 1, 0.1843137, 1,
-0.4155107, -0.2731069, 0.6291095, 0, 1, 0.1882353, 1,
-0.4144397, 0.3278132, 0.3000545, 0, 1, 0.1960784, 1,
-0.4129791, 0.9043079, -0.4847519, 0, 1, 0.2039216, 1,
-0.4118569, 0.9900002, -0.01482627, 0, 1, 0.2078431, 1,
-0.4083739, 0.9405324, -0.2334615, 0, 1, 0.2156863, 1,
-0.4076608, 1.215987, -0.4833167, 0, 1, 0.2196078, 1,
-0.4061108, 0.5167215, -0.1638724, 0, 1, 0.227451, 1,
-0.4057789, 0.5833807, 1.417815, 0, 1, 0.2313726, 1,
-0.4004881, -0.09228192, -1.933369, 0, 1, 0.2392157, 1,
-0.3950014, -0.7472327, -3.203768, 0, 1, 0.2431373, 1,
-0.3893354, -0.2189799, -3.588492, 0, 1, 0.2509804, 1,
-0.3792698, -0.6452149, -1.417899, 0, 1, 0.254902, 1,
-0.3787143, -0.6840905, -1.948248, 0, 1, 0.2627451, 1,
-0.3777158, 0.6271881, -0.8366064, 0, 1, 0.2666667, 1,
-0.3769741, -2.174613, -1.853335, 0, 1, 0.2745098, 1,
-0.3748099, -0.9547149, -2.899686, 0, 1, 0.2784314, 1,
-0.3704987, -0.5713643, -0.6694055, 0, 1, 0.2862745, 1,
-0.369208, -0.7458367, -3.391352, 0, 1, 0.2901961, 1,
-0.3669519, 0.694223, -1.128845, 0, 1, 0.2980392, 1,
-0.3669513, 0.6984955, -0.4169692, 0, 1, 0.3058824, 1,
-0.3647507, -2.016384, -2.982382, 0, 1, 0.3098039, 1,
-0.3631114, 0.1907673, -2.277762, 0, 1, 0.3176471, 1,
-0.3608172, -0.1684616, -2.420382, 0, 1, 0.3215686, 1,
-0.3602545, 1.089585, -0.6273243, 0, 1, 0.3294118, 1,
-0.3542681, -0.07271628, -0.9207452, 0, 1, 0.3333333, 1,
-0.3521633, -1.810076, -3.616072, 0, 1, 0.3411765, 1,
-0.3500637, 0.5883107, -0.7926244, 0, 1, 0.345098, 1,
-0.3447249, 0.09244474, 0.4493498, 0, 1, 0.3529412, 1,
-0.3446621, 0.1146451, -1.27019, 0, 1, 0.3568628, 1,
-0.33887, -0.6571088, -2.492629, 0, 1, 0.3647059, 1,
-0.3368827, 0.3102206, 0.005318671, 0, 1, 0.3686275, 1,
-0.3349876, 1.097786, 0.7111438, 0, 1, 0.3764706, 1,
-0.3344954, -0.3727915, -2.668665, 0, 1, 0.3803922, 1,
-0.3319483, 0.8558168, -0.8649637, 0, 1, 0.3882353, 1,
-0.3317262, -0.7057344, -3.895756, 0, 1, 0.3921569, 1,
-0.3295857, -1.254236, -2.523492, 0, 1, 0.4, 1,
-0.326436, -0.7187682, -4.003251, 0, 1, 0.4078431, 1,
-0.3262314, -0.3630194, -3.567861, 0, 1, 0.4117647, 1,
-0.3201682, -1.09098, -3.687847, 0, 1, 0.4196078, 1,
-0.3187762, -0.1848671, -2.183088, 0, 1, 0.4235294, 1,
-0.3180831, -1.378927, -1.048164, 0, 1, 0.4313726, 1,
-0.3161532, 0.1020082, -0.1915643, 0, 1, 0.4352941, 1,
-0.3125, 1.157787, 0.6064968, 0, 1, 0.4431373, 1,
-0.3120805, -0.212804, -2.101082, 0, 1, 0.4470588, 1,
-0.3111626, -0.4463522, -1.67931, 0, 1, 0.454902, 1,
-0.3060638, -0.06852501, -2.607457, 0, 1, 0.4588235, 1,
-0.3042847, -1.684403, -1.360826, 0, 1, 0.4666667, 1,
-0.304113, -0.1923586, -1.720851, 0, 1, 0.4705882, 1,
-0.2997121, -0.04233699, -2.589143, 0, 1, 0.4784314, 1,
-0.2915362, 1.003966, -0.5115424, 0, 1, 0.4823529, 1,
-0.2867189, -0.5750982, -5.447661, 0, 1, 0.4901961, 1,
-0.2850764, 1.339599, -1.421025, 0, 1, 0.4941176, 1,
-0.2781333, 1.707641, 0.408988, 0, 1, 0.5019608, 1,
-0.2769755, 1.409377, 0.9586899, 0, 1, 0.509804, 1,
-0.2752013, 1.024865, -0.2733968, 0, 1, 0.5137255, 1,
-0.2741554, -1.219003, -2.147684, 0, 1, 0.5215687, 1,
-0.2683931, 0.8977639, 0.2149229, 0, 1, 0.5254902, 1,
-0.2679233, 0.5853854, 0.2593503, 0, 1, 0.5333334, 1,
-0.2649782, 0.1332824, -0.9670616, 0, 1, 0.5372549, 1,
-0.2587994, -0.01512265, -1.249525, 0, 1, 0.5450981, 1,
-0.2575758, -0.7417132, -3.111181, 0, 1, 0.5490196, 1,
-0.2545359, 0.1281577, -1.01917, 0, 1, 0.5568628, 1,
-0.2533744, -0.1469599, -2.069053, 0, 1, 0.5607843, 1,
-0.2528794, -1.068118, -0.7215244, 0, 1, 0.5686275, 1,
-0.2507426, -0.2049161, -2.830263, 0, 1, 0.572549, 1,
-0.2402682, -0.4888519, -3.842395, 0, 1, 0.5803922, 1,
-0.2387785, -0.1747736, -2.4931, 0, 1, 0.5843138, 1,
-0.2364117, -0.1261663, -1.5529, 0, 1, 0.5921569, 1,
-0.2334949, 0.1256705, -0.3017025, 0, 1, 0.5960785, 1,
-0.2331388, 0.2677941, -0.02842751, 0, 1, 0.6039216, 1,
-0.231945, 0.8913482, -1.173238, 0, 1, 0.6117647, 1,
-0.2265493, 0.1462465, -0.2152676, 0, 1, 0.6156863, 1,
-0.2250473, -1.564997, -3.238879, 0, 1, 0.6235294, 1,
-0.2207313, 0.5934348, -0.5015936, 0, 1, 0.627451, 1,
-0.2198392, -0.6872911, -1.536906, 0, 1, 0.6352941, 1,
-0.2182737, -1.14278, -4.135174, 0, 1, 0.6392157, 1,
-0.2180468, -0.668201, -1.848125, 0, 1, 0.6470588, 1,
-0.2146571, -0.6785194, -5.045057, 0, 1, 0.6509804, 1,
-0.213098, -1.236624, -2.095862, 0, 1, 0.6588235, 1,
-0.2127203, -0.03808227, -2.194415, 0, 1, 0.6627451, 1,
-0.2121027, 0.5655091, 0.2812894, 0, 1, 0.6705883, 1,
-0.2095274, -0.2483802, -1.069367, 0, 1, 0.6745098, 1,
-0.2090265, 0.9949127, 1.37636, 0, 1, 0.682353, 1,
-0.2089354, -0.4953429, -2.952176, 0, 1, 0.6862745, 1,
-0.2083465, 0.6359586, -0.6656241, 0, 1, 0.6941177, 1,
-0.2028052, 0.03451035, 0.8393206, 0, 1, 0.7019608, 1,
-0.2021059, 0.884495, -0.05921527, 0, 1, 0.7058824, 1,
-0.200331, 1.229607, -0.491274, 0, 1, 0.7137255, 1,
-0.1982445, -0.3769945, -1.679523, 0, 1, 0.7176471, 1,
-0.1917207, -1.422493, -3.030718, 0, 1, 0.7254902, 1,
-0.1908804, -0.8511588, -4.410333, 0, 1, 0.7294118, 1,
-0.1861403, -1.210257, -2.134339, 0, 1, 0.7372549, 1,
-0.1844826, 0.3277765, -0.5254607, 0, 1, 0.7411765, 1,
-0.1807974, 1.155977, 0.006389242, 0, 1, 0.7490196, 1,
-0.1792374, 0.8349094, -1.675405, 0, 1, 0.7529412, 1,
-0.1789313, 0.7174505, -1.062846, 0, 1, 0.7607843, 1,
-0.1769441, 0.1580212, 0.4722705, 0, 1, 0.7647059, 1,
-0.1720636, -0.00193764, -0.1064302, 0, 1, 0.772549, 1,
-0.1681141, 1.134688, -0.5711806, 0, 1, 0.7764706, 1,
-0.1615821, -1.800133, -3.708728, 0, 1, 0.7843137, 1,
-0.1609264, 2.250141, -0.5586116, 0, 1, 0.7882353, 1,
-0.1608253, 0.786015, 0.5040023, 0, 1, 0.7960784, 1,
-0.1599999, -2.09555, -3.82155, 0, 1, 0.8039216, 1,
-0.1595283, 0.0662685, -3.02682, 0, 1, 0.8078431, 1,
-0.1532435, 0.5322495, -0.7819852, 0, 1, 0.8156863, 1,
-0.1511174, 0.03492371, 0.1105758, 0, 1, 0.8196079, 1,
-0.1507847, 1.172741, -0.7522852, 0, 1, 0.827451, 1,
-0.1504145, 2.102856, -0.03321284, 0, 1, 0.8313726, 1,
-0.1465649, 0.6494743, 0.2721052, 0, 1, 0.8392157, 1,
-0.1445749, -0.05967506, -3.203293, 0, 1, 0.8431373, 1,
-0.1441531, 0.4933139, -0.143649, 0, 1, 0.8509804, 1,
-0.1429599, 0.06152224, -1.413463, 0, 1, 0.854902, 1,
-0.1404786, 0.4145787, -0.4716884, 0, 1, 0.8627451, 1,
-0.1365793, 0.06803367, -1.621596, 0, 1, 0.8666667, 1,
-0.1358652, 1.435539, 1.908526, 0, 1, 0.8745098, 1,
-0.1340878, 0.8722525, -0.9677928, 0, 1, 0.8784314, 1,
-0.1324192, 0.8682763, -0.1096433, 0, 1, 0.8862745, 1,
-0.1281188, -1.331318, -3.876135, 0, 1, 0.8901961, 1,
-0.1240919, 0.6434224, -0.5089476, 0, 1, 0.8980392, 1,
-0.123838, -0.8468772, -2.070981, 0, 1, 0.9058824, 1,
-0.1235641, 0.7628707, 0.4340736, 0, 1, 0.9098039, 1,
-0.1224418, 1.188705, -0.07302476, 0, 1, 0.9176471, 1,
-0.1190101, -0.4487723, -1.686532, 0, 1, 0.9215686, 1,
-0.1189276, 1.56752, 1.335413, 0, 1, 0.9294118, 1,
-0.1175068, 0.5278344, 0.5666939, 0, 1, 0.9333333, 1,
-0.1158479, -0.0130175, -1.001189, 0, 1, 0.9411765, 1,
-0.1148867, -0.4420593, -1.436975, 0, 1, 0.945098, 1,
-0.1115876, -0.01609672, -1.16942, 0, 1, 0.9529412, 1,
-0.1112644, 2.11062, 0.03593651, 0, 1, 0.9568627, 1,
-0.1036927, 1.043148, -0.1634993, 0, 1, 0.9647059, 1,
-0.1035242, 1.219852, -1.268477, 0, 1, 0.9686275, 1,
-0.1032814, 1.694443, 1.741441, 0, 1, 0.9764706, 1,
-0.1013207, -0.8977293, -3.264972, 0, 1, 0.9803922, 1,
-0.1000786, 0.1778393, 0.07042857, 0, 1, 0.9882353, 1,
-0.0936415, -0.367768, -4.201578, 0, 1, 0.9921569, 1,
-0.09307524, 0.84907, -0.04265775, 0, 1, 1, 1,
-0.09188663, 1.882404, -0.9248594, 0, 0.9921569, 1, 1,
-0.09037041, -0.3645731, -3.601161, 0, 0.9882353, 1, 1,
-0.08959255, -0.04010263, -2.178453, 0, 0.9803922, 1, 1,
-0.08821507, -0.06032266, -1.273875, 0, 0.9764706, 1, 1,
-0.08677809, -0.4905538, -3.721618, 0, 0.9686275, 1, 1,
-0.08304067, 2.157564, 0.613634, 0, 0.9647059, 1, 1,
-0.08245996, -1.694139, -2.37299, 0, 0.9568627, 1, 1,
-0.07786131, 0.0327784, -0.7540792, 0, 0.9529412, 1, 1,
-0.07744251, 0.5152652, -0.3917036, 0, 0.945098, 1, 1,
-0.07520442, -0.5111244, -2.449556, 0, 0.9411765, 1, 1,
-0.074931, -0.6537902, -2.273099, 0, 0.9333333, 1, 1,
-0.07316923, 0.4533474, -0.9955982, 0, 0.9294118, 1, 1,
-0.06764994, -1.14038, -1.556789, 0, 0.9215686, 1, 1,
-0.06712578, -0.9083957, -2.961513, 0, 0.9176471, 1, 1,
-0.06580668, 1.026528, 0.5251632, 0, 0.9098039, 1, 1,
-0.06166068, 1.927144, 1.807481, 0, 0.9058824, 1, 1,
-0.06141044, 0.3817214, 0.6524625, 0, 0.8980392, 1, 1,
-0.05887092, -0.4455698, -3.719978, 0, 0.8901961, 1, 1,
-0.05691306, 0.1893805, -0.7889353, 0, 0.8862745, 1, 1,
-0.05149153, -0.394587, -2.710609, 0, 0.8784314, 1, 1,
-0.0513836, 1.655144, -0.1724821, 0, 0.8745098, 1, 1,
-0.05119729, -0.8719478, -2.199142, 0, 0.8666667, 1, 1,
-0.0500733, 0.2286401, -0.927934, 0, 0.8627451, 1, 1,
-0.04981088, 0.7818339, 1.24879, 0, 0.854902, 1, 1,
-0.04612651, 0.9052062, 0.01427039, 0, 0.8509804, 1, 1,
-0.04263407, 0.137156, 0.04888115, 0, 0.8431373, 1, 1,
-0.04124071, -0.4085957, -1.835153, 0, 0.8392157, 1, 1,
-0.03795733, 0.9910749, 0.399991, 0, 0.8313726, 1, 1,
-0.0358054, 0.2679443, 0.9853075, 0, 0.827451, 1, 1,
-0.03444849, 0.3754956, 0.09231586, 0, 0.8196079, 1, 1,
-0.02950483, 0.4895643, 0.08866812, 0, 0.8156863, 1, 1,
-0.0272802, -0.06967772, -3.225918, 0, 0.8078431, 1, 1,
-0.02555163, -0.988724, -2.753172, 0, 0.8039216, 1, 1,
-0.01985054, -0.9070977, -2.411749, 0, 0.7960784, 1, 1,
-0.01749187, 0.9463573, -0.7307841, 0, 0.7882353, 1, 1,
-0.016282, -0.5811626, -1.449045, 0, 0.7843137, 1, 1,
-0.01529462, 0.1854936, 0.299731, 0, 0.7764706, 1, 1,
-0.01519121, 0.02609, -1.412978, 0, 0.772549, 1, 1,
-0.01349919, 0.4874536, 0.2694916, 0, 0.7647059, 1, 1,
-0.01175936, -0.4771806, -2.861031, 0, 0.7607843, 1, 1,
-0.01085363, 1.620971, -0.4923413, 0, 0.7529412, 1, 1,
-0.009056132, 0.1650381, 0.7307434, 0, 0.7490196, 1, 1,
-0.002883004, -0.8674753, -1.626477, 0, 0.7411765, 1, 1,
0.001938838, 1.118403, 0.3087505, 0, 0.7372549, 1, 1,
0.002384592, 0.6010556, 0.8428656, 0, 0.7294118, 1, 1,
0.0080597, 0.7300693, -0.3483085, 0, 0.7254902, 1, 1,
0.009440074, 1.924248, 0.7963834, 0, 0.7176471, 1, 1,
0.0104865, -1.098565, 3.304967, 0, 0.7137255, 1, 1,
0.01771316, 1.003037, -0.6480567, 0, 0.7058824, 1, 1,
0.02019618, -0.5481109, 2.19066, 0, 0.6980392, 1, 1,
0.02030344, -1.202355, 4.321702, 0, 0.6941177, 1, 1,
0.02943046, -0.1507539, 2.612674, 0, 0.6862745, 1, 1,
0.02978369, 0.6324199, 1.1399, 0, 0.682353, 1, 1,
0.03645289, -1.232376, 2.271099, 0, 0.6745098, 1, 1,
0.03722094, -1.229252, 3.04798, 0, 0.6705883, 1, 1,
0.03735936, -1.017567, 3.035608, 0, 0.6627451, 1, 1,
0.03876875, -0.3831863, 2.558661, 0, 0.6588235, 1, 1,
0.04014233, -0.2109399, 1.758461, 0, 0.6509804, 1, 1,
0.04335438, 0.2975183, 1.43352, 0, 0.6470588, 1, 1,
0.04450073, -0.3360434, 2.816343, 0, 0.6392157, 1, 1,
0.04622239, -1.272156, 2.390027, 0, 0.6352941, 1, 1,
0.05475455, 0.603619, 0.7701606, 0, 0.627451, 1, 1,
0.05718892, 1.104706, -0.9742274, 0, 0.6235294, 1, 1,
0.05806394, -0.532987, 3.564522, 0, 0.6156863, 1, 1,
0.059845, 0.7335439, 2.109091, 0, 0.6117647, 1, 1,
0.05994724, -0.7941226, 1.071564, 0, 0.6039216, 1, 1,
0.06010756, -0.8093467, 1.308052, 0, 0.5960785, 1, 1,
0.06455468, 1.241547, 1.692712, 0, 0.5921569, 1, 1,
0.06594907, 0.7399217, -1.074791, 0, 0.5843138, 1, 1,
0.07481737, 0.4391988, 1.318438, 0, 0.5803922, 1, 1,
0.07855313, 1.170106, -0.7367879, 0, 0.572549, 1, 1,
0.07992065, -0.3103366, 3.472574, 0, 0.5686275, 1, 1,
0.08005897, 0.6786602, 0.1714269, 0, 0.5607843, 1, 1,
0.0844796, 0.4909604, -0.4694127, 0, 0.5568628, 1, 1,
0.09071944, -0.3548615, 2.729663, 0, 0.5490196, 1, 1,
0.09181817, 0.7630625, -2.942882, 0, 0.5450981, 1, 1,
0.09371103, -0.8795841, 2.059257, 0, 0.5372549, 1, 1,
0.09611059, -1.126089, 2.891213, 0, 0.5333334, 1, 1,
0.09735636, -1.135057, 3.340423, 0, 0.5254902, 1, 1,
0.09827694, 0.00781277, 0.7350362, 0, 0.5215687, 1, 1,
0.09990007, -1.267305, 1.647601, 0, 0.5137255, 1, 1,
0.1008727, -0.9997109, 2.607313, 0, 0.509804, 1, 1,
0.1012439, 1.334797, 1.592777, 0, 0.5019608, 1, 1,
0.1037787, 0.2141221, 0.3511293, 0, 0.4941176, 1, 1,
0.1061653, 1.923815, 1.00549, 0, 0.4901961, 1, 1,
0.1132257, 0.1123914, 0.121663, 0, 0.4823529, 1, 1,
0.1170863, 0.08615743, 1.73658, 0, 0.4784314, 1, 1,
0.1173561, -0.8491135, 2.323849, 0, 0.4705882, 1, 1,
0.1178882, -1.062801, 2.362472, 0, 0.4666667, 1, 1,
0.1209238, 1.660089, 0.2114934, 0, 0.4588235, 1, 1,
0.1221389, -0.9035411, 2.510384, 0, 0.454902, 1, 1,
0.1387735, -0.3234371, 2.696277, 0, 0.4470588, 1, 1,
0.1390267, -0.2911433, 2.651734, 0, 0.4431373, 1, 1,
0.1391883, 0.6007969, 1.329148, 0, 0.4352941, 1, 1,
0.1414749, -0.02219959, 1.40598, 0, 0.4313726, 1, 1,
0.1421319, -1.258053, 2.95376, 0, 0.4235294, 1, 1,
0.1465682, -1.43385, 3.152791, 0, 0.4196078, 1, 1,
0.1503043, -0.2275544, 1.031179, 0, 0.4117647, 1, 1,
0.1546783, 0.3185994, 3.451024, 0, 0.4078431, 1, 1,
0.1604075, -1.442572, 2.763348, 0, 0.4, 1, 1,
0.1644337, 0.2121124, 0.4127145, 0, 0.3921569, 1, 1,
0.1652958, -0.8549939, 4.259391, 0, 0.3882353, 1, 1,
0.1678572, -0.2515478, 2.075705, 0, 0.3803922, 1, 1,
0.1720636, -0.3312807, 3.141497, 0, 0.3764706, 1, 1,
0.1730663, 1.209717, -0.6264705, 0, 0.3686275, 1, 1,
0.1757292, -0.1702485, 1.751047, 0, 0.3647059, 1, 1,
0.1772579, 0.8509293, -0.237614, 0, 0.3568628, 1, 1,
0.1804105, 1.170025, -0.3066579, 0, 0.3529412, 1, 1,
0.1806275, -1.273538, 3.453279, 0, 0.345098, 1, 1,
0.1883533, -0.04771351, 0.7793773, 0, 0.3411765, 1, 1,
0.1913256, -0.8673569, 0.82325, 0, 0.3333333, 1, 1,
0.1914109, 1.149438, -0.2416079, 0, 0.3294118, 1, 1,
0.1916718, 1.200172, 0.3557271, 0, 0.3215686, 1, 1,
0.1931099, -0.491626, 3.925078, 0, 0.3176471, 1, 1,
0.1936001, 0.02059669, 3.284773, 0, 0.3098039, 1, 1,
0.1948309, -0.992905, 3.461817, 0, 0.3058824, 1, 1,
0.1996339, -1.044259, 2.273031, 0, 0.2980392, 1, 1,
0.1996701, -0.9784361, 2.853889, 0, 0.2901961, 1, 1,
0.202071, -0.5539113, 1.704564, 0, 0.2862745, 1, 1,
0.207462, -0.1471291, 2.290236, 0, 0.2784314, 1, 1,
0.2078422, 0.5865101, 0.222745, 0, 0.2745098, 1, 1,
0.2111301, 0.1230848, 1.634176, 0, 0.2666667, 1, 1,
0.213967, 0.07965257, 1.565972, 0, 0.2627451, 1, 1,
0.2168166, 0.1961169, 0.9985794, 0, 0.254902, 1, 1,
0.2190952, -0.1019763, 3.972929, 0, 0.2509804, 1, 1,
0.2247575, 0.8837681, 1.402291, 0, 0.2431373, 1, 1,
0.2251325, -1.363992, 4.812943, 0, 0.2392157, 1, 1,
0.2261283, -1.967694, 3.269284, 0, 0.2313726, 1, 1,
0.2331325, -0.7877845, 3.220717, 0, 0.227451, 1, 1,
0.2331816, 0.8952708, 0.2914334, 0, 0.2196078, 1, 1,
0.239074, 0.6693993, -0.8868012, 0, 0.2156863, 1, 1,
0.2422646, 0.2566427, 1.04163, 0, 0.2078431, 1, 1,
0.2428236, -1.775525, 0.5648795, 0, 0.2039216, 1, 1,
0.2478047, 0.69737, 0.07968202, 0, 0.1960784, 1, 1,
0.2491471, 1.158879, 1.323954, 0, 0.1882353, 1, 1,
0.2531195, 1.372495, -0.7731358, 0, 0.1843137, 1, 1,
0.2535557, -1.060581, 3.372119, 0, 0.1764706, 1, 1,
0.2546026, -0.2902192, 1.65889, 0, 0.172549, 1, 1,
0.2552463, 0.5931546, -0.5201211, 0, 0.1647059, 1, 1,
0.2580451, 1.005153, -0.4158789, 0, 0.1607843, 1, 1,
0.2583463, -0.4213309, 1.059981, 0, 0.1529412, 1, 1,
0.2593094, -0.2541019, 1.376384, 0, 0.1490196, 1, 1,
0.2622846, -1.801456, 2.786114, 0, 0.1411765, 1, 1,
0.2623609, 0.4878454, -0.378785, 0, 0.1372549, 1, 1,
0.2628006, -0.1464737, 2.512995, 0, 0.1294118, 1, 1,
0.2669096, 0.9525716, 0.2407268, 0, 0.1254902, 1, 1,
0.2679409, 0.2788435, 1.405958, 0, 0.1176471, 1, 1,
0.2683215, 0.6966275, -1.026449, 0, 0.1137255, 1, 1,
0.2713408, 0.1844238, 0.8146352, 0, 0.1058824, 1, 1,
0.2743094, -0.3790435, 1.396275, 0, 0.09803922, 1, 1,
0.2799733, -0.6776248, 3.54531, 0, 0.09411765, 1, 1,
0.2837631, 1.524597, 1.589696, 0, 0.08627451, 1, 1,
0.2841159, -0.3211545, 1.994658, 0, 0.08235294, 1, 1,
0.2863836, -0.9048728, 4.152292, 0, 0.07450981, 1, 1,
0.2873518, 0.3097126, 1.801086, 0, 0.07058824, 1, 1,
0.2882742, 0.1780584, 1.434279, 0, 0.0627451, 1, 1,
0.2894242, -0.3272222, 2.404012, 0, 0.05882353, 1, 1,
0.2945143, -0.04459436, 2.679277, 0, 0.05098039, 1, 1,
0.2956157, 0.2229562, 0.5100402, 0, 0.04705882, 1, 1,
0.2971722, 0.5589527, 0.6512951, 0, 0.03921569, 1, 1,
0.2982227, -0.5537332, 1.544329, 0, 0.03529412, 1, 1,
0.3004663, 0.3978078, 0.9420662, 0, 0.02745098, 1, 1,
0.3020224, 0.1567356, 1.885669, 0, 0.02352941, 1, 1,
0.3021374, 1.333564, -1.427062, 0, 0.01568628, 1, 1,
0.3031598, 0.8343431, 0.05229009, 0, 0.01176471, 1, 1,
0.306776, -0.6043467, 1.589285, 0, 0.003921569, 1, 1,
0.3101607, -0.8946242, 2.052958, 0.003921569, 0, 1, 1,
0.314636, 0.6884378, -0.5230429, 0.007843138, 0, 1, 1,
0.3305301, -0.8340831, 4.843605, 0.01568628, 0, 1, 1,
0.3390808, 0.1891906, 0.08922722, 0.01960784, 0, 1, 1,
0.3451302, -0.488649, 3.649678, 0.02745098, 0, 1, 1,
0.3533979, -0.06453211, 2.098721, 0.03137255, 0, 1, 1,
0.3557915, -0.4935081, 1.727805, 0.03921569, 0, 1, 1,
0.3584693, 2.228357, 1.659538, 0.04313726, 0, 1, 1,
0.3599202, 1.116387, -0.3097171, 0.05098039, 0, 1, 1,
0.3624661, -0.1960768, 2.597226, 0.05490196, 0, 1, 1,
0.3688005, -1.092169, 2.073608, 0.0627451, 0, 1, 1,
0.3746006, -0.3872724, 2.497889, 0.06666667, 0, 1, 1,
0.3778424, 0.4756469, 1.237697, 0.07450981, 0, 1, 1,
0.3871305, 0.2290972, 1.549566, 0.07843138, 0, 1, 1,
0.3881794, -1.21287, 2.080301, 0.08627451, 0, 1, 1,
0.3930081, 1.301392, 0.3104051, 0.09019608, 0, 1, 1,
0.3968475, 0.9362911, 0.62282, 0.09803922, 0, 1, 1,
0.3996505, -0.2544804, 0.8017314, 0.1058824, 0, 1, 1,
0.4024975, 1.134357, -1.761993, 0.1098039, 0, 1, 1,
0.4057616, 1.004647, -0.8366135, 0.1176471, 0, 1, 1,
0.4094085, -1.546197, 3.23537, 0.1215686, 0, 1, 1,
0.4095895, 0.4650592, 0.6053587, 0.1294118, 0, 1, 1,
0.4096907, -0.1389345, 3.669143, 0.1333333, 0, 1, 1,
0.4106131, 0.4458804, 0.7486038, 0.1411765, 0, 1, 1,
0.4120054, -1.452211, 4.245024, 0.145098, 0, 1, 1,
0.4131191, -1.121819, 3.779118, 0.1529412, 0, 1, 1,
0.4182665, 0.6101483, 1.501239, 0.1568628, 0, 1, 1,
0.4203346, -1.723634, 4.371221, 0.1647059, 0, 1, 1,
0.425411, -0.1519279, 2.744252, 0.1686275, 0, 1, 1,
0.4273146, -0.462704, 1.724743, 0.1764706, 0, 1, 1,
0.4287744, 0.6135152, -0.240018, 0.1803922, 0, 1, 1,
0.4304711, 1.113404, 1.155065, 0.1882353, 0, 1, 1,
0.4334999, 0.4612138, 2.61512, 0.1921569, 0, 1, 1,
0.4398761, 0.4201585, 1.652161, 0.2, 0, 1, 1,
0.4406967, -1.759611, 4.103632, 0.2078431, 0, 1, 1,
0.4471699, 0.3864028, -0.1458294, 0.2117647, 0, 1, 1,
0.449687, -0.5984942, 1.512596, 0.2196078, 0, 1, 1,
0.4510043, 0.7475497, 0.2059223, 0.2235294, 0, 1, 1,
0.4515062, -0.3399566, 1.323307, 0.2313726, 0, 1, 1,
0.4571733, 0.1822968, 3.362188, 0.2352941, 0, 1, 1,
0.4573429, -1.274186, 3.183454, 0.2431373, 0, 1, 1,
0.4607772, 1.853133, 1.769809, 0.2470588, 0, 1, 1,
0.4616778, -0.2405699, 1.818775, 0.254902, 0, 1, 1,
0.4665508, -0.2731692, 1.427063, 0.2588235, 0, 1, 1,
0.467292, -1.998413, 3.107785, 0.2666667, 0, 1, 1,
0.4684486, 0.410909, 2.830567, 0.2705882, 0, 1, 1,
0.4731892, 1.024311, 1.224928, 0.2784314, 0, 1, 1,
0.4738724, 0.00910373, 2.97644, 0.282353, 0, 1, 1,
0.4768282, 0.09669587, 0.5529794, 0.2901961, 0, 1, 1,
0.4850468, -1.779211, 4.240062, 0.2941177, 0, 1, 1,
0.4876216, 0.2436458, 1.752347, 0.3019608, 0, 1, 1,
0.4966395, 0.4798799, 1.084848, 0.3098039, 0, 1, 1,
0.4967415, 0.3235241, 0.9036318, 0.3137255, 0, 1, 1,
0.5002898, 1.81561, -1.071072, 0.3215686, 0, 1, 1,
0.5079376, -0.4840421, 3.305002, 0.3254902, 0, 1, 1,
0.5115275, -0.5758173, 2.026546, 0.3333333, 0, 1, 1,
0.5116832, 0.08782858, 0.7310327, 0.3372549, 0, 1, 1,
0.513621, -2.29751, 3.116097, 0.345098, 0, 1, 1,
0.5137038, -0.08607332, 1.770459, 0.3490196, 0, 1, 1,
0.5147302, 0.4852798, -0.02851942, 0.3568628, 0, 1, 1,
0.5164695, -0.3746867, 3.688377, 0.3607843, 0, 1, 1,
0.5372557, -1.674016, 3.453779, 0.3686275, 0, 1, 1,
0.5372919, 0.611105, 2.04065, 0.372549, 0, 1, 1,
0.5386177, -0.8668444, 0.9588836, 0.3803922, 0, 1, 1,
0.5389204, 1.139734, -0.7174035, 0.3843137, 0, 1, 1,
0.5407954, -0.6632824, 3.354436, 0.3921569, 0, 1, 1,
0.5448542, 0.6800045, -0.8849382, 0.3960784, 0, 1, 1,
0.5484563, -0.5258704, 1.529307, 0.4039216, 0, 1, 1,
0.548484, 2.12745, 0.8076693, 0.4117647, 0, 1, 1,
0.5488516, 0.5751699, 0.6520973, 0.4156863, 0, 1, 1,
0.551578, -0.4450972, 4.491329, 0.4235294, 0, 1, 1,
0.5597165, 0.8465682, -0.5794407, 0.427451, 0, 1, 1,
0.5645765, -0.8437567, 3.588837, 0.4352941, 0, 1, 1,
0.5676451, -0.3466051, 1.352856, 0.4392157, 0, 1, 1,
0.571815, 0.4775414, 2.260363, 0.4470588, 0, 1, 1,
0.572151, -1.703439, 4.398236, 0.4509804, 0, 1, 1,
0.5729969, 0.1923414, 2.913006, 0.4588235, 0, 1, 1,
0.5835878, -0.4172427, 1.732453, 0.4627451, 0, 1, 1,
0.5847728, 0.9361517, 0.1734927, 0.4705882, 0, 1, 1,
0.5860455, 0.6092895, 1.24489, 0.4745098, 0, 1, 1,
0.5884895, 1.156101, 1.334375, 0.4823529, 0, 1, 1,
0.5926237, 1.08608, 0.4647847, 0.4862745, 0, 1, 1,
0.5951948, -0.4463722, 1.804132, 0.4941176, 0, 1, 1,
0.5952569, -0.4543206, 2.625811, 0.5019608, 0, 1, 1,
0.598094, 2.29009, -1.317708, 0.5058824, 0, 1, 1,
0.5987278, -1.849206, 3.467272, 0.5137255, 0, 1, 1,
0.5996826, -1.118736, 3.613157, 0.5176471, 0, 1, 1,
0.6045685, 0.5308958, 0.7823421, 0.5254902, 0, 1, 1,
0.6138971, -0.1800159, 1.083238, 0.5294118, 0, 1, 1,
0.6147422, 0.6117391, 0.6350924, 0.5372549, 0, 1, 1,
0.6201696, -1.053587, 2.686234, 0.5411765, 0, 1, 1,
0.620958, 0.01536415, 1.777984, 0.5490196, 0, 1, 1,
0.6230592, -0.1722491, 3.213654, 0.5529412, 0, 1, 1,
0.6253321, 0.1990039, -0.3525108, 0.5607843, 0, 1, 1,
0.6283712, 1.222225, 1.627493, 0.5647059, 0, 1, 1,
0.6284158, 1.312357, 2.275766, 0.572549, 0, 1, 1,
0.6323158, 1.07494, 0.1926535, 0.5764706, 0, 1, 1,
0.6356321, 0.4104055, 0.8403078, 0.5843138, 0, 1, 1,
0.6363167, 0.4977566, 0.6759863, 0.5882353, 0, 1, 1,
0.6378174, -1.381818, 1.156748, 0.5960785, 0, 1, 1,
0.6379113, 0.7835683, 1.667594, 0.6039216, 0, 1, 1,
0.640871, -0.6358638, 3.310726, 0.6078432, 0, 1, 1,
0.6409718, 0.8199034, 0.6174241, 0.6156863, 0, 1, 1,
0.6495219, 0.5408158, -0.3396832, 0.6196079, 0, 1, 1,
0.6503618, -0.1329675, 3.4231, 0.627451, 0, 1, 1,
0.6554686, 1.349881, 0.5293462, 0.6313726, 0, 1, 1,
0.6620843, 1.295601, 0.7367343, 0.6392157, 0, 1, 1,
0.6656749, -0.5675026, 4.079491, 0.6431373, 0, 1, 1,
0.6709885, -0.9053127, 1.75167, 0.6509804, 0, 1, 1,
0.6765631, -0.2240685, 3.971274, 0.654902, 0, 1, 1,
0.6811391, -2.273042, 2.937057, 0.6627451, 0, 1, 1,
0.6830238, -1.601498, 2.632431, 0.6666667, 0, 1, 1,
0.6841644, -0.2182028, 0.5969478, 0.6745098, 0, 1, 1,
0.6846262, 0.8686093, 1.446396, 0.6784314, 0, 1, 1,
0.6894415, -0.5281949, 3.293174, 0.6862745, 0, 1, 1,
0.694539, -1.731663, 1.58409, 0.6901961, 0, 1, 1,
0.6996285, 0.3825142, 0.2667798, 0.6980392, 0, 1, 1,
0.7010721, 0.7106102, 0.9194427, 0.7058824, 0, 1, 1,
0.705214, -0.04075049, 1.411044, 0.7098039, 0, 1, 1,
0.7069983, 0.5519282, -0.2143469, 0.7176471, 0, 1, 1,
0.7096127, -0.3952933, 1.056343, 0.7215686, 0, 1, 1,
0.7104607, 0.545624, -1.133263, 0.7294118, 0, 1, 1,
0.7120789, 0.4842793, 0.2100909, 0.7333333, 0, 1, 1,
0.713682, -0.3639786, 1.263579, 0.7411765, 0, 1, 1,
0.7185033, -0.157406, 0.8531515, 0.7450981, 0, 1, 1,
0.7289864, 0.9568563, 0.6201475, 0.7529412, 0, 1, 1,
0.7394146, 1.07482, 0.8753003, 0.7568628, 0, 1, 1,
0.7428571, -0.1155053, 2.546037, 0.7647059, 0, 1, 1,
0.7436118, 1.098821, 2.562809, 0.7686275, 0, 1, 1,
0.7472394, -0.5566459, 1.68082, 0.7764706, 0, 1, 1,
0.7586465, -1.878589, 1.328798, 0.7803922, 0, 1, 1,
0.7654424, -1.155627, 3.545236, 0.7882353, 0, 1, 1,
0.7722258, 0.06188153, -0.1440798, 0.7921569, 0, 1, 1,
0.773658, 0.3411205, 2.383888, 0.8, 0, 1, 1,
0.7754359, 0.6410175, 2.909217, 0.8078431, 0, 1, 1,
0.7756649, 1.081164, 2.573097, 0.8117647, 0, 1, 1,
0.7849725, -0.4517441, 2.03081, 0.8196079, 0, 1, 1,
0.7852494, 1.458992, 1.183758, 0.8235294, 0, 1, 1,
0.7915311, -0.7718259, 2.877933, 0.8313726, 0, 1, 1,
0.7947134, 0.5000182, 1.620153, 0.8352941, 0, 1, 1,
0.8015614, 2.086378, -1.261646, 0.8431373, 0, 1, 1,
0.8044893, 0.7995552, 0.7038969, 0.8470588, 0, 1, 1,
0.8116671, 0.3028944, 0.9951048, 0.854902, 0, 1, 1,
0.8134645, -0.2672925, 3.119014, 0.8588235, 0, 1, 1,
0.8153777, 1.066479, 0.5462501, 0.8666667, 0, 1, 1,
0.8159637, -0.2565763, -0.1103705, 0.8705882, 0, 1, 1,
0.8165934, 0.8222564, 1.034768, 0.8784314, 0, 1, 1,
0.8247654, -0.763545, 2.017632, 0.8823529, 0, 1, 1,
0.8315415, -2.173436, 1.35503, 0.8901961, 0, 1, 1,
0.8351018, 2.299424, -1.313396, 0.8941177, 0, 1, 1,
0.8420918, 0.06042412, 1.302768, 0.9019608, 0, 1, 1,
0.8499483, -0.0655834, 0.8240026, 0.9098039, 0, 1, 1,
0.8578033, -1.409431, 3.313071, 0.9137255, 0, 1, 1,
0.8598025, -0.2842795, 1.257281, 0.9215686, 0, 1, 1,
0.8607808, 0.3126485, 0.2909802, 0.9254902, 0, 1, 1,
0.8610908, 1.652322, -2.191895, 0.9333333, 0, 1, 1,
0.8678442, 0.09790403, 0.4113139, 0.9372549, 0, 1, 1,
0.8679256, 0.6977098, 1.140725, 0.945098, 0, 1, 1,
0.8702376, 0.4373717, 3.246263, 0.9490196, 0, 1, 1,
0.8719367, 0.6645936, -0.4583442, 0.9568627, 0, 1, 1,
0.8739775, -1.667037, 1.684355, 0.9607843, 0, 1, 1,
0.8766593, -1.655721, 1.939457, 0.9686275, 0, 1, 1,
0.8768047, -1.346674, 1.833867, 0.972549, 0, 1, 1,
0.8838586, -0.1194411, 1.453746, 0.9803922, 0, 1, 1,
0.8904837, -1.478364, 3.329561, 0.9843137, 0, 1, 1,
0.8954559, 0.2097767, 0.7189036, 0.9921569, 0, 1, 1,
0.8981065, -1.441353, 3.96831, 0.9960784, 0, 1, 1,
0.9040824, -1.444879, 2.78319, 1, 0, 0.9960784, 1,
0.9055885, -1.409165, 2.230012, 1, 0, 0.9882353, 1,
0.9114799, -1.252834, 2.327937, 1, 0, 0.9843137, 1,
0.9147848, 0.2109896, 3.188859, 1, 0, 0.9764706, 1,
0.9176674, 0.7214653, -1.098649, 1, 0, 0.972549, 1,
0.9186078, -1.941002, 2.949093, 1, 0, 0.9647059, 1,
0.919936, -0.7686278, 2.514717, 1, 0, 0.9607843, 1,
0.9253011, -0.5528738, 2.198421, 1, 0, 0.9529412, 1,
0.9296545, -2.821528, 1.617497, 1, 0, 0.9490196, 1,
0.9346012, -1.664027, 3.087365, 1, 0, 0.9411765, 1,
0.9350652, -0.3953682, 3.387912, 1, 0, 0.9372549, 1,
0.9355918, -0.7324203, 1.293811, 1, 0, 0.9294118, 1,
0.9475797, -1.143136, 0.2074468, 1, 0, 0.9254902, 1,
0.9485946, -0.02630189, 3.000046, 1, 0, 0.9176471, 1,
0.9532685, 0.1966683, 2.615014, 1, 0, 0.9137255, 1,
0.9790662, 0.1080555, 0.5222107, 1, 0, 0.9058824, 1,
0.9851088, 0.6122785, 1.689335, 1, 0, 0.9019608, 1,
0.9867445, -0.3386739, 1.175077, 1, 0, 0.8941177, 1,
0.9926379, -0.3190889, 1.155685, 1, 0, 0.8862745, 1,
0.9928312, 0.01641099, 2.175826, 1, 0, 0.8823529, 1,
0.9949784, -1.085991, 2.738787, 1, 0, 0.8745098, 1,
0.9970475, -0.4040999, 1.180295, 1, 0, 0.8705882, 1,
0.9976165, -0.1910189, 3.032247, 1, 0, 0.8627451, 1,
1.001483, 1.217699, 1.222066, 1, 0, 0.8588235, 1,
1.006662, 0.7196284, 1.948635, 1, 0, 0.8509804, 1,
1.009313, -1.430059, 2.425869, 1, 0, 0.8470588, 1,
1.010604, -1.672572, 2.158712, 1, 0, 0.8392157, 1,
1.028386, -1.949682, 3.095616, 1, 0, 0.8352941, 1,
1.03045, -1.784851, 1.030364, 1, 0, 0.827451, 1,
1.04263, -0.8362413, 1.48905, 1, 0, 0.8235294, 1,
1.048991, 1.184061, 0.8211049, 1, 0, 0.8156863, 1,
1.05663, 0.8237886, -1.374342, 1, 0, 0.8117647, 1,
1.058452, -0.5895769, 0.5783315, 1, 0, 0.8039216, 1,
1.058963, -0.4104452, 1.421116, 1, 0, 0.7960784, 1,
1.060158, 1.067956, -0.5717926, 1, 0, 0.7921569, 1,
1.06418, 0.7103968, 1.751543, 1, 0, 0.7843137, 1,
1.064669, 1.314315, 4.142354, 1, 0, 0.7803922, 1,
1.069499, -2.020497, 2.931417, 1, 0, 0.772549, 1,
1.08007, -0.1612177, 0.6411588, 1, 0, 0.7686275, 1,
1.091733, -0.20893, 1.729546, 1, 0, 0.7607843, 1,
1.09414, 0.2631318, 1.337162, 1, 0, 0.7568628, 1,
1.100565, 0.7280278, -0.4549117, 1, 0, 0.7490196, 1,
1.111972, 1.280921, -0.6912069, 1, 0, 0.7450981, 1,
1.11679, -0.7060074, 1.782288, 1, 0, 0.7372549, 1,
1.118279, 1.30318, -0.6176071, 1, 0, 0.7333333, 1,
1.119425, 0.3357265, 1.403016, 1, 0, 0.7254902, 1,
1.12539, 2.182261, 0.5918602, 1, 0, 0.7215686, 1,
1.135321, 0.1361944, 1.873726, 1, 0, 0.7137255, 1,
1.147311, 0.0516237, 2.292758, 1, 0, 0.7098039, 1,
1.159156, 2.379657, -0.6203256, 1, 0, 0.7019608, 1,
1.186608, 0.2191465, 2.131124, 1, 0, 0.6941177, 1,
1.19548, -0.8353713, 3.676613, 1, 0, 0.6901961, 1,
1.197351, -0.2945806, 0.9327571, 1, 0, 0.682353, 1,
1.198273, 1.022946, -1.184524, 1, 0, 0.6784314, 1,
1.21743, -0.5439841, 1.96311, 1, 0, 0.6705883, 1,
1.222414, 0.2192832, 2.083689, 1, 0, 0.6666667, 1,
1.226977, 0.1818748, 1.84208, 1, 0, 0.6588235, 1,
1.235638, -0.2559974, 0.6819035, 1, 0, 0.654902, 1,
1.241678, -0.2412578, 0.4296769, 1, 0, 0.6470588, 1,
1.247382, -0.7335104, 0.3627379, 1, 0, 0.6431373, 1,
1.247595, 0.9823313, 2.344593, 1, 0, 0.6352941, 1,
1.255438, -0.8507974, 3.348372, 1, 0, 0.6313726, 1,
1.256162, -1.089273, 2.249446, 1, 0, 0.6235294, 1,
1.264239, 0.7383369, 1.387365, 1, 0, 0.6196079, 1,
1.276464, -2.053613, 2.828476, 1, 0, 0.6117647, 1,
1.281995, 0.7639691, 0.902139, 1, 0, 0.6078432, 1,
1.294746, -1.258874, 4.353954, 1, 0, 0.6, 1,
1.297978, 0.9613317, 0.1075997, 1, 0, 0.5921569, 1,
1.300295, 0.4285389, 3.31114, 1, 0, 0.5882353, 1,
1.303262, -0.9335323, 2.451658, 1, 0, 0.5803922, 1,
1.304375, -1.624353, 2.697765, 1, 0, 0.5764706, 1,
1.311212, -0.3248577, 2.23302, 1, 0, 0.5686275, 1,
1.31861, -0.540951, 2.100249, 1, 0, 0.5647059, 1,
1.322884, 2.127948, -0.01953809, 1, 0, 0.5568628, 1,
1.327858, -0.004055596, 0.9383056, 1, 0, 0.5529412, 1,
1.3404, 1.149376, 3.239366, 1, 0, 0.5450981, 1,
1.359995, 1.273317, 0.921781, 1, 0, 0.5411765, 1,
1.364322, 1.915757, 0.4020129, 1, 0, 0.5333334, 1,
1.369139, -0.2125186, 0.6723384, 1, 0, 0.5294118, 1,
1.382083, -1.603423, 4.44628, 1, 0, 0.5215687, 1,
1.397067, -0.1313617, 0.9696821, 1, 0, 0.5176471, 1,
1.401463, -1.311347, 2.702662, 1, 0, 0.509804, 1,
1.414712, -1.893198, 0.3466614, 1, 0, 0.5058824, 1,
1.424396, -0.3117597, 1.194873, 1, 0, 0.4980392, 1,
1.432658, -0.362016, 1.96048, 1, 0, 0.4901961, 1,
1.432917, -0.3750457, 0.95486, 1, 0, 0.4862745, 1,
1.434462, 1.683065, 2.973607, 1, 0, 0.4784314, 1,
1.440103, -1.081722, 2.806012, 1, 0, 0.4745098, 1,
1.447538, -0.3349686, 2.33562, 1, 0, 0.4666667, 1,
1.46731, 0.06620987, 1.85165, 1, 0, 0.4627451, 1,
1.476492, 1.480249, 0.3115029, 1, 0, 0.454902, 1,
1.477252, -0.6812462, 0.7382758, 1, 0, 0.4509804, 1,
1.477344, -1.042474, 2.523946, 1, 0, 0.4431373, 1,
1.486091, 1.197984, -0.1391324, 1, 0, 0.4392157, 1,
1.488247, -1.381693, 0.7554269, 1, 0, 0.4313726, 1,
1.502562, -0.275102, 1.026811, 1, 0, 0.427451, 1,
1.505525, -1.794123, 1.600315, 1, 0, 0.4196078, 1,
1.506514, -0.7008263, 2.580221, 1, 0, 0.4156863, 1,
1.510698, 1.605416, 0.868252, 1, 0, 0.4078431, 1,
1.513636, -1.415663, 1.767202, 1, 0, 0.4039216, 1,
1.516313, -1.389072, 2.145375, 1, 0, 0.3960784, 1,
1.522113, -0.2436258, 1.546025, 1, 0, 0.3882353, 1,
1.536303, -0.755401, 1.613404, 1, 0, 0.3843137, 1,
1.548469, -0.4197839, 2.338078, 1, 0, 0.3764706, 1,
1.554071, -0.5935233, 3.745875, 1, 0, 0.372549, 1,
1.556064, 1.646129, -0.2767451, 1, 0, 0.3647059, 1,
1.557962, -0.8525719, 1.955154, 1, 0, 0.3607843, 1,
1.568771, -1.949479, 2.144421, 1, 0, 0.3529412, 1,
1.574625, 0.6335291, 1.695246, 1, 0, 0.3490196, 1,
1.594427, -0.931217, 3.084061, 1, 0, 0.3411765, 1,
1.595632, -0.1959528, 1.785201, 1, 0, 0.3372549, 1,
1.595749, 1.268358, 2.041029, 1, 0, 0.3294118, 1,
1.608857, -0.1943766, 1.703455, 1, 0, 0.3254902, 1,
1.619364, 1.189406, 2.361565, 1, 0, 0.3176471, 1,
1.622915, -1.903442, 2.434613, 1, 0, 0.3137255, 1,
1.629401, 1.218538, 0.5326405, 1, 0, 0.3058824, 1,
1.674767, -1.245868, 1.067407, 1, 0, 0.2980392, 1,
1.681698, -0.9663104, 2.242136, 1, 0, 0.2941177, 1,
1.689578, 0.5347639, 0.9668059, 1, 0, 0.2862745, 1,
1.700832, -0.9907146, 2.505616, 1, 0, 0.282353, 1,
1.705105, 0.3634448, -0.508518, 1, 0, 0.2745098, 1,
1.711118, 0.130031, 1.907902, 1, 0, 0.2705882, 1,
1.71196, 1.222292, 1.280669, 1, 0, 0.2627451, 1,
1.713249, 1.392672, 0.2195891, 1, 0, 0.2588235, 1,
1.726232, -0.6792413, 1.043278, 1, 0, 0.2509804, 1,
1.732148, -0.2924963, 2.056027, 1, 0, 0.2470588, 1,
1.734259, -0.9955428, 3.871996, 1, 0, 0.2392157, 1,
1.739188, 0.134114, 1.815784, 1, 0, 0.2352941, 1,
1.76352, -0.4661748, 2.140993, 1, 0, 0.227451, 1,
1.767326, 1.066768, 3.032806, 1, 0, 0.2235294, 1,
1.811958, 0.3442982, 3.522121, 1, 0, 0.2156863, 1,
1.864963, -0.2904196, 1.498408, 1, 0, 0.2117647, 1,
1.875468, -0.3172817, 2.07743, 1, 0, 0.2039216, 1,
1.946408, -0.5092017, 1.258908, 1, 0, 0.1960784, 1,
1.948571, 0.5075064, 1.897734, 1, 0, 0.1921569, 1,
1.94913, 0.7685705, 1.449854, 1, 0, 0.1843137, 1,
1.981775, 0.5121592, 1.025456, 1, 0, 0.1803922, 1,
2.000436, 0.1679974, 0.8956922, 1, 0, 0.172549, 1,
2.005488, -0.2812179, 1.65282, 1, 0, 0.1686275, 1,
2.030551, -2.117613, 3.627562, 1, 0, 0.1607843, 1,
2.039683, 1.427387, 2.339542, 1, 0, 0.1568628, 1,
2.045055, -0.585332, 1.098746, 1, 0, 0.1490196, 1,
2.076645, -0.5215176, 1.579431, 1, 0, 0.145098, 1,
2.081552, 0.9292889, 1.870686, 1, 0, 0.1372549, 1,
2.099026, 2.246557, 0.03960134, 1, 0, 0.1333333, 1,
2.121547, 1.243878, 1.92095, 1, 0, 0.1254902, 1,
2.14955, -1.478033, 0.7105647, 1, 0, 0.1215686, 1,
2.185533, -0.8526571, 2.729309, 1, 0, 0.1137255, 1,
2.211487, -1.006359, 4.359514, 1, 0, 0.1098039, 1,
2.231166, 0.8668045, 0.7115315, 1, 0, 0.1019608, 1,
2.238001, -0.894625, 1.621389, 1, 0, 0.09411765, 1,
2.24806, 0.6904345, -0.2703192, 1, 0, 0.09019608, 1,
2.278881, -0.4644644, 1.831789, 1, 0, 0.08235294, 1,
2.282123, 1.020192, 1.131346, 1, 0, 0.07843138, 1,
2.318155, -1.640221, 1.044194, 1, 0, 0.07058824, 1,
2.336341, -0.7577803, 2.982522, 1, 0, 0.06666667, 1,
2.338972, 1.241085, -0.3540666, 1, 0, 0.05882353, 1,
2.367644, -1.683782, 1.60198, 1, 0, 0.05490196, 1,
2.400516, -0.299151, 0.3137462, 1, 0, 0.04705882, 1,
2.515269, 0.9164441, 1.086515, 1, 0, 0.04313726, 1,
2.592723, 0.02218409, 2.755297, 1, 0, 0.03529412, 1,
2.773732, -1.613055, 2.405122, 1, 0, 0.03137255, 1,
2.866246, 1.531505, 1.554627, 1, 0, 0.02352941, 1,
2.955972, 0.5996155, 0.3873484, 1, 0, 0.01960784, 1,
3.428923, -0.3268755, 0.1043416, 1, 0, 0.01176471, 1,
3.671265, -0.2733093, 2.806588, 1, 0, 0.007843138, 1
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
0.1110643, -3.814311, -8.057425, 0, -0.5, 0.5, 0.5,
0.1110643, -3.814311, -8.057425, 1, -0.5, 0.5, 0.5,
0.1110643, -3.814311, -8.057425, 1, 1.5, 0.5, 0.5,
0.1110643, -3.814311, -8.057425, 0, 1.5, 0.5, 0.5
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
-4.656044, 0.1070347, -8.057425, 0, -0.5, 0.5, 0.5,
-4.656044, 0.1070347, -8.057425, 1, -0.5, 0.5, 0.5,
-4.656044, 0.1070347, -8.057425, 1, 1.5, 0.5, 0.5,
-4.656044, 0.1070347, -8.057425, 0, 1.5, 0.5, 0.5
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
-4.656044, -3.814311, -0.672013, 0, -0.5, 0.5, 0.5,
-4.656044, -3.814311, -0.672013, 1, -0.5, 0.5, 0.5,
-4.656044, -3.814311, -0.672013, 1, 1.5, 0.5, 0.5,
-4.656044, -3.814311, -0.672013, 0, 1.5, 0.5, 0.5
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
-2, -2.909385, -6.353099,
2, -2.909385, -6.353099,
-2, -2.909385, -6.353099,
-2, -3.060206, -6.637154,
0, -2.909385, -6.353099,
0, -3.060206, -6.637154,
2, -2.909385, -6.353099,
2, -3.060206, -6.637154
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
-2, -3.361848, -7.205262, 0, -0.5, 0.5, 0.5,
-2, -3.361848, -7.205262, 1, -0.5, 0.5, 0.5,
-2, -3.361848, -7.205262, 1, 1.5, 0.5, 0.5,
-2, -3.361848, -7.205262, 0, 1.5, 0.5, 0.5,
0, -3.361848, -7.205262, 0, -0.5, 0.5, 0.5,
0, -3.361848, -7.205262, 1, -0.5, 0.5, 0.5,
0, -3.361848, -7.205262, 1, 1.5, 0.5, 0.5,
0, -3.361848, -7.205262, 0, 1.5, 0.5, 0.5,
2, -3.361848, -7.205262, 0, -0.5, 0.5, 0.5,
2, -3.361848, -7.205262, 1, -0.5, 0.5, 0.5,
2, -3.361848, -7.205262, 1, 1.5, 0.5, 0.5,
2, -3.361848, -7.205262, 0, 1.5, 0.5, 0.5
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
-3.555942, -2, -6.353099,
-3.555942, 3, -6.353099,
-3.555942, -2, -6.353099,
-3.739292, -2, -6.637154,
-3.555942, -1, -6.353099,
-3.739292, -1, -6.637154,
-3.555942, 0, -6.353099,
-3.739292, 0, -6.637154,
-3.555942, 1, -6.353099,
-3.739292, 1, -6.637154,
-3.555942, 2, -6.353099,
-3.739292, 2, -6.637154,
-3.555942, 3, -6.353099,
-3.739292, 3, -6.637154
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
-4.105993, -2, -7.205262, 0, -0.5, 0.5, 0.5,
-4.105993, -2, -7.205262, 1, -0.5, 0.5, 0.5,
-4.105993, -2, -7.205262, 1, 1.5, 0.5, 0.5,
-4.105993, -2, -7.205262, 0, 1.5, 0.5, 0.5,
-4.105993, -1, -7.205262, 0, -0.5, 0.5, 0.5,
-4.105993, -1, -7.205262, 1, -0.5, 0.5, 0.5,
-4.105993, -1, -7.205262, 1, 1.5, 0.5, 0.5,
-4.105993, -1, -7.205262, 0, 1.5, 0.5, 0.5,
-4.105993, 0, -7.205262, 0, -0.5, 0.5, 0.5,
-4.105993, 0, -7.205262, 1, -0.5, 0.5, 0.5,
-4.105993, 0, -7.205262, 1, 1.5, 0.5, 0.5,
-4.105993, 0, -7.205262, 0, 1.5, 0.5, 0.5,
-4.105993, 1, -7.205262, 0, -0.5, 0.5, 0.5,
-4.105993, 1, -7.205262, 1, -0.5, 0.5, 0.5,
-4.105993, 1, -7.205262, 1, 1.5, 0.5, 0.5,
-4.105993, 1, -7.205262, 0, 1.5, 0.5, 0.5,
-4.105993, 2, -7.205262, 0, -0.5, 0.5, 0.5,
-4.105993, 2, -7.205262, 1, -0.5, 0.5, 0.5,
-4.105993, 2, -7.205262, 1, 1.5, 0.5, 0.5,
-4.105993, 2, -7.205262, 0, 1.5, 0.5, 0.5,
-4.105993, 3, -7.205262, 0, -0.5, 0.5, 0.5,
-4.105993, 3, -7.205262, 1, -0.5, 0.5, 0.5,
-4.105993, 3, -7.205262, 1, 1.5, 0.5, 0.5,
-4.105993, 3, -7.205262, 0, 1.5, 0.5, 0.5
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
-3.555942, -2.909385, -6,
-3.555942, -2.909385, 4,
-3.555942, -2.909385, -6,
-3.739292, -3.060206, -6,
-3.555942, -2.909385, -4,
-3.739292, -3.060206, -4,
-3.555942, -2.909385, -2,
-3.739292, -3.060206, -2,
-3.555942, -2.909385, 0,
-3.739292, -3.060206, 0,
-3.555942, -2.909385, 2,
-3.739292, -3.060206, 2,
-3.555942, -2.909385, 4,
-3.739292, -3.060206, 4
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
-4.105993, -3.361848, -6, 0, -0.5, 0.5, 0.5,
-4.105993, -3.361848, -6, 1, -0.5, 0.5, 0.5,
-4.105993, -3.361848, -6, 1, 1.5, 0.5, 0.5,
-4.105993, -3.361848, -6, 0, 1.5, 0.5, 0.5,
-4.105993, -3.361848, -4, 0, -0.5, 0.5, 0.5,
-4.105993, -3.361848, -4, 1, -0.5, 0.5, 0.5,
-4.105993, -3.361848, -4, 1, 1.5, 0.5, 0.5,
-4.105993, -3.361848, -4, 0, 1.5, 0.5, 0.5,
-4.105993, -3.361848, -2, 0, -0.5, 0.5, 0.5,
-4.105993, -3.361848, -2, 1, -0.5, 0.5, 0.5,
-4.105993, -3.361848, -2, 1, 1.5, 0.5, 0.5,
-4.105993, -3.361848, -2, 0, 1.5, 0.5, 0.5,
-4.105993, -3.361848, 0, 0, -0.5, 0.5, 0.5,
-4.105993, -3.361848, 0, 1, -0.5, 0.5, 0.5,
-4.105993, -3.361848, 0, 1, 1.5, 0.5, 0.5,
-4.105993, -3.361848, 0, 0, 1.5, 0.5, 0.5,
-4.105993, -3.361848, 2, 0, -0.5, 0.5, 0.5,
-4.105993, -3.361848, 2, 1, -0.5, 0.5, 0.5,
-4.105993, -3.361848, 2, 1, 1.5, 0.5, 0.5,
-4.105993, -3.361848, 2, 0, 1.5, 0.5, 0.5,
-4.105993, -3.361848, 4, 0, -0.5, 0.5, 0.5,
-4.105993, -3.361848, 4, 1, -0.5, 0.5, 0.5,
-4.105993, -3.361848, 4, 1, 1.5, 0.5, 0.5,
-4.105993, -3.361848, 4, 0, 1.5, 0.5, 0.5
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
-3.555942, -2.909385, -6.353099,
-3.555942, 3.123455, -6.353099,
-3.555942, -2.909385, 5.009073,
-3.555942, 3.123455, 5.009073,
-3.555942, -2.909385, -6.353099,
-3.555942, -2.909385, 5.009073,
-3.555942, 3.123455, -6.353099,
-3.555942, 3.123455, 5.009073,
-3.555942, -2.909385, -6.353099,
3.778071, -2.909385, -6.353099,
-3.555942, -2.909385, 5.009073,
3.778071, -2.909385, 5.009073,
-3.555942, 3.123455, -6.353099,
3.778071, 3.123455, -6.353099,
-3.555942, 3.123455, 5.009073,
3.778071, 3.123455, 5.009073,
3.778071, -2.909385, -6.353099,
3.778071, 3.123455, -6.353099,
3.778071, -2.909385, 5.009073,
3.778071, 3.123455, 5.009073,
3.778071, -2.909385, -6.353099,
3.778071, -2.909385, 5.009073,
3.778071, 3.123455, -6.353099,
3.778071, 3.123455, 5.009073
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
var radius = 7.907275;
var distance = 35.18036;
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
mvMatrix.translate( -0.1110643, -0.1070347, 0.672013 );
mvMatrix.scale( 1.165733, 1.41716, 0.752453 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.18036);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Pirimicarb<-read.table("Pirimicarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Pirimicarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Pirimicarb' not found
```

```r
y<-Pirimicarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Pirimicarb' not found
```

```r
z<-Pirimicarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Pirimicarb' not found
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
-3.449136, 0.9087356, -0.8691013, 0, 0, 1, 1, 1,
-3.369434, -0.8111066, -0.1359626, 1, 0, 0, 1, 1,
-3.351778, -0.3368884, -0.5344496, 1, 0, 0, 1, 1,
-2.728419, -0.2443954, -0.3450185, 1, 0, 0, 1, 1,
-2.557976, 0.3866832, -1.908162, 1, 0, 0, 1, 1,
-2.494329, 0.9168481, -3.580547, 1, 0, 0, 1, 1,
-2.487813, 0.7600564, -0.3690903, 0, 0, 0, 1, 1,
-2.417069, -0.7369834, -1.425927, 0, 0, 0, 1, 1,
-2.382489, 1.097887, -2.196519, 0, 0, 0, 1, 1,
-2.348851, -1.548227, -4.241155, 0, 0, 0, 1, 1,
-2.328457, -0.02414812, -1.674894, 0, 0, 0, 1, 1,
-2.30149, 0.4102229, -1.576717, 0, 0, 0, 1, 1,
-2.252031, -0.3739106, -1.803694, 0, 0, 0, 1, 1,
-2.251826, -0.6866712, -3.022601, 1, 1, 1, 1, 1,
-2.246548, -0.4218174, -3.077311, 1, 1, 1, 1, 1,
-2.239121, -0.8086807, -2.179894, 1, 1, 1, 1, 1,
-2.16377, 0.2829701, -0.3768136, 1, 1, 1, 1, 1,
-2.130814, 0.2177526, -2.395865, 1, 1, 1, 1, 1,
-2.125323, -0.6907145, -1.230528, 1, 1, 1, 1, 1,
-2.120195, -0.004955882, -2.145212, 1, 1, 1, 1, 1,
-2.081332, 0.2190071, -1.499485, 1, 1, 1, 1, 1,
-2.069648, -0.7015111, -2.97375, 1, 1, 1, 1, 1,
-2.065077, 0.2620663, -1.23517, 1, 1, 1, 1, 1,
-2.034682, -0.08437262, -1.194037, 1, 1, 1, 1, 1,
-2.02986, -0.1727006, -2.513558, 1, 1, 1, 1, 1,
-2.029859, -0.08597613, -2.041507, 1, 1, 1, 1, 1,
-2.008116, -1.471443, -3.087895, 1, 1, 1, 1, 1,
-1.996871, 0.254261, -1.93385, 1, 1, 1, 1, 1,
-1.992861, -0.3390293, -2.344566, 0, 0, 1, 1, 1,
-1.975299, 0.351007, -0.4247494, 1, 0, 0, 1, 1,
-1.939649, -1.250528, -3.264071, 1, 0, 0, 1, 1,
-1.914277, -0.9218499, -2.274528, 1, 0, 0, 1, 1,
-1.90568, 1.151491, -0.05901483, 1, 0, 0, 1, 1,
-1.899873, -0.280788, -1.878333, 1, 0, 0, 1, 1,
-1.896523, -0.2013684, 0.130223, 0, 0, 0, 1, 1,
-1.88986, -0.4608446, -3.183078, 0, 0, 0, 1, 1,
-1.880949, -0.06710534, -1.415603, 0, 0, 0, 1, 1,
-1.872326, 0.07220531, -1.345014, 0, 0, 0, 1, 1,
-1.869792, 1.383655, -1.641214, 0, 0, 0, 1, 1,
-1.869504, 0.6334045, -1.67119, 0, 0, 0, 1, 1,
-1.860471, -0.8299873, -1.469247, 0, 0, 0, 1, 1,
-1.852166, 0.08747754, -1.3783, 1, 1, 1, 1, 1,
-1.827037, 0.5734769, -0.6095577, 1, 1, 1, 1, 1,
-1.819293, 1.421729, -1.653665, 1, 1, 1, 1, 1,
-1.816868, -1.898514, -3.256057, 1, 1, 1, 1, 1,
-1.80541, 0.6744975, 0.3047927, 1, 1, 1, 1, 1,
-1.796658, -0.5334492, -0.4211043, 1, 1, 1, 1, 1,
-1.768311, 0.9225577, 0.1349089, 1, 1, 1, 1, 1,
-1.753212, 0.6923993, -0.439505, 1, 1, 1, 1, 1,
-1.747792, 0.7701708, -0.4890494, 1, 1, 1, 1, 1,
-1.741386, -0.5380563, -0.8502015, 1, 1, 1, 1, 1,
-1.740859, -0.2532015, -3.296477, 1, 1, 1, 1, 1,
-1.727319, 1.004548, -1.475262, 1, 1, 1, 1, 1,
-1.717963, 0.2302722, -1.523091, 1, 1, 1, 1, 1,
-1.694368, 0.739947, -1.894272, 1, 1, 1, 1, 1,
-1.679047, 1.283389, -0.292503, 1, 1, 1, 1, 1,
-1.67471, 1.13379, -1.195477, 0, 0, 1, 1, 1,
-1.652754, -1.500273, -3.326452, 1, 0, 0, 1, 1,
-1.65008, 0.6733513, -1.772985, 1, 0, 0, 1, 1,
-1.634622, 0.8470921, -2.543672, 1, 0, 0, 1, 1,
-1.629465, -1.536611, -1.867327, 1, 0, 0, 1, 1,
-1.628774, -0.4902118, -0.654865, 1, 0, 0, 1, 1,
-1.623093, 0.4320317, -3.372341, 0, 0, 0, 1, 1,
-1.619551, 0.7701645, -1.988442, 0, 0, 0, 1, 1,
-1.607334, -0.216482, -3.595549, 0, 0, 0, 1, 1,
-1.604437, -0.1180282, -3.623337, 0, 0, 0, 1, 1,
-1.601284, 0.9741149, -0.6528709, 0, 0, 0, 1, 1,
-1.587899, 0.6502559, -0.07079495, 0, 0, 0, 1, 1,
-1.567072, 1.578403, 0.06780103, 0, 0, 0, 1, 1,
-1.560618, -0.6221529, -3.328256, 1, 1, 1, 1, 1,
-1.558969, 1.272417, -0.6133339, 1, 1, 1, 1, 1,
-1.554476, 1.490781, 1.672028, 1, 1, 1, 1, 1,
-1.546932, 0.955135, -2.227004, 1, 1, 1, 1, 1,
-1.54403, 0.1591572, -3.209414, 1, 1, 1, 1, 1,
-1.543878, 1.919268, -0.1535794, 1, 1, 1, 1, 1,
-1.530732, 2.384171, -2.393996, 1, 1, 1, 1, 1,
-1.526224, -1.470082, -1.089294, 1, 1, 1, 1, 1,
-1.515671, 1.587608, -0.3592259, 1, 1, 1, 1, 1,
-1.498248, -2.062838, -3.096237, 1, 1, 1, 1, 1,
-1.489947, -0.4657837, -2.390854, 1, 1, 1, 1, 1,
-1.479392, -0.2151427, -0.4963468, 1, 1, 1, 1, 1,
-1.473523, 1.955199, -1.784681, 1, 1, 1, 1, 1,
-1.465978, -0.7845293, -2.518598, 1, 1, 1, 1, 1,
-1.460117, -0.9242015, -3.076707, 1, 1, 1, 1, 1,
-1.429719, 1.656549, -1.496333, 0, 0, 1, 1, 1,
-1.427028, -0.234165, -2.148738, 1, 0, 0, 1, 1,
-1.416904, -1.297714, -3.619754, 1, 0, 0, 1, 1,
-1.408549, 0.6183408, -0.5712339, 1, 0, 0, 1, 1,
-1.401179, -0.3445964, 0.7410985, 1, 0, 0, 1, 1,
-1.385981, 0.3669825, -2.194427, 1, 0, 0, 1, 1,
-1.359632, -0.11728, -2.779571, 0, 0, 0, 1, 1,
-1.346652, 0.7404487, -1.434311, 0, 0, 0, 1, 1,
-1.332336, -1.197751, -1.601883, 0, 0, 0, 1, 1,
-1.32658, 1.838454, -0.1510755, 0, 0, 0, 1, 1,
-1.322982, -0.5581971, -0.5624012, 0, 0, 0, 1, 1,
-1.317147, 0.2075479, -1.782453, 0, 0, 0, 1, 1,
-1.31288, 2.251538, -0.2308154, 0, 0, 0, 1, 1,
-1.307603, 0.1648626, -1.387248, 1, 1, 1, 1, 1,
-1.304128, -1.1775, -0.5395413, 1, 1, 1, 1, 1,
-1.3006, 1.305905, -2.49243, 1, 1, 1, 1, 1,
-1.291197, -0.006327659, -1.66692, 1, 1, 1, 1, 1,
-1.285104, -0.6805789, -2.67291, 1, 1, 1, 1, 1,
-1.283932, -0.5668887, -1.957521, 1, 1, 1, 1, 1,
-1.277309, -0.6726311, -3.338278, 1, 1, 1, 1, 1,
-1.270876, -1.170151, -1.800933, 1, 1, 1, 1, 1,
-1.261516, 1.234092, -0.5971661, 1, 1, 1, 1, 1,
-1.255586, 0.9638879, -0.573441, 1, 1, 1, 1, 1,
-1.254404, -0.2685398, -1.774331, 1, 1, 1, 1, 1,
-1.246018, -0.02217012, 1.214201, 1, 1, 1, 1, 1,
-1.237829, -1.397909, -2.884055, 1, 1, 1, 1, 1,
-1.236951, 0.2026527, -1.528648, 1, 1, 1, 1, 1,
-1.221154, -1.91421, -1.741864, 1, 1, 1, 1, 1,
-1.217729, -0.04858982, -2.323669, 0, 0, 1, 1, 1,
-1.214511, -0.5553665, -2.180637, 1, 0, 0, 1, 1,
-1.210501, -0.852871, -2.162987, 1, 0, 0, 1, 1,
-1.210387, 0.8987398, -0.07688533, 1, 0, 0, 1, 1,
-1.209578, -0.212664, -2.005773, 1, 0, 0, 1, 1,
-1.209409, -0.7616853, -3.185198, 1, 0, 0, 1, 1,
-1.20829, 2.23734, 0.8623441, 0, 0, 0, 1, 1,
-1.206559, -0.198576, -2.338656, 0, 0, 0, 1, 1,
-1.205964, 0.01854987, -1.076869, 0, 0, 0, 1, 1,
-1.193678, -0.07042077, -0.6256396, 0, 0, 0, 1, 1,
-1.182455, -0.02303621, -0.6040741, 0, 0, 0, 1, 1,
-1.169091, 0.3905716, 0.6115406, 0, 0, 0, 1, 1,
-1.165491, -1.335005, -2.544007, 0, 0, 0, 1, 1,
-1.159481, -0.8036808, -3.297812, 1, 1, 1, 1, 1,
-1.159208, -0.5722455, -2.157135, 1, 1, 1, 1, 1,
-1.153242, 0.9087949, -1.251832, 1, 1, 1, 1, 1,
-1.145449, 0.08070981, -0.9330647, 1, 1, 1, 1, 1,
-1.14033, 1.265886, -0.06124011, 1, 1, 1, 1, 1,
-1.13245, -1.127488, -2.586648, 1, 1, 1, 1, 1,
-1.131848, 0.1208491, -1.629689, 1, 1, 1, 1, 1,
-1.129556, 0.4523858, -0.7316005, 1, 1, 1, 1, 1,
-1.126392, -0.5181791, -1.984822, 1, 1, 1, 1, 1,
-1.120214, -1.1196, -3.505912, 1, 1, 1, 1, 1,
-1.117346, 0.7302433, -0.308744, 1, 1, 1, 1, 1,
-1.1106, 0.6311505, -0.001714879, 1, 1, 1, 1, 1,
-1.106495, -0.003632212, -0.04772424, 1, 1, 1, 1, 1,
-1.102668, 1.274547, 0.2176526, 1, 1, 1, 1, 1,
-1.102506, -1.13781, -2.219074, 1, 1, 1, 1, 1,
-1.10081, 0.6290441, -1.393787, 0, 0, 1, 1, 1,
-1.09771, 0.9060215, 0.6202904, 1, 0, 0, 1, 1,
-1.089581, 0.1264348, -0.1386602, 1, 0, 0, 1, 1,
-1.083207, -0.7013804, -3.374042, 1, 0, 0, 1, 1,
-1.076989, -0.1642595, -2.05352, 1, 0, 0, 1, 1,
-1.072341, 0.3013233, -0.1575406, 1, 0, 0, 1, 1,
-1.06864, -1.273722, -3.296672, 0, 0, 0, 1, 1,
-1.064562, 0.3867732, -0.4956208, 0, 0, 0, 1, 1,
-1.059314, -1.260689, -0.7030837, 0, 0, 0, 1, 1,
-1.052195, 1.185024, -1.168493, 0, 0, 0, 1, 1,
-1.049473, 0.08596359, -2.362864, 0, 0, 0, 1, 1,
-1.039936, 0.7468006, 0.004737033, 0, 0, 0, 1, 1,
-1.034036, 0.5058635, -1.376432, 0, 0, 0, 1, 1,
-1.029864, 0.1471873, -2.124269, 1, 1, 1, 1, 1,
-1.028053, 0.4513293, -0.7834731, 1, 1, 1, 1, 1,
-1.023916, 0.9926105, -0.2097087, 1, 1, 1, 1, 1,
-1.020033, -1.114916, -3.686574, 1, 1, 1, 1, 1,
-1.017753, 1.827333, -1.2152, 1, 1, 1, 1, 1,
-1.013616, -0.06145191, -1.989773, 1, 1, 1, 1, 1,
-1.010723, 0.06633537, -1.963924, 1, 1, 1, 1, 1,
-1.009158, 0.1722842, -1.097159, 1, 1, 1, 1, 1,
-1.008188, -0.2521165, -2.035246, 1, 1, 1, 1, 1,
-0.9995151, 0.007277661, -1.302572, 1, 1, 1, 1, 1,
-0.97921, 0.2366456, -1.00829, 1, 1, 1, 1, 1,
-0.9686026, -0.2192937, -2.661741, 1, 1, 1, 1, 1,
-0.9587178, -1.26629, -1.663852, 1, 1, 1, 1, 1,
-0.9508346, -0.5473104, -3.587733, 1, 1, 1, 1, 1,
-0.9452628, -0.3328848, -1.930769, 1, 1, 1, 1, 1,
-0.9443574, 0.5966855, -1.367417, 0, 0, 1, 1, 1,
-0.9429386, -0.06409866, -1.691716, 1, 0, 0, 1, 1,
-0.9388348, 0.7080092, -0.9826893, 1, 0, 0, 1, 1,
-0.93844, 1.307709, -3.803876, 1, 0, 0, 1, 1,
-0.9369546, 0.1468714, -2.111986, 1, 0, 0, 1, 1,
-0.9318693, -0.1222165, -2.232889, 1, 0, 0, 1, 1,
-0.9306132, 0.658613, -0.543995, 0, 0, 0, 1, 1,
-0.9258415, 0.7241583, -1.804918, 0, 0, 0, 1, 1,
-0.919863, 1.184954, -0.6117797, 0, 0, 0, 1, 1,
-0.9171101, -0.104374, -1.508063, 0, 0, 0, 1, 1,
-0.9167243, 0.5175126, -1.154405, 0, 0, 0, 1, 1,
-0.9157501, -1.080016, -2.281002, 0, 0, 0, 1, 1,
-0.9140216, 1.9597, -0.6676192, 0, 0, 0, 1, 1,
-0.9136419, -1.218226, -3.060304, 1, 1, 1, 1, 1,
-0.9128674, -1.368997, -1.927409, 1, 1, 1, 1, 1,
-0.9040643, 0.4022743, 0.9606524, 1, 1, 1, 1, 1,
-0.8871248, -0.1969945, -2.929022, 1, 1, 1, 1, 1,
-0.8835636, -0.5673416, -1.834429, 1, 1, 1, 1, 1,
-0.8807856, -0.9443865, -3.958396, 1, 1, 1, 1, 1,
-0.8759308, 0.1522935, -2.001797, 1, 1, 1, 1, 1,
-0.8753468, -0.1667271, -1.525682, 1, 1, 1, 1, 1,
-0.8750814, 0.3066957, 0.5316703, 1, 1, 1, 1, 1,
-0.8725612, -0.01169278, -4.45921, 1, 1, 1, 1, 1,
-0.868113, 0.5696098, 0.4545719, 1, 1, 1, 1, 1,
-0.8672282, -0.6324512, -1.444049, 1, 1, 1, 1, 1,
-0.8667836, 0.1670059, -1.419432, 1, 1, 1, 1, 1,
-0.8651486, 1.692135, -1.215082, 1, 1, 1, 1, 1,
-0.8644773, -0.4261878, -1.726048, 1, 1, 1, 1, 1,
-0.8620622, 1.04865, 0.5473543, 0, 0, 1, 1, 1,
-0.8542225, -0.2092645, -0.7188168, 1, 0, 0, 1, 1,
-0.8473542, 2.52253, 1.107254, 1, 0, 0, 1, 1,
-0.8473498, 0.09388599, -1.463292, 1, 0, 0, 1, 1,
-0.8461049, 0.3926028, -1.128286, 1, 0, 0, 1, 1,
-0.8457692, 0.5366612, -1.110852, 1, 0, 0, 1, 1,
-0.8437505, -1.060073, -2.648206, 0, 0, 0, 1, 1,
-0.8418416, 0.1194851, -1.0908, 0, 0, 0, 1, 1,
-0.8408983, -0.1371551, -3.759858, 0, 0, 0, 1, 1,
-0.8368118, -0.2696675, -3.225719, 0, 0, 0, 1, 1,
-0.8357997, 1.703456, -3.020816, 0, 0, 0, 1, 1,
-0.8349959, -1.819715, -0.8977883, 0, 0, 0, 1, 1,
-0.8340172, 0.1106577, -0.1804784, 0, 0, 0, 1, 1,
-0.8321466, -1.36764, -2.893838, 1, 1, 1, 1, 1,
-0.8305532, 0.9488568, -0.1738435, 1, 1, 1, 1, 1,
-0.8232325, 0.8720162, -0.6579713, 1, 1, 1, 1, 1,
-0.8211297, -0.8080818, -1.921911, 1, 1, 1, 1, 1,
-0.8208552, -0.1457482, -1.468037, 1, 1, 1, 1, 1,
-0.8108069, -0.9058405, -2.544157, 1, 1, 1, 1, 1,
-0.8071967, 0.1955915, -0.4600556, 1, 1, 1, 1, 1,
-0.8065005, -0.1666234, -0.5234959, 1, 1, 1, 1, 1,
-0.8057684, -1.424835, -3.316219, 1, 1, 1, 1, 1,
-0.802367, -1.0056, -3.799452, 1, 1, 1, 1, 1,
-0.7930511, -0.5448635, -2.560997, 1, 1, 1, 1, 1,
-0.7922804, -0.3293241, -2.926721, 1, 1, 1, 1, 1,
-0.7887822, -0.7986484, -1.661692, 1, 1, 1, 1, 1,
-0.78866, -0.2471799, -3.41063, 1, 1, 1, 1, 1,
-0.787512, 0.07592883, -1.414811, 1, 1, 1, 1, 1,
-0.7866807, 0.8176782, -0.8199288, 0, 0, 1, 1, 1,
-0.7857189, -0.423459, -1.992082, 1, 0, 0, 1, 1,
-0.784099, 0.8709376, -0.7311382, 1, 0, 0, 1, 1,
-0.783331, -0.9826264, -1.415951, 1, 0, 0, 1, 1,
-0.7794298, -0.9692865, -2.020578, 1, 0, 0, 1, 1,
-0.777882, -0.7242782, -2.050601, 1, 0, 0, 1, 1,
-0.7753832, -0.01621317, -2.060641, 0, 0, 0, 1, 1,
-0.771422, -0.05038933, -2.171225, 0, 0, 0, 1, 1,
-0.7647858, 1.221419, -0.9307561, 0, 0, 0, 1, 1,
-0.7540601, -1.287306, -1.064507, 0, 0, 0, 1, 1,
-0.7509416, 0.8836794, -1.533882, 0, 0, 0, 1, 1,
-0.7484051, -0.2045085, 0.3488887, 0, 0, 0, 1, 1,
-0.7472775, 3.035598, 1.139728, 0, 0, 0, 1, 1,
-0.7418438, -1.190222, -2.356445, 1, 1, 1, 1, 1,
-0.7404684, -0.7521175, -1.883561, 1, 1, 1, 1, 1,
-0.7404629, -0.538822, -3.086182, 1, 1, 1, 1, 1,
-0.7379946, -1.269126, -1.874819, 1, 1, 1, 1, 1,
-0.7335757, 0.9583248, -0.9493886, 1, 1, 1, 1, 1,
-0.7324536, -1.144311, -2.256065, 1, 1, 1, 1, 1,
-0.7283445, 0.3525402, -0.5467486, 1, 1, 1, 1, 1,
-0.7231008, 0.9267965, 0.5327036, 1, 1, 1, 1, 1,
-0.7172057, -1.123436, -0.004253763, 1, 1, 1, 1, 1,
-0.7140503, -0.8596752, -3.660724, 1, 1, 1, 1, 1,
-0.7063385, -0.5293395, -2.984516, 1, 1, 1, 1, 1,
-0.7061707, -0.9955299, -2.018943, 1, 1, 1, 1, 1,
-0.7061182, 1.614094, -0.6014069, 1, 1, 1, 1, 1,
-0.7054587, -2.69501, -2.839013, 1, 1, 1, 1, 1,
-0.7024208, -1.754113, -0.5840304, 1, 1, 1, 1, 1,
-0.6898821, -0.4674595, -2.642903, 0, 0, 1, 1, 1,
-0.6892969, -1.353777, -1.740499, 1, 0, 0, 1, 1,
-0.6888468, -2.023324, -4.060294, 1, 0, 0, 1, 1,
-0.6860927, 1.783808, -0.3745759, 1, 0, 0, 1, 1,
-0.6840406, -0.386361, -2.385171, 1, 0, 0, 1, 1,
-0.6832049, 0.06211219, -1.942885, 1, 0, 0, 1, 1,
-0.682474, -0.08950538, -3.211814, 0, 0, 0, 1, 1,
-0.6770289, 0.4251396, -0.06747007, 0, 0, 0, 1, 1,
-0.6743904, 0.1818711, 0.1721657, 0, 0, 0, 1, 1,
-0.6625288, -1.289054, -1.894545, 0, 0, 0, 1, 1,
-0.6595416, -0.365918, -2.534283, 0, 0, 0, 1, 1,
-0.6586791, -0.5816883, -3.118179, 0, 0, 0, 1, 1,
-0.6575542, 0.8999289, 0.4178722, 0, 0, 0, 1, 1,
-0.6562645, -0.446901, -3.019027, 1, 1, 1, 1, 1,
-0.6504785, -2.166713, -4.923736, 1, 1, 1, 1, 1,
-0.6483451, 0.5186473, -2.36634, 1, 1, 1, 1, 1,
-0.6415526, -0.117669, -1.025911, 1, 1, 1, 1, 1,
-0.6365286, -1.779251, -2.884809, 1, 1, 1, 1, 1,
-0.6271434, 1.010439, 0.8278018, 1, 1, 1, 1, 1,
-0.6271231, -2.000448, -3.143011, 1, 1, 1, 1, 1,
-0.6270657, -1.357788, -2.27122, 1, 1, 1, 1, 1,
-0.6257095, -1.796701, -2.57233, 1, 1, 1, 1, 1,
-0.6214439, -1.795488, -2.384721, 1, 1, 1, 1, 1,
-0.6130404, -0.306774, -0.2683459, 1, 1, 1, 1, 1,
-0.6101863, 1.17597, -0.2534929, 1, 1, 1, 1, 1,
-0.6072438, -0.2076094, -2.460988, 1, 1, 1, 1, 1,
-0.6009064, -0.1091252, -2.249378, 1, 1, 1, 1, 1,
-0.5979152, -0.8073121, -2.98126, 1, 1, 1, 1, 1,
-0.5948018, -0.6410472, -2.136494, 0, 0, 1, 1, 1,
-0.5940968, 0.06563954, -1.931075, 1, 0, 0, 1, 1,
-0.5938907, -1.8432, -1.912535, 1, 0, 0, 1, 1,
-0.5921813, -0.9681922, -2.061147, 1, 0, 0, 1, 1,
-0.5903245, 0.3468131, -2.895294, 1, 0, 0, 1, 1,
-0.5882363, 0.317841, -2.431135, 1, 0, 0, 1, 1,
-0.5850052, 0.2702628, -0.3099804, 0, 0, 0, 1, 1,
-0.5838659, 0.2405891, -3.276735, 0, 0, 0, 1, 1,
-0.5824946, 0.5628869, -0.6072307, 0, 0, 0, 1, 1,
-0.5824709, -0.1471612, -2.535562, 0, 0, 0, 1, 1,
-0.5799788, 1.63475, -1.14621, 0, 0, 0, 1, 1,
-0.5759185, 1.4317, -0.1786855, 0, 0, 0, 1, 1,
-0.5672091, -0.1814312, -1.81854, 0, 0, 0, 1, 1,
-0.5612327, 0.1207048, 0.4560817, 1, 1, 1, 1, 1,
-0.5604711, -0.6477298, -3.827807, 1, 1, 1, 1, 1,
-0.5600598, 0.4566449, -1.623636, 1, 1, 1, 1, 1,
-0.5559649, -1.706201, -3.485055, 1, 1, 1, 1, 1,
-0.5558438, -0.01417356, -1.763966, 1, 1, 1, 1, 1,
-0.5522765, 0.9778475, -1.219383, 1, 1, 1, 1, 1,
-0.55132, -0.2412363, -2.113761, 1, 1, 1, 1, 1,
-0.5505297, 0.9487598, -0.1908402, 1, 1, 1, 1, 1,
-0.5489774, -1.161409, -2.43297, 1, 1, 1, 1, 1,
-0.5478003, 1.808391, -0.6936609, 1, 1, 1, 1, 1,
-0.5445769, -0.5837464, -3.247808, 1, 1, 1, 1, 1,
-0.5399596, -1.450594, -3.840317, 1, 1, 1, 1, 1,
-0.5379614, 1.780207, -0.2534267, 1, 1, 1, 1, 1,
-0.5343694, 0.2397907, -0.8651729, 1, 1, 1, 1, 1,
-0.5311742, 1.227508, 1.792442, 1, 1, 1, 1, 1,
-0.5309014, -0.2083739, -1.917039, 0, 0, 1, 1, 1,
-0.5308324, 1.231469, -0.6738532, 1, 0, 0, 1, 1,
-0.529567, -0.2327616, -3.903771, 1, 0, 0, 1, 1,
-0.5259524, 0.07399591, -0.1457299, 1, 0, 0, 1, 1,
-0.5250043, 0.803537, 0.5259222, 1, 0, 0, 1, 1,
-0.5243427, -0.6467396, -3.523473, 1, 0, 0, 1, 1,
-0.524329, -0.4247645, -2.669593, 0, 0, 0, 1, 1,
-0.5232206, -0.1533385, -2.520528, 0, 0, 0, 1, 1,
-0.521815, 1.370387, 0.2455813, 0, 0, 0, 1, 1,
-0.5184531, -1.165022, -2.152567, 0, 0, 0, 1, 1,
-0.5156634, -0.5886964, -4.100439, 0, 0, 0, 1, 1,
-0.5121658, -1.749599, -2.770383, 0, 0, 0, 1, 1,
-0.5115932, -0.3377998, -1.750085, 0, 0, 0, 1, 1,
-0.5111393, 0.4613114, -0.3140568, 1, 1, 1, 1, 1,
-0.5081948, 0.1502094, -2.060791, 1, 1, 1, 1, 1,
-0.5065827, -1.253012, -1.059831, 1, 1, 1, 1, 1,
-0.5028835, 0.4787538, 0.584714, 1, 1, 1, 1, 1,
-0.5018985, 0.7936687, -0.07356208, 1, 1, 1, 1, 1,
-0.5004991, -0.6445924, -1.927665, 1, 1, 1, 1, 1,
-0.4992989, 0.2319444, -1.490614, 1, 1, 1, 1, 1,
-0.497756, -1.234708, -3.565795, 1, 1, 1, 1, 1,
-0.4973553, -0.6132329, -2.758814, 1, 1, 1, 1, 1,
-0.4963374, -0.2049909, -1.49967, 1, 1, 1, 1, 1,
-0.4952157, 1.620198, -1.011156, 1, 1, 1, 1, 1,
-0.4945733, -1.034595, -1.312102, 1, 1, 1, 1, 1,
-0.4919081, 1.149665, 0.2770387, 1, 1, 1, 1, 1,
-0.4898396, 0.5952955, -0.6733501, 1, 1, 1, 1, 1,
-0.4871587, -0.7333056, -0.947103, 1, 1, 1, 1, 1,
-0.481836, -0.6648035, -3.246828, 0, 0, 1, 1, 1,
-0.4815597, 0.991183, 0.3294433, 1, 0, 0, 1, 1,
-0.4799224, 1.058584, -1.42033, 1, 0, 0, 1, 1,
-0.4790775, -1.402935, -2.608243, 1, 0, 0, 1, 1,
-0.4777076, 1.524076, -2.12079, 1, 0, 0, 1, 1,
-0.4772458, -1.690315, -1.510904, 1, 0, 0, 1, 1,
-0.4755054, 0.6415012, -2.436881, 0, 0, 0, 1, 1,
-0.472727, -1.418324, -1.733288, 0, 0, 0, 1, 1,
-0.4680766, -0.3857479, -1.681625, 0, 0, 0, 1, 1,
-0.467942, -0.97101, -2.760777, 0, 0, 0, 1, 1,
-0.4638496, 0.8372888, 0.1969348, 0, 0, 0, 1, 1,
-0.4631574, -0.2801769, -3.685843, 0, 0, 0, 1, 1,
-0.4580497, -1.160768, -2.536641, 0, 0, 0, 1, 1,
-0.4562144, -1.747299, -6.187631, 1, 1, 1, 1, 1,
-0.4540995, -1.67278, -3.88552, 1, 1, 1, 1, 1,
-0.4531187, 0.7419115, 0.9943093, 1, 1, 1, 1, 1,
-0.4527902, 1.445573, -0.152511, 1, 1, 1, 1, 1,
-0.4494897, -0.9483743, -3.588658, 1, 1, 1, 1, 1,
-0.4490418, 2.735836, -1.898249, 1, 1, 1, 1, 1,
-0.4431405, 1.996861, -0.5285487, 1, 1, 1, 1, 1,
-0.4408492, -2.1218, -3.286378, 1, 1, 1, 1, 1,
-0.4408018, -1.205677, -1.56538, 1, 1, 1, 1, 1,
-0.4398557, -1.718985, -3.813195, 1, 1, 1, 1, 1,
-0.4355085, 0.01644908, -1.899172, 1, 1, 1, 1, 1,
-0.427159, -1.052128, -1.415594, 1, 1, 1, 1, 1,
-0.4247092, 0.7886935, -2.407372, 1, 1, 1, 1, 1,
-0.4232456, -0.2508514, -2.85619, 1, 1, 1, 1, 1,
-0.4227845, -0.2543496, -1.17405, 1, 1, 1, 1, 1,
-0.4197217, 0.5215989, -1.397544, 0, 0, 1, 1, 1,
-0.4155107, -0.2731069, 0.6291095, 1, 0, 0, 1, 1,
-0.4144397, 0.3278132, 0.3000545, 1, 0, 0, 1, 1,
-0.4129791, 0.9043079, -0.4847519, 1, 0, 0, 1, 1,
-0.4118569, 0.9900002, -0.01482627, 1, 0, 0, 1, 1,
-0.4083739, 0.9405324, -0.2334615, 1, 0, 0, 1, 1,
-0.4076608, 1.215987, -0.4833167, 0, 0, 0, 1, 1,
-0.4061108, 0.5167215, -0.1638724, 0, 0, 0, 1, 1,
-0.4057789, 0.5833807, 1.417815, 0, 0, 0, 1, 1,
-0.4004881, -0.09228192, -1.933369, 0, 0, 0, 1, 1,
-0.3950014, -0.7472327, -3.203768, 0, 0, 0, 1, 1,
-0.3893354, -0.2189799, -3.588492, 0, 0, 0, 1, 1,
-0.3792698, -0.6452149, -1.417899, 0, 0, 0, 1, 1,
-0.3787143, -0.6840905, -1.948248, 1, 1, 1, 1, 1,
-0.3777158, 0.6271881, -0.8366064, 1, 1, 1, 1, 1,
-0.3769741, -2.174613, -1.853335, 1, 1, 1, 1, 1,
-0.3748099, -0.9547149, -2.899686, 1, 1, 1, 1, 1,
-0.3704987, -0.5713643, -0.6694055, 1, 1, 1, 1, 1,
-0.369208, -0.7458367, -3.391352, 1, 1, 1, 1, 1,
-0.3669519, 0.694223, -1.128845, 1, 1, 1, 1, 1,
-0.3669513, 0.6984955, -0.4169692, 1, 1, 1, 1, 1,
-0.3647507, -2.016384, -2.982382, 1, 1, 1, 1, 1,
-0.3631114, 0.1907673, -2.277762, 1, 1, 1, 1, 1,
-0.3608172, -0.1684616, -2.420382, 1, 1, 1, 1, 1,
-0.3602545, 1.089585, -0.6273243, 1, 1, 1, 1, 1,
-0.3542681, -0.07271628, -0.9207452, 1, 1, 1, 1, 1,
-0.3521633, -1.810076, -3.616072, 1, 1, 1, 1, 1,
-0.3500637, 0.5883107, -0.7926244, 1, 1, 1, 1, 1,
-0.3447249, 0.09244474, 0.4493498, 0, 0, 1, 1, 1,
-0.3446621, 0.1146451, -1.27019, 1, 0, 0, 1, 1,
-0.33887, -0.6571088, -2.492629, 1, 0, 0, 1, 1,
-0.3368827, 0.3102206, 0.005318671, 1, 0, 0, 1, 1,
-0.3349876, 1.097786, 0.7111438, 1, 0, 0, 1, 1,
-0.3344954, -0.3727915, -2.668665, 1, 0, 0, 1, 1,
-0.3319483, 0.8558168, -0.8649637, 0, 0, 0, 1, 1,
-0.3317262, -0.7057344, -3.895756, 0, 0, 0, 1, 1,
-0.3295857, -1.254236, -2.523492, 0, 0, 0, 1, 1,
-0.326436, -0.7187682, -4.003251, 0, 0, 0, 1, 1,
-0.3262314, -0.3630194, -3.567861, 0, 0, 0, 1, 1,
-0.3201682, -1.09098, -3.687847, 0, 0, 0, 1, 1,
-0.3187762, -0.1848671, -2.183088, 0, 0, 0, 1, 1,
-0.3180831, -1.378927, -1.048164, 1, 1, 1, 1, 1,
-0.3161532, 0.1020082, -0.1915643, 1, 1, 1, 1, 1,
-0.3125, 1.157787, 0.6064968, 1, 1, 1, 1, 1,
-0.3120805, -0.212804, -2.101082, 1, 1, 1, 1, 1,
-0.3111626, -0.4463522, -1.67931, 1, 1, 1, 1, 1,
-0.3060638, -0.06852501, -2.607457, 1, 1, 1, 1, 1,
-0.3042847, -1.684403, -1.360826, 1, 1, 1, 1, 1,
-0.304113, -0.1923586, -1.720851, 1, 1, 1, 1, 1,
-0.2997121, -0.04233699, -2.589143, 1, 1, 1, 1, 1,
-0.2915362, 1.003966, -0.5115424, 1, 1, 1, 1, 1,
-0.2867189, -0.5750982, -5.447661, 1, 1, 1, 1, 1,
-0.2850764, 1.339599, -1.421025, 1, 1, 1, 1, 1,
-0.2781333, 1.707641, 0.408988, 1, 1, 1, 1, 1,
-0.2769755, 1.409377, 0.9586899, 1, 1, 1, 1, 1,
-0.2752013, 1.024865, -0.2733968, 1, 1, 1, 1, 1,
-0.2741554, -1.219003, -2.147684, 0, 0, 1, 1, 1,
-0.2683931, 0.8977639, 0.2149229, 1, 0, 0, 1, 1,
-0.2679233, 0.5853854, 0.2593503, 1, 0, 0, 1, 1,
-0.2649782, 0.1332824, -0.9670616, 1, 0, 0, 1, 1,
-0.2587994, -0.01512265, -1.249525, 1, 0, 0, 1, 1,
-0.2575758, -0.7417132, -3.111181, 1, 0, 0, 1, 1,
-0.2545359, 0.1281577, -1.01917, 0, 0, 0, 1, 1,
-0.2533744, -0.1469599, -2.069053, 0, 0, 0, 1, 1,
-0.2528794, -1.068118, -0.7215244, 0, 0, 0, 1, 1,
-0.2507426, -0.2049161, -2.830263, 0, 0, 0, 1, 1,
-0.2402682, -0.4888519, -3.842395, 0, 0, 0, 1, 1,
-0.2387785, -0.1747736, -2.4931, 0, 0, 0, 1, 1,
-0.2364117, -0.1261663, -1.5529, 0, 0, 0, 1, 1,
-0.2334949, 0.1256705, -0.3017025, 1, 1, 1, 1, 1,
-0.2331388, 0.2677941, -0.02842751, 1, 1, 1, 1, 1,
-0.231945, 0.8913482, -1.173238, 1, 1, 1, 1, 1,
-0.2265493, 0.1462465, -0.2152676, 1, 1, 1, 1, 1,
-0.2250473, -1.564997, -3.238879, 1, 1, 1, 1, 1,
-0.2207313, 0.5934348, -0.5015936, 1, 1, 1, 1, 1,
-0.2198392, -0.6872911, -1.536906, 1, 1, 1, 1, 1,
-0.2182737, -1.14278, -4.135174, 1, 1, 1, 1, 1,
-0.2180468, -0.668201, -1.848125, 1, 1, 1, 1, 1,
-0.2146571, -0.6785194, -5.045057, 1, 1, 1, 1, 1,
-0.213098, -1.236624, -2.095862, 1, 1, 1, 1, 1,
-0.2127203, -0.03808227, -2.194415, 1, 1, 1, 1, 1,
-0.2121027, 0.5655091, 0.2812894, 1, 1, 1, 1, 1,
-0.2095274, -0.2483802, -1.069367, 1, 1, 1, 1, 1,
-0.2090265, 0.9949127, 1.37636, 1, 1, 1, 1, 1,
-0.2089354, -0.4953429, -2.952176, 0, 0, 1, 1, 1,
-0.2083465, 0.6359586, -0.6656241, 1, 0, 0, 1, 1,
-0.2028052, 0.03451035, 0.8393206, 1, 0, 0, 1, 1,
-0.2021059, 0.884495, -0.05921527, 1, 0, 0, 1, 1,
-0.200331, 1.229607, -0.491274, 1, 0, 0, 1, 1,
-0.1982445, -0.3769945, -1.679523, 1, 0, 0, 1, 1,
-0.1917207, -1.422493, -3.030718, 0, 0, 0, 1, 1,
-0.1908804, -0.8511588, -4.410333, 0, 0, 0, 1, 1,
-0.1861403, -1.210257, -2.134339, 0, 0, 0, 1, 1,
-0.1844826, 0.3277765, -0.5254607, 0, 0, 0, 1, 1,
-0.1807974, 1.155977, 0.006389242, 0, 0, 0, 1, 1,
-0.1792374, 0.8349094, -1.675405, 0, 0, 0, 1, 1,
-0.1789313, 0.7174505, -1.062846, 0, 0, 0, 1, 1,
-0.1769441, 0.1580212, 0.4722705, 1, 1, 1, 1, 1,
-0.1720636, -0.00193764, -0.1064302, 1, 1, 1, 1, 1,
-0.1681141, 1.134688, -0.5711806, 1, 1, 1, 1, 1,
-0.1615821, -1.800133, -3.708728, 1, 1, 1, 1, 1,
-0.1609264, 2.250141, -0.5586116, 1, 1, 1, 1, 1,
-0.1608253, 0.786015, 0.5040023, 1, 1, 1, 1, 1,
-0.1599999, -2.09555, -3.82155, 1, 1, 1, 1, 1,
-0.1595283, 0.0662685, -3.02682, 1, 1, 1, 1, 1,
-0.1532435, 0.5322495, -0.7819852, 1, 1, 1, 1, 1,
-0.1511174, 0.03492371, 0.1105758, 1, 1, 1, 1, 1,
-0.1507847, 1.172741, -0.7522852, 1, 1, 1, 1, 1,
-0.1504145, 2.102856, -0.03321284, 1, 1, 1, 1, 1,
-0.1465649, 0.6494743, 0.2721052, 1, 1, 1, 1, 1,
-0.1445749, -0.05967506, -3.203293, 1, 1, 1, 1, 1,
-0.1441531, 0.4933139, -0.143649, 1, 1, 1, 1, 1,
-0.1429599, 0.06152224, -1.413463, 0, 0, 1, 1, 1,
-0.1404786, 0.4145787, -0.4716884, 1, 0, 0, 1, 1,
-0.1365793, 0.06803367, -1.621596, 1, 0, 0, 1, 1,
-0.1358652, 1.435539, 1.908526, 1, 0, 0, 1, 1,
-0.1340878, 0.8722525, -0.9677928, 1, 0, 0, 1, 1,
-0.1324192, 0.8682763, -0.1096433, 1, 0, 0, 1, 1,
-0.1281188, -1.331318, -3.876135, 0, 0, 0, 1, 1,
-0.1240919, 0.6434224, -0.5089476, 0, 0, 0, 1, 1,
-0.123838, -0.8468772, -2.070981, 0, 0, 0, 1, 1,
-0.1235641, 0.7628707, 0.4340736, 0, 0, 0, 1, 1,
-0.1224418, 1.188705, -0.07302476, 0, 0, 0, 1, 1,
-0.1190101, -0.4487723, -1.686532, 0, 0, 0, 1, 1,
-0.1189276, 1.56752, 1.335413, 0, 0, 0, 1, 1,
-0.1175068, 0.5278344, 0.5666939, 1, 1, 1, 1, 1,
-0.1158479, -0.0130175, -1.001189, 1, 1, 1, 1, 1,
-0.1148867, -0.4420593, -1.436975, 1, 1, 1, 1, 1,
-0.1115876, -0.01609672, -1.16942, 1, 1, 1, 1, 1,
-0.1112644, 2.11062, 0.03593651, 1, 1, 1, 1, 1,
-0.1036927, 1.043148, -0.1634993, 1, 1, 1, 1, 1,
-0.1035242, 1.219852, -1.268477, 1, 1, 1, 1, 1,
-0.1032814, 1.694443, 1.741441, 1, 1, 1, 1, 1,
-0.1013207, -0.8977293, -3.264972, 1, 1, 1, 1, 1,
-0.1000786, 0.1778393, 0.07042857, 1, 1, 1, 1, 1,
-0.0936415, -0.367768, -4.201578, 1, 1, 1, 1, 1,
-0.09307524, 0.84907, -0.04265775, 1, 1, 1, 1, 1,
-0.09188663, 1.882404, -0.9248594, 1, 1, 1, 1, 1,
-0.09037041, -0.3645731, -3.601161, 1, 1, 1, 1, 1,
-0.08959255, -0.04010263, -2.178453, 1, 1, 1, 1, 1,
-0.08821507, -0.06032266, -1.273875, 0, 0, 1, 1, 1,
-0.08677809, -0.4905538, -3.721618, 1, 0, 0, 1, 1,
-0.08304067, 2.157564, 0.613634, 1, 0, 0, 1, 1,
-0.08245996, -1.694139, -2.37299, 1, 0, 0, 1, 1,
-0.07786131, 0.0327784, -0.7540792, 1, 0, 0, 1, 1,
-0.07744251, 0.5152652, -0.3917036, 1, 0, 0, 1, 1,
-0.07520442, -0.5111244, -2.449556, 0, 0, 0, 1, 1,
-0.074931, -0.6537902, -2.273099, 0, 0, 0, 1, 1,
-0.07316923, 0.4533474, -0.9955982, 0, 0, 0, 1, 1,
-0.06764994, -1.14038, -1.556789, 0, 0, 0, 1, 1,
-0.06712578, -0.9083957, -2.961513, 0, 0, 0, 1, 1,
-0.06580668, 1.026528, 0.5251632, 0, 0, 0, 1, 1,
-0.06166068, 1.927144, 1.807481, 0, 0, 0, 1, 1,
-0.06141044, 0.3817214, 0.6524625, 1, 1, 1, 1, 1,
-0.05887092, -0.4455698, -3.719978, 1, 1, 1, 1, 1,
-0.05691306, 0.1893805, -0.7889353, 1, 1, 1, 1, 1,
-0.05149153, -0.394587, -2.710609, 1, 1, 1, 1, 1,
-0.0513836, 1.655144, -0.1724821, 1, 1, 1, 1, 1,
-0.05119729, -0.8719478, -2.199142, 1, 1, 1, 1, 1,
-0.0500733, 0.2286401, -0.927934, 1, 1, 1, 1, 1,
-0.04981088, 0.7818339, 1.24879, 1, 1, 1, 1, 1,
-0.04612651, 0.9052062, 0.01427039, 1, 1, 1, 1, 1,
-0.04263407, 0.137156, 0.04888115, 1, 1, 1, 1, 1,
-0.04124071, -0.4085957, -1.835153, 1, 1, 1, 1, 1,
-0.03795733, 0.9910749, 0.399991, 1, 1, 1, 1, 1,
-0.0358054, 0.2679443, 0.9853075, 1, 1, 1, 1, 1,
-0.03444849, 0.3754956, 0.09231586, 1, 1, 1, 1, 1,
-0.02950483, 0.4895643, 0.08866812, 1, 1, 1, 1, 1,
-0.0272802, -0.06967772, -3.225918, 0, 0, 1, 1, 1,
-0.02555163, -0.988724, -2.753172, 1, 0, 0, 1, 1,
-0.01985054, -0.9070977, -2.411749, 1, 0, 0, 1, 1,
-0.01749187, 0.9463573, -0.7307841, 1, 0, 0, 1, 1,
-0.016282, -0.5811626, -1.449045, 1, 0, 0, 1, 1,
-0.01529462, 0.1854936, 0.299731, 1, 0, 0, 1, 1,
-0.01519121, 0.02609, -1.412978, 0, 0, 0, 1, 1,
-0.01349919, 0.4874536, 0.2694916, 0, 0, 0, 1, 1,
-0.01175936, -0.4771806, -2.861031, 0, 0, 0, 1, 1,
-0.01085363, 1.620971, -0.4923413, 0, 0, 0, 1, 1,
-0.009056132, 0.1650381, 0.7307434, 0, 0, 0, 1, 1,
-0.002883004, -0.8674753, -1.626477, 0, 0, 0, 1, 1,
0.001938838, 1.118403, 0.3087505, 0, 0, 0, 1, 1,
0.002384592, 0.6010556, 0.8428656, 1, 1, 1, 1, 1,
0.0080597, 0.7300693, -0.3483085, 1, 1, 1, 1, 1,
0.009440074, 1.924248, 0.7963834, 1, 1, 1, 1, 1,
0.0104865, -1.098565, 3.304967, 1, 1, 1, 1, 1,
0.01771316, 1.003037, -0.6480567, 1, 1, 1, 1, 1,
0.02019618, -0.5481109, 2.19066, 1, 1, 1, 1, 1,
0.02030344, -1.202355, 4.321702, 1, 1, 1, 1, 1,
0.02943046, -0.1507539, 2.612674, 1, 1, 1, 1, 1,
0.02978369, 0.6324199, 1.1399, 1, 1, 1, 1, 1,
0.03645289, -1.232376, 2.271099, 1, 1, 1, 1, 1,
0.03722094, -1.229252, 3.04798, 1, 1, 1, 1, 1,
0.03735936, -1.017567, 3.035608, 1, 1, 1, 1, 1,
0.03876875, -0.3831863, 2.558661, 1, 1, 1, 1, 1,
0.04014233, -0.2109399, 1.758461, 1, 1, 1, 1, 1,
0.04335438, 0.2975183, 1.43352, 1, 1, 1, 1, 1,
0.04450073, -0.3360434, 2.816343, 0, 0, 1, 1, 1,
0.04622239, -1.272156, 2.390027, 1, 0, 0, 1, 1,
0.05475455, 0.603619, 0.7701606, 1, 0, 0, 1, 1,
0.05718892, 1.104706, -0.9742274, 1, 0, 0, 1, 1,
0.05806394, -0.532987, 3.564522, 1, 0, 0, 1, 1,
0.059845, 0.7335439, 2.109091, 1, 0, 0, 1, 1,
0.05994724, -0.7941226, 1.071564, 0, 0, 0, 1, 1,
0.06010756, -0.8093467, 1.308052, 0, 0, 0, 1, 1,
0.06455468, 1.241547, 1.692712, 0, 0, 0, 1, 1,
0.06594907, 0.7399217, -1.074791, 0, 0, 0, 1, 1,
0.07481737, 0.4391988, 1.318438, 0, 0, 0, 1, 1,
0.07855313, 1.170106, -0.7367879, 0, 0, 0, 1, 1,
0.07992065, -0.3103366, 3.472574, 0, 0, 0, 1, 1,
0.08005897, 0.6786602, 0.1714269, 1, 1, 1, 1, 1,
0.0844796, 0.4909604, -0.4694127, 1, 1, 1, 1, 1,
0.09071944, -0.3548615, 2.729663, 1, 1, 1, 1, 1,
0.09181817, 0.7630625, -2.942882, 1, 1, 1, 1, 1,
0.09371103, -0.8795841, 2.059257, 1, 1, 1, 1, 1,
0.09611059, -1.126089, 2.891213, 1, 1, 1, 1, 1,
0.09735636, -1.135057, 3.340423, 1, 1, 1, 1, 1,
0.09827694, 0.00781277, 0.7350362, 1, 1, 1, 1, 1,
0.09990007, -1.267305, 1.647601, 1, 1, 1, 1, 1,
0.1008727, -0.9997109, 2.607313, 1, 1, 1, 1, 1,
0.1012439, 1.334797, 1.592777, 1, 1, 1, 1, 1,
0.1037787, 0.2141221, 0.3511293, 1, 1, 1, 1, 1,
0.1061653, 1.923815, 1.00549, 1, 1, 1, 1, 1,
0.1132257, 0.1123914, 0.121663, 1, 1, 1, 1, 1,
0.1170863, 0.08615743, 1.73658, 1, 1, 1, 1, 1,
0.1173561, -0.8491135, 2.323849, 0, 0, 1, 1, 1,
0.1178882, -1.062801, 2.362472, 1, 0, 0, 1, 1,
0.1209238, 1.660089, 0.2114934, 1, 0, 0, 1, 1,
0.1221389, -0.9035411, 2.510384, 1, 0, 0, 1, 1,
0.1387735, -0.3234371, 2.696277, 1, 0, 0, 1, 1,
0.1390267, -0.2911433, 2.651734, 1, 0, 0, 1, 1,
0.1391883, 0.6007969, 1.329148, 0, 0, 0, 1, 1,
0.1414749, -0.02219959, 1.40598, 0, 0, 0, 1, 1,
0.1421319, -1.258053, 2.95376, 0, 0, 0, 1, 1,
0.1465682, -1.43385, 3.152791, 0, 0, 0, 1, 1,
0.1503043, -0.2275544, 1.031179, 0, 0, 0, 1, 1,
0.1546783, 0.3185994, 3.451024, 0, 0, 0, 1, 1,
0.1604075, -1.442572, 2.763348, 0, 0, 0, 1, 1,
0.1644337, 0.2121124, 0.4127145, 1, 1, 1, 1, 1,
0.1652958, -0.8549939, 4.259391, 1, 1, 1, 1, 1,
0.1678572, -0.2515478, 2.075705, 1, 1, 1, 1, 1,
0.1720636, -0.3312807, 3.141497, 1, 1, 1, 1, 1,
0.1730663, 1.209717, -0.6264705, 1, 1, 1, 1, 1,
0.1757292, -0.1702485, 1.751047, 1, 1, 1, 1, 1,
0.1772579, 0.8509293, -0.237614, 1, 1, 1, 1, 1,
0.1804105, 1.170025, -0.3066579, 1, 1, 1, 1, 1,
0.1806275, -1.273538, 3.453279, 1, 1, 1, 1, 1,
0.1883533, -0.04771351, 0.7793773, 1, 1, 1, 1, 1,
0.1913256, -0.8673569, 0.82325, 1, 1, 1, 1, 1,
0.1914109, 1.149438, -0.2416079, 1, 1, 1, 1, 1,
0.1916718, 1.200172, 0.3557271, 1, 1, 1, 1, 1,
0.1931099, -0.491626, 3.925078, 1, 1, 1, 1, 1,
0.1936001, 0.02059669, 3.284773, 1, 1, 1, 1, 1,
0.1948309, -0.992905, 3.461817, 0, 0, 1, 1, 1,
0.1996339, -1.044259, 2.273031, 1, 0, 0, 1, 1,
0.1996701, -0.9784361, 2.853889, 1, 0, 0, 1, 1,
0.202071, -0.5539113, 1.704564, 1, 0, 0, 1, 1,
0.207462, -0.1471291, 2.290236, 1, 0, 0, 1, 1,
0.2078422, 0.5865101, 0.222745, 1, 0, 0, 1, 1,
0.2111301, 0.1230848, 1.634176, 0, 0, 0, 1, 1,
0.213967, 0.07965257, 1.565972, 0, 0, 0, 1, 1,
0.2168166, 0.1961169, 0.9985794, 0, 0, 0, 1, 1,
0.2190952, -0.1019763, 3.972929, 0, 0, 0, 1, 1,
0.2247575, 0.8837681, 1.402291, 0, 0, 0, 1, 1,
0.2251325, -1.363992, 4.812943, 0, 0, 0, 1, 1,
0.2261283, -1.967694, 3.269284, 0, 0, 0, 1, 1,
0.2331325, -0.7877845, 3.220717, 1, 1, 1, 1, 1,
0.2331816, 0.8952708, 0.2914334, 1, 1, 1, 1, 1,
0.239074, 0.6693993, -0.8868012, 1, 1, 1, 1, 1,
0.2422646, 0.2566427, 1.04163, 1, 1, 1, 1, 1,
0.2428236, -1.775525, 0.5648795, 1, 1, 1, 1, 1,
0.2478047, 0.69737, 0.07968202, 1, 1, 1, 1, 1,
0.2491471, 1.158879, 1.323954, 1, 1, 1, 1, 1,
0.2531195, 1.372495, -0.7731358, 1, 1, 1, 1, 1,
0.2535557, -1.060581, 3.372119, 1, 1, 1, 1, 1,
0.2546026, -0.2902192, 1.65889, 1, 1, 1, 1, 1,
0.2552463, 0.5931546, -0.5201211, 1, 1, 1, 1, 1,
0.2580451, 1.005153, -0.4158789, 1, 1, 1, 1, 1,
0.2583463, -0.4213309, 1.059981, 1, 1, 1, 1, 1,
0.2593094, -0.2541019, 1.376384, 1, 1, 1, 1, 1,
0.2622846, -1.801456, 2.786114, 1, 1, 1, 1, 1,
0.2623609, 0.4878454, -0.378785, 0, 0, 1, 1, 1,
0.2628006, -0.1464737, 2.512995, 1, 0, 0, 1, 1,
0.2669096, 0.9525716, 0.2407268, 1, 0, 0, 1, 1,
0.2679409, 0.2788435, 1.405958, 1, 0, 0, 1, 1,
0.2683215, 0.6966275, -1.026449, 1, 0, 0, 1, 1,
0.2713408, 0.1844238, 0.8146352, 1, 0, 0, 1, 1,
0.2743094, -0.3790435, 1.396275, 0, 0, 0, 1, 1,
0.2799733, -0.6776248, 3.54531, 0, 0, 0, 1, 1,
0.2837631, 1.524597, 1.589696, 0, 0, 0, 1, 1,
0.2841159, -0.3211545, 1.994658, 0, 0, 0, 1, 1,
0.2863836, -0.9048728, 4.152292, 0, 0, 0, 1, 1,
0.2873518, 0.3097126, 1.801086, 0, 0, 0, 1, 1,
0.2882742, 0.1780584, 1.434279, 0, 0, 0, 1, 1,
0.2894242, -0.3272222, 2.404012, 1, 1, 1, 1, 1,
0.2945143, -0.04459436, 2.679277, 1, 1, 1, 1, 1,
0.2956157, 0.2229562, 0.5100402, 1, 1, 1, 1, 1,
0.2971722, 0.5589527, 0.6512951, 1, 1, 1, 1, 1,
0.2982227, -0.5537332, 1.544329, 1, 1, 1, 1, 1,
0.3004663, 0.3978078, 0.9420662, 1, 1, 1, 1, 1,
0.3020224, 0.1567356, 1.885669, 1, 1, 1, 1, 1,
0.3021374, 1.333564, -1.427062, 1, 1, 1, 1, 1,
0.3031598, 0.8343431, 0.05229009, 1, 1, 1, 1, 1,
0.306776, -0.6043467, 1.589285, 1, 1, 1, 1, 1,
0.3101607, -0.8946242, 2.052958, 1, 1, 1, 1, 1,
0.314636, 0.6884378, -0.5230429, 1, 1, 1, 1, 1,
0.3305301, -0.8340831, 4.843605, 1, 1, 1, 1, 1,
0.3390808, 0.1891906, 0.08922722, 1, 1, 1, 1, 1,
0.3451302, -0.488649, 3.649678, 1, 1, 1, 1, 1,
0.3533979, -0.06453211, 2.098721, 0, 0, 1, 1, 1,
0.3557915, -0.4935081, 1.727805, 1, 0, 0, 1, 1,
0.3584693, 2.228357, 1.659538, 1, 0, 0, 1, 1,
0.3599202, 1.116387, -0.3097171, 1, 0, 0, 1, 1,
0.3624661, -0.1960768, 2.597226, 1, 0, 0, 1, 1,
0.3688005, -1.092169, 2.073608, 1, 0, 0, 1, 1,
0.3746006, -0.3872724, 2.497889, 0, 0, 0, 1, 1,
0.3778424, 0.4756469, 1.237697, 0, 0, 0, 1, 1,
0.3871305, 0.2290972, 1.549566, 0, 0, 0, 1, 1,
0.3881794, -1.21287, 2.080301, 0, 0, 0, 1, 1,
0.3930081, 1.301392, 0.3104051, 0, 0, 0, 1, 1,
0.3968475, 0.9362911, 0.62282, 0, 0, 0, 1, 1,
0.3996505, -0.2544804, 0.8017314, 0, 0, 0, 1, 1,
0.4024975, 1.134357, -1.761993, 1, 1, 1, 1, 1,
0.4057616, 1.004647, -0.8366135, 1, 1, 1, 1, 1,
0.4094085, -1.546197, 3.23537, 1, 1, 1, 1, 1,
0.4095895, 0.4650592, 0.6053587, 1, 1, 1, 1, 1,
0.4096907, -0.1389345, 3.669143, 1, 1, 1, 1, 1,
0.4106131, 0.4458804, 0.7486038, 1, 1, 1, 1, 1,
0.4120054, -1.452211, 4.245024, 1, 1, 1, 1, 1,
0.4131191, -1.121819, 3.779118, 1, 1, 1, 1, 1,
0.4182665, 0.6101483, 1.501239, 1, 1, 1, 1, 1,
0.4203346, -1.723634, 4.371221, 1, 1, 1, 1, 1,
0.425411, -0.1519279, 2.744252, 1, 1, 1, 1, 1,
0.4273146, -0.462704, 1.724743, 1, 1, 1, 1, 1,
0.4287744, 0.6135152, -0.240018, 1, 1, 1, 1, 1,
0.4304711, 1.113404, 1.155065, 1, 1, 1, 1, 1,
0.4334999, 0.4612138, 2.61512, 1, 1, 1, 1, 1,
0.4398761, 0.4201585, 1.652161, 0, 0, 1, 1, 1,
0.4406967, -1.759611, 4.103632, 1, 0, 0, 1, 1,
0.4471699, 0.3864028, -0.1458294, 1, 0, 0, 1, 1,
0.449687, -0.5984942, 1.512596, 1, 0, 0, 1, 1,
0.4510043, 0.7475497, 0.2059223, 1, 0, 0, 1, 1,
0.4515062, -0.3399566, 1.323307, 1, 0, 0, 1, 1,
0.4571733, 0.1822968, 3.362188, 0, 0, 0, 1, 1,
0.4573429, -1.274186, 3.183454, 0, 0, 0, 1, 1,
0.4607772, 1.853133, 1.769809, 0, 0, 0, 1, 1,
0.4616778, -0.2405699, 1.818775, 0, 0, 0, 1, 1,
0.4665508, -0.2731692, 1.427063, 0, 0, 0, 1, 1,
0.467292, -1.998413, 3.107785, 0, 0, 0, 1, 1,
0.4684486, 0.410909, 2.830567, 0, 0, 0, 1, 1,
0.4731892, 1.024311, 1.224928, 1, 1, 1, 1, 1,
0.4738724, 0.00910373, 2.97644, 1, 1, 1, 1, 1,
0.4768282, 0.09669587, 0.5529794, 1, 1, 1, 1, 1,
0.4850468, -1.779211, 4.240062, 1, 1, 1, 1, 1,
0.4876216, 0.2436458, 1.752347, 1, 1, 1, 1, 1,
0.4966395, 0.4798799, 1.084848, 1, 1, 1, 1, 1,
0.4967415, 0.3235241, 0.9036318, 1, 1, 1, 1, 1,
0.5002898, 1.81561, -1.071072, 1, 1, 1, 1, 1,
0.5079376, -0.4840421, 3.305002, 1, 1, 1, 1, 1,
0.5115275, -0.5758173, 2.026546, 1, 1, 1, 1, 1,
0.5116832, 0.08782858, 0.7310327, 1, 1, 1, 1, 1,
0.513621, -2.29751, 3.116097, 1, 1, 1, 1, 1,
0.5137038, -0.08607332, 1.770459, 1, 1, 1, 1, 1,
0.5147302, 0.4852798, -0.02851942, 1, 1, 1, 1, 1,
0.5164695, -0.3746867, 3.688377, 1, 1, 1, 1, 1,
0.5372557, -1.674016, 3.453779, 0, 0, 1, 1, 1,
0.5372919, 0.611105, 2.04065, 1, 0, 0, 1, 1,
0.5386177, -0.8668444, 0.9588836, 1, 0, 0, 1, 1,
0.5389204, 1.139734, -0.7174035, 1, 0, 0, 1, 1,
0.5407954, -0.6632824, 3.354436, 1, 0, 0, 1, 1,
0.5448542, 0.6800045, -0.8849382, 1, 0, 0, 1, 1,
0.5484563, -0.5258704, 1.529307, 0, 0, 0, 1, 1,
0.548484, 2.12745, 0.8076693, 0, 0, 0, 1, 1,
0.5488516, 0.5751699, 0.6520973, 0, 0, 0, 1, 1,
0.551578, -0.4450972, 4.491329, 0, 0, 0, 1, 1,
0.5597165, 0.8465682, -0.5794407, 0, 0, 0, 1, 1,
0.5645765, -0.8437567, 3.588837, 0, 0, 0, 1, 1,
0.5676451, -0.3466051, 1.352856, 0, 0, 0, 1, 1,
0.571815, 0.4775414, 2.260363, 1, 1, 1, 1, 1,
0.572151, -1.703439, 4.398236, 1, 1, 1, 1, 1,
0.5729969, 0.1923414, 2.913006, 1, 1, 1, 1, 1,
0.5835878, -0.4172427, 1.732453, 1, 1, 1, 1, 1,
0.5847728, 0.9361517, 0.1734927, 1, 1, 1, 1, 1,
0.5860455, 0.6092895, 1.24489, 1, 1, 1, 1, 1,
0.5884895, 1.156101, 1.334375, 1, 1, 1, 1, 1,
0.5926237, 1.08608, 0.4647847, 1, 1, 1, 1, 1,
0.5951948, -0.4463722, 1.804132, 1, 1, 1, 1, 1,
0.5952569, -0.4543206, 2.625811, 1, 1, 1, 1, 1,
0.598094, 2.29009, -1.317708, 1, 1, 1, 1, 1,
0.5987278, -1.849206, 3.467272, 1, 1, 1, 1, 1,
0.5996826, -1.118736, 3.613157, 1, 1, 1, 1, 1,
0.6045685, 0.5308958, 0.7823421, 1, 1, 1, 1, 1,
0.6138971, -0.1800159, 1.083238, 1, 1, 1, 1, 1,
0.6147422, 0.6117391, 0.6350924, 0, 0, 1, 1, 1,
0.6201696, -1.053587, 2.686234, 1, 0, 0, 1, 1,
0.620958, 0.01536415, 1.777984, 1, 0, 0, 1, 1,
0.6230592, -0.1722491, 3.213654, 1, 0, 0, 1, 1,
0.6253321, 0.1990039, -0.3525108, 1, 0, 0, 1, 1,
0.6283712, 1.222225, 1.627493, 1, 0, 0, 1, 1,
0.6284158, 1.312357, 2.275766, 0, 0, 0, 1, 1,
0.6323158, 1.07494, 0.1926535, 0, 0, 0, 1, 1,
0.6356321, 0.4104055, 0.8403078, 0, 0, 0, 1, 1,
0.6363167, 0.4977566, 0.6759863, 0, 0, 0, 1, 1,
0.6378174, -1.381818, 1.156748, 0, 0, 0, 1, 1,
0.6379113, 0.7835683, 1.667594, 0, 0, 0, 1, 1,
0.640871, -0.6358638, 3.310726, 0, 0, 0, 1, 1,
0.6409718, 0.8199034, 0.6174241, 1, 1, 1, 1, 1,
0.6495219, 0.5408158, -0.3396832, 1, 1, 1, 1, 1,
0.6503618, -0.1329675, 3.4231, 1, 1, 1, 1, 1,
0.6554686, 1.349881, 0.5293462, 1, 1, 1, 1, 1,
0.6620843, 1.295601, 0.7367343, 1, 1, 1, 1, 1,
0.6656749, -0.5675026, 4.079491, 1, 1, 1, 1, 1,
0.6709885, -0.9053127, 1.75167, 1, 1, 1, 1, 1,
0.6765631, -0.2240685, 3.971274, 1, 1, 1, 1, 1,
0.6811391, -2.273042, 2.937057, 1, 1, 1, 1, 1,
0.6830238, -1.601498, 2.632431, 1, 1, 1, 1, 1,
0.6841644, -0.2182028, 0.5969478, 1, 1, 1, 1, 1,
0.6846262, 0.8686093, 1.446396, 1, 1, 1, 1, 1,
0.6894415, -0.5281949, 3.293174, 1, 1, 1, 1, 1,
0.694539, -1.731663, 1.58409, 1, 1, 1, 1, 1,
0.6996285, 0.3825142, 0.2667798, 1, 1, 1, 1, 1,
0.7010721, 0.7106102, 0.9194427, 0, 0, 1, 1, 1,
0.705214, -0.04075049, 1.411044, 1, 0, 0, 1, 1,
0.7069983, 0.5519282, -0.2143469, 1, 0, 0, 1, 1,
0.7096127, -0.3952933, 1.056343, 1, 0, 0, 1, 1,
0.7104607, 0.545624, -1.133263, 1, 0, 0, 1, 1,
0.7120789, 0.4842793, 0.2100909, 1, 0, 0, 1, 1,
0.713682, -0.3639786, 1.263579, 0, 0, 0, 1, 1,
0.7185033, -0.157406, 0.8531515, 0, 0, 0, 1, 1,
0.7289864, 0.9568563, 0.6201475, 0, 0, 0, 1, 1,
0.7394146, 1.07482, 0.8753003, 0, 0, 0, 1, 1,
0.7428571, -0.1155053, 2.546037, 0, 0, 0, 1, 1,
0.7436118, 1.098821, 2.562809, 0, 0, 0, 1, 1,
0.7472394, -0.5566459, 1.68082, 0, 0, 0, 1, 1,
0.7586465, -1.878589, 1.328798, 1, 1, 1, 1, 1,
0.7654424, -1.155627, 3.545236, 1, 1, 1, 1, 1,
0.7722258, 0.06188153, -0.1440798, 1, 1, 1, 1, 1,
0.773658, 0.3411205, 2.383888, 1, 1, 1, 1, 1,
0.7754359, 0.6410175, 2.909217, 1, 1, 1, 1, 1,
0.7756649, 1.081164, 2.573097, 1, 1, 1, 1, 1,
0.7849725, -0.4517441, 2.03081, 1, 1, 1, 1, 1,
0.7852494, 1.458992, 1.183758, 1, 1, 1, 1, 1,
0.7915311, -0.7718259, 2.877933, 1, 1, 1, 1, 1,
0.7947134, 0.5000182, 1.620153, 1, 1, 1, 1, 1,
0.8015614, 2.086378, -1.261646, 1, 1, 1, 1, 1,
0.8044893, 0.7995552, 0.7038969, 1, 1, 1, 1, 1,
0.8116671, 0.3028944, 0.9951048, 1, 1, 1, 1, 1,
0.8134645, -0.2672925, 3.119014, 1, 1, 1, 1, 1,
0.8153777, 1.066479, 0.5462501, 1, 1, 1, 1, 1,
0.8159637, -0.2565763, -0.1103705, 0, 0, 1, 1, 1,
0.8165934, 0.8222564, 1.034768, 1, 0, 0, 1, 1,
0.8247654, -0.763545, 2.017632, 1, 0, 0, 1, 1,
0.8315415, -2.173436, 1.35503, 1, 0, 0, 1, 1,
0.8351018, 2.299424, -1.313396, 1, 0, 0, 1, 1,
0.8420918, 0.06042412, 1.302768, 1, 0, 0, 1, 1,
0.8499483, -0.0655834, 0.8240026, 0, 0, 0, 1, 1,
0.8578033, -1.409431, 3.313071, 0, 0, 0, 1, 1,
0.8598025, -0.2842795, 1.257281, 0, 0, 0, 1, 1,
0.8607808, 0.3126485, 0.2909802, 0, 0, 0, 1, 1,
0.8610908, 1.652322, -2.191895, 0, 0, 0, 1, 1,
0.8678442, 0.09790403, 0.4113139, 0, 0, 0, 1, 1,
0.8679256, 0.6977098, 1.140725, 0, 0, 0, 1, 1,
0.8702376, 0.4373717, 3.246263, 1, 1, 1, 1, 1,
0.8719367, 0.6645936, -0.4583442, 1, 1, 1, 1, 1,
0.8739775, -1.667037, 1.684355, 1, 1, 1, 1, 1,
0.8766593, -1.655721, 1.939457, 1, 1, 1, 1, 1,
0.8768047, -1.346674, 1.833867, 1, 1, 1, 1, 1,
0.8838586, -0.1194411, 1.453746, 1, 1, 1, 1, 1,
0.8904837, -1.478364, 3.329561, 1, 1, 1, 1, 1,
0.8954559, 0.2097767, 0.7189036, 1, 1, 1, 1, 1,
0.8981065, -1.441353, 3.96831, 1, 1, 1, 1, 1,
0.9040824, -1.444879, 2.78319, 1, 1, 1, 1, 1,
0.9055885, -1.409165, 2.230012, 1, 1, 1, 1, 1,
0.9114799, -1.252834, 2.327937, 1, 1, 1, 1, 1,
0.9147848, 0.2109896, 3.188859, 1, 1, 1, 1, 1,
0.9176674, 0.7214653, -1.098649, 1, 1, 1, 1, 1,
0.9186078, -1.941002, 2.949093, 1, 1, 1, 1, 1,
0.919936, -0.7686278, 2.514717, 0, 0, 1, 1, 1,
0.9253011, -0.5528738, 2.198421, 1, 0, 0, 1, 1,
0.9296545, -2.821528, 1.617497, 1, 0, 0, 1, 1,
0.9346012, -1.664027, 3.087365, 1, 0, 0, 1, 1,
0.9350652, -0.3953682, 3.387912, 1, 0, 0, 1, 1,
0.9355918, -0.7324203, 1.293811, 1, 0, 0, 1, 1,
0.9475797, -1.143136, 0.2074468, 0, 0, 0, 1, 1,
0.9485946, -0.02630189, 3.000046, 0, 0, 0, 1, 1,
0.9532685, 0.1966683, 2.615014, 0, 0, 0, 1, 1,
0.9790662, 0.1080555, 0.5222107, 0, 0, 0, 1, 1,
0.9851088, 0.6122785, 1.689335, 0, 0, 0, 1, 1,
0.9867445, -0.3386739, 1.175077, 0, 0, 0, 1, 1,
0.9926379, -0.3190889, 1.155685, 0, 0, 0, 1, 1,
0.9928312, 0.01641099, 2.175826, 1, 1, 1, 1, 1,
0.9949784, -1.085991, 2.738787, 1, 1, 1, 1, 1,
0.9970475, -0.4040999, 1.180295, 1, 1, 1, 1, 1,
0.9976165, -0.1910189, 3.032247, 1, 1, 1, 1, 1,
1.001483, 1.217699, 1.222066, 1, 1, 1, 1, 1,
1.006662, 0.7196284, 1.948635, 1, 1, 1, 1, 1,
1.009313, -1.430059, 2.425869, 1, 1, 1, 1, 1,
1.010604, -1.672572, 2.158712, 1, 1, 1, 1, 1,
1.028386, -1.949682, 3.095616, 1, 1, 1, 1, 1,
1.03045, -1.784851, 1.030364, 1, 1, 1, 1, 1,
1.04263, -0.8362413, 1.48905, 1, 1, 1, 1, 1,
1.048991, 1.184061, 0.8211049, 1, 1, 1, 1, 1,
1.05663, 0.8237886, -1.374342, 1, 1, 1, 1, 1,
1.058452, -0.5895769, 0.5783315, 1, 1, 1, 1, 1,
1.058963, -0.4104452, 1.421116, 1, 1, 1, 1, 1,
1.060158, 1.067956, -0.5717926, 0, 0, 1, 1, 1,
1.06418, 0.7103968, 1.751543, 1, 0, 0, 1, 1,
1.064669, 1.314315, 4.142354, 1, 0, 0, 1, 1,
1.069499, -2.020497, 2.931417, 1, 0, 0, 1, 1,
1.08007, -0.1612177, 0.6411588, 1, 0, 0, 1, 1,
1.091733, -0.20893, 1.729546, 1, 0, 0, 1, 1,
1.09414, 0.2631318, 1.337162, 0, 0, 0, 1, 1,
1.100565, 0.7280278, -0.4549117, 0, 0, 0, 1, 1,
1.111972, 1.280921, -0.6912069, 0, 0, 0, 1, 1,
1.11679, -0.7060074, 1.782288, 0, 0, 0, 1, 1,
1.118279, 1.30318, -0.6176071, 0, 0, 0, 1, 1,
1.119425, 0.3357265, 1.403016, 0, 0, 0, 1, 1,
1.12539, 2.182261, 0.5918602, 0, 0, 0, 1, 1,
1.135321, 0.1361944, 1.873726, 1, 1, 1, 1, 1,
1.147311, 0.0516237, 2.292758, 1, 1, 1, 1, 1,
1.159156, 2.379657, -0.6203256, 1, 1, 1, 1, 1,
1.186608, 0.2191465, 2.131124, 1, 1, 1, 1, 1,
1.19548, -0.8353713, 3.676613, 1, 1, 1, 1, 1,
1.197351, -0.2945806, 0.9327571, 1, 1, 1, 1, 1,
1.198273, 1.022946, -1.184524, 1, 1, 1, 1, 1,
1.21743, -0.5439841, 1.96311, 1, 1, 1, 1, 1,
1.222414, 0.2192832, 2.083689, 1, 1, 1, 1, 1,
1.226977, 0.1818748, 1.84208, 1, 1, 1, 1, 1,
1.235638, -0.2559974, 0.6819035, 1, 1, 1, 1, 1,
1.241678, -0.2412578, 0.4296769, 1, 1, 1, 1, 1,
1.247382, -0.7335104, 0.3627379, 1, 1, 1, 1, 1,
1.247595, 0.9823313, 2.344593, 1, 1, 1, 1, 1,
1.255438, -0.8507974, 3.348372, 1, 1, 1, 1, 1,
1.256162, -1.089273, 2.249446, 0, 0, 1, 1, 1,
1.264239, 0.7383369, 1.387365, 1, 0, 0, 1, 1,
1.276464, -2.053613, 2.828476, 1, 0, 0, 1, 1,
1.281995, 0.7639691, 0.902139, 1, 0, 0, 1, 1,
1.294746, -1.258874, 4.353954, 1, 0, 0, 1, 1,
1.297978, 0.9613317, 0.1075997, 1, 0, 0, 1, 1,
1.300295, 0.4285389, 3.31114, 0, 0, 0, 1, 1,
1.303262, -0.9335323, 2.451658, 0, 0, 0, 1, 1,
1.304375, -1.624353, 2.697765, 0, 0, 0, 1, 1,
1.311212, -0.3248577, 2.23302, 0, 0, 0, 1, 1,
1.31861, -0.540951, 2.100249, 0, 0, 0, 1, 1,
1.322884, 2.127948, -0.01953809, 0, 0, 0, 1, 1,
1.327858, -0.004055596, 0.9383056, 0, 0, 0, 1, 1,
1.3404, 1.149376, 3.239366, 1, 1, 1, 1, 1,
1.359995, 1.273317, 0.921781, 1, 1, 1, 1, 1,
1.364322, 1.915757, 0.4020129, 1, 1, 1, 1, 1,
1.369139, -0.2125186, 0.6723384, 1, 1, 1, 1, 1,
1.382083, -1.603423, 4.44628, 1, 1, 1, 1, 1,
1.397067, -0.1313617, 0.9696821, 1, 1, 1, 1, 1,
1.401463, -1.311347, 2.702662, 1, 1, 1, 1, 1,
1.414712, -1.893198, 0.3466614, 1, 1, 1, 1, 1,
1.424396, -0.3117597, 1.194873, 1, 1, 1, 1, 1,
1.432658, -0.362016, 1.96048, 1, 1, 1, 1, 1,
1.432917, -0.3750457, 0.95486, 1, 1, 1, 1, 1,
1.434462, 1.683065, 2.973607, 1, 1, 1, 1, 1,
1.440103, -1.081722, 2.806012, 1, 1, 1, 1, 1,
1.447538, -0.3349686, 2.33562, 1, 1, 1, 1, 1,
1.46731, 0.06620987, 1.85165, 1, 1, 1, 1, 1,
1.476492, 1.480249, 0.3115029, 0, 0, 1, 1, 1,
1.477252, -0.6812462, 0.7382758, 1, 0, 0, 1, 1,
1.477344, -1.042474, 2.523946, 1, 0, 0, 1, 1,
1.486091, 1.197984, -0.1391324, 1, 0, 0, 1, 1,
1.488247, -1.381693, 0.7554269, 1, 0, 0, 1, 1,
1.502562, -0.275102, 1.026811, 1, 0, 0, 1, 1,
1.505525, -1.794123, 1.600315, 0, 0, 0, 1, 1,
1.506514, -0.7008263, 2.580221, 0, 0, 0, 1, 1,
1.510698, 1.605416, 0.868252, 0, 0, 0, 1, 1,
1.513636, -1.415663, 1.767202, 0, 0, 0, 1, 1,
1.516313, -1.389072, 2.145375, 0, 0, 0, 1, 1,
1.522113, -0.2436258, 1.546025, 0, 0, 0, 1, 1,
1.536303, -0.755401, 1.613404, 0, 0, 0, 1, 1,
1.548469, -0.4197839, 2.338078, 1, 1, 1, 1, 1,
1.554071, -0.5935233, 3.745875, 1, 1, 1, 1, 1,
1.556064, 1.646129, -0.2767451, 1, 1, 1, 1, 1,
1.557962, -0.8525719, 1.955154, 1, 1, 1, 1, 1,
1.568771, -1.949479, 2.144421, 1, 1, 1, 1, 1,
1.574625, 0.6335291, 1.695246, 1, 1, 1, 1, 1,
1.594427, -0.931217, 3.084061, 1, 1, 1, 1, 1,
1.595632, -0.1959528, 1.785201, 1, 1, 1, 1, 1,
1.595749, 1.268358, 2.041029, 1, 1, 1, 1, 1,
1.608857, -0.1943766, 1.703455, 1, 1, 1, 1, 1,
1.619364, 1.189406, 2.361565, 1, 1, 1, 1, 1,
1.622915, -1.903442, 2.434613, 1, 1, 1, 1, 1,
1.629401, 1.218538, 0.5326405, 1, 1, 1, 1, 1,
1.674767, -1.245868, 1.067407, 1, 1, 1, 1, 1,
1.681698, -0.9663104, 2.242136, 1, 1, 1, 1, 1,
1.689578, 0.5347639, 0.9668059, 0, 0, 1, 1, 1,
1.700832, -0.9907146, 2.505616, 1, 0, 0, 1, 1,
1.705105, 0.3634448, -0.508518, 1, 0, 0, 1, 1,
1.711118, 0.130031, 1.907902, 1, 0, 0, 1, 1,
1.71196, 1.222292, 1.280669, 1, 0, 0, 1, 1,
1.713249, 1.392672, 0.2195891, 1, 0, 0, 1, 1,
1.726232, -0.6792413, 1.043278, 0, 0, 0, 1, 1,
1.732148, -0.2924963, 2.056027, 0, 0, 0, 1, 1,
1.734259, -0.9955428, 3.871996, 0, 0, 0, 1, 1,
1.739188, 0.134114, 1.815784, 0, 0, 0, 1, 1,
1.76352, -0.4661748, 2.140993, 0, 0, 0, 1, 1,
1.767326, 1.066768, 3.032806, 0, 0, 0, 1, 1,
1.811958, 0.3442982, 3.522121, 0, 0, 0, 1, 1,
1.864963, -0.2904196, 1.498408, 1, 1, 1, 1, 1,
1.875468, -0.3172817, 2.07743, 1, 1, 1, 1, 1,
1.946408, -0.5092017, 1.258908, 1, 1, 1, 1, 1,
1.948571, 0.5075064, 1.897734, 1, 1, 1, 1, 1,
1.94913, 0.7685705, 1.449854, 1, 1, 1, 1, 1,
1.981775, 0.5121592, 1.025456, 1, 1, 1, 1, 1,
2.000436, 0.1679974, 0.8956922, 1, 1, 1, 1, 1,
2.005488, -0.2812179, 1.65282, 1, 1, 1, 1, 1,
2.030551, -2.117613, 3.627562, 1, 1, 1, 1, 1,
2.039683, 1.427387, 2.339542, 1, 1, 1, 1, 1,
2.045055, -0.585332, 1.098746, 1, 1, 1, 1, 1,
2.076645, -0.5215176, 1.579431, 1, 1, 1, 1, 1,
2.081552, 0.9292889, 1.870686, 1, 1, 1, 1, 1,
2.099026, 2.246557, 0.03960134, 1, 1, 1, 1, 1,
2.121547, 1.243878, 1.92095, 1, 1, 1, 1, 1,
2.14955, -1.478033, 0.7105647, 0, 0, 1, 1, 1,
2.185533, -0.8526571, 2.729309, 1, 0, 0, 1, 1,
2.211487, -1.006359, 4.359514, 1, 0, 0, 1, 1,
2.231166, 0.8668045, 0.7115315, 1, 0, 0, 1, 1,
2.238001, -0.894625, 1.621389, 1, 0, 0, 1, 1,
2.24806, 0.6904345, -0.2703192, 1, 0, 0, 1, 1,
2.278881, -0.4644644, 1.831789, 0, 0, 0, 1, 1,
2.282123, 1.020192, 1.131346, 0, 0, 0, 1, 1,
2.318155, -1.640221, 1.044194, 0, 0, 0, 1, 1,
2.336341, -0.7577803, 2.982522, 0, 0, 0, 1, 1,
2.338972, 1.241085, -0.3540666, 0, 0, 0, 1, 1,
2.367644, -1.683782, 1.60198, 0, 0, 0, 1, 1,
2.400516, -0.299151, 0.3137462, 0, 0, 0, 1, 1,
2.515269, 0.9164441, 1.086515, 1, 1, 1, 1, 1,
2.592723, 0.02218409, 2.755297, 1, 1, 1, 1, 1,
2.773732, -1.613055, 2.405122, 1, 1, 1, 1, 1,
2.866246, 1.531505, 1.554627, 1, 1, 1, 1, 1,
2.955972, 0.5996155, 0.3873484, 1, 1, 1, 1, 1,
3.428923, -0.3268755, 0.1043416, 1, 1, 1, 1, 1,
3.671265, -0.2733093, 2.806588, 1, 1, 1, 1, 1
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
var radius = 9.757335;
var distance = 34.27223;
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
mvMatrix.translate( -0.1110644, -0.1070347, 0.672013 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.27223);
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