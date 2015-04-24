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
-3.567838, 1.378275, -1.269892, 1, 0, 0, 1,
-3.143536, 1.477198, -0.309705, 1, 0.007843138, 0, 1,
-2.914561, 1.220311, -1.196766, 1, 0.01176471, 0, 1,
-2.70907, 0.03107795, -0.3336543, 1, 0.01960784, 0, 1,
-2.5955, -2.222939, -2.173265, 1, 0.02352941, 0, 1,
-2.382969, -0.8481267, -1.570668, 1, 0.03137255, 0, 1,
-2.342449, -0.2395395, -0.9648684, 1, 0.03529412, 0, 1,
-2.29639, -1.276771, -1.436272, 1, 0.04313726, 0, 1,
-2.289961, 0.731472, -1.228542, 1, 0.04705882, 0, 1,
-2.242583, -1.835912, -2.318468, 1, 0.05490196, 0, 1,
-2.167605, -0.4102011, -3.442016, 1, 0.05882353, 0, 1,
-2.118493, -1.395724, -2.25071, 1, 0.06666667, 0, 1,
-2.100928, 1.494932, -2.90566, 1, 0.07058824, 0, 1,
-2.091576, -1.373981, 0.08442269, 1, 0.07843138, 0, 1,
-1.999923, -1.963935, -1.540627, 1, 0.08235294, 0, 1,
-1.997295, 0.4936345, -0.6746194, 1, 0.09019608, 0, 1,
-1.995648, 1.26716, -0.9196771, 1, 0.09411765, 0, 1,
-1.972875, -0.01753115, -1.274808, 1, 0.1019608, 0, 1,
-1.971656, -1.309836, -1.755381, 1, 0.1098039, 0, 1,
-1.920553, 1.42237, -2.354768, 1, 0.1137255, 0, 1,
-1.917405, -0.06137493, -0.2714974, 1, 0.1215686, 0, 1,
-1.894698, -1.288337, -2.212361, 1, 0.1254902, 0, 1,
-1.884932, 0.1103206, -2.412078, 1, 0.1333333, 0, 1,
-1.877154, 1.885415, -1.383796, 1, 0.1372549, 0, 1,
-1.863899, -1.316081, -1.659286, 1, 0.145098, 0, 1,
-1.849617, 0.4039534, -0.3554142, 1, 0.1490196, 0, 1,
-1.831124, -0.4011758, -1.508079, 1, 0.1568628, 0, 1,
-1.82827, -0.7787448, -2.323691, 1, 0.1607843, 0, 1,
-1.818137, 1.924342, 0.2207641, 1, 0.1686275, 0, 1,
-1.814208, -0.547787, -2.65346, 1, 0.172549, 0, 1,
-1.801535, -1.870859, -3.449613, 1, 0.1803922, 0, 1,
-1.78993, -0.3343616, -1.613893, 1, 0.1843137, 0, 1,
-1.76373, 0.4975781, -2.057721, 1, 0.1921569, 0, 1,
-1.738075, -2.321288, -0.383302, 1, 0.1960784, 0, 1,
-1.712618, 0.9079271, -0.4004783, 1, 0.2039216, 0, 1,
-1.703605, 0.4117848, -2.651495, 1, 0.2117647, 0, 1,
-1.678961, -0.1220526, -0.7082385, 1, 0.2156863, 0, 1,
-1.669228, -0.9054471, -2.527781, 1, 0.2235294, 0, 1,
-1.662533, -0.8615896, -0.1211775, 1, 0.227451, 0, 1,
-1.661536, 0.4685495, -2.826403, 1, 0.2352941, 0, 1,
-1.657063, -0.7592362, -2.752404, 1, 0.2392157, 0, 1,
-1.651196, -0.8147792, -2.069519, 1, 0.2470588, 0, 1,
-1.642451, 1.506441, 0.5369156, 1, 0.2509804, 0, 1,
-1.624534, -0.6186809, -1.593247, 1, 0.2588235, 0, 1,
-1.618804, 1.69255, -2.058421, 1, 0.2627451, 0, 1,
-1.604485, 1.728234, -1.716516, 1, 0.2705882, 0, 1,
-1.594886, -0.485157, -1.091568, 1, 0.2745098, 0, 1,
-1.576187, -0.07796907, -0.9931181, 1, 0.282353, 0, 1,
-1.55455, -0.5459802, -4.108642, 1, 0.2862745, 0, 1,
-1.547481, -1.457088, -3.042485, 1, 0.2941177, 0, 1,
-1.542496, 0.8443183, -1.444723, 1, 0.3019608, 0, 1,
-1.534577, 0.6545348, -0.840164, 1, 0.3058824, 0, 1,
-1.530021, -0.2330769, -2.589582, 1, 0.3137255, 0, 1,
-1.529347, 0.9199255, 0.4182648, 1, 0.3176471, 0, 1,
-1.528941, 1.248327, -1.108694, 1, 0.3254902, 0, 1,
-1.524552, 0.4441619, -1.814155, 1, 0.3294118, 0, 1,
-1.522941, -1.845089, -1.74491, 1, 0.3372549, 0, 1,
-1.514739, -0.6683655, -1.203004, 1, 0.3411765, 0, 1,
-1.491529, -0.6288291, -2.397072, 1, 0.3490196, 0, 1,
-1.484579, -0.3161996, -1.949646, 1, 0.3529412, 0, 1,
-1.470838, -1.066215, -0.7386367, 1, 0.3607843, 0, 1,
-1.44005, -0.4147943, -2.443871, 1, 0.3647059, 0, 1,
-1.41312, -1.776904, -1.351779, 1, 0.372549, 0, 1,
-1.409457, 0.1217919, -2.52126, 1, 0.3764706, 0, 1,
-1.400509, -0.07362435, -0.3763011, 1, 0.3843137, 0, 1,
-1.382347, -1.059122, -0.3665725, 1, 0.3882353, 0, 1,
-1.376979, 0.3429427, -0.3699728, 1, 0.3960784, 0, 1,
-1.376592, 0.7829025, -0.5304567, 1, 0.4039216, 0, 1,
-1.373926, 0.196287, -1.275007, 1, 0.4078431, 0, 1,
-1.365078, -0.4136134, -2.309079, 1, 0.4156863, 0, 1,
-1.363571, -0.1526948, -1.615129, 1, 0.4196078, 0, 1,
-1.360929, 0.3827627, -1.653807, 1, 0.427451, 0, 1,
-1.355248, -0.9944034, -2.75708, 1, 0.4313726, 0, 1,
-1.353372, 0.04159865, -1.172045, 1, 0.4392157, 0, 1,
-1.352625, 1.440488, -1.622912, 1, 0.4431373, 0, 1,
-1.334701, -0.06864535, -2.171402, 1, 0.4509804, 0, 1,
-1.333673, 0.1848288, -3.048514, 1, 0.454902, 0, 1,
-1.329428, -0.16577, -2.093474, 1, 0.4627451, 0, 1,
-1.323127, -1.30717, -0.889396, 1, 0.4666667, 0, 1,
-1.318463, -0.2072186, -1.177738, 1, 0.4745098, 0, 1,
-1.312112, 0.4800467, -2.011186, 1, 0.4784314, 0, 1,
-1.301885, -0.5765982, -0.609969, 1, 0.4862745, 0, 1,
-1.293709, -0.9357104, -2.611596, 1, 0.4901961, 0, 1,
-1.284083, 1.762329, 0.8966374, 1, 0.4980392, 0, 1,
-1.268035, -0.545511, -1.324939, 1, 0.5058824, 0, 1,
-1.265649, -0.8800737, -2.333173, 1, 0.509804, 0, 1,
-1.247318, 1.819175, 0.5076923, 1, 0.5176471, 0, 1,
-1.241131, -0.895487, -3.07097, 1, 0.5215687, 0, 1,
-1.240308, -1.155617, -3.02117, 1, 0.5294118, 0, 1,
-1.234925, 0.08290605, -2.901808, 1, 0.5333334, 0, 1,
-1.230938, 1.163098, -1.753847, 1, 0.5411765, 0, 1,
-1.227021, 0.3290732, -1.69826, 1, 0.5450981, 0, 1,
-1.224553, 0.2051688, -1.577032, 1, 0.5529412, 0, 1,
-1.218948, 1.652902, 0.2715341, 1, 0.5568628, 0, 1,
-1.216209, -0.6157717, -1.7563, 1, 0.5647059, 0, 1,
-1.214228, -2.535582, -0.8740431, 1, 0.5686275, 0, 1,
-1.213142, -1.23963, -3.104523, 1, 0.5764706, 0, 1,
-1.212357, 1.737307, -0.7261518, 1, 0.5803922, 0, 1,
-1.212232, 0.5630029, -2.05508, 1, 0.5882353, 0, 1,
-1.21094, -0.05236939, -3.352568, 1, 0.5921569, 0, 1,
-1.206146, -1.297503, -3.765674, 1, 0.6, 0, 1,
-1.189704, -1.791073, -3.347532, 1, 0.6078432, 0, 1,
-1.188917, 0.7015427, 0.2399225, 1, 0.6117647, 0, 1,
-1.180562, 0.757241, -1.09394, 1, 0.6196079, 0, 1,
-1.152325, 0.1835439, -0.8429999, 1, 0.6235294, 0, 1,
-1.143024, -2.34092, -4.104417, 1, 0.6313726, 0, 1,
-1.142699, -1.964968, -1.261197, 1, 0.6352941, 0, 1,
-1.138193, 0.4927503, -0.6002207, 1, 0.6431373, 0, 1,
-1.136998, 1.523562, -1.035187, 1, 0.6470588, 0, 1,
-1.124488, 0.3752274, -1.860154, 1, 0.654902, 0, 1,
-1.116886, -0.6957289, -2.067673, 1, 0.6588235, 0, 1,
-1.116843, -0.1512709, -1.304212, 1, 0.6666667, 0, 1,
-1.111178, 0.3760011, 1.448637, 1, 0.6705883, 0, 1,
-1.104725, -0.5903661, -1.851406, 1, 0.6784314, 0, 1,
-1.092779, 1.798435, -2.494616, 1, 0.682353, 0, 1,
-1.091193, -0.7009212, -2.175404, 1, 0.6901961, 0, 1,
-1.077672, 0.07851031, 0.01975038, 1, 0.6941177, 0, 1,
-1.071058, 1.036995, -0.804661, 1, 0.7019608, 0, 1,
-1.066105, -1.14539, -2.562115, 1, 0.7098039, 0, 1,
-1.065361, 1.505803, 0.04568774, 1, 0.7137255, 0, 1,
-1.062525, 2.733389, -0.6997834, 1, 0.7215686, 0, 1,
-1.057786, -0.3861313, -3.091968, 1, 0.7254902, 0, 1,
-1.057468, -1.147255, -2.712633, 1, 0.7333333, 0, 1,
-1.054669, 0.3433865, -0.2366204, 1, 0.7372549, 0, 1,
-1.044907, -0.4456969, -2.189117, 1, 0.7450981, 0, 1,
-1.043862, -0.4715566, -3.260055, 1, 0.7490196, 0, 1,
-1.04241, 1.379809, 0.6477309, 1, 0.7568628, 0, 1,
-1.042225, 0.3462169, -1.454583, 1, 0.7607843, 0, 1,
-1.028679, -1.519012, -3.772594, 1, 0.7686275, 0, 1,
-1.026235, -1.692366, -3.342667, 1, 0.772549, 0, 1,
-1.02501, 1.985701, 1.593051, 1, 0.7803922, 0, 1,
-1.016282, -2.332204, -1.77712, 1, 0.7843137, 0, 1,
-1.009507, 0.6827623, -1.258198, 1, 0.7921569, 0, 1,
-1.009189, 0.1087464, -1.620089, 1, 0.7960784, 0, 1,
-1.007827, -1.194292, -4.472538, 1, 0.8039216, 0, 1,
-1.00442, 1.172185, -0.8806448, 1, 0.8117647, 0, 1,
-1.003398, 0.4181707, 0.1898476, 1, 0.8156863, 0, 1,
-0.9996021, -0.754509, -2.449096, 1, 0.8235294, 0, 1,
-0.9976864, 0.549224, -1.068463, 1, 0.827451, 0, 1,
-0.9953058, -0.7730393, -1.365231, 1, 0.8352941, 0, 1,
-0.9906071, 0.4982844, -1.403522, 1, 0.8392157, 0, 1,
-0.9880972, -0.605167, -2.658106, 1, 0.8470588, 0, 1,
-0.9818777, -0.06465383, -1.866416, 1, 0.8509804, 0, 1,
-0.9795244, -1.719801, -2.948365, 1, 0.8588235, 0, 1,
-0.9765401, 0.3547256, -0.9951319, 1, 0.8627451, 0, 1,
-0.9745022, 0.5535905, -0.2425159, 1, 0.8705882, 0, 1,
-0.9669238, 0.3024065, -1.419289, 1, 0.8745098, 0, 1,
-0.9643945, -0.5995343, -2.150352, 1, 0.8823529, 0, 1,
-0.9605644, 0.7542687, -2.220126, 1, 0.8862745, 0, 1,
-0.953223, -0.9880844, -4.065441, 1, 0.8941177, 0, 1,
-0.950468, 0.05303919, -1.929049, 1, 0.8980392, 0, 1,
-0.94855, -0.5635681, -3.794257, 1, 0.9058824, 0, 1,
-0.9474051, -0.1494503, -3.104502, 1, 0.9137255, 0, 1,
-0.9352658, -1.663236, -1.397074, 1, 0.9176471, 0, 1,
-0.9352177, -1.100396, -2.914313, 1, 0.9254902, 0, 1,
-0.9300171, 1.487309, -0.9652127, 1, 0.9294118, 0, 1,
-0.9298226, -1.518835, -1.063972, 1, 0.9372549, 0, 1,
-0.9256017, -0.7504383, -2.999393, 1, 0.9411765, 0, 1,
-0.9254335, -0.8812054, -3.1678, 1, 0.9490196, 0, 1,
-0.9237941, 0.2957565, -0.6098815, 1, 0.9529412, 0, 1,
-0.9231111, 0.2498178, -0.1630324, 1, 0.9607843, 0, 1,
-0.9222778, 1.121794, -0.4842924, 1, 0.9647059, 0, 1,
-0.9210075, 1.369773, -0.03284918, 1, 0.972549, 0, 1,
-0.9169825, -0.5161597, -2.974438, 1, 0.9764706, 0, 1,
-0.905105, 0.6282395, -0.7264394, 1, 0.9843137, 0, 1,
-0.9047, -1.174192, -3.391376, 1, 0.9882353, 0, 1,
-0.8969301, 1.051827, 0.7665235, 1, 0.9960784, 0, 1,
-0.8958678, -0.2471386, -1.069561, 0.9960784, 1, 0, 1,
-0.885781, 0.1898964, 0.2826218, 0.9921569, 1, 0, 1,
-0.8846087, -1.49633, -1.727868, 0.9843137, 1, 0, 1,
-0.8802525, -0.9873917, -1.623456, 0.9803922, 1, 0, 1,
-0.8766139, -1.396314, -1.430921, 0.972549, 1, 0, 1,
-0.8762822, -0.1170427, -1.185425, 0.9686275, 1, 0, 1,
-0.8696344, -1.19048, -2.662436, 0.9607843, 1, 0, 1,
-0.8660058, 0.04761675, -0.1435595, 0.9568627, 1, 0, 1,
-0.8654521, 0.97445, -0.2215399, 0.9490196, 1, 0, 1,
-0.8640293, -1.046041, -4.038865, 0.945098, 1, 0, 1,
-0.8601776, 2.10723, -1.184336, 0.9372549, 1, 0, 1,
-0.8562284, 0.4196186, -0.6531791, 0.9333333, 1, 0, 1,
-0.8524244, 2.77595, -1.025434, 0.9254902, 1, 0, 1,
-0.8490868, 0.7324524, -0.9510928, 0.9215686, 1, 0, 1,
-0.8453154, 0.1001955, -1.506693, 0.9137255, 1, 0, 1,
-0.832747, 0.02092763, -0.7496136, 0.9098039, 1, 0, 1,
-0.831638, 1.49041, -0.3988488, 0.9019608, 1, 0, 1,
-0.8277947, -1.210788, -3.205126, 0.8941177, 1, 0, 1,
-0.8272341, -0.6399572, -1.870016, 0.8901961, 1, 0, 1,
-0.8239703, 1.827484, -0.03283219, 0.8823529, 1, 0, 1,
-0.8216846, 0.7544381, -0.94039, 0.8784314, 1, 0, 1,
-0.8211014, 1.02786, 1.01193, 0.8705882, 1, 0, 1,
-0.8166916, 0.5439025, -2.189249, 0.8666667, 1, 0, 1,
-0.8148987, 0.8891842, -0.8793579, 0.8588235, 1, 0, 1,
-0.8107228, -1.902863, -1.873791, 0.854902, 1, 0, 1,
-0.8081055, -2.489789, -2.612496, 0.8470588, 1, 0, 1,
-0.8075929, -1.094938, -3.854742, 0.8431373, 1, 0, 1,
-0.8070852, 0.3711513, -1.802839, 0.8352941, 1, 0, 1,
-0.7993494, 1.001565, -1.471351, 0.8313726, 1, 0, 1,
-0.7888081, -1.075366, -2.707465, 0.8235294, 1, 0, 1,
-0.7881674, 0.2224808, -2.642437, 0.8196079, 1, 0, 1,
-0.7876873, 1.081318, 0.2119234, 0.8117647, 1, 0, 1,
-0.7766335, 0.7961861, -0.4341655, 0.8078431, 1, 0, 1,
-0.7751061, 0.3419448, -0.6750755, 0.8, 1, 0, 1,
-0.77268, 0.4629731, -1.661179, 0.7921569, 1, 0, 1,
-0.7701496, -1.3986, -1.902478, 0.7882353, 1, 0, 1,
-0.7699265, -0.6762213, -2.429287, 0.7803922, 1, 0, 1,
-0.7661036, 0.01262552, -2.417824, 0.7764706, 1, 0, 1,
-0.7640721, 0.4040519, -1.382377, 0.7686275, 1, 0, 1,
-0.7639915, -0.2721758, -3.333408, 0.7647059, 1, 0, 1,
-0.7611304, 1.438167, -0.6004396, 0.7568628, 1, 0, 1,
-0.7550184, 0.1075278, -0.998028, 0.7529412, 1, 0, 1,
-0.749247, 0.8847725, -2.401869, 0.7450981, 1, 0, 1,
-0.7439036, -0.4698547, -2.168947, 0.7411765, 1, 0, 1,
-0.7400749, 1.12362, -0.4092558, 0.7333333, 1, 0, 1,
-0.7307154, -0.3203508, -3.395099, 0.7294118, 1, 0, 1,
-0.7285487, -1.178769, -2.796147, 0.7215686, 1, 0, 1,
-0.7277369, 1.110554, -1.665953, 0.7176471, 1, 0, 1,
-0.7258574, -1.782022, -2.645507, 0.7098039, 1, 0, 1,
-0.7232075, -0.3771094, -3.082252, 0.7058824, 1, 0, 1,
-0.7222801, 0.5271701, -0.7754213, 0.6980392, 1, 0, 1,
-0.7198819, 0.004903827, -1.510547, 0.6901961, 1, 0, 1,
-0.7198728, -0.1937165, -3.208386, 0.6862745, 1, 0, 1,
-0.7126487, 0.4660905, -1.102562, 0.6784314, 1, 0, 1,
-0.7118304, -0.7379719, -1.33106, 0.6745098, 1, 0, 1,
-0.7114884, -0.4753435, -1.36841, 0.6666667, 1, 0, 1,
-0.7076452, 0.02896701, -2.64167, 0.6627451, 1, 0, 1,
-0.7007149, -0.8249494, -4.880084, 0.654902, 1, 0, 1,
-0.7001017, -0.3730092, -3.612289, 0.6509804, 1, 0, 1,
-0.6947445, -1.194606, -5.674198, 0.6431373, 1, 0, 1,
-0.6931275, 0.5027308, -0.45506, 0.6392157, 1, 0, 1,
-0.6920958, 0.5170296, -3.361224, 0.6313726, 1, 0, 1,
-0.6915253, 0.8008087, -2.051372, 0.627451, 1, 0, 1,
-0.6883966, 0.0455837, -1.683544, 0.6196079, 1, 0, 1,
-0.6801474, -0.8127146, -0.8577477, 0.6156863, 1, 0, 1,
-0.6797888, 0.01283672, -2.100467, 0.6078432, 1, 0, 1,
-0.6788045, 0.282947, -1.225545, 0.6039216, 1, 0, 1,
-0.677182, 1.65469, 1.205815, 0.5960785, 1, 0, 1,
-0.6769292, -0.1233484, -3.073602, 0.5882353, 1, 0, 1,
-0.6746987, -2.347465, -1.186249, 0.5843138, 1, 0, 1,
-0.6710184, 0.3544231, 0.5386554, 0.5764706, 1, 0, 1,
-0.6706815, 1.101452, -1.366172, 0.572549, 1, 0, 1,
-0.6680087, 0.6299272, -1.963141, 0.5647059, 1, 0, 1,
-0.6657821, 0.4658143, -1.510149, 0.5607843, 1, 0, 1,
-0.6651863, -0.6659439, -2.414673, 0.5529412, 1, 0, 1,
-0.6620387, -1.346402, -1.986329, 0.5490196, 1, 0, 1,
-0.6602123, -1.132333, -2.443196, 0.5411765, 1, 0, 1,
-0.655076, 0.224589, -1.472399, 0.5372549, 1, 0, 1,
-0.6547447, 0.5874078, -0.4757188, 0.5294118, 1, 0, 1,
-0.6536822, -0.02397765, 0.4235429, 0.5254902, 1, 0, 1,
-0.6523283, 0.5969863, -0.3368981, 0.5176471, 1, 0, 1,
-0.6510562, -1.312206, -0.3179487, 0.5137255, 1, 0, 1,
-0.6493396, -0.4763208, -2.42267, 0.5058824, 1, 0, 1,
-0.6475961, -0.7945812, -0.1511141, 0.5019608, 1, 0, 1,
-0.6362088, -0.3200104, -1.146166, 0.4941176, 1, 0, 1,
-0.6353065, 0.5752013, -0.5143098, 0.4862745, 1, 0, 1,
-0.635202, -0.6187178, -3.322968, 0.4823529, 1, 0, 1,
-0.6312496, 0.6817104, -2.21225, 0.4745098, 1, 0, 1,
-0.6270166, 0.3242805, -0.7887018, 0.4705882, 1, 0, 1,
-0.623662, 0.9976115, -1.105198, 0.4627451, 1, 0, 1,
-0.6233599, 1.013781, -2.565161, 0.4588235, 1, 0, 1,
-0.6231047, 2.009579, 0.1994921, 0.4509804, 1, 0, 1,
-0.6178865, 0.7654842, -0.249051, 0.4470588, 1, 0, 1,
-0.6158013, 0.3913988, -1.136623, 0.4392157, 1, 0, 1,
-0.6131476, -0.6838817, -1.680301, 0.4352941, 1, 0, 1,
-0.6103143, 1.136529, -2.056506, 0.427451, 1, 0, 1,
-0.6076224, -1.1308, -3.015435, 0.4235294, 1, 0, 1,
-0.6063752, 1.989176, -0.5680415, 0.4156863, 1, 0, 1,
-0.6063227, 0.02160283, -1.780155, 0.4117647, 1, 0, 1,
-0.605446, 0.6533851, 0.5036281, 0.4039216, 1, 0, 1,
-0.6053748, -0.4425947, -2.134823, 0.3960784, 1, 0, 1,
-0.6053336, -0.6515195, -2.507392, 0.3921569, 1, 0, 1,
-0.6029432, 0.829271, -0.4649795, 0.3843137, 1, 0, 1,
-0.6018501, 0.4222041, -0.5785731, 0.3803922, 1, 0, 1,
-0.6006505, 1.367681, -2.215323, 0.372549, 1, 0, 1,
-0.5974615, -0.825663, -2.446236, 0.3686275, 1, 0, 1,
-0.5889204, -0.15104, -0.7921042, 0.3607843, 1, 0, 1,
-0.5862045, 0.1394572, -0.07985742, 0.3568628, 1, 0, 1,
-0.5854035, 0.3912314, -1.458586, 0.3490196, 1, 0, 1,
-0.5824641, -0.5732895, -2.268332, 0.345098, 1, 0, 1,
-0.5812386, 0.3802368, -0.1838151, 0.3372549, 1, 0, 1,
-0.5809281, 0.2323709, -1.935137, 0.3333333, 1, 0, 1,
-0.571369, 0.6867782, -0.6037788, 0.3254902, 1, 0, 1,
-0.5640495, 0.6441928, -0.6603079, 0.3215686, 1, 0, 1,
-0.5639713, -0.7497442, -1.314372, 0.3137255, 1, 0, 1,
-0.5636854, 1.028783, -1.339515, 0.3098039, 1, 0, 1,
-0.5600343, -0.3226802, -0.782522, 0.3019608, 1, 0, 1,
-0.557528, -1.91326, -3.472666, 0.2941177, 1, 0, 1,
-0.5537625, 0.3413804, -1.107668, 0.2901961, 1, 0, 1,
-0.5533379, -0.6790124, -3.696814, 0.282353, 1, 0, 1,
-0.5532798, 0.2269973, -1.322294, 0.2784314, 1, 0, 1,
-0.5523895, 1.645286, 2.584471, 0.2705882, 1, 0, 1,
-0.5428694, 0.3265835, -1.792589, 0.2666667, 1, 0, 1,
-0.5401491, 0.713973, -0.02987392, 0.2588235, 1, 0, 1,
-0.5361215, -1.023233, -2.886383, 0.254902, 1, 0, 1,
-0.535278, -1.284323, -3.605362, 0.2470588, 1, 0, 1,
-0.534253, -2.088627, -3.023072, 0.2431373, 1, 0, 1,
-0.533827, -1.822846, -0.3301941, 0.2352941, 1, 0, 1,
-0.5290548, -0.2292138, -1.896945, 0.2313726, 1, 0, 1,
-0.5275735, -0.225196, -1.45734, 0.2235294, 1, 0, 1,
-0.525412, 1.306741, -1.47929, 0.2196078, 1, 0, 1,
-0.5246908, 1.125977, 0.3382933, 0.2117647, 1, 0, 1,
-0.5228049, -0.03965817, -1.587399, 0.2078431, 1, 0, 1,
-0.5179, 1.021666, -1.158145, 0.2, 1, 0, 1,
-0.5173466, -0.09025908, -1.191078, 0.1921569, 1, 0, 1,
-0.5146605, 0.3019052, -0.856279, 0.1882353, 1, 0, 1,
-0.5097488, 0.3467097, -3.064476, 0.1803922, 1, 0, 1,
-0.5035918, -1.277219, -4.778444, 0.1764706, 1, 0, 1,
-0.5024823, 0.8816661, -0.7604558, 0.1686275, 1, 0, 1,
-0.5024422, 1.276415, -0.1230608, 0.1647059, 1, 0, 1,
-0.5017542, 0.2975188, -1.265198, 0.1568628, 1, 0, 1,
-0.5008549, 1.630272, -0.01062305, 0.1529412, 1, 0, 1,
-0.5001326, 0.7871739, 0.9621755, 0.145098, 1, 0, 1,
-0.4997995, 0.9484038, -2.858133, 0.1411765, 1, 0, 1,
-0.4994954, 0.5477448, -0.9611734, 0.1333333, 1, 0, 1,
-0.4994165, -1.304081, -1.25463, 0.1294118, 1, 0, 1,
-0.4981367, -1.502162, -3.358521, 0.1215686, 1, 0, 1,
-0.4968249, 1.652001, -1.583201, 0.1176471, 1, 0, 1,
-0.4957927, -0.1572015, -1.919399, 0.1098039, 1, 0, 1,
-0.4934167, 1.285597, -0.2134535, 0.1058824, 1, 0, 1,
-0.4927141, -1.32068, -1.872699, 0.09803922, 1, 0, 1,
-0.4919367, 0.6892506, 1.134369, 0.09019608, 1, 0, 1,
-0.4898538, -1.730312, -2.73878, 0.08627451, 1, 0, 1,
-0.4848567, -0.6581265, -3.646148, 0.07843138, 1, 0, 1,
-0.4811475, 0.4910378, -0.4078641, 0.07450981, 1, 0, 1,
-0.4808482, 1.568638, -0.07959382, 0.06666667, 1, 0, 1,
-0.4805426, 1.855189, 0.04793808, 0.0627451, 1, 0, 1,
-0.4756684, 0.1670071, -1.827335, 0.05490196, 1, 0, 1,
-0.4733495, -0.3967142, -2.164878, 0.05098039, 1, 0, 1,
-0.4665806, 0.8237826, -1.838968, 0.04313726, 1, 0, 1,
-0.466534, 0.2236694, 0.04583714, 0.03921569, 1, 0, 1,
-0.4612492, -2.230735, -3.575067, 0.03137255, 1, 0, 1,
-0.4591237, -0.4153059, -3.011304, 0.02745098, 1, 0, 1,
-0.4522616, -0.2602152, -3.129537, 0.01960784, 1, 0, 1,
-0.4515652, 0.3632204, 0.9529644, 0.01568628, 1, 0, 1,
-0.4507462, -1.558878, -4.374637, 0.007843138, 1, 0, 1,
-0.4497662, 2.0156, 1.711594, 0.003921569, 1, 0, 1,
-0.4448518, 0.04174973, -1.11554, 0, 1, 0.003921569, 1,
-0.4401391, -0.04154531, -2.194463, 0, 1, 0.01176471, 1,
-0.4398825, 1.683273, 0.1213119, 0, 1, 0.01568628, 1,
-0.4365788, -1.645347, -2.696324, 0, 1, 0.02352941, 1,
-0.4364054, -1.282475, -2.098603, 0, 1, 0.02745098, 1,
-0.4351037, 0.4013631, 0.1716743, 0, 1, 0.03529412, 1,
-0.4348706, -0.4428656, -3.521001, 0, 1, 0.03921569, 1,
-0.4343189, 0.6297485, -1.316462, 0, 1, 0.04705882, 1,
-0.4326955, 0.7032419, -1.739771, 0, 1, 0.05098039, 1,
-0.4289066, 0.341168, -1.806497, 0, 1, 0.05882353, 1,
-0.4283697, -0.6963335, -4.109589, 0, 1, 0.0627451, 1,
-0.4234162, 0.3902842, -1.482156, 0, 1, 0.07058824, 1,
-0.4198227, 0.9816507, 0.2605083, 0, 1, 0.07450981, 1,
-0.4185049, 1.982615, 0.4749441, 0, 1, 0.08235294, 1,
-0.4179813, 0.3213691, -1.315678, 0, 1, 0.08627451, 1,
-0.4171415, 1.119149, -1.29008, 0, 1, 0.09411765, 1,
-0.4151138, -0.0245908, -1.299116, 0, 1, 0.1019608, 1,
-0.4144941, -0.1545666, -2.523831, 0, 1, 0.1058824, 1,
-0.4142565, 0.6719592, -0.613802, 0, 1, 0.1137255, 1,
-0.413152, 0.5328766, -0.2864006, 0, 1, 0.1176471, 1,
-0.4113685, 0.8790919, -0.2398119, 0, 1, 0.1254902, 1,
-0.4109667, -0.4073299, -2.883408, 0, 1, 0.1294118, 1,
-0.4061217, 0.6623015, 0.07108841, 0, 1, 0.1372549, 1,
-0.4018002, -0.119383, -3.699944, 0, 1, 0.1411765, 1,
-0.3986537, -1.902731, -4.580021, 0, 1, 0.1490196, 1,
-0.3924874, -1.622898, -1.616596, 0, 1, 0.1529412, 1,
-0.3924662, 0.5282446, -0.4582202, 0, 1, 0.1607843, 1,
-0.3922494, 0.1923752, -0.2734069, 0, 1, 0.1647059, 1,
-0.3910027, -0.4063901, -1.873327, 0, 1, 0.172549, 1,
-0.3899747, 0.5048994, -0.441828, 0, 1, 0.1764706, 1,
-0.3898587, -0.7107923, -2.385381, 0, 1, 0.1843137, 1,
-0.3852183, 1.314706, 0.1194203, 0, 1, 0.1882353, 1,
-0.3848777, -0.9614719, -1.604592, 0, 1, 0.1960784, 1,
-0.3844991, 0.1955311, -1.554072, 0, 1, 0.2039216, 1,
-0.3817624, 0.6902006, -0.5561491, 0, 1, 0.2078431, 1,
-0.3787154, 0.5480735, 0.5841672, 0, 1, 0.2156863, 1,
-0.3667434, -0.6096355, -3.086124, 0, 1, 0.2196078, 1,
-0.3630134, 1.339131, 1.1499, 0, 1, 0.227451, 1,
-0.3619743, 0.2643182, -0.4042453, 0, 1, 0.2313726, 1,
-0.3613828, 0.4085851, -0.1482128, 0, 1, 0.2392157, 1,
-0.359493, 2.252832, 1.334237, 0, 1, 0.2431373, 1,
-0.3585384, -0.6534134, -2.715138, 0, 1, 0.2509804, 1,
-0.3576902, 0.1656169, -0.1765728, 0, 1, 0.254902, 1,
-0.3575701, -1.102419, -2.040801, 0, 1, 0.2627451, 1,
-0.3571808, 1.91949, -1.511249, 0, 1, 0.2666667, 1,
-0.352814, 0.2818381, -1.523895, 0, 1, 0.2745098, 1,
-0.350921, 1.550541, -0.6173401, 0, 1, 0.2784314, 1,
-0.3474832, 0.4689146, -0.1919056, 0, 1, 0.2862745, 1,
-0.3467875, -0.4618032, -2.610824, 0, 1, 0.2901961, 1,
-0.3445183, 0.02028763, -3.502838, 0, 1, 0.2980392, 1,
-0.3434734, -0.6221709, -1.544091, 0, 1, 0.3058824, 1,
-0.3415166, -0.5913807, -4.064278, 0, 1, 0.3098039, 1,
-0.3401453, -0.006940036, -1.279216, 0, 1, 0.3176471, 1,
-0.3399991, 0.4813621, -0.6380804, 0, 1, 0.3215686, 1,
-0.3388483, 2.246704, -1.376482, 0, 1, 0.3294118, 1,
-0.3360448, 0.2825167, 0.9032072, 0, 1, 0.3333333, 1,
-0.3349716, -0.3038222, -1.293768, 0, 1, 0.3411765, 1,
-0.333184, 0.5393842, 1.993705, 0, 1, 0.345098, 1,
-0.3331143, -2.153451, -3.824389, 0, 1, 0.3529412, 1,
-0.3318646, -0.07411511, -2.614625, 0, 1, 0.3568628, 1,
-0.3309489, 2.417543, -1.573314, 0, 1, 0.3647059, 1,
-0.3303098, 0.5186118, 0.2029595, 0, 1, 0.3686275, 1,
-0.3303009, 1.814576, -1.289124, 0, 1, 0.3764706, 1,
-0.3283672, -1.99298, -4.304959, 0, 1, 0.3803922, 1,
-0.3264206, 1.9958, 0.8209045, 0, 1, 0.3882353, 1,
-0.3237888, 0.2314804, 0.3370669, 0, 1, 0.3921569, 1,
-0.3205243, 0.1708004, -1.847123, 0, 1, 0.4, 1,
-0.315557, 0.75687, 1.094176, 0, 1, 0.4078431, 1,
-0.311403, 0.517616, 0.1279039, 0, 1, 0.4117647, 1,
-0.3107858, -0.4141339, -3.654388, 0, 1, 0.4196078, 1,
-0.3079878, -0.2296515, -2.872276, 0, 1, 0.4235294, 1,
-0.3075059, -0.6595073, -3.561833, 0, 1, 0.4313726, 1,
-0.3074485, 0.8930903, -0.6221546, 0, 1, 0.4352941, 1,
-0.3027334, -0.7733329, -2.456869, 0, 1, 0.4431373, 1,
-0.2926756, -1.187841, -1.604917, 0, 1, 0.4470588, 1,
-0.2870944, -1.757215, -4.290389, 0, 1, 0.454902, 1,
-0.2863697, 0.2950583, -1.725902, 0, 1, 0.4588235, 1,
-0.2839128, -0.08721191, -2.434029, 0, 1, 0.4666667, 1,
-0.2768058, -1.138871, -2.226681, 0, 1, 0.4705882, 1,
-0.2669397, 2.108727, 0.226757, 0, 1, 0.4784314, 1,
-0.2644368, -0.2866208, -3.372139, 0, 1, 0.4823529, 1,
-0.264413, 0.3082389, -0.7732848, 0, 1, 0.4901961, 1,
-0.260096, 0.2705896, -1.402734, 0, 1, 0.4941176, 1,
-0.2584174, -0.024672, -1.315637, 0, 1, 0.5019608, 1,
-0.2541224, -0.266365, -2.330378, 0, 1, 0.509804, 1,
-0.2528664, 0.758949, -0.4770021, 0, 1, 0.5137255, 1,
-0.2502372, 1.449525, 0.5836318, 0, 1, 0.5215687, 1,
-0.2495951, 0.6436977, 0.2511751, 0, 1, 0.5254902, 1,
-0.2469244, -2.031962, -2.25772, 0, 1, 0.5333334, 1,
-0.2444426, 1.133385, 0.7079478, 0, 1, 0.5372549, 1,
-0.2412836, -1.179388, -3.32033, 0, 1, 0.5450981, 1,
-0.2330549, -0.5817059, -1.754559, 0, 1, 0.5490196, 1,
-0.225775, 1.079356, -3.040764, 0, 1, 0.5568628, 1,
-0.2238677, -1.418151, -3.389424, 0, 1, 0.5607843, 1,
-0.2238065, 1.265174, -1.153129, 0, 1, 0.5686275, 1,
-0.2206738, -0.9416713, -0.1259397, 0, 1, 0.572549, 1,
-0.2204585, -0.1216708, -1.825856, 0, 1, 0.5803922, 1,
-0.2190212, 0.1675366, -0.1831782, 0, 1, 0.5843138, 1,
-0.2177824, -0.136356, -1.894916, 0, 1, 0.5921569, 1,
-0.2163279, -0.4336199, -3.146532, 0, 1, 0.5960785, 1,
-0.2112372, -0.1494852, -0.7417125, 0, 1, 0.6039216, 1,
-0.2090942, 0.5541818, -1.366191, 0, 1, 0.6117647, 1,
-0.2070115, -0.06926332, -1.534722, 0, 1, 0.6156863, 1,
-0.2017963, 0.086928, -1.14539, 0, 1, 0.6235294, 1,
-0.1964889, -1.466782, -0.9522772, 0, 1, 0.627451, 1,
-0.1964353, -1.453434, -2.948337, 0, 1, 0.6352941, 1,
-0.1946253, -0.3080336, -1.956932, 0, 1, 0.6392157, 1,
-0.1938447, 0.905176, 0.5092003, 0, 1, 0.6470588, 1,
-0.1934135, 1.567432, -1.7031, 0, 1, 0.6509804, 1,
-0.1917822, -1.41404, -1.407009, 0, 1, 0.6588235, 1,
-0.1868726, -0.06517911, -2.516167, 0, 1, 0.6627451, 1,
-0.1865702, -1.718301, -2.977016, 0, 1, 0.6705883, 1,
-0.183353, -0.867053, -3.86861, 0, 1, 0.6745098, 1,
-0.1823098, -0.658881, -2.297663, 0, 1, 0.682353, 1,
-0.1812822, 0.2542585, -1.209225, 0, 1, 0.6862745, 1,
-0.1780855, -2.450229, -1.958679, 0, 1, 0.6941177, 1,
-0.1760174, 0.7855376, 0.3049439, 0, 1, 0.7019608, 1,
-0.1755594, -1.062844, -3.938294, 0, 1, 0.7058824, 1,
-0.1715772, -1.01739, -5.617576, 0, 1, 0.7137255, 1,
-0.1706935, -0.1239731, -2.796754, 0, 1, 0.7176471, 1,
-0.168384, 1.798486, -0.3595745, 0, 1, 0.7254902, 1,
-0.1662666, 0.6744877, -1.653864, 0, 1, 0.7294118, 1,
-0.1659696, -0.6557932, -3.877368, 0, 1, 0.7372549, 1,
-0.164252, -1.64196, -3.725853, 0, 1, 0.7411765, 1,
-0.1639755, 0.8113036, 0.6649505, 0, 1, 0.7490196, 1,
-0.1545652, -1.771261, -3.644321, 0, 1, 0.7529412, 1,
-0.1530503, -0.9833364, -3.976166, 0, 1, 0.7607843, 1,
-0.1515888, -2.355689, -3.062714, 0, 1, 0.7647059, 1,
-0.1511829, 0.3049903, -0.8450965, 0, 1, 0.772549, 1,
-0.1510761, 0.04376599, -0.6834517, 0, 1, 0.7764706, 1,
-0.1509329, 0.2415402, 0.1010912, 0, 1, 0.7843137, 1,
-0.1491036, 1.963225, -1.457591, 0, 1, 0.7882353, 1,
-0.1474102, 0.6157767, 0.1267938, 0, 1, 0.7960784, 1,
-0.1420051, -2.199081, -2.691025, 0, 1, 0.8039216, 1,
-0.1410653, -0.6223827, -3.452722, 0, 1, 0.8078431, 1,
-0.1397978, -0.3706423, -2.413423, 0, 1, 0.8156863, 1,
-0.1380379, -1.173303, -4.821327, 0, 1, 0.8196079, 1,
-0.1358796, 1.159653, -1.10104, 0, 1, 0.827451, 1,
-0.1355088, 0.5592375, -1.368116, 0, 1, 0.8313726, 1,
-0.1335321, -2.170465, -2.226788, 0, 1, 0.8392157, 1,
-0.1334535, -1.32053, -3.955151, 0, 1, 0.8431373, 1,
-0.1295913, 0.7636284, -1.605778, 0, 1, 0.8509804, 1,
-0.1293999, 0.9532561, 1.67435, 0, 1, 0.854902, 1,
-0.1272103, 0.5736271, -1.756599, 0, 1, 0.8627451, 1,
-0.1241775, -0.2331346, -1.849928, 0, 1, 0.8666667, 1,
-0.1195471, -0.1676689, -2.480661, 0, 1, 0.8745098, 1,
-0.1129145, 0.4922602, -0.485706, 0, 1, 0.8784314, 1,
-0.110026, -1.179836, -3.153617, 0, 1, 0.8862745, 1,
-0.1083649, 0.9524101, 0.4522778, 0, 1, 0.8901961, 1,
-0.1069816, -0.5385872, -5.096278, 0, 1, 0.8980392, 1,
-0.1048543, -0.5621256, -2.555472, 0, 1, 0.9058824, 1,
-0.1040031, -0.9000224, -5.187964, 0, 1, 0.9098039, 1,
-0.09932854, 0.09111175, -1.794085, 0, 1, 0.9176471, 1,
-0.09851231, -0.08109051, -2.619219, 0, 1, 0.9215686, 1,
-0.09522423, 0.2652256, -0.7501472, 0, 1, 0.9294118, 1,
-0.09521564, -0.908308, -2.757968, 0, 1, 0.9333333, 1,
-0.0917569, -0.750483, -0.984694, 0, 1, 0.9411765, 1,
-0.08973809, -1.508945, -3.692363, 0, 1, 0.945098, 1,
-0.08929649, 0.4632376, -0.5818192, 0, 1, 0.9529412, 1,
-0.08883943, -0.2590442, -1.707255, 0, 1, 0.9568627, 1,
-0.08686651, 1.984625, -2.172715, 0, 1, 0.9647059, 1,
-0.08400302, -0.8553579, -2.006544, 0, 1, 0.9686275, 1,
-0.08198012, 1.30193, -1.402787, 0, 1, 0.9764706, 1,
-0.07873939, 0.1093342, 0.2832983, 0, 1, 0.9803922, 1,
-0.07771262, -0.2579673, -2.275359, 0, 1, 0.9882353, 1,
-0.07223118, 0.3613241, -0.2345802, 0, 1, 0.9921569, 1,
-0.06914017, -0.2312944, -3.065766, 0, 1, 1, 1,
-0.06031668, -0.01386013, -1.84585, 0, 0.9921569, 1, 1,
-0.05967817, -0.1972188, -3.051424, 0, 0.9882353, 1, 1,
-0.0562138, 1.422941, -0.6197079, 0, 0.9803922, 1, 1,
-0.05533672, 1.056297, -0.3303168, 0, 0.9764706, 1, 1,
-0.05517064, 0.07500613, -0.7435474, 0, 0.9686275, 1, 1,
-0.05467258, 0.843682, -0.918564, 0, 0.9647059, 1, 1,
-0.05294198, -1.821403, -4.381953, 0, 0.9568627, 1, 1,
-0.05165248, -0.3450291, -2.904804, 0, 0.9529412, 1, 1,
-0.05146105, 2.332527, 1.173144, 0, 0.945098, 1, 1,
-0.04791604, -0.1018866, -3.612695, 0, 0.9411765, 1, 1,
-0.04770711, -0.2797805, -2.185718, 0, 0.9333333, 1, 1,
-0.04709538, -0.3933601, -2.575668, 0, 0.9294118, 1, 1,
-0.04258752, -1.23183, -3.434086, 0, 0.9215686, 1, 1,
-0.04229395, 0.2048022, -1.104672, 0, 0.9176471, 1, 1,
-0.0422889, 0.5087913, 1.855999, 0, 0.9098039, 1, 1,
-0.03923496, -1.549874, -3.754527, 0, 0.9058824, 1, 1,
-0.02897441, 0.4438447, -1.797579, 0, 0.8980392, 1, 1,
-0.0282687, -0.3074633, -5.580162, 0, 0.8901961, 1, 1,
-0.02816289, 0.1062732, 0.8058299, 0, 0.8862745, 1, 1,
-0.02674083, -0.6896586, -2.549252, 0, 0.8784314, 1, 1,
-0.02655879, 0.6713656, 0.7799034, 0, 0.8745098, 1, 1,
-0.02523344, -1.074883, -1.868244, 0, 0.8666667, 1, 1,
-0.02456496, -0.9460622, -0.5863898, 0, 0.8627451, 1, 1,
-0.02419519, 1.565477, 0.5509518, 0, 0.854902, 1, 1,
-0.02252102, -0.1096551, -2.088416, 0, 0.8509804, 1, 1,
-0.02104615, -0.6334883, -2.654504, 0, 0.8431373, 1, 1,
-0.01639192, -0.4276175, -3.064056, 0, 0.8392157, 1, 1,
-0.01589634, 0.3470604, -0.8859911, 0, 0.8313726, 1, 1,
-0.00986478, 0.6855777, -0.5243968, 0, 0.827451, 1, 1,
-0.008286399, -1.503204, -4.355531, 0, 0.8196079, 1, 1,
-0.0059205, -0.6024991, -4.347362, 0, 0.8156863, 1, 1,
-0.005886491, -0.1925579, -1.61797, 0, 0.8078431, 1, 1,
-0.005586858, -1.718376, -2.960956, 0, 0.8039216, 1, 1,
-0.00407401, -0.2507026, -2.341927, 0, 0.7960784, 1, 1,
-0.003305227, 1.031106, -2.17324, 0, 0.7882353, 1, 1,
0.00859063, 0.9625408, 0.4184055, 0, 0.7843137, 1, 1,
0.009094931, -1.199013, 2.312638, 0, 0.7764706, 1, 1,
0.01171491, -0.4145909, 2.764502, 0, 0.772549, 1, 1,
0.0122817, -0.8685186, 3.212409, 0, 0.7647059, 1, 1,
0.01430738, 0.7675908, 2.678406, 0, 0.7607843, 1, 1,
0.01566922, 1.040088, 1.104184, 0, 0.7529412, 1, 1,
0.01702141, 1.745229, -0.454744, 0, 0.7490196, 1, 1,
0.01770377, 0.5177703, -0.6850784, 0, 0.7411765, 1, 1,
0.01803027, 0.9328653, 0.287185, 0, 0.7372549, 1, 1,
0.01933531, 0.9913567, 0.7583403, 0, 0.7294118, 1, 1,
0.02053244, -0.7180071, 1.37825, 0, 0.7254902, 1, 1,
0.02238278, 2.286979, 1.537861, 0, 0.7176471, 1, 1,
0.02350168, -0.7097812, 2.675008, 0, 0.7137255, 1, 1,
0.03852237, -1.054114, 3.756168, 0, 0.7058824, 1, 1,
0.03883274, 0.2515143, 0.5826297, 0, 0.6980392, 1, 1,
0.04229111, -0.6101424, 3.66205, 0, 0.6941177, 1, 1,
0.04278509, 0.5889628, -0.3950547, 0, 0.6862745, 1, 1,
0.04723821, -0.9273137, 3.57478, 0, 0.682353, 1, 1,
0.05227169, 0.5742002, -0.8711563, 0, 0.6745098, 1, 1,
0.05247735, -0.5260844, 3.234509, 0, 0.6705883, 1, 1,
0.05469877, 0.155488, 1.0629, 0, 0.6627451, 1, 1,
0.06000569, -0.8183284, 2.55435, 0, 0.6588235, 1, 1,
0.06001094, 0.1463335, 0.5387247, 0, 0.6509804, 1, 1,
0.06033375, 1.117402, -0.04237103, 0, 0.6470588, 1, 1,
0.06124378, -1.110394, 2.5587, 0, 0.6392157, 1, 1,
0.0652348, -0.3102473, 2.392761, 0, 0.6352941, 1, 1,
0.06976057, -0.9344693, 1.680383, 0, 0.627451, 1, 1,
0.06992078, -0.5775236, 4.247699, 0, 0.6235294, 1, 1,
0.07249051, 1.466115, -1.7285, 0, 0.6156863, 1, 1,
0.07307944, 0.3720504, 1.973445, 0, 0.6117647, 1, 1,
0.07611097, -0.3087431, 2.156261, 0, 0.6039216, 1, 1,
0.08174897, -0.1168098, 3.143652, 0, 0.5960785, 1, 1,
0.08290458, 1.60106, -1.583726, 0, 0.5921569, 1, 1,
0.08466619, 1.017367, 0.09120189, 0, 0.5843138, 1, 1,
0.08822512, 0.8626006, -1.093468, 0, 0.5803922, 1, 1,
0.09005116, 0.04257504, 1.543417, 0, 0.572549, 1, 1,
0.0927446, 0.680365, 1.359245, 0, 0.5686275, 1, 1,
0.09468777, 1.246547, 0.2505537, 0, 0.5607843, 1, 1,
0.09597115, 0.477761, -0.451675, 0, 0.5568628, 1, 1,
0.097143, 1.366392, 0.9977784, 0, 0.5490196, 1, 1,
0.09903517, 1.79085, -0.3775783, 0, 0.5450981, 1, 1,
0.1020723, -0.6164111, 4.061102, 0, 0.5372549, 1, 1,
0.1036635, 0.1063207, 0.779695, 0, 0.5333334, 1, 1,
0.1088889, -0.1906928, 0.1765414, 0, 0.5254902, 1, 1,
0.1142825, -0.9294902, 3.480133, 0, 0.5215687, 1, 1,
0.1145031, 0.05296388, 2.718482, 0, 0.5137255, 1, 1,
0.1170792, -0.916554, 4.282335, 0, 0.509804, 1, 1,
0.1176322, 0.8623795, -1.022696, 0, 0.5019608, 1, 1,
0.12156, -1.160738, 3.362454, 0, 0.4941176, 1, 1,
0.127557, -1.109908, 1.704529, 0, 0.4901961, 1, 1,
0.133112, 0.1404562, 1.760996, 0, 0.4823529, 1, 1,
0.1420472, 0.5322788, -0.7352003, 0, 0.4784314, 1, 1,
0.1430034, -1.601905, 2.862635, 0, 0.4705882, 1, 1,
0.1503546, 0.8203002, 1.011967, 0, 0.4666667, 1, 1,
0.1568392, 0.4918231, 0.7681957, 0, 0.4588235, 1, 1,
0.1617955, 0.182363, 0.6316551, 0, 0.454902, 1, 1,
0.1620303, -1.10345, 2.626419, 0, 0.4470588, 1, 1,
0.1627469, 0.7123422, 0.4718743, 0, 0.4431373, 1, 1,
0.1634934, 0.3905818, 1.517787, 0, 0.4352941, 1, 1,
0.1665747, -1.291671, 0.8898747, 0, 0.4313726, 1, 1,
0.1668558, -0.2591437, 3.21168, 0, 0.4235294, 1, 1,
0.1736204, 1.695827, 1.906031, 0, 0.4196078, 1, 1,
0.1743497, -1.272936, 1.6745, 0, 0.4117647, 1, 1,
0.1755454, -0.8248202, 0.3274991, 0, 0.4078431, 1, 1,
0.178953, 0.8110433, -1.639255, 0, 0.4, 1, 1,
0.1819192, 2.431155, -1.472342, 0, 0.3921569, 1, 1,
0.1844961, -0.8967941, 0.6370184, 0, 0.3882353, 1, 1,
0.1851878, -2.669027, 4.309512, 0, 0.3803922, 1, 1,
0.1862736, 0.9389706, 0.7859937, 0, 0.3764706, 1, 1,
0.1886684, -0.3889982, 1.003405, 0, 0.3686275, 1, 1,
0.1918054, 2.159722, -1.024119, 0, 0.3647059, 1, 1,
0.1942446, 0.7272663, 0.6739407, 0, 0.3568628, 1, 1,
0.2049213, -1.764676, 1.307248, 0, 0.3529412, 1, 1,
0.2109786, -0.9691078, 2.240017, 0, 0.345098, 1, 1,
0.2113795, 1.613733, 0.8620928, 0, 0.3411765, 1, 1,
0.2156838, -0.6382392, 2.72946, 0, 0.3333333, 1, 1,
0.2186217, -2.571021, 1.926101, 0, 0.3294118, 1, 1,
0.2235665, -1.134157, 2.538471, 0, 0.3215686, 1, 1,
0.2241947, 1.778811, -0.7408783, 0, 0.3176471, 1, 1,
0.2249305, 0.2537135, -0.7406, 0, 0.3098039, 1, 1,
0.2276028, 1.346976, 1.84745, 0, 0.3058824, 1, 1,
0.2335623, 0.9665912, 0.8370311, 0, 0.2980392, 1, 1,
0.2350993, 1.076301, 1.170862, 0, 0.2901961, 1, 1,
0.2361888, -0.1542744, 3.420467, 0, 0.2862745, 1, 1,
0.2373761, -0.2533448, 3.27584, 0, 0.2784314, 1, 1,
0.2374812, -1.261272, 4.177196, 0, 0.2745098, 1, 1,
0.2412851, -0.4993312, 3.963571, 0, 0.2666667, 1, 1,
0.2463923, -0.06279411, 2.230525, 0, 0.2627451, 1, 1,
0.2472899, -0.1451812, 2.559927, 0, 0.254902, 1, 1,
0.2488902, -0.2232724, 2.488428, 0, 0.2509804, 1, 1,
0.2576647, -0.7637008, 4.161436, 0, 0.2431373, 1, 1,
0.2578767, 0.3377199, 1.337101, 0, 0.2392157, 1, 1,
0.2592678, 0.7037835, -0.7901919, 0, 0.2313726, 1, 1,
0.2599752, -0.7654635, 2.695319, 0, 0.227451, 1, 1,
0.2623084, -1.746378, 2.347128, 0, 0.2196078, 1, 1,
0.2636476, 0.8788335, -1.172492, 0, 0.2156863, 1, 1,
0.2638145, -2.560551, 3.486972, 0, 0.2078431, 1, 1,
0.2680445, 0.1635344, 1.157258, 0, 0.2039216, 1, 1,
0.2733046, -0.334244, 2.883068, 0, 0.1960784, 1, 1,
0.2752438, -0.2601653, 3.543629, 0, 0.1882353, 1, 1,
0.276776, 0.2763062, -0.09073585, 0, 0.1843137, 1, 1,
0.283955, 0.8198029, 0.3430042, 0, 0.1764706, 1, 1,
0.2853992, -0.007607858, 1.535514, 0, 0.172549, 1, 1,
0.2889, 1.741601, -1.876934, 0, 0.1647059, 1, 1,
0.2892311, -0.8400566, 2.607596, 0, 0.1607843, 1, 1,
0.2917542, -1.596489, 3.211743, 0, 0.1529412, 1, 1,
0.2950653, -0.8924121, 2.739043, 0, 0.1490196, 1, 1,
0.2971419, -2.437163, 2.084373, 0, 0.1411765, 1, 1,
0.3037471, 1.287279, 0.01769534, 0, 0.1372549, 1, 1,
0.3053857, -0.505116, 2.407548, 0, 0.1294118, 1, 1,
0.3085828, -1.351907, 2.794309, 0, 0.1254902, 1, 1,
0.315664, -1.452263, 2.503238, 0, 0.1176471, 1, 1,
0.3196236, -0.07802527, 3.081052, 0, 0.1137255, 1, 1,
0.3200979, -0.4584989, 2.3727, 0, 0.1058824, 1, 1,
0.3201899, 1.72652, 1.208883, 0, 0.09803922, 1, 1,
0.3224633, 1.063304, 0.1972075, 0, 0.09411765, 1, 1,
0.3242244, -0.0405454, 1.166056, 0, 0.08627451, 1, 1,
0.3260289, -0.6229153, 3.50652, 0, 0.08235294, 1, 1,
0.3346384, 0.8730837, -0.8860122, 0, 0.07450981, 1, 1,
0.3401494, 0.7797689, 1.472214, 0, 0.07058824, 1, 1,
0.3424241, -0.1999742, 0.9232594, 0, 0.0627451, 1, 1,
0.3449907, 0.6769333, 0.1033256, 0, 0.05882353, 1, 1,
0.3480432, -1.291811, 2.864551, 0, 0.05098039, 1, 1,
0.3602779, -0.2593476, 2.699282, 0, 0.04705882, 1, 1,
0.3695958, -0.4976402, 2.128937, 0, 0.03921569, 1, 1,
0.3718476, -1.373332, 5.103321, 0, 0.03529412, 1, 1,
0.3783222, -2.033443, 4.166144, 0, 0.02745098, 1, 1,
0.3803238, -1.289895, 2.726676, 0, 0.02352941, 1, 1,
0.3809712, -0.05580923, 2.368519, 0, 0.01568628, 1, 1,
0.3839658, 0.7924557, 2.099888, 0, 0.01176471, 1, 1,
0.3842282, 0.5176598, 1.147518, 0, 0.003921569, 1, 1,
0.3910533, 0.6028116, 1.231184, 0.003921569, 0, 1, 1,
0.3941578, 2.004025, -0.04015274, 0.007843138, 0, 1, 1,
0.3953165, -0.290102, 3.093478, 0.01568628, 0, 1, 1,
0.3962272, 1.242319, 0.2494277, 0.01960784, 0, 1, 1,
0.3979783, -1.227406, 2.628351, 0.02745098, 0, 1, 1,
0.3984906, 0.1024306, 0.9400443, 0.03137255, 0, 1, 1,
0.399293, 0.3229881, 0.3890243, 0.03921569, 0, 1, 1,
0.4062532, -0.07847413, 1.524622, 0.04313726, 0, 1, 1,
0.4102934, 0.2829427, 0.1916208, 0.05098039, 0, 1, 1,
0.4109797, 2.825977, -0.5720154, 0.05490196, 0, 1, 1,
0.4126649, -0.5510523, 2.406823, 0.0627451, 0, 1, 1,
0.4187847, -1.896067, 4.470419, 0.06666667, 0, 1, 1,
0.4215204, 0.1419366, 1.719628, 0.07450981, 0, 1, 1,
0.4312228, -2.781494, 4.948528, 0.07843138, 0, 1, 1,
0.439659, 0.9906856, -1.898693, 0.08627451, 0, 1, 1,
0.4403408, -0.5718544, 2.539405, 0.09019608, 0, 1, 1,
0.4404281, -0.1319453, 1.654496, 0.09803922, 0, 1, 1,
0.4430718, -1.024365, 2.32876, 0.1058824, 0, 1, 1,
0.4431522, 0.2226435, 0.8385113, 0.1098039, 0, 1, 1,
0.4506956, -1.599563, 3.579459, 0.1176471, 0, 1, 1,
0.4517458, 2.038697, -1.094759, 0.1215686, 0, 1, 1,
0.4518661, -1.691146, 4.301484, 0.1294118, 0, 1, 1,
0.45311, -1.934583, 1.472663, 0.1333333, 0, 1, 1,
0.4535126, 0.3101494, 1.559534, 0.1411765, 0, 1, 1,
0.4598818, 0.9854649, 0.4876001, 0.145098, 0, 1, 1,
0.4637253, 1.067347, 0.1118759, 0.1529412, 0, 1, 1,
0.4649709, 1.845588, 1.098105, 0.1568628, 0, 1, 1,
0.4687753, -0.1568165, 0.1668416, 0.1647059, 0, 1, 1,
0.4688605, 1.474134, 1.422346, 0.1686275, 0, 1, 1,
0.4760013, -0.7570371, 3.644147, 0.1764706, 0, 1, 1,
0.4764213, 1.041029, -0.003183628, 0.1803922, 0, 1, 1,
0.4773457, 0.1225349, 0.1518823, 0.1882353, 0, 1, 1,
0.4778453, 0.1024071, 1.804087, 0.1921569, 0, 1, 1,
0.4779218, -0.3407853, 1.92482, 0.2, 0, 1, 1,
0.4790028, 0.2126911, 2.066395, 0.2078431, 0, 1, 1,
0.4796759, 0.4237634, 0.659139, 0.2117647, 0, 1, 1,
0.4803911, -0.1515948, 2.538614, 0.2196078, 0, 1, 1,
0.4811475, -1.11439, 2.205095, 0.2235294, 0, 1, 1,
0.490072, -2.190993, 1.731097, 0.2313726, 0, 1, 1,
0.4914564, -0.5822092, 0.7772955, 0.2352941, 0, 1, 1,
0.4934143, 1.157365, -1.254364, 0.2431373, 0, 1, 1,
0.4939743, 0.2320151, 1.05274, 0.2470588, 0, 1, 1,
0.4941011, -1.757868, 4.371194, 0.254902, 0, 1, 1,
0.4978804, 1.371647, -0.04986816, 0.2588235, 0, 1, 1,
0.4983868, 0.1698871, 1.178367, 0.2666667, 0, 1, 1,
0.5008762, -0.1065837, 1.850496, 0.2705882, 0, 1, 1,
0.504962, 0.7908971, 0.7595379, 0.2784314, 0, 1, 1,
0.5110447, 1.040439, 1.111369, 0.282353, 0, 1, 1,
0.5147766, -0.2744649, 1.392371, 0.2901961, 0, 1, 1,
0.5164873, -0.9861409, 4.779232, 0.2941177, 0, 1, 1,
0.5197841, 0.1320876, 2.764472, 0.3019608, 0, 1, 1,
0.5229077, -1.293108, 1.313137, 0.3098039, 0, 1, 1,
0.5257779, 0.5568622, 0.1237931, 0.3137255, 0, 1, 1,
0.5286359, 1.04271, -0.1917206, 0.3215686, 0, 1, 1,
0.5310003, 0.1645904, 1.554398, 0.3254902, 0, 1, 1,
0.5316716, -1.691204, 2.99335, 0.3333333, 0, 1, 1,
0.5349405, -0.713725, 2.307967, 0.3372549, 0, 1, 1,
0.5353899, -1.122626, 0.6886724, 0.345098, 0, 1, 1,
0.5413371, 0.9046193, 2.399263, 0.3490196, 0, 1, 1,
0.5486846, -0.09093588, -0.2800721, 0.3568628, 0, 1, 1,
0.5490052, 1.004374, 0.2536552, 0.3607843, 0, 1, 1,
0.5501072, -0.3668845, 3.400472, 0.3686275, 0, 1, 1,
0.5504375, 0.2445661, 3.23176, 0.372549, 0, 1, 1,
0.5559741, 0.1630282, 3.817387, 0.3803922, 0, 1, 1,
0.5618555, -0.4503939, 2.300093, 0.3843137, 0, 1, 1,
0.5752591, -2.064982, 3.448567, 0.3921569, 0, 1, 1,
0.5792429, -0.0908861, 1.332599, 0.3960784, 0, 1, 1,
0.5795647, 1.579436, -0.1079182, 0.4039216, 0, 1, 1,
0.5796443, -1.208114, 2.995462, 0.4117647, 0, 1, 1,
0.5819101, -1.002331, 2.33667, 0.4156863, 0, 1, 1,
0.5843408, 0.02224923, 2.34337, 0.4235294, 0, 1, 1,
0.5868505, -1.132723, 1.597543, 0.427451, 0, 1, 1,
0.5885548, 0.3157193, 0.7728256, 0.4352941, 0, 1, 1,
0.5893773, -0.7095891, 2.78817, 0.4392157, 0, 1, 1,
0.5896838, 0.3914706, -0.5495818, 0.4470588, 0, 1, 1,
0.5917497, -0.7158359, 2.836088, 0.4509804, 0, 1, 1,
0.595811, 0.518128, 0.9013805, 0.4588235, 0, 1, 1,
0.5989397, 1.266569, -0.4890747, 0.4627451, 0, 1, 1,
0.6027058, -0.8284959, 1.841793, 0.4705882, 0, 1, 1,
0.6035794, 0.5172915, 2.271206, 0.4745098, 0, 1, 1,
0.6037252, 0.06859374, 1.314633, 0.4823529, 0, 1, 1,
0.6060761, 0.3398736, 0.7345789, 0.4862745, 0, 1, 1,
0.6073612, 0.771409, -0.1272986, 0.4941176, 0, 1, 1,
0.6080921, -1.649119, 1.88442, 0.5019608, 0, 1, 1,
0.613914, 0.5235326, 1.508692, 0.5058824, 0, 1, 1,
0.6144944, -1.860396, 2.617194, 0.5137255, 0, 1, 1,
0.6148206, 0.7597178, 2.093683, 0.5176471, 0, 1, 1,
0.6160914, 1.570091, 1.118277, 0.5254902, 0, 1, 1,
0.6282831, 0.3989508, 1.612354, 0.5294118, 0, 1, 1,
0.6323301, 0.1087485, 2.785881, 0.5372549, 0, 1, 1,
0.6341816, 0.6247051, -0.1959068, 0.5411765, 0, 1, 1,
0.6376329, 0.8316261, 0.9995107, 0.5490196, 0, 1, 1,
0.6398826, 0.7951025, 0.2299687, 0.5529412, 0, 1, 1,
0.644789, 0.4711812, 0.8486949, 0.5607843, 0, 1, 1,
0.6450598, -0.06360185, 1.806292, 0.5647059, 0, 1, 1,
0.6504884, -1.672064, 2.947127, 0.572549, 0, 1, 1,
0.6525434, 0.9312485, 1.126747, 0.5764706, 0, 1, 1,
0.6575865, -1.408795, 3.189478, 0.5843138, 0, 1, 1,
0.6649922, -0.90575, 1.478874, 0.5882353, 0, 1, 1,
0.6705054, 0.6781608, 1.221286, 0.5960785, 0, 1, 1,
0.6733716, -1.172901, 0.9382901, 0.6039216, 0, 1, 1,
0.6782331, 0.5617152, 0.08395412, 0.6078432, 0, 1, 1,
0.6833234, 0.5110507, 1.513101, 0.6156863, 0, 1, 1,
0.687147, -0.1478573, 1.282542, 0.6196079, 0, 1, 1,
0.6885231, -0.3765202, 3.064723, 0.627451, 0, 1, 1,
0.6924483, 0.06375805, 0.6285844, 0.6313726, 0, 1, 1,
0.6954236, -1.065048, 2.316409, 0.6392157, 0, 1, 1,
0.6966498, 0.4134007, -0.2824176, 0.6431373, 0, 1, 1,
0.700344, -0.7363353, 3.145408, 0.6509804, 0, 1, 1,
0.7047202, 0.1978537, -0.6349326, 0.654902, 0, 1, 1,
0.7064166, -0.677636, 2.779498, 0.6627451, 0, 1, 1,
0.7067424, 0.3936383, -0.3837665, 0.6666667, 0, 1, 1,
0.7129329, 0.6953615, 1.10794, 0.6745098, 0, 1, 1,
0.7162401, -0.4859012, 2.965557, 0.6784314, 0, 1, 1,
0.7208384, 0.751968, 1.497014, 0.6862745, 0, 1, 1,
0.7223062, 1.163501, 0.9766403, 0.6901961, 0, 1, 1,
0.7226963, -0.5086547, 3.269742, 0.6980392, 0, 1, 1,
0.7232093, -0.163542, 2.88599, 0.7058824, 0, 1, 1,
0.7338727, 1.17301, 3.670489, 0.7098039, 0, 1, 1,
0.7377724, -0.514386, 1.701552, 0.7176471, 0, 1, 1,
0.7463965, -1.047567, 2.046758, 0.7215686, 0, 1, 1,
0.750672, -1.282828, 3.480787, 0.7294118, 0, 1, 1,
0.7513074, -1.50851, 1.38142, 0.7333333, 0, 1, 1,
0.7590227, -2.151862, 2.420148, 0.7411765, 0, 1, 1,
0.7642364, 0.6420439, 2.452002, 0.7450981, 0, 1, 1,
0.767067, 1.458879, -0.6628908, 0.7529412, 0, 1, 1,
0.7707478, -2.05843, 3.128685, 0.7568628, 0, 1, 1,
0.773071, 0.5732372, 1.251985, 0.7647059, 0, 1, 1,
0.7758659, 0.17049, 1.363492, 0.7686275, 0, 1, 1,
0.7789459, -0.5562912, 1.909807, 0.7764706, 0, 1, 1,
0.7794615, 0.1993058, 0.1168009, 0.7803922, 0, 1, 1,
0.7799805, 0.1280544, -0.1812756, 0.7882353, 0, 1, 1,
0.7807096, 0.4111003, 1.235186, 0.7921569, 0, 1, 1,
0.7852959, -0.4345642, 3.722486, 0.8, 0, 1, 1,
0.7876947, 0.5446617, 1.485915, 0.8078431, 0, 1, 1,
0.791687, 0.5834574, 0.74288, 0.8117647, 0, 1, 1,
0.7942791, -0.5957125, 2.743313, 0.8196079, 0, 1, 1,
0.7981401, -0.4041851, 1.037804, 0.8235294, 0, 1, 1,
0.7994319, 0.8456997, 2.845587, 0.8313726, 0, 1, 1,
0.800192, 0.2263309, 1.169474, 0.8352941, 0, 1, 1,
0.8014199, -0.9054022, 2.899746, 0.8431373, 0, 1, 1,
0.8014719, -0.5980322, 1.881668, 0.8470588, 0, 1, 1,
0.8023629, 0.9396825, -0.11062, 0.854902, 0, 1, 1,
0.8036779, 0.251517, 1.734348, 0.8588235, 0, 1, 1,
0.8162429, -0.5653807, 2.825798, 0.8666667, 0, 1, 1,
0.8166499, -0.9277174, 1.916685, 0.8705882, 0, 1, 1,
0.8225531, 0.339089, 3.299385, 0.8784314, 0, 1, 1,
0.8237593, -0.6153351, 2.759167, 0.8823529, 0, 1, 1,
0.8257504, -0.4042713, 1.8289, 0.8901961, 0, 1, 1,
0.8270045, 0.6778226, 0.06659212, 0.8941177, 0, 1, 1,
0.8428061, -0.3019575, 2.112173, 0.9019608, 0, 1, 1,
0.8450214, -0.6197166, 3.319777, 0.9098039, 0, 1, 1,
0.8460486, -0.2206881, 2.15191, 0.9137255, 0, 1, 1,
0.8483999, -0.5563921, 3.987973, 0.9215686, 0, 1, 1,
0.8523852, 0.1307725, 1.583668, 0.9254902, 0, 1, 1,
0.8596581, 1.412215, 0.9996607, 0.9333333, 0, 1, 1,
0.8601716, -1.746348, 3.320565, 0.9372549, 0, 1, 1,
0.8633366, 0.5406321, 2.930977, 0.945098, 0, 1, 1,
0.8646511, -0.5493568, 0.7018734, 0.9490196, 0, 1, 1,
0.8666087, 0.9349422, 1.45907, 0.9568627, 0, 1, 1,
0.86749, -1.043067, 2.72952, 0.9607843, 0, 1, 1,
0.8719426, -0.10185, 2.588003, 0.9686275, 0, 1, 1,
0.8727537, -1.621582, 3.882428, 0.972549, 0, 1, 1,
0.8806294, 0.7792764, -0.1840645, 0.9803922, 0, 1, 1,
0.881804, 0.7804046, 1.444535, 0.9843137, 0, 1, 1,
0.8900433, 0.4643351, 2.025737, 0.9921569, 0, 1, 1,
0.8915172, 0.1131175, 2.275685, 0.9960784, 0, 1, 1,
0.8926134, 1.073637, 1.440428, 1, 0, 0.9960784, 1,
0.8939543, -1.556955, 3.480146, 1, 0, 0.9882353, 1,
0.894659, 0.1717944, 2.256118, 1, 0, 0.9843137, 1,
0.8976913, 0.933224, 0.4846998, 1, 0, 0.9764706, 1,
0.8999172, 1.801823, 0.8832765, 1, 0, 0.972549, 1,
0.9007402, 1.316136, 0.1178944, 1, 0, 0.9647059, 1,
0.9031752, 1.254303, 1.413016, 1, 0, 0.9607843, 1,
0.9059368, 0.322475, 1.746583, 1, 0, 0.9529412, 1,
0.9065122, 1.36468, 0.2582158, 1, 0, 0.9490196, 1,
0.9092396, -1.107128, 1.581327, 1, 0, 0.9411765, 1,
0.9097744, 0.06069276, 1.779731, 1, 0, 0.9372549, 1,
0.9130837, 1.071628, 0.9310611, 1, 0, 0.9294118, 1,
0.9139774, 1.812964, -1.679318, 1, 0, 0.9254902, 1,
0.9180059, 0.7480183, 1.222507, 1, 0, 0.9176471, 1,
0.9297653, 0.4294965, 2.36242, 1, 0, 0.9137255, 1,
0.9302576, -0.5643051, 3.017718, 1, 0, 0.9058824, 1,
0.9345044, -0.2365838, 2.999472, 1, 0, 0.9019608, 1,
0.9492583, -0.6589113, 1.896095, 1, 0, 0.8941177, 1,
0.9556077, 0.5938557, 0.8547248, 1, 0, 0.8862745, 1,
0.9627698, -0.7171456, 2.928226, 1, 0, 0.8823529, 1,
0.9747468, 1.420086, 2.099686, 1, 0, 0.8745098, 1,
0.9751818, 0.7580717, 0.3363777, 1, 0, 0.8705882, 1,
0.9759428, 0.8810118, -1.086282, 1, 0, 0.8627451, 1,
0.986596, 0.4991992, 1.715311, 1, 0, 0.8588235, 1,
0.992809, -0.513824, 1.019838, 1, 0, 0.8509804, 1,
0.9972343, 0.1915187, 0.1588102, 1, 0, 0.8470588, 1,
1.007406, -1.892411, 3.223033, 1, 0, 0.8392157, 1,
1.009947, -0.698256, 1.889271, 1, 0, 0.8352941, 1,
1.010405, 0.2937804, 0.6569077, 1, 0, 0.827451, 1,
1.019312, 1.358193, 1.207908, 1, 0, 0.8235294, 1,
1.025521, -0.7299765, 2.702433, 1, 0, 0.8156863, 1,
1.03123, 0.917051, 1.605512, 1, 0, 0.8117647, 1,
1.034029, 1.582232, 1.608738, 1, 0, 0.8039216, 1,
1.040729, 0.4832316, -0.2031104, 1, 0, 0.7960784, 1,
1.044419, -0.9800268, 1.957925, 1, 0, 0.7921569, 1,
1.048244, 0.9864582, -1.282656, 1, 0, 0.7843137, 1,
1.056569, 1.899471, -0.9706408, 1, 0, 0.7803922, 1,
1.073821, 1.597462, 2.41603, 1, 0, 0.772549, 1,
1.09652, 0.1035202, 1.142051, 1, 0, 0.7686275, 1,
1.10236, 1.207417, -1.196254, 1, 0, 0.7607843, 1,
1.105169, -0.06720062, -0.04986911, 1, 0, 0.7568628, 1,
1.110529, -1.108375, 2.233673, 1, 0, 0.7490196, 1,
1.115021, -1.835934, 3.869583, 1, 0, 0.7450981, 1,
1.118286, 0.1955393, 3.22929, 1, 0, 0.7372549, 1,
1.11981, 1.059171, 1.680709, 1, 0, 0.7333333, 1,
1.121671, 1.273538, 1.688106, 1, 0, 0.7254902, 1,
1.124767, 0.6728462, 0.2940782, 1, 0, 0.7215686, 1,
1.127632, -0.2234987, 1.103959, 1, 0, 0.7137255, 1,
1.148131, -1.404916, 3.367521, 1, 0, 0.7098039, 1,
1.148286, -0.805041, 2.542639, 1, 0, 0.7019608, 1,
1.160721, -0.02464554, 1.905401, 1, 0, 0.6941177, 1,
1.165951, 0.1167322, 2.391329, 1, 0, 0.6901961, 1,
1.167725, 1.754026, -1.010694, 1, 0, 0.682353, 1,
1.170605, -0.6387699, 0.4999706, 1, 0, 0.6784314, 1,
1.184134, -0.5703133, 2.879632, 1, 0, 0.6705883, 1,
1.186949, -0.7350934, 1.793445, 1, 0, 0.6666667, 1,
1.189278, -1.057456, 2.165892, 1, 0, 0.6588235, 1,
1.194209, -0.6799824, 1.640736, 1, 0, 0.654902, 1,
1.194513, 1.101186, -0.1486754, 1, 0, 0.6470588, 1,
1.196105, -0.7509254, 3.054159, 1, 0, 0.6431373, 1,
1.198408, 0.07737184, 2.968007, 1, 0, 0.6352941, 1,
1.20344, -0.1413273, 2.119337, 1, 0, 0.6313726, 1,
1.20472, 0.2831463, 1.092842, 1, 0, 0.6235294, 1,
1.208251, 2.118067, -0.9384174, 1, 0, 0.6196079, 1,
1.212937, -0.03001738, 0.6863402, 1, 0, 0.6117647, 1,
1.218292, 0.1884262, 0.1908108, 1, 0, 0.6078432, 1,
1.220992, 0.4964432, 0.4899128, 1, 0, 0.6, 1,
1.232379, 0.1466155, 1.374767, 1, 0, 0.5921569, 1,
1.245588, 1.492084, 2.337903, 1, 0, 0.5882353, 1,
1.250638, -0.05777656, 1.310861, 1, 0, 0.5803922, 1,
1.250933, -1.186027, 2.864833, 1, 0, 0.5764706, 1,
1.25847, -1.799577, 1.60819, 1, 0, 0.5686275, 1,
1.263554, 0.007521371, 1.724478, 1, 0, 0.5647059, 1,
1.267323, 0.5375612, 0.3409684, 1, 0, 0.5568628, 1,
1.267998, -1.164448, 1.55062, 1, 0, 0.5529412, 1,
1.279933, -0.5579194, -0.384385, 1, 0, 0.5450981, 1,
1.292879, -1.296985, 0.786935, 1, 0, 0.5411765, 1,
1.302467, 0.2096653, 0.590967, 1, 0, 0.5333334, 1,
1.305134, -0.2169719, 1.465725, 1, 0, 0.5294118, 1,
1.308104, 0.242504, -0.2918083, 1, 0, 0.5215687, 1,
1.309367, 0.798394, 0.6088932, 1, 0, 0.5176471, 1,
1.310597, -0.8876283, 0.7339945, 1, 0, 0.509804, 1,
1.315083, 2.204428, -0.817958, 1, 0, 0.5058824, 1,
1.321733, 0.5797666, 1.917748, 1, 0, 0.4980392, 1,
1.322957, 0.1444051, 0.59616, 1, 0, 0.4901961, 1,
1.330381, 0.3094017, 1.397071, 1, 0, 0.4862745, 1,
1.338467, 0.4574924, 1.179481, 1, 0, 0.4784314, 1,
1.343485, -0.1211503, 0.9304762, 1, 0, 0.4745098, 1,
1.350093, -0.6095726, 1.674886, 1, 0, 0.4666667, 1,
1.353888, 2.438339, 1.202649, 1, 0, 0.4627451, 1,
1.362338, -0.6552975, 1.392704, 1, 0, 0.454902, 1,
1.372644, -0.4789807, 2.849595, 1, 0, 0.4509804, 1,
1.372732, 0.5670977, 0.6768345, 1, 0, 0.4431373, 1,
1.393838, -0.07936846, 1.69839, 1, 0, 0.4392157, 1,
1.395189, 0.2457534, 2.237591, 1, 0, 0.4313726, 1,
1.402525, -1.147793, 2.331159, 1, 0, 0.427451, 1,
1.410721, -1.156921, 2.751922, 1, 0, 0.4196078, 1,
1.412467, 0.4253785, 1.449911, 1, 0, 0.4156863, 1,
1.413645, 1.020198, 0.0528331, 1, 0, 0.4078431, 1,
1.434306, -0.03389195, 1.879668, 1, 0, 0.4039216, 1,
1.446102, -0.5068147, 3.445954, 1, 0, 0.3960784, 1,
1.463359, -0.6753801, 2.096085, 1, 0, 0.3882353, 1,
1.477573, -0.5480369, 1.532169, 1, 0, 0.3843137, 1,
1.49612, -1.078066, 2.750708, 1, 0, 0.3764706, 1,
1.503339, -1.062972, 2.740564, 1, 0, 0.372549, 1,
1.515985, -0.8675399, 1.070691, 1, 0, 0.3647059, 1,
1.546993, -1.433654, 1.527333, 1, 0, 0.3607843, 1,
1.570223, 1.744788, -0.06282256, 1, 0, 0.3529412, 1,
1.577055, -0.7887824, 2.661911, 1, 0, 0.3490196, 1,
1.578049, -0.4248822, 2.310064, 1, 0, 0.3411765, 1,
1.579674, 0.02800647, 2.743358, 1, 0, 0.3372549, 1,
1.588501, -1.515122, 2.445329, 1, 0, 0.3294118, 1,
1.591907, -1.521404, 2.492225, 1, 0, 0.3254902, 1,
1.599726, -0.6681954, 1.567131, 1, 0, 0.3176471, 1,
1.602173, -0.4673937, 0.5457721, 1, 0, 0.3137255, 1,
1.62012, 1.378057, -0.06924473, 1, 0, 0.3058824, 1,
1.622478, 0.6746924, 0.06632905, 1, 0, 0.2980392, 1,
1.634649, 2.044844, 1.420794, 1, 0, 0.2941177, 1,
1.635062, -1.12697, 3.324625, 1, 0, 0.2862745, 1,
1.638478, 0.3450668, 0.4822175, 1, 0, 0.282353, 1,
1.644213, 0.2070804, 1.197005, 1, 0, 0.2745098, 1,
1.650326, -0.9529837, 1.547643, 1, 0, 0.2705882, 1,
1.659521, 0.5418884, 0.2085015, 1, 0, 0.2627451, 1,
1.683063, -0.9674522, 1.188033, 1, 0, 0.2588235, 1,
1.683915, -0.2317287, 1.000609, 1, 0, 0.2509804, 1,
1.700726, -0.9265379, 2.810477, 1, 0, 0.2470588, 1,
1.70142, 0.6943655, 0.7987013, 1, 0, 0.2392157, 1,
1.705495, -0.8147155, 4.471602, 1, 0, 0.2352941, 1,
1.723906, 2.795019, 2.147551, 1, 0, 0.227451, 1,
1.723938, -0.5694324, 2.622598, 1, 0, 0.2235294, 1,
1.725463, -0.2371605, 1.13396, 1, 0, 0.2156863, 1,
1.732879, -0.746709, 1.502911, 1, 0, 0.2117647, 1,
1.743227, 0.2006997, 0.5045708, 1, 0, 0.2039216, 1,
1.749171, -0.2968083, 1.525468, 1, 0, 0.1960784, 1,
1.754071, -1.309327, 2.316015, 1, 0, 0.1921569, 1,
1.770658, 0.2490044, 2.102678, 1, 0, 0.1843137, 1,
1.793393, -1.366747, 2.558691, 1, 0, 0.1803922, 1,
1.805565, 0.4788794, 1.83197, 1, 0, 0.172549, 1,
1.811906, 0.9525814, 1.798143, 1, 0, 0.1686275, 1,
1.817019, -0.04185361, 2.368659, 1, 0, 0.1607843, 1,
1.842183, -0.8773398, 1.366213, 1, 0, 0.1568628, 1,
1.846603, 1.090774, 1.433798, 1, 0, 0.1490196, 1,
1.883083, -0.1284342, 0.2176138, 1, 0, 0.145098, 1,
1.892687, -0.7738615, 0.4127499, 1, 0, 0.1372549, 1,
1.899583, 1.852435, 0.1868849, 1, 0, 0.1333333, 1,
1.908153, 0.9133861, 0.5489407, 1, 0, 0.1254902, 1,
1.926692, -1.046927, 2.761855, 1, 0, 0.1215686, 1,
1.948742, 0.506678, 1.672883, 1, 0, 0.1137255, 1,
1.961274, 1.82866, 0.8608843, 1, 0, 0.1098039, 1,
2.038434, -1.802867, 3.087081, 1, 0, 0.1019608, 1,
2.079505, -0.8573043, 3.001311, 1, 0, 0.09411765, 1,
2.08601, -0.3424934, 0.7078471, 1, 0, 0.09019608, 1,
2.146065, 1.638582, 2.225844, 1, 0, 0.08235294, 1,
2.177064, -0.4584091, 2.057546, 1, 0, 0.07843138, 1,
2.18228, -0.4394756, 1.165431, 1, 0, 0.07058824, 1,
2.234518, 0.5025513, 1.456205, 1, 0, 0.06666667, 1,
2.266255, -0.6730163, 0.6047853, 1, 0, 0.05882353, 1,
2.58094, 0.02409064, 0.7097334, 1, 0, 0.05490196, 1,
2.648753, 0.5516993, 2.166641, 1, 0, 0.04705882, 1,
2.693208, -1.128675, 2.147027, 1, 0, 0.04313726, 1,
2.750796, -0.7192081, 2.299373, 1, 0, 0.03529412, 1,
2.861939, 1.429188, 2.495825, 1, 0, 0.03137255, 1,
2.980482, 2.384029, 1.506485, 1, 0, 0.02352941, 1,
2.989279, 1.23777, -0.9449736, 1, 0, 0.01960784, 1,
3.141656, -0.1416902, 2.055344, 1, 0, 0.01176471, 1,
3.623162, 1.487517, 0.9509101, 1, 0, 0.007843138, 1
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
0.0276618, -3.73196, -7.500988, 0, -0.5, 0.5, 0.5,
0.0276618, -3.73196, -7.500988, 1, -0.5, 0.5, 0.5,
0.0276618, -3.73196, -7.500988, 1, 1.5, 0.5, 0.5,
0.0276618, -3.73196, -7.500988, 0, 1.5, 0.5, 0.5
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
-4.786713, 0.02224147, -7.500988, 0, -0.5, 0.5, 0.5,
-4.786713, 0.02224147, -7.500988, 1, -0.5, 0.5, 0.5,
-4.786713, 0.02224147, -7.500988, 1, 1.5, 0.5, 0.5,
-4.786713, 0.02224147, -7.500988, 0, 1.5, 0.5, 0.5
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
-4.786713, -3.73196, -0.2854385, 0, -0.5, 0.5, 0.5,
-4.786713, -3.73196, -0.2854385, 1, -0.5, 0.5, 0.5,
-4.786713, -3.73196, -0.2854385, 1, 1.5, 0.5, 0.5,
-4.786713, -3.73196, -0.2854385, 0, 1.5, 0.5, 0.5
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
-2, -2.865606, -5.835861,
2, -2.865606, -5.835861,
-2, -2.865606, -5.835861,
-2, -3.009998, -6.113382,
0, -2.865606, -5.835861,
0, -3.009998, -6.113382,
2, -2.865606, -5.835861,
2, -3.009998, -6.113382
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
-2, -3.298783, -6.668424, 0, -0.5, 0.5, 0.5,
-2, -3.298783, -6.668424, 1, -0.5, 0.5, 0.5,
-2, -3.298783, -6.668424, 1, 1.5, 0.5, 0.5,
-2, -3.298783, -6.668424, 0, 1.5, 0.5, 0.5,
0, -3.298783, -6.668424, 0, -0.5, 0.5, 0.5,
0, -3.298783, -6.668424, 1, -0.5, 0.5, 0.5,
0, -3.298783, -6.668424, 1, 1.5, 0.5, 0.5,
0, -3.298783, -6.668424, 0, 1.5, 0.5, 0.5,
2, -3.298783, -6.668424, 0, -0.5, 0.5, 0.5,
2, -3.298783, -6.668424, 1, -0.5, 0.5, 0.5,
2, -3.298783, -6.668424, 1, 1.5, 0.5, 0.5,
2, -3.298783, -6.668424, 0, 1.5, 0.5, 0.5
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
-3.675704, -2, -5.835861,
-3.675704, 2, -5.835861,
-3.675704, -2, -5.835861,
-3.860872, -2, -6.113382,
-3.675704, -1, -5.835861,
-3.860872, -1, -6.113382,
-3.675704, 0, -5.835861,
-3.860872, 0, -6.113382,
-3.675704, 1, -5.835861,
-3.860872, 1, -6.113382,
-3.675704, 2, -5.835861,
-3.860872, 2, -6.113382
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
-4.231208, -2, -6.668424, 0, -0.5, 0.5, 0.5,
-4.231208, -2, -6.668424, 1, -0.5, 0.5, 0.5,
-4.231208, -2, -6.668424, 1, 1.5, 0.5, 0.5,
-4.231208, -2, -6.668424, 0, 1.5, 0.5, 0.5,
-4.231208, -1, -6.668424, 0, -0.5, 0.5, 0.5,
-4.231208, -1, -6.668424, 1, -0.5, 0.5, 0.5,
-4.231208, -1, -6.668424, 1, 1.5, 0.5, 0.5,
-4.231208, -1, -6.668424, 0, 1.5, 0.5, 0.5,
-4.231208, 0, -6.668424, 0, -0.5, 0.5, 0.5,
-4.231208, 0, -6.668424, 1, -0.5, 0.5, 0.5,
-4.231208, 0, -6.668424, 1, 1.5, 0.5, 0.5,
-4.231208, 0, -6.668424, 0, 1.5, 0.5, 0.5,
-4.231208, 1, -6.668424, 0, -0.5, 0.5, 0.5,
-4.231208, 1, -6.668424, 1, -0.5, 0.5, 0.5,
-4.231208, 1, -6.668424, 1, 1.5, 0.5, 0.5,
-4.231208, 1, -6.668424, 0, 1.5, 0.5, 0.5,
-4.231208, 2, -6.668424, 0, -0.5, 0.5, 0.5,
-4.231208, 2, -6.668424, 1, -0.5, 0.5, 0.5,
-4.231208, 2, -6.668424, 1, 1.5, 0.5, 0.5,
-4.231208, 2, -6.668424, 0, 1.5, 0.5, 0.5
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
-3.675704, -2.865606, -4,
-3.675704, -2.865606, 4,
-3.675704, -2.865606, -4,
-3.860872, -3.009998, -4,
-3.675704, -2.865606, -2,
-3.860872, -3.009998, -2,
-3.675704, -2.865606, 0,
-3.860872, -3.009998, 0,
-3.675704, -2.865606, 2,
-3.860872, -3.009998, 2,
-3.675704, -2.865606, 4,
-3.860872, -3.009998, 4
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
-4.231208, -3.298783, -4, 0, -0.5, 0.5, 0.5,
-4.231208, -3.298783, -4, 1, -0.5, 0.5, 0.5,
-4.231208, -3.298783, -4, 1, 1.5, 0.5, 0.5,
-4.231208, -3.298783, -4, 0, 1.5, 0.5, 0.5,
-4.231208, -3.298783, -2, 0, -0.5, 0.5, 0.5,
-4.231208, -3.298783, -2, 1, -0.5, 0.5, 0.5,
-4.231208, -3.298783, -2, 1, 1.5, 0.5, 0.5,
-4.231208, -3.298783, -2, 0, 1.5, 0.5, 0.5,
-4.231208, -3.298783, 0, 0, -0.5, 0.5, 0.5,
-4.231208, -3.298783, 0, 1, -0.5, 0.5, 0.5,
-4.231208, -3.298783, 0, 1, 1.5, 0.5, 0.5,
-4.231208, -3.298783, 0, 0, 1.5, 0.5, 0.5,
-4.231208, -3.298783, 2, 0, -0.5, 0.5, 0.5,
-4.231208, -3.298783, 2, 1, -0.5, 0.5, 0.5,
-4.231208, -3.298783, 2, 1, 1.5, 0.5, 0.5,
-4.231208, -3.298783, 2, 0, 1.5, 0.5, 0.5,
-4.231208, -3.298783, 4, 0, -0.5, 0.5, 0.5,
-4.231208, -3.298783, 4, 1, -0.5, 0.5, 0.5,
-4.231208, -3.298783, 4, 1, 1.5, 0.5, 0.5,
-4.231208, -3.298783, 4, 0, 1.5, 0.5, 0.5
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
-3.675704, -2.865606, -5.835861,
-3.675704, 2.910089, -5.835861,
-3.675704, -2.865606, 5.264984,
-3.675704, 2.910089, 5.264984,
-3.675704, -2.865606, -5.835861,
-3.675704, -2.865606, 5.264984,
-3.675704, 2.910089, -5.835861,
-3.675704, 2.910089, 5.264984,
-3.675704, -2.865606, -5.835861,
3.731027, -2.865606, -5.835861,
-3.675704, -2.865606, 5.264984,
3.731027, -2.865606, 5.264984,
-3.675704, 2.910089, -5.835861,
3.731027, 2.910089, -5.835861,
-3.675704, 2.910089, 5.264984,
3.731027, 2.910089, 5.264984,
3.731027, -2.865606, -5.835861,
3.731027, 2.910089, -5.835861,
3.731027, -2.865606, 5.264984,
3.731027, 2.910089, 5.264984,
3.731027, -2.865606, -5.835861,
3.731027, -2.865606, 5.264984,
3.731027, 2.910089, -5.835861,
3.731027, 2.910089, 5.264984
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
var radius = 7.764729;
var distance = 34.54616;
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
mvMatrix.translate( -0.0276618, -0.02224147, 0.2854385 );
mvMatrix.scale( 1.133479, 1.45357, 0.7562827 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.54616);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Triprim<-read.table("Triprim.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Triprim$V2
```

```
## Error in eval(expr, envir, enclos): object 'Triprim' not found
```

```r
y<-Triprim$V3
```

```
## Error in eval(expr, envir, enclos): object 'Triprim' not found
```

```r
z<-Triprim$V4
```

```
## Error in eval(expr, envir, enclos): object 'Triprim' not found
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
-3.567838, 1.378275, -1.269892, 0, 0, 1, 1, 1,
-3.143536, 1.477198, -0.309705, 1, 0, 0, 1, 1,
-2.914561, 1.220311, -1.196766, 1, 0, 0, 1, 1,
-2.70907, 0.03107795, -0.3336543, 1, 0, 0, 1, 1,
-2.5955, -2.222939, -2.173265, 1, 0, 0, 1, 1,
-2.382969, -0.8481267, -1.570668, 1, 0, 0, 1, 1,
-2.342449, -0.2395395, -0.9648684, 0, 0, 0, 1, 1,
-2.29639, -1.276771, -1.436272, 0, 0, 0, 1, 1,
-2.289961, 0.731472, -1.228542, 0, 0, 0, 1, 1,
-2.242583, -1.835912, -2.318468, 0, 0, 0, 1, 1,
-2.167605, -0.4102011, -3.442016, 0, 0, 0, 1, 1,
-2.118493, -1.395724, -2.25071, 0, 0, 0, 1, 1,
-2.100928, 1.494932, -2.90566, 0, 0, 0, 1, 1,
-2.091576, -1.373981, 0.08442269, 1, 1, 1, 1, 1,
-1.999923, -1.963935, -1.540627, 1, 1, 1, 1, 1,
-1.997295, 0.4936345, -0.6746194, 1, 1, 1, 1, 1,
-1.995648, 1.26716, -0.9196771, 1, 1, 1, 1, 1,
-1.972875, -0.01753115, -1.274808, 1, 1, 1, 1, 1,
-1.971656, -1.309836, -1.755381, 1, 1, 1, 1, 1,
-1.920553, 1.42237, -2.354768, 1, 1, 1, 1, 1,
-1.917405, -0.06137493, -0.2714974, 1, 1, 1, 1, 1,
-1.894698, -1.288337, -2.212361, 1, 1, 1, 1, 1,
-1.884932, 0.1103206, -2.412078, 1, 1, 1, 1, 1,
-1.877154, 1.885415, -1.383796, 1, 1, 1, 1, 1,
-1.863899, -1.316081, -1.659286, 1, 1, 1, 1, 1,
-1.849617, 0.4039534, -0.3554142, 1, 1, 1, 1, 1,
-1.831124, -0.4011758, -1.508079, 1, 1, 1, 1, 1,
-1.82827, -0.7787448, -2.323691, 1, 1, 1, 1, 1,
-1.818137, 1.924342, 0.2207641, 0, 0, 1, 1, 1,
-1.814208, -0.547787, -2.65346, 1, 0, 0, 1, 1,
-1.801535, -1.870859, -3.449613, 1, 0, 0, 1, 1,
-1.78993, -0.3343616, -1.613893, 1, 0, 0, 1, 1,
-1.76373, 0.4975781, -2.057721, 1, 0, 0, 1, 1,
-1.738075, -2.321288, -0.383302, 1, 0, 0, 1, 1,
-1.712618, 0.9079271, -0.4004783, 0, 0, 0, 1, 1,
-1.703605, 0.4117848, -2.651495, 0, 0, 0, 1, 1,
-1.678961, -0.1220526, -0.7082385, 0, 0, 0, 1, 1,
-1.669228, -0.9054471, -2.527781, 0, 0, 0, 1, 1,
-1.662533, -0.8615896, -0.1211775, 0, 0, 0, 1, 1,
-1.661536, 0.4685495, -2.826403, 0, 0, 0, 1, 1,
-1.657063, -0.7592362, -2.752404, 0, 0, 0, 1, 1,
-1.651196, -0.8147792, -2.069519, 1, 1, 1, 1, 1,
-1.642451, 1.506441, 0.5369156, 1, 1, 1, 1, 1,
-1.624534, -0.6186809, -1.593247, 1, 1, 1, 1, 1,
-1.618804, 1.69255, -2.058421, 1, 1, 1, 1, 1,
-1.604485, 1.728234, -1.716516, 1, 1, 1, 1, 1,
-1.594886, -0.485157, -1.091568, 1, 1, 1, 1, 1,
-1.576187, -0.07796907, -0.9931181, 1, 1, 1, 1, 1,
-1.55455, -0.5459802, -4.108642, 1, 1, 1, 1, 1,
-1.547481, -1.457088, -3.042485, 1, 1, 1, 1, 1,
-1.542496, 0.8443183, -1.444723, 1, 1, 1, 1, 1,
-1.534577, 0.6545348, -0.840164, 1, 1, 1, 1, 1,
-1.530021, -0.2330769, -2.589582, 1, 1, 1, 1, 1,
-1.529347, 0.9199255, 0.4182648, 1, 1, 1, 1, 1,
-1.528941, 1.248327, -1.108694, 1, 1, 1, 1, 1,
-1.524552, 0.4441619, -1.814155, 1, 1, 1, 1, 1,
-1.522941, -1.845089, -1.74491, 0, 0, 1, 1, 1,
-1.514739, -0.6683655, -1.203004, 1, 0, 0, 1, 1,
-1.491529, -0.6288291, -2.397072, 1, 0, 0, 1, 1,
-1.484579, -0.3161996, -1.949646, 1, 0, 0, 1, 1,
-1.470838, -1.066215, -0.7386367, 1, 0, 0, 1, 1,
-1.44005, -0.4147943, -2.443871, 1, 0, 0, 1, 1,
-1.41312, -1.776904, -1.351779, 0, 0, 0, 1, 1,
-1.409457, 0.1217919, -2.52126, 0, 0, 0, 1, 1,
-1.400509, -0.07362435, -0.3763011, 0, 0, 0, 1, 1,
-1.382347, -1.059122, -0.3665725, 0, 0, 0, 1, 1,
-1.376979, 0.3429427, -0.3699728, 0, 0, 0, 1, 1,
-1.376592, 0.7829025, -0.5304567, 0, 0, 0, 1, 1,
-1.373926, 0.196287, -1.275007, 0, 0, 0, 1, 1,
-1.365078, -0.4136134, -2.309079, 1, 1, 1, 1, 1,
-1.363571, -0.1526948, -1.615129, 1, 1, 1, 1, 1,
-1.360929, 0.3827627, -1.653807, 1, 1, 1, 1, 1,
-1.355248, -0.9944034, -2.75708, 1, 1, 1, 1, 1,
-1.353372, 0.04159865, -1.172045, 1, 1, 1, 1, 1,
-1.352625, 1.440488, -1.622912, 1, 1, 1, 1, 1,
-1.334701, -0.06864535, -2.171402, 1, 1, 1, 1, 1,
-1.333673, 0.1848288, -3.048514, 1, 1, 1, 1, 1,
-1.329428, -0.16577, -2.093474, 1, 1, 1, 1, 1,
-1.323127, -1.30717, -0.889396, 1, 1, 1, 1, 1,
-1.318463, -0.2072186, -1.177738, 1, 1, 1, 1, 1,
-1.312112, 0.4800467, -2.011186, 1, 1, 1, 1, 1,
-1.301885, -0.5765982, -0.609969, 1, 1, 1, 1, 1,
-1.293709, -0.9357104, -2.611596, 1, 1, 1, 1, 1,
-1.284083, 1.762329, 0.8966374, 1, 1, 1, 1, 1,
-1.268035, -0.545511, -1.324939, 0, 0, 1, 1, 1,
-1.265649, -0.8800737, -2.333173, 1, 0, 0, 1, 1,
-1.247318, 1.819175, 0.5076923, 1, 0, 0, 1, 1,
-1.241131, -0.895487, -3.07097, 1, 0, 0, 1, 1,
-1.240308, -1.155617, -3.02117, 1, 0, 0, 1, 1,
-1.234925, 0.08290605, -2.901808, 1, 0, 0, 1, 1,
-1.230938, 1.163098, -1.753847, 0, 0, 0, 1, 1,
-1.227021, 0.3290732, -1.69826, 0, 0, 0, 1, 1,
-1.224553, 0.2051688, -1.577032, 0, 0, 0, 1, 1,
-1.218948, 1.652902, 0.2715341, 0, 0, 0, 1, 1,
-1.216209, -0.6157717, -1.7563, 0, 0, 0, 1, 1,
-1.214228, -2.535582, -0.8740431, 0, 0, 0, 1, 1,
-1.213142, -1.23963, -3.104523, 0, 0, 0, 1, 1,
-1.212357, 1.737307, -0.7261518, 1, 1, 1, 1, 1,
-1.212232, 0.5630029, -2.05508, 1, 1, 1, 1, 1,
-1.21094, -0.05236939, -3.352568, 1, 1, 1, 1, 1,
-1.206146, -1.297503, -3.765674, 1, 1, 1, 1, 1,
-1.189704, -1.791073, -3.347532, 1, 1, 1, 1, 1,
-1.188917, 0.7015427, 0.2399225, 1, 1, 1, 1, 1,
-1.180562, 0.757241, -1.09394, 1, 1, 1, 1, 1,
-1.152325, 0.1835439, -0.8429999, 1, 1, 1, 1, 1,
-1.143024, -2.34092, -4.104417, 1, 1, 1, 1, 1,
-1.142699, -1.964968, -1.261197, 1, 1, 1, 1, 1,
-1.138193, 0.4927503, -0.6002207, 1, 1, 1, 1, 1,
-1.136998, 1.523562, -1.035187, 1, 1, 1, 1, 1,
-1.124488, 0.3752274, -1.860154, 1, 1, 1, 1, 1,
-1.116886, -0.6957289, -2.067673, 1, 1, 1, 1, 1,
-1.116843, -0.1512709, -1.304212, 1, 1, 1, 1, 1,
-1.111178, 0.3760011, 1.448637, 0, 0, 1, 1, 1,
-1.104725, -0.5903661, -1.851406, 1, 0, 0, 1, 1,
-1.092779, 1.798435, -2.494616, 1, 0, 0, 1, 1,
-1.091193, -0.7009212, -2.175404, 1, 0, 0, 1, 1,
-1.077672, 0.07851031, 0.01975038, 1, 0, 0, 1, 1,
-1.071058, 1.036995, -0.804661, 1, 0, 0, 1, 1,
-1.066105, -1.14539, -2.562115, 0, 0, 0, 1, 1,
-1.065361, 1.505803, 0.04568774, 0, 0, 0, 1, 1,
-1.062525, 2.733389, -0.6997834, 0, 0, 0, 1, 1,
-1.057786, -0.3861313, -3.091968, 0, 0, 0, 1, 1,
-1.057468, -1.147255, -2.712633, 0, 0, 0, 1, 1,
-1.054669, 0.3433865, -0.2366204, 0, 0, 0, 1, 1,
-1.044907, -0.4456969, -2.189117, 0, 0, 0, 1, 1,
-1.043862, -0.4715566, -3.260055, 1, 1, 1, 1, 1,
-1.04241, 1.379809, 0.6477309, 1, 1, 1, 1, 1,
-1.042225, 0.3462169, -1.454583, 1, 1, 1, 1, 1,
-1.028679, -1.519012, -3.772594, 1, 1, 1, 1, 1,
-1.026235, -1.692366, -3.342667, 1, 1, 1, 1, 1,
-1.02501, 1.985701, 1.593051, 1, 1, 1, 1, 1,
-1.016282, -2.332204, -1.77712, 1, 1, 1, 1, 1,
-1.009507, 0.6827623, -1.258198, 1, 1, 1, 1, 1,
-1.009189, 0.1087464, -1.620089, 1, 1, 1, 1, 1,
-1.007827, -1.194292, -4.472538, 1, 1, 1, 1, 1,
-1.00442, 1.172185, -0.8806448, 1, 1, 1, 1, 1,
-1.003398, 0.4181707, 0.1898476, 1, 1, 1, 1, 1,
-0.9996021, -0.754509, -2.449096, 1, 1, 1, 1, 1,
-0.9976864, 0.549224, -1.068463, 1, 1, 1, 1, 1,
-0.9953058, -0.7730393, -1.365231, 1, 1, 1, 1, 1,
-0.9906071, 0.4982844, -1.403522, 0, 0, 1, 1, 1,
-0.9880972, -0.605167, -2.658106, 1, 0, 0, 1, 1,
-0.9818777, -0.06465383, -1.866416, 1, 0, 0, 1, 1,
-0.9795244, -1.719801, -2.948365, 1, 0, 0, 1, 1,
-0.9765401, 0.3547256, -0.9951319, 1, 0, 0, 1, 1,
-0.9745022, 0.5535905, -0.2425159, 1, 0, 0, 1, 1,
-0.9669238, 0.3024065, -1.419289, 0, 0, 0, 1, 1,
-0.9643945, -0.5995343, -2.150352, 0, 0, 0, 1, 1,
-0.9605644, 0.7542687, -2.220126, 0, 0, 0, 1, 1,
-0.953223, -0.9880844, -4.065441, 0, 0, 0, 1, 1,
-0.950468, 0.05303919, -1.929049, 0, 0, 0, 1, 1,
-0.94855, -0.5635681, -3.794257, 0, 0, 0, 1, 1,
-0.9474051, -0.1494503, -3.104502, 0, 0, 0, 1, 1,
-0.9352658, -1.663236, -1.397074, 1, 1, 1, 1, 1,
-0.9352177, -1.100396, -2.914313, 1, 1, 1, 1, 1,
-0.9300171, 1.487309, -0.9652127, 1, 1, 1, 1, 1,
-0.9298226, -1.518835, -1.063972, 1, 1, 1, 1, 1,
-0.9256017, -0.7504383, -2.999393, 1, 1, 1, 1, 1,
-0.9254335, -0.8812054, -3.1678, 1, 1, 1, 1, 1,
-0.9237941, 0.2957565, -0.6098815, 1, 1, 1, 1, 1,
-0.9231111, 0.2498178, -0.1630324, 1, 1, 1, 1, 1,
-0.9222778, 1.121794, -0.4842924, 1, 1, 1, 1, 1,
-0.9210075, 1.369773, -0.03284918, 1, 1, 1, 1, 1,
-0.9169825, -0.5161597, -2.974438, 1, 1, 1, 1, 1,
-0.905105, 0.6282395, -0.7264394, 1, 1, 1, 1, 1,
-0.9047, -1.174192, -3.391376, 1, 1, 1, 1, 1,
-0.8969301, 1.051827, 0.7665235, 1, 1, 1, 1, 1,
-0.8958678, -0.2471386, -1.069561, 1, 1, 1, 1, 1,
-0.885781, 0.1898964, 0.2826218, 0, 0, 1, 1, 1,
-0.8846087, -1.49633, -1.727868, 1, 0, 0, 1, 1,
-0.8802525, -0.9873917, -1.623456, 1, 0, 0, 1, 1,
-0.8766139, -1.396314, -1.430921, 1, 0, 0, 1, 1,
-0.8762822, -0.1170427, -1.185425, 1, 0, 0, 1, 1,
-0.8696344, -1.19048, -2.662436, 1, 0, 0, 1, 1,
-0.8660058, 0.04761675, -0.1435595, 0, 0, 0, 1, 1,
-0.8654521, 0.97445, -0.2215399, 0, 0, 0, 1, 1,
-0.8640293, -1.046041, -4.038865, 0, 0, 0, 1, 1,
-0.8601776, 2.10723, -1.184336, 0, 0, 0, 1, 1,
-0.8562284, 0.4196186, -0.6531791, 0, 0, 0, 1, 1,
-0.8524244, 2.77595, -1.025434, 0, 0, 0, 1, 1,
-0.8490868, 0.7324524, -0.9510928, 0, 0, 0, 1, 1,
-0.8453154, 0.1001955, -1.506693, 1, 1, 1, 1, 1,
-0.832747, 0.02092763, -0.7496136, 1, 1, 1, 1, 1,
-0.831638, 1.49041, -0.3988488, 1, 1, 1, 1, 1,
-0.8277947, -1.210788, -3.205126, 1, 1, 1, 1, 1,
-0.8272341, -0.6399572, -1.870016, 1, 1, 1, 1, 1,
-0.8239703, 1.827484, -0.03283219, 1, 1, 1, 1, 1,
-0.8216846, 0.7544381, -0.94039, 1, 1, 1, 1, 1,
-0.8211014, 1.02786, 1.01193, 1, 1, 1, 1, 1,
-0.8166916, 0.5439025, -2.189249, 1, 1, 1, 1, 1,
-0.8148987, 0.8891842, -0.8793579, 1, 1, 1, 1, 1,
-0.8107228, -1.902863, -1.873791, 1, 1, 1, 1, 1,
-0.8081055, -2.489789, -2.612496, 1, 1, 1, 1, 1,
-0.8075929, -1.094938, -3.854742, 1, 1, 1, 1, 1,
-0.8070852, 0.3711513, -1.802839, 1, 1, 1, 1, 1,
-0.7993494, 1.001565, -1.471351, 1, 1, 1, 1, 1,
-0.7888081, -1.075366, -2.707465, 0, 0, 1, 1, 1,
-0.7881674, 0.2224808, -2.642437, 1, 0, 0, 1, 1,
-0.7876873, 1.081318, 0.2119234, 1, 0, 0, 1, 1,
-0.7766335, 0.7961861, -0.4341655, 1, 0, 0, 1, 1,
-0.7751061, 0.3419448, -0.6750755, 1, 0, 0, 1, 1,
-0.77268, 0.4629731, -1.661179, 1, 0, 0, 1, 1,
-0.7701496, -1.3986, -1.902478, 0, 0, 0, 1, 1,
-0.7699265, -0.6762213, -2.429287, 0, 0, 0, 1, 1,
-0.7661036, 0.01262552, -2.417824, 0, 0, 0, 1, 1,
-0.7640721, 0.4040519, -1.382377, 0, 0, 0, 1, 1,
-0.7639915, -0.2721758, -3.333408, 0, 0, 0, 1, 1,
-0.7611304, 1.438167, -0.6004396, 0, 0, 0, 1, 1,
-0.7550184, 0.1075278, -0.998028, 0, 0, 0, 1, 1,
-0.749247, 0.8847725, -2.401869, 1, 1, 1, 1, 1,
-0.7439036, -0.4698547, -2.168947, 1, 1, 1, 1, 1,
-0.7400749, 1.12362, -0.4092558, 1, 1, 1, 1, 1,
-0.7307154, -0.3203508, -3.395099, 1, 1, 1, 1, 1,
-0.7285487, -1.178769, -2.796147, 1, 1, 1, 1, 1,
-0.7277369, 1.110554, -1.665953, 1, 1, 1, 1, 1,
-0.7258574, -1.782022, -2.645507, 1, 1, 1, 1, 1,
-0.7232075, -0.3771094, -3.082252, 1, 1, 1, 1, 1,
-0.7222801, 0.5271701, -0.7754213, 1, 1, 1, 1, 1,
-0.7198819, 0.004903827, -1.510547, 1, 1, 1, 1, 1,
-0.7198728, -0.1937165, -3.208386, 1, 1, 1, 1, 1,
-0.7126487, 0.4660905, -1.102562, 1, 1, 1, 1, 1,
-0.7118304, -0.7379719, -1.33106, 1, 1, 1, 1, 1,
-0.7114884, -0.4753435, -1.36841, 1, 1, 1, 1, 1,
-0.7076452, 0.02896701, -2.64167, 1, 1, 1, 1, 1,
-0.7007149, -0.8249494, -4.880084, 0, 0, 1, 1, 1,
-0.7001017, -0.3730092, -3.612289, 1, 0, 0, 1, 1,
-0.6947445, -1.194606, -5.674198, 1, 0, 0, 1, 1,
-0.6931275, 0.5027308, -0.45506, 1, 0, 0, 1, 1,
-0.6920958, 0.5170296, -3.361224, 1, 0, 0, 1, 1,
-0.6915253, 0.8008087, -2.051372, 1, 0, 0, 1, 1,
-0.6883966, 0.0455837, -1.683544, 0, 0, 0, 1, 1,
-0.6801474, -0.8127146, -0.8577477, 0, 0, 0, 1, 1,
-0.6797888, 0.01283672, -2.100467, 0, 0, 0, 1, 1,
-0.6788045, 0.282947, -1.225545, 0, 0, 0, 1, 1,
-0.677182, 1.65469, 1.205815, 0, 0, 0, 1, 1,
-0.6769292, -0.1233484, -3.073602, 0, 0, 0, 1, 1,
-0.6746987, -2.347465, -1.186249, 0, 0, 0, 1, 1,
-0.6710184, 0.3544231, 0.5386554, 1, 1, 1, 1, 1,
-0.6706815, 1.101452, -1.366172, 1, 1, 1, 1, 1,
-0.6680087, 0.6299272, -1.963141, 1, 1, 1, 1, 1,
-0.6657821, 0.4658143, -1.510149, 1, 1, 1, 1, 1,
-0.6651863, -0.6659439, -2.414673, 1, 1, 1, 1, 1,
-0.6620387, -1.346402, -1.986329, 1, 1, 1, 1, 1,
-0.6602123, -1.132333, -2.443196, 1, 1, 1, 1, 1,
-0.655076, 0.224589, -1.472399, 1, 1, 1, 1, 1,
-0.6547447, 0.5874078, -0.4757188, 1, 1, 1, 1, 1,
-0.6536822, -0.02397765, 0.4235429, 1, 1, 1, 1, 1,
-0.6523283, 0.5969863, -0.3368981, 1, 1, 1, 1, 1,
-0.6510562, -1.312206, -0.3179487, 1, 1, 1, 1, 1,
-0.6493396, -0.4763208, -2.42267, 1, 1, 1, 1, 1,
-0.6475961, -0.7945812, -0.1511141, 1, 1, 1, 1, 1,
-0.6362088, -0.3200104, -1.146166, 1, 1, 1, 1, 1,
-0.6353065, 0.5752013, -0.5143098, 0, 0, 1, 1, 1,
-0.635202, -0.6187178, -3.322968, 1, 0, 0, 1, 1,
-0.6312496, 0.6817104, -2.21225, 1, 0, 0, 1, 1,
-0.6270166, 0.3242805, -0.7887018, 1, 0, 0, 1, 1,
-0.623662, 0.9976115, -1.105198, 1, 0, 0, 1, 1,
-0.6233599, 1.013781, -2.565161, 1, 0, 0, 1, 1,
-0.6231047, 2.009579, 0.1994921, 0, 0, 0, 1, 1,
-0.6178865, 0.7654842, -0.249051, 0, 0, 0, 1, 1,
-0.6158013, 0.3913988, -1.136623, 0, 0, 0, 1, 1,
-0.6131476, -0.6838817, -1.680301, 0, 0, 0, 1, 1,
-0.6103143, 1.136529, -2.056506, 0, 0, 0, 1, 1,
-0.6076224, -1.1308, -3.015435, 0, 0, 0, 1, 1,
-0.6063752, 1.989176, -0.5680415, 0, 0, 0, 1, 1,
-0.6063227, 0.02160283, -1.780155, 1, 1, 1, 1, 1,
-0.605446, 0.6533851, 0.5036281, 1, 1, 1, 1, 1,
-0.6053748, -0.4425947, -2.134823, 1, 1, 1, 1, 1,
-0.6053336, -0.6515195, -2.507392, 1, 1, 1, 1, 1,
-0.6029432, 0.829271, -0.4649795, 1, 1, 1, 1, 1,
-0.6018501, 0.4222041, -0.5785731, 1, 1, 1, 1, 1,
-0.6006505, 1.367681, -2.215323, 1, 1, 1, 1, 1,
-0.5974615, -0.825663, -2.446236, 1, 1, 1, 1, 1,
-0.5889204, -0.15104, -0.7921042, 1, 1, 1, 1, 1,
-0.5862045, 0.1394572, -0.07985742, 1, 1, 1, 1, 1,
-0.5854035, 0.3912314, -1.458586, 1, 1, 1, 1, 1,
-0.5824641, -0.5732895, -2.268332, 1, 1, 1, 1, 1,
-0.5812386, 0.3802368, -0.1838151, 1, 1, 1, 1, 1,
-0.5809281, 0.2323709, -1.935137, 1, 1, 1, 1, 1,
-0.571369, 0.6867782, -0.6037788, 1, 1, 1, 1, 1,
-0.5640495, 0.6441928, -0.6603079, 0, 0, 1, 1, 1,
-0.5639713, -0.7497442, -1.314372, 1, 0, 0, 1, 1,
-0.5636854, 1.028783, -1.339515, 1, 0, 0, 1, 1,
-0.5600343, -0.3226802, -0.782522, 1, 0, 0, 1, 1,
-0.557528, -1.91326, -3.472666, 1, 0, 0, 1, 1,
-0.5537625, 0.3413804, -1.107668, 1, 0, 0, 1, 1,
-0.5533379, -0.6790124, -3.696814, 0, 0, 0, 1, 1,
-0.5532798, 0.2269973, -1.322294, 0, 0, 0, 1, 1,
-0.5523895, 1.645286, 2.584471, 0, 0, 0, 1, 1,
-0.5428694, 0.3265835, -1.792589, 0, 0, 0, 1, 1,
-0.5401491, 0.713973, -0.02987392, 0, 0, 0, 1, 1,
-0.5361215, -1.023233, -2.886383, 0, 0, 0, 1, 1,
-0.535278, -1.284323, -3.605362, 0, 0, 0, 1, 1,
-0.534253, -2.088627, -3.023072, 1, 1, 1, 1, 1,
-0.533827, -1.822846, -0.3301941, 1, 1, 1, 1, 1,
-0.5290548, -0.2292138, -1.896945, 1, 1, 1, 1, 1,
-0.5275735, -0.225196, -1.45734, 1, 1, 1, 1, 1,
-0.525412, 1.306741, -1.47929, 1, 1, 1, 1, 1,
-0.5246908, 1.125977, 0.3382933, 1, 1, 1, 1, 1,
-0.5228049, -0.03965817, -1.587399, 1, 1, 1, 1, 1,
-0.5179, 1.021666, -1.158145, 1, 1, 1, 1, 1,
-0.5173466, -0.09025908, -1.191078, 1, 1, 1, 1, 1,
-0.5146605, 0.3019052, -0.856279, 1, 1, 1, 1, 1,
-0.5097488, 0.3467097, -3.064476, 1, 1, 1, 1, 1,
-0.5035918, -1.277219, -4.778444, 1, 1, 1, 1, 1,
-0.5024823, 0.8816661, -0.7604558, 1, 1, 1, 1, 1,
-0.5024422, 1.276415, -0.1230608, 1, 1, 1, 1, 1,
-0.5017542, 0.2975188, -1.265198, 1, 1, 1, 1, 1,
-0.5008549, 1.630272, -0.01062305, 0, 0, 1, 1, 1,
-0.5001326, 0.7871739, 0.9621755, 1, 0, 0, 1, 1,
-0.4997995, 0.9484038, -2.858133, 1, 0, 0, 1, 1,
-0.4994954, 0.5477448, -0.9611734, 1, 0, 0, 1, 1,
-0.4994165, -1.304081, -1.25463, 1, 0, 0, 1, 1,
-0.4981367, -1.502162, -3.358521, 1, 0, 0, 1, 1,
-0.4968249, 1.652001, -1.583201, 0, 0, 0, 1, 1,
-0.4957927, -0.1572015, -1.919399, 0, 0, 0, 1, 1,
-0.4934167, 1.285597, -0.2134535, 0, 0, 0, 1, 1,
-0.4927141, -1.32068, -1.872699, 0, 0, 0, 1, 1,
-0.4919367, 0.6892506, 1.134369, 0, 0, 0, 1, 1,
-0.4898538, -1.730312, -2.73878, 0, 0, 0, 1, 1,
-0.4848567, -0.6581265, -3.646148, 0, 0, 0, 1, 1,
-0.4811475, 0.4910378, -0.4078641, 1, 1, 1, 1, 1,
-0.4808482, 1.568638, -0.07959382, 1, 1, 1, 1, 1,
-0.4805426, 1.855189, 0.04793808, 1, 1, 1, 1, 1,
-0.4756684, 0.1670071, -1.827335, 1, 1, 1, 1, 1,
-0.4733495, -0.3967142, -2.164878, 1, 1, 1, 1, 1,
-0.4665806, 0.8237826, -1.838968, 1, 1, 1, 1, 1,
-0.466534, 0.2236694, 0.04583714, 1, 1, 1, 1, 1,
-0.4612492, -2.230735, -3.575067, 1, 1, 1, 1, 1,
-0.4591237, -0.4153059, -3.011304, 1, 1, 1, 1, 1,
-0.4522616, -0.2602152, -3.129537, 1, 1, 1, 1, 1,
-0.4515652, 0.3632204, 0.9529644, 1, 1, 1, 1, 1,
-0.4507462, -1.558878, -4.374637, 1, 1, 1, 1, 1,
-0.4497662, 2.0156, 1.711594, 1, 1, 1, 1, 1,
-0.4448518, 0.04174973, -1.11554, 1, 1, 1, 1, 1,
-0.4401391, -0.04154531, -2.194463, 1, 1, 1, 1, 1,
-0.4398825, 1.683273, 0.1213119, 0, 0, 1, 1, 1,
-0.4365788, -1.645347, -2.696324, 1, 0, 0, 1, 1,
-0.4364054, -1.282475, -2.098603, 1, 0, 0, 1, 1,
-0.4351037, 0.4013631, 0.1716743, 1, 0, 0, 1, 1,
-0.4348706, -0.4428656, -3.521001, 1, 0, 0, 1, 1,
-0.4343189, 0.6297485, -1.316462, 1, 0, 0, 1, 1,
-0.4326955, 0.7032419, -1.739771, 0, 0, 0, 1, 1,
-0.4289066, 0.341168, -1.806497, 0, 0, 0, 1, 1,
-0.4283697, -0.6963335, -4.109589, 0, 0, 0, 1, 1,
-0.4234162, 0.3902842, -1.482156, 0, 0, 0, 1, 1,
-0.4198227, 0.9816507, 0.2605083, 0, 0, 0, 1, 1,
-0.4185049, 1.982615, 0.4749441, 0, 0, 0, 1, 1,
-0.4179813, 0.3213691, -1.315678, 0, 0, 0, 1, 1,
-0.4171415, 1.119149, -1.29008, 1, 1, 1, 1, 1,
-0.4151138, -0.0245908, -1.299116, 1, 1, 1, 1, 1,
-0.4144941, -0.1545666, -2.523831, 1, 1, 1, 1, 1,
-0.4142565, 0.6719592, -0.613802, 1, 1, 1, 1, 1,
-0.413152, 0.5328766, -0.2864006, 1, 1, 1, 1, 1,
-0.4113685, 0.8790919, -0.2398119, 1, 1, 1, 1, 1,
-0.4109667, -0.4073299, -2.883408, 1, 1, 1, 1, 1,
-0.4061217, 0.6623015, 0.07108841, 1, 1, 1, 1, 1,
-0.4018002, -0.119383, -3.699944, 1, 1, 1, 1, 1,
-0.3986537, -1.902731, -4.580021, 1, 1, 1, 1, 1,
-0.3924874, -1.622898, -1.616596, 1, 1, 1, 1, 1,
-0.3924662, 0.5282446, -0.4582202, 1, 1, 1, 1, 1,
-0.3922494, 0.1923752, -0.2734069, 1, 1, 1, 1, 1,
-0.3910027, -0.4063901, -1.873327, 1, 1, 1, 1, 1,
-0.3899747, 0.5048994, -0.441828, 1, 1, 1, 1, 1,
-0.3898587, -0.7107923, -2.385381, 0, 0, 1, 1, 1,
-0.3852183, 1.314706, 0.1194203, 1, 0, 0, 1, 1,
-0.3848777, -0.9614719, -1.604592, 1, 0, 0, 1, 1,
-0.3844991, 0.1955311, -1.554072, 1, 0, 0, 1, 1,
-0.3817624, 0.6902006, -0.5561491, 1, 0, 0, 1, 1,
-0.3787154, 0.5480735, 0.5841672, 1, 0, 0, 1, 1,
-0.3667434, -0.6096355, -3.086124, 0, 0, 0, 1, 1,
-0.3630134, 1.339131, 1.1499, 0, 0, 0, 1, 1,
-0.3619743, 0.2643182, -0.4042453, 0, 0, 0, 1, 1,
-0.3613828, 0.4085851, -0.1482128, 0, 0, 0, 1, 1,
-0.359493, 2.252832, 1.334237, 0, 0, 0, 1, 1,
-0.3585384, -0.6534134, -2.715138, 0, 0, 0, 1, 1,
-0.3576902, 0.1656169, -0.1765728, 0, 0, 0, 1, 1,
-0.3575701, -1.102419, -2.040801, 1, 1, 1, 1, 1,
-0.3571808, 1.91949, -1.511249, 1, 1, 1, 1, 1,
-0.352814, 0.2818381, -1.523895, 1, 1, 1, 1, 1,
-0.350921, 1.550541, -0.6173401, 1, 1, 1, 1, 1,
-0.3474832, 0.4689146, -0.1919056, 1, 1, 1, 1, 1,
-0.3467875, -0.4618032, -2.610824, 1, 1, 1, 1, 1,
-0.3445183, 0.02028763, -3.502838, 1, 1, 1, 1, 1,
-0.3434734, -0.6221709, -1.544091, 1, 1, 1, 1, 1,
-0.3415166, -0.5913807, -4.064278, 1, 1, 1, 1, 1,
-0.3401453, -0.006940036, -1.279216, 1, 1, 1, 1, 1,
-0.3399991, 0.4813621, -0.6380804, 1, 1, 1, 1, 1,
-0.3388483, 2.246704, -1.376482, 1, 1, 1, 1, 1,
-0.3360448, 0.2825167, 0.9032072, 1, 1, 1, 1, 1,
-0.3349716, -0.3038222, -1.293768, 1, 1, 1, 1, 1,
-0.333184, 0.5393842, 1.993705, 1, 1, 1, 1, 1,
-0.3331143, -2.153451, -3.824389, 0, 0, 1, 1, 1,
-0.3318646, -0.07411511, -2.614625, 1, 0, 0, 1, 1,
-0.3309489, 2.417543, -1.573314, 1, 0, 0, 1, 1,
-0.3303098, 0.5186118, 0.2029595, 1, 0, 0, 1, 1,
-0.3303009, 1.814576, -1.289124, 1, 0, 0, 1, 1,
-0.3283672, -1.99298, -4.304959, 1, 0, 0, 1, 1,
-0.3264206, 1.9958, 0.8209045, 0, 0, 0, 1, 1,
-0.3237888, 0.2314804, 0.3370669, 0, 0, 0, 1, 1,
-0.3205243, 0.1708004, -1.847123, 0, 0, 0, 1, 1,
-0.315557, 0.75687, 1.094176, 0, 0, 0, 1, 1,
-0.311403, 0.517616, 0.1279039, 0, 0, 0, 1, 1,
-0.3107858, -0.4141339, -3.654388, 0, 0, 0, 1, 1,
-0.3079878, -0.2296515, -2.872276, 0, 0, 0, 1, 1,
-0.3075059, -0.6595073, -3.561833, 1, 1, 1, 1, 1,
-0.3074485, 0.8930903, -0.6221546, 1, 1, 1, 1, 1,
-0.3027334, -0.7733329, -2.456869, 1, 1, 1, 1, 1,
-0.2926756, -1.187841, -1.604917, 1, 1, 1, 1, 1,
-0.2870944, -1.757215, -4.290389, 1, 1, 1, 1, 1,
-0.2863697, 0.2950583, -1.725902, 1, 1, 1, 1, 1,
-0.2839128, -0.08721191, -2.434029, 1, 1, 1, 1, 1,
-0.2768058, -1.138871, -2.226681, 1, 1, 1, 1, 1,
-0.2669397, 2.108727, 0.226757, 1, 1, 1, 1, 1,
-0.2644368, -0.2866208, -3.372139, 1, 1, 1, 1, 1,
-0.264413, 0.3082389, -0.7732848, 1, 1, 1, 1, 1,
-0.260096, 0.2705896, -1.402734, 1, 1, 1, 1, 1,
-0.2584174, -0.024672, -1.315637, 1, 1, 1, 1, 1,
-0.2541224, -0.266365, -2.330378, 1, 1, 1, 1, 1,
-0.2528664, 0.758949, -0.4770021, 1, 1, 1, 1, 1,
-0.2502372, 1.449525, 0.5836318, 0, 0, 1, 1, 1,
-0.2495951, 0.6436977, 0.2511751, 1, 0, 0, 1, 1,
-0.2469244, -2.031962, -2.25772, 1, 0, 0, 1, 1,
-0.2444426, 1.133385, 0.7079478, 1, 0, 0, 1, 1,
-0.2412836, -1.179388, -3.32033, 1, 0, 0, 1, 1,
-0.2330549, -0.5817059, -1.754559, 1, 0, 0, 1, 1,
-0.225775, 1.079356, -3.040764, 0, 0, 0, 1, 1,
-0.2238677, -1.418151, -3.389424, 0, 0, 0, 1, 1,
-0.2238065, 1.265174, -1.153129, 0, 0, 0, 1, 1,
-0.2206738, -0.9416713, -0.1259397, 0, 0, 0, 1, 1,
-0.2204585, -0.1216708, -1.825856, 0, 0, 0, 1, 1,
-0.2190212, 0.1675366, -0.1831782, 0, 0, 0, 1, 1,
-0.2177824, -0.136356, -1.894916, 0, 0, 0, 1, 1,
-0.2163279, -0.4336199, -3.146532, 1, 1, 1, 1, 1,
-0.2112372, -0.1494852, -0.7417125, 1, 1, 1, 1, 1,
-0.2090942, 0.5541818, -1.366191, 1, 1, 1, 1, 1,
-0.2070115, -0.06926332, -1.534722, 1, 1, 1, 1, 1,
-0.2017963, 0.086928, -1.14539, 1, 1, 1, 1, 1,
-0.1964889, -1.466782, -0.9522772, 1, 1, 1, 1, 1,
-0.1964353, -1.453434, -2.948337, 1, 1, 1, 1, 1,
-0.1946253, -0.3080336, -1.956932, 1, 1, 1, 1, 1,
-0.1938447, 0.905176, 0.5092003, 1, 1, 1, 1, 1,
-0.1934135, 1.567432, -1.7031, 1, 1, 1, 1, 1,
-0.1917822, -1.41404, -1.407009, 1, 1, 1, 1, 1,
-0.1868726, -0.06517911, -2.516167, 1, 1, 1, 1, 1,
-0.1865702, -1.718301, -2.977016, 1, 1, 1, 1, 1,
-0.183353, -0.867053, -3.86861, 1, 1, 1, 1, 1,
-0.1823098, -0.658881, -2.297663, 1, 1, 1, 1, 1,
-0.1812822, 0.2542585, -1.209225, 0, 0, 1, 1, 1,
-0.1780855, -2.450229, -1.958679, 1, 0, 0, 1, 1,
-0.1760174, 0.7855376, 0.3049439, 1, 0, 0, 1, 1,
-0.1755594, -1.062844, -3.938294, 1, 0, 0, 1, 1,
-0.1715772, -1.01739, -5.617576, 1, 0, 0, 1, 1,
-0.1706935, -0.1239731, -2.796754, 1, 0, 0, 1, 1,
-0.168384, 1.798486, -0.3595745, 0, 0, 0, 1, 1,
-0.1662666, 0.6744877, -1.653864, 0, 0, 0, 1, 1,
-0.1659696, -0.6557932, -3.877368, 0, 0, 0, 1, 1,
-0.164252, -1.64196, -3.725853, 0, 0, 0, 1, 1,
-0.1639755, 0.8113036, 0.6649505, 0, 0, 0, 1, 1,
-0.1545652, -1.771261, -3.644321, 0, 0, 0, 1, 1,
-0.1530503, -0.9833364, -3.976166, 0, 0, 0, 1, 1,
-0.1515888, -2.355689, -3.062714, 1, 1, 1, 1, 1,
-0.1511829, 0.3049903, -0.8450965, 1, 1, 1, 1, 1,
-0.1510761, 0.04376599, -0.6834517, 1, 1, 1, 1, 1,
-0.1509329, 0.2415402, 0.1010912, 1, 1, 1, 1, 1,
-0.1491036, 1.963225, -1.457591, 1, 1, 1, 1, 1,
-0.1474102, 0.6157767, 0.1267938, 1, 1, 1, 1, 1,
-0.1420051, -2.199081, -2.691025, 1, 1, 1, 1, 1,
-0.1410653, -0.6223827, -3.452722, 1, 1, 1, 1, 1,
-0.1397978, -0.3706423, -2.413423, 1, 1, 1, 1, 1,
-0.1380379, -1.173303, -4.821327, 1, 1, 1, 1, 1,
-0.1358796, 1.159653, -1.10104, 1, 1, 1, 1, 1,
-0.1355088, 0.5592375, -1.368116, 1, 1, 1, 1, 1,
-0.1335321, -2.170465, -2.226788, 1, 1, 1, 1, 1,
-0.1334535, -1.32053, -3.955151, 1, 1, 1, 1, 1,
-0.1295913, 0.7636284, -1.605778, 1, 1, 1, 1, 1,
-0.1293999, 0.9532561, 1.67435, 0, 0, 1, 1, 1,
-0.1272103, 0.5736271, -1.756599, 1, 0, 0, 1, 1,
-0.1241775, -0.2331346, -1.849928, 1, 0, 0, 1, 1,
-0.1195471, -0.1676689, -2.480661, 1, 0, 0, 1, 1,
-0.1129145, 0.4922602, -0.485706, 1, 0, 0, 1, 1,
-0.110026, -1.179836, -3.153617, 1, 0, 0, 1, 1,
-0.1083649, 0.9524101, 0.4522778, 0, 0, 0, 1, 1,
-0.1069816, -0.5385872, -5.096278, 0, 0, 0, 1, 1,
-0.1048543, -0.5621256, -2.555472, 0, 0, 0, 1, 1,
-0.1040031, -0.9000224, -5.187964, 0, 0, 0, 1, 1,
-0.09932854, 0.09111175, -1.794085, 0, 0, 0, 1, 1,
-0.09851231, -0.08109051, -2.619219, 0, 0, 0, 1, 1,
-0.09522423, 0.2652256, -0.7501472, 0, 0, 0, 1, 1,
-0.09521564, -0.908308, -2.757968, 1, 1, 1, 1, 1,
-0.0917569, -0.750483, -0.984694, 1, 1, 1, 1, 1,
-0.08973809, -1.508945, -3.692363, 1, 1, 1, 1, 1,
-0.08929649, 0.4632376, -0.5818192, 1, 1, 1, 1, 1,
-0.08883943, -0.2590442, -1.707255, 1, 1, 1, 1, 1,
-0.08686651, 1.984625, -2.172715, 1, 1, 1, 1, 1,
-0.08400302, -0.8553579, -2.006544, 1, 1, 1, 1, 1,
-0.08198012, 1.30193, -1.402787, 1, 1, 1, 1, 1,
-0.07873939, 0.1093342, 0.2832983, 1, 1, 1, 1, 1,
-0.07771262, -0.2579673, -2.275359, 1, 1, 1, 1, 1,
-0.07223118, 0.3613241, -0.2345802, 1, 1, 1, 1, 1,
-0.06914017, -0.2312944, -3.065766, 1, 1, 1, 1, 1,
-0.06031668, -0.01386013, -1.84585, 1, 1, 1, 1, 1,
-0.05967817, -0.1972188, -3.051424, 1, 1, 1, 1, 1,
-0.0562138, 1.422941, -0.6197079, 1, 1, 1, 1, 1,
-0.05533672, 1.056297, -0.3303168, 0, 0, 1, 1, 1,
-0.05517064, 0.07500613, -0.7435474, 1, 0, 0, 1, 1,
-0.05467258, 0.843682, -0.918564, 1, 0, 0, 1, 1,
-0.05294198, -1.821403, -4.381953, 1, 0, 0, 1, 1,
-0.05165248, -0.3450291, -2.904804, 1, 0, 0, 1, 1,
-0.05146105, 2.332527, 1.173144, 1, 0, 0, 1, 1,
-0.04791604, -0.1018866, -3.612695, 0, 0, 0, 1, 1,
-0.04770711, -0.2797805, -2.185718, 0, 0, 0, 1, 1,
-0.04709538, -0.3933601, -2.575668, 0, 0, 0, 1, 1,
-0.04258752, -1.23183, -3.434086, 0, 0, 0, 1, 1,
-0.04229395, 0.2048022, -1.104672, 0, 0, 0, 1, 1,
-0.0422889, 0.5087913, 1.855999, 0, 0, 0, 1, 1,
-0.03923496, -1.549874, -3.754527, 0, 0, 0, 1, 1,
-0.02897441, 0.4438447, -1.797579, 1, 1, 1, 1, 1,
-0.0282687, -0.3074633, -5.580162, 1, 1, 1, 1, 1,
-0.02816289, 0.1062732, 0.8058299, 1, 1, 1, 1, 1,
-0.02674083, -0.6896586, -2.549252, 1, 1, 1, 1, 1,
-0.02655879, 0.6713656, 0.7799034, 1, 1, 1, 1, 1,
-0.02523344, -1.074883, -1.868244, 1, 1, 1, 1, 1,
-0.02456496, -0.9460622, -0.5863898, 1, 1, 1, 1, 1,
-0.02419519, 1.565477, 0.5509518, 1, 1, 1, 1, 1,
-0.02252102, -0.1096551, -2.088416, 1, 1, 1, 1, 1,
-0.02104615, -0.6334883, -2.654504, 1, 1, 1, 1, 1,
-0.01639192, -0.4276175, -3.064056, 1, 1, 1, 1, 1,
-0.01589634, 0.3470604, -0.8859911, 1, 1, 1, 1, 1,
-0.00986478, 0.6855777, -0.5243968, 1, 1, 1, 1, 1,
-0.008286399, -1.503204, -4.355531, 1, 1, 1, 1, 1,
-0.0059205, -0.6024991, -4.347362, 1, 1, 1, 1, 1,
-0.005886491, -0.1925579, -1.61797, 0, 0, 1, 1, 1,
-0.005586858, -1.718376, -2.960956, 1, 0, 0, 1, 1,
-0.00407401, -0.2507026, -2.341927, 1, 0, 0, 1, 1,
-0.003305227, 1.031106, -2.17324, 1, 0, 0, 1, 1,
0.00859063, 0.9625408, 0.4184055, 1, 0, 0, 1, 1,
0.009094931, -1.199013, 2.312638, 1, 0, 0, 1, 1,
0.01171491, -0.4145909, 2.764502, 0, 0, 0, 1, 1,
0.0122817, -0.8685186, 3.212409, 0, 0, 0, 1, 1,
0.01430738, 0.7675908, 2.678406, 0, 0, 0, 1, 1,
0.01566922, 1.040088, 1.104184, 0, 0, 0, 1, 1,
0.01702141, 1.745229, -0.454744, 0, 0, 0, 1, 1,
0.01770377, 0.5177703, -0.6850784, 0, 0, 0, 1, 1,
0.01803027, 0.9328653, 0.287185, 0, 0, 0, 1, 1,
0.01933531, 0.9913567, 0.7583403, 1, 1, 1, 1, 1,
0.02053244, -0.7180071, 1.37825, 1, 1, 1, 1, 1,
0.02238278, 2.286979, 1.537861, 1, 1, 1, 1, 1,
0.02350168, -0.7097812, 2.675008, 1, 1, 1, 1, 1,
0.03852237, -1.054114, 3.756168, 1, 1, 1, 1, 1,
0.03883274, 0.2515143, 0.5826297, 1, 1, 1, 1, 1,
0.04229111, -0.6101424, 3.66205, 1, 1, 1, 1, 1,
0.04278509, 0.5889628, -0.3950547, 1, 1, 1, 1, 1,
0.04723821, -0.9273137, 3.57478, 1, 1, 1, 1, 1,
0.05227169, 0.5742002, -0.8711563, 1, 1, 1, 1, 1,
0.05247735, -0.5260844, 3.234509, 1, 1, 1, 1, 1,
0.05469877, 0.155488, 1.0629, 1, 1, 1, 1, 1,
0.06000569, -0.8183284, 2.55435, 1, 1, 1, 1, 1,
0.06001094, 0.1463335, 0.5387247, 1, 1, 1, 1, 1,
0.06033375, 1.117402, -0.04237103, 1, 1, 1, 1, 1,
0.06124378, -1.110394, 2.5587, 0, 0, 1, 1, 1,
0.0652348, -0.3102473, 2.392761, 1, 0, 0, 1, 1,
0.06976057, -0.9344693, 1.680383, 1, 0, 0, 1, 1,
0.06992078, -0.5775236, 4.247699, 1, 0, 0, 1, 1,
0.07249051, 1.466115, -1.7285, 1, 0, 0, 1, 1,
0.07307944, 0.3720504, 1.973445, 1, 0, 0, 1, 1,
0.07611097, -0.3087431, 2.156261, 0, 0, 0, 1, 1,
0.08174897, -0.1168098, 3.143652, 0, 0, 0, 1, 1,
0.08290458, 1.60106, -1.583726, 0, 0, 0, 1, 1,
0.08466619, 1.017367, 0.09120189, 0, 0, 0, 1, 1,
0.08822512, 0.8626006, -1.093468, 0, 0, 0, 1, 1,
0.09005116, 0.04257504, 1.543417, 0, 0, 0, 1, 1,
0.0927446, 0.680365, 1.359245, 0, 0, 0, 1, 1,
0.09468777, 1.246547, 0.2505537, 1, 1, 1, 1, 1,
0.09597115, 0.477761, -0.451675, 1, 1, 1, 1, 1,
0.097143, 1.366392, 0.9977784, 1, 1, 1, 1, 1,
0.09903517, 1.79085, -0.3775783, 1, 1, 1, 1, 1,
0.1020723, -0.6164111, 4.061102, 1, 1, 1, 1, 1,
0.1036635, 0.1063207, 0.779695, 1, 1, 1, 1, 1,
0.1088889, -0.1906928, 0.1765414, 1, 1, 1, 1, 1,
0.1142825, -0.9294902, 3.480133, 1, 1, 1, 1, 1,
0.1145031, 0.05296388, 2.718482, 1, 1, 1, 1, 1,
0.1170792, -0.916554, 4.282335, 1, 1, 1, 1, 1,
0.1176322, 0.8623795, -1.022696, 1, 1, 1, 1, 1,
0.12156, -1.160738, 3.362454, 1, 1, 1, 1, 1,
0.127557, -1.109908, 1.704529, 1, 1, 1, 1, 1,
0.133112, 0.1404562, 1.760996, 1, 1, 1, 1, 1,
0.1420472, 0.5322788, -0.7352003, 1, 1, 1, 1, 1,
0.1430034, -1.601905, 2.862635, 0, 0, 1, 1, 1,
0.1503546, 0.8203002, 1.011967, 1, 0, 0, 1, 1,
0.1568392, 0.4918231, 0.7681957, 1, 0, 0, 1, 1,
0.1617955, 0.182363, 0.6316551, 1, 0, 0, 1, 1,
0.1620303, -1.10345, 2.626419, 1, 0, 0, 1, 1,
0.1627469, 0.7123422, 0.4718743, 1, 0, 0, 1, 1,
0.1634934, 0.3905818, 1.517787, 0, 0, 0, 1, 1,
0.1665747, -1.291671, 0.8898747, 0, 0, 0, 1, 1,
0.1668558, -0.2591437, 3.21168, 0, 0, 0, 1, 1,
0.1736204, 1.695827, 1.906031, 0, 0, 0, 1, 1,
0.1743497, -1.272936, 1.6745, 0, 0, 0, 1, 1,
0.1755454, -0.8248202, 0.3274991, 0, 0, 0, 1, 1,
0.178953, 0.8110433, -1.639255, 0, 0, 0, 1, 1,
0.1819192, 2.431155, -1.472342, 1, 1, 1, 1, 1,
0.1844961, -0.8967941, 0.6370184, 1, 1, 1, 1, 1,
0.1851878, -2.669027, 4.309512, 1, 1, 1, 1, 1,
0.1862736, 0.9389706, 0.7859937, 1, 1, 1, 1, 1,
0.1886684, -0.3889982, 1.003405, 1, 1, 1, 1, 1,
0.1918054, 2.159722, -1.024119, 1, 1, 1, 1, 1,
0.1942446, 0.7272663, 0.6739407, 1, 1, 1, 1, 1,
0.2049213, -1.764676, 1.307248, 1, 1, 1, 1, 1,
0.2109786, -0.9691078, 2.240017, 1, 1, 1, 1, 1,
0.2113795, 1.613733, 0.8620928, 1, 1, 1, 1, 1,
0.2156838, -0.6382392, 2.72946, 1, 1, 1, 1, 1,
0.2186217, -2.571021, 1.926101, 1, 1, 1, 1, 1,
0.2235665, -1.134157, 2.538471, 1, 1, 1, 1, 1,
0.2241947, 1.778811, -0.7408783, 1, 1, 1, 1, 1,
0.2249305, 0.2537135, -0.7406, 1, 1, 1, 1, 1,
0.2276028, 1.346976, 1.84745, 0, 0, 1, 1, 1,
0.2335623, 0.9665912, 0.8370311, 1, 0, 0, 1, 1,
0.2350993, 1.076301, 1.170862, 1, 0, 0, 1, 1,
0.2361888, -0.1542744, 3.420467, 1, 0, 0, 1, 1,
0.2373761, -0.2533448, 3.27584, 1, 0, 0, 1, 1,
0.2374812, -1.261272, 4.177196, 1, 0, 0, 1, 1,
0.2412851, -0.4993312, 3.963571, 0, 0, 0, 1, 1,
0.2463923, -0.06279411, 2.230525, 0, 0, 0, 1, 1,
0.2472899, -0.1451812, 2.559927, 0, 0, 0, 1, 1,
0.2488902, -0.2232724, 2.488428, 0, 0, 0, 1, 1,
0.2576647, -0.7637008, 4.161436, 0, 0, 0, 1, 1,
0.2578767, 0.3377199, 1.337101, 0, 0, 0, 1, 1,
0.2592678, 0.7037835, -0.7901919, 0, 0, 0, 1, 1,
0.2599752, -0.7654635, 2.695319, 1, 1, 1, 1, 1,
0.2623084, -1.746378, 2.347128, 1, 1, 1, 1, 1,
0.2636476, 0.8788335, -1.172492, 1, 1, 1, 1, 1,
0.2638145, -2.560551, 3.486972, 1, 1, 1, 1, 1,
0.2680445, 0.1635344, 1.157258, 1, 1, 1, 1, 1,
0.2733046, -0.334244, 2.883068, 1, 1, 1, 1, 1,
0.2752438, -0.2601653, 3.543629, 1, 1, 1, 1, 1,
0.276776, 0.2763062, -0.09073585, 1, 1, 1, 1, 1,
0.283955, 0.8198029, 0.3430042, 1, 1, 1, 1, 1,
0.2853992, -0.007607858, 1.535514, 1, 1, 1, 1, 1,
0.2889, 1.741601, -1.876934, 1, 1, 1, 1, 1,
0.2892311, -0.8400566, 2.607596, 1, 1, 1, 1, 1,
0.2917542, -1.596489, 3.211743, 1, 1, 1, 1, 1,
0.2950653, -0.8924121, 2.739043, 1, 1, 1, 1, 1,
0.2971419, -2.437163, 2.084373, 1, 1, 1, 1, 1,
0.3037471, 1.287279, 0.01769534, 0, 0, 1, 1, 1,
0.3053857, -0.505116, 2.407548, 1, 0, 0, 1, 1,
0.3085828, -1.351907, 2.794309, 1, 0, 0, 1, 1,
0.315664, -1.452263, 2.503238, 1, 0, 0, 1, 1,
0.3196236, -0.07802527, 3.081052, 1, 0, 0, 1, 1,
0.3200979, -0.4584989, 2.3727, 1, 0, 0, 1, 1,
0.3201899, 1.72652, 1.208883, 0, 0, 0, 1, 1,
0.3224633, 1.063304, 0.1972075, 0, 0, 0, 1, 1,
0.3242244, -0.0405454, 1.166056, 0, 0, 0, 1, 1,
0.3260289, -0.6229153, 3.50652, 0, 0, 0, 1, 1,
0.3346384, 0.8730837, -0.8860122, 0, 0, 0, 1, 1,
0.3401494, 0.7797689, 1.472214, 0, 0, 0, 1, 1,
0.3424241, -0.1999742, 0.9232594, 0, 0, 0, 1, 1,
0.3449907, 0.6769333, 0.1033256, 1, 1, 1, 1, 1,
0.3480432, -1.291811, 2.864551, 1, 1, 1, 1, 1,
0.3602779, -0.2593476, 2.699282, 1, 1, 1, 1, 1,
0.3695958, -0.4976402, 2.128937, 1, 1, 1, 1, 1,
0.3718476, -1.373332, 5.103321, 1, 1, 1, 1, 1,
0.3783222, -2.033443, 4.166144, 1, 1, 1, 1, 1,
0.3803238, -1.289895, 2.726676, 1, 1, 1, 1, 1,
0.3809712, -0.05580923, 2.368519, 1, 1, 1, 1, 1,
0.3839658, 0.7924557, 2.099888, 1, 1, 1, 1, 1,
0.3842282, 0.5176598, 1.147518, 1, 1, 1, 1, 1,
0.3910533, 0.6028116, 1.231184, 1, 1, 1, 1, 1,
0.3941578, 2.004025, -0.04015274, 1, 1, 1, 1, 1,
0.3953165, -0.290102, 3.093478, 1, 1, 1, 1, 1,
0.3962272, 1.242319, 0.2494277, 1, 1, 1, 1, 1,
0.3979783, -1.227406, 2.628351, 1, 1, 1, 1, 1,
0.3984906, 0.1024306, 0.9400443, 0, 0, 1, 1, 1,
0.399293, 0.3229881, 0.3890243, 1, 0, 0, 1, 1,
0.4062532, -0.07847413, 1.524622, 1, 0, 0, 1, 1,
0.4102934, 0.2829427, 0.1916208, 1, 0, 0, 1, 1,
0.4109797, 2.825977, -0.5720154, 1, 0, 0, 1, 1,
0.4126649, -0.5510523, 2.406823, 1, 0, 0, 1, 1,
0.4187847, -1.896067, 4.470419, 0, 0, 0, 1, 1,
0.4215204, 0.1419366, 1.719628, 0, 0, 0, 1, 1,
0.4312228, -2.781494, 4.948528, 0, 0, 0, 1, 1,
0.439659, 0.9906856, -1.898693, 0, 0, 0, 1, 1,
0.4403408, -0.5718544, 2.539405, 0, 0, 0, 1, 1,
0.4404281, -0.1319453, 1.654496, 0, 0, 0, 1, 1,
0.4430718, -1.024365, 2.32876, 0, 0, 0, 1, 1,
0.4431522, 0.2226435, 0.8385113, 1, 1, 1, 1, 1,
0.4506956, -1.599563, 3.579459, 1, 1, 1, 1, 1,
0.4517458, 2.038697, -1.094759, 1, 1, 1, 1, 1,
0.4518661, -1.691146, 4.301484, 1, 1, 1, 1, 1,
0.45311, -1.934583, 1.472663, 1, 1, 1, 1, 1,
0.4535126, 0.3101494, 1.559534, 1, 1, 1, 1, 1,
0.4598818, 0.9854649, 0.4876001, 1, 1, 1, 1, 1,
0.4637253, 1.067347, 0.1118759, 1, 1, 1, 1, 1,
0.4649709, 1.845588, 1.098105, 1, 1, 1, 1, 1,
0.4687753, -0.1568165, 0.1668416, 1, 1, 1, 1, 1,
0.4688605, 1.474134, 1.422346, 1, 1, 1, 1, 1,
0.4760013, -0.7570371, 3.644147, 1, 1, 1, 1, 1,
0.4764213, 1.041029, -0.003183628, 1, 1, 1, 1, 1,
0.4773457, 0.1225349, 0.1518823, 1, 1, 1, 1, 1,
0.4778453, 0.1024071, 1.804087, 1, 1, 1, 1, 1,
0.4779218, -0.3407853, 1.92482, 0, 0, 1, 1, 1,
0.4790028, 0.2126911, 2.066395, 1, 0, 0, 1, 1,
0.4796759, 0.4237634, 0.659139, 1, 0, 0, 1, 1,
0.4803911, -0.1515948, 2.538614, 1, 0, 0, 1, 1,
0.4811475, -1.11439, 2.205095, 1, 0, 0, 1, 1,
0.490072, -2.190993, 1.731097, 1, 0, 0, 1, 1,
0.4914564, -0.5822092, 0.7772955, 0, 0, 0, 1, 1,
0.4934143, 1.157365, -1.254364, 0, 0, 0, 1, 1,
0.4939743, 0.2320151, 1.05274, 0, 0, 0, 1, 1,
0.4941011, -1.757868, 4.371194, 0, 0, 0, 1, 1,
0.4978804, 1.371647, -0.04986816, 0, 0, 0, 1, 1,
0.4983868, 0.1698871, 1.178367, 0, 0, 0, 1, 1,
0.5008762, -0.1065837, 1.850496, 0, 0, 0, 1, 1,
0.504962, 0.7908971, 0.7595379, 1, 1, 1, 1, 1,
0.5110447, 1.040439, 1.111369, 1, 1, 1, 1, 1,
0.5147766, -0.2744649, 1.392371, 1, 1, 1, 1, 1,
0.5164873, -0.9861409, 4.779232, 1, 1, 1, 1, 1,
0.5197841, 0.1320876, 2.764472, 1, 1, 1, 1, 1,
0.5229077, -1.293108, 1.313137, 1, 1, 1, 1, 1,
0.5257779, 0.5568622, 0.1237931, 1, 1, 1, 1, 1,
0.5286359, 1.04271, -0.1917206, 1, 1, 1, 1, 1,
0.5310003, 0.1645904, 1.554398, 1, 1, 1, 1, 1,
0.5316716, -1.691204, 2.99335, 1, 1, 1, 1, 1,
0.5349405, -0.713725, 2.307967, 1, 1, 1, 1, 1,
0.5353899, -1.122626, 0.6886724, 1, 1, 1, 1, 1,
0.5413371, 0.9046193, 2.399263, 1, 1, 1, 1, 1,
0.5486846, -0.09093588, -0.2800721, 1, 1, 1, 1, 1,
0.5490052, 1.004374, 0.2536552, 1, 1, 1, 1, 1,
0.5501072, -0.3668845, 3.400472, 0, 0, 1, 1, 1,
0.5504375, 0.2445661, 3.23176, 1, 0, 0, 1, 1,
0.5559741, 0.1630282, 3.817387, 1, 0, 0, 1, 1,
0.5618555, -0.4503939, 2.300093, 1, 0, 0, 1, 1,
0.5752591, -2.064982, 3.448567, 1, 0, 0, 1, 1,
0.5792429, -0.0908861, 1.332599, 1, 0, 0, 1, 1,
0.5795647, 1.579436, -0.1079182, 0, 0, 0, 1, 1,
0.5796443, -1.208114, 2.995462, 0, 0, 0, 1, 1,
0.5819101, -1.002331, 2.33667, 0, 0, 0, 1, 1,
0.5843408, 0.02224923, 2.34337, 0, 0, 0, 1, 1,
0.5868505, -1.132723, 1.597543, 0, 0, 0, 1, 1,
0.5885548, 0.3157193, 0.7728256, 0, 0, 0, 1, 1,
0.5893773, -0.7095891, 2.78817, 0, 0, 0, 1, 1,
0.5896838, 0.3914706, -0.5495818, 1, 1, 1, 1, 1,
0.5917497, -0.7158359, 2.836088, 1, 1, 1, 1, 1,
0.595811, 0.518128, 0.9013805, 1, 1, 1, 1, 1,
0.5989397, 1.266569, -0.4890747, 1, 1, 1, 1, 1,
0.6027058, -0.8284959, 1.841793, 1, 1, 1, 1, 1,
0.6035794, 0.5172915, 2.271206, 1, 1, 1, 1, 1,
0.6037252, 0.06859374, 1.314633, 1, 1, 1, 1, 1,
0.6060761, 0.3398736, 0.7345789, 1, 1, 1, 1, 1,
0.6073612, 0.771409, -0.1272986, 1, 1, 1, 1, 1,
0.6080921, -1.649119, 1.88442, 1, 1, 1, 1, 1,
0.613914, 0.5235326, 1.508692, 1, 1, 1, 1, 1,
0.6144944, -1.860396, 2.617194, 1, 1, 1, 1, 1,
0.6148206, 0.7597178, 2.093683, 1, 1, 1, 1, 1,
0.6160914, 1.570091, 1.118277, 1, 1, 1, 1, 1,
0.6282831, 0.3989508, 1.612354, 1, 1, 1, 1, 1,
0.6323301, 0.1087485, 2.785881, 0, 0, 1, 1, 1,
0.6341816, 0.6247051, -0.1959068, 1, 0, 0, 1, 1,
0.6376329, 0.8316261, 0.9995107, 1, 0, 0, 1, 1,
0.6398826, 0.7951025, 0.2299687, 1, 0, 0, 1, 1,
0.644789, 0.4711812, 0.8486949, 1, 0, 0, 1, 1,
0.6450598, -0.06360185, 1.806292, 1, 0, 0, 1, 1,
0.6504884, -1.672064, 2.947127, 0, 0, 0, 1, 1,
0.6525434, 0.9312485, 1.126747, 0, 0, 0, 1, 1,
0.6575865, -1.408795, 3.189478, 0, 0, 0, 1, 1,
0.6649922, -0.90575, 1.478874, 0, 0, 0, 1, 1,
0.6705054, 0.6781608, 1.221286, 0, 0, 0, 1, 1,
0.6733716, -1.172901, 0.9382901, 0, 0, 0, 1, 1,
0.6782331, 0.5617152, 0.08395412, 0, 0, 0, 1, 1,
0.6833234, 0.5110507, 1.513101, 1, 1, 1, 1, 1,
0.687147, -0.1478573, 1.282542, 1, 1, 1, 1, 1,
0.6885231, -0.3765202, 3.064723, 1, 1, 1, 1, 1,
0.6924483, 0.06375805, 0.6285844, 1, 1, 1, 1, 1,
0.6954236, -1.065048, 2.316409, 1, 1, 1, 1, 1,
0.6966498, 0.4134007, -0.2824176, 1, 1, 1, 1, 1,
0.700344, -0.7363353, 3.145408, 1, 1, 1, 1, 1,
0.7047202, 0.1978537, -0.6349326, 1, 1, 1, 1, 1,
0.7064166, -0.677636, 2.779498, 1, 1, 1, 1, 1,
0.7067424, 0.3936383, -0.3837665, 1, 1, 1, 1, 1,
0.7129329, 0.6953615, 1.10794, 1, 1, 1, 1, 1,
0.7162401, -0.4859012, 2.965557, 1, 1, 1, 1, 1,
0.7208384, 0.751968, 1.497014, 1, 1, 1, 1, 1,
0.7223062, 1.163501, 0.9766403, 1, 1, 1, 1, 1,
0.7226963, -0.5086547, 3.269742, 1, 1, 1, 1, 1,
0.7232093, -0.163542, 2.88599, 0, 0, 1, 1, 1,
0.7338727, 1.17301, 3.670489, 1, 0, 0, 1, 1,
0.7377724, -0.514386, 1.701552, 1, 0, 0, 1, 1,
0.7463965, -1.047567, 2.046758, 1, 0, 0, 1, 1,
0.750672, -1.282828, 3.480787, 1, 0, 0, 1, 1,
0.7513074, -1.50851, 1.38142, 1, 0, 0, 1, 1,
0.7590227, -2.151862, 2.420148, 0, 0, 0, 1, 1,
0.7642364, 0.6420439, 2.452002, 0, 0, 0, 1, 1,
0.767067, 1.458879, -0.6628908, 0, 0, 0, 1, 1,
0.7707478, -2.05843, 3.128685, 0, 0, 0, 1, 1,
0.773071, 0.5732372, 1.251985, 0, 0, 0, 1, 1,
0.7758659, 0.17049, 1.363492, 0, 0, 0, 1, 1,
0.7789459, -0.5562912, 1.909807, 0, 0, 0, 1, 1,
0.7794615, 0.1993058, 0.1168009, 1, 1, 1, 1, 1,
0.7799805, 0.1280544, -0.1812756, 1, 1, 1, 1, 1,
0.7807096, 0.4111003, 1.235186, 1, 1, 1, 1, 1,
0.7852959, -0.4345642, 3.722486, 1, 1, 1, 1, 1,
0.7876947, 0.5446617, 1.485915, 1, 1, 1, 1, 1,
0.791687, 0.5834574, 0.74288, 1, 1, 1, 1, 1,
0.7942791, -0.5957125, 2.743313, 1, 1, 1, 1, 1,
0.7981401, -0.4041851, 1.037804, 1, 1, 1, 1, 1,
0.7994319, 0.8456997, 2.845587, 1, 1, 1, 1, 1,
0.800192, 0.2263309, 1.169474, 1, 1, 1, 1, 1,
0.8014199, -0.9054022, 2.899746, 1, 1, 1, 1, 1,
0.8014719, -0.5980322, 1.881668, 1, 1, 1, 1, 1,
0.8023629, 0.9396825, -0.11062, 1, 1, 1, 1, 1,
0.8036779, 0.251517, 1.734348, 1, 1, 1, 1, 1,
0.8162429, -0.5653807, 2.825798, 1, 1, 1, 1, 1,
0.8166499, -0.9277174, 1.916685, 0, 0, 1, 1, 1,
0.8225531, 0.339089, 3.299385, 1, 0, 0, 1, 1,
0.8237593, -0.6153351, 2.759167, 1, 0, 0, 1, 1,
0.8257504, -0.4042713, 1.8289, 1, 0, 0, 1, 1,
0.8270045, 0.6778226, 0.06659212, 1, 0, 0, 1, 1,
0.8428061, -0.3019575, 2.112173, 1, 0, 0, 1, 1,
0.8450214, -0.6197166, 3.319777, 0, 0, 0, 1, 1,
0.8460486, -0.2206881, 2.15191, 0, 0, 0, 1, 1,
0.8483999, -0.5563921, 3.987973, 0, 0, 0, 1, 1,
0.8523852, 0.1307725, 1.583668, 0, 0, 0, 1, 1,
0.8596581, 1.412215, 0.9996607, 0, 0, 0, 1, 1,
0.8601716, -1.746348, 3.320565, 0, 0, 0, 1, 1,
0.8633366, 0.5406321, 2.930977, 0, 0, 0, 1, 1,
0.8646511, -0.5493568, 0.7018734, 1, 1, 1, 1, 1,
0.8666087, 0.9349422, 1.45907, 1, 1, 1, 1, 1,
0.86749, -1.043067, 2.72952, 1, 1, 1, 1, 1,
0.8719426, -0.10185, 2.588003, 1, 1, 1, 1, 1,
0.8727537, -1.621582, 3.882428, 1, 1, 1, 1, 1,
0.8806294, 0.7792764, -0.1840645, 1, 1, 1, 1, 1,
0.881804, 0.7804046, 1.444535, 1, 1, 1, 1, 1,
0.8900433, 0.4643351, 2.025737, 1, 1, 1, 1, 1,
0.8915172, 0.1131175, 2.275685, 1, 1, 1, 1, 1,
0.8926134, 1.073637, 1.440428, 1, 1, 1, 1, 1,
0.8939543, -1.556955, 3.480146, 1, 1, 1, 1, 1,
0.894659, 0.1717944, 2.256118, 1, 1, 1, 1, 1,
0.8976913, 0.933224, 0.4846998, 1, 1, 1, 1, 1,
0.8999172, 1.801823, 0.8832765, 1, 1, 1, 1, 1,
0.9007402, 1.316136, 0.1178944, 1, 1, 1, 1, 1,
0.9031752, 1.254303, 1.413016, 0, 0, 1, 1, 1,
0.9059368, 0.322475, 1.746583, 1, 0, 0, 1, 1,
0.9065122, 1.36468, 0.2582158, 1, 0, 0, 1, 1,
0.9092396, -1.107128, 1.581327, 1, 0, 0, 1, 1,
0.9097744, 0.06069276, 1.779731, 1, 0, 0, 1, 1,
0.9130837, 1.071628, 0.9310611, 1, 0, 0, 1, 1,
0.9139774, 1.812964, -1.679318, 0, 0, 0, 1, 1,
0.9180059, 0.7480183, 1.222507, 0, 0, 0, 1, 1,
0.9297653, 0.4294965, 2.36242, 0, 0, 0, 1, 1,
0.9302576, -0.5643051, 3.017718, 0, 0, 0, 1, 1,
0.9345044, -0.2365838, 2.999472, 0, 0, 0, 1, 1,
0.9492583, -0.6589113, 1.896095, 0, 0, 0, 1, 1,
0.9556077, 0.5938557, 0.8547248, 0, 0, 0, 1, 1,
0.9627698, -0.7171456, 2.928226, 1, 1, 1, 1, 1,
0.9747468, 1.420086, 2.099686, 1, 1, 1, 1, 1,
0.9751818, 0.7580717, 0.3363777, 1, 1, 1, 1, 1,
0.9759428, 0.8810118, -1.086282, 1, 1, 1, 1, 1,
0.986596, 0.4991992, 1.715311, 1, 1, 1, 1, 1,
0.992809, -0.513824, 1.019838, 1, 1, 1, 1, 1,
0.9972343, 0.1915187, 0.1588102, 1, 1, 1, 1, 1,
1.007406, -1.892411, 3.223033, 1, 1, 1, 1, 1,
1.009947, -0.698256, 1.889271, 1, 1, 1, 1, 1,
1.010405, 0.2937804, 0.6569077, 1, 1, 1, 1, 1,
1.019312, 1.358193, 1.207908, 1, 1, 1, 1, 1,
1.025521, -0.7299765, 2.702433, 1, 1, 1, 1, 1,
1.03123, 0.917051, 1.605512, 1, 1, 1, 1, 1,
1.034029, 1.582232, 1.608738, 1, 1, 1, 1, 1,
1.040729, 0.4832316, -0.2031104, 1, 1, 1, 1, 1,
1.044419, -0.9800268, 1.957925, 0, 0, 1, 1, 1,
1.048244, 0.9864582, -1.282656, 1, 0, 0, 1, 1,
1.056569, 1.899471, -0.9706408, 1, 0, 0, 1, 1,
1.073821, 1.597462, 2.41603, 1, 0, 0, 1, 1,
1.09652, 0.1035202, 1.142051, 1, 0, 0, 1, 1,
1.10236, 1.207417, -1.196254, 1, 0, 0, 1, 1,
1.105169, -0.06720062, -0.04986911, 0, 0, 0, 1, 1,
1.110529, -1.108375, 2.233673, 0, 0, 0, 1, 1,
1.115021, -1.835934, 3.869583, 0, 0, 0, 1, 1,
1.118286, 0.1955393, 3.22929, 0, 0, 0, 1, 1,
1.11981, 1.059171, 1.680709, 0, 0, 0, 1, 1,
1.121671, 1.273538, 1.688106, 0, 0, 0, 1, 1,
1.124767, 0.6728462, 0.2940782, 0, 0, 0, 1, 1,
1.127632, -0.2234987, 1.103959, 1, 1, 1, 1, 1,
1.148131, -1.404916, 3.367521, 1, 1, 1, 1, 1,
1.148286, -0.805041, 2.542639, 1, 1, 1, 1, 1,
1.160721, -0.02464554, 1.905401, 1, 1, 1, 1, 1,
1.165951, 0.1167322, 2.391329, 1, 1, 1, 1, 1,
1.167725, 1.754026, -1.010694, 1, 1, 1, 1, 1,
1.170605, -0.6387699, 0.4999706, 1, 1, 1, 1, 1,
1.184134, -0.5703133, 2.879632, 1, 1, 1, 1, 1,
1.186949, -0.7350934, 1.793445, 1, 1, 1, 1, 1,
1.189278, -1.057456, 2.165892, 1, 1, 1, 1, 1,
1.194209, -0.6799824, 1.640736, 1, 1, 1, 1, 1,
1.194513, 1.101186, -0.1486754, 1, 1, 1, 1, 1,
1.196105, -0.7509254, 3.054159, 1, 1, 1, 1, 1,
1.198408, 0.07737184, 2.968007, 1, 1, 1, 1, 1,
1.20344, -0.1413273, 2.119337, 1, 1, 1, 1, 1,
1.20472, 0.2831463, 1.092842, 0, 0, 1, 1, 1,
1.208251, 2.118067, -0.9384174, 1, 0, 0, 1, 1,
1.212937, -0.03001738, 0.6863402, 1, 0, 0, 1, 1,
1.218292, 0.1884262, 0.1908108, 1, 0, 0, 1, 1,
1.220992, 0.4964432, 0.4899128, 1, 0, 0, 1, 1,
1.232379, 0.1466155, 1.374767, 1, 0, 0, 1, 1,
1.245588, 1.492084, 2.337903, 0, 0, 0, 1, 1,
1.250638, -0.05777656, 1.310861, 0, 0, 0, 1, 1,
1.250933, -1.186027, 2.864833, 0, 0, 0, 1, 1,
1.25847, -1.799577, 1.60819, 0, 0, 0, 1, 1,
1.263554, 0.007521371, 1.724478, 0, 0, 0, 1, 1,
1.267323, 0.5375612, 0.3409684, 0, 0, 0, 1, 1,
1.267998, -1.164448, 1.55062, 0, 0, 0, 1, 1,
1.279933, -0.5579194, -0.384385, 1, 1, 1, 1, 1,
1.292879, -1.296985, 0.786935, 1, 1, 1, 1, 1,
1.302467, 0.2096653, 0.590967, 1, 1, 1, 1, 1,
1.305134, -0.2169719, 1.465725, 1, 1, 1, 1, 1,
1.308104, 0.242504, -0.2918083, 1, 1, 1, 1, 1,
1.309367, 0.798394, 0.6088932, 1, 1, 1, 1, 1,
1.310597, -0.8876283, 0.7339945, 1, 1, 1, 1, 1,
1.315083, 2.204428, -0.817958, 1, 1, 1, 1, 1,
1.321733, 0.5797666, 1.917748, 1, 1, 1, 1, 1,
1.322957, 0.1444051, 0.59616, 1, 1, 1, 1, 1,
1.330381, 0.3094017, 1.397071, 1, 1, 1, 1, 1,
1.338467, 0.4574924, 1.179481, 1, 1, 1, 1, 1,
1.343485, -0.1211503, 0.9304762, 1, 1, 1, 1, 1,
1.350093, -0.6095726, 1.674886, 1, 1, 1, 1, 1,
1.353888, 2.438339, 1.202649, 1, 1, 1, 1, 1,
1.362338, -0.6552975, 1.392704, 0, 0, 1, 1, 1,
1.372644, -0.4789807, 2.849595, 1, 0, 0, 1, 1,
1.372732, 0.5670977, 0.6768345, 1, 0, 0, 1, 1,
1.393838, -0.07936846, 1.69839, 1, 0, 0, 1, 1,
1.395189, 0.2457534, 2.237591, 1, 0, 0, 1, 1,
1.402525, -1.147793, 2.331159, 1, 0, 0, 1, 1,
1.410721, -1.156921, 2.751922, 0, 0, 0, 1, 1,
1.412467, 0.4253785, 1.449911, 0, 0, 0, 1, 1,
1.413645, 1.020198, 0.0528331, 0, 0, 0, 1, 1,
1.434306, -0.03389195, 1.879668, 0, 0, 0, 1, 1,
1.446102, -0.5068147, 3.445954, 0, 0, 0, 1, 1,
1.463359, -0.6753801, 2.096085, 0, 0, 0, 1, 1,
1.477573, -0.5480369, 1.532169, 0, 0, 0, 1, 1,
1.49612, -1.078066, 2.750708, 1, 1, 1, 1, 1,
1.503339, -1.062972, 2.740564, 1, 1, 1, 1, 1,
1.515985, -0.8675399, 1.070691, 1, 1, 1, 1, 1,
1.546993, -1.433654, 1.527333, 1, 1, 1, 1, 1,
1.570223, 1.744788, -0.06282256, 1, 1, 1, 1, 1,
1.577055, -0.7887824, 2.661911, 1, 1, 1, 1, 1,
1.578049, -0.4248822, 2.310064, 1, 1, 1, 1, 1,
1.579674, 0.02800647, 2.743358, 1, 1, 1, 1, 1,
1.588501, -1.515122, 2.445329, 1, 1, 1, 1, 1,
1.591907, -1.521404, 2.492225, 1, 1, 1, 1, 1,
1.599726, -0.6681954, 1.567131, 1, 1, 1, 1, 1,
1.602173, -0.4673937, 0.5457721, 1, 1, 1, 1, 1,
1.62012, 1.378057, -0.06924473, 1, 1, 1, 1, 1,
1.622478, 0.6746924, 0.06632905, 1, 1, 1, 1, 1,
1.634649, 2.044844, 1.420794, 1, 1, 1, 1, 1,
1.635062, -1.12697, 3.324625, 0, 0, 1, 1, 1,
1.638478, 0.3450668, 0.4822175, 1, 0, 0, 1, 1,
1.644213, 0.2070804, 1.197005, 1, 0, 0, 1, 1,
1.650326, -0.9529837, 1.547643, 1, 0, 0, 1, 1,
1.659521, 0.5418884, 0.2085015, 1, 0, 0, 1, 1,
1.683063, -0.9674522, 1.188033, 1, 0, 0, 1, 1,
1.683915, -0.2317287, 1.000609, 0, 0, 0, 1, 1,
1.700726, -0.9265379, 2.810477, 0, 0, 0, 1, 1,
1.70142, 0.6943655, 0.7987013, 0, 0, 0, 1, 1,
1.705495, -0.8147155, 4.471602, 0, 0, 0, 1, 1,
1.723906, 2.795019, 2.147551, 0, 0, 0, 1, 1,
1.723938, -0.5694324, 2.622598, 0, 0, 0, 1, 1,
1.725463, -0.2371605, 1.13396, 0, 0, 0, 1, 1,
1.732879, -0.746709, 1.502911, 1, 1, 1, 1, 1,
1.743227, 0.2006997, 0.5045708, 1, 1, 1, 1, 1,
1.749171, -0.2968083, 1.525468, 1, 1, 1, 1, 1,
1.754071, -1.309327, 2.316015, 1, 1, 1, 1, 1,
1.770658, 0.2490044, 2.102678, 1, 1, 1, 1, 1,
1.793393, -1.366747, 2.558691, 1, 1, 1, 1, 1,
1.805565, 0.4788794, 1.83197, 1, 1, 1, 1, 1,
1.811906, 0.9525814, 1.798143, 1, 1, 1, 1, 1,
1.817019, -0.04185361, 2.368659, 1, 1, 1, 1, 1,
1.842183, -0.8773398, 1.366213, 1, 1, 1, 1, 1,
1.846603, 1.090774, 1.433798, 1, 1, 1, 1, 1,
1.883083, -0.1284342, 0.2176138, 1, 1, 1, 1, 1,
1.892687, -0.7738615, 0.4127499, 1, 1, 1, 1, 1,
1.899583, 1.852435, 0.1868849, 1, 1, 1, 1, 1,
1.908153, 0.9133861, 0.5489407, 1, 1, 1, 1, 1,
1.926692, -1.046927, 2.761855, 0, 0, 1, 1, 1,
1.948742, 0.506678, 1.672883, 1, 0, 0, 1, 1,
1.961274, 1.82866, 0.8608843, 1, 0, 0, 1, 1,
2.038434, -1.802867, 3.087081, 1, 0, 0, 1, 1,
2.079505, -0.8573043, 3.001311, 1, 0, 0, 1, 1,
2.08601, -0.3424934, 0.7078471, 1, 0, 0, 1, 1,
2.146065, 1.638582, 2.225844, 0, 0, 0, 1, 1,
2.177064, -0.4584091, 2.057546, 0, 0, 0, 1, 1,
2.18228, -0.4394756, 1.165431, 0, 0, 0, 1, 1,
2.234518, 0.5025513, 1.456205, 0, 0, 0, 1, 1,
2.266255, -0.6730163, 0.6047853, 0, 0, 0, 1, 1,
2.58094, 0.02409064, 0.7097334, 0, 0, 0, 1, 1,
2.648753, 0.5516993, 2.166641, 0, 0, 0, 1, 1,
2.693208, -1.128675, 2.147027, 1, 1, 1, 1, 1,
2.750796, -0.7192081, 2.299373, 1, 1, 1, 1, 1,
2.861939, 1.429188, 2.495825, 1, 1, 1, 1, 1,
2.980482, 2.384029, 1.506485, 1, 1, 1, 1, 1,
2.989279, 1.23777, -0.9449736, 1, 1, 1, 1, 1,
3.141656, -0.1416902, 2.055344, 1, 1, 1, 1, 1,
3.623162, 1.487517, 0.9509101, 1, 1, 1, 1, 1
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
var radius = 9.614986;
var distance = 33.77223;
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
mvMatrix.translate( -0.0276618, -0.02224147, 0.2854385 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.77223);
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