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
-3.200502, -0.8246409, -0.1710373, 1, 0, 0, 1,
-2.783829, -0.4992246, -0.8286176, 1, 0.007843138, 0, 1,
-2.452985, 0.01133088, -1.452205, 1, 0.01176471, 0, 1,
-2.41716, 0.8326828, -0.1035784, 1, 0.01960784, 0, 1,
-2.391629, 0.9202519, -1.724041, 1, 0.02352941, 0, 1,
-2.360247, -0.6426684, -0.9037453, 1, 0.03137255, 0, 1,
-2.347052, 0.2707686, -2.27363, 1, 0.03529412, 0, 1,
-2.331403, 0.4701332, -1.54578, 1, 0.04313726, 0, 1,
-2.330282, 0.4807772, -1.931484, 1, 0.04705882, 0, 1,
-2.328386, 0.5706402, -1.069915, 1, 0.05490196, 0, 1,
-2.293197, 1.690188, -1.080938, 1, 0.05882353, 0, 1,
-2.269383, 0.7486625, -1.634673, 1, 0.06666667, 0, 1,
-2.242677, 2.014446, -1.378773, 1, 0.07058824, 0, 1,
-2.228815, 0.08368432, -1.999066, 1, 0.07843138, 0, 1,
-2.22649, 0.5418397, -2.581762, 1, 0.08235294, 0, 1,
-2.209078, 0.7602116, -1.780031, 1, 0.09019608, 0, 1,
-2.181943, -0.715816, -2.68766, 1, 0.09411765, 0, 1,
-2.173129, 0.8340509, -2.256152, 1, 0.1019608, 0, 1,
-2.154316, 0.008760478, -2.845412, 1, 0.1098039, 0, 1,
-2.152917, -0.2712337, -1.178127, 1, 0.1137255, 0, 1,
-2.135716, -0.2830861, -1.98641, 1, 0.1215686, 0, 1,
-2.108905, 0.3754426, -4.043857, 1, 0.1254902, 0, 1,
-2.093737, -0.4047432, -1.789152, 1, 0.1333333, 0, 1,
-2.079251, 0.0566884, -0.8051099, 1, 0.1372549, 0, 1,
-2.04865, -0.1727641, -2.16667, 1, 0.145098, 0, 1,
-2.026901, -0.9728568, -2.5851, 1, 0.1490196, 0, 1,
-1.984565, -0.538421, -1.914423, 1, 0.1568628, 0, 1,
-1.983804, 0.7961107, -2.635482, 1, 0.1607843, 0, 1,
-1.966632, -0.06181254, -0.9396732, 1, 0.1686275, 0, 1,
-1.962822, 1.112307, -2.193389, 1, 0.172549, 0, 1,
-1.933813, 0.1912218, -1.929791, 1, 0.1803922, 0, 1,
-1.92146, -1.298496, -3.882985, 1, 0.1843137, 0, 1,
-1.921292, -1.606969, -4.041012, 1, 0.1921569, 0, 1,
-1.911545, -0.3655946, -1.935686, 1, 0.1960784, 0, 1,
-1.899334, 0.9726247, -1.05983, 1, 0.2039216, 0, 1,
-1.895574, 0.7431472, -0.0040926, 1, 0.2117647, 0, 1,
-1.882136, -1.123985, -3.139733, 1, 0.2156863, 0, 1,
-1.81764, 1.879196, 0.8051062, 1, 0.2235294, 0, 1,
-1.810928, -0.4018286, 0.844083, 1, 0.227451, 0, 1,
-1.792137, 0.5796548, -0.6685932, 1, 0.2352941, 0, 1,
-1.779928, 1.468946, -1.33022, 1, 0.2392157, 0, 1,
-1.77757, -1.10861, -2.572529, 1, 0.2470588, 0, 1,
-1.775003, 0.5293964, -0.0679552, 1, 0.2509804, 0, 1,
-1.752361, 0.01218546, -0.7057438, 1, 0.2588235, 0, 1,
-1.742016, -0.07980125, -1.92494, 1, 0.2627451, 0, 1,
-1.739592, -0.4433664, -2.346904, 1, 0.2705882, 0, 1,
-1.738742, 0.1364979, -1.846722, 1, 0.2745098, 0, 1,
-1.738337, -0.6654787, -2.320404, 1, 0.282353, 0, 1,
-1.720632, 0.1517018, -0.7184374, 1, 0.2862745, 0, 1,
-1.697407, -2.277249, -1.765484, 1, 0.2941177, 0, 1,
-1.697064, 0.932468, -1.864904, 1, 0.3019608, 0, 1,
-1.688583, -0.09109252, -1.217312, 1, 0.3058824, 0, 1,
-1.6717, -0.1008489, -1.307483, 1, 0.3137255, 0, 1,
-1.669907, -0.499858, -2.305623, 1, 0.3176471, 0, 1,
-1.669358, -1.137838, -2.803416, 1, 0.3254902, 0, 1,
-1.647197, 0.7624354, -0.3886168, 1, 0.3294118, 0, 1,
-1.632829, -1.668139, -2.946238, 1, 0.3372549, 0, 1,
-1.62866, 1.227856, -0.4734074, 1, 0.3411765, 0, 1,
-1.616371, 1.644219, 0.3468069, 1, 0.3490196, 0, 1,
-1.60864, 0.003105708, -2.517394, 1, 0.3529412, 0, 1,
-1.602149, -1.15975, -1.32821, 1, 0.3607843, 0, 1,
-1.584867, 1.167305, -0.04171232, 1, 0.3647059, 0, 1,
-1.58056, -0.0005812239, -3.117533, 1, 0.372549, 0, 1,
-1.576143, -0.2053167, -2.374684, 1, 0.3764706, 0, 1,
-1.575939, 0.8952853, 0.3589269, 1, 0.3843137, 0, 1,
-1.564631, -1.084927, -2.896118, 1, 0.3882353, 0, 1,
-1.562217, -1.303129, -0.8971224, 1, 0.3960784, 0, 1,
-1.558066, 0.5244493, -0.9083065, 1, 0.4039216, 0, 1,
-1.557946, 1.830598, 0.5164742, 1, 0.4078431, 0, 1,
-1.557028, 0.4182286, -2.164828, 1, 0.4156863, 0, 1,
-1.546747, 0.8135023, -1.61817, 1, 0.4196078, 0, 1,
-1.545826, 2.971341, 0.3723185, 1, 0.427451, 0, 1,
-1.545278, -0.5284408, -3.536942, 1, 0.4313726, 0, 1,
-1.54177, 0.9365358, -0.712813, 1, 0.4392157, 0, 1,
-1.538326, -0.7554249, -4.448258, 1, 0.4431373, 0, 1,
-1.536153, -0.6100038, -3.511873, 1, 0.4509804, 0, 1,
-1.533032, -0.2198019, -1.420919, 1, 0.454902, 0, 1,
-1.509097, -0.0990774, -0.7637209, 1, 0.4627451, 0, 1,
-1.504231, 0.4923514, -1.73708, 1, 0.4666667, 0, 1,
-1.497842, 0.8067605, -1.785437, 1, 0.4745098, 0, 1,
-1.470304, 1.179838, -1.145157, 1, 0.4784314, 0, 1,
-1.455855, 1.041505, -0.12744, 1, 0.4862745, 0, 1,
-1.446699, 1.153679, -0.8007117, 1, 0.4901961, 0, 1,
-1.43214, -0.8373955, -1.998179, 1, 0.4980392, 0, 1,
-1.418614, -0.1870059, -1.883515, 1, 0.5058824, 0, 1,
-1.418423, 1.386926, -0.9850006, 1, 0.509804, 0, 1,
-1.401218, -0.1810377, -3.518293, 1, 0.5176471, 0, 1,
-1.386406, 0.2276001, 0.07927399, 1, 0.5215687, 0, 1,
-1.380721, 0.8657151, -2.159603, 1, 0.5294118, 0, 1,
-1.367477, 0.4504461, -2.297966, 1, 0.5333334, 0, 1,
-1.365926, 1.851076, -0.3725555, 1, 0.5411765, 0, 1,
-1.362062, 2.081564, 0.2169395, 1, 0.5450981, 0, 1,
-1.35964, -0.7686067, -1.740368, 1, 0.5529412, 0, 1,
-1.353904, -1.835919, -2.376317, 1, 0.5568628, 0, 1,
-1.346122, -1.397963, -3.407328, 1, 0.5647059, 0, 1,
-1.342898, -2.180812, -2.357385, 1, 0.5686275, 0, 1,
-1.34079, 0.1867545, -2.006745, 1, 0.5764706, 0, 1,
-1.334616, 0.3583048, -0.600157, 1, 0.5803922, 0, 1,
-1.32405, -1.021822, -2.410834, 1, 0.5882353, 0, 1,
-1.317701, 1.05266, 1.253438, 1, 0.5921569, 0, 1,
-1.314832, 0.3848412, 0.1985607, 1, 0.6, 0, 1,
-1.311162, -1.131867, -2.020589, 1, 0.6078432, 0, 1,
-1.300719, -0.8317468, -1.673828, 1, 0.6117647, 0, 1,
-1.293303, 1.297219, -1.467562, 1, 0.6196079, 0, 1,
-1.279489, 0.09234899, -0.7120147, 1, 0.6235294, 0, 1,
-1.278202, 0.6884569, -1.783699, 1, 0.6313726, 0, 1,
-1.266908, 0.22028, -2.581625, 1, 0.6352941, 0, 1,
-1.266502, 0.6808743, -1.588063, 1, 0.6431373, 0, 1,
-1.257203, -1.214567, -1.033155, 1, 0.6470588, 0, 1,
-1.25131, -0.8312074, -1.145969, 1, 0.654902, 0, 1,
-1.24424, -0.2823683, -1.803999, 1, 0.6588235, 0, 1,
-1.237681, -0.1802745, -2.373951, 1, 0.6666667, 0, 1,
-1.222133, 1.370709, -2.588013, 1, 0.6705883, 0, 1,
-1.219135, -2.087767, -2.036357, 1, 0.6784314, 0, 1,
-1.203705, 0.8895679, -1.426785, 1, 0.682353, 0, 1,
-1.202991, -0.0509503, -1.460418, 1, 0.6901961, 0, 1,
-1.201914, -0.8581063, -1.381446, 1, 0.6941177, 0, 1,
-1.200109, 0.9044618, 0.04348904, 1, 0.7019608, 0, 1,
-1.189617, 0.1032517, -1.42012, 1, 0.7098039, 0, 1,
-1.188744, -1.381315, -2.259469, 1, 0.7137255, 0, 1,
-1.186758, 0.6926305, -1.510333, 1, 0.7215686, 0, 1,
-1.186397, 0.4832408, -1.917969, 1, 0.7254902, 0, 1,
-1.180637, 0.8458582, -0.1212128, 1, 0.7333333, 0, 1,
-1.179999, -1.208992, -1.666818, 1, 0.7372549, 0, 1,
-1.169104, -0.5921814, -0.5428266, 1, 0.7450981, 0, 1,
-1.166465, -0.8039496, -1.801445, 1, 0.7490196, 0, 1,
-1.156129, 0.127663, -0.1607861, 1, 0.7568628, 0, 1,
-1.151685, 0.3812057, 0.2538878, 1, 0.7607843, 0, 1,
-1.145828, -0.2691613, -0.7956986, 1, 0.7686275, 0, 1,
-1.140172, -0.4442878, -0.4192445, 1, 0.772549, 0, 1,
-1.137323, 1.320869, -0.7230159, 1, 0.7803922, 0, 1,
-1.136201, -1.484734, -1.715679, 1, 0.7843137, 0, 1,
-1.132315, -1.020079, -2.842737, 1, 0.7921569, 0, 1,
-1.121669, 0.4241067, -0.4752461, 1, 0.7960784, 0, 1,
-1.115459, 0.486768, -1.912563, 1, 0.8039216, 0, 1,
-1.112558, -0.6596087, -2.432497, 1, 0.8117647, 0, 1,
-1.111874, 1.319349, -1.762736, 1, 0.8156863, 0, 1,
-1.107499, 1.760312, -1.387172, 1, 0.8235294, 0, 1,
-1.10536, 0.2192911, -1.986053, 1, 0.827451, 0, 1,
-1.101311, -0.663358, -1.73626, 1, 0.8352941, 0, 1,
-1.08932, -0.2662037, -2.288216, 1, 0.8392157, 0, 1,
-1.080207, -1.639422, -4.251858, 1, 0.8470588, 0, 1,
-1.074295, 1.487157, -2.024331, 1, 0.8509804, 0, 1,
-1.074084, 0.5747547, -1.343283, 1, 0.8588235, 0, 1,
-1.066609, 0.179663, -0.2473551, 1, 0.8627451, 0, 1,
-1.06653, -1.270066, -1.963633, 1, 0.8705882, 0, 1,
-1.064862, 1.527247, 0.3594527, 1, 0.8745098, 0, 1,
-1.063062, 0.9891903, -0.6157507, 1, 0.8823529, 0, 1,
-1.062726, -0.3436168, -0.6950851, 1, 0.8862745, 0, 1,
-1.058924, 0.2497913, 0.1675224, 1, 0.8941177, 0, 1,
-1.055022, 0.03339396, -1.433055, 1, 0.8980392, 0, 1,
-1.053175, -1.294595, -1.610409, 1, 0.9058824, 0, 1,
-1.046833, 0.1537587, -0.2776921, 1, 0.9137255, 0, 1,
-1.046056, 0.3538033, 0.06997385, 1, 0.9176471, 0, 1,
-1.03983, 0.5210955, -0.8581414, 1, 0.9254902, 0, 1,
-1.039621, -0.6820462, -3.877836, 1, 0.9294118, 0, 1,
-1.039466, 0.4777758, 0.2623906, 1, 0.9372549, 0, 1,
-1.038244, -1.366382, -1.690824, 1, 0.9411765, 0, 1,
-1.037201, 0.2427924, -0.6695064, 1, 0.9490196, 0, 1,
-1.036796, 2.408262, -1.289006, 1, 0.9529412, 0, 1,
-1.029121, 0.04516649, -2.669551, 1, 0.9607843, 0, 1,
-1.026816, 0.2482443, -1.119326, 1, 0.9647059, 0, 1,
-1.015176, 1.847011, -0.118711, 1, 0.972549, 0, 1,
-1.012069, -0.2171725, -2.370945, 1, 0.9764706, 0, 1,
-1.00844, 0.3983128, 0.681058, 1, 0.9843137, 0, 1,
-1.007034, 0.4497156, -0.9154601, 1, 0.9882353, 0, 1,
-0.9990355, 1.155463, -0.6616058, 1, 0.9960784, 0, 1,
-0.9922925, 1.01414, -1.552335, 0.9960784, 1, 0, 1,
-0.9832733, -0.1425252, -1.672693, 0.9921569, 1, 0, 1,
-0.9820996, -0.9980731, -2.029671, 0.9843137, 1, 0, 1,
-0.9820247, 0.645947, -0.02829106, 0.9803922, 1, 0, 1,
-0.9811504, 0.3887993, -0.9184396, 0.972549, 1, 0, 1,
-0.9804505, -1.511703, -2.912935, 0.9686275, 1, 0, 1,
-0.9794706, -0.9119356, -1.955463, 0.9607843, 1, 0, 1,
-0.9710754, 0.3215854, -3.063652, 0.9568627, 1, 0, 1,
-0.9672941, -0.2869087, -2.419733, 0.9490196, 1, 0, 1,
-0.9652662, -0.001462075, -2.633931, 0.945098, 1, 0, 1,
-0.9634682, -0.482243, -3.719382, 0.9372549, 1, 0, 1,
-0.9553426, -1.674463, -3.364064, 0.9333333, 1, 0, 1,
-0.9548615, 0.2425068, -1.87972, 0.9254902, 1, 0, 1,
-0.9532715, 0.7402061, -2.164386, 0.9215686, 1, 0, 1,
-0.9472513, -0.1034447, -2.042199, 0.9137255, 1, 0, 1,
-0.9365349, 1.39325, -1.665679, 0.9098039, 1, 0, 1,
-0.9354708, 0.4123229, -3.222124, 0.9019608, 1, 0, 1,
-0.9348649, -0.2024147, -2.445028, 0.8941177, 1, 0, 1,
-0.9319956, 2.043715, -1.33796, 0.8901961, 1, 0, 1,
-0.9255091, -0.9626444, -1.836446, 0.8823529, 1, 0, 1,
-0.925132, 0.239107, -0.7950968, 0.8784314, 1, 0, 1,
-0.9227111, 0.4499428, 0.3324014, 0.8705882, 1, 0, 1,
-0.9165995, 1.003986, -0.1035279, 0.8666667, 1, 0, 1,
-0.9133439, -0.04214976, -1.111975, 0.8588235, 1, 0, 1,
-0.9075604, -0.5607526, -0.6602348, 0.854902, 1, 0, 1,
-0.903497, 0.2767535, 0.3874223, 0.8470588, 1, 0, 1,
-0.8879258, 1.089029, -0.6582655, 0.8431373, 1, 0, 1,
-0.8832288, -0.1889714, -3.158329, 0.8352941, 1, 0, 1,
-0.8764711, 0.9498296, -1.373075, 0.8313726, 1, 0, 1,
-0.876304, 0.9795443, -1.570275, 0.8235294, 1, 0, 1,
-0.8738888, -1.493215, -2.19751, 0.8196079, 1, 0, 1,
-0.872093, 0.3264592, -0.9251535, 0.8117647, 1, 0, 1,
-0.8720645, 0.4146138, -0.6526955, 0.8078431, 1, 0, 1,
-0.8709417, -1.598699, -3.177505, 0.8, 1, 0, 1,
-0.8694934, -1.945943, -2.944714, 0.7921569, 1, 0, 1,
-0.8685209, 0.9507278, -0.2376422, 0.7882353, 1, 0, 1,
-0.8613387, 0.1460619, -2.521795, 0.7803922, 1, 0, 1,
-0.860963, 1.127158, 0.2615524, 0.7764706, 1, 0, 1,
-0.8545385, 0.7901547, -3.15505, 0.7686275, 1, 0, 1,
-0.8503122, -0.3400071, -2.179753, 0.7647059, 1, 0, 1,
-0.8437746, -0.5014744, -1.599105, 0.7568628, 1, 0, 1,
-0.843646, -0.335998, -1.460094, 0.7529412, 1, 0, 1,
-0.840539, 0.03401949, -2.24544, 0.7450981, 1, 0, 1,
-0.8352677, -0.3432041, -3.659896, 0.7411765, 1, 0, 1,
-0.8323576, 0.09096023, -0.2921235, 0.7333333, 1, 0, 1,
-0.8263819, 0.8779631, -1.995757, 0.7294118, 1, 0, 1,
-0.8128949, -0.3405927, -2.368854, 0.7215686, 1, 0, 1,
-0.8117779, -0.6782153, -3.102533, 0.7176471, 1, 0, 1,
-0.8110772, 0.3062473, -2.792295, 0.7098039, 1, 0, 1,
-0.8040712, -1.883395, -1.315343, 0.7058824, 1, 0, 1,
-0.8035052, -0.9786496, -2.720202, 0.6980392, 1, 0, 1,
-0.797339, -1.947095, -2.854838, 0.6901961, 1, 0, 1,
-0.7943907, -0.9457356, -1.957981, 0.6862745, 1, 0, 1,
-0.7882004, 0.2873639, -1.477639, 0.6784314, 1, 0, 1,
-0.7839233, -0.04578098, -1.158835, 0.6745098, 1, 0, 1,
-0.7796054, 1.057939, -1.368415, 0.6666667, 1, 0, 1,
-0.7775957, -0.1076442, -1.423544, 0.6627451, 1, 0, 1,
-0.7759808, -1.82725, -2.869836, 0.654902, 1, 0, 1,
-0.7743963, -1.203753, -1.228677, 0.6509804, 1, 0, 1,
-0.7734544, 0.6194121, -0.1010577, 0.6431373, 1, 0, 1,
-0.7702225, 0.2174422, -1.027477, 0.6392157, 1, 0, 1,
-0.7700778, -0.4973088, -2.288945, 0.6313726, 1, 0, 1,
-0.7638361, -0.3789729, -1.975182, 0.627451, 1, 0, 1,
-0.7565559, -0.1939071, 0.1100913, 0.6196079, 1, 0, 1,
-0.7563186, -0.4656443, -2.415599, 0.6156863, 1, 0, 1,
-0.7548721, -0.883512, -3.007604, 0.6078432, 1, 0, 1,
-0.7540801, 0.432751, -0.5603231, 0.6039216, 1, 0, 1,
-0.7537353, -0.07688351, 0.110991, 0.5960785, 1, 0, 1,
-0.752574, -0.1931248, -1.463078, 0.5882353, 1, 0, 1,
-0.7434378, -1.002314, -2.656515, 0.5843138, 1, 0, 1,
-0.7359987, -1.252523, -0.9602739, 0.5764706, 1, 0, 1,
-0.7329974, 0.4989008, -1.46752, 0.572549, 1, 0, 1,
-0.7328236, 0.2611705, -1.711197, 0.5647059, 1, 0, 1,
-0.7311171, 0.117874, -0.4963094, 0.5607843, 1, 0, 1,
-0.730682, -0.4046012, -1.826762, 0.5529412, 1, 0, 1,
-0.7294853, -1.480539, -1.905333, 0.5490196, 1, 0, 1,
-0.7267355, -0.2185267, -2.080529, 0.5411765, 1, 0, 1,
-0.7187759, -0.4633416, -1.789014, 0.5372549, 1, 0, 1,
-0.7156909, -2.062476, -2.8914, 0.5294118, 1, 0, 1,
-0.7111723, -1.493602, -1.332722, 0.5254902, 1, 0, 1,
-0.7101141, -2.114813, -2.147459, 0.5176471, 1, 0, 1,
-0.7093727, -0.5901036, -3.483664, 0.5137255, 1, 0, 1,
-0.7084867, -1.13165, -1.318334, 0.5058824, 1, 0, 1,
-0.7077066, -1.229859, -4.141615, 0.5019608, 1, 0, 1,
-0.7064847, 0.8974087, -0.61676, 0.4941176, 1, 0, 1,
-0.6979886, 0.7208277, -1.397017, 0.4862745, 1, 0, 1,
-0.6976095, -2.297537, -1.713691, 0.4823529, 1, 0, 1,
-0.6952085, -0.437298, -1.735272, 0.4745098, 1, 0, 1,
-0.6925315, 0.3299202, -0.1738424, 0.4705882, 1, 0, 1,
-0.6893222, 1.459007, 1.164042, 0.4627451, 1, 0, 1,
-0.6889244, -0.1492966, -1.141093, 0.4588235, 1, 0, 1,
-0.6835675, -0.5294644, -1.831959, 0.4509804, 1, 0, 1,
-0.6753572, 0.1786906, -4.056099, 0.4470588, 1, 0, 1,
-0.674944, -0.05063912, -2.425821, 0.4392157, 1, 0, 1,
-0.6698286, 0.6531411, -0.6194245, 0.4352941, 1, 0, 1,
-0.6686518, 0.4579785, -1.731915, 0.427451, 1, 0, 1,
-0.6610088, -0.02765225, -2.063572, 0.4235294, 1, 0, 1,
-0.6579887, 0.3943034, 1.138927, 0.4156863, 1, 0, 1,
-0.6533973, -0.3600954, -2.624795, 0.4117647, 1, 0, 1,
-0.6490728, 1.174984, -0.4234571, 0.4039216, 1, 0, 1,
-0.6489918, -0.6922501, -2.410538, 0.3960784, 1, 0, 1,
-0.6459683, 1.217575, -1.487448, 0.3921569, 1, 0, 1,
-0.644074, -1.465713, -2.43585, 0.3843137, 1, 0, 1,
-0.6437443, -1.785917, -2.812866, 0.3803922, 1, 0, 1,
-0.637746, -0.4326671, -3.125734, 0.372549, 1, 0, 1,
-0.6372998, 0.1476666, -0.6584929, 0.3686275, 1, 0, 1,
-0.6329397, 0.1103832, -0.07056804, 0.3607843, 1, 0, 1,
-0.6323833, 1.372745, 0.2662227, 0.3568628, 1, 0, 1,
-0.6317415, 0.0580335, 1.036971, 0.3490196, 1, 0, 1,
-0.6317357, -1.23758, -2.953074, 0.345098, 1, 0, 1,
-0.6300327, -0.7862028, -0.7929249, 0.3372549, 1, 0, 1,
-0.6240076, 0.6773438, -0.527415, 0.3333333, 1, 0, 1,
-0.6187823, -0.04003894, -1.646594, 0.3254902, 1, 0, 1,
-0.6114416, -1.650272, -4.554928, 0.3215686, 1, 0, 1,
-0.6069846, 0.6988182, -0.9965001, 0.3137255, 1, 0, 1,
-0.6015233, -0.9111934, -3.732194, 0.3098039, 1, 0, 1,
-0.6006114, -0.4399978, -1.933634, 0.3019608, 1, 0, 1,
-0.6005492, -0.0946191, -1.919538, 0.2941177, 1, 0, 1,
-0.6005396, 0.369286, -0.9987086, 0.2901961, 1, 0, 1,
-0.6002247, -1.12931, -1.932848, 0.282353, 1, 0, 1,
-0.5969658, 1.014059, -0.458028, 0.2784314, 1, 0, 1,
-0.596873, 0.3440867, 0.6005722, 0.2705882, 1, 0, 1,
-0.5965455, -2.064648, -2.821599, 0.2666667, 1, 0, 1,
-0.5940167, 0.7623004, -0.4905255, 0.2588235, 1, 0, 1,
-0.5881898, -1.080718, -2.76066, 0.254902, 1, 0, 1,
-0.5878107, -1.093346, -3.433461, 0.2470588, 1, 0, 1,
-0.5837902, -0.6804629, -2.072083, 0.2431373, 1, 0, 1,
-0.5790704, 0.5467461, -1.655569, 0.2352941, 1, 0, 1,
-0.576189, -0.564176, -4.089662, 0.2313726, 1, 0, 1,
-0.5754532, 0.0495173, -0.4527273, 0.2235294, 1, 0, 1,
-0.5714158, 0.248242, -1.854641, 0.2196078, 1, 0, 1,
-0.5690051, 0.1381758, -2.413713, 0.2117647, 1, 0, 1,
-0.568931, 0.2498939, -0.750461, 0.2078431, 1, 0, 1,
-0.5688138, 0.3758649, -0.7796749, 0.2, 1, 0, 1,
-0.567402, 0.2533022, -3.184102, 0.1921569, 1, 0, 1,
-0.5662397, 0.1578514, -0.4327494, 0.1882353, 1, 0, 1,
-0.5655837, 0.8013191, 0.2924913, 0.1803922, 1, 0, 1,
-0.565243, -0.3555259, -2.124218, 0.1764706, 1, 0, 1,
-0.5641656, 1.101735, -1.219483, 0.1686275, 1, 0, 1,
-0.5559942, 0.6713496, -1.494745, 0.1647059, 1, 0, 1,
-0.5534961, 0.5118247, -2.561941, 0.1568628, 1, 0, 1,
-0.5528467, -0.1458882, -2.542292, 0.1529412, 1, 0, 1,
-0.5526454, 0.7575662, -0.9229432, 0.145098, 1, 0, 1,
-0.5508544, -1.407837, -3.069844, 0.1411765, 1, 0, 1,
-0.5476375, 1.790075, 1.82152, 0.1333333, 1, 0, 1,
-0.5468168, 0.4557342, -0.5332239, 0.1294118, 1, 0, 1,
-0.544602, -0.5311981, -2.925272, 0.1215686, 1, 0, 1,
-0.5439501, 1.437916, -0.6517613, 0.1176471, 1, 0, 1,
-0.5387316, -2.384349, -3.457994, 0.1098039, 1, 0, 1,
-0.5361611, -1.222906, -3.16263, 0.1058824, 1, 0, 1,
-0.5314152, 1.941208, 0.6716095, 0.09803922, 1, 0, 1,
-0.5312619, -0.7750015, -3.490019, 0.09019608, 1, 0, 1,
-0.5276468, -1.869682, -1.910488, 0.08627451, 1, 0, 1,
-0.5228797, -1.878421, -3.586131, 0.07843138, 1, 0, 1,
-0.5196992, 1.501726, -1.595689, 0.07450981, 1, 0, 1,
-0.5163549, 0.1411551, -1.095494, 0.06666667, 1, 0, 1,
-0.5148193, -1.240861, -1.252779, 0.0627451, 1, 0, 1,
-0.5146551, 0.6875716, 0.1292116, 0.05490196, 1, 0, 1,
-0.5145516, -0.929766, -2.24587, 0.05098039, 1, 0, 1,
-0.5126135, 0.4906559, 0.1220556, 0.04313726, 1, 0, 1,
-0.5096613, 3.118007, -0.5289207, 0.03921569, 1, 0, 1,
-0.5053824, 0.2452841, 1.090317, 0.03137255, 1, 0, 1,
-0.5017098, -0.395241, -3.011727, 0.02745098, 1, 0, 1,
-0.5008152, 0.01424038, -0.452251, 0.01960784, 1, 0, 1,
-0.4968458, -0.1947655, -2.869269, 0.01568628, 1, 0, 1,
-0.488254, -0.7496253, -2.309753, 0.007843138, 1, 0, 1,
-0.4879563, 0.5135233, -0.627553, 0.003921569, 1, 0, 1,
-0.4825756, 2.049759, 1.548969, 0, 1, 0.003921569, 1,
-0.4808424, 0.9628233, -0.8506272, 0, 1, 0.01176471, 1,
-0.4801053, -0.4657983, -1.428408, 0, 1, 0.01568628, 1,
-0.4799066, 1.120086, 1.142663, 0, 1, 0.02352941, 1,
-0.4794714, 1.018946, -1.083817, 0, 1, 0.02745098, 1,
-0.4676978, 0.3721574, -0.03008628, 0, 1, 0.03529412, 1,
-0.4623355, -1.520175, -2.062334, 0, 1, 0.03921569, 1,
-0.4614422, 0.1176087, -1.183288, 0, 1, 0.04705882, 1,
-0.4575685, -0.3546414, -3.303516, 0, 1, 0.05098039, 1,
-0.4541348, -0.6793932, -3.001357, 0, 1, 0.05882353, 1,
-0.4526197, -1.318974, -2.962116, 0, 1, 0.0627451, 1,
-0.4501745, -0.1018828, -3.363405, 0, 1, 0.07058824, 1,
-0.4486747, -1.099659, -2.137811, 0, 1, 0.07450981, 1,
-0.4476023, 0.6513665, -0.06752755, 0, 1, 0.08235294, 1,
-0.4456863, -0.62442, -1.912659, 0, 1, 0.08627451, 1,
-0.4439237, -0.9457014, -3.052279, 0, 1, 0.09411765, 1,
-0.4351893, -1.346085, -3.704934, 0, 1, 0.1019608, 1,
-0.4349294, -0.451649, -3.535589, 0, 1, 0.1058824, 1,
-0.4328232, 0.9188818, 0.2162898, 0, 1, 0.1137255, 1,
-0.4314125, 0.9215972, -0.3950763, 0, 1, 0.1176471, 1,
-0.4292658, -0.4452071, -2.512924, 0, 1, 0.1254902, 1,
-0.4274129, -0.7946004, -2.996694, 0, 1, 0.1294118, 1,
-0.4251063, -1.772813, -3.33806, 0, 1, 0.1372549, 1,
-0.4248677, 2.011286, 1.285292, 0, 1, 0.1411765, 1,
-0.4140419, 0.723333, -0.7324234, 0, 1, 0.1490196, 1,
-0.4098431, 0.9746591, -0.3142841, 0, 1, 0.1529412, 1,
-0.4098306, -0.4473622, -3.197278, 0, 1, 0.1607843, 1,
-0.408831, 0.4766682, 0.3894815, 0, 1, 0.1647059, 1,
-0.4072267, 0.05724737, -3.558551, 0, 1, 0.172549, 1,
-0.4067516, 1.573018, 0.3923047, 0, 1, 0.1764706, 1,
-0.4024397, -0.5403867, -1.768536, 0, 1, 0.1843137, 1,
-0.4013818, 0.4227182, 0.02182182, 0, 1, 0.1882353, 1,
-0.3961259, 1.760534, -0.8364069, 0, 1, 0.1960784, 1,
-0.3922318, -0.2372213, -2.968394, 0, 1, 0.2039216, 1,
-0.3901913, -0.6091118, -3.414122, 0, 1, 0.2078431, 1,
-0.3894055, 0.2459443, -0.4332604, 0, 1, 0.2156863, 1,
-0.3892013, -1.168556, -2.027697, 0, 1, 0.2196078, 1,
-0.389151, -0.7632456, -2.374368, 0, 1, 0.227451, 1,
-0.3891199, 0.71269, -0.1974443, 0, 1, 0.2313726, 1,
-0.3873171, 1.776669, -0.3415189, 0, 1, 0.2392157, 1,
-0.3841801, -0.872124, -3.632663, 0, 1, 0.2431373, 1,
-0.3840007, 0.220433, -0.54772, 0, 1, 0.2509804, 1,
-0.3821242, -0.8337498, -3.295619, 0, 1, 0.254902, 1,
-0.3758494, -1.734146, -3.038802, 0, 1, 0.2627451, 1,
-0.3693752, -0.5667719, -3.105117, 0, 1, 0.2666667, 1,
-0.3681591, -0.5771141, -1.430537, 0, 1, 0.2745098, 1,
-0.3645303, -1.725178, -2.166525, 0, 1, 0.2784314, 1,
-0.3644616, -0.2570479, -2.856942, 0, 1, 0.2862745, 1,
-0.3632859, -0.9618454, -1.813413, 0, 1, 0.2901961, 1,
-0.3531413, -0.2487415, -1.974907, 0, 1, 0.2980392, 1,
-0.349042, -0.5485917, -3.862144, 0, 1, 0.3058824, 1,
-0.347892, 0.0544654, -0.5606709, 0, 1, 0.3098039, 1,
-0.3450676, -0.3981085, -2.94832, 0, 1, 0.3176471, 1,
-0.340407, -0.3787497, -2.680628, 0, 1, 0.3215686, 1,
-0.3397541, 0.1529527, -1.129216, 0, 1, 0.3294118, 1,
-0.3394334, 0.5912307, -0.9834698, 0, 1, 0.3333333, 1,
-0.3373137, 0.6602871, -0.3106939, 0, 1, 0.3411765, 1,
-0.3356784, 1.507819, -0.5820885, 0, 1, 0.345098, 1,
-0.333736, -0.7246124, -2.200371, 0, 1, 0.3529412, 1,
-0.3336428, -0.2400351, -2.645349, 0, 1, 0.3568628, 1,
-0.3313799, 0.6089964, -0.5939723, 0, 1, 0.3647059, 1,
-0.3294857, 1.161928, 0.3756174, 0, 1, 0.3686275, 1,
-0.326437, -1.716641, -4.082805, 0, 1, 0.3764706, 1,
-0.3240899, -0.7531072, -3.884726, 0, 1, 0.3803922, 1,
-0.3221305, -0.8281766, -1.151508, 0, 1, 0.3882353, 1,
-0.3189099, -1.396729, -3.762828, 0, 1, 0.3921569, 1,
-0.3187758, 0.9430293, -2.167695, 0, 1, 0.4, 1,
-0.3164647, 0.05451792, 0.1426315, 0, 1, 0.4078431, 1,
-0.3128756, -0.3486622, -1.374843, 0, 1, 0.4117647, 1,
-0.3050418, 0.3693952, -1.478782, 0, 1, 0.4196078, 1,
-0.3028643, -1.249744, -3.834755, 0, 1, 0.4235294, 1,
-0.3025724, -1.07439, -0.02255881, 0, 1, 0.4313726, 1,
-0.3003011, 0.03624519, -1.874306, 0, 1, 0.4352941, 1,
-0.2980249, -1.317882, -2.068446, 0, 1, 0.4431373, 1,
-0.2953115, -0.7643695, -2.220698, 0, 1, 0.4470588, 1,
-0.2937163, -0.9322143, -3.520128, 0, 1, 0.454902, 1,
-0.2880356, 1.214802, 1.560555, 0, 1, 0.4588235, 1,
-0.2859243, 0.8601985, 1.5715, 0, 1, 0.4666667, 1,
-0.2857153, 0.3243363, -0.3961118, 0, 1, 0.4705882, 1,
-0.2841801, -0.1610691, -2.768631, 0, 1, 0.4784314, 1,
-0.280504, 1.276558, -0.3048604, 0, 1, 0.4823529, 1,
-0.2661034, 1.025286, -0.4430426, 0, 1, 0.4901961, 1,
-0.2567679, -0.7949113, -2.760613, 0, 1, 0.4941176, 1,
-0.2548187, 0.4491788, -1.457614, 0, 1, 0.5019608, 1,
-0.2466492, -0.1424662, -0.6792514, 0, 1, 0.509804, 1,
-0.2455805, 0.2296257, -1.098579, 0, 1, 0.5137255, 1,
-0.2439373, -0.2941598, -2.039129, 0, 1, 0.5215687, 1,
-0.2434561, -1.957793, -3.447112, 0, 1, 0.5254902, 1,
-0.2430574, -1.857041, -3.511979, 0, 1, 0.5333334, 1,
-0.2401696, 0.8445396, -0.4165383, 0, 1, 0.5372549, 1,
-0.236967, 0.5387729, -0.4585827, 0, 1, 0.5450981, 1,
-0.2365394, -0.3707908, -4.520772, 0, 1, 0.5490196, 1,
-0.2313339, 0.3842068, 1.363023, 0, 1, 0.5568628, 1,
-0.2309407, -1.630235, -2.55437, 0, 1, 0.5607843, 1,
-0.2288523, 2.350643, -0.2193821, 0, 1, 0.5686275, 1,
-0.2269232, 0.4137658, -1.483721, 0, 1, 0.572549, 1,
-0.2257149, 0.8377299, 0.3257286, 0, 1, 0.5803922, 1,
-0.2248858, 0.1849688, -1.14619, 0, 1, 0.5843138, 1,
-0.2219172, -0.1402373, -1.904601, 0, 1, 0.5921569, 1,
-0.2218446, 0.5517349, -1.261886, 0, 1, 0.5960785, 1,
-0.2215834, -0.5138418, -4.076868, 0, 1, 0.6039216, 1,
-0.2167157, -0.4544488, -2.469139, 0, 1, 0.6117647, 1,
-0.2156931, -0.5287573, -3.20226, 0, 1, 0.6156863, 1,
-0.2149085, 1.124027, -0.3907955, 0, 1, 0.6235294, 1,
-0.2138071, 0.4391027, -2.222745, 0, 1, 0.627451, 1,
-0.2118602, -0.9743319, -2.747294, 0, 1, 0.6352941, 1,
-0.2013985, -1.382951, -4.828801, 0, 1, 0.6392157, 1,
-0.2004797, 1.103394, -1.413849, 0, 1, 0.6470588, 1,
-0.1954741, 0.1129567, -2.142378, 0, 1, 0.6509804, 1,
-0.1950583, 1.443424, -1.415294, 0, 1, 0.6588235, 1,
-0.192088, 0.2828122, -1.073943, 0, 1, 0.6627451, 1,
-0.1907789, 0.5335375, -1.185246, 0, 1, 0.6705883, 1,
-0.1893446, 0.5117813, -0.2876343, 0, 1, 0.6745098, 1,
-0.1815501, -0.9017947, -3.608844, 0, 1, 0.682353, 1,
-0.1790359, 0.9401866, 0.6442902, 0, 1, 0.6862745, 1,
-0.1644596, -0.7018385, -3.412299, 0, 1, 0.6941177, 1,
-0.1635502, 0.03889226, -1.895486, 0, 1, 0.7019608, 1,
-0.1613642, -0.1273376, -0.5834796, 0, 1, 0.7058824, 1,
-0.1612705, -1.501645, -2.991183, 0, 1, 0.7137255, 1,
-0.1589923, 0.1979352, -1.340832, 0, 1, 0.7176471, 1,
-0.1558643, -1.416171, -1.515733, 0, 1, 0.7254902, 1,
-0.1530949, -0.07608526, -3.064423, 0, 1, 0.7294118, 1,
-0.1482679, -1.262625, -1.752308, 0, 1, 0.7372549, 1,
-0.1436347, 1.341306, 0.001677713, 0, 1, 0.7411765, 1,
-0.1418778, 0.5357954, -1.293761, 0, 1, 0.7490196, 1,
-0.1414433, -0.8879004, -3.435743, 0, 1, 0.7529412, 1,
-0.1387982, 0.4206505, -2.354214, 0, 1, 0.7607843, 1,
-0.1372398, 1.404217, -1.235721, 0, 1, 0.7647059, 1,
-0.1367346, 2.046417, 0.2776495, 0, 1, 0.772549, 1,
-0.1328836, -1.67097, -3.347934, 0, 1, 0.7764706, 1,
-0.1322785, -0.3717116, -2.839059, 0, 1, 0.7843137, 1,
-0.1259698, 1.385183, -0.1267038, 0, 1, 0.7882353, 1,
-0.1219804, -0.7653381, -2.398962, 0, 1, 0.7960784, 1,
-0.1180054, 0.08435992, -1.073889, 0, 1, 0.8039216, 1,
-0.1077451, -0.1926651, -3.446714, 0, 1, 0.8078431, 1,
-0.1044488, 0.2999547, -0.4643264, 0, 1, 0.8156863, 1,
-0.1006586, -1.345289, -2.832862, 0, 1, 0.8196079, 1,
-0.09920829, -0.4828369, -3.750136, 0, 1, 0.827451, 1,
-0.09296612, -2.49925, -2.120707, 0, 1, 0.8313726, 1,
-0.08171991, -0.2797126, -1.78103, 0, 1, 0.8392157, 1,
-0.0754573, 0.5029516, 0.6255445, 0, 1, 0.8431373, 1,
-0.07474295, 0.463642, 1.43013, 0, 1, 0.8509804, 1,
-0.07382043, -0.3276154, -3.982638, 0, 1, 0.854902, 1,
-0.07114713, 1.125894, 0.0729819, 0, 1, 0.8627451, 1,
-0.07032067, 0.5729828, 2.78488, 0, 1, 0.8666667, 1,
-0.06567334, 0.7448637, 0.9058927, 0, 1, 0.8745098, 1,
-0.06455938, -0.8344944, -4.202669, 0, 1, 0.8784314, 1,
-0.06261322, -0.5178161, -3.031941, 0, 1, 0.8862745, 1,
-0.05823784, -0.3992443, -1.973834, 0, 1, 0.8901961, 1,
-0.05816205, -0.03798414, -3.175181, 0, 1, 0.8980392, 1,
-0.05614787, -1.204707, -2.240009, 0, 1, 0.9058824, 1,
-0.05526736, 1.786474, -0.07985765, 0, 1, 0.9098039, 1,
-0.04499688, -0.334588, -2.725292, 0, 1, 0.9176471, 1,
-0.04400535, -0.09071176, -2.217081, 0, 1, 0.9215686, 1,
-0.04040938, 0.761372, -0.08287988, 0, 1, 0.9294118, 1,
-0.03881975, -0.3291364, -3.0053, 0, 1, 0.9333333, 1,
-0.0354216, 0.6310889, 0.9869372, 0, 1, 0.9411765, 1,
-0.02552607, 0.8914732, -0.8674517, 0, 1, 0.945098, 1,
-0.02349741, -0.2581651, -2.877853, 0, 1, 0.9529412, 1,
-0.02305334, 0.07108819, 1.478971, 0, 1, 0.9568627, 1,
-0.01492171, -0.6918197, -3.259983, 0, 1, 0.9647059, 1,
-0.01235635, -1.819096, -1.959835, 0, 1, 0.9686275, 1,
-0.01031069, 2.500778, 3.054186, 0, 1, 0.9764706, 1,
-0.009864424, 0.2611366, -0.3292793, 0, 1, 0.9803922, 1,
-0.008664348, -0.09724744, -3.564418, 0, 1, 0.9882353, 1,
-0.004643339, -0.8662117, -2.920506, 0, 1, 0.9921569, 1,
0.003557066, -0.0648219, 1.735134, 0, 1, 1, 1,
0.005904196, 0.7704577, -0.3173754, 0, 0.9921569, 1, 1,
0.006084574, 1.10988, -0.3620228, 0, 0.9882353, 1, 1,
0.006942919, 0.3251148, 0.2779114, 0, 0.9803922, 1, 1,
0.008331596, 1.014214, -0.8052764, 0, 0.9764706, 1, 1,
0.00947808, 0.6863807, -0.8579041, 0, 0.9686275, 1, 1,
0.01009926, -2.498301, 2.85951, 0, 0.9647059, 1, 1,
0.01123318, -0.4973356, 4.751785, 0, 0.9568627, 1, 1,
0.01366547, -0.1372383, 4.312032, 0, 0.9529412, 1, 1,
0.01453814, -1.980047, 4.598424, 0, 0.945098, 1, 1,
0.02063411, 1.580072, -0.8697114, 0, 0.9411765, 1, 1,
0.02161968, -0.6066206, 4.980039, 0, 0.9333333, 1, 1,
0.0241488, -0.3903266, 3.343724, 0, 0.9294118, 1, 1,
0.02878713, 0.1074617, -0.02382066, 0, 0.9215686, 1, 1,
0.0306615, 1.646635, 0.2107536, 0, 0.9176471, 1, 1,
0.0342901, -0.5366931, 2.77273, 0, 0.9098039, 1, 1,
0.03844902, 0.3449945, 0.2349811, 0, 0.9058824, 1, 1,
0.04137194, 1.436573, 0.8560423, 0, 0.8980392, 1, 1,
0.04248262, -0.009732161, 2.002596, 0, 0.8901961, 1, 1,
0.04353876, -0.02787296, 3.26693, 0, 0.8862745, 1, 1,
0.04687212, -0.03373459, 2.707285, 0, 0.8784314, 1, 1,
0.04735401, 0.1950923, 0.4253161, 0, 0.8745098, 1, 1,
0.0496892, 1.857297, -1.025279, 0, 0.8666667, 1, 1,
0.05155204, 0.9341093, -1.207745, 0, 0.8627451, 1, 1,
0.05733716, -0.04917602, 1.693503, 0, 0.854902, 1, 1,
0.06070811, -1.558224, 3.61342, 0, 0.8509804, 1, 1,
0.06177185, 0.9549831, 0.3595686, 0, 0.8431373, 1, 1,
0.06215717, -0.5019598, 1.523385, 0, 0.8392157, 1, 1,
0.06352347, 1.2519, -1.187088, 0, 0.8313726, 1, 1,
0.06362572, -0.6485159, 0.9283134, 0, 0.827451, 1, 1,
0.0654045, -0.08911129, 0.779845, 0, 0.8196079, 1, 1,
0.06715034, 1.634521, 1.012463, 0, 0.8156863, 1, 1,
0.07056718, -1.477808, 4.188653, 0, 0.8078431, 1, 1,
0.07165211, -0.5955788, 3.424088, 0, 0.8039216, 1, 1,
0.07461708, -1.044968, 1.986825, 0, 0.7960784, 1, 1,
0.07638117, 0.3483486, -2.298248, 0, 0.7882353, 1, 1,
0.07794748, 2.264004, -0.4248574, 0, 0.7843137, 1, 1,
0.08009865, -1.604139, 3.678903, 0, 0.7764706, 1, 1,
0.08419298, -0.3536664, 2.085523, 0, 0.772549, 1, 1,
0.08920438, -1.031665, 2.474835, 0, 0.7647059, 1, 1,
0.09029476, -1.716766, 3.867764, 0, 0.7607843, 1, 1,
0.09431993, 1.271266, -2.390669, 0, 0.7529412, 1, 1,
0.09455658, 1.294273, 0.215772, 0, 0.7490196, 1, 1,
0.09747641, 0.1103603, -0.6633586, 0, 0.7411765, 1, 1,
0.09872394, -1.838056, 3.17745, 0, 0.7372549, 1, 1,
0.1013497, -0.1205574, 4.26488, 0, 0.7294118, 1, 1,
0.102788, -1.322674, 3.545879, 0, 0.7254902, 1, 1,
0.1074177, 0.08218853, 0.6340436, 0, 0.7176471, 1, 1,
0.1078719, -1.16991, 3.937454, 0, 0.7137255, 1, 1,
0.1084086, 0.4674075, 0.6187991, 0, 0.7058824, 1, 1,
0.1156504, 1.183859, 2.570244, 0, 0.6980392, 1, 1,
0.1204926, 0.4211435, -0.6967969, 0, 0.6941177, 1, 1,
0.121049, 0.2362879, -0.1897997, 0, 0.6862745, 1, 1,
0.1227334, 0.3289793, 1.128045, 0, 0.682353, 1, 1,
0.1303031, 0.05720697, 2.26222, 0, 0.6745098, 1, 1,
0.1353321, -0.7551943, 2.35605, 0, 0.6705883, 1, 1,
0.1401526, 0.6929506, -1.280332, 0, 0.6627451, 1, 1,
0.140369, 0.02620144, 0.4431099, 0, 0.6588235, 1, 1,
0.1421163, -0.09826028, 3.049335, 0, 0.6509804, 1, 1,
0.1468208, -1.164084, 4.519753, 0, 0.6470588, 1, 1,
0.1489879, -1.921656, 3.270028, 0, 0.6392157, 1, 1,
0.149615, 0.1908869, -0.2748197, 0, 0.6352941, 1, 1,
0.1523685, -1.231458, 4.428229, 0, 0.627451, 1, 1,
0.1603437, 0.2225972, -0.06528018, 0, 0.6235294, 1, 1,
0.1608133, -1.216973, 2.509566, 0, 0.6156863, 1, 1,
0.1610962, -1.181275, 3.934613, 0, 0.6117647, 1, 1,
0.1691211, -1.320321, 2.375818, 0, 0.6039216, 1, 1,
0.1709149, -2.001049, 2.281634, 0, 0.5960785, 1, 1,
0.1719898, -0.8161127, 2.887394, 0, 0.5921569, 1, 1,
0.1722526, -0.485558, 2.932634, 0, 0.5843138, 1, 1,
0.1722773, 0.4101272, 1.012001, 0, 0.5803922, 1, 1,
0.1788743, -0.1896158, 2.107165, 0, 0.572549, 1, 1,
0.1817105, -0.1134345, 2.058137, 0, 0.5686275, 1, 1,
0.1818211, -0.08983725, 3.686469, 0, 0.5607843, 1, 1,
0.1820501, -0.485644, 2.319696, 0, 0.5568628, 1, 1,
0.1833717, 1.605977, -0.3008721, 0, 0.5490196, 1, 1,
0.1836538, 1.878465, -0.6796572, 0, 0.5450981, 1, 1,
0.1842954, -0.5740292, 3.961598, 0, 0.5372549, 1, 1,
0.1924598, 0.239438, -0.2712263, 0, 0.5333334, 1, 1,
0.1966117, 1.100205, -0.1165794, 0, 0.5254902, 1, 1,
0.2032956, 1.074616, 2.452928, 0, 0.5215687, 1, 1,
0.2110949, 0.09076454, -1.215915, 0, 0.5137255, 1, 1,
0.2146642, -1.578134, 0.762745, 0, 0.509804, 1, 1,
0.2170111, 0.5960021, 0.6072267, 0, 0.5019608, 1, 1,
0.2176716, 2.042119, -0.5069491, 0, 0.4941176, 1, 1,
0.2221573, 0.222574, 3.230214, 0, 0.4901961, 1, 1,
0.2266922, -1.136233, 2.480191, 0, 0.4823529, 1, 1,
0.2288639, 0.08574577, 0.5088952, 0, 0.4784314, 1, 1,
0.2306351, -1.476309, 1.405481, 0, 0.4705882, 1, 1,
0.2311655, -0.386001, 2.77796, 0, 0.4666667, 1, 1,
0.2328973, -0.1420944, 3.220984, 0, 0.4588235, 1, 1,
0.2332605, -0.1735912, 1.746962, 0, 0.454902, 1, 1,
0.2352747, -2.562364, 2.854242, 0, 0.4470588, 1, 1,
0.2354236, 1.152233, 0.4008495, 0, 0.4431373, 1, 1,
0.2382159, 0.6968246, 0.813253, 0, 0.4352941, 1, 1,
0.238273, 0.2891941, 0.6680698, 0, 0.4313726, 1, 1,
0.2392165, 0.870986, -0.7505705, 0, 0.4235294, 1, 1,
0.2393467, -0.620711, 4.268389, 0, 0.4196078, 1, 1,
0.2417466, -2.951866, 3.386584, 0, 0.4117647, 1, 1,
0.2454685, 1.493391, 0.08624572, 0, 0.4078431, 1, 1,
0.2484064, -0.6782281, 3.484052, 0, 0.4, 1, 1,
0.2497182, 0.5837458, -0.7948316, 0, 0.3921569, 1, 1,
0.2510947, -1.571757, 2.402467, 0, 0.3882353, 1, 1,
0.2518093, -0.5266293, 4.97154, 0, 0.3803922, 1, 1,
0.255918, 0.9166645, -0.1307886, 0, 0.3764706, 1, 1,
0.2589019, -0.1243106, 2.062822, 0, 0.3686275, 1, 1,
0.2592703, -0.9790686, 2.465782, 0, 0.3647059, 1, 1,
0.2625687, -1.000141, 1.895617, 0, 0.3568628, 1, 1,
0.2646518, 1.877008, 1.426286, 0, 0.3529412, 1, 1,
0.2663721, 0.0938782, 0.6447504, 0, 0.345098, 1, 1,
0.2678481, -0.7533571, 3.852749, 0, 0.3411765, 1, 1,
0.2694419, -0.6769721, 1.332016, 0, 0.3333333, 1, 1,
0.2707928, 0.3993253, 0.928262, 0, 0.3294118, 1, 1,
0.2723444, -0.9900587, 2.769911, 0, 0.3215686, 1, 1,
0.2723813, -0.6463786, 3.180346, 0, 0.3176471, 1, 1,
0.2810513, -0.4935549, 2.824474, 0, 0.3098039, 1, 1,
0.2818336, -1.038711, 3.626251, 0, 0.3058824, 1, 1,
0.2830358, -0.5960884, 1.777975, 0, 0.2980392, 1, 1,
0.2838404, -0.04909437, -0.5780129, 0, 0.2901961, 1, 1,
0.2839925, -0.03418703, 1.978939, 0, 0.2862745, 1, 1,
0.285264, -0.1578221, 1.360427, 0, 0.2784314, 1, 1,
0.2855599, -1.671486, 3.007767, 0, 0.2745098, 1, 1,
0.2881175, 1.409995, 0.05547545, 0, 0.2666667, 1, 1,
0.2892029, 0.4421242, 0.5172833, 0, 0.2627451, 1, 1,
0.2916097, -0.206619, 1.585247, 0, 0.254902, 1, 1,
0.2916216, 0.5666, 0.1445401, 0, 0.2509804, 1, 1,
0.2923974, 0.3501201, 1.242519, 0, 0.2431373, 1, 1,
0.2927854, -0.2171734, 1.781191, 0, 0.2392157, 1, 1,
0.293004, 0.110812, 1.407659, 0, 0.2313726, 1, 1,
0.2937002, 1.276563, -0.4780039, 0, 0.227451, 1, 1,
0.2966632, 1.73145, 0.6405185, 0, 0.2196078, 1, 1,
0.298622, 0.581399, -0.2059983, 0, 0.2156863, 1, 1,
0.3022786, 0.7643078, -0.5156857, 0, 0.2078431, 1, 1,
0.3032528, 1.225725, 0.543979, 0, 0.2039216, 1, 1,
0.3104866, 0.9008415, 0.6171544, 0, 0.1960784, 1, 1,
0.3122536, 0.6037833, 0.1857943, 0, 0.1882353, 1, 1,
0.3142317, 0.7502716, -0.7505778, 0, 0.1843137, 1, 1,
0.3149014, -0.471278, 1.616966, 0, 0.1764706, 1, 1,
0.3171053, -0.7876952, 2.66042, 0, 0.172549, 1, 1,
0.3177003, -0.0706519, 1.58866, 0, 0.1647059, 1, 1,
0.3268777, -0.5950271, 2.25708, 0, 0.1607843, 1, 1,
0.3286374, -1.233337, 2.995353, 0, 0.1529412, 1, 1,
0.3375586, 0.91501, 1.099336, 0, 0.1490196, 1, 1,
0.3557754, -0.4164763, 3.735612, 0, 0.1411765, 1, 1,
0.3624096, -0.1226767, 2.626554, 0, 0.1372549, 1, 1,
0.3665467, -0.5178983, 3.093776, 0, 0.1294118, 1, 1,
0.3698632, 0.6517091, -0.918425, 0, 0.1254902, 1, 1,
0.3712242, 0.9752526, 1.65085, 0, 0.1176471, 1, 1,
0.3712474, -0.1417008, 2.07958, 0, 0.1137255, 1, 1,
0.3735834, -0.9645769, 2.635337, 0, 0.1058824, 1, 1,
0.3758307, 1.063163, -1.671609, 0, 0.09803922, 1, 1,
0.3796566, 1.038447, 0.4651487, 0, 0.09411765, 1, 1,
0.3807775, 1.279162, 1.705694, 0, 0.08627451, 1, 1,
0.383702, 1.423518, -0.6403786, 0, 0.08235294, 1, 1,
0.3867553, -1.085375, 2.666384, 0, 0.07450981, 1, 1,
0.3946022, 0.3192454, 1.807623, 0, 0.07058824, 1, 1,
0.3999747, 0.4921097, 0.7077067, 0, 0.0627451, 1, 1,
0.4103454, -0.2103191, 1.649466, 0, 0.05882353, 1, 1,
0.4118313, -0.5753641, 3.059314, 0, 0.05098039, 1, 1,
0.4141845, -1.063508, 2.930959, 0, 0.04705882, 1, 1,
0.4148435, -0.3801781, 3.365069, 0, 0.03921569, 1, 1,
0.4180103, -1.160446, 2.088079, 0, 0.03529412, 1, 1,
0.4187609, 1.870431, 0.977928, 0, 0.02745098, 1, 1,
0.4214479, -0.2277706, 3.277681, 0, 0.02352941, 1, 1,
0.4215566, -0.8918935, 3.315858, 0, 0.01568628, 1, 1,
0.4239624, 2.025756, -1.961993, 0, 0.01176471, 1, 1,
0.4274647, 1.74486, 0.4807497, 0, 0.003921569, 1, 1,
0.4283529, -1.512942, 2.376136, 0.003921569, 0, 1, 1,
0.4323763, 0.9685705, 1.815763, 0.007843138, 0, 1, 1,
0.4328109, 0.712669, 2.564491, 0.01568628, 0, 1, 1,
0.4368793, -0.3708981, 1.45619, 0.01960784, 0, 1, 1,
0.4371279, 0.1426617, 0.7116392, 0.02745098, 0, 1, 1,
0.4384858, -1.92535, 2.816144, 0.03137255, 0, 1, 1,
0.438944, -1.814375, 3.881881, 0.03921569, 0, 1, 1,
0.4407825, 1.308687, -0.8579298, 0.04313726, 0, 1, 1,
0.4417776, 0.4436356, 0.9493392, 0.05098039, 0, 1, 1,
0.4426532, -0.6638908, 3.127702, 0.05490196, 0, 1, 1,
0.4449004, -2.948974, 4.127829, 0.0627451, 0, 1, 1,
0.4485084, 0.4773258, 0.2704458, 0.06666667, 0, 1, 1,
0.4498039, 2.651148, 1.788525, 0.07450981, 0, 1, 1,
0.4506897, -0.5680715, 3.778137, 0.07843138, 0, 1, 1,
0.4569809, 0.534514, 1.540392, 0.08627451, 0, 1, 1,
0.4637508, -0.264646, 0.06485856, 0.09019608, 0, 1, 1,
0.4643803, 0.03924292, 2.015613, 0.09803922, 0, 1, 1,
0.4668278, -0.8585473, 3.240257, 0.1058824, 0, 1, 1,
0.4668659, 2.871143, 0.5264688, 0.1098039, 0, 1, 1,
0.4725878, -0.2833023, 2.580577, 0.1176471, 0, 1, 1,
0.4729979, 0.4365721, -1.048091, 0.1215686, 0, 1, 1,
0.4760016, -2.034481, 3.11873, 0.1294118, 0, 1, 1,
0.4816199, -0.6847235, 2.24114, 0.1333333, 0, 1, 1,
0.4839496, -1.752033, 2.178377, 0.1411765, 0, 1, 1,
0.4918029, 0.9589252, 0.4020158, 0.145098, 0, 1, 1,
0.4943144, -0.584294, 1.545084, 0.1529412, 0, 1, 1,
0.4953859, 0.6618217, 1.481574, 0.1568628, 0, 1, 1,
0.4967298, -0.2006229, 2.505438, 0.1647059, 0, 1, 1,
0.5036851, -0.3344909, 2.833461, 0.1686275, 0, 1, 1,
0.5127639, -0.1990233, 2.32458, 0.1764706, 0, 1, 1,
0.5132399, 0.4232941, 1.427836, 0.1803922, 0, 1, 1,
0.5133686, -1.184678, 4.173457, 0.1882353, 0, 1, 1,
0.5158478, -2.386218, 3.133921, 0.1921569, 0, 1, 1,
0.5158721, 0.5969063, 0.1027578, 0.2, 0, 1, 1,
0.5159206, -0.2317386, 3.141836, 0.2078431, 0, 1, 1,
0.5187297, -1.223199, 1.761587, 0.2117647, 0, 1, 1,
0.5285351, -0.2711245, 0.4118345, 0.2196078, 0, 1, 1,
0.5370839, 0.5921906, 2.090251, 0.2235294, 0, 1, 1,
0.5377793, -0.03075383, 1.523093, 0.2313726, 0, 1, 1,
0.5464262, -0.1798247, 1.81365, 0.2352941, 0, 1, 1,
0.5465524, 0.3825107, 1.955122, 0.2431373, 0, 1, 1,
0.5491092, 1.437581, 1.714858, 0.2470588, 0, 1, 1,
0.5491183, -0.2559204, 2.276018, 0.254902, 0, 1, 1,
0.5494397, 0.2925245, 0.7616835, 0.2588235, 0, 1, 1,
0.551464, -0.1011885, 2.399026, 0.2666667, 0, 1, 1,
0.5527009, 0.8054487, 1.969301, 0.2705882, 0, 1, 1,
0.5532566, 1.330647, -0.4694108, 0.2784314, 0, 1, 1,
0.5597261, -1.701645, 2.198867, 0.282353, 0, 1, 1,
0.5605909, -1.927636, 4.723131, 0.2901961, 0, 1, 1,
0.5736546, -0.07136543, 0.8351406, 0.2941177, 0, 1, 1,
0.5736834, -1.294427, 1.40696, 0.3019608, 0, 1, 1,
0.5739441, 0.8407502, 1.311605, 0.3098039, 0, 1, 1,
0.5748911, -0.4382997, 2.462446, 0.3137255, 0, 1, 1,
0.5748915, 0.3122582, -0.3023103, 0.3215686, 0, 1, 1,
0.5755575, -1.711789, 3.27593, 0.3254902, 0, 1, 1,
0.5778436, 0.5858831, 0.04337173, 0.3333333, 0, 1, 1,
0.5787563, 1.844143, -0.4656639, 0.3372549, 0, 1, 1,
0.5794759, -0.8361548, 2.339135, 0.345098, 0, 1, 1,
0.5842972, 0.9454266, -0.7751449, 0.3490196, 0, 1, 1,
0.5856509, -1.196775, 1.912864, 0.3568628, 0, 1, 1,
0.5893672, -0.5836519, 2.524144, 0.3607843, 0, 1, 1,
0.5933028, 0.5935323, 1.021435, 0.3686275, 0, 1, 1,
0.598914, -1.958407, 2.766722, 0.372549, 0, 1, 1,
0.5998065, 0.006232042, 1.900421, 0.3803922, 0, 1, 1,
0.6001841, -1.443083, 2.339913, 0.3843137, 0, 1, 1,
0.6015994, 1.341717, 0.87886, 0.3921569, 0, 1, 1,
0.6018589, -0.3721368, 2.846472, 0.3960784, 0, 1, 1,
0.6024972, -1.186125, 3.242407, 0.4039216, 0, 1, 1,
0.608169, 1.342777, 0.2611408, 0.4117647, 0, 1, 1,
0.6087692, 0.07989429, 1.773193, 0.4156863, 0, 1, 1,
0.611953, -0.9008279, 2.500248, 0.4235294, 0, 1, 1,
0.6134647, 0.8380874, 1.13051, 0.427451, 0, 1, 1,
0.6222552, 1.04268, -1.015327, 0.4352941, 0, 1, 1,
0.6318169, 0.6319789, 0.4205081, 0.4392157, 0, 1, 1,
0.6359722, -1.024428, 4.219458, 0.4470588, 0, 1, 1,
0.6369315, -1.344182, 3.946702, 0.4509804, 0, 1, 1,
0.6413186, -0.1222359, 1.129651, 0.4588235, 0, 1, 1,
0.6426885, 0.4977756, 1.598804, 0.4627451, 0, 1, 1,
0.6450255, 0.02918692, -0.1053995, 0.4705882, 0, 1, 1,
0.6473543, 0.170645, 0.8533628, 0.4745098, 0, 1, 1,
0.6509086, -0.06066786, 1.551891, 0.4823529, 0, 1, 1,
0.6552277, 0.9594359, -0.03892222, 0.4862745, 0, 1, 1,
0.6602629, -2.606387, 2.170206, 0.4941176, 0, 1, 1,
0.6615288, 1.870105, 1.458211, 0.5019608, 0, 1, 1,
0.6629524, 3.014283, 0.1275048, 0.5058824, 0, 1, 1,
0.666591, -0.6386766, 2.458548, 0.5137255, 0, 1, 1,
0.6691239, -0.2158223, 2.909465, 0.5176471, 0, 1, 1,
0.6724796, 0.4941683, 3.248771, 0.5254902, 0, 1, 1,
0.6731694, -0.02771808, 2.431625, 0.5294118, 0, 1, 1,
0.6815543, -1.504249, 4.05103, 0.5372549, 0, 1, 1,
0.6829207, 1.583401, 0.2289723, 0.5411765, 0, 1, 1,
0.6841402, -0.06003243, 1.343434, 0.5490196, 0, 1, 1,
0.6841692, 1.182277, 0.4271784, 0.5529412, 0, 1, 1,
0.6877274, -0.6394632, 2.719688, 0.5607843, 0, 1, 1,
0.6918724, 0.7571428, -0.4896582, 0.5647059, 0, 1, 1,
0.6922378, -1.283376, 1.303992, 0.572549, 0, 1, 1,
0.6946691, 0.6251587, -0.08768927, 0.5764706, 0, 1, 1,
0.7023901, 0.1920925, 1.131309, 0.5843138, 0, 1, 1,
0.7085404, -0.222926, 1.34967, 0.5882353, 0, 1, 1,
0.712472, -0.4371863, 0.4716919, 0.5960785, 0, 1, 1,
0.713914, 0.1807931, 2.14395, 0.6039216, 0, 1, 1,
0.7187851, -0.6665027, 1.051641, 0.6078432, 0, 1, 1,
0.7249081, 0.5453463, 1.239953, 0.6156863, 0, 1, 1,
0.7264822, 0.1687646, 1.829348, 0.6196079, 0, 1, 1,
0.7294295, 0.4473448, 1.421973, 0.627451, 0, 1, 1,
0.7411824, -0.7986524, 0.7407141, 0.6313726, 0, 1, 1,
0.7424216, -1.70255, 1.921276, 0.6392157, 0, 1, 1,
0.748579, 1.148039, 0.5527316, 0.6431373, 0, 1, 1,
0.7514304, 0.1295414, 2.478922, 0.6509804, 0, 1, 1,
0.7580111, 0.589116, -0.2196781, 0.654902, 0, 1, 1,
0.7627835, 1.02754, 1.263864, 0.6627451, 0, 1, 1,
0.7663125, 1.006576, 0.6845127, 0.6666667, 0, 1, 1,
0.7693036, -0.8175054, 3.61616, 0.6745098, 0, 1, 1,
0.7694585, 0.5310222, 0.8671824, 0.6784314, 0, 1, 1,
0.7727401, -0.4560342, 1.040042, 0.6862745, 0, 1, 1,
0.7734202, -0.2576759, 2.530537, 0.6901961, 0, 1, 1,
0.7783108, -0.1708132, 0.7453221, 0.6980392, 0, 1, 1,
0.7787767, -1.813044, 4.370243, 0.7058824, 0, 1, 1,
0.7801613, -0.2246896, 0.8151738, 0.7098039, 0, 1, 1,
0.7870693, 0.6274258, 1.663635, 0.7176471, 0, 1, 1,
0.7938521, -0.9453426, 2.630261, 0.7215686, 0, 1, 1,
0.7956046, 0.1561987, 1.056798, 0.7294118, 0, 1, 1,
0.7986988, -1.857538, 3.369014, 0.7333333, 0, 1, 1,
0.8030856, 0.06022364, 0.3258179, 0.7411765, 0, 1, 1,
0.8063, 0.5019669, 1.140734, 0.7450981, 0, 1, 1,
0.8076667, -1.647169, 3.288434, 0.7529412, 0, 1, 1,
0.8079045, 1.489332, 1.123762, 0.7568628, 0, 1, 1,
0.8089845, -0.1304697, 1.321491, 0.7647059, 0, 1, 1,
0.8093463, -0.3264539, 1.325949, 0.7686275, 0, 1, 1,
0.80953, -0.6896564, 1.829106, 0.7764706, 0, 1, 1,
0.8098768, 0.1732738, 0.4885661, 0.7803922, 0, 1, 1,
0.8135136, -1.74154, 2.398491, 0.7882353, 0, 1, 1,
0.8150386, -0.06794559, 1.155138, 0.7921569, 0, 1, 1,
0.8168809, 0.2107785, 1.314174, 0.8, 0, 1, 1,
0.8186471, -0.2441351, 0.1569023, 0.8078431, 0, 1, 1,
0.8187105, 1.72978, 0.2828605, 0.8117647, 0, 1, 1,
0.8193333, -0.7369232, 2.683006, 0.8196079, 0, 1, 1,
0.8250036, 0.02299935, 0.6668164, 0.8235294, 0, 1, 1,
0.8253877, 1.62159, 1.954963, 0.8313726, 0, 1, 1,
0.8287043, 0.5749742, 3.319088, 0.8352941, 0, 1, 1,
0.8287739, 1.045928, 1.688201, 0.8431373, 0, 1, 1,
0.8292418, 1.290775, 2.427555, 0.8470588, 0, 1, 1,
0.8335535, -1.652436, 2.177713, 0.854902, 0, 1, 1,
0.8390291, 0.9436575, 0.6522713, 0.8588235, 0, 1, 1,
0.8394593, -1.176161, 3.383031, 0.8666667, 0, 1, 1,
0.8473758, 1.290508, -0.6369095, 0.8705882, 0, 1, 1,
0.8572556, -0.8865542, 2.021921, 0.8784314, 0, 1, 1,
0.8639169, 0.8215702, 1.264796, 0.8823529, 0, 1, 1,
0.8665344, 0.9240813, 1.982261, 0.8901961, 0, 1, 1,
0.87954, 1.140923, 0.2976511, 0.8941177, 0, 1, 1,
0.8835599, 0.26013, 1.042157, 0.9019608, 0, 1, 1,
0.8851199, 1.085372, 0.2865447, 0.9098039, 0, 1, 1,
0.8868114, 0.915696, 1.618599, 0.9137255, 0, 1, 1,
0.8879462, 0.9445235, -0.577756, 0.9215686, 0, 1, 1,
0.8887332, -0.555501, 0.8679036, 0.9254902, 0, 1, 1,
0.8915042, 0.599375, 2.592101, 0.9333333, 0, 1, 1,
0.8932586, 0.599614, 0.524553, 0.9372549, 0, 1, 1,
0.9023663, -1.700021, 1.995293, 0.945098, 0, 1, 1,
0.9049206, -0.1358943, 3.092758, 0.9490196, 0, 1, 1,
0.9065694, -1.766905, 3.101255, 0.9568627, 0, 1, 1,
0.9098243, 0.7172929, 2.442945, 0.9607843, 0, 1, 1,
0.9101709, 1.463353, 1.375141, 0.9686275, 0, 1, 1,
0.9149656, 0.03461399, -0.3435772, 0.972549, 0, 1, 1,
0.918906, -0.9681605, 2.884443, 0.9803922, 0, 1, 1,
0.9228038, 0.6617335, 1.611031, 0.9843137, 0, 1, 1,
0.9250638, 0.005597725, 0.529274, 0.9921569, 0, 1, 1,
0.9254509, -0.5835746, 3.63393, 0.9960784, 0, 1, 1,
0.9261649, 0.2789416, 1.588777, 1, 0, 0.9960784, 1,
0.9261707, -0.1807933, 2.280927, 1, 0, 0.9882353, 1,
0.9304277, 0.06027808, 1.484814, 1, 0, 0.9843137, 1,
0.9312276, 0.1851903, 1.935808, 1, 0, 0.9764706, 1,
0.9363195, 1.989128, 0.2210536, 1, 0, 0.972549, 1,
0.936431, -0.7429907, 3.686365, 1, 0, 0.9647059, 1,
0.9373263, -0.00582436, -0.03768134, 1, 0, 0.9607843, 1,
0.9409177, 0.490635, 1.181605, 1, 0, 0.9529412, 1,
0.9421075, 0.2932133, 0.6569358, 1, 0, 0.9490196, 1,
0.9677535, 0.1998799, 0.881478, 1, 0, 0.9411765, 1,
0.9707783, -0.7388234, 2.246518, 1, 0, 0.9372549, 1,
0.9710072, -1.712527, 2.029434, 1, 0, 0.9294118, 1,
0.9742352, 1.049156, 0.1219829, 1, 0, 0.9254902, 1,
0.9841738, -1.866855, 2.408945, 1, 0, 0.9176471, 1,
0.9916821, -0.1997781, 2.972118, 1, 0, 0.9137255, 1,
0.992699, 0.1604682, 2.211338, 1, 0, 0.9058824, 1,
0.9962645, -1.248773, 2.060257, 1, 0, 0.9019608, 1,
0.9995149, 0.7356346, 1.456376, 1, 0, 0.8941177, 1,
1.003804, -0.1519059, 1.249114, 1, 0, 0.8862745, 1,
1.004675, 0.2283784, 2.438242, 1, 0, 0.8823529, 1,
1.015769, 0.1274634, 2.855521, 1, 0, 0.8745098, 1,
1.0213, 0.734776, 1.520539, 1, 0, 0.8705882, 1,
1.032545, -0.2104224, 0.889872, 1, 0, 0.8627451, 1,
1.033312, -0.671155, 1.103063, 1, 0, 0.8588235, 1,
1.039247, 0.6397786, 2.602748, 1, 0, 0.8509804, 1,
1.046223, -1.697176, 3.058606, 1, 0, 0.8470588, 1,
1.048875, -0.06900965, 1.220293, 1, 0, 0.8392157, 1,
1.049007, -0.3658121, 2.637428, 1, 0, 0.8352941, 1,
1.052746, 0.3056003, -1.323469, 1, 0, 0.827451, 1,
1.053253, -1.210468, 2.729593, 1, 0, 0.8235294, 1,
1.054545, 0.9617288, 0.4172169, 1, 0, 0.8156863, 1,
1.055833, -0.6591907, 1.762831, 1, 0, 0.8117647, 1,
1.057941, 0.1247547, 3.454217, 1, 0, 0.8039216, 1,
1.061472, 0.4244095, 1.127505, 1, 0, 0.7960784, 1,
1.061724, 1.652201, -1.498219, 1, 0, 0.7921569, 1,
1.083601, -1.332675, 2.694579, 1, 0, 0.7843137, 1,
1.084338, 1.79941, 1.50985, 1, 0, 0.7803922, 1,
1.087848, -1.177903, 0.6936061, 1, 0, 0.772549, 1,
1.111617, 0.3838399, 1.771179, 1, 0, 0.7686275, 1,
1.113281, -0.03991057, 1.851311, 1, 0, 0.7607843, 1,
1.122387, -0.5469427, 2.454318, 1, 0, 0.7568628, 1,
1.129654, 0.3623567, 1.418436, 1, 0, 0.7490196, 1,
1.138381, 0.2365093, 2.055333, 1, 0, 0.7450981, 1,
1.146277, 1.145622, -0.9302038, 1, 0, 0.7372549, 1,
1.149215, 0.4851128, 0.1273766, 1, 0, 0.7333333, 1,
1.16892, -0.1104158, 1.525622, 1, 0, 0.7254902, 1,
1.173855, 1.153954, 0.7179929, 1, 0, 0.7215686, 1,
1.191581, 0.4191316, 0.1877532, 1, 0, 0.7137255, 1,
1.215151, 1.044336, -0.06387392, 1, 0, 0.7098039, 1,
1.215376, 1.789084, -0.6445013, 1, 0, 0.7019608, 1,
1.216449, 0.6855559, 1.487575, 1, 0, 0.6941177, 1,
1.224729, 0.4228137, 0.8528539, 1, 0, 0.6901961, 1,
1.226189, 0.05205448, 0.9222524, 1, 0, 0.682353, 1,
1.230393, 0.5218759, 1.29949, 1, 0, 0.6784314, 1,
1.238301, -0.6616193, 1.672476, 1, 0, 0.6705883, 1,
1.247146, 0.1224401, 0.9851321, 1, 0, 0.6666667, 1,
1.257615, 1.659573, 1.620518, 1, 0, 0.6588235, 1,
1.263411, -0.6422821, 1.996648, 1, 0, 0.654902, 1,
1.268496, -0.9327121, 2.988461, 1, 0, 0.6470588, 1,
1.27218, -0.4205666, 1.09514, 1, 0, 0.6431373, 1,
1.281246, -1.074384, 3.076738, 1, 0, 0.6352941, 1,
1.282558, 0.445087, 0.1976766, 1, 0, 0.6313726, 1,
1.284548, -0.1853657, 1.187732, 1, 0, 0.6235294, 1,
1.293571, -0.5820953, 3.509433, 1, 0, 0.6196079, 1,
1.297945, 0.5387027, 1.010473, 1, 0, 0.6117647, 1,
1.30462, -1.205299, 1.595661, 1, 0, 0.6078432, 1,
1.317429, -0.5710888, 1.170485, 1, 0, 0.6, 1,
1.332713, -1.237246, 2.766798, 1, 0, 0.5921569, 1,
1.337401, -0.9053745, 4.49092, 1, 0, 0.5882353, 1,
1.338715, 0.4290805, -0.1253667, 1, 0, 0.5803922, 1,
1.349012, -0.5157783, 2.689222, 1, 0, 0.5764706, 1,
1.350163, -1.864978, 1.626846, 1, 0, 0.5686275, 1,
1.35766, -0.1546332, 1.763385, 1, 0, 0.5647059, 1,
1.367777, -0.7399971, 3.316949, 1, 0, 0.5568628, 1,
1.37581, 0.6952801, 0.2973019, 1, 0, 0.5529412, 1,
1.388447, 1.4119, 2.642414, 1, 0, 0.5450981, 1,
1.389382, 0.5724297, 0.6281816, 1, 0, 0.5411765, 1,
1.397197, -0.8878286, 1.503426, 1, 0, 0.5333334, 1,
1.413817, -1.40402, 0.9433119, 1, 0, 0.5294118, 1,
1.418688, -1.084294, 1.870161, 1, 0, 0.5215687, 1,
1.427976, 1.286364, 1.436212, 1, 0, 0.5176471, 1,
1.437287, 1.072554, 0.1891177, 1, 0, 0.509804, 1,
1.452586, -1.126031, 0.8849224, 1, 0, 0.5058824, 1,
1.452602, -0.3114234, 1.51527, 1, 0, 0.4980392, 1,
1.454968, -2.005209, 3.52818, 1, 0, 0.4901961, 1,
1.473968, -0.6697034, 2.132665, 1, 0, 0.4862745, 1,
1.474385, -0.622548, 3.282071, 1, 0, 0.4784314, 1,
1.484683, -0.6311839, 0.8815219, 1, 0, 0.4745098, 1,
1.487821, -0.6905912, 1.368416, 1, 0, 0.4666667, 1,
1.491381, -0.9568633, 0.9497902, 1, 0, 0.4627451, 1,
1.496103, -0.7589251, 1.499139, 1, 0, 0.454902, 1,
1.499985, -0.4735497, 1.238568, 1, 0, 0.4509804, 1,
1.506167, -0.6002887, 2.068242, 1, 0, 0.4431373, 1,
1.507718, 0.3847997, 2.362455, 1, 0, 0.4392157, 1,
1.508361, 2.817532, -1.358608, 1, 0, 0.4313726, 1,
1.513922, 2.036497, -0.634027, 1, 0, 0.427451, 1,
1.521794, 0.9197052, 1.278145, 1, 0, 0.4196078, 1,
1.526381, -0.09368356, 0.7787232, 1, 0, 0.4156863, 1,
1.530641, 0.5334221, -0.8886141, 1, 0, 0.4078431, 1,
1.539455, 0.2212683, 2.019415, 1, 0, 0.4039216, 1,
1.55155, 0.2267262, 1.458131, 1, 0, 0.3960784, 1,
1.561864, 2.379655, 1.847279, 1, 0, 0.3882353, 1,
1.56747, 0.4463094, 3.349874, 1, 0, 0.3843137, 1,
1.580235, -0.2019195, 2.904853, 1, 0, 0.3764706, 1,
1.603165, 0.218944, 1.603939, 1, 0, 0.372549, 1,
1.612094, 0.4993725, 1.93872, 1, 0, 0.3647059, 1,
1.628335, 0.9189016, 0.03545369, 1, 0, 0.3607843, 1,
1.63583, -0.01210472, -0.9659556, 1, 0, 0.3529412, 1,
1.643505, 0.2113265, 4.273118, 1, 0, 0.3490196, 1,
1.645427, 1.426856, 1.520752, 1, 0, 0.3411765, 1,
1.665511, -1.040888, 1.996355, 1, 0, 0.3372549, 1,
1.681254, -1.719579, 2.018562, 1, 0, 0.3294118, 1,
1.686621, 0.116256, 2.098188, 1, 0, 0.3254902, 1,
1.690394, 1.330195, 2.321191, 1, 0, 0.3176471, 1,
1.691799, 0.3397308, 0.8555609, 1, 0, 0.3137255, 1,
1.703939, 1.113767, 1.370214, 1, 0, 0.3058824, 1,
1.713069, -0.8323806, 1.546347, 1, 0, 0.2980392, 1,
1.725094, 0.2333097, 0.5562967, 1, 0, 0.2941177, 1,
1.739918, -1.637839, 0.4656038, 1, 0, 0.2862745, 1,
1.748782, 0.9023969, 2.552864, 1, 0, 0.282353, 1,
1.75013, -2.874133, 3.26603, 1, 0, 0.2745098, 1,
1.760491, -0.2245109, 0.7690733, 1, 0, 0.2705882, 1,
1.762146, -2.266273, 2.616298, 1, 0, 0.2627451, 1,
1.778847, 1.675249, 0.4861239, 1, 0, 0.2588235, 1,
1.801741, -0.1833259, 1.42045, 1, 0, 0.2509804, 1,
1.806405, -0.6227827, 2.617594, 1, 0, 0.2470588, 1,
1.813898, -0.08316074, 0.2149497, 1, 0, 0.2392157, 1,
1.840527, 0.08847994, 1.279864, 1, 0, 0.2352941, 1,
1.850793, -0.114019, 0.262137, 1, 0, 0.227451, 1,
1.860294, 0.1491733, 2.317478, 1, 0, 0.2235294, 1,
1.899545, -0.2433793, 0.2044974, 1, 0, 0.2156863, 1,
1.91177, -0.1634297, 1.86261, 1, 0, 0.2117647, 1,
1.924322, -1.693805, -0.5476757, 1, 0, 0.2039216, 1,
1.927678, 1.334941, -0.2654389, 1, 0, 0.1960784, 1,
1.936492, 0.1714178, 0.904321, 1, 0, 0.1921569, 1,
1.965215, -0.8481402, 4.291621, 1, 0, 0.1843137, 1,
1.966151, -1.085055, 2.228145, 1, 0, 0.1803922, 1,
1.9708, -0.539045, 2.654685, 1, 0, 0.172549, 1,
1.981937, 0.7139713, 1.90837, 1, 0, 0.1686275, 1,
1.987369, 0.7081167, 0.7678631, 1, 0, 0.1607843, 1,
1.99369, -1.211485, 1.817073, 1, 0, 0.1568628, 1,
1.995489, -0.2781427, 1.840221, 1, 0, 0.1490196, 1,
2.017636, 0.3006586, 0.9479925, 1, 0, 0.145098, 1,
2.027198, -0.2413547, 2.232658, 1, 0, 0.1372549, 1,
2.032899, -0.1248479, 3.97863, 1, 0, 0.1333333, 1,
2.03811, -0.6237916, 2.52794, 1, 0, 0.1254902, 1,
2.070208, 1.517975, -1.325502, 1, 0, 0.1215686, 1,
2.082393, 0.5670399, 0.5283207, 1, 0, 0.1137255, 1,
2.106938, 0.8607138, 0.09056803, 1, 0, 0.1098039, 1,
2.121327, 0.341689, 2.456516, 1, 0, 0.1019608, 1,
2.157218, -0.901909, 1.964442, 1, 0, 0.09411765, 1,
2.198952, 0.1800813, 2.051833, 1, 0, 0.09019608, 1,
2.214337, -1.893314, 2.395925, 1, 0, 0.08235294, 1,
2.251803, -0.9803597, 1.796458, 1, 0, 0.07843138, 1,
2.273628, 0.9345815, 1.682399, 1, 0, 0.07058824, 1,
2.280087, -0.111386, 0.940675, 1, 0, 0.06666667, 1,
2.297634, 0.6556768, -0.2363773, 1, 0, 0.05882353, 1,
2.334627, -0.143814, 3.764, 1, 0, 0.05490196, 1,
2.377077, -0.3024807, -0.5348905, 1, 0, 0.04705882, 1,
2.474163, 2.192878, 1.667558, 1, 0, 0.04313726, 1,
2.517457, 0.1922652, 1.628322, 1, 0, 0.03529412, 1,
2.588239, -0.2037879, 2.781285, 1, 0, 0.03137255, 1,
2.696819, 0.5909417, 1.384952, 1, 0, 0.02352941, 1,
2.787166, 0.4412016, 0.6883626, 1, 0, 0.01960784, 1,
2.961878, -0.5634986, 1.717528, 1, 0, 0.01176471, 1,
3.465358, 1.433666, 1.026773, 1, 0, 0.007843138, 1
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
0.1324281, -3.980709, -6.491399, 0, -0.5, 0.5, 0.5,
0.1324281, -3.980709, -6.491399, 1, -0.5, 0.5, 0.5,
0.1324281, -3.980709, -6.491399, 1, 1.5, 0.5, 0.5,
0.1324281, -3.980709, -6.491399, 0, 1.5, 0.5, 0.5
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
-4.330366, 0.08307064, -6.491399, 0, -0.5, 0.5, 0.5,
-4.330366, 0.08307064, -6.491399, 1, -0.5, 0.5, 0.5,
-4.330366, 0.08307064, -6.491399, 1, 1.5, 0.5, 0.5,
-4.330366, 0.08307064, -6.491399, 0, 1.5, 0.5, 0.5
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
-4.330366, -3.980709, 0.07561922, 0, -0.5, 0.5, 0.5,
-4.330366, -3.980709, 0.07561922, 1, -0.5, 0.5, 0.5,
-4.330366, -3.980709, 0.07561922, 1, 1.5, 0.5, 0.5,
-4.330366, -3.980709, 0.07561922, 0, 1.5, 0.5, 0.5
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
-3, -3.042914, -4.975933,
3, -3.042914, -4.975933,
-3, -3.042914, -4.975933,
-3, -3.199213, -5.228511,
-2, -3.042914, -4.975933,
-2, -3.199213, -5.228511,
-1, -3.042914, -4.975933,
-1, -3.199213, -5.228511,
0, -3.042914, -4.975933,
0, -3.199213, -5.228511,
1, -3.042914, -4.975933,
1, -3.199213, -5.228511,
2, -3.042914, -4.975933,
2, -3.199213, -5.228511,
3, -3.042914, -4.975933,
3, -3.199213, -5.228511
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
-3, -3.511811, -5.733666, 0, -0.5, 0.5, 0.5,
-3, -3.511811, -5.733666, 1, -0.5, 0.5, 0.5,
-3, -3.511811, -5.733666, 1, 1.5, 0.5, 0.5,
-3, -3.511811, -5.733666, 0, 1.5, 0.5, 0.5,
-2, -3.511811, -5.733666, 0, -0.5, 0.5, 0.5,
-2, -3.511811, -5.733666, 1, -0.5, 0.5, 0.5,
-2, -3.511811, -5.733666, 1, 1.5, 0.5, 0.5,
-2, -3.511811, -5.733666, 0, 1.5, 0.5, 0.5,
-1, -3.511811, -5.733666, 0, -0.5, 0.5, 0.5,
-1, -3.511811, -5.733666, 1, -0.5, 0.5, 0.5,
-1, -3.511811, -5.733666, 1, 1.5, 0.5, 0.5,
-1, -3.511811, -5.733666, 0, 1.5, 0.5, 0.5,
0, -3.511811, -5.733666, 0, -0.5, 0.5, 0.5,
0, -3.511811, -5.733666, 1, -0.5, 0.5, 0.5,
0, -3.511811, -5.733666, 1, 1.5, 0.5, 0.5,
0, -3.511811, -5.733666, 0, 1.5, 0.5, 0.5,
1, -3.511811, -5.733666, 0, -0.5, 0.5, 0.5,
1, -3.511811, -5.733666, 1, -0.5, 0.5, 0.5,
1, -3.511811, -5.733666, 1, 1.5, 0.5, 0.5,
1, -3.511811, -5.733666, 0, 1.5, 0.5, 0.5,
2, -3.511811, -5.733666, 0, -0.5, 0.5, 0.5,
2, -3.511811, -5.733666, 1, -0.5, 0.5, 0.5,
2, -3.511811, -5.733666, 1, 1.5, 0.5, 0.5,
2, -3.511811, -5.733666, 0, 1.5, 0.5, 0.5,
3, -3.511811, -5.733666, 0, -0.5, 0.5, 0.5,
3, -3.511811, -5.733666, 1, -0.5, 0.5, 0.5,
3, -3.511811, -5.733666, 1, 1.5, 0.5, 0.5,
3, -3.511811, -5.733666, 0, 1.5, 0.5, 0.5
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
-3.30049, -2, -4.975933,
-3.30049, 3, -4.975933,
-3.30049, -2, -4.975933,
-3.472136, -2, -5.228511,
-3.30049, -1, -4.975933,
-3.472136, -1, -5.228511,
-3.30049, 0, -4.975933,
-3.472136, 0, -5.228511,
-3.30049, 1, -4.975933,
-3.472136, 1, -5.228511,
-3.30049, 2, -4.975933,
-3.472136, 2, -5.228511,
-3.30049, 3, -4.975933,
-3.472136, 3, -5.228511
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
-3.815428, -2, -5.733666, 0, -0.5, 0.5, 0.5,
-3.815428, -2, -5.733666, 1, -0.5, 0.5, 0.5,
-3.815428, -2, -5.733666, 1, 1.5, 0.5, 0.5,
-3.815428, -2, -5.733666, 0, 1.5, 0.5, 0.5,
-3.815428, -1, -5.733666, 0, -0.5, 0.5, 0.5,
-3.815428, -1, -5.733666, 1, -0.5, 0.5, 0.5,
-3.815428, -1, -5.733666, 1, 1.5, 0.5, 0.5,
-3.815428, -1, -5.733666, 0, 1.5, 0.5, 0.5,
-3.815428, 0, -5.733666, 0, -0.5, 0.5, 0.5,
-3.815428, 0, -5.733666, 1, -0.5, 0.5, 0.5,
-3.815428, 0, -5.733666, 1, 1.5, 0.5, 0.5,
-3.815428, 0, -5.733666, 0, 1.5, 0.5, 0.5,
-3.815428, 1, -5.733666, 0, -0.5, 0.5, 0.5,
-3.815428, 1, -5.733666, 1, -0.5, 0.5, 0.5,
-3.815428, 1, -5.733666, 1, 1.5, 0.5, 0.5,
-3.815428, 1, -5.733666, 0, 1.5, 0.5, 0.5,
-3.815428, 2, -5.733666, 0, -0.5, 0.5, 0.5,
-3.815428, 2, -5.733666, 1, -0.5, 0.5, 0.5,
-3.815428, 2, -5.733666, 1, 1.5, 0.5, 0.5,
-3.815428, 2, -5.733666, 0, 1.5, 0.5, 0.5,
-3.815428, 3, -5.733666, 0, -0.5, 0.5, 0.5,
-3.815428, 3, -5.733666, 1, -0.5, 0.5, 0.5,
-3.815428, 3, -5.733666, 1, 1.5, 0.5, 0.5,
-3.815428, 3, -5.733666, 0, 1.5, 0.5, 0.5
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
-3.30049, -3.042914, -4,
-3.30049, -3.042914, 4,
-3.30049, -3.042914, -4,
-3.472136, -3.199213, -4,
-3.30049, -3.042914, -2,
-3.472136, -3.199213, -2,
-3.30049, -3.042914, 0,
-3.472136, -3.199213, 0,
-3.30049, -3.042914, 2,
-3.472136, -3.199213, 2,
-3.30049, -3.042914, 4,
-3.472136, -3.199213, 4
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
-3.815428, -3.511811, -4, 0, -0.5, 0.5, 0.5,
-3.815428, -3.511811, -4, 1, -0.5, 0.5, 0.5,
-3.815428, -3.511811, -4, 1, 1.5, 0.5, 0.5,
-3.815428, -3.511811, -4, 0, 1.5, 0.5, 0.5,
-3.815428, -3.511811, -2, 0, -0.5, 0.5, 0.5,
-3.815428, -3.511811, -2, 1, -0.5, 0.5, 0.5,
-3.815428, -3.511811, -2, 1, 1.5, 0.5, 0.5,
-3.815428, -3.511811, -2, 0, 1.5, 0.5, 0.5,
-3.815428, -3.511811, 0, 0, -0.5, 0.5, 0.5,
-3.815428, -3.511811, 0, 1, -0.5, 0.5, 0.5,
-3.815428, -3.511811, 0, 1, 1.5, 0.5, 0.5,
-3.815428, -3.511811, 0, 0, 1.5, 0.5, 0.5,
-3.815428, -3.511811, 2, 0, -0.5, 0.5, 0.5,
-3.815428, -3.511811, 2, 1, -0.5, 0.5, 0.5,
-3.815428, -3.511811, 2, 1, 1.5, 0.5, 0.5,
-3.815428, -3.511811, 2, 0, 1.5, 0.5, 0.5,
-3.815428, -3.511811, 4, 0, -0.5, 0.5, 0.5,
-3.815428, -3.511811, 4, 1, -0.5, 0.5, 0.5,
-3.815428, -3.511811, 4, 1, 1.5, 0.5, 0.5,
-3.815428, -3.511811, 4, 0, 1.5, 0.5, 0.5
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
-3.30049, -3.042914, -4.975933,
-3.30049, 3.209055, -4.975933,
-3.30049, -3.042914, 5.127172,
-3.30049, 3.209055, 5.127172,
-3.30049, -3.042914, -4.975933,
-3.30049, -3.042914, 5.127172,
-3.30049, 3.209055, -4.975933,
-3.30049, 3.209055, 5.127172,
-3.30049, -3.042914, -4.975933,
3.565346, -3.042914, -4.975933,
-3.30049, -3.042914, 5.127172,
3.565346, -3.042914, 5.127172,
-3.30049, 3.209055, -4.975933,
3.565346, 3.209055, -4.975933,
-3.30049, 3.209055, 5.127172,
3.565346, 3.209055, 5.127172,
3.565346, -3.042914, -4.975933,
3.565346, 3.209055, -4.975933,
3.565346, -3.042914, 5.127172,
3.565346, 3.209055, 5.127172,
3.565346, -3.042914, -4.975933,
3.565346, -3.042914, 5.127172,
3.565346, 3.209055, -4.975933,
3.565346, 3.209055, 5.127172
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
var radius = 7.327404;
var distance = 32.60044;
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
mvMatrix.translate( -0.1324281, -0.08307064, -0.07561922 );
mvMatrix.scale( 1.153906, 1.267206, 0.7841681 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.60044);
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
cyhalothrin<-read.table("cyhalothrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyhalothrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyhalothrin' not found
```

```r
y<-cyhalothrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyhalothrin' not found
```

```r
z<-cyhalothrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyhalothrin' not found
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
-3.200502, -0.8246409, -0.1710373, 0, 0, 1, 1, 1,
-2.783829, -0.4992246, -0.8286176, 1, 0, 0, 1, 1,
-2.452985, 0.01133088, -1.452205, 1, 0, 0, 1, 1,
-2.41716, 0.8326828, -0.1035784, 1, 0, 0, 1, 1,
-2.391629, 0.9202519, -1.724041, 1, 0, 0, 1, 1,
-2.360247, -0.6426684, -0.9037453, 1, 0, 0, 1, 1,
-2.347052, 0.2707686, -2.27363, 0, 0, 0, 1, 1,
-2.331403, 0.4701332, -1.54578, 0, 0, 0, 1, 1,
-2.330282, 0.4807772, -1.931484, 0, 0, 0, 1, 1,
-2.328386, 0.5706402, -1.069915, 0, 0, 0, 1, 1,
-2.293197, 1.690188, -1.080938, 0, 0, 0, 1, 1,
-2.269383, 0.7486625, -1.634673, 0, 0, 0, 1, 1,
-2.242677, 2.014446, -1.378773, 0, 0, 0, 1, 1,
-2.228815, 0.08368432, -1.999066, 1, 1, 1, 1, 1,
-2.22649, 0.5418397, -2.581762, 1, 1, 1, 1, 1,
-2.209078, 0.7602116, -1.780031, 1, 1, 1, 1, 1,
-2.181943, -0.715816, -2.68766, 1, 1, 1, 1, 1,
-2.173129, 0.8340509, -2.256152, 1, 1, 1, 1, 1,
-2.154316, 0.008760478, -2.845412, 1, 1, 1, 1, 1,
-2.152917, -0.2712337, -1.178127, 1, 1, 1, 1, 1,
-2.135716, -0.2830861, -1.98641, 1, 1, 1, 1, 1,
-2.108905, 0.3754426, -4.043857, 1, 1, 1, 1, 1,
-2.093737, -0.4047432, -1.789152, 1, 1, 1, 1, 1,
-2.079251, 0.0566884, -0.8051099, 1, 1, 1, 1, 1,
-2.04865, -0.1727641, -2.16667, 1, 1, 1, 1, 1,
-2.026901, -0.9728568, -2.5851, 1, 1, 1, 1, 1,
-1.984565, -0.538421, -1.914423, 1, 1, 1, 1, 1,
-1.983804, 0.7961107, -2.635482, 1, 1, 1, 1, 1,
-1.966632, -0.06181254, -0.9396732, 0, 0, 1, 1, 1,
-1.962822, 1.112307, -2.193389, 1, 0, 0, 1, 1,
-1.933813, 0.1912218, -1.929791, 1, 0, 0, 1, 1,
-1.92146, -1.298496, -3.882985, 1, 0, 0, 1, 1,
-1.921292, -1.606969, -4.041012, 1, 0, 0, 1, 1,
-1.911545, -0.3655946, -1.935686, 1, 0, 0, 1, 1,
-1.899334, 0.9726247, -1.05983, 0, 0, 0, 1, 1,
-1.895574, 0.7431472, -0.0040926, 0, 0, 0, 1, 1,
-1.882136, -1.123985, -3.139733, 0, 0, 0, 1, 1,
-1.81764, 1.879196, 0.8051062, 0, 0, 0, 1, 1,
-1.810928, -0.4018286, 0.844083, 0, 0, 0, 1, 1,
-1.792137, 0.5796548, -0.6685932, 0, 0, 0, 1, 1,
-1.779928, 1.468946, -1.33022, 0, 0, 0, 1, 1,
-1.77757, -1.10861, -2.572529, 1, 1, 1, 1, 1,
-1.775003, 0.5293964, -0.0679552, 1, 1, 1, 1, 1,
-1.752361, 0.01218546, -0.7057438, 1, 1, 1, 1, 1,
-1.742016, -0.07980125, -1.92494, 1, 1, 1, 1, 1,
-1.739592, -0.4433664, -2.346904, 1, 1, 1, 1, 1,
-1.738742, 0.1364979, -1.846722, 1, 1, 1, 1, 1,
-1.738337, -0.6654787, -2.320404, 1, 1, 1, 1, 1,
-1.720632, 0.1517018, -0.7184374, 1, 1, 1, 1, 1,
-1.697407, -2.277249, -1.765484, 1, 1, 1, 1, 1,
-1.697064, 0.932468, -1.864904, 1, 1, 1, 1, 1,
-1.688583, -0.09109252, -1.217312, 1, 1, 1, 1, 1,
-1.6717, -0.1008489, -1.307483, 1, 1, 1, 1, 1,
-1.669907, -0.499858, -2.305623, 1, 1, 1, 1, 1,
-1.669358, -1.137838, -2.803416, 1, 1, 1, 1, 1,
-1.647197, 0.7624354, -0.3886168, 1, 1, 1, 1, 1,
-1.632829, -1.668139, -2.946238, 0, 0, 1, 1, 1,
-1.62866, 1.227856, -0.4734074, 1, 0, 0, 1, 1,
-1.616371, 1.644219, 0.3468069, 1, 0, 0, 1, 1,
-1.60864, 0.003105708, -2.517394, 1, 0, 0, 1, 1,
-1.602149, -1.15975, -1.32821, 1, 0, 0, 1, 1,
-1.584867, 1.167305, -0.04171232, 1, 0, 0, 1, 1,
-1.58056, -0.0005812239, -3.117533, 0, 0, 0, 1, 1,
-1.576143, -0.2053167, -2.374684, 0, 0, 0, 1, 1,
-1.575939, 0.8952853, 0.3589269, 0, 0, 0, 1, 1,
-1.564631, -1.084927, -2.896118, 0, 0, 0, 1, 1,
-1.562217, -1.303129, -0.8971224, 0, 0, 0, 1, 1,
-1.558066, 0.5244493, -0.9083065, 0, 0, 0, 1, 1,
-1.557946, 1.830598, 0.5164742, 0, 0, 0, 1, 1,
-1.557028, 0.4182286, -2.164828, 1, 1, 1, 1, 1,
-1.546747, 0.8135023, -1.61817, 1, 1, 1, 1, 1,
-1.545826, 2.971341, 0.3723185, 1, 1, 1, 1, 1,
-1.545278, -0.5284408, -3.536942, 1, 1, 1, 1, 1,
-1.54177, 0.9365358, -0.712813, 1, 1, 1, 1, 1,
-1.538326, -0.7554249, -4.448258, 1, 1, 1, 1, 1,
-1.536153, -0.6100038, -3.511873, 1, 1, 1, 1, 1,
-1.533032, -0.2198019, -1.420919, 1, 1, 1, 1, 1,
-1.509097, -0.0990774, -0.7637209, 1, 1, 1, 1, 1,
-1.504231, 0.4923514, -1.73708, 1, 1, 1, 1, 1,
-1.497842, 0.8067605, -1.785437, 1, 1, 1, 1, 1,
-1.470304, 1.179838, -1.145157, 1, 1, 1, 1, 1,
-1.455855, 1.041505, -0.12744, 1, 1, 1, 1, 1,
-1.446699, 1.153679, -0.8007117, 1, 1, 1, 1, 1,
-1.43214, -0.8373955, -1.998179, 1, 1, 1, 1, 1,
-1.418614, -0.1870059, -1.883515, 0, 0, 1, 1, 1,
-1.418423, 1.386926, -0.9850006, 1, 0, 0, 1, 1,
-1.401218, -0.1810377, -3.518293, 1, 0, 0, 1, 1,
-1.386406, 0.2276001, 0.07927399, 1, 0, 0, 1, 1,
-1.380721, 0.8657151, -2.159603, 1, 0, 0, 1, 1,
-1.367477, 0.4504461, -2.297966, 1, 0, 0, 1, 1,
-1.365926, 1.851076, -0.3725555, 0, 0, 0, 1, 1,
-1.362062, 2.081564, 0.2169395, 0, 0, 0, 1, 1,
-1.35964, -0.7686067, -1.740368, 0, 0, 0, 1, 1,
-1.353904, -1.835919, -2.376317, 0, 0, 0, 1, 1,
-1.346122, -1.397963, -3.407328, 0, 0, 0, 1, 1,
-1.342898, -2.180812, -2.357385, 0, 0, 0, 1, 1,
-1.34079, 0.1867545, -2.006745, 0, 0, 0, 1, 1,
-1.334616, 0.3583048, -0.600157, 1, 1, 1, 1, 1,
-1.32405, -1.021822, -2.410834, 1, 1, 1, 1, 1,
-1.317701, 1.05266, 1.253438, 1, 1, 1, 1, 1,
-1.314832, 0.3848412, 0.1985607, 1, 1, 1, 1, 1,
-1.311162, -1.131867, -2.020589, 1, 1, 1, 1, 1,
-1.300719, -0.8317468, -1.673828, 1, 1, 1, 1, 1,
-1.293303, 1.297219, -1.467562, 1, 1, 1, 1, 1,
-1.279489, 0.09234899, -0.7120147, 1, 1, 1, 1, 1,
-1.278202, 0.6884569, -1.783699, 1, 1, 1, 1, 1,
-1.266908, 0.22028, -2.581625, 1, 1, 1, 1, 1,
-1.266502, 0.6808743, -1.588063, 1, 1, 1, 1, 1,
-1.257203, -1.214567, -1.033155, 1, 1, 1, 1, 1,
-1.25131, -0.8312074, -1.145969, 1, 1, 1, 1, 1,
-1.24424, -0.2823683, -1.803999, 1, 1, 1, 1, 1,
-1.237681, -0.1802745, -2.373951, 1, 1, 1, 1, 1,
-1.222133, 1.370709, -2.588013, 0, 0, 1, 1, 1,
-1.219135, -2.087767, -2.036357, 1, 0, 0, 1, 1,
-1.203705, 0.8895679, -1.426785, 1, 0, 0, 1, 1,
-1.202991, -0.0509503, -1.460418, 1, 0, 0, 1, 1,
-1.201914, -0.8581063, -1.381446, 1, 0, 0, 1, 1,
-1.200109, 0.9044618, 0.04348904, 1, 0, 0, 1, 1,
-1.189617, 0.1032517, -1.42012, 0, 0, 0, 1, 1,
-1.188744, -1.381315, -2.259469, 0, 0, 0, 1, 1,
-1.186758, 0.6926305, -1.510333, 0, 0, 0, 1, 1,
-1.186397, 0.4832408, -1.917969, 0, 0, 0, 1, 1,
-1.180637, 0.8458582, -0.1212128, 0, 0, 0, 1, 1,
-1.179999, -1.208992, -1.666818, 0, 0, 0, 1, 1,
-1.169104, -0.5921814, -0.5428266, 0, 0, 0, 1, 1,
-1.166465, -0.8039496, -1.801445, 1, 1, 1, 1, 1,
-1.156129, 0.127663, -0.1607861, 1, 1, 1, 1, 1,
-1.151685, 0.3812057, 0.2538878, 1, 1, 1, 1, 1,
-1.145828, -0.2691613, -0.7956986, 1, 1, 1, 1, 1,
-1.140172, -0.4442878, -0.4192445, 1, 1, 1, 1, 1,
-1.137323, 1.320869, -0.7230159, 1, 1, 1, 1, 1,
-1.136201, -1.484734, -1.715679, 1, 1, 1, 1, 1,
-1.132315, -1.020079, -2.842737, 1, 1, 1, 1, 1,
-1.121669, 0.4241067, -0.4752461, 1, 1, 1, 1, 1,
-1.115459, 0.486768, -1.912563, 1, 1, 1, 1, 1,
-1.112558, -0.6596087, -2.432497, 1, 1, 1, 1, 1,
-1.111874, 1.319349, -1.762736, 1, 1, 1, 1, 1,
-1.107499, 1.760312, -1.387172, 1, 1, 1, 1, 1,
-1.10536, 0.2192911, -1.986053, 1, 1, 1, 1, 1,
-1.101311, -0.663358, -1.73626, 1, 1, 1, 1, 1,
-1.08932, -0.2662037, -2.288216, 0, 0, 1, 1, 1,
-1.080207, -1.639422, -4.251858, 1, 0, 0, 1, 1,
-1.074295, 1.487157, -2.024331, 1, 0, 0, 1, 1,
-1.074084, 0.5747547, -1.343283, 1, 0, 0, 1, 1,
-1.066609, 0.179663, -0.2473551, 1, 0, 0, 1, 1,
-1.06653, -1.270066, -1.963633, 1, 0, 0, 1, 1,
-1.064862, 1.527247, 0.3594527, 0, 0, 0, 1, 1,
-1.063062, 0.9891903, -0.6157507, 0, 0, 0, 1, 1,
-1.062726, -0.3436168, -0.6950851, 0, 0, 0, 1, 1,
-1.058924, 0.2497913, 0.1675224, 0, 0, 0, 1, 1,
-1.055022, 0.03339396, -1.433055, 0, 0, 0, 1, 1,
-1.053175, -1.294595, -1.610409, 0, 0, 0, 1, 1,
-1.046833, 0.1537587, -0.2776921, 0, 0, 0, 1, 1,
-1.046056, 0.3538033, 0.06997385, 1, 1, 1, 1, 1,
-1.03983, 0.5210955, -0.8581414, 1, 1, 1, 1, 1,
-1.039621, -0.6820462, -3.877836, 1, 1, 1, 1, 1,
-1.039466, 0.4777758, 0.2623906, 1, 1, 1, 1, 1,
-1.038244, -1.366382, -1.690824, 1, 1, 1, 1, 1,
-1.037201, 0.2427924, -0.6695064, 1, 1, 1, 1, 1,
-1.036796, 2.408262, -1.289006, 1, 1, 1, 1, 1,
-1.029121, 0.04516649, -2.669551, 1, 1, 1, 1, 1,
-1.026816, 0.2482443, -1.119326, 1, 1, 1, 1, 1,
-1.015176, 1.847011, -0.118711, 1, 1, 1, 1, 1,
-1.012069, -0.2171725, -2.370945, 1, 1, 1, 1, 1,
-1.00844, 0.3983128, 0.681058, 1, 1, 1, 1, 1,
-1.007034, 0.4497156, -0.9154601, 1, 1, 1, 1, 1,
-0.9990355, 1.155463, -0.6616058, 1, 1, 1, 1, 1,
-0.9922925, 1.01414, -1.552335, 1, 1, 1, 1, 1,
-0.9832733, -0.1425252, -1.672693, 0, 0, 1, 1, 1,
-0.9820996, -0.9980731, -2.029671, 1, 0, 0, 1, 1,
-0.9820247, 0.645947, -0.02829106, 1, 0, 0, 1, 1,
-0.9811504, 0.3887993, -0.9184396, 1, 0, 0, 1, 1,
-0.9804505, -1.511703, -2.912935, 1, 0, 0, 1, 1,
-0.9794706, -0.9119356, -1.955463, 1, 0, 0, 1, 1,
-0.9710754, 0.3215854, -3.063652, 0, 0, 0, 1, 1,
-0.9672941, -0.2869087, -2.419733, 0, 0, 0, 1, 1,
-0.9652662, -0.001462075, -2.633931, 0, 0, 0, 1, 1,
-0.9634682, -0.482243, -3.719382, 0, 0, 0, 1, 1,
-0.9553426, -1.674463, -3.364064, 0, 0, 0, 1, 1,
-0.9548615, 0.2425068, -1.87972, 0, 0, 0, 1, 1,
-0.9532715, 0.7402061, -2.164386, 0, 0, 0, 1, 1,
-0.9472513, -0.1034447, -2.042199, 1, 1, 1, 1, 1,
-0.9365349, 1.39325, -1.665679, 1, 1, 1, 1, 1,
-0.9354708, 0.4123229, -3.222124, 1, 1, 1, 1, 1,
-0.9348649, -0.2024147, -2.445028, 1, 1, 1, 1, 1,
-0.9319956, 2.043715, -1.33796, 1, 1, 1, 1, 1,
-0.9255091, -0.9626444, -1.836446, 1, 1, 1, 1, 1,
-0.925132, 0.239107, -0.7950968, 1, 1, 1, 1, 1,
-0.9227111, 0.4499428, 0.3324014, 1, 1, 1, 1, 1,
-0.9165995, 1.003986, -0.1035279, 1, 1, 1, 1, 1,
-0.9133439, -0.04214976, -1.111975, 1, 1, 1, 1, 1,
-0.9075604, -0.5607526, -0.6602348, 1, 1, 1, 1, 1,
-0.903497, 0.2767535, 0.3874223, 1, 1, 1, 1, 1,
-0.8879258, 1.089029, -0.6582655, 1, 1, 1, 1, 1,
-0.8832288, -0.1889714, -3.158329, 1, 1, 1, 1, 1,
-0.8764711, 0.9498296, -1.373075, 1, 1, 1, 1, 1,
-0.876304, 0.9795443, -1.570275, 0, 0, 1, 1, 1,
-0.8738888, -1.493215, -2.19751, 1, 0, 0, 1, 1,
-0.872093, 0.3264592, -0.9251535, 1, 0, 0, 1, 1,
-0.8720645, 0.4146138, -0.6526955, 1, 0, 0, 1, 1,
-0.8709417, -1.598699, -3.177505, 1, 0, 0, 1, 1,
-0.8694934, -1.945943, -2.944714, 1, 0, 0, 1, 1,
-0.8685209, 0.9507278, -0.2376422, 0, 0, 0, 1, 1,
-0.8613387, 0.1460619, -2.521795, 0, 0, 0, 1, 1,
-0.860963, 1.127158, 0.2615524, 0, 0, 0, 1, 1,
-0.8545385, 0.7901547, -3.15505, 0, 0, 0, 1, 1,
-0.8503122, -0.3400071, -2.179753, 0, 0, 0, 1, 1,
-0.8437746, -0.5014744, -1.599105, 0, 0, 0, 1, 1,
-0.843646, -0.335998, -1.460094, 0, 0, 0, 1, 1,
-0.840539, 0.03401949, -2.24544, 1, 1, 1, 1, 1,
-0.8352677, -0.3432041, -3.659896, 1, 1, 1, 1, 1,
-0.8323576, 0.09096023, -0.2921235, 1, 1, 1, 1, 1,
-0.8263819, 0.8779631, -1.995757, 1, 1, 1, 1, 1,
-0.8128949, -0.3405927, -2.368854, 1, 1, 1, 1, 1,
-0.8117779, -0.6782153, -3.102533, 1, 1, 1, 1, 1,
-0.8110772, 0.3062473, -2.792295, 1, 1, 1, 1, 1,
-0.8040712, -1.883395, -1.315343, 1, 1, 1, 1, 1,
-0.8035052, -0.9786496, -2.720202, 1, 1, 1, 1, 1,
-0.797339, -1.947095, -2.854838, 1, 1, 1, 1, 1,
-0.7943907, -0.9457356, -1.957981, 1, 1, 1, 1, 1,
-0.7882004, 0.2873639, -1.477639, 1, 1, 1, 1, 1,
-0.7839233, -0.04578098, -1.158835, 1, 1, 1, 1, 1,
-0.7796054, 1.057939, -1.368415, 1, 1, 1, 1, 1,
-0.7775957, -0.1076442, -1.423544, 1, 1, 1, 1, 1,
-0.7759808, -1.82725, -2.869836, 0, 0, 1, 1, 1,
-0.7743963, -1.203753, -1.228677, 1, 0, 0, 1, 1,
-0.7734544, 0.6194121, -0.1010577, 1, 0, 0, 1, 1,
-0.7702225, 0.2174422, -1.027477, 1, 0, 0, 1, 1,
-0.7700778, -0.4973088, -2.288945, 1, 0, 0, 1, 1,
-0.7638361, -0.3789729, -1.975182, 1, 0, 0, 1, 1,
-0.7565559, -0.1939071, 0.1100913, 0, 0, 0, 1, 1,
-0.7563186, -0.4656443, -2.415599, 0, 0, 0, 1, 1,
-0.7548721, -0.883512, -3.007604, 0, 0, 0, 1, 1,
-0.7540801, 0.432751, -0.5603231, 0, 0, 0, 1, 1,
-0.7537353, -0.07688351, 0.110991, 0, 0, 0, 1, 1,
-0.752574, -0.1931248, -1.463078, 0, 0, 0, 1, 1,
-0.7434378, -1.002314, -2.656515, 0, 0, 0, 1, 1,
-0.7359987, -1.252523, -0.9602739, 1, 1, 1, 1, 1,
-0.7329974, 0.4989008, -1.46752, 1, 1, 1, 1, 1,
-0.7328236, 0.2611705, -1.711197, 1, 1, 1, 1, 1,
-0.7311171, 0.117874, -0.4963094, 1, 1, 1, 1, 1,
-0.730682, -0.4046012, -1.826762, 1, 1, 1, 1, 1,
-0.7294853, -1.480539, -1.905333, 1, 1, 1, 1, 1,
-0.7267355, -0.2185267, -2.080529, 1, 1, 1, 1, 1,
-0.7187759, -0.4633416, -1.789014, 1, 1, 1, 1, 1,
-0.7156909, -2.062476, -2.8914, 1, 1, 1, 1, 1,
-0.7111723, -1.493602, -1.332722, 1, 1, 1, 1, 1,
-0.7101141, -2.114813, -2.147459, 1, 1, 1, 1, 1,
-0.7093727, -0.5901036, -3.483664, 1, 1, 1, 1, 1,
-0.7084867, -1.13165, -1.318334, 1, 1, 1, 1, 1,
-0.7077066, -1.229859, -4.141615, 1, 1, 1, 1, 1,
-0.7064847, 0.8974087, -0.61676, 1, 1, 1, 1, 1,
-0.6979886, 0.7208277, -1.397017, 0, 0, 1, 1, 1,
-0.6976095, -2.297537, -1.713691, 1, 0, 0, 1, 1,
-0.6952085, -0.437298, -1.735272, 1, 0, 0, 1, 1,
-0.6925315, 0.3299202, -0.1738424, 1, 0, 0, 1, 1,
-0.6893222, 1.459007, 1.164042, 1, 0, 0, 1, 1,
-0.6889244, -0.1492966, -1.141093, 1, 0, 0, 1, 1,
-0.6835675, -0.5294644, -1.831959, 0, 0, 0, 1, 1,
-0.6753572, 0.1786906, -4.056099, 0, 0, 0, 1, 1,
-0.674944, -0.05063912, -2.425821, 0, 0, 0, 1, 1,
-0.6698286, 0.6531411, -0.6194245, 0, 0, 0, 1, 1,
-0.6686518, 0.4579785, -1.731915, 0, 0, 0, 1, 1,
-0.6610088, -0.02765225, -2.063572, 0, 0, 0, 1, 1,
-0.6579887, 0.3943034, 1.138927, 0, 0, 0, 1, 1,
-0.6533973, -0.3600954, -2.624795, 1, 1, 1, 1, 1,
-0.6490728, 1.174984, -0.4234571, 1, 1, 1, 1, 1,
-0.6489918, -0.6922501, -2.410538, 1, 1, 1, 1, 1,
-0.6459683, 1.217575, -1.487448, 1, 1, 1, 1, 1,
-0.644074, -1.465713, -2.43585, 1, 1, 1, 1, 1,
-0.6437443, -1.785917, -2.812866, 1, 1, 1, 1, 1,
-0.637746, -0.4326671, -3.125734, 1, 1, 1, 1, 1,
-0.6372998, 0.1476666, -0.6584929, 1, 1, 1, 1, 1,
-0.6329397, 0.1103832, -0.07056804, 1, 1, 1, 1, 1,
-0.6323833, 1.372745, 0.2662227, 1, 1, 1, 1, 1,
-0.6317415, 0.0580335, 1.036971, 1, 1, 1, 1, 1,
-0.6317357, -1.23758, -2.953074, 1, 1, 1, 1, 1,
-0.6300327, -0.7862028, -0.7929249, 1, 1, 1, 1, 1,
-0.6240076, 0.6773438, -0.527415, 1, 1, 1, 1, 1,
-0.6187823, -0.04003894, -1.646594, 1, 1, 1, 1, 1,
-0.6114416, -1.650272, -4.554928, 0, 0, 1, 1, 1,
-0.6069846, 0.6988182, -0.9965001, 1, 0, 0, 1, 1,
-0.6015233, -0.9111934, -3.732194, 1, 0, 0, 1, 1,
-0.6006114, -0.4399978, -1.933634, 1, 0, 0, 1, 1,
-0.6005492, -0.0946191, -1.919538, 1, 0, 0, 1, 1,
-0.6005396, 0.369286, -0.9987086, 1, 0, 0, 1, 1,
-0.6002247, -1.12931, -1.932848, 0, 0, 0, 1, 1,
-0.5969658, 1.014059, -0.458028, 0, 0, 0, 1, 1,
-0.596873, 0.3440867, 0.6005722, 0, 0, 0, 1, 1,
-0.5965455, -2.064648, -2.821599, 0, 0, 0, 1, 1,
-0.5940167, 0.7623004, -0.4905255, 0, 0, 0, 1, 1,
-0.5881898, -1.080718, -2.76066, 0, 0, 0, 1, 1,
-0.5878107, -1.093346, -3.433461, 0, 0, 0, 1, 1,
-0.5837902, -0.6804629, -2.072083, 1, 1, 1, 1, 1,
-0.5790704, 0.5467461, -1.655569, 1, 1, 1, 1, 1,
-0.576189, -0.564176, -4.089662, 1, 1, 1, 1, 1,
-0.5754532, 0.0495173, -0.4527273, 1, 1, 1, 1, 1,
-0.5714158, 0.248242, -1.854641, 1, 1, 1, 1, 1,
-0.5690051, 0.1381758, -2.413713, 1, 1, 1, 1, 1,
-0.568931, 0.2498939, -0.750461, 1, 1, 1, 1, 1,
-0.5688138, 0.3758649, -0.7796749, 1, 1, 1, 1, 1,
-0.567402, 0.2533022, -3.184102, 1, 1, 1, 1, 1,
-0.5662397, 0.1578514, -0.4327494, 1, 1, 1, 1, 1,
-0.5655837, 0.8013191, 0.2924913, 1, 1, 1, 1, 1,
-0.565243, -0.3555259, -2.124218, 1, 1, 1, 1, 1,
-0.5641656, 1.101735, -1.219483, 1, 1, 1, 1, 1,
-0.5559942, 0.6713496, -1.494745, 1, 1, 1, 1, 1,
-0.5534961, 0.5118247, -2.561941, 1, 1, 1, 1, 1,
-0.5528467, -0.1458882, -2.542292, 0, 0, 1, 1, 1,
-0.5526454, 0.7575662, -0.9229432, 1, 0, 0, 1, 1,
-0.5508544, -1.407837, -3.069844, 1, 0, 0, 1, 1,
-0.5476375, 1.790075, 1.82152, 1, 0, 0, 1, 1,
-0.5468168, 0.4557342, -0.5332239, 1, 0, 0, 1, 1,
-0.544602, -0.5311981, -2.925272, 1, 0, 0, 1, 1,
-0.5439501, 1.437916, -0.6517613, 0, 0, 0, 1, 1,
-0.5387316, -2.384349, -3.457994, 0, 0, 0, 1, 1,
-0.5361611, -1.222906, -3.16263, 0, 0, 0, 1, 1,
-0.5314152, 1.941208, 0.6716095, 0, 0, 0, 1, 1,
-0.5312619, -0.7750015, -3.490019, 0, 0, 0, 1, 1,
-0.5276468, -1.869682, -1.910488, 0, 0, 0, 1, 1,
-0.5228797, -1.878421, -3.586131, 0, 0, 0, 1, 1,
-0.5196992, 1.501726, -1.595689, 1, 1, 1, 1, 1,
-0.5163549, 0.1411551, -1.095494, 1, 1, 1, 1, 1,
-0.5148193, -1.240861, -1.252779, 1, 1, 1, 1, 1,
-0.5146551, 0.6875716, 0.1292116, 1, 1, 1, 1, 1,
-0.5145516, -0.929766, -2.24587, 1, 1, 1, 1, 1,
-0.5126135, 0.4906559, 0.1220556, 1, 1, 1, 1, 1,
-0.5096613, 3.118007, -0.5289207, 1, 1, 1, 1, 1,
-0.5053824, 0.2452841, 1.090317, 1, 1, 1, 1, 1,
-0.5017098, -0.395241, -3.011727, 1, 1, 1, 1, 1,
-0.5008152, 0.01424038, -0.452251, 1, 1, 1, 1, 1,
-0.4968458, -0.1947655, -2.869269, 1, 1, 1, 1, 1,
-0.488254, -0.7496253, -2.309753, 1, 1, 1, 1, 1,
-0.4879563, 0.5135233, -0.627553, 1, 1, 1, 1, 1,
-0.4825756, 2.049759, 1.548969, 1, 1, 1, 1, 1,
-0.4808424, 0.9628233, -0.8506272, 1, 1, 1, 1, 1,
-0.4801053, -0.4657983, -1.428408, 0, 0, 1, 1, 1,
-0.4799066, 1.120086, 1.142663, 1, 0, 0, 1, 1,
-0.4794714, 1.018946, -1.083817, 1, 0, 0, 1, 1,
-0.4676978, 0.3721574, -0.03008628, 1, 0, 0, 1, 1,
-0.4623355, -1.520175, -2.062334, 1, 0, 0, 1, 1,
-0.4614422, 0.1176087, -1.183288, 1, 0, 0, 1, 1,
-0.4575685, -0.3546414, -3.303516, 0, 0, 0, 1, 1,
-0.4541348, -0.6793932, -3.001357, 0, 0, 0, 1, 1,
-0.4526197, -1.318974, -2.962116, 0, 0, 0, 1, 1,
-0.4501745, -0.1018828, -3.363405, 0, 0, 0, 1, 1,
-0.4486747, -1.099659, -2.137811, 0, 0, 0, 1, 1,
-0.4476023, 0.6513665, -0.06752755, 0, 0, 0, 1, 1,
-0.4456863, -0.62442, -1.912659, 0, 0, 0, 1, 1,
-0.4439237, -0.9457014, -3.052279, 1, 1, 1, 1, 1,
-0.4351893, -1.346085, -3.704934, 1, 1, 1, 1, 1,
-0.4349294, -0.451649, -3.535589, 1, 1, 1, 1, 1,
-0.4328232, 0.9188818, 0.2162898, 1, 1, 1, 1, 1,
-0.4314125, 0.9215972, -0.3950763, 1, 1, 1, 1, 1,
-0.4292658, -0.4452071, -2.512924, 1, 1, 1, 1, 1,
-0.4274129, -0.7946004, -2.996694, 1, 1, 1, 1, 1,
-0.4251063, -1.772813, -3.33806, 1, 1, 1, 1, 1,
-0.4248677, 2.011286, 1.285292, 1, 1, 1, 1, 1,
-0.4140419, 0.723333, -0.7324234, 1, 1, 1, 1, 1,
-0.4098431, 0.9746591, -0.3142841, 1, 1, 1, 1, 1,
-0.4098306, -0.4473622, -3.197278, 1, 1, 1, 1, 1,
-0.408831, 0.4766682, 0.3894815, 1, 1, 1, 1, 1,
-0.4072267, 0.05724737, -3.558551, 1, 1, 1, 1, 1,
-0.4067516, 1.573018, 0.3923047, 1, 1, 1, 1, 1,
-0.4024397, -0.5403867, -1.768536, 0, 0, 1, 1, 1,
-0.4013818, 0.4227182, 0.02182182, 1, 0, 0, 1, 1,
-0.3961259, 1.760534, -0.8364069, 1, 0, 0, 1, 1,
-0.3922318, -0.2372213, -2.968394, 1, 0, 0, 1, 1,
-0.3901913, -0.6091118, -3.414122, 1, 0, 0, 1, 1,
-0.3894055, 0.2459443, -0.4332604, 1, 0, 0, 1, 1,
-0.3892013, -1.168556, -2.027697, 0, 0, 0, 1, 1,
-0.389151, -0.7632456, -2.374368, 0, 0, 0, 1, 1,
-0.3891199, 0.71269, -0.1974443, 0, 0, 0, 1, 1,
-0.3873171, 1.776669, -0.3415189, 0, 0, 0, 1, 1,
-0.3841801, -0.872124, -3.632663, 0, 0, 0, 1, 1,
-0.3840007, 0.220433, -0.54772, 0, 0, 0, 1, 1,
-0.3821242, -0.8337498, -3.295619, 0, 0, 0, 1, 1,
-0.3758494, -1.734146, -3.038802, 1, 1, 1, 1, 1,
-0.3693752, -0.5667719, -3.105117, 1, 1, 1, 1, 1,
-0.3681591, -0.5771141, -1.430537, 1, 1, 1, 1, 1,
-0.3645303, -1.725178, -2.166525, 1, 1, 1, 1, 1,
-0.3644616, -0.2570479, -2.856942, 1, 1, 1, 1, 1,
-0.3632859, -0.9618454, -1.813413, 1, 1, 1, 1, 1,
-0.3531413, -0.2487415, -1.974907, 1, 1, 1, 1, 1,
-0.349042, -0.5485917, -3.862144, 1, 1, 1, 1, 1,
-0.347892, 0.0544654, -0.5606709, 1, 1, 1, 1, 1,
-0.3450676, -0.3981085, -2.94832, 1, 1, 1, 1, 1,
-0.340407, -0.3787497, -2.680628, 1, 1, 1, 1, 1,
-0.3397541, 0.1529527, -1.129216, 1, 1, 1, 1, 1,
-0.3394334, 0.5912307, -0.9834698, 1, 1, 1, 1, 1,
-0.3373137, 0.6602871, -0.3106939, 1, 1, 1, 1, 1,
-0.3356784, 1.507819, -0.5820885, 1, 1, 1, 1, 1,
-0.333736, -0.7246124, -2.200371, 0, 0, 1, 1, 1,
-0.3336428, -0.2400351, -2.645349, 1, 0, 0, 1, 1,
-0.3313799, 0.6089964, -0.5939723, 1, 0, 0, 1, 1,
-0.3294857, 1.161928, 0.3756174, 1, 0, 0, 1, 1,
-0.326437, -1.716641, -4.082805, 1, 0, 0, 1, 1,
-0.3240899, -0.7531072, -3.884726, 1, 0, 0, 1, 1,
-0.3221305, -0.8281766, -1.151508, 0, 0, 0, 1, 1,
-0.3189099, -1.396729, -3.762828, 0, 0, 0, 1, 1,
-0.3187758, 0.9430293, -2.167695, 0, 0, 0, 1, 1,
-0.3164647, 0.05451792, 0.1426315, 0, 0, 0, 1, 1,
-0.3128756, -0.3486622, -1.374843, 0, 0, 0, 1, 1,
-0.3050418, 0.3693952, -1.478782, 0, 0, 0, 1, 1,
-0.3028643, -1.249744, -3.834755, 0, 0, 0, 1, 1,
-0.3025724, -1.07439, -0.02255881, 1, 1, 1, 1, 1,
-0.3003011, 0.03624519, -1.874306, 1, 1, 1, 1, 1,
-0.2980249, -1.317882, -2.068446, 1, 1, 1, 1, 1,
-0.2953115, -0.7643695, -2.220698, 1, 1, 1, 1, 1,
-0.2937163, -0.9322143, -3.520128, 1, 1, 1, 1, 1,
-0.2880356, 1.214802, 1.560555, 1, 1, 1, 1, 1,
-0.2859243, 0.8601985, 1.5715, 1, 1, 1, 1, 1,
-0.2857153, 0.3243363, -0.3961118, 1, 1, 1, 1, 1,
-0.2841801, -0.1610691, -2.768631, 1, 1, 1, 1, 1,
-0.280504, 1.276558, -0.3048604, 1, 1, 1, 1, 1,
-0.2661034, 1.025286, -0.4430426, 1, 1, 1, 1, 1,
-0.2567679, -0.7949113, -2.760613, 1, 1, 1, 1, 1,
-0.2548187, 0.4491788, -1.457614, 1, 1, 1, 1, 1,
-0.2466492, -0.1424662, -0.6792514, 1, 1, 1, 1, 1,
-0.2455805, 0.2296257, -1.098579, 1, 1, 1, 1, 1,
-0.2439373, -0.2941598, -2.039129, 0, 0, 1, 1, 1,
-0.2434561, -1.957793, -3.447112, 1, 0, 0, 1, 1,
-0.2430574, -1.857041, -3.511979, 1, 0, 0, 1, 1,
-0.2401696, 0.8445396, -0.4165383, 1, 0, 0, 1, 1,
-0.236967, 0.5387729, -0.4585827, 1, 0, 0, 1, 1,
-0.2365394, -0.3707908, -4.520772, 1, 0, 0, 1, 1,
-0.2313339, 0.3842068, 1.363023, 0, 0, 0, 1, 1,
-0.2309407, -1.630235, -2.55437, 0, 0, 0, 1, 1,
-0.2288523, 2.350643, -0.2193821, 0, 0, 0, 1, 1,
-0.2269232, 0.4137658, -1.483721, 0, 0, 0, 1, 1,
-0.2257149, 0.8377299, 0.3257286, 0, 0, 0, 1, 1,
-0.2248858, 0.1849688, -1.14619, 0, 0, 0, 1, 1,
-0.2219172, -0.1402373, -1.904601, 0, 0, 0, 1, 1,
-0.2218446, 0.5517349, -1.261886, 1, 1, 1, 1, 1,
-0.2215834, -0.5138418, -4.076868, 1, 1, 1, 1, 1,
-0.2167157, -0.4544488, -2.469139, 1, 1, 1, 1, 1,
-0.2156931, -0.5287573, -3.20226, 1, 1, 1, 1, 1,
-0.2149085, 1.124027, -0.3907955, 1, 1, 1, 1, 1,
-0.2138071, 0.4391027, -2.222745, 1, 1, 1, 1, 1,
-0.2118602, -0.9743319, -2.747294, 1, 1, 1, 1, 1,
-0.2013985, -1.382951, -4.828801, 1, 1, 1, 1, 1,
-0.2004797, 1.103394, -1.413849, 1, 1, 1, 1, 1,
-0.1954741, 0.1129567, -2.142378, 1, 1, 1, 1, 1,
-0.1950583, 1.443424, -1.415294, 1, 1, 1, 1, 1,
-0.192088, 0.2828122, -1.073943, 1, 1, 1, 1, 1,
-0.1907789, 0.5335375, -1.185246, 1, 1, 1, 1, 1,
-0.1893446, 0.5117813, -0.2876343, 1, 1, 1, 1, 1,
-0.1815501, -0.9017947, -3.608844, 1, 1, 1, 1, 1,
-0.1790359, 0.9401866, 0.6442902, 0, 0, 1, 1, 1,
-0.1644596, -0.7018385, -3.412299, 1, 0, 0, 1, 1,
-0.1635502, 0.03889226, -1.895486, 1, 0, 0, 1, 1,
-0.1613642, -0.1273376, -0.5834796, 1, 0, 0, 1, 1,
-0.1612705, -1.501645, -2.991183, 1, 0, 0, 1, 1,
-0.1589923, 0.1979352, -1.340832, 1, 0, 0, 1, 1,
-0.1558643, -1.416171, -1.515733, 0, 0, 0, 1, 1,
-0.1530949, -0.07608526, -3.064423, 0, 0, 0, 1, 1,
-0.1482679, -1.262625, -1.752308, 0, 0, 0, 1, 1,
-0.1436347, 1.341306, 0.001677713, 0, 0, 0, 1, 1,
-0.1418778, 0.5357954, -1.293761, 0, 0, 0, 1, 1,
-0.1414433, -0.8879004, -3.435743, 0, 0, 0, 1, 1,
-0.1387982, 0.4206505, -2.354214, 0, 0, 0, 1, 1,
-0.1372398, 1.404217, -1.235721, 1, 1, 1, 1, 1,
-0.1367346, 2.046417, 0.2776495, 1, 1, 1, 1, 1,
-0.1328836, -1.67097, -3.347934, 1, 1, 1, 1, 1,
-0.1322785, -0.3717116, -2.839059, 1, 1, 1, 1, 1,
-0.1259698, 1.385183, -0.1267038, 1, 1, 1, 1, 1,
-0.1219804, -0.7653381, -2.398962, 1, 1, 1, 1, 1,
-0.1180054, 0.08435992, -1.073889, 1, 1, 1, 1, 1,
-0.1077451, -0.1926651, -3.446714, 1, 1, 1, 1, 1,
-0.1044488, 0.2999547, -0.4643264, 1, 1, 1, 1, 1,
-0.1006586, -1.345289, -2.832862, 1, 1, 1, 1, 1,
-0.09920829, -0.4828369, -3.750136, 1, 1, 1, 1, 1,
-0.09296612, -2.49925, -2.120707, 1, 1, 1, 1, 1,
-0.08171991, -0.2797126, -1.78103, 1, 1, 1, 1, 1,
-0.0754573, 0.5029516, 0.6255445, 1, 1, 1, 1, 1,
-0.07474295, 0.463642, 1.43013, 1, 1, 1, 1, 1,
-0.07382043, -0.3276154, -3.982638, 0, 0, 1, 1, 1,
-0.07114713, 1.125894, 0.0729819, 1, 0, 0, 1, 1,
-0.07032067, 0.5729828, 2.78488, 1, 0, 0, 1, 1,
-0.06567334, 0.7448637, 0.9058927, 1, 0, 0, 1, 1,
-0.06455938, -0.8344944, -4.202669, 1, 0, 0, 1, 1,
-0.06261322, -0.5178161, -3.031941, 1, 0, 0, 1, 1,
-0.05823784, -0.3992443, -1.973834, 0, 0, 0, 1, 1,
-0.05816205, -0.03798414, -3.175181, 0, 0, 0, 1, 1,
-0.05614787, -1.204707, -2.240009, 0, 0, 0, 1, 1,
-0.05526736, 1.786474, -0.07985765, 0, 0, 0, 1, 1,
-0.04499688, -0.334588, -2.725292, 0, 0, 0, 1, 1,
-0.04400535, -0.09071176, -2.217081, 0, 0, 0, 1, 1,
-0.04040938, 0.761372, -0.08287988, 0, 0, 0, 1, 1,
-0.03881975, -0.3291364, -3.0053, 1, 1, 1, 1, 1,
-0.0354216, 0.6310889, 0.9869372, 1, 1, 1, 1, 1,
-0.02552607, 0.8914732, -0.8674517, 1, 1, 1, 1, 1,
-0.02349741, -0.2581651, -2.877853, 1, 1, 1, 1, 1,
-0.02305334, 0.07108819, 1.478971, 1, 1, 1, 1, 1,
-0.01492171, -0.6918197, -3.259983, 1, 1, 1, 1, 1,
-0.01235635, -1.819096, -1.959835, 1, 1, 1, 1, 1,
-0.01031069, 2.500778, 3.054186, 1, 1, 1, 1, 1,
-0.009864424, 0.2611366, -0.3292793, 1, 1, 1, 1, 1,
-0.008664348, -0.09724744, -3.564418, 1, 1, 1, 1, 1,
-0.004643339, -0.8662117, -2.920506, 1, 1, 1, 1, 1,
0.003557066, -0.0648219, 1.735134, 1, 1, 1, 1, 1,
0.005904196, 0.7704577, -0.3173754, 1, 1, 1, 1, 1,
0.006084574, 1.10988, -0.3620228, 1, 1, 1, 1, 1,
0.006942919, 0.3251148, 0.2779114, 1, 1, 1, 1, 1,
0.008331596, 1.014214, -0.8052764, 0, 0, 1, 1, 1,
0.00947808, 0.6863807, -0.8579041, 1, 0, 0, 1, 1,
0.01009926, -2.498301, 2.85951, 1, 0, 0, 1, 1,
0.01123318, -0.4973356, 4.751785, 1, 0, 0, 1, 1,
0.01366547, -0.1372383, 4.312032, 1, 0, 0, 1, 1,
0.01453814, -1.980047, 4.598424, 1, 0, 0, 1, 1,
0.02063411, 1.580072, -0.8697114, 0, 0, 0, 1, 1,
0.02161968, -0.6066206, 4.980039, 0, 0, 0, 1, 1,
0.0241488, -0.3903266, 3.343724, 0, 0, 0, 1, 1,
0.02878713, 0.1074617, -0.02382066, 0, 0, 0, 1, 1,
0.0306615, 1.646635, 0.2107536, 0, 0, 0, 1, 1,
0.0342901, -0.5366931, 2.77273, 0, 0, 0, 1, 1,
0.03844902, 0.3449945, 0.2349811, 0, 0, 0, 1, 1,
0.04137194, 1.436573, 0.8560423, 1, 1, 1, 1, 1,
0.04248262, -0.009732161, 2.002596, 1, 1, 1, 1, 1,
0.04353876, -0.02787296, 3.26693, 1, 1, 1, 1, 1,
0.04687212, -0.03373459, 2.707285, 1, 1, 1, 1, 1,
0.04735401, 0.1950923, 0.4253161, 1, 1, 1, 1, 1,
0.0496892, 1.857297, -1.025279, 1, 1, 1, 1, 1,
0.05155204, 0.9341093, -1.207745, 1, 1, 1, 1, 1,
0.05733716, -0.04917602, 1.693503, 1, 1, 1, 1, 1,
0.06070811, -1.558224, 3.61342, 1, 1, 1, 1, 1,
0.06177185, 0.9549831, 0.3595686, 1, 1, 1, 1, 1,
0.06215717, -0.5019598, 1.523385, 1, 1, 1, 1, 1,
0.06352347, 1.2519, -1.187088, 1, 1, 1, 1, 1,
0.06362572, -0.6485159, 0.9283134, 1, 1, 1, 1, 1,
0.0654045, -0.08911129, 0.779845, 1, 1, 1, 1, 1,
0.06715034, 1.634521, 1.012463, 1, 1, 1, 1, 1,
0.07056718, -1.477808, 4.188653, 0, 0, 1, 1, 1,
0.07165211, -0.5955788, 3.424088, 1, 0, 0, 1, 1,
0.07461708, -1.044968, 1.986825, 1, 0, 0, 1, 1,
0.07638117, 0.3483486, -2.298248, 1, 0, 0, 1, 1,
0.07794748, 2.264004, -0.4248574, 1, 0, 0, 1, 1,
0.08009865, -1.604139, 3.678903, 1, 0, 0, 1, 1,
0.08419298, -0.3536664, 2.085523, 0, 0, 0, 1, 1,
0.08920438, -1.031665, 2.474835, 0, 0, 0, 1, 1,
0.09029476, -1.716766, 3.867764, 0, 0, 0, 1, 1,
0.09431993, 1.271266, -2.390669, 0, 0, 0, 1, 1,
0.09455658, 1.294273, 0.215772, 0, 0, 0, 1, 1,
0.09747641, 0.1103603, -0.6633586, 0, 0, 0, 1, 1,
0.09872394, -1.838056, 3.17745, 0, 0, 0, 1, 1,
0.1013497, -0.1205574, 4.26488, 1, 1, 1, 1, 1,
0.102788, -1.322674, 3.545879, 1, 1, 1, 1, 1,
0.1074177, 0.08218853, 0.6340436, 1, 1, 1, 1, 1,
0.1078719, -1.16991, 3.937454, 1, 1, 1, 1, 1,
0.1084086, 0.4674075, 0.6187991, 1, 1, 1, 1, 1,
0.1156504, 1.183859, 2.570244, 1, 1, 1, 1, 1,
0.1204926, 0.4211435, -0.6967969, 1, 1, 1, 1, 1,
0.121049, 0.2362879, -0.1897997, 1, 1, 1, 1, 1,
0.1227334, 0.3289793, 1.128045, 1, 1, 1, 1, 1,
0.1303031, 0.05720697, 2.26222, 1, 1, 1, 1, 1,
0.1353321, -0.7551943, 2.35605, 1, 1, 1, 1, 1,
0.1401526, 0.6929506, -1.280332, 1, 1, 1, 1, 1,
0.140369, 0.02620144, 0.4431099, 1, 1, 1, 1, 1,
0.1421163, -0.09826028, 3.049335, 1, 1, 1, 1, 1,
0.1468208, -1.164084, 4.519753, 1, 1, 1, 1, 1,
0.1489879, -1.921656, 3.270028, 0, 0, 1, 1, 1,
0.149615, 0.1908869, -0.2748197, 1, 0, 0, 1, 1,
0.1523685, -1.231458, 4.428229, 1, 0, 0, 1, 1,
0.1603437, 0.2225972, -0.06528018, 1, 0, 0, 1, 1,
0.1608133, -1.216973, 2.509566, 1, 0, 0, 1, 1,
0.1610962, -1.181275, 3.934613, 1, 0, 0, 1, 1,
0.1691211, -1.320321, 2.375818, 0, 0, 0, 1, 1,
0.1709149, -2.001049, 2.281634, 0, 0, 0, 1, 1,
0.1719898, -0.8161127, 2.887394, 0, 0, 0, 1, 1,
0.1722526, -0.485558, 2.932634, 0, 0, 0, 1, 1,
0.1722773, 0.4101272, 1.012001, 0, 0, 0, 1, 1,
0.1788743, -0.1896158, 2.107165, 0, 0, 0, 1, 1,
0.1817105, -0.1134345, 2.058137, 0, 0, 0, 1, 1,
0.1818211, -0.08983725, 3.686469, 1, 1, 1, 1, 1,
0.1820501, -0.485644, 2.319696, 1, 1, 1, 1, 1,
0.1833717, 1.605977, -0.3008721, 1, 1, 1, 1, 1,
0.1836538, 1.878465, -0.6796572, 1, 1, 1, 1, 1,
0.1842954, -0.5740292, 3.961598, 1, 1, 1, 1, 1,
0.1924598, 0.239438, -0.2712263, 1, 1, 1, 1, 1,
0.1966117, 1.100205, -0.1165794, 1, 1, 1, 1, 1,
0.2032956, 1.074616, 2.452928, 1, 1, 1, 1, 1,
0.2110949, 0.09076454, -1.215915, 1, 1, 1, 1, 1,
0.2146642, -1.578134, 0.762745, 1, 1, 1, 1, 1,
0.2170111, 0.5960021, 0.6072267, 1, 1, 1, 1, 1,
0.2176716, 2.042119, -0.5069491, 1, 1, 1, 1, 1,
0.2221573, 0.222574, 3.230214, 1, 1, 1, 1, 1,
0.2266922, -1.136233, 2.480191, 1, 1, 1, 1, 1,
0.2288639, 0.08574577, 0.5088952, 1, 1, 1, 1, 1,
0.2306351, -1.476309, 1.405481, 0, 0, 1, 1, 1,
0.2311655, -0.386001, 2.77796, 1, 0, 0, 1, 1,
0.2328973, -0.1420944, 3.220984, 1, 0, 0, 1, 1,
0.2332605, -0.1735912, 1.746962, 1, 0, 0, 1, 1,
0.2352747, -2.562364, 2.854242, 1, 0, 0, 1, 1,
0.2354236, 1.152233, 0.4008495, 1, 0, 0, 1, 1,
0.2382159, 0.6968246, 0.813253, 0, 0, 0, 1, 1,
0.238273, 0.2891941, 0.6680698, 0, 0, 0, 1, 1,
0.2392165, 0.870986, -0.7505705, 0, 0, 0, 1, 1,
0.2393467, -0.620711, 4.268389, 0, 0, 0, 1, 1,
0.2417466, -2.951866, 3.386584, 0, 0, 0, 1, 1,
0.2454685, 1.493391, 0.08624572, 0, 0, 0, 1, 1,
0.2484064, -0.6782281, 3.484052, 0, 0, 0, 1, 1,
0.2497182, 0.5837458, -0.7948316, 1, 1, 1, 1, 1,
0.2510947, -1.571757, 2.402467, 1, 1, 1, 1, 1,
0.2518093, -0.5266293, 4.97154, 1, 1, 1, 1, 1,
0.255918, 0.9166645, -0.1307886, 1, 1, 1, 1, 1,
0.2589019, -0.1243106, 2.062822, 1, 1, 1, 1, 1,
0.2592703, -0.9790686, 2.465782, 1, 1, 1, 1, 1,
0.2625687, -1.000141, 1.895617, 1, 1, 1, 1, 1,
0.2646518, 1.877008, 1.426286, 1, 1, 1, 1, 1,
0.2663721, 0.0938782, 0.6447504, 1, 1, 1, 1, 1,
0.2678481, -0.7533571, 3.852749, 1, 1, 1, 1, 1,
0.2694419, -0.6769721, 1.332016, 1, 1, 1, 1, 1,
0.2707928, 0.3993253, 0.928262, 1, 1, 1, 1, 1,
0.2723444, -0.9900587, 2.769911, 1, 1, 1, 1, 1,
0.2723813, -0.6463786, 3.180346, 1, 1, 1, 1, 1,
0.2810513, -0.4935549, 2.824474, 1, 1, 1, 1, 1,
0.2818336, -1.038711, 3.626251, 0, 0, 1, 1, 1,
0.2830358, -0.5960884, 1.777975, 1, 0, 0, 1, 1,
0.2838404, -0.04909437, -0.5780129, 1, 0, 0, 1, 1,
0.2839925, -0.03418703, 1.978939, 1, 0, 0, 1, 1,
0.285264, -0.1578221, 1.360427, 1, 0, 0, 1, 1,
0.2855599, -1.671486, 3.007767, 1, 0, 0, 1, 1,
0.2881175, 1.409995, 0.05547545, 0, 0, 0, 1, 1,
0.2892029, 0.4421242, 0.5172833, 0, 0, 0, 1, 1,
0.2916097, -0.206619, 1.585247, 0, 0, 0, 1, 1,
0.2916216, 0.5666, 0.1445401, 0, 0, 0, 1, 1,
0.2923974, 0.3501201, 1.242519, 0, 0, 0, 1, 1,
0.2927854, -0.2171734, 1.781191, 0, 0, 0, 1, 1,
0.293004, 0.110812, 1.407659, 0, 0, 0, 1, 1,
0.2937002, 1.276563, -0.4780039, 1, 1, 1, 1, 1,
0.2966632, 1.73145, 0.6405185, 1, 1, 1, 1, 1,
0.298622, 0.581399, -0.2059983, 1, 1, 1, 1, 1,
0.3022786, 0.7643078, -0.5156857, 1, 1, 1, 1, 1,
0.3032528, 1.225725, 0.543979, 1, 1, 1, 1, 1,
0.3104866, 0.9008415, 0.6171544, 1, 1, 1, 1, 1,
0.3122536, 0.6037833, 0.1857943, 1, 1, 1, 1, 1,
0.3142317, 0.7502716, -0.7505778, 1, 1, 1, 1, 1,
0.3149014, -0.471278, 1.616966, 1, 1, 1, 1, 1,
0.3171053, -0.7876952, 2.66042, 1, 1, 1, 1, 1,
0.3177003, -0.0706519, 1.58866, 1, 1, 1, 1, 1,
0.3268777, -0.5950271, 2.25708, 1, 1, 1, 1, 1,
0.3286374, -1.233337, 2.995353, 1, 1, 1, 1, 1,
0.3375586, 0.91501, 1.099336, 1, 1, 1, 1, 1,
0.3557754, -0.4164763, 3.735612, 1, 1, 1, 1, 1,
0.3624096, -0.1226767, 2.626554, 0, 0, 1, 1, 1,
0.3665467, -0.5178983, 3.093776, 1, 0, 0, 1, 1,
0.3698632, 0.6517091, -0.918425, 1, 0, 0, 1, 1,
0.3712242, 0.9752526, 1.65085, 1, 0, 0, 1, 1,
0.3712474, -0.1417008, 2.07958, 1, 0, 0, 1, 1,
0.3735834, -0.9645769, 2.635337, 1, 0, 0, 1, 1,
0.3758307, 1.063163, -1.671609, 0, 0, 0, 1, 1,
0.3796566, 1.038447, 0.4651487, 0, 0, 0, 1, 1,
0.3807775, 1.279162, 1.705694, 0, 0, 0, 1, 1,
0.383702, 1.423518, -0.6403786, 0, 0, 0, 1, 1,
0.3867553, -1.085375, 2.666384, 0, 0, 0, 1, 1,
0.3946022, 0.3192454, 1.807623, 0, 0, 0, 1, 1,
0.3999747, 0.4921097, 0.7077067, 0, 0, 0, 1, 1,
0.4103454, -0.2103191, 1.649466, 1, 1, 1, 1, 1,
0.4118313, -0.5753641, 3.059314, 1, 1, 1, 1, 1,
0.4141845, -1.063508, 2.930959, 1, 1, 1, 1, 1,
0.4148435, -0.3801781, 3.365069, 1, 1, 1, 1, 1,
0.4180103, -1.160446, 2.088079, 1, 1, 1, 1, 1,
0.4187609, 1.870431, 0.977928, 1, 1, 1, 1, 1,
0.4214479, -0.2277706, 3.277681, 1, 1, 1, 1, 1,
0.4215566, -0.8918935, 3.315858, 1, 1, 1, 1, 1,
0.4239624, 2.025756, -1.961993, 1, 1, 1, 1, 1,
0.4274647, 1.74486, 0.4807497, 1, 1, 1, 1, 1,
0.4283529, -1.512942, 2.376136, 1, 1, 1, 1, 1,
0.4323763, 0.9685705, 1.815763, 1, 1, 1, 1, 1,
0.4328109, 0.712669, 2.564491, 1, 1, 1, 1, 1,
0.4368793, -0.3708981, 1.45619, 1, 1, 1, 1, 1,
0.4371279, 0.1426617, 0.7116392, 1, 1, 1, 1, 1,
0.4384858, -1.92535, 2.816144, 0, 0, 1, 1, 1,
0.438944, -1.814375, 3.881881, 1, 0, 0, 1, 1,
0.4407825, 1.308687, -0.8579298, 1, 0, 0, 1, 1,
0.4417776, 0.4436356, 0.9493392, 1, 0, 0, 1, 1,
0.4426532, -0.6638908, 3.127702, 1, 0, 0, 1, 1,
0.4449004, -2.948974, 4.127829, 1, 0, 0, 1, 1,
0.4485084, 0.4773258, 0.2704458, 0, 0, 0, 1, 1,
0.4498039, 2.651148, 1.788525, 0, 0, 0, 1, 1,
0.4506897, -0.5680715, 3.778137, 0, 0, 0, 1, 1,
0.4569809, 0.534514, 1.540392, 0, 0, 0, 1, 1,
0.4637508, -0.264646, 0.06485856, 0, 0, 0, 1, 1,
0.4643803, 0.03924292, 2.015613, 0, 0, 0, 1, 1,
0.4668278, -0.8585473, 3.240257, 0, 0, 0, 1, 1,
0.4668659, 2.871143, 0.5264688, 1, 1, 1, 1, 1,
0.4725878, -0.2833023, 2.580577, 1, 1, 1, 1, 1,
0.4729979, 0.4365721, -1.048091, 1, 1, 1, 1, 1,
0.4760016, -2.034481, 3.11873, 1, 1, 1, 1, 1,
0.4816199, -0.6847235, 2.24114, 1, 1, 1, 1, 1,
0.4839496, -1.752033, 2.178377, 1, 1, 1, 1, 1,
0.4918029, 0.9589252, 0.4020158, 1, 1, 1, 1, 1,
0.4943144, -0.584294, 1.545084, 1, 1, 1, 1, 1,
0.4953859, 0.6618217, 1.481574, 1, 1, 1, 1, 1,
0.4967298, -0.2006229, 2.505438, 1, 1, 1, 1, 1,
0.5036851, -0.3344909, 2.833461, 1, 1, 1, 1, 1,
0.5127639, -0.1990233, 2.32458, 1, 1, 1, 1, 1,
0.5132399, 0.4232941, 1.427836, 1, 1, 1, 1, 1,
0.5133686, -1.184678, 4.173457, 1, 1, 1, 1, 1,
0.5158478, -2.386218, 3.133921, 1, 1, 1, 1, 1,
0.5158721, 0.5969063, 0.1027578, 0, 0, 1, 1, 1,
0.5159206, -0.2317386, 3.141836, 1, 0, 0, 1, 1,
0.5187297, -1.223199, 1.761587, 1, 0, 0, 1, 1,
0.5285351, -0.2711245, 0.4118345, 1, 0, 0, 1, 1,
0.5370839, 0.5921906, 2.090251, 1, 0, 0, 1, 1,
0.5377793, -0.03075383, 1.523093, 1, 0, 0, 1, 1,
0.5464262, -0.1798247, 1.81365, 0, 0, 0, 1, 1,
0.5465524, 0.3825107, 1.955122, 0, 0, 0, 1, 1,
0.5491092, 1.437581, 1.714858, 0, 0, 0, 1, 1,
0.5491183, -0.2559204, 2.276018, 0, 0, 0, 1, 1,
0.5494397, 0.2925245, 0.7616835, 0, 0, 0, 1, 1,
0.551464, -0.1011885, 2.399026, 0, 0, 0, 1, 1,
0.5527009, 0.8054487, 1.969301, 0, 0, 0, 1, 1,
0.5532566, 1.330647, -0.4694108, 1, 1, 1, 1, 1,
0.5597261, -1.701645, 2.198867, 1, 1, 1, 1, 1,
0.5605909, -1.927636, 4.723131, 1, 1, 1, 1, 1,
0.5736546, -0.07136543, 0.8351406, 1, 1, 1, 1, 1,
0.5736834, -1.294427, 1.40696, 1, 1, 1, 1, 1,
0.5739441, 0.8407502, 1.311605, 1, 1, 1, 1, 1,
0.5748911, -0.4382997, 2.462446, 1, 1, 1, 1, 1,
0.5748915, 0.3122582, -0.3023103, 1, 1, 1, 1, 1,
0.5755575, -1.711789, 3.27593, 1, 1, 1, 1, 1,
0.5778436, 0.5858831, 0.04337173, 1, 1, 1, 1, 1,
0.5787563, 1.844143, -0.4656639, 1, 1, 1, 1, 1,
0.5794759, -0.8361548, 2.339135, 1, 1, 1, 1, 1,
0.5842972, 0.9454266, -0.7751449, 1, 1, 1, 1, 1,
0.5856509, -1.196775, 1.912864, 1, 1, 1, 1, 1,
0.5893672, -0.5836519, 2.524144, 1, 1, 1, 1, 1,
0.5933028, 0.5935323, 1.021435, 0, 0, 1, 1, 1,
0.598914, -1.958407, 2.766722, 1, 0, 0, 1, 1,
0.5998065, 0.006232042, 1.900421, 1, 0, 0, 1, 1,
0.6001841, -1.443083, 2.339913, 1, 0, 0, 1, 1,
0.6015994, 1.341717, 0.87886, 1, 0, 0, 1, 1,
0.6018589, -0.3721368, 2.846472, 1, 0, 0, 1, 1,
0.6024972, -1.186125, 3.242407, 0, 0, 0, 1, 1,
0.608169, 1.342777, 0.2611408, 0, 0, 0, 1, 1,
0.6087692, 0.07989429, 1.773193, 0, 0, 0, 1, 1,
0.611953, -0.9008279, 2.500248, 0, 0, 0, 1, 1,
0.6134647, 0.8380874, 1.13051, 0, 0, 0, 1, 1,
0.6222552, 1.04268, -1.015327, 0, 0, 0, 1, 1,
0.6318169, 0.6319789, 0.4205081, 0, 0, 0, 1, 1,
0.6359722, -1.024428, 4.219458, 1, 1, 1, 1, 1,
0.6369315, -1.344182, 3.946702, 1, 1, 1, 1, 1,
0.6413186, -0.1222359, 1.129651, 1, 1, 1, 1, 1,
0.6426885, 0.4977756, 1.598804, 1, 1, 1, 1, 1,
0.6450255, 0.02918692, -0.1053995, 1, 1, 1, 1, 1,
0.6473543, 0.170645, 0.8533628, 1, 1, 1, 1, 1,
0.6509086, -0.06066786, 1.551891, 1, 1, 1, 1, 1,
0.6552277, 0.9594359, -0.03892222, 1, 1, 1, 1, 1,
0.6602629, -2.606387, 2.170206, 1, 1, 1, 1, 1,
0.6615288, 1.870105, 1.458211, 1, 1, 1, 1, 1,
0.6629524, 3.014283, 0.1275048, 1, 1, 1, 1, 1,
0.666591, -0.6386766, 2.458548, 1, 1, 1, 1, 1,
0.6691239, -0.2158223, 2.909465, 1, 1, 1, 1, 1,
0.6724796, 0.4941683, 3.248771, 1, 1, 1, 1, 1,
0.6731694, -0.02771808, 2.431625, 1, 1, 1, 1, 1,
0.6815543, -1.504249, 4.05103, 0, 0, 1, 1, 1,
0.6829207, 1.583401, 0.2289723, 1, 0, 0, 1, 1,
0.6841402, -0.06003243, 1.343434, 1, 0, 0, 1, 1,
0.6841692, 1.182277, 0.4271784, 1, 0, 0, 1, 1,
0.6877274, -0.6394632, 2.719688, 1, 0, 0, 1, 1,
0.6918724, 0.7571428, -0.4896582, 1, 0, 0, 1, 1,
0.6922378, -1.283376, 1.303992, 0, 0, 0, 1, 1,
0.6946691, 0.6251587, -0.08768927, 0, 0, 0, 1, 1,
0.7023901, 0.1920925, 1.131309, 0, 0, 0, 1, 1,
0.7085404, -0.222926, 1.34967, 0, 0, 0, 1, 1,
0.712472, -0.4371863, 0.4716919, 0, 0, 0, 1, 1,
0.713914, 0.1807931, 2.14395, 0, 0, 0, 1, 1,
0.7187851, -0.6665027, 1.051641, 0, 0, 0, 1, 1,
0.7249081, 0.5453463, 1.239953, 1, 1, 1, 1, 1,
0.7264822, 0.1687646, 1.829348, 1, 1, 1, 1, 1,
0.7294295, 0.4473448, 1.421973, 1, 1, 1, 1, 1,
0.7411824, -0.7986524, 0.7407141, 1, 1, 1, 1, 1,
0.7424216, -1.70255, 1.921276, 1, 1, 1, 1, 1,
0.748579, 1.148039, 0.5527316, 1, 1, 1, 1, 1,
0.7514304, 0.1295414, 2.478922, 1, 1, 1, 1, 1,
0.7580111, 0.589116, -0.2196781, 1, 1, 1, 1, 1,
0.7627835, 1.02754, 1.263864, 1, 1, 1, 1, 1,
0.7663125, 1.006576, 0.6845127, 1, 1, 1, 1, 1,
0.7693036, -0.8175054, 3.61616, 1, 1, 1, 1, 1,
0.7694585, 0.5310222, 0.8671824, 1, 1, 1, 1, 1,
0.7727401, -0.4560342, 1.040042, 1, 1, 1, 1, 1,
0.7734202, -0.2576759, 2.530537, 1, 1, 1, 1, 1,
0.7783108, -0.1708132, 0.7453221, 1, 1, 1, 1, 1,
0.7787767, -1.813044, 4.370243, 0, 0, 1, 1, 1,
0.7801613, -0.2246896, 0.8151738, 1, 0, 0, 1, 1,
0.7870693, 0.6274258, 1.663635, 1, 0, 0, 1, 1,
0.7938521, -0.9453426, 2.630261, 1, 0, 0, 1, 1,
0.7956046, 0.1561987, 1.056798, 1, 0, 0, 1, 1,
0.7986988, -1.857538, 3.369014, 1, 0, 0, 1, 1,
0.8030856, 0.06022364, 0.3258179, 0, 0, 0, 1, 1,
0.8063, 0.5019669, 1.140734, 0, 0, 0, 1, 1,
0.8076667, -1.647169, 3.288434, 0, 0, 0, 1, 1,
0.8079045, 1.489332, 1.123762, 0, 0, 0, 1, 1,
0.8089845, -0.1304697, 1.321491, 0, 0, 0, 1, 1,
0.8093463, -0.3264539, 1.325949, 0, 0, 0, 1, 1,
0.80953, -0.6896564, 1.829106, 0, 0, 0, 1, 1,
0.8098768, 0.1732738, 0.4885661, 1, 1, 1, 1, 1,
0.8135136, -1.74154, 2.398491, 1, 1, 1, 1, 1,
0.8150386, -0.06794559, 1.155138, 1, 1, 1, 1, 1,
0.8168809, 0.2107785, 1.314174, 1, 1, 1, 1, 1,
0.8186471, -0.2441351, 0.1569023, 1, 1, 1, 1, 1,
0.8187105, 1.72978, 0.2828605, 1, 1, 1, 1, 1,
0.8193333, -0.7369232, 2.683006, 1, 1, 1, 1, 1,
0.8250036, 0.02299935, 0.6668164, 1, 1, 1, 1, 1,
0.8253877, 1.62159, 1.954963, 1, 1, 1, 1, 1,
0.8287043, 0.5749742, 3.319088, 1, 1, 1, 1, 1,
0.8287739, 1.045928, 1.688201, 1, 1, 1, 1, 1,
0.8292418, 1.290775, 2.427555, 1, 1, 1, 1, 1,
0.8335535, -1.652436, 2.177713, 1, 1, 1, 1, 1,
0.8390291, 0.9436575, 0.6522713, 1, 1, 1, 1, 1,
0.8394593, -1.176161, 3.383031, 1, 1, 1, 1, 1,
0.8473758, 1.290508, -0.6369095, 0, 0, 1, 1, 1,
0.8572556, -0.8865542, 2.021921, 1, 0, 0, 1, 1,
0.8639169, 0.8215702, 1.264796, 1, 0, 0, 1, 1,
0.8665344, 0.9240813, 1.982261, 1, 0, 0, 1, 1,
0.87954, 1.140923, 0.2976511, 1, 0, 0, 1, 1,
0.8835599, 0.26013, 1.042157, 1, 0, 0, 1, 1,
0.8851199, 1.085372, 0.2865447, 0, 0, 0, 1, 1,
0.8868114, 0.915696, 1.618599, 0, 0, 0, 1, 1,
0.8879462, 0.9445235, -0.577756, 0, 0, 0, 1, 1,
0.8887332, -0.555501, 0.8679036, 0, 0, 0, 1, 1,
0.8915042, 0.599375, 2.592101, 0, 0, 0, 1, 1,
0.8932586, 0.599614, 0.524553, 0, 0, 0, 1, 1,
0.9023663, -1.700021, 1.995293, 0, 0, 0, 1, 1,
0.9049206, -0.1358943, 3.092758, 1, 1, 1, 1, 1,
0.9065694, -1.766905, 3.101255, 1, 1, 1, 1, 1,
0.9098243, 0.7172929, 2.442945, 1, 1, 1, 1, 1,
0.9101709, 1.463353, 1.375141, 1, 1, 1, 1, 1,
0.9149656, 0.03461399, -0.3435772, 1, 1, 1, 1, 1,
0.918906, -0.9681605, 2.884443, 1, 1, 1, 1, 1,
0.9228038, 0.6617335, 1.611031, 1, 1, 1, 1, 1,
0.9250638, 0.005597725, 0.529274, 1, 1, 1, 1, 1,
0.9254509, -0.5835746, 3.63393, 1, 1, 1, 1, 1,
0.9261649, 0.2789416, 1.588777, 1, 1, 1, 1, 1,
0.9261707, -0.1807933, 2.280927, 1, 1, 1, 1, 1,
0.9304277, 0.06027808, 1.484814, 1, 1, 1, 1, 1,
0.9312276, 0.1851903, 1.935808, 1, 1, 1, 1, 1,
0.9363195, 1.989128, 0.2210536, 1, 1, 1, 1, 1,
0.936431, -0.7429907, 3.686365, 1, 1, 1, 1, 1,
0.9373263, -0.00582436, -0.03768134, 0, 0, 1, 1, 1,
0.9409177, 0.490635, 1.181605, 1, 0, 0, 1, 1,
0.9421075, 0.2932133, 0.6569358, 1, 0, 0, 1, 1,
0.9677535, 0.1998799, 0.881478, 1, 0, 0, 1, 1,
0.9707783, -0.7388234, 2.246518, 1, 0, 0, 1, 1,
0.9710072, -1.712527, 2.029434, 1, 0, 0, 1, 1,
0.9742352, 1.049156, 0.1219829, 0, 0, 0, 1, 1,
0.9841738, -1.866855, 2.408945, 0, 0, 0, 1, 1,
0.9916821, -0.1997781, 2.972118, 0, 0, 0, 1, 1,
0.992699, 0.1604682, 2.211338, 0, 0, 0, 1, 1,
0.9962645, -1.248773, 2.060257, 0, 0, 0, 1, 1,
0.9995149, 0.7356346, 1.456376, 0, 0, 0, 1, 1,
1.003804, -0.1519059, 1.249114, 0, 0, 0, 1, 1,
1.004675, 0.2283784, 2.438242, 1, 1, 1, 1, 1,
1.015769, 0.1274634, 2.855521, 1, 1, 1, 1, 1,
1.0213, 0.734776, 1.520539, 1, 1, 1, 1, 1,
1.032545, -0.2104224, 0.889872, 1, 1, 1, 1, 1,
1.033312, -0.671155, 1.103063, 1, 1, 1, 1, 1,
1.039247, 0.6397786, 2.602748, 1, 1, 1, 1, 1,
1.046223, -1.697176, 3.058606, 1, 1, 1, 1, 1,
1.048875, -0.06900965, 1.220293, 1, 1, 1, 1, 1,
1.049007, -0.3658121, 2.637428, 1, 1, 1, 1, 1,
1.052746, 0.3056003, -1.323469, 1, 1, 1, 1, 1,
1.053253, -1.210468, 2.729593, 1, 1, 1, 1, 1,
1.054545, 0.9617288, 0.4172169, 1, 1, 1, 1, 1,
1.055833, -0.6591907, 1.762831, 1, 1, 1, 1, 1,
1.057941, 0.1247547, 3.454217, 1, 1, 1, 1, 1,
1.061472, 0.4244095, 1.127505, 1, 1, 1, 1, 1,
1.061724, 1.652201, -1.498219, 0, 0, 1, 1, 1,
1.083601, -1.332675, 2.694579, 1, 0, 0, 1, 1,
1.084338, 1.79941, 1.50985, 1, 0, 0, 1, 1,
1.087848, -1.177903, 0.6936061, 1, 0, 0, 1, 1,
1.111617, 0.3838399, 1.771179, 1, 0, 0, 1, 1,
1.113281, -0.03991057, 1.851311, 1, 0, 0, 1, 1,
1.122387, -0.5469427, 2.454318, 0, 0, 0, 1, 1,
1.129654, 0.3623567, 1.418436, 0, 0, 0, 1, 1,
1.138381, 0.2365093, 2.055333, 0, 0, 0, 1, 1,
1.146277, 1.145622, -0.9302038, 0, 0, 0, 1, 1,
1.149215, 0.4851128, 0.1273766, 0, 0, 0, 1, 1,
1.16892, -0.1104158, 1.525622, 0, 0, 0, 1, 1,
1.173855, 1.153954, 0.7179929, 0, 0, 0, 1, 1,
1.191581, 0.4191316, 0.1877532, 1, 1, 1, 1, 1,
1.215151, 1.044336, -0.06387392, 1, 1, 1, 1, 1,
1.215376, 1.789084, -0.6445013, 1, 1, 1, 1, 1,
1.216449, 0.6855559, 1.487575, 1, 1, 1, 1, 1,
1.224729, 0.4228137, 0.8528539, 1, 1, 1, 1, 1,
1.226189, 0.05205448, 0.9222524, 1, 1, 1, 1, 1,
1.230393, 0.5218759, 1.29949, 1, 1, 1, 1, 1,
1.238301, -0.6616193, 1.672476, 1, 1, 1, 1, 1,
1.247146, 0.1224401, 0.9851321, 1, 1, 1, 1, 1,
1.257615, 1.659573, 1.620518, 1, 1, 1, 1, 1,
1.263411, -0.6422821, 1.996648, 1, 1, 1, 1, 1,
1.268496, -0.9327121, 2.988461, 1, 1, 1, 1, 1,
1.27218, -0.4205666, 1.09514, 1, 1, 1, 1, 1,
1.281246, -1.074384, 3.076738, 1, 1, 1, 1, 1,
1.282558, 0.445087, 0.1976766, 1, 1, 1, 1, 1,
1.284548, -0.1853657, 1.187732, 0, 0, 1, 1, 1,
1.293571, -0.5820953, 3.509433, 1, 0, 0, 1, 1,
1.297945, 0.5387027, 1.010473, 1, 0, 0, 1, 1,
1.30462, -1.205299, 1.595661, 1, 0, 0, 1, 1,
1.317429, -0.5710888, 1.170485, 1, 0, 0, 1, 1,
1.332713, -1.237246, 2.766798, 1, 0, 0, 1, 1,
1.337401, -0.9053745, 4.49092, 0, 0, 0, 1, 1,
1.338715, 0.4290805, -0.1253667, 0, 0, 0, 1, 1,
1.349012, -0.5157783, 2.689222, 0, 0, 0, 1, 1,
1.350163, -1.864978, 1.626846, 0, 0, 0, 1, 1,
1.35766, -0.1546332, 1.763385, 0, 0, 0, 1, 1,
1.367777, -0.7399971, 3.316949, 0, 0, 0, 1, 1,
1.37581, 0.6952801, 0.2973019, 0, 0, 0, 1, 1,
1.388447, 1.4119, 2.642414, 1, 1, 1, 1, 1,
1.389382, 0.5724297, 0.6281816, 1, 1, 1, 1, 1,
1.397197, -0.8878286, 1.503426, 1, 1, 1, 1, 1,
1.413817, -1.40402, 0.9433119, 1, 1, 1, 1, 1,
1.418688, -1.084294, 1.870161, 1, 1, 1, 1, 1,
1.427976, 1.286364, 1.436212, 1, 1, 1, 1, 1,
1.437287, 1.072554, 0.1891177, 1, 1, 1, 1, 1,
1.452586, -1.126031, 0.8849224, 1, 1, 1, 1, 1,
1.452602, -0.3114234, 1.51527, 1, 1, 1, 1, 1,
1.454968, -2.005209, 3.52818, 1, 1, 1, 1, 1,
1.473968, -0.6697034, 2.132665, 1, 1, 1, 1, 1,
1.474385, -0.622548, 3.282071, 1, 1, 1, 1, 1,
1.484683, -0.6311839, 0.8815219, 1, 1, 1, 1, 1,
1.487821, -0.6905912, 1.368416, 1, 1, 1, 1, 1,
1.491381, -0.9568633, 0.9497902, 1, 1, 1, 1, 1,
1.496103, -0.7589251, 1.499139, 0, 0, 1, 1, 1,
1.499985, -0.4735497, 1.238568, 1, 0, 0, 1, 1,
1.506167, -0.6002887, 2.068242, 1, 0, 0, 1, 1,
1.507718, 0.3847997, 2.362455, 1, 0, 0, 1, 1,
1.508361, 2.817532, -1.358608, 1, 0, 0, 1, 1,
1.513922, 2.036497, -0.634027, 1, 0, 0, 1, 1,
1.521794, 0.9197052, 1.278145, 0, 0, 0, 1, 1,
1.526381, -0.09368356, 0.7787232, 0, 0, 0, 1, 1,
1.530641, 0.5334221, -0.8886141, 0, 0, 0, 1, 1,
1.539455, 0.2212683, 2.019415, 0, 0, 0, 1, 1,
1.55155, 0.2267262, 1.458131, 0, 0, 0, 1, 1,
1.561864, 2.379655, 1.847279, 0, 0, 0, 1, 1,
1.56747, 0.4463094, 3.349874, 0, 0, 0, 1, 1,
1.580235, -0.2019195, 2.904853, 1, 1, 1, 1, 1,
1.603165, 0.218944, 1.603939, 1, 1, 1, 1, 1,
1.612094, 0.4993725, 1.93872, 1, 1, 1, 1, 1,
1.628335, 0.9189016, 0.03545369, 1, 1, 1, 1, 1,
1.63583, -0.01210472, -0.9659556, 1, 1, 1, 1, 1,
1.643505, 0.2113265, 4.273118, 1, 1, 1, 1, 1,
1.645427, 1.426856, 1.520752, 1, 1, 1, 1, 1,
1.665511, -1.040888, 1.996355, 1, 1, 1, 1, 1,
1.681254, -1.719579, 2.018562, 1, 1, 1, 1, 1,
1.686621, 0.116256, 2.098188, 1, 1, 1, 1, 1,
1.690394, 1.330195, 2.321191, 1, 1, 1, 1, 1,
1.691799, 0.3397308, 0.8555609, 1, 1, 1, 1, 1,
1.703939, 1.113767, 1.370214, 1, 1, 1, 1, 1,
1.713069, -0.8323806, 1.546347, 1, 1, 1, 1, 1,
1.725094, 0.2333097, 0.5562967, 1, 1, 1, 1, 1,
1.739918, -1.637839, 0.4656038, 0, 0, 1, 1, 1,
1.748782, 0.9023969, 2.552864, 1, 0, 0, 1, 1,
1.75013, -2.874133, 3.26603, 1, 0, 0, 1, 1,
1.760491, -0.2245109, 0.7690733, 1, 0, 0, 1, 1,
1.762146, -2.266273, 2.616298, 1, 0, 0, 1, 1,
1.778847, 1.675249, 0.4861239, 1, 0, 0, 1, 1,
1.801741, -0.1833259, 1.42045, 0, 0, 0, 1, 1,
1.806405, -0.6227827, 2.617594, 0, 0, 0, 1, 1,
1.813898, -0.08316074, 0.2149497, 0, 0, 0, 1, 1,
1.840527, 0.08847994, 1.279864, 0, 0, 0, 1, 1,
1.850793, -0.114019, 0.262137, 0, 0, 0, 1, 1,
1.860294, 0.1491733, 2.317478, 0, 0, 0, 1, 1,
1.899545, -0.2433793, 0.2044974, 0, 0, 0, 1, 1,
1.91177, -0.1634297, 1.86261, 1, 1, 1, 1, 1,
1.924322, -1.693805, -0.5476757, 1, 1, 1, 1, 1,
1.927678, 1.334941, -0.2654389, 1, 1, 1, 1, 1,
1.936492, 0.1714178, 0.904321, 1, 1, 1, 1, 1,
1.965215, -0.8481402, 4.291621, 1, 1, 1, 1, 1,
1.966151, -1.085055, 2.228145, 1, 1, 1, 1, 1,
1.9708, -0.539045, 2.654685, 1, 1, 1, 1, 1,
1.981937, 0.7139713, 1.90837, 1, 1, 1, 1, 1,
1.987369, 0.7081167, 0.7678631, 1, 1, 1, 1, 1,
1.99369, -1.211485, 1.817073, 1, 1, 1, 1, 1,
1.995489, -0.2781427, 1.840221, 1, 1, 1, 1, 1,
2.017636, 0.3006586, 0.9479925, 1, 1, 1, 1, 1,
2.027198, -0.2413547, 2.232658, 1, 1, 1, 1, 1,
2.032899, -0.1248479, 3.97863, 1, 1, 1, 1, 1,
2.03811, -0.6237916, 2.52794, 1, 1, 1, 1, 1,
2.070208, 1.517975, -1.325502, 0, 0, 1, 1, 1,
2.082393, 0.5670399, 0.5283207, 1, 0, 0, 1, 1,
2.106938, 0.8607138, 0.09056803, 1, 0, 0, 1, 1,
2.121327, 0.341689, 2.456516, 1, 0, 0, 1, 1,
2.157218, -0.901909, 1.964442, 1, 0, 0, 1, 1,
2.198952, 0.1800813, 2.051833, 1, 0, 0, 1, 1,
2.214337, -1.893314, 2.395925, 0, 0, 0, 1, 1,
2.251803, -0.9803597, 1.796458, 0, 0, 0, 1, 1,
2.273628, 0.9345815, 1.682399, 0, 0, 0, 1, 1,
2.280087, -0.111386, 0.940675, 0, 0, 0, 1, 1,
2.297634, 0.6556768, -0.2363773, 0, 0, 0, 1, 1,
2.334627, -0.143814, 3.764, 0, 0, 0, 1, 1,
2.377077, -0.3024807, -0.5348905, 0, 0, 0, 1, 1,
2.474163, 2.192878, 1.667558, 1, 1, 1, 1, 1,
2.517457, 0.1922652, 1.628322, 1, 1, 1, 1, 1,
2.588239, -0.2037879, 2.781285, 1, 1, 1, 1, 1,
2.696819, 0.5909417, 1.384952, 1, 1, 1, 1, 1,
2.787166, 0.4412016, 0.6883626, 1, 1, 1, 1, 1,
2.961878, -0.5634986, 1.717528, 1, 1, 1, 1, 1,
3.465358, 1.433666, 1.026773, 1, 1, 1, 1, 1
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
var radius = 9.197814;
var distance = 32.30693;
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
mvMatrix.translate( -0.1324282, -0.08307052, -0.07561922 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.30693);
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
