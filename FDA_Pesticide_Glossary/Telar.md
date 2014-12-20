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
-2.925911, 0.9476146, -0.3384936, 1, 0, 0, 1,
-2.710638, 0.8191608, 0.7550087, 1, 0.007843138, 0, 1,
-2.555585, 0.3129213, -0.5206243, 1, 0.01176471, 0, 1,
-2.469889, 0.195157, -1.885547, 1, 0.01960784, 0, 1,
-2.461193, 0.7352968, 0.7554663, 1, 0.02352941, 0, 1,
-2.392201, -0.4932881, -3.097607, 1, 0.03137255, 0, 1,
-2.355265, 0.3718491, -1.54552, 1, 0.03529412, 0, 1,
-2.354923, 0.1745868, 0.1129256, 1, 0.04313726, 0, 1,
-2.236826, 2.540653, 0.1985202, 1, 0.04705882, 0, 1,
-2.220628, -0.3153071, -1.316635, 1, 0.05490196, 0, 1,
-2.214622, 0.3309085, -1.705377, 1, 0.05882353, 0, 1,
-2.182718, 0.4136527, -1.495333, 1, 0.06666667, 0, 1,
-2.140379, -1.501827, -1.807255, 1, 0.07058824, 0, 1,
-2.114748, 0.2886434, -0.8504932, 1, 0.07843138, 0, 1,
-2.106865, 0.8501309, -2.260102, 1, 0.08235294, 0, 1,
-2.045236, 1.159958, -1.405703, 1, 0.09019608, 0, 1,
-2.011639, 0.2244885, -0.5995194, 1, 0.09411765, 0, 1,
-2.007108, -0.3355958, -1.430246, 1, 0.1019608, 0, 1,
-1.918862, -0.8529921, -2.51366, 1, 0.1098039, 0, 1,
-1.904695, -1.012946, -3.635979, 1, 0.1137255, 0, 1,
-1.888581, -0.7915891, -1.856912, 1, 0.1215686, 0, 1,
-1.881192, 0.411279, -2.704178, 1, 0.1254902, 0, 1,
-1.86302, -0.7540815, -0.8891514, 1, 0.1333333, 0, 1,
-1.845525, -0.01218427, -1.736435, 1, 0.1372549, 0, 1,
-1.836207, -0.4723731, -2.181358, 1, 0.145098, 0, 1,
-1.831226, -1.377709, -2.15228, 1, 0.1490196, 0, 1,
-1.829684, -1.543797, -2.704228, 1, 0.1568628, 0, 1,
-1.825985, 2.009692, -1.615626, 1, 0.1607843, 0, 1,
-1.816094, 0.7988585, -0.7037255, 1, 0.1686275, 0, 1,
-1.80074, 0.1737129, -2.576356, 1, 0.172549, 0, 1,
-1.790268, 0.9428837, -1.418619, 1, 0.1803922, 0, 1,
-1.781833, -0.1722176, -2.498371, 1, 0.1843137, 0, 1,
-1.751209, -0.09193483, -0.8301982, 1, 0.1921569, 0, 1,
-1.747786, -0.3540376, -1.856523, 1, 0.1960784, 0, 1,
-1.746913, -1.043561, -0.9641797, 1, 0.2039216, 0, 1,
-1.745727, 1.234345, -1.226221, 1, 0.2117647, 0, 1,
-1.700085, 0.03221906, -0.9545001, 1, 0.2156863, 0, 1,
-1.677609, -2.17089, -2.577454, 1, 0.2235294, 0, 1,
-1.67513, 1.410273, -0.6034354, 1, 0.227451, 0, 1,
-1.670611, -0.9646596, -3.61349, 1, 0.2352941, 0, 1,
-1.6678, -0.741599, -2.699081, 1, 0.2392157, 0, 1,
-1.63486, 0.0149901, -1.15351, 1, 0.2470588, 0, 1,
-1.620929, -0.6111775, -3.266376, 1, 0.2509804, 0, 1,
-1.603869, 0.2645229, -0.7580367, 1, 0.2588235, 0, 1,
-1.601557, 1.166691, -1.000082, 1, 0.2627451, 0, 1,
-1.598589, -0.7291375, -4.004594, 1, 0.2705882, 0, 1,
-1.574541, 0.8457394, -0.6681232, 1, 0.2745098, 0, 1,
-1.562818, -0.8393241, -0.7686362, 1, 0.282353, 0, 1,
-1.560373, 0.8441697, -2.085602, 1, 0.2862745, 0, 1,
-1.558286, -1.450232, -2.242249, 1, 0.2941177, 0, 1,
-1.55647, 1.494475, -0.353042, 1, 0.3019608, 0, 1,
-1.551831, -1.031039, -2.06146, 1, 0.3058824, 0, 1,
-1.551122, 0.4392679, -1.885859, 1, 0.3137255, 0, 1,
-1.545282, 0.05241907, -1.822388, 1, 0.3176471, 0, 1,
-1.538126, 0.6446581, -1.153452, 1, 0.3254902, 0, 1,
-1.537999, -1.207133, -1.177407, 1, 0.3294118, 0, 1,
-1.513892, -2.794982, -2.181444, 1, 0.3372549, 0, 1,
-1.511554, -0.09836312, -0.3584834, 1, 0.3411765, 0, 1,
-1.508277, -2.870548, -1.779144, 1, 0.3490196, 0, 1,
-1.506179, -0.435233, -1.081017, 1, 0.3529412, 0, 1,
-1.501969, -1.281633, -2.115898, 1, 0.3607843, 0, 1,
-1.485102, -0.2709544, -2.019547, 1, 0.3647059, 0, 1,
-1.480078, 0.2025983, -0.9458867, 1, 0.372549, 0, 1,
-1.478568, 1.950524, 1.553562, 1, 0.3764706, 0, 1,
-1.475168, -1.566454, -0.8583, 1, 0.3843137, 0, 1,
-1.473439, 0.4543124, -0.7218661, 1, 0.3882353, 0, 1,
-1.471364, 1.762926, -0.4417945, 1, 0.3960784, 0, 1,
-1.456951, 1.243691, 0.05266768, 1, 0.4039216, 0, 1,
-1.44173, -0.4736436, -1.955783, 1, 0.4078431, 0, 1,
-1.439404, 1.483055, -2.320145, 1, 0.4156863, 0, 1,
-1.436475, -0.7731467, -1.57389, 1, 0.4196078, 0, 1,
-1.432422, -0.4519173, -2.518468, 1, 0.427451, 0, 1,
-1.404155, 0.2228422, -1.406207, 1, 0.4313726, 0, 1,
-1.403308, -0.1304025, -1.149591, 1, 0.4392157, 0, 1,
-1.397073, 0.09318195, -0.472875, 1, 0.4431373, 0, 1,
-1.396286, -0.532577, -1.849958, 1, 0.4509804, 0, 1,
-1.392617, 0.6873523, -1.534748, 1, 0.454902, 0, 1,
-1.373564, 1.778571, -1.244373, 1, 0.4627451, 0, 1,
-1.371014, 0.05475755, -2.596237, 1, 0.4666667, 0, 1,
-1.370953, 0.3979454, -1.641755, 1, 0.4745098, 0, 1,
-1.366633, -0.2241918, -1.023509, 1, 0.4784314, 0, 1,
-1.36536, 1.521618, -2.862753, 1, 0.4862745, 0, 1,
-1.337245, 0.6063482, -1.329708, 1, 0.4901961, 0, 1,
-1.328249, 1.290305, -0.6214954, 1, 0.4980392, 0, 1,
-1.319295, -1.699507, -2.845501, 1, 0.5058824, 0, 1,
-1.312528, 1.206771, -2.081717, 1, 0.509804, 0, 1,
-1.310106, 0.09908505, -0.3001169, 1, 0.5176471, 0, 1,
-1.308607, 0.09181966, -1.21977, 1, 0.5215687, 0, 1,
-1.303313, 0.8864599, -1.358331, 1, 0.5294118, 0, 1,
-1.303192, -0.2947713, -0.8701408, 1, 0.5333334, 0, 1,
-1.301115, 1.565821, -0.9970962, 1, 0.5411765, 0, 1,
-1.297237, -1.654499, -4.591613, 1, 0.5450981, 0, 1,
-1.29361, 1.394496, 0.9787296, 1, 0.5529412, 0, 1,
-1.28669, -0.6700962, -2.085731, 1, 0.5568628, 0, 1,
-1.286395, 0.3583678, 0.632019, 1, 0.5647059, 0, 1,
-1.283867, -0.7733953, -2.161269, 1, 0.5686275, 0, 1,
-1.278893, -0.7848418, -1.196176, 1, 0.5764706, 0, 1,
-1.277558, 1.571035, 0.2364495, 1, 0.5803922, 0, 1,
-1.272491, -0.2706104, -2.697057, 1, 0.5882353, 0, 1,
-1.268913, -1.546414, -0.7489437, 1, 0.5921569, 0, 1,
-1.263124, 0.4446469, -0.2421501, 1, 0.6, 0, 1,
-1.252915, -0.5478094, -0.1930404, 1, 0.6078432, 0, 1,
-1.247973, 0.9930497, 0.4209666, 1, 0.6117647, 0, 1,
-1.244537, 1.007568, -1.266997, 1, 0.6196079, 0, 1,
-1.241587, 0.2117714, -1.597717, 1, 0.6235294, 0, 1,
-1.232542, 0.8316895, -0.958632, 1, 0.6313726, 0, 1,
-1.228151, 1.175463, -1.413109, 1, 0.6352941, 0, 1,
-1.223592, 0.8979817, -1.59702, 1, 0.6431373, 0, 1,
-1.213838, 0.2172452, -1.91639, 1, 0.6470588, 0, 1,
-1.206953, 0.3891711, -1.903841, 1, 0.654902, 0, 1,
-1.198402, -0.2155286, -1.011845, 1, 0.6588235, 0, 1,
-1.193154, -0.3098223, -2.321929, 1, 0.6666667, 0, 1,
-1.190912, -0.4869028, -2.183329, 1, 0.6705883, 0, 1,
-1.17373, -0.39094, -1.770509, 1, 0.6784314, 0, 1,
-1.16281, -0.485619, 0.6044057, 1, 0.682353, 0, 1,
-1.157488, 1.453323, -1.575009, 1, 0.6901961, 0, 1,
-1.152427, -1.960782, -1.017106, 1, 0.6941177, 0, 1,
-1.151973, -0.1091834, -1.075611, 1, 0.7019608, 0, 1,
-1.151346, -1.082013, -2.86084, 1, 0.7098039, 0, 1,
-1.1486, 0.03143352, -2.266415, 1, 0.7137255, 0, 1,
-1.142479, 0.4135306, -2.183444, 1, 0.7215686, 0, 1,
-1.135738, 0.4009629, -2.322855, 1, 0.7254902, 0, 1,
-1.133373, -0.4019855, -1.642269, 1, 0.7333333, 0, 1,
-1.13174, 0.306649, 0.2548034, 1, 0.7372549, 0, 1,
-1.131517, 1.083025, 0.1323174, 1, 0.7450981, 0, 1,
-1.130402, -1.348621, -0.7861741, 1, 0.7490196, 0, 1,
-1.123193, -0.2021911, -3.693541, 1, 0.7568628, 0, 1,
-1.11786, 0.8258413, -1.588973, 1, 0.7607843, 0, 1,
-1.115799, -1.484849, -2.693817, 1, 0.7686275, 0, 1,
-1.100204, 0.1456504, -1.267889, 1, 0.772549, 0, 1,
-1.096012, 1.024583, -1.194611, 1, 0.7803922, 0, 1,
-1.092591, 1.116389, -0.9502082, 1, 0.7843137, 0, 1,
-1.07997, 1.698684, -0.2298818, 1, 0.7921569, 0, 1,
-1.076699, -0.8922678, -0.2946862, 1, 0.7960784, 0, 1,
-1.074756, -0.7491202, -4.252964, 1, 0.8039216, 0, 1,
-1.073245, 0.570762, -2.556609, 1, 0.8117647, 0, 1,
-1.06559, -0.1150152, -1.676708, 1, 0.8156863, 0, 1,
-1.065335, 0.8265075, -1.674315, 1, 0.8235294, 0, 1,
-1.063572, 0.899747, 0.1468137, 1, 0.827451, 0, 1,
-1.058641, 2.064422, 0.6645718, 1, 0.8352941, 0, 1,
-1.055062, 0.3506626, -0.6885154, 1, 0.8392157, 0, 1,
-1.053548, -0.6414846, -2.840124, 1, 0.8470588, 0, 1,
-1.052109, -0.04496385, 0.3996119, 1, 0.8509804, 0, 1,
-1.051157, -0.1865161, -1.210672, 1, 0.8588235, 0, 1,
-1.049383, -1.419477, -4.624008, 1, 0.8627451, 0, 1,
-1.047615, 0.1540015, -1.614409, 1, 0.8705882, 0, 1,
-1.043665, 0.4131635, -1.444793, 1, 0.8745098, 0, 1,
-1.041051, 0.9095348, -1.688348, 1, 0.8823529, 0, 1,
-1.033532, -0.9512325, -2.899389, 1, 0.8862745, 0, 1,
-1.024696, -1.065476, -0.8328122, 1, 0.8941177, 0, 1,
-1.015685, -0.9718683, -1.625251, 1, 0.8980392, 0, 1,
-1.008721, -0.3752504, -1.556744, 1, 0.9058824, 0, 1,
-1.007927, 0.9260167, -1.089224, 1, 0.9137255, 0, 1,
-1.001591, -0.9474835, -1.382582, 1, 0.9176471, 0, 1,
-1.000979, 0.1839235, -0.08083486, 1, 0.9254902, 0, 1,
-0.9925131, -1.27571, -1.821892, 1, 0.9294118, 0, 1,
-0.9894289, -1.529321, -4.043259, 1, 0.9372549, 0, 1,
-0.9834776, 0.5818912, 0.5570507, 1, 0.9411765, 0, 1,
-0.98129, 0.7614497, -0.5216736, 1, 0.9490196, 0, 1,
-0.9786885, -1.104821, -3.077109, 1, 0.9529412, 0, 1,
-0.9765496, 1.972793, 0.1831733, 1, 0.9607843, 0, 1,
-0.9633307, 1.776071, 0.8069925, 1, 0.9647059, 0, 1,
-0.9624696, -0.5121937, -0.7508869, 1, 0.972549, 0, 1,
-0.9603454, 0.1303365, -1.662772, 1, 0.9764706, 0, 1,
-0.9593506, 0.671962, -2.861519, 1, 0.9843137, 0, 1,
-0.9581438, 0.7754183, -1.860943, 1, 0.9882353, 0, 1,
-0.9461052, 1.501104, -1.416115, 1, 0.9960784, 0, 1,
-0.9399412, 0.7368258, 0.1228316, 0.9960784, 1, 0, 1,
-0.9318489, -0.0688338, -1.383235, 0.9921569, 1, 0, 1,
-0.9302091, 0.567789, 0.6950583, 0.9843137, 1, 0, 1,
-0.9293345, 0.3086646, -1.131633, 0.9803922, 1, 0, 1,
-0.9285357, -0.1658477, -1.933365, 0.972549, 1, 0, 1,
-0.9251541, -0.6360698, -1.949683, 0.9686275, 1, 0, 1,
-0.9245266, -0.1396752, -0.3583173, 0.9607843, 1, 0, 1,
-0.9128998, -0.09613112, -1.283507, 0.9568627, 1, 0, 1,
-0.9114204, -0.8230507, -1.548346, 0.9490196, 1, 0, 1,
-0.9097596, 1.160674, -2.342017, 0.945098, 1, 0, 1,
-0.9088504, 1.369784, -0.616828, 0.9372549, 1, 0, 1,
-0.9015517, -1.202945, -2.97439, 0.9333333, 1, 0, 1,
-0.8936912, 0.6076267, 1.172811, 0.9254902, 1, 0, 1,
-0.8879399, -0.2403839, -2.701388, 0.9215686, 1, 0, 1,
-0.8864248, -0.1824348, -2.51991, 0.9137255, 1, 0, 1,
-0.8849806, -0.6014292, -1.078169, 0.9098039, 1, 0, 1,
-0.8802596, 1.189376, 0.8596618, 0.9019608, 1, 0, 1,
-0.8783878, -1.165007, -1.60072, 0.8941177, 1, 0, 1,
-0.8779627, 0.6707882, -0.6825863, 0.8901961, 1, 0, 1,
-0.8769132, 0.9341915, -1.501314, 0.8823529, 1, 0, 1,
-0.8753206, -0.8748815, -3.631343, 0.8784314, 1, 0, 1,
-0.8735816, 0.5292926, -0.419106, 0.8705882, 1, 0, 1,
-0.8616518, -0.1105789, -2.272976, 0.8666667, 1, 0, 1,
-0.8603591, -0.8853512, -2.144286, 0.8588235, 1, 0, 1,
-0.8555776, 1.189116, -0.2855173, 0.854902, 1, 0, 1,
-0.8475057, 0.4326144, -0.215949, 0.8470588, 1, 0, 1,
-0.8471861, -0.1352148, -0.1177605, 0.8431373, 1, 0, 1,
-0.8349659, -1.08486, -3.066309, 0.8352941, 1, 0, 1,
-0.8347885, -0.4049902, -2.319866, 0.8313726, 1, 0, 1,
-0.8259453, 0.3478151, 0.1499828, 0.8235294, 1, 0, 1,
-0.8224488, 0.2258861, -2.45555, 0.8196079, 1, 0, 1,
-0.8190785, 0.8229079, -1.917213, 0.8117647, 1, 0, 1,
-0.8190764, 1.354533, 0.792894, 0.8078431, 1, 0, 1,
-0.8107135, -0.08297428, -2.515887, 0.8, 1, 0, 1,
-0.8104132, -0.4479461, -2.081841, 0.7921569, 1, 0, 1,
-0.8086835, 0.8525282, 1.916476, 0.7882353, 1, 0, 1,
-0.8060298, -0.3668513, -0.8506644, 0.7803922, 1, 0, 1,
-0.8060204, -0.5913437, -1.75771, 0.7764706, 1, 0, 1,
-0.8053823, 0.3930135, -1.554371, 0.7686275, 1, 0, 1,
-0.7995882, 1.372973, -1.264788, 0.7647059, 1, 0, 1,
-0.792585, 0.8692172, -1.370953, 0.7568628, 1, 0, 1,
-0.7906686, -0.8719445, -1.914017, 0.7529412, 1, 0, 1,
-0.788241, -0.2145518, -1.779592, 0.7450981, 1, 0, 1,
-0.7866597, -1.331961, -2.768222, 0.7411765, 1, 0, 1,
-0.7864385, 0.7044945, -0.1225693, 0.7333333, 1, 0, 1,
-0.7835613, 0.4171568, -0.001114397, 0.7294118, 1, 0, 1,
-0.7813331, -0.3343467, -1.987948, 0.7215686, 1, 0, 1,
-0.7811915, 0.6221377, -2.719942, 0.7176471, 1, 0, 1,
-0.7810482, 0.5783027, -0.5929992, 0.7098039, 1, 0, 1,
-0.7780108, 0.7365806, -1.519678, 0.7058824, 1, 0, 1,
-0.7776058, -2.225124, -2.244301, 0.6980392, 1, 0, 1,
-0.7759144, 0.02656171, -1.788116, 0.6901961, 1, 0, 1,
-0.7733918, 0.5721071, -0.128702, 0.6862745, 1, 0, 1,
-0.7722108, 0.385579, -1.924875, 0.6784314, 1, 0, 1,
-0.7689907, -3.473514, -2.032601, 0.6745098, 1, 0, 1,
-0.7658131, -0.2336625, -2.082473, 0.6666667, 1, 0, 1,
-0.7540867, 0.2971195, -0.1771128, 0.6627451, 1, 0, 1,
-0.7508529, -0.5507852, -1.108617, 0.654902, 1, 0, 1,
-0.7477662, -2.601272, -3.376414, 0.6509804, 1, 0, 1,
-0.7465472, 0.25851, -1.251167, 0.6431373, 1, 0, 1,
-0.7435762, 1.22386, -0.8078435, 0.6392157, 1, 0, 1,
-0.7403722, 1.407001, -0.7967454, 0.6313726, 1, 0, 1,
-0.7340775, 0.3316746, -1.503603, 0.627451, 1, 0, 1,
-0.7306173, 1.190461, -0.573476, 0.6196079, 1, 0, 1,
-0.7297732, -1.108474, -3.432629, 0.6156863, 1, 0, 1,
-0.7284223, 1.284694, -0.05302113, 0.6078432, 1, 0, 1,
-0.7224886, -0.3524589, -3.11322, 0.6039216, 1, 0, 1,
-0.7214648, -0.1484268, -0.04097066, 0.5960785, 1, 0, 1,
-0.7193745, -0.9248655, -2.727715, 0.5882353, 1, 0, 1,
-0.7191927, 1.710493, -1.546405, 0.5843138, 1, 0, 1,
-0.718237, -0.3005792, -2.832665, 0.5764706, 1, 0, 1,
-0.7172739, 0.4313383, -0.2420601, 0.572549, 1, 0, 1,
-0.713362, -0.9309343, -2.503788, 0.5647059, 1, 0, 1,
-0.7112618, 0.5951313, -2.28878, 0.5607843, 1, 0, 1,
-0.7006816, 1.804845, 1.381419, 0.5529412, 1, 0, 1,
-0.7005461, 1.482455, 1.581053, 0.5490196, 1, 0, 1,
-0.6998156, 0.0515365, -2.313104, 0.5411765, 1, 0, 1,
-0.6982957, -1.375214, -2.206082, 0.5372549, 1, 0, 1,
-0.6971169, 1.499564, -0.8340837, 0.5294118, 1, 0, 1,
-0.694416, -0.7096441, -2.442759, 0.5254902, 1, 0, 1,
-0.6941751, -1.193498, -3.210006, 0.5176471, 1, 0, 1,
-0.6876726, -1.792002, -2.739411, 0.5137255, 1, 0, 1,
-0.6871061, 0.4764126, -1.458529, 0.5058824, 1, 0, 1,
-0.6865875, 1.796109, -0.5054485, 0.5019608, 1, 0, 1,
-0.6846792, 0.1665342, -1.603304, 0.4941176, 1, 0, 1,
-0.6795312, 1.687461, 1.098498, 0.4862745, 1, 0, 1,
-0.6791787, 1.117293, -0.8755975, 0.4823529, 1, 0, 1,
-0.6787262, 0.06780569, -1.680771, 0.4745098, 1, 0, 1,
-0.6756946, -0.1512141, -1.429843, 0.4705882, 1, 0, 1,
-0.6745763, -0.1450519, -2.452042, 0.4627451, 1, 0, 1,
-0.6716719, -0.9387349, -4.022979, 0.4588235, 1, 0, 1,
-0.6669083, 0.3244233, -0.1666971, 0.4509804, 1, 0, 1,
-0.6602925, -0.4269806, -4.022686, 0.4470588, 1, 0, 1,
-0.6539419, -0.26575, -1.689962, 0.4392157, 1, 0, 1,
-0.6502513, 0.2210115, -2.362896, 0.4352941, 1, 0, 1,
-0.6499084, 0.7418099, -1.179941, 0.427451, 1, 0, 1,
-0.6485242, -0.5955709, -1.632185, 0.4235294, 1, 0, 1,
-0.6473138, 2.540128, -0.1743187, 0.4156863, 1, 0, 1,
-0.6453485, 0.1792285, 0.09498399, 0.4117647, 1, 0, 1,
-0.644989, 1.016842, -0.7579694, 0.4039216, 1, 0, 1,
-0.6419549, -0.4858481, -0.7040176, 0.3960784, 1, 0, 1,
-0.6317935, -0.4980436, -1.682001, 0.3921569, 1, 0, 1,
-0.6283369, -0.1525393, -1.433748, 0.3843137, 1, 0, 1,
-0.6279805, 0.1805643, -1.658829, 0.3803922, 1, 0, 1,
-0.6234881, -0.1330943, -1.536079, 0.372549, 1, 0, 1,
-0.6211463, -0.08294825, -1.796809, 0.3686275, 1, 0, 1,
-0.6205446, 0.1104779, -1.659207, 0.3607843, 1, 0, 1,
-0.6180661, -0.4752478, -2.548219, 0.3568628, 1, 0, 1,
-0.6160191, 0.3679118, -1.717334, 0.3490196, 1, 0, 1,
-0.6138613, 0.3302001, -0.8201286, 0.345098, 1, 0, 1,
-0.6099234, -0.004070291, -2.58592, 0.3372549, 1, 0, 1,
-0.6088104, -0.8025857, -2.937942, 0.3333333, 1, 0, 1,
-0.6059497, -0.7120755, -2.928643, 0.3254902, 1, 0, 1,
-0.5958728, 0.3412009, -1.764753, 0.3215686, 1, 0, 1,
-0.5918571, 0.1083934, -0.98002, 0.3137255, 1, 0, 1,
-0.5862309, -1.510219, -2.969094, 0.3098039, 1, 0, 1,
-0.5855645, 1.653803, 0.4461723, 0.3019608, 1, 0, 1,
-0.5852414, 0.8990169, -0.6867704, 0.2941177, 1, 0, 1,
-0.5848252, -1.337704, -2.943801, 0.2901961, 1, 0, 1,
-0.5749158, -0.2020727, -2.600237, 0.282353, 1, 0, 1,
-0.5716478, 0.6453814, 0.4068858, 0.2784314, 1, 0, 1,
-0.569968, -1.378949, -3.248113, 0.2705882, 1, 0, 1,
-0.5609676, 1.411369, 0.331546, 0.2666667, 1, 0, 1,
-0.5595903, 1.445684, 0.4162878, 0.2588235, 1, 0, 1,
-0.5575653, 0.5817757, -0.09926204, 0.254902, 1, 0, 1,
-0.5542001, 1.766026, -0.407709, 0.2470588, 1, 0, 1,
-0.5533181, -1.483488, -3.91344, 0.2431373, 1, 0, 1,
-0.5528799, 0.45946, -1.231618, 0.2352941, 1, 0, 1,
-0.5508341, -0.05046353, -1.535111, 0.2313726, 1, 0, 1,
-0.550108, 0.3510281, -2.022236, 0.2235294, 1, 0, 1,
-0.5500439, 0.002675032, -1.559301, 0.2196078, 1, 0, 1,
-0.5467538, -0.224373, -2.138664, 0.2117647, 1, 0, 1,
-0.5361269, -1.017783, -1.060531, 0.2078431, 1, 0, 1,
-0.5346221, -0.3822095, -2.839567, 0.2, 1, 0, 1,
-0.5326673, 0.6011235, -0.738658, 0.1921569, 1, 0, 1,
-0.5320557, 1.039147, 0.3348751, 0.1882353, 1, 0, 1,
-0.5310999, -0.8890128, -6.067508, 0.1803922, 1, 0, 1,
-0.5284338, 2.070324, -0.6812152, 0.1764706, 1, 0, 1,
-0.5251777, -0.3480522, -1.216105, 0.1686275, 1, 0, 1,
-0.5240316, -0.2434303, -1.860777, 0.1647059, 1, 0, 1,
-0.5118222, -0.8694624, -3.921283, 0.1568628, 1, 0, 1,
-0.5105402, -0.153177, -1.953444, 0.1529412, 1, 0, 1,
-0.5095094, 1.220026, -0.961359, 0.145098, 1, 0, 1,
-0.5080561, -2.000297, -1.211533, 0.1411765, 1, 0, 1,
-0.5051249, 1.486562, 0.8280826, 0.1333333, 1, 0, 1,
-0.5034248, 1.501592, -0.7983949, 0.1294118, 1, 0, 1,
-0.5027377, 0.5354789, -1.973018, 0.1215686, 1, 0, 1,
-0.499377, 1.534107, -0.4941099, 0.1176471, 1, 0, 1,
-0.4985672, 0.363115, -1.3359, 0.1098039, 1, 0, 1,
-0.4979815, 0.6834049, -4.022181, 0.1058824, 1, 0, 1,
-0.4935828, -2.034239, -3.169358, 0.09803922, 1, 0, 1,
-0.4860088, -0.3516826, -1.020908, 0.09019608, 1, 0, 1,
-0.4830007, 0.4948983, -3.344464, 0.08627451, 1, 0, 1,
-0.479659, -0.3474928, -1.650912, 0.07843138, 1, 0, 1,
-0.4794998, -0.1136418, -2.150558, 0.07450981, 1, 0, 1,
-0.4787503, 0.7291959, 0.5460821, 0.06666667, 1, 0, 1,
-0.4737061, -0.7384893, -2.137293, 0.0627451, 1, 0, 1,
-0.4712436, 0.3536902, 0.01499479, 0.05490196, 1, 0, 1,
-0.4697865, 0.243722, -0.5146383, 0.05098039, 1, 0, 1,
-0.4661963, -0.1467541, -0.986451, 0.04313726, 1, 0, 1,
-0.4633636, -0.1371159, -0.6805927, 0.03921569, 1, 0, 1,
-0.4595775, 0.5620581, -0.6431859, 0.03137255, 1, 0, 1,
-0.4546431, -0.7204694, -2.157803, 0.02745098, 1, 0, 1,
-0.4508798, 0.164111, -1.508027, 0.01960784, 1, 0, 1,
-0.4507308, 0.1128643, -1.250726, 0.01568628, 1, 0, 1,
-0.4482725, 0.09513137, -1.225301, 0.007843138, 1, 0, 1,
-0.4445805, -1.449193, -1.354957, 0.003921569, 1, 0, 1,
-0.4406054, -1.27398, -1.961417, 0, 1, 0.003921569, 1,
-0.4385043, 0.002172781, -2.928718, 0, 1, 0.01176471, 1,
-0.4338722, 0.01922375, -0.8493378, 0, 1, 0.01568628, 1,
-0.4321989, 0.6554643, -0.5649084, 0, 1, 0.02352941, 1,
-0.4320051, 1.065781, -0.7505529, 0, 1, 0.02745098, 1,
-0.4308681, 1.918033, -1.499665, 0, 1, 0.03529412, 1,
-0.4304559, -0.3690965, -1.557199, 0, 1, 0.03921569, 1,
-0.4295534, -1.414529, -2.863331, 0, 1, 0.04705882, 1,
-0.4295319, -0.1298862, -0.8528662, 0, 1, 0.05098039, 1,
-0.4272666, -0.2479787, -0.987829, 0, 1, 0.05882353, 1,
-0.4226166, 1.021701, -1.74497, 0, 1, 0.0627451, 1,
-0.4216637, -1.315104, -3.408715, 0, 1, 0.07058824, 1,
-0.4210683, -0.6188436, -2.242961, 0, 1, 0.07450981, 1,
-0.4194806, -0.3593073, -1.495897, 0, 1, 0.08235294, 1,
-0.4166861, 0.9735994, 0.8725363, 0, 1, 0.08627451, 1,
-0.4163662, 0.4448225, -1.757454, 0, 1, 0.09411765, 1,
-0.414779, 0.3503668, 0.002448556, 0, 1, 0.1019608, 1,
-0.4144575, -0.1499217, -1.097372, 0, 1, 0.1058824, 1,
-0.4126242, -1.179487, -3.630272, 0, 1, 0.1137255, 1,
-0.4087226, -0.7749156, -4.159036, 0, 1, 0.1176471, 1,
-0.4079768, -0.4088981, -2.411192, 0, 1, 0.1254902, 1,
-0.3962658, -0.5949484, -3.138568, 0, 1, 0.1294118, 1,
-0.392101, 0.1512192, -0.2114637, 0, 1, 0.1372549, 1,
-0.3918183, -0.947437, -2.259332, 0, 1, 0.1411765, 1,
-0.3903509, 0.1380554, -0.1177809, 0, 1, 0.1490196, 1,
-0.3893388, -0.09594762, -2.850835, 0, 1, 0.1529412, 1,
-0.3887469, 0.3201708, 0.7291039, 0, 1, 0.1607843, 1,
-0.3848236, 0.8239471, 1.306988, 0, 1, 0.1647059, 1,
-0.3846144, -0.3064114, -0.8170348, 0, 1, 0.172549, 1,
-0.3800229, 0.2998709, -1.358433, 0, 1, 0.1764706, 1,
-0.3763974, -0.7105006, -1.143684, 0, 1, 0.1843137, 1,
-0.3744355, -1.289129, -1.064344, 0, 1, 0.1882353, 1,
-0.3707542, 1.37251, -0.5668234, 0, 1, 0.1960784, 1,
-0.3627893, 0.8297608, -0.9749303, 0, 1, 0.2039216, 1,
-0.3624584, 0.6954781, -0.4128602, 0, 1, 0.2078431, 1,
-0.3602142, 0.4158144, -1.148279, 0, 1, 0.2156863, 1,
-0.3534225, 1.123638, 0.2556708, 0, 1, 0.2196078, 1,
-0.3478765, 0.09785728, -1.648602, 0, 1, 0.227451, 1,
-0.3458612, -0.137044, -1.675803, 0, 1, 0.2313726, 1,
-0.3439597, 0.3020694, 1.014033, 0, 1, 0.2392157, 1,
-0.3390887, 0.1956646, -0.2425946, 0, 1, 0.2431373, 1,
-0.3380545, -1.200816, -3.632691, 0, 1, 0.2509804, 1,
-0.3362909, -0.3128144, -2.306418, 0, 1, 0.254902, 1,
-0.3348217, 0.4072897, -0.7707664, 0, 1, 0.2627451, 1,
-0.3275968, 0.285654, -1.675424, 0, 1, 0.2666667, 1,
-0.3268115, -0.3562873, -3.653603, 0, 1, 0.2745098, 1,
-0.3258217, 0.2480087, -0.5403777, 0, 1, 0.2784314, 1,
-0.325347, 0.5177975, 0.7380424, 0, 1, 0.2862745, 1,
-0.3197392, 0.4931445, -1.866518, 0, 1, 0.2901961, 1,
-0.3196217, 0.2638568, -0.2585315, 0, 1, 0.2980392, 1,
-0.3188269, -0.276913, -1.992938, 0, 1, 0.3058824, 1,
-0.3157371, -0.1059948, -2.468811, 0, 1, 0.3098039, 1,
-0.3124229, 0.1819216, 0.5626324, 0, 1, 0.3176471, 1,
-0.3102356, 1.202432, -1.652553, 0, 1, 0.3215686, 1,
-0.3086253, -0.8354862, -2.532435, 0, 1, 0.3294118, 1,
-0.303185, -0.3416019, -2.782855, 0, 1, 0.3333333, 1,
-0.3026869, -1.422538, -2.439464, 0, 1, 0.3411765, 1,
-0.278789, -0.5704649, -3.452317, 0, 1, 0.345098, 1,
-0.26793, 0.1925624, -1.225585, 0, 1, 0.3529412, 1,
-0.2669114, -0.1923009, -0.5966362, 0, 1, 0.3568628, 1,
-0.2645526, 0.1940841, -0.8777158, 0, 1, 0.3647059, 1,
-0.2606921, -2.307745, -3.605615, 0, 1, 0.3686275, 1,
-0.258493, 0.357262, 1.153648, 0, 1, 0.3764706, 1,
-0.2563988, -1.135931, -3.103536, 0, 1, 0.3803922, 1,
-0.256342, 0.1412584, -1.737761, 0, 1, 0.3882353, 1,
-0.2560055, 0.2788313, -0.1594574, 0, 1, 0.3921569, 1,
-0.2540715, 0.7708982, -1.116467, 0, 1, 0.4, 1,
-0.2534113, -0.846575, -1.680539, 0, 1, 0.4078431, 1,
-0.250865, -0.2961577, -2.898284, 0, 1, 0.4117647, 1,
-0.2505111, -1.500133, -3.515808, 0, 1, 0.4196078, 1,
-0.2489583, -0.3716264, -0.4987724, 0, 1, 0.4235294, 1,
-0.2444864, 1.710583, 0.4116709, 0, 1, 0.4313726, 1,
-0.2412657, -1.908444, -1.73472, 0, 1, 0.4352941, 1,
-0.2412185, 1.151446, -0.678999, 0, 1, 0.4431373, 1,
-0.2402435, -0.4274269, -3.139492, 0, 1, 0.4470588, 1,
-0.2350126, 0.2100906, -1.07205, 0, 1, 0.454902, 1,
-0.2333419, 1.262424, 0.5972185, 0, 1, 0.4588235, 1,
-0.2267527, 0.6106892, 0.9922053, 0, 1, 0.4666667, 1,
-0.2229494, 1.332209, 0.1613585, 0, 1, 0.4705882, 1,
-0.2207197, -0.177168, -1.288507, 0, 1, 0.4784314, 1,
-0.2194005, -0.5551512, -1.763031, 0, 1, 0.4823529, 1,
-0.2183397, -0.5097845, -4.489403, 0, 1, 0.4901961, 1,
-0.217365, 0.1198046, -1.113405, 0, 1, 0.4941176, 1,
-0.208601, -0.4599306, -3.608914, 0, 1, 0.5019608, 1,
-0.2079442, -0.1642437, -2.731045, 0, 1, 0.509804, 1,
-0.203237, -1.058691, -2.307882, 0, 1, 0.5137255, 1,
-0.2024771, 1.113865, -0.1197814, 0, 1, 0.5215687, 1,
-0.201461, -0.07557235, -2.948855, 0, 1, 0.5254902, 1,
-0.201106, 0.3026497, -0.8099493, 0, 1, 0.5333334, 1,
-0.1937893, -1.125336, -2.297797, 0, 1, 0.5372549, 1,
-0.1917167, 0.874686, -1.195013, 0, 1, 0.5450981, 1,
-0.1875565, 0.685737, -1.302204, 0, 1, 0.5490196, 1,
-0.1844375, -0.7298173, -1.576133, 0, 1, 0.5568628, 1,
-0.1833472, 0.2335434, -0.1426804, 0, 1, 0.5607843, 1,
-0.1826988, 0.9242338, 0.1401025, 0, 1, 0.5686275, 1,
-0.1822667, -1.957447, -3.370877, 0, 1, 0.572549, 1,
-0.1821602, 0.0965738, -2.880449, 0, 1, 0.5803922, 1,
-0.1799888, -0.9934507, -2.4951, 0, 1, 0.5843138, 1,
-0.1798098, 1.220824, -1.029003, 0, 1, 0.5921569, 1,
-0.1778582, 0.02617509, -1.622041, 0, 1, 0.5960785, 1,
-0.1695469, 1.46835, -0.3394569, 0, 1, 0.6039216, 1,
-0.1670063, -0.7140514, -2.710344, 0, 1, 0.6117647, 1,
-0.1656774, -0.7594599, -3.108413, 0, 1, 0.6156863, 1,
-0.1654839, 1.032445, -0.7470756, 0, 1, 0.6235294, 1,
-0.1653554, -0.2405499, -2.709605, 0, 1, 0.627451, 1,
-0.1644024, 0.7438577, -1.016971, 0, 1, 0.6352941, 1,
-0.1616025, -0.8431417, -4.986046, 0, 1, 0.6392157, 1,
-0.1532124, -1.340902, -3.316798, 0, 1, 0.6470588, 1,
-0.1498392, 0.9591826, 0.0561443, 0, 1, 0.6509804, 1,
-0.149146, 0.5779419, 0.9024367, 0, 1, 0.6588235, 1,
-0.1485695, -0.008816801, -2.160005, 0, 1, 0.6627451, 1,
-0.1477677, 1.47833, 0.7718639, 0, 1, 0.6705883, 1,
-0.1472791, 0.2723713, 0.6905508, 0, 1, 0.6745098, 1,
-0.1446278, -0.2801455, -1.629232, 0, 1, 0.682353, 1,
-0.1442012, -2.363529, -2.61102, 0, 1, 0.6862745, 1,
-0.1441181, 0.2836505, -2.060353, 0, 1, 0.6941177, 1,
-0.1410593, -0.3449405, -2.127275, 0, 1, 0.7019608, 1,
-0.1388223, 0.7003872, -0.5928964, 0, 1, 0.7058824, 1,
-0.1339528, -0.1692585, -2.687563, 0, 1, 0.7137255, 1,
-0.1255821, 1.171913, -0.1362842, 0, 1, 0.7176471, 1,
-0.1242765, 1.187152, -0.6149544, 0, 1, 0.7254902, 1,
-0.1221093, 0.1368543, -2.243343, 0, 1, 0.7294118, 1,
-0.1203777, -1.12496, -2.006124, 0, 1, 0.7372549, 1,
-0.1194212, -1.804599, -2.511877, 0, 1, 0.7411765, 1,
-0.1167424, -0.9142048, -4.423522, 0, 1, 0.7490196, 1,
-0.1152318, -0.04408344, -0.8762256, 0, 1, 0.7529412, 1,
-0.114806, 0.5084075, -1.248771, 0, 1, 0.7607843, 1,
-0.1139704, 1.531855, -0.4214424, 0, 1, 0.7647059, 1,
-0.1003625, -0.1514649, -3.303378, 0, 1, 0.772549, 1,
-0.09475403, -0.0237149, -0.1910712, 0, 1, 0.7764706, 1,
-0.09360761, -0.877088, -3.18496, 0, 1, 0.7843137, 1,
-0.09326521, 0.5879692, -1.127903, 0, 1, 0.7882353, 1,
-0.09298121, 0.935434, -0.7963507, 0, 1, 0.7960784, 1,
-0.09258424, 0.7482316, -1.010527, 0, 1, 0.8039216, 1,
-0.08998714, 0.3994398, 0.2477673, 0, 1, 0.8078431, 1,
-0.08955252, 0.6724917, 1.03265, 0, 1, 0.8156863, 1,
-0.0865944, -3.241132, -2.815433, 0, 1, 0.8196079, 1,
-0.085275, -0.3548152, -2.368793, 0, 1, 0.827451, 1,
-0.08051826, 0.7613088, 0.7062769, 0, 1, 0.8313726, 1,
-0.07813606, 1.731167, 0.1460293, 0, 1, 0.8392157, 1,
-0.07723821, 0.6738873, 1.029631, 0, 1, 0.8431373, 1,
-0.07391814, 1.556209, -2.302085, 0, 1, 0.8509804, 1,
-0.07347137, -0.4910543, -2.668334, 0, 1, 0.854902, 1,
-0.07113498, 1.353627, 0.07716618, 0, 1, 0.8627451, 1,
-0.07015588, 0.8430219, -1.044501, 0, 1, 0.8666667, 1,
-0.0685303, -1.63381, -4.326311, 0, 1, 0.8745098, 1,
-0.06246863, -0.8164487, -2.41301, 0, 1, 0.8784314, 1,
-0.06016942, -0.3755893, -3.649927, 0, 1, 0.8862745, 1,
-0.05868443, 0.0585775, -0.990369, 0, 1, 0.8901961, 1,
-0.0564331, 1.117632, 0.6082726, 0, 1, 0.8980392, 1,
-0.05297815, 0.1559027, -0.5053845, 0, 1, 0.9058824, 1,
-0.05293084, 0.1013719, -1.489092, 0, 1, 0.9098039, 1,
-0.05272797, 0.5795987, 0.5115028, 0, 1, 0.9176471, 1,
-0.05253201, -0.8111701, -3.704932, 0, 1, 0.9215686, 1,
-0.05099931, 2.276155, 0.2852584, 0, 1, 0.9294118, 1,
-0.04994821, -0.2814516, -3.294687, 0, 1, 0.9333333, 1,
-0.04959615, 1.07899, -0.03397417, 0, 1, 0.9411765, 1,
-0.04741466, 0.3495282, 0.2030778, 0, 1, 0.945098, 1,
-0.04698382, 0.4645667, -1.114758, 0, 1, 0.9529412, 1,
-0.04698024, 0.4318842, -0.04158661, 0, 1, 0.9568627, 1,
-0.04620982, 0.3744153, -0.4353817, 0, 1, 0.9647059, 1,
-0.04417627, -0.1453098, -2.163631, 0, 1, 0.9686275, 1,
-0.04369213, -0.177039, -3.081125, 0, 1, 0.9764706, 1,
-0.04341191, 0.6738433, 0.7764874, 0, 1, 0.9803922, 1,
-0.04172691, 0.1449763, 0.3577512, 0, 1, 0.9882353, 1,
-0.04080775, -0.001852679, -1.41234, 0, 1, 0.9921569, 1,
-0.03847722, 0.6388018, -1.193522, 0, 1, 1, 1,
-0.03783061, -0.2766472, -4.685953, 0, 0.9921569, 1, 1,
-0.03694393, -0.3036166, -1.930184, 0, 0.9882353, 1, 1,
-0.03653024, -1.162862, -3.712768, 0, 0.9803922, 1, 1,
-0.03226114, 0.02182759, -0.5606664, 0, 0.9764706, 1, 1,
-0.03201409, -0.161105, -3.192146, 0, 0.9686275, 1, 1,
-0.03127518, -0.9612206, -3.032476, 0, 0.9647059, 1, 1,
-0.02846644, -1.446911, -4.641196, 0, 0.9568627, 1, 1,
-0.01847018, -0.3406808, -0.9453091, 0, 0.9529412, 1, 1,
-0.01390077, 0.05236491, 1.521207, 0, 0.945098, 1, 1,
-0.01371248, 0.1379361, -1.732061, 0, 0.9411765, 1, 1,
-0.01098843, 0.682588, -0.9543664, 0, 0.9333333, 1, 1,
-0.01086055, -0.07344469, -3.643969, 0, 0.9294118, 1, 1,
-0.008280626, 1.007458, -2.077235, 0, 0.9215686, 1, 1,
-0.008254594, -0.4680887, -2.541175, 0, 0.9176471, 1, 1,
-0.006683207, -1.014674, -4.580543, 0, 0.9098039, 1, 1,
-0.004601614, -1.571854, -2.953906, 0, 0.9058824, 1, 1,
-0.003642018, 0.5005843, 0.6004077, 0, 0.8980392, 1, 1,
-0.003389064, 0.7099077, -0.2624015, 0, 0.8901961, 1, 1,
-0.003374022, 0.6115224, 1.314031, 0, 0.8862745, 1, 1,
-0.002889888, 1.183641, 1.065581, 0, 0.8784314, 1, 1,
0.001453577, -0.1747811, 5.871272, 0, 0.8745098, 1, 1,
0.00335407, -0.7459067, 2.707942, 0, 0.8666667, 1, 1,
0.004744898, -0.9058927, 3.074072, 0, 0.8627451, 1, 1,
0.006999456, -0.05834517, 0.9020286, 0, 0.854902, 1, 1,
0.008738334, 0.7468618, 1.523878, 0, 0.8509804, 1, 1,
0.01004823, 0.1356384, 0.7364528, 0, 0.8431373, 1, 1,
0.01181893, 3.080244, 0.9481294, 0, 0.8392157, 1, 1,
0.0174803, 0.8576882, 0.08896297, 0, 0.8313726, 1, 1,
0.01899541, -1.632467, 3.814284, 0, 0.827451, 1, 1,
0.01911274, -0.92914, 2.863682, 0, 0.8196079, 1, 1,
0.01989892, -0.6018632, 2.437692, 0, 0.8156863, 1, 1,
0.02136281, -1.828449, 4.077144, 0, 0.8078431, 1, 1,
0.02564466, -0.4231362, 1.855832, 0, 0.8039216, 1, 1,
0.03596022, -0.9931449, 4.04857, 0, 0.7960784, 1, 1,
0.0424445, 1.075561, -1.482506, 0, 0.7882353, 1, 1,
0.04306876, -0.09924883, 2.451052, 0, 0.7843137, 1, 1,
0.0449171, -0.6124129, 1.137305, 0, 0.7764706, 1, 1,
0.04496395, 2.454483, -0.9385963, 0, 0.772549, 1, 1,
0.04611822, 0.03381804, 1.228251, 0, 0.7647059, 1, 1,
0.05412695, 0.4882658, 1.228957, 0, 0.7607843, 1, 1,
0.05824235, 0.09764934, 0.4277933, 0, 0.7529412, 1, 1,
0.06302197, 1.166832, 1.104388, 0, 0.7490196, 1, 1,
0.06872509, 0.9629837, 0.4960306, 0, 0.7411765, 1, 1,
0.06948147, 1.465074, 0.3630856, 0, 0.7372549, 1, 1,
0.0708586, 0.539074, 1.099307, 0, 0.7294118, 1, 1,
0.07405739, -0.5439274, 1.661035, 0, 0.7254902, 1, 1,
0.0840774, 0.9566765, 0.96779, 0, 0.7176471, 1, 1,
0.08734038, -0.03709112, 1.085272, 0, 0.7137255, 1, 1,
0.0916884, 0.7818363, 1.847723, 0, 0.7058824, 1, 1,
0.0956056, 0.3525358, -0.04535739, 0, 0.6980392, 1, 1,
0.09746902, 0.4740848, 1.260909, 0, 0.6941177, 1, 1,
0.1024852, -1.571067, 3.801929, 0, 0.6862745, 1, 1,
0.104947, 0.2307784, 1.259903, 0, 0.682353, 1, 1,
0.1091485, 0.4994181, 0.6182383, 0, 0.6745098, 1, 1,
0.1099246, -0.74417, 4.793016, 0, 0.6705883, 1, 1,
0.1103714, 1.568906, 0.2126805, 0, 0.6627451, 1, 1,
0.1107458, 0.1793462, -0.2063697, 0, 0.6588235, 1, 1,
0.1126463, 0.3298493, 2.082291, 0, 0.6509804, 1, 1,
0.1131827, 0.8350931, -0.2448745, 0, 0.6470588, 1, 1,
0.1195225, -0.7644622, 2.592086, 0, 0.6392157, 1, 1,
0.1228623, 0.13512, 0.8300499, 0, 0.6352941, 1, 1,
0.1235944, 0.7119011, 1.685317, 0, 0.627451, 1, 1,
0.1239517, -0.8888293, 4.088836, 0, 0.6235294, 1, 1,
0.1241464, -0.8652006, 4.169756, 0, 0.6156863, 1, 1,
0.1249897, 0.122104, -0.9193232, 0, 0.6117647, 1, 1,
0.1271358, -1.779904, 3.219268, 0, 0.6039216, 1, 1,
0.1320541, -0.8686771, 5.06275, 0, 0.5960785, 1, 1,
0.1349353, 0.6328843, -0.8602633, 0, 0.5921569, 1, 1,
0.1355715, 0.8157508, -0.1330329, 0, 0.5843138, 1, 1,
0.1416239, 0.08616173, 2.484623, 0, 0.5803922, 1, 1,
0.1431535, 0.4135138, 1.077304, 0, 0.572549, 1, 1,
0.1460045, -1.373927, 1.395418, 0, 0.5686275, 1, 1,
0.1488564, 1.098487, 1.941441, 0, 0.5607843, 1, 1,
0.1492351, -0.2307798, 2.051307, 0, 0.5568628, 1, 1,
0.150912, -0.24888, 1.230103, 0, 0.5490196, 1, 1,
0.1539336, -1.05047, 2.940128, 0, 0.5450981, 1, 1,
0.154099, -0.2606101, 3.349439, 0, 0.5372549, 1, 1,
0.1581542, -0.6901343, 2.400634, 0, 0.5333334, 1, 1,
0.1591512, 1.603269, -0.8610527, 0, 0.5254902, 1, 1,
0.1603814, 0.8072522, -0.3603838, 0, 0.5215687, 1, 1,
0.1645278, 1.002109, -0.8042703, 0, 0.5137255, 1, 1,
0.1646839, -1.552281, 4.184236, 0, 0.509804, 1, 1,
0.1705026, 1.226227, 0.424437, 0, 0.5019608, 1, 1,
0.1793857, 0.6761126, -1.173989, 0, 0.4941176, 1, 1,
0.1832362, -0.0987459, 3.345435, 0, 0.4901961, 1, 1,
0.1834526, -0.07613477, 2.990755, 0, 0.4823529, 1, 1,
0.1858388, 0.5488122, -0.6066731, 0, 0.4784314, 1, 1,
0.1878193, 1.440135, 0.4838622, 0, 0.4705882, 1, 1,
0.1888964, -0.02383877, 3.169388, 0, 0.4666667, 1, 1,
0.1900291, -1.2285, 0.9605899, 0, 0.4588235, 1, 1,
0.190229, 0.05121373, 1.355844, 0, 0.454902, 1, 1,
0.1925592, 0.3183266, 1.299294, 0, 0.4470588, 1, 1,
0.1940252, -0.6490854, 3.153385, 0, 0.4431373, 1, 1,
0.1940495, 1.471155, 0.4919069, 0, 0.4352941, 1, 1,
0.1946247, -0.9544604, 2.592918, 0, 0.4313726, 1, 1,
0.1956878, -1.00576, 2.005781, 0, 0.4235294, 1, 1,
0.1963455, 0.5670939, -0.0238797, 0, 0.4196078, 1, 1,
0.19983, 0.8516374, -1.282127, 0, 0.4117647, 1, 1,
0.2037329, -0.667242, 3.024147, 0, 0.4078431, 1, 1,
0.209024, -0.9899858, 2.241702, 0, 0.4, 1, 1,
0.2098902, -0.3379399, 2.972787, 0, 0.3921569, 1, 1,
0.2144452, 0.884111, 2.04277, 0, 0.3882353, 1, 1,
0.2165277, 0.2950625, -0.232756, 0, 0.3803922, 1, 1,
0.2202231, 0.2855694, 0.5100073, 0, 0.3764706, 1, 1,
0.2204429, 1.183638, -0.08240591, 0, 0.3686275, 1, 1,
0.2234248, 1.585605, 0.73185, 0, 0.3647059, 1, 1,
0.2249538, 0.3542928, 1.678852, 0, 0.3568628, 1, 1,
0.2267008, -1.980239, 1.912595, 0, 0.3529412, 1, 1,
0.2287216, 0.468352, 2.043174, 0, 0.345098, 1, 1,
0.2311022, -0.7445286, 2.751217, 0, 0.3411765, 1, 1,
0.2311635, -0.3961409, 4.690354, 0, 0.3333333, 1, 1,
0.2318429, 0.1535195, 1.517001, 0, 0.3294118, 1, 1,
0.2341228, 0.791678, -0.08426929, 0, 0.3215686, 1, 1,
0.2374297, 1.288016, 2.458709, 0, 0.3176471, 1, 1,
0.2382351, -1.076933, 3.389994, 0, 0.3098039, 1, 1,
0.2396936, -0.9804408, 0.4899562, 0, 0.3058824, 1, 1,
0.2420911, 1.377298, -0.5045237, 0, 0.2980392, 1, 1,
0.2440529, -0.4675095, 2.454078, 0, 0.2901961, 1, 1,
0.2477978, -0.7684536, 3.625973, 0, 0.2862745, 1, 1,
0.2495604, -0.9730247, 2.421232, 0, 0.2784314, 1, 1,
0.2507854, -1.412446, 2.370361, 0, 0.2745098, 1, 1,
0.2515751, -0.7829316, 1.397648, 0, 0.2666667, 1, 1,
0.2554245, -0.7576391, 2.825343, 0, 0.2627451, 1, 1,
0.2585592, 0.2022839, -0.5817991, 0, 0.254902, 1, 1,
0.260363, 0.668871, -1.394301, 0, 0.2509804, 1, 1,
0.2728872, 0.6651518, 0.9741918, 0, 0.2431373, 1, 1,
0.2753035, -0.2461224, 0.2348977, 0, 0.2392157, 1, 1,
0.2818702, 0.541223, 2.2097, 0, 0.2313726, 1, 1,
0.2865199, -2.166491, 2.244015, 0, 0.227451, 1, 1,
0.2880473, -1.311226, 2.635619, 0, 0.2196078, 1, 1,
0.2953447, -0.7946244, 1.943531, 0, 0.2156863, 1, 1,
0.2954175, -0.8337545, 2.449019, 0, 0.2078431, 1, 1,
0.3036937, -1.417022, 2.49026, 0, 0.2039216, 1, 1,
0.3073168, -1.088973, 4.524068, 0, 0.1960784, 1, 1,
0.3079611, -0.8776639, 3.313137, 0, 0.1882353, 1, 1,
0.3097206, -0.7312142, 2.001559, 0, 0.1843137, 1, 1,
0.3100021, -1.182553, 2.610303, 0, 0.1764706, 1, 1,
0.3135057, -0.4442255, 2.125869, 0, 0.172549, 1, 1,
0.3136473, -4.060377e-05, -0.02941543, 0, 0.1647059, 1, 1,
0.3199729, -0.2921847, 1.222888, 0, 0.1607843, 1, 1,
0.329817, 0.1303273, -0.1468997, 0, 0.1529412, 1, 1,
0.3309467, 0.09808329, 0.8502049, 0, 0.1490196, 1, 1,
0.3377302, -1.088691, 3.966449, 0, 0.1411765, 1, 1,
0.3396216, 0.1366855, 1.291152, 0, 0.1372549, 1, 1,
0.339956, -0.7874198, 3.99696, 0, 0.1294118, 1, 1,
0.3400324, 1.804331, 0.7163747, 0, 0.1254902, 1, 1,
0.3403841, 1.522982, 0.09402567, 0, 0.1176471, 1, 1,
0.3416514, -0.1267498, 1.824054, 0, 0.1137255, 1, 1,
0.3442812, 0.1983505, -0.06471288, 0, 0.1058824, 1, 1,
0.3469006, -1.63425, 4.282825, 0, 0.09803922, 1, 1,
0.3530554, 0.2032436, 1.164983, 0, 0.09411765, 1, 1,
0.3593662, -1.210407, 2.575811, 0, 0.08627451, 1, 1,
0.360876, 0.5102615, 0.6596088, 0, 0.08235294, 1, 1,
0.3670998, 0.9051095, 1.17936, 0, 0.07450981, 1, 1,
0.3680547, -1.981678, 3.081251, 0, 0.07058824, 1, 1,
0.368757, -0.09127912, 1.473712, 0, 0.0627451, 1, 1,
0.3760248, 0.5640998, 1.704306, 0, 0.05882353, 1, 1,
0.3769985, -0.8244963, 2.076659, 0, 0.05098039, 1, 1,
0.3833648, -0.521908, 0.9774475, 0, 0.04705882, 1, 1,
0.3841128, 1.968921, -1.149234, 0, 0.03921569, 1, 1,
0.3857182, 0.3089709, -0.2591737, 0, 0.03529412, 1, 1,
0.3874342, 0.9832006, 0.6379221, 0, 0.02745098, 1, 1,
0.3876413, 0.9473928, -1.056131, 0, 0.02352941, 1, 1,
0.3876664, -0.9802249, 2.59135, 0, 0.01568628, 1, 1,
0.387716, -0.5265476, 2.58171, 0, 0.01176471, 1, 1,
0.3902128, -0.1004636, 1.487676, 0, 0.003921569, 1, 1,
0.3902877, 0.3116545, 3.115162, 0.003921569, 0, 1, 1,
0.3918, -0.1606154, 3.07233, 0.007843138, 0, 1, 1,
0.3921067, 0.5424439, -0.5331939, 0.01568628, 0, 1, 1,
0.3939083, -0.7881024, 1.299596, 0.01960784, 0, 1, 1,
0.3964185, 0.849079, 1.961151, 0.02745098, 0, 1, 1,
0.417141, -0.3543992, 2.004614, 0.03137255, 0, 1, 1,
0.4435506, 0.4559848, -0.5572556, 0.03921569, 0, 1, 1,
0.4492474, -1.586493, 3.214976, 0.04313726, 0, 1, 1,
0.4496306, -0.3892809, 2.279587, 0.05098039, 0, 1, 1,
0.456015, 0.1715449, 2.077824, 0.05490196, 0, 1, 1,
0.4603941, -0.5107905, 3.247245, 0.0627451, 0, 1, 1,
0.4610583, -0.7333656, 1.81477, 0.06666667, 0, 1, 1,
0.4622682, 0.2132683, 1.877555, 0.07450981, 0, 1, 1,
0.4623095, -0.5409591, 1.919329, 0.07843138, 0, 1, 1,
0.4623314, -0.0127215, 2.497785, 0.08627451, 0, 1, 1,
0.4658231, -0.7579533, 1.164757, 0.09019608, 0, 1, 1,
0.47467, 1.673724, -0.006649951, 0.09803922, 0, 1, 1,
0.4762155, -0.6249297, 3.751523, 0.1058824, 0, 1, 1,
0.4799737, 0.1095491, 0.3675771, 0.1098039, 0, 1, 1,
0.4800612, 0.8429813, 1.117469, 0.1176471, 0, 1, 1,
0.4817231, 0.5478628, 0.1192484, 0.1215686, 0, 1, 1,
0.4866547, -0.1235607, 1.70659, 0.1294118, 0, 1, 1,
0.4890445, 1.076426, 1.499253, 0.1333333, 0, 1, 1,
0.4937341, -0.9314276, 2.518303, 0.1411765, 0, 1, 1,
0.4945839, -0.169224, 1.950616, 0.145098, 0, 1, 1,
0.4960329, 1.362762, -0.2914312, 0.1529412, 0, 1, 1,
0.4973829, 0.1255424, 2.721192, 0.1568628, 0, 1, 1,
0.4974987, 0.6202353, 0.5485455, 0.1647059, 0, 1, 1,
0.5028489, -0.3126083, 3.695666, 0.1686275, 0, 1, 1,
0.5075693, 0.5108041, 0.7090574, 0.1764706, 0, 1, 1,
0.5118896, -1.414417, 3.516847, 0.1803922, 0, 1, 1,
0.5127231, 0.7209659, -0.4458367, 0.1882353, 0, 1, 1,
0.5132454, -0.1807688, 1.874742, 0.1921569, 0, 1, 1,
0.5134985, 0.3682204, 2.942312, 0.2, 0, 1, 1,
0.5141267, 0.7488914, -0.4533102, 0.2078431, 0, 1, 1,
0.5150595, 0.462906, 0.5582083, 0.2117647, 0, 1, 1,
0.5160272, -0.9054552, 3.24124, 0.2196078, 0, 1, 1,
0.5217562, 0.048759, 2.73733, 0.2235294, 0, 1, 1,
0.5229964, -0.1484724, 1.691787, 0.2313726, 0, 1, 1,
0.5233107, 0.08002532, 2.47511, 0.2352941, 0, 1, 1,
0.523541, -0.9281707, 4.232453, 0.2431373, 0, 1, 1,
0.5346071, 1.745229, 0.1444095, 0.2470588, 0, 1, 1,
0.536258, -0.01047704, 2.420656, 0.254902, 0, 1, 1,
0.5368448, 0.7217474, -0.03872294, 0.2588235, 0, 1, 1,
0.5431628, -0.1049961, 1.081484, 0.2666667, 0, 1, 1,
0.5444222, 1.043737, 1.516589, 0.2705882, 0, 1, 1,
0.5444953, 1.594066, 1.004647, 0.2784314, 0, 1, 1,
0.5445468, 0.9944227, -0.06913646, 0.282353, 0, 1, 1,
0.5508656, -2.846003, 2.59793, 0.2901961, 0, 1, 1,
0.551625, 0.4099515, -0.005594885, 0.2941177, 0, 1, 1,
0.5566443, 0.06238021, 1.78964, 0.3019608, 0, 1, 1,
0.5579842, -1.008927, 2.457874, 0.3098039, 0, 1, 1,
0.558565, 0.01401604, 3.004706, 0.3137255, 0, 1, 1,
0.5595652, -1.049402, 1.404045, 0.3215686, 0, 1, 1,
0.5626951, -1.112586, 3.118372, 0.3254902, 0, 1, 1,
0.5645095, -1.223587, 3.297868, 0.3333333, 0, 1, 1,
0.5664967, 1.611169, -0.8897258, 0.3372549, 0, 1, 1,
0.570633, 0.197674, 2.810684, 0.345098, 0, 1, 1,
0.5744587, 0.3008066, 0.8359354, 0.3490196, 0, 1, 1,
0.5843256, -0.3705911, 2.176819, 0.3568628, 0, 1, 1,
0.5898432, -0.9465435, 1.949232, 0.3607843, 0, 1, 1,
0.5926493, -0.2423472, 2.524752, 0.3686275, 0, 1, 1,
0.6024466, -1.544053, 2.117023, 0.372549, 0, 1, 1,
0.623049, 1.006224, 1.248996, 0.3803922, 0, 1, 1,
0.6230927, -0.12917, 2.451949, 0.3843137, 0, 1, 1,
0.6346824, -0.772797, 2.165266, 0.3921569, 0, 1, 1,
0.6354989, 1.24209, -1.322316, 0.3960784, 0, 1, 1,
0.6358828, 0.2373198, 0.05902695, 0.4039216, 0, 1, 1,
0.6490089, 0.5464438, 1.583416, 0.4117647, 0, 1, 1,
0.649238, -0.2550698, 2.000842, 0.4156863, 0, 1, 1,
0.65655, -1.470657, 3.562695, 0.4235294, 0, 1, 1,
0.660078, -0.9345891, 1.264194, 0.427451, 0, 1, 1,
0.6609308, 1.964446, -1.155329, 0.4352941, 0, 1, 1,
0.6661264, -1.529101, 3.031546, 0.4392157, 0, 1, 1,
0.670711, -0.09469473, 2.792063, 0.4470588, 0, 1, 1,
0.6726931, -1.109095, 3.845498, 0.4509804, 0, 1, 1,
0.672812, 0.9120789, 1.439521, 0.4588235, 0, 1, 1,
0.6777, -0.4867238, 1.338084, 0.4627451, 0, 1, 1,
0.6861567, 0.3806815, 1.365164, 0.4705882, 0, 1, 1,
0.6924886, -0.2344242, 2.15629, 0.4745098, 0, 1, 1,
0.6986966, 0.2713664, 1.559276, 0.4823529, 0, 1, 1,
0.7118841, 1.057399, 0.2639429, 0.4862745, 0, 1, 1,
0.7142263, 0.5355951, 0.8400056, 0.4941176, 0, 1, 1,
0.7165424, -0.8741785, 2.301207, 0.5019608, 0, 1, 1,
0.7174864, -2.67292, 2.365003, 0.5058824, 0, 1, 1,
0.7216056, -0.3403974, 2.793029, 0.5137255, 0, 1, 1,
0.7235095, 0.1291177, 1.827472, 0.5176471, 0, 1, 1,
0.7250203, 0.1577756, 0.9047702, 0.5254902, 0, 1, 1,
0.7281598, 0.3244426, 0.5077149, 0.5294118, 0, 1, 1,
0.7336176, 0.4193196, 0.6487238, 0.5372549, 0, 1, 1,
0.7513587, 1.676762, 1.212249, 0.5411765, 0, 1, 1,
0.7548741, 1.945776, 0.3353404, 0.5490196, 0, 1, 1,
0.7552788, 1.858002, -0.496721, 0.5529412, 0, 1, 1,
0.7601697, -1.14553, 1.455662, 0.5607843, 0, 1, 1,
0.761366, 0.3897713, 0.8280281, 0.5647059, 0, 1, 1,
0.7634389, 1.729845, -0.1150353, 0.572549, 0, 1, 1,
0.7656468, -1.292035, 2.4226, 0.5764706, 0, 1, 1,
0.7691095, 0.5199158, 3.137099, 0.5843138, 0, 1, 1,
0.7732154, 0.4359876, 1.60284, 0.5882353, 0, 1, 1,
0.7780539, -0.06644487, 2.45805, 0.5960785, 0, 1, 1,
0.7793679, -2.165318, 3.129871, 0.6039216, 0, 1, 1,
0.7801945, 1.57223, 1.382659, 0.6078432, 0, 1, 1,
0.7806152, -0.2788513, 3.375338, 0.6156863, 0, 1, 1,
0.7829955, -0.1162964, 0.3823659, 0.6196079, 0, 1, 1,
0.7900951, -0.07704488, 2.63881, 0.627451, 0, 1, 1,
0.7911173, 0.5643621, 1.790512, 0.6313726, 0, 1, 1,
0.805195, -0.4252511, 1.108516, 0.6392157, 0, 1, 1,
0.8103992, -1.559009, 0.6214393, 0.6431373, 0, 1, 1,
0.8105283, 0.9435166, 0.5292597, 0.6509804, 0, 1, 1,
0.8130034, 0.0685975, 2.121745, 0.654902, 0, 1, 1,
0.8151172, 0.8213033, 2.063989, 0.6627451, 0, 1, 1,
0.8156142, -0.370093, 0.9709536, 0.6666667, 0, 1, 1,
0.8219219, 0.3094022, 1.358416, 0.6745098, 0, 1, 1,
0.8257166, -0.6109968, 3.170141, 0.6784314, 0, 1, 1,
0.8270198, 0.8237122, 1.885437, 0.6862745, 0, 1, 1,
0.8362313, 0.7746866, 1.47314, 0.6901961, 0, 1, 1,
0.8387612, -0.1611321, 4.183267, 0.6980392, 0, 1, 1,
0.8425979, -0.5833856, 2.898415, 0.7058824, 0, 1, 1,
0.8449898, -2.055123, 1.618659, 0.7098039, 0, 1, 1,
0.8479798, 1.021987, 0.7580518, 0.7176471, 0, 1, 1,
0.8495719, -1.642586, 1.91973, 0.7215686, 0, 1, 1,
0.8518906, -2.325681, 4.015914, 0.7294118, 0, 1, 1,
0.8530369, -0.5646009, 1.455177, 0.7333333, 0, 1, 1,
0.8552707, 0.7243609, -0.2486317, 0.7411765, 0, 1, 1,
0.8594244, 1.711821, 2.184311, 0.7450981, 0, 1, 1,
0.8698929, -1.062859, 2.53773, 0.7529412, 0, 1, 1,
0.871794, 0.7217103, 1.609684, 0.7568628, 0, 1, 1,
0.8821182, -0.3299365, 3.094794, 0.7647059, 0, 1, 1,
0.8865504, 0.2572684, 1.009453, 0.7686275, 0, 1, 1,
0.8900689, -0.3265823, 1.393556, 0.7764706, 0, 1, 1,
0.8939698, -3.25643, 3.749883, 0.7803922, 0, 1, 1,
0.8948982, 1.038219, -0.2132674, 0.7882353, 0, 1, 1,
0.8958186, 1.393527, 1.708719, 0.7921569, 0, 1, 1,
0.898443, -0.5890551, 1.946957, 0.8, 0, 1, 1,
0.901298, 0.6503236, 0.5027822, 0.8078431, 0, 1, 1,
0.9062179, -0.3667501, 1.1936, 0.8117647, 0, 1, 1,
0.9062766, 0.9740989, 0.5258639, 0.8196079, 0, 1, 1,
0.9063517, -0.5019937, 3.221713, 0.8235294, 0, 1, 1,
0.9065253, 0.2725468, 0.8459547, 0.8313726, 0, 1, 1,
0.9183357, 0.7344161, 1.139275, 0.8352941, 0, 1, 1,
0.9195659, -1.089373, 1.72223, 0.8431373, 0, 1, 1,
0.9212011, -0.188252, 1.434229, 0.8470588, 0, 1, 1,
0.9320354, 2.717984, 1.72187, 0.854902, 0, 1, 1,
0.9390476, -0.5661713, 2.309419, 0.8588235, 0, 1, 1,
0.9407737, -1.018369, 1.370689, 0.8666667, 0, 1, 1,
0.9463102, -0.3430298, 3.434962, 0.8705882, 0, 1, 1,
0.9467722, -2.006896, 2.22953, 0.8784314, 0, 1, 1,
0.9529361, 1.210335, -0.2672869, 0.8823529, 0, 1, 1,
0.9586872, -0.202718, 0.9607872, 0.8901961, 0, 1, 1,
0.9590321, -0.05714799, -0.1659387, 0.8941177, 0, 1, 1,
0.9603134, -0.7593535, 2.280099, 0.9019608, 0, 1, 1,
0.9722916, -0.212792, 1.217483, 0.9098039, 0, 1, 1,
0.987743, -0.05370773, 1.561661, 0.9137255, 0, 1, 1,
0.9886294, 0.9165137, 0.8390422, 0.9215686, 0, 1, 1,
0.991349, 1.46765, 0.4943614, 0.9254902, 0, 1, 1,
0.9938839, 0.145929, 1.252016, 0.9333333, 0, 1, 1,
0.9978095, -0.3996981, 1.211503, 0.9372549, 0, 1, 1,
0.9984015, 1.031192, 0.6860452, 0.945098, 0, 1, 1,
0.9999371, 1.28356, 0.6014919, 0.9490196, 0, 1, 1,
1.002032, -0.4496461, 1.9953, 0.9568627, 0, 1, 1,
1.003766, 0.7077203, 2.323207, 0.9607843, 0, 1, 1,
1.013583, -1.589719, 0.6848197, 0.9686275, 0, 1, 1,
1.016531, 0.988781, 2.096021, 0.972549, 0, 1, 1,
1.023174, 1.092813, 2.322151, 0.9803922, 0, 1, 1,
1.024682, 0.5565839, 0.4583251, 0.9843137, 0, 1, 1,
1.031533, -1.243049, 0.5941297, 0.9921569, 0, 1, 1,
1.035371, 0.2248327, 1.935759, 0.9960784, 0, 1, 1,
1.037612, 1.568878, 0.2378919, 1, 0, 0.9960784, 1,
1.041044, 0.2837638, 1.111055, 1, 0, 0.9882353, 1,
1.04295, 0.6582513, 0.5405726, 1, 0, 0.9843137, 1,
1.042957, -1.556581, 1.568692, 1, 0, 0.9764706, 1,
1.04345, -1.056246, 1.238775, 1, 0, 0.972549, 1,
1.046183, -1.4985, 2.576852, 1, 0, 0.9647059, 1,
1.049211, -0.3086003, 1.341475, 1, 0, 0.9607843, 1,
1.05808, -1.294746, 1.45943, 1, 0, 0.9529412, 1,
1.059282, -0.4211283, 1.783514, 1, 0, 0.9490196, 1,
1.066374, 0.421425, 1.825744, 1, 0, 0.9411765, 1,
1.076707, -0.1911406, 2.062783, 1, 0, 0.9372549, 1,
1.084176, 0.8288975, 1.874086, 1, 0, 0.9294118, 1,
1.087772, -1.66162, 2.758117, 1, 0, 0.9254902, 1,
1.087915, -1.655871, 1.907568, 1, 0, 0.9176471, 1,
1.088934, 0.4656114, -0.07526656, 1, 0, 0.9137255, 1,
1.090412, 1.066024, 0.5590225, 1, 0, 0.9058824, 1,
1.097105, 0.405885, 2.544524, 1, 0, 0.9019608, 1,
1.099471, 1.015026, 1.83154, 1, 0, 0.8941177, 1,
1.100245, 2.248209, 1.548923, 1, 0, 0.8862745, 1,
1.11623, -0.4008012, 2.893418, 1, 0, 0.8823529, 1,
1.123163, 1.718557, 0.6271069, 1, 0, 0.8745098, 1,
1.128478, 1.605749, 1.424484, 1, 0, 0.8705882, 1,
1.128704, -2.347643, 3.731997, 1, 0, 0.8627451, 1,
1.133027, 0.4352678, 1.030171, 1, 0, 0.8588235, 1,
1.150968, -1.261111, 2.35676, 1, 0, 0.8509804, 1,
1.159403, 1.086507, -0.1979254, 1, 0, 0.8470588, 1,
1.168775, 0.7598312, 2.413907, 1, 0, 0.8392157, 1,
1.180127, 1.202106, 0.1683091, 1, 0, 0.8352941, 1,
1.18045, -0.7986623, 3.328364, 1, 0, 0.827451, 1,
1.181668, -0.04611196, 1.753057, 1, 0, 0.8235294, 1,
1.188612, 1.012409, -0.07125434, 1, 0, 0.8156863, 1,
1.191377, -0.7046636, 2.337065, 1, 0, 0.8117647, 1,
1.199205, -1.365466, 3.39751, 1, 0, 0.8039216, 1,
1.202831, 0.2070011, 0.4052956, 1, 0, 0.7960784, 1,
1.203011, 2.480316, -0.3057058, 1, 0, 0.7921569, 1,
1.203708, -0.7458382, 2.34101, 1, 0, 0.7843137, 1,
1.209846, 1.585799, 0.3480476, 1, 0, 0.7803922, 1,
1.217152, -2.49677, 2.511835, 1, 0, 0.772549, 1,
1.21906, 1.056633, 1.18698, 1, 0, 0.7686275, 1,
1.229182, 0.3585507, 0.827014, 1, 0, 0.7607843, 1,
1.229196, -0.4440997, 3.471369, 1, 0, 0.7568628, 1,
1.235526, -0.2326909, 2.112172, 1, 0, 0.7490196, 1,
1.241769, 0.3278966, 0.8786832, 1, 0, 0.7450981, 1,
1.256332, -0.3842221, 2.49257, 1, 0, 0.7372549, 1,
1.256486, -0.5032563, 1.450932, 1, 0, 0.7333333, 1,
1.268639, 1.232232, 0.9885737, 1, 0, 0.7254902, 1,
1.273826, 0.6489455, 1.881465, 1, 0, 0.7215686, 1,
1.27825, 0.2492246, 0.8516145, 1, 0, 0.7137255, 1,
1.281927, -0.8415724, 0.1799797, 1, 0, 0.7098039, 1,
1.287372, 0.4179811, 2.179602, 1, 0, 0.7019608, 1,
1.292003, 0.5075085, 0.002229709, 1, 0, 0.6941177, 1,
1.292357, -0.75585, 2.91102, 1, 0, 0.6901961, 1,
1.295771, 0.5076182, 1.642754, 1, 0, 0.682353, 1,
1.297011, 1.906182, -0.3983404, 1, 0, 0.6784314, 1,
1.302202, 1.098145, 0.9950894, 1, 0, 0.6705883, 1,
1.303909, 0.1779334, 2.312977, 1, 0, 0.6666667, 1,
1.310198, -0.08305704, 2.314343, 1, 0, 0.6588235, 1,
1.31609, 0.5844497, 0.1023117, 1, 0, 0.654902, 1,
1.323903, 0.3623089, 1.454888, 1, 0, 0.6470588, 1,
1.340019, -1.05959, 1.230457, 1, 0, 0.6431373, 1,
1.35149, -1.236892, 1.914922, 1, 0, 0.6352941, 1,
1.356708, 1.325728, -0.8114532, 1, 0, 0.6313726, 1,
1.357122, -0.4802112, 1.254943, 1, 0, 0.6235294, 1,
1.361624, -1.357417, 2.138609, 1, 0, 0.6196079, 1,
1.366714, -0.6492183, 1.070057, 1, 0, 0.6117647, 1,
1.372558, 1.476109, 0.8040997, 1, 0, 0.6078432, 1,
1.380576, 1.278639, 1.856712, 1, 0, 0.6, 1,
1.387397, 1.192833, 0.67659, 1, 0, 0.5921569, 1,
1.393787, -0.25127, 2.86253, 1, 0, 0.5882353, 1,
1.398632, -1.240323, 2.235315, 1, 0, 0.5803922, 1,
1.399221, -0.05727595, 0.2639558, 1, 0, 0.5764706, 1,
1.404747, 1.922779, 1.888891, 1, 0, 0.5686275, 1,
1.416163, 0.003697021, 0.6243204, 1, 0, 0.5647059, 1,
1.432551, -0.9823559, 3.559874, 1, 0, 0.5568628, 1,
1.433942, -1.805558, 1.770868, 1, 0, 0.5529412, 1,
1.43587, -0.3657987, 2.332943, 1, 0, 0.5450981, 1,
1.437078, 0.1470262, 2.399974, 1, 0, 0.5411765, 1,
1.437639, 1.650073, 1.786199, 1, 0, 0.5333334, 1,
1.440262, 1.20975, 0.4946865, 1, 0, 0.5294118, 1,
1.457921, -1.046729, 2.94845, 1, 0, 0.5215687, 1,
1.460179, 1.925241, 0.542873, 1, 0, 0.5176471, 1,
1.4679, 1.039711, 2.377738, 1, 0, 0.509804, 1,
1.470281, 0.2763207, 0.7807515, 1, 0, 0.5058824, 1,
1.472573, 0.002579869, 1.015535, 1, 0, 0.4980392, 1,
1.478498, -1.051384, 2.561786, 1, 0, 0.4901961, 1,
1.482129, -0.7743154, 2.071684, 1, 0, 0.4862745, 1,
1.491038, 1.564977, 0.3053239, 1, 0, 0.4784314, 1,
1.493455, -1.168175, 2.913646, 1, 0, 0.4745098, 1,
1.497154, 0.513961, 1.708768, 1, 0, 0.4666667, 1,
1.5038, 0.5080391, 0.3787095, 1, 0, 0.4627451, 1,
1.505543, -0.1375646, 2.814668, 1, 0, 0.454902, 1,
1.518524, -0.9027764, 1.526726, 1, 0, 0.4509804, 1,
1.521389, 0.03687342, 1.042553, 1, 0, 0.4431373, 1,
1.542458, 0.5488235, 0.3268201, 1, 0, 0.4392157, 1,
1.568313, 1.223182, 0.9207251, 1, 0, 0.4313726, 1,
1.568791, -0.4735615, -1.607375, 1, 0, 0.427451, 1,
1.586468, 1.431739, 1.507267, 1, 0, 0.4196078, 1,
1.603407, -1.243037, 2.689343, 1, 0, 0.4156863, 1,
1.603535, -0.58232, 2.83052, 1, 0, 0.4078431, 1,
1.60816, 0.04349179, 1.384987, 1, 0, 0.4039216, 1,
1.620588, -0.07452173, 0.5612312, 1, 0, 0.3960784, 1,
1.624041, -0.6337619, 1.73851, 1, 0, 0.3882353, 1,
1.650084, 0.1223766, 0.3813597, 1, 0, 0.3843137, 1,
1.653202, -0.8449684, 2.598953, 1, 0, 0.3764706, 1,
1.656049, 1.578486, 0.7098916, 1, 0, 0.372549, 1,
1.66854, -1.405427, 0.7859448, 1, 0, 0.3647059, 1,
1.684366, 1.986389, 2.2289, 1, 0, 0.3607843, 1,
1.714444, 0.6180087, 1.59684, 1, 0, 0.3529412, 1,
1.727499, -0.3005843, 1.955651, 1, 0, 0.3490196, 1,
1.74516, 0.4002588, 0.7665676, 1, 0, 0.3411765, 1,
1.749961, -0.7994493, 1.461019, 1, 0, 0.3372549, 1,
1.757001, 0.4892147, 0.6118956, 1, 0, 0.3294118, 1,
1.760906, 0.8626048, 2.023953, 1, 0, 0.3254902, 1,
1.799139, 0.8552765, 0.5138022, 1, 0, 0.3176471, 1,
1.799913, -1.371331, 1.583075, 1, 0, 0.3137255, 1,
1.799968, -3.241302, 2.01691, 1, 0, 0.3058824, 1,
1.80377, 0.3392286, 1.856483, 1, 0, 0.2980392, 1,
1.804376, -0.599769, 1.609957, 1, 0, 0.2941177, 1,
1.812244, -0.4974836, 1.683024, 1, 0, 0.2862745, 1,
1.821488, -0.5440639, 1.132105, 1, 0, 0.282353, 1,
1.823068, -0.2729915, -0.0775364, 1, 0, 0.2745098, 1,
1.840557, 0.3258095, 1.337279, 1, 0, 0.2705882, 1,
1.858006, -0.09902265, 0.2849696, 1, 0, 0.2627451, 1,
1.870471, -1.365919, 3.288432, 1, 0, 0.2588235, 1,
1.876598, 1.603561, 2.407341, 1, 0, 0.2509804, 1,
1.923397, 1.303377, -1.017063, 1, 0, 0.2470588, 1,
1.947526, 0.3566419, 0.03191794, 1, 0, 0.2392157, 1,
1.947772, 1.917429, 0.4593305, 1, 0, 0.2352941, 1,
1.949628, 1.305132, 0.3583249, 1, 0, 0.227451, 1,
1.96694, 0.6443188, 0.8243251, 1, 0, 0.2235294, 1,
1.989376, -0.7272106, 1.598613, 1, 0, 0.2156863, 1,
2.005633, -0.7794544, 2.431908, 1, 0, 0.2117647, 1,
2.024002, -2.786535, 1.353217, 1, 0, 0.2039216, 1,
2.024456, -0.04067174, 3.043465, 1, 0, 0.1960784, 1,
2.025512, -0.1302964, 2.482164, 1, 0, 0.1921569, 1,
2.02755, 1.300103, -0.9746402, 1, 0, 0.1843137, 1,
2.035459, 1.305522, 1.715053, 1, 0, 0.1803922, 1,
2.086997, 0.3213081, 1.31935, 1, 0, 0.172549, 1,
2.096755, -0.6141052, 2.706753, 1, 0, 0.1686275, 1,
2.108752, 0.5439571, 2.418667, 1, 0, 0.1607843, 1,
2.125273, -0.4420763, 1.004218, 1, 0, 0.1568628, 1,
2.168227, 0.01118372, 2.113636, 1, 0, 0.1490196, 1,
2.198734, -0.3450125, 0.9298926, 1, 0, 0.145098, 1,
2.224176, -0.8775515, 2.323782, 1, 0, 0.1372549, 1,
2.268941, -0.4053616, 1.166026, 1, 0, 0.1333333, 1,
2.292765, -1.388445, 2.583748, 1, 0, 0.1254902, 1,
2.307091, 1.837146, -0.7269598, 1, 0, 0.1215686, 1,
2.310301, -0.3646135, 2.68814, 1, 0, 0.1137255, 1,
2.360115, 0.5321214, 2.371685, 1, 0, 0.1098039, 1,
2.360883, 1.045464, 0.7468112, 1, 0, 0.1019608, 1,
2.444942, -0.5042813, 2.757224, 1, 0, 0.09411765, 1,
2.520071, -1.304048, 3.222671, 1, 0, 0.09019608, 1,
2.528764, -1.103269, 0.5653429, 1, 0, 0.08235294, 1,
2.539917, 1.846631, 0.657242, 1, 0, 0.07843138, 1,
2.54164, -0.3821115, 0.2157957, 1, 0, 0.07058824, 1,
2.563191, 1.971174, 0.7899461, 1, 0, 0.06666667, 1,
2.577547, 0.4415936, 2.466454, 1, 0, 0.05882353, 1,
2.586524, -1.332281, 1.976049, 1, 0, 0.05490196, 1,
2.636314, -1.744927, 2.546576, 1, 0, 0.04705882, 1,
2.715621, -1.328771, 3.004185, 1, 0, 0.04313726, 1,
2.720135, 0.136117, 2.100162, 1, 0, 0.03529412, 1,
2.830369, -1.264114, 0.058835, 1, 0, 0.03137255, 1,
2.85526, -0.2913178, 2.837116, 1, 0, 0.02352941, 1,
2.906853, -1.249018, 0.5814713, 1, 0, 0.01960784, 1,
2.933264, 0.5884039, 4.215971, 1, 0, 0.01176471, 1,
3.251904, -0.3879085, 0.5752051, 1, 0, 0.007843138, 1
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
0.1629966, -4.584376, -8.091131, 0, -0.5, 0.5, 0.5,
0.1629966, -4.584376, -8.091131, 1, -0.5, 0.5, 0.5,
0.1629966, -4.584376, -8.091131, 1, 1.5, 0.5, 0.5,
0.1629966, -4.584376, -8.091131, 0, 1.5, 0.5, 0.5
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
-3.973051, -0.1966351, -8.091131, 0, -0.5, 0.5, 0.5,
-3.973051, -0.1966351, -8.091131, 1, -0.5, 0.5, 0.5,
-3.973051, -0.1966351, -8.091131, 1, 1.5, 0.5, 0.5,
-3.973051, -0.1966351, -8.091131, 0, 1.5, 0.5, 0.5
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
-3.973051, -4.584376, -0.09811831, 0, -0.5, 0.5, 0.5,
-3.973051, -4.584376, -0.09811831, 1, -0.5, 0.5, 0.5,
-3.973051, -4.584376, -0.09811831, 1, 1.5, 0.5, 0.5,
-3.973051, -4.584376, -0.09811831, 0, 1.5, 0.5, 0.5
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
-2, -3.57182, -6.24659,
3, -3.57182, -6.24659,
-2, -3.57182, -6.24659,
-2, -3.740579, -6.554014,
-1, -3.57182, -6.24659,
-1, -3.740579, -6.554014,
0, -3.57182, -6.24659,
0, -3.740579, -6.554014,
1, -3.57182, -6.24659,
1, -3.740579, -6.554014,
2, -3.57182, -6.24659,
2, -3.740579, -6.554014,
3, -3.57182, -6.24659,
3, -3.740579, -6.554014
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
-2, -4.078098, -7.16886, 0, -0.5, 0.5, 0.5,
-2, -4.078098, -7.16886, 1, -0.5, 0.5, 0.5,
-2, -4.078098, -7.16886, 1, 1.5, 0.5, 0.5,
-2, -4.078098, -7.16886, 0, 1.5, 0.5, 0.5,
-1, -4.078098, -7.16886, 0, -0.5, 0.5, 0.5,
-1, -4.078098, -7.16886, 1, -0.5, 0.5, 0.5,
-1, -4.078098, -7.16886, 1, 1.5, 0.5, 0.5,
-1, -4.078098, -7.16886, 0, 1.5, 0.5, 0.5,
0, -4.078098, -7.16886, 0, -0.5, 0.5, 0.5,
0, -4.078098, -7.16886, 1, -0.5, 0.5, 0.5,
0, -4.078098, -7.16886, 1, 1.5, 0.5, 0.5,
0, -4.078098, -7.16886, 0, 1.5, 0.5, 0.5,
1, -4.078098, -7.16886, 0, -0.5, 0.5, 0.5,
1, -4.078098, -7.16886, 1, -0.5, 0.5, 0.5,
1, -4.078098, -7.16886, 1, 1.5, 0.5, 0.5,
1, -4.078098, -7.16886, 0, 1.5, 0.5, 0.5,
2, -4.078098, -7.16886, 0, -0.5, 0.5, 0.5,
2, -4.078098, -7.16886, 1, -0.5, 0.5, 0.5,
2, -4.078098, -7.16886, 1, 1.5, 0.5, 0.5,
2, -4.078098, -7.16886, 0, 1.5, 0.5, 0.5,
3, -4.078098, -7.16886, 0, -0.5, 0.5, 0.5,
3, -4.078098, -7.16886, 1, -0.5, 0.5, 0.5,
3, -4.078098, -7.16886, 1, 1.5, 0.5, 0.5,
3, -4.078098, -7.16886, 0, 1.5, 0.5, 0.5
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
-3.018579, -3, -6.24659,
-3.018579, 3, -6.24659,
-3.018579, -3, -6.24659,
-3.177657, -3, -6.554014,
-3.018579, -2, -6.24659,
-3.177657, -2, -6.554014,
-3.018579, -1, -6.24659,
-3.177657, -1, -6.554014,
-3.018579, 0, -6.24659,
-3.177657, 0, -6.554014,
-3.018579, 1, -6.24659,
-3.177657, 1, -6.554014,
-3.018579, 2, -6.24659,
-3.177657, 2, -6.554014,
-3.018579, 3, -6.24659,
-3.177657, 3, -6.554014
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
-3.495815, -3, -7.16886, 0, -0.5, 0.5, 0.5,
-3.495815, -3, -7.16886, 1, -0.5, 0.5, 0.5,
-3.495815, -3, -7.16886, 1, 1.5, 0.5, 0.5,
-3.495815, -3, -7.16886, 0, 1.5, 0.5, 0.5,
-3.495815, -2, -7.16886, 0, -0.5, 0.5, 0.5,
-3.495815, -2, -7.16886, 1, -0.5, 0.5, 0.5,
-3.495815, -2, -7.16886, 1, 1.5, 0.5, 0.5,
-3.495815, -2, -7.16886, 0, 1.5, 0.5, 0.5,
-3.495815, -1, -7.16886, 0, -0.5, 0.5, 0.5,
-3.495815, -1, -7.16886, 1, -0.5, 0.5, 0.5,
-3.495815, -1, -7.16886, 1, 1.5, 0.5, 0.5,
-3.495815, -1, -7.16886, 0, 1.5, 0.5, 0.5,
-3.495815, 0, -7.16886, 0, -0.5, 0.5, 0.5,
-3.495815, 0, -7.16886, 1, -0.5, 0.5, 0.5,
-3.495815, 0, -7.16886, 1, 1.5, 0.5, 0.5,
-3.495815, 0, -7.16886, 0, 1.5, 0.5, 0.5,
-3.495815, 1, -7.16886, 0, -0.5, 0.5, 0.5,
-3.495815, 1, -7.16886, 1, -0.5, 0.5, 0.5,
-3.495815, 1, -7.16886, 1, 1.5, 0.5, 0.5,
-3.495815, 1, -7.16886, 0, 1.5, 0.5, 0.5,
-3.495815, 2, -7.16886, 0, -0.5, 0.5, 0.5,
-3.495815, 2, -7.16886, 1, -0.5, 0.5, 0.5,
-3.495815, 2, -7.16886, 1, 1.5, 0.5, 0.5,
-3.495815, 2, -7.16886, 0, 1.5, 0.5, 0.5,
-3.495815, 3, -7.16886, 0, -0.5, 0.5, 0.5,
-3.495815, 3, -7.16886, 1, -0.5, 0.5, 0.5,
-3.495815, 3, -7.16886, 1, 1.5, 0.5, 0.5,
-3.495815, 3, -7.16886, 0, 1.5, 0.5, 0.5
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
-3.018579, -3.57182, -6,
-3.018579, -3.57182, 4,
-3.018579, -3.57182, -6,
-3.177657, -3.740579, -6,
-3.018579, -3.57182, -4,
-3.177657, -3.740579, -4,
-3.018579, -3.57182, -2,
-3.177657, -3.740579, -2,
-3.018579, -3.57182, 0,
-3.177657, -3.740579, 0,
-3.018579, -3.57182, 2,
-3.177657, -3.740579, 2,
-3.018579, -3.57182, 4,
-3.177657, -3.740579, 4
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
-3.495815, -4.078098, -6, 0, -0.5, 0.5, 0.5,
-3.495815, -4.078098, -6, 1, -0.5, 0.5, 0.5,
-3.495815, -4.078098, -6, 1, 1.5, 0.5, 0.5,
-3.495815, -4.078098, -6, 0, 1.5, 0.5, 0.5,
-3.495815, -4.078098, -4, 0, -0.5, 0.5, 0.5,
-3.495815, -4.078098, -4, 1, -0.5, 0.5, 0.5,
-3.495815, -4.078098, -4, 1, 1.5, 0.5, 0.5,
-3.495815, -4.078098, -4, 0, 1.5, 0.5, 0.5,
-3.495815, -4.078098, -2, 0, -0.5, 0.5, 0.5,
-3.495815, -4.078098, -2, 1, -0.5, 0.5, 0.5,
-3.495815, -4.078098, -2, 1, 1.5, 0.5, 0.5,
-3.495815, -4.078098, -2, 0, 1.5, 0.5, 0.5,
-3.495815, -4.078098, 0, 0, -0.5, 0.5, 0.5,
-3.495815, -4.078098, 0, 1, -0.5, 0.5, 0.5,
-3.495815, -4.078098, 0, 1, 1.5, 0.5, 0.5,
-3.495815, -4.078098, 0, 0, 1.5, 0.5, 0.5,
-3.495815, -4.078098, 2, 0, -0.5, 0.5, 0.5,
-3.495815, -4.078098, 2, 1, -0.5, 0.5, 0.5,
-3.495815, -4.078098, 2, 1, 1.5, 0.5, 0.5,
-3.495815, -4.078098, 2, 0, 1.5, 0.5, 0.5,
-3.495815, -4.078098, 4, 0, -0.5, 0.5, 0.5,
-3.495815, -4.078098, 4, 1, -0.5, 0.5, 0.5,
-3.495815, -4.078098, 4, 1, 1.5, 0.5, 0.5,
-3.495815, -4.078098, 4, 0, 1.5, 0.5, 0.5
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
-3.018579, -3.57182, -6.24659,
-3.018579, 3.17855, -6.24659,
-3.018579, -3.57182, 6.050354,
-3.018579, 3.17855, 6.050354,
-3.018579, -3.57182, -6.24659,
-3.018579, -3.57182, 6.050354,
-3.018579, 3.17855, -6.24659,
-3.018579, 3.17855, 6.050354,
-3.018579, -3.57182, -6.24659,
3.344572, -3.57182, -6.24659,
-3.018579, -3.57182, 6.050354,
3.344572, -3.57182, 6.050354,
-3.018579, 3.17855, -6.24659,
3.344572, 3.17855, -6.24659,
-3.018579, 3.17855, 6.050354,
3.344572, 3.17855, 6.050354,
3.344572, -3.57182, -6.24659,
3.344572, 3.17855, -6.24659,
3.344572, -3.57182, 6.050354,
3.344572, 3.17855, 6.050354,
3.344572, -3.57182, -6.24659,
3.344572, -3.57182, 6.050354,
3.344572, 3.17855, -6.24659,
3.344572, 3.17855, 6.050354
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
var radius = 8.225242;
var distance = 36.59503;
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
mvMatrix.translate( -0.1629966, 0.1966351, 0.09811831 );
mvMatrix.scale( 1.397624, 1.317453, 0.7232117 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.59503);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Telar<-read.table("Telar.xyz")
```

```
## Error in read.table("Telar.xyz"): no lines available in input
```

```r
x<-Telar$V2
```

```
## Error in eval(expr, envir, enclos): object 'Telar' not found
```

```r
y<-Telar$V3
```

```
## Error in eval(expr, envir, enclos): object 'Telar' not found
```

```r
z<-Telar$V4
```

```
## Error in eval(expr, envir, enclos): object 'Telar' not found
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
-2.925911, 0.9476146, -0.3384936, 0, 0, 1, 1, 1,
-2.710638, 0.8191608, 0.7550087, 1, 0, 0, 1, 1,
-2.555585, 0.3129213, -0.5206243, 1, 0, 0, 1, 1,
-2.469889, 0.195157, -1.885547, 1, 0, 0, 1, 1,
-2.461193, 0.7352968, 0.7554663, 1, 0, 0, 1, 1,
-2.392201, -0.4932881, -3.097607, 1, 0, 0, 1, 1,
-2.355265, 0.3718491, -1.54552, 0, 0, 0, 1, 1,
-2.354923, 0.1745868, 0.1129256, 0, 0, 0, 1, 1,
-2.236826, 2.540653, 0.1985202, 0, 0, 0, 1, 1,
-2.220628, -0.3153071, -1.316635, 0, 0, 0, 1, 1,
-2.214622, 0.3309085, -1.705377, 0, 0, 0, 1, 1,
-2.182718, 0.4136527, -1.495333, 0, 0, 0, 1, 1,
-2.140379, -1.501827, -1.807255, 0, 0, 0, 1, 1,
-2.114748, 0.2886434, -0.8504932, 1, 1, 1, 1, 1,
-2.106865, 0.8501309, -2.260102, 1, 1, 1, 1, 1,
-2.045236, 1.159958, -1.405703, 1, 1, 1, 1, 1,
-2.011639, 0.2244885, -0.5995194, 1, 1, 1, 1, 1,
-2.007108, -0.3355958, -1.430246, 1, 1, 1, 1, 1,
-1.918862, -0.8529921, -2.51366, 1, 1, 1, 1, 1,
-1.904695, -1.012946, -3.635979, 1, 1, 1, 1, 1,
-1.888581, -0.7915891, -1.856912, 1, 1, 1, 1, 1,
-1.881192, 0.411279, -2.704178, 1, 1, 1, 1, 1,
-1.86302, -0.7540815, -0.8891514, 1, 1, 1, 1, 1,
-1.845525, -0.01218427, -1.736435, 1, 1, 1, 1, 1,
-1.836207, -0.4723731, -2.181358, 1, 1, 1, 1, 1,
-1.831226, -1.377709, -2.15228, 1, 1, 1, 1, 1,
-1.829684, -1.543797, -2.704228, 1, 1, 1, 1, 1,
-1.825985, 2.009692, -1.615626, 1, 1, 1, 1, 1,
-1.816094, 0.7988585, -0.7037255, 0, 0, 1, 1, 1,
-1.80074, 0.1737129, -2.576356, 1, 0, 0, 1, 1,
-1.790268, 0.9428837, -1.418619, 1, 0, 0, 1, 1,
-1.781833, -0.1722176, -2.498371, 1, 0, 0, 1, 1,
-1.751209, -0.09193483, -0.8301982, 1, 0, 0, 1, 1,
-1.747786, -0.3540376, -1.856523, 1, 0, 0, 1, 1,
-1.746913, -1.043561, -0.9641797, 0, 0, 0, 1, 1,
-1.745727, 1.234345, -1.226221, 0, 0, 0, 1, 1,
-1.700085, 0.03221906, -0.9545001, 0, 0, 0, 1, 1,
-1.677609, -2.17089, -2.577454, 0, 0, 0, 1, 1,
-1.67513, 1.410273, -0.6034354, 0, 0, 0, 1, 1,
-1.670611, -0.9646596, -3.61349, 0, 0, 0, 1, 1,
-1.6678, -0.741599, -2.699081, 0, 0, 0, 1, 1,
-1.63486, 0.0149901, -1.15351, 1, 1, 1, 1, 1,
-1.620929, -0.6111775, -3.266376, 1, 1, 1, 1, 1,
-1.603869, 0.2645229, -0.7580367, 1, 1, 1, 1, 1,
-1.601557, 1.166691, -1.000082, 1, 1, 1, 1, 1,
-1.598589, -0.7291375, -4.004594, 1, 1, 1, 1, 1,
-1.574541, 0.8457394, -0.6681232, 1, 1, 1, 1, 1,
-1.562818, -0.8393241, -0.7686362, 1, 1, 1, 1, 1,
-1.560373, 0.8441697, -2.085602, 1, 1, 1, 1, 1,
-1.558286, -1.450232, -2.242249, 1, 1, 1, 1, 1,
-1.55647, 1.494475, -0.353042, 1, 1, 1, 1, 1,
-1.551831, -1.031039, -2.06146, 1, 1, 1, 1, 1,
-1.551122, 0.4392679, -1.885859, 1, 1, 1, 1, 1,
-1.545282, 0.05241907, -1.822388, 1, 1, 1, 1, 1,
-1.538126, 0.6446581, -1.153452, 1, 1, 1, 1, 1,
-1.537999, -1.207133, -1.177407, 1, 1, 1, 1, 1,
-1.513892, -2.794982, -2.181444, 0, 0, 1, 1, 1,
-1.511554, -0.09836312, -0.3584834, 1, 0, 0, 1, 1,
-1.508277, -2.870548, -1.779144, 1, 0, 0, 1, 1,
-1.506179, -0.435233, -1.081017, 1, 0, 0, 1, 1,
-1.501969, -1.281633, -2.115898, 1, 0, 0, 1, 1,
-1.485102, -0.2709544, -2.019547, 1, 0, 0, 1, 1,
-1.480078, 0.2025983, -0.9458867, 0, 0, 0, 1, 1,
-1.478568, 1.950524, 1.553562, 0, 0, 0, 1, 1,
-1.475168, -1.566454, -0.8583, 0, 0, 0, 1, 1,
-1.473439, 0.4543124, -0.7218661, 0, 0, 0, 1, 1,
-1.471364, 1.762926, -0.4417945, 0, 0, 0, 1, 1,
-1.456951, 1.243691, 0.05266768, 0, 0, 0, 1, 1,
-1.44173, -0.4736436, -1.955783, 0, 0, 0, 1, 1,
-1.439404, 1.483055, -2.320145, 1, 1, 1, 1, 1,
-1.436475, -0.7731467, -1.57389, 1, 1, 1, 1, 1,
-1.432422, -0.4519173, -2.518468, 1, 1, 1, 1, 1,
-1.404155, 0.2228422, -1.406207, 1, 1, 1, 1, 1,
-1.403308, -0.1304025, -1.149591, 1, 1, 1, 1, 1,
-1.397073, 0.09318195, -0.472875, 1, 1, 1, 1, 1,
-1.396286, -0.532577, -1.849958, 1, 1, 1, 1, 1,
-1.392617, 0.6873523, -1.534748, 1, 1, 1, 1, 1,
-1.373564, 1.778571, -1.244373, 1, 1, 1, 1, 1,
-1.371014, 0.05475755, -2.596237, 1, 1, 1, 1, 1,
-1.370953, 0.3979454, -1.641755, 1, 1, 1, 1, 1,
-1.366633, -0.2241918, -1.023509, 1, 1, 1, 1, 1,
-1.36536, 1.521618, -2.862753, 1, 1, 1, 1, 1,
-1.337245, 0.6063482, -1.329708, 1, 1, 1, 1, 1,
-1.328249, 1.290305, -0.6214954, 1, 1, 1, 1, 1,
-1.319295, -1.699507, -2.845501, 0, 0, 1, 1, 1,
-1.312528, 1.206771, -2.081717, 1, 0, 0, 1, 1,
-1.310106, 0.09908505, -0.3001169, 1, 0, 0, 1, 1,
-1.308607, 0.09181966, -1.21977, 1, 0, 0, 1, 1,
-1.303313, 0.8864599, -1.358331, 1, 0, 0, 1, 1,
-1.303192, -0.2947713, -0.8701408, 1, 0, 0, 1, 1,
-1.301115, 1.565821, -0.9970962, 0, 0, 0, 1, 1,
-1.297237, -1.654499, -4.591613, 0, 0, 0, 1, 1,
-1.29361, 1.394496, 0.9787296, 0, 0, 0, 1, 1,
-1.28669, -0.6700962, -2.085731, 0, 0, 0, 1, 1,
-1.286395, 0.3583678, 0.632019, 0, 0, 0, 1, 1,
-1.283867, -0.7733953, -2.161269, 0, 0, 0, 1, 1,
-1.278893, -0.7848418, -1.196176, 0, 0, 0, 1, 1,
-1.277558, 1.571035, 0.2364495, 1, 1, 1, 1, 1,
-1.272491, -0.2706104, -2.697057, 1, 1, 1, 1, 1,
-1.268913, -1.546414, -0.7489437, 1, 1, 1, 1, 1,
-1.263124, 0.4446469, -0.2421501, 1, 1, 1, 1, 1,
-1.252915, -0.5478094, -0.1930404, 1, 1, 1, 1, 1,
-1.247973, 0.9930497, 0.4209666, 1, 1, 1, 1, 1,
-1.244537, 1.007568, -1.266997, 1, 1, 1, 1, 1,
-1.241587, 0.2117714, -1.597717, 1, 1, 1, 1, 1,
-1.232542, 0.8316895, -0.958632, 1, 1, 1, 1, 1,
-1.228151, 1.175463, -1.413109, 1, 1, 1, 1, 1,
-1.223592, 0.8979817, -1.59702, 1, 1, 1, 1, 1,
-1.213838, 0.2172452, -1.91639, 1, 1, 1, 1, 1,
-1.206953, 0.3891711, -1.903841, 1, 1, 1, 1, 1,
-1.198402, -0.2155286, -1.011845, 1, 1, 1, 1, 1,
-1.193154, -0.3098223, -2.321929, 1, 1, 1, 1, 1,
-1.190912, -0.4869028, -2.183329, 0, 0, 1, 1, 1,
-1.17373, -0.39094, -1.770509, 1, 0, 0, 1, 1,
-1.16281, -0.485619, 0.6044057, 1, 0, 0, 1, 1,
-1.157488, 1.453323, -1.575009, 1, 0, 0, 1, 1,
-1.152427, -1.960782, -1.017106, 1, 0, 0, 1, 1,
-1.151973, -0.1091834, -1.075611, 1, 0, 0, 1, 1,
-1.151346, -1.082013, -2.86084, 0, 0, 0, 1, 1,
-1.1486, 0.03143352, -2.266415, 0, 0, 0, 1, 1,
-1.142479, 0.4135306, -2.183444, 0, 0, 0, 1, 1,
-1.135738, 0.4009629, -2.322855, 0, 0, 0, 1, 1,
-1.133373, -0.4019855, -1.642269, 0, 0, 0, 1, 1,
-1.13174, 0.306649, 0.2548034, 0, 0, 0, 1, 1,
-1.131517, 1.083025, 0.1323174, 0, 0, 0, 1, 1,
-1.130402, -1.348621, -0.7861741, 1, 1, 1, 1, 1,
-1.123193, -0.2021911, -3.693541, 1, 1, 1, 1, 1,
-1.11786, 0.8258413, -1.588973, 1, 1, 1, 1, 1,
-1.115799, -1.484849, -2.693817, 1, 1, 1, 1, 1,
-1.100204, 0.1456504, -1.267889, 1, 1, 1, 1, 1,
-1.096012, 1.024583, -1.194611, 1, 1, 1, 1, 1,
-1.092591, 1.116389, -0.9502082, 1, 1, 1, 1, 1,
-1.07997, 1.698684, -0.2298818, 1, 1, 1, 1, 1,
-1.076699, -0.8922678, -0.2946862, 1, 1, 1, 1, 1,
-1.074756, -0.7491202, -4.252964, 1, 1, 1, 1, 1,
-1.073245, 0.570762, -2.556609, 1, 1, 1, 1, 1,
-1.06559, -0.1150152, -1.676708, 1, 1, 1, 1, 1,
-1.065335, 0.8265075, -1.674315, 1, 1, 1, 1, 1,
-1.063572, 0.899747, 0.1468137, 1, 1, 1, 1, 1,
-1.058641, 2.064422, 0.6645718, 1, 1, 1, 1, 1,
-1.055062, 0.3506626, -0.6885154, 0, 0, 1, 1, 1,
-1.053548, -0.6414846, -2.840124, 1, 0, 0, 1, 1,
-1.052109, -0.04496385, 0.3996119, 1, 0, 0, 1, 1,
-1.051157, -0.1865161, -1.210672, 1, 0, 0, 1, 1,
-1.049383, -1.419477, -4.624008, 1, 0, 0, 1, 1,
-1.047615, 0.1540015, -1.614409, 1, 0, 0, 1, 1,
-1.043665, 0.4131635, -1.444793, 0, 0, 0, 1, 1,
-1.041051, 0.9095348, -1.688348, 0, 0, 0, 1, 1,
-1.033532, -0.9512325, -2.899389, 0, 0, 0, 1, 1,
-1.024696, -1.065476, -0.8328122, 0, 0, 0, 1, 1,
-1.015685, -0.9718683, -1.625251, 0, 0, 0, 1, 1,
-1.008721, -0.3752504, -1.556744, 0, 0, 0, 1, 1,
-1.007927, 0.9260167, -1.089224, 0, 0, 0, 1, 1,
-1.001591, -0.9474835, -1.382582, 1, 1, 1, 1, 1,
-1.000979, 0.1839235, -0.08083486, 1, 1, 1, 1, 1,
-0.9925131, -1.27571, -1.821892, 1, 1, 1, 1, 1,
-0.9894289, -1.529321, -4.043259, 1, 1, 1, 1, 1,
-0.9834776, 0.5818912, 0.5570507, 1, 1, 1, 1, 1,
-0.98129, 0.7614497, -0.5216736, 1, 1, 1, 1, 1,
-0.9786885, -1.104821, -3.077109, 1, 1, 1, 1, 1,
-0.9765496, 1.972793, 0.1831733, 1, 1, 1, 1, 1,
-0.9633307, 1.776071, 0.8069925, 1, 1, 1, 1, 1,
-0.9624696, -0.5121937, -0.7508869, 1, 1, 1, 1, 1,
-0.9603454, 0.1303365, -1.662772, 1, 1, 1, 1, 1,
-0.9593506, 0.671962, -2.861519, 1, 1, 1, 1, 1,
-0.9581438, 0.7754183, -1.860943, 1, 1, 1, 1, 1,
-0.9461052, 1.501104, -1.416115, 1, 1, 1, 1, 1,
-0.9399412, 0.7368258, 0.1228316, 1, 1, 1, 1, 1,
-0.9318489, -0.0688338, -1.383235, 0, 0, 1, 1, 1,
-0.9302091, 0.567789, 0.6950583, 1, 0, 0, 1, 1,
-0.9293345, 0.3086646, -1.131633, 1, 0, 0, 1, 1,
-0.9285357, -0.1658477, -1.933365, 1, 0, 0, 1, 1,
-0.9251541, -0.6360698, -1.949683, 1, 0, 0, 1, 1,
-0.9245266, -0.1396752, -0.3583173, 1, 0, 0, 1, 1,
-0.9128998, -0.09613112, -1.283507, 0, 0, 0, 1, 1,
-0.9114204, -0.8230507, -1.548346, 0, 0, 0, 1, 1,
-0.9097596, 1.160674, -2.342017, 0, 0, 0, 1, 1,
-0.9088504, 1.369784, -0.616828, 0, 0, 0, 1, 1,
-0.9015517, -1.202945, -2.97439, 0, 0, 0, 1, 1,
-0.8936912, 0.6076267, 1.172811, 0, 0, 0, 1, 1,
-0.8879399, -0.2403839, -2.701388, 0, 0, 0, 1, 1,
-0.8864248, -0.1824348, -2.51991, 1, 1, 1, 1, 1,
-0.8849806, -0.6014292, -1.078169, 1, 1, 1, 1, 1,
-0.8802596, 1.189376, 0.8596618, 1, 1, 1, 1, 1,
-0.8783878, -1.165007, -1.60072, 1, 1, 1, 1, 1,
-0.8779627, 0.6707882, -0.6825863, 1, 1, 1, 1, 1,
-0.8769132, 0.9341915, -1.501314, 1, 1, 1, 1, 1,
-0.8753206, -0.8748815, -3.631343, 1, 1, 1, 1, 1,
-0.8735816, 0.5292926, -0.419106, 1, 1, 1, 1, 1,
-0.8616518, -0.1105789, -2.272976, 1, 1, 1, 1, 1,
-0.8603591, -0.8853512, -2.144286, 1, 1, 1, 1, 1,
-0.8555776, 1.189116, -0.2855173, 1, 1, 1, 1, 1,
-0.8475057, 0.4326144, -0.215949, 1, 1, 1, 1, 1,
-0.8471861, -0.1352148, -0.1177605, 1, 1, 1, 1, 1,
-0.8349659, -1.08486, -3.066309, 1, 1, 1, 1, 1,
-0.8347885, -0.4049902, -2.319866, 1, 1, 1, 1, 1,
-0.8259453, 0.3478151, 0.1499828, 0, 0, 1, 1, 1,
-0.8224488, 0.2258861, -2.45555, 1, 0, 0, 1, 1,
-0.8190785, 0.8229079, -1.917213, 1, 0, 0, 1, 1,
-0.8190764, 1.354533, 0.792894, 1, 0, 0, 1, 1,
-0.8107135, -0.08297428, -2.515887, 1, 0, 0, 1, 1,
-0.8104132, -0.4479461, -2.081841, 1, 0, 0, 1, 1,
-0.8086835, 0.8525282, 1.916476, 0, 0, 0, 1, 1,
-0.8060298, -0.3668513, -0.8506644, 0, 0, 0, 1, 1,
-0.8060204, -0.5913437, -1.75771, 0, 0, 0, 1, 1,
-0.8053823, 0.3930135, -1.554371, 0, 0, 0, 1, 1,
-0.7995882, 1.372973, -1.264788, 0, 0, 0, 1, 1,
-0.792585, 0.8692172, -1.370953, 0, 0, 0, 1, 1,
-0.7906686, -0.8719445, -1.914017, 0, 0, 0, 1, 1,
-0.788241, -0.2145518, -1.779592, 1, 1, 1, 1, 1,
-0.7866597, -1.331961, -2.768222, 1, 1, 1, 1, 1,
-0.7864385, 0.7044945, -0.1225693, 1, 1, 1, 1, 1,
-0.7835613, 0.4171568, -0.001114397, 1, 1, 1, 1, 1,
-0.7813331, -0.3343467, -1.987948, 1, 1, 1, 1, 1,
-0.7811915, 0.6221377, -2.719942, 1, 1, 1, 1, 1,
-0.7810482, 0.5783027, -0.5929992, 1, 1, 1, 1, 1,
-0.7780108, 0.7365806, -1.519678, 1, 1, 1, 1, 1,
-0.7776058, -2.225124, -2.244301, 1, 1, 1, 1, 1,
-0.7759144, 0.02656171, -1.788116, 1, 1, 1, 1, 1,
-0.7733918, 0.5721071, -0.128702, 1, 1, 1, 1, 1,
-0.7722108, 0.385579, -1.924875, 1, 1, 1, 1, 1,
-0.7689907, -3.473514, -2.032601, 1, 1, 1, 1, 1,
-0.7658131, -0.2336625, -2.082473, 1, 1, 1, 1, 1,
-0.7540867, 0.2971195, -0.1771128, 1, 1, 1, 1, 1,
-0.7508529, -0.5507852, -1.108617, 0, 0, 1, 1, 1,
-0.7477662, -2.601272, -3.376414, 1, 0, 0, 1, 1,
-0.7465472, 0.25851, -1.251167, 1, 0, 0, 1, 1,
-0.7435762, 1.22386, -0.8078435, 1, 0, 0, 1, 1,
-0.7403722, 1.407001, -0.7967454, 1, 0, 0, 1, 1,
-0.7340775, 0.3316746, -1.503603, 1, 0, 0, 1, 1,
-0.7306173, 1.190461, -0.573476, 0, 0, 0, 1, 1,
-0.7297732, -1.108474, -3.432629, 0, 0, 0, 1, 1,
-0.7284223, 1.284694, -0.05302113, 0, 0, 0, 1, 1,
-0.7224886, -0.3524589, -3.11322, 0, 0, 0, 1, 1,
-0.7214648, -0.1484268, -0.04097066, 0, 0, 0, 1, 1,
-0.7193745, -0.9248655, -2.727715, 0, 0, 0, 1, 1,
-0.7191927, 1.710493, -1.546405, 0, 0, 0, 1, 1,
-0.718237, -0.3005792, -2.832665, 1, 1, 1, 1, 1,
-0.7172739, 0.4313383, -0.2420601, 1, 1, 1, 1, 1,
-0.713362, -0.9309343, -2.503788, 1, 1, 1, 1, 1,
-0.7112618, 0.5951313, -2.28878, 1, 1, 1, 1, 1,
-0.7006816, 1.804845, 1.381419, 1, 1, 1, 1, 1,
-0.7005461, 1.482455, 1.581053, 1, 1, 1, 1, 1,
-0.6998156, 0.0515365, -2.313104, 1, 1, 1, 1, 1,
-0.6982957, -1.375214, -2.206082, 1, 1, 1, 1, 1,
-0.6971169, 1.499564, -0.8340837, 1, 1, 1, 1, 1,
-0.694416, -0.7096441, -2.442759, 1, 1, 1, 1, 1,
-0.6941751, -1.193498, -3.210006, 1, 1, 1, 1, 1,
-0.6876726, -1.792002, -2.739411, 1, 1, 1, 1, 1,
-0.6871061, 0.4764126, -1.458529, 1, 1, 1, 1, 1,
-0.6865875, 1.796109, -0.5054485, 1, 1, 1, 1, 1,
-0.6846792, 0.1665342, -1.603304, 1, 1, 1, 1, 1,
-0.6795312, 1.687461, 1.098498, 0, 0, 1, 1, 1,
-0.6791787, 1.117293, -0.8755975, 1, 0, 0, 1, 1,
-0.6787262, 0.06780569, -1.680771, 1, 0, 0, 1, 1,
-0.6756946, -0.1512141, -1.429843, 1, 0, 0, 1, 1,
-0.6745763, -0.1450519, -2.452042, 1, 0, 0, 1, 1,
-0.6716719, -0.9387349, -4.022979, 1, 0, 0, 1, 1,
-0.6669083, 0.3244233, -0.1666971, 0, 0, 0, 1, 1,
-0.6602925, -0.4269806, -4.022686, 0, 0, 0, 1, 1,
-0.6539419, -0.26575, -1.689962, 0, 0, 0, 1, 1,
-0.6502513, 0.2210115, -2.362896, 0, 0, 0, 1, 1,
-0.6499084, 0.7418099, -1.179941, 0, 0, 0, 1, 1,
-0.6485242, -0.5955709, -1.632185, 0, 0, 0, 1, 1,
-0.6473138, 2.540128, -0.1743187, 0, 0, 0, 1, 1,
-0.6453485, 0.1792285, 0.09498399, 1, 1, 1, 1, 1,
-0.644989, 1.016842, -0.7579694, 1, 1, 1, 1, 1,
-0.6419549, -0.4858481, -0.7040176, 1, 1, 1, 1, 1,
-0.6317935, -0.4980436, -1.682001, 1, 1, 1, 1, 1,
-0.6283369, -0.1525393, -1.433748, 1, 1, 1, 1, 1,
-0.6279805, 0.1805643, -1.658829, 1, 1, 1, 1, 1,
-0.6234881, -0.1330943, -1.536079, 1, 1, 1, 1, 1,
-0.6211463, -0.08294825, -1.796809, 1, 1, 1, 1, 1,
-0.6205446, 0.1104779, -1.659207, 1, 1, 1, 1, 1,
-0.6180661, -0.4752478, -2.548219, 1, 1, 1, 1, 1,
-0.6160191, 0.3679118, -1.717334, 1, 1, 1, 1, 1,
-0.6138613, 0.3302001, -0.8201286, 1, 1, 1, 1, 1,
-0.6099234, -0.004070291, -2.58592, 1, 1, 1, 1, 1,
-0.6088104, -0.8025857, -2.937942, 1, 1, 1, 1, 1,
-0.6059497, -0.7120755, -2.928643, 1, 1, 1, 1, 1,
-0.5958728, 0.3412009, -1.764753, 0, 0, 1, 1, 1,
-0.5918571, 0.1083934, -0.98002, 1, 0, 0, 1, 1,
-0.5862309, -1.510219, -2.969094, 1, 0, 0, 1, 1,
-0.5855645, 1.653803, 0.4461723, 1, 0, 0, 1, 1,
-0.5852414, 0.8990169, -0.6867704, 1, 0, 0, 1, 1,
-0.5848252, -1.337704, -2.943801, 1, 0, 0, 1, 1,
-0.5749158, -0.2020727, -2.600237, 0, 0, 0, 1, 1,
-0.5716478, 0.6453814, 0.4068858, 0, 0, 0, 1, 1,
-0.569968, -1.378949, -3.248113, 0, 0, 0, 1, 1,
-0.5609676, 1.411369, 0.331546, 0, 0, 0, 1, 1,
-0.5595903, 1.445684, 0.4162878, 0, 0, 0, 1, 1,
-0.5575653, 0.5817757, -0.09926204, 0, 0, 0, 1, 1,
-0.5542001, 1.766026, -0.407709, 0, 0, 0, 1, 1,
-0.5533181, -1.483488, -3.91344, 1, 1, 1, 1, 1,
-0.5528799, 0.45946, -1.231618, 1, 1, 1, 1, 1,
-0.5508341, -0.05046353, -1.535111, 1, 1, 1, 1, 1,
-0.550108, 0.3510281, -2.022236, 1, 1, 1, 1, 1,
-0.5500439, 0.002675032, -1.559301, 1, 1, 1, 1, 1,
-0.5467538, -0.224373, -2.138664, 1, 1, 1, 1, 1,
-0.5361269, -1.017783, -1.060531, 1, 1, 1, 1, 1,
-0.5346221, -0.3822095, -2.839567, 1, 1, 1, 1, 1,
-0.5326673, 0.6011235, -0.738658, 1, 1, 1, 1, 1,
-0.5320557, 1.039147, 0.3348751, 1, 1, 1, 1, 1,
-0.5310999, -0.8890128, -6.067508, 1, 1, 1, 1, 1,
-0.5284338, 2.070324, -0.6812152, 1, 1, 1, 1, 1,
-0.5251777, -0.3480522, -1.216105, 1, 1, 1, 1, 1,
-0.5240316, -0.2434303, -1.860777, 1, 1, 1, 1, 1,
-0.5118222, -0.8694624, -3.921283, 1, 1, 1, 1, 1,
-0.5105402, -0.153177, -1.953444, 0, 0, 1, 1, 1,
-0.5095094, 1.220026, -0.961359, 1, 0, 0, 1, 1,
-0.5080561, -2.000297, -1.211533, 1, 0, 0, 1, 1,
-0.5051249, 1.486562, 0.8280826, 1, 0, 0, 1, 1,
-0.5034248, 1.501592, -0.7983949, 1, 0, 0, 1, 1,
-0.5027377, 0.5354789, -1.973018, 1, 0, 0, 1, 1,
-0.499377, 1.534107, -0.4941099, 0, 0, 0, 1, 1,
-0.4985672, 0.363115, -1.3359, 0, 0, 0, 1, 1,
-0.4979815, 0.6834049, -4.022181, 0, 0, 0, 1, 1,
-0.4935828, -2.034239, -3.169358, 0, 0, 0, 1, 1,
-0.4860088, -0.3516826, -1.020908, 0, 0, 0, 1, 1,
-0.4830007, 0.4948983, -3.344464, 0, 0, 0, 1, 1,
-0.479659, -0.3474928, -1.650912, 0, 0, 0, 1, 1,
-0.4794998, -0.1136418, -2.150558, 1, 1, 1, 1, 1,
-0.4787503, 0.7291959, 0.5460821, 1, 1, 1, 1, 1,
-0.4737061, -0.7384893, -2.137293, 1, 1, 1, 1, 1,
-0.4712436, 0.3536902, 0.01499479, 1, 1, 1, 1, 1,
-0.4697865, 0.243722, -0.5146383, 1, 1, 1, 1, 1,
-0.4661963, -0.1467541, -0.986451, 1, 1, 1, 1, 1,
-0.4633636, -0.1371159, -0.6805927, 1, 1, 1, 1, 1,
-0.4595775, 0.5620581, -0.6431859, 1, 1, 1, 1, 1,
-0.4546431, -0.7204694, -2.157803, 1, 1, 1, 1, 1,
-0.4508798, 0.164111, -1.508027, 1, 1, 1, 1, 1,
-0.4507308, 0.1128643, -1.250726, 1, 1, 1, 1, 1,
-0.4482725, 0.09513137, -1.225301, 1, 1, 1, 1, 1,
-0.4445805, -1.449193, -1.354957, 1, 1, 1, 1, 1,
-0.4406054, -1.27398, -1.961417, 1, 1, 1, 1, 1,
-0.4385043, 0.002172781, -2.928718, 1, 1, 1, 1, 1,
-0.4338722, 0.01922375, -0.8493378, 0, 0, 1, 1, 1,
-0.4321989, 0.6554643, -0.5649084, 1, 0, 0, 1, 1,
-0.4320051, 1.065781, -0.7505529, 1, 0, 0, 1, 1,
-0.4308681, 1.918033, -1.499665, 1, 0, 0, 1, 1,
-0.4304559, -0.3690965, -1.557199, 1, 0, 0, 1, 1,
-0.4295534, -1.414529, -2.863331, 1, 0, 0, 1, 1,
-0.4295319, -0.1298862, -0.8528662, 0, 0, 0, 1, 1,
-0.4272666, -0.2479787, -0.987829, 0, 0, 0, 1, 1,
-0.4226166, 1.021701, -1.74497, 0, 0, 0, 1, 1,
-0.4216637, -1.315104, -3.408715, 0, 0, 0, 1, 1,
-0.4210683, -0.6188436, -2.242961, 0, 0, 0, 1, 1,
-0.4194806, -0.3593073, -1.495897, 0, 0, 0, 1, 1,
-0.4166861, 0.9735994, 0.8725363, 0, 0, 0, 1, 1,
-0.4163662, 0.4448225, -1.757454, 1, 1, 1, 1, 1,
-0.414779, 0.3503668, 0.002448556, 1, 1, 1, 1, 1,
-0.4144575, -0.1499217, -1.097372, 1, 1, 1, 1, 1,
-0.4126242, -1.179487, -3.630272, 1, 1, 1, 1, 1,
-0.4087226, -0.7749156, -4.159036, 1, 1, 1, 1, 1,
-0.4079768, -0.4088981, -2.411192, 1, 1, 1, 1, 1,
-0.3962658, -0.5949484, -3.138568, 1, 1, 1, 1, 1,
-0.392101, 0.1512192, -0.2114637, 1, 1, 1, 1, 1,
-0.3918183, -0.947437, -2.259332, 1, 1, 1, 1, 1,
-0.3903509, 0.1380554, -0.1177809, 1, 1, 1, 1, 1,
-0.3893388, -0.09594762, -2.850835, 1, 1, 1, 1, 1,
-0.3887469, 0.3201708, 0.7291039, 1, 1, 1, 1, 1,
-0.3848236, 0.8239471, 1.306988, 1, 1, 1, 1, 1,
-0.3846144, -0.3064114, -0.8170348, 1, 1, 1, 1, 1,
-0.3800229, 0.2998709, -1.358433, 1, 1, 1, 1, 1,
-0.3763974, -0.7105006, -1.143684, 0, 0, 1, 1, 1,
-0.3744355, -1.289129, -1.064344, 1, 0, 0, 1, 1,
-0.3707542, 1.37251, -0.5668234, 1, 0, 0, 1, 1,
-0.3627893, 0.8297608, -0.9749303, 1, 0, 0, 1, 1,
-0.3624584, 0.6954781, -0.4128602, 1, 0, 0, 1, 1,
-0.3602142, 0.4158144, -1.148279, 1, 0, 0, 1, 1,
-0.3534225, 1.123638, 0.2556708, 0, 0, 0, 1, 1,
-0.3478765, 0.09785728, -1.648602, 0, 0, 0, 1, 1,
-0.3458612, -0.137044, -1.675803, 0, 0, 0, 1, 1,
-0.3439597, 0.3020694, 1.014033, 0, 0, 0, 1, 1,
-0.3390887, 0.1956646, -0.2425946, 0, 0, 0, 1, 1,
-0.3380545, -1.200816, -3.632691, 0, 0, 0, 1, 1,
-0.3362909, -0.3128144, -2.306418, 0, 0, 0, 1, 1,
-0.3348217, 0.4072897, -0.7707664, 1, 1, 1, 1, 1,
-0.3275968, 0.285654, -1.675424, 1, 1, 1, 1, 1,
-0.3268115, -0.3562873, -3.653603, 1, 1, 1, 1, 1,
-0.3258217, 0.2480087, -0.5403777, 1, 1, 1, 1, 1,
-0.325347, 0.5177975, 0.7380424, 1, 1, 1, 1, 1,
-0.3197392, 0.4931445, -1.866518, 1, 1, 1, 1, 1,
-0.3196217, 0.2638568, -0.2585315, 1, 1, 1, 1, 1,
-0.3188269, -0.276913, -1.992938, 1, 1, 1, 1, 1,
-0.3157371, -0.1059948, -2.468811, 1, 1, 1, 1, 1,
-0.3124229, 0.1819216, 0.5626324, 1, 1, 1, 1, 1,
-0.3102356, 1.202432, -1.652553, 1, 1, 1, 1, 1,
-0.3086253, -0.8354862, -2.532435, 1, 1, 1, 1, 1,
-0.303185, -0.3416019, -2.782855, 1, 1, 1, 1, 1,
-0.3026869, -1.422538, -2.439464, 1, 1, 1, 1, 1,
-0.278789, -0.5704649, -3.452317, 1, 1, 1, 1, 1,
-0.26793, 0.1925624, -1.225585, 0, 0, 1, 1, 1,
-0.2669114, -0.1923009, -0.5966362, 1, 0, 0, 1, 1,
-0.2645526, 0.1940841, -0.8777158, 1, 0, 0, 1, 1,
-0.2606921, -2.307745, -3.605615, 1, 0, 0, 1, 1,
-0.258493, 0.357262, 1.153648, 1, 0, 0, 1, 1,
-0.2563988, -1.135931, -3.103536, 1, 0, 0, 1, 1,
-0.256342, 0.1412584, -1.737761, 0, 0, 0, 1, 1,
-0.2560055, 0.2788313, -0.1594574, 0, 0, 0, 1, 1,
-0.2540715, 0.7708982, -1.116467, 0, 0, 0, 1, 1,
-0.2534113, -0.846575, -1.680539, 0, 0, 0, 1, 1,
-0.250865, -0.2961577, -2.898284, 0, 0, 0, 1, 1,
-0.2505111, -1.500133, -3.515808, 0, 0, 0, 1, 1,
-0.2489583, -0.3716264, -0.4987724, 0, 0, 0, 1, 1,
-0.2444864, 1.710583, 0.4116709, 1, 1, 1, 1, 1,
-0.2412657, -1.908444, -1.73472, 1, 1, 1, 1, 1,
-0.2412185, 1.151446, -0.678999, 1, 1, 1, 1, 1,
-0.2402435, -0.4274269, -3.139492, 1, 1, 1, 1, 1,
-0.2350126, 0.2100906, -1.07205, 1, 1, 1, 1, 1,
-0.2333419, 1.262424, 0.5972185, 1, 1, 1, 1, 1,
-0.2267527, 0.6106892, 0.9922053, 1, 1, 1, 1, 1,
-0.2229494, 1.332209, 0.1613585, 1, 1, 1, 1, 1,
-0.2207197, -0.177168, -1.288507, 1, 1, 1, 1, 1,
-0.2194005, -0.5551512, -1.763031, 1, 1, 1, 1, 1,
-0.2183397, -0.5097845, -4.489403, 1, 1, 1, 1, 1,
-0.217365, 0.1198046, -1.113405, 1, 1, 1, 1, 1,
-0.208601, -0.4599306, -3.608914, 1, 1, 1, 1, 1,
-0.2079442, -0.1642437, -2.731045, 1, 1, 1, 1, 1,
-0.203237, -1.058691, -2.307882, 1, 1, 1, 1, 1,
-0.2024771, 1.113865, -0.1197814, 0, 0, 1, 1, 1,
-0.201461, -0.07557235, -2.948855, 1, 0, 0, 1, 1,
-0.201106, 0.3026497, -0.8099493, 1, 0, 0, 1, 1,
-0.1937893, -1.125336, -2.297797, 1, 0, 0, 1, 1,
-0.1917167, 0.874686, -1.195013, 1, 0, 0, 1, 1,
-0.1875565, 0.685737, -1.302204, 1, 0, 0, 1, 1,
-0.1844375, -0.7298173, -1.576133, 0, 0, 0, 1, 1,
-0.1833472, 0.2335434, -0.1426804, 0, 0, 0, 1, 1,
-0.1826988, 0.9242338, 0.1401025, 0, 0, 0, 1, 1,
-0.1822667, -1.957447, -3.370877, 0, 0, 0, 1, 1,
-0.1821602, 0.0965738, -2.880449, 0, 0, 0, 1, 1,
-0.1799888, -0.9934507, -2.4951, 0, 0, 0, 1, 1,
-0.1798098, 1.220824, -1.029003, 0, 0, 0, 1, 1,
-0.1778582, 0.02617509, -1.622041, 1, 1, 1, 1, 1,
-0.1695469, 1.46835, -0.3394569, 1, 1, 1, 1, 1,
-0.1670063, -0.7140514, -2.710344, 1, 1, 1, 1, 1,
-0.1656774, -0.7594599, -3.108413, 1, 1, 1, 1, 1,
-0.1654839, 1.032445, -0.7470756, 1, 1, 1, 1, 1,
-0.1653554, -0.2405499, -2.709605, 1, 1, 1, 1, 1,
-0.1644024, 0.7438577, -1.016971, 1, 1, 1, 1, 1,
-0.1616025, -0.8431417, -4.986046, 1, 1, 1, 1, 1,
-0.1532124, -1.340902, -3.316798, 1, 1, 1, 1, 1,
-0.1498392, 0.9591826, 0.0561443, 1, 1, 1, 1, 1,
-0.149146, 0.5779419, 0.9024367, 1, 1, 1, 1, 1,
-0.1485695, -0.008816801, -2.160005, 1, 1, 1, 1, 1,
-0.1477677, 1.47833, 0.7718639, 1, 1, 1, 1, 1,
-0.1472791, 0.2723713, 0.6905508, 1, 1, 1, 1, 1,
-0.1446278, -0.2801455, -1.629232, 1, 1, 1, 1, 1,
-0.1442012, -2.363529, -2.61102, 0, 0, 1, 1, 1,
-0.1441181, 0.2836505, -2.060353, 1, 0, 0, 1, 1,
-0.1410593, -0.3449405, -2.127275, 1, 0, 0, 1, 1,
-0.1388223, 0.7003872, -0.5928964, 1, 0, 0, 1, 1,
-0.1339528, -0.1692585, -2.687563, 1, 0, 0, 1, 1,
-0.1255821, 1.171913, -0.1362842, 1, 0, 0, 1, 1,
-0.1242765, 1.187152, -0.6149544, 0, 0, 0, 1, 1,
-0.1221093, 0.1368543, -2.243343, 0, 0, 0, 1, 1,
-0.1203777, -1.12496, -2.006124, 0, 0, 0, 1, 1,
-0.1194212, -1.804599, -2.511877, 0, 0, 0, 1, 1,
-0.1167424, -0.9142048, -4.423522, 0, 0, 0, 1, 1,
-0.1152318, -0.04408344, -0.8762256, 0, 0, 0, 1, 1,
-0.114806, 0.5084075, -1.248771, 0, 0, 0, 1, 1,
-0.1139704, 1.531855, -0.4214424, 1, 1, 1, 1, 1,
-0.1003625, -0.1514649, -3.303378, 1, 1, 1, 1, 1,
-0.09475403, -0.0237149, -0.1910712, 1, 1, 1, 1, 1,
-0.09360761, -0.877088, -3.18496, 1, 1, 1, 1, 1,
-0.09326521, 0.5879692, -1.127903, 1, 1, 1, 1, 1,
-0.09298121, 0.935434, -0.7963507, 1, 1, 1, 1, 1,
-0.09258424, 0.7482316, -1.010527, 1, 1, 1, 1, 1,
-0.08998714, 0.3994398, 0.2477673, 1, 1, 1, 1, 1,
-0.08955252, 0.6724917, 1.03265, 1, 1, 1, 1, 1,
-0.0865944, -3.241132, -2.815433, 1, 1, 1, 1, 1,
-0.085275, -0.3548152, -2.368793, 1, 1, 1, 1, 1,
-0.08051826, 0.7613088, 0.7062769, 1, 1, 1, 1, 1,
-0.07813606, 1.731167, 0.1460293, 1, 1, 1, 1, 1,
-0.07723821, 0.6738873, 1.029631, 1, 1, 1, 1, 1,
-0.07391814, 1.556209, -2.302085, 1, 1, 1, 1, 1,
-0.07347137, -0.4910543, -2.668334, 0, 0, 1, 1, 1,
-0.07113498, 1.353627, 0.07716618, 1, 0, 0, 1, 1,
-0.07015588, 0.8430219, -1.044501, 1, 0, 0, 1, 1,
-0.0685303, -1.63381, -4.326311, 1, 0, 0, 1, 1,
-0.06246863, -0.8164487, -2.41301, 1, 0, 0, 1, 1,
-0.06016942, -0.3755893, -3.649927, 1, 0, 0, 1, 1,
-0.05868443, 0.0585775, -0.990369, 0, 0, 0, 1, 1,
-0.0564331, 1.117632, 0.6082726, 0, 0, 0, 1, 1,
-0.05297815, 0.1559027, -0.5053845, 0, 0, 0, 1, 1,
-0.05293084, 0.1013719, -1.489092, 0, 0, 0, 1, 1,
-0.05272797, 0.5795987, 0.5115028, 0, 0, 0, 1, 1,
-0.05253201, -0.8111701, -3.704932, 0, 0, 0, 1, 1,
-0.05099931, 2.276155, 0.2852584, 0, 0, 0, 1, 1,
-0.04994821, -0.2814516, -3.294687, 1, 1, 1, 1, 1,
-0.04959615, 1.07899, -0.03397417, 1, 1, 1, 1, 1,
-0.04741466, 0.3495282, 0.2030778, 1, 1, 1, 1, 1,
-0.04698382, 0.4645667, -1.114758, 1, 1, 1, 1, 1,
-0.04698024, 0.4318842, -0.04158661, 1, 1, 1, 1, 1,
-0.04620982, 0.3744153, -0.4353817, 1, 1, 1, 1, 1,
-0.04417627, -0.1453098, -2.163631, 1, 1, 1, 1, 1,
-0.04369213, -0.177039, -3.081125, 1, 1, 1, 1, 1,
-0.04341191, 0.6738433, 0.7764874, 1, 1, 1, 1, 1,
-0.04172691, 0.1449763, 0.3577512, 1, 1, 1, 1, 1,
-0.04080775, -0.001852679, -1.41234, 1, 1, 1, 1, 1,
-0.03847722, 0.6388018, -1.193522, 1, 1, 1, 1, 1,
-0.03783061, -0.2766472, -4.685953, 1, 1, 1, 1, 1,
-0.03694393, -0.3036166, -1.930184, 1, 1, 1, 1, 1,
-0.03653024, -1.162862, -3.712768, 1, 1, 1, 1, 1,
-0.03226114, 0.02182759, -0.5606664, 0, 0, 1, 1, 1,
-0.03201409, -0.161105, -3.192146, 1, 0, 0, 1, 1,
-0.03127518, -0.9612206, -3.032476, 1, 0, 0, 1, 1,
-0.02846644, -1.446911, -4.641196, 1, 0, 0, 1, 1,
-0.01847018, -0.3406808, -0.9453091, 1, 0, 0, 1, 1,
-0.01390077, 0.05236491, 1.521207, 1, 0, 0, 1, 1,
-0.01371248, 0.1379361, -1.732061, 0, 0, 0, 1, 1,
-0.01098843, 0.682588, -0.9543664, 0, 0, 0, 1, 1,
-0.01086055, -0.07344469, -3.643969, 0, 0, 0, 1, 1,
-0.008280626, 1.007458, -2.077235, 0, 0, 0, 1, 1,
-0.008254594, -0.4680887, -2.541175, 0, 0, 0, 1, 1,
-0.006683207, -1.014674, -4.580543, 0, 0, 0, 1, 1,
-0.004601614, -1.571854, -2.953906, 0, 0, 0, 1, 1,
-0.003642018, 0.5005843, 0.6004077, 1, 1, 1, 1, 1,
-0.003389064, 0.7099077, -0.2624015, 1, 1, 1, 1, 1,
-0.003374022, 0.6115224, 1.314031, 1, 1, 1, 1, 1,
-0.002889888, 1.183641, 1.065581, 1, 1, 1, 1, 1,
0.001453577, -0.1747811, 5.871272, 1, 1, 1, 1, 1,
0.00335407, -0.7459067, 2.707942, 1, 1, 1, 1, 1,
0.004744898, -0.9058927, 3.074072, 1, 1, 1, 1, 1,
0.006999456, -0.05834517, 0.9020286, 1, 1, 1, 1, 1,
0.008738334, 0.7468618, 1.523878, 1, 1, 1, 1, 1,
0.01004823, 0.1356384, 0.7364528, 1, 1, 1, 1, 1,
0.01181893, 3.080244, 0.9481294, 1, 1, 1, 1, 1,
0.0174803, 0.8576882, 0.08896297, 1, 1, 1, 1, 1,
0.01899541, -1.632467, 3.814284, 1, 1, 1, 1, 1,
0.01911274, -0.92914, 2.863682, 1, 1, 1, 1, 1,
0.01989892, -0.6018632, 2.437692, 1, 1, 1, 1, 1,
0.02136281, -1.828449, 4.077144, 0, 0, 1, 1, 1,
0.02564466, -0.4231362, 1.855832, 1, 0, 0, 1, 1,
0.03596022, -0.9931449, 4.04857, 1, 0, 0, 1, 1,
0.0424445, 1.075561, -1.482506, 1, 0, 0, 1, 1,
0.04306876, -0.09924883, 2.451052, 1, 0, 0, 1, 1,
0.0449171, -0.6124129, 1.137305, 1, 0, 0, 1, 1,
0.04496395, 2.454483, -0.9385963, 0, 0, 0, 1, 1,
0.04611822, 0.03381804, 1.228251, 0, 0, 0, 1, 1,
0.05412695, 0.4882658, 1.228957, 0, 0, 0, 1, 1,
0.05824235, 0.09764934, 0.4277933, 0, 0, 0, 1, 1,
0.06302197, 1.166832, 1.104388, 0, 0, 0, 1, 1,
0.06872509, 0.9629837, 0.4960306, 0, 0, 0, 1, 1,
0.06948147, 1.465074, 0.3630856, 0, 0, 0, 1, 1,
0.0708586, 0.539074, 1.099307, 1, 1, 1, 1, 1,
0.07405739, -0.5439274, 1.661035, 1, 1, 1, 1, 1,
0.0840774, 0.9566765, 0.96779, 1, 1, 1, 1, 1,
0.08734038, -0.03709112, 1.085272, 1, 1, 1, 1, 1,
0.0916884, 0.7818363, 1.847723, 1, 1, 1, 1, 1,
0.0956056, 0.3525358, -0.04535739, 1, 1, 1, 1, 1,
0.09746902, 0.4740848, 1.260909, 1, 1, 1, 1, 1,
0.1024852, -1.571067, 3.801929, 1, 1, 1, 1, 1,
0.104947, 0.2307784, 1.259903, 1, 1, 1, 1, 1,
0.1091485, 0.4994181, 0.6182383, 1, 1, 1, 1, 1,
0.1099246, -0.74417, 4.793016, 1, 1, 1, 1, 1,
0.1103714, 1.568906, 0.2126805, 1, 1, 1, 1, 1,
0.1107458, 0.1793462, -0.2063697, 1, 1, 1, 1, 1,
0.1126463, 0.3298493, 2.082291, 1, 1, 1, 1, 1,
0.1131827, 0.8350931, -0.2448745, 1, 1, 1, 1, 1,
0.1195225, -0.7644622, 2.592086, 0, 0, 1, 1, 1,
0.1228623, 0.13512, 0.8300499, 1, 0, 0, 1, 1,
0.1235944, 0.7119011, 1.685317, 1, 0, 0, 1, 1,
0.1239517, -0.8888293, 4.088836, 1, 0, 0, 1, 1,
0.1241464, -0.8652006, 4.169756, 1, 0, 0, 1, 1,
0.1249897, 0.122104, -0.9193232, 1, 0, 0, 1, 1,
0.1271358, -1.779904, 3.219268, 0, 0, 0, 1, 1,
0.1320541, -0.8686771, 5.06275, 0, 0, 0, 1, 1,
0.1349353, 0.6328843, -0.8602633, 0, 0, 0, 1, 1,
0.1355715, 0.8157508, -0.1330329, 0, 0, 0, 1, 1,
0.1416239, 0.08616173, 2.484623, 0, 0, 0, 1, 1,
0.1431535, 0.4135138, 1.077304, 0, 0, 0, 1, 1,
0.1460045, -1.373927, 1.395418, 0, 0, 0, 1, 1,
0.1488564, 1.098487, 1.941441, 1, 1, 1, 1, 1,
0.1492351, -0.2307798, 2.051307, 1, 1, 1, 1, 1,
0.150912, -0.24888, 1.230103, 1, 1, 1, 1, 1,
0.1539336, -1.05047, 2.940128, 1, 1, 1, 1, 1,
0.154099, -0.2606101, 3.349439, 1, 1, 1, 1, 1,
0.1581542, -0.6901343, 2.400634, 1, 1, 1, 1, 1,
0.1591512, 1.603269, -0.8610527, 1, 1, 1, 1, 1,
0.1603814, 0.8072522, -0.3603838, 1, 1, 1, 1, 1,
0.1645278, 1.002109, -0.8042703, 1, 1, 1, 1, 1,
0.1646839, -1.552281, 4.184236, 1, 1, 1, 1, 1,
0.1705026, 1.226227, 0.424437, 1, 1, 1, 1, 1,
0.1793857, 0.6761126, -1.173989, 1, 1, 1, 1, 1,
0.1832362, -0.0987459, 3.345435, 1, 1, 1, 1, 1,
0.1834526, -0.07613477, 2.990755, 1, 1, 1, 1, 1,
0.1858388, 0.5488122, -0.6066731, 1, 1, 1, 1, 1,
0.1878193, 1.440135, 0.4838622, 0, 0, 1, 1, 1,
0.1888964, -0.02383877, 3.169388, 1, 0, 0, 1, 1,
0.1900291, -1.2285, 0.9605899, 1, 0, 0, 1, 1,
0.190229, 0.05121373, 1.355844, 1, 0, 0, 1, 1,
0.1925592, 0.3183266, 1.299294, 1, 0, 0, 1, 1,
0.1940252, -0.6490854, 3.153385, 1, 0, 0, 1, 1,
0.1940495, 1.471155, 0.4919069, 0, 0, 0, 1, 1,
0.1946247, -0.9544604, 2.592918, 0, 0, 0, 1, 1,
0.1956878, -1.00576, 2.005781, 0, 0, 0, 1, 1,
0.1963455, 0.5670939, -0.0238797, 0, 0, 0, 1, 1,
0.19983, 0.8516374, -1.282127, 0, 0, 0, 1, 1,
0.2037329, -0.667242, 3.024147, 0, 0, 0, 1, 1,
0.209024, -0.9899858, 2.241702, 0, 0, 0, 1, 1,
0.2098902, -0.3379399, 2.972787, 1, 1, 1, 1, 1,
0.2144452, 0.884111, 2.04277, 1, 1, 1, 1, 1,
0.2165277, 0.2950625, -0.232756, 1, 1, 1, 1, 1,
0.2202231, 0.2855694, 0.5100073, 1, 1, 1, 1, 1,
0.2204429, 1.183638, -0.08240591, 1, 1, 1, 1, 1,
0.2234248, 1.585605, 0.73185, 1, 1, 1, 1, 1,
0.2249538, 0.3542928, 1.678852, 1, 1, 1, 1, 1,
0.2267008, -1.980239, 1.912595, 1, 1, 1, 1, 1,
0.2287216, 0.468352, 2.043174, 1, 1, 1, 1, 1,
0.2311022, -0.7445286, 2.751217, 1, 1, 1, 1, 1,
0.2311635, -0.3961409, 4.690354, 1, 1, 1, 1, 1,
0.2318429, 0.1535195, 1.517001, 1, 1, 1, 1, 1,
0.2341228, 0.791678, -0.08426929, 1, 1, 1, 1, 1,
0.2374297, 1.288016, 2.458709, 1, 1, 1, 1, 1,
0.2382351, -1.076933, 3.389994, 1, 1, 1, 1, 1,
0.2396936, -0.9804408, 0.4899562, 0, 0, 1, 1, 1,
0.2420911, 1.377298, -0.5045237, 1, 0, 0, 1, 1,
0.2440529, -0.4675095, 2.454078, 1, 0, 0, 1, 1,
0.2477978, -0.7684536, 3.625973, 1, 0, 0, 1, 1,
0.2495604, -0.9730247, 2.421232, 1, 0, 0, 1, 1,
0.2507854, -1.412446, 2.370361, 1, 0, 0, 1, 1,
0.2515751, -0.7829316, 1.397648, 0, 0, 0, 1, 1,
0.2554245, -0.7576391, 2.825343, 0, 0, 0, 1, 1,
0.2585592, 0.2022839, -0.5817991, 0, 0, 0, 1, 1,
0.260363, 0.668871, -1.394301, 0, 0, 0, 1, 1,
0.2728872, 0.6651518, 0.9741918, 0, 0, 0, 1, 1,
0.2753035, -0.2461224, 0.2348977, 0, 0, 0, 1, 1,
0.2818702, 0.541223, 2.2097, 0, 0, 0, 1, 1,
0.2865199, -2.166491, 2.244015, 1, 1, 1, 1, 1,
0.2880473, -1.311226, 2.635619, 1, 1, 1, 1, 1,
0.2953447, -0.7946244, 1.943531, 1, 1, 1, 1, 1,
0.2954175, -0.8337545, 2.449019, 1, 1, 1, 1, 1,
0.3036937, -1.417022, 2.49026, 1, 1, 1, 1, 1,
0.3073168, -1.088973, 4.524068, 1, 1, 1, 1, 1,
0.3079611, -0.8776639, 3.313137, 1, 1, 1, 1, 1,
0.3097206, -0.7312142, 2.001559, 1, 1, 1, 1, 1,
0.3100021, -1.182553, 2.610303, 1, 1, 1, 1, 1,
0.3135057, -0.4442255, 2.125869, 1, 1, 1, 1, 1,
0.3136473, -4.060377e-05, -0.02941543, 1, 1, 1, 1, 1,
0.3199729, -0.2921847, 1.222888, 1, 1, 1, 1, 1,
0.329817, 0.1303273, -0.1468997, 1, 1, 1, 1, 1,
0.3309467, 0.09808329, 0.8502049, 1, 1, 1, 1, 1,
0.3377302, -1.088691, 3.966449, 1, 1, 1, 1, 1,
0.3396216, 0.1366855, 1.291152, 0, 0, 1, 1, 1,
0.339956, -0.7874198, 3.99696, 1, 0, 0, 1, 1,
0.3400324, 1.804331, 0.7163747, 1, 0, 0, 1, 1,
0.3403841, 1.522982, 0.09402567, 1, 0, 0, 1, 1,
0.3416514, -0.1267498, 1.824054, 1, 0, 0, 1, 1,
0.3442812, 0.1983505, -0.06471288, 1, 0, 0, 1, 1,
0.3469006, -1.63425, 4.282825, 0, 0, 0, 1, 1,
0.3530554, 0.2032436, 1.164983, 0, 0, 0, 1, 1,
0.3593662, -1.210407, 2.575811, 0, 0, 0, 1, 1,
0.360876, 0.5102615, 0.6596088, 0, 0, 0, 1, 1,
0.3670998, 0.9051095, 1.17936, 0, 0, 0, 1, 1,
0.3680547, -1.981678, 3.081251, 0, 0, 0, 1, 1,
0.368757, -0.09127912, 1.473712, 0, 0, 0, 1, 1,
0.3760248, 0.5640998, 1.704306, 1, 1, 1, 1, 1,
0.3769985, -0.8244963, 2.076659, 1, 1, 1, 1, 1,
0.3833648, -0.521908, 0.9774475, 1, 1, 1, 1, 1,
0.3841128, 1.968921, -1.149234, 1, 1, 1, 1, 1,
0.3857182, 0.3089709, -0.2591737, 1, 1, 1, 1, 1,
0.3874342, 0.9832006, 0.6379221, 1, 1, 1, 1, 1,
0.3876413, 0.9473928, -1.056131, 1, 1, 1, 1, 1,
0.3876664, -0.9802249, 2.59135, 1, 1, 1, 1, 1,
0.387716, -0.5265476, 2.58171, 1, 1, 1, 1, 1,
0.3902128, -0.1004636, 1.487676, 1, 1, 1, 1, 1,
0.3902877, 0.3116545, 3.115162, 1, 1, 1, 1, 1,
0.3918, -0.1606154, 3.07233, 1, 1, 1, 1, 1,
0.3921067, 0.5424439, -0.5331939, 1, 1, 1, 1, 1,
0.3939083, -0.7881024, 1.299596, 1, 1, 1, 1, 1,
0.3964185, 0.849079, 1.961151, 1, 1, 1, 1, 1,
0.417141, -0.3543992, 2.004614, 0, 0, 1, 1, 1,
0.4435506, 0.4559848, -0.5572556, 1, 0, 0, 1, 1,
0.4492474, -1.586493, 3.214976, 1, 0, 0, 1, 1,
0.4496306, -0.3892809, 2.279587, 1, 0, 0, 1, 1,
0.456015, 0.1715449, 2.077824, 1, 0, 0, 1, 1,
0.4603941, -0.5107905, 3.247245, 1, 0, 0, 1, 1,
0.4610583, -0.7333656, 1.81477, 0, 0, 0, 1, 1,
0.4622682, 0.2132683, 1.877555, 0, 0, 0, 1, 1,
0.4623095, -0.5409591, 1.919329, 0, 0, 0, 1, 1,
0.4623314, -0.0127215, 2.497785, 0, 0, 0, 1, 1,
0.4658231, -0.7579533, 1.164757, 0, 0, 0, 1, 1,
0.47467, 1.673724, -0.006649951, 0, 0, 0, 1, 1,
0.4762155, -0.6249297, 3.751523, 0, 0, 0, 1, 1,
0.4799737, 0.1095491, 0.3675771, 1, 1, 1, 1, 1,
0.4800612, 0.8429813, 1.117469, 1, 1, 1, 1, 1,
0.4817231, 0.5478628, 0.1192484, 1, 1, 1, 1, 1,
0.4866547, -0.1235607, 1.70659, 1, 1, 1, 1, 1,
0.4890445, 1.076426, 1.499253, 1, 1, 1, 1, 1,
0.4937341, -0.9314276, 2.518303, 1, 1, 1, 1, 1,
0.4945839, -0.169224, 1.950616, 1, 1, 1, 1, 1,
0.4960329, 1.362762, -0.2914312, 1, 1, 1, 1, 1,
0.4973829, 0.1255424, 2.721192, 1, 1, 1, 1, 1,
0.4974987, 0.6202353, 0.5485455, 1, 1, 1, 1, 1,
0.5028489, -0.3126083, 3.695666, 1, 1, 1, 1, 1,
0.5075693, 0.5108041, 0.7090574, 1, 1, 1, 1, 1,
0.5118896, -1.414417, 3.516847, 1, 1, 1, 1, 1,
0.5127231, 0.7209659, -0.4458367, 1, 1, 1, 1, 1,
0.5132454, -0.1807688, 1.874742, 1, 1, 1, 1, 1,
0.5134985, 0.3682204, 2.942312, 0, 0, 1, 1, 1,
0.5141267, 0.7488914, -0.4533102, 1, 0, 0, 1, 1,
0.5150595, 0.462906, 0.5582083, 1, 0, 0, 1, 1,
0.5160272, -0.9054552, 3.24124, 1, 0, 0, 1, 1,
0.5217562, 0.048759, 2.73733, 1, 0, 0, 1, 1,
0.5229964, -0.1484724, 1.691787, 1, 0, 0, 1, 1,
0.5233107, 0.08002532, 2.47511, 0, 0, 0, 1, 1,
0.523541, -0.9281707, 4.232453, 0, 0, 0, 1, 1,
0.5346071, 1.745229, 0.1444095, 0, 0, 0, 1, 1,
0.536258, -0.01047704, 2.420656, 0, 0, 0, 1, 1,
0.5368448, 0.7217474, -0.03872294, 0, 0, 0, 1, 1,
0.5431628, -0.1049961, 1.081484, 0, 0, 0, 1, 1,
0.5444222, 1.043737, 1.516589, 0, 0, 0, 1, 1,
0.5444953, 1.594066, 1.004647, 1, 1, 1, 1, 1,
0.5445468, 0.9944227, -0.06913646, 1, 1, 1, 1, 1,
0.5508656, -2.846003, 2.59793, 1, 1, 1, 1, 1,
0.551625, 0.4099515, -0.005594885, 1, 1, 1, 1, 1,
0.5566443, 0.06238021, 1.78964, 1, 1, 1, 1, 1,
0.5579842, -1.008927, 2.457874, 1, 1, 1, 1, 1,
0.558565, 0.01401604, 3.004706, 1, 1, 1, 1, 1,
0.5595652, -1.049402, 1.404045, 1, 1, 1, 1, 1,
0.5626951, -1.112586, 3.118372, 1, 1, 1, 1, 1,
0.5645095, -1.223587, 3.297868, 1, 1, 1, 1, 1,
0.5664967, 1.611169, -0.8897258, 1, 1, 1, 1, 1,
0.570633, 0.197674, 2.810684, 1, 1, 1, 1, 1,
0.5744587, 0.3008066, 0.8359354, 1, 1, 1, 1, 1,
0.5843256, -0.3705911, 2.176819, 1, 1, 1, 1, 1,
0.5898432, -0.9465435, 1.949232, 1, 1, 1, 1, 1,
0.5926493, -0.2423472, 2.524752, 0, 0, 1, 1, 1,
0.6024466, -1.544053, 2.117023, 1, 0, 0, 1, 1,
0.623049, 1.006224, 1.248996, 1, 0, 0, 1, 1,
0.6230927, -0.12917, 2.451949, 1, 0, 0, 1, 1,
0.6346824, -0.772797, 2.165266, 1, 0, 0, 1, 1,
0.6354989, 1.24209, -1.322316, 1, 0, 0, 1, 1,
0.6358828, 0.2373198, 0.05902695, 0, 0, 0, 1, 1,
0.6490089, 0.5464438, 1.583416, 0, 0, 0, 1, 1,
0.649238, -0.2550698, 2.000842, 0, 0, 0, 1, 1,
0.65655, -1.470657, 3.562695, 0, 0, 0, 1, 1,
0.660078, -0.9345891, 1.264194, 0, 0, 0, 1, 1,
0.6609308, 1.964446, -1.155329, 0, 0, 0, 1, 1,
0.6661264, -1.529101, 3.031546, 0, 0, 0, 1, 1,
0.670711, -0.09469473, 2.792063, 1, 1, 1, 1, 1,
0.6726931, -1.109095, 3.845498, 1, 1, 1, 1, 1,
0.672812, 0.9120789, 1.439521, 1, 1, 1, 1, 1,
0.6777, -0.4867238, 1.338084, 1, 1, 1, 1, 1,
0.6861567, 0.3806815, 1.365164, 1, 1, 1, 1, 1,
0.6924886, -0.2344242, 2.15629, 1, 1, 1, 1, 1,
0.6986966, 0.2713664, 1.559276, 1, 1, 1, 1, 1,
0.7118841, 1.057399, 0.2639429, 1, 1, 1, 1, 1,
0.7142263, 0.5355951, 0.8400056, 1, 1, 1, 1, 1,
0.7165424, -0.8741785, 2.301207, 1, 1, 1, 1, 1,
0.7174864, -2.67292, 2.365003, 1, 1, 1, 1, 1,
0.7216056, -0.3403974, 2.793029, 1, 1, 1, 1, 1,
0.7235095, 0.1291177, 1.827472, 1, 1, 1, 1, 1,
0.7250203, 0.1577756, 0.9047702, 1, 1, 1, 1, 1,
0.7281598, 0.3244426, 0.5077149, 1, 1, 1, 1, 1,
0.7336176, 0.4193196, 0.6487238, 0, 0, 1, 1, 1,
0.7513587, 1.676762, 1.212249, 1, 0, 0, 1, 1,
0.7548741, 1.945776, 0.3353404, 1, 0, 0, 1, 1,
0.7552788, 1.858002, -0.496721, 1, 0, 0, 1, 1,
0.7601697, -1.14553, 1.455662, 1, 0, 0, 1, 1,
0.761366, 0.3897713, 0.8280281, 1, 0, 0, 1, 1,
0.7634389, 1.729845, -0.1150353, 0, 0, 0, 1, 1,
0.7656468, -1.292035, 2.4226, 0, 0, 0, 1, 1,
0.7691095, 0.5199158, 3.137099, 0, 0, 0, 1, 1,
0.7732154, 0.4359876, 1.60284, 0, 0, 0, 1, 1,
0.7780539, -0.06644487, 2.45805, 0, 0, 0, 1, 1,
0.7793679, -2.165318, 3.129871, 0, 0, 0, 1, 1,
0.7801945, 1.57223, 1.382659, 0, 0, 0, 1, 1,
0.7806152, -0.2788513, 3.375338, 1, 1, 1, 1, 1,
0.7829955, -0.1162964, 0.3823659, 1, 1, 1, 1, 1,
0.7900951, -0.07704488, 2.63881, 1, 1, 1, 1, 1,
0.7911173, 0.5643621, 1.790512, 1, 1, 1, 1, 1,
0.805195, -0.4252511, 1.108516, 1, 1, 1, 1, 1,
0.8103992, -1.559009, 0.6214393, 1, 1, 1, 1, 1,
0.8105283, 0.9435166, 0.5292597, 1, 1, 1, 1, 1,
0.8130034, 0.0685975, 2.121745, 1, 1, 1, 1, 1,
0.8151172, 0.8213033, 2.063989, 1, 1, 1, 1, 1,
0.8156142, -0.370093, 0.9709536, 1, 1, 1, 1, 1,
0.8219219, 0.3094022, 1.358416, 1, 1, 1, 1, 1,
0.8257166, -0.6109968, 3.170141, 1, 1, 1, 1, 1,
0.8270198, 0.8237122, 1.885437, 1, 1, 1, 1, 1,
0.8362313, 0.7746866, 1.47314, 1, 1, 1, 1, 1,
0.8387612, -0.1611321, 4.183267, 1, 1, 1, 1, 1,
0.8425979, -0.5833856, 2.898415, 0, 0, 1, 1, 1,
0.8449898, -2.055123, 1.618659, 1, 0, 0, 1, 1,
0.8479798, 1.021987, 0.7580518, 1, 0, 0, 1, 1,
0.8495719, -1.642586, 1.91973, 1, 0, 0, 1, 1,
0.8518906, -2.325681, 4.015914, 1, 0, 0, 1, 1,
0.8530369, -0.5646009, 1.455177, 1, 0, 0, 1, 1,
0.8552707, 0.7243609, -0.2486317, 0, 0, 0, 1, 1,
0.8594244, 1.711821, 2.184311, 0, 0, 0, 1, 1,
0.8698929, -1.062859, 2.53773, 0, 0, 0, 1, 1,
0.871794, 0.7217103, 1.609684, 0, 0, 0, 1, 1,
0.8821182, -0.3299365, 3.094794, 0, 0, 0, 1, 1,
0.8865504, 0.2572684, 1.009453, 0, 0, 0, 1, 1,
0.8900689, -0.3265823, 1.393556, 0, 0, 0, 1, 1,
0.8939698, -3.25643, 3.749883, 1, 1, 1, 1, 1,
0.8948982, 1.038219, -0.2132674, 1, 1, 1, 1, 1,
0.8958186, 1.393527, 1.708719, 1, 1, 1, 1, 1,
0.898443, -0.5890551, 1.946957, 1, 1, 1, 1, 1,
0.901298, 0.6503236, 0.5027822, 1, 1, 1, 1, 1,
0.9062179, -0.3667501, 1.1936, 1, 1, 1, 1, 1,
0.9062766, 0.9740989, 0.5258639, 1, 1, 1, 1, 1,
0.9063517, -0.5019937, 3.221713, 1, 1, 1, 1, 1,
0.9065253, 0.2725468, 0.8459547, 1, 1, 1, 1, 1,
0.9183357, 0.7344161, 1.139275, 1, 1, 1, 1, 1,
0.9195659, -1.089373, 1.72223, 1, 1, 1, 1, 1,
0.9212011, -0.188252, 1.434229, 1, 1, 1, 1, 1,
0.9320354, 2.717984, 1.72187, 1, 1, 1, 1, 1,
0.9390476, -0.5661713, 2.309419, 1, 1, 1, 1, 1,
0.9407737, -1.018369, 1.370689, 1, 1, 1, 1, 1,
0.9463102, -0.3430298, 3.434962, 0, 0, 1, 1, 1,
0.9467722, -2.006896, 2.22953, 1, 0, 0, 1, 1,
0.9529361, 1.210335, -0.2672869, 1, 0, 0, 1, 1,
0.9586872, -0.202718, 0.9607872, 1, 0, 0, 1, 1,
0.9590321, -0.05714799, -0.1659387, 1, 0, 0, 1, 1,
0.9603134, -0.7593535, 2.280099, 1, 0, 0, 1, 1,
0.9722916, -0.212792, 1.217483, 0, 0, 0, 1, 1,
0.987743, -0.05370773, 1.561661, 0, 0, 0, 1, 1,
0.9886294, 0.9165137, 0.8390422, 0, 0, 0, 1, 1,
0.991349, 1.46765, 0.4943614, 0, 0, 0, 1, 1,
0.9938839, 0.145929, 1.252016, 0, 0, 0, 1, 1,
0.9978095, -0.3996981, 1.211503, 0, 0, 0, 1, 1,
0.9984015, 1.031192, 0.6860452, 0, 0, 0, 1, 1,
0.9999371, 1.28356, 0.6014919, 1, 1, 1, 1, 1,
1.002032, -0.4496461, 1.9953, 1, 1, 1, 1, 1,
1.003766, 0.7077203, 2.323207, 1, 1, 1, 1, 1,
1.013583, -1.589719, 0.6848197, 1, 1, 1, 1, 1,
1.016531, 0.988781, 2.096021, 1, 1, 1, 1, 1,
1.023174, 1.092813, 2.322151, 1, 1, 1, 1, 1,
1.024682, 0.5565839, 0.4583251, 1, 1, 1, 1, 1,
1.031533, -1.243049, 0.5941297, 1, 1, 1, 1, 1,
1.035371, 0.2248327, 1.935759, 1, 1, 1, 1, 1,
1.037612, 1.568878, 0.2378919, 1, 1, 1, 1, 1,
1.041044, 0.2837638, 1.111055, 1, 1, 1, 1, 1,
1.04295, 0.6582513, 0.5405726, 1, 1, 1, 1, 1,
1.042957, -1.556581, 1.568692, 1, 1, 1, 1, 1,
1.04345, -1.056246, 1.238775, 1, 1, 1, 1, 1,
1.046183, -1.4985, 2.576852, 1, 1, 1, 1, 1,
1.049211, -0.3086003, 1.341475, 0, 0, 1, 1, 1,
1.05808, -1.294746, 1.45943, 1, 0, 0, 1, 1,
1.059282, -0.4211283, 1.783514, 1, 0, 0, 1, 1,
1.066374, 0.421425, 1.825744, 1, 0, 0, 1, 1,
1.076707, -0.1911406, 2.062783, 1, 0, 0, 1, 1,
1.084176, 0.8288975, 1.874086, 1, 0, 0, 1, 1,
1.087772, -1.66162, 2.758117, 0, 0, 0, 1, 1,
1.087915, -1.655871, 1.907568, 0, 0, 0, 1, 1,
1.088934, 0.4656114, -0.07526656, 0, 0, 0, 1, 1,
1.090412, 1.066024, 0.5590225, 0, 0, 0, 1, 1,
1.097105, 0.405885, 2.544524, 0, 0, 0, 1, 1,
1.099471, 1.015026, 1.83154, 0, 0, 0, 1, 1,
1.100245, 2.248209, 1.548923, 0, 0, 0, 1, 1,
1.11623, -0.4008012, 2.893418, 1, 1, 1, 1, 1,
1.123163, 1.718557, 0.6271069, 1, 1, 1, 1, 1,
1.128478, 1.605749, 1.424484, 1, 1, 1, 1, 1,
1.128704, -2.347643, 3.731997, 1, 1, 1, 1, 1,
1.133027, 0.4352678, 1.030171, 1, 1, 1, 1, 1,
1.150968, -1.261111, 2.35676, 1, 1, 1, 1, 1,
1.159403, 1.086507, -0.1979254, 1, 1, 1, 1, 1,
1.168775, 0.7598312, 2.413907, 1, 1, 1, 1, 1,
1.180127, 1.202106, 0.1683091, 1, 1, 1, 1, 1,
1.18045, -0.7986623, 3.328364, 1, 1, 1, 1, 1,
1.181668, -0.04611196, 1.753057, 1, 1, 1, 1, 1,
1.188612, 1.012409, -0.07125434, 1, 1, 1, 1, 1,
1.191377, -0.7046636, 2.337065, 1, 1, 1, 1, 1,
1.199205, -1.365466, 3.39751, 1, 1, 1, 1, 1,
1.202831, 0.2070011, 0.4052956, 1, 1, 1, 1, 1,
1.203011, 2.480316, -0.3057058, 0, 0, 1, 1, 1,
1.203708, -0.7458382, 2.34101, 1, 0, 0, 1, 1,
1.209846, 1.585799, 0.3480476, 1, 0, 0, 1, 1,
1.217152, -2.49677, 2.511835, 1, 0, 0, 1, 1,
1.21906, 1.056633, 1.18698, 1, 0, 0, 1, 1,
1.229182, 0.3585507, 0.827014, 1, 0, 0, 1, 1,
1.229196, -0.4440997, 3.471369, 0, 0, 0, 1, 1,
1.235526, -0.2326909, 2.112172, 0, 0, 0, 1, 1,
1.241769, 0.3278966, 0.8786832, 0, 0, 0, 1, 1,
1.256332, -0.3842221, 2.49257, 0, 0, 0, 1, 1,
1.256486, -0.5032563, 1.450932, 0, 0, 0, 1, 1,
1.268639, 1.232232, 0.9885737, 0, 0, 0, 1, 1,
1.273826, 0.6489455, 1.881465, 0, 0, 0, 1, 1,
1.27825, 0.2492246, 0.8516145, 1, 1, 1, 1, 1,
1.281927, -0.8415724, 0.1799797, 1, 1, 1, 1, 1,
1.287372, 0.4179811, 2.179602, 1, 1, 1, 1, 1,
1.292003, 0.5075085, 0.002229709, 1, 1, 1, 1, 1,
1.292357, -0.75585, 2.91102, 1, 1, 1, 1, 1,
1.295771, 0.5076182, 1.642754, 1, 1, 1, 1, 1,
1.297011, 1.906182, -0.3983404, 1, 1, 1, 1, 1,
1.302202, 1.098145, 0.9950894, 1, 1, 1, 1, 1,
1.303909, 0.1779334, 2.312977, 1, 1, 1, 1, 1,
1.310198, -0.08305704, 2.314343, 1, 1, 1, 1, 1,
1.31609, 0.5844497, 0.1023117, 1, 1, 1, 1, 1,
1.323903, 0.3623089, 1.454888, 1, 1, 1, 1, 1,
1.340019, -1.05959, 1.230457, 1, 1, 1, 1, 1,
1.35149, -1.236892, 1.914922, 1, 1, 1, 1, 1,
1.356708, 1.325728, -0.8114532, 1, 1, 1, 1, 1,
1.357122, -0.4802112, 1.254943, 0, 0, 1, 1, 1,
1.361624, -1.357417, 2.138609, 1, 0, 0, 1, 1,
1.366714, -0.6492183, 1.070057, 1, 0, 0, 1, 1,
1.372558, 1.476109, 0.8040997, 1, 0, 0, 1, 1,
1.380576, 1.278639, 1.856712, 1, 0, 0, 1, 1,
1.387397, 1.192833, 0.67659, 1, 0, 0, 1, 1,
1.393787, -0.25127, 2.86253, 0, 0, 0, 1, 1,
1.398632, -1.240323, 2.235315, 0, 0, 0, 1, 1,
1.399221, -0.05727595, 0.2639558, 0, 0, 0, 1, 1,
1.404747, 1.922779, 1.888891, 0, 0, 0, 1, 1,
1.416163, 0.003697021, 0.6243204, 0, 0, 0, 1, 1,
1.432551, -0.9823559, 3.559874, 0, 0, 0, 1, 1,
1.433942, -1.805558, 1.770868, 0, 0, 0, 1, 1,
1.43587, -0.3657987, 2.332943, 1, 1, 1, 1, 1,
1.437078, 0.1470262, 2.399974, 1, 1, 1, 1, 1,
1.437639, 1.650073, 1.786199, 1, 1, 1, 1, 1,
1.440262, 1.20975, 0.4946865, 1, 1, 1, 1, 1,
1.457921, -1.046729, 2.94845, 1, 1, 1, 1, 1,
1.460179, 1.925241, 0.542873, 1, 1, 1, 1, 1,
1.4679, 1.039711, 2.377738, 1, 1, 1, 1, 1,
1.470281, 0.2763207, 0.7807515, 1, 1, 1, 1, 1,
1.472573, 0.002579869, 1.015535, 1, 1, 1, 1, 1,
1.478498, -1.051384, 2.561786, 1, 1, 1, 1, 1,
1.482129, -0.7743154, 2.071684, 1, 1, 1, 1, 1,
1.491038, 1.564977, 0.3053239, 1, 1, 1, 1, 1,
1.493455, -1.168175, 2.913646, 1, 1, 1, 1, 1,
1.497154, 0.513961, 1.708768, 1, 1, 1, 1, 1,
1.5038, 0.5080391, 0.3787095, 1, 1, 1, 1, 1,
1.505543, -0.1375646, 2.814668, 0, 0, 1, 1, 1,
1.518524, -0.9027764, 1.526726, 1, 0, 0, 1, 1,
1.521389, 0.03687342, 1.042553, 1, 0, 0, 1, 1,
1.542458, 0.5488235, 0.3268201, 1, 0, 0, 1, 1,
1.568313, 1.223182, 0.9207251, 1, 0, 0, 1, 1,
1.568791, -0.4735615, -1.607375, 1, 0, 0, 1, 1,
1.586468, 1.431739, 1.507267, 0, 0, 0, 1, 1,
1.603407, -1.243037, 2.689343, 0, 0, 0, 1, 1,
1.603535, -0.58232, 2.83052, 0, 0, 0, 1, 1,
1.60816, 0.04349179, 1.384987, 0, 0, 0, 1, 1,
1.620588, -0.07452173, 0.5612312, 0, 0, 0, 1, 1,
1.624041, -0.6337619, 1.73851, 0, 0, 0, 1, 1,
1.650084, 0.1223766, 0.3813597, 0, 0, 0, 1, 1,
1.653202, -0.8449684, 2.598953, 1, 1, 1, 1, 1,
1.656049, 1.578486, 0.7098916, 1, 1, 1, 1, 1,
1.66854, -1.405427, 0.7859448, 1, 1, 1, 1, 1,
1.684366, 1.986389, 2.2289, 1, 1, 1, 1, 1,
1.714444, 0.6180087, 1.59684, 1, 1, 1, 1, 1,
1.727499, -0.3005843, 1.955651, 1, 1, 1, 1, 1,
1.74516, 0.4002588, 0.7665676, 1, 1, 1, 1, 1,
1.749961, -0.7994493, 1.461019, 1, 1, 1, 1, 1,
1.757001, 0.4892147, 0.6118956, 1, 1, 1, 1, 1,
1.760906, 0.8626048, 2.023953, 1, 1, 1, 1, 1,
1.799139, 0.8552765, 0.5138022, 1, 1, 1, 1, 1,
1.799913, -1.371331, 1.583075, 1, 1, 1, 1, 1,
1.799968, -3.241302, 2.01691, 1, 1, 1, 1, 1,
1.80377, 0.3392286, 1.856483, 1, 1, 1, 1, 1,
1.804376, -0.599769, 1.609957, 1, 1, 1, 1, 1,
1.812244, -0.4974836, 1.683024, 0, 0, 1, 1, 1,
1.821488, -0.5440639, 1.132105, 1, 0, 0, 1, 1,
1.823068, -0.2729915, -0.0775364, 1, 0, 0, 1, 1,
1.840557, 0.3258095, 1.337279, 1, 0, 0, 1, 1,
1.858006, -0.09902265, 0.2849696, 1, 0, 0, 1, 1,
1.870471, -1.365919, 3.288432, 1, 0, 0, 1, 1,
1.876598, 1.603561, 2.407341, 0, 0, 0, 1, 1,
1.923397, 1.303377, -1.017063, 0, 0, 0, 1, 1,
1.947526, 0.3566419, 0.03191794, 0, 0, 0, 1, 1,
1.947772, 1.917429, 0.4593305, 0, 0, 0, 1, 1,
1.949628, 1.305132, 0.3583249, 0, 0, 0, 1, 1,
1.96694, 0.6443188, 0.8243251, 0, 0, 0, 1, 1,
1.989376, -0.7272106, 1.598613, 0, 0, 0, 1, 1,
2.005633, -0.7794544, 2.431908, 1, 1, 1, 1, 1,
2.024002, -2.786535, 1.353217, 1, 1, 1, 1, 1,
2.024456, -0.04067174, 3.043465, 1, 1, 1, 1, 1,
2.025512, -0.1302964, 2.482164, 1, 1, 1, 1, 1,
2.02755, 1.300103, -0.9746402, 1, 1, 1, 1, 1,
2.035459, 1.305522, 1.715053, 1, 1, 1, 1, 1,
2.086997, 0.3213081, 1.31935, 1, 1, 1, 1, 1,
2.096755, -0.6141052, 2.706753, 1, 1, 1, 1, 1,
2.108752, 0.5439571, 2.418667, 1, 1, 1, 1, 1,
2.125273, -0.4420763, 1.004218, 1, 1, 1, 1, 1,
2.168227, 0.01118372, 2.113636, 1, 1, 1, 1, 1,
2.198734, -0.3450125, 0.9298926, 1, 1, 1, 1, 1,
2.224176, -0.8775515, 2.323782, 1, 1, 1, 1, 1,
2.268941, -0.4053616, 1.166026, 1, 1, 1, 1, 1,
2.292765, -1.388445, 2.583748, 1, 1, 1, 1, 1,
2.307091, 1.837146, -0.7269598, 0, 0, 1, 1, 1,
2.310301, -0.3646135, 2.68814, 1, 0, 0, 1, 1,
2.360115, 0.5321214, 2.371685, 1, 0, 0, 1, 1,
2.360883, 1.045464, 0.7468112, 1, 0, 0, 1, 1,
2.444942, -0.5042813, 2.757224, 1, 0, 0, 1, 1,
2.520071, -1.304048, 3.222671, 1, 0, 0, 1, 1,
2.528764, -1.103269, 0.5653429, 0, 0, 0, 1, 1,
2.539917, 1.846631, 0.657242, 0, 0, 0, 1, 1,
2.54164, -0.3821115, 0.2157957, 0, 0, 0, 1, 1,
2.563191, 1.971174, 0.7899461, 0, 0, 0, 1, 1,
2.577547, 0.4415936, 2.466454, 0, 0, 0, 1, 1,
2.586524, -1.332281, 1.976049, 0, 0, 0, 1, 1,
2.636314, -1.744927, 2.546576, 0, 0, 0, 1, 1,
2.715621, -1.328771, 3.004185, 1, 1, 1, 1, 1,
2.720135, 0.136117, 2.100162, 1, 1, 1, 1, 1,
2.830369, -1.264114, 0.058835, 1, 1, 1, 1, 1,
2.85526, -0.2913178, 2.837116, 1, 1, 1, 1, 1,
2.906853, -1.249018, 0.5814713, 1, 1, 1, 1, 1,
2.933264, 0.5884039, 4.215971, 1, 1, 1, 1, 1,
3.251904, -0.3879085, 0.5752051, 1, 1, 1, 1, 1
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
var radius = 10.05663;
var distance = 35.32347;
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
mvMatrix.translate( -0.1629966, 0.196635, 0.09811831 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.32347);
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
