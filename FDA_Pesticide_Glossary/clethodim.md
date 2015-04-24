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
-2.830914, 2.145841, -2.085082, 1, 0, 0, 1,
-2.709552, -0.2112041, -1.429391, 1, 0.007843138, 0, 1,
-2.578844, -0.4726469, -0.3902832, 1, 0.01176471, 0, 1,
-2.50149, 1.607838, -1.913177, 1, 0.01960784, 0, 1,
-2.430711, 0.9109843, -0.2900508, 1, 0.02352941, 0, 1,
-2.417314, 0.720945, -1.64919, 1, 0.03137255, 0, 1,
-2.377199, -1.271073, -0.9488097, 1, 0.03529412, 0, 1,
-2.356424, -0.2619168, -1.233669, 1, 0.04313726, 0, 1,
-2.250615, -1.0994, -3.203914, 1, 0.04705882, 0, 1,
-2.198919, 0.5660177, -2.115304, 1, 0.05490196, 0, 1,
-2.154929, -1.405495, -2.497114, 1, 0.05882353, 0, 1,
-2.143658, -0.6580125, -1.947729, 1, 0.06666667, 0, 1,
-2.121767, 0.4825635, -3.183842, 1, 0.07058824, 0, 1,
-2.077948, -1.122305, -1.688425, 1, 0.07843138, 0, 1,
-2.068188, -1.704603, -2.137125, 1, 0.08235294, 0, 1,
-2.06691, 0.4594012, -2.722767, 1, 0.09019608, 0, 1,
-2.066562, -1.208158, -2.436324, 1, 0.09411765, 0, 1,
-2.051009, 1.792951, -0.8490214, 1, 0.1019608, 0, 1,
-2.04638, -1.796288, -2.157594, 1, 0.1098039, 0, 1,
-1.963905, 1.315774, -0.7687922, 1, 0.1137255, 0, 1,
-1.962698, -0.2574446, -2.976289, 1, 0.1215686, 0, 1,
-1.953214, 0.0637706, -2.171471, 1, 0.1254902, 0, 1,
-1.945823, 0.05287535, -0.9638366, 1, 0.1333333, 0, 1,
-1.942407, -0.8833904, -2.420768, 1, 0.1372549, 0, 1,
-1.90798, -1.163915, -2.508479, 1, 0.145098, 0, 1,
-1.905524, -0.7229168, -2.81276, 1, 0.1490196, 0, 1,
-1.901527, -1.043875, -3.950267, 1, 0.1568628, 0, 1,
-1.891498, -1.796841, -2.327691, 1, 0.1607843, 0, 1,
-1.825882, 0.1368401, -1.18806, 1, 0.1686275, 0, 1,
-1.819424, -0.9606165, -2.454538, 1, 0.172549, 0, 1,
-1.797624, -0.08006438, -3.245422, 1, 0.1803922, 0, 1,
-1.795404, 0.08014222, -2.052345, 1, 0.1843137, 0, 1,
-1.790483, 0.1840004, -2.656667, 1, 0.1921569, 0, 1,
-1.789715, 1.168442, -1.720653, 1, 0.1960784, 0, 1,
-1.787892, -1.956609, -3.670772, 1, 0.2039216, 0, 1,
-1.783438, 1.581704, -1.403251, 1, 0.2117647, 0, 1,
-1.771289, 1.219782, -0.1908859, 1, 0.2156863, 0, 1,
-1.763065, 1.80486, -0.528909, 1, 0.2235294, 0, 1,
-1.739699, 0.6480862, -2.306839, 1, 0.227451, 0, 1,
-1.73158, 0.3050979, -2.930506, 1, 0.2352941, 0, 1,
-1.711915, 1.575671, -0.5080338, 1, 0.2392157, 0, 1,
-1.708001, -0.1714574, -0.3472023, 1, 0.2470588, 0, 1,
-1.705647, -0.003572931, -1.38892, 1, 0.2509804, 0, 1,
-1.698153, -1.115983, -1.263036, 1, 0.2588235, 0, 1,
-1.685983, -0.7915856, -2.247093, 1, 0.2627451, 0, 1,
-1.685948, -0.1808017, 0.1862303, 1, 0.2705882, 0, 1,
-1.66108, 1.262779, -1.453539, 1, 0.2745098, 0, 1,
-1.652258, 1.37693, -1.266411, 1, 0.282353, 0, 1,
-1.639513, -0.1637351, -0.9886299, 1, 0.2862745, 0, 1,
-1.635903, -0.8027266, -3.129436, 1, 0.2941177, 0, 1,
-1.617507, 0.7949568, -0.8914068, 1, 0.3019608, 0, 1,
-1.608703, -0.6416678, -1.062861, 1, 0.3058824, 0, 1,
-1.607041, 0.7072566, -1.250605, 1, 0.3137255, 0, 1,
-1.599908, 0.9947522, -2.283115, 1, 0.3176471, 0, 1,
-1.590099, -1.109151, -3.566347, 1, 0.3254902, 0, 1,
-1.574809, -0.4783619, -0.6861506, 1, 0.3294118, 0, 1,
-1.572471, 1.422164, -2.287076, 1, 0.3372549, 0, 1,
-1.567495, -0.6258112, -3.165791, 1, 0.3411765, 0, 1,
-1.533677, 1.474244, -0.2980028, 1, 0.3490196, 0, 1,
-1.528696, -0.5437597, -1.747382, 1, 0.3529412, 0, 1,
-1.525552, 0.7975891, 0.5151669, 1, 0.3607843, 0, 1,
-1.52223, -1.201372, -0.970667, 1, 0.3647059, 0, 1,
-1.508435, 0.8375829, -1.129174, 1, 0.372549, 0, 1,
-1.506848, 1.190663, -0.9440714, 1, 0.3764706, 0, 1,
-1.492708, 1.059088, -1.610882, 1, 0.3843137, 0, 1,
-1.487713, -1.072989, -3.41219, 1, 0.3882353, 0, 1,
-1.483756, -0.07582644, -2.114028, 1, 0.3960784, 0, 1,
-1.473493, 0.4367545, -2.202335, 1, 0.4039216, 0, 1,
-1.469342, -1.553482, -2.557231, 1, 0.4078431, 0, 1,
-1.468516, -2.778463, -2.918243, 1, 0.4156863, 0, 1,
-1.46386, 1.228007, 0.2084924, 1, 0.4196078, 0, 1,
-1.456953, 1.883712, 0.5264719, 1, 0.427451, 0, 1,
-1.448716, 0.2489881, -0.0550116, 1, 0.4313726, 0, 1,
-1.445504, 0.954548, -0.4351233, 1, 0.4392157, 0, 1,
-1.439143, 0.3866103, -1.041665, 1, 0.4431373, 0, 1,
-1.42733, 1.216438, 0.2494027, 1, 0.4509804, 0, 1,
-1.402755, -1.337256, -1.838257, 1, 0.454902, 0, 1,
-1.402573, 0.6572773, -0.3043117, 1, 0.4627451, 0, 1,
-1.402258, 0.1127122, -1.875606, 1, 0.4666667, 0, 1,
-1.39795, 0.3470943, -0.6829662, 1, 0.4745098, 0, 1,
-1.383528, -0.972463, -2.824757, 1, 0.4784314, 0, 1,
-1.380219, 0.1349664, -0.8872486, 1, 0.4862745, 0, 1,
-1.378871, -0.511037, -1.698007, 1, 0.4901961, 0, 1,
-1.370555, -0.8322285, 0.4620063, 1, 0.4980392, 0, 1,
-1.367574, -0.4845404, -1.119308, 1, 0.5058824, 0, 1,
-1.350609, 0.3022211, -3.866012, 1, 0.509804, 0, 1,
-1.348603, 0.4610698, 0.5386971, 1, 0.5176471, 0, 1,
-1.339293, 0.3955288, -0.4357187, 1, 0.5215687, 0, 1,
-1.338097, -1.0823, -2.564876, 1, 0.5294118, 0, 1,
-1.334307, 0.6052357, -1.658053, 1, 0.5333334, 0, 1,
-1.333217, 1.302716, -1.004766, 1, 0.5411765, 0, 1,
-1.328353, 0.2381976, -1.503146, 1, 0.5450981, 0, 1,
-1.327205, 0.4267851, -0.04430567, 1, 0.5529412, 0, 1,
-1.324941, -0.07124315, -1.515887, 1, 0.5568628, 0, 1,
-1.318502, 0.4528567, -1.201186, 1, 0.5647059, 0, 1,
-1.312571, -0.04352031, -2.606542, 1, 0.5686275, 0, 1,
-1.310758, -0.3546909, -2.579131, 1, 0.5764706, 0, 1,
-1.306655, -0.08869157, -1.744983, 1, 0.5803922, 0, 1,
-1.305185, 0.2211291, -0.6164704, 1, 0.5882353, 0, 1,
-1.297039, -0.8417513, -0.6534834, 1, 0.5921569, 0, 1,
-1.293613, -1.10318, -2.865752, 1, 0.6, 0, 1,
-1.271209, 0.4814264, -2.822587, 1, 0.6078432, 0, 1,
-1.262825, 0.1213431, -1.464955, 1, 0.6117647, 0, 1,
-1.245808, 0.2108886, -1.298303, 1, 0.6196079, 0, 1,
-1.245741, 1.491604, -1.76037, 1, 0.6235294, 0, 1,
-1.236909, -0.03708516, -1.280108, 1, 0.6313726, 0, 1,
-1.234608, 1.143091, 0.3283638, 1, 0.6352941, 0, 1,
-1.232206, -0.5190045, -1.134064, 1, 0.6431373, 0, 1,
-1.228273, 0.950261, -1.837952, 1, 0.6470588, 0, 1,
-1.209889, -0.1433281, -2.958636, 1, 0.654902, 0, 1,
-1.191427, -0.6962395, -1.0761, 1, 0.6588235, 0, 1,
-1.190949, -1.185995, -1.129901, 1, 0.6666667, 0, 1,
-1.18626, -0.3644039, -3.098922, 1, 0.6705883, 0, 1,
-1.185636, -0.5195466, -2.011374, 1, 0.6784314, 0, 1,
-1.18167, 0.2301346, -2.107963, 1, 0.682353, 0, 1,
-1.180149, 0.1167941, -3.504647, 1, 0.6901961, 0, 1,
-1.178791, -0.5537269, -1.370851, 1, 0.6941177, 0, 1,
-1.17763, 0.05385481, -3.072499, 1, 0.7019608, 0, 1,
-1.177303, 1.09119, 0.03912583, 1, 0.7098039, 0, 1,
-1.177004, -0.7020135, -1.040323, 1, 0.7137255, 0, 1,
-1.161331, 0.9754305, -1.772276, 1, 0.7215686, 0, 1,
-1.155844, -0.1297596, 1.024293, 1, 0.7254902, 0, 1,
-1.151622, -1.849138, -2.806464, 1, 0.7333333, 0, 1,
-1.145215, 0.5166854, 1.07568, 1, 0.7372549, 0, 1,
-1.143884, -1.281469, -3.551126, 1, 0.7450981, 0, 1,
-1.141684, -0.6719615, -1.338196, 1, 0.7490196, 0, 1,
-1.135794, -1.205632, -1.474648, 1, 0.7568628, 0, 1,
-1.130022, 0.1203306, 0.7738332, 1, 0.7607843, 0, 1,
-1.126489, -1.420136, -2.918143, 1, 0.7686275, 0, 1,
-1.126347, -0.8655382, -2.342676, 1, 0.772549, 0, 1,
-1.125283, -1.104137, -2.512122, 1, 0.7803922, 0, 1,
-1.108999, -0.8672817, -2.282397, 1, 0.7843137, 0, 1,
-1.106457, -0.4024544, -1.499961, 1, 0.7921569, 0, 1,
-1.099792, 0.472663, -0.9981862, 1, 0.7960784, 0, 1,
-1.095595, 0.1593362, -1.275771, 1, 0.8039216, 0, 1,
-1.092139, -0.4499544, -1.819322, 1, 0.8117647, 0, 1,
-1.091954, 0.6965212, -1.049221, 1, 0.8156863, 0, 1,
-1.087607, -0.3270304, -1.215372, 1, 0.8235294, 0, 1,
-1.085747, 0.6530792, -0.7794451, 1, 0.827451, 0, 1,
-1.083109, -0.7552194, -1.832338, 1, 0.8352941, 0, 1,
-1.075871, 0.4766764, -0.7983893, 1, 0.8392157, 0, 1,
-1.074367, -0.5282115, -2.160622, 1, 0.8470588, 0, 1,
-1.064959, -0.4527894, -2.628782, 1, 0.8509804, 0, 1,
-1.058525, -0.04364019, -2.02703, 1, 0.8588235, 0, 1,
-1.038162, 0.3365206, -1.2498, 1, 0.8627451, 0, 1,
-1.03704, 0.04599956, -2.189031, 1, 0.8705882, 0, 1,
-1.034918, -0.6113333, -3.275675, 1, 0.8745098, 0, 1,
-1.030563, -1.497924, -1.180497, 1, 0.8823529, 0, 1,
-1.029478, 0.539958, -3.107977, 1, 0.8862745, 0, 1,
-1.027432, -0.1009593, -4.167088, 1, 0.8941177, 0, 1,
-1.023979, -1.563462, -2.468421, 1, 0.8980392, 0, 1,
-1.023227, -0.4294292, -2.062263, 1, 0.9058824, 0, 1,
-1.021337, -1.274742, -1.469671, 1, 0.9137255, 0, 1,
-1.016973, 0.153696, -0.8338445, 1, 0.9176471, 0, 1,
-1.00787, -0.7032208, -3.498181, 1, 0.9254902, 0, 1,
-1.006794, 1.019127, -0.9748867, 1, 0.9294118, 0, 1,
-0.9997609, 0.1456341, -0.1096308, 1, 0.9372549, 0, 1,
-0.9933677, 0.06044543, -2.006365, 1, 0.9411765, 0, 1,
-0.9915997, 0.04270084, -0.8713906, 1, 0.9490196, 0, 1,
-0.9905854, 0.8806854, -0.9130677, 1, 0.9529412, 0, 1,
-0.9860836, -0.3173433, -3.349775, 1, 0.9607843, 0, 1,
-0.9854212, 0.3657086, -0.9075375, 1, 0.9647059, 0, 1,
-0.9803174, 0.3352128, -1.165347, 1, 0.972549, 0, 1,
-0.973503, -0.7275622, -3.151276, 1, 0.9764706, 0, 1,
-0.9586326, -0.1405108, -2.527021, 1, 0.9843137, 0, 1,
-0.954635, 0.4810419, -0.7884143, 1, 0.9882353, 0, 1,
-0.9525982, -0.5824852, -0.2431289, 1, 0.9960784, 0, 1,
-0.9521822, -0.157761, -2.491004, 0.9960784, 1, 0, 1,
-0.9468282, 0.9685696, -2.016199, 0.9921569, 1, 0, 1,
-0.9434589, -0.154054, 0.3545092, 0.9843137, 1, 0, 1,
-0.9425078, 0.9356121, -1.52067, 0.9803922, 1, 0, 1,
-0.9384311, -0.7392337, -1.544409, 0.972549, 1, 0, 1,
-0.9307834, 0.6895947, -1.514087, 0.9686275, 1, 0, 1,
-0.9291658, -0.005419287, -1.061658, 0.9607843, 1, 0, 1,
-0.9287724, -1.274625, -2.8093, 0.9568627, 1, 0, 1,
-0.9241407, -0.07100221, -3.562421, 0.9490196, 1, 0, 1,
-0.9240283, -0.6701637, -2.865933, 0.945098, 1, 0, 1,
-0.9172391, -0.8318897, -0.1147237, 0.9372549, 1, 0, 1,
-0.9114463, -0.8181742, -3.356215, 0.9333333, 1, 0, 1,
-0.9109937, 0.1253496, -3.404306, 0.9254902, 1, 0, 1,
-0.9093754, 0.07182398, -1.117678, 0.9215686, 1, 0, 1,
-0.9089475, 1.286919, -1.58858, 0.9137255, 1, 0, 1,
-0.9054383, -0.6197877, -0.521361, 0.9098039, 1, 0, 1,
-0.9004601, 0.05050317, -0.3546056, 0.9019608, 1, 0, 1,
-0.8981342, -0.602939, -1.279522, 0.8941177, 1, 0, 1,
-0.8977546, -1.302896, -3.131453, 0.8901961, 1, 0, 1,
-0.8943521, 1.288433, -0.2531425, 0.8823529, 1, 0, 1,
-0.8888103, -0.8605313, -1.500516, 0.8784314, 1, 0, 1,
-0.8883075, 0.2334728, -2.735252, 0.8705882, 1, 0, 1,
-0.8837279, 0.4299201, -2.624316, 0.8666667, 1, 0, 1,
-0.8828266, -1.382002, -1.814073, 0.8588235, 1, 0, 1,
-0.8822016, 0.5047654, -2.159428, 0.854902, 1, 0, 1,
-0.8775312, 1.708853, -1.538193, 0.8470588, 1, 0, 1,
-0.8774205, 0.2589005, -0.0485692, 0.8431373, 1, 0, 1,
-0.8758605, 1.607721, -1.680678, 0.8352941, 1, 0, 1,
-0.8722154, 0.9566241, 0.7580793, 0.8313726, 1, 0, 1,
-0.8716463, 1.433964, -0.6762281, 0.8235294, 1, 0, 1,
-0.8711954, 1.003611, -1.743003, 0.8196079, 1, 0, 1,
-0.8634092, -0.7331203, -2.664737, 0.8117647, 1, 0, 1,
-0.8611318, -0.1497365, -1.426613, 0.8078431, 1, 0, 1,
-0.8568618, 1.464729, -0.9649478, 0.8, 1, 0, 1,
-0.8421208, -0.5421699, -0.8271121, 0.7921569, 1, 0, 1,
-0.8397673, -0.6416821, -0.8521859, 0.7882353, 1, 0, 1,
-0.8386979, 0.1773548, -2.805675, 0.7803922, 1, 0, 1,
-0.8381619, -0.4866121, -1.060421, 0.7764706, 1, 0, 1,
-0.8320883, -0.792403, -1.264634, 0.7686275, 1, 0, 1,
-0.8314852, -1.275171, -2.352006, 0.7647059, 1, 0, 1,
-0.8291874, -1.89037, -1.826053, 0.7568628, 1, 0, 1,
-0.8196141, 0.1856679, -1.229483, 0.7529412, 1, 0, 1,
-0.8159562, -0.7951491, -2.555278, 0.7450981, 1, 0, 1,
-0.815679, -0.2419407, -3.122817, 0.7411765, 1, 0, 1,
-0.8117816, -1.009805, -2.720509, 0.7333333, 1, 0, 1,
-0.8102397, 0.2036118, 0.3271702, 0.7294118, 1, 0, 1,
-0.8077042, -0.6301436, -1.927912, 0.7215686, 1, 0, 1,
-0.8068746, 0.2445379, -1.672309, 0.7176471, 1, 0, 1,
-0.8057779, 0.834915, -0.3291423, 0.7098039, 1, 0, 1,
-0.8041109, 0.973395, -1.863899, 0.7058824, 1, 0, 1,
-0.7998369, -1.091372, 0.1504632, 0.6980392, 1, 0, 1,
-0.7982922, -0.658269, -2.82252, 0.6901961, 1, 0, 1,
-0.797227, 1.916598, -2.894228, 0.6862745, 1, 0, 1,
-0.7877131, -1.17561, -2.047436, 0.6784314, 1, 0, 1,
-0.7863885, 0.2112789, -0.4745421, 0.6745098, 1, 0, 1,
-0.7748668, -0.3590846, -1.982686, 0.6666667, 1, 0, 1,
-0.7748492, -0.1692613, -2.151614, 0.6627451, 1, 0, 1,
-0.7747528, -1.532326, -2.151754, 0.654902, 1, 0, 1,
-0.7730042, 1.870036, 0.2873683, 0.6509804, 1, 0, 1,
-0.7697064, -0.2589866, -2.234629, 0.6431373, 1, 0, 1,
-0.7659798, -0.7172471, -4.822286, 0.6392157, 1, 0, 1,
-0.7624336, -0.8405846, -2.195626, 0.6313726, 1, 0, 1,
-0.7623551, 1.91674, 2.631876, 0.627451, 1, 0, 1,
-0.7613792, -1.532494, -4.203321, 0.6196079, 1, 0, 1,
-0.7589322, 2.016341, -1.407976, 0.6156863, 1, 0, 1,
-0.7581642, -2.118667, -3.329798, 0.6078432, 1, 0, 1,
-0.7568211, -0.1995985, 0.5942999, 0.6039216, 1, 0, 1,
-0.7562301, 1.796279, -0.3536571, 0.5960785, 1, 0, 1,
-0.7525468, -0.02812863, -0.9794949, 0.5882353, 1, 0, 1,
-0.744265, -2.673272, -3.076391, 0.5843138, 1, 0, 1,
-0.7421197, 1.043473, -0.6015582, 0.5764706, 1, 0, 1,
-0.7332714, 0.3213271, -1.692765, 0.572549, 1, 0, 1,
-0.7312812, 2.129933, -0.8581483, 0.5647059, 1, 0, 1,
-0.7210323, 0.5824415, -0.7066668, 0.5607843, 1, 0, 1,
-0.7165192, 0.9621606, -1.043075, 0.5529412, 1, 0, 1,
-0.7139849, 0.4794924, -2.574421, 0.5490196, 1, 0, 1,
-0.7098604, 0.4677154, -0.7864712, 0.5411765, 1, 0, 1,
-0.709785, -2.040355, -1.656939, 0.5372549, 1, 0, 1,
-0.7035584, -0.5106747, -0.7952003, 0.5294118, 1, 0, 1,
-0.6999633, -0.01655137, -2.149785, 0.5254902, 1, 0, 1,
-0.6994641, -1.155908, -1.341187, 0.5176471, 1, 0, 1,
-0.6981516, 1.063001, -0.6308086, 0.5137255, 1, 0, 1,
-0.6887113, 1.400315, -0.6047507, 0.5058824, 1, 0, 1,
-0.6685134, 1.44733, -0.3695615, 0.5019608, 1, 0, 1,
-0.6681994, 1.215776, 0.8494818, 0.4941176, 1, 0, 1,
-0.6652413, 0.5870432, -1.537776, 0.4862745, 1, 0, 1,
-0.6628534, -3.079158, -1.74535, 0.4823529, 1, 0, 1,
-0.6517928, -0.8397586, -0.7106248, 0.4745098, 1, 0, 1,
-0.648575, 0.3601942, -1.385022, 0.4705882, 1, 0, 1,
-0.6448158, 0.7464672, -0.09315391, 0.4627451, 1, 0, 1,
-0.6430227, 0.5994877, -1.575438, 0.4588235, 1, 0, 1,
-0.6344244, -1.799456, -3.27089, 0.4509804, 1, 0, 1,
-0.6302398, 0.9188734, 0.383204, 0.4470588, 1, 0, 1,
-0.6274466, 0.03811765, -2.882038, 0.4392157, 1, 0, 1,
-0.6189764, -0.2458254, -2.143662, 0.4352941, 1, 0, 1,
-0.6176947, 0.6545024, -3.002566, 0.427451, 1, 0, 1,
-0.6092244, -1.135018, -2.479433, 0.4235294, 1, 0, 1,
-0.6071584, 0.2943597, -0.2396818, 0.4156863, 1, 0, 1,
-0.6061036, 1.206806, 0.2781916, 0.4117647, 1, 0, 1,
-0.6002316, 0.5677809, -1.465873, 0.4039216, 1, 0, 1,
-0.5993878, 0.4930855, 0.1591555, 0.3960784, 1, 0, 1,
-0.5972817, -1.03366, -1.403334, 0.3921569, 1, 0, 1,
-0.5895626, -0.6757646, -3.432003, 0.3843137, 1, 0, 1,
-0.5881978, -0.3384507, -1.804383, 0.3803922, 1, 0, 1,
-0.5877895, -0.03858687, -1.888734, 0.372549, 1, 0, 1,
-0.5849137, 1.280906, -1.465972, 0.3686275, 1, 0, 1,
-0.5751151, -0.2456576, -2.566309, 0.3607843, 1, 0, 1,
-0.5709674, -0.1263523, -1.319668, 0.3568628, 1, 0, 1,
-0.5698095, 0.4889856, 0.07022303, 0.3490196, 1, 0, 1,
-0.5688224, -0.2679535, -3.13704, 0.345098, 1, 0, 1,
-0.5683528, 1.768759, -0.6496049, 0.3372549, 1, 0, 1,
-0.5619032, 2.06473, -1.262133, 0.3333333, 1, 0, 1,
-0.5605498, -0.199597, -2.279574, 0.3254902, 1, 0, 1,
-0.5573381, 0.7559062, 0.5944618, 0.3215686, 1, 0, 1,
-0.5547243, 2.464331, -0.7572999, 0.3137255, 1, 0, 1,
-0.5519331, -0.8838538, -3.072253, 0.3098039, 1, 0, 1,
-0.5407206, 0.1627813, -1.500015, 0.3019608, 1, 0, 1,
-0.5365903, 0.3502313, -1.434753, 0.2941177, 1, 0, 1,
-0.5357677, -0.665448, -1.600376, 0.2901961, 1, 0, 1,
-0.5350806, -1.257923, -0.6219644, 0.282353, 1, 0, 1,
-0.5332438, -1.043033, -2.211374, 0.2784314, 1, 0, 1,
-0.5309213, -0.3313879, -1.721467, 0.2705882, 1, 0, 1,
-0.526911, 0.8565758, -0.416125, 0.2666667, 1, 0, 1,
-0.5253065, 0.2825881, -1.141078, 0.2588235, 1, 0, 1,
-0.5204098, 2.596106, -1.529308, 0.254902, 1, 0, 1,
-0.5181147, 0.5319, -2.509635, 0.2470588, 1, 0, 1,
-0.5152649, -0.8034406, -2.101435, 0.2431373, 1, 0, 1,
-0.5114588, 0.2284184, -1.859008, 0.2352941, 1, 0, 1,
-0.5099369, 0.2578763, -2.890026, 0.2313726, 1, 0, 1,
-0.5075114, -0.6997191, -3.104926, 0.2235294, 1, 0, 1,
-0.5074446, -0.1986082, -2.646136, 0.2196078, 1, 0, 1,
-0.5068485, 1.835862, -2.089019, 0.2117647, 1, 0, 1,
-0.5041838, 0.7791417, -0.6085194, 0.2078431, 1, 0, 1,
-0.5032645, 0.1621846, -1.768967, 0.2, 1, 0, 1,
-0.5008202, 0.8374011, 0.4490327, 0.1921569, 1, 0, 1,
-0.4999325, -0.08957897, -3.300641, 0.1882353, 1, 0, 1,
-0.4995059, -0.9104455, -2.72422, 0.1803922, 1, 0, 1,
-0.4990608, -2.160228, -3.517153, 0.1764706, 1, 0, 1,
-0.4980811, 1.419073, -1.219576, 0.1686275, 1, 0, 1,
-0.4975967, 1.189655, -1.152028, 0.1647059, 1, 0, 1,
-0.4942375, 0.3134121, -2.091796, 0.1568628, 1, 0, 1,
-0.4918805, -1.410476, -2.768331, 0.1529412, 1, 0, 1,
-0.4917524, -0.04585805, -1.328411, 0.145098, 1, 0, 1,
-0.4892546, 2.023031, -0.182456, 0.1411765, 1, 0, 1,
-0.4856817, 0.9998162, -0.9128028, 0.1333333, 1, 0, 1,
-0.4839043, -1.191637, -1.9377, 0.1294118, 1, 0, 1,
-0.4762917, -0.009344064, -3.362185, 0.1215686, 1, 0, 1,
-0.474797, -1.047957, -3.864635, 0.1176471, 1, 0, 1,
-0.4713718, -1.405046, -2.27219, 0.1098039, 1, 0, 1,
-0.4676015, 0.5273054, 0.9299659, 0.1058824, 1, 0, 1,
-0.4673555, -1.593849, -4.008606, 0.09803922, 1, 0, 1,
-0.4655727, -0.8660012, -5.70857, 0.09019608, 1, 0, 1,
-0.4645638, -0.7040772, -3.178419, 0.08627451, 1, 0, 1,
-0.4644505, 0.8750929, -2.302196, 0.07843138, 1, 0, 1,
-0.4528709, 0.7042235, -1.188617, 0.07450981, 1, 0, 1,
-0.4526098, 0.676185, -0.6861967, 0.06666667, 1, 0, 1,
-0.4503224, 0.002685931, -1.63922, 0.0627451, 1, 0, 1,
-0.4465134, 0.6093618, -0.5432942, 0.05490196, 1, 0, 1,
-0.4461316, 0.4994664, -1.125404, 0.05098039, 1, 0, 1,
-0.4406804, -1.929955, -2.157544, 0.04313726, 1, 0, 1,
-0.4396237, 0.8762544, -0.205906, 0.03921569, 1, 0, 1,
-0.4383433, 1.480142, -1.267377, 0.03137255, 1, 0, 1,
-0.4370894, 0.4877005, -1.430781, 0.02745098, 1, 0, 1,
-0.4359432, 0.9584225, -1.121556, 0.01960784, 1, 0, 1,
-0.4358645, -1.406865, -4.545603, 0.01568628, 1, 0, 1,
-0.435045, -1.143614, -1.993008, 0.007843138, 1, 0, 1,
-0.4324093, 0.3665872, -1.125407, 0.003921569, 1, 0, 1,
-0.4298538, -1.536709, -1.089379, 0, 1, 0.003921569, 1,
-0.4296137, 1.919959, -0.6382791, 0, 1, 0.01176471, 1,
-0.4287789, 0.2213106, -0.677993, 0, 1, 0.01568628, 1,
-0.426367, -0.2844744, -2.997632, 0, 1, 0.02352941, 1,
-0.4256286, 1.435237, -0.5677585, 0, 1, 0.02745098, 1,
-0.4254397, -1.177568, -2.563871, 0, 1, 0.03529412, 1,
-0.4246935, -1.572894, -2.368281, 0, 1, 0.03921569, 1,
-0.4223062, 0.5202578, -1.028258, 0, 1, 0.04705882, 1,
-0.421835, 0.6825323, -0.6227982, 0, 1, 0.05098039, 1,
-0.4197961, 2.130917, 1.274258, 0, 1, 0.05882353, 1,
-0.4108694, -0.6944216, -4.515796, 0, 1, 0.0627451, 1,
-0.4055159, 0.1036599, 1.089386, 0, 1, 0.07058824, 1,
-0.4051918, -0.9366742, -4.138636, 0, 1, 0.07450981, 1,
-0.4015991, -0.3451759, -2.733659, 0, 1, 0.08235294, 1,
-0.4012642, -1.477571, -3.589082, 0, 1, 0.08627451, 1,
-0.3976093, -0.05999216, -2.35552, 0, 1, 0.09411765, 1,
-0.3937948, -0.6181732, -3.081243, 0, 1, 0.1019608, 1,
-0.3871885, -0.3219568, -3.295721, 0, 1, 0.1058824, 1,
-0.3864759, 0.2714225, -2.394714, 0, 1, 0.1137255, 1,
-0.3791502, -0.6260302, -3.174717, 0, 1, 0.1176471, 1,
-0.3692775, -0.06182122, -2.410632, 0, 1, 0.1254902, 1,
-0.3683817, -0.5517333, -4.341359, 0, 1, 0.1294118, 1,
-0.3644491, 0.5680566, -1.011245, 0, 1, 0.1372549, 1,
-0.361627, -0.2539214, -1.817559, 0, 1, 0.1411765, 1,
-0.3612541, -1.437075, -3.191366, 0, 1, 0.1490196, 1,
-0.3557197, 0.8418601, 0.5743655, 0, 1, 0.1529412, 1,
-0.35121, 0.5321422, -0.003679595, 0, 1, 0.1607843, 1,
-0.3492104, 1.815239, 0.08977132, 0, 1, 0.1647059, 1,
-0.3473399, 0.632772, -0.07233369, 0, 1, 0.172549, 1,
-0.3468426, -1.662831, -2.127193, 0, 1, 0.1764706, 1,
-0.3467015, -0.4849846, -1.157656, 0, 1, 0.1843137, 1,
-0.3400046, 0.2710288, -0.7219304, 0, 1, 0.1882353, 1,
-0.3385783, 0.4157902, -0.7222404, 0, 1, 0.1960784, 1,
-0.3346209, 1.189961, -1.632442, 0, 1, 0.2039216, 1,
-0.3304695, 0.1595229, -0.6122328, 0, 1, 0.2078431, 1,
-0.3302453, -1.140581, -3.278662, 0, 1, 0.2156863, 1,
-0.3257306, -0.5524032, -1.119585, 0, 1, 0.2196078, 1,
-0.32568, 0.2842385, -0.2871892, 0, 1, 0.227451, 1,
-0.3243996, 0.8497153, -0.8366537, 0, 1, 0.2313726, 1,
-0.3238862, 1.498356, -0.9015273, 0, 1, 0.2392157, 1,
-0.3222588, -0.8919576, -3.613363, 0, 1, 0.2431373, 1,
-0.3199039, -0.4215381, -3.272968, 0, 1, 0.2509804, 1,
-0.318139, 0.9568622, 0.6079648, 0, 1, 0.254902, 1,
-0.3168356, 0.1074618, -0.06362291, 0, 1, 0.2627451, 1,
-0.3143109, -0.4744594, -4.511574, 0, 1, 0.2666667, 1,
-0.3130738, -0.6468518, -2.939731, 0, 1, 0.2745098, 1,
-0.3123375, -0.2064335, -0.2235049, 0, 1, 0.2784314, 1,
-0.3117366, -0.235014, -1.461734, 0, 1, 0.2862745, 1,
-0.3109114, 1.621405, 0.6144553, 0, 1, 0.2901961, 1,
-0.3098865, -0.8259385, -3.901816, 0, 1, 0.2980392, 1,
-0.3028339, -0.04577318, -1.374573, 0, 1, 0.3058824, 1,
-0.3023667, -0.9159895, -3.964556, 0, 1, 0.3098039, 1,
-0.2998311, -0.310033, -1.120107, 0, 1, 0.3176471, 1,
-0.2981095, 0.6906705, -1.696945, 0, 1, 0.3215686, 1,
-0.2952333, 0.6764978, 1.213028, 0, 1, 0.3294118, 1,
-0.295106, -1.153863, -3.165525, 0, 1, 0.3333333, 1,
-0.29279, 2.225268, 1.48487, 0, 1, 0.3411765, 1,
-0.2916066, 0.6242867, -0.8357865, 0, 1, 0.345098, 1,
-0.2772383, 1.043009, -1.208124, 0, 1, 0.3529412, 1,
-0.2758849, -1.112225, -4.213407, 0, 1, 0.3568628, 1,
-0.2745423, -0.3297729, -3.191582, 0, 1, 0.3647059, 1,
-0.273167, 0.008995906, -1.521118, 0, 1, 0.3686275, 1,
-0.2728161, -1.630063, -3.402331, 0, 1, 0.3764706, 1,
-0.2691687, 0.2664884, -2.453339, 0, 1, 0.3803922, 1,
-0.268298, -1.014088, -3.614639, 0, 1, 0.3882353, 1,
-0.2670283, 1.375234, -0.008263229, 0, 1, 0.3921569, 1,
-0.2656904, -0.6674309, -3.691449, 0, 1, 0.4, 1,
-0.2638708, 1.657352, -0.1883857, 0, 1, 0.4078431, 1,
-0.2617925, -1.53348, -2.992308, 0, 1, 0.4117647, 1,
-0.2614027, -0.9470423, -4.120245, 0, 1, 0.4196078, 1,
-0.256632, -1.707009, -1.590925, 0, 1, 0.4235294, 1,
-0.2541637, -0.3199012, -2.568475, 0, 1, 0.4313726, 1,
-0.2527272, -0.01606502, -2.277344, 0, 1, 0.4352941, 1,
-0.2518278, 1.144503, 1.003036, 0, 1, 0.4431373, 1,
-0.2477407, 2.087518, -1.673987, 0, 1, 0.4470588, 1,
-0.2460628, 0.1893728, -1.179298, 0, 1, 0.454902, 1,
-0.2453528, 0.6040777, 0.5957935, 0, 1, 0.4588235, 1,
-0.2428319, -0.08823479, -1.152305, 0, 1, 0.4666667, 1,
-0.2415451, -0.1192234, -1.762281, 0, 1, 0.4705882, 1,
-0.2380107, -0.2859794, -3.726877, 0, 1, 0.4784314, 1,
-0.2346972, -0.7834059, -3.310813, 0, 1, 0.4823529, 1,
-0.2316514, 1.242985, -1.288723, 0, 1, 0.4901961, 1,
-0.2294562, 0.02245962, -2.35146, 0, 1, 0.4941176, 1,
-0.2293863, -0.5279886, -0.569945, 0, 1, 0.5019608, 1,
-0.2285533, -1.240115, -2.688658, 0, 1, 0.509804, 1,
-0.2259943, -2.194493, -1.072252, 0, 1, 0.5137255, 1,
-0.2259817, -1.646322, -2.043205, 0, 1, 0.5215687, 1,
-0.2200344, 1.171481, -0.02347586, 0, 1, 0.5254902, 1,
-0.2181605, -0.04335278, -1.791145, 0, 1, 0.5333334, 1,
-0.2120678, 1.139035, 0.183381, 0, 1, 0.5372549, 1,
-0.2109672, 0.07523727, -4.244655, 0, 1, 0.5450981, 1,
-0.2074536, 0.5369655, -0.6412221, 0, 1, 0.5490196, 1,
-0.2059526, 1.38084, -0.6971555, 0, 1, 0.5568628, 1,
-0.2052266, -1.604834, -3.727929, 0, 1, 0.5607843, 1,
-0.2008382, -2.015063, -1.938584, 0, 1, 0.5686275, 1,
-0.1971849, 1.113427, -1.349153, 0, 1, 0.572549, 1,
-0.1951485, 0.05447366, -1.55585, 0, 1, 0.5803922, 1,
-0.1942435, 0.8329193, -0.8059123, 0, 1, 0.5843138, 1,
-0.1880741, -1.070986, -3.054135, 0, 1, 0.5921569, 1,
-0.1854654, -0.7727866, -1.598527, 0, 1, 0.5960785, 1,
-0.1844405, 0.2211347, -0.8391594, 0, 1, 0.6039216, 1,
-0.182147, -1.122725, -2.288814, 0, 1, 0.6117647, 1,
-0.1820188, -0.521194, -3.07368, 0, 1, 0.6156863, 1,
-0.1818166, -0.3004713, -2.562405, 0, 1, 0.6235294, 1,
-0.1810639, 0.1528316, -1.791141, 0, 1, 0.627451, 1,
-0.1786918, 1.040857, -0.4998995, 0, 1, 0.6352941, 1,
-0.178122, -0.763403, -2.583895, 0, 1, 0.6392157, 1,
-0.1778103, -0.6899358, -4.965407, 0, 1, 0.6470588, 1,
-0.1771465, 0.76335, 0.9666442, 0, 1, 0.6509804, 1,
-0.1769732, -0.5852864, -1.59056, 0, 1, 0.6588235, 1,
-0.176719, -0.4632453, -2.478799, 0, 1, 0.6627451, 1,
-0.1754115, 1.162642, 1.563807, 0, 1, 0.6705883, 1,
-0.1723736, 2.423598, -0.5157844, 0, 1, 0.6745098, 1,
-0.1704169, 0.04974817, -1.200059, 0, 1, 0.682353, 1,
-0.1703202, -1.173876, -2.728846, 0, 1, 0.6862745, 1,
-0.1697598, -0.5204241, -2.572008, 0, 1, 0.6941177, 1,
-0.162142, -0.2918035, -1.677384, 0, 1, 0.7019608, 1,
-0.1597312, -0.008607234, -2.677251, 0, 1, 0.7058824, 1,
-0.1594727, 0.1398093, -1.877988, 0, 1, 0.7137255, 1,
-0.1526871, -0.2271572, -3.078492, 0, 1, 0.7176471, 1,
-0.1521922, -1.696847, -3.882226, 0, 1, 0.7254902, 1,
-0.1494889, -0.3422709, -1.651213, 0, 1, 0.7294118, 1,
-0.1489781, -0.007917391, -2.654663, 0, 1, 0.7372549, 1,
-0.1484173, -0.4123595, -2.362827, 0, 1, 0.7411765, 1,
-0.1467461, -0.4251905, -1.284522, 0, 1, 0.7490196, 1,
-0.1434169, -1.520172, -2.077198, 0, 1, 0.7529412, 1,
-0.1425247, 0.3404664, -1.241469, 0, 1, 0.7607843, 1,
-0.1416771, -0.9108007, -3.863325, 0, 1, 0.7647059, 1,
-0.1410879, -1.665114, -3.237611, 0, 1, 0.772549, 1,
-0.1382643, -1.538395, -2.899099, 0, 1, 0.7764706, 1,
-0.1361173, -1.647562, -1.670347, 0, 1, 0.7843137, 1,
-0.133141, 0.1146902, -0.9047994, 0, 1, 0.7882353, 1,
-0.1289109, -1.473319, -1.689795, 0, 1, 0.7960784, 1,
-0.1269367, 0.9761654, 1.287815, 0, 1, 0.8039216, 1,
-0.1192541, -0.7048316, -1.902512, 0, 1, 0.8078431, 1,
-0.1187219, -0.4587224, -2.659649, 0, 1, 0.8156863, 1,
-0.1166259, -0.4842602, -3.676576, 0, 1, 0.8196079, 1,
-0.09255948, 0.01483616, -1.257419, 0, 1, 0.827451, 1,
-0.09229338, -0.04728663, -2.75072, 0, 1, 0.8313726, 1,
-0.08995555, 0.5970625, 0.3400143, 0, 1, 0.8392157, 1,
-0.08982161, -0.9158108, -2.017296, 0, 1, 0.8431373, 1,
-0.08895491, 0.6629288, -0.6309711, 0, 1, 0.8509804, 1,
-0.08885715, -0.1697307, -2.998513, 0, 1, 0.854902, 1,
-0.08701822, 1.813095, -0.9774961, 0, 1, 0.8627451, 1,
-0.0853659, -0.06882424, -1.147441, 0, 1, 0.8666667, 1,
-0.08330016, -0.7368542, -3.418306, 0, 1, 0.8745098, 1,
-0.07908711, -0.401783, -3.301598, 0, 1, 0.8784314, 1,
-0.07730744, 0.635882, 0.1801659, 0, 1, 0.8862745, 1,
-0.07664883, 0.2099229, 1.077086, 0, 1, 0.8901961, 1,
-0.07582723, 2.155049, -0.317671, 0, 1, 0.8980392, 1,
-0.06805204, -1.449873, -3.273795, 0, 1, 0.9058824, 1,
-0.06530023, -1.852455, -3.678936, 0, 1, 0.9098039, 1,
-0.06439432, -1.279536, -3.83154, 0, 1, 0.9176471, 1,
-0.06209157, -2.299241, -4.597386, 0, 1, 0.9215686, 1,
-0.05560566, -1.283462, -2.882016, 0, 1, 0.9294118, 1,
-0.03633246, 1.239977, 0.3913794, 0, 1, 0.9333333, 1,
-0.03593437, -0.5994984, -3.031834, 0, 1, 0.9411765, 1,
-0.03398644, 0.04034226, -1.873537, 0, 1, 0.945098, 1,
-0.03165276, 0.9123849, -1.338682, 0, 1, 0.9529412, 1,
-0.03009248, 0.8786076, 1.294687, 0, 1, 0.9568627, 1,
-0.02932495, 0.894259, 0.6945717, 0, 1, 0.9647059, 1,
-0.02724396, -0.8268679, -3.189931, 0, 1, 0.9686275, 1,
-0.02700329, -0.2304186, -1.642742, 0, 1, 0.9764706, 1,
-0.02624614, 0.600731, 0.683673, 0, 1, 0.9803922, 1,
-0.02619831, 1.320136, 0.9150874, 0, 1, 0.9882353, 1,
-0.0225827, 0.9796577, 0.4771633, 0, 1, 0.9921569, 1,
-0.0224157, -1.112073, -2.302554, 0, 1, 1, 1,
-0.02111207, 1.785294, -1.309295, 0, 0.9921569, 1, 1,
-0.01808397, 0.9987898, -0.1603317, 0, 0.9882353, 1, 1,
-0.017129, 0.8543932, 0.3790179, 0, 0.9803922, 1, 1,
-0.009807021, -0.1270331, -2.113206, 0, 0.9764706, 1, 1,
-0.005880599, -0.4275784, -2.232365, 0, 0.9686275, 1, 1,
-0.0004836241, -0.01513259, -2.727127, 0, 0.9647059, 1, 1,
0.002138084, 1.028401, -0.1166133, 0, 0.9568627, 1, 1,
0.004939476, -0.3078626, 3.30886, 0, 0.9529412, 1, 1,
0.005346548, 0.3178924, 0.02943116, 0, 0.945098, 1, 1,
0.007015019, 1.066465, -0.3065682, 0, 0.9411765, 1, 1,
0.007816494, -0.2773855, 3.177618, 0, 0.9333333, 1, 1,
0.0104794, 1.167728, 0.1227052, 0, 0.9294118, 1, 1,
0.01090604, 0.4504959, 0.7665771, 0, 0.9215686, 1, 1,
0.01151464, -2.322304, 2.681068, 0, 0.9176471, 1, 1,
0.01232795, 0.6207892, -0.7667984, 0, 0.9098039, 1, 1,
0.0133822, -0.08035593, 2.024834, 0, 0.9058824, 1, 1,
0.01368413, 0.04555665, 0.2064584, 0, 0.8980392, 1, 1,
0.0193207, -0.08068063, 1.793687, 0, 0.8901961, 1, 1,
0.02056094, 1.153773, 0.2973273, 0, 0.8862745, 1, 1,
0.02847783, 0.4817117, -1.507938, 0, 0.8784314, 1, 1,
0.02896927, -0.9956395, 2.41774, 0, 0.8745098, 1, 1,
0.03262662, 1.986495, -1.537389, 0, 0.8666667, 1, 1,
0.03531399, -0.5542108, 3.433422, 0, 0.8627451, 1, 1,
0.04045036, 0.06464371, 1.33652, 0, 0.854902, 1, 1,
0.04253373, 0.2154276, 1.060793, 0, 0.8509804, 1, 1,
0.0473929, -0.6738294, 2.803865, 0, 0.8431373, 1, 1,
0.04798184, -0.578858, 3.279674, 0, 0.8392157, 1, 1,
0.05407895, 1.760236, -0.6955327, 0, 0.8313726, 1, 1,
0.05711694, 0.8521063, 0.04904405, 0, 0.827451, 1, 1,
0.05933863, -0.01844589, 3.355735, 0, 0.8196079, 1, 1,
0.06080885, -0.1827226, 2.121806, 0, 0.8156863, 1, 1,
0.06328985, -0.7751449, 3.408175, 0, 0.8078431, 1, 1,
0.06928049, -0.6996475, 3.684897, 0, 0.8039216, 1, 1,
0.07025214, 0.5802929, -0.2504709, 0, 0.7960784, 1, 1,
0.07080299, -0.5527363, 3.507195, 0, 0.7882353, 1, 1,
0.07584833, 0.6416053, -0.4552337, 0, 0.7843137, 1, 1,
0.07822053, -0.3812698, 2.77657, 0, 0.7764706, 1, 1,
0.08670332, 1.752982, -0.06210649, 0, 0.772549, 1, 1,
0.08755469, 0.7822112, 0.32514, 0, 0.7647059, 1, 1,
0.08827717, 1.275651, 1.301639, 0, 0.7607843, 1, 1,
0.08831204, -0.5022995, 3.590434, 0, 0.7529412, 1, 1,
0.09384912, 0.1328277, -0.03335789, 0, 0.7490196, 1, 1,
0.1007881, 0.6220228, 1.09398, 0, 0.7411765, 1, 1,
0.105097, -1.784572, 2.024288, 0, 0.7372549, 1, 1,
0.1058531, -1.17206, 4.215363, 0, 0.7294118, 1, 1,
0.1101424, 1.055449, -0.2108924, 0, 0.7254902, 1, 1,
0.1119004, -1.274879, 1.751414, 0, 0.7176471, 1, 1,
0.1152301, -0.1136728, 0.3704566, 0, 0.7137255, 1, 1,
0.1160967, 0.3324691, 0.2399809, 0, 0.7058824, 1, 1,
0.1168404, 0.0197263, 2.069119, 0, 0.6980392, 1, 1,
0.122599, -1.720345, 1.874017, 0, 0.6941177, 1, 1,
0.1273076, -0.1019028, 3.343841, 0, 0.6862745, 1, 1,
0.1362562, 1.780563, -0.5053351, 0, 0.682353, 1, 1,
0.1389327, 0.8130012, 0.7434478, 0, 0.6745098, 1, 1,
0.1399868, -0.811193, 5.814384, 0, 0.6705883, 1, 1,
0.1414666, -0.4516564, 2.672018, 0, 0.6627451, 1, 1,
0.1429097, 0.3150345, 0.855738, 0, 0.6588235, 1, 1,
0.1478823, -2.184138, 3.673966, 0, 0.6509804, 1, 1,
0.1505064, -0.806175, 3.316432, 0, 0.6470588, 1, 1,
0.1567936, -0.6986235, 2.146789, 0, 0.6392157, 1, 1,
0.1587966, -1.026241, 1.950635, 0, 0.6352941, 1, 1,
0.1599841, 3.035599, -0.6802834, 0, 0.627451, 1, 1,
0.1673966, -0.03116065, 1.576271, 0, 0.6235294, 1, 1,
0.1675443, 1.683156, 0.7950817, 0, 0.6156863, 1, 1,
0.1700451, 0.2327625, 0.4282612, 0, 0.6117647, 1, 1,
0.1720859, -2.226739, 1.64642, 0, 0.6039216, 1, 1,
0.1746212, -0.05936476, 1.941225, 0, 0.5960785, 1, 1,
0.1761137, 0.6168757, -1.125746, 0, 0.5921569, 1, 1,
0.1777457, 0.88195, 0.8162, 0, 0.5843138, 1, 1,
0.1780217, 1.404472, 0.6761588, 0, 0.5803922, 1, 1,
0.1798542, -0.101825, 2.766303, 0, 0.572549, 1, 1,
0.1813157, 0.125878, 0.6966624, 0, 0.5686275, 1, 1,
0.1830644, 0.324675, 0.3382272, 0, 0.5607843, 1, 1,
0.1854569, -0.3454965, 1.41913, 0, 0.5568628, 1, 1,
0.1856548, -1.304061, 5.89753, 0, 0.5490196, 1, 1,
0.1882492, -0.3945844, 3.209707, 0, 0.5450981, 1, 1,
0.1922498, -0.7512248, 3.212187, 0, 0.5372549, 1, 1,
0.203046, 0.8608808, 1.056689, 0, 0.5333334, 1, 1,
0.2063211, 3.120289, -0.6770822, 0, 0.5254902, 1, 1,
0.2087174, -1.142863, 4.229857, 0, 0.5215687, 1, 1,
0.2119952, 0.307137, -1.972832, 0, 0.5137255, 1, 1,
0.2150817, -0.3404219, 1.817245, 0, 0.509804, 1, 1,
0.218999, -1.651423, 3.659841, 0, 0.5019608, 1, 1,
0.2219509, 0.1756219, -0.3323974, 0, 0.4941176, 1, 1,
0.2251585, 0.8803488, 0.09676047, 0, 0.4901961, 1, 1,
0.2268393, -0.5337669, 3.213564, 0, 0.4823529, 1, 1,
0.2268894, 0.7086552, -1.536891, 0, 0.4784314, 1, 1,
0.2318564, -0.09861029, 1.30492, 0, 0.4705882, 1, 1,
0.23242, -0.8779085, 4.603716, 0, 0.4666667, 1, 1,
0.2359647, -1.877762, 3.645334, 0, 0.4588235, 1, 1,
0.2370662, 0.2695284, 0.5997899, 0, 0.454902, 1, 1,
0.2378318, -2.581486, 3.14762, 0, 0.4470588, 1, 1,
0.2402497, 0.2836165, 1.176831, 0, 0.4431373, 1, 1,
0.2461614, -0.1667577, 2.480837, 0, 0.4352941, 1, 1,
0.2482335, 0.2741522, -0.1965837, 0, 0.4313726, 1, 1,
0.2498489, 1.104415, -0.315763, 0, 0.4235294, 1, 1,
0.2566989, -1.006402, 5.020046, 0, 0.4196078, 1, 1,
0.2590439, 0.6599447, 0.7604583, 0, 0.4117647, 1, 1,
0.2597703, -0.2950912, 3.192704, 0, 0.4078431, 1, 1,
0.261204, 0.2642371, 1.385148, 0, 0.4, 1, 1,
0.2651106, 1.97626, 0.4996916, 0, 0.3921569, 1, 1,
0.2714229, 0.245339, 1.471054, 0, 0.3882353, 1, 1,
0.2731218, -0.3373251, 3.255099, 0, 0.3803922, 1, 1,
0.2751465, -0.7271717, 2.372531, 0, 0.3764706, 1, 1,
0.276037, 0.8642572, 0.2213723, 0, 0.3686275, 1, 1,
0.2801506, 0.6321055, 0.4594332, 0, 0.3647059, 1, 1,
0.2825978, 0.560015, -1.337786, 0, 0.3568628, 1, 1,
0.2873991, 0.500026, 0.3654809, 0, 0.3529412, 1, 1,
0.2906444, -0.7370071, 2.302319, 0, 0.345098, 1, 1,
0.2922575, 0.3221461, 1.431697, 0, 0.3411765, 1, 1,
0.2935, -1.379585, 3.469828, 0, 0.3333333, 1, 1,
0.2943524, 0.3974145, 0.5994871, 0, 0.3294118, 1, 1,
0.2961239, 0.4903477, 2.553423, 0, 0.3215686, 1, 1,
0.2970067, -0.3943831, 3.37229, 0, 0.3176471, 1, 1,
0.2979035, 0.9072571, -0.3344293, 0, 0.3098039, 1, 1,
0.3001325, 1.50217, 1.912213, 0, 0.3058824, 1, 1,
0.3075036, -2.019441, 2.724965, 0, 0.2980392, 1, 1,
0.3120449, -0.09956108, 0.9744862, 0, 0.2901961, 1, 1,
0.3144657, -1.633893, 2.82814, 0, 0.2862745, 1, 1,
0.320568, 0.7649377, 0.947224, 0, 0.2784314, 1, 1,
0.3216754, -0.8322631, 1.633184, 0, 0.2745098, 1, 1,
0.3291804, -1.453322, 3.949361, 0, 0.2666667, 1, 1,
0.337526, 0.5274464, 1.44275, 0, 0.2627451, 1, 1,
0.3387994, -0.5816324, 1.592776, 0, 0.254902, 1, 1,
0.3403586, 0.3807195, 0.4539242, 0, 0.2509804, 1, 1,
0.3420026, -0.5216426, 3.33224, 0, 0.2431373, 1, 1,
0.3470365, 1.673558, 1.351345, 0, 0.2392157, 1, 1,
0.3482731, 0.1677879, 1.284869, 0, 0.2313726, 1, 1,
0.363086, 0.1838951, -0.03585246, 0, 0.227451, 1, 1,
0.364001, -1.492555, 1.674017, 0, 0.2196078, 1, 1,
0.3676477, 0.6310241, 1.087307, 0, 0.2156863, 1, 1,
0.3682489, -1.046751, 4.197622, 0, 0.2078431, 1, 1,
0.3698131, -1.514162, 3.732648, 0, 0.2039216, 1, 1,
0.3699715, 1.642146, 1.18733, 0, 0.1960784, 1, 1,
0.3721472, 0.8704305, 1.650849, 0, 0.1882353, 1, 1,
0.3730168, 0.4032827, 2.320138, 0, 0.1843137, 1, 1,
0.3737849, -0.3444705, 2.311938, 0, 0.1764706, 1, 1,
0.3738204, 1.316582, 1.810423, 0, 0.172549, 1, 1,
0.3746382, -0.4183041, 2.65283, 0, 0.1647059, 1, 1,
0.3835061, 0.2028794, -0.46676, 0, 0.1607843, 1, 1,
0.3859022, 1.291421, 0.1548675, 0, 0.1529412, 1, 1,
0.393054, 0.6651325, -0.777239, 0, 0.1490196, 1, 1,
0.3941644, 0.2778941, 0.5204357, 0, 0.1411765, 1, 1,
0.4007361, 2.128289, 0.9461939, 0, 0.1372549, 1, 1,
0.402297, 2.284425, 1.38374, 0, 0.1294118, 1, 1,
0.4054702, 0.6022877, 0.1163108, 0, 0.1254902, 1, 1,
0.4074349, 0.8782848, 0.164055, 0, 0.1176471, 1, 1,
0.4083575, -1.747398, 2.408992, 0, 0.1137255, 1, 1,
0.4101166, 0.9778067, 0.3325032, 0, 0.1058824, 1, 1,
0.4152899, -0.313665, 3.656646, 0, 0.09803922, 1, 1,
0.4183842, 0.2623332, 0.409119, 0, 0.09411765, 1, 1,
0.4212667, 0.5382817, -0.2306612, 0, 0.08627451, 1, 1,
0.4216236, -0.7063857, 1.944811, 0, 0.08235294, 1, 1,
0.4228237, 0.5627414, 1.047324, 0, 0.07450981, 1, 1,
0.4320863, -1.428243, 1.056305, 0, 0.07058824, 1, 1,
0.4326268, -0.8984414, 1.387879, 0, 0.0627451, 1, 1,
0.4328419, 1.179533, 0.56176, 0, 0.05882353, 1, 1,
0.4419813, -0.5158199, 3.196734, 0, 0.05098039, 1, 1,
0.4502991, -1.904037, 3.861463, 0, 0.04705882, 1, 1,
0.4528313, 1.359413, 1.619931, 0, 0.03921569, 1, 1,
0.4542815, 0.8902302, 0.7786112, 0, 0.03529412, 1, 1,
0.4550484, -2.66338, 3.031168, 0, 0.02745098, 1, 1,
0.4580892, 0.03374284, 1.148856, 0, 0.02352941, 1, 1,
0.4621507, -0.4068321, 2.23108, 0, 0.01568628, 1, 1,
0.4627681, -1.389945, 1.970403, 0, 0.01176471, 1, 1,
0.4633057, 1.426127, -0.6091998, 0, 0.003921569, 1, 1,
0.4734899, -2.154515, 2.492739, 0.003921569, 0, 1, 1,
0.4736323, 0.05541325, 0.9649429, 0.007843138, 0, 1, 1,
0.4787218, -0.5231419, 2.864098, 0.01568628, 0, 1, 1,
0.4854129, 1.209262, 0.942286, 0.01960784, 0, 1, 1,
0.4885188, -0.5265974, 3.156555, 0.02745098, 0, 1, 1,
0.4990585, 1.499411, 1.140008, 0.03137255, 0, 1, 1,
0.5016935, 0.2195377, 2.156545, 0.03921569, 0, 1, 1,
0.5067596, -0.09986709, 1.207434, 0.04313726, 0, 1, 1,
0.506893, 0.4832849, 0.6088307, 0.05098039, 0, 1, 1,
0.5083001, 0.7510521, 1.687409, 0.05490196, 0, 1, 1,
0.5098101, -1.476485, 1.227722, 0.0627451, 0, 1, 1,
0.5118337, -1.006306, 3.868592, 0.06666667, 0, 1, 1,
0.5133198, 0.611384, 0.6678398, 0.07450981, 0, 1, 1,
0.514042, -0.7153214, 4.198686, 0.07843138, 0, 1, 1,
0.5152166, -0.1867902, 2.666672, 0.08627451, 0, 1, 1,
0.5161036, 0.2481703, 2.101729, 0.09019608, 0, 1, 1,
0.5169193, 1.214379, 2.027832, 0.09803922, 0, 1, 1,
0.5175345, -0.3043154, 3.364181, 0.1058824, 0, 1, 1,
0.5198485, -0.1328785, 2.398408, 0.1098039, 0, 1, 1,
0.5206519, 0.5915025, 1.423931, 0.1176471, 0, 1, 1,
0.5222342, 1.154514, 0.5172132, 0.1215686, 0, 1, 1,
0.5232544, 0.8196788, -2.219889, 0.1294118, 0, 1, 1,
0.5302708, 1.001985, -2.491457, 0.1333333, 0, 1, 1,
0.5338835, -0.2227627, 0.7607608, 0.1411765, 0, 1, 1,
0.5354, 0.3852088, -0.1098991, 0.145098, 0, 1, 1,
0.535655, -1.697021, 2.994532, 0.1529412, 0, 1, 1,
0.5400451, -1.345106, 4.11125, 0.1568628, 0, 1, 1,
0.5482985, -1.511993, 3.535636, 0.1647059, 0, 1, 1,
0.5486783, 0.6820805, 1.510691, 0.1686275, 0, 1, 1,
0.5536911, -1.191103, 2.349421, 0.1764706, 0, 1, 1,
0.5557365, 0.3969131, 1.985487, 0.1803922, 0, 1, 1,
0.5570552, -0.8209002, 3.073325, 0.1882353, 0, 1, 1,
0.5610888, 0.1158153, 2.141007, 0.1921569, 0, 1, 1,
0.5611458, 1.829543, 0.2442385, 0.2, 0, 1, 1,
0.561699, -1.271969, 1.570775, 0.2078431, 0, 1, 1,
0.5632284, -1.799538, 0.9651453, 0.2117647, 0, 1, 1,
0.5633872, 1.144272, -0.5441262, 0.2196078, 0, 1, 1,
0.5676003, -0.2140024, 0.7660899, 0.2235294, 0, 1, 1,
0.5717117, -0.666618, 2.516765, 0.2313726, 0, 1, 1,
0.5737662, -0.4867642, 0.59014, 0.2352941, 0, 1, 1,
0.5810055, -0.02024113, 3.274273, 0.2431373, 0, 1, 1,
0.58654, 0.08148891, 0.6557328, 0.2470588, 0, 1, 1,
0.5868418, 0.7349375, 0.6069335, 0.254902, 0, 1, 1,
0.5887483, 0.9417458, 0.5459715, 0.2588235, 0, 1, 1,
0.5959022, -0.4154349, -0.5179188, 0.2666667, 0, 1, 1,
0.5973725, 0.5350235, 1.392797, 0.2705882, 0, 1, 1,
0.598448, 2.661392, -1.90264, 0.2784314, 0, 1, 1,
0.6053402, -0.4044405, 1.26758, 0.282353, 0, 1, 1,
0.6059337, -2.031233, 1.380851, 0.2901961, 0, 1, 1,
0.6078441, -0.4770871, 0.8525116, 0.2941177, 0, 1, 1,
0.609088, -0.1741231, 2.397708, 0.3019608, 0, 1, 1,
0.6152823, -0.4540821, 3.279127, 0.3098039, 0, 1, 1,
0.6170118, 0.526057, 0.1812323, 0.3137255, 0, 1, 1,
0.6182004, 0.117154, 2.982868, 0.3215686, 0, 1, 1,
0.6188439, -0.9142155, 0.3922201, 0.3254902, 0, 1, 1,
0.6208703, -0.2029067, 1.886708, 0.3333333, 0, 1, 1,
0.6213906, 0.3513391, 1.137385, 0.3372549, 0, 1, 1,
0.6253349, 0.3113991, -0.6341445, 0.345098, 0, 1, 1,
0.6258301, -1.934333, 3.433156, 0.3490196, 0, 1, 1,
0.6264744, 1.485103, -2.354866, 0.3568628, 0, 1, 1,
0.6303803, -0.9790214, 2.250668, 0.3607843, 0, 1, 1,
0.6315022, -0.7069654, 1.246753, 0.3686275, 0, 1, 1,
0.6322435, -0.6729185, 1.881135, 0.372549, 0, 1, 1,
0.6332664, -0.1066559, 0.8307208, 0.3803922, 0, 1, 1,
0.6380007, 0.6468302, 2.141999, 0.3843137, 0, 1, 1,
0.6391432, 1.48449, -0.2499654, 0.3921569, 0, 1, 1,
0.6398131, -0.7163654, 3.409176, 0.3960784, 0, 1, 1,
0.6402952, 2.201967, 1.588373, 0.4039216, 0, 1, 1,
0.6437823, 0.5310616, 0.5170026, 0.4117647, 0, 1, 1,
0.6439033, -1.104448, 2.885544, 0.4156863, 0, 1, 1,
0.6443212, -1.369104, 2.880957, 0.4235294, 0, 1, 1,
0.645591, -1.177355, 2.727031, 0.427451, 0, 1, 1,
0.6467689, -0.5518534, 1.735816, 0.4352941, 0, 1, 1,
0.6523602, 0.8688526, -0.06847911, 0.4392157, 0, 1, 1,
0.6523957, -0.4518902, 3.10839, 0.4470588, 0, 1, 1,
0.6545936, 1.138363, 0.5287724, 0.4509804, 0, 1, 1,
0.6604724, -0.07916424, 2.816525, 0.4588235, 0, 1, 1,
0.6652525, -1.115657, 3.467897, 0.4627451, 0, 1, 1,
0.6756415, -0.2865949, 0.6804981, 0.4705882, 0, 1, 1,
0.6787295, 0.2029661, 1.964528, 0.4745098, 0, 1, 1,
0.6814091, 1.263079, 1.064889, 0.4823529, 0, 1, 1,
0.6839082, 1.915904, -0.8803176, 0.4862745, 0, 1, 1,
0.6860222, 1.542233, 1.316405, 0.4941176, 0, 1, 1,
0.6867428, 1.693817, 1.16088, 0.5019608, 0, 1, 1,
0.6961184, 0.002096082, 1.850395, 0.5058824, 0, 1, 1,
0.6969398, 1.434662, -1.415556, 0.5137255, 0, 1, 1,
0.6986414, 0.3087217, 1.727618, 0.5176471, 0, 1, 1,
0.7010385, 1.560389, 1.624303, 0.5254902, 0, 1, 1,
0.7033411, -0.1464485, 1.611841, 0.5294118, 0, 1, 1,
0.7036611, 0.5861977, 1.956063, 0.5372549, 0, 1, 1,
0.7082849, -0.3580274, 1.504777, 0.5411765, 0, 1, 1,
0.7152209, -0.6726459, 2.61228, 0.5490196, 0, 1, 1,
0.7152693, 0.7604049, 0.3075775, 0.5529412, 0, 1, 1,
0.7159585, 0.9944287, 0.8956922, 0.5607843, 0, 1, 1,
0.7162778, -0.6432139, 2.416186, 0.5647059, 0, 1, 1,
0.7207777, -0.4892881, 1.415519, 0.572549, 0, 1, 1,
0.7215259, 0.4558172, 0.9700702, 0.5764706, 0, 1, 1,
0.7224533, -0.1063159, 2.662746, 0.5843138, 0, 1, 1,
0.7236717, 0.07923993, 1.848657, 0.5882353, 0, 1, 1,
0.7287545, 0.5829341, 1.077602, 0.5960785, 0, 1, 1,
0.7323716, 2.355926, 0.1351469, 0.6039216, 0, 1, 1,
0.7328876, -0.06722359, 2.499024, 0.6078432, 0, 1, 1,
0.733776, 0.615855, 0.9180751, 0.6156863, 0, 1, 1,
0.7363756, -1.115625, 2.380732, 0.6196079, 0, 1, 1,
0.7369452, 3.220418, -0.7686226, 0.627451, 0, 1, 1,
0.7398518, -1.324198, 2.9448, 0.6313726, 0, 1, 1,
0.7437914, 0.7266265, 0.7641081, 0.6392157, 0, 1, 1,
0.7454898, -0.4484051, 1.264623, 0.6431373, 0, 1, 1,
0.7456931, -1.364798, 1.762772, 0.6509804, 0, 1, 1,
0.7492245, -0.176951, 0.3041828, 0.654902, 0, 1, 1,
0.751391, 0.4508148, 1.341753, 0.6627451, 0, 1, 1,
0.7524443, -0.5487729, 3.790069, 0.6666667, 0, 1, 1,
0.7720357, -1.037893, 2.114008, 0.6745098, 0, 1, 1,
0.7744702, 0.5639201, 1.281366, 0.6784314, 0, 1, 1,
0.7761777, -0.9824678, 2.78366, 0.6862745, 0, 1, 1,
0.7808334, 0.02842553, 1.906669, 0.6901961, 0, 1, 1,
0.7826693, 0.03736813, 1.648044, 0.6980392, 0, 1, 1,
0.7852091, 0.4610095, 2.119529, 0.7058824, 0, 1, 1,
0.7897779, 0.3305832, 1.028838, 0.7098039, 0, 1, 1,
0.7899004, 0.4188087, 1.875403, 0.7176471, 0, 1, 1,
0.798018, 1.26476, 0.03070545, 0.7215686, 0, 1, 1,
0.7997781, -0.05966832, 0.6539347, 0.7294118, 0, 1, 1,
0.8061917, 0.01966634, -0.3709345, 0.7333333, 0, 1, 1,
0.8067829, -1.570424, 3.348516, 0.7411765, 0, 1, 1,
0.8090869, -0.4703706, 2.007423, 0.7450981, 0, 1, 1,
0.8112429, 0.8940566, 1.509724, 0.7529412, 0, 1, 1,
0.8165752, -1.058237, 3.218917, 0.7568628, 0, 1, 1,
0.8212565, -2.441776, 1.044968, 0.7647059, 0, 1, 1,
0.8246984, -0.2010691, 2.420948, 0.7686275, 0, 1, 1,
0.8286335, -0.3882718, 0.3064753, 0.7764706, 0, 1, 1,
0.8343385, 1.341707, 1.309861, 0.7803922, 0, 1, 1,
0.8358442, 0.3498024, 1.716263, 0.7882353, 0, 1, 1,
0.8363544, 0.1159785, 0.4687257, 0.7921569, 0, 1, 1,
0.8365196, 0.4692501, 0.7023259, 0.8, 0, 1, 1,
0.8399682, -1.066074, 2.788914, 0.8078431, 0, 1, 1,
0.8477793, -0.8249049, 1.110193, 0.8117647, 0, 1, 1,
0.85083, -0.7071358, 1.452672, 0.8196079, 0, 1, 1,
0.8512436, 0.8047601, 1.877338, 0.8235294, 0, 1, 1,
0.8519142, 0.9755803, 0.4716068, 0.8313726, 0, 1, 1,
0.8531449, 0.4428375, 0.6685523, 0.8352941, 0, 1, 1,
0.8545149, -0.2471193, 2.056862, 0.8431373, 0, 1, 1,
0.8546516, -0.3275109, 2.118092, 0.8470588, 0, 1, 1,
0.8640965, -1.275855, 3.24292, 0.854902, 0, 1, 1,
0.8676579, 1.533316, -0.007767606, 0.8588235, 0, 1, 1,
0.868134, -0.8800514, 1.83118, 0.8666667, 0, 1, 1,
0.8715526, 0.7219032, 1.065685, 0.8705882, 0, 1, 1,
0.8764403, -0.5562512, 1.604909, 0.8784314, 0, 1, 1,
0.8782211, 0.0111676, 2.016365, 0.8823529, 0, 1, 1,
0.8799979, -1.051407, 2.250607, 0.8901961, 0, 1, 1,
0.8842146, -0.3055565, 2.560721, 0.8941177, 0, 1, 1,
0.8874008, 0.5113162, 1.018394, 0.9019608, 0, 1, 1,
0.8910549, -0.2773053, 1.992254, 0.9098039, 0, 1, 1,
0.8960585, -0.8593612, 3.809598, 0.9137255, 0, 1, 1,
0.8987739, -0.007788336, 3.474901, 0.9215686, 0, 1, 1,
0.9037642, 0.5906945, 0.2949632, 0.9254902, 0, 1, 1,
0.9111156, 0.6845038, -0.8542369, 0.9333333, 0, 1, 1,
0.9161959, -0.1029911, 1.019492, 0.9372549, 0, 1, 1,
0.9196902, -0.1037492, 1.229821, 0.945098, 0, 1, 1,
0.9208828, -2.084854, 1.333705, 0.9490196, 0, 1, 1,
0.9244245, -1.320714, 3.842538, 0.9568627, 0, 1, 1,
0.9269878, 1.032944, 0.4544604, 0.9607843, 0, 1, 1,
0.9334206, -1.788454, 4.073295, 0.9686275, 0, 1, 1,
0.9376466, 0.388505, 0.4392453, 0.972549, 0, 1, 1,
0.944002, -0.4311748, 1.324792, 0.9803922, 0, 1, 1,
0.9510618, -0.9735119, 3.110039, 0.9843137, 0, 1, 1,
0.9564479, -1.547394, 1.764262, 0.9921569, 0, 1, 1,
0.9581624, 0.845571, 1.161344, 0.9960784, 0, 1, 1,
0.9595758, -3.077878, 1.406514, 1, 0, 0.9960784, 1,
0.9601099, -0.9281877, 2.176965, 1, 0, 0.9882353, 1,
0.9646494, -0.8173962, 3.016506, 1, 0, 0.9843137, 1,
0.9715757, 0.08735746, 1.333932, 1, 0, 0.9764706, 1,
0.9763077, 0.4602151, 1.218824, 1, 0, 0.972549, 1,
0.9770715, -0.05553344, 2.114825, 1, 0, 0.9647059, 1,
0.9787804, -1.050024, 3.18175, 1, 0, 0.9607843, 1,
0.9806278, 0.9317074, 0.7785919, 1, 0, 0.9529412, 1,
0.9880807, 0.5180095, 0.2377234, 1, 0, 0.9490196, 1,
0.9893996, -0.5420291, 2.095237, 1, 0, 0.9411765, 1,
0.9930493, -0.5960665, 4.883978, 1, 0, 0.9372549, 1,
0.9931847, 0.3352161, 1.914183, 1, 0, 0.9294118, 1,
1.000521, -0.8258947, 1.539789, 1, 0, 0.9254902, 1,
1.002239, 1.123775, -0.1474231, 1, 0, 0.9176471, 1,
1.010262, 1.133735, 1.310165, 1, 0, 0.9137255, 1,
1.010284, -0.03234722, 0.649353, 1, 0, 0.9058824, 1,
1.013244, 0.3563029, 0.834748, 1, 0, 0.9019608, 1,
1.019435, -1.396307, 2.672585, 1, 0, 0.8941177, 1,
1.020021, 0.640776, 1.34181, 1, 0, 0.8862745, 1,
1.02131, -0.3391315, 0.6464944, 1, 0, 0.8823529, 1,
1.023448, -0.4708202, 4.077181, 1, 0, 0.8745098, 1,
1.035432, 0.5892564, 2.690043, 1, 0, 0.8705882, 1,
1.037088, 0.981051, 0.9178532, 1, 0, 0.8627451, 1,
1.041965, 0.04706396, 2.07679, 1, 0, 0.8588235, 1,
1.046392, 1.130587, 2.097047, 1, 0, 0.8509804, 1,
1.048014, -0.9725057, 0.7963753, 1, 0, 0.8470588, 1,
1.048409, 2.231638, -0.02681023, 1, 0, 0.8392157, 1,
1.052332, 1.056709, 1.200445, 1, 0, 0.8352941, 1,
1.056356, 0.4494101, 0.9551032, 1, 0, 0.827451, 1,
1.062697, -0.1440584, 4.326895, 1, 0, 0.8235294, 1,
1.069399, 0.993193, 1.723387, 1, 0, 0.8156863, 1,
1.071414, -0.3956565, 2.118228, 1, 0, 0.8117647, 1,
1.074104, 0.04812048, 0.6223314, 1, 0, 0.8039216, 1,
1.096799, -1.367235, 0.69581, 1, 0, 0.7960784, 1,
1.096829, 0.3898709, 2.738808, 1, 0, 0.7921569, 1,
1.100388, -0.1388459, 3.073439, 1, 0, 0.7843137, 1,
1.116226, 0.2425475, 3.505541, 1, 0, 0.7803922, 1,
1.129325, -1.187044, 2.079857, 1, 0, 0.772549, 1,
1.131457, 0.7892304, 2.167901, 1, 0, 0.7686275, 1,
1.13305, 0.7819588, 2.765069, 1, 0, 0.7607843, 1,
1.145731, -0.720315, 1.914648, 1, 0, 0.7568628, 1,
1.146092, 0.3037581, 3.153137, 1, 0, 0.7490196, 1,
1.14814, -0.01696451, 2.101319, 1, 0, 0.7450981, 1,
1.148627, -0.07275493, 2.728268, 1, 0, 0.7372549, 1,
1.149145, -1.034792, 1.015348, 1, 0, 0.7333333, 1,
1.154412, -0.5004638, 3.134899, 1, 0, 0.7254902, 1,
1.154752, 1.219982, 1.941664, 1, 0, 0.7215686, 1,
1.155523, 0.326365, 1.444018, 1, 0, 0.7137255, 1,
1.158224, 0.4912502, 0.9708521, 1, 0, 0.7098039, 1,
1.16393, 0.1534947, 2.652385, 1, 0, 0.7019608, 1,
1.167623, -1.05435, 3.498995, 1, 0, 0.6941177, 1,
1.177102, 0.9598758, 1.660618, 1, 0, 0.6901961, 1,
1.181085, -0.5487028, 2.142404, 1, 0, 0.682353, 1,
1.181521, 1.310033, 2.407111, 1, 0, 0.6784314, 1,
1.191931, 1.123526, -0.1812868, 1, 0, 0.6705883, 1,
1.19254, 0.1383844, 1.497351, 1, 0, 0.6666667, 1,
1.209603, 0.02358036, 1.670292, 1, 0, 0.6588235, 1,
1.220157, -0.285215, 0.1353837, 1, 0, 0.654902, 1,
1.222064, -0.7302397, 2.16246, 1, 0, 0.6470588, 1,
1.223002, -1.860608, 3.547055, 1, 0, 0.6431373, 1,
1.228567, 0.01753746, 2.274325, 1, 0, 0.6352941, 1,
1.238187, -0.6474938, 0.7094021, 1, 0, 0.6313726, 1,
1.260471, 0.2350124, 0.1321512, 1, 0, 0.6235294, 1,
1.261708, 0.6582406, 0.1068648, 1, 0, 0.6196079, 1,
1.268032, -0.8960863, 2.205169, 1, 0, 0.6117647, 1,
1.285136, -1.126836, 3.29686, 1, 0, 0.6078432, 1,
1.285654, 1.64399, 0.7019061, 1, 0, 0.6, 1,
1.287809, -0.07922084, 2.202616, 1, 0, 0.5921569, 1,
1.306218, 0.1189372, 2.999113, 1, 0, 0.5882353, 1,
1.306457, -0.8935496, 2.606738, 1, 0, 0.5803922, 1,
1.306547, 1.680919, 1.391783, 1, 0, 0.5764706, 1,
1.308272, 0.1203037, -0.3633192, 1, 0, 0.5686275, 1,
1.311039, 0.0524443, -0.02816357, 1, 0, 0.5647059, 1,
1.313021, 0.1338413, 1.309933, 1, 0, 0.5568628, 1,
1.319453, -2.418512, 2.785107, 1, 0, 0.5529412, 1,
1.328831, -1.572912, 4.010998, 1, 0, 0.5450981, 1,
1.336194, 0.1343874, 2.873096, 1, 0, 0.5411765, 1,
1.342833, -0.5365698, 2.893144, 1, 0, 0.5333334, 1,
1.347821, -0.9442984, 3.69346, 1, 0, 0.5294118, 1,
1.350802, 0.1422097, 0.2271456, 1, 0, 0.5215687, 1,
1.351619, 0.6124237, 0.6711109, 1, 0, 0.5176471, 1,
1.351925, 0.6031678, -0.7076524, 1, 0, 0.509804, 1,
1.359345, -1.435328, 2.352498, 1, 0, 0.5058824, 1,
1.359594, -1.071846, 2.73651, 1, 0, 0.4980392, 1,
1.370642, 1.73039, -0.9373231, 1, 0, 0.4901961, 1,
1.375727, 1.853422, 1.828315, 1, 0, 0.4862745, 1,
1.376229, 0.1283567, 3.063428, 1, 0, 0.4784314, 1,
1.391312, 0.2212488, 2.707458, 1, 0, 0.4745098, 1,
1.391982, 0.4356592, 3.238004, 1, 0, 0.4666667, 1,
1.405492, -0.03304729, 0.4253573, 1, 0, 0.4627451, 1,
1.417987, -0.5147014, 1.387586, 1, 0, 0.454902, 1,
1.419562, -0.8198671, 3.850949, 1, 0, 0.4509804, 1,
1.421417, -0.08072943, 1.728189, 1, 0, 0.4431373, 1,
1.429532, 1.041016, -1.147289, 1, 0, 0.4392157, 1,
1.440447, -1.072696, 2.664858, 1, 0, 0.4313726, 1,
1.467363, 1.01281, -0.2256977, 1, 0, 0.427451, 1,
1.485471, -0.02306933, 1.334411, 1, 0, 0.4196078, 1,
1.488326, 0.2007565, 1.235511, 1, 0, 0.4156863, 1,
1.507857, -0.5271202, 2.37008, 1, 0, 0.4078431, 1,
1.540303, -0.5262882, 3.854676, 1, 0, 0.4039216, 1,
1.564151, -1.234248, 2.528219, 1, 0, 0.3960784, 1,
1.582155, -0.3485725, 1.904496, 1, 0, 0.3882353, 1,
1.583151, -0.8638017, 1.977738, 1, 0, 0.3843137, 1,
1.585822, 0.2857679, 0.8481352, 1, 0, 0.3764706, 1,
1.591019, 1.202839, 1.60046, 1, 0, 0.372549, 1,
1.594418, 0.2956266, 3.405025, 1, 0, 0.3647059, 1,
1.594925, -2.038012, 2.252539, 1, 0, 0.3607843, 1,
1.624555, 2.153877, -0.7631175, 1, 0, 0.3529412, 1,
1.633024, -0.8643263, 1.148759, 1, 0, 0.3490196, 1,
1.649336, -0.2710727, 2.969277, 1, 0, 0.3411765, 1,
1.654172, 1.537035, 1.9857, 1, 0, 0.3372549, 1,
1.657935, 0.947519, 1.11594, 1, 0, 0.3294118, 1,
1.661993, -1.507967, 1.235316, 1, 0, 0.3254902, 1,
1.662112, 0.6205539, 0.5284178, 1, 0, 0.3176471, 1,
1.669015, 0.8952527, 2.373399, 1, 0, 0.3137255, 1,
1.671809, -1.456901, 2.081204, 1, 0, 0.3058824, 1,
1.678174, -0.2700035, 1.069454, 1, 0, 0.2980392, 1,
1.67985, -0.7689663, 0.6061667, 1, 0, 0.2941177, 1,
1.683561, 0.1462628, 0.1887362, 1, 0, 0.2862745, 1,
1.701788, -0.7384754, 1.56443, 1, 0, 0.282353, 1,
1.702119, -0.05818656, 2.169952, 1, 0, 0.2745098, 1,
1.723505, -0.1324571, 1.220136, 1, 0, 0.2705882, 1,
1.726703, -0.4279214, 2.097715, 1, 0, 0.2627451, 1,
1.746911, 0.7586244, 2.161962, 1, 0, 0.2588235, 1,
1.7475, 0.8311397, 1.148836, 1, 0, 0.2509804, 1,
1.782746, -0.3844101, 1.173644, 1, 0, 0.2470588, 1,
1.798966, -1.235117, 2.601592, 1, 0, 0.2392157, 1,
1.802052, 2.04585, 0.3474189, 1, 0, 0.2352941, 1,
1.804732, -2.07215, 1.787845, 1, 0, 0.227451, 1,
1.815307, -1.138824, 2.180587, 1, 0, 0.2235294, 1,
1.838637, -0.5432891, 2.095609, 1, 0, 0.2156863, 1,
1.849079, 0.2098365, 1.250066, 1, 0, 0.2117647, 1,
1.855543, 1.171781, 0.6727834, 1, 0, 0.2039216, 1,
1.87515, -0.8106195, 1.341068, 1, 0, 0.1960784, 1,
1.875381, -0.6594254, 2.307101, 1, 0, 0.1921569, 1,
1.880163, -0.1082819, 1.532325, 1, 0, 0.1843137, 1,
1.896271, 0.2110998, 0.4134284, 1, 0, 0.1803922, 1,
1.916505, 1.342817, 1.627689, 1, 0, 0.172549, 1,
1.925947, -1.357134, 2.112822, 1, 0, 0.1686275, 1,
1.929256, 0.175487, 1.789111, 1, 0, 0.1607843, 1,
1.934908, -0.804498, 3.663023, 1, 0, 0.1568628, 1,
1.951227, -0.7126626, 0.7740963, 1, 0, 0.1490196, 1,
1.955233, 1.396557, 1.067355, 1, 0, 0.145098, 1,
1.962815, 1.918365, -0.7889575, 1, 0, 0.1372549, 1,
1.964435, -0.8481023, 1.74017, 1, 0, 0.1333333, 1,
1.96839, 0.1995844, 0.3866301, 1, 0, 0.1254902, 1,
1.971786, 0.4218549, 3.141612, 1, 0, 0.1215686, 1,
1.983019, 0.1150328, 2.118372, 1, 0, 0.1137255, 1,
1.987243, -1.115581, 1.795409, 1, 0, 0.1098039, 1,
2.001938, -0.4374082, 1.201075, 1, 0, 0.1019608, 1,
2.030773, 0.5879827, 2.806744, 1, 0, 0.09411765, 1,
2.098358, -2.170936, 2.483104, 1, 0, 0.09019608, 1,
2.100078, 0.5739755, 2.986501, 1, 0, 0.08235294, 1,
2.121834, -1.673343, 0.8010325, 1, 0, 0.07843138, 1,
2.129065, 0.7397173, 2.017798, 1, 0, 0.07058824, 1,
2.16383, -0.2054309, 1.337348, 1, 0, 0.06666667, 1,
2.170679, -0.8675672, 1.112105, 1, 0, 0.05882353, 1,
2.207831, -0.4270502, 3.604891, 1, 0, 0.05490196, 1,
2.240302, 0.3522835, 0.503714, 1, 0, 0.04705882, 1,
2.38188, 0.7087483, 1.987126, 1, 0, 0.04313726, 1,
2.38932, -0.1718155, 1.957843, 1, 0, 0.03529412, 1,
2.437493, -0.9579383, 1.555591, 1, 0, 0.03137255, 1,
2.489271, -0.6212586, 2.428172, 1, 0, 0.02352941, 1,
2.525826, -0.5042744, 3.076252, 1, 0, 0.01960784, 1,
2.639754, -0.765695, 1.338915, 1, 0, 0.01176471, 1,
2.963415, 1.808105, 0.6032283, 1, 0, 0.007843138, 1
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
0.0662508, -4.146935, -7.675805, 0, -0.5, 0.5, 0.5,
0.0662508, -4.146935, -7.675805, 1, -0.5, 0.5, 0.5,
0.0662508, -4.146935, -7.675805, 1, 1.5, 0.5, 0.5,
0.0662508, -4.146935, -7.675805, 0, 1.5, 0.5, 0.5
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
-3.813052, 0.07063007, -7.675805, 0, -0.5, 0.5, 0.5,
-3.813052, 0.07063007, -7.675805, 1, -0.5, 0.5, 0.5,
-3.813052, 0.07063007, -7.675805, 1, 1.5, 0.5, 0.5,
-3.813052, 0.07063007, -7.675805, 0, 1.5, 0.5, 0.5
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
-3.813052, -4.146935, 0.0944798, 0, -0.5, 0.5, 0.5,
-3.813052, -4.146935, 0.0944798, 1, -0.5, 0.5, 0.5,
-3.813052, -4.146935, 0.0944798, 1, 1.5, 0.5, 0.5,
-3.813052, -4.146935, 0.0944798, 0, 1.5, 0.5, 0.5
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
-2, -3.173651, -5.882662,
2, -3.173651, -5.882662,
-2, -3.173651, -5.882662,
-2, -3.335865, -6.181519,
-1, -3.173651, -5.882662,
-1, -3.335865, -6.181519,
0, -3.173651, -5.882662,
0, -3.335865, -6.181519,
1, -3.173651, -5.882662,
1, -3.335865, -6.181519,
2, -3.173651, -5.882662,
2, -3.335865, -6.181519
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
-2, -3.660293, -6.779233, 0, -0.5, 0.5, 0.5,
-2, -3.660293, -6.779233, 1, -0.5, 0.5, 0.5,
-2, -3.660293, -6.779233, 1, 1.5, 0.5, 0.5,
-2, -3.660293, -6.779233, 0, 1.5, 0.5, 0.5,
-1, -3.660293, -6.779233, 0, -0.5, 0.5, 0.5,
-1, -3.660293, -6.779233, 1, -0.5, 0.5, 0.5,
-1, -3.660293, -6.779233, 1, 1.5, 0.5, 0.5,
-1, -3.660293, -6.779233, 0, 1.5, 0.5, 0.5,
0, -3.660293, -6.779233, 0, -0.5, 0.5, 0.5,
0, -3.660293, -6.779233, 1, -0.5, 0.5, 0.5,
0, -3.660293, -6.779233, 1, 1.5, 0.5, 0.5,
0, -3.660293, -6.779233, 0, 1.5, 0.5, 0.5,
1, -3.660293, -6.779233, 0, -0.5, 0.5, 0.5,
1, -3.660293, -6.779233, 1, -0.5, 0.5, 0.5,
1, -3.660293, -6.779233, 1, 1.5, 0.5, 0.5,
1, -3.660293, -6.779233, 0, 1.5, 0.5, 0.5,
2, -3.660293, -6.779233, 0, -0.5, 0.5, 0.5,
2, -3.660293, -6.779233, 1, -0.5, 0.5, 0.5,
2, -3.660293, -6.779233, 1, 1.5, 0.5, 0.5,
2, -3.660293, -6.779233, 0, 1.5, 0.5, 0.5
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
-2.917829, -3, -5.882662,
-2.917829, 3, -5.882662,
-2.917829, -3, -5.882662,
-3.067032, -3, -6.181519,
-2.917829, -2, -5.882662,
-3.067032, -2, -6.181519,
-2.917829, -1, -5.882662,
-3.067032, -1, -6.181519,
-2.917829, 0, -5.882662,
-3.067032, 0, -6.181519,
-2.917829, 1, -5.882662,
-3.067032, 1, -6.181519,
-2.917829, 2, -5.882662,
-3.067032, 2, -6.181519,
-2.917829, 3, -5.882662,
-3.067032, 3, -6.181519
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
-3.36544, -3, -6.779233, 0, -0.5, 0.5, 0.5,
-3.36544, -3, -6.779233, 1, -0.5, 0.5, 0.5,
-3.36544, -3, -6.779233, 1, 1.5, 0.5, 0.5,
-3.36544, -3, -6.779233, 0, 1.5, 0.5, 0.5,
-3.36544, -2, -6.779233, 0, -0.5, 0.5, 0.5,
-3.36544, -2, -6.779233, 1, -0.5, 0.5, 0.5,
-3.36544, -2, -6.779233, 1, 1.5, 0.5, 0.5,
-3.36544, -2, -6.779233, 0, 1.5, 0.5, 0.5,
-3.36544, -1, -6.779233, 0, -0.5, 0.5, 0.5,
-3.36544, -1, -6.779233, 1, -0.5, 0.5, 0.5,
-3.36544, -1, -6.779233, 1, 1.5, 0.5, 0.5,
-3.36544, -1, -6.779233, 0, 1.5, 0.5, 0.5,
-3.36544, 0, -6.779233, 0, -0.5, 0.5, 0.5,
-3.36544, 0, -6.779233, 1, -0.5, 0.5, 0.5,
-3.36544, 0, -6.779233, 1, 1.5, 0.5, 0.5,
-3.36544, 0, -6.779233, 0, 1.5, 0.5, 0.5,
-3.36544, 1, -6.779233, 0, -0.5, 0.5, 0.5,
-3.36544, 1, -6.779233, 1, -0.5, 0.5, 0.5,
-3.36544, 1, -6.779233, 1, 1.5, 0.5, 0.5,
-3.36544, 1, -6.779233, 0, 1.5, 0.5, 0.5,
-3.36544, 2, -6.779233, 0, -0.5, 0.5, 0.5,
-3.36544, 2, -6.779233, 1, -0.5, 0.5, 0.5,
-3.36544, 2, -6.779233, 1, 1.5, 0.5, 0.5,
-3.36544, 2, -6.779233, 0, 1.5, 0.5, 0.5,
-3.36544, 3, -6.779233, 0, -0.5, 0.5, 0.5,
-3.36544, 3, -6.779233, 1, -0.5, 0.5, 0.5,
-3.36544, 3, -6.779233, 1, 1.5, 0.5, 0.5,
-3.36544, 3, -6.779233, 0, 1.5, 0.5, 0.5
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
-2.917829, -3.173651, -4,
-2.917829, -3.173651, 4,
-2.917829, -3.173651, -4,
-3.067032, -3.335865, -4,
-2.917829, -3.173651, -2,
-3.067032, -3.335865, -2,
-2.917829, -3.173651, 0,
-3.067032, -3.335865, 0,
-2.917829, -3.173651, 2,
-3.067032, -3.335865, 2,
-2.917829, -3.173651, 4,
-3.067032, -3.335865, 4
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
-3.36544, -3.660293, -4, 0, -0.5, 0.5, 0.5,
-3.36544, -3.660293, -4, 1, -0.5, 0.5, 0.5,
-3.36544, -3.660293, -4, 1, 1.5, 0.5, 0.5,
-3.36544, -3.660293, -4, 0, 1.5, 0.5, 0.5,
-3.36544, -3.660293, -2, 0, -0.5, 0.5, 0.5,
-3.36544, -3.660293, -2, 1, -0.5, 0.5, 0.5,
-3.36544, -3.660293, -2, 1, 1.5, 0.5, 0.5,
-3.36544, -3.660293, -2, 0, 1.5, 0.5, 0.5,
-3.36544, -3.660293, 0, 0, -0.5, 0.5, 0.5,
-3.36544, -3.660293, 0, 1, -0.5, 0.5, 0.5,
-3.36544, -3.660293, 0, 1, 1.5, 0.5, 0.5,
-3.36544, -3.660293, 0, 0, 1.5, 0.5, 0.5,
-3.36544, -3.660293, 2, 0, -0.5, 0.5, 0.5,
-3.36544, -3.660293, 2, 1, -0.5, 0.5, 0.5,
-3.36544, -3.660293, 2, 1, 1.5, 0.5, 0.5,
-3.36544, -3.660293, 2, 0, 1.5, 0.5, 0.5,
-3.36544, -3.660293, 4, 0, -0.5, 0.5, 0.5,
-3.36544, -3.660293, 4, 1, -0.5, 0.5, 0.5,
-3.36544, -3.660293, 4, 1, 1.5, 0.5, 0.5,
-3.36544, -3.660293, 4, 0, 1.5, 0.5, 0.5
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
-2.917829, -3.173651, -5.882662,
-2.917829, 3.314911, -5.882662,
-2.917829, -3.173651, 6.071621,
-2.917829, 3.314911, 6.071621,
-2.917829, -3.173651, -5.882662,
-2.917829, -3.173651, 6.071621,
-2.917829, 3.314911, -5.882662,
-2.917829, 3.314911, 6.071621,
-2.917829, -3.173651, -5.882662,
3.05033, -3.173651, -5.882662,
-2.917829, -3.173651, 6.071621,
3.05033, -3.173651, 6.071621,
-2.917829, 3.314911, -5.882662,
3.05033, 3.314911, -5.882662,
-2.917829, 3.314911, 6.071621,
3.05033, 3.314911, 6.071621,
3.05033, -3.173651, -5.882662,
3.05033, 3.314911, -5.882662,
3.05033, -3.173651, 6.071621,
3.05033, 3.314911, 6.071621,
3.05033, -3.173651, -5.882662,
3.05033, -3.173651, 6.071621,
3.05033, 3.314911, -5.882662,
3.05033, 3.314911, 6.071621
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
var radius = 7.931459;
var distance = 35.28796;
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
mvMatrix.translate( -0.0662508, -0.07063007, -0.0944798 );
mvMatrix.scale( 1.4369, 1.321656, 0.7173704 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.28796);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
clethodim<-read.table("clethodim.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-clethodim$V2
```

```
## Error in eval(expr, envir, enclos): object 'clethodim' not found
```

```r
y<-clethodim$V3
```

```
## Error in eval(expr, envir, enclos): object 'clethodim' not found
```

```r
z<-clethodim$V4
```

```
## Error in eval(expr, envir, enclos): object 'clethodim' not found
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
-2.830914, 2.145841, -2.085082, 0, 0, 1, 1, 1,
-2.709552, -0.2112041, -1.429391, 1, 0, 0, 1, 1,
-2.578844, -0.4726469, -0.3902832, 1, 0, 0, 1, 1,
-2.50149, 1.607838, -1.913177, 1, 0, 0, 1, 1,
-2.430711, 0.9109843, -0.2900508, 1, 0, 0, 1, 1,
-2.417314, 0.720945, -1.64919, 1, 0, 0, 1, 1,
-2.377199, -1.271073, -0.9488097, 0, 0, 0, 1, 1,
-2.356424, -0.2619168, -1.233669, 0, 0, 0, 1, 1,
-2.250615, -1.0994, -3.203914, 0, 0, 0, 1, 1,
-2.198919, 0.5660177, -2.115304, 0, 0, 0, 1, 1,
-2.154929, -1.405495, -2.497114, 0, 0, 0, 1, 1,
-2.143658, -0.6580125, -1.947729, 0, 0, 0, 1, 1,
-2.121767, 0.4825635, -3.183842, 0, 0, 0, 1, 1,
-2.077948, -1.122305, -1.688425, 1, 1, 1, 1, 1,
-2.068188, -1.704603, -2.137125, 1, 1, 1, 1, 1,
-2.06691, 0.4594012, -2.722767, 1, 1, 1, 1, 1,
-2.066562, -1.208158, -2.436324, 1, 1, 1, 1, 1,
-2.051009, 1.792951, -0.8490214, 1, 1, 1, 1, 1,
-2.04638, -1.796288, -2.157594, 1, 1, 1, 1, 1,
-1.963905, 1.315774, -0.7687922, 1, 1, 1, 1, 1,
-1.962698, -0.2574446, -2.976289, 1, 1, 1, 1, 1,
-1.953214, 0.0637706, -2.171471, 1, 1, 1, 1, 1,
-1.945823, 0.05287535, -0.9638366, 1, 1, 1, 1, 1,
-1.942407, -0.8833904, -2.420768, 1, 1, 1, 1, 1,
-1.90798, -1.163915, -2.508479, 1, 1, 1, 1, 1,
-1.905524, -0.7229168, -2.81276, 1, 1, 1, 1, 1,
-1.901527, -1.043875, -3.950267, 1, 1, 1, 1, 1,
-1.891498, -1.796841, -2.327691, 1, 1, 1, 1, 1,
-1.825882, 0.1368401, -1.18806, 0, 0, 1, 1, 1,
-1.819424, -0.9606165, -2.454538, 1, 0, 0, 1, 1,
-1.797624, -0.08006438, -3.245422, 1, 0, 0, 1, 1,
-1.795404, 0.08014222, -2.052345, 1, 0, 0, 1, 1,
-1.790483, 0.1840004, -2.656667, 1, 0, 0, 1, 1,
-1.789715, 1.168442, -1.720653, 1, 0, 0, 1, 1,
-1.787892, -1.956609, -3.670772, 0, 0, 0, 1, 1,
-1.783438, 1.581704, -1.403251, 0, 0, 0, 1, 1,
-1.771289, 1.219782, -0.1908859, 0, 0, 0, 1, 1,
-1.763065, 1.80486, -0.528909, 0, 0, 0, 1, 1,
-1.739699, 0.6480862, -2.306839, 0, 0, 0, 1, 1,
-1.73158, 0.3050979, -2.930506, 0, 0, 0, 1, 1,
-1.711915, 1.575671, -0.5080338, 0, 0, 0, 1, 1,
-1.708001, -0.1714574, -0.3472023, 1, 1, 1, 1, 1,
-1.705647, -0.003572931, -1.38892, 1, 1, 1, 1, 1,
-1.698153, -1.115983, -1.263036, 1, 1, 1, 1, 1,
-1.685983, -0.7915856, -2.247093, 1, 1, 1, 1, 1,
-1.685948, -0.1808017, 0.1862303, 1, 1, 1, 1, 1,
-1.66108, 1.262779, -1.453539, 1, 1, 1, 1, 1,
-1.652258, 1.37693, -1.266411, 1, 1, 1, 1, 1,
-1.639513, -0.1637351, -0.9886299, 1, 1, 1, 1, 1,
-1.635903, -0.8027266, -3.129436, 1, 1, 1, 1, 1,
-1.617507, 0.7949568, -0.8914068, 1, 1, 1, 1, 1,
-1.608703, -0.6416678, -1.062861, 1, 1, 1, 1, 1,
-1.607041, 0.7072566, -1.250605, 1, 1, 1, 1, 1,
-1.599908, 0.9947522, -2.283115, 1, 1, 1, 1, 1,
-1.590099, -1.109151, -3.566347, 1, 1, 1, 1, 1,
-1.574809, -0.4783619, -0.6861506, 1, 1, 1, 1, 1,
-1.572471, 1.422164, -2.287076, 0, 0, 1, 1, 1,
-1.567495, -0.6258112, -3.165791, 1, 0, 0, 1, 1,
-1.533677, 1.474244, -0.2980028, 1, 0, 0, 1, 1,
-1.528696, -0.5437597, -1.747382, 1, 0, 0, 1, 1,
-1.525552, 0.7975891, 0.5151669, 1, 0, 0, 1, 1,
-1.52223, -1.201372, -0.970667, 1, 0, 0, 1, 1,
-1.508435, 0.8375829, -1.129174, 0, 0, 0, 1, 1,
-1.506848, 1.190663, -0.9440714, 0, 0, 0, 1, 1,
-1.492708, 1.059088, -1.610882, 0, 0, 0, 1, 1,
-1.487713, -1.072989, -3.41219, 0, 0, 0, 1, 1,
-1.483756, -0.07582644, -2.114028, 0, 0, 0, 1, 1,
-1.473493, 0.4367545, -2.202335, 0, 0, 0, 1, 1,
-1.469342, -1.553482, -2.557231, 0, 0, 0, 1, 1,
-1.468516, -2.778463, -2.918243, 1, 1, 1, 1, 1,
-1.46386, 1.228007, 0.2084924, 1, 1, 1, 1, 1,
-1.456953, 1.883712, 0.5264719, 1, 1, 1, 1, 1,
-1.448716, 0.2489881, -0.0550116, 1, 1, 1, 1, 1,
-1.445504, 0.954548, -0.4351233, 1, 1, 1, 1, 1,
-1.439143, 0.3866103, -1.041665, 1, 1, 1, 1, 1,
-1.42733, 1.216438, 0.2494027, 1, 1, 1, 1, 1,
-1.402755, -1.337256, -1.838257, 1, 1, 1, 1, 1,
-1.402573, 0.6572773, -0.3043117, 1, 1, 1, 1, 1,
-1.402258, 0.1127122, -1.875606, 1, 1, 1, 1, 1,
-1.39795, 0.3470943, -0.6829662, 1, 1, 1, 1, 1,
-1.383528, -0.972463, -2.824757, 1, 1, 1, 1, 1,
-1.380219, 0.1349664, -0.8872486, 1, 1, 1, 1, 1,
-1.378871, -0.511037, -1.698007, 1, 1, 1, 1, 1,
-1.370555, -0.8322285, 0.4620063, 1, 1, 1, 1, 1,
-1.367574, -0.4845404, -1.119308, 0, 0, 1, 1, 1,
-1.350609, 0.3022211, -3.866012, 1, 0, 0, 1, 1,
-1.348603, 0.4610698, 0.5386971, 1, 0, 0, 1, 1,
-1.339293, 0.3955288, -0.4357187, 1, 0, 0, 1, 1,
-1.338097, -1.0823, -2.564876, 1, 0, 0, 1, 1,
-1.334307, 0.6052357, -1.658053, 1, 0, 0, 1, 1,
-1.333217, 1.302716, -1.004766, 0, 0, 0, 1, 1,
-1.328353, 0.2381976, -1.503146, 0, 0, 0, 1, 1,
-1.327205, 0.4267851, -0.04430567, 0, 0, 0, 1, 1,
-1.324941, -0.07124315, -1.515887, 0, 0, 0, 1, 1,
-1.318502, 0.4528567, -1.201186, 0, 0, 0, 1, 1,
-1.312571, -0.04352031, -2.606542, 0, 0, 0, 1, 1,
-1.310758, -0.3546909, -2.579131, 0, 0, 0, 1, 1,
-1.306655, -0.08869157, -1.744983, 1, 1, 1, 1, 1,
-1.305185, 0.2211291, -0.6164704, 1, 1, 1, 1, 1,
-1.297039, -0.8417513, -0.6534834, 1, 1, 1, 1, 1,
-1.293613, -1.10318, -2.865752, 1, 1, 1, 1, 1,
-1.271209, 0.4814264, -2.822587, 1, 1, 1, 1, 1,
-1.262825, 0.1213431, -1.464955, 1, 1, 1, 1, 1,
-1.245808, 0.2108886, -1.298303, 1, 1, 1, 1, 1,
-1.245741, 1.491604, -1.76037, 1, 1, 1, 1, 1,
-1.236909, -0.03708516, -1.280108, 1, 1, 1, 1, 1,
-1.234608, 1.143091, 0.3283638, 1, 1, 1, 1, 1,
-1.232206, -0.5190045, -1.134064, 1, 1, 1, 1, 1,
-1.228273, 0.950261, -1.837952, 1, 1, 1, 1, 1,
-1.209889, -0.1433281, -2.958636, 1, 1, 1, 1, 1,
-1.191427, -0.6962395, -1.0761, 1, 1, 1, 1, 1,
-1.190949, -1.185995, -1.129901, 1, 1, 1, 1, 1,
-1.18626, -0.3644039, -3.098922, 0, 0, 1, 1, 1,
-1.185636, -0.5195466, -2.011374, 1, 0, 0, 1, 1,
-1.18167, 0.2301346, -2.107963, 1, 0, 0, 1, 1,
-1.180149, 0.1167941, -3.504647, 1, 0, 0, 1, 1,
-1.178791, -0.5537269, -1.370851, 1, 0, 0, 1, 1,
-1.17763, 0.05385481, -3.072499, 1, 0, 0, 1, 1,
-1.177303, 1.09119, 0.03912583, 0, 0, 0, 1, 1,
-1.177004, -0.7020135, -1.040323, 0, 0, 0, 1, 1,
-1.161331, 0.9754305, -1.772276, 0, 0, 0, 1, 1,
-1.155844, -0.1297596, 1.024293, 0, 0, 0, 1, 1,
-1.151622, -1.849138, -2.806464, 0, 0, 0, 1, 1,
-1.145215, 0.5166854, 1.07568, 0, 0, 0, 1, 1,
-1.143884, -1.281469, -3.551126, 0, 0, 0, 1, 1,
-1.141684, -0.6719615, -1.338196, 1, 1, 1, 1, 1,
-1.135794, -1.205632, -1.474648, 1, 1, 1, 1, 1,
-1.130022, 0.1203306, 0.7738332, 1, 1, 1, 1, 1,
-1.126489, -1.420136, -2.918143, 1, 1, 1, 1, 1,
-1.126347, -0.8655382, -2.342676, 1, 1, 1, 1, 1,
-1.125283, -1.104137, -2.512122, 1, 1, 1, 1, 1,
-1.108999, -0.8672817, -2.282397, 1, 1, 1, 1, 1,
-1.106457, -0.4024544, -1.499961, 1, 1, 1, 1, 1,
-1.099792, 0.472663, -0.9981862, 1, 1, 1, 1, 1,
-1.095595, 0.1593362, -1.275771, 1, 1, 1, 1, 1,
-1.092139, -0.4499544, -1.819322, 1, 1, 1, 1, 1,
-1.091954, 0.6965212, -1.049221, 1, 1, 1, 1, 1,
-1.087607, -0.3270304, -1.215372, 1, 1, 1, 1, 1,
-1.085747, 0.6530792, -0.7794451, 1, 1, 1, 1, 1,
-1.083109, -0.7552194, -1.832338, 1, 1, 1, 1, 1,
-1.075871, 0.4766764, -0.7983893, 0, 0, 1, 1, 1,
-1.074367, -0.5282115, -2.160622, 1, 0, 0, 1, 1,
-1.064959, -0.4527894, -2.628782, 1, 0, 0, 1, 1,
-1.058525, -0.04364019, -2.02703, 1, 0, 0, 1, 1,
-1.038162, 0.3365206, -1.2498, 1, 0, 0, 1, 1,
-1.03704, 0.04599956, -2.189031, 1, 0, 0, 1, 1,
-1.034918, -0.6113333, -3.275675, 0, 0, 0, 1, 1,
-1.030563, -1.497924, -1.180497, 0, 0, 0, 1, 1,
-1.029478, 0.539958, -3.107977, 0, 0, 0, 1, 1,
-1.027432, -0.1009593, -4.167088, 0, 0, 0, 1, 1,
-1.023979, -1.563462, -2.468421, 0, 0, 0, 1, 1,
-1.023227, -0.4294292, -2.062263, 0, 0, 0, 1, 1,
-1.021337, -1.274742, -1.469671, 0, 0, 0, 1, 1,
-1.016973, 0.153696, -0.8338445, 1, 1, 1, 1, 1,
-1.00787, -0.7032208, -3.498181, 1, 1, 1, 1, 1,
-1.006794, 1.019127, -0.9748867, 1, 1, 1, 1, 1,
-0.9997609, 0.1456341, -0.1096308, 1, 1, 1, 1, 1,
-0.9933677, 0.06044543, -2.006365, 1, 1, 1, 1, 1,
-0.9915997, 0.04270084, -0.8713906, 1, 1, 1, 1, 1,
-0.9905854, 0.8806854, -0.9130677, 1, 1, 1, 1, 1,
-0.9860836, -0.3173433, -3.349775, 1, 1, 1, 1, 1,
-0.9854212, 0.3657086, -0.9075375, 1, 1, 1, 1, 1,
-0.9803174, 0.3352128, -1.165347, 1, 1, 1, 1, 1,
-0.973503, -0.7275622, -3.151276, 1, 1, 1, 1, 1,
-0.9586326, -0.1405108, -2.527021, 1, 1, 1, 1, 1,
-0.954635, 0.4810419, -0.7884143, 1, 1, 1, 1, 1,
-0.9525982, -0.5824852, -0.2431289, 1, 1, 1, 1, 1,
-0.9521822, -0.157761, -2.491004, 1, 1, 1, 1, 1,
-0.9468282, 0.9685696, -2.016199, 0, 0, 1, 1, 1,
-0.9434589, -0.154054, 0.3545092, 1, 0, 0, 1, 1,
-0.9425078, 0.9356121, -1.52067, 1, 0, 0, 1, 1,
-0.9384311, -0.7392337, -1.544409, 1, 0, 0, 1, 1,
-0.9307834, 0.6895947, -1.514087, 1, 0, 0, 1, 1,
-0.9291658, -0.005419287, -1.061658, 1, 0, 0, 1, 1,
-0.9287724, -1.274625, -2.8093, 0, 0, 0, 1, 1,
-0.9241407, -0.07100221, -3.562421, 0, 0, 0, 1, 1,
-0.9240283, -0.6701637, -2.865933, 0, 0, 0, 1, 1,
-0.9172391, -0.8318897, -0.1147237, 0, 0, 0, 1, 1,
-0.9114463, -0.8181742, -3.356215, 0, 0, 0, 1, 1,
-0.9109937, 0.1253496, -3.404306, 0, 0, 0, 1, 1,
-0.9093754, 0.07182398, -1.117678, 0, 0, 0, 1, 1,
-0.9089475, 1.286919, -1.58858, 1, 1, 1, 1, 1,
-0.9054383, -0.6197877, -0.521361, 1, 1, 1, 1, 1,
-0.9004601, 0.05050317, -0.3546056, 1, 1, 1, 1, 1,
-0.8981342, -0.602939, -1.279522, 1, 1, 1, 1, 1,
-0.8977546, -1.302896, -3.131453, 1, 1, 1, 1, 1,
-0.8943521, 1.288433, -0.2531425, 1, 1, 1, 1, 1,
-0.8888103, -0.8605313, -1.500516, 1, 1, 1, 1, 1,
-0.8883075, 0.2334728, -2.735252, 1, 1, 1, 1, 1,
-0.8837279, 0.4299201, -2.624316, 1, 1, 1, 1, 1,
-0.8828266, -1.382002, -1.814073, 1, 1, 1, 1, 1,
-0.8822016, 0.5047654, -2.159428, 1, 1, 1, 1, 1,
-0.8775312, 1.708853, -1.538193, 1, 1, 1, 1, 1,
-0.8774205, 0.2589005, -0.0485692, 1, 1, 1, 1, 1,
-0.8758605, 1.607721, -1.680678, 1, 1, 1, 1, 1,
-0.8722154, 0.9566241, 0.7580793, 1, 1, 1, 1, 1,
-0.8716463, 1.433964, -0.6762281, 0, 0, 1, 1, 1,
-0.8711954, 1.003611, -1.743003, 1, 0, 0, 1, 1,
-0.8634092, -0.7331203, -2.664737, 1, 0, 0, 1, 1,
-0.8611318, -0.1497365, -1.426613, 1, 0, 0, 1, 1,
-0.8568618, 1.464729, -0.9649478, 1, 0, 0, 1, 1,
-0.8421208, -0.5421699, -0.8271121, 1, 0, 0, 1, 1,
-0.8397673, -0.6416821, -0.8521859, 0, 0, 0, 1, 1,
-0.8386979, 0.1773548, -2.805675, 0, 0, 0, 1, 1,
-0.8381619, -0.4866121, -1.060421, 0, 0, 0, 1, 1,
-0.8320883, -0.792403, -1.264634, 0, 0, 0, 1, 1,
-0.8314852, -1.275171, -2.352006, 0, 0, 0, 1, 1,
-0.8291874, -1.89037, -1.826053, 0, 0, 0, 1, 1,
-0.8196141, 0.1856679, -1.229483, 0, 0, 0, 1, 1,
-0.8159562, -0.7951491, -2.555278, 1, 1, 1, 1, 1,
-0.815679, -0.2419407, -3.122817, 1, 1, 1, 1, 1,
-0.8117816, -1.009805, -2.720509, 1, 1, 1, 1, 1,
-0.8102397, 0.2036118, 0.3271702, 1, 1, 1, 1, 1,
-0.8077042, -0.6301436, -1.927912, 1, 1, 1, 1, 1,
-0.8068746, 0.2445379, -1.672309, 1, 1, 1, 1, 1,
-0.8057779, 0.834915, -0.3291423, 1, 1, 1, 1, 1,
-0.8041109, 0.973395, -1.863899, 1, 1, 1, 1, 1,
-0.7998369, -1.091372, 0.1504632, 1, 1, 1, 1, 1,
-0.7982922, -0.658269, -2.82252, 1, 1, 1, 1, 1,
-0.797227, 1.916598, -2.894228, 1, 1, 1, 1, 1,
-0.7877131, -1.17561, -2.047436, 1, 1, 1, 1, 1,
-0.7863885, 0.2112789, -0.4745421, 1, 1, 1, 1, 1,
-0.7748668, -0.3590846, -1.982686, 1, 1, 1, 1, 1,
-0.7748492, -0.1692613, -2.151614, 1, 1, 1, 1, 1,
-0.7747528, -1.532326, -2.151754, 0, 0, 1, 1, 1,
-0.7730042, 1.870036, 0.2873683, 1, 0, 0, 1, 1,
-0.7697064, -0.2589866, -2.234629, 1, 0, 0, 1, 1,
-0.7659798, -0.7172471, -4.822286, 1, 0, 0, 1, 1,
-0.7624336, -0.8405846, -2.195626, 1, 0, 0, 1, 1,
-0.7623551, 1.91674, 2.631876, 1, 0, 0, 1, 1,
-0.7613792, -1.532494, -4.203321, 0, 0, 0, 1, 1,
-0.7589322, 2.016341, -1.407976, 0, 0, 0, 1, 1,
-0.7581642, -2.118667, -3.329798, 0, 0, 0, 1, 1,
-0.7568211, -0.1995985, 0.5942999, 0, 0, 0, 1, 1,
-0.7562301, 1.796279, -0.3536571, 0, 0, 0, 1, 1,
-0.7525468, -0.02812863, -0.9794949, 0, 0, 0, 1, 1,
-0.744265, -2.673272, -3.076391, 0, 0, 0, 1, 1,
-0.7421197, 1.043473, -0.6015582, 1, 1, 1, 1, 1,
-0.7332714, 0.3213271, -1.692765, 1, 1, 1, 1, 1,
-0.7312812, 2.129933, -0.8581483, 1, 1, 1, 1, 1,
-0.7210323, 0.5824415, -0.7066668, 1, 1, 1, 1, 1,
-0.7165192, 0.9621606, -1.043075, 1, 1, 1, 1, 1,
-0.7139849, 0.4794924, -2.574421, 1, 1, 1, 1, 1,
-0.7098604, 0.4677154, -0.7864712, 1, 1, 1, 1, 1,
-0.709785, -2.040355, -1.656939, 1, 1, 1, 1, 1,
-0.7035584, -0.5106747, -0.7952003, 1, 1, 1, 1, 1,
-0.6999633, -0.01655137, -2.149785, 1, 1, 1, 1, 1,
-0.6994641, -1.155908, -1.341187, 1, 1, 1, 1, 1,
-0.6981516, 1.063001, -0.6308086, 1, 1, 1, 1, 1,
-0.6887113, 1.400315, -0.6047507, 1, 1, 1, 1, 1,
-0.6685134, 1.44733, -0.3695615, 1, 1, 1, 1, 1,
-0.6681994, 1.215776, 0.8494818, 1, 1, 1, 1, 1,
-0.6652413, 0.5870432, -1.537776, 0, 0, 1, 1, 1,
-0.6628534, -3.079158, -1.74535, 1, 0, 0, 1, 1,
-0.6517928, -0.8397586, -0.7106248, 1, 0, 0, 1, 1,
-0.648575, 0.3601942, -1.385022, 1, 0, 0, 1, 1,
-0.6448158, 0.7464672, -0.09315391, 1, 0, 0, 1, 1,
-0.6430227, 0.5994877, -1.575438, 1, 0, 0, 1, 1,
-0.6344244, -1.799456, -3.27089, 0, 0, 0, 1, 1,
-0.6302398, 0.9188734, 0.383204, 0, 0, 0, 1, 1,
-0.6274466, 0.03811765, -2.882038, 0, 0, 0, 1, 1,
-0.6189764, -0.2458254, -2.143662, 0, 0, 0, 1, 1,
-0.6176947, 0.6545024, -3.002566, 0, 0, 0, 1, 1,
-0.6092244, -1.135018, -2.479433, 0, 0, 0, 1, 1,
-0.6071584, 0.2943597, -0.2396818, 0, 0, 0, 1, 1,
-0.6061036, 1.206806, 0.2781916, 1, 1, 1, 1, 1,
-0.6002316, 0.5677809, -1.465873, 1, 1, 1, 1, 1,
-0.5993878, 0.4930855, 0.1591555, 1, 1, 1, 1, 1,
-0.5972817, -1.03366, -1.403334, 1, 1, 1, 1, 1,
-0.5895626, -0.6757646, -3.432003, 1, 1, 1, 1, 1,
-0.5881978, -0.3384507, -1.804383, 1, 1, 1, 1, 1,
-0.5877895, -0.03858687, -1.888734, 1, 1, 1, 1, 1,
-0.5849137, 1.280906, -1.465972, 1, 1, 1, 1, 1,
-0.5751151, -0.2456576, -2.566309, 1, 1, 1, 1, 1,
-0.5709674, -0.1263523, -1.319668, 1, 1, 1, 1, 1,
-0.5698095, 0.4889856, 0.07022303, 1, 1, 1, 1, 1,
-0.5688224, -0.2679535, -3.13704, 1, 1, 1, 1, 1,
-0.5683528, 1.768759, -0.6496049, 1, 1, 1, 1, 1,
-0.5619032, 2.06473, -1.262133, 1, 1, 1, 1, 1,
-0.5605498, -0.199597, -2.279574, 1, 1, 1, 1, 1,
-0.5573381, 0.7559062, 0.5944618, 0, 0, 1, 1, 1,
-0.5547243, 2.464331, -0.7572999, 1, 0, 0, 1, 1,
-0.5519331, -0.8838538, -3.072253, 1, 0, 0, 1, 1,
-0.5407206, 0.1627813, -1.500015, 1, 0, 0, 1, 1,
-0.5365903, 0.3502313, -1.434753, 1, 0, 0, 1, 1,
-0.5357677, -0.665448, -1.600376, 1, 0, 0, 1, 1,
-0.5350806, -1.257923, -0.6219644, 0, 0, 0, 1, 1,
-0.5332438, -1.043033, -2.211374, 0, 0, 0, 1, 1,
-0.5309213, -0.3313879, -1.721467, 0, 0, 0, 1, 1,
-0.526911, 0.8565758, -0.416125, 0, 0, 0, 1, 1,
-0.5253065, 0.2825881, -1.141078, 0, 0, 0, 1, 1,
-0.5204098, 2.596106, -1.529308, 0, 0, 0, 1, 1,
-0.5181147, 0.5319, -2.509635, 0, 0, 0, 1, 1,
-0.5152649, -0.8034406, -2.101435, 1, 1, 1, 1, 1,
-0.5114588, 0.2284184, -1.859008, 1, 1, 1, 1, 1,
-0.5099369, 0.2578763, -2.890026, 1, 1, 1, 1, 1,
-0.5075114, -0.6997191, -3.104926, 1, 1, 1, 1, 1,
-0.5074446, -0.1986082, -2.646136, 1, 1, 1, 1, 1,
-0.5068485, 1.835862, -2.089019, 1, 1, 1, 1, 1,
-0.5041838, 0.7791417, -0.6085194, 1, 1, 1, 1, 1,
-0.5032645, 0.1621846, -1.768967, 1, 1, 1, 1, 1,
-0.5008202, 0.8374011, 0.4490327, 1, 1, 1, 1, 1,
-0.4999325, -0.08957897, -3.300641, 1, 1, 1, 1, 1,
-0.4995059, -0.9104455, -2.72422, 1, 1, 1, 1, 1,
-0.4990608, -2.160228, -3.517153, 1, 1, 1, 1, 1,
-0.4980811, 1.419073, -1.219576, 1, 1, 1, 1, 1,
-0.4975967, 1.189655, -1.152028, 1, 1, 1, 1, 1,
-0.4942375, 0.3134121, -2.091796, 1, 1, 1, 1, 1,
-0.4918805, -1.410476, -2.768331, 0, 0, 1, 1, 1,
-0.4917524, -0.04585805, -1.328411, 1, 0, 0, 1, 1,
-0.4892546, 2.023031, -0.182456, 1, 0, 0, 1, 1,
-0.4856817, 0.9998162, -0.9128028, 1, 0, 0, 1, 1,
-0.4839043, -1.191637, -1.9377, 1, 0, 0, 1, 1,
-0.4762917, -0.009344064, -3.362185, 1, 0, 0, 1, 1,
-0.474797, -1.047957, -3.864635, 0, 0, 0, 1, 1,
-0.4713718, -1.405046, -2.27219, 0, 0, 0, 1, 1,
-0.4676015, 0.5273054, 0.9299659, 0, 0, 0, 1, 1,
-0.4673555, -1.593849, -4.008606, 0, 0, 0, 1, 1,
-0.4655727, -0.8660012, -5.70857, 0, 0, 0, 1, 1,
-0.4645638, -0.7040772, -3.178419, 0, 0, 0, 1, 1,
-0.4644505, 0.8750929, -2.302196, 0, 0, 0, 1, 1,
-0.4528709, 0.7042235, -1.188617, 1, 1, 1, 1, 1,
-0.4526098, 0.676185, -0.6861967, 1, 1, 1, 1, 1,
-0.4503224, 0.002685931, -1.63922, 1, 1, 1, 1, 1,
-0.4465134, 0.6093618, -0.5432942, 1, 1, 1, 1, 1,
-0.4461316, 0.4994664, -1.125404, 1, 1, 1, 1, 1,
-0.4406804, -1.929955, -2.157544, 1, 1, 1, 1, 1,
-0.4396237, 0.8762544, -0.205906, 1, 1, 1, 1, 1,
-0.4383433, 1.480142, -1.267377, 1, 1, 1, 1, 1,
-0.4370894, 0.4877005, -1.430781, 1, 1, 1, 1, 1,
-0.4359432, 0.9584225, -1.121556, 1, 1, 1, 1, 1,
-0.4358645, -1.406865, -4.545603, 1, 1, 1, 1, 1,
-0.435045, -1.143614, -1.993008, 1, 1, 1, 1, 1,
-0.4324093, 0.3665872, -1.125407, 1, 1, 1, 1, 1,
-0.4298538, -1.536709, -1.089379, 1, 1, 1, 1, 1,
-0.4296137, 1.919959, -0.6382791, 1, 1, 1, 1, 1,
-0.4287789, 0.2213106, -0.677993, 0, 0, 1, 1, 1,
-0.426367, -0.2844744, -2.997632, 1, 0, 0, 1, 1,
-0.4256286, 1.435237, -0.5677585, 1, 0, 0, 1, 1,
-0.4254397, -1.177568, -2.563871, 1, 0, 0, 1, 1,
-0.4246935, -1.572894, -2.368281, 1, 0, 0, 1, 1,
-0.4223062, 0.5202578, -1.028258, 1, 0, 0, 1, 1,
-0.421835, 0.6825323, -0.6227982, 0, 0, 0, 1, 1,
-0.4197961, 2.130917, 1.274258, 0, 0, 0, 1, 1,
-0.4108694, -0.6944216, -4.515796, 0, 0, 0, 1, 1,
-0.4055159, 0.1036599, 1.089386, 0, 0, 0, 1, 1,
-0.4051918, -0.9366742, -4.138636, 0, 0, 0, 1, 1,
-0.4015991, -0.3451759, -2.733659, 0, 0, 0, 1, 1,
-0.4012642, -1.477571, -3.589082, 0, 0, 0, 1, 1,
-0.3976093, -0.05999216, -2.35552, 1, 1, 1, 1, 1,
-0.3937948, -0.6181732, -3.081243, 1, 1, 1, 1, 1,
-0.3871885, -0.3219568, -3.295721, 1, 1, 1, 1, 1,
-0.3864759, 0.2714225, -2.394714, 1, 1, 1, 1, 1,
-0.3791502, -0.6260302, -3.174717, 1, 1, 1, 1, 1,
-0.3692775, -0.06182122, -2.410632, 1, 1, 1, 1, 1,
-0.3683817, -0.5517333, -4.341359, 1, 1, 1, 1, 1,
-0.3644491, 0.5680566, -1.011245, 1, 1, 1, 1, 1,
-0.361627, -0.2539214, -1.817559, 1, 1, 1, 1, 1,
-0.3612541, -1.437075, -3.191366, 1, 1, 1, 1, 1,
-0.3557197, 0.8418601, 0.5743655, 1, 1, 1, 1, 1,
-0.35121, 0.5321422, -0.003679595, 1, 1, 1, 1, 1,
-0.3492104, 1.815239, 0.08977132, 1, 1, 1, 1, 1,
-0.3473399, 0.632772, -0.07233369, 1, 1, 1, 1, 1,
-0.3468426, -1.662831, -2.127193, 1, 1, 1, 1, 1,
-0.3467015, -0.4849846, -1.157656, 0, 0, 1, 1, 1,
-0.3400046, 0.2710288, -0.7219304, 1, 0, 0, 1, 1,
-0.3385783, 0.4157902, -0.7222404, 1, 0, 0, 1, 1,
-0.3346209, 1.189961, -1.632442, 1, 0, 0, 1, 1,
-0.3304695, 0.1595229, -0.6122328, 1, 0, 0, 1, 1,
-0.3302453, -1.140581, -3.278662, 1, 0, 0, 1, 1,
-0.3257306, -0.5524032, -1.119585, 0, 0, 0, 1, 1,
-0.32568, 0.2842385, -0.2871892, 0, 0, 0, 1, 1,
-0.3243996, 0.8497153, -0.8366537, 0, 0, 0, 1, 1,
-0.3238862, 1.498356, -0.9015273, 0, 0, 0, 1, 1,
-0.3222588, -0.8919576, -3.613363, 0, 0, 0, 1, 1,
-0.3199039, -0.4215381, -3.272968, 0, 0, 0, 1, 1,
-0.318139, 0.9568622, 0.6079648, 0, 0, 0, 1, 1,
-0.3168356, 0.1074618, -0.06362291, 1, 1, 1, 1, 1,
-0.3143109, -0.4744594, -4.511574, 1, 1, 1, 1, 1,
-0.3130738, -0.6468518, -2.939731, 1, 1, 1, 1, 1,
-0.3123375, -0.2064335, -0.2235049, 1, 1, 1, 1, 1,
-0.3117366, -0.235014, -1.461734, 1, 1, 1, 1, 1,
-0.3109114, 1.621405, 0.6144553, 1, 1, 1, 1, 1,
-0.3098865, -0.8259385, -3.901816, 1, 1, 1, 1, 1,
-0.3028339, -0.04577318, -1.374573, 1, 1, 1, 1, 1,
-0.3023667, -0.9159895, -3.964556, 1, 1, 1, 1, 1,
-0.2998311, -0.310033, -1.120107, 1, 1, 1, 1, 1,
-0.2981095, 0.6906705, -1.696945, 1, 1, 1, 1, 1,
-0.2952333, 0.6764978, 1.213028, 1, 1, 1, 1, 1,
-0.295106, -1.153863, -3.165525, 1, 1, 1, 1, 1,
-0.29279, 2.225268, 1.48487, 1, 1, 1, 1, 1,
-0.2916066, 0.6242867, -0.8357865, 1, 1, 1, 1, 1,
-0.2772383, 1.043009, -1.208124, 0, 0, 1, 1, 1,
-0.2758849, -1.112225, -4.213407, 1, 0, 0, 1, 1,
-0.2745423, -0.3297729, -3.191582, 1, 0, 0, 1, 1,
-0.273167, 0.008995906, -1.521118, 1, 0, 0, 1, 1,
-0.2728161, -1.630063, -3.402331, 1, 0, 0, 1, 1,
-0.2691687, 0.2664884, -2.453339, 1, 0, 0, 1, 1,
-0.268298, -1.014088, -3.614639, 0, 0, 0, 1, 1,
-0.2670283, 1.375234, -0.008263229, 0, 0, 0, 1, 1,
-0.2656904, -0.6674309, -3.691449, 0, 0, 0, 1, 1,
-0.2638708, 1.657352, -0.1883857, 0, 0, 0, 1, 1,
-0.2617925, -1.53348, -2.992308, 0, 0, 0, 1, 1,
-0.2614027, -0.9470423, -4.120245, 0, 0, 0, 1, 1,
-0.256632, -1.707009, -1.590925, 0, 0, 0, 1, 1,
-0.2541637, -0.3199012, -2.568475, 1, 1, 1, 1, 1,
-0.2527272, -0.01606502, -2.277344, 1, 1, 1, 1, 1,
-0.2518278, 1.144503, 1.003036, 1, 1, 1, 1, 1,
-0.2477407, 2.087518, -1.673987, 1, 1, 1, 1, 1,
-0.2460628, 0.1893728, -1.179298, 1, 1, 1, 1, 1,
-0.2453528, 0.6040777, 0.5957935, 1, 1, 1, 1, 1,
-0.2428319, -0.08823479, -1.152305, 1, 1, 1, 1, 1,
-0.2415451, -0.1192234, -1.762281, 1, 1, 1, 1, 1,
-0.2380107, -0.2859794, -3.726877, 1, 1, 1, 1, 1,
-0.2346972, -0.7834059, -3.310813, 1, 1, 1, 1, 1,
-0.2316514, 1.242985, -1.288723, 1, 1, 1, 1, 1,
-0.2294562, 0.02245962, -2.35146, 1, 1, 1, 1, 1,
-0.2293863, -0.5279886, -0.569945, 1, 1, 1, 1, 1,
-0.2285533, -1.240115, -2.688658, 1, 1, 1, 1, 1,
-0.2259943, -2.194493, -1.072252, 1, 1, 1, 1, 1,
-0.2259817, -1.646322, -2.043205, 0, 0, 1, 1, 1,
-0.2200344, 1.171481, -0.02347586, 1, 0, 0, 1, 1,
-0.2181605, -0.04335278, -1.791145, 1, 0, 0, 1, 1,
-0.2120678, 1.139035, 0.183381, 1, 0, 0, 1, 1,
-0.2109672, 0.07523727, -4.244655, 1, 0, 0, 1, 1,
-0.2074536, 0.5369655, -0.6412221, 1, 0, 0, 1, 1,
-0.2059526, 1.38084, -0.6971555, 0, 0, 0, 1, 1,
-0.2052266, -1.604834, -3.727929, 0, 0, 0, 1, 1,
-0.2008382, -2.015063, -1.938584, 0, 0, 0, 1, 1,
-0.1971849, 1.113427, -1.349153, 0, 0, 0, 1, 1,
-0.1951485, 0.05447366, -1.55585, 0, 0, 0, 1, 1,
-0.1942435, 0.8329193, -0.8059123, 0, 0, 0, 1, 1,
-0.1880741, -1.070986, -3.054135, 0, 0, 0, 1, 1,
-0.1854654, -0.7727866, -1.598527, 1, 1, 1, 1, 1,
-0.1844405, 0.2211347, -0.8391594, 1, 1, 1, 1, 1,
-0.182147, -1.122725, -2.288814, 1, 1, 1, 1, 1,
-0.1820188, -0.521194, -3.07368, 1, 1, 1, 1, 1,
-0.1818166, -0.3004713, -2.562405, 1, 1, 1, 1, 1,
-0.1810639, 0.1528316, -1.791141, 1, 1, 1, 1, 1,
-0.1786918, 1.040857, -0.4998995, 1, 1, 1, 1, 1,
-0.178122, -0.763403, -2.583895, 1, 1, 1, 1, 1,
-0.1778103, -0.6899358, -4.965407, 1, 1, 1, 1, 1,
-0.1771465, 0.76335, 0.9666442, 1, 1, 1, 1, 1,
-0.1769732, -0.5852864, -1.59056, 1, 1, 1, 1, 1,
-0.176719, -0.4632453, -2.478799, 1, 1, 1, 1, 1,
-0.1754115, 1.162642, 1.563807, 1, 1, 1, 1, 1,
-0.1723736, 2.423598, -0.5157844, 1, 1, 1, 1, 1,
-0.1704169, 0.04974817, -1.200059, 1, 1, 1, 1, 1,
-0.1703202, -1.173876, -2.728846, 0, 0, 1, 1, 1,
-0.1697598, -0.5204241, -2.572008, 1, 0, 0, 1, 1,
-0.162142, -0.2918035, -1.677384, 1, 0, 0, 1, 1,
-0.1597312, -0.008607234, -2.677251, 1, 0, 0, 1, 1,
-0.1594727, 0.1398093, -1.877988, 1, 0, 0, 1, 1,
-0.1526871, -0.2271572, -3.078492, 1, 0, 0, 1, 1,
-0.1521922, -1.696847, -3.882226, 0, 0, 0, 1, 1,
-0.1494889, -0.3422709, -1.651213, 0, 0, 0, 1, 1,
-0.1489781, -0.007917391, -2.654663, 0, 0, 0, 1, 1,
-0.1484173, -0.4123595, -2.362827, 0, 0, 0, 1, 1,
-0.1467461, -0.4251905, -1.284522, 0, 0, 0, 1, 1,
-0.1434169, -1.520172, -2.077198, 0, 0, 0, 1, 1,
-0.1425247, 0.3404664, -1.241469, 0, 0, 0, 1, 1,
-0.1416771, -0.9108007, -3.863325, 1, 1, 1, 1, 1,
-0.1410879, -1.665114, -3.237611, 1, 1, 1, 1, 1,
-0.1382643, -1.538395, -2.899099, 1, 1, 1, 1, 1,
-0.1361173, -1.647562, -1.670347, 1, 1, 1, 1, 1,
-0.133141, 0.1146902, -0.9047994, 1, 1, 1, 1, 1,
-0.1289109, -1.473319, -1.689795, 1, 1, 1, 1, 1,
-0.1269367, 0.9761654, 1.287815, 1, 1, 1, 1, 1,
-0.1192541, -0.7048316, -1.902512, 1, 1, 1, 1, 1,
-0.1187219, -0.4587224, -2.659649, 1, 1, 1, 1, 1,
-0.1166259, -0.4842602, -3.676576, 1, 1, 1, 1, 1,
-0.09255948, 0.01483616, -1.257419, 1, 1, 1, 1, 1,
-0.09229338, -0.04728663, -2.75072, 1, 1, 1, 1, 1,
-0.08995555, 0.5970625, 0.3400143, 1, 1, 1, 1, 1,
-0.08982161, -0.9158108, -2.017296, 1, 1, 1, 1, 1,
-0.08895491, 0.6629288, -0.6309711, 1, 1, 1, 1, 1,
-0.08885715, -0.1697307, -2.998513, 0, 0, 1, 1, 1,
-0.08701822, 1.813095, -0.9774961, 1, 0, 0, 1, 1,
-0.0853659, -0.06882424, -1.147441, 1, 0, 0, 1, 1,
-0.08330016, -0.7368542, -3.418306, 1, 0, 0, 1, 1,
-0.07908711, -0.401783, -3.301598, 1, 0, 0, 1, 1,
-0.07730744, 0.635882, 0.1801659, 1, 0, 0, 1, 1,
-0.07664883, 0.2099229, 1.077086, 0, 0, 0, 1, 1,
-0.07582723, 2.155049, -0.317671, 0, 0, 0, 1, 1,
-0.06805204, -1.449873, -3.273795, 0, 0, 0, 1, 1,
-0.06530023, -1.852455, -3.678936, 0, 0, 0, 1, 1,
-0.06439432, -1.279536, -3.83154, 0, 0, 0, 1, 1,
-0.06209157, -2.299241, -4.597386, 0, 0, 0, 1, 1,
-0.05560566, -1.283462, -2.882016, 0, 0, 0, 1, 1,
-0.03633246, 1.239977, 0.3913794, 1, 1, 1, 1, 1,
-0.03593437, -0.5994984, -3.031834, 1, 1, 1, 1, 1,
-0.03398644, 0.04034226, -1.873537, 1, 1, 1, 1, 1,
-0.03165276, 0.9123849, -1.338682, 1, 1, 1, 1, 1,
-0.03009248, 0.8786076, 1.294687, 1, 1, 1, 1, 1,
-0.02932495, 0.894259, 0.6945717, 1, 1, 1, 1, 1,
-0.02724396, -0.8268679, -3.189931, 1, 1, 1, 1, 1,
-0.02700329, -0.2304186, -1.642742, 1, 1, 1, 1, 1,
-0.02624614, 0.600731, 0.683673, 1, 1, 1, 1, 1,
-0.02619831, 1.320136, 0.9150874, 1, 1, 1, 1, 1,
-0.0225827, 0.9796577, 0.4771633, 1, 1, 1, 1, 1,
-0.0224157, -1.112073, -2.302554, 1, 1, 1, 1, 1,
-0.02111207, 1.785294, -1.309295, 1, 1, 1, 1, 1,
-0.01808397, 0.9987898, -0.1603317, 1, 1, 1, 1, 1,
-0.017129, 0.8543932, 0.3790179, 1, 1, 1, 1, 1,
-0.009807021, -0.1270331, -2.113206, 0, 0, 1, 1, 1,
-0.005880599, -0.4275784, -2.232365, 1, 0, 0, 1, 1,
-0.0004836241, -0.01513259, -2.727127, 1, 0, 0, 1, 1,
0.002138084, 1.028401, -0.1166133, 1, 0, 0, 1, 1,
0.004939476, -0.3078626, 3.30886, 1, 0, 0, 1, 1,
0.005346548, 0.3178924, 0.02943116, 1, 0, 0, 1, 1,
0.007015019, 1.066465, -0.3065682, 0, 0, 0, 1, 1,
0.007816494, -0.2773855, 3.177618, 0, 0, 0, 1, 1,
0.0104794, 1.167728, 0.1227052, 0, 0, 0, 1, 1,
0.01090604, 0.4504959, 0.7665771, 0, 0, 0, 1, 1,
0.01151464, -2.322304, 2.681068, 0, 0, 0, 1, 1,
0.01232795, 0.6207892, -0.7667984, 0, 0, 0, 1, 1,
0.0133822, -0.08035593, 2.024834, 0, 0, 0, 1, 1,
0.01368413, 0.04555665, 0.2064584, 1, 1, 1, 1, 1,
0.0193207, -0.08068063, 1.793687, 1, 1, 1, 1, 1,
0.02056094, 1.153773, 0.2973273, 1, 1, 1, 1, 1,
0.02847783, 0.4817117, -1.507938, 1, 1, 1, 1, 1,
0.02896927, -0.9956395, 2.41774, 1, 1, 1, 1, 1,
0.03262662, 1.986495, -1.537389, 1, 1, 1, 1, 1,
0.03531399, -0.5542108, 3.433422, 1, 1, 1, 1, 1,
0.04045036, 0.06464371, 1.33652, 1, 1, 1, 1, 1,
0.04253373, 0.2154276, 1.060793, 1, 1, 1, 1, 1,
0.0473929, -0.6738294, 2.803865, 1, 1, 1, 1, 1,
0.04798184, -0.578858, 3.279674, 1, 1, 1, 1, 1,
0.05407895, 1.760236, -0.6955327, 1, 1, 1, 1, 1,
0.05711694, 0.8521063, 0.04904405, 1, 1, 1, 1, 1,
0.05933863, -0.01844589, 3.355735, 1, 1, 1, 1, 1,
0.06080885, -0.1827226, 2.121806, 1, 1, 1, 1, 1,
0.06328985, -0.7751449, 3.408175, 0, 0, 1, 1, 1,
0.06928049, -0.6996475, 3.684897, 1, 0, 0, 1, 1,
0.07025214, 0.5802929, -0.2504709, 1, 0, 0, 1, 1,
0.07080299, -0.5527363, 3.507195, 1, 0, 0, 1, 1,
0.07584833, 0.6416053, -0.4552337, 1, 0, 0, 1, 1,
0.07822053, -0.3812698, 2.77657, 1, 0, 0, 1, 1,
0.08670332, 1.752982, -0.06210649, 0, 0, 0, 1, 1,
0.08755469, 0.7822112, 0.32514, 0, 0, 0, 1, 1,
0.08827717, 1.275651, 1.301639, 0, 0, 0, 1, 1,
0.08831204, -0.5022995, 3.590434, 0, 0, 0, 1, 1,
0.09384912, 0.1328277, -0.03335789, 0, 0, 0, 1, 1,
0.1007881, 0.6220228, 1.09398, 0, 0, 0, 1, 1,
0.105097, -1.784572, 2.024288, 0, 0, 0, 1, 1,
0.1058531, -1.17206, 4.215363, 1, 1, 1, 1, 1,
0.1101424, 1.055449, -0.2108924, 1, 1, 1, 1, 1,
0.1119004, -1.274879, 1.751414, 1, 1, 1, 1, 1,
0.1152301, -0.1136728, 0.3704566, 1, 1, 1, 1, 1,
0.1160967, 0.3324691, 0.2399809, 1, 1, 1, 1, 1,
0.1168404, 0.0197263, 2.069119, 1, 1, 1, 1, 1,
0.122599, -1.720345, 1.874017, 1, 1, 1, 1, 1,
0.1273076, -0.1019028, 3.343841, 1, 1, 1, 1, 1,
0.1362562, 1.780563, -0.5053351, 1, 1, 1, 1, 1,
0.1389327, 0.8130012, 0.7434478, 1, 1, 1, 1, 1,
0.1399868, -0.811193, 5.814384, 1, 1, 1, 1, 1,
0.1414666, -0.4516564, 2.672018, 1, 1, 1, 1, 1,
0.1429097, 0.3150345, 0.855738, 1, 1, 1, 1, 1,
0.1478823, -2.184138, 3.673966, 1, 1, 1, 1, 1,
0.1505064, -0.806175, 3.316432, 1, 1, 1, 1, 1,
0.1567936, -0.6986235, 2.146789, 0, 0, 1, 1, 1,
0.1587966, -1.026241, 1.950635, 1, 0, 0, 1, 1,
0.1599841, 3.035599, -0.6802834, 1, 0, 0, 1, 1,
0.1673966, -0.03116065, 1.576271, 1, 0, 0, 1, 1,
0.1675443, 1.683156, 0.7950817, 1, 0, 0, 1, 1,
0.1700451, 0.2327625, 0.4282612, 1, 0, 0, 1, 1,
0.1720859, -2.226739, 1.64642, 0, 0, 0, 1, 1,
0.1746212, -0.05936476, 1.941225, 0, 0, 0, 1, 1,
0.1761137, 0.6168757, -1.125746, 0, 0, 0, 1, 1,
0.1777457, 0.88195, 0.8162, 0, 0, 0, 1, 1,
0.1780217, 1.404472, 0.6761588, 0, 0, 0, 1, 1,
0.1798542, -0.101825, 2.766303, 0, 0, 0, 1, 1,
0.1813157, 0.125878, 0.6966624, 0, 0, 0, 1, 1,
0.1830644, 0.324675, 0.3382272, 1, 1, 1, 1, 1,
0.1854569, -0.3454965, 1.41913, 1, 1, 1, 1, 1,
0.1856548, -1.304061, 5.89753, 1, 1, 1, 1, 1,
0.1882492, -0.3945844, 3.209707, 1, 1, 1, 1, 1,
0.1922498, -0.7512248, 3.212187, 1, 1, 1, 1, 1,
0.203046, 0.8608808, 1.056689, 1, 1, 1, 1, 1,
0.2063211, 3.120289, -0.6770822, 1, 1, 1, 1, 1,
0.2087174, -1.142863, 4.229857, 1, 1, 1, 1, 1,
0.2119952, 0.307137, -1.972832, 1, 1, 1, 1, 1,
0.2150817, -0.3404219, 1.817245, 1, 1, 1, 1, 1,
0.218999, -1.651423, 3.659841, 1, 1, 1, 1, 1,
0.2219509, 0.1756219, -0.3323974, 1, 1, 1, 1, 1,
0.2251585, 0.8803488, 0.09676047, 1, 1, 1, 1, 1,
0.2268393, -0.5337669, 3.213564, 1, 1, 1, 1, 1,
0.2268894, 0.7086552, -1.536891, 1, 1, 1, 1, 1,
0.2318564, -0.09861029, 1.30492, 0, 0, 1, 1, 1,
0.23242, -0.8779085, 4.603716, 1, 0, 0, 1, 1,
0.2359647, -1.877762, 3.645334, 1, 0, 0, 1, 1,
0.2370662, 0.2695284, 0.5997899, 1, 0, 0, 1, 1,
0.2378318, -2.581486, 3.14762, 1, 0, 0, 1, 1,
0.2402497, 0.2836165, 1.176831, 1, 0, 0, 1, 1,
0.2461614, -0.1667577, 2.480837, 0, 0, 0, 1, 1,
0.2482335, 0.2741522, -0.1965837, 0, 0, 0, 1, 1,
0.2498489, 1.104415, -0.315763, 0, 0, 0, 1, 1,
0.2566989, -1.006402, 5.020046, 0, 0, 0, 1, 1,
0.2590439, 0.6599447, 0.7604583, 0, 0, 0, 1, 1,
0.2597703, -0.2950912, 3.192704, 0, 0, 0, 1, 1,
0.261204, 0.2642371, 1.385148, 0, 0, 0, 1, 1,
0.2651106, 1.97626, 0.4996916, 1, 1, 1, 1, 1,
0.2714229, 0.245339, 1.471054, 1, 1, 1, 1, 1,
0.2731218, -0.3373251, 3.255099, 1, 1, 1, 1, 1,
0.2751465, -0.7271717, 2.372531, 1, 1, 1, 1, 1,
0.276037, 0.8642572, 0.2213723, 1, 1, 1, 1, 1,
0.2801506, 0.6321055, 0.4594332, 1, 1, 1, 1, 1,
0.2825978, 0.560015, -1.337786, 1, 1, 1, 1, 1,
0.2873991, 0.500026, 0.3654809, 1, 1, 1, 1, 1,
0.2906444, -0.7370071, 2.302319, 1, 1, 1, 1, 1,
0.2922575, 0.3221461, 1.431697, 1, 1, 1, 1, 1,
0.2935, -1.379585, 3.469828, 1, 1, 1, 1, 1,
0.2943524, 0.3974145, 0.5994871, 1, 1, 1, 1, 1,
0.2961239, 0.4903477, 2.553423, 1, 1, 1, 1, 1,
0.2970067, -0.3943831, 3.37229, 1, 1, 1, 1, 1,
0.2979035, 0.9072571, -0.3344293, 1, 1, 1, 1, 1,
0.3001325, 1.50217, 1.912213, 0, 0, 1, 1, 1,
0.3075036, -2.019441, 2.724965, 1, 0, 0, 1, 1,
0.3120449, -0.09956108, 0.9744862, 1, 0, 0, 1, 1,
0.3144657, -1.633893, 2.82814, 1, 0, 0, 1, 1,
0.320568, 0.7649377, 0.947224, 1, 0, 0, 1, 1,
0.3216754, -0.8322631, 1.633184, 1, 0, 0, 1, 1,
0.3291804, -1.453322, 3.949361, 0, 0, 0, 1, 1,
0.337526, 0.5274464, 1.44275, 0, 0, 0, 1, 1,
0.3387994, -0.5816324, 1.592776, 0, 0, 0, 1, 1,
0.3403586, 0.3807195, 0.4539242, 0, 0, 0, 1, 1,
0.3420026, -0.5216426, 3.33224, 0, 0, 0, 1, 1,
0.3470365, 1.673558, 1.351345, 0, 0, 0, 1, 1,
0.3482731, 0.1677879, 1.284869, 0, 0, 0, 1, 1,
0.363086, 0.1838951, -0.03585246, 1, 1, 1, 1, 1,
0.364001, -1.492555, 1.674017, 1, 1, 1, 1, 1,
0.3676477, 0.6310241, 1.087307, 1, 1, 1, 1, 1,
0.3682489, -1.046751, 4.197622, 1, 1, 1, 1, 1,
0.3698131, -1.514162, 3.732648, 1, 1, 1, 1, 1,
0.3699715, 1.642146, 1.18733, 1, 1, 1, 1, 1,
0.3721472, 0.8704305, 1.650849, 1, 1, 1, 1, 1,
0.3730168, 0.4032827, 2.320138, 1, 1, 1, 1, 1,
0.3737849, -0.3444705, 2.311938, 1, 1, 1, 1, 1,
0.3738204, 1.316582, 1.810423, 1, 1, 1, 1, 1,
0.3746382, -0.4183041, 2.65283, 1, 1, 1, 1, 1,
0.3835061, 0.2028794, -0.46676, 1, 1, 1, 1, 1,
0.3859022, 1.291421, 0.1548675, 1, 1, 1, 1, 1,
0.393054, 0.6651325, -0.777239, 1, 1, 1, 1, 1,
0.3941644, 0.2778941, 0.5204357, 1, 1, 1, 1, 1,
0.4007361, 2.128289, 0.9461939, 0, 0, 1, 1, 1,
0.402297, 2.284425, 1.38374, 1, 0, 0, 1, 1,
0.4054702, 0.6022877, 0.1163108, 1, 0, 0, 1, 1,
0.4074349, 0.8782848, 0.164055, 1, 0, 0, 1, 1,
0.4083575, -1.747398, 2.408992, 1, 0, 0, 1, 1,
0.4101166, 0.9778067, 0.3325032, 1, 0, 0, 1, 1,
0.4152899, -0.313665, 3.656646, 0, 0, 0, 1, 1,
0.4183842, 0.2623332, 0.409119, 0, 0, 0, 1, 1,
0.4212667, 0.5382817, -0.2306612, 0, 0, 0, 1, 1,
0.4216236, -0.7063857, 1.944811, 0, 0, 0, 1, 1,
0.4228237, 0.5627414, 1.047324, 0, 0, 0, 1, 1,
0.4320863, -1.428243, 1.056305, 0, 0, 0, 1, 1,
0.4326268, -0.8984414, 1.387879, 0, 0, 0, 1, 1,
0.4328419, 1.179533, 0.56176, 1, 1, 1, 1, 1,
0.4419813, -0.5158199, 3.196734, 1, 1, 1, 1, 1,
0.4502991, -1.904037, 3.861463, 1, 1, 1, 1, 1,
0.4528313, 1.359413, 1.619931, 1, 1, 1, 1, 1,
0.4542815, 0.8902302, 0.7786112, 1, 1, 1, 1, 1,
0.4550484, -2.66338, 3.031168, 1, 1, 1, 1, 1,
0.4580892, 0.03374284, 1.148856, 1, 1, 1, 1, 1,
0.4621507, -0.4068321, 2.23108, 1, 1, 1, 1, 1,
0.4627681, -1.389945, 1.970403, 1, 1, 1, 1, 1,
0.4633057, 1.426127, -0.6091998, 1, 1, 1, 1, 1,
0.4734899, -2.154515, 2.492739, 1, 1, 1, 1, 1,
0.4736323, 0.05541325, 0.9649429, 1, 1, 1, 1, 1,
0.4787218, -0.5231419, 2.864098, 1, 1, 1, 1, 1,
0.4854129, 1.209262, 0.942286, 1, 1, 1, 1, 1,
0.4885188, -0.5265974, 3.156555, 1, 1, 1, 1, 1,
0.4990585, 1.499411, 1.140008, 0, 0, 1, 1, 1,
0.5016935, 0.2195377, 2.156545, 1, 0, 0, 1, 1,
0.5067596, -0.09986709, 1.207434, 1, 0, 0, 1, 1,
0.506893, 0.4832849, 0.6088307, 1, 0, 0, 1, 1,
0.5083001, 0.7510521, 1.687409, 1, 0, 0, 1, 1,
0.5098101, -1.476485, 1.227722, 1, 0, 0, 1, 1,
0.5118337, -1.006306, 3.868592, 0, 0, 0, 1, 1,
0.5133198, 0.611384, 0.6678398, 0, 0, 0, 1, 1,
0.514042, -0.7153214, 4.198686, 0, 0, 0, 1, 1,
0.5152166, -0.1867902, 2.666672, 0, 0, 0, 1, 1,
0.5161036, 0.2481703, 2.101729, 0, 0, 0, 1, 1,
0.5169193, 1.214379, 2.027832, 0, 0, 0, 1, 1,
0.5175345, -0.3043154, 3.364181, 0, 0, 0, 1, 1,
0.5198485, -0.1328785, 2.398408, 1, 1, 1, 1, 1,
0.5206519, 0.5915025, 1.423931, 1, 1, 1, 1, 1,
0.5222342, 1.154514, 0.5172132, 1, 1, 1, 1, 1,
0.5232544, 0.8196788, -2.219889, 1, 1, 1, 1, 1,
0.5302708, 1.001985, -2.491457, 1, 1, 1, 1, 1,
0.5338835, -0.2227627, 0.7607608, 1, 1, 1, 1, 1,
0.5354, 0.3852088, -0.1098991, 1, 1, 1, 1, 1,
0.535655, -1.697021, 2.994532, 1, 1, 1, 1, 1,
0.5400451, -1.345106, 4.11125, 1, 1, 1, 1, 1,
0.5482985, -1.511993, 3.535636, 1, 1, 1, 1, 1,
0.5486783, 0.6820805, 1.510691, 1, 1, 1, 1, 1,
0.5536911, -1.191103, 2.349421, 1, 1, 1, 1, 1,
0.5557365, 0.3969131, 1.985487, 1, 1, 1, 1, 1,
0.5570552, -0.8209002, 3.073325, 1, 1, 1, 1, 1,
0.5610888, 0.1158153, 2.141007, 1, 1, 1, 1, 1,
0.5611458, 1.829543, 0.2442385, 0, 0, 1, 1, 1,
0.561699, -1.271969, 1.570775, 1, 0, 0, 1, 1,
0.5632284, -1.799538, 0.9651453, 1, 0, 0, 1, 1,
0.5633872, 1.144272, -0.5441262, 1, 0, 0, 1, 1,
0.5676003, -0.2140024, 0.7660899, 1, 0, 0, 1, 1,
0.5717117, -0.666618, 2.516765, 1, 0, 0, 1, 1,
0.5737662, -0.4867642, 0.59014, 0, 0, 0, 1, 1,
0.5810055, -0.02024113, 3.274273, 0, 0, 0, 1, 1,
0.58654, 0.08148891, 0.6557328, 0, 0, 0, 1, 1,
0.5868418, 0.7349375, 0.6069335, 0, 0, 0, 1, 1,
0.5887483, 0.9417458, 0.5459715, 0, 0, 0, 1, 1,
0.5959022, -0.4154349, -0.5179188, 0, 0, 0, 1, 1,
0.5973725, 0.5350235, 1.392797, 0, 0, 0, 1, 1,
0.598448, 2.661392, -1.90264, 1, 1, 1, 1, 1,
0.6053402, -0.4044405, 1.26758, 1, 1, 1, 1, 1,
0.6059337, -2.031233, 1.380851, 1, 1, 1, 1, 1,
0.6078441, -0.4770871, 0.8525116, 1, 1, 1, 1, 1,
0.609088, -0.1741231, 2.397708, 1, 1, 1, 1, 1,
0.6152823, -0.4540821, 3.279127, 1, 1, 1, 1, 1,
0.6170118, 0.526057, 0.1812323, 1, 1, 1, 1, 1,
0.6182004, 0.117154, 2.982868, 1, 1, 1, 1, 1,
0.6188439, -0.9142155, 0.3922201, 1, 1, 1, 1, 1,
0.6208703, -0.2029067, 1.886708, 1, 1, 1, 1, 1,
0.6213906, 0.3513391, 1.137385, 1, 1, 1, 1, 1,
0.6253349, 0.3113991, -0.6341445, 1, 1, 1, 1, 1,
0.6258301, -1.934333, 3.433156, 1, 1, 1, 1, 1,
0.6264744, 1.485103, -2.354866, 1, 1, 1, 1, 1,
0.6303803, -0.9790214, 2.250668, 1, 1, 1, 1, 1,
0.6315022, -0.7069654, 1.246753, 0, 0, 1, 1, 1,
0.6322435, -0.6729185, 1.881135, 1, 0, 0, 1, 1,
0.6332664, -0.1066559, 0.8307208, 1, 0, 0, 1, 1,
0.6380007, 0.6468302, 2.141999, 1, 0, 0, 1, 1,
0.6391432, 1.48449, -0.2499654, 1, 0, 0, 1, 1,
0.6398131, -0.7163654, 3.409176, 1, 0, 0, 1, 1,
0.6402952, 2.201967, 1.588373, 0, 0, 0, 1, 1,
0.6437823, 0.5310616, 0.5170026, 0, 0, 0, 1, 1,
0.6439033, -1.104448, 2.885544, 0, 0, 0, 1, 1,
0.6443212, -1.369104, 2.880957, 0, 0, 0, 1, 1,
0.645591, -1.177355, 2.727031, 0, 0, 0, 1, 1,
0.6467689, -0.5518534, 1.735816, 0, 0, 0, 1, 1,
0.6523602, 0.8688526, -0.06847911, 0, 0, 0, 1, 1,
0.6523957, -0.4518902, 3.10839, 1, 1, 1, 1, 1,
0.6545936, 1.138363, 0.5287724, 1, 1, 1, 1, 1,
0.6604724, -0.07916424, 2.816525, 1, 1, 1, 1, 1,
0.6652525, -1.115657, 3.467897, 1, 1, 1, 1, 1,
0.6756415, -0.2865949, 0.6804981, 1, 1, 1, 1, 1,
0.6787295, 0.2029661, 1.964528, 1, 1, 1, 1, 1,
0.6814091, 1.263079, 1.064889, 1, 1, 1, 1, 1,
0.6839082, 1.915904, -0.8803176, 1, 1, 1, 1, 1,
0.6860222, 1.542233, 1.316405, 1, 1, 1, 1, 1,
0.6867428, 1.693817, 1.16088, 1, 1, 1, 1, 1,
0.6961184, 0.002096082, 1.850395, 1, 1, 1, 1, 1,
0.6969398, 1.434662, -1.415556, 1, 1, 1, 1, 1,
0.6986414, 0.3087217, 1.727618, 1, 1, 1, 1, 1,
0.7010385, 1.560389, 1.624303, 1, 1, 1, 1, 1,
0.7033411, -0.1464485, 1.611841, 1, 1, 1, 1, 1,
0.7036611, 0.5861977, 1.956063, 0, 0, 1, 1, 1,
0.7082849, -0.3580274, 1.504777, 1, 0, 0, 1, 1,
0.7152209, -0.6726459, 2.61228, 1, 0, 0, 1, 1,
0.7152693, 0.7604049, 0.3075775, 1, 0, 0, 1, 1,
0.7159585, 0.9944287, 0.8956922, 1, 0, 0, 1, 1,
0.7162778, -0.6432139, 2.416186, 1, 0, 0, 1, 1,
0.7207777, -0.4892881, 1.415519, 0, 0, 0, 1, 1,
0.7215259, 0.4558172, 0.9700702, 0, 0, 0, 1, 1,
0.7224533, -0.1063159, 2.662746, 0, 0, 0, 1, 1,
0.7236717, 0.07923993, 1.848657, 0, 0, 0, 1, 1,
0.7287545, 0.5829341, 1.077602, 0, 0, 0, 1, 1,
0.7323716, 2.355926, 0.1351469, 0, 0, 0, 1, 1,
0.7328876, -0.06722359, 2.499024, 0, 0, 0, 1, 1,
0.733776, 0.615855, 0.9180751, 1, 1, 1, 1, 1,
0.7363756, -1.115625, 2.380732, 1, 1, 1, 1, 1,
0.7369452, 3.220418, -0.7686226, 1, 1, 1, 1, 1,
0.7398518, -1.324198, 2.9448, 1, 1, 1, 1, 1,
0.7437914, 0.7266265, 0.7641081, 1, 1, 1, 1, 1,
0.7454898, -0.4484051, 1.264623, 1, 1, 1, 1, 1,
0.7456931, -1.364798, 1.762772, 1, 1, 1, 1, 1,
0.7492245, -0.176951, 0.3041828, 1, 1, 1, 1, 1,
0.751391, 0.4508148, 1.341753, 1, 1, 1, 1, 1,
0.7524443, -0.5487729, 3.790069, 1, 1, 1, 1, 1,
0.7720357, -1.037893, 2.114008, 1, 1, 1, 1, 1,
0.7744702, 0.5639201, 1.281366, 1, 1, 1, 1, 1,
0.7761777, -0.9824678, 2.78366, 1, 1, 1, 1, 1,
0.7808334, 0.02842553, 1.906669, 1, 1, 1, 1, 1,
0.7826693, 0.03736813, 1.648044, 1, 1, 1, 1, 1,
0.7852091, 0.4610095, 2.119529, 0, 0, 1, 1, 1,
0.7897779, 0.3305832, 1.028838, 1, 0, 0, 1, 1,
0.7899004, 0.4188087, 1.875403, 1, 0, 0, 1, 1,
0.798018, 1.26476, 0.03070545, 1, 0, 0, 1, 1,
0.7997781, -0.05966832, 0.6539347, 1, 0, 0, 1, 1,
0.8061917, 0.01966634, -0.3709345, 1, 0, 0, 1, 1,
0.8067829, -1.570424, 3.348516, 0, 0, 0, 1, 1,
0.8090869, -0.4703706, 2.007423, 0, 0, 0, 1, 1,
0.8112429, 0.8940566, 1.509724, 0, 0, 0, 1, 1,
0.8165752, -1.058237, 3.218917, 0, 0, 0, 1, 1,
0.8212565, -2.441776, 1.044968, 0, 0, 0, 1, 1,
0.8246984, -0.2010691, 2.420948, 0, 0, 0, 1, 1,
0.8286335, -0.3882718, 0.3064753, 0, 0, 0, 1, 1,
0.8343385, 1.341707, 1.309861, 1, 1, 1, 1, 1,
0.8358442, 0.3498024, 1.716263, 1, 1, 1, 1, 1,
0.8363544, 0.1159785, 0.4687257, 1, 1, 1, 1, 1,
0.8365196, 0.4692501, 0.7023259, 1, 1, 1, 1, 1,
0.8399682, -1.066074, 2.788914, 1, 1, 1, 1, 1,
0.8477793, -0.8249049, 1.110193, 1, 1, 1, 1, 1,
0.85083, -0.7071358, 1.452672, 1, 1, 1, 1, 1,
0.8512436, 0.8047601, 1.877338, 1, 1, 1, 1, 1,
0.8519142, 0.9755803, 0.4716068, 1, 1, 1, 1, 1,
0.8531449, 0.4428375, 0.6685523, 1, 1, 1, 1, 1,
0.8545149, -0.2471193, 2.056862, 1, 1, 1, 1, 1,
0.8546516, -0.3275109, 2.118092, 1, 1, 1, 1, 1,
0.8640965, -1.275855, 3.24292, 1, 1, 1, 1, 1,
0.8676579, 1.533316, -0.007767606, 1, 1, 1, 1, 1,
0.868134, -0.8800514, 1.83118, 1, 1, 1, 1, 1,
0.8715526, 0.7219032, 1.065685, 0, 0, 1, 1, 1,
0.8764403, -0.5562512, 1.604909, 1, 0, 0, 1, 1,
0.8782211, 0.0111676, 2.016365, 1, 0, 0, 1, 1,
0.8799979, -1.051407, 2.250607, 1, 0, 0, 1, 1,
0.8842146, -0.3055565, 2.560721, 1, 0, 0, 1, 1,
0.8874008, 0.5113162, 1.018394, 1, 0, 0, 1, 1,
0.8910549, -0.2773053, 1.992254, 0, 0, 0, 1, 1,
0.8960585, -0.8593612, 3.809598, 0, 0, 0, 1, 1,
0.8987739, -0.007788336, 3.474901, 0, 0, 0, 1, 1,
0.9037642, 0.5906945, 0.2949632, 0, 0, 0, 1, 1,
0.9111156, 0.6845038, -0.8542369, 0, 0, 0, 1, 1,
0.9161959, -0.1029911, 1.019492, 0, 0, 0, 1, 1,
0.9196902, -0.1037492, 1.229821, 0, 0, 0, 1, 1,
0.9208828, -2.084854, 1.333705, 1, 1, 1, 1, 1,
0.9244245, -1.320714, 3.842538, 1, 1, 1, 1, 1,
0.9269878, 1.032944, 0.4544604, 1, 1, 1, 1, 1,
0.9334206, -1.788454, 4.073295, 1, 1, 1, 1, 1,
0.9376466, 0.388505, 0.4392453, 1, 1, 1, 1, 1,
0.944002, -0.4311748, 1.324792, 1, 1, 1, 1, 1,
0.9510618, -0.9735119, 3.110039, 1, 1, 1, 1, 1,
0.9564479, -1.547394, 1.764262, 1, 1, 1, 1, 1,
0.9581624, 0.845571, 1.161344, 1, 1, 1, 1, 1,
0.9595758, -3.077878, 1.406514, 1, 1, 1, 1, 1,
0.9601099, -0.9281877, 2.176965, 1, 1, 1, 1, 1,
0.9646494, -0.8173962, 3.016506, 1, 1, 1, 1, 1,
0.9715757, 0.08735746, 1.333932, 1, 1, 1, 1, 1,
0.9763077, 0.4602151, 1.218824, 1, 1, 1, 1, 1,
0.9770715, -0.05553344, 2.114825, 1, 1, 1, 1, 1,
0.9787804, -1.050024, 3.18175, 0, 0, 1, 1, 1,
0.9806278, 0.9317074, 0.7785919, 1, 0, 0, 1, 1,
0.9880807, 0.5180095, 0.2377234, 1, 0, 0, 1, 1,
0.9893996, -0.5420291, 2.095237, 1, 0, 0, 1, 1,
0.9930493, -0.5960665, 4.883978, 1, 0, 0, 1, 1,
0.9931847, 0.3352161, 1.914183, 1, 0, 0, 1, 1,
1.000521, -0.8258947, 1.539789, 0, 0, 0, 1, 1,
1.002239, 1.123775, -0.1474231, 0, 0, 0, 1, 1,
1.010262, 1.133735, 1.310165, 0, 0, 0, 1, 1,
1.010284, -0.03234722, 0.649353, 0, 0, 0, 1, 1,
1.013244, 0.3563029, 0.834748, 0, 0, 0, 1, 1,
1.019435, -1.396307, 2.672585, 0, 0, 0, 1, 1,
1.020021, 0.640776, 1.34181, 0, 0, 0, 1, 1,
1.02131, -0.3391315, 0.6464944, 1, 1, 1, 1, 1,
1.023448, -0.4708202, 4.077181, 1, 1, 1, 1, 1,
1.035432, 0.5892564, 2.690043, 1, 1, 1, 1, 1,
1.037088, 0.981051, 0.9178532, 1, 1, 1, 1, 1,
1.041965, 0.04706396, 2.07679, 1, 1, 1, 1, 1,
1.046392, 1.130587, 2.097047, 1, 1, 1, 1, 1,
1.048014, -0.9725057, 0.7963753, 1, 1, 1, 1, 1,
1.048409, 2.231638, -0.02681023, 1, 1, 1, 1, 1,
1.052332, 1.056709, 1.200445, 1, 1, 1, 1, 1,
1.056356, 0.4494101, 0.9551032, 1, 1, 1, 1, 1,
1.062697, -0.1440584, 4.326895, 1, 1, 1, 1, 1,
1.069399, 0.993193, 1.723387, 1, 1, 1, 1, 1,
1.071414, -0.3956565, 2.118228, 1, 1, 1, 1, 1,
1.074104, 0.04812048, 0.6223314, 1, 1, 1, 1, 1,
1.096799, -1.367235, 0.69581, 1, 1, 1, 1, 1,
1.096829, 0.3898709, 2.738808, 0, 0, 1, 1, 1,
1.100388, -0.1388459, 3.073439, 1, 0, 0, 1, 1,
1.116226, 0.2425475, 3.505541, 1, 0, 0, 1, 1,
1.129325, -1.187044, 2.079857, 1, 0, 0, 1, 1,
1.131457, 0.7892304, 2.167901, 1, 0, 0, 1, 1,
1.13305, 0.7819588, 2.765069, 1, 0, 0, 1, 1,
1.145731, -0.720315, 1.914648, 0, 0, 0, 1, 1,
1.146092, 0.3037581, 3.153137, 0, 0, 0, 1, 1,
1.14814, -0.01696451, 2.101319, 0, 0, 0, 1, 1,
1.148627, -0.07275493, 2.728268, 0, 0, 0, 1, 1,
1.149145, -1.034792, 1.015348, 0, 0, 0, 1, 1,
1.154412, -0.5004638, 3.134899, 0, 0, 0, 1, 1,
1.154752, 1.219982, 1.941664, 0, 0, 0, 1, 1,
1.155523, 0.326365, 1.444018, 1, 1, 1, 1, 1,
1.158224, 0.4912502, 0.9708521, 1, 1, 1, 1, 1,
1.16393, 0.1534947, 2.652385, 1, 1, 1, 1, 1,
1.167623, -1.05435, 3.498995, 1, 1, 1, 1, 1,
1.177102, 0.9598758, 1.660618, 1, 1, 1, 1, 1,
1.181085, -0.5487028, 2.142404, 1, 1, 1, 1, 1,
1.181521, 1.310033, 2.407111, 1, 1, 1, 1, 1,
1.191931, 1.123526, -0.1812868, 1, 1, 1, 1, 1,
1.19254, 0.1383844, 1.497351, 1, 1, 1, 1, 1,
1.209603, 0.02358036, 1.670292, 1, 1, 1, 1, 1,
1.220157, -0.285215, 0.1353837, 1, 1, 1, 1, 1,
1.222064, -0.7302397, 2.16246, 1, 1, 1, 1, 1,
1.223002, -1.860608, 3.547055, 1, 1, 1, 1, 1,
1.228567, 0.01753746, 2.274325, 1, 1, 1, 1, 1,
1.238187, -0.6474938, 0.7094021, 1, 1, 1, 1, 1,
1.260471, 0.2350124, 0.1321512, 0, 0, 1, 1, 1,
1.261708, 0.6582406, 0.1068648, 1, 0, 0, 1, 1,
1.268032, -0.8960863, 2.205169, 1, 0, 0, 1, 1,
1.285136, -1.126836, 3.29686, 1, 0, 0, 1, 1,
1.285654, 1.64399, 0.7019061, 1, 0, 0, 1, 1,
1.287809, -0.07922084, 2.202616, 1, 0, 0, 1, 1,
1.306218, 0.1189372, 2.999113, 0, 0, 0, 1, 1,
1.306457, -0.8935496, 2.606738, 0, 0, 0, 1, 1,
1.306547, 1.680919, 1.391783, 0, 0, 0, 1, 1,
1.308272, 0.1203037, -0.3633192, 0, 0, 0, 1, 1,
1.311039, 0.0524443, -0.02816357, 0, 0, 0, 1, 1,
1.313021, 0.1338413, 1.309933, 0, 0, 0, 1, 1,
1.319453, -2.418512, 2.785107, 0, 0, 0, 1, 1,
1.328831, -1.572912, 4.010998, 1, 1, 1, 1, 1,
1.336194, 0.1343874, 2.873096, 1, 1, 1, 1, 1,
1.342833, -0.5365698, 2.893144, 1, 1, 1, 1, 1,
1.347821, -0.9442984, 3.69346, 1, 1, 1, 1, 1,
1.350802, 0.1422097, 0.2271456, 1, 1, 1, 1, 1,
1.351619, 0.6124237, 0.6711109, 1, 1, 1, 1, 1,
1.351925, 0.6031678, -0.7076524, 1, 1, 1, 1, 1,
1.359345, -1.435328, 2.352498, 1, 1, 1, 1, 1,
1.359594, -1.071846, 2.73651, 1, 1, 1, 1, 1,
1.370642, 1.73039, -0.9373231, 1, 1, 1, 1, 1,
1.375727, 1.853422, 1.828315, 1, 1, 1, 1, 1,
1.376229, 0.1283567, 3.063428, 1, 1, 1, 1, 1,
1.391312, 0.2212488, 2.707458, 1, 1, 1, 1, 1,
1.391982, 0.4356592, 3.238004, 1, 1, 1, 1, 1,
1.405492, -0.03304729, 0.4253573, 1, 1, 1, 1, 1,
1.417987, -0.5147014, 1.387586, 0, 0, 1, 1, 1,
1.419562, -0.8198671, 3.850949, 1, 0, 0, 1, 1,
1.421417, -0.08072943, 1.728189, 1, 0, 0, 1, 1,
1.429532, 1.041016, -1.147289, 1, 0, 0, 1, 1,
1.440447, -1.072696, 2.664858, 1, 0, 0, 1, 1,
1.467363, 1.01281, -0.2256977, 1, 0, 0, 1, 1,
1.485471, -0.02306933, 1.334411, 0, 0, 0, 1, 1,
1.488326, 0.2007565, 1.235511, 0, 0, 0, 1, 1,
1.507857, -0.5271202, 2.37008, 0, 0, 0, 1, 1,
1.540303, -0.5262882, 3.854676, 0, 0, 0, 1, 1,
1.564151, -1.234248, 2.528219, 0, 0, 0, 1, 1,
1.582155, -0.3485725, 1.904496, 0, 0, 0, 1, 1,
1.583151, -0.8638017, 1.977738, 0, 0, 0, 1, 1,
1.585822, 0.2857679, 0.8481352, 1, 1, 1, 1, 1,
1.591019, 1.202839, 1.60046, 1, 1, 1, 1, 1,
1.594418, 0.2956266, 3.405025, 1, 1, 1, 1, 1,
1.594925, -2.038012, 2.252539, 1, 1, 1, 1, 1,
1.624555, 2.153877, -0.7631175, 1, 1, 1, 1, 1,
1.633024, -0.8643263, 1.148759, 1, 1, 1, 1, 1,
1.649336, -0.2710727, 2.969277, 1, 1, 1, 1, 1,
1.654172, 1.537035, 1.9857, 1, 1, 1, 1, 1,
1.657935, 0.947519, 1.11594, 1, 1, 1, 1, 1,
1.661993, -1.507967, 1.235316, 1, 1, 1, 1, 1,
1.662112, 0.6205539, 0.5284178, 1, 1, 1, 1, 1,
1.669015, 0.8952527, 2.373399, 1, 1, 1, 1, 1,
1.671809, -1.456901, 2.081204, 1, 1, 1, 1, 1,
1.678174, -0.2700035, 1.069454, 1, 1, 1, 1, 1,
1.67985, -0.7689663, 0.6061667, 1, 1, 1, 1, 1,
1.683561, 0.1462628, 0.1887362, 0, 0, 1, 1, 1,
1.701788, -0.7384754, 1.56443, 1, 0, 0, 1, 1,
1.702119, -0.05818656, 2.169952, 1, 0, 0, 1, 1,
1.723505, -0.1324571, 1.220136, 1, 0, 0, 1, 1,
1.726703, -0.4279214, 2.097715, 1, 0, 0, 1, 1,
1.746911, 0.7586244, 2.161962, 1, 0, 0, 1, 1,
1.7475, 0.8311397, 1.148836, 0, 0, 0, 1, 1,
1.782746, -0.3844101, 1.173644, 0, 0, 0, 1, 1,
1.798966, -1.235117, 2.601592, 0, 0, 0, 1, 1,
1.802052, 2.04585, 0.3474189, 0, 0, 0, 1, 1,
1.804732, -2.07215, 1.787845, 0, 0, 0, 1, 1,
1.815307, -1.138824, 2.180587, 0, 0, 0, 1, 1,
1.838637, -0.5432891, 2.095609, 0, 0, 0, 1, 1,
1.849079, 0.2098365, 1.250066, 1, 1, 1, 1, 1,
1.855543, 1.171781, 0.6727834, 1, 1, 1, 1, 1,
1.87515, -0.8106195, 1.341068, 1, 1, 1, 1, 1,
1.875381, -0.6594254, 2.307101, 1, 1, 1, 1, 1,
1.880163, -0.1082819, 1.532325, 1, 1, 1, 1, 1,
1.896271, 0.2110998, 0.4134284, 1, 1, 1, 1, 1,
1.916505, 1.342817, 1.627689, 1, 1, 1, 1, 1,
1.925947, -1.357134, 2.112822, 1, 1, 1, 1, 1,
1.929256, 0.175487, 1.789111, 1, 1, 1, 1, 1,
1.934908, -0.804498, 3.663023, 1, 1, 1, 1, 1,
1.951227, -0.7126626, 0.7740963, 1, 1, 1, 1, 1,
1.955233, 1.396557, 1.067355, 1, 1, 1, 1, 1,
1.962815, 1.918365, -0.7889575, 1, 1, 1, 1, 1,
1.964435, -0.8481023, 1.74017, 1, 1, 1, 1, 1,
1.96839, 0.1995844, 0.3866301, 1, 1, 1, 1, 1,
1.971786, 0.4218549, 3.141612, 0, 0, 1, 1, 1,
1.983019, 0.1150328, 2.118372, 1, 0, 0, 1, 1,
1.987243, -1.115581, 1.795409, 1, 0, 0, 1, 1,
2.001938, -0.4374082, 1.201075, 1, 0, 0, 1, 1,
2.030773, 0.5879827, 2.806744, 1, 0, 0, 1, 1,
2.098358, -2.170936, 2.483104, 1, 0, 0, 1, 1,
2.100078, 0.5739755, 2.986501, 0, 0, 0, 1, 1,
2.121834, -1.673343, 0.8010325, 0, 0, 0, 1, 1,
2.129065, 0.7397173, 2.017798, 0, 0, 0, 1, 1,
2.16383, -0.2054309, 1.337348, 0, 0, 0, 1, 1,
2.170679, -0.8675672, 1.112105, 0, 0, 0, 1, 1,
2.207831, -0.4270502, 3.604891, 0, 0, 0, 1, 1,
2.240302, 0.3522835, 0.503714, 0, 0, 0, 1, 1,
2.38188, 0.7087483, 1.987126, 1, 1, 1, 1, 1,
2.38932, -0.1718155, 1.957843, 1, 1, 1, 1, 1,
2.437493, -0.9579383, 1.555591, 1, 1, 1, 1, 1,
2.489271, -0.6212586, 2.428172, 1, 1, 1, 1, 1,
2.525826, -0.5042744, 3.076252, 1, 1, 1, 1, 1,
2.639754, -0.765695, 1.338915, 1, 1, 1, 1, 1,
2.963415, 1.808105, 0.6032283, 1, 1, 1, 1, 1
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
var radius = 9.75782;
var distance = 34.27393;
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
mvMatrix.translate( -0.0662508, -0.07063007, -0.0944798 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.27393);
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