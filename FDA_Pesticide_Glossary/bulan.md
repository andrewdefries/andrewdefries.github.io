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
-3.244115, 1.412375, -1.926215, 1, 0, 0, 1,
-2.788741, -0.01826899, -2.942448, 1, 0.007843138, 0, 1,
-2.788091, -0.1898085, -3.442955, 1, 0.01176471, 0, 1,
-2.672563, -1.667724, -1.720351, 1, 0.01960784, 0, 1,
-2.492583, -0.9618204, -1.318833, 1, 0.02352941, 0, 1,
-2.486297, 1.571411, -1.221639, 1, 0.03137255, 0, 1,
-2.475962, -1.826697, -3.160689, 1, 0.03529412, 0, 1,
-2.389669, -0.8601958, -1.73993, 1, 0.04313726, 0, 1,
-2.365417, 0.4847871, -0.4337083, 1, 0.04705882, 0, 1,
-2.341727, -0.9894149, -1.2522, 1, 0.05490196, 0, 1,
-2.327041, 0.2985472, -0.01266202, 1, 0.05882353, 0, 1,
-2.272874, -0.9234428, -1.563964, 1, 0.06666667, 0, 1,
-2.238285, -0.4346433, -1.398817, 1, 0.07058824, 0, 1,
-2.168216, 0.5988898, -0.3214587, 1, 0.07843138, 0, 1,
-2.131371, 0.1926757, -1.527396, 1, 0.08235294, 0, 1,
-2.113743, 0.3222893, -1.157546, 1, 0.09019608, 0, 1,
-2.07681, -1.827091, -3.306286, 1, 0.09411765, 0, 1,
-2.0727, 0.6765391, -1.472425, 1, 0.1019608, 0, 1,
-2.065934, -1.430973, -3.193975, 1, 0.1098039, 0, 1,
-2.05815, 1.66069, -0.5790172, 1, 0.1137255, 0, 1,
-2.055078, -1.707805, -3.264619, 1, 0.1215686, 0, 1,
-2.008937, -0.3591101, 0.4608968, 1, 0.1254902, 0, 1,
-2.003937, -0.7875148, -1.734924, 1, 0.1333333, 0, 1,
-1.99123, -0.4266146, -0.7263289, 1, 0.1372549, 0, 1,
-1.93548, -1.078423, -3.477058, 1, 0.145098, 0, 1,
-1.916392, -1.580485, -2.271367, 1, 0.1490196, 0, 1,
-1.916217, -1.476001, -1.245582, 1, 0.1568628, 0, 1,
-1.882629, -0.1388756, -2.398999, 1, 0.1607843, 0, 1,
-1.8826, 0.1670862, -1.63769, 1, 0.1686275, 0, 1,
-1.860443, 1.493418, -2.109305, 1, 0.172549, 0, 1,
-1.834297, -0.1793411, -2.071745, 1, 0.1803922, 0, 1,
-1.825447, -0.9324567, -2.791999, 1, 0.1843137, 0, 1,
-1.801467, -0.01146811, 0.1320016, 1, 0.1921569, 0, 1,
-1.798315, 0.08845435, -2.573573, 1, 0.1960784, 0, 1,
-1.787758, 0.3205552, -1.557709, 1, 0.2039216, 0, 1,
-1.774588, 0.8559231, -1.895971, 1, 0.2117647, 0, 1,
-1.767864, -0.4210625, -1.636076, 1, 0.2156863, 0, 1,
-1.753741, 1.929967, -1.795707, 1, 0.2235294, 0, 1,
-1.74924, 0.2332392, -0.8937767, 1, 0.227451, 0, 1,
-1.737688, -0.4636032, -1.444443, 1, 0.2352941, 0, 1,
-1.733897, -1.015028, -1.305708, 1, 0.2392157, 0, 1,
-1.729649, -2.087314, -2.396159, 1, 0.2470588, 0, 1,
-1.706468, 1.142595, -0.4176092, 1, 0.2509804, 0, 1,
-1.706158, -0.9026428, -0.2240969, 1, 0.2588235, 0, 1,
-1.70424, -0.7224562, -1.874353, 1, 0.2627451, 0, 1,
-1.702629, 1.435268, -0.6797742, 1, 0.2705882, 0, 1,
-1.682015, -0.2624639, -2.070637, 1, 0.2745098, 0, 1,
-1.671109, 0.9312209, -2.155715, 1, 0.282353, 0, 1,
-1.670492, -1.269862, -1.428259, 1, 0.2862745, 0, 1,
-1.646752, -0.5038182, -1.319784, 1, 0.2941177, 0, 1,
-1.64281, 0.124196, -1.423922, 1, 0.3019608, 0, 1,
-1.641042, -1.300859, -3.119571, 1, 0.3058824, 0, 1,
-1.638014, 0.1806003, -2.781356, 1, 0.3137255, 0, 1,
-1.633581, 0.5010781, -1.440438, 1, 0.3176471, 0, 1,
-1.629684, 0.6093775, -0.7637883, 1, 0.3254902, 0, 1,
-1.629209, -0.2207967, -2.269495, 1, 0.3294118, 0, 1,
-1.601342, -1.285274, -3.049838, 1, 0.3372549, 0, 1,
-1.599637, -0.4088178, -1.952761, 1, 0.3411765, 0, 1,
-1.592383, 0.7598056, -1.102501, 1, 0.3490196, 0, 1,
-1.592227, 1.115012, -0.03736563, 1, 0.3529412, 0, 1,
-1.591016, 1.176743, 0.1855694, 1, 0.3607843, 0, 1,
-1.583457, -0.0935866, -2.486977, 1, 0.3647059, 0, 1,
-1.57539, -1.691413, -3.824107, 1, 0.372549, 0, 1,
-1.573369, 0.1211209, 1.190726, 1, 0.3764706, 0, 1,
-1.569003, -1.058292, -3.600713, 1, 0.3843137, 0, 1,
-1.566556, -0.5225461, -4.206748, 1, 0.3882353, 0, 1,
-1.558217, -0.005832241, -2.186936, 1, 0.3960784, 0, 1,
-1.552176, 0.6351336, -0.5658521, 1, 0.4039216, 0, 1,
-1.547166, 0.3299321, -1.362077, 1, 0.4078431, 0, 1,
-1.521346, 1.785627, 0.0523104, 1, 0.4156863, 0, 1,
-1.519278, -1.029517, -4.262322, 1, 0.4196078, 0, 1,
-1.516274, -1.637117, -2.124993, 1, 0.427451, 0, 1,
-1.508545, -2.52891, -1.647199, 1, 0.4313726, 0, 1,
-1.502046, 1.165857, 0.211127, 1, 0.4392157, 0, 1,
-1.483147, -1.204876, -1.303895, 1, 0.4431373, 0, 1,
-1.46762, -0.5542475, -2.755253, 1, 0.4509804, 0, 1,
-1.466013, 0.167245, -1.165212, 1, 0.454902, 0, 1,
-1.465316, -0.07971556, -0.692944, 1, 0.4627451, 0, 1,
-1.464321, 0.6324431, -0.9614261, 1, 0.4666667, 0, 1,
-1.460362, 0.7237531, 1.592959, 1, 0.4745098, 0, 1,
-1.458659, 0.3248067, -2.188727, 1, 0.4784314, 0, 1,
-1.452666, -2.046091, -3.135038, 1, 0.4862745, 0, 1,
-1.451363, -0.03145662, 0.8327938, 1, 0.4901961, 0, 1,
-1.440364, -0.01686597, -1.575819, 1, 0.4980392, 0, 1,
-1.433372, 0.5484018, -2.399469, 1, 0.5058824, 0, 1,
-1.416861, -0.9561779, -1.144326, 1, 0.509804, 0, 1,
-1.407974, 0.2219938, -2.560383, 1, 0.5176471, 0, 1,
-1.399398, -1.039457, -2.047672, 1, 0.5215687, 0, 1,
-1.399001, -1.785374, -1.65906, 1, 0.5294118, 0, 1,
-1.398081, 0.2498801, -0.07208543, 1, 0.5333334, 0, 1,
-1.384052, 0.1678664, 0.6990274, 1, 0.5411765, 0, 1,
-1.366463, -2.050663, -3.195698, 1, 0.5450981, 0, 1,
-1.365511, 0.1274807, -2.707814, 1, 0.5529412, 0, 1,
-1.347412, -0.3019631, -0.7961588, 1, 0.5568628, 0, 1,
-1.338919, -2.001609, -2.90861, 1, 0.5647059, 0, 1,
-1.335791, -0.06904751, -2.019718, 1, 0.5686275, 0, 1,
-1.329616, 1.160148, -0.9064395, 1, 0.5764706, 0, 1,
-1.322044, 0.1558963, -0.6669363, 1, 0.5803922, 0, 1,
-1.317106, -0.116179, -1.020852, 1, 0.5882353, 0, 1,
-1.311889, -0.5689388, -0.7511695, 1, 0.5921569, 0, 1,
-1.299252, -0.1303143, -1.819991, 1, 0.6, 0, 1,
-1.299171, -0.2748615, -1.602616, 1, 0.6078432, 0, 1,
-1.289741, 0.4909203, -1.358942, 1, 0.6117647, 0, 1,
-1.286723, -0.4677242, -2.481236, 1, 0.6196079, 0, 1,
-1.285276, 0.7072967, -1.254523, 1, 0.6235294, 0, 1,
-1.284345, -1.755623, -2.195827, 1, 0.6313726, 0, 1,
-1.280867, -0.630942, -1.229928, 1, 0.6352941, 0, 1,
-1.273778, -1.215832, -1.515622, 1, 0.6431373, 0, 1,
-1.270673, -1.590297, -2.156458, 1, 0.6470588, 0, 1,
-1.264631, 0.8092722, -1.238505, 1, 0.654902, 0, 1,
-1.261172, -0.7520498, -3.03478, 1, 0.6588235, 0, 1,
-1.246787, -0.3708378, -1.805156, 1, 0.6666667, 0, 1,
-1.238007, 0.4016997, -1.53642, 1, 0.6705883, 0, 1,
-1.212392, 0.5797676, -0.3080401, 1, 0.6784314, 0, 1,
-1.206961, -0.2042373, -0.1177828, 1, 0.682353, 0, 1,
-1.201076, 1.516873, -0.6646088, 1, 0.6901961, 0, 1,
-1.198966, -2.086687, -0.8403655, 1, 0.6941177, 0, 1,
-1.197169, -0.5917753, 0.818949, 1, 0.7019608, 0, 1,
-1.194703, -0.1891508, -2.728721, 1, 0.7098039, 0, 1,
-1.190253, -0.3870595, -0.7799132, 1, 0.7137255, 0, 1,
-1.183748, 0.386113, -3.322673, 1, 0.7215686, 0, 1,
-1.167382, -0.4449649, -3.532567, 1, 0.7254902, 0, 1,
-1.159026, 0.407557, -2.101187, 1, 0.7333333, 0, 1,
-1.153719, -1.435594, -3.845926, 1, 0.7372549, 0, 1,
-1.152192, 0.1247927, -4.132177, 1, 0.7450981, 0, 1,
-1.130344, 0.06467729, -0.11366, 1, 0.7490196, 0, 1,
-1.128863, 0.3535505, -1.51381, 1, 0.7568628, 0, 1,
-1.126004, 0.2897779, -1.525555, 1, 0.7607843, 0, 1,
-1.119519, -1.495032, -1.84972, 1, 0.7686275, 0, 1,
-1.117426, 1.020485, -1.58706, 1, 0.772549, 0, 1,
-1.117395, 2.574763, 0.2941073, 1, 0.7803922, 0, 1,
-1.109979, 0.2399112, 0.7853255, 1, 0.7843137, 0, 1,
-1.107018, -0.7414225, -0.3607044, 1, 0.7921569, 0, 1,
-1.106352, 0.6632489, -1.794767, 1, 0.7960784, 0, 1,
-1.103885, 0.741326, -0.3436295, 1, 0.8039216, 0, 1,
-1.103091, 0.2213966, -1.48688, 1, 0.8117647, 0, 1,
-1.099066, 0.6825736, -1.017081, 1, 0.8156863, 0, 1,
-1.095435, 0.4352806, -2.662852, 1, 0.8235294, 0, 1,
-1.092774, -2.196161, -2.72112, 1, 0.827451, 0, 1,
-1.075613, 0.9332987, -2.436017, 1, 0.8352941, 0, 1,
-1.073525, 0.1790634, -1.533644, 1, 0.8392157, 0, 1,
-1.069282, 1.241625, 0.6258465, 1, 0.8470588, 0, 1,
-1.06837, -1.815932, -4.27932, 1, 0.8509804, 0, 1,
-1.061284, 0.1052608, -2.629524, 1, 0.8588235, 0, 1,
-1.056362, -1.293735, -2.355175, 1, 0.8627451, 0, 1,
-1.04796, -0.3820512, -0.6561542, 1, 0.8705882, 0, 1,
-1.040545, -0.3512113, -2.1123, 1, 0.8745098, 0, 1,
-1.033604, 1.209642, -1.367972, 1, 0.8823529, 0, 1,
-1.029914, 1.206867, -0.155073, 1, 0.8862745, 0, 1,
-1.029505, 0.5060272, 0.3530579, 1, 0.8941177, 0, 1,
-1.027496, 0.3381326, 0.2832218, 1, 0.8980392, 0, 1,
-1.017304, -0.1987055, -0.2438247, 1, 0.9058824, 0, 1,
-1.012384, 0.02798326, -1.759553, 1, 0.9137255, 0, 1,
-1.011624, 0.8158603, -2.038099, 1, 0.9176471, 0, 1,
-1.007598, 1.402487, -1.012339, 1, 0.9254902, 0, 1,
-1.005957, 1.951464, 1.356144, 1, 0.9294118, 0, 1,
-1.004872, -0.8443424, -2.898871, 1, 0.9372549, 0, 1,
-1.00273, 1.51055, -0.665776, 1, 0.9411765, 0, 1,
-1.000349, -1.793293, -3.177629, 1, 0.9490196, 0, 1,
-1.00005, -1.115689, -0.277162, 1, 0.9529412, 0, 1,
-0.998596, 0.3792316, -2.925144, 1, 0.9607843, 0, 1,
-0.9917915, -0.804318, -3.358266, 1, 0.9647059, 0, 1,
-0.9886397, 0.9829487, -0.9280817, 1, 0.972549, 0, 1,
-0.9590053, 2.708657, -0.4839863, 1, 0.9764706, 0, 1,
-0.9541842, 0.4929589, -1.547162, 1, 0.9843137, 0, 1,
-0.9531321, -0.9144108, -2.547026, 1, 0.9882353, 0, 1,
-0.945363, -0.1935112, -1.053046, 1, 0.9960784, 0, 1,
-0.943224, 0.174453, -1.502102, 0.9960784, 1, 0, 1,
-0.9410661, -0.02079361, -1.932104, 0.9921569, 1, 0, 1,
-0.9404546, -0.1498301, -2.187382, 0.9843137, 1, 0, 1,
-0.9355476, -0.7758349, -2.95452, 0.9803922, 1, 0, 1,
-0.9324377, 2.292345, -0.4324195, 0.972549, 1, 0, 1,
-0.9292434, 1.768391, -2.539261, 0.9686275, 1, 0, 1,
-0.9288144, 0.1120404, -3.156258, 0.9607843, 1, 0, 1,
-0.9283384, -1.142253, -3.340827, 0.9568627, 1, 0, 1,
-0.9264625, 0.1675506, -0.9928781, 0.9490196, 1, 0, 1,
-0.9257184, 0.2874155, -2.208042, 0.945098, 1, 0, 1,
-0.9234796, 0.2192567, -2.800047, 0.9372549, 1, 0, 1,
-0.8909764, 0.5142797, -1.517625, 0.9333333, 1, 0, 1,
-0.8905433, 0.1920778, -0.2980729, 0.9254902, 1, 0, 1,
-0.8901915, 1.32289, -1.479159, 0.9215686, 1, 0, 1,
-0.8827543, 1.541955, 0.6954193, 0.9137255, 1, 0, 1,
-0.8785166, -2.104733, -2.206522, 0.9098039, 1, 0, 1,
-0.8780325, -0.5399462, -2.997869, 0.9019608, 1, 0, 1,
-0.8691922, -0.9964224, -1.235918, 0.8941177, 1, 0, 1,
-0.8661962, 1.865824, 0.2798471, 0.8901961, 1, 0, 1,
-0.8603078, -1.252113, -3.993045, 0.8823529, 1, 0, 1,
-0.853273, -0.2877594, -2.682565, 0.8784314, 1, 0, 1,
-0.8509196, -1.512766, -2.770224, 0.8705882, 1, 0, 1,
-0.84521, 1.150748, -2.025734, 0.8666667, 1, 0, 1,
-0.8442479, 0.657268, -1.318323, 0.8588235, 1, 0, 1,
-0.841146, -0.5781698, -2.772199, 0.854902, 1, 0, 1,
-0.840425, -0.007685892, 0.02928641, 0.8470588, 1, 0, 1,
-0.83895, -0.3666594, -3.611427, 0.8431373, 1, 0, 1,
-0.8321423, 0.9485846, -0.3094245, 0.8352941, 1, 0, 1,
-0.8198967, 0.5064557, -0.4110568, 0.8313726, 1, 0, 1,
-0.8196974, 0.8028262, -0.3469774, 0.8235294, 1, 0, 1,
-0.8177691, -0.6358796, -1.932986, 0.8196079, 1, 0, 1,
-0.815128, 0.4576438, -0.9903281, 0.8117647, 1, 0, 1,
-0.813499, 0.3357495, -0.8766171, 0.8078431, 1, 0, 1,
-0.8109072, 1.845841, 0.9013988, 0.8, 1, 0, 1,
-0.8089438, 0.1356248, 0.2262643, 0.7921569, 1, 0, 1,
-0.8025027, 0.324898, -0.04366165, 0.7882353, 1, 0, 1,
-0.8013641, 0.7105887, -2.106529, 0.7803922, 1, 0, 1,
-0.8005264, -0.0972888, 1.015103, 0.7764706, 1, 0, 1,
-0.7961785, 1.045523, -2.224986, 0.7686275, 1, 0, 1,
-0.7949277, 0.7921277, -1.635539, 0.7647059, 1, 0, 1,
-0.7947942, -0.3745948, -2.187927, 0.7568628, 1, 0, 1,
-0.7916141, -0.773331, -0.6634618, 0.7529412, 1, 0, 1,
-0.7882557, 0.7149177, -0.2878368, 0.7450981, 1, 0, 1,
-0.7872459, -0.04605035, -0.5874031, 0.7411765, 1, 0, 1,
-0.7862085, 0.5347026, -0.03793406, 0.7333333, 1, 0, 1,
-0.7821876, -0.4170078, -0.3567504, 0.7294118, 1, 0, 1,
-0.779976, -0.5250688, -2.350765, 0.7215686, 1, 0, 1,
-0.7765239, 0.3218353, -0.03741122, 0.7176471, 1, 0, 1,
-0.7663636, 1.295209, 0.9642034, 0.7098039, 1, 0, 1,
-0.7597924, -0.6513025, -2.966607, 0.7058824, 1, 0, 1,
-0.755303, 1.723798, -0.1818818, 0.6980392, 1, 0, 1,
-0.7397596, 0.9250124, 0.1957024, 0.6901961, 1, 0, 1,
-0.7327363, -1.277821, -2.664738, 0.6862745, 1, 0, 1,
-0.7306038, -0.2886399, -2.5692, 0.6784314, 1, 0, 1,
-0.7297297, 0.5073013, -2.684696, 0.6745098, 1, 0, 1,
-0.7263719, -0.06833348, -1.299873, 0.6666667, 1, 0, 1,
-0.7260738, -1.207004, -1.752158, 0.6627451, 1, 0, 1,
-0.7253903, -1.386177, -2.019241, 0.654902, 1, 0, 1,
-0.7244982, -0.8698305, -1.250793, 0.6509804, 1, 0, 1,
-0.7206566, -0.9295055, -2.084315, 0.6431373, 1, 0, 1,
-0.7140559, -0.7436503, -2.555566, 0.6392157, 1, 0, 1,
-0.7123947, -0.5445392, -0.1412585, 0.6313726, 1, 0, 1,
-0.7116943, -0.9390867, -1.825322, 0.627451, 1, 0, 1,
-0.709484, -0.9074667, -1.862755, 0.6196079, 1, 0, 1,
-0.7070712, 0.338419, -0.3333329, 0.6156863, 1, 0, 1,
-0.7041327, 0.5346811, -1.373701, 0.6078432, 1, 0, 1,
-0.7028899, 0.2581739, -2.103222, 0.6039216, 1, 0, 1,
-0.6974772, -0.3248061, -3.026244, 0.5960785, 1, 0, 1,
-0.6954273, 0.4369982, -1.17024, 0.5882353, 1, 0, 1,
-0.6947524, -1.646909, -3.350635, 0.5843138, 1, 0, 1,
-0.6943201, -0.086036, -2.259867, 0.5764706, 1, 0, 1,
-0.6848886, 0.09004939, -1.786336, 0.572549, 1, 0, 1,
-0.6824918, -1.685294, -1.222869, 0.5647059, 1, 0, 1,
-0.6759641, 0.6235403, -0.2748705, 0.5607843, 1, 0, 1,
-0.6734638, -1.388452, -4.641235, 0.5529412, 1, 0, 1,
-0.6723356, 0.4917497, -1.689769, 0.5490196, 1, 0, 1,
-0.67062, 0.7117841, -0.7798967, 0.5411765, 1, 0, 1,
-0.6704903, -0.1475348, -1.024053, 0.5372549, 1, 0, 1,
-0.6673657, 2.148172, -0.6286827, 0.5294118, 1, 0, 1,
-0.6656865, 0.4059439, -0.3477812, 0.5254902, 1, 0, 1,
-0.664301, -3.140106, -2.816733, 0.5176471, 1, 0, 1,
-0.6635988, 0.8383795, 0.9801499, 0.5137255, 1, 0, 1,
-0.6606221, -0.5768978, -2.227334, 0.5058824, 1, 0, 1,
-0.6601114, -0.09064102, -1.316881, 0.5019608, 1, 0, 1,
-0.655743, 2.578026, -1.010388, 0.4941176, 1, 0, 1,
-0.6544483, -1.558133, -4.291624, 0.4862745, 1, 0, 1,
-0.6530662, -0.5985411, -1.647246, 0.4823529, 1, 0, 1,
-0.652494, -0.5988863, -2.863289, 0.4745098, 1, 0, 1,
-0.6524664, 0.2818487, -1.47347, 0.4705882, 1, 0, 1,
-0.6518759, -0.8744117, -2.426025, 0.4627451, 1, 0, 1,
-0.6459249, 0.09121562, -0.818381, 0.4588235, 1, 0, 1,
-0.6444638, 0.425432, -1.71978, 0.4509804, 1, 0, 1,
-0.6420913, 0.7358239, -0.03928619, 0.4470588, 1, 0, 1,
-0.6391991, -0.7829797, -2.995489, 0.4392157, 1, 0, 1,
-0.6334234, -0.3979349, -1.889062, 0.4352941, 1, 0, 1,
-0.6253797, 0.2525154, -1.783453, 0.427451, 1, 0, 1,
-0.6249411, -1.33261, -2.683635, 0.4235294, 1, 0, 1,
-0.6242435, 0.3077968, -1.288396, 0.4156863, 1, 0, 1,
-0.6241483, 0.8262428, 0.6930589, 0.4117647, 1, 0, 1,
-0.6215937, -0.9477752, -1.149549, 0.4039216, 1, 0, 1,
-0.6182595, 0.5998098, 0.3630321, 0.3960784, 1, 0, 1,
-0.6181121, 0.9072459, -0.03896347, 0.3921569, 1, 0, 1,
-0.6178452, 1.086141, 1.081889, 0.3843137, 1, 0, 1,
-0.6151477, 0.632262, -0.1852141, 0.3803922, 1, 0, 1,
-0.6133506, -0.6292619, -3.509403, 0.372549, 1, 0, 1,
-0.6107546, -0.8409321, -4.92369, 0.3686275, 1, 0, 1,
-0.6088614, -0.5897651, -0.8917261, 0.3607843, 1, 0, 1,
-0.6077476, 0.5127358, 1.534706, 0.3568628, 1, 0, 1,
-0.6023888, 1.083915, -0.8636783, 0.3490196, 1, 0, 1,
-0.5893847, -1.310836, -2.300801, 0.345098, 1, 0, 1,
-0.5889122, 1.787302, 0.5115929, 0.3372549, 1, 0, 1,
-0.5776915, 0.5758135, 0.7224438, 0.3333333, 1, 0, 1,
-0.5753141, 1.542198, -0.2623279, 0.3254902, 1, 0, 1,
-0.5750545, 0.1876627, -0.964801, 0.3215686, 1, 0, 1,
-0.5733632, 1.744568, 0.018804, 0.3137255, 1, 0, 1,
-0.5733513, 0.1291843, -1.224339, 0.3098039, 1, 0, 1,
-0.5692177, 0.08267736, -2.069057, 0.3019608, 1, 0, 1,
-0.5665371, -0.4641042, -0.4688973, 0.2941177, 1, 0, 1,
-0.56492, -0.3577034, -3.21395, 0.2901961, 1, 0, 1,
-0.5614818, -1.905189, -1.703931, 0.282353, 1, 0, 1,
-0.5611469, -2.955136, -3.091538, 0.2784314, 1, 0, 1,
-0.5581965, -0.651646, -2.333855, 0.2705882, 1, 0, 1,
-0.5525357, -0.9059971, -2.100111, 0.2666667, 1, 0, 1,
-0.5517952, -2.143137, -2.151852, 0.2588235, 1, 0, 1,
-0.5487063, -0.1696516, 0.08525042, 0.254902, 1, 0, 1,
-0.5448682, 1.275417, 0.8795868, 0.2470588, 1, 0, 1,
-0.5422577, 0.3420888, -1.065555, 0.2431373, 1, 0, 1,
-0.5380425, 1.450178, -1.573819, 0.2352941, 1, 0, 1,
-0.5372283, 0.1169511, -0.4239405, 0.2313726, 1, 0, 1,
-0.534536, -0.4733743, -3.687791, 0.2235294, 1, 0, 1,
-0.5306997, -0.5517948, -2.235125, 0.2196078, 1, 0, 1,
-0.5280908, -0.8370233, -4.640769, 0.2117647, 1, 0, 1,
-0.527539, -0.8710185, -2.889208, 0.2078431, 1, 0, 1,
-0.5269663, -1.940497, -4.252904, 0.2, 1, 0, 1,
-0.5230913, 1.324063, -1.24506, 0.1921569, 1, 0, 1,
-0.5224454, -0.09588668, -1.544549, 0.1882353, 1, 0, 1,
-0.5212401, 0.7897708, -1.959249, 0.1803922, 1, 0, 1,
-0.5192133, 0.9674117, -0.09698788, 0.1764706, 1, 0, 1,
-0.5178643, -1.428433, -3.208152, 0.1686275, 1, 0, 1,
-0.5141701, 0.6470535, -0.1329384, 0.1647059, 1, 0, 1,
-0.5090711, 0.4827661, -1.796964, 0.1568628, 1, 0, 1,
-0.4992316, -0.6436781, -2.969348, 0.1529412, 1, 0, 1,
-0.4945231, 0.1572943, -3.477872, 0.145098, 1, 0, 1,
-0.4938672, 1.168277, -1.035141, 0.1411765, 1, 0, 1,
-0.4892317, 0.139514, -0.6339585, 0.1333333, 1, 0, 1,
-0.482372, -0.2232208, -2.338286, 0.1294118, 1, 0, 1,
-0.4813288, 1.078192, -1.043511, 0.1215686, 1, 0, 1,
-0.4743337, 0.6803312, -1.121543, 0.1176471, 1, 0, 1,
-0.4734468, 0.1220397, -1.002875, 0.1098039, 1, 0, 1,
-0.4731197, 1.380079, 0.9917848, 0.1058824, 1, 0, 1,
-0.4684782, 0.2432251, 0.4431225, 0.09803922, 1, 0, 1,
-0.4666357, -1.849354, -4.112604, 0.09019608, 1, 0, 1,
-0.4661574, -1.466461, -3.82397, 0.08627451, 1, 0, 1,
-0.4644851, 0.6385425, 0.1106838, 0.07843138, 1, 0, 1,
-0.4643594, 0.4473161, 0.1228461, 0.07450981, 1, 0, 1,
-0.4613883, -0.5006753, -2.013988, 0.06666667, 1, 0, 1,
-0.4526461, -0.6508461, -1.162235, 0.0627451, 1, 0, 1,
-0.4454392, -1.190373, -3.560232, 0.05490196, 1, 0, 1,
-0.4437058, 2.060177, 1.069635, 0.05098039, 1, 0, 1,
-0.4362103, 1.327123, 1.605222, 0.04313726, 1, 0, 1,
-0.4356596, 1.197428, -0.929986, 0.03921569, 1, 0, 1,
-0.4318221, -1.27656, -1.869424, 0.03137255, 1, 0, 1,
-0.4316894, -2.091663, -3.174748, 0.02745098, 1, 0, 1,
-0.4236189, 1.097594, -1.338859, 0.01960784, 1, 0, 1,
-0.4234669, 0.2597775, -1.195284, 0.01568628, 1, 0, 1,
-0.41897, -1.587202, -2.900316, 0.007843138, 1, 0, 1,
-0.4187273, -1.8884, -2.07934, 0.003921569, 1, 0, 1,
-0.4136347, -0.5022056, -1.87106, 0, 1, 0.003921569, 1,
-0.4133542, -1.139191, -2.946347, 0, 1, 0.01176471, 1,
-0.4127637, -2.13924, -2.621136, 0, 1, 0.01568628, 1,
-0.4106736, 0.5265483, -0.3123575, 0, 1, 0.02352941, 1,
-0.4098456, -0.4390592, -2.395008, 0, 1, 0.02745098, 1,
-0.4097356, -0.5688335, -2.386003, 0, 1, 0.03529412, 1,
-0.4094976, 2.483989, -1.00159, 0, 1, 0.03921569, 1,
-0.4059038, 0.7518977, -2.054481, 0, 1, 0.04705882, 1,
-0.4041071, 0.8348169, -0.7298196, 0, 1, 0.05098039, 1,
-0.4033197, 1.286843, 0.0539109, 0, 1, 0.05882353, 1,
-0.4009165, -1.55847, -1.107935, 0, 1, 0.0627451, 1,
-0.3990525, -0.4070973, -2.93313, 0, 1, 0.07058824, 1,
-0.3953134, -0.3115802, -1.713829, 0, 1, 0.07450981, 1,
-0.3911159, -1.368155, -2.495309, 0, 1, 0.08235294, 1,
-0.3905821, 1.0857, -0.7068233, 0, 1, 0.08627451, 1,
-0.3858531, 0.26787, -2.82186, 0, 1, 0.09411765, 1,
-0.3857751, -1.414312, -3.688516, 0, 1, 0.1019608, 1,
-0.3819817, -0.1947332, -1.381925, 0, 1, 0.1058824, 1,
-0.3791998, -2.539947, -3.478415, 0, 1, 0.1137255, 1,
-0.3788091, -0.6820387, -2.032054, 0, 1, 0.1176471, 1,
-0.3768461, -0.8431212, -3.129453, 0, 1, 0.1254902, 1,
-0.3767082, -0.9384067, -2.219956, 0, 1, 0.1294118, 1,
-0.3766466, 1.258941, -0.05717564, 0, 1, 0.1372549, 1,
-0.3754656, -0.4648938, -2.300191, 0, 1, 0.1411765, 1,
-0.3749124, -1.114983, -2.727027, 0, 1, 0.1490196, 1,
-0.3725022, -1.172084, -4.257289, 0, 1, 0.1529412, 1,
-0.3703984, -0.8010772, -2.974012, 0, 1, 0.1607843, 1,
-0.3666305, 1.430415, 0.3371862, 0, 1, 0.1647059, 1,
-0.3627944, 1.45785, 1.251391, 0, 1, 0.172549, 1,
-0.3627109, 1.222767, 0.1076843, 0, 1, 0.1764706, 1,
-0.3610975, -2.446237, -2.508008, 0, 1, 0.1843137, 1,
-0.3566884, 1.327538, -2.59586, 0, 1, 0.1882353, 1,
-0.3551352, -0.5568196, -2.806339, 0, 1, 0.1960784, 1,
-0.3549779, -0.4098151, -1.805161, 0, 1, 0.2039216, 1,
-0.3541602, -0.3202209, -2.774072, 0, 1, 0.2078431, 1,
-0.3530713, 0.03503409, -1.452477, 0, 1, 0.2156863, 1,
-0.3527439, -0.8885595, -2.318209, 0, 1, 0.2196078, 1,
-0.3428997, -0.5277972, -3.649633, 0, 1, 0.227451, 1,
-0.3395604, -1.185869, -2.942173, 0, 1, 0.2313726, 1,
-0.3335426, 1.502839, 0.03606909, 0, 1, 0.2392157, 1,
-0.3276403, -2.874122, -4.4661, 0, 1, 0.2431373, 1,
-0.3195462, -1.420733, -2.903237, 0, 1, 0.2509804, 1,
-0.3182674, 0.6282532, -0.9050412, 0, 1, 0.254902, 1,
-0.3172585, 1.481181, -1.046908, 0, 1, 0.2627451, 1,
-0.3171426, 1.455523, 0.4360062, 0, 1, 0.2666667, 1,
-0.3134523, -1.414178, -2.173388, 0, 1, 0.2745098, 1,
-0.3129206, 0.03364303, -1.637615, 0, 1, 0.2784314, 1,
-0.3094175, -0.6164916, -1.63723, 0, 1, 0.2862745, 1,
-0.3073488, -1.16497, -2.020519, 0, 1, 0.2901961, 1,
-0.306367, 0.832204, -0.3353801, 0, 1, 0.2980392, 1,
-0.3062054, -0.5779445, -4.108187, 0, 1, 0.3058824, 1,
-0.306092, 0.680811, -2.373963, 0, 1, 0.3098039, 1,
-0.3046909, 1.4604, -0.4453951, 0, 1, 0.3176471, 1,
-0.3022111, 2.087097, -0.288661, 0, 1, 0.3215686, 1,
-0.2997023, 2.105459, 0.863847, 0, 1, 0.3294118, 1,
-0.29682, 2.413081, -0.2549817, 0, 1, 0.3333333, 1,
-0.2915096, -0.2811224, -1.844127, 0, 1, 0.3411765, 1,
-0.2911656, -0.6234254, -3.093692, 0, 1, 0.345098, 1,
-0.2886595, 0.4896042, -0.07440709, 0, 1, 0.3529412, 1,
-0.2885879, -0.1879339, -2.857274, 0, 1, 0.3568628, 1,
-0.2856945, 1.50601, -0.3712969, 0, 1, 0.3647059, 1,
-0.2797441, 0.9126927, 2.348338, 0, 1, 0.3686275, 1,
-0.2692811, -0.1603282, -2.738843, 0, 1, 0.3764706, 1,
-0.2679308, 0.5618738, 1.603102, 0, 1, 0.3803922, 1,
-0.2677994, -0.2021361, -2.584138, 0, 1, 0.3882353, 1,
-0.2622562, 0.1919951, -0.2049485, 0, 1, 0.3921569, 1,
-0.261914, -0.6242321, -3.544246, 0, 1, 0.4, 1,
-0.2559052, 0.004184072, -0.4799634, 0, 1, 0.4078431, 1,
-0.2531926, 1.007581, 0.01537176, 0, 1, 0.4117647, 1,
-0.2464101, -0.5849631, -4.064297, 0, 1, 0.4196078, 1,
-0.2455639, -0.01207665, -1.680226, 0, 1, 0.4235294, 1,
-0.2438619, 0.8049269, -1.492443, 0, 1, 0.4313726, 1,
-0.2387592, -0.4442096, -1.189195, 0, 1, 0.4352941, 1,
-0.237445, 1.225451, -0.4084506, 0, 1, 0.4431373, 1,
-0.2300454, -2.060091, -4.774812, 0, 1, 0.4470588, 1,
-0.2299962, 1.752953, -1.344242, 0, 1, 0.454902, 1,
-0.228478, 0.1051769, -1.682494, 0, 1, 0.4588235, 1,
-0.2281075, 1.040929, -0.1164247, 0, 1, 0.4666667, 1,
-0.2270738, 0.06917176, -0.9779553, 0, 1, 0.4705882, 1,
-0.2260789, 0.5342557, -1.096753, 0, 1, 0.4784314, 1,
-0.2232035, -1.063779, -4.016426, 0, 1, 0.4823529, 1,
-0.221647, -1.158727, -3.170037, 0, 1, 0.4901961, 1,
-0.2211428, -1.443006, -2.605167, 0, 1, 0.4941176, 1,
-0.2176713, 2.155637, 0.1490542, 0, 1, 0.5019608, 1,
-0.215754, 1.860025, -1.045986, 0, 1, 0.509804, 1,
-0.2155019, -0.1418189, -3.675891, 0, 1, 0.5137255, 1,
-0.2147379, -0.8326329, -4.696125, 0, 1, 0.5215687, 1,
-0.2094486, 0.03196673, -1.942424, 0, 1, 0.5254902, 1,
-0.2066329, 0.9244395, 1.137998, 0, 1, 0.5333334, 1,
-0.206357, -0.1818451, -1.390166, 0, 1, 0.5372549, 1,
-0.2031346, -0.6187724, -1.814084, 0, 1, 0.5450981, 1,
-0.2013461, -0.9991835, -2.900096, 0, 1, 0.5490196, 1,
-0.2010901, 0.1483603, -0.1305392, 0, 1, 0.5568628, 1,
-0.2005687, -1.074914, -3.053907, 0, 1, 0.5607843, 1,
-0.1992117, -0.06143767, -3.010521, 0, 1, 0.5686275, 1,
-0.1979758, 0.1469188, -0.9527947, 0, 1, 0.572549, 1,
-0.1925576, 0.08202212, -0.7309102, 0, 1, 0.5803922, 1,
-0.1918406, 1.527039, -0.1702284, 0, 1, 0.5843138, 1,
-0.1901176, -1.370581, -4.106268, 0, 1, 0.5921569, 1,
-0.1897779, 0.7290185, -0.5273045, 0, 1, 0.5960785, 1,
-0.1883438, 1.699589, 1.416528, 0, 1, 0.6039216, 1,
-0.1868003, 0.9326397, 0.6649108, 0, 1, 0.6117647, 1,
-0.1826511, 0.6172569, -2.745601, 0, 1, 0.6156863, 1,
-0.181512, 1.198084, -0.2544037, 0, 1, 0.6235294, 1,
-0.1756047, 0.3978457, 1.229307, 0, 1, 0.627451, 1,
-0.1728103, 2.651519, -0.7416757, 0, 1, 0.6352941, 1,
-0.1716225, -1.337048, -4.242235, 0, 1, 0.6392157, 1,
-0.1710507, -1.309612, -2.793924, 0, 1, 0.6470588, 1,
-0.1707501, -1.365355, -1.353765, 0, 1, 0.6509804, 1,
-0.169974, 0.7090369, -0.431788, 0, 1, 0.6588235, 1,
-0.1692128, -1.742007, -3.025435, 0, 1, 0.6627451, 1,
-0.1688601, 0.4620534, 0.8271517, 0, 1, 0.6705883, 1,
-0.1673581, 3.382857, 0.4832555, 0, 1, 0.6745098, 1,
-0.1672952, 0.9368087, -1.389157, 0, 1, 0.682353, 1,
-0.1670952, 0.1637781, -0.5820091, 0, 1, 0.6862745, 1,
-0.1650749, -0.809284, -3.061391, 0, 1, 0.6941177, 1,
-0.1629252, 0.3825633, -0.8341709, 0, 1, 0.7019608, 1,
-0.162623, 0.7967637, 0.8610744, 0, 1, 0.7058824, 1,
-0.1622529, 1.38077, 0.6600678, 0, 1, 0.7137255, 1,
-0.1620031, 0.3804806, 1.023996, 0, 1, 0.7176471, 1,
-0.1592045, -1.382161, -1.649174, 0, 1, 0.7254902, 1,
-0.155654, -2.057721, -1.553697, 0, 1, 0.7294118, 1,
-0.1549862, -1.19777, -3.847855, 0, 1, 0.7372549, 1,
-0.1493405, -1.206314, -2.513596, 0, 1, 0.7411765, 1,
-0.1461248, -0.655999, -1.507077, 0, 1, 0.7490196, 1,
-0.1433569, 1.78317, 0.6430697, 0, 1, 0.7529412, 1,
-0.1423322, -0.8528289, -5.403387, 0, 1, 0.7607843, 1,
-0.1368058, 1.723127, -0.5977845, 0, 1, 0.7647059, 1,
-0.1354118, -0.7605483, -1.439418, 0, 1, 0.772549, 1,
-0.1352256, 1.75753, -0.9100921, 0, 1, 0.7764706, 1,
-0.1304838, 0.5369508, -0.8117692, 0, 1, 0.7843137, 1,
-0.1288618, -0.8367158, -3.28783, 0, 1, 0.7882353, 1,
-0.1284295, 1.38557, -0.6194378, 0, 1, 0.7960784, 1,
-0.1212643, 0.02897548, -0.9121922, 0, 1, 0.8039216, 1,
-0.1178726, -1.477371, -4.142469, 0, 1, 0.8078431, 1,
-0.1171551, -1.300376, -4.434361, 0, 1, 0.8156863, 1,
-0.1168244, -1.034503, -2.670785, 0, 1, 0.8196079, 1,
-0.1161847, 0.2443823, -0.08833958, 0, 1, 0.827451, 1,
-0.1122996, -0.1242185, -4.074225, 0, 1, 0.8313726, 1,
-0.1122617, -0.307363, -3.32113, 0, 1, 0.8392157, 1,
-0.1116632, -0.3337624, -1.324608, 0, 1, 0.8431373, 1,
-0.1111875, -0.2006397, -1.792911, 0, 1, 0.8509804, 1,
-0.1027224, 1.431619, -0.6237175, 0, 1, 0.854902, 1,
-0.1020632, 0.3745877, -0.6866177, 0, 1, 0.8627451, 1,
-0.1011785, 0.01581359, -0.6942084, 0, 1, 0.8666667, 1,
-0.0987613, 0.9155848, -1.390509, 0, 1, 0.8745098, 1,
-0.09789757, -0.04837672, -2.744823, 0, 1, 0.8784314, 1,
-0.0967756, 1.256463, 0.333459, 0, 1, 0.8862745, 1,
-0.09294939, -0.7827653, -3.115643, 0, 1, 0.8901961, 1,
-0.09205011, -1.7222, -3.626619, 0, 1, 0.8980392, 1,
-0.09078702, -1.781663, -4.57502, 0, 1, 0.9058824, 1,
-0.08662608, -0.7615466, -4.468111, 0, 1, 0.9098039, 1,
-0.0847903, 0.7875544, -0.08828813, 0, 1, 0.9176471, 1,
-0.08148678, 0.6482815, -0.7770023, 0, 1, 0.9215686, 1,
-0.08035766, 0.2886301, -0.1766654, 0, 1, 0.9294118, 1,
-0.0790358, 0.991038, -1.291503, 0, 1, 0.9333333, 1,
-0.07623956, 0.3617418, -1.916503, 0, 1, 0.9411765, 1,
-0.07569095, 1.119611, 0.4475805, 0, 1, 0.945098, 1,
-0.07130549, -0.2292406, -2.470671, 0, 1, 0.9529412, 1,
-0.07044607, 1.140348, 0.1800708, 0, 1, 0.9568627, 1,
-0.06892421, -1.06817, -3.754918, 0, 1, 0.9647059, 1,
-0.05929818, 0.2903903, -0.5902253, 0, 1, 0.9686275, 1,
-0.05888132, 0.6103517, -1.084277, 0, 1, 0.9764706, 1,
-0.05636752, 1.295229, 0.4988622, 0, 1, 0.9803922, 1,
-0.05588995, 0.1821133, -2.121575, 0, 1, 0.9882353, 1,
-0.05548334, -0.3790236, -3.686633, 0, 1, 0.9921569, 1,
-0.05054396, 0.4581016, 0.2475783, 0, 1, 1, 1,
-0.04837295, -1.746306, -2.932484, 0, 0.9921569, 1, 1,
-0.04824689, 2.340312, 0.4101861, 0, 0.9882353, 1, 1,
-0.04309241, 0.1353346, 0.1745518, 0, 0.9803922, 1, 1,
-0.03655294, 0.5127097, 0.6072, 0, 0.9764706, 1, 1,
-0.0364131, 0.4031096, 0.4900576, 0, 0.9686275, 1, 1,
-0.03213786, 0.8689289, 1.478698, 0, 0.9647059, 1, 1,
-0.02940494, -1.247865, -4.17949, 0, 0.9568627, 1, 1,
-0.02493724, -0.1997813, -3.082875, 0, 0.9529412, 1, 1,
-0.02415893, -1.960247, -2.316813, 0, 0.945098, 1, 1,
-0.02404839, 0.6919841, 1.488184, 0, 0.9411765, 1, 1,
-0.02315364, 0.2574725, -0.6410074, 0, 0.9333333, 1, 1,
-0.02189924, -1.194606, -2.308412, 0, 0.9294118, 1, 1,
-0.01980428, -0.3246234, -1.974357, 0, 0.9215686, 1, 1,
-0.01950458, 0.7178484, 0.4438647, 0, 0.9176471, 1, 1,
-0.01692609, -1.011184, -2.435452, 0, 0.9098039, 1, 1,
-0.0161965, -1.067299, -3.88491, 0, 0.9058824, 1, 1,
-0.01040327, -0.3453704, -2.808988, 0, 0.8980392, 1, 1,
-0.01032445, 0.4159849, -1.283476, 0, 0.8901961, 1, 1,
-0.004940753, 0.2926059, 0.07811955, 0, 0.8862745, 1, 1,
-0.002313013, 0.06713566, 0.481503, 0, 0.8784314, 1, 1,
-0.001815101, 0.0469623, 0.6612319, 0, 0.8745098, 1, 1,
0.002794724, -0.3136841, 3.579471, 0, 0.8666667, 1, 1,
0.005369142, -0.1582257, 2.837562, 0, 0.8627451, 1, 1,
0.005590554, -0.1646767, 3.569108, 0, 0.854902, 1, 1,
0.00631213, 1.328964, 1.060562, 0, 0.8509804, 1, 1,
0.009194879, 1.73706, 0.8601959, 0, 0.8431373, 1, 1,
0.01024385, -1.699174, 3.081725, 0, 0.8392157, 1, 1,
0.01156588, -0.3663392, 2.753902, 0, 0.8313726, 1, 1,
0.01280563, 0.5356717, -0.7080593, 0, 0.827451, 1, 1,
0.01504787, 1.123879, -0.9144518, 0, 0.8196079, 1, 1,
0.01707736, -2.158885, 1.289695, 0, 0.8156863, 1, 1,
0.01753095, -1.497728, 3.228263, 0, 0.8078431, 1, 1,
0.02088135, 0.5746024, 1.249515, 0, 0.8039216, 1, 1,
0.02259228, -1.503607, 3.509906, 0, 0.7960784, 1, 1,
0.02342749, 0.05910411, -1.172761, 0, 0.7882353, 1, 1,
0.02401594, -0.1849505, 1.525929, 0, 0.7843137, 1, 1,
0.02697558, 0.1044944, 0.7804381, 0, 0.7764706, 1, 1,
0.0273024, 0.07276653, -0.1624462, 0, 0.772549, 1, 1,
0.02864071, -0.6690587, 3.15838, 0, 0.7647059, 1, 1,
0.04186288, 2.176049, -0.1563417, 0, 0.7607843, 1, 1,
0.04316895, 2.038879, -0.1511772, 0, 0.7529412, 1, 1,
0.04405303, 1.92011, 0.03213686, 0, 0.7490196, 1, 1,
0.04478559, -0.1671311, 4.610241, 0, 0.7411765, 1, 1,
0.04847667, -0.08519966, 1.623172, 0, 0.7372549, 1, 1,
0.05013628, 0.3224946, 0.7453219, 0, 0.7294118, 1, 1,
0.05104626, 1.104498, -0.511237, 0, 0.7254902, 1, 1,
0.0519717, -1.579454, 2.235549, 0, 0.7176471, 1, 1,
0.05788701, -0.3446181, 3.003776, 0, 0.7137255, 1, 1,
0.05824906, -0.6194629, 3.801297, 0, 0.7058824, 1, 1,
0.05831967, 0.353774, 1.252652, 0, 0.6980392, 1, 1,
0.06526161, -1.223227, 1.097899, 0, 0.6941177, 1, 1,
0.06613375, -0.2360434, 3.068723, 0, 0.6862745, 1, 1,
0.06800615, -2.088975, 2.672777, 0, 0.682353, 1, 1,
0.06909307, 0.4142706, 0.2508657, 0, 0.6745098, 1, 1,
0.07715839, -0.794092, 3.70714, 0, 0.6705883, 1, 1,
0.08191539, -1.016009, 1.059823, 0, 0.6627451, 1, 1,
0.08216203, 0.1227622, 1.233872, 0, 0.6588235, 1, 1,
0.08904888, 0.0334168, 1.056108, 0, 0.6509804, 1, 1,
0.09192066, -1.152226, 5.214449, 0, 0.6470588, 1, 1,
0.0926924, -0.2091119, 3.857148, 0, 0.6392157, 1, 1,
0.09457181, 0.8426329, 0.3093281, 0, 0.6352941, 1, 1,
0.09996268, 0.2619562, 0.4281261, 0, 0.627451, 1, 1,
0.1000379, -1.047494, 2.453561, 0, 0.6235294, 1, 1,
0.1029627, 0.52175, -0.07402066, 0, 0.6156863, 1, 1,
0.1057731, -0.1196687, 3.315228, 0, 0.6117647, 1, 1,
0.1072558, -1.338687, 2.897525, 0, 0.6039216, 1, 1,
0.1075841, -0.1253162, 1.480425, 0, 0.5960785, 1, 1,
0.1088738, 1.32265, 1.741142, 0, 0.5921569, 1, 1,
0.112461, -0.2595667, 1.214635, 0, 0.5843138, 1, 1,
0.1134383, -1.143861, 3.724934, 0, 0.5803922, 1, 1,
0.117749, 0.7836672, 1.311706, 0, 0.572549, 1, 1,
0.1214642, 0.7307115, -0.9433282, 0, 0.5686275, 1, 1,
0.1225311, -0.2798664, 3.246934, 0, 0.5607843, 1, 1,
0.1240577, 0.4949668, 0.05871833, 0, 0.5568628, 1, 1,
0.1260215, 1.614499, 1.678929, 0, 0.5490196, 1, 1,
0.1264499, 0.8282293, 1.830281, 0, 0.5450981, 1, 1,
0.1289606, -2.028747, 2.669183, 0, 0.5372549, 1, 1,
0.1307705, -1.131804, 2.410413, 0, 0.5333334, 1, 1,
0.1340307, -1.271331, 1.65777, 0, 0.5254902, 1, 1,
0.1345203, -0.3969573, 4.778258, 0, 0.5215687, 1, 1,
0.1387074, 2.311937, -0.6592089, 0, 0.5137255, 1, 1,
0.1440731, -0.6959957, 2.955152, 0, 0.509804, 1, 1,
0.1534177, -0.6297543, 3.959137, 0, 0.5019608, 1, 1,
0.1594804, 0.4292287, 0.18019, 0, 0.4941176, 1, 1,
0.1597592, 0.02098726, 1.639176, 0, 0.4901961, 1, 1,
0.1602521, -0.575388, 2.370379, 0, 0.4823529, 1, 1,
0.1605959, -1.248457, 2.967808, 0, 0.4784314, 1, 1,
0.1616096, 1.210797, 2.277045, 0, 0.4705882, 1, 1,
0.1643724, -2.944455, 2.974992, 0, 0.4666667, 1, 1,
0.1662507, -1.137329, 3.382951, 0, 0.4588235, 1, 1,
0.1670824, -1.873512, 3.485266, 0, 0.454902, 1, 1,
0.1700047, 0.2730864, 1.07742, 0, 0.4470588, 1, 1,
0.1743952, -1.183187, 1.789554, 0, 0.4431373, 1, 1,
0.1756098, -1.629801, 2.001719, 0, 0.4352941, 1, 1,
0.1802664, 0.9125092, -0.359361, 0, 0.4313726, 1, 1,
0.184563, 1.394693, 1.540418, 0, 0.4235294, 1, 1,
0.1936278, -0.1824478, 2.285075, 0, 0.4196078, 1, 1,
0.195287, 1.548975, -1.588093, 0, 0.4117647, 1, 1,
0.1956634, 0.4394467, -2.299205, 0, 0.4078431, 1, 1,
0.1978503, -0.8049477, 3.724941, 0, 0.4, 1, 1,
0.2005614, -0.005156429, 1.140905, 0, 0.3921569, 1, 1,
0.2010275, 0.1635481, 1.214071, 0, 0.3882353, 1, 1,
0.2097609, 0.6999561, 2.444472, 0, 0.3803922, 1, 1,
0.2115823, -0.3486547, 2.585487, 0, 0.3764706, 1, 1,
0.2128149, -0.3727189, 4.154904, 0, 0.3686275, 1, 1,
0.2131564, -0.5579803, 2.532289, 0, 0.3647059, 1, 1,
0.223306, -1.674651, 3.391565, 0, 0.3568628, 1, 1,
0.2242655, -0.3056848, 2.879725, 0, 0.3529412, 1, 1,
0.2245596, -1.409958, 2.022855, 0, 0.345098, 1, 1,
0.2254185, -0.238886, 0.7352851, 0, 0.3411765, 1, 1,
0.2295326, -1.200412, 2.15962, 0, 0.3333333, 1, 1,
0.2311179, 0.9513865, 1.686689, 0, 0.3294118, 1, 1,
0.2364522, 0.7764349, 1.161757, 0, 0.3215686, 1, 1,
0.243483, -0.08389734, 3.619618, 0, 0.3176471, 1, 1,
0.2440322, 0.4946285, 1.312154, 0, 0.3098039, 1, 1,
0.2466309, -1.038525, 4.759303, 0, 0.3058824, 1, 1,
0.2493088, 0.3704885, 0.4761419, 0, 0.2980392, 1, 1,
0.2527511, 0.1226675, 0.4008779, 0, 0.2901961, 1, 1,
0.2540906, 0.8451418, -1.255171, 0, 0.2862745, 1, 1,
0.2558508, -0.2916482, 3.059233, 0, 0.2784314, 1, 1,
0.2623881, 0.2146968, 0.6368256, 0, 0.2745098, 1, 1,
0.2628627, -0.2080325, 3.249743, 0, 0.2666667, 1, 1,
0.2666463, 0.6248819, 0.8963069, 0, 0.2627451, 1, 1,
0.268905, -0.5789657, 1.676187, 0, 0.254902, 1, 1,
0.2693938, 0.1303851, -0.2875462, 0, 0.2509804, 1, 1,
0.2727481, 1.317677, 1.676558, 0, 0.2431373, 1, 1,
0.2731577, 0.07804379, 1.943908, 0, 0.2392157, 1, 1,
0.2772833, 1.419309, 0.8421801, 0, 0.2313726, 1, 1,
0.2826588, 0.3509754, 0.1544299, 0, 0.227451, 1, 1,
0.2903088, 0.9315751, 0.3555168, 0, 0.2196078, 1, 1,
0.2916929, -1.309952, 4.380015, 0, 0.2156863, 1, 1,
0.2924947, 1.799498, -0.9780383, 0, 0.2078431, 1, 1,
0.2955405, -0.4066359, 2.260005, 0, 0.2039216, 1, 1,
0.3000633, 0.03867058, 0.8976688, 0, 0.1960784, 1, 1,
0.3013944, 0.4296416, 0.2304926, 0, 0.1882353, 1, 1,
0.3059377, 0.2155346, 1.728089, 0, 0.1843137, 1, 1,
0.3071008, 0.2416667, 0.3618212, 0, 0.1764706, 1, 1,
0.3246003, 0.7036867, -0.9285685, 0, 0.172549, 1, 1,
0.3308932, -0.7278719, 2.371233, 0, 0.1647059, 1, 1,
0.3313244, 0.5458436, -0.6231868, 0, 0.1607843, 1, 1,
0.3318592, -1.566759, 3.107324, 0, 0.1529412, 1, 1,
0.3331131, 1.017187, -1.177831, 0, 0.1490196, 1, 1,
0.333299, 0.1956957, 1.384109, 0, 0.1411765, 1, 1,
0.3338192, 0.5441321, -1.305532, 0, 0.1372549, 1, 1,
0.3339755, 0.4072077, 1.479667, 0, 0.1294118, 1, 1,
0.33449, -1.181166, 2.301349, 0, 0.1254902, 1, 1,
0.334563, -0.3501376, 2.28816, 0, 0.1176471, 1, 1,
0.334872, -0.7755509, 2.711568, 0, 0.1137255, 1, 1,
0.3351314, 0.3409372, 0.2871517, 0, 0.1058824, 1, 1,
0.3353189, 0.1175751, 1.590206, 0, 0.09803922, 1, 1,
0.3381945, 0.7694313, -0.001223005, 0, 0.09411765, 1, 1,
0.3451431, 1.011286, -0.217034, 0, 0.08627451, 1, 1,
0.3489927, -0.2923161, 0.9210457, 0, 0.08235294, 1, 1,
0.3495257, 0.2792918, 0.2235, 0, 0.07450981, 1, 1,
0.3516826, -0.3058688, 1.515631, 0, 0.07058824, 1, 1,
0.3586822, -0.7154701, 3.464301, 0, 0.0627451, 1, 1,
0.3627042, -0.1607169, 2.654198, 0, 0.05882353, 1, 1,
0.3628359, -1.820649, 4.368228, 0, 0.05098039, 1, 1,
0.3741366, -1.169405, 2.05625, 0, 0.04705882, 1, 1,
0.3777238, 0.9651422, 0.8896447, 0, 0.03921569, 1, 1,
0.3777448, 1.372511, 0.1720825, 0, 0.03529412, 1, 1,
0.3800726, -0.2998832, 0.628855, 0, 0.02745098, 1, 1,
0.38509, 0.1308358, 1.655797, 0, 0.02352941, 1, 1,
0.3868012, 1.726582, 0.4138821, 0, 0.01568628, 1, 1,
0.3935253, 0.7205432, -0.1396088, 0, 0.01176471, 1, 1,
0.3952717, 0.8193177, 0.2328587, 0, 0.003921569, 1, 1,
0.3962865, 0.1065553, 2.375943, 0.003921569, 0, 1, 1,
0.3970853, 0.4386249, 2.410048, 0.007843138, 0, 1, 1,
0.3982778, -0.2179085, 1.115005, 0.01568628, 0, 1, 1,
0.399183, 0.9343596, 1.09407, 0.01960784, 0, 1, 1,
0.3994441, 0.6614484, 1.286264, 0.02745098, 0, 1, 1,
0.4046423, -1.654505, 2.470009, 0.03137255, 0, 1, 1,
0.4058924, 0.7241548, -0.3330767, 0.03921569, 0, 1, 1,
0.4079852, -1.360839, 4.961451, 0.04313726, 0, 1, 1,
0.4133511, -0.5214406, 2.34288, 0.05098039, 0, 1, 1,
0.4152085, -1.148503, 3.756056, 0.05490196, 0, 1, 1,
0.4181423, -0.01573448, 2.84498, 0.0627451, 0, 1, 1,
0.4264796, 1.015414, 0.3985697, 0.06666667, 0, 1, 1,
0.4279942, -0.1238283, 1.669716, 0.07450981, 0, 1, 1,
0.4282422, 1.116358, 0.5983114, 0.07843138, 0, 1, 1,
0.4307937, 1.314553, -0.9012529, 0.08627451, 0, 1, 1,
0.4372919, -2.009106, 2.626291, 0.09019608, 0, 1, 1,
0.440338, -0.9402585, 3.039267, 0.09803922, 0, 1, 1,
0.4419945, -0.972497, 2.962267, 0.1058824, 0, 1, 1,
0.4422098, 1.2021, -0.8386077, 0.1098039, 0, 1, 1,
0.4422539, 1.716433, 0.443961, 0.1176471, 0, 1, 1,
0.445142, -0.2435957, 3.527352, 0.1215686, 0, 1, 1,
0.4482808, 0.4959087, 0.6250603, 0.1294118, 0, 1, 1,
0.4501703, 1.886538, -0.6846956, 0.1333333, 0, 1, 1,
0.451445, -0.334778, 2.891935, 0.1411765, 0, 1, 1,
0.453231, -0.0285067, 2.581955, 0.145098, 0, 1, 1,
0.4536668, -1.274758, 1.995293, 0.1529412, 0, 1, 1,
0.454859, -2.013669, 4.073107, 0.1568628, 0, 1, 1,
0.4579152, -0.4863061, 4.096423, 0.1647059, 0, 1, 1,
0.4591215, -0.5499838, 3.51048, 0.1686275, 0, 1, 1,
0.4627241, 0.678229, -0.6124982, 0.1764706, 0, 1, 1,
0.4662766, 1.397534, 1.575014, 0.1803922, 0, 1, 1,
0.470145, -0.8578093, 2.384941, 0.1882353, 0, 1, 1,
0.471076, -0.5244402, 4.45997, 0.1921569, 0, 1, 1,
0.4711616, 0.8851958, -0.1191631, 0.2, 0, 1, 1,
0.4720253, -1.927612, 1.840127, 0.2078431, 0, 1, 1,
0.472349, -1.998829, 1.055394, 0.2117647, 0, 1, 1,
0.4755535, 0.01399508, 1.810326, 0.2196078, 0, 1, 1,
0.4763812, -0.3668008, 0.5447124, 0.2235294, 0, 1, 1,
0.480105, 0.7809282, -0.9519567, 0.2313726, 0, 1, 1,
0.4883074, 0.4427048, 2.460303, 0.2352941, 0, 1, 1,
0.4920012, 0.5224903, 1.377896, 0.2431373, 0, 1, 1,
0.4926084, 0.3365113, 0.1957595, 0.2470588, 0, 1, 1,
0.4942814, -0.1862033, 3.164496, 0.254902, 0, 1, 1,
0.4954744, 1.292988, -0.9527658, 0.2588235, 0, 1, 1,
0.4971257, 0.6424268, 0.1894012, 0.2666667, 0, 1, 1,
0.498418, -0.464609, 3.135397, 0.2705882, 0, 1, 1,
0.5023016, -2.455309, 2.933056, 0.2784314, 0, 1, 1,
0.5057833, 0.1124228, 3.576597, 0.282353, 0, 1, 1,
0.5080475, 0.7975348, 1.996013, 0.2901961, 0, 1, 1,
0.5084037, -1.189995, 4.259143, 0.2941177, 0, 1, 1,
0.5096501, 2.439588, 0.4770546, 0.3019608, 0, 1, 1,
0.5113578, 0.6833472, -1.736048, 0.3098039, 0, 1, 1,
0.5192389, -0.08651828, 3.691125, 0.3137255, 0, 1, 1,
0.5201353, -0.5578593, 2.354192, 0.3215686, 0, 1, 1,
0.5203197, -1.306325, 3.044247, 0.3254902, 0, 1, 1,
0.5222908, -1.35025, 2.679904, 0.3333333, 0, 1, 1,
0.5288664, 2.030591, -1.244887, 0.3372549, 0, 1, 1,
0.5424522, 0.6835207, 2.352333, 0.345098, 0, 1, 1,
0.5438337, 0.313273, 0.328624, 0.3490196, 0, 1, 1,
0.5471771, -1.535789, 2.186727, 0.3568628, 0, 1, 1,
0.5511918, 0.3134588, 0.7217584, 0.3607843, 0, 1, 1,
0.5522303, -1.140352, 2.66083, 0.3686275, 0, 1, 1,
0.5623387, 0.3274838, 2.05367, 0.372549, 0, 1, 1,
0.5641534, 0.2167326, 0.3549321, 0.3803922, 0, 1, 1,
0.5696512, -1.950938, 0.7579358, 0.3843137, 0, 1, 1,
0.5711393, -1.17244, 4.945371, 0.3921569, 0, 1, 1,
0.582917, 0.41979, 1.592132, 0.3960784, 0, 1, 1,
0.5856827, 0.1742783, 1.493006, 0.4039216, 0, 1, 1,
0.5866193, -0.1720307, 0.1341858, 0.4117647, 0, 1, 1,
0.5901524, 0.2370317, -0.2193343, 0.4156863, 0, 1, 1,
0.6098219, -0.9574456, 0.5344177, 0.4235294, 0, 1, 1,
0.6111196, 0.01251385, 0.1864817, 0.427451, 0, 1, 1,
0.6113785, 0.319237, 1.018976, 0.4352941, 0, 1, 1,
0.6304109, -0.07824703, 4.036665, 0.4392157, 0, 1, 1,
0.6309944, 1.270856, 0.6532058, 0.4470588, 0, 1, 1,
0.6313528, 2.312292, -0.3976933, 0.4509804, 0, 1, 1,
0.6316203, 0.00765096, 1.634917, 0.4588235, 0, 1, 1,
0.6363286, -0.308563, 3.500554, 0.4627451, 0, 1, 1,
0.6384931, 0.4310844, 0.946005, 0.4705882, 0, 1, 1,
0.6411393, -1.455007, 2.668465, 0.4745098, 0, 1, 1,
0.641414, -0.0621321, 0.3676495, 0.4823529, 0, 1, 1,
0.6436263, -0.7828146, 2.973637, 0.4862745, 0, 1, 1,
0.6444325, -1.021474, 1.863449, 0.4941176, 0, 1, 1,
0.6454153, 0.3179301, 3.332752, 0.5019608, 0, 1, 1,
0.6506545, 0.3492321, -0.3450679, 0.5058824, 0, 1, 1,
0.6524358, -0.3944609, 2.139824, 0.5137255, 0, 1, 1,
0.6586849, -0.5293305, 2.846925, 0.5176471, 0, 1, 1,
0.661469, -0.3072975, 1.906949, 0.5254902, 0, 1, 1,
0.6615098, 0.01761252, 2.277468, 0.5294118, 0, 1, 1,
0.6657422, -0.7665472, 4.211742, 0.5372549, 0, 1, 1,
0.6669995, -1.020181, 0.9405412, 0.5411765, 0, 1, 1,
0.6695096, -0.9121747, 2.943296, 0.5490196, 0, 1, 1,
0.6706344, -1.344573, 2.982818, 0.5529412, 0, 1, 1,
0.6706582, -0.2496707, 0.6851852, 0.5607843, 0, 1, 1,
0.6726872, 0.08611159, 1.792268, 0.5647059, 0, 1, 1,
0.6734366, -0.394403, 2.305114, 0.572549, 0, 1, 1,
0.6807246, 1.257198, 2.100809, 0.5764706, 0, 1, 1,
0.6922404, -0.3855954, 1.22044, 0.5843138, 0, 1, 1,
0.6926161, 1.189904, 1.184211, 0.5882353, 0, 1, 1,
0.6976144, 0.6040704, 1.25005, 0.5960785, 0, 1, 1,
0.6986953, -1.160066, 2.816192, 0.6039216, 0, 1, 1,
0.7017578, -0.8933212, 2.824988, 0.6078432, 0, 1, 1,
0.7081875, 1.194703, -0.7776838, 0.6156863, 0, 1, 1,
0.710088, -0.7905787, 1.269789, 0.6196079, 0, 1, 1,
0.718133, 1.65504, 0.04113682, 0.627451, 0, 1, 1,
0.7212181, -0.1749787, 0.7833585, 0.6313726, 0, 1, 1,
0.724692, -0.1786337, 0.912434, 0.6392157, 0, 1, 1,
0.7266539, -0.3387609, 2.056113, 0.6431373, 0, 1, 1,
0.7336025, -0.91189, 1.414281, 0.6509804, 0, 1, 1,
0.7398041, -0.6423869, 3.796364, 0.654902, 0, 1, 1,
0.7415057, 0.8395702, 0.2212362, 0.6627451, 0, 1, 1,
0.7450461, -1.44531, 4.088813, 0.6666667, 0, 1, 1,
0.7467465, -0.6099208, 2.848145, 0.6745098, 0, 1, 1,
0.7539853, 0.2992489, 0.641076, 0.6784314, 0, 1, 1,
0.7585899, -2.406209, 3.556128, 0.6862745, 0, 1, 1,
0.7650114, -0.2578388, 1.967531, 0.6901961, 0, 1, 1,
0.7714115, -1.261614, 1.388124, 0.6980392, 0, 1, 1,
0.7716498, -0.7875407, 1.346103, 0.7058824, 0, 1, 1,
0.7748133, -0.05520912, 2.070119, 0.7098039, 0, 1, 1,
0.7819843, -0.9589899, 2.208852, 0.7176471, 0, 1, 1,
0.7826632, -0.132046, 2.72444, 0.7215686, 0, 1, 1,
0.7864586, 0.7803552, 2.296429, 0.7294118, 0, 1, 1,
0.7875392, -2.660432, 1.564548, 0.7333333, 0, 1, 1,
0.7987109, -0.2652279, 0.2422921, 0.7411765, 0, 1, 1,
0.7991542, 0.4887587, 1.163314, 0.7450981, 0, 1, 1,
0.7995259, 0.8034543, 1.468222, 0.7529412, 0, 1, 1,
0.8014757, 1.285328, -0.3454654, 0.7568628, 0, 1, 1,
0.8025504, 2.060719, -0.007739132, 0.7647059, 0, 1, 1,
0.8033587, 0.3102597, 1.358392, 0.7686275, 0, 1, 1,
0.8035921, -0.3829139, 2.490378, 0.7764706, 0, 1, 1,
0.8044215, 1.374819, -0.3895933, 0.7803922, 0, 1, 1,
0.8111684, 0.9351513, 0.3023964, 0.7882353, 0, 1, 1,
0.8137813, 0.4372767, -1.322073, 0.7921569, 0, 1, 1,
0.8177214, -0.08040804, 2.013912, 0.8, 0, 1, 1,
0.821971, 1.018452, 0.08386113, 0.8078431, 0, 1, 1,
0.8267208, 1.378743, 0.5443864, 0.8117647, 0, 1, 1,
0.8269212, -1.299965, 2.830609, 0.8196079, 0, 1, 1,
0.8360537, -0.3277181, 2.382454, 0.8235294, 0, 1, 1,
0.8439148, 0.319543, -0.9048873, 0.8313726, 0, 1, 1,
0.8483492, -0.1205152, 2.795444, 0.8352941, 0, 1, 1,
0.8524766, -1.90947, 2.394683, 0.8431373, 0, 1, 1,
0.8528687, -1.396195, 3.697794, 0.8470588, 0, 1, 1,
0.8530799, 0.05953659, -0.6133935, 0.854902, 0, 1, 1,
0.8546964, 0.07768317, 1.878661, 0.8588235, 0, 1, 1,
0.8591055, 0.7594498, -0.04789997, 0.8666667, 0, 1, 1,
0.8615064, 0.5822996, 1.844215, 0.8705882, 0, 1, 1,
0.8629589, -1.956141, 3.558807, 0.8784314, 0, 1, 1,
0.8671984, 2.234308, 1.519434, 0.8823529, 0, 1, 1,
0.8679454, 1.162902, 0.4499158, 0.8901961, 0, 1, 1,
0.8691422, -1.483192, 1.533943, 0.8941177, 0, 1, 1,
0.8734642, -1.467521, 5.048368, 0.9019608, 0, 1, 1,
0.8754747, -1.009044, 3.039832, 0.9098039, 0, 1, 1,
0.8776592, -0.4145466, 0.947888, 0.9137255, 0, 1, 1,
0.8834239, -0.2511394, 2.133614, 0.9215686, 0, 1, 1,
0.8840473, -0.0572384, 2.109021, 0.9254902, 0, 1, 1,
0.8873488, 0.728004, 1.058341, 0.9333333, 0, 1, 1,
0.8882199, 2.361753, 0.7762156, 0.9372549, 0, 1, 1,
0.8968379, -0.1409512, 2.371791, 0.945098, 0, 1, 1,
0.8989242, -0.9512985, 2.609128, 0.9490196, 0, 1, 1,
0.9033208, 0.4827248, 1.816697, 0.9568627, 0, 1, 1,
0.9035236, 0.7811105, 0.01903708, 0.9607843, 0, 1, 1,
0.905424, 0.2507742, 1.834478, 0.9686275, 0, 1, 1,
0.9061221, -0.6225007, 2.951727, 0.972549, 0, 1, 1,
0.9085299, 1.21012, 1.627171, 0.9803922, 0, 1, 1,
0.9086111, -0.04838553, 2.272013, 0.9843137, 0, 1, 1,
0.9188255, -0.05129466, 2.133545, 0.9921569, 0, 1, 1,
0.9188436, 0.7743999, 0.47054, 0.9960784, 0, 1, 1,
0.9239132, 2.244875, -0.2002205, 1, 0, 0.9960784, 1,
0.9327699, 1.26463, -0.5112365, 1, 0, 0.9882353, 1,
0.9366322, -1.072879, 3.266838, 1, 0, 0.9843137, 1,
0.9371253, -0.7245437, 2.182504, 1, 0, 0.9764706, 1,
0.941219, -0.4690682, 3.267717, 1, 0, 0.972549, 1,
0.9424207, 1.21303, 0.9155259, 1, 0, 0.9647059, 1,
0.9491146, 0.996515, 1.886742, 1, 0, 0.9607843, 1,
0.9593037, 0.4751501, 1.381293, 1, 0, 0.9529412, 1,
0.9620045, 0.2878498, -0.2920257, 1, 0, 0.9490196, 1,
0.9680219, 0.3033731, 1.663137, 1, 0, 0.9411765, 1,
0.9690875, 1.624442, 1.068652, 1, 0, 0.9372549, 1,
0.9695884, -0.03260314, 2.233041, 1, 0, 0.9294118, 1,
0.9794548, 1.660414, 1.486072, 1, 0, 0.9254902, 1,
0.9805617, -1.268018, 2.464345, 1, 0, 0.9176471, 1,
1.002991, -0.3929681, 2.416842, 1, 0, 0.9137255, 1,
1.004109, -0.1547908, 2.764369, 1, 0, 0.9058824, 1,
1.015417, 0.3406872, 1.012977, 1, 0, 0.9019608, 1,
1.016017, -0.5103494, 2.540828, 1, 0, 0.8941177, 1,
1.018792, 0.4444417, 2.06993, 1, 0, 0.8862745, 1,
1.025058, -0.5068169, 0.6595995, 1, 0, 0.8823529, 1,
1.031411, 0.9742665, 0.6617486, 1, 0, 0.8745098, 1,
1.032599, -0.9533048, 1.579417, 1, 0, 0.8705882, 1,
1.041721, 1.268961, 1.139363, 1, 0, 0.8627451, 1,
1.043231, 1.576189, -0.1992575, 1, 0, 0.8588235, 1,
1.043344, 0.8522396, 0.7999389, 1, 0, 0.8509804, 1,
1.055974, -1.08602, 2.938885, 1, 0, 0.8470588, 1,
1.061009, 1.986111, 0.1050027, 1, 0, 0.8392157, 1,
1.061067, 0.02153991, 2.563956, 1, 0, 0.8352941, 1,
1.062951, 0.2482328, 2.743044, 1, 0, 0.827451, 1,
1.07206, -0.498764, 2.283936, 1, 0, 0.8235294, 1,
1.079643, 0.8145147, -1.355722, 1, 0, 0.8156863, 1,
1.081901, 1.030157, 0.6578968, 1, 0, 0.8117647, 1,
1.084628, 0.2225273, 1.51996, 1, 0, 0.8039216, 1,
1.088364, -0.308213, 3.071184, 1, 0, 0.7960784, 1,
1.092477, 0.7545176, 1.685459, 1, 0, 0.7921569, 1,
1.098354, -0.2069502, 1.260948, 1, 0, 0.7843137, 1,
1.101142, -0.3166705, 1.831432, 1, 0, 0.7803922, 1,
1.110848, 1.982329, 2.135322, 1, 0, 0.772549, 1,
1.111078, 0.3451166, 1.691708, 1, 0, 0.7686275, 1,
1.11122, -0.1547537, 0.1953645, 1, 0, 0.7607843, 1,
1.112649, 0.6472437, 2.378941, 1, 0, 0.7568628, 1,
1.120387, 0.02991692, 1.209826, 1, 0, 0.7490196, 1,
1.130415, -1.371683, 3.373412, 1, 0, 0.7450981, 1,
1.145013, -0.3070445, 2.27465, 1, 0, 0.7372549, 1,
1.146627, -0.159213, 0.2152596, 1, 0, 0.7333333, 1,
1.146762, -0.7469198, 2.606761, 1, 0, 0.7254902, 1,
1.151543, -0.8000267, 2.04659, 1, 0, 0.7215686, 1,
1.155618, -0.7665845, 1.768598, 1, 0, 0.7137255, 1,
1.171337, 0.1526403, 0.3977328, 1, 0, 0.7098039, 1,
1.17356, -0.3428936, 2.501632, 1, 0, 0.7019608, 1,
1.182017, -0.1376444, 1.861708, 1, 0, 0.6941177, 1,
1.193631, -0.1155275, -0.136563, 1, 0, 0.6901961, 1,
1.195925, 0.414675, 1.339068, 1, 0, 0.682353, 1,
1.197138, 1.187548, 2.20403, 1, 0, 0.6784314, 1,
1.197163, -0.912309, 3.117667, 1, 0, 0.6705883, 1,
1.199329, 1.142771, 2.599761, 1, 0, 0.6666667, 1,
1.204051, -1.783145, 2.436934, 1, 0, 0.6588235, 1,
1.214092, -2.028646, 3.128594, 1, 0, 0.654902, 1,
1.222508, 0.2461207, 1.448036, 1, 0, 0.6470588, 1,
1.225393, 2.573519, 0.1035978, 1, 0, 0.6431373, 1,
1.236126, 0.3463857, 0.7676085, 1, 0, 0.6352941, 1,
1.266936, 0.2186106, 1.285821, 1, 0, 0.6313726, 1,
1.280195, 1.493189, 1.485959, 1, 0, 0.6235294, 1,
1.284366, 0.6014155, 0.9007462, 1, 0, 0.6196079, 1,
1.288446, 1.278103, -0.04356118, 1, 0, 0.6117647, 1,
1.296823, 0.5908849, 1.687114, 1, 0, 0.6078432, 1,
1.297036, -0.5102241, 1.163111, 1, 0, 0.6, 1,
1.298944, -1.638431, 5.261686, 1, 0, 0.5921569, 1,
1.313052, -1.188705, 2.332349, 1, 0, 0.5882353, 1,
1.314221, -0.8521235, 2.07903, 1, 0, 0.5803922, 1,
1.33817, 0.9081143, 0.6010165, 1, 0, 0.5764706, 1,
1.342752, 1.658233, -0.7381613, 1, 0, 0.5686275, 1,
1.35621, 0.1872013, 2.231101, 1, 0, 0.5647059, 1,
1.365727, 0.4565327, 2.185762, 1, 0, 0.5568628, 1,
1.380471, 1.170876, 1.127355, 1, 0, 0.5529412, 1,
1.384108, -1.590132, 4.457822, 1, 0, 0.5450981, 1,
1.395643, -0.4359926, 1.900106, 1, 0, 0.5411765, 1,
1.396966, 0.07020986, -0.1716355, 1, 0, 0.5333334, 1,
1.414441, 0.1376353, 0.9467966, 1, 0, 0.5294118, 1,
1.421658, 0.9066821, 2.775081, 1, 0, 0.5215687, 1,
1.426427, 0.6434026, 1.065062, 1, 0, 0.5176471, 1,
1.460519, 1.148173, 0.3224784, 1, 0, 0.509804, 1,
1.465799, -1.207122, 2.921057, 1, 0, 0.5058824, 1,
1.484408, 1.072636, 0.4120978, 1, 0, 0.4980392, 1,
1.48454, 0.07385053, -0.1441457, 1, 0, 0.4901961, 1,
1.485055, -0.01336158, 2.805659, 1, 0, 0.4862745, 1,
1.488832, -0.1635487, 1.961341, 1, 0, 0.4784314, 1,
1.495376, 1.844837, 0.9102402, 1, 0, 0.4745098, 1,
1.501342, -0.8077536, 2.162249, 1, 0, 0.4666667, 1,
1.502074, 0.4572407, 1.201079, 1, 0, 0.4627451, 1,
1.50301, -0.940355, 1.182561, 1, 0, 0.454902, 1,
1.516828, 0.5052214, 1.004081, 1, 0, 0.4509804, 1,
1.529326, -1.015043, 4.635795, 1, 0, 0.4431373, 1,
1.546931, -0.3115759, 0.7658523, 1, 0, 0.4392157, 1,
1.548489, 0.8507473, 2.502072, 1, 0, 0.4313726, 1,
1.566638, -0.6904761, 2.515713, 1, 0, 0.427451, 1,
1.57281, 0.9348431, 1.226663, 1, 0, 0.4196078, 1,
1.575618, -0.8635828, 1.493816, 1, 0, 0.4156863, 1,
1.579698, -0.3773606, 1.712772, 1, 0, 0.4078431, 1,
1.593307, 1.952765, 1.093781, 1, 0, 0.4039216, 1,
1.593783, -1.32599, 0.4861531, 1, 0, 0.3960784, 1,
1.612748, -1.539503, 2.960914, 1, 0, 0.3882353, 1,
1.613138, 0.3536655, 1.98802, 1, 0, 0.3843137, 1,
1.618977, 0.6937863, -0.7586904, 1, 0, 0.3764706, 1,
1.623265, 0.8849505, 0.24007, 1, 0, 0.372549, 1,
1.626915, 0.1785047, 0.8793415, 1, 0, 0.3647059, 1,
1.634041, -1.237864, 1.339591, 1, 0, 0.3607843, 1,
1.638189, 0.3854392, 1.916906, 1, 0, 0.3529412, 1,
1.643935, -0.4418569, 1.699788, 1, 0, 0.3490196, 1,
1.654092, 0.3556528, 1.122929, 1, 0, 0.3411765, 1,
1.671047, 0.2128712, 2.209768, 1, 0, 0.3372549, 1,
1.6764, -0.9183653, 1.855869, 1, 0, 0.3294118, 1,
1.69889, 0.5099509, 1.061567, 1, 0, 0.3254902, 1,
1.703013, -0.1149247, 0.9126357, 1, 0, 0.3176471, 1,
1.735185, -0.5452981, 1.222227, 1, 0, 0.3137255, 1,
1.740451, 1.373117, 2.650568, 1, 0, 0.3058824, 1,
1.758005, 1.361189, 1.951922, 1, 0, 0.2980392, 1,
1.761223, -1.29395, 2.658885, 1, 0, 0.2941177, 1,
1.766937, -1.572195, 1.600092, 1, 0, 0.2862745, 1,
1.779316, -0.05165016, 1.922155, 1, 0, 0.282353, 1,
1.78296, -0.1160256, 0.1206296, 1, 0, 0.2745098, 1,
1.819955, 1.983467, 1.677656, 1, 0, 0.2705882, 1,
1.84498, -0.6660026, 2.292948, 1, 0, 0.2627451, 1,
1.85443, 0.823927, -0.09823459, 1, 0, 0.2588235, 1,
1.857042, -1.242325, 1.970768, 1, 0, 0.2509804, 1,
1.902106, -1.07698, 2.079332, 1, 0, 0.2470588, 1,
1.912101, 1.624225, 1.442528, 1, 0, 0.2392157, 1,
1.958446, -0.4453188, 1.706791, 1, 0, 0.2352941, 1,
1.958785, 1.21654, 0.5627606, 1, 0, 0.227451, 1,
1.967648, 1.681255, 1.790234, 1, 0, 0.2235294, 1,
1.969021, -0.1462239, 1.623663, 1, 0, 0.2156863, 1,
1.977641, -0.602362, 1.586652, 1, 0, 0.2117647, 1,
1.984935, 1.220968, 3.043043, 1, 0, 0.2039216, 1,
2.014459, 0.2795464, 2.701196, 1, 0, 0.1960784, 1,
2.026567, 1.135146, 2.370529, 1, 0, 0.1921569, 1,
2.044379, -0.2104548, 1.278438, 1, 0, 0.1843137, 1,
2.05868, -0.2471074, 1.090027, 1, 0, 0.1803922, 1,
2.086494, -0.6044859, 1.287234, 1, 0, 0.172549, 1,
2.115624, 0.3264156, 2.378421, 1, 0, 0.1686275, 1,
2.118224, 0.282556, 1.059976, 1, 0, 0.1607843, 1,
2.124555, 0.2975049, 2.504085, 1, 0, 0.1568628, 1,
2.14106, -1.013436, 2.062985, 1, 0, 0.1490196, 1,
2.167648, 2.783323, 2.004415, 1, 0, 0.145098, 1,
2.237244, 0.5214299, 1.290285, 1, 0, 0.1372549, 1,
2.269744, -2.853717, 2.005154, 1, 0, 0.1333333, 1,
2.275358, 0.9195189, 1.022292, 1, 0, 0.1254902, 1,
2.293892, 0.4203321, 1.122329, 1, 0, 0.1215686, 1,
2.30207, 0.2309724, 1.613028, 1, 0, 0.1137255, 1,
2.306221, 0.06404775, 2.415267, 1, 0, 0.1098039, 1,
2.340273, -0.9692762, 2.005984, 1, 0, 0.1019608, 1,
2.355524, -0.4210179, 2.273074, 1, 0, 0.09411765, 1,
2.372035, -0.9919496, 1.895245, 1, 0, 0.09019608, 1,
2.45349, -0.5414395, 1.709224, 1, 0, 0.08235294, 1,
2.455687, 1.580971, 1.546944, 1, 0, 0.07843138, 1,
2.509402, 0.3464178, 1.574714, 1, 0, 0.07058824, 1,
2.512096, 0.01264948, -0.4974792, 1, 0, 0.06666667, 1,
2.518529, -0.7091857, 3.232757, 1, 0, 0.05882353, 1,
2.613772, -0.8489286, 3.680265, 1, 0, 0.05490196, 1,
2.638063, -0.5294632, 0.006866854, 1, 0, 0.04705882, 1,
2.645478, -0.2699373, 1.915762, 1, 0, 0.04313726, 1,
2.709139, 0.6636443, 2.874008, 1, 0, 0.03529412, 1,
2.77818, -0.9999694, 1.219811, 1, 0, 0.03137255, 1,
2.922167, -1.412151, 1.004897, 1, 0, 0.02352941, 1,
2.972312, -1.182074, 1.583845, 1, 0, 0.01960784, 1,
3.285432, -1.176291, 1.489865, 1, 0, 0.01176471, 1,
4.153221, 1.349145, -0.1335841, 1, 0, 0.007843138, 1
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
0.4545529, -4.245748, -7.211117, 0, -0.5, 0.5, 0.5,
0.4545529, -4.245748, -7.211117, 1, -0.5, 0.5, 0.5,
0.4545529, -4.245748, -7.211117, 1, 1.5, 0.5, 0.5,
0.4545529, -4.245748, -7.211117, 0, 1.5, 0.5, 0.5
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
-4.497963, 0.1213757, -7.211117, 0, -0.5, 0.5, 0.5,
-4.497963, 0.1213757, -7.211117, 1, -0.5, 0.5, 0.5,
-4.497963, 0.1213757, -7.211117, 1, 1.5, 0.5, 0.5,
-4.497963, 0.1213757, -7.211117, 0, 1.5, 0.5, 0.5
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
-4.497963, -4.245748, -0.07085061, 0, -0.5, 0.5, 0.5,
-4.497963, -4.245748, -0.07085061, 1, -0.5, 0.5, 0.5,
-4.497963, -4.245748, -0.07085061, 1, 1.5, 0.5, 0.5,
-4.497963, -4.245748, -0.07085061, 0, 1.5, 0.5, 0.5
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
-2, -3.23795, -5.563363,
4, -3.23795, -5.563363,
-2, -3.23795, -5.563363,
-2, -3.405916, -5.837989,
0, -3.23795, -5.563363,
0, -3.405916, -5.837989,
2, -3.23795, -5.563363,
2, -3.405916, -5.837989,
4, -3.23795, -5.563363,
4, -3.405916, -5.837989
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
"2",
"4"
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
-2, -3.741849, -6.38724, 0, -0.5, 0.5, 0.5,
-2, -3.741849, -6.38724, 1, -0.5, 0.5, 0.5,
-2, -3.741849, -6.38724, 1, 1.5, 0.5, 0.5,
-2, -3.741849, -6.38724, 0, 1.5, 0.5, 0.5,
0, -3.741849, -6.38724, 0, -0.5, 0.5, 0.5,
0, -3.741849, -6.38724, 1, -0.5, 0.5, 0.5,
0, -3.741849, -6.38724, 1, 1.5, 0.5, 0.5,
0, -3.741849, -6.38724, 0, 1.5, 0.5, 0.5,
2, -3.741849, -6.38724, 0, -0.5, 0.5, 0.5,
2, -3.741849, -6.38724, 1, -0.5, 0.5, 0.5,
2, -3.741849, -6.38724, 1, 1.5, 0.5, 0.5,
2, -3.741849, -6.38724, 0, 1.5, 0.5, 0.5,
4, -3.741849, -6.38724, 0, -0.5, 0.5, 0.5,
4, -3.741849, -6.38724, 1, -0.5, 0.5, 0.5,
4, -3.741849, -6.38724, 1, 1.5, 0.5, 0.5,
4, -3.741849, -6.38724, 0, 1.5, 0.5, 0.5
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
-3.355075, -3, -5.563363,
-3.355075, 3, -5.563363,
-3.355075, -3, -5.563363,
-3.545556, -3, -5.837989,
-3.355075, -2, -5.563363,
-3.545556, -2, -5.837989,
-3.355075, -1, -5.563363,
-3.545556, -1, -5.837989,
-3.355075, 0, -5.563363,
-3.545556, 0, -5.837989,
-3.355075, 1, -5.563363,
-3.545556, 1, -5.837989,
-3.355075, 2, -5.563363,
-3.545556, 2, -5.837989,
-3.355075, 3, -5.563363,
-3.545556, 3, -5.837989
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
-3.926519, -3, -6.38724, 0, -0.5, 0.5, 0.5,
-3.926519, -3, -6.38724, 1, -0.5, 0.5, 0.5,
-3.926519, -3, -6.38724, 1, 1.5, 0.5, 0.5,
-3.926519, -3, -6.38724, 0, 1.5, 0.5, 0.5,
-3.926519, -2, -6.38724, 0, -0.5, 0.5, 0.5,
-3.926519, -2, -6.38724, 1, -0.5, 0.5, 0.5,
-3.926519, -2, -6.38724, 1, 1.5, 0.5, 0.5,
-3.926519, -2, -6.38724, 0, 1.5, 0.5, 0.5,
-3.926519, -1, -6.38724, 0, -0.5, 0.5, 0.5,
-3.926519, -1, -6.38724, 1, -0.5, 0.5, 0.5,
-3.926519, -1, -6.38724, 1, 1.5, 0.5, 0.5,
-3.926519, -1, -6.38724, 0, 1.5, 0.5, 0.5,
-3.926519, 0, -6.38724, 0, -0.5, 0.5, 0.5,
-3.926519, 0, -6.38724, 1, -0.5, 0.5, 0.5,
-3.926519, 0, -6.38724, 1, 1.5, 0.5, 0.5,
-3.926519, 0, -6.38724, 0, 1.5, 0.5, 0.5,
-3.926519, 1, -6.38724, 0, -0.5, 0.5, 0.5,
-3.926519, 1, -6.38724, 1, -0.5, 0.5, 0.5,
-3.926519, 1, -6.38724, 1, 1.5, 0.5, 0.5,
-3.926519, 1, -6.38724, 0, 1.5, 0.5, 0.5,
-3.926519, 2, -6.38724, 0, -0.5, 0.5, 0.5,
-3.926519, 2, -6.38724, 1, -0.5, 0.5, 0.5,
-3.926519, 2, -6.38724, 1, 1.5, 0.5, 0.5,
-3.926519, 2, -6.38724, 0, 1.5, 0.5, 0.5,
-3.926519, 3, -6.38724, 0, -0.5, 0.5, 0.5,
-3.926519, 3, -6.38724, 1, -0.5, 0.5, 0.5,
-3.926519, 3, -6.38724, 1, 1.5, 0.5, 0.5,
-3.926519, 3, -6.38724, 0, 1.5, 0.5, 0.5
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
-3.355075, -3.23795, -4,
-3.355075, -3.23795, 4,
-3.355075, -3.23795, -4,
-3.545556, -3.405916, -4,
-3.355075, -3.23795, -2,
-3.545556, -3.405916, -2,
-3.355075, -3.23795, 0,
-3.545556, -3.405916, 0,
-3.355075, -3.23795, 2,
-3.545556, -3.405916, 2,
-3.355075, -3.23795, 4,
-3.545556, -3.405916, 4
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
-3.926519, -3.741849, -4, 0, -0.5, 0.5, 0.5,
-3.926519, -3.741849, -4, 1, -0.5, 0.5, 0.5,
-3.926519, -3.741849, -4, 1, 1.5, 0.5, 0.5,
-3.926519, -3.741849, -4, 0, 1.5, 0.5, 0.5,
-3.926519, -3.741849, -2, 0, -0.5, 0.5, 0.5,
-3.926519, -3.741849, -2, 1, -0.5, 0.5, 0.5,
-3.926519, -3.741849, -2, 1, 1.5, 0.5, 0.5,
-3.926519, -3.741849, -2, 0, 1.5, 0.5, 0.5,
-3.926519, -3.741849, 0, 0, -0.5, 0.5, 0.5,
-3.926519, -3.741849, 0, 1, -0.5, 0.5, 0.5,
-3.926519, -3.741849, 0, 1, 1.5, 0.5, 0.5,
-3.926519, -3.741849, 0, 0, 1.5, 0.5, 0.5,
-3.926519, -3.741849, 2, 0, -0.5, 0.5, 0.5,
-3.926519, -3.741849, 2, 1, -0.5, 0.5, 0.5,
-3.926519, -3.741849, 2, 1, 1.5, 0.5, 0.5,
-3.926519, -3.741849, 2, 0, 1.5, 0.5, 0.5,
-3.926519, -3.741849, 4, 0, -0.5, 0.5, 0.5,
-3.926519, -3.741849, 4, 1, -0.5, 0.5, 0.5,
-3.926519, -3.741849, 4, 1, 1.5, 0.5, 0.5,
-3.926519, -3.741849, 4, 0, 1.5, 0.5, 0.5
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
-3.355075, -3.23795, -5.563363,
-3.355075, 3.480701, -5.563363,
-3.355075, -3.23795, 5.421662,
-3.355075, 3.480701, 5.421662,
-3.355075, -3.23795, -5.563363,
-3.355075, -3.23795, 5.421662,
-3.355075, 3.480701, -5.563363,
-3.355075, 3.480701, 5.421662,
-3.355075, -3.23795, -5.563363,
4.264181, -3.23795, -5.563363,
-3.355075, -3.23795, 5.421662,
4.264181, -3.23795, 5.421662,
-3.355075, 3.480701, -5.563363,
4.264181, 3.480701, -5.563363,
-3.355075, 3.480701, 5.421662,
4.264181, 3.480701, 5.421662,
4.264181, -3.23795, -5.563363,
4.264181, 3.480701, -5.563363,
4.264181, -3.23795, 5.421662,
4.264181, 3.480701, 5.421662,
4.264181, -3.23795, -5.563363,
4.264181, -3.23795, 5.421662,
4.264181, 3.480701, -5.563363,
4.264181, 3.480701, 5.421662
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
var radius = 7.989465;
var distance = 35.54603;
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
mvMatrix.translate( -0.4545529, -0.1213757, 0.07085061 );
mvMatrix.scale( 1.133755, 1.285729, 0.7863765 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.54603);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
bulan<-read.table("bulan.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bulan$V2
```

```
## Error in eval(expr, envir, enclos): object 'bulan' not found
```

```r
y<-bulan$V3
```

```
## Error in eval(expr, envir, enclos): object 'bulan' not found
```

```r
z<-bulan$V4
```

```
## Error in eval(expr, envir, enclos): object 'bulan' not found
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
-3.244115, 1.412375, -1.926215, 0, 0, 1, 1, 1,
-2.788741, -0.01826899, -2.942448, 1, 0, 0, 1, 1,
-2.788091, -0.1898085, -3.442955, 1, 0, 0, 1, 1,
-2.672563, -1.667724, -1.720351, 1, 0, 0, 1, 1,
-2.492583, -0.9618204, -1.318833, 1, 0, 0, 1, 1,
-2.486297, 1.571411, -1.221639, 1, 0, 0, 1, 1,
-2.475962, -1.826697, -3.160689, 0, 0, 0, 1, 1,
-2.389669, -0.8601958, -1.73993, 0, 0, 0, 1, 1,
-2.365417, 0.4847871, -0.4337083, 0, 0, 0, 1, 1,
-2.341727, -0.9894149, -1.2522, 0, 0, 0, 1, 1,
-2.327041, 0.2985472, -0.01266202, 0, 0, 0, 1, 1,
-2.272874, -0.9234428, -1.563964, 0, 0, 0, 1, 1,
-2.238285, -0.4346433, -1.398817, 0, 0, 0, 1, 1,
-2.168216, 0.5988898, -0.3214587, 1, 1, 1, 1, 1,
-2.131371, 0.1926757, -1.527396, 1, 1, 1, 1, 1,
-2.113743, 0.3222893, -1.157546, 1, 1, 1, 1, 1,
-2.07681, -1.827091, -3.306286, 1, 1, 1, 1, 1,
-2.0727, 0.6765391, -1.472425, 1, 1, 1, 1, 1,
-2.065934, -1.430973, -3.193975, 1, 1, 1, 1, 1,
-2.05815, 1.66069, -0.5790172, 1, 1, 1, 1, 1,
-2.055078, -1.707805, -3.264619, 1, 1, 1, 1, 1,
-2.008937, -0.3591101, 0.4608968, 1, 1, 1, 1, 1,
-2.003937, -0.7875148, -1.734924, 1, 1, 1, 1, 1,
-1.99123, -0.4266146, -0.7263289, 1, 1, 1, 1, 1,
-1.93548, -1.078423, -3.477058, 1, 1, 1, 1, 1,
-1.916392, -1.580485, -2.271367, 1, 1, 1, 1, 1,
-1.916217, -1.476001, -1.245582, 1, 1, 1, 1, 1,
-1.882629, -0.1388756, -2.398999, 1, 1, 1, 1, 1,
-1.8826, 0.1670862, -1.63769, 0, 0, 1, 1, 1,
-1.860443, 1.493418, -2.109305, 1, 0, 0, 1, 1,
-1.834297, -0.1793411, -2.071745, 1, 0, 0, 1, 1,
-1.825447, -0.9324567, -2.791999, 1, 0, 0, 1, 1,
-1.801467, -0.01146811, 0.1320016, 1, 0, 0, 1, 1,
-1.798315, 0.08845435, -2.573573, 1, 0, 0, 1, 1,
-1.787758, 0.3205552, -1.557709, 0, 0, 0, 1, 1,
-1.774588, 0.8559231, -1.895971, 0, 0, 0, 1, 1,
-1.767864, -0.4210625, -1.636076, 0, 0, 0, 1, 1,
-1.753741, 1.929967, -1.795707, 0, 0, 0, 1, 1,
-1.74924, 0.2332392, -0.8937767, 0, 0, 0, 1, 1,
-1.737688, -0.4636032, -1.444443, 0, 0, 0, 1, 1,
-1.733897, -1.015028, -1.305708, 0, 0, 0, 1, 1,
-1.729649, -2.087314, -2.396159, 1, 1, 1, 1, 1,
-1.706468, 1.142595, -0.4176092, 1, 1, 1, 1, 1,
-1.706158, -0.9026428, -0.2240969, 1, 1, 1, 1, 1,
-1.70424, -0.7224562, -1.874353, 1, 1, 1, 1, 1,
-1.702629, 1.435268, -0.6797742, 1, 1, 1, 1, 1,
-1.682015, -0.2624639, -2.070637, 1, 1, 1, 1, 1,
-1.671109, 0.9312209, -2.155715, 1, 1, 1, 1, 1,
-1.670492, -1.269862, -1.428259, 1, 1, 1, 1, 1,
-1.646752, -0.5038182, -1.319784, 1, 1, 1, 1, 1,
-1.64281, 0.124196, -1.423922, 1, 1, 1, 1, 1,
-1.641042, -1.300859, -3.119571, 1, 1, 1, 1, 1,
-1.638014, 0.1806003, -2.781356, 1, 1, 1, 1, 1,
-1.633581, 0.5010781, -1.440438, 1, 1, 1, 1, 1,
-1.629684, 0.6093775, -0.7637883, 1, 1, 1, 1, 1,
-1.629209, -0.2207967, -2.269495, 1, 1, 1, 1, 1,
-1.601342, -1.285274, -3.049838, 0, 0, 1, 1, 1,
-1.599637, -0.4088178, -1.952761, 1, 0, 0, 1, 1,
-1.592383, 0.7598056, -1.102501, 1, 0, 0, 1, 1,
-1.592227, 1.115012, -0.03736563, 1, 0, 0, 1, 1,
-1.591016, 1.176743, 0.1855694, 1, 0, 0, 1, 1,
-1.583457, -0.0935866, -2.486977, 1, 0, 0, 1, 1,
-1.57539, -1.691413, -3.824107, 0, 0, 0, 1, 1,
-1.573369, 0.1211209, 1.190726, 0, 0, 0, 1, 1,
-1.569003, -1.058292, -3.600713, 0, 0, 0, 1, 1,
-1.566556, -0.5225461, -4.206748, 0, 0, 0, 1, 1,
-1.558217, -0.005832241, -2.186936, 0, 0, 0, 1, 1,
-1.552176, 0.6351336, -0.5658521, 0, 0, 0, 1, 1,
-1.547166, 0.3299321, -1.362077, 0, 0, 0, 1, 1,
-1.521346, 1.785627, 0.0523104, 1, 1, 1, 1, 1,
-1.519278, -1.029517, -4.262322, 1, 1, 1, 1, 1,
-1.516274, -1.637117, -2.124993, 1, 1, 1, 1, 1,
-1.508545, -2.52891, -1.647199, 1, 1, 1, 1, 1,
-1.502046, 1.165857, 0.211127, 1, 1, 1, 1, 1,
-1.483147, -1.204876, -1.303895, 1, 1, 1, 1, 1,
-1.46762, -0.5542475, -2.755253, 1, 1, 1, 1, 1,
-1.466013, 0.167245, -1.165212, 1, 1, 1, 1, 1,
-1.465316, -0.07971556, -0.692944, 1, 1, 1, 1, 1,
-1.464321, 0.6324431, -0.9614261, 1, 1, 1, 1, 1,
-1.460362, 0.7237531, 1.592959, 1, 1, 1, 1, 1,
-1.458659, 0.3248067, -2.188727, 1, 1, 1, 1, 1,
-1.452666, -2.046091, -3.135038, 1, 1, 1, 1, 1,
-1.451363, -0.03145662, 0.8327938, 1, 1, 1, 1, 1,
-1.440364, -0.01686597, -1.575819, 1, 1, 1, 1, 1,
-1.433372, 0.5484018, -2.399469, 0, 0, 1, 1, 1,
-1.416861, -0.9561779, -1.144326, 1, 0, 0, 1, 1,
-1.407974, 0.2219938, -2.560383, 1, 0, 0, 1, 1,
-1.399398, -1.039457, -2.047672, 1, 0, 0, 1, 1,
-1.399001, -1.785374, -1.65906, 1, 0, 0, 1, 1,
-1.398081, 0.2498801, -0.07208543, 1, 0, 0, 1, 1,
-1.384052, 0.1678664, 0.6990274, 0, 0, 0, 1, 1,
-1.366463, -2.050663, -3.195698, 0, 0, 0, 1, 1,
-1.365511, 0.1274807, -2.707814, 0, 0, 0, 1, 1,
-1.347412, -0.3019631, -0.7961588, 0, 0, 0, 1, 1,
-1.338919, -2.001609, -2.90861, 0, 0, 0, 1, 1,
-1.335791, -0.06904751, -2.019718, 0, 0, 0, 1, 1,
-1.329616, 1.160148, -0.9064395, 0, 0, 0, 1, 1,
-1.322044, 0.1558963, -0.6669363, 1, 1, 1, 1, 1,
-1.317106, -0.116179, -1.020852, 1, 1, 1, 1, 1,
-1.311889, -0.5689388, -0.7511695, 1, 1, 1, 1, 1,
-1.299252, -0.1303143, -1.819991, 1, 1, 1, 1, 1,
-1.299171, -0.2748615, -1.602616, 1, 1, 1, 1, 1,
-1.289741, 0.4909203, -1.358942, 1, 1, 1, 1, 1,
-1.286723, -0.4677242, -2.481236, 1, 1, 1, 1, 1,
-1.285276, 0.7072967, -1.254523, 1, 1, 1, 1, 1,
-1.284345, -1.755623, -2.195827, 1, 1, 1, 1, 1,
-1.280867, -0.630942, -1.229928, 1, 1, 1, 1, 1,
-1.273778, -1.215832, -1.515622, 1, 1, 1, 1, 1,
-1.270673, -1.590297, -2.156458, 1, 1, 1, 1, 1,
-1.264631, 0.8092722, -1.238505, 1, 1, 1, 1, 1,
-1.261172, -0.7520498, -3.03478, 1, 1, 1, 1, 1,
-1.246787, -0.3708378, -1.805156, 1, 1, 1, 1, 1,
-1.238007, 0.4016997, -1.53642, 0, 0, 1, 1, 1,
-1.212392, 0.5797676, -0.3080401, 1, 0, 0, 1, 1,
-1.206961, -0.2042373, -0.1177828, 1, 0, 0, 1, 1,
-1.201076, 1.516873, -0.6646088, 1, 0, 0, 1, 1,
-1.198966, -2.086687, -0.8403655, 1, 0, 0, 1, 1,
-1.197169, -0.5917753, 0.818949, 1, 0, 0, 1, 1,
-1.194703, -0.1891508, -2.728721, 0, 0, 0, 1, 1,
-1.190253, -0.3870595, -0.7799132, 0, 0, 0, 1, 1,
-1.183748, 0.386113, -3.322673, 0, 0, 0, 1, 1,
-1.167382, -0.4449649, -3.532567, 0, 0, 0, 1, 1,
-1.159026, 0.407557, -2.101187, 0, 0, 0, 1, 1,
-1.153719, -1.435594, -3.845926, 0, 0, 0, 1, 1,
-1.152192, 0.1247927, -4.132177, 0, 0, 0, 1, 1,
-1.130344, 0.06467729, -0.11366, 1, 1, 1, 1, 1,
-1.128863, 0.3535505, -1.51381, 1, 1, 1, 1, 1,
-1.126004, 0.2897779, -1.525555, 1, 1, 1, 1, 1,
-1.119519, -1.495032, -1.84972, 1, 1, 1, 1, 1,
-1.117426, 1.020485, -1.58706, 1, 1, 1, 1, 1,
-1.117395, 2.574763, 0.2941073, 1, 1, 1, 1, 1,
-1.109979, 0.2399112, 0.7853255, 1, 1, 1, 1, 1,
-1.107018, -0.7414225, -0.3607044, 1, 1, 1, 1, 1,
-1.106352, 0.6632489, -1.794767, 1, 1, 1, 1, 1,
-1.103885, 0.741326, -0.3436295, 1, 1, 1, 1, 1,
-1.103091, 0.2213966, -1.48688, 1, 1, 1, 1, 1,
-1.099066, 0.6825736, -1.017081, 1, 1, 1, 1, 1,
-1.095435, 0.4352806, -2.662852, 1, 1, 1, 1, 1,
-1.092774, -2.196161, -2.72112, 1, 1, 1, 1, 1,
-1.075613, 0.9332987, -2.436017, 1, 1, 1, 1, 1,
-1.073525, 0.1790634, -1.533644, 0, 0, 1, 1, 1,
-1.069282, 1.241625, 0.6258465, 1, 0, 0, 1, 1,
-1.06837, -1.815932, -4.27932, 1, 0, 0, 1, 1,
-1.061284, 0.1052608, -2.629524, 1, 0, 0, 1, 1,
-1.056362, -1.293735, -2.355175, 1, 0, 0, 1, 1,
-1.04796, -0.3820512, -0.6561542, 1, 0, 0, 1, 1,
-1.040545, -0.3512113, -2.1123, 0, 0, 0, 1, 1,
-1.033604, 1.209642, -1.367972, 0, 0, 0, 1, 1,
-1.029914, 1.206867, -0.155073, 0, 0, 0, 1, 1,
-1.029505, 0.5060272, 0.3530579, 0, 0, 0, 1, 1,
-1.027496, 0.3381326, 0.2832218, 0, 0, 0, 1, 1,
-1.017304, -0.1987055, -0.2438247, 0, 0, 0, 1, 1,
-1.012384, 0.02798326, -1.759553, 0, 0, 0, 1, 1,
-1.011624, 0.8158603, -2.038099, 1, 1, 1, 1, 1,
-1.007598, 1.402487, -1.012339, 1, 1, 1, 1, 1,
-1.005957, 1.951464, 1.356144, 1, 1, 1, 1, 1,
-1.004872, -0.8443424, -2.898871, 1, 1, 1, 1, 1,
-1.00273, 1.51055, -0.665776, 1, 1, 1, 1, 1,
-1.000349, -1.793293, -3.177629, 1, 1, 1, 1, 1,
-1.00005, -1.115689, -0.277162, 1, 1, 1, 1, 1,
-0.998596, 0.3792316, -2.925144, 1, 1, 1, 1, 1,
-0.9917915, -0.804318, -3.358266, 1, 1, 1, 1, 1,
-0.9886397, 0.9829487, -0.9280817, 1, 1, 1, 1, 1,
-0.9590053, 2.708657, -0.4839863, 1, 1, 1, 1, 1,
-0.9541842, 0.4929589, -1.547162, 1, 1, 1, 1, 1,
-0.9531321, -0.9144108, -2.547026, 1, 1, 1, 1, 1,
-0.945363, -0.1935112, -1.053046, 1, 1, 1, 1, 1,
-0.943224, 0.174453, -1.502102, 1, 1, 1, 1, 1,
-0.9410661, -0.02079361, -1.932104, 0, 0, 1, 1, 1,
-0.9404546, -0.1498301, -2.187382, 1, 0, 0, 1, 1,
-0.9355476, -0.7758349, -2.95452, 1, 0, 0, 1, 1,
-0.9324377, 2.292345, -0.4324195, 1, 0, 0, 1, 1,
-0.9292434, 1.768391, -2.539261, 1, 0, 0, 1, 1,
-0.9288144, 0.1120404, -3.156258, 1, 0, 0, 1, 1,
-0.9283384, -1.142253, -3.340827, 0, 0, 0, 1, 1,
-0.9264625, 0.1675506, -0.9928781, 0, 0, 0, 1, 1,
-0.9257184, 0.2874155, -2.208042, 0, 0, 0, 1, 1,
-0.9234796, 0.2192567, -2.800047, 0, 0, 0, 1, 1,
-0.8909764, 0.5142797, -1.517625, 0, 0, 0, 1, 1,
-0.8905433, 0.1920778, -0.2980729, 0, 0, 0, 1, 1,
-0.8901915, 1.32289, -1.479159, 0, 0, 0, 1, 1,
-0.8827543, 1.541955, 0.6954193, 1, 1, 1, 1, 1,
-0.8785166, -2.104733, -2.206522, 1, 1, 1, 1, 1,
-0.8780325, -0.5399462, -2.997869, 1, 1, 1, 1, 1,
-0.8691922, -0.9964224, -1.235918, 1, 1, 1, 1, 1,
-0.8661962, 1.865824, 0.2798471, 1, 1, 1, 1, 1,
-0.8603078, -1.252113, -3.993045, 1, 1, 1, 1, 1,
-0.853273, -0.2877594, -2.682565, 1, 1, 1, 1, 1,
-0.8509196, -1.512766, -2.770224, 1, 1, 1, 1, 1,
-0.84521, 1.150748, -2.025734, 1, 1, 1, 1, 1,
-0.8442479, 0.657268, -1.318323, 1, 1, 1, 1, 1,
-0.841146, -0.5781698, -2.772199, 1, 1, 1, 1, 1,
-0.840425, -0.007685892, 0.02928641, 1, 1, 1, 1, 1,
-0.83895, -0.3666594, -3.611427, 1, 1, 1, 1, 1,
-0.8321423, 0.9485846, -0.3094245, 1, 1, 1, 1, 1,
-0.8198967, 0.5064557, -0.4110568, 1, 1, 1, 1, 1,
-0.8196974, 0.8028262, -0.3469774, 0, 0, 1, 1, 1,
-0.8177691, -0.6358796, -1.932986, 1, 0, 0, 1, 1,
-0.815128, 0.4576438, -0.9903281, 1, 0, 0, 1, 1,
-0.813499, 0.3357495, -0.8766171, 1, 0, 0, 1, 1,
-0.8109072, 1.845841, 0.9013988, 1, 0, 0, 1, 1,
-0.8089438, 0.1356248, 0.2262643, 1, 0, 0, 1, 1,
-0.8025027, 0.324898, -0.04366165, 0, 0, 0, 1, 1,
-0.8013641, 0.7105887, -2.106529, 0, 0, 0, 1, 1,
-0.8005264, -0.0972888, 1.015103, 0, 0, 0, 1, 1,
-0.7961785, 1.045523, -2.224986, 0, 0, 0, 1, 1,
-0.7949277, 0.7921277, -1.635539, 0, 0, 0, 1, 1,
-0.7947942, -0.3745948, -2.187927, 0, 0, 0, 1, 1,
-0.7916141, -0.773331, -0.6634618, 0, 0, 0, 1, 1,
-0.7882557, 0.7149177, -0.2878368, 1, 1, 1, 1, 1,
-0.7872459, -0.04605035, -0.5874031, 1, 1, 1, 1, 1,
-0.7862085, 0.5347026, -0.03793406, 1, 1, 1, 1, 1,
-0.7821876, -0.4170078, -0.3567504, 1, 1, 1, 1, 1,
-0.779976, -0.5250688, -2.350765, 1, 1, 1, 1, 1,
-0.7765239, 0.3218353, -0.03741122, 1, 1, 1, 1, 1,
-0.7663636, 1.295209, 0.9642034, 1, 1, 1, 1, 1,
-0.7597924, -0.6513025, -2.966607, 1, 1, 1, 1, 1,
-0.755303, 1.723798, -0.1818818, 1, 1, 1, 1, 1,
-0.7397596, 0.9250124, 0.1957024, 1, 1, 1, 1, 1,
-0.7327363, -1.277821, -2.664738, 1, 1, 1, 1, 1,
-0.7306038, -0.2886399, -2.5692, 1, 1, 1, 1, 1,
-0.7297297, 0.5073013, -2.684696, 1, 1, 1, 1, 1,
-0.7263719, -0.06833348, -1.299873, 1, 1, 1, 1, 1,
-0.7260738, -1.207004, -1.752158, 1, 1, 1, 1, 1,
-0.7253903, -1.386177, -2.019241, 0, 0, 1, 1, 1,
-0.7244982, -0.8698305, -1.250793, 1, 0, 0, 1, 1,
-0.7206566, -0.9295055, -2.084315, 1, 0, 0, 1, 1,
-0.7140559, -0.7436503, -2.555566, 1, 0, 0, 1, 1,
-0.7123947, -0.5445392, -0.1412585, 1, 0, 0, 1, 1,
-0.7116943, -0.9390867, -1.825322, 1, 0, 0, 1, 1,
-0.709484, -0.9074667, -1.862755, 0, 0, 0, 1, 1,
-0.7070712, 0.338419, -0.3333329, 0, 0, 0, 1, 1,
-0.7041327, 0.5346811, -1.373701, 0, 0, 0, 1, 1,
-0.7028899, 0.2581739, -2.103222, 0, 0, 0, 1, 1,
-0.6974772, -0.3248061, -3.026244, 0, 0, 0, 1, 1,
-0.6954273, 0.4369982, -1.17024, 0, 0, 0, 1, 1,
-0.6947524, -1.646909, -3.350635, 0, 0, 0, 1, 1,
-0.6943201, -0.086036, -2.259867, 1, 1, 1, 1, 1,
-0.6848886, 0.09004939, -1.786336, 1, 1, 1, 1, 1,
-0.6824918, -1.685294, -1.222869, 1, 1, 1, 1, 1,
-0.6759641, 0.6235403, -0.2748705, 1, 1, 1, 1, 1,
-0.6734638, -1.388452, -4.641235, 1, 1, 1, 1, 1,
-0.6723356, 0.4917497, -1.689769, 1, 1, 1, 1, 1,
-0.67062, 0.7117841, -0.7798967, 1, 1, 1, 1, 1,
-0.6704903, -0.1475348, -1.024053, 1, 1, 1, 1, 1,
-0.6673657, 2.148172, -0.6286827, 1, 1, 1, 1, 1,
-0.6656865, 0.4059439, -0.3477812, 1, 1, 1, 1, 1,
-0.664301, -3.140106, -2.816733, 1, 1, 1, 1, 1,
-0.6635988, 0.8383795, 0.9801499, 1, 1, 1, 1, 1,
-0.6606221, -0.5768978, -2.227334, 1, 1, 1, 1, 1,
-0.6601114, -0.09064102, -1.316881, 1, 1, 1, 1, 1,
-0.655743, 2.578026, -1.010388, 1, 1, 1, 1, 1,
-0.6544483, -1.558133, -4.291624, 0, 0, 1, 1, 1,
-0.6530662, -0.5985411, -1.647246, 1, 0, 0, 1, 1,
-0.652494, -0.5988863, -2.863289, 1, 0, 0, 1, 1,
-0.6524664, 0.2818487, -1.47347, 1, 0, 0, 1, 1,
-0.6518759, -0.8744117, -2.426025, 1, 0, 0, 1, 1,
-0.6459249, 0.09121562, -0.818381, 1, 0, 0, 1, 1,
-0.6444638, 0.425432, -1.71978, 0, 0, 0, 1, 1,
-0.6420913, 0.7358239, -0.03928619, 0, 0, 0, 1, 1,
-0.6391991, -0.7829797, -2.995489, 0, 0, 0, 1, 1,
-0.6334234, -0.3979349, -1.889062, 0, 0, 0, 1, 1,
-0.6253797, 0.2525154, -1.783453, 0, 0, 0, 1, 1,
-0.6249411, -1.33261, -2.683635, 0, 0, 0, 1, 1,
-0.6242435, 0.3077968, -1.288396, 0, 0, 0, 1, 1,
-0.6241483, 0.8262428, 0.6930589, 1, 1, 1, 1, 1,
-0.6215937, -0.9477752, -1.149549, 1, 1, 1, 1, 1,
-0.6182595, 0.5998098, 0.3630321, 1, 1, 1, 1, 1,
-0.6181121, 0.9072459, -0.03896347, 1, 1, 1, 1, 1,
-0.6178452, 1.086141, 1.081889, 1, 1, 1, 1, 1,
-0.6151477, 0.632262, -0.1852141, 1, 1, 1, 1, 1,
-0.6133506, -0.6292619, -3.509403, 1, 1, 1, 1, 1,
-0.6107546, -0.8409321, -4.92369, 1, 1, 1, 1, 1,
-0.6088614, -0.5897651, -0.8917261, 1, 1, 1, 1, 1,
-0.6077476, 0.5127358, 1.534706, 1, 1, 1, 1, 1,
-0.6023888, 1.083915, -0.8636783, 1, 1, 1, 1, 1,
-0.5893847, -1.310836, -2.300801, 1, 1, 1, 1, 1,
-0.5889122, 1.787302, 0.5115929, 1, 1, 1, 1, 1,
-0.5776915, 0.5758135, 0.7224438, 1, 1, 1, 1, 1,
-0.5753141, 1.542198, -0.2623279, 1, 1, 1, 1, 1,
-0.5750545, 0.1876627, -0.964801, 0, 0, 1, 1, 1,
-0.5733632, 1.744568, 0.018804, 1, 0, 0, 1, 1,
-0.5733513, 0.1291843, -1.224339, 1, 0, 0, 1, 1,
-0.5692177, 0.08267736, -2.069057, 1, 0, 0, 1, 1,
-0.5665371, -0.4641042, -0.4688973, 1, 0, 0, 1, 1,
-0.56492, -0.3577034, -3.21395, 1, 0, 0, 1, 1,
-0.5614818, -1.905189, -1.703931, 0, 0, 0, 1, 1,
-0.5611469, -2.955136, -3.091538, 0, 0, 0, 1, 1,
-0.5581965, -0.651646, -2.333855, 0, 0, 0, 1, 1,
-0.5525357, -0.9059971, -2.100111, 0, 0, 0, 1, 1,
-0.5517952, -2.143137, -2.151852, 0, 0, 0, 1, 1,
-0.5487063, -0.1696516, 0.08525042, 0, 0, 0, 1, 1,
-0.5448682, 1.275417, 0.8795868, 0, 0, 0, 1, 1,
-0.5422577, 0.3420888, -1.065555, 1, 1, 1, 1, 1,
-0.5380425, 1.450178, -1.573819, 1, 1, 1, 1, 1,
-0.5372283, 0.1169511, -0.4239405, 1, 1, 1, 1, 1,
-0.534536, -0.4733743, -3.687791, 1, 1, 1, 1, 1,
-0.5306997, -0.5517948, -2.235125, 1, 1, 1, 1, 1,
-0.5280908, -0.8370233, -4.640769, 1, 1, 1, 1, 1,
-0.527539, -0.8710185, -2.889208, 1, 1, 1, 1, 1,
-0.5269663, -1.940497, -4.252904, 1, 1, 1, 1, 1,
-0.5230913, 1.324063, -1.24506, 1, 1, 1, 1, 1,
-0.5224454, -0.09588668, -1.544549, 1, 1, 1, 1, 1,
-0.5212401, 0.7897708, -1.959249, 1, 1, 1, 1, 1,
-0.5192133, 0.9674117, -0.09698788, 1, 1, 1, 1, 1,
-0.5178643, -1.428433, -3.208152, 1, 1, 1, 1, 1,
-0.5141701, 0.6470535, -0.1329384, 1, 1, 1, 1, 1,
-0.5090711, 0.4827661, -1.796964, 1, 1, 1, 1, 1,
-0.4992316, -0.6436781, -2.969348, 0, 0, 1, 1, 1,
-0.4945231, 0.1572943, -3.477872, 1, 0, 0, 1, 1,
-0.4938672, 1.168277, -1.035141, 1, 0, 0, 1, 1,
-0.4892317, 0.139514, -0.6339585, 1, 0, 0, 1, 1,
-0.482372, -0.2232208, -2.338286, 1, 0, 0, 1, 1,
-0.4813288, 1.078192, -1.043511, 1, 0, 0, 1, 1,
-0.4743337, 0.6803312, -1.121543, 0, 0, 0, 1, 1,
-0.4734468, 0.1220397, -1.002875, 0, 0, 0, 1, 1,
-0.4731197, 1.380079, 0.9917848, 0, 0, 0, 1, 1,
-0.4684782, 0.2432251, 0.4431225, 0, 0, 0, 1, 1,
-0.4666357, -1.849354, -4.112604, 0, 0, 0, 1, 1,
-0.4661574, -1.466461, -3.82397, 0, 0, 0, 1, 1,
-0.4644851, 0.6385425, 0.1106838, 0, 0, 0, 1, 1,
-0.4643594, 0.4473161, 0.1228461, 1, 1, 1, 1, 1,
-0.4613883, -0.5006753, -2.013988, 1, 1, 1, 1, 1,
-0.4526461, -0.6508461, -1.162235, 1, 1, 1, 1, 1,
-0.4454392, -1.190373, -3.560232, 1, 1, 1, 1, 1,
-0.4437058, 2.060177, 1.069635, 1, 1, 1, 1, 1,
-0.4362103, 1.327123, 1.605222, 1, 1, 1, 1, 1,
-0.4356596, 1.197428, -0.929986, 1, 1, 1, 1, 1,
-0.4318221, -1.27656, -1.869424, 1, 1, 1, 1, 1,
-0.4316894, -2.091663, -3.174748, 1, 1, 1, 1, 1,
-0.4236189, 1.097594, -1.338859, 1, 1, 1, 1, 1,
-0.4234669, 0.2597775, -1.195284, 1, 1, 1, 1, 1,
-0.41897, -1.587202, -2.900316, 1, 1, 1, 1, 1,
-0.4187273, -1.8884, -2.07934, 1, 1, 1, 1, 1,
-0.4136347, -0.5022056, -1.87106, 1, 1, 1, 1, 1,
-0.4133542, -1.139191, -2.946347, 1, 1, 1, 1, 1,
-0.4127637, -2.13924, -2.621136, 0, 0, 1, 1, 1,
-0.4106736, 0.5265483, -0.3123575, 1, 0, 0, 1, 1,
-0.4098456, -0.4390592, -2.395008, 1, 0, 0, 1, 1,
-0.4097356, -0.5688335, -2.386003, 1, 0, 0, 1, 1,
-0.4094976, 2.483989, -1.00159, 1, 0, 0, 1, 1,
-0.4059038, 0.7518977, -2.054481, 1, 0, 0, 1, 1,
-0.4041071, 0.8348169, -0.7298196, 0, 0, 0, 1, 1,
-0.4033197, 1.286843, 0.0539109, 0, 0, 0, 1, 1,
-0.4009165, -1.55847, -1.107935, 0, 0, 0, 1, 1,
-0.3990525, -0.4070973, -2.93313, 0, 0, 0, 1, 1,
-0.3953134, -0.3115802, -1.713829, 0, 0, 0, 1, 1,
-0.3911159, -1.368155, -2.495309, 0, 0, 0, 1, 1,
-0.3905821, 1.0857, -0.7068233, 0, 0, 0, 1, 1,
-0.3858531, 0.26787, -2.82186, 1, 1, 1, 1, 1,
-0.3857751, -1.414312, -3.688516, 1, 1, 1, 1, 1,
-0.3819817, -0.1947332, -1.381925, 1, 1, 1, 1, 1,
-0.3791998, -2.539947, -3.478415, 1, 1, 1, 1, 1,
-0.3788091, -0.6820387, -2.032054, 1, 1, 1, 1, 1,
-0.3768461, -0.8431212, -3.129453, 1, 1, 1, 1, 1,
-0.3767082, -0.9384067, -2.219956, 1, 1, 1, 1, 1,
-0.3766466, 1.258941, -0.05717564, 1, 1, 1, 1, 1,
-0.3754656, -0.4648938, -2.300191, 1, 1, 1, 1, 1,
-0.3749124, -1.114983, -2.727027, 1, 1, 1, 1, 1,
-0.3725022, -1.172084, -4.257289, 1, 1, 1, 1, 1,
-0.3703984, -0.8010772, -2.974012, 1, 1, 1, 1, 1,
-0.3666305, 1.430415, 0.3371862, 1, 1, 1, 1, 1,
-0.3627944, 1.45785, 1.251391, 1, 1, 1, 1, 1,
-0.3627109, 1.222767, 0.1076843, 1, 1, 1, 1, 1,
-0.3610975, -2.446237, -2.508008, 0, 0, 1, 1, 1,
-0.3566884, 1.327538, -2.59586, 1, 0, 0, 1, 1,
-0.3551352, -0.5568196, -2.806339, 1, 0, 0, 1, 1,
-0.3549779, -0.4098151, -1.805161, 1, 0, 0, 1, 1,
-0.3541602, -0.3202209, -2.774072, 1, 0, 0, 1, 1,
-0.3530713, 0.03503409, -1.452477, 1, 0, 0, 1, 1,
-0.3527439, -0.8885595, -2.318209, 0, 0, 0, 1, 1,
-0.3428997, -0.5277972, -3.649633, 0, 0, 0, 1, 1,
-0.3395604, -1.185869, -2.942173, 0, 0, 0, 1, 1,
-0.3335426, 1.502839, 0.03606909, 0, 0, 0, 1, 1,
-0.3276403, -2.874122, -4.4661, 0, 0, 0, 1, 1,
-0.3195462, -1.420733, -2.903237, 0, 0, 0, 1, 1,
-0.3182674, 0.6282532, -0.9050412, 0, 0, 0, 1, 1,
-0.3172585, 1.481181, -1.046908, 1, 1, 1, 1, 1,
-0.3171426, 1.455523, 0.4360062, 1, 1, 1, 1, 1,
-0.3134523, -1.414178, -2.173388, 1, 1, 1, 1, 1,
-0.3129206, 0.03364303, -1.637615, 1, 1, 1, 1, 1,
-0.3094175, -0.6164916, -1.63723, 1, 1, 1, 1, 1,
-0.3073488, -1.16497, -2.020519, 1, 1, 1, 1, 1,
-0.306367, 0.832204, -0.3353801, 1, 1, 1, 1, 1,
-0.3062054, -0.5779445, -4.108187, 1, 1, 1, 1, 1,
-0.306092, 0.680811, -2.373963, 1, 1, 1, 1, 1,
-0.3046909, 1.4604, -0.4453951, 1, 1, 1, 1, 1,
-0.3022111, 2.087097, -0.288661, 1, 1, 1, 1, 1,
-0.2997023, 2.105459, 0.863847, 1, 1, 1, 1, 1,
-0.29682, 2.413081, -0.2549817, 1, 1, 1, 1, 1,
-0.2915096, -0.2811224, -1.844127, 1, 1, 1, 1, 1,
-0.2911656, -0.6234254, -3.093692, 1, 1, 1, 1, 1,
-0.2886595, 0.4896042, -0.07440709, 0, 0, 1, 1, 1,
-0.2885879, -0.1879339, -2.857274, 1, 0, 0, 1, 1,
-0.2856945, 1.50601, -0.3712969, 1, 0, 0, 1, 1,
-0.2797441, 0.9126927, 2.348338, 1, 0, 0, 1, 1,
-0.2692811, -0.1603282, -2.738843, 1, 0, 0, 1, 1,
-0.2679308, 0.5618738, 1.603102, 1, 0, 0, 1, 1,
-0.2677994, -0.2021361, -2.584138, 0, 0, 0, 1, 1,
-0.2622562, 0.1919951, -0.2049485, 0, 0, 0, 1, 1,
-0.261914, -0.6242321, -3.544246, 0, 0, 0, 1, 1,
-0.2559052, 0.004184072, -0.4799634, 0, 0, 0, 1, 1,
-0.2531926, 1.007581, 0.01537176, 0, 0, 0, 1, 1,
-0.2464101, -0.5849631, -4.064297, 0, 0, 0, 1, 1,
-0.2455639, -0.01207665, -1.680226, 0, 0, 0, 1, 1,
-0.2438619, 0.8049269, -1.492443, 1, 1, 1, 1, 1,
-0.2387592, -0.4442096, -1.189195, 1, 1, 1, 1, 1,
-0.237445, 1.225451, -0.4084506, 1, 1, 1, 1, 1,
-0.2300454, -2.060091, -4.774812, 1, 1, 1, 1, 1,
-0.2299962, 1.752953, -1.344242, 1, 1, 1, 1, 1,
-0.228478, 0.1051769, -1.682494, 1, 1, 1, 1, 1,
-0.2281075, 1.040929, -0.1164247, 1, 1, 1, 1, 1,
-0.2270738, 0.06917176, -0.9779553, 1, 1, 1, 1, 1,
-0.2260789, 0.5342557, -1.096753, 1, 1, 1, 1, 1,
-0.2232035, -1.063779, -4.016426, 1, 1, 1, 1, 1,
-0.221647, -1.158727, -3.170037, 1, 1, 1, 1, 1,
-0.2211428, -1.443006, -2.605167, 1, 1, 1, 1, 1,
-0.2176713, 2.155637, 0.1490542, 1, 1, 1, 1, 1,
-0.215754, 1.860025, -1.045986, 1, 1, 1, 1, 1,
-0.2155019, -0.1418189, -3.675891, 1, 1, 1, 1, 1,
-0.2147379, -0.8326329, -4.696125, 0, 0, 1, 1, 1,
-0.2094486, 0.03196673, -1.942424, 1, 0, 0, 1, 1,
-0.2066329, 0.9244395, 1.137998, 1, 0, 0, 1, 1,
-0.206357, -0.1818451, -1.390166, 1, 0, 0, 1, 1,
-0.2031346, -0.6187724, -1.814084, 1, 0, 0, 1, 1,
-0.2013461, -0.9991835, -2.900096, 1, 0, 0, 1, 1,
-0.2010901, 0.1483603, -0.1305392, 0, 0, 0, 1, 1,
-0.2005687, -1.074914, -3.053907, 0, 0, 0, 1, 1,
-0.1992117, -0.06143767, -3.010521, 0, 0, 0, 1, 1,
-0.1979758, 0.1469188, -0.9527947, 0, 0, 0, 1, 1,
-0.1925576, 0.08202212, -0.7309102, 0, 0, 0, 1, 1,
-0.1918406, 1.527039, -0.1702284, 0, 0, 0, 1, 1,
-0.1901176, -1.370581, -4.106268, 0, 0, 0, 1, 1,
-0.1897779, 0.7290185, -0.5273045, 1, 1, 1, 1, 1,
-0.1883438, 1.699589, 1.416528, 1, 1, 1, 1, 1,
-0.1868003, 0.9326397, 0.6649108, 1, 1, 1, 1, 1,
-0.1826511, 0.6172569, -2.745601, 1, 1, 1, 1, 1,
-0.181512, 1.198084, -0.2544037, 1, 1, 1, 1, 1,
-0.1756047, 0.3978457, 1.229307, 1, 1, 1, 1, 1,
-0.1728103, 2.651519, -0.7416757, 1, 1, 1, 1, 1,
-0.1716225, -1.337048, -4.242235, 1, 1, 1, 1, 1,
-0.1710507, -1.309612, -2.793924, 1, 1, 1, 1, 1,
-0.1707501, -1.365355, -1.353765, 1, 1, 1, 1, 1,
-0.169974, 0.7090369, -0.431788, 1, 1, 1, 1, 1,
-0.1692128, -1.742007, -3.025435, 1, 1, 1, 1, 1,
-0.1688601, 0.4620534, 0.8271517, 1, 1, 1, 1, 1,
-0.1673581, 3.382857, 0.4832555, 1, 1, 1, 1, 1,
-0.1672952, 0.9368087, -1.389157, 1, 1, 1, 1, 1,
-0.1670952, 0.1637781, -0.5820091, 0, 0, 1, 1, 1,
-0.1650749, -0.809284, -3.061391, 1, 0, 0, 1, 1,
-0.1629252, 0.3825633, -0.8341709, 1, 0, 0, 1, 1,
-0.162623, 0.7967637, 0.8610744, 1, 0, 0, 1, 1,
-0.1622529, 1.38077, 0.6600678, 1, 0, 0, 1, 1,
-0.1620031, 0.3804806, 1.023996, 1, 0, 0, 1, 1,
-0.1592045, -1.382161, -1.649174, 0, 0, 0, 1, 1,
-0.155654, -2.057721, -1.553697, 0, 0, 0, 1, 1,
-0.1549862, -1.19777, -3.847855, 0, 0, 0, 1, 1,
-0.1493405, -1.206314, -2.513596, 0, 0, 0, 1, 1,
-0.1461248, -0.655999, -1.507077, 0, 0, 0, 1, 1,
-0.1433569, 1.78317, 0.6430697, 0, 0, 0, 1, 1,
-0.1423322, -0.8528289, -5.403387, 0, 0, 0, 1, 1,
-0.1368058, 1.723127, -0.5977845, 1, 1, 1, 1, 1,
-0.1354118, -0.7605483, -1.439418, 1, 1, 1, 1, 1,
-0.1352256, 1.75753, -0.9100921, 1, 1, 1, 1, 1,
-0.1304838, 0.5369508, -0.8117692, 1, 1, 1, 1, 1,
-0.1288618, -0.8367158, -3.28783, 1, 1, 1, 1, 1,
-0.1284295, 1.38557, -0.6194378, 1, 1, 1, 1, 1,
-0.1212643, 0.02897548, -0.9121922, 1, 1, 1, 1, 1,
-0.1178726, -1.477371, -4.142469, 1, 1, 1, 1, 1,
-0.1171551, -1.300376, -4.434361, 1, 1, 1, 1, 1,
-0.1168244, -1.034503, -2.670785, 1, 1, 1, 1, 1,
-0.1161847, 0.2443823, -0.08833958, 1, 1, 1, 1, 1,
-0.1122996, -0.1242185, -4.074225, 1, 1, 1, 1, 1,
-0.1122617, -0.307363, -3.32113, 1, 1, 1, 1, 1,
-0.1116632, -0.3337624, -1.324608, 1, 1, 1, 1, 1,
-0.1111875, -0.2006397, -1.792911, 1, 1, 1, 1, 1,
-0.1027224, 1.431619, -0.6237175, 0, 0, 1, 1, 1,
-0.1020632, 0.3745877, -0.6866177, 1, 0, 0, 1, 1,
-0.1011785, 0.01581359, -0.6942084, 1, 0, 0, 1, 1,
-0.0987613, 0.9155848, -1.390509, 1, 0, 0, 1, 1,
-0.09789757, -0.04837672, -2.744823, 1, 0, 0, 1, 1,
-0.0967756, 1.256463, 0.333459, 1, 0, 0, 1, 1,
-0.09294939, -0.7827653, -3.115643, 0, 0, 0, 1, 1,
-0.09205011, -1.7222, -3.626619, 0, 0, 0, 1, 1,
-0.09078702, -1.781663, -4.57502, 0, 0, 0, 1, 1,
-0.08662608, -0.7615466, -4.468111, 0, 0, 0, 1, 1,
-0.0847903, 0.7875544, -0.08828813, 0, 0, 0, 1, 1,
-0.08148678, 0.6482815, -0.7770023, 0, 0, 0, 1, 1,
-0.08035766, 0.2886301, -0.1766654, 0, 0, 0, 1, 1,
-0.0790358, 0.991038, -1.291503, 1, 1, 1, 1, 1,
-0.07623956, 0.3617418, -1.916503, 1, 1, 1, 1, 1,
-0.07569095, 1.119611, 0.4475805, 1, 1, 1, 1, 1,
-0.07130549, -0.2292406, -2.470671, 1, 1, 1, 1, 1,
-0.07044607, 1.140348, 0.1800708, 1, 1, 1, 1, 1,
-0.06892421, -1.06817, -3.754918, 1, 1, 1, 1, 1,
-0.05929818, 0.2903903, -0.5902253, 1, 1, 1, 1, 1,
-0.05888132, 0.6103517, -1.084277, 1, 1, 1, 1, 1,
-0.05636752, 1.295229, 0.4988622, 1, 1, 1, 1, 1,
-0.05588995, 0.1821133, -2.121575, 1, 1, 1, 1, 1,
-0.05548334, -0.3790236, -3.686633, 1, 1, 1, 1, 1,
-0.05054396, 0.4581016, 0.2475783, 1, 1, 1, 1, 1,
-0.04837295, -1.746306, -2.932484, 1, 1, 1, 1, 1,
-0.04824689, 2.340312, 0.4101861, 1, 1, 1, 1, 1,
-0.04309241, 0.1353346, 0.1745518, 1, 1, 1, 1, 1,
-0.03655294, 0.5127097, 0.6072, 0, 0, 1, 1, 1,
-0.0364131, 0.4031096, 0.4900576, 1, 0, 0, 1, 1,
-0.03213786, 0.8689289, 1.478698, 1, 0, 0, 1, 1,
-0.02940494, -1.247865, -4.17949, 1, 0, 0, 1, 1,
-0.02493724, -0.1997813, -3.082875, 1, 0, 0, 1, 1,
-0.02415893, -1.960247, -2.316813, 1, 0, 0, 1, 1,
-0.02404839, 0.6919841, 1.488184, 0, 0, 0, 1, 1,
-0.02315364, 0.2574725, -0.6410074, 0, 0, 0, 1, 1,
-0.02189924, -1.194606, -2.308412, 0, 0, 0, 1, 1,
-0.01980428, -0.3246234, -1.974357, 0, 0, 0, 1, 1,
-0.01950458, 0.7178484, 0.4438647, 0, 0, 0, 1, 1,
-0.01692609, -1.011184, -2.435452, 0, 0, 0, 1, 1,
-0.0161965, -1.067299, -3.88491, 0, 0, 0, 1, 1,
-0.01040327, -0.3453704, -2.808988, 1, 1, 1, 1, 1,
-0.01032445, 0.4159849, -1.283476, 1, 1, 1, 1, 1,
-0.004940753, 0.2926059, 0.07811955, 1, 1, 1, 1, 1,
-0.002313013, 0.06713566, 0.481503, 1, 1, 1, 1, 1,
-0.001815101, 0.0469623, 0.6612319, 1, 1, 1, 1, 1,
0.002794724, -0.3136841, 3.579471, 1, 1, 1, 1, 1,
0.005369142, -0.1582257, 2.837562, 1, 1, 1, 1, 1,
0.005590554, -0.1646767, 3.569108, 1, 1, 1, 1, 1,
0.00631213, 1.328964, 1.060562, 1, 1, 1, 1, 1,
0.009194879, 1.73706, 0.8601959, 1, 1, 1, 1, 1,
0.01024385, -1.699174, 3.081725, 1, 1, 1, 1, 1,
0.01156588, -0.3663392, 2.753902, 1, 1, 1, 1, 1,
0.01280563, 0.5356717, -0.7080593, 1, 1, 1, 1, 1,
0.01504787, 1.123879, -0.9144518, 1, 1, 1, 1, 1,
0.01707736, -2.158885, 1.289695, 1, 1, 1, 1, 1,
0.01753095, -1.497728, 3.228263, 0, 0, 1, 1, 1,
0.02088135, 0.5746024, 1.249515, 1, 0, 0, 1, 1,
0.02259228, -1.503607, 3.509906, 1, 0, 0, 1, 1,
0.02342749, 0.05910411, -1.172761, 1, 0, 0, 1, 1,
0.02401594, -0.1849505, 1.525929, 1, 0, 0, 1, 1,
0.02697558, 0.1044944, 0.7804381, 1, 0, 0, 1, 1,
0.0273024, 0.07276653, -0.1624462, 0, 0, 0, 1, 1,
0.02864071, -0.6690587, 3.15838, 0, 0, 0, 1, 1,
0.04186288, 2.176049, -0.1563417, 0, 0, 0, 1, 1,
0.04316895, 2.038879, -0.1511772, 0, 0, 0, 1, 1,
0.04405303, 1.92011, 0.03213686, 0, 0, 0, 1, 1,
0.04478559, -0.1671311, 4.610241, 0, 0, 0, 1, 1,
0.04847667, -0.08519966, 1.623172, 0, 0, 0, 1, 1,
0.05013628, 0.3224946, 0.7453219, 1, 1, 1, 1, 1,
0.05104626, 1.104498, -0.511237, 1, 1, 1, 1, 1,
0.0519717, -1.579454, 2.235549, 1, 1, 1, 1, 1,
0.05788701, -0.3446181, 3.003776, 1, 1, 1, 1, 1,
0.05824906, -0.6194629, 3.801297, 1, 1, 1, 1, 1,
0.05831967, 0.353774, 1.252652, 1, 1, 1, 1, 1,
0.06526161, -1.223227, 1.097899, 1, 1, 1, 1, 1,
0.06613375, -0.2360434, 3.068723, 1, 1, 1, 1, 1,
0.06800615, -2.088975, 2.672777, 1, 1, 1, 1, 1,
0.06909307, 0.4142706, 0.2508657, 1, 1, 1, 1, 1,
0.07715839, -0.794092, 3.70714, 1, 1, 1, 1, 1,
0.08191539, -1.016009, 1.059823, 1, 1, 1, 1, 1,
0.08216203, 0.1227622, 1.233872, 1, 1, 1, 1, 1,
0.08904888, 0.0334168, 1.056108, 1, 1, 1, 1, 1,
0.09192066, -1.152226, 5.214449, 1, 1, 1, 1, 1,
0.0926924, -0.2091119, 3.857148, 0, 0, 1, 1, 1,
0.09457181, 0.8426329, 0.3093281, 1, 0, 0, 1, 1,
0.09996268, 0.2619562, 0.4281261, 1, 0, 0, 1, 1,
0.1000379, -1.047494, 2.453561, 1, 0, 0, 1, 1,
0.1029627, 0.52175, -0.07402066, 1, 0, 0, 1, 1,
0.1057731, -0.1196687, 3.315228, 1, 0, 0, 1, 1,
0.1072558, -1.338687, 2.897525, 0, 0, 0, 1, 1,
0.1075841, -0.1253162, 1.480425, 0, 0, 0, 1, 1,
0.1088738, 1.32265, 1.741142, 0, 0, 0, 1, 1,
0.112461, -0.2595667, 1.214635, 0, 0, 0, 1, 1,
0.1134383, -1.143861, 3.724934, 0, 0, 0, 1, 1,
0.117749, 0.7836672, 1.311706, 0, 0, 0, 1, 1,
0.1214642, 0.7307115, -0.9433282, 0, 0, 0, 1, 1,
0.1225311, -0.2798664, 3.246934, 1, 1, 1, 1, 1,
0.1240577, 0.4949668, 0.05871833, 1, 1, 1, 1, 1,
0.1260215, 1.614499, 1.678929, 1, 1, 1, 1, 1,
0.1264499, 0.8282293, 1.830281, 1, 1, 1, 1, 1,
0.1289606, -2.028747, 2.669183, 1, 1, 1, 1, 1,
0.1307705, -1.131804, 2.410413, 1, 1, 1, 1, 1,
0.1340307, -1.271331, 1.65777, 1, 1, 1, 1, 1,
0.1345203, -0.3969573, 4.778258, 1, 1, 1, 1, 1,
0.1387074, 2.311937, -0.6592089, 1, 1, 1, 1, 1,
0.1440731, -0.6959957, 2.955152, 1, 1, 1, 1, 1,
0.1534177, -0.6297543, 3.959137, 1, 1, 1, 1, 1,
0.1594804, 0.4292287, 0.18019, 1, 1, 1, 1, 1,
0.1597592, 0.02098726, 1.639176, 1, 1, 1, 1, 1,
0.1602521, -0.575388, 2.370379, 1, 1, 1, 1, 1,
0.1605959, -1.248457, 2.967808, 1, 1, 1, 1, 1,
0.1616096, 1.210797, 2.277045, 0, 0, 1, 1, 1,
0.1643724, -2.944455, 2.974992, 1, 0, 0, 1, 1,
0.1662507, -1.137329, 3.382951, 1, 0, 0, 1, 1,
0.1670824, -1.873512, 3.485266, 1, 0, 0, 1, 1,
0.1700047, 0.2730864, 1.07742, 1, 0, 0, 1, 1,
0.1743952, -1.183187, 1.789554, 1, 0, 0, 1, 1,
0.1756098, -1.629801, 2.001719, 0, 0, 0, 1, 1,
0.1802664, 0.9125092, -0.359361, 0, 0, 0, 1, 1,
0.184563, 1.394693, 1.540418, 0, 0, 0, 1, 1,
0.1936278, -0.1824478, 2.285075, 0, 0, 0, 1, 1,
0.195287, 1.548975, -1.588093, 0, 0, 0, 1, 1,
0.1956634, 0.4394467, -2.299205, 0, 0, 0, 1, 1,
0.1978503, -0.8049477, 3.724941, 0, 0, 0, 1, 1,
0.2005614, -0.005156429, 1.140905, 1, 1, 1, 1, 1,
0.2010275, 0.1635481, 1.214071, 1, 1, 1, 1, 1,
0.2097609, 0.6999561, 2.444472, 1, 1, 1, 1, 1,
0.2115823, -0.3486547, 2.585487, 1, 1, 1, 1, 1,
0.2128149, -0.3727189, 4.154904, 1, 1, 1, 1, 1,
0.2131564, -0.5579803, 2.532289, 1, 1, 1, 1, 1,
0.223306, -1.674651, 3.391565, 1, 1, 1, 1, 1,
0.2242655, -0.3056848, 2.879725, 1, 1, 1, 1, 1,
0.2245596, -1.409958, 2.022855, 1, 1, 1, 1, 1,
0.2254185, -0.238886, 0.7352851, 1, 1, 1, 1, 1,
0.2295326, -1.200412, 2.15962, 1, 1, 1, 1, 1,
0.2311179, 0.9513865, 1.686689, 1, 1, 1, 1, 1,
0.2364522, 0.7764349, 1.161757, 1, 1, 1, 1, 1,
0.243483, -0.08389734, 3.619618, 1, 1, 1, 1, 1,
0.2440322, 0.4946285, 1.312154, 1, 1, 1, 1, 1,
0.2466309, -1.038525, 4.759303, 0, 0, 1, 1, 1,
0.2493088, 0.3704885, 0.4761419, 1, 0, 0, 1, 1,
0.2527511, 0.1226675, 0.4008779, 1, 0, 0, 1, 1,
0.2540906, 0.8451418, -1.255171, 1, 0, 0, 1, 1,
0.2558508, -0.2916482, 3.059233, 1, 0, 0, 1, 1,
0.2623881, 0.2146968, 0.6368256, 1, 0, 0, 1, 1,
0.2628627, -0.2080325, 3.249743, 0, 0, 0, 1, 1,
0.2666463, 0.6248819, 0.8963069, 0, 0, 0, 1, 1,
0.268905, -0.5789657, 1.676187, 0, 0, 0, 1, 1,
0.2693938, 0.1303851, -0.2875462, 0, 0, 0, 1, 1,
0.2727481, 1.317677, 1.676558, 0, 0, 0, 1, 1,
0.2731577, 0.07804379, 1.943908, 0, 0, 0, 1, 1,
0.2772833, 1.419309, 0.8421801, 0, 0, 0, 1, 1,
0.2826588, 0.3509754, 0.1544299, 1, 1, 1, 1, 1,
0.2903088, 0.9315751, 0.3555168, 1, 1, 1, 1, 1,
0.2916929, -1.309952, 4.380015, 1, 1, 1, 1, 1,
0.2924947, 1.799498, -0.9780383, 1, 1, 1, 1, 1,
0.2955405, -0.4066359, 2.260005, 1, 1, 1, 1, 1,
0.3000633, 0.03867058, 0.8976688, 1, 1, 1, 1, 1,
0.3013944, 0.4296416, 0.2304926, 1, 1, 1, 1, 1,
0.3059377, 0.2155346, 1.728089, 1, 1, 1, 1, 1,
0.3071008, 0.2416667, 0.3618212, 1, 1, 1, 1, 1,
0.3246003, 0.7036867, -0.9285685, 1, 1, 1, 1, 1,
0.3308932, -0.7278719, 2.371233, 1, 1, 1, 1, 1,
0.3313244, 0.5458436, -0.6231868, 1, 1, 1, 1, 1,
0.3318592, -1.566759, 3.107324, 1, 1, 1, 1, 1,
0.3331131, 1.017187, -1.177831, 1, 1, 1, 1, 1,
0.333299, 0.1956957, 1.384109, 1, 1, 1, 1, 1,
0.3338192, 0.5441321, -1.305532, 0, 0, 1, 1, 1,
0.3339755, 0.4072077, 1.479667, 1, 0, 0, 1, 1,
0.33449, -1.181166, 2.301349, 1, 0, 0, 1, 1,
0.334563, -0.3501376, 2.28816, 1, 0, 0, 1, 1,
0.334872, -0.7755509, 2.711568, 1, 0, 0, 1, 1,
0.3351314, 0.3409372, 0.2871517, 1, 0, 0, 1, 1,
0.3353189, 0.1175751, 1.590206, 0, 0, 0, 1, 1,
0.3381945, 0.7694313, -0.001223005, 0, 0, 0, 1, 1,
0.3451431, 1.011286, -0.217034, 0, 0, 0, 1, 1,
0.3489927, -0.2923161, 0.9210457, 0, 0, 0, 1, 1,
0.3495257, 0.2792918, 0.2235, 0, 0, 0, 1, 1,
0.3516826, -0.3058688, 1.515631, 0, 0, 0, 1, 1,
0.3586822, -0.7154701, 3.464301, 0, 0, 0, 1, 1,
0.3627042, -0.1607169, 2.654198, 1, 1, 1, 1, 1,
0.3628359, -1.820649, 4.368228, 1, 1, 1, 1, 1,
0.3741366, -1.169405, 2.05625, 1, 1, 1, 1, 1,
0.3777238, 0.9651422, 0.8896447, 1, 1, 1, 1, 1,
0.3777448, 1.372511, 0.1720825, 1, 1, 1, 1, 1,
0.3800726, -0.2998832, 0.628855, 1, 1, 1, 1, 1,
0.38509, 0.1308358, 1.655797, 1, 1, 1, 1, 1,
0.3868012, 1.726582, 0.4138821, 1, 1, 1, 1, 1,
0.3935253, 0.7205432, -0.1396088, 1, 1, 1, 1, 1,
0.3952717, 0.8193177, 0.2328587, 1, 1, 1, 1, 1,
0.3962865, 0.1065553, 2.375943, 1, 1, 1, 1, 1,
0.3970853, 0.4386249, 2.410048, 1, 1, 1, 1, 1,
0.3982778, -0.2179085, 1.115005, 1, 1, 1, 1, 1,
0.399183, 0.9343596, 1.09407, 1, 1, 1, 1, 1,
0.3994441, 0.6614484, 1.286264, 1, 1, 1, 1, 1,
0.4046423, -1.654505, 2.470009, 0, 0, 1, 1, 1,
0.4058924, 0.7241548, -0.3330767, 1, 0, 0, 1, 1,
0.4079852, -1.360839, 4.961451, 1, 0, 0, 1, 1,
0.4133511, -0.5214406, 2.34288, 1, 0, 0, 1, 1,
0.4152085, -1.148503, 3.756056, 1, 0, 0, 1, 1,
0.4181423, -0.01573448, 2.84498, 1, 0, 0, 1, 1,
0.4264796, 1.015414, 0.3985697, 0, 0, 0, 1, 1,
0.4279942, -0.1238283, 1.669716, 0, 0, 0, 1, 1,
0.4282422, 1.116358, 0.5983114, 0, 0, 0, 1, 1,
0.4307937, 1.314553, -0.9012529, 0, 0, 0, 1, 1,
0.4372919, -2.009106, 2.626291, 0, 0, 0, 1, 1,
0.440338, -0.9402585, 3.039267, 0, 0, 0, 1, 1,
0.4419945, -0.972497, 2.962267, 0, 0, 0, 1, 1,
0.4422098, 1.2021, -0.8386077, 1, 1, 1, 1, 1,
0.4422539, 1.716433, 0.443961, 1, 1, 1, 1, 1,
0.445142, -0.2435957, 3.527352, 1, 1, 1, 1, 1,
0.4482808, 0.4959087, 0.6250603, 1, 1, 1, 1, 1,
0.4501703, 1.886538, -0.6846956, 1, 1, 1, 1, 1,
0.451445, -0.334778, 2.891935, 1, 1, 1, 1, 1,
0.453231, -0.0285067, 2.581955, 1, 1, 1, 1, 1,
0.4536668, -1.274758, 1.995293, 1, 1, 1, 1, 1,
0.454859, -2.013669, 4.073107, 1, 1, 1, 1, 1,
0.4579152, -0.4863061, 4.096423, 1, 1, 1, 1, 1,
0.4591215, -0.5499838, 3.51048, 1, 1, 1, 1, 1,
0.4627241, 0.678229, -0.6124982, 1, 1, 1, 1, 1,
0.4662766, 1.397534, 1.575014, 1, 1, 1, 1, 1,
0.470145, -0.8578093, 2.384941, 1, 1, 1, 1, 1,
0.471076, -0.5244402, 4.45997, 1, 1, 1, 1, 1,
0.4711616, 0.8851958, -0.1191631, 0, 0, 1, 1, 1,
0.4720253, -1.927612, 1.840127, 1, 0, 0, 1, 1,
0.472349, -1.998829, 1.055394, 1, 0, 0, 1, 1,
0.4755535, 0.01399508, 1.810326, 1, 0, 0, 1, 1,
0.4763812, -0.3668008, 0.5447124, 1, 0, 0, 1, 1,
0.480105, 0.7809282, -0.9519567, 1, 0, 0, 1, 1,
0.4883074, 0.4427048, 2.460303, 0, 0, 0, 1, 1,
0.4920012, 0.5224903, 1.377896, 0, 0, 0, 1, 1,
0.4926084, 0.3365113, 0.1957595, 0, 0, 0, 1, 1,
0.4942814, -0.1862033, 3.164496, 0, 0, 0, 1, 1,
0.4954744, 1.292988, -0.9527658, 0, 0, 0, 1, 1,
0.4971257, 0.6424268, 0.1894012, 0, 0, 0, 1, 1,
0.498418, -0.464609, 3.135397, 0, 0, 0, 1, 1,
0.5023016, -2.455309, 2.933056, 1, 1, 1, 1, 1,
0.5057833, 0.1124228, 3.576597, 1, 1, 1, 1, 1,
0.5080475, 0.7975348, 1.996013, 1, 1, 1, 1, 1,
0.5084037, -1.189995, 4.259143, 1, 1, 1, 1, 1,
0.5096501, 2.439588, 0.4770546, 1, 1, 1, 1, 1,
0.5113578, 0.6833472, -1.736048, 1, 1, 1, 1, 1,
0.5192389, -0.08651828, 3.691125, 1, 1, 1, 1, 1,
0.5201353, -0.5578593, 2.354192, 1, 1, 1, 1, 1,
0.5203197, -1.306325, 3.044247, 1, 1, 1, 1, 1,
0.5222908, -1.35025, 2.679904, 1, 1, 1, 1, 1,
0.5288664, 2.030591, -1.244887, 1, 1, 1, 1, 1,
0.5424522, 0.6835207, 2.352333, 1, 1, 1, 1, 1,
0.5438337, 0.313273, 0.328624, 1, 1, 1, 1, 1,
0.5471771, -1.535789, 2.186727, 1, 1, 1, 1, 1,
0.5511918, 0.3134588, 0.7217584, 1, 1, 1, 1, 1,
0.5522303, -1.140352, 2.66083, 0, 0, 1, 1, 1,
0.5623387, 0.3274838, 2.05367, 1, 0, 0, 1, 1,
0.5641534, 0.2167326, 0.3549321, 1, 0, 0, 1, 1,
0.5696512, -1.950938, 0.7579358, 1, 0, 0, 1, 1,
0.5711393, -1.17244, 4.945371, 1, 0, 0, 1, 1,
0.582917, 0.41979, 1.592132, 1, 0, 0, 1, 1,
0.5856827, 0.1742783, 1.493006, 0, 0, 0, 1, 1,
0.5866193, -0.1720307, 0.1341858, 0, 0, 0, 1, 1,
0.5901524, 0.2370317, -0.2193343, 0, 0, 0, 1, 1,
0.6098219, -0.9574456, 0.5344177, 0, 0, 0, 1, 1,
0.6111196, 0.01251385, 0.1864817, 0, 0, 0, 1, 1,
0.6113785, 0.319237, 1.018976, 0, 0, 0, 1, 1,
0.6304109, -0.07824703, 4.036665, 0, 0, 0, 1, 1,
0.6309944, 1.270856, 0.6532058, 1, 1, 1, 1, 1,
0.6313528, 2.312292, -0.3976933, 1, 1, 1, 1, 1,
0.6316203, 0.00765096, 1.634917, 1, 1, 1, 1, 1,
0.6363286, -0.308563, 3.500554, 1, 1, 1, 1, 1,
0.6384931, 0.4310844, 0.946005, 1, 1, 1, 1, 1,
0.6411393, -1.455007, 2.668465, 1, 1, 1, 1, 1,
0.641414, -0.0621321, 0.3676495, 1, 1, 1, 1, 1,
0.6436263, -0.7828146, 2.973637, 1, 1, 1, 1, 1,
0.6444325, -1.021474, 1.863449, 1, 1, 1, 1, 1,
0.6454153, 0.3179301, 3.332752, 1, 1, 1, 1, 1,
0.6506545, 0.3492321, -0.3450679, 1, 1, 1, 1, 1,
0.6524358, -0.3944609, 2.139824, 1, 1, 1, 1, 1,
0.6586849, -0.5293305, 2.846925, 1, 1, 1, 1, 1,
0.661469, -0.3072975, 1.906949, 1, 1, 1, 1, 1,
0.6615098, 0.01761252, 2.277468, 1, 1, 1, 1, 1,
0.6657422, -0.7665472, 4.211742, 0, 0, 1, 1, 1,
0.6669995, -1.020181, 0.9405412, 1, 0, 0, 1, 1,
0.6695096, -0.9121747, 2.943296, 1, 0, 0, 1, 1,
0.6706344, -1.344573, 2.982818, 1, 0, 0, 1, 1,
0.6706582, -0.2496707, 0.6851852, 1, 0, 0, 1, 1,
0.6726872, 0.08611159, 1.792268, 1, 0, 0, 1, 1,
0.6734366, -0.394403, 2.305114, 0, 0, 0, 1, 1,
0.6807246, 1.257198, 2.100809, 0, 0, 0, 1, 1,
0.6922404, -0.3855954, 1.22044, 0, 0, 0, 1, 1,
0.6926161, 1.189904, 1.184211, 0, 0, 0, 1, 1,
0.6976144, 0.6040704, 1.25005, 0, 0, 0, 1, 1,
0.6986953, -1.160066, 2.816192, 0, 0, 0, 1, 1,
0.7017578, -0.8933212, 2.824988, 0, 0, 0, 1, 1,
0.7081875, 1.194703, -0.7776838, 1, 1, 1, 1, 1,
0.710088, -0.7905787, 1.269789, 1, 1, 1, 1, 1,
0.718133, 1.65504, 0.04113682, 1, 1, 1, 1, 1,
0.7212181, -0.1749787, 0.7833585, 1, 1, 1, 1, 1,
0.724692, -0.1786337, 0.912434, 1, 1, 1, 1, 1,
0.7266539, -0.3387609, 2.056113, 1, 1, 1, 1, 1,
0.7336025, -0.91189, 1.414281, 1, 1, 1, 1, 1,
0.7398041, -0.6423869, 3.796364, 1, 1, 1, 1, 1,
0.7415057, 0.8395702, 0.2212362, 1, 1, 1, 1, 1,
0.7450461, -1.44531, 4.088813, 1, 1, 1, 1, 1,
0.7467465, -0.6099208, 2.848145, 1, 1, 1, 1, 1,
0.7539853, 0.2992489, 0.641076, 1, 1, 1, 1, 1,
0.7585899, -2.406209, 3.556128, 1, 1, 1, 1, 1,
0.7650114, -0.2578388, 1.967531, 1, 1, 1, 1, 1,
0.7714115, -1.261614, 1.388124, 1, 1, 1, 1, 1,
0.7716498, -0.7875407, 1.346103, 0, 0, 1, 1, 1,
0.7748133, -0.05520912, 2.070119, 1, 0, 0, 1, 1,
0.7819843, -0.9589899, 2.208852, 1, 0, 0, 1, 1,
0.7826632, -0.132046, 2.72444, 1, 0, 0, 1, 1,
0.7864586, 0.7803552, 2.296429, 1, 0, 0, 1, 1,
0.7875392, -2.660432, 1.564548, 1, 0, 0, 1, 1,
0.7987109, -0.2652279, 0.2422921, 0, 0, 0, 1, 1,
0.7991542, 0.4887587, 1.163314, 0, 0, 0, 1, 1,
0.7995259, 0.8034543, 1.468222, 0, 0, 0, 1, 1,
0.8014757, 1.285328, -0.3454654, 0, 0, 0, 1, 1,
0.8025504, 2.060719, -0.007739132, 0, 0, 0, 1, 1,
0.8033587, 0.3102597, 1.358392, 0, 0, 0, 1, 1,
0.8035921, -0.3829139, 2.490378, 0, 0, 0, 1, 1,
0.8044215, 1.374819, -0.3895933, 1, 1, 1, 1, 1,
0.8111684, 0.9351513, 0.3023964, 1, 1, 1, 1, 1,
0.8137813, 0.4372767, -1.322073, 1, 1, 1, 1, 1,
0.8177214, -0.08040804, 2.013912, 1, 1, 1, 1, 1,
0.821971, 1.018452, 0.08386113, 1, 1, 1, 1, 1,
0.8267208, 1.378743, 0.5443864, 1, 1, 1, 1, 1,
0.8269212, -1.299965, 2.830609, 1, 1, 1, 1, 1,
0.8360537, -0.3277181, 2.382454, 1, 1, 1, 1, 1,
0.8439148, 0.319543, -0.9048873, 1, 1, 1, 1, 1,
0.8483492, -0.1205152, 2.795444, 1, 1, 1, 1, 1,
0.8524766, -1.90947, 2.394683, 1, 1, 1, 1, 1,
0.8528687, -1.396195, 3.697794, 1, 1, 1, 1, 1,
0.8530799, 0.05953659, -0.6133935, 1, 1, 1, 1, 1,
0.8546964, 0.07768317, 1.878661, 1, 1, 1, 1, 1,
0.8591055, 0.7594498, -0.04789997, 1, 1, 1, 1, 1,
0.8615064, 0.5822996, 1.844215, 0, 0, 1, 1, 1,
0.8629589, -1.956141, 3.558807, 1, 0, 0, 1, 1,
0.8671984, 2.234308, 1.519434, 1, 0, 0, 1, 1,
0.8679454, 1.162902, 0.4499158, 1, 0, 0, 1, 1,
0.8691422, -1.483192, 1.533943, 1, 0, 0, 1, 1,
0.8734642, -1.467521, 5.048368, 1, 0, 0, 1, 1,
0.8754747, -1.009044, 3.039832, 0, 0, 0, 1, 1,
0.8776592, -0.4145466, 0.947888, 0, 0, 0, 1, 1,
0.8834239, -0.2511394, 2.133614, 0, 0, 0, 1, 1,
0.8840473, -0.0572384, 2.109021, 0, 0, 0, 1, 1,
0.8873488, 0.728004, 1.058341, 0, 0, 0, 1, 1,
0.8882199, 2.361753, 0.7762156, 0, 0, 0, 1, 1,
0.8968379, -0.1409512, 2.371791, 0, 0, 0, 1, 1,
0.8989242, -0.9512985, 2.609128, 1, 1, 1, 1, 1,
0.9033208, 0.4827248, 1.816697, 1, 1, 1, 1, 1,
0.9035236, 0.7811105, 0.01903708, 1, 1, 1, 1, 1,
0.905424, 0.2507742, 1.834478, 1, 1, 1, 1, 1,
0.9061221, -0.6225007, 2.951727, 1, 1, 1, 1, 1,
0.9085299, 1.21012, 1.627171, 1, 1, 1, 1, 1,
0.9086111, -0.04838553, 2.272013, 1, 1, 1, 1, 1,
0.9188255, -0.05129466, 2.133545, 1, 1, 1, 1, 1,
0.9188436, 0.7743999, 0.47054, 1, 1, 1, 1, 1,
0.9239132, 2.244875, -0.2002205, 1, 1, 1, 1, 1,
0.9327699, 1.26463, -0.5112365, 1, 1, 1, 1, 1,
0.9366322, -1.072879, 3.266838, 1, 1, 1, 1, 1,
0.9371253, -0.7245437, 2.182504, 1, 1, 1, 1, 1,
0.941219, -0.4690682, 3.267717, 1, 1, 1, 1, 1,
0.9424207, 1.21303, 0.9155259, 1, 1, 1, 1, 1,
0.9491146, 0.996515, 1.886742, 0, 0, 1, 1, 1,
0.9593037, 0.4751501, 1.381293, 1, 0, 0, 1, 1,
0.9620045, 0.2878498, -0.2920257, 1, 0, 0, 1, 1,
0.9680219, 0.3033731, 1.663137, 1, 0, 0, 1, 1,
0.9690875, 1.624442, 1.068652, 1, 0, 0, 1, 1,
0.9695884, -0.03260314, 2.233041, 1, 0, 0, 1, 1,
0.9794548, 1.660414, 1.486072, 0, 0, 0, 1, 1,
0.9805617, -1.268018, 2.464345, 0, 0, 0, 1, 1,
1.002991, -0.3929681, 2.416842, 0, 0, 0, 1, 1,
1.004109, -0.1547908, 2.764369, 0, 0, 0, 1, 1,
1.015417, 0.3406872, 1.012977, 0, 0, 0, 1, 1,
1.016017, -0.5103494, 2.540828, 0, 0, 0, 1, 1,
1.018792, 0.4444417, 2.06993, 0, 0, 0, 1, 1,
1.025058, -0.5068169, 0.6595995, 1, 1, 1, 1, 1,
1.031411, 0.9742665, 0.6617486, 1, 1, 1, 1, 1,
1.032599, -0.9533048, 1.579417, 1, 1, 1, 1, 1,
1.041721, 1.268961, 1.139363, 1, 1, 1, 1, 1,
1.043231, 1.576189, -0.1992575, 1, 1, 1, 1, 1,
1.043344, 0.8522396, 0.7999389, 1, 1, 1, 1, 1,
1.055974, -1.08602, 2.938885, 1, 1, 1, 1, 1,
1.061009, 1.986111, 0.1050027, 1, 1, 1, 1, 1,
1.061067, 0.02153991, 2.563956, 1, 1, 1, 1, 1,
1.062951, 0.2482328, 2.743044, 1, 1, 1, 1, 1,
1.07206, -0.498764, 2.283936, 1, 1, 1, 1, 1,
1.079643, 0.8145147, -1.355722, 1, 1, 1, 1, 1,
1.081901, 1.030157, 0.6578968, 1, 1, 1, 1, 1,
1.084628, 0.2225273, 1.51996, 1, 1, 1, 1, 1,
1.088364, -0.308213, 3.071184, 1, 1, 1, 1, 1,
1.092477, 0.7545176, 1.685459, 0, 0, 1, 1, 1,
1.098354, -0.2069502, 1.260948, 1, 0, 0, 1, 1,
1.101142, -0.3166705, 1.831432, 1, 0, 0, 1, 1,
1.110848, 1.982329, 2.135322, 1, 0, 0, 1, 1,
1.111078, 0.3451166, 1.691708, 1, 0, 0, 1, 1,
1.11122, -0.1547537, 0.1953645, 1, 0, 0, 1, 1,
1.112649, 0.6472437, 2.378941, 0, 0, 0, 1, 1,
1.120387, 0.02991692, 1.209826, 0, 0, 0, 1, 1,
1.130415, -1.371683, 3.373412, 0, 0, 0, 1, 1,
1.145013, -0.3070445, 2.27465, 0, 0, 0, 1, 1,
1.146627, -0.159213, 0.2152596, 0, 0, 0, 1, 1,
1.146762, -0.7469198, 2.606761, 0, 0, 0, 1, 1,
1.151543, -0.8000267, 2.04659, 0, 0, 0, 1, 1,
1.155618, -0.7665845, 1.768598, 1, 1, 1, 1, 1,
1.171337, 0.1526403, 0.3977328, 1, 1, 1, 1, 1,
1.17356, -0.3428936, 2.501632, 1, 1, 1, 1, 1,
1.182017, -0.1376444, 1.861708, 1, 1, 1, 1, 1,
1.193631, -0.1155275, -0.136563, 1, 1, 1, 1, 1,
1.195925, 0.414675, 1.339068, 1, 1, 1, 1, 1,
1.197138, 1.187548, 2.20403, 1, 1, 1, 1, 1,
1.197163, -0.912309, 3.117667, 1, 1, 1, 1, 1,
1.199329, 1.142771, 2.599761, 1, 1, 1, 1, 1,
1.204051, -1.783145, 2.436934, 1, 1, 1, 1, 1,
1.214092, -2.028646, 3.128594, 1, 1, 1, 1, 1,
1.222508, 0.2461207, 1.448036, 1, 1, 1, 1, 1,
1.225393, 2.573519, 0.1035978, 1, 1, 1, 1, 1,
1.236126, 0.3463857, 0.7676085, 1, 1, 1, 1, 1,
1.266936, 0.2186106, 1.285821, 1, 1, 1, 1, 1,
1.280195, 1.493189, 1.485959, 0, 0, 1, 1, 1,
1.284366, 0.6014155, 0.9007462, 1, 0, 0, 1, 1,
1.288446, 1.278103, -0.04356118, 1, 0, 0, 1, 1,
1.296823, 0.5908849, 1.687114, 1, 0, 0, 1, 1,
1.297036, -0.5102241, 1.163111, 1, 0, 0, 1, 1,
1.298944, -1.638431, 5.261686, 1, 0, 0, 1, 1,
1.313052, -1.188705, 2.332349, 0, 0, 0, 1, 1,
1.314221, -0.8521235, 2.07903, 0, 0, 0, 1, 1,
1.33817, 0.9081143, 0.6010165, 0, 0, 0, 1, 1,
1.342752, 1.658233, -0.7381613, 0, 0, 0, 1, 1,
1.35621, 0.1872013, 2.231101, 0, 0, 0, 1, 1,
1.365727, 0.4565327, 2.185762, 0, 0, 0, 1, 1,
1.380471, 1.170876, 1.127355, 0, 0, 0, 1, 1,
1.384108, -1.590132, 4.457822, 1, 1, 1, 1, 1,
1.395643, -0.4359926, 1.900106, 1, 1, 1, 1, 1,
1.396966, 0.07020986, -0.1716355, 1, 1, 1, 1, 1,
1.414441, 0.1376353, 0.9467966, 1, 1, 1, 1, 1,
1.421658, 0.9066821, 2.775081, 1, 1, 1, 1, 1,
1.426427, 0.6434026, 1.065062, 1, 1, 1, 1, 1,
1.460519, 1.148173, 0.3224784, 1, 1, 1, 1, 1,
1.465799, -1.207122, 2.921057, 1, 1, 1, 1, 1,
1.484408, 1.072636, 0.4120978, 1, 1, 1, 1, 1,
1.48454, 0.07385053, -0.1441457, 1, 1, 1, 1, 1,
1.485055, -0.01336158, 2.805659, 1, 1, 1, 1, 1,
1.488832, -0.1635487, 1.961341, 1, 1, 1, 1, 1,
1.495376, 1.844837, 0.9102402, 1, 1, 1, 1, 1,
1.501342, -0.8077536, 2.162249, 1, 1, 1, 1, 1,
1.502074, 0.4572407, 1.201079, 1, 1, 1, 1, 1,
1.50301, -0.940355, 1.182561, 0, 0, 1, 1, 1,
1.516828, 0.5052214, 1.004081, 1, 0, 0, 1, 1,
1.529326, -1.015043, 4.635795, 1, 0, 0, 1, 1,
1.546931, -0.3115759, 0.7658523, 1, 0, 0, 1, 1,
1.548489, 0.8507473, 2.502072, 1, 0, 0, 1, 1,
1.566638, -0.6904761, 2.515713, 1, 0, 0, 1, 1,
1.57281, 0.9348431, 1.226663, 0, 0, 0, 1, 1,
1.575618, -0.8635828, 1.493816, 0, 0, 0, 1, 1,
1.579698, -0.3773606, 1.712772, 0, 0, 0, 1, 1,
1.593307, 1.952765, 1.093781, 0, 0, 0, 1, 1,
1.593783, -1.32599, 0.4861531, 0, 0, 0, 1, 1,
1.612748, -1.539503, 2.960914, 0, 0, 0, 1, 1,
1.613138, 0.3536655, 1.98802, 0, 0, 0, 1, 1,
1.618977, 0.6937863, -0.7586904, 1, 1, 1, 1, 1,
1.623265, 0.8849505, 0.24007, 1, 1, 1, 1, 1,
1.626915, 0.1785047, 0.8793415, 1, 1, 1, 1, 1,
1.634041, -1.237864, 1.339591, 1, 1, 1, 1, 1,
1.638189, 0.3854392, 1.916906, 1, 1, 1, 1, 1,
1.643935, -0.4418569, 1.699788, 1, 1, 1, 1, 1,
1.654092, 0.3556528, 1.122929, 1, 1, 1, 1, 1,
1.671047, 0.2128712, 2.209768, 1, 1, 1, 1, 1,
1.6764, -0.9183653, 1.855869, 1, 1, 1, 1, 1,
1.69889, 0.5099509, 1.061567, 1, 1, 1, 1, 1,
1.703013, -0.1149247, 0.9126357, 1, 1, 1, 1, 1,
1.735185, -0.5452981, 1.222227, 1, 1, 1, 1, 1,
1.740451, 1.373117, 2.650568, 1, 1, 1, 1, 1,
1.758005, 1.361189, 1.951922, 1, 1, 1, 1, 1,
1.761223, -1.29395, 2.658885, 1, 1, 1, 1, 1,
1.766937, -1.572195, 1.600092, 0, 0, 1, 1, 1,
1.779316, -0.05165016, 1.922155, 1, 0, 0, 1, 1,
1.78296, -0.1160256, 0.1206296, 1, 0, 0, 1, 1,
1.819955, 1.983467, 1.677656, 1, 0, 0, 1, 1,
1.84498, -0.6660026, 2.292948, 1, 0, 0, 1, 1,
1.85443, 0.823927, -0.09823459, 1, 0, 0, 1, 1,
1.857042, -1.242325, 1.970768, 0, 0, 0, 1, 1,
1.902106, -1.07698, 2.079332, 0, 0, 0, 1, 1,
1.912101, 1.624225, 1.442528, 0, 0, 0, 1, 1,
1.958446, -0.4453188, 1.706791, 0, 0, 0, 1, 1,
1.958785, 1.21654, 0.5627606, 0, 0, 0, 1, 1,
1.967648, 1.681255, 1.790234, 0, 0, 0, 1, 1,
1.969021, -0.1462239, 1.623663, 0, 0, 0, 1, 1,
1.977641, -0.602362, 1.586652, 1, 1, 1, 1, 1,
1.984935, 1.220968, 3.043043, 1, 1, 1, 1, 1,
2.014459, 0.2795464, 2.701196, 1, 1, 1, 1, 1,
2.026567, 1.135146, 2.370529, 1, 1, 1, 1, 1,
2.044379, -0.2104548, 1.278438, 1, 1, 1, 1, 1,
2.05868, -0.2471074, 1.090027, 1, 1, 1, 1, 1,
2.086494, -0.6044859, 1.287234, 1, 1, 1, 1, 1,
2.115624, 0.3264156, 2.378421, 1, 1, 1, 1, 1,
2.118224, 0.282556, 1.059976, 1, 1, 1, 1, 1,
2.124555, 0.2975049, 2.504085, 1, 1, 1, 1, 1,
2.14106, -1.013436, 2.062985, 1, 1, 1, 1, 1,
2.167648, 2.783323, 2.004415, 1, 1, 1, 1, 1,
2.237244, 0.5214299, 1.290285, 1, 1, 1, 1, 1,
2.269744, -2.853717, 2.005154, 1, 1, 1, 1, 1,
2.275358, 0.9195189, 1.022292, 1, 1, 1, 1, 1,
2.293892, 0.4203321, 1.122329, 0, 0, 1, 1, 1,
2.30207, 0.2309724, 1.613028, 1, 0, 0, 1, 1,
2.306221, 0.06404775, 2.415267, 1, 0, 0, 1, 1,
2.340273, -0.9692762, 2.005984, 1, 0, 0, 1, 1,
2.355524, -0.4210179, 2.273074, 1, 0, 0, 1, 1,
2.372035, -0.9919496, 1.895245, 1, 0, 0, 1, 1,
2.45349, -0.5414395, 1.709224, 0, 0, 0, 1, 1,
2.455687, 1.580971, 1.546944, 0, 0, 0, 1, 1,
2.509402, 0.3464178, 1.574714, 0, 0, 0, 1, 1,
2.512096, 0.01264948, -0.4974792, 0, 0, 0, 1, 1,
2.518529, -0.7091857, 3.232757, 0, 0, 0, 1, 1,
2.613772, -0.8489286, 3.680265, 0, 0, 0, 1, 1,
2.638063, -0.5294632, 0.006866854, 0, 0, 0, 1, 1,
2.645478, -0.2699373, 1.915762, 1, 1, 1, 1, 1,
2.709139, 0.6636443, 2.874008, 1, 1, 1, 1, 1,
2.77818, -0.9999694, 1.219811, 1, 1, 1, 1, 1,
2.922167, -1.412151, 1.004897, 1, 1, 1, 1, 1,
2.972312, -1.182074, 1.583845, 1, 1, 1, 1, 1,
3.285432, -1.176291, 1.489865, 1, 1, 1, 1, 1,
4.153221, 1.349145, -0.1335841, 1, 1, 1, 1, 1
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
var radius = 9.859506;
var distance = 34.6311;
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
mvMatrix.translate( -0.4545529, -0.1213758, 0.07085061 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.6311);
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