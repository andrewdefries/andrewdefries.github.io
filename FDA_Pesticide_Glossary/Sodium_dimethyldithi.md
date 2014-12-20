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
-3.623785, -0.9111381, -2.405124, 1, 0, 0, 1,
-3.002471, -0.94556, -2.291153, 1, 0.007843138, 0, 1,
-2.962904, 0.9162303, -1.070337, 1, 0.01176471, 0, 1,
-2.776476, -0.1415824, -0.7192304, 1, 0.01960784, 0, 1,
-2.592611, -1.787867, -1.479582, 1, 0.02352941, 0, 1,
-2.43347, -0.2136095, -1.300356, 1, 0.03137255, 0, 1,
-2.433391, -0.1719327, -0.7529297, 1, 0.03529412, 0, 1,
-2.370596, 0.1206449, -1.558586, 1, 0.04313726, 0, 1,
-2.360826, 0.3158827, -1.917544, 1, 0.04705882, 0, 1,
-2.33579, 1.579293, -2.080282, 1, 0.05490196, 0, 1,
-2.322359, -0.6436885, -1.212673, 1, 0.05882353, 0, 1,
-2.271764, -0.5779115, -1.649016, 1, 0.06666667, 0, 1,
-2.148021, -0.410695, -0.8175419, 1, 0.07058824, 0, 1,
-2.129746, -1.322763, -2.231955, 1, 0.07843138, 0, 1,
-2.09048, -0.835254, -1.76166, 1, 0.08235294, 0, 1,
-2.087502, -0.8180742, -2.183794, 1, 0.09019608, 0, 1,
-2.011472, -0.4096552, -2.20092, 1, 0.09411765, 0, 1,
-1.999533, -1.267607, -2.873118, 1, 0.1019608, 0, 1,
-1.988317, 1.869821, -1.276076, 1, 0.1098039, 0, 1,
-1.983773, 0.3260199, -0.4758916, 1, 0.1137255, 0, 1,
-1.940364, -0.5004748, 0.6125829, 1, 0.1215686, 0, 1,
-1.930577, -0.04474062, -1.648404, 1, 0.1254902, 0, 1,
-1.928816, -0.8290953, -2.737744, 1, 0.1333333, 0, 1,
-1.918982, -0.8605733, -2.81833, 1, 0.1372549, 0, 1,
-1.915464, -0.133087, -1.262214, 1, 0.145098, 0, 1,
-1.890316, 0.07669799, -3.012407, 1, 0.1490196, 0, 1,
-1.883331, 0.03874586, -2.217078, 1, 0.1568628, 0, 1,
-1.863857, -0.6743212, -1.987811, 1, 0.1607843, 0, 1,
-1.815099, 0.2293081, -1.441876, 1, 0.1686275, 0, 1,
-1.805105, 0.2126318, -1.262563, 1, 0.172549, 0, 1,
-1.793467, -1.159829, -1.33543, 1, 0.1803922, 0, 1,
-1.78661, 0.8315219, -0.7422071, 1, 0.1843137, 0, 1,
-1.777229, -1.28111, -2.215245, 1, 0.1921569, 0, 1,
-1.77588, -0.8729239, -0.7532201, 1, 0.1960784, 0, 1,
-1.770032, 0.7091253, -1.751424, 1, 0.2039216, 0, 1,
-1.769992, 1.591945, 0.2967284, 1, 0.2117647, 0, 1,
-1.764564, -0.05999486, 0.306929, 1, 0.2156863, 0, 1,
-1.760042, 0.7357056, -2.153616, 1, 0.2235294, 0, 1,
-1.739469, -1.273404, -3.507633, 1, 0.227451, 0, 1,
-1.726718, 0.4891829, -0.3242799, 1, 0.2352941, 0, 1,
-1.716081, -0.2130983, -2.980778, 1, 0.2392157, 0, 1,
-1.712004, 0.2337632, -1.561018, 1, 0.2470588, 0, 1,
-1.708278, 0.4563999, -1.35424, 1, 0.2509804, 0, 1,
-1.707241, -1.257352, -1.612655, 1, 0.2588235, 0, 1,
-1.691416, -0.9110228, -2.534895, 1, 0.2627451, 0, 1,
-1.671491, -0.3312176, -3.150488, 1, 0.2705882, 0, 1,
-1.661078, 1.019776, -1.623728, 1, 0.2745098, 0, 1,
-1.657977, -0.1771055, -1.953093, 1, 0.282353, 0, 1,
-1.642303, -0.1569124, -1.644674, 1, 0.2862745, 0, 1,
-1.639623, 0.2281711, -2.679316, 1, 0.2941177, 0, 1,
-1.603106, 0.2678529, -2.256943, 1, 0.3019608, 0, 1,
-1.595912, 0.7230335, -2.210084, 1, 0.3058824, 0, 1,
-1.594957, -1.930124, -1.02622, 1, 0.3137255, 0, 1,
-1.589079, 0.3639928, -2.632811, 1, 0.3176471, 0, 1,
-1.584546, 0.05004992, -1.055274, 1, 0.3254902, 0, 1,
-1.559806, 0.1022168, -1.046954, 1, 0.3294118, 0, 1,
-1.55858, -0.08737903, -1.799688, 1, 0.3372549, 0, 1,
-1.548102, -0.1384252, -2.056678, 1, 0.3411765, 0, 1,
-1.540829, -0.3973254, -1.406162, 1, 0.3490196, 0, 1,
-1.534101, 1.812149, -1.083816, 1, 0.3529412, 0, 1,
-1.533989, -0.5083188, -1.724634, 1, 0.3607843, 0, 1,
-1.507661, -0.08648735, 0.002077248, 1, 0.3647059, 0, 1,
-1.505566, -0.4550091, -1.310599, 1, 0.372549, 0, 1,
-1.502171, -0.2161669, -1.424219, 1, 0.3764706, 0, 1,
-1.49686, -0.9441146, -1.761289, 1, 0.3843137, 0, 1,
-1.483439, -0.01978603, -1.962232, 1, 0.3882353, 0, 1,
-1.481381, -0.5013033, -1.093278, 1, 0.3960784, 0, 1,
-1.470305, 1.208507, -0.3544769, 1, 0.4039216, 0, 1,
-1.468668, 0.3689163, -0.9148378, 1, 0.4078431, 0, 1,
-1.465097, 2.326807, 0.1379457, 1, 0.4156863, 0, 1,
-1.444085, -1.405885, -0.8311174, 1, 0.4196078, 0, 1,
-1.433449, -0.8889527, -3.93317, 1, 0.427451, 0, 1,
-1.388649, -0.1772009, -2.36009, 1, 0.4313726, 0, 1,
-1.367981, -0.5182541, -1.94972, 1, 0.4392157, 0, 1,
-1.347265, 0.9400735, -2.245676, 1, 0.4431373, 0, 1,
-1.345633, -1.293497, -1.817769, 1, 0.4509804, 0, 1,
-1.324541, 1.588069, -2.474417, 1, 0.454902, 0, 1,
-1.321112, -0.626209, -2.238885, 1, 0.4627451, 0, 1,
-1.314174, -2.727813, -1.531225, 1, 0.4666667, 0, 1,
-1.312393, 0.8717132, -2.28724, 1, 0.4745098, 0, 1,
-1.306015, -0.1750291, -2.6651, 1, 0.4784314, 0, 1,
-1.2933, 0.02689817, -0.03368588, 1, 0.4862745, 0, 1,
-1.288677, 1.428846, -1.431606, 1, 0.4901961, 0, 1,
-1.284196, 1.044002, -0.6617166, 1, 0.4980392, 0, 1,
-1.283035, -0.9935034, -3.165863, 1, 0.5058824, 0, 1,
-1.280946, 0.1352997, -2.48767, 1, 0.509804, 0, 1,
-1.279352, 0.4287407, -1.765661, 1, 0.5176471, 0, 1,
-1.269228, 0.6434989, -2.822983, 1, 0.5215687, 0, 1,
-1.255153, 0.6147307, -1.123939, 1, 0.5294118, 0, 1,
-1.254338, -2.20974, -3.916623, 1, 0.5333334, 0, 1,
-1.250586, -0.0870377, -0.8804796, 1, 0.5411765, 0, 1,
-1.24968, -0.3823205, -0.6943038, 1, 0.5450981, 0, 1,
-1.247502, 0.2924573, -0.3969608, 1, 0.5529412, 0, 1,
-1.236336, -0.2080282, -2.924735, 1, 0.5568628, 0, 1,
-1.23518, 0.7339288, -1.285401, 1, 0.5647059, 0, 1,
-1.231242, 1.586748, -0.3368203, 1, 0.5686275, 0, 1,
-1.231093, 0.6470388, -1.112654, 1, 0.5764706, 0, 1,
-1.230057, -1.241307, -2.797653, 1, 0.5803922, 0, 1,
-1.226602, -1.679014, -2.147861, 1, 0.5882353, 0, 1,
-1.226474, -0.8853257, -2.109343, 1, 0.5921569, 0, 1,
-1.224396, -1.819498, -3.009039, 1, 0.6, 0, 1,
-1.223655, 0.0003933809, -1.23353, 1, 0.6078432, 0, 1,
-1.221407, 0.52152, -2.509643, 1, 0.6117647, 0, 1,
-1.216768, 0.3507739, -0.3587036, 1, 0.6196079, 0, 1,
-1.212831, 0.523958, -1.215538, 1, 0.6235294, 0, 1,
-1.211409, 0.1479838, -2.108446, 1, 0.6313726, 0, 1,
-1.206758, 0.2504784, -3.241104, 1, 0.6352941, 0, 1,
-1.202453, 0.4521343, -0.7158594, 1, 0.6431373, 0, 1,
-1.202389, -1.321911, -1.319612, 1, 0.6470588, 0, 1,
-1.198104, 0.5175356, 0.6871185, 1, 0.654902, 0, 1,
-1.191619, -0.6426429, -1.882752, 1, 0.6588235, 0, 1,
-1.184218, -0.392776, -2.496285, 1, 0.6666667, 0, 1,
-1.166104, -0.4337357, -3.494728, 1, 0.6705883, 0, 1,
-1.16357, -0.6924424, -1.067711, 1, 0.6784314, 0, 1,
-1.161977, -0.893647, -4.00513, 1, 0.682353, 0, 1,
-1.158587, -0.0815361, -0.4339188, 1, 0.6901961, 0, 1,
-1.153936, -0.5724803, -0.652325, 1, 0.6941177, 0, 1,
-1.153703, -1.346789, -1.268291, 1, 0.7019608, 0, 1,
-1.14177, 1.739267, -2.247943, 1, 0.7098039, 0, 1,
-1.138903, 0.5525159, -2.209702, 1, 0.7137255, 0, 1,
-1.135896, 0.4681218, -0.6686522, 1, 0.7215686, 0, 1,
-1.132474, -1.217767, -2.00392, 1, 0.7254902, 0, 1,
-1.132396, -0.8722858, -3.566738, 1, 0.7333333, 0, 1,
-1.129166, -2.410571, -4.119862, 1, 0.7372549, 0, 1,
-1.127963, -0.4315009, -2.200743, 1, 0.7450981, 0, 1,
-1.117858, -0.8229611, -1.451407, 1, 0.7490196, 0, 1,
-1.117241, 0.7273734, -1.713521, 1, 0.7568628, 0, 1,
-1.113763, 2.020838, -1.352859, 1, 0.7607843, 0, 1,
-1.112195, 0.07738862, -0.6000398, 1, 0.7686275, 0, 1,
-1.109889, -0.4315233, -2.568303, 1, 0.772549, 0, 1,
-1.104439, -1.172828, -3.304399, 1, 0.7803922, 0, 1,
-1.09971, 0.4307393, -1.586917, 1, 0.7843137, 0, 1,
-1.099265, -1.167232, -1.425015, 1, 0.7921569, 0, 1,
-1.097376, -1.326666, -2.873818, 1, 0.7960784, 0, 1,
-1.091214, -1.852024, -2.136339, 1, 0.8039216, 0, 1,
-1.08604, -0.6251544, -4.691909, 1, 0.8117647, 0, 1,
-1.064817, 0.2935117, -1.164832, 1, 0.8156863, 0, 1,
-1.06417, -0.05515752, -2.602422, 1, 0.8235294, 0, 1,
-1.062443, -0.3371781, -2.370878, 1, 0.827451, 0, 1,
-1.058646, 1.032212, -0.9383729, 1, 0.8352941, 0, 1,
-1.052053, -0.576611, -1.981146, 1, 0.8392157, 0, 1,
-1.047523, 0.03506663, -1.662657, 1, 0.8470588, 0, 1,
-1.03337, -1.176627, -2.576788, 1, 0.8509804, 0, 1,
-1.022906, -0.3602787, -1.297518, 1, 0.8588235, 0, 1,
-1.021341, -0.9847157, -0.7337781, 1, 0.8627451, 0, 1,
-1.021161, -1.354364, -3.719277, 1, 0.8705882, 0, 1,
-1.019894, -0.8854413, -1.097817, 1, 0.8745098, 0, 1,
-1.015223, 1.358221, -1.85034, 1, 0.8823529, 0, 1,
-1.013019, -1.304276, -3.300819, 1, 0.8862745, 0, 1,
-1.004052, -0.0586523, -2.982069, 1, 0.8941177, 0, 1,
-0.9916732, 1.069457, -0.9440387, 1, 0.8980392, 0, 1,
-0.9874701, -1.133791, -1.823043, 1, 0.9058824, 0, 1,
-0.981377, -0.6086042, -3.892071, 1, 0.9137255, 0, 1,
-0.975671, 0.2243112, -2.993427, 1, 0.9176471, 0, 1,
-0.9725264, 0.8078196, -1.34237, 1, 0.9254902, 0, 1,
-0.9676869, -0.7846694, -3.849141, 1, 0.9294118, 0, 1,
-0.9655542, -1.840744, -0.8593006, 1, 0.9372549, 0, 1,
-0.952171, -1.121565, -3.563167, 1, 0.9411765, 0, 1,
-0.9495772, -0.6055548, -2.316492, 1, 0.9490196, 0, 1,
-0.9453005, 0.09224296, -1.678619, 1, 0.9529412, 0, 1,
-0.9436343, 1.318926, 0.3148151, 1, 0.9607843, 0, 1,
-0.9333304, 1.539996, 0.2078639, 1, 0.9647059, 0, 1,
-0.9312959, -0.04993873, -0.9314788, 1, 0.972549, 0, 1,
-0.9298906, 0.4364431, -2.517626, 1, 0.9764706, 0, 1,
-0.9175553, 0.3660488, -1.120424, 1, 0.9843137, 0, 1,
-0.912632, 0.07610002, -0.711388, 1, 0.9882353, 0, 1,
-0.9110261, -0.6879511, -2.696922, 1, 0.9960784, 0, 1,
-0.9106617, 0.6757953, 0.03349299, 0.9960784, 1, 0, 1,
-0.9096524, -1.23443, -3.33027, 0.9921569, 1, 0, 1,
-0.9061792, 0.3228763, -0.4256541, 0.9843137, 1, 0, 1,
-0.9032385, 0.232815, -0.5448012, 0.9803922, 1, 0, 1,
-0.9003393, 0.7311945, -0.6639957, 0.972549, 1, 0, 1,
-0.9001105, 0.2150395, -1.019576, 0.9686275, 1, 0, 1,
-0.8997062, 1.062904, -0.467996, 0.9607843, 1, 0, 1,
-0.8990388, 1.096078, 1.196064, 0.9568627, 1, 0, 1,
-0.8969659, -0.152744, -2.75947, 0.9490196, 1, 0, 1,
-0.8912949, -0.1744463, -2.358973, 0.945098, 1, 0, 1,
-0.8906731, -2.176522, -1.270982, 0.9372549, 1, 0, 1,
-0.8857162, -0.916295, -3.773149, 0.9333333, 1, 0, 1,
-0.8792208, -0.129878, 0.1067856, 0.9254902, 1, 0, 1,
-0.8787385, 0.6643787, 0.2671382, 0.9215686, 1, 0, 1,
-0.8754957, -0.6268101, -3.276201, 0.9137255, 1, 0, 1,
-0.8712801, -0.01140114, 0.3309705, 0.9098039, 1, 0, 1,
-0.8704556, 1.195907, -0.9703039, 0.9019608, 1, 0, 1,
-0.8636954, -0.7403411, -1.57633, 0.8941177, 1, 0, 1,
-0.8610726, 0.5482248, -1.471342, 0.8901961, 1, 0, 1,
-0.8599702, 0.3512892, -1.588215, 0.8823529, 1, 0, 1,
-0.8580498, 0.5188025, -1.745875, 0.8784314, 1, 0, 1,
-0.8541556, 0.8625489, -0.3118399, 0.8705882, 1, 0, 1,
-0.8537889, -1.775025, -0.08062961, 0.8666667, 1, 0, 1,
-0.8519109, 0.572522, -2.013768, 0.8588235, 1, 0, 1,
-0.8506643, -0.2905841, -2.502234, 0.854902, 1, 0, 1,
-0.8420779, 0.8031519, 0.2923982, 0.8470588, 1, 0, 1,
-0.8397011, -0.3624057, -2.930419, 0.8431373, 1, 0, 1,
-0.835647, -1.009359, -4.127082, 0.8352941, 1, 0, 1,
-0.8354185, -0.3432537, -0.9300388, 0.8313726, 1, 0, 1,
-0.8336309, -0.7723595, -3.81338, 0.8235294, 1, 0, 1,
-0.8264928, 0.759604, 1.071966, 0.8196079, 1, 0, 1,
-0.8246113, 1.62651, -0.2913465, 0.8117647, 1, 0, 1,
-0.8245893, 1.446251, -0.5220846, 0.8078431, 1, 0, 1,
-0.8238394, -0.2988375, -1.734385, 0.8, 1, 0, 1,
-0.823375, -1.285067, -3.389317, 0.7921569, 1, 0, 1,
-0.8186728, -1.416684, -2.531907, 0.7882353, 1, 0, 1,
-0.8173535, 1.370316, 1.136288, 0.7803922, 1, 0, 1,
-0.8169083, 1.112453, -1.218289, 0.7764706, 1, 0, 1,
-0.8155149, -0.5737964, -1.608424, 0.7686275, 1, 0, 1,
-0.8115591, 0.5709834, -2.089428, 0.7647059, 1, 0, 1,
-0.8052088, -0.05966595, -3.055013, 0.7568628, 1, 0, 1,
-0.8031175, 1.370075, -0.8673925, 0.7529412, 1, 0, 1,
-0.7999031, -1.449176, -1.651018, 0.7450981, 1, 0, 1,
-0.7986227, 0.936537, -2.163378, 0.7411765, 1, 0, 1,
-0.7985904, -0.7693864, -1.873546, 0.7333333, 1, 0, 1,
-0.7912759, 1.086843, 0.1946685, 0.7294118, 1, 0, 1,
-0.7859007, -2.798995, -3.11146, 0.7215686, 1, 0, 1,
-0.7824743, 0.7146446, -0.5986293, 0.7176471, 1, 0, 1,
-0.7778674, -0.1116048, -0.3528558, 0.7098039, 1, 0, 1,
-0.7732616, 0.8452363, -0.3919557, 0.7058824, 1, 0, 1,
-0.7704471, 0.1137263, -2.162648, 0.6980392, 1, 0, 1,
-0.7703362, -0.831059, -2.87137, 0.6901961, 1, 0, 1,
-0.7664893, -0.021727, -0.7671875, 0.6862745, 1, 0, 1,
-0.763599, 1.551012, -0.2474883, 0.6784314, 1, 0, 1,
-0.7624936, -0.5130789, 0.3734248, 0.6745098, 1, 0, 1,
-0.7571601, -1.167202, -2.524625, 0.6666667, 1, 0, 1,
-0.7560092, -0.7341903, -3.026307, 0.6627451, 1, 0, 1,
-0.7497283, 0.4246884, -0.5488777, 0.654902, 1, 0, 1,
-0.7480594, 0.4369149, 0.6331183, 0.6509804, 1, 0, 1,
-0.7468452, -0.6482797, -1.08903, 0.6431373, 1, 0, 1,
-0.7465525, 1.014581, 0.6779237, 0.6392157, 1, 0, 1,
-0.7453541, 0.1151977, -1.438149, 0.6313726, 1, 0, 1,
-0.7450022, -0.7187315, -2.468822, 0.627451, 1, 0, 1,
-0.7431267, -1.465871, -2.698468, 0.6196079, 1, 0, 1,
-0.7422336, -0.7406495, -1.758674, 0.6156863, 1, 0, 1,
-0.7394926, -1.012727, -3.046438, 0.6078432, 1, 0, 1,
-0.7384068, -2.397933, -3.451906, 0.6039216, 1, 0, 1,
-0.7266637, 0.3438338, -2.11617, 0.5960785, 1, 0, 1,
-0.7232874, -1.782919, -0.9645056, 0.5882353, 1, 0, 1,
-0.7136864, -1.396339, -3.39339, 0.5843138, 1, 0, 1,
-0.7123337, -0.893007, -2.214972, 0.5764706, 1, 0, 1,
-0.7056892, -0.0969111, -2.411845, 0.572549, 1, 0, 1,
-0.705394, 0.02145625, -1.147014, 0.5647059, 1, 0, 1,
-0.704451, 0.1619401, -0.4064852, 0.5607843, 1, 0, 1,
-0.7033362, -0.02520965, -1.34674, 0.5529412, 1, 0, 1,
-0.702284, -0.3093666, -0.532559, 0.5490196, 1, 0, 1,
-0.6893633, -1.603983, -1.846107, 0.5411765, 1, 0, 1,
-0.6832188, -0.06479113, -2.320479, 0.5372549, 1, 0, 1,
-0.6828009, 0.405082, -0.6089249, 0.5294118, 1, 0, 1,
-0.6752375, 0.221351, -2.91644, 0.5254902, 1, 0, 1,
-0.6696392, 0.1902462, -0.3575606, 0.5176471, 1, 0, 1,
-0.6685911, -0.403689, -2.425723, 0.5137255, 1, 0, 1,
-0.6674767, 0.3675534, -1.519498, 0.5058824, 1, 0, 1,
-0.6629979, 1.023141, -2.730263, 0.5019608, 1, 0, 1,
-0.6609983, 0.4508177, -1.828383, 0.4941176, 1, 0, 1,
-0.6594861, -0.367386, -2.090675, 0.4862745, 1, 0, 1,
-0.6526025, 0.973631, 1.465443, 0.4823529, 1, 0, 1,
-0.6494106, 0.9934054, 1.069954, 0.4745098, 1, 0, 1,
-0.6464138, -0.8141275, -1.679448, 0.4705882, 1, 0, 1,
-0.6456164, -0.2940398, -0.6999207, 0.4627451, 1, 0, 1,
-0.6426305, 0.8328459, 0.6109614, 0.4588235, 1, 0, 1,
-0.6392073, -0.26138, -0.1708002, 0.4509804, 1, 0, 1,
-0.6307899, -0.7591835, -2.443257, 0.4470588, 1, 0, 1,
-0.6240194, -0.1142671, -1.942095, 0.4392157, 1, 0, 1,
-0.6235114, 0.9649898, 0.1105588, 0.4352941, 1, 0, 1,
-0.6176469, 0.7371574, -0.7895916, 0.427451, 1, 0, 1,
-0.6158016, -0.03665324, -2.317327, 0.4235294, 1, 0, 1,
-0.6153037, -0.5943339, -1.211161, 0.4156863, 1, 0, 1,
-0.6013641, -0.9925483, -0.5074524, 0.4117647, 1, 0, 1,
-0.5994557, 0.5631722, 1.69425, 0.4039216, 1, 0, 1,
-0.5976219, -1.223143, -2.054827, 0.3960784, 1, 0, 1,
-0.5885605, 0.1562253, -1.110788, 0.3921569, 1, 0, 1,
-0.5876541, -1.489644, -2.504873, 0.3843137, 1, 0, 1,
-0.5864815, -0.8894364, -3.198286, 0.3803922, 1, 0, 1,
-0.5845206, 1.034402, -0.9054543, 0.372549, 1, 0, 1,
-0.5778388, -0.4456847, -1.392812, 0.3686275, 1, 0, 1,
-0.5774288, -0.8645104, -2.865198, 0.3607843, 1, 0, 1,
-0.5707579, -0.2150124, -2.496903, 0.3568628, 1, 0, 1,
-0.5671229, 1.284965, -1.419783, 0.3490196, 1, 0, 1,
-0.5608851, -0.01317232, -1.729882, 0.345098, 1, 0, 1,
-0.560433, -0.04696641, -3.068443, 0.3372549, 1, 0, 1,
-0.5532026, -1.41669, -2.077083, 0.3333333, 1, 0, 1,
-0.5526729, 0.3499491, -0.7727919, 0.3254902, 1, 0, 1,
-0.5487479, 0.8005399, 0.8661331, 0.3215686, 1, 0, 1,
-0.5475808, 0.1893053, -2.80004, 0.3137255, 1, 0, 1,
-0.544138, 0.9486021, -1.557599, 0.3098039, 1, 0, 1,
-0.5413724, 0.2984667, 0.126293, 0.3019608, 1, 0, 1,
-0.5413011, -0.08035235, -1.702563, 0.2941177, 1, 0, 1,
-0.5370086, 0.2647927, -1.071824, 0.2901961, 1, 0, 1,
-0.5320432, 1.038285, -1.59155, 0.282353, 1, 0, 1,
-0.5314404, 0.1340498, -0.1100823, 0.2784314, 1, 0, 1,
-0.5314334, -2.938471, -4.34357, 0.2705882, 1, 0, 1,
-0.5267151, -0.7856911, -1.520744, 0.2666667, 1, 0, 1,
-0.5225558, -0.006874369, -0.0798454, 0.2588235, 1, 0, 1,
-0.5208095, 0.1164114, -1.107474, 0.254902, 1, 0, 1,
-0.5190232, 0.5609609, -0.5014636, 0.2470588, 1, 0, 1,
-0.5183049, 1.874321, -1.368885, 0.2431373, 1, 0, 1,
-0.5120367, 0.9941671, 0.7721967, 0.2352941, 1, 0, 1,
-0.5092923, 0.3529103, -0.9907761, 0.2313726, 1, 0, 1,
-0.5038421, -0.4090986, -2.632865, 0.2235294, 1, 0, 1,
-0.5014562, 0.2327672, -1.49239, 0.2196078, 1, 0, 1,
-0.4989279, 0.6337909, -1.604754, 0.2117647, 1, 0, 1,
-0.4979262, -0.2168337, -2.117938, 0.2078431, 1, 0, 1,
-0.4940527, 1.448717, 0.844313, 0.2, 1, 0, 1,
-0.4917111, -1.210312, -2.05656, 0.1921569, 1, 0, 1,
-0.4854735, -0.3194993, -2.642044, 0.1882353, 1, 0, 1,
-0.4809371, 2.348406, -0.2544007, 0.1803922, 1, 0, 1,
-0.478554, -0.8578022, -3.303137, 0.1764706, 1, 0, 1,
-0.4768365, -1.388216, -1.849577, 0.1686275, 1, 0, 1,
-0.4762366, -0.618305, -2.331291, 0.1647059, 1, 0, 1,
-0.4695673, 1.655905, 0.6113774, 0.1568628, 1, 0, 1,
-0.4695084, 0.6912158, 0.7886882, 0.1529412, 1, 0, 1,
-0.4693587, 1.657803, 0.9097895, 0.145098, 1, 0, 1,
-0.4685731, -0.6563143, -1.422889, 0.1411765, 1, 0, 1,
-0.4658465, 0.4466512, 0.7925012, 0.1333333, 1, 0, 1,
-0.4639233, 0.1411155, 0.1463185, 0.1294118, 1, 0, 1,
-0.4637605, 0.5371076, -1.766854, 0.1215686, 1, 0, 1,
-0.4556701, -0.4791442, -2.207974, 0.1176471, 1, 0, 1,
-0.455369, 0.1413432, -0.2992865, 0.1098039, 1, 0, 1,
-0.4548313, 1.344696, -1.260245, 0.1058824, 1, 0, 1,
-0.4531012, 0.3429276, -1.070316, 0.09803922, 1, 0, 1,
-0.4529067, -0.1500473, -2.534899, 0.09019608, 1, 0, 1,
-0.4515299, -1.194128, -2.478955, 0.08627451, 1, 0, 1,
-0.4504353, -0.4053549, -1.456382, 0.07843138, 1, 0, 1,
-0.4502099, 0.3028403, -1.830383, 0.07450981, 1, 0, 1,
-0.4498458, -0.8870449, -1.345488, 0.06666667, 1, 0, 1,
-0.4488302, 1.950927, -0.1075034, 0.0627451, 1, 0, 1,
-0.4452967, -2.029244, -3.325499, 0.05490196, 1, 0, 1,
-0.4411791, 1.508245, -0.04357383, 0.05098039, 1, 0, 1,
-0.4395683, 0.1323319, -1.628794, 0.04313726, 1, 0, 1,
-0.43881, 1.191, -1.237647, 0.03921569, 1, 0, 1,
-0.4380588, -0.06212075, -2.371599, 0.03137255, 1, 0, 1,
-0.4379398, 0.2440377, -0.4338983, 0.02745098, 1, 0, 1,
-0.435833, 2.631335, -1.235985, 0.01960784, 1, 0, 1,
-0.430794, 0.5057406, -0.6762357, 0.01568628, 1, 0, 1,
-0.4307212, 0.4581974, -2.235126, 0.007843138, 1, 0, 1,
-0.4263172, 1.610752, -0.964335, 0.003921569, 1, 0, 1,
-0.4256741, -0.7013511, -2.594342, 0, 1, 0.003921569, 1,
-0.4214284, -0.6823229, -2.384297, 0, 1, 0.01176471, 1,
-0.4194741, -0.06977917, -1.122503, 0, 1, 0.01568628, 1,
-0.4117364, 0.4131867, -0.4394648, 0, 1, 0.02352941, 1,
-0.410943, -1.348955, -5.706194, 0, 1, 0.02745098, 1,
-0.4096827, 0.796874, 0.1807922, 0, 1, 0.03529412, 1,
-0.4080105, -1.66331, -3.651345, 0, 1, 0.03921569, 1,
-0.4059818, -1.1129, -3.37208, 0, 1, 0.04705882, 1,
-0.4050144, -0.1494628, -1.867654, 0, 1, 0.05098039, 1,
-0.4031792, -0.07596704, -2.40912, 0, 1, 0.05882353, 1,
-0.3992504, -0.1339366, -0.6105912, 0, 1, 0.0627451, 1,
-0.3981873, 1.114741, -1.429509, 0, 1, 0.07058824, 1,
-0.397588, 0.238071, -2.199627, 0, 1, 0.07450981, 1,
-0.3961334, -0.8694925, -1.845623, 0, 1, 0.08235294, 1,
-0.3946626, -0.32822, -1.343542, 0, 1, 0.08627451, 1,
-0.3909704, 0.7539406, 0.3826631, 0, 1, 0.09411765, 1,
-0.3882048, -0.200748, -0.5087804, 0, 1, 0.1019608, 1,
-0.3847005, -0.002477609, -0.1940695, 0, 1, 0.1058824, 1,
-0.3809198, -0.1929137, -3.065233, 0, 1, 0.1137255, 1,
-0.3756836, 1.750122, 1.18941, 0, 1, 0.1176471, 1,
-0.3740617, 0.8376529, 0.2094534, 0, 1, 0.1254902, 1,
-0.3736664, 0.5574667, 0.1178096, 0, 1, 0.1294118, 1,
-0.3732677, -0.4676136, -3.068875, 0, 1, 0.1372549, 1,
-0.373004, -0.5628638, -1.089042, 0, 1, 0.1411765, 1,
-0.364117, 2.591015, -1.21639, 0, 1, 0.1490196, 1,
-0.3602391, -0.5450409, -2.215714, 0, 1, 0.1529412, 1,
-0.3561977, 1.735081, -1.117474, 0, 1, 0.1607843, 1,
-0.3510174, -0.8613358, -3.199348, 0, 1, 0.1647059, 1,
-0.344944, -0.9917989, -4.112674, 0, 1, 0.172549, 1,
-0.3435231, 0.09779787, -0.9339733, 0, 1, 0.1764706, 1,
-0.3432913, 0.6149766, 0.004243586, 0, 1, 0.1843137, 1,
-0.34271, -0.824993, -3.510213, 0, 1, 0.1882353, 1,
-0.3380489, 0.6954865, -1.274701, 0, 1, 0.1960784, 1,
-0.3371859, 1.085614, -1.105887, 0, 1, 0.2039216, 1,
-0.3356554, -0.7871915, -1.373815, 0, 1, 0.2078431, 1,
-0.3342651, -1.172181, -2.684092, 0, 1, 0.2156863, 1,
-0.3341475, -1.274493, -1.185096, 0, 1, 0.2196078, 1,
-0.3339047, -0.8011849, -2.640073, 0, 1, 0.227451, 1,
-0.3330408, -0.4218908, -1.991879, 0, 1, 0.2313726, 1,
-0.3312057, -0.3826529, -1.03024, 0, 1, 0.2392157, 1,
-0.3289552, 0.641817, 0.3006467, 0, 1, 0.2431373, 1,
-0.324807, 0.3219901, -0.5681008, 0, 1, 0.2509804, 1,
-0.3238127, 0.9390709, -2.601138, 0, 1, 0.254902, 1,
-0.3221258, 0.5337079, -1.279306, 0, 1, 0.2627451, 1,
-0.3169863, -0.6550619, -2.881811, 0, 1, 0.2666667, 1,
-0.3144019, -1.749463, -2.069524, 0, 1, 0.2745098, 1,
-0.3131041, -0.001964425, -1.686094, 0, 1, 0.2784314, 1,
-0.3067078, -1.824733, -1.797325, 0, 1, 0.2862745, 1,
-0.3057631, -2.019771, -2.046604, 0, 1, 0.2901961, 1,
-0.3036112, -0.7116194, -2.150547, 0, 1, 0.2980392, 1,
-0.3034013, -0.9934725, -1.700597, 0, 1, 0.3058824, 1,
-0.3028686, -0.3106719, -2.573164, 0, 1, 0.3098039, 1,
-0.3022094, -0.4175887, -3.459994, 0, 1, 0.3176471, 1,
-0.3000799, 0.7219344, -0.9747627, 0, 1, 0.3215686, 1,
-0.2997306, -0.4134459, -2.34523, 0, 1, 0.3294118, 1,
-0.2960597, 1.21424, 0.1667336, 0, 1, 0.3333333, 1,
-0.2950887, 0.3629481, 0.2687842, 0, 1, 0.3411765, 1,
-0.2945353, 0.2711149, -1.447616, 0, 1, 0.345098, 1,
-0.2927339, 0.5659419, 0.0006404631, 0, 1, 0.3529412, 1,
-0.2877276, -0.8470996, -2.499996, 0, 1, 0.3568628, 1,
-0.2867912, -0.5703286, -3.891757, 0, 1, 0.3647059, 1,
-0.286686, 1.280089, 0.4671829, 0, 1, 0.3686275, 1,
-0.2836377, -0.9594251, -1.805573, 0, 1, 0.3764706, 1,
-0.2703476, -0.09620992, -1.894518, 0, 1, 0.3803922, 1,
-0.269743, 0.6145067, -1.938416, 0, 1, 0.3882353, 1,
-0.2687958, 1.076037, -0.4343874, 0, 1, 0.3921569, 1,
-0.2614308, -0.8762293, -1.762004, 0, 1, 0.4, 1,
-0.2591473, 0.8579322, -0.5383421, 0, 1, 0.4078431, 1,
-0.2591059, -0.9653424, -4.25221, 0, 1, 0.4117647, 1,
-0.2529805, -1.632417, -2.873165, 0, 1, 0.4196078, 1,
-0.2513165, -0.9527591, -4.672188, 0, 1, 0.4235294, 1,
-0.2458394, -0.7160966, -2.484723, 0, 1, 0.4313726, 1,
-0.2399033, 0.7481848, -0.8877004, 0, 1, 0.4352941, 1,
-0.2398891, 1.09297, -1.537188, 0, 1, 0.4431373, 1,
-0.239571, -0.1387164, -1.483618, 0, 1, 0.4470588, 1,
-0.2369349, -1.450598, -2.76289, 0, 1, 0.454902, 1,
-0.23626, -0.4827381, -3.682166, 0, 1, 0.4588235, 1,
-0.2353036, 0.3035538, -0.39333, 0, 1, 0.4666667, 1,
-0.232873, -0.7190363, -4.362381, 0, 1, 0.4705882, 1,
-0.2302132, 1.697654, 1.083562, 0, 1, 0.4784314, 1,
-0.2296004, 1.338104, -0.0402499, 0, 1, 0.4823529, 1,
-0.2290737, 0.3571689, -2.189561, 0, 1, 0.4901961, 1,
-0.2249073, 0.7603655, -2.015206, 0, 1, 0.4941176, 1,
-0.2221592, -1.674496, -3.830272, 0, 1, 0.5019608, 1,
-0.2162451, -0.6667768, -5.171503, 0, 1, 0.509804, 1,
-0.2138786, 1.629088, -0.3513233, 0, 1, 0.5137255, 1,
-0.209113, -1.179157, -3.633209, 0, 1, 0.5215687, 1,
-0.2042201, 1.073529, 1.965513, 0, 1, 0.5254902, 1,
-0.2031225, 0.4670655, -1.25706, 0, 1, 0.5333334, 1,
-0.2026855, -0.4202432, -1.753695, 0, 1, 0.5372549, 1,
-0.196313, 0.0748752, -1.560089, 0, 1, 0.5450981, 1,
-0.1950592, 1.533706, 0.514713, 0, 1, 0.5490196, 1,
-0.1942143, 3.488238, 0.7606653, 0, 1, 0.5568628, 1,
-0.191759, 2.228256, 1.115207, 0, 1, 0.5607843, 1,
-0.1856772, 1.426227, -0.6788217, 0, 1, 0.5686275, 1,
-0.18222, -0.3155918, -2.080161, 0, 1, 0.572549, 1,
-0.1815738, -0.9070534, -2.866122, 0, 1, 0.5803922, 1,
-0.1796274, -0.4263627, -4.056942, 0, 1, 0.5843138, 1,
-0.1767575, -0.9359686, -3.335524, 0, 1, 0.5921569, 1,
-0.1761957, 0.2395333, -1.757239, 0, 1, 0.5960785, 1,
-0.1726805, 0.855693, -0.2640315, 0, 1, 0.6039216, 1,
-0.1722391, -0.05602253, -1.136191, 0, 1, 0.6117647, 1,
-0.171571, -0.4079063, -3.481632, 0, 1, 0.6156863, 1,
-0.1706809, 1.695542, 0.2099431, 0, 1, 0.6235294, 1,
-0.170482, 0.3152224, -0.512457, 0, 1, 0.627451, 1,
-0.1698314, -0.1438945, -3.685804, 0, 1, 0.6352941, 1,
-0.1652333, 0.3745555, -1.281842, 0, 1, 0.6392157, 1,
-0.1640927, -1.318483, -3.271135, 0, 1, 0.6470588, 1,
-0.163946, -0.8252049, -1.21744, 0, 1, 0.6509804, 1,
-0.1613215, -0.3869531, -1.465406, 0, 1, 0.6588235, 1,
-0.1610731, 0.6227534, -0.08648004, 0, 1, 0.6627451, 1,
-0.1599185, 0.03548502, -1.11217, 0, 1, 0.6705883, 1,
-0.1538017, -0.5998911, -2.850038, 0, 1, 0.6745098, 1,
-0.1497138, 2.047116, 1.130802, 0, 1, 0.682353, 1,
-0.1497008, 0.04958052, -1.792473, 0, 1, 0.6862745, 1,
-0.1496199, -0.1241359, -0.398121, 0, 1, 0.6941177, 1,
-0.1491281, -1.014228, -3.724548, 0, 1, 0.7019608, 1,
-0.1461258, -1.826412, -5.005666, 0, 1, 0.7058824, 1,
-0.1436219, -0.2317858, -0.2910112, 0, 1, 0.7137255, 1,
-0.1378528, 1.420167, -1.053681, 0, 1, 0.7176471, 1,
-0.1330174, 0.5676101, -2.138438, 0, 1, 0.7254902, 1,
-0.1295386, 0.5275242, 1.417449, 0, 1, 0.7294118, 1,
-0.1245789, 2.066701, -0.7311667, 0, 1, 0.7372549, 1,
-0.1235729, 0.726806, 0.6573639, 0, 1, 0.7411765, 1,
-0.123328, -1.653044, -3.509578, 0, 1, 0.7490196, 1,
-0.1231949, 0.9147984, 0.9367498, 0, 1, 0.7529412, 1,
-0.1215702, 0.06319971, -3.388766, 0, 1, 0.7607843, 1,
-0.1183823, 0.2838951, 0.4095891, 0, 1, 0.7647059, 1,
-0.1142644, 0.2976297, 1.391246, 0, 1, 0.772549, 1,
-0.1141924, 0.2258915, 0.660951, 0, 1, 0.7764706, 1,
-0.1141793, 0.6292004, -0.09636287, 0, 1, 0.7843137, 1,
-0.1097727, -0.6341462, -3.510181, 0, 1, 0.7882353, 1,
-0.1032667, 1.826586, -0.1966037, 0, 1, 0.7960784, 1,
-0.1016716, 0.3318661, -0.826686, 0, 1, 0.8039216, 1,
-0.09943337, 1.881709, -1.37178, 0, 1, 0.8078431, 1,
-0.09879531, -1.083686, -4.011477, 0, 1, 0.8156863, 1,
-0.09429903, -0.8154154, -3.233778, 0, 1, 0.8196079, 1,
-0.09158444, -0.7705374, -1.719869, 0, 1, 0.827451, 1,
-0.08815832, 0.9614061, -1.47879, 0, 1, 0.8313726, 1,
-0.0864941, -1.224879, -2.65527, 0, 1, 0.8392157, 1,
-0.08340037, 0.04467481, -1.343964, 0, 1, 0.8431373, 1,
-0.08051751, 0.3141817, 0.4254169, 0, 1, 0.8509804, 1,
-0.07559747, 0.875351, 0.225526, 0, 1, 0.854902, 1,
-0.07118035, -1.015499, -3.734163, 0, 1, 0.8627451, 1,
-0.07019193, -0.892258, -3.810133, 0, 1, 0.8666667, 1,
-0.06654345, 0.8274171, 0.2339302, 0, 1, 0.8745098, 1,
-0.06593111, 0.821252, -0.9266426, 0, 1, 0.8784314, 1,
-0.06444072, 2.636078, -0.4032926, 0, 1, 0.8862745, 1,
-0.0606997, -0.4226419, -3.909758, 0, 1, 0.8901961, 1,
-0.05340826, -0.1507796, -3.418201, 0, 1, 0.8980392, 1,
-0.04641588, 1.502867, 0.6766137, 0, 1, 0.9058824, 1,
-0.04553456, -0.1497688, -4.071185, 0, 1, 0.9098039, 1,
-0.04343015, 0.6097047, -0.7110609, 0, 1, 0.9176471, 1,
-0.04216033, 0.7568147, -0.507928, 0, 1, 0.9215686, 1,
-0.04089385, 1.317435, -2.3098, 0, 1, 0.9294118, 1,
-0.0398419, 0.2274913, -1.435336, 0, 1, 0.9333333, 1,
-0.0396595, -0.2213071, -1.838981, 0, 1, 0.9411765, 1,
-0.03952643, 0.3955078, -1.045845, 0, 1, 0.945098, 1,
-0.03498975, -1.188886, -3.135175, 0, 1, 0.9529412, 1,
-0.03014573, 0.2599052, -1.811344, 0, 1, 0.9568627, 1,
-0.02917481, -1.306587, -2.585693, 0, 1, 0.9647059, 1,
-0.01527332, -0.9137317, -3.124635, 0, 1, 0.9686275, 1,
-0.01515906, 0.9790679, -0.5397065, 0, 1, 0.9764706, 1,
-0.01425114, -1.403058, -1.923055, 0, 1, 0.9803922, 1,
-0.009028635, -1.253069, -4.471569, 0, 1, 0.9882353, 1,
-0.008093678, -2.557832, -3.816051, 0, 1, 0.9921569, 1,
-0.004463852, 0.3741062, -0.7068972, 0, 1, 1, 1,
0.005815338, -0.4413278, 3.921317, 0, 0.9921569, 1, 1,
0.006472525, -0.5834873, 1.369138, 0, 0.9882353, 1, 1,
0.008963782, 0.19766, -0.5080795, 0, 0.9803922, 1, 1,
0.01377035, 0.132353, -0.2000507, 0, 0.9764706, 1, 1,
0.01540393, 0.9644681, 0.2044142, 0, 0.9686275, 1, 1,
0.01545879, -0.5339354, 3.56494, 0, 0.9647059, 1, 1,
0.01609085, -1.030787, 3.597516, 0, 0.9568627, 1, 1,
0.01920015, 1.389548, -2.180624, 0, 0.9529412, 1, 1,
0.02192872, 0.4454186, 0.9138664, 0, 0.945098, 1, 1,
0.0220914, -0.5154378, 2.408834, 0, 0.9411765, 1, 1,
0.02420026, -0.2065421, 0.8785862, 0, 0.9333333, 1, 1,
0.02469219, 1.437216, -1.115456, 0, 0.9294118, 1, 1,
0.02783579, 0.246747, 1.631336, 0, 0.9215686, 1, 1,
0.02800328, -0.3537548, 1.580304, 0, 0.9176471, 1, 1,
0.02808681, 0.1969526, 1.505073, 0, 0.9098039, 1, 1,
0.03084724, 0.02193511, -0.1857214, 0, 0.9058824, 1, 1,
0.03252526, -0.0844782, 3.471631, 0, 0.8980392, 1, 1,
0.03258741, -0.7718589, 3.809875, 0, 0.8901961, 1, 1,
0.0364446, 0.06247657, 1.069019, 0, 0.8862745, 1, 1,
0.03781898, 1.075671, -0.1625995, 0, 0.8784314, 1, 1,
0.03879898, -2.1135, 3.469005, 0, 0.8745098, 1, 1,
0.0425897, -0.397291, 5.207482, 0, 0.8666667, 1, 1,
0.04498267, 0.5104947, 0.5464419, 0, 0.8627451, 1, 1,
0.04527237, -1.416004, 2.080363, 0, 0.854902, 1, 1,
0.05003458, 0.01042446, 0.3948872, 0, 0.8509804, 1, 1,
0.05215025, -1.76699, 3.209374, 0, 0.8431373, 1, 1,
0.05315008, -1.073384, 2.25846, 0, 0.8392157, 1, 1,
0.06399167, 0.385973, -0.6286093, 0, 0.8313726, 1, 1,
0.06513572, -0.05471037, 1.934864, 0, 0.827451, 1, 1,
0.06784099, -0.2256866, 4.032386, 0, 0.8196079, 1, 1,
0.06960062, -2.085316, 3.715928, 0, 0.8156863, 1, 1,
0.07311573, -1.967183, 4.171242, 0, 0.8078431, 1, 1,
0.07516856, 0.2814753, 0.7271369, 0, 0.8039216, 1, 1,
0.07551631, -0.6329535, 1.256832, 0, 0.7960784, 1, 1,
0.07844098, 1.780111, 0.6926007, 0, 0.7882353, 1, 1,
0.07938065, -0.1072725, 4.439737, 0, 0.7843137, 1, 1,
0.08130611, 1.73687, -1.897621, 0, 0.7764706, 1, 1,
0.08912131, -0.8919283, 3.743868, 0, 0.772549, 1, 1,
0.08947216, 0.1225489, -0.892556, 0, 0.7647059, 1, 1,
0.0895625, -1.261755, 4.330308, 0, 0.7607843, 1, 1,
0.09011797, 0.8586819, -1.704264, 0, 0.7529412, 1, 1,
0.09484017, 0.829916, 1.083816, 0, 0.7490196, 1, 1,
0.09676347, -0.3873585, 2.976095, 0, 0.7411765, 1, 1,
0.09826633, -0.3142336, 3.429043, 0, 0.7372549, 1, 1,
0.102746, -1.292971, 1.08638, 0, 0.7294118, 1, 1,
0.1074891, 1.455479, -0.284672, 0, 0.7254902, 1, 1,
0.1091779, -0.8659323, 3.702181, 0, 0.7176471, 1, 1,
0.1162023, -1.412516, 5.126388, 0, 0.7137255, 1, 1,
0.1237041, -0.2232892, 1.48205, 0, 0.7058824, 1, 1,
0.1258704, 1.117056, -0.260243, 0, 0.6980392, 1, 1,
0.1266896, -0.4239869, 2.237618, 0, 0.6941177, 1, 1,
0.127552, -0.9154301, 2.168267, 0, 0.6862745, 1, 1,
0.1280543, 1.826828, -0.7503144, 0, 0.682353, 1, 1,
0.1306732, 1.374519, 0.6562631, 0, 0.6745098, 1, 1,
0.1307266, 0.5846049, -0.7883369, 0, 0.6705883, 1, 1,
0.1307695, -1.591492, 3.421077, 0, 0.6627451, 1, 1,
0.1319306, 0.7389796, -0.8752156, 0, 0.6588235, 1, 1,
0.1322827, 1.229204, -0.5109199, 0, 0.6509804, 1, 1,
0.1384411, 0.4621925, 1.827936, 0, 0.6470588, 1, 1,
0.1421425, 0.2861624, -1.210891, 0, 0.6392157, 1, 1,
0.1560865, -1.609169, 4.608138, 0, 0.6352941, 1, 1,
0.1564489, -1.228683, 0.3597504, 0, 0.627451, 1, 1,
0.1604804, -0.2557682, 2.036518, 0, 0.6235294, 1, 1,
0.1622801, -1.127191, 3.866313, 0, 0.6156863, 1, 1,
0.1631984, 0.9377931, 1.171195, 0, 0.6117647, 1, 1,
0.1637389, 1.726211, 1.009605, 0, 0.6039216, 1, 1,
0.167066, -0.3557421, 2.922333, 0, 0.5960785, 1, 1,
0.1680415, 0.06086453, 0.7130305, 0, 0.5921569, 1, 1,
0.1684871, -0.09314139, 2.650541, 0, 0.5843138, 1, 1,
0.169422, -0.4264849, 1.98263, 0, 0.5803922, 1, 1,
0.1718124, 1.738519, 1.877914, 0, 0.572549, 1, 1,
0.1787667, -1.400572, 3.697367, 0, 0.5686275, 1, 1,
0.1802819, 0.8804617, 0.8332082, 0, 0.5607843, 1, 1,
0.1919599, -0.4911547, 3.169296, 0, 0.5568628, 1, 1,
0.1943251, -0.2317569, 2.64989, 0, 0.5490196, 1, 1,
0.1948892, -1.065143, 1.219984, 0, 0.5450981, 1, 1,
0.195883, -2.52346, 2.166279, 0, 0.5372549, 1, 1,
0.1972307, -0.2179821, 2.089024, 0, 0.5333334, 1, 1,
0.1983961, 0.9134475, 1.079153, 0, 0.5254902, 1, 1,
0.1990509, -0.5803731, 3.20635, 0, 0.5215687, 1, 1,
0.1994316, 0.2921762, 2.467248, 0, 0.5137255, 1, 1,
0.2016534, -2.113907, 1.859161, 0, 0.509804, 1, 1,
0.2053046, 0.7124687, 0.576341, 0, 0.5019608, 1, 1,
0.2062609, -0.1593444, 1.526799, 0, 0.4941176, 1, 1,
0.2140536, -0.03570537, 2.305312, 0, 0.4901961, 1, 1,
0.2157728, -1.063696, 3.509567, 0, 0.4823529, 1, 1,
0.2198417, -0.1380344, 2.892991, 0, 0.4784314, 1, 1,
0.2225811, -0.4565226, 2.794676, 0, 0.4705882, 1, 1,
0.224913, 0.4385229, 0.6484236, 0, 0.4666667, 1, 1,
0.2249451, 1.343989, -0.5085961, 0, 0.4588235, 1, 1,
0.2289326, -0.2932173, 1.243284, 0, 0.454902, 1, 1,
0.2291023, -0.425405, 1.778021, 0, 0.4470588, 1, 1,
0.2310844, -2.012641, 4.448881, 0, 0.4431373, 1, 1,
0.2427749, -1.910397, 3.183899, 0, 0.4352941, 1, 1,
0.244166, -1.495348, 4.760571, 0, 0.4313726, 1, 1,
0.2492406, 0.6206353, -0.0332583, 0, 0.4235294, 1, 1,
0.2501691, -1.158582, 3.11185, 0, 0.4196078, 1, 1,
0.2509405, -0.3026696, 2.883054, 0, 0.4117647, 1, 1,
0.2515098, 0.7251831, -1.132383, 0, 0.4078431, 1, 1,
0.2543949, -1.462734, 2.912363, 0, 0.4, 1, 1,
0.2544597, 1.104162, 0.9882953, 0, 0.3921569, 1, 1,
0.2578356, -0.3538585, 3.696842, 0, 0.3882353, 1, 1,
0.2601851, -1.451445, 3.091736, 0, 0.3803922, 1, 1,
0.262606, -1.136879, 2.497825, 0, 0.3764706, 1, 1,
0.2663348, 2.511059, -0.3049584, 0, 0.3686275, 1, 1,
0.2676004, -0.447086, 3.717253, 0, 0.3647059, 1, 1,
0.2676966, -1.264455, 3.174171, 0, 0.3568628, 1, 1,
0.2681262, 0.1584822, 0.4812648, 0, 0.3529412, 1, 1,
0.2736714, -0.08812463, 1.305338, 0, 0.345098, 1, 1,
0.2813527, -1.462467, 2.051741, 0, 0.3411765, 1, 1,
0.2818277, -1.247098, 3.516277, 0, 0.3333333, 1, 1,
0.2830409, 0.6202325, 2.415919, 0, 0.3294118, 1, 1,
0.2834955, -0.02297383, 2.168694, 0, 0.3215686, 1, 1,
0.2846451, 0.2053596, -0.7439306, 0, 0.3176471, 1, 1,
0.29039, -0.1437773, 0.7622532, 0, 0.3098039, 1, 1,
0.2943256, 0.5969275, -1.512328, 0, 0.3058824, 1, 1,
0.2956562, -0.9869453, 3.782404, 0, 0.2980392, 1, 1,
0.2959079, 1.244256, 0.3207186, 0, 0.2901961, 1, 1,
0.2991207, 1.940448, 0.8818266, 0, 0.2862745, 1, 1,
0.302226, 1.31128, 0.9516903, 0, 0.2784314, 1, 1,
0.3052707, -0.1845211, 2.334365, 0, 0.2745098, 1, 1,
0.3091996, -0.02457345, 1.736132, 0, 0.2666667, 1, 1,
0.3096066, 0.2064346, 0.3690857, 0, 0.2627451, 1, 1,
0.3172888, -1.079234, 3.971421, 0, 0.254902, 1, 1,
0.3200164, 0.1095982, 2.808153, 0, 0.2509804, 1, 1,
0.3202205, 0.1750236, 1.148771, 0, 0.2431373, 1, 1,
0.321646, -2.546781, 2.30696, 0, 0.2392157, 1, 1,
0.3230729, 0.4277015, 1.387741, 0, 0.2313726, 1, 1,
0.324372, 0.3321865, -0.3566414, 0, 0.227451, 1, 1,
0.3272271, 0.8176156, 0.7230778, 0, 0.2196078, 1, 1,
0.3288367, -0.5154411, 3.001799, 0, 0.2156863, 1, 1,
0.3321311, -0.0566318, -0.3087584, 0, 0.2078431, 1, 1,
0.3330874, 0.07468718, 0.6145132, 0, 0.2039216, 1, 1,
0.3368834, -1.63979, 1.82947, 0, 0.1960784, 1, 1,
0.3416897, 0.06370893, -0.1419454, 0, 0.1882353, 1, 1,
0.3442714, -0.5382628, 0.819668, 0, 0.1843137, 1, 1,
0.3469228, 0.3223233, 1.913211, 0, 0.1764706, 1, 1,
0.3477206, 1.222812, 0.6462076, 0, 0.172549, 1, 1,
0.3519946, 0.1194704, 0.9887673, 0, 0.1647059, 1, 1,
0.3523265, -0.6587552, 1.087309, 0, 0.1607843, 1, 1,
0.3529482, -0.1516602, 2.545888, 0, 0.1529412, 1, 1,
0.3572923, 0.5935839, -0.3004174, 0, 0.1490196, 1, 1,
0.3616017, 0.3107723, 1.955324, 0, 0.1411765, 1, 1,
0.3620465, 0.821492, -0.1456373, 0, 0.1372549, 1, 1,
0.3652223, 0.5146727, -1.498579, 0, 0.1294118, 1, 1,
0.3658434, 0.1418103, 1.492476, 0, 0.1254902, 1, 1,
0.3737542, -0.6313938, 3.058675, 0, 0.1176471, 1, 1,
0.3790573, 0.3011761, 2.306604, 0, 0.1137255, 1, 1,
0.3805736, 0.3087396, 0.7287422, 0, 0.1058824, 1, 1,
0.3814245, 1.153908, -0.1104091, 0, 0.09803922, 1, 1,
0.3817247, 2.387279, -0.03364707, 0, 0.09411765, 1, 1,
0.3843584, -0.4035674, 2.177275, 0, 0.08627451, 1, 1,
0.3902085, -0.7944627, 3.850123, 0, 0.08235294, 1, 1,
0.3915408, -0.2505966, 2.848986, 0, 0.07450981, 1, 1,
0.4001764, -0.007469309, 0.1737379, 0, 0.07058824, 1, 1,
0.4032992, 1.324714, -1.900176, 0, 0.0627451, 1, 1,
0.4039846, 1.97328, 1.326744, 0, 0.05882353, 1, 1,
0.4042752, -1.444435, 2.600678, 0, 0.05098039, 1, 1,
0.4097518, 1.082895, 0.4000366, 0, 0.04705882, 1, 1,
0.4108387, 0.1735242, 1.649741, 0, 0.03921569, 1, 1,
0.4138993, 0.9045161, -0.2216072, 0, 0.03529412, 1, 1,
0.4147072, -0.1684986, 2.944707, 0, 0.02745098, 1, 1,
0.4163653, -1.104084, 2.717754, 0, 0.02352941, 1, 1,
0.4177487, -0.1230152, 2.491762, 0, 0.01568628, 1, 1,
0.4240662, 0.7504429, 0.7420741, 0, 0.01176471, 1, 1,
0.4250889, 1.05402, 0.168444, 0, 0.003921569, 1, 1,
0.4256235, 0.9957505, 1.120178, 0.003921569, 0, 1, 1,
0.4270017, 0.7762246, 0.323901, 0.007843138, 0, 1, 1,
0.4278535, 0.8790627, 0.6049478, 0.01568628, 0, 1, 1,
0.4348706, 0.504797, -1.577446, 0.01960784, 0, 1, 1,
0.440478, -0.0786052, -0.4244374, 0.02745098, 0, 1, 1,
0.4405262, -0.431743, 4.343621, 0.03137255, 0, 1, 1,
0.4482892, 0.04873328, 1.163877, 0.03921569, 0, 1, 1,
0.4492343, 0.2651442, 0.6715996, 0.04313726, 0, 1, 1,
0.4557499, 0.5739192, 0.7487214, 0.05098039, 0, 1, 1,
0.4605239, -1.284745, 2.196356, 0.05490196, 0, 1, 1,
0.4608418, 0.6690607, 1.051696, 0.0627451, 0, 1, 1,
0.462854, -0.273897, 2.087359, 0.06666667, 0, 1, 1,
0.4755881, 1.991912, 1.043415, 0.07450981, 0, 1, 1,
0.48221, -0.5868829, 1.236265, 0.07843138, 0, 1, 1,
0.4845558, 0.2491995, 0.8780886, 0.08627451, 0, 1, 1,
0.4936779, 1.35979, 1.01896, 0.09019608, 0, 1, 1,
0.4947267, -1.632476, 2.743227, 0.09803922, 0, 1, 1,
0.4971049, 0.285855, -0.5108219, 0.1058824, 0, 1, 1,
0.4982933, -0.3697295, 0.2971289, 0.1098039, 0, 1, 1,
0.5155049, 1.168764, -0.3331987, 0.1176471, 0, 1, 1,
0.5164942, -0.546348, 3.392053, 0.1215686, 0, 1, 1,
0.5173079, 2.132325, -1.209963, 0.1294118, 0, 1, 1,
0.5229451, -0.8719529, 0.2122597, 0.1333333, 0, 1, 1,
0.5245773, 0.6336429, 0.1104603, 0.1411765, 0, 1, 1,
0.5265828, 0.1635733, 1.769041, 0.145098, 0, 1, 1,
0.526777, -0.4436232, 0.9644511, 0.1529412, 0, 1, 1,
0.5278999, 0.6684958, 0.6884187, 0.1568628, 0, 1, 1,
0.5298841, 0.5840575, 0.173196, 0.1647059, 0, 1, 1,
0.5318804, 0.7723162, -0.2138184, 0.1686275, 0, 1, 1,
0.5320868, -0.1053148, 1.488358, 0.1764706, 0, 1, 1,
0.5371239, 0.07858656, 0.5358124, 0.1803922, 0, 1, 1,
0.5404755, 1.707237, 2.495316, 0.1882353, 0, 1, 1,
0.5406442, 0.1673702, 2.248729, 0.1921569, 0, 1, 1,
0.5453075, 1.094242, 0.4104807, 0.2, 0, 1, 1,
0.5465716, -1.706964, 2.322507, 0.2078431, 0, 1, 1,
0.5492384, 0.4732246, 1.526148, 0.2117647, 0, 1, 1,
0.5522945, 1.352772, 0.2881443, 0.2196078, 0, 1, 1,
0.5531573, 0.2620568, 1.409879, 0.2235294, 0, 1, 1,
0.5537246, -0.2252522, 2.958702, 0.2313726, 0, 1, 1,
0.5585085, 0.5502649, -0.4268665, 0.2352941, 0, 1, 1,
0.5594272, 0.7662289, -1.545822, 0.2431373, 0, 1, 1,
0.568643, -0.3779646, 2.544633, 0.2470588, 0, 1, 1,
0.5692745, -0.9432232, 2.97383, 0.254902, 0, 1, 1,
0.5713956, -1.242497, 3.782881, 0.2588235, 0, 1, 1,
0.5757509, -0.6758825, 2.514894, 0.2666667, 0, 1, 1,
0.5767665, -1.081113, 2.132139, 0.2705882, 0, 1, 1,
0.5780589, -0.9197655, 2.38223, 0.2784314, 0, 1, 1,
0.5842195, 1.30412, 0.1964748, 0.282353, 0, 1, 1,
0.5846549, 0.9049772, 0.5887201, 0.2901961, 0, 1, 1,
0.5899594, 0.796894, 1.504328, 0.2941177, 0, 1, 1,
0.5915135, 1.501487, 1.333703, 0.3019608, 0, 1, 1,
0.5927444, 0.5211204, 1.520777, 0.3098039, 0, 1, 1,
0.5946723, -0.6244889, 1.968003, 0.3137255, 0, 1, 1,
0.6021615, -1.985098, 2.007712, 0.3215686, 0, 1, 1,
0.6045651, 0.1886129, 1.398851, 0.3254902, 0, 1, 1,
0.6060436, -0.1883416, 0.488255, 0.3333333, 0, 1, 1,
0.6092577, -1.093912, 3.054038, 0.3372549, 0, 1, 1,
0.6139724, -0.3825432, 1.303182, 0.345098, 0, 1, 1,
0.6181495, -0.009961427, 2.645166, 0.3490196, 0, 1, 1,
0.619843, 0.1762796, 1.267445, 0.3568628, 0, 1, 1,
0.6300143, -1.548019, 1.990221, 0.3607843, 0, 1, 1,
0.6365163, 1.549183, -0.1325245, 0.3686275, 0, 1, 1,
0.6432136, 0.01543459, 0.4357541, 0.372549, 0, 1, 1,
0.6465935, 1.109466, 1.164779, 0.3803922, 0, 1, 1,
0.6495714, -0.8489466, 2.924498, 0.3843137, 0, 1, 1,
0.6564033, -0.35207, 2.308469, 0.3921569, 0, 1, 1,
0.6572036, -1.070162, 2.007041, 0.3960784, 0, 1, 1,
0.6592137, 0.03270539, 2.150693, 0.4039216, 0, 1, 1,
0.6651303, 0.1107835, 0.9401406, 0.4117647, 0, 1, 1,
0.665557, -0.2213667, -0.3950044, 0.4156863, 0, 1, 1,
0.6683314, 0.8400449, -0.02063017, 0.4235294, 0, 1, 1,
0.6729067, 1.160366, -0.3881528, 0.427451, 0, 1, 1,
0.6734487, -1.798764, 1.892452, 0.4352941, 0, 1, 1,
0.6749262, 0.2362787, 2.527249, 0.4392157, 0, 1, 1,
0.6769813, -0.5742896, 0.6142274, 0.4470588, 0, 1, 1,
0.6794667, 0.4486963, 0.798678, 0.4509804, 0, 1, 1,
0.6832019, 1.144821, 0.3967244, 0.4588235, 0, 1, 1,
0.6838578, -0.8495002, 2.73209, 0.4627451, 0, 1, 1,
0.6845766, 0.4441766, -0.4778163, 0.4705882, 0, 1, 1,
0.6847131, -1.251734, 2.738586, 0.4745098, 0, 1, 1,
0.686096, -1.436283, 2.240361, 0.4823529, 0, 1, 1,
0.6916239, 1.803198, 0.703943, 0.4862745, 0, 1, 1,
0.6933367, 1.55908, 0.5356767, 0.4941176, 0, 1, 1,
0.6970679, 1.18027, 2.015553, 0.5019608, 0, 1, 1,
0.7008817, -0.5445037, 2.686371, 0.5058824, 0, 1, 1,
0.7023335, 0.5131245, 1.333174, 0.5137255, 0, 1, 1,
0.7042705, -0.08369597, 0.8535917, 0.5176471, 0, 1, 1,
0.7046209, -0.6091158, 4.051939, 0.5254902, 0, 1, 1,
0.7063698, -1.463511, 3.034354, 0.5294118, 0, 1, 1,
0.7106552, -1.570361, 2.337862, 0.5372549, 0, 1, 1,
0.7114178, 0.9311119, 0.3568807, 0.5411765, 0, 1, 1,
0.7190375, 1.481909, -0.546196, 0.5490196, 0, 1, 1,
0.7198121, -0.9963616, 3.078851, 0.5529412, 0, 1, 1,
0.7203409, 0.09839258, -0.0113115, 0.5607843, 0, 1, 1,
0.7206832, -1.101493, 1.962609, 0.5647059, 0, 1, 1,
0.7230574, 0.2035534, -0.06754616, 0.572549, 0, 1, 1,
0.7264467, 1.16834, -0.3333465, 0.5764706, 0, 1, 1,
0.7374368, 0.6369634, 0.7673119, 0.5843138, 0, 1, 1,
0.7436203, 0.489633, 2.501779, 0.5882353, 0, 1, 1,
0.745654, -1.072339, 3.425301, 0.5960785, 0, 1, 1,
0.7520282, -0.1687789, 1.860918, 0.6039216, 0, 1, 1,
0.7530525, -0.4465818, 2.254958, 0.6078432, 0, 1, 1,
0.758049, 0.008327354, 1.550086, 0.6156863, 0, 1, 1,
0.7643426, 1.572301, 2.333022, 0.6196079, 0, 1, 1,
0.7660627, 0.1530523, -0.1427001, 0.627451, 0, 1, 1,
0.7665758, -1.109619, 3.92474, 0.6313726, 0, 1, 1,
0.7670736, -1.933227, 2.678486, 0.6392157, 0, 1, 1,
0.7698001, 1.28948, 0.9175922, 0.6431373, 0, 1, 1,
0.7839563, -2.066685, 2.595878, 0.6509804, 0, 1, 1,
0.7887458, 1.29688, 1.266585, 0.654902, 0, 1, 1,
0.7890791, 1.153358, 1.524794, 0.6627451, 0, 1, 1,
0.8001051, -0.7344524, 2.066252, 0.6666667, 0, 1, 1,
0.8015819, 1.926297, 0.640801, 0.6745098, 0, 1, 1,
0.8037102, 0.667658, 0.7967589, 0.6784314, 0, 1, 1,
0.8097519, 0.1798623, 1.154768, 0.6862745, 0, 1, 1,
0.8170511, -0.3134053, 1.498204, 0.6901961, 0, 1, 1,
0.8196006, 0.6199425, 1.139209, 0.6980392, 0, 1, 1,
0.820455, 1.071166, -0.2384834, 0.7058824, 0, 1, 1,
0.8206829, 0.001657204, 1.594611, 0.7098039, 0, 1, 1,
0.8276608, 0.2106177, 1.803688, 0.7176471, 0, 1, 1,
0.8286608, -0.2091319, 1.544139, 0.7215686, 0, 1, 1,
0.8400728, -0.4876451, 0.6558557, 0.7294118, 0, 1, 1,
0.8442678, -0.8145357, 2.784554, 0.7333333, 0, 1, 1,
0.8471653, 0.7030071, 0.300746, 0.7411765, 0, 1, 1,
0.8517972, -0.4847166, 2.351827, 0.7450981, 0, 1, 1,
0.8523778, 0.4187464, 2.42802, 0.7529412, 0, 1, 1,
0.8575166, 2.014987, -0.2597117, 0.7568628, 0, 1, 1,
0.8585154, -0.0871314, -0.1137955, 0.7647059, 0, 1, 1,
0.859809, -0.9371603, 2.251898, 0.7686275, 0, 1, 1,
0.8626307, -0.8474438, 4.391009, 0.7764706, 0, 1, 1,
0.8662163, -0.5924488, 3.439569, 0.7803922, 0, 1, 1,
0.8704923, -1.350258, 4.92336, 0.7882353, 0, 1, 1,
0.8847104, 0.147623, 1.091972, 0.7921569, 0, 1, 1,
0.8956473, 0.6611025, 0.8386197, 0.8, 0, 1, 1,
0.9103388, -0.884593, 3.747568, 0.8078431, 0, 1, 1,
0.9153918, -0.4859554, 2.279103, 0.8117647, 0, 1, 1,
0.9159997, -0.5933477, 1.468726, 0.8196079, 0, 1, 1,
0.9172566, -0.6734266, 1.52753, 0.8235294, 0, 1, 1,
0.9223893, -0.2624037, 0.7524822, 0.8313726, 0, 1, 1,
0.9236957, 0.04119322, 2.234018, 0.8352941, 0, 1, 1,
0.9250028, 0.1630163, 1.157609, 0.8431373, 0, 1, 1,
0.9250401, 0.5875024, 2.701424, 0.8470588, 0, 1, 1,
0.9251242, 2.362515, 0.7151794, 0.854902, 0, 1, 1,
0.9251918, -1.962549, 3.62382, 0.8588235, 0, 1, 1,
0.933659, -0.1130942, 0.6209715, 0.8666667, 0, 1, 1,
0.9351495, 1.047216, 0.01311813, 0.8705882, 0, 1, 1,
0.9433884, 2.02587, 1.600078, 0.8784314, 0, 1, 1,
0.9434766, 0.9527391, 0.505133, 0.8823529, 0, 1, 1,
0.9434959, 0.4533947, 2.405826, 0.8901961, 0, 1, 1,
0.9465439, 0.9616511, -0.0876844, 0.8941177, 0, 1, 1,
0.9468411, 0.7318889, 3.869441, 0.9019608, 0, 1, 1,
0.9479091, 1.23391, 0.08309253, 0.9098039, 0, 1, 1,
0.9539501, 1.855901, -0.4242927, 0.9137255, 0, 1, 1,
0.9696963, 0.0772711, 1.645546, 0.9215686, 0, 1, 1,
0.9702337, 0.1670513, -0.4672999, 0.9254902, 0, 1, 1,
0.978447, -0.2307824, 0.4933052, 0.9333333, 0, 1, 1,
0.9799267, 0.1061967, 0.5605501, 0.9372549, 0, 1, 1,
0.9814771, -0.2535946, 1.697836, 0.945098, 0, 1, 1,
0.990351, 0.4921959, 0.3655823, 0.9490196, 0, 1, 1,
0.998216, -0.3660627, 2.739623, 0.9568627, 0, 1, 1,
1.000755, -1.646469, 4.194593, 0.9607843, 0, 1, 1,
1.005207, -0.686403, 2.677902, 0.9686275, 0, 1, 1,
1.014466, -0.2330414, 0.957164, 0.972549, 0, 1, 1,
1.020483, 2.130567, 0.4033248, 0.9803922, 0, 1, 1,
1.030064, -0.2951512, 0.6067417, 0.9843137, 0, 1, 1,
1.037838, 1.563146, -0.6827892, 0.9921569, 0, 1, 1,
1.041925, -0.7802427, 1.690839, 0.9960784, 0, 1, 1,
1.055733, 1.902501, 0.5462412, 1, 0, 0.9960784, 1,
1.056581, -0.06969497, 1.480157, 1, 0, 0.9882353, 1,
1.060502, -0.8740817, 3.060942, 1, 0, 0.9843137, 1,
1.062017, 0.5959612, 1.890731, 1, 0, 0.9764706, 1,
1.072074, 0.4153491, 1.259287, 1, 0, 0.972549, 1,
1.079958, -1.710934, 1.04039, 1, 0, 0.9647059, 1,
1.088172, -0.0632828, 2.16328, 1, 0, 0.9607843, 1,
1.090389, 1.040496, 1.615708, 1, 0, 0.9529412, 1,
1.09106, 1.483311, 0.4183353, 1, 0, 0.9490196, 1,
1.094677, -1.003984, 3.029192, 1, 0, 0.9411765, 1,
1.095678, -0.2930409, 0.5607216, 1, 0, 0.9372549, 1,
1.099396, 1.54312, 0.3077369, 1, 0, 0.9294118, 1,
1.105041, 1.543605, 1.258698, 1, 0, 0.9254902, 1,
1.10747, 0.01889403, 1.374303, 1, 0, 0.9176471, 1,
1.112518, 0.3169477, 2.830098, 1, 0, 0.9137255, 1,
1.113477, -0.15345, 1.833862, 1, 0, 0.9058824, 1,
1.1156, -0.8145708, 2.058822, 1, 0, 0.9019608, 1,
1.116583, -0.779607, 0.8726673, 1, 0, 0.8941177, 1,
1.116691, -0.6108789, 1.432798, 1, 0, 0.8862745, 1,
1.118669, -0.9455813, 1.478341, 1, 0, 0.8823529, 1,
1.127365, -0.586633, 3.07912, 1, 0, 0.8745098, 1,
1.128473, 0.6978189, 1.636576, 1, 0, 0.8705882, 1,
1.136224, -1.374728, 2.102734, 1, 0, 0.8627451, 1,
1.14107, 0.08052339, 2.461737, 1, 0, 0.8588235, 1,
1.148234, 0.3131021, 4.339408, 1, 0, 0.8509804, 1,
1.150773, 1.279374, -0.2235483, 1, 0, 0.8470588, 1,
1.153235, -3.073065, 3.677455, 1, 0, 0.8392157, 1,
1.155237, -1.394701, 2.322337, 1, 0, 0.8352941, 1,
1.165714, -0.4417609, 3.730304, 1, 0, 0.827451, 1,
1.1694, 0.6591817, 1.431364, 1, 0, 0.8235294, 1,
1.170507, 0.5596047, 3.407363, 1, 0, 0.8156863, 1,
1.178267, -0.4482501, 2.11901, 1, 0, 0.8117647, 1,
1.18488, -1.115933, 2.289452, 1, 0, 0.8039216, 1,
1.185048, 1.220887, -0.1371059, 1, 0, 0.7960784, 1,
1.185645, -1.401251, 2.515114, 1, 0, 0.7921569, 1,
1.188523, -1.191668, 1.722517, 1, 0, 0.7843137, 1,
1.196697, -0.8596236, 1.539664, 1, 0, 0.7803922, 1,
1.196806, -0.7755725, 3.107716, 1, 0, 0.772549, 1,
1.197775, 0.5623347, 1.21763, 1, 0, 0.7686275, 1,
1.201196, 0.8818916, 1.476942, 1, 0, 0.7607843, 1,
1.203018, -0.3596307, 2.066943, 1, 0, 0.7568628, 1,
1.20309, -0.380553, 2.670849, 1, 0, 0.7490196, 1,
1.20602, 1.06098, -0.4157441, 1, 0, 0.7450981, 1,
1.207677, 1.174472, 0.1400648, 1, 0, 0.7372549, 1,
1.214747, 2.426022, 1.301126, 1, 0, 0.7333333, 1,
1.215989, 1.906772, 1.339789, 1, 0, 0.7254902, 1,
1.216874, -0.2734771, 2.379959, 1, 0, 0.7215686, 1,
1.218852, 0.3556542, 0.7765548, 1, 0, 0.7137255, 1,
1.225618, -0.6719934, 2.514833, 1, 0, 0.7098039, 1,
1.22609, -0.1547944, 1.488777, 1, 0, 0.7019608, 1,
1.226274, 0.7462138, 0.4794503, 1, 0, 0.6941177, 1,
1.227834, -0.4192884, 0.2024818, 1, 0, 0.6901961, 1,
1.245552, -0.2361737, 1.035633, 1, 0, 0.682353, 1,
1.24697, -1.611912, 1.22345, 1, 0, 0.6784314, 1,
1.248961, -0.4544425, 1.589388, 1, 0, 0.6705883, 1,
1.249499, 0.5417414, 0.8822295, 1, 0, 0.6666667, 1,
1.252241, 0.2236349, 1.541275, 1, 0, 0.6588235, 1,
1.254061, -0.6716124, 1.776507, 1, 0, 0.654902, 1,
1.256541, 0.5167425, 1.710345, 1, 0, 0.6470588, 1,
1.276748, 0.7535542, 0.1302063, 1, 0, 0.6431373, 1,
1.286363, -0.5285957, 0.8212554, 1, 0, 0.6352941, 1,
1.310873, -1.742144, 2.756351, 1, 0, 0.6313726, 1,
1.315913, -0.08375257, 1.796013, 1, 0, 0.6235294, 1,
1.316925, -0.2409306, 2.375294, 1, 0, 0.6196079, 1,
1.317944, -0.5348422, 1.65356, 1, 0, 0.6117647, 1,
1.323502, -0.8529952, 3.053243, 1, 0, 0.6078432, 1,
1.332307, -1.799049, 2.414279, 1, 0, 0.6, 1,
1.334777, 0.8275388, 1.070183, 1, 0, 0.5921569, 1,
1.345183, 1.018533, 0.429735, 1, 0, 0.5882353, 1,
1.345745, 0.2799693, 2.006413, 1, 0, 0.5803922, 1,
1.348373, 1.012178, -0.3600435, 1, 0, 0.5764706, 1,
1.358566, -1.113266, 0.432425, 1, 0, 0.5686275, 1,
1.365405, -2.367992, 2.708688, 1, 0, 0.5647059, 1,
1.382137, -0.8348785, 1.94032, 1, 0, 0.5568628, 1,
1.388001, -0.8544226, 2.526056, 1, 0, 0.5529412, 1,
1.395837, 1.524474, 0.2918525, 1, 0, 0.5450981, 1,
1.398905, 0.3600945, 1.225291, 1, 0, 0.5411765, 1,
1.405861, 0.6412075, 0.0956096, 1, 0, 0.5333334, 1,
1.409698, 1.62271, -1.263048, 1, 0, 0.5294118, 1,
1.412352, -0.7341117, 3.027472, 1, 0, 0.5215687, 1,
1.430492, -1.671714, 1.710979, 1, 0, 0.5176471, 1,
1.436981, -1.842592, 2.336034, 1, 0, 0.509804, 1,
1.441052, 1.070996, 1.019099, 1, 0, 0.5058824, 1,
1.441232, -0.8344789, 2.681301, 1, 0, 0.4980392, 1,
1.452997, -1.553202, 1.727861, 1, 0, 0.4901961, 1,
1.453103, -0.3709802, 0.6464215, 1, 0, 0.4862745, 1,
1.458232, 0.6757263, 0.2050117, 1, 0, 0.4784314, 1,
1.458316, -1.80637, 1.815063, 1, 0, 0.4745098, 1,
1.472008, -0.3183379, 0.5344478, 1, 0, 0.4666667, 1,
1.472021, 1.033646, 1.022865, 1, 0, 0.4627451, 1,
1.473001, -1.720816, 1.268054, 1, 0, 0.454902, 1,
1.480239, 0.9207032, 0.3526451, 1, 0, 0.4509804, 1,
1.484293, 0.8997324, 0.03856727, 1, 0, 0.4431373, 1,
1.485064, 0.02080055, 2.900432, 1, 0, 0.4392157, 1,
1.491283, -3.801902, 3.385127, 1, 0, 0.4313726, 1,
1.49595, -0.09674598, 2.397784, 1, 0, 0.427451, 1,
1.501462, -0.6340091, 1.250774, 1, 0, 0.4196078, 1,
1.501685, 0.6179762, 0.7888966, 1, 0, 0.4156863, 1,
1.502653, 0.5809262, 1.479041, 1, 0, 0.4078431, 1,
1.511326, 1.026513, 1.107628, 1, 0, 0.4039216, 1,
1.51376, 0.7619485, 1.551317, 1, 0, 0.3960784, 1,
1.521991, 1.481943, 0.1189464, 1, 0, 0.3882353, 1,
1.525372, -0.7388417, 2.054195, 1, 0, 0.3843137, 1,
1.53213, 1.077815, 0.7973983, 1, 0, 0.3764706, 1,
1.539221, 0.06202962, 2.929596, 1, 0, 0.372549, 1,
1.54895, 0.6581185, 1.006926, 1, 0, 0.3647059, 1,
1.549667, -0.4931584, 1.912095, 1, 0, 0.3607843, 1,
1.567556, 0.254916, 0.7790341, 1, 0, 0.3529412, 1,
1.578483, -0.1191, 1.610215, 1, 0, 0.3490196, 1,
1.585637, -0.516479, 2.872232, 1, 0, 0.3411765, 1,
1.58655, -1.936991, 2.415349, 1, 0, 0.3372549, 1,
1.599984, -0.3663637, 0.777037, 1, 0, 0.3294118, 1,
1.628889, 1.973989, 0.1601836, 1, 0, 0.3254902, 1,
1.633203, -0.8595551, 1.811679, 1, 0, 0.3176471, 1,
1.637056, 0.7467687, 0.8889117, 1, 0, 0.3137255, 1,
1.644667, -0.2808536, 1.641903, 1, 0, 0.3058824, 1,
1.656486, 0.8026785, 0.2568852, 1, 0, 0.2980392, 1,
1.658891, -0.7225396, 2.02449, 1, 0, 0.2941177, 1,
1.662389, -0.3342861, 1.275912, 1, 0, 0.2862745, 1,
1.671052, 2.319098, 1.424744, 1, 0, 0.282353, 1,
1.709022, 0.3583945, 0.2291908, 1, 0, 0.2745098, 1,
1.714159, -1.01939, 0.6731689, 1, 0, 0.2705882, 1,
1.738252, 0.1796782, 1.513179, 1, 0, 0.2627451, 1,
1.743216, 1.698693, 0.1165965, 1, 0, 0.2588235, 1,
1.751689, -1.028672, 2.216175, 1, 0, 0.2509804, 1,
1.752649, 1.653123, 0.694881, 1, 0, 0.2470588, 1,
1.757433, 0.5271871, 1.768769, 1, 0, 0.2392157, 1,
1.758427, 0.05581156, 1.30739, 1, 0, 0.2352941, 1,
1.767779, -1.627266, 0.9583791, 1, 0, 0.227451, 1,
1.825315, -1.064152, 2.135545, 1, 0, 0.2235294, 1,
1.834564, -0.6978601, 0.2883442, 1, 0, 0.2156863, 1,
1.85613, -0.8242708, 2.474485, 1, 0, 0.2117647, 1,
1.8564, 0.7866989, 0.6120378, 1, 0, 0.2039216, 1,
1.872965, 0.1415101, 3.341582, 1, 0, 0.1960784, 1,
1.894477, 2.122001, -0.1590915, 1, 0, 0.1921569, 1,
1.949251, -0.966786, 1.525396, 1, 0, 0.1843137, 1,
1.958641, 0.2675429, 2.085462, 1, 0, 0.1803922, 1,
1.96152, 0.2966204, 3.161098, 1, 0, 0.172549, 1,
1.989197, -0.5188789, 2.761657, 1, 0, 0.1686275, 1,
1.992038, 0.6938766, 1.155765, 1, 0, 0.1607843, 1,
2.015638, -1.601503, 1.917408, 1, 0, 0.1568628, 1,
2.024152, 0.1334631, 0.6419541, 1, 0, 0.1490196, 1,
2.026897, 0.2549566, 1.70825, 1, 0, 0.145098, 1,
2.043013, -0.07484802, 2.209163, 1, 0, 0.1372549, 1,
2.051088, 2.602915, 1.340333, 1, 0, 0.1333333, 1,
2.057736, -0.9121061, 1.645532, 1, 0, 0.1254902, 1,
2.086367, -1.118876, 3.508779, 1, 0, 0.1215686, 1,
2.161897, 0.2254883, 0.4915978, 1, 0, 0.1137255, 1,
2.190172, 3.167929, 1.273363, 1, 0, 0.1098039, 1,
2.203284, -0.07020525, -0.1942588, 1, 0, 0.1019608, 1,
2.264627, 1.220224, -0.0943902, 1, 0, 0.09411765, 1,
2.452919, 1.757866, 2.089879, 1, 0, 0.09019608, 1,
2.473052, 0.9819396, 2.08221, 1, 0, 0.08235294, 1,
2.500707, -0.9418421, 3.159431, 1, 0, 0.07843138, 1,
2.502374, 0.3509153, 3.710024, 1, 0, 0.07058824, 1,
2.527702, -0.3593397, 1.612858, 1, 0, 0.06666667, 1,
2.528971, -0.2958055, 1.165675, 1, 0, 0.05882353, 1,
2.624228, -2.082235, 0.70791, 1, 0, 0.05490196, 1,
2.640089, 1.115774, 0.06527496, 1, 0, 0.04705882, 1,
2.75672, -0.08929626, 1.49359, 1, 0, 0.04313726, 1,
2.77743, -1.766569, 2.754968, 1, 0, 0.03529412, 1,
2.829415, -0.6488162, 2.049473, 1, 0, 0.03137255, 1,
3.021825, -2.123627, 4.700867, 1, 0, 0.02352941, 1,
3.077854, 0.2718628, 2.293635, 1, 0, 0.01960784, 1,
3.086228, -0.1097229, -0.08290198, 1, 0, 0.01176471, 1,
3.273501, 0.624979, 1.767451, 1, 0, 0.007843138, 1
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
-0.1751417, -5.037581, -7.556063, 0, -0.5, 0.5, 0.5,
-0.1751417, -5.037581, -7.556063, 1, -0.5, 0.5, 0.5,
-0.1751417, -5.037581, -7.556063, 1, 1.5, 0.5, 0.5,
-0.1751417, -5.037581, -7.556063, 0, 1.5, 0.5, 0.5
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
-4.792874, -0.1568322, -7.556063, 0, -0.5, 0.5, 0.5,
-4.792874, -0.1568322, -7.556063, 1, -0.5, 0.5, 0.5,
-4.792874, -0.1568322, -7.556063, 1, 1.5, 0.5, 0.5,
-4.792874, -0.1568322, -7.556063, 0, 1.5, 0.5, 0.5
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
-4.792874, -5.037581, -0.2493563, 0, -0.5, 0.5, 0.5,
-4.792874, -5.037581, -0.2493563, 1, -0.5, 0.5, 0.5,
-4.792874, -5.037581, -0.2493563, 1, 1.5, 0.5, 0.5,
-4.792874, -5.037581, -0.2493563, 0, 1.5, 0.5, 0.5
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
-3, -3.911254, -5.8699,
3, -3.911254, -5.8699,
-3, -3.911254, -5.8699,
-3, -4.098976, -6.150927,
-2, -3.911254, -5.8699,
-2, -4.098976, -6.150927,
-1, -3.911254, -5.8699,
-1, -4.098976, -6.150927,
0, -3.911254, -5.8699,
0, -4.098976, -6.150927,
1, -3.911254, -5.8699,
1, -4.098976, -6.150927,
2, -3.911254, -5.8699,
2, -4.098976, -6.150927,
3, -3.911254, -5.8699,
3, -4.098976, -6.150927
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
-3, -4.474418, -6.712981, 0, -0.5, 0.5, 0.5,
-3, -4.474418, -6.712981, 1, -0.5, 0.5, 0.5,
-3, -4.474418, -6.712981, 1, 1.5, 0.5, 0.5,
-3, -4.474418, -6.712981, 0, 1.5, 0.5, 0.5,
-2, -4.474418, -6.712981, 0, -0.5, 0.5, 0.5,
-2, -4.474418, -6.712981, 1, -0.5, 0.5, 0.5,
-2, -4.474418, -6.712981, 1, 1.5, 0.5, 0.5,
-2, -4.474418, -6.712981, 0, 1.5, 0.5, 0.5,
-1, -4.474418, -6.712981, 0, -0.5, 0.5, 0.5,
-1, -4.474418, -6.712981, 1, -0.5, 0.5, 0.5,
-1, -4.474418, -6.712981, 1, 1.5, 0.5, 0.5,
-1, -4.474418, -6.712981, 0, 1.5, 0.5, 0.5,
0, -4.474418, -6.712981, 0, -0.5, 0.5, 0.5,
0, -4.474418, -6.712981, 1, -0.5, 0.5, 0.5,
0, -4.474418, -6.712981, 1, 1.5, 0.5, 0.5,
0, -4.474418, -6.712981, 0, 1.5, 0.5, 0.5,
1, -4.474418, -6.712981, 0, -0.5, 0.5, 0.5,
1, -4.474418, -6.712981, 1, -0.5, 0.5, 0.5,
1, -4.474418, -6.712981, 1, 1.5, 0.5, 0.5,
1, -4.474418, -6.712981, 0, 1.5, 0.5, 0.5,
2, -4.474418, -6.712981, 0, -0.5, 0.5, 0.5,
2, -4.474418, -6.712981, 1, -0.5, 0.5, 0.5,
2, -4.474418, -6.712981, 1, 1.5, 0.5, 0.5,
2, -4.474418, -6.712981, 0, 1.5, 0.5, 0.5,
3, -4.474418, -6.712981, 0, -0.5, 0.5, 0.5,
3, -4.474418, -6.712981, 1, -0.5, 0.5, 0.5,
3, -4.474418, -6.712981, 1, 1.5, 0.5, 0.5,
3, -4.474418, -6.712981, 0, 1.5, 0.5, 0.5
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
-3.727244, -2, -5.8699,
-3.727244, 2, -5.8699,
-3.727244, -2, -5.8699,
-3.904849, -2, -6.150927,
-3.727244, 0, -5.8699,
-3.904849, 0, -6.150927,
-3.727244, 2, -5.8699,
-3.904849, 2, -6.150927
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
-4.260059, -2, -6.712981, 0, -0.5, 0.5, 0.5,
-4.260059, -2, -6.712981, 1, -0.5, 0.5, 0.5,
-4.260059, -2, -6.712981, 1, 1.5, 0.5, 0.5,
-4.260059, -2, -6.712981, 0, 1.5, 0.5, 0.5,
-4.260059, 0, -6.712981, 0, -0.5, 0.5, 0.5,
-4.260059, 0, -6.712981, 1, -0.5, 0.5, 0.5,
-4.260059, 0, -6.712981, 1, 1.5, 0.5, 0.5,
-4.260059, 0, -6.712981, 0, 1.5, 0.5, 0.5,
-4.260059, 2, -6.712981, 0, -0.5, 0.5, 0.5,
-4.260059, 2, -6.712981, 1, -0.5, 0.5, 0.5,
-4.260059, 2, -6.712981, 1, 1.5, 0.5, 0.5,
-4.260059, 2, -6.712981, 0, 1.5, 0.5, 0.5
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
-3.727244, -3.911254, -4,
-3.727244, -3.911254, 4,
-3.727244, -3.911254, -4,
-3.904849, -4.098976, -4,
-3.727244, -3.911254, -2,
-3.904849, -4.098976, -2,
-3.727244, -3.911254, 0,
-3.904849, -4.098976, 0,
-3.727244, -3.911254, 2,
-3.904849, -4.098976, 2,
-3.727244, -3.911254, 4,
-3.904849, -4.098976, 4
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
-4.260059, -4.474418, -4, 0, -0.5, 0.5, 0.5,
-4.260059, -4.474418, -4, 1, -0.5, 0.5, 0.5,
-4.260059, -4.474418, -4, 1, 1.5, 0.5, 0.5,
-4.260059, -4.474418, -4, 0, 1.5, 0.5, 0.5,
-4.260059, -4.474418, -2, 0, -0.5, 0.5, 0.5,
-4.260059, -4.474418, -2, 1, -0.5, 0.5, 0.5,
-4.260059, -4.474418, -2, 1, 1.5, 0.5, 0.5,
-4.260059, -4.474418, -2, 0, 1.5, 0.5, 0.5,
-4.260059, -4.474418, 0, 0, -0.5, 0.5, 0.5,
-4.260059, -4.474418, 0, 1, -0.5, 0.5, 0.5,
-4.260059, -4.474418, 0, 1, 1.5, 0.5, 0.5,
-4.260059, -4.474418, 0, 0, 1.5, 0.5, 0.5,
-4.260059, -4.474418, 2, 0, -0.5, 0.5, 0.5,
-4.260059, -4.474418, 2, 1, -0.5, 0.5, 0.5,
-4.260059, -4.474418, 2, 1, 1.5, 0.5, 0.5,
-4.260059, -4.474418, 2, 0, 1.5, 0.5, 0.5,
-4.260059, -4.474418, 4, 0, -0.5, 0.5, 0.5,
-4.260059, -4.474418, 4, 1, -0.5, 0.5, 0.5,
-4.260059, -4.474418, 4, 1, 1.5, 0.5, 0.5,
-4.260059, -4.474418, 4, 0, 1.5, 0.5, 0.5
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
-3.727244, -3.911254, -5.8699,
-3.727244, 3.59759, -5.8699,
-3.727244, -3.911254, 5.371187,
-3.727244, 3.59759, 5.371187,
-3.727244, -3.911254, -5.8699,
-3.727244, -3.911254, 5.371187,
-3.727244, 3.59759, -5.8699,
-3.727244, 3.59759, 5.371187,
-3.727244, -3.911254, -5.8699,
3.376961, -3.911254, -5.8699,
-3.727244, -3.911254, 5.371187,
3.376961, -3.911254, 5.371187,
-3.727244, 3.59759, -5.8699,
3.376961, 3.59759, -5.8699,
-3.727244, 3.59759, 5.371187,
3.376961, 3.59759, 5.371187,
3.376961, -3.911254, -5.8699,
3.376961, 3.59759, -5.8699,
3.376961, -3.911254, 5.371187,
3.376961, 3.59759, 5.371187,
3.376961, -3.911254, -5.8699,
3.376961, -3.911254, 5.371187,
3.376961, 3.59759, -5.8699,
3.376961, 3.59759, 5.371187
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
var radius = 8.154611;
var distance = 36.28078;
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
mvMatrix.translate( 0.1751417, 0.1568322, 0.2493563 );
mvMatrix.scale( 1.241086, 1.174205, 0.7843481 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.28078);
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
Sodium_dimethyldithi<-read.table("Sodium_dimethyldithi.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Sodium_dimethyldithi$V2
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_dimethyldithi' not found
```

```r
y<-Sodium_dimethyldithi$V3
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_dimethyldithi' not found
```

```r
z<-Sodium_dimethyldithi$V4
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_dimethyldithi' not found
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
-3.623785, -0.9111381, -2.405124, 0, 0, 1, 1, 1,
-3.002471, -0.94556, -2.291153, 1, 0, 0, 1, 1,
-2.962904, 0.9162303, -1.070337, 1, 0, 0, 1, 1,
-2.776476, -0.1415824, -0.7192304, 1, 0, 0, 1, 1,
-2.592611, -1.787867, -1.479582, 1, 0, 0, 1, 1,
-2.43347, -0.2136095, -1.300356, 1, 0, 0, 1, 1,
-2.433391, -0.1719327, -0.7529297, 0, 0, 0, 1, 1,
-2.370596, 0.1206449, -1.558586, 0, 0, 0, 1, 1,
-2.360826, 0.3158827, -1.917544, 0, 0, 0, 1, 1,
-2.33579, 1.579293, -2.080282, 0, 0, 0, 1, 1,
-2.322359, -0.6436885, -1.212673, 0, 0, 0, 1, 1,
-2.271764, -0.5779115, -1.649016, 0, 0, 0, 1, 1,
-2.148021, -0.410695, -0.8175419, 0, 0, 0, 1, 1,
-2.129746, -1.322763, -2.231955, 1, 1, 1, 1, 1,
-2.09048, -0.835254, -1.76166, 1, 1, 1, 1, 1,
-2.087502, -0.8180742, -2.183794, 1, 1, 1, 1, 1,
-2.011472, -0.4096552, -2.20092, 1, 1, 1, 1, 1,
-1.999533, -1.267607, -2.873118, 1, 1, 1, 1, 1,
-1.988317, 1.869821, -1.276076, 1, 1, 1, 1, 1,
-1.983773, 0.3260199, -0.4758916, 1, 1, 1, 1, 1,
-1.940364, -0.5004748, 0.6125829, 1, 1, 1, 1, 1,
-1.930577, -0.04474062, -1.648404, 1, 1, 1, 1, 1,
-1.928816, -0.8290953, -2.737744, 1, 1, 1, 1, 1,
-1.918982, -0.8605733, -2.81833, 1, 1, 1, 1, 1,
-1.915464, -0.133087, -1.262214, 1, 1, 1, 1, 1,
-1.890316, 0.07669799, -3.012407, 1, 1, 1, 1, 1,
-1.883331, 0.03874586, -2.217078, 1, 1, 1, 1, 1,
-1.863857, -0.6743212, -1.987811, 1, 1, 1, 1, 1,
-1.815099, 0.2293081, -1.441876, 0, 0, 1, 1, 1,
-1.805105, 0.2126318, -1.262563, 1, 0, 0, 1, 1,
-1.793467, -1.159829, -1.33543, 1, 0, 0, 1, 1,
-1.78661, 0.8315219, -0.7422071, 1, 0, 0, 1, 1,
-1.777229, -1.28111, -2.215245, 1, 0, 0, 1, 1,
-1.77588, -0.8729239, -0.7532201, 1, 0, 0, 1, 1,
-1.770032, 0.7091253, -1.751424, 0, 0, 0, 1, 1,
-1.769992, 1.591945, 0.2967284, 0, 0, 0, 1, 1,
-1.764564, -0.05999486, 0.306929, 0, 0, 0, 1, 1,
-1.760042, 0.7357056, -2.153616, 0, 0, 0, 1, 1,
-1.739469, -1.273404, -3.507633, 0, 0, 0, 1, 1,
-1.726718, 0.4891829, -0.3242799, 0, 0, 0, 1, 1,
-1.716081, -0.2130983, -2.980778, 0, 0, 0, 1, 1,
-1.712004, 0.2337632, -1.561018, 1, 1, 1, 1, 1,
-1.708278, 0.4563999, -1.35424, 1, 1, 1, 1, 1,
-1.707241, -1.257352, -1.612655, 1, 1, 1, 1, 1,
-1.691416, -0.9110228, -2.534895, 1, 1, 1, 1, 1,
-1.671491, -0.3312176, -3.150488, 1, 1, 1, 1, 1,
-1.661078, 1.019776, -1.623728, 1, 1, 1, 1, 1,
-1.657977, -0.1771055, -1.953093, 1, 1, 1, 1, 1,
-1.642303, -0.1569124, -1.644674, 1, 1, 1, 1, 1,
-1.639623, 0.2281711, -2.679316, 1, 1, 1, 1, 1,
-1.603106, 0.2678529, -2.256943, 1, 1, 1, 1, 1,
-1.595912, 0.7230335, -2.210084, 1, 1, 1, 1, 1,
-1.594957, -1.930124, -1.02622, 1, 1, 1, 1, 1,
-1.589079, 0.3639928, -2.632811, 1, 1, 1, 1, 1,
-1.584546, 0.05004992, -1.055274, 1, 1, 1, 1, 1,
-1.559806, 0.1022168, -1.046954, 1, 1, 1, 1, 1,
-1.55858, -0.08737903, -1.799688, 0, 0, 1, 1, 1,
-1.548102, -0.1384252, -2.056678, 1, 0, 0, 1, 1,
-1.540829, -0.3973254, -1.406162, 1, 0, 0, 1, 1,
-1.534101, 1.812149, -1.083816, 1, 0, 0, 1, 1,
-1.533989, -0.5083188, -1.724634, 1, 0, 0, 1, 1,
-1.507661, -0.08648735, 0.002077248, 1, 0, 0, 1, 1,
-1.505566, -0.4550091, -1.310599, 0, 0, 0, 1, 1,
-1.502171, -0.2161669, -1.424219, 0, 0, 0, 1, 1,
-1.49686, -0.9441146, -1.761289, 0, 0, 0, 1, 1,
-1.483439, -0.01978603, -1.962232, 0, 0, 0, 1, 1,
-1.481381, -0.5013033, -1.093278, 0, 0, 0, 1, 1,
-1.470305, 1.208507, -0.3544769, 0, 0, 0, 1, 1,
-1.468668, 0.3689163, -0.9148378, 0, 0, 0, 1, 1,
-1.465097, 2.326807, 0.1379457, 1, 1, 1, 1, 1,
-1.444085, -1.405885, -0.8311174, 1, 1, 1, 1, 1,
-1.433449, -0.8889527, -3.93317, 1, 1, 1, 1, 1,
-1.388649, -0.1772009, -2.36009, 1, 1, 1, 1, 1,
-1.367981, -0.5182541, -1.94972, 1, 1, 1, 1, 1,
-1.347265, 0.9400735, -2.245676, 1, 1, 1, 1, 1,
-1.345633, -1.293497, -1.817769, 1, 1, 1, 1, 1,
-1.324541, 1.588069, -2.474417, 1, 1, 1, 1, 1,
-1.321112, -0.626209, -2.238885, 1, 1, 1, 1, 1,
-1.314174, -2.727813, -1.531225, 1, 1, 1, 1, 1,
-1.312393, 0.8717132, -2.28724, 1, 1, 1, 1, 1,
-1.306015, -0.1750291, -2.6651, 1, 1, 1, 1, 1,
-1.2933, 0.02689817, -0.03368588, 1, 1, 1, 1, 1,
-1.288677, 1.428846, -1.431606, 1, 1, 1, 1, 1,
-1.284196, 1.044002, -0.6617166, 1, 1, 1, 1, 1,
-1.283035, -0.9935034, -3.165863, 0, 0, 1, 1, 1,
-1.280946, 0.1352997, -2.48767, 1, 0, 0, 1, 1,
-1.279352, 0.4287407, -1.765661, 1, 0, 0, 1, 1,
-1.269228, 0.6434989, -2.822983, 1, 0, 0, 1, 1,
-1.255153, 0.6147307, -1.123939, 1, 0, 0, 1, 1,
-1.254338, -2.20974, -3.916623, 1, 0, 0, 1, 1,
-1.250586, -0.0870377, -0.8804796, 0, 0, 0, 1, 1,
-1.24968, -0.3823205, -0.6943038, 0, 0, 0, 1, 1,
-1.247502, 0.2924573, -0.3969608, 0, 0, 0, 1, 1,
-1.236336, -0.2080282, -2.924735, 0, 0, 0, 1, 1,
-1.23518, 0.7339288, -1.285401, 0, 0, 0, 1, 1,
-1.231242, 1.586748, -0.3368203, 0, 0, 0, 1, 1,
-1.231093, 0.6470388, -1.112654, 0, 0, 0, 1, 1,
-1.230057, -1.241307, -2.797653, 1, 1, 1, 1, 1,
-1.226602, -1.679014, -2.147861, 1, 1, 1, 1, 1,
-1.226474, -0.8853257, -2.109343, 1, 1, 1, 1, 1,
-1.224396, -1.819498, -3.009039, 1, 1, 1, 1, 1,
-1.223655, 0.0003933809, -1.23353, 1, 1, 1, 1, 1,
-1.221407, 0.52152, -2.509643, 1, 1, 1, 1, 1,
-1.216768, 0.3507739, -0.3587036, 1, 1, 1, 1, 1,
-1.212831, 0.523958, -1.215538, 1, 1, 1, 1, 1,
-1.211409, 0.1479838, -2.108446, 1, 1, 1, 1, 1,
-1.206758, 0.2504784, -3.241104, 1, 1, 1, 1, 1,
-1.202453, 0.4521343, -0.7158594, 1, 1, 1, 1, 1,
-1.202389, -1.321911, -1.319612, 1, 1, 1, 1, 1,
-1.198104, 0.5175356, 0.6871185, 1, 1, 1, 1, 1,
-1.191619, -0.6426429, -1.882752, 1, 1, 1, 1, 1,
-1.184218, -0.392776, -2.496285, 1, 1, 1, 1, 1,
-1.166104, -0.4337357, -3.494728, 0, 0, 1, 1, 1,
-1.16357, -0.6924424, -1.067711, 1, 0, 0, 1, 1,
-1.161977, -0.893647, -4.00513, 1, 0, 0, 1, 1,
-1.158587, -0.0815361, -0.4339188, 1, 0, 0, 1, 1,
-1.153936, -0.5724803, -0.652325, 1, 0, 0, 1, 1,
-1.153703, -1.346789, -1.268291, 1, 0, 0, 1, 1,
-1.14177, 1.739267, -2.247943, 0, 0, 0, 1, 1,
-1.138903, 0.5525159, -2.209702, 0, 0, 0, 1, 1,
-1.135896, 0.4681218, -0.6686522, 0, 0, 0, 1, 1,
-1.132474, -1.217767, -2.00392, 0, 0, 0, 1, 1,
-1.132396, -0.8722858, -3.566738, 0, 0, 0, 1, 1,
-1.129166, -2.410571, -4.119862, 0, 0, 0, 1, 1,
-1.127963, -0.4315009, -2.200743, 0, 0, 0, 1, 1,
-1.117858, -0.8229611, -1.451407, 1, 1, 1, 1, 1,
-1.117241, 0.7273734, -1.713521, 1, 1, 1, 1, 1,
-1.113763, 2.020838, -1.352859, 1, 1, 1, 1, 1,
-1.112195, 0.07738862, -0.6000398, 1, 1, 1, 1, 1,
-1.109889, -0.4315233, -2.568303, 1, 1, 1, 1, 1,
-1.104439, -1.172828, -3.304399, 1, 1, 1, 1, 1,
-1.09971, 0.4307393, -1.586917, 1, 1, 1, 1, 1,
-1.099265, -1.167232, -1.425015, 1, 1, 1, 1, 1,
-1.097376, -1.326666, -2.873818, 1, 1, 1, 1, 1,
-1.091214, -1.852024, -2.136339, 1, 1, 1, 1, 1,
-1.08604, -0.6251544, -4.691909, 1, 1, 1, 1, 1,
-1.064817, 0.2935117, -1.164832, 1, 1, 1, 1, 1,
-1.06417, -0.05515752, -2.602422, 1, 1, 1, 1, 1,
-1.062443, -0.3371781, -2.370878, 1, 1, 1, 1, 1,
-1.058646, 1.032212, -0.9383729, 1, 1, 1, 1, 1,
-1.052053, -0.576611, -1.981146, 0, 0, 1, 1, 1,
-1.047523, 0.03506663, -1.662657, 1, 0, 0, 1, 1,
-1.03337, -1.176627, -2.576788, 1, 0, 0, 1, 1,
-1.022906, -0.3602787, -1.297518, 1, 0, 0, 1, 1,
-1.021341, -0.9847157, -0.7337781, 1, 0, 0, 1, 1,
-1.021161, -1.354364, -3.719277, 1, 0, 0, 1, 1,
-1.019894, -0.8854413, -1.097817, 0, 0, 0, 1, 1,
-1.015223, 1.358221, -1.85034, 0, 0, 0, 1, 1,
-1.013019, -1.304276, -3.300819, 0, 0, 0, 1, 1,
-1.004052, -0.0586523, -2.982069, 0, 0, 0, 1, 1,
-0.9916732, 1.069457, -0.9440387, 0, 0, 0, 1, 1,
-0.9874701, -1.133791, -1.823043, 0, 0, 0, 1, 1,
-0.981377, -0.6086042, -3.892071, 0, 0, 0, 1, 1,
-0.975671, 0.2243112, -2.993427, 1, 1, 1, 1, 1,
-0.9725264, 0.8078196, -1.34237, 1, 1, 1, 1, 1,
-0.9676869, -0.7846694, -3.849141, 1, 1, 1, 1, 1,
-0.9655542, -1.840744, -0.8593006, 1, 1, 1, 1, 1,
-0.952171, -1.121565, -3.563167, 1, 1, 1, 1, 1,
-0.9495772, -0.6055548, -2.316492, 1, 1, 1, 1, 1,
-0.9453005, 0.09224296, -1.678619, 1, 1, 1, 1, 1,
-0.9436343, 1.318926, 0.3148151, 1, 1, 1, 1, 1,
-0.9333304, 1.539996, 0.2078639, 1, 1, 1, 1, 1,
-0.9312959, -0.04993873, -0.9314788, 1, 1, 1, 1, 1,
-0.9298906, 0.4364431, -2.517626, 1, 1, 1, 1, 1,
-0.9175553, 0.3660488, -1.120424, 1, 1, 1, 1, 1,
-0.912632, 0.07610002, -0.711388, 1, 1, 1, 1, 1,
-0.9110261, -0.6879511, -2.696922, 1, 1, 1, 1, 1,
-0.9106617, 0.6757953, 0.03349299, 1, 1, 1, 1, 1,
-0.9096524, -1.23443, -3.33027, 0, 0, 1, 1, 1,
-0.9061792, 0.3228763, -0.4256541, 1, 0, 0, 1, 1,
-0.9032385, 0.232815, -0.5448012, 1, 0, 0, 1, 1,
-0.9003393, 0.7311945, -0.6639957, 1, 0, 0, 1, 1,
-0.9001105, 0.2150395, -1.019576, 1, 0, 0, 1, 1,
-0.8997062, 1.062904, -0.467996, 1, 0, 0, 1, 1,
-0.8990388, 1.096078, 1.196064, 0, 0, 0, 1, 1,
-0.8969659, -0.152744, -2.75947, 0, 0, 0, 1, 1,
-0.8912949, -0.1744463, -2.358973, 0, 0, 0, 1, 1,
-0.8906731, -2.176522, -1.270982, 0, 0, 0, 1, 1,
-0.8857162, -0.916295, -3.773149, 0, 0, 0, 1, 1,
-0.8792208, -0.129878, 0.1067856, 0, 0, 0, 1, 1,
-0.8787385, 0.6643787, 0.2671382, 0, 0, 0, 1, 1,
-0.8754957, -0.6268101, -3.276201, 1, 1, 1, 1, 1,
-0.8712801, -0.01140114, 0.3309705, 1, 1, 1, 1, 1,
-0.8704556, 1.195907, -0.9703039, 1, 1, 1, 1, 1,
-0.8636954, -0.7403411, -1.57633, 1, 1, 1, 1, 1,
-0.8610726, 0.5482248, -1.471342, 1, 1, 1, 1, 1,
-0.8599702, 0.3512892, -1.588215, 1, 1, 1, 1, 1,
-0.8580498, 0.5188025, -1.745875, 1, 1, 1, 1, 1,
-0.8541556, 0.8625489, -0.3118399, 1, 1, 1, 1, 1,
-0.8537889, -1.775025, -0.08062961, 1, 1, 1, 1, 1,
-0.8519109, 0.572522, -2.013768, 1, 1, 1, 1, 1,
-0.8506643, -0.2905841, -2.502234, 1, 1, 1, 1, 1,
-0.8420779, 0.8031519, 0.2923982, 1, 1, 1, 1, 1,
-0.8397011, -0.3624057, -2.930419, 1, 1, 1, 1, 1,
-0.835647, -1.009359, -4.127082, 1, 1, 1, 1, 1,
-0.8354185, -0.3432537, -0.9300388, 1, 1, 1, 1, 1,
-0.8336309, -0.7723595, -3.81338, 0, 0, 1, 1, 1,
-0.8264928, 0.759604, 1.071966, 1, 0, 0, 1, 1,
-0.8246113, 1.62651, -0.2913465, 1, 0, 0, 1, 1,
-0.8245893, 1.446251, -0.5220846, 1, 0, 0, 1, 1,
-0.8238394, -0.2988375, -1.734385, 1, 0, 0, 1, 1,
-0.823375, -1.285067, -3.389317, 1, 0, 0, 1, 1,
-0.8186728, -1.416684, -2.531907, 0, 0, 0, 1, 1,
-0.8173535, 1.370316, 1.136288, 0, 0, 0, 1, 1,
-0.8169083, 1.112453, -1.218289, 0, 0, 0, 1, 1,
-0.8155149, -0.5737964, -1.608424, 0, 0, 0, 1, 1,
-0.8115591, 0.5709834, -2.089428, 0, 0, 0, 1, 1,
-0.8052088, -0.05966595, -3.055013, 0, 0, 0, 1, 1,
-0.8031175, 1.370075, -0.8673925, 0, 0, 0, 1, 1,
-0.7999031, -1.449176, -1.651018, 1, 1, 1, 1, 1,
-0.7986227, 0.936537, -2.163378, 1, 1, 1, 1, 1,
-0.7985904, -0.7693864, -1.873546, 1, 1, 1, 1, 1,
-0.7912759, 1.086843, 0.1946685, 1, 1, 1, 1, 1,
-0.7859007, -2.798995, -3.11146, 1, 1, 1, 1, 1,
-0.7824743, 0.7146446, -0.5986293, 1, 1, 1, 1, 1,
-0.7778674, -0.1116048, -0.3528558, 1, 1, 1, 1, 1,
-0.7732616, 0.8452363, -0.3919557, 1, 1, 1, 1, 1,
-0.7704471, 0.1137263, -2.162648, 1, 1, 1, 1, 1,
-0.7703362, -0.831059, -2.87137, 1, 1, 1, 1, 1,
-0.7664893, -0.021727, -0.7671875, 1, 1, 1, 1, 1,
-0.763599, 1.551012, -0.2474883, 1, 1, 1, 1, 1,
-0.7624936, -0.5130789, 0.3734248, 1, 1, 1, 1, 1,
-0.7571601, -1.167202, -2.524625, 1, 1, 1, 1, 1,
-0.7560092, -0.7341903, -3.026307, 1, 1, 1, 1, 1,
-0.7497283, 0.4246884, -0.5488777, 0, 0, 1, 1, 1,
-0.7480594, 0.4369149, 0.6331183, 1, 0, 0, 1, 1,
-0.7468452, -0.6482797, -1.08903, 1, 0, 0, 1, 1,
-0.7465525, 1.014581, 0.6779237, 1, 0, 0, 1, 1,
-0.7453541, 0.1151977, -1.438149, 1, 0, 0, 1, 1,
-0.7450022, -0.7187315, -2.468822, 1, 0, 0, 1, 1,
-0.7431267, -1.465871, -2.698468, 0, 0, 0, 1, 1,
-0.7422336, -0.7406495, -1.758674, 0, 0, 0, 1, 1,
-0.7394926, -1.012727, -3.046438, 0, 0, 0, 1, 1,
-0.7384068, -2.397933, -3.451906, 0, 0, 0, 1, 1,
-0.7266637, 0.3438338, -2.11617, 0, 0, 0, 1, 1,
-0.7232874, -1.782919, -0.9645056, 0, 0, 0, 1, 1,
-0.7136864, -1.396339, -3.39339, 0, 0, 0, 1, 1,
-0.7123337, -0.893007, -2.214972, 1, 1, 1, 1, 1,
-0.7056892, -0.0969111, -2.411845, 1, 1, 1, 1, 1,
-0.705394, 0.02145625, -1.147014, 1, 1, 1, 1, 1,
-0.704451, 0.1619401, -0.4064852, 1, 1, 1, 1, 1,
-0.7033362, -0.02520965, -1.34674, 1, 1, 1, 1, 1,
-0.702284, -0.3093666, -0.532559, 1, 1, 1, 1, 1,
-0.6893633, -1.603983, -1.846107, 1, 1, 1, 1, 1,
-0.6832188, -0.06479113, -2.320479, 1, 1, 1, 1, 1,
-0.6828009, 0.405082, -0.6089249, 1, 1, 1, 1, 1,
-0.6752375, 0.221351, -2.91644, 1, 1, 1, 1, 1,
-0.6696392, 0.1902462, -0.3575606, 1, 1, 1, 1, 1,
-0.6685911, -0.403689, -2.425723, 1, 1, 1, 1, 1,
-0.6674767, 0.3675534, -1.519498, 1, 1, 1, 1, 1,
-0.6629979, 1.023141, -2.730263, 1, 1, 1, 1, 1,
-0.6609983, 0.4508177, -1.828383, 1, 1, 1, 1, 1,
-0.6594861, -0.367386, -2.090675, 0, 0, 1, 1, 1,
-0.6526025, 0.973631, 1.465443, 1, 0, 0, 1, 1,
-0.6494106, 0.9934054, 1.069954, 1, 0, 0, 1, 1,
-0.6464138, -0.8141275, -1.679448, 1, 0, 0, 1, 1,
-0.6456164, -0.2940398, -0.6999207, 1, 0, 0, 1, 1,
-0.6426305, 0.8328459, 0.6109614, 1, 0, 0, 1, 1,
-0.6392073, -0.26138, -0.1708002, 0, 0, 0, 1, 1,
-0.6307899, -0.7591835, -2.443257, 0, 0, 0, 1, 1,
-0.6240194, -0.1142671, -1.942095, 0, 0, 0, 1, 1,
-0.6235114, 0.9649898, 0.1105588, 0, 0, 0, 1, 1,
-0.6176469, 0.7371574, -0.7895916, 0, 0, 0, 1, 1,
-0.6158016, -0.03665324, -2.317327, 0, 0, 0, 1, 1,
-0.6153037, -0.5943339, -1.211161, 0, 0, 0, 1, 1,
-0.6013641, -0.9925483, -0.5074524, 1, 1, 1, 1, 1,
-0.5994557, 0.5631722, 1.69425, 1, 1, 1, 1, 1,
-0.5976219, -1.223143, -2.054827, 1, 1, 1, 1, 1,
-0.5885605, 0.1562253, -1.110788, 1, 1, 1, 1, 1,
-0.5876541, -1.489644, -2.504873, 1, 1, 1, 1, 1,
-0.5864815, -0.8894364, -3.198286, 1, 1, 1, 1, 1,
-0.5845206, 1.034402, -0.9054543, 1, 1, 1, 1, 1,
-0.5778388, -0.4456847, -1.392812, 1, 1, 1, 1, 1,
-0.5774288, -0.8645104, -2.865198, 1, 1, 1, 1, 1,
-0.5707579, -0.2150124, -2.496903, 1, 1, 1, 1, 1,
-0.5671229, 1.284965, -1.419783, 1, 1, 1, 1, 1,
-0.5608851, -0.01317232, -1.729882, 1, 1, 1, 1, 1,
-0.560433, -0.04696641, -3.068443, 1, 1, 1, 1, 1,
-0.5532026, -1.41669, -2.077083, 1, 1, 1, 1, 1,
-0.5526729, 0.3499491, -0.7727919, 1, 1, 1, 1, 1,
-0.5487479, 0.8005399, 0.8661331, 0, 0, 1, 1, 1,
-0.5475808, 0.1893053, -2.80004, 1, 0, 0, 1, 1,
-0.544138, 0.9486021, -1.557599, 1, 0, 0, 1, 1,
-0.5413724, 0.2984667, 0.126293, 1, 0, 0, 1, 1,
-0.5413011, -0.08035235, -1.702563, 1, 0, 0, 1, 1,
-0.5370086, 0.2647927, -1.071824, 1, 0, 0, 1, 1,
-0.5320432, 1.038285, -1.59155, 0, 0, 0, 1, 1,
-0.5314404, 0.1340498, -0.1100823, 0, 0, 0, 1, 1,
-0.5314334, -2.938471, -4.34357, 0, 0, 0, 1, 1,
-0.5267151, -0.7856911, -1.520744, 0, 0, 0, 1, 1,
-0.5225558, -0.006874369, -0.0798454, 0, 0, 0, 1, 1,
-0.5208095, 0.1164114, -1.107474, 0, 0, 0, 1, 1,
-0.5190232, 0.5609609, -0.5014636, 0, 0, 0, 1, 1,
-0.5183049, 1.874321, -1.368885, 1, 1, 1, 1, 1,
-0.5120367, 0.9941671, 0.7721967, 1, 1, 1, 1, 1,
-0.5092923, 0.3529103, -0.9907761, 1, 1, 1, 1, 1,
-0.5038421, -0.4090986, -2.632865, 1, 1, 1, 1, 1,
-0.5014562, 0.2327672, -1.49239, 1, 1, 1, 1, 1,
-0.4989279, 0.6337909, -1.604754, 1, 1, 1, 1, 1,
-0.4979262, -0.2168337, -2.117938, 1, 1, 1, 1, 1,
-0.4940527, 1.448717, 0.844313, 1, 1, 1, 1, 1,
-0.4917111, -1.210312, -2.05656, 1, 1, 1, 1, 1,
-0.4854735, -0.3194993, -2.642044, 1, 1, 1, 1, 1,
-0.4809371, 2.348406, -0.2544007, 1, 1, 1, 1, 1,
-0.478554, -0.8578022, -3.303137, 1, 1, 1, 1, 1,
-0.4768365, -1.388216, -1.849577, 1, 1, 1, 1, 1,
-0.4762366, -0.618305, -2.331291, 1, 1, 1, 1, 1,
-0.4695673, 1.655905, 0.6113774, 1, 1, 1, 1, 1,
-0.4695084, 0.6912158, 0.7886882, 0, 0, 1, 1, 1,
-0.4693587, 1.657803, 0.9097895, 1, 0, 0, 1, 1,
-0.4685731, -0.6563143, -1.422889, 1, 0, 0, 1, 1,
-0.4658465, 0.4466512, 0.7925012, 1, 0, 0, 1, 1,
-0.4639233, 0.1411155, 0.1463185, 1, 0, 0, 1, 1,
-0.4637605, 0.5371076, -1.766854, 1, 0, 0, 1, 1,
-0.4556701, -0.4791442, -2.207974, 0, 0, 0, 1, 1,
-0.455369, 0.1413432, -0.2992865, 0, 0, 0, 1, 1,
-0.4548313, 1.344696, -1.260245, 0, 0, 0, 1, 1,
-0.4531012, 0.3429276, -1.070316, 0, 0, 0, 1, 1,
-0.4529067, -0.1500473, -2.534899, 0, 0, 0, 1, 1,
-0.4515299, -1.194128, -2.478955, 0, 0, 0, 1, 1,
-0.4504353, -0.4053549, -1.456382, 0, 0, 0, 1, 1,
-0.4502099, 0.3028403, -1.830383, 1, 1, 1, 1, 1,
-0.4498458, -0.8870449, -1.345488, 1, 1, 1, 1, 1,
-0.4488302, 1.950927, -0.1075034, 1, 1, 1, 1, 1,
-0.4452967, -2.029244, -3.325499, 1, 1, 1, 1, 1,
-0.4411791, 1.508245, -0.04357383, 1, 1, 1, 1, 1,
-0.4395683, 0.1323319, -1.628794, 1, 1, 1, 1, 1,
-0.43881, 1.191, -1.237647, 1, 1, 1, 1, 1,
-0.4380588, -0.06212075, -2.371599, 1, 1, 1, 1, 1,
-0.4379398, 0.2440377, -0.4338983, 1, 1, 1, 1, 1,
-0.435833, 2.631335, -1.235985, 1, 1, 1, 1, 1,
-0.430794, 0.5057406, -0.6762357, 1, 1, 1, 1, 1,
-0.4307212, 0.4581974, -2.235126, 1, 1, 1, 1, 1,
-0.4263172, 1.610752, -0.964335, 1, 1, 1, 1, 1,
-0.4256741, -0.7013511, -2.594342, 1, 1, 1, 1, 1,
-0.4214284, -0.6823229, -2.384297, 1, 1, 1, 1, 1,
-0.4194741, -0.06977917, -1.122503, 0, 0, 1, 1, 1,
-0.4117364, 0.4131867, -0.4394648, 1, 0, 0, 1, 1,
-0.410943, -1.348955, -5.706194, 1, 0, 0, 1, 1,
-0.4096827, 0.796874, 0.1807922, 1, 0, 0, 1, 1,
-0.4080105, -1.66331, -3.651345, 1, 0, 0, 1, 1,
-0.4059818, -1.1129, -3.37208, 1, 0, 0, 1, 1,
-0.4050144, -0.1494628, -1.867654, 0, 0, 0, 1, 1,
-0.4031792, -0.07596704, -2.40912, 0, 0, 0, 1, 1,
-0.3992504, -0.1339366, -0.6105912, 0, 0, 0, 1, 1,
-0.3981873, 1.114741, -1.429509, 0, 0, 0, 1, 1,
-0.397588, 0.238071, -2.199627, 0, 0, 0, 1, 1,
-0.3961334, -0.8694925, -1.845623, 0, 0, 0, 1, 1,
-0.3946626, -0.32822, -1.343542, 0, 0, 0, 1, 1,
-0.3909704, 0.7539406, 0.3826631, 1, 1, 1, 1, 1,
-0.3882048, -0.200748, -0.5087804, 1, 1, 1, 1, 1,
-0.3847005, -0.002477609, -0.1940695, 1, 1, 1, 1, 1,
-0.3809198, -0.1929137, -3.065233, 1, 1, 1, 1, 1,
-0.3756836, 1.750122, 1.18941, 1, 1, 1, 1, 1,
-0.3740617, 0.8376529, 0.2094534, 1, 1, 1, 1, 1,
-0.3736664, 0.5574667, 0.1178096, 1, 1, 1, 1, 1,
-0.3732677, -0.4676136, -3.068875, 1, 1, 1, 1, 1,
-0.373004, -0.5628638, -1.089042, 1, 1, 1, 1, 1,
-0.364117, 2.591015, -1.21639, 1, 1, 1, 1, 1,
-0.3602391, -0.5450409, -2.215714, 1, 1, 1, 1, 1,
-0.3561977, 1.735081, -1.117474, 1, 1, 1, 1, 1,
-0.3510174, -0.8613358, -3.199348, 1, 1, 1, 1, 1,
-0.344944, -0.9917989, -4.112674, 1, 1, 1, 1, 1,
-0.3435231, 0.09779787, -0.9339733, 1, 1, 1, 1, 1,
-0.3432913, 0.6149766, 0.004243586, 0, 0, 1, 1, 1,
-0.34271, -0.824993, -3.510213, 1, 0, 0, 1, 1,
-0.3380489, 0.6954865, -1.274701, 1, 0, 0, 1, 1,
-0.3371859, 1.085614, -1.105887, 1, 0, 0, 1, 1,
-0.3356554, -0.7871915, -1.373815, 1, 0, 0, 1, 1,
-0.3342651, -1.172181, -2.684092, 1, 0, 0, 1, 1,
-0.3341475, -1.274493, -1.185096, 0, 0, 0, 1, 1,
-0.3339047, -0.8011849, -2.640073, 0, 0, 0, 1, 1,
-0.3330408, -0.4218908, -1.991879, 0, 0, 0, 1, 1,
-0.3312057, -0.3826529, -1.03024, 0, 0, 0, 1, 1,
-0.3289552, 0.641817, 0.3006467, 0, 0, 0, 1, 1,
-0.324807, 0.3219901, -0.5681008, 0, 0, 0, 1, 1,
-0.3238127, 0.9390709, -2.601138, 0, 0, 0, 1, 1,
-0.3221258, 0.5337079, -1.279306, 1, 1, 1, 1, 1,
-0.3169863, -0.6550619, -2.881811, 1, 1, 1, 1, 1,
-0.3144019, -1.749463, -2.069524, 1, 1, 1, 1, 1,
-0.3131041, -0.001964425, -1.686094, 1, 1, 1, 1, 1,
-0.3067078, -1.824733, -1.797325, 1, 1, 1, 1, 1,
-0.3057631, -2.019771, -2.046604, 1, 1, 1, 1, 1,
-0.3036112, -0.7116194, -2.150547, 1, 1, 1, 1, 1,
-0.3034013, -0.9934725, -1.700597, 1, 1, 1, 1, 1,
-0.3028686, -0.3106719, -2.573164, 1, 1, 1, 1, 1,
-0.3022094, -0.4175887, -3.459994, 1, 1, 1, 1, 1,
-0.3000799, 0.7219344, -0.9747627, 1, 1, 1, 1, 1,
-0.2997306, -0.4134459, -2.34523, 1, 1, 1, 1, 1,
-0.2960597, 1.21424, 0.1667336, 1, 1, 1, 1, 1,
-0.2950887, 0.3629481, 0.2687842, 1, 1, 1, 1, 1,
-0.2945353, 0.2711149, -1.447616, 1, 1, 1, 1, 1,
-0.2927339, 0.5659419, 0.0006404631, 0, 0, 1, 1, 1,
-0.2877276, -0.8470996, -2.499996, 1, 0, 0, 1, 1,
-0.2867912, -0.5703286, -3.891757, 1, 0, 0, 1, 1,
-0.286686, 1.280089, 0.4671829, 1, 0, 0, 1, 1,
-0.2836377, -0.9594251, -1.805573, 1, 0, 0, 1, 1,
-0.2703476, -0.09620992, -1.894518, 1, 0, 0, 1, 1,
-0.269743, 0.6145067, -1.938416, 0, 0, 0, 1, 1,
-0.2687958, 1.076037, -0.4343874, 0, 0, 0, 1, 1,
-0.2614308, -0.8762293, -1.762004, 0, 0, 0, 1, 1,
-0.2591473, 0.8579322, -0.5383421, 0, 0, 0, 1, 1,
-0.2591059, -0.9653424, -4.25221, 0, 0, 0, 1, 1,
-0.2529805, -1.632417, -2.873165, 0, 0, 0, 1, 1,
-0.2513165, -0.9527591, -4.672188, 0, 0, 0, 1, 1,
-0.2458394, -0.7160966, -2.484723, 1, 1, 1, 1, 1,
-0.2399033, 0.7481848, -0.8877004, 1, 1, 1, 1, 1,
-0.2398891, 1.09297, -1.537188, 1, 1, 1, 1, 1,
-0.239571, -0.1387164, -1.483618, 1, 1, 1, 1, 1,
-0.2369349, -1.450598, -2.76289, 1, 1, 1, 1, 1,
-0.23626, -0.4827381, -3.682166, 1, 1, 1, 1, 1,
-0.2353036, 0.3035538, -0.39333, 1, 1, 1, 1, 1,
-0.232873, -0.7190363, -4.362381, 1, 1, 1, 1, 1,
-0.2302132, 1.697654, 1.083562, 1, 1, 1, 1, 1,
-0.2296004, 1.338104, -0.0402499, 1, 1, 1, 1, 1,
-0.2290737, 0.3571689, -2.189561, 1, 1, 1, 1, 1,
-0.2249073, 0.7603655, -2.015206, 1, 1, 1, 1, 1,
-0.2221592, -1.674496, -3.830272, 1, 1, 1, 1, 1,
-0.2162451, -0.6667768, -5.171503, 1, 1, 1, 1, 1,
-0.2138786, 1.629088, -0.3513233, 1, 1, 1, 1, 1,
-0.209113, -1.179157, -3.633209, 0, 0, 1, 1, 1,
-0.2042201, 1.073529, 1.965513, 1, 0, 0, 1, 1,
-0.2031225, 0.4670655, -1.25706, 1, 0, 0, 1, 1,
-0.2026855, -0.4202432, -1.753695, 1, 0, 0, 1, 1,
-0.196313, 0.0748752, -1.560089, 1, 0, 0, 1, 1,
-0.1950592, 1.533706, 0.514713, 1, 0, 0, 1, 1,
-0.1942143, 3.488238, 0.7606653, 0, 0, 0, 1, 1,
-0.191759, 2.228256, 1.115207, 0, 0, 0, 1, 1,
-0.1856772, 1.426227, -0.6788217, 0, 0, 0, 1, 1,
-0.18222, -0.3155918, -2.080161, 0, 0, 0, 1, 1,
-0.1815738, -0.9070534, -2.866122, 0, 0, 0, 1, 1,
-0.1796274, -0.4263627, -4.056942, 0, 0, 0, 1, 1,
-0.1767575, -0.9359686, -3.335524, 0, 0, 0, 1, 1,
-0.1761957, 0.2395333, -1.757239, 1, 1, 1, 1, 1,
-0.1726805, 0.855693, -0.2640315, 1, 1, 1, 1, 1,
-0.1722391, -0.05602253, -1.136191, 1, 1, 1, 1, 1,
-0.171571, -0.4079063, -3.481632, 1, 1, 1, 1, 1,
-0.1706809, 1.695542, 0.2099431, 1, 1, 1, 1, 1,
-0.170482, 0.3152224, -0.512457, 1, 1, 1, 1, 1,
-0.1698314, -0.1438945, -3.685804, 1, 1, 1, 1, 1,
-0.1652333, 0.3745555, -1.281842, 1, 1, 1, 1, 1,
-0.1640927, -1.318483, -3.271135, 1, 1, 1, 1, 1,
-0.163946, -0.8252049, -1.21744, 1, 1, 1, 1, 1,
-0.1613215, -0.3869531, -1.465406, 1, 1, 1, 1, 1,
-0.1610731, 0.6227534, -0.08648004, 1, 1, 1, 1, 1,
-0.1599185, 0.03548502, -1.11217, 1, 1, 1, 1, 1,
-0.1538017, -0.5998911, -2.850038, 1, 1, 1, 1, 1,
-0.1497138, 2.047116, 1.130802, 1, 1, 1, 1, 1,
-0.1497008, 0.04958052, -1.792473, 0, 0, 1, 1, 1,
-0.1496199, -0.1241359, -0.398121, 1, 0, 0, 1, 1,
-0.1491281, -1.014228, -3.724548, 1, 0, 0, 1, 1,
-0.1461258, -1.826412, -5.005666, 1, 0, 0, 1, 1,
-0.1436219, -0.2317858, -0.2910112, 1, 0, 0, 1, 1,
-0.1378528, 1.420167, -1.053681, 1, 0, 0, 1, 1,
-0.1330174, 0.5676101, -2.138438, 0, 0, 0, 1, 1,
-0.1295386, 0.5275242, 1.417449, 0, 0, 0, 1, 1,
-0.1245789, 2.066701, -0.7311667, 0, 0, 0, 1, 1,
-0.1235729, 0.726806, 0.6573639, 0, 0, 0, 1, 1,
-0.123328, -1.653044, -3.509578, 0, 0, 0, 1, 1,
-0.1231949, 0.9147984, 0.9367498, 0, 0, 0, 1, 1,
-0.1215702, 0.06319971, -3.388766, 0, 0, 0, 1, 1,
-0.1183823, 0.2838951, 0.4095891, 1, 1, 1, 1, 1,
-0.1142644, 0.2976297, 1.391246, 1, 1, 1, 1, 1,
-0.1141924, 0.2258915, 0.660951, 1, 1, 1, 1, 1,
-0.1141793, 0.6292004, -0.09636287, 1, 1, 1, 1, 1,
-0.1097727, -0.6341462, -3.510181, 1, 1, 1, 1, 1,
-0.1032667, 1.826586, -0.1966037, 1, 1, 1, 1, 1,
-0.1016716, 0.3318661, -0.826686, 1, 1, 1, 1, 1,
-0.09943337, 1.881709, -1.37178, 1, 1, 1, 1, 1,
-0.09879531, -1.083686, -4.011477, 1, 1, 1, 1, 1,
-0.09429903, -0.8154154, -3.233778, 1, 1, 1, 1, 1,
-0.09158444, -0.7705374, -1.719869, 1, 1, 1, 1, 1,
-0.08815832, 0.9614061, -1.47879, 1, 1, 1, 1, 1,
-0.0864941, -1.224879, -2.65527, 1, 1, 1, 1, 1,
-0.08340037, 0.04467481, -1.343964, 1, 1, 1, 1, 1,
-0.08051751, 0.3141817, 0.4254169, 1, 1, 1, 1, 1,
-0.07559747, 0.875351, 0.225526, 0, 0, 1, 1, 1,
-0.07118035, -1.015499, -3.734163, 1, 0, 0, 1, 1,
-0.07019193, -0.892258, -3.810133, 1, 0, 0, 1, 1,
-0.06654345, 0.8274171, 0.2339302, 1, 0, 0, 1, 1,
-0.06593111, 0.821252, -0.9266426, 1, 0, 0, 1, 1,
-0.06444072, 2.636078, -0.4032926, 1, 0, 0, 1, 1,
-0.0606997, -0.4226419, -3.909758, 0, 0, 0, 1, 1,
-0.05340826, -0.1507796, -3.418201, 0, 0, 0, 1, 1,
-0.04641588, 1.502867, 0.6766137, 0, 0, 0, 1, 1,
-0.04553456, -0.1497688, -4.071185, 0, 0, 0, 1, 1,
-0.04343015, 0.6097047, -0.7110609, 0, 0, 0, 1, 1,
-0.04216033, 0.7568147, -0.507928, 0, 0, 0, 1, 1,
-0.04089385, 1.317435, -2.3098, 0, 0, 0, 1, 1,
-0.0398419, 0.2274913, -1.435336, 1, 1, 1, 1, 1,
-0.0396595, -0.2213071, -1.838981, 1, 1, 1, 1, 1,
-0.03952643, 0.3955078, -1.045845, 1, 1, 1, 1, 1,
-0.03498975, -1.188886, -3.135175, 1, 1, 1, 1, 1,
-0.03014573, 0.2599052, -1.811344, 1, 1, 1, 1, 1,
-0.02917481, -1.306587, -2.585693, 1, 1, 1, 1, 1,
-0.01527332, -0.9137317, -3.124635, 1, 1, 1, 1, 1,
-0.01515906, 0.9790679, -0.5397065, 1, 1, 1, 1, 1,
-0.01425114, -1.403058, -1.923055, 1, 1, 1, 1, 1,
-0.009028635, -1.253069, -4.471569, 1, 1, 1, 1, 1,
-0.008093678, -2.557832, -3.816051, 1, 1, 1, 1, 1,
-0.004463852, 0.3741062, -0.7068972, 1, 1, 1, 1, 1,
0.005815338, -0.4413278, 3.921317, 1, 1, 1, 1, 1,
0.006472525, -0.5834873, 1.369138, 1, 1, 1, 1, 1,
0.008963782, 0.19766, -0.5080795, 1, 1, 1, 1, 1,
0.01377035, 0.132353, -0.2000507, 0, 0, 1, 1, 1,
0.01540393, 0.9644681, 0.2044142, 1, 0, 0, 1, 1,
0.01545879, -0.5339354, 3.56494, 1, 0, 0, 1, 1,
0.01609085, -1.030787, 3.597516, 1, 0, 0, 1, 1,
0.01920015, 1.389548, -2.180624, 1, 0, 0, 1, 1,
0.02192872, 0.4454186, 0.9138664, 1, 0, 0, 1, 1,
0.0220914, -0.5154378, 2.408834, 0, 0, 0, 1, 1,
0.02420026, -0.2065421, 0.8785862, 0, 0, 0, 1, 1,
0.02469219, 1.437216, -1.115456, 0, 0, 0, 1, 1,
0.02783579, 0.246747, 1.631336, 0, 0, 0, 1, 1,
0.02800328, -0.3537548, 1.580304, 0, 0, 0, 1, 1,
0.02808681, 0.1969526, 1.505073, 0, 0, 0, 1, 1,
0.03084724, 0.02193511, -0.1857214, 0, 0, 0, 1, 1,
0.03252526, -0.0844782, 3.471631, 1, 1, 1, 1, 1,
0.03258741, -0.7718589, 3.809875, 1, 1, 1, 1, 1,
0.0364446, 0.06247657, 1.069019, 1, 1, 1, 1, 1,
0.03781898, 1.075671, -0.1625995, 1, 1, 1, 1, 1,
0.03879898, -2.1135, 3.469005, 1, 1, 1, 1, 1,
0.0425897, -0.397291, 5.207482, 1, 1, 1, 1, 1,
0.04498267, 0.5104947, 0.5464419, 1, 1, 1, 1, 1,
0.04527237, -1.416004, 2.080363, 1, 1, 1, 1, 1,
0.05003458, 0.01042446, 0.3948872, 1, 1, 1, 1, 1,
0.05215025, -1.76699, 3.209374, 1, 1, 1, 1, 1,
0.05315008, -1.073384, 2.25846, 1, 1, 1, 1, 1,
0.06399167, 0.385973, -0.6286093, 1, 1, 1, 1, 1,
0.06513572, -0.05471037, 1.934864, 1, 1, 1, 1, 1,
0.06784099, -0.2256866, 4.032386, 1, 1, 1, 1, 1,
0.06960062, -2.085316, 3.715928, 1, 1, 1, 1, 1,
0.07311573, -1.967183, 4.171242, 0, 0, 1, 1, 1,
0.07516856, 0.2814753, 0.7271369, 1, 0, 0, 1, 1,
0.07551631, -0.6329535, 1.256832, 1, 0, 0, 1, 1,
0.07844098, 1.780111, 0.6926007, 1, 0, 0, 1, 1,
0.07938065, -0.1072725, 4.439737, 1, 0, 0, 1, 1,
0.08130611, 1.73687, -1.897621, 1, 0, 0, 1, 1,
0.08912131, -0.8919283, 3.743868, 0, 0, 0, 1, 1,
0.08947216, 0.1225489, -0.892556, 0, 0, 0, 1, 1,
0.0895625, -1.261755, 4.330308, 0, 0, 0, 1, 1,
0.09011797, 0.8586819, -1.704264, 0, 0, 0, 1, 1,
0.09484017, 0.829916, 1.083816, 0, 0, 0, 1, 1,
0.09676347, -0.3873585, 2.976095, 0, 0, 0, 1, 1,
0.09826633, -0.3142336, 3.429043, 0, 0, 0, 1, 1,
0.102746, -1.292971, 1.08638, 1, 1, 1, 1, 1,
0.1074891, 1.455479, -0.284672, 1, 1, 1, 1, 1,
0.1091779, -0.8659323, 3.702181, 1, 1, 1, 1, 1,
0.1162023, -1.412516, 5.126388, 1, 1, 1, 1, 1,
0.1237041, -0.2232892, 1.48205, 1, 1, 1, 1, 1,
0.1258704, 1.117056, -0.260243, 1, 1, 1, 1, 1,
0.1266896, -0.4239869, 2.237618, 1, 1, 1, 1, 1,
0.127552, -0.9154301, 2.168267, 1, 1, 1, 1, 1,
0.1280543, 1.826828, -0.7503144, 1, 1, 1, 1, 1,
0.1306732, 1.374519, 0.6562631, 1, 1, 1, 1, 1,
0.1307266, 0.5846049, -0.7883369, 1, 1, 1, 1, 1,
0.1307695, -1.591492, 3.421077, 1, 1, 1, 1, 1,
0.1319306, 0.7389796, -0.8752156, 1, 1, 1, 1, 1,
0.1322827, 1.229204, -0.5109199, 1, 1, 1, 1, 1,
0.1384411, 0.4621925, 1.827936, 1, 1, 1, 1, 1,
0.1421425, 0.2861624, -1.210891, 0, 0, 1, 1, 1,
0.1560865, -1.609169, 4.608138, 1, 0, 0, 1, 1,
0.1564489, -1.228683, 0.3597504, 1, 0, 0, 1, 1,
0.1604804, -0.2557682, 2.036518, 1, 0, 0, 1, 1,
0.1622801, -1.127191, 3.866313, 1, 0, 0, 1, 1,
0.1631984, 0.9377931, 1.171195, 1, 0, 0, 1, 1,
0.1637389, 1.726211, 1.009605, 0, 0, 0, 1, 1,
0.167066, -0.3557421, 2.922333, 0, 0, 0, 1, 1,
0.1680415, 0.06086453, 0.7130305, 0, 0, 0, 1, 1,
0.1684871, -0.09314139, 2.650541, 0, 0, 0, 1, 1,
0.169422, -0.4264849, 1.98263, 0, 0, 0, 1, 1,
0.1718124, 1.738519, 1.877914, 0, 0, 0, 1, 1,
0.1787667, -1.400572, 3.697367, 0, 0, 0, 1, 1,
0.1802819, 0.8804617, 0.8332082, 1, 1, 1, 1, 1,
0.1919599, -0.4911547, 3.169296, 1, 1, 1, 1, 1,
0.1943251, -0.2317569, 2.64989, 1, 1, 1, 1, 1,
0.1948892, -1.065143, 1.219984, 1, 1, 1, 1, 1,
0.195883, -2.52346, 2.166279, 1, 1, 1, 1, 1,
0.1972307, -0.2179821, 2.089024, 1, 1, 1, 1, 1,
0.1983961, 0.9134475, 1.079153, 1, 1, 1, 1, 1,
0.1990509, -0.5803731, 3.20635, 1, 1, 1, 1, 1,
0.1994316, 0.2921762, 2.467248, 1, 1, 1, 1, 1,
0.2016534, -2.113907, 1.859161, 1, 1, 1, 1, 1,
0.2053046, 0.7124687, 0.576341, 1, 1, 1, 1, 1,
0.2062609, -0.1593444, 1.526799, 1, 1, 1, 1, 1,
0.2140536, -0.03570537, 2.305312, 1, 1, 1, 1, 1,
0.2157728, -1.063696, 3.509567, 1, 1, 1, 1, 1,
0.2198417, -0.1380344, 2.892991, 1, 1, 1, 1, 1,
0.2225811, -0.4565226, 2.794676, 0, 0, 1, 1, 1,
0.224913, 0.4385229, 0.6484236, 1, 0, 0, 1, 1,
0.2249451, 1.343989, -0.5085961, 1, 0, 0, 1, 1,
0.2289326, -0.2932173, 1.243284, 1, 0, 0, 1, 1,
0.2291023, -0.425405, 1.778021, 1, 0, 0, 1, 1,
0.2310844, -2.012641, 4.448881, 1, 0, 0, 1, 1,
0.2427749, -1.910397, 3.183899, 0, 0, 0, 1, 1,
0.244166, -1.495348, 4.760571, 0, 0, 0, 1, 1,
0.2492406, 0.6206353, -0.0332583, 0, 0, 0, 1, 1,
0.2501691, -1.158582, 3.11185, 0, 0, 0, 1, 1,
0.2509405, -0.3026696, 2.883054, 0, 0, 0, 1, 1,
0.2515098, 0.7251831, -1.132383, 0, 0, 0, 1, 1,
0.2543949, -1.462734, 2.912363, 0, 0, 0, 1, 1,
0.2544597, 1.104162, 0.9882953, 1, 1, 1, 1, 1,
0.2578356, -0.3538585, 3.696842, 1, 1, 1, 1, 1,
0.2601851, -1.451445, 3.091736, 1, 1, 1, 1, 1,
0.262606, -1.136879, 2.497825, 1, 1, 1, 1, 1,
0.2663348, 2.511059, -0.3049584, 1, 1, 1, 1, 1,
0.2676004, -0.447086, 3.717253, 1, 1, 1, 1, 1,
0.2676966, -1.264455, 3.174171, 1, 1, 1, 1, 1,
0.2681262, 0.1584822, 0.4812648, 1, 1, 1, 1, 1,
0.2736714, -0.08812463, 1.305338, 1, 1, 1, 1, 1,
0.2813527, -1.462467, 2.051741, 1, 1, 1, 1, 1,
0.2818277, -1.247098, 3.516277, 1, 1, 1, 1, 1,
0.2830409, 0.6202325, 2.415919, 1, 1, 1, 1, 1,
0.2834955, -0.02297383, 2.168694, 1, 1, 1, 1, 1,
0.2846451, 0.2053596, -0.7439306, 1, 1, 1, 1, 1,
0.29039, -0.1437773, 0.7622532, 1, 1, 1, 1, 1,
0.2943256, 0.5969275, -1.512328, 0, 0, 1, 1, 1,
0.2956562, -0.9869453, 3.782404, 1, 0, 0, 1, 1,
0.2959079, 1.244256, 0.3207186, 1, 0, 0, 1, 1,
0.2991207, 1.940448, 0.8818266, 1, 0, 0, 1, 1,
0.302226, 1.31128, 0.9516903, 1, 0, 0, 1, 1,
0.3052707, -0.1845211, 2.334365, 1, 0, 0, 1, 1,
0.3091996, -0.02457345, 1.736132, 0, 0, 0, 1, 1,
0.3096066, 0.2064346, 0.3690857, 0, 0, 0, 1, 1,
0.3172888, -1.079234, 3.971421, 0, 0, 0, 1, 1,
0.3200164, 0.1095982, 2.808153, 0, 0, 0, 1, 1,
0.3202205, 0.1750236, 1.148771, 0, 0, 0, 1, 1,
0.321646, -2.546781, 2.30696, 0, 0, 0, 1, 1,
0.3230729, 0.4277015, 1.387741, 0, 0, 0, 1, 1,
0.324372, 0.3321865, -0.3566414, 1, 1, 1, 1, 1,
0.3272271, 0.8176156, 0.7230778, 1, 1, 1, 1, 1,
0.3288367, -0.5154411, 3.001799, 1, 1, 1, 1, 1,
0.3321311, -0.0566318, -0.3087584, 1, 1, 1, 1, 1,
0.3330874, 0.07468718, 0.6145132, 1, 1, 1, 1, 1,
0.3368834, -1.63979, 1.82947, 1, 1, 1, 1, 1,
0.3416897, 0.06370893, -0.1419454, 1, 1, 1, 1, 1,
0.3442714, -0.5382628, 0.819668, 1, 1, 1, 1, 1,
0.3469228, 0.3223233, 1.913211, 1, 1, 1, 1, 1,
0.3477206, 1.222812, 0.6462076, 1, 1, 1, 1, 1,
0.3519946, 0.1194704, 0.9887673, 1, 1, 1, 1, 1,
0.3523265, -0.6587552, 1.087309, 1, 1, 1, 1, 1,
0.3529482, -0.1516602, 2.545888, 1, 1, 1, 1, 1,
0.3572923, 0.5935839, -0.3004174, 1, 1, 1, 1, 1,
0.3616017, 0.3107723, 1.955324, 1, 1, 1, 1, 1,
0.3620465, 0.821492, -0.1456373, 0, 0, 1, 1, 1,
0.3652223, 0.5146727, -1.498579, 1, 0, 0, 1, 1,
0.3658434, 0.1418103, 1.492476, 1, 0, 0, 1, 1,
0.3737542, -0.6313938, 3.058675, 1, 0, 0, 1, 1,
0.3790573, 0.3011761, 2.306604, 1, 0, 0, 1, 1,
0.3805736, 0.3087396, 0.7287422, 1, 0, 0, 1, 1,
0.3814245, 1.153908, -0.1104091, 0, 0, 0, 1, 1,
0.3817247, 2.387279, -0.03364707, 0, 0, 0, 1, 1,
0.3843584, -0.4035674, 2.177275, 0, 0, 0, 1, 1,
0.3902085, -0.7944627, 3.850123, 0, 0, 0, 1, 1,
0.3915408, -0.2505966, 2.848986, 0, 0, 0, 1, 1,
0.4001764, -0.007469309, 0.1737379, 0, 0, 0, 1, 1,
0.4032992, 1.324714, -1.900176, 0, 0, 0, 1, 1,
0.4039846, 1.97328, 1.326744, 1, 1, 1, 1, 1,
0.4042752, -1.444435, 2.600678, 1, 1, 1, 1, 1,
0.4097518, 1.082895, 0.4000366, 1, 1, 1, 1, 1,
0.4108387, 0.1735242, 1.649741, 1, 1, 1, 1, 1,
0.4138993, 0.9045161, -0.2216072, 1, 1, 1, 1, 1,
0.4147072, -0.1684986, 2.944707, 1, 1, 1, 1, 1,
0.4163653, -1.104084, 2.717754, 1, 1, 1, 1, 1,
0.4177487, -0.1230152, 2.491762, 1, 1, 1, 1, 1,
0.4240662, 0.7504429, 0.7420741, 1, 1, 1, 1, 1,
0.4250889, 1.05402, 0.168444, 1, 1, 1, 1, 1,
0.4256235, 0.9957505, 1.120178, 1, 1, 1, 1, 1,
0.4270017, 0.7762246, 0.323901, 1, 1, 1, 1, 1,
0.4278535, 0.8790627, 0.6049478, 1, 1, 1, 1, 1,
0.4348706, 0.504797, -1.577446, 1, 1, 1, 1, 1,
0.440478, -0.0786052, -0.4244374, 1, 1, 1, 1, 1,
0.4405262, -0.431743, 4.343621, 0, 0, 1, 1, 1,
0.4482892, 0.04873328, 1.163877, 1, 0, 0, 1, 1,
0.4492343, 0.2651442, 0.6715996, 1, 0, 0, 1, 1,
0.4557499, 0.5739192, 0.7487214, 1, 0, 0, 1, 1,
0.4605239, -1.284745, 2.196356, 1, 0, 0, 1, 1,
0.4608418, 0.6690607, 1.051696, 1, 0, 0, 1, 1,
0.462854, -0.273897, 2.087359, 0, 0, 0, 1, 1,
0.4755881, 1.991912, 1.043415, 0, 0, 0, 1, 1,
0.48221, -0.5868829, 1.236265, 0, 0, 0, 1, 1,
0.4845558, 0.2491995, 0.8780886, 0, 0, 0, 1, 1,
0.4936779, 1.35979, 1.01896, 0, 0, 0, 1, 1,
0.4947267, -1.632476, 2.743227, 0, 0, 0, 1, 1,
0.4971049, 0.285855, -0.5108219, 0, 0, 0, 1, 1,
0.4982933, -0.3697295, 0.2971289, 1, 1, 1, 1, 1,
0.5155049, 1.168764, -0.3331987, 1, 1, 1, 1, 1,
0.5164942, -0.546348, 3.392053, 1, 1, 1, 1, 1,
0.5173079, 2.132325, -1.209963, 1, 1, 1, 1, 1,
0.5229451, -0.8719529, 0.2122597, 1, 1, 1, 1, 1,
0.5245773, 0.6336429, 0.1104603, 1, 1, 1, 1, 1,
0.5265828, 0.1635733, 1.769041, 1, 1, 1, 1, 1,
0.526777, -0.4436232, 0.9644511, 1, 1, 1, 1, 1,
0.5278999, 0.6684958, 0.6884187, 1, 1, 1, 1, 1,
0.5298841, 0.5840575, 0.173196, 1, 1, 1, 1, 1,
0.5318804, 0.7723162, -0.2138184, 1, 1, 1, 1, 1,
0.5320868, -0.1053148, 1.488358, 1, 1, 1, 1, 1,
0.5371239, 0.07858656, 0.5358124, 1, 1, 1, 1, 1,
0.5404755, 1.707237, 2.495316, 1, 1, 1, 1, 1,
0.5406442, 0.1673702, 2.248729, 1, 1, 1, 1, 1,
0.5453075, 1.094242, 0.4104807, 0, 0, 1, 1, 1,
0.5465716, -1.706964, 2.322507, 1, 0, 0, 1, 1,
0.5492384, 0.4732246, 1.526148, 1, 0, 0, 1, 1,
0.5522945, 1.352772, 0.2881443, 1, 0, 0, 1, 1,
0.5531573, 0.2620568, 1.409879, 1, 0, 0, 1, 1,
0.5537246, -0.2252522, 2.958702, 1, 0, 0, 1, 1,
0.5585085, 0.5502649, -0.4268665, 0, 0, 0, 1, 1,
0.5594272, 0.7662289, -1.545822, 0, 0, 0, 1, 1,
0.568643, -0.3779646, 2.544633, 0, 0, 0, 1, 1,
0.5692745, -0.9432232, 2.97383, 0, 0, 0, 1, 1,
0.5713956, -1.242497, 3.782881, 0, 0, 0, 1, 1,
0.5757509, -0.6758825, 2.514894, 0, 0, 0, 1, 1,
0.5767665, -1.081113, 2.132139, 0, 0, 0, 1, 1,
0.5780589, -0.9197655, 2.38223, 1, 1, 1, 1, 1,
0.5842195, 1.30412, 0.1964748, 1, 1, 1, 1, 1,
0.5846549, 0.9049772, 0.5887201, 1, 1, 1, 1, 1,
0.5899594, 0.796894, 1.504328, 1, 1, 1, 1, 1,
0.5915135, 1.501487, 1.333703, 1, 1, 1, 1, 1,
0.5927444, 0.5211204, 1.520777, 1, 1, 1, 1, 1,
0.5946723, -0.6244889, 1.968003, 1, 1, 1, 1, 1,
0.6021615, -1.985098, 2.007712, 1, 1, 1, 1, 1,
0.6045651, 0.1886129, 1.398851, 1, 1, 1, 1, 1,
0.6060436, -0.1883416, 0.488255, 1, 1, 1, 1, 1,
0.6092577, -1.093912, 3.054038, 1, 1, 1, 1, 1,
0.6139724, -0.3825432, 1.303182, 1, 1, 1, 1, 1,
0.6181495, -0.009961427, 2.645166, 1, 1, 1, 1, 1,
0.619843, 0.1762796, 1.267445, 1, 1, 1, 1, 1,
0.6300143, -1.548019, 1.990221, 1, 1, 1, 1, 1,
0.6365163, 1.549183, -0.1325245, 0, 0, 1, 1, 1,
0.6432136, 0.01543459, 0.4357541, 1, 0, 0, 1, 1,
0.6465935, 1.109466, 1.164779, 1, 0, 0, 1, 1,
0.6495714, -0.8489466, 2.924498, 1, 0, 0, 1, 1,
0.6564033, -0.35207, 2.308469, 1, 0, 0, 1, 1,
0.6572036, -1.070162, 2.007041, 1, 0, 0, 1, 1,
0.6592137, 0.03270539, 2.150693, 0, 0, 0, 1, 1,
0.6651303, 0.1107835, 0.9401406, 0, 0, 0, 1, 1,
0.665557, -0.2213667, -0.3950044, 0, 0, 0, 1, 1,
0.6683314, 0.8400449, -0.02063017, 0, 0, 0, 1, 1,
0.6729067, 1.160366, -0.3881528, 0, 0, 0, 1, 1,
0.6734487, -1.798764, 1.892452, 0, 0, 0, 1, 1,
0.6749262, 0.2362787, 2.527249, 0, 0, 0, 1, 1,
0.6769813, -0.5742896, 0.6142274, 1, 1, 1, 1, 1,
0.6794667, 0.4486963, 0.798678, 1, 1, 1, 1, 1,
0.6832019, 1.144821, 0.3967244, 1, 1, 1, 1, 1,
0.6838578, -0.8495002, 2.73209, 1, 1, 1, 1, 1,
0.6845766, 0.4441766, -0.4778163, 1, 1, 1, 1, 1,
0.6847131, -1.251734, 2.738586, 1, 1, 1, 1, 1,
0.686096, -1.436283, 2.240361, 1, 1, 1, 1, 1,
0.6916239, 1.803198, 0.703943, 1, 1, 1, 1, 1,
0.6933367, 1.55908, 0.5356767, 1, 1, 1, 1, 1,
0.6970679, 1.18027, 2.015553, 1, 1, 1, 1, 1,
0.7008817, -0.5445037, 2.686371, 1, 1, 1, 1, 1,
0.7023335, 0.5131245, 1.333174, 1, 1, 1, 1, 1,
0.7042705, -0.08369597, 0.8535917, 1, 1, 1, 1, 1,
0.7046209, -0.6091158, 4.051939, 1, 1, 1, 1, 1,
0.7063698, -1.463511, 3.034354, 1, 1, 1, 1, 1,
0.7106552, -1.570361, 2.337862, 0, 0, 1, 1, 1,
0.7114178, 0.9311119, 0.3568807, 1, 0, 0, 1, 1,
0.7190375, 1.481909, -0.546196, 1, 0, 0, 1, 1,
0.7198121, -0.9963616, 3.078851, 1, 0, 0, 1, 1,
0.7203409, 0.09839258, -0.0113115, 1, 0, 0, 1, 1,
0.7206832, -1.101493, 1.962609, 1, 0, 0, 1, 1,
0.7230574, 0.2035534, -0.06754616, 0, 0, 0, 1, 1,
0.7264467, 1.16834, -0.3333465, 0, 0, 0, 1, 1,
0.7374368, 0.6369634, 0.7673119, 0, 0, 0, 1, 1,
0.7436203, 0.489633, 2.501779, 0, 0, 0, 1, 1,
0.745654, -1.072339, 3.425301, 0, 0, 0, 1, 1,
0.7520282, -0.1687789, 1.860918, 0, 0, 0, 1, 1,
0.7530525, -0.4465818, 2.254958, 0, 0, 0, 1, 1,
0.758049, 0.008327354, 1.550086, 1, 1, 1, 1, 1,
0.7643426, 1.572301, 2.333022, 1, 1, 1, 1, 1,
0.7660627, 0.1530523, -0.1427001, 1, 1, 1, 1, 1,
0.7665758, -1.109619, 3.92474, 1, 1, 1, 1, 1,
0.7670736, -1.933227, 2.678486, 1, 1, 1, 1, 1,
0.7698001, 1.28948, 0.9175922, 1, 1, 1, 1, 1,
0.7839563, -2.066685, 2.595878, 1, 1, 1, 1, 1,
0.7887458, 1.29688, 1.266585, 1, 1, 1, 1, 1,
0.7890791, 1.153358, 1.524794, 1, 1, 1, 1, 1,
0.8001051, -0.7344524, 2.066252, 1, 1, 1, 1, 1,
0.8015819, 1.926297, 0.640801, 1, 1, 1, 1, 1,
0.8037102, 0.667658, 0.7967589, 1, 1, 1, 1, 1,
0.8097519, 0.1798623, 1.154768, 1, 1, 1, 1, 1,
0.8170511, -0.3134053, 1.498204, 1, 1, 1, 1, 1,
0.8196006, 0.6199425, 1.139209, 1, 1, 1, 1, 1,
0.820455, 1.071166, -0.2384834, 0, 0, 1, 1, 1,
0.8206829, 0.001657204, 1.594611, 1, 0, 0, 1, 1,
0.8276608, 0.2106177, 1.803688, 1, 0, 0, 1, 1,
0.8286608, -0.2091319, 1.544139, 1, 0, 0, 1, 1,
0.8400728, -0.4876451, 0.6558557, 1, 0, 0, 1, 1,
0.8442678, -0.8145357, 2.784554, 1, 0, 0, 1, 1,
0.8471653, 0.7030071, 0.300746, 0, 0, 0, 1, 1,
0.8517972, -0.4847166, 2.351827, 0, 0, 0, 1, 1,
0.8523778, 0.4187464, 2.42802, 0, 0, 0, 1, 1,
0.8575166, 2.014987, -0.2597117, 0, 0, 0, 1, 1,
0.8585154, -0.0871314, -0.1137955, 0, 0, 0, 1, 1,
0.859809, -0.9371603, 2.251898, 0, 0, 0, 1, 1,
0.8626307, -0.8474438, 4.391009, 0, 0, 0, 1, 1,
0.8662163, -0.5924488, 3.439569, 1, 1, 1, 1, 1,
0.8704923, -1.350258, 4.92336, 1, 1, 1, 1, 1,
0.8847104, 0.147623, 1.091972, 1, 1, 1, 1, 1,
0.8956473, 0.6611025, 0.8386197, 1, 1, 1, 1, 1,
0.9103388, -0.884593, 3.747568, 1, 1, 1, 1, 1,
0.9153918, -0.4859554, 2.279103, 1, 1, 1, 1, 1,
0.9159997, -0.5933477, 1.468726, 1, 1, 1, 1, 1,
0.9172566, -0.6734266, 1.52753, 1, 1, 1, 1, 1,
0.9223893, -0.2624037, 0.7524822, 1, 1, 1, 1, 1,
0.9236957, 0.04119322, 2.234018, 1, 1, 1, 1, 1,
0.9250028, 0.1630163, 1.157609, 1, 1, 1, 1, 1,
0.9250401, 0.5875024, 2.701424, 1, 1, 1, 1, 1,
0.9251242, 2.362515, 0.7151794, 1, 1, 1, 1, 1,
0.9251918, -1.962549, 3.62382, 1, 1, 1, 1, 1,
0.933659, -0.1130942, 0.6209715, 1, 1, 1, 1, 1,
0.9351495, 1.047216, 0.01311813, 0, 0, 1, 1, 1,
0.9433884, 2.02587, 1.600078, 1, 0, 0, 1, 1,
0.9434766, 0.9527391, 0.505133, 1, 0, 0, 1, 1,
0.9434959, 0.4533947, 2.405826, 1, 0, 0, 1, 1,
0.9465439, 0.9616511, -0.0876844, 1, 0, 0, 1, 1,
0.9468411, 0.7318889, 3.869441, 1, 0, 0, 1, 1,
0.9479091, 1.23391, 0.08309253, 0, 0, 0, 1, 1,
0.9539501, 1.855901, -0.4242927, 0, 0, 0, 1, 1,
0.9696963, 0.0772711, 1.645546, 0, 0, 0, 1, 1,
0.9702337, 0.1670513, -0.4672999, 0, 0, 0, 1, 1,
0.978447, -0.2307824, 0.4933052, 0, 0, 0, 1, 1,
0.9799267, 0.1061967, 0.5605501, 0, 0, 0, 1, 1,
0.9814771, -0.2535946, 1.697836, 0, 0, 0, 1, 1,
0.990351, 0.4921959, 0.3655823, 1, 1, 1, 1, 1,
0.998216, -0.3660627, 2.739623, 1, 1, 1, 1, 1,
1.000755, -1.646469, 4.194593, 1, 1, 1, 1, 1,
1.005207, -0.686403, 2.677902, 1, 1, 1, 1, 1,
1.014466, -0.2330414, 0.957164, 1, 1, 1, 1, 1,
1.020483, 2.130567, 0.4033248, 1, 1, 1, 1, 1,
1.030064, -0.2951512, 0.6067417, 1, 1, 1, 1, 1,
1.037838, 1.563146, -0.6827892, 1, 1, 1, 1, 1,
1.041925, -0.7802427, 1.690839, 1, 1, 1, 1, 1,
1.055733, 1.902501, 0.5462412, 1, 1, 1, 1, 1,
1.056581, -0.06969497, 1.480157, 1, 1, 1, 1, 1,
1.060502, -0.8740817, 3.060942, 1, 1, 1, 1, 1,
1.062017, 0.5959612, 1.890731, 1, 1, 1, 1, 1,
1.072074, 0.4153491, 1.259287, 1, 1, 1, 1, 1,
1.079958, -1.710934, 1.04039, 1, 1, 1, 1, 1,
1.088172, -0.0632828, 2.16328, 0, 0, 1, 1, 1,
1.090389, 1.040496, 1.615708, 1, 0, 0, 1, 1,
1.09106, 1.483311, 0.4183353, 1, 0, 0, 1, 1,
1.094677, -1.003984, 3.029192, 1, 0, 0, 1, 1,
1.095678, -0.2930409, 0.5607216, 1, 0, 0, 1, 1,
1.099396, 1.54312, 0.3077369, 1, 0, 0, 1, 1,
1.105041, 1.543605, 1.258698, 0, 0, 0, 1, 1,
1.10747, 0.01889403, 1.374303, 0, 0, 0, 1, 1,
1.112518, 0.3169477, 2.830098, 0, 0, 0, 1, 1,
1.113477, -0.15345, 1.833862, 0, 0, 0, 1, 1,
1.1156, -0.8145708, 2.058822, 0, 0, 0, 1, 1,
1.116583, -0.779607, 0.8726673, 0, 0, 0, 1, 1,
1.116691, -0.6108789, 1.432798, 0, 0, 0, 1, 1,
1.118669, -0.9455813, 1.478341, 1, 1, 1, 1, 1,
1.127365, -0.586633, 3.07912, 1, 1, 1, 1, 1,
1.128473, 0.6978189, 1.636576, 1, 1, 1, 1, 1,
1.136224, -1.374728, 2.102734, 1, 1, 1, 1, 1,
1.14107, 0.08052339, 2.461737, 1, 1, 1, 1, 1,
1.148234, 0.3131021, 4.339408, 1, 1, 1, 1, 1,
1.150773, 1.279374, -0.2235483, 1, 1, 1, 1, 1,
1.153235, -3.073065, 3.677455, 1, 1, 1, 1, 1,
1.155237, -1.394701, 2.322337, 1, 1, 1, 1, 1,
1.165714, -0.4417609, 3.730304, 1, 1, 1, 1, 1,
1.1694, 0.6591817, 1.431364, 1, 1, 1, 1, 1,
1.170507, 0.5596047, 3.407363, 1, 1, 1, 1, 1,
1.178267, -0.4482501, 2.11901, 1, 1, 1, 1, 1,
1.18488, -1.115933, 2.289452, 1, 1, 1, 1, 1,
1.185048, 1.220887, -0.1371059, 1, 1, 1, 1, 1,
1.185645, -1.401251, 2.515114, 0, 0, 1, 1, 1,
1.188523, -1.191668, 1.722517, 1, 0, 0, 1, 1,
1.196697, -0.8596236, 1.539664, 1, 0, 0, 1, 1,
1.196806, -0.7755725, 3.107716, 1, 0, 0, 1, 1,
1.197775, 0.5623347, 1.21763, 1, 0, 0, 1, 1,
1.201196, 0.8818916, 1.476942, 1, 0, 0, 1, 1,
1.203018, -0.3596307, 2.066943, 0, 0, 0, 1, 1,
1.20309, -0.380553, 2.670849, 0, 0, 0, 1, 1,
1.20602, 1.06098, -0.4157441, 0, 0, 0, 1, 1,
1.207677, 1.174472, 0.1400648, 0, 0, 0, 1, 1,
1.214747, 2.426022, 1.301126, 0, 0, 0, 1, 1,
1.215989, 1.906772, 1.339789, 0, 0, 0, 1, 1,
1.216874, -0.2734771, 2.379959, 0, 0, 0, 1, 1,
1.218852, 0.3556542, 0.7765548, 1, 1, 1, 1, 1,
1.225618, -0.6719934, 2.514833, 1, 1, 1, 1, 1,
1.22609, -0.1547944, 1.488777, 1, 1, 1, 1, 1,
1.226274, 0.7462138, 0.4794503, 1, 1, 1, 1, 1,
1.227834, -0.4192884, 0.2024818, 1, 1, 1, 1, 1,
1.245552, -0.2361737, 1.035633, 1, 1, 1, 1, 1,
1.24697, -1.611912, 1.22345, 1, 1, 1, 1, 1,
1.248961, -0.4544425, 1.589388, 1, 1, 1, 1, 1,
1.249499, 0.5417414, 0.8822295, 1, 1, 1, 1, 1,
1.252241, 0.2236349, 1.541275, 1, 1, 1, 1, 1,
1.254061, -0.6716124, 1.776507, 1, 1, 1, 1, 1,
1.256541, 0.5167425, 1.710345, 1, 1, 1, 1, 1,
1.276748, 0.7535542, 0.1302063, 1, 1, 1, 1, 1,
1.286363, -0.5285957, 0.8212554, 1, 1, 1, 1, 1,
1.310873, -1.742144, 2.756351, 1, 1, 1, 1, 1,
1.315913, -0.08375257, 1.796013, 0, 0, 1, 1, 1,
1.316925, -0.2409306, 2.375294, 1, 0, 0, 1, 1,
1.317944, -0.5348422, 1.65356, 1, 0, 0, 1, 1,
1.323502, -0.8529952, 3.053243, 1, 0, 0, 1, 1,
1.332307, -1.799049, 2.414279, 1, 0, 0, 1, 1,
1.334777, 0.8275388, 1.070183, 1, 0, 0, 1, 1,
1.345183, 1.018533, 0.429735, 0, 0, 0, 1, 1,
1.345745, 0.2799693, 2.006413, 0, 0, 0, 1, 1,
1.348373, 1.012178, -0.3600435, 0, 0, 0, 1, 1,
1.358566, -1.113266, 0.432425, 0, 0, 0, 1, 1,
1.365405, -2.367992, 2.708688, 0, 0, 0, 1, 1,
1.382137, -0.8348785, 1.94032, 0, 0, 0, 1, 1,
1.388001, -0.8544226, 2.526056, 0, 0, 0, 1, 1,
1.395837, 1.524474, 0.2918525, 1, 1, 1, 1, 1,
1.398905, 0.3600945, 1.225291, 1, 1, 1, 1, 1,
1.405861, 0.6412075, 0.0956096, 1, 1, 1, 1, 1,
1.409698, 1.62271, -1.263048, 1, 1, 1, 1, 1,
1.412352, -0.7341117, 3.027472, 1, 1, 1, 1, 1,
1.430492, -1.671714, 1.710979, 1, 1, 1, 1, 1,
1.436981, -1.842592, 2.336034, 1, 1, 1, 1, 1,
1.441052, 1.070996, 1.019099, 1, 1, 1, 1, 1,
1.441232, -0.8344789, 2.681301, 1, 1, 1, 1, 1,
1.452997, -1.553202, 1.727861, 1, 1, 1, 1, 1,
1.453103, -0.3709802, 0.6464215, 1, 1, 1, 1, 1,
1.458232, 0.6757263, 0.2050117, 1, 1, 1, 1, 1,
1.458316, -1.80637, 1.815063, 1, 1, 1, 1, 1,
1.472008, -0.3183379, 0.5344478, 1, 1, 1, 1, 1,
1.472021, 1.033646, 1.022865, 1, 1, 1, 1, 1,
1.473001, -1.720816, 1.268054, 0, 0, 1, 1, 1,
1.480239, 0.9207032, 0.3526451, 1, 0, 0, 1, 1,
1.484293, 0.8997324, 0.03856727, 1, 0, 0, 1, 1,
1.485064, 0.02080055, 2.900432, 1, 0, 0, 1, 1,
1.491283, -3.801902, 3.385127, 1, 0, 0, 1, 1,
1.49595, -0.09674598, 2.397784, 1, 0, 0, 1, 1,
1.501462, -0.6340091, 1.250774, 0, 0, 0, 1, 1,
1.501685, 0.6179762, 0.7888966, 0, 0, 0, 1, 1,
1.502653, 0.5809262, 1.479041, 0, 0, 0, 1, 1,
1.511326, 1.026513, 1.107628, 0, 0, 0, 1, 1,
1.51376, 0.7619485, 1.551317, 0, 0, 0, 1, 1,
1.521991, 1.481943, 0.1189464, 0, 0, 0, 1, 1,
1.525372, -0.7388417, 2.054195, 0, 0, 0, 1, 1,
1.53213, 1.077815, 0.7973983, 1, 1, 1, 1, 1,
1.539221, 0.06202962, 2.929596, 1, 1, 1, 1, 1,
1.54895, 0.6581185, 1.006926, 1, 1, 1, 1, 1,
1.549667, -0.4931584, 1.912095, 1, 1, 1, 1, 1,
1.567556, 0.254916, 0.7790341, 1, 1, 1, 1, 1,
1.578483, -0.1191, 1.610215, 1, 1, 1, 1, 1,
1.585637, -0.516479, 2.872232, 1, 1, 1, 1, 1,
1.58655, -1.936991, 2.415349, 1, 1, 1, 1, 1,
1.599984, -0.3663637, 0.777037, 1, 1, 1, 1, 1,
1.628889, 1.973989, 0.1601836, 1, 1, 1, 1, 1,
1.633203, -0.8595551, 1.811679, 1, 1, 1, 1, 1,
1.637056, 0.7467687, 0.8889117, 1, 1, 1, 1, 1,
1.644667, -0.2808536, 1.641903, 1, 1, 1, 1, 1,
1.656486, 0.8026785, 0.2568852, 1, 1, 1, 1, 1,
1.658891, -0.7225396, 2.02449, 1, 1, 1, 1, 1,
1.662389, -0.3342861, 1.275912, 0, 0, 1, 1, 1,
1.671052, 2.319098, 1.424744, 1, 0, 0, 1, 1,
1.709022, 0.3583945, 0.2291908, 1, 0, 0, 1, 1,
1.714159, -1.01939, 0.6731689, 1, 0, 0, 1, 1,
1.738252, 0.1796782, 1.513179, 1, 0, 0, 1, 1,
1.743216, 1.698693, 0.1165965, 1, 0, 0, 1, 1,
1.751689, -1.028672, 2.216175, 0, 0, 0, 1, 1,
1.752649, 1.653123, 0.694881, 0, 0, 0, 1, 1,
1.757433, 0.5271871, 1.768769, 0, 0, 0, 1, 1,
1.758427, 0.05581156, 1.30739, 0, 0, 0, 1, 1,
1.767779, -1.627266, 0.9583791, 0, 0, 0, 1, 1,
1.825315, -1.064152, 2.135545, 0, 0, 0, 1, 1,
1.834564, -0.6978601, 0.2883442, 0, 0, 0, 1, 1,
1.85613, -0.8242708, 2.474485, 1, 1, 1, 1, 1,
1.8564, 0.7866989, 0.6120378, 1, 1, 1, 1, 1,
1.872965, 0.1415101, 3.341582, 1, 1, 1, 1, 1,
1.894477, 2.122001, -0.1590915, 1, 1, 1, 1, 1,
1.949251, -0.966786, 1.525396, 1, 1, 1, 1, 1,
1.958641, 0.2675429, 2.085462, 1, 1, 1, 1, 1,
1.96152, 0.2966204, 3.161098, 1, 1, 1, 1, 1,
1.989197, -0.5188789, 2.761657, 1, 1, 1, 1, 1,
1.992038, 0.6938766, 1.155765, 1, 1, 1, 1, 1,
2.015638, -1.601503, 1.917408, 1, 1, 1, 1, 1,
2.024152, 0.1334631, 0.6419541, 1, 1, 1, 1, 1,
2.026897, 0.2549566, 1.70825, 1, 1, 1, 1, 1,
2.043013, -0.07484802, 2.209163, 1, 1, 1, 1, 1,
2.051088, 2.602915, 1.340333, 1, 1, 1, 1, 1,
2.057736, -0.9121061, 1.645532, 1, 1, 1, 1, 1,
2.086367, -1.118876, 3.508779, 0, 0, 1, 1, 1,
2.161897, 0.2254883, 0.4915978, 1, 0, 0, 1, 1,
2.190172, 3.167929, 1.273363, 1, 0, 0, 1, 1,
2.203284, -0.07020525, -0.1942588, 1, 0, 0, 1, 1,
2.264627, 1.220224, -0.0943902, 1, 0, 0, 1, 1,
2.452919, 1.757866, 2.089879, 1, 0, 0, 1, 1,
2.473052, 0.9819396, 2.08221, 0, 0, 0, 1, 1,
2.500707, -0.9418421, 3.159431, 0, 0, 0, 1, 1,
2.502374, 0.3509153, 3.710024, 0, 0, 0, 1, 1,
2.527702, -0.3593397, 1.612858, 0, 0, 0, 1, 1,
2.528971, -0.2958055, 1.165675, 0, 0, 0, 1, 1,
2.624228, -2.082235, 0.70791, 0, 0, 0, 1, 1,
2.640089, 1.115774, 0.06527496, 0, 0, 0, 1, 1,
2.75672, -0.08929626, 1.49359, 1, 1, 1, 1, 1,
2.77743, -1.766569, 2.754968, 1, 1, 1, 1, 1,
2.829415, -0.6488162, 2.049473, 1, 1, 1, 1, 1,
3.021825, -2.123627, 4.700867, 1, 1, 1, 1, 1,
3.077854, 0.2718628, 2.293635, 1, 1, 1, 1, 1,
3.086228, -0.1097229, -0.08290198, 1, 1, 1, 1, 1,
3.273501, 0.624979, 1.767451, 1, 1, 1, 1, 1
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
var radius = 10.02497;
var distance = 35.21228;
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
mvMatrix.translate( 0.1751416, 0.1568322, 0.2493563 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.21228);
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
