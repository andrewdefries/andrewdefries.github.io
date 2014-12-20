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
-3.464761, 1.75842, -2.188745, 1, 0, 0, 1,
-2.990411, -0.4258301, -2.352816, 1, 0.007843138, 0, 1,
-2.908825, -0.2431838, -0.277196, 1, 0.01176471, 0, 1,
-2.740031, -0.7266129, -1.457979, 1, 0.01960784, 0, 1,
-2.693898, 0.8648359, -1.630889, 1, 0.02352941, 0, 1,
-2.547546, 0.1314067, -2.442611, 1, 0.03137255, 0, 1,
-2.385598, 0.4216127, -2.314931, 1, 0.03529412, 0, 1,
-2.372118, 1.676882, -1.495084, 1, 0.04313726, 0, 1,
-2.313556, -1.490548, -2.080155, 1, 0.04705882, 0, 1,
-2.305374, -0.4356383, -2.425829, 1, 0.05490196, 0, 1,
-2.230664, 0.1168863, 0.04022721, 1, 0.05882353, 0, 1,
-2.217276, -0.4669071, -2.724204, 1, 0.06666667, 0, 1,
-2.165519, -0.5528896, -2.194651, 1, 0.07058824, 0, 1,
-2.149497, -0.446333, -2.436516, 1, 0.07843138, 0, 1,
-2.103093, -0.8053963, -3.248693, 1, 0.08235294, 0, 1,
-2.047333, -0.03755277, -1.236728, 1, 0.09019608, 0, 1,
-2.032913, -0.9852244, -2.046782, 1, 0.09411765, 0, 1,
-1.976801, -0.3565098, -0.9116384, 1, 0.1019608, 0, 1,
-1.932042, 0.9068393, -1.545611, 1, 0.1098039, 0, 1,
-1.923217, -1.567959, -2.753641, 1, 0.1137255, 0, 1,
-1.918181, -0.3520992, -0.543712, 1, 0.1215686, 0, 1,
-1.916995, 0.6732137, -1.329669, 1, 0.1254902, 0, 1,
-1.87003, 0.1803097, -1.905002, 1, 0.1333333, 0, 1,
-1.865151, 0.917601, -1.566415, 1, 0.1372549, 0, 1,
-1.862177, 0.1330499, -1.324533, 1, 0.145098, 0, 1,
-1.851695, 0.8845207, -0.03862082, 1, 0.1490196, 0, 1,
-1.827276, -2.049608, -2.582101, 1, 0.1568628, 0, 1,
-1.800856, -0.1328315, -0.261472, 1, 0.1607843, 0, 1,
-1.785293, 0.4404972, -2.308453, 1, 0.1686275, 0, 1,
-1.784283, -1.183056, -2.123548, 1, 0.172549, 0, 1,
-1.781963, 1.255146, -1.066882, 1, 0.1803922, 0, 1,
-1.78074, -0.1010178, -1.688305, 1, 0.1843137, 0, 1,
-1.779939, 0.7716328, -0.4328711, 1, 0.1921569, 0, 1,
-1.748931, -1.253438, -2.110395, 1, 0.1960784, 0, 1,
-1.748921, -0.609337, -0.1889944, 1, 0.2039216, 0, 1,
-1.748023, -1.49195, -2.934938, 1, 0.2117647, 0, 1,
-1.744354, 0.9388635, -2.077709, 1, 0.2156863, 0, 1,
-1.703116, 1.018655, 0.176331, 1, 0.2235294, 0, 1,
-1.673, -1.28545, -3.235567, 1, 0.227451, 0, 1,
-1.667907, -1.177542, -0.9937771, 1, 0.2352941, 0, 1,
-1.663577, 1.499092, -1.076355, 1, 0.2392157, 0, 1,
-1.66066, 0.001774727, -1.514635, 1, 0.2470588, 0, 1,
-1.658922, 0.4585916, -2.254438, 1, 0.2509804, 0, 1,
-1.650034, 0.9149967, -0.1294395, 1, 0.2588235, 0, 1,
-1.635326, 0.4840115, -0.8815872, 1, 0.2627451, 0, 1,
-1.63516, -0.7615057, -3.200071, 1, 0.2705882, 0, 1,
-1.633571, 0.5745854, -2.142977, 1, 0.2745098, 0, 1,
-1.627805, 0.1850281, -1.194146, 1, 0.282353, 0, 1,
-1.614956, -0.1686384, -1.100635, 1, 0.2862745, 0, 1,
-1.607138, 1.700343, -0.9391069, 1, 0.2941177, 0, 1,
-1.601887, 0.2055663, -1.544009, 1, 0.3019608, 0, 1,
-1.600869, 0.01138188, -1.299631, 1, 0.3058824, 0, 1,
-1.60018, -0.0989961, -1.237462, 1, 0.3137255, 0, 1,
-1.594044, 1.77998, -0.4891785, 1, 0.3176471, 0, 1,
-1.584236, -0.6139715, -0.9170696, 1, 0.3254902, 0, 1,
-1.583707, 0.2880314, -0.7425984, 1, 0.3294118, 0, 1,
-1.57938, -0.4573317, -3.156917, 1, 0.3372549, 0, 1,
-1.579354, 0.5515045, -1.834209, 1, 0.3411765, 0, 1,
-1.566672, 0.7959923, -2.310536, 1, 0.3490196, 0, 1,
-1.562145, 1.082562, -1.33754, 1, 0.3529412, 0, 1,
-1.551326, -0.2603411, -1.310248, 1, 0.3607843, 0, 1,
-1.547254, 0.02835692, -2.026252, 1, 0.3647059, 0, 1,
-1.54258, 0.9505009, 0.409448, 1, 0.372549, 0, 1,
-1.534385, 1.237707, -1.54288, 1, 0.3764706, 0, 1,
-1.524977, -0.8577356, -2.839071, 1, 0.3843137, 0, 1,
-1.517789, 0.5934893, -1.363761, 1, 0.3882353, 0, 1,
-1.517092, -1.405074, -1.224436, 1, 0.3960784, 0, 1,
-1.507152, -1.795704, -3.752725, 1, 0.4039216, 0, 1,
-1.504219, -0.7154242, -2.855924, 1, 0.4078431, 0, 1,
-1.50089, -0.1842593, -2.734485, 1, 0.4156863, 0, 1,
-1.474601, 1.233878, -1.745276, 1, 0.4196078, 0, 1,
-1.469164, -0.3619065, -1.043068, 1, 0.427451, 0, 1,
-1.452654, -0.8951762, -0.4346426, 1, 0.4313726, 0, 1,
-1.451803, 0.9248743, -1.220685, 1, 0.4392157, 0, 1,
-1.445785, -0.2778634, -0.8261776, 1, 0.4431373, 0, 1,
-1.443496, 0.2054719, -1.830138, 1, 0.4509804, 0, 1,
-1.441485, 3.641485, 0.1895711, 1, 0.454902, 0, 1,
-1.435901, 1.472388, -0.5162595, 1, 0.4627451, 0, 1,
-1.432187, -0.418124, -0.1429704, 1, 0.4666667, 0, 1,
-1.429479, 0.9496874, -2.145058, 1, 0.4745098, 0, 1,
-1.428992, -0.2487203, -1.486301, 1, 0.4784314, 0, 1,
-1.426342, -0.4773874, -1.756106, 1, 0.4862745, 0, 1,
-1.406761, -0.9789088, -3.751722, 1, 0.4901961, 0, 1,
-1.398498, 0.9289837, -0.277446, 1, 0.4980392, 0, 1,
-1.398299, -0.58189, -0.7223305, 1, 0.5058824, 0, 1,
-1.396745, -0.590619, -1.265054, 1, 0.509804, 0, 1,
-1.395777, -0.7279942, -2.401406, 1, 0.5176471, 0, 1,
-1.395186, -0.171668, -4.021303, 1, 0.5215687, 0, 1,
-1.386827, 0.6831166, 1.917098, 1, 0.5294118, 0, 1,
-1.373524, -1.09426, -1.874838, 1, 0.5333334, 0, 1,
-1.371329, 0.3766796, -2.18195, 1, 0.5411765, 0, 1,
-1.361832, -0.9358567, -2.084235, 1, 0.5450981, 0, 1,
-1.336984, -1.285143, -2.231395, 1, 0.5529412, 0, 1,
-1.324587, -0.6967992, -2.87249, 1, 0.5568628, 0, 1,
-1.32346, -0.8442109, -4.191482, 1, 0.5647059, 0, 1,
-1.322437, -0.2353732, -0.5841994, 1, 0.5686275, 0, 1,
-1.317234, 0.2537095, -0.3307725, 1, 0.5764706, 0, 1,
-1.308635, 0.2749227, -1.611695, 1, 0.5803922, 0, 1,
-1.304443, 1.349658, -0.4422421, 1, 0.5882353, 0, 1,
-1.301472, -1.431561, -2.495789, 1, 0.5921569, 0, 1,
-1.301077, -0.06794575, -1.018825, 1, 0.6, 0, 1,
-1.295103, 1.672149, 0.3367478, 1, 0.6078432, 0, 1,
-1.295098, 1.34179, 0.3753542, 1, 0.6117647, 0, 1,
-1.294098, 0.5643369, -1.847171, 1, 0.6196079, 0, 1,
-1.285142, 0.4975021, -1.732782, 1, 0.6235294, 0, 1,
-1.277756, 1.299718, 0.6457598, 1, 0.6313726, 0, 1,
-1.266942, 0.2522107, -1.550729, 1, 0.6352941, 0, 1,
-1.266851, 1.448078, -1.984297, 1, 0.6431373, 0, 1,
-1.266454, -0.7321467, -1.928454, 1, 0.6470588, 0, 1,
-1.262418, 0.5935416, -0.8100498, 1, 0.654902, 0, 1,
-1.259131, 1.616511, -1.001763, 1, 0.6588235, 0, 1,
-1.249326, 1.441864, -1.737685, 1, 0.6666667, 0, 1,
-1.24634, -0.9093665, -0.8487347, 1, 0.6705883, 0, 1,
-1.241077, -0.009327427, -0.5991597, 1, 0.6784314, 0, 1,
-1.238262, 1.465012, -0.6185283, 1, 0.682353, 0, 1,
-1.23698, 1.420716, -1.977324, 1, 0.6901961, 0, 1,
-1.23685, -1.144199, -3.57379, 1, 0.6941177, 0, 1,
-1.227651, -0.462341, -0.5513756, 1, 0.7019608, 0, 1,
-1.224005, -1.229679, -2.418385, 1, 0.7098039, 0, 1,
-1.223409, 0.7888352, -0.6735184, 1, 0.7137255, 0, 1,
-1.211911, 1.382424, -1.817232, 1, 0.7215686, 0, 1,
-1.211476, -0.5565166, -2.209006, 1, 0.7254902, 0, 1,
-1.205376, 1.598688, -1.372117, 1, 0.7333333, 0, 1,
-1.203125, -0.3788407, -0.278918, 1, 0.7372549, 0, 1,
-1.197549, 0.7443937, -0.4527732, 1, 0.7450981, 0, 1,
-1.196919, 1.755498, -0.6530586, 1, 0.7490196, 0, 1,
-1.196134, -1.148638, -2.495634, 1, 0.7568628, 0, 1,
-1.194745, 1.140642, -1.723374, 1, 0.7607843, 0, 1,
-1.190379, 0.4909751, -2.885886, 1, 0.7686275, 0, 1,
-1.184981, 1.447219, -0.8258486, 1, 0.772549, 0, 1,
-1.184486, -1.540109, -2.158768, 1, 0.7803922, 0, 1,
-1.180993, -0.527193, -1.619062, 1, 0.7843137, 0, 1,
-1.175065, 0.4367854, -2.0327, 1, 0.7921569, 0, 1,
-1.159668, 0.2051362, -1.202396, 1, 0.7960784, 0, 1,
-1.157847, -0.8864176, -2.240544, 1, 0.8039216, 0, 1,
-1.156671, 0.3689227, -0.572398, 1, 0.8117647, 0, 1,
-1.155907, -0.1483165, -1.733801, 1, 0.8156863, 0, 1,
-1.154251, 1.041517, -2.813832, 1, 0.8235294, 0, 1,
-1.152774, -0.6765599, -0.2971654, 1, 0.827451, 0, 1,
-1.151788, 0.2055552, -1.887065, 1, 0.8352941, 0, 1,
-1.14778, 0.490412, -1.964343, 1, 0.8392157, 0, 1,
-1.143979, -0.5249592, -1.577738, 1, 0.8470588, 0, 1,
-1.143706, 0.6416567, -0.388969, 1, 0.8509804, 0, 1,
-1.142535, 0.4182566, -1.702505, 1, 0.8588235, 0, 1,
-1.138728, -2.095027, -3.461271, 1, 0.8627451, 0, 1,
-1.13212, -1.460813, -3.191762, 1, 0.8705882, 0, 1,
-1.131321, -0.7029355, -2.04447, 1, 0.8745098, 0, 1,
-1.124959, 0.04809358, -0.7573345, 1, 0.8823529, 0, 1,
-1.121881, 2.143121, -0.5797121, 1, 0.8862745, 0, 1,
-1.120947, -0.2861372, -2.13327, 1, 0.8941177, 0, 1,
-1.11278, 0.08858284, -2.146666, 1, 0.8980392, 0, 1,
-1.110363, -0.8865916, -2.660997, 1, 0.9058824, 0, 1,
-1.104665, 0.8670372, -1.667683, 1, 0.9137255, 0, 1,
-1.101742, 0.5813878, -1.741253, 1, 0.9176471, 0, 1,
-1.095477, 0.1837933, -0.817864, 1, 0.9254902, 0, 1,
-1.09436, 0.6680675, -0.1263217, 1, 0.9294118, 0, 1,
-1.093373, 0.2273045, -1.633464, 1, 0.9372549, 0, 1,
-1.091341, -0.4981818, -2.506908, 1, 0.9411765, 0, 1,
-1.091084, -0.675416, -2.895995, 1, 0.9490196, 0, 1,
-1.08741, 0.01614503, -3.021791, 1, 0.9529412, 0, 1,
-1.082395, 1.189313, 0.3652157, 1, 0.9607843, 0, 1,
-1.075846, -0.04073872, -0.6592007, 1, 0.9647059, 0, 1,
-1.056987, 0.2451546, -1.630494, 1, 0.972549, 0, 1,
-1.052647, 0.2547951, -0.5727035, 1, 0.9764706, 0, 1,
-1.049521, 0.2765571, -0.8703017, 1, 0.9843137, 0, 1,
-1.046087, -0.6037522, -0.1285753, 1, 0.9882353, 0, 1,
-1.035518, -0.9710636, -2.073247, 1, 0.9960784, 0, 1,
-1.020125, 0.4945597, -1.95575, 0.9960784, 1, 0, 1,
-1.018712, -0.9467487, -3.110581, 0.9921569, 1, 0, 1,
-1.014124, 1.067171, -0.5970616, 0.9843137, 1, 0, 1,
-1.011037, 1.125616, -1.319597, 0.9803922, 1, 0, 1,
-1.006991, -0.9913573, -2.270732, 0.972549, 1, 0, 1,
-0.9964075, 1.627588, -0.94496, 0.9686275, 1, 0, 1,
-0.9938747, 0.07740248, -1.007527, 0.9607843, 1, 0, 1,
-0.9917376, 0.1568209, -0.4371276, 0.9568627, 1, 0, 1,
-0.9894406, -0.3961494, -3.37215, 0.9490196, 1, 0, 1,
-0.9825292, 1.194812, -2.129695, 0.945098, 1, 0, 1,
-0.9804665, -0.09751809, -3.028509, 0.9372549, 1, 0, 1,
-0.9771741, -0.8869261, -1.674089, 0.9333333, 1, 0, 1,
-0.9655449, 0.0919632, 0.1253888, 0.9254902, 1, 0, 1,
-0.9629359, 0.5276605, -1.234391, 0.9215686, 1, 0, 1,
-0.9611633, -1.211219, -1.960445, 0.9137255, 1, 0, 1,
-0.9549733, 0.8518565, -0.5185845, 0.9098039, 1, 0, 1,
-0.9486375, -0.6971042, -1.350989, 0.9019608, 1, 0, 1,
-0.9447167, -0.5188086, -3.20435, 0.8941177, 1, 0, 1,
-0.9419529, 0.6656868, -1.520193, 0.8901961, 1, 0, 1,
-0.9380484, -0.1130106, -3.789587, 0.8823529, 1, 0, 1,
-0.9369205, 1.096632, -0.6910406, 0.8784314, 1, 0, 1,
-0.9286805, 0.4085014, -3.068869, 0.8705882, 1, 0, 1,
-0.9255259, 0.0379919, -1.366221, 0.8666667, 1, 0, 1,
-0.9207026, -0.3037264, -2.061945, 0.8588235, 1, 0, 1,
-0.9181144, 1.091243, -2.390858, 0.854902, 1, 0, 1,
-0.9116278, 0.356675, -0.5265371, 0.8470588, 1, 0, 1,
-0.9079951, -1.328362, -3.988178, 0.8431373, 1, 0, 1,
-0.90674, 0.6211076, -0.3207853, 0.8352941, 1, 0, 1,
-0.904684, 1.078688, -0.1793692, 0.8313726, 1, 0, 1,
-0.9025221, 0.6050271, -2.54631, 0.8235294, 1, 0, 1,
-0.9019699, -1.846657, -2.429211, 0.8196079, 1, 0, 1,
-0.8985868, 1.165149, -1.946444, 0.8117647, 1, 0, 1,
-0.8933326, -0.4786976, -2.647334, 0.8078431, 1, 0, 1,
-0.8924759, 1.766997, 0.8244768, 0.8, 1, 0, 1,
-0.889595, -1.336741, -2.480592, 0.7921569, 1, 0, 1,
-0.8869892, 0.9358608, -0.228358, 0.7882353, 1, 0, 1,
-0.8865387, 1.209036, -0.1565627, 0.7803922, 1, 0, 1,
-0.8835641, 1.926871, 0.9834371, 0.7764706, 1, 0, 1,
-0.883091, -2.556534, -2.279872, 0.7686275, 1, 0, 1,
-0.877353, 1.236142, 0.2916892, 0.7647059, 1, 0, 1,
-0.8755034, 1.279973, -0.5829289, 0.7568628, 1, 0, 1,
-0.8723707, 1.405874, -0.8812711, 0.7529412, 1, 0, 1,
-0.868919, -0.8040771, -1.537006, 0.7450981, 1, 0, 1,
-0.8680751, -0.2945984, -2.076599, 0.7411765, 1, 0, 1,
-0.8574659, 0.1887053, -3.876918, 0.7333333, 1, 0, 1,
-0.8570367, -0.6715621, -1.326023, 0.7294118, 1, 0, 1,
-0.8548885, -1.069107, -3.141731, 0.7215686, 1, 0, 1,
-0.8511852, -0.06920683, -2.647596, 0.7176471, 1, 0, 1,
-0.8504999, -1.654501, -2.441747, 0.7098039, 1, 0, 1,
-0.8452005, -0.4023337, -1.464218, 0.7058824, 1, 0, 1,
-0.8444304, -0.4264236, -4.688867, 0.6980392, 1, 0, 1,
-0.8440243, 1.999093, 0.4190585, 0.6901961, 1, 0, 1,
-0.8433805, -0.2767919, -1.965223, 0.6862745, 1, 0, 1,
-0.8411562, 0.8391292, 0.4588849, 0.6784314, 1, 0, 1,
-0.8390414, 0.1227572, -1.824173, 0.6745098, 1, 0, 1,
-0.8367997, 1.058831, 0.1717356, 0.6666667, 1, 0, 1,
-0.8314387, -0.1377469, -2.263315, 0.6627451, 1, 0, 1,
-0.8298388, 0.8107437, -0.944272, 0.654902, 1, 0, 1,
-0.8267231, -0.6481445, -1.875834, 0.6509804, 1, 0, 1,
-0.8237703, 0.3100992, -0.5209432, 0.6431373, 1, 0, 1,
-0.8226622, 0.483093, -2.191395, 0.6392157, 1, 0, 1,
-0.8210689, -0.9562737, -3.400942, 0.6313726, 1, 0, 1,
-0.8182434, -0.6415245, -1.728696, 0.627451, 1, 0, 1,
-0.8152451, -1.696297, -1.800547, 0.6196079, 1, 0, 1,
-0.8150176, -0.5123217, -1.488058, 0.6156863, 1, 0, 1,
-0.8121938, 0.2282266, -0.9356863, 0.6078432, 1, 0, 1,
-0.803596, 1.336483, 0.004278163, 0.6039216, 1, 0, 1,
-0.8025389, 1.751497, 0.7414663, 0.5960785, 1, 0, 1,
-0.8003295, 1.792704, -0.02529198, 0.5882353, 1, 0, 1,
-0.7960652, 0.719511, -0.458592, 0.5843138, 1, 0, 1,
-0.793561, -0.5729576, -1.936832, 0.5764706, 1, 0, 1,
-0.7923758, 0.8247929, -1.522018, 0.572549, 1, 0, 1,
-0.7909819, -0.1635599, -0.05300841, 0.5647059, 1, 0, 1,
-0.7774965, 0.3592598, -0.9313644, 0.5607843, 1, 0, 1,
-0.7731357, -1.718206, -4.184067, 0.5529412, 1, 0, 1,
-0.7715107, 0.4807013, -1.083475, 0.5490196, 1, 0, 1,
-0.7660153, 0.2175715, 0.1872748, 0.5411765, 1, 0, 1,
-0.761215, -0.5437638, -3.694582, 0.5372549, 1, 0, 1,
-0.7583327, -0.4259028, -0.2275228, 0.5294118, 1, 0, 1,
-0.758047, -0.132839, -1.990048, 0.5254902, 1, 0, 1,
-0.7541047, 0.1883765, -0.3970172, 0.5176471, 1, 0, 1,
-0.7533303, 2.018093, -1.211623, 0.5137255, 1, 0, 1,
-0.7526807, 0.7945684, -0.5331148, 0.5058824, 1, 0, 1,
-0.7492564, -0.4903416, -2.053071, 0.5019608, 1, 0, 1,
-0.7451007, -1.199641, -2.482514, 0.4941176, 1, 0, 1,
-0.7382711, 0.8021196, -1.670793, 0.4862745, 1, 0, 1,
-0.7374652, -0.7136751, -1.347449, 0.4823529, 1, 0, 1,
-0.7370207, -0.6134587, -2.286019, 0.4745098, 1, 0, 1,
-0.7328934, 1.06945, -0.8800365, 0.4705882, 1, 0, 1,
-0.7327002, 0.2182226, -1.304589, 0.4627451, 1, 0, 1,
-0.732677, -0.3221385, -1.74815, 0.4588235, 1, 0, 1,
-0.7293895, 1.649067, -0.672404, 0.4509804, 1, 0, 1,
-0.7236857, -0.8428313, -1.027393, 0.4470588, 1, 0, 1,
-0.7234024, -0.4320496, -1.251555, 0.4392157, 1, 0, 1,
-0.7203134, 0.3990675, -0.3737083, 0.4352941, 1, 0, 1,
-0.7197419, 1.540051, 1.155328, 0.427451, 1, 0, 1,
-0.7077621, 0.7619442, -0.9894361, 0.4235294, 1, 0, 1,
-0.7050855, -0.8670952, -1.62225, 0.4156863, 1, 0, 1,
-0.7031236, -1.279595, -1.325076, 0.4117647, 1, 0, 1,
-0.7027668, 0.6022707, -1.417008, 0.4039216, 1, 0, 1,
-0.7016381, 0.1162907, -2.385215, 0.3960784, 1, 0, 1,
-0.6942478, -0.4092462, -2.649449, 0.3921569, 1, 0, 1,
-0.691691, -0.09624633, -1.222127, 0.3843137, 1, 0, 1,
-0.6903206, -0.9922869, -2.647495, 0.3803922, 1, 0, 1,
-0.690079, 0.2348418, -0.1849372, 0.372549, 1, 0, 1,
-0.6881415, 0.06256489, -1.64184, 0.3686275, 1, 0, 1,
-0.6819215, 0.3064315, -1.699078, 0.3607843, 1, 0, 1,
-0.679524, 1.327551, -0.7519419, 0.3568628, 1, 0, 1,
-0.6773259, 0.4034111, -1.037548, 0.3490196, 1, 0, 1,
-0.6745145, -0.2457735, -1.328104, 0.345098, 1, 0, 1,
-0.6719978, 1.542717, 0.1216394, 0.3372549, 1, 0, 1,
-0.6706397, -1.887505, -3.055037, 0.3333333, 1, 0, 1,
-0.6705981, 0.7084908, -1.710537, 0.3254902, 1, 0, 1,
-0.6686476, -0.1930697, -1.090552, 0.3215686, 1, 0, 1,
-0.6596871, -1.674184, -1.844631, 0.3137255, 1, 0, 1,
-0.6576682, -0.3565807, -1.171869, 0.3098039, 1, 0, 1,
-0.6565081, -0.3153192, -4.608612, 0.3019608, 1, 0, 1,
-0.6557576, -0.355045, -1.926608, 0.2941177, 1, 0, 1,
-0.6525709, 2.333832, 0.0963591, 0.2901961, 1, 0, 1,
-0.6517646, 0.2606215, -2.274747, 0.282353, 1, 0, 1,
-0.6477223, -0.6808817, -5.163942, 0.2784314, 1, 0, 1,
-0.6398873, -0.5654204, -2.047396, 0.2705882, 1, 0, 1,
-0.6396244, -0.5415025, -3.316388, 0.2666667, 1, 0, 1,
-0.6297764, -0.8323013, -1.034305, 0.2588235, 1, 0, 1,
-0.6264115, 1.376379, -0.780915, 0.254902, 1, 0, 1,
-0.6247647, 1.132737, 0.4753371, 0.2470588, 1, 0, 1,
-0.6246018, 0.8082993, -0.6027429, 0.2431373, 1, 0, 1,
-0.6192788, -0.9011788, -3.686806, 0.2352941, 1, 0, 1,
-0.6124935, 0.3245224, -1.004738, 0.2313726, 1, 0, 1,
-0.6095099, 0.6892162, 0.9641278, 0.2235294, 1, 0, 1,
-0.6081149, 0.3510784, -0.02514588, 0.2196078, 1, 0, 1,
-0.6051776, 0.7211179, -1.316927, 0.2117647, 1, 0, 1,
-0.6036896, -1.051485, -2.840677, 0.2078431, 1, 0, 1,
-0.5981229, -0.4145233, -3.489671, 0.2, 1, 0, 1,
-0.5956507, 0.3732202, 0.305447, 0.1921569, 1, 0, 1,
-0.594925, -1.311269, -2.679813, 0.1882353, 1, 0, 1,
-0.5879035, -1.566635, -2.372765, 0.1803922, 1, 0, 1,
-0.5869175, -0.601303, -3.150822, 0.1764706, 1, 0, 1,
-0.5858237, 0.1304276, -0.9137435, 0.1686275, 1, 0, 1,
-0.579894, -0.001791097, -1.651868, 0.1647059, 1, 0, 1,
-0.5782561, 1.417863, 0.1966648, 0.1568628, 1, 0, 1,
-0.5744768, 1.563094, 0.2268268, 0.1529412, 1, 0, 1,
-0.562009, 0.1530553, -0.6578941, 0.145098, 1, 0, 1,
-0.5619627, 1.485541, -1.627609, 0.1411765, 1, 0, 1,
-0.5614428, -0.1727334, -2.070469, 0.1333333, 1, 0, 1,
-0.556623, 1.484532, -1.733604, 0.1294118, 1, 0, 1,
-0.555624, 0.9308271, -0.7006972, 0.1215686, 1, 0, 1,
-0.5555885, 3.009286, -0.7734156, 0.1176471, 1, 0, 1,
-0.5539751, -1.563323, -3.992905, 0.1098039, 1, 0, 1,
-0.5532201, -0.2135431, -1.087807, 0.1058824, 1, 0, 1,
-0.5474256, -0.7029842, -3.550346, 0.09803922, 1, 0, 1,
-0.544102, -1.538052, -3.781351, 0.09019608, 1, 0, 1,
-0.5414793, -0.1028927, -0.00598524, 0.08627451, 1, 0, 1,
-0.5414209, 0.3593662, -1.767917, 0.07843138, 1, 0, 1,
-0.5315571, 1.6544, -1.361083, 0.07450981, 1, 0, 1,
-0.5295874, -1.382184, -2.264681, 0.06666667, 1, 0, 1,
-0.5281313, 0.0990668, -1.284522, 0.0627451, 1, 0, 1,
-0.5192378, -0.2660171, -0.5441844, 0.05490196, 1, 0, 1,
-0.5171319, -0.8915085, -1.133598, 0.05098039, 1, 0, 1,
-0.5145717, 1.128244, -1.074908, 0.04313726, 1, 0, 1,
-0.5139019, -0.7434612, -2.258166, 0.03921569, 1, 0, 1,
-0.5133384, -0.6223238, -3.252301, 0.03137255, 1, 0, 1,
-0.5127934, 1.029294, -0.08231043, 0.02745098, 1, 0, 1,
-0.5123103, 0.1026796, -2.036698, 0.01960784, 1, 0, 1,
-0.5084001, -0.9213791, -1.791792, 0.01568628, 1, 0, 1,
-0.5069884, 2.717507, 0.1608297, 0.007843138, 1, 0, 1,
-0.5063214, 1.980395, 1.408738, 0.003921569, 1, 0, 1,
-0.5031027, 0.5450351, -1.370898, 0, 1, 0.003921569, 1,
-0.5024922, 0.02025818, -0.7280121, 0, 1, 0.01176471, 1,
-0.4982821, 1.720104, 0.7928366, 0, 1, 0.01568628, 1,
-0.4955282, 2.78179, -0.08090631, 0, 1, 0.02352941, 1,
-0.4909795, -0.5732613, -4.855369, 0, 1, 0.02745098, 1,
-0.4882812, 0.2891573, -1.800291, 0, 1, 0.03529412, 1,
-0.4881569, -1.333395, -2.792869, 0, 1, 0.03921569, 1,
-0.4811027, 1.103132, -0.2552043, 0, 1, 0.04705882, 1,
-0.4773787, 0.4896002, -0.06313385, 0, 1, 0.05098039, 1,
-0.4745885, 0.311681, -1.923106, 0, 1, 0.05882353, 1,
-0.4735449, -0.107427, -2.08082, 0, 1, 0.0627451, 1,
-0.4705969, -0.4502473, -2.461044, 0, 1, 0.07058824, 1,
-0.4704565, -0.08704505, -1.165947, 0, 1, 0.07450981, 1,
-0.4681039, -0.1869298, -3.647807, 0, 1, 0.08235294, 1,
-0.464005, 1.217829, 0.4989091, 0, 1, 0.08627451, 1,
-0.4615403, 0.1328071, -0.8990076, 0, 1, 0.09411765, 1,
-0.457821, 1.49729, -0.1846113, 0, 1, 0.1019608, 1,
-0.4564984, -0.8051802, -2.782929, 0, 1, 0.1058824, 1,
-0.4489016, -0.7265807, -3.63297, 0, 1, 0.1137255, 1,
-0.446647, 0.4345142, -2.585319, 0, 1, 0.1176471, 1,
-0.4442279, -1.534398, -3.510856, 0, 1, 0.1254902, 1,
-0.4402479, 0.6697561, -2.008566, 0, 1, 0.1294118, 1,
-0.4385303, -2.2203, -1.050834, 0, 1, 0.1372549, 1,
-0.428362, 1.794223, -0.2676157, 0, 1, 0.1411765, 1,
-0.4225569, -1.127077, -1.07129, 0, 1, 0.1490196, 1,
-0.4220893, 0.4467961, -0.7744982, 0, 1, 0.1529412, 1,
-0.4217281, -0.9264239, -1.359648, 0, 1, 0.1607843, 1,
-0.4215288, 0.9173632, -0.5899424, 0, 1, 0.1647059, 1,
-0.4213914, -1.265231, -3.165436, 0, 1, 0.172549, 1,
-0.4203648, 0.0707709, -3.342199, 0, 1, 0.1764706, 1,
-0.4203043, -1.020859, -3.561426, 0, 1, 0.1843137, 1,
-0.4193701, -0.8124437, -1.936363, 0, 1, 0.1882353, 1,
-0.4188353, -0.1603242, -2.798926, 0, 1, 0.1960784, 1,
-0.4179865, -0.8107027, -2.486662, 0, 1, 0.2039216, 1,
-0.4178667, 0.8898422, -0.7315722, 0, 1, 0.2078431, 1,
-0.4050416, 0.2328553, -1.577575, 0, 1, 0.2156863, 1,
-0.4029627, -0.9331256, -0.828627, 0, 1, 0.2196078, 1,
-0.3994788, -0.7231746, -4.663076, 0, 1, 0.227451, 1,
-0.3940676, 1.973627, -0.1436899, 0, 1, 0.2313726, 1,
-0.3790984, -0.3736669, -2.290191, 0, 1, 0.2392157, 1,
-0.3765574, 1.966377, -1.758638, 0, 1, 0.2431373, 1,
-0.3742009, -2.51784, -3.150017, 0, 1, 0.2509804, 1,
-0.3731162, -0.9448805, -3.50928, 0, 1, 0.254902, 1,
-0.3729225, 1.43997, -1.280423, 0, 1, 0.2627451, 1,
-0.3705958, 1.132208, -1.947695, 0, 1, 0.2666667, 1,
-0.3691135, 0.8477405, -1.058245, 0, 1, 0.2745098, 1,
-0.3686626, 0.4624177, -1.180401, 0, 1, 0.2784314, 1,
-0.3603446, -0.5816548, -1.929688, 0, 1, 0.2862745, 1,
-0.359343, -0.07324319, -1.170757, 0, 1, 0.2901961, 1,
-0.3590069, 0.8087317, 1.056512, 0, 1, 0.2980392, 1,
-0.3571413, -0.575215, -2.368865, 0, 1, 0.3058824, 1,
-0.3569818, 0.8580285, 1.153918, 0, 1, 0.3098039, 1,
-0.3540585, 2.042176, -0.1455377, 0, 1, 0.3176471, 1,
-0.3510906, 1.89491, 0.9609599, 0, 1, 0.3215686, 1,
-0.3507173, 0.6415796, -1.077188, 0, 1, 0.3294118, 1,
-0.3494895, 0.8381497, 1.442306, 0, 1, 0.3333333, 1,
-0.349423, 1.087586, -0.5081123, 0, 1, 0.3411765, 1,
-0.3488175, -1.063952, -3.356197, 0, 1, 0.345098, 1,
-0.34468, 0.07022128, -1.460507, 0, 1, 0.3529412, 1,
-0.3412826, 0.8542522, 0.5340807, 0, 1, 0.3568628, 1,
-0.341178, -1.301884, -2.736435, 0, 1, 0.3647059, 1,
-0.3399294, 2.680954, -1.220805, 0, 1, 0.3686275, 1,
-0.3330403, -1.461111, -3.844633, 0, 1, 0.3764706, 1,
-0.3306877, 0.4418428, -0.3775262, 0, 1, 0.3803922, 1,
-0.328541, 1.911116, -0.07339184, 0, 1, 0.3882353, 1,
-0.3268864, -0.1105244, -2.340602, 0, 1, 0.3921569, 1,
-0.3252583, 0.308579, 0.9381802, 0, 1, 0.4, 1,
-0.3236433, 0.3047211, -0.8115268, 0, 1, 0.4078431, 1,
-0.3201912, -0.8110228, -4.090954, 0, 1, 0.4117647, 1,
-0.3189729, 2.308661, 1.361221, 0, 1, 0.4196078, 1,
-0.3160257, -1.07571, -3.239972, 0, 1, 0.4235294, 1,
-0.3157631, 0.4329982, -2.119228, 0, 1, 0.4313726, 1,
-0.3149269, 0.4129544, -1.094104, 0, 1, 0.4352941, 1,
-0.3129995, -0.3819766, -3.084491, 0, 1, 0.4431373, 1,
-0.3125628, 1.939313, -0.6101571, 0, 1, 0.4470588, 1,
-0.3096891, 1.922887, 0.3199964, 0, 1, 0.454902, 1,
-0.3065791, -0.6538882, -3.105015, 0, 1, 0.4588235, 1,
-0.3062244, -0.2837447, -3.751079, 0, 1, 0.4666667, 1,
-0.3058777, -0.6598511, -1.791583, 0, 1, 0.4705882, 1,
-0.3044021, -0.4647832, -0.8691881, 0, 1, 0.4784314, 1,
-0.2919388, 0.0009019004, -1.302883, 0, 1, 0.4823529, 1,
-0.2885759, 0.4100417, -1.351482, 0, 1, 0.4901961, 1,
-0.2867937, 1.280782, -1.937004, 0, 1, 0.4941176, 1,
-0.2851284, -0.7727203, -2.651198, 0, 1, 0.5019608, 1,
-0.2772696, -0.5984119, -3.53347, 0, 1, 0.509804, 1,
-0.276711, 0.649143, -0.7763615, 0, 1, 0.5137255, 1,
-0.2689429, -0.5492216, -2.158799, 0, 1, 0.5215687, 1,
-0.2685935, -0.9014862, -3.099106, 0, 1, 0.5254902, 1,
-0.2669625, -0.7816523, -1.26278, 0, 1, 0.5333334, 1,
-0.2640801, 0.1967389, -1.076671, 0, 1, 0.5372549, 1,
-0.2623085, 0.7934114, -1.065868, 0, 1, 0.5450981, 1,
-0.2578701, -0.1502594, -1.333582, 0, 1, 0.5490196, 1,
-0.2549283, -0.1997283, -3.105858, 0, 1, 0.5568628, 1,
-0.2508025, 0.3377533, -1.0352, 0, 1, 0.5607843, 1,
-0.2507092, 0.6614273, 0.1214344, 0, 1, 0.5686275, 1,
-0.2505963, -1.126194, -2.804906, 0, 1, 0.572549, 1,
-0.2493225, 0.1325103, -3.701613, 0, 1, 0.5803922, 1,
-0.2438402, -2.759822, -2.200019, 0, 1, 0.5843138, 1,
-0.2407658, -0.07721487, -1.651161, 0, 1, 0.5921569, 1,
-0.2366459, 0.3054773, -0.1426261, 0, 1, 0.5960785, 1,
-0.2341782, -0.7611639, -2.884586, 0, 1, 0.6039216, 1,
-0.2334471, 0.3234608, -0.889248, 0, 1, 0.6117647, 1,
-0.2329124, 0.8054947, -1.146636, 0, 1, 0.6156863, 1,
-0.2309357, 1.993449, 0.04966461, 0, 1, 0.6235294, 1,
-0.2278761, -1.121382, -2.504785, 0, 1, 0.627451, 1,
-0.2216436, -0.9947554, -3.210649, 0, 1, 0.6352941, 1,
-0.2207879, -1.150008, -4.516915, 0, 1, 0.6392157, 1,
-0.2206426, -0.8575724, -1.971143, 0, 1, 0.6470588, 1,
-0.2133889, 1.410749, -0.1538201, 0, 1, 0.6509804, 1,
-0.2116035, -2.821463, -4.41724, 0, 1, 0.6588235, 1,
-0.2111055, -0.0685765, 0.7018352, 0, 1, 0.6627451, 1,
-0.2033188, -0.01295603, -2.00551, 0, 1, 0.6705883, 1,
-0.20265, -0.9197797, -2.714841, 0, 1, 0.6745098, 1,
-0.1994377, 0.02601525, -1.823586, 0, 1, 0.682353, 1,
-0.1930644, -0.02104683, -1.775836, 0, 1, 0.6862745, 1,
-0.1899277, -1.876823, -2.305148, 0, 1, 0.6941177, 1,
-0.1898232, 1.706995, -0.1100813, 0, 1, 0.7019608, 1,
-0.1851011, -1.002493, -4.576081, 0, 1, 0.7058824, 1,
-0.1781208, -0.1443197, 1.051007, 0, 1, 0.7137255, 1,
-0.1758124, -0.9869846, -2.983195, 0, 1, 0.7176471, 1,
-0.1740963, 0.3412382, 0.104981, 0, 1, 0.7254902, 1,
-0.171949, -0.5095352, -3.292127, 0, 1, 0.7294118, 1,
-0.1714057, 0.3424854, 0.8012376, 0, 1, 0.7372549, 1,
-0.1688542, 0.7313652, 0.6672542, 0, 1, 0.7411765, 1,
-0.1648497, -0.5670162, -2.592865, 0, 1, 0.7490196, 1,
-0.1633111, -1.03505, -1.350428, 0, 1, 0.7529412, 1,
-0.160338, 0.3460459, -0.4599365, 0, 1, 0.7607843, 1,
-0.1584312, -0.1983622, -2.089466, 0, 1, 0.7647059, 1,
-0.1544969, -1.391664, -4.29166, 0, 1, 0.772549, 1,
-0.1524746, -0.9343262, -1.165809, 0, 1, 0.7764706, 1,
-0.1522915, 1.434872, -0.9345727, 0, 1, 0.7843137, 1,
-0.1520478, -0.5394717, -2.451131, 0, 1, 0.7882353, 1,
-0.1483841, -0.2843196, -2.017153, 0, 1, 0.7960784, 1,
-0.146572, -1.796651, -3.64685, 0, 1, 0.8039216, 1,
-0.1439815, -0.2344598, -1.900452, 0, 1, 0.8078431, 1,
-0.1426092, -1.374633, -2.382626, 0, 1, 0.8156863, 1,
-0.1370765, 1.176744, -0.0905607, 0, 1, 0.8196079, 1,
-0.1364998, 1.008029, 0.404787, 0, 1, 0.827451, 1,
-0.1329102, 1.26491, 0.5231908, 0, 1, 0.8313726, 1,
-0.1308296, -1.255665, -4.193773, 0, 1, 0.8392157, 1,
-0.1251965, -0.2684044, -0.7085974, 0, 1, 0.8431373, 1,
-0.1239309, -0.3919368, -1.977848, 0, 1, 0.8509804, 1,
-0.1217281, -0.4579581, -3.061092, 0, 1, 0.854902, 1,
-0.1213465, 0.2823128, 0.348891, 0, 1, 0.8627451, 1,
-0.1210785, 0.5932131, -1.622108, 0, 1, 0.8666667, 1,
-0.1187988, 0.418334, -0.07147805, 0, 1, 0.8745098, 1,
-0.1173909, 0.1233274, -1.382955, 0, 1, 0.8784314, 1,
-0.1169884, -1.087899, -1.494254, 0, 1, 0.8862745, 1,
-0.1154392, -0.08921704, -2.193946, 0, 1, 0.8901961, 1,
-0.1153018, -0.9562657, -2.023979, 0, 1, 0.8980392, 1,
-0.1139639, 0.3478618, 0.3088166, 0, 1, 0.9058824, 1,
-0.1137054, 0.5419261, 0.4933336, 0, 1, 0.9098039, 1,
-0.1132446, 0.1933069, -0.6024368, 0, 1, 0.9176471, 1,
-0.1121912, 0.5967655, -0.8540882, 0, 1, 0.9215686, 1,
-0.1084606, -1.071623, -3.383025, 0, 1, 0.9294118, 1,
-0.1070006, -0.4083202, -3.753289, 0, 1, 0.9333333, 1,
-0.1067131, 0.5781032, -0.200288, 0, 1, 0.9411765, 1,
-0.1008345, 0.6251956, 0.281384, 0, 1, 0.945098, 1,
-0.1006474, -0.5524044, -2.607476, 0, 1, 0.9529412, 1,
-0.09816355, 1.043288, -1.091592, 0, 1, 0.9568627, 1,
-0.08679404, -0.08126254, -1.551127, 0, 1, 0.9647059, 1,
-0.082532, 1.4256, 0.09611397, 0, 1, 0.9686275, 1,
-0.08110639, -0.2378611, -3.023605, 0, 1, 0.9764706, 1,
-0.07676557, -0.6349096, -3.114582, 0, 1, 0.9803922, 1,
-0.07673134, 0.4106298, 0.3216066, 0, 1, 0.9882353, 1,
-0.07582177, -0.8726078, -3.628821, 0, 1, 0.9921569, 1,
-0.07148162, 2.318402, 1.763322, 0, 1, 1, 1,
-0.0656687, 0.2956489, -1.398068, 0, 0.9921569, 1, 1,
-0.0608567, -0.531041, -2.334976, 0, 0.9882353, 1, 1,
-0.0604934, -1.350582, -2.685527, 0, 0.9803922, 1, 1,
-0.05979856, 0.7735946, 0.2772482, 0, 0.9764706, 1, 1,
-0.05384982, 0.6033715, -0.7769399, 0, 0.9686275, 1, 1,
-0.0505954, -0.01425094, -1.742106, 0, 0.9647059, 1, 1,
-0.04806744, 0.7391658, -2.25627, 0, 0.9568627, 1, 1,
-0.04547403, -0.7862509, -3.172685, 0, 0.9529412, 1, 1,
-0.03510296, -0.3254795, -4.175148, 0, 0.945098, 1, 1,
-0.03490925, 0.1607648, -0.5050065, 0, 0.9411765, 1, 1,
-0.02940206, -0.461581, -1.029555, 0, 0.9333333, 1, 1,
-0.027476, 0.1383283, -0.3828203, 0, 0.9294118, 1, 1,
-0.02682304, -0.4016829, -2.448654, 0, 0.9215686, 1, 1,
-0.02505522, -2.20603, -4.079672, 0, 0.9176471, 1, 1,
-0.0248574, 0.9782805, 1.528289, 0, 0.9098039, 1, 1,
-0.02427728, -0.6018522, -4.017295, 0, 0.9058824, 1, 1,
-0.02172366, -0.3175666, -1.198996, 0, 0.8980392, 1, 1,
-0.02120815, 0.1250006, -0.5215178, 0, 0.8901961, 1, 1,
-0.01518013, -1.685734, -2.672269, 0, 0.8862745, 1, 1,
-0.0100565, 1.288525, 1.450718, 0, 0.8784314, 1, 1,
-0.00926383, 0.1455768, -0.6252779, 0, 0.8745098, 1, 1,
-0.008924897, -0.707303, -1.992068, 0, 0.8666667, 1, 1,
-0.001398886, 0.1694032, 0.3542349, 0, 0.8627451, 1, 1,
-0.0005460138, -1.684421, -1.795572, 0, 0.854902, 1, 1,
0.004671944, -1.058405, 4.073199, 0, 0.8509804, 1, 1,
0.006955227, 0.934013, -0.1098996, 0, 0.8431373, 1, 1,
0.01034152, 1.59128, -0.1076756, 0, 0.8392157, 1, 1,
0.01111115, 0.3817133, -0.3744636, 0, 0.8313726, 1, 1,
0.01151504, -0.6729657, 1.960316, 0, 0.827451, 1, 1,
0.01165417, 1.241214, 0.4656913, 0, 0.8196079, 1, 1,
0.01381424, -0.7684368, 3.406816, 0, 0.8156863, 1, 1,
0.01706205, -1.316212, 3.321838, 0, 0.8078431, 1, 1,
0.01715698, -1.296324, 3.013829, 0, 0.8039216, 1, 1,
0.01828237, -1.511464, 3.462203, 0, 0.7960784, 1, 1,
0.0185062, 0.1314631, -1.623399, 0, 0.7882353, 1, 1,
0.01943703, 0.6386996, 0.4078343, 0, 0.7843137, 1, 1,
0.02249032, 0.1625278, 3.110559, 0, 0.7764706, 1, 1,
0.03297859, -0.6880406, 4.089665, 0, 0.772549, 1, 1,
0.03307144, -0.8487165, 3.075641, 0, 0.7647059, 1, 1,
0.03366566, -0.7725388, 1.063065, 0, 0.7607843, 1, 1,
0.03942851, 0.01164577, 1.362064, 0, 0.7529412, 1, 1,
0.04020262, 0.2910741, -0.7577058, 0, 0.7490196, 1, 1,
0.04382497, 0.6999927, 0.07991616, 0, 0.7411765, 1, 1,
0.04653239, -1.962919, 2.968631, 0, 0.7372549, 1, 1,
0.04749891, 0.820734, 1.080057, 0, 0.7294118, 1, 1,
0.04862874, -1.600881, 3.351411, 0, 0.7254902, 1, 1,
0.0488339, -1.376857, 2.132137, 0, 0.7176471, 1, 1,
0.05027214, 0.7191285, 0.7293283, 0, 0.7137255, 1, 1,
0.05183273, -1.144558, 3.337284, 0, 0.7058824, 1, 1,
0.05197055, -0.5872843, 3.334642, 0, 0.6980392, 1, 1,
0.0556864, 0.9463991, 2.22036, 0, 0.6941177, 1, 1,
0.05871801, -0.7863038, 2.087695, 0, 0.6862745, 1, 1,
0.05890676, -0.2709456, 1.854812, 0, 0.682353, 1, 1,
0.06144955, 0.3038032, 1.255028, 0, 0.6745098, 1, 1,
0.06779686, -1.503593, 3.714865, 0, 0.6705883, 1, 1,
0.06981875, 0.6794123, 1.794713, 0, 0.6627451, 1, 1,
0.07087242, -0.8208546, 2.268772, 0, 0.6588235, 1, 1,
0.07111537, -1.684371, 4.283761, 0, 0.6509804, 1, 1,
0.07432389, 0.384647, -0.01138465, 0, 0.6470588, 1, 1,
0.07705282, -1.344382, 2.420533, 0, 0.6392157, 1, 1,
0.08040327, -0.3250933, 1.738462, 0, 0.6352941, 1, 1,
0.08662928, 0.2152296, 0.5358992, 0, 0.627451, 1, 1,
0.09021436, 0.3552442, 0.5991356, 0, 0.6235294, 1, 1,
0.09371957, 1.246698, -0.22868, 0, 0.6156863, 1, 1,
0.09598576, -0.791123, 3.730572, 0, 0.6117647, 1, 1,
0.09929244, 1.86767, -0.7051889, 0, 0.6039216, 1, 1,
0.1047327, 0.4070842, 0.3574197, 0, 0.5960785, 1, 1,
0.106091, 0.920277, 0.08299286, 0, 0.5921569, 1, 1,
0.1086245, -0.7622021, 2.971759, 0, 0.5843138, 1, 1,
0.1107728, 0.06519117, -0.2182796, 0, 0.5803922, 1, 1,
0.1111809, -1.307226, 3.219501, 0, 0.572549, 1, 1,
0.1117528, 0.280151, 0.2578254, 0, 0.5686275, 1, 1,
0.1184755, -0.5400244, 2.610255, 0, 0.5607843, 1, 1,
0.1189715, 0.2269135, -0.4119076, 0, 0.5568628, 1, 1,
0.1215786, -0.4649906, 1.62984, 0, 0.5490196, 1, 1,
0.1237289, -0.7700412, 3.724599, 0, 0.5450981, 1, 1,
0.1246951, -0.8048115, 2.551565, 0, 0.5372549, 1, 1,
0.1285746, 0.9942636, 0.9533101, 0, 0.5333334, 1, 1,
0.1309841, -0.1174362, 1.246951, 0, 0.5254902, 1, 1,
0.1310935, 0.01161288, 1.647427, 0, 0.5215687, 1, 1,
0.1319756, 0.3334881, 1.169898, 0, 0.5137255, 1, 1,
0.133692, 0.7370281, -0.1723293, 0, 0.509804, 1, 1,
0.134352, -0.8344247, 1.367174, 0, 0.5019608, 1, 1,
0.134919, -2.586574, 2.879788, 0, 0.4941176, 1, 1,
0.1350895, 1.198036, -1.721571, 0, 0.4901961, 1, 1,
0.135451, -0.9288588, 1.046852, 0, 0.4823529, 1, 1,
0.135518, -0.5683866, 3.177422, 0, 0.4784314, 1, 1,
0.140494, 0.01993764, 1.809566, 0, 0.4705882, 1, 1,
0.1407841, -1.022402, 3.318628, 0, 0.4666667, 1, 1,
0.1408918, -0.9055038, 3.637013, 0, 0.4588235, 1, 1,
0.1410459, -2.094478, 2.770049, 0, 0.454902, 1, 1,
0.142625, -0.812944, 5.314455, 0, 0.4470588, 1, 1,
0.1432457, -0.39481, 1.546656, 0, 0.4431373, 1, 1,
0.1435281, -0.01698535, 1.973565, 0, 0.4352941, 1, 1,
0.1436846, 0.6575779, 0.1283959, 0, 0.4313726, 1, 1,
0.1502625, -1.392267, 3.229875, 0, 0.4235294, 1, 1,
0.1509577, -2.041894, 3.715561, 0, 0.4196078, 1, 1,
0.1543796, -1.192088, 1.956154, 0, 0.4117647, 1, 1,
0.1550928, 0.1996635, 0.7205727, 0, 0.4078431, 1, 1,
0.1567866, -1.136431, 2.973411, 0, 0.4, 1, 1,
0.1593016, 0.517643, 0.4216349, 0, 0.3921569, 1, 1,
0.16141, -0.7786413, 1.917551, 0, 0.3882353, 1, 1,
0.1621489, -3.092182, 3.672157, 0, 0.3803922, 1, 1,
0.1632484, -0.8024292, 0.7537109, 0, 0.3764706, 1, 1,
0.1633782, -0.548036, 0.8590936, 0, 0.3686275, 1, 1,
0.1647104, 0.6233069, 1.784524, 0, 0.3647059, 1, 1,
0.1680082, 0.9780503, 0.4615089, 0, 0.3568628, 1, 1,
0.1685562, -0.511187, 2.578134, 0, 0.3529412, 1, 1,
0.1690231, 0.1823411, 2.565846, 0, 0.345098, 1, 1,
0.1709444, 1.879887, -1.110701, 0, 0.3411765, 1, 1,
0.173757, -0.03557537, 1.025869, 0, 0.3333333, 1, 1,
0.1745937, -0.5852873, 3.003647, 0, 0.3294118, 1, 1,
0.1755958, 0.2896353, 0.8282364, 0, 0.3215686, 1, 1,
0.1798324, -1.876917, 0.4590167, 0, 0.3176471, 1, 1,
0.1887565, -1.286359, 2.877724, 0, 0.3098039, 1, 1,
0.1899443, 0.0009122476, 1.067644, 0, 0.3058824, 1, 1,
0.1913749, -1.341586, 2.944587, 0, 0.2980392, 1, 1,
0.1921437, 1.898155, 2.565154, 0, 0.2901961, 1, 1,
0.1957576, -1.220095, 2.448458, 0, 0.2862745, 1, 1,
0.1961549, 0.5298032, 0.2280741, 0, 0.2784314, 1, 1,
0.1992369, -0.637454, 2.941514, 0, 0.2745098, 1, 1,
0.202044, 0.5215788, -0.9107392, 0, 0.2666667, 1, 1,
0.2035718, -0.3953885, 3.041038, 0, 0.2627451, 1, 1,
0.204999, -1.2311, 3.011294, 0, 0.254902, 1, 1,
0.2096679, -1.386203, 2.630826, 0, 0.2509804, 1, 1,
0.2133533, 1.526131, 0.692606, 0, 0.2431373, 1, 1,
0.2142891, -0.1866941, 2.878653, 0, 0.2392157, 1, 1,
0.2175789, 0.5841233, -0.7691596, 0, 0.2313726, 1, 1,
0.2274876, 1.578971, 1.199113, 0, 0.227451, 1, 1,
0.2283954, 0.2614487, -0.09838157, 0, 0.2196078, 1, 1,
0.2304407, 1.453613, 0.01537006, 0, 0.2156863, 1, 1,
0.238467, -1.20601, 2.61486, 0, 0.2078431, 1, 1,
0.2394657, 1.816041, 0.7063549, 0, 0.2039216, 1, 1,
0.2444893, -0.4782102, 2.045998, 0, 0.1960784, 1, 1,
0.2461549, 0.3756869, -0.3578874, 0, 0.1882353, 1, 1,
0.2481795, -3.113832, 5.619385, 0, 0.1843137, 1, 1,
0.2487585, -0.7187239, 5.094602, 0, 0.1764706, 1, 1,
0.2506493, -0.3925334, 2.744388, 0, 0.172549, 1, 1,
0.2541148, -0.6033794, 3.283791, 0, 0.1647059, 1, 1,
0.2542286, 0.02474547, 1.229518, 0, 0.1607843, 1, 1,
0.2575122, 1.378766, 1.277387, 0, 0.1529412, 1, 1,
0.260293, -0.5029982, 1.465249, 0, 0.1490196, 1, 1,
0.2606623, -0.3388273, 2.547392, 0, 0.1411765, 1, 1,
0.2656676, -0.8025537, 3.789212, 0, 0.1372549, 1, 1,
0.2675852, 0.1667352, 0.4240248, 0, 0.1294118, 1, 1,
0.2744336, -2.529588, 2.980327, 0, 0.1254902, 1, 1,
0.2746186, -0.7169684, 2.108783, 0, 0.1176471, 1, 1,
0.2840298, 0.06215437, 1.649364, 0, 0.1137255, 1, 1,
0.2912724, -0.5654747, 3.285982, 0, 0.1058824, 1, 1,
0.2918052, -0.1984489, 1.65611, 0, 0.09803922, 1, 1,
0.2933073, -0.6048065, 3.442513, 0, 0.09411765, 1, 1,
0.2952234, 1.245541, 0.1254537, 0, 0.08627451, 1, 1,
0.2963868, 1.512532, 0.5862752, 0, 0.08235294, 1, 1,
0.2972053, -0.04163036, 0.8190089, 0, 0.07450981, 1, 1,
0.299044, 1.930725, 1.975817, 0, 0.07058824, 1, 1,
0.3010016, -0.02714603, 2.668744, 0, 0.0627451, 1, 1,
0.3057953, -0.409757, 4.819454, 0, 0.05882353, 1, 1,
0.3065583, -0.2895324, 2.538131, 0, 0.05098039, 1, 1,
0.3102558, -0.2940892, 1.944495, 0, 0.04705882, 1, 1,
0.3120502, 1.194416, 1.58203, 0, 0.03921569, 1, 1,
0.3303576, 0.5714063, 0.9229252, 0, 0.03529412, 1, 1,
0.3339718, 2.015877, -2.299453, 0, 0.02745098, 1, 1,
0.3364021, -0.3866726, 2.933298, 0, 0.02352941, 1, 1,
0.3394251, -0.6620396, 3.09763, 0, 0.01568628, 1, 1,
0.3397487, -0.04032464, 3.412632, 0, 0.01176471, 1, 1,
0.3430379, -0.1725725, 1.550609, 0, 0.003921569, 1, 1,
0.3441973, 0.3415373, 1.974044, 0.003921569, 0, 1, 1,
0.3451781, -0.3168546, 2.972377, 0.007843138, 0, 1, 1,
0.3453648, 0.04857157, 2.156558, 0.01568628, 0, 1, 1,
0.3483407, -0.7740509, 1.798071, 0.01960784, 0, 1, 1,
0.3602632, 0.02952918, 1.707594, 0.02745098, 0, 1, 1,
0.3660999, 0.08822645, -1.117574, 0.03137255, 0, 1, 1,
0.3680787, 1.201466, -0.2697673, 0.03921569, 0, 1, 1,
0.3700501, 0.6557553, 1.163156, 0.04313726, 0, 1, 1,
0.370733, 1.144392, 2.994068, 0.05098039, 0, 1, 1,
0.3717182, -1.081339, 2.034729, 0.05490196, 0, 1, 1,
0.3718047, 0.05066668, 2.269416, 0.0627451, 0, 1, 1,
0.3765577, -0.002474171, 2.324733, 0.06666667, 0, 1, 1,
0.3839241, -0.770063, 2.183482, 0.07450981, 0, 1, 1,
0.3848411, -1.235555, 2.252611, 0.07843138, 0, 1, 1,
0.3890628, 0.5520186, 0.9523139, 0.08627451, 0, 1, 1,
0.3951067, -0.9797842, 1.870948, 0.09019608, 0, 1, 1,
0.3962363, -0.9372197, 3.930393, 0.09803922, 0, 1, 1,
0.3985407, 2.116854, 1.153761, 0.1058824, 0, 1, 1,
0.401935, 1.130144, 0.4183315, 0.1098039, 0, 1, 1,
0.4026396, 0.1751304, 0.1598093, 0.1176471, 0, 1, 1,
0.4092833, 0.7782812, 1.66224, 0.1215686, 0, 1, 1,
0.4099545, 1.558291, 2.474688, 0.1294118, 0, 1, 1,
0.4111975, 0.175816, 1.814579, 0.1333333, 0, 1, 1,
0.4114036, -0.4816032, 2.017276, 0.1411765, 0, 1, 1,
0.4191363, 2.540859, 0.3531218, 0.145098, 0, 1, 1,
0.4203301, 0.3635363, 1.072752, 0.1529412, 0, 1, 1,
0.4208294, -1.103352, 4.64142, 0.1568628, 0, 1, 1,
0.4237842, -0.3876306, 3.120291, 0.1647059, 0, 1, 1,
0.4244828, 0.07516021, 1.555203, 0.1686275, 0, 1, 1,
0.4287166, -1.187459, 2.634234, 0.1764706, 0, 1, 1,
0.4364813, -0.3774807, 3.302196, 0.1803922, 0, 1, 1,
0.4384708, -0.9282788, 2.799536, 0.1882353, 0, 1, 1,
0.4420847, -0.6367544, 2.748504, 0.1921569, 0, 1, 1,
0.4440456, 0.1098161, 2.690124, 0.2, 0, 1, 1,
0.4469936, 1.394319, -1.109699, 0.2078431, 0, 1, 1,
0.4520801, 0.2506236, 2.188061, 0.2117647, 0, 1, 1,
0.4569704, -0.05044454, 3.204601, 0.2196078, 0, 1, 1,
0.4581892, 1.488009, 2.366552, 0.2235294, 0, 1, 1,
0.4638438, -0.6367633, 2.959236, 0.2313726, 0, 1, 1,
0.4699505, 0.2440661, 2.814253, 0.2352941, 0, 1, 1,
0.4753105, -1.160277, 3.952989, 0.2431373, 0, 1, 1,
0.4766677, -1.066366, 1.616666, 0.2470588, 0, 1, 1,
0.4779474, -0.3900868, 2.364096, 0.254902, 0, 1, 1,
0.4780523, 0.3241819, 1.422724, 0.2588235, 0, 1, 1,
0.4866014, 0.9195696, -0.2935526, 0.2666667, 0, 1, 1,
0.48737, -0.4942013, 2.749549, 0.2705882, 0, 1, 1,
0.4951832, -0.456814, 2.511275, 0.2784314, 0, 1, 1,
0.4963074, -0.01976835, 0.3878016, 0.282353, 0, 1, 1,
0.4980694, -0.8444604, 2.592533, 0.2901961, 0, 1, 1,
0.5013762, -1.095553, 2.062781, 0.2941177, 0, 1, 1,
0.5029476, -0.4295495, 3.741203, 0.3019608, 0, 1, 1,
0.5039981, -1.681247, 3.608939, 0.3098039, 0, 1, 1,
0.5089149, 0.3095452, 0.08052129, 0.3137255, 0, 1, 1,
0.5091065, 0.5303431, 2.407829, 0.3215686, 0, 1, 1,
0.5118341, 0.232423, 1.180941, 0.3254902, 0, 1, 1,
0.5150435, 0.2999612, 1.59445, 0.3333333, 0, 1, 1,
0.5167204, -1.043875, -0.1305863, 0.3372549, 0, 1, 1,
0.5175042, 1.164089, 1.035592, 0.345098, 0, 1, 1,
0.5217366, 0.1012647, 1.817783, 0.3490196, 0, 1, 1,
0.5222768, -1.319047, 4.617034, 0.3568628, 0, 1, 1,
0.5227519, -0.2827522, 1.072179, 0.3607843, 0, 1, 1,
0.5268382, 0.04432398, 2.340361, 0.3686275, 0, 1, 1,
0.5270787, 1.312864, -0.04417648, 0.372549, 0, 1, 1,
0.5287594, 1.358105, 2.433618, 0.3803922, 0, 1, 1,
0.5356864, -1.711283, 3.594295, 0.3843137, 0, 1, 1,
0.5365289, -0.8345684, 3.267164, 0.3921569, 0, 1, 1,
0.5472042, 0.1004598, 1.818631, 0.3960784, 0, 1, 1,
0.5487986, -0.3148535, 2.478717, 0.4039216, 0, 1, 1,
0.5496774, -0.4345461, 3.005761, 0.4117647, 0, 1, 1,
0.5585431, 0.8446944, -0.3081861, 0.4156863, 0, 1, 1,
0.5632786, -1.337507, 3.301242, 0.4235294, 0, 1, 1,
0.5637071, -0.264676, 1.898694, 0.427451, 0, 1, 1,
0.5699674, -1.311233, 2.837342, 0.4352941, 0, 1, 1,
0.5715566, -0.561537, 0.602537, 0.4392157, 0, 1, 1,
0.5718047, 0.5170639, 0.6749534, 0.4470588, 0, 1, 1,
0.5728315, -0.7670906, 1.923243, 0.4509804, 0, 1, 1,
0.5793221, 0.179095, -0.05513283, 0.4588235, 0, 1, 1,
0.5839569, 0.8858502, 0.586273, 0.4627451, 0, 1, 1,
0.5877766, 0.0252067, -0.2820563, 0.4705882, 0, 1, 1,
0.5878316, 0.692766, 0.5262578, 0.4745098, 0, 1, 1,
0.5898067, -0.5869986, 2.986456, 0.4823529, 0, 1, 1,
0.5915906, -0.4414501, 2.884439, 0.4862745, 0, 1, 1,
0.6000351, -0.09212428, 1.249558, 0.4941176, 0, 1, 1,
0.601247, -0.1048068, 1.268909, 0.5019608, 0, 1, 1,
0.6044647, 0.09995237, 2.351514, 0.5058824, 0, 1, 1,
0.6049285, -0.6062246, 2.973033, 0.5137255, 0, 1, 1,
0.608531, -0.1576612, 4.129786, 0.5176471, 0, 1, 1,
0.6110939, -0.4457109, 1.736887, 0.5254902, 0, 1, 1,
0.6133198, -0.8001125, 2.210872, 0.5294118, 0, 1, 1,
0.6163049, -0.7564656, 2.308028, 0.5372549, 0, 1, 1,
0.6164203, 0.1106228, 1.096845, 0.5411765, 0, 1, 1,
0.6174579, -0.946756, 2.326848, 0.5490196, 0, 1, 1,
0.6182038, 2.335671, 2.364289, 0.5529412, 0, 1, 1,
0.6187627, -1.219894, 1.489093, 0.5607843, 0, 1, 1,
0.6212589, -1.275803, 3.618371, 0.5647059, 0, 1, 1,
0.62448, 0.04607825, 0.4222888, 0.572549, 0, 1, 1,
0.6265566, 0.1211642, 2.073896, 0.5764706, 0, 1, 1,
0.6340514, 1.543575, 1.21401, 0.5843138, 0, 1, 1,
0.6363385, -0.4747875, 1.702808, 0.5882353, 0, 1, 1,
0.6421279, -1.682111, 2.399448, 0.5960785, 0, 1, 1,
0.6432541, -1.203862, 1.941445, 0.6039216, 0, 1, 1,
0.6451911, -2.100038, 2.449932, 0.6078432, 0, 1, 1,
0.6485224, -0.1857052, 0.4585907, 0.6156863, 0, 1, 1,
0.6503512, -0.9552404, 3.387872, 0.6196079, 0, 1, 1,
0.6517196, 0.1603204, -0.5756233, 0.627451, 0, 1, 1,
0.652218, 0.2189109, 1.608308, 0.6313726, 0, 1, 1,
0.6613599, 1.725558, 0.529169, 0.6392157, 0, 1, 1,
0.6624917, -1.237884, 2.721575, 0.6431373, 0, 1, 1,
0.663568, 0.4591718, 0.9482993, 0.6509804, 0, 1, 1,
0.6740685, 0.2782339, 1.728415, 0.654902, 0, 1, 1,
0.6771526, 1.957745, -0.6439121, 0.6627451, 0, 1, 1,
0.6809368, -2.081351, 2.908664, 0.6666667, 0, 1, 1,
0.681075, 1.103912, 0.7214833, 0.6745098, 0, 1, 1,
0.6946798, -2.020294, 1.419223, 0.6784314, 0, 1, 1,
0.6984853, 0.1459294, 1.195174, 0.6862745, 0, 1, 1,
0.7018608, 1.071465, 0.9458297, 0.6901961, 0, 1, 1,
0.7031564, 0.6046174, 2.186171, 0.6980392, 0, 1, 1,
0.714232, -0.09765872, 1.444934, 0.7058824, 0, 1, 1,
0.7148503, 1.311326, 1.799452, 0.7098039, 0, 1, 1,
0.7162374, 0.5940792, -0.7897143, 0.7176471, 0, 1, 1,
0.717847, -1.238593, 2.348962, 0.7215686, 0, 1, 1,
0.7185476, -0.9338105, 1.353439, 0.7294118, 0, 1, 1,
0.7214726, 0.9170546, 0.4257848, 0.7333333, 0, 1, 1,
0.7223088, 0.3392024, 1.977298, 0.7411765, 0, 1, 1,
0.7269837, 0.730164, 2.010805, 0.7450981, 0, 1, 1,
0.7324255, 0.3985458, 4.074977, 0.7529412, 0, 1, 1,
0.7327784, 1.257588, -0.9649252, 0.7568628, 0, 1, 1,
0.7360998, 0.9868928, 0.9900852, 0.7647059, 0, 1, 1,
0.7361928, 0.4070005, 1.124347, 0.7686275, 0, 1, 1,
0.7381225, -0.6616083, 0.5227175, 0.7764706, 0, 1, 1,
0.7407791, 1.061853, 0.3281923, 0.7803922, 0, 1, 1,
0.740793, -0.5575815, 1.612725, 0.7882353, 0, 1, 1,
0.7415298, 0.3517791, 1.53947, 0.7921569, 0, 1, 1,
0.7420357, -1.112588, 1.473074, 0.8, 0, 1, 1,
0.7456104, 1.423077, 1.235983, 0.8078431, 0, 1, 1,
0.7491413, -0.2492241, 3.425356, 0.8117647, 0, 1, 1,
0.7496325, -1.561792, 2.224514, 0.8196079, 0, 1, 1,
0.7544589, -1.620869, 2.163706, 0.8235294, 0, 1, 1,
0.7562817, 0.5369013, 2.24526, 0.8313726, 0, 1, 1,
0.7566894, 1.398942, -0.05861324, 0.8352941, 0, 1, 1,
0.7568682, 0.9225449, 2.39761, 0.8431373, 0, 1, 1,
0.770584, -0.8543605, 3.804432, 0.8470588, 0, 1, 1,
0.7733358, -0.2939635, 3.422271, 0.854902, 0, 1, 1,
0.7736186, 0.03759539, 1.929433, 0.8588235, 0, 1, 1,
0.7739219, 1.072688, 1.175943, 0.8666667, 0, 1, 1,
0.7756857, 0.2065688, -0.1561415, 0.8705882, 0, 1, 1,
0.7791874, 0.6697024, 2.022425, 0.8784314, 0, 1, 1,
0.7792764, 0.2158023, 2.663725, 0.8823529, 0, 1, 1,
0.7803015, 0.8449821, 0.4660053, 0.8901961, 0, 1, 1,
0.7811446, -0.06949324, 1.752846, 0.8941177, 0, 1, 1,
0.8042839, 0.3248658, 0.6222318, 0.9019608, 0, 1, 1,
0.8203087, -0.2938031, 0.4031146, 0.9098039, 0, 1, 1,
0.8203773, -0.4909588, -0.7465366, 0.9137255, 0, 1, 1,
0.8220218, 1.083057, 0.8488212, 0.9215686, 0, 1, 1,
0.8253638, 0.6348122, 0.75499, 0.9254902, 0, 1, 1,
0.8313773, 1.444945, 2.169499, 0.9333333, 0, 1, 1,
0.840154, -0.6081222, 3.831716, 0.9372549, 0, 1, 1,
0.8419111, 1.424358, 2.588881, 0.945098, 0, 1, 1,
0.8495719, -0.5411326, 1.476066, 0.9490196, 0, 1, 1,
0.8506473, -0.878176, 2.733356, 0.9568627, 0, 1, 1,
0.8546997, -0.02709534, 3.713612, 0.9607843, 0, 1, 1,
0.8549285, -0.910634, 1.483741, 0.9686275, 0, 1, 1,
0.8552788, -1.36468, 2.94329, 0.972549, 0, 1, 1,
0.8658331, -1.906166, 0.7458484, 0.9803922, 0, 1, 1,
0.8685525, 0.4129984, 3.045905, 0.9843137, 0, 1, 1,
0.8759816, -1.247469, 4.385646, 0.9921569, 0, 1, 1,
0.8860134, -0.3775626, 2.594445, 0.9960784, 0, 1, 1,
0.8873432, -1.017219, 4.684351, 1, 0, 0.9960784, 1,
0.8926085, -0.5934992, 1.732023, 1, 0, 0.9882353, 1,
0.8931643, 1.401628, 1.498418, 1, 0, 0.9843137, 1,
0.8945421, 0.6463856, 1.115066, 1, 0, 0.9764706, 1,
0.8971642, -0.5991394, 3.388937, 1, 0, 0.972549, 1,
0.9057105, -0.2551087, 1.44752, 1, 0, 0.9647059, 1,
0.9107672, 0.4089674, 1.254333, 1, 0, 0.9607843, 1,
0.9114292, -1.07948, 3.803981, 1, 0, 0.9529412, 1,
0.91195, -1.634546, 2.947035, 1, 0, 0.9490196, 1,
0.9124607, -0.9870448, 2.686979, 1, 0, 0.9411765, 1,
0.9261639, -1.493944, 2.268437, 1, 0, 0.9372549, 1,
0.9454236, 0.8754278, -0.2681592, 1, 0, 0.9294118, 1,
0.9481546, 0.8783935, 2.341604, 1, 0, 0.9254902, 1,
0.9550885, 0.1872732, 2.073384, 1, 0, 0.9176471, 1,
0.9558977, -0.8758153, 1.675223, 1, 0, 0.9137255, 1,
0.9660939, -1.56653, 2.093458, 1, 0, 0.9058824, 1,
0.9756577, 0.1638647, 0.5425007, 1, 0, 0.9019608, 1,
0.9771278, -1.545624, 0.8118563, 1, 0, 0.8941177, 1,
0.9942979, -0.9582364, 2.684192, 1, 0, 0.8862745, 1,
0.9948468, 0.3212892, 3.003629, 1, 0, 0.8823529, 1,
1.001221, -0.628327, 2.592023, 1, 0, 0.8745098, 1,
1.012436, -1.02944, 3.46149, 1, 0, 0.8705882, 1,
1.013958, -0.7056566, 2.527557, 1, 0, 0.8627451, 1,
1.015614, -0.920684, 2.612276, 1, 0, 0.8588235, 1,
1.017621, -0.05318235, 2.911734, 1, 0, 0.8509804, 1,
1.024786, 1.5042, -0.629759, 1, 0, 0.8470588, 1,
1.028385, 0.4750471, 2.588562, 1, 0, 0.8392157, 1,
1.034835, 0.4769494, 1.234974, 1, 0, 0.8352941, 1,
1.044282, -0.2456472, 2.385779, 1, 0, 0.827451, 1,
1.046577, -0.7169539, 1.176447, 1, 0, 0.8235294, 1,
1.048208, -0.3737668, 3.867236, 1, 0, 0.8156863, 1,
1.050324, -0.842518, 2.889657, 1, 0, 0.8117647, 1,
1.050976, -0.05638424, 1.508688, 1, 0, 0.8039216, 1,
1.05235, -1.059935, 4.134702, 1, 0, 0.7960784, 1,
1.058629, -1.001272, 2.814869, 1, 0, 0.7921569, 1,
1.063928, -0.8540069, 1.623159, 1, 0, 0.7843137, 1,
1.067313, 1.297526, 1.367655, 1, 0, 0.7803922, 1,
1.067411, 0.8520713, 1.581111, 1, 0, 0.772549, 1,
1.07184, 1.029112, -0.1996833, 1, 0, 0.7686275, 1,
1.079204, -0.1548706, 2.747799, 1, 0, 0.7607843, 1,
1.090685, 0.6245623, 2.028501, 1, 0, 0.7568628, 1,
1.091825, 0.3862088, 1.633283, 1, 0, 0.7490196, 1,
1.099844, -0.7621109, 1.319069, 1, 0, 0.7450981, 1,
1.100679, -0.4126465, 0.6880783, 1, 0, 0.7372549, 1,
1.106405, 0.1174658, 3.912378, 1, 0, 0.7333333, 1,
1.110743, 0.3782718, 3.272212, 1, 0, 0.7254902, 1,
1.111863, 0.04519607, 1.192479, 1, 0, 0.7215686, 1,
1.112078, -0.022918, -0.1126925, 1, 0, 0.7137255, 1,
1.114466, -0.0005303654, 2.005253, 1, 0, 0.7098039, 1,
1.1174, 0.4648976, 0.7764356, 1, 0, 0.7019608, 1,
1.122264, 0.5658134, 1.451858, 1, 0, 0.6941177, 1,
1.123877, -0.2276833, 0.8519326, 1, 0, 0.6901961, 1,
1.126549, -1.453969, 2.780156, 1, 0, 0.682353, 1,
1.129165, 0.3211991, 1.917835, 1, 0, 0.6784314, 1,
1.14948, 0.4214676, 1.469657, 1, 0, 0.6705883, 1,
1.154851, 0.159996, 1.181369, 1, 0, 0.6666667, 1,
1.159402, 0.9379444, 0.7531163, 1, 0, 0.6588235, 1,
1.161278, -0.2111226, 2.261756, 1, 0, 0.654902, 1,
1.196015, -0.02010796, 0.9554561, 1, 0, 0.6470588, 1,
1.19821, -0.02546328, 2.831035, 1, 0, 0.6431373, 1,
1.210848, -0.7784929, 0.8745753, 1, 0, 0.6352941, 1,
1.214674, 0.5579015, 1.838956, 1, 0, 0.6313726, 1,
1.215158, 0.0424, 1.24653, 1, 0, 0.6235294, 1,
1.217427, 0.04295484, 1.337355, 1, 0, 0.6196079, 1,
1.218666, 0.3467265, 0.7676193, 1, 0, 0.6117647, 1,
1.222907, -0.3994707, 2.482851, 1, 0, 0.6078432, 1,
1.22431, 2.032176, 0.2785943, 1, 0, 0.6, 1,
1.233802, -0.1214091, 2.06147, 1, 0, 0.5921569, 1,
1.235602, 0.3648966, 1.720585, 1, 0, 0.5882353, 1,
1.243629, -0.08506113, 1.644608, 1, 0, 0.5803922, 1,
1.246509, 0.4272409, -0.3897773, 1, 0, 0.5764706, 1,
1.247577, 0.2124481, 3.017204, 1, 0, 0.5686275, 1,
1.253286, 0.6281133, 2.003994, 1, 0, 0.5647059, 1,
1.267812, -0.6763306, 3.770248, 1, 0, 0.5568628, 1,
1.273428, -0.1119082, 0.5697957, 1, 0, 0.5529412, 1,
1.273943, 0.6281889, -0.02363434, 1, 0, 0.5450981, 1,
1.274461, -0.6573914, 1.542098, 1, 0, 0.5411765, 1,
1.279382, 0.964467, 0.4265554, 1, 0, 0.5333334, 1,
1.290367, -0.1019741, -0.5278911, 1, 0, 0.5294118, 1,
1.290839, 0.682153, 2.844476, 1, 0, 0.5215687, 1,
1.29308, -1.004467, 2.34439, 1, 0, 0.5176471, 1,
1.295257, -1.938849, 2.151172, 1, 0, 0.509804, 1,
1.308183, 1.137181, 1.413857, 1, 0, 0.5058824, 1,
1.317453, 1.720838, -0.08121388, 1, 0, 0.4980392, 1,
1.320276, 1.020363, 0.7002566, 1, 0, 0.4901961, 1,
1.320978, 0.2930661, 0.3687717, 1, 0, 0.4862745, 1,
1.342798, 0.2473433, 2.101331, 1, 0, 0.4784314, 1,
1.36205, -0.1280129, 1.922319, 1, 0, 0.4745098, 1,
1.362153, -0.06731501, 0.2492453, 1, 0, 0.4666667, 1,
1.36625, -1.013856, 3.620904, 1, 0, 0.4627451, 1,
1.373352, -1.041739, 3.032913, 1, 0, 0.454902, 1,
1.375108, -0.6407225, 0.7521825, 1, 0, 0.4509804, 1,
1.391882, -0.6352659, 2.020994, 1, 0, 0.4431373, 1,
1.392299, 1.251841, 1.52354, 1, 0, 0.4392157, 1,
1.432617, 3.090588, 0.3720968, 1, 0, 0.4313726, 1,
1.445603, 0.2436012, 1.980396, 1, 0, 0.427451, 1,
1.447945, 0.04863099, -0.4490305, 1, 0, 0.4196078, 1,
1.454441, -1.409282, 2.349497, 1, 0, 0.4156863, 1,
1.461096, 0.36221, 2.148737, 1, 0, 0.4078431, 1,
1.462062, -1.528866, 1.275874, 1, 0, 0.4039216, 1,
1.483493, -1.050267, 1.91524, 1, 0, 0.3960784, 1,
1.492319, -0.4822046, 2.944502, 1, 0, 0.3882353, 1,
1.493905, 1.710796, 2.035878, 1, 0, 0.3843137, 1,
1.495495, 0.0205045, 1.468459, 1, 0, 0.3764706, 1,
1.499792, -0.371879, 2.78321, 1, 0, 0.372549, 1,
1.508671, 0.7380521, 2.999737, 1, 0, 0.3647059, 1,
1.519263, -0.9694608, 2.55132, 1, 0, 0.3607843, 1,
1.522497, 0.3920324, 0.8476857, 1, 0, 0.3529412, 1,
1.522552, 0.7737215, 0.7015855, 1, 0, 0.3490196, 1,
1.525438, -0.5608466, 2.337674, 1, 0, 0.3411765, 1,
1.535868, -0.3999736, 0.9121454, 1, 0, 0.3372549, 1,
1.569987, 0.3785971, 2.30801, 1, 0, 0.3294118, 1,
1.57237, -0.1312614, 1.757998, 1, 0, 0.3254902, 1,
1.590806, 0.3683441, 0.2157271, 1, 0, 0.3176471, 1,
1.591555, 2.028406, 1.665792, 1, 0, 0.3137255, 1,
1.606125, -0.4573888, 2.044573, 1, 0, 0.3058824, 1,
1.615164, -0.1469269, 2.637684, 1, 0, 0.2980392, 1,
1.621938, 0.2643052, 1.884149, 1, 0, 0.2941177, 1,
1.648405, 0.631392, 1.032404, 1, 0, 0.2862745, 1,
1.678605, -0.8461764, 2.808611, 1, 0, 0.282353, 1,
1.684727, -0.5049374, 2.221116, 1, 0, 0.2745098, 1,
1.699047, 0.7767027, 0.7843076, 1, 0, 0.2705882, 1,
1.707066, -0.01335052, 1.427216, 1, 0, 0.2627451, 1,
1.707481, -0.6243408, 1.291144, 1, 0, 0.2588235, 1,
1.710576, -1.6747, 2.635384, 1, 0, 0.2509804, 1,
1.732899, -0.00265269, 0.3498518, 1, 0, 0.2470588, 1,
1.73559, 0.6834345, 1.622099, 1, 0, 0.2392157, 1,
1.740384, -0.6015915, 1.957382, 1, 0, 0.2352941, 1,
1.74481, 0.6944306, 2.478985, 1, 0, 0.227451, 1,
1.75448, 0.2243058, 1.760828, 1, 0, 0.2235294, 1,
1.763574, 0.3803718, 1.218801, 1, 0, 0.2156863, 1,
1.783771, 0.1022165, 1.751702, 1, 0, 0.2117647, 1,
1.785342, 0.2340737, 1.610183, 1, 0, 0.2039216, 1,
1.792813, 0.4370023, 1.388846, 1, 0, 0.1960784, 1,
1.823427, -0.6859983, 1.648378, 1, 0, 0.1921569, 1,
1.825761, -1.062672, 2.512252, 1, 0, 0.1843137, 1,
1.829023, -0.1085808, 0.0531906, 1, 0, 0.1803922, 1,
1.844473, 1.063414, 1.213578, 1, 0, 0.172549, 1,
1.869642, 0.6992809, 1.421987, 1, 0, 0.1686275, 1,
1.886509, -0.5462811, 4.148513, 1, 0, 0.1607843, 1,
1.899483, 1.369115, 1.062736, 1, 0, 0.1568628, 1,
1.902394, 0.1885585, 2.006542, 1, 0, 0.1490196, 1,
1.913881, -0.7840873, 0.9889571, 1, 0, 0.145098, 1,
1.91726, 0.8539354, 0.4285815, 1, 0, 0.1372549, 1,
1.919694, -2.171895, 4.79544, 1, 0, 0.1333333, 1,
1.923975, 0.0751375, 1.374019, 1, 0, 0.1254902, 1,
1.954265, -0.3531634, 2.811668, 1, 0, 0.1215686, 1,
1.983383, 0.4665098, 1.357903, 1, 0, 0.1137255, 1,
1.990793, 0.3576583, 0.5528379, 1, 0, 0.1098039, 1,
2.014205, 3.221787, -1.512328, 1, 0, 0.1019608, 1,
2.021293, -0.6550244, 0.8752054, 1, 0, 0.09411765, 1,
2.084529, -0.677219, 1.282412, 1, 0, 0.09019608, 1,
2.090416, 0.6146032, 1.735203, 1, 0, 0.08235294, 1,
2.092036, 0.1227373, 2.09366, 1, 0, 0.07843138, 1,
2.137019, -0.5543525, 0.7962804, 1, 0, 0.07058824, 1,
2.185416, 0.6329342, 1.016053, 1, 0, 0.06666667, 1,
2.21291, 2.427034, 1.195447, 1, 0, 0.05882353, 1,
2.243108, 0.3158634, 1.74938, 1, 0, 0.05490196, 1,
2.285933, 0.4300073, 0.5726172, 1, 0, 0.04705882, 1,
2.39509, 0.4223011, 1.887567, 1, 0, 0.04313726, 1,
2.465739, -0.4327247, 2.453517, 1, 0, 0.03529412, 1,
2.49649, 0.3575823, 1.299682, 1, 0, 0.03137255, 1,
2.525733, -1.594715, 1.518575, 1, 0, 0.02352941, 1,
2.57835, -2.182225, 1.888981, 1, 0, 0.01960784, 1,
2.827633, 1.687908, 0.2728714, 1, 0, 0.01176471, 1,
2.923675, -0.7511606, 2.485922, 1, 0, 0.007843138, 1
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
-0.2705432, -4.258858, -6.991716, 0, -0.5, 0.5, 0.5,
-0.2705432, -4.258858, -6.991716, 1, -0.5, 0.5, 0.5,
-0.2705432, -4.258858, -6.991716, 1, 1.5, 0.5, 0.5,
-0.2705432, -4.258858, -6.991716, 0, 1.5, 0.5, 0.5
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
-4.547601, 0.2638265, -6.991716, 0, -0.5, 0.5, 0.5,
-4.547601, 0.2638265, -6.991716, 1, -0.5, 0.5, 0.5,
-4.547601, 0.2638265, -6.991716, 1, 1.5, 0.5, 0.5,
-4.547601, 0.2638265, -6.991716, 0, 1.5, 0.5, 0.5
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
-4.547601, -4.258858, 0.2277217, 0, -0.5, 0.5, 0.5,
-4.547601, -4.258858, 0.2277217, 1, -0.5, 0.5, 0.5,
-4.547601, -4.258858, 0.2277217, 1, 1.5, 0.5, 0.5,
-4.547601, -4.258858, 0.2277217, 0, 1.5, 0.5, 0.5
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
-3, -3.215162, -5.325692,
2, -3.215162, -5.325692,
-3, -3.215162, -5.325692,
-3, -3.389111, -5.603363,
-2, -3.215162, -5.325692,
-2, -3.389111, -5.603363,
-1, -3.215162, -5.325692,
-1, -3.389111, -5.603363,
0, -3.215162, -5.325692,
0, -3.389111, -5.603363,
1, -3.215162, -5.325692,
1, -3.389111, -5.603363,
2, -3.215162, -5.325692,
2, -3.389111, -5.603363
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
-3, -3.73701, -6.158704, 0, -0.5, 0.5, 0.5,
-3, -3.73701, -6.158704, 1, -0.5, 0.5, 0.5,
-3, -3.73701, -6.158704, 1, 1.5, 0.5, 0.5,
-3, -3.73701, -6.158704, 0, 1.5, 0.5, 0.5,
-2, -3.73701, -6.158704, 0, -0.5, 0.5, 0.5,
-2, -3.73701, -6.158704, 1, -0.5, 0.5, 0.5,
-2, -3.73701, -6.158704, 1, 1.5, 0.5, 0.5,
-2, -3.73701, -6.158704, 0, 1.5, 0.5, 0.5,
-1, -3.73701, -6.158704, 0, -0.5, 0.5, 0.5,
-1, -3.73701, -6.158704, 1, -0.5, 0.5, 0.5,
-1, -3.73701, -6.158704, 1, 1.5, 0.5, 0.5,
-1, -3.73701, -6.158704, 0, 1.5, 0.5, 0.5,
0, -3.73701, -6.158704, 0, -0.5, 0.5, 0.5,
0, -3.73701, -6.158704, 1, -0.5, 0.5, 0.5,
0, -3.73701, -6.158704, 1, 1.5, 0.5, 0.5,
0, -3.73701, -6.158704, 0, 1.5, 0.5, 0.5,
1, -3.73701, -6.158704, 0, -0.5, 0.5, 0.5,
1, -3.73701, -6.158704, 1, -0.5, 0.5, 0.5,
1, -3.73701, -6.158704, 1, 1.5, 0.5, 0.5,
1, -3.73701, -6.158704, 0, 1.5, 0.5, 0.5,
2, -3.73701, -6.158704, 0, -0.5, 0.5, 0.5,
2, -3.73701, -6.158704, 1, -0.5, 0.5, 0.5,
2, -3.73701, -6.158704, 1, 1.5, 0.5, 0.5,
2, -3.73701, -6.158704, 0, 1.5, 0.5, 0.5
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
-3.560588, -3, -5.325692,
-3.560588, 3, -5.325692,
-3.560588, -3, -5.325692,
-3.72509, -3, -5.603363,
-3.560588, -2, -5.325692,
-3.72509, -2, -5.603363,
-3.560588, -1, -5.325692,
-3.72509, -1, -5.603363,
-3.560588, 0, -5.325692,
-3.72509, 0, -5.603363,
-3.560588, 1, -5.325692,
-3.72509, 1, -5.603363,
-3.560588, 2, -5.325692,
-3.72509, 2, -5.603363,
-3.560588, 3, -5.325692,
-3.72509, 3, -5.603363
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
-4.054094, -3, -6.158704, 0, -0.5, 0.5, 0.5,
-4.054094, -3, -6.158704, 1, -0.5, 0.5, 0.5,
-4.054094, -3, -6.158704, 1, 1.5, 0.5, 0.5,
-4.054094, -3, -6.158704, 0, 1.5, 0.5, 0.5,
-4.054094, -2, -6.158704, 0, -0.5, 0.5, 0.5,
-4.054094, -2, -6.158704, 1, -0.5, 0.5, 0.5,
-4.054094, -2, -6.158704, 1, 1.5, 0.5, 0.5,
-4.054094, -2, -6.158704, 0, 1.5, 0.5, 0.5,
-4.054094, -1, -6.158704, 0, -0.5, 0.5, 0.5,
-4.054094, -1, -6.158704, 1, -0.5, 0.5, 0.5,
-4.054094, -1, -6.158704, 1, 1.5, 0.5, 0.5,
-4.054094, -1, -6.158704, 0, 1.5, 0.5, 0.5,
-4.054094, 0, -6.158704, 0, -0.5, 0.5, 0.5,
-4.054094, 0, -6.158704, 1, -0.5, 0.5, 0.5,
-4.054094, 0, -6.158704, 1, 1.5, 0.5, 0.5,
-4.054094, 0, -6.158704, 0, 1.5, 0.5, 0.5,
-4.054094, 1, -6.158704, 0, -0.5, 0.5, 0.5,
-4.054094, 1, -6.158704, 1, -0.5, 0.5, 0.5,
-4.054094, 1, -6.158704, 1, 1.5, 0.5, 0.5,
-4.054094, 1, -6.158704, 0, 1.5, 0.5, 0.5,
-4.054094, 2, -6.158704, 0, -0.5, 0.5, 0.5,
-4.054094, 2, -6.158704, 1, -0.5, 0.5, 0.5,
-4.054094, 2, -6.158704, 1, 1.5, 0.5, 0.5,
-4.054094, 2, -6.158704, 0, 1.5, 0.5, 0.5,
-4.054094, 3, -6.158704, 0, -0.5, 0.5, 0.5,
-4.054094, 3, -6.158704, 1, -0.5, 0.5, 0.5,
-4.054094, 3, -6.158704, 1, 1.5, 0.5, 0.5,
-4.054094, 3, -6.158704, 0, 1.5, 0.5, 0.5
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
-3.560588, -3.215162, -4,
-3.560588, -3.215162, 4,
-3.560588, -3.215162, -4,
-3.72509, -3.389111, -4,
-3.560588, -3.215162, -2,
-3.72509, -3.389111, -2,
-3.560588, -3.215162, 0,
-3.72509, -3.389111, 0,
-3.560588, -3.215162, 2,
-3.72509, -3.389111, 2,
-3.560588, -3.215162, 4,
-3.72509, -3.389111, 4
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
-4.054094, -3.73701, -4, 0, -0.5, 0.5, 0.5,
-4.054094, -3.73701, -4, 1, -0.5, 0.5, 0.5,
-4.054094, -3.73701, -4, 1, 1.5, 0.5, 0.5,
-4.054094, -3.73701, -4, 0, 1.5, 0.5, 0.5,
-4.054094, -3.73701, -2, 0, -0.5, 0.5, 0.5,
-4.054094, -3.73701, -2, 1, -0.5, 0.5, 0.5,
-4.054094, -3.73701, -2, 1, 1.5, 0.5, 0.5,
-4.054094, -3.73701, -2, 0, 1.5, 0.5, 0.5,
-4.054094, -3.73701, 0, 0, -0.5, 0.5, 0.5,
-4.054094, -3.73701, 0, 1, -0.5, 0.5, 0.5,
-4.054094, -3.73701, 0, 1, 1.5, 0.5, 0.5,
-4.054094, -3.73701, 0, 0, 1.5, 0.5, 0.5,
-4.054094, -3.73701, 2, 0, -0.5, 0.5, 0.5,
-4.054094, -3.73701, 2, 1, -0.5, 0.5, 0.5,
-4.054094, -3.73701, 2, 1, 1.5, 0.5, 0.5,
-4.054094, -3.73701, 2, 0, 1.5, 0.5, 0.5,
-4.054094, -3.73701, 4, 0, -0.5, 0.5, 0.5,
-4.054094, -3.73701, 4, 1, -0.5, 0.5, 0.5,
-4.054094, -3.73701, 4, 1, 1.5, 0.5, 0.5,
-4.054094, -3.73701, 4, 0, 1.5, 0.5, 0.5
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
-3.560588, -3.215162, -5.325692,
-3.560588, 3.742815, -5.325692,
-3.560588, -3.215162, 5.781135,
-3.560588, 3.742815, 5.781135,
-3.560588, -3.215162, -5.325692,
-3.560588, -3.215162, 5.781135,
-3.560588, 3.742815, -5.325692,
-3.560588, 3.742815, 5.781135,
-3.560588, -3.215162, -5.325692,
3.019501, -3.215162, -5.325692,
-3.560588, -3.215162, 5.781135,
3.019501, -3.215162, 5.781135,
-3.560588, 3.742815, -5.325692,
3.019501, 3.742815, -5.325692,
-3.560588, 3.742815, 5.781135,
3.019501, 3.742815, 5.781135,
3.019501, -3.215162, -5.325692,
3.019501, 3.742815, -5.325692,
3.019501, -3.215162, 5.781135,
3.019501, 3.742815, 5.781135,
3.019501, -3.215162, -5.325692,
3.019501, -3.215162, 5.781135,
3.019501, 3.742815, -5.325692,
3.019501, 3.742815, 5.781135
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
var radius = 7.831014;
var distance = 34.84106;
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
mvMatrix.translate( 0.2705432, -0.2638265, -0.2277217 );
mvMatrix.scale( 1.286768, 1.216883, 0.7623281 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.84106);
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
crufomate<-read.table("crufomate.xyz")
```

```
## Error in read.table("crufomate.xyz"): no lines available in input
```

```r
x<-crufomate$V2
```

```
## Error in eval(expr, envir, enclos): object 'crufomate' not found
```

```r
y<-crufomate$V3
```

```
## Error in eval(expr, envir, enclos): object 'crufomate' not found
```

```r
z<-crufomate$V4
```

```
## Error in eval(expr, envir, enclos): object 'crufomate' not found
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
-3.464761, 1.75842, -2.188745, 0, 0, 1, 1, 1,
-2.990411, -0.4258301, -2.352816, 1, 0, 0, 1, 1,
-2.908825, -0.2431838, -0.277196, 1, 0, 0, 1, 1,
-2.740031, -0.7266129, -1.457979, 1, 0, 0, 1, 1,
-2.693898, 0.8648359, -1.630889, 1, 0, 0, 1, 1,
-2.547546, 0.1314067, -2.442611, 1, 0, 0, 1, 1,
-2.385598, 0.4216127, -2.314931, 0, 0, 0, 1, 1,
-2.372118, 1.676882, -1.495084, 0, 0, 0, 1, 1,
-2.313556, -1.490548, -2.080155, 0, 0, 0, 1, 1,
-2.305374, -0.4356383, -2.425829, 0, 0, 0, 1, 1,
-2.230664, 0.1168863, 0.04022721, 0, 0, 0, 1, 1,
-2.217276, -0.4669071, -2.724204, 0, 0, 0, 1, 1,
-2.165519, -0.5528896, -2.194651, 0, 0, 0, 1, 1,
-2.149497, -0.446333, -2.436516, 1, 1, 1, 1, 1,
-2.103093, -0.8053963, -3.248693, 1, 1, 1, 1, 1,
-2.047333, -0.03755277, -1.236728, 1, 1, 1, 1, 1,
-2.032913, -0.9852244, -2.046782, 1, 1, 1, 1, 1,
-1.976801, -0.3565098, -0.9116384, 1, 1, 1, 1, 1,
-1.932042, 0.9068393, -1.545611, 1, 1, 1, 1, 1,
-1.923217, -1.567959, -2.753641, 1, 1, 1, 1, 1,
-1.918181, -0.3520992, -0.543712, 1, 1, 1, 1, 1,
-1.916995, 0.6732137, -1.329669, 1, 1, 1, 1, 1,
-1.87003, 0.1803097, -1.905002, 1, 1, 1, 1, 1,
-1.865151, 0.917601, -1.566415, 1, 1, 1, 1, 1,
-1.862177, 0.1330499, -1.324533, 1, 1, 1, 1, 1,
-1.851695, 0.8845207, -0.03862082, 1, 1, 1, 1, 1,
-1.827276, -2.049608, -2.582101, 1, 1, 1, 1, 1,
-1.800856, -0.1328315, -0.261472, 1, 1, 1, 1, 1,
-1.785293, 0.4404972, -2.308453, 0, 0, 1, 1, 1,
-1.784283, -1.183056, -2.123548, 1, 0, 0, 1, 1,
-1.781963, 1.255146, -1.066882, 1, 0, 0, 1, 1,
-1.78074, -0.1010178, -1.688305, 1, 0, 0, 1, 1,
-1.779939, 0.7716328, -0.4328711, 1, 0, 0, 1, 1,
-1.748931, -1.253438, -2.110395, 1, 0, 0, 1, 1,
-1.748921, -0.609337, -0.1889944, 0, 0, 0, 1, 1,
-1.748023, -1.49195, -2.934938, 0, 0, 0, 1, 1,
-1.744354, 0.9388635, -2.077709, 0, 0, 0, 1, 1,
-1.703116, 1.018655, 0.176331, 0, 0, 0, 1, 1,
-1.673, -1.28545, -3.235567, 0, 0, 0, 1, 1,
-1.667907, -1.177542, -0.9937771, 0, 0, 0, 1, 1,
-1.663577, 1.499092, -1.076355, 0, 0, 0, 1, 1,
-1.66066, 0.001774727, -1.514635, 1, 1, 1, 1, 1,
-1.658922, 0.4585916, -2.254438, 1, 1, 1, 1, 1,
-1.650034, 0.9149967, -0.1294395, 1, 1, 1, 1, 1,
-1.635326, 0.4840115, -0.8815872, 1, 1, 1, 1, 1,
-1.63516, -0.7615057, -3.200071, 1, 1, 1, 1, 1,
-1.633571, 0.5745854, -2.142977, 1, 1, 1, 1, 1,
-1.627805, 0.1850281, -1.194146, 1, 1, 1, 1, 1,
-1.614956, -0.1686384, -1.100635, 1, 1, 1, 1, 1,
-1.607138, 1.700343, -0.9391069, 1, 1, 1, 1, 1,
-1.601887, 0.2055663, -1.544009, 1, 1, 1, 1, 1,
-1.600869, 0.01138188, -1.299631, 1, 1, 1, 1, 1,
-1.60018, -0.0989961, -1.237462, 1, 1, 1, 1, 1,
-1.594044, 1.77998, -0.4891785, 1, 1, 1, 1, 1,
-1.584236, -0.6139715, -0.9170696, 1, 1, 1, 1, 1,
-1.583707, 0.2880314, -0.7425984, 1, 1, 1, 1, 1,
-1.57938, -0.4573317, -3.156917, 0, 0, 1, 1, 1,
-1.579354, 0.5515045, -1.834209, 1, 0, 0, 1, 1,
-1.566672, 0.7959923, -2.310536, 1, 0, 0, 1, 1,
-1.562145, 1.082562, -1.33754, 1, 0, 0, 1, 1,
-1.551326, -0.2603411, -1.310248, 1, 0, 0, 1, 1,
-1.547254, 0.02835692, -2.026252, 1, 0, 0, 1, 1,
-1.54258, 0.9505009, 0.409448, 0, 0, 0, 1, 1,
-1.534385, 1.237707, -1.54288, 0, 0, 0, 1, 1,
-1.524977, -0.8577356, -2.839071, 0, 0, 0, 1, 1,
-1.517789, 0.5934893, -1.363761, 0, 0, 0, 1, 1,
-1.517092, -1.405074, -1.224436, 0, 0, 0, 1, 1,
-1.507152, -1.795704, -3.752725, 0, 0, 0, 1, 1,
-1.504219, -0.7154242, -2.855924, 0, 0, 0, 1, 1,
-1.50089, -0.1842593, -2.734485, 1, 1, 1, 1, 1,
-1.474601, 1.233878, -1.745276, 1, 1, 1, 1, 1,
-1.469164, -0.3619065, -1.043068, 1, 1, 1, 1, 1,
-1.452654, -0.8951762, -0.4346426, 1, 1, 1, 1, 1,
-1.451803, 0.9248743, -1.220685, 1, 1, 1, 1, 1,
-1.445785, -0.2778634, -0.8261776, 1, 1, 1, 1, 1,
-1.443496, 0.2054719, -1.830138, 1, 1, 1, 1, 1,
-1.441485, 3.641485, 0.1895711, 1, 1, 1, 1, 1,
-1.435901, 1.472388, -0.5162595, 1, 1, 1, 1, 1,
-1.432187, -0.418124, -0.1429704, 1, 1, 1, 1, 1,
-1.429479, 0.9496874, -2.145058, 1, 1, 1, 1, 1,
-1.428992, -0.2487203, -1.486301, 1, 1, 1, 1, 1,
-1.426342, -0.4773874, -1.756106, 1, 1, 1, 1, 1,
-1.406761, -0.9789088, -3.751722, 1, 1, 1, 1, 1,
-1.398498, 0.9289837, -0.277446, 1, 1, 1, 1, 1,
-1.398299, -0.58189, -0.7223305, 0, 0, 1, 1, 1,
-1.396745, -0.590619, -1.265054, 1, 0, 0, 1, 1,
-1.395777, -0.7279942, -2.401406, 1, 0, 0, 1, 1,
-1.395186, -0.171668, -4.021303, 1, 0, 0, 1, 1,
-1.386827, 0.6831166, 1.917098, 1, 0, 0, 1, 1,
-1.373524, -1.09426, -1.874838, 1, 0, 0, 1, 1,
-1.371329, 0.3766796, -2.18195, 0, 0, 0, 1, 1,
-1.361832, -0.9358567, -2.084235, 0, 0, 0, 1, 1,
-1.336984, -1.285143, -2.231395, 0, 0, 0, 1, 1,
-1.324587, -0.6967992, -2.87249, 0, 0, 0, 1, 1,
-1.32346, -0.8442109, -4.191482, 0, 0, 0, 1, 1,
-1.322437, -0.2353732, -0.5841994, 0, 0, 0, 1, 1,
-1.317234, 0.2537095, -0.3307725, 0, 0, 0, 1, 1,
-1.308635, 0.2749227, -1.611695, 1, 1, 1, 1, 1,
-1.304443, 1.349658, -0.4422421, 1, 1, 1, 1, 1,
-1.301472, -1.431561, -2.495789, 1, 1, 1, 1, 1,
-1.301077, -0.06794575, -1.018825, 1, 1, 1, 1, 1,
-1.295103, 1.672149, 0.3367478, 1, 1, 1, 1, 1,
-1.295098, 1.34179, 0.3753542, 1, 1, 1, 1, 1,
-1.294098, 0.5643369, -1.847171, 1, 1, 1, 1, 1,
-1.285142, 0.4975021, -1.732782, 1, 1, 1, 1, 1,
-1.277756, 1.299718, 0.6457598, 1, 1, 1, 1, 1,
-1.266942, 0.2522107, -1.550729, 1, 1, 1, 1, 1,
-1.266851, 1.448078, -1.984297, 1, 1, 1, 1, 1,
-1.266454, -0.7321467, -1.928454, 1, 1, 1, 1, 1,
-1.262418, 0.5935416, -0.8100498, 1, 1, 1, 1, 1,
-1.259131, 1.616511, -1.001763, 1, 1, 1, 1, 1,
-1.249326, 1.441864, -1.737685, 1, 1, 1, 1, 1,
-1.24634, -0.9093665, -0.8487347, 0, 0, 1, 1, 1,
-1.241077, -0.009327427, -0.5991597, 1, 0, 0, 1, 1,
-1.238262, 1.465012, -0.6185283, 1, 0, 0, 1, 1,
-1.23698, 1.420716, -1.977324, 1, 0, 0, 1, 1,
-1.23685, -1.144199, -3.57379, 1, 0, 0, 1, 1,
-1.227651, -0.462341, -0.5513756, 1, 0, 0, 1, 1,
-1.224005, -1.229679, -2.418385, 0, 0, 0, 1, 1,
-1.223409, 0.7888352, -0.6735184, 0, 0, 0, 1, 1,
-1.211911, 1.382424, -1.817232, 0, 0, 0, 1, 1,
-1.211476, -0.5565166, -2.209006, 0, 0, 0, 1, 1,
-1.205376, 1.598688, -1.372117, 0, 0, 0, 1, 1,
-1.203125, -0.3788407, -0.278918, 0, 0, 0, 1, 1,
-1.197549, 0.7443937, -0.4527732, 0, 0, 0, 1, 1,
-1.196919, 1.755498, -0.6530586, 1, 1, 1, 1, 1,
-1.196134, -1.148638, -2.495634, 1, 1, 1, 1, 1,
-1.194745, 1.140642, -1.723374, 1, 1, 1, 1, 1,
-1.190379, 0.4909751, -2.885886, 1, 1, 1, 1, 1,
-1.184981, 1.447219, -0.8258486, 1, 1, 1, 1, 1,
-1.184486, -1.540109, -2.158768, 1, 1, 1, 1, 1,
-1.180993, -0.527193, -1.619062, 1, 1, 1, 1, 1,
-1.175065, 0.4367854, -2.0327, 1, 1, 1, 1, 1,
-1.159668, 0.2051362, -1.202396, 1, 1, 1, 1, 1,
-1.157847, -0.8864176, -2.240544, 1, 1, 1, 1, 1,
-1.156671, 0.3689227, -0.572398, 1, 1, 1, 1, 1,
-1.155907, -0.1483165, -1.733801, 1, 1, 1, 1, 1,
-1.154251, 1.041517, -2.813832, 1, 1, 1, 1, 1,
-1.152774, -0.6765599, -0.2971654, 1, 1, 1, 1, 1,
-1.151788, 0.2055552, -1.887065, 1, 1, 1, 1, 1,
-1.14778, 0.490412, -1.964343, 0, 0, 1, 1, 1,
-1.143979, -0.5249592, -1.577738, 1, 0, 0, 1, 1,
-1.143706, 0.6416567, -0.388969, 1, 0, 0, 1, 1,
-1.142535, 0.4182566, -1.702505, 1, 0, 0, 1, 1,
-1.138728, -2.095027, -3.461271, 1, 0, 0, 1, 1,
-1.13212, -1.460813, -3.191762, 1, 0, 0, 1, 1,
-1.131321, -0.7029355, -2.04447, 0, 0, 0, 1, 1,
-1.124959, 0.04809358, -0.7573345, 0, 0, 0, 1, 1,
-1.121881, 2.143121, -0.5797121, 0, 0, 0, 1, 1,
-1.120947, -0.2861372, -2.13327, 0, 0, 0, 1, 1,
-1.11278, 0.08858284, -2.146666, 0, 0, 0, 1, 1,
-1.110363, -0.8865916, -2.660997, 0, 0, 0, 1, 1,
-1.104665, 0.8670372, -1.667683, 0, 0, 0, 1, 1,
-1.101742, 0.5813878, -1.741253, 1, 1, 1, 1, 1,
-1.095477, 0.1837933, -0.817864, 1, 1, 1, 1, 1,
-1.09436, 0.6680675, -0.1263217, 1, 1, 1, 1, 1,
-1.093373, 0.2273045, -1.633464, 1, 1, 1, 1, 1,
-1.091341, -0.4981818, -2.506908, 1, 1, 1, 1, 1,
-1.091084, -0.675416, -2.895995, 1, 1, 1, 1, 1,
-1.08741, 0.01614503, -3.021791, 1, 1, 1, 1, 1,
-1.082395, 1.189313, 0.3652157, 1, 1, 1, 1, 1,
-1.075846, -0.04073872, -0.6592007, 1, 1, 1, 1, 1,
-1.056987, 0.2451546, -1.630494, 1, 1, 1, 1, 1,
-1.052647, 0.2547951, -0.5727035, 1, 1, 1, 1, 1,
-1.049521, 0.2765571, -0.8703017, 1, 1, 1, 1, 1,
-1.046087, -0.6037522, -0.1285753, 1, 1, 1, 1, 1,
-1.035518, -0.9710636, -2.073247, 1, 1, 1, 1, 1,
-1.020125, 0.4945597, -1.95575, 1, 1, 1, 1, 1,
-1.018712, -0.9467487, -3.110581, 0, 0, 1, 1, 1,
-1.014124, 1.067171, -0.5970616, 1, 0, 0, 1, 1,
-1.011037, 1.125616, -1.319597, 1, 0, 0, 1, 1,
-1.006991, -0.9913573, -2.270732, 1, 0, 0, 1, 1,
-0.9964075, 1.627588, -0.94496, 1, 0, 0, 1, 1,
-0.9938747, 0.07740248, -1.007527, 1, 0, 0, 1, 1,
-0.9917376, 0.1568209, -0.4371276, 0, 0, 0, 1, 1,
-0.9894406, -0.3961494, -3.37215, 0, 0, 0, 1, 1,
-0.9825292, 1.194812, -2.129695, 0, 0, 0, 1, 1,
-0.9804665, -0.09751809, -3.028509, 0, 0, 0, 1, 1,
-0.9771741, -0.8869261, -1.674089, 0, 0, 0, 1, 1,
-0.9655449, 0.0919632, 0.1253888, 0, 0, 0, 1, 1,
-0.9629359, 0.5276605, -1.234391, 0, 0, 0, 1, 1,
-0.9611633, -1.211219, -1.960445, 1, 1, 1, 1, 1,
-0.9549733, 0.8518565, -0.5185845, 1, 1, 1, 1, 1,
-0.9486375, -0.6971042, -1.350989, 1, 1, 1, 1, 1,
-0.9447167, -0.5188086, -3.20435, 1, 1, 1, 1, 1,
-0.9419529, 0.6656868, -1.520193, 1, 1, 1, 1, 1,
-0.9380484, -0.1130106, -3.789587, 1, 1, 1, 1, 1,
-0.9369205, 1.096632, -0.6910406, 1, 1, 1, 1, 1,
-0.9286805, 0.4085014, -3.068869, 1, 1, 1, 1, 1,
-0.9255259, 0.0379919, -1.366221, 1, 1, 1, 1, 1,
-0.9207026, -0.3037264, -2.061945, 1, 1, 1, 1, 1,
-0.9181144, 1.091243, -2.390858, 1, 1, 1, 1, 1,
-0.9116278, 0.356675, -0.5265371, 1, 1, 1, 1, 1,
-0.9079951, -1.328362, -3.988178, 1, 1, 1, 1, 1,
-0.90674, 0.6211076, -0.3207853, 1, 1, 1, 1, 1,
-0.904684, 1.078688, -0.1793692, 1, 1, 1, 1, 1,
-0.9025221, 0.6050271, -2.54631, 0, 0, 1, 1, 1,
-0.9019699, -1.846657, -2.429211, 1, 0, 0, 1, 1,
-0.8985868, 1.165149, -1.946444, 1, 0, 0, 1, 1,
-0.8933326, -0.4786976, -2.647334, 1, 0, 0, 1, 1,
-0.8924759, 1.766997, 0.8244768, 1, 0, 0, 1, 1,
-0.889595, -1.336741, -2.480592, 1, 0, 0, 1, 1,
-0.8869892, 0.9358608, -0.228358, 0, 0, 0, 1, 1,
-0.8865387, 1.209036, -0.1565627, 0, 0, 0, 1, 1,
-0.8835641, 1.926871, 0.9834371, 0, 0, 0, 1, 1,
-0.883091, -2.556534, -2.279872, 0, 0, 0, 1, 1,
-0.877353, 1.236142, 0.2916892, 0, 0, 0, 1, 1,
-0.8755034, 1.279973, -0.5829289, 0, 0, 0, 1, 1,
-0.8723707, 1.405874, -0.8812711, 0, 0, 0, 1, 1,
-0.868919, -0.8040771, -1.537006, 1, 1, 1, 1, 1,
-0.8680751, -0.2945984, -2.076599, 1, 1, 1, 1, 1,
-0.8574659, 0.1887053, -3.876918, 1, 1, 1, 1, 1,
-0.8570367, -0.6715621, -1.326023, 1, 1, 1, 1, 1,
-0.8548885, -1.069107, -3.141731, 1, 1, 1, 1, 1,
-0.8511852, -0.06920683, -2.647596, 1, 1, 1, 1, 1,
-0.8504999, -1.654501, -2.441747, 1, 1, 1, 1, 1,
-0.8452005, -0.4023337, -1.464218, 1, 1, 1, 1, 1,
-0.8444304, -0.4264236, -4.688867, 1, 1, 1, 1, 1,
-0.8440243, 1.999093, 0.4190585, 1, 1, 1, 1, 1,
-0.8433805, -0.2767919, -1.965223, 1, 1, 1, 1, 1,
-0.8411562, 0.8391292, 0.4588849, 1, 1, 1, 1, 1,
-0.8390414, 0.1227572, -1.824173, 1, 1, 1, 1, 1,
-0.8367997, 1.058831, 0.1717356, 1, 1, 1, 1, 1,
-0.8314387, -0.1377469, -2.263315, 1, 1, 1, 1, 1,
-0.8298388, 0.8107437, -0.944272, 0, 0, 1, 1, 1,
-0.8267231, -0.6481445, -1.875834, 1, 0, 0, 1, 1,
-0.8237703, 0.3100992, -0.5209432, 1, 0, 0, 1, 1,
-0.8226622, 0.483093, -2.191395, 1, 0, 0, 1, 1,
-0.8210689, -0.9562737, -3.400942, 1, 0, 0, 1, 1,
-0.8182434, -0.6415245, -1.728696, 1, 0, 0, 1, 1,
-0.8152451, -1.696297, -1.800547, 0, 0, 0, 1, 1,
-0.8150176, -0.5123217, -1.488058, 0, 0, 0, 1, 1,
-0.8121938, 0.2282266, -0.9356863, 0, 0, 0, 1, 1,
-0.803596, 1.336483, 0.004278163, 0, 0, 0, 1, 1,
-0.8025389, 1.751497, 0.7414663, 0, 0, 0, 1, 1,
-0.8003295, 1.792704, -0.02529198, 0, 0, 0, 1, 1,
-0.7960652, 0.719511, -0.458592, 0, 0, 0, 1, 1,
-0.793561, -0.5729576, -1.936832, 1, 1, 1, 1, 1,
-0.7923758, 0.8247929, -1.522018, 1, 1, 1, 1, 1,
-0.7909819, -0.1635599, -0.05300841, 1, 1, 1, 1, 1,
-0.7774965, 0.3592598, -0.9313644, 1, 1, 1, 1, 1,
-0.7731357, -1.718206, -4.184067, 1, 1, 1, 1, 1,
-0.7715107, 0.4807013, -1.083475, 1, 1, 1, 1, 1,
-0.7660153, 0.2175715, 0.1872748, 1, 1, 1, 1, 1,
-0.761215, -0.5437638, -3.694582, 1, 1, 1, 1, 1,
-0.7583327, -0.4259028, -0.2275228, 1, 1, 1, 1, 1,
-0.758047, -0.132839, -1.990048, 1, 1, 1, 1, 1,
-0.7541047, 0.1883765, -0.3970172, 1, 1, 1, 1, 1,
-0.7533303, 2.018093, -1.211623, 1, 1, 1, 1, 1,
-0.7526807, 0.7945684, -0.5331148, 1, 1, 1, 1, 1,
-0.7492564, -0.4903416, -2.053071, 1, 1, 1, 1, 1,
-0.7451007, -1.199641, -2.482514, 1, 1, 1, 1, 1,
-0.7382711, 0.8021196, -1.670793, 0, 0, 1, 1, 1,
-0.7374652, -0.7136751, -1.347449, 1, 0, 0, 1, 1,
-0.7370207, -0.6134587, -2.286019, 1, 0, 0, 1, 1,
-0.7328934, 1.06945, -0.8800365, 1, 0, 0, 1, 1,
-0.7327002, 0.2182226, -1.304589, 1, 0, 0, 1, 1,
-0.732677, -0.3221385, -1.74815, 1, 0, 0, 1, 1,
-0.7293895, 1.649067, -0.672404, 0, 0, 0, 1, 1,
-0.7236857, -0.8428313, -1.027393, 0, 0, 0, 1, 1,
-0.7234024, -0.4320496, -1.251555, 0, 0, 0, 1, 1,
-0.7203134, 0.3990675, -0.3737083, 0, 0, 0, 1, 1,
-0.7197419, 1.540051, 1.155328, 0, 0, 0, 1, 1,
-0.7077621, 0.7619442, -0.9894361, 0, 0, 0, 1, 1,
-0.7050855, -0.8670952, -1.62225, 0, 0, 0, 1, 1,
-0.7031236, -1.279595, -1.325076, 1, 1, 1, 1, 1,
-0.7027668, 0.6022707, -1.417008, 1, 1, 1, 1, 1,
-0.7016381, 0.1162907, -2.385215, 1, 1, 1, 1, 1,
-0.6942478, -0.4092462, -2.649449, 1, 1, 1, 1, 1,
-0.691691, -0.09624633, -1.222127, 1, 1, 1, 1, 1,
-0.6903206, -0.9922869, -2.647495, 1, 1, 1, 1, 1,
-0.690079, 0.2348418, -0.1849372, 1, 1, 1, 1, 1,
-0.6881415, 0.06256489, -1.64184, 1, 1, 1, 1, 1,
-0.6819215, 0.3064315, -1.699078, 1, 1, 1, 1, 1,
-0.679524, 1.327551, -0.7519419, 1, 1, 1, 1, 1,
-0.6773259, 0.4034111, -1.037548, 1, 1, 1, 1, 1,
-0.6745145, -0.2457735, -1.328104, 1, 1, 1, 1, 1,
-0.6719978, 1.542717, 0.1216394, 1, 1, 1, 1, 1,
-0.6706397, -1.887505, -3.055037, 1, 1, 1, 1, 1,
-0.6705981, 0.7084908, -1.710537, 1, 1, 1, 1, 1,
-0.6686476, -0.1930697, -1.090552, 0, 0, 1, 1, 1,
-0.6596871, -1.674184, -1.844631, 1, 0, 0, 1, 1,
-0.6576682, -0.3565807, -1.171869, 1, 0, 0, 1, 1,
-0.6565081, -0.3153192, -4.608612, 1, 0, 0, 1, 1,
-0.6557576, -0.355045, -1.926608, 1, 0, 0, 1, 1,
-0.6525709, 2.333832, 0.0963591, 1, 0, 0, 1, 1,
-0.6517646, 0.2606215, -2.274747, 0, 0, 0, 1, 1,
-0.6477223, -0.6808817, -5.163942, 0, 0, 0, 1, 1,
-0.6398873, -0.5654204, -2.047396, 0, 0, 0, 1, 1,
-0.6396244, -0.5415025, -3.316388, 0, 0, 0, 1, 1,
-0.6297764, -0.8323013, -1.034305, 0, 0, 0, 1, 1,
-0.6264115, 1.376379, -0.780915, 0, 0, 0, 1, 1,
-0.6247647, 1.132737, 0.4753371, 0, 0, 0, 1, 1,
-0.6246018, 0.8082993, -0.6027429, 1, 1, 1, 1, 1,
-0.6192788, -0.9011788, -3.686806, 1, 1, 1, 1, 1,
-0.6124935, 0.3245224, -1.004738, 1, 1, 1, 1, 1,
-0.6095099, 0.6892162, 0.9641278, 1, 1, 1, 1, 1,
-0.6081149, 0.3510784, -0.02514588, 1, 1, 1, 1, 1,
-0.6051776, 0.7211179, -1.316927, 1, 1, 1, 1, 1,
-0.6036896, -1.051485, -2.840677, 1, 1, 1, 1, 1,
-0.5981229, -0.4145233, -3.489671, 1, 1, 1, 1, 1,
-0.5956507, 0.3732202, 0.305447, 1, 1, 1, 1, 1,
-0.594925, -1.311269, -2.679813, 1, 1, 1, 1, 1,
-0.5879035, -1.566635, -2.372765, 1, 1, 1, 1, 1,
-0.5869175, -0.601303, -3.150822, 1, 1, 1, 1, 1,
-0.5858237, 0.1304276, -0.9137435, 1, 1, 1, 1, 1,
-0.579894, -0.001791097, -1.651868, 1, 1, 1, 1, 1,
-0.5782561, 1.417863, 0.1966648, 1, 1, 1, 1, 1,
-0.5744768, 1.563094, 0.2268268, 0, 0, 1, 1, 1,
-0.562009, 0.1530553, -0.6578941, 1, 0, 0, 1, 1,
-0.5619627, 1.485541, -1.627609, 1, 0, 0, 1, 1,
-0.5614428, -0.1727334, -2.070469, 1, 0, 0, 1, 1,
-0.556623, 1.484532, -1.733604, 1, 0, 0, 1, 1,
-0.555624, 0.9308271, -0.7006972, 1, 0, 0, 1, 1,
-0.5555885, 3.009286, -0.7734156, 0, 0, 0, 1, 1,
-0.5539751, -1.563323, -3.992905, 0, 0, 0, 1, 1,
-0.5532201, -0.2135431, -1.087807, 0, 0, 0, 1, 1,
-0.5474256, -0.7029842, -3.550346, 0, 0, 0, 1, 1,
-0.544102, -1.538052, -3.781351, 0, 0, 0, 1, 1,
-0.5414793, -0.1028927, -0.00598524, 0, 0, 0, 1, 1,
-0.5414209, 0.3593662, -1.767917, 0, 0, 0, 1, 1,
-0.5315571, 1.6544, -1.361083, 1, 1, 1, 1, 1,
-0.5295874, -1.382184, -2.264681, 1, 1, 1, 1, 1,
-0.5281313, 0.0990668, -1.284522, 1, 1, 1, 1, 1,
-0.5192378, -0.2660171, -0.5441844, 1, 1, 1, 1, 1,
-0.5171319, -0.8915085, -1.133598, 1, 1, 1, 1, 1,
-0.5145717, 1.128244, -1.074908, 1, 1, 1, 1, 1,
-0.5139019, -0.7434612, -2.258166, 1, 1, 1, 1, 1,
-0.5133384, -0.6223238, -3.252301, 1, 1, 1, 1, 1,
-0.5127934, 1.029294, -0.08231043, 1, 1, 1, 1, 1,
-0.5123103, 0.1026796, -2.036698, 1, 1, 1, 1, 1,
-0.5084001, -0.9213791, -1.791792, 1, 1, 1, 1, 1,
-0.5069884, 2.717507, 0.1608297, 1, 1, 1, 1, 1,
-0.5063214, 1.980395, 1.408738, 1, 1, 1, 1, 1,
-0.5031027, 0.5450351, -1.370898, 1, 1, 1, 1, 1,
-0.5024922, 0.02025818, -0.7280121, 1, 1, 1, 1, 1,
-0.4982821, 1.720104, 0.7928366, 0, 0, 1, 1, 1,
-0.4955282, 2.78179, -0.08090631, 1, 0, 0, 1, 1,
-0.4909795, -0.5732613, -4.855369, 1, 0, 0, 1, 1,
-0.4882812, 0.2891573, -1.800291, 1, 0, 0, 1, 1,
-0.4881569, -1.333395, -2.792869, 1, 0, 0, 1, 1,
-0.4811027, 1.103132, -0.2552043, 1, 0, 0, 1, 1,
-0.4773787, 0.4896002, -0.06313385, 0, 0, 0, 1, 1,
-0.4745885, 0.311681, -1.923106, 0, 0, 0, 1, 1,
-0.4735449, -0.107427, -2.08082, 0, 0, 0, 1, 1,
-0.4705969, -0.4502473, -2.461044, 0, 0, 0, 1, 1,
-0.4704565, -0.08704505, -1.165947, 0, 0, 0, 1, 1,
-0.4681039, -0.1869298, -3.647807, 0, 0, 0, 1, 1,
-0.464005, 1.217829, 0.4989091, 0, 0, 0, 1, 1,
-0.4615403, 0.1328071, -0.8990076, 1, 1, 1, 1, 1,
-0.457821, 1.49729, -0.1846113, 1, 1, 1, 1, 1,
-0.4564984, -0.8051802, -2.782929, 1, 1, 1, 1, 1,
-0.4489016, -0.7265807, -3.63297, 1, 1, 1, 1, 1,
-0.446647, 0.4345142, -2.585319, 1, 1, 1, 1, 1,
-0.4442279, -1.534398, -3.510856, 1, 1, 1, 1, 1,
-0.4402479, 0.6697561, -2.008566, 1, 1, 1, 1, 1,
-0.4385303, -2.2203, -1.050834, 1, 1, 1, 1, 1,
-0.428362, 1.794223, -0.2676157, 1, 1, 1, 1, 1,
-0.4225569, -1.127077, -1.07129, 1, 1, 1, 1, 1,
-0.4220893, 0.4467961, -0.7744982, 1, 1, 1, 1, 1,
-0.4217281, -0.9264239, -1.359648, 1, 1, 1, 1, 1,
-0.4215288, 0.9173632, -0.5899424, 1, 1, 1, 1, 1,
-0.4213914, -1.265231, -3.165436, 1, 1, 1, 1, 1,
-0.4203648, 0.0707709, -3.342199, 1, 1, 1, 1, 1,
-0.4203043, -1.020859, -3.561426, 0, 0, 1, 1, 1,
-0.4193701, -0.8124437, -1.936363, 1, 0, 0, 1, 1,
-0.4188353, -0.1603242, -2.798926, 1, 0, 0, 1, 1,
-0.4179865, -0.8107027, -2.486662, 1, 0, 0, 1, 1,
-0.4178667, 0.8898422, -0.7315722, 1, 0, 0, 1, 1,
-0.4050416, 0.2328553, -1.577575, 1, 0, 0, 1, 1,
-0.4029627, -0.9331256, -0.828627, 0, 0, 0, 1, 1,
-0.3994788, -0.7231746, -4.663076, 0, 0, 0, 1, 1,
-0.3940676, 1.973627, -0.1436899, 0, 0, 0, 1, 1,
-0.3790984, -0.3736669, -2.290191, 0, 0, 0, 1, 1,
-0.3765574, 1.966377, -1.758638, 0, 0, 0, 1, 1,
-0.3742009, -2.51784, -3.150017, 0, 0, 0, 1, 1,
-0.3731162, -0.9448805, -3.50928, 0, 0, 0, 1, 1,
-0.3729225, 1.43997, -1.280423, 1, 1, 1, 1, 1,
-0.3705958, 1.132208, -1.947695, 1, 1, 1, 1, 1,
-0.3691135, 0.8477405, -1.058245, 1, 1, 1, 1, 1,
-0.3686626, 0.4624177, -1.180401, 1, 1, 1, 1, 1,
-0.3603446, -0.5816548, -1.929688, 1, 1, 1, 1, 1,
-0.359343, -0.07324319, -1.170757, 1, 1, 1, 1, 1,
-0.3590069, 0.8087317, 1.056512, 1, 1, 1, 1, 1,
-0.3571413, -0.575215, -2.368865, 1, 1, 1, 1, 1,
-0.3569818, 0.8580285, 1.153918, 1, 1, 1, 1, 1,
-0.3540585, 2.042176, -0.1455377, 1, 1, 1, 1, 1,
-0.3510906, 1.89491, 0.9609599, 1, 1, 1, 1, 1,
-0.3507173, 0.6415796, -1.077188, 1, 1, 1, 1, 1,
-0.3494895, 0.8381497, 1.442306, 1, 1, 1, 1, 1,
-0.349423, 1.087586, -0.5081123, 1, 1, 1, 1, 1,
-0.3488175, -1.063952, -3.356197, 1, 1, 1, 1, 1,
-0.34468, 0.07022128, -1.460507, 0, 0, 1, 1, 1,
-0.3412826, 0.8542522, 0.5340807, 1, 0, 0, 1, 1,
-0.341178, -1.301884, -2.736435, 1, 0, 0, 1, 1,
-0.3399294, 2.680954, -1.220805, 1, 0, 0, 1, 1,
-0.3330403, -1.461111, -3.844633, 1, 0, 0, 1, 1,
-0.3306877, 0.4418428, -0.3775262, 1, 0, 0, 1, 1,
-0.328541, 1.911116, -0.07339184, 0, 0, 0, 1, 1,
-0.3268864, -0.1105244, -2.340602, 0, 0, 0, 1, 1,
-0.3252583, 0.308579, 0.9381802, 0, 0, 0, 1, 1,
-0.3236433, 0.3047211, -0.8115268, 0, 0, 0, 1, 1,
-0.3201912, -0.8110228, -4.090954, 0, 0, 0, 1, 1,
-0.3189729, 2.308661, 1.361221, 0, 0, 0, 1, 1,
-0.3160257, -1.07571, -3.239972, 0, 0, 0, 1, 1,
-0.3157631, 0.4329982, -2.119228, 1, 1, 1, 1, 1,
-0.3149269, 0.4129544, -1.094104, 1, 1, 1, 1, 1,
-0.3129995, -0.3819766, -3.084491, 1, 1, 1, 1, 1,
-0.3125628, 1.939313, -0.6101571, 1, 1, 1, 1, 1,
-0.3096891, 1.922887, 0.3199964, 1, 1, 1, 1, 1,
-0.3065791, -0.6538882, -3.105015, 1, 1, 1, 1, 1,
-0.3062244, -0.2837447, -3.751079, 1, 1, 1, 1, 1,
-0.3058777, -0.6598511, -1.791583, 1, 1, 1, 1, 1,
-0.3044021, -0.4647832, -0.8691881, 1, 1, 1, 1, 1,
-0.2919388, 0.0009019004, -1.302883, 1, 1, 1, 1, 1,
-0.2885759, 0.4100417, -1.351482, 1, 1, 1, 1, 1,
-0.2867937, 1.280782, -1.937004, 1, 1, 1, 1, 1,
-0.2851284, -0.7727203, -2.651198, 1, 1, 1, 1, 1,
-0.2772696, -0.5984119, -3.53347, 1, 1, 1, 1, 1,
-0.276711, 0.649143, -0.7763615, 1, 1, 1, 1, 1,
-0.2689429, -0.5492216, -2.158799, 0, 0, 1, 1, 1,
-0.2685935, -0.9014862, -3.099106, 1, 0, 0, 1, 1,
-0.2669625, -0.7816523, -1.26278, 1, 0, 0, 1, 1,
-0.2640801, 0.1967389, -1.076671, 1, 0, 0, 1, 1,
-0.2623085, 0.7934114, -1.065868, 1, 0, 0, 1, 1,
-0.2578701, -0.1502594, -1.333582, 1, 0, 0, 1, 1,
-0.2549283, -0.1997283, -3.105858, 0, 0, 0, 1, 1,
-0.2508025, 0.3377533, -1.0352, 0, 0, 0, 1, 1,
-0.2507092, 0.6614273, 0.1214344, 0, 0, 0, 1, 1,
-0.2505963, -1.126194, -2.804906, 0, 0, 0, 1, 1,
-0.2493225, 0.1325103, -3.701613, 0, 0, 0, 1, 1,
-0.2438402, -2.759822, -2.200019, 0, 0, 0, 1, 1,
-0.2407658, -0.07721487, -1.651161, 0, 0, 0, 1, 1,
-0.2366459, 0.3054773, -0.1426261, 1, 1, 1, 1, 1,
-0.2341782, -0.7611639, -2.884586, 1, 1, 1, 1, 1,
-0.2334471, 0.3234608, -0.889248, 1, 1, 1, 1, 1,
-0.2329124, 0.8054947, -1.146636, 1, 1, 1, 1, 1,
-0.2309357, 1.993449, 0.04966461, 1, 1, 1, 1, 1,
-0.2278761, -1.121382, -2.504785, 1, 1, 1, 1, 1,
-0.2216436, -0.9947554, -3.210649, 1, 1, 1, 1, 1,
-0.2207879, -1.150008, -4.516915, 1, 1, 1, 1, 1,
-0.2206426, -0.8575724, -1.971143, 1, 1, 1, 1, 1,
-0.2133889, 1.410749, -0.1538201, 1, 1, 1, 1, 1,
-0.2116035, -2.821463, -4.41724, 1, 1, 1, 1, 1,
-0.2111055, -0.0685765, 0.7018352, 1, 1, 1, 1, 1,
-0.2033188, -0.01295603, -2.00551, 1, 1, 1, 1, 1,
-0.20265, -0.9197797, -2.714841, 1, 1, 1, 1, 1,
-0.1994377, 0.02601525, -1.823586, 1, 1, 1, 1, 1,
-0.1930644, -0.02104683, -1.775836, 0, 0, 1, 1, 1,
-0.1899277, -1.876823, -2.305148, 1, 0, 0, 1, 1,
-0.1898232, 1.706995, -0.1100813, 1, 0, 0, 1, 1,
-0.1851011, -1.002493, -4.576081, 1, 0, 0, 1, 1,
-0.1781208, -0.1443197, 1.051007, 1, 0, 0, 1, 1,
-0.1758124, -0.9869846, -2.983195, 1, 0, 0, 1, 1,
-0.1740963, 0.3412382, 0.104981, 0, 0, 0, 1, 1,
-0.171949, -0.5095352, -3.292127, 0, 0, 0, 1, 1,
-0.1714057, 0.3424854, 0.8012376, 0, 0, 0, 1, 1,
-0.1688542, 0.7313652, 0.6672542, 0, 0, 0, 1, 1,
-0.1648497, -0.5670162, -2.592865, 0, 0, 0, 1, 1,
-0.1633111, -1.03505, -1.350428, 0, 0, 0, 1, 1,
-0.160338, 0.3460459, -0.4599365, 0, 0, 0, 1, 1,
-0.1584312, -0.1983622, -2.089466, 1, 1, 1, 1, 1,
-0.1544969, -1.391664, -4.29166, 1, 1, 1, 1, 1,
-0.1524746, -0.9343262, -1.165809, 1, 1, 1, 1, 1,
-0.1522915, 1.434872, -0.9345727, 1, 1, 1, 1, 1,
-0.1520478, -0.5394717, -2.451131, 1, 1, 1, 1, 1,
-0.1483841, -0.2843196, -2.017153, 1, 1, 1, 1, 1,
-0.146572, -1.796651, -3.64685, 1, 1, 1, 1, 1,
-0.1439815, -0.2344598, -1.900452, 1, 1, 1, 1, 1,
-0.1426092, -1.374633, -2.382626, 1, 1, 1, 1, 1,
-0.1370765, 1.176744, -0.0905607, 1, 1, 1, 1, 1,
-0.1364998, 1.008029, 0.404787, 1, 1, 1, 1, 1,
-0.1329102, 1.26491, 0.5231908, 1, 1, 1, 1, 1,
-0.1308296, -1.255665, -4.193773, 1, 1, 1, 1, 1,
-0.1251965, -0.2684044, -0.7085974, 1, 1, 1, 1, 1,
-0.1239309, -0.3919368, -1.977848, 1, 1, 1, 1, 1,
-0.1217281, -0.4579581, -3.061092, 0, 0, 1, 1, 1,
-0.1213465, 0.2823128, 0.348891, 1, 0, 0, 1, 1,
-0.1210785, 0.5932131, -1.622108, 1, 0, 0, 1, 1,
-0.1187988, 0.418334, -0.07147805, 1, 0, 0, 1, 1,
-0.1173909, 0.1233274, -1.382955, 1, 0, 0, 1, 1,
-0.1169884, -1.087899, -1.494254, 1, 0, 0, 1, 1,
-0.1154392, -0.08921704, -2.193946, 0, 0, 0, 1, 1,
-0.1153018, -0.9562657, -2.023979, 0, 0, 0, 1, 1,
-0.1139639, 0.3478618, 0.3088166, 0, 0, 0, 1, 1,
-0.1137054, 0.5419261, 0.4933336, 0, 0, 0, 1, 1,
-0.1132446, 0.1933069, -0.6024368, 0, 0, 0, 1, 1,
-0.1121912, 0.5967655, -0.8540882, 0, 0, 0, 1, 1,
-0.1084606, -1.071623, -3.383025, 0, 0, 0, 1, 1,
-0.1070006, -0.4083202, -3.753289, 1, 1, 1, 1, 1,
-0.1067131, 0.5781032, -0.200288, 1, 1, 1, 1, 1,
-0.1008345, 0.6251956, 0.281384, 1, 1, 1, 1, 1,
-0.1006474, -0.5524044, -2.607476, 1, 1, 1, 1, 1,
-0.09816355, 1.043288, -1.091592, 1, 1, 1, 1, 1,
-0.08679404, -0.08126254, -1.551127, 1, 1, 1, 1, 1,
-0.082532, 1.4256, 0.09611397, 1, 1, 1, 1, 1,
-0.08110639, -0.2378611, -3.023605, 1, 1, 1, 1, 1,
-0.07676557, -0.6349096, -3.114582, 1, 1, 1, 1, 1,
-0.07673134, 0.4106298, 0.3216066, 1, 1, 1, 1, 1,
-0.07582177, -0.8726078, -3.628821, 1, 1, 1, 1, 1,
-0.07148162, 2.318402, 1.763322, 1, 1, 1, 1, 1,
-0.0656687, 0.2956489, -1.398068, 1, 1, 1, 1, 1,
-0.0608567, -0.531041, -2.334976, 1, 1, 1, 1, 1,
-0.0604934, -1.350582, -2.685527, 1, 1, 1, 1, 1,
-0.05979856, 0.7735946, 0.2772482, 0, 0, 1, 1, 1,
-0.05384982, 0.6033715, -0.7769399, 1, 0, 0, 1, 1,
-0.0505954, -0.01425094, -1.742106, 1, 0, 0, 1, 1,
-0.04806744, 0.7391658, -2.25627, 1, 0, 0, 1, 1,
-0.04547403, -0.7862509, -3.172685, 1, 0, 0, 1, 1,
-0.03510296, -0.3254795, -4.175148, 1, 0, 0, 1, 1,
-0.03490925, 0.1607648, -0.5050065, 0, 0, 0, 1, 1,
-0.02940206, -0.461581, -1.029555, 0, 0, 0, 1, 1,
-0.027476, 0.1383283, -0.3828203, 0, 0, 0, 1, 1,
-0.02682304, -0.4016829, -2.448654, 0, 0, 0, 1, 1,
-0.02505522, -2.20603, -4.079672, 0, 0, 0, 1, 1,
-0.0248574, 0.9782805, 1.528289, 0, 0, 0, 1, 1,
-0.02427728, -0.6018522, -4.017295, 0, 0, 0, 1, 1,
-0.02172366, -0.3175666, -1.198996, 1, 1, 1, 1, 1,
-0.02120815, 0.1250006, -0.5215178, 1, 1, 1, 1, 1,
-0.01518013, -1.685734, -2.672269, 1, 1, 1, 1, 1,
-0.0100565, 1.288525, 1.450718, 1, 1, 1, 1, 1,
-0.00926383, 0.1455768, -0.6252779, 1, 1, 1, 1, 1,
-0.008924897, -0.707303, -1.992068, 1, 1, 1, 1, 1,
-0.001398886, 0.1694032, 0.3542349, 1, 1, 1, 1, 1,
-0.0005460138, -1.684421, -1.795572, 1, 1, 1, 1, 1,
0.004671944, -1.058405, 4.073199, 1, 1, 1, 1, 1,
0.006955227, 0.934013, -0.1098996, 1, 1, 1, 1, 1,
0.01034152, 1.59128, -0.1076756, 1, 1, 1, 1, 1,
0.01111115, 0.3817133, -0.3744636, 1, 1, 1, 1, 1,
0.01151504, -0.6729657, 1.960316, 1, 1, 1, 1, 1,
0.01165417, 1.241214, 0.4656913, 1, 1, 1, 1, 1,
0.01381424, -0.7684368, 3.406816, 1, 1, 1, 1, 1,
0.01706205, -1.316212, 3.321838, 0, 0, 1, 1, 1,
0.01715698, -1.296324, 3.013829, 1, 0, 0, 1, 1,
0.01828237, -1.511464, 3.462203, 1, 0, 0, 1, 1,
0.0185062, 0.1314631, -1.623399, 1, 0, 0, 1, 1,
0.01943703, 0.6386996, 0.4078343, 1, 0, 0, 1, 1,
0.02249032, 0.1625278, 3.110559, 1, 0, 0, 1, 1,
0.03297859, -0.6880406, 4.089665, 0, 0, 0, 1, 1,
0.03307144, -0.8487165, 3.075641, 0, 0, 0, 1, 1,
0.03366566, -0.7725388, 1.063065, 0, 0, 0, 1, 1,
0.03942851, 0.01164577, 1.362064, 0, 0, 0, 1, 1,
0.04020262, 0.2910741, -0.7577058, 0, 0, 0, 1, 1,
0.04382497, 0.6999927, 0.07991616, 0, 0, 0, 1, 1,
0.04653239, -1.962919, 2.968631, 0, 0, 0, 1, 1,
0.04749891, 0.820734, 1.080057, 1, 1, 1, 1, 1,
0.04862874, -1.600881, 3.351411, 1, 1, 1, 1, 1,
0.0488339, -1.376857, 2.132137, 1, 1, 1, 1, 1,
0.05027214, 0.7191285, 0.7293283, 1, 1, 1, 1, 1,
0.05183273, -1.144558, 3.337284, 1, 1, 1, 1, 1,
0.05197055, -0.5872843, 3.334642, 1, 1, 1, 1, 1,
0.0556864, 0.9463991, 2.22036, 1, 1, 1, 1, 1,
0.05871801, -0.7863038, 2.087695, 1, 1, 1, 1, 1,
0.05890676, -0.2709456, 1.854812, 1, 1, 1, 1, 1,
0.06144955, 0.3038032, 1.255028, 1, 1, 1, 1, 1,
0.06779686, -1.503593, 3.714865, 1, 1, 1, 1, 1,
0.06981875, 0.6794123, 1.794713, 1, 1, 1, 1, 1,
0.07087242, -0.8208546, 2.268772, 1, 1, 1, 1, 1,
0.07111537, -1.684371, 4.283761, 1, 1, 1, 1, 1,
0.07432389, 0.384647, -0.01138465, 1, 1, 1, 1, 1,
0.07705282, -1.344382, 2.420533, 0, 0, 1, 1, 1,
0.08040327, -0.3250933, 1.738462, 1, 0, 0, 1, 1,
0.08662928, 0.2152296, 0.5358992, 1, 0, 0, 1, 1,
0.09021436, 0.3552442, 0.5991356, 1, 0, 0, 1, 1,
0.09371957, 1.246698, -0.22868, 1, 0, 0, 1, 1,
0.09598576, -0.791123, 3.730572, 1, 0, 0, 1, 1,
0.09929244, 1.86767, -0.7051889, 0, 0, 0, 1, 1,
0.1047327, 0.4070842, 0.3574197, 0, 0, 0, 1, 1,
0.106091, 0.920277, 0.08299286, 0, 0, 0, 1, 1,
0.1086245, -0.7622021, 2.971759, 0, 0, 0, 1, 1,
0.1107728, 0.06519117, -0.2182796, 0, 0, 0, 1, 1,
0.1111809, -1.307226, 3.219501, 0, 0, 0, 1, 1,
0.1117528, 0.280151, 0.2578254, 0, 0, 0, 1, 1,
0.1184755, -0.5400244, 2.610255, 1, 1, 1, 1, 1,
0.1189715, 0.2269135, -0.4119076, 1, 1, 1, 1, 1,
0.1215786, -0.4649906, 1.62984, 1, 1, 1, 1, 1,
0.1237289, -0.7700412, 3.724599, 1, 1, 1, 1, 1,
0.1246951, -0.8048115, 2.551565, 1, 1, 1, 1, 1,
0.1285746, 0.9942636, 0.9533101, 1, 1, 1, 1, 1,
0.1309841, -0.1174362, 1.246951, 1, 1, 1, 1, 1,
0.1310935, 0.01161288, 1.647427, 1, 1, 1, 1, 1,
0.1319756, 0.3334881, 1.169898, 1, 1, 1, 1, 1,
0.133692, 0.7370281, -0.1723293, 1, 1, 1, 1, 1,
0.134352, -0.8344247, 1.367174, 1, 1, 1, 1, 1,
0.134919, -2.586574, 2.879788, 1, 1, 1, 1, 1,
0.1350895, 1.198036, -1.721571, 1, 1, 1, 1, 1,
0.135451, -0.9288588, 1.046852, 1, 1, 1, 1, 1,
0.135518, -0.5683866, 3.177422, 1, 1, 1, 1, 1,
0.140494, 0.01993764, 1.809566, 0, 0, 1, 1, 1,
0.1407841, -1.022402, 3.318628, 1, 0, 0, 1, 1,
0.1408918, -0.9055038, 3.637013, 1, 0, 0, 1, 1,
0.1410459, -2.094478, 2.770049, 1, 0, 0, 1, 1,
0.142625, -0.812944, 5.314455, 1, 0, 0, 1, 1,
0.1432457, -0.39481, 1.546656, 1, 0, 0, 1, 1,
0.1435281, -0.01698535, 1.973565, 0, 0, 0, 1, 1,
0.1436846, 0.6575779, 0.1283959, 0, 0, 0, 1, 1,
0.1502625, -1.392267, 3.229875, 0, 0, 0, 1, 1,
0.1509577, -2.041894, 3.715561, 0, 0, 0, 1, 1,
0.1543796, -1.192088, 1.956154, 0, 0, 0, 1, 1,
0.1550928, 0.1996635, 0.7205727, 0, 0, 0, 1, 1,
0.1567866, -1.136431, 2.973411, 0, 0, 0, 1, 1,
0.1593016, 0.517643, 0.4216349, 1, 1, 1, 1, 1,
0.16141, -0.7786413, 1.917551, 1, 1, 1, 1, 1,
0.1621489, -3.092182, 3.672157, 1, 1, 1, 1, 1,
0.1632484, -0.8024292, 0.7537109, 1, 1, 1, 1, 1,
0.1633782, -0.548036, 0.8590936, 1, 1, 1, 1, 1,
0.1647104, 0.6233069, 1.784524, 1, 1, 1, 1, 1,
0.1680082, 0.9780503, 0.4615089, 1, 1, 1, 1, 1,
0.1685562, -0.511187, 2.578134, 1, 1, 1, 1, 1,
0.1690231, 0.1823411, 2.565846, 1, 1, 1, 1, 1,
0.1709444, 1.879887, -1.110701, 1, 1, 1, 1, 1,
0.173757, -0.03557537, 1.025869, 1, 1, 1, 1, 1,
0.1745937, -0.5852873, 3.003647, 1, 1, 1, 1, 1,
0.1755958, 0.2896353, 0.8282364, 1, 1, 1, 1, 1,
0.1798324, -1.876917, 0.4590167, 1, 1, 1, 1, 1,
0.1887565, -1.286359, 2.877724, 1, 1, 1, 1, 1,
0.1899443, 0.0009122476, 1.067644, 0, 0, 1, 1, 1,
0.1913749, -1.341586, 2.944587, 1, 0, 0, 1, 1,
0.1921437, 1.898155, 2.565154, 1, 0, 0, 1, 1,
0.1957576, -1.220095, 2.448458, 1, 0, 0, 1, 1,
0.1961549, 0.5298032, 0.2280741, 1, 0, 0, 1, 1,
0.1992369, -0.637454, 2.941514, 1, 0, 0, 1, 1,
0.202044, 0.5215788, -0.9107392, 0, 0, 0, 1, 1,
0.2035718, -0.3953885, 3.041038, 0, 0, 0, 1, 1,
0.204999, -1.2311, 3.011294, 0, 0, 0, 1, 1,
0.2096679, -1.386203, 2.630826, 0, 0, 0, 1, 1,
0.2133533, 1.526131, 0.692606, 0, 0, 0, 1, 1,
0.2142891, -0.1866941, 2.878653, 0, 0, 0, 1, 1,
0.2175789, 0.5841233, -0.7691596, 0, 0, 0, 1, 1,
0.2274876, 1.578971, 1.199113, 1, 1, 1, 1, 1,
0.2283954, 0.2614487, -0.09838157, 1, 1, 1, 1, 1,
0.2304407, 1.453613, 0.01537006, 1, 1, 1, 1, 1,
0.238467, -1.20601, 2.61486, 1, 1, 1, 1, 1,
0.2394657, 1.816041, 0.7063549, 1, 1, 1, 1, 1,
0.2444893, -0.4782102, 2.045998, 1, 1, 1, 1, 1,
0.2461549, 0.3756869, -0.3578874, 1, 1, 1, 1, 1,
0.2481795, -3.113832, 5.619385, 1, 1, 1, 1, 1,
0.2487585, -0.7187239, 5.094602, 1, 1, 1, 1, 1,
0.2506493, -0.3925334, 2.744388, 1, 1, 1, 1, 1,
0.2541148, -0.6033794, 3.283791, 1, 1, 1, 1, 1,
0.2542286, 0.02474547, 1.229518, 1, 1, 1, 1, 1,
0.2575122, 1.378766, 1.277387, 1, 1, 1, 1, 1,
0.260293, -0.5029982, 1.465249, 1, 1, 1, 1, 1,
0.2606623, -0.3388273, 2.547392, 1, 1, 1, 1, 1,
0.2656676, -0.8025537, 3.789212, 0, 0, 1, 1, 1,
0.2675852, 0.1667352, 0.4240248, 1, 0, 0, 1, 1,
0.2744336, -2.529588, 2.980327, 1, 0, 0, 1, 1,
0.2746186, -0.7169684, 2.108783, 1, 0, 0, 1, 1,
0.2840298, 0.06215437, 1.649364, 1, 0, 0, 1, 1,
0.2912724, -0.5654747, 3.285982, 1, 0, 0, 1, 1,
0.2918052, -0.1984489, 1.65611, 0, 0, 0, 1, 1,
0.2933073, -0.6048065, 3.442513, 0, 0, 0, 1, 1,
0.2952234, 1.245541, 0.1254537, 0, 0, 0, 1, 1,
0.2963868, 1.512532, 0.5862752, 0, 0, 0, 1, 1,
0.2972053, -0.04163036, 0.8190089, 0, 0, 0, 1, 1,
0.299044, 1.930725, 1.975817, 0, 0, 0, 1, 1,
0.3010016, -0.02714603, 2.668744, 0, 0, 0, 1, 1,
0.3057953, -0.409757, 4.819454, 1, 1, 1, 1, 1,
0.3065583, -0.2895324, 2.538131, 1, 1, 1, 1, 1,
0.3102558, -0.2940892, 1.944495, 1, 1, 1, 1, 1,
0.3120502, 1.194416, 1.58203, 1, 1, 1, 1, 1,
0.3303576, 0.5714063, 0.9229252, 1, 1, 1, 1, 1,
0.3339718, 2.015877, -2.299453, 1, 1, 1, 1, 1,
0.3364021, -0.3866726, 2.933298, 1, 1, 1, 1, 1,
0.3394251, -0.6620396, 3.09763, 1, 1, 1, 1, 1,
0.3397487, -0.04032464, 3.412632, 1, 1, 1, 1, 1,
0.3430379, -0.1725725, 1.550609, 1, 1, 1, 1, 1,
0.3441973, 0.3415373, 1.974044, 1, 1, 1, 1, 1,
0.3451781, -0.3168546, 2.972377, 1, 1, 1, 1, 1,
0.3453648, 0.04857157, 2.156558, 1, 1, 1, 1, 1,
0.3483407, -0.7740509, 1.798071, 1, 1, 1, 1, 1,
0.3602632, 0.02952918, 1.707594, 1, 1, 1, 1, 1,
0.3660999, 0.08822645, -1.117574, 0, 0, 1, 1, 1,
0.3680787, 1.201466, -0.2697673, 1, 0, 0, 1, 1,
0.3700501, 0.6557553, 1.163156, 1, 0, 0, 1, 1,
0.370733, 1.144392, 2.994068, 1, 0, 0, 1, 1,
0.3717182, -1.081339, 2.034729, 1, 0, 0, 1, 1,
0.3718047, 0.05066668, 2.269416, 1, 0, 0, 1, 1,
0.3765577, -0.002474171, 2.324733, 0, 0, 0, 1, 1,
0.3839241, -0.770063, 2.183482, 0, 0, 0, 1, 1,
0.3848411, -1.235555, 2.252611, 0, 0, 0, 1, 1,
0.3890628, 0.5520186, 0.9523139, 0, 0, 0, 1, 1,
0.3951067, -0.9797842, 1.870948, 0, 0, 0, 1, 1,
0.3962363, -0.9372197, 3.930393, 0, 0, 0, 1, 1,
0.3985407, 2.116854, 1.153761, 0, 0, 0, 1, 1,
0.401935, 1.130144, 0.4183315, 1, 1, 1, 1, 1,
0.4026396, 0.1751304, 0.1598093, 1, 1, 1, 1, 1,
0.4092833, 0.7782812, 1.66224, 1, 1, 1, 1, 1,
0.4099545, 1.558291, 2.474688, 1, 1, 1, 1, 1,
0.4111975, 0.175816, 1.814579, 1, 1, 1, 1, 1,
0.4114036, -0.4816032, 2.017276, 1, 1, 1, 1, 1,
0.4191363, 2.540859, 0.3531218, 1, 1, 1, 1, 1,
0.4203301, 0.3635363, 1.072752, 1, 1, 1, 1, 1,
0.4208294, -1.103352, 4.64142, 1, 1, 1, 1, 1,
0.4237842, -0.3876306, 3.120291, 1, 1, 1, 1, 1,
0.4244828, 0.07516021, 1.555203, 1, 1, 1, 1, 1,
0.4287166, -1.187459, 2.634234, 1, 1, 1, 1, 1,
0.4364813, -0.3774807, 3.302196, 1, 1, 1, 1, 1,
0.4384708, -0.9282788, 2.799536, 1, 1, 1, 1, 1,
0.4420847, -0.6367544, 2.748504, 1, 1, 1, 1, 1,
0.4440456, 0.1098161, 2.690124, 0, 0, 1, 1, 1,
0.4469936, 1.394319, -1.109699, 1, 0, 0, 1, 1,
0.4520801, 0.2506236, 2.188061, 1, 0, 0, 1, 1,
0.4569704, -0.05044454, 3.204601, 1, 0, 0, 1, 1,
0.4581892, 1.488009, 2.366552, 1, 0, 0, 1, 1,
0.4638438, -0.6367633, 2.959236, 1, 0, 0, 1, 1,
0.4699505, 0.2440661, 2.814253, 0, 0, 0, 1, 1,
0.4753105, -1.160277, 3.952989, 0, 0, 0, 1, 1,
0.4766677, -1.066366, 1.616666, 0, 0, 0, 1, 1,
0.4779474, -0.3900868, 2.364096, 0, 0, 0, 1, 1,
0.4780523, 0.3241819, 1.422724, 0, 0, 0, 1, 1,
0.4866014, 0.9195696, -0.2935526, 0, 0, 0, 1, 1,
0.48737, -0.4942013, 2.749549, 0, 0, 0, 1, 1,
0.4951832, -0.456814, 2.511275, 1, 1, 1, 1, 1,
0.4963074, -0.01976835, 0.3878016, 1, 1, 1, 1, 1,
0.4980694, -0.8444604, 2.592533, 1, 1, 1, 1, 1,
0.5013762, -1.095553, 2.062781, 1, 1, 1, 1, 1,
0.5029476, -0.4295495, 3.741203, 1, 1, 1, 1, 1,
0.5039981, -1.681247, 3.608939, 1, 1, 1, 1, 1,
0.5089149, 0.3095452, 0.08052129, 1, 1, 1, 1, 1,
0.5091065, 0.5303431, 2.407829, 1, 1, 1, 1, 1,
0.5118341, 0.232423, 1.180941, 1, 1, 1, 1, 1,
0.5150435, 0.2999612, 1.59445, 1, 1, 1, 1, 1,
0.5167204, -1.043875, -0.1305863, 1, 1, 1, 1, 1,
0.5175042, 1.164089, 1.035592, 1, 1, 1, 1, 1,
0.5217366, 0.1012647, 1.817783, 1, 1, 1, 1, 1,
0.5222768, -1.319047, 4.617034, 1, 1, 1, 1, 1,
0.5227519, -0.2827522, 1.072179, 1, 1, 1, 1, 1,
0.5268382, 0.04432398, 2.340361, 0, 0, 1, 1, 1,
0.5270787, 1.312864, -0.04417648, 1, 0, 0, 1, 1,
0.5287594, 1.358105, 2.433618, 1, 0, 0, 1, 1,
0.5356864, -1.711283, 3.594295, 1, 0, 0, 1, 1,
0.5365289, -0.8345684, 3.267164, 1, 0, 0, 1, 1,
0.5472042, 0.1004598, 1.818631, 1, 0, 0, 1, 1,
0.5487986, -0.3148535, 2.478717, 0, 0, 0, 1, 1,
0.5496774, -0.4345461, 3.005761, 0, 0, 0, 1, 1,
0.5585431, 0.8446944, -0.3081861, 0, 0, 0, 1, 1,
0.5632786, -1.337507, 3.301242, 0, 0, 0, 1, 1,
0.5637071, -0.264676, 1.898694, 0, 0, 0, 1, 1,
0.5699674, -1.311233, 2.837342, 0, 0, 0, 1, 1,
0.5715566, -0.561537, 0.602537, 0, 0, 0, 1, 1,
0.5718047, 0.5170639, 0.6749534, 1, 1, 1, 1, 1,
0.5728315, -0.7670906, 1.923243, 1, 1, 1, 1, 1,
0.5793221, 0.179095, -0.05513283, 1, 1, 1, 1, 1,
0.5839569, 0.8858502, 0.586273, 1, 1, 1, 1, 1,
0.5877766, 0.0252067, -0.2820563, 1, 1, 1, 1, 1,
0.5878316, 0.692766, 0.5262578, 1, 1, 1, 1, 1,
0.5898067, -0.5869986, 2.986456, 1, 1, 1, 1, 1,
0.5915906, -0.4414501, 2.884439, 1, 1, 1, 1, 1,
0.6000351, -0.09212428, 1.249558, 1, 1, 1, 1, 1,
0.601247, -0.1048068, 1.268909, 1, 1, 1, 1, 1,
0.6044647, 0.09995237, 2.351514, 1, 1, 1, 1, 1,
0.6049285, -0.6062246, 2.973033, 1, 1, 1, 1, 1,
0.608531, -0.1576612, 4.129786, 1, 1, 1, 1, 1,
0.6110939, -0.4457109, 1.736887, 1, 1, 1, 1, 1,
0.6133198, -0.8001125, 2.210872, 1, 1, 1, 1, 1,
0.6163049, -0.7564656, 2.308028, 0, 0, 1, 1, 1,
0.6164203, 0.1106228, 1.096845, 1, 0, 0, 1, 1,
0.6174579, -0.946756, 2.326848, 1, 0, 0, 1, 1,
0.6182038, 2.335671, 2.364289, 1, 0, 0, 1, 1,
0.6187627, -1.219894, 1.489093, 1, 0, 0, 1, 1,
0.6212589, -1.275803, 3.618371, 1, 0, 0, 1, 1,
0.62448, 0.04607825, 0.4222888, 0, 0, 0, 1, 1,
0.6265566, 0.1211642, 2.073896, 0, 0, 0, 1, 1,
0.6340514, 1.543575, 1.21401, 0, 0, 0, 1, 1,
0.6363385, -0.4747875, 1.702808, 0, 0, 0, 1, 1,
0.6421279, -1.682111, 2.399448, 0, 0, 0, 1, 1,
0.6432541, -1.203862, 1.941445, 0, 0, 0, 1, 1,
0.6451911, -2.100038, 2.449932, 0, 0, 0, 1, 1,
0.6485224, -0.1857052, 0.4585907, 1, 1, 1, 1, 1,
0.6503512, -0.9552404, 3.387872, 1, 1, 1, 1, 1,
0.6517196, 0.1603204, -0.5756233, 1, 1, 1, 1, 1,
0.652218, 0.2189109, 1.608308, 1, 1, 1, 1, 1,
0.6613599, 1.725558, 0.529169, 1, 1, 1, 1, 1,
0.6624917, -1.237884, 2.721575, 1, 1, 1, 1, 1,
0.663568, 0.4591718, 0.9482993, 1, 1, 1, 1, 1,
0.6740685, 0.2782339, 1.728415, 1, 1, 1, 1, 1,
0.6771526, 1.957745, -0.6439121, 1, 1, 1, 1, 1,
0.6809368, -2.081351, 2.908664, 1, 1, 1, 1, 1,
0.681075, 1.103912, 0.7214833, 1, 1, 1, 1, 1,
0.6946798, -2.020294, 1.419223, 1, 1, 1, 1, 1,
0.6984853, 0.1459294, 1.195174, 1, 1, 1, 1, 1,
0.7018608, 1.071465, 0.9458297, 1, 1, 1, 1, 1,
0.7031564, 0.6046174, 2.186171, 1, 1, 1, 1, 1,
0.714232, -0.09765872, 1.444934, 0, 0, 1, 1, 1,
0.7148503, 1.311326, 1.799452, 1, 0, 0, 1, 1,
0.7162374, 0.5940792, -0.7897143, 1, 0, 0, 1, 1,
0.717847, -1.238593, 2.348962, 1, 0, 0, 1, 1,
0.7185476, -0.9338105, 1.353439, 1, 0, 0, 1, 1,
0.7214726, 0.9170546, 0.4257848, 1, 0, 0, 1, 1,
0.7223088, 0.3392024, 1.977298, 0, 0, 0, 1, 1,
0.7269837, 0.730164, 2.010805, 0, 0, 0, 1, 1,
0.7324255, 0.3985458, 4.074977, 0, 0, 0, 1, 1,
0.7327784, 1.257588, -0.9649252, 0, 0, 0, 1, 1,
0.7360998, 0.9868928, 0.9900852, 0, 0, 0, 1, 1,
0.7361928, 0.4070005, 1.124347, 0, 0, 0, 1, 1,
0.7381225, -0.6616083, 0.5227175, 0, 0, 0, 1, 1,
0.7407791, 1.061853, 0.3281923, 1, 1, 1, 1, 1,
0.740793, -0.5575815, 1.612725, 1, 1, 1, 1, 1,
0.7415298, 0.3517791, 1.53947, 1, 1, 1, 1, 1,
0.7420357, -1.112588, 1.473074, 1, 1, 1, 1, 1,
0.7456104, 1.423077, 1.235983, 1, 1, 1, 1, 1,
0.7491413, -0.2492241, 3.425356, 1, 1, 1, 1, 1,
0.7496325, -1.561792, 2.224514, 1, 1, 1, 1, 1,
0.7544589, -1.620869, 2.163706, 1, 1, 1, 1, 1,
0.7562817, 0.5369013, 2.24526, 1, 1, 1, 1, 1,
0.7566894, 1.398942, -0.05861324, 1, 1, 1, 1, 1,
0.7568682, 0.9225449, 2.39761, 1, 1, 1, 1, 1,
0.770584, -0.8543605, 3.804432, 1, 1, 1, 1, 1,
0.7733358, -0.2939635, 3.422271, 1, 1, 1, 1, 1,
0.7736186, 0.03759539, 1.929433, 1, 1, 1, 1, 1,
0.7739219, 1.072688, 1.175943, 1, 1, 1, 1, 1,
0.7756857, 0.2065688, -0.1561415, 0, 0, 1, 1, 1,
0.7791874, 0.6697024, 2.022425, 1, 0, 0, 1, 1,
0.7792764, 0.2158023, 2.663725, 1, 0, 0, 1, 1,
0.7803015, 0.8449821, 0.4660053, 1, 0, 0, 1, 1,
0.7811446, -0.06949324, 1.752846, 1, 0, 0, 1, 1,
0.8042839, 0.3248658, 0.6222318, 1, 0, 0, 1, 1,
0.8203087, -0.2938031, 0.4031146, 0, 0, 0, 1, 1,
0.8203773, -0.4909588, -0.7465366, 0, 0, 0, 1, 1,
0.8220218, 1.083057, 0.8488212, 0, 0, 0, 1, 1,
0.8253638, 0.6348122, 0.75499, 0, 0, 0, 1, 1,
0.8313773, 1.444945, 2.169499, 0, 0, 0, 1, 1,
0.840154, -0.6081222, 3.831716, 0, 0, 0, 1, 1,
0.8419111, 1.424358, 2.588881, 0, 0, 0, 1, 1,
0.8495719, -0.5411326, 1.476066, 1, 1, 1, 1, 1,
0.8506473, -0.878176, 2.733356, 1, 1, 1, 1, 1,
0.8546997, -0.02709534, 3.713612, 1, 1, 1, 1, 1,
0.8549285, -0.910634, 1.483741, 1, 1, 1, 1, 1,
0.8552788, -1.36468, 2.94329, 1, 1, 1, 1, 1,
0.8658331, -1.906166, 0.7458484, 1, 1, 1, 1, 1,
0.8685525, 0.4129984, 3.045905, 1, 1, 1, 1, 1,
0.8759816, -1.247469, 4.385646, 1, 1, 1, 1, 1,
0.8860134, -0.3775626, 2.594445, 1, 1, 1, 1, 1,
0.8873432, -1.017219, 4.684351, 1, 1, 1, 1, 1,
0.8926085, -0.5934992, 1.732023, 1, 1, 1, 1, 1,
0.8931643, 1.401628, 1.498418, 1, 1, 1, 1, 1,
0.8945421, 0.6463856, 1.115066, 1, 1, 1, 1, 1,
0.8971642, -0.5991394, 3.388937, 1, 1, 1, 1, 1,
0.9057105, -0.2551087, 1.44752, 1, 1, 1, 1, 1,
0.9107672, 0.4089674, 1.254333, 0, 0, 1, 1, 1,
0.9114292, -1.07948, 3.803981, 1, 0, 0, 1, 1,
0.91195, -1.634546, 2.947035, 1, 0, 0, 1, 1,
0.9124607, -0.9870448, 2.686979, 1, 0, 0, 1, 1,
0.9261639, -1.493944, 2.268437, 1, 0, 0, 1, 1,
0.9454236, 0.8754278, -0.2681592, 1, 0, 0, 1, 1,
0.9481546, 0.8783935, 2.341604, 0, 0, 0, 1, 1,
0.9550885, 0.1872732, 2.073384, 0, 0, 0, 1, 1,
0.9558977, -0.8758153, 1.675223, 0, 0, 0, 1, 1,
0.9660939, -1.56653, 2.093458, 0, 0, 0, 1, 1,
0.9756577, 0.1638647, 0.5425007, 0, 0, 0, 1, 1,
0.9771278, -1.545624, 0.8118563, 0, 0, 0, 1, 1,
0.9942979, -0.9582364, 2.684192, 0, 0, 0, 1, 1,
0.9948468, 0.3212892, 3.003629, 1, 1, 1, 1, 1,
1.001221, -0.628327, 2.592023, 1, 1, 1, 1, 1,
1.012436, -1.02944, 3.46149, 1, 1, 1, 1, 1,
1.013958, -0.7056566, 2.527557, 1, 1, 1, 1, 1,
1.015614, -0.920684, 2.612276, 1, 1, 1, 1, 1,
1.017621, -0.05318235, 2.911734, 1, 1, 1, 1, 1,
1.024786, 1.5042, -0.629759, 1, 1, 1, 1, 1,
1.028385, 0.4750471, 2.588562, 1, 1, 1, 1, 1,
1.034835, 0.4769494, 1.234974, 1, 1, 1, 1, 1,
1.044282, -0.2456472, 2.385779, 1, 1, 1, 1, 1,
1.046577, -0.7169539, 1.176447, 1, 1, 1, 1, 1,
1.048208, -0.3737668, 3.867236, 1, 1, 1, 1, 1,
1.050324, -0.842518, 2.889657, 1, 1, 1, 1, 1,
1.050976, -0.05638424, 1.508688, 1, 1, 1, 1, 1,
1.05235, -1.059935, 4.134702, 1, 1, 1, 1, 1,
1.058629, -1.001272, 2.814869, 0, 0, 1, 1, 1,
1.063928, -0.8540069, 1.623159, 1, 0, 0, 1, 1,
1.067313, 1.297526, 1.367655, 1, 0, 0, 1, 1,
1.067411, 0.8520713, 1.581111, 1, 0, 0, 1, 1,
1.07184, 1.029112, -0.1996833, 1, 0, 0, 1, 1,
1.079204, -0.1548706, 2.747799, 1, 0, 0, 1, 1,
1.090685, 0.6245623, 2.028501, 0, 0, 0, 1, 1,
1.091825, 0.3862088, 1.633283, 0, 0, 0, 1, 1,
1.099844, -0.7621109, 1.319069, 0, 0, 0, 1, 1,
1.100679, -0.4126465, 0.6880783, 0, 0, 0, 1, 1,
1.106405, 0.1174658, 3.912378, 0, 0, 0, 1, 1,
1.110743, 0.3782718, 3.272212, 0, 0, 0, 1, 1,
1.111863, 0.04519607, 1.192479, 0, 0, 0, 1, 1,
1.112078, -0.022918, -0.1126925, 1, 1, 1, 1, 1,
1.114466, -0.0005303654, 2.005253, 1, 1, 1, 1, 1,
1.1174, 0.4648976, 0.7764356, 1, 1, 1, 1, 1,
1.122264, 0.5658134, 1.451858, 1, 1, 1, 1, 1,
1.123877, -0.2276833, 0.8519326, 1, 1, 1, 1, 1,
1.126549, -1.453969, 2.780156, 1, 1, 1, 1, 1,
1.129165, 0.3211991, 1.917835, 1, 1, 1, 1, 1,
1.14948, 0.4214676, 1.469657, 1, 1, 1, 1, 1,
1.154851, 0.159996, 1.181369, 1, 1, 1, 1, 1,
1.159402, 0.9379444, 0.7531163, 1, 1, 1, 1, 1,
1.161278, -0.2111226, 2.261756, 1, 1, 1, 1, 1,
1.196015, -0.02010796, 0.9554561, 1, 1, 1, 1, 1,
1.19821, -0.02546328, 2.831035, 1, 1, 1, 1, 1,
1.210848, -0.7784929, 0.8745753, 1, 1, 1, 1, 1,
1.214674, 0.5579015, 1.838956, 1, 1, 1, 1, 1,
1.215158, 0.0424, 1.24653, 0, 0, 1, 1, 1,
1.217427, 0.04295484, 1.337355, 1, 0, 0, 1, 1,
1.218666, 0.3467265, 0.7676193, 1, 0, 0, 1, 1,
1.222907, -0.3994707, 2.482851, 1, 0, 0, 1, 1,
1.22431, 2.032176, 0.2785943, 1, 0, 0, 1, 1,
1.233802, -0.1214091, 2.06147, 1, 0, 0, 1, 1,
1.235602, 0.3648966, 1.720585, 0, 0, 0, 1, 1,
1.243629, -0.08506113, 1.644608, 0, 0, 0, 1, 1,
1.246509, 0.4272409, -0.3897773, 0, 0, 0, 1, 1,
1.247577, 0.2124481, 3.017204, 0, 0, 0, 1, 1,
1.253286, 0.6281133, 2.003994, 0, 0, 0, 1, 1,
1.267812, -0.6763306, 3.770248, 0, 0, 0, 1, 1,
1.273428, -0.1119082, 0.5697957, 0, 0, 0, 1, 1,
1.273943, 0.6281889, -0.02363434, 1, 1, 1, 1, 1,
1.274461, -0.6573914, 1.542098, 1, 1, 1, 1, 1,
1.279382, 0.964467, 0.4265554, 1, 1, 1, 1, 1,
1.290367, -0.1019741, -0.5278911, 1, 1, 1, 1, 1,
1.290839, 0.682153, 2.844476, 1, 1, 1, 1, 1,
1.29308, -1.004467, 2.34439, 1, 1, 1, 1, 1,
1.295257, -1.938849, 2.151172, 1, 1, 1, 1, 1,
1.308183, 1.137181, 1.413857, 1, 1, 1, 1, 1,
1.317453, 1.720838, -0.08121388, 1, 1, 1, 1, 1,
1.320276, 1.020363, 0.7002566, 1, 1, 1, 1, 1,
1.320978, 0.2930661, 0.3687717, 1, 1, 1, 1, 1,
1.342798, 0.2473433, 2.101331, 1, 1, 1, 1, 1,
1.36205, -0.1280129, 1.922319, 1, 1, 1, 1, 1,
1.362153, -0.06731501, 0.2492453, 1, 1, 1, 1, 1,
1.36625, -1.013856, 3.620904, 1, 1, 1, 1, 1,
1.373352, -1.041739, 3.032913, 0, 0, 1, 1, 1,
1.375108, -0.6407225, 0.7521825, 1, 0, 0, 1, 1,
1.391882, -0.6352659, 2.020994, 1, 0, 0, 1, 1,
1.392299, 1.251841, 1.52354, 1, 0, 0, 1, 1,
1.432617, 3.090588, 0.3720968, 1, 0, 0, 1, 1,
1.445603, 0.2436012, 1.980396, 1, 0, 0, 1, 1,
1.447945, 0.04863099, -0.4490305, 0, 0, 0, 1, 1,
1.454441, -1.409282, 2.349497, 0, 0, 0, 1, 1,
1.461096, 0.36221, 2.148737, 0, 0, 0, 1, 1,
1.462062, -1.528866, 1.275874, 0, 0, 0, 1, 1,
1.483493, -1.050267, 1.91524, 0, 0, 0, 1, 1,
1.492319, -0.4822046, 2.944502, 0, 0, 0, 1, 1,
1.493905, 1.710796, 2.035878, 0, 0, 0, 1, 1,
1.495495, 0.0205045, 1.468459, 1, 1, 1, 1, 1,
1.499792, -0.371879, 2.78321, 1, 1, 1, 1, 1,
1.508671, 0.7380521, 2.999737, 1, 1, 1, 1, 1,
1.519263, -0.9694608, 2.55132, 1, 1, 1, 1, 1,
1.522497, 0.3920324, 0.8476857, 1, 1, 1, 1, 1,
1.522552, 0.7737215, 0.7015855, 1, 1, 1, 1, 1,
1.525438, -0.5608466, 2.337674, 1, 1, 1, 1, 1,
1.535868, -0.3999736, 0.9121454, 1, 1, 1, 1, 1,
1.569987, 0.3785971, 2.30801, 1, 1, 1, 1, 1,
1.57237, -0.1312614, 1.757998, 1, 1, 1, 1, 1,
1.590806, 0.3683441, 0.2157271, 1, 1, 1, 1, 1,
1.591555, 2.028406, 1.665792, 1, 1, 1, 1, 1,
1.606125, -0.4573888, 2.044573, 1, 1, 1, 1, 1,
1.615164, -0.1469269, 2.637684, 1, 1, 1, 1, 1,
1.621938, 0.2643052, 1.884149, 1, 1, 1, 1, 1,
1.648405, 0.631392, 1.032404, 0, 0, 1, 1, 1,
1.678605, -0.8461764, 2.808611, 1, 0, 0, 1, 1,
1.684727, -0.5049374, 2.221116, 1, 0, 0, 1, 1,
1.699047, 0.7767027, 0.7843076, 1, 0, 0, 1, 1,
1.707066, -0.01335052, 1.427216, 1, 0, 0, 1, 1,
1.707481, -0.6243408, 1.291144, 1, 0, 0, 1, 1,
1.710576, -1.6747, 2.635384, 0, 0, 0, 1, 1,
1.732899, -0.00265269, 0.3498518, 0, 0, 0, 1, 1,
1.73559, 0.6834345, 1.622099, 0, 0, 0, 1, 1,
1.740384, -0.6015915, 1.957382, 0, 0, 0, 1, 1,
1.74481, 0.6944306, 2.478985, 0, 0, 0, 1, 1,
1.75448, 0.2243058, 1.760828, 0, 0, 0, 1, 1,
1.763574, 0.3803718, 1.218801, 0, 0, 0, 1, 1,
1.783771, 0.1022165, 1.751702, 1, 1, 1, 1, 1,
1.785342, 0.2340737, 1.610183, 1, 1, 1, 1, 1,
1.792813, 0.4370023, 1.388846, 1, 1, 1, 1, 1,
1.823427, -0.6859983, 1.648378, 1, 1, 1, 1, 1,
1.825761, -1.062672, 2.512252, 1, 1, 1, 1, 1,
1.829023, -0.1085808, 0.0531906, 1, 1, 1, 1, 1,
1.844473, 1.063414, 1.213578, 1, 1, 1, 1, 1,
1.869642, 0.6992809, 1.421987, 1, 1, 1, 1, 1,
1.886509, -0.5462811, 4.148513, 1, 1, 1, 1, 1,
1.899483, 1.369115, 1.062736, 1, 1, 1, 1, 1,
1.902394, 0.1885585, 2.006542, 1, 1, 1, 1, 1,
1.913881, -0.7840873, 0.9889571, 1, 1, 1, 1, 1,
1.91726, 0.8539354, 0.4285815, 1, 1, 1, 1, 1,
1.919694, -2.171895, 4.79544, 1, 1, 1, 1, 1,
1.923975, 0.0751375, 1.374019, 1, 1, 1, 1, 1,
1.954265, -0.3531634, 2.811668, 0, 0, 1, 1, 1,
1.983383, 0.4665098, 1.357903, 1, 0, 0, 1, 1,
1.990793, 0.3576583, 0.5528379, 1, 0, 0, 1, 1,
2.014205, 3.221787, -1.512328, 1, 0, 0, 1, 1,
2.021293, -0.6550244, 0.8752054, 1, 0, 0, 1, 1,
2.084529, -0.677219, 1.282412, 1, 0, 0, 1, 1,
2.090416, 0.6146032, 1.735203, 0, 0, 0, 1, 1,
2.092036, 0.1227373, 2.09366, 0, 0, 0, 1, 1,
2.137019, -0.5543525, 0.7962804, 0, 0, 0, 1, 1,
2.185416, 0.6329342, 1.016053, 0, 0, 0, 1, 1,
2.21291, 2.427034, 1.195447, 0, 0, 0, 1, 1,
2.243108, 0.3158634, 1.74938, 0, 0, 0, 1, 1,
2.285933, 0.4300073, 0.5726172, 0, 0, 0, 1, 1,
2.39509, 0.4223011, 1.887567, 1, 1, 1, 1, 1,
2.465739, -0.4327247, 2.453517, 1, 1, 1, 1, 1,
2.49649, 0.3575823, 1.299682, 1, 1, 1, 1, 1,
2.525733, -1.594715, 1.518575, 1, 1, 1, 1, 1,
2.57835, -2.182225, 1.888981, 1, 1, 1, 1, 1,
2.827633, 1.687908, 0.2728714, 1, 1, 1, 1, 1,
2.923675, -0.7511606, 2.485922, 1, 1, 1, 1, 1
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
var radius = 9.690539;
var distance = 34.03761;
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
mvMatrix.translate( 0.2705431, -0.2638266, -0.2277217 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.03761);
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
