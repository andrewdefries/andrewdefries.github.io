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
-2.97918, -0.8839909, -0.1697329, 1, 0, 0, 1,
-2.907865, -1.608554, -1.696422, 1, 0.007843138, 0, 1,
-2.739614, 1.681116, -2.833506, 1, 0.01176471, 0, 1,
-2.572893, -0.2581883, -2.45032, 1, 0.01960784, 0, 1,
-2.456516, 0.1544345, -0.8383651, 1, 0.02352941, 0, 1,
-2.427187, 2.143352, -0.2874867, 1, 0.03137255, 0, 1,
-2.41301, -0.7944037, -5.074365, 1, 0.03529412, 0, 1,
-2.280186, 0.4280894, -0.9812841, 1, 0.04313726, 0, 1,
-2.22065, -0.3093054, -1.773312, 1, 0.04705882, 0, 1,
-2.211921, -0.3000023, -1.264489, 1, 0.05490196, 0, 1,
-2.183476, 0.1338644, -1.489163, 1, 0.05882353, 0, 1,
-2.153481, -0.228156, -2.467097, 1, 0.06666667, 0, 1,
-2.149167, -1.933211, -2.47303, 1, 0.07058824, 0, 1,
-2.125285, -0.6587968, -2.390391, 1, 0.07843138, 0, 1,
-2.117113, 1.263414, -3.305109, 1, 0.08235294, 0, 1,
-2.109724, -0.1739889, 0.1241355, 1, 0.09019608, 0, 1,
-2.100253, 0.5657378, -1.803562, 1, 0.09411765, 0, 1,
-2.098944, -0.3391396, -0.8582377, 1, 0.1019608, 0, 1,
-2.097039, -0.5113911, -1.507463, 1, 0.1098039, 0, 1,
-2.05933, 0.1540473, -0.3933852, 1, 0.1137255, 0, 1,
-2.026662, 0.8707482, -0.7504634, 1, 0.1215686, 0, 1,
-2.009023, -2.443615, -3.79332, 1, 0.1254902, 0, 1,
-2.005959, -1.077465, -3.197484, 1, 0.1333333, 0, 1,
-1.974269, 1.592824, 0.612596, 1, 0.1372549, 0, 1,
-1.955256, -0.8746426, -0.7712952, 1, 0.145098, 0, 1,
-1.914714, 0.369295, -1.696229, 1, 0.1490196, 0, 1,
-1.893755, 0.1222538, -2.405273, 1, 0.1568628, 0, 1,
-1.890209, -0.09611916, -0.6718165, 1, 0.1607843, 0, 1,
-1.882676, -0.5708104, -1.017024, 1, 0.1686275, 0, 1,
-1.878157, -1.987671, -2.335859, 1, 0.172549, 0, 1,
-1.84759, 0.82739, -1.579144, 1, 0.1803922, 0, 1,
-1.838731, 0.5794204, -3.469151, 1, 0.1843137, 0, 1,
-1.824521, 0.9094921, -0.6560826, 1, 0.1921569, 0, 1,
-1.818837, -2.945251, -2.832444, 1, 0.1960784, 0, 1,
-1.816024, -1.115916, -2.507607, 1, 0.2039216, 0, 1,
-1.811213, -0.1850876, -0.8202173, 1, 0.2117647, 0, 1,
-1.806048, -1.180409, -2.211289, 1, 0.2156863, 0, 1,
-1.802851, -0.6740171, -3.01131, 1, 0.2235294, 0, 1,
-1.799327, -0.2059963, -1.604418, 1, 0.227451, 0, 1,
-1.794382, -0.7465855, -0.9623654, 1, 0.2352941, 0, 1,
-1.790604, 0.9411886, 0.7569106, 1, 0.2392157, 0, 1,
-1.790514, -0.139411, -1.170749, 1, 0.2470588, 0, 1,
-1.790221, -0.1153325, -1.202631, 1, 0.2509804, 0, 1,
-1.759789, 0.5453342, -0.8717847, 1, 0.2588235, 0, 1,
-1.739789, 1.753564, 0.3854565, 1, 0.2627451, 0, 1,
-1.738292, 0.571096, -2.974545, 1, 0.2705882, 0, 1,
-1.731496, 0.4893468, -1.223243, 1, 0.2745098, 0, 1,
-1.725592, 0.5517876, -0.9455261, 1, 0.282353, 0, 1,
-1.720271, -0.2436375, -1.014275, 1, 0.2862745, 0, 1,
-1.702163, -0.5099631, -3.383061, 1, 0.2941177, 0, 1,
-1.69815, 1.204751, -0.4083126, 1, 0.3019608, 0, 1,
-1.695648, -1.022605, -1.371578, 1, 0.3058824, 0, 1,
-1.680485, -1.152126, -2.869082, 1, 0.3137255, 0, 1,
-1.676586, -0.5262163, -0.9304879, 1, 0.3176471, 0, 1,
-1.675714, -0.3264746, -2.109694, 1, 0.3254902, 0, 1,
-1.662168, -0.3630707, -0.9970212, 1, 0.3294118, 0, 1,
-1.655428, -0.4633958, -2.410797, 1, 0.3372549, 0, 1,
-1.650325, -0.7291152, -2.673975, 1, 0.3411765, 0, 1,
-1.63143, -0.08158897, -1.827306, 1, 0.3490196, 0, 1,
-1.625479, -0.4852622, -2.550179, 1, 0.3529412, 0, 1,
-1.617837, -0.01794625, -2.051163, 1, 0.3607843, 0, 1,
-1.609134, -1.194903, -2.228195, 1, 0.3647059, 0, 1,
-1.60743, -0.7087489, -2.367536, 1, 0.372549, 0, 1,
-1.585953, 0.1722206, -1.144641, 1, 0.3764706, 0, 1,
-1.580952, -0.2734169, -2.107419, 1, 0.3843137, 0, 1,
-1.564605, -0.900517, 0.4302525, 1, 0.3882353, 0, 1,
-1.543129, 1.067387, -2.436111, 1, 0.3960784, 0, 1,
-1.538314, -1.712701, 0.324735, 1, 0.4039216, 0, 1,
-1.538038, -0.3945139, -0.2087209, 1, 0.4078431, 0, 1,
-1.53689, -0.03505653, -1.772742, 1, 0.4156863, 0, 1,
-1.534131, 0.8983406, -1.16107, 1, 0.4196078, 0, 1,
-1.531041, 0.6610418, -2.477798, 1, 0.427451, 0, 1,
-1.530116, 0.9899738, -1.147092, 1, 0.4313726, 0, 1,
-1.520742, -0.4100759, -2.535761, 1, 0.4392157, 0, 1,
-1.507552, 1.1226, -2.717377, 1, 0.4431373, 0, 1,
-1.478897, 0.5487829, -0.3889134, 1, 0.4509804, 0, 1,
-1.467133, -0.8229138, -0.2178985, 1, 0.454902, 0, 1,
-1.460241, -1.630005, -1.955229, 1, 0.4627451, 0, 1,
-1.450998, -0.6966147, -2.418156, 1, 0.4666667, 0, 1,
-1.445926, 1.397775, -0.9654032, 1, 0.4745098, 0, 1,
-1.443506, -0.0820452, -2.846905, 1, 0.4784314, 0, 1,
-1.43228, 1.109424, -1.579584, 1, 0.4862745, 0, 1,
-1.428365, 1.070583, -0.4368437, 1, 0.4901961, 0, 1,
-1.421228, -0.03609314, 0.2965374, 1, 0.4980392, 0, 1,
-1.415635, 0.899167, -1.606544, 1, 0.5058824, 0, 1,
-1.415576, -0.2130304, -1.178792, 1, 0.509804, 0, 1,
-1.413127, -1.60658, -1.511002, 1, 0.5176471, 0, 1,
-1.391643, 0.2919123, -1.831933, 1, 0.5215687, 0, 1,
-1.391015, 2.77796, 0.3485294, 1, 0.5294118, 0, 1,
-1.385919, 1.278773, -1.234466, 1, 0.5333334, 0, 1,
-1.376522, -0.04719239, -0.8150223, 1, 0.5411765, 0, 1,
-1.376024, -0.4783175, -1.054658, 1, 0.5450981, 0, 1,
-1.365025, 2.382597, -0.3963799, 1, 0.5529412, 0, 1,
-1.354623, 0.2883494, -2.109331, 1, 0.5568628, 0, 1,
-1.342311, -0.3340372, 0.2452885, 1, 0.5647059, 0, 1,
-1.339712, -2.023082, -2.167702, 1, 0.5686275, 0, 1,
-1.334985, 0.4722266, 0.4750171, 1, 0.5764706, 0, 1,
-1.332647, 1.872078, -0.1761382, 1, 0.5803922, 0, 1,
-1.326125, -2.817466, -1.444657, 1, 0.5882353, 0, 1,
-1.315929, 0.101695, -1.40628, 1, 0.5921569, 0, 1,
-1.313724, -0.5234412, -1.145949, 1, 0.6, 0, 1,
-1.3115, 0.1315041, -2.101326, 1, 0.6078432, 0, 1,
-1.29878, 0.8515735, -0.1716929, 1, 0.6117647, 0, 1,
-1.293232, -1.866406, -3.380804, 1, 0.6196079, 0, 1,
-1.292002, -0.07359581, -1.795473, 1, 0.6235294, 0, 1,
-1.287839, 0.1181575, -2.412634, 1, 0.6313726, 0, 1,
-1.285404, -0.2241622, -1.869722, 1, 0.6352941, 0, 1,
-1.283876, -0.1277326, -0.3644264, 1, 0.6431373, 0, 1,
-1.274582, 1.119575, -0.4438191, 1, 0.6470588, 0, 1,
-1.266049, 1.203088, 0.6228322, 1, 0.654902, 0, 1,
-1.265002, -0.2179804, -1.295232, 1, 0.6588235, 0, 1,
-1.263714, -1.084312, -3.01389, 1, 0.6666667, 0, 1,
-1.261161, 0.08720519, -2.207333, 1, 0.6705883, 0, 1,
-1.257536, 0.2841037, 0.02561507, 1, 0.6784314, 0, 1,
-1.25367, -0.1912106, -0.6713322, 1, 0.682353, 0, 1,
-1.242579, 0.5534145, -2.763287, 1, 0.6901961, 0, 1,
-1.234531, 0.3438603, -0.3094373, 1, 0.6941177, 0, 1,
-1.234395, 0.3325818, -0.4906787, 1, 0.7019608, 0, 1,
-1.233221, 1.398417, -1.181812, 1, 0.7098039, 0, 1,
-1.231346, -1.548364, -0.4550249, 1, 0.7137255, 0, 1,
-1.230488, -0.002034938, -2.741612, 1, 0.7215686, 0, 1,
-1.2223, -0.1830501, -1.072738, 1, 0.7254902, 0, 1,
-1.217895, -1.746326, -1.972314, 1, 0.7333333, 0, 1,
-1.213197, -1.03286, -1.098361, 1, 0.7372549, 0, 1,
-1.208009, 1.402903, -0.5106531, 1, 0.7450981, 0, 1,
-1.20671, 0.373342, -0.8288356, 1, 0.7490196, 0, 1,
-1.204155, -0.1818437, -0.54569, 1, 0.7568628, 0, 1,
-1.189759, -1.274939, -1.869321, 1, 0.7607843, 0, 1,
-1.188851, -0.3917957, -2.226276, 1, 0.7686275, 0, 1,
-1.181315, -1.895852, -4.386844, 1, 0.772549, 0, 1,
-1.179326, -1.369996, -3.808058, 1, 0.7803922, 0, 1,
-1.175768, 0.04469391, -1.694319, 1, 0.7843137, 0, 1,
-1.174198, 0.3483191, -2.063444, 1, 0.7921569, 0, 1,
-1.173865, 0.3659986, -1.066691, 1, 0.7960784, 0, 1,
-1.170745, 1.167014, -0.4618232, 1, 0.8039216, 0, 1,
-1.153136, 0.5473651, 0.009447398, 1, 0.8117647, 0, 1,
-1.149683, -1.270931, -3.327024, 1, 0.8156863, 0, 1,
-1.149651, -1.410516, -2.570891, 1, 0.8235294, 0, 1,
-1.147864, -0.6056308, -2.188567, 1, 0.827451, 0, 1,
-1.143242, 1.093047, -1.431259, 1, 0.8352941, 0, 1,
-1.142639, 0.6239557, -2.157969, 1, 0.8392157, 0, 1,
-1.132689, -0.1480985, -2.533768, 1, 0.8470588, 0, 1,
-1.126152, -0.3702753, -0.6387695, 1, 0.8509804, 0, 1,
-1.121094, 0.4413056, -0.8618736, 1, 0.8588235, 0, 1,
-1.111084, -1.138424, -4.614903, 1, 0.8627451, 0, 1,
-1.109718, 0.101922, -2.58934, 1, 0.8705882, 0, 1,
-1.094122, -0.6343018, -1.021791, 1, 0.8745098, 0, 1,
-1.093716, -0.4601743, -1.484387, 1, 0.8823529, 0, 1,
-1.089874, 0.9367094, -1.492455, 1, 0.8862745, 0, 1,
-1.088246, -0.5515782, -1.185716, 1, 0.8941177, 0, 1,
-1.085765, 0.2423219, -0.5254236, 1, 0.8980392, 0, 1,
-1.082303, 1.179794, -0.7234297, 1, 0.9058824, 0, 1,
-1.078269, 1.448545, -1.131413, 1, 0.9137255, 0, 1,
-1.075286, 1.143669, -0.6250395, 1, 0.9176471, 0, 1,
-1.073482, 0.4193757, -1.127322, 1, 0.9254902, 0, 1,
-1.069482, -0.3460963, -2.631331, 1, 0.9294118, 0, 1,
-1.058129, 0.7785886, -1.749406, 1, 0.9372549, 0, 1,
-1.055908, 0.6561146, -1.75137, 1, 0.9411765, 0, 1,
-1.052054, -0.1504821, -2.947058, 1, 0.9490196, 0, 1,
-1.048229, 0.9108604, 0.5391708, 1, 0.9529412, 0, 1,
-1.042447, 1.115449, -1.279526, 1, 0.9607843, 0, 1,
-1.041731, 0.4444748, -0.6207514, 1, 0.9647059, 0, 1,
-1.04064, -3.161721, -3.155237, 1, 0.972549, 0, 1,
-1.033881, -0.4620551, -2.526037, 1, 0.9764706, 0, 1,
-1.026635, -0.002457861, -1.052466, 1, 0.9843137, 0, 1,
-1.025488, 0.8184382, -1.161183, 1, 0.9882353, 0, 1,
-1.02164, 0.8625273, 0.4287583, 1, 0.9960784, 0, 1,
-1.020682, 0.9456504, 0.01496185, 0.9960784, 1, 0, 1,
-1.017185, -1.103102, -1.895676, 0.9921569, 1, 0, 1,
-1.014602, 1.028788, 0.2256558, 0.9843137, 1, 0, 1,
-1.013691, 0.966458, -1.123429, 0.9803922, 1, 0, 1,
-1.013131, 0.2246177, -0.646818, 0.972549, 1, 0, 1,
-1.011951, -0.6367605, -1.002613, 0.9686275, 1, 0, 1,
-1.003519, -0.8939487, -2.401669, 0.9607843, 1, 0, 1,
-0.9967304, 1.819715, -0.7666757, 0.9568627, 1, 0, 1,
-0.9816244, -1.771553, -2.998456, 0.9490196, 1, 0, 1,
-0.9744306, -0.01349771, -0.9144476, 0.945098, 1, 0, 1,
-0.9734306, -0.5041357, -3.380729, 0.9372549, 1, 0, 1,
-0.9676438, 0.6542245, -2.008366, 0.9333333, 1, 0, 1,
-0.9600677, 0.391655, -1.988393, 0.9254902, 1, 0, 1,
-0.9596829, 2.528361, -1.103525, 0.9215686, 1, 0, 1,
-0.958037, 0.09410788, -1.598311, 0.9137255, 1, 0, 1,
-0.9525102, -0.2483355, -1.000875, 0.9098039, 1, 0, 1,
-0.9499516, -2.101529, -3.302893, 0.9019608, 1, 0, 1,
-0.9492472, -0.2355779, -2.084894, 0.8941177, 1, 0, 1,
-0.9488948, -1.04236, -2.149926, 0.8901961, 1, 0, 1,
-0.9468092, 0.5352643, -2.134343, 0.8823529, 1, 0, 1,
-0.938422, 0.02449236, -0.118486, 0.8784314, 1, 0, 1,
-0.9360565, 1.240801, 1.23345, 0.8705882, 1, 0, 1,
-0.935734, -0.1992054, -0.3599203, 0.8666667, 1, 0, 1,
-0.9314687, 0.3899803, -1.807731, 0.8588235, 1, 0, 1,
-0.9290718, 1.318807, 1.260067, 0.854902, 1, 0, 1,
-0.9241954, -0.1818137, 0.4161596, 0.8470588, 1, 0, 1,
-0.9208243, -0.2026961, -2.547946, 0.8431373, 1, 0, 1,
-0.9174216, -0.33652, -2.381453, 0.8352941, 1, 0, 1,
-0.9099554, -0.4670027, -1.529539, 0.8313726, 1, 0, 1,
-0.9058234, -0.9670706, -3.221987, 0.8235294, 1, 0, 1,
-0.8998204, -0.2551775, 0.7024707, 0.8196079, 1, 0, 1,
-0.8937909, -0.3662393, -1.97996, 0.8117647, 1, 0, 1,
-0.8906218, 0.9050445, -0.7145166, 0.8078431, 1, 0, 1,
-0.889352, -0.4050873, -2.361638, 0.8, 1, 0, 1,
-0.8873274, 0.4189151, -1.213803, 0.7921569, 1, 0, 1,
-0.8791113, 0.3309072, -0.06311977, 0.7882353, 1, 0, 1,
-0.8776209, -2.773274, -2.465916, 0.7803922, 1, 0, 1,
-0.8755978, 1.534661, 0.8486365, 0.7764706, 1, 0, 1,
-0.8747808, -0.0978021, -1.61659, 0.7686275, 1, 0, 1,
-0.8700249, -0.02656018, -2.311561, 0.7647059, 1, 0, 1,
-0.8693106, 0.03299005, -2.587124, 0.7568628, 1, 0, 1,
-0.858143, 0.3843479, -0.03416676, 0.7529412, 1, 0, 1,
-0.8568698, -0.1667935, -1.469496, 0.7450981, 1, 0, 1,
-0.8566055, 1.294772, 0.1138255, 0.7411765, 1, 0, 1,
-0.8547068, -0.004255361, -4.187393, 0.7333333, 1, 0, 1,
-0.8518794, -1.704267, -0.9619018, 0.7294118, 1, 0, 1,
-0.8517317, -0.7024989, -3.096989, 0.7215686, 1, 0, 1,
-0.8501382, -0.3782891, -2.034346, 0.7176471, 1, 0, 1,
-0.8496144, 1.518657, -0.1237972, 0.7098039, 1, 0, 1,
-0.8477473, 0.6835732, 2.014721, 0.7058824, 1, 0, 1,
-0.8461738, -0.2784921, -1.353857, 0.6980392, 1, 0, 1,
-0.837328, -1.553343, -2.688442, 0.6901961, 1, 0, 1,
-0.8332947, 1.635071, -0.2783308, 0.6862745, 1, 0, 1,
-0.8327259, 1.261139, 0.8001381, 0.6784314, 1, 0, 1,
-0.8305511, -1.286374, -2.866254, 0.6745098, 1, 0, 1,
-0.8296615, 1.129659, 0.9401338, 0.6666667, 1, 0, 1,
-0.8295186, 0.02340185, -1.100025, 0.6627451, 1, 0, 1,
-0.8195664, -0.02490403, -3.830846, 0.654902, 1, 0, 1,
-0.8160227, 1.009331, 0.5753264, 0.6509804, 1, 0, 1,
-0.8137029, 0.3257836, -1.051995, 0.6431373, 1, 0, 1,
-0.8128016, 2.318258, 0.1780812, 0.6392157, 1, 0, 1,
-0.8099611, -1.629352, -3.233068, 0.6313726, 1, 0, 1,
-0.8096331, -0.8433504, -2.600216, 0.627451, 1, 0, 1,
-0.8095337, -0.4222282, -2.771328, 0.6196079, 1, 0, 1,
-0.8060737, 0.7355976, -0.3603588, 0.6156863, 1, 0, 1,
-0.8037105, 0.5115885, 0.3893942, 0.6078432, 1, 0, 1,
-0.8022226, -0.06460029, -1.487138, 0.6039216, 1, 0, 1,
-0.7970006, -2.06531, -3.407738, 0.5960785, 1, 0, 1,
-0.7922806, -1.043921, -2.862761, 0.5882353, 1, 0, 1,
-0.7887293, 1.296623, 0.3362511, 0.5843138, 1, 0, 1,
-0.7793875, -1.18241, -2.713324, 0.5764706, 1, 0, 1,
-0.7773407, 0.2668693, -0.04552007, 0.572549, 1, 0, 1,
-0.7755479, 1.930213, 1.472807, 0.5647059, 1, 0, 1,
-0.7742214, -0.8928226, -1.725409, 0.5607843, 1, 0, 1,
-0.770152, -0.4137117, -2.812494, 0.5529412, 1, 0, 1,
-0.7623326, -0.2029846, 0.3384582, 0.5490196, 1, 0, 1,
-0.7618092, -0.4240385, -2.440707, 0.5411765, 1, 0, 1,
-0.7610972, -0.4039273, -2.543669, 0.5372549, 1, 0, 1,
-0.7586635, -0.5001621, -2.521161, 0.5294118, 1, 0, 1,
-0.7569999, 0.2834832, -1.830293, 0.5254902, 1, 0, 1,
-0.7521076, -0.4508433, -0.2302428, 0.5176471, 1, 0, 1,
-0.7486302, -1.09983, -1.934428, 0.5137255, 1, 0, 1,
-0.7315441, 1.118615, 0.6469153, 0.5058824, 1, 0, 1,
-0.7278807, 1.822639, -2.505927, 0.5019608, 1, 0, 1,
-0.7249294, 0.9312269, -0.278637, 0.4941176, 1, 0, 1,
-0.7195185, -0.2946315, -1.650433, 0.4862745, 1, 0, 1,
-0.7180773, 0.1691115, -2.654729, 0.4823529, 1, 0, 1,
-0.7115225, 1.102842, 0.4878522, 0.4745098, 1, 0, 1,
-0.7106152, -0.5470657, -2.202355, 0.4705882, 1, 0, 1,
-0.7084312, -0.07786331, -0.4051066, 0.4627451, 1, 0, 1,
-0.7041713, 0.5764847, 0.1365946, 0.4588235, 1, 0, 1,
-0.7018774, -0.4345003, -2.57479, 0.4509804, 1, 0, 1,
-0.700186, 0.7522269, -1.498937, 0.4470588, 1, 0, 1,
-0.6953985, 0.2694306, -1.630847, 0.4392157, 1, 0, 1,
-0.6936314, -0.6274335, -2.670418, 0.4352941, 1, 0, 1,
-0.6933901, 1.014035, -1.979189, 0.427451, 1, 0, 1,
-0.6922221, 0.5524593, -2.456871, 0.4235294, 1, 0, 1,
-0.6916866, 0.3683756, -1.08338, 0.4156863, 1, 0, 1,
-0.6916384, -0.5334614, -2.166759, 0.4117647, 1, 0, 1,
-0.6855184, 0.8079991, -0.1012357, 0.4039216, 1, 0, 1,
-0.6840374, 1.223037, -1.711803, 0.3960784, 1, 0, 1,
-0.6837984, 0.773349, -0.3625444, 0.3921569, 1, 0, 1,
-0.6832834, 0.1974512, -3.257513, 0.3843137, 1, 0, 1,
-0.6776152, 2.388066, 0.06140985, 0.3803922, 1, 0, 1,
-0.6750173, -0.08192664, -0.4680962, 0.372549, 1, 0, 1,
-0.6696824, 1.136236, -0.8456451, 0.3686275, 1, 0, 1,
-0.6670422, 1.00312, 0.2233754, 0.3607843, 1, 0, 1,
-0.6646074, 0.1794223, -2.580124, 0.3568628, 1, 0, 1,
-0.6627651, -0.1723071, -1.124609, 0.3490196, 1, 0, 1,
-0.6609418, 0.1490117, -0.756258, 0.345098, 1, 0, 1,
-0.6602928, -0.7244639, -2.400208, 0.3372549, 1, 0, 1,
-0.6571268, -0.9432094, -3.015856, 0.3333333, 1, 0, 1,
-0.6542355, 1.697512, -0.9780044, 0.3254902, 1, 0, 1,
-0.6531623, -0.5143558, -1.594702, 0.3215686, 1, 0, 1,
-0.6515062, 0.7626425, -0.3810475, 0.3137255, 1, 0, 1,
-0.6505466, 0.1040886, -1.944296, 0.3098039, 1, 0, 1,
-0.6505142, 2.645751, -0.04239891, 0.3019608, 1, 0, 1,
-0.6490712, 0.6833305, -0.210328, 0.2941177, 1, 0, 1,
-0.6422437, -0.08445167, -1.703305, 0.2901961, 1, 0, 1,
-0.6385658, -0.6961083, -3.122895, 0.282353, 1, 0, 1,
-0.6315973, -0.01785376, -3.72038, 0.2784314, 1, 0, 1,
-0.619315, -1.056039, -5.24916, 0.2705882, 1, 0, 1,
-0.6186062, 0.5436564, -2.56682, 0.2666667, 1, 0, 1,
-0.6162195, 1.890956, -0.3430515, 0.2588235, 1, 0, 1,
-0.6100489, -0.560411, -3.052319, 0.254902, 1, 0, 1,
-0.6018277, 0.05741291, -1.727179, 0.2470588, 1, 0, 1,
-0.598818, 0.3675565, -0.2106196, 0.2431373, 1, 0, 1,
-0.5921271, 0.5308658, -0.4073239, 0.2352941, 1, 0, 1,
-0.5895575, 0.8337497, 0.3739916, 0.2313726, 1, 0, 1,
-0.5891094, 0.7877259, 0.8036955, 0.2235294, 1, 0, 1,
-0.5768654, -1.047526, -3.213705, 0.2196078, 1, 0, 1,
-0.575466, 0.2670582, -0.6247754, 0.2117647, 1, 0, 1,
-0.5724491, 0.4503006, -0.4193503, 0.2078431, 1, 0, 1,
-0.5708528, -0.2076771, -0.9634175, 0.2, 1, 0, 1,
-0.5703465, -0.4583386, -2.244905, 0.1921569, 1, 0, 1,
-0.5650393, 0.3367475, -0.4706608, 0.1882353, 1, 0, 1,
-0.5630062, -0.3825547, -2.90498, 0.1803922, 1, 0, 1,
-0.5625374, 0.5700762, -1.126181, 0.1764706, 1, 0, 1,
-0.5612302, 0.5432747, -0.5965322, 0.1686275, 1, 0, 1,
-0.5539283, -0.8392683, -1.278985, 0.1647059, 1, 0, 1,
-0.549556, 2.5587, 0.6215076, 0.1568628, 1, 0, 1,
-0.548494, -1.77154, -2.427593, 0.1529412, 1, 0, 1,
-0.5479661, 1.204602, -2.502017, 0.145098, 1, 0, 1,
-0.5432805, 0.1623384, -1.919863, 0.1411765, 1, 0, 1,
-0.5388443, 1.617377, 0.5192385, 0.1333333, 1, 0, 1,
-0.5372743, -0.8945373, -2.320827, 0.1294118, 1, 0, 1,
-0.5235915, -0.5673794, -3.22171, 0.1215686, 1, 0, 1,
-0.5235316, 1.149119, -0.3533884, 0.1176471, 1, 0, 1,
-0.5171339, 1.036596, 0.8774284, 0.1098039, 1, 0, 1,
-0.5167865, -1.480619, -3.074143, 0.1058824, 1, 0, 1,
-0.5139034, -0.5951436, -2.374846, 0.09803922, 1, 0, 1,
-0.5085123, -0.9677106, -1.414438, 0.09019608, 1, 0, 1,
-0.5041189, -0.2300589, -1.902469, 0.08627451, 1, 0, 1,
-0.5020825, 0.1928936, -0.9706963, 0.07843138, 1, 0, 1,
-0.4992293, 0.2828721, 1.136586, 0.07450981, 1, 0, 1,
-0.4972679, -1.104707, -2.473176, 0.06666667, 1, 0, 1,
-0.4954476, 0.396547, -0.9669994, 0.0627451, 1, 0, 1,
-0.4909183, -0.7361912, -3.244909, 0.05490196, 1, 0, 1,
-0.4908252, -1.494813, -1.732287, 0.05098039, 1, 0, 1,
-0.4907608, 0.2855222, -0.4072743, 0.04313726, 1, 0, 1,
-0.4899311, -0.5905386, -1.709858, 0.03921569, 1, 0, 1,
-0.4877894, 1.363622, -1.064041, 0.03137255, 1, 0, 1,
-0.4853912, 0.1103646, -1.864493, 0.02745098, 1, 0, 1,
-0.4832374, 0.1042551, -0.7223428, 0.01960784, 1, 0, 1,
-0.481933, -2.892841, -2.802682, 0.01568628, 1, 0, 1,
-0.4796203, 0.2316108, -1.183024, 0.007843138, 1, 0, 1,
-0.4784129, 0.04159645, -0.4599066, 0.003921569, 1, 0, 1,
-0.475547, -1.051263, -2.628061, 0, 1, 0.003921569, 1,
-0.4748321, 1.039182, -1.692843, 0, 1, 0.01176471, 1,
-0.4729975, 0.03468707, -0.8891009, 0, 1, 0.01568628, 1,
-0.4652326, 1.551261, 1.359758, 0, 1, 0.02352941, 1,
-0.4584719, -0.01819806, -0.7922761, 0, 1, 0.02745098, 1,
-0.456264, -0.2458584, -2.820651, 0, 1, 0.03529412, 1,
-0.4523157, -1.413747, -2.931833, 0, 1, 0.03921569, 1,
-0.4478413, -3.026236, -2.236696, 0, 1, 0.04705882, 1,
-0.4470166, -0.5523075, -3.124175, 0, 1, 0.05098039, 1,
-0.4438172, 0.2462843, -1.79878, 0, 1, 0.05882353, 1,
-0.4370519, 0.7711605, 0.358688, 0, 1, 0.0627451, 1,
-0.4319686, 1.733538, -0.3941245, 0, 1, 0.07058824, 1,
-0.4306796, -0.4747067, -2.050041, 0, 1, 0.07450981, 1,
-0.4177619, -0.08588015, -0.1073372, 0, 1, 0.08235294, 1,
-0.4177111, -0.497386, -3.210464, 0, 1, 0.08627451, 1,
-0.4172556, 0.5368124, -1.105435, 0, 1, 0.09411765, 1,
-0.4156918, -0.1447672, -2.450377, 0, 1, 0.1019608, 1,
-0.4127473, 0.3607461, -1.026901, 0, 1, 0.1058824, 1,
-0.4054714, -0.5730053, -3.855393, 0, 1, 0.1137255, 1,
-0.404869, -1.753813, -5.104374, 0, 1, 0.1176471, 1,
-0.3987564, -0.61068, -2.277644, 0, 1, 0.1254902, 1,
-0.3883385, 0.5911413, -0.6211535, 0, 1, 0.1294118, 1,
-0.3875518, -1.939978, -4.502741, 0, 1, 0.1372549, 1,
-0.3859938, -0.8893306, -1.512514, 0, 1, 0.1411765, 1,
-0.3856063, 0.6461258, -0.2106047, 0, 1, 0.1490196, 1,
-0.3855991, 0.9927344, -1.088864, 0, 1, 0.1529412, 1,
-0.3850715, -1.683236, -5.609162, 0, 1, 0.1607843, 1,
-0.3819447, -0.1329914, -4.52883, 0, 1, 0.1647059, 1,
-0.3741608, 0.4546118, -1.138623, 0, 1, 0.172549, 1,
-0.3688367, -0.778019, -2.598912, 0, 1, 0.1764706, 1,
-0.3687004, -0.09658825, -1.113804, 0, 1, 0.1843137, 1,
-0.3646931, 0.9725184, -0.07915767, 0, 1, 0.1882353, 1,
-0.3595852, -0.4042985, -2.232833, 0, 1, 0.1960784, 1,
-0.3526707, -0.2440113, -0.8411623, 0, 1, 0.2039216, 1,
-0.3502041, -1.551999, -4.66411, 0, 1, 0.2078431, 1,
-0.3456205, -1.364466, -1.534066, 0, 1, 0.2156863, 1,
-0.3450668, -0.003836495, -2.434517, 0, 1, 0.2196078, 1,
-0.3357055, -2.698128, -1.797881, 0, 1, 0.227451, 1,
-0.3344145, -0.585265, -0.04988622, 0, 1, 0.2313726, 1,
-0.333167, 1.695252, 1.386977, 0, 1, 0.2392157, 1,
-0.3319212, 0.5034174, -1.073701, 0, 1, 0.2431373, 1,
-0.3291631, -0.2746148, -1.904734, 0, 1, 0.2509804, 1,
-0.3280398, 0.2209818, -0.8137696, 0, 1, 0.254902, 1,
-0.328036, -0.524633, -2.675716, 0, 1, 0.2627451, 1,
-0.3261215, 1.29373, -3.103287, 0, 1, 0.2666667, 1,
-0.3202884, 0.5040057, 0.2484826, 0, 1, 0.2745098, 1,
-0.3179625, -0.6272541, -2.32165, 0, 1, 0.2784314, 1,
-0.3177436, -0.2539653, -2.332041, 0, 1, 0.2862745, 1,
-0.3171299, -0.9501165, -2.555344, 0, 1, 0.2901961, 1,
-0.3149521, -0.8039138, -3.1206, 0, 1, 0.2980392, 1,
-0.3139823, 0.04524302, -1.973699, 0, 1, 0.3058824, 1,
-0.3132919, 0.1059501, -2.615912, 0, 1, 0.3098039, 1,
-0.3107085, -0.5514484, -1.548378, 0, 1, 0.3176471, 1,
-0.3083552, 0.1162176, -2.462249, 0, 1, 0.3215686, 1,
-0.3066267, -0.2396543, -3.151371, 0, 1, 0.3294118, 1,
-0.3011018, 1.765798, -0.2800933, 0, 1, 0.3333333, 1,
-0.2935382, -0.3951406, -2.640835, 0, 1, 0.3411765, 1,
-0.2930554, -0.2293883, -2.982572, 0, 1, 0.345098, 1,
-0.2860427, 1.566577, 0.2270256, 0, 1, 0.3529412, 1,
-0.2817013, -0.8733836, -2.217871, 0, 1, 0.3568628, 1,
-0.2785381, 1.308266, 0.1975636, 0, 1, 0.3647059, 1,
-0.2775159, -1.56097, -2.253007, 0, 1, 0.3686275, 1,
-0.2741987, -0.8086293, -1.296115, 0, 1, 0.3764706, 1,
-0.2672143, -1.43202, -2.877234, 0, 1, 0.3803922, 1,
-0.2665286, 0.2069287, -0.2682455, 0, 1, 0.3882353, 1,
-0.2663011, -1.226087, -4.407226, 0, 1, 0.3921569, 1,
-0.2610155, 0.4995497, -1.259907, 0, 1, 0.4, 1,
-0.2577362, -0.2241001, -2.723889, 0, 1, 0.4078431, 1,
-0.2573519, -1.152559, -3.685669, 0, 1, 0.4117647, 1,
-0.2558588, -0.7215796, -2.599645, 0, 1, 0.4196078, 1,
-0.2518119, 1.78217, -0.6437911, 0, 1, 0.4235294, 1,
-0.2500727, 1.077754, -1.208319, 0, 1, 0.4313726, 1,
-0.2489126, 0.3248577, -3.024326, 0, 1, 0.4352941, 1,
-0.2485708, -0.004363766, 0.05301448, 0, 1, 0.4431373, 1,
-0.2445923, 0.5801416, 0.3361386, 0, 1, 0.4470588, 1,
-0.2444823, -0.08561002, -2.966264, 0, 1, 0.454902, 1,
-0.2434332, -1.474844, -2.145285, 0, 1, 0.4588235, 1,
-0.2410684, 1.20665, -1.461772, 0, 1, 0.4666667, 1,
-0.236828, -0.6922303, -3.974666, 0, 1, 0.4705882, 1,
-0.236447, -0.6803792, -4.235591, 0, 1, 0.4784314, 1,
-0.2339447, -0.270568, -4.028332, 0, 1, 0.4823529, 1,
-0.2332652, 0.2526503, -1.167515, 0, 1, 0.4901961, 1,
-0.2304866, -0.0448309, -1.97952, 0, 1, 0.4941176, 1,
-0.2275056, 0.4560753, 1.202787, 0, 1, 0.5019608, 1,
-0.2242721, 0.7343581, -0.4219573, 0, 1, 0.509804, 1,
-0.2173405, 1.985671, -0.08618356, 0, 1, 0.5137255, 1,
-0.2164104, 1.804187, -0.2587447, 0, 1, 0.5215687, 1,
-0.2148325, 0.8220893, -0.4979902, 0, 1, 0.5254902, 1,
-0.212474, 0.2118396, -0.03015979, 0, 1, 0.5333334, 1,
-0.2107249, 0.614583, -0.3629934, 0, 1, 0.5372549, 1,
-0.2087954, 1.109988, 0.4927139, 0, 1, 0.5450981, 1,
-0.2076858, 0.5583327, 0.6118183, 0, 1, 0.5490196, 1,
-0.2023504, -0.8146874, -1.828038, 0, 1, 0.5568628, 1,
-0.2021597, -1.184939, -3.327193, 0, 1, 0.5607843, 1,
-0.2006693, -0.2467922, -1.84319, 0, 1, 0.5686275, 1,
-0.1998678, 1.685756, 1.024121, 0, 1, 0.572549, 1,
-0.1997761, -0.1834965, -2.367069, 0, 1, 0.5803922, 1,
-0.1981531, 0.3972514, 0.7900864, 0, 1, 0.5843138, 1,
-0.1947076, 0.8570144, 0.5922341, 0, 1, 0.5921569, 1,
-0.1923809, 0.1587459, -1.88127, 0, 1, 0.5960785, 1,
-0.1920788, 0.9376181, 0.2936621, 0, 1, 0.6039216, 1,
-0.1906022, 0.117961, -0.7114801, 0, 1, 0.6117647, 1,
-0.1828713, -1.400356, -3.908909, 0, 1, 0.6156863, 1,
-0.1781845, -0.04293758, -2.597627, 0, 1, 0.6235294, 1,
-0.1747875, -0.3880709, -1.732177, 0, 1, 0.627451, 1,
-0.1746883, -0.7418803, -1.519941, 0, 1, 0.6352941, 1,
-0.1720737, -1.097944, -3.002989, 0, 1, 0.6392157, 1,
-0.1714981, 1.958785, -0.5304515, 0, 1, 0.6470588, 1,
-0.1665991, -1.249903, -4.2026, 0, 1, 0.6509804, 1,
-0.1644022, 0.1475374, -1.727246, 0, 1, 0.6588235, 1,
-0.1610105, 0.00231649, -1.055905, 0, 1, 0.6627451, 1,
-0.1593747, 0.4559293, -0.1159489, 0, 1, 0.6705883, 1,
-0.1469726, -0.02099627, -1.913743, 0, 1, 0.6745098, 1,
-0.1464396, -0.3165411, -3.506988, 0, 1, 0.682353, 1,
-0.1464349, -1.187157, -2.163062, 0, 1, 0.6862745, 1,
-0.1462598, -0.5650946, -2.4054, 0, 1, 0.6941177, 1,
-0.1424944, -0.3484737, -1.712255, 0, 1, 0.7019608, 1,
-0.1409923, -0.512059, -3.707553, 0, 1, 0.7058824, 1,
-0.1400594, -1.261428, -2.540629, 0, 1, 0.7137255, 1,
-0.1354474, -0.3397613, -4.050298, 0, 1, 0.7176471, 1,
-0.1338171, -0.6953143, -2.810219, 0, 1, 0.7254902, 1,
-0.1337638, 0.5981811, -0.4254491, 0, 1, 0.7294118, 1,
-0.1324239, -0.6419969, -1.079261, 0, 1, 0.7372549, 1,
-0.132298, -0.2108033, -2.123909, 0, 1, 0.7411765, 1,
-0.1257987, 1.634794, -0.2373517, 0, 1, 0.7490196, 1,
-0.1254384, 0.5270774, -0.4732743, 0, 1, 0.7529412, 1,
-0.1218111, -0.4386971, -3.288233, 0, 1, 0.7607843, 1,
-0.1187594, -0.3849972, -2.770409, 0, 1, 0.7647059, 1,
-0.1143904, 2.409767, 0.3806808, 0, 1, 0.772549, 1,
-0.1130163, -0.2158385, -2.390444, 0, 1, 0.7764706, 1,
-0.1101645, 1.252603, -1.787661, 0, 1, 0.7843137, 1,
-0.1077378, -0.579512, -2.815691, 0, 1, 0.7882353, 1,
-0.1065625, 1.881117, -0.09734321, 0, 1, 0.7960784, 1,
-0.1051648, -1.916389, -3.134341, 0, 1, 0.8039216, 1,
-0.1047376, 0.7198681, 0.1462187, 0, 1, 0.8078431, 1,
-0.0998625, 1.217356, 0.274298, 0, 1, 0.8156863, 1,
-0.09471444, -0.5524357, -1.506239, 0, 1, 0.8196079, 1,
-0.0943724, -0.1656509, -2.3637, 0, 1, 0.827451, 1,
-0.0936664, -1.435213, -2.969297, 0, 1, 0.8313726, 1,
-0.09107708, -0.3805804, -2.628705, 0, 1, 0.8392157, 1,
-0.08750404, 0.2644356, -0.5027507, 0, 1, 0.8431373, 1,
-0.08464281, 1.139982, 0.4308982, 0, 1, 0.8509804, 1,
-0.08450792, 0.1003717, -0.6651686, 0, 1, 0.854902, 1,
-0.08365389, 0.413473, -0.7783244, 0, 1, 0.8627451, 1,
-0.08131203, -0.2568637, -3.2317, 0, 1, 0.8666667, 1,
-0.08130676, -2.391562, -2.006184, 0, 1, 0.8745098, 1,
-0.08040225, 0.1267436, 0.02627672, 0, 1, 0.8784314, 1,
-0.07885864, 0.04082485, -1.967385, 0, 1, 0.8862745, 1,
-0.07596081, -0.1750845, -2.971314, 0, 1, 0.8901961, 1,
-0.07465166, 0.3145551, -0.2338189, 0, 1, 0.8980392, 1,
-0.07347467, 1.100374, -0.3355882, 0, 1, 0.9058824, 1,
-0.0723944, -0.01645658, -0.7122889, 0, 1, 0.9098039, 1,
-0.07239037, -1.192923, -3.323085, 0, 1, 0.9176471, 1,
-0.07153324, -1.096849, -3.741718, 0, 1, 0.9215686, 1,
-0.06854936, -1.646073, -2.040312, 0, 1, 0.9294118, 1,
-0.06846149, -0.004597004, -1.652345, 0, 1, 0.9333333, 1,
-0.06814222, 0.9081846, -0.08129621, 0, 1, 0.9411765, 1,
-0.06430898, -1.001595, -2.341254, 0, 1, 0.945098, 1,
-0.06371952, 0.6099065, -0.7468799, 0, 1, 0.9529412, 1,
-0.06013422, 1.715123, -1.670234, 0, 1, 0.9568627, 1,
-0.05745898, 0.6798495, 0.000235863, 0, 1, 0.9647059, 1,
-0.05561376, 0.06468812, 0.4299935, 0, 1, 0.9686275, 1,
-0.05471269, -0.5560159, -2.665508, 0, 1, 0.9764706, 1,
-0.05378255, -1.715859, -4.275425, 0, 1, 0.9803922, 1,
-0.04643924, 0.5418552, 0.5701919, 0, 1, 0.9882353, 1,
-0.0437335, 0.07843806, -0.374564, 0, 1, 0.9921569, 1,
-0.04000204, 0.1770499, -0.9585423, 0, 1, 1, 1,
-0.03783606, -0.01050984, -1.922951, 0, 0.9921569, 1, 1,
-0.03752006, -0.1810591, -2.948528, 0, 0.9882353, 1, 1,
-0.03341527, -0.4696517, -3.050021, 0, 0.9803922, 1, 1,
-0.03316335, -0.6566625, -2.774292, 0, 0.9764706, 1, 1,
-0.03240047, -0.8376477, -2.573764, 0, 0.9686275, 1, 1,
-0.0314285, 0.1454303, -0.4660217, 0, 0.9647059, 1, 1,
-0.02162384, 0.01800136, -0.8123673, 0, 0.9568627, 1, 1,
-0.02089734, 0.2592813, 0.9385321, 0, 0.9529412, 1, 1,
-0.01614681, -0.1509004, -3.936847, 0, 0.945098, 1, 1,
-0.01518689, -0.315142, -2.485953, 0, 0.9411765, 1, 1,
-0.01339773, 0.467359, -0.6883298, 0, 0.9333333, 1, 1,
-0.01301071, -0.2542537, -1.620899, 0, 0.9294118, 1, 1,
-0.0103886, -1.352515, -4.698604, 0, 0.9215686, 1, 1,
-0.01006638, 0.5428458, -0.9154112, 0, 0.9176471, 1, 1,
-0.007625535, -0.4896794, -2.585458, 0, 0.9098039, 1, 1,
-0.007106763, -0.8746001, -4.616942, 0, 0.9058824, 1, 1,
-0.006637001, 1.327093, -2.181265, 0, 0.8980392, 1, 1,
0.003724817, -0.1632396, 3.290401, 0, 0.8901961, 1, 1,
0.006100629, -0.2083813, 3.161439, 0, 0.8862745, 1, 1,
0.007550751, -0.3882795, 3.041119, 0, 0.8784314, 1, 1,
0.008349298, 0.8077566, -0.4825876, 0, 0.8745098, 1, 1,
0.0128945, -0.2472162, 2.9732, 0, 0.8666667, 1, 1,
0.0144727, -0.3468387, 1.169201, 0, 0.8627451, 1, 1,
0.01643306, -1.386958, 2.301614, 0, 0.854902, 1, 1,
0.01973034, -1.157512, 4.152854, 0, 0.8509804, 1, 1,
0.02155354, -0.9406731, 4.565737, 0, 0.8431373, 1, 1,
0.02684838, 0.3085987, -1.354196, 0, 0.8392157, 1, 1,
0.03089309, 1.0992, -0.7150126, 0, 0.8313726, 1, 1,
0.03378057, -0.6556361, 3.150442, 0, 0.827451, 1, 1,
0.03582314, -1.397459, 4.606573, 0, 0.8196079, 1, 1,
0.03594485, -0.2025574, 2.61766, 0, 0.8156863, 1, 1,
0.03613151, 0.04201035, 2.138315, 0, 0.8078431, 1, 1,
0.03719373, 0.9475411, 1.756808, 0, 0.8039216, 1, 1,
0.05482682, -1.008391, 2.401453, 0, 0.7960784, 1, 1,
0.05839935, -1.421125, 4.139399, 0, 0.7882353, 1, 1,
0.0736678, 1.393602, 0.1084848, 0, 0.7843137, 1, 1,
0.07645365, -0.05730197, 2.224648, 0, 0.7764706, 1, 1,
0.07919062, -1.342278, 3.725267, 0, 0.772549, 1, 1,
0.08120742, 0.3047125, -0.576507, 0, 0.7647059, 1, 1,
0.08495907, 0.1612363, 0.1821791, 0, 0.7607843, 1, 1,
0.0870153, -0.04327419, 3.006614, 0, 0.7529412, 1, 1,
0.09034956, 1.681351, -0.7669408, 0, 0.7490196, 1, 1,
0.09048893, 1.556348, 0.3482001, 0, 0.7411765, 1, 1,
0.09117229, 0.2096574, 0.1623015, 0, 0.7372549, 1, 1,
0.09292997, 0.2879023, -0.4001869, 0, 0.7294118, 1, 1,
0.09337859, 1.249829, 1.815003, 0, 0.7254902, 1, 1,
0.09410863, -0.2397678, 2.273828, 0, 0.7176471, 1, 1,
0.09463169, 1.127241, -0.2194355, 0, 0.7137255, 1, 1,
0.0956526, 1.458245, -0.4159913, 0, 0.7058824, 1, 1,
0.09692466, 0.7461244, 1.467432, 0, 0.6980392, 1, 1,
0.0985957, 0.9688069, -0.1087979, 0, 0.6941177, 1, 1,
0.09927859, 0.9717887, -0.01098646, 0, 0.6862745, 1, 1,
0.1048311, 1.019644, 0.77885, 0, 0.682353, 1, 1,
0.1055385, -0.9123552, 3.830034, 0, 0.6745098, 1, 1,
0.1056254, 1.109728, 1.386836, 0, 0.6705883, 1, 1,
0.1090461, -1.306136, 1.823705, 0, 0.6627451, 1, 1,
0.1091339, 1.273128, -0.3494215, 0, 0.6588235, 1, 1,
0.1098051, -0.1713644, 4.144032, 0, 0.6509804, 1, 1,
0.1124789, -0.1892544, 4.17568, 0, 0.6470588, 1, 1,
0.1134986, 0.5674428, -0.9854658, 0, 0.6392157, 1, 1,
0.1192044, 0.47168, -0.5765815, 0, 0.6352941, 1, 1,
0.129572, 0.6551828, -0.03479464, 0, 0.627451, 1, 1,
0.1330625, 1.984878, -2.105026, 0, 0.6235294, 1, 1,
0.140906, -0.110096, 1.487952, 0, 0.6156863, 1, 1,
0.1563439, -0.5931245, 0.7694414, 0, 0.6117647, 1, 1,
0.1565765, 0.903183, 1.991653, 0, 0.6039216, 1, 1,
0.1572914, -1.272415, 2.604477, 0, 0.5960785, 1, 1,
0.1580913, -1.194158, 3.287839, 0, 0.5921569, 1, 1,
0.1582793, 0.5244883, 0.4547207, 0, 0.5843138, 1, 1,
0.1602176, -0.1709603, 2.253227, 0, 0.5803922, 1, 1,
0.1661001, 0.7750074, -0.05829474, 0, 0.572549, 1, 1,
0.1671062, -1.097386, 3.362826, 0, 0.5686275, 1, 1,
0.1723679, 0.8562523, 1.142788, 0, 0.5607843, 1, 1,
0.1746908, 1.676608, 0.6805514, 0, 0.5568628, 1, 1,
0.1871968, -0.2332803, 1.95939, 0, 0.5490196, 1, 1,
0.1913994, 0.06080185, 1.714957, 0, 0.5450981, 1, 1,
0.1933123, 0.6030916, 1.10643, 0, 0.5372549, 1, 1,
0.1969399, 0.731908, -1.282101, 0, 0.5333334, 1, 1,
0.202158, 0.3940917, 3.064604, 0, 0.5254902, 1, 1,
0.2050716, 0.6866549, 1.595307, 0, 0.5215687, 1, 1,
0.2078776, -0.4720397, 2.114906, 0, 0.5137255, 1, 1,
0.2080965, -2.094275, 2.928228, 0, 0.509804, 1, 1,
0.2122915, -0.8832808, 1.98471, 0, 0.5019608, 1, 1,
0.2172351, -0.04128453, 2.350653, 0, 0.4941176, 1, 1,
0.2189899, -0.7122208, 3.445656, 0, 0.4901961, 1, 1,
0.2268541, 0.8687661, -0.3705171, 0, 0.4823529, 1, 1,
0.2285284, 2.018161, 0.4480709, 0, 0.4784314, 1, 1,
0.2304498, 0.2083626, -0.6226363, 0, 0.4705882, 1, 1,
0.2380489, 1.184476, -1.080737, 0, 0.4666667, 1, 1,
0.2441646, -0.5788022, 2.652337, 0, 0.4588235, 1, 1,
0.2500343, -0.390249, 3.470505, 0, 0.454902, 1, 1,
0.2529469, -0.8340161, 1.727242, 0, 0.4470588, 1, 1,
0.252953, 1.234291, 1.552932, 0, 0.4431373, 1, 1,
0.2536303, -0.4124549, 1.937815, 0, 0.4352941, 1, 1,
0.2543558, 0.5300869, -0.4344291, 0, 0.4313726, 1, 1,
0.2551173, 0.9594218, 1.012961, 0, 0.4235294, 1, 1,
0.2561163, -0.8377367, 2.273408, 0, 0.4196078, 1, 1,
0.2622736, 1.2287, -1.288467, 0, 0.4117647, 1, 1,
0.2636748, -0.05271178, 0.7818472, 0, 0.4078431, 1, 1,
0.264992, 1.111063, 1.030944, 0, 0.4, 1, 1,
0.2658997, -0.5405126, 2.164781, 0, 0.3921569, 1, 1,
0.2673514, 0.814355, -1.398706, 0, 0.3882353, 1, 1,
0.2710156, 1.130552, 1.296176, 0, 0.3803922, 1, 1,
0.2760609, -1.092143, 2.376445, 0, 0.3764706, 1, 1,
0.2768826, -0.6440207, 2.991952, 0, 0.3686275, 1, 1,
0.2809302, -0.9943805, 4.592232, 0, 0.3647059, 1, 1,
0.2859316, -1.308169, 1.91098, 0, 0.3568628, 1, 1,
0.2888397, 0.2120816, 0.4905053, 0, 0.3529412, 1, 1,
0.2926553, 1.594715, -0.5122151, 0, 0.345098, 1, 1,
0.2943284, -2.376308, 2.523527, 0, 0.3411765, 1, 1,
0.3018668, -0.2100886, 1.610955, 0, 0.3333333, 1, 1,
0.3066185, -1.02091, 1.955576, 0, 0.3294118, 1, 1,
0.3077632, -0.6959317, 2.087663, 0, 0.3215686, 1, 1,
0.3079888, -0.8471423, 2.57642, 0, 0.3176471, 1, 1,
0.3094428, -1.348381, 2.643598, 0, 0.3098039, 1, 1,
0.3096856, 0.2758013, 0.8689117, 0, 0.3058824, 1, 1,
0.3105294, -1.204008, 3.999393, 0, 0.2980392, 1, 1,
0.3143746, -0.2658324, 4.649075, 0, 0.2901961, 1, 1,
0.3188946, -0.5395335, -0.3506244, 0, 0.2862745, 1, 1,
0.3237456, 0.2488863, 0.1646427, 0, 0.2784314, 1, 1,
0.3259783, -0.5407031, 0.2059353, 0, 0.2745098, 1, 1,
0.3270119, 0.9531813, 1.310415, 0, 0.2666667, 1, 1,
0.3287527, -1.403413, 2.890591, 0, 0.2627451, 1, 1,
0.3309661, -0.2666868, 2.840587, 0, 0.254902, 1, 1,
0.3316692, -0.8647927, 3.210843, 0, 0.2509804, 1, 1,
0.3337457, -0.7167383, 2.648763, 0, 0.2431373, 1, 1,
0.3375259, 1.81996, 1.059187, 0, 0.2392157, 1, 1,
0.3390598, -0.6515237, 4.369685, 0, 0.2313726, 1, 1,
0.341166, -0.521363, 2.453167, 0, 0.227451, 1, 1,
0.3457168, 0.7334206, -0.3431312, 0, 0.2196078, 1, 1,
0.3482024, -0.3699631, 1.458541, 0, 0.2156863, 1, 1,
0.3540831, 0.5877677, 2.993568, 0, 0.2078431, 1, 1,
0.3594248, 1.099713, -1.010826, 0, 0.2039216, 1, 1,
0.3600352, 2.003761, -0.9774026, 0, 0.1960784, 1, 1,
0.360812, -0.1162192, 2.687126, 0, 0.1882353, 1, 1,
0.3617842, 0.580214, 0.1148464, 0, 0.1843137, 1, 1,
0.3653805, -0.1038165, 1.834322, 0, 0.1764706, 1, 1,
0.3703151, -0.273776, 2.105433, 0, 0.172549, 1, 1,
0.3724207, -0.298486, 3.908223, 0, 0.1647059, 1, 1,
0.3782836, -0.6417946, 3.630069, 0, 0.1607843, 1, 1,
0.3783344, 1.047827, 1.567701, 0, 0.1529412, 1, 1,
0.3814692, 1.204058, -0.2509201, 0, 0.1490196, 1, 1,
0.381599, 0.8141655, 0.2933875, 0, 0.1411765, 1, 1,
0.3831448, -1.770644, 4.594301, 0, 0.1372549, 1, 1,
0.3837889, 0.3124712, 1.657792, 0, 0.1294118, 1, 1,
0.3846568, 0.2156689, 1.893676, 0, 0.1254902, 1, 1,
0.384786, 0.6732041, 0.6588002, 0, 0.1176471, 1, 1,
0.3898925, 0.1789072, 1.555489, 0, 0.1137255, 1, 1,
0.3903967, -0.1918851, 2.363993, 0, 0.1058824, 1, 1,
0.3976844, 0.8566151, 0.6025338, 0, 0.09803922, 1, 1,
0.398316, 0.8762298, -2.415602, 0, 0.09411765, 1, 1,
0.399278, 0.07797832, 0.1119822, 0, 0.08627451, 1, 1,
0.3999358, -0.2937508, 1.842281, 0, 0.08235294, 1, 1,
0.4097103, 0.9914921, 2.322632, 0, 0.07450981, 1, 1,
0.4211605, 1.371204, 0.8136901, 0, 0.07058824, 1, 1,
0.4238254, 0.775597, 0.3759144, 0, 0.0627451, 1, 1,
0.4239339, -1.22172, 5.722407, 0, 0.05882353, 1, 1,
0.4247382, -1.439661, 1.609516, 0, 0.05098039, 1, 1,
0.4293626, -0.0983669, 1.908236, 0, 0.04705882, 1, 1,
0.43124, -0.2560969, 2.493866, 0, 0.03921569, 1, 1,
0.4363036, 0.1853977, 1.669427, 0, 0.03529412, 1, 1,
0.4368568, 0.6510876, -0.07282039, 0, 0.02745098, 1, 1,
0.4369785, 2.696781, -0.7808977, 0, 0.02352941, 1, 1,
0.4411198, 0.5471261, 0.2177801, 0, 0.01568628, 1, 1,
0.4431021, 1.587235, 0.2260526, 0, 0.01176471, 1, 1,
0.4504068, -0.9709769, 3.395228, 0, 0.003921569, 1, 1,
0.4510937, 1.04302, 0.4516004, 0.003921569, 0, 1, 1,
0.4519105, 1.80318, -0.06242992, 0.007843138, 0, 1, 1,
0.4540095, -2.371336, 3.911978, 0.01568628, 0, 1, 1,
0.4555371, -1.048668, 2.537163, 0.01960784, 0, 1, 1,
0.4563454, -1.187454, 1.821292, 0.02745098, 0, 1, 1,
0.4564068, -2.411305, 3.598988, 0.03137255, 0, 1, 1,
0.4581577, -2.254738, 4.057428, 0.03921569, 0, 1, 1,
0.4603957, -0.496012, 1.311462, 0.04313726, 0, 1, 1,
0.4686351, 1.1722, 0.2703573, 0.05098039, 0, 1, 1,
0.4699227, 0.3695716, 0.4312486, 0.05490196, 0, 1, 1,
0.4701439, 0.6662532, 0.2310479, 0.0627451, 0, 1, 1,
0.4706864, 0.752962, 2.269279, 0.06666667, 0, 1, 1,
0.4712953, -0.1429772, 3.398613, 0.07450981, 0, 1, 1,
0.4722559, 1.159587, 1.633247, 0.07843138, 0, 1, 1,
0.4732504, -0.5923993, 0.9339018, 0.08627451, 0, 1, 1,
0.4750388, -0.3299554, 2.675375, 0.09019608, 0, 1, 1,
0.4784326, 0.5615391, 0.5747834, 0.09803922, 0, 1, 1,
0.4801953, 0.6944185, 0.3476067, 0.1058824, 0, 1, 1,
0.4809684, 1.03925, 1.549561, 0.1098039, 0, 1, 1,
0.4812824, 0.5426933, -1.002559, 0.1176471, 0, 1, 1,
0.4818924, 0.6361924, 1.354906, 0.1215686, 0, 1, 1,
0.4835656, 0.4489187, 0.05377217, 0.1294118, 0, 1, 1,
0.4838914, 0.5395201, -0.3562093, 0.1333333, 0, 1, 1,
0.4867894, -0.1696991, 3.665934, 0.1411765, 0, 1, 1,
0.4883948, -1.159223, 1.080813, 0.145098, 0, 1, 1,
0.4907243, 0.4123312, 1.147391, 0.1529412, 0, 1, 1,
0.490884, 0.8950324, -0.113151, 0.1568628, 0, 1, 1,
0.4908891, 1.610242, 1.145815, 0.1647059, 0, 1, 1,
0.4910867, 0.06549173, 4.092107, 0.1686275, 0, 1, 1,
0.4928139, 0.9073101, 0.8685849, 0.1764706, 0, 1, 1,
0.4948924, -0.4958119, 3.541458, 0.1803922, 0, 1, 1,
0.4970078, 0.05758123, 1.540151, 0.1882353, 0, 1, 1,
0.4977138, 0.584367, -0.06982104, 0.1921569, 0, 1, 1,
0.5033445, 1.609111, 0.03363369, 0.2, 0, 1, 1,
0.5083548, -0.3779337, 2.631209, 0.2078431, 0, 1, 1,
0.5118842, -1.163958, 1.703578, 0.2117647, 0, 1, 1,
0.5120342, -1.482021, 3.22015, 0.2196078, 0, 1, 1,
0.5134888, -0.8939924, 2.14501, 0.2235294, 0, 1, 1,
0.5144807, 1.142439, -0.2506349, 0.2313726, 0, 1, 1,
0.5157939, 0.804015, 1.044694, 0.2352941, 0, 1, 1,
0.516102, -0.1563971, 2.251593, 0.2431373, 0, 1, 1,
0.5205271, -0.5036485, 2.830958, 0.2470588, 0, 1, 1,
0.5234619, 0.7944104, 2.024551, 0.254902, 0, 1, 1,
0.523731, 0.8741401, -0.282691, 0.2588235, 0, 1, 1,
0.5247502, 0.132011, 0.2831039, 0.2666667, 0, 1, 1,
0.5250653, 1.293755, -0.7192661, 0.2705882, 0, 1, 1,
0.5265462, -0.6997791, 1.882993, 0.2784314, 0, 1, 1,
0.5282567, 0.6315628, 0.8775484, 0.282353, 0, 1, 1,
0.5289537, 1.262196, 2.182634, 0.2901961, 0, 1, 1,
0.5292913, -0.4161108, 2.008071, 0.2941177, 0, 1, 1,
0.5317082, -1.051457, 3.998221, 0.3019608, 0, 1, 1,
0.5365762, -0.9990586, 2.985205, 0.3098039, 0, 1, 1,
0.5401983, -0.01885729, 1.98815, 0.3137255, 0, 1, 1,
0.5521373, -1.019949, 3.243409, 0.3215686, 0, 1, 1,
0.5522328, 0.3462295, 0.5536018, 0.3254902, 0, 1, 1,
0.5532695, -1.17612, 2.930556, 0.3333333, 0, 1, 1,
0.5567911, -0.3379519, 1.793108, 0.3372549, 0, 1, 1,
0.5586802, -0.009470863, 1.003057, 0.345098, 0, 1, 1,
0.5600818, 0.604135, -0.2784442, 0.3490196, 0, 1, 1,
0.5618525, -0.0009075201, 1.931291, 0.3568628, 0, 1, 1,
0.5622679, -0.3091989, 2.101415, 0.3607843, 0, 1, 1,
0.5690954, 1.073681, 1.063909, 0.3686275, 0, 1, 1,
0.57766, -0.5216928, 3.858954, 0.372549, 0, 1, 1,
0.5826151, -0.4504444, 1.510296, 0.3803922, 0, 1, 1,
0.5836839, 0.6689953, 1.3531, 0.3843137, 0, 1, 1,
0.586241, 0.3564236, 1.885716, 0.3921569, 0, 1, 1,
0.5863355, -0.4390364, 3.94504, 0.3960784, 0, 1, 1,
0.5866793, 0.7364369, -0.4077989, 0.4039216, 0, 1, 1,
0.5886211, -0.03060029, 1.835016, 0.4117647, 0, 1, 1,
0.5911577, 0.845529, 0.5857264, 0.4156863, 0, 1, 1,
0.5947334, -0.1715008, 1.577122, 0.4235294, 0, 1, 1,
0.595223, 1.528876, 2.823009, 0.427451, 0, 1, 1,
0.5974662, 1.709478, 0.7021386, 0.4352941, 0, 1, 1,
0.5990708, 0.6784377, 0.777046, 0.4392157, 0, 1, 1,
0.6063504, 0.9919753, -0.7886397, 0.4470588, 0, 1, 1,
0.6105193, 0.1902465, -0.491007, 0.4509804, 0, 1, 1,
0.6160534, -0.5932355, 2.425206, 0.4588235, 0, 1, 1,
0.6260971, -0.3093154, 2.294909, 0.4627451, 0, 1, 1,
0.6276478, 0.7224553, 0.402323, 0.4705882, 0, 1, 1,
0.6299841, -0.9330208, 2.905202, 0.4745098, 0, 1, 1,
0.6304412, 1.863244, -1.109891, 0.4823529, 0, 1, 1,
0.6335605, -0.3468579, 2.320627, 0.4862745, 0, 1, 1,
0.6349957, -1.884248, 2.243659, 0.4941176, 0, 1, 1,
0.6401684, 1.141898, 1.700447, 0.5019608, 0, 1, 1,
0.641309, 0.5858648, 1.260769, 0.5058824, 0, 1, 1,
0.6444797, -0.1324905, 3.228856, 0.5137255, 0, 1, 1,
0.6448784, -0.706954, 3.089536, 0.5176471, 0, 1, 1,
0.6476105, -0.1206311, 2.803385, 0.5254902, 0, 1, 1,
0.6480613, 0.2257481, -0.005598533, 0.5294118, 0, 1, 1,
0.648867, -0.2069059, 2.720366, 0.5372549, 0, 1, 1,
0.6501635, 1.915326, -1.300612, 0.5411765, 0, 1, 1,
0.6568488, -0.9808887, 0.5703552, 0.5490196, 0, 1, 1,
0.6673619, 0.4284621, -0.2199485, 0.5529412, 0, 1, 1,
0.6686683, -1.942782, 3.102121, 0.5607843, 0, 1, 1,
0.6687471, 0.7823116, 0.9840468, 0.5647059, 0, 1, 1,
0.6831148, 0.6241397, -0.2394114, 0.572549, 0, 1, 1,
0.6833831, 0.6625587, 1.57354, 0.5764706, 0, 1, 1,
0.6937192, -1.538585, 2.421349, 0.5843138, 0, 1, 1,
0.6961565, -0.6387519, 3.260291, 0.5882353, 0, 1, 1,
0.705871, 0.04340529, 3.109663, 0.5960785, 0, 1, 1,
0.7079358, 1.143425, 1.341605, 0.6039216, 0, 1, 1,
0.7134045, -0.2311215, 1.007688, 0.6078432, 0, 1, 1,
0.7148347, 0.2682521, 1.076667, 0.6156863, 0, 1, 1,
0.7173539, 1.366818, -0.3462649, 0.6196079, 0, 1, 1,
0.7174346, 1.026412, 1.509255, 0.627451, 0, 1, 1,
0.7189676, 0.3057944, 1.543331, 0.6313726, 0, 1, 1,
0.7193857, 0.4210198, 0.5338714, 0.6392157, 0, 1, 1,
0.7198083, 0.5815544, 0.5826591, 0.6431373, 0, 1, 1,
0.7450642, -1.31605, 1.499968, 0.6509804, 0, 1, 1,
0.7466688, -0.1397035, 1.657733, 0.654902, 0, 1, 1,
0.7477562, 0.290478, 1.606306, 0.6627451, 0, 1, 1,
0.7561665, -1.199163, 2.055922, 0.6666667, 0, 1, 1,
0.7581031, 0.877103, 0.3423772, 0.6745098, 0, 1, 1,
0.7628074, -0.07085306, 2.282716, 0.6784314, 0, 1, 1,
0.7634634, 1.647146, 0.5385249, 0.6862745, 0, 1, 1,
0.7737955, 0.2994333, -1.166456, 0.6901961, 0, 1, 1,
0.7803895, -0.6799403, 1.99559, 0.6980392, 0, 1, 1,
0.7837706, 0.5656916, 2.145061, 0.7058824, 0, 1, 1,
0.7856066, 0.01750987, 2.391074, 0.7098039, 0, 1, 1,
0.7863115, 1.80239, 1.964436, 0.7176471, 0, 1, 1,
0.7908929, 1.200141, 3.257705, 0.7215686, 0, 1, 1,
0.8025766, -0.3579977, 1.320904, 0.7294118, 0, 1, 1,
0.8036458, 0.23669, 0.9810866, 0.7333333, 0, 1, 1,
0.8039175, 0.7137238, 0.853206, 0.7411765, 0, 1, 1,
0.806743, 1.626217, 1.179506, 0.7450981, 0, 1, 1,
0.8099554, -0.9532391, 3.552127, 0.7529412, 0, 1, 1,
0.8209642, 0.4655445, 3.066742, 0.7568628, 0, 1, 1,
0.8209905, 0.5089088, 0.4739974, 0.7647059, 0, 1, 1,
0.8264897, 2.513016, 0.8865599, 0.7686275, 0, 1, 1,
0.8268641, 0.9646385, 1.384102, 0.7764706, 0, 1, 1,
0.8297706, -0.8236226, 3.29447, 0.7803922, 0, 1, 1,
0.8306456, 0.9901574, 0.9747182, 0.7882353, 0, 1, 1,
0.830947, 0.002114226, 0.9226734, 0.7921569, 0, 1, 1,
0.8326113, -2.243963, 1.984013, 0.8, 0, 1, 1,
0.8396567, 0.6293507, 1.206712, 0.8078431, 0, 1, 1,
0.8396976, 0.1888159, 2.295712, 0.8117647, 0, 1, 1,
0.8403898, 0.01479806, 2.206478, 0.8196079, 0, 1, 1,
0.8413363, -1.357305, 3.175095, 0.8235294, 0, 1, 1,
0.8453828, -0.1750081, 1.926597, 0.8313726, 0, 1, 1,
0.8470271, -1.297007, 1.865595, 0.8352941, 0, 1, 1,
0.8537117, -0.3877893, 0.6475568, 0.8431373, 0, 1, 1,
0.8541438, 0.8053026, 1.57916, 0.8470588, 0, 1, 1,
0.8565513, 0.09699486, 2.086603, 0.854902, 0, 1, 1,
0.858611, -0.9170768, 4.677649, 0.8588235, 0, 1, 1,
0.8666131, 0.3514623, 0.02091848, 0.8666667, 0, 1, 1,
0.8683847, 0.6800873, 0.1210934, 0.8705882, 0, 1, 1,
0.8727903, 0.2435462, 2.416251, 0.8784314, 0, 1, 1,
0.8794957, -1.046893, 2.609468, 0.8823529, 0, 1, 1,
0.8832722, -0.4561711, 1.761662, 0.8901961, 0, 1, 1,
0.8846837, 0.468853, 1.13323, 0.8941177, 0, 1, 1,
0.8860095, 0.06108622, 2.317072, 0.9019608, 0, 1, 1,
0.8879006, -0.2820674, 1.643945, 0.9098039, 0, 1, 1,
0.8901973, -1.225009, 2.706533, 0.9137255, 0, 1, 1,
0.8956232, 1.769719, -0.6163707, 0.9215686, 0, 1, 1,
0.8963339, 0.9395025, 0.1341517, 0.9254902, 0, 1, 1,
0.897308, -0.3531021, 1.84252, 0.9333333, 0, 1, 1,
0.8979749, -0.2996783, 2.706928, 0.9372549, 0, 1, 1,
0.9027406, 0.4368654, 1.146371, 0.945098, 0, 1, 1,
0.9033077, 0.4958062, -0.3054964, 0.9490196, 0, 1, 1,
0.9128993, -0.8916574, 1.077928, 0.9568627, 0, 1, 1,
0.9224904, -1.228144, 2.6171, 0.9607843, 0, 1, 1,
0.9236357, -0.02675212, 2.160499, 0.9686275, 0, 1, 1,
0.9280139, 2.121645, -1.56343, 0.972549, 0, 1, 1,
0.9340521, 0.7993034, 0.9097987, 0.9803922, 0, 1, 1,
0.9354339, -0.0154139, 0.9233802, 0.9843137, 0, 1, 1,
0.9413604, -1.183611, 1.936539, 0.9921569, 0, 1, 1,
0.9423925, 0.9426054, 1.695645, 0.9960784, 0, 1, 1,
0.9455901, -0.6288536, 0.8902151, 1, 0, 0.9960784, 1,
0.9461022, -0.8237982, 2.846802, 1, 0, 0.9882353, 1,
0.9501308, -1.349666, 1.379341, 1, 0, 0.9843137, 1,
0.9550115, 0.5403032, 2.080456, 1, 0, 0.9764706, 1,
0.9585727, 1.188009, -1.26022, 1, 0, 0.972549, 1,
0.9608798, -0.6296448, 0.7974959, 1, 0, 0.9647059, 1,
0.9727429, 1.149866, 1.140515, 1, 0, 0.9607843, 1,
0.9728089, -0.7606348, 2.245092, 1, 0, 0.9529412, 1,
0.9755245, 0.2325093, 3.45383, 1, 0, 0.9490196, 1,
0.9781712, -0.2917531, 3.813865, 1, 0, 0.9411765, 1,
0.9842835, 0.9137942, 2.566154, 1, 0, 0.9372549, 1,
0.9916536, -0.718362, 0.1073629, 1, 0, 0.9294118, 1,
0.9925473, -0.6320201, 2.98629, 1, 0, 0.9254902, 1,
0.9991128, 0.2507162, 1.018447, 1, 0, 0.9176471, 1,
1.000204, 0.9006902, 2.211287, 1, 0, 0.9137255, 1,
1.004447, -1.760726, 3.018126, 1, 0, 0.9058824, 1,
1.019928, 0.1291459, 1.721502, 1, 0, 0.9019608, 1,
1.022943, 0.5442079, 0.07908072, 1, 0, 0.8941177, 1,
1.042848, -0.2542127, 1.99419, 1, 0, 0.8862745, 1,
1.051244, -0.08524856, 1.209673, 1, 0, 0.8823529, 1,
1.051467, -1.136253, 2.806908, 1, 0, 0.8745098, 1,
1.07042, 0.5430281, 2.045579, 1, 0, 0.8705882, 1,
1.075264, 0.02893532, 0.224028, 1, 0, 0.8627451, 1,
1.079499, -1.364292, 1.492594, 1, 0, 0.8588235, 1,
1.082018, 0.3720161, 1.140717, 1, 0, 0.8509804, 1,
1.082546, -0.1818982, 0.54588, 1, 0, 0.8470588, 1,
1.086087, -1.229424, 2.486498, 1, 0, 0.8392157, 1,
1.088621, -0.8583387, 0.5286416, 1, 0, 0.8352941, 1,
1.098427, 0.1754572, 2.120846, 1, 0, 0.827451, 1,
1.111707, -1.573334, 0.8619208, 1, 0, 0.8235294, 1,
1.117764, -1.180346, 1.665245, 1, 0, 0.8156863, 1,
1.13271, -1.255157, 1.484488, 1, 0, 0.8117647, 1,
1.133773, 0.737076, 0.7090988, 1, 0, 0.8039216, 1,
1.135191, 0.7763448, 3.228421, 1, 0, 0.7960784, 1,
1.13641, 1.40245, -1.195989, 1, 0, 0.7921569, 1,
1.138593, -0.6218184, 2.101351, 1, 0, 0.7843137, 1,
1.143316, -0.03915963, 2.558894, 1, 0, 0.7803922, 1,
1.149614, 1.542993, 0.02646619, 1, 0, 0.772549, 1,
1.152198, 0.09484802, -0.06066551, 1, 0, 0.7686275, 1,
1.153586, -0.8143581, 3.39783, 1, 0, 0.7607843, 1,
1.158659, 0.5544821, 0.7029555, 1, 0, 0.7568628, 1,
1.16215, 1.814641, 0.5867996, 1, 0, 0.7490196, 1,
1.172565, -0.02396417, 1.958679, 1, 0, 0.7450981, 1,
1.175014, -0.08807827, 1.221562, 1, 0, 0.7372549, 1,
1.185862, -1.108095, 3.071924, 1, 0, 0.7333333, 1,
1.199482, 0.3879681, -0.4493937, 1, 0, 0.7254902, 1,
1.204344, -0.5347706, 4.93429, 1, 0, 0.7215686, 1,
1.207436, 0.6355503, 2.013674, 1, 0, 0.7137255, 1,
1.210776, -0.8143849, 1.63659, 1, 0, 0.7098039, 1,
1.215371, -0.0670496, 1.416777, 1, 0, 0.7019608, 1,
1.217247, -0.9143664, 1.700479, 1, 0, 0.6941177, 1,
1.219318, -1.957079, 4.154053, 1, 0, 0.6901961, 1,
1.223182, 1.017954, 0.1974839, 1, 0, 0.682353, 1,
1.228811, -1.084264, 2.477381, 1, 0, 0.6784314, 1,
1.23497, 2.418248, -0.2832823, 1, 0, 0.6705883, 1,
1.239133, -0.3305952, 0.7827243, 1, 0, 0.6666667, 1,
1.240203, -0.2906686, 1.97733, 1, 0, 0.6588235, 1,
1.244387, -0.862416, 2.716784, 1, 0, 0.654902, 1,
1.248308, -0.1134178, 2.92827, 1, 0, 0.6470588, 1,
1.250046, 0.5583484, 1.301701, 1, 0, 0.6431373, 1,
1.254592, -0.1365825, 1.231236, 1, 0, 0.6352941, 1,
1.258525, 0.1045855, 0.5240939, 1, 0, 0.6313726, 1,
1.259625, 0.4031539, 2.951112, 1, 0, 0.6235294, 1,
1.261137, -0.6762522, 0.433609, 1, 0, 0.6196079, 1,
1.268216, 0.8992529, 1.78585, 1, 0, 0.6117647, 1,
1.272852, -0.8875344, 1.24777, 1, 0, 0.6078432, 1,
1.278531, 0.03942191, 2.434306, 1, 0, 0.6, 1,
1.285459, 0.09214467, 1.460438, 1, 0, 0.5921569, 1,
1.299928, -1.510828, 2.143678, 1, 0, 0.5882353, 1,
1.301811, -0.1577069, 1.5623, 1, 0, 0.5803922, 1,
1.304474, 1.487568, 0.4668117, 1, 0, 0.5764706, 1,
1.310055, 0.5867023, 0.3323537, 1, 0, 0.5686275, 1,
1.33639, 0.4382763, 2.444114, 1, 0, 0.5647059, 1,
1.337382, -0.3197687, 3.631617, 1, 0, 0.5568628, 1,
1.343474, 1.186957, 1.461528, 1, 0, 0.5529412, 1,
1.34503, -1.092235, 2.682275, 1, 0, 0.5450981, 1,
1.354009, 1.032368, 1.20215, 1, 0, 0.5411765, 1,
1.368839, 1.16799, 1.810489, 1, 0, 0.5333334, 1,
1.373339, -1.177625, 2.676536, 1, 0, 0.5294118, 1,
1.387166, -0.1534359, 0.9662977, 1, 0, 0.5215687, 1,
1.388639, -1.105516, 2.119594, 1, 0, 0.5176471, 1,
1.389966, 1.238248, 0.6397597, 1, 0, 0.509804, 1,
1.390136, 0.7965218, 1.090751, 1, 0, 0.5058824, 1,
1.412896, -0.3107826, 0.6358919, 1, 0, 0.4980392, 1,
1.424956, -1.328218, 4.335111, 1, 0, 0.4901961, 1,
1.426422, -0.6107001, 2.3095, 1, 0, 0.4862745, 1,
1.42714, 1.007122, 0.8817589, 1, 0, 0.4784314, 1,
1.427481, 0.3988964, 1.829146, 1, 0, 0.4745098, 1,
1.433889, 0.8447158, 0.1939752, 1, 0, 0.4666667, 1,
1.435614, 0.09007035, 1.832078, 1, 0, 0.4627451, 1,
1.445269, -0.4623044, -0.09453191, 1, 0, 0.454902, 1,
1.445665, 0.961378, 0.5869819, 1, 0, 0.4509804, 1,
1.465408, 0.2560263, 1.889177, 1, 0, 0.4431373, 1,
1.467535, -0.4167232, 1.471065, 1, 0, 0.4392157, 1,
1.473428, 1.713565, 2.37524, 1, 0, 0.4313726, 1,
1.475795, 0.8890563, 2.794132, 1, 0, 0.427451, 1,
1.486269, -0.200042, -0.8781355, 1, 0, 0.4196078, 1,
1.495303, -0.9104324, 2.358085, 1, 0, 0.4156863, 1,
1.497374, 0.578637, 0.04181393, 1, 0, 0.4078431, 1,
1.501506, 0.09222437, 0.1002448, 1, 0, 0.4039216, 1,
1.501782, -0.7125015, 2.272137, 1, 0, 0.3960784, 1,
1.503312, 0.2761111, 0.5232643, 1, 0, 0.3882353, 1,
1.504314, 0.0114968, 2.394611, 1, 0, 0.3843137, 1,
1.505332, 0.02116908, -0.3592785, 1, 0, 0.3764706, 1,
1.519563, -0.4758733, 3.508281, 1, 0, 0.372549, 1,
1.523443, -1.009585, 3.206746, 1, 0, 0.3647059, 1,
1.540526, 0.8127167, -0.09254057, 1, 0, 0.3607843, 1,
1.544376, -0.867827, 2.441538, 1, 0, 0.3529412, 1,
1.551036, -1.631606, 3.208304, 1, 0, 0.3490196, 1,
1.551269, 1.715487, 2.587066, 1, 0, 0.3411765, 1,
1.553226, 1.162621, 1.423047, 1, 0, 0.3372549, 1,
1.56238, -2.091949, 1.340727, 1, 0, 0.3294118, 1,
1.565123, 1.635854, -0.47175, 1, 0, 0.3254902, 1,
1.588718, -0.04242374, 1.758004, 1, 0, 0.3176471, 1,
1.596068, -0.970172, 2.564457, 1, 0, 0.3137255, 1,
1.60554, 0.4267671, 0.8575228, 1, 0, 0.3058824, 1,
1.610255, -0.3886669, 2.073117, 1, 0, 0.2980392, 1,
1.61195, 0.112371, 1.558653, 1, 0, 0.2941177, 1,
1.615955, -0.815116, 2.523749, 1, 0, 0.2862745, 1,
1.620314, 0.1944223, 1.767657, 1, 0, 0.282353, 1,
1.643445, -0.1950076, 2.000107, 1, 0, 0.2745098, 1,
1.644016, -1.474108, 1.349609, 1, 0, 0.2705882, 1,
1.650238, -0.8357159, 2.940474, 1, 0, 0.2627451, 1,
1.683963, 1.159516, 2.404532, 1, 0, 0.2588235, 1,
1.6859, 1.141389, 1.360295, 1, 0, 0.2509804, 1,
1.691366, -0.3501676, 2.881899, 1, 0, 0.2470588, 1,
1.72395, 1.970914, 0.6426669, 1, 0, 0.2392157, 1,
1.772254, 0.1120612, 0.4638149, 1, 0, 0.2352941, 1,
1.773788, 0.6406099, 1.748606, 1, 0, 0.227451, 1,
1.780775, 0.1485095, 1.57052, 1, 0, 0.2235294, 1,
1.786357, 2.313621, -0.5610231, 1, 0, 0.2156863, 1,
1.792289, 1.369051, -0.9446078, 1, 0, 0.2117647, 1,
1.799993, 0.2779463, -0.1133263, 1, 0, 0.2039216, 1,
1.808955, -0.313967, 1.233457, 1, 0, 0.1960784, 1,
1.840552, 1.244413, 0.4489176, 1, 0, 0.1921569, 1,
1.9103, -1.4216, 2.864889, 1, 0, 0.1843137, 1,
1.924597, 1.205556, 0.4796202, 1, 0, 0.1803922, 1,
1.931008, -0.451642, 1.575919, 1, 0, 0.172549, 1,
1.948465, -1.181831, 4.304071, 1, 0, 0.1686275, 1,
1.960574, 0.3577825, 0.4652593, 1, 0, 0.1607843, 1,
1.983296, -0.9839371, 1.232134, 1, 0, 0.1568628, 1,
2.020941, -1.695413, 1.104613, 1, 0, 0.1490196, 1,
2.092867, 0.8236966, 1.218521, 1, 0, 0.145098, 1,
2.110977, -0.1441211, -0.4038242, 1, 0, 0.1372549, 1,
2.129043, -0.3757229, 0.4654397, 1, 0, 0.1333333, 1,
2.132525, -0.5520501, 3.744745, 1, 0, 0.1254902, 1,
2.179384, -0.5538965, 0.6715826, 1, 0, 0.1215686, 1,
2.190776, -0.2822018, 2.512182, 1, 0, 0.1137255, 1,
2.195791, 0.5258448, 1.888965, 1, 0, 0.1098039, 1,
2.225011, -1.003703, 2.423463, 1, 0, 0.1019608, 1,
2.238792, -0.07534329, 1.713597, 1, 0, 0.09411765, 1,
2.239701, 0.6616208, 2.056066, 1, 0, 0.09019608, 1,
2.272853, 1.199028, 0.9726878, 1, 0, 0.08235294, 1,
2.355905, 0.2971041, 0.2663027, 1, 0, 0.07843138, 1,
2.444208, 1.396494, 1.451015, 1, 0, 0.07058824, 1,
2.526977, -1.089813, 1.017223, 1, 0, 0.06666667, 1,
2.529355, 2.754732, 2.117245, 1, 0, 0.05882353, 1,
2.531327, -1.284557, 2.394025, 1, 0, 0.05490196, 1,
2.562415, -0.6174277, 1.763537, 1, 0, 0.04705882, 1,
2.655421, -0.03007038, 1.874943, 1, 0, 0.04313726, 1,
2.717784, 1.018482, 1.069627, 1, 0, 0.03529412, 1,
2.791352, -0.226415, 1.07518, 1, 0, 0.03137255, 1,
2.876936, 1.224335, 1.693927, 1, 0, 0.02352941, 1,
2.897074, -0.1151069, 1.98582, 1, 0, 0.01960784, 1,
3.09873, -0.3366283, 1.10539, 1, 0, 0.01176471, 1,
3.5354, 0.323293, 2.318003, 1, 0, 0.007843138, 1
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
0.27811, -4.168497, -7.529863, 0, -0.5, 0.5, 0.5,
0.27811, -4.168497, -7.529863, 1, -0.5, 0.5, 0.5,
0.27811, -4.168497, -7.529863, 1, 1.5, 0.5, 0.5,
0.27811, -4.168497, -7.529863, 0, 1.5, 0.5, 0.5
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
-4.083402, -0.1918805, -7.529863, 0, -0.5, 0.5, 0.5,
-4.083402, -0.1918805, -7.529863, 1, -0.5, 0.5, 0.5,
-4.083402, -0.1918805, -7.529863, 1, 1.5, 0.5, 0.5,
-4.083402, -0.1918805, -7.529863, 0, 1.5, 0.5, 0.5
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
-4.083402, -4.168497, 0.05662227, 0, -0.5, 0.5, 0.5,
-4.083402, -4.168497, 0.05662227, 1, -0.5, 0.5, 0.5,
-4.083402, -4.168497, 0.05662227, 1, 1.5, 0.5, 0.5,
-4.083402, -4.168497, 0.05662227, 0, 1.5, 0.5, 0.5
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
-2, -3.250816, -5.779136,
3, -3.250816, -5.779136,
-2, -3.250816, -5.779136,
-2, -3.403763, -6.070924,
-1, -3.250816, -5.779136,
-1, -3.403763, -6.070924,
0, -3.250816, -5.779136,
0, -3.403763, -6.070924,
1, -3.250816, -5.779136,
1, -3.403763, -6.070924,
2, -3.250816, -5.779136,
2, -3.403763, -6.070924,
3, -3.250816, -5.779136,
3, -3.403763, -6.070924
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
-2, -3.709657, -6.6545, 0, -0.5, 0.5, 0.5,
-2, -3.709657, -6.6545, 1, -0.5, 0.5, 0.5,
-2, -3.709657, -6.6545, 1, 1.5, 0.5, 0.5,
-2, -3.709657, -6.6545, 0, 1.5, 0.5, 0.5,
-1, -3.709657, -6.6545, 0, -0.5, 0.5, 0.5,
-1, -3.709657, -6.6545, 1, -0.5, 0.5, 0.5,
-1, -3.709657, -6.6545, 1, 1.5, 0.5, 0.5,
-1, -3.709657, -6.6545, 0, 1.5, 0.5, 0.5,
0, -3.709657, -6.6545, 0, -0.5, 0.5, 0.5,
0, -3.709657, -6.6545, 1, -0.5, 0.5, 0.5,
0, -3.709657, -6.6545, 1, 1.5, 0.5, 0.5,
0, -3.709657, -6.6545, 0, 1.5, 0.5, 0.5,
1, -3.709657, -6.6545, 0, -0.5, 0.5, 0.5,
1, -3.709657, -6.6545, 1, -0.5, 0.5, 0.5,
1, -3.709657, -6.6545, 1, 1.5, 0.5, 0.5,
1, -3.709657, -6.6545, 0, 1.5, 0.5, 0.5,
2, -3.709657, -6.6545, 0, -0.5, 0.5, 0.5,
2, -3.709657, -6.6545, 1, -0.5, 0.5, 0.5,
2, -3.709657, -6.6545, 1, 1.5, 0.5, 0.5,
2, -3.709657, -6.6545, 0, 1.5, 0.5, 0.5,
3, -3.709657, -6.6545, 0, -0.5, 0.5, 0.5,
3, -3.709657, -6.6545, 1, -0.5, 0.5, 0.5,
3, -3.709657, -6.6545, 1, 1.5, 0.5, 0.5,
3, -3.709657, -6.6545, 0, 1.5, 0.5, 0.5
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
-3.076899, -3, -5.779136,
-3.076899, 2, -5.779136,
-3.076899, -3, -5.779136,
-3.244649, -3, -6.070924,
-3.076899, -2, -5.779136,
-3.244649, -2, -6.070924,
-3.076899, -1, -5.779136,
-3.244649, -1, -6.070924,
-3.076899, 0, -5.779136,
-3.244649, 0, -6.070924,
-3.076899, 1, -5.779136,
-3.244649, 1, -6.070924,
-3.076899, 2, -5.779136,
-3.244649, 2, -6.070924
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
-3.58015, -3, -6.6545, 0, -0.5, 0.5, 0.5,
-3.58015, -3, -6.6545, 1, -0.5, 0.5, 0.5,
-3.58015, -3, -6.6545, 1, 1.5, 0.5, 0.5,
-3.58015, -3, -6.6545, 0, 1.5, 0.5, 0.5,
-3.58015, -2, -6.6545, 0, -0.5, 0.5, 0.5,
-3.58015, -2, -6.6545, 1, -0.5, 0.5, 0.5,
-3.58015, -2, -6.6545, 1, 1.5, 0.5, 0.5,
-3.58015, -2, -6.6545, 0, 1.5, 0.5, 0.5,
-3.58015, -1, -6.6545, 0, -0.5, 0.5, 0.5,
-3.58015, -1, -6.6545, 1, -0.5, 0.5, 0.5,
-3.58015, -1, -6.6545, 1, 1.5, 0.5, 0.5,
-3.58015, -1, -6.6545, 0, 1.5, 0.5, 0.5,
-3.58015, 0, -6.6545, 0, -0.5, 0.5, 0.5,
-3.58015, 0, -6.6545, 1, -0.5, 0.5, 0.5,
-3.58015, 0, -6.6545, 1, 1.5, 0.5, 0.5,
-3.58015, 0, -6.6545, 0, 1.5, 0.5, 0.5,
-3.58015, 1, -6.6545, 0, -0.5, 0.5, 0.5,
-3.58015, 1, -6.6545, 1, -0.5, 0.5, 0.5,
-3.58015, 1, -6.6545, 1, 1.5, 0.5, 0.5,
-3.58015, 1, -6.6545, 0, 1.5, 0.5, 0.5,
-3.58015, 2, -6.6545, 0, -0.5, 0.5, 0.5,
-3.58015, 2, -6.6545, 1, -0.5, 0.5, 0.5,
-3.58015, 2, -6.6545, 1, 1.5, 0.5, 0.5,
-3.58015, 2, -6.6545, 0, 1.5, 0.5, 0.5
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
-3.076899, -3.250816, -4,
-3.076899, -3.250816, 4,
-3.076899, -3.250816, -4,
-3.244649, -3.403763, -4,
-3.076899, -3.250816, -2,
-3.244649, -3.403763, -2,
-3.076899, -3.250816, 0,
-3.244649, -3.403763, 0,
-3.076899, -3.250816, 2,
-3.244649, -3.403763, 2,
-3.076899, -3.250816, 4,
-3.244649, -3.403763, 4
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
-3.58015, -3.709657, -4, 0, -0.5, 0.5, 0.5,
-3.58015, -3.709657, -4, 1, -0.5, 0.5, 0.5,
-3.58015, -3.709657, -4, 1, 1.5, 0.5, 0.5,
-3.58015, -3.709657, -4, 0, 1.5, 0.5, 0.5,
-3.58015, -3.709657, -2, 0, -0.5, 0.5, 0.5,
-3.58015, -3.709657, -2, 1, -0.5, 0.5, 0.5,
-3.58015, -3.709657, -2, 1, 1.5, 0.5, 0.5,
-3.58015, -3.709657, -2, 0, 1.5, 0.5, 0.5,
-3.58015, -3.709657, 0, 0, -0.5, 0.5, 0.5,
-3.58015, -3.709657, 0, 1, -0.5, 0.5, 0.5,
-3.58015, -3.709657, 0, 1, 1.5, 0.5, 0.5,
-3.58015, -3.709657, 0, 0, 1.5, 0.5, 0.5,
-3.58015, -3.709657, 2, 0, -0.5, 0.5, 0.5,
-3.58015, -3.709657, 2, 1, -0.5, 0.5, 0.5,
-3.58015, -3.709657, 2, 1, 1.5, 0.5, 0.5,
-3.58015, -3.709657, 2, 0, 1.5, 0.5, 0.5,
-3.58015, -3.709657, 4, 0, -0.5, 0.5, 0.5,
-3.58015, -3.709657, 4, 1, -0.5, 0.5, 0.5,
-3.58015, -3.709657, 4, 1, 1.5, 0.5, 0.5,
-3.58015, -3.709657, 4, 0, 1.5, 0.5, 0.5
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
-3.076899, -3.250816, -5.779136,
-3.076899, 2.867055, -5.779136,
-3.076899, -3.250816, 5.89238,
-3.076899, 2.867055, 5.89238,
-3.076899, -3.250816, -5.779136,
-3.076899, -3.250816, 5.89238,
-3.076899, 2.867055, -5.779136,
-3.076899, 2.867055, 5.89238,
-3.076899, -3.250816, -5.779136,
3.633119, -3.250816, -5.779136,
-3.076899, -3.250816, 5.89238,
3.633119, -3.250816, 5.89238,
-3.076899, 2.867055, -5.779136,
3.633119, 2.867055, -5.779136,
-3.076899, 2.867055, 5.89238,
3.633119, 2.867055, 5.89238,
3.633119, -3.250816, -5.779136,
3.633119, 2.867055, -5.779136,
3.633119, -3.250816, 5.89238,
3.633119, 2.867055, 5.89238,
3.633119, -3.250816, -5.779136,
3.633119, -3.250816, 5.89238,
3.633119, 2.867055, -5.779136,
3.633119, 2.867055, 5.89238
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
var radius = 7.896361;
var distance = 35.13181;
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
mvMatrix.translate( -0.27811, 0.1918805, -0.05662227 );
mvMatrix.scale( 1.272381, 1.395534, 0.7314988 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.13181);
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
abate<-read.table("abate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-abate$V2
```

```
## Error in eval(expr, envir, enclos): object 'abate' not found
```

```r
y<-abate$V3
```

```
## Error in eval(expr, envir, enclos): object 'abate' not found
```

```r
z<-abate$V4
```

```
## Error in eval(expr, envir, enclos): object 'abate' not found
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
-2.97918, -0.8839909, -0.1697329, 0, 0, 1, 1, 1,
-2.907865, -1.608554, -1.696422, 1, 0, 0, 1, 1,
-2.739614, 1.681116, -2.833506, 1, 0, 0, 1, 1,
-2.572893, -0.2581883, -2.45032, 1, 0, 0, 1, 1,
-2.456516, 0.1544345, -0.8383651, 1, 0, 0, 1, 1,
-2.427187, 2.143352, -0.2874867, 1, 0, 0, 1, 1,
-2.41301, -0.7944037, -5.074365, 0, 0, 0, 1, 1,
-2.280186, 0.4280894, -0.9812841, 0, 0, 0, 1, 1,
-2.22065, -0.3093054, -1.773312, 0, 0, 0, 1, 1,
-2.211921, -0.3000023, -1.264489, 0, 0, 0, 1, 1,
-2.183476, 0.1338644, -1.489163, 0, 0, 0, 1, 1,
-2.153481, -0.228156, -2.467097, 0, 0, 0, 1, 1,
-2.149167, -1.933211, -2.47303, 0, 0, 0, 1, 1,
-2.125285, -0.6587968, -2.390391, 1, 1, 1, 1, 1,
-2.117113, 1.263414, -3.305109, 1, 1, 1, 1, 1,
-2.109724, -0.1739889, 0.1241355, 1, 1, 1, 1, 1,
-2.100253, 0.5657378, -1.803562, 1, 1, 1, 1, 1,
-2.098944, -0.3391396, -0.8582377, 1, 1, 1, 1, 1,
-2.097039, -0.5113911, -1.507463, 1, 1, 1, 1, 1,
-2.05933, 0.1540473, -0.3933852, 1, 1, 1, 1, 1,
-2.026662, 0.8707482, -0.7504634, 1, 1, 1, 1, 1,
-2.009023, -2.443615, -3.79332, 1, 1, 1, 1, 1,
-2.005959, -1.077465, -3.197484, 1, 1, 1, 1, 1,
-1.974269, 1.592824, 0.612596, 1, 1, 1, 1, 1,
-1.955256, -0.8746426, -0.7712952, 1, 1, 1, 1, 1,
-1.914714, 0.369295, -1.696229, 1, 1, 1, 1, 1,
-1.893755, 0.1222538, -2.405273, 1, 1, 1, 1, 1,
-1.890209, -0.09611916, -0.6718165, 1, 1, 1, 1, 1,
-1.882676, -0.5708104, -1.017024, 0, 0, 1, 1, 1,
-1.878157, -1.987671, -2.335859, 1, 0, 0, 1, 1,
-1.84759, 0.82739, -1.579144, 1, 0, 0, 1, 1,
-1.838731, 0.5794204, -3.469151, 1, 0, 0, 1, 1,
-1.824521, 0.9094921, -0.6560826, 1, 0, 0, 1, 1,
-1.818837, -2.945251, -2.832444, 1, 0, 0, 1, 1,
-1.816024, -1.115916, -2.507607, 0, 0, 0, 1, 1,
-1.811213, -0.1850876, -0.8202173, 0, 0, 0, 1, 1,
-1.806048, -1.180409, -2.211289, 0, 0, 0, 1, 1,
-1.802851, -0.6740171, -3.01131, 0, 0, 0, 1, 1,
-1.799327, -0.2059963, -1.604418, 0, 0, 0, 1, 1,
-1.794382, -0.7465855, -0.9623654, 0, 0, 0, 1, 1,
-1.790604, 0.9411886, 0.7569106, 0, 0, 0, 1, 1,
-1.790514, -0.139411, -1.170749, 1, 1, 1, 1, 1,
-1.790221, -0.1153325, -1.202631, 1, 1, 1, 1, 1,
-1.759789, 0.5453342, -0.8717847, 1, 1, 1, 1, 1,
-1.739789, 1.753564, 0.3854565, 1, 1, 1, 1, 1,
-1.738292, 0.571096, -2.974545, 1, 1, 1, 1, 1,
-1.731496, 0.4893468, -1.223243, 1, 1, 1, 1, 1,
-1.725592, 0.5517876, -0.9455261, 1, 1, 1, 1, 1,
-1.720271, -0.2436375, -1.014275, 1, 1, 1, 1, 1,
-1.702163, -0.5099631, -3.383061, 1, 1, 1, 1, 1,
-1.69815, 1.204751, -0.4083126, 1, 1, 1, 1, 1,
-1.695648, -1.022605, -1.371578, 1, 1, 1, 1, 1,
-1.680485, -1.152126, -2.869082, 1, 1, 1, 1, 1,
-1.676586, -0.5262163, -0.9304879, 1, 1, 1, 1, 1,
-1.675714, -0.3264746, -2.109694, 1, 1, 1, 1, 1,
-1.662168, -0.3630707, -0.9970212, 1, 1, 1, 1, 1,
-1.655428, -0.4633958, -2.410797, 0, 0, 1, 1, 1,
-1.650325, -0.7291152, -2.673975, 1, 0, 0, 1, 1,
-1.63143, -0.08158897, -1.827306, 1, 0, 0, 1, 1,
-1.625479, -0.4852622, -2.550179, 1, 0, 0, 1, 1,
-1.617837, -0.01794625, -2.051163, 1, 0, 0, 1, 1,
-1.609134, -1.194903, -2.228195, 1, 0, 0, 1, 1,
-1.60743, -0.7087489, -2.367536, 0, 0, 0, 1, 1,
-1.585953, 0.1722206, -1.144641, 0, 0, 0, 1, 1,
-1.580952, -0.2734169, -2.107419, 0, 0, 0, 1, 1,
-1.564605, -0.900517, 0.4302525, 0, 0, 0, 1, 1,
-1.543129, 1.067387, -2.436111, 0, 0, 0, 1, 1,
-1.538314, -1.712701, 0.324735, 0, 0, 0, 1, 1,
-1.538038, -0.3945139, -0.2087209, 0, 0, 0, 1, 1,
-1.53689, -0.03505653, -1.772742, 1, 1, 1, 1, 1,
-1.534131, 0.8983406, -1.16107, 1, 1, 1, 1, 1,
-1.531041, 0.6610418, -2.477798, 1, 1, 1, 1, 1,
-1.530116, 0.9899738, -1.147092, 1, 1, 1, 1, 1,
-1.520742, -0.4100759, -2.535761, 1, 1, 1, 1, 1,
-1.507552, 1.1226, -2.717377, 1, 1, 1, 1, 1,
-1.478897, 0.5487829, -0.3889134, 1, 1, 1, 1, 1,
-1.467133, -0.8229138, -0.2178985, 1, 1, 1, 1, 1,
-1.460241, -1.630005, -1.955229, 1, 1, 1, 1, 1,
-1.450998, -0.6966147, -2.418156, 1, 1, 1, 1, 1,
-1.445926, 1.397775, -0.9654032, 1, 1, 1, 1, 1,
-1.443506, -0.0820452, -2.846905, 1, 1, 1, 1, 1,
-1.43228, 1.109424, -1.579584, 1, 1, 1, 1, 1,
-1.428365, 1.070583, -0.4368437, 1, 1, 1, 1, 1,
-1.421228, -0.03609314, 0.2965374, 1, 1, 1, 1, 1,
-1.415635, 0.899167, -1.606544, 0, 0, 1, 1, 1,
-1.415576, -0.2130304, -1.178792, 1, 0, 0, 1, 1,
-1.413127, -1.60658, -1.511002, 1, 0, 0, 1, 1,
-1.391643, 0.2919123, -1.831933, 1, 0, 0, 1, 1,
-1.391015, 2.77796, 0.3485294, 1, 0, 0, 1, 1,
-1.385919, 1.278773, -1.234466, 1, 0, 0, 1, 1,
-1.376522, -0.04719239, -0.8150223, 0, 0, 0, 1, 1,
-1.376024, -0.4783175, -1.054658, 0, 0, 0, 1, 1,
-1.365025, 2.382597, -0.3963799, 0, 0, 0, 1, 1,
-1.354623, 0.2883494, -2.109331, 0, 0, 0, 1, 1,
-1.342311, -0.3340372, 0.2452885, 0, 0, 0, 1, 1,
-1.339712, -2.023082, -2.167702, 0, 0, 0, 1, 1,
-1.334985, 0.4722266, 0.4750171, 0, 0, 0, 1, 1,
-1.332647, 1.872078, -0.1761382, 1, 1, 1, 1, 1,
-1.326125, -2.817466, -1.444657, 1, 1, 1, 1, 1,
-1.315929, 0.101695, -1.40628, 1, 1, 1, 1, 1,
-1.313724, -0.5234412, -1.145949, 1, 1, 1, 1, 1,
-1.3115, 0.1315041, -2.101326, 1, 1, 1, 1, 1,
-1.29878, 0.8515735, -0.1716929, 1, 1, 1, 1, 1,
-1.293232, -1.866406, -3.380804, 1, 1, 1, 1, 1,
-1.292002, -0.07359581, -1.795473, 1, 1, 1, 1, 1,
-1.287839, 0.1181575, -2.412634, 1, 1, 1, 1, 1,
-1.285404, -0.2241622, -1.869722, 1, 1, 1, 1, 1,
-1.283876, -0.1277326, -0.3644264, 1, 1, 1, 1, 1,
-1.274582, 1.119575, -0.4438191, 1, 1, 1, 1, 1,
-1.266049, 1.203088, 0.6228322, 1, 1, 1, 1, 1,
-1.265002, -0.2179804, -1.295232, 1, 1, 1, 1, 1,
-1.263714, -1.084312, -3.01389, 1, 1, 1, 1, 1,
-1.261161, 0.08720519, -2.207333, 0, 0, 1, 1, 1,
-1.257536, 0.2841037, 0.02561507, 1, 0, 0, 1, 1,
-1.25367, -0.1912106, -0.6713322, 1, 0, 0, 1, 1,
-1.242579, 0.5534145, -2.763287, 1, 0, 0, 1, 1,
-1.234531, 0.3438603, -0.3094373, 1, 0, 0, 1, 1,
-1.234395, 0.3325818, -0.4906787, 1, 0, 0, 1, 1,
-1.233221, 1.398417, -1.181812, 0, 0, 0, 1, 1,
-1.231346, -1.548364, -0.4550249, 0, 0, 0, 1, 1,
-1.230488, -0.002034938, -2.741612, 0, 0, 0, 1, 1,
-1.2223, -0.1830501, -1.072738, 0, 0, 0, 1, 1,
-1.217895, -1.746326, -1.972314, 0, 0, 0, 1, 1,
-1.213197, -1.03286, -1.098361, 0, 0, 0, 1, 1,
-1.208009, 1.402903, -0.5106531, 0, 0, 0, 1, 1,
-1.20671, 0.373342, -0.8288356, 1, 1, 1, 1, 1,
-1.204155, -0.1818437, -0.54569, 1, 1, 1, 1, 1,
-1.189759, -1.274939, -1.869321, 1, 1, 1, 1, 1,
-1.188851, -0.3917957, -2.226276, 1, 1, 1, 1, 1,
-1.181315, -1.895852, -4.386844, 1, 1, 1, 1, 1,
-1.179326, -1.369996, -3.808058, 1, 1, 1, 1, 1,
-1.175768, 0.04469391, -1.694319, 1, 1, 1, 1, 1,
-1.174198, 0.3483191, -2.063444, 1, 1, 1, 1, 1,
-1.173865, 0.3659986, -1.066691, 1, 1, 1, 1, 1,
-1.170745, 1.167014, -0.4618232, 1, 1, 1, 1, 1,
-1.153136, 0.5473651, 0.009447398, 1, 1, 1, 1, 1,
-1.149683, -1.270931, -3.327024, 1, 1, 1, 1, 1,
-1.149651, -1.410516, -2.570891, 1, 1, 1, 1, 1,
-1.147864, -0.6056308, -2.188567, 1, 1, 1, 1, 1,
-1.143242, 1.093047, -1.431259, 1, 1, 1, 1, 1,
-1.142639, 0.6239557, -2.157969, 0, 0, 1, 1, 1,
-1.132689, -0.1480985, -2.533768, 1, 0, 0, 1, 1,
-1.126152, -0.3702753, -0.6387695, 1, 0, 0, 1, 1,
-1.121094, 0.4413056, -0.8618736, 1, 0, 0, 1, 1,
-1.111084, -1.138424, -4.614903, 1, 0, 0, 1, 1,
-1.109718, 0.101922, -2.58934, 1, 0, 0, 1, 1,
-1.094122, -0.6343018, -1.021791, 0, 0, 0, 1, 1,
-1.093716, -0.4601743, -1.484387, 0, 0, 0, 1, 1,
-1.089874, 0.9367094, -1.492455, 0, 0, 0, 1, 1,
-1.088246, -0.5515782, -1.185716, 0, 0, 0, 1, 1,
-1.085765, 0.2423219, -0.5254236, 0, 0, 0, 1, 1,
-1.082303, 1.179794, -0.7234297, 0, 0, 0, 1, 1,
-1.078269, 1.448545, -1.131413, 0, 0, 0, 1, 1,
-1.075286, 1.143669, -0.6250395, 1, 1, 1, 1, 1,
-1.073482, 0.4193757, -1.127322, 1, 1, 1, 1, 1,
-1.069482, -0.3460963, -2.631331, 1, 1, 1, 1, 1,
-1.058129, 0.7785886, -1.749406, 1, 1, 1, 1, 1,
-1.055908, 0.6561146, -1.75137, 1, 1, 1, 1, 1,
-1.052054, -0.1504821, -2.947058, 1, 1, 1, 1, 1,
-1.048229, 0.9108604, 0.5391708, 1, 1, 1, 1, 1,
-1.042447, 1.115449, -1.279526, 1, 1, 1, 1, 1,
-1.041731, 0.4444748, -0.6207514, 1, 1, 1, 1, 1,
-1.04064, -3.161721, -3.155237, 1, 1, 1, 1, 1,
-1.033881, -0.4620551, -2.526037, 1, 1, 1, 1, 1,
-1.026635, -0.002457861, -1.052466, 1, 1, 1, 1, 1,
-1.025488, 0.8184382, -1.161183, 1, 1, 1, 1, 1,
-1.02164, 0.8625273, 0.4287583, 1, 1, 1, 1, 1,
-1.020682, 0.9456504, 0.01496185, 1, 1, 1, 1, 1,
-1.017185, -1.103102, -1.895676, 0, 0, 1, 1, 1,
-1.014602, 1.028788, 0.2256558, 1, 0, 0, 1, 1,
-1.013691, 0.966458, -1.123429, 1, 0, 0, 1, 1,
-1.013131, 0.2246177, -0.646818, 1, 0, 0, 1, 1,
-1.011951, -0.6367605, -1.002613, 1, 0, 0, 1, 1,
-1.003519, -0.8939487, -2.401669, 1, 0, 0, 1, 1,
-0.9967304, 1.819715, -0.7666757, 0, 0, 0, 1, 1,
-0.9816244, -1.771553, -2.998456, 0, 0, 0, 1, 1,
-0.9744306, -0.01349771, -0.9144476, 0, 0, 0, 1, 1,
-0.9734306, -0.5041357, -3.380729, 0, 0, 0, 1, 1,
-0.9676438, 0.6542245, -2.008366, 0, 0, 0, 1, 1,
-0.9600677, 0.391655, -1.988393, 0, 0, 0, 1, 1,
-0.9596829, 2.528361, -1.103525, 0, 0, 0, 1, 1,
-0.958037, 0.09410788, -1.598311, 1, 1, 1, 1, 1,
-0.9525102, -0.2483355, -1.000875, 1, 1, 1, 1, 1,
-0.9499516, -2.101529, -3.302893, 1, 1, 1, 1, 1,
-0.9492472, -0.2355779, -2.084894, 1, 1, 1, 1, 1,
-0.9488948, -1.04236, -2.149926, 1, 1, 1, 1, 1,
-0.9468092, 0.5352643, -2.134343, 1, 1, 1, 1, 1,
-0.938422, 0.02449236, -0.118486, 1, 1, 1, 1, 1,
-0.9360565, 1.240801, 1.23345, 1, 1, 1, 1, 1,
-0.935734, -0.1992054, -0.3599203, 1, 1, 1, 1, 1,
-0.9314687, 0.3899803, -1.807731, 1, 1, 1, 1, 1,
-0.9290718, 1.318807, 1.260067, 1, 1, 1, 1, 1,
-0.9241954, -0.1818137, 0.4161596, 1, 1, 1, 1, 1,
-0.9208243, -0.2026961, -2.547946, 1, 1, 1, 1, 1,
-0.9174216, -0.33652, -2.381453, 1, 1, 1, 1, 1,
-0.9099554, -0.4670027, -1.529539, 1, 1, 1, 1, 1,
-0.9058234, -0.9670706, -3.221987, 0, 0, 1, 1, 1,
-0.8998204, -0.2551775, 0.7024707, 1, 0, 0, 1, 1,
-0.8937909, -0.3662393, -1.97996, 1, 0, 0, 1, 1,
-0.8906218, 0.9050445, -0.7145166, 1, 0, 0, 1, 1,
-0.889352, -0.4050873, -2.361638, 1, 0, 0, 1, 1,
-0.8873274, 0.4189151, -1.213803, 1, 0, 0, 1, 1,
-0.8791113, 0.3309072, -0.06311977, 0, 0, 0, 1, 1,
-0.8776209, -2.773274, -2.465916, 0, 0, 0, 1, 1,
-0.8755978, 1.534661, 0.8486365, 0, 0, 0, 1, 1,
-0.8747808, -0.0978021, -1.61659, 0, 0, 0, 1, 1,
-0.8700249, -0.02656018, -2.311561, 0, 0, 0, 1, 1,
-0.8693106, 0.03299005, -2.587124, 0, 0, 0, 1, 1,
-0.858143, 0.3843479, -0.03416676, 0, 0, 0, 1, 1,
-0.8568698, -0.1667935, -1.469496, 1, 1, 1, 1, 1,
-0.8566055, 1.294772, 0.1138255, 1, 1, 1, 1, 1,
-0.8547068, -0.004255361, -4.187393, 1, 1, 1, 1, 1,
-0.8518794, -1.704267, -0.9619018, 1, 1, 1, 1, 1,
-0.8517317, -0.7024989, -3.096989, 1, 1, 1, 1, 1,
-0.8501382, -0.3782891, -2.034346, 1, 1, 1, 1, 1,
-0.8496144, 1.518657, -0.1237972, 1, 1, 1, 1, 1,
-0.8477473, 0.6835732, 2.014721, 1, 1, 1, 1, 1,
-0.8461738, -0.2784921, -1.353857, 1, 1, 1, 1, 1,
-0.837328, -1.553343, -2.688442, 1, 1, 1, 1, 1,
-0.8332947, 1.635071, -0.2783308, 1, 1, 1, 1, 1,
-0.8327259, 1.261139, 0.8001381, 1, 1, 1, 1, 1,
-0.8305511, -1.286374, -2.866254, 1, 1, 1, 1, 1,
-0.8296615, 1.129659, 0.9401338, 1, 1, 1, 1, 1,
-0.8295186, 0.02340185, -1.100025, 1, 1, 1, 1, 1,
-0.8195664, -0.02490403, -3.830846, 0, 0, 1, 1, 1,
-0.8160227, 1.009331, 0.5753264, 1, 0, 0, 1, 1,
-0.8137029, 0.3257836, -1.051995, 1, 0, 0, 1, 1,
-0.8128016, 2.318258, 0.1780812, 1, 0, 0, 1, 1,
-0.8099611, -1.629352, -3.233068, 1, 0, 0, 1, 1,
-0.8096331, -0.8433504, -2.600216, 1, 0, 0, 1, 1,
-0.8095337, -0.4222282, -2.771328, 0, 0, 0, 1, 1,
-0.8060737, 0.7355976, -0.3603588, 0, 0, 0, 1, 1,
-0.8037105, 0.5115885, 0.3893942, 0, 0, 0, 1, 1,
-0.8022226, -0.06460029, -1.487138, 0, 0, 0, 1, 1,
-0.7970006, -2.06531, -3.407738, 0, 0, 0, 1, 1,
-0.7922806, -1.043921, -2.862761, 0, 0, 0, 1, 1,
-0.7887293, 1.296623, 0.3362511, 0, 0, 0, 1, 1,
-0.7793875, -1.18241, -2.713324, 1, 1, 1, 1, 1,
-0.7773407, 0.2668693, -0.04552007, 1, 1, 1, 1, 1,
-0.7755479, 1.930213, 1.472807, 1, 1, 1, 1, 1,
-0.7742214, -0.8928226, -1.725409, 1, 1, 1, 1, 1,
-0.770152, -0.4137117, -2.812494, 1, 1, 1, 1, 1,
-0.7623326, -0.2029846, 0.3384582, 1, 1, 1, 1, 1,
-0.7618092, -0.4240385, -2.440707, 1, 1, 1, 1, 1,
-0.7610972, -0.4039273, -2.543669, 1, 1, 1, 1, 1,
-0.7586635, -0.5001621, -2.521161, 1, 1, 1, 1, 1,
-0.7569999, 0.2834832, -1.830293, 1, 1, 1, 1, 1,
-0.7521076, -0.4508433, -0.2302428, 1, 1, 1, 1, 1,
-0.7486302, -1.09983, -1.934428, 1, 1, 1, 1, 1,
-0.7315441, 1.118615, 0.6469153, 1, 1, 1, 1, 1,
-0.7278807, 1.822639, -2.505927, 1, 1, 1, 1, 1,
-0.7249294, 0.9312269, -0.278637, 1, 1, 1, 1, 1,
-0.7195185, -0.2946315, -1.650433, 0, 0, 1, 1, 1,
-0.7180773, 0.1691115, -2.654729, 1, 0, 0, 1, 1,
-0.7115225, 1.102842, 0.4878522, 1, 0, 0, 1, 1,
-0.7106152, -0.5470657, -2.202355, 1, 0, 0, 1, 1,
-0.7084312, -0.07786331, -0.4051066, 1, 0, 0, 1, 1,
-0.7041713, 0.5764847, 0.1365946, 1, 0, 0, 1, 1,
-0.7018774, -0.4345003, -2.57479, 0, 0, 0, 1, 1,
-0.700186, 0.7522269, -1.498937, 0, 0, 0, 1, 1,
-0.6953985, 0.2694306, -1.630847, 0, 0, 0, 1, 1,
-0.6936314, -0.6274335, -2.670418, 0, 0, 0, 1, 1,
-0.6933901, 1.014035, -1.979189, 0, 0, 0, 1, 1,
-0.6922221, 0.5524593, -2.456871, 0, 0, 0, 1, 1,
-0.6916866, 0.3683756, -1.08338, 0, 0, 0, 1, 1,
-0.6916384, -0.5334614, -2.166759, 1, 1, 1, 1, 1,
-0.6855184, 0.8079991, -0.1012357, 1, 1, 1, 1, 1,
-0.6840374, 1.223037, -1.711803, 1, 1, 1, 1, 1,
-0.6837984, 0.773349, -0.3625444, 1, 1, 1, 1, 1,
-0.6832834, 0.1974512, -3.257513, 1, 1, 1, 1, 1,
-0.6776152, 2.388066, 0.06140985, 1, 1, 1, 1, 1,
-0.6750173, -0.08192664, -0.4680962, 1, 1, 1, 1, 1,
-0.6696824, 1.136236, -0.8456451, 1, 1, 1, 1, 1,
-0.6670422, 1.00312, 0.2233754, 1, 1, 1, 1, 1,
-0.6646074, 0.1794223, -2.580124, 1, 1, 1, 1, 1,
-0.6627651, -0.1723071, -1.124609, 1, 1, 1, 1, 1,
-0.6609418, 0.1490117, -0.756258, 1, 1, 1, 1, 1,
-0.6602928, -0.7244639, -2.400208, 1, 1, 1, 1, 1,
-0.6571268, -0.9432094, -3.015856, 1, 1, 1, 1, 1,
-0.6542355, 1.697512, -0.9780044, 1, 1, 1, 1, 1,
-0.6531623, -0.5143558, -1.594702, 0, 0, 1, 1, 1,
-0.6515062, 0.7626425, -0.3810475, 1, 0, 0, 1, 1,
-0.6505466, 0.1040886, -1.944296, 1, 0, 0, 1, 1,
-0.6505142, 2.645751, -0.04239891, 1, 0, 0, 1, 1,
-0.6490712, 0.6833305, -0.210328, 1, 0, 0, 1, 1,
-0.6422437, -0.08445167, -1.703305, 1, 0, 0, 1, 1,
-0.6385658, -0.6961083, -3.122895, 0, 0, 0, 1, 1,
-0.6315973, -0.01785376, -3.72038, 0, 0, 0, 1, 1,
-0.619315, -1.056039, -5.24916, 0, 0, 0, 1, 1,
-0.6186062, 0.5436564, -2.56682, 0, 0, 0, 1, 1,
-0.6162195, 1.890956, -0.3430515, 0, 0, 0, 1, 1,
-0.6100489, -0.560411, -3.052319, 0, 0, 0, 1, 1,
-0.6018277, 0.05741291, -1.727179, 0, 0, 0, 1, 1,
-0.598818, 0.3675565, -0.2106196, 1, 1, 1, 1, 1,
-0.5921271, 0.5308658, -0.4073239, 1, 1, 1, 1, 1,
-0.5895575, 0.8337497, 0.3739916, 1, 1, 1, 1, 1,
-0.5891094, 0.7877259, 0.8036955, 1, 1, 1, 1, 1,
-0.5768654, -1.047526, -3.213705, 1, 1, 1, 1, 1,
-0.575466, 0.2670582, -0.6247754, 1, 1, 1, 1, 1,
-0.5724491, 0.4503006, -0.4193503, 1, 1, 1, 1, 1,
-0.5708528, -0.2076771, -0.9634175, 1, 1, 1, 1, 1,
-0.5703465, -0.4583386, -2.244905, 1, 1, 1, 1, 1,
-0.5650393, 0.3367475, -0.4706608, 1, 1, 1, 1, 1,
-0.5630062, -0.3825547, -2.90498, 1, 1, 1, 1, 1,
-0.5625374, 0.5700762, -1.126181, 1, 1, 1, 1, 1,
-0.5612302, 0.5432747, -0.5965322, 1, 1, 1, 1, 1,
-0.5539283, -0.8392683, -1.278985, 1, 1, 1, 1, 1,
-0.549556, 2.5587, 0.6215076, 1, 1, 1, 1, 1,
-0.548494, -1.77154, -2.427593, 0, 0, 1, 1, 1,
-0.5479661, 1.204602, -2.502017, 1, 0, 0, 1, 1,
-0.5432805, 0.1623384, -1.919863, 1, 0, 0, 1, 1,
-0.5388443, 1.617377, 0.5192385, 1, 0, 0, 1, 1,
-0.5372743, -0.8945373, -2.320827, 1, 0, 0, 1, 1,
-0.5235915, -0.5673794, -3.22171, 1, 0, 0, 1, 1,
-0.5235316, 1.149119, -0.3533884, 0, 0, 0, 1, 1,
-0.5171339, 1.036596, 0.8774284, 0, 0, 0, 1, 1,
-0.5167865, -1.480619, -3.074143, 0, 0, 0, 1, 1,
-0.5139034, -0.5951436, -2.374846, 0, 0, 0, 1, 1,
-0.5085123, -0.9677106, -1.414438, 0, 0, 0, 1, 1,
-0.5041189, -0.2300589, -1.902469, 0, 0, 0, 1, 1,
-0.5020825, 0.1928936, -0.9706963, 0, 0, 0, 1, 1,
-0.4992293, 0.2828721, 1.136586, 1, 1, 1, 1, 1,
-0.4972679, -1.104707, -2.473176, 1, 1, 1, 1, 1,
-0.4954476, 0.396547, -0.9669994, 1, 1, 1, 1, 1,
-0.4909183, -0.7361912, -3.244909, 1, 1, 1, 1, 1,
-0.4908252, -1.494813, -1.732287, 1, 1, 1, 1, 1,
-0.4907608, 0.2855222, -0.4072743, 1, 1, 1, 1, 1,
-0.4899311, -0.5905386, -1.709858, 1, 1, 1, 1, 1,
-0.4877894, 1.363622, -1.064041, 1, 1, 1, 1, 1,
-0.4853912, 0.1103646, -1.864493, 1, 1, 1, 1, 1,
-0.4832374, 0.1042551, -0.7223428, 1, 1, 1, 1, 1,
-0.481933, -2.892841, -2.802682, 1, 1, 1, 1, 1,
-0.4796203, 0.2316108, -1.183024, 1, 1, 1, 1, 1,
-0.4784129, 0.04159645, -0.4599066, 1, 1, 1, 1, 1,
-0.475547, -1.051263, -2.628061, 1, 1, 1, 1, 1,
-0.4748321, 1.039182, -1.692843, 1, 1, 1, 1, 1,
-0.4729975, 0.03468707, -0.8891009, 0, 0, 1, 1, 1,
-0.4652326, 1.551261, 1.359758, 1, 0, 0, 1, 1,
-0.4584719, -0.01819806, -0.7922761, 1, 0, 0, 1, 1,
-0.456264, -0.2458584, -2.820651, 1, 0, 0, 1, 1,
-0.4523157, -1.413747, -2.931833, 1, 0, 0, 1, 1,
-0.4478413, -3.026236, -2.236696, 1, 0, 0, 1, 1,
-0.4470166, -0.5523075, -3.124175, 0, 0, 0, 1, 1,
-0.4438172, 0.2462843, -1.79878, 0, 0, 0, 1, 1,
-0.4370519, 0.7711605, 0.358688, 0, 0, 0, 1, 1,
-0.4319686, 1.733538, -0.3941245, 0, 0, 0, 1, 1,
-0.4306796, -0.4747067, -2.050041, 0, 0, 0, 1, 1,
-0.4177619, -0.08588015, -0.1073372, 0, 0, 0, 1, 1,
-0.4177111, -0.497386, -3.210464, 0, 0, 0, 1, 1,
-0.4172556, 0.5368124, -1.105435, 1, 1, 1, 1, 1,
-0.4156918, -0.1447672, -2.450377, 1, 1, 1, 1, 1,
-0.4127473, 0.3607461, -1.026901, 1, 1, 1, 1, 1,
-0.4054714, -0.5730053, -3.855393, 1, 1, 1, 1, 1,
-0.404869, -1.753813, -5.104374, 1, 1, 1, 1, 1,
-0.3987564, -0.61068, -2.277644, 1, 1, 1, 1, 1,
-0.3883385, 0.5911413, -0.6211535, 1, 1, 1, 1, 1,
-0.3875518, -1.939978, -4.502741, 1, 1, 1, 1, 1,
-0.3859938, -0.8893306, -1.512514, 1, 1, 1, 1, 1,
-0.3856063, 0.6461258, -0.2106047, 1, 1, 1, 1, 1,
-0.3855991, 0.9927344, -1.088864, 1, 1, 1, 1, 1,
-0.3850715, -1.683236, -5.609162, 1, 1, 1, 1, 1,
-0.3819447, -0.1329914, -4.52883, 1, 1, 1, 1, 1,
-0.3741608, 0.4546118, -1.138623, 1, 1, 1, 1, 1,
-0.3688367, -0.778019, -2.598912, 1, 1, 1, 1, 1,
-0.3687004, -0.09658825, -1.113804, 0, 0, 1, 1, 1,
-0.3646931, 0.9725184, -0.07915767, 1, 0, 0, 1, 1,
-0.3595852, -0.4042985, -2.232833, 1, 0, 0, 1, 1,
-0.3526707, -0.2440113, -0.8411623, 1, 0, 0, 1, 1,
-0.3502041, -1.551999, -4.66411, 1, 0, 0, 1, 1,
-0.3456205, -1.364466, -1.534066, 1, 0, 0, 1, 1,
-0.3450668, -0.003836495, -2.434517, 0, 0, 0, 1, 1,
-0.3357055, -2.698128, -1.797881, 0, 0, 0, 1, 1,
-0.3344145, -0.585265, -0.04988622, 0, 0, 0, 1, 1,
-0.333167, 1.695252, 1.386977, 0, 0, 0, 1, 1,
-0.3319212, 0.5034174, -1.073701, 0, 0, 0, 1, 1,
-0.3291631, -0.2746148, -1.904734, 0, 0, 0, 1, 1,
-0.3280398, 0.2209818, -0.8137696, 0, 0, 0, 1, 1,
-0.328036, -0.524633, -2.675716, 1, 1, 1, 1, 1,
-0.3261215, 1.29373, -3.103287, 1, 1, 1, 1, 1,
-0.3202884, 0.5040057, 0.2484826, 1, 1, 1, 1, 1,
-0.3179625, -0.6272541, -2.32165, 1, 1, 1, 1, 1,
-0.3177436, -0.2539653, -2.332041, 1, 1, 1, 1, 1,
-0.3171299, -0.9501165, -2.555344, 1, 1, 1, 1, 1,
-0.3149521, -0.8039138, -3.1206, 1, 1, 1, 1, 1,
-0.3139823, 0.04524302, -1.973699, 1, 1, 1, 1, 1,
-0.3132919, 0.1059501, -2.615912, 1, 1, 1, 1, 1,
-0.3107085, -0.5514484, -1.548378, 1, 1, 1, 1, 1,
-0.3083552, 0.1162176, -2.462249, 1, 1, 1, 1, 1,
-0.3066267, -0.2396543, -3.151371, 1, 1, 1, 1, 1,
-0.3011018, 1.765798, -0.2800933, 1, 1, 1, 1, 1,
-0.2935382, -0.3951406, -2.640835, 1, 1, 1, 1, 1,
-0.2930554, -0.2293883, -2.982572, 1, 1, 1, 1, 1,
-0.2860427, 1.566577, 0.2270256, 0, 0, 1, 1, 1,
-0.2817013, -0.8733836, -2.217871, 1, 0, 0, 1, 1,
-0.2785381, 1.308266, 0.1975636, 1, 0, 0, 1, 1,
-0.2775159, -1.56097, -2.253007, 1, 0, 0, 1, 1,
-0.2741987, -0.8086293, -1.296115, 1, 0, 0, 1, 1,
-0.2672143, -1.43202, -2.877234, 1, 0, 0, 1, 1,
-0.2665286, 0.2069287, -0.2682455, 0, 0, 0, 1, 1,
-0.2663011, -1.226087, -4.407226, 0, 0, 0, 1, 1,
-0.2610155, 0.4995497, -1.259907, 0, 0, 0, 1, 1,
-0.2577362, -0.2241001, -2.723889, 0, 0, 0, 1, 1,
-0.2573519, -1.152559, -3.685669, 0, 0, 0, 1, 1,
-0.2558588, -0.7215796, -2.599645, 0, 0, 0, 1, 1,
-0.2518119, 1.78217, -0.6437911, 0, 0, 0, 1, 1,
-0.2500727, 1.077754, -1.208319, 1, 1, 1, 1, 1,
-0.2489126, 0.3248577, -3.024326, 1, 1, 1, 1, 1,
-0.2485708, -0.004363766, 0.05301448, 1, 1, 1, 1, 1,
-0.2445923, 0.5801416, 0.3361386, 1, 1, 1, 1, 1,
-0.2444823, -0.08561002, -2.966264, 1, 1, 1, 1, 1,
-0.2434332, -1.474844, -2.145285, 1, 1, 1, 1, 1,
-0.2410684, 1.20665, -1.461772, 1, 1, 1, 1, 1,
-0.236828, -0.6922303, -3.974666, 1, 1, 1, 1, 1,
-0.236447, -0.6803792, -4.235591, 1, 1, 1, 1, 1,
-0.2339447, -0.270568, -4.028332, 1, 1, 1, 1, 1,
-0.2332652, 0.2526503, -1.167515, 1, 1, 1, 1, 1,
-0.2304866, -0.0448309, -1.97952, 1, 1, 1, 1, 1,
-0.2275056, 0.4560753, 1.202787, 1, 1, 1, 1, 1,
-0.2242721, 0.7343581, -0.4219573, 1, 1, 1, 1, 1,
-0.2173405, 1.985671, -0.08618356, 1, 1, 1, 1, 1,
-0.2164104, 1.804187, -0.2587447, 0, 0, 1, 1, 1,
-0.2148325, 0.8220893, -0.4979902, 1, 0, 0, 1, 1,
-0.212474, 0.2118396, -0.03015979, 1, 0, 0, 1, 1,
-0.2107249, 0.614583, -0.3629934, 1, 0, 0, 1, 1,
-0.2087954, 1.109988, 0.4927139, 1, 0, 0, 1, 1,
-0.2076858, 0.5583327, 0.6118183, 1, 0, 0, 1, 1,
-0.2023504, -0.8146874, -1.828038, 0, 0, 0, 1, 1,
-0.2021597, -1.184939, -3.327193, 0, 0, 0, 1, 1,
-0.2006693, -0.2467922, -1.84319, 0, 0, 0, 1, 1,
-0.1998678, 1.685756, 1.024121, 0, 0, 0, 1, 1,
-0.1997761, -0.1834965, -2.367069, 0, 0, 0, 1, 1,
-0.1981531, 0.3972514, 0.7900864, 0, 0, 0, 1, 1,
-0.1947076, 0.8570144, 0.5922341, 0, 0, 0, 1, 1,
-0.1923809, 0.1587459, -1.88127, 1, 1, 1, 1, 1,
-0.1920788, 0.9376181, 0.2936621, 1, 1, 1, 1, 1,
-0.1906022, 0.117961, -0.7114801, 1, 1, 1, 1, 1,
-0.1828713, -1.400356, -3.908909, 1, 1, 1, 1, 1,
-0.1781845, -0.04293758, -2.597627, 1, 1, 1, 1, 1,
-0.1747875, -0.3880709, -1.732177, 1, 1, 1, 1, 1,
-0.1746883, -0.7418803, -1.519941, 1, 1, 1, 1, 1,
-0.1720737, -1.097944, -3.002989, 1, 1, 1, 1, 1,
-0.1714981, 1.958785, -0.5304515, 1, 1, 1, 1, 1,
-0.1665991, -1.249903, -4.2026, 1, 1, 1, 1, 1,
-0.1644022, 0.1475374, -1.727246, 1, 1, 1, 1, 1,
-0.1610105, 0.00231649, -1.055905, 1, 1, 1, 1, 1,
-0.1593747, 0.4559293, -0.1159489, 1, 1, 1, 1, 1,
-0.1469726, -0.02099627, -1.913743, 1, 1, 1, 1, 1,
-0.1464396, -0.3165411, -3.506988, 1, 1, 1, 1, 1,
-0.1464349, -1.187157, -2.163062, 0, 0, 1, 1, 1,
-0.1462598, -0.5650946, -2.4054, 1, 0, 0, 1, 1,
-0.1424944, -0.3484737, -1.712255, 1, 0, 0, 1, 1,
-0.1409923, -0.512059, -3.707553, 1, 0, 0, 1, 1,
-0.1400594, -1.261428, -2.540629, 1, 0, 0, 1, 1,
-0.1354474, -0.3397613, -4.050298, 1, 0, 0, 1, 1,
-0.1338171, -0.6953143, -2.810219, 0, 0, 0, 1, 1,
-0.1337638, 0.5981811, -0.4254491, 0, 0, 0, 1, 1,
-0.1324239, -0.6419969, -1.079261, 0, 0, 0, 1, 1,
-0.132298, -0.2108033, -2.123909, 0, 0, 0, 1, 1,
-0.1257987, 1.634794, -0.2373517, 0, 0, 0, 1, 1,
-0.1254384, 0.5270774, -0.4732743, 0, 0, 0, 1, 1,
-0.1218111, -0.4386971, -3.288233, 0, 0, 0, 1, 1,
-0.1187594, -0.3849972, -2.770409, 1, 1, 1, 1, 1,
-0.1143904, 2.409767, 0.3806808, 1, 1, 1, 1, 1,
-0.1130163, -0.2158385, -2.390444, 1, 1, 1, 1, 1,
-0.1101645, 1.252603, -1.787661, 1, 1, 1, 1, 1,
-0.1077378, -0.579512, -2.815691, 1, 1, 1, 1, 1,
-0.1065625, 1.881117, -0.09734321, 1, 1, 1, 1, 1,
-0.1051648, -1.916389, -3.134341, 1, 1, 1, 1, 1,
-0.1047376, 0.7198681, 0.1462187, 1, 1, 1, 1, 1,
-0.0998625, 1.217356, 0.274298, 1, 1, 1, 1, 1,
-0.09471444, -0.5524357, -1.506239, 1, 1, 1, 1, 1,
-0.0943724, -0.1656509, -2.3637, 1, 1, 1, 1, 1,
-0.0936664, -1.435213, -2.969297, 1, 1, 1, 1, 1,
-0.09107708, -0.3805804, -2.628705, 1, 1, 1, 1, 1,
-0.08750404, 0.2644356, -0.5027507, 1, 1, 1, 1, 1,
-0.08464281, 1.139982, 0.4308982, 1, 1, 1, 1, 1,
-0.08450792, 0.1003717, -0.6651686, 0, 0, 1, 1, 1,
-0.08365389, 0.413473, -0.7783244, 1, 0, 0, 1, 1,
-0.08131203, -0.2568637, -3.2317, 1, 0, 0, 1, 1,
-0.08130676, -2.391562, -2.006184, 1, 0, 0, 1, 1,
-0.08040225, 0.1267436, 0.02627672, 1, 0, 0, 1, 1,
-0.07885864, 0.04082485, -1.967385, 1, 0, 0, 1, 1,
-0.07596081, -0.1750845, -2.971314, 0, 0, 0, 1, 1,
-0.07465166, 0.3145551, -0.2338189, 0, 0, 0, 1, 1,
-0.07347467, 1.100374, -0.3355882, 0, 0, 0, 1, 1,
-0.0723944, -0.01645658, -0.7122889, 0, 0, 0, 1, 1,
-0.07239037, -1.192923, -3.323085, 0, 0, 0, 1, 1,
-0.07153324, -1.096849, -3.741718, 0, 0, 0, 1, 1,
-0.06854936, -1.646073, -2.040312, 0, 0, 0, 1, 1,
-0.06846149, -0.004597004, -1.652345, 1, 1, 1, 1, 1,
-0.06814222, 0.9081846, -0.08129621, 1, 1, 1, 1, 1,
-0.06430898, -1.001595, -2.341254, 1, 1, 1, 1, 1,
-0.06371952, 0.6099065, -0.7468799, 1, 1, 1, 1, 1,
-0.06013422, 1.715123, -1.670234, 1, 1, 1, 1, 1,
-0.05745898, 0.6798495, 0.000235863, 1, 1, 1, 1, 1,
-0.05561376, 0.06468812, 0.4299935, 1, 1, 1, 1, 1,
-0.05471269, -0.5560159, -2.665508, 1, 1, 1, 1, 1,
-0.05378255, -1.715859, -4.275425, 1, 1, 1, 1, 1,
-0.04643924, 0.5418552, 0.5701919, 1, 1, 1, 1, 1,
-0.0437335, 0.07843806, -0.374564, 1, 1, 1, 1, 1,
-0.04000204, 0.1770499, -0.9585423, 1, 1, 1, 1, 1,
-0.03783606, -0.01050984, -1.922951, 1, 1, 1, 1, 1,
-0.03752006, -0.1810591, -2.948528, 1, 1, 1, 1, 1,
-0.03341527, -0.4696517, -3.050021, 1, 1, 1, 1, 1,
-0.03316335, -0.6566625, -2.774292, 0, 0, 1, 1, 1,
-0.03240047, -0.8376477, -2.573764, 1, 0, 0, 1, 1,
-0.0314285, 0.1454303, -0.4660217, 1, 0, 0, 1, 1,
-0.02162384, 0.01800136, -0.8123673, 1, 0, 0, 1, 1,
-0.02089734, 0.2592813, 0.9385321, 1, 0, 0, 1, 1,
-0.01614681, -0.1509004, -3.936847, 1, 0, 0, 1, 1,
-0.01518689, -0.315142, -2.485953, 0, 0, 0, 1, 1,
-0.01339773, 0.467359, -0.6883298, 0, 0, 0, 1, 1,
-0.01301071, -0.2542537, -1.620899, 0, 0, 0, 1, 1,
-0.0103886, -1.352515, -4.698604, 0, 0, 0, 1, 1,
-0.01006638, 0.5428458, -0.9154112, 0, 0, 0, 1, 1,
-0.007625535, -0.4896794, -2.585458, 0, 0, 0, 1, 1,
-0.007106763, -0.8746001, -4.616942, 0, 0, 0, 1, 1,
-0.006637001, 1.327093, -2.181265, 1, 1, 1, 1, 1,
0.003724817, -0.1632396, 3.290401, 1, 1, 1, 1, 1,
0.006100629, -0.2083813, 3.161439, 1, 1, 1, 1, 1,
0.007550751, -0.3882795, 3.041119, 1, 1, 1, 1, 1,
0.008349298, 0.8077566, -0.4825876, 1, 1, 1, 1, 1,
0.0128945, -0.2472162, 2.9732, 1, 1, 1, 1, 1,
0.0144727, -0.3468387, 1.169201, 1, 1, 1, 1, 1,
0.01643306, -1.386958, 2.301614, 1, 1, 1, 1, 1,
0.01973034, -1.157512, 4.152854, 1, 1, 1, 1, 1,
0.02155354, -0.9406731, 4.565737, 1, 1, 1, 1, 1,
0.02684838, 0.3085987, -1.354196, 1, 1, 1, 1, 1,
0.03089309, 1.0992, -0.7150126, 1, 1, 1, 1, 1,
0.03378057, -0.6556361, 3.150442, 1, 1, 1, 1, 1,
0.03582314, -1.397459, 4.606573, 1, 1, 1, 1, 1,
0.03594485, -0.2025574, 2.61766, 1, 1, 1, 1, 1,
0.03613151, 0.04201035, 2.138315, 0, 0, 1, 1, 1,
0.03719373, 0.9475411, 1.756808, 1, 0, 0, 1, 1,
0.05482682, -1.008391, 2.401453, 1, 0, 0, 1, 1,
0.05839935, -1.421125, 4.139399, 1, 0, 0, 1, 1,
0.0736678, 1.393602, 0.1084848, 1, 0, 0, 1, 1,
0.07645365, -0.05730197, 2.224648, 1, 0, 0, 1, 1,
0.07919062, -1.342278, 3.725267, 0, 0, 0, 1, 1,
0.08120742, 0.3047125, -0.576507, 0, 0, 0, 1, 1,
0.08495907, 0.1612363, 0.1821791, 0, 0, 0, 1, 1,
0.0870153, -0.04327419, 3.006614, 0, 0, 0, 1, 1,
0.09034956, 1.681351, -0.7669408, 0, 0, 0, 1, 1,
0.09048893, 1.556348, 0.3482001, 0, 0, 0, 1, 1,
0.09117229, 0.2096574, 0.1623015, 0, 0, 0, 1, 1,
0.09292997, 0.2879023, -0.4001869, 1, 1, 1, 1, 1,
0.09337859, 1.249829, 1.815003, 1, 1, 1, 1, 1,
0.09410863, -0.2397678, 2.273828, 1, 1, 1, 1, 1,
0.09463169, 1.127241, -0.2194355, 1, 1, 1, 1, 1,
0.0956526, 1.458245, -0.4159913, 1, 1, 1, 1, 1,
0.09692466, 0.7461244, 1.467432, 1, 1, 1, 1, 1,
0.0985957, 0.9688069, -0.1087979, 1, 1, 1, 1, 1,
0.09927859, 0.9717887, -0.01098646, 1, 1, 1, 1, 1,
0.1048311, 1.019644, 0.77885, 1, 1, 1, 1, 1,
0.1055385, -0.9123552, 3.830034, 1, 1, 1, 1, 1,
0.1056254, 1.109728, 1.386836, 1, 1, 1, 1, 1,
0.1090461, -1.306136, 1.823705, 1, 1, 1, 1, 1,
0.1091339, 1.273128, -0.3494215, 1, 1, 1, 1, 1,
0.1098051, -0.1713644, 4.144032, 1, 1, 1, 1, 1,
0.1124789, -0.1892544, 4.17568, 1, 1, 1, 1, 1,
0.1134986, 0.5674428, -0.9854658, 0, 0, 1, 1, 1,
0.1192044, 0.47168, -0.5765815, 1, 0, 0, 1, 1,
0.129572, 0.6551828, -0.03479464, 1, 0, 0, 1, 1,
0.1330625, 1.984878, -2.105026, 1, 0, 0, 1, 1,
0.140906, -0.110096, 1.487952, 1, 0, 0, 1, 1,
0.1563439, -0.5931245, 0.7694414, 1, 0, 0, 1, 1,
0.1565765, 0.903183, 1.991653, 0, 0, 0, 1, 1,
0.1572914, -1.272415, 2.604477, 0, 0, 0, 1, 1,
0.1580913, -1.194158, 3.287839, 0, 0, 0, 1, 1,
0.1582793, 0.5244883, 0.4547207, 0, 0, 0, 1, 1,
0.1602176, -0.1709603, 2.253227, 0, 0, 0, 1, 1,
0.1661001, 0.7750074, -0.05829474, 0, 0, 0, 1, 1,
0.1671062, -1.097386, 3.362826, 0, 0, 0, 1, 1,
0.1723679, 0.8562523, 1.142788, 1, 1, 1, 1, 1,
0.1746908, 1.676608, 0.6805514, 1, 1, 1, 1, 1,
0.1871968, -0.2332803, 1.95939, 1, 1, 1, 1, 1,
0.1913994, 0.06080185, 1.714957, 1, 1, 1, 1, 1,
0.1933123, 0.6030916, 1.10643, 1, 1, 1, 1, 1,
0.1969399, 0.731908, -1.282101, 1, 1, 1, 1, 1,
0.202158, 0.3940917, 3.064604, 1, 1, 1, 1, 1,
0.2050716, 0.6866549, 1.595307, 1, 1, 1, 1, 1,
0.2078776, -0.4720397, 2.114906, 1, 1, 1, 1, 1,
0.2080965, -2.094275, 2.928228, 1, 1, 1, 1, 1,
0.2122915, -0.8832808, 1.98471, 1, 1, 1, 1, 1,
0.2172351, -0.04128453, 2.350653, 1, 1, 1, 1, 1,
0.2189899, -0.7122208, 3.445656, 1, 1, 1, 1, 1,
0.2268541, 0.8687661, -0.3705171, 1, 1, 1, 1, 1,
0.2285284, 2.018161, 0.4480709, 1, 1, 1, 1, 1,
0.2304498, 0.2083626, -0.6226363, 0, 0, 1, 1, 1,
0.2380489, 1.184476, -1.080737, 1, 0, 0, 1, 1,
0.2441646, -0.5788022, 2.652337, 1, 0, 0, 1, 1,
0.2500343, -0.390249, 3.470505, 1, 0, 0, 1, 1,
0.2529469, -0.8340161, 1.727242, 1, 0, 0, 1, 1,
0.252953, 1.234291, 1.552932, 1, 0, 0, 1, 1,
0.2536303, -0.4124549, 1.937815, 0, 0, 0, 1, 1,
0.2543558, 0.5300869, -0.4344291, 0, 0, 0, 1, 1,
0.2551173, 0.9594218, 1.012961, 0, 0, 0, 1, 1,
0.2561163, -0.8377367, 2.273408, 0, 0, 0, 1, 1,
0.2622736, 1.2287, -1.288467, 0, 0, 0, 1, 1,
0.2636748, -0.05271178, 0.7818472, 0, 0, 0, 1, 1,
0.264992, 1.111063, 1.030944, 0, 0, 0, 1, 1,
0.2658997, -0.5405126, 2.164781, 1, 1, 1, 1, 1,
0.2673514, 0.814355, -1.398706, 1, 1, 1, 1, 1,
0.2710156, 1.130552, 1.296176, 1, 1, 1, 1, 1,
0.2760609, -1.092143, 2.376445, 1, 1, 1, 1, 1,
0.2768826, -0.6440207, 2.991952, 1, 1, 1, 1, 1,
0.2809302, -0.9943805, 4.592232, 1, 1, 1, 1, 1,
0.2859316, -1.308169, 1.91098, 1, 1, 1, 1, 1,
0.2888397, 0.2120816, 0.4905053, 1, 1, 1, 1, 1,
0.2926553, 1.594715, -0.5122151, 1, 1, 1, 1, 1,
0.2943284, -2.376308, 2.523527, 1, 1, 1, 1, 1,
0.3018668, -0.2100886, 1.610955, 1, 1, 1, 1, 1,
0.3066185, -1.02091, 1.955576, 1, 1, 1, 1, 1,
0.3077632, -0.6959317, 2.087663, 1, 1, 1, 1, 1,
0.3079888, -0.8471423, 2.57642, 1, 1, 1, 1, 1,
0.3094428, -1.348381, 2.643598, 1, 1, 1, 1, 1,
0.3096856, 0.2758013, 0.8689117, 0, 0, 1, 1, 1,
0.3105294, -1.204008, 3.999393, 1, 0, 0, 1, 1,
0.3143746, -0.2658324, 4.649075, 1, 0, 0, 1, 1,
0.3188946, -0.5395335, -0.3506244, 1, 0, 0, 1, 1,
0.3237456, 0.2488863, 0.1646427, 1, 0, 0, 1, 1,
0.3259783, -0.5407031, 0.2059353, 1, 0, 0, 1, 1,
0.3270119, 0.9531813, 1.310415, 0, 0, 0, 1, 1,
0.3287527, -1.403413, 2.890591, 0, 0, 0, 1, 1,
0.3309661, -0.2666868, 2.840587, 0, 0, 0, 1, 1,
0.3316692, -0.8647927, 3.210843, 0, 0, 0, 1, 1,
0.3337457, -0.7167383, 2.648763, 0, 0, 0, 1, 1,
0.3375259, 1.81996, 1.059187, 0, 0, 0, 1, 1,
0.3390598, -0.6515237, 4.369685, 0, 0, 0, 1, 1,
0.341166, -0.521363, 2.453167, 1, 1, 1, 1, 1,
0.3457168, 0.7334206, -0.3431312, 1, 1, 1, 1, 1,
0.3482024, -0.3699631, 1.458541, 1, 1, 1, 1, 1,
0.3540831, 0.5877677, 2.993568, 1, 1, 1, 1, 1,
0.3594248, 1.099713, -1.010826, 1, 1, 1, 1, 1,
0.3600352, 2.003761, -0.9774026, 1, 1, 1, 1, 1,
0.360812, -0.1162192, 2.687126, 1, 1, 1, 1, 1,
0.3617842, 0.580214, 0.1148464, 1, 1, 1, 1, 1,
0.3653805, -0.1038165, 1.834322, 1, 1, 1, 1, 1,
0.3703151, -0.273776, 2.105433, 1, 1, 1, 1, 1,
0.3724207, -0.298486, 3.908223, 1, 1, 1, 1, 1,
0.3782836, -0.6417946, 3.630069, 1, 1, 1, 1, 1,
0.3783344, 1.047827, 1.567701, 1, 1, 1, 1, 1,
0.3814692, 1.204058, -0.2509201, 1, 1, 1, 1, 1,
0.381599, 0.8141655, 0.2933875, 1, 1, 1, 1, 1,
0.3831448, -1.770644, 4.594301, 0, 0, 1, 1, 1,
0.3837889, 0.3124712, 1.657792, 1, 0, 0, 1, 1,
0.3846568, 0.2156689, 1.893676, 1, 0, 0, 1, 1,
0.384786, 0.6732041, 0.6588002, 1, 0, 0, 1, 1,
0.3898925, 0.1789072, 1.555489, 1, 0, 0, 1, 1,
0.3903967, -0.1918851, 2.363993, 1, 0, 0, 1, 1,
0.3976844, 0.8566151, 0.6025338, 0, 0, 0, 1, 1,
0.398316, 0.8762298, -2.415602, 0, 0, 0, 1, 1,
0.399278, 0.07797832, 0.1119822, 0, 0, 0, 1, 1,
0.3999358, -0.2937508, 1.842281, 0, 0, 0, 1, 1,
0.4097103, 0.9914921, 2.322632, 0, 0, 0, 1, 1,
0.4211605, 1.371204, 0.8136901, 0, 0, 0, 1, 1,
0.4238254, 0.775597, 0.3759144, 0, 0, 0, 1, 1,
0.4239339, -1.22172, 5.722407, 1, 1, 1, 1, 1,
0.4247382, -1.439661, 1.609516, 1, 1, 1, 1, 1,
0.4293626, -0.0983669, 1.908236, 1, 1, 1, 1, 1,
0.43124, -0.2560969, 2.493866, 1, 1, 1, 1, 1,
0.4363036, 0.1853977, 1.669427, 1, 1, 1, 1, 1,
0.4368568, 0.6510876, -0.07282039, 1, 1, 1, 1, 1,
0.4369785, 2.696781, -0.7808977, 1, 1, 1, 1, 1,
0.4411198, 0.5471261, 0.2177801, 1, 1, 1, 1, 1,
0.4431021, 1.587235, 0.2260526, 1, 1, 1, 1, 1,
0.4504068, -0.9709769, 3.395228, 1, 1, 1, 1, 1,
0.4510937, 1.04302, 0.4516004, 1, 1, 1, 1, 1,
0.4519105, 1.80318, -0.06242992, 1, 1, 1, 1, 1,
0.4540095, -2.371336, 3.911978, 1, 1, 1, 1, 1,
0.4555371, -1.048668, 2.537163, 1, 1, 1, 1, 1,
0.4563454, -1.187454, 1.821292, 1, 1, 1, 1, 1,
0.4564068, -2.411305, 3.598988, 0, 0, 1, 1, 1,
0.4581577, -2.254738, 4.057428, 1, 0, 0, 1, 1,
0.4603957, -0.496012, 1.311462, 1, 0, 0, 1, 1,
0.4686351, 1.1722, 0.2703573, 1, 0, 0, 1, 1,
0.4699227, 0.3695716, 0.4312486, 1, 0, 0, 1, 1,
0.4701439, 0.6662532, 0.2310479, 1, 0, 0, 1, 1,
0.4706864, 0.752962, 2.269279, 0, 0, 0, 1, 1,
0.4712953, -0.1429772, 3.398613, 0, 0, 0, 1, 1,
0.4722559, 1.159587, 1.633247, 0, 0, 0, 1, 1,
0.4732504, -0.5923993, 0.9339018, 0, 0, 0, 1, 1,
0.4750388, -0.3299554, 2.675375, 0, 0, 0, 1, 1,
0.4784326, 0.5615391, 0.5747834, 0, 0, 0, 1, 1,
0.4801953, 0.6944185, 0.3476067, 0, 0, 0, 1, 1,
0.4809684, 1.03925, 1.549561, 1, 1, 1, 1, 1,
0.4812824, 0.5426933, -1.002559, 1, 1, 1, 1, 1,
0.4818924, 0.6361924, 1.354906, 1, 1, 1, 1, 1,
0.4835656, 0.4489187, 0.05377217, 1, 1, 1, 1, 1,
0.4838914, 0.5395201, -0.3562093, 1, 1, 1, 1, 1,
0.4867894, -0.1696991, 3.665934, 1, 1, 1, 1, 1,
0.4883948, -1.159223, 1.080813, 1, 1, 1, 1, 1,
0.4907243, 0.4123312, 1.147391, 1, 1, 1, 1, 1,
0.490884, 0.8950324, -0.113151, 1, 1, 1, 1, 1,
0.4908891, 1.610242, 1.145815, 1, 1, 1, 1, 1,
0.4910867, 0.06549173, 4.092107, 1, 1, 1, 1, 1,
0.4928139, 0.9073101, 0.8685849, 1, 1, 1, 1, 1,
0.4948924, -0.4958119, 3.541458, 1, 1, 1, 1, 1,
0.4970078, 0.05758123, 1.540151, 1, 1, 1, 1, 1,
0.4977138, 0.584367, -0.06982104, 1, 1, 1, 1, 1,
0.5033445, 1.609111, 0.03363369, 0, 0, 1, 1, 1,
0.5083548, -0.3779337, 2.631209, 1, 0, 0, 1, 1,
0.5118842, -1.163958, 1.703578, 1, 0, 0, 1, 1,
0.5120342, -1.482021, 3.22015, 1, 0, 0, 1, 1,
0.5134888, -0.8939924, 2.14501, 1, 0, 0, 1, 1,
0.5144807, 1.142439, -0.2506349, 1, 0, 0, 1, 1,
0.5157939, 0.804015, 1.044694, 0, 0, 0, 1, 1,
0.516102, -0.1563971, 2.251593, 0, 0, 0, 1, 1,
0.5205271, -0.5036485, 2.830958, 0, 0, 0, 1, 1,
0.5234619, 0.7944104, 2.024551, 0, 0, 0, 1, 1,
0.523731, 0.8741401, -0.282691, 0, 0, 0, 1, 1,
0.5247502, 0.132011, 0.2831039, 0, 0, 0, 1, 1,
0.5250653, 1.293755, -0.7192661, 0, 0, 0, 1, 1,
0.5265462, -0.6997791, 1.882993, 1, 1, 1, 1, 1,
0.5282567, 0.6315628, 0.8775484, 1, 1, 1, 1, 1,
0.5289537, 1.262196, 2.182634, 1, 1, 1, 1, 1,
0.5292913, -0.4161108, 2.008071, 1, 1, 1, 1, 1,
0.5317082, -1.051457, 3.998221, 1, 1, 1, 1, 1,
0.5365762, -0.9990586, 2.985205, 1, 1, 1, 1, 1,
0.5401983, -0.01885729, 1.98815, 1, 1, 1, 1, 1,
0.5521373, -1.019949, 3.243409, 1, 1, 1, 1, 1,
0.5522328, 0.3462295, 0.5536018, 1, 1, 1, 1, 1,
0.5532695, -1.17612, 2.930556, 1, 1, 1, 1, 1,
0.5567911, -0.3379519, 1.793108, 1, 1, 1, 1, 1,
0.5586802, -0.009470863, 1.003057, 1, 1, 1, 1, 1,
0.5600818, 0.604135, -0.2784442, 1, 1, 1, 1, 1,
0.5618525, -0.0009075201, 1.931291, 1, 1, 1, 1, 1,
0.5622679, -0.3091989, 2.101415, 1, 1, 1, 1, 1,
0.5690954, 1.073681, 1.063909, 0, 0, 1, 1, 1,
0.57766, -0.5216928, 3.858954, 1, 0, 0, 1, 1,
0.5826151, -0.4504444, 1.510296, 1, 0, 0, 1, 1,
0.5836839, 0.6689953, 1.3531, 1, 0, 0, 1, 1,
0.586241, 0.3564236, 1.885716, 1, 0, 0, 1, 1,
0.5863355, -0.4390364, 3.94504, 1, 0, 0, 1, 1,
0.5866793, 0.7364369, -0.4077989, 0, 0, 0, 1, 1,
0.5886211, -0.03060029, 1.835016, 0, 0, 0, 1, 1,
0.5911577, 0.845529, 0.5857264, 0, 0, 0, 1, 1,
0.5947334, -0.1715008, 1.577122, 0, 0, 0, 1, 1,
0.595223, 1.528876, 2.823009, 0, 0, 0, 1, 1,
0.5974662, 1.709478, 0.7021386, 0, 0, 0, 1, 1,
0.5990708, 0.6784377, 0.777046, 0, 0, 0, 1, 1,
0.6063504, 0.9919753, -0.7886397, 1, 1, 1, 1, 1,
0.6105193, 0.1902465, -0.491007, 1, 1, 1, 1, 1,
0.6160534, -0.5932355, 2.425206, 1, 1, 1, 1, 1,
0.6260971, -0.3093154, 2.294909, 1, 1, 1, 1, 1,
0.6276478, 0.7224553, 0.402323, 1, 1, 1, 1, 1,
0.6299841, -0.9330208, 2.905202, 1, 1, 1, 1, 1,
0.6304412, 1.863244, -1.109891, 1, 1, 1, 1, 1,
0.6335605, -0.3468579, 2.320627, 1, 1, 1, 1, 1,
0.6349957, -1.884248, 2.243659, 1, 1, 1, 1, 1,
0.6401684, 1.141898, 1.700447, 1, 1, 1, 1, 1,
0.641309, 0.5858648, 1.260769, 1, 1, 1, 1, 1,
0.6444797, -0.1324905, 3.228856, 1, 1, 1, 1, 1,
0.6448784, -0.706954, 3.089536, 1, 1, 1, 1, 1,
0.6476105, -0.1206311, 2.803385, 1, 1, 1, 1, 1,
0.6480613, 0.2257481, -0.005598533, 1, 1, 1, 1, 1,
0.648867, -0.2069059, 2.720366, 0, 0, 1, 1, 1,
0.6501635, 1.915326, -1.300612, 1, 0, 0, 1, 1,
0.6568488, -0.9808887, 0.5703552, 1, 0, 0, 1, 1,
0.6673619, 0.4284621, -0.2199485, 1, 0, 0, 1, 1,
0.6686683, -1.942782, 3.102121, 1, 0, 0, 1, 1,
0.6687471, 0.7823116, 0.9840468, 1, 0, 0, 1, 1,
0.6831148, 0.6241397, -0.2394114, 0, 0, 0, 1, 1,
0.6833831, 0.6625587, 1.57354, 0, 0, 0, 1, 1,
0.6937192, -1.538585, 2.421349, 0, 0, 0, 1, 1,
0.6961565, -0.6387519, 3.260291, 0, 0, 0, 1, 1,
0.705871, 0.04340529, 3.109663, 0, 0, 0, 1, 1,
0.7079358, 1.143425, 1.341605, 0, 0, 0, 1, 1,
0.7134045, -0.2311215, 1.007688, 0, 0, 0, 1, 1,
0.7148347, 0.2682521, 1.076667, 1, 1, 1, 1, 1,
0.7173539, 1.366818, -0.3462649, 1, 1, 1, 1, 1,
0.7174346, 1.026412, 1.509255, 1, 1, 1, 1, 1,
0.7189676, 0.3057944, 1.543331, 1, 1, 1, 1, 1,
0.7193857, 0.4210198, 0.5338714, 1, 1, 1, 1, 1,
0.7198083, 0.5815544, 0.5826591, 1, 1, 1, 1, 1,
0.7450642, -1.31605, 1.499968, 1, 1, 1, 1, 1,
0.7466688, -0.1397035, 1.657733, 1, 1, 1, 1, 1,
0.7477562, 0.290478, 1.606306, 1, 1, 1, 1, 1,
0.7561665, -1.199163, 2.055922, 1, 1, 1, 1, 1,
0.7581031, 0.877103, 0.3423772, 1, 1, 1, 1, 1,
0.7628074, -0.07085306, 2.282716, 1, 1, 1, 1, 1,
0.7634634, 1.647146, 0.5385249, 1, 1, 1, 1, 1,
0.7737955, 0.2994333, -1.166456, 1, 1, 1, 1, 1,
0.7803895, -0.6799403, 1.99559, 1, 1, 1, 1, 1,
0.7837706, 0.5656916, 2.145061, 0, 0, 1, 1, 1,
0.7856066, 0.01750987, 2.391074, 1, 0, 0, 1, 1,
0.7863115, 1.80239, 1.964436, 1, 0, 0, 1, 1,
0.7908929, 1.200141, 3.257705, 1, 0, 0, 1, 1,
0.8025766, -0.3579977, 1.320904, 1, 0, 0, 1, 1,
0.8036458, 0.23669, 0.9810866, 1, 0, 0, 1, 1,
0.8039175, 0.7137238, 0.853206, 0, 0, 0, 1, 1,
0.806743, 1.626217, 1.179506, 0, 0, 0, 1, 1,
0.8099554, -0.9532391, 3.552127, 0, 0, 0, 1, 1,
0.8209642, 0.4655445, 3.066742, 0, 0, 0, 1, 1,
0.8209905, 0.5089088, 0.4739974, 0, 0, 0, 1, 1,
0.8264897, 2.513016, 0.8865599, 0, 0, 0, 1, 1,
0.8268641, 0.9646385, 1.384102, 0, 0, 0, 1, 1,
0.8297706, -0.8236226, 3.29447, 1, 1, 1, 1, 1,
0.8306456, 0.9901574, 0.9747182, 1, 1, 1, 1, 1,
0.830947, 0.002114226, 0.9226734, 1, 1, 1, 1, 1,
0.8326113, -2.243963, 1.984013, 1, 1, 1, 1, 1,
0.8396567, 0.6293507, 1.206712, 1, 1, 1, 1, 1,
0.8396976, 0.1888159, 2.295712, 1, 1, 1, 1, 1,
0.8403898, 0.01479806, 2.206478, 1, 1, 1, 1, 1,
0.8413363, -1.357305, 3.175095, 1, 1, 1, 1, 1,
0.8453828, -0.1750081, 1.926597, 1, 1, 1, 1, 1,
0.8470271, -1.297007, 1.865595, 1, 1, 1, 1, 1,
0.8537117, -0.3877893, 0.6475568, 1, 1, 1, 1, 1,
0.8541438, 0.8053026, 1.57916, 1, 1, 1, 1, 1,
0.8565513, 0.09699486, 2.086603, 1, 1, 1, 1, 1,
0.858611, -0.9170768, 4.677649, 1, 1, 1, 1, 1,
0.8666131, 0.3514623, 0.02091848, 1, 1, 1, 1, 1,
0.8683847, 0.6800873, 0.1210934, 0, 0, 1, 1, 1,
0.8727903, 0.2435462, 2.416251, 1, 0, 0, 1, 1,
0.8794957, -1.046893, 2.609468, 1, 0, 0, 1, 1,
0.8832722, -0.4561711, 1.761662, 1, 0, 0, 1, 1,
0.8846837, 0.468853, 1.13323, 1, 0, 0, 1, 1,
0.8860095, 0.06108622, 2.317072, 1, 0, 0, 1, 1,
0.8879006, -0.2820674, 1.643945, 0, 0, 0, 1, 1,
0.8901973, -1.225009, 2.706533, 0, 0, 0, 1, 1,
0.8956232, 1.769719, -0.6163707, 0, 0, 0, 1, 1,
0.8963339, 0.9395025, 0.1341517, 0, 0, 0, 1, 1,
0.897308, -0.3531021, 1.84252, 0, 0, 0, 1, 1,
0.8979749, -0.2996783, 2.706928, 0, 0, 0, 1, 1,
0.9027406, 0.4368654, 1.146371, 0, 0, 0, 1, 1,
0.9033077, 0.4958062, -0.3054964, 1, 1, 1, 1, 1,
0.9128993, -0.8916574, 1.077928, 1, 1, 1, 1, 1,
0.9224904, -1.228144, 2.6171, 1, 1, 1, 1, 1,
0.9236357, -0.02675212, 2.160499, 1, 1, 1, 1, 1,
0.9280139, 2.121645, -1.56343, 1, 1, 1, 1, 1,
0.9340521, 0.7993034, 0.9097987, 1, 1, 1, 1, 1,
0.9354339, -0.0154139, 0.9233802, 1, 1, 1, 1, 1,
0.9413604, -1.183611, 1.936539, 1, 1, 1, 1, 1,
0.9423925, 0.9426054, 1.695645, 1, 1, 1, 1, 1,
0.9455901, -0.6288536, 0.8902151, 1, 1, 1, 1, 1,
0.9461022, -0.8237982, 2.846802, 1, 1, 1, 1, 1,
0.9501308, -1.349666, 1.379341, 1, 1, 1, 1, 1,
0.9550115, 0.5403032, 2.080456, 1, 1, 1, 1, 1,
0.9585727, 1.188009, -1.26022, 1, 1, 1, 1, 1,
0.9608798, -0.6296448, 0.7974959, 1, 1, 1, 1, 1,
0.9727429, 1.149866, 1.140515, 0, 0, 1, 1, 1,
0.9728089, -0.7606348, 2.245092, 1, 0, 0, 1, 1,
0.9755245, 0.2325093, 3.45383, 1, 0, 0, 1, 1,
0.9781712, -0.2917531, 3.813865, 1, 0, 0, 1, 1,
0.9842835, 0.9137942, 2.566154, 1, 0, 0, 1, 1,
0.9916536, -0.718362, 0.1073629, 1, 0, 0, 1, 1,
0.9925473, -0.6320201, 2.98629, 0, 0, 0, 1, 1,
0.9991128, 0.2507162, 1.018447, 0, 0, 0, 1, 1,
1.000204, 0.9006902, 2.211287, 0, 0, 0, 1, 1,
1.004447, -1.760726, 3.018126, 0, 0, 0, 1, 1,
1.019928, 0.1291459, 1.721502, 0, 0, 0, 1, 1,
1.022943, 0.5442079, 0.07908072, 0, 0, 0, 1, 1,
1.042848, -0.2542127, 1.99419, 0, 0, 0, 1, 1,
1.051244, -0.08524856, 1.209673, 1, 1, 1, 1, 1,
1.051467, -1.136253, 2.806908, 1, 1, 1, 1, 1,
1.07042, 0.5430281, 2.045579, 1, 1, 1, 1, 1,
1.075264, 0.02893532, 0.224028, 1, 1, 1, 1, 1,
1.079499, -1.364292, 1.492594, 1, 1, 1, 1, 1,
1.082018, 0.3720161, 1.140717, 1, 1, 1, 1, 1,
1.082546, -0.1818982, 0.54588, 1, 1, 1, 1, 1,
1.086087, -1.229424, 2.486498, 1, 1, 1, 1, 1,
1.088621, -0.8583387, 0.5286416, 1, 1, 1, 1, 1,
1.098427, 0.1754572, 2.120846, 1, 1, 1, 1, 1,
1.111707, -1.573334, 0.8619208, 1, 1, 1, 1, 1,
1.117764, -1.180346, 1.665245, 1, 1, 1, 1, 1,
1.13271, -1.255157, 1.484488, 1, 1, 1, 1, 1,
1.133773, 0.737076, 0.7090988, 1, 1, 1, 1, 1,
1.135191, 0.7763448, 3.228421, 1, 1, 1, 1, 1,
1.13641, 1.40245, -1.195989, 0, 0, 1, 1, 1,
1.138593, -0.6218184, 2.101351, 1, 0, 0, 1, 1,
1.143316, -0.03915963, 2.558894, 1, 0, 0, 1, 1,
1.149614, 1.542993, 0.02646619, 1, 0, 0, 1, 1,
1.152198, 0.09484802, -0.06066551, 1, 0, 0, 1, 1,
1.153586, -0.8143581, 3.39783, 1, 0, 0, 1, 1,
1.158659, 0.5544821, 0.7029555, 0, 0, 0, 1, 1,
1.16215, 1.814641, 0.5867996, 0, 0, 0, 1, 1,
1.172565, -0.02396417, 1.958679, 0, 0, 0, 1, 1,
1.175014, -0.08807827, 1.221562, 0, 0, 0, 1, 1,
1.185862, -1.108095, 3.071924, 0, 0, 0, 1, 1,
1.199482, 0.3879681, -0.4493937, 0, 0, 0, 1, 1,
1.204344, -0.5347706, 4.93429, 0, 0, 0, 1, 1,
1.207436, 0.6355503, 2.013674, 1, 1, 1, 1, 1,
1.210776, -0.8143849, 1.63659, 1, 1, 1, 1, 1,
1.215371, -0.0670496, 1.416777, 1, 1, 1, 1, 1,
1.217247, -0.9143664, 1.700479, 1, 1, 1, 1, 1,
1.219318, -1.957079, 4.154053, 1, 1, 1, 1, 1,
1.223182, 1.017954, 0.1974839, 1, 1, 1, 1, 1,
1.228811, -1.084264, 2.477381, 1, 1, 1, 1, 1,
1.23497, 2.418248, -0.2832823, 1, 1, 1, 1, 1,
1.239133, -0.3305952, 0.7827243, 1, 1, 1, 1, 1,
1.240203, -0.2906686, 1.97733, 1, 1, 1, 1, 1,
1.244387, -0.862416, 2.716784, 1, 1, 1, 1, 1,
1.248308, -0.1134178, 2.92827, 1, 1, 1, 1, 1,
1.250046, 0.5583484, 1.301701, 1, 1, 1, 1, 1,
1.254592, -0.1365825, 1.231236, 1, 1, 1, 1, 1,
1.258525, 0.1045855, 0.5240939, 1, 1, 1, 1, 1,
1.259625, 0.4031539, 2.951112, 0, 0, 1, 1, 1,
1.261137, -0.6762522, 0.433609, 1, 0, 0, 1, 1,
1.268216, 0.8992529, 1.78585, 1, 0, 0, 1, 1,
1.272852, -0.8875344, 1.24777, 1, 0, 0, 1, 1,
1.278531, 0.03942191, 2.434306, 1, 0, 0, 1, 1,
1.285459, 0.09214467, 1.460438, 1, 0, 0, 1, 1,
1.299928, -1.510828, 2.143678, 0, 0, 0, 1, 1,
1.301811, -0.1577069, 1.5623, 0, 0, 0, 1, 1,
1.304474, 1.487568, 0.4668117, 0, 0, 0, 1, 1,
1.310055, 0.5867023, 0.3323537, 0, 0, 0, 1, 1,
1.33639, 0.4382763, 2.444114, 0, 0, 0, 1, 1,
1.337382, -0.3197687, 3.631617, 0, 0, 0, 1, 1,
1.343474, 1.186957, 1.461528, 0, 0, 0, 1, 1,
1.34503, -1.092235, 2.682275, 1, 1, 1, 1, 1,
1.354009, 1.032368, 1.20215, 1, 1, 1, 1, 1,
1.368839, 1.16799, 1.810489, 1, 1, 1, 1, 1,
1.373339, -1.177625, 2.676536, 1, 1, 1, 1, 1,
1.387166, -0.1534359, 0.9662977, 1, 1, 1, 1, 1,
1.388639, -1.105516, 2.119594, 1, 1, 1, 1, 1,
1.389966, 1.238248, 0.6397597, 1, 1, 1, 1, 1,
1.390136, 0.7965218, 1.090751, 1, 1, 1, 1, 1,
1.412896, -0.3107826, 0.6358919, 1, 1, 1, 1, 1,
1.424956, -1.328218, 4.335111, 1, 1, 1, 1, 1,
1.426422, -0.6107001, 2.3095, 1, 1, 1, 1, 1,
1.42714, 1.007122, 0.8817589, 1, 1, 1, 1, 1,
1.427481, 0.3988964, 1.829146, 1, 1, 1, 1, 1,
1.433889, 0.8447158, 0.1939752, 1, 1, 1, 1, 1,
1.435614, 0.09007035, 1.832078, 1, 1, 1, 1, 1,
1.445269, -0.4623044, -0.09453191, 0, 0, 1, 1, 1,
1.445665, 0.961378, 0.5869819, 1, 0, 0, 1, 1,
1.465408, 0.2560263, 1.889177, 1, 0, 0, 1, 1,
1.467535, -0.4167232, 1.471065, 1, 0, 0, 1, 1,
1.473428, 1.713565, 2.37524, 1, 0, 0, 1, 1,
1.475795, 0.8890563, 2.794132, 1, 0, 0, 1, 1,
1.486269, -0.200042, -0.8781355, 0, 0, 0, 1, 1,
1.495303, -0.9104324, 2.358085, 0, 0, 0, 1, 1,
1.497374, 0.578637, 0.04181393, 0, 0, 0, 1, 1,
1.501506, 0.09222437, 0.1002448, 0, 0, 0, 1, 1,
1.501782, -0.7125015, 2.272137, 0, 0, 0, 1, 1,
1.503312, 0.2761111, 0.5232643, 0, 0, 0, 1, 1,
1.504314, 0.0114968, 2.394611, 0, 0, 0, 1, 1,
1.505332, 0.02116908, -0.3592785, 1, 1, 1, 1, 1,
1.519563, -0.4758733, 3.508281, 1, 1, 1, 1, 1,
1.523443, -1.009585, 3.206746, 1, 1, 1, 1, 1,
1.540526, 0.8127167, -0.09254057, 1, 1, 1, 1, 1,
1.544376, -0.867827, 2.441538, 1, 1, 1, 1, 1,
1.551036, -1.631606, 3.208304, 1, 1, 1, 1, 1,
1.551269, 1.715487, 2.587066, 1, 1, 1, 1, 1,
1.553226, 1.162621, 1.423047, 1, 1, 1, 1, 1,
1.56238, -2.091949, 1.340727, 1, 1, 1, 1, 1,
1.565123, 1.635854, -0.47175, 1, 1, 1, 1, 1,
1.588718, -0.04242374, 1.758004, 1, 1, 1, 1, 1,
1.596068, -0.970172, 2.564457, 1, 1, 1, 1, 1,
1.60554, 0.4267671, 0.8575228, 1, 1, 1, 1, 1,
1.610255, -0.3886669, 2.073117, 1, 1, 1, 1, 1,
1.61195, 0.112371, 1.558653, 1, 1, 1, 1, 1,
1.615955, -0.815116, 2.523749, 0, 0, 1, 1, 1,
1.620314, 0.1944223, 1.767657, 1, 0, 0, 1, 1,
1.643445, -0.1950076, 2.000107, 1, 0, 0, 1, 1,
1.644016, -1.474108, 1.349609, 1, 0, 0, 1, 1,
1.650238, -0.8357159, 2.940474, 1, 0, 0, 1, 1,
1.683963, 1.159516, 2.404532, 1, 0, 0, 1, 1,
1.6859, 1.141389, 1.360295, 0, 0, 0, 1, 1,
1.691366, -0.3501676, 2.881899, 0, 0, 0, 1, 1,
1.72395, 1.970914, 0.6426669, 0, 0, 0, 1, 1,
1.772254, 0.1120612, 0.4638149, 0, 0, 0, 1, 1,
1.773788, 0.6406099, 1.748606, 0, 0, 0, 1, 1,
1.780775, 0.1485095, 1.57052, 0, 0, 0, 1, 1,
1.786357, 2.313621, -0.5610231, 0, 0, 0, 1, 1,
1.792289, 1.369051, -0.9446078, 1, 1, 1, 1, 1,
1.799993, 0.2779463, -0.1133263, 1, 1, 1, 1, 1,
1.808955, -0.313967, 1.233457, 1, 1, 1, 1, 1,
1.840552, 1.244413, 0.4489176, 1, 1, 1, 1, 1,
1.9103, -1.4216, 2.864889, 1, 1, 1, 1, 1,
1.924597, 1.205556, 0.4796202, 1, 1, 1, 1, 1,
1.931008, -0.451642, 1.575919, 1, 1, 1, 1, 1,
1.948465, -1.181831, 4.304071, 1, 1, 1, 1, 1,
1.960574, 0.3577825, 0.4652593, 1, 1, 1, 1, 1,
1.983296, -0.9839371, 1.232134, 1, 1, 1, 1, 1,
2.020941, -1.695413, 1.104613, 1, 1, 1, 1, 1,
2.092867, 0.8236966, 1.218521, 1, 1, 1, 1, 1,
2.110977, -0.1441211, -0.4038242, 1, 1, 1, 1, 1,
2.129043, -0.3757229, 0.4654397, 1, 1, 1, 1, 1,
2.132525, -0.5520501, 3.744745, 1, 1, 1, 1, 1,
2.179384, -0.5538965, 0.6715826, 0, 0, 1, 1, 1,
2.190776, -0.2822018, 2.512182, 1, 0, 0, 1, 1,
2.195791, 0.5258448, 1.888965, 1, 0, 0, 1, 1,
2.225011, -1.003703, 2.423463, 1, 0, 0, 1, 1,
2.238792, -0.07534329, 1.713597, 1, 0, 0, 1, 1,
2.239701, 0.6616208, 2.056066, 1, 0, 0, 1, 1,
2.272853, 1.199028, 0.9726878, 0, 0, 0, 1, 1,
2.355905, 0.2971041, 0.2663027, 0, 0, 0, 1, 1,
2.444208, 1.396494, 1.451015, 0, 0, 0, 1, 1,
2.526977, -1.089813, 1.017223, 0, 0, 0, 1, 1,
2.529355, 2.754732, 2.117245, 0, 0, 0, 1, 1,
2.531327, -1.284557, 2.394025, 0, 0, 0, 1, 1,
2.562415, -0.6174277, 1.763537, 0, 0, 0, 1, 1,
2.655421, -0.03007038, 1.874943, 1, 1, 1, 1, 1,
2.717784, 1.018482, 1.069627, 1, 1, 1, 1, 1,
2.791352, -0.226415, 1.07518, 1, 1, 1, 1, 1,
2.876936, 1.224335, 1.693927, 1, 1, 1, 1, 1,
2.897074, -0.1151069, 1.98582, 1, 1, 1, 1, 1,
3.09873, -0.3366283, 1.10539, 1, 1, 1, 1, 1,
3.5354, 0.323293, 2.318003, 1, 1, 1, 1, 1
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
var radius = 9.734648;
var distance = 34.19254;
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
mvMatrix.translate( -0.27811, 0.1918805, -0.05662227 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.19254);
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
