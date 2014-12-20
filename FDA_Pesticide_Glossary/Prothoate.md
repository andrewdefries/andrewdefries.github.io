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
-3.293451, 1.059649, -2.442986, 1, 0, 0, 1,
-3.254458, -1.366372, -2.655218, 1, 0.007843138, 0, 1,
-2.948507, 2.162771, -1.169451, 1, 0.01176471, 0, 1,
-2.845271, 1.663305, -0.09071585, 1, 0.01960784, 0, 1,
-2.837999, 0.1651095, -2.212265, 1, 0.02352941, 0, 1,
-2.809069, -0.4931343, -0.5013995, 1, 0.03137255, 0, 1,
-2.53503, 1.704826, -1.247521, 1, 0.03529412, 0, 1,
-2.512823, 0.8971928, -1.873793, 1, 0.04313726, 0, 1,
-2.500499, 0.8561913, -0.6231494, 1, 0.04705882, 0, 1,
-2.494592, -0.4221372, -2.064352, 1, 0.05490196, 0, 1,
-2.445168, 1.307949, -1.492306, 1, 0.05882353, 0, 1,
-2.435304, -0.8385915, -1.476682, 1, 0.06666667, 0, 1,
-2.426942, 2.523896, -0.4536819, 1, 0.07058824, 0, 1,
-2.402609, -0.3848542, -2.718269, 1, 0.07843138, 0, 1,
-2.372664, -0.6268879, -1.4359, 1, 0.08235294, 0, 1,
-2.337405, -0.1965975, -2.80585, 1, 0.09019608, 0, 1,
-2.275589, -1.52706, -1.533631, 1, 0.09411765, 0, 1,
-2.26684, -1.560927, -2.75284, 1, 0.1019608, 0, 1,
-2.19013, 2.141568, -0.8383904, 1, 0.1098039, 0, 1,
-2.152691, 0.6275049, -1.522107, 1, 0.1137255, 0, 1,
-2.100981, 1.681996, -0.9474853, 1, 0.1215686, 0, 1,
-2.085482, 0.2760724, -2.481822, 1, 0.1254902, 0, 1,
-2.084949, 1.626934, -1.784132, 1, 0.1333333, 0, 1,
-2.079698, 1.921178, -1.390858, 1, 0.1372549, 0, 1,
-2.071601, -0.7801371, -2.52218, 1, 0.145098, 0, 1,
-2.065377, 0.3974528, -0.5159405, 1, 0.1490196, 0, 1,
-2.050564, 1.122996, -2.1858, 1, 0.1568628, 0, 1,
-2.014974, 1.682388, 0.5347958, 1, 0.1607843, 0, 1,
-2.00368, -0.7487985, -2.857683, 1, 0.1686275, 0, 1,
-1.989364, -0.1775966, 0.4807293, 1, 0.172549, 0, 1,
-1.987521, -0.7014273, -2.523574, 1, 0.1803922, 0, 1,
-1.973324, -0.6008517, -2.914991, 1, 0.1843137, 0, 1,
-1.959576, -0.415503, -2.536481, 1, 0.1921569, 0, 1,
-1.949047, -1.557981, -0.5293511, 1, 0.1960784, 0, 1,
-1.931919, -0.3923759, 0.854522, 1, 0.2039216, 0, 1,
-1.909783, 0.4179518, -0.6780354, 1, 0.2117647, 0, 1,
-1.899175, 0.5510416, -1.33378, 1, 0.2156863, 0, 1,
-1.895604, -0.2272111, -3.054502, 1, 0.2235294, 0, 1,
-1.885994, 2.779115, -0.5962648, 1, 0.227451, 0, 1,
-1.867403, -0.2519051, -0.7863509, 1, 0.2352941, 0, 1,
-1.853917, -0.5501987, -1.739067, 1, 0.2392157, 0, 1,
-1.852263, -0.2872329, -0.215818, 1, 0.2470588, 0, 1,
-1.829434, 0.5355005, -0.3430063, 1, 0.2509804, 0, 1,
-1.82429, 0.7524729, -0.4419467, 1, 0.2588235, 0, 1,
-1.819308, -0.4874993, -1.579226, 1, 0.2627451, 0, 1,
-1.811773, 0.3779073, 0.2499845, 1, 0.2705882, 0, 1,
-1.799237, 1.893474, -2.558443, 1, 0.2745098, 0, 1,
-1.798634, -0.1861913, -1.860722, 1, 0.282353, 0, 1,
-1.779314, 0.273572, -1.120098, 1, 0.2862745, 0, 1,
-1.778584, -0.5091605, 0.4298797, 1, 0.2941177, 0, 1,
-1.775436, 1.679618, -2.196846, 1, 0.3019608, 0, 1,
-1.768424, -0.1529178, -1.915729, 1, 0.3058824, 0, 1,
-1.762541, -0.3245548, -1.670377, 1, 0.3137255, 0, 1,
-1.761181, 1.571377, 0.1243426, 1, 0.3176471, 0, 1,
-1.753709, 1.073159, -0.6659872, 1, 0.3254902, 0, 1,
-1.746902, 1.799197, -1.796071, 1, 0.3294118, 0, 1,
-1.737997, 0.7413803, -1.378069, 1, 0.3372549, 0, 1,
-1.737327, 0.2025373, -1.362476, 1, 0.3411765, 0, 1,
-1.723996, 0.2557976, -4.442769, 1, 0.3490196, 0, 1,
-1.699678, -1.774316, -2.895968, 1, 0.3529412, 0, 1,
-1.696512, -2.452558, -2.626049, 1, 0.3607843, 0, 1,
-1.695754, 1.628802, 0.8108614, 1, 0.3647059, 0, 1,
-1.694682, 0.981714, 2.207965, 1, 0.372549, 0, 1,
-1.69222, -3.978123, -1.319973, 1, 0.3764706, 0, 1,
-1.687534, 3.200809, -0.2531188, 1, 0.3843137, 0, 1,
-1.687168, 0.849251, -0.6785415, 1, 0.3882353, 0, 1,
-1.684878, -0.116218, -1.247397, 1, 0.3960784, 0, 1,
-1.679371, -0.1695167, -0.9391226, 1, 0.4039216, 0, 1,
-1.676741, 0.4714527, -1.37797, 1, 0.4078431, 0, 1,
-1.673689, -2.247215, -0.9839991, 1, 0.4156863, 0, 1,
-1.652827, -2.140069, -3.671127, 1, 0.4196078, 0, 1,
-1.647407, 0.2863516, -2.2287, 1, 0.427451, 0, 1,
-1.639838, -0.841583, -2.599247, 1, 0.4313726, 0, 1,
-1.63859, 0.06525325, -2.543164, 1, 0.4392157, 0, 1,
-1.63215, 1.257753, -0.7944644, 1, 0.4431373, 0, 1,
-1.608988, 0.4776681, -2.052717, 1, 0.4509804, 0, 1,
-1.598991, -0.8457372, -2.533494, 1, 0.454902, 0, 1,
-1.589592, 0.2616702, -0.7313554, 1, 0.4627451, 0, 1,
-1.576172, 0.5669082, -1.212484, 1, 0.4666667, 0, 1,
-1.560726, 0.7581151, 0.4108545, 1, 0.4745098, 0, 1,
-1.551587, -0.9797015, -2.007968, 1, 0.4784314, 0, 1,
-1.542602, -0.3222597, -3.277454, 1, 0.4862745, 0, 1,
-1.518316, 0.4495995, -2.923947, 1, 0.4901961, 0, 1,
-1.509488, -0.8962768, -1.375526, 1, 0.4980392, 0, 1,
-1.491821, 0.176063, -1.925392, 1, 0.5058824, 0, 1,
-1.487143, -1.715369, -3.250304, 1, 0.509804, 0, 1,
-1.483505, 0.2439472, -2.223006, 1, 0.5176471, 0, 1,
-1.475772, 0.827799, -1.521041, 1, 0.5215687, 0, 1,
-1.472364, 2.295558, 0.009402073, 1, 0.5294118, 0, 1,
-1.465635, -0.232073, -1.534671, 1, 0.5333334, 0, 1,
-1.45861, -0.08367199, -0.4280779, 1, 0.5411765, 0, 1,
-1.433676, 0.901566, -2.446718, 1, 0.5450981, 0, 1,
-1.431465, -0.7894955, -1.708292, 1, 0.5529412, 0, 1,
-1.429019, -1.414166, -1.368735, 1, 0.5568628, 0, 1,
-1.425463, -1.581732, -2.754574, 1, 0.5647059, 0, 1,
-1.42501, 1.313531, -0.2654158, 1, 0.5686275, 0, 1,
-1.424945, -0.7163224, -0.2575056, 1, 0.5764706, 0, 1,
-1.416855, -1.724084, -4.500528, 1, 0.5803922, 0, 1,
-1.398971, 0.7064029, -0.9540018, 1, 0.5882353, 0, 1,
-1.393171, 0.6045504, 0.04754373, 1, 0.5921569, 0, 1,
-1.391771, 1.048581, -1.223122, 1, 0.6, 0, 1,
-1.389567, -0.3768528, -1.452254, 1, 0.6078432, 0, 1,
-1.386864, -0.9428551, -0.7419503, 1, 0.6117647, 0, 1,
-1.363745, -0.5327379, -0.2863706, 1, 0.6196079, 0, 1,
-1.360219, -0.5944053, -1.522509, 1, 0.6235294, 0, 1,
-1.341091, -0.2625181, -0.7762345, 1, 0.6313726, 0, 1,
-1.326331, 0.4418379, 0.02284224, 1, 0.6352941, 0, 1,
-1.322136, -0.2558465, -0.5831614, 1, 0.6431373, 0, 1,
-1.2979, -0.6869597, -1.098294, 1, 0.6470588, 0, 1,
-1.297437, -0.8049218, -2.919733, 1, 0.654902, 0, 1,
-1.288615, -0.4908584, -0.5827513, 1, 0.6588235, 0, 1,
-1.286703, -0.05606556, -1.578507, 1, 0.6666667, 0, 1,
-1.284528, -0.4894012, -1.498341, 1, 0.6705883, 0, 1,
-1.284275, -0.07024565, -2.875062, 1, 0.6784314, 0, 1,
-1.28176, -0.3386635, -1.624251, 1, 0.682353, 0, 1,
-1.280447, -0.152273, -1.164566, 1, 0.6901961, 0, 1,
-1.278231, -0.7318479, -2.457131, 1, 0.6941177, 0, 1,
-1.276874, 0.01277676, -2.059774, 1, 0.7019608, 0, 1,
-1.275555, -1.209641, -0.562291, 1, 0.7098039, 0, 1,
-1.267309, -0.5116568, -0.6881903, 1, 0.7137255, 0, 1,
-1.256997, -0.01173042, -1.210618, 1, 0.7215686, 0, 1,
-1.250854, -0.479535, -0.4632911, 1, 0.7254902, 0, 1,
-1.24975, 0.6676673, -1.38554, 1, 0.7333333, 0, 1,
-1.245995, -0.3903874, -1.807441, 1, 0.7372549, 0, 1,
-1.245792, 0.8503019, -0.7741528, 1, 0.7450981, 0, 1,
-1.241864, 0.3998822, -1.060383, 1, 0.7490196, 0, 1,
-1.23775, 0.1675144, -0.5139925, 1, 0.7568628, 0, 1,
-1.231522, 1.056045, 0.4194397, 1, 0.7607843, 0, 1,
-1.222926, -0.16283, -1.138743, 1, 0.7686275, 0, 1,
-1.222569, -0.1211741, 0.8155116, 1, 0.772549, 0, 1,
-1.217282, -0.9658854, 0.513966, 1, 0.7803922, 0, 1,
-1.217142, -1.414608, -2.689163, 1, 0.7843137, 0, 1,
-1.20852, 0.2822446, -1.11535, 1, 0.7921569, 0, 1,
-1.207923, 0.2547356, -1.367508, 1, 0.7960784, 0, 1,
-1.206168, 0.1925317, -1.560755, 1, 0.8039216, 0, 1,
-1.198322, -0.5437802, -1.160761, 1, 0.8117647, 0, 1,
-1.196385, 0.5666295, -0.2365247, 1, 0.8156863, 0, 1,
-1.1957, -0.2571672, -1.180084, 1, 0.8235294, 0, 1,
-1.180155, 4.145576e-05, -1.925536, 1, 0.827451, 0, 1,
-1.17897, -1.611487, -1.79759, 1, 0.8352941, 0, 1,
-1.176846, -0.8093261, -1.354876, 1, 0.8392157, 0, 1,
-1.150138, -0.515632, -2.337322, 1, 0.8470588, 0, 1,
-1.145366, -1.484257, -2.584489, 1, 0.8509804, 0, 1,
-1.142711, 0.7623968, -2.34291, 1, 0.8588235, 0, 1,
-1.138856, -0.5154957, -0.6839489, 1, 0.8627451, 0, 1,
-1.129499, -1.575925, -4.009875, 1, 0.8705882, 0, 1,
-1.125405, 0.2783208, -2.969717, 1, 0.8745098, 0, 1,
-1.121463, -0.1040313, -1.644162, 1, 0.8823529, 0, 1,
-1.111585, -1.170896, -2.959, 1, 0.8862745, 0, 1,
-1.101613, 0.7185681, 0.1795568, 1, 0.8941177, 0, 1,
-1.096401, 0.05976507, -2.344739, 1, 0.8980392, 0, 1,
-1.088353, -0.1357641, -1.610583, 1, 0.9058824, 0, 1,
-1.085449, -0.6459253, -0.9319118, 1, 0.9137255, 0, 1,
-1.080282, 1.374654, 1.182983, 1, 0.9176471, 0, 1,
-1.07778, 0.6980467, -0.9205333, 1, 0.9254902, 0, 1,
-1.077658, 0.2783912, -2.557482, 1, 0.9294118, 0, 1,
-1.076018, 0.1231549, -1.255778, 1, 0.9372549, 0, 1,
-1.07597, -0.5858566, -2.058178, 1, 0.9411765, 0, 1,
-1.07085, 0.06900854, -0.06840421, 1, 0.9490196, 0, 1,
-1.070585, -1.896349, -1.266586, 1, 0.9529412, 0, 1,
-1.067183, 1.378377, 0.2019834, 1, 0.9607843, 0, 1,
-1.066548, -0.2569404, -1.432154, 1, 0.9647059, 0, 1,
-1.061298, -0.5476997, -1.690382, 1, 0.972549, 0, 1,
-1.054934, 1.175245, -0.1434363, 1, 0.9764706, 0, 1,
-1.050377, 0.4435504, -1.243228, 1, 0.9843137, 0, 1,
-1.047832, 1.146381, -1.469008, 1, 0.9882353, 0, 1,
-1.041355, 0.2446211, -1.82747, 1, 0.9960784, 0, 1,
-1.040516, 0.157976, -2.658374, 0.9960784, 1, 0, 1,
-1.0378, 0.02051336, -0.4761086, 0.9921569, 1, 0, 1,
-1.035576, -1.009575, -2.660319, 0.9843137, 1, 0, 1,
-1.02596, -0.1405488, -0.8139678, 0.9803922, 1, 0, 1,
-1.024144, -1.519594, -3.701237, 0.972549, 1, 0, 1,
-1.018888, -1.429831, -4.114573, 0.9686275, 1, 0, 1,
-1.017243, 0.93156, -0.9086944, 0.9607843, 1, 0, 1,
-1.01273, 2.760449, -0.501668, 0.9568627, 1, 0, 1,
-1.007625, -0.03574641, -2.806238, 0.9490196, 1, 0, 1,
-1.004743, 0.4014392, -0.07320846, 0.945098, 1, 0, 1,
-0.9999898, 0.3391916, -1.035576, 0.9372549, 1, 0, 1,
-0.9975009, -1.250919, -1.96141, 0.9333333, 1, 0, 1,
-0.9879265, 1.035807, 0.1075093, 0.9254902, 1, 0, 1,
-0.9870152, -1.11226, -3.949389, 0.9215686, 1, 0, 1,
-0.9788707, -0.3005351, -2.931874, 0.9137255, 1, 0, 1,
-0.9775264, 0.602288, -1.521007, 0.9098039, 1, 0, 1,
-0.973125, -0.3380848, -2.961729, 0.9019608, 1, 0, 1,
-0.9666916, -0.1296237, -3.078883, 0.8941177, 1, 0, 1,
-0.9660245, -0.08464343, -3.268293, 0.8901961, 1, 0, 1,
-0.9635288, -0.6588089, -2.767129, 0.8823529, 1, 0, 1,
-0.962759, -0.5985634, -2.487348, 0.8784314, 1, 0, 1,
-0.9625642, 0.482128, -1.738386, 0.8705882, 1, 0, 1,
-0.9569014, -0.4024886, -0.4123331, 0.8666667, 1, 0, 1,
-0.9566277, -1.655418, -4.545149, 0.8588235, 1, 0, 1,
-0.9563568, -1.396489, -2.570657, 0.854902, 1, 0, 1,
-0.9555039, 0.2023256, -0.7020376, 0.8470588, 1, 0, 1,
-0.9554116, 1.023927, -0.1009454, 0.8431373, 1, 0, 1,
-0.947086, 0.08144354, -1.250146, 0.8352941, 1, 0, 1,
-0.9337561, -0.946953, -1.39247, 0.8313726, 1, 0, 1,
-0.9324148, 0.305701, -1.118894, 0.8235294, 1, 0, 1,
-0.9247602, -0.1980815, -2.102458, 0.8196079, 1, 0, 1,
-0.9229177, -0.9230531, -2.935461, 0.8117647, 1, 0, 1,
-0.9182385, -2.149948, -2.5845, 0.8078431, 1, 0, 1,
-0.9131197, -1.520174, -3.16787, 0.8, 1, 0, 1,
-0.9085678, -0.007121571, -2.299899, 0.7921569, 1, 0, 1,
-0.9084302, 1.999662, -0.5451018, 0.7882353, 1, 0, 1,
-0.9022992, 0.946715, 0.3327205, 0.7803922, 1, 0, 1,
-0.9007043, -1.376259, -2.012636, 0.7764706, 1, 0, 1,
-0.8961799, -0.3388334, -2.600581, 0.7686275, 1, 0, 1,
-0.8944989, 0.9017941, -2.504436, 0.7647059, 1, 0, 1,
-0.8918351, 1.630328, -0.4093061, 0.7568628, 1, 0, 1,
-0.8816291, -0.2632253, -4.695509, 0.7529412, 1, 0, 1,
-0.8778219, -0.8044847, -2.386951, 0.7450981, 1, 0, 1,
-0.8775333, 1.080308, -1.017396, 0.7411765, 1, 0, 1,
-0.8712244, 0.4192322, -1.2183, 0.7333333, 1, 0, 1,
-0.871062, 0.8983062, -1.057334, 0.7294118, 1, 0, 1,
-0.8708546, 0.6933711, -0.8427217, 0.7215686, 1, 0, 1,
-0.855813, -3.021245, -4.329467, 0.7176471, 1, 0, 1,
-0.8492163, 2.760312, -1.24312, 0.7098039, 1, 0, 1,
-0.8413736, -0.9027336, -1.772887, 0.7058824, 1, 0, 1,
-0.8320562, -0.4784893, -1.488697, 0.6980392, 1, 0, 1,
-0.8320053, 1.186214, 0.2796557, 0.6901961, 1, 0, 1,
-0.8311402, 0.326682, -1.93816, 0.6862745, 1, 0, 1,
-0.8301753, -0.3523755, -3.665047, 0.6784314, 1, 0, 1,
-0.8273017, 0.03177604, -0.9998685, 0.6745098, 1, 0, 1,
-0.8261966, 0.5278965, -2.249162, 0.6666667, 1, 0, 1,
-0.8194457, 1.187007, -0.3478832, 0.6627451, 1, 0, 1,
-0.8175219, -0.8172108, -3.100878, 0.654902, 1, 0, 1,
-0.8168023, -1.353572, -1.691779, 0.6509804, 1, 0, 1,
-0.8117025, -0.03031492, -1.512918, 0.6431373, 1, 0, 1,
-0.8110676, -0.4645081, -0.4581642, 0.6392157, 1, 0, 1,
-0.8104459, -1.292004, -0.6381224, 0.6313726, 1, 0, 1,
-0.8090817, -0.7237106, -2.28683, 0.627451, 1, 0, 1,
-0.8079436, -1.315782, -1.810959, 0.6196079, 1, 0, 1,
-0.8060982, -0.7940142, -2.729116, 0.6156863, 1, 0, 1,
-0.7986397, -0.7080525, -0.4196473, 0.6078432, 1, 0, 1,
-0.7963054, 0.02786801, -0.2791905, 0.6039216, 1, 0, 1,
-0.7959976, 0.8755862, -0.8408764, 0.5960785, 1, 0, 1,
-0.7953952, 1.180098, 1.183841, 0.5882353, 1, 0, 1,
-0.7951527, -0.321899, -2.156683, 0.5843138, 1, 0, 1,
-0.7861912, -1.098596, -1.953556, 0.5764706, 1, 0, 1,
-0.7818159, -0.7574798, -0.8507016, 0.572549, 1, 0, 1,
-0.7779787, -0.1690634, -1.15525, 0.5647059, 1, 0, 1,
-0.7735063, -2.143947, -2.212507, 0.5607843, 1, 0, 1,
-0.772877, 1.01386, -0.7143623, 0.5529412, 1, 0, 1,
-0.7720386, -0.6196974, -3.409211, 0.5490196, 1, 0, 1,
-0.762791, -0.3148287, -2.483651, 0.5411765, 1, 0, 1,
-0.7615981, -0.6218786, -1.764838, 0.5372549, 1, 0, 1,
-0.7605233, -1.301726, -2.232065, 0.5294118, 1, 0, 1,
-0.7562535, 0.4102165, -0.3101912, 0.5254902, 1, 0, 1,
-0.7554758, 0.961616, 0.3471843, 0.5176471, 1, 0, 1,
-0.7536976, 1.080019, -1.220042, 0.5137255, 1, 0, 1,
-0.7454683, -0.5787566, -1.962557, 0.5058824, 1, 0, 1,
-0.7435309, -0.5445889, -4.268243, 0.5019608, 1, 0, 1,
-0.7425213, -0.3506004, -1.134052, 0.4941176, 1, 0, 1,
-0.7386647, -0.1308522, -0.3849699, 0.4862745, 1, 0, 1,
-0.7353213, 0.8052747, -0.3725126, 0.4823529, 1, 0, 1,
-0.731798, -1.487015, -1.9129, 0.4745098, 1, 0, 1,
-0.7274526, -0.8653021, -2.304496, 0.4705882, 1, 0, 1,
-0.7245907, 0.3036863, 0.7143954, 0.4627451, 1, 0, 1,
-0.7104395, 0.2318697, -0.1792027, 0.4588235, 1, 0, 1,
-0.7081002, 0.01890108, -3.879354, 0.4509804, 1, 0, 1,
-0.7073622, 0.08953007, -1.990165, 0.4470588, 1, 0, 1,
-0.7047248, -0.6684956, 0.1034016, 0.4392157, 1, 0, 1,
-0.6983616, -1.364457, -2.178029, 0.4352941, 1, 0, 1,
-0.6981566, 0.8309892, -1.739298, 0.427451, 1, 0, 1,
-0.6959625, 0.059714, 0.9877938, 0.4235294, 1, 0, 1,
-0.6948254, 1.34835, 0.8402152, 0.4156863, 1, 0, 1,
-0.6942231, -1.062332, -3.529291, 0.4117647, 1, 0, 1,
-0.6911771, -1.056545, -5.165357, 0.4039216, 1, 0, 1,
-0.6882232, 0.2634659, -2.304144, 0.3960784, 1, 0, 1,
-0.6872891, 2.468609, 0.5465807, 0.3921569, 1, 0, 1,
-0.6865678, 0.6556571, -0.935147, 0.3843137, 1, 0, 1,
-0.6839613, 2.151455, -1.019476, 0.3803922, 1, 0, 1,
-0.6816421, 1.60383, 0.7317887, 0.372549, 1, 0, 1,
-0.6781757, 0.177517, -1.752854, 0.3686275, 1, 0, 1,
-0.6726757, 1.416292, -1.163365, 0.3607843, 1, 0, 1,
-0.6701284, -1.281311, -2.641192, 0.3568628, 1, 0, 1,
-0.6665791, 0.5011074, -1.343359, 0.3490196, 1, 0, 1,
-0.6631012, -0.4743929, -0.8309224, 0.345098, 1, 0, 1,
-0.6620864, -0.08047111, -0.7085472, 0.3372549, 1, 0, 1,
-0.6611812, 1.197263, -0.6099116, 0.3333333, 1, 0, 1,
-0.6609707, -0.5412593, -2.626508, 0.3254902, 1, 0, 1,
-0.6582854, 0.7141236, -1.509927, 0.3215686, 1, 0, 1,
-0.6572589, -0.3305507, -2.043358, 0.3137255, 1, 0, 1,
-0.6522055, -0.2613257, -2.343271, 0.3098039, 1, 0, 1,
-0.6495768, 0.1610755, -0.5753245, 0.3019608, 1, 0, 1,
-0.6484465, -0.312057, -1.237311, 0.2941177, 1, 0, 1,
-0.6464741, 0.3509291, -1.218176, 0.2901961, 1, 0, 1,
-0.6446356, -0.3365018, -2.455854, 0.282353, 1, 0, 1,
-0.6378163, -0.3816574, -1.055554, 0.2784314, 1, 0, 1,
-0.6375898, 1.174793, -1.725553, 0.2705882, 1, 0, 1,
-0.6342008, 1.214135, -0.07051395, 0.2666667, 1, 0, 1,
-0.6289701, 0.3595188, -0.07999603, 0.2588235, 1, 0, 1,
-0.6267153, -0.1737597, -2.43648, 0.254902, 1, 0, 1,
-0.6220061, -2.082566, -3.538753, 0.2470588, 1, 0, 1,
-0.6218516, 0.5406904, -1.388831, 0.2431373, 1, 0, 1,
-0.6212022, 1.351793, -0.4669331, 0.2352941, 1, 0, 1,
-0.6182849, 1.076977, -0.3113113, 0.2313726, 1, 0, 1,
-0.6146647, 0.6272913, -0.3767558, 0.2235294, 1, 0, 1,
-0.6124871, -0.4858225, -1.469446, 0.2196078, 1, 0, 1,
-0.6097468, 0.377839, -1.320652, 0.2117647, 1, 0, 1,
-0.6073688, -0.5408683, -2.292773, 0.2078431, 1, 0, 1,
-0.6025013, -0.1959158, -1.07585, 0.2, 1, 0, 1,
-0.6013843, -0.7209385, -0.3191699, 0.1921569, 1, 0, 1,
-0.6012065, -0.4701682, -1.706682, 0.1882353, 1, 0, 1,
-0.597537, -1.201178, -2.846884, 0.1803922, 1, 0, 1,
-0.5974485, -0.4381049, -1.304504, 0.1764706, 1, 0, 1,
-0.5970864, -0.1970052, -1.006225, 0.1686275, 1, 0, 1,
-0.5963448, -0.299809, -0.6103078, 0.1647059, 1, 0, 1,
-0.5951258, -0.3047479, -1.021904, 0.1568628, 1, 0, 1,
-0.5947981, 1.583556, 0.08802094, 0.1529412, 1, 0, 1,
-0.594349, -0.7499694, -4.281519, 0.145098, 1, 0, 1,
-0.5917655, 1.81997, -0.312107, 0.1411765, 1, 0, 1,
-0.5843189, 1.570137, -0.1189754, 0.1333333, 1, 0, 1,
-0.5830427, 0.5400318, -0.3333329, 0.1294118, 1, 0, 1,
-0.5817872, 1.36122, -2.113685, 0.1215686, 1, 0, 1,
-0.5796363, -0.5889782, -3.387367, 0.1176471, 1, 0, 1,
-0.5788058, 0.3743617, -1.792699, 0.1098039, 1, 0, 1,
-0.5780876, -0.1571261, -2.693179, 0.1058824, 1, 0, 1,
-0.5743011, -2.241302, -4.658413, 0.09803922, 1, 0, 1,
-0.5708712, 1.427697, -0.1960053, 0.09019608, 1, 0, 1,
-0.5688168, -0.5888116, -2.180858, 0.08627451, 1, 0, 1,
-0.5640302, -0.09257798, -1.81401, 0.07843138, 1, 0, 1,
-0.5525083, -0.3533645, -4.558486, 0.07450981, 1, 0, 1,
-0.5505536, -0.1615999, -1.001032, 0.06666667, 1, 0, 1,
-0.547962, -0.1930481, -2.980631, 0.0627451, 1, 0, 1,
-0.5456833, -1.841076, -2.554871, 0.05490196, 1, 0, 1,
-0.5426383, -0.4887725, -3.825557, 0.05098039, 1, 0, 1,
-0.5350873, 0.2786263, -2.140369, 0.04313726, 1, 0, 1,
-0.5347586, -1.29891, -1.469915, 0.03921569, 1, 0, 1,
-0.5311715, 0.57199, -0.6860801, 0.03137255, 1, 0, 1,
-0.5269148, 1.038864, -0.4105223, 0.02745098, 1, 0, 1,
-0.5264245, -0.06093071, -2.755795, 0.01960784, 1, 0, 1,
-0.5190645, 0.3923129, 0.1730007, 0.01568628, 1, 0, 1,
-0.5186024, -0.3592725, -1.388234, 0.007843138, 1, 0, 1,
-0.5147205, 2.823088, -2.453336, 0.003921569, 1, 0, 1,
-0.5104266, -0.07518885, -2.085189, 0, 1, 0.003921569, 1,
-0.508253, 0.3645394, -0.05935831, 0, 1, 0.01176471, 1,
-0.5038785, -1.368702, -3.234552, 0, 1, 0.01568628, 1,
-0.4956536, -1.368261, -4.849144, 0, 1, 0.02352941, 1,
-0.495542, 0.536733, -0.5138589, 0, 1, 0.02745098, 1,
-0.4895452, -0.2825557, -2.576296, 0, 1, 0.03529412, 1,
-0.4893422, 0.1017041, -1.105707, 0, 1, 0.03921569, 1,
-0.4888147, -0.1422048, -2.548755, 0, 1, 0.04705882, 1,
-0.4884, -2.028472, -3.307736, 0, 1, 0.05098039, 1,
-0.487769, 0.5922768, -0.6746143, 0, 1, 0.05882353, 1,
-0.4865012, 0.04432013, -1.934449, 0, 1, 0.0627451, 1,
-0.4760182, -0.6183695, -1.287967, 0, 1, 0.07058824, 1,
-0.4708153, -1.079837, -2.134341, 0, 1, 0.07450981, 1,
-0.470489, 0.1023748, -3.179754, 0, 1, 0.08235294, 1,
-0.4690819, -0.4130961, -3.458298, 0, 1, 0.08627451, 1,
-0.465274, 0.2843543, -0.1758425, 0, 1, 0.09411765, 1,
-0.4634566, -0.7785194, -1.729585, 0, 1, 0.1019608, 1,
-0.4633085, -1.192043, -4.369956, 0, 1, 0.1058824, 1,
-0.4627818, 0.01095024, -0.4624265, 0, 1, 0.1137255, 1,
-0.460307, -0.21229, -2.796856, 0, 1, 0.1176471, 1,
-0.4432257, -0.9342058, -1.225774, 0, 1, 0.1254902, 1,
-0.4431181, 0.898455, -1.23817, 0, 1, 0.1294118, 1,
-0.4415621, 0.103733, -1.744782, 0, 1, 0.1372549, 1,
-0.441025, -0.8587531, -2.427263, 0, 1, 0.1411765, 1,
-0.4379435, -0.3072777, -2.649631, 0, 1, 0.1490196, 1,
-0.4312671, -0.1264963, -1.47532, 0, 1, 0.1529412, 1,
-0.4303198, 1.240928, -1.068268, 0, 1, 0.1607843, 1,
-0.4285685, 0.8541735, 0.3517607, 0, 1, 0.1647059, 1,
-0.4243367, 1.972498, -0.7887959, 0, 1, 0.172549, 1,
-0.4218191, -0.4278865, -2.585489, 0, 1, 0.1764706, 1,
-0.4209325, -0.6097421, -2.740854, 0, 1, 0.1843137, 1,
-0.4209137, -2.406477, -1.665316, 0, 1, 0.1882353, 1,
-0.4201957, 1.583721, -0.6127863, 0, 1, 0.1960784, 1,
-0.4177839, -0.4509905, -2.534226, 0, 1, 0.2039216, 1,
-0.4173902, -1.392406, -0.7623454, 0, 1, 0.2078431, 1,
-0.4147153, 0.5858082, -2.190458, 0, 1, 0.2156863, 1,
-0.4144655, -0.9440342, -3.187851, 0, 1, 0.2196078, 1,
-0.4137843, 1.366504, 0.2198224, 0, 1, 0.227451, 1,
-0.4129449, 0.167358, -1.514043, 0, 1, 0.2313726, 1,
-0.4104561, -0.1681638, -1.97551, 0, 1, 0.2392157, 1,
-0.4089319, -0.9477274, -2.60023, 0, 1, 0.2431373, 1,
-0.4082362, 0.7214707, -0.6362004, 0, 1, 0.2509804, 1,
-0.4064633, -0.01120583, -2.860248, 0, 1, 0.254902, 1,
-0.4034498, -1.113671, -3.766227, 0, 1, 0.2627451, 1,
-0.402279, 1.298099, -1.033385, 0, 1, 0.2666667, 1,
-0.3992879, 0.3362609, -0.6828254, 0, 1, 0.2745098, 1,
-0.3985406, 0.9870911, 1.082267, 0, 1, 0.2784314, 1,
-0.3978018, 1.400069, 0.198329, 0, 1, 0.2862745, 1,
-0.3858108, 1.70717, -2.265941, 0, 1, 0.2901961, 1,
-0.3855063, -0.5441121, -2.285196, 0, 1, 0.2980392, 1,
-0.3818097, -0.4331374, -3.083459, 0, 1, 0.3058824, 1,
-0.3797064, 0.1269791, 0.8053923, 0, 1, 0.3098039, 1,
-0.3785794, -0.7540395, -1.886558, 0, 1, 0.3176471, 1,
-0.3765196, -1.067127, -1.789809, 0, 1, 0.3215686, 1,
-0.3730604, 0.3755077, -1.306651, 0, 1, 0.3294118, 1,
-0.3708749, 1.227197, -3.01965, 0, 1, 0.3333333, 1,
-0.3689693, 1.602676, -0.04742141, 0, 1, 0.3411765, 1,
-0.3679912, 0.3530265, 1.13839, 0, 1, 0.345098, 1,
-0.3661288, 1.340342, -0.5535351, 0, 1, 0.3529412, 1,
-0.3654267, -0.7124494, -4.352883, 0, 1, 0.3568628, 1,
-0.3630699, -0.5423635, -3.014465, 0, 1, 0.3647059, 1,
-0.3558646, -0.6899326, -1.71869, 0, 1, 0.3686275, 1,
-0.3554225, 0.2128289, 0.1125931, 0, 1, 0.3764706, 1,
-0.3537023, -0.8705463, -2.043813, 0, 1, 0.3803922, 1,
-0.3462632, -1.315605, -1.928761, 0, 1, 0.3882353, 1,
-0.3420025, 0.8776946, -2.610338, 0, 1, 0.3921569, 1,
-0.333924, -1.568756, -3.158344, 0, 1, 0.4, 1,
-0.3328813, -0.7349563, -0.6540944, 0, 1, 0.4078431, 1,
-0.3297878, 0.2495786, -2.593792, 0, 1, 0.4117647, 1,
-0.3265268, 0.498303, -0.252868, 0, 1, 0.4196078, 1,
-0.3261942, 0.3167674, -0.2924746, 0, 1, 0.4235294, 1,
-0.3212857, 0.1714396, -1.923752, 0, 1, 0.4313726, 1,
-0.3152207, 0.6609514, -0.9540277, 0, 1, 0.4352941, 1,
-0.3139217, 1.443732, 0.6620708, 0, 1, 0.4431373, 1,
-0.3073234, -1.556819, -0.7328701, 0, 1, 0.4470588, 1,
-0.3035015, 0.05291229, -2.789173, 0, 1, 0.454902, 1,
-0.2999358, 0.6038011, -2.399101, 0, 1, 0.4588235, 1,
-0.2963519, -1.93773, -2.571877, 0, 1, 0.4666667, 1,
-0.2961648, 0.8120438, -1.710357, 0, 1, 0.4705882, 1,
-0.2952407, 0.3178948, -0.8926298, 0, 1, 0.4784314, 1,
-0.294447, -0.5169086, -2.901396, 0, 1, 0.4823529, 1,
-0.2937237, 0.9230729, 1.043098, 0, 1, 0.4901961, 1,
-0.2887484, 0.9560884, -1.822764, 0, 1, 0.4941176, 1,
-0.2869585, -0.8641107, -2.405082, 0, 1, 0.5019608, 1,
-0.286749, 1.509917, -1.526461, 0, 1, 0.509804, 1,
-0.2859929, -1.2992, -2.767113, 0, 1, 0.5137255, 1,
-0.2804885, -0.8314798, -2.900705, 0, 1, 0.5215687, 1,
-0.2785327, -0.8512589, -2.737921, 0, 1, 0.5254902, 1,
-0.2774109, 0.3895885, -1.06979, 0, 1, 0.5333334, 1,
-0.2728137, -0.08557353, -1.607338, 0, 1, 0.5372549, 1,
-0.2701614, 0.7852364, 0.4840026, 0, 1, 0.5450981, 1,
-0.2660086, 0.6825066, -0.1692429, 0, 1, 0.5490196, 1,
-0.2617451, 1.768227, -0.4722717, 0, 1, 0.5568628, 1,
-0.2588977, 0.1375901, -2.278376, 0, 1, 0.5607843, 1,
-0.2561596, -0.9102938, -3.257177, 0, 1, 0.5686275, 1,
-0.2462204, 1.018489, -0.3777565, 0, 1, 0.572549, 1,
-0.2455874, -0.1858282, -1.101241, 0, 1, 0.5803922, 1,
-0.2419179, 2.781901, -0.2441497, 0, 1, 0.5843138, 1,
-0.2378739, 0.6323417, -1.436458, 0, 1, 0.5921569, 1,
-0.2373298, -0.1964377, -2.411935, 0, 1, 0.5960785, 1,
-0.2365014, 0.5437086, -0.8609354, 0, 1, 0.6039216, 1,
-0.2305652, 0.7448528, -1.955843, 0, 1, 0.6117647, 1,
-0.2295104, -0.4190956, -2.980896, 0, 1, 0.6156863, 1,
-0.2279873, -0.01882923, -1.289124, 0, 1, 0.6235294, 1,
-0.2221822, 0.2683458, 0.176138, 0, 1, 0.627451, 1,
-0.2210054, 0.226386, -1.093661, 0, 1, 0.6352941, 1,
-0.2199252, -0.2291902, -2.20803, 0, 1, 0.6392157, 1,
-0.2196253, -0.07053196, -2.057998, 0, 1, 0.6470588, 1,
-0.2169274, 0.7441935, -1.077264, 0, 1, 0.6509804, 1,
-0.2162467, 2.162366, 0.08803016, 0, 1, 0.6588235, 1,
-0.2159434, -0.5099704, -2.311826, 0, 1, 0.6627451, 1,
-0.2102819, -0.185321, -2.055415, 0, 1, 0.6705883, 1,
-0.2089299, -1.068617, -1.1534, 0, 1, 0.6745098, 1,
-0.2074115, -0.9464123, -2.515249, 0, 1, 0.682353, 1,
-0.2048424, -0.4952745, -3.75058, 0, 1, 0.6862745, 1,
-0.2031715, 0.3506741, 1.148826, 0, 1, 0.6941177, 1,
-0.2018696, 2.380169, 0.2402757, 0, 1, 0.7019608, 1,
-0.1990595, 0.5967756, -1.846562, 0, 1, 0.7058824, 1,
-0.19567, 1.613901, -0.4629034, 0, 1, 0.7137255, 1,
-0.1946429, -0.577174, -1.990389, 0, 1, 0.7176471, 1,
-0.1890546, -0.6891597, -1.328211, 0, 1, 0.7254902, 1,
-0.1822423, 0.6554666, 0.3819537, 0, 1, 0.7294118, 1,
-0.1751231, 0.6855941, 1.475506, 0, 1, 0.7372549, 1,
-0.1741262, -0.05630352, -1.84226, 0, 1, 0.7411765, 1,
-0.1686212, 0.2564869, 1.820383, 0, 1, 0.7490196, 1,
-0.1682074, 1.270783, 0.2224357, 0, 1, 0.7529412, 1,
-0.1628185, -0.2970929, -3.429688, 0, 1, 0.7607843, 1,
-0.1606719, 0.3598188, -0.3781484, 0, 1, 0.7647059, 1,
-0.1498412, -0.02762914, -3.003365, 0, 1, 0.772549, 1,
-0.1493036, -0.8813658, -2.256468, 0, 1, 0.7764706, 1,
-0.1492379, 0.8157251, -0.4268436, 0, 1, 0.7843137, 1,
-0.1490669, 2.685367, -1.358881, 0, 1, 0.7882353, 1,
-0.1464479, -1.770884, -3.149379, 0, 1, 0.7960784, 1,
-0.1462597, 0.2582649, -0.268392, 0, 1, 0.8039216, 1,
-0.1462064, -0.3381867, -2.646531, 0, 1, 0.8078431, 1,
-0.1426581, 1.185974, -2.192754, 0, 1, 0.8156863, 1,
-0.1355415, -2.663212, -2.605314, 0, 1, 0.8196079, 1,
-0.1321796, -0.6447126, -4.046247, 0, 1, 0.827451, 1,
-0.1307139, 0.4544355, -0.750557, 0, 1, 0.8313726, 1,
-0.1298978, 0.4140435, 0.3653169, 0, 1, 0.8392157, 1,
-0.1267369, 0.4729314, 0.9573603, 0, 1, 0.8431373, 1,
-0.1208021, -0.3656848, -1.980231, 0, 1, 0.8509804, 1,
-0.1153571, -0.3961322, -2.051112, 0, 1, 0.854902, 1,
-0.1149971, -0.09581909, -3.19468, 0, 1, 0.8627451, 1,
-0.1141438, 0.3057548, -0.322667, 0, 1, 0.8666667, 1,
-0.113561, 1.218162, 0.7923571, 0, 1, 0.8745098, 1,
-0.1065967, -0.4204038, -3.326321, 0, 1, 0.8784314, 1,
-0.1054842, 0.8389713, -1.609932, 0, 1, 0.8862745, 1,
-0.09530637, 1.26054, 1.784913, 0, 1, 0.8901961, 1,
-0.09432959, -1.507581, -2.086044, 0, 1, 0.8980392, 1,
-0.09290335, 0.2915572, -0.1640287, 0, 1, 0.9058824, 1,
-0.09124796, -0.9885128, -3.576378, 0, 1, 0.9098039, 1,
-0.08841966, -1.663655, -2.978731, 0, 1, 0.9176471, 1,
-0.0867689, 0.897911, 0.6633918, 0, 1, 0.9215686, 1,
-0.08613174, 1.551025, -0.6589667, 0, 1, 0.9294118, 1,
-0.08471162, -0.5646056, -2.555096, 0, 1, 0.9333333, 1,
-0.0829163, 1.12179, -0.1987145, 0, 1, 0.9411765, 1,
-0.08091658, 1.105975, 0.4999624, 0, 1, 0.945098, 1,
-0.07983221, -0.6877661, -4.811318, 0, 1, 0.9529412, 1,
-0.07924554, 0.9657947, -0.1366057, 0, 1, 0.9568627, 1,
-0.07657688, 0.7408417, 0.7058889, 0, 1, 0.9647059, 1,
-0.07492034, -0.09316071, -3.388456, 0, 1, 0.9686275, 1,
-0.06639156, 0.4964263, 0.8436125, 0, 1, 0.9764706, 1,
-0.06164131, 0.3342542, 0.3842463, 0, 1, 0.9803922, 1,
-0.06074641, 0.352677, -0.8910134, 0, 1, 0.9882353, 1,
-0.05852873, -1.582539, -3.135422, 0, 1, 0.9921569, 1,
-0.05834332, -0.2256032, -1.755613, 0, 1, 1, 1,
-0.0579327, 0.06444898, 0.01546664, 0, 0.9921569, 1, 1,
-0.05439484, 0.4968783, 2.117105, 0, 0.9882353, 1, 1,
-0.05353131, 0.4347447, 2.378025, 0, 0.9803922, 1, 1,
-0.05172946, -0.3457485, -2.953704, 0, 0.9764706, 1, 1,
-0.04663384, -0.5949785, -4.266137, 0, 0.9686275, 1, 1,
-0.04586868, -0.170685, -3.187861, 0, 0.9647059, 1, 1,
-0.04378204, 1.14169, 0.2683012, 0, 0.9568627, 1, 1,
-0.04066017, 0.5829507, -0.7907978, 0, 0.9529412, 1, 1,
-0.04053064, 1.559453, 1.673881, 0, 0.945098, 1, 1,
-0.03841547, -1.342182, -3.923216, 0, 0.9411765, 1, 1,
-0.03746625, 0.9202183, 1.192713, 0, 0.9333333, 1, 1,
-0.03550734, 0.2444572, 1.993842, 0, 0.9294118, 1, 1,
-0.03042892, 1.538296, 0.5456098, 0, 0.9215686, 1, 1,
-0.03018693, -0.1290097, -4.478099, 0, 0.9176471, 1, 1,
-0.0299134, 0.9841896, -0.507803, 0, 0.9098039, 1, 1,
-0.02596511, -0.6071607, -2.97549, 0, 0.9058824, 1, 1,
-0.02564422, 0.4822828, 0.4702218, 0, 0.8980392, 1, 1,
-0.02465469, -0.1706086, -2.456522, 0, 0.8901961, 1, 1,
-0.02461504, 1.863745, 0.4617031, 0, 0.8862745, 1, 1,
-0.02273994, -0.5899907, -3.436853, 0, 0.8784314, 1, 1,
-0.01219261, -0.159266, -1.948841, 0, 0.8745098, 1, 1,
-0.01214345, -0.5193525, -2.624462, 0, 0.8666667, 1, 1,
-0.01085129, -0.5226249, -0.5019598, 0, 0.8627451, 1, 1,
-0.01036129, -1.715928, -3.199785, 0, 0.854902, 1, 1,
-0.009034063, 0.6354755, -1.740792, 0, 0.8509804, 1, 1,
-0.007435353, 0.3332453, -1.410676, 0, 0.8431373, 1, 1,
-0.003408958, 1.005264, -0.1239211, 0, 0.8392157, 1, 1,
-0.000243984, 0.4676273, -1.789687, 0, 0.8313726, 1, 1,
0.004561627, 0.566649, -2.632732, 0, 0.827451, 1, 1,
0.007024284, 0.4526689, -2.047768, 0, 0.8196079, 1, 1,
0.008404109, 1.158483, 0.3720858, 0, 0.8156863, 1, 1,
0.01341629, -1.17007, 3.683066, 0, 0.8078431, 1, 1,
0.01812951, -0.8147427, 5.237895, 0, 0.8039216, 1, 1,
0.01990499, 0.0847716, 0.4475211, 0, 0.7960784, 1, 1,
0.0231088, 0.2323669, 0.3257318, 0, 0.7882353, 1, 1,
0.02511652, -0.6910967, 2.581939, 0, 0.7843137, 1, 1,
0.02513164, 1.779616, -0.2456374, 0, 0.7764706, 1, 1,
0.02522834, -0.9614896, 3.113895, 0, 0.772549, 1, 1,
0.02646879, -0.8310026, 3.864542, 0, 0.7647059, 1, 1,
0.03271712, 0.6662263, -0.3213646, 0, 0.7607843, 1, 1,
0.03634677, -0.4164727, 1.102439, 0, 0.7529412, 1, 1,
0.03748895, -2.836895, 3.318292, 0, 0.7490196, 1, 1,
0.04165196, 1.070495, 1.601572, 0, 0.7411765, 1, 1,
0.04437697, 0.9900151, -1.4397, 0, 0.7372549, 1, 1,
0.04492138, -1.996594, 2.818106, 0, 0.7294118, 1, 1,
0.04722989, -0.9787809, 1.535833, 0, 0.7254902, 1, 1,
0.04829029, -1.529939, 1.644703, 0, 0.7176471, 1, 1,
0.04847277, 1.766508, -0.8521076, 0, 0.7137255, 1, 1,
0.05033128, 1.211179, 0.8002387, 0, 0.7058824, 1, 1,
0.05046114, 0.4250792, 0.8140355, 0, 0.6980392, 1, 1,
0.05051938, -0.4346231, 3.163333, 0, 0.6941177, 1, 1,
0.05164392, -0.5338534, 2.829801, 0, 0.6862745, 1, 1,
0.05365366, 0.3058138, 0.3481892, 0, 0.682353, 1, 1,
0.05430702, 0.0386186, -0.07486837, 0, 0.6745098, 1, 1,
0.05438371, -1.030429, 4.416959, 0, 0.6705883, 1, 1,
0.05785901, -0.5153932, 3.830104, 0, 0.6627451, 1, 1,
0.05972309, -0.3291155, 3.754382, 0, 0.6588235, 1, 1,
0.06072883, -0.06309915, 1.643836, 0, 0.6509804, 1, 1,
0.06124077, 1.256713, 1.13478, 0, 0.6470588, 1, 1,
0.06466003, 0.2225697, 0.278966, 0, 0.6392157, 1, 1,
0.06648144, 2.166571, -0.1139724, 0, 0.6352941, 1, 1,
0.0730319, 2.463868, -0.9232775, 0, 0.627451, 1, 1,
0.0733787, -0.6172123, 2.903385, 0, 0.6235294, 1, 1,
0.0769136, 0.4778908, -0.4399701, 0, 0.6156863, 1, 1,
0.0783594, 1.540848, -0.5792277, 0, 0.6117647, 1, 1,
0.08141219, -0.325573, 3.241768, 0, 0.6039216, 1, 1,
0.08206075, -0.7437611, 2.822112, 0, 0.5960785, 1, 1,
0.08228934, -2.293104, 2.895702, 0, 0.5921569, 1, 1,
0.08359826, -1.348344, 2.207791, 0, 0.5843138, 1, 1,
0.0871979, 1.143486, 0.2447704, 0, 0.5803922, 1, 1,
0.09764846, 0.1843167, -1.623405, 0, 0.572549, 1, 1,
0.09779285, 1.245178, 0.220572, 0, 0.5686275, 1, 1,
0.1011464, -1.460735, 4.586633, 0, 0.5607843, 1, 1,
0.1041755, 1.864585, 1.041066, 0, 0.5568628, 1, 1,
0.1092278, 0.1390555, 0.01814601, 0, 0.5490196, 1, 1,
0.1093297, -0.5436103, 4.185485, 0, 0.5450981, 1, 1,
0.1093317, -0.1931091, 1.970311, 0, 0.5372549, 1, 1,
0.1139654, 0.09725635, 1.976248, 0, 0.5333334, 1, 1,
0.1174214, 0.04042521, -0.3148942, 0, 0.5254902, 1, 1,
0.1236652, -1.14975, 2.949113, 0, 0.5215687, 1, 1,
0.1281575, -0.9604091, 4.446661, 0, 0.5137255, 1, 1,
0.1305064, 1.09194, 0.3850938, 0, 0.509804, 1, 1,
0.1404482, 0.7102559, -0.7212424, 0, 0.5019608, 1, 1,
0.1438587, -1.027055, 2.621553, 0, 0.4941176, 1, 1,
0.1446852, -0.2596395, 3.261916, 0, 0.4901961, 1, 1,
0.1449001, -1.603771, 2.780467, 0, 0.4823529, 1, 1,
0.1471283, -1.327105, 4.747483, 0, 0.4784314, 1, 1,
0.14872, -0.100121, 3.273008, 0, 0.4705882, 1, 1,
0.1511389, 0.3315038, 0.7363234, 0, 0.4666667, 1, 1,
0.1546883, 0.4108188, 0.9492682, 0, 0.4588235, 1, 1,
0.157147, -1.259975, 2.323019, 0, 0.454902, 1, 1,
0.1629932, 0.9102237, -0.7410322, 0, 0.4470588, 1, 1,
0.1661966, -0.3120167, 2.914026, 0, 0.4431373, 1, 1,
0.1744719, -1.094966, 3.732046, 0, 0.4352941, 1, 1,
0.1745921, -1.157364, 2.518991, 0, 0.4313726, 1, 1,
0.1751783, 0.3367356, 0.3987836, 0, 0.4235294, 1, 1,
0.1778417, 0.2815969, -1.15419, 0, 0.4196078, 1, 1,
0.1793538, 0.4984983, 1.773126, 0, 0.4117647, 1, 1,
0.1815064, -0.4736957, 2.015472, 0, 0.4078431, 1, 1,
0.1840058, 0.5236192, 0.7886162, 0, 0.4, 1, 1,
0.1951863, -0.9952657, 3.305051, 0, 0.3921569, 1, 1,
0.1979456, -0.1535443, 2.532777, 0, 0.3882353, 1, 1,
0.1980061, 0.0781198, 0.4889212, 0, 0.3803922, 1, 1,
0.2029919, 0.326452, -1.26784, 0, 0.3764706, 1, 1,
0.2055637, -0.3981515, 3.550722, 0, 0.3686275, 1, 1,
0.2083408, -0.5592989, 1.852048, 0, 0.3647059, 1, 1,
0.2084541, -0.6970981, 2.149565, 0, 0.3568628, 1, 1,
0.2122378, 1.312821, -1.093379, 0, 0.3529412, 1, 1,
0.2179318, 0.2939294, -0.8599206, 0, 0.345098, 1, 1,
0.2234779, -0.3843538, 1.718435, 0, 0.3411765, 1, 1,
0.2276686, -2.323335, 2.816074, 0, 0.3333333, 1, 1,
0.2280745, 0.990741, 1.648061, 0, 0.3294118, 1, 1,
0.2286551, 0.3283621, 1.944409, 0, 0.3215686, 1, 1,
0.2291161, -0.1159059, 1.846532, 0, 0.3176471, 1, 1,
0.2328625, 1.403503, -1.424419, 0, 0.3098039, 1, 1,
0.2334417, -0.1784073, 3.167281, 0, 0.3058824, 1, 1,
0.2350603, -1.662413, 1.968391, 0, 0.2980392, 1, 1,
0.2354304, 0.6881074, 1.068999, 0, 0.2901961, 1, 1,
0.2362931, -0.3023368, 3.198679, 0, 0.2862745, 1, 1,
0.2372749, -0.7776908, 2.949411, 0, 0.2784314, 1, 1,
0.2383581, -0.07987512, 0.7581852, 0, 0.2745098, 1, 1,
0.2439124, -0.7372689, 2.796711, 0, 0.2666667, 1, 1,
0.2462357, 0.1107234, 1.890056, 0, 0.2627451, 1, 1,
0.2493817, -2.645022, 2.287867, 0, 0.254902, 1, 1,
0.2533163, -0.5228621, 3.29511, 0, 0.2509804, 1, 1,
0.2542222, -1.294633, 2.701355, 0, 0.2431373, 1, 1,
0.258509, 0.3118476, -1.336145, 0, 0.2392157, 1, 1,
0.2593961, -0.7033501, 1.857328, 0, 0.2313726, 1, 1,
0.2644405, 1.382737, -1.807076, 0, 0.227451, 1, 1,
0.265807, 0.8916964, 0.9793339, 0, 0.2196078, 1, 1,
0.2670557, 1.169742, 0.06288009, 0, 0.2156863, 1, 1,
0.2678159, 0.1710815, 1.52835, 0, 0.2078431, 1, 1,
0.2690122, -1.205329, 3.168581, 0, 0.2039216, 1, 1,
0.2701043, -0.1796399, 2.248928, 0, 0.1960784, 1, 1,
0.2703507, -0.8082246, 3.664844, 0, 0.1882353, 1, 1,
0.2714592, 0.1534257, 0.9367666, 0, 0.1843137, 1, 1,
0.2719532, -0.1775664, 0.894648, 0, 0.1764706, 1, 1,
0.2720958, -0.8913197, 3.041171, 0, 0.172549, 1, 1,
0.2722498, 0.4727187, 0.5425153, 0, 0.1647059, 1, 1,
0.2726302, -0.08831026, 3.656478, 0, 0.1607843, 1, 1,
0.2729802, 1.623358, -1.234817, 0, 0.1529412, 1, 1,
0.2784812, -2.133328, 3.826226, 0, 0.1490196, 1, 1,
0.2812994, 1.027525, 0.8429816, 0, 0.1411765, 1, 1,
0.2871986, 0.1477246, 0.03351796, 0, 0.1372549, 1, 1,
0.2903855, 0.2117755, 0.6655434, 0, 0.1294118, 1, 1,
0.2904289, 0.5329368, -1.412244, 0, 0.1254902, 1, 1,
0.2911534, 1.680036, 0.001767181, 0, 0.1176471, 1, 1,
0.2964061, -0.4549355, 1.817766, 0, 0.1137255, 1, 1,
0.2969977, -1.37528, 2.945365, 0, 0.1058824, 1, 1,
0.2996667, -0.4926298, 1.071295, 0, 0.09803922, 1, 1,
0.3026695, 1.657245, 0.1755942, 0, 0.09411765, 1, 1,
0.3036046, -1.484838, 3.252433, 0, 0.08627451, 1, 1,
0.3044578, 0.3545998, -0.8123466, 0, 0.08235294, 1, 1,
0.3108294, -0.1450276, 1.266491, 0, 0.07450981, 1, 1,
0.3140699, 0.3336192, 0.6510238, 0, 0.07058824, 1, 1,
0.3164969, 0.4388374, 1.115448, 0, 0.0627451, 1, 1,
0.3166602, -2.005416, 3.54193, 0, 0.05882353, 1, 1,
0.3192428, 1.352801, 0.1738705, 0, 0.05098039, 1, 1,
0.3207849, -0.3081742, 1.927129, 0, 0.04705882, 1, 1,
0.3236965, 0.4494959, 1.987056, 0, 0.03921569, 1, 1,
0.3282411, -2.473017, 3.509483, 0, 0.03529412, 1, 1,
0.3290052, -0.1221521, 0.5722804, 0, 0.02745098, 1, 1,
0.3335989, 0.4296598, 1.125818, 0, 0.02352941, 1, 1,
0.3338988, 0.01953883, 0.6444467, 0, 0.01568628, 1, 1,
0.3341601, -1.159012, 1.999965, 0, 0.01176471, 1, 1,
0.3382275, 1.535342, 1.036392, 0, 0.003921569, 1, 1,
0.340843, -1.354655, 2.201643, 0.003921569, 0, 1, 1,
0.3413158, 0.2022697, 2.162961, 0.007843138, 0, 1, 1,
0.3439367, -1.211273, 1.848271, 0.01568628, 0, 1, 1,
0.3451931, 0.07972158, 0.8190718, 0.01960784, 0, 1, 1,
0.351114, 0.919304, 0.2801908, 0.02745098, 0, 1, 1,
0.3534499, 1.330947, 0.05219352, 0.03137255, 0, 1, 1,
0.3539412, 0.2190179, 1.19108, 0.03921569, 0, 1, 1,
0.3647545, -2.092717, -0.7984052, 0.04313726, 0, 1, 1,
0.3687258, 0.3261354, 1.847831, 0.05098039, 0, 1, 1,
0.3714217, -2.090322, 5.520867, 0.05490196, 0, 1, 1,
0.3742811, -0.9408339, 2.253122, 0.0627451, 0, 1, 1,
0.3749107, -0.4378768, 2.08311, 0.06666667, 0, 1, 1,
0.3801494, 0.9138445, 1.187832, 0.07450981, 0, 1, 1,
0.3823812, -0.03053604, 3.188544, 0.07843138, 0, 1, 1,
0.3835827, -0.7858334, 1.735904, 0.08627451, 0, 1, 1,
0.3839429, 0.4945571, 1.487528, 0.09019608, 0, 1, 1,
0.3843209, -0.5116135, 1.375159, 0.09803922, 0, 1, 1,
0.3868066, -0.5510591, 2.165334, 0.1058824, 0, 1, 1,
0.3889262, -0.04989342, 0.9350531, 0.1098039, 0, 1, 1,
0.3894338, -0.9806264, 4.209531, 0.1176471, 0, 1, 1,
0.391791, 0.6676988, 1.265126, 0.1215686, 0, 1, 1,
0.3934785, -0.2424838, 0.1850999, 0.1294118, 0, 1, 1,
0.3940858, -0.5533963, 2.392688, 0.1333333, 0, 1, 1,
0.4002246, -2.099839, 3.073384, 0.1411765, 0, 1, 1,
0.4022254, 0.27362, 2.282049, 0.145098, 0, 1, 1,
0.4030946, -1.019942, 4.020176, 0.1529412, 0, 1, 1,
0.4087616, -0.4040495, 1.625187, 0.1568628, 0, 1, 1,
0.4107824, 0.2733264, 1.641607, 0.1647059, 0, 1, 1,
0.4115237, -1.143706, 3.180253, 0.1686275, 0, 1, 1,
0.4125763, 1.4714, 2.050089, 0.1764706, 0, 1, 1,
0.4130371, 0.1723248, 0.4167878, 0.1803922, 0, 1, 1,
0.4138252, -2.234751, 2.885957, 0.1882353, 0, 1, 1,
0.4175927, 1.239929, 0.4583395, 0.1921569, 0, 1, 1,
0.4216354, -0.4915535, 2.126051, 0.2, 0, 1, 1,
0.4277706, -2.218554, 3.982136, 0.2078431, 0, 1, 1,
0.4350555, -0.9978452, 3.610574, 0.2117647, 0, 1, 1,
0.4352882, 0.8745318, -0.4010775, 0.2196078, 0, 1, 1,
0.4392955, -2.237769, 3.062297, 0.2235294, 0, 1, 1,
0.4396883, 0.1882754, 3.493203, 0.2313726, 0, 1, 1,
0.4420052, -0.2588079, 2.708455, 0.2352941, 0, 1, 1,
0.4465, -0.0406118, 0.7789751, 0.2431373, 0, 1, 1,
0.448186, -0.106134, 0.9187855, 0.2470588, 0, 1, 1,
0.4576716, 0.5745654, 0.8012015, 0.254902, 0, 1, 1,
0.4584489, -1.395022, 2.274306, 0.2588235, 0, 1, 1,
0.4586459, -0.7079186, 2.602078, 0.2666667, 0, 1, 1,
0.4621342, -2.772039, 2.43303, 0.2705882, 0, 1, 1,
0.4631163, 0.09272721, 1.568902, 0.2784314, 0, 1, 1,
0.4660181, 0.04885671, 1.462704, 0.282353, 0, 1, 1,
0.4787796, 0.3467961, -1.418259, 0.2901961, 0, 1, 1,
0.4791843, -0.8305387, 4.180281, 0.2941177, 0, 1, 1,
0.4843671, 3.205225, 0.01787121, 0.3019608, 0, 1, 1,
0.484977, -2.336042, 3.454042, 0.3098039, 0, 1, 1,
0.4865764, -0.5578436, 2.198467, 0.3137255, 0, 1, 1,
0.4873012, -1.885541, 1.989123, 0.3215686, 0, 1, 1,
0.4897486, 0.1849545, 1.70208, 0.3254902, 0, 1, 1,
0.4919522, 0.3370787, 1.482359, 0.3333333, 0, 1, 1,
0.4920032, -0.3051263, 3.988976, 0.3372549, 0, 1, 1,
0.496778, 0.03096116, -0.1416844, 0.345098, 0, 1, 1,
0.5002288, 0.4751911, 3.288035, 0.3490196, 0, 1, 1,
0.5027533, -1.069498, 2.63513, 0.3568628, 0, 1, 1,
0.5068325, 1.037778, 1.51544, 0.3607843, 0, 1, 1,
0.5148649, -1.881332, 3.840878, 0.3686275, 0, 1, 1,
0.5185843, 0.4297217, 0.8492305, 0.372549, 0, 1, 1,
0.5217184, 0.04563649, 1.383591, 0.3803922, 0, 1, 1,
0.522888, 0.842405, -0.3224116, 0.3843137, 0, 1, 1,
0.5230107, 0.8169828, -1.000105, 0.3921569, 0, 1, 1,
0.52515, 0.2266271, 1.004426, 0.3960784, 0, 1, 1,
0.5264775, 1.451805, 0.7293699, 0.4039216, 0, 1, 1,
0.5286219, 1.628973, 0.5927089, 0.4117647, 0, 1, 1,
0.5295293, 0.6553472, 1.87255, 0.4156863, 0, 1, 1,
0.5375123, -0.07591124, 2.910096, 0.4235294, 0, 1, 1,
0.5392956, -0.6858785, 0.9484782, 0.427451, 0, 1, 1,
0.5498983, 0.4316303, 1.370745, 0.4352941, 0, 1, 1,
0.5558507, 1.30169, -0.7224488, 0.4392157, 0, 1, 1,
0.5633609, 2.355735, 0.7797238, 0.4470588, 0, 1, 1,
0.5680691, 0.9267771, 0.6142611, 0.4509804, 0, 1, 1,
0.5705711, 0.3214194, 1.90827, 0.4588235, 0, 1, 1,
0.5712973, -1.271665, 2.394964, 0.4627451, 0, 1, 1,
0.5732232, 1.397755, 0.4372872, 0.4705882, 0, 1, 1,
0.5795007, -0.03980896, 2.265126, 0.4745098, 0, 1, 1,
0.58162, 0.3325068, 0.06413953, 0.4823529, 0, 1, 1,
0.5892538, -0.99806, 1.996649, 0.4862745, 0, 1, 1,
0.5895473, -0.429917, 3.865411, 0.4941176, 0, 1, 1,
0.5987011, -1.182055, 4.327862, 0.5019608, 0, 1, 1,
0.6063334, -0.6621091, 2.059817, 0.5058824, 0, 1, 1,
0.608736, -1.262564, 3.426864, 0.5137255, 0, 1, 1,
0.6088974, -0.6412556, 0.9344103, 0.5176471, 0, 1, 1,
0.6113302, 1.091584, -0.4192063, 0.5254902, 0, 1, 1,
0.613573, -1.332047, 4.618716, 0.5294118, 0, 1, 1,
0.6166784, -0.5711535, 2.488446, 0.5372549, 0, 1, 1,
0.617248, 0.7375874, 0.1129801, 0.5411765, 0, 1, 1,
0.6241708, -0.3577498, 1.926657, 0.5490196, 0, 1, 1,
0.6252711, -0.5884271, 1.781418, 0.5529412, 0, 1, 1,
0.6270873, -0.8976506, 1.71202, 0.5607843, 0, 1, 1,
0.6408, 2.379218, 1.324149, 0.5647059, 0, 1, 1,
0.6457747, -0.02379057, 0.6842775, 0.572549, 0, 1, 1,
0.6497136, -2.292207, 4.448807, 0.5764706, 0, 1, 1,
0.6500703, -2.071076, 1.982688, 0.5843138, 0, 1, 1,
0.6523003, -0.05863515, 2.715117, 0.5882353, 0, 1, 1,
0.657151, 1.231797, 2.597369, 0.5960785, 0, 1, 1,
0.6641995, 0.4962867, 0.6013527, 0.6039216, 0, 1, 1,
0.6652191, -0.9457067, 4.237569, 0.6078432, 0, 1, 1,
0.6664639, -0.1193877, 2.044696, 0.6156863, 0, 1, 1,
0.6666114, -0.1342338, 2.227858, 0.6196079, 0, 1, 1,
0.6826342, -0.6747975, 3.077729, 0.627451, 0, 1, 1,
0.6841628, 1.321525, 1.103495, 0.6313726, 0, 1, 1,
0.6850789, -1.023761, 2.279557, 0.6392157, 0, 1, 1,
0.6857378, 0.2460294, -0.4876384, 0.6431373, 0, 1, 1,
0.6877549, -1.622283, 3.044206, 0.6509804, 0, 1, 1,
0.6889248, 0.3038779, 2.435591, 0.654902, 0, 1, 1,
0.6903789, 0.2794333, -1.1697, 0.6627451, 0, 1, 1,
0.6951754, 0.5066161, 0.3504936, 0.6666667, 0, 1, 1,
0.7028996, 0.6286334, 2.798065, 0.6745098, 0, 1, 1,
0.7081327, -1.13165, 2.343538, 0.6784314, 0, 1, 1,
0.7087272, 0.1918301, 0.6374186, 0.6862745, 0, 1, 1,
0.7095013, 0.4044059, 0.1611982, 0.6901961, 0, 1, 1,
0.7119262, 0.1647377, 0.03148046, 0.6980392, 0, 1, 1,
0.719117, -1.280789, 3.187159, 0.7058824, 0, 1, 1,
0.7229945, -0.1755441, 2.155837, 0.7098039, 0, 1, 1,
0.7231237, 0.5952185, -0.1769444, 0.7176471, 0, 1, 1,
0.7252227, 0.146531, 1.720834, 0.7215686, 0, 1, 1,
0.7288016, 0.05949873, 2.966779, 0.7294118, 0, 1, 1,
0.7295544, 0.5582524, -0.2385186, 0.7333333, 0, 1, 1,
0.7299071, -0.3954559, 1.714629, 0.7411765, 0, 1, 1,
0.730324, 0.1145741, 2.545386, 0.7450981, 0, 1, 1,
0.7315426, -0.9379304, 1.849572, 0.7529412, 0, 1, 1,
0.7351944, -1.139468, 0.3147511, 0.7568628, 0, 1, 1,
0.7355589, 1.729488, 0.6952508, 0.7647059, 0, 1, 1,
0.7377272, -0.08051149, 0.2629631, 0.7686275, 0, 1, 1,
0.7406766, 1.09818, -0.03917469, 0.7764706, 0, 1, 1,
0.7429025, -1.400812, 2.318871, 0.7803922, 0, 1, 1,
0.7483968, -0.09064627, 0.07846732, 0.7882353, 0, 1, 1,
0.7487479, 0.5448654, 3.372065, 0.7921569, 0, 1, 1,
0.7511404, -1.068189, 2.843481, 0.8, 0, 1, 1,
0.7536914, -1.544994, 3.031431, 0.8078431, 0, 1, 1,
0.7646675, 0.523436, 0.6329941, 0.8117647, 0, 1, 1,
0.7656228, -2.112089, 1.532983, 0.8196079, 0, 1, 1,
0.7709807, 0.2952823, 0.8228711, 0.8235294, 0, 1, 1,
0.773514, 0.1399222, 0.9639505, 0.8313726, 0, 1, 1,
0.7769148, 0.4959751, 1.258274, 0.8352941, 0, 1, 1,
0.7918625, -0.5347179, 4.461445, 0.8431373, 0, 1, 1,
0.8041793, 0.01342525, 2.358459, 0.8470588, 0, 1, 1,
0.8056269, 0.09876033, 2.947128, 0.854902, 0, 1, 1,
0.8089344, -1.86417, 2.031335, 0.8588235, 0, 1, 1,
0.8224653, -2.148758, 2.060229, 0.8666667, 0, 1, 1,
0.8401312, 0.06650988, 0.1463666, 0.8705882, 0, 1, 1,
0.8451305, 0.2739558, 1.829582, 0.8784314, 0, 1, 1,
0.8535848, -0.8238004, 5.598684, 0.8823529, 0, 1, 1,
0.8563325, -0.5041087, 0.8346791, 0.8901961, 0, 1, 1,
0.8597966, 0.07696515, 1.934703, 0.8941177, 0, 1, 1,
0.8632794, -0.5812895, 1.881187, 0.9019608, 0, 1, 1,
0.8650594, -0.2706036, 2.098212, 0.9098039, 0, 1, 1,
0.8703728, -1.632098, 1.278618, 0.9137255, 0, 1, 1,
0.8759627, 0.1450403, -1.24599, 0.9215686, 0, 1, 1,
0.8774656, -0.4214852, 1.654851, 0.9254902, 0, 1, 1,
0.8791375, 0.3701035, -0.3204618, 0.9333333, 0, 1, 1,
0.8868797, 0.7373073, 1.121178, 0.9372549, 0, 1, 1,
0.8886668, 0.5534955, 2.848513, 0.945098, 0, 1, 1,
0.9016929, 1.354456, 2.058268, 0.9490196, 0, 1, 1,
0.9022425, 0.5061199, 1.243371, 0.9568627, 0, 1, 1,
0.9030377, 0.1571922, 1.040638, 0.9607843, 0, 1, 1,
0.9067868, -0.869491, 2.023821, 0.9686275, 0, 1, 1,
0.9081533, 0.4894342, 1.156289, 0.972549, 0, 1, 1,
0.9088724, -1.094846, 2.433614, 0.9803922, 0, 1, 1,
0.9163069, 1.349222, 1.442522, 0.9843137, 0, 1, 1,
0.9242562, 0.3922874, 1.055664, 0.9921569, 0, 1, 1,
0.9250237, -0.2001495, 1.130619, 0.9960784, 0, 1, 1,
0.9263136, -0.3360099, 1.298341, 1, 0, 0.9960784, 1,
0.9279136, -2.031974, 3.770428, 1, 0, 0.9882353, 1,
0.9291331, -1.639546, 2.088225, 1, 0, 0.9843137, 1,
0.9389367, 0.2966795, 0.4822488, 1, 0, 0.9764706, 1,
0.9439522, -0.1521098, 1.089657, 1, 0, 0.972549, 1,
0.9475307, 0.9220545, 0.4270615, 1, 0, 0.9647059, 1,
0.9557271, -1.873056, 3.041912, 1, 0, 0.9607843, 1,
0.9567754, -1.042788, 1.480654, 1, 0, 0.9529412, 1,
0.9573505, -1.337206, 2.050256, 1, 0, 0.9490196, 1,
0.9606519, -0.6770877, 3.228179, 1, 0, 0.9411765, 1,
0.9613964, -1.677429, 1.78915, 1, 0, 0.9372549, 1,
0.9614334, -1.752482, 1.914768, 1, 0, 0.9294118, 1,
0.9618151, -0.03218409, 1.495314, 1, 0, 0.9254902, 1,
0.9649562, -0.5160056, 4.017759, 1, 0, 0.9176471, 1,
0.9681599, 0.564502, 3.787562, 1, 0, 0.9137255, 1,
0.9695347, 0.5212225, 1.176999, 1, 0, 0.9058824, 1,
0.9703773, -1.224194, 1.889802, 1, 0, 0.9019608, 1,
0.9769106, 1.960015, 0.3771473, 1, 0, 0.8941177, 1,
0.9786488, -0.6166554, 1.531011, 1, 0, 0.8862745, 1,
0.9870633, 2.423148, 0.7372215, 1, 0, 0.8823529, 1,
0.9924078, -1.973654, 2.416443, 1, 0, 0.8745098, 1,
0.9966481, -1.299093, 1.196892, 1, 0, 0.8705882, 1,
0.99885, 0.5178633, 0.8932947, 1, 0, 0.8627451, 1,
1.001588, -0.4278697, 2.111657, 1, 0, 0.8588235, 1,
1.002938, 0.9445922, -0.9396462, 1, 0, 0.8509804, 1,
1.006443, 0.2709751, 1.954346, 1, 0, 0.8470588, 1,
1.008422, 0.3994003, 0.6809137, 1, 0, 0.8392157, 1,
1.011092, -1.00202, 2.330814, 1, 0, 0.8352941, 1,
1.011404, 1.203349, 1.666752, 1, 0, 0.827451, 1,
1.021886, -0.3798115, 0.8647146, 1, 0, 0.8235294, 1,
1.025693, 0.3294029, 2.042016, 1, 0, 0.8156863, 1,
1.033447, -1.156021, 1.31305, 1, 0, 0.8117647, 1,
1.035731, 1.551188, 1.309221, 1, 0, 0.8039216, 1,
1.042092, 1.247656, -0.8030136, 1, 0, 0.7960784, 1,
1.043627, -1.082355, 5.066177, 1, 0, 0.7921569, 1,
1.045658, 0.772252, 1.842374, 1, 0, 0.7843137, 1,
1.049107, 0.5576243, 2.065934, 1, 0, 0.7803922, 1,
1.050763, 1.395338, 2.760326, 1, 0, 0.772549, 1,
1.053595, -0.6458226, 2.023228, 1, 0, 0.7686275, 1,
1.056373, 2.600576, 0.323083, 1, 0, 0.7607843, 1,
1.056509, 1.749838, -0.4743664, 1, 0, 0.7568628, 1,
1.057387, -1.303902, 2.166145, 1, 0, 0.7490196, 1,
1.063974, -0.3654827, 2.308176, 1, 0, 0.7450981, 1,
1.065543, 0.759901, -0.03986516, 1, 0, 0.7372549, 1,
1.067899, 0.1869404, 0.8753268, 1, 0, 0.7333333, 1,
1.074476, 0.0474996, 0.8364838, 1, 0, 0.7254902, 1,
1.075499, -0.5329631, 1.709311, 1, 0, 0.7215686, 1,
1.100032, -0.09234096, 0.8894875, 1, 0, 0.7137255, 1,
1.100226, 0.8920999, 0.6571827, 1, 0, 0.7098039, 1,
1.113484, -1.005879, 2.441878, 1, 0, 0.7019608, 1,
1.117206, 0.8903531, 0.4260826, 1, 0, 0.6941177, 1,
1.119965, -0.216112, 2.152875, 1, 0, 0.6901961, 1,
1.124123, 0.1213168, 1.619231, 1, 0, 0.682353, 1,
1.124292, -0.2596805, 1.375408, 1, 0, 0.6784314, 1,
1.129899, -0.8452933, 1.419366, 1, 0, 0.6705883, 1,
1.129907, -0.4228058, 0.77448, 1, 0, 0.6666667, 1,
1.130251, -0.09534954, 3.124446, 1, 0, 0.6588235, 1,
1.150914, -0.6436293, 2.357359, 1, 0, 0.654902, 1,
1.15436, -1.526014, 3.184394, 1, 0, 0.6470588, 1,
1.160933, -1.099893, 0.9865347, 1, 0, 0.6431373, 1,
1.16521, -1.697, 3.46666, 1, 0, 0.6352941, 1,
1.171409, 0.2863837, 1.118049, 1, 0, 0.6313726, 1,
1.177884, -0.583116, 1.300573, 1, 0, 0.6235294, 1,
1.202931, -0.1342427, 1.161648, 1, 0, 0.6196079, 1,
1.20558, 0.713233, 1.406709, 1, 0, 0.6117647, 1,
1.226209, 1.720297, -0.09709761, 1, 0, 0.6078432, 1,
1.229655, 0.1485271, 1.88769, 1, 0, 0.6, 1,
1.229868, -1.166731, 2.364946, 1, 0, 0.5921569, 1,
1.231342, -1.669719, 2.83375, 1, 0, 0.5882353, 1,
1.234622, 0.1028812, 1.730684, 1, 0, 0.5803922, 1,
1.234955, 1.204095, 0.1718443, 1, 0, 0.5764706, 1,
1.24084, 0.6459135, -0.6255646, 1, 0, 0.5686275, 1,
1.249546, -1.616648, 2.864497, 1, 0, 0.5647059, 1,
1.259885, -0.1698747, 2.129006, 1, 0, 0.5568628, 1,
1.260165, 0.09208053, 2.270107, 1, 0, 0.5529412, 1,
1.265509, -0.01348282, 3.389152, 1, 0, 0.5450981, 1,
1.278095, 0.6195133, 2.250846, 1, 0, 0.5411765, 1,
1.292284, -0.9641404, 3.416594, 1, 0, 0.5333334, 1,
1.295808, 1.172511, -0.5318792, 1, 0, 0.5294118, 1,
1.29636, 0.5258503, 1.449558, 1, 0, 0.5215687, 1,
1.296969, 1.274142, 1.991056, 1, 0, 0.5176471, 1,
1.317983, 0.4712061, 1.157584, 1, 0, 0.509804, 1,
1.33159, -1.115685, 3.411046, 1, 0, 0.5058824, 1,
1.331757, 0.911041, 0.6887287, 1, 0, 0.4980392, 1,
1.347421, -0.2635497, 2.642574, 1, 0, 0.4901961, 1,
1.348507, 1.113503, 1.257255, 1, 0, 0.4862745, 1,
1.350634, 0.355608, 1.454063, 1, 0, 0.4784314, 1,
1.367058, -0.7352272, 2.792602, 1, 0, 0.4745098, 1,
1.367458, -0.3900178, 2.880912, 1, 0, 0.4666667, 1,
1.368216, 0.6707006, 0.9860857, 1, 0, 0.4627451, 1,
1.369162, -1.748509, 2.175183, 1, 0, 0.454902, 1,
1.371488, 0.5110809, 1.04226, 1, 0, 0.4509804, 1,
1.386844, 1.492752, 0.1325169, 1, 0, 0.4431373, 1,
1.396259, -1.374965, 0.9112573, 1, 0, 0.4392157, 1,
1.40824, 0.5717326, 1.953051, 1, 0, 0.4313726, 1,
1.413606, -1.095632, 3.208526, 1, 0, 0.427451, 1,
1.416891, 0.831944, -0.2783999, 1, 0, 0.4196078, 1,
1.420007, 0.09284303, 2.025414, 1, 0, 0.4156863, 1,
1.424518, -1.326622, 3.304609, 1, 0, 0.4078431, 1,
1.430305, 0.4829199, 0.1213724, 1, 0, 0.4039216, 1,
1.455001, 2.771801, 1.163466, 1, 0, 0.3960784, 1,
1.455459, 0.02317526, 0.3808064, 1, 0, 0.3882353, 1,
1.469602, -0.2965946, 1.694901, 1, 0, 0.3843137, 1,
1.473149, -0.03863591, 2.202204, 1, 0, 0.3764706, 1,
1.482488, 0.9570808, 1.479052, 1, 0, 0.372549, 1,
1.482544, 0.9318593, -0.05293841, 1, 0, 0.3647059, 1,
1.483997, -0.001248146, 1.498446, 1, 0, 0.3607843, 1,
1.492031, 0.2721735, -0.06541755, 1, 0, 0.3529412, 1,
1.49207, -0.042738, 3.001068, 1, 0, 0.3490196, 1,
1.496192, -1.261914, 2.864662, 1, 0, 0.3411765, 1,
1.502512, -1.214581, 1.073754, 1, 0, 0.3372549, 1,
1.521629, 0.9230021, 1.643481, 1, 0, 0.3294118, 1,
1.540592, -0.2369795, 1.193709, 1, 0, 0.3254902, 1,
1.548283, -0.003445819, 1.683408, 1, 0, 0.3176471, 1,
1.557894, 2.059807, -0.3027278, 1, 0, 0.3137255, 1,
1.559096, 1.138222, -0.3442002, 1, 0, 0.3058824, 1,
1.559358, -1.236434, 1.865346, 1, 0, 0.2980392, 1,
1.560059, -0.6910725, 3.766338, 1, 0, 0.2941177, 1,
1.578132, 0.3403916, 2.01166, 1, 0, 0.2862745, 1,
1.585971, -1.614881, 2.289154, 1, 0, 0.282353, 1,
1.592408, -0.7059823, 4.618365, 1, 0, 0.2745098, 1,
1.595765, 0.8008935, 0.8846793, 1, 0, 0.2705882, 1,
1.601137, -1.603789, 1.15976, 1, 0, 0.2627451, 1,
1.602248, 0.1647311, 0.5750915, 1, 0, 0.2588235, 1,
1.626268, 0.08632914, 0.6475003, 1, 0, 0.2509804, 1,
1.64401, -0.9482707, 2.234211, 1, 0, 0.2470588, 1,
1.681073, 0.5770141, 1.974728, 1, 0, 0.2392157, 1,
1.684326, -0.5527434, 3.087935, 1, 0, 0.2352941, 1,
1.694991, -0.08258025, 2.764275, 1, 0, 0.227451, 1,
1.699789, 1.178916, 0.1140405, 1, 0, 0.2235294, 1,
1.705919, -0.7123415, 1.630734, 1, 0, 0.2156863, 1,
1.714201, -0.437712, 2.960352, 1, 0, 0.2117647, 1,
1.722454, 0.5524752, 1.421522, 1, 0, 0.2039216, 1,
1.745688, 1.066458, 0.08460043, 1, 0, 0.1960784, 1,
1.74571, -0.05479048, 3.434947, 1, 0, 0.1921569, 1,
1.757907, 0.2207992, 2.046241, 1, 0, 0.1843137, 1,
1.777479, 1.512932, 1.434418, 1, 0, 0.1803922, 1,
1.794795, -1.078267, 2.603421, 1, 0, 0.172549, 1,
1.812781, -1.289968, 2.414229, 1, 0, 0.1686275, 1,
1.815568, 0.8894934, 1.181497, 1, 0, 0.1607843, 1,
1.820008, -1.574223, 2.54668, 1, 0, 0.1568628, 1,
1.824231, -0.4381607, 1.781067, 1, 0, 0.1490196, 1,
1.843819, -0.5432709, 2.845989, 1, 0, 0.145098, 1,
1.85176, 0.8593653, 2.042468, 1, 0, 0.1372549, 1,
1.867689, 0.2096845, 2.458891, 1, 0, 0.1333333, 1,
1.869292, 0.3892014, 2.095124, 1, 0, 0.1254902, 1,
1.869791, -0.497683, 0.6334068, 1, 0, 0.1215686, 1,
1.872583, -1.995749, 2.882645, 1, 0, 0.1137255, 1,
1.894144, 0.3418227, 2.174646, 1, 0, 0.1098039, 1,
1.9267, 0.1807747, 1.066123, 1, 0, 0.1019608, 1,
1.935888, -1.362329, 3.171354, 1, 0, 0.09411765, 1,
1.980567, 0.8769565, 0.9685175, 1, 0, 0.09019608, 1,
1.986387, 0.6547244, 1.71598, 1, 0, 0.08235294, 1,
2.052428, 0.6582832, 1.493769, 1, 0, 0.07843138, 1,
2.069809, -0.4360606, 1.503702, 1, 0, 0.07058824, 1,
2.146146, -0.6311241, 2.505682, 1, 0, 0.06666667, 1,
2.205516, 0.6934448, 1.697597, 1, 0, 0.05882353, 1,
2.243752, -0.8798025, 1.156258, 1, 0, 0.05490196, 1,
2.254017, 1.458008, 2.96135, 1, 0, 0.04705882, 1,
2.326458, -1.403078, 2.344199, 1, 0, 0.04313726, 1,
2.37221, -0.2265791, 1.582274, 1, 0, 0.03529412, 1,
2.410852, 0.03723549, 1.348006, 1, 0, 0.03137255, 1,
2.522042, -0.8669842, 2.085234, 1, 0, 0.02352941, 1,
2.741405, -0.02745858, 2.294401, 1, 0, 0.01960784, 1,
2.851928, -0.6854458, 2.956717, 1, 0, 0.01176471, 1,
3.303178, -1.179574, 0.4115328, 1, 0, 0.007843138, 1
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
0.004863739, -5.195701, -6.989861, 0, -0.5, 0.5, 0.5,
0.004863739, -5.195701, -6.989861, 1, -0.5, 0.5, 0.5,
0.004863739, -5.195701, -6.989861, 1, 1.5, 0.5, 0.5,
0.004863739, -5.195701, -6.989861, 0, 1.5, 0.5, 0.5
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
-4.41158, -0.3864492, -6.989861, 0, -0.5, 0.5, 0.5,
-4.41158, -0.3864492, -6.989861, 1, -0.5, 0.5, 0.5,
-4.41158, -0.3864492, -6.989861, 1, 1.5, 0.5, 0.5,
-4.41158, -0.3864492, -6.989861, 0, 1.5, 0.5, 0.5
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
-4.41158, -5.195701, 0.2166636, 0, -0.5, 0.5, 0.5,
-4.41158, -5.195701, 0.2166636, 1, -0.5, 0.5, 0.5,
-4.41158, -5.195701, 0.2166636, 1, 1.5, 0.5, 0.5,
-4.41158, -5.195701, 0.2166636, 0, 1.5, 0.5, 0.5
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
-3, -4.085874, -5.326817,
3, -4.085874, -5.326817,
-3, -4.085874, -5.326817,
-3, -4.270844, -5.603992,
-2, -4.085874, -5.326817,
-2, -4.270844, -5.603992,
-1, -4.085874, -5.326817,
-1, -4.270844, -5.603992,
0, -4.085874, -5.326817,
0, -4.270844, -5.603992,
1, -4.085874, -5.326817,
1, -4.270844, -5.603992,
2, -4.085874, -5.326817,
2, -4.270844, -5.603992,
3, -4.085874, -5.326817,
3, -4.270844, -5.603992
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
-3, -4.640787, -6.15834, 0, -0.5, 0.5, 0.5,
-3, -4.640787, -6.15834, 1, -0.5, 0.5, 0.5,
-3, -4.640787, -6.15834, 1, 1.5, 0.5, 0.5,
-3, -4.640787, -6.15834, 0, 1.5, 0.5, 0.5,
-2, -4.640787, -6.15834, 0, -0.5, 0.5, 0.5,
-2, -4.640787, -6.15834, 1, -0.5, 0.5, 0.5,
-2, -4.640787, -6.15834, 1, 1.5, 0.5, 0.5,
-2, -4.640787, -6.15834, 0, 1.5, 0.5, 0.5,
-1, -4.640787, -6.15834, 0, -0.5, 0.5, 0.5,
-1, -4.640787, -6.15834, 1, -0.5, 0.5, 0.5,
-1, -4.640787, -6.15834, 1, 1.5, 0.5, 0.5,
-1, -4.640787, -6.15834, 0, 1.5, 0.5, 0.5,
0, -4.640787, -6.15834, 0, -0.5, 0.5, 0.5,
0, -4.640787, -6.15834, 1, -0.5, 0.5, 0.5,
0, -4.640787, -6.15834, 1, 1.5, 0.5, 0.5,
0, -4.640787, -6.15834, 0, 1.5, 0.5, 0.5,
1, -4.640787, -6.15834, 0, -0.5, 0.5, 0.5,
1, -4.640787, -6.15834, 1, -0.5, 0.5, 0.5,
1, -4.640787, -6.15834, 1, 1.5, 0.5, 0.5,
1, -4.640787, -6.15834, 0, 1.5, 0.5, 0.5,
2, -4.640787, -6.15834, 0, -0.5, 0.5, 0.5,
2, -4.640787, -6.15834, 1, -0.5, 0.5, 0.5,
2, -4.640787, -6.15834, 1, 1.5, 0.5, 0.5,
2, -4.640787, -6.15834, 0, 1.5, 0.5, 0.5,
3, -4.640787, -6.15834, 0, -0.5, 0.5, 0.5,
3, -4.640787, -6.15834, 1, -0.5, 0.5, 0.5,
3, -4.640787, -6.15834, 1, 1.5, 0.5, 0.5,
3, -4.640787, -6.15834, 0, 1.5, 0.5, 0.5
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
-3.3924, -2, -5.326817,
-3.3924, 2, -5.326817,
-3.3924, -2, -5.326817,
-3.562263, -2, -5.603992,
-3.3924, 0, -5.326817,
-3.562263, 0, -5.603992,
-3.3924, 2, -5.326817,
-3.562263, 2, -5.603992
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
-3.90199, -2, -6.15834, 0, -0.5, 0.5, 0.5,
-3.90199, -2, -6.15834, 1, -0.5, 0.5, 0.5,
-3.90199, -2, -6.15834, 1, 1.5, 0.5, 0.5,
-3.90199, -2, -6.15834, 0, 1.5, 0.5, 0.5,
-3.90199, 0, -6.15834, 0, -0.5, 0.5, 0.5,
-3.90199, 0, -6.15834, 1, -0.5, 0.5, 0.5,
-3.90199, 0, -6.15834, 1, 1.5, 0.5, 0.5,
-3.90199, 0, -6.15834, 0, 1.5, 0.5, 0.5,
-3.90199, 2, -6.15834, 0, -0.5, 0.5, 0.5,
-3.90199, 2, -6.15834, 1, -0.5, 0.5, 0.5,
-3.90199, 2, -6.15834, 1, 1.5, 0.5, 0.5,
-3.90199, 2, -6.15834, 0, 1.5, 0.5, 0.5
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
-3.3924, -4.085874, -4,
-3.3924, -4.085874, 4,
-3.3924, -4.085874, -4,
-3.562263, -4.270844, -4,
-3.3924, -4.085874, -2,
-3.562263, -4.270844, -2,
-3.3924, -4.085874, 0,
-3.562263, -4.270844, 0,
-3.3924, -4.085874, 2,
-3.562263, -4.270844, 2,
-3.3924, -4.085874, 4,
-3.562263, -4.270844, 4
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
-3.90199, -4.640787, -4, 0, -0.5, 0.5, 0.5,
-3.90199, -4.640787, -4, 1, -0.5, 0.5, 0.5,
-3.90199, -4.640787, -4, 1, 1.5, 0.5, 0.5,
-3.90199, -4.640787, -4, 0, 1.5, 0.5, 0.5,
-3.90199, -4.640787, -2, 0, -0.5, 0.5, 0.5,
-3.90199, -4.640787, -2, 1, -0.5, 0.5, 0.5,
-3.90199, -4.640787, -2, 1, 1.5, 0.5, 0.5,
-3.90199, -4.640787, -2, 0, 1.5, 0.5, 0.5,
-3.90199, -4.640787, 0, 0, -0.5, 0.5, 0.5,
-3.90199, -4.640787, 0, 1, -0.5, 0.5, 0.5,
-3.90199, -4.640787, 0, 1, 1.5, 0.5, 0.5,
-3.90199, -4.640787, 0, 0, 1.5, 0.5, 0.5,
-3.90199, -4.640787, 2, 0, -0.5, 0.5, 0.5,
-3.90199, -4.640787, 2, 1, -0.5, 0.5, 0.5,
-3.90199, -4.640787, 2, 1, 1.5, 0.5, 0.5,
-3.90199, -4.640787, 2, 0, 1.5, 0.5, 0.5,
-3.90199, -4.640787, 4, 0, -0.5, 0.5, 0.5,
-3.90199, -4.640787, 4, 1, -0.5, 0.5, 0.5,
-3.90199, -4.640787, 4, 1, 1.5, 0.5, 0.5,
-3.90199, -4.640787, 4, 0, 1.5, 0.5, 0.5
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
-3.3924, -4.085874, -5.326817,
-3.3924, 3.312975, -5.326817,
-3.3924, -4.085874, 5.760144,
-3.3924, 3.312975, 5.760144,
-3.3924, -4.085874, -5.326817,
-3.3924, -4.085874, 5.760144,
-3.3924, 3.312975, -5.326817,
-3.3924, 3.312975, 5.760144,
-3.3924, -4.085874, -5.326817,
3.402128, -4.085874, -5.326817,
-3.3924, -4.085874, 5.760144,
3.402128, -4.085874, 5.760144,
-3.3924, 3.312975, -5.326817,
3.402128, 3.312975, -5.326817,
-3.3924, 3.312975, 5.760144,
3.402128, 3.312975, 5.760144,
3.402128, -4.085874, -5.326817,
3.402128, 3.312975, -5.326817,
3.402128, -4.085874, 5.760144,
3.402128, 3.312975, 5.760144,
3.402128, -4.085874, -5.326817,
3.402128, -4.085874, 5.760144,
3.402128, 3.312975, -5.326817,
3.402128, 3.312975, 5.760144
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
var radius = 7.988844;
var distance = 35.54327;
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
mvMatrix.translate( -0.004863739, 0.3864492, -0.2166636 );
mvMatrix.scale( 1.271272, 1.167438, 0.7790858 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.54327);
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
Prothoate<-read.table("Prothoate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Prothoate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Prothoate' not found
```

```r
y<-Prothoate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Prothoate' not found
```

```r
z<-Prothoate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Prothoate' not found
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
-3.293451, 1.059649, -2.442986, 0, 0, 1, 1, 1,
-3.254458, -1.366372, -2.655218, 1, 0, 0, 1, 1,
-2.948507, 2.162771, -1.169451, 1, 0, 0, 1, 1,
-2.845271, 1.663305, -0.09071585, 1, 0, 0, 1, 1,
-2.837999, 0.1651095, -2.212265, 1, 0, 0, 1, 1,
-2.809069, -0.4931343, -0.5013995, 1, 0, 0, 1, 1,
-2.53503, 1.704826, -1.247521, 0, 0, 0, 1, 1,
-2.512823, 0.8971928, -1.873793, 0, 0, 0, 1, 1,
-2.500499, 0.8561913, -0.6231494, 0, 0, 0, 1, 1,
-2.494592, -0.4221372, -2.064352, 0, 0, 0, 1, 1,
-2.445168, 1.307949, -1.492306, 0, 0, 0, 1, 1,
-2.435304, -0.8385915, -1.476682, 0, 0, 0, 1, 1,
-2.426942, 2.523896, -0.4536819, 0, 0, 0, 1, 1,
-2.402609, -0.3848542, -2.718269, 1, 1, 1, 1, 1,
-2.372664, -0.6268879, -1.4359, 1, 1, 1, 1, 1,
-2.337405, -0.1965975, -2.80585, 1, 1, 1, 1, 1,
-2.275589, -1.52706, -1.533631, 1, 1, 1, 1, 1,
-2.26684, -1.560927, -2.75284, 1, 1, 1, 1, 1,
-2.19013, 2.141568, -0.8383904, 1, 1, 1, 1, 1,
-2.152691, 0.6275049, -1.522107, 1, 1, 1, 1, 1,
-2.100981, 1.681996, -0.9474853, 1, 1, 1, 1, 1,
-2.085482, 0.2760724, -2.481822, 1, 1, 1, 1, 1,
-2.084949, 1.626934, -1.784132, 1, 1, 1, 1, 1,
-2.079698, 1.921178, -1.390858, 1, 1, 1, 1, 1,
-2.071601, -0.7801371, -2.52218, 1, 1, 1, 1, 1,
-2.065377, 0.3974528, -0.5159405, 1, 1, 1, 1, 1,
-2.050564, 1.122996, -2.1858, 1, 1, 1, 1, 1,
-2.014974, 1.682388, 0.5347958, 1, 1, 1, 1, 1,
-2.00368, -0.7487985, -2.857683, 0, 0, 1, 1, 1,
-1.989364, -0.1775966, 0.4807293, 1, 0, 0, 1, 1,
-1.987521, -0.7014273, -2.523574, 1, 0, 0, 1, 1,
-1.973324, -0.6008517, -2.914991, 1, 0, 0, 1, 1,
-1.959576, -0.415503, -2.536481, 1, 0, 0, 1, 1,
-1.949047, -1.557981, -0.5293511, 1, 0, 0, 1, 1,
-1.931919, -0.3923759, 0.854522, 0, 0, 0, 1, 1,
-1.909783, 0.4179518, -0.6780354, 0, 0, 0, 1, 1,
-1.899175, 0.5510416, -1.33378, 0, 0, 0, 1, 1,
-1.895604, -0.2272111, -3.054502, 0, 0, 0, 1, 1,
-1.885994, 2.779115, -0.5962648, 0, 0, 0, 1, 1,
-1.867403, -0.2519051, -0.7863509, 0, 0, 0, 1, 1,
-1.853917, -0.5501987, -1.739067, 0, 0, 0, 1, 1,
-1.852263, -0.2872329, -0.215818, 1, 1, 1, 1, 1,
-1.829434, 0.5355005, -0.3430063, 1, 1, 1, 1, 1,
-1.82429, 0.7524729, -0.4419467, 1, 1, 1, 1, 1,
-1.819308, -0.4874993, -1.579226, 1, 1, 1, 1, 1,
-1.811773, 0.3779073, 0.2499845, 1, 1, 1, 1, 1,
-1.799237, 1.893474, -2.558443, 1, 1, 1, 1, 1,
-1.798634, -0.1861913, -1.860722, 1, 1, 1, 1, 1,
-1.779314, 0.273572, -1.120098, 1, 1, 1, 1, 1,
-1.778584, -0.5091605, 0.4298797, 1, 1, 1, 1, 1,
-1.775436, 1.679618, -2.196846, 1, 1, 1, 1, 1,
-1.768424, -0.1529178, -1.915729, 1, 1, 1, 1, 1,
-1.762541, -0.3245548, -1.670377, 1, 1, 1, 1, 1,
-1.761181, 1.571377, 0.1243426, 1, 1, 1, 1, 1,
-1.753709, 1.073159, -0.6659872, 1, 1, 1, 1, 1,
-1.746902, 1.799197, -1.796071, 1, 1, 1, 1, 1,
-1.737997, 0.7413803, -1.378069, 0, 0, 1, 1, 1,
-1.737327, 0.2025373, -1.362476, 1, 0, 0, 1, 1,
-1.723996, 0.2557976, -4.442769, 1, 0, 0, 1, 1,
-1.699678, -1.774316, -2.895968, 1, 0, 0, 1, 1,
-1.696512, -2.452558, -2.626049, 1, 0, 0, 1, 1,
-1.695754, 1.628802, 0.8108614, 1, 0, 0, 1, 1,
-1.694682, 0.981714, 2.207965, 0, 0, 0, 1, 1,
-1.69222, -3.978123, -1.319973, 0, 0, 0, 1, 1,
-1.687534, 3.200809, -0.2531188, 0, 0, 0, 1, 1,
-1.687168, 0.849251, -0.6785415, 0, 0, 0, 1, 1,
-1.684878, -0.116218, -1.247397, 0, 0, 0, 1, 1,
-1.679371, -0.1695167, -0.9391226, 0, 0, 0, 1, 1,
-1.676741, 0.4714527, -1.37797, 0, 0, 0, 1, 1,
-1.673689, -2.247215, -0.9839991, 1, 1, 1, 1, 1,
-1.652827, -2.140069, -3.671127, 1, 1, 1, 1, 1,
-1.647407, 0.2863516, -2.2287, 1, 1, 1, 1, 1,
-1.639838, -0.841583, -2.599247, 1, 1, 1, 1, 1,
-1.63859, 0.06525325, -2.543164, 1, 1, 1, 1, 1,
-1.63215, 1.257753, -0.7944644, 1, 1, 1, 1, 1,
-1.608988, 0.4776681, -2.052717, 1, 1, 1, 1, 1,
-1.598991, -0.8457372, -2.533494, 1, 1, 1, 1, 1,
-1.589592, 0.2616702, -0.7313554, 1, 1, 1, 1, 1,
-1.576172, 0.5669082, -1.212484, 1, 1, 1, 1, 1,
-1.560726, 0.7581151, 0.4108545, 1, 1, 1, 1, 1,
-1.551587, -0.9797015, -2.007968, 1, 1, 1, 1, 1,
-1.542602, -0.3222597, -3.277454, 1, 1, 1, 1, 1,
-1.518316, 0.4495995, -2.923947, 1, 1, 1, 1, 1,
-1.509488, -0.8962768, -1.375526, 1, 1, 1, 1, 1,
-1.491821, 0.176063, -1.925392, 0, 0, 1, 1, 1,
-1.487143, -1.715369, -3.250304, 1, 0, 0, 1, 1,
-1.483505, 0.2439472, -2.223006, 1, 0, 0, 1, 1,
-1.475772, 0.827799, -1.521041, 1, 0, 0, 1, 1,
-1.472364, 2.295558, 0.009402073, 1, 0, 0, 1, 1,
-1.465635, -0.232073, -1.534671, 1, 0, 0, 1, 1,
-1.45861, -0.08367199, -0.4280779, 0, 0, 0, 1, 1,
-1.433676, 0.901566, -2.446718, 0, 0, 0, 1, 1,
-1.431465, -0.7894955, -1.708292, 0, 0, 0, 1, 1,
-1.429019, -1.414166, -1.368735, 0, 0, 0, 1, 1,
-1.425463, -1.581732, -2.754574, 0, 0, 0, 1, 1,
-1.42501, 1.313531, -0.2654158, 0, 0, 0, 1, 1,
-1.424945, -0.7163224, -0.2575056, 0, 0, 0, 1, 1,
-1.416855, -1.724084, -4.500528, 1, 1, 1, 1, 1,
-1.398971, 0.7064029, -0.9540018, 1, 1, 1, 1, 1,
-1.393171, 0.6045504, 0.04754373, 1, 1, 1, 1, 1,
-1.391771, 1.048581, -1.223122, 1, 1, 1, 1, 1,
-1.389567, -0.3768528, -1.452254, 1, 1, 1, 1, 1,
-1.386864, -0.9428551, -0.7419503, 1, 1, 1, 1, 1,
-1.363745, -0.5327379, -0.2863706, 1, 1, 1, 1, 1,
-1.360219, -0.5944053, -1.522509, 1, 1, 1, 1, 1,
-1.341091, -0.2625181, -0.7762345, 1, 1, 1, 1, 1,
-1.326331, 0.4418379, 0.02284224, 1, 1, 1, 1, 1,
-1.322136, -0.2558465, -0.5831614, 1, 1, 1, 1, 1,
-1.2979, -0.6869597, -1.098294, 1, 1, 1, 1, 1,
-1.297437, -0.8049218, -2.919733, 1, 1, 1, 1, 1,
-1.288615, -0.4908584, -0.5827513, 1, 1, 1, 1, 1,
-1.286703, -0.05606556, -1.578507, 1, 1, 1, 1, 1,
-1.284528, -0.4894012, -1.498341, 0, 0, 1, 1, 1,
-1.284275, -0.07024565, -2.875062, 1, 0, 0, 1, 1,
-1.28176, -0.3386635, -1.624251, 1, 0, 0, 1, 1,
-1.280447, -0.152273, -1.164566, 1, 0, 0, 1, 1,
-1.278231, -0.7318479, -2.457131, 1, 0, 0, 1, 1,
-1.276874, 0.01277676, -2.059774, 1, 0, 0, 1, 1,
-1.275555, -1.209641, -0.562291, 0, 0, 0, 1, 1,
-1.267309, -0.5116568, -0.6881903, 0, 0, 0, 1, 1,
-1.256997, -0.01173042, -1.210618, 0, 0, 0, 1, 1,
-1.250854, -0.479535, -0.4632911, 0, 0, 0, 1, 1,
-1.24975, 0.6676673, -1.38554, 0, 0, 0, 1, 1,
-1.245995, -0.3903874, -1.807441, 0, 0, 0, 1, 1,
-1.245792, 0.8503019, -0.7741528, 0, 0, 0, 1, 1,
-1.241864, 0.3998822, -1.060383, 1, 1, 1, 1, 1,
-1.23775, 0.1675144, -0.5139925, 1, 1, 1, 1, 1,
-1.231522, 1.056045, 0.4194397, 1, 1, 1, 1, 1,
-1.222926, -0.16283, -1.138743, 1, 1, 1, 1, 1,
-1.222569, -0.1211741, 0.8155116, 1, 1, 1, 1, 1,
-1.217282, -0.9658854, 0.513966, 1, 1, 1, 1, 1,
-1.217142, -1.414608, -2.689163, 1, 1, 1, 1, 1,
-1.20852, 0.2822446, -1.11535, 1, 1, 1, 1, 1,
-1.207923, 0.2547356, -1.367508, 1, 1, 1, 1, 1,
-1.206168, 0.1925317, -1.560755, 1, 1, 1, 1, 1,
-1.198322, -0.5437802, -1.160761, 1, 1, 1, 1, 1,
-1.196385, 0.5666295, -0.2365247, 1, 1, 1, 1, 1,
-1.1957, -0.2571672, -1.180084, 1, 1, 1, 1, 1,
-1.180155, 4.145576e-05, -1.925536, 1, 1, 1, 1, 1,
-1.17897, -1.611487, -1.79759, 1, 1, 1, 1, 1,
-1.176846, -0.8093261, -1.354876, 0, 0, 1, 1, 1,
-1.150138, -0.515632, -2.337322, 1, 0, 0, 1, 1,
-1.145366, -1.484257, -2.584489, 1, 0, 0, 1, 1,
-1.142711, 0.7623968, -2.34291, 1, 0, 0, 1, 1,
-1.138856, -0.5154957, -0.6839489, 1, 0, 0, 1, 1,
-1.129499, -1.575925, -4.009875, 1, 0, 0, 1, 1,
-1.125405, 0.2783208, -2.969717, 0, 0, 0, 1, 1,
-1.121463, -0.1040313, -1.644162, 0, 0, 0, 1, 1,
-1.111585, -1.170896, -2.959, 0, 0, 0, 1, 1,
-1.101613, 0.7185681, 0.1795568, 0, 0, 0, 1, 1,
-1.096401, 0.05976507, -2.344739, 0, 0, 0, 1, 1,
-1.088353, -0.1357641, -1.610583, 0, 0, 0, 1, 1,
-1.085449, -0.6459253, -0.9319118, 0, 0, 0, 1, 1,
-1.080282, 1.374654, 1.182983, 1, 1, 1, 1, 1,
-1.07778, 0.6980467, -0.9205333, 1, 1, 1, 1, 1,
-1.077658, 0.2783912, -2.557482, 1, 1, 1, 1, 1,
-1.076018, 0.1231549, -1.255778, 1, 1, 1, 1, 1,
-1.07597, -0.5858566, -2.058178, 1, 1, 1, 1, 1,
-1.07085, 0.06900854, -0.06840421, 1, 1, 1, 1, 1,
-1.070585, -1.896349, -1.266586, 1, 1, 1, 1, 1,
-1.067183, 1.378377, 0.2019834, 1, 1, 1, 1, 1,
-1.066548, -0.2569404, -1.432154, 1, 1, 1, 1, 1,
-1.061298, -0.5476997, -1.690382, 1, 1, 1, 1, 1,
-1.054934, 1.175245, -0.1434363, 1, 1, 1, 1, 1,
-1.050377, 0.4435504, -1.243228, 1, 1, 1, 1, 1,
-1.047832, 1.146381, -1.469008, 1, 1, 1, 1, 1,
-1.041355, 0.2446211, -1.82747, 1, 1, 1, 1, 1,
-1.040516, 0.157976, -2.658374, 1, 1, 1, 1, 1,
-1.0378, 0.02051336, -0.4761086, 0, 0, 1, 1, 1,
-1.035576, -1.009575, -2.660319, 1, 0, 0, 1, 1,
-1.02596, -0.1405488, -0.8139678, 1, 0, 0, 1, 1,
-1.024144, -1.519594, -3.701237, 1, 0, 0, 1, 1,
-1.018888, -1.429831, -4.114573, 1, 0, 0, 1, 1,
-1.017243, 0.93156, -0.9086944, 1, 0, 0, 1, 1,
-1.01273, 2.760449, -0.501668, 0, 0, 0, 1, 1,
-1.007625, -0.03574641, -2.806238, 0, 0, 0, 1, 1,
-1.004743, 0.4014392, -0.07320846, 0, 0, 0, 1, 1,
-0.9999898, 0.3391916, -1.035576, 0, 0, 0, 1, 1,
-0.9975009, -1.250919, -1.96141, 0, 0, 0, 1, 1,
-0.9879265, 1.035807, 0.1075093, 0, 0, 0, 1, 1,
-0.9870152, -1.11226, -3.949389, 0, 0, 0, 1, 1,
-0.9788707, -0.3005351, -2.931874, 1, 1, 1, 1, 1,
-0.9775264, 0.602288, -1.521007, 1, 1, 1, 1, 1,
-0.973125, -0.3380848, -2.961729, 1, 1, 1, 1, 1,
-0.9666916, -0.1296237, -3.078883, 1, 1, 1, 1, 1,
-0.9660245, -0.08464343, -3.268293, 1, 1, 1, 1, 1,
-0.9635288, -0.6588089, -2.767129, 1, 1, 1, 1, 1,
-0.962759, -0.5985634, -2.487348, 1, 1, 1, 1, 1,
-0.9625642, 0.482128, -1.738386, 1, 1, 1, 1, 1,
-0.9569014, -0.4024886, -0.4123331, 1, 1, 1, 1, 1,
-0.9566277, -1.655418, -4.545149, 1, 1, 1, 1, 1,
-0.9563568, -1.396489, -2.570657, 1, 1, 1, 1, 1,
-0.9555039, 0.2023256, -0.7020376, 1, 1, 1, 1, 1,
-0.9554116, 1.023927, -0.1009454, 1, 1, 1, 1, 1,
-0.947086, 0.08144354, -1.250146, 1, 1, 1, 1, 1,
-0.9337561, -0.946953, -1.39247, 1, 1, 1, 1, 1,
-0.9324148, 0.305701, -1.118894, 0, 0, 1, 1, 1,
-0.9247602, -0.1980815, -2.102458, 1, 0, 0, 1, 1,
-0.9229177, -0.9230531, -2.935461, 1, 0, 0, 1, 1,
-0.9182385, -2.149948, -2.5845, 1, 0, 0, 1, 1,
-0.9131197, -1.520174, -3.16787, 1, 0, 0, 1, 1,
-0.9085678, -0.007121571, -2.299899, 1, 0, 0, 1, 1,
-0.9084302, 1.999662, -0.5451018, 0, 0, 0, 1, 1,
-0.9022992, 0.946715, 0.3327205, 0, 0, 0, 1, 1,
-0.9007043, -1.376259, -2.012636, 0, 0, 0, 1, 1,
-0.8961799, -0.3388334, -2.600581, 0, 0, 0, 1, 1,
-0.8944989, 0.9017941, -2.504436, 0, 0, 0, 1, 1,
-0.8918351, 1.630328, -0.4093061, 0, 0, 0, 1, 1,
-0.8816291, -0.2632253, -4.695509, 0, 0, 0, 1, 1,
-0.8778219, -0.8044847, -2.386951, 1, 1, 1, 1, 1,
-0.8775333, 1.080308, -1.017396, 1, 1, 1, 1, 1,
-0.8712244, 0.4192322, -1.2183, 1, 1, 1, 1, 1,
-0.871062, 0.8983062, -1.057334, 1, 1, 1, 1, 1,
-0.8708546, 0.6933711, -0.8427217, 1, 1, 1, 1, 1,
-0.855813, -3.021245, -4.329467, 1, 1, 1, 1, 1,
-0.8492163, 2.760312, -1.24312, 1, 1, 1, 1, 1,
-0.8413736, -0.9027336, -1.772887, 1, 1, 1, 1, 1,
-0.8320562, -0.4784893, -1.488697, 1, 1, 1, 1, 1,
-0.8320053, 1.186214, 0.2796557, 1, 1, 1, 1, 1,
-0.8311402, 0.326682, -1.93816, 1, 1, 1, 1, 1,
-0.8301753, -0.3523755, -3.665047, 1, 1, 1, 1, 1,
-0.8273017, 0.03177604, -0.9998685, 1, 1, 1, 1, 1,
-0.8261966, 0.5278965, -2.249162, 1, 1, 1, 1, 1,
-0.8194457, 1.187007, -0.3478832, 1, 1, 1, 1, 1,
-0.8175219, -0.8172108, -3.100878, 0, 0, 1, 1, 1,
-0.8168023, -1.353572, -1.691779, 1, 0, 0, 1, 1,
-0.8117025, -0.03031492, -1.512918, 1, 0, 0, 1, 1,
-0.8110676, -0.4645081, -0.4581642, 1, 0, 0, 1, 1,
-0.8104459, -1.292004, -0.6381224, 1, 0, 0, 1, 1,
-0.8090817, -0.7237106, -2.28683, 1, 0, 0, 1, 1,
-0.8079436, -1.315782, -1.810959, 0, 0, 0, 1, 1,
-0.8060982, -0.7940142, -2.729116, 0, 0, 0, 1, 1,
-0.7986397, -0.7080525, -0.4196473, 0, 0, 0, 1, 1,
-0.7963054, 0.02786801, -0.2791905, 0, 0, 0, 1, 1,
-0.7959976, 0.8755862, -0.8408764, 0, 0, 0, 1, 1,
-0.7953952, 1.180098, 1.183841, 0, 0, 0, 1, 1,
-0.7951527, -0.321899, -2.156683, 0, 0, 0, 1, 1,
-0.7861912, -1.098596, -1.953556, 1, 1, 1, 1, 1,
-0.7818159, -0.7574798, -0.8507016, 1, 1, 1, 1, 1,
-0.7779787, -0.1690634, -1.15525, 1, 1, 1, 1, 1,
-0.7735063, -2.143947, -2.212507, 1, 1, 1, 1, 1,
-0.772877, 1.01386, -0.7143623, 1, 1, 1, 1, 1,
-0.7720386, -0.6196974, -3.409211, 1, 1, 1, 1, 1,
-0.762791, -0.3148287, -2.483651, 1, 1, 1, 1, 1,
-0.7615981, -0.6218786, -1.764838, 1, 1, 1, 1, 1,
-0.7605233, -1.301726, -2.232065, 1, 1, 1, 1, 1,
-0.7562535, 0.4102165, -0.3101912, 1, 1, 1, 1, 1,
-0.7554758, 0.961616, 0.3471843, 1, 1, 1, 1, 1,
-0.7536976, 1.080019, -1.220042, 1, 1, 1, 1, 1,
-0.7454683, -0.5787566, -1.962557, 1, 1, 1, 1, 1,
-0.7435309, -0.5445889, -4.268243, 1, 1, 1, 1, 1,
-0.7425213, -0.3506004, -1.134052, 1, 1, 1, 1, 1,
-0.7386647, -0.1308522, -0.3849699, 0, 0, 1, 1, 1,
-0.7353213, 0.8052747, -0.3725126, 1, 0, 0, 1, 1,
-0.731798, -1.487015, -1.9129, 1, 0, 0, 1, 1,
-0.7274526, -0.8653021, -2.304496, 1, 0, 0, 1, 1,
-0.7245907, 0.3036863, 0.7143954, 1, 0, 0, 1, 1,
-0.7104395, 0.2318697, -0.1792027, 1, 0, 0, 1, 1,
-0.7081002, 0.01890108, -3.879354, 0, 0, 0, 1, 1,
-0.7073622, 0.08953007, -1.990165, 0, 0, 0, 1, 1,
-0.7047248, -0.6684956, 0.1034016, 0, 0, 0, 1, 1,
-0.6983616, -1.364457, -2.178029, 0, 0, 0, 1, 1,
-0.6981566, 0.8309892, -1.739298, 0, 0, 0, 1, 1,
-0.6959625, 0.059714, 0.9877938, 0, 0, 0, 1, 1,
-0.6948254, 1.34835, 0.8402152, 0, 0, 0, 1, 1,
-0.6942231, -1.062332, -3.529291, 1, 1, 1, 1, 1,
-0.6911771, -1.056545, -5.165357, 1, 1, 1, 1, 1,
-0.6882232, 0.2634659, -2.304144, 1, 1, 1, 1, 1,
-0.6872891, 2.468609, 0.5465807, 1, 1, 1, 1, 1,
-0.6865678, 0.6556571, -0.935147, 1, 1, 1, 1, 1,
-0.6839613, 2.151455, -1.019476, 1, 1, 1, 1, 1,
-0.6816421, 1.60383, 0.7317887, 1, 1, 1, 1, 1,
-0.6781757, 0.177517, -1.752854, 1, 1, 1, 1, 1,
-0.6726757, 1.416292, -1.163365, 1, 1, 1, 1, 1,
-0.6701284, -1.281311, -2.641192, 1, 1, 1, 1, 1,
-0.6665791, 0.5011074, -1.343359, 1, 1, 1, 1, 1,
-0.6631012, -0.4743929, -0.8309224, 1, 1, 1, 1, 1,
-0.6620864, -0.08047111, -0.7085472, 1, 1, 1, 1, 1,
-0.6611812, 1.197263, -0.6099116, 1, 1, 1, 1, 1,
-0.6609707, -0.5412593, -2.626508, 1, 1, 1, 1, 1,
-0.6582854, 0.7141236, -1.509927, 0, 0, 1, 1, 1,
-0.6572589, -0.3305507, -2.043358, 1, 0, 0, 1, 1,
-0.6522055, -0.2613257, -2.343271, 1, 0, 0, 1, 1,
-0.6495768, 0.1610755, -0.5753245, 1, 0, 0, 1, 1,
-0.6484465, -0.312057, -1.237311, 1, 0, 0, 1, 1,
-0.6464741, 0.3509291, -1.218176, 1, 0, 0, 1, 1,
-0.6446356, -0.3365018, -2.455854, 0, 0, 0, 1, 1,
-0.6378163, -0.3816574, -1.055554, 0, 0, 0, 1, 1,
-0.6375898, 1.174793, -1.725553, 0, 0, 0, 1, 1,
-0.6342008, 1.214135, -0.07051395, 0, 0, 0, 1, 1,
-0.6289701, 0.3595188, -0.07999603, 0, 0, 0, 1, 1,
-0.6267153, -0.1737597, -2.43648, 0, 0, 0, 1, 1,
-0.6220061, -2.082566, -3.538753, 0, 0, 0, 1, 1,
-0.6218516, 0.5406904, -1.388831, 1, 1, 1, 1, 1,
-0.6212022, 1.351793, -0.4669331, 1, 1, 1, 1, 1,
-0.6182849, 1.076977, -0.3113113, 1, 1, 1, 1, 1,
-0.6146647, 0.6272913, -0.3767558, 1, 1, 1, 1, 1,
-0.6124871, -0.4858225, -1.469446, 1, 1, 1, 1, 1,
-0.6097468, 0.377839, -1.320652, 1, 1, 1, 1, 1,
-0.6073688, -0.5408683, -2.292773, 1, 1, 1, 1, 1,
-0.6025013, -0.1959158, -1.07585, 1, 1, 1, 1, 1,
-0.6013843, -0.7209385, -0.3191699, 1, 1, 1, 1, 1,
-0.6012065, -0.4701682, -1.706682, 1, 1, 1, 1, 1,
-0.597537, -1.201178, -2.846884, 1, 1, 1, 1, 1,
-0.5974485, -0.4381049, -1.304504, 1, 1, 1, 1, 1,
-0.5970864, -0.1970052, -1.006225, 1, 1, 1, 1, 1,
-0.5963448, -0.299809, -0.6103078, 1, 1, 1, 1, 1,
-0.5951258, -0.3047479, -1.021904, 1, 1, 1, 1, 1,
-0.5947981, 1.583556, 0.08802094, 0, 0, 1, 1, 1,
-0.594349, -0.7499694, -4.281519, 1, 0, 0, 1, 1,
-0.5917655, 1.81997, -0.312107, 1, 0, 0, 1, 1,
-0.5843189, 1.570137, -0.1189754, 1, 0, 0, 1, 1,
-0.5830427, 0.5400318, -0.3333329, 1, 0, 0, 1, 1,
-0.5817872, 1.36122, -2.113685, 1, 0, 0, 1, 1,
-0.5796363, -0.5889782, -3.387367, 0, 0, 0, 1, 1,
-0.5788058, 0.3743617, -1.792699, 0, 0, 0, 1, 1,
-0.5780876, -0.1571261, -2.693179, 0, 0, 0, 1, 1,
-0.5743011, -2.241302, -4.658413, 0, 0, 0, 1, 1,
-0.5708712, 1.427697, -0.1960053, 0, 0, 0, 1, 1,
-0.5688168, -0.5888116, -2.180858, 0, 0, 0, 1, 1,
-0.5640302, -0.09257798, -1.81401, 0, 0, 0, 1, 1,
-0.5525083, -0.3533645, -4.558486, 1, 1, 1, 1, 1,
-0.5505536, -0.1615999, -1.001032, 1, 1, 1, 1, 1,
-0.547962, -0.1930481, -2.980631, 1, 1, 1, 1, 1,
-0.5456833, -1.841076, -2.554871, 1, 1, 1, 1, 1,
-0.5426383, -0.4887725, -3.825557, 1, 1, 1, 1, 1,
-0.5350873, 0.2786263, -2.140369, 1, 1, 1, 1, 1,
-0.5347586, -1.29891, -1.469915, 1, 1, 1, 1, 1,
-0.5311715, 0.57199, -0.6860801, 1, 1, 1, 1, 1,
-0.5269148, 1.038864, -0.4105223, 1, 1, 1, 1, 1,
-0.5264245, -0.06093071, -2.755795, 1, 1, 1, 1, 1,
-0.5190645, 0.3923129, 0.1730007, 1, 1, 1, 1, 1,
-0.5186024, -0.3592725, -1.388234, 1, 1, 1, 1, 1,
-0.5147205, 2.823088, -2.453336, 1, 1, 1, 1, 1,
-0.5104266, -0.07518885, -2.085189, 1, 1, 1, 1, 1,
-0.508253, 0.3645394, -0.05935831, 1, 1, 1, 1, 1,
-0.5038785, -1.368702, -3.234552, 0, 0, 1, 1, 1,
-0.4956536, -1.368261, -4.849144, 1, 0, 0, 1, 1,
-0.495542, 0.536733, -0.5138589, 1, 0, 0, 1, 1,
-0.4895452, -0.2825557, -2.576296, 1, 0, 0, 1, 1,
-0.4893422, 0.1017041, -1.105707, 1, 0, 0, 1, 1,
-0.4888147, -0.1422048, -2.548755, 1, 0, 0, 1, 1,
-0.4884, -2.028472, -3.307736, 0, 0, 0, 1, 1,
-0.487769, 0.5922768, -0.6746143, 0, 0, 0, 1, 1,
-0.4865012, 0.04432013, -1.934449, 0, 0, 0, 1, 1,
-0.4760182, -0.6183695, -1.287967, 0, 0, 0, 1, 1,
-0.4708153, -1.079837, -2.134341, 0, 0, 0, 1, 1,
-0.470489, 0.1023748, -3.179754, 0, 0, 0, 1, 1,
-0.4690819, -0.4130961, -3.458298, 0, 0, 0, 1, 1,
-0.465274, 0.2843543, -0.1758425, 1, 1, 1, 1, 1,
-0.4634566, -0.7785194, -1.729585, 1, 1, 1, 1, 1,
-0.4633085, -1.192043, -4.369956, 1, 1, 1, 1, 1,
-0.4627818, 0.01095024, -0.4624265, 1, 1, 1, 1, 1,
-0.460307, -0.21229, -2.796856, 1, 1, 1, 1, 1,
-0.4432257, -0.9342058, -1.225774, 1, 1, 1, 1, 1,
-0.4431181, 0.898455, -1.23817, 1, 1, 1, 1, 1,
-0.4415621, 0.103733, -1.744782, 1, 1, 1, 1, 1,
-0.441025, -0.8587531, -2.427263, 1, 1, 1, 1, 1,
-0.4379435, -0.3072777, -2.649631, 1, 1, 1, 1, 1,
-0.4312671, -0.1264963, -1.47532, 1, 1, 1, 1, 1,
-0.4303198, 1.240928, -1.068268, 1, 1, 1, 1, 1,
-0.4285685, 0.8541735, 0.3517607, 1, 1, 1, 1, 1,
-0.4243367, 1.972498, -0.7887959, 1, 1, 1, 1, 1,
-0.4218191, -0.4278865, -2.585489, 1, 1, 1, 1, 1,
-0.4209325, -0.6097421, -2.740854, 0, 0, 1, 1, 1,
-0.4209137, -2.406477, -1.665316, 1, 0, 0, 1, 1,
-0.4201957, 1.583721, -0.6127863, 1, 0, 0, 1, 1,
-0.4177839, -0.4509905, -2.534226, 1, 0, 0, 1, 1,
-0.4173902, -1.392406, -0.7623454, 1, 0, 0, 1, 1,
-0.4147153, 0.5858082, -2.190458, 1, 0, 0, 1, 1,
-0.4144655, -0.9440342, -3.187851, 0, 0, 0, 1, 1,
-0.4137843, 1.366504, 0.2198224, 0, 0, 0, 1, 1,
-0.4129449, 0.167358, -1.514043, 0, 0, 0, 1, 1,
-0.4104561, -0.1681638, -1.97551, 0, 0, 0, 1, 1,
-0.4089319, -0.9477274, -2.60023, 0, 0, 0, 1, 1,
-0.4082362, 0.7214707, -0.6362004, 0, 0, 0, 1, 1,
-0.4064633, -0.01120583, -2.860248, 0, 0, 0, 1, 1,
-0.4034498, -1.113671, -3.766227, 1, 1, 1, 1, 1,
-0.402279, 1.298099, -1.033385, 1, 1, 1, 1, 1,
-0.3992879, 0.3362609, -0.6828254, 1, 1, 1, 1, 1,
-0.3985406, 0.9870911, 1.082267, 1, 1, 1, 1, 1,
-0.3978018, 1.400069, 0.198329, 1, 1, 1, 1, 1,
-0.3858108, 1.70717, -2.265941, 1, 1, 1, 1, 1,
-0.3855063, -0.5441121, -2.285196, 1, 1, 1, 1, 1,
-0.3818097, -0.4331374, -3.083459, 1, 1, 1, 1, 1,
-0.3797064, 0.1269791, 0.8053923, 1, 1, 1, 1, 1,
-0.3785794, -0.7540395, -1.886558, 1, 1, 1, 1, 1,
-0.3765196, -1.067127, -1.789809, 1, 1, 1, 1, 1,
-0.3730604, 0.3755077, -1.306651, 1, 1, 1, 1, 1,
-0.3708749, 1.227197, -3.01965, 1, 1, 1, 1, 1,
-0.3689693, 1.602676, -0.04742141, 1, 1, 1, 1, 1,
-0.3679912, 0.3530265, 1.13839, 1, 1, 1, 1, 1,
-0.3661288, 1.340342, -0.5535351, 0, 0, 1, 1, 1,
-0.3654267, -0.7124494, -4.352883, 1, 0, 0, 1, 1,
-0.3630699, -0.5423635, -3.014465, 1, 0, 0, 1, 1,
-0.3558646, -0.6899326, -1.71869, 1, 0, 0, 1, 1,
-0.3554225, 0.2128289, 0.1125931, 1, 0, 0, 1, 1,
-0.3537023, -0.8705463, -2.043813, 1, 0, 0, 1, 1,
-0.3462632, -1.315605, -1.928761, 0, 0, 0, 1, 1,
-0.3420025, 0.8776946, -2.610338, 0, 0, 0, 1, 1,
-0.333924, -1.568756, -3.158344, 0, 0, 0, 1, 1,
-0.3328813, -0.7349563, -0.6540944, 0, 0, 0, 1, 1,
-0.3297878, 0.2495786, -2.593792, 0, 0, 0, 1, 1,
-0.3265268, 0.498303, -0.252868, 0, 0, 0, 1, 1,
-0.3261942, 0.3167674, -0.2924746, 0, 0, 0, 1, 1,
-0.3212857, 0.1714396, -1.923752, 1, 1, 1, 1, 1,
-0.3152207, 0.6609514, -0.9540277, 1, 1, 1, 1, 1,
-0.3139217, 1.443732, 0.6620708, 1, 1, 1, 1, 1,
-0.3073234, -1.556819, -0.7328701, 1, 1, 1, 1, 1,
-0.3035015, 0.05291229, -2.789173, 1, 1, 1, 1, 1,
-0.2999358, 0.6038011, -2.399101, 1, 1, 1, 1, 1,
-0.2963519, -1.93773, -2.571877, 1, 1, 1, 1, 1,
-0.2961648, 0.8120438, -1.710357, 1, 1, 1, 1, 1,
-0.2952407, 0.3178948, -0.8926298, 1, 1, 1, 1, 1,
-0.294447, -0.5169086, -2.901396, 1, 1, 1, 1, 1,
-0.2937237, 0.9230729, 1.043098, 1, 1, 1, 1, 1,
-0.2887484, 0.9560884, -1.822764, 1, 1, 1, 1, 1,
-0.2869585, -0.8641107, -2.405082, 1, 1, 1, 1, 1,
-0.286749, 1.509917, -1.526461, 1, 1, 1, 1, 1,
-0.2859929, -1.2992, -2.767113, 1, 1, 1, 1, 1,
-0.2804885, -0.8314798, -2.900705, 0, 0, 1, 1, 1,
-0.2785327, -0.8512589, -2.737921, 1, 0, 0, 1, 1,
-0.2774109, 0.3895885, -1.06979, 1, 0, 0, 1, 1,
-0.2728137, -0.08557353, -1.607338, 1, 0, 0, 1, 1,
-0.2701614, 0.7852364, 0.4840026, 1, 0, 0, 1, 1,
-0.2660086, 0.6825066, -0.1692429, 1, 0, 0, 1, 1,
-0.2617451, 1.768227, -0.4722717, 0, 0, 0, 1, 1,
-0.2588977, 0.1375901, -2.278376, 0, 0, 0, 1, 1,
-0.2561596, -0.9102938, -3.257177, 0, 0, 0, 1, 1,
-0.2462204, 1.018489, -0.3777565, 0, 0, 0, 1, 1,
-0.2455874, -0.1858282, -1.101241, 0, 0, 0, 1, 1,
-0.2419179, 2.781901, -0.2441497, 0, 0, 0, 1, 1,
-0.2378739, 0.6323417, -1.436458, 0, 0, 0, 1, 1,
-0.2373298, -0.1964377, -2.411935, 1, 1, 1, 1, 1,
-0.2365014, 0.5437086, -0.8609354, 1, 1, 1, 1, 1,
-0.2305652, 0.7448528, -1.955843, 1, 1, 1, 1, 1,
-0.2295104, -0.4190956, -2.980896, 1, 1, 1, 1, 1,
-0.2279873, -0.01882923, -1.289124, 1, 1, 1, 1, 1,
-0.2221822, 0.2683458, 0.176138, 1, 1, 1, 1, 1,
-0.2210054, 0.226386, -1.093661, 1, 1, 1, 1, 1,
-0.2199252, -0.2291902, -2.20803, 1, 1, 1, 1, 1,
-0.2196253, -0.07053196, -2.057998, 1, 1, 1, 1, 1,
-0.2169274, 0.7441935, -1.077264, 1, 1, 1, 1, 1,
-0.2162467, 2.162366, 0.08803016, 1, 1, 1, 1, 1,
-0.2159434, -0.5099704, -2.311826, 1, 1, 1, 1, 1,
-0.2102819, -0.185321, -2.055415, 1, 1, 1, 1, 1,
-0.2089299, -1.068617, -1.1534, 1, 1, 1, 1, 1,
-0.2074115, -0.9464123, -2.515249, 1, 1, 1, 1, 1,
-0.2048424, -0.4952745, -3.75058, 0, 0, 1, 1, 1,
-0.2031715, 0.3506741, 1.148826, 1, 0, 0, 1, 1,
-0.2018696, 2.380169, 0.2402757, 1, 0, 0, 1, 1,
-0.1990595, 0.5967756, -1.846562, 1, 0, 0, 1, 1,
-0.19567, 1.613901, -0.4629034, 1, 0, 0, 1, 1,
-0.1946429, -0.577174, -1.990389, 1, 0, 0, 1, 1,
-0.1890546, -0.6891597, -1.328211, 0, 0, 0, 1, 1,
-0.1822423, 0.6554666, 0.3819537, 0, 0, 0, 1, 1,
-0.1751231, 0.6855941, 1.475506, 0, 0, 0, 1, 1,
-0.1741262, -0.05630352, -1.84226, 0, 0, 0, 1, 1,
-0.1686212, 0.2564869, 1.820383, 0, 0, 0, 1, 1,
-0.1682074, 1.270783, 0.2224357, 0, 0, 0, 1, 1,
-0.1628185, -0.2970929, -3.429688, 0, 0, 0, 1, 1,
-0.1606719, 0.3598188, -0.3781484, 1, 1, 1, 1, 1,
-0.1498412, -0.02762914, -3.003365, 1, 1, 1, 1, 1,
-0.1493036, -0.8813658, -2.256468, 1, 1, 1, 1, 1,
-0.1492379, 0.8157251, -0.4268436, 1, 1, 1, 1, 1,
-0.1490669, 2.685367, -1.358881, 1, 1, 1, 1, 1,
-0.1464479, -1.770884, -3.149379, 1, 1, 1, 1, 1,
-0.1462597, 0.2582649, -0.268392, 1, 1, 1, 1, 1,
-0.1462064, -0.3381867, -2.646531, 1, 1, 1, 1, 1,
-0.1426581, 1.185974, -2.192754, 1, 1, 1, 1, 1,
-0.1355415, -2.663212, -2.605314, 1, 1, 1, 1, 1,
-0.1321796, -0.6447126, -4.046247, 1, 1, 1, 1, 1,
-0.1307139, 0.4544355, -0.750557, 1, 1, 1, 1, 1,
-0.1298978, 0.4140435, 0.3653169, 1, 1, 1, 1, 1,
-0.1267369, 0.4729314, 0.9573603, 1, 1, 1, 1, 1,
-0.1208021, -0.3656848, -1.980231, 1, 1, 1, 1, 1,
-0.1153571, -0.3961322, -2.051112, 0, 0, 1, 1, 1,
-0.1149971, -0.09581909, -3.19468, 1, 0, 0, 1, 1,
-0.1141438, 0.3057548, -0.322667, 1, 0, 0, 1, 1,
-0.113561, 1.218162, 0.7923571, 1, 0, 0, 1, 1,
-0.1065967, -0.4204038, -3.326321, 1, 0, 0, 1, 1,
-0.1054842, 0.8389713, -1.609932, 1, 0, 0, 1, 1,
-0.09530637, 1.26054, 1.784913, 0, 0, 0, 1, 1,
-0.09432959, -1.507581, -2.086044, 0, 0, 0, 1, 1,
-0.09290335, 0.2915572, -0.1640287, 0, 0, 0, 1, 1,
-0.09124796, -0.9885128, -3.576378, 0, 0, 0, 1, 1,
-0.08841966, -1.663655, -2.978731, 0, 0, 0, 1, 1,
-0.0867689, 0.897911, 0.6633918, 0, 0, 0, 1, 1,
-0.08613174, 1.551025, -0.6589667, 0, 0, 0, 1, 1,
-0.08471162, -0.5646056, -2.555096, 1, 1, 1, 1, 1,
-0.0829163, 1.12179, -0.1987145, 1, 1, 1, 1, 1,
-0.08091658, 1.105975, 0.4999624, 1, 1, 1, 1, 1,
-0.07983221, -0.6877661, -4.811318, 1, 1, 1, 1, 1,
-0.07924554, 0.9657947, -0.1366057, 1, 1, 1, 1, 1,
-0.07657688, 0.7408417, 0.7058889, 1, 1, 1, 1, 1,
-0.07492034, -0.09316071, -3.388456, 1, 1, 1, 1, 1,
-0.06639156, 0.4964263, 0.8436125, 1, 1, 1, 1, 1,
-0.06164131, 0.3342542, 0.3842463, 1, 1, 1, 1, 1,
-0.06074641, 0.352677, -0.8910134, 1, 1, 1, 1, 1,
-0.05852873, -1.582539, -3.135422, 1, 1, 1, 1, 1,
-0.05834332, -0.2256032, -1.755613, 1, 1, 1, 1, 1,
-0.0579327, 0.06444898, 0.01546664, 1, 1, 1, 1, 1,
-0.05439484, 0.4968783, 2.117105, 1, 1, 1, 1, 1,
-0.05353131, 0.4347447, 2.378025, 1, 1, 1, 1, 1,
-0.05172946, -0.3457485, -2.953704, 0, 0, 1, 1, 1,
-0.04663384, -0.5949785, -4.266137, 1, 0, 0, 1, 1,
-0.04586868, -0.170685, -3.187861, 1, 0, 0, 1, 1,
-0.04378204, 1.14169, 0.2683012, 1, 0, 0, 1, 1,
-0.04066017, 0.5829507, -0.7907978, 1, 0, 0, 1, 1,
-0.04053064, 1.559453, 1.673881, 1, 0, 0, 1, 1,
-0.03841547, -1.342182, -3.923216, 0, 0, 0, 1, 1,
-0.03746625, 0.9202183, 1.192713, 0, 0, 0, 1, 1,
-0.03550734, 0.2444572, 1.993842, 0, 0, 0, 1, 1,
-0.03042892, 1.538296, 0.5456098, 0, 0, 0, 1, 1,
-0.03018693, -0.1290097, -4.478099, 0, 0, 0, 1, 1,
-0.0299134, 0.9841896, -0.507803, 0, 0, 0, 1, 1,
-0.02596511, -0.6071607, -2.97549, 0, 0, 0, 1, 1,
-0.02564422, 0.4822828, 0.4702218, 1, 1, 1, 1, 1,
-0.02465469, -0.1706086, -2.456522, 1, 1, 1, 1, 1,
-0.02461504, 1.863745, 0.4617031, 1, 1, 1, 1, 1,
-0.02273994, -0.5899907, -3.436853, 1, 1, 1, 1, 1,
-0.01219261, -0.159266, -1.948841, 1, 1, 1, 1, 1,
-0.01214345, -0.5193525, -2.624462, 1, 1, 1, 1, 1,
-0.01085129, -0.5226249, -0.5019598, 1, 1, 1, 1, 1,
-0.01036129, -1.715928, -3.199785, 1, 1, 1, 1, 1,
-0.009034063, 0.6354755, -1.740792, 1, 1, 1, 1, 1,
-0.007435353, 0.3332453, -1.410676, 1, 1, 1, 1, 1,
-0.003408958, 1.005264, -0.1239211, 1, 1, 1, 1, 1,
-0.000243984, 0.4676273, -1.789687, 1, 1, 1, 1, 1,
0.004561627, 0.566649, -2.632732, 1, 1, 1, 1, 1,
0.007024284, 0.4526689, -2.047768, 1, 1, 1, 1, 1,
0.008404109, 1.158483, 0.3720858, 1, 1, 1, 1, 1,
0.01341629, -1.17007, 3.683066, 0, 0, 1, 1, 1,
0.01812951, -0.8147427, 5.237895, 1, 0, 0, 1, 1,
0.01990499, 0.0847716, 0.4475211, 1, 0, 0, 1, 1,
0.0231088, 0.2323669, 0.3257318, 1, 0, 0, 1, 1,
0.02511652, -0.6910967, 2.581939, 1, 0, 0, 1, 1,
0.02513164, 1.779616, -0.2456374, 1, 0, 0, 1, 1,
0.02522834, -0.9614896, 3.113895, 0, 0, 0, 1, 1,
0.02646879, -0.8310026, 3.864542, 0, 0, 0, 1, 1,
0.03271712, 0.6662263, -0.3213646, 0, 0, 0, 1, 1,
0.03634677, -0.4164727, 1.102439, 0, 0, 0, 1, 1,
0.03748895, -2.836895, 3.318292, 0, 0, 0, 1, 1,
0.04165196, 1.070495, 1.601572, 0, 0, 0, 1, 1,
0.04437697, 0.9900151, -1.4397, 0, 0, 0, 1, 1,
0.04492138, -1.996594, 2.818106, 1, 1, 1, 1, 1,
0.04722989, -0.9787809, 1.535833, 1, 1, 1, 1, 1,
0.04829029, -1.529939, 1.644703, 1, 1, 1, 1, 1,
0.04847277, 1.766508, -0.8521076, 1, 1, 1, 1, 1,
0.05033128, 1.211179, 0.8002387, 1, 1, 1, 1, 1,
0.05046114, 0.4250792, 0.8140355, 1, 1, 1, 1, 1,
0.05051938, -0.4346231, 3.163333, 1, 1, 1, 1, 1,
0.05164392, -0.5338534, 2.829801, 1, 1, 1, 1, 1,
0.05365366, 0.3058138, 0.3481892, 1, 1, 1, 1, 1,
0.05430702, 0.0386186, -0.07486837, 1, 1, 1, 1, 1,
0.05438371, -1.030429, 4.416959, 1, 1, 1, 1, 1,
0.05785901, -0.5153932, 3.830104, 1, 1, 1, 1, 1,
0.05972309, -0.3291155, 3.754382, 1, 1, 1, 1, 1,
0.06072883, -0.06309915, 1.643836, 1, 1, 1, 1, 1,
0.06124077, 1.256713, 1.13478, 1, 1, 1, 1, 1,
0.06466003, 0.2225697, 0.278966, 0, 0, 1, 1, 1,
0.06648144, 2.166571, -0.1139724, 1, 0, 0, 1, 1,
0.0730319, 2.463868, -0.9232775, 1, 0, 0, 1, 1,
0.0733787, -0.6172123, 2.903385, 1, 0, 0, 1, 1,
0.0769136, 0.4778908, -0.4399701, 1, 0, 0, 1, 1,
0.0783594, 1.540848, -0.5792277, 1, 0, 0, 1, 1,
0.08141219, -0.325573, 3.241768, 0, 0, 0, 1, 1,
0.08206075, -0.7437611, 2.822112, 0, 0, 0, 1, 1,
0.08228934, -2.293104, 2.895702, 0, 0, 0, 1, 1,
0.08359826, -1.348344, 2.207791, 0, 0, 0, 1, 1,
0.0871979, 1.143486, 0.2447704, 0, 0, 0, 1, 1,
0.09764846, 0.1843167, -1.623405, 0, 0, 0, 1, 1,
0.09779285, 1.245178, 0.220572, 0, 0, 0, 1, 1,
0.1011464, -1.460735, 4.586633, 1, 1, 1, 1, 1,
0.1041755, 1.864585, 1.041066, 1, 1, 1, 1, 1,
0.1092278, 0.1390555, 0.01814601, 1, 1, 1, 1, 1,
0.1093297, -0.5436103, 4.185485, 1, 1, 1, 1, 1,
0.1093317, -0.1931091, 1.970311, 1, 1, 1, 1, 1,
0.1139654, 0.09725635, 1.976248, 1, 1, 1, 1, 1,
0.1174214, 0.04042521, -0.3148942, 1, 1, 1, 1, 1,
0.1236652, -1.14975, 2.949113, 1, 1, 1, 1, 1,
0.1281575, -0.9604091, 4.446661, 1, 1, 1, 1, 1,
0.1305064, 1.09194, 0.3850938, 1, 1, 1, 1, 1,
0.1404482, 0.7102559, -0.7212424, 1, 1, 1, 1, 1,
0.1438587, -1.027055, 2.621553, 1, 1, 1, 1, 1,
0.1446852, -0.2596395, 3.261916, 1, 1, 1, 1, 1,
0.1449001, -1.603771, 2.780467, 1, 1, 1, 1, 1,
0.1471283, -1.327105, 4.747483, 1, 1, 1, 1, 1,
0.14872, -0.100121, 3.273008, 0, 0, 1, 1, 1,
0.1511389, 0.3315038, 0.7363234, 1, 0, 0, 1, 1,
0.1546883, 0.4108188, 0.9492682, 1, 0, 0, 1, 1,
0.157147, -1.259975, 2.323019, 1, 0, 0, 1, 1,
0.1629932, 0.9102237, -0.7410322, 1, 0, 0, 1, 1,
0.1661966, -0.3120167, 2.914026, 1, 0, 0, 1, 1,
0.1744719, -1.094966, 3.732046, 0, 0, 0, 1, 1,
0.1745921, -1.157364, 2.518991, 0, 0, 0, 1, 1,
0.1751783, 0.3367356, 0.3987836, 0, 0, 0, 1, 1,
0.1778417, 0.2815969, -1.15419, 0, 0, 0, 1, 1,
0.1793538, 0.4984983, 1.773126, 0, 0, 0, 1, 1,
0.1815064, -0.4736957, 2.015472, 0, 0, 0, 1, 1,
0.1840058, 0.5236192, 0.7886162, 0, 0, 0, 1, 1,
0.1951863, -0.9952657, 3.305051, 1, 1, 1, 1, 1,
0.1979456, -0.1535443, 2.532777, 1, 1, 1, 1, 1,
0.1980061, 0.0781198, 0.4889212, 1, 1, 1, 1, 1,
0.2029919, 0.326452, -1.26784, 1, 1, 1, 1, 1,
0.2055637, -0.3981515, 3.550722, 1, 1, 1, 1, 1,
0.2083408, -0.5592989, 1.852048, 1, 1, 1, 1, 1,
0.2084541, -0.6970981, 2.149565, 1, 1, 1, 1, 1,
0.2122378, 1.312821, -1.093379, 1, 1, 1, 1, 1,
0.2179318, 0.2939294, -0.8599206, 1, 1, 1, 1, 1,
0.2234779, -0.3843538, 1.718435, 1, 1, 1, 1, 1,
0.2276686, -2.323335, 2.816074, 1, 1, 1, 1, 1,
0.2280745, 0.990741, 1.648061, 1, 1, 1, 1, 1,
0.2286551, 0.3283621, 1.944409, 1, 1, 1, 1, 1,
0.2291161, -0.1159059, 1.846532, 1, 1, 1, 1, 1,
0.2328625, 1.403503, -1.424419, 1, 1, 1, 1, 1,
0.2334417, -0.1784073, 3.167281, 0, 0, 1, 1, 1,
0.2350603, -1.662413, 1.968391, 1, 0, 0, 1, 1,
0.2354304, 0.6881074, 1.068999, 1, 0, 0, 1, 1,
0.2362931, -0.3023368, 3.198679, 1, 0, 0, 1, 1,
0.2372749, -0.7776908, 2.949411, 1, 0, 0, 1, 1,
0.2383581, -0.07987512, 0.7581852, 1, 0, 0, 1, 1,
0.2439124, -0.7372689, 2.796711, 0, 0, 0, 1, 1,
0.2462357, 0.1107234, 1.890056, 0, 0, 0, 1, 1,
0.2493817, -2.645022, 2.287867, 0, 0, 0, 1, 1,
0.2533163, -0.5228621, 3.29511, 0, 0, 0, 1, 1,
0.2542222, -1.294633, 2.701355, 0, 0, 0, 1, 1,
0.258509, 0.3118476, -1.336145, 0, 0, 0, 1, 1,
0.2593961, -0.7033501, 1.857328, 0, 0, 0, 1, 1,
0.2644405, 1.382737, -1.807076, 1, 1, 1, 1, 1,
0.265807, 0.8916964, 0.9793339, 1, 1, 1, 1, 1,
0.2670557, 1.169742, 0.06288009, 1, 1, 1, 1, 1,
0.2678159, 0.1710815, 1.52835, 1, 1, 1, 1, 1,
0.2690122, -1.205329, 3.168581, 1, 1, 1, 1, 1,
0.2701043, -0.1796399, 2.248928, 1, 1, 1, 1, 1,
0.2703507, -0.8082246, 3.664844, 1, 1, 1, 1, 1,
0.2714592, 0.1534257, 0.9367666, 1, 1, 1, 1, 1,
0.2719532, -0.1775664, 0.894648, 1, 1, 1, 1, 1,
0.2720958, -0.8913197, 3.041171, 1, 1, 1, 1, 1,
0.2722498, 0.4727187, 0.5425153, 1, 1, 1, 1, 1,
0.2726302, -0.08831026, 3.656478, 1, 1, 1, 1, 1,
0.2729802, 1.623358, -1.234817, 1, 1, 1, 1, 1,
0.2784812, -2.133328, 3.826226, 1, 1, 1, 1, 1,
0.2812994, 1.027525, 0.8429816, 1, 1, 1, 1, 1,
0.2871986, 0.1477246, 0.03351796, 0, 0, 1, 1, 1,
0.2903855, 0.2117755, 0.6655434, 1, 0, 0, 1, 1,
0.2904289, 0.5329368, -1.412244, 1, 0, 0, 1, 1,
0.2911534, 1.680036, 0.001767181, 1, 0, 0, 1, 1,
0.2964061, -0.4549355, 1.817766, 1, 0, 0, 1, 1,
0.2969977, -1.37528, 2.945365, 1, 0, 0, 1, 1,
0.2996667, -0.4926298, 1.071295, 0, 0, 0, 1, 1,
0.3026695, 1.657245, 0.1755942, 0, 0, 0, 1, 1,
0.3036046, -1.484838, 3.252433, 0, 0, 0, 1, 1,
0.3044578, 0.3545998, -0.8123466, 0, 0, 0, 1, 1,
0.3108294, -0.1450276, 1.266491, 0, 0, 0, 1, 1,
0.3140699, 0.3336192, 0.6510238, 0, 0, 0, 1, 1,
0.3164969, 0.4388374, 1.115448, 0, 0, 0, 1, 1,
0.3166602, -2.005416, 3.54193, 1, 1, 1, 1, 1,
0.3192428, 1.352801, 0.1738705, 1, 1, 1, 1, 1,
0.3207849, -0.3081742, 1.927129, 1, 1, 1, 1, 1,
0.3236965, 0.4494959, 1.987056, 1, 1, 1, 1, 1,
0.3282411, -2.473017, 3.509483, 1, 1, 1, 1, 1,
0.3290052, -0.1221521, 0.5722804, 1, 1, 1, 1, 1,
0.3335989, 0.4296598, 1.125818, 1, 1, 1, 1, 1,
0.3338988, 0.01953883, 0.6444467, 1, 1, 1, 1, 1,
0.3341601, -1.159012, 1.999965, 1, 1, 1, 1, 1,
0.3382275, 1.535342, 1.036392, 1, 1, 1, 1, 1,
0.340843, -1.354655, 2.201643, 1, 1, 1, 1, 1,
0.3413158, 0.2022697, 2.162961, 1, 1, 1, 1, 1,
0.3439367, -1.211273, 1.848271, 1, 1, 1, 1, 1,
0.3451931, 0.07972158, 0.8190718, 1, 1, 1, 1, 1,
0.351114, 0.919304, 0.2801908, 1, 1, 1, 1, 1,
0.3534499, 1.330947, 0.05219352, 0, 0, 1, 1, 1,
0.3539412, 0.2190179, 1.19108, 1, 0, 0, 1, 1,
0.3647545, -2.092717, -0.7984052, 1, 0, 0, 1, 1,
0.3687258, 0.3261354, 1.847831, 1, 0, 0, 1, 1,
0.3714217, -2.090322, 5.520867, 1, 0, 0, 1, 1,
0.3742811, -0.9408339, 2.253122, 1, 0, 0, 1, 1,
0.3749107, -0.4378768, 2.08311, 0, 0, 0, 1, 1,
0.3801494, 0.9138445, 1.187832, 0, 0, 0, 1, 1,
0.3823812, -0.03053604, 3.188544, 0, 0, 0, 1, 1,
0.3835827, -0.7858334, 1.735904, 0, 0, 0, 1, 1,
0.3839429, 0.4945571, 1.487528, 0, 0, 0, 1, 1,
0.3843209, -0.5116135, 1.375159, 0, 0, 0, 1, 1,
0.3868066, -0.5510591, 2.165334, 0, 0, 0, 1, 1,
0.3889262, -0.04989342, 0.9350531, 1, 1, 1, 1, 1,
0.3894338, -0.9806264, 4.209531, 1, 1, 1, 1, 1,
0.391791, 0.6676988, 1.265126, 1, 1, 1, 1, 1,
0.3934785, -0.2424838, 0.1850999, 1, 1, 1, 1, 1,
0.3940858, -0.5533963, 2.392688, 1, 1, 1, 1, 1,
0.4002246, -2.099839, 3.073384, 1, 1, 1, 1, 1,
0.4022254, 0.27362, 2.282049, 1, 1, 1, 1, 1,
0.4030946, -1.019942, 4.020176, 1, 1, 1, 1, 1,
0.4087616, -0.4040495, 1.625187, 1, 1, 1, 1, 1,
0.4107824, 0.2733264, 1.641607, 1, 1, 1, 1, 1,
0.4115237, -1.143706, 3.180253, 1, 1, 1, 1, 1,
0.4125763, 1.4714, 2.050089, 1, 1, 1, 1, 1,
0.4130371, 0.1723248, 0.4167878, 1, 1, 1, 1, 1,
0.4138252, -2.234751, 2.885957, 1, 1, 1, 1, 1,
0.4175927, 1.239929, 0.4583395, 1, 1, 1, 1, 1,
0.4216354, -0.4915535, 2.126051, 0, 0, 1, 1, 1,
0.4277706, -2.218554, 3.982136, 1, 0, 0, 1, 1,
0.4350555, -0.9978452, 3.610574, 1, 0, 0, 1, 1,
0.4352882, 0.8745318, -0.4010775, 1, 0, 0, 1, 1,
0.4392955, -2.237769, 3.062297, 1, 0, 0, 1, 1,
0.4396883, 0.1882754, 3.493203, 1, 0, 0, 1, 1,
0.4420052, -0.2588079, 2.708455, 0, 0, 0, 1, 1,
0.4465, -0.0406118, 0.7789751, 0, 0, 0, 1, 1,
0.448186, -0.106134, 0.9187855, 0, 0, 0, 1, 1,
0.4576716, 0.5745654, 0.8012015, 0, 0, 0, 1, 1,
0.4584489, -1.395022, 2.274306, 0, 0, 0, 1, 1,
0.4586459, -0.7079186, 2.602078, 0, 0, 0, 1, 1,
0.4621342, -2.772039, 2.43303, 0, 0, 0, 1, 1,
0.4631163, 0.09272721, 1.568902, 1, 1, 1, 1, 1,
0.4660181, 0.04885671, 1.462704, 1, 1, 1, 1, 1,
0.4787796, 0.3467961, -1.418259, 1, 1, 1, 1, 1,
0.4791843, -0.8305387, 4.180281, 1, 1, 1, 1, 1,
0.4843671, 3.205225, 0.01787121, 1, 1, 1, 1, 1,
0.484977, -2.336042, 3.454042, 1, 1, 1, 1, 1,
0.4865764, -0.5578436, 2.198467, 1, 1, 1, 1, 1,
0.4873012, -1.885541, 1.989123, 1, 1, 1, 1, 1,
0.4897486, 0.1849545, 1.70208, 1, 1, 1, 1, 1,
0.4919522, 0.3370787, 1.482359, 1, 1, 1, 1, 1,
0.4920032, -0.3051263, 3.988976, 1, 1, 1, 1, 1,
0.496778, 0.03096116, -0.1416844, 1, 1, 1, 1, 1,
0.5002288, 0.4751911, 3.288035, 1, 1, 1, 1, 1,
0.5027533, -1.069498, 2.63513, 1, 1, 1, 1, 1,
0.5068325, 1.037778, 1.51544, 1, 1, 1, 1, 1,
0.5148649, -1.881332, 3.840878, 0, 0, 1, 1, 1,
0.5185843, 0.4297217, 0.8492305, 1, 0, 0, 1, 1,
0.5217184, 0.04563649, 1.383591, 1, 0, 0, 1, 1,
0.522888, 0.842405, -0.3224116, 1, 0, 0, 1, 1,
0.5230107, 0.8169828, -1.000105, 1, 0, 0, 1, 1,
0.52515, 0.2266271, 1.004426, 1, 0, 0, 1, 1,
0.5264775, 1.451805, 0.7293699, 0, 0, 0, 1, 1,
0.5286219, 1.628973, 0.5927089, 0, 0, 0, 1, 1,
0.5295293, 0.6553472, 1.87255, 0, 0, 0, 1, 1,
0.5375123, -0.07591124, 2.910096, 0, 0, 0, 1, 1,
0.5392956, -0.6858785, 0.9484782, 0, 0, 0, 1, 1,
0.5498983, 0.4316303, 1.370745, 0, 0, 0, 1, 1,
0.5558507, 1.30169, -0.7224488, 0, 0, 0, 1, 1,
0.5633609, 2.355735, 0.7797238, 1, 1, 1, 1, 1,
0.5680691, 0.9267771, 0.6142611, 1, 1, 1, 1, 1,
0.5705711, 0.3214194, 1.90827, 1, 1, 1, 1, 1,
0.5712973, -1.271665, 2.394964, 1, 1, 1, 1, 1,
0.5732232, 1.397755, 0.4372872, 1, 1, 1, 1, 1,
0.5795007, -0.03980896, 2.265126, 1, 1, 1, 1, 1,
0.58162, 0.3325068, 0.06413953, 1, 1, 1, 1, 1,
0.5892538, -0.99806, 1.996649, 1, 1, 1, 1, 1,
0.5895473, -0.429917, 3.865411, 1, 1, 1, 1, 1,
0.5987011, -1.182055, 4.327862, 1, 1, 1, 1, 1,
0.6063334, -0.6621091, 2.059817, 1, 1, 1, 1, 1,
0.608736, -1.262564, 3.426864, 1, 1, 1, 1, 1,
0.6088974, -0.6412556, 0.9344103, 1, 1, 1, 1, 1,
0.6113302, 1.091584, -0.4192063, 1, 1, 1, 1, 1,
0.613573, -1.332047, 4.618716, 1, 1, 1, 1, 1,
0.6166784, -0.5711535, 2.488446, 0, 0, 1, 1, 1,
0.617248, 0.7375874, 0.1129801, 1, 0, 0, 1, 1,
0.6241708, -0.3577498, 1.926657, 1, 0, 0, 1, 1,
0.6252711, -0.5884271, 1.781418, 1, 0, 0, 1, 1,
0.6270873, -0.8976506, 1.71202, 1, 0, 0, 1, 1,
0.6408, 2.379218, 1.324149, 1, 0, 0, 1, 1,
0.6457747, -0.02379057, 0.6842775, 0, 0, 0, 1, 1,
0.6497136, -2.292207, 4.448807, 0, 0, 0, 1, 1,
0.6500703, -2.071076, 1.982688, 0, 0, 0, 1, 1,
0.6523003, -0.05863515, 2.715117, 0, 0, 0, 1, 1,
0.657151, 1.231797, 2.597369, 0, 0, 0, 1, 1,
0.6641995, 0.4962867, 0.6013527, 0, 0, 0, 1, 1,
0.6652191, -0.9457067, 4.237569, 0, 0, 0, 1, 1,
0.6664639, -0.1193877, 2.044696, 1, 1, 1, 1, 1,
0.6666114, -0.1342338, 2.227858, 1, 1, 1, 1, 1,
0.6826342, -0.6747975, 3.077729, 1, 1, 1, 1, 1,
0.6841628, 1.321525, 1.103495, 1, 1, 1, 1, 1,
0.6850789, -1.023761, 2.279557, 1, 1, 1, 1, 1,
0.6857378, 0.2460294, -0.4876384, 1, 1, 1, 1, 1,
0.6877549, -1.622283, 3.044206, 1, 1, 1, 1, 1,
0.6889248, 0.3038779, 2.435591, 1, 1, 1, 1, 1,
0.6903789, 0.2794333, -1.1697, 1, 1, 1, 1, 1,
0.6951754, 0.5066161, 0.3504936, 1, 1, 1, 1, 1,
0.7028996, 0.6286334, 2.798065, 1, 1, 1, 1, 1,
0.7081327, -1.13165, 2.343538, 1, 1, 1, 1, 1,
0.7087272, 0.1918301, 0.6374186, 1, 1, 1, 1, 1,
0.7095013, 0.4044059, 0.1611982, 1, 1, 1, 1, 1,
0.7119262, 0.1647377, 0.03148046, 1, 1, 1, 1, 1,
0.719117, -1.280789, 3.187159, 0, 0, 1, 1, 1,
0.7229945, -0.1755441, 2.155837, 1, 0, 0, 1, 1,
0.7231237, 0.5952185, -0.1769444, 1, 0, 0, 1, 1,
0.7252227, 0.146531, 1.720834, 1, 0, 0, 1, 1,
0.7288016, 0.05949873, 2.966779, 1, 0, 0, 1, 1,
0.7295544, 0.5582524, -0.2385186, 1, 0, 0, 1, 1,
0.7299071, -0.3954559, 1.714629, 0, 0, 0, 1, 1,
0.730324, 0.1145741, 2.545386, 0, 0, 0, 1, 1,
0.7315426, -0.9379304, 1.849572, 0, 0, 0, 1, 1,
0.7351944, -1.139468, 0.3147511, 0, 0, 0, 1, 1,
0.7355589, 1.729488, 0.6952508, 0, 0, 0, 1, 1,
0.7377272, -0.08051149, 0.2629631, 0, 0, 0, 1, 1,
0.7406766, 1.09818, -0.03917469, 0, 0, 0, 1, 1,
0.7429025, -1.400812, 2.318871, 1, 1, 1, 1, 1,
0.7483968, -0.09064627, 0.07846732, 1, 1, 1, 1, 1,
0.7487479, 0.5448654, 3.372065, 1, 1, 1, 1, 1,
0.7511404, -1.068189, 2.843481, 1, 1, 1, 1, 1,
0.7536914, -1.544994, 3.031431, 1, 1, 1, 1, 1,
0.7646675, 0.523436, 0.6329941, 1, 1, 1, 1, 1,
0.7656228, -2.112089, 1.532983, 1, 1, 1, 1, 1,
0.7709807, 0.2952823, 0.8228711, 1, 1, 1, 1, 1,
0.773514, 0.1399222, 0.9639505, 1, 1, 1, 1, 1,
0.7769148, 0.4959751, 1.258274, 1, 1, 1, 1, 1,
0.7918625, -0.5347179, 4.461445, 1, 1, 1, 1, 1,
0.8041793, 0.01342525, 2.358459, 1, 1, 1, 1, 1,
0.8056269, 0.09876033, 2.947128, 1, 1, 1, 1, 1,
0.8089344, -1.86417, 2.031335, 1, 1, 1, 1, 1,
0.8224653, -2.148758, 2.060229, 1, 1, 1, 1, 1,
0.8401312, 0.06650988, 0.1463666, 0, 0, 1, 1, 1,
0.8451305, 0.2739558, 1.829582, 1, 0, 0, 1, 1,
0.8535848, -0.8238004, 5.598684, 1, 0, 0, 1, 1,
0.8563325, -0.5041087, 0.8346791, 1, 0, 0, 1, 1,
0.8597966, 0.07696515, 1.934703, 1, 0, 0, 1, 1,
0.8632794, -0.5812895, 1.881187, 1, 0, 0, 1, 1,
0.8650594, -0.2706036, 2.098212, 0, 0, 0, 1, 1,
0.8703728, -1.632098, 1.278618, 0, 0, 0, 1, 1,
0.8759627, 0.1450403, -1.24599, 0, 0, 0, 1, 1,
0.8774656, -0.4214852, 1.654851, 0, 0, 0, 1, 1,
0.8791375, 0.3701035, -0.3204618, 0, 0, 0, 1, 1,
0.8868797, 0.7373073, 1.121178, 0, 0, 0, 1, 1,
0.8886668, 0.5534955, 2.848513, 0, 0, 0, 1, 1,
0.9016929, 1.354456, 2.058268, 1, 1, 1, 1, 1,
0.9022425, 0.5061199, 1.243371, 1, 1, 1, 1, 1,
0.9030377, 0.1571922, 1.040638, 1, 1, 1, 1, 1,
0.9067868, -0.869491, 2.023821, 1, 1, 1, 1, 1,
0.9081533, 0.4894342, 1.156289, 1, 1, 1, 1, 1,
0.9088724, -1.094846, 2.433614, 1, 1, 1, 1, 1,
0.9163069, 1.349222, 1.442522, 1, 1, 1, 1, 1,
0.9242562, 0.3922874, 1.055664, 1, 1, 1, 1, 1,
0.9250237, -0.2001495, 1.130619, 1, 1, 1, 1, 1,
0.9263136, -0.3360099, 1.298341, 1, 1, 1, 1, 1,
0.9279136, -2.031974, 3.770428, 1, 1, 1, 1, 1,
0.9291331, -1.639546, 2.088225, 1, 1, 1, 1, 1,
0.9389367, 0.2966795, 0.4822488, 1, 1, 1, 1, 1,
0.9439522, -0.1521098, 1.089657, 1, 1, 1, 1, 1,
0.9475307, 0.9220545, 0.4270615, 1, 1, 1, 1, 1,
0.9557271, -1.873056, 3.041912, 0, 0, 1, 1, 1,
0.9567754, -1.042788, 1.480654, 1, 0, 0, 1, 1,
0.9573505, -1.337206, 2.050256, 1, 0, 0, 1, 1,
0.9606519, -0.6770877, 3.228179, 1, 0, 0, 1, 1,
0.9613964, -1.677429, 1.78915, 1, 0, 0, 1, 1,
0.9614334, -1.752482, 1.914768, 1, 0, 0, 1, 1,
0.9618151, -0.03218409, 1.495314, 0, 0, 0, 1, 1,
0.9649562, -0.5160056, 4.017759, 0, 0, 0, 1, 1,
0.9681599, 0.564502, 3.787562, 0, 0, 0, 1, 1,
0.9695347, 0.5212225, 1.176999, 0, 0, 0, 1, 1,
0.9703773, -1.224194, 1.889802, 0, 0, 0, 1, 1,
0.9769106, 1.960015, 0.3771473, 0, 0, 0, 1, 1,
0.9786488, -0.6166554, 1.531011, 0, 0, 0, 1, 1,
0.9870633, 2.423148, 0.7372215, 1, 1, 1, 1, 1,
0.9924078, -1.973654, 2.416443, 1, 1, 1, 1, 1,
0.9966481, -1.299093, 1.196892, 1, 1, 1, 1, 1,
0.99885, 0.5178633, 0.8932947, 1, 1, 1, 1, 1,
1.001588, -0.4278697, 2.111657, 1, 1, 1, 1, 1,
1.002938, 0.9445922, -0.9396462, 1, 1, 1, 1, 1,
1.006443, 0.2709751, 1.954346, 1, 1, 1, 1, 1,
1.008422, 0.3994003, 0.6809137, 1, 1, 1, 1, 1,
1.011092, -1.00202, 2.330814, 1, 1, 1, 1, 1,
1.011404, 1.203349, 1.666752, 1, 1, 1, 1, 1,
1.021886, -0.3798115, 0.8647146, 1, 1, 1, 1, 1,
1.025693, 0.3294029, 2.042016, 1, 1, 1, 1, 1,
1.033447, -1.156021, 1.31305, 1, 1, 1, 1, 1,
1.035731, 1.551188, 1.309221, 1, 1, 1, 1, 1,
1.042092, 1.247656, -0.8030136, 1, 1, 1, 1, 1,
1.043627, -1.082355, 5.066177, 0, 0, 1, 1, 1,
1.045658, 0.772252, 1.842374, 1, 0, 0, 1, 1,
1.049107, 0.5576243, 2.065934, 1, 0, 0, 1, 1,
1.050763, 1.395338, 2.760326, 1, 0, 0, 1, 1,
1.053595, -0.6458226, 2.023228, 1, 0, 0, 1, 1,
1.056373, 2.600576, 0.323083, 1, 0, 0, 1, 1,
1.056509, 1.749838, -0.4743664, 0, 0, 0, 1, 1,
1.057387, -1.303902, 2.166145, 0, 0, 0, 1, 1,
1.063974, -0.3654827, 2.308176, 0, 0, 0, 1, 1,
1.065543, 0.759901, -0.03986516, 0, 0, 0, 1, 1,
1.067899, 0.1869404, 0.8753268, 0, 0, 0, 1, 1,
1.074476, 0.0474996, 0.8364838, 0, 0, 0, 1, 1,
1.075499, -0.5329631, 1.709311, 0, 0, 0, 1, 1,
1.100032, -0.09234096, 0.8894875, 1, 1, 1, 1, 1,
1.100226, 0.8920999, 0.6571827, 1, 1, 1, 1, 1,
1.113484, -1.005879, 2.441878, 1, 1, 1, 1, 1,
1.117206, 0.8903531, 0.4260826, 1, 1, 1, 1, 1,
1.119965, -0.216112, 2.152875, 1, 1, 1, 1, 1,
1.124123, 0.1213168, 1.619231, 1, 1, 1, 1, 1,
1.124292, -0.2596805, 1.375408, 1, 1, 1, 1, 1,
1.129899, -0.8452933, 1.419366, 1, 1, 1, 1, 1,
1.129907, -0.4228058, 0.77448, 1, 1, 1, 1, 1,
1.130251, -0.09534954, 3.124446, 1, 1, 1, 1, 1,
1.150914, -0.6436293, 2.357359, 1, 1, 1, 1, 1,
1.15436, -1.526014, 3.184394, 1, 1, 1, 1, 1,
1.160933, -1.099893, 0.9865347, 1, 1, 1, 1, 1,
1.16521, -1.697, 3.46666, 1, 1, 1, 1, 1,
1.171409, 0.2863837, 1.118049, 1, 1, 1, 1, 1,
1.177884, -0.583116, 1.300573, 0, 0, 1, 1, 1,
1.202931, -0.1342427, 1.161648, 1, 0, 0, 1, 1,
1.20558, 0.713233, 1.406709, 1, 0, 0, 1, 1,
1.226209, 1.720297, -0.09709761, 1, 0, 0, 1, 1,
1.229655, 0.1485271, 1.88769, 1, 0, 0, 1, 1,
1.229868, -1.166731, 2.364946, 1, 0, 0, 1, 1,
1.231342, -1.669719, 2.83375, 0, 0, 0, 1, 1,
1.234622, 0.1028812, 1.730684, 0, 0, 0, 1, 1,
1.234955, 1.204095, 0.1718443, 0, 0, 0, 1, 1,
1.24084, 0.6459135, -0.6255646, 0, 0, 0, 1, 1,
1.249546, -1.616648, 2.864497, 0, 0, 0, 1, 1,
1.259885, -0.1698747, 2.129006, 0, 0, 0, 1, 1,
1.260165, 0.09208053, 2.270107, 0, 0, 0, 1, 1,
1.265509, -0.01348282, 3.389152, 1, 1, 1, 1, 1,
1.278095, 0.6195133, 2.250846, 1, 1, 1, 1, 1,
1.292284, -0.9641404, 3.416594, 1, 1, 1, 1, 1,
1.295808, 1.172511, -0.5318792, 1, 1, 1, 1, 1,
1.29636, 0.5258503, 1.449558, 1, 1, 1, 1, 1,
1.296969, 1.274142, 1.991056, 1, 1, 1, 1, 1,
1.317983, 0.4712061, 1.157584, 1, 1, 1, 1, 1,
1.33159, -1.115685, 3.411046, 1, 1, 1, 1, 1,
1.331757, 0.911041, 0.6887287, 1, 1, 1, 1, 1,
1.347421, -0.2635497, 2.642574, 1, 1, 1, 1, 1,
1.348507, 1.113503, 1.257255, 1, 1, 1, 1, 1,
1.350634, 0.355608, 1.454063, 1, 1, 1, 1, 1,
1.367058, -0.7352272, 2.792602, 1, 1, 1, 1, 1,
1.367458, -0.3900178, 2.880912, 1, 1, 1, 1, 1,
1.368216, 0.6707006, 0.9860857, 1, 1, 1, 1, 1,
1.369162, -1.748509, 2.175183, 0, 0, 1, 1, 1,
1.371488, 0.5110809, 1.04226, 1, 0, 0, 1, 1,
1.386844, 1.492752, 0.1325169, 1, 0, 0, 1, 1,
1.396259, -1.374965, 0.9112573, 1, 0, 0, 1, 1,
1.40824, 0.5717326, 1.953051, 1, 0, 0, 1, 1,
1.413606, -1.095632, 3.208526, 1, 0, 0, 1, 1,
1.416891, 0.831944, -0.2783999, 0, 0, 0, 1, 1,
1.420007, 0.09284303, 2.025414, 0, 0, 0, 1, 1,
1.424518, -1.326622, 3.304609, 0, 0, 0, 1, 1,
1.430305, 0.4829199, 0.1213724, 0, 0, 0, 1, 1,
1.455001, 2.771801, 1.163466, 0, 0, 0, 1, 1,
1.455459, 0.02317526, 0.3808064, 0, 0, 0, 1, 1,
1.469602, -0.2965946, 1.694901, 0, 0, 0, 1, 1,
1.473149, -0.03863591, 2.202204, 1, 1, 1, 1, 1,
1.482488, 0.9570808, 1.479052, 1, 1, 1, 1, 1,
1.482544, 0.9318593, -0.05293841, 1, 1, 1, 1, 1,
1.483997, -0.001248146, 1.498446, 1, 1, 1, 1, 1,
1.492031, 0.2721735, -0.06541755, 1, 1, 1, 1, 1,
1.49207, -0.042738, 3.001068, 1, 1, 1, 1, 1,
1.496192, -1.261914, 2.864662, 1, 1, 1, 1, 1,
1.502512, -1.214581, 1.073754, 1, 1, 1, 1, 1,
1.521629, 0.9230021, 1.643481, 1, 1, 1, 1, 1,
1.540592, -0.2369795, 1.193709, 1, 1, 1, 1, 1,
1.548283, -0.003445819, 1.683408, 1, 1, 1, 1, 1,
1.557894, 2.059807, -0.3027278, 1, 1, 1, 1, 1,
1.559096, 1.138222, -0.3442002, 1, 1, 1, 1, 1,
1.559358, -1.236434, 1.865346, 1, 1, 1, 1, 1,
1.560059, -0.6910725, 3.766338, 1, 1, 1, 1, 1,
1.578132, 0.3403916, 2.01166, 0, 0, 1, 1, 1,
1.585971, -1.614881, 2.289154, 1, 0, 0, 1, 1,
1.592408, -0.7059823, 4.618365, 1, 0, 0, 1, 1,
1.595765, 0.8008935, 0.8846793, 1, 0, 0, 1, 1,
1.601137, -1.603789, 1.15976, 1, 0, 0, 1, 1,
1.602248, 0.1647311, 0.5750915, 1, 0, 0, 1, 1,
1.626268, 0.08632914, 0.6475003, 0, 0, 0, 1, 1,
1.64401, -0.9482707, 2.234211, 0, 0, 0, 1, 1,
1.681073, 0.5770141, 1.974728, 0, 0, 0, 1, 1,
1.684326, -0.5527434, 3.087935, 0, 0, 0, 1, 1,
1.694991, -0.08258025, 2.764275, 0, 0, 0, 1, 1,
1.699789, 1.178916, 0.1140405, 0, 0, 0, 1, 1,
1.705919, -0.7123415, 1.630734, 0, 0, 0, 1, 1,
1.714201, -0.437712, 2.960352, 1, 1, 1, 1, 1,
1.722454, 0.5524752, 1.421522, 1, 1, 1, 1, 1,
1.745688, 1.066458, 0.08460043, 1, 1, 1, 1, 1,
1.74571, -0.05479048, 3.434947, 1, 1, 1, 1, 1,
1.757907, 0.2207992, 2.046241, 1, 1, 1, 1, 1,
1.777479, 1.512932, 1.434418, 1, 1, 1, 1, 1,
1.794795, -1.078267, 2.603421, 1, 1, 1, 1, 1,
1.812781, -1.289968, 2.414229, 1, 1, 1, 1, 1,
1.815568, 0.8894934, 1.181497, 1, 1, 1, 1, 1,
1.820008, -1.574223, 2.54668, 1, 1, 1, 1, 1,
1.824231, -0.4381607, 1.781067, 1, 1, 1, 1, 1,
1.843819, -0.5432709, 2.845989, 1, 1, 1, 1, 1,
1.85176, 0.8593653, 2.042468, 1, 1, 1, 1, 1,
1.867689, 0.2096845, 2.458891, 1, 1, 1, 1, 1,
1.869292, 0.3892014, 2.095124, 1, 1, 1, 1, 1,
1.869791, -0.497683, 0.6334068, 0, 0, 1, 1, 1,
1.872583, -1.995749, 2.882645, 1, 0, 0, 1, 1,
1.894144, 0.3418227, 2.174646, 1, 0, 0, 1, 1,
1.9267, 0.1807747, 1.066123, 1, 0, 0, 1, 1,
1.935888, -1.362329, 3.171354, 1, 0, 0, 1, 1,
1.980567, 0.8769565, 0.9685175, 1, 0, 0, 1, 1,
1.986387, 0.6547244, 1.71598, 0, 0, 0, 1, 1,
2.052428, 0.6582832, 1.493769, 0, 0, 0, 1, 1,
2.069809, -0.4360606, 1.503702, 0, 0, 0, 1, 1,
2.146146, -0.6311241, 2.505682, 0, 0, 0, 1, 1,
2.205516, 0.6934448, 1.697597, 0, 0, 0, 1, 1,
2.243752, -0.8798025, 1.156258, 0, 0, 0, 1, 1,
2.254017, 1.458008, 2.96135, 0, 0, 0, 1, 1,
2.326458, -1.403078, 2.344199, 1, 1, 1, 1, 1,
2.37221, -0.2265791, 1.582274, 1, 1, 1, 1, 1,
2.410852, 0.03723549, 1.348006, 1, 1, 1, 1, 1,
2.522042, -0.8669842, 2.085234, 1, 1, 1, 1, 1,
2.741405, -0.02745858, 2.294401, 1, 1, 1, 1, 1,
2.851928, -0.6854458, 2.956717, 1, 1, 1, 1, 1,
3.303178, -1.179574, 0.4115328, 1, 1, 1, 1, 1
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
var radius = 9.856464;
var distance = 34.62041;
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
mvMatrix.translate( -0.004863739, 0.3864491, -0.2166636 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.62041);
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
