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
-3.322485, 1.425285, -0.5597011, 1, 0, 0, 1,
-3.176043, 0.9073119, -1.501461, 1, 0.007843138, 0, 1,
-2.866607, 1.599892, -0.2887383, 1, 0.01176471, 0, 1,
-2.845063, 1.213961, -1.305264, 1, 0.01960784, 0, 1,
-2.669747, 0.1147965, -1.710995, 1, 0.02352941, 0, 1,
-2.644464, 0.5897331, -2.326706, 1, 0.03137255, 0, 1,
-2.598274, 0.7239771, -1.642437, 1, 0.03529412, 0, 1,
-2.566175, 0.9853299, -2.440947, 1, 0.04313726, 0, 1,
-2.469982, -0.89803, -2.729672, 1, 0.04705882, 0, 1,
-2.468977, -1.09591, -2.733103, 1, 0.05490196, 0, 1,
-2.419434, -0.1906446, -1.376614, 1, 0.05882353, 0, 1,
-2.417049, -0.5333042, -2.209082, 1, 0.06666667, 0, 1,
-2.410367, 0.6795979, -0.300918, 1, 0.07058824, 0, 1,
-2.385864, 0.2391081, -2.94034, 1, 0.07843138, 0, 1,
-2.365478, 0.7054929, -0.8592489, 1, 0.08235294, 0, 1,
-2.326241, 1.306603, -0.5282074, 1, 0.09019608, 0, 1,
-2.319165, -0.9237348, -2.622882, 1, 0.09411765, 0, 1,
-2.281562, 0.3470477, -1.450539, 1, 0.1019608, 0, 1,
-2.275327, -1.03309, -3.007579, 1, 0.1098039, 0, 1,
-2.26216, 0.04181211, -2.410681, 1, 0.1137255, 0, 1,
-2.254127, -0.6148723, -3.122011, 1, 0.1215686, 0, 1,
-2.238157, -1.035806, -2.486276, 1, 0.1254902, 0, 1,
-2.194439, 0.7210912, -2.486725, 1, 0.1333333, 0, 1,
-2.192419, 0.2325034, 0.2270658, 1, 0.1372549, 0, 1,
-2.188394, -1.200469, -1.403466, 1, 0.145098, 0, 1,
-2.182308, 1.519325, -0.6736869, 1, 0.1490196, 0, 1,
-2.146391, -0.09883407, -1.547794, 1, 0.1568628, 0, 1,
-2.128649, 0.8100181, -2.549077, 1, 0.1607843, 0, 1,
-2.102489, 1.396227, 0.04333149, 1, 0.1686275, 0, 1,
-2.084401, -1.387807, -0.9421195, 1, 0.172549, 0, 1,
-2.079983, -2.366786, -2.972877, 1, 0.1803922, 0, 1,
-1.986803, -0.8301297, -3.237126, 1, 0.1843137, 0, 1,
-1.958891, -1.218058, -1.21503, 1, 0.1921569, 0, 1,
-1.940131, -0.6535482, -1.519635, 1, 0.1960784, 0, 1,
-1.91719, 0.05894512, -2.572732, 1, 0.2039216, 0, 1,
-1.891636, 1.363343, -0.3107474, 1, 0.2117647, 0, 1,
-1.862948, -0.98249, -2.324408, 1, 0.2156863, 0, 1,
-1.856007, 1.652111, -0.4680797, 1, 0.2235294, 0, 1,
-1.853139, 0.08214281, -2.446926, 1, 0.227451, 0, 1,
-1.847717, -1.277104, -2.772169, 1, 0.2352941, 0, 1,
-1.847221, 0.9570451, -1.059673, 1, 0.2392157, 0, 1,
-1.83046, -1.008, -0.9991115, 1, 0.2470588, 0, 1,
-1.830269, 0.3761889, -3.922234, 1, 0.2509804, 0, 1,
-1.824553, 0.8084115, -2.405105, 1, 0.2588235, 0, 1,
-1.81872, -0.09220774, -2.974946, 1, 0.2627451, 0, 1,
-1.816437, 1.478613, 0.1818976, 1, 0.2705882, 0, 1,
-1.808134, -0.1634044, -4.20888, 1, 0.2745098, 0, 1,
-1.804798, 0.4538971, -0.1605433, 1, 0.282353, 0, 1,
-1.792303, 0.9975725, -2.684248, 1, 0.2862745, 0, 1,
-1.779395, -1.331083, -2.671131, 1, 0.2941177, 0, 1,
-1.772615, 0.3986918, -1.172901, 1, 0.3019608, 0, 1,
-1.732958, -0.188794, -1.333707, 1, 0.3058824, 0, 1,
-1.721369, -0.5558227, -2.699474, 1, 0.3137255, 0, 1,
-1.70458, 1.698617, -1.026897, 1, 0.3176471, 0, 1,
-1.686969, 0.9107564, -1.155832, 1, 0.3254902, 0, 1,
-1.678493, -1.077719, -1.788407, 1, 0.3294118, 0, 1,
-1.676809, 0.6757467, 0.4142312, 1, 0.3372549, 0, 1,
-1.67637, 0.9313368, -0.5860069, 1, 0.3411765, 0, 1,
-1.670847, 0.1096705, -1.051341, 1, 0.3490196, 0, 1,
-1.657928, 1.147285, -1.980924, 1, 0.3529412, 0, 1,
-1.639253, -0.4047479, -1.908356, 1, 0.3607843, 0, 1,
-1.633683, -0.5167601, -1.968319, 1, 0.3647059, 0, 1,
-1.630356, 0.8708122, -0.3985862, 1, 0.372549, 0, 1,
-1.6293, -0.1263612, 0.6046694, 1, 0.3764706, 0, 1,
-1.614712, 0.6491687, -2.548231, 1, 0.3843137, 0, 1,
-1.591348, -0.2383712, -2.40722, 1, 0.3882353, 0, 1,
-1.590117, -1.414446, -1.032653, 1, 0.3960784, 0, 1,
-1.584762, 0.4324466, -2.764794, 1, 0.4039216, 0, 1,
-1.575496, 0.618761, 0.7682103, 1, 0.4078431, 0, 1,
-1.572644, -0.3460363, -1.489293, 1, 0.4156863, 0, 1,
-1.552997, -0.3322072, -2.618972, 1, 0.4196078, 0, 1,
-1.551829, -1.22441, -1.95194, 1, 0.427451, 0, 1,
-1.551328, 0.8077086, -2.630699, 1, 0.4313726, 0, 1,
-1.547991, 1.774487, -0.420057, 1, 0.4392157, 0, 1,
-1.538487, 2.842877, -0.1769383, 1, 0.4431373, 0, 1,
-1.529336, 0.7018825, -1.912764, 1, 0.4509804, 0, 1,
-1.516883, -2.168101, -2.546738, 1, 0.454902, 0, 1,
-1.508104, 0.622513, 0.4049482, 1, 0.4627451, 0, 1,
-1.507841, 1.416848, -2.245533, 1, 0.4666667, 0, 1,
-1.506352, 1.233659, -0.5125743, 1, 0.4745098, 0, 1,
-1.499342, -1.2226, -1.802803, 1, 0.4784314, 0, 1,
-1.490975, -0.8368105, -1.839179, 1, 0.4862745, 0, 1,
-1.486733, 0.9272441, 0.04710127, 1, 0.4901961, 0, 1,
-1.486721, -0.16769, -0.9881158, 1, 0.4980392, 0, 1,
-1.483656, 0.9513879, -0.3708124, 1, 0.5058824, 0, 1,
-1.481779, 1.432606, 0.5548763, 1, 0.509804, 0, 1,
-1.478831, 0.7917401, -1.727676, 1, 0.5176471, 0, 1,
-1.477995, 0.4068701, -0.6500316, 1, 0.5215687, 0, 1,
-1.468642, 1.111673, 0.3304709, 1, 0.5294118, 0, 1,
-1.463434, 0.1106473, -3.667439, 1, 0.5333334, 0, 1,
-1.444127, 1.047287, -0.1298085, 1, 0.5411765, 0, 1,
-1.443082, 1.021878, -2.24929, 1, 0.5450981, 0, 1,
-1.439529, 0.2025594, -2.069282, 1, 0.5529412, 0, 1,
-1.439352, 0.4466971, -1.166796, 1, 0.5568628, 0, 1,
-1.433863, 2.167423, -0.9328974, 1, 0.5647059, 0, 1,
-1.426546, 0.8351712, -0.147392, 1, 0.5686275, 0, 1,
-1.424357, -0.1644223, -0.5074296, 1, 0.5764706, 0, 1,
-1.423821, -0.2889782, -2.44319, 1, 0.5803922, 0, 1,
-1.416652, -0.6463428, -0.1191864, 1, 0.5882353, 0, 1,
-1.400869, -1.346381, -2.453322, 1, 0.5921569, 0, 1,
-1.394708, 0.1181824, -1.411393, 1, 0.6, 0, 1,
-1.380076, 0.5129945, -2.771247, 1, 0.6078432, 0, 1,
-1.371747, -0.5127457, -2.446174, 1, 0.6117647, 0, 1,
-1.367251, 1.078711, -1.350963, 1, 0.6196079, 0, 1,
-1.350723, 0.4168695, -2.419427, 1, 0.6235294, 0, 1,
-1.349116, -0.7382718, -1.707669, 1, 0.6313726, 0, 1,
-1.348315, -1.211308, -2.011647, 1, 0.6352941, 0, 1,
-1.345556, -0.3202226, -1.302984, 1, 0.6431373, 0, 1,
-1.343066, 0.8377268, -3.087079, 1, 0.6470588, 0, 1,
-1.337351, -0.7005789, -2.73445, 1, 0.654902, 0, 1,
-1.302137, 0.8257478, -0.4256183, 1, 0.6588235, 0, 1,
-1.296814, -0.4922151, -3.37627, 1, 0.6666667, 0, 1,
-1.293389, -2.996438, -3.686385, 1, 0.6705883, 0, 1,
-1.269765, 0.9766939, -1.212581, 1, 0.6784314, 0, 1,
-1.269569, -0.2164853, -1.159193, 1, 0.682353, 0, 1,
-1.266697, -2.904604, -3.238338, 1, 0.6901961, 0, 1,
-1.263824, -0.1963044, -2.7581, 1, 0.6941177, 0, 1,
-1.249499, -1.056693, -2.053616, 1, 0.7019608, 0, 1,
-1.235065, -0.7951579, -2.258125, 1, 0.7098039, 0, 1,
-1.2301, 1.092126, -1.056406, 1, 0.7137255, 0, 1,
-1.230005, 0.601765, -0.7294846, 1, 0.7215686, 0, 1,
-1.215019, 1.727307, -2.3731, 1, 0.7254902, 0, 1,
-1.211741, -0.6292877, -4.292035, 1, 0.7333333, 0, 1,
-1.207487, -2.041157, -3.290115, 1, 0.7372549, 0, 1,
-1.207197, -1.024399, -2.568367, 1, 0.7450981, 0, 1,
-1.206584, -1.248241, -0.901471, 1, 0.7490196, 0, 1,
-1.196953, 1.951506, -0.8661307, 1, 0.7568628, 0, 1,
-1.195557, 0.1702575, -2.910585, 1, 0.7607843, 0, 1,
-1.191463, -0.1872622, -1.369061, 1, 0.7686275, 0, 1,
-1.182866, -0.3888578, -3.162304, 1, 0.772549, 0, 1,
-1.179384, -0.8610315, -3.786363, 1, 0.7803922, 0, 1,
-1.174503, -0.9177878, -2.148806, 1, 0.7843137, 0, 1,
-1.171333, 1.614727, -0.2726595, 1, 0.7921569, 0, 1,
-1.168361, 0.8493633, -0.656603, 1, 0.7960784, 0, 1,
-1.166352, -0.3099633, -3.099953, 1, 0.8039216, 0, 1,
-1.164861, 0.3217941, -3.164211, 1, 0.8117647, 0, 1,
-1.157747, 0.7241787, -0.1135184, 1, 0.8156863, 0, 1,
-1.156783, 0.1996944, -2.963792, 1, 0.8235294, 0, 1,
-1.156463, -0.3901788, -1.871732, 1, 0.827451, 0, 1,
-1.148799, 0.7812241, -0.04375959, 1, 0.8352941, 0, 1,
-1.143645, -0.7007303, -2.197099, 1, 0.8392157, 0, 1,
-1.138959, -0.8706353, -3.92645, 1, 0.8470588, 0, 1,
-1.134968, -0.5199034, -1.702448, 1, 0.8509804, 0, 1,
-1.133312, -0.119151, -2.32917, 1, 0.8588235, 0, 1,
-1.116448, -0.6870407, -2.56371, 1, 0.8627451, 0, 1,
-1.101388, 0.8481637, 0.2735591, 1, 0.8705882, 0, 1,
-1.086143, -1.623218, -0.3295361, 1, 0.8745098, 0, 1,
-1.079946, -0.3427909, -2.168793, 1, 0.8823529, 0, 1,
-1.065444, -0.2202408, -3.482517, 1, 0.8862745, 0, 1,
-1.060054, -1.038607, 0.4561602, 1, 0.8941177, 0, 1,
-1.059354, -0.1888142, -0.9305465, 1, 0.8980392, 0, 1,
-1.054106, -0.01602977, -0.641941, 1, 0.9058824, 0, 1,
-1.048188, -0.5601542, -2.308208, 1, 0.9137255, 0, 1,
-1.043058, -0.3170891, -2.680187, 1, 0.9176471, 0, 1,
-1.041256, 0.9078119, 2.07, 1, 0.9254902, 0, 1,
-1.040765, 0.4939629, -0.007411999, 1, 0.9294118, 0, 1,
-1.038928, 1.239266, -0.485298, 1, 0.9372549, 0, 1,
-1.02743, 0.03954865, -2.801762, 1, 0.9411765, 0, 1,
-1.023728, 0.003796985, -1.190589, 1, 0.9490196, 0, 1,
-1.020154, -0.8006342, -1.880521, 1, 0.9529412, 0, 1,
-1.013135, -0.2968746, -1.884223, 1, 0.9607843, 0, 1,
-1.011669, 0.06250416, -3.132792, 1, 0.9647059, 0, 1,
-1.008473, 0.6319175, 0.06559216, 1, 0.972549, 0, 1,
-1.007849, 1.795638, 0.4166437, 1, 0.9764706, 0, 1,
-1.006995, -0.7487919, -1.407144, 1, 0.9843137, 0, 1,
-0.996058, -1.596189, -2.712557, 1, 0.9882353, 0, 1,
-0.9903846, 0.2799591, -1.774023, 1, 0.9960784, 0, 1,
-0.9885265, -0.1518194, -0.232263, 0.9960784, 1, 0, 1,
-0.9882591, 0.04688427, -1.131933, 0.9921569, 1, 0, 1,
-0.9826654, 0.8163362, -1.77818, 0.9843137, 1, 0, 1,
-0.9821328, 0.4113624, -1.376093, 0.9803922, 1, 0, 1,
-0.9751961, 0.7741312, -1.622421, 0.972549, 1, 0, 1,
-0.9747332, 1.450359, 0.8252249, 0.9686275, 1, 0, 1,
-0.9726272, -1.790343, -3.596849, 0.9607843, 1, 0, 1,
-0.9670705, -1.057059, -3.091789, 0.9568627, 1, 0, 1,
-0.9661667, 2.071801, 0.7548832, 0.9490196, 1, 0, 1,
-0.9657708, 0.8510798, -0.06341386, 0.945098, 1, 0, 1,
-0.9646819, 0.1142052, -1.437933, 0.9372549, 1, 0, 1,
-0.9635898, 1.495161, 0.1771785, 0.9333333, 1, 0, 1,
-0.9552453, 1.606432, 0.3341284, 0.9254902, 1, 0, 1,
-0.9532247, 0.6860734, -1.074961, 0.9215686, 1, 0, 1,
-0.9528977, 0.4050384, -2.981796, 0.9137255, 1, 0, 1,
-0.951496, 1.163359, -0.4222818, 0.9098039, 1, 0, 1,
-0.9510176, 0.3642081, -0.4617285, 0.9019608, 1, 0, 1,
-0.9424164, 0.07469714, -3.418574, 0.8941177, 1, 0, 1,
-0.9321367, -0.02492905, -1.140229, 0.8901961, 1, 0, 1,
-0.9287923, -0.2967162, -0.7277305, 0.8823529, 1, 0, 1,
-0.9175586, 0.9093385, -1.008712, 0.8784314, 1, 0, 1,
-0.9074352, -1.434567, -1.71272, 0.8705882, 1, 0, 1,
-0.8977132, -0.8056735, -0.4294495, 0.8666667, 1, 0, 1,
-0.8957979, 0.1609295, -0.231301, 0.8588235, 1, 0, 1,
-0.8896863, 0.3939572, -2.147391, 0.854902, 1, 0, 1,
-0.8864113, -2.078761, -1.820434, 0.8470588, 1, 0, 1,
-0.8817739, 1.231442, -2.787327, 0.8431373, 1, 0, 1,
-0.8776709, 0.3190705, -2.517857, 0.8352941, 1, 0, 1,
-0.8753068, 1.320606, 0.1834478, 0.8313726, 1, 0, 1,
-0.8746796, -1.085817, -3.393341, 0.8235294, 1, 0, 1,
-0.8739999, 2.098253, -0.4248694, 0.8196079, 1, 0, 1,
-0.869419, 0.4252524, 0.0521342, 0.8117647, 1, 0, 1,
-0.8639342, 0.04497021, -1.605206, 0.8078431, 1, 0, 1,
-0.862934, 0.6268491, -1.615127, 0.8, 1, 0, 1,
-0.8610502, -0.9296679, -0.9336691, 0.7921569, 1, 0, 1,
-0.8586007, -0.772603, -3.547467, 0.7882353, 1, 0, 1,
-0.8552605, -0.2671795, -1.557267, 0.7803922, 1, 0, 1,
-0.8544984, 0.1716937, -1.285766, 0.7764706, 1, 0, 1,
-0.8518054, -1.217427, -2.994733, 0.7686275, 1, 0, 1,
-0.8506411, 0.1431852, -1.759708, 0.7647059, 1, 0, 1,
-0.8421702, -0.4857517, -1.776299, 0.7568628, 1, 0, 1,
-0.841224, 1.480695, -2.023381, 0.7529412, 1, 0, 1,
-0.8348004, 0.8924359, 0.2144314, 0.7450981, 1, 0, 1,
-0.8296736, -0.399569, -2.532978, 0.7411765, 1, 0, 1,
-0.827062, 1.770437, -2.137945, 0.7333333, 1, 0, 1,
-0.8267553, 0.3169017, -2.220854, 0.7294118, 1, 0, 1,
-0.8193995, -1.128092, -3.719943, 0.7215686, 1, 0, 1,
-0.8163925, 0.2893228, -1.269193, 0.7176471, 1, 0, 1,
-0.8151608, 0.9005677, -0.2395663, 0.7098039, 1, 0, 1,
-0.8094369, 2.765377, 0.6352943, 0.7058824, 1, 0, 1,
-0.8085839, 0.6948335, -0.7626247, 0.6980392, 1, 0, 1,
-0.8005239, 0.8874272, -2.673981, 0.6901961, 1, 0, 1,
-0.7994379, -0.0172971, -1.596976, 0.6862745, 1, 0, 1,
-0.7976813, 0.864978, 0.3122771, 0.6784314, 1, 0, 1,
-0.7884343, -0.4228038, -1.686397, 0.6745098, 1, 0, 1,
-0.787782, 0.5214457, -2.040064, 0.6666667, 1, 0, 1,
-0.7865801, -1.018165, -3.004759, 0.6627451, 1, 0, 1,
-0.7781347, 0.7138115, -3.153089, 0.654902, 1, 0, 1,
-0.7776777, -0.7103852, -2.938597, 0.6509804, 1, 0, 1,
-0.7757111, 0.4297357, -0.4593316, 0.6431373, 1, 0, 1,
-0.7742773, 0.286503, -1.227356, 0.6392157, 1, 0, 1,
-0.7730904, -1.162268, -2.39056, 0.6313726, 1, 0, 1,
-0.7728773, 1.065521, -0.8032954, 0.627451, 1, 0, 1,
-0.7624163, -0.02167748, -1.614925, 0.6196079, 1, 0, 1,
-0.7606314, -0.2245128, 0.9503515, 0.6156863, 1, 0, 1,
-0.7577816, -1.050563, -2.729417, 0.6078432, 1, 0, 1,
-0.7559953, 0.4267887, -0.1842374, 0.6039216, 1, 0, 1,
-0.7490833, 0.01453532, -0.8282167, 0.5960785, 1, 0, 1,
-0.748886, 0.6857608, -1.000489, 0.5882353, 1, 0, 1,
-0.7456324, -0.8143137, -1.653224, 0.5843138, 1, 0, 1,
-0.7450274, 1.335509, 0.358826, 0.5764706, 1, 0, 1,
-0.7448223, -0.2114815, -2.107735, 0.572549, 1, 0, 1,
-0.7440599, -0.6613505, -3.119357, 0.5647059, 1, 0, 1,
-0.7391143, 1.208556, -0.7423434, 0.5607843, 1, 0, 1,
-0.7379589, -1.074736, -2.543899, 0.5529412, 1, 0, 1,
-0.7303451, 0.8493662, 0.1709039, 0.5490196, 1, 0, 1,
-0.7285423, -0.110776, -0.3102989, 0.5411765, 1, 0, 1,
-0.7276312, -0.9148844, -2.480073, 0.5372549, 1, 0, 1,
-0.7273492, 1.592332, -1.818393, 0.5294118, 1, 0, 1,
-0.723727, 0.3722443, -0.8732066, 0.5254902, 1, 0, 1,
-0.7210841, 0.03070841, -1.87965, 0.5176471, 1, 0, 1,
-0.7209829, 0.9048942, 0.3837458, 0.5137255, 1, 0, 1,
-0.7112016, -1.090275, -2.099444, 0.5058824, 1, 0, 1,
-0.7109896, -0.9877589, -2.942559, 0.5019608, 1, 0, 1,
-0.7092366, -0.7579353, -2.362226, 0.4941176, 1, 0, 1,
-0.7060517, 0.6391808, -0.2968524, 0.4862745, 1, 0, 1,
-0.7015513, 0.8080716, 0.3589786, 0.4823529, 1, 0, 1,
-0.6974277, -0.8764217, -2.358896, 0.4745098, 1, 0, 1,
-0.6964765, -2.046955, -3.477895, 0.4705882, 1, 0, 1,
-0.6929993, -0.4277419, -1.846262, 0.4627451, 1, 0, 1,
-0.6917965, 0.3684364, -1.816414, 0.4588235, 1, 0, 1,
-0.6854888, 0.2265077, -1.199947, 0.4509804, 1, 0, 1,
-0.6836465, -0.4650191, -1.668545, 0.4470588, 1, 0, 1,
-0.6818125, 0.5878962, 0.8243995, 0.4392157, 1, 0, 1,
-0.681664, 0.614678, -1.009435, 0.4352941, 1, 0, 1,
-0.6810853, -3.197624, -1.539325, 0.427451, 1, 0, 1,
-0.6781296, -0.120416, -0.2827191, 0.4235294, 1, 0, 1,
-0.6765643, -0.9443588, -1.372606, 0.4156863, 1, 0, 1,
-0.6759706, 0.4673504, 0.3556092, 0.4117647, 1, 0, 1,
-0.670908, -0.169456, -2.819195, 0.4039216, 1, 0, 1,
-0.6640241, -0.001074086, 0.5375862, 0.3960784, 1, 0, 1,
-0.6568066, -0.1035653, -0.3975088, 0.3921569, 1, 0, 1,
-0.6546071, 0.9624884, -2.129782, 0.3843137, 1, 0, 1,
-0.6529577, -1.293224, -3.052016, 0.3803922, 1, 0, 1,
-0.6498495, -0.4529085, -3.60924, 0.372549, 1, 0, 1,
-0.6497737, -0.9142601, -3.105836, 0.3686275, 1, 0, 1,
-0.6479745, 1.657275, -1.141622, 0.3607843, 1, 0, 1,
-0.6444166, 0.3975579, -1.784562, 0.3568628, 1, 0, 1,
-0.6439783, 0.7082603, -1.033879, 0.3490196, 1, 0, 1,
-0.6409882, -0.4713063, -1.50012, 0.345098, 1, 0, 1,
-0.6404747, 0.7201141, -1.724806, 0.3372549, 1, 0, 1,
-0.63599, -0.08462732, -0.2372188, 0.3333333, 1, 0, 1,
-0.6357529, -0.8664518, -3.689915, 0.3254902, 1, 0, 1,
-0.6314689, 0.630453, 1.205619, 0.3215686, 1, 0, 1,
-0.629248, -1.661714, -3.800154, 0.3137255, 1, 0, 1,
-0.6291303, 1.498736, -0.1359008, 0.3098039, 1, 0, 1,
-0.6228061, -0.4576128, -4.352341, 0.3019608, 1, 0, 1,
-0.622161, 1.618095, 0.1919888, 0.2941177, 1, 0, 1,
-0.6193357, 1.208481, -0.9583006, 0.2901961, 1, 0, 1,
-0.6183459, 0.3859591, -1.068806, 0.282353, 1, 0, 1,
-0.6111004, -0.6132193, -4.796282, 0.2784314, 1, 0, 1,
-0.6072661, -0.6448439, -0.8218477, 0.2705882, 1, 0, 1,
-0.6061361, 0.2558534, -1.783476, 0.2666667, 1, 0, 1,
-0.6009321, 0.8408294, 0.9492477, 0.2588235, 1, 0, 1,
-0.5998219, -0.6989409, -2.509834, 0.254902, 1, 0, 1,
-0.5915531, -1.275, -3.478938, 0.2470588, 1, 0, 1,
-0.5880899, -1.698302, -2.972096, 0.2431373, 1, 0, 1,
-0.5856888, -0.5270081, -1.922048, 0.2352941, 1, 0, 1,
-0.5840487, 1.020416, -0.9212978, 0.2313726, 1, 0, 1,
-0.5839679, -1.018837, -1.757987, 0.2235294, 1, 0, 1,
-0.5796979, 1.429836, 0.221244, 0.2196078, 1, 0, 1,
-0.5745051, -0.2043964, -2.416363, 0.2117647, 1, 0, 1,
-0.5741911, -0.3779273, -1.827915, 0.2078431, 1, 0, 1,
-0.562902, 0.6700814, -1.313314, 0.2, 1, 0, 1,
-0.5596583, 0.6522804, -1.917405, 0.1921569, 1, 0, 1,
-0.5591121, 0.4606264, -2.134058, 0.1882353, 1, 0, 1,
-0.5587172, 0.0243073, -0.755372, 0.1803922, 1, 0, 1,
-0.5561736, 0.2481603, -1.495454, 0.1764706, 1, 0, 1,
-0.5539874, -0.9085652, -1.953222, 0.1686275, 1, 0, 1,
-0.5539727, 0.4907482, -1.717449, 0.1647059, 1, 0, 1,
-0.5536425, 0.3647206, -1.058661, 0.1568628, 1, 0, 1,
-0.5524971, 0.5548669, -0.6345425, 0.1529412, 1, 0, 1,
-0.5517297, -1.477118, -4.766706, 0.145098, 1, 0, 1,
-0.5482333, 0.5943167, -0.4308937, 0.1411765, 1, 0, 1,
-0.5318407, 0.5295874, -0.3287432, 0.1333333, 1, 0, 1,
-0.5306351, -2.321218, -2.738708, 0.1294118, 1, 0, 1,
-0.5249069, 0.1629611, -1.204516, 0.1215686, 1, 0, 1,
-0.5237456, -0.8225471, -2.382057, 0.1176471, 1, 0, 1,
-0.5237122, -0.9770751, -3.072521, 0.1098039, 1, 0, 1,
-0.5227202, -0.2640097, -3.928683, 0.1058824, 1, 0, 1,
-0.5222204, -0.4060791, -2.759783, 0.09803922, 1, 0, 1,
-0.5181936, 0.1983846, 1.171552, 0.09019608, 1, 0, 1,
-0.5153275, -0.7462255, -1.785233, 0.08627451, 1, 0, 1,
-0.5112424, -1.855464, -2.062618, 0.07843138, 1, 0, 1,
-0.5089003, 0.2539714, -0.9937712, 0.07450981, 1, 0, 1,
-0.5083957, 0.4006196, -2.441655, 0.06666667, 1, 0, 1,
-0.5060753, 3.187567, 0.9826565, 0.0627451, 1, 0, 1,
-0.4954301, 0.105216, -1.715409, 0.05490196, 1, 0, 1,
-0.4950281, -1.137859, -0.946009, 0.05098039, 1, 0, 1,
-0.4899202, 0.5028558, -0.3617067, 0.04313726, 1, 0, 1,
-0.4895406, 1.544591, -0.636566, 0.03921569, 1, 0, 1,
-0.4882984, 0.6031514, -0.5332409, 0.03137255, 1, 0, 1,
-0.4779909, 0.6270367, -0.08362362, 0.02745098, 1, 0, 1,
-0.4776415, -0.7260039, -2.020429, 0.01960784, 1, 0, 1,
-0.4774876, -0.4968392, -3.947647, 0.01568628, 1, 0, 1,
-0.4766531, -0.05137821, -2.189673, 0.007843138, 1, 0, 1,
-0.4759133, -1.686569, -2.640098, 0.003921569, 1, 0, 1,
-0.4756209, -0.4847946, -3.314378, 0, 1, 0.003921569, 1,
-0.4719916, -1.400899, -3.008245, 0, 1, 0.01176471, 1,
-0.4637743, 0.9419824, -0.09190316, 0, 1, 0.01568628, 1,
-0.4622951, -0.1888785, -1.709366, 0, 1, 0.02352941, 1,
-0.4614424, -0.6594615, -1.561376, 0, 1, 0.02745098, 1,
-0.4613766, -0.3402206, -2.384851, 0, 1, 0.03529412, 1,
-0.4607966, 0.01348349, -1.69706, 0, 1, 0.03921569, 1,
-0.4572177, -1.22407, -1.687533, 0, 1, 0.04705882, 1,
-0.4545115, 0.454191, -2.643203, 0, 1, 0.05098039, 1,
-0.4540986, -0.8785773, -1.927534, 0, 1, 0.05882353, 1,
-0.4477166, 1.296987, 0.8907175, 0, 1, 0.0627451, 1,
-0.4471906, -1.089149, -3.088021, 0, 1, 0.07058824, 1,
-0.4457784, -1.265906, -2.804005, 0, 1, 0.07450981, 1,
-0.4401653, -0.08856697, -2.579967, 0, 1, 0.08235294, 1,
-0.4392863, 1.731515, -1.739639, 0, 1, 0.08627451, 1,
-0.4390796, 0.533214, -1.48983, 0, 1, 0.09411765, 1,
-0.4377764, -1.011287, -3.955388, 0, 1, 0.1019608, 1,
-0.4363516, -1.259588, -4.101756, 0, 1, 0.1058824, 1,
-0.4315591, -0.7775226, -0.8252912, 0, 1, 0.1137255, 1,
-0.4262141, 0.02367144, -0.3574368, 0, 1, 0.1176471, 1,
-0.4256791, -1.823512, -1.697766, 0, 1, 0.1254902, 1,
-0.4244085, -0.5000694, -2.105277, 0, 1, 0.1294118, 1,
-0.4230592, 0.1455045, -0.7920131, 0, 1, 0.1372549, 1,
-0.4209701, 0.3843752, -0.7641923, 0, 1, 0.1411765, 1,
-0.4130754, -0.4116851, -3.480609, 0, 1, 0.1490196, 1,
-0.4130283, 0.3074157, -0.1961059, 0, 1, 0.1529412, 1,
-0.412283, -0.4952384, -2.15161, 0, 1, 0.1607843, 1,
-0.4105436, -1.70724, -2.658962, 0, 1, 0.1647059, 1,
-0.4094966, -0.6664298, -2.836794, 0, 1, 0.172549, 1,
-0.4077736, -0.9602917, -2.182737, 0, 1, 0.1764706, 1,
-0.4034313, 0.09461363, -1.400051, 0, 1, 0.1843137, 1,
-0.4012941, 0.3684327, 0.3189341, 0, 1, 0.1882353, 1,
-0.3986997, 0.9584373, -2.303905, 0, 1, 0.1960784, 1,
-0.3966652, -0.2060936, -2.117345, 0, 1, 0.2039216, 1,
-0.3960711, 0.3804029, 0.1071442, 0, 1, 0.2078431, 1,
-0.3952844, -0.3965764, -3.729202, 0, 1, 0.2156863, 1,
-0.3943328, 0.06801499, -0.7317683, 0, 1, 0.2196078, 1,
-0.3924925, 0.9451711, -0.4716273, 0, 1, 0.227451, 1,
-0.3891897, -0.9876977, -1.113086, 0, 1, 0.2313726, 1,
-0.3887345, 0.09907696, -1.737944, 0, 1, 0.2392157, 1,
-0.3848393, 2.022715, -2.441383, 0, 1, 0.2431373, 1,
-0.3831502, 2.094406, -1.35901, 0, 1, 0.2509804, 1,
-0.3809246, 0.00579969, -0.1303609, 0, 1, 0.254902, 1,
-0.3785093, -0.4138046, -1.343969, 0, 1, 0.2627451, 1,
-0.3784254, -0.1376155, -0.2801746, 0, 1, 0.2666667, 1,
-0.3744965, 1.158693, 1.439006, 0, 1, 0.2745098, 1,
-0.3672647, -1.402768, 0.5719535, 0, 1, 0.2784314, 1,
-0.3638428, -1.226554, -2.264678, 0, 1, 0.2862745, 1,
-0.3631429, 0.6165758, 0.07680037, 0, 1, 0.2901961, 1,
-0.3628972, -0.06327458, -1.510318, 0, 1, 0.2980392, 1,
-0.3556334, -0.08286894, -0.7084328, 0, 1, 0.3058824, 1,
-0.3513229, -0.4150159, -3.231532, 0, 1, 0.3098039, 1,
-0.3505881, -0.267668, -0.6582206, 0, 1, 0.3176471, 1,
-0.3475071, -0.4502661, -3.514936, 0, 1, 0.3215686, 1,
-0.3471785, -0.9607722, -3.224889, 0, 1, 0.3294118, 1,
-0.3419133, -0.5639074, -2.688054, 0, 1, 0.3333333, 1,
-0.3411114, 1.348074, 0.3384089, 0, 1, 0.3411765, 1,
-0.3404035, 1.36061, -1.343462, 0, 1, 0.345098, 1,
-0.3366024, -0.02713551, -2.550611, 0, 1, 0.3529412, 1,
-0.332284, -1.998353, -3.198231, 0, 1, 0.3568628, 1,
-0.3319455, 1.083354, -1.110293, 0, 1, 0.3647059, 1,
-0.3287865, -1.184179, -2.074666, 0, 1, 0.3686275, 1,
-0.3285717, 0.9371604, -0.2565462, 0, 1, 0.3764706, 1,
-0.3275823, -0.2879589, -1.982546, 0, 1, 0.3803922, 1,
-0.3251021, -0.5494748, -3.086379, 0, 1, 0.3882353, 1,
-0.3198186, 0.2150363, -0.4191658, 0, 1, 0.3921569, 1,
-0.3191108, -0.4548091, -3.660803, 0, 1, 0.4, 1,
-0.3174564, 0.2109446, -2.021821, 0, 1, 0.4078431, 1,
-0.3170527, 0.6614863, -1.318738, 0, 1, 0.4117647, 1,
-0.3139474, 0.02013546, 0.1065282, 0, 1, 0.4196078, 1,
-0.3134824, 0.1688546, -1.641646, 0, 1, 0.4235294, 1,
-0.3127699, -0.2556101, -0.9071221, 0, 1, 0.4313726, 1,
-0.3097357, 0.4447236, 0.3948003, 0, 1, 0.4352941, 1,
-0.3071799, -0.04243192, -2.341303, 0, 1, 0.4431373, 1,
-0.3057863, 0.4950353, 0.3386205, 0, 1, 0.4470588, 1,
-0.3036459, -1.778146, -1.676574, 0, 1, 0.454902, 1,
-0.3017128, 1.642969, -0.1598269, 0, 1, 0.4588235, 1,
-0.30082, 1.311381, -0.06855363, 0, 1, 0.4666667, 1,
-0.2941752, -0.2867886, -1.607509, 0, 1, 0.4705882, 1,
-0.2915297, 0.04580646, -1.379673, 0, 1, 0.4784314, 1,
-0.2892149, 0.8701027, -0.5522527, 0, 1, 0.4823529, 1,
-0.283064, 0.1601952, -1.658976, 0, 1, 0.4901961, 1,
-0.2823005, 0.581987, -0.2804767, 0, 1, 0.4941176, 1,
-0.2780136, -1.306649, -3.174115, 0, 1, 0.5019608, 1,
-0.2763173, -0.3412401, -0.8818781, 0, 1, 0.509804, 1,
-0.2714103, 0.6843505, 1.006582, 0, 1, 0.5137255, 1,
-0.270669, -0.8332574, -2.158066, 0, 1, 0.5215687, 1,
-0.2704298, 1.562874, 1.771798, 0, 1, 0.5254902, 1,
-0.2667207, 0.6504362, 0.9892667, 0, 1, 0.5333334, 1,
-0.2660834, 1.813426, -1.202925, 0, 1, 0.5372549, 1,
-0.2654336, 1.423063, 0.8564756, 0, 1, 0.5450981, 1,
-0.2636448, 0.3729153, -0.8117606, 0, 1, 0.5490196, 1,
-0.2635529, 0.1973706, 0.08256, 0, 1, 0.5568628, 1,
-0.2598999, 1.456738, 0.001092093, 0, 1, 0.5607843, 1,
-0.2596109, 0.6502713, 0.6206943, 0, 1, 0.5686275, 1,
-0.2591494, -1.044164, -2.163644, 0, 1, 0.572549, 1,
-0.2589346, 0.7115769, 0.7679605, 0, 1, 0.5803922, 1,
-0.2562855, 0.9665343, 0.6960441, 0, 1, 0.5843138, 1,
-0.2557881, 1.824019, -1.119812, 0, 1, 0.5921569, 1,
-0.2544084, 0.5518442, -2.278541, 0, 1, 0.5960785, 1,
-0.2468404, 0.2911042, -1.745727, 0, 1, 0.6039216, 1,
-0.2459923, -0.1204566, -0.2724477, 0, 1, 0.6117647, 1,
-0.2450184, -0.2344188, -2.062557, 0, 1, 0.6156863, 1,
-0.2412043, 0.5251117, -0.3020208, 0, 1, 0.6235294, 1,
-0.2339125, -0.8582057, -2.561592, 0, 1, 0.627451, 1,
-0.2325711, -0.737187, -4.014532, 0, 1, 0.6352941, 1,
-0.2319591, 0.201032, -1.261553, 0, 1, 0.6392157, 1,
-0.2317862, 0.5586818, 1.410276, 0, 1, 0.6470588, 1,
-0.2293397, -1.016394, -2.663694, 0, 1, 0.6509804, 1,
-0.2219034, 1.332871, 1.26809, 0, 1, 0.6588235, 1,
-0.2212363, 0.1057116, -1.352747, 0, 1, 0.6627451, 1,
-0.2166179, 1.06857, -0.3208852, 0, 1, 0.6705883, 1,
-0.2076244, 0.6415956, -1.628813, 0, 1, 0.6745098, 1,
-0.2072941, 0.5670149, -0.9991576, 0, 1, 0.682353, 1,
-0.2072539, -0.09693536, -3.223747, 0, 1, 0.6862745, 1,
-0.2053494, -0.6817632, -4.093898, 0, 1, 0.6941177, 1,
-0.2015217, -0.3738119, -2.956251, 0, 1, 0.7019608, 1,
-0.2013832, 1.795301, 3.029807, 0, 1, 0.7058824, 1,
-0.2013473, -0.3377549, -1.005099, 0, 1, 0.7137255, 1,
-0.1993321, 0.9338078, 0.988749, 0, 1, 0.7176471, 1,
-0.1990663, 1.129449, -1.224387, 0, 1, 0.7254902, 1,
-0.1987892, 0.2307466, -1.724082, 0, 1, 0.7294118, 1,
-0.1947265, -0.8458871, -4.339278, 0, 1, 0.7372549, 1,
-0.1941542, -0.8776789, -2.970952, 0, 1, 0.7411765, 1,
-0.1930448, 0.2010599, -0.7685186, 0, 1, 0.7490196, 1,
-0.1890311, 0.3599532, -0.3911147, 0, 1, 0.7529412, 1,
-0.1869211, 0.3303123, -0.1308626, 0, 1, 0.7607843, 1,
-0.185929, 0.5792266, 1.711181, 0, 1, 0.7647059, 1,
-0.1810317, -1.329376, -2.408633, 0, 1, 0.772549, 1,
-0.1775519, -1.324091, -2.34069, 0, 1, 0.7764706, 1,
-0.1743401, 0.6723018, -0.8226398, 0, 1, 0.7843137, 1,
-0.1609426, 0.5409608, -0.4995747, 0, 1, 0.7882353, 1,
-0.1603435, 0.2485047, -1.14079, 0, 1, 0.7960784, 1,
-0.1592945, 1.404602, 0.4068769, 0, 1, 0.8039216, 1,
-0.1567917, 0.8653944, -1.11369, 0, 1, 0.8078431, 1,
-0.1563954, 1.284686, 0.1400773, 0, 1, 0.8156863, 1,
-0.1549068, -0.3348733, -4.105943, 0, 1, 0.8196079, 1,
-0.1547669, 0.1769242, -0.731335, 0, 1, 0.827451, 1,
-0.1510083, 0.3429902, 0.409375, 0, 1, 0.8313726, 1,
-0.1505978, -1.259926, -3.552912, 0, 1, 0.8392157, 1,
-0.147566, 1.478321, -0.3224816, 0, 1, 0.8431373, 1,
-0.1465651, 0.2944064, 0.1398676, 0, 1, 0.8509804, 1,
-0.1437095, -1.729848, -3.303708, 0, 1, 0.854902, 1,
-0.1431262, 1.427935, 0.970718, 0, 1, 0.8627451, 1,
-0.1419442, 0.2410633, -0.5317096, 0, 1, 0.8666667, 1,
-0.1418116, -1.056334, -4.209595, 0, 1, 0.8745098, 1,
-0.1415273, 0.5924208, -0.346066, 0, 1, 0.8784314, 1,
-0.1405541, -1.14094, -3.894357, 0, 1, 0.8862745, 1,
-0.1390284, 0.2622074, -0.5586738, 0, 1, 0.8901961, 1,
-0.1375407, -0.8947716, -4.101164, 0, 1, 0.8980392, 1,
-0.1339871, -0.3162824, -1.150289, 0, 1, 0.9058824, 1,
-0.1336674, -0.8207825, -2.67701, 0, 1, 0.9098039, 1,
-0.1272573, 1.635916, 0.03461767, 0, 1, 0.9176471, 1,
-0.1267651, -0.4430955, -2.573286, 0, 1, 0.9215686, 1,
-0.1246246, 1.350118, 1.993388, 0, 1, 0.9294118, 1,
-0.1229916, 0.8847594, -0.9722294, 0, 1, 0.9333333, 1,
-0.1199066, -0.8872918, -4.106315, 0, 1, 0.9411765, 1,
-0.1179404, 0.3959317, 0.6436533, 0, 1, 0.945098, 1,
-0.1170558, -0.6554065, -3.516294, 0, 1, 0.9529412, 1,
-0.1166391, -0.2071661, -2.97002, 0, 1, 0.9568627, 1,
-0.1149815, 1.168135, -0.4928707, 0, 1, 0.9647059, 1,
-0.1149416, 0.6324588, 0.4309583, 0, 1, 0.9686275, 1,
-0.1112414, -0.3915614, -1.281698, 0, 1, 0.9764706, 1,
-0.1102466, 0.8211761, -1.739101, 0, 1, 0.9803922, 1,
-0.1087631, -1.729552, -1.944706, 0, 1, 0.9882353, 1,
-0.1084801, -0.6357682, -4.761645, 0, 1, 0.9921569, 1,
-0.1070658, 0.5934722, -2.069562, 0, 1, 1, 1,
-0.1039945, -0.212597, -3.612271, 0, 0.9921569, 1, 1,
-0.09867959, 0.3974623, 0.5861885, 0, 0.9882353, 1, 1,
-0.09425008, -0.5880209, -3.102895, 0, 0.9803922, 1, 1,
-0.09391218, -0.09181555, -2.91997, 0, 0.9764706, 1, 1,
-0.09269102, -1.039076, -2.73117, 0, 0.9686275, 1, 1,
-0.0904468, -1.71694, -3.605645, 0, 0.9647059, 1, 1,
-0.08970684, 1.424948, 0.2828909, 0, 0.9568627, 1, 1,
-0.08812799, 0.8304923, -0.8359969, 0, 0.9529412, 1, 1,
-0.08624762, 0.509913, 0.8117388, 0, 0.945098, 1, 1,
-0.08386623, 0.1183341, 0.8175461, 0, 0.9411765, 1, 1,
-0.08015223, -1.183907, -3.468763, 0, 0.9333333, 1, 1,
-0.0786978, 0.538122, -0.6258121, 0, 0.9294118, 1, 1,
-0.0667763, 0.8209996, -1.619403, 0, 0.9215686, 1, 1,
-0.06285764, -0.4448268, -2.725912, 0, 0.9176471, 1, 1,
-0.06253645, -0.7118307, -1.770885, 0, 0.9098039, 1, 1,
-0.05574187, -1.879199, -3.354569, 0, 0.9058824, 1, 1,
-0.0523088, 1.572006, 0.7865577, 0, 0.8980392, 1, 1,
-0.05112184, 0.7162736, -1.293531, 0, 0.8901961, 1, 1,
-0.04778419, -1.322862, -3.616143, 0, 0.8862745, 1, 1,
-0.04616166, -1.094868, -3.463159, 0, 0.8784314, 1, 1,
-0.03776042, -1.043542, -4.083576, 0, 0.8745098, 1, 1,
-0.03425856, -2.118018, -3.041794, 0, 0.8666667, 1, 1,
-0.03410144, 0.7230392, 0.853071, 0, 0.8627451, 1, 1,
-0.0277944, 0.779719, 0.5593009, 0, 0.854902, 1, 1,
-0.02762932, 0.2467505, 1.495022, 0, 0.8509804, 1, 1,
-0.0251508, -1.249052, -4.137598, 0, 0.8431373, 1, 1,
-0.02054997, -0.6651167, -3.923454, 0, 0.8392157, 1, 1,
-0.018663, 0.2218657, -0.5498064, 0, 0.8313726, 1, 1,
-0.01856651, -0.8370579, -3.593842, 0, 0.827451, 1, 1,
-0.0180936, -0.3163658, -2.842727, 0, 0.8196079, 1, 1,
-0.01725783, 1.081875, -0.7798501, 0, 0.8156863, 1, 1,
-0.01454727, -1.163098, -4.15764, 0, 0.8078431, 1, 1,
-0.01032504, 1.218035, 2.022406, 0, 0.8039216, 1, 1,
-0.009238123, -0.3934842, -1.908626, 0, 0.7960784, 1, 1,
-0.008868672, 2.382577, -2.076707, 0, 0.7882353, 1, 1,
-0.007947373, -0.5258393, -3.661905, 0, 0.7843137, 1, 1,
-0.0041281, -1.149253, -1.378697, 0, 0.7764706, 1, 1,
-0.003407539, -0.4131114, -3.706863, 0, 0.772549, 1, 1,
-0.002753683, -0.6088548, -2.723511, 0, 0.7647059, 1, 1,
-0.002657105, 0.9827018, -0.7880833, 0, 0.7607843, 1, 1,
0.00297542, -1.699779, 2.10572, 0, 0.7529412, 1, 1,
0.003365919, -0.5510752, 3.634066, 0, 0.7490196, 1, 1,
0.01168284, -2.398674, 2.06279, 0, 0.7411765, 1, 1,
0.01537991, -0.07616618, 3.176711, 0, 0.7372549, 1, 1,
0.0166502, 0.4987895, -0.679579, 0, 0.7294118, 1, 1,
0.01753928, 1.479333, -0.4645873, 0, 0.7254902, 1, 1,
0.01864541, -0.4934915, 2.902708, 0, 0.7176471, 1, 1,
0.02240241, -1.304942, 1.804483, 0, 0.7137255, 1, 1,
0.03054445, -0.1001524, 3.238543, 0, 0.7058824, 1, 1,
0.03173238, -0.3690828, 3.351751, 0, 0.6980392, 1, 1,
0.03488718, 0.1338626, 1.366992, 0, 0.6941177, 1, 1,
0.03864291, 0.8176719, 0.2925549, 0, 0.6862745, 1, 1,
0.04047754, -0.1530336, 4.705712, 0, 0.682353, 1, 1,
0.04145686, -0.4132663, 3.553264, 0, 0.6745098, 1, 1,
0.04849445, 0.4846616, -1.102937, 0, 0.6705883, 1, 1,
0.04874962, -0.1598968, 3.16155, 0, 0.6627451, 1, 1,
0.04948337, 1.319985, 0.7296638, 0, 0.6588235, 1, 1,
0.05135635, 1.282352, 0.2306929, 0, 0.6509804, 1, 1,
0.05174905, -1.925809, 1.5859, 0, 0.6470588, 1, 1,
0.05192241, 1.74595, -0.4944337, 0, 0.6392157, 1, 1,
0.05280797, -0.284321, 1.647267, 0, 0.6352941, 1, 1,
0.05444744, -0.03292478, 1.658901, 0, 0.627451, 1, 1,
0.05837077, 0.619103, 0.7870629, 0, 0.6235294, 1, 1,
0.06054329, 0.8971911, -0.3071709, 0, 0.6156863, 1, 1,
0.06389969, 1.800112, -0.5546905, 0, 0.6117647, 1, 1,
0.06678241, 1.723204, -0.0115059, 0, 0.6039216, 1, 1,
0.06729355, -0.6922941, 4.597005, 0, 0.5960785, 1, 1,
0.0674888, -0.7870797, 3.862141, 0, 0.5921569, 1, 1,
0.06979871, -0.1471033, 2.552005, 0, 0.5843138, 1, 1,
0.07455731, 0.9022997, 2.649742, 0, 0.5803922, 1, 1,
0.07912716, -0.2570606, 1.269829, 0, 0.572549, 1, 1,
0.0822015, 0.7872244, -1.041518, 0, 0.5686275, 1, 1,
0.08341248, -0.8978657, 4.575841, 0, 0.5607843, 1, 1,
0.08575701, 0.03354792, 1.665165, 0, 0.5568628, 1, 1,
0.08742182, 0.69084, -0.4419513, 0, 0.5490196, 1, 1,
0.08762149, 0.6926106, -0.8303353, 0, 0.5450981, 1, 1,
0.1024778, -1.049371, 2.530507, 0, 0.5372549, 1, 1,
0.1057701, 0.07653036, -0.04146379, 0, 0.5333334, 1, 1,
0.1060837, -1.384951, 3.217714, 0, 0.5254902, 1, 1,
0.1096003, 0.4217665, -0.5162641, 0, 0.5215687, 1, 1,
0.1098361, 0.05870936, 0.7439032, 0, 0.5137255, 1, 1,
0.1174278, 1.596176, -0.2760753, 0, 0.509804, 1, 1,
0.117729, 1.231841, 0.3652086, 0, 0.5019608, 1, 1,
0.1198102, 1.162762, -1.975071, 0, 0.4941176, 1, 1,
0.1216292, 2.221608, -0.6570919, 0, 0.4901961, 1, 1,
0.1220849, -1.325768, 1.713644, 0, 0.4823529, 1, 1,
0.1222113, 1.208886, -1.929951, 0, 0.4784314, 1, 1,
0.1253135, -0.2052407, 0.9372442, 0, 0.4705882, 1, 1,
0.1402155, -0.1017582, 1.679852, 0, 0.4666667, 1, 1,
0.1427867, -2.618958, 2.459585, 0, 0.4588235, 1, 1,
0.1480273, -0.113457, 0.568372, 0, 0.454902, 1, 1,
0.1537739, 0.4890511, -1.192532, 0, 0.4470588, 1, 1,
0.1553274, 0.2706577, 0.7474383, 0, 0.4431373, 1, 1,
0.1570469, -1.402022, 3.106627, 0, 0.4352941, 1, 1,
0.1570758, -0.8862539, 1.599379, 0, 0.4313726, 1, 1,
0.1615451, 0.2959362, 1.043494, 0, 0.4235294, 1, 1,
0.1657274, 0.8223326, -1.463932, 0, 0.4196078, 1, 1,
0.1670123, -1.215133, 2.82141, 0, 0.4117647, 1, 1,
0.1677714, 0.5368627, 1.070511, 0, 0.4078431, 1, 1,
0.1695633, -0.3535492, 2.791342, 0, 0.4, 1, 1,
0.1709976, -0.9704157, 2.923663, 0, 0.3921569, 1, 1,
0.1711544, 0.6429674, 0.8204359, 0, 0.3882353, 1, 1,
0.1714845, 0.8636428, 0.2208988, 0, 0.3803922, 1, 1,
0.1735883, -0.463941, 2.18274, 0, 0.3764706, 1, 1,
0.1741639, -1.41273, 3.029374, 0, 0.3686275, 1, 1,
0.1765817, 0.1060363, 0.4115579, 0, 0.3647059, 1, 1,
0.1774926, -0.3765936, 3.046085, 0, 0.3568628, 1, 1,
0.1830214, 0.3748625, -0.6621073, 0, 0.3529412, 1, 1,
0.1842417, 0.341172, 0.9474503, 0, 0.345098, 1, 1,
0.1884269, -0.6205031, 3.01932, 0, 0.3411765, 1, 1,
0.1941871, 1.555314, 1.393386, 0, 0.3333333, 1, 1,
0.2026342, 0.3949226, 1.809605, 0, 0.3294118, 1, 1,
0.2069584, -1.546108, 3.581647, 0, 0.3215686, 1, 1,
0.2074299, 0.9871687, 1.285471, 0, 0.3176471, 1, 1,
0.2090442, 0.2903219, -0.7045979, 0, 0.3098039, 1, 1,
0.2095047, -0.5827281, 2.811938, 0, 0.3058824, 1, 1,
0.2101961, -1.338203, 1.520351, 0, 0.2980392, 1, 1,
0.2153438, 0.3056641, 0.3981113, 0, 0.2901961, 1, 1,
0.2155445, -1.697983, 4.055283, 0, 0.2862745, 1, 1,
0.2166042, 0.289739, 0.424863, 0, 0.2784314, 1, 1,
0.2182038, -0.637097, 2.001895, 0, 0.2745098, 1, 1,
0.2233114, -1.867836, 3.331563, 0, 0.2666667, 1, 1,
0.224177, 0.736178, -0.4099379, 0, 0.2627451, 1, 1,
0.2311251, 0.8498513, 0.7491544, 0, 0.254902, 1, 1,
0.234009, 0.9543661, -0.4719163, 0, 0.2509804, 1, 1,
0.2349605, 0.5403309, 1.383818, 0, 0.2431373, 1, 1,
0.2370178, 0.7899787, 1.058966, 0, 0.2392157, 1, 1,
0.2395681, 0.4737563, 2.320484, 0, 0.2313726, 1, 1,
0.2417771, 0.8440204, -0.2896049, 0, 0.227451, 1, 1,
0.2418855, 1.629263, -0.1928696, 0, 0.2196078, 1, 1,
0.2459368, 0.1315461, -0.07966615, 0, 0.2156863, 1, 1,
0.2505602, 0.4481319, -1.581839, 0, 0.2078431, 1, 1,
0.2516232, 0.6172757, 1.115625, 0, 0.2039216, 1, 1,
0.2527827, 2.157707, 0.0892396, 0, 0.1960784, 1, 1,
0.2536652, 0.7257026, 0.8370771, 0, 0.1882353, 1, 1,
0.2540165, 0.7833796, 1.208519, 0, 0.1843137, 1, 1,
0.254117, 0.5480857, -1.614294, 0, 0.1764706, 1, 1,
0.257103, -0.9204117, 2.630139, 0, 0.172549, 1, 1,
0.2579095, -1.584022, 5.527145, 0, 0.1647059, 1, 1,
0.2584124, -0.1251907, 2.087287, 0, 0.1607843, 1, 1,
0.2617392, 0.5413607, -0.7972074, 0, 0.1529412, 1, 1,
0.2641524, -0.1651215, 1.113881, 0, 0.1490196, 1, 1,
0.268609, -2.788157, 4.220963, 0, 0.1411765, 1, 1,
0.2713903, 1.414879, 0.5670766, 0, 0.1372549, 1, 1,
0.2722536, 0.2801865, 0.7123452, 0, 0.1294118, 1, 1,
0.2727149, 0.3292763, 0.6479533, 0, 0.1254902, 1, 1,
0.2775338, -0.04065093, 2.996199, 0, 0.1176471, 1, 1,
0.278681, 0.2182322, -0.2225743, 0, 0.1137255, 1, 1,
0.2789475, 0.6843954, 0.01882775, 0, 0.1058824, 1, 1,
0.2805796, -1.678785, 2.479763, 0, 0.09803922, 1, 1,
0.2840795, 1.258295, -0.5889717, 0, 0.09411765, 1, 1,
0.2893025, 0.06366333, 2.814038, 0, 0.08627451, 1, 1,
0.2910616, 0.9553554, 1.665719, 0, 0.08235294, 1, 1,
0.2922322, 0.6545498, 0.7369241, 0, 0.07450981, 1, 1,
0.2970383, 0.3444701, 0.4916237, 0, 0.07058824, 1, 1,
0.2995857, 1.158958, 0.3675501, 0, 0.0627451, 1, 1,
0.3020995, -1.955672, 4.796199, 0, 0.05882353, 1, 1,
0.3038685, -1.176783, 4.567346, 0, 0.05098039, 1, 1,
0.3068308, -0.4412183, 1.768003, 0, 0.04705882, 1, 1,
0.307196, -0.5377365, 3.381398, 0, 0.03921569, 1, 1,
0.3076138, -1.528328, 1.39792, 0, 0.03529412, 1, 1,
0.3088798, -0.9202179, 3.986635, 0, 0.02745098, 1, 1,
0.3126145, 1.169202, 0.7595723, 0, 0.02352941, 1, 1,
0.3127035, -0.5771834, 3.067175, 0, 0.01568628, 1, 1,
0.3155262, 0.4240643, 1.773955, 0, 0.01176471, 1, 1,
0.3170328, 1.471311, 1.28582, 0, 0.003921569, 1, 1,
0.3191608, 0.8588278, 0.3470055, 0.003921569, 0, 1, 1,
0.3216017, 0.1323702, 0.3493674, 0.007843138, 0, 1, 1,
0.3241358, -0.1727266, 2.328905, 0.01568628, 0, 1, 1,
0.3327705, 0.02210385, 2.738508, 0.01960784, 0, 1, 1,
0.3378005, 1.704307, 1.03805, 0.02745098, 0, 1, 1,
0.3390428, -1.021621, 2.110628, 0.03137255, 0, 1, 1,
0.340625, -0.4598202, 3.587709, 0.03921569, 0, 1, 1,
0.3430117, -1.349301, 3.000057, 0.04313726, 0, 1, 1,
0.3444238, -0.4853133, 1.347722, 0.05098039, 0, 1, 1,
0.3489951, -0.08784095, 1.818631, 0.05490196, 0, 1, 1,
0.3543574, -1.359427, 3.053398, 0.0627451, 0, 1, 1,
0.3552889, 2.127334, -0.5198935, 0.06666667, 0, 1, 1,
0.3562398, -0.7483089, 1.37647, 0.07450981, 0, 1, 1,
0.3566941, -0.2176809, 0.5471444, 0.07843138, 0, 1, 1,
0.3568114, 0.5457331, 2.104319, 0.08627451, 0, 1, 1,
0.3568249, -0.9237795, 3.220402, 0.09019608, 0, 1, 1,
0.357309, -0.6841974, 3.265936, 0.09803922, 0, 1, 1,
0.3580551, -0.1385683, 2.297452, 0.1058824, 0, 1, 1,
0.3615989, 0.3526461, 0.910892, 0.1098039, 0, 1, 1,
0.3628473, -1.42304, 5.094364, 0.1176471, 0, 1, 1,
0.3675604, -0.3600487, 2.473162, 0.1215686, 0, 1, 1,
0.3678919, 0.8176774, 1.584683, 0.1294118, 0, 1, 1,
0.3687539, -0.631867, 4.055578, 0.1333333, 0, 1, 1,
0.3750146, -0.5566283, 4.0323, 0.1411765, 0, 1, 1,
0.3775605, 1.340191, 0.1545717, 0.145098, 0, 1, 1,
0.3784138, -0.194795, 2.387638, 0.1529412, 0, 1, 1,
0.3824609, 0.5212458, 1.897313, 0.1568628, 0, 1, 1,
0.3901142, -1.069384, 1.011348, 0.1647059, 0, 1, 1,
0.4071209, -1.403843, 0.1372688, 0.1686275, 0, 1, 1,
0.4088487, 0.6176854, 0.8012276, 0.1764706, 0, 1, 1,
0.4165447, -1.812555, 4.431144, 0.1803922, 0, 1, 1,
0.417845, 3.385201, 0.9065018, 0.1882353, 0, 1, 1,
0.4215063, -0.8922906, 1.105971, 0.1921569, 0, 1, 1,
0.426728, -0.005969356, 2.265704, 0.2, 0, 1, 1,
0.4280926, 1.658026, -0.05718132, 0.2078431, 0, 1, 1,
0.428914, -1.607198, 3.748698, 0.2117647, 0, 1, 1,
0.4373409, 0.2446337, 0.113744, 0.2196078, 0, 1, 1,
0.4399799, 1.16785, 0.590548, 0.2235294, 0, 1, 1,
0.447688, 2.913135, -0.6756117, 0.2313726, 0, 1, 1,
0.4483443, -0.181089, 0.8340961, 0.2352941, 0, 1, 1,
0.4523577, -1.045386, 4.465196, 0.2431373, 0, 1, 1,
0.4532347, 1.28988, -0.02667078, 0.2470588, 0, 1, 1,
0.4535594, 1.380675, -0.04454387, 0.254902, 0, 1, 1,
0.4578562, -0.6551471, 1.30473, 0.2588235, 0, 1, 1,
0.4580289, 0.5231204, 0.6833511, 0.2666667, 0, 1, 1,
0.4600728, -1.164333, 2.825557, 0.2705882, 0, 1, 1,
0.4625163, 0.8731577, 1.727741, 0.2784314, 0, 1, 1,
0.4632385, -1.33169, 2.394989, 0.282353, 0, 1, 1,
0.4653155, 0.7139568, 1.441476, 0.2901961, 0, 1, 1,
0.466104, -0.1080883, 0.3767387, 0.2941177, 0, 1, 1,
0.4703605, -0.7674211, 3.069009, 0.3019608, 0, 1, 1,
0.4718973, -0.6197249, 3.23728, 0.3098039, 0, 1, 1,
0.4724209, -1.074038, 2.029047, 0.3137255, 0, 1, 1,
0.4790714, -0.647374, 3.553623, 0.3215686, 0, 1, 1,
0.4816128, -0.7390263, 2.698049, 0.3254902, 0, 1, 1,
0.4817488, -1.03717, 2.61212, 0.3333333, 0, 1, 1,
0.4866135, 0.3050316, 2.716105, 0.3372549, 0, 1, 1,
0.4911673, 0.08828981, 0.6730614, 0.345098, 0, 1, 1,
0.493554, -0.1535748, 3.556248, 0.3490196, 0, 1, 1,
0.4943289, 0.4874178, 0.3934441, 0.3568628, 0, 1, 1,
0.5059144, 0.999501, 1.239543, 0.3607843, 0, 1, 1,
0.5071674, 0.3453207, 0.5878704, 0.3686275, 0, 1, 1,
0.5085353, -0.6994045, 4.135837, 0.372549, 0, 1, 1,
0.5188292, -2.273891, 5.44843, 0.3803922, 0, 1, 1,
0.52852, -1.00824, 5.38895, 0.3843137, 0, 1, 1,
0.5335544, -0.6809616, 1.656614, 0.3921569, 0, 1, 1,
0.5341972, -1.587903, 1.539058, 0.3960784, 0, 1, 1,
0.5396944, 0.6986746, 0.4102266, 0.4039216, 0, 1, 1,
0.5422728, 0.2313062, 0.6223749, 0.4117647, 0, 1, 1,
0.5497864, -3.069793, 5.278783, 0.4156863, 0, 1, 1,
0.5512839, 0.9550932, 1.050655, 0.4235294, 0, 1, 1,
0.55142, 0.1007749, 0.796975, 0.427451, 0, 1, 1,
0.5553498, 0.9032621, 1.300511, 0.4352941, 0, 1, 1,
0.5598627, -0.7653768, 1.435478, 0.4392157, 0, 1, 1,
0.5616512, 2.064849, -1.069451, 0.4470588, 0, 1, 1,
0.5636529, 1.557876, 0.3913547, 0.4509804, 0, 1, 1,
0.5642732, 1.818923, -0.275937, 0.4588235, 0, 1, 1,
0.5668951, 2.925775, -0.5786563, 0.4627451, 0, 1, 1,
0.5698217, 1.240121, 1.737985, 0.4705882, 0, 1, 1,
0.5714861, -1.535966, 2.753233, 0.4745098, 0, 1, 1,
0.5736319, 0.3261537, 0.8525757, 0.4823529, 0, 1, 1,
0.575409, -0.5022885, 3.546346, 0.4862745, 0, 1, 1,
0.5885471, -0.8948892, 2.728466, 0.4941176, 0, 1, 1,
0.5995384, 0.3462269, 0.2766405, 0.5019608, 0, 1, 1,
0.6106349, -1.530314, 3.841805, 0.5058824, 0, 1, 1,
0.6167979, 0.5748447, -0.5292302, 0.5137255, 0, 1, 1,
0.6202928, -0.3166343, 2.134768, 0.5176471, 0, 1, 1,
0.6309287, -1.125437, 1.549816, 0.5254902, 0, 1, 1,
0.6420164, 1.60142, 0.6098783, 0.5294118, 0, 1, 1,
0.6435011, 1.620024, 0.5445909, 0.5372549, 0, 1, 1,
0.6502281, -1.013361, 3.258095, 0.5411765, 0, 1, 1,
0.6516633, -2.007729, 3.114318, 0.5490196, 0, 1, 1,
0.6553784, -0.1369028, 3.042767, 0.5529412, 0, 1, 1,
0.6556192, -0.9744431, 4.109437, 0.5607843, 0, 1, 1,
0.6599346, -0.5561437, 1.820548, 0.5647059, 0, 1, 1,
0.6632441, 0.1955906, -0.8096873, 0.572549, 0, 1, 1,
0.6682346, 0.7792272, 1.615996, 0.5764706, 0, 1, 1,
0.6744775, 0.4992303, -0.6570449, 0.5843138, 0, 1, 1,
0.6747205, 0.9404858, 0.9356129, 0.5882353, 0, 1, 1,
0.6770824, -0.4324995, 0.1178943, 0.5960785, 0, 1, 1,
0.6783908, -1.459493, 1.850845, 0.6039216, 0, 1, 1,
0.6807129, -0.2116715, 3.043204, 0.6078432, 0, 1, 1,
0.6835179, -0.9395776, 2.595001, 0.6156863, 0, 1, 1,
0.6842088, -1.47811, 1.523847, 0.6196079, 0, 1, 1,
0.6854097, 1.039007, 1.874539, 0.627451, 0, 1, 1,
0.6872386, 1.668998, 1.814152, 0.6313726, 0, 1, 1,
0.69188, -0.6128437, 2.980628, 0.6392157, 0, 1, 1,
0.6931922, -0.2930247, 2.107855, 0.6431373, 0, 1, 1,
0.6999857, 1.150783, 1.547566, 0.6509804, 0, 1, 1,
0.7003221, 0.2281613, 0.6072536, 0.654902, 0, 1, 1,
0.7004524, -1.564973, 1.823817, 0.6627451, 0, 1, 1,
0.7056038, 0.1139752, 0.6669121, 0.6666667, 0, 1, 1,
0.706234, 0.8070222, 2.429805, 0.6745098, 0, 1, 1,
0.7104203, -1.625563, 2.037325, 0.6784314, 0, 1, 1,
0.7111499, 0.06692681, 1.33654, 0.6862745, 0, 1, 1,
0.7137483, 1.080969, 0.1164503, 0.6901961, 0, 1, 1,
0.7146897, -0.8935947, 4.20032, 0.6980392, 0, 1, 1,
0.7181405, 0.5012982, 0.8026493, 0.7058824, 0, 1, 1,
0.7181969, -0.2377189, 2.419046, 0.7098039, 0, 1, 1,
0.7187411, -0.4064998, 3.508945, 0.7176471, 0, 1, 1,
0.7245736, -1.916521, 2.739485, 0.7215686, 0, 1, 1,
0.7258418, -0.3428573, 0.9897627, 0.7294118, 0, 1, 1,
0.7273481, 0.3468937, 1.004676, 0.7333333, 0, 1, 1,
0.7284449, 0.01148957, 0.2887036, 0.7411765, 0, 1, 1,
0.7315296, -2.240786, 3.180816, 0.7450981, 0, 1, 1,
0.7321569, 0.6692716, 0.4834407, 0.7529412, 0, 1, 1,
0.7382274, 0.5206578, 0.4260442, 0.7568628, 0, 1, 1,
0.7416555, 0.4908769, 0.6384653, 0.7647059, 0, 1, 1,
0.7437301, -0.6586242, 2.189858, 0.7686275, 0, 1, 1,
0.7480922, -0.9131689, 3.35042, 0.7764706, 0, 1, 1,
0.7664025, -2.025064, 1.566607, 0.7803922, 0, 1, 1,
0.7721018, -1.503126, 3.362281, 0.7882353, 0, 1, 1,
0.7871104, -1.52505, 3.847383, 0.7921569, 0, 1, 1,
0.7894511, 0.2883473, 1.003577, 0.8, 0, 1, 1,
0.8056154, -0.7644178, 1.571672, 0.8078431, 0, 1, 1,
0.8118582, 0.1650147, 2.024876, 0.8117647, 0, 1, 1,
0.8158593, 0.3425679, 0.2355023, 0.8196079, 0, 1, 1,
0.8200804, -0.4865096, 1.782847, 0.8235294, 0, 1, 1,
0.820572, -0.0546516, 2.18226, 0.8313726, 0, 1, 1,
0.8218864, -0.6164262, 2.778829, 0.8352941, 0, 1, 1,
0.8310028, 0.3242953, 0.5933781, 0.8431373, 0, 1, 1,
0.8356996, -2.326167, 2.784775, 0.8470588, 0, 1, 1,
0.8362633, 1.013961, 0.8510969, 0.854902, 0, 1, 1,
0.8364547, 0.04510618, 2.248837, 0.8588235, 0, 1, 1,
0.838932, 0.4487863, 0.5081517, 0.8666667, 0, 1, 1,
0.8410226, 1.394093, 0.9700744, 0.8705882, 0, 1, 1,
0.8473341, 0.6435375, -1.778973, 0.8784314, 0, 1, 1,
0.8540354, -0.02472555, 0.5256634, 0.8823529, 0, 1, 1,
0.8576893, 0.712758, 1.356812, 0.8901961, 0, 1, 1,
0.8577876, 0.6489916, 0.2182412, 0.8941177, 0, 1, 1,
0.8640884, -0.959372, 2.693148, 0.9019608, 0, 1, 1,
0.8644816, -1.888466, 2.686219, 0.9098039, 0, 1, 1,
0.8655744, 0.1010646, 1.254817, 0.9137255, 0, 1, 1,
0.8686513, 1.39663, 0.405985, 0.9215686, 0, 1, 1,
0.8760592, -0.1114107, 1.771042, 0.9254902, 0, 1, 1,
0.8766562, -1.077305, 4.785226, 0.9333333, 0, 1, 1,
0.8832822, 1.918395, 2.663027, 0.9372549, 0, 1, 1,
0.9019286, -0.7346133, 2.026308, 0.945098, 0, 1, 1,
0.9020671, 1.40561, 0.4333218, 0.9490196, 0, 1, 1,
0.9101655, 0.118169, 0.948014, 0.9568627, 0, 1, 1,
0.9119835, -0.505195, 0.9673438, 0.9607843, 0, 1, 1,
0.9154211, -0.4195375, 3.398985, 0.9686275, 0, 1, 1,
0.9221154, 0.04105779, 2.132298, 0.972549, 0, 1, 1,
0.9247867, 0.7777168, 0.3152075, 0.9803922, 0, 1, 1,
0.9289626, -1.40483, 2.902114, 0.9843137, 0, 1, 1,
0.9296498, -0.3011359, 1.388708, 0.9921569, 0, 1, 1,
0.9361002, 1.381936, -1.697092, 0.9960784, 0, 1, 1,
0.9403202, 1.163448, 0.6473924, 1, 0, 0.9960784, 1,
0.9415827, -0.8913047, 0.9601158, 1, 0, 0.9882353, 1,
0.9450839, -0.2576085, 1.331724, 1, 0, 0.9843137, 1,
0.945334, 0.8697354, -0.6287229, 1, 0, 0.9764706, 1,
0.9550358, -0.4647916, 4.56975, 1, 0, 0.972549, 1,
0.9613924, -1.496467, 3.750691, 1, 0, 0.9647059, 1,
0.9633585, -0.6973829, 0.7417799, 1, 0, 0.9607843, 1,
0.9643626, 1.099768, 0.2733975, 1, 0, 0.9529412, 1,
0.9645665, -0.4685443, 2.478175, 1, 0, 0.9490196, 1,
0.9665985, 0.3718448, 0.7254056, 1, 0, 0.9411765, 1,
0.9669191, -0.6302011, 3.384893, 1, 0, 0.9372549, 1,
0.9722133, 1.392421, 1.807276, 1, 0, 0.9294118, 1,
0.976055, 1.180902, -1.373269, 1, 0, 0.9254902, 1,
0.9859833, 1.669503, 1.212231, 1, 0, 0.9176471, 1,
0.991097, 1.130811, -0.4780786, 1, 0, 0.9137255, 1,
0.9923772, -3.029224, 4.283746, 1, 0, 0.9058824, 1,
0.992528, 1.177957, 1.519904, 1, 0, 0.9019608, 1,
1.002554, 0.6461696, 0.4323958, 1, 0, 0.8941177, 1,
1.002839, -0.8191168, 1.182362, 1, 0, 0.8862745, 1,
1.0038, 0.9040367, 1.800738, 1, 0, 0.8823529, 1,
1.004956, 0.1085421, 2.09628, 1, 0, 0.8745098, 1,
1.005499, -1.343649, 3.650951, 1, 0, 0.8705882, 1,
1.007073, -0.1206855, 1.545788, 1, 0, 0.8627451, 1,
1.01358, -1.070788, 2.232038, 1, 0, 0.8588235, 1,
1.017702, 0.2180876, 0.1323138, 1, 0, 0.8509804, 1,
1.018338, -0.2382722, 1.67101, 1, 0, 0.8470588, 1,
1.026695, 1.13068, 1.63333, 1, 0, 0.8392157, 1,
1.028434, 1.121293, 0.9114457, 1, 0, 0.8352941, 1,
1.032139, -1.252759, 3.659637, 1, 0, 0.827451, 1,
1.034178, 0.6223873, 3.222214, 1, 0, 0.8235294, 1,
1.034533, -1.252496, -0.38953, 1, 0, 0.8156863, 1,
1.05346, -1.070388, 0.3073884, 1, 0, 0.8117647, 1,
1.056742, -0.6058294, 1.595841, 1, 0, 0.8039216, 1,
1.060793, 1.400249, 1.461772, 1, 0, 0.7960784, 1,
1.062916, -0.1850565, 1.872344, 1, 0, 0.7921569, 1,
1.069413, -0.3689596, 3.240641, 1, 0, 0.7843137, 1,
1.071002, -0.8526337, 0.8355421, 1, 0, 0.7803922, 1,
1.073972, 0.4332796, 1.677722, 1, 0, 0.772549, 1,
1.07754, 0.2105574, -0.5823455, 1, 0, 0.7686275, 1,
1.078699, -0.2462817, 0.6698129, 1, 0, 0.7607843, 1,
1.084048, -0.1616521, 2.933177, 1, 0, 0.7568628, 1,
1.085361, -1.015859, 2.023692, 1, 0, 0.7490196, 1,
1.088909, 0.2038661, -0.5666112, 1, 0, 0.7450981, 1,
1.091052, -0.6347638, 2.750358, 1, 0, 0.7372549, 1,
1.092482, 0.433533, 0.3240459, 1, 0, 0.7333333, 1,
1.093427, 0.1840775, 2.690323, 1, 0, 0.7254902, 1,
1.103975, -1.987856, 3.548401, 1, 0, 0.7215686, 1,
1.104128, -1.992643, 2.246026, 1, 0, 0.7137255, 1,
1.11105, -0.5573522, 1.358918, 1, 0, 0.7098039, 1,
1.121689, -0.7856071, 3.298887, 1, 0, 0.7019608, 1,
1.124095, 0.6964599, 0.6961265, 1, 0, 0.6941177, 1,
1.125461, 0.7099456, 1.575835, 1, 0, 0.6901961, 1,
1.130579, 1.006644, 0.9844862, 1, 0, 0.682353, 1,
1.130676, 0.9524991, 1.48448, 1, 0, 0.6784314, 1,
1.13782, 0.2943491, 1.105305, 1, 0, 0.6705883, 1,
1.141654, 0.0368489, 1.999502, 1, 0, 0.6666667, 1,
1.149059, -0.7519124, 1.345837, 1, 0, 0.6588235, 1,
1.150781, -0.1923588, 2.751225, 1, 0, 0.654902, 1,
1.157202, -0.3024001, 1.493608, 1, 0, 0.6470588, 1,
1.162802, 1.345678, 0.9471125, 1, 0, 0.6431373, 1,
1.162915, 0.5228949, 1.961079, 1, 0, 0.6352941, 1,
1.170379, -2.171412, 0.6996722, 1, 0, 0.6313726, 1,
1.197498, -0.1756883, 1.624068, 1, 0, 0.6235294, 1,
1.200236, 1.85274, 0.4780705, 1, 0, 0.6196079, 1,
1.200551, -0.5835875, 2.864637, 1, 0, 0.6117647, 1,
1.218734, -0.7014519, 2.53633, 1, 0, 0.6078432, 1,
1.220155, 0.218837, 1.22043, 1, 0, 0.6, 1,
1.228931, 0.1441534, 1.517352, 1, 0, 0.5921569, 1,
1.23103, 1.427615, 0.1511868, 1, 0, 0.5882353, 1,
1.23242, -0.3570251, 2.226835, 1, 0, 0.5803922, 1,
1.235554, 2.030472, 0.6194745, 1, 0, 0.5764706, 1,
1.237806, -2.356037, 2.785275, 1, 0, 0.5686275, 1,
1.241707, -1.137256, 1.209138, 1, 0, 0.5647059, 1,
1.242163, 0.1132248, 2.596035, 1, 0, 0.5568628, 1,
1.262439, -0.9958455, 3.077654, 1, 0, 0.5529412, 1,
1.266605, 1.733857, 0.6723783, 1, 0, 0.5450981, 1,
1.271323, -0.05284082, 2.024239, 1, 0, 0.5411765, 1,
1.298261, -1.182126, 2.105745, 1, 0, 0.5333334, 1,
1.305275, -0.7687531, 0.922106, 1, 0, 0.5294118, 1,
1.315947, 1.559416, -0.8866028, 1, 0, 0.5215687, 1,
1.318828, -0.2876047, 3.395317, 1, 0, 0.5176471, 1,
1.322652, -0.2048207, 2.617277, 1, 0, 0.509804, 1,
1.324444, 0.6464763, 2.514077, 1, 0, 0.5058824, 1,
1.326919, 0.3473973, 2.909884, 1, 0, 0.4980392, 1,
1.336341, -0.3978879, 1.336308, 1, 0, 0.4901961, 1,
1.339305, 1.132709, 1.650735, 1, 0, 0.4862745, 1,
1.343196, -0.846759, 0.7734464, 1, 0, 0.4784314, 1,
1.344649, 0.5561422, 0.5768065, 1, 0, 0.4745098, 1,
1.347999, -0.3724785, 3.062731, 1, 0, 0.4666667, 1,
1.350422, -0.07510173, 0.6879964, 1, 0, 0.4627451, 1,
1.369082, 1.536142, 0.3091539, 1, 0, 0.454902, 1,
1.379431, 1.326388, 0.6587089, 1, 0, 0.4509804, 1,
1.379739, 1.425949, 1.105781, 1, 0, 0.4431373, 1,
1.396202, -0.7324823, 2.041678, 1, 0, 0.4392157, 1,
1.396961, -0.9560247, 0.08747178, 1, 0, 0.4313726, 1,
1.399257, 0.7972118, 1.050397, 1, 0, 0.427451, 1,
1.402947, -0.02799722, 3.140319, 1, 0, 0.4196078, 1,
1.40931, 0.6623598, 1.629104, 1, 0, 0.4156863, 1,
1.413981, -2.496987, 3.057949, 1, 0, 0.4078431, 1,
1.41516, 0.7465751, 2.992013, 1, 0, 0.4039216, 1,
1.427635, 0.2915844, 2.734595, 1, 0, 0.3960784, 1,
1.432256, -0.7395598, 1.558083, 1, 0, 0.3882353, 1,
1.436271, -2.463512, 2.882443, 1, 0, 0.3843137, 1,
1.43963, 0.2419828, 0.4786697, 1, 0, 0.3764706, 1,
1.448624, 1.683031, 0.6847917, 1, 0, 0.372549, 1,
1.450958, 0.4059172, 0.5984537, 1, 0, 0.3647059, 1,
1.459194, 1.05192, 0.1746418, 1, 0, 0.3607843, 1,
1.485927, -1.592558, 2.326827, 1, 0, 0.3529412, 1,
1.502925, 1.389705, 0.8619893, 1, 0, 0.3490196, 1,
1.526087, -1.72536, 2.331302, 1, 0, 0.3411765, 1,
1.537791, -0.7986453, 1.862388, 1, 0, 0.3372549, 1,
1.54189, -0.6490779, 2.817183, 1, 0, 0.3294118, 1,
1.55336, -0.2249711, 2.317812, 1, 0, 0.3254902, 1,
1.560312, -0.1428069, 1.921973, 1, 0, 0.3176471, 1,
1.567892, 1.884465, 1.296147, 1, 0, 0.3137255, 1,
1.590911, 0.05921038, -1.666735, 1, 0, 0.3058824, 1,
1.597073, -1.735464, 2.416764, 1, 0, 0.2980392, 1,
1.604463, -0.4477601, 1.093916, 1, 0, 0.2941177, 1,
1.612482, 0.1529632, 1.061318, 1, 0, 0.2862745, 1,
1.623671, 0.4297202, 1.658021, 1, 0, 0.282353, 1,
1.625299, 0.6044537, 2.457484, 1, 0, 0.2745098, 1,
1.626273, 0.4433846, 1.360002, 1, 0, 0.2705882, 1,
1.633508, 0.8726546, -0.01568673, 1, 0, 0.2627451, 1,
1.651858, -0.4411478, 0.8666553, 1, 0, 0.2588235, 1,
1.681549, -0.4325481, 1.347057, 1, 0, 0.2509804, 1,
1.694191, -1.281223, 2.116546, 1, 0, 0.2470588, 1,
1.700177, 0.2120991, 1.714277, 1, 0, 0.2392157, 1,
1.721638, 0.3493952, 0.1843745, 1, 0, 0.2352941, 1,
1.723185, -0.195919, 1.482175, 1, 0, 0.227451, 1,
1.723337, 0.6392848, 1.690763, 1, 0, 0.2235294, 1,
1.730441, 2.005199, 0.6816834, 1, 0, 0.2156863, 1,
1.732968, 1.072381, 1.981649, 1, 0, 0.2117647, 1,
1.738609, -0.384124, 0.9231225, 1, 0, 0.2039216, 1,
1.738825, 2.043418, -0.8570603, 1, 0, 0.1960784, 1,
1.760637, 2.09508, 1.697675, 1, 0, 0.1921569, 1,
1.770764, -0.2342862, 2.234185, 1, 0, 0.1843137, 1,
1.774044, -0.7307819, 1.650337, 1, 0, 0.1803922, 1,
1.791606, -1.083749, 2.953655, 1, 0, 0.172549, 1,
1.798477, 0.9455763, 1.256147, 1, 0, 0.1686275, 1,
1.819993, -0.3236595, 1.693944, 1, 0, 0.1607843, 1,
1.824726, -1.720314, 4.408371, 1, 0, 0.1568628, 1,
1.829082, 1.296336, 2.051112, 1, 0, 0.1490196, 1,
1.838655, 0.3917582, 1.297237, 1, 0, 0.145098, 1,
1.839828, 1.958128, -0.247181, 1, 0, 0.1372549, 1,
1.853879, 0.7615424, 0.5863616, 1, 0, 0.1333333, 1,
1.854596, 0.8529922, 1.091168, 1, 0, 0.1254902, 1,
1.887603, 0.5200362, 1.626946, 1, 0, 0.1215686, 1,
1.888591, -0.2130609, 1.752943, 1, 0, 0.1137255, 1,
1.897102, -0.8404904, 3.053573, 1, 0, 0.1098039, 1,
1.916113, 0.737527, -0.5429363, 1, 0, 0.1019608, 1,
1.93197, 0.5042365, 0.09800871, 1, 0, 0.09411765, 1,
1.969052, -0.6426523, 1.15887, 1, 0, 0.09019608, 1,
1.970671, 1.389476, 1.362843, 1, 0, 0.08235294, 1,
1.986162, -0.04172616, 2.542046, 1, 0, 0.07843138, 1,
2.04678, -1.833142, 1.746429, 1, 0, 0.07058824, 1,
2.049407, -0.5797049, 2.876157, 1, 0, 0.06666667, 1,
2.053331, 0.1145004, 1.212438, 1, 0, 0.05882353, 1,
2.077574, -1.440831, 0.5901495, 1, 0, 0.05490196, 1,
2.081774, -1.421695, 0.6342195, 1, 0, 0.04705882, 1,
2.091348, -0.797749, 2.566071, 1, 0, 0.04313726, 1,
2.138346, 0.7255266, 2.557193, 1, 0, 0.03529412, 1,
2.143319, 0.1386689, 2.298675, 1, 0, 0.03137255, 1,
2.145312, -1.429922, 2.349201, 1, 0, 0.02352941, 1,
2.187131, -0.6854146, 1.775367, 1, 0, 0.01960784, 1,
2.246381, -2.060802, 2.254413, 1, 0, 0.01176471, 1,
2.455575, 1.324357, 2.368309, 1, 0, 0.007843138, 1
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
-0.4334553, -4.313413, -6.546103, 0, -0.5, 0.5, 0.5,
-0.4334553, -4.313413, -6.546103, 1, -0.5, 0.5, 0.5,
-0.4334553, -4.313413, -6.546103, 1, 1.5, 0.5, 0.5,
-0.4334553, -4.313413, -6.546103, 0, 1.5, 0.5, 0.5
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
-4.301867, 0.0937885, -6.546103, 0, -0.5, 0.5, 0.5,
-4.301867, 0.0937885, -6.546103, 1, -0.5, 0.5, 0.5,
-4.301867, 0.0937885, -6.546103, 1, 1.5, 0.5, 0.5,
-4.301867, 0.0937885, -6.546103, 0, 1.5, 0.5, 0.5
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
-4.301867, -4.313413, 0.3654315, 0, -0.5, 0.5, 0.5,
-4.301867, -4.313413, 0.3654315, 1, -0.5, 0.5, 0.5,
-4.301867, -4.313413, 0.3654315, 1, 1.5, 0.5, 0.5,
-4.301867, -4.313413, 0.3654315, 0, 1.5, 0.5, 0.5
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
-3, -3.296367, -4.951134,
2, -3.296367, -4.951134,
-3, -3.296367, -4.951134,
-3, -3.465874, -5.216962,
-2, -3.296367, -4.951134,
-2, -3.465874, -5.216962,
-1, -3.296367, -4.951134,
-1, -3.465874, -5.216962,
0, -3.296367, -4.951134,
0, -3.465874, -5.216962,
1, -3.296367, -4.951134,
1, -3.465874, -5.216962,
2, -3.296367, -4.951134,
2, -3.465874, -5.216962
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
-3, -3.80489, -5.748619, 0, -0.5, 0.5, 0.5,
-3, -3.80489, -5.748619, 1, -0.5, 0.5, 0.5,
-3, -3.80489, -5.748619, 1, 1.5, 0.5, 0.5,
-3, -3.80489, -5.748619, 0, 1.5, 0.5, 0.5,
-2, -3.80489, -5.748619, 0, -0.5, 0.5, 0.5,
-2, -3.80489, -5.748619, 1, -0.5, 0.5, 0.5,
-2, -3.80489, -5.748619, 1, 1.5, 0.5, 0.5,
-2, -3.80489, -5.748619, 0, 1.5, 0.5, 0.5,
-1, -3.80489, -5.748619, 0, -0.5, 0.5, 0.5,
-1, -3.80489, -5.748619, 1, -0.5, 0.5, 0.5,
-1, -3.80489, -5.748619, 1, 1.5, 0.5, 0.5,
-1, -3.80489, -5.748619, 0, 1.5, 0.5, 0.5,
0, -3.80489, -5.748619, 0, -0.5, 0.5, 0.5,
0, -3.80489, -5.748619, 1, -0.5, 0.5, 0.5,
0, -3.80489, -5.748619, 1, 1.5, 0.5, 0.5,
0, -3.80489, -5.748619, 0, 1.5, 0.5, 0.5,
1, -3.80489, -5.748619, 0, -0.5, 0.5, 0.5,
1, -3.80489, -5.748619, 1, -0.5, 0.5, 0.5,
1, -3.80489, -5.748619, 1, 1.5, 0.5, 0.5,
1, -3.80489, -5.748619, 0, 1.5, 0.5, 0.5,
2, -3.80489, -5.748619, 0, -0.5, 0.5, 0.5,
2, -3.80489, -5.748619, 1, -0.5, 0.5, 0.5,
2, -3.80489, -5.748619, 1, 1.5, 0.5, 0.5,
2, -3.80489, -5.748619, 0, 1.5, 0.5, 0.5
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
-3.409156, -3, -4.951134,
-3.409156, 3, -4.951134,
-3.409156, -3, -4.951134,
-3.557941, -3, -5.216962,
-3.409156, -2, -4.951134,
-3.557941, -2, -5.216962,
-3.409156, -1, -4.951134,
-3.557941, -1, -5.216962,
-3.409156, 0, -4.951134,
-3.557941, 0, -5.216962,
-3.409156, 1, -4.951134,
-3.557941, 1, -5.216962,
-3.409156, 2, -4.951134,
-3.557941, 2, -5.216962,
-3.409156, 3, -4.951134,
-3.557941, 3, -5.216962
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
-3.855511, -3, -5.748619, 0, -0.5, 0.5, 0.5,
-3.855511, -3, -5.748619, 1, -0.5, 0.5, 0.5,
-3.855511, -3, -5.748619, 1, 1.5, 0.5, 0.5,
-3.855511, -3, -5.748619, 0, 1.5, 0.5, 0.5,
-3.855511, -2, -5.748619, 0, -0.5, 0.5, 0.5,
-3.855511, -2, -5.748619, 1, -0.5, 0.5, 0.5,
-3.855511, -2, -5.748619, 1, 1.5, 0.5, 0.5,
-3.855511, -2, -5.748619, 0, 1.5, 0.5, 0.5,
-3.855511, -1, -5.748619, 0, -0.5, 0.5, 0.5,
-3.855511, -1, -5.748619, 1, -0.5, 0.5, 0.5,
-3.855511, -1, -5.748619, 1, 1.5, 0.5, 0.5,
-3.855511, -1, -5.748619, 0, 1.5, 0.5, 0.5,
-3.855511, 0, -5.748619, 0, -0.5, 0.5, 0.5,
-3.855511, 0, -5.748619, 1, -0.5, 0.5, 0.5,
-3.855511, 0, -5.748619, 1, 1.5, 0.5, 0.5,
-3.855511, 0, -5.748619, 0, 1.5, 0.5, 0.5,
-3.855511, 1, -5.748619, 0, -0.5, 0.5, 0.5,
-3.855511, 1, -5.748619, 1, -0.5, 0.5, 0.5,
-3.855511, 1, -5.748619, 1, 1.5, 0.5, 0.5,
-3.855511, 1, -5.748619, 0, 1.5, 0.5, 0.5,
-3.855511, 2, -5.748619, 0, -0.5, 0.5, 0.5,
-3.855511, 2, -5.748619, 1, -0.5, 0.5, 0.5,
-3.855511, 2, -5.748619, 1, 1.5, 0.5, 0.5,
-3.855511, 2, -5.748619, 0, 1.5, 0.5, 0.5,
-3.855511, 3, -5.748619, 0, -0.5, 0.5, 0.5,
-3.855511, 3, -5.748619, 1, -0.5, 0.5, 0.5,
-3.855511, 3, -5.748619, 1, 1.5, 0.5, 0.5,
-3.855511, 3, -5.748619, 0, 1.5, 0.5, 0.5
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
-3.409156, -3.296367, -4,
-3.409156, -3.296367, 4,
-3.409156, -3.296367, -4,
-3.557941, -3.465874, -4,
-3.409156, -3.296367, -2,
-3.557941, -3.465874, -2,
-3.409156, -3.296367, 0,
-3.557941, -3.465874, 0,
-3.409156, -3.296367, 2,
-3.557941, -3.465874, 2,
-3.409156, -3.296367, 4,
-3.557941, -3.465874, 4
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
-3.855511, -3.80489, -4, 0, -0.5, 0.5, 0.5,
-3.855511, -3.80489, -4, 1, -0.5, 0.5, 0.5,
-3.855511, -3.80489, -4, 1, 1.5, 0.5, 0.5,
-3.855511, -3.80489, -4, 0, 1.5, 0.5, 0.5,
-3.855511, -3.80489, -2, 0, -0.5, 0.5, 0.5,
-3.855511, -3.80489, -2, 1, -0.5, 0.5, 0.5,
-3.855511, -3.80489, -2, 1, 1.5, 0.5, 0.5,
-3.855511, -3.80489, -2, 0, 1.5, 0.5, 0.5,
-3.855511, -3.80489, 0, 0, -0.5, 0.5, 0.5,
-3.855511, -3.80489, 0, 1, -0.5, 0.5, 0.5,
-3.855511, -3.80489, 0, 1, 1.5, 0.5, 0.5,
-3.855511, -3.80489, 0, 0, 1.5, 0.5, 0.5,
-3.855511, -3.80489, 2, 0, -0.5, 0.5, 0.5,
-3.855511, -3.80489, 2, 1, -0.5, 0.5, 0.5,
-3.855511, -3.80489, 2, 1, 1.5, 0.5, 0.5,
-3.855511, -3.80489, 2, 0, 1.5, 0.5, 0.5,
-3.855511, -3.80489, 4, 0, -0.5, 0.5, 0.5,
-3.855511, -3.80489, 4, 1, -0.5, 0.5, 0.5,
-3.855511, -3.80489, 4, 1, 1.5, 0.5, 0.5,
-3.855511, -3.80489, 4, 0, 1.5, 0.5, 0.5
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
-3.409156, -3.296367, -4.951134,
-3.409156, 3.483944, -4.951134,
-3.409156, -3.296367, 5.681997,
-3.409156, 3.483944, 5.681997,
-3.409156, -3.296367, -4.951134,
-3.409156, -3.296367, 5.681997,
-3.409156, 3.483944, -4.951134,
-3.409156, 3.483944, 5.681997,
-3.409156, -3.296367, -4.951134,
2.542246, -3.296367, -4.951134,
-3.409156, -3.296367, 5.681997,
2.542246, -3.296367, 5.681997,
-3.409156, 3.483944, -4.951134,
2.542246, 3.483944, -4.951134,
-3.409156, 3.483944, 5.681997,
2.542246, 3.483944, 5.681997,
2.542246, -3.296367, -4.951134,
2.542246, 3.483944, -4.951134,
2.542246, -3.296367, 5.681997,
2.542246, 3.483944, 5.681997,
2.542246, -3.296367, -4.951134,
2.542246, -3.296367, 5.681997,
2.542246, 3.483944, -4.951134,
2.542246, 3.483944, 5.681997
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
var radius = 7.44621;
var distance = 33.12903;
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
mvMatrix.translate( 0.4334553, -0.0937885, -0.3654315 );
mvMatrix.scale( 1.352789, 1.187407, 0.7571607 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.12903);
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
benodanil<-read.table("benodanil.xyz")
```

```
## Error in read.table("benodanil.xyz"): no lines available in input
```

```r
x<-benodanil$V2
```

```
## Error in eval(expr, envir, enclos): object 'benodanil' not found
```

```r
y<-benodanil$V3
```

```
## Error in eval(expr, envir, enclos): object 'benodanil' not found
```

```r
z<-benodanil$V4
```

```
## Error in eval(expr, envir, enclos): object 'benodanil' not found
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
-3.322485, 1.425285, -0.5597011, 0, 0, 1, 1, 1,
-3.176043, 0.9073119, -1.501461, 1, 0, 0, 1, 1,
-2.866607, 1.599892, -0.2887383, 1, 0, 0, 1, 1,
-2.845063, 1.213961, -1.305264, 1, 0, 0, 1, 1,
-2.669747, 0.1147965, -1.710995, 1, 0, 0, 1, 1,
-2.644464, 0.5897331, -2.326706, 1, 0, 0, 1, 1,
-2.598274, 0.7239771, -1.642437, 0, 0, 0, 1, 1,
-2.566175, 0.9853299, -2.440947, 0, 0, 0, 1, 1,
-2.469982, -0.89803, -2.729672, 0, 0, 0, 1, 1,
-2.468977, -1.09591, -2.733103, 0, 0, 0, 1, 1,
-2.419434, -0.1906446, -1.376614, 0, 0, 0, 1, 1,
-2.417049, -0.5333042, -2.209082, 0, 0, 0, 1, 1,
-2.410367, 0.6795979, -0.300918, 0, 0, 0, 1, 1,
-2.385864, 0.2391081, -2.94034, 1, 1, 1, 1, 1,
-2.365478, 0.7054929, -0.8592489, 1, 1, 1, 1, 1,
-2.326241, 1.306603, -0.5282074, 1, 1, 1, 1, 1,
-2.319165, -0.9237348, -2.622882, 1, 1, 1, 1, 1,
-2.281562, 0.3470477, -1.450539, 1, 1, 1, 1, 1,
-2.275327, -1.03309, -3.007579, 1, 1, 1, 1, 1,
-2.26216, 0.04181211, -2.410681, 1, 1, 1, 1, 1,
-2.254127, -0.6148723, -3.122011, 1, 1, 1, 1, 1,
-2.238157, -1.035806, -2.486276, 1, 1, 1, 1, 1,
-2.194439, 0.7210912, -2.486725, 1, 1, 1, 1, 1,
-2.192419, 0.2325034, 0.2270658, 1, 1, 1, 1, 1,
-2.188394, -1.200469, -1.403466, 1, 1, 1, 1, 1,
-2.182308, 1.519325, -0.6736869, 1, 1, 1, 1, 1,
-2.146391, -0.09883407, -1.547794, 1, 1, 1, 1, 1,
-2.128649, 0.8100181, -2.549077, 1, 1, 1, 1, 1,
-2.102489, 1.396227, 0.04333149, 0, 0, 1, 1, 1,
-2.084401, -1.387807, -0.9421195, 1, 0, 0, 1, 1,
-2.079983, -2.366786, -2.972877, 1, 0, 0, 1, 1,
-1.986803, -0.8301297, -3.237126, 1, 0, 0, 1, 1,
-1.958891, -1.218058, -1.21503, 1, 0, 0, 1, 1,
-1.940131, -0.6535482, -1.519635, 1, 0, 0, 1, 1,
-1.91719, 0.05894512, -2.572732, 0, 0, 0, 1, 1,
-1.891636, 1.363343, -0.3107474, 0, 0, 0, 1, 1,
-1.862948, -0.98249, -2.324408, 0, 0, 0, 1, 1,
-1.856007, 1.652111, -0.4680797, 0, 0, 0, 1, 1,
-1.853139, 0.08214281, -2.446926, 0, 0, 0, 1, 1,
-1.847717, -1.277104, -2.772169, 0, 0, 0, 1, 1,
-1.847221, 0.9570451, -1.059673, 0, 0, 0, 1, 1,
-1.83046, -1.008, -0.9991115, 1, 1, 1, 1, 1,
-1.830269, 0.3761889, -3.922234, 1, 1, 1, 1, 1,
-1.824553, 0.8084115, -2.405105, 1, 1, 1, 1, 1,
-1.81872, -0.09220774, -2.974946, 1, 1, 1, 1, 1,
-1.816437, 1.478613, 0.1818976, 1, 1, 1, 1, 1,
-1.808134, -0.1634044, -4.20888, 1, 1, 1, 1, 1,
-1.804798, 0.4538971, -0.1605433, 1, 1, 1, 1, 1,
-1.792303, 0.9975725, -2.684248, 1, 1, 1, 1, 1,
-1.779395, -1.331083, -2.671131, 1, 1, 1, 1, 1,
-1.772615, 0.3986918, -1.172901, 1, 1, 1, 1, 1,
-1.732958, -0.188794, -1.333707, 1, 1, 1, 1, 1,
-1.721369, -0.5558227, -2.699474, 1, 1, 1, 1, 1,
-1.70458, 1.698617, -1.026897, 1, 1, 1, 1, 1,
-1.686969, 0.9107564, -1.155832, 1, 1, 1, 1, 1,
-1.678493, -1.077719, -1.788407, 1, 1, 1, 1, 1,
-1.676809, 0.6757467, 0.4142312, 0, 0, 1, 1, 1,
-1.67637, 0.9313368, -0.5860069, 1, 0, 0, 1, 1,
-1.670847, 0.1096705, -1.051341, 1, 0, 0, 1, 1,
-1.657928, 1.147285, -1.980924, 1, 0, 0, 1, 1,
-1.639253, -0.4047479, -1.908356, 1, 0, 0, 1, 1,
-1.633683, -0.5167601, -1.968319, 1, 0, 0, 1, 1,
-1.630356, 0.8708122, -0.3985862, 0, 0, 0, 1, 1,
-1.6293, -0.1263612, 0.6046694, 0, 0, 0, 1, 1,
-1.614712, 0.6491687, -2.548231, 0, 0, 0, 1, 1,
-1.591348, -0.2383712, -2.40722, 0, 0, 0, 1, 1,
-1.590117, -1.414446, -1.032653, 0, 0, 0, 1, 1,
-1.584762, 0.4324466, -2.764794, 0, 0, 0, 1, 1,
-1.575496, 0.618761, 0.7682103, 0, 0, 0, 1, 1,
-1.572644, -0.3460363, -1.489293, 1, 1, 1, 1, 1,
-1.552997, -0.3322072, -2.618972, 1, 1, 1, 1, 1,
-1.551829, -1.22441, -1.95194, 1, 1, 1, 1, 1,
-1.551328, 0.8077086, -2.630699, 1, 1, 1, 1, 1,
-1.547991, 1.774487, -0.420057, 1, 1, 1, 1, 1,
-1.538487, 2.842877, -0.1769383, 1, 1, 1, 1, 1,
-1.529336, 0.7018825, -1.912764, 1, 1, 1, 1, 1,
-1.516883, -2.168101, -2.546738, 1, 1, 1, 1, 1,
-1.508104, 0.622513, 0.4049482, 1, 1, 1, 1, 1,
-1.507841, 1.416848, -2.245533, 1, 1, 1, 1, 1,
-1.506352, 1.233659, -0.5125743, 1, 1, 1, 1, 1,
-1.499342, -1.2226, -1.802803, 1, 1, 1, 1, 1,
-1.490975, -0.8368105, -1.839179, 1, 1, 1, 1, 1,
-1.486733, 0.9272441, 0.04710127, 1, 1, 1, 1, 1,
-1.486721, -0.16769, -0.9881158, 1, 1, 1, 1, 1,
-1.483656, 0.9513879, -0.3708124, 0, 0, 1, 1, 1,
-1.481779, 1.432606, 0.5548763, 1, 0, 0, 1, 1,
-1.478831, 0.7917401, -1.727676, 1, 0, 0, 1, 1,
-1.477995, 0.4068701, -0.6500316, 1, 0, 0, 1, 1,
-1.468642, 1.111673, 0.3304709, 1, 0, 0, 1, 1,
-1.463434, 0.1106473, -3.667439, 1, 0, 0, 1, 1,
-1.444127, 1.047287, -0.1298085, 0, 0, 0, 1, 1,
-1.443082, 1.021878, -2.24929, 0, 0, 0, 1, 1,
-1.439529, 0.2025594, -2.069282, 0, 0, 0, 1, 1,
-1.439352, 0.4466971, -1.166796, 0, 0, 0, 1, 1,
-1.433863, 2.167423, -0.9328974, 0, 0, 0, 1, 1,
-1.426546, 0.8351712, -0.147392, 0, 0, 0, 1, 1,
-1.424357, -0.1644223, -0.5074296, 0, 0, 0, 1, 1,
-1.423821, -0.2889782, -2.44319, 1, 1, 1, 1, 1,
-1.416652, -0.6463428, -0.1191864, 1, 1, 1, 1, 1,
-1.400869, -1.346381, -2.453322, 1, 1, 1, 1, 1,
-1.394708, 0.1181824, -1.411393, 1, 1, 1, 1, 1,
-1.380076, 0.5129945, -2.771247, 1, 1, 1, 1, 1,
-1.371747, -0.5127457, -2.446174, 1, 1, 1, 1, 1,
-1.367251, 1.078711, -1.350963, 1, 1, 1, 1, 1,
-1.350723, 0.4168695, -2.419427, 1, 1, 1, 1, 1,
-1.349116, -0.7382718, -1.707669, 1, 1, 1, 1, 1,
-1.348315, -1.211308, -2.011647, 1, 1, 1, 1, 1,
-1.345556, -0.3202226, -1.302984, 1, 1, 1, 1, 1,
-1.343066, 0.8377268, -3.087079, 1, 1, 1, 1, 1,
-1.337351, -0.7005789, -2.73445, 1, 1, 1, 1, 1,
-1.302137, 0.8257478, -0.4256183, 1, 1, 1, 1, 1,
-1.296814, -0.4922151, -3.37627, 1, 1, 1, 1, 1,
-1.293389, -2.996438, -3.686385, 0, 0, 1, 1, 1,
-1.269765, 0.9766939, -1.212581, 1, 0, 0, 1, 1,
-1.269569, -0.2164853, -1.159193, 1, 0, 0, 1, 1,
-1.266697, -2.904604, -3.238338, 1, 0, 0, 1, 1,
-1.263824, -0.1963044, -2.7581, 1, 0, 0, 1, 1,
-1.249499, -1.056693, -2.053616, 1, 0, 0, 1, 1,
-1.235065, -0.7951579, -2.258125, 0, 0, 0, 1, 1,
-1.2301, 1.092126, -1.056406, 0, 0, 0, 1, 1,
-1.230005, 0.601765, -0.7294846, 0, 0, 0, 1, 1,
-1.215019, 1.727307, -2.3731, 0, 0, 0, 1, 1,
-1.211741, -0.6292877, -4.292035, 0, 0, 0, 1, 1,
-1.207487, -2.041157, -3.290115, 0, 0, 0, 1, 1,
-1.207197, -1.024399, -2.568367, 0, 0, 0, 1, 1,
-1.206584, -1.248241, -0.901471, 1, 1, 1, 1, 1,
-1.196953, 1.951506, -0.8661307, 1, 1, 1, 1, 1,
-1.195557, 0.1702575, -2.910585, 1, 1, 1, 1, 1,
-1.191463, -0.1872622, -1.369061, 1, 1, 1, 1, 1,
-1.182866, -0.3888578, -3.162304, 1, 1, 1, 1, 1,
-1.179384, -0.8610315, -3.786363, 1, 1, 1, 1, 1,
-1.174503, -0.9177878, -2.148806, 1, 1, 1, 1, 1,
-1.171333, 1.614727, -0.2726595, 1, 1, 1, 1, 1,
-1.168361, 0.8493633, -0.656603, 1, 1, 1, 1, 1,
-1.166352, -0.3099633, -3.099953, 1, 1, 1, 1, 1,
-1.164861, 0.3217941, -3.164211, 1, 1, 1, 1, 1,
-1.157747, 0.7241787, -0.1135184, 1, 1, 1, 1, 1,
-1.156783, 0.1996944, -2.963792, 1, 1, 1, 1, 1,
-1.156463, -0.3901788, -1.871732, 1, 1, 1, 1, 1,
-1.148799, 0.7812241, -0.04375959, 1, 1, 1, 1, 1,
-1.143645, -0.7007303, -2.197099, 0, 0, 1, 1, 1,
-1.138959, -0.8706353, -3.92645, 1, 0, 0, 1, 1,
-1.134968, -0.5199034, -1.702448, 1, 0, 0, 1, 1,
-1.133312, -0.119151, -2.32917, 1, 0, 0, 1, 1,
-1.116448, -0.6870407, -2.56371, 1, 0, 0, 1, 1,
-1.101388, 0.8481637, 0.2735591, 1, 0, 0, 1, 1,
-1.086143, -1.623218, -0.3295361, 0, 0, 0, 1, 1,
-1.079946, -0.3427909, -2.168793, 0, 0, 0, 1, 1,
-1.065444, -0.2202408, -3.482517, 0, 0, 0, 1, 1,
-1.060054, -1.038607, 0.4561602, 0, 0, 0, 1, 1,
-1.059354, -0.1888142, -0.9305465, 0, 0, 0, 1, 1,
-1.054106, -0.01602977, -0.641941, 0, 0, 0, 1, 1,
-1.048188, -0.5601542, -2.308208, 0, 0, 0, 1, 1,
-1.043058, -0.3170891, -2.680187, 1, 1, 1, 1, 1,
-1.041256, 0.9078119, 2.07, 1, 1, 1, 1, 1,
-1.040765, 0.4939629, -0.007411999, 1, 1, 1, 1, 1,
-1.038928, 1.239266, -0.485298, 1, 1, 1, 1, 1,
-1.02743, 0.03954865, -2.801762, 1, 1, 1, 1, 1,
-1.023728, 0.003796985, -1.190589, 1, 1, 1, 1, 1,
-1.020154, -0.8006342, -1.880521, 1, 1, 1, 1, 1,
-1.013135, -0.2968746, -1.884223, 1, 1, 1, 1, 1,
-1.011669, 0.06250416, -3.132792, 1, 1, 1, 1, 1,
-1.008473, 0.6319175, 0.06559216, 1, 1, 1, 1, 1,
-1.007849, 1.795638, 0.4166437, 1, 1, 1, 1, 1,
-1.006995, -0.7487919, -1.407144, 1, 1, 1, 1, 1,
-0.996058, -1.596189, -2.712557, 1, 1, 1, 1, 1,
-0.9903846, 0.2799591, -1.774023, 1, 1, 1, 1, 1,
-0.9885265, -0.1518194, -0.232263, 1, 1, 1, 1, 1,
-0.9882591, 0.04688427, -1.131933, 0, 0, 1, 1, 1,
-0.9826654, 0.8163362, -1.77818, 1, 0, 0, 1, 1,
-0.9821328, 0.4113624, -1.376093, 1, 0, 0, 1, 1,
-0.9751961, 0.7741312, -1.622421, 1, 0, 0, 1, 1,
-0.9747332, 1.450359, 0.8252249, 1, 0, 0, 1, 1,
-0.9726272, -1.790343, -3.596849, 1, 0, 0, 1, 1,
-0.9670705, -1.057059, -3.091789, 0, 0, 0, 1, 1,
-0.9661667, 2.071801, 0.7548832, 0, 0, 0, 1, 1,
-0.9657708, 0.8510798, -0.06341386, 0, 0, 0, 1, 1,
-0.9646819, 0.1142052, -1.437933, 0, 0, 0, 1, 1,
-0.9635898, 1.495161, 0.1771785, 0, 0, 0, 1, 1,
-0.9552453, 1.606432, 0.3341284, 0, 0, 0, 1, 1,
-0.9532247, 0.6860734, -1.074961, 0, 0, 0, 1, 1,
-0.9528977, 0.4050384, -2.981796, 1, 1, 1, 1, 1,
-0.951496, 1.163359, -0.4222818, 1, 1, 1, 1, 1,
-0.9510176, 0.3642081, -0.4617285, 1, 1, 1, 1, 1,
-0.9424164, 0.07469714, -3.418574, 1, 1, 1, 1, 1,
-0.9321367, -0.02492905, -1.140229, 1, 1, 1, 1, 1,
-0.9287923, -0.2967162, -0.7277305, 1, 1, 1, 1, 1,
-0.9175586, 0.9093385, -1.008712, 1, 1, 1, 1, 1,
-0.9074352, -1.434567, -1.71272, 1, 1, 1, 1, 1,
-0.8977132, -0.8056735, -0.4294495, 1, 1, 1, 1, 1,
-0.8957979, 0.1609295, -0.231301, 1, 1, 1, 1, 1,
-0.8896863, 0.3939572, -2.147391, 1, 1, 1, 1, 1,
-0.8864113, -2.078761, -1.820434, 1, 1, 1, 1, 1,
-0.8817739, 1.231442, -2.787327, 1, 1, 1, 1, 1,
-0.8776709, 0.3190705, -2.517857, 1, 1, 1, 1, 1,
-0.8753068, 1.320606, 0.1834478, 1, 1, 1, 1, 1,
-0.8746796, -1.085817, -3.393341, 0, 0, 1, 1, 1,
-0.8739999, 2.098253, -0.4248694, 1, 0, 0, 1, 1,
-0.869419, 0.4252524, 0.0521342, 1, 0, 0, 1, 1,
-0.8639342, 0.04497021, -1.605206, 1, 0, 0, 1, 1,
-0.862934, 0.6268491, -1.615127, 1, 0, 0, 1, 1,
-0.8610502, -0.9296679, -0.9336691, 1, 0, 0, 1, 1,
-0.8586007, -0.772603, -3.547467, 0, 0, 0, 1, 1,
-0.8552605, -0.2671795, -1.557267, 0, 0, 0, 1, 1,
-0.8544984, 0.1716937, -1.285766, 0, 0, 0, 1, 1,
-0.8518054, -1.217427, -2.994733, 0, 0, 0, 1, 1,
-0.8506411, 0.1431852, -1.759708, 0, 0, 0, 1, 1,
-0.8421702, -0.4857517, -1.776299, 0, 0, 0, 1, 1,
-0.841224, 1.480695, -2.023381, 0, 0, 0, 1, 1,
-0.8348004, 0.8924359, 0.2144314, 1, 1, 1, 1, 1,
-0.8296736, -0.399569, -2.532978, 1, 1, 1, 1, 1,
-0.827062, 1.770437, -2.137945, 1, 1, 1, 1, 1,
-0.8267553, 0.3169017, -2.220854, 1, 1, 1, 1, 1,
-0.8193995, -1.128092, -3.719943, 1, 1, 1, 1, 1,
-0.8163925, 0.2893228, -1.269193, 1, 1, 1, 1, 1,
-0.8151608, 0.9005677, -0.2395663, 1, 1, 1, 1, 1,
-0.8094369, 2.765377, 0.6352943, 1, 1, 1, 1, 1,
-0.8085839, 0.6948335, -0.7626247, 1, 1, 1, 1, 1,
-0.8005239, 0.8874272, -2.673981, 1, 1, 1, 1, 1,
-0.7994379, -0.0172971, -1.596976, 1, 1, 1, 1, 1,
-0.7976813, 0.864978, 0.3122771, 1, 1, 1, 1, 1,
-0.7884343, -0.4228038, -1.686397, 1, 1, 1, 1, 1,
-0.787782, 0.5214457, -2.040064, 1, 1, 1, 1, 1,
-0.7865801, -1.018165, -3.004759, 1, 1, 1, 1, 1,
-0.7781347, 0.7138115, -3.153089, 0, 0, 1, 1, 1,
-0.7776777, -0.7103852, -2.938597, 1, 0, 0, 1, 1,
-0.7757111, 0.4297357, -0.4593316, 1, 0, 0, 1, 1,
-0.7742773, 0.286503, -1.227356, 1, 0, 0, 1, 1,
-0.7730904, -1.162268, -2.39056, 1, 0, 0, 1, 1,
-0.7728773, 1.065521, -0.8032954, 1, 0, 0, 1, 1,
-0.7624163, -0.02167748, -1.614925, 0, 0, 0, 1, 1,
-0.7606314, -0.2245128, 0.9503515, 0, 0, 0, 1, 1,
-0.7577816, -1.050563, -2.729417, 0, 0, 0, 1, 1,
-0.7559953, 0.4267887, -0.1842374, 0, 0, 0, 1, 1,
-0.7490833, 0.01453532, -0.8282167, 0, 0, 0, 1, 1,
-0.748886, 0.6857608, -1.000489, 0, 0, 0, 1, 1,
-0.7456324, -0.8143137, -1.653224, 0, 0, 0, 1, 1,
-0.7450274, 1.335509, 0.358826, 1, 1, 1, 1, 1,
-0.7448223, -0.2114815, -2.107735, 1, 1, 1, 1, 1,
-0.7440599, -0.6613505, -3.119357, 1, 1, 1, 1, 1,
-0.7391143, 1.208556, -0.7423434, 1, 1, 1, 1, 1,
-0.7379589, -1.074736, -2.543899, 1, 1, 1, 1, 1,
-0.7303451, 0.8493662, 0.1709039, 1, 1, 1, 1, 1,
-0.7285423, -0.110776, -0.3102989, 1, 1, 1, 1, 1,
-0.7276312, -0.9148844, -2.480073, 1, 1, 1, 1, 1,
-0.7273492, 1.592332, -1.818393, 1, 1, 1, 1, 1,
-0.723727, 0.3722443, -0.8732066, 1, 1, 1, 1, 1,
-0.7210841, 0.03070841, -1.87965, 1, 1, 1, 1, 1,
-0.7209829, 0.9048942, 0.3837458, 1, 1, 1, 1, 1,
-0.7112016, -1.090275, -2.099444, 1, 1, 1, 1, 1,
-0.7109896, -0.9877589, -2.942559, 1, 1, 1, 1, 1,
-0.7092366, -0.7579353, -2.362226, 1, 1, 1, 1, 1,
-0.7060517, 0.6391808, -0.2968524, 0, 0, 1, 1, 1,
-0.7015513, 0.8080716, 0.3589786, 1, 0, 0, 1, 1,
-0.6974277, -0.8764217, -2.358896, 1, 0, 0, 1, 1,
-0.6964765, -2.046955, -3.477895, 1, 0, 0, 1, 1,
-0.6929993, -0.4277419, -1.846262, 1, 0, 0, 1, 1,
-0.6917965, 0.3684364, -1.816414, 1, 0, 0, 1, 1,
-0.6854888, 0.2265077, -1.199947, 0, 0, 0, 1, 1,
-0.6836465, -0.4650191, -1.668545, 0, 0, 0, 1, 1,
-0.6818125, 0.5878962, 0.8243995, 0, 0, 0, 1, 1,
-0.681664, 0.614678, -1.009435, 0, 0, 0, 1, 1,
-0.6810853, -3.197624, -1.539325, 0, 0, 0, 1, 1,
-0.6781296, -0.120416, -0.2827191, 0, 0, 0, 1, 1,
-0.6765643, -0.9443588, -1.372606, 0, 0, 0, 1, 1,
-0.6759706, 0.4673504, 0.3556092, 1, 1, 1, 1, 1,
-0.670908, -0.169456, -2.819195, 1, 1, 1, 1, 1,
-0.6640241, -0.001074086, 0.5375862, 1, 1, 1, 1, 1,
-0.6568066, -0.1035653, -0.3975088, 1, 1, 1, 1, 1,
-0.6546071, 0.9624884, -2.129782, 1, 1, 1, 1, 1,
-0.6529577, -1.293224, -3.052016, 1, 1, 1, 1, 1,
-0.6498495, -0.4529085, -3.60924, 1, 1, 1, 1, 1,
-0.6497737, -0.9142601, -3.105836, 1, 1, 1, 1, 1,
-0.6479745, 1.657275, -1.141622, 1, 1, 1, 1, 1,
-0.6444166, 0.3975579, -1.784562, 1, 1, 1, 1, 1,
-0.6439783, 0.7082603, -1.033879, 1, 1, 1, 1, 1,
-0.6409882, -0.4713063, -1.50012, 1, 1, 1, 1, 1,
-0.6404747, 0.7201141, -1.724806, 1, 1, 1, 1, 1,
-0.63599, -0.08462732, -0.2372188, 1, 1, 1, 1, 1,
-0.6357529, -0.8664518, -3.689915, 1, 1, 1, 1, 1,
-0.6314689, 0.630453, 1.205619, 0, 0, 1, 1, 1,
-0.629248, -1.661714, -3.800154, 1, 0, 0, 1, 1,
-0.6291303, 1.498736, -0.1359008, 1, 0, 0, 1, 1,
-0.6228061, -0.4576128, -4.352341, 1, 0, 0, 1, 1,
-0.622161, 1.618095, 0.1919888, 1, 0, 0, 1, 1,
-0.6193357, 1.208481, -0.9583006, 1, 0, 0, 1, 1,
-0.6183459, 0.3859591, -1.068806, 0, 0, 0, 1, 1,
-0.6111004, -0.6132193, -4.796282, 0, 0, 0, 1, 1,
-0.6072661, -0.6448439, -0.8218477, 0, 0, 0, 1, 1,
-0.6061361, 0.2558534, -1.783476, 0, 0, 0, 1, 1,
-0.6009321, 0.8408294, 0.9492477, 0, 0, 0, 1, 1,
-0.5998219, -0.6989409, -2.509834, 0, 0, 0, 1, 1,
-0.5915531, -1.275, -3.478938, 0, 0, 0, 1, 1,
-0.5880899, -1.698302, -2.972096, 1, 1, 1, 1, 1,
-0.5856888, -0.5270081, -1.922048, 1, 1, 1, 1, 1,
-0.5840487, 1.020416, -0.9212978, 1, 1, 1, 1, 1,
-0.5839679, -1.018837, -1.757987, 1, 1, 1, 1, 1,
-0.5796979, 1.429836, 0.221244, 1, 1, 1, 1, 1,
-0.5745051, -0.2043964, -2.416363, 1, 1, 1, 1, 1,
-0.5741911, -0.3779273, -1.827915, 1, 1, 1, 1, 1,
-0.562902, 0.6700814, -1.313314, 1, 1, 1, 1, 1,
-0.5596583, 0.6522804, -1.917405, 1, 1, 1, 1, 1,
-0.5591121, 0.4606264, -2.134058, 1, 1, 1, 1, 1,
-0.5587172, 0.0243073, -0.755372, 1, 1, 1, 1, 1,
-0.5561736, 0.2481603, -1.495454, 1, 1, 1, 1, 1,
-0.5539874, -0.9085652, -1.953222, 1, 1, 1, 1, 1,
-0.5539727, 0.4907482, -1.717449, 1, 1, 1, 1, 1,
-0.5536425, 0.3647206, -1.058661, 1, 1, 1, 1, 1,
-0.5524971, 0.5548669, -0.6345425, 0, 0, 1, 1, 1,
-0.5517297, -1.477118, -4.766706, 1, 0, 0, 1, 1,
-0.5482333, 0.5943167, -0.4308937, 1, 0, 0, 1, 1,
-0.5318407, 0.5295874, -0.3287432, 1, 0, 0, 1, 1,
-0.5306351, -2.321218, -2.738708, 1, 0, 0, 1, 1,
-0.5249069, 0.1629611, -1.204516, 1, 0, 0, 1, 1,
-0.5237456, -0.8225471, -2.382057, 0, 0, 0, 1, 1,
-0.5237122, -0.9770751, -3.072521, 0, 0, 0, 1, 1,
-0.5227202, -0.2640097, -3.928683, 0, 0, 0, 1, 1,
-0.5222204, -0.4060791, -2.759783, 0, 0, 0, 1, 1,
-0.5181936, 0.1983846, 1.171552, 0, 0, 0, 1, 1,
-0.5153275, -0.7462255, -1.785233, 0, 0, 0, 1, 1,
-0.5112424, -1.855464, -2.062618, 0, 0, 0, 1, 1,
-0.5089003, 0.2539714, -0.9937712, 1, 1, 1, 1, 1,
-0.5083957, 0.4006196, -2.441655, 1, 1, 1, 1, 1,
-0.5060753, 3.187567, 0.9826565, 1, 1, 1, 1, 1,
-0.4954301, 0.105216, -1.715409, 1, 1, 1, 1, 1,
-0.4950281, -1.137859, -0.946009, 1, 1, 1, 1, 1,
-0.4899202, 0.5028558, -0.3617067, 1, 1, 1, 1, 1,
-0.4895406, 1.544591, -0.636566, 1, 1, 1, 1, 1,
-0.4882984, 0.6031514, -0.5332409, 1, 1, 1, 1, 1,
-0.4779909, 0.6270367, -0.08362362, 1, 1, 1, 1, 1,
-0.4776415, -0.7260039, -2.020429, 1, 1, 1, 1, 1,
-0.4774876, -0.4968392, -3.947647, 1, 1, 1, 1, 1,
-0.4766531, -0.05137821, -2.189673, 1, 1, 1, 1, 1,
-0.4759133, -1.686569, -2.640098, 1, 1, 1, 1, 1,
-0.4756209, -0.4847946, -3.314378, 1, 1, 1, 1, 1,
-0.4719916, -1.400899, -3.008245, 1, 1, 1, 1, 1,
-0.4637743, 0.9419824, -0.09190316, 0, 0, 1, 1, 1,
-0.4622951, -0.1888785, -1.709366, 1, 0, 0, 1, 1,
-0.4614424, -0.6594615, -1.561376, 1, 0, 0, 1, 1,
-0.4613766, -0.3402206, -2.384851, 1, 0, 0, 1, 1,
-0.4607966, 0.01348349, -1.69706, 1, 0, 0, 1, 1,
-0.4572177, -1.22407, -1.687533, 1, 0, 0, 1, 1,
-0.4545115, 0.454191, -2.643203, 0, 0, 0, 1, 1,
-0.4540986, -0.8785773, -1.927534, 0, 0, 0, 1, 1,
-0.4477166, 1.296987, 0.8907175, 0, 0, 0, 1, 1,
-0.4471906, -1.089149, -3.088021, 0, 0, 0, 1, 1,
-0.4457784, -1.265906, -2.804005, 0, 0, 0, 1, 1,
-0.4401653, -0.08856697, -2.579967, 0, 0, 0, 1, 1,
-0.4392863, 1.731515, -1.739639, 0, 0, 0, 1, 1,
-0.4390796, 0.533214, -1.48983, 1, 1, 1, 1, 1,
-0.4377764, -1.011287, -3.955388, 1, 1, 1, 1, 1,
-0.4363516, -1.259588, -4.101756, 1, 1, 1, 1, 1,
-0.4315591, -0.7775226, -0.8252912, 1, 1, 1, 1, 1,
-0.4262141, 0.02367144, -0.3574368, 1, 1, 1, 1, 1,
-0.4256791, -1.823512, -1.697766, 1, 1, 1, 1, 1,
-0.4244085, -0.5000694, -2.105277, 1, 1, 1, 1, 1,
-0.4230592, 0.1455045, -0.7920131, 1, 1, 1, 1, 1,
-0.4209701, 0.3843752, -0.7641923, 1, 1, 1, 1, 1,
-0.4130754, -0.4116851, -3.480609, 1, 1, 1, 1, 1,
-0.4130283, 0.3074157, -0.1961059, 1, 1, 1, 1, 1,
-0.412283, -0.4952384, -2.15161, 1, 1, 1, 1, 1,
-0.4105436, -1.70724, -2.658962, 1, 1, 1, 1, 1,
-0.4094966, -0.6664298, -2.836794, 1, 1, 1, 1, 1,
-0.4077736, -0.9602917, -2.182737, 1, 1, 1, 1, 1,
-0.4034313, 0.09461363, -1.400051, 0, 0, 1, 1, 1,
-0.4012941, 0.3684327, 0.3189341, 1, 0, 0, 1, 1,
-0.3986997, 0.9584373, -2.303905, 1, 0, 0, 1, 1,
-0.3966652, -0.2060936, -2.117345, 1, 0, 0, 1, 1,
-0.3960711, 0.3804029, 0.1071442, 1, 0, 0, 1, 1,
-0.3952844, -0.3965764, -3.729202, 1, 0, 0, 1, 1,
-0.3943328, 0.06801499, -0.7317683, 0, 0, 0, 1, 1,
-0.3924925, 0.9451711, -0.4716273, 0, 0, 0, 1, 1,
-0.3891897, -0.9876977, -1.113086, 0, 0, 0, 1, 1,
-0.3887345, 0.09907696, -1.737944, 0, 0, 0, 1, 1,
-0.3848393, 2.022715, -2.441383, 0, 0, 0, 1, 1,
-0.3831502, 2.094406, -1.35901, 0, 0, 0, 1, 1,
-0.3809246, 0.00579969, -0.1303609, 0, 0, 0, 1, 1,
-0.3785093, -0.4138046, -1.343969, 1, 1, 1, 1, 1,
-0.3784254, -0.1376155, -0.2801746, 1, 1, 1, 1, 1,
-0.3744965, 1.158693, 1.439006, 1, 1, 1, 1, 1,
-0.3672647, -1.402768, 0.5719535, 1, 1, 1, 1, 1,
-0.3638428, -1.226554, -2.264678, 1, 1, 1, 1, 1,
-0.3631429, 0.6165758, 0.07680037, 1, 1, 1, 1, 1,
-0.3628972, -0.06327458, -1.510318, 1, 1, 1, 1, 1,
-0.3556334, -0.08286894, -0.7084328, 1, 1, 1, 1, 1,
-0.3513229, -0.4150159, -3.231532, 1, 1, 1, 1, 1,
-0.3505881, -0.267668, -0.6582206, 1, 1, 1, 1, 1,
-0.3475071, -0.4502661, -3.514936, 1, 1, 1, 1, 1,
-0.3471785, -0.9607722, -3.224889, 1, 1, 1, 1, 1,
-0.3419133, -0.5639074, -2.688054, 1, 1, 1, 1, 1,
-0.3411114, 1.348074, 0.3384089, 1, 1, 1, 1, 1,
-0.3404035, 1.36061, -1.343462, 1, 1, 1, 1, 1,
-0.3366024, -0.02713551, -2.550611, 0, 0, 1, 1, 1,
-0.332284, -1.998353, -3.198231, 1, 0, 0, 1, 1,
-0.3319455, 1.083354, -1.110293, 1, 0, 0, 1, 1,
-0.3287865, -1.184179, -2.074666, 1, 0, 0, 1, 1,
-0.3285717, 0.9371604, -0.2565462, 1, 0, 0, 1, 1,
-0.3275823, -0.2879589, -1.982546, 1, 0, 0, 1, 1,
-0.3251021, -0.5494748, -3.086379, 0, 0, 0, 1, 1,
-0.3198186, 0.2150363, -0.4191658, 0, 0, 0, 1, 1,
-0.3191108, -0.4548091, -3.660803, 0, 0, 0, 1, 1,
-0.3174564, 0.2109446, -2.021821, 0, 0, 0, 1, 1,
-0.3170527, 0.6614863, -1.318738, 0, 0, 0, 1, 1,
-0.3139474, 0.02013546, 0.1065282, 0, 0, 0, 1, 1,
-0.3134824, 0.1688546, -1.641646, 0, 0, 0, 1, 1,
-0.3127699, -0.2556101, -0.9071221, 1, 1, 1, 1, 1,
-0.3097357, 0.4447236, 0.3948003, 1, 1, 1, 1, 1,
-0.3071799, -0.04243192, -2.341303, 1, 1, 1, 1, 1,
-0.3057863, 0.4950353, 0.3386205, 1, 1, 1, 1, 1,
-0.3036459, -1.778146, -1.676574, 1, 1, 1, 1, 1,
-0.3017128, 1.642969, -0.1598269, 1, 1, 1, 1, 1,
-0.30082, 1.311381, -0.06855363, 1, 1, 1, 1, 1,
-0.2941752, -0.2867886, -1.607509, 1, 1, 1, 1, 1,
-0.2915297, 0.04580646, -1.379673, 1, 1, 1, 1, 1,
-0.2892149, 0.8701027, -0.5522527, 1, 1, 1, 1, 1,
-0.283064, 0.1601952, -1.658976, 1, 1, 1, 1, 1,
-0.2823005, 0.581987, -0.2804767, 1, 1, 1, 1, 1,
-0.2780136, -1.306649, -3.174115, 1, 1, 1, 1, 1,
-0.2763173, -0.3412401, -0.8818781, 1, 1, 1, 1, 1,
-0.2714103, 0.6843505, 1.006582, 1, 1, 1, 1, 1,
-0.270669, -0.8332574, -2.158066, 0, 0, 1, 1, 1,
-0.2704298, 1.562874, 1.771798, 1, 0, 0, 1, 1,
-0.2667207, 0.6504362, 0.9892667, 1, 0, 0, 1, 1,
-0.2660834, 1.813426, -1.202925, 1, 0, 0, 1, 1,
-0.2654336, 1.423063, 0.8564756, 1, 0, 0, 1, 1,
-0.2636448, 0.3729153, -0.8117606, 1, 0, 0, 1, 1,
-0.2635529, 0.1973706, 0.08256, 0, 0, 0, 1, 1,
-0.2598999, 1.456738, 0.001092093, 0, 0, 0, 1, 1,
-0.2596109, 0.6502713, 0.6206943, 0, 0, 0, 1, 1,
-0.2591494, -1.044164, -2.163644, 0, 0, 0, 1, 1,
-0.2589346, 0.7115769, 0.7679605, 0, 0, 0, 1, 1,
-0.2562855, 0.9665343, 0.6960441, 0, 0, 0, 1, 1,
-0.2557881, 1.824019, -1.119812, 0, 0, 0, 1, 1,
-0.2544084, 0.5518442, -2.278541, 1, 1, 1, 1, 1,
-0.2468404, 0.2911042, -1.745727, 1, 1, 1, 1, 1,
-0.2459923, -0.1204566, -0.2724477, 1, 1, 1, 1, 1,
-0.2450184, -0.2344188, -2.062557, 1, 1, 1, 1, 1,
-0.2412043, 0.5251117, -0.3020208, 1, 1, 1, 1, 1,
-0.2339125, -0.8582057, -2.561592, 1, 1, 1, 1, 1,
-0.2325711, -0.737187, -4.014532, 1, 1, 1, 1, 1,
-0.2319591, 0.201032, -1.261553, 1, 1, 1, 1, 1,
-0.2317862, 0.5586818, 1.410276, 1, 1, 1, 1, 1,
-0.2293397, -1.016394, -2.663694, 1, 1, 1, 1, 1,
-0.2219034, 1.332871, 1.26809, 1, 1, 1, 1, 1,
-0.2212363, 0.1057116, -1.352747, 1, 1, 1, 1, 1,
-0.2166179, 1.06857, -0.3208852, 1, 1, 1, 1, 1,
-0.2076244, 0.6415956, -1.628813, 1, 1, 1, 1, 1,
-0.2072941, 0.5670149, -0.9991576, 1, 1, 1, 1, 1,
-0.2072539, -0.09693536, -3.223747, 0, 0, 1, 1, 1,
-0.2053494, -0.6817632, -4.093898, 1, 0, 0, 1, 1,
-0.2015217, -0.3738119, -2.956251, 1, 0, 0, 1, 1,
-0.2013832, 1.795301, 3.029807, 1, 0, 0, 1, 1,
-0.2013473, -0.3377549, -1.005099, 1, 0, 0, 1, 1,
-0.1993321, 0.9338078, 0.988749, 1, 0, 0, 1, 1,
-0.1990663, 1.129449, -1.224387, 0, 0, 0, 1, 1,
-0.1987892, 0.2307466, -1.724082, 0, 0, 0, 1, 1,
-0.1947265, -0.8458871, -4.339278, 0, 0, 0, 1, 1,
-0.1941542, -0.8776789, -2.970952, 0, 0, 0, 1, 1,
-0.1930448, 0.2010599, -0.7685186, 0, 0, 0, 1, 1,
-0.1890311, 0.3599532, -0.3911147, 0, 0, 0, 1, 1,
-0.1869211, 0.3303123, -0.1308626, 0, 0, 0, 1, 1,
-0.185929, 0.5792266, 1.711181, 1, 1, 1, 1, 1,
-0.1810317, -1.329376, -2.408633, 1, 1, 1, 1, 1,
-0.1775519, -1.324091, -2.34069, 1, 1, 1, 1, 1,
-0.1743401, 0.6723018, -0.8226398, 1, 1, 1, 1, 1,
-0.1609426, 0.5409608, -0.4995747, 1, 1, 1, 1, 1,
-0.1603435, 0.2485047, -1.14079, 1, 1, 1, 1, 1,
-0.1592945, 1.404602, 0.4068769, 1, 1, 1, 1, 1,
-0.1567917, 0.8653944, -1.11369, 1, 1, 1, 1, 1,
-0.1563954, 1.284686, 0.1400773, 1, 1, 1, 1, 1,
-0.1549068, -0.3348733, -4.105943, 1, 1, 1, 1, 1,
-0.1547669, 0.1769242, -0.731335, 1, 1, 1, 1, 1,
-0.1510083, 0.3429902, 0.409375, 1, 1, 1, 1, 1,
-0.1505978, -1.259926, -3.552912, 1, 1, 1, 1, 1,
-0.147566, 1.478321, -0.3224816, 1, 1, 1, 1, 1,
-0.1465651, 0.2944064, 0.1398676, 1, 1, 1, 1, 1,
-0.1437095, -1.729848, -3.303708, 0, 0, 1, 1, 1,
-0.1431262, 1.427935, 0.970718, 1, 0, 0, 1, 1,
-0.1419442, 0.2410633, -0.5317096, 1, 0, 0, 1, 1,
-0.1418116, -1.056334, -4.209595, 1, 0, 0, 1, 1,
-0.1415273, 0.5924208, -0.346066, 1, 0, 0, 1, 1,
-0.1405541, -1.14094, -3.894357, 1, 0, 0, 1, 1,
-0.1390284, 0.2622074, -0.5586738, 0, 0, 0, 1, 1,
-0.1375407, -0.8947716, -4.101164, 0, 0, 0, 1, 1,
-0.1339871, -0.3162824, -1.150289, 0, 0, 0, 1, 1,
-0.1336674, -0.8207825, -2.67701, 0, 0, 0, 1, 1,
-0.1272573, 1.635916, 0.03461767, 0, 0, 0, 1, 1,
-0.1267651, -0.4430955, -2.573286, 0, 0, 0, 1, 1,
-0.1246246, 1.350118, 1.993388, 0, 0, 0, 1, 1,
-0.1229916, 0.8847594, -0.9722294, 1, 1, 1, 1, 1,
-0.1199066, -0.8872918, -4.106315, 1, 1, 1, 1, 1,
-0.1179404, 0.3959317, 0.6436533, 1, 1, 1, 1, 1,
-0.1170558, -0.6554065, -3.516294, 1, 1, 1, 1, 1,
-0.1166391, -0.2071661, -2.97002, 1, 1, 1, 1, 1,
-0.1149815, 1.168135, -0.4928707, 1, 1, 1, 1, 1,
-0.1149416, 0.6324588, 0.4309583, 1, 1, 1, 1, 1,
-0.1112414, -0.3915614, -1.281698, 1, 1, 1, 1, 1,
-0.1102466, 0.8211761, -1.739101, 1, 1, 1, 1, 1,
-0.1087631, -1.729552, -1.944706, 1, 1, 1, 1, 1,
-0.1084801, -0.6357682, -4.761645, 1, 1, 1, 1, 1,
-0.1070658, 0.5934722, -2.069562, 1, 1, 1, 1, 1,
-0.1039945, -0.212597, -3.612271, 1, 1, 1, 1, 1,
-0.09867959, 0.3974623, 0.5861885, 1, 1, 1, 1, 1,
-0.09425008, -0.5880209, -3.102895, 1, 1, 1, 1, 1,
-0.09391218, -0.09181555, -2.91997, 0, 0, 1, 1, 1,
-0.09269102, -1.039076, -2.73117, 1, 0, 0, 1, 1,
-0.0904468, -1.71694, -3.605645, 1, 0, 0, 1, 1,
-0.08970684, 1.424948, 0.2828909, 1, 0, 0, 1, 1,
-0.08812799, 0.8304923, -0.8359969, 1, 0, 0, 1, 1,
-0.08624762, 0.509913, 0.8117388, 1, 0, 0, 1, 1,
-0.08386623, 0.1183341, 0.8175461, 0, 0, 0, 1, 1,
-0.08015223, -1.183907, -3.468763, 0, 0, 0, 1, 1,
-0.0786978, 0.538122, -0.6258121, 0, 0, 0, 1, 1,
-0.0667763, 0.8209996, -1.619403, 0, 0, 0, 1, 1,
-0.06285764, -0.4448268, -2.725912, 0, 0, 0, 1, 1,
-0.06253645, -0.7118307, -1.770885, 0, 0, 0, 1, 1,
-0.05574187, -1.879199, -3.354569, 0, 0, 0, 1, 1,
-0.0523088, 1.572006, 0.7865577, 1, 1, 1, 1, 1,
-0.05112184, 0.7162736, -1.293531, 1, 1, 1, 1, 1,
-0.04778419, -1.322862, -3.616143, 1, 1, 1, 1, 1,
-0.04616166, -1.094868, -3.463159, 1, 1, 1, 1, 1,
-0.03776042, -1.043542, -4.083576, 1, 1, 1, 1, 1,
-0.03425856, -2.118018, -3.041794, 1, 1, 1, 1, 1,
-0.03410144, 0.7230392, 0.853071, 1, 1, 1, 1, 1,
-0.0277944, 0.779719, 0.5593009, 1, 1, 1, 1, 1,
-0.02762932, 0.2467505, 1.495022, 1, 1, 1, 1, 1,
-0.0251508, -1.249052, -4.137598, 1, 1, 1, 1, 1,
-0.02054997, -0.6651167, -3.923454, 1, 1, 1, 1, 1,
-0.018663, 0.2218657, -0.5498064, 1, 1, 1, 1, 1,
-0.01856651, -0.8370579, -3.593842, 1, 1, 1, 1, 1,
-0.0180936, -0.3163658, -2.842727, 1, 1, 1, 1, 1,
-0.01725783, 1.081875, -0.7798501, 1, 1, 1, 1, 1,
-0.01454727, -1.163098, -4.15764, 0, 0, 1, 1, 1,
-0.01032504, 1.218035, 2.022406, 1, 0, 0, 1, 1,
-0.009238123, -0.3934842, -1.908626, 1, 0, 0, 1, 1,
-0.008868672, 2.382577, -2.076707, 1, 0, 0, 1, 1,
-0.007947373, -0.5258393, -3.661905, 1, 0, 0, 1, 1,
-0.0041281, -1.149253, -1.378697, 1, 0, 0, 1, 1,
-0.003407539, -0.4131114, -3.706863, 0, 0, 0, 1, 1,
-0.002753683, -0.6088548, -2.723511, 0, 0, 0, 1, 1,
-0.002657105, 0.9827018, -0.7880833, 0, 0, 0, 1, 1,
0.00297542, -1.699779, 2.10572, 0, 0, 0, 1, 1,
0.003365919, -0.5510752, 3.634066, 0, 0, 0, 1, 1,
0.01168284, -2.398674, 2.06279, 0, 0, 0, 1, 1,
0.01537991, -0.07616618, 3.176711, 0, 0, 0, 1, 1,
0.0166502, 0.4987895, -0.679579, 1, 1, 1, 1, 1,
0.01753928, 1.479333, -0.4645873, 1, 1, 1, 1, 1,
0.01864541, -0.4934915, 2.902708, 1, 1, 1, 1, 1,
0.02240241, -1.304942, 1.804483, 1, 1, 1, 1, 1,
0.03054445, -0.1001524, 3.238543, 1, 1, 1, 1, 1,
0.03173238, -0.3690828, 3.351751, 1, 1, 1, 1, 1,
0.03488718, 0.1338626, 1.366992, 1, 1, 1, 1, 1,
0.03864291, 0.8176719, 0.2925549, 1, 1, 1, 1, 1,
0.04047754, -0.1530336, 4.705712, 1, 1, 1, 1, 1,
0.04145686, -0.4132663, 3.553264, 1, 1, 1, 1, 1,
0.04849445, 0.4846616, -1.102937, 1, 1, 1, 1, 1,
0.04874962, -0.1598968, 3.16155, 1, 1, 1, 1, 1,
0.04948337, 1.319985, 0.7296638, 1, 1, 1, 1, 1,
0.05135635, 1.282352, 0.2306929, 1, 1, 1, 1, 1,
0.05174905, -1.925809, 1.5859, 1, 1, 1, 1, 1,
0.05192241, 1.74595, -0.4944337, 0, 0, 1, 1, 1,
0.05280797, -0.284321, 1.647267, 1, 0, 0, 1, 1,
0.05444744, -0.03292478, 1.658901, 1, 0, 0, 1, 1,
0.05837077, 0.619103, 0.7870629, 1, 0, 0, 1, 1,
0.06054329, 0.8971911, -0.3071709, 1, 0, 0, 1, 1,
0.06389969, 1.800112, -0.5546905, 1, 0, 0, 1, 1,
0.06678241, 1.723204, -0.0115059, 0, 0, 0, 1, 1,
0.06729355, -0.6922941, 4.597005, 0, 0, 0, 1, 1,
0.0674888, -0.7870797, 3.862141, 0, 0, 0, 1, 1,
0.06979871, -0.1471033, 2.552005, 0, 0, 0, 1, 1,
0.07455731, 0.9022997, 2.649742, 0, 0, 0, 1, 1,
0.07912716, -0.2570606, 1.269829, 0, 0, 0, 1, 1,
0.0822015, 0.7872244, -1.041518, 0, 0, 0, 1, 1,
0.08341248, -0.8978657, 4.575841, 1, 1, 1, 1, 1,
0.08575701, 0.03354792, 1.665165, 1, 1, 1, 1, 1,
0.08742182, 0.69084, -0.4419513, 1, 1, 1, 1, 1,
0.08762149, 0.6926106, -0.8303353, 1, 1, 1, 1, 1,
0.1024778, -1.049371, 2.530507, 1, 1, 1, 1, 1,
0.1057701, 0.07653036, -0.04146379, 1, 1, 1, 1, 1,
0.1060837, -1.384951, 3.217714, 1, 1, 1, 1, 1,
0.1096003, 0.4217665, -0.5162641, 1, 1, 1, 1, 1,
0.1098361, 0.05870936, 0.7439032, 1, 1, 1, 1, 1,
0.1174278, 1.596176, -0.2760753, 1, 1, 1, 1, 1,
0.117729, 1.231841, 0.3652086, 1, 1, 1, 1, 1,
0.1198102, 1.162762, -1.975071, 1, 1, 1, 1, 1,
0.1216292, 2.221608, -0.6570919, 1, 1, 1, 1, 1,
0.1220849, -1.325768, 1.713644, 1, 1, 1, 1, 1,
0.1222113, 1.208886, -1.929951, 1, 1, 1, 1, 1,
0.1253135, -0.2052407, 0.9372442, 0, 0, 1, 1, 1,
0.1402155, -0.1017582, 1.679852, 1, 0, 0, 1, 1,
0.1427867, -2.618958, 2.459585, 1, 0, 0, 1, 1,
0.1480273, -0.113457, 0.568372, 1, 0, 0, 1, 1,
0.1537739, 0.4890511, -1.192532, 1, 0, 0, 1, 1,
0.1553274, 0.2706577, 0.7474383, 1, 0, 0, 1, 1,
0.1570469, -1.402022, 3.106627, 0, 0, 0, 1, 1,
0.1570758, -0.8862539, 1.599379, 0, 0, 0, 1, 1,
0.1615451, 0.2959362, 1.043494, 0, 0, 0, 1, 1,
0.1657274, 0.8223326, -1.463932, 0, 0, 0, 1, 1,
0.1670123, -1.215133, 2.82141, 0, 0, 0, 1, 1,
0.1677714, 0.5368627, 1.070511, 0, 0, 0, 1, 1,
0.1695633, -0.3535492, 2.791342, 0, 0, 0, 1, 1,
0.1709976, -0.9704157, 2.923663, 1, 1, 1, 1, 1,
0.1711544, 0.6429674, 0.8204359, 1, 1, 1, 1, 1,
0.1714845, 0.8636428, 0.2208988, 1, 1, 1, 1, 1,
0.1735883, -0.463941, 2.18274, 1, 1, 1, 1, 1,
0.1741639, -1.41273, 3.029374, 1, 1, 1, 1, 1,
0.1765817, 0.1060363, 0.4115579, 1, 1, 1, 1, 1,
0.1774926, -0.3765936, 3.046085, 1, 1, 1, 1, 1,
0.1830214, 0.3748625, -0.6621073, 1, 1, 1, 1, 1,
0.1842417, 0.341172, 0.9474503, 1, 1, 1, 1, 1,
0.1884269, -0.6205031, 3.01932, 1, 1, 1, 1, 1,
0.1941871, 1.555314, 1.393386, 1, 1, 1, 1, 1,
0.2026342, 0.3949226, 1.809605, 1, 1, 1, 1, 1,
0.2069584, -1.546108, 3.581647, 1, 1, 1, 1, 1,
0.2074299, 0.9871687, 1.285471, 1, 1, 1, 1, 1,
0.2090442, 0.2903219, -0.7045979, 1, 1, 1, 1, 1,
0.2095047, -0.5827281, 2.811938, 0, 0, 1, 1, 1,
0.2101961, -1.338203, 1.520351, 1, 0, 0, 1, 1,
0.2153438, 0.3056641, 0.3981113, 1, 0, 0, 1, 1,
0.2155445, -1.697983, 4.055283, 1, 0, 0, 1, 1,
0.2166042, 0.289739, 0.424863, 1, 0, 0, 1, 1,
0.2182038, -0.637097, 2.001895, 1, 0, 0, 1, 1,
0.2233114, -1.867836, 3.331563, 0, 0, 0, 1, 1,
0.224177, 0.736178, -0.4099379, 0, 0, 0, 1, 1,
0.2311251, 0.8498513, 0.7491544, 0, 0, 0, 1, 1,
0.234009, 0.9543661, -0.4719163, 0, 0, 0, 1, 1,
0.2349605, 0.5403309, 1.383818, 0, 0, 0, 1, 1,
0.2370178, 0.7899787, 1.058966, 0, 0, 0, 1, 1,
0.2395681, 0.4737563, 2.320484, 0, 0, 0, 1, 1,
0.2417771, 0.8440204, -0.2896049, 1, 1, 1, 1, 1,
0.2418855, 1.629263, -0.1928696, 1, 1, 1, 1, 1,
0.2459368, 0.1315461, -0.07966615, 1, 1, 1, 1, 1,
0.2505602, 0.4481319, -1.581839, 1, 1, 1, 1, 1,
0.2516232, 0.6172757, 1.115625, 1, 1, 1, 1, 1,
0.2527827, 2.157707, 0.0892396, 1, 1, 1, 1, 1,
0.2536652, 0.7257026, 0.8370771, 1, 1, 1, 1, 1,
0.2540165, 0.7833796, 1.208519, 1, 1, 1, 1, 1,
0.254117, 0.5480857, -1.614294, 1, 1, 1, 1, 1,
0.257103, -0.9204117, 2.630139, 1, 1, 1, 1, 1,
0.2579095, -1.584022, 5.527145, 1, 1, 1, 1, 1,
0.2584124, -0.1251907, 2.087287, 1, 1, 1, 1, 1,
0.2617392, 0.5413607, -0.7972074, 1, 1, 1, 1, 1,
0.2641524, -0.1651215, 1.113881, 1, 1, 1, 1, 1,
0.268609, -2.788157, 4.220963, 1, 1, 1, 1, 1,
0.2713903, 1.414879, 0.5670766, 0, 0, 1, 1, 1,
0.2722536, 0.2801865, 0.7123452, 1, 0, 0, 1, 1,
0.2727149, 0.3292763, 0.6479533, 1, 0, 0, 1, 1,
0.2775338, -0.04065093, 2.996199, 1, 0, 0, 1, 1,
0.278681, 0.2182322, -0.2225743, 1, 0, 0, 1, 1,
0.2789475, 0.6843954, 0.01882775, 1, 0, 0, 1, 1,
0.2805796, -1.678785, 2.479763, 0, 0, 0, 1, 1,
0.2840795, 1.258295, -0.5889717, 0, 0, 0, 1, 1,
0.2893025, 0.06366333, 2.814038, 0, 0, 0, 1, 1,
0.2910616, 0.9553554, 1.665719, 0, 0, 0, 1, 1,
0.2922322, 0.6545498, 0.7369241, 0, 0, 0, 1, 1,
0.2970383, 0.3444701, 0.4916237, 0, 0, 0, 1, 1,
0.2995857, 1.158958, 0.3675501, 0, 0, 0, 1, 1,
0.3020995, -1.955672, 4.796199, 1, 1, 1, 1, 1,
0.3038685, -1.176783, 4.567346, 1, 1, 1, 1, 1,
0.3068308, -0.4412183, 1.768003, 1, 1, 1, 1, 1,
0.307196, -0.5377365, 3.381398, 1, 1, 1, 1, 1,
0.3076138, -1.528328, 1.39792, 1, 1, 1, 1, 1,
0.3088798, -0.9202179, 3.986635, 1, 1, 1, 1, 1,
0.3126145, 1.169202, 0.7595723, 1, 1, 1, 1, 1,
0.3127035, -0.5771834, 3.067175, 1, 1, 1, 1, 1,
0.3155262, 0.4240643, 1.773955, 1, 1, 1, 1, 1,
0.3170328, 1.471311, 1.28582, 1, 1, 1, 1, 1,
0.3191608, 0.8588278, 0.3470055, 1, 1, 1, 1, 1,
0.3216017, 0.1323702, 0.3493674, 1, 1, 1, 1, 1,
0.3241358, -0.1727266, 2.328905, 1, 1, 1, 1, 1,
0.3327705, 0.02210385, 2.738508, 1, 1, 1, 1, 1,
0.3378005, 1.704307, 1.03805, 1, 1, 1, 1, 1,
0.3390428, -1.021621, 2.110628, 0, 0, 1, 1, 1,
0.340625, -0.4598202, 3.587709, 1, 0, 0, 1, 1,
0.3430117, -1.349301, 3.000057, 1, 0, 0, 1, 1,
0.3444238, -0.4853133, 1.347722, 1, 0, 0, 1, 1,
0.3489951, -0.08784095, 1.818631, 1, 0, 0, 1, 1,
0.3543574, -1.359427, 3.053398, 1, 0, 0, 1, 1,
0.3552889, 2.127334, -0.5198935, 0, 0, 0, 1, 1,
0.3562398, -0.7483089, 1.37647, 0, 0, 0, 1, 1,
0.3566941, -0.2176809, 0.5471444, 0, 0, 0, 1, 1,
0.3568114, 0.5457331, 2.104319, 0, 0, 0, 1, 1,
0.3568249, -0.9237795, 3.220402, 0, 0, 0, 1, 1,
0.357309, -0.6841974, 3.265936, 0, 0, 0, 1, 1,
0.3580551, -0.1385683, 2.297452, 0, 0, 0, 1, 1,
0.3615989, 0.3526461, 0.910892, 1, 1, 1, 1, 1,
0.3628473, -1.42304, 5.094364, 1, 1, 1, 1, 1,
0.3675604, -0.3600487, 2.473162, 1, 1, 1, 1, 1,
0.3678919, 0.8176774, 1.584683, 1, 1, 1, 1, 1,
0.3687539, -0.631867, 4.055578, 1, 1, 1, 1, 1,
0.3750146, -0.5566283, 4.0323, 1, 1, 1, 1, 1,
0.3775605, 1.340191, 0.1545717, 1, 1, 1, 1, 1,
0.3784138, -0.194795, 2.387638, 1, 1, 1, 1, 1,
0.3824609, 0.5212458, 1.897313, 1, 1, 1, 1, 1,
0.3901142, -1.069384, 1.011348, 1, 1, 1, 1, 1,
0.4071209, -1.403843, 0.1372688, 1, 1, 1, 1, 1,
0.4088487, 0.6176854, 0.8012276, 1, 1, 1, 1, 1,
0.4165447, -1.812555, 4.431144, 1, 1, 1, 1, 1,
0.417845, 3.385201, 0.9065018, 1, 1, 1, 1, 1,
0.4215063, -0.8922906, 1.105971, 1, 1, 1, 1, 1,
0.426728, -0.005969356, 2.265704, 0, 0, 1, 1, 1,
0.4280926, 1.658026, -0.05718132, 1, 0, 0, 1, 1,
0.428914, -1.607198, 3.748698, 1, 0, 0, 1, 1,
0.4373409, 0.2446337, 0.113744, 1, 0, 0, 1, 1,
0.4399799, 1.16785, 0.590548, 1, 0, 0, 1, 1,
0.447688, 2.913135, -0.6756117, 1, 0, 0, 1, 1,
0.4483443, -0.181089, 0.8340961, 0, 0, 0, 1, 1,
0.4523577, -1.045386, 4.465196, 0, 0, 0, 1, 1,
0.4532347, 1.28988, -0.02667078, 0, 0, 0, 1, 1,
0.4535594, 1.380675, -0.04454387, 0, 0, 0, 1, 1,
0.4578562, -0.6551471, 1.30473, 0, 0, 0, 1, 1,
0.4580289, 0.5231204, 0.6833511, 0, 0, 0, 1, 1,
0.4600728, -1.164333, 2.825557, 0, 0, 0, 1, 1,
0.4625163, 0.8731577, 1.727741, 1, 1, 1, 1, 1,
0.4632385, -1.33169, 2.394989, 1, 1, 1, 1, 1,
0.4653155, 0.7139568, 1.441476, 1, 1, 1, 1, 1,
0.466104, -0.1080883, 0.3767387, 1, 1, 1, 1, 1,
0.4703605, -0.7674211, 3.069009, 1, 1, 1, 1, 1,
0.4718973, -0.6197249, 3.23728, 1, 1, 1, 1, 1,
0.4724209, -1.074038, 2.029047, 1, 1, 1, 1, 1,
0.4790714, -0.647374, 3.553623, 1, 1, 1, 1, 1,
0.4816128, -0.7390263, 2.698049, 1, 1, 1, 1, 1,
0.4817488, -1.03717, 2.61212, 1, 1, 1, 1, 1,
0.4866135, 0.3050316, 2.716105, 1, 1, 1, 1, 1,
0.4911673, 0.08828981, 0.6730614, 1, 1, 1, 1, 1,
0.493554, -0.1535748, 3.556248, 1, 1, 1, 1, 1,
0.4943289, 0.4874178, 0.3934441, 1, 1, 1, 1, 1,
0.5059144, 0.999501, 1.239543, 1, 1, 1, 1, 1,
0.5071674, 0.3453207, 0.5878704, 0, 0, 1, 1, 1,
0.5085353, -0.6994045, 4.135837, 1, 0, 0, 1, 1,
0.5188292, -2.273891, 5.44843, 1, 0, 0, 1, 1,
0.52852, -1.00824, 5.38895, 1, 0, 0, 1, 1,
0.5335544, -0.6809616, 1.656614, 1, 0, 0, 1, 1,
0.5341972, -1.587903, 1.539058, 1, 0, 0, 1, 1,
0.5396944, 0.6986746, 0.4102266, 0, 0, 0, 1, 1,
0.5422728, 0.2313062, 0.6223749, 0, 0, 0, 1, 1,
0.5497864, -3.069793, 5.278783, 0, 0, 0, 1, 1,
0.5512839, 0.9550932, 1.050655, 0, 0, 0, 1, 1,
0.55142, 0.1007749, 0.796975, 0, 0, 0, 1, 1,
0.5553498, 0.9032621, 1.300511, 0, 0, 0, 1, 1,
0.5598627, -0.7653768, 1.435478, 0, 0, 0, 1, 1,
0.5616512, 2.064849, -1.069451, 1, 1, 1, 1, 1,
0.5636529, 1.557876, 0.3913547, 1, 1, 1, 1, 1,
0.5642732, 1.818923, -0.275937, 1, 1, 1, 1, 1,
0.5668951, 2.925775, -0.5786563, 1, 1, 1, 1, 1,
0.5698217, 1.240121, 1.737985, 1, 1, 1, 1, 1,
0.5714861, -1.535966, 2.753233, 1, 1, 1, 1, 1,
0.5736319, 0.3261537, 0.8525757, 1, 1, 1, 1, 1,
0.575409, -0.5022885, 3.546346, 1, 1, 1, 1, 1,
0.5885471, -0.8948892, 2.728466, 1, 1, 1, 1, 1,
0.5995384, 0.3462269, 0.2766405, 1, 1, 1, 1, 1,
0.6106349, -1.530314, 3.841805, 1, 1, 1, 1, 1,
0.6167979, 0.5748447, -0.5292302, 1, 1, 1, 1, 1,
0.6202928, -0.3166343, 2.134768, 1, 1, 1, 1, 1,
0.6309287, -1.125437, 1.549816, 1, 1, 1, 1, 1,
0.6420164, 1.60142, 0.6098783, 1, 1, 1, 1, 1,
0.6435011, 1.620024, 0.5445909, 0, 0, 1, 1, 1,
0.6502281, -1.013361, 3.258095, 1, 0, 0, 1, 1,
0.6516633, -2.007729, 3.114318, 1, 0, 0, 1, 1,
0.6553784, -0.1369028, 3.042767, 1, 0, 0, 1, 1,
0.6556192, -0.9744431, 4.109437, 1, 0, 0, 1, 1,
0.6599346, -0.5561437, 1.820548, 1, 0, 0, 1, 1,
0.6632441, 0.1955906, -0.8096873, 0, 0, 0, 1, 1,
0.6682346, 0.7792272, 1.615996, 0, 0, 0, 1, 1,
0.6744775, 0.4992303, -0.6570449, 0, 0, 0, 1, 1,
0.6747205, 0.9404858, 0.9356129, 0, 0, 0, 1, 1,
0.6770824, -0.4324995, 0.1178943, 0, 0, 0, 1, 1,
0.6783908, -1.459493, 1.850845, 0, 0, 0, 1, 1,
0.6807129, -0.2116715, 3.043204, 0, 0, 0, 1, 1,
0.6835179, -0.9395776, 2.595001, 1, 1, 1, 1, 1,
0.6842088, -1.47811, 1.523847, 1, 1, 1, 1, 1,
0.6854097, 1.039007, 1.874539, 1, 1, 1, 1, 1,
0.6872386, 1.668998, 1.814152, 1, 1, 1, 1, 1,
0.69188, -0.6128437, 2.980628, 1, 1, 1, 1, 1,
0.6931922, -0.2930247, 2.107855, 1, 1, 1, 1, 1,
0.6999857, 1.150783, 1.547566, 1, 1, 1, 1, 1,
0.7003221, 0.2281613, 0.6072536, 1, 1, 1, 1, 1,
0.7004524, -1.564973, 1.823817, 1, 1, 1, 1, 1,
0.7056038, 0.1139752, 0.6669121, 1, 1, 1, 1, 1,
0.706234, 0.8070222, 2.429805, 1, 1, 1, 1, 1,
0.7104203, -1.625563, 2.037325, 1, 1, 1, 1, 1,
0.7111499, 0.06692681, 1.33654, 1, 1, 1, 1, 1,
0.7137483, 1.080969, 0.1164503, 1, 1, 1, 1, 1,
0.7146897, -0.8935947, 4.20032, 1, 1, 1, 1, 1,
0.7181405, 0.5012982, 0.8026493, 0, 0, 1, 1, 1,
0.7181969, -0.2377189, 2.419046, 1, 0, 0, 1, 1,
0.7187411, -0.4064998, 3.508945, 1, 0, 0, 1, 1,
0.7245736, -1.916521, 2.739485, 1, 0, 0, 1, 1,
0.7258418, -0.3428573, 0.9897627, 1, 0, 0, 1, 1,
0.7273481, 0.3468937, 1.004676, 1, 0, 0, 1, 1,
0.7284449, 0.01148957, 0.2887036, 0, 0, 0, 1, 1,
0.7315296, -2.240786, 3.180816, 0, 0, 0, 1, 1,
0.7321569, 0.6692716, 0.4834407, 0, 0, 0, 1, 1,
0.7382274, 0.5206578, 0.4260442, 0, 0, 0, 1, 1,
0.7416555, 0.4908769, 0.6384653, 0, 0, 0, 1, 1,
0.7437301, -0.6586242, 2.189858, 0, 0, 0, 1, 1,
0.7480922, -0.9131689, 3.35042, 0, 0, 0, 1, 1,
0.7664025, -2.025064, 1.566607, 1, 1, 1, 1, 1,
0.7721018, -1.503126, 3.362281, 1, 1, 1, 1, 1,
0.7871104, -1.52505, 3.847383, 1, 1, 1, 1, 1,
0.7894511, 0.2883473, 1.003577, 1, 1, 1, 1, 1,
0.8056154, -0.7644178, 1.571672, 1, 1, 1, 1, 1,
0.8118582, 0.1650147, 2.024876, 1, 1, 1, 1, 1,
0.8158593, 0.3425679, 0.2355023, 1, 1, 1, 1, 1,
0.8200804, -0.4865096, 1.782847, 1, 1, 1, 1, 1,
0.820572, -0.0546516, 2.18226, 1, 1, 1, 1, 1,
0.8218864, -0.6164262, 2.778829, 1, 1, 1, 1, 1,
0.8310028, 0.3242953, 0.5933781, 1, 1, 1, 1, 1,
0.8356996, -2.326167, 2.784775, 1, 1, 1, 1, 1,
0.8362633, 1.013961, 0.8510969, 1, 1, 1, 1, 1,
0.8364547, 0.04510618, 2.248837, 1, 1, 1, 1, 1,
0.838932, 0.4487863, 0.5081517, 1, 1, 1, 1, 1,
0.8410226, 1.394093, 0.9700744, 0, 0, 1, 1, 1,
0.8473341, 0.6435375, -1.778973, 1, 0, 0, 1, 1,
0.8540354, -0.02472555, 0.5256634, 1, 0, 0, 1, 1,
0.8576893, 0.712758, 1.356812, 1, 0, 0, 1, 1,
0.8577876, 0.6489916, 0.2182412, 1, 0, 0, 1, 1,
0.8640884, -0.959372, 2.693148, 1, 0, 0, 1, 1,
0.8644816, -1.888466, 2.686219, 0, 0, 0, 1, 1,
0.8655744, 0.1010646, 1.254817, 0, 0, 0, 1, 1,
0.8686513, 1.39663, 0.405985, 0, 0, 0, 1, 1,
0.8760592, -0.1114107, 1.771042, 0, 0, 0, 1, 1,
0.8766562, -1.077305, 4.785226, 0, 0, 0, 1, 1,
0.8832822, 1.918395, 2.663027, 0, 0, 0, 1, 1,
0.9019286, -0.7346133, 2.026308, 0, 0, 0, 1, 1,
0.9020671, 1.40561, 0.4333218, 1, 1, 1, 1, 1,
0.9101655, 0.118169, 0.948014, 1, 1, 1, 1, 1,
0.9119835, -0.505195, 0.9673438, 1, 1, 1, 1, 1,
0.9154211, -0.4195375, 3.398985, 1, 1, 1, 1, 1,
0.9221154, 0.04105779, 2.132298, 1, 1, 1, 1, 1,
0.9247867, 0.7777168, 0.3152075, 1, 1, 1, 1, 1,
0.9289626, -1.40483, 2.902114, 1, 1, 1, 1, 1,
0.9296498, -0.3011359, 1.388708, 1, 1, 1, 1, 1,
0.9361002, 1.381936, -1.697092, 1, 1, 1, 1, 1,
0.9403202, 1.163448, 0.6473924, 1, 1, 1, 1, 1,
0.9415827, -0.8913047, 0.9601158, 1, 1, 1, 1, 1,
0.9450839, -0.2576085, 1.331724, 1, 1, 1, 1, 1,
0.945334, 0.8697354, -0.6287229, 1, 1, 1, 1, 1,
0.9550358, -0.4647916, 4.56975, 1, 1, 1, 1, 1,
0.9613924, -1.496467, 3.750691, 1, 1, 1, 1, 1,
0.9633585, -0.6973829, 0.7417799, 0, 0, 1, 1, 1,
0.9643626, 1.099768, 0.2733975, 1, 0, 0, 1, 1,
0.9645665, -0.4685443, 2.478175, 1, 0, 0, 1, 1,
0.9665985, 0.3718448, 0.7254056, 1, 0, 0, 1, 1,
0.9669191, -0.6302011, 3.384893, 1, 0, 0, 1, 1,
0.9722133, 1.392421, 1.807276, 1, 0, 0, 1, 1,
0.976055, 1.180902, -1.373269, 0, 0, 0, 1, 1,
0.9859833, 1.669503, 1.212231, 0, 0, 0, 1, 1,
0.991097, 1.130811, -0.4780786, 0, 0, 0, 1, 1,
0.9923772, -3.029224, 4.283746, 0, 0, 0, 1, 1,
0.992528, 1.177957, 1.519904, 0, 0, 0, 1, 1,
1.002554, 0.6461696, 0.4323958, 0, 0, 0, 1, 1,
1.002839, -0.8191168, 1.182362, 0, 0, 0, 1, 1,
1.0038, 0.9040367, 1.800738, 1, 1, 1, 1, 1,
1.004956, 0.1085421, 2.09628, 1, 1, 1, 1, 1,
1.005499, -1.343649, 3.650951, 1, 1, 1, 1, 1,
1.007073, -0.1206855, 1.545788, 1, 1, 1, 1, 1,
1.01358, -1.070788, 2.232038, 1, 1, 1, 1, 1,
1.017702, 0.2180876, 0.1323138, 1, 1, 1, 1, 1,
1.018338, -0.2382722, 1.67101, 1, 1, 1, 1, 1,
1.026695, 1.13068, 1.63333, 1, 1, 1, 1, 1,
1.028434, 1.121293, 0.9114457, 1, 1, 1, 1, 1,
1.032139, -1.252759, 3.659637, 1, 1, 1, 1, 1,
1.034178, 0.6223873, 3.222214, 1, 1, 1, 1, 1,
1.034533, -1.252496, -0.38953, 1, 1, 1, 1, 1,
1.05346, -1.070388, 0.3073884, 1, 1, 1, 1, 1,
1.056742, -0.6058294, 1.595841, 1, 1, 1, 1, 1,
1.060793, 1.400249, 1.461772, 1, 1, 1, 1, 1,
1.062916, -0.1850565, 1.872344, 0, 0, 1, 1, 1,
1.069413, -0.3689596, 3.240641, 1, 0, 0, 1, 1,
1.071002, -0.8526337, 0.8355421, 1, 0, 0, 1, 1,
1.073972, 0.4332796, 1.677722, 1, 0, 0, 1, 1,
1.07754, 0.2105574, -0.5823455, 1, 0, 0, 1, 1,
1.078699, -0.2462817, 0.6698129, 1, 0, 0, 1, 1,
1.084048, -0.1616521, 2.933177, 0, 0, 0, 1, 1,
1.085361, -1.015859, 2.023692, 0, 0, 0, 1, 1,
1.088909, 0.2038661, -0.5666112, 0, 0, 0, 1, 1,
1.091052, -0.6347638, 2.750358, 0, 0, 0, 1, 1,
1.092482, 0.433533, 0.3240459, 0, 0, 0, 1, 1,
1.093427, 0.1840775, 2.690323, 0, 0, 0, 1, 1,
1.103975, -1.987856, 3.548401, 0, 0, 0, 1, 1,
1.104128, -1.992643, 2.246026, 1, 1, 1, 1, 1,
1.11105, -0.5573522, 1.358918, 1, 1, 1, 1, 1,
1.121689, -0.7856071, 3.298887, 1, 1, 1, 1, 1,
1.124095, 0.6964599, 0.6961265, 1, 1, 1, 1, 1,
1.125461, 0.7099456, 1.575835, 1, 1, 1, 1, 1,
1.130579, 1.006644, 0.9844862, 1, 1, 1, 1, 1,
1.130676, 0.9524991, 1.48448, 1, 1, 1, 1, 1,
1.13782, 0.2943491, 1.105305, 1, 1, 1, 1, 1,
1.141654, 0.0368489, 1.999502, 1, 1, 1, 1, 1,
1.149059, -0.7519124, 1.345837, 1, 1, 1, 1, 1,
1.150781, -0.1923588, 2.751225, 1, 1, 1, 1, 1,
1.157202, -0.3024001, 1.493608, 1, 1, 1, 1, 1,
1.162802, 1.345678, 0.9471125, 1, 1, 1, 1, 1,
1.162915, 0.5228949, 1.961079, 1, 1, 1, 1, 1,
1.170379, -2.171412, 0.6996722, 1, 1, 1, 1, 1,
1.197498, -0.1756883, 1.624068, 0, 0, 1, 1, 1,
1.200236, 1.85274, 0.4780705, 1, 0, 0, 1, 1,
1.200551, -0.5835875, 2.864637, 1, 0, 0, 1, 1,
1.218734, -0.7014519, 2.53633, 1, 0, 0, 1, 1,
1.220155, 0.218837, 1.22043, 1, 0, 0, 1, 1,
1.228931, 0.1441534, 1.517352, 1, 0, 0, 1, 1,
1.23103, 1.427615, 0.1511868, 0, 0, 0, 1, 1,
1.23242, -0.3570251, 2.226835, 0, 0, 0, 1, 1,
1.235554, 2.030472, 0.6194745, 0, 0, 0, 1, 1,
1.237806, -2.356037, 2.785275, 0, 0, 0, 1, 1,
1.241707, -1.137256, 1.209138, 0, 0, 0, 1, 1,
1.242163, 0.1132248, 2.596035, 0, 0, 0, 1, 1,
1.262439, -0.9958455, 3.077654, 0, 0, 0, 1, 1,
1.266605, 1.733857, 0.6723783, 1, 1, 1, 1, 1,
1.271323, -0.05284082, 2.024239, 1, 1, 1, 1, 1,
1.298261, -1.182126, 2.105745, 1, 1, 1, 1, 1,
1.305275, -0.7687531, 0.922106, 1, 1, 1, 1, 1,
1.315947, 1.559416, -0.8866028, 1, 1, 1, 1, 1,
1.318828, -0.2876047, 3.395317, 1, 1, 1, 1, 1,
1.322652, -0.2048207, 2.617277, 1, 1, 1, 1, 1,
1.324444, 0.6464763, 2.514077, 1, 1, 1, 1, 1,
1.326919, 0.3473973, 2.909884, 1, 1, 1, 1, 1,
1.336341, -0.3978879, 1.336308, 1, 1, 1, 1, 1,
1.339305, 1.132709, 1.650735, 1, 1, 1, 1, 1,
1.343196, -0.846759, 0.7734464, 1, 1, 1, 1, 1,
1.344649, 0.5561422, 0.5768065, 1, 1, 1, 1, 1,
1.347999, -0.3724785, 3.062731, 1, 1, 1, 1, 1,
1.350422, -0.07510173, 0.6879964, 1, 1, 1, 1, 1,
1.369082, 1.536142, 0.3091539, 0, 0, 1, 1, 1,
1.379431, 1.326388, 0.6587089, 1, 0, 0, 1, 1,
1.379739, 1.425949, 1.105781, 1, 0, 0, 1, 1,
1.396202, -0.7324823, 2.041678, 1, 0, 0, 1, 1,
1.396961, -0.9560247, 0.08747178, 1, 0, 0, 1, 1,
1.399257, 0.7972118, 1.050397, 1, 0, 0, 1, 1,
1.402947, -0.02799722, 3.140319, 0, 0, 0, 1, 1,
1.40931, 0.6623598, 1.629104, 0, 0, 0, 1, 1,
1.413981, -2.496987, 3.057949, 0, 0, 0, 1, 1,
1.41516, 0.7465751, 2.992013, 0, 0, 0, 1, 1,
1.427635, 0.2915844, 2.734595, 0, 0, 0, 1, 1,
1.432256, -0.7395598, 1.558083, 0, 0, 0, 1, 1,
1.436271, -2.463512, 2.882443, 0, 0, 0, 1, 1,
1.43963, 0.2419828, 0.4786697, 1, 1, 1, 1, 1,
1.448624, 1.683031, 0.6847917, 1, 1, 1, 1, 1,
1.450958, 0.4059172, 0.5984537, 1, 1, 1, 1, 1,
1.459194, 1.05192, 0.1746418, 1, 1, 1, 1, 1,
1.485927, -1.592558, 2.326827, 1, 1, 1, 1, 1,
1.502925, 1.389705, 0.8619893, 1, 1, 1, 1, 1,
1.526087, -1.72536, 2.331302, 1, 1, 1, 1, 1,
1.537791, -0.7986453, 1.862388, 1, 1, 1, 1, 1,
1.54189, -0.6490779, 2.817183, 1, 1, 1, 1, 1,
1.55336, -0.2249711, 2.317812, 1, 1, 1, 1, 1,
1.560312, -0.1428069, 1.921973, 1, 1, 1, 1, 1,
1.567892, 1.884465, 1.296147, 1, 1, 1, 1, 1,
1.590911, 0.05921038, -1.666735, 1, 1, 1, 1, 1,
1.597073, -1.735464, 2.416764, 1, 1, 1, 1, 1,
1.604463, -0.4477601, 1.093916, 1, 1, 1, 1, 1,
1.612482, 0.1529632, 1.061318, 0, 0, 1, 1, 1,
1.623671, 0.4297202, 1.658021, 1, 0, 0, 1, 1,
1.625299, 0.6044537, 2.457484, 1, 0, 0, 1, 1,
1.626273, 0.4433846, 1.360002, 1, 0, 0, 1, 1,
1.633508, 0.8726546, -0.01568673, 1, 0, 0, 1, 1,
1.651858, -0.4411478, 0.8666553, 1, 0, 0, 1, 1,
1.681549, -0.4325481, 1.347057, 0, 0, 0, 1, 1,
1.694191, -1.281223, 2.116546, 0, 0, 0, 1, 1,
1.700177, 0.2120991, 1.714277, 0, 0, 0, 1, 1,
1.721638, 0.3493952, 0.1843745, 0, 0, 0, 1, 1,
1.723185, -0.195919, 1.482175, 0, 0, 0, 1, 1,
1.723337, 0.6392848, 1.690763, 0, 0, 0, 1, 1,
1.730441, 2.005199, 0.6816834, 0, 0, 0, 1, 1,
1.732968, 1.072381, 1.981649, 1, 1, 1, 1, 1,
1.738609, -0.384124, 0.9231225, 1, 1, 1, 1, 1,
1.738825, 2.043418, -0.8570603, 1, 1, 1, 1, 1,
1.760637, 2.09508, 1.697675, 1, 1, 1, 1, 1,
1.770764, -0.2342862, 2.234185, 1, 1, 1, 1, 1,
1.774044, -0.7307819, 1.650337, 1, 1, 1, 1, 1,
1.791606, -1.083749, 2.953655, 1, 1, 1, 1, 1,
1.798477, 0.9455763, 1.256147, 1, 1, 1, 1, 1,
1.819993, -0.3236595, 1.693944, 1, 1, 1, 1, 1,
1.824726, -1.720314, 4.408371, 1, 1, 1, 1, 1,
1.829082, 1.296336, 2.051112, 1, 1, 1, 1, 1,
1.838655, 0.3917582, 1.297237, 1, 1, 1, 1, 1,
1.839828, 1.958128, -0.247181, 1, 1, 1, 1, 1,
1.853879, 0.7615424, 0.5863616, 1, 1, 1, 1, 1,
1.854596, 0.8529922, 1.091168, 1, 1, 1, 1, 1,
1.887603, 0.5200362, 1.626946, 0, 0, 1, 1, 1,
1.888591, -0.2130609, 1.752943, 1, 0, 0, 1, 1,
1.897102, -0.8404904, 3.053573, 1, 0, 0, 1, 1,
1.916113, 0.737527, -0.5429363, 1, 0, 0, 1, 1,
1.93197, 0.5042365, 0.09800871, 1, 0, 0, 1, 1,
1.969052, -0.6426523, 1.15887, 1, 0, 0, 1, 1,
1.970671, 1.389476, 1.362843, 0, 0, 0, 1, 1,
1.986162, -0.04172616, 2.542046, 0, 0, 0, 1, 1,
2.04678, -1.833142, 1.746429, 0, 0, 0, 1, 1,
2.049407, -0.5797049, 2.876157, 0, 0, 0, 1, 1,
2.053331, 0.1145004, 1.212438, 0, 0, 0, 1, 1,
2.077574, -1.440831, 0.5901495, 0, 0, 0, 1, 1,
2.081774, -1.421695, 0.6342195, 0, 0, 0, 1, 1,
2.091348, -0.797749, 2.566071, 1, 1, 1, 1, 1,
2.138346, 0.7255266, 2.557193, 1, 1, 1, 1, 1,
2.143319, 0.1386689, 2.298675, 1, 1, 1, 1, 1,
2.145312, -1.429922, 2.349201, 1, 1, 1, 1, 1,
2.187131, -0.6854146, 1.775367, 1, 1, 1, 1, 1,
2.246381, -2.060802, 2.254413, 1, 1, 1, 1, 1,
2.455575, 1.324357, 2.368309, 1, 1, 1, 1, 1
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
var radius = 9.301832;
var distance = 32.67229;
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
mvMatrix.translate( 0.4334553, -0.09378862, -0.3654315 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.67229);
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
