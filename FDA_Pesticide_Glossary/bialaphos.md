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
-2.992198, -0.9683194, -0.9037056, 1, 0, 0, 1,
-2.761847, -0.1463493, -1.482153, 1, 0.007843138, 0, 1,
-2.624306, 0.5567814, -1.452617, 1, 0.01176471, 0, 1,
-2.614315, -0.3267502, -1.570068, 1, 0.01960784, 0, 1,
-2.606582, 0.311157, -1.534882, 1, 0.02352941, 0, 1,
-2.523145, -0.712068, -1.99235, 1, 0.03137255, 0, 1,
-2.510692, -1.376333, -2.048423, 1, 0.03529412, 0, 1,
-2.490778, -1.508263, -1.141993, 1, 0.04313726, 0, 1,
-2.455312, -0.05820197, -2.095818, 1, 0.04705882, 0, 1,
-2.427383, 0.521622, -1.184926, 1, 0.05490196, 0, 1,
-2.40001, -0.914431, -0.7351789, 1, 0.05882353, 0, 1,
-2.352629, -0.6519449, -2.082466, 1, 0.06666667, 0, 1,
-2.337329, -0.06368541, -2.938704, 1, 0.07058824, 0, 1,
-2.322247, -0.2077996, -1.451489, 1, 0.07843138, 0, 1,
-2.306265, 1.171071, -0.006054555, 1, 0.08235294, 0, 1,
-2.266853, -1.908528, -1.717927, 1, 0.09019608, 0, 1,
-2.245113, -0.5798874, -2.711169, 1, 0.09411765, 0, 1,
-2.239668, 0.1454213, -1.51203, 1, 0.1019608, 0, 1,
-2.204278, -0.750083, -1.691455, 1, 0.1098039, 0, 1,
-2.190836, 0.3011586, -3.266815, 1, 0.1137255, 0, 1,
-2.152236, -0.04684798, -1.020209, 1, 0.1215686, 0, 1,
-2.111557, -0.1158411, -2.536822, 1, 0.1254902, 0, 1,
-2.098151, -0.94653, -0.6674788, 1, 0.1333333, 0, 1,
-2.092361, -1.951641, -2.512659, 1, 0.1372549, 0, 1,
-2.089523, -1.702065, -3.083633, 1, 0.145098, 0, 1,
-2.074766, -0.5819738, 0.2261073, 1, 0.1490196, 0, 1,
-2.07292, 0.2585235, -2.923305, 1, 0.1568628, 0, 1,
-2.011643, 0.1458893, -1.290862, 1, 0.1607843, 0, 1,
-1.970321, 1.291366, -0.3457528, 1, 0.1686275, 0, 1,
-1.968518, 0.4135762, -1.611354, 1, 0.172549, 0, 1,
-1.941392, -0.5314164, -1.277205, 1, 0.1803922, 0, 1,
-1.931168, -0.1821146, -1.394995, 1, 0.1843137, 0, 1,
-1.89945, 0.9432716, -2.611052, 1, 0.1921569, 0, 1,
-1.890117, 0.1319768, -0.1673247, 1, 0.1960784, 0, 1,
-1.881778, -0.8293928, -2.402754, 1, 0.2039216, 0, 1,
-1.874682, 0.4489262, -2.248651, 1, 0.2117647, 0, 1,
-1.811567, 0.3937777, -0.4542386, 1, 0.2156863, 0, 1,
-1.807309, -0.5810705, -1.947124, 1, 0.2235294, 0, 1,
-1.797152, -0.9717304, -1.039778, 1, 0.227451, 0, 1,
-1.778068, 0.218349, -1.959494, 1, 0.2352941, 0, 1,
-1.762867, -0.1560684, -1.344958, 1, 0.2392157, 0, 1,
-1.73703, 0.02777966, -0.8421519, 1, 0.2470588, 0, 1,
-1.728909, 0.912003, -2.430372, 1, 0.2509804, 0, 1,
-1.715205, 0.08127224, -0.5916722, 1, 0.2588235, 0, 1,
-1.695806, -1.821555, -2.740331, 1, 0.2627451, 0, 1,
-1.689034, 0.698303, -0.6932979, 1, 0.2705882, 0, 1,
-1.679223, 1.135079, -1.722348, 1, 0.2745098, 0, 1,
-1.678452, -0.7494028, -0.823666, 1, 0.282353, 0, 1,
-1.678084, 0.5755396, -1.21313, 1, 0.2862745, 0, 1,
-1.665687, -0.4486247, -1.916937, 1, 0.2941177, 0, 1,
-1.630386, 0.05812256, -0.688556, 1, 0.3019608, 0, 1,
-1.624017, -0.9445488, -1.375251, 1, 0.3058824, 0, 1,
-1.600749, 0.03094055, -0.7700828, 1, 0.3137255, 0, 1,
-1.594438, -1.733431, -1.193094, 1, 0.3176471, 0, 1,
-1.594234, -1.220185, -0.8030951, 1, 0.3254902, 0, 1,
-1.591449, 0.4401553, -1.012475, 1, 0.3294118, 0, 1,
-1.589259, -1.048227, -0.6611933, 1, 0.3372549, 0, 1,
-1.573581, 0.867693, -2.634526, 1, 0.3411765, 0, 1,
-1.571541, 0.4494045, -0.2366379, 1, 0.3490196, 0, 1,
-1.565752, 0.08298571, 0.2012477, 1, 0.3529412, 0, 1,
-1.546431, 0.4376361, -0.1633092, 1, 0.3607843, 0, 1,
-1.543704, -0.861559, -3.831705, 1, 0.3647059, 0, 1,
-1.538934, -0.1502799, -0.6109716, 1, 0.372549, 0, 1,
-1.534525, 1.070378, 0.2551949, 1, 0.3764706, 0, 1,
-1.533102, -0.6153302, -0.8958787, 1, 0.3843137, 0, 1,
-1.530952, 0.01027225, -0.07497969, 1, 0.3882353, 0, 1,
-1.522452, 0.9863681, -1.150563, 1, 0.3960784, 0, 1,
-1.509699, -0.4130392, -0.6001912, 1, 0.4039216, 0, 1,
-1.50182, -0.1646907, -2.490784, 1, 0.4078431, 0, 1,
-1.472936, -0.5652446, -1.406868, 1, 0.4156863, 0, 1,
-1.472045, -1.652818, -1.363837, 1, 0.4196078, 0, 1,
-1.468728, 0.4824749, -2.865687, 1, 0.427451, 0, 1,
-1.444383, 1.609394, -1.969896, 1, 0.4313726, 0, 1,
-1.437061, 0.7413931, -1.275295, 1, 0.4392157, 0, 1,
-1.434376, 0.4027903, -0.6944604, 1, 0.4431373, 0, 1,
-1.433337, -0.304438, -1.530976, 1, 0.4509804, 0, 1,
-1.430293, 0.03378781, -0.8721304, 1, 0.454902, 0, 1,
-1.429609, 0.2352824, -1.155945, 1, 0.4627451, 0, 1,
-1.421816, -0.8857737, -0.8376857, 1, 0.4666667, 0, 1,
-1.419742, -1.078877, -3.427702, 1, 0.4745098, 0, 1,
-1.417593, 0.7163627, -0.7594878, 1, 0.4784314, 0, 1,
-1.415547, 1.029383, -1.011585, 1, 0.4862745, 0, 1,
-1.398967, 2.100553, -0.9035487, 1, 0.4901961, 0, 1,
-1.393794, -0.2843299, -0.3812766, 1, 0.4980392, 0, 1,
-1.381646, -0.6839747, -2.27875, 1, 0.5058824, 0, 1,
-1.375282, -0.6481823, -3.637691, 1, 0.509804, 0, 1,
-1.369516, 0.5321463, -1.928574, 1, 0.5176471, 0, 1,
-1.358344, -2.318811, -3.700586, 1, 0.5215687, 0, 1,
-1.353561, -1.96788, -0.8901165, 1, 0.5294118, 0, 1,
-1.340716, -0.5610171, -3.200196, 1, 0.5333334, 0, 1,
-1.334044, -0.2228965, -2.300516, 1, 0.5411765, 0, 1,
-1.32569, 0.6627851, -1.633999, 1, 0.5450981, 0, 1,
-1.322851, -1.446928, -1.785485, 1, 0.5529412, 0, 1,
-1.318174, -1.201538, -2.144477, 1, 0.5568628, 0, 1,
-1.314309, 1.873186, -1.198565, 1, 0.5647059, 0, 1,
-1.314279, -1.264478, -2.846773, 1, 0.5686275, 0, 1,
-1.313304, -0.9889723, -0.6106567, 1, 0.5764706, 0, 1,
-1.303872, 0.0963881, -1.180131, 1, 0.5803922, 0, 1,
-1.303452, -0.9788256, -1.671545, 1, 0.5882353, 0, 1,
-1.301153, -0.4550162, -1.719683, 1, 0.5921569, 0, 1,
-1.297819, -0.695108, -2.381463, 1, 0.6, 0, 1,
-1.295251, -0.5714657, 0.2915081, 1, 0.6078432, 0, 1,
-1.272471, -1.936482, -1.046474, 1, 0.6117647, 0, 1,
-1.252683, -0.3828098, -0.9920745, 1, 0.6196079, 0, 1,
-1.245385, 1.118696, -2.1405, 1, 0.6235294, 0, 1,
-1.24099, -0.2981598, -1.907853, 1, 0.6313726, 0, 1,
-1.233905, 0.3887779, -0.2738617, 1, 0.6352941, 0, 1,
-1.225579, -1.291407, -1.422861, 1, 0.6431373, 0, 1,
-1.219121, 0.1305712, -2.689561, 1, 0.6470588, 0, 1,
-1.21585, 0.4776558, -2.449088, 1, 0.654902, 0, 1,
-1.211795, -0.2257175, -1.661043, 1, 0.6588235, 0, 1,
-1.202752, 0.9149587, -1.103489, 1, 0.6666667, 0, 1,
-1.181419, -0.7506181, -1.96464, 1, 0.6705883, 0, 1,
-1.179511, 2.031676, -0.2957416, 1, 0.6784314, 0, 1,
-1.173796, 0.07220882, -2.098132, 1, 0.682353, 0, 1,
-1.160468, 1.812445, -0.5488341, 1, 0.6901961, 0, 1,
-1.159368, 1.069468, -0.4691136, 1, 0.6941177, 0, 1,
-1.159256, -1.250825, -2.902409, 1, 0.7019608, 0, 1,
-1.154627, 0.09482361, -1.086178, 1, 0.7098039, 0, 1,
-1.153985, -1.894898, -1.832092, 1, 0.7137255, 0, 1,
-1.152479, -1.123239, -1.568855, 1, 0.7215686, 0, 1,
-1.147241, 0.6031265, 0.2983046, 1, 0.7254902, 0, 1,
-1.142055, -1.42445, -3.365186, 1, 0.7333333, 0, 1,
-1.141424, 0.1581004, -1.455592, 1, 0.7372549, 0, 1,
-1.135634, 1.652982, -1.571878, 1, 0.7450981, 0, 1,
-1.126932, 0.8758701, -2.106794, 1, 0.7490196, 0, 1,
-1.119115, -1.432094, -1.981845, 1, 0.7568628, 0, 1,
-1.116092, -1.227484, -3.407921, 1, 0.7607843, 0, 1,
-1.115106, 1.080925, 0.4363268, 1, 0.7686275, 0, 1,
-1.114713, 0.004195314, -2.240353, 1, 0.772549, 0, 1,
-1.110034, 0.009322717, -2.094046, 1, 0.7803922, 0, 1,
-1.108881, -0.1206486, -2.933984, 1, 0.7843137, 0, 1,
-1.099536, -0.1875551, -3.283937, 1, 0.7921569, 0, 1,
-1.099032, -1.084658, -1.644045, 1, 0.7960784, 0, 1,
-1.096658, -0.3102956, -1.740153, 1, 0.8039216, 0, 1,
-1.086571, -0.06780972, -2.088966, 1, 0.8117647, 0, 1,
-1.081552, -1.145712, -2.66549, 1, 0.8156863, 0, 1,
-1.080308, -0.4432741, -2.300438, 1, 0.8235294, 0, 1,
-1.079337, -1.337906, -3.651756, 1, 0.827451, 0, 1,
-1.071526, 0.2631596, -2.044522, 1, 0.8352941, 0, 1,
-1.070066, -1.132326, 0.4609032, 1, 0.8392157, 0, 1,
-1.069626, -0.4353174, -4.032927, 1, 0.8470588, 0, 1,
-1.066497, 0.2551609, -3.050434, 1, 0.8509804, 0, 1,
-1.035036, 1.011434, -0.4391293, 1, 0.8588235, 0, 1,
-1.031934, 1.353554, -1.012041, 1, 0.8627451, 0, 1,
-1.026322, -0.6484702, -1.775554, 1, 0.8705882, 0, 1,
-1.02086, 0.3486101, -0.3682173, 1, 0.8745098, 0, 1,
-1.017825, 0.4543441, -2.219836, 1, 0.8823529, 0, 1,
-1.013355, 0.2226835, -1.852731, 1, 0.8862745, 0, 1,
-1.009786, -0.5706714, -1.55136, 1, 0.8941177, 0, 1,
-0.9975205, 1.584676, -1.749295, 1, 0.8980392, 0, 1,
-0.9859907, -0.6653905, -0.4683705, 1, 0.9058824, 0, 1,
-0.9824086, 0.6207552, -2.097125, 1, 0.9137255, 0, 1,
-0.9743471, 0.6170679, -0.8033677, 1, 0.9176471, 0, 1,
-0.968119, -1.490923, -1.44612, 1, 0.9254902, 0, 1,
-0.96096, -0.3993775, -2.009829, 1, 0.9294118, 0, 1,
-0.9587823, 0.06062097, -1.441206, 1, 0.9372549, 0, 1,
-0.954243, -0.1876427, -2.535815, 1, 0.9411765, 0, 1,
-0.9522731, 0.4838923, -0.7541624, 1, 0.9490196, 0, 1,
-0.9485648, -0.7990401, -3.119142, 1, 0.9529412, 0, 1,
-0.9480153, 0.2488418, -0.8495373, 1, 0.9607843, 0, 1,
-0.947521, 0.9530901, -0.02524976, 1, 0.9647059, 0, 1,
-0.9467214, 0.4774894, -2.443129, 1, 0.972549, 0, 1,
-0.9392515, 1.075111, -1.384172, 1, 0.9764706, 0, 1,
-0.9365259, 0.3200286, -0.6639084, 1, 0.9843137, 0, 1,
-0.9348004, 1.004788, -1.087267, 1, 0.9882353, 0, 1,
-0.9318923, -0.8682206, 0.4166586, 1, 0.9960784, 0, 1,
-0.9312746, -0.8589031, -2.853522, 0.9960784, 1, 0, 1,
-0.9306197, -1.333755, -1.462719, 0.9921569, 1, 0, 1,
-0.9245955, -0.3784582, -1.202509, 0.9843137, 1, 0, 1,
-0.9221675, 1.94827, 0.8006864, 0.9803922, 1, 0, 1,
-0.9110122, 0.1091667, -0.2557321, 0.972549, 1, 0, 1,
-0.8943768, 0.3152493, 0.2686544, 0.9686275, 1, 0, 1,
-0.8768355, -0.2316027, -0.04128271, 0.9607843, 1, 0, 1,
-0.8686974, 1.200848, -1.178433, 0.9568627, 1, 0, 1,
-0.8637451, 0.001520299, -0.6563169, 0.9490196, 1, 0, 1,
-0.8636737, -0.1745242, -1.005754, 0.945098, 1, 0, 1,
-0.8635168, 0.5760831, -1.682085, 0.9372549, 1, 0, 1,
-0.8551915, 0.59796, -1.302647, 0.9333333, 1, 0, 1,
-0.8490719, -0.09276638, -1.915634, 0.9254902, 1, 0, 1,
-0.834589, 0.7598997, -2.036525, 0.9215686, 1, 0, 1,
-0.8307341, 1.518024, -0.3140101, 0.9137255, 1, 0, 1,
-0.8299017, -1.491992, -4.085079, 0.9098039, 1, 0, 1,
-0.8270472, 1.852933, -2.032063, 0.9019608, 1, 0, 1,
-0.8262714, -0.001748556, -1.76793, 0.8941177, 1, 0, 1,
-0.8262057, -1.40568, -2.349426, 0.8901961, 1, 0, 1,
-0.8240905, -0.704936, -2.013009, 0.8823529, 1, 0, 1,
-0.821234, 0.237561, 1.678713, 0.8784314, 1, 0, 1,
-0.8192647, -0.461265, -2.65027, 0.8705882, 1, 0, 1,
-0.8135127, -0.4699486, -2.385041, 0.8666667, 1, 0, 1,
-0.8116685, 0.7947752, 0.3336567, 0.8588235, 1, 0, 1,
-0.8109901, -0.07341104, -2.612628, 0.854902, 1, 0, 1,
-0.8098093, -0.1512503, -2.658311, 0.8470588, 1, 0, 1,
-0.8096156, 1.163164, 0.4792879, 0.8431373, 1, 0, 1,
-0.8074639, 0.3735272, -1.06446, 0.8352941, 1, 0, 1,
-0.806923, -0.8201326, -2.414235, 0.8313726, 1, 0, 1,
-0.8059207, -0.8182726, -2.655535, 0.8235294, 1, 0, 1,
-0.8045053, -0.2900916, -1.339499, 0.8196079, 1, 0, 1,
-0.8028244, 0.7127764, -0.2720482, 0.8117647, 1, 0, 1,
-0.7989032, 1.056703, 0.4223585, 0.8078431, 1, 0, 1,
-0.7985642, -1.636538, -1.246688, 0.8, 1, 0, 1,
-0.7898441, -0.02569631, -0.8590763, 0.7921569, 1, 0, 1,
-0.7893693, 0.1042228, -1.356175, 0.7882353, 1, 0, 1,
-0.7803817, 0.3015322, -1.81101, 0.7803922, 1, 0, 1,
-0.775411, 0.90166, 0.34646, 0.7764706, 1, 0, 1,
-0.7717048, 0.3772719, -1.565574, 0.7686275, 1, 0, 1,
-0.7676672, -0.2593314, -2.017424, 0.7647059, 1, 0, 1,
-0.7655886, -0.06444117, -3.462607, 0.7568628, 1, 0, 1,
-0.7633045, -1.170018, -0.9288277, 0.7529412, 1, 0, 1,
-0.762453, -2.555472, -2.967371, 0.7450981, 1, 0, 1,
-0.7589165, 0.3578993, -0.4251087, 0.7411765, 1, 0, 1,
-0.7552859, -1.377576, -2.114365, 0.7333333, 1, 0, 1,
-0.7541822, -1.788117, -1.669015, 0.7294118, 1, 0, 1,
-0.7541481, 1.490673, -0.287685, 0.7215686, 1, 0, 1,
-0.7533026, -0.6123037, -1.49194, 0.7176471, 1, 0, 1,
-0.7508631, -1.097405, -2.777819, 0.7098039, 1, 0, 1,
-0.7480428, 0.5210661, 1.2904, 0.7058824, 1, 0, 1,
-0.7463582, -1.549478, -3.564284, 0.6980392, 1, 0, 1,
-0.7416579, 0.9440723, -1.118021, 0.6901961, 1, 0, 1,
-0.7400776, 1.833583, -0.7674031, 0.6862745, 1, 0, 1,
-0.7395269, -0.4272835, -3.103371, 0.6784314, 1, 0, 1,
-0.7361947, -0.6305333, -0.9914591, 0.6745098, 1, 0, 1,
-0.7238197, -0.3531606, -2.392912, 0.6666667, 1, 0, 1,
-0.7225552, -0.4598802, -2.620333, 0.6627451, 1, 0, 1,
-0.7171496, -1.600226, -2.555953, 0.654902, 1, 0, 1,
-0.7095019, 0.3576997, 0.5303926, 0.6509804, 1, 0, 1,
-0.7064135, -0.9241088, -3.268555, 0.6431373, 1, 0, 1,
-0.6957918, -0.7067365, -2.316483, 0.6392157, 1, 0, 1,
-0.6925305, 1.263862, -1.009222, 0.6313726, 1, 0, 1,
-0.6912254, 1.14972, -2.820181, 0.627451, 1, 0, 1,
-0.6893379, -1.966206, -2.799819, 0.6196079, 1, 0, 1,
-0.6872709, -0.0794142, -1.873378, 0.6156863, 1, 0, 1,
-0.6866815, 1.320695, -1.322406, 0.6078432, 1, 0, 1,
-0.67816, 0.3742736, -0.3492621, 0.6039216, 1, 0, 1,
-0.6750131, 0.4249053, -0.06967084, 0.5960785, 1, 0, 1,
-0.6734657, 1.10986, 1.924841, 0.5882353, 1, 0, 1,
-0.6732143, 0.6233642, -0.1927602, 0.5843138, 1, 0, 1,
-0.6723478, -3.061501, -2.700315, 0.5764706, 1, 0, 1,
-0.6700348, -1.482721, -3.159535, 0.572549, 1, 0, 1,
-0.6649601, -0.5293261, -2.390178, 0.5647059, 1, 0, 1,
-0.6619749, -0.7104264, -2.421957, 0.5607843, 1, 0, 1,
-0.6581997, 0.5750488, -2.157395, 0.5529412, 1, 0, 1,
-0.657544, -0.5983156, -1.736031, 0.5490196, 1, 0, 1,
-0.6567895, 0.1028222, -3.18916, 0.5411765, 1, 0, 1,
-0.6472305, -0.7427161, -3.023952, 0.5372549, 1, 0, 1,
-0.6466765, 1.129184, -0.6510696, 0.5294118, 1, 0, 1,
-0.6453752, -0.05491425, -3.231178, 0.5254902, 1, 0, 1,
-0.6395922, -1.637675, -2.475578, 0.5176471, 1, 0, 1,
-0.6395164, 1.658107, -1.329065, 0.5137255, 1, 0, 1,
-0.6388333, 1.037566, -3.004872, 0.5058824, 1, 0, 1,
-0.6358863, -0.1456175, -1.725895, 0.5019608, 1, 0, 1,
-0.6318462, 1.118295, -0.1526692, 0.4941176, 1, 0, 1,
-0.6294898, -0.4395735, -0.3041948, 0.4862745, 1, 0, 1,
-0.6230966, -0.4917537, -3.425823, 0.4823529, 1, 0, 1,
-0.6198232, 0.6266546, -1.745622, 0.4745098, 1, 0, 1,
-0.618876, -0.9334162, -2.988118, 0.4705882, 1, 0, 1,
-0.6188205, 1.292997, 0.9961959, 0.4627451, 1, 0, 1,
-0.6168125, -0.6643201, -1.213437, 0.4588235, 1, 0, 1,
-0.615339, 0.1563543, -1.363732, 0.4509804, 1, 0, 1,
-0.6106237, -0.7986312, -1.42296, 0.4470588, 1, 0, 1,
-0.6097873, 0.00831037, -1.162554, 0.4392157, 1, 0, 1,
-0.609081, 1.012677, 1.40396, 0.4352941, 1, 0, 1,
-0.6073732, -0.7009975, -2.580353, 0.427451, 1, 0, 1,
-0.6069686, -0.8189221, -2.704356, 0.4235294, 1, 0, 1,
-0.6059625, -1.519114, -4.111314, 0.4156863, 1, 0, 1,
-0.6057452, 1.1531, -1.551678, 0.4117647, 1, 0, 1,
-0.6035637, -2.692182, -3.091247, 0.4039216, 1, 0, 1,
-0.5963954, -1.56756, -3.545468, 0.3960784, 1, 0, 1,
-0.5952133, -1.610109, -2.720203, 0.3921569, 1, 0, 1,
-0.5949191, 0.2373205, 1.650981, 0.3843137, 1, 0, 1,
-0.5861444, 0.1045074, -0.02936523, 0.3803922, 1, 0, 1,
-0.5823097, 3.304896, -1.087689, 0.372549, 1, 0, 1,
-0.5785016, -1.17642, -2.622829, 0.3686275, 1, 0, 1,
-0.5739836, -0.4566647, -1.978625, 0.3607843, 1, 0, 1,
-0.572215, 0.01440876, -0.706541, 0.3568628, 1, 0, 1,
-0.5588681, 2.439298, 1.225608, 0.3490196, 1, 0, 1,
-0.558397, 0.8710655, -0.253037, 0.345098, 1, 0, 1,
-0.5578022, -0.1833791, -0.787905, 0.3372549, 1, 0, 1,
-0.5554861, -0.2674172, -1.615076, 0.3333333, 1, 0, 1,
-0.5536534, 0.2463607, -3.054706, 0.3254902, 1, 0, 1,
-0.5534965, -1.030216, -3.596283, 0.3215686, 1, 0, 1,
-0.5522487, -0.4409657, -2.357872, 0.3137255, 1, 0, 1,
-0.5505772, -0.8924072, -2.953139, 0.3098039, 1, 0, 1,
-0.5503809, -0.4785068, -1.113754, 0.3019608, 1, 0, 1,
-0.5478051, -0.08250783, -1.65021, 0.2941177, 1, 0, 1,
-0.5455501, -1.190168, -2.339669, 0.2901961, 1, 0, 1,
-0.5427728, 0.1711708, -2.280054, 0.282353, 1, 0, 1,
-0.5345576, -0.1667497, -0.1853421, 0.2784314, 1, 0, 1,
-0.5288671, -0.6238385, -2.384219, 0.2705882, 1, 0, 1,
-0.5274218, 0.03735633, -1.993904, 0.2666667, 1, 0, 1,
-0.5159425, -0.4443572, -1.248983, 0.2588235, 1, 0, 1,
-0.5078322, 0.7705877, -0.4320498, 0.254902, 1, 0, 1,
-0.5041171, -0.3037783, -2.513482, 0.2470588, 1, 0, 1,
-0.5039728, -1.056292, -0.7049419, 0.2431373, 1, 0, 1,
-0.5026088, 0.6262363, -0.6517102, 0.2352941, 1, 0, 1,
-0.496843, 0.1385942, -0.6310643, 0.2313726, 1, 0, 1,
-0.4926377, -0.02912903, -2.97932, 0.2235294, 1, 0, 1,
-0.4918025, -1.886448, -2.909341, 0.2196078, 1, 0, 1,
-0.4887115, 1.913485, -0.6000409, 0.2117647, 1, 0, 1,
-0.4860881, 0.3441218, -0.9592356, 0.2078431, 1, 0, 1,
-0.4824628, -0.6769294, -5.092257, 0.2, 1, 0, 1,
-0.481686, 0.7490687, -0.7870502, 0.1921569, 1, 0, 1,
-0.4782853, -0.5812861, -2.471875, 0.1882353, 1, 0, 1,
-0.47738, -2.215446, -2.37917, 0.1803922, 1, 0, 1,
-0.4729725, 1.16245, -1.167834, 0.1764706, 1, 0, 1,
-0.4704299, 0.473804, -1.538008, 0.1686275, 1, 0, 1,
-0.4607061, -0.5900782, -2.527093, 0.1647059, 1, 0, 1,
-0.4593386, -0.7389227, -1.690993, 0.1568628, 1, 0, 1,
-0.4587514, -0.1879165, -2.925386, 0.1529412, 1, 0, 1,
-0.4573668, 1.119564, 0.1626111, 0.145098, 1, 0, 1,
-0.4563693, 0.8595961, -1.010614, 0.1411765, 1, 0, 1,
-0.4541175, 0.3833214, -1.197452, 0.1333333, 1, 0, 1,
-0.4540361, 0.2836759, -0.9011721, 0.1294118, 1, 0, 1,
-0.4514632, 0.2162794, -0.7500666, 0.1215686, 1, 0, 1,
-0.4507698, 1.464243, 0.07616338, 0.1176471, 1, 0, 1,
-0.4500979, -0.2460319, -3.955046, 0.1098039, 1, 0, 1,
-0.4494705, -2.696164, -2.222982, 0.1058824, 1, 0, 1,
-0.4398093, -1.554894, -3.605718, 0.09803922, 1, 0, 1,
-0.4358381, 0.347147, -0.5564274, 0.09019608, 1, 0, 1,
-0.4310454, 1.124111, 0.4597225, 0.08627451, 1, 0, 1,
-0.4267129, 0.2493201, 0.4609134, 0.07843138, 1, 0, 1,
-0.4261824, -0.4553391, -1.132711, 0.07450981, 1, 0, 1,
-0.4255311, -0.2755716, -0.7194286, 0.06666667, 1, 0, 1,
-0.42429, -0.3697929, -2.623363, 0.0627451, 1, 0, 1,
-0.4186163, -0.805003, -2.605777, 0.05490196, 1, 0, 1,
-0.4170773, 0.2235648, 0.2194304, 0.05098039, 1, 0, 1,
-0.4168602, -0.6000846, -5.040359, 0.04313726, 1, 0, 1,
-0.41567, -2.174164, -4.137624, 0.03921569, 1, 0, 1,
-0.4081008, 1.706767, 0.2807, 0.03137255, 1, 0, 1,
-0.4052293, -0.6304559, -4.03807, 0.02745098, 1, 0, 1,
-0.4046254, 1.0667, 0.211409, 0.01960784, 1, 0, 1,
-0.4026584, -0.4239961, -2.428677, 0.01568628, 1, 0, 1,
-0.397665, 2.007004, 0.1809508, 0.007843138, 1, 0, 1,
-0.3950883, -1.042391, -4.074108, 0.003921569, 1, 0, 1,
-0.3897401, 0.6563311, 0.606803, 0, 1, 0.003921569, 1,
-0.3891066, 0.5576383, -1.146439, 0, 1, 0.01176471, 1,
-0.3863458, 0.8448806, 0.3243043, 0, 1, 0.01568628, 1,
-0.3843297, 0.8618997, -0.2061675, 0, 1, 0.02352941, 1,
-0.3799984, -2.422153, -3.649718, 0, 1, 0.02745098, 1,
-0.376667, 0.8957084, -0.3103684, 0, 1, 0.03529412, 1,
-0.3755952, 0.01644039, -1.471315, 0, 1, 0.03921569, 1,
-0.3742083, 0.5094641, 0.5214711, 0, 1, 0.04705882, 1,
-0.3682951, -0.1333493, -1.151379, 0, 1, 0.05098039, 1,
-0.3660213, -0.3020629, -2.975902, 0, 1, 0.05882353, 1,
-0.3654633, -1.215444, -3.887265, 0, 1, 0.0627451, 1,
-0.3644141, -1.108747, -5.592013, 0, 1, 0.07058824, 1,
-0.358675, 1.494115, -0.3589393, 0, 1, 0.07450981, 1,
-0.3557759, 0.6526338, -0.02338417, 0, 1, 0.08235294, 1,
-0.3529536, 2.325004, -0.3704974, 0, 1, 0.08627451, 1,
-0.347348, -0.002846579, 0.4018128, 0, 1, 0.09411765, 1,
-0.3445523, 2.187115, -1.18611, 0, 1, 0.1019608, 1,
-0.3389867, 0.7261232, -0.6607524, 0, 1, 0.1058824, 1,
-0.3371001, -0.5021951, -0.8187494, 0, 1, 0.1137255, 1,
-0.3353305, -0.8721205, -3.423063, 0, 1, 0.1176471, 1,
-0.3345606, 0.3171985, -1.058941, 0, 1, 0.1254902, 1,
-0.3330482, -1.044228, -2.921864, 0, 1, 0.1294118, 1,
-0.3328668, 0.7972305, -0.4990686, 0, 1, 0.1372549, 1,
-0.3326946, -0.09944691, -2.694118, 0, 1, 0.1411765, 1,
-0.3260503, -1.111409, -2.608419, 0, 1, 0.1490196, 1,
-0.3253028, 0.2913365, -1.595431, 0, 1, 0.1529412, 1,
-0.318986, 1.194094, -0.8578463, 0, 1, 0.1607843, 1,
-0.3158648, -1.349748, -2.607762, 0, 1, 0.1647059, 1,
-0.3077112, 0.4075956, -1.230555, 0, 1, 0.172549, 1,
-0.3067907, 0.7521244, 1.85211, 0, 1, 0.1764706, 1,
-0.3060647, -1.263535, -3.360119, 0, 1, 0.1843137, 1,
-0.2984211, -3.097682, -3.122737, 0, 1, 0.1882353, 1,
-0.2970311, 1.535842, -0.8375762, 0, 1, 0.1960784, 1,
-0.2970258, 0.2038149, -0.1890412, 0, 1, 0.2039216, 1,
-0.2935386, -0.9738543, -3.400051, 0, 1, 0.2078431, 1,
-0.2927865, -0.2179088, -1.740309, 0, 1, 0.2156863, 1,
-0.2915663, 0.9845691, -0.3074919, 0, 1, 0.2196078, 1,
-0.2902283, 0.9134469, 0.9869233, 0, 1, 0.227451, 1,
-0.28912, 0.9800647, 0.9703483, 0, 1, 0.2313726, 1,
-0.2878498, -1.057696, -1.953951, 0, 1, 0.2392157, 1,
-0.2875645, 2.113203, 0.6562768, 0, 1, 0.2431373, 1,
-0.2854649, 0.4701766, -0.6068255, 0, 1, 0.2509804, 1,
-0.2841807, -0.6264517, -2.704283, 0, 1, 0.254902, 1,
-0.2820281, -0.2870896, -0.9611522, 0, 1, 0.2627451, 1,
-0.281998, -0.2475167, -2.766796, 0, 1, 0.2666667, 1,
-0.280568, 0.1829977, -3.100601, 0, 1, 0.2745098, 1,
-0.2769434, -0.6340854, -3.300881, 0, 1, 0.2784314, 1,
-0.2754533, -0.4044621, -3.419096, 0, 1, 0.2862745, 1,
-0.2706628, -1.065099, -3.542835, 0, 1, 0.2901961, 1,
-0.2672784, 0.3732785, 0.458404, 0, 1, 0.2980392, 1,
-0.2670637, 0.03915458, -2.430881, 0, 1, 0.3058824, 1,
-0.2664764, 2.021431, -0.7374162, 0, 1, 0.3098039, 1,
-0.2570951, -0.4749966, -4.343416, 0, 1, 0.3176471, 1,
-0.2562837, -0.7363319, -3.73156, 0, 1, 0.3215686, 1,
-0.2555037, -0.7721046, -2.154852, 0, 1, 0.3294118, 1,
-0.2549172, -2.454851, -3.319961, 0, 1, 0.3333333, 1,
-0.2543792, 0.06982245, -1.464737, 0, 1, 0.3411765, 1,
-0.2527119, -0.1637732, -2.279528, 0, 1, 0.345098, 1,
-0.2522963, -1.347132, -3.155564, 0, 1, 0.3529412, 1,
-0.2521316, -1.109601, -2.700422, 0, 1, 0.3568628, 1,
-0.2520028, -2.713194, -3.306731, 0, 1, 0.3647059, 1,
-0.2519394, 0.607784, -1.458757, 0, 1, 0.3686275, 1,
-0.2488324, 0.352617, -2.24601, 0, 1, 0.3764706, 1,
-0.2467502, -0.7722669, -3.395406, 0, 1, 0.3803922, 1,
-0.2449417, -0.1500265, -3.280364, 0, 1, 0.3882353, 1,
-0.2439916, 0.1652965, -0.02470402, 0, 1, 0.3921569, 1,
-0.241511, -0.2608657, -1.613014, 0, 1, 0.4, 1,
-0.2385957, 0.9183013, 0.4559867, 0, 1, 0.4078431, 1,
-0.2380074, -0.9419457, -1.049937, 0, 1, 0.4117647, 1,
-0.2340677, 1.1262, 0.7256483, 0, 1, 0.4196078, 1,
-0.2339512, -0.159784, -3.189602, 0, 1, 0.4235294, 1,
-0.2331785, -0.6658257, -4.410941, 0, 1, 0.4313726, 1,
-0.2258704, 1.587783, -0.7220943, 0, 1, 0.4352941, 1,
-0.2216653, 0.5065262, -0.06884508, 0, 1, 0.4431373, 1,
-0.2183184, -1.464684, -2.497516, 0, 1, 0.4470588, 1,
-0.2110794, -0.6761174, -2.020749, 0, 1, 0.454902, 1,
-0.2007919, 1.310869, -0.9911894, 0, 1, 0.4588235, 1,
-0.1935978, 1.474258, -1.026399, 0, 1, 0.4666667, 1,
-0.1835176, -0.2036673, -4.327742, 0, 1, 0.4705882, 1,
-0.18183, -0.8245418, -3.198578, 0, 1, 0.4784314, 1,
-0.1717183, -0.6008086, -2.053267, 0, 1, 0.4823529, 1,
-0.1697775, -0.3251319, -2.510002, 0, 1, 0.4901961, 1,
-0.1665702, 1.045063, -0.6548496, 0, 1, 0.4941176, 1,
-0.1665688, -0.5477116, -2.620195, 0, 1, 0.5019608, 1,
-0.1620906, -2.818825, -2.898538, 0, 1, 0.509804, 1,
-0.1578353, -0.04401682, -2.656061, 0, 1, 0.5137255, 1,
-0.1555485, -1.461271, -3.355152, 0, 1, 0.5215687, 1,
-0.1537845, -0.06781818, -1.625508, 0, 1, 0.5254902, 1,
-0.1490685, -0.07730354, -2.478324, 0, 1, 0.5333334, 1,
-0.1489734, 0.6027284, 0.2794423, 0, 1, 0.5372549, 1,
-0.1438476, -0.00168353, -2.086791, 0, 1, 0.5450981, 1,
-0.1425765, 0.01058453, -1.483066, 0, 1, 0.5490196, 1,
-0.1400259, -1.499425, -2.299623, 0, 1, 0.5568628, 1,
-0.1397691, 0.8145319, -0.2685069, 0, 1, 0.5607843, 1,
-0.1322444, -3.193704, -3.861008, 0, 1, 0.5686275, 1,
-0.1279603, -0.2002937, -3.151736, 0, 1, 0.572549, 1,
-0.1278381, -0.03500139, -3.024495, 0, 1, 0.5803922, 1,
-0.1255316, 0.7699052, -0.03434244, 0, 1, 0.5843138, 1,
-0.1217002, -1.432317, -4.307961, 0, 1, 0.5921569, 1,
-0.1210284, 1.762618, 0.0192737, 0, 1, 0.5960785, 1,
-0.12029, 1.937444, -0.2446374, 0, 1, 0.6039216, 1,
-0.1195962, -0.8077837, -1.691079, 0, 1, 0.6117647, 1,
-0.119099, 0.8675482, 0.5791974, 0, 1, 0.6156863, 1,
-0.1186706, 1.634313, 0.8032414, 0, 1, 0.6235294, 1,
-0.1178781, -0.8563983, -2.560601, 0, 1, 0.627451, 1,
-0.1129715, -0.09165502, -2.386502, 0, 1, 0.6352941, 1,
-0.1126786, -0.6646386, -3.727775, 0, 1, 0.6392157, 1,
-0.1122794, -1.174214, -2.581488, 0, 1, 0.6470588, 1,
-0.1102833, -0.2610518, -1.237505, 0, 1, 0.6509804, 1,
-0.1082582, -0.883981, -2.393107, 0, 1, 0.6588235, 1,
-0.09879424, 1.74333, -0.9234651, 0, 1, 0.6627451, 1,
-0.09664617, 0.7052891, -0.386167, 0, 1, 0.6705883, 1,
-0.09546138, -0.009593536, -0.7824129, 0, 1, 0.6745098, 1,
-0.09019471, 0.3231795, 1.282449, 0, 1, 0.682353, 1,
-0.09014177, 0.1715835, 0.3795834, 0, 1, 0.6862745, 1,
-0.0893407, -1.096188, -4.139563, 0, 1, 0.6941177, 1,
-0.08918788, -1.706354, -3.493504, 0, 1, 0.7019608, 1,
-0.08897638, 0.779624, 0.7336476, 0, 1, 0.7058824, 1,
-0.08841944, -1.247181, -4.780528, 0, 1, 0.7137255, 1,
-0.08811644, -0.7967111, -3.207466, 0, 1, 0.7176471, 1,
-0.0781977, -1.269477, -2.202843, 0, 1, 0.7254902, 1,
-0.0763163, -1.207703, -5.019303, 0, 1, 0.7294118, 1,
-0.07348268, 1.105685, 1.150495, 0, 1, 0.7372549, 1,
-0.07108425, 0.8542908, 0.5144256, 0, 1, 0.7411765, 1,
-0.0693503, -0.372473, -2.955829, 0, 1, 0.7490196, 1,
-0.0688203, -0.2991921, -3.110869, 0, 1, 0.7529412, 1,
-0.06725892, 0.32793, 0.002242676, 0, 1, 0.7607843, 1,
-0.06110616, 0.5260623, 1.917928, 0, 1, 0.7647059, 1,
-0.05920898, 1.622657, 1.480575, 0, 1, 0.772549, 1,
-0.05453135, -0.1278443, -3.609849, 0, 1, 0.7764706, 1,
-0.0536073, 0.3806998, 0.04623351, 0, 1, 0.7843137, 1,
-0.05272469, -0.8811386, -3.575419, 0, 1, 0.7882353, 1,
-0.049408, 0.5486974, 0.5730983, 0, 1, 0.7960784, 1,
-0.04871944, -0.8897358, -2.919446, 0, 1, 0.8039216, 1,
-0.04602782, -1.037094, -5.009705, 0, 1, 0.8078431, 1,
-0.04197709, 0.3208447, -0.02161988, 0, 1, 0.8156863, 1,
-0.03966669, -0.8928994, -2.654132, 0, 1, 0.8196079, 1,
-0.039311, -0.3311354, -3.336297, 0, 1, 0.827451, 1,
-0.03044397, 2.451502, -0.3404095, 0, 1, 0.8313726, 1,
-0.02695628, -0.04506356, -1.839799, 0, 1, 0.8392157, 1,
-0.02677811, 1.37607, -1.46156, 0, 1, 0.8431373, 1,
-0.02611148, 0.1453391, -1.798863, 0, 1, 0.8509804, 1,
-0.02164423, 1.061725, -1.3436, 0, 1, 0.854902, 1,
-0.0178122, -1.297516, -2.221377, 0, 1, 0.8627451, 1,
-0.0138722, 0.3135633, -1.519382, 0, 1, 0.8666667, 1,
-0.01198663, -2.086285, -2.91341, 0, 1, 0.8745098, 1,
-0.01185618, 2.722263, 0.2508185, 0, 1, 0.8784314, 1,
-0.009473155, -1.816847, -1.058719, 0, 1, 0.8862745, 1,
-0.007282638, 0.73416, -0.719281, 0, 1, 0.8901961, 1,
-0.005531678, 0.9818616, 0.745047, 0, 1, 0.8980392, 1,
-0.004877928, 0.1406277, 1.264838, 0, 1, 0.9058824, 1,
-0.0007032664, 1.354894, 0.6586156, 0, 1, 0.9098039, 1,
0.001093819, -0.3285732, 4.005879, 0, 1, 0.9176471, 1,
0.009707091, -0.06814166, 2.719921, 0, 1, 0.9215686, 1,
0.0130616, 0.5916101, 0.3907396, 0, 1, 0.9294118, 1,
0.01622304, 0.611102, -2.152905, 0, 1, 0.9333333, 1,
0.02096471, 1.18477, -0.4066674, 0, 1, 0.9411765, 1,
0.02455386, -0.4477724, 3.153436, 0, 1, 0.945098, 1,
0.03040504, -0.669457, 3.957702, 0, 1, 0.9529412, 1,
0.03762061, 0.7213379, -0.6578357, 0, 1, 0.9568627, 1,
0.03772641, 0.0343241, -0.02722838, 0, 1, 0.9647059, 1,
0.03970221, -1.008948, 2.454621, 0, 1, 0.9686275, 1,
0.04178947, 1.914748, 0.2121548, 0, 1, 0.9764706, 1,
0.04315606, -1.065847, 3.060677, 0, 1, 0.9803922, 1,
0.04343149, 0.6436434, -1.119143, 0, 1, 0.9882353, 1,
0.04384241, 0.9635039, 0.9612627, 0, 1, 0.9921569, 1,
0.04385741, -2.580225, 3.86375, 0, 1, 1, 1,
0.04663455, 1.642161, 0.3772958, 0, 0.9921569, 1, 1,
0.04715787, -0.02226277, 4.487317, 0, 0.9882353, 1, 1,
0.0511388, 0.8554319, -0.1538717, 0, 0.9803922, 1, 1,
0.05263375, 0.8501434, 2.135983, 0, 0.9764706, 1, 1,
0.05475213, -1.175004, 3.508424, 0, 0.9686275, 1, 1,
0.05521879, -3.412996, 3.893749, 0, 0.9647059, 1, 1,
0.05723675, -0.1223126, 1.976695, 0, 0.9568627, 1, 1,
0.05812245, 0.6683441, -0.1904635, 0, 0.9529412, 1, 1,
0.05872792, -1.02295, 2.721959, 0, 0.945098, 1, 1,
0.05953237, -0.5006908, 3.630313, 0, 0.9411765, 1, 1,
0.05969916, -1.884688, 0.6579518, 0, 0.9333333, 1, 1,
0.06119263, -0.490285, 2.664606, 0, 0.9294118, 1, 1,
0.06375437, -0.8515637, 3.31021, 0, 0.9215686, 1, 1,
0.06401649, -0.03343137, 2.551866, 0, 0.9176471, 1, 1,
0.06557494, 1.040257, 2.218712, 0, 0.9098039, 1, 1,
0.06768023, -2.09152, 4.058057, 0, 0.9058824, 1, 1,
0.06801253, 0.5217844, 0.7515212, 0, 0.8980392, 1, 1,
0.07006445, 1.313217, 0.3660478, 0, 0.8901961, 1, 1,
0.07101902, 0.2698691, 1.418642, 0, 0.8862745, 1, 1,
0.07534726, 0.8112599, 2.286115, 0, 0.8784314, 1, 1,
0.07624643, 0.9455144, 0.2363667, 0, 0.8745098, 1, 1,
0.07672059, 0.3914053, -0.9009338, 0, 0.8666667, 1, 1,
0.07731348, -1.165943, 4.018503, 0, 0.8627451, 1, 1,
0.08155255, -1.578759, 3.335875, 0, 0.854902, 1, 1,
0.08848311, 1.563834, 1.66275, 0, 0.8509804, 1, 1,
0.08855345, -0.05927049, 1.786274, 0, 0.8431373, 1, 1,
0.09289352, 0.1557743, -1.490464, 0, 0.8392157, 1, 1,
0.09711542, -0.4134934, 3.026405, 0, 0.8313726, 1, 1,
0.1013629, 0.7763748, -1.311121, 0, 0.827451, 1, 1,
0.1025126, -0.3416451, 4.182882, 0, 0.8196079, 1, 1,
0.1039387, 0.8246435, -0.149254, 0, 0.8156863, 1, 1,
0.106093, -1.469029, 2.674046, 0, 0.8078431, 1, 1,
0.1083483, -0.4280449, 4.8809, 0, 0.8039216, 1, 1,
0.1110682, -2.111429, 3.762483, 0, 0.7960784, 1, 1,
0.1134713, -0.2256835, 3.60849, 0, 0.7882353, 1, 1,
0.1168487, 1.478181, 0.8446812, 0, 0.7843137, 1, 1,
0.1225681, 1.894738, 0.3768272, 0, 0.7764706, 1, 1,
0.1286398, -0.2287545, 1.746365, 0, 0.772549, 1, 1,
0.1312413, -0.1151829, 2.711381, 0, 0.7647059, 1, 1,
0.1345459, 0.4008143, 2.343918, 0, 0.7607843, 1, 1,
0.1360285, -1.6195, 2.60882, 0, 0.7529412, 1, 1,
0.1370346, -0.4917834, 2.747648, 0, 0.7490196, 1, 1,
0.1404131, 0.328825, 0.707745, 0, 0.7411765, 1, 1,
0.1438263, -0.5189887, 2.309738, 0, 0.7372549, 1, 1,
0.148298, 1.127373, 0.3029678, 0, 0.7294118, 1, 1,
0.1509382, -1.769376, 2.949174, 0, 0.7254902, 1, 1,
0.1527653, 1.292854, 0.2807432, 0, 0.7176471, 1, 1,
0.1567402, -0.4302461, 1.689036, 0, 0.7137255, 1, 1,
0.1581576, -0.4292104, 2.619228, 0, 0.7058824, 1, 1,
0.1612999, 1.37129, 1.129796, 0, 0.6980392, 1, 1,
0.1628546, 1.189561, -0.09384165, 0, 0.6941177, 1, 1,
0.1643528, 0.222091, 2.434542, 0, 0.6862745, 1, 1,
0.1713897, -1.01965, 1.710567, 0, 0.682353, 1, 1,
0.1735572, -1.81301, 3.312947, 0, 0.6745098, 1, 1,
0.1740438, 1.214642, 1.161321, 0, 0.6705883, 1, 1,
0.1760209, 0.9519352, -1.295666, 0, 0.6627451, 1, 1,
0.1795652, 0.5018131, 0.4027792, 0, 0.6588235, 1, 1,
0.1875494, -0.1005956, 3.273143, 0, 0.6509804, 1, 1,
0.1879314, 0.782728, -0.2659767, 0, 0.6470588, 1, 1,
0.2073206, -0.04941614, 1.750881, 0, 0.6392157, 1, 1,
0.2073725, 0.8156272, 0.007156754, 0, 0.6352941, 1, 1,
0.2077752, 0.9454938, 1.146331, 0, 0.627451, 1, 1,
0.2083706, 0.8074371, -1.406385, 0, 0.6235294, 1, 1,
0.2092337, -0.540418, 3.383091, 0, 0.6156863, 1, 1,
0.2134253, 1.013471, 0.6918768, 0, 0.6117647, 1, 1,
0.2144316, -1.002225, 2.262113, 0, 0.6039216, 1, 1,
0.214761, 2.018172, -0.3430947, 0, 0.5960785, 1, 1,
0.2164054, -0.4578587, 4.057949, 0, 0.5921569, 1, 1,
0.2173244, -0.4869977, 2.129417, 0, 0.5843138, 1, 1,
0.2216436, -0.3302945, 2.284277, 0, 0.5803922, 1, 1,
0.2217616, -0.6387221, 3.404161, 0, 0.572549, 1, 1,
0.2235538, 1.077553, -0.5718945, 0, 0.5686275, 1, 1,
0.2256254, 0.3118064, 1.594649, 0, 0.5607843, 1, 1,
0.2306138, 0.5911217, 0.3729686, 0, 0.5568628, 1, 1,
0.2309216, 0.2676128, -0.1243171, 0, 0.5490196, 1, 1,
0.2370182, 0.871092, 2.038558, 0, 0.5450981, 1, 1,
0.2395086, -0.7080439, 0.3224553, 0, 0.5372549, 1, 1,
0.2410385, 0.4111847, 0.4413377, 0, 0.5333334, 1, 1,
0.2437861, 0.3599654, 0.2026697, 0, 0.5254902, 1, 1,
0.2469614, -0.7182869, 4.679922, 0, 0.5215687, 1, 1,
0.2475104, -1.582951, 3.742532, 0, 0.5137255, 1, 1,
0.2536254, -0.9301271, 2.83621, 0, 0.509804, 1, 1,
0.2561601, 0.3240152, 0.5306976, 0, 0.5019608, 1, 1,
0.2627769, -0.3821143, 2.019955, 0, 0.4941176, 1, 1,
0.2709223, -0.4442796, 1.524922, 0, 0.4901961, 1, 1,
0.2714458, -0.2200988, 2.102826, 0, 0.4823529, 1, 1,
0.2747595, 0.8216226, -0.9695685, 0, 0.4784314, 1, 1,
0.2749216, -0.9660641, 2.514805, 0, 0.4705882, 1, 1,
0.2796085, 1.274466, 0.1078666, 0, 0.4666667, 1, 1,
0.2833211, 0.9976425, -0.9235528, 0, 0.4588235, 1, 1,
0.2837469, -0.5887019, 1.250328, 0, 0.454902, 1, 1,
0.2842624, -0.06401918, 2.463173, 0, 0.4470588, 1, 1,
0.2854019, -0.2204752, 0.9372842, 0, 0.4431373, 1, 1,
0.2868173, -1.087497, 2.93816, 0, 0.4352941, 1, 1,
0.2879393, -0.8297547, 1.374908, 0, 0.4313726, 1, 1,
0.2925495, -0.008501478, 1.220901, 0, 0.4235294, 1, 1,
0.2942763, 0.8647006, 0.1736237, 0, 0.4196078, 1, 1,
0.2950107, 0.2183101, 2.03275, 0, 0.4117647, 1, 1,
0.2966751, 1.041123, 0.6819674, 0, 0.4078431, 1, 1,
0.2967012, 0.8633319, 1.313793, 0, 0.4, 1, 1,
0.3018536, 0.2238161, 0.1295488, 0, 0.3921569, 1, 1,
0.3020647, 0.3045281, 1.283497, 0, 0.3882353, 1, 1,
0.3042123, 0.6053176, -1.709294, 0, 0.3803922, 1, 1,
0.3059105, 1.164391, 1.572118, 0, 0.3764706, 1, 1,
0.3136599, -1.465945, 3.281013, 0, 0.3686275, 1, 1,
0.3222277, 0.5121515, 0.385981, 0, 0.3647059, 1, 1,
0.3231065, 1.328121, -0.6966215, 0, 0.3568628, 1, 1,
0.3280888, -1.679873, 2.012229, 0, 0.3529412, 1, 1,
0.3282394, 1.017422, 0.9136735, 0, 0.345098, 1, 1,
0.3318962, -0.4412009, 2.135607, 0, 0.3411765, 1, 1,
0.3324787, -0.2578659, 2.627552, 0, 0.3333333, 1, 1,
0.3405347, 0.3490472, 0.3034548, 0, 0.3294118, 1, 1,
0.35236, 0.03566693, 2.426362, 0, 0.3215686, 1, 1,
0.3541372, -1.23762, 3.426336, 0, 0.3176471, 1, 1,
0.3562927, 0.3504234, 0.9279827, 0, 0.3098039, 1, 1,
0.356901, 0.727824, 0.809147, 0, 0.3058824, 1, 1,
0.3619209, 0.4764644, 1.931635, 0, 0.2980392, 1, 1,
0.3637746, 0.125277, 0.5699074, 0, 0.2901961, 1, 1,
0.3656773, -1.488657, 4.131448, 0, 0.2862745, 1, 1,
0.3668298, 0.866264, -0.638962, 0, 0.2784314, 1, 1,
0.3669657, -0.9900801, 1.557, 0, 0.2745098, 1, 1,
0.3700046, 0.218793, 1.138495, 0, 0.2666667, 1, 1,
0.3704329, -0.2142533, 2.902153, 0, 0.2627451, 1, 1,
0.3751673, 0.1182538, 0.15632, 0, 0.254902, 1, 1,
0.3756582, -0.3653977, 2.685331, 0, 0.2509804, 1, 1,
0.3804733, 1.025589, 1.408687, 0, 0.2431373, 1, 1,
0.381565, 0.05527713, 1.878481, 0, 0.2392157, 1, 1,
0.3819728, 0.3653783, -0.1586438, 0, 0.2313726, 1, 1,
0.3827763, 0.1885509, -0.5643906, 0, 0.227451, 1, 1,
0.3833704, -0.5876582, 2.676217, 0, 0.2196078, 1, 1,
0.3839159, -1.117149, 2.159544, 0, 0.2156863, 1, 1,
0.3891878, -0.2644536, 2.27412, 0, 0.2078431, 1, 1,
0.3921169, -1.88194, 4.062527, 0, 0.2039216, 1, 1,
0.3937639, 0.004504715, 2.732553, 0, 0.1960784, 1, 1,
0.3971997, -0.4824027, 2.107808, 0, 0.1882353, 1, 1,
0.3983047, 0.4791905, 2.923147, 0, 0.1843137, 1, 1,
0.4011073, 1.498682, 0.4383753, 0, 0.1764706, 1, 1,
0.4027562, -0.7644867, 1.789732, 0, 0.172549, 1, 1,
0.4052581, -0.2695223, 1.4157, 0, 0.1647059, 1, 1,
0.4119655, -0.217374, 2.305732, 0, 0.1607843, 1, 1,
0.413161, 1.930334, -0.2517946, 0, 0.1529412, 1, 1,
0.413786, 1.374073, 0.8581555, 0, 0.1490196, 1, 1,
0.4155317, -0.6868162, 2.458025, 0, 0.1411765, 1, 1,
0.4197798, 0.6719837, -1.995893, 0, 0.1372549, 1, 1,
0.4202988, 1.147616, 0.9144902, 0, 0.1294118, 1, 1,
0.4230859, 1.110979, -1.25873, 0, 0.1254902, 1, 1,
0.423332, 0.1498667, 1.986114, 0, 0.1176471, 1, 1,
0.4242314, 1.657131, -0.5564337, 0, 0.1137255, 1, 1,
0.4284777, 0.1123365, 2.854681, 0, 0.1058824, 1, 1,
0.4319636, 0.3585657, 0.004801143, 0, 0.09803922, 1, 1,
0.4349823, -0.3100976, 2.692277, 0, 0.09411765, 1, 1,
0.4356617, 1.084024, 0.317716, 0, 0.08627451, 1, 1,
0.4375187, 0.1280046, 3.11933, 0, 0.08235294, 1, 1,
0.4391216, 0.02784972, 0.7544355, 0, 0.07450981, 1, 1,
0.4394813, -0.2099343, 1.983409, 0, 0.07058824, 1, 1,
0.4442879, -1.445354, 1.888011, 0, 0.0627451, 1, 1,
0.4483134, -1.273327, 2.714671, 0, 0.05882353, 1, 1,
0.4561309, -0.2303063, 2.072077, 0, 0.05098039, 1, 1,
0.4565922, -0.7231638, 3.636112, 0, 0.04705882, 1, 1,
0.4577255, 1.880406, -0.06998759, 0, 0.03921569, 1, 1,
0.4614087, 0.8545779, 1.033374, 0, 0.03529412, 1, 1,
0.4620836, 0.2211562, 2.660943, 0, 0.02745098, 1, 1,
0.4629011, -0.06304787, 2.744489, 0, 0.02352941, 1, 1,
0.4662044, 0.4775072, -0.1647028, 0, 0.01568628, 1, 1,
0.4684356, -1.494326, 3.050786, 0, 0.01176471, 1, 1,
0.4702423, -0.9280724, 3.46425, 0, 0.003921569, 1, 1,
0.4720149, -1.8312, 3.444182, 0.003921569, 0, 1, 1,
0.4757636, -0.7276227, 0.3174422, 0.007843138, 0, 1, 1,
0.4760279, 0.7945905, 1.022776, 0.01568628, 0, 1, 1,
0.4766559, -0.2348071, 1.04035, 0.01960784, 0, 1, 1,
0.4842252, -0.9418555, 3.349533, 0.02745098, 0, 1, 1,
0.4947403, 0.4417009, 0.03622965, 0.03137255, 0, 1, 1,
0.4947731, 2.552929, 0.09668868, 0.03921569, 0, 1, 1,
0.4965332, -0.5072837, 2.144601, 0.04313726, 0, 1, 1,
0.4988307, 1.453778, 0.6548365, 0.05098039, 0, 1, 1,
0.5047658, -0.002017268, 1.480257, 0.05490196, 0, 1, 1,
0.5072328, -0.02026809, 1.398047, 0.0627451, 0, 1, 1,
0.508734, 0.2232752, 1.089332, 0.06666667, 0, 1, 1,
0.5112697, -0.8932501, 3.490104, 0.07450981, 0, 1, 1,
0.5117885, -0.03301156, 2.944628, 0.07843138, 0, 1, 1,
0.5124489, -0.7974311, 5.624119, 0.08627451, 0, 1, 1,
0.5161998, 0.5509908, -1.412848, 0.09019608, 0, 1, 1,
0.5202255, 1.234002, -0.9799032, 0.09803922, 0, 1, 1,
0.520898, 0.4453024, 1.399858, 0.1058824, 0, 1, 1,
0.5219078, 0.9232705, 0.5811736, 0.1098039, 0, 1, 1,
0.5269245, 0.2811198, 0.9134427, 0.1176471, 0, 1, 1,
0.5299172, -0.3604379, 0.1497296, 0.1215686, 0, 1, 1,
0.5356344, 1.084545, -0.8600334, 0.1294118, 0, 1, 1,
0.540743, 0.506475, 0.6978455, 0.1333333, 0, 1, 1,
0.5442144, 1.651241, -1.047616, 0.1411765, 0, 1, 1,
0.553646, 1.319708, 0.9401775, 0.145098, 0, 1, 1,
0.5542361, -0.8877065, 2.659046, 0.1529412, 0, 1, 1,
0.5573714, -0.2130088, 2.439799, 0.1568628, 0, 1, 1,
0.5728098, 0.05230538, 2.176461, 0.1647059, 0, 1, 1,
0.5791923, 1.238971, -0.1883488, 0.1686275, 0, 1, 1,
0.5797421, 0.4481402, 0.3847705, 0.1764706, 0, 1, 1,
0.5809454, 1.848279, -0.9861208, 0.1803922, 0, 1, 1,
0.58131, -0.3013172, 4.007483, 0.1882353, 0, 1, 1,
0.581752, -0.7273429, 3.627698, 0.1921569, 0, 1, 1,
0.5843069, 0.981251, 1.060119, 0.2, 0, 1, 1,
0.5871196, 1.740635, -1.892881, 0.2078431, 0, 1, 1,
0.587989, -2.02121, 4.035529, 0.2117647, 0, 1, 1,
0.5913246, 1.968927, 0.9420792, 0.2196078, 0, 1, 1,
0.5974404, 0.315338, 2.110965, 0.2235294, 0, 1, 1,
0.6025063, -0.4430988, 3.279418, 0.2313726, 0, 1, 1,
0.607697, -0.1508626, 2.446843, 0.2352941, 0, 1, 1,
0.6085983, -0.9095508, 2.831741, 0.2431373, 0, 1, 1,
0.6137072, 0.9622297, -0.9131569, 0.2470588, 0, 1, 1,
0.6137864, -0.9107283, 1.143827, 0.254902, 0, 1, 1,
0.6139727, -3.934141, 1.857145, 0.2588235, 0, 1, 1,
0.6148884, -0.01384382, 0.06471956, 0.2666667, 0, 1, 1,
0.6183941, -0.003269173, 1.520389, 0.2705882, 0, 1, 1,
0.6207026, 0.2001771, 0.3912781, 0.2784314, 0, 1, 1,
0.621537, -0.166444, 1.033261, 0.282353, 0, 1, 1,
0.624626, -0.1336297, 1.641649, 0.2901961, 0, 1, 1,
0.6274568, -0.08928508, 3.447218, 0.2941177, 0, 1, 1,
0.6277052, 1.156494, 1.503311, 0.3019608, 0, 1, 1,
0.6318775, -0.06001163, -0.05768933, 0.3098039, 0, 1, 1,
0.6334779, 2.355738, 0.8711829, 0.3137255, 0, 1, 1,
0.6348228, -2.353202, 1.930072, 0.3215686, 0, 1, 1,
0.635747, 0.4201587, 1.330742, 0.3254902, 0, 1, 1,
0.6392134, 0.09797908, 2.428899, 0.3333333, 0, 1, 1,
0.6404094, 1.712023, 1.439883, 0.3372549, 0, 1, 1,
0.6451474, -0.04175308, 0.6088735, 0.345098, 0, 1, 1,
0.6475008, -0.6210577, 3.715778, 0.3490196, 0, 1, 1,
0.648434, -1.996574, 2.211698, 0.3568628, 0, 1, 1,
0.6543676, 0.2360972, 1.871137, 0.3607843, 0, 1, 1,
0.6571983, 0.4199432, -0.05219923, 0.3686275, 0, 1, 1,
0.6592432, -0.8821334, 1.328542, 0.372549, 0, 1, 1,
0.6652239, -0.02416881, 1.850567, 0.3803922, 0, 1, 1,
0.6660419, 1.063324, -0.4590847, 0.3843137, 0, 1, 1,
0.6665465, 0.4027365, -0.1365277, 0.3921569, 0, 1, 1,
0.6722633, 0.05884637, 2.143622, 0.3960784, 0, 1, 1,
0.6723106, 0.9433929, -0.6852282, 0.4039216, 0, 1, 1,
0.6737897, 1.351758, -0.3558594, 0.4117647, 0, 1, 1,
0.6875569, 0.2251101, -0.3147912, 0.4156863, 0, 1, 1,
0.6894604, -0.07674626, 1.78834, 0.4235294, 0, 1, 1,
0.6908047, 0.7203126, -0.06109563, 0.427451, 0, 1, 1,
0.6921841, 1.642146, -1.44875, 0.4352941, 0, 1, 1,
0.6929691, 1.025029, 1.051314, 0.4392157, 0, 1, 1,
0.6939442, -1.767682, 2.500288, 0.4470588, 0, 1, 1,
0.6963509, 1.06448, 0.2258737, 0.4509804, 0, 1, 1,
0.6983185, -0.3021776, 4.771622, 0.4588235, 0, 1, 1,
0.7006326, -1.185312, 2.673981, 0.4627451, 0, 1, 1,
0.7017114, 0.1773753, 1.75991, 0.4705882, 0, 1, 1,
0.7092163, 0.2850562, 0.7744805, 0.4745098, 0, 1, 1,
0.7180464, -0.06555708, 0.3906287, 0.4823529, 0, 1, 1,
0.7297148, 0.615687, 3.128646, 0.4862745, 0, 1, 1,
0.7314002, 0.6372141, -0.2442136, 0.4941176, 0, 1, 1,
0.7339205, -1.474192, 1.189824, 0.5019608, 0, 1, 1,
0.7348753, 0.1771423, 2.299818, 0.5058824, 0, 1, 1,
0.7354553, 0.8081303, 1.212747, 0.5137255, 0, 1, 1,
0.7371205, -2.327849, 3.019393, 0.5176471, 0, 1, 1,
0.7406643, 0.3176456, 1.068661, 0.5254902, 0, 1, 1,
0.7413799, -0.5139356, 0.2893895, 0.5294118, 0, 1, 1,
0.7487695, 0.4220259, 1.725702, 0.5372549, 0, 1, 1,
0.75114, -0.1419312, 2.693952, 0.5411765, 0, 1, 1,
0.7533482, -0.8783655, 1.222796, 0.5490196, 0, 1, 1,
0.7581776, -0.06226053, 1.772517, 0.5529412, 0, 1, 1,
0.7649047, -0.1967354, 1.605063, 0.5607843, 0, 1, 1,
0.7652022, 0.1455296, 1.599855, 0.5647059, 0, 1, 1,
0.7656239, 0.3400288, 1.087869, 0.572549, 0, 1, 1,
0.76639, -0.7809827, 1.792132, 0.5764706, 0, 1, 1,
0.7680363, -0.1342518, 1.381361, 0.5843138, 0, 1, 1,
0.7698992, 0.4527639, 0.4146321, 0.5882353, 0, 1, 1,
0.7823941, -0.5679832, 2.79992, 0.5960785, 0, 1, 1,
0.7842695, -0.04932795, 2.133975, 0.6039216, 0, 1, 1,
0.7842866, 0.5421852, 0.9651113, 0.6078432, 0, 1, 1,
0.7897709, 0.2909194, 1.608632, 0.6156863, 0, 1, 1,
0.8006588, -0.9664906, 2.070604, 0.6196079, 0, 1, 1,
0.8016637, 0.4454737, 2.222832, 0.627451, 0, 1, 1,
0.8046657, -0.07677519, 1.589915, 0.6313726, 0, 1, 1,
0.8054295, -0.08351985, 2.426167, 0.6392157, 0, 1, 1,
0.8095434, 0.7284602, -0.660715, 0.6431373, 0, 1, 1,
0.8109685, -0.9813003, 3.648857, 0.6509804, 0, 1, 1,
0.8120693, 0.542188, 1.030629, 0.654902, 0, 1, 1,
0.8174261, 1.584875, 0.8743739, 0.6627451, 0, 1, 1,
0.8219637, 1.525324, 1.388539, 0.6666667, 0, 1, 1,
0.8220129, 0.3691026, 1.148339, 0.6745098, 0, 1, 1,
0.8234291, 1.314494, 0.1693021, 0.6784314, 0, 1, 1,
0.8304831, 0.2563735, 0.3848258, 0.6862745, 0, 1, 1,
0.8404304, -1.428775, 1.353237, 0.6901961, 0, 1, 1,
0.850062, 1.180621, 0.6056269, 0.6980392, 0, 1, 1,
0.8511189, 0.7092392, 2.638118, 0.7058824, 0, 1, 1,
0.8512223, 0.5877084, 1.461401, 0.7098039, 0, 1, 1,
0.8533478, 0.850719, -0.7718781, 0.7176471, 0, 1, 1,
0.853528, 0.3049476, -0.3167837, 0.7215686, 0, 1, 1,
0.8643568, 1.862122, -0.3000394, 0.7294118, 0, 1, 1,
0.8647183, -1.765719, 1.673686, 0.7333333, 0, 1, 1,
0.8672525, -0.6103375, 1.5489, 0.7411765, 0, 1, 1,
0.8748987, -0.5757163, 3.352957, 0.7450981, 0, 1, 1,
0.8762781, -0.3182706, 1.903135, 0.7529412, 0, 1, 1,
0.8822438, 0.471598, 1.086044, 0.7568628, 0, 1, 1,
0.8826742, -0.810604, 2.925454, 0.7647059, 0, 1, 1,
0.8912562, -0.7744296, 2.776376, 0.7686275, 0, 1, 1,
0.8917307, -0.004317748, 0.6588142, 0.7764706, 0, 1, 1,
0.8924189, 0.2803406, 3.068697, 0.7803922, 0, 1, 1,
0.8960052, -0.1378434, 1.458105, 0.7882353, 0, 1, 1,
0.8971796, 0.9075569, 0.4632287, 0.7921569, 0, 1, 1,
0.8982834, 0.2143043, 2.273667, 0.8, 0, 1, 1,
0.8995292, -0.9583731, 3.203156, 0.8078431, 0, 1, 1,
0.9004598, -0.244649, 1.906195, 0.8117647, 0, 1, 1,
0.9025888, -0.9215602, 2.355729, 0.8196079, 0, 1, 1,
0.9029124, -0.6794549, 2.170639, 0.8235294, 0, 1, 1,
0.9054717, -0.2322441, 2.331918, 0.8313726, 0, 1, 1,
0.9065114, 0.9245703, 1.225227, 0.8352941, 0, 1, 1,
0.9133309, -0.5275181, 3.885345, 0.8431373, 0, 1, 1,
0.913605, -0.04744513, -0.340826, 0.8470588, 0, 1, 1,
0.9193373, 1.388336, 0.7648692, 0.854902, 0, 1, 1,
0.921298, 0.3695516, 1.145397, 0.8588235, 0, 1, 1,
0.9273368, -0.3007612, 3.189789, 0.8666667, 0, 1, 1,
0.9285536, 1.198703, 1.344704, 0.8705882, 0, 1, 1,
0.9304018, -1.028409, 2.133632, 0.8784314, 0, 1, 1,
0.9365528, -0.1808043, 3.345093, 0.8823529, 0, 1, 1,
0.9477479, -1.24919, 2.42761, 0.8901961, 0, 1, 1,
0.9514349, -0.6210575, 3.292735, 0.8941177, 0, 1, 1,
0.9545308, 1.539568, 1.353017, 0.9019608, 0, 1, 1,
0.9570918, 0.1281362, 2.038488, 0.9098039, 0, 1, 1,
0.9619368, 0.5458758, -0.3033994, 0.9137255, 0, 1, 1,
0.9631891, -1.414317, 3.244959, 0.9215686, 0, 1, 1,
0.9631934, -0.2086966, 2.3001, 0.9254902, 0, 1, 1,
0.9659036, 0.1752841, 0.2390358, 0.9333333, 0, 1, 1,
0.969938, 0.6608805, -0.1797252, 0.9372549, 0, 1, 1,
0.9776033, 0.8225716, 0.05163677, 0.945098, 0, 1, 1,
0.9806027, -0.554431, 1.675683, 0.9490196, 0, 1, 1,
0.982106, 1.001743, 1.06286, 0.9568627, 0, 1, 1,
0.9853662, 1.822963, -0.6724237, 0.9607843, 0, 1, 1,
0.9861836, -0.696039, 2.279786, 0.9686275, 0, 1, 1,
0.9925597, 1.381082, 0.6296378, 0.972549, 0, 1, 1,
0.9935018, 0.1940657, 2.52732, 0.9803922, 0, 1, 1,
0.9972153, 0.5757006, 0.7985257, 0.9843137, 0, 1, 1,
0.9992161, -0.3837893, 1.897616, 0.9921569, 0, 1, 1,
0.9997376, -0.117576, 2.407445, 0.9960784, 0, 1, 1,
1.004512, 3.377484, 1.14544, 1, 0, 0.9960784, 1,
1.006962, 1.009758, 0.06930972, 1, 0, 0.9882353, 1,
1.008265, -1.354944, 2.295213, 1, 0, 0.9843137, 1,
1.023645, -0.2563404, 2.723371, 1, 0, 0.9764706, 1,
1.027264, 0.6825614, 0.5562594, 1, 0, 0.972549, 1,
1.028411, -0.06122467, 2.509971, 1, 0, 0.9647059, 1,
1.037023, -0.546525, 2.598427, 1, 0, 0.9607843, 1,
1.045882, -0.3389338, 2.06938, 1, 0, 0.9529412, 1,
1.046545, 0.1765022, 0.7438737, 1, 0, 0.9490196, 1,
1.048413, 3.057591, -0.5647983, 1, 0, 0.9411765, 1,
1.050897, -0.2525042, 1.171412, 1, 0, 0.9372549, 1,
1.053252, 0.1585111, 1.574477, 1, 0, 0.9294118, 1,
1.065405, 0.05822211, 1.960904, 1, 0, 0.9254902, 1,
1.06549, 1.294607, -0.9522875, 1, 0, 0.9176471, 1,
1.066231, -2.046036, 3.41202, 1, 0, 0.9137255, 1,
1.072395, 0.09225769, 1.626216, 1, 0, 0.9058824, 1,
1.080167, -1.137629, 2.090362, 1, 0, 0.9019608, 1,
1.083548, 0.4014578, 1.929378, 1, 0, 0.8941177, 1,
1.084426, 0.2785594, 1.347126, 1, 0, 0.8862745, 1,
1.086682, 0.5031268, -0.6751634, 1, 0, 0.8823529, 1,
1.089849, -0.1005421, 1.870611, 1, 0, 0.8745098, 1,
1.091801, 1.291861, 0.4874993, 1, 0, 0.8705882, 1,
1.104974, -1.252881, 2.627263, 1, 0, 0.8627451, 1,
1.11217, -0.315009, 3.337374, 1, 0, 0.8588235, 1,
1.112372, 0.8373839, -0.4699011, 1, 0, 0.8509804, 1,
1.113121, 0.5148651, 2.246898, 1, 0, 0.8470588, 1,
1.115519, -0.1063584, 1.690665, 1, 0, 0.8392157, 1,
1.116065, 0.6117813, 1.985911, 1, 0, 0.8352941, 1,
1.12503, -0.3938167, 2.665468, 1, 0, 0.827451, 1,
1.129694, 1.479464, 1.600003, 1, 0, 0.8235294, 1,
1.131674, -1.291901, 2.26937, 1, 0, 0.8156863, 1,
1.136404, -1.415505, 3.413489, 1, 0, 0.8117647, 1,
1.147651, -0.768878, 1.493606, 1, 0, 0.8039216, 1,
1.157792, -1.082851, 2.845358, 1, 0, 0.7960784, 1,
1.175926, 0.4865763, 0.2965201, 1, 0, 0.7921569, 1,
1.183765, -1.930155, 1.825131, 1, 0, 0.7843137, 1,
1.184186, 1.203347, 0.871416, 1, 0, 0.7803922, 1,
1.191055, 1.47242, 1.367366, 1, 0, 0.772549, 1,
1.19668, 0.1481354, 1.315612, 1, 0, 0.7686275, 1,
1.197361, 0.2051026, 1.656159, 1, 0, 0.7607843, 1,
1.198465, 0.1648421, 2.389753, 1, 0, 0.7568628, 1,
1.198585, -1.106197, 3.069643, 1, 0, 0.7490196, 1,
1.200777, 0.5638906, 0.5115526, 1, 0, 0.7450981, 1,
1.208836, -0.926029, 3.223138, 1, 0, 0.7372549, 1,
1.213408, 0.04049955, 1.468965, 1, 0, 0.7333333, 1,
1.21758, 0.465885, 1.045502, 1, 0, 0.7254902, 1,
1.219909, 0.08737892, 1.054829, 1, 0, 0.7215686, 1,
1.225151, 0.9517346, 0.8954998, 1, 0, 0.7137255, 1,
1.231474, -0.8067001, 2.657005, 1, 0, 0.7098039, 1,
1.231964, -0.5036831, 1.385687, 1, 0, 0.7019608, 1,
1.232051, 1.616612, 0.4787025, 1, 0, 0.6941177, 1,
1.233832, 1.40351, 2.538191, 1, 0, 0.6901961, 1,
1.241598, -0.8990573, 3.301781, 1, 0, 0.682353, 1,
1.242161, 0.3216848, 1.471582, 1, 0, 0.6784314, 1,
1.242457, 2.761053, -0.3494534, 1, 0, 0.6705883, 1,
1.253104, 0.2873996, 1.134144, 1, 0, 0.6666667, 1,
1.2576, -0.6840051, 2.381576, 1, 0, 0.6588235, 1,
1.265889, 1.769078, -0.4275503, 1, 0, 0.654902, 1,
1.267163, -0.994477, 2.775774, 1, 0, 0.6470588, 1,
1.268232, 1.53484, 0.4066806, 1, 0, 0.6431373, 1,
1.269053, 1.052434, 0.1639234, 1, 0, 0.6352941, 1,
1.270805, 1.613964, -0.1458521, 1, 0, 0.6313726, 1,
1.274653, -0.6319281, 2.494872, 1, 0, 0.6235294, 1,
1.279083, 0.0805966, 2.574283, 1, 0, 0.6196079, 1,
1.279618, -1.370591, 0.98803, 1, 0, 0.6117647, 1,
1.28978, 0.8168204, 0.7469567, 1, 0, 0.6078432, 1,
1.299958, 0.2466794, 0.899711, 1, 0, 0.6, 1,
1.306257, -1.03578, 2.06542, 1, 0, 0.5921569, 1,
1.307901, -3.030124, 3.749367, 1, 0, 0.5882353, 1,
1.308188, 1.142419, 1.541946, 1, 0, 0.5803922, 1,
1.314021, -1.022344, 1.728451, 1, 0, 0.5764706, 1,
1.315174, -0.5293894, 0.6713441, 1, 0, 0.5686275, 1,
1.319595, 0.6853333, 0.8325841, 1, 0, 0.5647059, 1,
1.321089, 0.01029697, 1.711588, 1, 0, 0.5568628, 1,
1.328756, -0.8251947, 2.259334, 1, 0, 0.5529412, 1,
1.345365, 0.1370392, 1.448931, 1, 0, 0.5450981, 1,
1.348425, 0.5166033, 1.117939, 1, 0, 0.5411765, 1,
1.35298, -0.4712617, 1.24228, 1, 0, 0.5333334, 1,
1.358609, 0.9100974, 2.698253, 1, 0, 0.5294118, 1,
1.380725, -0.8668787, 1.541135, 1, 0, 0.5215687, 1,
1.386203, 1.797771, 0.1896957, 1, 0, 0.5176471, 1,
1.392838, 0.153264, 0.6613945, 1, 0, 0.509804, 1,
1.398468, 0.7777982, 1.393767, 1, 0, 0.5058824, 1,
1.400198, 0.4971595, 0.3402485, 1, 0, 0.4980392, 1,
1.405727, -0.4960932, 2.502176, 1, 0, 0.4901961, 1,
1.427945, -0.03387797, 2.203284, 1, 0, 0.4862745, 1,
1.44427, 0.5671739, 3.192497, 1, 0, 0.4784314, 1,
1.460001, -2.083686, 1.87621, 1, 0, 0.4745098, 1,
1.464518, 0.2130891, 0.1807336, 1, 0, 0.4666667, 1,
1.46541, -0.2685111, 3.595254, 1, 0, 0.4627451, 1,
1.473705, -0.7197217, 0.4669614, 1, 0, 0.454902, 1,
1.477099, 0.6814142, 0.02226035, 1, 0, 0.4509804, 1,
1.48774, 1.134209, 1.013014, 1, 0, 0.4431373, 1,
1.488942, 1.458934, 1.049167, 1, 0, 0.4392157, 1,
1.497271, 0.4225758, 1.461524, 1, 0, 0.4313726, 1,
1.499029, 0.892957, 1.88149, 1, 0, 0.427451, 1,
1.505486, 0.3691241, 1.677098, 1, 0, 0.4196078, 1,
1.50866, 0.6540075, 2.228648, 1, 0, 0.4156863, 1,
1.51291, 0.3451006, -0.2358649, 1, 0, 0.4078431, 1,
1.528038, 0.1628086, 1.089106, 1, 0, 0.4039216, 1,
1.529312, 0.7084929, 0.2699489, 1, 0, 0.3960784, 1,
1.531624, -0.4894596, 3.089063, 1, 0, 0.3882353, 1,
1.532291, 0.5472059, 1.136069, 1, 0, 0.3843137, 1,
1.544656, -0.1415836, 2.698339, 1, 0, 0.3764706, 1,
1.553489, 0.1167223, 1.368754, 1, 0, 0.372549, 1,
1.557446, -0.1952612, 1.27374, 1, 0, 0.3647059, 1,
1.564276, 0.006577385, 0.4329297, 1, 0, 0.3607843, 1,
1.57382, -1.084575, 0.0951563, 1, 0, 0.3529412, 1,
1.581032, 0.728416, 0.3230345, 1, 0, 0.3490196, 1,
1.586375, -0.1649907, 0.3313881, 1, 0, 0.3411765, 1,
1.606116, -0.8900995, 0.3395484, 1, 0, 0.3372549, 1,
1.612804, -1.221877, 3.278141, 1, 0, 0.3294118, 1,
1.625733, -1.134119, 4.740307, 1, 0, 0.3254902, 1,
1.631261, -0.9390425, 2.477563, 1, 0, 0.3176471, 1,
1.643608, 1.105234, 2.640033, 1, 0, 0.3137255, 1,
1.64931, -1.155623, 3.242727, 1, 0, 0.3058824, 1,
1.658789, -0.5724514, 1.61136, 1, 0, 0.2980392, 1,
1.660806, 2.12364, 1.352789, 1, 0, 0.2941177, 1,
1.676358, -0.1136856, 1.732355, 1, 0, 0.2862745, 1,
1.677677, -1.766301, 2.636176, 1, 0, 0.282353, 1,
1.699001, -0.07764824, 0.4380903, 1, 0, 0.2745098, 1,
1.705637, 1.011709, 2.68763, 1, 0, 0.2705882, 1,
1.712807, -0.6076367, 2.139503, 1, 0, 0.2627451, 1,
1.730593, -2.335069, 2.688639, 1, 0, 0.2588235, 1,
1.751042, 0.3334828, 0.9042563, 1, 0, 0.2509804, 1,
1.782427, -1.321243, 3.975403, 1, 0, 0.2470588, 1,
1.807711, -0.7584056, 2.822968, 1, 0, 0.2392157, 1,
1.820431, -0.4299942, -0.7791141, 1, 0, 0.2352941, 1,
1.827573, 0.1429, 0.5489137, 1, 0, 0.227451, 1,
1.841065, -0.6869308, 0.5819118, 1, 0, 0.2235294, 1,
1.851895, -0.2420633, 1.861074, 1, 0, 0.2156863, 1,
1.860256, -0.8278774, 2.9357, 1, 0, 0.2117647, 1,
1.886109, 0.08359293, 3.164337, 1, 0, 0.2039216, 1,
1.896591, 0.614791, 1.524992, 1, 0, 0.1960784, 1,
1.904563, 0.9809483, 0.5753653, 1, 0, 0.1921569, 1,
1.908813, 2.552759, -0.21978, 1, 0, 0.1843137, 1,
1.923538, -0.1335999, 0.8790729, 1, 0, 0.1803922, 1,
1.925366, -1.120956, 2.036957, 1, 0, 0.172549, 1,
1.939055, 0.03511644, 1.139395, 1, 0, 0.1686275, 1,
1.941093, -0.4335031, 1.62496, 1, 0, 0.1607843, 1,
1.953845, 1.26087, 1.570359, 1, 0, 0.1568628, 1,
1.99398, -1.026417, 2.498057, 1, 0, 0.1490196, 1,
2.011758, 0.7215066, 1.808608, 1, 0, 0.145098, 1,
2.018642, 0.6579792, 1.842818, 1, 0, 0.1372549, 1,
2.027875, 0.2877211, 1.065284, 1, 0, 0.1333333, 1,
2.029928, -0.5988481, 0.905991, 1, 0, 0.1254902, 1,
2.045574, -0.3650444, 0.7298339, 1, 0, 0.1215686, 1,
2.048658, -2.092129, 4.704639, 1, 0, 0.1137255, 1,
2.051432, -0.1641298, 1.119943, 1, 0, 0.1098039, 1,
2.066981, -1.861905, 2.650118, 1, 0, 0.1019608, 1,
2.099857, 1.402975, 0.8111435, 1, 0, 0.09411765, 1,
2.140527, 0.6811771, 0.1745843, 1, 0, 0.09019608, 1,
2.166254, 0.6627668, -1.011814, 1, 0, 0.08235294, 1,
2.195303, 0.07866944, 1.411638, 1, 0, 0.07843138, 1,
2.278534, 1.341776, 0.2064667, 1, 0, 0.07058824, 1,
2.279041, -0.007385766, 3.035156, 1, 0, 0.06666667, 1,
2.350592, -0.3411479, 3.407136, 1, 0, 0.05882353, 1,
2.381787, -0.4944806, -0.4663278, 1, 0, 0.05490196, 1,
2.395052, 0.2690285, 0.005554083, 1, 0, 0.04705882, 1,
2.481663, 0.05278083, 1.675869, 1, 0, 0.04313726, 1,
2.500337, 0.447351, 0.9115, 1, 0, 0.03529412, 1,
2.559947, -1.518046, 2.333461, 1, 0, 0.03137255, 1,
2.841759, 0.5694305, 0.9271542, 1, 0, 0.02352941, 1,
3.099533, 0.9757648, 0.5641334, 1, 0, 0.01960784, 1,
3.111507, -0.5890213, 1.796131, 1, 0, 0.01176471, 1,
3.258671, 0.03276896, 1.835833, 1, 0, 0.007843138, 1
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
0.1332364, -5.173462, -7.493147, 0, -0.5, 0.5, 0.5,
0.1332364, -5.173462, -7.493147, 1, -0.5, 0.5, 0.5,
0.1332364, -5.173462, -7.493147, 1, 1.5, 0.5, 0.5,
0.1332364, -5.173462, -7.493147, 0, 1.5, 0.5, 0.5
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
-4.05172, -0.2783288, -7.493147, 0, -0.5, 0.5, 0.5,
-4.05172, -0.2783288, -7.493147, 1, -0.5, 0.5, 0.5,
-4.05172, -0.2783288, -7.493147, 1, 1.5, 0.5, 0.5,
-4.05172, -0.2783288, -7.493147, 0, 1.5, 0.5, 0.5
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
-4.05172, -5.173462, 0.01605296, 0, -0.5, 0.5, 0.5,
-4.05172, -5.173462, 0.01605296, 1, -0.5, 0.5, 0.5,
-4.05172, -5.173462, 0.01605296, 1, 1.5, 0.5, 0.5,
-4.05172, -5.173462, 0.01605296, 0, 1.5, 0.5, 0.5
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
-2, -4.043816, -5.760255,
3, -4.043816, -5.760255,
-2, -4.043816, -5.760255,
-2, -4.23209, -6.04907,
-1, -4.043816, -5.760255,
-1, -4.23209, -6.04907,
0, -4.043816, -5.760255,
0, -4.23209, -6.04907,
1, -4.043816, -5.760255,
1, -4.23209, -6.04907,
2, -4.043816, -5.760255,
2, -4.23209, -6.04907,
3, -4.043816, -5.760255,
3, -4.23209, -6.04907
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
-2, -4.608639, -6.626701, 0, -0.5, 0.5, 0.5,
-2, -4.608639, -6.626701, 1, -0.5, 0.5, 0.5,
-2, -4.608639, -6.626701, 1, 1.5, 0.5, 0.5,
-2, -4.608639, -6.626701, 0, 1.5, 0.5, 0.5,
-1, -4.608639, -6.626701, 0, -0.5, 0.5, 0.5,
-1, -4.608639, -6.626701, 1, -0.5, 0.5, 0.5,
-1, -4.608639, -6.626701, 1, 1.5, 0.5, 0.5,
-1, -4.608639, -6.626701, 0, 1.5, 0.5, 0.5,
0, -4.608639, -6.626701, 0, -0.5, 0.5, 0.5,
0, -4.608639, -6.626701, 1, -0.5, 0.5, 0.5,
0, -4.608639, -6.626701, 1, 1.5, 0.5, 0.5,
0, -4.608639, -6.626701, 0, 1.5, 0.5, 0.5,
1, -4.608639, -6.626701, 0, -0.5, 0.5, 0.5,
1, -4.608639, -6.626701, 1, -0.5, 0.5, 0.5,
1, -4.608639, -6.626701, 1, 1.5, 0.5, 0.5,
1, -4.608639, -6.626701, 0, 1.5, 0.5, 0.5,
2, -4.608639, -6.626701, 0, -0.5, 0.5, 0.5,
2, -4.608639, -6.626701, 1, -0.5, 0.5, 0.5,
2, -4.608639, -6.626701, 1, 1.5, 0.5, 0.5,
2, -4.608639, -6.626701, 0, 1.5, 0.5, 0.5,
3, -4.608639, -6.626701, 0, -0.5, 0.5, 0.5,
3, -4.608639, -6.626701, 1, -0.5, 0.5, 0.5,
3, -4.608639, -6.626701, 1, 1.5, 0.5, 0.5,
3, -4.608639, -6.626701, 0, 1.5, 0.5, 0.5
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
-3.085961, -2, -5.760255,
-3.085961, 2, -5.760255,
-3.085961, -2, -5.760255,
-3.246921, -2, -6.04907,
-3.085961, 0, -5.760255,
-3.246921, 0, -6.04907,
-3.085961, 2, -5.760255,
-3.246921, 2, -6.04907
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
-3.568841, -2, -6.626701, 0, -0.5, 0.5, 0.5,
-3.568841, -2, -6.626701, 1, -0.5, 0.5, 0.5,
-3.568841, -2, -6.626701, 1, 1.5, 0.5, 0.5,
-3.568841, -2, -6.626701, 0, 1.5, 0.5, 0.5,
-3.568841, 0, -6.626701, 0, -0.5, 0.5, 0.5,
-3.568841, 0, -6.626701, 1, -0.5, 0.5, 0.5,
-3.568841, 0, -6.626701, 1, 1.5, 0.5, 0.5,
-3.568841, 0, -6.626701, 0, 1.5, 0.5, 0.5,
-3.568841, 2, -6.626701, 0, -0.5, 0.5, 0.5,
-3.568841, 2, -6.626701, 1, -0.5, 0.5, 0.5,
-3.568841, 2, -6.626701, 1, 1.5, 0.5, 0.5,
-3.568841, 2, -6.626701, 0, 1.5, 0.5, 0.5
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
-3.085961, -4.043816, -4,
-3.085961, -4.043816, 4,
-3.085961, -4.043816, -4,
-3.246921, -4.23209, -4,
-3.085961, -4.043816, -2,
-3.246921, -4.23209, -2,
-3.085961, -4.043816, 0,
-3.246921, -4.23209, 0,
-3.085961, -4.043816, 2,
-3.246921, -4.23209, 2,
-3.085961, -4.043816, 4,
-3.246921, -4.23209, 4
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
-3.568841, -4.608639, -4, 0, -0.5, 0.5, 0.5,
-3.568841, -4.608639, -4, 1, -0.5, 0.5, 0.5,
-3.568841, -4.608639, -4, 1, 1.5, 0.5, 0.5,
-3.568841, -4.608639, -4, 0, 1.5, 0.5, 0.5,
-3.568841, -4.608639, -2, 0, -0.5, 0.5, 0.5,
-3.568841, -4.608639, -2, 1, -0.5, 0.5, 0.5,
-3.568841, -4.608639, -2, 1, 1.5, 0.5, 0.5,
-3.568841, -4.608639, -2, 0, 1.5, 0.5, 0.5,
-3.568841, -4.608639, 0, 0, -0.5, 0.5, 0.5,
-3.568841, -4.608639, 0, 1, -0.5, 0.5, 0.5,
-3.568841, -4.608639, 0, 1, 1.5, 0.5, 0.5,
-3.568841, -4.608639, 0, 0, 1.5, 0.5, 0.5,
-3.568841, -4.608639, 2, 0, -0.5, 0.5, 0.5,
-3.568841, -4.608639, 2, 1, -0.5, 0.5, 0.5,
-3.568841, -4.608639, 2, 1, 1.5, 0.5, 0.5,
-3.568841, -4.608639, 2, 0, 1.5, 0.5, 0.5,
-3.568841, -4.608639, 4, 0, -0.5, 0.5, 0.5,
-3.568841, -4.608639, 4, 1, -0.5, 0.5, 0.5,
-3.568841, -4.608639, 4, 1, 1.5, 0.5, 0.5,
-3.568841, -4.608639, 4, 0, 1.5, 0.5, 0.5
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
-3.085961, -4.043816, -5.760255,
-3.085961, 3.487158, -5.760255,
-3.085961, -4.043816, 5.792361,
-3.085961, 3.487158, 5.792361,
-3.085961, -4.043816, -5.760255,
-3.085961, -4.043816, 5.792361,
-3.085961, 3.487158, -5.760255,
-3.085961, 3.487158, 5.792361,
-3.085961, -4.043816, -5.760255,
3.352434, -4.043816, -5.760255,
-3.085961, -4.043816, 5.792361,
3.352434, -4.043816, 5.792361,
-3.085961, 3.487158, -5.760255,
3.352434, 3.487158, -5.760255,
-3.085961, 3.487158, 5.792361,
3.352434, 3.487158, 5.792361,
3.352434, -4.043816, -5.760255,
3.352434, 3.487158, -5.760255,
3.352434, -4.043816, 5.792361,
3.352434, 3.487158, 5.792361,
3.352434, -4.043816, -5.760255,
3.352434, -4.043816, 5.792361,
3.352434, 3.487158, -5.760255,
3.352434, 3.487158, 5.792361
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
var radius = 8.126887;
var distance = 36.15744;
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
mvMatrix.translate( -0.1332364, 0.2783288, -0.01605296 );
mvMatrix.scale( 1.364773, 1.166775, 0.7606026 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.15744);
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
bialaphos<-read.table("bialaphos.xyz")
```

```
## Error in read.table("bialaphos.xyz"): no lines available in input
```

```r
x<-bialaphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'bialaphos' not found
```

```r
y<-bialaphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'bialaphos' not found
```

```r
z<-bialaphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'bialaphos' not found
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
-2.992198, -0.9683194, -0.9037056, 0, 0, 1, 1, 1,
-2.761847, -0.1463493, -1.482153, 1, 0, 0, 1, 1,
-2.624306, 0.5567814, -1.452617, 1, 0, 0, 1, 1,
-2.614315, -0.3267502, -1.570068, 1, 0, 0, 1, 1,
-2.606582, 0.311157, -1.534882, 1, 0, 0, 1, 1,
-2.523145, -0.712068, -1.99235, 1, 0, 0, 1, 1,
-2.510692, -1.376333, -2.048423, 0, 0, 0, 1, 1,
-2.490778, -1.508263, -1.141993, 0, 0, 0, 1, 1,
-2.455312, -0.05820197, -2.095818, 0, 0, 0, 1, 1,
-2.427383, 0.521622, -1.184926, 0, 0, 0, 1, 1,
-2.40001, -0.914431, -0.7351789, 0, 0, 0, 1, 1,
-2.352629, -0.6519449, -2.082466, 0, 0, 0, 1, 1,
-2.337329, -0.06368541, -2.938704, 0, 0, 0, 1, 1,
-2.322247, -0.2077996, -1.451489, 1, 1, 1, 1, 1,
-2.306265, 1.171071, -0.006054555, 1, 1, 1, 1, 1,
-2.266853, -1.908528, -1.717927, 1, 1, 1, 1, 1,
-2.245113, -0.5798874, -2.711169, 1, 1, 1, 1, 1,
-2.239668, 0.1454213, -1.51203, 1, 1, 1, 1, 1,
-2.204278, -0.750083, -1.691455, 1, 1, 1, 1, 1,
-2.190836, 0.3011586, -3.266815, 1, 1, 1, 1, 1,
-2.152236, -0.04684798, -1.020209, 1, 1, 1, 1, 1,
-2.111557, -0.1158411, -2.536822, 1, 1, 1, 1, 1,
-2.098151, -0.94653, -0.6674788, 1, 1, 1, 1, 1,
-2.092361, -1.951641, -2.512659, 1, 1, 1, 1, 1,
-2.089523, -1.702065, -3.083633, 1, 1, 1, 1, 1,
-2.074766, -0.5819738, 0.2261073, 1, 1, 1, 1, 1,
-2.07292, 0.2585235, -2.923305, 1, 1, 1, 1, 1,
-2.011643, 0.1458893, -1.290862, 1, 1, 1, 1, 1,
-1.970321, 1.291366, -0.3457528, 0, 0, 1, 1, 1,
-1.968518, 0.4135762, -1.611354, 1, 0, 0, 1, 1,
-1.941392, -0.5314164, -1.277205, 1, 0, 0, 1, 1,
-1.931168, -0.1821146, -1.394995, 1, 0, 0, 1, 1,
-1.89945, 0.9432716, -2.611052, 1, 0, 0, 1, 1,
-1.890117, 0.1319768, -0.1673247, 1, 0, 0, 1, 1,
-1.881778, -0.8293928, -2.402754, 0, 0, 0, 1, 1,
-1.874682, 0.4489262, -2.248651, 0, 0, 0, 1, 1,
-1.811567, 0.3937777, -0.4542386, 0, 0, 0, 1, 1,
-1.807309, -0.5810705, -1.947124, 0, 0, 0, 1, 1,
-1.797152, -0.9717304, -1.039778, 0, 0, 0, 1, 1,
-1.778068, 0.218349, -1.959494, 0, 0, 0, 1, 1,
-1.762867, -0.1560684, -1.344958, 0, 0, 0, 1, 1,
-1.73703, 0.02777966, -0.8421519, 1, 1, 1, 1, 1,
-1.728909, 0.912003, -2.430372, 1, 1, 1, 1, 1,
-1.715205, 0.08127224, -0.5916722, 1, 1, 1, 1, 1,
-1.695806, -1.821555, -2.740331, 1, 1, 1, 1, 1,
-1.689034, 0.698303, -0.6932979, 1, 1, 1, 1, 1,
-1.679223, 1.135079, -1.722348, 1, 1, 1, 1, 1,
-1.678452, -0.7494028, -0.823666, 1, 1, 1, 1, 1,
-1.678084, 0.5755396, -1.21313, 1, 1, 1, 1, 1,
-1.665687, -0.4486247, -1.916937, 1, 1, 1, 1, 1,
-1.630386, 0.05812256, -0.688556, 1, 1, 1, 1, 1,
-1.624017, -0.9445488, -1.375251, 1, 1, 1, 1, 1,
-1.600749, 0.03094055, -0.7700828, 1, 1, 1, 1, 1,
-1.594438, -1.733431, -1.193094, 1, 1, 1, 1, 1,
-1.594234, -1.220185, -0.8030951, 1, 1, 1, 1, 1,
-1.591449, 0.4401553, -1.012475, 1, 1, 1, 1, 1,
-1.589259, -1.048227, -0.6611933, 0, 0, 1, 1, 1,
-1.573581, 0.867693, -2.634526, 1, 0, 0, 1, 1,
-1.571541, 0.4494045, -0.2366379, 1, 0, 0, 1, 1,
-1.565752, 0.08298571, 0.2012477, 1, 0, 0, 1, 1,
-1.546431, 0.4376361, -0.1633092, 1, 0, 0, 1, 1,
-1.543704, -0.861559, -3.831705, 1, 0, 0, 1, 1,
-1.538934, -0.1502799, -0.6109716, 0, 0, 0, 1, 1,
-1.534525, 1.070378, 0.2551949, 0, 0, 0, 1, 1,
-1.533102, -0.6153302, -0.8958787, 0, 0, 0, 1, 1,
-1.530952, 0.01027225, -0.07497969, 0, 0, 0, 1, 1,
-1.522452, 0.9863681, -1.150563, 0, 0, 0, 1, 1,
-1.509699, -0.4130392, -0.6001912, 0, 0, 0, 1, 1,
-1.50182, -0.1646907, -2.490784, 0, 0, 0, 1, 1,
-1.472936, -0.5652446, -1.406868, 1, 1, 1, 1, 1,
-1.472045, -1.652818, -1.363837, 1, 1, 1, 1, 1,
-1.468728, 0.4824749, -2.865687, 1, 1, 1, 1, 1,
-1.444383, 1.609394, -1.969896, 1, 1, 1, 1, 1,
-1.437061, 0.7413931, -1.275295, 1, 1, 1, 1, 1,
-1.434376, 0.4027903, -0.6944604, 1, 1, 1, 1, 1,
-1.433337, -0.304438, -1.530976, 1, 1, 1, 1, 1,
-1.430293, 0.03378781, -0.8721304, 1, 1, 1, 1, 1,
-1.429609, 0.2352824, -1.155945, 1, 1, 1, 1, 1,
-1.421816, -0.8857737, -0.8376857, 1, 1, 1, 1, 1,
-1.419742, -1.078877, -3.427702, 1, 1, 1, 1, 1,
-1.417593, 0.7163627, -0.7594878, 1, 1, 1, 1, 1,
-1.415547, 1.029383, -1.011585, 1, 1, 1, 1, 1,
-1.398967, 2.100553, -0.9035487, 1, 1, 1, 1, 1,
-1.393794, -0.2843299, -0.3812766, 1, 1, 1, 1, 1,
-1.381646, -0.6839747, -2.27875, 0, 0, 1, 1, 1,
-1.375282, -0.6481823, -3.637691, 1, 0, 0, 1, 1,
-1.369516, 0.5321463, -1.928574, 1, 0, 0, 1, 1,
-1.358344, -2.318811, -3.700586, 1, 0, 0, 1, 1,
-1.353561, -1.96788, -0.8901165, 1, 0, 0, 1, 1,
-1.340716, -0.5610171, -3.200196, 1, 0, 0, 1, 1,
-1.334044, -0.2228965, -2.300516, 0, 0, 0, 1, 1,
-1.32569, 0.6627851, -1.633999, 0, 0, 0, 1, 1,
-1.322851, -1.446928, -1.785485, 0, 0, 0, 1, 1,
-1.318174, -1.201538, -2.144477, 0, 0, 0, 1, 1,
-1.314309, 1.873186, -1.198565, 0, 0, 0, 1, 1,
-1.314279, -1.264478, -2.846773, 0, 0, 0, 1, 1,
-1.313304, -0.9889723, -0.6106567, 0, 0, 0, 1, 1,
-1.303872, 0.0963881, -1.180131, 1, 1, 1, 1, 1,
-1.303452, -0.9788256, -1.671545, 1, 1, 1, 1, 1,
-1.301153, -0.4550162, -1.719683, 1, 1, 1, 1, 1,
-1.297819, -0.695108, -2.381463, 1, 1, 1, 1, 1,
-1.295251, -0.5714657, 0.2915081, 1, 1, 1, 1, 1,
-1.272471, -1.936482, -1.046474, 1, 1, 1, 1, 1,
-1.252683, -0.3828098, -0.9920745, 1, 1, 1, 1, 1,
-1.245385, 1.118696, -2.1405, 1, 1, 1, 1, 1,
-1.24099, -0.2981598, -1.907853, 1, 1, 1, 1, 1,
-1.233905, 0.3887779, -0.2738617, 1, 1, 1, 1, 1,
-1.225579, -1.291407, -1.422861, 1, 1, 1, 1, 1,
-1.219121, 0.1305712, -2.689561, 1, 1, 1, 1, 1,
-1.21585, 0.4776558, -2.449088, 1, 1, 1, 1, 1,
-1.211795, -0.2257175, -1.661043, 1, 1, 1, 1, 1,
-1.202752, 0.9149587, -1.103489, 1, 1, 1, 1, 1,
-1.181419, -0.7506181, -1.96464, 0, 0, 1, 1, 1,
-1.179511, 2.031676, -0.2957416, 1, 0, 0, 1, 1,
-1.173796, 0.07220882, -2.098132, 1, 0, 0, 1, 1,
-1.160468, 1.812445, -0.5488341, 1, 0, 0, 1, 1,
-1.159368, 1.069468, -0.4691136, 1, 0, 0, 1, 1,
-1.159256, -1.250825, -2.902409, 1, 0, 0, 1, 1,
-1.154627, 0.09482361, -1.086178, 0, 0, 0, 1, 1,
-1.153985, -1.894898, -1.832092, 0, 0, 0, 1, 1,
-1.152479, -1.123239, -1.568855, 0, 0, 0, 1, 1,
-1.147241, 0.6031265, 0.2983046, 0, 0, 0, 1, 1,
-1.142055, -1.42445, -3.365186, 0, 0, 0, 1, 1,
-1.141424, 0.1581004, -1.455592, 0, 0, 0, 1, 1,
-1.135634, 1.652982, -1.571878, 0, 0, 0, 1, 1,
-1.126932, 0.8758701, -2.106794, 1, 1, 1, 1, 1,
-1.119115, -1.432094, -1.981845, 1, 1, 1, 1, 1,
-1.116092, -1.227484, -3.407921, 1, 1, 1, 1, 1,
-1.115106, 1.080925, 0.4363268, 1, 1, 1, 1, 1,
-1.114713, 0.004195314, -2.240353, 1, 1, 1, 1, 1,
-1.110034, 0.009322717, -2.094046, 1, 1, 1, 1, 1,
-1.108881, -0.1206486, -2.933984, 1, 1, 1, 1, 1,
-1.099536, -0.1875551, -3.283937, 1, 1, 1, 1, 1,
-1.099032, -1.084658, -1.644045, 1, 1, 1, 1, 1,
-1.096658, -0.3102956, -1.740153, 1, 1, 1, 1, 1,
-1.086571, -0.06780972, -2.088966, 1, 1, 1, 1, 1,
-1.081552, -1.145712, -2.66549, 1, 1, 1, 1, 1,
-1.080308, -0.4432741, -2.300438, 1, 1, 1, 1, 1,
-1.079337, -1.337906, -3.651756, 1, 1, 1, 1, 1,
-1.071526, 0.2631596, -2.044522, 1, 1, 1, 1, 1,
-1.070066, -1.132326, 0.4609032, 0, 0, 1, 1, 1,
-1.069626, -0.4353174, -4.032927, 1, 0, 0, 1, 1,
-1.066497, 0.2551609, -3.050434, 1, 0, 0, 1, 1,
-1.035036, 1.011434, -0.4391293, 1, 0, 0, 1, 1,
-1.031934, 1.353554, -1.012041, 1, 0, 0, 1, 1,
-1.026322, -0.6484702, -1.775554, 1, 0, 0, 1, 1,
-1.02086, 0.3486101, -0.3682173, 0, 0, 0, 1, 1,
-1.017825, 0.4543441, -2.219836, 0, 0, 0, 1, 1,
-1.013355, 0.2226835, -1.852731, 0, 0, 0, 1, 1,
-1.009786, -0.5706714, -1.55136, 0, 0, 0, 1, 1,
-0.9975205, 1.584676, -1.749295, 0, 0, 0, 1, 1,
-0.9859907, -0.6653905, -0.4683705, 0, 0, 0, 1, 1,
-0.9824086, 0.6207552, -2.097125, 0, 0, 0, 1, 1,
-0.9743471, 0.6170679, -0.8033677, 1, 1, 1, 1, 1,
-0.968119, -1.490923, -1.44612, 1, 1, 1, 1, 1,
-0.96096, -0.3993775, -2.009829, 1, 1, 1, 1, 1,
-0.9587823, 0.06062097, -1.441206, 1, 1, 1, 1, 1,
-0.954243, -0.1876427, -2.535815, 1, 1, 1, 1, 1,
-0.9522731, 0.4838923, -0.7541624, 1, 1, 1, 1, 1,
-0.9485648, -0.7990401, -3.119142, 1, 1, 1, 1, 1,
-0.9480153, 0.2488418, -0.8495373, 1, 1, 1, 1, 1,
-0.947521, 0.9530901, -0.02524976, 1, 1, 1, 1, 1,
-0.9467214, 0.4774894, -2.443129, 1, 1, 1, 1, 1,
-0.9392515, 1.075111, -1.384172, 1, 1, 1, 1, 1,
-0.9365259, 0.3200286, -0.6639084, 1, 1, 1, 1, 1,
-0.9348004, 1.004788, -1.087267, 1, 1, 1, 1, 1,
-0.9318923, -0.8682206, 0.4166586, 1, 1, 1, 1, 1,
-0.9312746, -0.8589031, -2.853522, 1, 1, 1, 1, 1,
-0.9306197, -1.333755, -1.462719, 0, 0, 1, 1, 1,
-0.9245955, -0.3784582, -1.202509, 1, 0, 0, 1, 1,
-0.9221675, 1.94827, 0.8006864, 1, 0, 0, 1, 1,
-0.9110122, 0.1091667, -0.2557321, 1, 0, 0, 1, 1,
-0.8943768, 0.3152493, 0.2686544, 1, 0, 0, 1, 1,
-0.8768355, -0.2316027, -0.04128271, 1, 0, 0, 1, 1,
-0.8686974, 1.200848, -1.178433, 0, 0, 0, 1, 1,
-0.8637451, 0.001520299, -0.6563169, 0, 0, 0, 1, 1,
-0.8636737, -0.1745242, -1.005754, 0, 0, 0, 1, 1,
-0.8635168, 0.5760831, -1.682085, 0, 0, 0, 1, 1,
-0.8551915, 0.59796, -1.302647, 0, 0, 0, 1, 1,
-0.8490719, -0.09276638, -1.915634, 0, 0, 0, 1, 1,
-0.834589, 0.7598997, -2.036525, 0, 0, 0, 1, 1,
-0.8307341, 1.518024, -0.3140101, 1, 1, 1, 1, 1,
-0.8299017, -1.491992, -4.085079, 1, 1, 1, 1, 1,
-0.8270472, 1.852933, -2.032063, 1, 1, 1, 1, 1,
-0.8262714, -0.001748556, -1.76793, 1, 1, 1, 1, 1,
-0.8262057, -1.40568, -2.349426, 1, 1, 1, 1, 1,
-0.8240905, -0.704936, -2.013009, 1, 1, 1, 1, 1,
-0.821234, 0.237561, 1.678713, 1, 1, 1, 1, 1,
-0.8192647, -0.461265, -2.65027, 1, 1, 1, 1, 1,
-0.8135127, -0.4699486, -2.385041, 1, 1, 1, 1, 1,
-0.8116685, 0.7947752, 0.3336567, 1, 1, 1, 1, 1,
-0.8109901, -0.07341104, -2.612628, 1, 1, 1, 1, 1,
-0.8098093, -0.1512503, -2.658311, 1, 1, 1, 1, 1,
-0.8096156, 1.163164, 0.4792879, 1, 1, 1, 1, 1,
-0.8074639, 0.3735272, -1.06446, 1, 1, 1, 1, 1,
-0.806923, -0.8201326, -2.414235, 1, 1, 1, 1, 1,
-0.8059207, -0.8182726, -2.655535, 0, 0, 1, 1, 1,
-0.8045053, -0.2900916, -1.339499, 1, 0, 0, 1, 1,
-0.8028244, 0.7127764, -0.2720482, 1, 0, 0, 1, 1,
-0.7989032, 1.056703, 0.4223585, 1, 0, 0, 1, 1,
-0.7985642, -1.636538, -1.246688, 1, 0, 0, 1, 1,
-0.7898441, -0.02569631, -0.8590763, 1, 0, 0, 1, 1,
-0.7893693, 0.1042228, -1.356175, 0, 0, 0, 1, 1,
-0.7803817, 0.3015322, -1.81101, 0, 0, 0, 1, 1,
-0.775411, 0.90166, 0.34646, 0, 0, 0, 1, 1,
-0.7717048, 0.3772719, -1.565574, 0, 0, 0, 1, 1,
-0.7676672, -0.2593314, -2.017424, 0, 0, 0, 1, 1,
-0.7655886, -0.06444117, -3.462607, 0, 0, 0, 1, 1,
-0.7633045, -1.170018, -0.9288277, 0, 0, 0, 1, 1,
-0.762453, -2.555472, -2.967371, 1, 1, 1, 1, 1,
-0.7589165, 0.3578993, -0.4251087, 1, 1, 1, 1, 1,
-0.7552859, -1.377576, -2.114365, 1, 1, 1, 1, 1,
-0.7541822, -1.788117, -1.669015, 1, 1, 1, 1, 1,
-0.7541481, 1.490673, -0.287685, 1, 1, 1, 1, 1,
-0.7533026, -0.6123037, -1.49194, 1, 1, 1, 1, 1,
-0.7508631, -1.097405, -2.777819, 1, 1, 1, 1, 1,
-0.7480428, 0.5210661, 1.2904, 1, 1, 1, 1, 1,
-0.7463582, -1.549478, -3.564284, 1, 1, 1, 1, 1,
-0.7416579, 0.9440723, -1.118021, 1, 1, 1, 1, 1,
-0.7400776, 1.833583, -0.7674031, 1, 1, 1, 1, 1,
-0.7395269, -0.4272835, -3.103371, 1, 1, 1, 1, 1,
-0.7361947, -0.6305333, -0.9914591, 1, 1, 1, 1, 1,
-0.7238197, -0.3531606, -2.392912, 1, 1, 1, 1, 1,
-0.7225552, -0.4598802, -2.620333, 1, 1, 1, 1, 1,
-0.7171496, -1.600226, -2.555953, 0, 0, 1, 1, 1,
-0.7095019, 0.3576997, 0.5303926, 1, 0, 0, 1, 1,
-0.7064135, -0.9241088, -3.268555, 1, 0, 0, 1, 1,
-0.6957918, -0.7067365, -2.316483, 1, 0, 0, 1, 1,
-0.6925305, 1.263862, -1.009222, 1, 0, 0, 1, 1,
-0.6912254, 1.14972, -2.820181, 1, 0, 0, 1, 1,
-0.6893379, -1.966206, -2.799819, 0, 0, 0, 1, 1,
-0.6872709, -0.0794142, -1.873378, 0, 0, 0, 1, 1,
-0.6866815, 1.320695, -1.322406, 0, 0, 0, 1, 1,
-0.67816, 0.3742736, -0.3492621, 0, 0, 0, 1, 1,
-0.6750131, 0.4249053, -0.06967084, 0, 0, 0, 1, 1,
-0.6734657, 1.10986, 1.924841, 0, 0, 0, 1, 1,
-0.6732143, 0.6233642, -0.1927602, 0, 0, 0, 1, 1,
-0.6723478, -3.061501, -2.700315, 1, 1, 1, 1, 1,
-0.6700348, -1.482721, -3.159535, 1, 1, 1, 1, 1,
-0.6649601, -0.5293261, -2.390178, 1, 1, 1, 1, 1,
-0.6619749, -0.7104264, -2.421957, 1, 1, 1, 1, 1,
-0.6581997, 0.5750488, -2.157395, 1, 1, 1, 1, 1,
-0.657544, -0.5983156, -1.736031, 1, 1, 1, 1, 1,
-0.6567895, 0.1028222, -3.18916, 1, 1, 1, 1, 1,
-0.6472305, -0.7427161, -3.023952, 1, 1, 1, 1, 1,
-0.6466765, 1.129184, -0.6510696, 1, 1, 1, 1, 1,
-0.6453752, -0.05491425, -3.231178, 1, 1, 1, 1, 1,
-0.6395922, -1.637675, -2.475578, 1, 1, 1, 1, 1,
-0.6395164, 1.658107, -1.329065, 1, 1, 1, 1, 1,
-0.6388333, 1.037566, -3.004872, 1, 1, 1, 1, 1,
-0.6358863, -0.1456175, -1.725895, 1, 1, 1, 1, 1,
-0.6318462, 1.118295, -0.1526692, 1, 1, 1, 1, 1,
-0.6294898, -0.4395735, -0.3041948, 0, 0, 1, 1, 1,
-0.6230966, -0.4917537, -3.425823, 1, 0, 0, 1, 1,
-0.6198232, 0.6266546, -1.745622, 1, 0, 0, 1, 1,
-0.618876, -0.9334162, -2.988118, 1, 0, 0, 1, 1,
-0.6188205, 1.292997, 0.9961959, 1, 0, 0, 1, 1,
-0.6168125, -0.6643201, -1.213437, 1, 0, 0, 1, 1,
-0.615339, 0.1563543, -1.363732, 0, 0, 0, 1, 1,
-0.6106237, -0.7986312, -1.42296, 0, 0, 0, 1, 1,
-0.6097873, 0.00831037, -1.162554, 0, 0, 0, 1, 1,
-0.609081, 1.012677, 1.40396, 0, 0, 0, 1, 1,
-0.6073732, -0.7009975, -2.580353, 0, 0, 0, 1, 1,
-0.6069686, -0.8189221, -2.704356, 0, 0, 0, 1, 1,
-0.6059625, -1.519114, -4.111314, 0, 0, 0, 1, 1,
-0.6057452, 1.1531, -1.551678, 1, 1, 1, 1, 1,
-0.6035637, -2.692182, -3.091247, 1, 1, 1, 1, 1,
-0.5963954, -1.56756, -3.545468, 1, 1, 1, 1, 1,
-0.5952133, -1.610109, -2.720203, 1, 1, 1, 1, 1,
-0.5949191, 0.2373205, 1.650981, 1, 1, 1, 1, 1,
-0.5861444, 0.1045074, -0.02936523, 1, 1, 1, 1, 1,
-0.5823097, 3.304896, -1.087689, 1, 1, 1, 1, 1,
-0.5785016, -1.17642, -2.622829, 1, 1, 1, 1, 1,
-0.5739836, -0.4566647, -1.978625, 1, 1, 1, 1, 1,
-0.572215, 0.01440876, -0.706541, 1, 1, 1, 1, 1,
-0.5588681, 2.439298, 1.225608, 1, 1, 1, 1, 1,
-0.558397, 0.8710655, -0.253037, 1, 1, 1, 1, 1,
-0.5578022, -0.1833791, -0.787905, 1, 1, 1, 1, 1,
-0.5554861, -0.2674172, -1.615076, 1, 1, 1, 1, 1,
-0.5536534, 0.2463607, -3.054706, 1, 1, 1, 1, 1,
-0.5534965, -1.030216, -3.596283, 0, 0, 1, 1, 1,
-0.5522487, -0.4409657, -2.357872, 1, 0, 0, 1, 1,
-0.5505772, -0.8924072, -2.953139, 1, 0, 0, 1, 1,
-0.5503809, -0.4785068, -1.113754, 1, 0, 0, 1, 1,
-0.5478051, -0.08250783, -1.65021, 1, 0, 0, 1, 1,
-0.5455501, -1.190168, -2.339669, 1, 0, 0, 1, 1,
-0.5427728, 0.1711708, -2.280054, 0, 0, 0, 1, 1,
-0.5345576, -0.1667497, -0.1853421, 0, 0, 0, 1, 1,
-0.5288671, -0.6238385, -2.384219, 0, 0, 0, 1, 1,
-0.5274218, 0.03735633, -1.993904, 0, 0, 0, 1, 1,
-0.5159425, -0.4443572, -1.248983, 0, 0, 0, 1, 1,
-0.5078322, 0.7705877, -0.4320498, 0, 0, 0, 1, 1,
-0.5041171, -0.3037783, -2.513482, 0, 0, 0, 1, 1,
-0.5039728, -1.056292, -0.7049419, 1, 1, 1, 1, 1,
-0.5026088, 0.6262363, -0.6517102, 1, 1, 1, 1, 1,
-0.496843, 0.1385942, -0.6310643, 1, 1, 1, 1, 1,
-0.4926377, -0.02912903, -2.97932, 1, 1, 1, 1, 1,
-0.4918025, -1.886448, -2.909341, 1, 1, 1, 1, 1,
-0.4887115, 1.913485, -0.6000409, 1, 1, 1, 1, 1,
-0.4860881, 0.3441218, -0.9592356, 1, 1, 1, 1, 1,
-0.4824628, -0.6769294, -5.092257, 1, 1, 1, 1, 1,
-0.481686, 0.7490687, -0.7870502, 1, 1, 1, 1, 1,
-0.4782853, -0.5812861, -2.471875, 1, 1, 1, 1, 1,
-0.47738, -2.215446, -2.37917, 1, 1, 1, 1, 1,
-0.4729725, 1.16245, -1.167834, 1, 1, 1, 1, 1,
-0.4704299, 0.473804, -1.538008, 1, 1, 1, 1, 1,
-0.4607061, -0.5900782, -2.527093, 1, 1, 1, 1, 1,
-0.4593386, -0.7389227, -1.690993, 1, 1, 1, 1, 1,
-0.4587514, -0.1879165, -2.925386, 0, 0, 1, 1, 1,
-0.4573668, 1.119564, 0.1626111, 1, 0, 0, 1, 1,
-0.4563693, 0.8595961, -1.010614, 1, 0, 0, 1, 1,
-0.4541175, 0.3833214, -1.197452, 1, 0, 0, 1, 1,
-0.4540361, 0.2836759, -0.9011721, 1, 0, 0, 1, 1,
-0.4514632, 0.2162794, -0.7500666, 1, 0, 0, 1, 1,
-0.4507698, 1.464243, 0.07616338, 0, 0, 0, 1, 1,
-0.4500979, -0.2460319, -3.955046, 0, 0, 0, 1, 1,
-0.4494705, -2.696164, -2.222982, 0, 0, 0, 1, 1,
-0.4398093, -1.554894, -3.605718, 0, 0, 0, 1, 1,
-0.4358381, 0.347147, -0.5564274, 0, 0, 0, 1, 1,
-0.4310454, 1.124111, 0.4597225, 0, 0, 0, 1, 1,
-0.4267129, 0.2493201, 0.4609134, 0, 0, 0, 1, 1,
-0.4261824, -0.4553391, -1.132711, 1, 1, 1, 1, 1,
-0.4255311, -0.2755716, -0.7194286, 1, 1, 1, 1, 1,
-0.42429, -0.3697929, -2.623363, 1, 1, 1, 1, 1,
-0.4186163, -0.805003, -2.605777, 1, 1, 1, 1, 1,
-0.4170773, 0.2235648, 0.2194304, 1, 1, 1, 1, 1,
-0.4168602, -0.6000846, -5.040359, 1, 1, 1, 1, 1,
-0.41567, -2.174164, -4.137624, 1, 1, 1, 1, 1,
-0.4081008, 1.706767, 0.2807, 1, 1, 1, 1, 1,
-0.4052293, -0.6304559, -4.03807, 1, 1, 1, 1, 1,
-0.4046254, 1.0667, 0.211409, 1, 1, 1, 1, 1,
-0.4026584, -0.4239961, -2.428677, 1, 1, 1, 1, 1,
-0.397665, 2.007004, 0.1809508, 1, 1, 1, 1, 1,
-0.3950883, -1.042391, -4.074108, 1, 1, 1, 1, 1,
-0.3897401, 0.6563311, 0.606803, 1, 1, 1, 1, 1,
-0.3891066, 0.5576383, -1.146439, 1, 1, 1, 1, 1,
-0.3863458, 0.8448806, 0.3243043, 0, 0, 1, 1, 1,
-0.3843297, 0.8618997, -0.2061675, 1, 0, 0, 1, 1,
-0.3799984, -2.422153, -3.649718, 1, 0, 0, 1, 1,
-0.376667, 0.8957084, -0.3103684, 1, 0, 0, 1, 1,
-0.3755952, 0.01644039, -1.471315, 1, 0, 0, 1, 1,
-0.3742083, 0.5094641, 0.5214711, 1, 0, 0, 1, 1,
-0.3682951, -0.1333493, -1.151379, 0, 0, 0, 1, 1,
-0.3660213, -0.3020629, -2.975902, 0, 0, 0, 1, 1,
-0.3654633, -1.215444, -3.887265, 0, 0, 0, 1, 1,
-0.3644141, -1.108747, -5.592013, 0, 0, 0, 1, 1,
-0.358675, 1.494115, -0.3589393, 0, 0, 0, 1, 1,
-0.3557759, 0.6526338, -0.02338417, 0, 0, 0, 1, 1,
-0.3529536, 2.325004, -0.3704974, 0, 0, 0, 1, 1,
-0.347348, -0.002846579, 0.4018128, 1, 1, 1, 1, 1,
-0.3445523, 2.187115, -1.18611, 1, 1, 1, 1, 1,
-0.3389867, 0.7261232, -0.6607524, 1, 1, 1, 1, 1,
-0.3371001, -0.5021951, -0.8187494, 1, 1, 1, 1, 1,
-0.3353305, -0.8721205, -3.423063, 1, 1, 1, 1, 1,
-0.3345606, 0.3171985, -1.058941, 1, 1, 1, 1, 1,
-0.3330482, -1.044228, -2.921864, 1, 1, 1, 1, 1,
-0.3328668, 0.7972305, -0.4990686, 1, 1, 1, 1, 1,
-0.3326946, -0.09944691, -2.694118, 1, 1, 1, 1, 1,
-0.3260503, -1.111409, -2.608419, 1, 1, 1, 1, 1,
-0.3253028, 0.2913365, -1.595431, 1, 1, 1, 1, 1,
-0.318986, 1.194094, -0.8578463, 1, 1, 1, 1, 1,
-0.3158648, -1.349748, -2.607762, 1, 1, 1, 1, 1,
-0.3077112, 0.4075956, -1.230555, 1, 1, 1, 1, 1,
-0.3067907, 0.7521244, 1.85211, 1, 1, 1, 1, 1,
-0.3060647, -1.263535, -3.360119, 0, 0, 1, 1, 1,
-0.2984211, -3.097682, -3.122737, 1, 0, 0, 1, 1,
-0.2970311, 1.535842, -0.8375762, 1, 0, 0, 1, 1,
-0.2970258, 0.2038149, -0.1890412, 1, 0, 0, 1, 1,
-0.2935386, -0.9738543, -3.400051, 1, 0, 0, 1, 1,
-0.2927865, -0.2179088, -1.740309, 1, 0, 0, 1, 1,
-0.2915663, 0.9845691, -0.3074919, 0, 0, 0, 1, 1,
-0.2902283, 0.9134469, 0.9869233, 0, 0, 0, 1, 1,
-0.28912, 0.9800647, 0.9703483, 0, 0, 0, 1, 1,
-0.2878498, -1.057696, -1.953951, 0, 0, 0, 1, 1,
-0.2875645, 2.113203, 0.6562768, 0, 0, 0, 1, 1,
-0.2854649, 0.4701766, -0.6068255, 0, 0, 0, 1, 1,
-0.2841807, -0.6264517, -2.704283, 0, 0, 0, 1, 1,
-0.2820281, -0.2870896, -0.9611522, 1, 1, 1, 1, 1,
-0.281998, -0.2475167, -2.766796, 1, 1, 1, 1, 1,
-0.280568, 0.1829977, -3.100601, 1, 1, 1, 1, 1,
-0.2769434, -0.6340854, -3.300881, 1, 1, 1, 1, 1,
-0.2754533, -0.4044621, -3.419096, 1, 1, 1, 1, 1,
-0.2706628, -1.065099, -3.542835, 1, 1, 1, 1, 1,
-0.2672784, 0.3732785, 0.458404, 1, 1, 1, 1, 1,
-0.2670637, 0.03915458, -2.430881, 1, 1, 1, 1, 1,
-0.2664764, 2.021431, -0.7374162, 1, 1, 1, 1, 1,
-0.2570951, -0.4749966, -4.343416, 1, 1, 1, 1, 1,
-0.2562837, -0.7363319, -3.73156, 1, 1, 1, 1, 1,
-0.2555037, -0.7721046, -2.154852, 1, 1, 1, 1, 1,
-0.2549172, -2.454851, -3.319961, 1, 1, 1, 1, 1,
-0.2543792, 0.06982245, -1.464737, 1, 1, 1, 1, 1,
-0.2527119, -0.1637732, -2.279528, 1, 1, 1, 1, 1,
-0.2522963, -1.347132, -3.155564, 0, 0, 1, 1, 1,
-0.2521316, -1.109601, -2.700422, 1, 0, 0, 1, 1,
-0.2520028, -2.713194, -3.306731, 1, 0, 0, 1, 1,
-0.2519394, 0.607784, -1.458757, 1, 0, 0, 1, 1,
-0.2488324, 0.352617, -2.24601, 1, 0, 0, 1, 1,
-0.2467502, -0.7722669, -3.395406, 1, 0, 0, 1, 1,
-0.2449417, -0.1500265, -3.280364, 0, 0, 0, 1, 1,
-0.2439916, 0.1652965, -0.02470402, 0, 0, 0, 1, 1,
-0.241511, -0.2608657, -1.613014, 0, 0, 0, 1, 1,
-0.2385957, 0.9183013, 0.4559867, 0, 0, 0, 1, 1,
-0.2380074, -0.9419457, -1.049937, 0, 0, 0, 1, 1,
-0.2340677, 1.1262, 0.7256483, 0, 0, 0, 1, 1,
-0.2339512, -0.159784, -3.189602, 0, 0, 0, 1, 1,
-0.2331785, -0.6658257, -4.410941, 1, 1, 1, 1, 1,
-0.2258704, 1.587783, -0.7220943, 1, 1, 1, 1, 1,
-0.2216653, 0.5065262, -0.06884508, 1, 1, 1, 1, 1,
-0.2183184, -1.464684, -2.497516, 1, 1, 1, 1, 1,
-0.2110794, -0.6761174, -2.020749, 1, 1, 1, 1, 1,
-0.2007919, 1.310869, -0.9911894, 1, 1, 1, 1, 1,
-0.1935978, 1.474258, -1.026399, 1, 1, 1, 1, 1,
-0.1835176, -0.2036673, -4.327742, 1, 1, 1, 1, 1,
-0.18183, -0.8245418, -3.198578, 1, 1, 1, 1, 1,
-0.1717183, -0.6008086, -2.053267, 1, 1, 1, 1, 1,
-0.1697775, -0.3251319, -2.510002, 1, 1, 1, 1, 1,
-0.1665702, 1.045063, -0.6548496, 1, 1, 1, 1, 1,
-0.1665688, -0.5477116, -2.620195, 1, 1, 1, 1, 1,
-0.1620906, -2.818825, -2.898538, 1, 1, 1, 1, 1,
-0.1578353, -0.04401682, -2.656061, 1, 1, 1, 1, 1,
-0.1555485, -1.461271, -3.355152, 0, 0, 1, 1, 1,
-0.1537845, -0.06781818, -1.625508, 1, 0, 0, 1, 1,
-0.1490685, -0.07730354, -2.478324, 1, 0, 0, 1, 1,
-0.1489734, 0.6027284, 0.2794423, 1, 0, 0, 1, 1,
-0.1438476, -0.00168353, -2.086791, 1, 0, 0, 1, 1,
-0.1425765, 0.01058453, -1.483066, 1, 0, 0, 1, 1,
-0.1400259, -1.499425, -2.299623, 0, 0, 0, 1, 1,
-0.1397691, 0.8145319, -0.2685069, 0, 0, 0, 1, 1,
-0.1322444, -3.193704, -3.861008, 0, 0, 0, 1, 1,
-0.1279603, -0.2002937, -3.151736, 0, 0, 0, 1, 1,
-0.1278381, -0.03500139, -3.024495, 0, 0, 0, 1, 1,
-0.1255316, 0.7699052, -0.03434244, 0, 0, 0, 1, 1,
-0.1217002, -1.432317, -4.307961, 0, 0, 0, 1, 1,
-0.1210284, 1.762618, 0.0192737, 1, 1, 1, 1, 1,
-0.12029, 1.937444, -0.2446374, 1, 1, 1, 1, 1,
-0.1195962, -0.8077837, -1.691079, 1, 1, 1, 1, 1,
-0.119099, 0.8675482, 0.5791974, 1, 1, 1, 1, 1,
-0.1186706, 1.634313, 0.8032414, 1, 1, 1, 1, 1,
-0.1178781, -0.8563983, -2.560601, 1, 1, 1, 1, 1,
-0.1129715, -0.09165502, -2.386502, 1, 1, 1, 1, 1,
-0.1126786, -0.6646386, -3.727775, 1, 1, 1, 1, 1,
-0.1122794, -1.174214, -2.581488, 1, 1, 1, 1, 1,
-0.1102833, -0.2610518, -1.237505, 1, 1, 1, 1, 1,
-0.1082582, -0.883981, -2.393107, 1, 1, 1, 1, 1,
-0.09879424, 1.74333, -0.9234651, 1, 1, 1, 1, 1,
-0.09664617, 0.7052891, -0.386167, 1, 1, 1, 1, 1,
-0.09546138, -0.009593536, -0.7824129, 1, 1, 1, 1, 1,
-0.09019471, 0.3231795, 1.282449, 1, 1, 1, 1, 1,
-0.09014177, 0.1715835, 0.3795834, 0, 0, 1, 1, 1,
-0.0893407, -1.096188, -4.139563, 1, 0, 0, 1, 1,
-0.08918788, -1.706354, -3.493504, 1, 0, 0, 1, 1,
-0.08897638, 0.779624, 0.7336476, 1, 0, 0, 1, 1,
-0.08841944, -1.247181, -4.780528, 1, 0, 0, 1, 1,
-0.08811644, -0.7967111, -3.207466, 1, 0, 0, 1, 1,
-0.0781977, -1.269477, -2.202843, 0, 0, 0, 1, 1,
-0.0763163, -1.207703, -5.019303, 0, 0, 0, 1, 1,
-0.07348268, 1.105685, 1.150495, 0, 0, 0, 1, 1,
-0.07108425, 0.8542908, 0.5144256, 0, 0, 0, 1, 1,
-0.0693503, -0.372473, -2.955829, 0, 0, 0, 1, 1,
-0.0688203, -0.2991921, -3.110869, 0, 0, 0, 1, 1,
-0.06725892, 0.32793, 0.002242676, 0, 0, 0, 1, 1,
-0.06110616, 0.5260623, 1.917928, 1, 1, 1, 1, 1,
-0.05920898, 1.622657, 1.480575, 1, 1, 1, 1, 1,
-0.05453135, -0.1278443, -3.609849, 1, 1, 1, 1, 1,
-0.0536073, 0.3806998, 0.04623351, 1, 1, 1, 1, 1,
-0.05272469, -0.8811386, -3.575419, 1, 1, 1, 1, 1,
-0.049408, 0.5486974, 0.5730983, 1, 1, 1, 1, 1,
-0.04871944, -0.8897358, -2.919446, 1, 1, 1, 1, 1,
-0.04602782, -1.037094, -5.009705, 1, 1, 1, 1, 1,
-0.04197709, 0.3208447, -0.02161988, 1, 1, 1, 1, 1,
-0.03966669, -0.8928994, -2.654132, 1, 1, 1, 1, 1,
-0.039311, -0.3311354, -3.336297, 1, 1, 1, 1, 1,
-0.03044397, 2.451502, -0.3404095, 1, 1, 1, 1, 1,
-0.02695628, -0.04506356, -1.839799, 1, 1, 1, 1, 1,
-0.02677811, 1.37607, -1.46156, 1, 1, 1, 1, 1,
-0.02611148, 0.1453391, -1.798863, 1, 1, 1, 1, 1,
-0.02164423, 1.061725, -1.3436, 0, 0, 1, 1, 1,
-0.0178122, -1.297516, -2.221377, 1, 0, 0, 1, 1,
-0.0138722, 0.3135633, -1.519382, 1, 0, 0, 1, 1,
-0.01198663, -2.086285, -2.91341, 1, 0, 0, 1, 1,
-0.01185618, 2.722263, 0.2508185, 1, 0, 0, 1, 1,
-0.009473155, -1.816847, -1.058719, 1, 0, 0, 1, 1,
-0.007282638, 0.73416, -0.719281, 0, 0, 0, 1, 1,
-0.005531678, 0.9818616, 0.745047, 0, 0, 0, 1, 1,
-0.004877928, 0.1406277, 1.264838, 0, 0, 0, 1, 1,
-0.0007032664, 1.354894, 0.6586156, 0, 0, 0, 1, 1,
0.001093819, -0.3285732, 4.005879, 0, 0, 0, 1, 1,
0.009707091, -0.06814166, 2.719921, 0, 0, 0, 1, 1,
0.0130616, 0.5916101, 0.3907396, 0, 0, 0, 1, 1,
0.01622304, 0.611102, -2.152905, 1, 1, 1, 1, 1,
0.02096471, 1.18477, -0.4066674, 1, 1, 1, 1, 1,
0.02455386, -0.4477724, 3.153436, 1, 1, 1, 1, 1,
0.03040504, -0.669457, 3.957702, 1, 1, 1, 1, 1,
0.03762061, 0.7213379, -0.6578357, 1, 1, 1, 1, 1,
0.03772641, 0.0343241, -0.02722838, 1, 1, 1, 1, 1,
0.03970221, -1.008948, 2.454621, 1, 1, 1, 1, 1,
0.04178947, 1.914748, 0.2121548, 1, 1, 1, 1, 1,
0.04315606, -1.065847, 3.060677, 1, 1, 1, 1, 1,
0.04343149, 0.6436434, -1.119143, 1, 1, 1, 1, 1,
0.04384241, 0.9635039, 0.9612627, 1, 1, 1, 1, 1,
0.04385741, -2.580225, 3.86375, 1, 1, 1, 1, 1,
0.04663455, 1.642161, 0.3772958, 1, 1, 1, 1, 1,
0.04715787, -0.02226277, 4.487317, 1, 1, 1, 1, 1,
0.0511388, 0.8554319, -0.1538717, 1, 1, 1, 1, 1,
0.05263375, 0.8501434, 2.135983, 0, 0, 1, 1, 1,
0.05475213, -1.175004, 3.508424, 1, 0, 0, 1, 1,
0.05521879, -3.412996, 3.893749, 1, 0, 0, 1, 1,
0.05723675, -0.1223126, 1.976695, 1, 0, 0, 1, 1,
0.05812245, 0.6683441, -0.1904635, 1, 0, 0, 1, 1,
0.05872792, -1.02295, 2.721959, 1, 0, 0, 1, 1,
0.05953237, -0.5006908, 3.630313, 0, 0, 0, 1, 1,
0.05969916, -1.884688, 0.6579518, 0, 0, 0, 1, 1,
0.06119263, -0.490285, 2.664606, 0, 0, 0, 1, 1,
0.06375437, -0.8515637, 3.31021, 0, 0, 0, 1, 1,
0.06401649, -0.03343137, 2.551866, 0, 0, 0, 1, 1,
0.06557494, 1.040257, 2.218712, 0, 0, 0, 1, 1,
0.06768023, -2.09152, 4.058057, 0, 0, 0, 1, 1,
0.06801253, 0.5217844, 0.7515212, 1, 1, 1, 1, 1,
0.07006445, 1.313217, 0.3660478, 1, 1, 1, 1, 1,
0.07101902, 0.2698691, 1.418642, 1, 1, 1, 1, 1,
0.07534726, 0.8112599, 2.286115, 1, 1, 1, 1, 1,
0.07624643, 0.9455144, 0.2363667, 1, 1, 1, 1, 1,
0.07672059, 0.3914053, -0.9009338, 1, 1, 1, 1, 1,
0.07731348, -1.165943, 4.018503, 1, 1, 1, 1, 1,
0.08155255, -1.578759, 3.335875, 1, 1, 1, 1, 1,
0.08848311, 1.563834, 1.66275, 1, 1, 1, 1, 1,
0.08855345, -0.05927049, 1.786274, 1, 1, 1, 1, 1,
0.09289352, 0.1557743, -1.490464, 1, 1, 1, 1, 1,
0.09711542, -0.4134934, 3.026405, 1, 1, 1, 1, 1,
0.1013629, 0.7763748, -1.311121, 1, 1, 1, 1, 1,
0.1025126, -0.3416451, 4.182882, 1, 1, 1, 1, 1,
0.1039387, 0.8246435, -0.149254, 1, 1, 1, 1, 1,
0.106093, -1.469029, 2.674046, 0, 0, 1, 1, 1,
0.1083483, -0.4280449, 4.8809, 1, 0, 0, 1, 1,
0.1110682, -2.111429, 3.762483, 1, 0, 0, 1, 1,
0.1134713, -0.2256835, 3.60849, 1, 0, 0, 1, 1,
0.1168487, 1.478181, 0.8446812, 1, 0, 0, 1, 1,
0.1225681, 1.894738, 0.3768272, 1, 0, 0, 1, 1,
0.1286398, -0.2287545, 1.746365, 0, 0, 0, 1, 1,
0.1312413, -0.1151829, 2.711381, 0, 0, 0, 1, 1,
0.1345459, 0.4008143, 2.343918, 0, 0, 0, 1, 1,
0.1360285, -1.6195, 2.60882, 0, 0, 0, 1, 1,
0.1370346, -0.4917834, 2.747648, 0, 0, 0, 1, 1,
0.1404131, 0.328825, 0.707745, 0, 0, 0, 1, 1,
0.1438263, -0.5189887, 2.309738, 0, 0, 0, 1, 1,
0.148298, 1.127373, 0.3029678, 1, 1, 1, 1, 1,
0.1509382, -1.769376, 2.949174, 1, 1, 1, 1, 1,
0.1527653, 1.292854, 0.2807432, 1, 1, 1, 1, 1,
0.1567402, -0.4302461, 1.689036, 1, 1, 1, 1, 1,
0.1581576, -0.4292104, 2.619228, 1, 1, 1, 1, 1,
0.1612999, 1.37129, 1.129796, 1, 1, 1, 1, 1,
0.1628546, 1.189561, -0.09384165, 1, 1, 1, 1, 1,
0.1643528, 0.222091, 2.434542, 1, 1, 1, 1, 1,
0.1713897, -1.01965, 1.710567, 1, 1, 1, 1, 1,
0.1735572, -1.81301, 3.312947, 1, 1, 1, 1, 1,
0.1740438, 1.214642, 1.161321, 1, 1, 1, 1, 1,
0.1760209, 0.9519352, -1.295666, 1, 1, 1, 1, 1,
0.1795652, 0.5018131, 0.4027792, 1, 1, 1, 1, 1,
0.1875494, -0.1005956, 3.273143, 1, 1, 1, 1, 1,
0.1879314, 0.782728, -0.2659767, 1, 1, 1, 1, 1,
0.2073206, -0.04941614, 1.750881, 0, 0, 1, 1, 1,
0.2073725, 0.8156272, 0.007156754, 1, 0, 0, 1, 1,
0.2077752, 0.9454938, 1.146331, 1, 0, 0, 1, 1,
0.2083706, 0.8074371, -1.406385, 1, 0, 0, 1, 1,
0.2092337, -0.540418, 3.383091, 1, 0, 0, 1, 1,
0.2134253, 1.013471, 0.6918768, 1, 0, 0, 1, 1,
0.2144316, -1.002225, 2.262113, 0, 0, 0, 1, 1,
0.214761, 2.018172, -0.3430947, 0, 0, 0, 1, 1,
0.2164054, -0.4578587, 4.057949, 0, 0, 0, 1, 1,
0.2173244, -0.4869977, 2.129417, 0, 0, 0, 1, 1,
0.2216436, -0.3302945, 2.284277, 0, 0, 0, 1, 1,
0.2217616, -0.6387221, 3.404161, 0, 0, 0, 1, 1,
0.2235538, 1.077553, -0.5718945, 0, 0, 0, 1, 1,
0.2256254, 0.3118064, 1.594649, 1, 1, 1, 1, 1,
0.2306138, 0.5911217, 0.3729686, 1, 1, 1, 1, 1,
0.2309216, 0.2676128, -0.1243171, 1, 1, 1, 1, 1,
0.2370182, 0.871092, 2.038558, 1, 1, 1, 1, 1,
0.2395086, -0.7080439, 0.3224553, 1, 1, 1, 1, 1,
0.2410385, 0.4111847, 0.4413377, 1, 1, 1, 1, 1,
0.2437861, 0.3599654, 0.2026697, 1, 1, 1, 1, 1,
0.2469614, -0.7182869, 4.679922, 1, 1, 1, 1, 1,
0.2475104, -1.582951, 3.742532, 1, 1, 1, 1, 1,
0.2536254, -0.9301271, 2.83621, 1, 1, 1, 1, 1,
0.2561601, 0.3240152, 0.5306976, 1, 1, 1, 1, 1,
0.2627769, -0.3821143, 2.019955, 1, 1, 1, 1, 1,
0.2709223, -0.4442796, 1.524922, 1, 1, 1, 1, 1,
0.2714458, -0.2200988, 2.102826, 1, 1, 1, 1, 1,
0.2747595, 0.8216226, -0.9695685, 1, 1, 1, 1, 1,
0.2749216, -0.9660641, 2.514805, 0, 0, 1, 1, 1,
0.2796085, 1.274466, 0.1078666, 1, 0, 0, 1, 1,
0.2833211, 0.9976425, -0.9235528, 1, 0, 0, 1, 1,
0.2837469, -0.5887019, 1.250328, 1, 0, 0, 1, 1,
0.2842624, -0.06401918, 2.463173, 1, 0, 0, 1, 1,
0.2854019, -0.2204752, 0.9372842, 1, 0, 0, 1, 1,
0.2868173, -1.087497, 2.93816, 0, 0, 0, 1, 1,
0.2879393, -0.8297547, 1.374908, 0, 0, 0, 1, 1,
0.2925495, -0.008501478, 1.220901, 0, 0, 0, 1, 1,
0.2942763, 0.8647006, 0.1736237, 0, 0, 0, 1, 1,
0.2950107, 0.2183101, 2.03275, 0, 0, 0, 1, 1,
0.2966751, 1.041123, 0.6819674, 0, 0, 0, 1, 1,
0.2967012, 0.8633319, 1.313793, 0, 0, 0, 1, 1,
0.3018536, 0.2238161, 0.1295488, 1, 1, 1, 1, 1,
0.3020647, 0.3045281, 1.283497, 1, 1, 1, 1, 1,
0.3042123, 0.6053176, -1.709294, 1, 1, 1, 1, 1,
0.3059105, 1.164391, 1.572118, 1, 1, 1, 1, 1,
0.3136599, -1.465945, 3.281013, 1, 1, 1, 1, 1,
0.3222277, 0.5121515, 0.385981, 1, 1, 1, 1, 1,
0.3231065, 1.328121, -0.6966215, 1, 1, 1, 1, 1,
0.3280888, -1.679873, 2.012229, 1, 1, 1, 1, 1,
0.3282394, 1.017422, 0.9136735, 1, 1, 1, 1, 1,
0.3318962, -0.4412009, 2.135607, 1, 1, 1, 1, 1,
0.3324787, -0.2578659, 2.627552, 1, 1, 1, 1, 1,
0.3405347, 0.3490472, 0.3034548, 1, 1, 1, 1, 1,
0.35236, 0.03566693, 2.426362, 1, 1, 1, 1, 1,
0.3541372, -1.23762, 3.426336, 1, 1, 1, 1, 1,
0.3562927, 0.3504234, 0.9279827, 1, 1, 1, 1, 1,
0.356901, 0.727824, 0.809147, 0, 0, 1, 1, 1,
0.3619209, 0.4764644, 1.931635, 1, 0, 0, 1, 1,
0.3637746, 0.125277, 0.5699074, 1, 0, 0, 1, 1,
0.3656773, -1.488657, 4.131448, 1, 0, 0, 1, 1,
0.3668298, 0.866264, -0.638962, 1, 0, 0, 1, 1,
0.3669657, -0.9900801, 1.557, 1, 0, 0, 1, 1,
0.3700046, 0.218793, 1.138495, 0, 0, 0, 1, 1,
0.3704329, -0.2142533, 2.902153, 0, 0, 0, 1, 1,
0.3751673, 0.1182538, 0.15632, 0, 0, 0, 1, 1,
0.3756582, -0.3653977, 2.685331, 0, 0, 0, 1, 1,
0.3804733, 1.025589, 1.408687, 0, 0, 0, 1, 1,
0.381565, 0.05527713, 1.878481, 0, 0, 0, 1, 1,
0.3819728, 0.3653783, -0.1586438, 0, 0, 0, 1, 1,
0.3827763, 0.1885509, -0.5643906, 1, 1, 1, 1, 1,
0.3833704, -0.5876582, 2.676217, 1, 1, 1, 1, 1,
0.3839159, -1.117149, 2.159544, 1, 1, 1, 1, 1,
0.3891878, -0.2644536, 2.27412, 1, 1, 1, 1, 1,
0.3921169, -1.88194, 4.062527, 1, 1, 1, 1, 1,
0.3937639, 0.004504715, 2.732553, 1, 1, 1, 1, 1,
0.3971997, -0.4824027, 2.107808, 1, 1, 1, 1, 1,
0.3983047, 0.4791905, 2.923147, 1, 1, 1, 1, 1,
0.4011073, 1.498682, 0.4383753, 1, 1, 1, 1, 1,
0.4027562, -0.7644867, 1.789732, 1, 1, 1, 1, 1,
0.4052581, -0.2695223, 1.4157, 1, 1, 1, 1, 1,
0.4119655, -0.217374, 2.305732, 1, 1, 1, 1, 1,
0.413161, 1.930334, -0.2517946, 1, 1, 1, 1, 1,
0.413786, 1.374073, 0.8581555, 1, 1, 1, 1, 1,
0.4155317, -0.6868162, 2.458025, 1, 1, 1, 1, 1,
0.4197798, 0.6719837, -1.995893, 0, 0, 1, 1, 1,
0.4202988, 1.147616, 0.9144902, 1, 0, 0, 1, 1,
0.4230859, 1.110979, -1.25873, 1, 0, 0, 1, 1,
0.423332, 0.1498667, 1.986114, 1, 0, 0, 1, 1,
0.4242314, 1.657131, -0.5564337, 1, 0, 0, 1, 1,
0.4284777, 0.1123365, 2.854681, 1, 0, 0, 1, 1,
0.4319636, 0.3585657, 0.004801143, 0, 0, 0, 1, 1,
0.4349823, -0.3100976, 2.692277, 0, 0, 0, 1, 1,
0.4356617, 1.084024, 0.317716, 0, 0, 0, 1, 1,
0.4375187, 0.1280046, 3.11933, 0, 0, 0, 1, 1,
0.4391216, 0.02784972, 0.7544355, 0, 0, 0, 1, 1,
0.4394813, -0.2099343, 1.983409, 0, 0, 0, 1, 1,
0.4442879, -1.445354, 1.888011, 0, 0, 0, 1, 1,
0.4483134, -1.273327, 2.714671, 1, 1, 1, 1, 1,
0.4561309, -0.2303063, 2.072077, 1, 1, 1, 1, 1,
0.4565922, -0.7231638, 3.636112, 1, 1, 1, 1, 1,
0.4577255, 1.880406, -0.06998759, 1, 1, 1, 1, 1,
0.4614087, 0.8545779, 1.033374, 1, 1, 1, 1, 1,
0.4620836, 0.2211562, 2.660943, 1, 1, 1, 1, 1,
0.4629011, -0.06304787, 2.744489, 1, 1, 1, 1, 1,
0.4662044, 0.4775072, -0.1647028, 1, 1, 1, 1, 1,
0.4684356, -1.494326, 3.050786, 1, 1, 1, 1, 1,
0.4702423, -0.9280724, 3.46425, 1, 1, 1, 1, 1,
0.4720149, -1.8312, 3.444182, 1, 1, 1, 1, 1,
0.4757636, -0.7276227, 0.3174422, 1, 1, 1, 1, 1,
0.4760279, 0.7945905, 1.022776, 1, 1, 1, 1, 1,
0.4766559, -0.2348071, 1.04035, 1, 1, 1, 1, 1,
0.4842252, -0.9418555, 3.349533, 1, 1, 1, 1, 1,
0.4947403, 0.4417009, 0.03622965, 0, 0, 1, 1, 1,
0.4947731, 2.552929, 0.09668868, 1, 0, 0, 1, 1,
0.4965332, -0.5072837, 2.144601, 1, 0, 0, 1, 1,
0.4988307, 1.453778, 0.6548365, 1, 0, 0, 1, 1,
0.5047658, -0.002017268, 1.480257, 1, 0, 0, 1, 1,
0.5072328, -0.02026809, 1.398047, 1, 0, 0, 1, 1,
0.508734, 0.2232752, 1.089332, 0, 0, 0, 1, 1,
0.5112697, -0.8932501, 3.490104, 0, 0, 0, 1, 1,
0.5117885, -0.03301156, 2.944628, 0, 0, 0, 1, 1,
0.5124489, -0.7974311, 5.624119, 0, 0, 0, 1, 1,
0.5161998, 0.5509908, -1.412848, 0, 0, 0, 1, 1,
0.5202255, 1.234002, -0.9799032, 0, 0, 0, 1, 1,
0.520898, 0.4453024, 1.399858, 0, 0, 0, 1, 1,
0.5219078, 0.9232705, 0.5811736, 1, 1, 1, 1, 1,
0.5269245, 0.2811198, 0.9134427, 1, 1, 1, 1, 1,
0.5299172, -0.3604379, 0.1497296, 1, 1, 1, 1, 1,
0.5356344, 1.084545, -0.8600334, 1, 1, 1, 1, 1,
0.540743, 0.506475, 0.6978455, 1, 1, 1, 1, 1,
0.5442144, 1.651241, -1.047616, 1, 1, 1, 1, 1,
0.553646, 1.319708, 0.9401775, 1, 1, 1, 1, 1,
0.5542361, -0.8877065, 2.659046, 1, 1, 1, 1, 1,
0.5573714, -0.2130088, 2.439799, 1, 1, 1, 1, 1,
0.5728098, 0.05230538, 2.176461, 1, 1, 1, 1, 1,
0.5791923, 1.238971, -0.1883488, 1, 1, 1, 1, 1,
0.5797421, 0.4481402, 0.3847705, 1, 1, 1, 1, 1,
0.5809454, 1.848279, -0.9861208, 1, 1, 1, 1, 1,
0.58131, -0.3013172, 4.007483, 1, 1, 1, 1, 1,
0.581752, -0.7273429, 3.627698, 1, 1, 1, 1, 1,
0.5843069, 0.981251, 1.060119, 0, 0, 1, 1, 1,
0.5871196, 1.740635, -1.892881, 1, 0, 0, 1, 1,
0.587989, -2.02121, 4.035529, 1, 0, 0, 1, 1,
0.5913246, 1.968927, 0.9420792, 1, 0, 0, 1, 1,
0.5974404, 0.315338, 2.110965, 1, 0, 0, 1, 1,
0.6025063, -0.4430988, 3.279418, 1, 0, 0, 1, 1,
0.607697, -0.1508626, 2.446843, 0, 0, 0, 1, 1,
0.6085983, -0.9095508, 2.831741, 0, 0, 0, 1, 1,
0.6137072, 0.9622297, -0.9131569, 0, 0, 0, 1, 1,
0.6137864, -0.9107283, 1.143827, 0, 0, 0, 1, 1,
0.6139727, -3.934141, 1.857145, 0, 0, 0, 1, 1,
0.6148884, -0.01384382, 0.06471956, 0, 0, 0, 1, 1,
0.6183941, -0.003269173, 1.520389, 0, 0, 0, 1, 1,
0.6207026, 0.2001771, 0.3912781, 1, 1, 1, 1, 1,
0.621537, -0.166444, 1.033261, 1, 1, 1, 1, 1,
0.624626, -0.1336297, 1.641649, 1, 1, 1, 1, 1,
0.6274568, -0.08928508, 3.447218, 1, 1, 1, 1, 1,
0.6277052, 1.156494, 1.503311, 1, 1, 1, 1, 1,
0.6318775, -0.06001163, -0.05768933, 1, 1, 1, 1, 1,
0.6334779, 2.355738, 0.8711829, 1, 1, 1, 1, 1,
0.6348228, -2.353202, 1.930072, 1, 1, 1, 1, 1,
0.635747, 0.4201587, 1.330742, 1, 1, 1, 1, 1,
0.6392134, 0.09797908, 2.428899, 1, 1, 1, 1, 1,
0.6404094, 1.712023, 1.439883, 1, 1, 1, 1, 1,
0.6451474, -0.04175308, 0.6088735, 1, 1, 1, 1, 1,
0.6475008, -0.6210577, 3.715778, 1, 1, 1, 1, 1,
0.648434, -1.996574, 2.211698, 1, 1, 1, 1, 1,
0.6543676, 0.2360972, 1.871137, 1, 1, 1, 1, 1,
0.6571983, 0.4199432, -0.05219923, 0, 0, 1, 1, 1,
0.6592432, -0.8821334, 1.328542, 1, 0, 0, 1, 1,
0.6652239, -0.02416881, 1.850567, 1, 0, 0, 1, 1,
0.6660419, 1.063324, -0.4590847, 1, 0, 0, 1, 1,
0.6665465, 0.4027365, -0.1365277, 1, 0, 0, 1, 1,
0.6722633, 0.05884637, 2.143622, 1, 0, 0, 1, 1,
0.6723106, 0.9433929, -0.6852282, 0, 0, 0, 1, 1,
0.6737897, 1.351758, -0.3558594, 0, 0, 0, 1, 1,
0.6875569, 0.2251101, -0.3147912, 0, 0, 0, 1, 1,
0.6894604, -0.07674626, 1.78834, 0, 0, 0, 1, 1,
0.6908047, 0.7203126, -0.06109563, 0, 0, 0, 1, 1,
0.6921841, 1.642146, -1.44875, 0, 0, 0, 1, 1,
0.6929691, 1.025029, 1.051314, 0, 0, 0, 1, 1,
0.6939442, -1.767682, 2.500288, 1, 1, 1, 1, 1,
0.6963509, 1.06448, 0.2258737, 1, 1, 1, 1, 1,
0.6983185, -0.3021776, 4.771622, 1, 1, 1, 1, 1,
0.7006326, -1.185312, 2.673981, 1, 1, 1, 1, 1,
0.7017114, 0.1773753, 1.75991, 1, 1, 1, 1, 1,
0.7092163, 0.2850562, 0.7744805, 1, 1, 1, 1, 1,
0.7180464, -0.06555708, 0.3906287, 1, 1, 1, 1, 1,
0.7297148, 0.615687, 3.128646, 1, 1, 1, 1, 1,
0.7314002, 0.6372141, -0.2442136, 1, 1, 1, 1, 1,
0.7339205, -1.474192, 1.189824, 1, 1, 1, 1, 1,
0.7348753, 0.1771423, 2.299818, 1, 1, 1, 1, 1,
0.7354553, 0.8081303, 1.212747, 1, 1, 1, 1, 1,
0.7371205, -2.327849, 3.019393, 1, 1, 1, 1, 1,
0.7406643, 0.3176456, 1.068661, 1, 1, 1, 1, 1,
0.7413799, -0.5139356, 0.2893895, 1, 1, 1, 1, 1,
0.7487695, 0.4220259, 1.725702, 0, 0, 1, 1, 1,
0.75114, -0.1419312, 2.693952, 1, 0, 0, 1, 1,
0.7533482, -0.8783655, 1.222796, 1, 0, 0, 1, 1,
0.7581776, -0.06226053, 1.772517, 1, 0, 0, 1, 1,
0.7649047, -0.1967354, 1.605063, 1, 0, 0, 1, 1,
0.7652022, 0.1455296, 1.599855, 1, 0, 0, 1, 1,
0.7656239, 0.3400288, 1.087869, 0, 0, 0, 1, 1,
0.76639, -0.7809827, 1.792132, 0, 0, 0, 1, 1,
0.7680363, -0.1342518, 1.381361, 0, 0, 0, 1, 1,
0.7698992, 0.4527639, 0.4146321, 0, 0, 0, 1, 1,
0.7823941, -0.5679832, 2.79992, 0, 0, 0, 1, 1,
0.7842695, -0.04932795, 2.133975, 0, 0, 0, 1, 1,
0.7842866, 0.5421852, 0.9651113, 0, 0, 0, 1, 1,
0.7897709, 0.2909194, 1.608632, 1, 1, 1, 1, 1,
0.8006588, -0.9664906, 2.070604, 1, 1, 1, 1, 1,
0.8016637, 0.4454737, 2.222832, 1, 1, 1, 1, 1,
0.8046657, -0.07677519, 1.589915, 1, 1, 1, 1, 1,
0.8054295, -0.08351985, 2.426167, 1, 1, 1, 1, 1,
0.8095434, 0.7284602, -0.660715, 1, 1, 1, 1, 1,
0.8109685, -0.9813003, 3.648857, 1, 1, 1, 1, 1,
0.8120693, 0.542188, 1.030629, 1, 1, 1, 1, 1,
0.8174261, 1.584875, 0.8743739, 1, 1, 1, 1, 1,
0.8219637, 1.525324, 1.388539, 1, 1, 1, 1, 1,
0.8220129, 0.3691026, 1.148339, 1, 1, 1, 1, 1,
0.8234291, 1.314494, 0.1693021, 1, 1, 1, 1, 1,
0.8304831, 0.2563735, 0.3848258, 1, 1, 1, 1, 1,
0.8404304, -1.428775, 1.353237, 1, 1, 1, 1, 1,
0.850062, 1.180621, 0.6056269, 1, 1, 1, 1, 1,
0.8511189, 0.7092392, 2.638118, 0, 0, 1, 1, 1,
0.8512223, 0.5877084, 1.461401, 1, 0, 0, 1, 1,
0.8533478, 0.850719, -0.7718781, 1, 0, 0, 1, 1,
0.853528, 0.3049476, -0.3167837, 1, 0, 0, 1, 1,
0.8643568, 1.862122, -0.3000394, 1, 0, 0, 1, 1,
0.8647183, -1.765719, 1.673686, 1, 0, 0, 1, 1,
0.8672525, -0.6103375, 1.5489, 0, 0, 0, 1, 1,
0.8748987, -0.5757163, 3.352957, 0, 0, 0, 1, 1,
0.8762781, -0.3182706, 1.903135, 0, 0, 0, 1, 1,
0.8822438, 0.471598, 1.086044, 0, 0, 0, 1, 1,
0.8826742, -0.810604, 2.925454, 0, 0, 0, 1, 1,
0.8912562, -0.7744296, 2.776376, 0, 0, 0, 1, 1,
0.8917307, -0.004317748, 0.6588142, 0, 0, 0, 1, 1,
0.8924189, 0.2803406, 3.068697, 1, 1, 1, 1, 1,
0.8960052, -0.1378434, 1.458105, 1, 1, 1, 1, 1,
0.8971796, 0.9075569, 0.4632287, 1, 1, 1, 1, 1,
0.8982834, 0.2143043, 2.273667, 1, 1, 1, 1, 1,
0.8995292, -0.9583731, 3.203156, 1, 1, 1, 1, 1,
0.9004598, -0.244649, 1.906195, 1, 1, 1, 1, 1,
0.9025888, -0.9215602, 2.355729, 1, 1, 1, 1, 1,
0.9029124, -0.6794549, 2.170639, 1, 1, 1, 1, 1,
0.9054717, -0.2322441, 2.331918, 1, 1, 1, 1, 1,
0.9065114, 0.9245703, 1.225227, 1, 1, 1, 1, 1,
0.9133309, -0.5275181, 3.885345, 1, 1, 1, 1, 1,
0.913605, -0.04744513, -0.340826, 1, 1, 1, 1, 1,
0.9193373, 1.388336, 0.7648692, 1, 1, 1, 1, 1,
0.921298, 0.3695516, 1.145397, 1, 1, 1, 1, 1,
0.9273368, -0.3007612, 3.189789, 1, 1, 1, 1, 1,
0.9285536, 1.198703, 1.344704, 0, 0, 1, 1, 1,
0.9304018, -1.028409, 2.133632, 1, 0, 0, 1, 1,
0.9365528, -0.1808043, 3.345093, 1, 0, 0, 1, 1,
0.9477479, -1.24919, 2.42761, 1, 0, 0, 1, 1,
0.9514349, -0.6210575, 3.292735, 1, 0, 0, 1, 1,
0.9545308, 1.539568, 1.353017, 1, 0, 0, 1, 1,
0.9570918, 0.1281362, 2.038488, 0, 0, 0, 1, 1,
0.9619368, 0.5458758, -0.3033994, 0, 0, 0, 1, 1,
0.9631891, -1.414317, 3.244959, 0, 0, 0, 1, 1,
0.9631934, -0.2086966, 2.3001, 0, 0, 0, 1, 1,
0.9659036, 0.1752841, 0.2390358, 0, 0, 0, 1, 1,
0.969938, 0.6608805, -0.1797252, 0, 0, 0, 1, 1,
0.9776033, 0.8225716, 0.05163677, 0, 0, 0, 1, 1,
0.9806027, -0.554431, 1.675683, 1, 1, 1, 1, 1,
0.982106, 1.001743, 1.06286, 1, 1, 1, 1, 1,
0.9853662, 1.822963, -0.6724237, 1, 1, 1, 1, 1,
0.9861836, -0.696039, 2.279786, 1, 1, 1, 1, 1,
0.9925597, 1.381082, 0.6296378, 1, 1, 1, 1, 1,
0.9935018, 0.1940657, 2.52732, 1, 1, 1, 1, 1,
0.9972153, 0.5757006, 0.7985257, 1, 1, 1, 1, 1,
0.9992161, -0.3837893, 1.897616, 1, 1, 1, 1, 1,
0.9997376, -0.117576, 2.407445, 1, 1, 1, 1, 1,
1.004512, 3.377484, 1.14544, 1, 1, 1, 1, 1,
1.006962, 1.009758, 0.06930972, 1, 1, 1, 1, 1,
1.008265, -1.354944, 2.295213, 1, 1, 1, 1, 1,
1.023645, -0.2563404, 2.723371, 1, 1, 1, 1, 1,
1.027264, 0.6825614, 0.5562594, 1, 1, 1, 1, 1,
1.028411, -0.06122467, 2.509971, 1, 1, 1, 1, 1,
1.037023, -0.546525, 2.598427, 0, 0, 1, 1, 1,
1.045882, -0.3389338, 2.06938, 1, 0, 0, 1, 1,
1.046545, 0.1765022, 0.7438737, 1, 0, 0, 1, 1,
1.048413, 3.057591, -0.5647983, 1, 0, 0, 1, 1,
1.050897, -0.2525042, 1.171412, 1, 0, 0, 1, 1,
1.053252, 0.1585111, 1.574477, 1, 0, 0, 1, 1,
1.065405, 0.05822211, 1.960904, 0, 0, 0, 1, 1,
1.06549, 1.294607, -0.9522875, 0, 0, 0, 1, 1,
1.066231, -2.046036, 3.41202, 0, 0, 0, 1, 1,
1.072395, 0.09225769, 1.626216, 0, 0, 0, 1, 1,
1.080167, -1.137629, 2.090362, 0, 0, 0, 1, 1,
1.083548, 0.4014578, 1.929378, 0, 0, 0, 1, 1,
1.084426, 0.2785594, 1.347126, 0, 0, 0, 1, 1,
1.086682, 0.5031268, -0.6751634, 1, 1, 1, 1, 1,
1.089849, -0.1005421, 1.870611, 1, 1, 1, 1, 1,
1.091801, 1.291861, 0.4874993, 1, 1, 1, 1, 1,
1.104974, -1.252881, 2.627263, 1, 1, 1, 1, 1,
1.11217, -0.315009, 3.337374, 1, 1, 1, 1, 1,
1.112372, 0.8373839, -0.4699011, 1, 1, 1, 1, 1,
1.113121, 0.5148651, 2.246898, 1, 1, 1, 1, 1,
1.115519, -0.1063584, 1.690665, 1, 1, 1, 1, 1,
1.116065, 0.6117813, 1.985911, 1, 1, 1, 1, 1,
1.12503, -0.3938167, 2.665468, 1, 1, 1, 1, 1,
1.129694, 1.479464, 1.600003, 1, 1, 1, 1, 1,
1.131674, -1.291901, 2.26937, 1, 1, 1, 1, 1,
1.136404, -1.415505, 3.413489, 1, 1, 1, 1, 1,
1.147651, -0.768878, 1.493606, 1, 1, 1, 1, 1,
1.157792, -1.082851, 2.845358, 1, 1, 1, 1, 1,
1.175926, 0.4865763, 0.2965201, 0, 0, 1, 1, 1,
1.183765, -1.930155, 1.825131, 1, 0, 0, 1, 1,
1.184186, 1.203347, 0.871416, 1, 0, 0, 1, 1,
1.191055, 1.47242, 1.367366, 1, 0, 0, 1, 1,
1.19668, 0.1481354, 1.315612, 1, 0, 0, 1, 1,
1.197361, 0.2051026, 1.656159, 1, 0, 0, 1, 1,
1.198465, 0.1648421, 2.389753, 0, 0, 0, 1, 1,
1.198585, -1.106197, 3.069643, 0, 0, 0, 1, 1,
1.200777, 0.5638906, 0.5115526, 0, 0, 0, 1, 1,
1.208836, -0.926029, 3.223138, 0, 0, 0, 1, 1,
1.213408, 0.04049955, 1.468965, 0, 0, 0, 1, 1,
1.21758, 0.465885, 1.045502, 0, 0, 0, 1, 1,
1.219909, 0.08737892, 1.054829, 0, 0, 0, 1, 1,
1.225151, 0.9517346, 0.8954998, 1, 1, 1, 1, 1,
1.231474, -0.8067001, 2.657005, 1, 1, 1, 1, 1,
1.231964, -0.5036831, 1.385687, 1, 1, 1, 1, 1,
1.232051, 1.616612, 0.4787025, 1, 1, 1, 1, 1,
1.233832, 1.40351, 2.538191, 1, 1, 1, 1, 1,
1.241598, -0.8990573, 3.301781, 1, 1, 1, 1, 1,
1.242161, 0.3216848, 1.471582, 1, 1, 1, 1, 1,
1.242457, 2.761053, -0.3494534, 1, 1, 1, 1, 1,
1.253104, 0.2873996, 1.134144, 1, 1, 1, 1, 1,
1.2576, -0.6840051, 2.381576, 1, 1, 1, 1, 1,
1.265889, 1.769078, -0.4275503, 1, 1, 1, 1, 1,
1.267163, -0.994477, 2.775774, 1, 1, 1, 1, 1,
1.268232, 1.53484, 0.4066806, 1, 1, 1, 1, 1,
1.269053, 1.052434, 0.1639234, 1, 1, 1, 1, 1,
1.270805, 1.613964, -0.1458521, 1, 1, 1, 1, 1,
1.274653, -0.6319281, 2.494872, 0, 0, 1, 1, 1,
1.279083, 0.0805966, 2.574283, 1, 0, 0, 1, 1,
1.279618, -1.370591, 0.98803, 1, 0, 0, 1, 1,
1.28978, 0.8168204, 0.7469567, 1, 0, 0, 1, 1,
1.299958, 0.2466794, 0.899711, 1, 0, 0, 1, 1,
1.306257, -1.03578, 2.06542, 1, 0, 0, 1, 1,
1.307901, -3.030124, 3.749367, 0, 0, 0, 1, 1,
1.308188, 1.142419, 1.541946, 0, 0, 0, 1, 1,
1.314021, -1.022344, 1.728451, 0, 0, 0, 1, 1,
1.315174, -0.5293894, 0.6713441, 0, 0, 0, 1, 1,
1.319595, 0.6853333, 0.8325841, 0, 0, 0, 1, 1,
1.321089, 0.01029697, 1.711588, 0, 0, 0, 1, 1,
1.328756, -0.8251947, 2.259334, 0, 0, 0, 1, 1,
1.345365, 0.1370392, 1.448931, 1, 1, 1, 1, 1,
1.348425, 0.5166033, 1.117939, 1, 1, 1, 1, 1,
1.35298, -0.4712617, 1.24228, 1, 1, 1, 1, 1,
1.358609, 0.9100974, 2.698253, 1, 1, 1, 1, 1,
1.380725, -0.8668787, 1.541135, 1, 1, 1, 1, 1,
1.386203, 1.797771, 0.1896957, 1, 1, 1, 1, 1,
1.392838, 0.153264, 0.6613945, 1, 1, 1, 1, 1,
1.398468, 0.7777982, 1.393767, 1, 1, 1, 1, 1,
1.400198, 0.4971595, 0.3402485, 1, 1, 1, 1, 1,
1.405727, -0.4960932, 2.502176, 1, 1, 1, 1, 1,
1.427945, -0.03387797, 2.203284, 1, 1, 1, 1, 1,
1.44427, 0.5671739, 3.192497, 1, 1, 1, 1, 1,
1.460001, -2.083686, 1.87621, 1, 1, 1, 1, 1,
1.464518, 0.2130891, 0.1807336, 1, 1, 1, 1, 1,
1.46541, -0.2685111, 3.595254, 1, 1, 1, 1, 1,
1.473705, -0.7197217, 0.4669614, 0, 0, 1, 1, 1,
1.477099, 0.6814142, 0.02226035, 1, 0, 0, 1, 1,
1.48774, 1.134209, 1.013014, 1, 0, 0, 1, 1,
1.488942, 1.458934, 1.049167, 1, 0, 0, 1, 1,
1.497271, 0.4225758, 1.461524, 1, 0, 0, 1, 1,
1.499029, 0.892957, 1.88149, 1, 0, 0, 1, 1,
1.505486, 0.3691241, 1.677098, 0, 0, 0, 1, 1,
1.50866, 0.6540075, 2.228648, 0, 0, 0, 1, 1,
1.51291, 0.3451006, -0.2358649, 0, 0, 0, 1, 1,
1.528038, 0.1628086, 1.089106, 0, 0, 0, 1, 1,
1.529312, 0.7084929, 0.2699489, 0, 0, 0, 1, 1,
1.531624, -0.4894596, 3.089063, 0, 0, 0, 1, 1,
1.532291, 0.5472059, 1.136069, 0, 0, 0, 1, 1,
1.544656, -0.1415836, 2.698339, 1, 1, 1, 1, 1,
1.553489, 0.1167223, 1.368754, 1, 1, 1, 1, 1,
1.557446, -0.1952612, 1.27374, 1, 1, 1, 1, 1,
1.564276, 0.006577385, 0.4329297, 1, 1, 1, 1, 1,
1.57382, -1.084575, 0.0951563, 1, 1, 1, 1, 1,
1.581032, 0.728416, 0.3230345, 1, 1, 1, 1, 1,
1.586375, -0.1649907, 0.3313881, 1, 1, 1, 1, 1,
1.606116, -0.8900995, 0.3395484, 1, 1, 1, 1, 1,
1.612804, -1.221877, 3.278141, 1, 1, 1, 1, 1,
1.625733, -1.134119, 4.740307, 1, 1, 1, 1, 1,
1.631261, -0.9390425, 2.477563, 1, 1, 1, 1, 1,
1.643608, 1.105234, 2.640033, 1, 1, 1, 1, 1,
1.64931, -1.155623, 3.242727, 1, 1, 1, 1, 1,
1.658789, -0.5724514, 1.61136, 1, 1, 1, 1, 1,
1.660806, 2.12364, 1.352789, 1, 1, 1, 1, 1,
1.676358, -0.1136856, 1.732355, 0, 0, 1, 1, 1,
1.677677, -1.766301, 2.636176, 1, 0, 0, 1, 1,
1.699001, -0.07764824, 0.4380903, 1, 0, 0, 1, 1,
1.705637, 1.011709, 2.68763, 1, 0, 0, 1, 1,
1.712807, -0.6076367, 2.139503, 1, 0, 0, 1, 1,
1.730593, -2.335069, 2.688639, 1, 0, 0, 1, 1,
1.751042, 0.3334828, 0.9042563, 0, 0, 0, 1, 1,
1.782427, -1.321243, 3.975403, 0, 0, 0, 1, 1,
1.807711, -0.7584056, 2.822968, 0, 0, 0, 1, 1,
1.820431, -0.4299942, -0.7791141, 0, 0, 0, 1, 1,
1.827573, 0.1429, 0.5489137, 0, 0, 0, 1, 1,
1.841065, -0.6869308, 0.5819118, 0, 0, 0, 1, 1,
1.851895, -0.2420633, 1.861074, 0, 0, 0, 1, 1,
1.860256, -0.8278774, 2.9357, 1, 1, 1, 1, 1,
1.886109, 0.08359293, 3.164337, 1, 1, 1, 1, 1,
1.896591, 0.614791, 1.524992, 1, 1, 1, 1, 1,
1.904563, 0.9809483, 0.5753653, 1, 1, 1, 1, 1,
1.908813, 2.552759, -0.21978, 1, 1, 1, 1, 1,
1.923538, -0.1335999, 0.8790729, 1, 1, 1, 1, 1,
1.925366, -1.120956, 2.036957, 1, 1, 1, 1, 1,
1.939055, 0.03511644, 1.139395, 1, 1, 1, 1, 1,
1.941093, -0.4335031, 1.62496, 1, 1, 1, 1, 1,
1.953845, 1.26087, 1.570359, 1, 1, 1, 1, 1,
1.99398, -1.026417, 2.498057, 1, 1, 1, 1, 1,
2.011758, 0.7215066, 1.808608, 1, 1, 1, 1, 1,
2.018642, 0.6579792, 1.842818, 1, 1, 1, 1, 1,
2.027875, 0.2877211, 1.065284, 1, 1, 1, 1, 1,
2.029928, -0.5988481, 0.905991, 1, 1, 1, 1, 1,
2.045574, -0.3650444, 0.7298339, 0, 0, 1, 1, 1,
2.048658, -2.092129, 4.704639, 1, 0, 0, 1, 1,
2.051432, -0.1641298, 1.119943, 1, 0, 0, 1, 1,
2.066981, -1.861905, 2.650118, 1, 0, 0, 1, 1,
2.099857, 1.402975, 0.8111435, 1, 0, 0, 1, 1,
2.140527, 0.6811771, 0.1745843, 1, 0, 0, 1, 1,
2.166254, 0.6627668, -1.011814, 0, 0, 0, 1, 1,
2.195303, 0.07866944, 1.411638, 0, 0, 0, 1, 1,
2.278534, 1.341776, 0.2064667, 0, 0, 0, 1, 1,
2.279041, -0.007385766, 3.035156, 0, 0, 0, 1, 1,
2.350592, -0.3411479, 3.407136, 0, 0, 0, 1, 1,
2.381787, -0.4944806, -0.4663278, 0, 0, 0, 1, 1,
2.395052, 0.2690285, 0.005554083, 0, 0, 0, 1, 1,
2.481663, 0.05278083, 1.675869, 1, 1, 1, 1, 1,
2.500337, 0.447351, 0.9115, 1, 1, 1, 1, 1,
2.559947, -1.518046, 2.333461, 1, 1, 1, 1, 1,
2.841759, 0.5694305, 0.9271542, 1, 1, 1, 1, 1,
3.099533, 0.9757648, 0.5641334, 1, 1, 1, 1, 1,
3.111507, -0.5890213, 1.796131, 1, 1, 1, 1, 1,
3.258671, 0.03276896, 1.835833, 1, 1, 1, 1, 1
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
var radius = 9.982907;
var distance = 35.06453;
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
mvMatrix.translate( -0.1332364, 0.2783287, -0.01605296 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.06453);
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
