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
-3.667895, 1.418125, -1.947724, 1, 0, 0, 1,
-3.43083, -0.3152383, -2.385605, 1, 0.007843138, 0, 1,
-3.110727, -1.302915, -3.311889, 1, 0.01176471, 0, 1,
-2.99791, -1.847289, -1.608581, 1, 0.01960784, 0, 1,
-2.924584, -0.3398579, -3.300751, 1, 0.02352941, 0, 1,
-2.575822, -1.713075, -2.791706, 1, 0.03137255, 0, 1,
-2.473871, -0.1754451, -2.526288, 1, 0.03529412, 0, 1,
-2.412151, 1.759605, -0.07776618, 1, 0.04313726, 0, 1,
-2.309236, -1.01206, -2.367967, 1, 0.04705882, 0, 1,
-2.240552, 0.1755932, -2.349993, 1, 0.05490196, 0, 1,
-2.218105, -1.73292, -1.281284, 1, 0.05882353, 0, 1,
-2.201359, -2.014942, -0.6013886, 1, 0.06666667, 0, 1,
-2.191869, 0.7037427, -0.8096922, 1, 0.07058824, 0, 1,
-2.13123, -0.1927762, -1.952678, 1, 0.07843138, 0, 1,
-2.125942, 0.1541429, -0.5067241, 1, 0.08235294, 0, 1,
-2.119225, -1.039729, -1.996159, 1, 0.09019608, 0, 1,
-2.11039, -0.4617364, -2.900139, 1, 0.09411765, 0, 1,
-2.105815, 0.7833135, -1.770348, 1, 0.1019608, 0, 1,
-2.10313, 1.071657, -2.013412, 1, 0.1098039, 0, 1,
-2.058779, 2.022899, 1.166948, 1, 0.1137255, 0, 1,
-1.999431, -0.1794194, -0.9894485, 1, 0.1215686, 0, 1,
-1.985122, 0.5505373, 0.9862135, 1, 0.1254902, 0, 1,
-1.929295, 0.639908, -3.58546, 1, 0.1333333, 0, 1,
-1.928441, -0.2036587, -0.3726265, 1, 0.1372549, 0, 1,
-1.914285, 0.330972, 0.621116, 1, 0.145098, 0, 1,
-1.909642, 0.5360631, -2.09523, 1, 0.1490196, 0, 1,
-1.906774, -1.305524, -1.7989, 1, 0.1568628, 0, 1,
-1.877091, 0.5569305, -1.426322, 1, 0.1607843, 0, 1,
-1.875078, -1.264875, -2.281917, 1, 0.1686275, 0, 1,
-1.866187, 1.413748, 0.5450375, 1, 0.172549, 0, 1,
-1.834601, -0.672411, -2.512403, 1, 0.1803922, 0, 1,
-1.820886, -1.652876, -4.027787, 1, 0.1843137, 0, 1,
-1.79812, -0.6427795, -1.761053, 1, 0.1921569, 0, 1,
-1.794326, 0.3040577, -0.9234567, 1, 0.1960784, 0, 1,
-1.78553, 0.6246076, -1.517484, 1, 0.2039216, 0, 1,
-1.770457, -1.210465, -3.086835, 1, 0.2117647, 0, 1,
-1.761106, -0.172763, -2.0551, 1, 0.2156863, 0, 1,
-1.751033, -0.8866448, -2.377917, 1, 0.2235294, 0, 1,
-1.750249, -0.1963352, -2.508603, 1, 0.227451, 0, 1,
-1.732497, 0.4783501, -3.503953, 1, 0.2352941, 0, 1,
-1.732311, 0.4413787, 0.5460792, 1, 0.2392157, 0, 1,
-1.719598, -1.074568, -3.340162, 1, 0.2470588, 0, 1,
-1.71835, -0.8110943, -2.951865, 1, 0.2509804, 0, 1,
-1.717461, -0.1086382, -0.9187371, 1, 0.2588235, 0, 1,
-1.711722, 0.3467228, -2.705521, 1, 0.2627451, 0, 1,
-1.706021, -1.3866, -1.391555, 1, 0.2705882, 0, 1,
-1.692525, 0.4427385, -2.543568, 1, 0.2745098, 0, 1,
-1.688308, 2.02428, -2.488849, 1, 0.282353, 0, 1,
-1.679274, 3.010849, -0.08347949, 1, 0.2862745, 0, 1,
-1.657155, 0.24572, -1.177759, 1, 0.2941177, 0, 1,
-1.65399, -0.01859117, -0.8961841, 1, 0.3019608, 0, 1,
-1.639404, -0.008354653, -0.8384259, 1, 0.3058824, 0, 1,
-1.637572, -0.6089206, -1.839474, 1, 0.3137255, 0, 1,
-1.636552, -1.024169, -1.44764, 1, 0.3176471, 0, 1,
-1.630326, -0.7986032, -1.554998, 1, 0.3254902, 0, 1,
-1.629976, 0.8401389, -2.289496, 1, 0.3294118, 0, 1,
-1.621319, 1.413375, -0.4134504, 1, 0.3372549, 0, 1,
-1.61808, 1.265835, -0.5773286, 1, 0.3411765, 0, 1,
-1.611787, 0.4922764, -2.629839, 1, 0.3490196, 0, 1,
-1.605838, 1.383594, -2.011095, 1, 0.3529412, 0, 1,
-1.604272, -0.1311052, -1.626621, 1, 0.3607843, 0, 1,
-1.601414, -0.4469285, -2.572559, 1, 0.3647059, 0, 1,
-1.58533, -0.4383287, -2.853739, 1, 0.372549, 0, 1,
-1.58422, 2.535107, -0.5678073, 1, 0.3764706, 0, 1,
-1.579169, 0.3660362, -1.536353, 1, 0.3843137, 0, 1,
-1.578708, 2.070414, -0.1346015, 1, 0.3882353, 0, 1,
-1.551834, -1.388098, -1.188558, 1, 0.3960784, 0, 1,
-1.551441, -0.2589477, -1.690079, 1, 0.4039216, 0, 1,
-1.54417, 1.031833, -1.665157, 1, 0.4078431, 0, 1,
-1.531719, 0.5032039, -1.196047, 1, 0.4156863, 0, 1,
-1.528951, 0.02151427, -0.2272011, 1, 0.4196078, 0, 1,
-1.522204, -2.753534, -3.97701, 1, 0.427451, 0, 1,
-1.519161, -0.001523973, -1.234844, 1, 0.4313726, 0, 1,
-1.510399, 2.361648, 0.08382356, 1, 0.4392157, 0, 1,
-1.506009, -0.8653636, -3.185796, 1, 0.4431373, 0, 1,
-1.496933, -0.5390211, -2.934682, 1, 0.4509804, 0, 1,
-1.491905, -0.2915787, -2.243193, 1, 0.454902, 0, 1,
-1.484209, 1.098164, -0.9959409, 1, 0.4627451, 0, 1,
-1.482565, 0.9427235, -0.7357005, 1, 0.4666667, 0, 1,
-1.476996, -0.5012444, -1.552367, 1, 0.4745098, 0, 1,
-1.461619, -0.8073686, -1.238801, 1, 0.4784314, 0, 1,
-1.460983, -0.1022565, -3.815249, 1, 0.4862745, 0, 1,
-1.452784, 0.6189671, -2.671065, 1, 0.4901961, 0, 1,
-1.44638, 1.244496, 0.5265983, 1, 0.4980392, 0, 1,
-1.441242, 0.2100659, -2.763915, 1, 0.5058824, 0, 1,
-1.436085, -0.3211216, -1.533213, 1, 0.509804, 0, 1,
-1.42378, -0.1908927, -1.636992, 1, 0.5176471, 0, 1,
-1.422066, 0.04702791, -2.829306, 1, 0.5215687, 0, 1,
-1.419819, -1.61532, -2.146103, 1, 0.5294118, 0, 1,
-1.413319, -0.813548, -2.742792, 1, 0.5333334, 0, 1,
-1.407943, -0.1322443, -1.300534, 1, 0.5411765, 0, 1,
-1.389001, 0.3113534, -0.5782008, 1, 0.5450981, 0, 1,
-1.382105, -0.5314052, -2.982187, 1, 0.5529412, 0, 1,
-1.36417, -1.132054, -2.078307, 1, 0.5568628, 0, 1,
-1.361406, 0.1704953, -3.234118, 1, 0.5647059, 0, 1,
-1.357226, 0.5535871, -1.057185, 1, 0.5686275, 0, 1,
-1.35182, 0.199893, -1.312953, 1, 0.5764706, 0, 1,
-1.345001, -0.8385303, -1.87354, 1, 0.5803922, 0, 1,
-1.323824, 1.395806, 1.493622, 1, 0.5882353, 0, 1,
-1.322768, -0.5597618, -2.57392, 1, 0.5921569, 0, 1,
-1.314051, -1.006769, -3.717908, 1, 0.6, 0, 1,
-1.299358, -0.4643274, -2.50285, 1, 0.6078432, 0, 1,
-1.299288, 2.2578, 0.2720773, 1, 0.6117647, 0, 1,
-1.294291, 0.5540533, -3.647539, 1, 0.6196079, 0, 1,
-1.291174, 0.04767356, 0.02205759, 1, 0.6235294, 0, 1,
-1.289961, -0.05917315, -2.485897, 1, 0.6313726, 0, 1,
-1.28763, 0.324215, -0.6528803, 1, 0.6352941, 0, 1,
-1.279639, 0.4472925, -0.2945731, 1, 0.6431373, 0, 1,
-1.277329, -0.9111609, -1.505079, 1, 0.6470588, 0, 1,
-1.26987, -0.9516041, -1.373794, 1, 0.654902, 0, 1,
-1.2495, 0.9153163, -1.949656, 1, 0.6588235, 0, 1,
-1.238016, -0.03441673, 0.7412195, 1, 0.6666667, 0, 1,
-1.234802, 0.1729091, -0.2480762, 1, 0.6705883, 0, 1,
-1.229792, -0.4488007, -1.210384, 1, 0.6784314, 0, 1,
-1.22567, 0.7201028, 1.270326, 1, 0.682353, 0, 1,
-1.20778, -0.9297698, -0.731301, 1, 0.6901961, 0, 1,
-1.207402, -0.778989, -2.453742, 1, 0.6941177, 0, 1,
-1.199911, -1.04347, -2.408645, 1, 0.7019608, 0, 1,
-1.191803, 1.948272, -0.9004136, 1, 0.7098039, 0, 1,
-1.187939, -0.6295542, -1.48078, 1, 0.7137255, 0, 1,
-1.186807, 0.08899485, -3.017507, 1, 0.7215686, 0, 1,
-1.181785, 1.328901, -0.5603371, 1, 0.7254902, 0, 1,
-1.179481, -0.04975076, -3.074371, 1, 0.7333333, 0, 1,
-1.179246, -0.9505413, -0.5641549, 1, 0.7372549, 0, 1,
-1.178469, 1.114313, -1.481084, 1, 0.7450981, 0, 1,
-1.177842, -0.7358218, -1.355437, 1, 0.7490196, 0, 1,
-1.17596, -1.748667, -1.267176, 1, 0.7568628, 0, 1,
-1.175594, 1.129787, -0.4710136, 1, 0.7607843, 0, 1,
-1.173709, 0.4208345, 0.8686718, 1, 0.7686275, 0, 1,
-1.172893, -0.09761415, -2.348382, 1, 0.772549, 0, 1,
-1.169142, -0.3784393, -2.042216, 1, 0.7803922, 0, 1,
-1.159513, 1.994071, -1.282137, 1, 0.7843137, 0, 1,
-1.159015, 0.9646677, -1.317729, 1, 0.7921569, 0, 1,
-1.157924, -2.172006, -2.323621, 1, 0.7960784, 0, 1,
-1.151528, -1.433318, -2.280735, 1, 0.8039216, 0, 1,
-1.150917, -0.33502, -2.50007, 1, 0.8117647, 0, 1,
-1.143402, -1.839993, -3.183917, 1, 0.8156863, 0, 1,
-1.135919, -0.7658525, -0.2485009, 1, 0.8235294, 0, 1,
-1.134502, -1.603905, -3.022228, 1, 0.827451, 0, 1,
-1.133875, -0.5317572, -2.026661, 1, 0.8352941, 0, 1,
-1.130855, -0.8441346, -0.7336116, 1, 0.8392157, 0, 1,
-1.127026, -0.1328427, -1.267743, 1, 0.8470588, 0, 1,
-1.122649, 0.3959582, -1.815552, 1, 0.8509804, 0, 1,
-1.110035, -1.253416, -2.03816, 1, 0.8588235, 0, 1,
-1.109534, -0.5120886, -1.00092, 1, 0.8627451, 0, 1,
-1.108266, 1.053672, -1.646124, 1, 0.8705882, 0, 1,
-1.106903, 1.324498, 1.208779, 1, 0.8745098, 0, 1,
-1.101103, 1.105445, -1.445491, 1, 0.8823529, 0, 1,
-1.097039, 0.02663728, -1.117695, 1, 0.8862745, 0, 1,
-1.092173, -2.518701, -2.625328, 1, 0.8941177, 0, 1,
-1.091955, -0.9126157, -3.319578, 1, 0.8980392, 0, 1,
-1.091805, -0.7634028, -3.418792, 1, 0.9058824, 0, 1,
-1.083672, 1.345192, -0.02986962, 1, 0.9137255, 0, 1,
-1.083395, 2.489697, 0.01763527, 1, 0.9176471, 0, 1,
-1.072929, 1.107004, -0.6088463, 1, 0.9254902, 0, 1,
-1.067432, 0.2254288, -1.373922, 1, 0.9294118, 0, 1,
-1.061375, 0.3390768, -1.939161, 1, 0.9372549, 0, 1,
-1.055834, 1.545214, -0.8308935, 1, 0.9411765, 0, 1,
-1.05547, -0.4833507, -0.6334784, 1, 0.9490196, 0, 1,
-1.050132, 0.7688645, -1.328676, 1, 0.9529412, 0, 1,
-1.048664, -0.4117595, -1.044344, 1, 0.9607843, 0, 1,
-1.045601, -0.2017501, 1.087086, 1, 0.9647059, 0, 1,
-1.042672, 0.2429095, 0.1741607, 1, 0.972549, 0, 1,
-1.041749, 1.243914, -0.6813424, 1, 0.9764706, 0, 1,
-1.033875, -0.9106224, -3.10492, 1, 0.9843137, 0, 1,
-1.032347, 2.267311, -0.968298, 1, 0.9882353, 0, 1,
-1.027343, 0.01213784, -2.978828, 1, 0.9960784, 0, 1,
-1.023941, 2.147886, -2.286536, 0.9960784, 1, 0, 1,
-1.017989, 0.2568023, -0.8616479, 0.9921569, 1, 0, 1,
-1.017619, 0.1559594, -3.130898, 0.9843137, 1, 0, 1,
-1.005819, -2.083385, -1.44966, 0.9803922, 1, 0, 1,
-0.992539, -0.5381261, -1.644146, 0.972549, 1, 0, 1,
-0.9807098, 0.1831262, 0.3487822, 0.9686275, 1, 0, 1,
-0.9786915, -0.1788273, -2.600293, 0.9607843, 1, 0, 1,
-0.9746805, -0.6460986, -2.227246, 0.9568627, 1, 0, 1,
-0.9736266, 0.3620791, -2.241055, 0.9490196, 1, 0, 1,
-0.9664521, 0.6114911, -0.4008676, 0.945098, 1, 0, 1,
-0.9535764, 1.814949, -1.024176, 0.9372549, 1, 0, 1,
-0.9532052, 0.5463001, -0.7679007, 0.9333333, 1, 0, 1,
-0.9424449, -0.8592578, -1.85758, 0.9254902, 1, 0, 1,
-0.9237621, -1.415107, -3.129129, 0.9215686, 1, 0, 1,
-0.917662, 2.186191, -0.4861566, 0.9137255, 1, 0, 1,
-0.9170005, -1.558609, -1.435971, 0.9098039, 1, 0, 1,
-0.916276, -0.3120919, -2.037098, 0.9019608, 1, 0, 1,
-0.9145502, -1.272356, -2.019552, 0.8941177, 1, 0, 1,
-0.9124473, 0.3962747, -0.6018591, 0.8901961, 1, 0, 1,
-0.9048685, 0.5687916, -1.00567, 0.8823529, 1, 0, 1,
-0.8969148, -0.8070464, -2.784553, 0.8784314, 1, 0, 1,
-0.8957433, -0.9204741, -2.657528, 0.8705882, 1, 0, 1,
-0.8930236, -0.2513013, -1.954302, 0.8666667, 1, 0, 1,
-0.8909416, -0.1178424, -2.331018, 0.8588235, 1, 0, 1,
-0.8869892, 0.004177351, -1.386038, 0.854902, 1, 0, 1,
-0.8751365, 1.474999, -0.5853379, 0.8470588, 1, 0, 1,
-0.8728849, -0.1207876, -2.511527, 0.8431373, 1, 0, 1,
-0.8661515, 1.580084, -2.011025, 0.8352941, 1, 0, 1,
-0.8644825, -0.5916219, -2.49118, 0.8313726, 1, 0, 1,
-0.8604286, 2.559131, -0.8918949, 0.8235294, 1, 0, 1,
-0.8589531, -1.910789, -2.854355, 0.8196079, 1, 0, 1,
-0.8584695, -0.1179451, -2.025284, 0.8117647, 1, 0, 1,
-0.8501867, -1.292374, -2.908948, 0.8078431, 1, 0, 1,
-0.8457197, 0.2632251, -1.12093, 0.8, 1, 0, 1,
-0.834051, -0.7424836, -0.3278918, 0.7921569, 1, 0, 1,
-0.8329517, 1.298638, -0.7602082, 0.7882353, 1, 0, 1,
-0.8329156, -1.695648, -1.763652, 0.7803922, 1, 0, 1,
-0.8139342, 0.03249137, -1.850518, 0.7764706, 1, 0, 1,
-0.806459, 0.702556, -1.409294, 0.7686275, 1, 0, 1,
-0.8017319, -1.554956, -4.135777, 0.7647059, 1, 0, 1,
-0.8011122, 0.9123545, 1.003764, 0.7568628, 1, 0, 1,
-0.7954205, 1.192799, 1.307873, 0.7529412, 1, 0, 1,
-0.7937535, -0.9540334, -3.659412, 0.7450981, 1, 0, 1,
-0.7892663, 0.6214026, -0.1660371, 0.7411765, 1, 0, 1,
-0.7874405, 0.03452303, -0.4537941, 0.7333333, 1, 0, 1,
-0.7869465, -0.4248784, -3.625926, 0.7294118, 1, 0, 1,
-0.7830057, -0.01087642, -2.88011, 0.7215686, 1, 0, 1,
-0.7827826, 0.5371927, -0.8639156, 0.7176471, 1, 0, 1,
-0.7803793, -0.7543394, -3.460918, 0.7098039, 1, 0, 1,
-0.7779507, -1.418743, -2.14025, 0.7058824, 1, 0, 1,
-0.7658575, 2.564651, -0.4578241, 0.6980392, 1, 0, 1,
-0.7651817, -0.3465151, -1.748521, 0.6901961, 1, 0, 1,
-0.7640255, -0.2329057, -2.339827, 0.6862745, 1, 0, 1,
-0.7496151, -1.3997, -1.22178, 0.6784314, 1, 0, 1,
-0.7490839, 1.012055, -2.797911, 0.6745098, 1, 0, 1,
-0.7455789, -0.3991756, -2.596884, 0.6666667, 1, 0, 1,
-0.7452608, -2.143185, -4.310381, 0.6627451, 1, 0, 1,
-0.7438287, -0.6068562, -2.110734, 0.654902, 1, 0, 1,
-0.7430996, 0.5133863, -1.61823, 0.6509804, 1, 0, 1,
-0.7421836, -1.541722, -2.262135, 0.6431373, 1, 0, 1,
-0.7351572, 0.2292986, -0.5737234, 0.6392157, 1, 0, 1,
-0.7339826, -0.3592684, -1.804658, 0.6313726, 1, 0, 1,
-0.7338042, -0.6472717, -4.04937, 0.627451, 1, 0, 1,
-0.7257093, -1.109402, -1.299511, 0.6196079, 1, 0, 1,
-0.7237273, 0.5178411, -0.5582923, 0.6156863, 1, 0, 1,
-0.7189836, -1.753069, -2.934049, 0.6078432, 1, 0, 1,
-0.7177935, -0.5732725, -2.604313, 0.6039216, 1, 0, 1,
-0.7169949, 0.3269102, -1.029332, 0.5960785, 1, 0, 1,
-0.7103255, 0.2207213, -2.183279, 0.5882353, 1, 0, 1,
-0.705895, 0.3915282, -3.861315, 0.5843138, 1, 0, 1,
-0.7034085, -0.7759333, -3.003227, 0.5764706, 1, 0, 1,
-0.6936246, -1.811729, -2.573111, 0.572549, 1, 0, 1,
-0.6864314, 0.09339307, -0.858713, 0.5647059, 1, 0, 1,
-0.6851703, 0.6174276, -0.1894179, 0.5607843, 1, 0, 1,
-0.6844622, -0.8788858, -2.985393, 0.5529412, 1, 0, 1,
-0.6781088, -0.2512589, -2.348002, 0.5490196, 1, 0, 1,
-0.6673157, -1.054222, -3.313433, 0.5411765, 1, 0, 1,
-0.6673089, 1.108557, 0.2358988, 0.5372549, 1, 0, 1,
-0.661476, -0.1588172, -3.694054, 0.5294118, 1, 0, 1,
-0.6601372, 1.198978, -0.2699159, 0.5254902, 1, 0, 1,
-0.6594016, 2.025439, -0.991682, 0.5176471, 1, 0, 1,
-0.6564291, -0.8094815, -2.475584, 0.5137255, 1, 0, 1,
-0.6535681, -0.4019946, -1.796676, 0.5058824, 1, 0, 1,
-0.6488605, 0.1563072, -0.999799, 0.5019608, 1, 0, 1,
-0.6462502, 1.781528, -0.7424219, 0.4941176, 1, 0, 1,
-0.6390918, -0.02714333, -1.641915, 0.4862745, 1, 0, 1,
-0.637003, -2.746944, -4.10238, 0.4823529, 1, 0, 1,
-0.6361684, 0.1450883, -1.362943, 0.4745098, 1, 0, 1,
-0.633374, -0.3216844, -2.599094, 0.4705882, 1, 0, 1,
-0.6327376, 0.3656298, -0.3326994, 0.4627451, 1, 0, 1,
-0.6321953, 0.2437096, -3.084969, 0.4588235, 1, 0, 1,
-0.6312866, -0.8157831, -2.788843, 0.4509804, 1, 0, 1,
-0.630769, 0.421953, -1.831915, 0.4470588, 1, 0, 1,
-0.6290213, 0.114338, -1.724462, 0.4392157, 1, 0, 1,
-0.6284481, 0.1395893, 0.4652328, 0.4352941, 1, 0, 1,
-0.6258229, -1.537969, -2.946666, 0.427451, 1, 0, 1,
-0.6209496, 0.2314364, -1.957931, 0.4235294, 1, 0, 1,
-0.620061, 0.0422744, -0.7431543, 0.4156863, 1, 0, 1,
-0.617552, -1.015232, -1.566238, 0.4117647, 1, 0, 1,
-0.6125963, -1.409181, -3.836726, 0.4039216, 1, 0, 1,
-0.6120417, -0.8873394, -2.977443, 0.3960784, 1, 0, 1,
-0.6079906, -1.784466, -2.826927, 0.3921569, 1, 0, 1,
-0.60773, 1.773045, 0.5886256, 0.3843137, 1, 0, 1,
-0.6057269, 0.06516381, -2.494513, 0.3803922, 1, 0, 1,
-0.6046826, -0.9206339, -3.392449, 0.372549, 1, 0, 1,
-0.6037734, -0.6594902, -1.846008, 0.3686275, 1, 0, 1,
-0.5993753, -1.720139, -3.644585, 0.3607843, 1, 0, 1,
-0.5993009, 0.202069, -2.337869, 0.3568628, 1, 0, 1,
-0.5939815, 0.3711047, -2.399219, 0.3490196, 1, 0, 1,
-0.5854129, 0.8176367, -0.1582362, 0.345098, 1, 0, 1,
-0.5851244, -1.794421, -3.584765, 0.3372549, 1, 0, 1,
-0.5849351, 1.626263, -0.1959421, 0.3333333, 1, 0, 1,
-0.5841509, -1.135701, -3.789087, 0.3254902, 1, 0, 1,
-0.5821707, 0.8092818, -2.436003, 0.3215686, 1, 0, 1,
-0.5815291, -0.713025, -2.529802, 0.3137255, 1, 0, 1,
-0.5761528, -0.3643891, -2.694959, 0.3098039, 1, 0, 1,
-0.5740003, -0.5626122, -2.016468, 0.3019608, 1, 0, 1,
-0.5719654, -0.4876667, -1.569751, 0.2941177, 1, 0, 1,
-0.5692416, -1.700886, -3.29997, 0.2901961, 1, 0, 1,
-0.567312, -0.6384608, -3.732074, 0.282353, 1, 0, 1,
-0.5579217, -0.8343556, -2.951994, 0.2784314, 1, 0, 1,
-0.5551815, -0.969355, -1.800579, 0.2705882, 1, 0, 1,
-0.5493916, 0.3169415, -2.381665, 0.2666667, 1, 0, 1,
-0.5463688, -1.131677, -2.947142, 0.2588235, 1, 0, 1,
-0.5456629, -0.004399847, 2.203424, 0.254902, 1, 0, 1,
-0.5394275, 1.146347, -0.1782676, 0.2470588, 1, 0, 1,
-0.537017, -1.654332, -3.42033, 0.2431373, 1, 0, 1,
-0.532492, 2.291968, 0.3184981, 0.2352941, 1, 0, 1,
-0.5290923, -0.8520299, -1.536295, 0.2313726, 1, 0, 1,
-0.5287168, 1.060238, -0.6681526, 0.2235294, 1, 0, 1,
-0.5255893, -0.05505346, -0.6318152, 0.2196078, 1, 0, 1,
-0.5250089, 0.6223852, -0.4605142, 0.2117647, 1, 0, 1,
-0.5187978, 0.9005704, -1.036151, 0.2078431, 1, 0, 1,
-0.5181967, 0.5301634, -1.386563, 0.2, 1, 0, 1,
-0.5132321, 0.6950676, -0.6576734, 0.1921569, 1, 0, 1,
-0.5118204, -0.320798, -1.562189, 0.1882353, 1, 0, 1,
-0.5105665, 0.8495724, -0.8481179, 0.1803922, 1, 0, 1,
-0.5087772, -0.2073741, -0.3266911, 0.1764706, 1, 0, 1,
-0.4988023, -0.447455, -1.596259, 0.1686275, 1, 0, 1,
-0.4982672, 0.5623695, -0.528905, 0.1647059, 1, 0, 1,
-0.4915884, -0.9266702, -3.504245, 0.1568628, 1, 0, 1,
-0.4896365, 1.041194, -0.3191637, 0.1529412, 1, 0, 1,
-0.4808724, -1.237128, -3.868645, 0.145098, 1, 0, 1,
-0.4776077, -0.03764084, -1.970422, 0.1411765, 1, 0, 1,
-0.4775144, 0.8867962, 0.8276923, 0.1333333, 1, 0, 1,
-0.4763849, 0.4665856, -2.743735, 0.1294118, 1, 0, 1,
-0.4706622, 0.7286442, -0.006725742, 0.1215686, 1, 0, 1,
-0.4627829, 0.1772939, -1.930421, 0.1176471, 1, 0, 1,
-0.4597521, 0.3244418, 1.045279, 0.1098039, 1, 0, 1,
-0.4574553, -1.108461, -3.122336, 0.1058824, 1, 0, 1,
-0.4508377, -0.07170136, -1.83724, 0.09803922, 1, 0, 1,
-0.4466472, -1.254608, -1.724963, 0.09019608, 1, 0, 1,
-0.4442722, -0.8762625, -3.160639, 0.08627451, 1, 0, 1,
-0.4431642, -0.6165186, -2.428586, 0.07843138, 1, 0, 1,
-0.44153, -0.4135925, -3.409636, 0.07450981, 1, 0, 1,
-0.4387186, 2.020444, -1.034491, 0.06666667, 1, 0, 1,
-0.4384997, 1.014788, 0.3575411, 0.0627451, 1, 0, 1,
-0.4374658, -1.452696, -3.066646, 0.05490196, 1, 0, 1,
-0.4359576, 1.348102, -0.591115, 0.05098039, 1, 0, 1,
-0.4343144, -0.5347021, -2.957017, 0.04313726, 1, 0, 1,
-0.4317397, 0.2682587, -1.583349, 0.03921569, 1, 0, 1,
-0.4300511, -0.05501532, -2.166784, 0.03137255, 1, 0, 1,
-0.4290767, -1.455134, -3.091457, 0.02745098, 1, 0, 1,
-0.4278995, -0.02306874, -2.665718, 0.01960784, 1, 0, 1,
-0.4179667, 0.5804151, -0.4036837, 0.01568628, 1, 0, 1,
-0.4126575, 2.331031, -1.554091, 0.007843138, 1, 0, 1,
-0.4114234, 1.56398, -1.134198, 0.003921569, 1, 0, 1,
-0.4075909, 0.7815782, -0.4941273, 0, 1, 0.003921569, 1,
-0.4061791, 2.259923, -0.5378952, 0, 1, 0.01176471, 1,
-0.3943214, 1.321185, 0.1070489, 0, 1, 0.01568628, 1,
-0.3930796, -0.6094628, -2.382651, 0, 1, 0.02352941, 1,
-0.3917502, -2.227821, -1.837495, 0, 1, 0.02745098, 1,
-0.3912714, 0.07117078, -1.364404, 0, 1, 0.03529412, 1,
-0.3909965, 0.3699046, 0.03335809, 0, 1, 0.03921569, 1,
-0.3909212, -0.4311593, -1.561053, 0, 1, 0.04705882, 1,
-0.3890799, -1.363497, -4.2996, 0, 1, 0.05098039, 1,
-0.3835499, 0.6214042, -0.2410773, 0, 1, 0.05882353, 1,
-0.3782913, -0.5203044, -3.863606, 0, 1, 0.0627451, 1,
-0.3762012, 0.1822929, -1.110403, 0, 1, 0.07058824, 1,
-0.3759229, 1.163528, -0.8623456, 0, 1, 0.07450981, 1,
-0.3743094, 1.164059, -1.125719, 0, 1, 0.08235294, 1,
-0.3625103, -0.2058478, -2.030787, 0, 1, 0.08627451, 1,
-0.3602629, -0.4026549, -0.9601567, 0, 1, 0.09411765, 1,
-0.3588709, -0.7410663, -3.94144, 0, 1, 0.1019608, 1,
-0.3575915, 1.788248, 0.2013141, 0, 1, 0.1058824, 1,
-0.3570689, -1.901096, -3.605495, 0, 1, 0.1137255, 1,
-0.3558691, -0.9103208, -3.538524, 0, 1, 0.1176471, 1,
-0.3527108, -2.094308, -2.487833, 0, 1, 0.1254902, 1,
-0.3483689, 0.5044554, -2.414234, 0, 1, 0.1294118, 1,
-0.3453104, 1.452008, -0.6394123, 0, 1, 0.1372549, 1,
-0.3389118, 0.4877121, -0.6566969, 0, 1, 0.1411765, 1,
-0.3313872, 1.402961, 1.185813, 0, 1, 0.1490196, 1,
-0.3206058, -1.610456, -2.942025, 0, 1, 0.1529412, 1,
-0.3190587, 1.626443, -1.450691, 0, 1, 0.1607843, 1,
-0.3131721, 1.096847, -1.298221, 0, 1, 0.1647059, 1,
-0.310098, -0.4422117, -3.446523, 0, 1, 0.172549, 1,
-0.3059157, 0.8013958, -0.5516264, 0, 1, 0.1764706, 1,
-0.3050588, -0.8292735, -3.659554, 0, 1, 0.1843137, 1,
-0.3019377, -0.5078335, -1.756988, 0, 1, 0.1882353, 1,
-0.3010404, 1.811618, -2.20393, 0, 1, 0.1960784, 1,
-0.2960495, 0.03284568, -1.937987, 0, 1, 0.2039216, 1,
-0.2947669, 0.927702, -1.568584, 0, 1, 0.2078431, 1,
-0.2939917, -1.425089, -4.017358, 0, 1, 0.2156863, 1,
-0.2925041, 1.023737, -0.05150417, 0, 1, 0.2196078, 1,
-0.2921093, -1.174517, -2.772599, 0, 1, 0.227451, 1,
-0.2892652, -2.151509, -3.171539, 0, 1, 0.2313726, 1,
-0.2887328, -0.2015916, -2.216276, 0, 1, 0.2392157, 1,
-0.2861337, -1.08016, -3.407868, 0, 1, 0.2431373, 1,
-0.2843451, -1.776628, -1.866523, 0, 1, 0.2509804, 1,
-0.281021, 1.284289, 1.776789, 0, 1, 0.254902, 1,
-0.2739084, 0.3673959, -0.6313326, 0, 1, 0.2627451, 1,
-0.2683253, -1.461283, -2.388148, 0, 1, 0.2666667, 1,
-0.2660254, 1.240074, 0.07526331, 0, 1, 0.2745098, 1,
-0.2612489, 0.4181507, 0.8751214, 0, 1, 0.2784314, 1,
-0.2525268, 0.6940238, -1.413705, 0, 1, 0.2862745, 1,
-0.2496739, 1.162124, -0.6460299, 0, 1, 0.2901961, 1,
-0.2468262, 0.2638031, -1.183496, 0, 1, 0.2980392, 1,
-0.2420748, -0.5852915, -3.613792, 0, 1, 0.3058824, 1,
-0.2385909, 0.1474846, -0.9544268, 0, 1, 0.3098039, 1,
-0.2369548, 0.6919687, 0.6605574, 0, 1, 0.3176471, 1,
-0.2346966, -0.1918177, -2.581131, 0, 1, 0.3215686, 1,
-0.2328735, 0.4920759, -1.9738, 0, 1, 0.3294118, 1,
-0.2311456, -0.423419, -3.74737, 0, 1, 0.3333333, 1,
-0.2281381, -0.6532711, -1.585488, 0, 1, 0.3411765, 1,
-0.2276465, -0.5504518, -2.17301, 0, 1, 0.345098, 1,
-0.223621, 0.8552355, 0.1809811, 0, 1, 0.3529412, 1,
-0.2235476, -0.5480623, -2.647203, 0, 1, 0.3568628, 1,
-0.2180101, -1.853396, -1.711696, 0, 1, 0.3647059, 1,
-0.2169489, 0.7512363, 0.1556505, 0, 1, 0.3686275, 1,
-0.2158255, 0.1482881, -0.6556883, 0, 1, 0.3764706, 1,
-0.213198, 0.180994, -0.05436655, 0, 1, 0.3803922, 1,
-0.2090916, -1.05552, -3.801248, 0, 1, 0.3882353, 1,
-0.2067874, 0.7074754, 0.1532329, 0, 1, 0.3921569, 1,
-0.2019944, -1.981947, -3.427604, 0, 1, 0.4, 1,
-0.1986601, -1.465359, -3.461828, 0, 1, 0.4078431, 1,
-0.1980367, 1.358204, -1.68955, 0, 1, 0.4117647, 1,
-0.1964567, -0.07313676, -1.249174, 0, 1, 0.4196078, 1,
-0.1881058, 1.69946, -1.434753, 0, 1, 0.4235294, 1,
-0.1873133, 0.1471829, -1.812543, 0, 1, 0.4313726, 1,
-0.1831884, 1.277479, -1.017171, 0, 1, 0.4352941, 1,
-0.1802589, -0.6057444, -2.868379, 0, 1, 0.4431373, 1,
-0.1780491, -0.01028563, -0.6226788, 0, 1, 0.4470588, 1,
-0.1744953, -0.6031594, -0.8603959, 0, 1, 0.454902, 1,
-0.1739537, 1.656045, -0.2211182, 0, 1, 0.4588235, 1,
-0.1727427, 1.521839, -1.426169, 0, 1, 0.4666667, 1,
-0.1691521, 0.01734629, -1.221953, 0, 1, 0.4705882, 1,
-0.1680224, 0.7455939, -2.234166, 0, 1, 0.4784314, 1,
-0.163018, 0.3899905, 0.08651798, 0, 1, 0.4823529, 1,
-0.1595112, -0.07054558, -1.632872, 0, 1, 0.4901961, 1,
-0.1577174, 0.2005278, -2.212354, 0, 1, 0.4941176, 1,
-0.1552068, 2.308954, -0.3030158, 0, 1, 0.5019608, 1,
-0.1545176, 0.3845267, -0.7642415, 0, 1, 0.509804, 1,
-0.1543202, -2.77361, -1.625388, 0, 1, 0.5137255, 1,
-0.15226, 0.788357, 1.247574, 0, 1, 0.5215687, 1,
-0.1520209, 0.2672702, -0.02244875, 0, 1, 0.5254902, 1,
-0.1514833, -0.7975481, -3.952639, 0, 1, 0.5333334, 1,
-0.1491746, 0.6155171, 0.02234118, 0, 1, 0.5372549, 1,
-0.1457165, -0.5749559, -2.954885, 0, 1, 0.5450981, 1,
-0.1415663, -0.01551984, -1.416085, 0, 1, 0.5490196, 1,
-0.1408663, -0.07166862, -1.487568, 0, 1, 0.5568628, 1,
-0.1398435, -3.106911, -3.406281, 0, 1, 0.5607843, 1,
-0.1391044, 1.394522, 0.8083694, 0, 1, 0.5686275, 1,
-0.1365697, 1.723107, -0.63776, 0, 1, 0.572549, 1,
-0.1344825, 0.2290413, -1.848414, 0, 1, 0.5803922, 1,
-0.1292652, 0.1654485, -0.5372089, 0, 1, 0.5843138, 1,
-0.124852, -0.878046, -3.101887, 0, 1, 0.5921569, 1,
-0.1239116, 2.165584, 0.9185497, 0, 1, 0.5960785, 1,
-0.1191899, -0.2352909, -4.984542, 0, 1, 0.6039216, 1,
-0.1179279, -1.237982, -5.19765, 0, 1, 0.6117647, 1,
-0.117415, -0.4391722, -2.929916, 0, 1, 0.6156863, 1,
-0.1160415, 0.8164147, 0.1282285, 0, 1, 0.6235294, 1,
-0.1132934, 0.9573412, -0.3358618, 0, 1, 0.627451, 1,
-0.112174, -0.1093432, -2.94999, 0, 1, 0.6352941, 1,
-0.1109331, -1.627714, -4.132663, 0, 1, 0.6392157, 1,
-0.1080299, -1.42805, -1.983723, 0, 1, 0.6470588, 1,
-0.1063291, 0.9375212, 0.1567893, 0, 1, 0.6509804, 1,
-0.106294, -1.897553, -2.343252, 0, 1, 0.6588235, 1,
-0.1062314, 1.3342, 0.06308851, 0, 1, 0.6627451, 1,
-0.1011886, 1.608945, -1.236459, 0, 1, 0.6705883, 1,
-0.1005186, 1.27367, -1.602131, 0, 1, 0.6745098, 1,
-0.09997663, -1.233121, -2.359462, 0, 1, 0.682353, 1,
-0.09736558, -0.272511, -3.37412, 0, 1, 0.6862745, 1,
-0.09598847, -0.8055198, -2.969307, 0, 1, 0.6941177, 1,
-0.08930424, -0.5917736, -2.969974, 0, 1, 0.7019608, 1,
-0.08214788, -1.325455, -3.329656, 0, 1, 0.7058824, 1,
-0.07371501, -1.218599, -3.414614, 0, 1, 0.7137255, 1,
-0.07314418, 1.511387, -0.04705744, 0, 1, 0.7176471, 1,
-0.06591565, 0.7638984, 1.952642, 0, 1, 0.7254902, 1,
-0.0641221, 1.700188, 0.2829742, 0, 1, 0.7294118, 1,
-0.0639064, -0.8190942, -4.356831, 0, 1, 0.7372549, 1,
-0.06144511, -0.2317324, -2.958603, 0, 1, 0.7411765, 1,
-0.0601552, 0.2987293, 0.2507642, 0, 1, 0.7490196, 1,
-0.05670139, 0.8500506, -0.7934784, 0, 1, 0.7529412, 1,
-0.05104046, -1.852955, -5.27246, 0, 1, 0.7607843, 1,
-0.04770305, 1.502925, 0.3916759, 0, 1, 0.7647059, 1,
-0.04347934, 1.469024, -1.129888, 0, 1, 0.772549, 1,
-0.04237564, 0.02018227, -0.8090587, 0, 1, 0.7764706, 1,
-0.0403499, 0.4240642, 0.2158339, 0, 1, 0.7843137, 1,
-0.04003916, 0.1201247, 0.2449919, 0, 1, 0.7882353, 1,
-0.03860865, 0.7870809, 1.364075, 0, 1, 0.7960784, 1,
-0.03741217, -1.954715, -3.291166, 0, 1, 0.8039216, 1,
-0.03724469, -2.174862, -3.493015, 0, 1, 0.8078431, 1,
-0.03563508, -1.915366, -4.13551, 0, 1, 0.8156863, 1,
-0.03249943, 1.626103, -1.690697, 0, 1, 0.8196079, 1,
-0.02957086, -0.4282866, -3.61052, 0, 1, 0.827451, 1,
-0.02899072, -0.597317, -3.233086, 0, 1, 0.8313726, 1,
-0.02731077, -0.2719954, -3.070387, 0, 1, 0.8392157, 1,
-0.02598622, 0.3905346, 0.5319468, 0, 1, 0.8431373, 1,
-0.02167142, -0.6944984, -1.616611, 0, 1, 0.8509804, 1,
-0.01831052, -0.2401038, -2.986922, 0, 1, 0.854902, 1,
-0.01821917, -0.8535136, -4.45755, 0, 1, 0.8627451, 1,
-0.01669621, -0.8918953, -2.208887, 0, 1, 0.8666667, 1,
-0.01288578, -0.4842551, -4.079703, 0, 1, 0.8745098, 1,
-0.01105592, -1.307145, -1.860175, 0, 1, 0.8784314, 1,
-0.009011884, -0.3103864, -3.407362, 0, 1, 0.8862745, 1,
-0.002190858, 0.4276135, 0.4314742, 0, 1, 0.8901961, 1,
0.003029576, -0.0839202, 5.387411, 0, 1, 0.8980392, 1,
0.005889768, -0.1295662, 4.833133, 0, 1, 0.9058824, 1,
0.007128182, 0.08765119, 0.1532598, 0, 1, 0.9098039, 1,
0.007940857, -0.2991985, 1.57203, 0, 1, 0.9176471, 1,
0.008510915, 0.008417766, -0.08321219, 0, 1, 0.9215686, 1,
0.01019957, 1.277895, -1.991105, 0, 1, 0.9294118, 1,
0.01220225, 0.9636972, 0.6476541, 0, 1, 0.9333333, 1,
0.01705912, -0.7809526, 2.531099, 0, 1, 0.9411765, 1,
0.02040816, -0.7758444, 3.03869, 0, 1, 0.945098, 1,
0.02214321, -1.428701, 3.120495, 0, 1, 0.9529412, 1,
0.0224483, -0.4719541, 2.423676, 0, 1, 0.9568627, 1,
0.02692567, -0.1430513, 4.168951, 0, 1, 0.9647059, 1,
0.02715257, 2.259951, 0.214341, 0, 1, 0.9686275, 1,
0.0283102, 0.3573501, -0.6951674, 0, 1, 0.9764706, 1,
0.02857253, -0.3926559, 3.743083, 0, 1, 0.9803922, 1,
0.02941977, -0.1143079, 1.777727, 0, 1, 0.9882353, 1,
0.03157641, -1.014862, 3.569775, 0, 1, 0.9921569, 1,
0.04219509, -0.5343133, 3.451616, 0, 1, 1, 1,
0.04304555, 0.4623162, -0.6905414, 0, 0.9921569, 1, 1,
0.04683939, 1.253587, 0.3623413, 0, 0.9882353, 1, 1,
0.04955363, -0.4788569, 4.382028, 0, 0.9803922, 1, 1,
0.05198067, -1.126282, 3.993449, 0, 0.9764706, 1, 1,
0.05543996, 0.2843644, 1.512485, 0, 0.9686275, 1, 1,
0.0641503, 0.08670032, 2.670107, 0, 0.9647059, 1, 1,
0.06524063, -0.9707271, 3.347583, 0, 0.9568627, 1, 1,
0.06705455, -0.5016888, 2.405078, 0, 0.9529412, 1, 1,
0.07585426, 1.486434, 0.9531292, 0, 0.945098, 1, 1,
0.07856265, -1.76872, 3.195722, 0, 0.9411765, 1, 1,
0.07977296, 0.5949432, -0.02791012, 0, 0.9333333, 1, 1,
0.08080484, 0.7221857, 1.112273, 0, 0.9294118, 1, 1,
0.08117661, 1.824366, 1.316915, 0, 0.9215686, 1, 1,
0.08170036, -1.18395, 1.377204, 0, 0.9176471, 1, 1,
0.08392803, 1.13613, 0.2392881, 0, 0.9098039, 1, 1,
0.09224118, -0.7763211, 2.53864, 0, 0.9058824, 1, 1,
0.09362663, -1.715061, 2.222311, 0, 0.8980392, 1, 1,
0.09528002, 0.6102893, 0.2272234, 0, 0.8901961, 1, 1,
0.09980363, 0.7812507, 1.407003, 0, 0.8862745, 1, 1,
0.09990906, 1.148889, 2.091877, 0, 0.8784314, 1, 1,
0.1001859, 0.2175589, -1.435541, 0, 0.8745098, 1, 1,
0.1014032, 0.2570578, -0.7349191, 0, 0.8666667, 1, 1,
0.1060881, 0.4368163, 2.04194, 0, 0.8627451, 1, 1,
0.1080644, -2.153059, 2.497602, 0, 0.854902, 1, 1,
0.1094843, -1.264953, 5.104526, 0, 0.8509804, 1, 1,
0.1104063, 1.121035, -0.4559369, 0, 0.8431373, 1, 1,
0.1110385, 0.8777547, -0.2336218, 0, 0.8392157, 1, 1,
0.1132228, -0.5030774, 2.928044, 0, 0.8313726, 1, 1,
0.1148787, 0.1474673, 0.8235663, 0, 0.827451, 1, 1,
0.1153596, -0.2608149, 3.456032, 0, 0.8196079, 1, 1,
0.1207614, 0.0554039, 1.969496, 0, 0.8156863, 1, 1,
0.1209274, 0.305036, 2.078455, 0, 0.8078431, 1, 1,
0.1240486, -1.684914, 2.446995, 0, 0.8039216, 1, 1,
0.1286603, -0.7362142, 3.547683, 0, 0.7960784, 1, 1,
0.1318755, -1.080092, 0.5669177, 0, 0.7882353, 1, 1,
0.1363949, -0.1354173, 2.61545, 0, 0.7843137, 1, 1,
0.1366542, -1.968273, 5.148471, 0, 0.7764706, 1, 1,
0.1414253, -2.031469, 2.606716, 0, 0.772549, 1, 1,
0.1476537, -0.3962964, 3.129431, 0, 0.7647059, 1, 1,
0.1486745, -0.09610536, 1.955344, 0, 0.7607843, 1, 1,
0.1490328, -1.413828, 1.90222, 0, 0.7529412, 1, 1,
0.1513951, -0.7410881, 2.04599, 0, 0.7490196, 1, 1,
0.1520787, 0.7822354, -0.2043294, 0, 0.7411765, 1, 1,
0.1563512, 1.196325, 0.3558188, 0, 0.7372549, 1, 1,
0.1577554, -1.362631, 0.5313853, 0, 0.7294118, 1, 1,
0.1599639, 0.2913339, -0.1242283, 0, 0.7254902, 1, 1,
0.1600489, -0.7804483, 2.440795, 0, 0.7176471, 1, 1,
0.1605731, -0.4960824, 0.5034139, 0, 0.7137255, 1, 1,
0.1612117, -0.190524, 2.504539, 0, 0.7058824, 1, 1,
0.1630986, 0.7269411, -2.346985, 0, 0.6980392, 1, 1,
0.1656094, -0.259536, 3.504213, 0, 0.6941177, 1, 1,
0.1659703, 1.288617, 0.8765649, 0, 0.6862745, 1, 1,
0.1696957, -0.9132102, 2.391739, 0, 0.682353, 1, 1,
0.1700493, 1.350324, -0.6323046, 0, 0.6745098, 1, 1,
0.1704236, 0.843186, 0.9301878, 0, 0.6705883, 1, 1,
0.1723104, -0.908839, 2.150695, 0, 0.6627451, 1, 1,
0.1741104, -1.767034, 3.423401, 0, 0.6588235, 1, 1,
0.1744291, 0.4423699, 1.828668, 0, 0.6509804, 1, 1,
0.1796317, 1.640629, 0.3156468, 0, 0.6470588, 1, 1,
0.1798451, -0.4288167, 2.426168, 0, 0.6392157, 1, 1,
0.183541, -0.9877621, 2.633555, 0, 0.6352941, 1, 1,
0.1838363, -1.351902, 4.011652, 0, 0.627451, 1, 1,
0.1857419, 0.5268466, 0.1315268, 0, 0.6235294, 1, 1,
0.1879625, -0.2082444, 3.228346, 0, 0.6156863, 1, 1,
0.1901701, 0.4933905, 0.4671459, 0, 0.6117647, 1, 1,
0.1910739, 1.567785, -0.7248942, 0, 0.6039216, 1, 1,
0.1954843, -0.0914198, 2.393573, 0, 0.5960785, 1, 1,
0.2005474, 0.01363138, 2.383851, 0, 0.5921569, 1, 1,
0.2030439, -1.404545, 1.9549, 0, 0.5843138, 1, 1,
0.2089233, 1.090188, -0.4918833, 0, 0.5803922, 1, 1,
0.2116246, 1.697713, -0.5754687, 0, 0.572549, 1, 1,
0.2120188, -1.192796, 3.942528, 0, 0.5686275, 1, 1,
0.2126088, 0.09717094, 0.9447935, 0, 0.5607843, 1, 1,
0.2139395, 1.595456, -1.529294, 0, 0.5568628, 1, 1,
0.2199705, -1.363115, 2.20136, 0, 0.5490196, 1, 1,
0.2202401, 0.590379, 0.9163998, 0, 0.5450981, 1, 1,
0.2208678, -1.363249, 2.468236, 0, 0.5372549, 1, 1,
0.2216908, 1.267524, 0.8448098, 0, 0.5333334, 1, 1,
0.2240673, 0.5301934, 1.26602, 0, 0.5254902, 1, 1,
0.2252883, 0.9885228, 0.1886793, 0, 0.5215687, 1, 1,
0.2277611, -0.1737046, 1.980178, 0, 0.5137255, 1, 1,
0.231571, -1.208341, 3.119791, 0, 0.509804, 1, 1,
0.2345142, 0.3699342, -0.2718836, 0, 0.5019608, 1, 1,
0.2385272, -0.4467296, 3.70606, 0, 0.4941176, 1, 1,
0.2427734, -0.6458713, 2.49979, 0, 0.4901961, 1, 1,
0.2447499, 0.4986824, 0.03636497, 0, 0.4823529, 1, 1,
0.2465149, 1.060119, 1.000539, 0, 0.4784314, 1, 1,
0.2479368, -1.130328, 2.421119, 0, 0.4705882, 1, 1,
0.2516715, -0.3479006, 1.711583, 0, 0.4666667, 1, 1,
0.2531996, -1.118773, 3.013978, 0, 0.4588235, 1, 1,
0.2562864, 0.323447, 0.4626237, 0, 0.454902, 1, 1,
0.2596381, -0.5062923, 2.458222, 0, 0.4470588, 1, 1,
0.2619641, 1.246507, 0.8173056, 0, 0.4431373, 1, 1,
0.2631786, -0.4398121, 4.242382, 0, 0.4352941, 1, 1,
0.2683068, 0.7086626, 0.7207422, 0, 0.4313726, 1, 1,
0.2712551, 0.3785999, 1.896528, 0, 0.4235294, 1, 1,
0.2754772, -1.387633, 4.746198, 0, 0.4196078, 1, 1,
0.2774827, -1.111461, 3.282182, 0, 0.4117647, 1, 1,
0.2783346, -0.2391707, 2.137624, 0, 0.4078431, 1, 1,
0.279421, 1.595055, 0.7270173, 0, 0.4, 1, 1,
0.2864519, -0.1883289, 3.391927, 0, 0.3921569, 1, 1,
0.2864832, -2.092349, 2.89799, 0, 0.3882353, 1, 1,
0.2905334, -1.518038, 3.308903, 0, 0.3803922, 1, 1,
0.2906362, -1.414673, 3.231237, 0, 0.3764706, 1, 1,
0.2907055, 0.01825304, 0.8811489, 0, 0.3686275, 1, 1,
0.2920574, 1.848176, -0.4862376, 0, 0.3647059, 1, 1,
0.2941142, -0.8263547, 2.35541, 0, 0.3568628, 1, 1,
0.2950036, -0.6297277, 1.999543, 0, 0.3529412, 1, 1,
0.2958773, 0.1611876, 0.11685, 0, 0.345098, 1, 1,
0.2971779, -1.137654, 2.987335, 0, 0.3411765, 1, 1,
0.3010688, -0.7178279, 3.467267, 0, 0.3333333, 1, 1,
0.3034852, -0.3704911, 2.19669, 0, 0.3294118, 1, 1,
0.3064846, -0.1550285, 1.815689, 0, 0.3215686, 1, 1,
0.3084182, 0.7045516, -0.7054247, 0, 0.3176471, 1, 1,
0.3099169, 0.100782, 2.245726, 0, 0.3098039, 1, 1,
0.3185568, 0.1639002, 2.152825, 0, 0.3058824, 1, 1,
0.3219831, -0.4144051, 2.412884, 0, 0.2980392, 1, 1,
0.326446, 1.924979, 0.543345, 0, 0.2901961, 1, 1,
0.3271551, -0.8665571, 4.47778, 0, 0.2862745, 1, 1,
0.3273644, 0.5671973, 2.190398, 0, 0.2784314, 1, 1,
0.3305485, 0.6379647, -0.9368011, 0, 0.2745098, 1, 1,
0.3306973, 0.3380609, -2.027206, 0, 0.2666667, 1, 1,
0.3368592, 1.171645, -0.1776592, 0, 0.2627451, 1, 1,
0.3384323, 0.3494425, 0.2107109, 0, 0.254902, 1, 1,
0.3408611, 0.9431245, 0.01145254, 0, 0.2509804, 1, 1,
0.34321, -1.273429, 2.504508, 0, 0.2431373, 1, 1,
0.3465986, -0.03128919, 2.601564, 0, 0.2392157, 1, 1,
0.3491675, 0.1073973, 1.538775, 0, 0.2313726, 1, 1,
0.3506916, -1.468595, 3.575309, 0, 0.227451, 1, 1,
0.3663404, 0.3798048, 0.06264767, 0, 0.2196078, 1, 1,
0.3669496, -0.7456953, 2.293122, 0, 0.2156863, 1, 1,
0.3676801, -0.7204602, 3.253499, 0, 0.2078431, 1, 1,
0.3692348, -0.7629803, 2.790407, 0, 0.2039216, 1, 1,
0.3694586, 0.8253898, 0.5057569, 0, 0.1960784, 1, 1,
0.3703606, -0.5976508, 3.573107, 0, 0.1882353, 1, 1,
0.3730619, 0.7331364, 1.408556, 0, 0.1843137, 1, 1,
0.3814102, -0.8464926, 3.298475, 0, 0.1764706, 1, 1,
0.3820355, 0.4442255, 0.8426844, 0, 0.172549, 1, 1,
0.3829354, 0.06885901, 0.1961576, 0, 0.1647059, 1, 1,
0.38538, -0.4735905, 2.542913, 0, 0.1607843, 1, 1,
0.3857991, 0.3627386, 0.3307594, 0, 0.1529412, 1, 1,
0.3875297, 0.1799178, 2.60087, 0, 0.1490196, 1, 1,
0.3901016, -0.8760972, 2.321115, 0, 0.1411765, 1, 1,
0.391802, 0.06564438, -0.07484477, 0, 0.1372549, 1, 1,
0.3931989, 0.5221981, 0.9260626, 0, 0.1294118, 1, 1,
0.3947016, -1.804395, 2.684136, 0, 0.1254902, 1, 1,
0.3948768, -0.01726791, 1.344867, 0, 0.1176471, 1, 1,
0.3962165, 0.7241036, 0.07783736, 0, 0.1137255, 1, 1,
0.39861, -0.9075962, 2.446965, 0, 0.1058824, 1, 1,
0.401107, -1.173431, 3.327715, 0, 0.09803922, 1, 1,
0.402965, 0.02587095, 2.194761, 0, 0.09411765, 1, 1,
0.4078987, -0.06520431, -0.635484, 0, 0.08627451, 1, 1,
0.4114251, 1.237587, 1.652614, 0, 0.08235294, 1, 1,
0.4129558, 0.2605468, 1.654095, 0, 0.07450981, 1, 1,
0.4134426, -0.6197071, 2.766629, 0, 0.07058824, 1, 1,
0.4136611, 1.145297, 2.190858, 0, 0.0627451, 1, 1,
0.4159548, -0.572042, 2.550057, 0, 0.05882353, 1, 1,
0.4173504, -0.1288847, 0.490854, 0, 0.05098039, 1, 1,
0.4191913, 0.6516572, 0.9281625, 0, 0.04705882, 1, 1,
0.4282698, 0.9195468, 1.06843, 0, 0.03921569, 1, 1,
0.4310495, -1.195654, 2.842833, 0, 0.03529412, 1, 1,
0.4369569, 0.2778148, -1.26172, 0, 0.02745098, 1, 1,
0.4395563, 1.665089, -0.5553904, 0, 0.02352941, 1, 1,
0.4405327, -0.4602299, 2.873308, 0, 0.01568628, 1, 1,
0.4415819, -0.08472113, 2.26855, 0, 0.01176471, 1, 1,
0.4440641, 0.4376889, 0.1487182, 0, 0.003921569, 1, 1,
0.4486725, -0.4162811, 3.986228, 0.003921569, 0, 1, 1,
0.4495564, -1.073492, 1.72823, 0.007843138, 0, 1, 1,
0.4522982, -0.1841573, 0.7867414, 0.01568628, 0, 1, 1,
0.4544658, 0.01788389, -0.7846843, 0.01960784, 0, 1, 1,
0.4560857, 1.407352, 1.014722, 0.02745098, 0, 1, 1,
0.4632115, 1.139057, 0.4605636, 0.03137255, 0, 1, 1,
0.4666214, -1.556613, 3.243052, 0.03921569, 0, 1, 1,
0.4721791, 0.4317609, -0.1599395, 0.04313726, 0, 1, 1,
0.4748577, -0.8867959, 2.65213, 0.05098039, 0, 1, 1,
0.4795821, 0.6046989, 1.161941, 0.05490196, 0, 1, 1,
0.4820221, 1.009118, -0.879976, 0.0627451, 0, 1, 1,
0.484972, 0.08935706, -0.2113423, 0.06666667, 0, 1, 1,
0.4855359, -0.6540062, 2.20986, 0.07450981, 0, 1, 1,
0.4870948, 1.304117, 1.022937, 0.07843138, 0, 1, 1,
0.4892209, 0.1917825, 1.963996, 0.08627451, 0, 1, 1,
0.489441, -1.359083, 2.630031, 0.09019608, 0, 1, 1,
0.4941018, -0.7874612, 4.771982, 0.09803922, 0, 1, 1,
0.49986, -0.1979926, 3.217623, 0.1058824, 0, 1, 1,
0.5000808, -0.1351659, 4.03716, 0.1098039, 0, 1, 1,
0.5017449, -0.2763514, 3.512424, 0.1176471, 0, 1, 1,
0.5018391, -0.2311687, 2.197107, 0.1215686, 0, 1, 1,
0.5026323, 1.726142, -1.338578, 0.1294118, 0, 1, 1,
0.5071165, 0.2861043, 0.4128959, 0.1333333, 0, 1, 1,
0.5220418, 1.771246, 0.05661956, 0.1411765, 0, 1, 1,
0.5228176, 0.1583063, 0.5604358, 0.145098, 0, 1, 1,
0.5233859, -1.027086, 2.585824, 0.1529412, 0, 1, 1,
0.5259799, -1.367285, 2.812949, 0.1568628, 0, 1, 1,
0.5260062, 0.3549068, 0.5462683, 0.1647059, 0, 1, 1,
0.5355999, -1.203557, 2.297716, 0.1686275, 0, 1, 1,
0.5390494, -0.4056995, 1.008459, 0.1764706, 0, 1, 1,
0.5391265, -0.1952198, 1.972205, 0.1803922, 0, 1, 1,
0.5413131, 0.0420986, 3.194422, 0.1882353, 0, 1, 1,
0.5413164, -0.1101179, 2.16841, 0.1921569, 0, 1, 1,
0.542375, 0.8846248, 0.5574225, 0.2, 0, 1, 1,
0.5446466, 0.1481436, 0.3948691, 0.2078431, 0, 1, 1,
0.5450175, 0.4860305, 2.112194, 0.2117647, 0, 1, 1,
0.5469661, 0.5454324, 0.07827251, 0.2196078, 0, 1, 1,
0.5491732, 0.1996732, 2.695032, 0.2235294, 0, 1, 1,
0.5492143, -0.7704307, 2.807674, 0.2313726, 0, 1, 1,
0.5531139, 0.4373893, 0.05869575, 0.2352941, 0, 1, 1,
0.5558183, -0.04934704, 2.091738, 0.2431373, 0, 1, 1,
0.5561756, 0.6546453, 1.200716, 0.2470588, 0, 1, 1,
0.5590957, -1.371033, 1.984391, 0.254902, 0, 1, 1,
0.5600173, 1.169205, -1.602347, 0.2588235, 0, 1, 1,
0.5620897, -0.1725715, 1.739344, 0.2666667, 0, 1, 1,
0.5637245, 0.6458681, -0.4438272, 0.2705882, 0, 1, 1,
0.5641424, -0.5290065, 3.026253, 0.2784314, 0, 1, 1,
0.5649281, -1.299449, 2.69064, 0.282353, 0, 1, 1,
0.567503, 0.1487563, 1.223944, 0.2901961, 0, 1, 1,
0.5679097, -2.053102, 2.72221, 0.2941177, 0, 1, 1,
0.5682906, 1.984328, 1.665653, 0.3019608, 0, 1, 1,
0.5705503, -0.3343451, 2.376066, 0.3098039, 0, 1, 1,
0.5705604, -1.091212, 3.977937, 0.3137255, 0, 1, 1,
0.5705709, 1.418154, 0.784997, 0.3215686, 0, 1, 1,
0.5733968, -0.1530173, 3.157427, 0.3254902, 0, 1, 1,
0.5821263, 0.8703188, 1.442159, 0.3333333, 0, 1, 1,
0.5882759, -1.253734, 1.68447, 0.3372549, 0, 1, 1,
0.5882922, -0.3796903, 2.320047, 0.345098, 0, 1, 1,
0.5904751, 0.2595086, 2.916042, 0.3490196, 0, 1, 1,
0.5909919, 0.2061515, 1.444331, 0.3568628, 0, 1, 1,
0.5925975, -2.026422, 3.831635, 0.3607843, 0, 1, 1,
0.6009795, -0.544413, 1.865976, 0.3686275, 0, 1, 1,
0.6010308, -1.153486, 2.334581, 0.372549, 0, 1, 1,
0.6032932, -2.471982, 2.278165, 0.3803922, 0, 1, 1,
0.6048514, -3.137871, 3.860232, 0.3843137, 0, 1, 1,
0.6091082, -0.875968, 2.668587, 0.3921569, 0, 1, 1,
0.6099207, 1.303728, -0.03261216, 0.3960784, 0, 1, 1,
0.6128157, -0.04630688, 2.394985, 0.4039216, 0, 1, 1,
0.6144658, -0.5946341, 1.187912, 0.4117647, 0, 1, 1,
0.6184035, -0.7040491, 2.326941, 0.4156863, 0, 1, 1,
0.6185519, 0.07910637, 1.025804, 0.4235294, 0, 1, 1,
0.619243, -0.7871501, 2.99432, 0.427451, 0, 1, 1,
0.6248515, -1.353086, 3.161392, 0.4352941, 0, 1, 1,
0.6311584, -1.367718, 1.410089, 0.4392157, 0, 1, 1,
0.6312113, -0.3031773, 1.536264, 0.4470588, 0, 1, 1,
0.6337858, 0.5249729, 0.4259808, 0.4509804, 0, 1, 1,
0.6344375, 0.8038988, 0.5719988, 0.4588235, 0, 1, 1,
0.6373746, -0.8830975, 2.328941, 0.4627451, 0, 1, 1,
0.640136, 2.081295, -0.3331631, 0.4705882, 0, 1, 1,
0.642687, 2.471921, 0.6644728, 0.4745098, 0, 1, 1,
0.6441199, -0.7542871, 2.082126, 0.4823529, 0, 1, 1,
0.6472534, -0.9978309, 2.455893, 0.4862745, 0, 1, 1,
0.6485299, -1.262911, 3.402497, 0.4941176, 0, 1, 1,
0.6488193, 0.3066628, -0.1479807, 0.5019608, 0, 1, 1,
0.6492187, 0.109743, 2.165534, 0.5058824, 0, 1, 1,
0.6518028, -0.02642404, 0.9310222, 0.5137255, 0, 1, 1,
0.652044, -1.00098, 3.372367, 0.5176471, 0, 1, 1,
0.6557761, -0.3675285, 2.829796, 0.5254902, 0, 1, 1,
0.6558675, -0.1701598, 1.926312, 0.5294118, 0, 1, 1,
0.6630381, 0.01577034, 1.08467, 0.5372549, 0, 1, 1,
0.6676924, 1.882099, 0.8178096, 0.5411765, 0, 1, 1,
0.669378, 0.8007764, 1.778197, 0.5490196, 0, 1, 1,
0.6730815, -0.1769134, 2.789668, 0.5529412, 0, 1, 1,
0.6733055, -1.735458, 3.393309, 0.5607843, 0, 1, 1,
0.6801171, 1.163351, 1.543514, 0.5647059, 0, 1, 1,
0.6827896, -0.03789043, 2.751728, 0.572549, 0, 1, 1,
0.6846277, -0.7346072, 1.08483, 0.5764706, 0, 1, 1,
0.6876972, -1.765694, 2.739251, 0.5843138, 0, 1, 1,
0.6898936, -0.01427376, 2.268278, 0.5882353, 0, 1, 1,
0.6900508, 2.007685, 1.154302, 0.5960785, 0, 1, 1,
0.6932395, 0.6218362, 1.458323, 0.6039216, 0, 1, 1,
0.694993, 0.5114802, 1.162421, 0.6078432, 0, 1, 1,
0.6989217, 0.310056, 1.848253, 0.6156863, 0, 1, 1,
0.7007323, 0.5723354, -0.07961886, 0.6196079, 0, 1, 1,
0.7017355, 1.250211, 2.218852, 0.627451, 0, 1, 1,
0.7027448, -0.1273584, 2.127209, 0.6313726, 0, 1, 1,
0.704119, 0.7882189, 1.949853, 0.6392157, 0, 1, 1,
0.7135004, 0.5225647, -0.1466979, 0.6431373, 0, 1, 1,
0.7145261, 2.375201, 0.05013171, 0.6509804, 0, 1, 1,
0.7199544, 2.163952, -0.0008835668, 0.654902, 0, 1, 1,
0.7257028, -0.5076748, 0.3146892, 0.6627451, 0, 1, 1,
0.7296601, -0.7028244, 2.563989, 0.6666667, 0, 1, 1,
0.7299528, -1.081288, 2.178462, 0.6745098, 0, 1, 1,
0.7300942, 0.5541208, -1.226687, 0.6784314, 0, 1, 1,
0.7316906, 0.2469494, 1.353064, 0.6862745, 0, 1, 1,
0.7325223, -0.4992938, 2.996832, 0.6901961, 0, 1, 1,
0.7360569, -0.3431791, 2.352233, 0.6980392, 0, 1, 1,
0.7403759, 1.423351, 0.1980605, 0.7058824, 0, 1, 1,
0.7433222, -0.6679305, 0.5352302, 0.7098039, 0, 1, 1,
0.7529825, 0.3029454, 2.255061, 0.7176471, 0, 1, 1,
0.7604065, -1.113906, 3.043455, 0.7215686, 0, 1, 1,
0.7644314, 0.04442077, 2.657533, 0.7294118, 0, 1, 1,
0.7673282, -0.8676885, 3.045209, 0.7333333, 0, 1, 1,
0.768103, -1.344807, 3.028377, 0.7411765, 0, 1, 1,
0.7745336, 0.1108484, 0.6569977, 0.7450981, 0, 1, 1,
0.7773278, -0.2312835, 1.808504, 0.7529412, 0, 1, 1,
0.7793601, -2.07962, 2.799151, 0.7568628, 0, 1, 1,
0.781816, 0.5551695, 0.5872023, 0.7647059, 0, 1, 1,
0.7821096, 0.5437409, 0.1631809, 0.7686275, 0, 1, 1,
0.7888688, 0.7819207, 0.9768687, 0.7764706, 0, 1, 1,
0.7899558, 0.04464091, 1.540737, 0.7803922, 0, 1, 1,
0.7907503, -0.5103721, 1.472049, 0.7882353, 0, 1, 1,
0.7939823, 0.168098, 1.180521, 0.7921569, 0, 1, 1,
0.7980738, -0.6390733, 3.151913, 0.8, 0, 1, 1,
0.8022414, -0.1507027, 1.404033, 0.8078431, 0, 1, 1,
0.8275536, 0.9246159, 1.616552, 0.8117647, 0, 1, 1,
0.8282802, -1.140433, 2.59906, 0.8196079, 0, 1, 1,
0.8289138, -0.1234464, 1.459614, 0.8235294, 0, 1, 1,
0.8301781, -0.7736341, -0.3221397, 0.8313726, 0, 1, 1,
0.8313431, 2.244581, 0.6980134, 0.8352941, 0, 1, 1,
0.8342323, -1.371129, 3.091175, 0.8431373, 0, 1, 1,
0.8389243, -1.084358, 1.975296, 0.8470588, 0, 1, 1,
0.8438483, -0.385522, 0.9736812, 0.854902, 0, 1, 1,
0.8450339, -0.4847036, 2.012254, 0.8588235, 0, 1, 1,
0.8477525, -0.4889601, 1.59477, 0.8666667, 0, 1, 1,
0.8542325, -0.5435057, 3.957799, 0.8705882, 0, 1, 1,
0.8562977, -0.2435535, 3.727401, 0.8784314, 0, 1, 1,
0.8568467, -0.1975578, 1.788754, 0.8823529, 0, 1, 1,
0.8622299, 0.06503659, 0.8136925, 0.8901961, 0, 1, 1,
0.8744195, 0.04446332, 2.082303, 0.8941177, 0, 1, 1,
0.8789393, -0.3735494, 1.295619, 0.9019608, 0, 1, 1,
0.8809379, -0.7527921, 1.565986, 0.9098039, 0, 1, 1,
0.8869337, 0.9647626, -0.5288762, 0.9137255, 0, 1, 1,
0.8965098, 1.165886, 1.257561, 0.9215686, 0, 1, 1,
0.8972706, -0.2899224, 3.004761, 0.9254902, 0, 1, 1,
0.8981121, -1.317452, 4.588981, 0.9333333, 0, 1, 1,
0.9098114, -0.3184899, 1.751436, 0.9372549, 0, 1, 1,
0.9103257, -0.0326837, 2.516172, 0.945098, 0, 1, 1,
0.9106203, -1.044642, 3.286709, 0.9490196, 0, 1, 1,
0.9222506, 0.9359188, 1.002277, 0.9568627, 0, 1, 1,
0.9222741, 0.06802162, 2.951671, 0.9607843, 0, 1, 1,
0.9301063, 1.957337, -0.4542221, 0.9686275, 0, 1, 1,
0.9444885, 0.6710701, 2.240775, 0.972549, 0, 1, 1,
0.9445789, -1.008439, 1.814683, 0.9803922, 0, 1, 1,
0.9471777, 0.1674225, 2.50198, 0.9843137, 0, 1, 1,
0.9478438, -0.8439749, 1.763222, 0.9921569, 0, 1, 1,
0.9493833, -1.055136, 3.126286, 0.9960784, 0, 1, 1,
0.9603297, -1.676713, 1.940978, 1, 0, 0.9960784, 1,
0.9666278, 1.050127, 0.5508103, 1, 0, 0.9882353, 1,
0.96894, 2.000547, -0.8229622, 1, 0, 0.9843137, 1,
0.9716847, -0.3912657, 1.708137, 1, 0, 0.9764706, 1,
0.9752321, -1.751969, 1.153088, 1, 0, 0.972549, 1,
0.9768917, 0.3211478, 2.691879, 1, 0, 0.9647059, 1,
0.980952, 1.06367, 0.9952644, 1, 0, 0.9607843, 1,
0.9864935, 0.2888277, 1.524972, 1, 0, 0.9529412, 1,
0.9887677, 1.468216, 1.601911, 1, 0, 0.9490196, 1,
0.989291, 0.2584025, 1.388701, 1, 0, 0.9411765, 1,
0.9912463, 0.6988905, 1.128726, 1, 0, 0.9372549, 1,
0.9956529, -0.5969971, 1.862374, 1, 0, 0.9294118, 1,
0.999412, 0.1494651, 1.593484, 1, 0, 0.9254902, 1,
1.000699, -0.03667841, 1.313523, 1, 0, 0.9176471, 1,
1.009695, 1.067607, 0.147481, 1, 0, 0.9137255, 1,
1.013989, 1.509923, 1.505173, 1, 0, 0.9058824, 1,
1.014768, -0.5385742, 3.327487, 1, 0, 0.9019608, 1,
1.02222, 0.8995197, 2.740676, 1, 0, 0.8941177, 1,
1.031105, 0.3630614, 3.173024, 1, 0, 0.8862745, 1,
1.034805, -0.8106939, 2.518698, 1, 0, 0.8823529, 1,
1.03592, -0.3972988, 2.232471, 1, 0, 0.8745098, 1,
1.038856, 0.646971, 0.4585372, 1, 0, 0.8705882, 1,
1.042319, 1.117468, 2.542555, 1, 0, 0.8627451, 1,
1.042906, -0.237135, 1.692641, 1, 0, 0.8588235, 1,
1.047006, 1.619816, 2.020934, 1, 0, 0.8509804, 1,
1.047438, 0.5969841, 2.789349, 1, 0, 0.8470588, 1,
1.047755, -1.220437, 1.733523, 1, 0, 0.8392157, 1,
1.058524, 0.4399722, 2.170511, 1, 0, 0.8352941, 1,
1.060666, 1.060046, -1.398893, 1, 0, 0.827451, 1,
1.063985, -2.376806, 2.268229, 1, 0, 0.8235294, 1,
1.066534, -1.521177, 1.518756, 1, 0, 0.8156863, 1,
1.072755, -0.8530939, 2.376222, 1, 0, 0.8117647, 1,
1.077773, 1.462706, 0.1191689, 1, 0, 0.8039216, 1,
1.089738, -1.417744, 1.93862, 1, 0, 0.7960784, 1,
1.098874, -0.3774749, 2.699504, 1, 0, 0.7921569, 1,
1.102294, -0.3728751, 1.747629, 1, 0, 0.7843137, 1,
1.104707, -0.5967388, 2.579228, 1, 0, 0.7803922, 1,
1.108141, -0.8006497, 2.101807, 1, 0, 0.772549, 1,
1.110008, 0.8738674, -0.3286799, 1, 0, 0.7686275, 1,
1.111431, 0.5129263, 1.345082, 1, 0, 0.7607843, 1,
1.117901, 1.415933, 1.725898, 1, 0, 0.7568628, 1,
1.118925, 1.4078, 1.939476, 1, 0, 0.7490196, 1,
1.122312, 0.2325193, 0.6579282, 1, 0, 0.7450981, 1,
1.123152, 1.084486, 0.4035222, 1, 0, 0.7372549, 1,
1.126198, -0.9608316, 2.016955, 1, 0, 0.7333333, 1,
1.126542, 1.226091, 2.219898, 1, 0, 0.7254902, 1,
1.135176, 2.759372, 1.460933, 1, 0, 0.7215686, 1,
1.135799, -0.6998171, 1.317067, 1, 0, 0.7137255, 1,
1.138736, 0.05016568, 1.811089, 1, 0, 0.7098039, 1,
1.141112, 1.529337, 0.9492863, 1, 0, 0.7019608, 1,
1.141628, -0.1748018, 0.6749528, 1, 0, 0.6941177, 1,
1.141861, -0.4092473, 3.312673, 1, 0, 0.6901961, 1,
1.142592, 1.683901, 0.3028736, 1, 0, 0.682353, 1,
1.146507, -2.270223, 2.165863, 1, 0, 0.6784314, 1,
1.148921, 1.798682, -0.2287832, 1, 0, 0.6705883, 1,
1.150515, 0.8553935, 0.3873059, 1, 0, 0.6666667, 1,
1.156668, 0.04656884, 1.799397, 1, 0, 0.6588235, 1,
1.158647, 1.316777, 0.2272498, 1, 0, 0.654902, 1,
1.171232, -1.454525, 2.623931, 1, 0, 0.6470588, 1,
1.172535, -0.5676896, 2.362293, 1, 0, 0.6431373, 1,
1.178239, 1.317243, 0.8345721, 1, 0, 0.6352941, 1,
1.182313, -1.234891, 2.66027, 1, 0, 0.6313726, 1,
1.193179, -0.3351232, 3.616642, 1, 0, 0.6235294, 1,
1.197733, 1.186556, 2.986725, 1, 0, 0.6196079, 1,
1.201279, -0.5316406, 0.9086239, 1, 0, 0.6117647, 1,
1.201893, -0.7527255, 1.567937, 1, 0, 0.6078432, 1,
1.209538, 0.517351, 2.089088, 1, 0, 0.6, 1,
1.213028, -0.5128734, 3.530957, 1, 0, 0.5921569, 1,
1.217613, -0.05994476, 0.08666655, 1, 0, 0.5882353, 1,
1.224639, -0.5209001, 1.753646, 1, 0, 0.5803922, 1,
1.225703, 0.1773269, 0.781354, 1, 0, 0.5764706, 1,
1.246298, -1.017522, 3.333709, 1, 0, 0.5686275, 1,
1.253987, -1.464476, 2.569535, 1, 0, 0.5647059, 1,
1.257701, 0.5649657, -0.4204072, 1, 0, 0.5568628, 1,
1.265795, 0.2460253, 0.9649388, 1, 0, 0.5529412, 1,
1.266638, 0.4607314, 2.145111, 1, 0, 0.5450981, 1,
1.277573, -1.761665, 1.083954, 1, 0, 0.5411765, 1,
1.278731, -1.830633, 2.045384, 1, 0, 0.5333334, 1,
1.281443, 0.6730752, 1.343098, 1, 0, 0.5294118, 1,
1.285259, -0.4224569, -0.191228, 1, 0, 0.5215687, 1,
1.285886, 0.04748229, 1.485178, 1, 0, 0.5176471, 1,
1.304531, -0.2178832, 0.9960697, 1, 0, 0.509804, 1,
1.31005, -0.4300867, 1.911025, 1, 0, 0.5058824, 1,
1.312831, -0.7344232, 1.533435, 1, 0, 0.4980392, 1,
1.330662, -1.243309, 3.876317, 1, 0, 0.4901961, 1,
1.336434, 1.496969, -0.1794417, 1, 0, 0.4862745, 1,
1.338423, 1.23626, -0.05725177, 1, 0, 0.4784314, 1,
1.36302, -0.775013, 3.052801, 1, 0, 0.4745098, 1,
1.367992, 0.3286045, 4.101229, 1, 0, 0.4666667, 1,
1.371518, -0.1414843, 2.294861, 1, 0, 0.4627451, 1,
1.374784, -1.062172, 1.066602, 1, 0, 0.454902, 1,
1.378992, 0.4368345, 1.408693, 1, 0, 0.4509804, 1,
1.37932, -1.036034, 1.369539, 1, 0, 0.4431373, 1,
1.379351, 1.009482, 1.346865, 1, 0, 0.4392157, 1,
1.381856, 0.9550805, 0.5745801, 1, 0, 0.4313726, 1,
1.38783, 0.5538841, -0.5920627, 1, 0, 0.427451, 1,
1.434952, 1.196203, 0.2201608, 1, 0, 0.4196078, 1,
1.442089, -1.35634, 2.202941, 1, 0, 0.4156863, 1,
1.442329, -1.24837, 2.422889, 1, 0, 0.4078431, 1,
1.445979, 0.05286052, -0.01432058, 1, 0, 0.4039216, 1,
1.448892, 0.3406229, 0.6665971, 1, 0, 0.3960784, 1,
1.479032, 0.2982076, 0.6998835, 1, 0, 0.3882353, 1,
1.483925, 0.7637827, 0.9721774, 1, 0, 0.3843137, 1,
1.505297, -0.06847351, 1.213794, 1, 0, 0.3764706, 1,
1.509323, -0.9423362, 3.318187, 1, 0, 0.372549, 1,
1.520312, -0.5814688, 0.698566, 1, 0, 0.3647059, 1,
1.538411, 0.8797799, 0.4460404, 1, 0, 0.3607843, 1,
1.549467, 2.66305, 0.6274331, 1, 0, 0.3529412, 1,
1.565454, -0.1036476, 0.7380082, 1, 0, 0.3490196, 1,
1.568746, -1.283825, 3.91816, 1, 0, 0.3411765, 1,
1.570967, -0.2711754, 1.500241, 1, 0, 0.3372549, 1,
1.591882, 0.955857, 0.6202281, 1, 0, 0.3294118, 1,
1.596162, 0.6459721, 1.557852, 1, 0, 0.3254902, 1,
1.59628, 0.1251753, 1.510283, 1, 0, 0.3176471, 1,
1.599131, 0.1583346, 0.6720973, 1, 0, 0.3137255, 1,
1.599763, 0.9845091, 1.485547, 1, 0, 0.3058824, 1,
1.6236, 1.180195, 2.413667, 1, 0, 0.2980392, 1,
1.623917, -4.125983, 2.464736, 1, 0, 0.2941177, 1,
1.625624, -0.8908783, 3.610683, 1, 0, 0.2862745, 1,
1.636163, -0.4347875, 0.5684366, 1, 0, 0.282353, 1,
1.659568, 1.666556, 2.070402, 1, 0, 0.2745098, 1,
1.681288, 2.052551, 1.733169, 1, 0, 0.2705882, 1,
1.683925, 0.6576915, 1.164423, 1, 0, 0.2627451, 1,
1.687837, -1.289011, 1.195692, 1, 0, 0.2588235, 1,
1.703225, -0.3475547, 2.630582, 1, 0, 0.2509804, 1,
1.745366, -0.1454984, 1.312394, 1, 0, 0.2470588, 1,
1.764329, 0.9172865, 0.5199037, 1, 0, 0.2392157, 1,
1.786001, 0.2740867, 0.9327546, 1, 0, 0.2352941, 1,
1.792967, -1.461956, 3.044827, 1, 0, 0.227451, 1,
1.801443, -0.8646654, 3.413016, 1, 0, 0.2235294, 1,
1.814703, 0.2824275, 1.249158, 1, 0, 0.2156863, 1,
1.834137, -0.6607969, 2.477833, 1, 0, 0.2117647, 1,
1.844224, 0.2279911, 1.886348, 1, 0, 0.2039216, 1,
1.854982, -0.5158651, 0.8984044, 1, 0, 0.1960784, 1,
1.855547, -0.4033562, 0.05315535, 1, 0, 0.1921569, 1,
1.863851, 0.8253592, 2.011806, 1, 0, 0.1843137, 1,
1.869757, -0.2418299, 0.2087707, 1, 0, 0.1803922, 1,
1.874833, -0.8253706, 2.174124, 1, 0, 0.172549, 1,
1.880856, 0.07636907, 0.8873469, 1, 0, 0.1686275, 1,
1.90769, 1.78201, 2.386178, 1, 0, 0.1607843, 1,
1.976592, 0.12228, 0.3911386, 1, 0, 0.1568628, 1,
1.984828, 1.418623, 2.165333, 1, 0, 0.1490196, 1,
1.986256, -0.1990446, 1.440953, 1, 0, 0.145098, 1,
1.988016, 0.3119074, 1.066175, 1, 0, 0.1372549, 1,
2.005026, -0.8302407, 3.033785, 1, 0, 0.1333333, 1,
2.011377, -1.143145, 1.35201, 1, 0, 0.1254902, 1,
2.023344, -1.539594, 2.787161, 1, 0, 0.1215686, 1,
2.03073, -2.261973, 3.149625, 1, 0, 0.1137255, 1,
2.031899, -0.1533855, 2.279457, 1, 0, 0.1098039, 1,
2.037832, 1.676524, 0.8887995, 1, 0, 0.1019608, 1,
2.06117, 2.05008, 0.1082929, 1, 0, 0.09411765, 1,
2.082228, 0.1285339, 2.361554, 1, 0, 0.09019608, 1,
2.135693, -0.7070577, 2.732938, 1, 0, 0.08235294, 1,
2.169667, -0.4371862, 2.793889, 1, 0, 0.07843138, 1,
2.326733, -1.735333, 2.597573, 1, 0, 0.07058824, 1,
2.369424, 0.2338445, 1.764592, 1, 0, 0.06666667, 1,
2.374998, 0.7525406, 2.038882, 1, 0, 0.05882353, 1,
2.414924, 1.256339, 1.749848, 1, 0, 0.05490196, 1,
2.484013, -0.6504873, 1.199293, 1, 0, 0.04705882, 1,
2.535656, -1.640699, 0.9553477, 1, 0, 0.04313726, 1,
2.659036, -0.2195686, 0.7069404, 1, 0, 0.03529412, 1,
2.66093, -0.2034542, 1.656546, 1, 0, 0.03137255, 1,
2.718825, -0.3320621, 1.027882, 1, 0, 0.02352941, 1,
2.778912, 0.3718358, 2.883777, 1, 0, 0.01960784, 1,
3.043917, -0.2527598, 0.7154807, 1, 0, 0.01176471, 1,
3.660997, -0.5456415, -0.6281163, 1, 0, 0.007843138, 1
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
-0.003448844, -5.335676, -7.079308, 0, -0.5, 0.5, 0.5,
-0.003448844, -5.335676, -7.079308, 1, -0.5, 0.5, 0.5,
-0.003448844, -5.335676, -7.079308, 1, 1.5, 0.5, 0.5,
-0.003448844, -5.335676, -7.079308, 0, 1.5, 0.5, 0.5
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
-4.910142, -0.5575669, -7.079308, 0, -0.5, 0.5, 0.5,
-4.910142, -0.5575669, -7.079308, 1, -0.5, 0.5, 0.5,
-4.910142, -0.5575669, -7.079308, 1, 1.5, 0.5, 0.5,
-4.910142, -0.5575669, -7.079308, 0, 1.5, 0.5, 0.5
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
-4.910142, -5.335676, 0.05747533, 0, -0.5, 0.5, 0.5,
-4.910142, -5.335676, 0.05747533, 1, -0.5, 0.5, 0.5,
-4.910142, -5.335676, 0.05747533, 1, 1.5, 0.5, 0.5,
-4.910142, -5.335676, 0.05747533, 0, 1.5, 0.5, 0.5
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
-2, -4.233036, -5.432358,
2, -4.233036, -5.432358,
-2, -4.233036, -5.432358,
-2, -4.416809, -5.70685,
0, -4.233036, -5.432358,
0, -4.416809, -5.70685,
2, -4.233036, -5.432358,
2, -4.416809, -5.70685
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
-2, -4.784356, -6.255833, 0, -0.5, 0.5, 0.5,
-2, -4.784356, -6.255833, 1, -0.5, 0.5, 0.5,
-2, -4.784356, -6.255833, 1, 1.5, 0.5, 0.5,
-2, -4.784356, -6.255833, 0, 1.5, 0.5, 0.5,
0, -4.784356, -6.255833, 0, -0.5, 0.5, 0.5,
0, -4.784356, -6.255833, 1, -0.5, 0.5, 0.5,
0, -4.784356, -6.255833, 1, 1.5, 0.5, 0.5,
0, -4.784356, -6.255833, 0, 1.5, 0.5, 0.5,
2, -4.784356, -6.255833, 0, -0.5, 0.5, 0.5,
2, -4.784356, -6.255833, 1, -0.5, 0.5, 0.5,
2, -4.784356, -6.255833, 1, 1.5, 0.5, 0.5,
2, -4.784356, -6.255833, 0, 1.5, 0.5, 0.5
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
-3.777828, -4, -5.432358,
-3.777828, 2, -5.432358,
-3.777828, -4, -5.432358,
-3.966547, -4, -5.70685,
-3.777828, -2, -5.432358,
-3.966547, -2, -5.70685,
-3.777828, 0, -5.432358,
-3.966547, 0, -5.70685,
-3.777828, 2, -5.432358,
-3.966547, 2, -5.70685
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
"-4",
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
-4.343986, -4, -6.255833, 0, -0.5, 0.5, 0.5,
-4.343986, -4, -6.255833, 1, -0.5, 0.5, 0.5,
-4.343986, -4, -6.255833, 1, 1.5, 0.5, 0.5,
-4.343986, -4, -6.255833, 0, 1.5, 0.5, 0.5,
-4.343986, -2, -6.255833, 0, -0.5, 0.5, 0.5,
-4.343986, -2, -6.255833, 1, -0.5, 0.5, 0.5,
-4.343986, -2, -6.255833, 1, 1.5, 0.5, 0.5,
-4.343986, -2, -6.255833, 0, 1.5, 0.5, 0.5,
-4.343986, 0, -6.255833, 0, -0.5, 0.5, 0.5,
-4.343986, 0, -6.255833, 1, -0.5, 0.5, 0.5,
-4.343986, 0, -6.255833, 1, 1.5, 0.5, 0.5,
-4.343986, 0, -6.255833, 0, 1.5, 0.5, 0.5,
-4.343986, 2, -6.255833, 0, -0.5, 0.5, 0.5,
-4.343986, 2, -6.255833, 1, -0.5, 0.5, 0.5,
-4.343986, 2, -6.255833, 1, 1.5, 0.5, 0.5,
-4.343986, 2, -6.255833, 0, 1.5, 0.5, 0.5
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
-3.777828, -4.233036, -4,
-3.777828, -4.233036, 4,
-3.777828, -4.233036, -4,
-3.966547, -4.416809, -4,
-3.777828, -4.233036, -2,
-3.966547, -4.416809, -2,
-3.777828, -4.233036, 0,
-3.966547, -4.416809, 0,
-3.777828, -4.233036, 2,
-3.966547, -4.416809, 2,
-3.777828, -4.233036, 4,
-3.966547, -4.416809, 4
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
-4.343986, -4.784356, -4, 0, -0.5, 0.5, 0.5,
-4.343986, -4.784356, -4, 1, -0.5, 0.5, 0.5,
-4.343986, -4.784356, -4, 1, 1.5, 0.5, 0.5,
-4.343986, -4.784356, -4, 0, 1.5, 0.5, 0.5,
-4.343986, -4.784356, -2, 0, -0.5, 0.5, 0.5,
-4.343986, -4.784356, -2, 1, -0.5, 0.5, 0.5,
-4.343986, -4.784356, -2, 1, 1.5, 0.5, 0.5,
-4.343986, -4.784356, -2, 0, 1.5, 0.5, 0.5,
-4.343986, -4.784356, 0, 0, -0.5, 0.5, 0.5,
-4.343986, -4.784356, 0, 1, -0.5, 0.5, 0.5,
-4.343986, -4.784356, 0, 1, 1.5, 0.5, 0.5,
-4.343986, -4.784356, 0, 0, 1.5, 0.5, 0.5,
-4.343986, -4.784356, 2, 0, -0.5, 0.5, 0.5,
-4.343986, -4.784356, 2, 1, -0.5, 0.5, 0.5,
-4.343986, -4.784356, 2, 1, 1.5, 0.5, 0.5,
-4.343986, -4.784356, 2, 0, 1.5, 0.5, 0.5,
-4.343986, -4.784356, 4, 0, -0.5, 0.5, 0.5,
-4.343986, -4.784356, 4, 1, -0.5, 0.5, 0.5,
-4.343986, -4.784356, 4, 1, 1.5, 0.5, 0.5,
-4.343986, -4.784356, 4, 0, 1.5, 0.5, 0.5
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
-3.777828, -4.233036, -5.432358,
-3.777828, 3.117902, -5.432358,
-3.777828, -4.233036, 5.547309,
-3.777828, 3.117902, 5.547309,
-3.777828, -4.233036, -5.432358,
-3.777828, -4.233036, 5.547309,
-3.777828, 3.117902, -5.432358,
-3.777828, 3.117902, 5.547309,
-3.777828, -4.233036, -5.432358,
3.770931, -4.233036, -5.432358,
-3.777828, -4.233036, 5.547309,
3.770931, -4.233036, 5.547309,
-3.777828, 3.117902, -5.432358,
3.770931, 3.117902, -5.432358,
-3.777828, 3.117902, 5.547309,
3.770931, 3.117902, 5.547309,
3.770931, -4.233036, -5.432358,
3.770931, 3.117902, -5.432358,
3.770931, -4.233036, 5.547309,
3.770931, 3.117902, 5.547309,
3.770931, -4.233036, -5.432358,
3.770931, -4.233036, 5.547309,
3.770931, 3.117902, -5.432358,
3.770931, 3.117902, 5.547309
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
var radius = 8.125864;
var distance = 36.15289;
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
mvMatrix.translate( 0.003448844, 0.5575669, -0.05747533 );
mvMatrix.scale( 1.163879, 1.1952, 0.8001922 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.15289);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
alanycarb<-read.table("alanycarb.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-alanycarb$V2
```

```
## Error in eval(expr, envir, enclos): object 'alanycarb' not found
```

```r
y<-alanycarb$V3
```

```
## Error in eval(expr, envir, enclos): object 'alanycarb' not found
```

```r
z<-alanycarb$V4
```

```
## Error in eval(expr, envir, enclos): object 'alanycarb' not found
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
-3.667895, 1.418125, -1.947724, 0, 0, 1, 1, 1,
-3.43083, -0.3152383, -2.385605, 1, 0, 0, 1, 1,
-3.110727, -1.302915, -3.311889, 1, 0, 0, 1, 1,
-2.99791, -1.847289, -1.608581, 1, 0, 0, 1, 1,
-2.924584, -0.3398579, -3.300751, 1, 0, 0, 1, 1,
-2.575822, -1.713075, -2.791706, 1, 0, 0, 1, 1,
-2.473871, -0.1754451, -2.526288, 0, 0, 0, 1, 1,
-2.412151, 1.759605, -0.07776618, 0, 0, 0, 1, 1,
-2.309236, -1.01206, -2.367967, 0, 0, 0, 1, 1,
-2.240552, 0.1755932, -2.349993, 0, 0, 0, 1, 1,
-2.218105, -1.73292, -1.281284, 0, 0, 0, 1, 1,
-2.201359, -2.014942, -0.6013886, 0, 0, 0, 1, 1,
-2.191869, 0.7037427, -0.8096922, 0, 0, 0, 1, 1,
-2.13123, -0.1927762, -1.952678, 1, 1, 1, 1, 1,
-2.125942, 0.1541429, -0.5067241, 1, 1, 1, 1, 1,
-2.119225, -1.039729, -1.996159, 1, 1, 1, 1, 1,
-2.11039, -0.4617364, -2.900139, 1, 1, 1, 1, 1,
-2.105815, 0.7833135, -1.770348, 1, 1, 1, 1, 1,
-2.10313, 1.071657, -2.013412, 1, 1, 1, 1, 1,
-2.058779, 2.022899, 1.166948, 1, 1, 1, 1, 1,
-1.999431, -0.1794194, -0.9894485, 1, 1, 1, 1, 1,
-1.985122, 0.5505373, 0.9862135, 1, 1, 1, 1, 1,
-1.929295, 0.639908, -3.58546, 1, 1, 1, 1, 1,
-1.928441, -0.2036587, -0.3726265, 1, 1, 1, 1, 1,
-1.914285, 0.330972, 0.621116, 1, 1, 1, 1, 1,
-1.909642, 0.5360631, -2.09523, 1, 1, 1, 1, 1,
-1.906774, -1.305524, -1.7989, 1, 1, 1, 1, 1,
-1.877091, 0.5569305, -1.426322, 1, 1, 1, 1, 1,
-1.875078, -1.264875, -2.281917, 0, 0, 1, 1, 1,
-1.866187, 1.413748, 0.5450375, 1, 0, 0, 1, 1,
-1.834601, -0.672411, -2.512403, 1, 0, 0, 1, 1,
-1.820886, -1.652876, -4.027787, 1, 0, 0, 1, 1,
-1.79812, -0.6427795, -1.761053, 1, 0, 0, 1, 1,
-1.794326, 0.3040577, -0.9234567, 1, 0, 0, 1, 1,
-1.78553, 0.6246076, -1.517484, 0, 0, 0, 1, 1,
-1.770457, -1.210465, -3.086835, 0, 0, 0, 1, 1,
-1.761106, -0.172763, -2.0551, 0, 0, 0, 1, 1,
-1.751033, -0.8866448, -2.377917, 0, 0, 0, 1, 1,
-1.750249, -0.1963352, -2.508603, 0, 0, 0, 1, 1,
-1.732497, 0.4783501, -3.503953, 0, 0, 0, 1, 1,
-1.732311, 0.4413787, 0.5460792, 0, 0, 0, 1, 1,
-1.719598, -1.074568, -3.340162, 1, 1, 1, 1, 1,
-1.71835, -0.8110943, -2.951865, 1, 1, 1, 1, 1,
-1.717461, -0.1086382, -0.9187371, 1, 1, 1, 1, 1,
-1.711722, 0.3467228, -2.705521, 1, 1, 1, 1, 1,
-1.706021, -1.3866, -1.391555, 1, 1, 1, 1, 1,
-1.692525, 0.4427385, -2.543568, 1, 1, 1, 1, 1,
-1.688308, 2.02428, -2.488849, 1, 1, 1, 1, 1,
-1.679274, 3.010849, -0.08347949, 1, 1, 1, 1, 1,
-1.657155, 0.24572, -1.177759, 1, 1, 1, 1, 1,
-1.65399, -0.01859117, -0.8961841, 1, 1, 1, 1, 1,
-1.639404, -0.008354653, -0.8384259, 1, 1, 1, 1, 1,
-1.637572, -0.6089206, -1.839474, 1, 1, 1, 1, 1,
-1.636552, -1.024169, -1.44764, 1, 1, 1, 1, 1,
-1.630326, -0.7986032, -1.554998, 1, 1, 1, 1, 1,
-1.629976, 0.8401389, -2.289496, 1, 1, 1, 1, 1,
-1.621319, 1.413375, -0.4134504, 0, 0, 1, 1, 1,
-1.61808, 1.265835, -0.5773286, 1, 0, 0, 1, 1,
-1.611787, 0.4922764, -2.629839, 1, 0, 0, 1, 1,
-1.605838, 1.383594, -2.011095, 1, 0, 0, 1, 1,
-1.604272, -0.1311052, -1.626621, 1, 0, 0, 1, 1,
-1.601414, -0.4469285, -2.572559, 1, 0, 0, 1, 1,
-1.58533, -0.4383287, -2.853739, 0, 0, 0, 1, 1,
-1.58422, 2.535107, -0.5678073, 0, 0, 0, 1, 1,
-1.579169, 0.3660362, -1.536353, 0, 0, 0, 1, 1,
-1.578708, 2.070414, -0.1346015, 0, 0, 0, 1, 1,
-1.551834, -1.388098, -1.188558, 0, 0, 0, 1, 1,
-1.551441, -0.2589477, -1.690079, 0, 0, 0, 1, 1,
-1.54417, 1.031833, -1.665157, 0, 0, 0, 1, 1,
-1.531719, 0.5032039, -1.196047, 1, 1, 1, 1, 1,
-1.528951, 0.02151427, -0.2272011, 1, 1, 1, 1, 1,
-1.522204, -2.753534, -3.97701, 1, 1, 1, 1, 1,
-1.519161, -0.001523973, -1.234844, 1, 1, 1, 1, 1,
-1.510399, 2.361648, 0.08382356, 1, 1, 1, 1, 1,
-1.506009, -0.8653636, -3.185796, 1, 1, 1, 1, 1,
-1.496933, -0.5390211, -2.934682, 1, 1, 1, 1, 1,
-1.491905, -0.2915787, -2.243193, 1, 1, 1, 1, 1,
-1.484209, 1.098164, -0.9959409, 1, 1, 1, 1, 1,
-1.482565, 0.9427235, -0.7357005, 1, 1, 1, 1, 1,
-1.476996, -0.5012444, -1.552367, 1, 1, 1, 1, 1,
-1.461619, -0.8073686, -1.238801, 1, 1, 1, 1, 1,
-1.460983, -0.1022565, -3.815249, 1, 1, 1, 1, 1,
-1.452784, 0.6189671, -2.671065, 1, 1, 1, 1, 1,
-1.44638, 1.244496, 0.5265983, 1, 1, 1, 1, 1,
-1.441242, 0.2100659, -2.763915, 0, 0, 1, 1, 1,
-1.436085, -0.3211216, -1.533213, 1, 0, 0, 1, 1,
-1.42378, -0.1908927, -1.636992, 1, 0, 0, 1, 1,
-1.422066, 0.04702791, -2.829306, 1, 0, 0, 1, 1,
-1.419819, -1.61532, -2.146103, 1, 0, 0, 1, 1,
-1.413319, -0.813548, -2.742792, 1, 0, 0, 1, 1,
-1.407943, -0.1322443, -1.300534, 0, 0, 0, 1, 1,
-1.389001, 0.3113534, -0.5782008, 0, 0, 0, 1, 1,
-1.382105, -0.5314052, -2.982187, 0, 0, 0, 1, 1,
-1.36417, -1.132054, -2.078307, 0, 0, 0, 1, 1,
-1.361406, 0.1704953, -3.234118, 0, 0, 0, 1, 1,
-1.357226, 0.5535871, -1.057185, 0, 0, 0, 1, 1,
-1.35182, 0.199893, -1.312953, 0, 0, 0, 1, 1,
-1.345001, -0.8385303, -1.87354, 1, 1, 1, 1, 1,
-1.323824, 1.395806, 1.493622, 1, 1, 1, 1, 1,
-1.322768, -0.5597618, -2.57392, 1, 1, 1, 1, 1,
-1.314051, -1.006769, -3.717908, 1, 1, 1, 1, 1,
-1.299358, -0.4643274, -2.50285, 1, 1, 1, 1, 1,
-1.299288, 2.2578, 0.2720773, 1, 1, 1, 1, 1,
-1.294291, 0.5540533, -3.647539, 1, 1, 1, 1, 1,
-1.291174, 0.04767356, 0.02205759, 1, 1, 1, 1, 1,
-1.289961, -0.05917315, -2.485897, 1, 1, 1, 1, 1,
-1.28763, 0.324215, -0.6528803, 1, 1, 1, 1, 1,
-1.279639, 0.4472925, -0.2945731, 1, 1, 1, 1, 1,
-1.277329, -0.9111609, -1.505079, 1, 1, 1, 1, 1,
-1.26987, -0.9516041, -1.373794, 1, 1, 1, 1, 1,
-1.2495, 0.9153163, -1.949656, 1, 1, 1, 1, 1,
-1.238016, -0.03441673, 0.7412195, 1, 1, 1, 1, 1,
-1.234802, 0.1729091, -0.2480762, 0, 0, 1, 1, 1,
-1.229792, -0.4488007, -1.210384, 1, 0, 0, 1, 1,
-1.22567, 0.7201028, 1.270326, 1, 0, 0, 1, 1,
-1.20778, -0.9297698, -0.731301, 1, 0, 0, 1, 1,
-1.207402, -0.778989, -2.453742, 1, 0, 0, 1, 1,
-1.199911, -1.04347, -2.408645, 1, 0, 0, 1, 1,
-1.191803, 1.948272, -0.9004136, 0, 0, 0, 1, 1,
-1.187939, -0.6295542, -1.48078, 0, 0, 0, 1, 1,
-1.186807, 0.08899485, -3.017507, 0, 0, 0, 1, 1,
-1.181785, 1.328901, -0.5603371, 0, 0, 0, 1, 1,
-1.179481, -0.04975076, -3.074371, 0, 0, 0, 1, 1,
-1.179246, -0.9505413, -0.5641549, 0, 0, 0, 1, 1,
-1.178469, 1.114313, -1.481084, 0, 0, 0, 1, 1,
-1.177842, -0.7358218, -1.355437, 1, 1, 1, 1, 1,
-1.17596, -1.748667, -1.267176, 1, 1, 1, 1, 1,
-1.175594, 1.129787, -0.4710136, 1, 1, 1, 1, 1,
-1.173709, 0.4208345, 0.8686718, 1, 1, 1, 1, 1,
-1.172893, -0.09761415, -2.348382, 1, 1, 1, 1, 1,
-1.169142, -0.3784393, -2.042216, 1, 1, 1, 1, 1,
-1.159513, 1.994071, -1.282137, 1, 1, 1, 1, 1,
-1.159015, 0.9646677, -1.317729, 1, 1, 1, 1, 1,
-1.157924, -2.172006, -2.323621, 1, 1, 1, 1, 1,
-1.151528, -1.433318, -2.280735, 1, 1, 1, 1, 1,
-1.150917, -0.33502, -2.50007, 1, 1, 1, 1, 1,
-1.143402, -1.839993, -3.183917, 1, 1, 1, 1, 1,
-1.135919, -0.7658525, -0.2485009, 1, 1, 1, 1, 1,
-1.134502, -1.603905, -3.022228, 1, 1, 1, 1, 1,
-1.133875, -0.5317572, -2.026661, 1, 1, 1, 1, 1,
-1.130855, -0.8441346, -0.7336116, 0, 0, 1, 1, 1,
-1.127026, -0.1328427, -1.267743, 1, 0, 0, 1, 1,
-1.122649, 0.3959582, -1.815552, 1, 0, 0, 1, 1,
-1.110035, -1.253416, -2.03816, 1, 0, 0, 1, 1,
-1.109534, -0.5120886, -1.00092, 1, 0, 0, 1, 1,
-1.108266, 1.053672, -1.646124, 1, 0, 0, 1, 1,
-1.106903, 1.324498, 1.208779, 0, 0, 0, 1, 1,
-1.101103, 1.105445, -1.445491, 0, 0, 0, 1, 1,
-1.097039, 0.02663728, -1.117695, 0, 0, 0, 1, 1,
-1.092173, -2.518701, -2.625328, 0, 0, 0, 1, 1,
-1.091955, -0.9126157, -3.319578, 0, 0, 0, 1, 1,
-1.091805, -0.7634028, -3.418792, 0, 0, 0, 1, 1,
-1.083672, 1.345192, -0.02986962, 0, 0, 0, 1, 1,
-1.083395, 2.489697, 0.01763527, 1, 1, 1, 1, 1,
-1.072929, 1.107004, -0.6088463, 1, 1, 1, 1, 1,
-1.067432, 0.2254288, -1.373922, 1, 1, 1, 1, 1,
-1.061375, 0.3390768, -1.939161, 1, 1, 1, 1, 1,
-1.055834, 1.545214, -0.8308935, 1, 1, 1, 1, 1,
-1.05547, -0.4833507, -0.6334784, 1, 1, 1, 1, 1,
-1.050132, 0.7688645, -1.328676, 1, 1, 1, 1, 1,
-1.048664, -0.4117595, -1.044344, 1, 1, 1, 1, 1,
-1.045601, -0.2017501, 1.087086, 1, 1, 1, 1, 1,
-1.042672, 0.2429095, 0.1741607, 1, 1, 1, 1, 1,
-1.041749, 1.243914, -0.6813424, 1, 1, 1, 1, 1,
-1.033875, -0.9106224, -3.10492, 1, 1, 1, 1, 1,
-1.032347, 2.267311, -0.968298, 1, 1, 1, 1, 1,
-1.027343, 0.01213784, -2.978828, 1, 1, 1, 1, 1,
-1.023941, 2.147886, -2.286536, 1, 1, 1, 1, 1,
-1.017989, 0.2568023, -0.8616479, 0, 0, 1, 1, 1,
-1.017619, 0.1559594, -3.130898, 1, 0, 0, 1, 1,
-1.005819, -2.083385, -1.44966, 1, 0, 0, 1, 1,
-0.992539, -0.5381261, -1.644146, 1, 0, 0, 1, 1,
-0.9807098, 0.1831262, 0.3487822, 1, 0, 0, 1, 1,
-0.9786915, -0.1788273, -2.600293, 1, 0, 0, 1, 1,
-0.9746805, -0.6460986, -2.227246, 0, 0, 0, 1, 1,
-0.9736266, 0.3620791, -2.241055, 0, 0, 0, 1, 1,
-0.9664521, 0.6114911, -0.4008676, 0, 0, 0, 1, 1,
-0.9535764, 1.814949, -1.024176, 0, 0, 0, 1, 1,
-0.9532052, 0.5463001, -0.7679007, 0, 0, 0, 1, 1,
-0.9424449, -0.8592578, -1.85758, 0, 0, 0, 1, 1,
-0.9237621, -1.415107, -3.129129, 0, 0, 0, 1, 1,
-0.917662, 2.186191, -0.4861566, 1, 1, 1, 1, 1,
-0.9170005, -1.558609, -1.435971, 1, 1, 1, 1, 1,
-0.916276, -0.3120919, -2.037098, 1, 1, 1, 1, 1,
-0.9145502, -1.272356, -2.019552, 1, 1, 1, 1, 1,
-0.9124473, 0.3962747, -0.6018591, 1, 1, 1, 1, 1,
-0.9048685, 0.5687916, -1.00567, 1, 1, 1, 1, 1,
-0.8969148, -0.8070464, -2.784553, 1, 1, 1, 1, 1,
-0.8957433, -0.9204741, -2.657528, 1, 1, 1, 1, 1,
-0.8930236, -0.2513013, -1.954302, 1, 1, 1, 1, 1,
-0.8909416, -0.1178424, -2.331018, 1, 1, 1, 1, 1,
-0.8869892, 0.004177351, -1.386038, 1, 1, 1, 1, 1,
-0.8751365, 1.474999, -0.5853379, 1, 1, 1, 1, 1,
-0.8728849, -0.1207876, -2.511527, 1, 1, 1, 1, 1,
-0.8661515, 1.580084, -2.011025, 1, 1, 1, 1, 1,
-0.8644825, -0.5916219, -2.49118, 1, 1, 1, 1, 1,
-0.8604286, 2.559131, -0.8918949, 0, 0, 1, 1, 1,
-0.8589531, -1.910789, -2.854355, 1, 0, 0, 1, 1,
-0.8584695, -0.1179451, -2.025284, 1, 0, 0, 1, 1,
-0.8501867, -1.292374, -2.908948, 1, 0, 0, 1, 1,
-0.8457197, 0.2632251, -1.12093, 1, 0, 0, 1, 1,
-0.834051, -0.7424836, -0.3278918, 1, 0, 0, 1, 1,
-0.8329517, 1.298638, -0.7602082, 0, 0, 0, 1, 1,
-0.8329156, -1.695648, -1.763652, 0, 0, 0, 1, 1,
-0.8139342, 0.03249137, -1.850518, 0, 0, 0, 1, 1,
-0.806459, 0.702556, -1.409294, 0, 0, 0, 1, 1,
-0.8017319, -1.554956, -4.135777, 0, 0, 0, 1, 1,
-0.8011122, 0.9123545, 1.003764, 0, 0, 0, 1, 1,
-0.7954205, 1.192799, 1.307873, 0, 0, 0, 1, 1,
-0.7937535, -0.9540334, -3.659412, 1, 1, 1, 1, 1,
-0.7892663, 0.6214026, -0.1660371, 1, 1, 1, 1, 1,
-0.7874405, 0.03452303, -0.4537941, 1, 1, 1, 1, 1,
-0.7869465, -0.4248784, -3.625926, 1, 1, 1, 1, 1,
-0.7830057, -0.01087642, -2.88011, 1, 1, 1, 1, 1,
-0.7827826, 0.5371927, -0.8639156, 1, 1, 1, 1, 1,
-0.7803793, -0.7543394, -3.460918, 1, 1, 1, 1, 1,
-0.7779507, -1.418743, -2.14025, 1, 1, 1, 1, 1,
-0.7658575, 2.564651, -0.4578241, 1, 1, 1, 1, 1,
-0.7651817, -0.3465151, -1.748521, 1, 1, 1, 1, 1,
-0.7640255, -0.2329057, -2.339827, 1, 1, 1, 1, 1,
-0.7496151, -1.3997, -1.22178, 1, 1, 1, 1, 1,
-0.7490839, 1.012055, -2.797911, 1, 1, 1, 1, 1,
-0.7455789, -0.3991756, -2.596884, 1, 1, 1, 1, 1,
-0.7452608, -2.143185, -4.310381, 1, 1, 1, 1, 1,
-0.7438287, -0.6068562, -2.110734, 0, 0, 1, 1, 1,
-0.7430996, 0.5133863, -1.61823, 1, 0, 0, 1, 1,
-0.7421836, -1.541722, -2.262135, 1, 0, 0, 1, 1,
-0.7351572, 0.2292986, -0.5737234, 1, 0, 0, 1, 1,
-0.7339826, -0.3592684, -1.804658, 1, 0, 0, 1, 1,
-0.7338042, -0.6472717, -4.04937, 1, 0, 0, 1, 1,
-0.7257093, -1.109402, -1.299511, 0, 0, 0, 1, 1,
-0.7237273, 0.5178411, -0.5582923, 0, 0, 0, 1, 1,
-0.7189836, -1.753069, -2.934049, 0, 0, 0, 1, 1,
-0.7177935, -0.5732725, -2.604313, 0, 0, 0, 1, 1,
-0.7169949, 0.3269102, -1.029332, 0, 0, 0, 1, 1,
-0.7103255, 0.2207213, -2.183279, 0, 0, 0, 1, 1,
-0.705895, 0.3915282, -3.861315, 0, 0, 0, 1, 1,
-0.7034085, -0.7759333, -3.003227, 1, 1, 1, 1, 1,
-0.6936246, -1.811729, -2.573111, 1, 1, 1, 1, 1,
-0.6864314, 0.09339307, -0.858713, 1, 1, 1, 1, 1,
-0.6851703, 0.6174276, -0.1894179, 1, 1, 1, 1, 1,
-0.6844622, -0.8788858, -2.985393, 1, 1, 1, 1, 1,
-0.6781088, -0.2512589, -2.348002, 1, 1, 1, 1, 1,
-0.6673157, -1.054222, -3.313433, 1, 1, 1, 1, 1,
-0.6673089, 1.108557, 0.2358988, 1, 1, 1, 1, 1,
-0.661476, -0.1588172, -3.694054, 1, 1, 1, 1, 1,
-0.6601372, 1.198978, -0.2699159, 1, 1, 1, 1, 1,
-0.6594016, 2.025439, -0.991682, 1, 1, 1, 1, 1,
-0.6564291, -0.8094815, -2.475584, 1, 1, 1, 1, 1,
-0.6535681, -0.4019946, -1.796676, 1, 1, 1, 1, 1,
-0.6488605, 0.1563072, -0.999799, 1, 1, 1, 1, 1,
-0.6462502, 1.781528, -0.7424219, 1, 1, 1, 1, 1,
-0.6390918, -0.02714333, -1.641915, 0, 0, 1, 1, 1,
-0.637003, -2.746944, -4.10238, 1, 0, 0, 1, 1,
-0.6361684, 0.1450883, -1.362943, 1, 0, 0, 1, 1,
-0.633374, -0.3216844, -2.599094, 1, 0, 0, 1, 1,
-0.6327376, 0.3656298, -0.3326994, 1, 0, 0, 1, 1,
-0.6321953, 0.2437096, -3.084969, 1, 0, 0, 1, 1,
-0.6312866, -0.8157831, -2.788843, 0, 0, 0, 1, 1,
-0.630769, 0.421953, -1.831915, 0, 0, 0, 1, 1,
-0.6290213, 0.114338, -1.724462, 0, 0, 0, 1, 1,
-0.6284481, 0.1395893, 0.4652328, 0, 0, 0, 1, 1,
-0.6258229, -1.537969, -2.946666, 0, 0, 0, 1, 1,
-0.6209496, 0.2314364, -1.957931, 0, 0, 0, 1, 1,
-0.620061, 0.0422744, -0.7431543, 0, 0, 0, 1, 1,
-0.617552, -1.015232, -1.566238, 1, 1, 1, 1, 1,
-0.6125963, -1.409181, -3.836726, 1, 1, 1, 1, 1,
-0.6120417, -0.8873394, -2.977443, 1, 1, 1, 1, 1,
-0.6079906, -1.784466, -2.826927, 1, 1, 1, 1, 1,
-0.60773, 1.773045, 0.5886256, 1, 1, 1, 1, 1,
-0.6057269, 0.06516381, -2.494513, 1, 1, 1, 1, 1,
-0.6046826, -0.9206339, -3.392449, 1, 1, 1, 1, 1,
-0.6037734, -0.6594902, -1.846008, 1, 1, 1, 1, 1,
-0.5993753, -1.720139, -3.644585, 1, 1, 1, 1, 1,
-0.5993009, 0.202069, -2.337869, 1, 1, 1, 1, 1,
-0.5939815, 0.3711047, -2.399219, 1, 1, 1, 1, 1,
-0.5854129, 0.8176367, -0.1582362, 1, 1, 1, 1, 1,
-0.5851244, -1.794421, -3.584765, 1, 1, 1, 1, 1,
-0.5849351, 1.626263, -0.1959421, 1, 1, 1, 1, 1,
-0.5841509, -1.135701, -3.789087, 1, 1, 1, 1, 1,
-0.5821707, 0.8092818, -2.436003, 0, 0, 1, 1, 1,
-0.5815291, -0.713025, -2.529802, 1, 0, 0, 1, 1,
-0.5761528, -0.3643891, -2.694959, 1, 0, 0, 1, 1,
-0.5740003, -0.5626122, -2.016468, 1, 0, 0, 1, 1,
-0.5719654, -0.4876667, -1.569751, 1, 0, 0, 1, 1,
-0.5692416, -1.700886, -3.29997, 1, 0, 0, 1, 1,
-0.567312, -0.6384608, -3.732074, 0, 0, 0, 1, 1,
-0.5579217, -0.8343556, -2.951994, 0, 0, 0, 1, 1,
-0.5551815, -0.969355, -1.800579, 0, 0, 0, 1, 1,
-0.5493916, 0.3169415, -2.381665, 0, 0, 0, 1, 1,
-0.5463688, -1.131677, -2.947142, 0, 0, 0, 1, 1,
-0.5456629, -0.004399847, 2.203424, 0, 0, 0, 1, 1,
-0.5394275, 1.146347, -0.1782676, 0, 0, 0, 1, 1,
-0.537017, -1.654332, -3.42033, 1, 1, 1, 1, 1,
-0.532492, 2.291968, 0.3184981, 1, 1, 1, 1, 1,
-0.5290923, -0.8520299, -1.536295, 1, 1, 1, 1, 1,
-0.5287168, 1.060238, -0.6681526, 1, 1, 1, 1, 1,
-0.5255893, -0.05505346, -0.6318152, 1, 1, 1, 1, 1,
-0.5250089, 0.6223852, -0.4605142, 1, 1, 1, 1, 1,
-0.5187978, 0.9005704, -1.036151, 1, 1, 1, 1, 1,
-0.5181967, 0.5301634, -1.386563, 1, 1, 1, 1, 1,
-0.5132321, 0.6950676, -0.6576734, 1, 1, 1, 1, 1,
-0.5118204, -0.320798, -1.562189, 1, 1, 1, 1, 1,
-0.5105665, 0.8495724, -0.8481179, 1, 1, 1, 1, 1,
-0.5087772, -0.2073741, -0.3266911, 1, 1, 1, 1, 1,
-0.4988023, -0.447455, -1.596259, 1, 1, 1, 1, 1,
-0.4982672, 0.5623695, -0.528905, 1, 1, 1, 1, 1,
-0.4915884, -0.9266702, -3.504245, 1, 1, 1, 1, 1,
-0.4896365, 1.041194, -0.3191637, 0, 0, 1, 1, 1,
-0.4808724, -1.237128, -3.868645, 1, 0, 0, 1, 1,
-0.4776077, -0.03764084, -1.970422, 1, 0, 0, 1, 1,
-0.4775144, 0.8867962, 0.8276923, 1, 0, 0, 1, 1,
-0.4763849, 0.4665856, -2.743735, 1, 0, 0, 1, 1,
-0.4706622, 0.7286442, -0.006725742, 1, 0, 0, 1, 1,
-0.4627829, 0.1772939, -1.930421, 0, 0, 0, 1, 1,
-0.4597521, 0.3244418, 1.045279, 0, 0, 0, 1, 1,
-0.4574553, -1.108461, -3.122336, 0, 0, 0, 1, 1,
-0.4508377, -0.07170136, -1.83724, 0, 0, 0, 1, 1,
-0.4466472, -1.254608, -1.724963, 0, 0, 0, 1, 1,
-0.4442722, -0.8762625, -3.160639, 0, 0, 0, 1, 1,
-0.4431642, -0.6165186, -2.428586, 0, 0, 0, 1, 1,
-0.44153, -0.4135925, -3.409636, 1, 1, 1, 1, 1,
-0.4387186, 2.020444, -1.034491, 1, 1, 1, 1, 1,
-0.4384997, 1.014788, 0.3575411, 1, 1, 1, 1, 1,
-0.4374658, -1.452696, -3.066646, 1, 1, 1, 1, 1,
-0.4359576, 1.348102, -0.591115, 1, 1, 1, 1, 1,
-0.4343144, -0.5347021, -2.957017, 1, 1, 1, 1, 1,
-0.4317397, 0.2682587, -1.583349, 1, 1, 1, 1, 1,
-0.4300511, -0.05501532, -2.166784, 1, 1, 1, 1, 1,
-0.4290767, -1.455134, -3.091457, 1, 1, 1, 1, 1,
-0.4278995, -0.02306874, -2.665718, 1, 1, 1, 1, 1,
-0.4179667, 0.5804151, -0.4036837, 1, 1, 1, 1, 1,
-0.4126575, 2.331031, -1.554091, 1, 1, 1, 1, 1,
-0.4114234, 1.56398, -1.134198, 1, 1, 1, 1, 1,
-0.4075909, 0.7815782, -0.4941273, 1, 1, 1, 1, 1,
-0.4061791, 2.259923, -0.5378952, 1, 1, 1, 1, 1,
-0.3943214, 1.321185, 0.1070489, 0, 0, 1, 1, 1,
-0.3930796, -0.6094628, -2.382651, 1, 0, 0, 1, 1,
-0.3917502, -2.227821, -1.837495, 1, 0, 0, 1, 1,
-0.3912714, 0.07117078, -1.364404, 1, 0, 0, 1, 1,
-0.3909965, 0.3699046, 0.03335809, 1, 0, 0, 1, 1,
-0.3909212, -0.4311593, -1.561053, 1, 0, 0, 1, 1,
-0.3890799, -1.363497, -4.2996, 0, 0, 0, 1, 1,
-0.3835499, 0.6214042, -0.2410773, 0, 0, 0, 1, 1,
-0.3782913, -0.5203044, -3.863606, 0, 0, 0, 1, 1,
-0.3762012, 0.1822929, -1.110403, 0, 0, 0, 1, 1,
-0.3759229, 1.163528, -0.8623456, 0, 0, 0, 1, 1,
-0.3743094, 1.164059, -1.125719, 0, 0, 0, 1, 1,
-0.3625103, -0.2058478, -2.030787, 0, 0, 0, 1, 1,
-0.3602629, -0.4026549, -0.9601567, 1, 1, 1, 1, 1,
-0.3588709, -0.7410663, -3.94144, 1, 1, 1, 1, 1,
-0.3575915, 1.788248, 0.2013141, 1, 1, 1, 1, 1,
-0.3570689, -1.901096, -3.605495, 1, 1, 1, 1, 1,
-0.3558691, -0.9103208, -3.538524, 1, 1, 1, 1, 1,
-0.3527108, -2.094308, -2.487833, 1, 1, 1, 1, 1,
-0.3483689, 0.5044554, -2.414234, 1, 1, 1, 1, 1,
-0.3453104, 1.452008, -0.6394123, 1, 1, 1, 1, 1,
-0.3389118, 0.4877121, -0.6566969, 1, 1, 1, 1, 1,
-0.3313872, 1.402961, 1.185813, 1, 1, 1, 1, 1,
-0.3206058, -1.610456, -2.942025, 1, 1, 1, 1, 1,
-0.3190587, 1.626443, -1.450691, 1, 1, 1, 1, 1,
-0.3131721, 1.096847, -1.298221, 1, 1, 1, 1, 1,
-0.310098, -0.4422117, -3.446523, 1, 1, 1, 1, 1,
-0.3059157, 0.8013958, -0.5516264, 1, 1, 1, 1, 1,
-0.3050588, -0.8292735, -3.659554, 0, 0, 1, 1, 1,
-0.3019377, -0.5078335, -1.756988, 1, 0, 0, 1, 1,
-0.3010404, 1.811618, -2.20393, 1, 0, 0, 1, 1,
-0.2960495, 0.03284568, -1.937987, 1, 0, 0, 1, 1,
-0.2947669, 0.927702, -1.568584, 1, 0, 0, 1, 1,
-0.2939917, -1.425089, -4.017358, 1, 0, 0, 1, 1,
-0.2925041, 1.023737, -0.05150417, 0, 0, 0, 1, 1,
-0.2921093, -1.174517, -2.772599, 0, 0, 0, 1, 1,
-0.2892652, -2.151509, -3.171539, 0, 0, 0, 1, 1,
-0.2887328, -0.2015916, -2.216276, 0, 0, 0, 1, 1,
-0.2861337, -1.08016, -3.407868, 0, 0, 0, 1, 1,
-0.2843451, -1.776628, -1.866523, 0, 0, 0, 1, 1,
-0.281021, 1.284289, 1.776789, 0, 0, 0, 1, 1,
-0.2739084, 0.3673959, -0.6313326, 1, 1, 1, 1, 1,
-0.2683253, -1.461283, -2.388148, 1, 1, 1, 1, 1,
-0.2660254, 1.240074, 0.07526331, 1, 1, 1, 1, 1,
-0.2612489, 0.4181507, 0.8751214, 1, 1, 1, 1, 1,
-0.2525268, 0.6940238, -1.413705, 1, 1, 1, 1, 1,
-0.2496739, 1.162124, -0.6460299, 1, 1, 1, 1, 1,
-0.2468262, 0.2638031, -1.183496, 1, 1, 1, 1, 1,
-0.2420748, -0.5852915, -3.613792, 1, 1, 1, 1, 1,
-0.2385909, 0.1474846, -0.9544268, 1, 1, 1, 1, 1,
-0.2369548, 0.6919687, 0.6605574, 1, 1, 1, 1, 1,
-0.2346966, -0.1918177, -2.581131, 1, 1, 1, 1, 1,
-0.2328735, 0.4920759, -1.9738, 1, 1, 1, 1, 1,
-0.2311456, -0.423419, -3.74737, 1, 1, 1, 1, 1,
-0.2281381, -0.6532711, -1.585488, 1, 1, 1, 1, 1,
-0.2276465, -0.5504518, -2.17301, 1, 1, 1, 1, 1,
-0.223621, 0.8552355, 0.1809811, 0, 0, 1, 1, 1,
-0.2235476, -0.5480623, -2.647203, 1, 0, 0, 1, 1,
-0.2180101, -1.853396, -1.711696, 1, 0, 0, 1, 1,
-0.2169489, 0.7512363, 0.1556505, 1, 0, 0, 1, 1,
-0.2158255, 0.1482881, -0.6556883, 1, 0, 0, 1, 1,
-0.213198, 0.180994, -0.05436655, 1, 0, 0, 1, 1,
-0.2090916, -1.05552, -3.801248, 0, 0, 0, 1, 1,
-0.2067874, 0.7074754, 0.1532329, 0, 0, 0, 1, 1,
-0.2019944, -1.981947, -3.427604, 0, 0, 0, 1, 1,
-0.1986601, -1.465359, -3.461828, 0, 0, 0, 1, 1,
-0.1980367, 1.358204, -1.68955, 0, 0, 0, 1, 1,
-0.1964567, -0.07313676, -1.249174, 0, 0, 0, 1, 1,
-0.1881058, 1.69946, -1.434753, 0, 0, 0, 1, 1,
-0.1873133, 0.1471829, -1.812543, 1, 1, 1, 1, 1,
-0.1831884, 1.277479, -1.017171, 1, 1, 1, 1, 1,
-0.1802589, -0.6057444, -2.868379, 1, 1, 1, 1, 1,
-0.1780491, -0.01028563, -0.6226788, 1, 1, 1, 1, 1,
-0.1744953, -0.6031594, -0.8603959, 1, 1, 1, 1, 1,
-0.1739537, 1.656045, -0.2211182, 1, 1, 1, 1, 1,
-0.1727427, 1.521839, -1.426169, 1, 1, 1, 1, 1,
-0.1691521, 0.01734629, -1.221953, 1, 1, 1, 1, 1,
-0.1680224, 0.7455939, -2.234166, 1, 1, 1, 1, 1,
-0.163018, 0.3899905, 0.08651798, 1, 1, 1, 1, 1,
-0.1595112, -0.07054558, -1.632872, 1, 1, 1, 1, 1,
-0.1577174, 0.2005278, -2.212354, 1, 1, 1, 1, 1,
-0.1552068, 2.308954, -0.3030158, 1, 1, 1, 1, 1,
-0.1545176, 0.3845267, -0.7642415, 1, 1, 1, 1, 1,
-0.1543202, -2.77361, -1.625388, 1, 1, 1, 1, 1,
-0.15226, 0.788357, 1.247574, 0, 0, 1, 1, 1,
-0.1520209, 0.2672702, -0.02244875, 1, 0, 0, 1, 1,
-0.1514833, -0.7975481, -3.952639, 1, 0, 0, 1, 1,
-0.1491746, 0.6155171, 0.02234118, 1, 0, 0, 1, 1,
-0.1457165, -0.5749559, -2.954885, 1, 0, 0, 1, 1,
-0.1415663, -0.01551984, -1.416085, 1, 0, 0, 1, 1,
-0.1408663, -0.07166862, -1.487568, 0, 0, 0, 1, 1,
-0.1398435, -3.106911, -3.406281, 0, 0, 0, 1, 1,
-0.1391044, 1.394522, 0.8083694, 0, 0, 0, 1, 1,
-0.1365697, 1.723107, -0.63776, 0, 0, 0, 1, 1,
-0.1344825, 0.2290413, -1.848414, 0, 0, 0, 1, 1,
-0.1292652, 0.1654485, -0.5372089, 0, 0, 0, 1, 1,
-0.124852, -0.878046, -3.101887, 0, 0, 0, 1, 1,
-0.1239116, 2.165584, 0.9185497, 1, 1, 1, 1, 1,
-0.1191899, -0.2352909, -4.984542, 1, 1, 1, 1, 1,
-0.1179279, -1.237982, -5.19765, 1, 1, 1, 1, 1,
-0.117415, -0.4391722, -2.929916, 1, 1, 1, 1, 1,
-0.1160415, 0.8164147, 0.1282285, 1, 1, 1, 1, 1,
-0.1132934, 0.9573412, -0.3358618, 1, 1, 1, 1, 1,
-0.112174, -0.1093432, -2.94999, 1, 1, 1, 1, 1,
-0.1109331, -1.627714, -4.132663, 1, 1, 1, 1, 1,
-0.1080299, -1.42805, -1.983723, 1, 1, 1, 1, 1,
-0.1063291, 0.9375212, 0.1567893, 1, 1, 1, 1, 1,
-0.106294, -1.897553, -2.343252, 1, 1, 1, 1, 1,
-0.1062314, 1.3342, 0.06308851, 1, 1, 1, 1, 1,
-0.1011886, 1.608945, -1.236459, 1, 1, 1, 1, 1,
-0.1005186, 1.27367, -1.602131, 1, 1, 1, 1, 1,
-0.09997663, -1.233121, -2.359462, 1, 1, 1, 1, 1,
-0.09736558, -0.272511, -3.37412, 0, 0, 1, 1, 1,
-0.09598847, -0.8055198, -2.969307, 1, 0, 0, 1, 1,
-0.08930424, -0.5917736, -2.969974, 1, 0, 0, 1, 1,
-0.08214788, -1.325455, -3.329656, 1, 0, 0, 1, 1,
-0.07371501, -1.218599, -3.414614, 1, 0, 0, 1, 1,
-0.07314418, 1.511387, -0.04705744, 1, 0, 0, 1, 1,
-0.06591565, 0.7638984, 1.952642, 0, 0, 0, 1, 1,
-0.0641221, 1.700188, 0.2829742, 0, 0, 0, 1, 1,
-0.0639064, -0.8190942, -4.356831, 0, 0, 0, 1, 1,
-0.06144511, -0.2317324, -2.958603, 0, 0, 0, 1, 1,
-0.0601552, 0.2987293, 0.2507642, 0, 0, 0, 1, 1,
-0.05670139, 0.8500506, -0.7934784, 0, 0, 0, 1, 1,
-0.05104046, -1.852955, -5.27246, 0, 0, 0, 1, 1,
-0.04770305, 1.502925, 0.3916759, 1, 1, 1, 1, 1,
-0.04347934, 1.469024, -1.129888, 1, 1, 1, 1, 1,
-0.04237564, 0.02018227, -0.8090587, 1, 1, 1, 1, 1,
-0.0403499, 0.4240642, 0.2158339, 1, 1, 1, 1, 1,
-0.04003916, 0.1201247, 0.2449919, 1, 1, 1, 1, 1,
-0.03860865, 0.7870809, 1.364075, 1, 1, 1, 1, 1,
-0.03741217, -1.954715, -3.291166, 1, 1, 1, 1, 1,
-0.03724469, -2.174862, -3.493015, 1, 1, 1, 1, 1,
-0.03563508, -1.915366, -4.13551, 1, 1, 1, 1, 1,
-0.03249943, 1.626103, -1.690697, 1, 1, 1, 1, 1,
-0.02957086, -0.4282866, -3.61052, 1, 1, 1, 1, 1,
-0.02899072, -0.597317, -3.233086, 1, 1, 1, 1, 1,
-0.02731077, -0.2719954, -3.070387, 1, 1, 1, 1, 1,
-0.02598622, 0.3905346, 0.5319468, 1, 1, 1, 1, 1,
-0.02167142, -0.6944984, -1.616611, 1, 1, 1, 1, 1,
-0.01831052, -0.2401038, -2.986922, 0, 0, 1, 1, 1,
-0.01821917, -0.8535136, -4.45755, 1, 0, 0, 1, 1,
-0.01669621, -0.8918953, -2.208887, 1, 0, 0, 1, 1,
-0.01288578, -0.4842551, -4.079703, 1, 0, 0, 1, 1,
-0.01105592, -1.307145, -1.860175, 1, 0, 0, 1, 1,
-0.009011884, -0.3103864, -3.407362, 1, 0, 0, 1, 1,
-0.002190858, 0.4276135, 0.4314742, 0, 0, 0, 1, 1,
0.003029576, -0.0839202, 5.387411, 0, 0, 0, 1, 1,
0.005889768, -0.1295662, 4.833133, 0, 0, 0, 1, 1,
0.007128182, 0.08765119, 0.1532598, 0, 0, 0, 1, 1,
0.007940857, -0.2991985, 1.57203, 0, 0, 0, 1, 1,
0.008510915, 0.008417766, -0.08321219, 0, 0, 0, 1, 1,
0.01019957, 1.277895, -1.991105, 0, 0, 0, 1, 1,
0.01220225, 0.9636972, 0.6476541, 1, 1, 1, 1, 1,
0.01705912, -0.7809526, 2.531099, 1, 1, 1, 1, 1,
0.02040816, -0.7758444, 3.03869, 1, 1, 1, 1, 1,
0.02214321, -1.428701, 3.120495, 1, 1, 1, 1, 1,
0.0224483, -0.4719541, 2.423676, 1, 1, 1, 1, 1,
0.02692567, -0.1430513, 4.168951, 1, 1, 1, 1, 1,
0.02715257, 2.259951, 0.214341, 1, 1, 1, 1, 1,
0.0283102, 0.3573501, -0.6951674, 1, 1, 1, 1, 1,
0.02857253, -0.3926559, 3.743083, 1, 1, 1, 1, 1,
0.02941977, -0.1143079, 1.777727, 1, 1, 1, 1, 1,
0.03157641, -1.014862, 3.569775, 1, 1, 1, 1, 1,
0.04219509, -0.5343133, 3.451616, 1, 1, 1, 1, 1,
0.04304555, 0.4623162, -0.6905414, 1, 1, 1, 1, 1,
0.04683939, 1.253587, 0.3623413, 1, 1, 1, 1, 1,
0.04955363, -0.4788569, 4.382028, 1, 1, 1, 1, 1,
0.05198067, -1.126282, 3.993449, 0, 0, 1, 1, 1,
0.05543996, 0.2843644, 1.512485, 1, 0, 0, 1, 1,
0.0641503, 0.08670032, 2.670107, 1, 0, 0, 1, 1,
0.06524063, -0.9707271, 3.347583, 1, 0, 0, 1, 1,
0.06705455, -0.5016888, 2.405078, 1, 0, 0, 1, 1,
0.07585426, 1.486434, 0.9531292, 1, 0, 0, 1, 1,
0.07856265, -1.76872, 3.195722, 0, 0, 0, 1, 1,
0.07977296, 0.5949432, -0.02791012, 0, 0, 0, 1, 1,
0.08080484, 0.7221857, 1.112273, 0, 0, 0, 1, 1,
0.08117661, 1.824366, 1.316915, 0, 0, 0, 1, 1,
0.08170036, -1.18395, 1.377204, 0, 0, 0, 1, 1,
0.08392803, 1.13613, 0.2392881, 0, 0, 0, 1, 1,
0.09224118, -0.7763211, 2.53864, 0, 0, 0, 1, 1,
0.09362663, -1.715061, 2.222311, 1, 1, 1, 1, 1,
0.09528002, 0.6102893, 0.2272234, 1, 1, 1, 1, 1,
0.09980363, 0.7812507, 1.407003, 1, 1, 1, 1, 1,
0.09990906, 1.148889, 2.091877, 1, 1, 1, 1, 1,
0.1001859, 0.2175589, -1.435541, 1, 1, 1, 1, 1,
0.1014032, 0.2570578, -0.7349191, 1, 1, 1, 1, 1,
0.1060881, 0.4368163, 2.04194, 1, 1, 1, 1, 1,
0.1080644, -2.153059, 2.497602, 1, 1, 1, 1, 1,
0.1094843, -1.264953, 5.104526, 1, 1, 1, 1, 1,
0.1104063, 1.121035, -0.4559369, 1, 1, 1, 1, 1,
0.1110385, 0.8777547, -0.2336218, 1, 1, 1, 1, 1,
0.1132228, -0.5030774, 2.928044, 1, 1, 1, 1, 1,
0.1148787, 0.1474673, 0.8235663, 1, 1, 1, 1, 1,
0.1153596, -0.2608149, 3.456032, 1, 1, 1, 1, 1,
0.1207614, 0.0554039, 1.969496, 1, 1, 1, 1, 1,
0.1209274, 0.305036, 2.078455, 0, 0, 1, 1, 1,
0.1240486, -1.684914, 2.446995, 1, 0, 0, 1, 1,
0.1286603, -0.7362142, 3.547683, 1, 0, 0, 1, 1,
0.1318755, -1.080092, 0.5669177, 1, 0, 0, 1, 1,
0.1363949, -0.1354173, 2.61545, 1, 0, 0, 1, 1,
0.1366542, -1.968273, 5.148471, 1, 0, 0, 1, 1,
0.1414253, -2.031469, 2.606716, 0, 0, 0, 1, 1,
0.1476537, -0.3962964, 3.129431, 0, 0, 0, 1, 1,
0.1486745, -0.09610536, 1.955344, 0, 0, 0, 1, 1,
0.1490328, -1.413828, 1.90222, 0, 0, 0, 1, 1,
0.1513951, -0.7410881, 2.04599, 0, 0, 0, 1, 1,
0.1520787, 0.7822354, -0.2043294, 0, 0, 0, 1, 1,
0.1563512, 1.196325, 0.3558188, 0, 0, 0, 1, 1,
0.1577554, -1.362631, 0.5313853, 1, 1, 1, 1, 1,
0.1599639, 0.2913339, -0.1242283, 1, 1, 1, 1, 1,
0.1600489, -0.7804483, 2.440795, 1, 1, 1, 1, 1,
0.1605731, -0.4960824, 0.5034139, 1, 1, 1, 1, 1,
0.1612117, -0.190524, 2.504539, 1, 1, 1, 1, 1,
0.1630986, 0.7269411, -2.346985, 1, 1, 1, 1, 1,
0.1656094, -0.259536, 3.504213, 1, 1, 1, 1, 1,
0.1659703, 1.288617, 0.8765649, 1, 1, 1, 1, 1,
0.1696957, -0.9132102, 2.391739, 1, 1, 1, 1, 1,
0.1700493, 1.350324, -0.6323046, 1, 1, 1, 1, 1,
0.1704236, 0.843186, 0.9301878, 1, 1, 1, 1, 1,
0.1723104, -0.908839, 2.150695, 1, 1, 1, 1, 1,
0.1741104, -1.767034, 3.423401, 1, 1, 1, 1, 1,
0.1744291, 0.4423699, 1.828668, 1, 1, 1, 1, 1,
0.1796317, 1.640629, 0.3156468, 1, 1, 1, 1, 1,
0.1798451, -0.4288167, 2.426168, 0, 0, 1, 1, 1,
0.183541, -0.9877621, 2.633555, 1, 0, 0, 1, 1,
0.1838363, -1.351902, 4.011652, 1, 0, 0, 1, 1,
0.1857419, 0.5268466, 0.1315268, 1, 0, 0, 1, 1,
0.1879625, -0.2082444, 3.228346, 1, 0, 0, 1, 1,
0.1901701, 0.4933905, 0.4671459, 1, 0, 0, 1, 1,
0.1910739, 1.567785, -0.7248942, 0, 0, 0, 1, 1,
0.1954843, -0.0914198, 2.393573, 0, 0, 0, 1, 1,
0.2005474, 0.01363138, 2.383851, 0, 0, 0, 1, 1,
0.2030439, -1.404545, 1.9549, 0, 0, 0, 1, 1,
0.2089233, 1.090188, -0.4918833, 0, 0, 0, 1, 1,
0.2116246, 1.697713, -0.5754687, 0, 0, 0, 1, 1,
0.2120188, -1.192796, 3.942528, 0, 0, 0, 1, 1,
0.2126088, 0.09717094, 0.9447935, 1, 1, 1, 1, 1,
0.2139395, 1.595456, -1.529294, 1, 1, 1, 1, 1,
0.2199705, -1.363115, 2.20136, 1, 1, 1, 1, 1,
0.2202401, 0.590379, 0.9163998, 1, 1, 1, 1, 1,
0.2208678, -1.363249, 2.468236, 1, 1, 1, 1, 1,
0.2216908, 1.267524, 0.8448098, 1, 1, 1, 1, 1,
0.2240673, 0.5301934, 1.26602, 1, 1, 1, 1, 1,
0.2252883, 0.9885228, 0.1886793, 1, 1, 1, 1, 1,
0.2277611, -0.1737046, 1.980178, 1, 1, 1, 1, 1,
0.231571, -1.208341, 3.119791, 1, 1, 1, 1, 1,
0.2345142, 0.3699342, -0.2718836, 1, 1, 1, 1, 1,
0.2385272, -0.4467296, 3.70606, 1, 1, 1, 1, 1,
0.2427734, -0.6458713, 2.49979, 1, 1, 1, 1, 1,
0.2447499, 0.4986824, 0.03636497, 1, 1, 1, 1, 1,
0.2465149, 1.060119, 1.000539, 1, 1, 1, 1, 1,
0.2479368, -1.130328, 2.421119, 0, 0, 1, 1, 1,
0.2516715, -0.3479006, 1.711583, 1, 0, 0, 1, 1,
0.2531996, -1.118773, 3.013978, 1, 0, 0, 1, 1,
0.2562864, 0.323447, 0.4626237, 1, 0, 0, 1, 1,
0.2596381, -0.5062923, 2.458222, 1, 0, 0, 1, 1,
0.2619641, 1.246507, 0.8173056, 1, 0, 0, 1, 1,
0.2631786, -0.4398121, 4.242382, 0, 0, 0, 1, 1,
0.2683068, 0.7086626, 0.7207422, 0, 0, 0, 1, 1,
0.2712551, 0.3785999, 1.896528, 0, 0, 0, 1, 1,
0.2754772, -1.387633, 4.746198, 0, 0, 0, 1, 1,
0.2774827, -1.111461, 3.282182, 0, 0, 0, 1, 1,
0.2783346, -0.2391707, 2.137624, 0, 0, 0, 1, 1,
0.279421, 1.595055, 0.7270173, 0, 0, 0, 1, 1,
0.2864519, -0.1883289, 3.391927, 1, 1, 1, 1, 1,
0.2864832, -2.092349, 2.89799, 1, 1, 1, 1, 1,
0.2905334, -1.518038, 3.308903, 1, 1, 1, 1, 1,
0.2906362, -1.414673, 3.231237, 1, 1, 1, 1, 1,
0.2907055, 0.01825304, 0.8811489, 1, 1, 1, 1, 1,
0.2920574, 1.848176, -0.4862376, 1, 1, 1, 1, 1,
0.2941142, -0.8263547, 2.35541, 1, 1, 1, 1, 1,
0.2950036, -0.6297277, 1.999543, 1, 1, 1, 1, 1,
0.2958773, 0.1611876, 0.11685, 1, 1, 1, 1, 1,
0.2971779, -1.137654, 2.987335, 1, 1, 1, 1, 1,
0.3010688, -0.7178279, 3.467267, 1, 1, 1, 1, 1,
0.3034852, -0.3704911, 2.19669, 1, 1, 1, 1, 1,
0.3064846, -0.1550285, 1.815689, 1, 1, 1, 1, 1,
0.3084182, 0.7045516, -0.7054247, 1, 1, 1, 1, 1,
0.3099169, 0.100782, 2.245726, 1, 1, 1, 1, 1,
0.3185568, 0.1639002, 2.152825, 0, 0, 1, 1, 1,
0.3219831, -0.4144051, 2.412884, 1, 0, 0, 1, 1,
0.326446, 1.924979, 0.543345, 1, 0, 0, 1, 1,
0.3271551, -0.8665571, 4.47778, 1, 0, 0, 1, 1,
0.3273644, 0.5671973, 2.190398, 1, 0, 0, 1, 1,
0.3305485, 0.6379647, -0.9368011, 1, 0, 0, 1, 1,
0.3306973, 0.3380609, -2.027206, 0, 0, 0, 1, 1,
0.3368592, 1.171645, -0.1776592, 0, 0, 0, 1, 1,
0.3384323, 0.3494425, 0.2107109, 0, 0, 0, 1, 1,
0.3408611, 0.9431245, 0.01145254, 0, 0, 0, 1, 1,
0.34321, -1.273429, 2.504508, 0, 0, 0, 1, 1,
0.3465986, -0.03128919, 2.601564, 0, 0, 0, 1, 1,
0.3491675, 0.1073973, 1.538775, 0, 0, 0, 1, 1,
0.3506916, -1.468595, 3.575309, 1, 1, 1, 1, 1,
0.3663404, 0.3798048, 0.06264767, 1, 1, 1, 1, 1,
0.3669496, -0.7456953, 2.293122, 1, 1, 1, 1, 1,
0.3676801, -0.7204602, 3.253499, 1, 1, 1, 1, 1,
0.3692348, -0.7629803, 2.790407, 1, 1, 1, 1, 1,
0.3694586, 0.8253898, 0.5057569, 1, 1, 1, 1, 1,
0.3703606, -0.5976508, 3.573107, 1, 1, 1, 1, 1,
0.3730619, 0.7331364, 1.408556, 1, 1, 1, 1, 1,
0.3814102, -0.8464926, 3.298475, 1, 1, 1, 1, 1,
0.3820355, 0.4442255, 0.8426844, 1, 1, 1, 1, 1,
0.3829354, 0.06885901, 0.1961576, 1, 1, 1, 1, 1,
0.38538, -0.4735905, 2.542913, 1, 1, 1, 1, 1,
0.3857991, 0.3627386, 0.3307594, 1, 1, 1, 1, 1,
0.3875297, 0.1799178, 2.60087, 1, 1, 1, 1, 1,
0.3901016, -0.8760972, 2.321115, 1, 1, 1, 1, 1,
0.391802, 0.06564438, -0.07484477, 0, 0, 1, 1, 1,
0.3931989, 0.5221981, 0.9260626, 1, 0, 0, 1, 1,
0.3947016, -1.804395, 2.684136, 1, 0, 0, 1, 1,
0.3948768, -0.01726791, 1.344867, 1, 0, 0, 1, 1,
0.3962165, 0.7241036, 0.07783736, 1, 0, 0, 1, 1,
0.39861, -0.9075962, 2.446965, 1, 0, 0, 1, 1,
0.401107, -1.173431, 3.327715, 0, 0, 0, 1, 1,
0.402965, 0.02587095, 2.194761, 0, 0, 0, 1, 1,
0.4078987, -0.06520431, -0.635484, 0, 0, 0, 1, 1,
0.4114251, 1.237587, 1.652614, 0, 0, 0, 1, 1,
0.4129558, 0.2605468, 1.654095, 0, 0, 0, 1, 1,
0.4134426, -0.6197071, 2.766629, 0, 0, 0, 1, 1,
0.4136611, 1.145297, 2.190858, 0, 0, 0, 1, 1,
0.4159548, -0.572042, 2.550057, 1, 1, 1, 1, 1,
0.4173504, -0.1288847, 0.490854, 1, 1, 1, 1, 1,
0.4191913, 0.6516572, 0.9281625, 1, 1, 1, 1, 1,
0.4282698, 0.9195468, 1.06843, 1, 1, 1, 1, 1,
0.4310495, -1.195654, 2.842833, 1, 1, 1, 1, 1,
0.4369569, 0.2778148, -1.26172, 1, 1, 1, 1, 1,
0.4395563, 1.665089, -0.5553904, 1, 1, 1, 1, 1,
0.4405327, -0.4602299, 2.873308, 1, 1, 1, 1, 1,
0.4415819, -0.08472113, 2.26855, 1, 1, 1, 1, 1,
0.4440641, 0.4376889, 0.1487182, 1, 1, 1, 1, 1,
0.4486725, -0.4162811, 3.986228, 1, 1, 1, 1, 1,
0.4495564, -1.073492, 1.72823, 1, 1, 1, 1, 1,
0.4522982, -0.1841573, 0.7867414, 1, 1, 1, 1, 1,
0.4544658, 0.01788389, -0.7846843, 1, 1, 1, 1, 1,
0.4560857, 1.407352, 1.014722, 1, 1, 1, 1, 1,
0.4632115, 1.139057, 0.4605636, 0, 0, 1, 1, 1,
0.4666214, -1.556613, 3.243052, 1, 0, 0, 1, 1,
0.4721791, 0.4317609, -0.1599395, 1, 0, 0, 1, 1,
0.4748577, -0.8867959, 2.65213, 1, 0, 0, 1, 1,
0.4795821, 0.6046989, 1.161941, 1, 0, 0, 1, 1,
0.4820221, 1.009118, -0.879976, 1, 0, 0, 1, 1,
0.484972, 0.08935706, -0.2113423, 0, 0, 0, 1, 1,
0.4855359, -0.6540062, 2.20986, 0, 0, 0, 1, 1,
0.4870948, 1.304117, 1.022937, 0, 0, 0, 1, 1,
0.4892209, 0.1917825, 1.963996, 0, 0, 0, 1, 1,
0.489441, -1.359083, 2.630031, 0, 0, 0, 1, 1,
0.4941018, -0.7874612, 4.771982, 0, 0, 0, 1, 1,
0.49986, -0.1979926, 3.217623, 0, 0, 0, 1, 1,
0.5000808, -0.1351659, 4.03716, 1, 1, 1, 1, 1,
0.5017449, -0.2763514, 3.512424, 1, 1, 1, 1, 1,
0.5018391, -0.2311687, 2.197107, 1, 1, 1, 1, 1,
0.5026323, 1.726142, -1.338578, 1, 1, 1, 1, 1,
0.5071165, 0.2861043, 0.4128959, 1, 1, 1, 1, 1,
0.5220418, 1.771246, 0.05661956, 1, 1, 1, 1, 1,
0.5228176, 0.1583063, 0.5604358, 1, 1, 1, 1, 1,
0.5233859, -1.027086, 2.585824, 1, 1, 1, 1, 1,
0.5259799, -1.367285, 2.812949, 1, 1, 1, 1, 1,
0.5260062, 0.3549068, 0.5462683, 1, 1, 1, 1, 1,
0.5355999, -1.203557, 2.297716, 1, 1, 1, 1, 1,
0.5390494, -0.4056995, 1.008459, 1, 1, 1, 1, 1,
0.5391265, -0.1952198, 1.972205, 1, 1, 1, 1, 1,
0.5413131, 0.0420986, 3.194422, 1, 1, 1, 1, 1,
0.5413164, -0.1101179, 2.16841, 1, 1, 1, 1, 1,
0.542375, 0.8846248, 0.5574225, 0, 0, 1, 1, 1,
0.5446466, 0.1481436, 0.3948691, 1, 0, 0, 1, 1,
0.5450175, 0.4860305, 2.112194, 1, 0, 0, 1, 1,
0.5469661, 0.5454324, 0.07827251, 1, 0, 0, 1, 1,
0.5491732, 0.1996732, 2.695032, 1, 0, 0, 1, 1,
0.5492143, -0.7704307, 2.807674, 1, 0, 0, 1, 1,
0.5531139, 0.4373893, 0.05869575, 0, 0, 0, 1, 1,
0.5558183, -0.04934704, 2.091738, 0, 0, 0, 1, 1,
0.5561756, 0.6546453, 1.200716, 0, 0, 0, 1, 1,
0.5590957, -1.371033, 1.984391, 0, 0, 0, 1, 1,
0.5600173, 1.169205, -1.602347, 0, 0, 0, 1, 1,
0.5620897, -0.1725715, 1.739344, 0, 0, 0, 1, 1,
0.5637245, 0.6458681, -0.4438272, 0, 0, 0, 1, 1,
0.5641424, -0.5290065, 3.026253, 1, 1, 1, 1, 1,
0.5649281, -1.299449, 2.69064, 1, 1, 1, 1, 1,
0.567503, 0.1487563, 1.223944, 1, 1, 1, 1, 1,
0.5679097, -2.053102, 2.72221, 1, 1, 1, 1, 1,
0.5682906, 1.984328, 1.665653, 1, 1, 1, 1, 1,
0.5705503, -0.3343451, 2.376066, 1, 1, 1, 1, 1,
0.5705604, -1.091212, 3.977937, 1, 1, 1, 1, 1,
0.5705709, 1.418154, 0.784997, 1, 1, 1, 1, 1,
0.5733968, -0.1530173, 3.157427, 1, 1, 1, 1, 1,
0.5821263, 0.8703188, 1.442159, 1, 1, 1, 1, 1,
0.5882759, -1.253734, 1.68447, 1, 1, 1, 1, 1,
0.5882922, -0.3796903, 2.320047, 1, 1, 1, 1, 1,
0.5904751, 0.2595086, 2.916042, 1, 1, 1, 1, 1,
0.5909919, 0.2061515, 1.444331, 1, 1, 1, 1, 1,
0.5925975, -2.026422, 3.831635, 1, 1, 1, 1, 1,
0.6009795, -0.544413, 1.865976, 0, 0, 1, 1, 1,
0.6010308, -1.153486, 2.334581, 1, 0, 0, 1, 1,
0.6032932, -2.471982, 2.278165, 1, 0, 0, 1, 1,
0.6048514, -3.137871, 3.860232, 1, 0, 0, 1, 1,
0.6091082, -0.875968, 2.668587, 1, 0, 0, 1, 1,
0.6099207, 1.303728, -0.03261216, 1, 0, 0, 1, 1,
0.6128157, -0.04630688, 2.394985, 0, 0, 0, 1, 1,
0.6144658, -0.5946341, 1.187912, 0, 0, 0, 1, 1,
0.6184035, -0.7040491, 2.326941, 0, 0, 0, 1, 1,
0.6185519, 0.07910637, 1.025804, 0, 0, 0, 1, 1,
0.619243, -0.7871501, 2.99432, 0, 0, 0, 1, 1,
0.6248515, -1.353086, 3.161392, 0, 0, 0, 1, 1,
0.6311584, -1.367718, 1.410089, 0, 0, 0, 1, 1,
0.6312113, -0.3031773, 1.536264, 1, 1, 1, 1, 1,
0.6337858, 0.5249729, 0.4259808, 1, 1, 1, 1, 1,
0.6344375, 0.8038988, 0.5719988, 1, 1, 1, 1, 1,
0.6373746, -0.8830975, 2.328941, 1, 1, 1, 1, 1,
0.640136, 2.081295, -0.3331631, 1, 1, 1, 1, 1,
0.642687, 2.471921, 0.6644728, 1, 1, 1, 1, 1,
0.6441199, -0.7542871, 2.082126, 1, 1, 1, 1, 1,
0.6472534, -0.9978309, 2.455893, 1, 1, 1, 1, 1,
0.6485299, -1.262911, 3.402497, 1, 1, 1, 1, 1,
0.6488193, 0.3066628, -0.1479807, 1, 1, 1, 1, 1,
0.6492187, 0.109743, 2.165534, 1, 1, 1, 1, 1,
0.6518028, -0.02642404, 0.9310222, 1, 1, 1, 1, 1,
0.652044, -1.00098, 3.372367, 1, 1, 1, 1, 1,
0.6557761, -0.3675285, 2.829796, 1, 1, 1, 1, 1,
0.6558675, -0.1701598, 1.926312, 1, 1, 1, 1, 1,
0.6630381, 0.01577034, 1.08467, 0, 0, 1, 1, 1,
0.6676924, 1.882099, 0.8178096, 1, 0, 0, 1, 1,
0.669378, 0.8007764, 1.778197, 1, 0, 0, 1, 1,
0.6730815, -0.1769134, 2.789668, 1, 0, 0, 1, 1,
0.6733055, -1.735458, 3.393309, 1, 0, 0, 1, 1,
0.6801171, 1.163351, 1.543514, 1, 0, 0, 1, 1,
0.6827896, -0.03789043, 2.751728, 0, 0, 0, 1, 1,
0.6846277, -0.7346072, 1.08483, 0, 0, 0, 1, 1,
0.6876972, -1.765694, 2.739251, 0, 0, 0, 1, 1,
0.6898936, -0.01427376, 2.268278, 0, 0, 0, 1, 1,
0.6900508, 2.007685, 1.154302, 0, 0, 0, 1, 1,
0.6932395, 0.6218362, 1.458323, 0, 0, 0, 1, 1,
0.694993, 0.5114802, 1.162421, 0, 0, 0, 1, 1,
0.6989217, 0.310056, 1.848253, 1, 1, 1, 1, 1,
0.7007323, 0.5723354, -0.07961886, 1, 1, 1, 1, 1,
0.7017355, 1.250211, 2.218852, 1, 1, 1, 1, 1,
0.7027448, -0.1273584, 2.127209, 1, 1, 1, 1, 1,
0.704119, 0.7882189, 1.949853, 1, 1, 1, 1, 1,
0.7135004, 0.5225647, -0.1466979, 1, 1, 1, 1, 1,
0.7145261, 2.375201, 0.05013171, 1, 1, 1, 1, 1,
0.7199544, 2.163952, -0.0008835668, 1, 1, 1, 1, 1,
0.7257028, -0.5076748, 0.3146892, 1, 1, 1, 1, 1,
0.7296601, -0.7028244, 2.563989, 1, 1, 1, 1, 1,
0.7299528, -1.081288, 2.178462, 1, 1, 1, 1, 1,
0.7300942, 0.5541208, -1.226687, 1, 1, 1, 1, 1,
0.7316906, 0.2469494, 1.353064, 1, 1, 1, 1, 1,
0.7325223, -0.4992938, 2.996832, 1, 1, 1, 1, 1,
0.7360569, -0.3431791, 2.352233, 1, 1, 1, 1, 1,
0.7403759, 1.423351, 0.1980605, 0, 0, 1, 1, 1,
0.7433222, -0.6679305, 0.5352302, 1, 0, 0, 1, 1,
0.7529825, 0.3029454, 2.255061, 1, 0, 0, 1, 1,
0.7604065, -1.113906, 3.043455, 1, 0, 0, 1, 1,
0.7644314, 0.04442077, 2.657533, 1, 0, 0, 1, 1,
0.7673282, -0.8676885, 3.045209, 1, 0, 0, 1, 1,
0.768103, -1.344807, 3.028377, 0, 0, 0, 1, 1,
0.7745336, 0.1108484, 0.6569977, 0, 0, 0, 1, 1,
0.7773278, -0.2312835, 1.808504, 0, 0, 0, 1, 1,
0.7793601, -2.07962, 2.799151, 0, 0, 0, 1, 1,
0.781816, 0.5551695, 0.5872023, 0, 0, 0, 1, 1,
0.7821096, 0.5437409, 0.1631809, 0, 0, 0, 1, 1,
0.7888688, 0.7819207, 0.9768687, 0, 0, 0, 1, 1,
0.7899558, 0.04464091, 1.540737, 1, 1, 1, 1, 1,
0.7907503, -0.5103721, 1.472049, 1, 1, 1, 1, 1,
0.7939823, 0.168098, 1.180521, 1, 1, 1, 1, 1,
0.7980738, -0.6390733, 3.151913, 1, 1, 1, 1, 1,
0.8022414, -0.1507027, 1.404033, 1, 1, 1, 1, 1,
0.8275536, 0.9246159, 1.616552, 1, 1, 1, 1, 1,
0.8282802, -1.140433, 2.59906, 1, 1, 1, 1, 1,
0.8289138, -0.1234464, 1.459614, 1, 1, 1, 1, 1,
0.8301781, -0.7736341, -0.3221397, 1, 1, 1, 1, 1,
0.8313431, 2.244581, 0.6980134, 1, 1, 1, 1, 1,
0.8342323, -1.371129, 3.091175, 1, 1, 1, 1, 1,
0.8389243, -1.084358, 1.975296, 1, 1, 1, 1, 1,
0.8438483, -0.385522, 0.9736812, 1, 1, 1, 1, 1,
0.8450339, -0.4847036, 2.012254, 1, 1, 1, 1, 1,
0.8477525, -0.4889601, 1.59477, 1, 1, 1, 1, 1,
0.8542325, -0.5435057, 3.957799, 0, 0, 1, 1, 1,
0.8562977, -0.2435535, 3.727401, 1, 0, 0, 1, 1,
0.8568467, -0.1975578, 1.788754, 1, 0, 0, 1, 1,
0.8622299, 0.06503659, 0.8136925, 1, 0, 0, 1, 1,
0.8744195, 0.04446332, 2.082303, 1, 0, 0, 1, 1,
0.8789393, -0.3735494, 1.295619, 1, 0, 0, 1, 1,
0.8809379, -0.7527921, 1.565986, 0, 0, 0, 1, 1,
0.8869337, 0.9647626, -0.5288762, 0, 0, 0, 1, 1,
0.8965098, 1.165886, 1.257561, 0, 0, 0, 1, 1,
0.8972706, -0.2899224, 3.004761, 0, 0, 0, 1, 1,
0.8981121, -1.317452, 4.588981, 0, 0, 0, 1, 1,
0.9098114, -0.3184899, 1.751436, 0, 0, 0, 1, 1,
0.9103257, -0.0326837, 2.516172, 0, 0, 0, 1, 1,
0.9106203, -1.044642, 3.286709, 1, 1, 1, 1, 1,
0.9222506, 0.9359188, 1.002277, 1, 1, 1, 1, 1,
0.9222741, 0.06802162, 2.951671, 1, 1, 1, 1, 1,
0.9301063, 1.957337, -0.4542221, 1, 1, 1, 1, 1,
0.9444885, 0.6710701, 2.240775, 1, 1, 1, 1, 1,
0.9445789, -1.008439, 1.814683, 1, 1, 1, 1, 1,
0.9471777, 0.1674225, 2.50198, 1, 1, 1, 1, 1,
0.9478438, -0.8439749, 1.763222, 1, 1, 1, 1, 1,
0.9493833, -1.055136, 3.126286, 1, 1, 1, 1, 1,
0.9603297, -1.676713, 1.940978, 1, 1, 1, 1, 1,
0.9666278, 1.050127, 0.5508103, 1, 1, 1, 1, 1,
0.96894, 2.000547, -0.8229622, 1, 1, 1, 1, 1,
0.9716847, -0.3912657, 1.708137, 1, 1, 1, 1, 1,
0.9752321, -1.751969, 1.153088, 1, 1, 1, 1, 1,
0.9768917, 0.3211478, 2.691879, 1, 1, 1, 1, 1,
0.980952, 1.06367, 0.9952644, 0, 0, 1, 1, 1,
0.9864935, 0.2888277, 1.524972, 1, 0, 0, 1, 1,
0.9887677, 1.468216, 1.601911, 1, 0, 0, 1, 1,
0.989291, 0.2584025, 1.388701, 1, 0, 0, 1, 1,
0.9912463, 0.6988905, 1.128726, 1, 0, 0, 1, 1,
0.9956529, -0.5969971, 1.862374, 1, 0, 0, 1, 1,
0.999412, 0.1494651, 1.593484, 0, 0, 0, 1, 1,
1.000699, -0.03667841, 1.313523, 0, 0, 0, 1, 1,
1.009695, 1.067607, 0.147481, 0, 0, 0, 1, 1,
1.013989, 1.509923, 1.505173, 0, 0, 0, 1, 1,
1.014768, -0.5385742, 3.327487, 0, 0, 0, 1, 1,
1.02222, 0.8995197, 2.740676, 0, 0, 0, 1, 1,
1.031105, 0.3630614, 3.173024, 0, 0, 0, 1, 1,
1.034805, -0.8106939, 2.518698, 1, 1, 1, 1, 1,
1.03592, -0.3972988, 2.232471, 1, 1, 1, 1, 1,
1.038856, 0.646971, 0.4585372, 1, 1, 1, 1, 1,
1.042319, 1.117468, 2.542555, 1, 1, 1, 1, 1,
1.042906, -0.237135, 1.692641, 1, 1, 1, 1, 1,
1.047006, 1.619816, 2.020934, 1, 1, 1, 1, 1,
1.047438, 0.5969841, 2.789349, 1, 1, 1, 1, 1,
1.047755, -1.220437, 1.733523, 1, 1, 1, 1, 1,
1.058524, 0.4399722, 2.170511, 1, 1, 1, 1, 1,
1.060666, 1.060046, -1.398893, 1, 1, 1, 1, 1,
1.063985, -2.376806, 2.268229, 1, 1, 1, 1, 1,
1.066534, -1.521177, 1.518756, 1, 1, 1, 1, 1,
1.072755, -0.8530939, 2.376222, 1, 1, 1, 1, 1,
1.077773, 1.462706, 0.1191689, 1, 1, 1, 1, 1,
1.089738, -1.417744, 1.93862, 1, 1, 1, 1, 1,
1.098874, -0.3774749, 2.699504, 0, 0, 1, 1, 1,
1.102294, -0.3728751, 1.747629, 1, 0, 0, 1, 1,
1.104707, -0.5967388, 2.579228, 1, 0, 0, 1, 1,
1.108141, -0.8006497, 2.101807, 1, 0, 0, 1, 1,
1.110008, 0.8738674, -0.3286799, 1, 0, 0, 1, 1,
1.111431, 0.5129263, 1.345082, 1, 0, 0, 1, 1,
1.117901, 1.415933, 1.725898, 0, 0, 0, 1, 1,
1.118925, 1.4078, 1.939476, 0, 0, 0, 1, 1,
1.122312, 0.2325193, 0.6579282, 0, 0, 0, 1, 1,
1.123152, 1.084486, 0.4035222, 0, 0, 0, 1, 1,
1.126198, -0.9608316, 2.016955, 0, 0, 0, 1, 1,
1.126542, 1.226091, 2.219898, 0, 0, 0, 1, 1,
1.135176, 2.759372, 1.460933, 0, 0, 0, 1, 1,
1.135799, -0.6998171, 1.317067, 1, 1, 1, 1, 1,
1.138736, 0.05016568, 1.811089, 1, 1, 1, 1, 1,
1.141112, 1.529337, 0.9492863, 1, 1, 1, 1, 1,
1.141628, -0.1748018, 0.6749528, 1, 1, 1, 1, 1,
1.141861, -0.4092473, 3.312673, 1, 1, 1, 1, 1,
1.142592, 1.683901, 0.3028736, 1, 1, 1, 1, 1,
1.146507, -2.270223, 2.165863, 1, 1, 1, 1, 1,
1.148921, 1.798682, -0.2287832, 1, 1, 1, 1, 1,
1.150515, 0.8553935, 0.3873059, 1, 1, 1, 1, 1,
1.156668, 0.04656884, 1.799397, 1, 1, 1, 1, 1,
1.158647, 1.316777, 0.2272498, 1, 1, 1, 1, 1,
1.171232, -1.454525, 2.623931, 1, 1, 1, 1, 1,
1.172535, -0.5676896, 2.362293, 1, 1, 1, 1, 1,
1.178239, 1.317243, 0.8345721, 1, 1, 1, 1, 1,
1.182313, -1.234891, 2.66027, 1, 1, 1, 1, 1,
1.193179, -0.3351232, 3.616642, 0, 0, 1, 1, 1,
1.197733, 1.186556, 2.986725, 1, 0, 0, 1, 1,
1.201279, -0.5316406, 0.9086239, 1, 0, 0, 1, 1,
1.201893, -0.7527255, 1.567937, 1, 0, 0, 1, 1,
1.209538, 0.517351, 2.089088, 1, 0, 0, 1, 1,
1.213028, -0.5128734, 3.530957, 1, 0, 0, 1, 1,
1.217613, -0.05994476, 0.08666655, 0, 0, 0, 1, 1,
1.224639, -0.5209001, 1.753646, 0, 0, 0, 1, 1,
1.225703, 0.1773269, 0.781354, 0, 0, 0, 1, 1,
1.246298, -1.017522, 3.333709, 0, 0, 0, 1, 1,
1.253987, -1.464476, 2.569535, 0, 0, 0, 1, 1,
1.257701, 0.5649657, -0.4204072, 0, 0, 0, 1, 1,
1.265795, 0.2460253, 0.9649388, 0, 0, 0, 1, 1,
1.266638, 0.4607314, 2.145111, 1, 1, 1, 1, 1,
1.277573, -1.761665, 1.083954, 1, 1, 1, 1, 1,
1.278731, -1.830633, 2.045384, 1, 1, 1, 1, 1,
1.281443, 0.6730752, 1.343098, 1, 1, 1, 1, 1,
1.285259, -0.4224569, -0.191228, 1, 1, 1, 1, 1,
1.285886, 0.04748229, 1.485178, 1, 1, 1, 1, 1,
1.304531, -0.2178832, 0.9960697, 1, 1, 1, 1, 1,
1.31005, -0.4300867, 1.911025, 1, 1, 1, 1, 1,
1.312831, -0.7344232, 1.533435, 1, 1, 1, 1, 1,
1.330662, -1.243309, 3.876317, 1, 1, 1, 1, 1,
1.336434, 1.496969, -0.1794417, 1, 1, 1, 1, 1,
1.338423, 1.23626, -0.05725177, 1, 1, 1, 1, 1,
1.36302, -0.775013, 3.052801, 1, 1, 1, 1, 1,
1.367992, 0.3286045, 4.101229, 1, 1, 1, 1, 1,
1.371518, -0.1414843, 2.294861, 1, 1, 1, 1, 1,
1.374784, -1.062172, 1.066602, 0, 0, 1, 1, 1,
1.378992, 0.4368345, 1.408693, 1, 0, 0, 1, 1,
1.37932, -1.036034, 1.369539, 1, 0, 0, 1, 1,
1.379351, 1.009482, 1.346865, 1, 0, 0, 1, 1,
1.381856, 0.9550805, 0.5745801, 1, 0, 0, 1, 1,
1.38783, 0.5538841, -0.5920627, 1, 0, 0, 1, 1,
1.434952, 1.196203, 0.2201608, 0, 0, 0, 1, 1,
1.442089, -1.35634, 2.202941, 0, 0, 0, 1, 1,
1.442329, -1.24837, 2.422889, 0, 0, 0, 1, 1,
1.445979, 0.05286052, -0.01432058, 0, 0, 0, 1, 1,
1.448892, 0.3406229, 0.6665971, 0, 0, 0, 1, 1,
1.479032, 0.2982076, 0.6998835, 0, 0, 0, 1, 1,
1.483925, 0.7637827, 0.9721774, 0, 0, 0, 1, 1,
1.505297, -0.06847351, 1.213794, 1, 1, 1, 1, 1,
1.509323, -0.9423362, 3.318187, 1, 1, 1, 1, 1,
1.520312, -0.5814688, 0.698566, 1, 1, 1, 1, 1,
1.538411, 0.8797799, 0.4460404, 1, 1, 1, 1, 1,
1.549467, 2.66305, 0.6274331, 1, 1, 1, 1, 1,
1.565454, -0.1036476, 0.7380082, 1, 1, 1, 1, 1,
1.568746, -1.283825, 3.91816, 1, 1, 1, 1, 1,
1.570967, -0.2711754, 1.500241, 1, 1, 1, 1, 1,
1.591882, 0.955857, 0.6202281, 1, 1, 1, 1, 1,
1.596162, 0.6459721, 1.557852, 1, 1, 1, 1, 1,
1.59628, 0.1251753, 1.510283, 1, 1, 1, 1, 1,
1.599131, 0.1583346, 0.6720973, 1, 1, 1, 1, 1,
1.599763, 0.9845091, 1.485547, 1, 1, 1, 1, 1,
1.6236, 1.180195, 2.413667, 1, 1, 1, 1, 1,
1.623917, -4.125983, 2.464736, 1, 1, 1, 1, 1,
1.625624, -0.8908783, 3.610683, 0, 0, 1, 1, 1,
1.636163, -0.4347875, 0.5684366, 1, 0, 0, 1, 1,
1.659568, 1.666556, 2.070402, 1, 0, 0, 1, 1,
1.681288, 2.052551, 1.733169, 1, 0, 0, 1, 1,
1.683925, 0.6576915, 1.164423, 1, 0, 0, 1, 1,
1.687837, -1.289011, 1.195692, 1, 0, 0, 1, 1,
1.703225, -0.3475547, 2.630582, 0, 0, 0, 1, 1,
1.745366, -0.1454984, 1.312394, 0, 0, 0, 1, 1,
1.764329, 0.9172865, 0.5199037, 0, 0, 0, 1, 1,
1.786001, 0.2740867, 0.9327546, 0, 0, 0, 1, 1,
1.792967, -1.461956, 3.044827, 0, 0, 0, 1, 1,
1.801443, -0.8646654, 3.413016, 0, 0, 0, 1, 1,
1.814703, 0.2824275, 1.249158, 0, 0, 0, 1, 1,
1.834137, -0.6607969, 2.477833, 1, 1, 1, 1, 1,
1.844224, 0.2279911, 1.886348, 1, 1, 1, 1, 1,
1.854982, -0.5158651, 0.8984044, 1, 1, 1, 1, 1,
1.855547, -0.4033562, 0.05315535, 1, 1, 1, 1, 1,
1.863851, 0.8253592, 2.011806, 1, 1, 1, 1, 1,
1.869757, -0.2418299, 0.2087707, 1, 1, 1, 1, 1,
1.874833, -0.8253706, 2.174124, 1, 1, 1, 1, 1,
1.880856, 0.07636907, 0.8873469, 1, 1, 1, 1, 1,
1.90769, 1.78201, 2.386178, 1, 1, 1, 1, 1,
1.976592, 0.12228, 0.3911386, 1, 1, 1, 1, 1,
1.984828, 1.418623, 2.165333, 1, 1, 1, 1, 1,
1.986256, -0.1990446, 1.440953, 1, 1, 1, 1, 1,
1.988016, 0.3119074, 1.066175, 1, 1, 1, 1, 1,
2.005026, -0.8302407, 3.033785, 1, 1, 1, 1, 1,
2.011377, -1.143145, 1.35201, 1, 1, 1, 1, 1,
2.023344, -1.539594, 2.787161, 0, 0, 1, 1, 1,
2.03073, -2.261973, 3.149625, 1, 0, 0, 1, 1,
2.031899, -0.1533855, 2.279457, 1, 0, 0, 1, 1,
2.037832, 1.676524, 0.8887995, 1, 0, 0, 1, 1,
2.06117, 2.05008, 0.1082929, 1, 0, 0, 1, 1,
2.082228, 0.1285339, 2.361554, 1, 0, 0, 1, 1,
2.135693, -0.7070577, 2.732938, 0, 0, 0, 1, 1,
2.169667, -0.4371862, 2.793889, 0, 0, 0, 1, 1,
2.326733, -1.735333, 2.597573, 0, 0, 0, 1, 1,
2.369424, 0.2338445, 1.764592, 0, 0, 0, 1, 1,
2.374998, 0.7525406, 2.038882, 0, 0, 0, 1, 1,
2.414924, 1.256339, 1.749848, 0, 0, 0, 1, 1,
2.484013, -0.6504873, 1.199293, 0, 0, 0, 1, 1,
2.535656, -1.640699, 0.9553477, 1, 1, 1, 1, 1,
2.659036, -0.2195686, 0.7069404, 1, 1, 1, 1, 1,
2.66093, -0.2034542, 1.656546, 1, 1, 1, 1, 1,
2.718825, -0.3320621, 1.027882, 1, 1, 1, 1, 1,
2.778912, 0.3718358, 2.883777, 1, 1, 1, 1, 1,
3.043917, -0.2527598, 0.7154807, 1, 1, 1, 1, 1,
3.660997, -0.5456415, -0.6281163, 1, 1, 1, 1, 1
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
var radius = 10.00308;
var distance = 35.1354;
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
mvMatrix.translate( 0.003448963, 0.5575669, -0.05747533 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.1354);
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
