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
-3.528879, -1.509361, -2.160653, 1, 0, 0, 1,
-3.167464, -1.220089, -1.567291, 1, 0.007843138, 0, 1,
-3.011112, -0.678095, -1.867994, 1, 0.01176471, 0, 1,
-3.009113, -1.454993, -3.302465, 1, 0.01960784, 0, 1,
-2.931677, -0.4845045, -0.6565298, 1, 0.02352941, 0, 1,
-2.712623, -3.034462, -1.824954, 1, 0.03137255, 0, 1,
-2.669311, 0.8454952, -2.22035, 1, 0.03529412, 0, 1,
-2.600563, 0.3344943, -2.981562, 1, 0.04313726, 0, 1,
-2.559918, -0.4215203, -2.217226, 1, 0.04705882, 0, 1,
-2.543075, -2.339418, -1.668734, 1, 0.05490196, 0, 1,
-2.472721, -0.09176033, 0.3321801, 1, 0.05882353, 0, 1,
-2.470541, 0.8097772, -0.2313427, 1, 0.06666667, 0, 1,
-2.453226, 2.260834, -1.254076, 1, 0.07058824, 0, 1,
-2.395072, -0.2548197, -1.248001, 1, 0.07843138, 0, 1,
-2.290095, -0.2352222, 0.4808905, 1, 0.08235294, 0, 1,
-2.274855, 0.4661566, 1.189559, 1, 0.09019608, 0, 1,
-2.222856, 0.6708772, 0.2274826, 1, 0.09411765, 0, 1,
-2.196547, -0.5060504, -2.911954, 1, 0.1019608, 0, 1,
-2.147239, -0.05277236, -2.436821, 1, 0.1098039, 0, 1,
-2.122427, 0.5073479, -2.036089, 1, 0.1137255, 0, 1,
-2.112986, 2.562891, -1.600523, 1, 0.1215686, 0, 1,
-2.094959, -0.451498, -2.452776, 1, 0.1254902, 0, 1,
-2.077286, -0.08135004, -2.123333, 1, 0.1333333, 0, 1,
-2.027227, -1.498531, -0.3404831, 1, 0.1372549, 0, 1,
-2.016745, -0.9564455, -1.697871, 1, 0.145098, 0, 1,
-2.010479, 0.5698337, -0.6905309, 1, 0.1490196, 0, 1,
-1.955777, 1.003593, 0.213763, 1, 0.1568628, 0, 1,
-1.954914, -0.7701973, -1.94374, 1, 0.1607843, 0, 1,
-1.953898, -0.5580639, -2.617647, 1, 0.1686275, 0, 1,
-1.944195, 0.7725192, -0.6201953, 1, 0.172549, 0, 1,
-1.918668, -0.4648288, -2.978354, 1, 0.1803922, 0, 1,
-1.906258, 0.1396763, 0.3595785, 1, 0.1843137, 0, 1,
-1.890125, -1.014304, -2.187057, 1, 0.1921569, 0, 1,
-1.881161, -0.3251486, -3.775897, 1, 0.1960784, 0, 1,
-1.868939, -0.7288553, -2.153135, 1, 0.2039216, 0, 1,
-1.854951, -0.03325288, 0.200511, 1, 0.2117647, 0, 1,
-1.847796, 1.408927, -0.5593771, 1, 0.2156863, 0, 1,
-1.845581, 1.845175, -1.255031, 1, 0.2235294, 0, 1,
-1.839656, -2.706433, -3.520711, 1, 0.227451, 0, 1,
-1.822925, 0.093915, -1.749698, 1, 0.2352941, 0, 1,
-1.79935, -0.3121491, -1.88506, 1, 0.2392157, 0, 1,
-1.791419, 0.1731626, -2.171681, 1, 0.2470588, 0, 1,
-1.781591, 1.325412, -0.1797539, 1, 0.2509804, 0, 1,
-1.780021, -0.5781813, -2.317737, 1, 0.2588235, 0, 1,
-1.776978, 0.7120818, -1.182538, 1, 0.2627451, 0, 1,
-1.775389, -0.9512348, -1.139996, 1, 0.2705882, 0, 1,
-1.757522, -0.6234242, -1.906182, 1, 0.2745098, 0, 1,
-1.752081, -0.9962058, -2.548531, 1, 0.282353, 0, 1,
-1.728614, 0.5885376, -0.559519, 1, 0.2862745, 0, 1,
-1.717771, -1.081209, -1.917833, 1, 0.2941177, 0, 1,
-1.6971, -0.02165185, -0.1243086, 1, 0.3019608, 0, 1,
-1.681876, -0.5593086, -4.611899, 1, 0.3058824, 0, 1,
-1.630282, 1.912667, -1.090548, 1, 0.3137255, 0, 1,
-1.628583, -0.2993917, -1.518737, 1, 0.3176471, 0, 1,
-1.601895, 1.726549, -2.207245, 1, 0.3254902, 0, 1,
-1.589434, -1.361386, -0.7349054, 1, 0.3294118, 0, 1,
-1.578359, -0.2393315, -2.950689, 1, 0.3372549, 0, 1,
-1.573749, 0.6109728, -0.1430933, 1, 0.3411765, 0, 1,
-1.567922, 0.3963191, -2.085585, 1, 0.3490196, 0, 1,
-1.558215, -0.07967144, -1.522156, 1, 0.3529412, 0, 1,
-1.536941, 0.1824592, -2.020857, 1, 0.3607843, 0, 1,
-1.511444, -0.4146669, -3.182451, 1, 0.3647059, 0, 1,
-1.511435, -0.7856776, -1.80232, 1, 0.372549, 0, 1,
-1.506402, 1.745032, 0.3780252, 1, 0.3764706, 0, 1,
-1.503516, 0.8907197, 0.5377143, 1, 0.3843137, 0, 1,
-1.49874, 0.6453321, 0.862674, 1, 0.3882353, 0, 1,
-1.495318, -1.061721, -3.529988, 1, 0.3960784, 0, 1,
-1.475156, 1.947107, -2.266132, 1, 0.4039216, 0, 1,
-1.473591, 0.465493, -2.390517, 1, 0.4078431, 0, 1,
-1.464149, 0.4041613, -2.934442, 1, 0.4156863, 0, 1,
-1.462866, -1.629165, -3.428894, 1, 0.4196078, 0, 1,
-1.462782, -0.9525306, -0.1401801, 1, 0.427451, 0, 1,
-1.447243, 1.591625, 1.227857, 1, 0.4313726, 0, 1,
-1.425324, -0.6691771, -2.324882, 1, 0.4392157, 0, 1,
-1.421558, -1.283465, -1.448502, 1, 0.4431373, 0, 1,
-1.417711, -1.247126, -2.02493, 1, 0.4509804, 0, 1,
-1.413489, 1.520464, -1.855174, 1, 0.454902, 0, 1,
-1.407592, -1.837106, -1.636156, 1, 0.4627451, 0, 1,
-1.39237, -0.8560174, -1.144377, 1, 0.4666667, 0, 1,
-1.392004, 0.1791552, -1.353588, 1, 0.4745098, 0, 1,
-1.391026, 0.05186686, 0.04710959, 1, 0.4784314, 0, 1,
-1.389152, 0.2190338, -2.904599, 1, 0.4862745, 0, 1,
-1.388739, -2.056558, -1.335904, 1, 0.4901961, 0, 1,
-1.386923, 0.1162346, -2.785244, 1, 0.4980392, 0, 1,
-1.381991, -0.3208661, -1.092648, 1, 0.5058824, 0, 1,
-1.379418, 0.6724187, -4.015388, 1, 0.509804, 0, 1,
-1.3756, -1.34016, -1.453024, 1, 0.5176471, 0, 1,
-1.358437, -0.7538429, -0.8636901, 1, 0.5215687, 0, 1,
-1.357761, 0.8813542, -1.147731, 1, 0.5294118, 0, 1,
-1.349561, 0.1496993, -0.3012461, 1, 0.5333334, 0, 1,
-1.273368, -1.74048, -3.40066, 1, 0.5411765, 0, 1,
-1.273345, 1.026237, -0.711682, 1, 0.5450981, 0, 1,
-1.271497, 0.5411521, -0.4533059, 1, 0.5529412, 0, 1,
-1.26862, 0.3910342, 0.3349216, 1, 0.5568628, 0, 1,
-1.267674, -0.2136335, -2.044492, 1, 0.5647059, 0, 1,
-1.265824, -0.6901061, -2.79612, 1, 0.5686275, 0, 1,
-1.256756, -0.06094589, -0.3570343, 1, 0.5764706, 0, 1,
-1.249588, 0.4059654, 0.418267, 1, 0.5803922, 0, 1,
-1.236893, 0.1961542, -0.4106061, 1, 0.5882353, 0, 1,
-1.230742, 0.683799, -0.0426396, 1, 0.5921569, 0, 1,
-1.228394, -0.319969, -2.017616, 1, 0.6, 0, 1,
-1.223741, -0.4356242, -1.843562, 1, 0.6078432, 0, 1,
-1.218363, -1.225156, -2.467985, 1, 0.6117647, 0, 1,
-1.2157, -0.4274389, 0.2432386, 1, 0.6196079, 0, 1,
-1.215076, 0.6396331, -1.116342, 1, 0.6235294, 0, 1,
-1.212991, -1.424701, -1.768022, 1, 0.6313726, 0, 1,
-1.20219, 0.5147198, -1.818122, 1, 0.6352941, 0, 1,
-1.201651, -0.7025718, -4.823519, 1, 0.6431373, 0, 1,
-1.200967, -0.6879451, -3.457188, 1, 0.6470588, 0, 1,
-1.196479, -0.4049926, -1.712472, 1, 0.654902, 0, 1,
-1.195624, 0.2333082, -0.3287848, 1, 0.6588235, 0, 1,
-1.194635, 1.103648, -3.226795, 1, 0.6666667, 0, 1,
-1.189028, -0.04132383, -0.7440826, 1, 0.6705883, 0, 1,
-1.18885, 1.097512, -2.988917, 1, 0.6784314, 0, 1,
-1.186306, 1.853529, 1.658084, 1, 0.682353, 0, 1,
-1.177322, -0.5857948, -0.8072257, 1, 0.6901961, 0, 1,
-1.175392, -0.8146285, -0.9811215, 1, 0.6941177, 0, 1,
-1.175133, 1.312979, -2.476001, 1, 0.7019608, 0, 1,
-1.16545, 0.192331, -2.626831, 1, 0.7098039, 0, 1,
-1.160906, 1.973943, -1.07853, 1, 0.7137255, 0, 1,
-1.155315, 0.6096916, 0.2054077, 1, 0.7215686, 0, 1,
-1.155154, 1.537098, -0.8704715, 1, 0.7254902, 0, 1,
-1.149831, 2.009013, -0.296444, 1, 0.7333333, 0, 1,
-1.149416, -0.5855389, -0.8632199, 1, 0.7372549, 0, 1,
-1.141438, -0.217212, -3.529491, 1, 0.7450981, 0, 1,
-1.141342, -0.2816221, -0.749192, 1, 0.7490196, 0, 1,
-1.13908, 0.3106152, -1.783627, 1, 0.7568628, 0, 1,
-1.135161, 0.5833404, 0.5025887, 1, 0.7607843, 0, 1,
-1.129439, -1.519178, -1.27247, 1, 0.7686275, 0, 1,
-1.129164, -1.028853, -3.482141, 1, 0.772549, 0, 1,
-1.127743, -0.001528171, -0.6202307, 1, 0.7803922, 0, 1,
-1.127701, 0.9260117, -1.310103, 1, 0.7843137, 0, 1,
-1.12115, -0.3888016, -1.561024, 1, 0.7921569, 0, 1,
-1.113328, 0.5972678, -2.998861, 1, 0.7960784, 0, 1,
-1.105732, -0.2840336, -5.3774, 1, 0.8039216, 0, 1,
-1.104673, -0.1293118, -1.567202, 1, 0.8117647, 0, 1,
-1.10332, 1.113007, 1.927506, 1, 0.8156863, 0, 1,
-1.098185, 0.8531215, -1.504121, 1, 0.8235294, 0, 1,
-1.096839, 0.006884947, -2.173825, 1, 0.827451, 0, 1,
-1.09442, -0.1566124, -2.706383, 1, 0.8352941, 0, 1,
-1.084524, 1.114589, 0.4776062, 1, 0.8392157, 0, 1,
-1.08103, -0.9814462, -2.928325, 1, 0.8470588, 0, 1,
-1.081018, 0.1141311, -0.7171454, 1, 0.8509804, 0, 1,
-1.073096, -0.5306287, -2.156717, 1, 0.8588235, 0, 1,
-1.065194, 2.223851, 0.2154052, 1, 0.8627451, 0, 1,
-1.057249, 0.3698858, -2.470613, 1, 0.8705882, 0, 1,
-1.05425, -1.988662, -1.607247, 1, 0.8745098, 0, 1,
-1.053428, -0.6847209, -0.8380371, 1, 0.8823529, 0, 1,
-1.049584, 0.2604946, -1.083443, 1, 0.8862745, 0, 1,
-1.042293, -0.924949, -2.776149, 1, 0.8941177, 0, 1,
-1.039914, -1.567064, -4.287687, 1, 0.8980392, 0, 1,
-1.039159, 1.265165, 0.328153, 1, 0.9058824, 0, 1,
-1.031183, 1.132905, -2.251428, 1, 0.9137255, 0, 1,
-1.02502, -1.396687, -2.584517, 1, 0.9176471, 0, 1,
-1.017838, 1.168101, 0.7811304, 1, 0.9254902, 0, 1,
-1.009656, 0.2001248, -1.3924, 1, 0.9294118, 0, 1,
-1.001603, -1.012433, -1.968675, 1, 0.9372549, 0, 1,
-1.00136, -1.372514, -2.012131, 1, 0.9411765, 0, 1,
-0.9977997, 0.5512862, -1.688246, 1, 0.9490196, 0, 1,
-0.9941646, 0.8234448, -0.8490369, 1, 0.9529412, 0, 1,
-0.9937609, 0.5963237, 0.1038573, 1, 0.9607843, 0, 1,
-0.9905224, 0.09037848, -2.91429, 1, 0.9647059, 0, 1,
-0.9904023, 1.054459, -1.692252, 1, 0.972549, 0, 1,
-0.9899592, 0.1600649, -1.246906, 1, 0.9764706, 0, 1,
-0.9850366, -1.812909, -2.56576, 1, 0.9843137, 0, 1,
-0.9838377, 1.015831, -0.9331008, 1, 0.9882353, 0, 1,
-0.9806852, 0.4076114, 0.8246067, 1, 0.9960784, 0, 1,
-0.9705061, 0.1434771, 0.08659066, 0.9960784, 1, 0, 1,
-0.9608235, -1.161079, -2.956376, 0.9921569, 1, 0, 1,
-0.9447229, -1.929436, -2.453756, 0.9843137, 1, 0, 1,
-0.9409421, 0.1707201, -0.4853007, 0.9803922, 1, 0, 1,
-0.9403547, -1.650392, -1.59288, 0.972549, 1, 0, 1,
-0.9347827, -1.133485, -0.5192566, 0.9686275, 1, 0, 1,
-0.9333233, 0.1765753, -1.443975, 0.9607843, 1, 0, 1,
-0.9321229, -0.1535322, -1.707941, 0.9568627, 1, 0, 1,
-0.9319568, -1.037493, -2.381978, 0.9490196, 1, 0, 1,
-0.9317402, -0.4773922, -0.999082, 0.945098, 1, 0, 1,
-0.9305052, -0.7708861, -1.544344, 0.9372549, 1, 0, 1,
-0.9241992, -0.6215045, -4.302044, 0.9333333, 1, 0, 1,
-0.9135972, -0.1363577, -3.519513, 0.9254902, 1, 0, 1,
-0.9129951, -0.06861676, -1.375961, 0.9215686, 1, 0, 1,
-0.9012309, -0.5355749, -1.006581, 0.9137255, 1, 0, 1,
-0.9002107, -1.185688, -2.633117, 0.9098039, 1, 0, 1,
-0.8983037, 1.505559, -0.2969618, 0.9019608, 1, 0, 1,
-0.8951093, 0.8960065, 0.05609299, 0.8941177, 1, 0, 1,
-0.8942965, 0.2526314, -1.150019, 0.8901961, 1, 0, 1,
-0.8941034, -0.1951975, -0.5975591, 0.8823529, 1, 0, 1,
-0.8911789, -0.4085588, -4.000923, 0.8784314, 1, 0, 1,
-0.8827443, 2.624422, -0.7436187, 0.8705882, 1, 0, 1,
-0.8782015, 0.5104701, 0.2523949, 0.8666667, 1, 0, 1,
-0.8771734, -0.9691093, -2.639054, 0.8588235, 1, 0, 1,
-0.875598, 0.3512699, -0.5788255, 0.854902, 1, 0, 1,
-0.8651218, -0.0522061, -2.504674, 0.8470588, 1, 0, 1,
-0.8616377, -0.5189202, -1.125555, 0.8431373, 1, 0, 1,
-0.8573025, -1.338035, -2.459132, 0.8352941, 1, 0, 1,
-0.8492832, 0.07942856, -1.900551, 0.8313726, 1, 0, 1,
-0.8427838, -1.848164, -0.6336064, 0.8235294, 1, 0, 1,
-0.8389856, 1.715993, -0.407347, 0.8196079, 1, 0, 1,
-0.8348332, 0.1807985, -3.225413, 0.8117647, 1, 0, 1,
-0.8322562, 0.2184537, -0.0526956, 0.8078431, 1, 0, 1,
-0.8318262, -0.1273254, -2.092732, 0.8, 1, 0, 1,
-0.8267142, -0.3707799, -1.938775, 0.7921569, 1, 0, 1,
-0.8209391, -0.64863, -2.58538, 0.7882353, 1, 0, 1,
-0.8181012, 0.1981037, -1.797877, 0.7803922, 1, 0, 1,
-0.8128519, -2.103976, -2.530806, 0.7764706, 1, 0, 1,
-0.8127626, -1.267652, -4.962773, 0.7686275, 1, 0, 1,
-0.8091792, -0.2255779, -3.156862, 0.7647059, 1, 0, 1,
-0.809001, -1.455788, -2.431082, 0.7568628, 1, 0, 1,
-0.8066814, -0.1306917, -1.996451, 0.7529412, 1, 0, 1,
-0.7950157, -0.6637586, -1.689888, 0.7450981, 1, 0, 1,
-0.7914413, -0.3393722, -2.119687, 0.7411765, 1, 0, 1,
-0.786612, 0.4856251, -1.031265, 0.7333333, 1, 0, 1,
-0.7852181, -0.908409, -2.238909, 0.7294118, 1, 0, 1,
-0.7792346, 0.1415834, -1.972256, 0.7215686, 1, 0, 1,
-0.7792327, 0.9264309, -1.846317, 0.7176471, 1, 0, 1,
-0.7710122, -0.9780031, -0.6168448, 0.7098039, 1, 0, 1,
-0.7600762, 1.542756, -0.6721249, 0.7058824, 1, 0, 1,
-0.7567098, -0.2783123, -2.04831, 0.6980392, 1, 0, 1,
-0.7507712, 0.2280871, -0.8690633, 0.6901961, 1, 0, 1,
-0.7492118, 0.1287755, -2.670107, 0.6862745, 1, 0, 1,
-0.7491636, 0.9133431, 0.8993683, 0.6784314, 1, 0, 1,
-0.747336, -0.03141014, -1.325698, 0.6745098, 1, 0, 1,
-0.7468526, -0.5155054, -4.057743, 0.6666667, 1, 0, 1,
-0.7454085, 1.487392, 0.3725125, 0.6627451, 1, 0, 1,
-0.7260666, 0.1121392, -1.450143, 0.654902, 1, 0, 1,
-0.7206998, 0.3247214, -0.1703538, 0.6509804, 1, 0, 1,
-0.7191122, -0.3165059, -2.515112, 0.6431373, 1, 0, 1,
-0.714065, 0.2433702, -0.4338332, 0.6392157, 1, 0, 1,
-0.7129157, 0.3999127, 0.6204754, 0.6313726, 1, 0, 1,
-0.6994432, 0.251971, -0.7748076, 0.627451, 1, 0, 1,
-0.6920376, 0.640575, -0.2232725, 0.6196079, 1, 0, 1,
-0.6907911, -0.08255961, -1.049854, 0.6156863, 1, 0, 1,
-0.6862013, -0.04877056, -3.011353, 0.6078432, 1, 0, 1,
-0.6778099, 1.053243, 0.5424194, 0.6039216, 1, 0, 1,
-0.6726477, 1.567068, -0.7138773, 0.5960785, 1, 0, 1,
-0.6546388, 1.018417, -0.4603125, 0.5882353, 1, 0, 1,
-0.6501268, 1.778428, -1.671134, 0.5843138, 1, 0, 1,
-0.6493761, 0.5511226, -2.270634, 0.5764706, 1, 0, 1,
-0.6478885, 0.9525154, -1.33992, 0.572549, 1, 0, 1,
-0.644949, -0.4222326, -4.041577, 0.5647059, 1, 0, 1,
-0.6437787, 2.402814, -0.003314714, 0.5607843, 1, 0, 1,
-0.6423658, -0.06323537, -0.3438975, 0.5529412, 1, 0, 1,
-0.6415149, -1.581184, -3.437945, 0.5490196, 1, 0, 1,
-0.6393125, 0.30142, 0.3936999, 0.5411765, 1, 0, 1,
-0.6374551, -0.6080707, -1.172158, 0.5372549, 1, 0, 1,
-0.6356912, 1.311609, -1.650897, 0.5294118, 1, 0, 1,
-0.6310036, -0.06089098, -2.786356, 0.5254902, 1, 0, 1,
-0.6306627, -0.6000919, -2.227814, 0.5176471, 1, 0, 1,
-0.6287651, -0.3214387, -3.225658, 0.5137255, 1, 0, 1,
-0.6268165, 0.1504428, -0.75239, 0.5058824, 1, 0, 1,
-0.6238668, -1.73384, -3.016524, 0.5019608, 1, 0, 1,
-0.6205253, 0.6359586, -2.604848, 0.4941176, 1, 0, 1,
-0.6175509, -0.4222594, -1.649412, 0.4862745, 1, 0, 1,
-0.6154317, -1.071814, -0.9584451, 0.4823529, 1, 0, 1,
-0.6132051, 0.9675565, -0.2629268, 0.4745098, 1, 0, 1,
-0.6127051, -1.719078, -2.806374, 0.4705882, 1, 0, 1,
-0.6119573, 1.36252, -1.892961, 0.4627451, 1, 0, 1,
-0.6099119, 0.4434189, -0.08173802, 0.4588235, 1, 0, 1,
-0.5855375, -0.5916215, -1.243835, 0.4509804, 1, 0, 1,
-0.5835464, 2.529915, -0.9254825, 0.4470588, 1, 0, 1,
-0.5768129, -1.250904, -2.879457, 0.4392157, 1, 0, 1,
-0.5759094, -1.886174, -5.005342, 0.4352941, 1, 0, 1,
-0.5668052, -0.547647, -3.047193, 0.427451, 1, 0, 1,
-0.5651922, 1.4161, 0.6301312, 0.4235294, 1, 0, 1,
-0.5617281, -0.04517759, -2.881786, 0.4156863, 1, 0, 1,
-0.561119, -0.04188852, -0.5068156, 0.4117647, 1, 0, 1,
-0.5601453, -0.3617142, -2.76805, 0.4039216, 1, 0, 1,
-0.5584051, -0.2375118, -1.716754, 0.3960784, 1, 0, 1,
-0.5538722, 2.794635, 0.6737083, 0.3921569, 1, 0, 1,
-0.5480325, -1.454005, -2.574655, 0.3843137, 1, 0, 1,
-0.5423962, -1.94623, -3.229387, 0.3803922, 1, 0, 1,
-0.5417963, -0.9837036, -3.080212, 0.372549, 1, 0, 1,
-0.5415146, -1.063681, -2.062384, 0.3686275, 1, 0, 1,
-0.538083, -1.063038, -3.788034, 0.3607843, 1, 0, 1,
-0.5323976, -0.1096467, -1.13205, 0.3568628, 1, 0, 1,
-0.5230133, -0.8914499, -1.198141, 0.3490196, 1, 0, 1,
-0.5226502, 0.3889413, -1.973955, 0.345098, 1, 0, 1,
-0.5198359, 0.8457403, -1.767547, 0.3372549, 1, 0, 1,
-0.5159613, 1.522921, 0.5028164, 0.3333333, 1, 0, 1,
-0.5082598, -0.7803055, -1.648079, 0.3254902, 1, 0, 1,
-0.5059124, -0.07871463, -2.99188, 0.3215686, 1, 0, 1,
-0.5052552, 1.616127, -1.342608, 0.3137255, 1, 0, 1,
-0.5050541, -1.002161, -3.634719, 0.3098039, 1, 0, 1,
-0.5045776, -0.358916, -1.27421, 0.3019608, 1, 0, 1,
-0.5027815, -0.1938883, -2.318244, 0.2941177, 1, 0, 1,
-0.5015834, -0.9914454, -3.791066, 0.2901961, 1, 0, 1,
-0.4997003, 1.479839, -0.8010815, 0.282353, 1, 0, 1,
-0.4962762, 0.9142671, -0.4671398, 0.2784314, 1, 0, 1,
-0.4942921, -0.5447047, -1.304747, 0.2705882, 1, 0, 1,
-0.4896103, 0.03937229, -1.907637, 0.2666667, 1, 0, 1,
-0.4872776, -1.420138, -1.956397, 0.2588235, 1, 0, 1,
-0.485365, 0.3201528, -0.6590273, 0.254902, 1, 0, 1,
-0.4815032, 0.01136284, -2.373663, 0.2470588, 1, 0, 1,
-0.4791458, -0.1518348, -2.547254, 0.2431373, 1, 0, 1,
-0.4752265, 0.7583268, -0.4184657, 0.2352941, 1, 0, 1,
-0.4752169, -0.1748473, -1.958638, 0.2313726, 1, 0, 1,
-0.4721992, 1.255961, 0.2523663, 0.2235294, 1, 0, 1,
-0.4702604, -0.004654972, -2.398814, 0.2196078, 1, 0, 1,
-0.4687276, -0.6704587, -1.766287, 0.2117647, 1, 0, 1,
-0.4676052, -0.4797002, -0.8565636, 0.2078431, 1, 0, 1,
-0.4667311, -0.2171764, -4.937543, 0.2, 1, 0, 1,
-0.4641915, -1.696748, -2.530892, 0.1921569, 1, 0, 1,
-0.4585057, 1.891792, -2.288166, 0.1882353, 1, 0, 1,
-0.4547346, -0.02708275, -1.377592, 0.1803922, 1, 0, 1,
-0.4536617, 0.1095001, -0.6270015, 0.1764706, 1, 0, 1,
-0.4425137, 0.4016317, -0.02905557, 0.1686275, 1, 0, 1,
-0.4316751, -0.8164398, -3.287879, 0.1647059, 1, 0, 1,
-0.4288659, -1.449304, -4.704708, 0.1568628, 1, 0, 1,
-0.4198359, 0.3057852, -0.05931682, 0.1529412, 1, 0, 1,
-0.4169945, 0.9765821, -1.503224, 0.145098, 1, 0, 1,
-0.416915, 0.5852395, -1.183007, 0.1411765, 1, 0, 1,
-0.412458, 0.5458666, -1.542232, 0.1333333, 1, 0, 1,
-0.4115242, -0.6622867, -2.922369, 0.1294118, 1, 0, 1,
-0.4107493, -0.1592326, -2.772261, 0.1215686, 1, 0, 1,
-0.4106024, -1.212811, -2.463002, 0.1176471, 1, 0, 1,
-0.4096438, -0.1546709, -2.922223, 0.1098039, 1, 0, 1,
-0.4050174, -1.751971, -3.157338, 0.1058824, 1, 0, 1,
-0.4044488, 2.090754, -0.02595089, 0.09803922, 1, 0, 1,
-0.4030722, -1.05365, -1.75304, 0.09019608, 1, 0, 1,
-0.4007595, 1.025601, -2.301459, 0.08627451, 1, 0, 1,
-0.3961069, 0.7423239, -0.6504335, 0.07843138, 1, 0, 1,
-0.3960214, -1.586663, -2.595655, 0.07450981, 1, 0, 1,
-0.3955812, 0.629766, -2.825199, 0.06666667, 1, 0, 1,
-0.3936333, 0.7048474, -1.746686, 0.0627451, 1, 0, 1,
-0.3925843, -1.318874, -2.516764, 0.05490196, 1, 0, 1,
-0.3870836, 1.359095, -0.2379527, 0.05098039, 1, 0, 1,
-0.382088, 0.6064348, -1.056801, 0.04313726, 1, 0, 1,
-0.3786666, -0.7722761, -2.247264, 0.03921569, 1, 0, 1,
-0.3782773, -1.214658, -3.496535, 0.03137255, 1, 0, 1,
-0.3781806, 0.2192288, 0.3118093, 0.02745098, 1, 0, 1,
-0.3777625, -0.25468, -1.35072, 0.01960784, 1, 0, 1,
-0.3747229, 2.458521, 0.2138354, 0.01568628, 1, 0, 1,
-0.3737888, -1.722589, -1.849741, 0.007843138, 1, 0, 1,
-0.3728283, -0.09076883, -2.708769, 0.003921569, 1, 0, 1,
-0.3684752, -0.1462677, -1.688251, 0, 1, 0.003921569, 1,
-0.3655536, -0.007539377, -0.9524618, 0, 1, 0.01176471, 1,
-0.36327, 0.9965737, -1.917886, 0, 1, 0.01568628, 1,
-0.3587878, 1.416941, 0.9040133, 0, 1, 0.02352941, 1,
-0.3583118, -0.6372018, -1.798397, 0, 1, 0.02745098, 1,
-0.356609, -0.2120414, 0.2096345, 0, 1, 0.03529412, 1,
-0.3507999, 2.676149, -0.5550617, 0, 1, 0.03921569, 1,
-0.3466623, 0.7930722, -0.9203174, 0, 1, 0.04705882, 1,
-0.3458229, 0.391257, -0.9752282, 0, 1, 0.05098039, 1,
-0.3455476, -0.4911305, -2.948947, 0, 1, 0.05882353, 1,
-0.3423033, -0.9544058, -2.240571, 0, 1, 0.0627451, 1,
-0.3416727, -0.4960499, -3.694258, 0, 1, 0.07058824, 1,
-0.3394866, -0.9280659, -2.692366, 0, 1, 0.07450981, 1,
-0.3372977, 0.3304436, -1.511636, 0, 1, 0.08235294, 1,
-0.3332796, 0.2686293, -2.173318, 0, 1, 0.08627451, 1,
-0.3326809, 0.5870609, -0.4473304, 0, 1, 0.09411765, 1,
-0.3309062, -0.07100558, -0.3881518, 0, 1, 0.1019608, 1,
-0.3280213, -0.1543257, -1.873432, 0, 1, 0.1058824, 1,
-0.3235972, -0.1134194, -1.038763, 0, 1, 0.1137255, 1,
-0.3221419, -1.132112, -1.707868, 0, 1, 0.1176471, 1,
-0.3174077, -0.6816204, -3.189448, 0, 1, 0.1254902, 1,
-0.3118365, 0.1974368, -1.160603, 0, 1, 0.1294118, 1,
-0.3049575, -0.6170375, -1.733234, 0, 1, 0.1372549, 1,
-0.3024535, 1.241113, 1.315035, 0, 1, 0.1411765, 1,
-0.298871, 0.3795972, 1.319977, 0, 1, 0.1490196, 1,
-0.2974853, 0.5639454, -1.094958, 0, 1, 0.1529412, 1,
-0.2945997, -0.6899213, -0.8854001, 0, 1, 0.1607843, 1,
-0.2942914, -0.7199453, -2.47976, 0, 1, 0.1647059, 1,
-0.293943, 0.9841847, 1.196715, 0, 1, 0.172549, 1,
-0.2881957, -0.7169983, -2.390244, 0, 1, 0.1764706, 1,
-0.2842857, -2.391999, -4.649921, 0, 1, 0.1843137, 1,
-0.2831644, -2.766817, -3.844383, 0, 1, 0.1882353, 1,
-0.2810382, -2.182129, -1.795753, 0, 1, 0.1960784, 1,
-0.2781762, -0.4023192, -1.224368, 0, 1, 0.2039216, 1,
-0.2733256, -0.8357189, -4.074862, 0, 1, 0.2078431, 1,
-0.2706169, -0.5989996, -1.995077, 0, 1, 0.2156863, 1,
-0.2690346, 0.5531126, -1.418855, 0, 1, 0.2196078, 1,
-0.267511, 0.07953402, -0.6483222, 0, 1, 0.227451, 1,
-0.2643123, -0.05382188, -2.809767, 0, 1, 0.2313726, 1,
-0.2628523, -0.4871065, -1.990254, 0, 1, 0.2392157, 1,
-0.2584468, -1.378397, -2.039083, 0, 1, 0.2431373, 1,
-0.2577464, 0.3055077, -2.510338, 0, 1, 0.2509804, 1,
-0.2522307, 0.4883247, -2.320984, 0, 1, 0.254902, 1,
-0.2504884, -0.1941816, -0.4430759, 0, 1, 0.2627451, 1,
-0.2503601, -0.08181208, -4.272642, 0, 1, 0.2666667, 1,
-0.2490655, -0.8201025, -2.290783, 0, 1, 0.2745098, 1,
-0.2476012, -0.1336603, -1.56159, 0, 1, 0.2784314, 1,
-0.2472525, -2.239407, -4.059223, 0, 1, 0.2862745, 1,
-0.2450593, -1.952694, -2.499171, 0, 1, 0.2901961, 1,
-0.2443857, -0.8935726, -2.495057, 0, 1, 0.2980392, 1,
-0.2433086, 0.6241509, 1.661778, 0, 1, 0.3058824, 1,
-0.2416431, 0.4183378, -0.4273829, 0, 1, 0.3098039, 1,
-0.2414096, -1.25168, -3.377264, 0, 1, 0.3176471, 1,
-0.2413967, 1.046298, -0.1334818, 0, 1, 0.3215686, 1,
-0.2400082, -0.1504659, -2.360765, 0, 1, 0.3294118, 1,
-0.2398128, 0.129232, 0.1141455, 0, 1, 0.3333333, 1,
-0.2318916, 1.180754, 0.1819673, 0, 1, 0.3411765, 1,
-0.2300433, -1.823146, -2.192293, 0, 1, 0.345098, 1,
-0.2273266, -0.567014, -1.178621, 0, 1, 0.3529412, 1,
-0.21793, 0.2641719, -1.469307, 0, 1, 0.3568628, 1,
-0.2170318, 0.2988028, -1.912742, 0, 1, 0.3647059, 1,
-0.2137617, 0.9369462, -1.048677, 0, 1, 0.3686275, 1,
-0.2018185, 1.213713, -0.729708, 0, 1, 0.3764706, 1,
-0.2014695, 1.115904, 0.3148681, 0, 1, 0.3803922, 1,
-0.1998571, -0.8759481, -2.743384, 0, 1, 0.3882353, 1,
-0.1955628, -0.5734465, -1.831533, 0, 1, 0.3921569, 1,
-0.1836224, -0.1767908, -1.837723, 0, 1, 0.4, 1,
-0.1797978, 1.107975, 0.4022674, 0, 1, 0.4078431, 1,
-0.1786873, -0.4049618, -2.198995, 0, 1, 0.4117647, 1,
-0.1748665, -0.7489321, -2.072731, 0, 1, 0.4196078, 1,
-0.1729967, 1.304528, 0.3374416, 0, 1, 0.4235294, 1,
-0.1697006, -0.5773867, -2.651867, 0, 1, 0.4313726, 1,
-0.1688603, -1.793016, -3.219799, 0, 1, 0.4352941, 1,
-0.1678669, -0.1698418, -2.877477, 0, 1, 0.4431373, 1,
-0.1656418, -0.05005929, -1.506486, 0, 1, 0.4470588, 1,
-0.1647715, -1.741849, -2.727211, 0, 1, 0.454902, 1,
-0.1633074, 0.8130181, 0.6100022, 0, 1, 0.4588235, 1,
-0.1567524, 0.6050958, -0.4636042, 0, 1, 0.4666667, 1,
-0.1555309, 0.5146149, -1.082543, 0, 1, 0.4705882, 1,
-0.1504035, 2.647354, -1.25528, 0, 1, 0.4784314, 1,
-0.1473245, -1.097486, -4.128597, 0, 1, 0.4823529, 1,
-0.1416956, -1.508414, -3.369638, 0, 1, 0.4901961, 1,
-0.1416941, 1.032386, -0.978606, 0, 1, 0.4941176, 1,
-0.1407142, -2.783162, -3.24062, 0, 1, 0.5019608, 1,
-0.1351575, -0.3369699, -2.483269, 0, 1, 0.509804, 1,
-0.1330833, 1.605074, 0.3160854, 0, 1, 0.5137255, 1,
-0.1327902, 0.4093901, -0.8881254, 0, 1, 0.5215687, 1,
-0.1320608, -1.227108, -1.47861, 0, 1, 0.5254902, 1,
-0.1294953, 0.6114886, -1.773905, 0, 1, 0.5333334, 1,
-0.1284747, -0.1392555, -0.7127215, 0, 1, 0.5372549, 1,
-0.1266416, 1.1563, -1.734625, 0, 1, 0.5450981, 1,
-0.1250409, -2.093808, -3.33221, 0, 1, 0.5490196, 1,
-0.1247157, 0.7251279, -1.379943, 0, 1, 0.5568628, 1,
-0.1236275, 0.3688046, 0.2972576, 0, 1, 0.5607843, 1,
-0.1228921, 0.6333339, -0.7689093, 0, 1, 0.5686275, 1,
-0.1206447, 0.5165619, 0.6606438, 0, 1, 0.572549, 1,
-0.1131289, 0.1904256, -0.5272933, 0, 1, 0.5803922, 1,
-0.1124138, 0.5243151, -1.126237, 0, 1, 0.5843138, 1,
-0.1115193, 0.6882918, 0.9078268, 0, 1, 0.5921569, 1,
-0.1113232, -0.1853994, -2.156662, 0, 1, 0.5960785, 1,
-0.1100313, 0.1709691, -0.1118908, 0, 1, 0.6039216, 1,
-0.108523, -0.795414, -2.998778, 0, 1, 0.6117647, 1,
-0.1044689, -0.3084541, -4.507726, 0, 1, 0.6156863, 1,
-0.1020509, 1.672765, -1.287063, 0, 1, 0.6235294, 1,
-0.1012544, -0.5656301, -4.92102, 0, 1, 0.627451, 1,
-0.09901978, -0.9386775, -3.596986, 0, 1, 0.6352941, 1,
-0.09799957, 0.330001, 0.2559852, 0, 1, 0.6392157, 1,
-0.08998934, 0.649157, -0.7085678, 0, 1, 0.6470588, 1,
-0.08699515, 0.05655014, -1.424209, 0, 1, 0.6509804, 1,
-0.0869651, -0.3485105, -3.144012, 0, 1, 0.6588235, 1,
-0.08399843, 0.2418892, 0.5644131, 0, 1, 0.6627451, 1,
-0.075788, 0.2533223, -0.6506094, 0, 1, 0.6705883, 1,
-0.06914724, -0.1251657, -1.77933, 0, 1, 0.6745098, 1,
-0.06830113, 0.09883878, -0.4772, 0, 1, 0.682353, 1,
-0.06562407, -0.4052634, -1.886088, 0, 1, 0.6862745, 1,
-0.06389858, -1.356059, -3.382425, 0, 1, 0.6941177, 1,
-0.06280644, 2.011395, -2.855104, 0, 1, 0.7019608, 1,
-0.05946476, 1.299524, -0.5645548, 0, 1, 0.7058824, 1,
-0.0560413, 0.7872888, -0.7500016, 0, 1, 0.7137255, 1,
-0.05524195, -0.2403639, -2.807609, 0, 1, 0.7176471, 1,
-0.05058274, 0.305953, -0.8494201, 0, 1, 0.7254902, 1,
-0.04303283, 0.5383345, 0.5559617, 0, 1, 0.7294118, 1,
-0.04286012, 0.5648642, 0.04469547, 0, 1, 0.7372549, 1,
-0.04256513, 0.5477561, 2.452919, 0, 1, 0.7411765, 1,
-0.03958064, -0.3655992, -3.705477, 0, 1, 0.7490196, 1,
-0.0394378, -0.4344014, -2.233326, 0, 1, 0.7529412, 1,
-0.03472129, 0.4607244, -1.546496, 0, 1, 0.7607843, 1,
-0.03320625, 0.2322782, 1.263494, 0, 1, 0.7647059, 1,
-0.0286976, -0.1200184, -1.560425, 0, 1, 0.772549, 1,
-0.02324214, -0.7727746, -2.366878, 0, 1, 0.7764706, 1,
-0.02244933, 2.054406, -0.3944777, 0, 1, 0.7843137, 1,
-0.02202842, -0.1607956, -2.655497, 0, 1, 0.7882353, 1,
-0.01973104, 0.5274995, 0.02985765, 0, 1, 0.7960784, 1,
-0.01017307, 0.1265018, 0.3019182, 0, 1, 0.8039216, 1,
-0.008226922, 0.3438001, 0.2235609, 0, 1, 0.8078431, 1,
-0.008046861, -0.9843948, -5.107693, 0, 1, 0.8156863, 1,
-0.007969961, -0.5531958, -2.208413, 0, 1, 0.8196079, 1,
-0.004774803, 0.2913536, -1.039991, 0, 1, 0.827451, 1,
-0.00418139, 0.6568155, -0.4199359, 0, 1, 0.8313726, 1,
-0.001212216, -0.737074, -2.894185, 0, 1, 0.8392157, 1,
-0.001103581, 0.6754168, 1.081697, 0, 1, 0.8431373, 1,
0.0004311679, -0.6104997, 1.595995, 0, 1, 0.8509804, 1,
0.000938539, 0.9550844, -1.686406, 0, 1, 0.854902, 1,
0.001032098, -1.332503, 1.960785, 0, 1, 0.8627451, 1,
0.005229926, -0.6621367, 3.44565, 0, 1, 0.8666667, 1,
0.008154262, -0.5217259, 1.883809, 0, 1, 0.8745098, 1,
0.01068445, -2.230458, 2.651191, 0, 1, 0.8784314, 1,
0.01817456, -0.1549108, 2.997494, 0, 1, 0.8862745, 1,
0.02063476, -1.091047, 1.93453, 0, 1, 0.8901961, 1,
0.02085113, -2.35263, 2.998113, 0, 1, 0.8980392, 1,
0.0227713, 0.003611751, 3.405919, 0, 1, 0.9058824, 1,
0.0229123, 1.74457, -0.2870428, 0, 1, 0.9098039, 1,
0.03155123, -0.6261184, 1.004784, 0, 1, 0.9176471, 1,
0.03467565, -1.445994, 2.103458, 0, 1, 0.9215686, 1,
0.03532048, -0.2729436, 3.069954, 0, 1, 0.9294118, 1,
0.03649269, -0.395488, 1.44749, 0, 1, 0.9333333, 1,
0.03731635, 0.4158444, 0.106589, 0, 1, 0.9411765, 1,
0.03933039, -1.236739, 2.448241, 0, 1, 0.945098, 1,
0.04162575, -0.9910072, 2.331192, 0, 1, 0.9529412, 1,
0.04879881, -1.181464, 4.593101, 0, 1, 0.9568627, 1,
0.05342792, -0.8121135, 3.072623, 0, 1, 0.9647059, 1,
0.05425081, 0.5124896, 0.6853272, 0, 1, 0.9686275, 1,
0.05921842, 1.210074, -0.9048464, 0, 1, 0.9764706, 1,
0.0615784, 2.059105, 1.284545, 0, 1, 0.9803922, 1,
0.06166361, 0.9773427, -1.344804, 0, 1, 0.9882353, 1,
0.0662716, 0.6639665, 0.02369632, 0, 1, 0.9921569, 1,
0.066302, 0.9266727, -1.474273, 0, 1, 1, 1,
0.07121487, 2.236995, 0.8695966, 0, 0.9921569, 1, 1,
0.07795405, -2.013193, 1.920276, 0, 0.9882353, 1, 1,
0.07840231, -1.626774, 3.721596, 0, 0.9803922, 1, 1,
0.08222612, -0.9626138, 1.428016, 0, 0.9764706, 1, 1,
0.0838263, 0.1904619, -0.7722895, 0, 0.9686275, 1, 1,
0.08442187, 0.5357918, -0.09520254, 0, 0.9647059, 1, 1,
0.08500393, 0.5914525, -0.1305481, 0, 0.9568627, 1, 1,
0.08741509, -0.8795821, 2.626273, 0, 0.9529412, 1, 1,
0.08967766, 0.7820281, -0.2390449, 0, 0.945098, 1, 1,
0.09010774, 0.3322037, -2.395057, 0, 0.9411765, 1, 1,
0.09020131, -1.865063, 3.082867, 0, 0.9333333, 1, 1,
0.09195781, 1.479549, -0.3617726, 0, 0.9294118, 1, 1,
0.09365119, 1.306217, -0.7292207, 0, 0.9215686, 1, 1,
0.09762802, 1.225863, 0.1792626, 0, 0.9176471, 1, 1,
0.09770807, -2.158415, 1.398426, 0, 0.9098039, 1, 1,
0.09823985, -1.751374, 0.7704241, 0, 0.9058824, 1, 1,
0.09985665, -1.273134, 1.22961, 0, 0.8980392, 1, 1,
0.1001768, 0.1613831, 1.171583, 0, 0.8901961, 1, 1,
0.1017592, -0.438515, 4.377983, 0, 0.8862745, 1, 1,
0.104036, 1.390613, 1.435565, 0, 0.8784314, 1, 1,
0.1042803, 0.2788253, 0.4464783, 0, 0.8745098, 1, 1,
0.1046561, -0.8108472, 1.075231, 0, 0.8666667, 1, 1,
0.1067992, -0.177314, 0.9820456, 0, 0.8627451, 1, 1,
0.1069573, 1.217582, 0.1385673, 0, 0.854902, 1, 1,
0.1078054, 0.5625076, -0.4789902, 0, 0.8509804, 1, 1,
0.1120882, -2.534739, 4.478604, 0, 0.8431373, 1, 1,
0.1124732, 0.1114086, 1.534325, 0, 0.8392157, 1, 1,
0.1129306, 1.895715, 0.6838294, 0, 0.8313726, 1, 1,
0.1191807, -0.1126928, 3.374925, 0, 0.827451, 1, 1,
0.1314559, -0.211549, 2.761646, 0, 0.8196079, 1, 1,
0.1327949, 1.935771, 0.4531192, 0, 0.8156863, 1, 1,
0.1361981, 2.45038, 0.7171981, 0, 0.8078431, 1, 1,
0.1364523, -0.6826735, 3.140127, 0, 0.8039216, 1, 1,
0.136687, 0.5307636, 1.48463, 0, 0.7960784, 1, 1,
0.138861, -0.7373877, 3.83028, 0, 0.7882353, 1, 1,
0.1407518, -0.2862486, 3.090121, 0, 0.7843137, 1, 1,
0.1420765, 1.159878, -2.327782, 0, 0.7764706, 1, 1,
0.148425, -0.2343587, 2.074951, 0, 0.772549, 1, 1,
0.1491521, 0.7187492, 1.530207, 0, 0.7647059, 1, 1,
0.1498502, -0.4779991, 3.179398, 0, 0.7607843, 1, 1,
0.1503159, 0.05866642, 1.419985, 0, 0.7529412, 1, 1,
0.1520326, -2.428404, 3.123676, 0, 0.7490196, 1, 1,
0.1629023, 1.247526, 0.9793594, 0, 0.7411765, 1, 1,
0.1635401, 0.083373, 2.570214, 0, 0.7372549, 1, 1,
0.1659722, 0.2634856, 0.2684985, 0, 0.7294118, 1, 1,
0.1677236, 1.076793, 0.2752406, 0, 0.7254902, 1, 1,
0.1741593, -1.543794, 4.662935, 0, 0.7176471, 1, 1,
0.1758297, 2.230223, -0.2915936, 0, 0.7137255, 1, 1,
0.1820249, 0.7815719, -0.02039955, 0, 0.7058824, 1, 1,
0.1875588, 0.6886065, 1.06684, 0, 0.6980392, 1, 1,
0.1878103, 0.2471348, 0.3477765, 0, 0.6941177, 1, 1,
0.1910548, 2.23822, -1.126324, 0, 0.6862745, 1, 1,
0.1924057, 1.339885, 0.9722572, 0, 0.682353, 1, 1,
0.1975667, 0.6543882, 0.4097852, 0, 0.6745098, 1, 1,
0.1984267, -0.588051, 2.307347, 0, 0.6705883, 1, 1,
0.1994288, -0.5397482, 2.042687, 0, 0.6627451, 1, 1,
0.2045051, -1.267792, 2.557408, 0, 0.6588235, 1, 1,
0.2047045, -0.8712925, 3.415349, 0, 0.6509804, 1, 1,
0.2061056, 1.645956, -0.3638237, 0, 0.6470588, 1, 1,
0.2095854, -0.8432342, 2.903915, 0, 0.6392157, 1, 1,
0.2148196, -0.5159926, 2.688451, 0, 0.6352941, 1, 1,
0.2164965, 0.4809862, 2.703812, 0, 0.627451, 1, 1,
0.2171399, 1.036655, 1.136332, 0, 0.6235294, 1, 1,
0.2195027, 1.738632, -0.8647826, 0, 0.6156863, 1, 1,
0.2210184, 1.645713, -0.5747054, 0, 0.6117647, 1, 1,
0.2236452, -0.2037945, 1.564607, 0, 0.6039216, 1, 1,
0.2245044, -0.1782413, 1.085975, 0, 0.5960785, 1, 1,
0.2279012, 0.6186093, -0.5148806, 0, 0.5921569, 1, 1,
0.2291427, 1.863072, 0.3917719, 0, 0.5843138, 1, 1,
0.2294193, 0.8763744, 1.176816, 0, 0.5803922, 1, 1,
0.2298103, 1.177674, 0.4125978, 0, 0.572549, 1, 1,
0.2325768, -0.5727246, 2.33592, 0, 0.5686275, 1, 1,
0.2357658, 0.6579386, 0.3779765, 0, 0.5607843, 1, 1,
0.237218, 1.257508, -0.143918, 0, 0.5568628, 1, 1,
0.2380099, 0.4632294, 0.9869668, 0, 0.5490196, 1, 1,
0.2407453, -1.115153, 3.427669, 0, 0.5450981, 1, 1,
0.2419645, -0.1452636, 1.485029, 0, 0.5372549, 1, 1,
0.2422055, 1.958346, -0.9797662, 0, 0.5333334, 1, 1,
0.2439569, 0.2899015, 1.153327, 0, 0.5254902, 1, 1,
0.2443255, -0.586126, 1.45237, 0, 0.5215687, 1, 1,
0.2455062, 0.7923642, -0.0420666, 0, 0.5137255, 1, 1,
0.2476172, -1.55321, 3.430633, 0, 0.509804, 1, 1,
0.2478538, -0.4970075, 2.236502, 0, 0.5019608, 1, 1,
0.2518398, -0.4533219, 3.650188, 0, 0.4941176, 1, 1,
0.2563005, 0.947322, 0.9769828, 0, 0.4901961, 1, 1,
0.2588365, -0.7031546, 3.407829, 0, 0.4823529, 1, 1,
0.2618715, -0.9190398, 4.503205, 0, 0.4784314, 1, 1,
0.2664064, -0.184222, 2.148871, 0, 0.4705882, 1, 1,
0.2698939, 1.641297, -1.248651, 0, 0.4666667, 1, 1,
0.2703634, -0.2616162, 2.586486, 0, 0.4588235, 1, 1,
0.2715434, 0.3010739, 0.3374127, 0, 0.454902, 1, 1,
0.2760191, 1.11874, 0.8102343, 0, 0.4470588, 1, 1,
0.2784545, -1.601579, 2.425388, 0, 0.4431373, 1, 1,
0.2798142, 0.2918307, 1.451505, 0, 0.4352941, 1, 1,
0.2842112, -2.002629, 2.256438, 0, 0.4313726, 1, 1,
0.2971838, -0.3783838, 3.351425, 0, 0.4235294, 1, 1,
0.2975262, 0.7280979, 1.376944, 0, 0.4196078, 1, 1,
0.2993344, -0.1922143, 0.7886266, 0, 0.4117647, 1, 1,
0.3008272, 0.3458788, 1.979276, 0, 0.4078431, 1, 1,
0.3017497, 2.729954, 0.3405656, 0, 0.4, 1, 1,
0.3085511, 0.4344458, 0.8739454, 0, 0.3921569, 1, 1,
0.3102253, -0.4686525, 3.411573, 0, 0.3882353, 1, 1,
0.316621, 0.3106656, 0.6520765, 0, 0.3803922, 1, 1,
0.3188119, -2.5451, 2.176655, 0, 0.3764706, 1, 1,
0.319866, -0.1162939, 1.591828, 0, 0.3686275, 1, 1,
0.3205709, -0.8799134, 3.411786, 0, 0.3647059, 1, 1,
0.3250511, 1.107248, 0.3511076, 0, 0.3568628, 1, 1,
0.3265774, 0.8038897, 0.3661303, 0, 0.3529412, 1, 1,
0.3274553, -0.8639531, 2.053955, 0, 0.345098, 1, 1,
0.3285539, -0.4047723, 2.736253, 0, 0.3411765, 1, 1,
0.3291349, 1.518074, -0.934765, 0, 0.3333333, 1, 1,
0.3293337, 1.535674, -0.4630594, 0, 0.3294118, 1, 1,
0.3381217, 0.5014365, 0.8709769, 0, 0.3215686, 1, 1,
0.3431813, 0.3744883, 1.882881, 0, 0.3176471, 1, 1,
0.3441313, 1.514777, -0.5890255, 0, 0.3098039, 1, 1,
0.3453494, 0.4532965, 1.695085, 0, 0.3058824, 1, 1,
0.3503301, 0.2708107, -0.5131727, 0, 0.2980392, 1, 1,
0.353889, 0.69726, -0.483609, 0, 0.2901961, 1, 1,
0.3547432, -0.629328, 1.984442, 0, 0.2862745, 1, 1,
0.3576441, 0.6486027, -0.1925457, 0, 0.2784314, 1, 1,
0.3614704, -0.4438878, 3.042744, 0, 0.2745098, 1, 1,
0.3618417, -0.08913262, 2.077638, 0, 0.2666667, 1, 1,
0.3619487, -0.3743311, 5.194751, 0, 0.2627451, 1, 1,
0.3646986, -0.7580884, 4.02596, 0, 0.254902, 1, 1,
0.3647336, 0.1717402, 2.213106, 0, 0.2509804, 1, 1,
0.364944, 2.619, 0.1832871, 0, 0.2431373, 1, 1,
0.3714323, -0.1771101, 1.430107, 0, 0.2392157, 1, 1,
0.3749562, -0.6299399, 2.331391, 0, 0.2313726, 1, 1,
0.3769162, -0.9195695, 1.608889, 0, 0.227451, 1, 1,
0.379221, 0.07321186, 1.630518, 0, 0.2196078, 1, 1,
0.3805028, -2.568286, 2.743668, 0, 0.2156863, 1, 1,
0.3807291, -0.00812103, 1.173653, 0, 0.2078431, 1, 1,
0.3829855, -0.009787233, 1.237393, 0, 0.2039216, 1, 1,
0.3858225, 1.157698, -1.272354, 0, 0.1960784, 1, 1,
0.3918918, 0.2980328, 1.018607, 0, 0.1882353, 1, 1,
0.3919315, 0.5255148, 0.7198083, 0, 0.1843137, 1, 1,
0.3935622, 0.6397188, 1.02394, 0, 0.1764706, 1, 1,
0.3955303, 0.2169187, 0.991063, 0, 0.172549, 1, 1,
0.3962513, -0.351454, 4.117759, 0, 0.1647059, 1, 1,
0.3967917, -1.170565, 3.526643, 0, 0.1607843, 1, 1,
0.3977387, 0.2840549, 0.7754702, 0, 0.1529412, 1, 1,
0.3990634, -1.491168, 3.242461, 0, 0.1490196, 1, 1,
0.4028051, 2.91391, 0.9686835, 0, 0.1411765, 1, 1,
0.4040724, 0.2613879, 1.252456, 0, 0.1372549, 1, 1,
0.4084625, 0.6819115, 0.7835032, 0, 0.1294118, 1, 1,
0.4099438, 0.1341576, 2.751408, 0, 0.1254902, 1, 1,
0.4119146, -0.2687243, 3.327049, 0, 0.1176471, 1, 1,
0.4123066, 2.293271, 0.9796364, 0, 0.1137255, 1, 1,
0.4153121, -0.4075647, 1.02293, 0, 0.1058824, 1, 1,
0.4176447, 0.05279474, 1.147941, 0, 0.09803922, 1, 1,
0.4220937, 0.7417742, 0.307813, 0, 0.09411765, 1, 1,
0.4254755, 0.5492325, 0.6620777, 0, 0.08627451, 1, 1,
0.4282799, -0.4886858, 2.495739, 0, 0.08235294, 1, 1,
0.4291324, 0.03385364, 3.183976, 0, 0.07450981, 1, 1,
0.431545, 0.2828315, -0.4232939, 0, 0.07058824, 1, 1,
0.432195, 0.3055455, -0.4701473, 0, 0.0627451, 1, 1,
0.4395525, -0.9721256, 3.219435, 0, 0.05882353, 1, 1,
0.4401901, 0.8352938, 0.4728503, 0, 0.05098039, 1, 1,
0.4415655, -1.479889, 3.238673, 0, 0.04705882, 1, 1,
0.4464914, 0.5551118, -0.4120766, 0, 0.03921569, 1, 1,
0.4480577, 0.4976696, 0.6755068, 0, 0.03529412, 1, 1,
0.4524165, 1.496532, 2.937022, 0, 0.02745098, 1, 1,
0.4545248, 0.2669022, -0.6911497, 0, 0.02352941, 1, 1,
0.4549369, 1.163037, 1.632762, 0, 0.01568628, 1, 1,
0.4590649, 1.462556, 1.206968, 0, 0.01176471, 1, 1,
0.4601432, 0.7788012, 2.181873, 0, 0.003921569, 1, 1,
0.4607094, 1.076251, -0.2863446, 0.003921569, 0, 1, 1,
0.4628085, 0.3057594, 0.4529404, 0.007843138, 0, 1, 1,
0.4635483, 0.6668185, 2.246613, 0.01568628, 0, 1, 1,
0.4678482, -0.01184992, 1.21487, 0.01960784, 0, 1, 1,
0.4693609, 0.1192442, 1.741295, 0.02745098, 0, 1, 1,
0.4743035, 0.7770006, 0.1185748, 0.03137255, 0, 1, 1,
0.476776, -0.8805956, 2.102023, 0.03921569, 0, 1, 1,
0.4777661, -1.117316, 3.690951, 0.04313726, 0, 1, 1,
0.478253, 0.6228211, 0.3632474, 0.05098039, 0, 1, 1,
0.4827003, -0.4913428, 3.738893, 0.05490196, 0, 1, 1,
0.4873891, 0.47822, -0.5138743, 0.0627451, 0, 1, 1,
0.4901913, -0.4212591, 3.190346, 0.06666667, 0, 1, 1,
0.4954919, 0.2677233, 2.756237, 0.07450981, 0, 1, 1,
0.4961254, 0.5526027, 0.3767121, 0.07843138, 0, 1, 1,
0.4976809, -1.550825, 1.955901, 0.08627451, 0, 1, 1,
0.5002258, 0.3378759, -0.02646237, 0.09019608, 0, 1, 1,
0.5013732, 0.5859418, 0.3869025, 0.09803922, 0, 1, 1,
0.5028208, 0.7669973, 1.788915, 0.1058824, 0, 1, 1,
0.5105067, -0.2081997, 2.012628, 0.1098039, 0, 1, 1,
0.5106292, -0.5607821, 3.08376, 0.1176471, 0, 1, 1,
0.5176301, 0.5155433, 0.9734452, 0.1215686, 0, 1, 1,
0.5232788, -0.5342666, 2.143941, 0.1294118, 0, 1, 1,
0.5341727, -0.706715, 1.987047, 0.1333333, 0, 1, 1,
0.5356354, 1.368122, -0.5050583, 0.1411765, 0, 1, 1,
0.5390017, 0.201221, 1.789881, 0.145098, 0, 1, 1,
0.543788, -1.108441, 3.955623, 0.1529412, 0, 1, 1,
0.5512009, -0.2726087, 2.223855, 0.1568628, 0, 1, 1,
0.5526257, 1.246219, 1.770909, 0.1647059, 0, 1, 1,
0.5573087, 0.8169488, 1.40608, 0.1686275, 0, 1, 1,
0.5632866, 0.01507468, 1.081695, 0.1764706, 0, 1, 1,
0.5669549, -1.224334, 2.924031, 0.1803922, 0, 1, 1,
0.5783984, -0.381579, 1.95131, 0.1882353, 0, 1, 1,
0.5879003, -2.148947, 3.145211, 0.1921569, 0, 1, 1,
0.5882973, 0.341659, 2.590914, 0.2, 0, 1, 1,
0.5908857, -0.7569469, 3.172189, 0.2078431, 0, 1, 1,
0.5910172, -1.067683, 2.789709, 0.2117647, 0, 1, 1,
0.5931445, -1.115298, 4.23601, 0.2196078, 0, 1, 1,
0.5948523, 0.7185062, 0.4100685, 0.2235294, 0, 1, 1,
0.5949729, 0.9432176, 0.3447094, 0.2313726, 0, 1, 1,
0.596894, 1.573531, 2.561622, 0.2352941, 0, 1, 1,
0.5981553, -0.4219023, 2.988186, 0.2431373, 0, 1, 1,
0.5995603, -1.169759, 3.224399, 0.2470588, 0, 1, 1,
0.6011155, -1.06278, 2.720163, 0.254902, 0, 1, 1,
0.6018658, 0.06486034, 3.371575, 0.2588235, 0, 1, 1,
0.6031201, 0.1618279, -0.245351, 0.2666667, 0, 1, 1,
0.6043707, -0.3727914, 3.75429, 0.2705882, 0, 1, 1,
0.6085925, 0.04852908, 1.065378, 0.2784314, 0, 1, 1,
0.6140084, -0.2768203, 1.817539, 0.282353, 0, 1, 1,
0.6241518, 0.8029109, 0.3033929, 0.2901961, 0, 1, 1,
0.6318601, -0.6150063, 1.736874, 0.2941177, 0, 1, 1,
0.6320505, 0.2810153, 0.9261633, 0.3019608, 0, 1, 1,
0.6331226, 1.399848, -0.7690659, 0.3098039, 0, 1, 1,
0.6343102, -0.08766054, 1.124152, 0.3137255, 0, 1, 1,
0.6367459, 0.5639771, 0.5927113, 0.3215686, 0, 1, 1,
0.6371984, -2.209555, 1.449367, 0.3254902, 0, 1, 1,
0.6373247, 0.1113073, 1.259386, 0.3333333, 0, 1, 1,
0.6379136, -1.601329, 3.746601, 0.3372549, 0, 1, 1,
0.6430773, -0.02973448, 2.235191, 0.345098, 0, 1, 1,
0.6454065, -0.05214162, 2.093886, 0.3490196, 0, 1, 1,
0.6555675, 0.4824713, -0.2213147, 0.3568628, 0, 1, 1,
0.6564626, 0.669019, 0.4707481, 0.3607843, 0, 1, 1,
0.6565962, 0.4578307, 0.3260059, 0.3686275, 0, 1, 1,
0.6592351, 1.395762, 0.1482837, 0.372549, 0, 1, 1,
0.6623702, -0.306595, 2.331857, 0.3803922, 0, 1, 1,
0.6689599, -0.9047238, 1.929795, 0.3843137, 0, 1, 1,
0.6698861, 0.3366733, 0.4006134, 0.3921569, 0, 1, 1,
0.6711127, 0.2401263, 1.207745, 0.3960784, 0, 1, 1,
0.6723766, 0.7938271, -0.3637137, 0.4039216, 0, 1, 1,
0.6765211, 0.5093281, 1.329739, 0.4117647, 0, 1, 1,
0.6855189, -0.4317974, 2.861493, 0.4156863, 0, 1, 1,
0.6859104, -0.2433844, 2.544142, 0.4235294, 0, 1, 1,
0.6870618, -0.4983161, 3.448059, 0.427451, 0, 1, 1,
0.6929726, -0.6234334, 1.904578, 0.4352941, 0, 1, 1,
0.6946306, -0.5861967, 2.26537, 0.4392157, 0, 1, 1,
0.6994625, -1.334782, 3.613193, 0.4470588, 0, 1, 1,
0.6994976, -0.6740028, 1.861275, 0.4509804, 0, 1, 1,
0.7074226, 1.771601, 0.6644314, 0.4588235, 0, 1, 1,
0.7110447, -1.293824, 3.000823, 0.4627451, 0, 1, 1,
0.7145172, 1.47807, -0.1096522, 0.4705882, 0, 1, 1,
0.7254462, -0.6471792, 0.7229334, 0.4745098, 0, 1, 1,
0.7280643, 0.3611547, 0.9072326, 0.4823529, 0, 1, 1,
0.7285567, 0.7371094, 1.811142, 0.4862745, 0, 1, 1,
0.7294569, 0.2721452, 1.63062, 0.4941176, 0, 1, 1,
0.7376373, 0.4865156, -0.0608477, 0.5019608, 0, 1, 1,
0.7444343, -1.099238, 2.760264, 0.5058824, 0, 1, 1,
0.7449899, -0.6502343, 3.362905, 0.5137255, 0, 1, 1,
0.7494058, -1.142295, 1.988917, 0.5176471, 0, 1, 1,
0.7517626, 0.6663448, 0.862946, 0.5254902, 0, 1, 1,
0.7526585, 0.1308369, 1.959993, 0.5294118, 0, 1, 1,
0.7532063, 1.801226, 1.103776, 0.5372549, 0, 1, 1,
0.7557014, -0.6348047, 2.289169, 0.5411765, 0, 1, 1,
0.7570207, -0.6686473, 4.331922, 0.5490196, 0, 1, 1,
0.7589429, 1.92194, 1.070051, 0.5529412, 0, 1, 1,
0.7642084, 0.1688435, 0.2240116, 0.5607843, 0, 1, 1,
0.7671213, 1.983225, 0.5555015, 0.5647059, 0, 1, 1,
0.7679322, 1.166246, -0.2863361, 0.572549, 0, 1, 1,
0.7704635, 1.257602, 0.9608273, 0.5764706, 0, 1, 1,
0.77504, -1.374787, 2.022246, 0.5843138, 0, 1, 1,
0.7768267, 0.03657401, 1.849526, 0.5882353, 0, 1, 1,
0.779371, -0.9861529, 0.5781571, 0.5960785, 0, 1, 1,
0.7846584, -0.4856273, 2.396295, 0.6039216, 0, 1, 1,
0.7908989, 0.1921299, 0.3758428, 0.6078432, 0, 1, 1,
0.7944945, -0.1106729, 2.015825, 0.6156863, 0, 1, 1,
0.7961768, -0.6020607, 1.539202, 0.6196079, 0, 1, 1,
0.8032452, -1.234298, 4.285153, 0.627451, 0, 1, 1,
0.8059921, 1.706407, 0.03459568, 0.6313726, 0, 1, 1,
0.8147061, 0.8149748, -1.24955, 0.6392157, 0, 1, 1,
0.8160974, -1.480883, 1.394414, 0.6431373, 0, 1, 1,
0.8162895, 2.261666, 0.9181979, 0.6509804, 0, 1, 1,
0.8208261, 0.01928319, -0.06536509, 0.654902, 0, 1, 1,
0.8225054, 0.3897087, 0.1121605, 0.6627451, 0, 1, 1,
0.8249414, 0.5694462, 0.19149, 0.6666667, 0, 1, 1,
0.8273761, -1.040436, 3.324217, 0.6745098, 0, 1, 1,
0.8313779, 0.3929035, 0.5139553, 0.6784314, 0, 1, 1,
0.8343432, -2.037406, 2.713844, 0.6862745, 0, 1, 1,
0.835731, -1.801847, 4.287642, 0.6901961, 0, 1, 1,
0.8362898, 0.7397566, 0.5011851, 0.6980392, 0, 1, 1,
0.8368148, 0.01877472, 1.694492, 0.7058824, 0, 1, 1,
0.8390883, -0.2542181, 0.3116024, 0.7098039, 0, 1, 1,
0.847504, -0.6308697, 1.216081, 0.7176471, 0, 1, 1,
0.8545625, 1.456238, 0.4174851, 0.7215686, 0, 1, 1,
0.8554662, 2.781837, -0.4140862, 0.7294118, 0, 1, 1,
0.8592798, -0.7980427, 2.856436, 0.7333333, 0, 1, 1,
0.8625137, -0.4422251, 1.382042, 0.7411765, 0, 1, 1,
0.8626629, 0.03015741, 0.4209365, 0.7450981, 0, 1, 1,
0.8647792, 1.016375, 1.405449, 0.7529412, 0, 1, 1,
0.8663764, -1.064379, 3.406337, 0.7568628, 0, 1, 1,
0.8725173, 1.154762, 1.739895, 0.7647059, 0, 1, 1,
0.8778117, 0.08343454, 1.731971, 0.7686275, 0, 1, 1,
0.8792814, 0.3223208, 1.075002, 0.7764706, 0, 1, 1,
0.8950104, 0.2163608, -0.007474321, 0.7803922, 0, 1, 1,
0.8962709, 0.8497441, -0.9916906, 0.7882353, 0, 1, 1,
0.8986529, -0.09000361, 1.350824, 0.7921569, 0, 1, 1,
0.8995119, -0.2672864, 1.908182, 0.8, 0, 1, 1,
0.8995991, 0.5988991, 2.071344, 0.8078431, 0, 1, 1,
0.9007301, -0.2596128, 1.237018, 0.8117647, 0, 1, 1,
0.9008868, 0.5703044, -0.5219168, 0.8196079, 0, 1, 1,
0.9023318, 0.9257897, 1.028038, 0.8235294, 0, 1, 1,
0.9040157, -0.5933166, 3.053735, 0.8313726, 0, 1, 1,
0.9062385, 1.459162, 0.4970525, 0.8352941, 0, 1, 1,
0.9082618, 0.5765669, 1.257624, 0.8431373, 0, 1, 1,
0.9101657, -0.3681973, 1.457559, 0.8470588, 0, 1, 1,
0.9133977, 0.7587005, 3.374483, 0.854902, 0, 1, 1,
0.9134328, -1.84185, 4.816595, 0.8588235, 0, 1, 1,
0.9164261, 0.5944559, 0.4107203, 0.8666667, 0, 1, 1,
0.9175882, 0.9122083, 1.105218, 0.8705882, 0, 1, 1,
0.9277011, 1.009114, -0.5473125, 0.8784314, 0, 1, 1,
0.9298038, -2.256084, 3.402492, 0.8823529, 0, 1, 1,
0.9321984, 1.87402, -2.195752, 0.8901961, 0, 1, 1,
0.9406353, 0.2905193, 1.874253, 0.8941177, 0, 1, 1,
0.9407607, 0.9598036, 1.384451, 0.9019608, 0, 1, 1,
0.9433358, 0.3127303, 2.653443, 0.9098039, 0, 1, 1,
0.9521922, 0.2460538, 0.866307, 0.9137255, 0, 1, 1,
0.9540208, -0.741659, 1.326583, 0.9215686, 0, 1, 1,
0.9565348, 0.8731081, 0.9253, 0.9254902, 0, 1, 1,
0.9624232, -1.329708, 2.885347, 0.9333333, 0, 1, 1,
0.9652352, -1.589859, 2.187668, 0.9372549, 0, 1, 1,
0.9694508, -0.008732495, 1.738119, 0.945098, 0, 1, 1,
0.9695561, 0.3290886, 1.697585, 0.9490196, 0, 1, 1,
0.9725218, -0.0454289, 2.263716, 0.9568627, 0, 1, 1,
0.9754207, -1.083323, 0.8467284, 0.9607843, 0, 1, 1,
0.9754997, -0.4264373, 2.503101, 0.9686275, 0, 1, 1,
0.9795614, -0.5254996, 2.453564, 0.972549, 0, 1, 1,
0.9845741, 1.323096, -1.30938, 0.9803922, 0, 1, 1,
0.9896371, 1.545321, 2.183842, 0.9843137, 0, 1, 1,
0.9930229, -0.4324063, 2.163108, 0.9921569, 0, 1, 1,
0.9988729, -0.9386774, 4.459733, 0.9960784, 0, 1, 1,
1.007356, 1.414426, -0.4195471, 1, 0, 0.9960784, 1,
1.009577, -0.5891359, 2.242609, 1, 0, 0.9882353, 1,
1.014192, 1.519455, -0.2404334, 1, 0, 0.9843137, 1,
1.014238, -0.4031901, 2.591087, 1, 0, 0.9764706, 1,
1.023606, -0.3835177, 3.733638, 1, 0, 0.972549, 1,
1.028595, -0.8550541, 3.633828, 1, 0, 0.9647059, 1,
1.032961, 1.316971, 0.444916, 1, 0, 0.9607843, 1,
1.035961, 1.455903, 1.983165, 1, 0, 0.9529412, 1,
1.042327, 0.9107177, 0.4423428, 1, 0, 0.9490196, 1,
1.04657, 1.18602, 0.125091, 1, 0, 0.9411765, 1,
1.049202, 2.196635, 1.456075, 1, 0, 0.9372549, 1,
1.049787, -1.367434, 2.702989, 1, 0, 0.9294118, 1,
1.050413, 0.2837048, 0.7759557, 1, 0, 0.9254902, 1,
1.061437, 1.656304, 0.01102366, 1, 0, 0.9176471, 1,
1.065604, 0.8619128, 2.348882, 1, 0, 0.9137255, 1,
1.067934, 0.207731, 0.923847, 1, 0, 0.9058824, 1,
1.071598, 0.1561681, 0.0080251, 1, 0, 0.9019608, 1,
1.075907, 1.642247, 1.760017, 1, 0, 0.8941177, 1,
1.081827, -0.6756351, 1.024971, 1, 0, 0.8862745, 1,
1.088228, -0.5611509, 3.251181, 1, 0, 0.8823529, 1,
1.093261, 1.572232, 0.4506613, 1, 0, 0.8745098, 1,
1.095199, -2.07827, 2.986008, 1, 0, 0.8705882, 1,
1.095257, 0.4329977, 1.517685, 1, 0, 0.8627451, 1,
1.105231, -1.487692, 4.036578, 1, 0, 0.8588235, 1,
1.110216, -1.101452, 2.308091, 1, 0, 0.8509804, 1,
1.114972, -1.306575, 1.586913, 1, 0, 0.8470588, 1,
1.12501, -0.2872548, 2.616459, 1, 0, 0.8392157, 1,
1.137014, 0.6572643, -0.6223035, 1, 0, 0.8352941, 1,
1.140103, 0.07497085, 0.2642955, 1, 0, 0.827451, 1,
1.140447, 0.7837271, 1.708529, 1, 0, 0.8235294, 1,
1.144179, -0.2101918, 1.481717, 1, 0, 0.8156863, 1,
1.145148, -1.765423, 2.620473, 1, 0, 0.8117647, 1,
1.151718, 0.4542752, 0.4919688, 1, 0, 0.8039216, 1,
1.151835, -0.541162, 1.036451, 1, 0, 0.7960784, 1,
1.151856, 0.1932842, 3.236843, 1, 0, 0.7921569, 1,
1.1715, 1.123123, -0.1347178, 1, 0, 0.7843137, 1,
1.174928, 0.4224371, 1.649503, 1, 0, 0.7803922, 1,
1.186857, 0.9891212, 1.521002, 1, 0, 0.772549, 1,
1.193778, 1.424818, 1.265301, 1, 0, 0.7686275, 1,
1.197927, -1.665503, 3.040326, 1, 0, 0.7607843, 1,
1.200315, -1.069173, 1.374743, 1, 0, 0.7568628, 1,
1.210388, 0.6838591, -0.01789507, 1, 0, 0.7490196, 1,
1.21899, -0.111365, 1.85503, 1, 0, 0.7450981, 1,
1.223044, -0.9784536, 2.900939, 1, 0, 0.7372549, 1,
1.224644, 1.175661, 0.8962893, 1, 0, 0.7333333, 1,
1.225012, 0.09451055, 0.5215517, 1, 0, 0.7254902, 1,
1.227555, 0.5746808, 2.127599, 1, 0, 0.7215686, 1,
1.23042, 0.6085653, 0.2495776, 1, 0, 0.7137255, 1,
1.232365, -0.1175931, 2.971259, 1, 0, 0.7098039, 1,
1.233007, -0.5226001, 1.800346, 1, 0, 0.7019608, 1,
1.24264, -0.8620278, 1.274008, 1, 0, 0.6941177, 1,
1.244289, 0.6513874, 1.8361, 1, 0, 0.6901961, 1,
1.248383, -0.4573996, 1.765653, 1, 0, 0.682353, 1,
1.257165, 0.0743577, 1.067946, 1, 0, 0.6784314, 1,
1.262817, 1.577513, 1.007504, 1, 0, 0.6705883, 1,
1.26328, 0.2866627, 1.908391, 1, 0, 0.6666667, 1,
1.274106, -0.7803172, 3.313965, 1, 0, 0.6588235, 1,
1.280035, -0.5854551, 2.394396, 1, 0, 0.654902, 1,
1.288883, -1.067808, 2.094196, 1, 0, 0.6470588, 1,
1.293225, 1.411454, 0.3616284, 1, 0, 0.6431373, 1,
1.29566, -1.10164, 1.291926, 1, 0, 0.6352941, 1,
1.300859, 1.087271, 2.018213, 1, 0, 0.6313726, 1,
1.306651, -0.7998567, 1.290881, 1, 0, 0.6235294, 1,
1.324866, 2.174073, 0.9970856, 1, 0, 0.6196079, 1,
1.325, 0.9184234, 1.523385, 1, 0, 0.6117647, 1,
1.325144, -0.4082364, 0.2841406, 1, 0, 0.6078432, 1,
1.326945, 0.1083819, 0.4615432, 1, 0, 0.6, 1,
1.327604, -0.8959806, 2.325983, 1, 0, 0.5921569, 1,
1.329184, -0.5987424, 2.964436, 1, 0, 0.5882353, 1,
1.330203, -1.060147, 0.002056554, 1, 0, 0.5803922, 1,
1.330391, 1.057432, -0.02333755, 1, 0, 0.5764706, 1,
1.330446, 0.8198841, 1.029403, 1, 0, 0.5686275, 1,
1.336126, 0.1537693, 1.345672, 1, 0, 0.5647059, 1,
1.338048, -0.2748692, 2.278229, 1, 0, 0.5568628, 1,
1.349699, -1.599259, 1.302355, 1, 0, 0.5529412, 1,
1.352184, 0.8563159, 0.6331391, 1, 0, 0.5450981, 1,
1.354543, 0.9286448, 1.3272, 1, 0, 0.5411765, 1,
1.35662, -1.167227, 2.540308, 1, 0, 0.5333334, 1,
1.367082, -1.269336, 3.310414, 1, 0, 0.5294118, 1,
1.369154, -2.082238, 1.728135, 1, 0, 0.5215687, 1,
1.372285, 0.9067649, 0.9640248, 1, 0, 0.5176471, 1,
1.374344, 0.3794982, 1.363268, 1, 0, 0.509804, 1,
1.382422, 0.1788896, 1.537169, 1, 0, 0.5058824, 1,
1.391515, -0.06029686, 0.6996773, 1, 0, 0.4980392, 1,
1.391845, 1.228658, 1.420303, 1, 0, 0.4901961, 1,
1.395573, 0.8534325, 1.467545, 1, 0, 0.4862745, 1,
1.402848, 0.1529948, 1.864865, 1, 0, 0.4784314, 1,
1.40473, -1.059316, 1.929582, 1, 0, 0.4745098, 1,
1.406746, 0.173185, 1.044112, 1, 0, 0.4666667, 1,
1.412959, 0.5809653, 1.4142, 1, 0, 0.4627451, 1,
1.417153, 0.2805463, -0.04979682, 1, 0, 0.454902, 1,
1.419115, 1.383276, -0.1285347, 1, 0, 0.4509804, 1,
1.427478, 0.9122179, 0.1285642, 1, 0, 0.4431373, 1,
1.429173, -0.06709498, 2.161276, 1, 0, 0.4392157, 1,
1.437482, 0.3770983, 0.999815, 1, 0, 0.4313726, 1,
1.44981, -0.2747912, 0.918221, 1, 0, 0.427451, 1,
1.452906, -0.1936792, 0.5027316, 1, 0, 0.4196078, 1,
1.464081, 0.9787939, -0.2209242, 1, 0, 0.4156863, 1,
1.475348, -0.6744971, 0.8865252, 1, 0, 0.4078431, 1,
1.476034, 0.8247082, 1.146328, 1, 0, 0.4039216, 1,
1.477584, 0.2844492, 2.072038, 1, 0, 0.3960784, 1,
1.48422, -0.2047373, 2.706511, 1, 0, 0.3882353, 1,
1.489686, 0.5590593, 0.3058957, 1, 0, 0.3843137, 1,
1.490357, 0.003475109, 2.441035, 1, 0, 0.3764706, 1,
1.504706, -0.5611111, 2.370867, 1, 0, 0.372549, 1,
1.524157, 0.1438699, 0.6118583, 1, 0, 0.3647059, 1,
1.529011, 0.1810322, 1.960182, 1, 0, 0.3607843, 1,
1.533444, -0.1287142, 2.373674, 1, 0, 0.3529412, 1,
1.548016, 0.1159905, 0.5727094, 1, 0, 0.3490196, 1,
1.564863, -0.142261, 2.425525, 1, 0, 0.3411765, 1,
1.57334, 0.7373456, 2.902934, 1, 0, 0.3372549, 1,
1.579344, 1.607831, -0.5205263, 1, 0, 0.3294118, 1,
1.579402, -0.6275327, 0.7684644, 1, 0, 0.3254902, 1,
1.589002, -2.29143, 1.508283, 1, 0, 0.3176471, 1,
1.59405, -0.5860865, 1.468437, 1, 0, 0.3137255, 1,
1.601167, 1.870608, 1.387414, 1, 0, 0.3058824, 1,
1.624763, 0.967129, 2.279292, 1, 0, 0.2980392, 1,
1.628159, -0.7976282, 3.698213, 1, 0, 0.2941177, 1,
1.628833, 0.3166356, 1.32315, 1, 0, 0.2862745, 1,
1.640507, -0.08549709, 2.70183, 1, 0, 0.282353, 1,
1.642916, 0.4217334, 0.507317, 1, 0, 0.2745098, 1,
1.64359, 1.852477, 1.61533, 1, 0, 0.2705882, 1,
1.64945, 0.9625743, -0.6124313, 1, 0, 0.2627451, 1,
1.660048, 0.8295172, 0.3977903, 1, 0, 0.2588235, 1,
1.692582, -0.3029546, 2.167775, 1, 0, 0.2509804, 1,
1.718636, 0.22562, 1.831118, 1, 0, 0.2470588, 1,
1.722356, 1.279292, 1.622478, 1, 0, 0.2392157, 1,
1.732934, 1.205517, -0.6703734, 1, 0, 0.2352941, 1,
1.739682, 1.25103, 0.8449839, 1, 0, 0.227451, 1,
1.752696, -0.7930226, 1.068736, 1, 0, 0.2235294, 1,
1.757744, 0.6435968, 2.130148, 1, 0, 0.2156863, 1,
1.785459, -0.1039678, 0.4058821, 1, 0, 0.2117647, 1,
1.793561, 1.327153, 0.155814, 1, 0, 0.2039216, 1,
1.82145, -0.2739999, 1.973729, 1, 0, 0.1960784, 1,
1.831609, -1.231085, 1.429012, 1, 0, 0.1921569, 1,
1.831822, -0.1392803, 2.152385, 1, 0, 0.1843137, 1,
1.84824, 1.448306, 1.69579, 1, 0, 0.1803922, 1,
1.850346, 1.020837, 1.618895, 1, 0, 0.172549, 1,
1.88105, 1.013499, -0.3389574, 1, 0, 0.1686275, 1,
1.968208, -0.9925811, 3.08351, 1, 0, 0.1607843, 1,
1.994473, 1.465258, 0.4307174, 1, 0, 0.1568628, 1,
2.012053, 0.2761877, 1.197063, 1, 0, 0.1490196, 1,
2.036, 1.714769, 1.564463, 1, 0, 0.145098, 1,
2.058327, 0.9572935, 0.04283255, 1, 0, 0.1372549, 1,
2.062883, 1.816907, 1.012031, 1, 0, 0.1333333, 1,
2.066943, -0.2410507, 1.581704, 1, 0, 0.1254902, 1,
2.069499, -0.047544, 0.5540769, 1, 0, 0.1215686, 1,
2.076984, -0.4614362, 2.403889, 1, 0, 0.1137255, 1,
2.09811, 0.7513428, 1.626386, 1, 0, 0.1098039, 1,
2.103508, -0.05920676, 1.62219, 1, 0, 0.1019608, 1,
2.115268, -1.016769, 1.315983, 1, 0, 0.09411765, 1,
2.139346, -2.033653, 2.709899, 1, 0, 0.09019608, 1,
2.186234, -0.4056242, 3.132325, 1, 0, 0.08235294, 1,
2.193239, -1.426367, 4.291922, 1, 0, 0.07843138, 1,
2.240226, -0.01109986, 1.998222, 1, 0, 0.07058824, 1,
2.262112, -0.636874, 0.7863581, 1, 0, 0.06666667, 1,
2.353929, -0.8665428, 1.943041, 1, 0, 0.05882353, 1,
2.41187, -1.915819, 1.716148, 1, 0, 0.05490196, 1,
2.447772, -0.02406477, 4.002429, 1, 0, 0.04705882, 1,
2.450866, -0.5369542, 2.550478, 1, 0, 0.04313726, 1,
2.451522, 1.792889, 3.149417, 1, 0, 0.03529412, 1,
2.473344, -0.6985328, 1.693458, 1, 0, 0.03137255, 1,
2.479699, -0.8608143, 1.329069, 1, 0, 0.02352941, 1,
2.573987, -0.6539705, 2.572677, 1, 0, 0.01960784, 1,
2.934108, -2.107944, 2.290722, 1, 0, 0.01176471, 1,
3.101491, 0.275142, 1.131397, 1, 0, 0.007843138, 1
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
-0.2136939, -4.042712, -7.16938, 0, -0.5, 0.5, 0.5,
-0.2136939, -4.042712, -7.16938, 1, -0.5, 0.5, 0.5,
-0.2136939, -4.042712, -7.16938, 1, 1.5, 0.5, 0.5,
-0.2136939, -4.042712, -7.16938, 0, 1.5, 0.5, 0.5
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
-4.652727, -0.06027615, -7.16938, 0, -0.5, 0.5, 0.5,
-4.652727, -0.06027615, -7.16938, 1, -0.5, 0.5, 0.5,
-4.652727, -0.06027615, -7.16938, 1, 1.5, 0.5, 0.5,
-4.652727, -0.06027615, -7.16938, 0, 1.5, 0.5, 0.5
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
-4.652727, -4.042712, -0.09132481, 0, -0.5, 0.5, 0.5,
-4.652727, -4.042712, -0.09132481, 1, -0.5, 0.5, 0.5,
-4.652727, -4.042712, -0.09132481, 1, 1.5, 0.5, 0.5,
-4.652727, -4.042712, -0.09132481, 0, 1.5, 0.5, 0.5
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
-3, -3.123688, -5.535983,
3, -3.123688, -5.535983,
-3, -3.123688, -5.535983,
-3, -3.276859, -5.808216,
-2, -3.123688, -5.535983,
-2, -3.276859, -5.808216,
-1, -3.123688, -5.535983,
-1, -3.276859, -5.808216,
0, -3.123688, -5.535983,
0, -3.276859, -5.808216,
1, -3.123688, -5.535983,
1, -3.276859, -5.808216,
2, -3.123688, -5.535983,
2, -3.276859, -5.808216,
3, -3.123688, -5.535983,
3, -3.276859, -5.808216
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
-3, -3.5832, -6.352681, 0, -0.5, 0.5, 0.5,
-3, -3.5832, -6.352681, 1, -0.5, 0.5, 0.5,
-3, -3.5832, -6.352681, 1, 1.5, 0.5, 0.5,
-3, -3.5832, -6.352681, 0, 1.5, 0.5, 0.5,
-2, -3.5832, -6.352681, 0, -0.5, 0.5, 0.5,
-2, -3.5832, -6.352681, 1, -0.5, 0.5, 0.5,
-2, -3.5832, -6.352681, 1, 1.5, 0.5, 0.5,
-2, -3.5832, -6.352681, 0, 1.5, 0.5, 0.5,
-1, -3.5832, -6.352681, 0, -0.5, 0.5, 0.5,
-1, -3.5832, -6.352681, 1, -0.5, 0.5, 0.5,
-1, -3.5832, -6.352681, 1, 1.5, 0.5, 0.5,
-1, -3.5832, -6.352681, 0, 1.5, 0.5, 0.5,
0, -3.5832, -6.352681, 0, -0.5, 0.5, 0.5,
0, -3.5832, -6.352681, 1, -0.5, 0.5, 0.5,
0, -3.5832, -6.352681, 1, 1.5, 0.5, 0.5,
0, -3.5832, -6.352681, 0, 1.5, 0.5, 0.5,
1, -3.5832, -6.352681, 0, -0.5, 0.5, 0.5,
1, -3.5832, -6.352681, 1, -0.5, 0.5, 0.5,
1, -3.5832, -6.352681, 1, 1.5, 0.5, 0.5,
1, -3.5832, -6.352681, 0, 1.5, 0.5, 0.5,
2, -3.5832, -6.352681, 0, -0.5, 0.5, 0.5,
2, -3.5832, -6.352681, 1, -0.5, 0.5, 0.5,
2, -3.5832, -6.352681, 1, 1.5, 0.5, 0.5,
2, -3.5832, -6.352681, 0, 1.5, 0.5, 0.5,
3, -3.5832, -6.352681, 0, -0.5, 0.5, 0.5,
3, -3.5832, -6.352681, 1, -0.5, 0.5, 0.5,
3, -3.5832, -6.352681, 1, 1.5, 0.5, 0.5,
3, -3.5832, -6.352681, 0, 1.5, 0.5, 0.5
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
-3.628335, -3, -5.535983,
-3.628335, 2, -5.535983,
-3.628335, -3, -5.535983,
-3.799067, -3, -5.808216,
-3.628335, -2, -5.535983,
-3.799067, -2, -5.808216,
-3.628335, -1, -5.535983,
-3.799067, -1, -5.808216,
-3.628335, 0, -5.535983,
-3.799067, 0, -5.808216,
-3.628335, 1, -5.535983,
-3.799067, 1, -5.808216,
-3.628335, 2, -5.535983,
-3.799067, 2, -5.808216
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
-4.140531, -3, -6.352681, 0, -0.5, 0.5, 0.5,
-4.140531, -3, -6.352681, 1, -0.5, 0.5, 0.5,
-4.140531, -3, -6.352681, 1, 1.5, 0.5, 0.5,
-4.140531, -3, -6.352681, 0, 1.5, 0.5, 0.5,
-4.140531, -2, -6.352681, 0, -0.5, 0.5, 0.5,
-4.140531, -2, -6.352681, 1, -0.5, 0.5, 0.5,
-4.140531, -2, -6.352681, 1, 1.5, 0.5, 0.5,
-4.140531, -2, -6.352681, 0, 1.5, 0.5, 0.5,
-4.140531, -1, -6.352681, 0, -0.5, 0.5, 0.5,
-4.140531, -1, -6.352681, 1, -0.5, 0.5, 0.5,
-4.140531, -1, -6.352681, 1, 1.5, 0.5, 0.5,
-4.140531, -1, -6.352681, 0, 1.5, 0.5, 0.5,
-4.140531, 0, -6.352681, 0, -0.5, 0.5, 0.5,
-4.140531, 0, -6.352681, 1, -0.5, 0.5, 0.5,
-4.140531, 0, -6.352681, 1, 1.5, 0.5, 0.5,
-4.140531, 0, -6.352681, 0, 1.5, 0.5, 0.5,
-4.140531, 1, -6.352681, 0, -0.5, 0.5, 0.5,
-4.140531, 1, -6.352681, 1, -0.5, 0.5, 0.5,
-4.140531, 1, -6.352681, 1, 1.5, 0.5, 0.5,
-4.140531, 1, -6.352681, 0, 1.5, 0.5, 0.5,
-4.140531, 2, -6.352681, 0, -0.5, 0.5, 0.5,
-4.140531, 2, -6.352681, 1, -0.5, 0.5, 0.5,
-4.140531, 2, -6.352681, 1, 1.5, 0.5, 0.5,
-4.140531, 2, -6.352681, 0, 1.5, 0.5, 0.5
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
-3.628335, -3.123688, -4,
-3.628335, -3.123688, 4,
-3.628335, -3.123688, -4,
-3.799067, -3.276859, -4,
-3.628335, -3.123688, -2,
-3.799067, -3.276859, -2,
-3.628335, -3.123688, 0,
-3.799067, -3.276859, 0,
-3.628335, -3.123688, 2,
-3.799067, -3.276859, 2,
-3.628335, -3.123688, 4,
-3.799067, -3.276859, 4
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
-4.140531, -3.5832, -4, 0, -0.5, 0.5, 0.5,
-4.140531, -3.5832, -4, 1, -0.5, 0.5, 0.5,
-4.140531, -3.5832, -4, 1, 1.5, 0.5, 0.5,
-4.140531, -3.5832, -4, 0, 1.5, 0.5, 0.5,
-4.140531, -3.5832, -2, 0, -0.5, 0.5, 0.5,
-4.140531, -3.5832, -2, 1, -0.5, 0.5, 0.5,
-4.140531, -3.5832, -2, 1, 1.5, 0.5, 0.5,
-4.140531, -3.5832, -2, 0, 1.5, 0.5, 0.5,
-4.140531, -3.5832, 0, 0, -0.5, 0.5, 0.5,
-4.140531, -3.5832, 0, 1, -0.5, 0.5, 0.5,
-4.140531, -3.5832, 0, 1, 1.5, 0.5, 0.5,
-4.140531, -3.5832, 0, 0, 1.5, 0.5, 0.5,
-4.140531, -3.5832, 2, 0, -0.5, 0.5, 0.5,
-4.140531, -3.5832, 2, 1, -0.5, 0.5, 0.5,
-4.140531, -3.5832, 2, 1, 1.5, 0.5, 0.5,
-4.140531, -3.5832, 2, 0, 1.5, 0.5, 0.5,
-4.140531, -3.5832, 4, 0, -0.5, 0.5, 0.5,
-4.140531, -3.5832, 4, 1, -0.5, 0.5, 0.5,
-4.140531, -3.5832, 4, 1, 1.5, 0.5, 0.5,
-4.140531, -3.5832, 4, 0, 1.5, 0.5, 0.5
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
-3.628335, -3.123688, -5.535983,
-3.628335, 3.003136, -5.535983,
-3.628335, -3.123688, 5.353333,
-3.628335, 3.003136, 5.353333,
-3.628335, -3.123688, -5.535983,
-3.628335, -3.123688, 5.353333,
-3.628335, 3.003136, -5.535983,
-3.628335, 3.003136, 5.353333,
-3.628335, -3.123688, -5.535983,
3.200947, -3.123688, -5.535983,
-3.628335, -3.123688, 5.353333,
3.200947, -3.123688, 5.353333,
-3.628335, 3.003136, -5.535983,
3.200947, 3.003136, -5.535983,
-3.628335, 3.003136, 5.353333,
3.200947, 3.003136, 5.353333,
3.200947, -3.123688, -5.535983,
3.200947, 3.003136, -5.535983,
3.200947, -3.123688, 5.353333,
3.200947, 3.003136, 5.353333,
3.200947, -3.123688, -5.535983,
3.200947, -3.123688, 5.353333,
3.200947, 3.003136, -5.535983,
3.200947, 3.003136, 5.353333
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
var radius = 7.603446;
var distance = 33.82859;
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
mvMatrix.translate( 0.2136939, 0.06027615, 0.09132481 );
mvMatrix.scale( 1.203786, 1.341804, 0.7549597 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.82859);
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
dichlofluanid<-read.table("dichlofluanid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dichlofluanid$V2
```

```
## Error in eval(expr, envir, enclos): object 'dichlofluanid' not found
```

```r
y<-dichlofluanid$V3
```

```
## Error in eval(expr, envir, enclos): object 'dichlofluanid' not found
```

```r
z<-dichlofluanid$V4
```

```
## Error in eval(expr, envir, enclos): object 'dichlofluanid' not found
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
-3.528879, -1.509361, -2.160653, 0, 0, 1, 1, 1,
-3.167464, -1.220089, -1.567291, 1, 0, 0, 1, 1,
-3.011112, -0.678095, -1.867994, 1, 0, 0, 1, 1,
-3.009113, -1.454993, -3.302465, 1, 0, 0, 1, 1,
-2.931677, -0.4845045, -0.6565298, 1, 0, 0, 1, 1,
-2.712623, -3.034462, -1.824954, 1, 0, 0, 1, 1,
-2.669311, 0.8454952, -2.22035, 0, 0, 0, 1, 1,
-2.600563, 0.3344943, -2.981562, 0, 0, 0, 1, 1,
-2.559918, -0.4215203, -2.217226, 0, 0, 0, 1, 1,
-2.543075, -2.339418, -1.668734, 0, 0, 0, 1, 1,
-2.472721, -0.09176033, 0.3321801, 0, 0, 0, 1, 1,
-2.470541, 0.8097772, -0.2313427, 0, 0, 0, 1, 1,
-2.453226, 2.260834, -1.254076, 0, 0, 0, 1, 1,
-2.395072, -0.2548197, -1.248001, 1, 1, 1, 1, 1,
-2.290095, -0.2352222, 0.4808905, 1, 1, 1, 1, 1,
-2.274855, 0.4661566, 1.189559, 1, 1, 1, 1, 1,
-2.222856, 0.6708772, 0.2274826, 1, 1, 1, 1, 1,
-2.196547, -0.5060504, -2.911954, 1, 1, 1, 1, 1,
-2.147239, -0.05277236, -2.436821, 1, 1, 1, 1, 1,
-2.122427, 0.5073479, -2.036089, 1, 1, 1, 1, 1,
-2.112986, 2.562891, -1.600523, 1, 1, 1, 1, 1,
-2.094959, -0.451498, -2.452776, 1, 1, 1, 1, 1,
-2.077286, -0.08135004, -2.123333, 1, 1, 1, 1, 1,
-2.027227, -1.498531, -0.3404831, 1, 1, 1, 1, 1,
-2.016745, -0.9564455, -1.697871, 1, 1, 1, 1, 1,
-2.010479, 0.5698337, -0.6905309, 1, 1, 1, 1, 1,
-1.955777, 1.003593, 0.213763, 1, 1, 1, 1, 1,
-1.954914, -0.7701973, -1.94374, 1, 1, 1, 1, 1,
-1.953898, -0.5580639, -2.617647, 0, 0, 1, 1, 1,
-1.944195, 0.7725192, -0.6201953, 1, 0, 0, 1, 1,
-1.918668, -0.4648288, -2.978354, 1, 0, 0, 1, 1,
-1.906258, 0.1396763, 0.3595785, 1, 0, 0, 1, 1,
-1.890125, -1.014304, -2.187057, 1, 0, 0, 1, 1,
-1.881161, -0.3251486, -3.775897, 1, 0, 0, 1, 1,
-1.868939, -0.7288553, -2.153135, 0, 0, 0, 1, 1,
-1.854951, -0.03325288, 0.200511, 0, 0, 0, 1, 1,
-1.847796, 1.408927, -0.5593771, 0, 0, 0, 1, 1,
-1.845581, 1.845175, -1.255031, 0, 0, 0, 1, 1,
-1.839656, -2.706433, -3.520711, 0, 0, 0, 1, 1,
-1.822925, 0.093915, -1.749698, 0, 0, 0, 1, 1,
-1.79935, -0.3121491, -1.88506, 0, 0, 0, 1, 1,
-1.791419, 0.1731626, -2.171681, 1, 1, 1, 1, 1,
-1.781591, 1.325412, -0.1797539, 1, 1, 1, 1, 1,
-1.780021, -0.5781813, -2.317737, 1, 1, 1, 1, 1,
-1.776978, 0.7120818, -1.182538, 1, 1, 1, 1, 1,
-1.775389, -0.9512348, -1.139996, 1, 1, 1, 1, 1,
-1.757522, -0.6234242, -1.906182, 1, 1, 1, 1, 1,
-1.752081, -0.9962058, -2.548531, 1, 1, 1, 1, 1,
-1.728614, 0.5885376, -0.559519, 1, 1, 1, 1, 1,
-1.717771, -1.081209, -1.917833, 1, 1, 1, 1, 1,
-1.6971, -0.02165185, -0.1243086, 1, 1, 1, 1, 1,
-1.681876, -0.5593086, -4.611899, 1, 1, 1, 1, 1,
-1.630282, 1.912667, -1.090548, 1, 1, 1, 1, 1,
-1.628583, -0.2993917, -1.518737, 1, 1, 1, 1, 1,
-1.601895, 1.726549, -2.207245, 1, 1, 1, 1, 1,
-1.589434, -1.361386, -0.7349054, 1, 1, 1, 1, 1,
-1.578359, -0.2393315, -2.950689, 0, 0, 1, 1, 1,
-1.573749, 0.6109728, -0.1430933, 1, 0, 0, 1, 1,
-1.567922, 0.3963191, -2.085585, 1, 0, 0, 1, 1,
-1.558215, -0.07967144, -1.522156, 1, 0, 0, 1, 1,
-1.536941, 0.1824592, -2.020857, 1, 0, 0, 1, 1,
-1.511444, -0.4146669, -3.182451, 1, 0, 0, 1, 1,
-1.511435, -0.7856776, -1.80232, 0, 0, 0, 1, 1,
-1.506402, 1.745032, 0.3780252, 0, 0, 0, 1, 1,
-1.503516, 0.8907197, 0.5377143, 0, 0, 0, 1, 1,
-1.49874, 0.6453321, 0.862674, 0, 0, 0, 1, 1,
-1.495318, -1.061721, -3.529988, 0, 0, 0, 1, 1,
-1.475156, 1.947107, -2.266132, 0, 0, 0, 1, 1,
-1.473591, 0.465493, -2.390517, 0, 0, 0, 1, 1,
-1.464149, 0.4041613, -2.934442, 1, 1, 1, 1, 1,
-1.462866, -1.629165, -3.428894, 1, 1, 1, 1, 1,
-1.462782, -0.9525306, -0.1401801, 1, 1, 1, 1, 1,
-1.447243, 1.591625, 1.227857, 1, 1, 1, 1, 1,
-1.425324, -0.6691771, -2.324882, 1, 1, 1, 1, 1,
-1.421558, -1.283465, -1.448502, 1, 1, 1, 1, 1,
-1.417711, -1.247126, -2.02493, 1, 1, 1, 1, 1,
-1.413489, 1.520464, -1.855174, 1, 1, 1, 1, 1,
-1.407592, -1.837106, -1.636156, 1, 1, 1, 1, 1,
-1.39237, -0.8560174, -1.144377, 1, 1, 1, 1, 1,
-1.392004, 0.1791552, -1.353588, 1, 1, 1, 1, 1,
-1.391026, 0.05186686, 0.04710959, 1, 1, 1, 1, 1,
-1.389152, 0.2190338, -2.904599, 1, 1, 1, 1, 1,
-1.388739, -2.056558, -1.335904, 1, 1, 1, 1, 1,
-1.386923, 0.1162346, -2.785244, 1, 1, 1, 1, 1,
-1.381991, -0.3208661, -1.092648, 0, 0, 1, 1, 1,
-1.379418, 0.6724187, -4.015388, 1, 0, 0, 1, 1,
-1.3756, -1.34016, -1.453024, 1, 0, 0, 1, 1,
-1.358437, -0.7538429, -0.8636901, 1, 0, 0, 1, 1,
-1.357761, 0.8813542, -1.147731, 1, 0, 0, 1, 1,
-1.349561, 0.1496993, -0.3012461, 1, 0, 0, 1, 1,
-1.273368, -1.74048, -3.40066, 0, 0, 0, 1, 1,
-1.273345, 1.026237, -0.711682, 0, 0, 0, 1, 1,
-1.271497, 0.5411521, -0.4533059, 0, 0, 0, 1, 1,
-1.26862, 0.3910342, 0.3349216, 0, 0, 0, 1, 1,
-1.267674, -0.2136335, -2.044492, 0, 0, 0, 1, 1,
-1.265824, -0.6901061, -2.79612, 0, 0, 0, 1, 1,
-1.256756, -0.06094589, -0.3570343, 0, 0, 0, 1, 1,
-1.249588, 0.4059654, 0.418267, 1, 1, 1, 1, 1,
-1.236893, 0.1961542, -0.4106061, 1, 1, 1, 1, 1,
-1.230742, 0.683799, -0.0426396, 1, 1, 1, 1, 1,
-1.228394, -0.319969, -2.017616, 1, 1, 1, 1, 1,
-1.223741, -0.4356242, -1.843562, 1, 1, 1, 1, 1,
-1.218363, -1.225156, -2.467985, 1, 1, 1, 1, 1,
-1.2157, -0.4274389, 0.2432386, 1, 1, 1, 1, 1,
-1.215076, 0.6396331, -1.116342, 1, 1, 1, 1, 1,
-1.212991, -1.424701, -1.768022, 1, 1, 1, 1, 1,
-1.20219, 0.5147198, -1.818122, 1, 1, 1, 1, 1,
-1.201651, -0.7025718, -4.823519, 1, 1, 1, 1, 1,
-1.200967, -0.6879451, -3.457188, 1, 1, 1, 1, 1,
-1.196479, -0.4049926, -1.712472, 1, 1, 1, 1, 1,
-1.195624, 0.2333082, -0.3287848, 1, 1, 1, 1, 1,
-1.194635, 1.103648, -3.226795, 1, 1, 1, 1, 1,
-1.189028, -0.04132383, -0.7440826, 0, 0, 1, 1, 1,
-1.18885, 1.097512, -2.988917, 1, 0, 0, 1, 1,
-1.186306, 1.853529, 1.658084, 1, 0, 0, 1, 1,
-1.177322, -0.5857948, -0.8072257, 1, 0, 0, 1, 1,
-1.175392, -0.8146285, -0.9811215, 1, 0, 0, 1, 1,
-1.175133, 1.312979, -2.476001, 1, 0, 0, 1, 1,
-1.16545, 0.192331, -2.626831, 0, 0, 0, 1, 1,
-1.160906, 1.973943, -1.07853, 0, 0, 0, 1, 1,
-1.155315, 0.6096916, 0.2054077, 0, 0, 0, 1, 1,
-1.155154, 1.537098, -0.8704715, 0, 0, 0, 1, 1,
-1.149831, 2.009013, -0.296444, 0, 0, 0, 1, 1,
-1.149416, -0.5855389, -0.8632199, 0, 0, 0, 1, 1,
-1.141438, -0.217212, -3.529491, 0, 0, 0, 1, 1,
-1.141342, -0.2816221, -0.749192, 1, 1, 1, 1, 1,
-1.13908, 0.3106152, -1.783627, 1, 1, 1, 1, 1,
-1.135161, 0.5833404, 0.5025887, 1, 1, 1, 1, 1,
-1.129439, -1.519178, -1.27247, 1, 1, 1, 1, 1,
-1.129164, -1.028853, -3.482141, 1, 1, 1, 1, 1,
-1.127743, -0.001528171, -0.6202307, 1, 1, 1, 1, 1,
-1.127701, 0.9260117, -1.310103, 1, 1, 1, 1, 1,
-1.12115, -0.3888016, -1.561024, 1, 1, 1, 1, 1,
-1.113328, 0.5972678, -2.998861, 1, 1, 1, 1, 1,
-1.105732, -0.2840336, -5.3774, 1, 1, 1, 1, 1,
-1.104673, -0.1293118, -1.567202, 1, 1, 1, 1, 1,
-1.10332, 1.113007, 1.927506, 1, 1, 1, 1, 1,
-1.098185, 0.8531215, -1.504121, 1, 1, 1, 1, 1,
-1.096839, 0.006884947, -2.173825, 1, 1, 1, 1, 1,
-1.09442, -0.1566124, -2.706383, 1, 1, 1, 1, 1,
-1.084524, 1.114589, 0.4776062, 0, 0, 1, 1, 1,
-1.08103, -0.9814462, -2.928325, 1, 0, 0, 1, 1,
-1.081018, 0.1141311, -0.7171454, 1, 0, 0, 1, 1,
-1.073096, -0.5306287, -2.156717, 1, 0, 0, 1, 1,
-1.065194, 2.223851, 0.2154052, 1, 0, 0, 1, 1,
-1.057249, 0.3698858, -2.470613, 1, 0, 0, 1, 1,
-1.05425, -1.988662, -1.607247, 0, 0, 0, 1, 1,
-1.053428, -0.6847209, -0.8380371, 0, 0, 0, 1, 1,
-1.049584, 0.2604946, -1.083443, 0, 0, 0, 1, 1,
-1.042293, -0.924949, -2.776149, 0, 0, 0, 1, 1,
-1.039914, -1.567064, -4.287687, 0, 0, 0, 1, 1,
-1.039159, 1.265165, 0.328153, 0, 0, 0, 1, 1,
-1.031183, 1.132905, -2.251428, 0, 0, 0, 1, 1,
-1.02502, -1.396687, -2.584517, 1, 1, 1, 1, 1,
-1.017838, 1.168101, 0.7811304, 1, 1, 1, 1, 1,
-1.009656, 0.2001248, -1.3924, 1, 1, 1, 1, 1,
-1.001603, -1.012433, -1.968675, 1, 1, 1, 1, 1,
-1.00136, -1.372514, -2.012131, 1, 1, 1, 1, 1,
-0.9977997, 0.5512862, -1.688246, 1, 1, 1, 1, 1,
-0.9941646, 0.8234448, -0.8490369, 1, 1, 1, 1, 1,
-0.9937609, 0.5963237, 0.1038573, 1, 1, 1, 1, 1,
-0.9905224, 0.09037848, -2.91429, 1, 1, 1, 1, 1,
-0.9904023, 1.054459, -1.692252, 1, 1, 1, 1, 1,
-0.9899592, 0.1600649, -1.246906, 1, 1, 1, 1, 1,
-0.9850366, -1.812909, -2.56576, 1, 1, 1, 1, 1,
-0.9838377, 1.015831, -0.9331008, 1, 1, 1, 1, 1,
-0.9806852, 0.4076114, 0.8246067, 1, 1, 1, 1, 1,
-0.9705061, 0.1434771, 0.08659066, 1, 1, 1, 1, 1,
-0.9608235, -1.161079, -2.956376, 0, 0, 1, 1, 1,
-0.9447229, -1.929436, -2.453756, 1, 0, 0, 1, 1,
-0.9409421, 0.1707201, -0.4853007, 1, 0, 0, 1, 1,
-0.9403547, -1.650392, -1.59288, 1, 0, 0, 1, 1,
-0.9347827, -1.133485, -0.5192566, 1, 0, 0, 1, 1,
-0.9333233, 0.1765753, -1.443975, 1, 0, 0, 1, 1,
-0.9321229, -0.1535322, -1.707941, 0, 0, 0, 1, 1,
-0.9319568, -1.037493, -2.381978, 0, 0, 0, 1, 1,
-0.9317402, -0.4773922, -0.999082, 0, 0, 0, 1, 1,
-0.9305052, -0.7708861, -1.544344, 0, 0, 0, 1, 1,
-0.9241992, -0.6215045, -4.302044, 0, 0, 0, 1, 1,
-0.9135972, -0.1363577, -3.519513, 0, 0, 0, 1, 1,
-0.9129951, -0.06861676, -1.375961, 0, 0, 0, 1, 1,
-0.9012309, -0.5355749, -1.006581, 1, 1, 1, 1, 1,
-0.9002107, -1.185688, -2.633117, 1, 1, 1, 1, 1,
-0.8983037, 1.505559, -0.2969618, 1, 1, 1, 1, 1,
-0.8951093, 0.8960065, 0.05609299, 1, 1, 1, 1, 1,
-0.8942965, 0.2526314, -1.150019, 1, 1, 1, 1, 1,
-0.8941034, -0.1951975, -0.5975591, 1, 1, 1, 1, 1,
-0.8911789, -0.4085588, -4.000923, 1, 1, 1, 1, 1,
-0.8827443, 2.624422, -0.7436187, 1, 1, 1, 1, 1,
-0.8782015, 0.5104701, 0.2523949, 1, 1, 1, 1, 1,
-0.8771734, -0.9691093, -2.639054, 1, 1, 1, 1, 1,
-0.875598, 0.3512699, -0.5788255, 1, 1, 1, 1, 1,
-0.8651218, -0.0522061, -2.504674, 1, 1, 1, 1, 1,
-0.8616377, -0.5189202, -1.125555, 1, 1, 1, 1, 1,
-0.8573025, -1.338035, -2.459132, 1, 1, 1, 1, 1,
-0.8492832, 0.07942856, -1.900551, 1, 1, 1, 1, 1,
-0.8427838, -1.848164, -0.6336064, 0, 0, 1, 1, 1,
-0.8389856, 1.715993, -0.407347, 1, 0, 0, 1, 1,
-0.8348332, 0.1807985, -3.225413, 1, 0, 0, 1, 1,
-0.8322562, 0.2184537, -0.0526956, 1, 0, 0, 1, 1,
-0.8318262, -0.1273254, -2.092732, 1, 0, 0, 1, 1,
-0.8267142, -0.3707799, -1.938775, 1, 0, 0, 1, 1,
-0.8209391, -0.64863, -2.58538, 0, 0, 0, 1, 1,
-0.8181012, 0.1981037, -1.797877, 0, 0, 0, 1, 1,
-0.8128519, -2.103976, -2.530806, 0, 0, 0, 1, 1,
-0.8127626, -1.267652, -4.962773, 0, 0, 0, 1, 1,
-0.8091792, -0.2255779, -3.156862, 0, 0, 0, 1, 1,
-0.809001, -1.455788, -2.431082, 0, 0, 0, 1, 1,
-0.8066814, -0.1306917, -1.996451, 0, 0, 0, 1, 1,
-0.7950157, -0.6637586, -1.689888, 1, 1, 1, 1, 1,
-0.7914413, -0.3393722, -2.119687, 1, 1, 1, 1, 1,
-0.786612, 0.4856251, -1.031265, 1, 1, 1, 1, 1,
-0.7852181, -0.908409, -2.238909, 1, 1, 1, 1, 1,
-0.7792346, 0.1415834, -1.972256, 1, 1, 1, 1, 1,
-0.7792327, 0.9264309, -1.846317, 1, 1, 1, 1, 1,
-0.7710122, -0.9780031, -0.6168448, 1, 1, 1, 1, 1,
-0.7600762, 1.542756, -0.6721249, 1, 1, 1, 1, 1,
-0.7567098, -0.2783123, -2.04831, 1, 1, 1, 1, 1,
-0.7507712, 0.2280871, -0.8690633, 1, 1, 1, 1, 1,
-0.7492118, 0.1287755, -2.670107, 1, 1, 1, 1, 1,
-0.7491636, 0.9133431, 0.8993683, 1, 1, 1, 1, 1,
-0.747336, -0.03141014, -1.325698, 1, 1, 1, 1, 1,
-0.7468526, -0.5155054, -4.057743, 1, 1, 1, 1, 1,
-0.7454085, 1.487392, 0.3725125, 1, 1, 1, 1, 1,
-0.7260666, 0.1121392, -1.450143, 0, 0, 1, 1, 1,
-0.7206998, 0.3247214, -0.1703538, 1, 0, 0, 1, 1,
-0.7191122, -0.3165059, -2.515112, 1, 0, 0, 1, 1,
-0.714065, 0.2433702, -0.4338332, 1, 0, 0, 1, 1,
-0.7129157, 0.3999127, 0.6204754, 1, 0, 0, 1, 1,
-0.6994432, 0.251971, -0.7748076, 1, 0, 0, 1, 1,
-0.6920376, 0.640575, -0.2232725, 0, 0, 0, 1, 1,
-0.6907911, -0.08255961, -1.049854, 0, 0, 0, 1, 1,
-0.6862013, -0.04877056, -3.011353, 0, 0, 0, 1, 1,
-0.6778099, 1.053243, 0.5424194, 0, 0, 0, 1, 1,
-0.6726477, 1.567068, -0.7138773, 0, 0, 0, 1, 1,
-0.6546388, 1.018417, -0.4603125, 0, 0, 0, 1, 1,
-0.6501268, 1.778428, -1.671134, 0, 0, 0, 1, 1,
-0.6493761, 0.5511226, -2.270634, 1, 1, 1, 1, 1,
-0.6478885, 0.9525154, -1.33992, 1, 1, 1, 1, 1,
-0.644949, -0.4222326, -4.041577, 1, 1, 1, 1, 1,
-0.6437787, 2.402814, -0.003314714, 1, 1, 1, 1, 1,
-0.6423658, -0.06323537, -0.3438975, 1, 1, 1, 1, 1,
-0.6415149, -1.581184, -3.437945, 1, 1, 1, 1, 1,
-0.6393125, 0.30142, 0.3936999, 1, 1, 1, 1, 1,
-0.6374551, -0.6080707, -1.172158, 1, 1, 1, 1, 1,
-0.6356912, 1.311609, -1.650897, 1, 1, 1, 1, 1,
-0.6310036, -0.06089098, -2.786356, 1, 1, 1, 1, 1,
-0.6306627, -0.6000919, -2.227814, 1, 1, 1, 1, 1,
-0.6287651, -0.3214387, -3.225658, 1, 1, 1, 1, 1,
-0.6268165, 0.1504428, -0.75239, 1, 1, 1, 1, 1,
-0.6238668, -1.73384, -3.016524, 1, 1, 1, 1, 1,
-0.6205253, 0.6359586, -2.604848, 1, 1, 1, 1, 1,
-0.6175509, -0.4222594, -1.649412, 0, 0, 1, 1, 1,
-0.6154317, -1.071814, -0.9584451, 1, 0, 0, 1, 1,
-0.6132051, 0.9675565, -0.2629268, 1, 0, 0, 1, 1,
-0.6127051, -1.719078, -2.806374, 1, 0, 0, 1, 1,
-0.6119573, 1.36252, -1.892961, 1, 0, 0, 1, 1,
-0.6099119, 0.4434189, -0.08173802, 1, 0, 0, 1, 1,
-0.5855375, -0.5916215, -1.243835, 0, 0, 0, 1, 1,
-0.5835464, 2.529915, -0.9254825, 0, 0, 0, 1, 1,
-0.5768129, -1.250904, -2.879457, 0, 0, 0, 1, 1,
-0.5759094, -1.886174, -5.005342, 0, 0, 0, 1, 1,
-0.5668052, -0.547647, -3.047193, 0, 0, 0, 1, 1,
-0.5651922, 1.4161, 0.6301312, 0, 0, 0, 1, 1,
-0.5617281, -0.04517759, -2.881786, 0, 0, 0, 1, 1,
-0.561119, -0.04188852, -0.5068156, 1, 1, 1, 1, 1,
-0.5601453, -0.3617142, -2.76805, 1, 1, 1, 1, 1,
-0.5584051, -0.2375118, -1.716754, 1, 1, 1, 1, 1,
-0.5538722, 2.794635, 0.6737083, 1, 1, 1, 1, 1,
-0.5480325, -1.454005, -2.574655, 1, 1, 1, 1, 1,
-0.5423962, -1.94623, -3.229387, 1, 1, 1, 1, 1,
-0.5417963, -0.9837036, -3.080212, 1, 1, 1, 1, 1,
-0.5415146, -1.063681, -2.062384, 1, 1, 1, 1, 1,
-0.538083, -1.063038, -3.788034, 1, 1, 1, 1, 1,
-0.5323976, -0.1096467, -1.13205, 1, 1, 1, 1, 1,
-0.5230133, -0.8914499, -1.198141, 1, 1, 1, 1, 1,
-0.5226502, 0.3889413, -1.973955, 1, 1, 1, 1, 1,
-0.5198359, 0.8457403, -1.767547, 1, 1, 1, 1, 1,
-0.5159613, 1.522921, 0.5028164, 1, 1, 1, 1, 1,
-0.5082598, -0.7803055, -1.648079, 1, 1, 1, 1, 1,
-0.5059124, -0.07871463, -2.99188, 0, 0, 1, 1, 1,
-0.5052552, 1.616127, -1.342608, 1, 0, 0, 1, 1,
-0.5050541, -1.002161, -3.634719, 1, 0, 0, 1, 1,
-0.5045776, -0.358916, -1.27421, 1, 0, 0, 1, 1,
-0.5027815, -0.1938883, -2.318244, 1, 0, 0, 1, 1,
-0.5015834, -0.9914454, -3.791066, 1, 0, 0, 1, 1,
-0.4997003, 1.479839, -0.8010815, 0, 0, 0, 1, 1,
-0.4962762, 0.9142671, -0.4671398, 0, 0, 0, 1, 1,
-0.4942921, -0.5447047, -1.304747, 0, 0, 0, 1, 1,
-0.4896103, 0.03937229, -1.907637, 0, 0, 0, 1, 1,
-0.4872776, -1.420138, -1.956397, 0, 0, 0, 1, 1,
-0.485365, 0.3201528, -0.6590273, 0, 0, 0, 1, 1,
-0.4815032, 0.01136284, -2.373663, 0, 0, 0, 1, 1,
-0.4791458, -0.1518348, -2.547254, 1, 1, 1, 1, 1,
-0.4752265, 0.7583268, -0.4184657, 1, 1, 1, 1, 1,
-0.4752169, -0.1748473, -1.958638, 1, 1, 1, 1, 1,
-0.4721992, 1.255961, 0.2523663, 1, 1, 1, 1, 1,
-0.4702604, -0.004654972, -2.398814, 1, 1, 1, 1, 1,
-0.4687276, -0.6704587, -1.766287, 1, 1, 1, 1, 1,
-0.4676052, -0.4797002, -0.8565636, 1, 1, 1, 1, 1,
-0.4667311, -0.2171764, -4.937543, 1, 1, 1, 1, 1,
-0.4641915, -1.696748, -2.530892, 1, 1, 1, 1, 1,
-0.4585057, 1.891792, -2.288166, 1, 1, 1, 1, 1,
-0.4547346, -0.02708275, -1.377592, 1, 1, 1, 1, 1,
-0.4536617, 0.1095001, -0.6270015, 1, 1, 1, 1, 1,
-0.4425137, 0.4016317, -0.02905557, 1, 1, 1, 1, 1,
-0.4316751, -0.8164398, -3.287879, 1, 1, 1, 1, 1,
-0.4288659, -1.449304, -4.704708, 1, 1, 1, 1, 1,
-0.4198359, 0.3057852, -0.05931682, 0, 0, 1, 1, 1,
-0.4169945, 0.9765821, -1.503224, 1, 0, 0, 1, 1,
-0.416915, 0.5852395, -1.183007, 1, 0, 0, 1, 1,
-0.412458, 0.5458666, -1.542232, 1, 0, 0, 1, 1,
-0.4115242, -0.6622867, -2.922369, 1, 0, 0, 1, 1,
-0.4107493, -0.1592326, -2.772261, 1, 0, 0, 1, 1,
-0.4106024, -1.212811, -2.463002, 0, 0, 0, 1, 1,
-0.4096438, -0.1546709, -2.922223, 0, 0, 0, 1, 1,
-0.4050174, -1.751971, -3.157338, 0, 0, 0, 1, 1,
-0.4044488, 2.090754, -0.02595089, 0, 0, 0, 1, 1,
-0.4030722, -1.05365, -1.75304, 0, 0, 0, 1, 1,
-0.4007595, 1.025601, -2.301459, 0, 0, 0, 1, 1,
-0.3961069, 0.7423239, -0.6504335, 0, 0, 0, 1, 1,
-0.3960214, -1.586663, -2.595655, 1, 1, 1, 1, 1,
-0.3955812, 0.629766, -2.825199, 1, 1, 1, 1, 1,
-0.3936333, 0.7048474, -1.746686, 1, 1, 1, 1, 1,
-0.3925843, -1.318874, -2.516764, 1, 1, 1, 1, 1,
-0.3870836, 1.359095, -0.2379527, 1, 1, 1, 1, 1,
-0.382088, 0.6064348, -1.056801, 1, 1, 1, 1, 1,
-0.3786666, -0.7722761, -2.247264, 1, 1, 1, 1, 1,
-0.3782773, -1.214658, -3.496535, 1, 1, 1, 1, 1,
-0.3781806, 0.2192288, 0.3118093, 1, 1, 1, 1, 1,
-0.3777625, -0.25468, -1.35072, 1, 1, 1, 1, 1,
-0.3747229, 2.458521, 0.2138354, 1, 1, 1, 1, 1,
-0.3737888, -1.722589, -1.849741, 1, 1, 1, 1, 1,
-0.3728283, -0.09076883, -2.708769, 1, 1, 1, 1, 1,
-0.3684752, -0.1462677, -1.688251, 1, 1, 1, 1, 1,
-0.3655536, -0.007539377, -0.9524618, 1, 1, 1, 1, 1,
-0.36327, 0.9965737, -1.917886, 0, 0, 1, 1, 1,
-0.3587878, 1.416941, 0.9040133, 1, 0, 0, 1, 1,
-0.3583118, -0.6372018, -1.798397, 1, 0, 0, 1, 1,
-0.356609, -0.2120414, 0.2096345, 1, 0, 0, 1, 1,
-0.3507999, 2.676149, -0.5550617, 1, 0, 0, 1, 1,
-0.3466623, 0.7930722, -0.9203174, 1, 0, 0, 1, 1,
-0.3458229, 0.391257, -0.9752282, 0, 0, 0, 1, 1,
-0.3455476, -0.4911305, -2.948947, 0, 0, 0, 1, 1,
-0.3423033, -0.9544058, -2.240571, 0, 0, 0, 1, 1,
-0.3416727, -0.4960499, -3.694258, 0, 0, 0, 1, 1,
-0.3394866, -0.9280659, -2.692366, 0, 0, 0, 1, 1,
-0.3372977, 0.3304436, -1.511636, 0, 0, 0, 1, 1,
-0.3332796, 0.2686293, -2.173318, 0, 0, 0, 1, 1,
-0.3326809, 0.5870609, -0.4473304, 1, 1, 1, 1, 1,
-0.3309062, -0.07100558, -0.3881518, 1, 1, 1, 1, 1,
-0.3280213, -0.1543257, -1.873432, 1, 1, 1, 1, 1,
-0.3235972, -0.1134194, -1.038763, 1, 1, 1, 1, 1,
-0.3221419, -1.132112, -1.707868, 1, 1, 1, 1, 1,
-0.3174077, -0.6816204, -3.189448, 1, 1, 1, 1, 1,
-0.3118365, 0.1974368, -1.160603, 1, 1, 1, 1, 1,
-0.3049575, -0.6170375, -1.733234, 1, 1, 1, 1, 1,
-0.3024535, 1.241113, 1.315035, 1, 1, 1, 1, 1,
-0.298871, 0.3795972, 1.319977, 1, 1, 1, 1, 1,
-0.2974853, 0.5639454, -1.094958, 1, 1, 1, 1, 1,
-0.2945997, -0.6899213, -0.8854001, 1, 1, 1, 1, 1,
-0.2942914, -0.7199453, -2.47976, 1, 1, 1, 1, 1,
-0.293943, 0.9841847, 1.196715, 1, 1, 1, 1, 1,
-0.2881957, -0.7169983, -2.390244, 1, 1, 1, 1, 1,
-0.2842857, -2.391999, -4.649921, 0, 0, 1, 1, 1,
-0.2831644, -2.766817, -3.844383, 1, 0, 0, 1, 1,
-0.2810382, -2.182129, -1.795753, 1, 0, 0, 1, 1,
-0.2781762, -0.4023192, -1.224368, 1, 0, 0, 1, 1,
-0.2733256, -0.8357189, -4.074862, 1, 0, 0, 1, 1,
-0.2706169, -0.5989996, -1.995077, 1, 0, 0, 1, 1,
-0.2690346, 0.5531126, -1.418855, 0, 0, 0, 1, 1,
-0.267511, 0.07953402, -0.6483222, 0, 0, 0, 1, 1,
-0.2643123, -0.05382188, -2.809767, 0, 0, 0, 1, 1,
-0.2628523, -0.4871065, -1.990254, 0, 0, 0, 1, 1,
-0.2584468, -1.378397, -2.039083, 0, 0, 0, 1, 1,
-0.2577464, 0.3055077, -2.510338, 0, 0, 0, 1, 1,
-0.2522307, 0.4883247, -2.320984, 0, 0, 0, 1, 1,
-0.2504884, -0.1941816, -0.4430759, 1, 1, 1, 1, 1,
-0.2503601, -0.08181208, -4.272642, 1, 1, 1, 1, 1,
-0.2490655, -0.8201025, -2.290783, 1, 1, 1, 1, 1,
-0.2476012, -0.1336603, -1.56159, 1, 1, 1, 1, 1,
-0.2472525, -2.239407, -4.059223, 1, 1, 1, 1, 1,
-0.2450593, -1.952694, -2.499171, 1, 1, 1, 1, 1,
-0.2443857, -0.8935726, -2.495057, 1, 1, 1, 1, 1,
-0.2433086, 0.6241509, 1.661778, 1, 1, 1, 1, 1,
-0.2416431, 0.4183378, -0.4273829, 1, 1, 1, 1, 1,
-0.2414096, -1.25168, -3.377264, 1, 1, 1, 1, 1,
-0.2413967, 1.046298, -0.1334818, 1, 1, 1, 1, 1,
-0.2400082, -0.1504659, -2.360765, 1, 1, 1, 1, 1,
-0.2398128, 0.129232, 0.1141455, 1, 1, 1, 1, 1,
-0.2318916, 1.180754, 0.1819673, 1, 1, 1, 1, 1,
-0.2300433, -1.823146, -2.192293, 1, 1, 1, 1, 1,
-0.2273266, -0.567014, -1.178621, 0, 0, 1, 1, 1,
-0.21793, 0.2641719, -1.469307, 1, 0, 0, 1, 1,
-0.2170318, 0.2988028, -1.912742, 1, 0, 0, 1, 1,
-0.2137617, 0.9369462, -1.048677, 1, 0, 0, 1, 1,
-0.2018185, 1.213713, -0.729708, 1, 0, 0, 1, 1,
-0.2014695, 1.115904, 0.3148681, 1, 0, 0, 1, 1,
-0.1998571, -0.8759481, -2.743384, 0, 0, 0, 1, 1,
-0.1955628, -0.5734465, -1.831533, 0, 0, 0, 1, 1,
-0.1836224, -0.1767908, -1.837723, 0, 0, 0, 1, 1,
-0.1797978, 1.107975, 0.4022674, 0, 0, 0, 1, 1,
-0.1786873, -0.4049618, -2.198995, 0, 0, 0, 1, 1,
-0.1748665, -0.7489321, -2.072731, 0, 0, 0, 1, 1,
-0.1729967, 1.304528, 0.3374416, 0, 0, 0, 1, 1,
-0.1697006, -0.5773867, -2.651867, 1, 1, 1, 1, 1,
-0.1688603, -1.793016, -3.219799, 1, 1, 1, 1, 1,
-0.1678669, -0.1698418, -2.877477, 1, 1, 1, 1, 1,
-0.1656418, -0.05005929, -1.506486, 1, 1, 1, 1, 1,
-0.1647715, -1.741849, -2.727211, 1, 1, 1, 1, 1,
-0.1633074, 0.8130181, 0.6100022, 1, 1, 1, 1, 1,
-0.1567524, 0.6050958, -0.4636042, 1, 1, 1, 1, 1,
-0.1555309, 0.5146149, -1.082543, 1, 1, 1, 1, 1,
-0.1504035, 2.647354, -1.25528, 1, 1, 1, 1, 1,
-0.1473245, -1.097486, -4.128597, 1, 1, 1, 1, 1,
-0.1416956, -1.508414, -3.369638, 1, 1, 1, 1, 1,
-0.1416941, 1.032386, -0.978606, 1, 1, 1, 1, 1,
-0.1407142, -2.783162, -3.24062, 1, 1, 1, 1, 1,
-0.1351575, -0.3369699, -2.483269, 1, 1, 1, 1, 1,
-0.1330833, 1.605074, 0.3160854, 1, 1, 1, 1, 1,
-0.1327902, 0.4093901, -0.8881254, 0, 0, 1, 1, 1,
-0.1320608, -1.227108, -1.47861, 1, 0, 0, 1, 1,
-0.1294953, 0.6114886, -1.773905, 1, 0, 0, 1, 1,
-0.1284747, -0.1392555, -0.7127215, 1, 0, 0, 1, 1,
-0.1266416, 1.1563, -1.734625, 1, 0, 0, 1, 1,
-0.1250409, -2.093808, -3.33221, 1, 0, 0, 1, 1,
-0.1247157, 0.7251279, -1.379943, 0, 0, 0, 1, 1,
-0.1236275, 0.3688046, 0.2972576, 0, 0, 0, 1, 1,
-0.1228921, 0.6333339, -0.7689093, 0, 0, 0, 1, 1,
-0.1206447, 0.5165619, 0.6606438, 0, 0, 0, 1, 1,
-0.1131289, 0.1904256, -0.5272933, 0, 0, 0, 1, 1,
-0.1124138, 0.5243151, -1.126237, 0, 0, 0, 1, 1,
-0.1115193, 0.6882918, 0.9078268, 0, 0, 0, 1, 1,
-0.1113232, -0.1853994, -2.156662, 1, 1, 1, 1, 1,
-0.1100313, 0.1709691, -0.1118908, 1, 1, 1, 1, 1,
-0.108523, -0.795414, -2.998778, 1, 1, 1, 1, 1,
-0.1044689, -0.3084541, -4.507726, 1, 1, 1, 1, 1,
-0.1020509, 1.672765, -1.287063, 1, 1, 1, 1, 1,
-0.1012544, -0.5656301, -4.92102, 1, 1, 1, 1, 1,
-0.09901978, -0.9386775, -3.596986, 1, 1, 1, 1, 1,
-0.09799957, 0.330001, 0.2559852, 1, 1, 1, 1, 1,
-0.08998934, 0.649157, -0.7085678, 1, 1, 1, 1, 1,
-0.08699515, 0.05655014, -1.424209, 1, 1, 1, 1, 1,
-0.0869651, -0.3485105, -3.144012, 1, 1, 1, 1, 1,
-0.08399843, 0.2418892, 0.5644131, 1, 1, 1, 1, 1,
-0.075788, 0.2533223, -0.6506094, 1, 1, 1, 1, 1,
-0.06914724, -0.1251657, -1.77933, 1, 1, 1, 1, 1,
-0.06830113, 0.09883878, -0.4772, 1, 1, 1, 1, 1,
-0.06562407, -0.4052634, -1.886088, 0, 0, 1, 1, 1,
-0.06389858, -1.356059, -3.382425, 1, 0, 0, 1, 1,
-0.06280644, 2.011395, -2.855104, 1, 0, 0, 1, 1,
-0.05946476, 1.299524, -0.5645548, 1, 0, 0, 1, 1,
-0.0560413, 0.7872888, -0.7500016, 1, 0, 0, 1, 1,
-0.05524195, -0.2403639, -2.807609, 1, 0, 0, 1, 1,
-0.05058274, 0.305953, -0.8494201, 0, 0, 0, 1, 1,
-0.04303283, 0.5383345, 0.5559617, 0, 0, 0, 1, 1,
-0.04286012, 0.5648642, 0.04469547, 0, 0, 0, 1, 1,
-0.04256513, 0.5477561, 2.452919, 0, 0, 0, 1, 1,
-0.03958064, -0.3655992, -3.705477, 0, 0, 0, 1, 1,
-0.0394378, -0.4344014, -2.233326, 0, 0, 0, 1, 1,
-0.03472129, 0.4607244, -1.546496, 0, 0, 0, 1, 1,
-0.03320625, 0.2322782, 1.263494, 1, 1, 1, 1, 1,
-0.0286976, -0.1200184, -1.560425, 1, 1, 1, 1, 1,
-0.02324214, -0.7727746, -2.366878, 1, 1, 1, 1, 1,
-0.02244933, 2.054406, -0.3944777, 1, 1, 1, 1, 1,
-0.02202842, -0.1607956, -2.655497, 1, 1, 1, 1, 1,
-0.01973104, 0.5274995, 0.02985765, 1, 1, 1, 1, 1,
-0.01017307, 0.1265018, 0.3019182, 1, 1, 1, 1, 1,
-0.008226922, 0.3438001, 0.2235609, 1, 1, 1, 1, 1,
-0.008046861, -0.9843948, -5.107693, 1, 1, 1, 1, 1,
-0.007969961, -0.5531958, -2.208413, 1, 1, 1, 1, 1,
-0.004774803, 0.2913536, -1.039991, 1, 1, 1, 1, 1,
-0.00418139, 0.6568155, -0.4199359, 1, 1, 1, 1, 1,
-0.001212216, -0.737074, -2.894185, 1, 1, 1, 1, 1,
-0.001103581, 0.6754168, 1.081697, 1, 1, 1, 1, 1,
0.0004311679, -0.6104997, 1.595995, 1, 1, 1, 1, 1,
0.000938539, 0.9550844, -1.686406, 0, 0, 1, 1, 1,
0.001032098, -1.332503, 1.960785, 1, 0, 0, 1, 1,
0.005229926, -0.6621367, 3.44565, 1, 0, 0, 1, 1,
0.008154262, -0.5217259, 1.883809, 1, 0, 0, 1, 1,
0.01068445, -2.230458, 2.651191, 1, 0, 0, 1, 1,
0.01817456, -0.1549108, 2.997494, 1, 0, 0, 1, 1,
0.02063476, -1.091047, 1.93453, 0, 0, 0, 1, 1,
0.02085113, -2.35263, 2.998113, 0, 0, 0, 1, 1,
0.0227713, 0.003611751, 3.405919, 0, 0, 0, 1, 1,
0.0229123, 1.74457, -0.2870428, 0, 0, 0, 1, 1,
0.03155123, -0.6261184, 1.004784, 0, 0, 0, 1, 1,
0.03467565, -1.445994, 2.103458, 0, 0, 0, 1, 1,
0.03532048, -0.2729436, 3.069954, 0, 0, 0, 1, 1,
0.03649269, -0.395488, 1.44749, 1, 1, 1, 1, 1,
0.03731635, 0.4158444, 0.106589, 1, 1, 1, 1, 1,
0.03933039, -1.236739, 2.448241, 1, 1, 1, 1, 1,
0.04162575, -0.9910072, 2.331192, 1, 1, 1, 1, 1,
0.04879881, -1.181464, 4.593101, 1, 1, 1, 1, 1,
0.05342792, -0.8121135, 3.072623, 1, 1, 1, 1, 1,
0.05425081, 0.5124896, 0.6853272, 1, 1, 1, 1, 1,
0.05921842, 1.210074, -0.9048464, 1, 1, 1, 1, 1,
0.0615784, 2.059105, 1.284545, 1, 1, 1, 1, 1,
0.06166361, 0.9773427, -1.344804, 1, 1, 1, 1, 1,
0.0662716, 0.6639665, 0.02369632, 1, 1, 1, 1, 1,
0.066302, 0.9266727, -1.474273, 1, 1, 1, 1, 1,
0.07121487, 2.236995, 0.8695966, 1, 1, 1, 1, 1,
0.07795405, -2.013193, 1.920276, 1, 1, 1, 1, 1,
0.07840231, -1.626774, 3.721596, 1, 1, 1, 1, 1,
0.08222612, -0.9626138, 1.428016, 0, 0, 1, 1, 1,
0.0838263, 0.1904619, -0.7722895, 1, 0, 0, 1, 1,
0.08442187, 0.5357918, -0.09520254, 1, 0, 0, 1, 1,
0.08500393, 0.5914525, -0.1305481, 1, 0, 0, 1, 1,
0.08741509, -0.8795821, 2.626273, 1, 0, 0, 1, 1,
0.08967766, 0.7820281, -0.2390449, 1, 0, 0, 1, 1,
0.09010774, 0.3322037, -2.395057, 0, 0, 0, 1, 1,
0.09020131, -1.865063, 3.082867, 0, 0, 0, 1, 1,
0.09195781, 1.479549, -0.3617726, 0, 0, 0, 1, 1,
0.09365119, 1.306217, -0.7292207, 0, 0, 0, 1, 1,
0.09762802, 1.225863, 0.1792626, 0, 0, 0, 1, 1,
0.09770807, -2.158415, 1.398426, 0, 0, 0, 1, 1,
0.09823985, -1.751374, 0.7704241, 0, 0, 0, 1, 1,
0.09985665, -1.273134, 1.22961, 1, 1, 1, 1, 1,
0.1001768, 0.1613831, 1.171583, 1, 1, 1, 1, 1,
0.1017592, -0.438515, 4.377983, 1, 1, 1, 1, 1,
0.104036, 1.390613, 1.435565, 1, 1, 1, 1, 1,
0.1042803, 0.2788253, 0.4464783, 1, 1, 1, 1, 1,
0.1046561, -0.8108472, 1.075231, 1, 1, 1, 1, 1,
0.1067992, -0.177314, 0.9820456, 1, 1, 1, 1, 1,
0.1069573, 1.217582, 0.1385673, 1, 1, 1, 1, 1,
0.1078054, 0.5625076, -0.4789902, 1, 1, 1, 1, 1,
0.1120882, -2.534739, 4.478604, 1, 1, 1, 1, 1,
0.1124732, 0.1114086, 1.534325, 1, 1, 1, 1, 1,
0.1129306, 1.895715, 0.6838294, 1, 1, 1, 1, 1,
0.1191807, -0.1126928, 3.374925, 1, 1, 1, 1, 1,
0.1314559, -0.211549, 2.761646, 1, 1, 1, 1, 1,
0.1327949, 1.935771, 0.4531192, 1, 1, 1, 1, 1,
0.1361981, 2.45038, 0.7171981, 0, 0, 1, 1, 1,
0.1364523, -0.6826735, 3.140127, 1, 0, 0, 1, 1,
0.136687, 0.5307636, 1.48463, 1, 0, 0, 1, 1,
0.138861, -0.7373877, 3.83028, 1, 0, 0, 1, 1,
0.1407518, -0.2862486, 3.090121, 1, 0, 0, 1, 1,
0.1420765, 1.159878, -2.327782, 1, 0, 0, 1, 1,
0.148425, -0.2343587, 2.074951, 0, 0, 0, 1, 1,
0.1491521, 0.7187492, 1.530207, 0, 0, 0, 1, 1,
0.1498502, -0.4779991, 3.179398, 0, 0, 0, 1, 1,
0.1503159, 0.05866642, 1.419985, 0, 0, 0, 1, 1,
0.1520326, -2.428404, 3.123676, 0, 0, 0, 1, 1,
0.1629023, 1.247526, 0.9793594, 0, 0, 0, 1, 1,
0.1635401, 0.083373, 2.570214, 0, 0, 0, 1, 1,
0.1659722, 0.2634856, 0.2684985, 1, 1, 1, 1, 1,
0.1677236, 1.076793, 0.2752406, 1, 1, 1, 1, 1,
0.1741593, -1.543794, 4.662935, 1, 1, 1, 1, 1,
0.1758297, 2.230223, -0.2915936, 1, 1, 1, 1, 1,
0.1820249, 0.7815719, -0.02039955, 1, 1, 1, 1, 1,
0.1875588, 0.6886065, 1.06684, 1, 1, 1, 1, 1,
0.1878103, 0.2471348, 0.3477765, 1, 1, 1, 1, 1,
0.1910548, 2.23822, -1.126324, 1, 1, 1, 1, 1,
0.1924057, 1.339885, 0.9722572, 1, 1, 1, 1, 1,
0.1975667, 0.6543882, 0.4097852, 1, 1, 1, 1, 1,
0.1984267, -0.588051, 2.307347, 1, 1, 1, 1, 1,
0.1994288, -0.5397482, 2.042687, 1, 1, 1, 1, 1,
0.2045051, -1.267792, 2.557408, 1, 1, 1, 1, 1,
0.2047045, -0.8712925, 3.415349, 1, 1, 1, 1, 1,
0.2061056, 1.645956, -0.3638237, 1, 1, 1, 1, 1,
0.2095854, -0.8432342, 2.903915, 0, 0, 1, 1, 1,
0.2148196, -0.5159926, 2.688451, 1, 0, 0, 1, 1,
0.2164965, 0.4809862, 2.703812, 1, 0, 0, 1, 1,
0.2171399, 1.036655, 1.136332, 1, 0, 0, 1, 1,
0.2195027, 1.738632, -0.8647826, 1, 0, 0, 1, 1,
0.2210184, 1.645713, -0.5747054, 1, 0, 0, 1, 1,
0.2236452, -0.2037945, 1.564607, 0, 0, 0, 1, 1,
0.2245044, -0.1782413, 1.085975, 0, 0, 0, 1, 1,
0.2279012, 0.6186093, -0.5148806, 0, 0, 0, 1, 1,
0.2291427, 1.863072, 0.3917719, 0, 0, 0, 1, 1,
0.2294193, 0.8763744, 1.176816, 0, 0, 0, 1, 1,
0.2298103, 1.177674, 0.4125978, 0, 0, 0, 1, 1,
0.2325768, -0.5727246, 2.33592, 0, 0, 0, 1, 1,
0.2357658, 0.6579386, 0.3779765, 1, 1, 1, 1, 1,
0.237218, 1.257508, -0.143918, 1, 1, 1, 1, 1,
0.2380099, 0.4632294, 0.9869668, 1, 1, 1, 1, 1,
0.2407453, -1.115153, 3.427669, 1, 1, 1, 1, 1,
0.2419645, -0.1452636, 1.485029, 1, 1, 1, 1, 1,
0.2422055, 1.958346, -0.9797662, 1, 1, 1, 1, 1,
0.2439569, 0.2899015, 1.153327, 1, 1, 1, 1, 1,
0.2443255, -0.586126, 1.45237, 1, 1, 1, 1, 1,
0.2455062, 0.7923642, -0.0420666, 1, 1, 1, 1, 1,
0.2476172, -1.55321, 3.430633, 1, 1, 1, 1, 1,
0.2478538, -0.4970075, 2.236502, 1, 1, 1, 1, 1,
0.2518398, -0.4533219, 3.650188, 1, 1, 1, 1, 1,
0.2563005, 0.947322, 0.9769828, 1, 1, 1, 1, 1,
0.2588365, -0.7031546, 3.407829, 1, 1, 1, 1, 1,
0.2618715, -0.9190398, 4.503205, 1, 1, 1, 1, 1,
0.2664064, -0.184222, 2.148871, 0, 0, 1, 1, 1,
0.2698939, 1.641297, -1.248651, 1, 0, 0, 1, 1,
0.2703634, -0.2616162, 2.586486, 1, 0, 0, 1, 1,
0.2715434, 0.3010739, 0.3374127, 1, 0, 0, 1, 1,
0.2760191, 1.11874, 0.8102343, 1, 0, 0, 1, 1,
0.2784545, -1.601579, 2.425388, 1, 0, 0, 1, 1,
0.2798142, 0.2918307, 1.451505, 0, 0, 0, 1, 1,
0.2842112, -2.002629, 2.256438, 0, 0, 0, 1, 1,
0.2971838, -0.3783838, 3.351425, 0, 0, 0, 1, 1,
0.2975262, 0.7280979, 1.376944, 0, 0, 0, 1, 1,
0.2993344, -0.1922143, 0.7886266, 0, 0, 0, 1, 1,
0.3008272, 0.3458788, 1.979276, 0, 0, 0, 1, 1,
0.3017497, 2.729954, 0.3405656, 0, 0, 0, 1, 1,
0.3085511, 0.4344458, 0.8739454, 1, 1, 1, 1, 1,
0.3102253, -0.4686525, 3.411573, 1, 1, 1, 1, 1,
0.316621, 0.3106656, 0.6520765, 1, 1, 1, 1, 1,
0.3188119, -2.5451, 2.176655, 1, 1, 1, 1, 1,
0.319866, -0.1162939, 1.591828, 1, 1, 1, 1, 1,
0.3205709, -0.8799134, 3.411786, 1, 1, 1, 1, 1,
0.3250511, 1.107248, 0.3511076, 1, 1, 1, 1, 1,
0.3265774, 0.8038897, 0.3661303, 1, 1, 1, 1, 1,
0.3274553, -0.8639531, 2.053955, 1, 1, 1, 1, 1,
0.3285539, -0.4047723, 2.736253, 1, 1, 1, 1, 1,
0.3291349, 1.518074, -0.934765, 1, 1, 1, 1, 1,
0.3293337, 1.535674, -0.4630594, 1, 1, 1, 1, 1,
0.3381217, 0.5014365, 0.8709769, 1, 1, 1, 1, 1,
0.3431813, 0.3744883, 1.882881, 1, 1, 1, 1, 1,
0.3441313, 1.514777, -0.5890255, 1, 1, 1, 1, 1,
0.3453494, 0.4532965, 1.695085, 0, 0, 1, 1, 1,
0.3503301, 0.2708107, -0.5131727, 1, 0, 0, 1, 1,
0.353889, 0.69726, -0.483609, 1, 0, 0, 1, 1,
0.3547432, -0.629328, 1.984442, 1, 0, 0, 1, 1,
0.3576441, 0.6486027, -0.1925457, 1, 0, 0, 1, 1,
0.3614704, -0.4438878, 3.042744, 1, 0, 0, 1, 1,
0.3618417, -0.08913262, 2.077638, 0, 0, 0, 1, 1,
0.3619487, -0.3743311, 5.194751, 0, 0, 0, 1, 1,
0.3646986, -0.7580884, 4.02596, 0, 0, 0, 1, 1,
0.3647336, 0.1717402, 2.213106, 0, 0, 0, 1, 1,
0.364944, 2.619, 0.1832871, 0, 0, 0, 1, 1,
0.3714323, -0.1771101, 1.430107, 0, 0, 0, 1, 1,
0.3749562, -0.6299399, 2.331391, 0, 0, 0, 1, 1,
0.3769162, -0.9195695, 1.608889, 1, 1, 1, 1, 1,
0.379221, 0.07321186, 1.630518, 1, 1, 1, 1, 1,
0.3805028, -2.568286, 2.743668, 1, 1, 1, 1, 1,
0.3807291, -0.00812103, 1.173653, 1, 1, 1, 1, 1,
0.3829855, -0.009787233, 1.237393, 1, 1, 1, 1, 1,
0.3858225, 1.157698, -1.272354, 1, 1, 1, 1, 1,
0.3918918, 0.2980328, 1.018607, 1, 1, 1, 1, 1,
0.3919315, 0.5255148, 0.7198083, 1, 1, 1, 1, 1,
0.3935622, 0.6397188, 1.02394, 1, 1, 1, 1, 1,
0.3955303, 0.2169187, 0.991063, 1, 1, 1, 1, 1,
0.3962513, -0.351454, 4.117759, 1, 1, 1, 1, 1,
0.3967917, -1.170565, 3.526643, 1, 1, 1, 1, 1,
0.3977387, 0.2840549, 0.7754702, 1, 1, 1, 1, 1,
0.3990634, -1.491168, 3.242461, 1, 1, 1, 1, 1,
0.4028051, 2.91391, 0.9686835, 1, 1, 1, 1, 1,
0.4040724, 0.2613879, 1.252456, 0, 0, 1, 1, 1,
0.4084625, 0.6819115, 0.7835032, 1, 0, 0, 1, 1,
0.4099438, 0.1341576, 2.751408, 1, 0, 0, 1, 1,
0.4119146, -0.2687243, 3.327049, 1, 0, 0, 1, 1,
0.4123066, 2.293271, 0.9796364, 1, 0, 0, 1, 1,
0.4153121, -0.4075647, 1.02293, 1, 0, 0, 1, 1,
0.4176447, 0.05279474, 1.147941, 0, 0, 0, 1, 1,
0.4220937, 0.7417742, 0.307813, 0, 0, 0, 1, 1,
0.4254755, 0.5492325, 0.6620777, 0, 0, 0, 1, 1,
0.4282799, -0.4886858, 2.495739, 0, 0, 0, 1, 1,
0.4291324, 0.03385364, 3.183976, 0, 0, 0, 1, 1,
0.431545, 0.2828315, -0.4232939, 0, 0, 0, 1, 1,
0.432195, 0.3055455, -0.4701473, 0, 0, 0, 1, 1,
0.4395525, -0.9721256, 3.219435, 1, 1, 1, 1, 1,
0.4401901, 0.8352938, 0.4728503, 1, 1, 1, 1, 1,
0.4415655, -1.479889, 3.238673, 1, 1, 1, 1, 1,
0.4464914, 0.5551118, -0.4120766, 1, 1, 1, 1, 1,
0.4480577, 0.4976696, 0.6755068, 1, 1, 1, 1, 1,
0.4524165, 1.496532, 2.937022, 1, 1, 1, 1, 1,
0.4545248, 0.2669022, -0.6911497, 1, 1, 1, 1, 1,
0.4549369, 1.163037, 1.632762, 1, 1, 1, 1, 1,
0.4590649, 1.462556, 1.206968, 1, 1, 1, 1, 1,
0.4601432, 0.7788012, 2.181873, 1, 1, 1, 1, 1,
0.4607094, 1.076251, -0.2863446, 1, 1, 1, 1, 1,
0.4628085, 0.3057594, 0.4529404, 1, 1, 1, 1, 1,
0.4635483, 0.6668185, 2.246613, 1, 1, 1, 1, 1,
0.4678482, -0.01184992, 1.21487, 1, 1, 1, 1, 1,
0.4693609, 0.1192442, 1.741295, 1, 1, 1, 1, 1,
0.4743035, 0.7770006, 0.1185748, 0, 0, 1, 1, 1,
0.476776, -0.8805956, 2.102023, 1, 0, 0, 1, 1,
0.4777661, -1.117316, 3.690951, 1, 0, 0, 1, 1,
0.478253, 0.6228211, 0.3632474, 1, 0, 0, 1, 1,
0.4827003, -0.4913428, 3.738893, 1, 0, 0, 1, 1,
0.4873891, 0.47822, -0.5138743, 1, 0, 0, 1, 1,
0.4901913, -0.4212591, 3.190346, 0, 0, 0, 1, 1,
0.4954919, 0.2677233, 2.756237, 0, 0, 0, 1, 1,
0.4961254, 0.5526027, 0.3767121, 0, 0, 0, 1, 1,
0.4976809, -1.550825, 1.955901, 0, 0, 0, 1, 1,
0.5002258, 0.3378759, -0.02646237, 0, 0, 0, 1, 1,
0.5013732, 0.5859418, 0.3869025, 0, 0, 0, 1, 1,
0.5028208, 0.7669973, 1.788915, 0, 0, 0, 1, 1,
0.5105067, -0.2081997, 2.012628, 1, 1, 1, 1, 1,
0.5106292, -0.5607821, 3.08376, 1, 1, 1, 1, 1,
0.5176301, 0.5155433, 0.9734452, 1, 1, 1, 1, 1,
0.5232788, -0.5342666, 2.143941, 1, 1, 1, 1, 1,
0.5341727, -0.706715, 1.987047, 1, 1, 1, 1, 1,
0.5356354, 1.368122, -0.5050583, 1, 1, 1, 1, 1,
0.5390017, 0.201221, 1.789881, 1, 1, 1, 1, 1,
0.543788, -1.108441, 3.955623, 1, 1, 1, 1, 1,
0.5512009, -0.2726087, 2.223855, 1, 1, 1, 1, 1,
0.5526257, 1.246219, 1.770909, 1, 1, 1, 1, 1,
0.5573087, 0.8169488, 1.40608, 1, 1, 1, 1, 1,
0.5632866, 0.01507468, 1.081695, 1, 1, 1, 1, 1,
0.5669549, -1.224334, 2.924031, 1, 1, 1, 1, 1,
0.5783984, -0.381579, 1.95131, 1, 1, 1, 1, 1,
0.5879003, -2.148947, 3.145211, 1, 1, 1, 1, 1,
0.5882973, 0.341659, 2.590914, 0, 0, 1, 1, 1,
0.5908857, -0.7569469, 3.172189, 1, 0, 0, 1, 1,
0.5910172, -1.067683, 2.789709, 1, 0, 0, 1, 1,
0.5931445, -1.115298, 4.23601, 1, 0, 0, 1, 1,
0.5948523, 0.7185062, 0.4100685, 1, 0, 0, 1, 1,
0.5949729, 0.9432176, 0.3447094, 1, 0, 0, 1, 1,
0.596894, 1.573531, 2.561622, 0, 0, 0, 1, 1,
0.5981553, -0.4219023, 2.988186, 0, 0, 0, 1, 1,
0.5995603, -1.169759, 3.224399, 0, 0, 0, 1, 1,
0.6011155, -1.06278, 2.720163, 0, 0, 0, 1, 1,
0.6018658, 0.06486034, 3.371575, 0, 0, 0, 1, 1,
0.6031201, 0.1618279, -0.245351, 0, 0, 0, 1, 1,
0.6043707, -0.3727914, 3.75429, 0, 0, 0, 1, 1,
0.6085925, 0.04852908, 1.065378, 1, 1, 1, 1, 1,
0.6140084, -0.2768203, 1.817539, 1, 1, 1, 1, 1,
0.6241518, 0.8029109, 0.3033929, 1, 1, 1, 1, 1,
0.6318601, -0.6150063, 1.736874, 1, 1, 1, 1, 1,
0.6320505, 0.2810153, 0.9261633, 1, 1, 1, 1, 1,
0.6331226, 1.399848, -0.7690659, 1, 1, 1, 1, 1,
0.6343102, -0.08766054, 1.124152, 1, 1, 1, 1, 1,
0.6367459, 0.5639771, 0.5927113, 1, 1, 1, 1, 1,
0.6371984, -2.209555, 1.449367, 1, 1, 1, 1, 1,
0.6373247, 0.1113073, 1.259386, 1, 1, 1, 1, 1,
0.6379136, -1.601329, 3.746601, 1, 1, 1, 1, 1,
0.6430773, -0.02973448, 2.235191, 1, 1, 1, 1, 1,
0.6454065, -0.05214162, 2.093886, 1, 1, 1, 1, 1,
0.6555675, 0.4824713, -0.2213147, 1, 1, 1, 1, 1,
0.6564626, 0.669019, 0.4707481, 1, 1, 1, 1, 1,
0.6565962, 0.4578307, 0.3260059, 0, 0, 1, 1, 1,
0.6592351, 1.395762, 0.1482837, 1, 0, 0, 1, 1,
0.6623702, -0.306595, 2.331857, 1, 0, 0, 1, 1,
0.6689599, -0.9047238, 1.929795, 1, 0, 0, 1, 1,
0.6698861, 0.3366733, 0.4006134, 1, 0, 0, 1, 1,
0.6711127, 0.2401263, 1.207745, 1, 0, 0, 1, 1,
0.6723766, 0.7938271, -0.3637137, 0, 0, 0, 1, 1,
0.6765211, 0.5093281, 1.329739, 0, 0, 0, 1, 1,
0.6855189, -0.4317974, 2.861493, 0, 0, 0, 1, 1,
0.6859104, -0.2433844, 2.544142, 0, 0, 0, 1, 1,
0.6870618, -0.4983161, 3.448059, 0, 0, 0, 1, 1,
0.6929726, -0.6234334, 1.904578, 0, 0, 0, 1, 1,
0.6946306, -0.5861967, 2.26537, 0, 0, 0, 1, 1,
0.6994625, -1.334782, 3.613193, 1, 1, 1, 1, 1,
0.6994976, -0.6740028, 1.861275, 1, 1, 1, 1, 1,
0.7074226, 1.771601, 0.6644314, 1, 1, 1, 1, 1,
0.7110447, -1.293824, 3.000823, 1, 1, 1, 1, 1,
0.7145172, 1.47807, -0.1096522, 1, 1, 1, 1, 1,
0.7254462, -0.6471792, 0.7229334, 1, 1, 1, 1, 1,
0.7280643, 0.3611547, 0.9072326, 1, 1, 1, 1, 1,
0.7285567, 0.7371094, 1.811142, 1, 1, 1, 1, 1,
0.7294569, 0.2721452, 1.63062, 1, 1, 1, 1, 1,
0.7376373, 0.4865156, -0.0608477, 1, 1, 1, 1, 1,
0.7444343, -1.099238, 2.760264, 1, 1, 1, 1, 1,
0.7449899, -0.6502343, 3.362905, 1, 1, 1, 1, 1,
0.7494058, -1.142295, 1.988917, 1, 1, 1, 1, 1,
0.7517626, 0.6663448, 0.862946, 1, 1, 1, 1, 1,
0.7526585, 0.1308369, 1.959993, 1, 1, 1, 1, 1,
0.7532063, 1.801226, 1.103776, 0, 0, 1, 1, 1,
0.7557014, -0.6348047, 2.289169, 1, 0, 0, 1, 1,
0.7570207, -0.6686473, 4.331922, 1, 0, 0, 1, 1,
0.7589429, 1.92194, 1.070051, 1, 0, 0, 1, 1,
0.7642084, 0.1688435, 0.2240116, 1, 0, 0, 1, 1,
0.7671213, 1.983225, 0.5555015, 1, 0, 0, 1, 1,
0.7679322, 1.166246, -0.2863361, 0, 0, 0, 1, 1,
0.7704635, 1.257602, 0.9608273, 0, 0, 0, 1, 1,
0.77504, -1.374787, 2.022246, 0, 0, 0, 1, 1,
0.7768267, 0.03657401, 1.849526, 0, 0, 0, 1, 1,
0.779371, -0.9861529, 0.5781571, 0, 0, 0, 1, 1,
0.7846584, -0.4856273, 2.396295, 0, 0, 0, 1, 1,
0.7908989, 0.1921299, 0.3758428, 0, 0, 0, 1, 1,
0.7944945, -0.1106729, 2.015825, 1, 1, 1, 1, 1,
0.7961768, -0.6020607, 1.539202, 1, 1, 1, 1, 1,
0.8032452, -1.234298, 4.285153, 1, 1, 1, 1, 1,
0.8059921, 1.706407, 0.03459568, 1, 1, 1, 1, 1,
0.8147061, 0.8149748, -1.24955, 1, 1, 1, 1, 1,
0.8160974, -1.480883, 1.394414, 1, 1, 1, 1, 1,
0.8162895, 2.261666, 0.9181979, 1, 1, 1, 1, 1,
0.8208261, 0.01928319, -0.06536509, 1, 1, 1, 1, 1,
0.8225054, 0.3897087, 0.1121605, 1, 1, 1, 1, 1,
0.8249414, 0.5694462, 0.19149, 1, 1, 1, 1, 1,
0.8273761, -1.040436, 3.324217, 1, 1, 1, 1, 1,
0.8313779, 0.3929035, 0.5139553, 1, 1, 1, 1, 1,
0.8343432, -2.037406, 2.713844, 1, 1, 1, 1, 1,
0.835731, -1.801847, 4.287642, 1, 1, 1, 1, 1,
0.8362898, 0.7397566, 0.5011851, 1, 1, 1, 1, 1,
0.8368148, 0.01877472, 1.694492, 0, 0, 1, 1, 1,
0.8390883, -0.2542181, 0.3116024, 1, 0, 0, 1, 1,
0.847504, -0.6308697, 1.216081, 1, 0, 0, 1, 1,
0.8545625, 1.456238, 0.4174851, 1, 0, 0, 1, 1,
0.8554662, 2.781837, -0.4140862, 1, 0, 0, 1, 1,
0.8592798, -0.7980427, 2.856436, 1, 0, 0, 1, 1,
0.8625137, -0.4422251, 1.382042, 0, 0, 0, 1, 1,
0.8626629, 0.03015741, 0.4209365, 0, 0, 0, 1, 1,
0.8647792, 1.016375, 1.405449, 0, 0, 0, 1, 1,
0.8663764, -1.064379, 3.406337, 0, 0, 0, 1, 1,
0.8725173, 1.154762, 1.739895, 0, 0, 0, 1, 1,
0.8778117, 0.08343454, 1.731971, 0, 0, 0, 1, 1,
0.8792814, 0.3223208, 1.075002, 0, 0, 0, 1, 1,
0.8950104, 0.2163608, -0.007474321, 1, 1, 1, 1, 1,
0.8962709, 0.8497441, -0.9916906, 1, 1, 1, 1, 1,
0.8986529, -0.09000361, 1.350824, 1, 1, 1, 1, 1,
0.8995119, -0.2672864, 1.908182, 1, 1, 1, 1, 1,
0.8995991, 0.5988991, 2.071344, 1, 1, 1, 1, 1,
0.9007301, -0.2596128, 1.237018, 1, 1, 1, 1, 1,
0.9008868, 0.5703044, -0.5219168, 1, 1, 1, 1, 1,
0.9023318, 0.9257897, 1.028038, 1, 1, 1, 1, 1,
0.9040157, -0.5933166, 3.053735, 1, 1, 1, 1, 1,
0.9062385, 1.459162, 0.4970525, 1, 1, 1, 1, 1,
0.9082618, 0.5765669, 1.257624, 1, 1, 1, 1, 1,
0.9101657, -0.3681973, 1.457559, 1, 1, 1, 1, 1,
0.9133977, 0.7587005, 3.374483, 1, 1, 1, 1, 1,
0.9134328, -1.84185, 4.816595, 1, 1, 1, 1, 1,
0.9164261, 0.5944559, 0.4107203, 1, 1, 1, 1, 1,
0.9175882, 0.9122083, 1.105218, 0, 0, 1, 1, 1,
0.9277011, 1.009114, -0.5473125, 1, 0, 0, 1, 1,
0.9298038, -2.256084, 3.402492, 1, 0, 0, 1, 1,
0.9321984, 1.87402, -2.195752, 1, 0, 0, 1, 1,
0.9406353, 0.2905193, 1.874253, 1, 0, 0, 1, 1,
0.9407607, 0.9598036, 1.384451, 1, 0, 0, 1, 1,
0.9433358, 0.3127303, 2.653443, 0, 0, 0, 1, 1,
0.9521922, 0.2460538, 0.866307, 0, 0, 0, 1, 1,
0.9540208, -0.741659, 1.326583, 0, 0, 0, 1, 1,
0.9565348, 0.8731081, 0.9253, 0, 0, 0, 1, 1,
0.9624232, -1.329708, 2.885347, 0, 0, 0, 1, 1,
0.9652352, -1.589859, 2.187668, 0, 0, 0, 1, 1,
0.9694508, -0.008732495, 1.738119, 0, 0, 0, 1, 1,
0.9695561, 0.3290886, 1.697585, 1, 1, 1, 1, 1,
0.9725218, -0.0454289, 2.263716, 1, 1, 1, 1, 1,
0.9754207, -1.083323, 0.8467284, 1, 1, 1, 1, 1,
0.9754997, -0.4264373, 2.503101, 1, 1, 1, 1, 1,
0.9795614, -0.5254996, 2.453564, 1, 1, 1, 1, 1,
0.9845741, 1.323096, -1.30938, 1, 1, 1, 1, 1,
0.9896371, 1.545321, 2.183842, 1, 1, 1, 1, 1,
0.9930229, -0.4324063, 2.163108, 1, 1, 1, 1, 1,
0.9988729, -0.9386774, 4.459733, 1, 1, 1, 1, 1,
1.007356, 1.414426, -0.4195471, 1, 1, 1, 1, 1,
1.009577, -0.5891359, 2.242609, 1, 1, 1, 1, 1,
1.014192, 1.519455, -0.2404334, 1, 1, 1, 1, 1,
1.014238, -0.4031901, 2.591087, 1, 1, 1, 1, 1,
1.023606, -0.3835177, 3.733638, 1, 1, 1, 1, 1,
1.028595, -0.8550541, 3.633828, 1, 1, 1, 1, 1,
1.032961, 1.316971, 0.444916, 0, 0, 1, 1, 1,
1.035961, 1.455903, 1.983165, 1, 0, 0, 1, 1,
1.042327, 0.9107177, 0.4423428, 1, 0, 0, 1, 1,
1.04657, 1.18602, 0.125091, 1, 0, 0, 1, 1,
1.049202, 2.196635, 1.456075, 1, 0, 0, 1, 1,
1.049787, -1.367434, 2.702989, 1, 0, 0, 1, 1,
1.050413, 0.2837048, 0.7759557, 0, 0, 0, 1, 1,
1.061437, 1.656304, 0.01102366, 0, 0, 0, 1, 1,
1.065604, 0.8619128, 2.348882, 0, 0, 0, 1, 1,
1.067934, 0.207731, 0.923847, 0, 0, 0, 1, 1,
1.071598, 0.1561681, 0.0080251, 0, 0, 0, 1, 1,
1.075907, 1.642247, 1.760017, 0, 0, 0, 1, 1,
1.081827, -0.6756351, 1.024971, 0, 0, 0, 1, 1,
1.088228, -0.5611509, 3.251181, 1, 1, 1, 1, 1,
1.093261, 1.572232, 0.4506613, 1, 1, 1, 1, 1,
1.095199, -2.07827, 2.986008, 1, 1, 1, 1, 1,
1.095257, 0.4329977, 1.517685, 1, 1, 1, 1, 1,
1.105231, -1.487692, 4.036578, 1, 1, 1, 1, 1,
1.110216, -1.101452, 2.308091, 1, 1, 1, 1, 1,
1.114972, -1.306575, 1.586913, 1, 1, 1, 1, 1,
1.12501, -0.2872548, 2.616459, 1, 1, 1, 1, 1,
1.137014, 0.6572643, -0.6223035, 1, 1, 1, 1, 1,
1.140103, 0.07497085, 0.2642955, 1, 1, 1, 1, 1,
1.140447, 0.7837271, 1.708529, 1, 1, 1, 1, 1,
1.144179, -0.2101918, 1.481717, 1, 1, 1, 1, 1,
1.145148, -1.765423, 2.620473, 1, 1, 1, 1, 1,
1.151718, 0.4542752, 0.4919688, 1, 1, 1, 1, 1,
1.151835, -0.541162, 1.036451, 1, 1, 1, 1, 1,
1.151856, 0.1932842, 3.236843, 0, 0, 1, 1, 1,
1.1715, 1.123123, -0.1347178, 1, 0, 0, 1, 1,
1.174928, 0.4224371, 1.649503, 1, 0, 0, 1, 1,
1.186857, 0.9891212, 1.521002, 1, 0, 0, 1, 1,
1.193778, 1.424818, 1.265301, 1, 0, 0, 1, 1,
1.197927, -1.665503, 3.040326, 1, 0, 0, 1, 1,
1.200315, -1.069173, 1.374743, 0, 0, 0, 1, 1,
1.210388, 0.6838591, -0.01789507, 0, 0, 0, 1, 1,
1.21899, -0.111365, 1.85503, 0, 0, 0, 1, 1,
1.223044, -0.9784536, 2.900939, 0, 0, 0, 1, 1,
1.224644, 1.175661, 0.8962893, 0, 0, 0, 1, 1,
1.225012, 0.09451055, 0.5215517, 0, 0, 0, 1, 1,
1.227555, 0.5746808, 2.127599, 0, 0, 0, 1, 1,
1.23042, 0.6085653, 0.2495776, 1, 1, 1, 1, 1,
1.232365, -0.1175931, 2.971259, 1, 1, 1, 1, 1,
1.233007, -0.5226001, 1.800346, 1, 1, 1, 1, 1,
1.24264, -0.8620278, 1.274008, 1, 1, 1, 1, 1,
1.244289, 0.6513874, 1.8361, 1, 1, 1, 1, 1,
1.248383, -0.4573996, 1.765653, 1, 1, 1, 1, 1,
1.257165, 0.0743577, 1.067946, 1, 1, 1, 1, 1,
1.262817, 1.577513, 1.007504, 1, 1, 1, 1, 1,
1.26328, 0.2866627, 1.908391, 1, 1, 1, 1, 1,
1.274106, -0.7803172, 3.313965, 1, 1, 1, 1, 1,
1.280035, -0.5854551, 2.394396, 1, 1, 1, 1, 1,
1.288883, -1.067808, 2.094196, 1, 1, 1, 1, 1,
1.293225, 1.411454, 0.3616284, 1, 1, 1, 1, 1,
1.29566, -1.10164, 1.291926, 1, 1, 1, 1, 1,
1.300859, 1.087271, 2.018213, 1, 1, 1, 1, 1,
1.306651, -0.7998567, 1.290881, 0, 0, 1, 1, 1,
1.324866, 2.174073, 0.9970856, 1, 0, 0, 1, 1,
1.325, 0.9184234, 1.523385, 1, 0, 0, 1, 1,
1.325144, -0.4082364, 0.2841406, 1, 0, 0, 1, 1,
1.326945, 0.1083819, 0.4615432, 1, 0, 0, 1, 1,
1.327604, -0.8959806, 2.325983, 1, 0, 0, 1, 1,
1.329184, -0.5987424, 2.964436, 0, 0, 0, 1, 1,
1.330203, -1.060147, 0.002056554, 0, 0, 0, 1, 1,
1.330391, 1.057432, -0.02333755, 0, 0, 0, 1, 1,
1.330446, 0.8198841, 1.029403, 0, 0, 0, 1, 1,
1.336126, 0.1537693, 1.345672, 0, 0, 0, 1, 1,
1.338048, -0.2748692, 2.278229, 0, 0, 0, 1, 1,
1.349699, -1.599259, 1.302355, 0, 0, 0, 1, 1,
1.352184, 0.8563159, 0.6331391, 1, 1, 1, 1, 1,
1.354543, 0.9286448, 1.3272, 1, 1, 1, 1, 1,
1.35662, -1.167227, 2.540308, 1, 1, 1, 1, 1,
1.367082, -1.269336, 3.310414, 1, 1, 1, 1, 1,
1.369154, -2.082238, 1.728135, 1, 1, 1, 1, 1,
1.372285, 0.9067649, 0.9640248, 1, 1, 1, 1, 1,
1.374344, 0.3794982, 1.363268, 1, 1, 1, 1, 1,
1.382422, 0.1788896, 1.537169, 1, 1, 1, 1, 1,
1.391515, -0.06029686, 0.6996773, 1, 1, 1, 1, 1,
1.391845, 1.228658, 1.420303, 1, 1, 1, 1, 1,
1.395573, 0.8534325, 1.467545, 1, 1, 1, 1, 1,
1.402848, 0.1529948, 1.864865, 1, 1, 1, 1, 1,
1.40473, -1.059316, 1.929582, 1, 1, 1, 1, 1,
1.406746, 0.173185, 1.044112, 1, 1, 1, 1, 1,
1.412959, 0.5809653, 1.4142, 1, 1, 1, 1, 1,
1.417153, 0.2805463, -0.04979682, 0, 0, 1, 1, 1,
1.419115, 1.383276, -0.1285347, 1, 0, 0, 1, 1,
1.427478, 0.9122179, 0.1285642, 1, 0, 0, 1, 1,
1.429173, -0.06709498, 2.161276, 1, 0, 0, 1, 1,
1.437482, 0.3770983, 0.999815, 1, 0, 0, 1, 1,
1.44981, -0.2747912, 0.918221, 1, 0, 0, 1, 1,
1.452906, -0.1936792, 0.5027316, 0, 0, 0, 1, 1,
1.464081, 0.9787939, -0.2209242, 0, 0, 0, 1, 1,
1.475348, -0.6744971, 0.8865252, 0, 0, 0, 1, 1,
1.476034, 0.8247082, 1.146328, 0, 0, 0, 1, 1,
1.477584, 0.2844492, 2.072038, 0, 0, 0, 1, 1,
1.48422, -0.2047373, 2.706511, 0, 0, 0, 1, 1,
1.489686, 0.5590593, 0.3058957, 0, 0, 0, 1, 1,
1.490357, 0.003475109, 2.441035, 1, 1, 1, 1, 1,
1.504706, -0.5611111, 2.370867, 1, 1, 1, 1, 1,
1.524157, 0.1438699, 0.6118583, 1, 1, 1, 1, 1,
1.529011, 0.1810322, 1.960182, 1, 1, 1, 1, 1,
1.533444, -0.1287142, 2.373674, 1, 1, 1, 1, 1,
1.548016, 0.1159905, 0.5727094, 1, 1, 1, 1, 1,
1.564863, -0.142261, 2.425525, 1, 1, 1, 1, 1,
1.57334, 0.7373456, 2.902934, 1, 1, 1, 1, 1,
1.579344, 1.607831, -0.5205263, 1, 1, 1, 1, 1,
1.579402, -0.6275327, 0.7684644, 1, 1, 1, 1, 1,
1.589002, -2.29143, 1.508283, 1, 1, 1, 1, 1,
1.59405, -0.5860865, 1.468437, 1, 1, 1, 1, 1,
1.601167, 1.870608, 1.387414, 1, 1, 1, 1, 1,
1.624763, 0.967129, 2.279292, 1, 1, 1, 1, 1,
1.628159, -0.7976282, 3.698213, 1, 1, 1, 1, 1,
1.628833, 0.3166356, 1.32315, 0, 0, 1, 1, 1,
1.640507, -0.08549709, 2.70183, 1, 0, 0, 1, 1,
1.642916, 0.4217334, 0.507317, 1, 0, 0, 1, 1,
1.64359, 1.852477, 1.61533, 1, 0, 0, 1, 1,
1.64945, 0.9625743, -0.6124313, 1, 0, 0, 1, 1,
1.660048, 0.8295172, 0.3977903, 1, 0, 0, 1, 1,
1.692582, -0.3029546, 2.167775, 0, 0, 0, 1, 1,
1.718636, 0.22562, 1.831118, 0, 0, 0, 1, 1,
1.722356, 1.279292, 1.622478, 0, 0, 0, 1, 1,
1.732934, 1.205517, -0.6703734, 0, 0, 0, 1, 1,
1.739682, 1.25103, 0.8449839, 0, 0, 0, 1, 1,
1.752696, -0.7930226, 1.068736, 0, 0, 0, 1, 1,
1.757744, 0.6435968, 2.130148, 0, 0, 0, 1, 1,
1.785459, -0.1039678, 0.4058821, 1, 1, 1, 1, 1,
1.793561, 1.327153, 0.155814, 1, 1, 1, 1, 1,
1.82145, -0.2739999, 1.973729, 1, 1, 1, 1, 1,
1.831609, -1.231085, 1.429012, 1, 1, 1, 1, 1,
1.831822, -0.1392803, 2.152385, 1, 1, 1, 1, 1,
1.84824, 1.448306, 1.69579, 1, 1, 1, 1, 1,
1.850346, 1.020837, 1.618895, 1, 1, 1, 1, 1,
1.88105, 1.013499, -0.3389574, 1, 1, 1, 1, 1,
1.968208, -0.9925811, 3.08351, 1, 1, 1, 1, 1,
1.994473, 1.465258, 0.4307174, 1, 1, 1, 1, 1,
2.012053, 0.2761877, 1.197063, 1, 1, 1, 1, 1,
2.036, 1.714769, 1.564463, 1, 1, 1, 1, 1,
2.058327, 0.9572935, 0.04283255, 1, 1, 1, 1, 1,
2.062883, 1.816907, 1.012031, 1, 1, 1, 1, 1,
2.066943, -0.2410507, 1.581704, 1, 1, 1, 1, 1,
2.069499, -0.047544, 0.5540769, 0, 0, 1, 1, 1,
2.076984, -0.4614362, 2.403889, 1, 0, 0, 1, 1,
2.09811, 0.7513428, 1.626386, 1, 0, 0, 1, 1,
2.103508, -0.05920676, 1.62219, 1, 0, 0, 1, 1,
2.115268, -1.016769, 1.315983, 1, 0, 0, 1, 1,
2.139346, -2.033653, 2.709899, 1, 0, 0, 1, 1,
2.186234, -0.4056242, 3.132325, 0, 0, 0, 1, 1,
2.193239, -1.426367, 4.291922, 0, 0, 0, 1, 1,
2.240226, -0.01109986, 1.998222, 0, 0, 0, 1, 1,
2.262112, -0.636874, 0.7863581, 0, 0, 0, 1, 1,
2.353929, -0.8665428, 1.943041, 0, 0, 0, 1, 1,
2.41187, -1.915819, 1.716148, 0, 0, 0, 1, 1,
2.447772, -0.02406477, 4.002429, 0, 0, 0, 1, 1,
2.450866, -0.5369542, 2.550478, 1, 1, 1, 1, 1,
2.451522, 1.792889, 3.149417, 1, 1, 1, 1, 1,
2.473344, -0.6985328, 1.693458, 1, 1, 1, 1, 1,
2.479699, -0.8608143, 1.329069, 1, 1, 1, 1, 1,
2.573987, -0.6539705, 2.572677, 1, 1, 1, 1, 1,
2.934108, -2.107944, 2.290722, 1, 1, 1, 1, 1,
3.101491, 0.275142, 1.131397, 1, 1, 1, 1, 1
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
var radius = 9.458064;
var distance = 33.22105;
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
mvMatrix.translate( 0.2136939, 0.06027615, 0.09132481 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.22105);
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