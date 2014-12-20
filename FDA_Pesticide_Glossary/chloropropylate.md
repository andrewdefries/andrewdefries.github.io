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
-2.934432, -0.5326071, -1.294074, 1, 0, 0, 1,
-2.923589, 0.09230992, -1.721378, 1, 0.007843138, 0, 1,
-2.693727, 0.8290471, 0.5558716, 1, 0.01176471, 0, 1,
-2.634495, -0.1847109, -2.48341, 1, 0.01960784, 0, 1,
-2.481974, 0.7605753, -1.084738, 1, 0.02352941, 0, 1,
-2.472955, 0.3077559, -0.4426647, 1, 0.03137255, 0, 1,
-2.456473, 0.993028, -1.462105, 1, 0.03529412, 0, 1,
-2.285411, -0.2671113, -1.606665, 1, 0.04313726, 0, 1,
-2.225538, 1.836351, -2.030219, 1, 0.04705882, 0, 1,
-2.210631, 0.4085131, -2.257562, 1, 0.05490196, 0, 1,
-2.196164, 0.105588, -1.38876, 1, 0.05882353, 0, 1,
-2.188641, -1.720566, -2.458117, 1, 0.06666667, 0, 1,
-2.172397, -0.6336344, -0.8220207, 1, 0.07058824, 0, 1,
-2.152244, 0.02504411, -1.204354, 1, 0.07843138, 0, 1,
-2.151828, -0.897089, -2.448806, 1, 0.08235294, 0, 1,
-2.093559, 0.977599, -1.93597, 1, 0.09019608, 0, 1,
-2.085798, -2.612859, -1.47673, 1, 0.09411765, 0, 1,
-2.076947, -1.129657, -2.721847, 1, 0.1019608, 0, 1,
-2.063205, -1.122427, -2.927758, 1, 0.1098039, 0, 1,
-2.05203, -1.573203, -1.285768, 1, 0.1137255, 0, 1,
-2.02578, 0.2019009, -0.9156491, 1, 0.1215686, 0, 1,
-2.015058, 0.2617147, -0.4848039, 1, 0.1254902, 0, 1,
-2.01338, -0.4677809, -2.46233, 1, 0.1333333, 0, 1,
-1.994541, 0.209993, 0.2265609, 1, 0.1372549, 0, 1,
-1.993951, -0.1988224, -1.229994, 1, 0.145098, 0, 1,
-1.98976, 0.05830338, -0.4355863, 1, 0.1490196, 0, 1,
-1.983964, 0.2407505, -1.16964, 1, 0.1568628, 0, 1,
-1.966824, -0.8420656, -1.796678, 1, 0.1607843, 0, 1,
-1.911769, -0.4286933, -3.360262, 1, 0.1686275, 0, 1,
-1.89906, -1.34075, -3.121873, 1, 0.172549, 0, 1,
-1.898413, -2.223285, -2.685569, 1, 0.1803922, 0, 1,
-1.876216, 1.344168, -0.9725594, 1, 0.1843137, 0, 1,
-1.873694, -0.2655165, -1.917684, 1, 0.1921569, 0, 1,
-1.87352, -0.6109924, -1.225448, 1, 0.1960784, 0, 1,
-1.807648, -0.1154758, -1.381514, 1, 0.2039216, 0, 1,
-1.794945, 0.4593458, -2.437707, 1, 0.2117647, 0, 1,
-1.777102, 1.77774, -2.494524, 1, 0.2156863, 0, 1,
-1.755149, -0.3095991, -0.6654071, 1, 0.2235294, 0, 1,
-1.743912, -0.5764475, -0.9547858, 1, 0.227451, 0, 1,
-1.743225, -0.177662, -4.130877, 1, 0.2352941, 0, 1,
-1.727263, -1.030805, -2.343207, 1, 0.2392157, 0, 1,
-1.720175, 0.2925223, -2.670867, 1, 0.2470588, 0, 1,
-1.716553, -2.124897, -3.151277, 1, 0.2509804, 0, 1,
-1.716054, -0.1514566, -1.952651, 1, 0.2588235, 0, 1,
-1.707066, 1.394223, -0.3127774, 1, 0.2627451, 0, 1,
-1.694778, -0.8494924, -3.10068, 1, 0.2705882, 0, 1,
-1.672295, -0.7848381, -2.359673, 1, 0.2745098, 0, 1,
-1.665947, -0.9225131, -3.118709, 1, 0.282353, 0, 1,
-1.663343, -1.741325, -2.411892, 1, 0.2862745, 0, 1,
-1.648606, -0.5546456, -1.157067, 1, 0.2941177, 0, 1,
-1.640894, -2.744121, -2.411677, 1, 0.3019608, 0, 1,
-1.639686, 1.051125, 0.8190225, 1, 0.3058824, 0, 1,
-1.638477, -1.327815, -3.464891, 1, 0.3137255, 0, 1,
-1.635486, -1.835381, -0.7579997, 1, 0.3176471, 0, 1,
-1.630442, 0.6576822, -1.734739, 1, 0.3254902, 0, 1,
-1.622738, 0.4658101, -0.4796299, 1, 0.3294118, 0, 1,
-1.621219, 1.144918, -0.7837238, 1, 0.3372549, 0, 1,
-1.621144, -1.351356, -2.870496, 1, 0.3411765, 0, 1,
-1.611411, 0.438339, -0.3516226, 1, 0.3490196, 0, 1,
-1.6004, -1.960664, -2.506463, 1, 0.3529412, 0, 1,
-1.596657, -1.906012, -2.885204, 1, 0.3607843, 0, 1,
-1.591269, -0.2965508, -1.551609, 1, 0.3647059, 0, 1,
-1.590293, 0.1905656, -0.6477668, 1, 0.372549, 0, 1,
-1.582874, 1.527775, -0.7732831, 1, 0.3764706, 0, 1,
-1.563602, -1.116121, -2.575325, 1, 0.3843137, 0, 1,
-1.559785, -0.7559995, -2.635398, 1, 0.3882353, 0, 1,
-1.547035, 0.1239424, -1.317953, 1, 0.3960784, 0, 1,
-1.542268, 2.821325, -1.169645, 1, 0.4039216, 0, 1,
-1.540044, 0.9200613, -1.858625, 1, 0.4078431, 0, 1,
-1.537242, 0.9881761, -2.746467, 1, 0.4156863, 0, 1,
-1.534153, -0.8382049, -1.694378, 1, 0.4196078, 0, 1,
-1.533579, -1.074675, -2.326375, 1, 0.427451, 0, 1,
-1.53219, 1.316504, -0.9254149, 1, 0.4313726, 0, 1,
-1.524281, -0.6164596, -2.629448, 1, 0.4392157, 0, 1,
-1.519775, 0.1416989, -1.773966, 1, 0.4431373, 0, 1,
-1.513275, 0.213051, -0.4117261, 1, 0.4509804, 0, 1,
-1.495841, 0.8686664, -1.448152, 1, 0.454902, 0, 1,
-1.492901, -1.145692, -1.882943, 1, 0.4627451, 0, 1,
-1.485591, 0.7349934, -0.6718022, 1, 0.4666667, 0, 1,
-1.480955, 0.2679722, -0.7492805, 1, 0.4745098, 0, 1,
-1.468352, 0.8325865, -2.931739, 1, 0.4784314, 0, 1,
-1.467799, 0.5253646, -0.1072726, 1, 0.4862745, 0, 1,
-1.465914, 0.9184592, -2.797239, 1, 0.4901961, 0, 1,
-1.460678, 0.7358654, -2.251266, 1, 0.4980392, 0, 1,
-1.449664, -0.06223512, -1.850265, 1, 0.5058824, 0, 1,
-1.437293, -1.083491, -1.579867, 1, 0.509804, 0, 1,
-1.427376, -2.656304, -2.282671, 1, 0.5176471, 0, 1,
-1.416212, -0.1519285, -2.493876, 1, 0.5215687, 0, 1,
-1.414446, 0.1957836, -2.466419, 1, 0.5294118, 0, 1,
-1.411096, 0.5823869, -0.3617221, 1, 0.5333334, 0, 1,
-1.408428, -2.303178, -2.418436, 1, 0.5411765, 0, 1,
-1.405265, -0.7489411, -0.7101809, 1, 0.5450981, 0, 1,
-1.404054, -0.8096027, -4.59303, 1, 0.5529412, 0, 1,
-1.399974, 0.7821727, -1.157771, 1, 0.5568628, 0, 1,
-1.395237, 0.5651966, -1.298902, 1, 0.5647059, 0, 1,
-1.387794, -1.605839, -3.001997, 1, 0.5686275, 0, 1,
-1.384977, 0.4752574, -0.9533111, 1, 0.5764706, 0, 1,
-1.378418, 0.4083311, -0.9964462, 1, 0.5803922, 0, 1,
-1.378413, -0.9552801, -1.655921, 1, 0.5882353, 0, 1,
-1.37542, -0.2129648, -1.796767, 1, 0.5921569, 0, 1,
-1.367965, -1.494789, -3.057362, 1, 0.6, 0, 1,
-1.359658, -0.06420711, -3.052166, 1, 0.6078432, 0, 1,
-1.346746, -0.5771613, -2.068996, 1, 0.6117647, 0, 1,
-1.343834, 1.192177, -0.5165187, 1, 0.6196079, 0, 1,
-1.339132, -1.24971, -1.156962, 1, 0.6235294, 0, 1,
-1.338931, 0.4131379, -1.293752, 1, 0.6313726, 0, 1,
-1.335592, 1.41605, 0.07694721, 1, 0.6352941, 0, 1,
-1.309164, 0.6450237, -2.364152, 1, 0.6431373, 0, 1,
-1.30455, -0.3847517, -1.888994, 1, 0.6470588, 0, 1,
-1.301307, 0.8579555, -1.52013, 1, 0.654902, 0, 1,
-1.291488, -1.010437, -1.52384, 1, 0.6588235, 0, 1,
-1.281766, 0.8810408, -1.308511, 1, 0.6666667, 0, 1,
-1.267012, -0.5283493, 0.2886299, 1, 0.6705883, 0, 1,
-1.265344, -0.6832818, -2.024306, 1, 0.6784314, 0, 1,
-1.260247, 0.7842659, -2.568471, 1, 0.682353, 0, 1,
-1.25923, 0.1008115, 0.1899118, 1, 0.6901961, 0, 1,
-1.254792, -1.306309, -4.816309, 1, 0.6941177, 0, 1,
-1.250691, 1.551109, -0.8454397, 1, 0.7019608, 0, 1,
-1.242514, 0.5321272, -2.635336, 1, 0.7098039, 0, 1,
-1.232112, 0.09083405, 0.05907115, 1, 0.7137255, 0, 1,
-1.214502, 0.00290926, -1.422161, 1, 0.7215686, 0, 1,
-1.207093, 2.962549, 2.108256, 1, 0.7254902, 0, 1,
-1.202987, -1.930663, -4.781598, 1, 0.7333333, 0, 1,
-1.199364, -0.9252937, -2.568029, 1, 0.7372549, 0, 1,
-1.197871, -2.014014, -3.587888, 1, 0.7450981, 0, 1,
-1.191301, 0.7429656, -2.381155, 1, 0.7490196, 0, 1,
-1.188785, -0.1731439, -0.9539837, 1, 0.7568628, 0, 1,
-1.179563, -1.398387, -0.1803479, 1, 0.7607843, 0, 1,
-1.16628, 0.8141376, -1.018352, 1, 0.7686275, 0, 1,
-1.164254, 0.347141, -0.0471887, 1, 0.772549, 0, 1,
-1.159216, -0.2844046, -2.422987, 1, 0.7803922, 0, 1,
-1.158277, 0.5238718, 0.429258, 1, 0.7843137, 0, 1,
-1.147416, 0.646951, -1.665956, 1, 0.7921569, 0, 1,
-1.135741, -2.08559, -1.794299, 1, 0.7960784, 0, 1,
-1.124522, -0.1041295, 0.1790301, 1, 0.8039216, 0, 1,
-1.123666, -0.6362304, -1.064245, 1, 0.8117647, 0, 1,
-1.118875, 1.082394, -0.5880605, 1, 0.8156863, 0, 1,
-1.099147, -1.694396, -3.071436, 1, 0.8235294, 0, 1,
-1.093605, -0.8168432, -1.28744, 1, 0.827451, 0, 1,
-1.087758, 0.1332088, -2.097637, 1, 0.8352941, 0, 1,
-1.086797, -0.1539142, -2.796052, 1, 0.8392157, 0, 1,
-1.085689, -1.286509, -1.473401, 1, 0.8470588, 0, 1,
-1.083321, 0.6073579, -2.046045, 1, 0.8509804, 0, 1,
-1.076829, 1.336736, -0.8522509, 1, 0.8588235, 0, 1,
-1.07618, 0.3986487, -1.763406, 1, 0.8627451, 0, 1,
-1.072703, -1.04925, -3.184727, 1, 0.8705882, 0, 1,
-1.070921, -0.5242441, -1.338436, 1, 0.8745098, 0, 1,
-1.06541, 0.4414145, -2.046938, 1, 0.8823529, 0, 1,
-1.058516, -1.129827, -1.667, 1, 0.8862745, 0, 1,
-1.05722, 0.1126034, -0.6393473, 1, 0.8941177, 0, 1,
-1.055216, 0.1347023, -3.067881, 1, 0.8980392, 0, 1,
-1.050539, -0.7299106, -5.873209, 1, 0.9058824, 0, 1,
-1.050324, 0.07187574, -1.311682, 1, 0.9137255, 0, 1,
-1.049798, 0.1963603, -2.358526, 1, 0.9176471, 0, 1,
-1.046617, 0.7602318, -0.8203025, 1, 0.9254902, 0, 1,
-1.033566, 0.4511545, -0.5043982, 1, 0.9294118, 0, 1,
-1.032658, 0.4994944, -0.7675484, 1, 0.9372549, 0, 1,
-1.028507, -0.7426853, -0.9690956, 1, 0.9411765, 0, 1,
-1.0259, 0.668847, -0.009649287, 1, 0.9490196, 0, 1,
-1.022171, -2.83865, -1.418956, 1, 0.9529412, 0, 1,
-1.0218, -1.75606, -2.177502, 1, 0.9607843, 0, 1,
-1.021601, 0.0729166, -0.7032273, 1, 0.9647059, 0, 1,
-1.012657, 0.07166497, -2.592333, 1, 0.972549, 0, 1,
-1.010471, 0.8920961, 1.103602, 1, 0.9764706, 0, 1,
-1.010163, -0.911415, -1.317031, 1, 0.9843137, 0, 1,
-1.000482, 0.6581676, -1.355571, 1, 0.9882353, 0, 1,
-0.9968592, 0.4135846, -2.122571, 1, 0.9960784, 0, 1,
-0.9960798, 0.4444236, 1.323236, 0.9960784, 1, 0, 1,
-0.9873232, 1.245962, -1.989196, 0.9921569, 1, 0, 1,
-0.9839178, -0.2491008, -1.224476, 0.9843137, 1, 0, 1,
-0.9754385, -0.9248011, -2.99662, 0.9803922, 1, 0, 1,
-0.9742612, -0.5414349, -0.5695389, 0.972549, 1, 0, 1,
-0.9742028, -1.019889, -1.830622, 0.9686275, 1, 0, 1,
-0.9696218, -0.3334231, -2.71212, 0.9607843, 1, 0, 1,
-0.9686231, -0.543268, -1.183362, 0.9568627, 1, 0, 1,
-0.9679061, 0.1205825, -1.65348, 0.9490196, 1, 0, 1,
-0.9652196, -0.03349344, -1.521258, 0.945098, 1, 0, 1,
-0.9636845, 2.208148, 0.03364398, 0.9372549, 1, 0, 1,
-0.9590703, -0.2364274, -2.210061, 0.9333333, 1, 0, 1,
-0.9570968, -1.425954, -2.060616, 0.9254902, 1, 0, 1,
-0.9569135, 0.1576803, -1.84542, 0.9215686, 1, 0, 1,
-0.9534373, -0.9831311, -2.100956, 0.9137255, 1, 0, 1,
-0.9435263, 0.5819058, -0.2717437, 0.9098039, 1, 0, 1,
-0.9424289, 0.9532606, -0.9031789, 0.9019608, 1, 0, 1,
-0.9423404, -0.8647611, -3.459284, 0.8941177, 1, 0, 1,
-0.9389563, -1.044766, -1.577098, 0.8901961, 1, 0, 1,
-0.9371803, 0.0520032, -0.5853896, 0.8823529, 1, 0, 1,
-0.9349101, 0.5882224, -1.751366, 0.8784314, 1, 0, 1,
-0.9338116, -1.917229, -3.467721, 0.8705882, 1, 0, 1,
-0.9320808, 1.191499, -1.508871, 0.8666667, 1, 0, 1,
-0.9298427, 0.058854, -1.451017, 0.8588235, 1, 0, 1,
-0.9203729, -1.013449, -1.948995, 0.854902, 1, 0, 1,
-0.920001, 0.8008007, 0.2709358, 0.8470588, 1, 0, 1,
-0.9179369, -0.1614019, -2.212603, 0.8431373, 1, 0, 1,
-0.9158248, -0.8549051, -2.170316, 0.8352941, 1, 0, 1,
-0.9116821, -0.125692, -0.4945534, 0.8313726, 1, 0, 1,
-0.9034157, -0.04631925, -1.470726, 0.8235294, 1, 0, 1,
-0.9001526, -0.4028666, -2.693222, 0.8196079, 1, 0, 1,
-0.898948, 1.374189, -0.5535996, 0.8117647, 1, 0, 1,
-0.8968378, -1.542059, -0.6933954, 0.8078431, 1, 0, 1,
-0.8963771, -0.3434902, -2.482333, 0.8, 1, 0, 1,
-0.8951551, -0.01085744, 0.6283211, 0.7921569, 1, 0, 1,
-0.8928719, 1.02957, 0.7609912, 0.7882353, 1, 0, 1,
-0.8919612, 0.9272562, -1.404911, 0.7803922, 1, 0, 1,
-0.8879821, -0.672513, -2.832781, 0.7764706, 1, 0, 1,
-0.8818776, -0.04276938, -2.361559, 0.7686275, 1, 0, 1,
-0.8793517, 0.05056823, -2.102755, 0.7647059, 1, 0, 1,
-0.878174, -0.7949057, -2.428799, 0.7568628, 1, 0, 1,
-0.8760374, -0.8416788, -3.193024, 0.7529412, 1, 0, 1,
-0.8717652, 2.506128, -0.0117554, 0.7450981, 1, 0, 1,
-0.8681848, -2.340089, -1.885528, 0.7411765, 1, 0, 1,
-0.862285, -1.085699, -1.158103, 0.7333333, 1, 0, 1,
-0.8586082, -0.4773133, -1.184715, 0.7294118, 1, 0, 1,
-0.8525769, 1.053624, 1.7877, 0.7215686, 1, 0, 1,
-0.8483515, 1.304673, -0.2629579, 0.7176471, 1, 0, 1,
-0.8352641, -0.2966959, -1.534913, 0.7098039, 1, 0, 1,
-0.8351963, -0.8513994, -0.1260361, 0.7058824, 1, 0, 1,
-0.8342769, -0.5048857, -3.124238, 0.6980392, 1, 0, 1,
-0.8294993, 0.04579329, -2.764344, 0.6901961, 1, 0, 1,
-0.8289412, -0.77887, -3.509533, 0.6862745, 1, 0, 1,
-0.8288897, -1.433005, -2.441933, 0.6784314, 1, 0, 1,
-0.8268502, 0.8015885, -0.301919, 0.6745098, 1, 0, 1,
-0.8265648, 0.6878286, 0.4231333, 0.6666667, 1, 0, 1,
-0.8247368, -0.08782302, -1.959401, 0.6627451, 1, 0, 1,
-0.8229269, -0.07702474, -1.949693, 0.654902, 1, 0, 1,
-0.8227918, 1.0962, -0.1770806, 0.6509804, 1, 0, 1,
-0.8131765, -2.198328, -4.763737, 0.6431373, 1, 0, 1,
-0.8120059, 0.595705, -1.122236, 0.6392157, 1, 0, 1,
-0.8028983, -0.5135416, -2.766004, 0.6313726, 1, 0, 1,
-0.7793615, -0.4637428, -2.69896, 0.627451, 1, 0, 1,
-0.7783029, -2.254219, -1.721135, 0.6196079, 1, 0, 1,
-0.7720222, -1.676265, -3.167588, 0.6156863, 1, 0, 1,
-0.7692558, -0.8378659, -2.538078, 0.6078432, 1, 0, 1,
-0.7604204, -1.589419, -2.354388, 0.6039216, 1, 0, 1,
-0.7582398, -0.394887, -1.164306, 0.5960785, 1, 0, 1,
-0.7573974, 0.07460358, -0.6868148, 0.5882353, 1, 0, 1,
-0.7559888, -1.273874, -2.670441, 0.5843138, 1, 0, 1,
-0.7521707, 0.427698, -1.735068, 0.5764706, 1, 0, 1,
-0.7520105, -0.3937333, -1.93086, 0.572549, 1, 0, 1,
-0.7464669, 0.02007136, -2.959151, 0.5647059, 1, 0, 1,
-0.7423474, 0.04722788, -1.854313, 0.5607843, 1, 0, 1,
-0.7401294, -1.254534, -1.677597, 0.5529412, 1, 0, 1,
-0.7313023, 0.4056792, -0.9747871, 0.5490196, 1, 0, 1,
-0.7230905, 1.156336, -1.469666, 0.5411765, 1, 0, 1,
-0.7216079, 1.243036, 0.4989418, 0.5372549, 1, 0, 1,
-0.7215766, -1.646123, -3.161779, 0.5294118, 1, 0, 1,
-0.7200344, -1.169332, -2.350925, 0.5254902, 1, 0, 1,
-0.7197989, 0.9409943, -1.783956, 0.5176471, 1, 0, 1,
-0.7180867, -0.1287947, -1.967293, 0.5137255, 1, 0, 1,
-0.7157424, -0.2677171, -0.8816684, 0.5058824, 1, 0, 1,
-0.7146806, 0.9360461, -0.9977815, 0.5019608, 1, 0, 1,
-0.7113782, 0.7745829, -1.023509, 0.4941176, 1, 0, 1,
-0.7110859, 0.2955303, -1.431761, 0.4862745, 1, 0, 1,
-0.7102478, -0.511076, -3.328121, 0.4823529, 1, 0, 1,
-0.7069809, 0.3730299, -1.134643, 0.4745098, 1, 0, 1,
-0.7056842, 0.7182499, -0.1205367, 0.4705882, 1, 0, 1,
-0.7020894, -0.2739691, -2.803572, 0.4627451, 1, 0, 1,
-0.6805313, 0.2611703, -3.243307, 0.4588235, 1, 0, 1,
-0.6782216, 0.01407421, -1.216349, 0.4509804, 1, 0, 1,
-0.6778107, -1.70418, -3.788827, 0.4470588, 1, 0, 1,
-0.6771929, 0.5947776, -0.9488888, 0.4392157, 1, 0, 1,
-0.6737421, -0.160138, -2.247653, 0.4352941, 1, 0, 1,
-0.6675184, 1.0305, -1.641905, 0.427451, 1, 0, 1,
-0.6645648, -0.2703661, -1.616088, 0.4235294, 1, 0, 1,
-0.6637055, -1.612248, -4.005685, 0.4156863, 1, 0, 1,
-0.659771, -0.3863501, -2.009581, 0.4117647, 1, 0, 1,
-0.6497737, 0.3629165, -0.918254, 0.4039216, 1, 0, 1,
-0.6430186, 0.1290096, -0.1916327, 0.3960784, 1, 0, 1,
-0.6391128, 1.828427, -0.2693499, 0.3921569, 1, 0, 1,
-0.6391002, 1.044947, -1.103918, 0.3843137, 1, 0, 1,
-0.6372542, 0.387801, -3.096936, 0.3803922, 1, 0, 1,
-0.6365432, 0.2524277, -0.859736, 0.372549, 1, 0, 1,
-0.6311346, -0.523421, -4.175171, 0.3686275, 1, 0, 1,
-0.6281594, -1.570156, -4.444622, 0.3607843, 1, 0, 1,
-0.6264368, 1.61501, -0.4720242, 0.3568628, 1, 0, 1,
-0.6235406, 0.03238273, -2.51173, 0.3490196, 1, 0, 1,
-0.621701, -0.7132176, -1.163106, 0.345098, 1, 0, 1,
-0.6201828, 0.05318572, -0.8929576, 0.3372549, 1, 0, 1,
-0.6185824, -0.4558541, -2.077601, 0.3333333, 1, 0, 1,
-0.6184012, -0.3741682, -0.6252252, 0.3254902, 1, 0, 1,
-0.6161683, 0.7568851, -0.5933471, 0.3215686, 1, 0, 1,
-0.6140099, -0.02949422, -2.707433, 0.3137255, 1, 0, 1,
-0.610076, -0.322762, -2.403967, 0.3098039, 1, 0, 1,
-0.5904438, 1.169926, -0.1546075, 0.3019608, 1, 0, 1,
-0.5877687, -0.4741189, -2.34583, 0.2941177, 1, 0, 1,
-0.5832856, 0.8888114, 2.219585, 0.2901961, 1, 0, 1,
-0.5831401, 0.5008532, -2.224667, 0.282353, 1, 0, 1,
-0.5761018, -0.4035777, -3.532838, 0.2784314, 1, 0, 1,
-0.5759466, -0.4740666, -3.519553, 0.2705882, 1, 0, 1,
-0.5744175, -0.262282, -1.720665, 0.2666667, 1, 0, 1,
-0.5681781, -1.618467, -3.554903, 0.2588235, 1, 0, 1,
-0.5663372, -0.2074822, -2.906048, 0.254902, 1, 0, 1,
-0.5574317, 0.2156274, -0.8993194, 0.2470588, 1, 0, 1,
-0.5558442, 1.410168, -0.3947354, 0.2431373, 1, 0, 1,
-0.5463071, 0.8419809, -1.113557, 0.2352941, 1, 0, 1,
-0.5439398, -0.03666181, -1.542903, 0.2313726, 1, 0, 1,
-0.5425205, -2.153746, -2.855219, 0.2235294, 1, 0, 1,
-0.540895, 0.01394377, -1.562234, 0.2196078, 1, 0, 1,
-0.5349352, 1.131587, -1.569536, 0.2117647, 1, 0, 1,
-0.5340078, -0.1331017, -1.072876, 0.2078431, 1, 0, 1,
-0.5318666, 2.35854, -0.9734123, 0.2, 1, 0, 1,
-0.5307551, 0.765779, -2.359616, 0.1921569, 1, 0, 1,
-0.5287614, 0.8540232, -0.8169391, 0.1882353, 1, 0, 1,
-0.5238919, 0.1317949, -1.182124, 0.1803922, 1, 0, 1,
-0.5227559, 0.6183339, -1.291891, 0.1764706, 1, 0, 1,
-0.5172059, 2.378675, -1.396401, 0.1686275, 1, 0, 1,
-0.5153187, -0.1784234, -0.2954339, 0.1647059, 1, 0, 1,
-0.511418, -0.2068993, -1.921272, 0.1568628, 1, 0, 1,
-0.5084572, -1.330959, -1.715255, 0.1529412, 1, 0, 1,
-0.5005641, -0.4777437, -2.518337, 0.145098, 1, 0, 1,
-0.4952834, 0.186112, -0.5032479, 0.1411765, 1, 0, 1,
-0.49175, -1.126167, -2.287421, 0.1333333, 1, 0, 1,
-0.4911275, -0.6860527, -1.274992, 0.1294118, 1, 0, 1,
-0.4900234, -1.272171, -0.3004433, 0.1215686, 1, 0, 1,
-0.4881115, -0.3778947, -1.487023, 0.1176471, 1, 0, 1,
-0.4851578, -0.001280043, -0.4328062, 0.1098039, 1, 0, 1,
-0.4798759, -1.138583, -3.568345, 0.1058824, 1, 0, 1,
-0.4740974, -0.7597398, -3.384156, 0.09803922, 1, 0, 1,
-0.4715894, -0.8351976, -2.537217, 0.09019608, 1, 0, 1,
-0.4703835, -0.352935, -1.779768, 0.08627451, 1, 0, 1,
-0.4696861, 0.3324763, -1.517292, 0.07843138, 1, 0, 1,
-0.4690142, 0.3941481, 0.4100211, 0.07450981, 1, 0, 1,
-0.4644785, 0.7767243, -1.295392, 0.06666667, 1, 0, 1,
-0.4576128, -0.4848172, -0.8806322, 0.0627451, 1, 0, 1,
-0.455186, 1.184135, -0.2048184, 0.05490196, 1, 0, 1,
-0.4487417, -0.4979125, 0.5632758, 0.05098039, 1, 0, 1,
-0.447423, 0.6962087, -0.4606231, 0.04313726, 1, 0, 1,
-0.4388984, -2.613435, -4.993916, 0.03921569, 1, 0, 1,
-0.4270603, -0.4144117, -2.771882, 0.03137255, 1, 0, 1,
-0.425007, -1.013662, -1.846014, 0.02745098, 1, 0, 1,
-0.4220261, -0.01728695, -0.6859739, 0.01960784, 1, 0, 1,
-0.4210586, -0.7040107, -1.736944, 0.01568628, 1, 0, 1,
-0.4196172, -0.1646782, -0.4418276, 0.007843138, 1, 0, 1,
-0.4178097, 1.773476, 1.463274, 0.003921569, 1, 0, 1,
-0.4114954, -0.215651, -4.320296, 0, 1, 0.003921569, 1,
-0.4089782, 0.4623398, -1.471176, 0, 1, 0.01176471, 1,
-0.4085731, -0.7445233, -3.912843, 0, 1, 0.01568628, 1,
-0.3999516, -1.037649, -1.989709, 0, 1, 0.02352941, 1,
-0.3994094, -0.8089917, -3.196552, 0, 1, 0.02745098, 1,
-0.3890348, -0.3097856, -1.845302, 0, 1, 0.03529412, 1,
-0.3882165, -0.9154024, 0.7682118, 0, 1, 0.03921569, 1,
-0.3873388, 1.804281, -0.5549079, 0, 1, 0.04705882, 1,
-0.3865914, -0.6704515, 0.6961711, 0, 1, 0.05098039, 1,
-0.3819881, 0.4159991, -0.2034608, 0, 1, 0.05882353, 1,
-0.3803887, 0.03567177, -1.069542, 0, 1, 0.0627451, 1,
-0.3727157, -0.8614168, -3.585999, 0, 1, 0.07058824, 1,
-0.372257, 0.07311092, -1.655222, 0, 1, 0.07450981, 1,
-0.3675791, -0.4433552, -2.507435, 0, 1, 0.08235294, 1,
-0.3669347, 0.7446307, -0.09647418, 0, 1, 0.08627451, 1,
-0.3658913, 0.9529688, -0.760412, 0, 1, 0.09411765, 1,
-0.3650072, 0.1031682, -0.8392277, 0, 1, 0.1019608, 1,
-0.3637594, -0.1997154, -2.341526, 0, 1, 0.1058824, 1,
-0.3617707, 3.042665, -0.4499223, 0, 1, 0.1137255, 1,
-0.3578979, -1.271581, -4.114053, 0, 1, 0.1176471, 1,
-0.3569311, -1.527604, -3.20273, 0, 1, 0.1254902, 1,
-0.3566468, -0.4974909, -3.189255, 0, 1, 0.1294118, 1,
-0.3556259, 0.4703736, -0.6345999, 0, 1, 0.1372549, 1,
-0.3524635, 0.53712, 1.447436, 0, 1, 0.1411765, 1,
-0.3499831, 0.401429, -0.8105621, 0, 1, 0.1490196, 1,
-0.3474407, -0.5639622, -1.841406, 0, 1, 0.1529412, 1,
-0.3471387, 1.063992, -0.04912562, 0, 1, 0.1607843, 1,
-0.343834, 0.2901189, 1.041332, 0, 1, 0.1647059, 1,
-0.3433234, -1.700005, -3.002446, 0, 1, 0.172549, 1,
-0.3417917, -0.5480179, -1.767766, 0, 1, 0.1764706, 1,
-0.3381837, 0.7919066, -1.310593, 0, 1, 0.1843137, 1,
-0.3346, -1.644167, -1.850671, 0, 1, 0.1882353, 1,
-0.3331629, 0.7399255, 0.3645578, 0, 1, 0.1960784, 1,
-0.3299217, 1.338272, -0.1761926, 0, 1, 0.2039216, 1,
-0.3280286, 1.02341, 1.929602, 0, 1, 0.2078431, 1,
-0.3245732, -0.3302549, -1.892276, 0, 1, 0.2156863, 1,
-0.3239077, -0.2709277, -1.71962, 0, 1, 0.2196078, 1,
-0.3228728, -0.07230494, -2.383249, 0, 1, 0.227451, 1,
-0.321546, 0.4136546, -2.146702, 0, 1, 0.2313726, 1,
-0.3206389, -0.06796622, -3.451874, 0, 1, 0.2392157, 1,
-0.3205777, 1.048989, -0.9371149, 0, 1, 0.2431373, 1,
-0.3205771, 1.047108, 2.334851, 0, 1, 0.2509804, 1,
-0.315161, -0.0354166, -1.583415, 0, 1, 0.254902, 1,
-0.3117738, 0.2828742, -0.3478192, 0, 1, 0.2627451, 1,
-0.3115378, -1.47084, -3.220448, 0, 1, 0.2666667, 1,
-0.3114989, -0.2778856, -2.40909, 0, 1, 0.2745098, 1,
-0.3097501, -0.2521701, -1.627005, 0, 1, 0.2784314, 1,
-0.30575, 0.4336224, -0.5433836, 0, 1, 0.2862745, 1,
-0.3045533, -0.1275943, -1.887129, 0, 1, 0.2901961, 1,
-0.2973573, -0.3490129, -3.064739, 0, 1, 0.2980392, 1,
-0.2961611, 0.933881, 0.6190032, 0, 1, 0.3058824, 1,
-0.2881667, 0.532933, -1.309199, 0, 1, 0.3098039, 1,
-0.2807153, 0.1330541, -0.975929, 0, 1, 0.3176471, 1,
-0.2803439, -2.238066, -3.526144, 0, 1, 0.3215686, 1,
-0.2799789, -0.5588486, -4.572508, 0, 1, 0.3294118, 1,
-0.27619, -0.2789691, -2.581255, 0, 1, 0.3333333, 1,
-0.2750759, -0.003934733, -2.229072, 0, 1, 0.3411765, 1,
-0.2705746, 0.6700348, -1.081461, 0, 1, 0.345098, 1,
-0.2674178, -0.9579337, -1.400251, 0, 1, 0.3529412, 1,
-0.2645299, -0.2021319, -2.595003, 0, 1, 0.3568628, 1,
-0.2640511, 0.3480773, -1.481889, 0, 1, 0.3647059, 1,
-0.2636952, -0.8770719, -3.241188, 0, 1, 0.3686275, 1,
-0.2621197, -0.1545726, -0.5713611, 0, 1, 0.3764706, 1,
-0.260251, -1.194083, -1.410007, 0, 1, 0.3803922, 1,
-0.2598761, 1.594805, 1.159719, 0, 1, 0.3882353, 1,
-0.2568131, 0.468469, 0.2395508, 0, 1, 0.3921569, 1,
-0.2517959, 0.08014359, 0.108548, 0, 1, 0.4, 1,
-0.2467957, -0.1102728, -1.777696, 0, 1, 0.4078431, 1,
-0.2460666, 1.082758, -0.5407292, 0, 1, 0.4117647, 1,
-0.2449757, 0.3510104, 0.331941, 0, 1, 0.4196078, 1,
-0.2423408, -0.3123877, -1.568444, 0, 1, 0.4235294, 1,
-0.2359909, -0.9808007, -4.248518, 0, 1, 0.4313726, 1,
-0.2351215, -1.472286, -2.571193, 0, 1, 0.4352941, 1,
-0.2347758, -0.04779303, -1.397077, 0, 1, 0.4431373, 1,
-0.2323798, 0.08108453, -0.5031587, 0, 1, 0.4470588, 1,
-0.2299387, 0.4841973, 0.1880019, 0, 1, 0.454902, 1,
-0.2294855, 1.599751, -2.073383, 0, 1, 0.4588235, 1,
-0.2290823, -1.512622, -3.668692, 0, 1, 0.4666667, 1,
-0.2262204, 0.8175268, -0.9142075, 0, 1, 0.4705882, 1,
-0.2199222, -1.237339, -5.564092, 0, 1, 0.4784314, 1,
-0.2184521, 0.7109329, -1.411933, 0, 1, 0.4823529, 1,
-0.2175637, -2.083701, -4.271077, 0, 1, 0.4901961, 1,
-0.2169792, -0.7452414, -2.453244, 0, 1, 0.4941176, 1,
-0.2161123, -0.1667919, -3.546151, 0, 1, 0.5019608, 1,
-0.2120119, 0.8481111, -0.8186777, 0, 1, 0.509804, 1,
-0.2088999, 1.006593, -0.2208603, 0, 1, 0.5137255, 1,
-0.2037508, -0.6608878, -2.21586, 0, 1, 0.5215687, 1,
-0.1992341, -2.367067, -2.00551, 0, 1, 0.5254902, 1,
-0.193703, -0.7496009, -2.189673, 0, 1, 0.5333334, 1,
-0.1931199, -0.3613509, -1.062135, 0, 1, 0.5372549, 1,
-0.1921309, 1.699367, -0.03874284, 0, 1, 0.5450981, 1,
-0.1878658, -0.5238488, -3.379022, 0, 1, 0.5490196, 1,
-0.1841097, -1.629214, -2.22072, 0, 1, 0.5568628, 1,
-0.1820632, -0.4799834, -2.441535, 0, 1, 0.5607843, 1,
-0.181791, -0.359647, -2.599804, 0, 1, 0.5686275, 1,
-0.181473, -0.8426759, -3.337807, 0, 1, 0.572549, 1,
-0.1806812, 0.3058525, -0.5666905, 0, 1, 0.5803922, 1,
-0.1753827, 0.7674195, -0.331406, 0, 1, 0.5843138, 1,
-0.1752502, 1.447616, -1.32888, 0, 1, 0.5921569, 1,
-0.1734464, -0.8650605, -3.718713, 0, 1, 0.5960785, 1,
-0.1729731, -0.8283625, -4.627729, 0, 1, 0.6039216, 1,
-0.1728356, 0.9406799, -0.1064687, 0, 1, 0.6117647, 1,
-0.1724736, -1.070366, -3.036475, 0, 1, 0.6156863, 1,
-0.1723871, -1.311751, -3.153184, 0, 1, 0.6235294, 1,
-0.1717208, -1.713125, -2.096309, 0, 1, 0.627451, 1,
-0.1704979, 0.8822991, -0.367818, 0, 1, 0.6352941, 1,
-0.1640286, 3.355273, -0.6244646, 0, 1, 0.6392157, 1,
-0.1638436, 0.2926898, -0.1514183, 0, 1, 0.6470588, 1,
-0.1505474, 0.3684503, -1.05188, 0, 1, 0.6509804, 1,
-0.150444, -0.8088519, -4.056167, 0, 1, 0.6588235, 1,
-0.1468377, 0.5107954, 0.2219068, 0, 1, 0.6627451, 1,
-0.1444586, 0.03228201, -2.135802, 0, 1, 0.6705883, 1,
-0.1386964, 0.1377213, -2.142829, 0, 1, 0.6745098, 1,
-0.1325367, 0.2992411, 0.5880207, 0, 1, 0.682353, 1,
-0.1313617, 0.08223703, -1.033962, 0, 1, 0.6862745, 1,
-0.1313492, 0.7652364, 0.3951702, 0, 1, 0.6941177, 1,
-0.1236182, -0.4492506, -2.010522, 0, 1, 0.7019608, 1,
-0.122809, -0.5258055, -2.427836, 0, 1, 0.7058824, 1,
-0.108539, 2.198146, -0.3443826, 0, 1, 0.7137255, 1,
-0.1045365, -0.4631135, -2.297871, 0, 1, 0.7176471, 1,
-0.1002393, -0.7478871, -3.049384, 0, 1, 0.7254902, 1,
-0.100151, 0.4699243, -0.7598721, 0, 1, 0.7294118, 1,
-0.09976754, 1.2666, -0.2051837, 0, 1, 0.7372549, 1,
-0.09365468, -1.546839, -2.724489, 0, 1, 0.7411765, 1,
-0.09308476, 0.5327417, 0.9703707, 0, 1, 0.7490196, 1,
-0.0843142, 1.565858, 0.06307504, 0, 1, 0.7529412, 1,
-0.08061354, -0.2390367, -3.352026, 0, 1, 0.7607843, 1,
-0.07867642, 1.798155, -1.86445, 0, 1, 0.7647059, 1,
-0.07475998, -0.2903583, -1.827653, 0, 1, 0.772549, 1,
-0.0730123, 0.367517, -0.2997632, 0, 1, 0.7764706, 1,
-0.07242131, -0.275207, -3.499055, 0, 1, 0.7843137, 1,
-0.07096079, -0.2907205, -4.298631, 0, 1, 0.7882353, 1,
-0.06784456, 0.3904657, 0.2318084, 0, 1, 0.7960784, 1,
-0.06689496, -0.8514994, -2.906296, 0, 1, 0.8039216, 1,
-0.06593949, 0.9035059, -0.211281, 0, 1, 0.8078431, 1,
-0.06385615, -0.2320292, -2.972205, 0, 1, 0.8156863, 1,
-0.05794853, 0.9630662, 1.263725, 0, 1, 0.8196079, 1,
-0.05391447, 0.1532133, 0.07145981, 0, 1, 0.827451, 1,
-0.05050157, -1.487692, -3.793667, 0, 1, 0.8313726, 1,
-0.04484669, 1.583823, -0.1447485, 0, 1, 0.8392157, 1,
-0.04452157, 1.509688, 0.8536743, 0, 1, 0.8431373, 1,
-0.04339406, 0.698373, 0.9591216, 0, 1, 0.8509804, 1,
-0.0379613, -0.6659723, -3.729103, 0, 1, 0.854902, 1,
-0.03525069, 1.29477, -0.4710753, 0, 1, 0.8627451, 1,
-0.03431269, -1.380069, -2.891491, 0, 1, 0.8666667, 1,
-0.03268339, -0.9512146, -3.485524, 0, 1, 0.8745098, 1,
-0.03210839, 0.2205487, 0.04827182, 0, 1, 0.8784314, 1,
-0.03056826, -0.9581045, -2.35993, 0, 1, 0.8862745, 1,
-0.02656541, -0.100573, -2.082785, 0, 1, 0.8901961, 1,
-0.02474345, -0.999121, -1.965005, 0, 1, 0.8980392, 1,
-0.02183627, 0.2761504, -0.8721045, 0, 1, 0.9058824, 1,
-0.01975696, -0.4436045, -3.549705, 0, 1, 0.9098039, 1,
-0.01858531, -0.4319603, -3.367048, 0, 1, 0.9176471, 1,
-0.01315423, 0.6997528, 1.023708, 0, 1, 0.9215686, 1,
-0.006959162, -0.1818503, -2.246903, 0, 1, 0.9294118, 1,
-0.001592102, -0.03399325, -4.068196, 0, 1, 0.9333333, 1,
0.003325448, -0.6793196, 3.36612, 0, 1, 0.9411765, 1,
0.003361848, 0.4066609, -0.4780983, 0, 1, 0.945098, 1,
0.005387401, -0.9807466, 4.388906, 0, 1, 0.9529412, 1,
0.008301095, -1.049852, 2.851878, 0, 1, 0.9568627, 1,
0.01225789, -1.933965, 1.850388, 0, 1, 0.9647059, 1,
0.01328708, -1.276977, 5.174444, 0, 1, 0.9686275, 1,
0.01343124, 0.2464548, 1.261083, 0, 1, 0.9764706, 1,
0.0149801, -0.5704294, 4.213404, 0, 1, 0.9803922, 1,
0.01634327, 1.778002, 1.4842, 0, 1, 0.9882353, 1,
0.01705712, -1.151529, 1.816466, 0, 1, 0.9921569, 1,
0.01739256, 0.00670724, 0.6854219, 0, 1, 1, 1,
0.02306733, -0.3939539, 2.324947, 0, 0.9921569, 1, 1,
0.03230312, 2.338744, 1.60774, 0, 0.9882353, 1, 1,
0.03329866, -1.407177, 2.431603, 0, 0.9803922, 1, 1,
0.03680265, 0.6479821, -1.36569, 0, 0.9764706, 1, 1,
0.03722704, -0.689513, 2.76399, 0, 0.9686275, 1, 1,
0.04654003, 0.6913339, -1.183205, 0, 0.9647059, 1, 1,
0.04940263, -0.8537306, 2.665536, 0, 0.9568627, 1, 1,
0.05090566, 1.427071, -0.04547446, 0, 0.9529412, 1, 1,
0.05322422, 1.712943, 0.3931674, 0, 0.945098, 1, 1,
0.05551528, -0.9000719, 4.945991, 0, 0.9411765, 1, 1,
0.05635056, -1.528327, 3.655856, 0, 0.9333333, 1, 1,
0.05830095, 0.2651316, 0.7678847, 0, 0.9294118, 1, 1,
0.06144897, 0.2183072, -0.9721068, 0, 0.9215686, 1, 1,
0.07045543, 0.7705317, 0.6447917, 0, 0.9176471, 1, 1,
0.07075636, 2.326119, -0.3451273, 0, 0.9098039, 1, 1,
0.07195467, 0.4646504, 1.396234, 0, 0.9058824, 1, 1,
0.08114228, -0.03671375, 2.079677, 0, 0.8980392, 1, 1,
0.08114508, -0.4808649, 3.708631, 0, 0.8901961, 1, 1,
0.08296117, -0.1165686, 2.632172, 0, 0.8862745, 1, 1,
0.08356857, 1.09684, -0.2556931, 0, 0.8784314, 1, 1,
0.08508772, -0.7048569, 3.957799, 0, 0.8745098, 1, 1,
0.08555832, 2.41477, 1.822909, 0, 0.8666667, 1, 1,
0.0857119, -0.140689, 2.00362, 0, 0.8627451, 1, 1,
0.08829226, 0.3589801, 0.918228, 0, 0.854902, 1, 1,
0.09281198, 0.0197939, 1.58122, 0, 0.8509804, 1, 1,
0.09353799, 0.9276621, 1.922062, 0, 0.8431373, 1, 1,
0.09517864, 0.8547474, 0.8011338, 0, 0.8392157, 1, 1,
0.09681984, 0.07325087, 0.3616711, 0, 0.8313726, 1, 1,
0.09835915, 1.701037, -0.2767343, 0, 0.827451, 1, 1,
0.1006809, 0.9339815, -0.1279251, 0, 0.8196079, 1, 1,
0.1101358, -0.5627838, 2.661292, 0, 0.8156863, 1, 1,
0.1144987, -1.806273, 2.22119, 0, 0.8078431, 1, 1,
0.117977, -0.05396105, 2.177205, 0, 0.8039216, 1, 1,
0.121928, 0.346128, 1.720374, 0, 0.7960784, 1, 1,
0.12235, 1.426368, -0.3128691, 0, 0.7882353, 1, 1,
0.1243896, -1.152998, 3.275714, 0, 0.7843137, 1, 1,
0.1256952, -0.1469553, 2.557338, 0, 0.7764706, 1, 1,
0.128307, 0.5849023, -0.9804741, 0, 0.772549, 1, 1,
0.1289949, 0.3599351, -0.7262696, 0, 0.7647059, 1, 1,
0.1299244, -0.7195541, 2.485393, 0, 0.7607843, 1, 1,
0.1329744, 1.053932, -0.4745803, 0, 0.7529412, 1, 1,
0.1330798, -1.531773, 4.322726, 0, 0.7490196, 1, 1,
0.1344606, 0.8263513, -1.411358, 0, 0.7411765, 1, 1,
0.1354615, -0.7433492, 2.327624, 0, 0.7372549, 1, 1,
0.1363757, 1.431724, -0.5916013, 0, 0.7294118, 1, 1,
0.137307, -0.3097459, 2.22843, 0, 0.7254902, 1, 1,
0.1411199, 1.189158, 0.2476057, 0, 0.7176471, 1, 1,
0.1421115, -0.6997324, 3.374673, 0, 0.7137255, 1, 1,
0.1476399, 1.075727, 0.1911575, 0, 0.7058824, 1, 1,
0.1476608, 0.1541079, 1.0811, 0, 0.6980392, 1, 1,
0.1490588, 1.65646, -0.365134, 0, 0.6941177, 1, 1,
0.1496705, -0.4191063, 3.406948, 0, 0.6862745, 1, 1,
0.15052, 0.02754822, 1.824969, 0, 0.682353, 1, 1,
0.1513197, -0.505421, 4.073023, 0, 0.6745098, 1, 1,
0.1523843, -1.759383, 2.730498, 0, 0.6705883, 1, 1,
0.1546309, 1.24003, 0.06777882, 0, 0.6627451, 1, 1,
0.1588022, 0.8269255, 0.7173036, 0, 0.6588235, 1, 1,
0.1609114, 0.09713551, 0.8792636, 0, 0.6509804, 1, 1,
0.1617438, 0.8672942, -0.9759769, 0, 0.6470588, 1, 1,
0.1644982, -0.9243669, 3.637263, 0, 0.6392157, 1, 1,
0.1653278, -0.8691849, 3.192243, 0, 0.6352941, 1, 1,
0.1672353, -0.4645446, 3.259656, 0, 0.627451, 1, 1,
0.1675557, 0.7364847, -0.913197, 0, 0.6235294, 1, 1,
0.1726615, -0.2028073, 2.207661, 0, 0.6156863, 1, 1,
0.1730223, -1.275267, 3.144035, 0, 0.6117647, 1, 1,
0.1731022, 0.1137817, 1.135936, 0, 0.6039216, 1, 1,
0.1732293, -0.4027775, 2.604618, 0, 0.5960785, 1, 1,
0.1755867, -0.1773469, 2.923579, 0, 0.5921569, 1, 1,
0.1757625, -0.9511487, 4.135574, 0, 0.5843138, 1, 1,
0.1806326, 0.1761204, 1.617208, 0, 0.5803922, 1, 1,
0.1838359, -0.740842, 2.797931, 0, 0.572549, 1, 1,
0.1869892, -0.2102332, 2.092702, 0, 0.5686275, 1, 1,
0.1921234, 1.377212, 0.7105877, 0, 0.5607843, 1, 1,
0.1941914, -0.6945548, 2.532055, 0, 0.5568628, 1, 1,
0.2036951, -0.9918041, 3.273501, 0, 0.5490196, 1, 1,
0.2104548, 0.1528477, -2.195528, 0, 0.5450981, 1, 1,
0.2198086, -0.2999541, 2.075741, 0, 0.5372549, 1, 1,
0.2209929, -0.4163026, 2.237922, 0, 0.5333334, 1, 1,
0.2214914, 0.7898382, -1.217565, 0, 0.5254902, 1, 1,
0.2236822, -0.2845022, 3.147855, 0, 0.5215687, 1, 1,
0.2334443, -1.922041, 2.377579, 0, 0.5137255, 1, 1,
0.2349815, 0.2007354, 0.8490231, 0, 0.509804, 1, 1,
0.2350022, 1.81906, -1.36377, 0, 0.5019608, 1, 1,
0.2486852, -1.148498, 2.672628, 0, 0.4941176, 1, 1,
0.2494663, -1.136146, 3.370892, 0, 0.4901961, 1, 1,
0.2496285, 0.7166574, 0.9919751, 0, 0.4823529, 1, 1,
0.2531694, -1.014503, 2.574092, 0, 0.4784314, 1, 1,
0.2539116, -0.8003156, 5.368538, 0, 0.4705882, 1, 1,
0.2554093, -0.1404229, 4.308067, 0, 0.4666667, 1, 1,
0.2571598, 1.384637, 0.7221943, 0, 0.4588235, 1, 1,
0.257976, 2.089303, 2.232049, 0, 0.454902, 1, 1,
0.259458, -0.7194121, 1.410895, 0, 0.4470588, 1, 1,
0.2679591, -0.6846055, 3.509395, 0, 0.4431373, 1, 1,
0.2690896, 1.461554, 1.792604, 0, 0.4352941, 1, 1,
0.2702979, -1.318492, 3.831623, 0, 0.4313726, 1, 1,
0.270595, -0.07475397, 2.715001, 0, 0.4235294, 1, 1,
0.273052, 0.6694818, 1.867758, 0, 0.4196078, 1, 1,
0.2759642, 1.409253, 0.9132899, 0, 0.4117647, 1, 1,
0.2816071, 0.8503579, -0.6310844, 0, 0.4078431, 1, 1,
0.2831716, 0.1289024, 3.380602, 0, 0.4, 1, 1,
0.2839977, -0.5831103, 2.802014, 0, 0.3921569, 1, 1,
0.2890828, -0.4517253, 0.0862424, 0, 0.3882353, 1, 1,
0.2930022, -1.350253, 1.738718, 0, 0.3803922, 1, 1,
0.2942262, 0.7992096, 2.445156, 0, 0.3764706, 1, 1,
0.2950399, 1.547587, 0.8015027, 0, 0.3686275, 1, 1,
0.3002561, 0.3172178, 0.03539846, 0, 0.3647059, 1, 1,
0.300354, 0.2627971, 1.439374, 0, 0.3568628, 1, 1,
0.3025899, -1.100314, 2.240035, 0, 0.3529412, 1, 1,
0.3027625, -0.8902594, 1.727576, 0, 0.345098, 1, 1,
0.3068726, -1.126031, 3.621691, 0, 0.3411765, 1, 1,
0.309569, -0.405438, 2.52468, 0, 0.3333333, 1, 1,
0.311267, 0.8676776, 1.211945, 0, 0.3294118, 1, 1,
0.3160309, -1.782328, 2.632101, 0, 0.3215686, 1, 1,
0.3217351, -1.144907, 1.376591, 0, 0.3176471, 1, 1,
0.3251444, 0.05350147, 1.470654, 0, 0.3098039, 1, 1,
0.3347459, 0.5240629, -1.250652, 0, 0.3058824, 1, 1,
0.3355597, 0.8559854, 0.5990391, 0, 0.2980392, 1, 1,
0.3520719, -0.9711829, 2.912009, 0, 0.2901961, 1, 1,
0.3567162, -1.23672, 1.401369, 0, 0.2862745, 1, 1,
0.3582045, 1.085495, 0.2988829, 0, 0.2784314, 1, 1,
0.3587382, -1.040145, 3.284019, 0, 0.2745098, 1, 1,
0.3646445, -1.703425, 1.982726, 0, 0.2666667, 1, 1,
0.3680436, -0.5366904, 1.736546, 0, 0.2627451, 1, 1,
0.3688575, -0.7288543, 0.8581188, 0, 0.254902, 1, 1,
0.3691278, -1.031465, 2.376349, 0, 0.2509804, 1, 1,
0.3701261, -0.6198315, 3.127759, 0, 0.2431373, 1, 1,
0.373062, -0.04513696, 2.180282, 0, 0.2392157, 1, 1,
0.3766517, 0.941754, 0.08865353, 0, 0.2313726, 1, 1,
0.3781092, 0.156516, 1.663238, 0, 0.227451, 1, 1,
0.3781235, -0.08472569, 1.687452, 0, 0.2196078, 1, 1,
0.3788739, 0.01972436, 0.4453627, 0, 0.2156863, 1, 1,
0.3804125, 1.445353, 0.7827151, 0, 0.2078431, 1, 1,
0.3842488, 0.01148808, 1.28668, 0, 0.2039216, 1, 1,
0.3867252, -1.251188, 1.553812, 0, 0.1960784, 1, 1,
0.3883656, -0.205354, 5.236474, 0, 0.1882353, 1, 1,
0.3917222, 1.021349, -0.7387986, 0, 0.1843137, 1, 1,
0.3928365, 0.3132435, 0.656355, 0, 0.1764706, 1, 1,
0.3932811, -0.5881717, 2.191662, 0, 0.172549, 1, 1,
0.4045418, -0.7935623, 1.369985, 0, 0.1647059, 1, 1,
0.4089168, 0.3629036, -1.25141, 0, 0.1607843, 1, 1,
0.4132062, -0.7463402, 1.342959, 0, 0.1529412, 1, 1,
0.41616, -1.857588, 2.499503, 0, 0.1490196, 1, 1,
0.4243741, 0.7064046, 1.02134, 0, 0.1411765, 1, 1,
0.4246067, -0.4601023, 1.478787, 0, 0.1372549, 1, 1,
0.4258032, 0.6398694, -0.07004866, 0, 0.1294118, 1, 1,
0.428147, -0.254661, 2.682054, 0, 0.1254902, 1, 1,
0.4315499, -0.5157888, -0.252946, 0, 0.1176471, 1, 1,
0.4317407, -1.686412, 3.020187, 0, 0.1137255, 1, 1,
0.4322741, -0.7723215, 2.885208, 0, 0.1058824, 1, 1,
0.4328638, -1.147203, 2.330316, 0, 0.09803922, 1, 1,
0.4333032, -1.027429, 0.9739414, 0, 0.09411765, 1, 1,
0.4363434, 0.8635899, 1.545452, 0, 0.08627451, 1, 1,
0.437043, -1.283831, 2.156036, 0, 0.08235294, 1, 1,
0.4377834, -0.0106228, 1.927102, 0, 0.07450981, 1, 1,
0.4389932, -0.1409896, 3.150801, 0, 0.07058824, 1, 1,
0.4449644, 0.4769115, -0.218776, 0, 0.0627451, 1, 1,
0.4469121, -1.328401, 3.160606, 0, 0.05882353, 1, 1,
0.4495365, -0.4300932, 1.845588, 0, 0.05098039, 1, 1,
0.4506898, -0.9672751, 2.008292, 0, 0.04705882, 1, 1,
0.4527113, -1.700695, 3.316654, 0, 0.03921569, 1, 1,
0.4542155, 0.9280794, -0.2526976, 0, 0.03529412, 1, 1,
0.455411, 1.787968, 2.208768, 0, 0.02745098, 1, 1,
0.4563112, 0.4506366, 0.6802972, 0, 0.02352941, 1, 1,
0.4576473, -0.19957, 1.162303, 0, 0.01568628, 1, 1,
0.4618328, 0.2211098, 1.34353, 0, 0.01176471, 1, 1,
0.463803, 1.184645, 0.4360451, 0, 0.003921569, 1, 1,
0.4671299, 0.2797075, -0.4864053, 0.003921569, 0, 1, 1,
0.4673878, -0.06735007, 2.03452, 0.007843138, 0, 1, 1,
0.4716797, -0.4037806, 1.498883, 0.01568628, 0, 1, 1,
0.4721777, -0.4310104, 1.936994, 0.01960784, 0, 1, 1,
0.4746281, -0.3324995, 2.935187, 0.02745098, 0, 1, 1,
0.4777989, -1.896425, 2.062167, 0.03137255, 0, 1, 1,
0.478264, 0.7146057, 1.012236, 0.03921569, 0, 1, 1,
0.4818797, -0.539427, 1.123042, 0.04313726, 0, 1, 1,
0.4837814, -0.2145476, 1.05389, 0.05098039, 0, 1, 1,
0.4879151, -0.7151664, 2.108003, 0.05490196, 0, 1, 1,
0.4970773, 0.5993969, -1.084876, 0.0627451, 0, 1, 1,
0.5026039, -1.40336, 3.335775, 0.06666667, 0, 1, 1,
0.5027608, 0.7210535, -0.8563609, 0.07450981, 0, 1, 1,
0.5063767, -0.4370533, 1.757032, 0.07843138, 0, 1, 1,
0.5090894, 0.9514139, 0.7614009, 0.08627451, 0, 1, 1,
0.5127661, 0.06953271, 1.608459, 0.09019608, 0, 1, 1,
0.5136684, 0.3678654, 1.451387, 0.09803922, 0, 1, 1,
0.5153189, 1.695336, 0.7671618, 0.1058824, 0, 1, 1,
0.5158599, 0.9506125, -1.299565, 0.1098039, 0, 1, 1,
0.5177647, -0.3105362, 1.178171, 0.1176471, 0, 1, 1,
0.5258697, 0.6185035, 0.7530535, 0.1215686, 0, 1, 1,
0.5267275, -1.097932, 3.279513, 0.1294118, 0, 1, 1,
0.5317756, 0.845415, 0.3625698, 0.1333333, 0, 1, 1,
0.5325216, -0.03214458, 1.826986, 0.1411765, 0, 1, 1,
0.5453935, -1.558143, 4.356703, 0.145098, 0, 1, 1,
0.5460739, 0.535675, 3.204863, 0.1529412, 0, 1, 1,
0.5477199, -0.8678265, 1.494839, 0.1568628, 0, 1, 1,
0.5535826, -1.555585, 2.999211, 0.1647059, 0, 1, 1,
0.5552753, -0.3829861, 1.967708, 0.1686275, 0, 1, 1,
0.5569572, 0.2846842, 1.175595, 0.1764706, 0, 1, 1,
0.562405, -0.3945809, 3.205199, 0.1803922, 0, 1, 1,
0.5656231, 0.4286815, -0.7295657, 0.1882353, 0, 1, 1,
0.57027, -1.196728, 2.32347, 0.1921569, 0, 1, 1,
0.5712039, -2.068504, 1.941361, 0.2, 0, 1, 1,
0.5784693, 1.227519, 1.425486, 0.2078431, 0, 1, 1,
0.5810781, -0.3228219, 2.542967, 0.2117647, 0, 1, 1,
0.5822819, -0.08875658, 1.905357, 0.2196078, 0, 1, 1,
0.5825204, -0.5594947, 1.848313, 0.2235294, 0, 1, 1,
0.5826584, 1.35466, 0.4714099, 0.2313726, 0, 1, 1,
0.5830587, 0.6529998, 0.1118861, 0.2352941, 0, 1, 1,
0.5895085, 0.8424059, 1.162979, 0.2431373, 0, 1, 1,
0.5896725, -0.8421909, 3.345513, 0.2470588, 0, 1, 1,
0.5916023, 0.2589612, 1.624631, 0.254902, 0, 1, 1,
0.5987726, -0.9008353, 2.061507, 0.2588235, 0, 1, 1,
0.5992129, -0.2838108, 1.473448, 0.2666667, 0, 1, 1,
0.5993188, -0.6030701, 2.974444, 0.2705882, 0, 1, 1,
0.6000608, -1.263617, 3.030226, 0.2784314, 0, 1, 1,
0.6003607, 0.06452587, 1.528164, 0.282353, 0, 1, 1,
0.6017175, -0.887082, 2.861228, 0.2901961, 0, 1, 1,
0.6028929, -1.738784, 3.539411, 0.2941177, 0, 1, 1,
0.6072217, 1.548903, -1.140529, 0.3019608, 0, 1, 1,
0.6162733, -1.471461, 2.662475, 0.3098039, 0, 1, 1,
0.6180515, -2.118524, 2.477108, 0.3137255, 0, 1, 1,
0.6183668, -1.243455, 1.910783, 0.3215686, 0, 1, 1,
0.6225958, -0.65626, 1.516814, 0.3254902, 0, 1, 1,
0.6324042, -1.836499, 2.663222, 0.3333333, 0, 1, 1,
0.6356786, 0.1417455, 1.796901, 0.3372549, 0, 1, 1,
0.6425242, 0.6711959, 1.852682, 0.345098, 0, 1, 1,
0.6437933, -0.3296075, 0.07782269, 0.3490196, 0, 1, 1,
0.648508, -2.221603, 2.501863, 0.3568628, 0, 1, 1,
0.6513681, 0.0344893, 1.073021, 0.3607843, 0, 1, 1,
0.6520081, -0.7373623, 2.573346, 0.3686275, 0, 1, 1,
0.657894, 1.1421, 1.389093, 0.372549, 0, 1, 1,
0.6645006, -1.098217, 2.157718, 0.3803922, 0, 1, 1,
0.66489, -0.221115, 4.019619, 0.3843137, 0, 1, 1,
0.6689199, 1.930964, 2.087869, 0.3921569, 0, 1, 1,
0.6710212, -0.181045, 2.746713, 0.3960784, 0, 1, 1,
0.6780758, -0.3689412, 3.134301, 0.4039216, 0, 1, 1,
0.6810903, 1.479756, 1.090175, 0.4117647, 0, 1, 1,
0.6815354, -0.6115551, 1.411441, 0.4156863, 0, 1, 1,
0.682806, 1.205289, 0.6053945, 0.4235294, 0, 1, 1,
0.683822, 0.3373481, 1.138044, 0.427451, 0, 1, 1,
0.6874076, -0.5263458, 3.304746, 0.4352941, 0, 1, 1,
0.6877198, -0.6062441, 1.740305, 0.4392157, 0, 1, 1,
0.6878564, -0.5149989, 3.942469, 0.4470588, 0, 1, 1,
0.6919123, 1.038726, 1.080823, 0.4509804, 0, 1, 1,
0.6928856, -0.3007684, 1.193846, 0.4588235, 0, 1, 1,
0.6949071, 0.4664398, -0.06869798, 0.4627451, 0, 1, 1,
0.6969809, -1.247194, 1.929014, 0.4705882, 0, 1, 1,
0.6992889, -0.7828695, 2.347389, 0.4745098, 0, 1, 1,
0.6996866, 0.4340317, -0.4728628, 0.4823529, 0, 1, 1,
0.7048224, -0.9368149, 1.920741, 0.4862745, 0, 1, 1,
0.7143411, -2.028017, 2.314015, 0.4941176, 0, 1, 1,
0.7156194, 0.3167262, 0.003627758, 0.5019608, 0, 1, 1,
0.717878, 0.2802018, 3.662708, 0.5058824, 0, 1, 1,
0.7196181, -0.1193994, 2.603616, 0.5137255, 0, 1, 1,
0.7230237, -0.8046042, 3.298065, 0.5176471, 0, 1, 1,
0.7267802, -0.6943715, 1.730943, 0.5254902, 0, 1, 1,
0.7268869, 0.2432213, 2.167945, 0.5294118, 0, 1, 1,
0.7323226, 1.714817, 1.117806, 0.5372549, 0, 1, 1,
0.7370773, -0.5518073, 3.721859, 0.5411765, 0, 1, 1,
0.7372612, 0.6596856, 1.792996, 0.5490196, 0, 1, 1,
0.7422181, -0.7456164, 2.232907, 0.5529412, 0, 1, 1,
0.744221, 0.9906204, -0.231268, 0.5607843, 0, 1, 1,
0.7455408, -0.7451437, 1.751251, 0.5647059, 0, 1, 1,
0.7457548, 0.8210893, 3.035684, 0.572549, 0, 1, 1,
0.7457701, -0.9251818, 2.416021, 0.5764706, 0, 1, 1,
0.7510922, -1.769301, 3.335205, 0.5843138, 0, 1, 1,
0.7540005, -0.3837032, -0.0281871, 0.5882353, 0, 1, 1,
0.7552192, 0.7891707, 2.206579, 0.5960785, 0, 1, 1,
0.7557847, 0.9722223, 0.6718177, 0.6039216, 0, 1, 1,
0.7559897, 0.6318408, 3.025498, 0.6078432, 0, 1, 1,
0.7562963, 0.3911853, 1.136312, 0.6156863, 0, 1, 1,
0.7598333, -0.06929941, 2.566477, 0.6196079, 0, 1, 1,
0.76147, -0.6707685, 2.092643, 0.627451, 0, 1, 1,
0.7626588, -1.481188, 4.270019, 0.6313726, 0, 1, 1,
0.7626832, -0.006109646, 3.342407, 0.6392157, 0, 1, 1,
0.7649371, -1.126049, 3.25456, 0.6431373, 0, 1, 1,
0.7708278, 0.9374436, -0.3663375, 0.6509804, 0, 1, 1,
0.7720379, 0.4737826, -0.179091, 0.654902, 0, 1, 1,
0.7732751, -0.7708479, 0.8301682, 0.6627451, 0, 1, 1,
0.7733834, -0.7966545, 2.725228, 0.6666667, 0, 1, 1,
0.7791162, 0.4615469, 0.05324082, 0.6745098, 0, 1, 1,
0.7808088, -1.304883, 3.414802, 0.6784314, 0, 1, 1,
0.7808211, -0.6759211, 1.30394, 0.6862745, 0, 1, 1,
0.7829546, 1.313906, 0.7600565, 0.6901961, 0, 1, 1,
0.7915549, 0.780424, -1.38166, 0.6980392, 0, 1, 1,
0.7939023, -0.6696543, 1.870865, 0.7058824, 0, 1, 1,
0.7952739, 0.2042994, 0.4606926, 0.7098039, 0, 1, 1,
0.8000214, 0.5779057, 0.7622147, 0.7176471, 0, 1, 1,
0.8002758, -0.07587097, 1.810854, 0.7215686, 0, 1, 1,
0.8007348, 0.2761275, 0.848506, 0.7294118, 0, 1, 1,
0.8014297, -1.249358, 2.04412, 0.7333333, 0, 1, 1,
0.8029844, -0.9088385, 2.869498, 0.7411765, 0, 1, 1,
0.8117254, -0.7121359, 1.874233, 0.7450981, 0, 1, 1,
0.8126565, 0.7394226, 0.1307821, 0.7529412, 0, 1, 1,
0.8139101, -0.4175325, 1.747416, 0.7568628, 0, 1, 1,
0.8229186, 0.4065526, 1.164582, 0.7647059, 0, 1, 1,
0.8360903, -1.561503, 1.846791, 0.7686275, 0, 1, 1,
0.8397017, -0.03957268, 0.3360887, 0.7764706, 0, 1, 1,
0.8417839, 0.4611551, 2.059037, 0.7803922, 0, 1, 1,
0.8418424, -0.3947317, 2.158266, 0.7882353, 0, 1, 1,
0.8419861, 0.1078513, -1.320393, 0.7921569, 0, 1, 1,
0.8454097, -0.8858677, 1.885729, 0.8, 0, 1, 1,
0.846941, -1.546645, 3.581718, 0.8078431, 0, 1, 1,
0.8522647, 0.3219227, 0.4311317, 0.8117647, 0, 1, 1,
0.8530167, 0.7080942, 2.307288, 0.8196079, 0, 1, 1,
0.862596, -1.202772, 3.198255, 0.8235294, 0, 1, 1,
0.8630158, 1.229281, 2.220443, 0.8313726, 0, 1, 1,
0.8660121, -1.27695, 2.747146, 0.8352941, 0, 1, 1,
0.868432, -1.316264, 0.03275621, 0.8431373, 0, 1, 1,
0.8733746, -0.1409683, 3.539637, 0.8470588, 0, 1, 1,
0.8748753, 1.679415, -0.1291713, 0.854902, 0, 1, 1,
0.8758851, 1.428112, 0.9444861, 0.8588235, 0, 1, 1,
0.8788849, 0.1377082, 2.136003, 0.8666667, 0, 1, 1,
0.8820366, -0.9106128, 1.626517, 0.8705882, 0, 1, 1,
0.8847593, 1.223081, 1.180569, 0.8784314, 0, 1, 1,
0.8906046, -1.160383, 2.57567, 0.8823529, 0, 1, 1,
0.8934131, 0.2344024, 1.644201, 0.8901961, 0, 1, 1,
0.8970781, -0.1839083, -0.06363714, 0.8941177, 0, 1, 1,
0.9000048, -0.526294, 0.7416128, 0.9019608, 0, 1, 1,
0.9019231, -0.1588804, 2.17409, 0.9098039, 0, 1, 1,
0.9028581, 0.3317348, 1.845667, 0.9137255, 0, 1, 1,
0.9061415, -1.161425, 3.267926, 0.9215686, 0, 1, 1,
0.9072129, -0.0377608, 2.398738, 0.9254902, 0, 1, 1,
0.9101744, 0.5602652, 1.830432, 0.9333333, 0, 1, 1,
0.9116576, 0.6634322, 1.795658, 0.9372549, 0, 1, 1,
0.9117782, -0.1416505, -0.5618275, 0.945098, 0, 1, 1,
0.9177831, -0.6563842, 1.651604, 0.9490196, 0, 1, 1,
0.9189277, 1.156909, 1.186806, 0.9568627, 0, 1, 1,
0.9192452, 1.176543, 2.177951, 0.9607843, 0, 1, 1,
0.9193684, -0.2856814, 2.230739, 0.9686275, 0, 1, 1,
0.9196134, 0.1370911, 1.090845, 0.972549, 0, 1, 1,
0.9210091, 0.5177841, 0.5380574, 0.9803922, 0, 1, 1,
0.9274936, 0.02663558, 0.657812, 0.9843137, 0, 1, 1,
0.929576, 0.8536663, 0.8978053, 0.9921569, 0, 1, 1,
0.9345356, -1.310152, 3.503378, 0.9960784, 0, 1, 1,
0.9348025, -0.6225495, 0.8694375, 1, 0, 0.9960784, 1,
0.9394591, 0.01821916, 1.93434, 1, 0, 0.9882353, 1,
0.9408188, -0.4359281, 1.500975, 1, 0, 0.9843137, 1,
0.944385, 1.185532, 0.8915377, 1, 0, 0.9764706, 1,
0.9450247, 0.5409581, 1.374742, 1, 0, 0.972549, 1,
0.9538721, 0.8636649, -1.038713, 1, 0, 0.9647059, 1,
0.9558938, -0.01043019, 1.061838, 1, 0, 0.9607843, 1,
0.9581467, 0.5596647, -2.224558, 1, 0, 0.9529412, 1,
0.9600183, -0.4962471, 2.194785, 1, 0, 0.9490196, 1,
0.9633622, 0.9622848, 1.656668, 1, 0, 0.9411765, 1,
0.9661742, -0.887527, 1.969108, 1, 0, 0.9372549, 1,
0.9675019, 0.4683482, 0.5398139, 1, 0, 0.9294118, 1,
0.9729831, -0.0384062, 2.040209, 1, 0, 0.9254902, 1,
0.9736264, -1.115554, 1.538084, 1, 0, 0.9176471, 1,
0.9752949, 0.5847756, 1.202422, 1, 0, 0.9137255, 1,
0.9754074, -0.1547532, 1.84497, 1, 0, 0.9058824, 1,
0.9845387, 0.6253302, 0.1256807, 1, 0, 0.9019608, 1,
0.9903161, 0.2642205, 1.178228, 1, 0, 0.8941177, 1,
0.9945868, -1.553257, 1.720702, 1, 0, 0.8862745, 1,
0.9961578, -1.112966, 3.024869, 1, 0, 0.8823529, 1,
1.013265, 0.3164094, 2.448031, 1, 0, 0.8745098, 1,
1.019855, -0.003605375, 2.684814, 1, 0, 0.8705882, 1,
1.026665, 0.3494305, 1.840361, 1, 0, 0.8627451, 1,
1.028693, 1.684159, 0.5901996, 1, 0, 0.8588235, 1,
1.02985, -0.8404242, 3.112226, 1, 0, 0.8509804, 1,
1.040151, -0.2667201, 1.998688, 1, 0, 0.8470588, 1,
1.043514, 0.08861714, 2.548363, 1, 0, 0.8392157, 1,
1.051171, 1.518367, 1.027819, 1, 0, 0.8352941, 1,
1.051579, -1.097677, 2.698833, 1, 0, 0.827451, 1,
1.052715, -0.3920897, 2.025967, 1, 0, 0.8235294, 1,
1.055098, 0.2873698, 1.310868, 1, 0, 0.8156863, 1,
1.058728, 0.8298744, -1.749212, 1, 0, 0.8117647, 1,
1.064268, 0.07520024, 0.5455526, 1, 0, 0.8039216, 1,
1.064902, 1.913888, 1.960809, 1, 0, 0.7960784, 1,
1.069352, -0.7349701, 1.317011, 1, 0, 0.7921569, 1,
1.076716, 0.04437519, 1.248616, 1, 0, 0.7843137, 1,
1.082997, -0.9327968, 1.452965, 1, 0, 0.7803922, 1,
1.095784, -0.8808748, 3.084721, 1, 0, 0.772549, 1,
1.106788, -0.8851046, 2.003383, 1, 0, 0.7686275, 1,
1.110842, -0.096727, 1.491014, 1, 0, 0.7607843, 1,
1.114336, 1.469016, -1.010282, 1, 0, 0.7568628, 1,
1.115233, 0.04206793, 3.468044, 1, 0, 0.7490196, 1,
1.122445, -0.5191792, 0.704928, 1, 0, 0.7450981, 1,
1.123716, 0.2679415, 1.60444, 1, 0, 0.7372549, 1,
1.12636, -1.449177, 2.03976, 1, 0, 0.7333333, 1,
1.126558, -0.2996928, 1.942148, 1, 0, 0.7254902, 1,
1.131346, 0.1588122, 1.857127, 1, 0, 0.7215686, 1,
1.146057, -1.164628, 2.915886, 1, 0, 0.7137255, 1,
1.159914, -0.7656928, 4.158232, 1, 0, 0.7098039, 1,
1.163541, 0.8708492, 1.511484, 1, 0, 0.7019608, 1,
1.173024, -1.395271, 1.508864, 1, 0, 0.6941177, 1,
1.174831, 0.7689155, -0.1479119, 1, 0, 0.6901961, 1,
1.176125, 0.1701702, -0.04999366, 1, 0, 0.682353, 1,
1.176608, 0.1119995, 2.41574, 1, 0, 0.6784314, 1,
1.18013, -2.129555, 1.940837, 1, 0, 0.6705883, 1,
1.191283, 0.4133402, 1.780267, 1, 0, 0.6666667, 1,
1.196342, -0.885782, 2.059222, 1, 0, 0.6588235, 1,
1.200819, 0.4350888, 0.1466158, 1, 0, 0.654902, 1,
1.203814, 0.5186483, 2.557008, 1, 0, 0.6470588, 1,
1.210037, -0.9817565, 2.844059, 1, 0, 0.6431373, 1,
1.213092, -1.344025, 3.045943, 1, 0, 0.6352941, 1,
1.219257, -0.6460006, 2.88763, 1, 0, 0.6313726, 1,
1.225057, -0.783482, 1.065914, 1, 0, 0.6235294, 1,
1.226554, -0.8117287, 2.486434, 1, 0, 0.6196079, 1,
1.229278, 0.5546322, 0.6214304, 1, 0, 0.6117647, 1,
1.256448, 0.7433571, 2.91736, 1, 0, 0.6078432, 1,
1.267664, -0.08587661, 0.8961387, 1, 0, 0.6, 1,
1.26875, -1.135072, 1.383627, 1, 0, 0.5921569, 1,
1.278634, 0.159513, 2.410677, 1, 0, 0.5882353, 1,
1.292954, 0.4649131, 0.5693115, 1, 0, 0.5803922, 1,
1.301736, -0.7285501, 4.025423, 1, 0, 0.5764706, 1,
1.305101, 1.030458, 2.504016, 1, 0, 0.5686275, 1,
1.310473, 1.265708, 1.470528, 1, 0, 0.5647059, 1,
1.314894, 0.2020603, 2.236605, 1, 0, 0.5568628, 1,
1.324025, -0.2443242, 1.765558, 1, 0, 0.5529412, 1,
1.324218, -0.255928, 1.475437, 1, 0, 0.5450981, 1,
1.333618, -0.8504094, 3.704204, 1, 0, 0.5411765, 1,
1.333901, 0.4390061, 0.6256148, 1, 0, 0.5333334, 1,
1.33547, -1.192608, 2.620937, 1, 0, 0.5294118, 1,
1.349789, -0.5237775, -1.096462, 1, 0, 0.5215687, 1,
1.351846, -0.1354802, 3.54694, 1, 0, 0.5176471, 1,
1.353381, -0.4092433, 2.885385, 1, 0, 0.509804, 1,
1.358486, -0.9756602, 2.373996, 1, 0, 0.5058824, 1,
1.375337, -0.7187459, 2.921287, 1, 0, 0.4980392, 1,
1.384286, -0.7668754, 3.171224, 1, 0, 0.4901961, 1,
1.389896, 0.0545808, 2.856983, 1, 0, 0.4862745, 1,
1.396676, -0.00720591, 2.424263, 1, 0, 0.4784314, 1,
1.39815, 0.2876192, 2.211733, 1, 0, 0.4745098, 1,
1.401724, 0.55751, 0.4553738, 1, 0, 0.4666667, 1,
1.410972, 0.4150421, 1.047113, 1, 0, 0.4627451, 1,
1.414473, -0.8401388, 3.7578, 1, 0, 0.454902, 1,
1.421713, -0.7556732, 2.179889, 1, 0, 0.4509804, 1,
1.424343, 1.129177, 0.6346742, 1, 0, 0.4431373, 1,
1.430522, -0.07529639, 0.9518878, 1, 0, 0.4392157, 1,
1.431279, 1.056186, -0.7810791, 1, 0, 0.4313726, 1,
1.444137, 1.744503, -0.7764177, 1, 0, 0.427451, 1,
1.451796, -0.7638885, 2.42513, 1, 0, 0.4196078, 1,
1.455469, 0.3239819, 0.3166047, 1, 0, 0.4156863, 1,
1.481102, 0.6865982, 1.051941, 1, 0, 0.4078431, 1,
1.493023, 1.227297, 1.716647, 1, 0, 0.4039216, 1,
1.497487, -0.3532317, 1.94769, 1, 0, 0.3960784, 1,
1.526579, -0.02646844, 1.989883, 1, 0, 0.3882353, 1,
1.540033, 0.7723141, -0.31865, 1, 0, 0.3843137, 1,
1.550782, 0.2051756, 1.604317, 1, 0, 0.3764706, 1,
1.555319, -1.537374, 1.936385, 1, 0, 0.372549, 1,
1.565595, 1.38163, 1.023538, 1, 0, 0.3647059, 1,
1.584011, 1.651967, 1.89464, 1, 0, 0.3607843, 1,
1.593328, 0.1884525, 1.734738, 1, 0, 0.3529412, 1,
1.612776, 0.612681, 0.9946311, 1, 0, 0.3490196, 1,
1.616656, 0.1591185, 1.579037, 1, 0, 0.3411765, 1,
1.620831, 1.048728, -0.8193507, 1, 0, 0.3372549, 1,
1.632112, -1.44651, 2.851291, 1, 0, 0.3294118, 1,
1.640552, -0.6341065, 2.110616, 1, 0, 0.3254902, 1,
1.64879, 1.188237, 0.6452795, 1, 0, 0.3176471, 1,
1.657926, -0.2818744, 0.09957222, 1, 0, 0.3137255, 1,
1.662815, 0.465002, 2.481652, 1, 0, 0.3058824, 1,
1.663045, 0.8611374, 1.332809, 1, 0, 0.2980392, 1,
1.699416, 0.1698549, 1.406383, 1, 0, 0.2941177, 1,
1.699563, 0.5749218, 3.007939, 1, 0, 0.2862745, 1,
1.705132, -0.6136591, 2.932692, 1, 0, 0.282353, 1,
1.71682, -1.931402, 0.4219932, 1, 0, 0.2745098, 1,
1.719091, 1.489659, -0.2824051, 1, 0, 0.2705882, 1,
1.722318, -0.4089389, 1.232386, 1, 0, 0.2627451, 1,
1.745639, -1.170545, 2.597464, 1, 0, 0.2588235, 1,
1.754752, -0.4670596, 1.049341, 1, 0, 0.2509804, 1,
1.781084, -1.173105, 1.632974, 1, 0, 0.2470588, 1,
1.787949, 1.684071, 1.090587, 1, 0, 0.2392157, 1,
1.795313, 1.829281, 0.3496815, 1, 0, 0.2352941, 1,
1.801775, 0.03021167, 1.988634, 1, 0, 0.227451, 1,
1.904269, 0.2361366, 1.080649, 1, 0, 0.2235294, 1,
1.918411, 0.05328393, 0.06507681, 1, 0, 0.2156863, 1,
1.924512, -0.09144907, 1.66609, 1, 0, 0.2117647, 1,
1.92842, 0.02087449, 0.9695832, 1, 0, 0.2039216, 1,
1.932098, 2.882497, -0.05619203, 1, 0, 0.1960784, 1,
1.934574, 0.7107326, 0.5895838, 1, 0, 0.1921569, 1,
1.940432, 0.3105413, 0.8591776, 1, 0, 0.1843137, 1,
1.987188, 0.2638789, 0.9616475, 1, 0, 0.1803922, 1,
1.988208, -0.4690884, 3.20278, 1, 0, 0.172549, 1,
1.990965, -0.3769909, 1.615725, 1, 0, 0.1686275, 1,
2.021892, 1.097035, 2.088392, 1, 0, 0.1607843, 1,
2.028279, -1.289357, 1.743988, 1, 0, 0.1568628, 1,
2.062259, 0.09188765, -0.4536189, 1, 0, 0.1490196, 1,
2.067961, -1.003256, 2.572087, 1, 0, 0.145098, 1,
2.102847, -0.2013829, 3.289621, 1, 0, 0.1372549, 1,
2.160634, -2.277455, 2.17012, 1, 0, 0.1333333, 1,
2.163153, 0.6433299, 1.012029, 1, 0, 0.1254902, 1,
2.199018, -0.54151, 2.085526, 1, 0, 0.1215686, 1,
2.236146, -0.2596624, 1.30204, 1, 0, 0.1137255, 1,
2.270559, 1.359937, 0.7077157, 1, 0, 0.1098039, 1,
2.280914, -0.1034047, 1.907404, 1, 0, 0.1019608, 1,
2.294701, 0.1158613, 1.891488, 1, 0, 0.09411765, 1,
2.29911, -0.2316007, 0.8518186, 1, 0, 0.09019608, 1,
2.307619, 0.8898047, 4.113313, 1, 0, 0.08235294, 1,
2.37648, -0.6586725, 1.951636, 1, 0, 0.07843138, 1,
2.386225, -0.2244418, 3.257846, 1, 0, 0.07058824, 1,
2.394185, 0.0233549, 0.8185375, 1, 0, 0.06666667, 1,
2.438523, 1.530142, -0.4546455, 1, 0, 0.05882353, 1,
2.442687, 1.182115, -0.07579443, 1, 0, 0.05490196, 1,
2.448287, -1.210936, 0.4345008, 1, 0, 0.04705882, 1,
2.47078, -1.302492, 1.995608, 1, 0, 0.04313726, 1,
2.60287, 1.288685, -0.09586199, 1, 0, 0.03529412, 1,
2.621716, -2.111671, 3.279124, 1, 0, 0.03137255, 1,
2.631617, 0.4176662, 0.6157476, 1, 0, 0.02352941, 1,
2.632475, 1.342202, -0.9003832, 1, 0, 0.01960784, 1,
3.016831, -0.242212, 1.414486, 1, 0, 0.01176471, 1,
3.164639, -1.867747, 1.601727, 1, 0, 0.007843138, 1
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
0.1151035, -3.88852, -7.778685, 0, -0.5, 0.5, 0.5,
0.1151035, -3.88852, -7.778685, 1, -0.5, 0.5, 0.5,
0.1151035, -3.88852, -7.778685, 1, 1.5, 0.5, 0.5,
0.1151035, -3.88852, -7.778685, 0, 1.5, 0.5, 0.5
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
-3.968224, 0.2583116, -7.778685, 0, -0.5, 0.5, 0.5,
-3.968224, 0.2583116, -7.778685, 1, -0.5, 0.5, 0.5,
-3.968224, 0.2583116, -7.778685, 1, 1.5, 0.5, 0.5,
-3.968224, 0.2583116, -7.778685, 0, 1.5, 0.5, 0.5
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
-3.968224, -3.88852, -0.2523353, 0, -0.5, 0.5, 0.5,
-3.968224, -3.88852, -0.2523353, 1, -0.5, 0.5, 0.5,
-3.968224, -3.88852, -0.2523353, 1, 1.5, 0.5, 0.5,
-3.968224, -3.88852, -0.2523353, 0, 1.5, 0.5, 0.5
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
-2, -2.931559, -6.041835,
3, -2.931559, -6.041835,
-2, -2.931559, -6.041835,
-2, -3.091053, -6.33131,
-1, -2.931559, -6.041835,
-1, -3.091053, -6.33131,
0, -2.931559, -6.041835,
0, -3.091053, -6.33131,
1, -2.931559, -6.041835,
1, -3.091053, -6.33131,
2, -2.931559, -6.041835,
2, -3.091053, -6.33131,
3, -2.931559, -6.041835,
3, -3.091053, -6.33131
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
-2, -3.41004, -6.91026, 0, -0.5, 0.5, 0.5,
-2, -3.41004, -6.91026, 1, -0.5, 0.5, 0.5,
-2, -3.41004, -6.91026, 1, 1.5, 0.5, 0.5,
-2, -3.41004, -6.91026, 0, 1.5, 0.5, 0.5,
-1, -3.41004, -6.91026, 0, -0.5, 0.5, 0.5,
-1, -3.41004, -6.91026, 1, -0.5, 0.5, 0.5,
-1, -3.41004, -6.91026, 1, 1.5, 0.5, 0.5,
-1, -3.41004, -6.91026, 0, 1.5, 0.5, 0.5,
0, -3.41004, -6.91026, 0, -0.5, 0.5, 0.5,
0, -3.41004, -6.91026, 1, -0.5, 0.5, 0.5,
0, -3.41004, -6.91026, 1, 1.5, 0.5, 0.5,
0, -3.41004, -6.91026, 0, 1.5, 0.5, 0.5,
1, -3.41004, -6.91026, 0, -0.5, 0.5, 0.5,
1, -3.41004, -6.91026, 1, -0.5, 0.5, 0.5,
1, -3.41004, -6.91026, 1, 1.5, 0.5, 0.5,
1, -3.41004, -6.91026, 0, 1.5, 0.5, 0.5,
2, -3.41004, -6.91026, 0, -0.5, 0.5, 0.5,
2, -3.41004, -6.91026, 1, -0.5, 0.5, 0.5,
2, -3.41004, -6.91026, 1, 1.5, 0.5, 0.5,
2, -3.41004, -6.91026, 0, 1.5, 0.5, 0.5,
3, -3.41004, -6.91026, 0, -0.5, 0.5, 0.5,
3, -3.41004, -6.91026, 1, -0.5, 0.5, 0.5,
3, -3.41004, -6.91026, 1, 1.5, 0.5, 0.5,
3, -3.41004, -6.91026, 0, 1.5, 0.5, 0.5
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
-3.025918, -2, -6.041835,
-3.025918, 3, -6.041835,
-3.025918, -2, -6.041835,
-3.182969, -2, -6.33131,
-3.025918, -1, -6.041835,
-3.182969, -1, -6.33131,
-3.025918, 0, -6.041835,
-3.182969, 0, -6.33131,
-3.025918, 1, -6.041835,
-3.182969, 1, -6.33131,
-3.025918, 2, -6.041835,
-3.182969, 2, -6.33131,
-3.025918, 3, -6.041835,
-3.182969, 3, -6.33131
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
-3.497071, -2, -6.91026, 0, -0.5, 0.5, 0.5,
-3.497071, -2, -6.91026, 1, -0.5, 0.5, 0.5,
-3.497071, -2, -6.91026, 1, 1.5, 0.5, 0.5,
-3.497071, -2, -6.91026, 0, 1.5, 0.5, 0.5,
-3.497071, -1, -6.91026, 0, -0.5, 0.5, 0.5,
-3.497071, -1, -6.91026, 1, -0.5, 0.5, 0.5,
-3.497071, -1, -6.91026, 1, 1.5, 0.5, 0.5,
-3.497071, -1, -6.91026, 0, 1.5, 0.5, 0.5,
-3.497071, 0, -6.91026, 0, -0.5, 0.5, 0.5,
-3.497071, 0, -6.91026, 1, -0.5, 0.5, 0.5,
-3.497071, 0, -6.91026, 1, 1.5, 0.5, 0.5,
-3.497071, 0, -6.91026, 0, 1.5, 0.5, 0.5,
-3.497071, 1, -6.91026, 0, -0.5, 0.5, 0.5,
-3.497071, 1, -6.91026, 1, -0.5, 0.5, 0.5,
-3.497071, 1, -6.91026, 1, 1.5, 0.5, 0.5,
-3.497071, 1, -6.91026, 0, 1.5, 0.5, 0.5,
-3.497071, 2, -6.91026, 0, -0.5, 0.5, 0.5,
-3.497071, 2, -6.91026, 1, -0.5, 0.5, 0.5,
-3.497071, 2, -6.91026, 1, 1.5, 0.5, 0.5,
-3.497071, 2, -6.91026, 0, 1.5, 0.5, 0.5,
-3.497071, 3, -6.91026, 0, -0.5, 0.5, 0.5,
-3.497071, 3, -6.91026, 1, -0.5, 0.5, 0.5,
-3.497071, 3, -6.91026, 1, 1.5, 0.5, 0.5,
-3.497071, 3, -6.91026, 0, 1.5, 0.5, 0.5
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
-3.025918, -2.931559, -4,
-3.025918, -2.931559, 4,
-3.025918, -2.931559, -4,
-3.182969, -3.091053, -4,
-3.025918, -2.931559, -2,
-3.182969, -3.091053, -2,
-3.025918, -2.931559, 0,
-3.182969, -3.091053, 0,
-3.025918, -2.931559, 2,
-3.182969, -3.091053, 2,
-3.025918, -2.931559, 4,
-3.182969, -3.091053, 4
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
-3.497071, -3.41004, -4, 0, -0.5, 0.5, 0.5,
-3.497071, -3.41004, -4, 1, -0.5, 0.5, 0.5,
-3.497071, -3.41004, -4, 1, 1.5, 0.5, 0.5,
-3.497071, -3.41004, -4, 0, 1.5, 0.5, 0.5,
-3.497071, -3.41004, -2, 0, -0.5, 0.5, 0.5,
-3.497071, -3.41004, -2, 1, -0.5, 0.5, 0.5,
-3.497071, -3.41004, -2, 1, 1.5, 0.5, 0.5,
-3.497071, -3.41004, -2, 0, 1.5, 0.5, 0.5,
-3.497071, -3.41004, 0, 0, -0.5, 0.5, 0.5,
-3.497071, -3.41004, 0, 1, -0.5, 0.5, 0.5,
-3.497071, -3.41004, 0, 1, 1.5, 0.5, 0.5,
-3.497071, -3.41004, 0, 0, 1.5, 0.5, 0.5,
-3.497071, -3.41004, 2, 0, -0.5, 0.5, 0.5,
-3.497071, -3.41004, 2, 1, -0.5, 0.5, 0.5,
-3.497071, -3.41004, 2, 1, 1.5, 0.5, 0.5,
-3.497071, -3.41004, 2, 0, 1.5, 0.5, 0.5,
-3.497071, -3.41004, 4, 0, -0.5, 0.5, 0.5,
-3.497071, -3.41004, 4, 1, -0.5, 0.5, 0.5,
-3.497071, -3.41004, 4, 1, 1.5, 0.5, 0.5,
-3.497071, -3.41004, 4, 0, 1.5, 0.5, 0.5
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
-3.025918, -2.931559, -6.041835,
-3.025918, 3.448182, -6.041835,
-3.025918, -2.931559, 5.537165,
-3.025918, 3.448182, 5.537165,
-3.025918, -2.931559, -6.041835,
-3.025918, -2.931559, 5.537165,
-3.025918, 3.448182, -6.041835,
-3.025918, 3.448182, 5.537165,
-3.025918, -2.931559, -6.041835,
3.256125, -2.931559, -6.041835,
-3.025918, -2.931559, 5.537165,
3.256125, -2.931559, 5.537165,
-3.025918, 3.448182, -6.041835,
3.256125, 3.448182, -6.041835,
-3.025918, 3.448182, 5.537165,
3.256125, 3.448182, 5.537165,
3.256125, -2.931559, -6.041835,
3.256125, 3.448182, -6.041835,
3.256125, -2.931559, 5.537165,
3.256125, 3.448182, 5.537165,
3.256125, -2.931559, -6.041835,
3.256125, -2.931559, 5.537165,
3.256125, 3.448182, -6.041835,
3.256125, 3.448182, 5.537165
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
var radius = 7.815812;
var distance = 34.77343;
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
mvMatrix.translate( -0.1151035, -0.2583116, 0.2523353 );
mvMatrix.scale( 1.345201, 1.324601, 0.729822 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.77343);
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
chloropropylate<-read.table("chloropropylate.xyz")
```

```
## Error in read.table("chloropropylate.xyz"): no lines available in input
```

```r
x<-chloropropylate$V2
```

```
## Error in eval(expr, envir, enclos): object 'chloropropylate' not found
```

```r
y<-chloropropylate$V3
```

```
## Error in eval(expr, envir, enclos): object 'chloropropylate' not found
```

```r
z<-chloropropylate$V4
```

```
## Error in eval(expr, envir, enclos): object 'chloropropylate' not found
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
-2.934432, -0.5326071, -1.294074, 0, 0, 1, 1, 1,
-2.923589, 0.09230992, -1.721378, 1, 0, 0, 1, 1,
-2.693727, 0.8290471, 0.5558716, 1, 0, 0, 1, 1,
-2.634495, -0.1847109, -2.48341, 1, 0, 0, 1, 1,
-2.481974, 0.7605753, -1.084738, 1, 0, 0, 1, 1,
-2.472955, 0.3077559, -0.4426647, 1, 0, 0, 1, 1,
-2.456473, 0.993028, -1.462105, 0, 0, 0, 1, 1,
-2.285411, -0.2671113, -1.606665, 0, 0, 0, 1, 1,
-2.225538, 1.836351, -2.030219, 0, 0, 0, 1, 1,
-2.210631, 0.4085131, -2.257562, 0, 0, 0, 1, 1,
-2.196164, 0.105588, -1.38876, 0, 0, 0, 1, 1,
-2.188641, -1.720566, -2.458117, 0, 0, 0, 1, 1,
-2.172397, -0.6336344, -0.8220207, 0, 0, 0, 1, 1,
-2.152244, 0.02504411, -1.204354, 1, 1, 1, 1, 1,
-2.151828, -0.897089, -2.448806, 1, 1, 1, 1, 1,
-2.093559, 0.977599, -1.93597, 1, 1, 1, 1, 1,
-2.085798, -2.612859, -1.47673, 1, 1, 1, 1, 1,
-2.076947, -1.129657, -2.721847, 1, 1, 1, 1, 1,
-2.063205, -1.122427, -2.927758, 1, 1, 1, 1, 1,
-2.05203, -1.573203, -1.285768, 1, 1, 1, 1, 1,
-2.02578, 0.2019009, -0.9156491, 1, 1, 1, 1, 1,
-2.015058, 0.2617147, -0.4848039, 1, 1, 1, 1, 1,
-2.01338, -0.4677809, -2.46233, 1, 1, 1, 1, 1,
-1.994541, 0.209993, 0.2265609, 1, 1, 1, 1, 1,
-1.993951, -0.1988224, -1.229994, 1, 1, 1, 1, 1,
-1.98976, 0.05830338, -0.4355863, 1, 1, 1, 1, 1,
-1.983964, 0.2407505, -1.16964, 1, 1, 1, 1, 1,
-1.966824, -0.8420656, -1.796678, 1, 1, 1, 1, 1,
-1.911769, -0.4286933, -3.360262, 0, 0, 1, 1, 1,
-1.89906, -1.34075, -3.121873, 1, 0, 0, 1, 1,
-1.898413, -2.223285, -2.685569, 1, 0, 0, 1, 1,
-1.876216, 1.344168, -0.9725594, 1, 0, 0, 1, 1,
-1.873694, -0.2655165, -1.917684, 1, 0, 0, 1, 1,
-1.87352, -0.6109924, -1.225448, 1, 0, 0, 1, 1,
-1.807648, -0.1154758, -1.381514, 0, 0, 0, 1, 1,
-1.794945, 0.4593458, -2.437707, 0, 0, 0, 1, 1,
-1.777102, 1.77774, -2.494524, 0, 0, 0, 1, 1,
-1.755149, -0.3095991, -0.6654071, 0, 0, 0, 1, 1,
-1.743912, -0.5764475, -0.9547858, 0, 0, 0, 1, 1,
-1.743225, -0.177662, -4.130877, 0, 0, 0, 1, 1,
-1.727263, -1.030805, -2.343207, 0, 0, 0, 1, 1,
-1.720175, 0.2925223, -2.670867, 1, 1, 1, 1, 1,
-1.716553, -2.124897, -3.151277, 1, 1, 1, 1, 1,
-1.716054, -0.1514566, -1.952651, 1, 1, 1, 1, 1,
-1.707066, 1.394223, -0.3127774, 1, 1, 1, 1, 1,
-1.694778, -0.8494924, -3.10068, 1, 1, 1, 1, 1,
-1.672295, -0.7848381, -2.359673, 1, 1, 1, 1, 1,
-1.665947, -0.9225131, -3.118709, 1, 1, 1, 1, 1,
-1.663343, -1.741325, -2.411892, 1, 1, 1, 1, 1,
-1.648606, -0.5546456, -1.157067, 1, 1, 1, 1, 1,
-1.640894, -2.744121, -2.411677, 1, 1, 1, 1, 1,
-1.639686, 1.051125, 0.8190225, 1, 1, 1, 1, 1,
-1.638477, -1.327815, -3.464891, 1, 1, 1, 1, 1,
-1.635486, -1.835381, -0.7579997, 1, 1, 1, 1, 1,
-1.630442, 0.6576822, -1.734739, 1, 1, 1, 1, 1,
-1.622738, 0.4658101, -0.4796299, 1, 1, 1, 1, 1,
-1.621219, 1.144918, -0.7837238, 0, 0, 1, 1, 1,
-1.621144, -1.351356, -2.870496, 1, 0, 0, 1, 1,
-1.611411, 0.438339, -0.3516226, 1, 0, 0, 1, 1,
-1.6004, -1.960664, -2.506463, 1, 0, 0, 1, 1,
-1.596657, -1.906012, -2.885204, 1, 0, 0, 1, 1,
-1.591269, -0.2965508, -1.551609, 1, 0, 0, 1, 1,
-1.590293, 0.1905656, -0.6477668, 0, 0, 0, 1, 1,
-1.582874, 1.527775, -0.7732831, 0, 0, 0, 1, 1,
-1.563602, -1.116121, -2.575325, 0, 0, 0, 1, 1,
-1.559785, -0.7559995, -2.635398, 0, 0, 0, 1, 1,
-1.547035, 0.1239424, -1.317953, 0, 0, 0, 1, 1,
-1.542268, 2.821325, -1.169645, 0, 0, 0, 1, 1,
-1.540044, 0.9200613, -1.858625, 0, 0, 0, 1, 1,
-1.537242, 0.9881761, -2.746467, 1, 1, 1, 1, 1,
-1.534153, -0.8382049, -1.694378, 1, 1, 1, 1, 1,
-1.533579, -1.074675, -2.326375, 1, 1, 1, 1, 1,
-1.53219, 1.316504, -0.9254149, 1, 1, 1, 1, 1,
-1.524281, -0.6164596, -2.629448, 1, 1, 1, 1, 1,
-1.519775, 0.1416989, -1.773966, 1, 1, 1, 1, 1,
-1.513275, 0.213051, -0.4117261, 1, 1, 1, 1, 1,
-1.495841, 0.8686664, -1.448152, 1, 1, 1, 1, 1,
-1.492901, -1.145692, -1.882943, 1, 1, 1, 1, 1,
-1.485591, 0.7349934, -0.6718022, 1, 1, 1, 1, 1,
-1.480955, 0.2679722, -0.7492805, 1, 1, 1, 1, 1,
-1.468352, 0.8325865, -2.931739, 1, 1, 1, 1, 1,
-1.467799, 0.5253646, -0.1072726, 1, 1, 1, 1, 1,
-1.465914, 0.9184592, -2.797239, 1, 1, 1, 1, 1,
-1.460678, 0.7358654, -2.251266, 1, 1, 1, 1, 1,
-1.449664, -0.06223512, -1.850265, 0, 0, 1, 1, 1,
-1.437293, -1.083491, -1.579867, 1, 0, 0, 1, 1,
-1.427376, -2.656304, -2.282671, 1, 0, 0, 1, 1,
-1.416212, -0.1519285, -2.493876, 1, 0, 0, 1, 1,
-1.414446, 0.1957836, -2.466419, 1, 0, 0, 1, 1,
-1.411096, 0.5823869, -0.3617221, 1, 0, 0, 1, 1,
-1.408428, -2.303178, -2.418436, 0, 0, 0, 1, 1,
-1.405265, -0.7489411, -0.7101809, 0, 0, 0, 1, 1,
-1.404054, -0.8096027, -4.59303, 0, 0, 0, 1, 1,
-1.399974, 0.7821727, -1.157771, 0, 0, 0, 1, 1,
-1.395237, 0.5651966, -1.298902, 0, 0, 0, 1, 1,
-1.387794, -1.605839, -3.001997, 0, 0, 0, 1, 1,
-1.384977, 0.4752574, -0.9533111, 0, 0, 0, 1, 1,
-1.378418, 0.4083311, -0.9964462, 1, 1, 1, 1, 1,
-1.378413, -0.9552801, -1.655921, 1, 1, 1, 1, 1,
-1.37542, -0.2129648, -1.796767, 1, 1, 1, 1, 1,
-1.367965, -1.494789, -3.057362, 1, 1, 1, 1, 1,
-1.359658, -0.06420711, -3.052166, 1, 1, 1, 1, 1,
-1.346746, -0.5771613, -2.068996, 1, 1, 1, 1, 1,
-1.343834, 1.192177, -0.5165187, 1, 1, 1, 1, 1,
-1.339132, -1.24971, -1.156962, 1, 1, 1, 1, 1,
-1.338931, 0.4131379, -1.293752, 1, 1, 1, 1, 1,
-1.335592, 1.41605, 0.07694721, 1, 1, 1, 1, 1,
-1.309164, 0.6450237, -2.364152, 1, 1, 1, 1, 1,
-1.30455, -0.3847517, -1.888994, 1, 1, 1, 1, 1,
-1.301307, 0.8579555, -1.52013, 1, 1, 1, 1, 1,
-1.291488, -1.010437, -1.52384, 1, 1, 1, 1, 1,
-1.281766, 0.8810408, -1.308511, 1, 1, 1, 1, 1,
-1.267012, -0.5283493, 0.2886299, 0, 0, 1, 1, 1,
-1.265344, -0.6832818, -2.024306, 1, 0, 0, 1, 1,
-1.260247, 0.7842659, -2.568471, 1, 0, 0, 1, 1,
-1.25923, 0.1008115, 0.1899118, 1, 0, 0, 1, 1,
-1.254792, -1.306309, -4.816309, 1, 0, 0, 1, 1,
-1.250691, 1.551109, -0.8454397, 1, 0, 0, 1, 1,
-1.242514, 0.5321272, -2.635336, 0, 0, 0, 1, 1,
-1.232112, 0.09083405, 0.05907115, 0, 0, 0, 1, 1,
-1.214502, 0.00290926, -1.422161, 0, 0, 0, 1, 1,
-1.207093, 2.962549, 2.108256, 0, 0, 0, 1, 1,
-1.202987, -1.930663, -4.781598, 0, 0, 0, 1, 1,
-1.199364, -0.9252937, -2.568029, 0, 0, 0, 1, 1,
-1.197871, -2.014014, -3.587888, 0, 0, 0, 1, 1,
-1.191301, 0.7429656, -2.381155, 1, 1, 1, 1, 1,
-1.188785, -0.1731439, -0.9539837, 1, 1, 1, 1, 1,
-1.179563, -1.398387, -0.1803479, 1, 1, 1, 1, 1,
-1.16628, 0.8141376, -1.018352, 1, 1, 1, 1, 1,
-1.164254, 0.347141, -0.0471887, 1, 1, 1, 1, 1,
-1.159216, -0.2844046, -2.422987, 1, 1, 1, 1, 1,
-1.158277, 0.5238718, 0.429258, 1, 1, 1, 1, 1,
-1.147416, 0.646951, -1.665956, 1, 1, 1, 1, 1,
-1.135741, -2.08559, -1.794299, 1, 1, 1, 1, 1,
-1.124522, -0.1041295, 0.1790301, 1, 1, 1, 1, 1,
-1.123666, -0.6362304, -1.064245, 1, 1, 1, 1, 1,
-1.118875, 1.082394, -0.5880605, 1, 1, 1, 1, 1,
-1.099147, -1.694396, -3.071436, 1, 1, 1, 1, 1,
-1.093605, -0.8168432, -1.28744, 1, 1, 1, 1, 1,
-1.087758, 0.1332088, -2.097637, 1, 1, 1, 1, 1,
-1.086797, -0.1539142, -2.796052, 0, 0, 1, 1, 1,
-1.085689, -1.286509, -1.473401, 1, 0, 0, 1, 1,
-1.083321, 0.6073579, -2.046045, 1, 0, 0, 1, 1,
-1.076829, 1.336736, -0.8522509, 1, 0, 0, 1, 1,
-1.07618, 0.3986487, -1.763406, 1, 0, 0, 1, 1,
-1.072703, -1.04925, -3.184727, 1, 0, 0, 1, 1,
-1.070921, -0.5242441, -1.338436, 0, 0, 0, 1, 1,
-1.06541, 0.4414145, -2.046938, 0, 0, 0, 1, 1,
-1.058516, -1.129827, -1.667, 0, 0, 0, 1, 1,
-1.05722, 0.1126034, -0.6393473, 0, 0, 0, 1, 1,
-1.055216, 0.1347023, -3.067881, 0, 0, 0, 1, 1,
-1.050539, -0.7299106, -5.873209, 0, 0, 0, 1, 1,
-1.050324, 0.07187574, -1.311682, 0, 0, 0, 1, 1,
-1.049798, 0.1963603, -2.358526, 1, 1, 1, 1, 1,
-1.046617, 0.7602318, -0.8203025, 1, 1, 1, 1, 1,
-1.033566, 0.4511545, -0.5043982, 1, 1, 1, 1, 1,
-1.032658, 0.4994944, -0.7675484, 1, 1, 1, 1, 1,
-1.028507, -0.7426853, -0.9690956, 1, 1, 1, 1, 1,
-1.0259, 0.668847, -0.009649287, 1, 1, 1, 1, 1,
-1.022171, -2.83865, -1.418956, 1, 1, 1, 1, 1,
-1.0218, -1.75606, -2.177502, 1, 1, 1, 1, 1,
-1.021601, 0.0729166, -0.7032273, 1, 1, 1, 1, 1,
-1.012657, 0.07166497, -2.592333, 1, 1, 1, 1, 1,
-1.010471, 0.8920961, 1.103602, 1, 1, 1, 1, 1,
-1.010163, -0.911415, -1.317031, 1, 1, 1, 1, 1,
-1.000482, 0.6581676, -1.355571, 1, 1, 1, 1, 1,
-0.9968592, 0.4135846, -2.122571, 1, 1, 1, 1, 1,
-0.9960798, 0.4444236, 1.323236, 1, 1, 1, 1, 1,
-0.9873232, 1.245962, -1.989196, 0, 0, 1, 1, 1,
-0.9839178, -0.2491008, -1.224476, 1, 0, 0, 1, 1,
-0.9754385, -0.9248011, -2.99662, 1, 0, 0, 1, 1,
-0.9742612, -0.5414349, -0.5695389, 1, 0, 0, 1, 1,
-0.9742028, -1.019889, -1.830622, 1, 0, 0, 1, 1,
-0.9696218, -0.3334231, -2.71212, 1, 0, 0, 1, 1,
-0.9686231, -0.543268, -1.183362, 0, 0, 0, 1, 1,
-0.9679061, 0.1205825, -1.65348, 0, 0, 0, 1, 1,
-0.9652196, -0.03349344, -1.521258, 0, 0, 0, 1, 1,
-0.9636845, 2.208148, 0.03364398, 0, 0, 0, 1, 1,
-0.9590703, -0.2364274, -2.210061, 0, 0, 0, 1, 1,
-0.9570968, -1.425954, -2.060616, 0, 0, 0, 1, 1,
-0.9569135, 0.1576803, -1.84542, 0, 0, 0, 1, 1,
-0.9534373, -0.9831311, -2.100956, 1, 1, 1, 1, 1,
-0.9435263, 0.5819058, -0.2717437, 1, 1, 1, 1, 1,
-0.9424289, 0.9532606, -0.9031789, 1, 1, 1, 1, 1,
-0.9423404, -0.8647611, -3.459284, 1, 1, 1, 1, 1,
-0.9389563, -1.044766, -1.577098, 1, 1, 1, 1, 1,
-0.9371803, 0.0520032, -0.5853896, 1, 1, 1, 1, 1,
-0.9349101, 0.5882224, -1.751366, 1, 1, 1, 1, 1,
-0.9338116, -1.917229, -3.467721, 1, 1, 1, 1, 1,
-0.9320808, 1.191499, -1.508871, 1, 1, 1, 1, 1,
-0.9298427, 0.058854, -1.451017, 1, 1, 1, 1, 1,
-0.9203729, -1.013449, -1.948995, 1, 1, 1, 1, 1,
-0.920001, 0.8008007, 0.2709358, 1, 1, 1, 1, 1,
-0.9179369, -0.1614019, -2.212603, 1, 1, 1, 1, 1,
-0.9158248, -0.8549051, -2.170316, 1, 1, 1, 1, 1,
-0.9116821, -0.125692, -0.4945534, 1, 1, 1, 1, 1,
-0.9034157, -0.04631925, -1.470726, 0, 0, 1, 1, 1,
-0.9001526, -0.4028666, -2.693222, 1, 0, 0, 1, 1,
-0.898948, 1.374189, -0.5535996, 1, 0, 0, 1, 1,
-0.8968378, -1.542059, -0.6933954, 1, 0, 0, 1, 1,
-0.8963771, -0.3434902, -2.482333, 1, 0, 0, 1, 1,
-0.8951551, -0.01085744, 0.6283211, 1, 0, 0, 1, 1,
-0.8928719, 1.02957, 0.7609912, 0, 0, 0, 1, 1,
-0.8919612, 0.9272562, -1.404911, 0, 0, 0, 1, 1,
-0.8879821, -0.672513, -2.832781, 0, 0, 0, 1, 1,
-0.8818776, -0.04276938, -2.361559, 0, 0, 0, 1, 1,
-0.8793517, 0.05056823, -2.102755, 0, 0, 0, 1, 1,
-0.878174, -0.7949057, -2.428799, 0, 0, 0, 1, 1,
-0.8760374, -0.8416788, -3.193024, 0, 0, 0, 1, 1,
-0.8717652, 2.506128, -0.0117554, 1, 1, 1, 1, 1,
-0.8681848, -2.340089, -1.885528, 1, 1, 1, 1, 1,
-0.862285, -1.085699, -1.158103, 1, 1, 1, 1, 1,
-0.8586082, -0.4773133, -1.184715, 1, 1, 1, 1, 1,
-0.8525769, 1.053624, 1.7877, 1, 1, 1, 1, 1,
-0.8483515, 1.304673, -0.2629579, 1, 1, 1, 1, 1,
-0.8352641, -0.2966959, -1.534913, 1, 1, 1, 1, 1,
-0.8351963, -0.8513994, -0.1260361, 1, 1, 1, 1, 1,
-0.8342769, -0.5048857, -3.124238, 1, 1, 1, 1, 1,
-0.8294993, 0.04579329, -2.764344, 1, 1, 1, 1, 1,
-0.8289412, -0.77887, -3.509533, 1, 1, 1, 1, 1,
-0.8288897, -1.433005, -2.441933, 1, 1, 1, 1, 1,
-0.8268502, 0.8015885, -0.301919, 1, 1, 1, 1, 1,
-0.8265648, 0.6878286, 0.4231333, 1, 1, 1, 1, 1,
-0.8247368, -0.08782302, -1.959401, 1, 1, 1, 1, 1,
-0.8229269, -0.07702474, -1.949693, 0, 0, 1, 1, 1,
-0.8227918, 1.0962, -0.1770806, 1, 0, 0, 1, 1,
-0.8131765, -2.198328, -4.763737, 1, 0, 0, 1, 1,
-0.8120059, 0.595705, -1.122236, 1, 0, 0, 1, 1,
-0.8028983, -0.5135416, -2.766004, 1, 0, 0, 1, 1,
-0.7793615, -0.4637428, -2.69896, 1, 0, 0, 1, 1,
-0.7783029, -2.254219, -1.721135, 0, 0, 0, 1, 1,
-0.7720222, -1.676265, -3.167588, 0, 0, 0, 1, 1,
-0.7692558, -0.8378659, -2.538078, 0, 0, 0, 1, 1,
-0.7604204, -1.589419, -2.354388, 0, 0, 0, 1, 1,
-0.7582398, -0.394887, -1.164306, 0, 0, 0, 1, 1,
-0.7573974, 0.07460358, -0.6868148, 0, 0, 0, 1, 1,
-0.7559888, -1.273874, -2.670441, 0, 0, 0, 1, 1,
-0.7521707, 0.427698, -1.735068, 1, 1, 1, 1, 1,
-0.7520105, -0.3937333, -1.93086, 1, 1, 1, 1, 1,
-0.7464669, 0.02007136, -2.959151, 1, 1, 1, 1, 1,
-0.7423474, 0.04722788, -1.854313, 1, 1, 1, 1, 1,
-0.7401294, -1.254534, -1.677597, 1, 1, 1, 1, 1,
-0.7313023, 0.4056792, -0.9747871, 1, 1, 1, 1, 1,
-0.7230905, 1.156336, -1.469666, 1, 1, 1, 1, 1,
-0.7216079, 1.243036, 0.4989418, 1, 1, 1, 1, 1,
-0.7215766, -1.646123, -3.161779, 1, 1, 1, 1, 1,
-0.7200344, -1.169332, -2.350925, 1, 1, 1, 1, 1,
-0.7197989, 0.9409943, -1.783956, 1, 1, 1, 1, 1,
-0.7180867, -0.1287947, -1.967293, 1, 1, 1, 1, 1,
-0.7157424, -0.2677171, -0.8816684, 1, 1, 1, 1, 1,
-0.7146806, 0.9360461, -0.9977815, 1, 1, 1, 1, 1,
-0.7113782, 0.7745829, -1.023509, 1, 1, 1, 1, 1,
-0.7110859, 0.2955303, -1.431761, 0, 0, 1, 1, 1,
-0.7102478, -0.511076, -3.328121, 1, 0, 0, 1, 1,
-0.7069809, 0.3730299, -1.134643, 1, 0, 0, 1, 1,
-0.7056842, 0.7182499, -0.1205367, 1, 0, 0, 1, 1,
-0.7020894, -0.2739691, -2.803572, 1, 0, 0, 1, 1,
-0.6805313, 0.2611703, -3.243307, 1, 0, 0, 1, 1,
-0.6782216, 0.01407421, -1.216349, 0, 0, 0, 1, 1,
-0.6778107, -1.70418, -3.788827, 0, 0, 0, 1, 1,
-0.6771929, 0.5947776, -0.9488888, 0, 0, 0, 1, 1,
-0.6737421, -0.160138, -2.247653, 0, 0, 0, 1, 1,
-0.6675184, 1.0305, -1.641905, 0, 0, 0, 1, 1,
-0.6645648, -0.2703661, -1.616088, 0, 0, 0, 1, 1,
-0.6637055, -1.612248, -4.005685, 0, 0, 0, 1, 1,
-0.659771, -0.3863501, -2.009581, 1, 1, 1, 1, 1,
-0.6497737, 0.3629165, -0.918254, 1, 1, 1, 1, 1,
-0.6430186, 0.1290096, -0.1916327, 1, 1, 1, 1, 1,
-0.6391128, 1.828427, -0.2693499, 1, 1, 1, 1, 1,
-0.6391002, 1.044947, -1.103918, 1, 1, 1, 1, 1,
-0.6372542, 0.387801, -3.096936, 1, 1, 1, 1, 1,
-0.6365432, 0.2524277, -0.859736, 1, 1, 1, 1, 1,
-0.6311346, -0.523421, -4.175171, 1, 1, 1, 1, 1,
-0.6281594, -1.570156, -4.444622, 1, 1, 1, 1, 1,
-0.6264368, 1.61501, -0.4720242, 1, 1, 1, 1, 1,
-0.6235406, 0.03238273, -2.51173, 1, 1, 1, 1, 1,
-0.621701, -0.7132176, -1.163106, 1, 1, 1, 1, 1,
-0.6201828, 0.05318572, -0.8929576, 1, 1, 1, 1, 1,
-0.6185824, -0.4558541, -2.077601, 1, 1, 1, 1, 1,
-0.6184012, -0.3741682, -0.6252252, 1, 1, 1, 1, 1,
-0.6161683, 0.7568851, -0.5933471, 0, 0, 1, 1, 1,
-0.6140099, -0.02949422, -2.707433, 1, 0, 0, 1, 1,
-0.610076, -0.322762, -2.403967, 1, 0, 0, 1, 1,
-0.5904438, 1.169926, -0.1546075, 1, 0, 0, 1, 1,
-0.5877687, -0.4741189, -2.34583, 1, 0, 0, 1, 1,
-0.5832856, 0.8888114, 2.219585, 1, 0, 0, 1, 1,
-0.5831401, 0.5008532, -2.224667, 0, 0, 0, 1, 1,
-0.5761018, -0.4035777, -3.532838, 0, 0, 0, 1, 1,
-0.5759466, -0.4740666, -3.519553, 0, 0, 0, 1, 1,
-0.5744175, -0.262282, -1.720665, 0, 0, 0, 1, 1,
-0.5681781, -1.618467, -3.554903, 0, 0, 0, 1, 1,
-0.5663372, -0.2074822, -2.906048, 0, 0, 0, 1, 1,
-0.5574317, 0.2156274, -0.8993194, 0, 0, 0, 1, 1,
-0.5558442, 1.410168, -0.3947354, 1, 1, 1, 1, 1,
-0.5463071, 0.8419809, -1.113557, 1, 1, 1, 1, 1,
-0.5439398, -0.03666181, -1.542903, 1, 1, 1, 1, 1,
-0.5425205, -2.153746, -2.855219, 1, 1, 1, 1, 1,
-0.540895, 0.01394377, -1.562234, 1, 1, 1, 1, 1,
-0.5349352, 1.131587, -1.569536, 1, 1, 1, 1, 1,
-0.5340078, -0.1331017, -1.072876, 1, 1, 1, 1, 1,
-0.5318666, 2.35854, -0.9734123, 1, 1, 1, 1, 1,
-0.5307551, 0.765779, -2.359616, 1, 1, 1, 1, 1,
-0.5287614, 0.8540232, -0.8169391, 1, 1, 1, 1, 1,
-0.5238919, 0.1317949, -1.182124, 1, 1, 1, 1, 1,
-0.5227559, 0.6183339, -1.291891, 1, 1, 1, 1, 1,
-0.5172059, 2.378675, -1.396401, 1, 1, 1, 1, 1,
-0.5153187, -0.1784234, -0.2954339, 1, 1, 1, 1, 1,
-0.511418, -0.2068993, -1.921272, 1, 1, 1, 1, 1,
-0.5084572, -1.330959, -1.715255, 0, 0, 1, 1, 1,
-0.5005641, -0.4777437, -2.518337, 1, 0, 0, 1, 1,
-0.4952834, 0.186112, -0.5032479, 1, 0, 0, 1, 1,
-0.49175, -1.126167, -2.287421, 1, 0, 0, 1, 1,
-0.4911275, -0.6860527, -1.274992, 1, 0, 0, 1, 1,
-0.4900234, -1.272171, -0.3004433, 1, 0, 0, 1, 1,
-0.4881115, -0.3778947, -1.487023, 0, 0, 0, 1, 1,
-0.4851578, -0.001280043, -0.4328062, 0, 0, 0, 1, 1,
-0.4798759, -1.138583, -3.568345, 0, 0, 0, 1, 1,
-0.4740974, -0.7597398, -3.384156, 0, 0, 0, 1, 1,
-0.4715894, -0.8351976, -2.537217, 0, 0, 0, 1, 1,
-0.4703835, -0.352935, -1.779768, 0, 0, 0, 1, 1,
-0.4696861, 0.3324763, -1.517292, 0, 0, 0, 1, 1,
-0.4690142, 0.3941481, 0.4100211, 1, 1, 1, 1, 1,
-0.4644785, 0.7767243, -1.295392, 1, 1, 1, 1, 1,
-0.4576128, -0.4848172, -0.8806322, 1, 1, 1, 1, 1,
-0.455186, 1.184135, -0.2048184, 1, 1, 1, 1, 1,
-0.4487417, -0.4979125, 0.5632758, 1, 1, 1, 1, 1,
-0.447423, 0.6962087, -0.4606231, 1, 1, 1, 1, 1,
-0.4388984, -2.613435, -4.993916, 1, 1, 1, 1, 1,
-0.4270603, -0.4144117, -2.771882, 1, 1, 1, 1, 1,
-0.425007, -1.013662, -1.846014, 1, 1, 1, 1, 1,
-0.4220261, -0.01728695, -0.6859739, 1, 1, 1, 1, 1,
-0.4210586, -0.7040107, -1.736944, 1, 1, 1, 1, 1,
-0.4196172, -0.1646782, -0.4418276, 1, 1, 1, 1, 1,
-0.4178097, 1.773476, 1.463274, 1, 1, 1, 1, 1,
-0.4114954, -0.215651, -4.320296, 1, 1, 1, 1, 1,
-0.4089782, 0.4623398, -1.471176, 1, 1, 1, 1, 1,
-0.4085731, -0.7445233, -3.912843, 0, 0, 1, 1, 1,
-0.3999516, -1.037649, -1.989709, 1, 0, 0, 1, 1,
-0.3994094, -0.8089917, -3.196552, 1, 0, 0, 1, 1,
-0.3890348, -0.3097856, -1.845302, 1, 0, 0, 1, 1,
-0.3882165, -0.9154024, 0.7682118, 1, 0, 0, 1, 1,
-0.3873388, 1.804281, -0.5549079, 1, 0, 0, 1, 1,
-0.3865914, -0.6704515, 0.6961711, 0, 0, 0, 1, 1,
-0.3819881, 0.4159991, -0.2034608, 0, 0, 0, 1, 1,
-0.3803887, 0.03567177, -1.069542, 0, 0, 0, 1, 1,
-0.3727157, -0.8614168, -3.585999, 0, 0, 0, 1, 1,
-0.372257, 0.07311092, -1.655222, 0, 0, 0, 1, 1,
-0.3675791, -0.4433552, -2.507435, 0, 0, 0, 1, 1,
-0.3669347, 0.7446307, -0.09647418, 0, 0, 0, 1, 1,
-0.3658913, 0.9529688, -0.760412, 1, 1, 1, 1, 1,
-0.3650072, 0.1031682, -0.8392277, 1, 1, 1, 1, 1,
-0.3637594, -0.1997154, -2.341526, 1, 1, 1, 1, 1,
-0.3617707, 3.042665, -0.4499223, 1, 1, 1, 1, 1,
-0.3578979, -1.271581, -4.114053, 1, 1, 1, 1, 1,
-0.3569311, -1.527604, -3.20273, 1, 1, 1, 1, 1,
-0.3566468, -0.4974909, -3.189255, 1, 1, 1, 1, 1,
-0.3556259, 0.4703736, -0.6345999, 1, 1, 1, 1, 1,
-0.3524635, 0.53712, 1.447436, 1, 1, 1, 1, 1,
-0.3499831, 0.401429, -0.8105621, 1, 1, 1, 1, 1,
-0.3474407, -0.5639622, -1.841406, 1, 1, 1, 1, 1,
-0.3471387, 1.063992, -0.04912562, 1, 1, 1, 1, 1,
-0.343834, 0.2901189, 1.041332, 1, 1, 1, 1, 1,
-0.3433234, -1.700005, -3.002446, 1, 1, 1, 1, 1,
-0.3417917, -0.5480179, -1.767766, 1, 1, 1, 1, 1,
-0.3381837, 0.7919066, -1.310593, 0, 0, 1, 1, 1,
-0.3346, -1.644167, -1.850671, 1, 0, 0, 1, 1,
-0.3331629, 0.7399255, 0.3645578, 1, 0, 0, 1, 1,
-0.3299217, 1.338272, -0.1761926, 1, 0, 0, 1, 1,
-0.3280286, 1.02341, 1.929602, 1, 0, 0, 1, 1,
-0.3245732, -0.3302549, -1.892276, 1, 0, 0, 1, 1,
-0.3239077, -0.2709277, -1.71962, 0, 0, 0, 1, 1,
-0.3228728, -0.07230494, -2.383249, 0, 0, 0, 1, 1,
-0.321546, 0.4136546, -2.146702, 0, 0, 0, 1, 1,
-0.3206389, -0.06796622, -3.451874, 0, 0, 0, 1, 1,
-0.3205777, 1.048989, -0.9371149, 0, 0, 0, 1, 1,
-0.3205771, 1.047108, 2.334851, 0, 0, 0, 1, 1,
-0.315161, -0.0354166, -1.583415, 0, 0, 0, 1, 1,
-0.3117738, 0.2828742, -0.3478192, 1, 1, 1, 1, 1,
-0.3115378, -1.47084, -3.220448, 1, 1, 1, 1, 1,
-0.3114989, -0.2778856, -2.40909, 1, 1, 1, 1, 1,
-0.3097501, -0.2521701, -1.627005, 1, 1, 1, 1, 1,
-0.30575, 0.4336224, -0.5433836, 1, 1, 1, 1, 1,
-0.3045533, -0.1275943, -1.887129, 1, 1, 1, 1, 1,
-0.2973573, -0.3490129, -3.064739, 1, 1, 1, 1, 1,
-0.2961611, 0.933881, 0.6190032, 1, 1, 1, 1, 1,
-0.2881667, 0.532933, -1.309199, 1, 1, 1, 1, 1,
-0.2807153, 0.1330541, -0.975929, 1, 1, 1, 1, 1,
-0.2803439, -2.238066, -3.526144, 1, 1, 1, 1, 1,
-0.2799789, -0.5588486, -4.572508, 1, 1, 1, 1, 1,
-0.27619, -0.2789691, -2.581255, 1, 1, 1, 1, 1,
-0.2750759, -0.003934733, -2.229072, 1, 1, 1, 1, 1,
-0.2705746, 0.6700348, -1.081461, 1, 1, 1, 1, 1,
-0.2674178, -0.9579337, -1.400251, 0, 0, 1, 1, 1,
-0.2645299, -0.2021319, -2.595003, 1, 0, 0, 1, 1,
-0.2640511, 0.3480773, -1.481889, 1, 0, 0, 1, 1,
-0.2636952, -0.8770719, -3.241188, 1, 0, 0, 1, 1,
-0.2621197, -0.1545726, -0.5713611, 1, 0, 0, 1, 1,
-0.260251, -1.194083, -1.410007, 1, 0, 0, 1, 1,
-0.2598761, 1.594805, 1.159719, 0, 0, 0, 1, 1,
-0.2568131, 0.468469, 0.2395508, 0, 0, 0, 1, 1,
-0.2517959, 0.08014359, 0.108548, 0, 0, 0, 1, 1,
-0.2467957, -0.1102728, -1.777696, 0, 0, 0, 1, 1,
-0.2460666, 1.082758, -0.5407292, 0, 0, 0, 1, 1,
-0.2449757, 0.3510104, 0.331941, 0, 0, 0, 1, 1,
-0.2423408, -0.3123877, -1.568444, 0, 0, 0, 1, 1,
-0.2359909, -0.9808007, -4.248518, 1, 1, 1, 1, 1,
-0.2351215, -1.472286, -2.571193, 1, 1, 1, 1, 1,
-0.2347758, -0.04779303, -1.397077, 1, 1, 1, 1, 1,
-0.2323798, 0.08108453, -0.5031587, 1, 1, 1, 1, 1,
-0.2299387, 0.4841973, 0.1880019, 1, 1, 1, 1, 1,
-0.2294855, 1.599751, -2.073383, 1, 1, 1, 1, 1,
-0.2290823, -1.512622, -3.668692, 1, 1, 1, 1, 1,
-0.2262204, 0.8175268, -0.9142075, 1, 1, 1, 1, 1,
-0.2199222, -1.237339, -5.564092, 1, 1, 1, 1, 1,
-0.2184521, 0.7109329, -1.411933, 1, 1, 1, 1, 1,
-0.2175637, -2.083701, -4.271077, 1, 1, 1, 1, 1,
-0.2169792, -0.7452414, -2.453244, 1, 1, 1, 1, 1,
-0.2161123, -0.1667919, -3.546151, 1, 1, 1, 1, 1,
-0.2120119, 0.8481111, -0.8186777, 1, 1, 1, 1, 1,
-0.2088999, 1.006593, -0.2208603, 1, 1, 1, 1, 1,
-0.2037508, -0.6608878, -2.21586, 0, 0, 1, 1, 1,
-0.1992341, -2.367067, -2.00551, 1, 0, 0, 1, 1,
-0.193703, -0.7496009, -2.189673, 1, 0, 0, 1, 1,
-0.1931199, -0.3613509, -1.062135, 1, 0, 0, 1, 1,
-0.1921309, 1.699367, -0.03874284, 1, 0, 0, 1, 1,
-0.1878658, -0.5238488, -3.379022, 1, 0, 0, 1, 1,
-0.1841097, -1.629214, -2.22072, 0, 0, 0, 1, 1,
-0.1820632, -0.4799834, -2.441535, 0, 0, 0, 1, 1,
-0.181791, -0.359647, -2.599804, 0, 0, 0, 1, 1,
-0.181473, -0.8426759, -3.337807, 0, 0, 0, 1, 1,
-0.1806812, 0.3058525, -0.5666905, 0, 0, 0, 1, 1,
-0.1753827, 0.7674195, -0.331406, 0, 0, 0, 1, 1,
-0.1752502, 1.447616, -1.32888, 0, 0, 0, 1, 1,
-0.1734464, -0.8650605, -3.718713, 1, 1, 1, 1, 1,
-0.1729731, -0.8283625, -4.627729, 1, 1, 1, 1, 1,
-0.1728356, 0.9406799, -0.1064687, 1, 1, 1, 1, 1,
-0.1724736, -1.070366, -3.036475, 1, 1, 1, 1, 1,
-0.1723871, -1.311751, -3.153184, 1, 1, 1, 1, 1,
-0.1717208, -1.713125, -2.096309, 1, 1, 1, 1, 1,
-0.1704979, 0.8822991, -0.367818, 1, 1, 1, 1, 1,
-0.1640286, 3.355273, -0.6244646, 1, 1, 1, 1, 1,
-0.1638436, 0.2926898, -0.1514183, 1, 1, 1, 1, 1,
-0.1505474, 0.3684503, -1.05188, 1, 1, 1, 1, 1,
-0.150444, -0.8088519, -4.056167, 1, 1, 1, 1, 1,
-0.1468377, 0.5107954, 0.2219068, 1, 1, 1, 1, 1,
-0.1444586, 0.03228201, -2.135802, 1, 1, 1, 1, 1,
-0.1386964, 0.1377213, -2.142829, 1, 1, 1, 1, 1,
-0.1325367, 0.2992411, 0.5880207, 1, 1, 1, 1, 1,
-0.1313617, 0.08223703, -1.033962, 0, 0, 1, 1, 1,
-0.1313492, 0.7652364, 0.3951702, 1, 0, 0, 1, 1,
-0.1236182, -0.4492506, -2.010522, 1, 0, 0, 1, 1,
-0.122809, -0.5258055, -2.427836, 1, 0, 0, 1, 1,
-0.108539, 2.198146, -0.3443826, 1, 0, 0, 1, 1,
-0.1045365, -0.4631135, -2.297871, 1, 0, 0, 1, 1,
-0.1002393, -0.7478871, -3.049384, 0, 0, 0, 1, 1,
-0.100151, 0.4699243, -0.7598721, 0, 0, 0, 1, 1,
-0.09976754, 1.2666, -0.2051837, 0, 0, 0, 1, 1,
-0.09365468, -1.546839, -2.724489, 0, 0, 0, 1, 1,
-0.09308476, 0.5327417, 0.9703707, 0, 0, 0, 1, 1,
-0.0843142, 1.565858, 0.06307504, 0, 0, 0, 1, 1,
-0.08061354, -0.2390367, -3.352026, 0, 0, 0, 1, 1,
-0.07867642, 1.798155, -1.86445, 1, 1, 1, 1, 1,
-0.07475998, -0.2903583, -1.827653, 1, 1, 1, 1, 1,
-0.0730123, 0.367517, -0.2997632, 1, 1, 1, 1, 1,
-0.07242131, -0.275207, -3.499055, 1, 1, 1, 1, 1,
-0.07096079, -0.2907205, -4.298631, 1, 1, 1, 1, 1,
-0.06784456, 0.3904657, 0.2318084, 1, 1, 1, 1, 1,
-0.06689496, -0.8514994, -2.906296, 1, 1, 1, 1, 1,
-0.06593949, 0.9035059, -0.211281, 1, 1, 1, 1, 1,
-0.06385615, -0.2320292, -2.972205, 1, 1, 1, 1, 1,
-0.05794853, 0.9630662, 1.263725, 1, 1, 1, 1, 1,
-0.05391447, 0.1532133, 0.07145981, 1, 1, 1, 1, 1,
-0.05050157, -1.487692, -3.793667, 1, 1, 1, 1, 1,
-0.04484669, 1.583823, -0.1447485, 1, 1, 1, 1, 1,
-0.04452157, 1.509688, 0.8536743, 1, 1, 1, 1, 1,
-0.04339406, 0.698373, 0.9591216, 1, 1, 1, 1, 1,
-0.0379613, -0.6659723, -3.729103, 0, 0, 1, 1, 1,
-0.03525069, 1.29477, -0.4710753, 1, 0, 0, 1, 1,
-0.03431269, -1.380069, -2.891491, 1, 0, 0, 1, 1,
-0.03268339, -0.9512146, -3.485524, 1, 0, 0, 1, 1,
-0.03210839, 0.2205487, 0.04827182, 1, 0, 0, 1, 1,
-0.03056826, -0.9581045, -2.35993, 1, 0, 0, 1, 1,
-0.02656541, -0.100573, -2.082785, 0, 0, 0, 1, 1,
-0.02474345, -0.999121, -1.965005, 0, 0, 0, 1, 1,
-0.02183627, 0.2761504, -0.8721045, 0, 0, 0, 1, 1,
-0.01975696, -0.4436045, -3.549705, 0, 0, 0, 1, 1,
-0.01858531, -0.4319603, -3.367048, 0, 0, 0, 1, 1,
-0.01315423, 0.6997528, 1.023708, 0, 0, 0, 1, 1,
-0.006959162, -0.1818503, -2.246903, 0, 0, 0, 1, 1,
-0.001592102, -0.03399325, -4.068196, 1, 1, 1, 1, 1,
0.003325448, -0.6793196, 3.36612, 1, 1, 1, 1, 1,
0.003361848, 0.4066609, -0.4780983, 1, 1, 1, 1, 1,
0.005387401, -0.9807466, 4.388906, 1, 1, 1, 1, 1,
0.008301095, -1.049852, 2.851878, 1, 1, 1, 1, 1,
0.01225789, -1.933965, 1.850388, 1, 1, 1, 1, 1,
0.01328708, -1.276977, 5.174444, 1, 1, 1, 1, 1,
0.01343124, 0.2464548, 1.261083, 1, 1, 1, 1, 1,
0.0149801, -0.5704294, 4.213404, 1, 1, 1, 1, 1,
0.01634327, 1.778002, 1.4842, 1, 1, 1, 1, 1,
0.01705712, -1.151529, 1.816466, 1, 1, 1, 1, 1,
0.01739256, 0.00670724, 0.6854219, 1, 1, 1, 1, 1,
0.02306733, -0.3939539, 2.324947, 1, 1, 1, 1, 1,
0.03230312, 2.338744, 1.60774, 1, 1, 1, 1, 1,
0.03329866, -1.407177, 2.431603, 1, 1, 1, 1, 1,
0.03680265, 0.6479821, -1.36569, 0, 0, 1, 1, 1,
0.03722704, -0.689513, 2.76399, 1, 0, 0, 1, 1,
0.04654003, 0.6913339, -1.183205, 1, 0, 0, 1, 1,
0.04940263, -0.8537306, 2.665536, 1, 0, 0, 1, 1,
0.05090566, 1.427071, -0.04547446, 1, 0, 0, 1, 1,
0.05322422, 1.712943, 0.3931674, 1, 0, 0, 1, 1,
0.05551528, -0.9000719, 4.945991, 0, 0, 0, 1, 1,
0.05635056, -1.528327, 3.655856, 0, 0, 0, 1, 1,
0.05830095, 0.2651316, 0.7678847, 0, 0, 0, 1, 1,
0.06144897, 0.2183072, -0.9721068, 0, 0, 0, 1, 1,
0.07045543, 0.7705317, 0.6447917, 0, 0, 0, 1, 1,
0.07075636, 2.326119, -0.3451273, 0, 0, 0, 1, 1,
0.07195467, 0.4646504, 1.396234, 0, 0, 0, 1, 1,
0.08114228, -0.03671375, 2.079677, 1, 1, 1, 1, 1,
0.08114508, -0.4808649, 3.708631, 1, 1, 1, 1, 1,
0.08296117, -0.1165686, 2.632172, 1, 1, 1, 1, 1,
0.08356857, 1.09684, -0.2556931, 1, 1, 1, 1, 1,
0.08508772, -0.7048569, 3.957799, 1, 1, 1, 1, 1,
0.08555832, 2.41477, 1.822909, 1, 1, 1, 1, 1,
0.0857119, -0.140689, 2.00362, 1, 1, 1, 1, 1,
0.08829226, 0.3589801, 0.918228, 1, 1, 1, 1, 1,
0.09281198, 0.0197939, 1.58122, 1, 1, 1, 1, 1,
0.09353799, 0.9276621, 1.922062, 1, 1, 1, 1, 1,
0.09517864, 0.8547474, 0.8011338, 1, 1, 1, 1, 1,
0.09681984, 0.07325087, 0.3616711, 1, 1, 1, 1, 1,
0.09835915, 1.701037, -0.2767343, 1, 1, 1, 1, 1,
0.1006809, 0.9339815, -0.1279251, 1, 1, 1, 1, 1,
0.1101358, -0.5627838, 2.661292, 1, 1, 1, 1, 1,
0.1144987, -1.806273, 2.22119, 0, 0, 1, 1, 1,
0.117977, -0.05396105, 2.177205, 1, 0, 0, 1, 1,
0.121928, 0.346128, 1.720374, 1, 0, 0, 1, 1,
0.12235, 1.426368, -0.3128691, 1, 0, 0, 1, 1,
0.1243896, -1.152998, 3.275714, 1, 0, 0, 1, 1,
0.1256952, -0.1469553, 2.557338, 1, 0, 0, 1, 1,
0.128307, 0.5849023, -0.9804741, 0, 0, 0, 1, 1,
0.1289949, 0.3599351, -0.7262696, 0, 0, 0, 1, 1,
0.1299244, -0.7195541, 2.485393, 0, 0, 0, 1, 1,
0.1329744, 1.053932, -0.4745803, 0, 0, 0, 1, 1,
0.1330798, -1.531773, 4.322726, 0, 0, 0, 1, 1,
0.1344606, 0.8263513, -1.411358, 0, 0, 0, 1, 1,
0.1354615, -0.7433492, 2.327624, 0, 0, 0, 1, 1,
0.1363757, 1.431724, -0.5916013, 1, 1, 1, 1, 1,
0.137307, -0.3097459, 2.22843, 1, 1, 1, 1, 1,
0.1411199, 1.189158, 0.2476057, 1, 1, 1, 1, 1,
0.1421115, -0.6997324, 3.374673, 1, 1, 1, 1, 1,
0.1476399, 1.075727, 0.1911575, 1, 1, 1, 1, 1,
0.1476608, 0.1541079, 1.0811, 1, 1, 1, 1, 1,
0.1490588, 1.65646, -0.365134, 1, 1, 1, 1, 1,
0.1496705, -0.4191063, 3.406948, 1, 1, 1, 1, 1,
0.15052, 0.02754822, 1.824969, 1, 1, 1, 1, 1,
0.1513197, -0.505421, 4.073023, 1, 1, 1, 1, 1,
0.1523843, -1.759383, 2.730498, 1, 1, 1, 1, 1,
0.1546309, 1.24003, 0.06777882, 1, 1, 1, 1, 1,
0.1588022, 0.8269255, 0.7173036, 1, 1, 1, 1, 1,
0.1609114, 0.09713551, 0.8792636, 1, 1, 1, 1, 1,
0.1617438, 0.8672942, -0.9759769, 1, 1, 1, 1, 1,
0.1644982, -0.9243669, 3.637263, 0, 0, 1, 1, 1,
0.1653278, -0.8691849, 3.192243, 1, 0, 0, 1, 1,
0.1672353, -0.4645446, 3.259656, 1, 0, 0, 1, 1,
0.1675557, 0.7364847, -0.913197, 1, 0, 0, 1, 1,
0.1726615, -0.2028073, 2.207661, 1, 0, 0, 1, 1,
0.1730223, -1.275267, 3.144035, 1, 0, 0, 1, 1,
0.1731022, 0.1137817, 1.135936, 0, 0, 0, 1, 1,
0.1732293, -0.4027775, 2.604618, 0, 0, 0, 1, 1,
0.1755867, -0.1773469, 2.923579, 0, 0, 0, 1, 1,
0.1757625, -0.9511487, 4.135574, 0, 0, 0, 1, 1,
0.1806326, 0.1761204, 1.617208, 0, 0, 0, 1, 1,
0.1838359, -0.740842, 2.797931, 0, 0, 0, 1, 1,
0.1869892, -0.2102332, 2.092702, 0, 0, 0, 1, 1,
0.1921234, 1.377212, 0.7105877, 1, 1, 1, 1, 1,
0.1941914, -0.6945548, 2.532055, 1, 1, 1, 1, 1,
0.2036951, -0.9918041, 3.273501, 1, 1, 1, 1, 1,
0.2104548, 0.1528477, -2.195528, 1, 1, 1, 1, 1,
0.2198086, -0.2999541, 2.075741, 1, 1, 1, 1, 1,
0.2209929, -0.4163026, 2.237922, 1, 1, 1, 1, 1,
0.2214914, 0.7898382, -1.217565, 1, 1, 1, 1, 1,
0.2236822, -0.2845022, 3.147855, 1, 1, 1, 1, 1,
0.2334443, -1.922041, 2.377579, 1, 1, 1, 1, 1,
0.2349815, 0.2007354, 0.8490231, 1, 1, 1, 1, 1,
0.2350022, 1.81906, -1.36377, 1, 1, 1, 1, 1,
0.2486852, -1.148498, 2.672628, 1, 1, 1, 1, 1,
0.2494663, -1.136146, 3.370892, 1, 1, 1, 1, 1,
0.2496285, 0.7166574, 0.9919751, 1, 1, 1, 1, 1,
0.2531694, -1.014503, 2.574092, 1, 1, 1, 1, 1,
0.2539116, -0.8003156, 5.368538, 0, 0, 1, 1, 1,
0.2554093, -0.1404229, 4.308067, 1, 0, 0, 1, 1,
0.2571598, 1.384637, 0.7221943, 1, 0, 0, 1, 1,
0.257976, 2.089303, 2.232049, 1, 0, 0, 1, 1,
0.259458, -0.7194121, 1.410895, 1, 0, 0, 1, 1,
0.2679591, -0.6846055, 3.509395, 1, 0, 0, 1, 1,
0.2690896, 1.461554, 1.792604, 0, 0, 0, 1, 1,
0.2702979, -1.318492, 3.831623, 0, 0, 0, 1, 1,
0.270595, -0.07475397, 2.715001, 0, 0, 0, 1, 1,
0.273052, 0.6694818, 1.867758, 0, 0, 0, 1, 1,
0.2759642, 1.409253, 0.9132899, 0, 0, 0, 1, 1,
0.2816071, 0.8503579, -0.6310844, 0, 0, 0, 1, 1,
0.2831716, 0.1289024, 3.380602, 0, 0, 0, 1, 1,
0.2839977, -0.5831103, 2.802014, 1, 1, 1, 1, 1,
0.2890828, -0.4517253, 0.0862424, 1, 1, 1, 1, 1,
0.2930022, -1.350253, 1.738718, 1, 1, 1, 1, 1,
0.2942262, 0.7992096, 2.445156, 1, 1, 1, 1, 1,
0.2950399, 1.547587, 0.8015027, 1, 1, 1, 1, 1,
0.3002561, 0.3172178, 0.03539846, 1, 1, 1, 1, 1,
0.300354, 0.2627971, 1.439374, 1, 1, 1, 1, 1,
0.3025899, -1.100314, 2.240035, 1, 1, 1, 1, 1,
0.3027625, -0.8902594, 1.727576, 1, 1, 1, 1, 1,
0.3068726, -1.126031, 3.621691, 1, 1, 1, 1, 1,
0.309569, -0.405438, 2.52468, 1, 1, 1, 1, 1,
0.311267, 0.8676776, 1.211945, 1, 1, 1, 1, 1,
0.3160309, -1.782328, 2.632101, 1, 1, 1, 1, 1,
0.3217351, -1.144907, 1.376591, 1, 1, 1, 1, 1,
0.3251444, 0.05350147, 1.470654, 1, 1, 1, 1, 1,
0.3347459, 0.5240629, -1.250652, 0, 0, 1, 1, 1,
0.3355597, 0.8559854, 0.5990391, 1, 0, 0, 1, 1,
0.3520719, -0.9711829, 2.912009, 1, 0, 0, 1, 1,
0.3567162, -1.23672, 1.401369, 1, 0, 0, 1, 1,
0.3582045, 1.085495, 0.2988829, 1, 0, 0, 1, 1,
0.3587382, -1.040145, 3.284019, 1, 0, 0, 1, 1,
0.3646445, -1.703425, 1.982726, 0, 0, 0, 1, 1,
0.3680436, -0.5366904, 1.736546, 0, 0, 0, 1, 1,
0.3688575, -0.7288543, 0.8581188, 0, 0, 0, 1, 1,
0.3691278, -1.031465, 2.376349, 0, 0, 0, 1, 1,
0.3701261, -0.6198315, 3.127759, 0, 0, 0, 1, 1,
0.373062, -0.04513696, 2.180282, 0, 0, 0, 1, 1,
0.3766517, 0.941754, 0.08865353, 0, 0, 0, 1, 1,
0.3781092, 0.156516, 1.663238, 1, 1, 1, 1, 1,
0.3781235, -0.08472569, 1.687452, 1, 1, 1, 1, 1,
0.3788739, 0.01972436, 0.4453627, 1, 1, 1, 1, 1,
0.3804125, 1.445353, 0.7827151, 1, 1, 1, 1, 1,
0.3842488, 0.01148808, 1.28668, 1, 1, 1, 1, 1,
0.3867252, -1.251188, 1.553812, 1, 1, 1, 1, 1,
0.3883656, -0.205354, 5.236474, 1, 1, 1, 1, 1,
0.3917222, 1.021349, -0.7387986, 1, 1, 1, 1, 1,
0.3928365, 0.3132435, 0.656355, 1, 1, 1, 1, 1,
0.3932811, -0.5881717, 2.191662, 1, 1, 1, 1, 1,
0.4045418, -0.7935623, 1.369985, 1, 1, 1, 1, 1,
0.4089168, 0.3629036, -1.25141, 1, 1, 1, 1, 1,
0.4132062, -0.7463402, 1.342959, 1, 1, 1, 1, 1,
0.41616, -1.857588, 2.499503, 1, 1, 1, 1, 1,
0.4243741, 0.7064046, 1.02134, 1, 1, 1, 1, 1,
0.4246067, -0.4601023, 1.478787, 0, 0, 1, 1, 1,
0.4258032, 0.6398694, -0.07004866, 1, 0, 0, 1, 1,
0.428147, -0.254661, 2.682054, 1, 0, 0, 1, 1,
0.4315499, -0.5157888, -0.252946, 1, 0, 0, 1, 1,
0.4317407, -1.686412, 3.020187, 1, 0, 0, 1, 1,
0.4322741, -0.7723215, 2.885208, 1, 0, 0, 1, 1,
0.4328638, -1.147203, 2.330316, 0, 0, 0, 1, 1,
0.4333032, -1.027429, 0.9739414, 0, 0, 0, 1, 1,
0.4363434, 0.8635899, 1.545452, 0, 0, 0, 1, 1,
0.437043, -1.283831, 2.156036, 0, 0, 0, 1, 1,
0.4377834, -0.0106228, 1.927102, 0, 0, 0, 1, 1,
0.4389932, -0.1409896, 3.150801, 0, 0, 0, 1, 1,
0.4449644, 0.4769115, -0.218776, 0, 0, 0, 1, 1,
0.4469121, -1.328401, 3.160606, 1, 1, 1, 1, 1,
0.4495365, -0.4300932, 1.845588, 1, 1, 1, 1, 1,
0.4506898, -0.9672751, 2.008292, 1, 1, 1, 1, 1,
0.4527113, -1.700695, 3.316654, 1, 1, 1, 1, 1,
0.4542155, 0.9280794, -0.2526976, 1, 1, 1, 1, 1,
0.455411, 1.787968, 2.208768, 1, 1, 1, 1, 1,
0.4563112, 0.4506366, 0.6802972, 1, 1, 1, 1, 1,
0.4576473, -0.19957, 1.162303, 1, 1, 1, 1, 1,
0.4618328, 0.2211098, 1.34353, 1, 1, 1, 1, 1,
0.463803, 1.184645, 0.4360451, 1, 1, 1, 1, 1,
0.4671299, 0.2797075, -0.4864053, 1, 1, 1, 1, 1,
0.4673878, -0.06735007, 2.03452, 1, 1, 1, 1, 1,
0.4716797, -0.4037806, 1.498883, 1, 1, 1, 1, 1,
0.4721777, -0.4310104, 1.936994, 1, 1, 1, 1, 1,
0.4746281, -0.3324995, 2.935187, 1, 1, 1, 1, 1,
0.4777989, -1.896425, 2.062167, 0, 0, 1, 1, 1,
0.478264, 0.7146057, 1.012236, 1, 0, 0, 1, 1,
0.4818797, -0.539427, 1.123042, 1, 0, 0, 1, 1,
0.4837814, -0.2145476, 1.05389, 1, 0, 0, 1, 1,
0.4879151, -0.7151664, 2.108003, 1, 0, 0, 1, 1,
0.4970773, 0.5993969, -1.084876, 1, 0, 0, 1, 1,
0.5026039, -1.40336, 3.335775, 0, 0, 0, 1, 1,
0.5027608, 0.7210535, -0.8563609, 0, 0, 0, 1, 1,
0.5063767, -0.4370533, 1.757032, 0, 0, 0, 1, 1,
0.5090894, 0.9514139, 0.7614009, 0, 0, 0, 1, 1,
0.5127661, 0.06953271, 1.608459, 0, 0, 0, 1, 1,
0.5136684, 0.3678654, 1.451387, 0, 0, 0, 1, 1,
0.5153189, 1.695336, 0.7671618, 0, 0, 0, 1, 1,
0.5158599, 0.9506125, -1.299565, 1, 1, 1, 1, 1,
0.5177647, -0.3105362, 1.178171, 1, 1, 1, 1, 1,
0.5258697, 0.6185035, 0.7530535, 1, 1, 1, 1, 1,
0.5267275, -1.097932, 3.279513, 1, 1, 1, 1, 1,
0.5317756, 0.845415, 0.3625698, 1, 1, 1, 1, 1,
0.5325216, -0.03214458, 1.826986, 1, 1, 1, 1, 1,
0.5453935, -1.558143, 4.356703, 1, 1, 1, 1, 1,
0.5460739, 0.535675, 3.204863, 1, 1, 1, 1, 1,
0.5477199, -0.8678265, 1.494839, 1, 1, 1, 1, 1,
0.5535826, -1.555585, 2.999211, 1, 1, 1, 1, 1,
0.5552753, -0.3829861, 1.967708, 1, 1, 1, 1, 1,
0.5569572, 0.2846842, 1.175595, 1, 1, 1, 1, 1,
0.562405, -0.3945809, 3.205199, 1, 1, 1, 1, 1,
0.5656231, 0.4286815, -0.7295657, 1, 1, 1, 1, 1,
0.57027, -1.196728, 2.32347, 1, 1, 1, 1, 1,
0.5712039, -2.068504, 1.941361, 0, 0, 1, 1, 1,
0.5784693, 1.227519, 1.425486, 1, 0, 0, 1, 1,
0.5810781, -0.3228219, 2.542967, 1, 0, 0, 1, 1,
0.5822819, -0.08875658, 1.905357, 1, 0, 0, 1, 1,
0.5825204, -0.5594947, 1.848313, 1, 0, 0, 1, 1,
0.5826584, 1.35466, 0.4714099, 1, 0, 0, 1, 1,
0.5830587, 0.6529998, 0.1118861, 0, 0, 0, 1, 1,
0.5895085, 0.8424059, 1.162979, 0, 0, 0, 1, 1,
0.5896725, -0.8421909, 3.345513, 0, 0, 0, 1, 1,
0.5916023, 0.2589612, 1.624631, 0, 0, 0, 1, 1,
0.5987726, -0.9008353, 2.061507, 0, 0, 0, 1, 1,
0.5992129, -0.2838108, 1.473448, 0, 0, 0, 1, 1,
0.5993188, -0.6030701, 2.974444, 0, 0, 0, 1, 1,
0.6000608, -1.263617, 3.030226, 1, 1, 1, 1, 1,
0.6003607, 0.06452587, 1.528164, 1, 1, 1, 1, 1,
0.6017175, -0.887082, 2.861228, 1, 1, 1, 1, 1,
0.6028929, -1.738784, 3.539411, 1, 1, 1, 1, 1,
0.6072217, 1.548903, -1.140529, 1, 1, 1, 1, 1,
0.6162733, -1.471461, 2.662475, 1, 1, 1, 1, 1,
0.6180515, -2.118524, 2.477108, 1, 1, 1, 1, 1,
0.6183668, -1.243455, 1.910783, 1, 1, 1, 1, 1,
0.6225958, -0.65626, 1.516814, 1, 1, 1, 1, 1,
0.6324042, -1.836499, 2.663222, 1, 1, 1, 1, 1,
0.6356786, 0.1417455, 1.796901, 1, 1, 1, 1, 1,
0.6425242, 0.6711959, 1.852682, 1, 1, 1, 1, 1,
0.6437933, -0.3296075, 0.07782269, 1, 1, 1, 1, 1,
0.648508, -2.221603, 2.501863, 1, 1, 1, 1, 1,
0.6513681, 0.0344893, 1.073021, 1, 1, 1, 1, 1,
0.6520081, -0.7373623, 2.573346, 0, 0, 1, 1, 1,
0.657894, 1.1421, 1.389093, 1, 0, 0, 1, 1,
0.6645006, -1.098217, 2.157718, 1, 0, 0, 1, 1,
0.66489, -0.221115, 4.019619, 1, 0, 0, 1, 1,
0.6689199, 1.930964, 2.087869, 1, 0, 0, 1, 1,
0.6710212, -0.181045, 2.746713, 1, 0, 0, 1, 1,
0.6780758, -0.3689412, 3.134301, 0, 0, 0, 1, 1,
0.6810903, 1.479756, 1.090175, 0, 0, 0, 1, 1,
0.6815354, -0.6115551, 1.411441, 0, 0, 0, 1, 1,
0.682806, 1.205289, 0.6053945, 0, 0, 0, 1, 1,
0.683822, 0.3373481, 1.138044, 0, 0, 0, 1, 1,
0.6874076, -0.5263458, 3.304746, 0, 0, 0, 1, 1,
0.6877198, -0.6062441, 1.740305, 0, 0, 0, 1, 1,
0.6878564, -0.5149989, 3.942469, 1, 1, 1, 1, 1,
0.6919123, 1.038726, 1.080823, 1, 1, 1, 1, 1,
0.6928856, -0.3007684, 1.193846, 1, 1, 1, 1, 1,
0.6949071, 0.4664398, -0.06869798, 1, 1, 1, 1, 1,
0.6969809, -1.247194, 1.929014, 1, 1, 1, 1, 1,
0.6992889, -0.7828695, 2.347389, 1, 1, 1, 1, 1,
0.6996866, 0.4340317, -0.4728628, 1, 1, 1, 1, 1,
0.7048224, -0.9368149, 1.920741, 1, 1, 1, 1, 1,
0.7143411, -2.028017, 2.314015, 1, 1, 1, 1, 1,
0.7156194, 0.3167262, 0.003627758, 1, 1, 1, 1, 1,
0.717878, 0.2802018, 3.662708, 1, 1, 1, 1, 1,
0.7196181, -0.1193994, 2.603616, 1, 1, 1, 1, 1,
0.7230237, -0.8046042, 3.298065, 1, 1, 1, 1, 1,
0.7267802, -0.6943715, 1.730943, 1, 1, 1, 1, 1,
0.7268869, 0.2432213, 2.167945, 1, 1, 1, 1, 1,
0.7323226, 1.714817, 1.117806, 0, 0, 1, 1, 1,
0.7370773, -0.5518073, 3.721859, 1, 0, 0, 1, 1,
0.7372612, 0.6596856, 1.792996, 1, 0, 0, 1, 1,
0.7422181, -0.7456164, 2.232907, 1, 0, 0, 1, 1,
0.744221, 0.9906204, -0.231268, 1, 0, 0, 1, 1,
0.7455408, -0.7451437, 1.751251, 1, 0, 0, 1, 1,
0.7457548, 0.8210893, 3.035684, 0, 0, 0, 1, 1,
0.7457701, -0.9251818, 2.416021, 0, 0, 0, 1, 1,
0.7510922, -1.769301, 3.335205, 0, 0, 0, 1, 1,
0.7540005, -0.3837032, -0.0281871, 0, 0, 0, 1, 1,
0.7552192, 0.7891707, 2.206579, 0, 0, 0, 1, 1,
0.7557847, 0.9722223, 0.6718177, 0, 0, 0, 1, 1,
0.7559897, 0.6318408, 3.025498, 0, 0, 0, 1, 1,
0.7562963, 0.3911853, 1.136312, 1, 1, 1, 1, 1,
0.7598333, -0.06929941, 2.566477, 1, 1, 1, 1, 1,
0.76147, -0.6707685, 2.092643, 1, 1, 1, 1, 1,
0.7626588, -1.481188, 4.270019, 1, 1, 1, 1, 1,
0.7626832, -0.006109646, 3.342407, 1, 1, 1, 1, 1,
0.7649371, -1.126049, 3.25456, 1, 1, 1, 1, 1,
0.7708278, 0.9374436, -0.3663375, 1, 1, 1, 1, 1,
0.7720379, 0.4737826, -0.179091, 1, 1, 1, 1, 1,
0.7732751, -0.7708479, 0.8301682, 1, 1, 1, 1, 1,
0.7733834, -0.7966545, 2.725228, 1, 1, 1, 1, 1,
0.7791162, 0.4615469, 0.05324082, 1, 1, 1, 1, 1,
0.7808088, -1.304883, 3.414802, 1, 1, 1, 1, 1,
0.7808211, -0.6759211, 1.30394, 1, 1, 1, 1, 1,
0.7829546, 1.313906, 0.7600565, 1, 1, 1, 1, 1,
0.7915549, 0.780424, -1.38166, 1, 1, 1, 1, 1,
0.7939023, -0.6696543, 1.870865, 0, 0, 1, 1, 1,
0.7952739, 0.2042994, 0.4606926, 1, 0, 0, 1, 1,
0.8000214, 0.5779057, 0.7622147, 1, 0, 0, 1, 1,
0.8002758, -0.07587097, 1.810854, 1, 0, 0, 1, 1,
0.8007348, 0.2761275, 0.848506, 1, 0, 0, 1, 1,
0.8014297, -1.249358, 2.04412, 1, 0, 0, 1, 1,
0.8029844, -0.9088385, 2.869498, 0, 0, 0, 1, 1,
0.8117254, -0.7121359, 1.874233, 0, 0, 0, 1, 1,
0.8126565, 0.7394226, 0.1307821, 0, 0, 0, 1, 1,
0.8139101, -0.4175325, 1.747416, 0, 0, 0, 1, 1,
0.8229186, 0.4065526, 1.164582, 0, 0, 0, 1, 1,
0.8360903, -1.561503, 1.846791, 0, 0, 0, 1, 1,
0.8397017, -0.03957268, 0.3360887, 0, 0, 0, 1, 1,
0.8417839, 0.4611551, 2.059037, 1, 1, 1, 1, 1,
0.8418424, -0.3947317, 2.158266, 1, 1, 1, 1, 1,
0.8419861, 0.1078513, -1.320393, 1, 1, 1, 1, 1,
0.8454097, -0.8858677, 1.885729, 1, 1, 1, 1, 1,
0.846941, -1.546645, 3.581718, 1, 1, 1, 1, 1,
0.8522647, 0.3219227, 0.4311317, 1, 1, 1, 1, 1,
0.8530167, 0.7080942, 2.307288, 1, 1, 1, 1, 1,
0.862596, -1.202772, 3.198255, 1, 1, 1, 1, 1,
0.8630158, 1.229281, 2.220443, 1, 1, 1, 1, 1,
0.8660121, -1.27695, 2.747146, 1, 1, 1, 1, 1,
0.868432, -1.316264, 0.03275621, 1, 1, 1, 1, 1,
0.8733746, -0.1409683, 3.539637, 1, 1, 1, 1, 1,
0.8748753, 1.679415, -0.1291713, 1, 1, 1, 1, 1,
0.8758851, 1.428112, 0.9444861, 1, 1, 1, 1, 1,
0.8788849, 0.1377082, 2.136003, 1, 1, 1, 1, 1,
0.8820366, -0.9106128, 1.626517, 0, 0, 1, 1, 1,
0.8847593, 1.223081, 1.180569, 1, 0, 0, 1, 1,
0.8906046, -1.160383, 2.57567, 1, 0, 0, 1, 1,
0.8934131, 0.2344024, 1.644201, 1, 0, 0, 1, 1,
0.8970781, -0.1839083, -0.06363714, 1, 0, 0, 1, 1,
0.9000048, -0.526294, 0.7416128, 1, 0, 0, 1, 1,
0.9019231, -0.1588804, 2.17409, 0, 0, 0, 1, 1,
0.9028581, 0.3317348, 1.845667, 0, 0, 0, 1, 1,
0.9061415, -1.161425, 3.267926, 0, 0, 0, 1, 1,
0.9072129, -0.0377608, 2.398738, 0, 0, 0, 1, 1,
0.9101744, 0.5602652, 1.830432, 0, 0, 0, 1, 1,
0.9116576, 0.6634322, 1.795658, 0, 0, 0, 1, 1,
0.9117782, -0.1416505, -0.5618275, 0, 0, 0, 1, 1,
0.9177831, -0.6563842, 1.651604, 1, 1, 1, 1, 1,
0.9189277, 1.156909, 1.186806, 1, 1, 1, 1, 1,
0.9192452, 1.176543, 2.177951, 1, 1, 1, 1, 1,
0.9193684, -0.2856814, 2.230739, 1, 1, 1, 1, 1,
0.9196134, 0.1370911, 1.090845, 1, 1, 1, 1, 1,
0.9210091, 0.5177841, 0.5380574, 1, 1, 1, 1, 1,
0.9274936, 0.02663558, 0.657812, 1, 1, 1, 1, 1,
0.929576, 0.8536663, 0.8978053, 1, 1, 1, 1, 1,
0.9345356, -1.310152, 3.503378, 1, 1, 1, 1, 1,
0.9348025, -0.6225495, 0.8694375, 1, 1, 1, 1, 1,
0.9394591, 0.01821916, 1.93434, 1, 1, 1, 1, 1,
0.9408188, -0.4359281, 1.500975, 1, 1, 1, 1, 1,
0.944385, 1.185532, 0.8915377, 1, 1, 1, 1, 1,
0.9450247, 0.5409581, 1.374742, 1, 1, 1, 1, 1,
0.9538721, 0.8636649, -1.038713, 1, 1, 1, 1, 1,
0.9558938, -0.01043019, 1.061838, 0, 0, 1, 1, 1,
0.9581467, 0.5596647, -2.224558, 1, 0, 0, 1, 1,
0.9600183, -0.4962471, 2.194785, 1, 0, 0, 1, 1,
0.9633622, 0.9622848, 1.656668, 1, 0, 0, 1, 1,
0.9661742, -0.887527, 1.969108, 1, 0, 0, 1, 1,
0.9675019, 0.4683482, 0.5398139, 1, 0, 0, 1, 1,
0.9729831, -0.0384062, 2.040209, 0, 0, 0, 1, 1,
0.9736264, -1.115554, 1.538084, 0, 0, 0, 1, 1,
0.9752949, 0.5847756, 1.202422, 0, 0, 0, 1, 1,
0.9754074, -0.1547532, 1.84497, 0, 0, 0, 1, 1,
0.9845387, 0.6253302, 0.1256807, 0, 0, 0, 1, 1,
0.9903161, 0.2642205, 1.178228, 0, 0, 0, 1, 1,
0.9945868, -1.553257, 1.720702, 0, 0, 0, 1, 1,
0.9961578, -1.112966, 3.024869, 1, 1, 1, 1, 1,
1.013265, 0.3164094, 2.448031, 1, 1, 1, 1, 1,
1.019855, -0.003605375, 2.684814, 1, 1, 1, 1, 1,
1.026665, 0.3494305, 1.840361, 1, 1, 1, 1, 1,
1.028693, 1.684159, 0.5901996, 1, 1, 1, 1, 1,
1.02985, -0.8404242, 3.112226, 1, 1, 1, 1, 1,
1.040151, -0.2667201, 1.998688, 1, 1, 1, 1, 1,
1.043514, 0.08861714, 2.548363, 1, 1, 1, 1, 1,
1.051171, 1.518367, 1.027819, 1, 1, 1, 1, 1,
1.051579, -1.097677, 2.698833, 1, 1, 1, 1, 1,
1.052715, -0.3920897, 2.025967, 1, 1, 1, 1, 1,
1.055098, 0.2873698, 1.310868, 1, 1, 1, 1, 1,
1.058728, 0.8298744, -1.749212, 1, 1, 1, 1, 1,
1.064268, 0.07520024, 0.5455526, 1, 1, 1, 1, 1,
1.064902, 1.913888, 1.960809, 1, 1, 1, 1, 1,
1.069352, -0.7349701, 1.317011, 0, 0, 1, 1, 1,
1.076716, 0.04437519, 1.248616, 1, 0, 0, 1, 1,
1.082997, -0.9327968, 1.452965, 1, 0, 0, 1, 1,
1.095784, -0.8808748, 3.084721, 1, 0, 0, 1, 1,
1.106788, -0.8851046, 2.003383, 1, 0, 0, 1, 1,
1.110842, -0.096727, 1.491014, 1, 0, 0, 1, 1,
1.114336, 1.469016, -1.010282, 0, 0, 0, 1, 1,
1.115233, 0.04206793, 3.468044, 0, 0, 0, 1, 1,
1.122445, -0.5191792, 0.704928, 0, 0, 0, 1, 1,
1.123716, 0.2679415, 1.60444, 0, 0, 0, 1, 1,
1.12636, -1.449177, 2.03976, 0, 0, 0, 1, 1,
1.126558, -0.2996928, 1.942148, 0, 0, 0, 1, 1,
1.131346, 0.1588122, 1.857127, 0, 0, 0, 1, 1,
1.146057, -1.164628, 2.915886, 1, 1, 1, 1, 1,
1.159914, -0.7656928, 4.158232, 1, 1, 1, 1, 1,
1.163541, 0.8708492, 1.511484, 1, 1, 1, 1, 1,
1.173024, -1.395271, 1.508864, 1, 1, 1, 1, 1,
1.174831, 0.7689155, -0.1479119, 1, 1, 1, 1, 1,
1.176125, 0.1701702, -0.04999366, 1, 1, 1, 1, 1,
1.176608, 0.1119995, 2.41574, 1, 1, 1, 1, 1,
1.18013, -2.129555, 1.940837, 1, 1, 1, 1, 1,
1.191283, 0.4133402, 1.780267, 1, 1, 1, 1, 1,
1.196342, -0.885782, 2.059222, 1, 1, 1, 1, 1,
1.200819, 0.4350888, 0.1466158, 1, 1, 1, 1, 1,
1.203814, 0.5186483, 2.557008, 1, 1, 1, 1, 1,
1.210037, -0.9817565, 2.844059, 1, 1, 1, 1, 1,
1.213092, -1.344025, 3.045943, 1, 1, 1, 1, 1,
1.219257, -0.6460006, 2.88763, 1, 1, 1, 1, 1,
1.225057, -0.783482, 1.065914, 0, 0, 1, 1, 1,
1.226554, -0.8117287, 2.486434, 1, 0, 0, 1, 1,
1.229278, 0.5546322, 0.6214304, 1, 0, 0, 1, 1,
1.256448, 0.7433571, 2.91736, 1, 0, 0, 1, 1,
1.267664, -0.08587661, 0.8961387, 1, 0, 0, 1, 1,
1.26875, -1.135072, 1.383627, 1, 0, 0, 1, 1,
1.278634, 0.159513, 2.410677, 0, 0, 0, 1, 1,
1.292954, 0.4649131, 0.5693115, 0, 0, 0, 1, 1,
1.301736, -0.7285501, 4.025423, 0, 0, 0, 1, 1,
1.305101, 1.030458, 2.504016, 0, 0, 0, 1, 1,
1.310473, 1.265708, 1.470528, 0, 0, 0, 1, 1,
1.314894, 0.2020603, 2.236605, 0, 0, 0, 1, 1,
1.324025, -0.2443242, 1.765558, 0, 0, 0, 1, 1,
1.324218, -0.255928, 1.475437, 1, 1, 1, 1, 1,
1.333618, -0.8504094, 3.704204, 1, 1, 1, 1, 1,
1.333901, 0.4390061, 0.6256148, 1, 1, 1, 1, 1,
1.33547, -1.192608, 2.620937, 1, 1, 1, 1, 1,
1.349789, -0.5237775, -1.096462, 1, 1, 1, 1, 1,
1.351846, -0.1354802, 3.54694, 1, 1, 1, 1, 1,
1.353381, -0.4092433, 2.885385, 1, 1, 1, 1, 1,
1.358486, -0.9756602, 2.373996, 1, 1, 1, 1, 1,
1.375337, -0.7187459, 2.921287, 1, 1, 1, 1, 1,
1.384286, -0.7668754, 3.171224, 1, 1, 1, 1, 1,
1.389896, 0.0545808, 2.856983, 1, 1, 1, 1, 1,
1.396676, -0.00720591, 2.424263, 1, 1, 1, 1, 1,
1.39815, 0.2876192, 2.211733, 1, 1, 1, 1, 1,
1.401724, 0.55751, 0.4553738, 1, 1, 1, 1, 1,
1.410972, 0.4150421, 1.047113, 1, 1, 1, 1, 1,
1.414473, -0.8401388, 3.7578, 0, 0, 1, 1, 1,
1.421713, -0.7556732, 2.179889, 1, 0, 0, 1, 1,
1.424343, 1.129177, 0.6346742, 1, 0, 0, 1, 1,
1.430522, -0.07529639, 0.9518878, 1, 0, 0, 1, 1,
1.431279, 1.056186, -0.7810791, 1, 0, 0, 1, 1,
1.444137, 1.744503, -0.7764177, 1, 0, 0, 1, 1,
1.451796, -0.7638885, 2.42513, 0, 0, 0, 1, 1,
1.455469, 0.3239819, 0.3166047, 0, 0, 0, 1, 1,
1.481102, 0.6865982, 1.051941, 0, 0, 0, 1, 1,
1.493023, 1.227297, 1.716647, 0, 0, 0, 1, 1,
1.497487, -0.3532317, 1.94769, 0, 0, 0, 1, 1,
1.526579, -0.02646844, 1.989883, 0, 0, 0, 1, 1,
1.540033, 0.7723141, -0.31865, 0, 0, 0, 1, 1,
1.550782, 0.2051756, 1.604317, 1, 1, 1, 1, 1,
1.555319, -1.537374, 1.936385, 1, 1, 1, 1, 1,
1.565595, 1.38163, 1.023538, 1, 1, 1, 1, 1,
1.584011, 1.651967, 1.89464, 1, 1, 1, 1, 1,
1.593328, 0.1884525, 1.734738, 1, 1, 1, 1, 1,
1.612776, 0.612681, 0.9946311, 1, 1, 1, 1, 1,
1.616656, 0.1591185, 1.579037, 1, 1, 1, 1, 1,
1.620831, 1.048728, -0.8193507, 1, 1, 1, 1, 1,
1.632112, -1.44651, 2.851291, 1, 1, 1, 1, 1,
1.640552, -0.6341065, 2.110616, 1, 1, 1, 1, 1,
1.64879, 1.188237, 0.6452795, 1, 1, 1, 1, 1,
1.657926, -0.2818744, 0.09957222, 1, 1, 1, 1, 1,
1.662815, 0.465002, 2.481652, 1, 1, 1, 1, 1,
1.663045, 0.8611374, 1.332809, 1, 1, 1, 1, 1,
1.699416, 0.1698549, 1.406383, 1, 1, 1, 1, 1,
1.699563, 0.5749218, 3.007939, 0, 0, 1, 1, 1,
1.705132, -0.6136591, 2.932692, 1, 0, 0, 1, 1,
1.71682, -1.931402, 0.4219932, 1, 0, 0, 1, 1,
1.719091, 1.489659, -0.2824051, 1, 0, 0, 1, 1,
1.722318, -0.4089389, 1.232386, 1, 0, 0, 1, 1,
1.745639, -1.170545, 2.597464, 1, 0, 0, 1, 1,
1.754752, -0.4670596, 1.049341, 0, 0, 0, 1, 1,
1.781084, -1.173105, 1.632974, 0, 0, 0, 1, 1,
1.787949, 1.684071, 1.090587, 0, 0, 0, 1, 1,
1.795313, 1.829281, 0.3496815, 0, 0, 0, 1, 1,
1.801775, 0.03021167, 1.988634, 0, 0, 0, 1, 1,
1.904269, 0.2361366, 1.080649, 0, 0, 0, 1, 1,
1.918411, 0.05328393, 0.06507681, 0, 0, 0, 1, 1,
1.924512, -0.09144907, 1.66609, 1, 1, 1, 1, 1,
1.92842, 0.02087449, 0.9695832, 1, 1, 1, 1, 1,
1.932098, 2.882497, -0.05619203, 1, 1, 1, 1, 1,
1.934574, 0.7107326, 0.5895838, 1, 1, 1, 1, 1,
1.940432, 0.3105413, 0.8591776, 1, 1, 1, 1, 1,
1.987188, 0.2638789, 0.9616475, 1, 1, 1, 1, 1,
1.988208, -0.4690884, 3.20278, 1, 1, 1, 1, 1,
1.990965, -0.3769909, 1.615725, 1, 1, 1, 1, 1,
2.021892, 1.097035, 2.088392, 1, 1, 1, 1, 1,
2.028279, -1.289357, 1.743988, 1, 1, 1, 1, 1,
2.062259, 0.09188765, -0.4536189, 1, 1, 1, 1, 1,
2.067961, -1.003256, 2.572087, 1, 1, 1, 1, 1,
2.102847, -0.2013829, 3.289621, 1, 1, 1, 1, 1,
2.160634, -2.277455, 2.17012, 1, 1, 1, 1, 1,
2.163153, 0.6433299, 1.012029, 1, 1, 1, 1, 1,
2.199018, -0.54151, 2.085526, 0, 0, 1, 1, 1,
2.236146, -0.2596624, 1.30204, 1, 0, 0, 1, 1,
2.270559, 1.359937, 0.7077157, 1, 0, 0, 1, 1,
2.280914, -0.1034047, 1.907404, 1, 0, 0, 1, 1,
2.294701, 0.1158613, 1.891488, 1, 0, 0, 1, 1,
2.29911, -0.2316007, 0.8518186, 1, 0, 0, 1, 1,
2.307619, 0.8898047, 4.113313, 0, 0, 0, 1, 1,
2.37648, -0.6586725, 1.951636, 0, 0, 0, 1, 1,
2.386225, -0.2244418, 3.257846, 0, 0, 0, 1, 1,
2.394185, 0.0233549, 0.8185375, 0, 0, 0, 1, 1,
2.438523, 1.530142, -0.4546455, 0, 0, 0, 1, 1,
2.442687, 1.182115, -0.07579443, 0, 0, 0, 1, 1,
2.448287, -1.210936, 0.4345008, 0, 0, 0, 1, 1,
2.47078, -1.302492, 1.995608, 1, 1, 1, 1, 1,
2.60287, 1.288685, -0.09586199, 1, 1, 1, 1, 1,
2.621716, -2.111671, 3.279124, 1, 1, 1, 1, 1,
2.631617, 0.4176662, 0.6157476, 1, 1, 1, 1, 1,
2.632475, 1.342202, -0.9003832, 1, 1, 1, 1, 1,
3.016831, -0.242212, 1.414486, 1, 1, 1, 1, 1,
3.164639, -1.867747, 1.601727, 1, 1, 1, 1, 1
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
var radius = 9.653702;
var distance = 33.90821;
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
mvMatrix.translate( -0.1151034, -0.2583115, 0.2523353 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.90821);
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
