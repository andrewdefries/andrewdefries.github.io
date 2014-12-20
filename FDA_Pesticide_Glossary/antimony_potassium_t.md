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
-3.6312, 0.7834917, -1.95902, 1, 0, 0, 1,
-2.696086, 0.5357087, -0.6304528, 1, 0.007843138, 0, 1,
-2.579687, -0.2008791, -2.81432, 1, 0.01176471, 0, 1,
-2.567693, 0.7774621, -2.519224, 1, 0.01960784, 0, 1,
-2.532917, -2.542952, -2.326529, 1, 0.02352941, 0, 1,
-2.496287, 0.1146284, -1.494332, 1, 0.03137255, 0, 1,
-2.39427, -0.9564641, -2.012084, 1, 0.03529412, 0, 1,
-2.376572, 0.5798128, -1.076998, 1, 0.04313726, 0, 1,
-2.360965, 0.1750112, -1.169651, 1, 0.04705882, 0, 1,
-2.360718, 0.4108712, 0.06718493, 1, 0.05490196, 0, 1,
-2.322592, -0.891128, -4.108853, 1, 0.05882353, 0, 1,
-2.307065, -1.248412, -2.780346, 1, 0.06666667, 0, 1,
-2.259722, 0.4944338, -3.087327, 1, 0.07058824, 0, 1,
-2.258519, 1.856214, -0.1908365, 1, 0.07843138, 0, 1,
-2.249336, -0.2320472, -1.301391, 1, 0.08235294, 0, 1,
-2.216645, 1.265168, -0.563949, 1, 0.09019608, 0, 1,
-2.145098, -0.2974849, -2.58833, 1, 0.09411765, 0, 1,
-2.14303, -2.054088, -2.809233, 1, 0.1019608, 0, 1,
-2.142549, 0.6063785, -1.387823, 1, 0.1098039, 0, 1,
-2.130332, 2.065968, -1.288056, 1, 0.1137255, 0, 1,
-2.124102, 0.7443063, -0.6359591, 1, 0.1215686, 0, 1,
-2.100818, -0.08090963, -1.730422, 1, 0.1254902, 0, 1,
-2.086005, -0.192491, -2.842051, 1, 0.1333333, 0, 1,
-2.047854, 0.8000302, -3.191596, 1, 0.1372549, 0, 1,
-1.983647, -0.06262848, -0.2304576, 1, 0.145098, 0, 1,
-1.973763, -0.6078808, -1.872473, 1, 0.1490196, 0, 1,
-1.945754, -0.4455438, -1.275937, 1, 0.1568628, 0, 1,
-1.937783, 1.785791, -0.7238104, 1, 0.1607843, 0, 1,
-1.933252, -0.4515266, -1.295996, 1, 0.1686275, 0, 1,
-1.917689, 3.22481, -0.003167251, 1, 0.172549, 0, 1,
-1.917059, -1.968898, -1.430061, 1, 0.1803922, 0, 1,
-1.893128, -1.323997, -1.526597, 1, 0.1843137, 0, 1,
-1.864797, -1.625298, -0.4731207, 1, 0.1921569, 0, 1,
-1.843391, 0.6591116, -2.560012, 1, 0.1960784, 0, 1,
-1.812419, 1.608936, 0.7353177, 1, 0.2039216, 0, 1,
-1.780783, 0.4437516, 0.07087383, 1, 0.2117647, 0, 1,
-1.767029, 1.461096, -1.817357, 1, 0.2156863, 0, 1,
-1.766735, 0.130575, -3.541974, 1, 0.2235294, 0, 1,
-1.763248, 1.100274, -2.178379, 1, 0.227451, 0, 1,
-1.753117, -1.62626, -4.420191, 1, 0.2352941, 0, 1,
-1.746846, -0.5092394, -0.7927069, 1, 0.2392157, 0, 1,
-1.730151, 0.597441, -1.646625, 1, 0.2470588, 0, 1,
-1.694759, -1.261593, -0.5780152, 1, 0.2509804, 0, 1,
-1.685299, 0.479399, -0.3651225, 1, 0.2588235, 0, 1,
-1.673062, 0.5892948, -1.262735, 1, 0.2627451, 0, 1,
-1.667006, 0.6682809, 0.7286218, 1, 0.2705882, 0, 1,
-1.658687, -0.464444, -1.837767, 1, 0.2745098, 0, 1,
-1.652329, 0.7867147, -1.001205, 1, 0.282353, 0, 1,
-1.647895, 0.3581135, -1.676465, 1, 0.2862745, 0, 1,
-1.647438, -0.1967357, -1.198561, 1, 0.2941177, 0, 1,
-1.632467, 0.5710368, -1.017915, 1, 0.3019608, 0, 1,
-1.618617, 0.6640356, 0.04069627, 1, 0.3058824, 0, 1,
-1.614129, -0.8851564, -0.06393924, 1, 0.3137255, 0, 1,
-1.611298, -0.4601048, -0.8030986, 1, 0.3176471, 0, 1,
-1.58911, 0.02441182, -2.101566, 1, 0.3254902, 0, 1,
-1.578068, 0.5000859, -0.5806504, 1, 0.3294118, 0, 1,
-1.564402, -1.462813, -2.961331, 1, 0.3372549, 0, 1,
-1.543068, -0.852309, -2.291006, 1, 0.3411765, 0, 1,
-1.538343, -1.385895, -2.000674, 1, 0.3490196, 0, 1,
-1.537114, -0.5107107, -1.842286, 1, 0.3529412, 0, 1,
-1.529366, -0.7221155, -2.713948, 1, 0.3607843, 0, 1,
-1.524811, -0.7207803, -2.164143, 1, 0.3647059, 0, 1,
-1.515118, 1.214585, -1.05851, 1, 0.372549, 0, 1,
-1.509597, -1.546522, -2.840454, 1, 0.3764706, 0, 1,
-1.507888, 0.1202445, -1.494092, 1, 0.3843137, 0, 1,
-1.485618, 1.311093, 0.1074979, 1, 0.3882353, 0, 1,
-1.478642, 1.540869, 0.7878119, 1, 0.3960784, 0, 1,
-1.478147, 0.03561784, -0.9321378, 1, 0.4039216, 0, 1,
-1.472377, 0.2332151, -1.451929, 1, 0.4078431, 0, 1,
-1.463328, 2.129906, -2.332437, 1, 0.4156863, 0, 1,
-1.460412, -0.3604306, -1.313107, 1, 0.4196078, 0, 1,
-1.456595, 1.204354, 0.2013944, 1, 0.427451, 0, 1,
-1.452248, -0.794616, -2.479498, 1, 0.4313726, 0, 1,
-1.451933, -2.205346, -1.416573, 1, 0.4392157, 0, 1,
-1.450245, -0.7026728, -2.663602, 1, 0.4431373, 0, 1,
-1.447245, -0.3034211, -1.285918, 1, 0.4509804, 0, 1,
-1.439394, 0.006894551, -2.458993, 1, 0.454902, 0, 1,
-1.415971, 0.6724755, -1.080717, 1, 0.4627451, 0, 1,
-1.403963, 0.3168806, -0.5047031, 1, 0.4666667, 0, 1,
-1.401295, 1.222939, 0.5364172, 1, 0.4745098, 0, 1,
-1.394267, -0.4745318, -2.910084, 1, 0.4784314, 0, 1,
-1.393348, 0.3686177, -0.8757578, 1, 0.4862745, 0, 1,
-1.374474, -0.1715111, 0.2342448, 1, 0.4901961, 0, 1,
-1.364506, -0.5918609, -1.443946, 1, 0.4980392, 0, 1,
-1.353745, 0.3662142, -1.902296, 1, 0.5058824, 0, 1,
-1.350898, -1.537437, -3.081895, 1, 0.509804, 0, 1,
-1.335966, 0.4694867, 0.9413763, 1, 0.5176471, 0, 1,
-1.322773, -1.438194, -3.916681, 1, 0.5215687, 0, 1,
-1.306957, 1.472438, -0.3573729, 1, 0.5294118, 0, 1,
-1.30682, -0.1344102, -2.131912, 1, 0.5333334, 0, 1,
-1.306338, -0.7896913, -1.114082, 1, 0.5411765, 0, 1,
-1.304673, -0.8836241, -4.032152, 1, 0.5450981, 0, 1,
-1.304041, 0.9868535, -0.975952, 1, 0.5529412, 0, 1,
-1.299271, -0.7457819, -0.5201992, 1, 0.5568628, 0, 1,
-1.295952, -0.5461274, -2.502737, 1, 0.5647059, 0, 1,
-1.292214, -0.3497264, -1.170086, 1, 0.5686275, 0, 1,
-1.286351, -0.3381687, -2.677246, 1, 0.5764706, 0, 1,
-1.284389, -0.2381831, -2.955197, 1, 0.5803922, 0, 1,
-1.274016, 1.839181, -2.268237, 1, 0.5882353, 0, 1,
-1.269685, -0.9361546, -1.874524, 1, 0.5921569, 0, 1,
-1.266607, -0.5608689, -1.955168, 1, 0.6, 0, 1,
-1.264451, -0.4719816, -2.037571, 1, 0.6078432, 0, 1,
-1.264108, 0.0851402, -1.841864, 1, 0.6117647, 0, 1,
-1.262865, 1.882396, -0.4352903, 1, 0.6196079, 0, 1,
-1.255108, 0.2937361, 1.076885, 1, 0.6235294, 0, 1,
-1.248607, -1.7652, -4.298221, 1, 0.6313726, 0, 1,
-1.246912, 0.2371873, -1.014645, 1, 0.6352941, 0, 1,
-1.244994, 0.5334507, -1.671223, 1, 0.6431373, 0, 1,
-1.244554, -3.16985, -4.137101, 1, 0.6470588, 0, 1,
-1.244433, 0.0611757, -0.9119462, 1, 0.654902, 0, 1,
-1.238397, -0.7548285, -3.278848, 1, 0.6588235, 0, 1,
-1.230471, -0.7590213, -4.303273, 1, 0.6666667, 0, 1,
-1.228434, -1.608535, -2.369887, 1, 0.6705883, 0, 1,
-1.227177, 1.202638, -1.003834, 1, 0.6784314, 0, 1,
-1.222875, -0.8305637, -2.181739, 1, 0.682353, 0, 1,
-1.22212, 0.5279424, -0.6402925, 1, 0.6901961, 0, 1,
-1.220513, 1.860863, -0.2079563, 1, 0.6941177, 0, 1,
-1.22015, -0.4346046, -1.851682, 1, 0.7019608, 0, 1,
-1.214026, 0.4442803, -0.8366652, 1, 0.7098039, 0, 1,
-1.213602, -1.707617, -4.463463, 1, 0.7137255, 0, 1,
-1.213119, -1.476884, -2.345786, 1, 0.7215686, 0, 1,
-1.213079, 0.9387969, -0.1878713, 1, 0.7254902, 0, 1,
-1.210141, 1.466677, 0.04452954, 1, 0.7333333, 0, 1,
-1.204525, -0.8288819, 0.1078025, 1, 0.7372549, 0, 1,
-1.19567, 1.688631, -1.49816, 1, 0.7450981, 0, 1,
-1.193108, 0.7251896, 0.8110863, 1, 0.7490196, 0, 1,
-1.187496, 0.9445304, -0.9445295, 1, 0.7568628, 0, 1,
-1.186777, -0.2989761, -1.581202, 1, 0.7607843, 0, 1,
-1.180778, -0.2520878, -2.458472, 1, 0.7686275, 0, 1,
-1.177864, -0.1211824, -2.434831, 1, 0.772549, 0, 1,
-1.177091, -1.957021, -1.482429, 1, 0.7803922, 0, 1,
-1.175712, 1.52206, -2.111597, 1, 0.7843137, 0, 1,
-1.175195, -1.253748, -2.089445, 1, 0.7921569, 0, 1,
-1.169808, -1.973869, -3.545456, 1, 0.7960784, 0, 1,
-1.154516, -0.8004925, -2.148538, 1, 0.8039216, 0, 1,
-1.153752, 1.773228, -0.4297818, 1, 0.8117647, 0, 1,
-1.149697, -0.1672151, -1.427252, 1, 0.8156863, 0, 1,
-1.14529, -0.3262328, 0.3863975, 1, 0.8235294, 0, 1,
-1.143283, -0.2596585, -1.509223, 1, 0.827451, 0, 1,
-1.128047, 1.82394, -0.1938433, 1, 0.8352941, 0, 1,
-1.125202, -0.4670054, -1.510302, 1, 0.8392157, 0, 1,
-1.123762, -0.5787086, -2.663989, 1, 0.8470588, 0, 1,
-1.113173, -2.293091, -2.181422, 1, 0.8509804, 0, 1,
-1.096709, 0.7275752, -1.418183, 1, 0.8588235, 0, 1,
-1.093714, -0.7575107, -3.428561, 1, 0.8627451, 0, 1,
-1.092342, -1.609558, -1.939941, 1, 0.8705882, 0, 1,
-1.082503, 0.8137426, -1.372627, 1, 0.8745098, 0, 1,
-1.075115, 0.007780923, -1.857868, 1, 0.8823529, 0, 1,
-1.069726, -0.1340695, -2.783318, 1, 0.8862745, 0, 1,
-1.066751, -0.3147332, -1.138081, 1, 0.8941177, 0, 1,
-1.057747, -0.5110335, -1.887891, 1, 0.8980392, 0, 1,
-1.051649, -0.6562378, -3.793338, 1, 0.9058824, 0, 1,
-1.050268, -0.6753937, -1.804105, 1, 0.9137255, 0, 1,
-1.048607, -0.9443902, -5.431084, 1, 0.9176471, 0, 1,
-1.044131, -0.6040859, -1.982829, 1, 0.9254902, 0, 1,
-1.043893, 0.1323983, -3.219317, 1, 0.9294118, 0, 1,
-1.038424, -0.7734752, -3.681998, 1, 0.9372549, 0, 1,
-1.035396, -0.09577762, -1.784679, 1, 0.9411765, 0, 1,
-1.032105, -0.5494164, -2.823457, 1, 0.9490196, 0, 1,
-1.03164, -1.439481, -1.999254, 1, 0.9529412, 0, 1,
-1.029306, -1.854179, -2.46641, 1, 0.9607843, 0, 1,
-1.028063, 1.911464, 0.01219014, 1, 0.9647059, 0, 1,
-1.025917, 1.697993, -2.31073, 1, 0.972549, 0, 1,
-1.021683, -0.6607653, -1.31947, 1, 0.9764706, 0, 1,
-1.0196, -2.039935, -2.704744, 1, 0.9843137, 0, 1,
-1.01267, -1.8052, -4.775754, 1, 0.9882353, 0, 1,
-1.011309, 2.334893, -2.579345, 1, 0.9960784, 0, 1,
-0.9986142, 1.703684, -1.76203, 0.9960784, 1, 0, 1,
-0.995149, 0.1997899, -0.7897757, 0.9921569, 1, 0, 1,
-0.9896101, -0.7940644, -0.4283491, 0.9843137, 1, 0, 1,
-0.9892767, 0.6743775, -1.552427, 0.9803922, 1, 0, 1,
-0.9861537, -1.098389, -0.603887, 0.972549, 1, 0, 1,
-0.9706379, 0.3938151, -1.924191, 0.9686275, 1, 0, 1,
-0.9684868, -1.234977, -1.617893, 0.9607843, 1, 0, 1,
-0.9662412, -0.5765858, -2.324796, 0.9568627, 1, 0, 1,
-0.9646679, -0.7746924, -1.888117, 0.9490196, 1, 0, 1,
-0.9623345, -1.276383, -2.519631, 0.945098, 1, 0, 1,
-0.9566625, 0.6275119, -0.8368434, 0.9372549, 1, 0, 1,
-0.9531116, 1.474015, -0.02866775, 0.9333333, 1, 0, 1,
-0.9495466, -0.7507019, -3.297847, 0.9254902, 1, 0, 1,
-0.9457142, 1.303218, -1.088586, 0.9215686, 1, 0, 1,
-0.9440314, -0.5795698, -2.852003, 0.9137255, 1, 0, 1,
-0.9419653, 1.178196, -0.5027632, 0.9098039, 1, 0, 1,
-0.9385237, -0.1644377, 0.006121576, 0.9019608, 1, 0, 1,
-0.9273028, -0.4405847, -2.258774, 0.8941177, 1, 0, 1,
-0.9263411, 0.8070667, -1.652532, 0.8901961, 1, 0, 1,
-0.9178551, -3.37873, -2.901108, 0.8823529, 1, 0, 1,
-0.9157269, -0.358551, -1.294155, 0.8784314, 1, 0, 1,
-0.9153076, -2.217654, -2.252077, 0.8705882, 1, 0, 1,
-0.9133073, 0.01593666, -0.9244955, 0.8666667, 1, 0, 1,
-0.9130071, 0.4219974, 0.1497549, 0.8588235, 1, 0, 1,
-0.9111974, -0.8817333, -2.249386, 0.854902, 1, 0, 1,
-0.9101443, -0.06544442, -1.349078, 0.8470588, 1, 0, 1,
-0.9082283, 0.2884524, -2.203342, 0.8431373, 1, 0, 1,
-0.906742, -0.8293732, -2.571487, 0.8352941, 1, 0, 1,
-0.9062154, 0.09704479, -1.653159, 0.8313726, 1, 0, 1,
-0.9059979, 0.2295354, -1.315744, 0.8235294, 1, 0, 1,
-0.8907009, 0.4908184, -0.2479595, 0.8196079, 1, 0, 1,
-0.8882701, -0.1974875, -2.508889, 0.8117647, 1, 0, 1,
-0.8852186, 0.476948, 0.2869082, 0.8078431, 1, 0, 1,
-0.8839699, -0.1948809, -1.432166, 0.8, 1, 0, 1,
-0.8817373, -2.875043, -4.097996, 0.7921569, 1, 0, 1,
-0.8811127, -0.07193229, -0.8674915, 0.7882353, 1, 0, 1,
-0.8747563, -0.9264526, -1.354261, 0.7803922, 1, 0, 1,
-0.874074, -0.4781414, -0.6318442, 0.7764706, 1, 0, 1,
-0.8690279, -0.05585788, -2.205494, 0.7686275, 1, 0, 1,
-0.8648589, -1.727391, -4.460124, 0.7647059, 1, 0, 1,
-0.8597348, -0.2273211, -2.254791, 0.7568628, 1, 0, 1,
-0.846608, -0.9835194, -3.497719, 0.7529412, 1, 0, 1,
-0.8458872, -0.3476454, -1.12517, 0.7450981, 1, 0, 1,
-0.8454168, -0.6619268, -2.170148, 0.7411765, 1, 0, 1,
-0.8452461, 0.9314348, 0.2375436, 0.7333333, 1, 0, 1,
-0.8440762, 0.1161266, -1.143897, 0.7294118, 1, 0, 1,
-0.8416703, -0.8230813, -2.780822, 0.7215686, 1, 0, 1,
-0.8399649, -0.7217622, -3.646827, 0.7176471, 1, 0, 1,
-0.8372473, 1.672479, 0.6138129, 0.7098039, 1, 0, 1,
-0.8370775, -0.9596947, -1.760283, 0.7058824, 1, 0, 1,
-0.8313153, 0.5418332, -1.124694, 0.6980392, 1, 0, 1,
-0.8306012, -1.357047, -3.141421, 0.6901961, 1, 0, 1,
-0.8273617, 1.421591, 1.085878, 0.6862745, 1, 0, 1,
-0.8164371, 0.9068028, 0.8521916, 0.6784314, 1, 0, 1,
-0.8109415, -0.1861887, -3.864821, 0.6745098, 1, 0, 1,
-0.8063465, 1.480051, -0.8171267, 0.6666667, 1, 0, 1,
-0.8050202, 1.461192, 1.021462, 0.6627451, 1, 0, 1,
-0.7980275, 1.486012, -0.6617234, 0.654902, 1, 0, 1,
-0.7954804, -1.112877, -3.378994, 0.6509804, 1, 0, 1,
-0.7934297, 0.75666, -0.05556576, 0.6431373, 1, 0, 1,
-0.7866875, -0.3455257, -0.1157269, 0.6392157, 1, 0, 1,
-0.7864618, -1.395408, -2.682165, 0.6313726, 1, 0, 1,
-0.7837663, 0.1211169, -0.01485914, 0.627451, 1, 0, 1,
-0.7833322, -0.7865207, -1.193555, 0.6196079, 1, 0, 1,
-0.7797524, -1.95349, -4.499986, 0.6156863, 1, 0, 1,
-0.7697039, 0.1694218, -1.685976, 0.6078432, 1, 0, 1,
-0.769621, 1.073751, -0.6063219, 0.6039216, 1, 0, 1,
-0.7661148, -0.4099987, -2.934258, 0.5960785, 1, 0, 1,
-0.7618914, -1.689299, -3.550632, 0.5882353, 1, 0, 1,
-0.757942, 0.1780945, -0.3046278, 0.5843138, 1, 0, 1,
-0.7563024, -0.951462, -3.15185, 0.5764706, 1, 0, 1,
-0.7514409, -0.3272423, -3.431854, 0.572549, 1, 0, 1,
-0.7490514, 0.8604158, -1.041745, 0.5647059, 1, 0, 1,
-0.7488655, 0.7735007, -0.2741775, 0.5607843, 1, 0, 1,
-0.7466543, 0.009551038, -0.1286565, 0.5529412, 1, 0, 1,
-0.7427972, 1.693786, 0.3177362, 0.5490196, 1, 0, 1,
-0.7377971, -1.295551, -2.492591, 0.5411765, 1, 0, 1,
-0.7361791, -0.626677, -1.232306, 0.5372549, 1, 0, 1,
-0.7360783, -0.3463104, -3.002445, 0.5294118, 1, 0, 1,
-0.7334373, -0.6915247, -3.055433, 0.5254902, 1, 0, 1,
-0.7326132, 0.3341664, -1.507797, 0.5176471, 1, 0, 1,
-0.7298498, -1.040888, -0.6995149, 0.5137255, 1, 0, 1,
-0.7286005, -0.4995548, -2.035309, 0.5058824, 1, 0, 1,
-0.727896, 0.040146, -2.667768, 0.5019608, 1, 0, 1,
-0.7204888, -0.6057135, -3.007692, 0.4941176, 1, 0, 1,
-0.7194383, -1.108112, -3.466414, 0.4862745, 1, 0, 1,
-0.7159631, 0.2498206, -1.489168, 0.4823529, 1, 0, 1,
-0.7154775, -1.233538, -3.676813, 0.4745098, 1, 0, 1,
-0.7143741, -1.233596, -2.473038, 0.4705882, 1, 0, 1,
-0.7123245, -0.6960012, -2.267565, 0.4627451, 1, 0, 1,
-0.7102677, 2.308858, -1.077153, 0.4588235, 1, 0, 1,
-0.7081953, 0.5512807, 0.0293981, 0.4509804, 1, 0, 1,
-0.7051525, -1.424708, -3.128082, 0.4470588, 1, 0, 1,
-0.7016346, -1.109144, -2.901913, 0.4392157, 1, 0, 1,
-0.6961002, -0.5059095, -0.9071321, 0.4352941, 1, 0, 1,
-0.6903509, 0.6995186, 0.6993635, 0.427451, 1, 0, 1,
-0.6883891, 0.7166494, -1.011454, 0.4235294, 1, 0, 1,
-0.688082, -0.7591907, -3.712326, 0.4156863, 1, 0, 1,
-0.6843758, -0.4584832, -1.693699, 0.4117647, 1, 0, 1,
-0.6842479, 0.3016281, -2.803027, 0.4039216, 1, 0, 1,
-0.6839823, -0.2665794, -1.746002, 0.3960784, 1, 0, 1,
-0.6724125, 1.492877, -0.626731, 0.3921569, 1, 0, 1,
-0.6711272, 1.465637, -0.9419425, 0.3843137, 1, 0, 1,
-0.6710715, 2.408167, -0.6758915, 0.3803922, 1, 0, 1,
-0.6593738, 0.6740258, -2.301899, 0.372549, 1, 0, 1,
-0.6559173, 0.3472642, -1.876385, 0.3686275, 1, 0, 1,
-0.6531864, -0.6456634, -3.201056, 0.3607843, 1, 0, 1,
-0.6496819, -1.12826, -2.590944, 0.3568628, 1, 0, 1,
-0.6455569, -0.5803764, -0.507076, 0.3490196, 1, 0, 1,
-0.6374704, -0.1323749, -1.474134, 0.345098, 1, 0, 1,
-0.6314074, -0.06848843, -2.977982, 0.3372549, 1, 0, 1,
-0.630962, -0.01885387, -0.3751554, 0.3333333, 1, 0, 1,
-0.6296818, -0.4900591, -1.778591, 0.3254902, 1, 0, 1,
-0.627759, -0.1182693, -4.028141, 0.3215686, 1, 0, 1,
-0.621949, 1.205245, 0.5572727, 0.3137255, 1, 0, 1,
-0.6204726, -0.1634632, -2.722278, 0.3098039, 1, 0, 1,
-0.6203898, -1.556521, -1.570391, 0.3019608, 1, 0, 1,
-0.6125205, 0.5683114, -0.05299786, 0.2941177, 1, 0, 1,
-0.6119241, -1.020704, -1.507205, 0.2901961, 1, 0, 1,
-0.6081798, -0.4456128, -1.124658, 0.282353, 1, 0, 1,
-0.6039372, 0.7767181, -0.6836637, 0.2784314, 1, 0, 1,
-0.5986833, 0.8649247, -1.042786, 0.2705882, 1, 0, 1,
-0.5933664, -0.1476653, -2.933291, 0.2666667, 1, 0, 1,
-0.5919401, 0.9721432, 0.5972662, 0.2588235, 1, 0, 1,
-0.589394, 2.346894, -0.1933426, 0.254902, 1, 0, 1,
-0.5876629, -1.840911, -2.95003, 0.2470588, 1, 0, 1,
-0.5873476, 0.09209466, -2.042489, 0.2431373, 1, 0, 1,
-0.5872483, -0.6166101, -2.346738, 0.2352941, 1, 0, 1,
-0.5870823, 1.236999, -1.141189, 0.2313726, 1, 0, 1,
-0.581436, -0.7168033, -3.06661, 0.2235294, 1, 0, 1,
-0.581192, 1.182181, -0.3485906, 0.2196078, 1, 0, 1,
-0.5807946, 2.136345, 0.01924656, 0.2117647, 1, 0, 1,
-0.580175, -0.2102335, -3.50835, 0.2078431, 1, 0, 1,
-0.5784512, -0.227276, -0.8174671, 0.2, 1, 0, 1,
-0.5775729, 0.7604785, -1.970465, 0.1921569, 1, 0, 1,
-0.5746152, 0.7391315, -0.09246084, 0.1882353, 1, 0, 1,
-0.5633444, -1.395948, -2.025515, 0.1803922, 1, 0, 1,
-0.5633078, 0.1779261, 0.2285197, 0.1764706, 1, 0, 1,
-0.5619966, 0.3683866, -0.2280885, 0.1686275, 1, 0, 1,
-0.5571458, 0.1835345, -0.9356741, 0.1647059, 1, 0, 1,
-0.5550423, 0.8223348, -1.001798, 0.1568628, 1, 0, 1,
-0.5531967, 1.793639, -0.3039639, 0.1529412, 1, 0, 1,
-0.5516088, -1.401739, -3.645724, 0.145098, 1, 0, 1,
-0.5463629, 0.3791391, -0.820465, 0.1411765, 1, 0, 1,
-0.5424304, 0.1438498, -2.28879, 0.1333333, 1, 0, 1,
-0.5401741, -0.1470537, -1.847129, 0.1294118, 1, 0, 1,
-0.5369561, -1.317507, -2.792293, 0.1215686, 1, 0, 1,
-0.5344112, -1.309847, -2.473897, 0.1176471, 1, 0, 1,
-0.5327626, -1.095849, -2.208301, 0.1098039, 1, 0, 1,
-0.5276362, -0.1935431, -0.6604189, 0.1058824, 1, 0, 1,
-0.5170072, 0.4578524, 0.4705874, 0.09803922, 1, 0, 1,
-0.5115074, -0.65964, -4.352872, 0.09019608, 1, 0, 1,
-0.5003147, 0.516955, -1.926063, 0.08627451, 1, 0, 1,
-0.4910412, -2.195944, -1.990101, 0.07843138, 1, 0, 1,
-0.49069, 1.099047, -0.5009045, 0.07450981, 1, 0, 1,
-0.4896993, 0.9486237, 0.319575, 0.06666667, 1, 0, 1,
-0.4880552, -0.01000313, -1.269063, 0.0627451, 1, 0, 1,
-0.4856966, -0.467567, -0.9702004, 0.05490196, 1, 0, 1,
-0.4855922, 1.124479, 0.2702398, 0.05098039, 1, 0, 1,
-0.4851441, 0.1186397, -2.889165, 0.04313726, 1, 0, 1,
-0.4826266, -0.3439653, -2.860213, 0.03921569, 1, 0, 1,
-0.4799084, -0.1755489, -2.929037, 0.03137255, 1, 0, 1,
-0.478056, -0.201814, -0.7567561, 0.02745098, 1, 0, 1,
-0.4778613, 0.9027639, -0.8493239, 0.01960784, 1, 0, 1,
-0.4724237, -0.4812831, -1.87838, 0.01568628, 1, 0, 1,
-0.4682682, 0.6443269, -1.002814, 0.007843138, 1, 0, 1,
-0.467542, 0.9129336, -0.9768677, 0.003921569, 1, 0, 1,
-0.4643205, 0.3385684, 0.009031382, 0, 1, 0.003921569, 1,
-0.4584118, 0.4316132, -1.979426, 0, 1, 0.01176471, 1,
-0.4570566, -0.06132722, -2.654796, 0, 1, 0.01568628, 1,
-0.4562499, -0.5805629, -4.481057, 0, 1, 0.02352941, 1,
-0.454896, 0.1636539, -0.3288601, 0, 1, 0.02745098, 1,
-0.4509607, -0.6735156, -0.671544, 0, 1, 0.03529412, 1,
-0.4507104, 1.013455, 0.1645563, 0, 1, 0.03921569, 1,
-0.4465165, 0.1771072, -1.274845, 0, 1, 0.04705882, 1,
-0.4404186, 1.172001, -0.2176246, 0, 1, 0.05098039, 1,
-0.4380186, 0.2703548, -1.208256, 0, 1, 0.05882353, 1,
-0.4342726, 0.1878595, -0.04600982, 0, 1, 0.0627451, 1,
-0.4312764, 0.3529504, -2.074063, 0, 1, 0.07058824, 1,
-0.4308154, -1.091864, -3.307915, 0, 1, 0.07450981, 1,
-0.4302313, 0.2782006, -1.129036, 0, 1, 0.08235294, 1,
-0.4287997, 0.2994593, -1.870292, 0, 1, 0.08627451, 1,
-0.4233841, 0.3837326, -0.6091008, 0, 1, 0.09411765, 1,
-0.4189637, -1.341437, -3.213883, 0, 1, 0.1019608, 1,
-0.40827, -0.5240991, -3.088536, 0, 1, 0.1058824, 1,
-0.4070832, 2.193195, -1.56438, 0, 1, 0.1137255, 1,
-0.4054031, 0.6043414, 0.9218513, 0, 1, 0.1176471, 1,
-0.4046474, 0.5089212, -1.216732, 0, 1, 0.1254902, 1,
-0.4019031, 1.057472, -0.7842457, 0, 1, 0.1294118, 1,
-0.3948151, 0.274332, -2.43255, 0, 1, 0.1372549, 1,
-0.3936004, 0.2599295, -0.3065394, 0, 1, 0.1411765, 1,
-0.3932365, 0.3745676, -1.548182, 0, 1, 0.1490196, 1,
-0.3873335, 1.201534, 0.907429, 0, 1, 0.1529412, 1,
-0.3844953, -2.244017, -2.973674, 0, 1, 0.1607843, 1,
-0.3834587, -0.1781303, -2.479443, 0, 1, 0.1647059, 1,
-0.3816864, -0.8120436, -3.586316, 0, 1, 0.172549, 1,
-0.3795697, 0.2839689, -0.3236023, 0, 1, 0.1764706, 1,
-0.3740735, 0.2557448, -1.031414, 0, 1, 0.1843137, 1,
-0.3730824, 1.667222, 1.727508, 0, 1, 0.1882353, 1,
-0.3729422, 2.026679, -0.5439566, 0, 1, 0.1960784, 1,
-0.371347, -0.7938396, -1.620941, 0, 1, 0.2039216, 1,
-0.3660401, -1.136584, -2.351467, 0, 1, 0.2078431, 1,
-0.3629106, -0.3106335, -1.154031, 0, 1, 0.2156863, 1,
-0.3592895, 0.73027, -0.793535, 0, 1, 0.2196078, 1,
-0.3576825, -0.9261391, -2.730992, 0, 1, 0.227451, 1,
-0.3573999, -1.265312, -1.814711, 0, 1, 0.2313726, 1,
-0.3552287, 0.6788865, 0.5499097, 0, 1, 0.2392157, 1,
-0.3552279, 0.03931105, -1.262818, 0, 1, 0.2431373, 1,
-0.3503179, -1.220581, -3.844831, 0, 1, 0.2509804, 1,
-0.3493662, 1.901715, -0.7180415, 0, 1, 0.254902, 1,
-0.3472514, -0.9277337, -2.581274, 0, 1, 0.2627451, 1,
-0.3403337, 0.2391685, -0.3495582, 0, 1, 0.2666667, 1,
-0.3390051, -1.916004, -2.018123, 0, 1, 0.2745098, 1,
-0.3362238, -0.1736616, -0.8180045, 0, 1, 0.2784314, 1,
-0.335741, 0.8153724, 0.1281249, 0, 1, 0.2862745, 1,
-0.3355591, 1.569739, -1.144112, 0, 1, 0.2901961, 1,
-0.3322257, -1.850003, -1.232973, 0, 1, 0.2980392, 1,
-0.3306307, -1.285271, -3.284308, 0, 1, 0.3058824, 1,
-0.330157, 0.2578833, -3.179434, 0, 1, 0.3098039, 1,
-0.328339, 0.4820092, -1.568477, 0, 1, 0.3176471, 1,
-0.3278487, 0.9221462, 1.236311, 0, 1, 0.3215686, 1,
-0.3232769, 0.515761, -0.6737289, 0, 1, 0.3294118, 1,
-0.3198011, -0.8029476, -3.301414, 0, 1, 0.3333333, 1,
-0.3194444, 0.9771658, 0.3169256, 0, 1, 0.3411765, 1,
-0.318255, 0.2463441, -3.039085, 0, 1, 0.345098, 1,
-0.3160162, 0.3886276, -0.5700518, 0, 1, 0.3529412, 1,
-0.3137697, 0.5823491, 0.1670251, 0, 1, 0.3568628, 1,
-0.3086764, 0.3199656, -0.3945741, 0, 1, 0.3647059, 1,
-0.306662, 1.994036, 1.615192, 0, 1, 0.3686275, 1,
-0.306349, 0.08569903, -0.8907635, 0, 1, 0.3764706, 1,
-0.3049593, 0.6624184, -1.017317, 0, 1, 0.3803922, 1,
-0.2976065, 0.02547642, -2.352284, 0, 1, 0.3882353, 1,
-0.2969444, -0.3563907, -3.82022, 0, 1, 0.3921569, 1,
-0.2914623, -0.5696218, -2.266215, 0, 1, 0.4, 1,
-0.2859357, 0.4211648, -0.4867615, 0, 1, 0.4078431, 1,
-0.2803921, -0.1052659, -0.8914088, 0, 1, 0.4117647, 1,
-0.2795666, 1.163204, -0.2024941, 0, 1, 0.4196078, 1,
-0.2733071, -1.626241, -3.032545, 0, 1, 0.4235294, 1,
-0.2681446, -0.6598142, -4.892238, 0, 1, 0.4313726, 1,
-0.2661932, -0.5061178, -4.270362, 0, 1, 0.4352941, 1,
-0.2653411, 0.473709, -1.120113, 0, 1, 0.4431373, 1,
-0.2639849, -0.5398313, -3.867762, 0, 1, 0.4470588, 1,
-0.2630438, -0.06533057, -2.573485, 0, 1, 0.454902, 1,
-0.2624353, 2.677989, -1.467417, 0, 1, 0.4588235, 1,
-0.2574446, -0.2019602, -1.222343, 0, 1, 0.4666667, 1,
-0.2565743, -1.633262, -2.354181, 0, 1, 0.4705882, 1,
-0.2564758, -0.9429927, -2.498765, 0, 1, 0.4784314, 1,
-0.2524136, 1.759002, -1.802635, 0, 1, 0.4823529, 1,
-0.2517247, -0.3984404, -1.497223, 0, 1, 0.4901961, 1,
-0.2506606, 0.9723709, -0.8036557, 0, 1, 0.4941176, 1,
-0.2432404, 1.166539, 0.6654315, 0, 1, 0.5019608, 1,
-0.2421947, -1.614093, -3.163332, 0, 1, 0.509804, 1,
-0.2397189, -0.5102566, -1.567492, 0, 1, 0.5137255, 1,
-0.2388902, 0.367172, -0.3734902, 0, 1, 0.5215687, 1,
-0.2368099, 1.057257, -0.2901809, 0, 1, 0.5254902, 1,
-0.2361804, -1.235906, -4.560606, 0, 1, 0.5333334, 1,
-0.2359529, 0.6036163, -0.6504945, 0, 1, 0.5372549, 1,
-0.235371, -0.5768594, -1.494956, 0, 1, 0.5450981, 1,
-0.2341689, 0.9463979, -0.2641413, 0, 1, 0.5490196, 1,
-0.2338984, 1.665691, -2.29336, 0, 1, 0.5568628, 1,
-0.2300604, -2.02138, -4.001165, 0, 1, 0.5607843, 1,
-0.2285138, -0.5056292, -1.436564, 0, 1, 0.5686275, 1,
-0.2256082, 0.05825599, -0.5542842, 0, 1, 0.572549, 1,
-0.2251946, -0.4966882, -2.373137, 0, 1, 0.5803922, 1,
-0.2218293, -0.1324895, -2.644133, 0, 1, 0.5843138, 1,
-0.2187475, 0.5631364, -0.3186171, 0, 1, 0.5921569, 1,
-0.216213, 0.4801984, -1.737632, 0, 1, 0.5960785, 1,
-0.2154319, 1.099232, -1.572692, 0, 1, 0.6039216, 1,
-0.2123603, -1.496632, -3.088344, 0, 1, 0.6117647, 1,
-0.2086063, 1.173488, -1.415323, 0, 1, 0.6156863, 1,
-0.2082016, 0.2577425, -0.4675478, 0, 1, 0.6235294, 1,
-0.2068547, 1.397292, -0.3289484, 0, 1, 0.627451, 1,
-0.2039595, 0.4628792, -1.775313, 0, 1, 0.6352941, 1,
-0.2023553, -0.8046132, -2.751598, 0, 1, 0.6392157, 1,
-0.2005937, 0.4633049, -0.6793756, 0, 1, 0.6470588, 1,
-0.1959439, 0.1021056, 0.003209591, 0, 1, 0.6509804, 1,
-0.1950067, -1.09683, -2.28349, 0, 1, 0.6588235, 1,
-0.1935676, -1.136279, -2.044405, 0, 1, 0.6627451, 1,
-0.1853892, -0.2035163, -1.928645, 0, 1, 0.6705883, 1,
-0.1828476, -1.494245, -3.605786, 0, 1, 0.6745098, 1,
-0.1823713, 1.505247, -0.7971976, 0, 1, 0.682353, 1,
-0.1818705, 0.2244136, 0.5656611, 0, 1, 0.6862745, 1,
-0.1785311, 0.5129138, 0.2537689, 0, 1, 0.6941177, 1,
-0.1769895, 0.4375655, -1.09133, 0, 1, 0.7019608, 1,
-0.1735755, 2.449536, 1.407974, 0, 1, 0.7058824, 1,
-0.1729315, 0.08044961, -0.7789972, 0, 1, 0.7137255, 1,
-0.1705819, 0.4551362, 0.7319053, 0, 1, 0.7176471, 1,
-0.1691472, -1.53507, -2.390577, 0, 1, 0.7254902, 1,
-0.1689817, -0.3437276, -1.968028, 0, 1, 0.7294118, 1,
-0.1662462, 1.655621, 1.834354, 0, 1, 0.7372549, 1,
-0.1646308, -0.7475819, -2.802391, 0, 1, 0.7411765, 1,
-0.1612197, 1.098302, -0.1784589, 0, 1, 0.7490196, 1,
-0.1598697, 0.07735314, -1.105256, 0, 1, 0.7529412, 1,
-0.1591029, 0.8235043, 0.2721208, 0, 1, 0.7607843, 1,
-0.1589243, -0.3721878, -2.218547, 0, 1, 0.7647059, 1,
-0.1586861, -1.454725, -3.152345, 0, 1, 0.772549, 1,
-0.1556771, -1.651845, -2.789732, 0, 1, 0.7764706, 1,
-0.1539606, 0.1129828, -0.1858807, 0, 1, 0.7843137, 1,
-0.1505906, -0.915916, -2.829818, 0, 1, 0.7882353, 1,
-0.1468776, -0.6289222, -2.604512, 0, 1, 0.7960784, 1,
-0.1458554, 2.930284, -1.758365, 0, 1, 0.8039216, 1,
-0.1444243, 0.3298592, -1.719454, 0, 1, 0.8078431, 1,
-0.1394641, -0.9751787, -3.458167, 0, 1, 0.8156863, 1,
-0.1362341, 2.092763, 0.7926288, 0, 1, 0.8196079, 1,
-0.127988, 0.6084724, 0.7146782, 0, 1, 0.827451, 1,
-0.1260724, 1.027763, -0.4568286, 0, 1, 0.8313726, 1,
-0.12324, 0.2440267, 0.5426964, 0, 1, 0.8392157, 1,
-0.1231479, 0.1461482, -0.3576525, 0, 1, 0.8431373, 1,
-0.1170983, -1.003861, -3.365487, 0, 1, 0.8509804, 1,
-0.1078712, -0.3415378, -4.000809, 0, 1, 0.854902, 1,
-0.103163, -0.8959208, -2.657986, 0, 1, 0.8627451, 1,
-0.1025677, -0.6119297, -3.82944, 0, 1, 0.8666667, 1,
-0.1008526, -0.1563924, -3.221907, 0, 1, 0.8745098, 1,
-0.09893838, -1.263706, -2.79938, 0, 1, 0.8784314, 1,
-0.09328026, 1.147207, 0.3528862, 0, 1, 0.8862745, 1,
-0.09209605, 1.293408, -0.147839, 0, 1, 0.8901961, 1,
-0.09043896, 1.274099, -1.633977, 0, 1, 0.8980392, 1,
-0.08443695, -0.1354222, -2.329371, 0, 1, 0.9058824, 1,
-0.08360957, 0.782145, -0.944812, 0, 1, 0.9098039, 1,
-0.08277146, -0.5747306, -4.417296, 0, 1, 0.9176471, 1,
-0.08198906, 0.3679307, 0.1708493, 0, 1, 0.9215686, 1,
-0.07996213, -0.2764422, -4.723985, 0, 1, 0.9294118, 1,
-0.07873012, -0.4064106, -1.947643, 0, 1, 0.9333333, 1,
-0.07819606, 0.4861169, -2.424517, 0, 1, 0.9411765, 1,
-0.0776685, -0.4839747, -1.427087, 0, 1, 0.945098, 1,
-0.07437349, -0.542409, -2.332873, 0, 1, 0.9529412, 1,
-0.07339562, 1.345895, 1.138244, 0, 1, 0.9568627, 1,
-0.07289131, -1.876135, -3.62842, 0, 1, 0.9647059, 1,
-0.06848047, -1.187405, -3.772479, 0, 1, 0.9686275, 1,
-0.0580947, 1.118816, -1.121078, 0, 1, 0.9764706, 1,
-0.05782389, 0.2434925, 0.2259306, 0, 1, 0.9803922, 1,
-0.05651714, 1.718612, 2.548234, 0, 1, 0.9882353, 1,
-0.05631303, 1.174987, 1.098872, 0, 1, 0.9921569, 1,
-0.05171021, -0.08750463, -2.740657, 0, 1, 1, 1,
-0.04990318, 0.2571539, 0.2789071, 0, 0.9921569, 1, 1,
-0.03889145, 0.004572848, -3.08425, 0, 0.9882353, 1, 1,
-0.03240635, 1.016769, -0.08095983, 0, 0.9803922, 1, 1,
-0.03198731, -1.388718, -2.221343, 0, 0.9764706, 1, 1,
-0.0317265, -0.1946491, -3.191886, 0, 0.9686275, 1, 1,
-0.03143616, -0.1627225, -4.018013, 0, 0.9647059, 1, 1,
-0.02951763, 1.256587, 0.5460595, 0, 0.9568627, 1, 1,
-0.0261921, -1.765752, -3.663103, 0, 0.9529412, 1, 1,
-0.02362949, -0.9694108, -3.881807, 0, 0.945098, 1, 1,
-0.02247434, -0.195125, -2.99309, 0, 0.9411765, 1, 1,
-0.02162622, -0.1905471, -3.709777, 0, 0.9333333, 1, 1,
-0.02127913, 1.933116, 0.7409031, 0, 0.9294118, 1, 1,
-0.02022393, 1.699079, -0.5772731, 0, 0.9215686, 1, 1,
-0.01040276, 1.04561, 0.1922981, 0, 0.9176471, 1, 1,
-0.0008330032, -0.9486395, -2.2421, 0, 0.9098039, 1, 1,
0.004677698, -1.807149, 1.330978, 0, 0.9058824, 1, 1,
0.005833384, 0.3130562, -0.002733699, 0, 0.8980392, 1, 1,
0.008279935, -0.4850126, 2.613299, 0, 0.8901961, 1, 1,
0.008387331, 0.5717387, 1.282918, 0, 0.8862745, 1, 1,
0.01115711, 0.2127459, 0.7060049, 0, 0.8784314, 1, 1,
0.01291923, -0.4850089, 3.372747, 0, 0.8745098, 1, 1,
0.01365615, 0.5239969, -1.123388, 0, 0.8666667, 1, 1,
0.01487537, 0.3764418, 1.555233, 0, 0.8627451, 1, 1,
0.01724843, 0.8884757, -0.8325297, 0, 0.854902, 1, 1,
0.01797282, -1.579084, 3.389039, 0, 0.8509804, 1, 1,
0.0190732, 0.2355248, -0.8015974, 0, 0.8431373, 1, 1,
0.02529978, -0.1358849, 1.979985, 0, 0.8392157, 1, 1,
0.02699843, -0.45244, 2.87239, 0, 0.8313726, 1, 1,
0.03164523, -1.233687, 4.661883, 0, 0.827451, 1, 1,
0.03402257, -0.9436933, 3.899912, 0, 0.8196079, 1, 1,
0.03544712, 0.9737747, 0.2624316, 0, 0.8156863, 1, 1,
0.04065025, -0.2374316, 2.537447, 0, 0.8078431, 1, 1,
0.04329242, 1.431341, 0.6359276, 0, 0.8039216, 1, 1,
0.04411971, 0.2066805, -0.5773734, 0, 0.7960784, 1, 1,
0.0473779, 1.693332, 1.076609, 0, 0.7882353, 1, 1,
0.05504265, 0.333909, -0.5205894, 0, 0.7843137, 1, 1,
0.06253967, -1.071494, 3.866469, 0, 0.7764706, 1, 1,
0.06313715, -0.4703752, 2.215562, 0, 0.772549, 1, 1,
0.06771674, 0.009238784, 1.75545, 0, 0.7647059, 1, 1,
0.06795786, -1.398681, 3.040275, 0, 0.7607843, 1, 1,
0.07037216, -1.252111, 2.636046, 0, 0.7529412, 1, 1,
0.07299296, -0.4035731, -0.6221363, 0, 0.7490196, 1, 1,
0.07389861, -2.162836, 3.533975, 0, 0.7411765, 1, 1,
0.07524965, -1.895991, 2.091132, 0, 0.7372549, 1, 1,
0.07560388, -1.188831, 3.942883, 0, 0.7294118, 1, 1,
0.07940613, -0.535648, 1.86355, 0, 0.7254902, 1, 1,
0.08449023, 0.09675349, 0.9324454, 0, 0.7176471, 1, 1,
0.08872149, 0.4549745, -0.3320067, 0, 0.7137255, 1, 1,
0.08913222, -0.8961747, 2.980408, 0, 0.7058824, 1, 1,
0.09501602, 0.172155, 0.1570193, 0, 0.6980392, 1, 1,
0.09594472, -1.825153, 2.242011, 0, 0.6941177, 1, 1,
0.1014466, 0.5539505, 0.5352118, 0, 0.6862745, 1, 1,
0.1031612, 0.677146, 1.705697, 0, 0.682353, 1, 1,
0.1058107, -0.7494286, 4.059363, 0, 0.6745098, 1, 1,
0.1060785, 1.764648, 1.104921, 0, 0.6705883, 1, 1,
0.1102963, -0.5985542, 3.783317, 0, 0.6627451, 1, 1,
0.1141965, -0.7944681, 3.532003, 0, 0.6588235, 1, 1,
0.1147659, 0.7180899, -1.245067, 0, 0.6509804, 1, 1,
0.1284515, -0.5832188, 3.806364, 0, 0.6470588, 1, 1,
0.1343562, 1.251027, -1.399576, 0, 0.6392157, 1, 1,
0.1381946, -0.08101455, 2.235043, 0, 0.6352941, 1, 1,
0.1390064, -1.101633, 2.617403, 0, 0.627451, 1, 1,
0.1390345, -1.056674, 4.357727, 0, 0.6235294, 1, 1,
0.1406727, 0.4835692, -0.8923658, 0, 0.6156863, 1, 1,
0.1416017, 1.037149, -0.4576517, 0, 0.6117647, 1, 1,
0.1417633, 1.19997, -1.871734, 0, 0.6039216, 1, 1,
0.1439733, -0.6250076, 1.952122, 0, 0.5960785, 1, 1,
0.144639, -0.1924392, 2.272571, 0, 0.5921569, 1, 1,
0.1612859, 0.2523087, -1.275859, 0, 0.5843138, 1, 1,
0.1706529, 1.438917, 0.9212076, 0, 0.5803922, 1, 1,
0.1745134, 0.5509213, 0.3445799, 0, 0.572549, 1, 1,
0.1745882, -1.990808, 3.931069, 0, 0.5686275, 1, 1,
0.1761153, 1.208654, -0.03809222, 0, 0.5607843, 1, 1,
0.1789322, 1.134641, 1.940422, 0, 0.5568628, 1, 1,
0.1810476, 0.6630966, -0.2657005, 0, 0.5490196, 1, 1,
0.1850631, 0.01593569, 2.895277, 0, 0.5450981, 1, 1,
0.1868484, -0.8633099, 2.655364, 0, 0.5372549, 1, 1,
0.1870907, 0.07660528, 3.035363, 0, 0.5333334, 1, 1,
0.1881336, 2.139824, -2.646712, 0, 0.5254902, 1, 1,
0.1894615, -0.3442991, 3.890271, 0, 0.5215687, 1, 1,
0.1906978, 1.160216, 1.521581, 0, 0.5137255, 1, 1,
0.1992226, 1.106871, 0.1183859, 0, 0.509804, 1, 1,
0.1997384, -1.031708, 2.762429, 0, 0.5019608, 1, 1,
0.2115683, 0.7791001, -0.3132157, 0, 0.4941176, 1, 1,
0.2138403, 0.5609148, 1.653113, 0, 0.4901961, 1, 1,
0.2152572, 0.02818698, 1.439135, 0, 0.4823529, 1, 1,
0.2168291, -0.2999163, 3.730284, 0, 0.4784314, 1, 1,
0.2174792, -0.5712097, 4.499705, 0, 0.4705882, 1, 1,
0.2181676, -0.7764449, 3.439202, 0, 0.4666667, 1, 1,
0.2195192, -0.09131398, 3.463998, 0, 0.4588235, 1, 1,
0.2257308, -1.062306, 3.682465, 0, 0.454902, 1, 1,
0.225928, 1.030554, -0.2650849, 0, 0.4470588, 1, 1,
0.2259408, 0.5293041, -0.6835459, 0, 0.4431373, 1, 1,
0.2286474, -1.004098, 3.663477, 0, 0.4352941, 1, 1,
0.2296541, 0.3085932, 0.6158224, 0, 0.4313726, 1, 1,
0.2305499, 0.2344638, -0.2842792, 0, 0.4235294, 1, 1,
0.2335227, -0.2395792, 3.780237, 0, 0.4196078, 1, 1,
0.2340924, -0.3406213, 3.811446, 0, 0.4117647, 1, 1,
0.2383045, -0.3839226, 1.848571, 0, 0.4078431, 1, 1,
0.241405, -1.625531, 3.192024, 0, 0.4, 1, 1,
0.2418409, 0.03788085, 3.036175, 0, 0.3921569, 1, 1,
0.2429094, 0.6007664, 0.5118157, 0, 0.3882353, 1, 1,
0.2454451, 0.6183998, 0.7491206, 0, 0.3803922, 1, 1,
0.2462837, -2.482211, 3.349572, 0, 0.3764706, 1, 1,
0.2489285, -0.8206269, 2.014521, 0, 0.3686275, 1, 1,
0.2514755, -0.01441797, 1.430865, 0, 0.3647059, 1, 1,
0.2520749, -1.428346, 2.251235, 0, 0.3568628, 1, 1,
0.2527211, -0.5352762, 5.051372, 0, 0.3529412, 1, 1,
0.2572135, 2.797953, 0.1561347, 0, 0.345098, 1, 1,
0.2598003, 0.2408039, -0.280976, 0, 0.3411765, 1, 1,
0.2619736, 0.7951486, -0.3835464, 0, 0.3333333, 1, 1,
0.2624361, -0.6085949, 4.332076, 0, 0.3294118, 1, 1,
0.2639897, 1.22634, 0.5788722, 0, 0.3215686, 1, 1,
0.2656767, 0.1069742, 0.934204, 0, 0.3176471, 1, 1,
0.2659249, -0.4508269, 1.54808, 0, 0.3098039, 1, 1,
0.266221, 3.185206, 1.094159, 0, 0.3058824, 1, 1,
0.2694737, -1.081988, 1.384314, 0, 0.2980392, 1, 1,
0.2698454, 2.325524, 0.3909027, 0, 0.2901961, 1, 1,
0.2785087, -1.401251, 2.851458, 0, 0.2862745, 1, 1,
0.2811808, 0.01809652, 1.096789, 0, 0.2784314, 1, 1,
0.2820211, -0.5303589, 2.278205, 0, 0.2745098, 1, 1,
0.2947243, -0.5643955, 2.076187, 0, 0.2666667, 1, 1,
0.2982344, 1.335561, 1.548818, 0, 0.2627451, 1, 1,
0.2995465, 1.857095, 0.9331874, 0, 0.254902, 1, 1,
0.3007689, 1.128267, -0.3550918, 0, 0.2509804, 1, 1,
0.3009187, 0.6783245, 0.5652131, 0, 0.2431373, 1, 1,
0.3020474, 0.3464285, 3.024563, 0, 0.2392157, 1, 1,
0.3072882, -1.864966, 2.480077, 0, 0.2313726, 1, 1,
0.3125294, -0.3611954, 2.59743, 0, 0.227451, 1, 1,
0.3133354, 1.641792, 0.446777, 0, 0.2196078, 1, 1,
0.3148749, -0.1168605, 0.8877986, 0, 0.2156863, 1, 1,
0.3208963, 0.08040596, -0.07044677, 0, 0.2078431, 1, 1,
0.3262835, 0.9825814, 1.719148, 0, 0.2039216, 1, 1,
0.3310744, -1.027251, 3.457633, 0, 0.1960784, 1, 1,
0.3310974, -0.102424, -0.7535165, 0, 0.1882353, 1, 1,
0.3434536, 0.3889615, 2.271994, 0, 0.1843137, 1, 1,
0.3451392, -0.433832, 2.211076, 0, 0.1764706, 1, 1,
0.345872, 0.5857546, 0.207369, 0, 0.172549, 1, 1,
0.3485529, 0.364962, 2.255733, 0, 0.1647059, 1, 1,
0.3487162, -1.016008, 2.734844, 0, 0.1607843, 1, 1,
0.3496997, 2.259424, -0.7339044, 0, 0.1529412, 1, 1,
0.3511314, -0.2491275, 3.558993, 0, 0.1490196, 1, 1,
0.3528244, 0.8350105, -0.93183, 0, 0.1411765, 1, 1,
0.3572564, -1.505453, 4.388552, 0, 0.1372549, 1, 1,
0.3607378, 0.7719139, -0.1451363, 0, 0.1294118, 1, 1,
0.3648067, 0.1546464, 1.46948, 0, 0.1254902, 1, 1,
0.3648514, -0.8959795, 2.270483, 0, 0.1176471, 1, 1,
0.3663425, 1.092275, 1.635731, 0, 0.1137255, 1, 1,
0.3691145, -0.4043415, 3.485096, 0, 0.1058824, 1, 1,
0.3695022, -0.7920431, 2.707256, 0, 0.09803922, 1, 1,
0.3716501, 1.287386, -0.06819742, 0, 0.09411765, 1, 1,
0.3747013, 0.07270612, 0.6170824, 0, 0.08627451, 1, 1,
0.3768056, 1.720777, -0.3111624, 0, 0.08235294, 1, 1,
0.3775188, 1.013684, 0.5158521, 0, 0.07450981, 1, 1,
0.3775976, -1.346997, 3.345634, 0, 0.07058824, 1, 1,
0.3792266, -0.4285275, 2.180889, 0, 0.0627451, 1, 1,
0.3868105, -2.113096, 3.437677, 0, 0.05882353, 1, 1,
0.3963264, -1.26949, 3.895667, 0, 0.05098039, 1, 1,
0.4004281, -0.6314484, 2.508338, 0, 0.04705882, 1, 1,
0.4008058, -0.1245828, 2.152452, 0, 0.03921569, 1, 1,
0.4039029, -0.1497325, 1.061199, 0, 0.03529412, 1, 1,
0.4057763, 0.5120128, -1.422109, 0, 0.02745098, 1, 1,
0.4058789, -0.1655998, 1.55426, 0, 0.02352941, 1, 1,
0.4100196, 0.6746286, 0.6257789, 0, 0.01568628, 1, 1,
0.4115877, -0.7489817, 1.989042, 0, 0.01176471, 1, 1,
0.4126703, -0.6693784, 3.132362, 0, 0.003921569, 1, 1,
0.4146403, 1.278077, -0.4203465, 0.003921569, 0, 1, 1,
0.4187749, 1.027902, -1.001924, 0.007843138, 0, 1, 1,
0.4204729, -1.17117, 2.232334, 0.01568628, 0, 1, 1,
0.4250163, 0.5170102, 0.2655643, 0.01960784, 0, 1, 1,
0.4284067, 0.6854821, -0.039473, 0.02745098, 0, 1, 1,
0.4305637, 0.159572, 2.778413, 0.03137255, 0, 1, 1,
0.4316266, 0.1082072, 1.048099, 0.03921569, 0, 1, 1,
0.4346059, -2.566087, 2.290463, 0.04313726, 0, 1, 1,
0.435223, 0.9608346, 3.134936, 0.05098039, 0, 1, 1,
0.4396428, 0.5083678, -0.01544984, 0.05490196, 0, 1, 1,
0.442134, -0.06224468, 0.7742689, 0.0627451, 0, 1, 1,
0.4425372, 0.4421382, 0.9902656, 0.06666667, 0, 1, 1,
0.4430683, 1.38178, -0.5516223, 0.07450981, 0, 1, 1,
0.4453433, 0.2484192, 2.746902, 0.07843138, 0, 1, 1,
0.4461018, -0.1736702, 1.824014, 0.08627451, 0, 1, 1,
0.4497413, -0.8797634, 1.757166, 0.09019608, 0, 1, 1,
0.4501684, 1.516899, 0.2533983, 0.09803922, 0, 1, 1,
0.4508868, 1.685858, -0.6969042, 0.1058824, 0, 1, 1,
0.4553764, -0.09151649, 1.906174, 0.1098039, 0, 1, 1,
0.4561456, -0.1065815, 2.670649, 0.1176471, 0, 1, 1,
0.4576947, 0.490776, -1.362206, 0.1215686, 0, 1, 1,
0.4595425, 0.1929657, 2.1739, 0.1294118, 0, 1, 1,
0.4642219, 0.8662584, 0.4707168, 0.1333333, 0, 1, 1,
0.4646944, 0.6408912, 0.3154754, 0.1411765, 0, 1, 1,
0.4664673, 0.8621535, -1.816718, 0.145098, 0, 1, 1,
0.467174, 2.541303, 0.8024152, 0.1529412, 0, 1, 1,
0.4684504, 0.1710907, 0.3289633, 0.1568628, 0, 1, 1,
0.4698526, -0.1783265, 1.686443, 0.1647059, 0, 1, 1,
0.4714526, -2.136925, 2.540161, 0.1686275, 0, 1, 1,
0.4737557, 1.201582, 0.6506566, 0.1764706, 0, 1, 1,
0.4758693, 1.152192, 1.197395, 0.1803922, 0, 1, 1,
0.4781175, -0.5856616, 3.005093, 0.1882353, 0, 1, 1,
0.4820878, -1.322543, 3.6649, 0.1921569, 0, 1, 1,
0.4836491, -0.9358853, 3.144012, 0.2, 0, 1, 1,
0.4843079, 0.8898561, 1.97013, 0.2078431, 0, 1, 1,
0.4843589, -1.21018, 1.373748, 0.2117647, 0, 1, 1,
0.4908834, -0.02760099, 1.006242, 0.2196078, 0, 1, 1,
0.4915451, -1.323685, 2.656514, 0.2235294, 0, 1, 1,
0.4940415, -1.374358, 0.006300206, 0.2313726, 0, 1, 1,
0.4957593, 2.420004, -1.351647, 0.2352941, 0, 1, 1,
0.4992329, -1.133243, 2.910691, 0.2431373, 0, 1, 1,
0.5005004, -0.8967863, 2.673453, 0.2470588, 0, 1, 1,
0.5067353, 0.02027855, 2.371234, 0.254902, 0, 1, 1,
0.5067709, 0.4093376, 1.431988, 0.2588235, 0, 1, 1,
0.5100844, 0.1419251, 1.978212, 0.2666667, 0, 1, 1,
0.5147422, 0.06749804, 1.553097, 0.2705882, 0, 1, 1,
0.5194321, 0.463976, -0.08768316, 0.2784314, 0, 1, 1,
0.5262037, -0.3081924, 2.290946, 0.282353, 0, 1, 1,
0.5299083, 1.507907, 1.332481, 0.2901961, 0, 1, 1,
0.5326182, -0.3423723, 3.36614, 0.2941177, 0, 1, 1,
0.5332257, 0.3561814, 0.6527435, 0.3019608, 0, 1, 1,
0.5373052, -0.6995856, 3.008324, 0.3098039, 0, 1, 1,
0.5409202, -0.8812525, 3.225102, 0.3137255, 0, 1, 1,
0.5426532, -1.070064, 2.383588, 0.3215686, 0, 1, 1,
0.5461494, 0.6731885, 1.146515, 0.3254902, 0, 1, 1,
0.5503817, -1.785173, 3.244294, 0.3333333, 0, 1, 1,
0.5543174, 1.250406, 0.4903791, 0.3372549, 0, 1, 1,
0.5567308, -0.7805808, 1.599851, 0.345098, 0, 1, 1,
0.5572496, -2.13981, 2.974614, 0.3490196, 0, 1, 1,
0.5588115, -0.224416, 0.759132, 0.3568628, 0, 1, 1,
0.5592234, -1.321553, 1.743427, 0.3607843, 0, 1, 1,
0.5614202, -1.346798, 3.074373, 0.3686275, 0, 1, 1,
0.5620272, -2.37905, 3.320753, 0.372549, 0, 1, 1,
0.564856, -0.4662143, 2.870195, 0.3803922, 0, 1, 1,
0.5653245, -0.6327247, 2.780105, 0.3843137, 0, 1, 1,
0.5655105, -0.40724, 0.3188111, 0.3921569, 0, 1, 1,
0.5712274, -0.682187, 2.687998, 0.3960784, 0, 1, 1,
0.579936, -0.7161385, 1.390347, 0.4039216, 0, 1, 1,
0.5910736, -0.9791896, 3.087092, 0.4117647, 0, 1, 1,
0.5927824, -0.06653392, 1.897323, 0.4156863, 0, 1, 1,
0.5996746, -0.2453442, 2.431437, 0.4235294, 0, 1, 1,
0.602488, 0.670845, 1.060098, 0.427451, 0, 1, 1,
0.6080143, -0.1866403, 2.600829, 0.4352941, 0, 1, 1,
0.611644, -0.03632379, 1.753743, 0.4392157, 0, 1, 1,
0.6124719, -0.6585623, 2.943664, 0.4470588, 0, 1, 1,
0.6200808, 0.5109352, 0.3983436, 0.4509804, 0, 1, 1,
0.6243328, 0.3718435, 0.3995249, 0.4588235, 0, 1, 1,
0.627099, 0.852592, -0.001995109, 0.4627451, 0, 1, 1,
0.6277384, -1.01521, 0.6619927, 0.4705882, 0, 1, 1,
0.6351369, -0.1810632, 2.777853, 0.4745098, 0, 1, 1,
0.6392865, -1.882416, 3.010077, 0.4823529, 0, 1, 1,
0.6424289, -1.519365, 3.548094, 0.4862745, 0, 1, 1,
0.6426071, -0.9728096, 4.614924, 0.4941176, 0, 1, 1,
0.6561522, -0.4824311, 3.720603, 0.5019608, 0, 1, 1,
0.6580954, 0.05564965, 0.6735096, 0.5058824, 0, 1, 1,
0.6640214, -1.639155, 2.613167, 0.5137255, 0, 1, 1,
0.6644269, 1.730953, 1.324552, 0.5176471, 0, 1, 1,
0.6646262, 1.324595, 1.285684, 0.5254902, 0, 1, 1,
0.6652614, 0.05139972, 2.401719, 0.5294118, 0, 1, 1,
0.6654775, 1.529637, -1.836095, 0.5372549, 0, 1, 1,
0.6669397, -1.737009, 0.9821508, 0.5411765, 0, 1, 1,
0.6765454, 1.430347, -0.9710659, 0.5490196, 0, 1, 1,
0.6773715, 0.1534981, 0.1468008, 0.5529412, 0, 1, 1,
0.6840414, -0.4169924, 2.870504, 0.5607843, 0, 1, 1,
0.6852067, -1.094068, 1.888364, 0.5647059, 0, 1, 1,
0.6854553, 0.5645303, 1.966167, 0.572549, 0, 1, 1,
0.6981759, 1.163585, -0.4702874, 0.5764706, 0, 1, 1,
0.7007298, -0.3599877, 0.1661667, 0.5843138, 0, 1, 1,
0.7037611, 0.1457332, 0.3438767, 0.5882353, 0, 1, 1,
0.7044767, 0.3035194, 1.266832, 0.5960785, 0, 1, 1,
0.706085, 1.217396, 0.3154622, 0.6039216, 0, 1, 1,
0.710542, 0.4045113, 0.6535124, 0.6078432, 0, 1, 1,
0.7120529, 0.4716788, 1.606832, 0.6156863, 0, 1, 1,
0.7163986, -2.697816, 1.862589, 0.6196079, 0, 1, 1,
0.7175564, -0.5746438, 1.739122, 0.627451, 0, 1, 1,
0.7194223, -0.5153822, 2.346933, 0.6313726, 0, 1, 1,
0.7220542, -0.4175548, 0.7722131, 0.6392157, 0, 1, 1,
0.7243373, -1.165337, 1.865351, 0.6431373, 0, 1, 1,
0.7383926, -0.3842494, 0.0975502, 0.6509804, 0, 1, 1,
0.7493551, 0.6751977, 1.685428, 0.654902, 0, 1, 1,
0.7501323, 1.050254, 0.6063394, 0.6627451, 0, 1, 1,
0.7577131, -0.9128683, 3.556407, 0.6666667, 0, 1, 1,
0.7598047, -0.3806768, 1.81129, 0.6745098, 0, 1, 1,
0.7605765, 1.407464, -1.131582, 0.6784314, 0, 1, 1,
0.762422, -0.01324728, 0.925701, 0.6862745, 0, 1, 1,
0.7644309, -0.6098755, 2.058846, 0.6901961, 0, 1, 1,
0.7796629, 0.8839674, 1.216932, 0.6980392, 0, 1, 1,
0.7797418, -0.5787917, 1.532708, 0.7058824, 0, 1, 1,
0.7811994, -0.4029636, 2.536096, 0.7098039, 0, 1, 1,
0.7897509, 0.8408383, 1.309451, 0.7176471, 0, 1, 1,
0.7924631, -0.7755008, 2.676775, 0.7215686, 0, 1, 1,
0.7951472, 0.2105717, 4.63426, 0.7294118, 0, 1, 1,
0.7955163, -0.8487826, 2.715317, 0.7333333, 0, 1, 1,
0.796397, 0.2824447, 2.728719, 0.7411765, 0, 1, 1,
0.8078412, 1.385916, 0.7422536, 0.7450981, 0, 1, 1,
0.8085408, -0.9761011, 1.263466, 0.7529412, 0, 1, 1,
0.8098236, 0.3429341, 1.65996, 0.7568628, 0, 1, 1,
0.8118079, -1.149858, 0.6732033, 0.7647059, 0, 1, 1,
0.8131098, -0.09939422, 1.51602, 0.7686275, 0, 1, 1,
0.8134174, 1.03385, -0.640391, 0.7764706, 0, 1, 1,
0.8149515, 0.4335381, 1.139093, 0.7803922, 0, 1, 1,
0.8216408, -2.727299, 2.67038, 0.7882353, 0, 1, 1,
0.8329908, 0.09727267, 2.344029, 0.7921569, 0, 1, 1,
0.8384359, -1.182502, 3.119202, 0.8, 0, 1, 1,
0.839838, 1.805988, 0.5736482, 0.8078431, 0, 1, 1,
0.8402491, 1.033276, 0.9646054, 0.8117647, 0, 1, 1,
0.8429424, -0.2680256, 4.007004, 0.8196079, 0, 1, 1,
0.8443529, -0.08052599, 2.426446, 0.8235294, 0, 1, 1,
0.8488734, 1.903848, 2.078195, 0.8313726, 0, 1, 1,
0.8513923, 0.3289123, 1.7739, 0.8352941, 0, 1, 1,
0.8555155, 0.0267678, 0.741052, 0.8431373, 0, 1, 1,
0.858379, 1.712802, -1.419511, 0.8470588, 0, 1, 1,
0.8595876, -0.5943525, 1.969627, 0.854902, 0, 1, 1,
0.8635854, -0.3342655, 1.480671, 0.8588235, 0, 1, 1,
0.8641384, -2.292171, 3.036524, 0.8666667, 0, 1, 1,
0.8650553, 1.758077, -0.1850548, 0.8705882, 0, 1, 1,
0.8683019, 0.3872641, 1.468975, 0.8784314, 0, 1, 1,
0.8685696, 0.2383778, 1.297552, 0.8823529, 0, 1, 1,
0.8694334, -0.2988393, 1.929634, 0.8901961, 0, 1, 1,
0.8730626, -0.04230358, 3.226331, 0.8941177, 0, 1, 1,
0.8733754, -0.2057479, 3.429692, 0.9019608, 0, 1, 1,
0.873944, -2.001116, 3.246058, 0.9098039, 0, 1, 1,
0.8743881, -0.507202, 3.438203, 0.9137255, 0, 1, 1,
0.875998, -2.594708, 2.921842, 0.9215686, 0, 1, 1,
0.8838473, -0.0193506, 1.290657, 0.9254902, 0, 1, 1,
0.8869503, 1.36301, 0.251222, 0.9333333, 0, 1, 1,
0.8870105, 0.4351594, 1.242383, 0.9372549, 0, 1, 1,
0.8886508, -1.54346, 1.449964, 0.945098, 0, 1, 1,
0.8904344, -0.05697164, 2.015474, 0.9490196, 0, 1, 1,
0.8980969, 0.6990814, 1.56984, 0.9568627, 0, 1, 1,
0.8985934, -0.1481127, 1.327247, 0.9607843, 0, 1, 1,
0.9117416, -1.052741, 2.7126, 0.9686275, 0, 1, 1,
0.9135175, 0.06791979, 1.172588, 0.972549, 0, 1, 1,
0.9150985, 0.1318676, 0.9424819, 0.9803922, 0, 1, 1,
0.9214957, 0.5373015, -1.510041, 0.9843137, 0, 1, 1,
0.9236251, 0.3875194, 0.5245994, 0.9921569, 0, 1, 1,
0.9280144, -0.08086815, 0.8447635, 0.9960784, 0, 1, 1,
0.9320566, -0.7367811, 2.035806, 1, 0, 0.9960784, 1,
0.9330723, 0.0148904, 3.19248, 1, 0, 0.9882353, 1,
0.9366725, 0.2690737, -0.08232848, 1, 0, 0.9843137, 1,
0.9382569, 0.2279885, -0.2246831, 1, 0, 0.9764706, 1,
0.9382852, -1.454252, 4.228649, 1, 0, 0.972549, 1,
0.9385433, 0.2799154, 1.803, 1, 0, 0.9647059, 1,
0.9412347, 0.211026, 2.25295, 1, 0, 0.9607843, 1,
0.943971, 0.1376544, -0.2299055, 1, 0, 0.9529412, 1,
0.9515674, 0.4369307, 0.1402695, 1, 0, 0.9490196, 1,
0.9516727, -0.2631593, 2.195791, 1, 0, 0.9411765, 1,
0.9563512, -0.01037845, 0.3585366, 1, 0, 0.9372549, 1,
0.9614308, 0.4407523, 2.141551, 1, 0, 0.9294118, 1,
0.9631009, 1.073692, -1.00063, 1, 0, 0.9254902, 1,
0.9662775, 0.1602041, 3.071061, 1, 0, 0.9176471, 1,
0.9704083, 0.9627469, -0.5355607, 1, 0, 0.9137255, 1,
0.9763125, -0.3952404, 0.6127365, 1, 0, 0.9058824, 1,
0.9766206, -1.184998, 1.063776, 1, 0, 0.9019608, 1,
0.9783351, 1.246213, -1.113331, 1, 0, 0.8941177, 1,
0.9927035, 1.199933, 0.02278153, 1, 0, 0.8862745, 1,
0.9948108, 0.3276491, 1.128858, 1, 0, 0.8823529, 1,
1.003401, -2.310888, 1.462895, 1, 0, 0.8745098, 1,
1.006033, -1.045967, 1.848119, 1, 0, 0.8705882, 1,
1.014699, -1.312012, 2.293751, 1, 0, 0.8627451, 1,
1.018326, 1.048205, 1.12308, 1, 0, 0.8588235, 1,
1.018422, 2.556412, 1.431675, 1, 0, 0.8509804, 1,
1.022126, -0.09772842, 1.655393, 1, 0, 0.8470588, 1,
1.028169, 1.906245, 1.294404, 1, 0, 0.8392157, 1,
1.030823, -0.8348071, 2.124617, 1, 0, 0.8352941, 1,
1.035852, -0.6826543, 0.4787791, 1, 0, 0.827451, 1,
1.040623, 1.252471, 1.921059, 1, 0, 0.8235294, 1,
1.051959, -0.8948908, 4.07895, 1, 0, 0.8156863, 1,
1.054297, 1.107426, 0.6504032, 1, 0, 0.8117647, 1,
1.054766, 0.4940551, 1.47966, 1, 0, 0.8039216, 1,
1.05661, -0.8262154, 1.66108, 1, 0, 0.7960784, 1,
1.068278, 0.3019069, 3.179424, 1, 0, 0.7921569, 1,
1.068965, 0.6093738, 0.6838896, 1, 0, 0.7843137, 1,
1.069935, -0.5218746, 2.019256, 1, 0, 0.7803922, 1,
1.078909, 0.8395011, -0.9124994, 1, 0, 0.772549, 1,
1.082094, -0.5666283, 3.458425, 1, 0, 0.7686275, 1,
1.101345, -0.8250766, 3.221623, 1, 0, 0.7607843, 1,
1.102985, 0.2689573, 1.816342, 1, 0, 0.7568628, 1,
1.105374, -1.090861, 2.836472, 1, 0, 0.7490196, 1,
1.118183, 2.456442, 0.252565, 1, 0, 0.7450981, 1,
1.122206, 1.383413, 0.841388, 1, 0, 0.7372549, 1,
1.135237, 0.1247476, 2.187371, 1, 0, 0.7333333, 1,
1.137281, -1.519271, 2.348203, 1, 0, 0.7254902, 1,
1.14098, -0.5046448, 2.761467, 1, 0, 0.7215686, 1,
1.156732, -0.2552562, 2.842595, 1, 0, 0.7137255, 1,
1.157774, -0.9476585, 1.844137, 1, 0, 0.7098039, 1,
1.160589, 0.3060458, 0.827534, 1, 0, 0.7019608, 1,
1.168009, -0.09878002, 0.8332055, 1, 0, 0.6941177, 1,
1.174633, -0.07209183, 0.1419473, 1, 0, 0.6901961, 1,
1.186717, 1.018146, -1.447876, 1, 0, 0.682353, 1,
1.189271, -0.2387181, 1.463743, 1, 0, 0.6784314, 1,
1.201421, 0.2248029, 1.537874, 1, 0, 0.6705883, 1,
1.205596, 0.02894046, 1.025921, 1, 0, 0.6666667, 1,
1.219708, 0.4309945, 1.339304, 1, 0, 0.6588235, 1,
1.221795, 2.11098, 1.112396, 1, 0, 0.654902, 1,
1.231545, -1.143575, 2.316662, 1, 0, 0.6470588, 1,
1.234714, 0.2320873, 0.09668525, 1, 0, 0.6431373, 1,
1.244185, -0.08549727, 1.089068, 1, 0, 0.6352941, 1,
1.24507, -0.5836465, 3.745352, 1, 0, 0.6313726, 1,
1.251653, -1.200866, 0.3522809, 1, 0, 0.6235294, 1,
1.251902, -0.8730626, 1.588829, 1, 0, 0.6196079, 1,
1.254366, -0.6036955, 0.1969999, 1, 0, 0.6117647, 1,
1.26464, -1.312465, 1.47657, 1, 0, 0.6078432, 1,
1.277041, -0.8891179, 2.234153, 1, 0, 0.6, 1,
1.278043, -1.866469, 3.748083, 1, 0, 0.5921569, 1,
1.281943, 0.3371808, 1.612539, 1, 0, 0.5882353, 1,
1.283906, 2.119061, 0.4398431, 1, 0, 0.5803922, 1,
1.300379, -1.444938, 3.675956, 1, 0, 0.5764706, 1,
1.302029, -1.622523, 0.5751722, 1, 0, 0.5686275, 1,
1.310976, 0.6781448, 0.1882665, 1, 0, 0.5647059, 1,
1.328588, 0.1869527, 1.48806, 1, 0, 0.5568628, 1,
1.341161, 0.650508, 0.3756372, 1, 0, 0.5529412, 1,
1.348408, -0.4275313, 1.747822, 1, 0, 0.5450981, 1,
1.373785, 2.487047, -1.73848, 1, 0, 0.5411765, 1,
1.376442, -0.7021403, 4.131451, 1, 0, 0.5333334, 1,
1.380134, 1.604915, -0.304063, 1, 0, 0.5294118, 1,
1.38252, -1.849638, 2.914681, 1, 0, 0.5215687, 1,
1.387388, 1.979549, -0.6985427, 1, 0, 0.5176471, 1,
1.397381, -1.086745, 2.932165, 1, 0, 0.509804, 1,
1.410473, -0.257947, 0.7448543, 1, 0, 0.5058824, 1,
1.417041, -0.7506379, 1.009307, 1, 0, 0.4980392, 1,
1.436826, 0.7873968, 1.50526, 1, 0, 0.4901961, 1,
1.437823, -0.8254914, 1.035132, 1, 0, 0.4862745, 1,
1.438908, 1.191404, 0.6182722, 1, 0, 0.4784314, 1,
1.45586, -0.502749, 2.067179, 1, 0, 0.4745098, 1,
1.468893, 0.5285665, 0.7903724, 1, 0, 0.4666667, 1,
1.476655, -0.2980765, 2.199799, 1, 0, 0.4627451, 1,
1.478369, -0.06209596, 0.07271449, 1, 0, 0.454902, 1,
1.48168, -1.199553, 2.095148, 1, 0, 0.4509804, 1,
1.484442, 0.550768, 1.930282, 1, 0, 0.4431373, 1,
1.492053, -0.8701418, 3.631655, 1, 0, 0.4392157, 1,
1.497419, -0.9344419, 2.507692, 1, 0, 0.4313726, 1,
1.513624, 0.06917881, 1.494201, 1, 0, 0.427451, 1,
1.515442, 1.23176, 0.01697365, 1, 0, 0.4196078, 1,
1.519237, -0.8997926, 1.542268, 1, 0, 0.4156863, 1,
1.523378, 1.584829, 1.065225, 1, 0, 0.4078431, 1,
1.527895, -1.95017, 2.914152, 1, 0, 0.4039216, 1,
1.553308, 0.7650835, 0.7278736, 1, 0, 0.3960784, 1,
1.574283, 0.04847221, 1.346974, 1, 0, 0.3882353, 1,
1.575939, 1.964881, 0.9310629, 1, 0, 0.3843137, 1,
1.601799, 0.5220551, 1.526857, 1, 0, 0.3764706, 1,
1.612229, -0.6089597, 3.278619, 1, 0, 0.372549, 1,
1.618019, 0.445411, 1.996487, 1, 0, 0.3647059, 1,
1.624292, 1.488204, -0.2181156, 1, 0, 0.3607843, 1,
1.640853, -0.1972101, 2.413193, 1, 0, 0.3529412, 1,
1.656517, 0.2774387, -1.408896, 1, 0, 0.3490196, 1,
1.658982, 0.1923394, 1.251019, 1, 0, 0.3411765, 1,
1.659659, 0.271424, 1.224634, 1, 0, 0.3372549, 1,
1.662122, -0.922531, 1.15047, 1, 0, 0.3294118, 1,
1.666758, -0.2727965, 0.1650909, 1, 0, 0.3254902, 1,
1.668459, 0.5916252, 1.634144, 1, 0, 0.3176471, 1,
1.672365, 1.104955, 0.6211632, 1, 0, 0.3137255, 1,
1.678841, 1.111063, 1.012897, 1, 0, 0.3058824, 1,
1.698893, -0.7848637, 2.143906, 1, 0, 0.2980392, 1,
1.71139, 0.5021769, 0.5846959, 1, 0, 0.2941177, 1,
1.712723, 0.6013952, -0.2340035, 1, 0, 0.2862745, 1,
1.716468, -0.7099015, 2.449378, 1, 0, 0.282353, 1,
1.716879, -0.1326343, 1.745231, 1, 0, 0.2745098, 1,
1.728324, 0.7462194, 2.448077, 1, 0, 0.2705882, 1,
1.75357, 1.00377, 0.7620432, 1, 0, 0.2627451, 1,
1.754801, 1.097571, 0.8059974, 1, 0, 0.2588235, 1,
1.765282, -1.225563, 3.176976, 1, 0, 0.2509804, 1,
1.765699, 0.3022581, 2.898038, 1, 0, 0.2470588, 1,
1.781463, 2.443532, 2.031578, 1, 0, 0.2392157, 1,
1.826949, -0.2465635, 0.0515916, 1, 0, 0.2352941, 1,
1.832693, 0.7673793, 1.237581, 1, 0, 0.227451, 1,
1.839108, 0.5753382, 0.7950034, 1, 0, 0.2235294, 1,
1.839533, -0.4523439, 3.612873, 1, 0, 0.2156863, 1,
1.843364, 0.828787, 1.948711, 1, 0, 0.2117647, 1,
1.845745, 0.03737942, 1.524469, 1, 0, 0.2039216, 1,
1.855919, 0.005939548, 0.9178836, 1, 0, 0.1960784, 1,
1.856922, 0.7324139, 0.6380999, 1, 0, 0.1921569, 1,
1.923556, 0.9826077, 2.092975, 1, 0, 0.1843137, 1,
1.93031, -1.005216, 2.709434, 1, 0, 0.1803922, 1,
1.931812, 0.7346628, 1.999273, 1, 0, 0.172549, 1,
1.946491, -0.02767815, 1.655445, 1, 0, 0.1686275, 1,
1.95405, -0.8832427, 1.453789, 1, 0, 0.1607843, 1,
1.958151, -1.162561, 2.447194, 1, 0, 0.1568628, 1,
2.010301, 0.3840427, 2.418172, 1, 0, 0.1490196, 1,
2.038169, -1.575069, 3.078147, 1, 0, 0.145098, 1,
2.073144, -0.3156236, 0.1911104, 1, 0, 0.1372549, 1,
2.083849, -0.2263821, 2.125037, 1, 0, 0.1333333, 1,
2.095578, 0.7171001, 2.003007, 1, 0, 0.1254902, 1,
2.098447, -0.7318297, 2.172807, 1, 0, 0.1215686, 1,
2.106797, -0.447179, 3.063835, 1, 0, 0.1137255, 1,
2.120266, 0.231221, 1.831406, 1, 0, 0.1098039, 1,
2.120472, 0.5393429, 0.4381432, 1, 0, 0.1019608, 1,
2.135561, -0.03088813, 2.139127, 1, 0, 0.09411765, 1,
2.173334, -0.1255043, 3.289387, 1, 0, 0.09019608, 1,
2.175191, -0.2877815, 2.170425, 1, 0, 0.08235294, 1,
2.207469, -0.4482625, 1.302464, 1, 0, 0.07843138, 1,
2.241681, -0.1524286, 3.162261, 1, 0, 0.07058824, 1,
2.26196, 0.3745532, 2.498236, 1, 0, 0.06666667, 1,
2.287499, -1.390051, 2.887654, 1, 0, 0.05882353, 1,
2.303975, -1.845417, 2.457514, 1, 0, 0.05490196, 1,
2.396756, 0.503704, 1.55182, 1, 0, 0.04705882, 1,
2.482337, -1.24023, 2.077574, 1, 0, 0.04313726, 1,
2.558194, -1.32426, 1.248677, 1, 0, 0.03529412, 1,
2.569953, 1.191673, 1.526207, 1, 0, 0.03137255, 1,
2.723608, -1.486842, 3.314693, 1, 0, 0.02352941, 1,
2.899523, 1.614832, 0.8388066, 1, 0, 0.01960784, 1,
3.107434, 1.183044, 1.157404, 1, 0, 0.01176471, 1,
3.198245, 0.509266, 0.06232804, 1, 0, 0.007843138, 1
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
-0.2164774, -4.49803, -7.20786, 0, -0.5, 0.5, 0.5,
-0.2164774, -4.49803, -7.20786, 1, -0.5, 0.5, 0.5,
-0.2164774, -4.49803, -7.20786, 1, 1.5, 0.5, 0.5,
-0.2164774, -4.49803, -7.20786, 0, 1.5, 0.5, 0.5
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
-4.788791, -0.07695997, -7.20786, 0, -0.5, 0.5, 0.5,
-4.788791, -0.07695997, -7.20786, 1, -0.5, 0.5, 0.5,
-4.788791, -0.07695997, -7.20786, 1, 1.5, 0.5, 0.5,
-4.788791, -0.07695997, -7.20786, 0, 1.5, 0.5, 0.5
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
-4.788791, -4.49803, -0.1898561, 0, -0.5, 0.5, 0.5,
-4.788791, -4.49803, -0.1898561, 1, -0.5, 0.5, 0.5,
-4.788791, -4.49803, -0.1898561, 1, 1.5, 0.5, 0.5,
-4.788791, -4.49803, -0.1898561, 0, 1.5, 0.5, 0.5
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
-3, -3.477783, -5.588321,
3, -3.477783, -5.588321,
-3, -3.477783, -5.588321,
-3, -3.647824, -5.858244,
-2, -3.477783, -5.588321,
-2, -3.647824, -5.858244,
-1, -3.477783, -5.588321,
-1, -3.647824, -5.858244,
0, -3.477783, -5.588321,
0, -3.647824, -5.858244,
1, -3.477783, -5.588321,
1, -3.647824, -5.858244,
2, -3.477783, -5.588321,
2, -3.647824, -5.858244,
3, -3.477783, -5.588321,
3, -3.647824, -5.858244
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
-3, -3.987906, -6.39809, 0, -0.5, 0.5, 0.5,
-3, -3.987906, -6.39809, 1, -0.5, 0.5, 0.5,
-3, -3.987906, -6.39809, 1, 1.5, 0.5, 0.5,
-3, -3.987906, -6.39809, 0, 1.5, 0.5, 0.5,
-2, -3.987906, -6.39809, 0, -0.5, 0.5, 0.5,
-2, -3.987906, -6.39809, 1, -0.5, 0.5, 0.5,
-2, -3.987906, -6.39809, 1, 1.5, 0.5, 0.5,
-2, -3.987906, -6.39809, 0, 1.5, 0.5, 0.5,
-1, -3.987906, -6.39809, 0, -0.5, 0.5, 0.5,
-1, -3.987906, -6.39809, 1, -0.5, 0.5, 0.5,
-1, -3.987906, -6.39809, 1, 1.5, 0.5, 0.5,
-1, -3.987906, -6.39809, 0, 1.5, 0.5, 0.5,
0, -3.987906, -6.39809, 0, -0.5, 0.5, 0.5,
0, -3.987906, -6.39809, 1, -0.5, 0.5, 0.5,
0, -3.987906, -6.39809, 1, 1.5, 0.5, 0.5,
0, -3.987906, -6.39809, 0, 1.5, 0.5, 0.5,
1, -3.987906, -6.39809, 0, -0.5, 0.5, 0.5,
1, -3.987906, -6.39809, 1, -0.5, 0.5, 0.5,
1, -3.987906, -6.39809, 1, 1.5, 0.5, 0.5,
1, -3.987906, -6.39809, 0, 1.5, 0.5, 0.5,
2, -3.987906, -6.39809, 0, -0.5, 0.5, 0.5,
2, -3.987906, -6.39809, 1, -0.5, 0.5, 0.5,
2, -3.987906, -6.39809, 1, 1.5, 0.5, 0.5,
2, -3.987906, -6.39809, 0, 1.5, 0.5, 0.5,
3, -3.987906, -6.39809, 0, -0.5, 0.5, 0.5,
3, -3.987906, -6.39809, 1, -0.5, 0.5, 0.5,
3, -3.987906, -6.39809, 1, 1.5, 0.5, 0.5,
3, -3.987906, -6.39809, 0, 1.5, 0.5, 0.5
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
-3.733642, -3, -5.588321,
-3.733642, 3, -5.588321,
-3.733642, -3, -5.588321,
-3.9095, -3, -5.858244,
-3.733642, -2, -5.588321,
-3.9095, -2, -5.858244,
-3.733642, -1, -5.588321,
-3.9095, -1, -5.858244,
-3.733642, 0, -5.588321,
-3.9095, 0, -5.858244,
-3.733642, 1, -5.588321,
-3.9095, 1, -5.858244,
-3.733642, 2, -5.588321,
-3.9095, 2, -5.858244,
-3.733642, 3, -5.588321,
-3.9095, 3, -5.858244
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
-4.261217, -3, -6.39809, 0, -0.5, 0.5, 0.5,
-4.261217, -3, -6.39809, 1, -0.5, 0.5, 0.5,
-4.261217, -3, -6.39809, 1, 1.5, 0.5, 0.5,
-4.261217, -3, -6.39809, 0, 1.5, 0.5, 0.5,
-4.261217, -2, -6.39809, 0, -0.5, 0.5, 0.5,
-4.261217, -2, -6.39809, 1, -0.5, 0.5, 0.5,
-4.261217, -2, -6.39809, 1, 1.5, 0.5, 0.5,
-4.261217, -2, -6.39809, 0, 1.5, 0.5, 0.5,
-4.261217, -1, -6.39809, 0, -0.5, 0.5, 0.5,
-4.261217, -1, -6.39809, 1, -0.5, 0.5, 0.5,
-4.261217, -1, -6.39809, 1, 1.5, 0.5, 0.5,
-4.261217, -1, -6.39809, 0, 1.5, 0.5, 0.5,
-4.261217, 0, -6.39809, 0, -0.5, 0.5, 0.5,
-4.261217, 0, -6.39809, 1, -0.5, 0.5, 0.5,
-4.261217, 0, -6.39809, 1, 1.5, 0.5, 0.5,
-4.261217, 0, -6.39809, 0, 1.5, 0.5, 0.5,
-4.261217, 1, -6.39809, 0, -0.5, 0.5, 0.5,
-4.261217, 1, -6.39809, 1, -0.5, 0.5, 0.5,
-4.261217, 1, -6.39809, 1, 1.5, 0.5, 0.5,
-4.261217, 1, -6.39809, 0, 1.5, 0.5, 0.5,
-4.261217, 2, -6.39809, 0, -0.5, 0.5, 0.5,
-4.261217, 2, -6.39809, 1, -0.5, 0.5, 0.5,
-4.261217, 2, -6.39809, 1, 1.5, 0.5, 0.5,
-4.261217, 2, -6.39809, 0, 1.5, 0.5, 0.5,
-4.261217, 3, -6.39809, 0, -0.5, 0.5, 0.5,
-4.261217, 3, -6.39809, 1, -0.5, 0.5, 0.5,
-4.261217, 3, -6.39809, 1, 1.5, 0.5, 0.5,
-4.261217, 3, -6.39809, 0, 1.5, 0.5, 0.5
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
-3.733642, -3.477783, -4,
-3.733642, -3.477783, 4,
-3.733642, -3.477783, -4,
-3.9095, -3.647824, -4,
-3.733642, -3.477783, -2,
-3.9095, -3.647824, -2,
-3.733642, -3.477783, 0,
-3.9095, -3.647824, 0,
-3.733642, -3.477783, 2,
-3.9095, -3.647824, 2,
-3.733642, -3.477783, 4,
-3.9095, -3.647824, 4
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
-4.261217, -3.987906, -4, 0, -0.5, 0.5, 0.5,
-4.261217, -3.987906, -4, 1, -0.5, 0.5, 0.5,
-4.261217, -3.987906, -4, 1, 1.5, 0.5, 0.5,
-4.261217, -3.987906, -4, 0, 1.5, 0.5, 0.5,
-4.261217, -3.987906, -2, 0, -0.5, 0.5, 0.5,
-4.261217, -3.987906, -2, 1, -0.5, 0.5, 0.5,
-4.261217, -3.987906, -2, 1, 1.5, 0.5, 0.5,
-4.261217, -3.987906, -2, 0, 1.5, 0.5, 0.5,
-4.261217, -3.987906, 0, 0, -0.5, 0.5, 0.5,
-4.261217, -3.987906, 0, 1, -0.5, 0.5, 0.5,
-4.261217, -3.987906, 0, 1, 1.5, 0.5, 0.5,
-4.261217, -3.987906, 0, 0, 1.5, 0.5, 0.5,
-4.261217, -3.987906, 2, 0, -0.5, 0.5, 0.5,
-4.261217, -3.987906, 2, 1, -0.5, 0.5, 0.5,
-4.261217, -3.987906, 2, 1, 1.5, 0.5, 0.5,
-4.261217, -3.987906, 2, 0, 1.5, 0.5, 0.5,
-4.261217, -3.987906, 4, 0, -0.5, 0.5, 0.5,
-4.261217, -3.987906, 4, 1, -0.5, 0.5, 0.5,
-4.261217, -3.987906, 4, 1, 1.5, 0.5, 0.5,
-4.261217, -3.987906, 4, 0, 1.5, 0.5, 0.5
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
-3.733642, -3.477783, -5.588321,
-3.733642, 3.323863, -5.588321,
-3.733642, -3.477783, 5.208609,
-3.733642, 3.323863, 5.208609,
-3.733642, -3.477783, -5.588321,
-3.733642, -3.477783, 5.208609,
-3.733642, 3.323863, -5.588321,
-3.733642, 3.323863, 5.208609,
-3.733642, -3.477783, -5.588321,
3.300687, -3.477783, -5.588321,
-3.733642, -3.477783, 5.208609,
3.300687, -3.477783, 5.208609,
-3.733642, 3.323863, -5.588321,
3.300687, 3.323863, -5.588321,
-3.733642, 3.323863, 5.208609,
3.300687, 3.323863, 5.208609,
3.300687, -3.477783, -5.588321,
3.300687, 3.323863, -5.588321,
3.300687, -3.477783, 5.208609,
3.300687, 3.323863, 5.208609,
3.300687, -3.477783, -5.588321,
3.300687, -3.477783, 5.208609,
3.300687, 3.323863, -5.588321,
3.300687, 3.323863, 5.208609
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
var radius = 7.780701;
var distance = 34.61721;
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
mvMatrix.translate( 0.2164774, 0.07695997, 0.1898561 );
mvMatrix.scale( 1.195942, 1.236854, 0.7791703 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.61721);
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
antimony_potassium_t<-read.table("antimony_potassium_t.xyz")
```

```
## Error in read.table("antimony_potassium_t.xyz"): no lines available in input
```

```r
x<-antimony_potassium_t$V2
```

```
## Error in eval(expr, envir, enclos): object 'antimony_potassium_t' not found
```

```r
y<-antimony_potassium_t$V3
```

```
## Error in eval(expr, envir, enclos): object 'antimony_potassium_t' not found
```

```r
z<-antimony_potassium_t$V4
```

```
## Error in eval(expr, envir, enclos): object 'antimony_potassium_t' not found
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
-3.6312, 0.7834917, -1.95902, 0, 0, 1, 1, 1,
-2.696086, 0.5357087, -0.6304528, 1, 0, 0, 1, 1,
-2.579687, -0.2008791, -2.81432, 1, 0, 0, 1, 1,
-2.567693, 0.7774621, -2.519224, 1, 0, 0, 1, 1,
-2.532917, -2.542952, -2.326529, 1, 0, 0, 1, 1,
-2.496287, 0.1146284, -1.494332, 1, 0, 0, 1, 1,
-2.39427, -0.9564641, -2.012084, 0, 0, 0, 1, 1,
-2.376572, 0.5798128, -1.076998, 0, 0, 0, 1, 1,
-2.360965, 0.1750112, -1.169651, 0, 0, 0, 1, 1,
-2.360718, 0.4108712, 0.06718493, 0, 0, 0, 1, 1,
-2.322592, -0.891128, -4.108853, 0, 0, 0, 1, 1,
-2.307065, -1.248412, -2.780346, 0, 0, 0, 1, 1,
-2.259722, 0.4944338, -3.087327, 0, 0, 0, 1, 1,
-2.258519, 1.856214, -0.1908365, 1, 1, 1, 1, 1,
-2.249336, -0.2320472, -1.301391, 1, 1, 1, 1, 1,
-2.216645, 1.265168, -0.563949, 1, 1, 1, 1, 1,
-2.145098, -0.2974849, -2.58833, 1, 1, 1, 1, 1,
-2.14303, -2.054088, -2.809233, 1, 1, 1, 1, 1,
-2.142549, 0.6063785, -1.387823, 1, 1, 1, 1, 1,
-2.130332, 2.065968, -1.288056, 1, 1, 1, 1, 1,
-2.124102, 0.7443063, -0.6359591, 1, 1, 1, 1, 1,
-2.100818, -0.08090963, -1.730422, 1, 1, 1, 1, 1,
-2.086005, -0.192491, -2.842051, 1, 1, 1, 1, 1,
-2.047854, 0.8000302, -3.191596, 1, 1, 1, 1, 1,
-1.983647, -0.06262848, -0.2304576, 1, 1, 1, 1, 1,
-1.973763, -0.6078808, -1.872473, 1, 1, 1, 1, 1,
-1.945754, -0.4455438, -1.275937, 1, 1, 1, 1, 1,
-1.937783, 1.785791, -0.7238104, 1, 1, 1, 1, 1,
-1.933252, -0.4515266, -1.295996, 0, 0, 1, 1, 1,
-1.917689, 3.22481, -0.003167251, 1, 0, 0, 1, 1,
-1.917059, -1.968898, -1.430061, 1, 0, 0, 1, 1,
-1.893128, -1.323997, -1.526597, 1, 0, 0, 1, 1,
-1.864797, -1.625298, -0.4731207, 1, 0, 0, 1, 1,
-1.843391, 0.6591116, -2.560012, 1, 0, 0, 1, 1,
-1.812419, 1.608936, 0.7353177, 0, 0, 0, 1, 1,
-1.780783, 0.4437516, 0.07087383, 0, 0, 0, 1, 1,
-1.767029, 1.461096, -1.817357, 0, 0, 0, 1, 1,
-1.766735, 0.130575, -3.541974, 0, 0, 0, 1, 1,
-1.763248, 1.100274, -2.178379, 0, 0, 0, 1, 1,
-1.753117, -1.62626, -4.420191, 0, 0, 0, 1, 1,
-1.746846, -0.5092394, -0.7927069, 0, 0, 0, 1, 1,
-1.730151, 0.597441, -1.646625, 1, 1, 1, 1, 1,
-1.694759, -1.261593, -0.5780152, 1, 1, 1, 1, 1,
-1.685299, 0.479399, -0.3651225, 1, 1, 1, 1, 1,
-1.673062, 0.5892948, -1.262735, 1, 1, 1, 1, 1,
-1.667006, 0.6682809, 0.7286218, 1, 1, 1, 1, 1,
-1.658687, -0.464444, -1.837767, 1, 1, 1, 1, 1,
-1.652329, 0.7867147, -1.001205, 1, 1, 1, 1, 1,
-1.647895, 0.3581135, -1.676465, 1, 1, 1, 1, 1,
-1.647438, -0.1967357, -1.198561, 1, 1, 1, 1, 1,
-1.632467, 0.5710368, -1.017915, 1, 1, 1, 1, 1,
-1.618617, 0.6640356, 0.04069627, 1, 1, 1, 1, 1,
-1.614129, -0.8851564, -0.06393924, 1, 1, 1, 1, 1,
-1.611298, -0.4601048, -0.8030986, 1, 1, 1, 1, 1,
-1.58911, 0.02441182, -2.101566, 1, 1, 1, 1, 1,
-1.578068, 0.5000859, -0.5806504, 1, 1, 1, 1, 1,
-1.564402, -1.462813, -2.961331, 0, 0, 1, 1, 1,
-1.543068, -0.852309, -2.291006, 1, 0, 0, 1, 1,
-1.538343, -1.385895, -2.000674, 1, 0, 0, 1, 1,
-1.537114, -0.5107107, -1.842286, 1, 0, 0, 1, 1,
-1.529366, -0.7221155, -2.713948, 1, 0, 0, 1, 1,
-1.524811, -0.7207803, -2.164143, 1, 0, 0, 1, 1,
-1.515118, 1.214585, -1.05851, 0, 0, 0, 1, 1,
-1.509597, -1.546522, -2.840454, 0, 0, 0, 1, 1,
-1.507888, 0.1202445, -1.494092, 0, 0, 0, 1, 1,
-1.485618, 1.311093, 0.1074979, 0, 0, 0, 1, 1,
-1.478642, 1.540869, 0.7878119, 0, 0, 0, 1, 1,
-1.478147, 0.03561784, -0.9321378, 0, 0, 0, 1, 1,
-1.472377, 0.2332151, -1.451929, 0, 0, 0, 1, 1,
-1.463328, 2.129906, -2.332437, 1, 1, 1, 1, 1,
-1.460412, -0.3604306, -1.313107, 1, 1, 1, 1, 1,
-1.456595, 1.204354, 0.2013944, 1, 1, 1, 1, 1,
-1.452248, -0.794616, -2.479498, 1, 1, 1, 1, 1,
-1.451933, -2.205346, -1.416573, 1, 1, 1, 1, 1,
-1.450245, -0.7026728, -2.663602, 1, 1, 1, 1, 1,
-1.447245, -0.3034211, -1.285918, 1, 1, 1, 1, 1,
-1.439394, 0.006894551, -2.458993, 1, 1, 1, 1, 1,
-1.415971, 0.6724755, -1.080717, 1, 1, 1, 1, 1,
-1.403963, 0.3168806, -0.5047031, 1, 1, 1, 1, 1,
-1.401295, 1.222939, 0.5364172, 1, 1, 1, 1, 1,
-1.394267, -0.4745318, -2.910084, 1, 1, 1, 1, 1,
-1.393348, 0.3686177, -0.8757578, 1, 1, 1, 1, 1,
-1.374474, -0.1715111, 0.2342448, 1, 1, 1, 1, 1,
-1.364506, -0.5918609, -1.443946, 1, 1, 1, 1, 1,
-1.353745, 0.3662142, -1.902296, 0, 0, 1, 1, 1,
-1.350898, -1.537437, -3.081895, 1, 0, 0, 1, 1,
-1.335966, 0.4694867, 0.9413763, 1, 0, 0, 1, 1,
-1.322773, -1.438194, -3.916681, 1, 0, 0, 1, 1,
-1.306957, 1.472438, -0.3573729, 1, 0, 0, 1, 1,
-1.30682, -0.1344102, -2.131912, 1, 0, 0, 1, 1,
-1.306338, -0.7896913, -1.114082, 0, 0, 0, 1, 1,
-1.304673, -0.8836241, -4.032152, 0, 0, 0, 1, 1,
-1.304041, 0.9868535, -0.975952, 0, 0, 0, 1, 1,
-1.299271, -0.7457819, -0.5201992, 0, 0, 0, 1, 1,
-1.295952, -0.5461274, -2.502737, 0, 0, 0, 1, 1,
-1.292214, -0.3497264, -1.170086, 0, 0, 0, 1, 1,
-1.286351, -0.3381687, -2.677246, 0, 0, 0, 1, 1,
-1.284389, -0.2381831, -2.955197, 1, 1, 1, 1, 1,
-1.274016, 1.839181, -2.268237, 1, 1, 1, 1, 1,
-1.269685, -0.9361546, -1.874524, 1, 1, 1, 1, 1,
-1.266607, -0.5608689, -1.955168, 1, 1, 1, 1, 1,
-1.264451, -0.4719816, -2.037571, 1, 1, 1, 1, 1,
-1.264108, 0.0851402, -1.841864, 1, 1, 1, 1, 1,
-1.262865, 1.882396, -0.4352903, 1, 1, 1, 1, 1,
-1.255108, 0.2937361, 1.076885, 1, 1, 1, 1, 1,
-1.248607, -1.7652, -4.298221, 1, 1, 1, 1, 1,
-1.246912, 0.2371873, -1.014645, 1, 1, 1, 1, 1,
-1.244994, 0.5334507, -1.671223, 1, 1, 1, 1, 1,
-1.244554, -3.16985, -4.137101, 1, 1, 1, 1, 1,
-1.244433, 0.0611757, -0.9119462, 1, 1, 1, 1, 1,
-1.238397, -0.7548285, -3.278848, 1, 1, 1, 1, 1,
-1.230471, -0.7590213, -4.303273, 1, 1, 1, 1, 1,
-1.228434, -1.608535, -2.369887, 0, 0, 1, 1, 1,
-1.227177, 1.202638, -1.003834, 1, 0, 0, 1, 1,
-1.222875, -0.8305637, -2.181739, 1, 0, 0, 1, 1,
-1.22212, 0.5279424, -0.6402925, 1, 0, 0, 1, 1,
-1.220513, 1.860863, -0.2079563, 1, 0, 0, 1, 1,
-1.22015, -0.4346046, -1.851682, 1, 0, 0, 1, 1,
-1.214026, 0.4442803, -0.8366652, 0, 0, 0, 1, 1,
-1.213602, -1.707617, -4.463463, 0, 0, 0, 1, 1,
-1.213119, -1.476884, -2.345786, 0, 0, 0, 1, 1,
-1.213079, 0.9387969, -0.1878713, 0, 0, 0, 1, 1,
-1.210141, 1.466677, 0.04452954, 0, 0, 0, 1, 1,
-1.204525, -0.8288819, 0.1078025, 0, 0, 0, 1, 1,
-1.19567, 1.688631, -1.49816, 0, 0, 0, 1, 1,
-1.193108, 0.7251896, 0.8110863, 1, 1, 1, 1, 1,
-1.187496, 0.9445304, -0.9445295, 1, 1, 1, 1, 1,
-1.186777, -0.2989761, -1.581202, 1, 1, 1, 1, 1,
-1.180778, -0.2520878, -2.458472, 1, 1, 1, 1, 1,
-1.177864, -0.1211824, -2.434831, 1, 1, 1, 1, 1,
-1.177091, -1.957021, -1.482429, 1, 1, 1, 1, 1,
-1.175712, 1.52206, -2.111597, 1, 1, 1, 1, 1,
-1.175195, -1.253748, -2.089445, 1, 1, 1, 1, 1,
-1.169808, -1.973869, -3.545456, 1, 1, 1, 1, 1,
-1.154516, -0.8004925, -2.148538, 1, 1, 1, 1, 1,
-1.153752, 1.773228, -0.4297818, 1, 1, 1, 1, 1,
-1.149697, -0.1672151, -1.427252, 1, 1, 1, 1, 1,
-1.14529, -0.3262328, 0.3863975, 1, 1, 1, 1, 1,
-1.143283, -0.2596585, -1.509223, 1, 1, 1, 1, 1,
-1.128047, 1.82394, -0.1938433, 1, 1, 1, 1, 1,
-1.125202, -0.4670054, -1.510302, 0, 0, 1, 1, 1,
-1.123762, -0.5787086, -2.663989, 1, 0, 0, 1, 1,
-1.113173, -2.293091, -2.181422, 1, 0, 0, 1, 1,
-1.096709, 0.7275752, -1.418183, 1, 0, 0, 1, 1,
-1.093714, -0.7575107, -3.428561, 1, 0, 0, 1, 1,
-1.092342, -1.609558, -1.939941, 1, 0, 0, 1, 1,
-1.082503, 0.8137426, -1.372627, 0, 0, 0, 1, 1,
-1.075115, 0.007780923, -1.857868, 0, 0, 0, 1, 1,
-1.069726, -0.1340695, -2.783318, 0, 0, 0, 1, 1,
-1.066751, -0.3147332, -1.138081, 0, 0, 0, 1, 1,
-1.057747, -0.5110335, -1.887891, 0, 0, 0, 1, 1,
-1.051649, -0.6562378, -3.793338, 0, 0, 0, 1, 1,
-1.050268, -0.6753937, -1.804105, 0, 0, 0, 1, 1,
-1.048607, -0.9443902, -5.431084, 1, 1, 1, 1, 1,
-1.044131, -0.6040859, -1.982829, 1, 1, 1, 1, 1,
-1.043893, 0.1323983, -3.219317, 1, 1, 1, 1, 1,
-1.038424, -0.7734752, -3.681998, 1, 1, 1, 1, 1,
-1.035396, -0.09577762, -1.784679, 1, 1, 1, 1, 1,
-1.032105, -0.5494164, -2.823457, 1, 1, 1, 1, 1,
-1.03164, -1.439481, -1.999254, 1, 1, 1, 1, 1,
-1.029306, -1.854179, -2.46641, 1, 1, 1, 1, 1,
-1.028063, 1.911464, 0.01219014, 1, 1, 1, 1, 1,
-1.025917, 1.697993, -2.31073, 1, 1, 1, 1, 1,
-1.021683, -0.6607653, -1.31947, 1, 1, 1, 1, 1,
-1.0196, -2.039935, -2.704744, 1, 1, 1, 1, 1,
-1.01267, -1.8052, -4.775754, 1, 1, 1, 1, 1,
-1.011309, 2.334893, -2.579345, 1, 1, 1, 1, 1,
-0.9986142, 1.703684, -1.76203, 1, 1, 1, 1, 1,
-0.995149, 0.1997899, -0.7897757, 0, 0, 1, 1, 1,
-0.9896101, -0.7940644, -0.4283491, 1, 0, 0, 1, 1,
-0.9892767, 0.6743775, -1.552427, 1, 0, 0, 1, 1,
-0.9861537, -1.098389, -0.603887, 1, 0, 0, 1, 1,
-0.9706379, 0.3938151, -1.924191, 1, 0, 0, 1, 1,
-0.9684868, -1.234977, -1.617893, 1, 0, 0, 1, 1,
-0.9662412, -0.5765858, -2.324796, 0, 0, 0, 1, 1,
-0.9646679, -0.7746924, -1.888117, 0, 0, 0, 1, 1,
-0.9623345, -1.276383, -2.519631, 0, 0, 0, 1, 1,
-0.9566625, 0.6275119, -0.8368434, 0, 0, 0, 1, 1,
-0.9531116, 1.474015, -0.02866775, 0, 0, 0, 1, 1,
-0.9495466, -0.7507019, -3.297847, 0, 0, 0, 1, 1,
-0.9457142, 1.303218, -1.088586, 0, 0, 0, 1, 1,
-0.9440314, -0.5795698, -2.852003, 1, 1, 1, 1, 1,
-0.9419653, 1.178196, -0.5027632, 1, 1, 1, 1, 1,
-0.9385237, -0.1644377, 0.006121576, 1, 1, 1, 1, 1,
-0.9273028, -0.4405847, -2.258774, 1, 1, 1, 1, 1,
-0.9263411, 0.8070667, -1.652532, 1, 1, 1, 1, 1,
-0.9178551, -3.37873, -2.901108, 1, 1, 1, 1, 1,
-0.9157269, -0.358551, -1.294155, 1, 1, 1, 1, 1,
-0.9153076, -2.217654, -2.252077, 1, 1, 1, 1, 1,
-0.9133073, 0.01593666, -0.9244955, 1, 1, 1, 1, 1,
-0.9130071, 0.4219974, 0.1497549, 1, 1, 1, 1, 1,
-0.9111974, -0.8817333, -2.249386, 1, 1, 1, 1, 1,
-0.9101443, -0.06544442, -1.349078, 1, 1, 1, 1, 1,
-0.9082283, 0.2884524, -2.203342, 1, 1, 1, 1, 1,
-0.906742, -0.8293732, -2.571487, 1, 1, 1, 1, 1,
-0.9062154, 0.09704479, -1.653159, 1, 1, 1, 1, 1,
-0.9059979, 0.2295354, -1.315744, 0, 0, 1, 1, 1,
-0.8907009, 0.4908184, -0.2479595, 1, 0, 0, 1, 1,
-0.8882701, -0.1974875, -2.508889, 1, 0, 0, 1, 1,
-0.8852186, 0.476948, 0.2869082, 1, 0, 0, 1, 1,
-0.8839699, -0.1948809, -1.432166, 1, 0, 0, 1, 1,
-0.8817373, -2.875043, -4.097996, 1, 0, 0, 1, 1,
-0.8811127, -0.07193229, -0.8674915, 0, 0, 0, 1, 1,
-0.8747563, -0.9264526, -1.354261, 0, 0, 0, 1, 1,
-0.874074, -0.4781414, -0.6318442, 0, 0, 0, 1, 1,
-0.8690279, -0.05585788, -2.205494, 0, 0, 0, 1, 1,
-0.8648589, -1.727391, -4.460124, 0, 0, 0, 1, 1,
-0.8597348, -0.2273211, -2.254791, 0, 0, 0, 1, 1,
-0.846608, -0.9835194, -3.497719, 0, 0, 0, 1, 1,
-0.8458872, -0.3476454, -1.12517, 1, 1, 1, 1, 1,
-0.8454168, -0.6619268, -2.170148, 1, 1, 1, 1, 1,
-0.8452461, 0.9314348, 0.2375436, 1, 1, 1, 1, 1,
-0.8440762, 0.1161266, -1.143897, 1, 1, 1, 1, 1,
-0.8416703, -0.8230813, -2.780822, 1, 1, 1, 1, 1,
-0.8399649, -0.7217622, -3.646827, 1, 1, 1, 1, 1,
-0.8372473, 1.672479, 0.6138129, 1, 1, 1, 1, 1,
-0.8370775, -0.9596947, -1.760283, 1, 1, 1, 1, 1,
-0.8313153, 0.5418332, -1.124694, 1, 1, 1, 1, 1,
-0.8306012, -1.357047, -3.141421, 1, 1, 1, 1, 1,
-0.8273617, 1.421591, 1.085878, 1, 1, 1, 1, 1,
-0.8164371, 0.9068028, 0.8521916, 1, 1, 1, 1, 1,
-0.8109415, -0.1861887, -3.864821, 1, 1, 1, 1, 1,
-0.8063465, 1.480051, -0.8171267, 1, 1, 1, 1, 1,
-0.8050202, 1.461192, 1.021462, 1, 1, 1, 1, 1,
-0.7980275, 1.486012, -0.6617234, 0, 0, 1, 1, 1,
-0.7954804, -1.112877, -3.378994, 1, 0, 0, 1, 1,
-0.7934297, 0.75666, -0.05556576, 1, 0, 0, 1, 1,
-0.7866875, -0.3455257, -0.1157269, 1, 0, 0, 1, 1,
-0.7864618, -1.395408, -2.682165, 1, 0, 0, 1, 1,
-0.7837663, 0.1211169, -0.01485914, 1, 0, 0, 1, 1,
-0.7833322, -0.7865207, -1.193555, 0, 0, 0, 1, 1,
-0.7797524, -1.95349, -4.499986, 0, 0, 0, 1, 1,
-0.7697039, 0.1694218, -1.685976, 0, 0, 0, 1, 1,
-0.769621, 1.073751, -0.6063219, 0, 0, 0, 1, 1,
-0.7661148, -0.4099987, -2.934258, 0, 0, 0, 1, 1,
-0.7618914, -1.689299, -3.550632, 0, 0, 0, 1, 1,
-0.757942, 0.1780945, -0.3046278, 0, 0, 0, 1, 1,
-0.7563024, -0.951462, -3.15185, 1, 1, 1, 1, 1,
-0.7514409, -0.3272423, -3.431854, 1, 1, 1, 1, 1,
-0.7490514, 0.8604158, -1.041745, 1, 1, 1, 1, 1,
-0.7488655, 0.7735007, -0.2741775, 1, 1, 1, 1, 1,
-0.7466543, 0.009551038, -0.1286565, 1, 1, 1, 1, 1,
-0.7427972, 1.693786, 0.3177362, 1, 1, 1, 1, 1,
-0.7377971, -1.295551, -2.492591, 1, 1, 1, 1, 1,
-0.7361791, -0.626677, -1.232306, 1, 1, 1, 1, 1,
-0.7360783, -0.3463104, -3.002445, 1, 1, 1, 1, 1,
-0.7334373, -0.6915247, -3.055433, 1, 1, 1, 1, 1,
-0.7326132, 0.3341664, -1.507797, 1, 1, 1, 1, 1,
-0.7298498, -1.040888, -0.6995149, 1, 1, 1, 1, 1,
-0.7286005, -0.4995548, -2.035309, 1, 1, 1, 1, 1,
-0.727896, 0.040146, -2.667768, 1, 1, 1, 1, 1,
-0.7204888, -0.6057135, -3.007692, 1, 1, 1, 1, 1,
-0.7194383, -1.108112, -3.466414, 0, 0, 1, 1, 1,
-0.7159631, 0.2498206, -1.489168, 1, 0, 0, 1, 1,
-0.7154775, -1.233538, -3.676813, 1, 0, 0, 1, 1,
-0.7143741, -1.233596, -2.473038, 1, 0, 0, 1, 1,
-0.7123245, -0.6960012, -2.267565, 1, 0, 0, 1, 1,
-0.7102677, 2.308858, -1.077153, 1, 0, 0, 1, 1,
-0.7081953, 0.5512807, 0.0293981, 0, 0, 0, 1, 1,
-0.7051525, -1.424708, -3.128082, 0, 0, 0, 1, 1,
-0.7016346, -1.109144, -2.901913, 0, 0, 0, 1, 1,
-0.6961002, -0.5059095, -0.9071321, 0, 0, 0, 1, 1,
-0.6903509, 0.6995186, 0.6993635, 0, 0, 0, 1, 1,
-0.6883891, 0.7166494, -1.011454, 0, 0, 0, 1, 1,
-0.688082, -0.7591907, -3.712326, 0, 0, 0, 1, 1,
-0.6843758, -0.4584832, -1.693699, 1, 1, 1, 1, 1,
-0.6842479, 0.3016281, -2.803027, 1, 1, 1, 1, 1,
-0.6839823, -0.2665794, -1.746002, 1, 1, 1, 1, 1,
-0.6724125, 1.492877, -0.626731, 1, 1, 1, 1, 1,
-0.6711272, 1.465637, -0.9419425, 1, 1, 1, 1, 1,
-0.6710715, 2.408167, -0.6758915, 1, 1, 1, 1, 1,
-0.6593738, 0.6740258, -2.301899, 1, 1, 1, 1, 1,
-0.6559173, 0.3472642, -1.876385, 1, 1, 1, 1, 1,
-0.6531864, -0.6456634, -3.201056, 1, 1, 1, 1, 1,
-0.6496819, -1.12826, -2.590944, 1, 1, 1, 1, 1,
-0.6455569, -0.5803764, -0.507076, 1, 1, 1, 1, 1,
-0.6374704, -0.1323749, -1.474134, 1, 1, 1, 1, 1,
-0.6314074, -0.06848843, -2.977982, 1, 1, 1, 1, 1,
-0.630962, -0.01885387, -0.3751554, 1, 1, 1, 1, 1,
-0.6296818, -0.4900591, -1.778591, 1, 1, 1, 1, 1,
-0.627759, -0.1182693, -4.028141, 0, 0, 1, 1, 1,
-0.621949, 1.205245, 0.5572727, 1, 0, 0, 1, 1,
-0.6204726, -0.1634632, -2.722278, 1, 0, 0, 1, 1,
-0.6203898, -1.556521, -1.570391, 1, 0, 0, 1, 1,
-0.6125205, 0.5683114, -0.05299786, 1, 0, 0, 1, 1,
-0.6119241, -1.020704, -1.507205, 1, 0, 0, 1, 1,
-0.6081798, -0.4456128, -1.124658, 0, 0, 0, 1, 1,
-0.6039372, 0.7767181, -0.6836637, 0, 0, 0, 1, 1,
-0.5986833, 0.8649247, -1.042786, 0, 0, 0, 1, 1,
-0.5933664, -0.1476653, -2.933291, 0, 0, 0, 1, 1,
-0.5919401, 0.9721432, 0.5972662, 0, 0, 0, 1, 1,
-0.589394, 2.346894, -0.1933426, 0, 0, 0, 1, 1,
-0.5876629, -1.840911, -2.95003, 0, 0, 0, 1, 1,
-0.5873476, 0.09209466, -2.042489, 1, 1, 1, 1, 1,
-0.5872483, -0.6166101, -2.346738, 1, 1, 1, 1, 1,
-0.5870823, 1.236999, -1.141189, 1, 1, 1, 1, 1,
-0.581436, -0.7168033, -3.06661, 1, 1, 1, 1, 1,
-0.581192, 1.182181, -0.3485906, 1, 1, 1, 1, 1,
-0.5807946, 2.136345, 0.01924656, 1, 1, 1, 1, 1,
-0.580175, -0.2102335, -3.50835, 1, 1, 1, 1, 1,
-0.5784512, -0.227276, -0.8174671, 1, 1, 1, 1, 1,
-0.5775729, 0.7604785, -1.970465, 1, 1, 1, 1, 1,
-0.5746152, 0.7391315, -0.09246084, 1, 1, 1, 1, 1,
-0.5633444, -1.395948, -2.025515, 1, 1, 1, 1, 1,
-0.5633078, 0.1779261, 0.2285197, 1, 1, 1, 1, 1,
-0.5619966, 0.3683866, -0.2280885, 1, 1, 1, 1, 1,
-0.5571458, 0.1835345, -0.9356741, 1, 1, 1, 1, 1,
-0.5550423, 0.8223348, -1.001798, 1, 1, 1, 1, 1,
-0.5531967, 1.793639, -0.3039639, 0, 0, 1, 1, 1,
-0.5516088, -1.401739, -3.645724, 1, 0, 0, 1, 1,
-0.5463629, 0.3791391, -0.820465, 1, 0, 0, 1, 1,
-0.5424304, 0.1438498, -2.28879, 1, 0, 0, 1, 1,
-0.5401741, -0.1470537, -1.847129, 1, 0, 0, 1, 1,
-0.5369561, -1.317507, -2.792293, 1, 0, 0, 1, 1,
-0.5344112, -1.309847, -2.473897, 0, 0, 0, 1, 1,
-0.5327626, -1.095849, -2.208301, 0, 0, 0, 1, 1,
-0.5276362, -0.1935431, -0.6604189, 0, 0, 0, 1, 1,
-0.5170072, 0.4578524, 0.4705874, 0, 0, 0, 1, 1,
-0.5115074, -0.65964, -4.352872, 0, 0, 0, 1, 1,
-0.5003147, 0.516955, -1.926063, 0, 0, 0, 1, 1,
-0.4910412, -2.195944, -1.990101, 0, 0, 0, 1, 1,
-0.49069, 1.099047, -0.5009045, 1, 1, 1, 1, 1,
-0.4896993, 0.9486237, 0.319575, 1, 1, 1, 1, 1,
-0.4880552, -0.01000313, -1.269063, 1, 1, 1, 1, 1,
-0.4856966, -0.467567, -0.9702004, 1, 1, 1, 1, 1,
-0.4855922, 1.124479, 0.2702398, 1, 1, 1, 1, 1,
-0.4851441, 0.1186397, -2.889165, 1, 1, 1, 1, 1,
-0.4826266, -0.3439653, -2.860213, 1, 1, 1, 1, 1,
-0.4799084, -0.1755489, -2.929037, 1, 1, 1, 1, 1,
-0.478056, -0.201814, -0.7567561, 1, 1, 1, 1, 1,
-0.4778613, 0.9027639, -0.8493239, 1, 1, 1, 1, 1,
-0.4724237, -0.4812831, -1.87838, 1, 1, 1, 1, 1,
-0.4682682, 0.6443269, -1.002814, 1, 1, 1, 1, 1,
-0.467542, 0.9129336, -0.9768677, 1, 1, 1, 1, 1,
-0.4643205, 0.3385684, 0.009031382, 1, 1, 1, 1, 1,
-0.4584118, 0.4316132, -1.979426, 1, 1, 1, 1, 1,
-0.4570566, -0.06132722, -2.654796, 0, 0, 1, 1, 1,
-0.4562499, -0.5805629, -4.481057, 1, 0, 0, 1, 1,
-0.454896, 0.1636539, -0.3288601, 1, 0, 0, 1, 1,
-0.4509607, -0.6735156, -0.671544, 1, 0, 0, 1, 1,
-0.4507104, 1.013455, 0.1645563, 1, 0, 0, 1, 1,
-0.4465165, 0.1771072, -1.274845, 1, 0, 0, 1, 1,
-0.4404186, 1.172001, -0.2176246, 0, 0, 0, 1, 1,
-0.4380186, 0.2703548, -1.208256, 0, 0, 0, 1, 1,
-0.4342726, 0.1878595, -0.04600982, 0, 0, 0, 1, 1,
-0.4312764, 0.3529504, -2.074063, 0, 0, 0, 1, 1,
-0.4308154, -1.091864, -3.307915, 0, 0, 0, 1, 1,
-0.4302313, 0.2782006, -1.129036, 0, 0, 0, 1, 1,
-0.4287997, 0.2994593, -1.870292, 0, 0, 0, 1, 1,
-0.4233841, 0.3837326, -0.6091008, 1, 1, 1, 1, 1,
-0.4189637, -1.341437, -3.213883, 1, 1, 1, 1, 1,
-0.40827, -0.5240991, -3.088536, 1, 1, 1, 1, 1,
-0.4070832, 2.193195, -1.56438, 1, 1, 1, 1, 1,
-0.4054031, 0.6043414, 0.9218513, 1, 1, 1, 1, 1,
-0.4046474, 0.5089212, -1.216732, 1, 1, 1, 1, 1,
-0.4019031, 1.057472, -0.7842457, 1, 1, 1, 1, 1,
-0.3948151, 0.274332, -2.43255, 1, 1, 1, 1, 1,
-0.3936004, 0.2599295, -0.3065394, 1, 1, 1, 1, 1,
-0.3932365, 0.3745676, -1.548182, 1, 1, 1, 1, 1,
-0.3873335, 1.201534, 0.907429, 1, 1, 1, 1, 1,
-0.3844953, -2.244017, -2.973674, 1, 1, 1, 1, 1,
-0.3834587, -0.1781303, -2.479443, 1, 1, 1, 1, 1,
-0.3816864, -0.8120436, -3.586316, 1, 1, 1, 1, 1,
-0.3795697, 0.2839689, -0.3236023, 1, 1, 1, 1, 1,
-0.3740735, 0.2557448, -1.031414, 0, 0, 1, 1, 1,
-0.3730824, 1.667222, 1.727508, 1, 0, 0, 1, 1,
-0.3729422, 2.026679, -0.5439566, 1, 0, 0, 1, 1,
-0.371347, -0.7938396, -1.620941, 1, 0, 0, 1, 1,
-0.3660401, -1.136584, -2.351467, 1, 0, 0, 1, 1,
-0.3629106, -0.3106335, -1.154031, 1, 0, 0, 1, 1,
-0.3592895, 0.73027, -0.793535, 0, 0, 0, 1, 1,
-0.3576825, -0.9261391, -2.730992, 0, 0, 0, 1, 1,
-0.3573999, -1.265312, -1.814711, 0, 0, 0, 1, 1,
-0.3552287, 0.6788865, 0.5499097, 0, 0, 0, 1, 1,
-0.3552279, 0.03931105, -1.262818, 0, 0, 0, 1, 1,
-0.3503179, -1.220581, -3.844831, 0, 0, 0, 1, 1,
-0.3493662, 1.901715, -0.7180415, 0, 0, 0, 1, 1,
-0.3472514, -0.9277337, -2.581274, 1, 1, 1, 1, 1,
-0.3403337, 0.2391685, -0.3495582, 1, 1, 1, 1, 1,
-0.3390051, -1.916004, -2.018123, 1, 1, 1, 1, 1,
-0.3362238, -0.1736616, -0.8180045, 1, 1, 1, 1, 1,
-0.335741, 0.8153724, 0.1281249, 1, 1, 1, 1, 1,
-0.3355591, 1.569739, -1.144112, 1, 1, 1, 1, 1,
-0.3322257, -1.850003, -1.232973, 1, 1, 1, 1, 1,
-0.3306307, -1.285271, -3.284308, 1, 1, 1, 1, 1,
-0.330157, 0.2578833, -3.179434, 1, 1, 1, 1, 1,
-0.328339, 0.4820092, -1.568477, 1, 1, 1, 1, 1,
-0.3278487, 0.9221462, 1.236311, 1, 1, 1, 1, 1,
-0.3232769, 0.515761, -0.6737289, 1, 1, 1, 1, 1,
-0.3198011, -0.8029476, -3.301414, 1, 1, 1, 1, 1,
-0.3194444, 0.9771658, 0.3169256, 1, 1, 1, 1, 1,
-0.318255, 0.2463441, -3.039085, 1, 1, 1, 1, 1,
-0.3160162, 0.3886276, -0.5700518, 0, 0, 1, 1, 1,
-0.3137697, 0.5823491, 0.1670251, 1, 0, 0, 1, 1,
-0.3086764, 0.3199656, -0.3945741, 1, 0, 0, 1, 1,
-0.306662, 1.994036, 1.615192, 1, 0, 0, 1, 1,
-0.306349, 0.08569903, -0.8907635, 1, 0, 0, 1, 1,
-0.3049593, 0.6624184, -1.017317, 1, 0, 0, 1, 1,
-0.2976065, 0.02547642, -2.352284, 0, 0, 0, 1, 1,
-0.2969444, -0.3563907, -3.82022, 0, 0, 0, 1, 1,
-0.2914623, -0.5696218, -2.266215, 0, 0, 0, 1, 1,
-0.2859357, 0.4211648, -0.4867615, 0, 0, 0, 1, 1,
-0.2803921, -0.1052659, -0.8914088, 0, 0, 0, 1, 1,
-0.2795666, 1.163204, -0.2024941, 0, 0, 0, 1, 1,
-0.2733071, -1.626241, -3.032545, 0, 0, 0, 1, 1,
-0.2681446, -0.6598142, -4.892238, 1, 1, 1, 1, 1,
-0.2661932, -0.5061178, -4.270362, 1, 1, 1, 1, 1,
-0.2653411, 0.473709, -1.120113, 1, 1, 1, 1, 1,
-0.2639849, -0.5398313, -3.867762, 1, 1, 1, 1, 1,
-0.2630438, -0.06533057, -2.573485, 1, 1, 1, 1, 1,
-0.2624353, 2.677989, -1.467417, 1, 1, 1, 1, 1,
-0.2574446, -0.2019602, -1.222343, 1, 1, 1, 1, 1,
-0.2565743, -1.633262, -2.354181, 1, 1, 1, 1, 1,
-0.2564758, -0.9429927, -2.498765, 1, 1, 1, 1, 1,
-0.2524136, 1.759002, -1.802635, 1, 1, 1, 1, 1,
-0.2517247, -0.3984404, -1.497223, 1, 1, 1, 1, 1,
-0.2506606, 0.9723709, -0.8036557, 1, 1, 1, 1, 1,
-0.2432404, 1.166539, 0.6654315, 1, 1, 1, 1, 1,
-0.2421947, -1.614093, -3.163332, 1, 1, 1, 1, 1,
-0.2397189, -0.5102566, -1.567492, 1, 1, 1, 1, 1,
-0.2388902, 0.367172, -0.3734902, 0, 0, 1, 1, 1,
-0.2368099, 1.057257, -0.2901809, 1, 0, 0, 1, 1,
-0.2361804, -1.235906, -4.560606, 1, 0, 0, 1, 1,
-0.2359529, 0.6036163, -0.6504945, 1, 0, 0, 1, 1,
-0.235371, -0.5768594, -1.494956, 1, 0, 0, 1, 1,
-0.2341689, 0.9463979, -0.2641413, 1, 0, 0, 1, 1,
-0.2338984, 1.665691, -2.29336, 0, 0, 0, 1, 1,
-0.2300604, -2.02138, -4.001165, 0, 0, 0, 1, 1,
-0.2285138, -0.5056292, -1.436564, 0, 0, 0, 1, 1,
-0.2256082, 0.05825599, -0.5542842, 0, 0, 0, 1, 1,
-0.2251946, -0.4966882, -2.373137, 0, 0, 0, 1, 1,
-0.2218293, -0.1324895, -2.644133, 0, 0, 0, 1, 1,
-0.2187475, 0.5631364, -0.3186171, 0, 0, 0, 1, 1,
-0.216213, 0.4801984, -1.737632, 1, 1, 1, 1, 1,
-0.2154319, 1.099232, -1.572692, 1, 1, 1, 1, 1,
-0.2123603, -1.496632, -3.088344, 1, 1, 1, 1, 1,
-0.2086063, 1.173488, -1.415323, 1, 1, 1, 1, 1,
-0.2082016, 0.2577425, -0.4675478, 1, 1, 1, 1, 1,
-0.2068547, 1.397292, -0.3289484, 1, 1, 1, 1, 1,
-0.2039595, 0.4628792, -1.775313, 1, 1, 1, 1, 1,
-0.2023553, -0.8046132, -2.751598, 1, 1, 1, 1, 1,
-0.2005937, 0.4633049, -0.6793756, 1, 1, 1, 1, 1,
-0.1959439, 0.1021056, 0.003209591, 1, 1, 1, 1, 1,
-0.1950067, -1.09683, -2.28349, 1, 1, 1, 1, 1,
-0.1935676, -1.136279, -2.044405, 1, 1, 1, 1, 1,
-0.1853892, -0.2035163, -1.928645, 1, 1, 1, 1, 1,
-0.1828476, -1.494245, -3.605786, 1, 1, 1, 1, 1,
-0.1823713, 1.505247, -0.7971976, 1, 1, 1, 1, 1,
-0.1818705, 0.2244136, 0.5656611, 0, 0, 1, 1, 1,
-0.1785311, 0.5129138, 0.2537689, 1, 0, 0, 1, 1,
-0.1769895, 0.4375655, -1.09133, 1, 0, 0, 1, 1,
-0.1735755, 2.449536, 1.407974, 1, 0, 0, 1, 1,
-0.1729315, 0.08044961, -0.7789972, 1, 0, 0, 1, 1,
-0.1705819, 0.4551362, 0.7319053, 1, 0, 0, 1, 1,
-0.1691472, -1.53507, -2.390577, 0, 0, 0, 1, 1,
-0.1689817, -0.3437276, -1.968028, 0, 0, 0, 1, 1,
-0.1662462, 1.655621, 1.834354, 0, 0, 0, 1, 1,
-0.1646308, -0.7475819, -2.802391, 0, 0, 0, 1, 1,
-0.1612197, 1.098302, -0.1784589, 0, 0, 0, 1, 1,
-0.1598697, 0.07735314, -1.105256, 0, 0, 0, 1, 1,
-0.1591029, 0.8235043, 0.2721208, 0, 0, 0, 1, 1,
-0.1589243, -0.3721878, -2.218547, 1, 1, 1, 1, 1,
-0.1586861, -1.454725, -3.152345, 1, 1, 1, 1, 1,
-0.1556771, -1.651845, -2.789732, 1, 1, 1, 1, 1,
-0.1539606, 0.1129828, -0.1858807, 1, 1, 1, 1, 1,
-0.1505906, -0.915916, -2.829818, 1, 1, 1, 1, 1,
-0.1468776, -0.6289222, -2.604512, 1, 1, 1, 1, 1,
-0.1458554, 2.930284, -1.758365, 1, 1, 1, 1, 1,
-0.1444243, 0.3298592, -1.719454, 1, 1, 1, 1, 1,
-0.1394641, -0.9751787, -3.458167, 1, 1, 1, 1, 1,
-0.1362341, 2.092763, 0.7926288, 1, 1, 1, 1, 1,
-0.127988, 0.6084724, 0.7146782, 1, 1, 1, 1, 1,
-0.1260724, 1.027763, -0.4568286, 1, 1, 1, 1, 1,
-0.12324, 0.2440267, 0.5426964, 1, 1, 1, 1, 1,
-0.1231479, 0.1461482, -0.3576525, 1, 1, 1, 1, 1,
-0.1170983, -1.003861, -3.365487, 1, 1, 1, 1, 1,
-0.1078712, -0.3415378, -4.000809, 0, 0, 1, 1, 1,
-0.103163, -0.8959208, -2.657986, 1, 0, 0, 1, 1,
-0.1025677, -0.6119297, -3.82944, 1, 0, 0, 1, 1,
-0.1008526, -0.1563924, -3.221907, 1, 0, 0, 1, 1,
-0.09893838, -1.263706, -2.79938, 1, 0, 0, 1, 1,
-0.09328026, 1.147207, 0.3528862, 1, 0, 0, 1, 1,
-0.09209605, 1.293408, -0.147839, 0, 0, 0, 1, 1,
-0.09043896, 1.274099, -1.633977, 0, 0, 0, 1, 1,
-0.08443695, -0.1354222, -2.329371, 0, 0, 0, 1, 1,
-0.08360957, 0.782145, -0.944812, 0, 0, 0, 1, 1,
-0.08277146, -0.5747306, -4.417296, 0, 0, 0, 1, 1,
-0.08198906, 0.3679307, 0.1708493, 0, 0, 0, 1, 1,
-0.07996213, -0.2764422, -4.723985, 0, 0, 0, 1, 1,
-0.07873012, -0.4064106, -1.947643, 1, 1, 1, 1, 1,
-0.07819606, 0.4861169, -2.424517, 1, 1, 1, 1, 1,
-0.0776685, -0.4839747, -1.427087, 1, 1, 1, 1, 1,
-0.07437349, -0.542409, -2.332873, 1, 1, 1, 1, 1,
-0.07339562, 1.345895, 1.138244, 1, 1, 1, 1, 1,
-0.07289131, -1.876135, -3.62842, 1, 1, 1, 1, 1,
-0.06848047, -1.187405, -3.772479, 1, 1, 1, 1, 1,
-0.0580947, 1.118816, -1.121078, 1, 1, 1, 1, 1,
-0.05782389, 0.2434925, 0.2259306, 1, 1, 1, 1, 1,
-0.05651714, 1.718612, 2.548234, 1, 1, 1, 1, 1,
-0.05631303, 1.174987, 1.098872, 1, 1, 1, 1, 1,
-0.05171021, -0.08750463, -2.740657, 1, 1, 1, 1, 1,
-0.04990318, 0.2571539, 0.2789071, 1, 1, 1, 1, 1,
-0.03889145, 0.004572848, -3.08425, 1, 1, 1, 1, 1,
-0.03240635, 1.016769, -0.08095983, 1, 1, 1, 1, 1,
-0.03198731, -1.388718, -2.221343, 0, 0, 1, 1, 1,
-0.0317265, -0.1946491, -3.191886, 1, 0, 0, 1, 1,
-0.03143616, -0.1627225, -4.018013, 1, 0, 0, 1, 1,
-0.02951763, 1.256587, 0.5460595, 1, 0, 0, 1, 1,
-0.0261921, -1.765752, -3.663103, 1, 0, 0, 1, 1,
-0.02362949, -0.9694108, -3.881807, 1, 0, 0, 1, 1,
-0.02247434, -0.195125, -2.99309, 0, 0, 0, 1, 1,
-0.02162622, -0.1905471, -3.709777, 0, 0, 0, 1, 1,
-0.02127913, 1.933116, 0.7409031, 0, 0, 0, 1, 1,
-0.02022393, 1.699079, -0.5772731, 0, 0, 0, 1, 1,
-0.01040276, 1.04561, 0.1922981, 0, 0, 0, 1, 1,
-0.0008330032, -0.9486395, -2.2421, 0, 0, 0, 1, 1,
0.004677698, -1.807149, 1.330978, 0, 0, 0, 1, 1,
0.005833384, 0.3130562, -0.002733699, 1, 1, 1, 1, 1,
0.008279935, -0.4850126, 2.613299, 1, 1, 1, 1, 1,
0.008387331, 0.5717387, 1.282918, 1, 1, 1, 1, 1,
0.01115711, 0.2127459, 0.7060049, 1, 1, 1, 1, 1,
0.01291923, -0.4850089, 3.372747, 1, 1, 1, 1, 1,
0.01365615, 0.5239969, -1.123388, 1, 1, 1, 1, 1,
0.01487537, 0.3764418, 1.555233, 1, 1, 1, 1, 1,
0.01724843, 0.8884757, -0.8325297, 1, 1, 1, 1, 1,
0.01797282, -1.579084, 3.389039, 1, 1, 1, 1, 1,
0.0190732, 0.2355248, -0.8015974, 1, 1, 1, 1, 1,
0.02529978, -0.1358849, 1.979985, 1, 1, 1, 1, 1,
0.02699843, -0.45244, 2.87239, 1, 1, 1, 1, 1,
0.03164523, -1.233687, 4.661883, 1, 1, 1, 1, 1,
0.03402257, -0.9436933, 3.899912, 1, 1, 1, 1, 1,
0.03544712, 0.9737747, 0.2624316, 1, 1, 1, 1, 1,
0.04065025, -0.2374316, 2.537447, 0, 0, 1, 1, 1,
0.04329242, 1.431341, 0.6359276, 1, 0, 0, 1, 1,
0.04411971, 0.2066805, -0.5773734, 1, 0, 0, 1, 1,
0.0473779, 1.693332, 1.076609, 1, 0, 0, 1, 1,
0.05504265, 0.333909, -0.5205894, 1, 0, 0, 1, 1,
0.06253967, -1.071494, 3.866469, 1, 0, 0, 1, 1,
0.06313715, -0.4703752, 2.215562, 0, 0, 0, 1, 1,
0.06771674, 0.009238784, 1.75545, 0, 0, 0, 1, 1,
0.06795786, -1.398681, 3.040275, 0, 0, 0, 1, 1,
0.07037216, -1.252111, 2.636046, 0, 0, 0, 1, 1,
0.07299296, -0.4035731, -0.6221363, 0, 0, 0, 1, 1,
0.07389861, -2.162836, 3.533975, 0, 0, 0, 1, 1,
0.07524965, -1.895991, 2.091132, 0, 0, 0, 1, 1,
0.07560388, -1.188831, 3.942883, 1, 1, 1, 1, 1,
0.07940613, -0.535648, 1.86355, 1, 1, 1, 1, 1,
0.08449023, 0.09675349, 0.9324454, 1, 1, 1, 1, 1,
0.08872149, 0.4549745, -0.3320067, 1, 1, 1, 1, 1,
0.08913222, -0.8961747, 2.980408, 1, 1, 1, 1, 1,
0.09501602, 0.172155, 0.1570193, 1, 1, 1, 1, 1,
0.09594472, -1.825153, 2.242011, 1, 1, 1, 1, 1,
0.1014466, 0.5539505, 0.5352118, 1, 1, 1, 1, 1,
0.1031612, 0.677146, 1.705697, 1, 1, 1, 1, 1,
0.1058107, -0.7494286, 4.059363, 1, 1, 1, 1, 1,
0.1060785, 1.764648, 1.104921, 1, 1, 1, 1, 1,
0.1102963, -0.5985542, 3.783317, 1, 1, 1, 1, 1,
0.1141965, -0.7944681, 3.532003, 1, 1, 1, 1, 1,
0.1147659, 0.7180899, -1.245067, 1, 1, 1, 1, 1,
0.1284515, -0.5832188, 3.806364, 1, 1, 1, 1, 1,
0.1343562, 1.251027, -1.399576, 0, 0, 1, 1, 1,
0.1381946, -0.08101455, 2.235043, 1, 0, 0, 1, 1,
0.1390064, -1.101633, 2.617403, 1, 0, 0, 1, 1,
0.1390345, -1.056674, 4.357727, 1, 0, 0, 1, 1,
0.1406727, 0.4835692, -0.8923658, 1, 0, 0, 1, 1,
0.1416017, 1.037149, -0.4576517, 1, 0, 0, 1, 1,
0.1417633, 1.19997, -1.871734, 0, 0, 0, 1, 1,
0.1439733, -0.6250076, 1.952122, 0, 0, 0, 1, 1,
0.144639, -0.1924392, 2.272571, 0, 0, 0, 1, 1,
0.1612859, 0.2523087, -1.275859, 0, 0, 0, 1, 1,
0.1706529, 1.438917, 0.9212076, 0, 0, 0, 1, 1,
0.1745134, 0.5509213, 0.3445799, 0, 0, 0, 1, 1,
0.1745882, -1.990808, 3.931069, 0, 0, 0, 1, 1,
0.1761153, 1.208654, -0.03809222, 1, 1, 1, 1, 1,
0.1789322, 1.134641, 1.940422, 1, 1, 1, 1, 1,
0.1810476, 0.6630966, -0.2657005, 1, 1, 1, 1, 1,
0.1850631, 0.01593569, 2.895277, 1, 1, 1, 1, 1,
0.1868484, -0.8633099, 2.655364, 1, 1, 1, 1, 1,
0.1870907, 0.07660528, 3.035363, 1, 1, 1, 1, 1,
0.1881336, 2.139824, -2.646712, 1, 1, 1, 1, 1,
0.1894615, -0.3442991, 3.890271, 1, 1, 1, 1, 1,
0.1906978, 1.160216, 1.521581, 1, 1, 1, 1, 1,
0.1992226, 1.106871, 0.1183859, 1, 1, 1, 1, 1,
0.1997384, -1.031708, 2.762429, 1, 1, 1, 1, 1,
0.2115683, 0.7791001, -0.3132157, 1, 1, 1, 1, 1,
0.2138403, 0.5609148, 1.653113, 1, 1, 1, 1, 1,
0.2152572, 0.02818698, 1.439135, 1, 1, 1, 1, 1,
0.2168291, -0.2999163, 3.730284, 1, 1, 1, 1, 1,
0.2174792, -0.5712097, 4.499705, 0, 0, 1, 1, 1,
0.2181676, -0.7764449, 3.439202, 1, 0, 0, 1, 1,
0.2195192, -0.09131398, 3.463998, 1, 0, 0, 1, 1,
0.2257308, -1.062306, 3.682465, 1, 0, 0, 1, 1,
0.225928, 1.030554, -0.2650849, 1, 0, 0, 1, 1,
0.2259408, 0.5293041, -0.6835459, 1, 0, 0, 1, 1,
0.2286474, -1.004098, 3.663477, 0, 0, 0, 1, 1,
0.2296541, 0.3085932, 0.6158224, 0, 0, 0, 1, 1,
0.2305499, 0.2344638, -0.2842792, 0, 0, 0, 1, 1,
0.2335227, -0.2395792, 3.780237, 0, 0, 0, 1, 1,
0.2340924, -0.3406213, 3.811446, 0, 0, 0, 1, 1,
0.2383045, -0.3839226, 1.848571, 0, 0, 0, 1, 1,
0.241405, -1.625531, 3.192024, 0, 0, 0, 1, 1,
0.2418409, 0.03788085, 3.036175, 1, 1, 1, 1, 1,
0.2429094, 0.6007664, 0.5118157, 1, 1, 1, 1, 1,
0.2454451, 0.6183998, 0.7491206, 1, 1, 1, 1, 1,
0.2462837, -2.482211, 3.349572, 1, 1, 1, 1, 1,
0.2489285, -0.8206269, 2.014521, 1, 1, 1, 1, 1,
0.2514755, -0.01441797, 1.430865, 1, 1, 1, 1, 1,
0.2520749, -1.428346, 2.251235, 1, 1, 1, 1, 1,
0.2527211, -0.5352762, 5.051372, 1, 1, 1, 1, 1,
0.2572135, 2.797953, 0.1561347, 1, 1, 1, 1, 1,
0.2598003, 0.2408039, -0.280976, 1, 1, 1, 1, 1,
0.2619736, 0.7951486, -0.3835464, 1, 1, 1, 1, 1,
0.2624361, -0.6085949, 4.332076, 1, 1, 1, 1, 1,
0.2639897, 1.22634, 0.5788722, 1, 1, 1, 1, 1,
0.2656767, 0.1069742, 0.934204, 1, 1, 1, 1, 1,
0.2659249, -0.4508269, 1.54808, 1, 1, 1, 1, 1,
0.266221, 3.185206, 1.094159, 0, 0, 1, 1, 1,
0.2694737, -1.081988, 1.384314, 1, 0, 0, 1, 1,
0.2698454, 2.325524, 0.3909027, 1, 0, 0, 1, 1,
0.2785087, -1.401251, 2.851458, 1, 0, 0, 1, 1,
0.2811808, 0.01809652, 1.096789, 1, 0, 0, 1, 1,
0.2820211, -0.5303589, 2.278205, 1, 0, 0, 1, 1,
0.2947243, -0.5643955, 2.076187, 0, 0, 0, 1, 1,
0.2982344, 1.335561, 1.548818, 0, 0, 0, 1, 1,
0.2995465, 1.857095, 0.9331874, 0, 0, 0, 1, 1,
0.3007689, 1.128267, -0.3550918, 0, 0, 0, 1, 1,
0.3009187, 0.6783245, 0.5652131, 0, 0, 0, 1, 1,
0.3020474, 0.3464285, 3.024563, 0, 0, 0, 1, 1,
0.3072882, -1.864966, 2.480077, 0, 0, 0, 1, 1,
0.3125294, -0.3611954, 2.59743, 1, 1, 1, 1, 1,
0.3133354, 1.641792, 0.446777, 1, 1, 1, 1, 1,
0.3148749, -0.1168605, 0.8877986, 1, 1, 1, 1, 1,
0.3208963, 0.08040596, -0.07044677, 1, 1, 1, 1, 1,
0.3262835, 0.9825814, 1.719148, 1, 1, 1, 1, 1,
0.3310744, -1.027251, 3.457633, 1, 1, 1, 1, 1,
0.3310974, -0.102424, -0.7535165, 1, 1, 1, 1, 1,
0.3434536, 0.3889615, 2.271994, 1, 1, 1, 1, 1,
0.3451392, -0.433832, 2.211076, 1, 1, 1, 1, 1,
0.345872, 0.5857546, 0.207369, 1, 1, 1, 1, 1,
0.3485529, 0.364962, 2.255733, 1, 1, 1, 1, 1,
0.3487162, -1.016008, 2.734844, 1, 1, 1, 1, 1,
0.3496997, 2.259424, -0.7339044, 1, 1, 1, 1, 1,
0.3511314, -0.2491275, 3.558993, 1, 1, 1, 1, 1,
0.3528244, 0.8350105, -0.93183, 1, 1, 1, 1, 1,
0.3572564, -1.505453, 4.388552, 0, 0, 1, 1, 1,
0.3607378, 0.7719139, -0.1451363, 1, 0, 0, 1, 1,
0.3648067, 0.1546464, 1.46948, 1, 0, 0, 1, 1,
0.3648514, -0.8959795, 2.270483, 1, 0, 0, 1, 1,
0.3663425, 1.092275, 1.635731, 1, 0, 0, 1, 1,
0.3691145, -0.4043415, 3.485096, 1, 0, 0, 1, 1,
0.3695022, -0.7920431, 2.707256, 0, 0, 0, 1, 1,
0.3716501, 1.287386, -0.06819742, 0, 0, 0, 1, 1,
0.3747013, 0.07270612, 0.6170824, 0, 0, 0, 1, 1,
0.3768056, 1.720777, -0.3111624, 0, 0, 0, 1, 1,
0.3775188, 1.013684, 0.5158521, 0, 0, 0, 1, 1,
0.3775976, -1.346997, 3.345634, 0, 0, 0, 1, 1,
0.3792266, -0.4285275, 2.180889, 0, 0, 0, 1, 1,
0.3868105, -2.113096, 3.437677, 1, 1, 1, 1, 1,
0.3963264, -1.26949, 3.895667, 1, 1, 1, 1, 1,
0.4004281, -0.6314484, 2.508338, 1, 1, 1, 1, 1,
0.4008058, -0.1245828, 2.152452, 1, 1, 1, 1, 1,
0.4039029, -0.1497325, 1.061199, 1, 1, 1, 1, 1,
0.4057763, 0.5120128, -1.422109, 1, 1, 1, 1, 1,
0.4058789, -0.1655998, 1.55426, 1, 1, 1, 1, 1,
0.4100196, 0.6746286, 0.6257789, 1, 1, 1, 1, 1,
0.4115877, -0.7489817, 1.989042, 1, 1, 1, 1, 1,
0.4126703, -0.6693784, 3.132362, 1, 1, 1, 1, 1,
0.4146403, 1.278077, -0.4203465, 1, 1, 1, 1, 1,
0.4187749, 1.027902, -1.001924, 1, 1, 1, 1, 1,
0.4204729, -1.17117, 2.232334, 1, 1, 1, 1, 1,
0.4250163, 0.5170102, 0.2655643, 1, 1, 1, 1, 1,
0.4284067, 0.6854821, -0.039473, 1, 1, 1, 1, 1,
0.4305637, 0.159572, 2.778413, 0, 0, 1, 1, 1,
0.4316266, 0.1082072, 1.048099, 1, 0, 0, 1, 1,
0.4346059, -2.566087, 2.290463, 1, 0, 0, 1, 1,
0.435223, 0.9608346, 3.134936, 1, 0, 0, 1, 1,
0.4396428, 0.5083678, -0.01544984, 1, 0, 0, 1, 1,
0.442134, -0.06224468, 0.7742689, 1, 0, 0, 1, 1,
0.4425372, 0.4421382, 0.9902656, 0, 0, 0, 1, 1,
0.4430683, 1.38178, -0.5516223, 0, 0, 0, 1, 1,
0.4453433, 0.2484192, 2.746902, 0, 0, 0, 1, 1,
0.4461018, -0.1736702, 1.824014, 0, 0, 0, 1, 1,
0.4497413, -0.8797634, 1.757166, 0, 0, 0, 1, 1,
0.4501684, 1.516899, 0.2533983, 0, 0, 0, 1, 1,
0.4508868, 1.685858, -0.6969042, 0, 0, 0, 1, 1,
0.4553764, -0.09151649, 1.906174, 1, 1, 1, 1, 1,
0.4561456, -0.1065815, 2.670649, 1, 1, 1, 1, 1,
0.4576947, 0.490776, -1.362206, 1, 1, 1, 1, 1,
0.4595425, 0.1929657, 2.1739, 1, 1, 1, 1, 1,
0.4642219, 0.8662584, 0.4707168, 1, 1, 1, 1, 1,
0.4646944, 0.6408912, 0.3154754, 1, 1, 1, 1, 1,
0.4664673, 0.8621535, -1.816718, 1, 1, 1, 1, 1,
0.467174, 2.541303, 0.8024152, 1, 1, 1, 1, 1,
0.4684504, 0.1710907, 0.3289633, 1, 1, 1, 1, 1,
0.4698526, -0.1783265, 1.686443, 1, 1, 1, 1, 1,
0.4714526, -2.136925, 2.540161, 1, 1, 1, 1, 1,
0.4737557, 1.201582, 0.6506566, 1, 1, 1, 1, 1,
0.4758693, 1.152192, 1.197395, 1, 1, 1, 1, 1,
0.4781175, -0.5856616, 3.005093, 1, 1, 1, 1, 1,
0.4820878, -1.322543, 3.6649, 1, 1, 1, 1, 1,
0.4836491, -0.9358853, 3.144012, 0, 0, 1, 1, 1,
0.4843079, 0.8898561, 1.97013, 1, 0, 0, 1, 1,
0.4843589, -1.21018, 1.373748, 1, 0, 0, 1, 1,
0.4908834, -0.02760099, 1.006242, 1, 0, 0, 1, 1,
0.4915451, -1.323685, 2.656514, 1, 0, 0, 1, 1,
0.4940415, -1.374358, 0.006300206, 1, 0, 0, 1, 1,
0.4957593, 2.420004, -1.351647, 0, 0, 0, 1, 1,
0.4992329, -1.133243, 2.910691, 0, 0, 0, 1, 1,
0.5005004, -0.8967863, 2.673453, 0, 0, 0, 1, 1,
0.5067353, 0.02027855, 2.371234, 0, 0, 0, 1, 1,
0.5067709, 0.4093376, 1.431988, 0, 0, 0, 1, 1,
0.5100844, 0.1419251, 1.978212, 0, 0, 0, 1, 1,
0.5147422, 0.06749804, 1.553097, 0, 0, 0, 1, 1,
0.5194321, 0.463976, -0.08768316, 1, 1, 1, 1, 1,
0.5262037, -0.3081924, 2.290946, 1, 1, 1, 1, 1,
0.5299083, 1.507907, 1.332481, 1, 1, 1, 1, 1,
0.5326182, -0.3423723, 3.36614, 1, 1, 1, 1, 1,
0.5332257, 0.3561814, 0.6527435, 1, 1, 1, 1, 1,
0.5373052, -0.6995856, 3.008324, 1, 1, 1, 1, 1,
0.5409202, -0.8812525, 3.225102, 1, 1, 1, 1, 1,
0.5426532, -1.070064, 2.383588, 1, 1, 1, 1, 1,
0.5461494, 0.6731885, 1.146515, 1, 1, 1, 1, 1,
0.5503817, -1.785173, 3.244294, 1, 1, 1, 1, 1,
0.5543174, 1.250406, 0.4903791, 1, 1, 1, 1, 1,
0.5567308, -0.7805808, 1.599851, 1, 1, 1, 1, 1,
0.5572496, -2.13981, 2.974614, 1, 1, 1, 1, 1,
0.5588115, -0.224416, 0.759132, 1, 1, 1, 1, 1,
0.5592234, -1.321553, 1.743427, 1, 1, 1, 1, 1,
0.5614202, -1.346798, 3.074373, 0, 0, 1, 1, 1,
0.5620272, -2.37905, 3.320753, 1, 0, 0, 1, 1,
0.564856, -0.4662143, 2.870195, 1, 0, 0, 1, 1,
0.5653245, -0.6327247, 2.780105, 1, 0, 0, 1, 1,
0.5655105, -0.40724, 0.3188111, 1, 0, 0, 1, 1,
0.5712274, -0.682187, 2.687998, 1, 0, 0, 1, 1,
0.579936, -0.7161385, 1.390347, 0, 0, 0, 1, 1,
0.5910736, -0.9791896, 3.087092, 0, 0, 0, 1, 1,
0.5927824, -0.06653392, 1.897323, 0, 0, 0, 1, 1,
0.5996746, -0.2453442, 2.431437, 0, 0, 0, 1, 1,
0.602488, 0.670845, 1.060098, 0, 0, 0, 1, 1,
0.6080143, -0.1866403, 2.600829, 0, 0, 0, 1, 1,
0.611644, -0.03632379, 1.753743, 0, 0, 0, 1, 1,
0.6124719, -0.6585623, 2.943664, 1, 1, 1, 1, 1,
0.6200808, 0.5109352, 0.3983436, 1, 1, 1, 1, 1,
0.6243328, 0.3718435, 0.3995249, 1, 1, 1, 1, 1,
0.627099, 0.852592, -0.001995109, 1, 1, 1, 1, 1,
0.6277384, -1.01521, 0.6619927, 1, 1, 1, 1, 1,
0.6351369, -0.1810632, 2.777853, 1, 1, 1, 1, 1,
0.6392865, -1.882416, 3.010077, 1, 1, 1, 1, 1,
0.6424289, -1.519365, 3.548094, 1, 1, 1, 1, 1,
0.6426071, -0.9728096, 4.614924, 1, 1, 1, 1, 1,
0.6561522, -0.4824311, 3.720603, 1, 1, 1, 1, 1,
0.6580954, 0.05564965, 0.6735096, 1, 1, 1, 1, 1,
0.6640214, -1.639155, 2.613167, 1, 1, 1, 1, 1,
0.6644269, 1.730953, 1.324552, 1, 1, 1, 1, 1,
0.6646262, 1.324595, 1.285684, 1, 1, 1, 1, 1,
0.6652614, 0.05139972, 2.401719, 1, 1, 1, 1, 1,
0.6654775, 1.529637, -1.836095, 0, 0, 1, 1, 1,
0.6669397, -1.737009, 0.9821508, 1, 0, 0, 1, 1,
0.6765454, 1.430347, -0.9710659, 1, 0, 0, 1, 1,
0.6773715, 0.1534981, 0.1468008, 1, 0, 0, 1, 1,
0.6840414, -0.4169924, 2.870504, 1, 0, 0, 1, 1,
0.6852067, -1.094068, 1.888364, 1, 0, 0, 1, 1,
0.6854553, 0.5645303, 1.966167, 0, 0, 0, 1, 1,
0.6981759, 1.163585, -0.4702874, 0, 0, 0, 1, 1,
0.7007298, -0.3599877, 0.1661667, 0, 0, 0, 1, 1,
0.7037611, 0.1457332, 0.3438767, 0, 0, 0, 1, 1,
0.7044767, 0.3035194, 1.266832, 0, 0, 0, 1, 1,
0.706085, 1.217396, 0.3154622, 0, 0, 0, 1, 1,
0.710542, 0.4045113, 0.6535124, 0, 0, 0, 1, 1,
0.7120529, 0.4716788, 1.606832, 1, 1, 1, 1, 1,
0.7163986, -2.697816, 1.862589, 1, 1, 1, 1, 1,
0.7175564, -0.5746438, 1.739122, 1, 1, 1, 1, 1,
0.7194223, -0.5153822, 2.346933, 1, 1, 1, 1, 1,
0.7220542, -0.4175548, 0.7722131, 1, 1, 1, 1, 1,
0.7243373, -1.165337, 1.865351, 1, 1, 1, 1, 1,
0.7383926, -0.3842494, 0.0975502, 1, 1, 1, 1, 1,
0.7493551, 0.6751977, 1.685428, 1, 1, 1, 1, 1,
0.7501323, 1.050254, 0.6063394, 1, 1, 1, 1, 1,
0.7577131, -0.9128683, 3.556407, 1, 1, 1, 1, 1,
0.7598047, -0.3806768, 1.81129, 1, 1, 1, 1, 1,
0.7605765, 1.407464, -1.131582, 1, 1, 1, 1, 1,
0.762422, -0.01324728, 0.925701, 1, 1, 1, 1, 1,
0.7644309, -0.6098755, 2.058846, 1, 1, 1, 1, 1,
0.7796629, 0.8839674, 1.216932, 1, 1, 1, 1, 1,
0.7797418, -0.5787917, 1.532708, 0, 0, 1, 1, 1,
0.7811994, -0.4029636, 2.536096, 1, 0, 0, 1, 1,
0.7897509, 0.8408383, 1.309451, 1, 0, 0, 1, 1,
0.7924631, -0.7755008, 2.676775, 1, 0, 0, 1, 1,
0.7951472, 0.2105717, 4.63426, 1, 0, 0, 1, 1,
0.7955163, -0.8487826, 2.715317, 1, 0, 0, 1, 1,
0.796397, 0.2824447, 2.728719, 0, 0, 0, 1, 1,
0.8078412, 1.385916, 0.7422536, 0, 0, 0, 1, 1,
0.8085408, -0.9761011, 1.263466, 0, 0, 0, 1, 1,
0.8098236, 0.3429341, 1.65996, 0, 0, 0, 1, 1,
0.8118079, -1.149858, 0.6732033, 0, 0, 0, 1, 1,
0.8131098, -0.09939422, 1.51602, 0, 0, 0, 1, 1,
0.8134174, 1.03385, -0.640391, 0, 0, 0, 1, 1,
0.8149515, 0.4335381, 1.139093, 1, 1, 1, 1, 1,
0.8216408, -2.727299, 2.67038, 1, 1, 1, 1, 1,
0.8329908, 0.09727267, 2.344029, 1, 1, 1, 1, 1,
0.8384359, -1.182502, 3.119202, 1, 1, 1, 1, 1,
0.839838, 1.805988, 0.5736482, 1, 1, 1, 1, 1,
0.8402491, 1.033276, 0.9646054, 1, 1, 1, 1, 1,
0.8429424, -0.2680256, 4.007004, 1, 1, 1, 1, 1,
0.8443529, -0.08052599, 2.426446, 1, 1, 1, 1, 1,
0.8488734, 1.903848, 2.078195, 1, 1, 1, 1, 1,
0.8513923, 0.3289123, 1.7739, 1, 1, 1, 1, 1,
0.8555155, 0.0267678, 0.741052, 1, 1, 1, 1, 1,
0.858379, 1.712802, -1.419511, 1, 1, 1, 1, 1,
0.8595876, -0.5943525, 1.969627, 1, 1, 1, 1, 1,
0.8635854, -0.3342655, 1.480671, 1, 1, 1, 1, 1,
0.8641384, -2.292171, 3.036524, 1, 1, 1, 1, 1,
0.8650553, 1.758077, -0.1850548, 0, 0, 1, 1, 1,
0.8683019, 0.3872641, 1.468975, 1, 0, 0, 1, 1,
0.8685696, 0.2383778, 1.297552, 1, 0, 0, 1, 1,
0.8694334, -0.2988393, 1.929634, 1, 0, 0, 1, 1,
0.8730626, -0.04230358, 3.226331, 1, 0, 0, 1, 1,
0.8733754, -0.2057479, 3.429692, 1, 0, 0, 1, 1,
0.873944, -2.001116, 3.246058, 0, 0, 0, 1, 1,
0.8743881, -0.507202, 3.438203, 0, 0, 0, 1, 1,
0.875998, -2.594708, 2.921842, 0, 0, 0, 1, 1,
0.8838473, -0.0193506, 1.290657, 0, 0, 0, 1, 1,
0.8869503, 1.36301, 0.251222, 0, 0, 0, 1, 1,
0.8870105, 0.4351594, 1.242383, 0, 0, 0, 1, 1,
0.8886508, -1.54346, 1.449964, 0, 0, 0, 1, 1,
0.8904344, -0.05697164, 2.015474, 1, 1, 1, 1, 1,
0.8980969, 0.6990814, 1.56984, 1, 1, 1, 1, 1,
0.8985934, -0.1481127, 1.327247, 1, 1, 1, 1, 1,
0.9117416, -1.052741, 2.7126, 1, 1, 1, 1, 1,
0.9135175, 0.06791979, 1.172588, 1, 1, 1, 1, 1,
0.9150985, 0.1318676, 0.9424819, 1, 1, 1, 1, 1,
0.9214957, 0.5373015, -1.510041, 1, 1, 1, 1, 1,
0.9236251, 0.3875194, 0.5245994, 1, 1, 1, 1, 1,
0.9280144, -0.08086815, 0.8447635, 1, 1, 1, 1, 1,
0.9320566, -0.7367811, 2.035806, 1, 1, 1, 1, 1,
0.9330723, 0.0148904, 3.19248, 1, 1, 1, 1, 1,
0.9366725, 0.2690737, -0.08232848, 1, 1, 1, 1, 1,
0.9382569, 0.2279885, -0.2246831, 1, 1, 1, 1, 1,
0.9382852, -1.454252, 4.228649, 1, 1, 1, 1, 1,
0.9385433, 0.2799154, 1.803, 1, 1, 1, 1, 1,
0.9412347, 0.211026, 2.25295, 0, 0, 1, 1, 1,
0.943971, 0.1376544, -0.2299055, 1, 0, 0, 1, 1,
0.9515674, 0.4369307, 0.1402695, 1, 0, 0, 1, 1,
0.9516727, -0.2631593, 2.195791, 1, 0, 0, 1, 1,
0.9563512, -0.01037845, 0.3585366, 1, 0, 0, 1, 1,
0.9614308, 0.4407523, 2.141551, 1, 0, 0, 1, 1,
0.9631009, 1.073692, -1.00063, 0, 0, 0, 1, 1,
0.9662775, 0.1602041, 3.071061, 0, 0, 0, 1, 1,
0.9704083, 0.9627469, -0.5355607, 0, 0, 0, 1, 1,
0.9763125, -0.3952404, 0.6127365, 0, 0, 0, 1, 1,
0.9766206, -1.184998, 1.063776, 0, 0, 0, 1, 1,
0.9783351, 1.246213, -1.113331, 0, 0, 0, 1, 1,
0.9927035, 1.199933, 0.02278153, 0, 0, 0, 1, 1,
0.9948108, 0.3276491, 1.128858, 1, 1, 1, 1, 1,
1.003401, -2.310888, 1.462895, 1, 1, 1, 1, 1,
1.006033, -1.045967, 1.848119, 1, 1, 1, 1, 1,
1.014699, -1.312012, 2.293751, 1, 1, 1, 1, 1,
1.018326, 1.048205, 1.12308, 1, 1, 1, 1, 1,
1.018422, 2.556412, 1.431675, 1, 1, 1, 1, 1,
1.022126, -0.09772842, 1.655393, 1, 1, 1, 1, 1,
1.028169, 1.906245, 1.294404, 1, 1, 1, 1, 1,
1.030823, -0.8348071, 2.124617, 1, 1, 1, 1, 1,
1.035852, -0.6826543, 0.4787791, 1, 1, 1, 1, 1,
1.040623, 1.252471, 1.921059, 1, 1, 1, 1, 1,
1.051959, -0.8948908, 4.07895, 1, 1, 1, 1, 1,
1.054297, 1.107426, 0.6504032, 1, 1, 1, 1, 1,
1.054766, 0.4940551, 1.47966, 1, 1, 1, 1, 1,
1.05661, -0.8262154, 1.66108, 1, 1, 1, 1, 1,
1.068278, 0.3019069, 3.179424, 0, 0, 1, 1, 1,
1.068965, 0.6093738, 0.6838896, 1, 0, 0, 1, 1,
1.069935, -0.5218746, 2.019256, 1, 0, 0, 1, 1,
1.078909, 0.8395011, -0.9124994, 1, 0, 0, 1, 1,
1.082094, -0.5666283, 3.458425, 1, 0, 0, 1, 1,
1.101345, -0.8250766, 3.221623, 1, 0, 0, 1, 1,
1.102985, 0.2689573, 1.816342, 0, 0, 0, 1, 1,
1.105374, -1.090861, 2.836472, 0, 0, 0, 1, 1,
1.118183, 2.456442, 0.252565, 0, 0, 0, 1, 1,
1.122206, 1.383413, 0.841388, 0, 0, 0, 1, 1,
1.135237, 0.1247476, 2.187371, 0, 0, 0, 1, 1,
1.137281, -1.519271, 2.348203, 0, 0, 0, 1, 1,
1.14098, -0.5046448, 2.761467, 0, 0, 0, 1, 1,
1.156732, -0.2552562, 2.842595, 1, 1, 1, 1, 1,
1.157774, -0.9476585, 1.844137, 1, 1, 1, 1, 1,
1.160589, 0.3060458, 0.827534, 1, 1, 1, 1, 1,
1.168009, -0.09878002, 0.8332055, 1, 1, 1, 1, 1,
1.174633, -0.07209183, 0.1419473, 1, 1, 1, 1, 1,
1.186717, 1.018146, -1.447876, 1, 1, 1, 1, 1,
1.189271, -0.2387181, 1.463743, 1, 1, 1, 1, 1,
1.201421, 0.2248029, 1.537874, 1, 1, 1, 1, 1,
1.205596, 0.02894046, 1.025921, 1, 1, 1, 1, 1,
1.219708, 0.4309945, 1.339304, 1, 1, 1, 1, 1,
1.221795, 2.11098, 1.112396, 1, 1, 1, 1, 1,
1.231545, -1.143575, 2.316662, 1, 1, 1, 1, 1,
1.234714, 0.2320873, 0.09668525, 1, 1, 1, 1, 1,
1.244185, -0.08549727, 1.089068, 1, 1, 1, 1, 1,
1.24507, -0.5836465, 3.745352, 1, 1, 1, 1, 1,
1.251653, -1.200866, 0.3522809, 0, 0, 1, 1, 1,
1.251902, -0.8730626, 1.588829, 1, 0, 0, 1, 1,
1.254366, -0.6036955, 0.1969999, 1, 0, 0, 1, 1,
1.26464, -1.312465, 1.47657, 1, 0, 0, 1, 1,
1.277041, -0.8891179, 2.234153, 1, 0, 0, 1, 1,
1.278043, -1.866469, 3.748083, 1, 0, 0, 1, 1,
1.281943, 0.3371808, 1.612539, 0, 0, 0, 1, 1,
1.283906, 2.119061, 0.4398431, 0, 0, 0, 1, 1,
1.300379, -1.444938, 3.675956, 0, 0, 0, 1, 1,
1.302029, -1.622523, 0.5751722, 0, 0, 0, 1, 1,
1.310976, 0.6781448, 0.1882665, 0, 0, 0, 1, 1,
1.328588, 0.1869527, 1.48806, 0, 0, 0, 1, 1,
1.341161, 0.650508, 0.3756372, 0, 0, 0, 1, 1,
1.348408, -0.4275313, 1.747822, 1, 1, 1, 1, 1,
1.373785, 2.487047, -1.73848, 1, 1, 1, 1, 1,
1.376442, -0.7021403, 4.131451, 1, 1, 1, 1, 1,
1.380134, 1.604915, -0.304063, 1, 1, 1, 1, 1,
1.38252, -1.849638, 2.914681, 1, 1, 1, 1, 1,
1.387388, 1.979549, -0.6985427, 1, 1, 1, 1, 1,
1.397381, -1.086745, 2.932165, 1, 1, 1, 1, 1,
1.410473, -0.257947, 0.7448543, 1, 1, 1, 1, 1,
1.417041, -0.7506379, 1.009307, 1, 1, 1, 1, 1,
1.436826, 0.7873968, 1.50526, 1, 1, 1, 1, 1,
1.437823, -0.8254914, 1.035132, 1, 1, 1, 1, 1,
1.438908, 1.191404, 0.6182722, 1, 1, 1, 1, 1,
1.45586, -0.502749, 2.067179, 1, 1, 1, 1, 1,
1.468893, 0.5285665, 0.7903724, 1, 1, 1, 1, 1,
1.476655, -0.2980765, 2.199799, 1, 1, 1, 1, 1,
1.478369, -0.06209596, 0.07271449, 0, 0, 1, 1, 1,
1.48168, -1.199553, 2.095148, 1, 0, 0, 1, 1,
1.484442, 0.550768, 1.930282, 1, 0, 0, 1, 1,
1.492053, -0.8701418, 3.631655, 1, 0, 0, 1, 1,
1.497419, -0.9344419, 2.507692, 1, 0, 0, 1, 1,
1.513624, 0.06917881, 1.494201, 1, 0, 0, 1, 1,
1.515442, 1.23176, 0.01697365, 0, 0, 0, 1, 1,
1.519237, -0.8997926, 1.542268, 0, 0, 0, 1, 1,
1.523378, 1.584829, 1.065225, 0, 0, 0, 1, 1,
1.527895, -1.95017, 2.914152, 0, 0, 0, 1, 1,
1.553308, 0.7650835, 0.7278736, 0, 0, 0, 1, 1,
1.574283, 0.04847221, 1.346974, 0, 0, 0, 1, 1,
1.575939, 1.964881, 0.9310629, 0, 0, 0, 1, 1,
1.601799, 0.5220551, 1.526857, 1, 1, 1, 1, 1,
1.612229, -0.6089597, 3.278619, 1, 1, 1, 1, 1,
1.618019, 0.445411, 1.996487, 1, 1, 1, 1, 1,
1.624292, 1.488204, -0.2181156, 1, 1, 1, 1, 1,
1.640853, -0.1972101, 2.413193, 1, 1, 1, 1, 1,
1.656517, 0.2774387, -1.408896, 1, 1, 1, 1, 1,
1.658982, 0.1923394, 1.251019, 1, 1, 1, 1, 1,
1.659659, 0.271424, 1.224634, 1, 1, 1, 1, 1,
1.662122, -0.922531, 1.15047, 1, 1, 1, 1, 1,
1.666758, -0.2727965, 0.1650909, 1, 1, 1, 1, 1,
1.668459, 0.5916252, 1.634144, 1, 1, 1, 1, 1,
1.672365, 1.104955, 0.6211632, 1, 1, 1, 1, 1,
1.678841, 1.111063, 1.012897, 1, 1, 1, 1, 1,
1.698893, -0.7848637, 2.143906, 1, 1, 1, 1, 1,
1.71139, 0.5021769, 0.5846959, 1, 1, 1, 1, 1,
1.712723, 0.6013952, -0.2340035, 0, 0, 1, 1, 1,
1.716468, -0.7099015, 2.449378, 1, 0, 0, 1, 1,
1.716879, -0.1326343, 1.745231, 1, 0, 0, 1, 1,
1.728324, 0.7462194, 2.448077, 1, 0, 0, 1, 1,
1.75357, 1.00377, 0.7620432, 1, 0, 0, 1, 1,
1.754801, 1.097571, 0.8059974, 1, 0, 0, 1, 1,
1.765282, -1.225563, 3.176976, 0, 0, 0, 1, 1,
1.765699, 0.3022581, 2.898038, 0, 0, 0, 1, 1,
1.781463, 2.443532, 2.031578, 0, 0, 0, 1, 1,
1.826949, -0.2465635, 0.0515916, 0, 0, 0, 1, 1,
1.832693, 0.7673793, 1.237581, 0, 0, 0, 1, 1,
1.839108, 0.5753382, 0.7950034, 0, 0, 0, 1, 1,
1.839533, -0.4523439, 3.612873, 0, 0, 0, 1, 1,
1.843364, 0.828787, 1.948711, 1, 1, 1, 1, 1,
1.845745, 0.03737942, 1.524469, 1, 1, 1, 1, 1,
1.855919, 0.005939548, 0.9178836, 1, 1, 1, 1, 1,
1.856922, 0.7324139, 0.6380999, 1, 1, 1, 1, 1,
1.923556, 0.9826077, 2.092975, 1, 1, 1, 1, 1,
1.93031, -1.005216, 2.709434, 1, 1, 1, 1, 1,
1.931812, 0.7346628, 1.999273, 1, 1, 1, 1, 1,
1.946491, -0.02767815, 1.655445, 1, 1, 1, 1, 1,
1.95405, -0.8832427, 1.453789, 1, 1, 1, 1, 1,
1.958151, -1.162561, 2.447194, 1, 1, 1, 1, 1,
2.010301, 0.3840427, 2.418172, 1, 1, 1, 1, 1,
2.038169, -1.575069, 3.078147, 1, 1, 1, 1, 1,
2.073144, -0.3156236, 0.1911104, 1, 1, 1, 1, 1,
2.083849, -0.2263821, 2.125037, 1, 1, 1, 1, 1,
2.095578, 0.7171001, 2.003007, 1, 1, 1, 1, 1,
2.098447, -0.7318297, 2.172807, 0, 0, 1, 1, 1,
2.106797, -0.447179, 3.063835, 1, 0, 0, 1, 1,
2.120266, 0.231221, 1.831406, 1, 0, 0, 1, 1,
2.120472, 0.5393429, 0.4381432, 1, 0, 0, 1, 1,
2.135561, -0.03088813, 2.139127, 1, 0, 0, 1, 1,
2.173334, -0.1255043, 3.289387, 1, 0, 0, 1, 1,
2.175191, -0.2877815, 2.170425, 0, 0, 0, 1, 1,
2.207469, -0.4482625, 1.302464, 0, 0, 0, 1, 1,
2.241681, -0.1524286, 3.162261, 0, 0, 0, 1, 1,
2.26196, 0.3745532, 2.498236, 0, 0, 0, 1, 1,
2.287499, -1.390051, 2.887654, 0, 0, 0, 1, 1,
2.303975, -1.845417, 2.457514, 0, 0, 0, 1, 1,
2.396756, 0.503704, 1.55182, 0, 0, 0, 1, 1,
2.482337, -1.24023, 2.077574, 1, 1, 1, 1, 1,
2.558194, -1.32426, 1.248677, 1, 1, 1, 1, 1,
2.569953, 1.191673, 1.526207, 1, 1, 1, 1, 1,
2.723608, -1.486842, 3.314693, 1, 1, 1, 1, 1,
2.899523, 1.614832, 0.8388066, 1, 1, 1, 1, 1,
3.107434, 1.183044, 1.157404, 1, 1, 1, 1, 1,
3.198245, 0.509266, 0.06232804, 1, 1, 1, 1, 1
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
var radius = 9.649196;
var distance = 33.89239;
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
mvMatrix.translate( 0.2164774, 0.07696009, 0.1898561 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.89239);
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
