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
-2.537108, 0.7278923, -0.603308, 1, 0, 0, 1,
-2.435834, 0.662694, -0.2611147, 1, 0.007843138, 0, 1,
-2.421987, 0.8042064, -0.3638539, 1, 0.01176471, 0, 1,
-2.379141, 0.1634258, -2.419686, 1, 0.01960784, 0, 1,
-2.218618, -0.7464536, -0.6028071, 1, 0.02352941, 0, 1,
-2.169231, 1.403161, -0.2704315, 1, 0.03137255, 0, 1,
-2.167215, -1.329732, -0.2397357, 1, 0.03529412, 0, 1,
-2.14989, 1.246038, -1.136199, 1, 0.04313726, 0, 1,
-2.111065, 0.7792357, -3.123956, 1, 0.04705882, 0, 1,
-2.109707, 0.3022463, -0.8888434, 1, 0.05490196, 0, 1,
-2.003579, 0.5670596, -0.9284003, 1, 0.05882353, 0, 1,
-1.997944, 1.880922, 1.37551, 1, 0.06666667, 0, 1,
-1.975756, -0.07635044, -3.040681, 1, 0.07058824, 0, 1,
-1.971562, -0.9923332, -2.56096, 1, 0.07843138, 0, 1,
-1.954311, 0.5124362, -2.709585, 1, 0.08235294, 0, 1,
-1.947538, 1.009749, -1.214603, 1, 0.09019608, 0, 1,
-1.927053, 0.4909713, -0.1758329, 1, 0.09411765, 0, 1,
-1.90254, 0.2659683, -1.706059, 1, 0.1019608, 0, 1,
-1.846879, 2.280664, -1.519361, 1, 0.1098039, 0, 1,
-1.837278, 0.5624433, -1.515275, 1, 0.1137255, 0, 1,
-1.81108, -1.14308, -2.275562, 1, 0.1215686, 0, 1,
-1.799507, -1.285619, -2.839134, 1, 0.1254902, 0, 1,
-1.794718, 0.1284984, 0.04151633, 1, 0.1333333, 0, 1,
-1.793825, -2.31996, -2.535707, 1, 0.1372549, 0, 1,
-1.780123, 1.352726, -1.614376, 1, 0.145098, 0, 1,
-1.764644, 1.820306, -0.5560324, 1, 0.1490196, 0, 1,
-1.764443, -0.2006554, -0.7700316, 1, 0.1568628, 0, 1,
-1.760193, 0.3238481, -0.8135883, 1, 0.1607843, 0, 1,
-1.747, 1.674129, 0.2489797, 1, 0.1686275, 0, 1,
-1.734488, 0.2303005, -3.014822, 1, 0.172549, 0, 1,
-1.728561, 0.5016907, -2.957741, 1, 0.1803922, 0, 1,
-1.715119, 0.9121495, -1.250975, 1, 0.1843137, 0, 1,
-1.710603, 1.864652, -2.037837, 1, 0.1921569, 0, 1,
-1.689644, -0.2683905, 0.8105538, 1, 0.1960784, 0, 1,
-1.680242, -1.341871, -2.898036, 1, 0.2039216, 0, 1,
-1.679038, 0.01785358, -3.959338, 1, 0.2117647, 0, 1,
-1.675954, 1.305295, -0.244925, 1, 0.2156863, 0, 1,
-1.666687, 0.3626694, -0.3296727, 1, 0.2235294, 0, 1,
-1.657285, 0.2739171, -0.3484673, 1, 0.227451, 0, 1,
-1.652312, -0.7065405, -1.402474, 1, 0.2352941, 0, 1,
-1.650729, -1.297256, -1.924003, 1, 0.2392157, 0, 1,
-1.646912, -0.4013279, 1.105315, 1, 0.2470588, 0, 1,
-1.632918, 1.511323, -2.6956, 1, 0.2509804, 0, 1,
-1.623302, -0.2497483, -0.06098588, 1, 0.2588235, 0, 1,
-1.622708, -0.4130382, -1.432777, 1, 0.2627451, 0, 1,
-1.586472, -1.444435, -1.424281, 1, 0.2705882, 0, 1,
-1.585712, -0.1009, -1.67493, 1, 0.2745098, 0, 1,
-1.550115, 0.03199366, -2.776902, 1, 0.282353, 0, 1,
-1.548901, 1.215537, -0.5999079, 1, 0.2862745, 0, 1,
-1.538916, 1.765567, -0.1934579, 1, 0.2941177, 0, 1,
-1.531789, -0.8645768, -1.07083, 1, 0.3019608, 0, 1,
-1.522947, -0.2405941, 0.1876133, 1, 0.3058824, 0, 1,
-1.512221, 1.436759, -3.181192, 1, 0.3137255, 0, 1,
-1.503927, 1.973313, 0.01602781, 1, 0.3176471, 0, 1,
-1.500217, -1.176423, -1.118305, 1, 0.3254902, 0, 1,
-1.499052, 0.1195156, -2.459039, 1, 0.3294118, 0, 1,
-1.498071, -1.420094, -2.411172, 1, 0.3372549, 0, 1,
-1.494166, -0.9104396, -1.227139, 1, 0.3411765, 0, 1,
-1.488536, -1.54324, -4.244547, 1, 0.3490196, 0, 1,
-1.484472, -0.4479851, -3.374463, 1, 0.3529412, 0, 1,
-1.474282, 0.8844056, -1.932535, 1, 0.3607843, 0, 1,
-1.467761, 0.3731771, -0.8414776, 1, 0.3647059, 0, 1,
-1.459507, 1.748024, -0.8519329, 1, 0.372549, 0, 1,
-1.456532, -0.0586213, 0.6840582, 1, 0.3764706, 0, 1,
-1.441986, 0.1457805, -1.808694, 1, 0.3843137, 0, 1,
-1.434745, -1.770223, -3.049464, 1, 0.3882353, 0, 1,
-1.433049, -0.08150633, -2.566357, 1, 0.3960784, 0, 1,
-1.430776, 2.207665, -0.7171037, 1, 0.4039216, 0, 1,
-1.422372, 2.566801, 1.331457, 1, 0.4078431, 0, 1,
-1.41955, -0.2970051, -1.22442, 1, 0.4156863, 0, 1,
-1.415751, 1.372422, -1.350335, 1, 0.4196078, 0, 1,
-1.413249, -0.732921, -2.726321, 1, 0.427451, 0, 1,
-1.406241, -0.2919438, -1.636475, 1, 0.4313726, 0, 1,
-1.398986, -0.3208996, -1.939803, 1, 0.4392157, 0, 1,
-1.377381, -0.3686095, -1.767656, 1, 0.4431373, 0, 1,
-1.360062, 1.808785, -1.899239, 1, 0.4509804, 0, 1,
-1.358217, 0.582885, 0.07288675, 1, 0.454902, 0, 1,
-1.351339, -0.4964765, -0.9926189, 1, 0.4627451, 0, 1,
-1.341788, -0.178126, -1.466573, 1, 0.4666667, 0, 1,
-1.332268, -0.2121374, -1.854275, 1, 0.4745098, 0, 1,
-1.329772, -0.2439001, -2.201679, 1, 0.4784314, 0, 1,
-1.321706, -0.3916641, -2.127627, 1, 0.4862745, 0, 1,
-1.316264, 0.08681018, -1.223616, 1, 0.4901961, 0, 1,
-1.312105, -0.5045125, -1.272095, 1, 0.4980392, 0, 1,
-1.302467, -0.5909557, -4.387077, 1, 0.5058824, 0, 1,
-1.298543, -1.066906, -1.111888, 1, 0.509804, 0, 1,
-1.275493, -0.6087968, -3.229434, 1, 0.5176471, 0, 1,
-1.274677, -0.4002706, -1.445502, 1, 0.5215687, 0, 1,
-1.271906, 0.3379852, -2.299286, 1, 0.5294118, 0, 1,
-1.256711, -0.6156812, -2.885332, 1, 0.5333334, 0, 1,
-1.254557, -1.648459, -1.655985, 1, 0.5411765, 0, 1,
-1.249788, 0.9085045, -1.023904, 1, 0.5450981, 0, 1,
-1.245616, 0.08503975, -1.185624, 1, 0.5529412, 0, 1,
-1.240825, 1.038796, -0.593545, 1, 0.5568628, 0, 1,
-1.236779, 1.043051, -1.394436, 1, 0.5647059, 0, 1,
-1.234762, 0.9427199, -1.366212, 1, 0.5686275, 0, 1,
-1.233625, -0.6034122, -2.573163, 1, 0.5764706, 0, 1,
-1.214385, 0.09412707, -2.396264, 1, 0.5803922, 0, 1,
-1.207787, -0.7931857, -2.51789, 1, 0.5882353, 0, 1,
-1.204914, 0.2417269, -2.111775, 1, 0.5921569, 0, 1,
-1.203912, 0.1490802, -2.709839, 1, 0.6, 0, 1,
-1.197884, 0.8606235, -1.683527, 1, 0.6078432, 0, 1,
-1.182216, 1.290443, 1.49543, 1, 0.6117647, 0, 1,
-1.167116, -0.4342245, -2.245155, 1, 0.6196079, 0, 1,
-1.164889, -1.298166, -3.042711, 1, 0.6235294, 0, 1,
-1.162862, 0.4047045, -0.9160323, 1, 0.6313726, 0, 1,
-1.159544, 1.3345, 0.5225103, 1, 0.6352941, 0, 1,
-1.15223, 0.8755327, -1.623353, 1, 0.6431373, 0, 1,
-1.15162, 0.8488449, 0.6396715, 1, 0.6470588, 0, 1,
-1.150501, 0.2638822, -1.413122, 1, 0.654902, 0, 1,
-1.149734, -0.5688037, -1.268648, 1, 0.6588235, 0, 1,
-1.145728, -0.1997528, -0.7490143, 1, 0.6666667, 0, 1,
-1.14351, -1.146667, -3.366999, 1, 0.6705883, 0, 1,
-1.141092, -2.577454, -3.729936, 1, 0.6784314, 0, 1,
-1.113575, 0.1020993, -2.403671, 1, 0.682353, 0, 1,
-1.106771, -0.157354, -2.221487, 1, 0.6901961, 0, 1,
-1.093912, 0.2953542, 0.6011976, 1, 0.6941177, 0, 1,
-1.0934, 0.7811098, 0.3875737, 1, 0.7019608, 0, 1,
-1.088234, 1.45926, 0.009806653, 1, 0.7098039, 0, 1,
-1.086582, 0.2175043, -1.020687, 1, 0.7137255, 0, 1,
-1.083599, 0.0784526, -1.879582, 1, 0.7215686, 0, 1,
-1.074551, 0.1778322, -0.4556847, 1, 0.7254902, 0, 1,
-1.071883, 0.245893, -2.064625, 1, 0.7333333, 0, 1,
-1.064667, 0.4880066, -0.40571, 1, 0.7372549, 0, 1,
-1.06282, -0.08742711, -3.63851, 1, 0.7450981, 0, 1,
-1.055624, -1.698744, -3.255783, 1, 0.7490196, 0, 1,
-1.055459, -1.22488, -1.039105, 1, 0.7568628, 0, 1,
-1.053743, 1.566956, 0.6416869, 1, 0.7607843, 0, 1,
-1.053689, 0.1193143, -2.821923, 1, 0.7686275, 0, 1,
-1.052912, 0.1474411, -1.076124, 1, 0.772549, 0, 1,
-1.049522, 0.3308204, -1.8179, 1, 0.7803922, 0, 1,
-1.037079, 0.3273124, -0.4301933, 1, 0.7843137, 0, 1,
-1.035519, 0.6756067, 0.832609, 1, 0.7921569, 0, 1,
-1.030068, 0.807397, -1.460995, 1, 0.7960784, 0, 1,
-1.028372, -0.8029808, -2.135303, 1, 0.8039216, 0, 1,
-1.02778, 1.242441, -2.302932, 1, 0.8117647, 0, 1,
-1.026934, -0.1864672, -2.821479, 1, 0.8156863, 0, 1,
-1.023375, 1.435853, -1.989578, 1, 0.8235294, 0, 1,
-1.018795, -0.2883217, -1.878913, 1, 0.827451, 0, 1,
-1.018292, 0.697194, -1.666792, 1, 0.8352941, 0, 1,
-1.007393, -0.3929736, -1.825853, 1, 0.8392157, 0, 1,
-1.005994, 1.850296, 0.9160803, 1, 0.8470588, 0, 1,
-1.005814, -0.7059727, -3.461765, 1, 0.8509804, 0, 1,
-0.9919219, -0.4580493, -2.299649, 1, 0.8588235, 0, 1,
-0.9907851, -0.4743772, -4.603954, 1, 0.8627451, 0, 1,
-0.990607, 1.029057, -1.623641, 1, 0.8705882, 0, 1,
-0.9862432, -0.6874747, -2.009249, 1, 0.8745098, 0, 1,
-0.9791056, 0.7544693, -0.404553, 1, 0.8823529, 0, 1,
-0.9754278, 0.3950995, -1.785299, 1, 0.8862745, 0, 1,
-0.9743999, 0.3315865, -0.9766444, 1, 0.8941177, 0, 1,
-0.9742898, 2.261866, -1.464475, 1, 0.8980392, 0, 1,
-0.9694089, 1.045659, -0.4606535, 1, 0.9058824, 0, 1,
-0.9604971, -0.2930551, -0.6151214, 1, 0.9137255, 0, 1,
-0.957922, -0.7348111, -4.709677, 1, 0.9176471, 0, 1,
-0.9559395, 0.7617726, -1.101577, 1, 0.9254902, 0, 1,
-0.9553209, -0.2775606, -3.299901, 1, 0.9294118, 0, 1,
-0.9535162, 1.440037, -0.9989967, 1, 0.9372549, 0, 1,
-0.9532481, -1.913278, -3.099984, 1, 0.9411765, 0, 1,
-0.9505205, -0.2030334, -1.646465, 1, 0.9490196, 0, 1,
-0.9471858, 0.07593887, -1.399447, 1, 0.9529412, 0, 1,
-0.9469528, -0.9863802, -2.02185, 1, 0.9607843, 0, 1,
-0.9453521, -0.8300757, -2.961376, 1, 0.9647059, 0, 1,
-0.9444232, -1.964898, -0.3181644, 1, 0.972549, 0, 1,
-0.9443258, 0.9354517, 2.063024, 1, 0.9764706, 0, 1,
-0.9433017, -0.6598989, -0.36963, 1, 0.9843137, 0, 1,
-0.9369636, -0.2174946, -1.502896, 1, 0.9882353, 0, 1,
-0.9345899, 2.014712, -0.2968263, 1, 0.9960784, 0, 1,
-0.9283659, 0.100307, -0.9878963, 0.9960784, 1, 0, 1,
-0.919577, 2.359823, 0.9737964, 0.9921569, 1, 0, 1,
-0.9173428, -1.303922, -2.36592, 0.9843137, 1, 0, 1,
-0.916507, -0.8980278, -2.797951, 0.9803922, 1, 0, 1,
-0.914378, 1.595703, 0.09937107, 0.972549, 1, 0, 1,
-0.9105152, -0.5025055, -0.9256179, 0.9686275, 1, 0, 1,
-0.9077267, 1.466994, -0.7074142, 0.9607843, 1, 0, 1,
-0.9042781, 1.690753, -0.2979474, 0.9568627, 1, 0, 1,
-0.8932956, 0.05932845, -0.8239779, 0.9490196, 1, 0, 1,
-0.8835487, 0.2471669, -1.521606, 0.945098, 1, 0, 1,
-0.8794303, 0.5910602, -1.351389, 0.9372549, 1, 0, 1,
-0.877705, 1.082363, -0.4123757, 0.9333333, 1, 0, 1,
-0.8775029, 1.441968, -3.101813, 0.9254902, 1, 0, 1,
-0.8765351, -0.3603269, -1.823199, 0.9215686, 1, 0, 1,
-0.8765064, -1.779397, -3.810019, 0.9137255, 1, 0, 1,
-0.8759866, 0.4190993, -0.04571625, 0.9098039, 1, 0, 1,
-0.8721574, 2.270555, -0.550549, 0.9019608, 1, 0, 1,
-0.8721266, 0.3293914, -2.051246, 0.8941177, 1, 0, 1,
-0.8615539, -0.06149602, -1.224891, 0.8901961, 1, 0, 1,
-0.8522362, -0.7451997, -3.633692, 0.8823529, 1, 0, 1,
-0.8472271, -0.7843273, -1.427062, 0.8784314, 1, 0, 1,
-0.8429595, 0.9725152, -2.313957, 0.8705882, 1, 0, 1,
-0.8402499, -2.088607, -3.533523, 0.8666667, 1, 0, 1,
-0.8399577, -0.1879135, -0.01468996, 0.8588235, 1, 0, 1,
-0.8335869, -0.9842357, -2.509018, 0.854902, 1, 0, 1,
-0.8283631, 0.605437, -1.232608, 0.8470588, 1, 0, 1,
-0.8280021, -1.088047, -4.127738, 0.8431373, 1, 0, 1,
-0.8274434, 0.08476951, 0.2646801, 0.8352941, 1, 0, 1,
-0.8267702, -0.02059588, -0.6747648, 0.8313726, 1, 0, 1,
-0.8219169, -1.425197, -3.957608, 0.8235294, 1, 0, 1,
-0.8202055, 0.7791513, 0.4780877, 0.8196079, 1, 0, 1,
-0.8188308, 1.113457, -0.009511432, 0.8117647, 1, 0, 1,
-0.8178819, 0.06386947, -0.4496733, 0.8078431, 1, 0, 1,
-0.8155356, 0.1523994, -2.676797, 0.8, 1, 0, 1,
-0.8144628, -0.2428048, -3.137862, 0.7921569, 1, 0, 1,
-0.8113274, 0.9224809, -2.02881, 0.7882353, 1, 0, 1,
-0.8106208, -0.5578184, -1.395182, 0.7803922, 1, 0, 1,
-0.8082318, -1.939828, -3.994528, 0.7764706, 1, 0, 1,
-0.8009063, 0.1253634, -1.388631, 0.7686275, 1, 0, 1,
-0.8004079, -0.4734837, -1.145581, 0.7647059, 1, 0, 1,
-0.7974346, 0.3953359, 0.4098786, 0.7568628, 1, 0, 1,
-0.7962575, -0.7129706, -2.39765, 0.7529412, 1, 0, 1,
-0.7911429, -0.7478186, -1.598641, 0.7450981, 1, 0, 1,
-0.7896094, -0.8284698, -2.006669, 0.7411765, 1, 0, 1,
-0.7828462, 0.3932402, -1.091105, 0.7333333, 1, 0, 1,
-0.7823163, 0.6981602, -2.528311, 0.7294118, 1, 0, 1,
-0.7708591, -0.126639, -0.1292743, 0.7215686, 1, 0, 1,
-0.7669074, -0.3075116, -1.300597, 0.7176471, 1, 0, 1,
-0.7539589, -2.529503, -4.10112, 0.7098039, 1, 0, 1,
-0.7531636, -2.272085, -2.331667, 0.7058824, 1, 0, 1,
-0.751551, 0.7137974, -1.681556, 0.6980392, 1, 0, 1,
-0.7474085, 0.3877469, -2.239246, 0.6901961, 1, 0, 1,
-0.7470669, -0.6341045, -4.970612, 0.6862745, 1, 0, 1,
-0.7463424, -0.3599707, -1.215596, 0.6784314, 1, 0, 1,
-0.7414761, 0.8362488, 0.206138, 0.6745098, 1, 0, 1,
-0.7352905, 1.325331, -1.6883, 0.6666667, 1, 0, 1,
-0.7293277, -1.64884, -3.22259, 0.6627451, 1, 0, 1,
-0.7257392, 0.3584282, 0.04880218, 0.654902, 1, 0, 1,
-0.725153, 0.3517454, -0.3992699, 0.6509804, 1, 0, 1,
-0.706885, 0.2293938, -1.362534, 0.6431373, 1, 0, 1,
-0.706292, -0.9039794, -4.863351, 0.6392157, 1, 0, 1,
-0.696654, 0.2455281, -0.7082511, 0.6313726, 1, 0, 1,
-0.6966131, -0.6902266, -2.546829, 0.627451, 1, 0, 1,
-0.695988, 1.648179, -1.310647, 0.6196079, 1, 0, 1,
-0.6923378, 0.6674061, -0.2054643, 0.6156863, 1, 0, 1,
-0.6892553, 3.170281, -0.5345051, 0.6078432, 1, 0, 1,
-0.6880435, -0.6756212, -2.325277, 0.6039216, 1, 0, 1,
-0.686765, 0.3161484, 0.7889414, 0.5960785, 1, 0, 1,
-0.6817616, 1.561368, 0.189852, 0.5882353, 1, 0, 1,
-0.6782281, 0.781202, -1.674225, 0.5843138, 1, 0, 1,
-0.6770084, -1.51858, -1.877714, 0.5764706, 1, 0, 1,
-0.6734948, 1.984324, -0.2719898, 0.572549, 1, 0, 1,
-0.6721503, 1.310716, 0.4609801, 0.5647059, 1, 0, 1,
-0.6686832, -0.3588079, -2.023572, 0.5607843, 1, 0, 1,
-0.6561547, -0.09183479, -3.313416, 0.5529412, 1, 0, 1,
-0.6489296, 0.03387411, -0.1477672, 0.5490196, 1, 0, 1,
-0.6399205, 0.7456098, -1.713667, 0.5411765, 1, 0, 1,
-0.6381549, 0.4270912, -0.7147156, 0.5372549, 1, 0, 1,
-0.6352532, 0.5499488, -0.07945205, 0.5294118, 1, 0, 1,
-0.6323347, -0.1632116, -3.902159, 0.5254902, 1, 0, 1,
-0.6294037, 0.7483305, -0.4427313, 0.5176471, 1, 0, 1,
-0.6283827, 0.5054032, -0.1638727, 0.5137255, 1, 0, 1,
-0.6267104, 0.2375128, -0.9514953, 0.5058824, 1, 0, 1,
-0.622537, 1.920508, -2.030295, 0.5019608, 1, 0, 1,
-0.612653, 0.7028049, -0.8318305, 0.4941176, 1, 0, 1,
-0.6102478, 0.3917952, -0.1340941, 0.4862745, 1, 0, 1,
-0.6064404, 0.6059949, -0.5077076, 0.4823529, 1, 0, 1,
-0.6011764, -0.4667682, -2.278367, 0.4745098, 1, 0, 1,
-0.5979307, 0.281469, -2.921018, 0.4705882, 1, 0, 1,
-0.596942, -0.4935524, -2.504399, 0.4627451, 1, 0, 1,
-0.5938401, -1.219184, -3.340064, 0.4588235, 1, 0, 1,
-0.5922887, -0.5564229, -3.439323, 0.4509804, 1, 0, 1,
-0.5869487, -2.48047, -3.822902, 0.4470588, 1, 0, 1,
-0.5857031, -1.343678, -3.346877, 0.4392157, 1, 0, 1,
-0.5821117, -0.3929433, -2.743513, 0.4352941, 1, 0, 1,
-0.5783344, -1.891459, -4.005179, 0.427451, 1, 0, 1,
-0.5780048, -0.9770713, -1.961228, 0.4235294, 1, 0, 1,
-0.5765452, -2.252246, -2.106353, 0.4156863, 1, 0, 1,
-0.5750345, 0.8840929, -2.039421, 0.4117647, 1, 0, 1,
-0.5716686, 0.3898324, -1.903349, 0.4039216, 1, 0, 1,
-0.5688371, -0.4005911, -3.128344, 0.3960784, 1, 0, 1,
-0.5681846, -0.9821244, -3.549752, 0.3921569, 1, 0, 1,
-0.5644925, -0.1912523, -2.345328, 0.3843137, 1, 0, 1,
-0.564329, -0.8093522, -1.729897, 0.3803922, 1, 0, 1,
-0.561022, -0.5700092, -3.92991, 0.372549, 1, 0, 1,
-0.560254, 1.088563, 0.6645314, 0.3686275, 1, 0, 1,
-0.5595668, 2.688057, -0.9977197, 0.3607843, 1, 0, 1,
-0.5566794, -0.8122842, -2.079688, 0.3568628, 1, 0, 1,
-0.5548511, 0.08555564, -2.187381, 0.3490196, 1, 0, 1,
-0.5497457, -0.1163347, -0.170192, 0.345098, 1, 0, 1,
-0.5475335, 1.134294, 0.894485, 0.3372549, 1, 0, 1,
-0.5455149, -0.2498298, -1.339443, 0.3333333, 1, 0, 1,
-0.5434016, 0.1842217, -0.2630296, 0.3254902, 1, 0, 1,
-0.5377061, 0.5379759, 0.2637773, 0.3215686, 1, 0, 1,
-0.5364959, -0.7659492, -3.691181, 0.3137255, 1, 0, 1,
-0.5270242, 0.3400916, -1.871107, 0.3098039, 1, 0, 1,
-0.5261965, 0.7272514, 0.2280846, 0.3019608, 1, 0, 1,
-0.524279, -1.002512, -3.286097, 0.2941177, 1, 0, 1,
-0.5211012, 0.6497154, 0.3812183, 0.2901961, 1, 0, 1,
-0.5180629, 0.2566282, -1.20024, 0.282353, 1, 0, 1,
-0.5177833, 2.061569, 0.8795789, 0.2784314, 1, 0, 1,
-0.5129038, 0.291667, -2.382611, 0.2705882, 1, 0, 1,
-0.511764, 1.726127, 0.8941462, 0.2666667, 1, 0, 1,
-0.5115247, -1.552859, -2.57822, 0.2588235, 1, 0, 1,
-0.5113347, 0.1863219, -2.314392, 0.254902, 1, 0, 1,
-0.510364, -0.1158432, -2.056224, 0.2470588, 1, 0, 1,
-0.5093393, -0.07641201, -3.041869, 0.2431373, 1, 0, 1,
-0.5075188, 0.3198593, 0.02310881, 0.2352941, 1, 0, 1,
-0.5071101, 1.194654, -0.8862592, 0.2313726, 1, 0, 1,
-0.503712, 2.250339, -0.7420058, 0.2235294, 1, 0, 1,
-0.5006234, -0.7970939, -3.008461, 0.2196078, 1, 0, 1,
-0.499145, -3.200957, -2.0287, 0.2117647, 1, 0, 1,
-0.4975298, -0.4495721, -0.1973702, 0.2078431, 1, 0, 1,
-0.4953427, 0.6375064, 0.8254924, 0.2, 1, 0, 1,
-0.4937447, -0.7706444, -3.311227, 0.1921569, 1, 0, 1,
-0.4916447, 0.8850964, 0.3887218, 0.1882353, 1, 0, 1,
-0.4889147, 0.6377242, 0.7598118, 0.1803922, 1, 0, 1,
-0.4884761, 1.910058, 1.096819, 0.1764706, 1, 0, 1,
-0.4852613, 0.1907996, -0.08307366, 0.1686275, 1, 0, 1,
-0.4848639, 0.1676975, -2.03408, 0.1647059, 1, 0, 1,
-0.4844385, -0.2484199, -3.164188, 0.1568628, 1, 0, 1,
-0.4836666, -0.6524537, -2.288963, 0.1529412, 1, 0, 1,
-0.4824242, 1.737986, 0.1672568, 0.145098, 1, 0, 1,
-0.4799941, 0.2750805, -1.742581, 0.1411765, 1, 0, 1,
-0.4778081, -1.50376, -2.656441, 0.1333333, 1, 0, 1,
-0.476792, -1.463496, -2.4881, 0.1294118, 1, 0, 1,
-0.4747896, -1.048579, -3.152628, 0.1215686, 1, 0, 1,
-0.4711387, 1.309052, -0.5000122, 0.1176471, 1, 0, 1,
-0.4652945, -0.6154863, -3.491021, 0.1098039, 1, 0, 1,
-0.4637762, -1.057445, -2.027085, 0.1058824, 1, 0, 1,
-0.4610374, -1.148392, -3.500464, 0.09803922, 1, 0, 1,
-0.4591077, -0.3867507, -3.41065, 0.09019608, 1, 0, 1,
-0.4561765, -0.8980471, -2.639689, 0.08627451, 1, 0, 1,
-0.4485573, -0.7026121, -1.989144, 0.07843138, 1, 0, 1,
-0.4436198, 0.5953503, -0.4877878, 0.07450981, 1, 0, 1,
-0.4414851, 0.2777038, -1.854883, 0.06666667, 1, 0, 1,
-0.440112, -0.3198372, -1.643442, 0.0627451, 1, 0, 1,
-0.4399824, 1.001449, 0.2297324, 0.05490196, 1, 0, 1,
-0.4387244, -0.3887255, -2.552592, 0.05098039, 1, 0, 1,
-0.4374316, -1.50168, -2.561666, 0.04313726, 1, 0, 1,
-0.431949, 1.214718, -1.729725, 0.03921569, 1, 0, 1,
-0.4289462, 0.5920281, -0.2507949, 0.03137255, 1, 0, 1,
-0.418477, -0.01440214, -0.810842, 0.02745098, 1, 0, 1,
-0.4134337, 2.186005, -0.8799495, 0.01960784, 1, 0, 1,
-0.408663, 0.2764309, -0.4363923, 0.01568628, 1, 0, 1,
-0.4030709, -0.2376399, -1.486897, 0.007843138, 1, 0, 1,
-0.3927464, -0.6495216, -2.521766, 0.003921569, 1, 0, 1,
-0.3925573, -1.020628, -5.653768, 0, 1, 0.003921569, 1,
-0.3909747, -0.4064626, -0.9680256, 0, 1, 0.01176471, 1,
-0.3824742, -1.258618, -3.280638, 0, 1, 0.01568628, 1,
-0.3787203, -1.433767, -3.000441, 0, 1, 0.02352941, 1,
-0.3749321, -0.6663365, -2.588288, 0, 1, 0.02745098, 1,
-0.3739424, -0.2854036, -0.9278052, 0, 1, 0.03529412, 1,
-0.372882, -1.201307, -3.118732, 0, 1, 0.03921569, 1,
-0.3698555, -0.524259, -3.069504, 0, 1, 0.04705882, 1,
-0.368909, -0.3731934, -2.109589, 0, 1, 0.05098039, 1,
-0.3684927, 0.8068548, 1.360655, 0, 1, 0.05882353, 1,
-0.3610905, 0.2227612, -1.422119, 0, 1, 0.0627451, 1,
-0.3601755, 1.560667, 0.7445207, 0, 1, 0.07058824, 1,
-0.3582287, -0.2448455, -2.295811, 0, 1, 0.07450981, 1,
-0.3556827, 0.4914722, -1.060376, 0, 1, 0.08235294, 1,
-0.3488722, -0.4168275, -1.855186, 0, 1, 0.08627451, 1,
-0.3481708, 0.5553998, -0.1768086, 0, 1, 0.09411765, 1,
-0.3467516, -0.7077005, -3.42318, 0, 1, 0.1019608, 1,
-0.3462714, 1.375993, -0.9790481, 0, 1, 0.1058824, 1,
-0.3455992, -0.3050351, -3.728124, 0, 1, 0.1137255, 1,
-0.342871, 0.8395576, 0.3482995, 0, 1, 0.1176471, 1,
-0.3339606, 0.06988345, -0.510972, 0, 1, 0.1254902, 1,
-0.3339214, 1.320378, -2.442869, 0, 1, 0.1294118, 1,
-0.3314874, -1.196974, -2.463107, 0, 1, 0.1372549, 1,
-0.3260694, 1.328527, -1.880684, 0, 1, 0.1411765, 1,
-0.3254268, 1.341906, -1.137287, 0, 1, 0.1490196, 1,
-0.3228014, -1.078733, -2.548576, 0, 1, 0.1529412, 1,
-0.3220677, -0.7353175, -3.010578, 0, 1, 0.1607843, 1,
-0.3189621, 0.4236122, -1.002658, 0, 1, 0.1647059, 1,
-0.3155345, -0.9860764, -3.479712, 0, 1, 0.172549, 1,
-0.3111474, -0.9723182, -2.531013, 0, 1, 0.1764706, 1,
-0.3111154, -1.141581, -2.520961, 0, 1, 0.1843137, 1,
-0.3101999, 0.8621494, 0.8096831, 0, 1, 0.1882353, 1,
-0.3099969, 0.8958474, -0.9655579, 0, 1, 0.1960784, 1,
-0.3093794, 0.4310319, 1.053721, 0, 1, 0.2039216, 1,
-0.3019163, -0.2920943, -2.994811, 0, 1, 0.2078431, 1,
-0.3010112, -0.8941016, -2.647275, 0, 1, 0.2156863, 1,
-0.3009669, -1.967727, -2.728479, 0, 1, 0.2196078, 1,
-0.2968781, -0.3356671, -2.666697, 0, 1, 0.227451, 1,
-0.2924464, 0.2103504, -1.60752, 0, 1, 0.2313726, 1,
-0.2899398, 0.008287723, -3.275927, 0, 1, 0.2392157, 1,
-0.2879913, -0.8144758, -3.45057, 0, 1, 0.2431373, 1,
-0.2873116, -0.7513577, -2.596838, 0, 1, 0.2509804, 1,
-0.2844462, -0.4964842, -3.039707, 0, 1, 0.254902, 1,
-0.2824614, 1.401288, -0.953965, 0, 1, 0.2627451, 1,
-0.2810478, -0.1955516, -2.824689, 0, 1, 0.2666667, 1,
-0.278411, -1.161855, -2.197547, 0, 1, 0.2745098, 1,
-0.2783227, -0.01632463, -0.920323, 0, 1, 0.2784314, 1,
-0.2745881, 1.969463, 0.4491247, 0, 1, 0.2862745, 1,
-0.2744604, 1.292784, -0.8168261, 0, 1, 0.2901961, 1,
-0.2736234, 0.17254, -1.066874, 0, 1, 0.2980392, 1,
-0.2710021, 0.4902585, 0.5118905, 0, 1, 0.3058824, 1,
-0.2546259, 0.5064039, 0.9681222, 0, 1, 0.3098039, 1,
-0.2531005, 0.8847218, 0.6127205, 0, 1, 0.3176471, 1,
-0.248298, 2.825361, -1.078959, 0, 1, 0.3215686, 1,
-0.2455549, -1.005717, -3.428982, 0, 1, 0.3294118, 1,
-0.2428125, 0.1972165, -0.5537226, 0, 1, 0.3333333, 1,
-0.2420484, -1.298093, -2.310066, 0, 1, 0.3411765, 1,
-0.2374367, -0.9757485, -3.009127, 0, 1, 0.345098, 1,
-0.2360841, -0.7679228, -3.845752, 0, 1, 0.3529412, 1,
-0.2357197, -0.42935, -4.464596, 0, 1, 0.3568628, 1,
-0.2352055, 3.234353, 1.514885, 0, 1, 0.3647059, 1,
-0.2330886, -0.7769766, -1.667656, 0, 1, 0.3686275, 1,
-0.2328211, -2.333862, -2.971223, 0, 1, 0.3764706, 1,
-0.2317799, -1.369673, -3.704283, 0, 1, 0.3803922, 1,
-0.2297316, 0.2458138, 0.2713532, 0, 1, 0.3882353, 1,
-0.2292059, -1.063772, -2.461776, 0, 1, 0.3921569, 1,
-0.2242164, 0.148678, -0.3957521, 0, 1, 0.4, 1,
-0.2211419, -0.7471118, -2.760229, 0, 1, 0.4078431, 1,
-0.2201537, 2.064976, 0.8358594, 0, 1, 0.4117647, 1,
-0.2172591, 0.8764478, 0.1408852, 0, 1, 0.4196078, 1,
-0.2169176, 0.0854933, 0.1042501, 0, 1, 0.4235294, 1,
-0.2153812, -1.560296, -3.376956, 0, 1, 0.4313726, 1,
-0.214467, 1.335653, -0.3124379, 0, 1, 0.4352941, 1,
-0.211411, 0.743247, -0.1868497, 0, 1, 0.4431373, 1,
-0.2033473, -0.3582619, -2.331221, 0, 1, 0.4470588, 1,
-0.2013782, 0.2880052, -1.629871, 0, 1, 0.454902, 1,
-0.2007218, -1.584645, -2.679146, 0, 1, 0.4588235, 1,
-0.2007194, 0.4653516, 0.9386548, 0, 1, 0.4666667, 1,
-0.1991676, 0.1933105, -1.036853, 0, 1, 0.4705882, 1,
-0.1977442, 1.018792, 0.26107, 0, 1, 0.4784314, 1,
-0.1969631, 0.8796604, 0.1146651, 0, 1, 0.4823529, 1,
-0.1945336, 0.3607206, -0.3429832, 0, 1, 0.4901961, 1,
-0.192131, -1.149743, -3.647935, 0, 1, 0.4941176, 1,
-0.1909479, 0.9886933, 0.834508, 0, 1, 0.5019608, 1,
-0.1883739, 1.216863, -0.9263943, 0, 1, 0.509804, 1,
-0.1865516, -1.651308, -1.736814, 0, 1, 0.5137255, 1,
-0.186183, -0.1912586, -3.061287, 0, 1, 0.5215687, 1,
-0.186034, -0.1518773, -1.068692, 0, 1, 0.5254902, 1,
-0.18441, -0.7173641, -4.419028, 0, 1, 0.5333334, 1,
-0.184409, -0.5692837, -2.974012, 0, 1, 0.5372549, 1,
-0.1836548, 1.26403, -1.545924, 0, 1, 0.5450981, 1,
-0.1801609, 1.690097, 1.681078, 0, 1, 0.5490196, 1,
-0.1779312, -0.3371257, -3.758575, 0, 1, 0.5568628, 1,
-0.1729562, 1.361395, 0.4883376, 0, 1, 0.5607843, 1,
-0.1714752, 0.8180187, 1.096119, 0, 1, 0.5686275, 1,
-0.1687275, 0.3847975, -0.8424708, 0, 1, 0.572549, 1,
-0.1657585, 0.5186976, -1.62524, 0, 1, 0.5803922, 1,
-0.1605664, -0.1461518, -0.7235712, 0, 1, 0.5843138, 1,
-0.1584201, -1.170864, -2.621407, 0, 1, 0.5921569, 1,
-0.1565059, -0.1517033, -3.098709, 0, 1, 0.5960785, 1,
-0.1554552, -0.6444809, -3.724876, 0, 1, 0.6039216, 1,
-0.1544997, 0.1615107, -0.8039503, 0, 1, 0.6117647, 1,
-0.1526359, 0.3755154, -1.726621, 0, 1, 0.6156863, 1,
-0.152447, 0.5089924, 0.04633391, 0, 1, 0.6235294, 1,
-0.1510689, -1.421184, -3.083222, 0, 1, 0.627451, 1,
-0.1508032, 0.9000713, -0.5262859, 0, 1, 0.6352941, 1,
-0.1506165, 0.6142784, -0.6897531, 0, 1, 0.6392157, 1,
-0.1487339, -1.062109, -2.695366, 0, 1, 0.6470588, 1,
-0.1485598, -1.514027, -2.051799, 0, 1, 0.6509804, 1,
-0.1445786, 0.966898, -0.0703385, 0, 1, 0.6588235, 1,
-0.1425282, -0.5786508, -3.481385, 0, 1, 0.6627451, 1,
-0.1409198, -0.6046992, -2.093585, 0, 1, 0.6705883, 1,
-0.1386562, -0.796784, -4.588528, 0, 1, 0.6745098, 1,
-0.131768, 0.2129661, 0.2085607, 0, 1, 0.682353, 1,
-0.1304754, -0.9437404, -3.901343, 0, 1, 0.6862745, 1,
-0.1245864, 0.9571082, -0.6403385, 0, 1, 0.6941177, 1,
-0.1224439, -2.105908, -3.713497, 0, 1, 0.7019608, 1,
-0.1194214, 1.484648, -0.9069178, 0, 1, 0.7058824, 1,
-0.1175444, 1.57298, 0.7288885, 0, 1, 0.7137255, 1,
-0.1112446, -0.5812089, -3.229847, 0, 1, 0.7176471, 1,
-0.1023901, 0.6395835, -0.6328911, 0, 1, 0.7254902, 1,
-0.1023771, -1.249835, -3.69238, 0, 1, 0.7294118, 1,
-0.1001449, 1.101133, 0.9086174, 0, 1, 0.7372549, 1,
-0.09382828, -0.3992687, -2.91659, 0, 1, 0.7411765, 1,
-0.09125692, 2.038913, -0.8576095, 0, 1, 0.7490196, 1,
-0.09087685, 0.8228008, 0.9985846, 0, 1, 0.7529412, 1,
-0.08875851, -0.7939244, -2.697927, 0, 1, 0.7607843, 1,
-0.0859227, -0.5613309, -4.005283, 0, 1, 0.7647059, 1,
-0.08388256, -0.6621885, -2.827939, 0, 1, 0.772549, 1,
-0.08193967, -0.9572126, -3.906534, 0, 1, 0.7764706, 1,
-0.07950486, -0.3332907, -2.834697, 0, 1, 0.7843137, 1,
-0.07935983, -0.945048, -3.323437, 0, 1, 0.7882353, 1,
-0.07916273, 0.007441077, -1.635623, 0, 1, 0.7960784, 1,
-0.07641985, -0.4316006, -2.576315, 0, 1, 0.8039216, 1,
-0.07055821, 0.1130372, -2.617732, 0, 1, 0.8078431, 1,
-0.07054268, -0.3840595, -2.582955, 0, 1, 0.8156863, 1,
-0.07021768, -0.06268092, -2.752798, 0, 1, 0.8196079, 1,
-0.06928567, -0.2541658, -4.591738, 0, 1, 0.827451, 1,
-0.06408029, -1.57713, -2.548445, 0, 1, 0.8313726, 1,
-0.06317748, 1.40024, -0.7771276, 0, 1, 0.8392157, 1,
-0.05330821, 0.7730998, 0.399424, 0, 1, 0.8431373, 1,
-0.04999867, 0.3560813, -0.2589799, 0, 1, 0.8509804, 1,
-0.04941681, -0.2620397, -2.978194, 0, 1, 0.854902, 1,
-0.04675455, 0.2349265, 0.3109622, 0, 1, 0.8627451, 1,
-0.04287077, 0.5826225, 0.9480529, 0, 1, 0.8666667, 1,
-0.04176875, -0.7093049, -4.029175, 0, 1, 0.8745098, 1,
-0.04149999, 0.3185553, 0.8396475, 0, 1, 0.8784314, 1,
-0.03261498, 1.069432, -1.315692, 0, 1, 0.8862745, 1,
-0.03199144, -1.073274, -3.96254, 0, 1, 0.8901961, 1,
-0.03169908, 1.25037, -1.309583, 0, 1, 0.8980392, 1,
-0.03024842, -0.3516206, -2.73675, 0, 1, 0.9058824, 1,
-0.02947097, -0.3015693, -2.061142, 0, 1, 0.9098039, 1,
-0.02323104, -0.2866201, -4.40324, 0, 1, 0.9176471, 1,
-0.02067189, 0.5307533, -0.2955164, 0, 1, 0.9215686, 1,
-0.01997764, -0.08749533, -2.953716, 0, 1, 0.9294118, 1,
-0.01906618, -0.7264559, -0.8266618, 0, 1, 0.9333333, 1,
-0.01304137, -1.454869, -3.795887, 0, 1, 0.9411765, 1,
-0.008164228, -1.44943, -4.531137, 0, 1, 0.945098, 1,
-0.005413999, 0.8674255, -0.7991566, 0, 1, 0.9529412, 1,
0.00545269, 0.4263338, -0.4291656, 0, 1, 0.9568627, 1,
0.006094652, 0.5712777, -0.5449702, 0, 1, 0.9647059, 1,
0.006832434, 1.158275, -0.6514542, 0, 1, 0.9686275, 1,
0.00866189, 0.6193547, -3.448027, 0, 1, 0.9764706, 1,
0.01375452, 1.563427, -0.1906224, 0, 1, 0.9803922, 1,
0.01557547, 0.4988903, 0.2088501, 0, 1, 0.9882353, 1,
0.01588578, -0.08732858, 2.155742, 0, 1, 0.9921569, 1,
0.01844842, 0.4068947, -2.672668, 0, 1, 1, 1,
0.01873679, -0.2416237, 3.907925, 0, 0.9921569, 1, 1,
0.02068391, 0.3611582, -1.433606, 0, 0.9882353, 1, 1,
0.02076101, 0.8381619, 0.2773497, 0, 0.9803922, 1, 1,
0.02097888, 0.7414679, -1.510817, 0, 0.9764706, 1, 1,
0.02224669, -0.4696819, 3.283966, 0, 0.9686275, 1, 1,
0.02297687, -1.061812, 2.770743, 0, 0.9647059, 1, 1,
0.02361011, -1.775748, 3.951705, 0, 0.9568627, 1, 1,
0.02536077, -0.1969204, 2.357021, 0, 0.9529412, 1, 1,
0.0264757, 0.195882, 1.121526, 0, 0.945098, 1, 1,
0.02750185, -2.093254, 4.444983, 0, 0.9411765, 1, 1,
0.03347342, -0.4092391, 2.954178, 0, 0.9333333, 1, 1,
0.03570326, -1.427334, 3.689368, 0, 0.9294118, 1, 1,
0.03955548, -1.564882, 3.717122, 0, 0.9215686, 1, 1,
0.04287419, -0.6744642, 4.107998, 0, 0.9176471, 1, 1,
0.04388794, -1.728335, 3.155695, 0, 0.9098039, 1, 1,
0.04430432, -0.3216105, 3.725305, 0, 0.9058824, 1, 1,
0.04486517, 0.7597271, 1.056414, 0, 0.8980392, 1, 1,
0.04622666, -0.3974952, 2.924434, 0, 0.8901961, 1, 1,
0.04897819, 0.9392478, 0.2055539, 0, 0.8862745, 1, 1,
0.05259837, -2.209037, 3.815613, 0, 0.8784314, 1, 1,
0.05626383, -0.05415364, 2.542228, 0, 0.8745098, 1, 1,
0.06105201, -0.9806626, 3.73113, 0, 0.8666667, 1, 1,
0.06147856, 0.1688551, 1.650287, 0, 0.8627451, 1, 1,
0.06710839, -2.154291, 1.916488, 0, 0.854902, 1, 1,
0.06864129, 1.718967, -1.119635, 0, 0.8509804, 1, 1,
0.07188641, 0.0562434, 2.135902, 0, 0.8431373, 1, 1,
0.07350415, -1.132879, 1.905427, 0, 0.8392157, 1, 1,
0.07552017, 0.3029911, -0.2690678, 0, 0.8313726, 1, 1,
0.07717974, -1.375827, 3.914131, 0, 0.827451, 1, 1,
0.08026824, 0.01185651, 0.01912823, 0, 0.8196079, 1, 1,
0.08197192, -0.2004198, 2.583544, 0, 0.8156863, 1, 1,
0.08199898, 2.160284, -1.661687, 0, 0.8078431, 1, 1,
0.08514158, -1.713682, 2.352265, 0, 0.8039216, 1, 1,
0.08635188, 0.1526317, -0.3568957, 0, 0.7960784, 1, 1,
0.09399928, -0.4982999, 2.165051, 0, 0.7882353, 1, 1,
0.09575955, 0.694618, 1.574056, 0, 0.7843137, 1, 1,
0.09707125, -0.1141767, 3.327382, 0, 0.7764706, 1, 1,
0.09847746, -0.2334775, 2.701451, 0, 0.772549, 1, 1,
0.09867519, -0.7359995, 4.280432, 0, 0.7647059, 1, 1,
0.0997034, 0.7673493, -0.1334571, 0, 0.7607843, 1, 1,
0.1027786, -2.218318, 1.013591, 0, 0.7529412, 1, 1,
0.103021, -0.364116, 3.619753, 0, 0.7490196, 1, 1,
0.1074815, -0.9053023, 3.728392, 0, 0.7411765, 1, 1,
0.1077952, 0.5470805, 2.443321, 0, 0.7372549, 1, 1,
0.1105383, -0.731169, 4.489712, 0, 0.7294118, 1, 1,
0.1126438, -1.789041, 2.35254, 0, 0.7254902, 1, 1,
0.1157932, -2.175703, 2.088142, 0, 0.7176471, 1, 1,
0.120031, -0.9368178, 4.069904, 0, 0.7137255, 1, 1,
0.1219164, 1.857339, -0.05115406, 0, 0.7058824, 1, 1,
0.1219384, 1.789014, 0.574002, 0, 0.6980392, 1, 1,
0.1282822, 0.9453568, 0.3651128, 0, 0.6941177, 1, 1,
0.1286308, -1.114181, 2.997188, 0, 0.6862745, 1, 1,
0.1297597, -0.3651561, 4.207533, 0, 0.682353, 1, 1,
0.1346605, 0.1330597, 1.209458, 0, 0.6745098, 1, 1,
0.1348959, 0.01986487, 2.174867, 0, 0.6705883, 1, 1,
0.1389476, 0.5076926, 0.4567201, 0, 0.6627451, 1, 1,
0.1417675, 1.335233, 1.560586, 0, 0.6588235, 1, 1,
0.1451854, -0.7296548, 2.184433, 0, 0.6509804, 1, 1,
0.1459825, -1.597445, 3.311195, 0, 0.6470588, 1, 1,
0.1508065, 1.140062, -2.357295, 0, 0.6392157, 1, 1,
0.154024, 0.364285, -0.5043331, 0, 0.6352941, 1, 1,
0.1540655, -1.492071, 3.457294, 0, 0.627451, 1, 1,
0.1571163, 0.4886869, -1.173454, 0, 0.6235294, 1, 1,
0.1602558, -1.126679, 3.591218, 0, 0.6156863, 1, 1,
0.1604009, 0.9390907, -0.2634376, 0, 0.6117647, 1, 1,
0.16235, 0.03063599, 2.581625, 0, 0.6039216, 1, 1,
0.1640859, 0.1955952, 1.58003, 0, 0.5960785, 1, 1,
0.1644306, 0.0382294, 0.9083552, 0, 0.5921569, 1, 1,
0.1677016, 0.9454584, 1.158352, 0, 0.5843138, 1, 1,
0.1691136, 0.4893466, 2.175334, 0, 0.5803922, 1, 1,
0.1709726, 1.109454, 2.558485, 0, 0.572549, 1, 1,
0.1725217, 0.975561, 0.1139918, 0, 0.5686275, 1, 1,
0.1733258, 0.9255214, 1.492886, 0, 0.5607843, 1, 1,
0.1756349, 0.7570655, 2.214573, 0, 0.5568628, 1, 1,
0.176289, -0.1522429, 2.431522, 0, 0.5490196, 1, 1,
0.1776859, 0.3089623, 0.5029133, 0, 0.5450981, 1, 1,
0.1785025, 0.7604983, 0.09130717, 0, 0.5372549, 1, 1,
0.1800893, -1.61298, 3.773176, 0, 0.5333334, 1, 1,
0.1806159, 0.5245512, -1.907446, 0, 0.5254902, 1, 1,
0.181677, -1.032853, 2.344121, 0, 0.5215687, 1, 1,
0.1837238, 0.2260525, -0.7182568, 0, 0.5137255, 1, 1,
0.1838106, -0.6797165, 3.21296, 0, 0.509804, 1, 1,
0.189398, 0.4071546, 1.148518, 0, 0.5019608, 1, 1,
0.1912296, 0.5269381, 0.8722659, 0, 0.4941176, 1, 1,
0.1934937, -1.481439, 2.000197, 0, 0.4901961, 1, 1,
0.1947058, -0.8273841, 4.578076, 0, 0.4823529, 1, 1,
0.1952679, 0.8731459, 1.225303, 0, 0.4784314, 1, 1,
0.1975379, 0.2989827, 0.9164752, 0, 0.4705882, 1, 1,
0.1995367, -0.7775749, 2.299967, 0, 0.4666667, 1, 1,
0.2003086, -1.03588, 3.320126, 0, 0.4588235, 1, 1,
0.202758, 0.0372886, 0.2887322, 0, 0.454902, 1, 1,
0.2034133, 1.126837, -0.8225766, 0, 0.4470588, 1, 1,
0.2054786, -0.6435127, 3.035545, 0, 0.4431373, 1, 1,
0.2073507, -0.2650554, 2.873421, 0, 0.4352941, 1, 1,
0.2076615, -0.9676753, 0.4818279, 0, 0.4313726, 1, 1,
0.2077689, -1.171906, 2.575358, 0, 0.4235294, 1, 1,
0.2078745, -0.4259265, 2.951132, 0, 0.4196078, 1, 1,
0.209928, 1.336141, -0.3234194, 0, 0.4117647, 1, 1,
0.2118343, 0.1124092, 2.850199, 0, 0.4078431, 1, 1,
0.2146141, -1.097496, 2.898468, 0, 0.4, 1, 1,
0.2150993, 0.9871408, -0.177462, 0, 0.3921569, 1, 1,
0.2160272, 0.5303081, -0.4647994, 0, 0.3882353, 1, 1,
0.2168059, 0.1242211, -0.2351673, 0, 0.3803922, 1, 1,
0.2294873, -0.09303647, 0.4010904, 0, 0.3764706, 1, 1,
0.2321409, -0.2812351, 4.097157, 0, 0.3686275, 1, 1,
0.2328288, 0.4128714, 0.4006636, 0, 0.3647059, 1, 1,
0.2336911, 0.3020568, 2.081721, 0, 0.3568628, 1, 1,
0.2361673, -0.3063794, 3.489113, 0, 0.3529412, 1, 1,
0.2456732, 0.9418983, 0.3331801, 0, 0.345098, 1, 1,
0.2465514, -0.141072, 2.216137, 0, 0.3411765, 1, 1,
0.246604, -1.668374, 2.115525, 0, 0.3333333, 1, 1,
0.2474117, 1.132608, 0.5868272, 0, 0.3294118, 1, 1,
0.2533953, -0.4608264, 1.983891, 0, 0.3215686, 1, 1,
0.2539194, 0.04145629, 0.9361917, 0, 0.3176471, 1, 1,
0.2558706, -1.712296, 2.92715, 0, 0.3098039, 1, 1,
0.2575976, -0.09428371, 0.5857669, 0, 0.3058824, 1, 1,
0.262488, -0.4246706, 3.438742, 0, 0.2980392, 1, 1,
0.2646223, 0.1802534, 0.9713178, 0, 0.2901961, 1, 1,
0.2685261, -0.9644275, 1.431914, 0, 0.2862745, 1, 1,
0.2688195, 1.045298, -0.03029219, 0, 0.2784314, 1, 1,
0.26933, 0.05656426, 0.4756901, 0, 0.2745098, 1, 1,
0.2695656, -1.680951, 1.827965, 0, 0.2666667, 1, 1,
0.2710522, -0.5125619, 2.019601, 0, 0.2627451, 1, 1,
0.2766887, -1.520799, 2.393204, 0, 0.254902, 1, 1,
0.2784598, -1.356311, 0.8526255, 0, 0.2509804, 1, 1,
0.2790974, 1.913012, 0.9651315, 0, 0.2431373, 1, 1,
0.2797153, 0.1625793, 2.13891, 0, 0.2392157, 1, 1,
0.2816795, -0.3560182, 2.670094, 0, 0.2313726, 1, 1,
0.2827852, -0.7213057, 4.954524, 0, 0.227451, 1, 1,
0.2828896, 0.1924026, 1.028304, 0, 0.2196078, 1, 1,
0.2835541, -1.116723, 2.453227, 0, 0.2156863, 1, 1,
0.2921341, 1.369296, 2.708036, 0, 0.2078431, 1, 1,
0.2992132, -0.03884378, 1.792333, 0, 0.2039216, 1, 1,
0.3019916, 0.898495, -0.9787692, 0, 0.1960784, 1, 1,
0.3033094, 0.9807608, 1.934915, 0, 0.1882353, 1, 1,
0.3054045, 0.8130953, -0.208364, 0, 0.1843137, 1, 1,
0.309182, 1.294496, 0.1585379, 0, 0.1764706, 1, 1,
0.3166959, 0.2683007, -0.4214805, 0, 0.172549, 1, 1,
0.3221875, -0.06741533, 2.288209, 0, 0.1647059, 1, 1,
0.3226674, 0.2923147, -0.7111853, 0, 0.1607843, 1, 1,
0.3257166, 1.690533, -0.17663, 0, 0.1529412, 1, 1,
0.3275979, -1.635128, 3.41843, 0, 0.1490196, 1, 1,
0.3316553, 1.730856, 2.086042, 0, 0.1411765, 1, 1,
0.3342188, -0.158645, 3.068023, 0, 0.1372549, 1, 1,
0.3418539, -0.6217167, 2.417428, 0, 0.1294118, 1, 1,
0.3435933, 0.01431309, 2.066134, 0, 0.1254902, 1, 1,
0.3445103, -0.3558566, 4.335082, 0, 0.1176471, 1, 1,
0.3480741, -2.672429, 3.82986, 0, 0.1137255, 1, 1,
0.3502995, -2.122016, 4.081945, 0, 0.1058824, 1, 1,
0.3526163, -0.4478396, 3.643068, 0, 0.09803922, 1, 1,
0.3539589, -0.1259584, 1.523688, 0, 0.09411765, 1, 1,
0.3581672, 1.429369, 1.64237, 0, 0.08627451, 1, 1,
0.3609971, -2.024904, 2.186965, 0, 0.08235294, 1, 1,
0.3635218, -0.5092978, 2.02825, 0, 0.07450981, 1, 1,
0.370844, -1.549952, 3.715517, 0, 0.07058824, 1, 1,
0.3716214, 0.4446214, -0.9140959, 0, 0.0627451, 1, 1,
0.3857879, 0.5895147, 1.083526, 0, 0.05882353, 1, 1,
0.3885893, 1.070552, 0.3037172, 0, 0.05098039, 1, 1,
0.3899764, 0.2197186, 2.482683, 0, 0.04705882, 1, 1,
0.3965119, 0.2902427, 1.42236, 0, 0.03921569, 1, 1,
0.3967327, -0.2215936, 3.513744, 0, 0.03529412, 1, 1,
0.4010688, 1.870327, -0.2490217, 0, 0.02745098, 1, 1,
0.4020042, -0.3555853, 2.828643, 0, 0.02352941, 1, 1,
0.4035972, -0.2476655, 0.5557325, 0, 0.01568628, 1, 1,
0.4111539, -1.416163, 2.286104, 0, 0.01176471, 1, 1,
0.4113965, -0.01825644, 0.863737, 0, 0.003921569, 1, 1,
0.4120907, 0.6217235, 0.5855719, 0.003921569, 0, 1, 1,
0.4127775, 1.176963, 0.9104435, 0.007843138, 0, 1, 1,
0.4161991, -1.699062, 3.564279, 0.01568628, 0, 1, 1,
0.4181285, -1.673346, 2.410684, 0.01960784, 0, 1, 1,
0.4197245, 2.021095, 0.7447743, 0.02745098, 0, 1, 1,
0.421295, 0.6175103, -0.9487188, 0.03137255, 0, 1, 1,
0.424279, -1.55057, 3.54399, 0.03921569, 0, 1, 1,
0.4252974, 1.230582, 0.5898203, 0.04313726, 0, 1, 1,
0.4275123, -1.279974, 3.474729, 0.05098039, 0, 1, 1,
0.4294043, -0.4659634, 2.871386, 0.05490196, 0, 1, 1,
0.4338048, 1.843468, 1.002779, 0.0627451, 0, 1, 1,
0.4340045, -1.109324, 2.00901, 0.06666667, 0, 1, 1,
0.4347501, -0.1926737, 1.602861, 0.07450981, 0, 1, 1,
0.4360444, 0.1350319, 1.016058, 0.07843138, 0, 1, 1,
0.4376586, 0.9717029, -0.05757263, 0.08627451, 0, 1, 1,
0.4378133, 0.8622643, -0.6020464, 0.09019608, 0, 1, 1,
0.4469022, -0.7217459, 1.923606, 0.09803922, 0, 1, 1,
0.446935, -0.03443496, 2.417834, 0.1058824, 0, 1, 1,
0.4497883, -0.3571892, 1.850454, 0.1098039, 0, 1, 1,
0.4583005, -3.467339, 3.046844, 0.1176471, 0, 1, 1,
0.4583589, -0.9647643, 2.166089, 0.1215686, 0, 1, 1,
0.4640214, -1.449191, 4.083655, 0.1294118, 0, 1, 1,
0.4781872, -0.2017744, 2.167151, 0.1333333, 0, 1, 1,
0.4807339, 0.8609502, 0.7522646, 0.1411765, 0, 1, 1,
0.4841595, 1.181177, 0.9391925, 0.145098, 0, 1, 1,
0.4843036, -1.346132, 3.156462, 0.1529412, 0, 1, 1,
0.4864037, 0.4316307, -0.1987173, 0.1568628, 0, 1, 1,
0.4865352, 1.125536, -0.8195928, 0.1647059, 0, 1, 1,
0.4956959, -1.298326, 4.500033, 0.1686275, 0, 1, 1,
0.4972301, 0.05516225, 1.658969, 0.1764706, 0, 1, 1,
0.5026705, -0.9725047, 1.122465, 0.1803922, 0, 1, 1,
0.5040891, 0.1175777, 1.423889, 0.1882353, 0, 1, 1,
0.5051044, 0.9574443, 0.06259168, 0.1921569, 0, 1, 1,
0.5113559, 0.9806368, -1.159497, 0.2, 0, 1, 1,
0.525627, -0.976365, 2.656933, 0.2078431, 0, 1, 1,
0.5319323, 1.39432, 2.566378, 0.2117647, 0, 1, 1,
0.5340485, 0.2879534, 0.8336778, 0.2196078, 0, 1, 1,
0.541251, -1.251288, 3.707197, 0.2235294, 0, 1, 1,
0.5420133, 0.0897348, 2.213039, 0.2313726, 0, 1, 1,
0.5452571, -0.9228313, 2.395678, 0.2352941, 0, 1, 1,
0.5484838, 0.5028279, 1.166223, 0.2431373, 0, 1, 1,
0.5517756, 1.619323, -0.1990112, 0.2470588, 0, 1, 1,
0.5551583, -0.7788348, 3.465596, 0.254902, 0, 1, 1,
0.5562553, -0.335118, 2.921419, 0.2588235, 0, 1, 1,
0.5588003, -1.07592, 3.231492, 0.2666667, 0, 1, 1,
0.5603307, -1.48065, 2.045706, 0.2705882, 0, 1, 1,
0.5632421, -0.4910478, 2.343783, 0.2784314, 0, 1, 1,
0.5690983, 0.1114816, 0.812558, 0.282353, 0, 1, 1,
0.5706902, -0.4467364, 1.757895, 0.2901961, 0, 1, 1,
0.571142, -0.4873424, 2.02215, 0.2941177, 0, 1, 1,
0.5713074, -1.206768, 2.261536, 0.3019608, 0, 1, 1,
0.5719364, 0.8935693, 0.6328043, 0.3098039, 0, 1, 1,
0.5758443, 0.2789752, 0.8156372, 0.3137255, 0, 1, 1,
0.5836479, 0.9353307, 0.438502, 0.3215686, 0, 1, 1,
0.5852158, 0.5012311, 0.2225666, 0.3254902, 0, 1, 1,
0.5914593, 0.2277052, 1.917639, 0.3333333, 0, 1, 1,
0.5956989, 0.467399, -0.5480967, 0.3372549, 0, 1, 1,
0.5962902, 2.296069, -0.2080927, 0.345098, 0, 1, 1,
0.5985114, -0.9536803, 2.680706, 0.3490196, 0, 1, 1,
0.6006843, -0.5105996, 2.489383, 0.3568628, 0, 1, 1,
0.6027515, -1.280439, 3.680662, 0.3607843, 0, 1, 1,
0.605787, -0.3765339, 1.149083, 0.3686275, 0, 1, 1,
0.6063941, 1.202023, 0.7122464, 0.372549, 0, 1, 1,
0.607525, 0.9888235, 0.6871251, 0.3803922, 0, 1, 1,
0.6075535, -0.776805, 3.278483, 0.3843137, 0, 1, 1,
0.6121188, -1.644455, 4.014041, 0.3921569, 0, 1, 1,
0.6344045, 0.307026, 0.06152335, 0.3960784, 0, 1, 1,
0.6369939, -0.7066016, 1.187609, 0.4039216, 0, 1, 1,
0.6374635, -0.7993544, 1.492442, 0.4117647, 0, 1, 1,
0.6386394, 1.857414, 2.25135, 0.4156863, 0, 1, 1,
0.6465316, 1.677583, 0.6371527, 0.4235294, 0, 1, 1,
0.6489826, 1.083887, -0.2690967, 0.427451, 0, 1, 1,
0.6494508, -0.1963451, 0.9225683, 0.4352941, 0, 1, 1,
0.6522856, -1.998366, 3.203984, 0.4392157, 0, 1, 1,
0.6528918, -0.4578195, 2.359321, 0.4470588, 0, 1, 1,
0.6548321, 1.585206, -1.297358, 0.4509804, 0, 1, 1,
0.6573057, -1.107795, 2.664549, 0.4588235, 0, 1, 1,
0.6686672, -0.1953741, 2.53401, 0.4627451, 0, 1, 1,
0.6703254, -0.2915155, 4.115993, 0.4705882, 0, 1, 1,
0.6711481, -0.1427068, 0.5951583, 0.4745098, 0, 1, 1,
0.6717085, -0.1358663, -0.2989187, 0.4823529, 0, 1, 1,
0.674165, -0.2796769, 2.388518, 0.4862745, 0, 1, 1,
0.6767107, -0.8060586, 1.328467, 0.4941176, 0, 1, 1,
0.6774457, -0.614662, 2.962361, 0.5019608, 0, 1, 1,
0.6776825, 1.886849, 1.078761, 0.5058824, 0, 1, 1,
0.6840944, -0.3169043, 1.30813, 0.5137255, 0, 1, 1,
0.6846285, -0.2146187, 2.798138, 0.5176471, 0, 1, 1,
0.6867865, -0.1503803, 3.694107, 0.5254902, 0, 1, 1,
0.6895316, -3.034054, 4.318955, 0.5294118, 0, 1, 1,
0.692946, -0.6188413, 1.719594, 0.5372549, 0, 1, 1,
0.6944488, 0.2049862, 2.177774, 0.5411765, 0, 1, 1,
0.6982579, 1.131058, 0.5416345, 0.5490196, 0, 1, 1,
0.7004631, 0.3951947, 2.444685, 0.5529412, 0, 1, 1,
0.703177, 1.261305, -0.8979878, 0.5607843, 0, 1, 1,
0.7033116, 0.3680103, 1.625218, 0.5647059, 0, 1, 1,
0.7131143, 0.8959779, 0.07003614, 0.572549, 0, 1, 1,
0.7271345, -1.235816, 3.373389, 0.5764706, 0, 1, 1,
0.7282147, -1.325827, 3.409874, 0.5843138, 0, 1, 1,
0.7380419, -0.2461326, 1.959235, 0.5882353, 0, 1, 1,
0.7405317, 0.1518135, 0.1487208, 0.5960785, 0, 1, 1,
0.7486644, -1.083772, 3.510683, 0.6039216, 0, 1, 1,
0.750132, -1.769141, 3.901784, 0.6078432, 0, 1, 1,
0.7502286, 1.229768, 0.7779862, 0.6156863, 0, 1, 1,
0.7513693, -1.308635, 0.0756658, 0.6196079, 0, 1, 1,
0.7520304, -1.217919, 2.072862, 0.627451, 0, 1, 1,
0.7533582, -1.022589, 2.368397, 0.6313726, 0, 1, 1,
0.753665, 1.945082, -0.8344733, 0.6392157, 0, 1, 1,
0.7540236, 0.2977616, 2.222421, 0.6431373, 0, 1, 1,
0.763652, -0.1674291, 0.8724249, 0.6509804, 0, 1, 1,
0.7659481, 0.7114468, 2.857287, 0.654902, 0, 1, 1,
0.7669252, -0.9086684, 1.750863, 0.6627451, 0, 1, 1,
0.7712559, -0.6188884, 3.020506, 0.6666667, 0, 1, 1,
0.7719767, 0.01730773, -1.388649, 0.6745098, 0, 1, 1,
0.7762577, 0.3124781, 1.386805, 0.6784314, 0, 1, 1,
0.7814278, 1.162964, 0.2924391, 0.6862745, 0, 1, 1,
0.7907484, -0.73444, 3.802389, 0.6901961, 0, 1, 1,
0.8022338, 1.282129, 0.4698472, 0.6980392, 0, 1, 1,
0.8152143, -0.7286781, 2.208329, 0.7058824, 0, 1, 1,
0.8156183, 0.7637196, 0.9805098, 0.7098039, 0, 1, 1,
0.8207543, -1.160148, 2.076106, 0.7176471, 0, 1, 1,
0.8289625, 0.3997689, 0.3924881, 0.7215686, 0, 1, 1,
0.830197, -1.228817, 1.209879, 0.7294118, 0, 1, 1,
0.8337824, -0.985998, 2.979778, 0.7333333, 0, 1, 1,
0.8340229, 0.8984557, -0.1728971, 0.7411765, 0, 1, 1,
0.8419832, 0.9933865, -0.4437394, 0.7450981, 0, 1, 1,
0.8510531, 0.285886, 1.817239, 0.7529412, 0, 1, 1,
0.861132, -0.5207065, 4.083029, 0.7568628, 0, 1, 1,
0.8659875, -0.1611505, 2.260266, 0.7647059, 0, 1, 1,
0.8723481, 1.713797, 1.545185, 0.7686275, 0, 1, 1,
0.8784924, 0.8990761, 2.015932, 0.7764706, 0, 1, 1,
0.8819029, 1.901288, 0.3949676, 0.7803922, 0, 1, 1,
0.8827519, 0.4457523, 1.416857, 0.7882353, 0, 1, 1,
0.8830582, -1.363463, 3.314437, 0.7921569, 0, 1, 1,
0.8860692, -0.08163514, 1.386376, 0.8, 0, 1, 1,
0.8865442, 0.09259579, 3.363878, 0.8078431, 0, 1, 1,
0.894852, 1.132564, 1.373338, 0.8117647, 0, 1, 1,
0.9053625, 1.048145, 1.774942, 0.8196079, 0, 1, 1,
0.9160171, -0.09272559, 0.637154, 0.8235294, 0, 1, 1,
0.9163747, -0.5949671, 4.105726, 0.8313726, 0, 1, 1,
0.9194173, -0.01366924, 0.7151945, 0.8352941, 0, 1, 1,
0.9269923, -0.1335717, 1.068471, 0.8431373, 0, 1, 1,
0.9289353, 0.5883448, 1.408214, 0.8470588, 0, 1, 1,
0.9318886, 1.646586, 0.6398779, 0.854902, 0, 1, 1,
0.9357076, -1.363908, 2.569437, 0.8588235, 0, 1, 1,
0.9397459, -0.4572004, 1.809786, 0.8666667, 0, 1, 1,
0.9419266, -1.612459, 3.302445, 0.8705882, 0, 1, 1,
0.949282, -0.6468316, 2.579635, 0.8784314, 0, 1, 1,
0.9515688, -0.4963427, 2.299575, 0.8823529, 0, 1, 1,
0.958502, -0.4895768, 3.399514, 0.8901961, 0, 1, 1,
0.9607244, -1.578339, 1.167875, 0.8941177, 0, 1, 1,
0.9618313, 0.1998917, 2.299128, 0.9019608, 0, 1, 1,
0.9647714, 0.4067381, 1.864252, 0.9098039, 0, 1, 1,
0.9658554, 0.2248729, 1.09704, 0.9137255, 0, 1, 1,
0.9674824, -0.4410079, 2.96145, 0.9215686, 0, 1, 1,
0.9675909, -0.08882304, 2.350279, 0.9254902, 0, 1, 1,
0.9818558, 0.6142706, 1.415381, 0.9333333, 0, 1, 1,
0.9831944, -0.5629548, 1.366156, 0.9372549, 0, 1, 1,
0.9834247, 0.613322, 0.3337834, 0.945098, 0, 1, 1,
0.9858987, 0.4564435, -0.2749762, 0.9490196, 0, 1, 1,
0.9888698, 1.262137, 1.214628, 0.9568627, 0, 1, 1,
0.9889907, -0.4411809, 0.4936108, 0.9607843, 0, 1, 1,
0.9894503, 0.2831864, 1.879427, 0.9686275, 0, 1, 1,
0.9999226, -0.1133249, 2.363686, 0.972549, 0, 1, 1,
1.001983, -0.9381721, 3.328215, 0.9803922, 0, 1, 1,
1.005766, -0.1047397, 0.3600347, 0.9843137, 0, 1, 1,
1.00913, -1.060633, 4.515144, 0.9921569, 0, 1, 1,
1.013368, 0.8461719, -0.5410433, 0.9960784, 0, 1, 1,
1.021336, -0.1700378, 3.26924, 1, 0, 0.9960784, 1,
1.024226, 1.566599, 0.02692697, 1, 0, 0.9882353, 1,
1.026968, -0.4602621, 0.3150622, 1, 0, 0.9843137, 1,
1.032333, 0.6929672, -0.1588657, 1, 0, 0.9764706, 1,
1.032904, -0.6019782, 1.342775, 1, 0, 0.972549, 1,
1.036197, 1.459729, 0.1238801, 1, 0, 0.9647059, 1,
1.042989, 0.6032324, 1.985646, 1, 0, 0.9607843, 1,
1.051546, -0.0381165, 1.163304, 1, 0, 0.9529412, 1,
1.054227, 0.5763348, 1.751922, 1, 0, 0.9490196, 1,
1.061465, 0.1333852, 0.3387317, 1, 0, 0.9411765, 1,
1.062844, 0.4826184, 0.9096739, 1, 0, 0.9372549, 1,
1.064886, -0.8993385, 1.537738, 1, 0, 0.9294118, 1,
1.065998, 0.09034079, 1.206434, 1, 0, 0.9254902, 1,
1.078821, 2.327263, -1.333754, 1, 0, 0.9176471, 1,
1.082847, 0.7616036, 0.6042901, 1, 0, 0.9137255, 1,
1.085669, 1.116988, 1.618329, 1, 0, 0.9058824, 1,
1.087008, 0.8124137, 0.6828344, 1, 0, 0.9019608, 1,
1.089834, 0.2441637, 2.401008, 1, 0, 0.8941177, 1,
1.092755, -0.9732097, 3.300773, 1, 0, 0.8862745, 1,
1.100512, 0.4212741, 0.5447379, 1, 0, 0.8823529, 1,
1.10357, 0.4715088, 1.072032, 1, 0, 0.8745098, 1,
1.107352, -1.48407, 3.978806, 1, 0, 0.8705882, 1,
1.117431, 0.2023037, 0.4118032, 1, 0, 0.8627451, 1,
1.123199, -1.890091, 2.289963, 1, 0, 0.8588235, 1,
1.126319, -0.4900916, 2.632591, 1, 0, 0.8509804, 1,
1.128943, 0.329488, 2.668761, 1, 0, 0.8470588, 1,
1.135493, -0.9467054, 2.646607, 1, 0, 0.8392157, 1,
1.136552, -0.6881234, 1.608892, 1, 0, 0.8352941, 1,
1.1407, 0.6157555, 1.617808, 1, 0, 0.827451, 1,
1.143733, -0.6903473, 3.887743, 1, 0, 0.8235294, 1,
1.144018, -1.588844, 2.462586, 1, 0, 0.8156863, 1,
1.147622, -1.391078, 0.4148466, 1, 0, 0.8117647, 1,
1.148202, -0.2033668, 2.021673, 1, 0, 0.8039216, 1,
1.153306, 2.151066, -0.8876927, 1, 0, 0.7960784, 1,
1.156858, -0.9650116, 1.644574, 1, 0, 0.7921569, 1,
1.158158, 0.3230231, 2.708354, 1, 0, 0.7843137, 1,
1.160129, -0.6802233, 1.969777, 1, 0, 0.7803922, 1,
1.162272, -1.650172, 2.10682, 1, 0, 0.772549, 1,
1.17197, 1.34813, 1.554312, 1, 0, 0.7686275, 1,
1.174966, -2.27941, 1.680444, 1, 0, 0.7607843, 1,
1.17658, -0.7559867, 2.772004, 1, 0, 0.7568628, 1,
1.187837, 1.805568, 1.004827, 1, 0, 0.7490196, 1,
1.192895, -2.234075, 3.281375, 1, 0, 0.7450981, 1,
1.203407, -0.0499518, 2.076309, 1, 0, 0.7372549, 1,
1.205875, 0.7601607, 1.649577, 1, 0, 0.7333333, 1,
1.214591, -0.1758424, 2.432003, 1, 0, 0.7254902, 1,
1.214782, 1.063312, -0.6112347, 1, 0, 0.7215686, 1,
1.215764, -1.347993, 1.736134, 1, 0, 0.7137255, 1,
1.224074, -0.1081328, -0.3743832, 1, 0, 0.7098039, 1,
1.233743, 1.064243, 0.2683678, 1, 0, 0.7019608, 1,
1.240246, -0.4510351, 0.5320134, 1, 0, 0.6941177, 1,
1.241544, -0.2392425, 1.120443, 1, 0, 0.6901961, 1,
1.244984, -1.179255, 0.9017187, 1, 0, 0.682353, 1,
1.248651, 0.8893149, 0.6902504, 1, 0, 0.6784314, 1,
1.250427, -2.419765, 1.76785, 1, 0, 0.6705883, 1,
1.26447, -0.06542184, 0.7187517, 1, 0, 0.6666667, 1,
1.264887, -1.530482, 2.881548, 1, 0, 0.6588235, 1,
1.26695, -0.8383803, 1.930547, 1, 0, 0.654902, 1,
1.279892, 0.6894292, 1.802322, 1, 0, 0.6470588, 1,
1.289057, -1.044989, 1.619819, 1, 0, 0.6431373, 1,
1.289069, -0.524766, 0.4330818, 1, 0, 0.6352941, 1,
1.293276, 1.85835, -1.152761, 1, 0, 0.6313726, 1,
1.30393, 0.0830285, 3.054228, 1, 0, 0.6235294, 1,
1.304338, 1.25807, -0.3766319, 1, 0, 0.6196079, 1,
1.305146, -0.8128996, 2.011342, 1, 0, 0.6117647, 1,
1.308639, -0.562205, 3.916234, 1, 0, 0.6078432, 1,
1.309991, -1.013796, 1.623966, 1, 0, 0.6, 1,
1.310309, -0.401732, 1.529434, 1, 0, 0.5921569, 1,
1.318933, -1.401747, 2.580361, 1, 0, 0.5882353, 1,
1.319067, -1.334445, 2.063082, 1, 0, 0.5803922, 1,
1.324283, -2.268264, 2.869001, 1, 0, 0.5764706, 1,
1.325159, 0.648329, 0.3111824, 1, 0, 0.5686275, 1,
1.333502, 0.366853, 2.304573, 1, 0, 0.5647059, 1,
1.342322, 0.6070226, 1.063378, 1, 0, 0.5568628, 1,
1.346028, 0.01263163, 0.669363, 1, 0, 0.5529412, 1,
1.356267, -0.2958728, 1.875875, 1, 0, 0.5450981, 1,
1.361225, -1.36775, 1.109761, 1, 0, 0.5411765, 1,
1.364256, -1.049392, 1.85709, 1, 0, 0.5333334, 1,
1.367787, 0.4882856, 1.940482, 1, 0, 0.5294118, 1,
1.382562, -1.569115, 1.658225, 1, 0, 0.5215687, 1,
1.383758, 0.6585657, 0.3853911, 1, 0, 0.5176471, 1,
1.415069, 0.7441365, 0.8326993, 1, 0, 0.509804, 1,
1.418251, -0.7441518, 1.302499, 1, 0, 0.5058824, 1,
1.452142, -0.3998496, 1.699776, 1, 0, 0.4980392, 1,
1.453919, -1.756447, 2.384592, 1, 0, 0.4901961, 1,
1.473067, 0.172361, 1.171722, 1, 0, 0.4862745, 1,
1.484226, -0.1588285, 3.819863, 1, 0, 0.4784314, 1,
1.484416, -0.5560164, 0.03383924, 1, 0, 0.4745098, 1,
1.484956, -2.125308, 3.292716, 1, 0, 0.4666667, 1,
1.495198, -0.4533139, 1.985677, 1, 0, 0.4627451, 1,
1.502593, 0.2465635, 2.170196, 1, 0, 0.454902, 1,
1.508181, 0.5696792, 0.5380615, 1, 0, 0.4509804, 1,
1.511233, 0.3486878, 0.571982, 1, 0, 0.4431373, 1,
1.516488, 0.5299495, 0.5016503, 1, 0, 0.4392157, 1,
1.530697, -0.3685664, 1.437097, 1, 0, 0.4313726, 1,
1.542518, 0.5536872, 0.2183255, 1, 0, 0.427451, 1,
1.551798, 0.9154544, -0.3897803, 1, 0, 0.4196078, 1,
1.553544, 0.07743513, 3.968807, 1, 0, 0.4156863, 1,
1.562014, -0.3497402, 3.365131, 1, 0, 0.4078431, 1,
1.56287, 0.5764388, 1.28443, 1, 0, 0.4039216, 1,
1.573609, -0.04659024, 2.01907, 1, 0, 0.3960784, 1,
1.582149, -1.196823, 1.53109, 1, 0, 0.3882353, 1,
1.590425, -0.6389467, 1.875567, 1, 0, 0.3843137, 1,
1.591952, 0.7880275, 0.04334801, 1, 0, 0.3764706, 1,
1.609872, 0.01789184, 3.216577, 1, 0, 0.372549, 1,
1.610363, -0.152655, 0.7908195, 1, 0, 0.3647059, 1,
1.612734, 1.985605, 2.038247, 1, 0, 0.3607843, 1,
1.61567, 1.018164, -0.3026675, 1, 0, 0.3529412, 1,
1.616385, 0.7702162, 1.161359, 1, 0, 0.3490196, 1,
1.637045, 0.6658655, 0.8553776, 1, 0, 0.3411765, 1,
1.638234, -1.1522, 1.603751, 1, 0, 0.3372549, 1,
1.642114, -0.6325985, 1.58687, 1, 0, 0.3294118, 1,
1.650438, 2.338201, 1.922607, 1, 0, 0.3254902, 1,
1.668379, -0.8119289, 3.699751, 1, 0, 0.3176471, 1,
1.676587, 0.2950313, 1.725649, 1, 0, 0.3137255, 1,
1.701443, 0.1480546, 1.459663, 1, 0, 0.3058824, 1,
1.717232, -0.8197836, 1.894486, 1, 0, 0.2980392, 1,
1.724456, -1.401532, 3.51918, 1, 0, 0.2941177, 1,
1.73438, 0.6047257, -0.05055994, 1, 0, 0.2862745, 1,
1.737577, 0.03606225, 0.466405, 1, 0, 0.282353, 1,
1.737893, -0.3366704, 1.783265, 1, 0, 0.2745098, 1,
1.740305, -1.240763, 0.9492821, 1, 0, 0.2705882, 1,
1.743365, 0.4512734, 1.531741, 1, 0, 0.2627451, 1,
1.745514, -0.007669961, 3.065351, 1, 0, 0.2588235, 1,
1.751764, 2.355283, 2.06348, 1, 0, 0.2509804, 1,
1.75376, -0.1084585, 1.2031, 1, 0, 0.2470588, 1,
1.764188, -0.1307263, 0.916824, 1, 0, 0.2392157, 1,
1.773623, 1.16936, 0.4683175, 1, 0, 0.2352941, 1,
1.78978, -0.1177901, 2.203589, 1, 0, 0.227451, 1,
1.797391, 0.6713707, 3.016718, 1, 0, 0.2235294, 1,
1.800007, -1.430091, 3.897365, 1, 0, 0.2156863, 1,
1.810718, -2.432617, 3.801783, 1, 0, 0.2117647, 1,
1.826738, -0.06417124, 0.5897714, 1, 0, 0.2039216, 1,
1.835834, -0.0341743, 1.77971, 1, 0, 0.1960784, 1,
1.839595, 0.2134375, 3.141264, 1, 0, 0.1921569, 1,
1.909473, -1.546109, 2.415515, 1, 0, 0.1843137, 1,
1.911757, -1.445125, 2.007428, 1, 0, 0.1803922, 1,
1.966785, 0.2770213, 2.1747, 1, 0, 0.172549, 1,
1.973257, 0.06116733, 2.115116, 1, 0, 0.1686275, 1,
1.975256, 1.182962, 0.7050341, 1, 0, 0.1607843, 1,
2.001204, -0.9893706, 1.85828, 1, 0, 0.1568628, 1,
2.030342, -0.9388813, 0.9270924, 1, 0, 0.1490196, 1,
2.064922, 1.505913, -0.3104788, 1, 0, 0.145098, 1,
2.097209, -1.107134, 0.5518934, 1, 0, 0.1372549, 1,
2.131521, -0.9268146, 0.8621521, 1, 0, 0.1333333, 1,
2.137429, 0.9264637, 1.8324, 1, 0, 0.1254902, 1,
2.140173, 0.2267513, 1.017174, 1, 0, 0.1215686, 1,
2.216114, 1.362863, 0.41019, 1, 0, 0.1137255, 1,
2.216716, -1.227065, 4.180152, 1, 0, 0.1098039, 1,
2.26828, -2.031271, 2.807277, 1, 0, 0.1019608, 1,
2.297872, -1.743184, 1.555256, 1, 0, 0.09411765, 1,
2.303169, -0.3194031, 3.315225, 1, 0, 0.09019608, 1,
2.346132, -0.1518936, 0.03695033, 1, 0, 0.08235294, 1,
2.348401, -0.3383273, 3.546619, 1, 0, 0.07843138, 1,
2.350339, -0.1497955, 1.021218, 1, 0, 0.07058824, 1,
2.423909, 0.555738, 1.365275, 1, 0, 0.06666667, 1,
2.434237, 1.631611, 1.125341, 1, 0, 0.05882353, 1,
2.481738, -0.5627232, 2.330024, 1, 0, 0.05490196, 1,
2.637172, -0.1249065, 2.866454, 1, 0, 0.04705882, 1,
2.667695, -1.843109, 1.87257, 1, 0, 0.04313726, 1,
2.670114, -0.08926235, 1.666848, 1, 0, 0.03529412, 1,
2.717022, -2.127532, 3.633345, 1, 0, 0.03137255, 1,
2.730496, 0.2258597, 1.040503, 1, 0, 0.02352941, 1,
2.740594, 1.882603, -0.8741131, 1, 0, 0.01960784, 1,
2.810616, 0.9875949, 2.669776, 1, 0, 0.01176471, 1,
3.004597, -0.9935921, 0.7864573, 1, 0, 0.007843138, 1
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
0.2337449, -4.603276, -7.451873, 0, -0.5, 0.5, 0.5,
0.2337449, -4.603276, -7.451873, 1, -0.5, 0.5, 0.5,
0.2337449, -4.603276, -7.451873, 1, 1.5, 0.5, 0.5,
0.2337449, -4.603276, -7.451873, 0, 1.5, 0.5, 0.5
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
-3.476427, -0.1164927, -7.451873, 0, -0.5, 0.5, 0.5,
-3.476427, -0.1164927, -7.451873, 1, -0.5, 0.5, 0.5,
-3.476427, -0.1164927, -7.451873, 1, 1.5, 0.5, 0.5,
-3.476427, -0.1164927, -7.451873, 0, 1.5, 0.5, 0.5
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
-3.476427, -4.603276, -0.3496222, 0, -0.5, 0.5, 0.5,
-3.476427, -4.603276, -0.3496222, 1, -0.5, 0.5, 0.5,
-3.476427, -4.603276, -0.3496222, 1, 1.5, 0.5, 0.5,
-3.476427, -4.603276, -0.3496222, 0, 1.5, 0.5, 0.5
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
-2, -3.567864, -5.812892,
3, -3.567864, -5.812892,
-2, -3.567864, -5.812892,
-2, -3.740433, -6.086056,
-1, -3.567864, -5.812892,
-1, -3.740433, -6.086056,
0, -3.567864, -5.812892,
0, -3.740433, -6.086056,
1, -3.567864, -5.812892,
1, -3.740433, -6.086056,
2, -3.567864, -5.812892,
2, -3.740433, -6.086056,
3, -3.567864, -5.812892,
3, -3.740433, -6.086056
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
-2, -4.08557, -6.632383, 0, -0.5, 0.5, 0.5,
-2, -4.08557, -6.632383, 1, -0.5, 0.5, 0.5,
-2, -4.08557, -6.632383, 1, 1.5, 0.5, 0.5,
-2, -4.08557, -6.632383, 0, 1.5, 0.5, 0.5,
-1, -4.08557, -6.632383, 0, -0.5, 0.5, 0.5,
-1, -4.08557, -6.632383, 1, -0.5, 0.5, 0.5,
-1, -4.08557, -6.632383, 1, 1.5, 0.5, 0.5,
-1, -4.08557, -6.632383, 0, 1.5, 0.5, 0.5,
0, -4.08557, -6.632383, 0, -0.5, 0.5, 0.5,
0, -4.08557, -6.632383, 1, -0.5, 0.5, 0.5,
0, -4.08557, -6.632383, 1, 1.5, 0.5, 0.5,
0, -4.08557, -6.632383, 0, 1.5, 0.5, 0.5,
1, -4.08557, -6.632383, 0, -0.5, 0.5, 0.5,
1, -4.08557, -6.632383, 1, -0.5, 0.5, 0.5,
1, -4.08557, -6.632383, 1, 1.5, 0.5, 0.5,
1, -4.08557, -6.632383, 0, 1.5, 0.5, 0.5,
2, -4.08557, -6.632383, 0, -0.5, 0.5, 0.5,
2, -4.08557, -6.632383, 1, -0.5, 0.5, 0.5,
2, -4.08557, -6.632383, 1, 1.5, 0.5, 0.5,
2, -4.08557, -6.632383, 0, 1.5, 0.5, 0.5,
3, -4.08557, -6.632383, 0, -0.5, 0.5, 0.5,
3, -4.08557, -6.632383, 1, -0.5, 0.5, 0.5,
3, -4.08557, -6.632383, 1, 1.5, 0.5, 0.5,
3, -4.08557, -6.632383, 0, 1.5, 0.5, 0.5
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
-2.620233, -3, -5.812892,
-2.620233, 3, -5.812892,
-2.620233, -3, -5.812892,
-2.762932, -3, -6.086056,
-2.620233, -2, -5.812892,
-2.762932, -2, -6.086056,
-2.620233, -1, -5.812892,
-2.762932, -1, -6.086056,
-2.620233, 0, -5.812892,
-2.762932, 0, -6.086056,
-2.620233, 1, -5.812892,
-2.762932, 1, -6.086056,
-2.620233, 2, -5.812892,
-2.762932, 2, -6.086056,
-2.620233, 3, -5.812892,
-2.762932, 3, -6.086056
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
-3.04833, -3, -6.632383, 0, -0.5, 0.5, 0.5,
-3.04833, -3, -6.632383, 1, -0.5, 0.5, 0.5,
-3.04833, -3, -6.632383, 1, 1.5, 0.5, 0.5,
-3.04833, -3, -6.632383, 0, 1.5, 0.5, 0.5,
-3.04833, -2, -6.632383, 0, -0.5, 0.5, 0.5,
-3.04833, -2, -6.632383, 1, -0.5, 0.5, 0.5,
-3.04833, -2, -6.632383, 1, 1.5, 0.5, 0.5,
-3.04833, -2, -6.632383, 0, 1.5, 0.5, 0.5,
-3.04833, -1, -6.632383, 0, -0.5, 0.5, 0.5,
-3.04833, -1, -6.632383, 1, -0.5, 0.5, 0.5,
-3.04833, -1, -6.632383, 1, 1.5, 0.5, 0.5,
-3.04833, -1, -6.632383, 0, 1.5, 0.5, 0.5,
-3.04833, 0, -6.632383, 0, -0.5, 0.5, 0.5,
-3.04833, 0, -6.632383, 1, -0.5, 0.5, 0.5,
-3.04833, 0, -6.632383, 1, 1.5, 0.5, 0.5,
-3.04833, 0, -6.632383, 0, 1.5, 0.5, 0.5,
-3.04833, 1, -6.632383, 0, -0.5, 0.5, 0.5,
-3.04833, 1, -6.632383, 1, -0.5, 0.5, 0.5,
-3.04833, 1, -6.632383, 1, 1.5, 0.5, 0.5,
-3.04833, 1, -6.632383, 0, 1.5, 0.5, 0.5,
-3.04833, 2, -6.632383, 0, -0.5, 0.5, 0.5,
-3.04833, 2, -6.632383, 1, -0.5, 0.5, 0.5,
-3.04833, 2, -6.632383, 1, 1.5, 0.5, 0.5,
-3.04833, 2, -6.632383, 0, 1.5, 0.5, 0.5,
-3.04833, 3, -6.632383, 0, -0.5, 0.5, 0.5,
-3.04833, 3, -6.632383, 1, -0.5, 0.5, 0.5,
-3.04833, 3, -6.632383, 1, 1.5, 0.5, 0.5,
-3.04833, 3, -6.632383, 0, 1.5, 0.5, 0.5
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
-2.620233, -3.567864, -4,
-2.620233, -3.567864, 4,
-2.620233, -3.567864, -4,
-2.762932, -3.740433, -4,
-2.620233, -3.567864, -2,
-2.762932, -3.740433, -2,
-2.620233, -3.567864, 0,
-2.762932, -3.740433, 0,
-2.620233, -3.567864, 2,
-2.762932, -3.740433, 2,
-2.620233, -3.567864, 4,
-2.762932, -3.740433, 4
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
-3.04833, -4.08557, -4, 0, -0.5, 0.5, 0.5,
-3.04833, -4.08557, -4, 1, -0.5, 0.5, 0.5,
-3.04833, -4.08557, -4, 1, 1.5, 0.5, 0.5,
-3.04833, -4.08557, -4, 0, 1.5, 0.5, 0.5,
-3.04833, -4.08557, -2, 0, -0.5, 0.5, 0.5,
-3.04833, -4.08557, -2, 1, -0.5, 0.5, 0.5,
-3.04833, -4.08557, -2, 1, 1.5, 0.5, 0.5,
-3.04833, -4.08557, -2, 0, 1.5, 0.5, 0.5,
-3.04833, -4.08557, 0, 0, -0.5, 0.5, 0.5,
-3.04833, -4.08557, 0, 1, -0.5, 0.5, 0.5,
-3.04833, -4.08557, 0, 1, 1.5, 0.5, 0.5,
-3.04833, -4.08557, 0, 0, 1.5, 0.5, 0.5,
-3.04833, -4.08557, 2, 0, -0.5, 0.5, 0.5,
-3.04833, -4.08557, 2, 1, -0.5, 0.5, 0.5,
-3.04833, -4.08557, 2, 1, 1.5, 0.5, 0.5,
-3.04833, -4.08557, 2, 0, 1.5, 0.5, 0.5,
-3.04833, -4.08557, 4, 0, -0.5, 0.5, 0.5,
-3.04833, -4.08557, 4, 1, -0.5, 0.5, 0.5,
-3.04833, -4.08557, 4, 1, 1.5, 0.5, 0.5,
-3.04833, -4.08557, 4, 0, 1.5, 0.5, 0.5
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
-2.620233, -3.567864, -5.812892,
-2.620233, 3.334879, -5.812892,
-2.620233, -3.567864, 5.113648,
-2.620233, 3.334879, 5.113648,
-2.620233, -3.567864, -5.812892,
-2.620233, -3.567864, 5.113648,
-2.620233, 3.334879, -5.812892,
-2.620233, 3.334879, 5.113648,
-2.620233, -3.567864, -5.812892,
3.087723, -3.567864, -5.812892,
-2.620233, -3.567864, 5.113648,
3.087723, -3.567864, 5.113648,
-2.620233, 3.334879, -5.812892,
3.087723, 3.334879, -5.812892,
-2.620233, 3.334879, 5.113648,
3.087723, 3.334879, 5.113648,
3.087723, -3.567864, -5.812892,
3.087723, 3.334879, -5.812892,
3.087723, -3.567864, 5.113648,
3.087723, 3.334879, 5.113648,
3.087723, -3.567864, -5.812892,
3.087723, -3.567864, 5.113648,
3.087723, 3.334879, -5.812892,
3.087723, 3.334879, 5.113648
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
var radius = 7.544409;
var distance = 33.56593;
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
mvMatrix.translate( -0.2337449, 0.1164927, 0.3496222 );
mvMatrix.scale( 1.429086, 1.181728, 0.7465458 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.56593);
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
carbamic_acid_isopro<-read.table("carbamic_acid_isopro.xyz", skip=1)
x<-carbamic_acid_isopro$V2
y<-carbamic_acid_isopro$V3
z<-carbamic_acid_isopro$V4
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
4, 6, 2, 0, 0, 1, 1, 1,
3, 5, 1, 1, 0, 0, 1, 1,
2, 4, 1, 1, 0, 0, 1, 1,
1, 4, 1, 1, 0, 0, 1, 1,
3, 3, 1, 1, 0, 0, 1, 1,
2, 1, 1, 1, 0, 0, 1, 1,
3, 2, 1, 0, 0, 0, 1, 1,
1, 1, 1, 0, 0, 0, 1, 1
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
var radius = 5.010738;
var distance = 17.60001;
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
mvMatrix.translate( -2.5, -3.5, -1.5 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -17.60001);
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
for (var i = 0; i < 8; i++) {
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
