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
-3.091152, -0.1730618, -1.850912, 1, 0, 0, 1,
-2.92066, 1.226894, -1.475558, 1, 0.007843138, 0, 1,
-2.633843, -2.340256, -1.511176, 1, 0.01176471, 0, 1,
-2.585531, 1.462257, -0.6378237, 1, 0.01960784, 0, 1,
-2.556227, 2.885308, 0.7882673, 1, 0.02352941, 0, 1,
-2.556145, -0.8899264, -1.970966, 1, 0.03137255, 0, 1,
-2.550901, 1.218474, -1.150033, 1, 0.03529412, 0, 1,
-2.486959, -0.7825055, -0.2059876, 1, 0.04313726, 0, 1,
-2.394653, 0.02766513, -1.23354, 1, 0.04705882, 0, 1,
-2.392331, 0.3335509, -3.133762, 1, 0.05490196, 0, 1,
-2.390614, -0.0339827, -1.939922, 1, 0.05882353, 0, 1,
-2.376087, -0.7597989, -2.035119, 1, 0.06666667, 0, 1,
-2.322158, 1.314082, -0.2394325, 1, 0.07058824, 0, 1,
-2.225236, -0.3966287, -2.604184, 1, 0.07843138, 0, 1,
-2.219727, 0.9593766, -0.500838, 1, 0.08235294, 0, 1,
-2.21911, -0.3019041, -1.100604, 1, 0.09019608, 0, 1,
-2.18938, 1.755839, -0.9110696, 1, 0.09411765, 0, 1,
-2.161989, -0.5417131, -1.705812, 1, 0.1019608, 0, 1,
-2.125016, 1.862301, -1.349143, 1, 0.1098039, 0, 1,
-2.123936, -0.6453249, -1.496336, 1, 0.1137255, 0, 1,
-2.089456, -1.665391, -1.017956, 1, 0.1215686, 0, 1,
-2.033323, -0.1470303, 0.1141881, 1, 0.1254902, 0, 1,
-2.029979, 0.4036041, -0.1968709, 1, 0.1333333, 0, 1,
-2.013638, 0.07299786, -0.1313253, 1, 0.1372549, 0, 1,
-1.951509, -2.326256, -2.585536, 1, 0.145098, 0, 1,
-1.934415, -0.7964135, -2.69534, 1, 0.1490196, 0, 1,
-1.925677, 0.1859598, -1.45756, 1, 0.1568628, 0, 1,
-1.89655, 1.314621, -2.382794, 1, 0.1607843, 0, 1,
-1.896501, -1.021917, -1.594077, 1, 0.1686275, 0, 1,
-1.883834, -0.1596737, -2.226584, 1, 0.172549, 0, 1,
-1.872607, -0.5271076, -1.575531, 1, 0.1803922, 0, 1,
-1.854985, 1.011345, -0.5201249, 1, 0.1843137, 0, 1,
-1.852262, 0.5670846, -2.720848, 1, 0.1921569, 0, 1,
-1.845308, -1.624245, -1.257266, 1, 0.1960784, 0, 1,
-1.844306, 0.3025772, -1.778658, 1, 0.2039216, 0, 1,
-1.843738, 0.3740479, -1.306775, 1, 0.2117647, 0, 1,
-1.835476, 1.290005, -2.180202, 1, 0.2156863, 0, 1,
-1.83053, 0.4230011, 0.1328233, 1, 0.2235294, 0, 1,
-1.823305, -0.95342, -1.465713, 1, 0.227451, 0, 1,
-1.798378, -1.065985, -0.4508388, 1, 0.2352941, 0, 1,
-1.79827, 1.425337, -1.595119, 1, 0.2392157, 0, 1,
-1.785851, -1.360984, -2.417959, 1, 0.2470588, 0, 1,
-1.780984, -2.129514, -1.876987, 1, 0.2509804, 0, 1,
-1.762587, 0.05186335, -0.3445351, 1, 0.2588235, 0, 1,
-1.757918, -0.6244825, -1.133812, 1, 0.2627451, 0, 1,
-1.747454, -0.940945, -3.020024, 1, 0.2705882, 0, 1,
-1.744356, -1.506467, -0.7223933, 1, 0.2745098, 0, 1,
-1.732982, 0.7726496, 0.1090757, 1, 0.282353, 0, 1,
-1.722049, 0.4753891, -1.721341, 1, 0.2862745, 0, 1,
-1.692911, 0.5259014, -0.6541122, 1, 0.2941177, 0, 1,
-1.687417, -0.9544684, -2.215283, 1, 0.3019608, 0, 1,
-1.670712, -0.299068, -1.539228, 1, 0.3058824, 0, 1,
-1.657019, 0.7344351, -2.778633, 1, 0.3137255, 0, 1,
-1.649805, -0.1258611, -1.951556, 1, 0.3176471, 0, 1,
-1.637144, -0.4205426, -0.4375209, 1, 0.3254902, 0, 1,
-1.622243, -1.829507, -1.445025, 1, 0.3294118, 0, 1,
-1.610469, 1.784405, -1.116397, 1, 0.3372549, 0, 1,
-1.607753, 0.6817362, -0.8165908, 1, 0.3411765, 0, 1,
-1.571612, -1.137276, -3.02534, 1, 0.3490196, 0, 1,
-1.534485, -0.5645275, 0.08394151, 1, 0.3529412, 0, 1,
-1.532749, -0.1946034, -1.811914, 1, 0.3607843, 0, 1,
-1.495253, -1.107786, -0.9823672, 1, 0.3647059, 0, 1,
-1.483489, 1.334845, -1.717665, 1, 0.372549, 0, 1,
-1.476024, -0.8054479, -1.6362, 1, 0.3764706, 0, 1,
-1.469123, -0.5899649, 0.8007283, 1, 0.3843137, 0, 1,
-1.463726, -0.3127826, -1.804868, 1, 0.3882353, 0, 1,
-1.456706, 1.302612, -0.04822246, 1, 0.3960784, 0, 1,
-1.455091, -0.1638246, -1.172803, 1, 0.4039216, 0, 1,
-1.453332, -0.9519799, -3.418042, 1, 0.4078431, 0, 1,
-1.438358, 1.052064, -0.7394277, 1, 0.4156863, 0, 1,
-1.438259, 0.3330255, -2.163292, 1, 0.4196078, 0, 1,
-1.436345, 1.054279, -2.2549, 1, 0.427451, 0, 1,
-1.435161, -0.8136867, -1.979418, 1, 0.4313726, 0, 1,
-1.42445, 0.2933187, -1.719966, 1, 0.4392157, 0, 1,
-1.422109, 0.9703104, -0.7478942, 1, 0.4431373, 0, 1,
-1.417138, 0.5623563, -0.08060359, 1, 0.4509804, 0, 1,
-1.404019, -0.5058047, -1.782012, 1, 0.454902, 0, 1,
-1.400209, -0.5281618, -2.098446, 1, 0.4627451, 0, 1,
-1.397849, -0.1092162, 0.7717699, 1, 0.4666667, 0, 1,
-1.394659, -0.5491642, -0.6332181, 1, 0.4745098, 0, 1,
-1.393244, 0.05863571, -1.264892, 1, 0.4784314, 0, 1,
-1.38072, -0.2989682, -1.014591, 1, 0.4862745, 0, 1,
-1.379977, -1.036986, -2.430574, 1, 0.4901961, 0, 1,
-1.369613, 0.1491872, -1.122512, 1, 0.4980392, 0, 1,
-1.36737, -0.5475903, -0.6506123, 1, 0.5058824, 0, 1,
-1.359982, 0.6110641, -0.109457, 1, 0.509804, 0, 1,
-1.354967, -0.3495333, -2.108765, 1, 0.5176471, 0, 1,
-1.348506, 0.872621, -1.406084, 1, 0.5215687, 0, 1,
-1.346303, -0.7639642, -2.482825, 1, 0.5294118, 0, 1,
-1.342208, -0.05957013, -0.8396738, 1, 0.5333334, 0, 1,
-1.341103, 0.956811, -0.9362342, 1, 0.5411765, 0, 1,
-1.328735, 0.1494485, 0.2544958, 1, 0.5450981, 0, 1,
-1.320923, 0.8529504, -0.04996096, 1, 0.5529412, 0, 1,
-1.302255, -0.5791017, -0.07180664, 1, 0.5568628, 0, 1,
-1.301267, 0.9779695, 0.05670069, 1, 0.5647059, 0, 1,
-1.299251, 0.0914308, -0.11383, 1, 0.5686275, 0, 1,
-1.297383, 1.212802, -2.180437, 1, 0.5764706, 0, 1,
-1.28628, 0.8148239, -0.4635917, 1, 0.5803922, 0, 1,
-1.277784, 0.06306913, -0.5563204, 1, 0.5882353, 0, 1,
-1.272923, 2.272306, -0.2799758, 1, 0.5921569, 0, 1,
-1.271773, -0.02290929, -1.85425, 1, 0.6, 0, 1,
-1.269466, -0.8313762, -3.471568, 1, 0.6078432, 0, 1,
-1.267849, -0.462682, -2.757336, 1, 0.6117647, 0, 1,
-1.263288, 0.6042522, -0.1496338, 1, 0.6196079, 0, 1,
-1.26219, -0.003679881, -0.4983768, 1, 0.6235294, 0, 1,
-1.261522, -1.398272, -2.871058, 1, 0.6313726, 0, 1,
-1.260374, -0.8630168, -1.628279, 1, 0.6352941, 0, 1,
-1.256561, -0.09814537, -2.882531, 1, 0.6431373, 0, 1,
-1.241645, 0.8181581, -1.77512, 1, 0.6470588, 0, 1,
-1.23831, 0.01086181, -1.46602, 1, 0.654902, 0, 1,
-1.237603, 0.2343815, -2.004209, 1, 0.6588235, 0, 1,
-1.234627, -0.273098, -2.078268, 1, 0.6666667, 0, 1,
-1.226632, -1.332073, -3.775727, 1, 0.6705883, 0, 1,
-1.212898, 0.1789362, -1.590665, 1, 0.6784314, 0, 1,
-1.21015, -1.41063, -2.390574, 1, 0.682353, 0, 1,
-1.207183, 0.1234704, -0.4280018, 1, 0.6901961, 0, 1,
-1.202531, -1.241529, -3.219526, 1, 0.6941177, 0, 1,
-1.202325, -0.002983375, -1.253994, 1, 0.7019608, 0, 1,
-1.192678, -0.08151004, -2.414366, 1, 0.7098039, 0, 1,
-1.177287, 0.8635816, -1.48712, 1, 0.7137255, 0, 1,
-1.176325, -0.9201158, -1.650344, 1, 0.7215686, 0, 1,
-1.173602, 0.4861935, 0.8053652, 1, 0.7254902, 0, 1,
-1.169489, -2.289465, -2.32265, 1, 0.7333333, 0, 1,
-1.168633, -0.4933111, -2.1576, 1, 0.7372549, 0, 1,
-1.157459, 0.08897612, -1.04003, 1, 0.7450981, 0, 1,
-1.154413, -0.005691221, -3.366711, 1, 0.7490196, 0, 1,
-1.147074, 0.4893199, -1.022514, 1, 0.7568628, 0, 1,
-1.146085, 0.2440907, -0.4937809, 1, 0.7607843, 0, 1,
-1.143017, 1.49905, -1.597569, 1, 0.7686275, 0, 1,
-1.141121, -0.4786742, -3.759285, 1, 0.772549, 0, 1,
-1.136545, 1.237951, -0.1851839, 1, 0.7803922, 0, 1,
-1.135958, 2.159824, -0.8041302, 1, 0.7843137, 0, 1,
-1.134802, -1.681203, -2.136539, 1, 0.7921569, 0, 1,
-1.124992, 2.379306, -0.1213845, 1, 0.7960784, 0, 1,
-1.123769, -1.99272, -2.577177, 1, 0.8039216, 0, 1,
-1.11906, 0.7487498, 0.04749675, 1, 0.8117647, 0, 1,
-1.110418, 0.4938623, -0.4149646, 1, 0.8156863, 0, 1,
-1.10058, -0.4988809, -1.095922, 1, 0.8235294, 0, 1,
-1.098273, 0.184994, -1.138338, 1, 0.827451, 0, 1,
-1.098142, 0.172501, -1.881927, 1, 0.8352941, 0, 1,
-1.093101, 1.851627, -0.7071655, 1, 0.8392157, 0, 1,
-1.091673, 1.343835, -1.324061, 1, 0.8470588, 0, 1,
-1.077208, -0.319326, -2.114604, 1, 0.8509804, 0, 1,
-1.07183, -1.561273, -1.57839, 1, 0.8588235, 0, 1,
-1.068057, -0.901431, -2.218023, 1, 0.8627451, 0, 1,
-1.065579, -0.8049797, -1.897114, 1, 0.8705882, 0, 1,
-1.065489, -0.3997931, -0.3810701, 1, 0.8745098, 0, 1,
-1.053869, 1.746131, -1.335548, 1, 0.8823529, 0, 1,
-1.051371, 1.949723, 1.093433, 1, 0.8862745, 0, 1,
-1.050569, -2.660701, -3.245042, 1, 0.8941177, 0, 1,
-1.04695, -0.1556969, -0.1691951, 1, 0.8980392, 0, 1,
-1.037338, 0.7804546, -2.87323, 1, 0.9058824, 0, 1,
-1.020437, 1.028977, -2.062502, 1, 0.9137255, 0, 1,
-1.019361, 0.1467587, -1.057089, 1, 0.9176471, 0, 1,
-1.018628, 0.8245245, 0.2768434, 1, 0.9254902, 0, 1,
-1.013939, 1.945272, 0.1045474, 1, 0.9294118, 0, 1,
-0.9965967, 2.580564, -0.6145019, 1, 0.9372549, 0, 1,
-0.994643, -0.7267606, -1.252884, 1, 0.9411765, 0, 1,
-0.9928201, 0.6509791, -1.401353, 1, 0.9490196, 0, 1,
-0.9884788, 1.811433, -0.00667371, 1, 0.9529412, 0, 1,
-0.9865406, -0.6932472, -2.419049, 1, 0.9607843, 0, 1,
-0.9792071, 0.0008099585, -1.815795, 1, 0.9647059, 0, 1,
-0.9748655, -0.04645564, -1.046481, 1, 0.972549, 0, 1,
-0.9720709, 0.9594506, -0.248923, 1, 0.9764706, 0, 1,
-0.9700884, -1.744194, -3.166663, 1, 0.9843137, 0, 1,
-0.9699883, 0.2573441, -2.987013, 1, 0.9882353, 0, 1,
-0.9621297, 0.09974097, -0.5894378, 1, 0.9960784, 0, 1,
-0.9611191, 0.7921837, -1.67514, 0.9960784, 1, 0, 1,
-0.9600562, 1.599559, -0.4884731, 0.9921569, 1, 0, 1,
-0.958599, -0.3411755, -2.092823, 0.9843137, 1, 0, 1,
-0.9580803, -0.7747827, -2.377276, 0.9803922, 1, 0, 1,
-0.9492015, -1.038029, -1.959129, 0.972549, 1, 0, 1,
-0.9468915, -0.490974, -2.973305, 0.9686275, 1, 0, 1,
-0.9445844, -0.5042339, -4.00715, 0.9607843, 1, 0, 1,
-0.9441858, -0.6321194, -2.367726, 0.9568627, 1, 0, 1,
-0.943406, -0.6102512, -1.658242, 0.9490196, 1, 0, 1,
-0.9430011, 0.3426282, -1.270624, 0.945098, 1, 0, 1,
-0.9337872, -2.632358, -2.704038, 0.9372549, 1, 0, 1,
-0.9244078, -0.6583595, -1.15354, 0.9333333, 1, 0, 1,
-0.9104164, -0.05988375, -0.4745723, 0.9254902, 1, 0, 1,
-0.9101676, 0.7743198, -1.641491, 0.9215686, 1, 0, 1,
-0.9077653, -0.2516832, -1.23623, 0.9137255, 1, 0, 1,
-0.9046882, 0.6154304, -0.2143563, 0.9098039, 1, 0, 1,
-0.8999038, -0.2967485, -1.999756, 0.9019608, 1, 0, 1,
-0.8822874, 0.9009949, -1.193199, 0.8941177, 1, 0, 1,
-0.8807496, 0.05055436, -1.099514, 0.8901961, 1, 0, 1,
-0.8805693, -1.533123, -2.761165, 0.8823529, 1, 0, 1,
-0.8794045, -0.6839011, -0.5850819, 0.8784314, 1, 0, 1,
-0.8784387, -0.05133997, -1.966362, 0.8705882, 1, 0, 1,
-0.8718665, 1.336559, -0.6464518, 0.8666667, 1, 0, 1,
-0.8666159, -0.5355105, -2.014798, 0.8588235, 1, 0, 1,
-0.8624835, -1.041813, -2.582914, 0.854902, 1, 0, 1,
-0.8592719, 0.187493, -0.7923943, 0.8470588, 1, 0, 1,
-0.8582074, -0.2867629, -1.855412, 0.8431373, 1, 0, 1,
-0.8546043, 0.2985115, 0.727026, 0.8352941, 1, 0, 1,
-0.8447503, -0.4299536, -3.330242, 0.8313726, 1, 0, 1,
-0.8372459, -0.6264824, -2.724228, 0.8235294, 1, 0, 1,
-0.8354027, 2.091683, -0.6204543, 0.8196079, 1, 0, 1,
-0.8198546, 0.4249289, -0.9181412, 0.8117647, 1, 0, 1,
-0.8130282, -0.08996857, -3.096322, 0.8078431, 1, 0, 1,
-0.8122395, -0.07226008, -1.221858, 0.8, 1, 0, 1,
-0.8091384, 0.5655966, -0.2073491, 0.7921569, 1, 0, 1,
-0.8088738, -0.8819731, -3.915039, 0.7882353, 1, 0, 1,
-0.8060872, -0.1959999, -2.625906, 0.7803922, 1, 0, 1,
-0.805057, -1.85573, -3.579803, 0.7764706, 1, 0, 1,
-0.8036684, 0.2182092, -2.428201, 0.7686275, 1, 0, 1,
-0.8014557, -0.3272994, -2.248063, 0.7647059, 1, 0, 1,
-0.7949646, -0.9585353, -4.071981, 0.7568628, 1, 0, 1,
-0.792677, 0.5036998, -1.03589, 0.7529412, 1, 0, 1,
-0.7896246, -1.390832, -2.743739, 0.7450981, 1, 0, 1,
-0.7884451, 0.2384649, -0.1777689, 0.7411765, 1, 0, 1,
-0.7873136, -0.03218199, -2.290421, 0.7333333, 1, 0, 1,
-0.7865118, 0.4056703, -1.862274, 0.7294118, 1, 0, 1,
-0.782734, 0.2255909, -1.396616, 0.7215686, 1, 0, 1,
-0.7800885, 0.6222495, 0.05816198, 0.7176471, 1, 0, 1,
-0.7754861, 0.8082702, -1.106084, 0.7098039, 1, 0, 1,
-0.7697334, 1.047323, 0.2674218, 0.7058824, 1, 0, 1,
-0.7684864, -0.3104753, 0.1910888, 0.6980392, 1, 0, 1,
-0.7682638, -1.652478, -2.559872, 0.6901961, 1, 0, 1,
-0.7641092, 0.1850619, 0.2512661, 0.6862745, 1, 0, 1,
-0.7588438, -0.4339509, -0.9999948, 0.6784314, 1, 0, 1,
-0.7556546, -2.169156, -2.623045, 0.6745098, 1, 0, 1,
-0.755613, -0.4538583, -1.866061, 0.6666667, 1, 0, 1,
-0.7525499, -0.9797596, -0.2753487, 0.6627451, 1, 0, 1,
-0.744976, -2.253464, -5.340459, 0.654902, 1, 0, 1,
-0.7449511, 2.537322, -2.455734, 0.6509804, 1, 0, 1,
-0.7420036, -0.1662282, -0.5982729, 0.6431373, 1, 0, 1,
-0.7399779, 1.083154, -1.452394, 0.6392157, 1, 0, 1,
-0.7267779, 1.991006, 0.768898, 0.6313726, 1, 0, 1,
-0.7203126, 1.43699, -0.3089479, 0.627451, 1, 0, 1,
-0.7202326, 0.07574256, -0.95909, 0.6196079, 1, 0, 1,
-0.7195167, 0.5032219, -0.7867165, 0.6156863, 1, 0, 1,
-0.7147391, 1.358855, 0.003348469, 0.6078432, 1, 0, 1,
-0.7121007, -1.044166, -1.979824, 0.6039216, 1, 0, 1,
-0.7117056, -0.3581835, -2.184107, 0.5960785, 1, 0, 1,
-0.7085679, 0.7768568, -0.1302563, 0.5882353, 1, 0, 1,
-0.7084919, 1.348322, -0.625998, 0.5843138, 1, 0, 1,
-0.7015415, 1.530236, 0.03758503, 0.5764706, 1, 0, 1,
-0.6975884, -1.035269, -3.350506, 0.572549, 1, 0, 1,
-0.6927841, -0.933093, -1.490973, 0.5647059, 1, 0, 1,
-0.6813863, -1.892476, -0.7197579, 0.5607843, 1, 0, 1,
-0.6807826, -0.2007223, -0.9522628, 0.5529412, 1, 0, 1,
-0.6773501, -0.1083611, -1.009597, 0.5490196, 1, 0, 1,
-0.6759402, -0.8504318, -2.273959, 0.5411765, 1, 0, 1,
-0.6756549, 0.4993004, -1.395542, 0.5372549, 1, 0, 1,
-0.6746821, -1.484537, -2.031202, 0.5294118, 1, 0, 1,
-0.674273, -1.428378, -3.554742, 0.5254902, 1, 0, 1,
-0.6740285, -0.8791782, -1.339896, 0.5176471, 1, 0, 1,
-0.6720901, 0.6414303, -1.558927, 0.5137255, 1, 0, 1,
-0.6716556, -1.114356, -2.76176, 0.5058824, 1, 0, 1,
-0.6702803, -1.375083, -3.976846, 0.5019608, 1, 0, 1,
-0.669914, 2.056257, 0.8166805, 0.4941176, 1, 0, 1,
-0.6695767, 1.547218, 0.7384914, 0.4862745, 1, 0, 1,
-0.666329, -1.144853, -1.991993, 0.4823529, 1, 0, 1,
-0.6634744, 0.09799246, -1.103411, 0.4745098, 1, 0, 1,
-0.6615057, 1.099792, -0.3004721, 0.4705882, 1, 0, 1,
-0.6609699, -1.1415, -0.2701695, 0.4627451, 1, 0, 1,
-0.6476194, 1.951098, 0.5899621, 0.4588235, 1, 0, 1,
-0.6395988, 0.3328757, -1.488485, 0.4509804, 1, 0, 1,
-0.6372022, -0.3990202, -1.741326, 0.4470588, 1, 0, 1,
-0.6337446, 0.993561, 0.4471715, 0.4392157, 1, 0, 1,
-0.6334098, -0.2261938, -2.938183, 0.4352941, 1, 0, 1,
-0.6330865, 0.4798119, -3.020274, 0.427451, 1, 0, 1,
-0.6282747, -0.104638, -1.08727, 0.4235294, 1, 0, 1,
-0.6251819, -1.432492, -1.514077, 0.4156863, 1, 0, 1,
-0.62366, -1.275057, -3.431302, 0.4117647, 1, 0, 1,
-0.6233407, 0.9144777, 0.1827299, 0.4039216, 1, 0, 1,
-0.6182376, -1.129051, -1.95618, 0.3960784, 1, 0, 1,
-0.6166043, 1.057736, -0.04812085, 0.3921569, 1, 0, 1,
-0.6077986, 1.030506, 0.3834445, 0.3843137, 1, 0, 1,
-0.605012, 0.4071373, -1.407488, 0.3803922, 1, 0, 1,
-0.604246, -2.572113, -2.135374, 0.372549, 1, 0, 1,
-0.6034354, 1.181869, -0.5993578, 0.3686275, 1, 0, 1,
-0.5958287, -0.202276, -3.222315, 0.3607843, 1, 0, 1,
-0.5925936, -0.5353118, -2.719424, 0.3568628, 1, 0, 1,
-0.5787642, 1.017271, 2.971363, 0.3490196, 1, 0, 1,
-0.5780096, -0.3051071, -2.440456, 0.345098, 1, 0, 1,
-0.5776491, 0.7905028, -1.231091, 0.3372549, 1, 0, 1,
-0.57754, -0.08689103, -2.073781, 0.3333333, 1, 0, 1,
-0.5757646, 1.090515, -0.1731578, 0.3254902, 1, 0, 1,
-0.5755742, 0.2699541, -0.9323273, 0.3215686, 1, 0, 1,
-0.5725375, -0.8892198, -3.506217, 0.3137255, 1, 0, 1,
-0.5697756, 1.448596, -0.2906492, 0.3098039, 1, 0, 1,
-0.5666909, 0.6612673, 1.347097, 0.3019608, 1, 0, 1,
-0.5583191, 0.2401238, -0.7887217, 0.2941177, 1, 0, 1,
-0.557604, 0.3629657, -2.154589, 0.2901961, 1, 0, 1,
-0.5566747, 0.03105591, -3.687872, 0.282353, 1, 0, 1,
-0.5557546, -0.2628353, -2.474778, 0.2784314, 1, 0, 1,
-0.5472369, -0.8351216, -2.032807, 0.2705882, 1, 0, 1,
-0.5457639, -1.077979, -5.652841, 0.2666667, 1, 0, 1,
-0.5430818, 1.40487, -0.7021679, 0.2588235, 1, 0, 1,
-0.5397774, -0.01251291, -0.5618705, 0.254902, 1, 0, 1,
-0.5362929, 0.6217301, -1.073398, 0.2470588, 1, 0, 1,
-0.5354832, 0.1073379, -2.077178, 0.2431373, 1, 0, 1,
-0.5317703, -0.2995905, -1.44704, 0.2352941, 1, 0, 1,
-0.522139, 1.313401, 0.3477937, 0.2313726, 1, 0, 1,
-0.5142398, -0.5335919, -0.09442765, 0.2235294, 1, 0, 1,
-0.5139096, -1.295535, -3.48612, 0.2196078, 1, 0, 1,
-0.5041198, 0.7929028, -0.961782, 0.2117647, 1, 0, 1,
-0.5039814, -0.9398224, -2.331489, 0.2078431, 1, 0, 1,
-0.5035121, -0.1280937, -1.185059, 0.2, 1, 0, 1,
-0.5024726, 0.5098124, -2.334862, 0.1921569, 1, 0, 1,
-0.4988791, -0.4038047, -1.958009, 0.1882353, 1, 0, 1,
-0.4967226, 0.6935157, -2.181246, 0.1803922, 1, 0, 1,
-0.4904541, -0.5139837, -2.561161, 0.1764706, 1, 0, 1,
-0.4897753, -1.000566, -1.548085, 0.1686275, 1, 0, 1,
-0.4810337, 0.5977461, -2.860528, 0.1647059, 1, 0, 1,
-0.479889, -2.413695, -3.217335, 0.1568628, 1, 0, 1,
-0.4750023, 1.31779, -1.343946, 0.1529412, 1, 0, 1,
-0.474376, -1.66022, -3.328598, 0.145098, 1, 0, 1,
-0.4738971, -0.5246826, -1.229553, 0.1411765, 1, 0, 1,
-0.4721849, 0.8804743, -1.211741, 0.1333333, 1, 0, 1,
-0.4679784, 1.003396, -1.070244, 0.1294118, 1, 0, 1,
-0.4653184, 0.8140966, -1.448848, 0.1215686, 1, 0, 1,
-0.4644679, 0.4801592, -0.08354641, 0.1176471, 1, 0, 1,
-0.4632722, -1.139102, -2.895061, 0.1098039, 1, 0, 1,
-0.4623312, 0.5213781, -1.881611, 0.1058824, 1, 0, 1,
-0.4591383, 0.1926043, -0.2533126, 0.09803922, 1, 0, 1,
-0.4582979, -0.0855214, -3.048742, 0.09019608, 1, 0, 1,
-0.4559313, -0.2261913, -1.866107, 0.08627451, 1, 0, 1,
-0.4488015, 0.3582745, -1.9146, 0.07843138, 1, 0, 1,
-0.4454444, -0.9750771, -1.609134, 0.07450981, 1, 0, 1,
-0.4393844, -0.6288319, -1.718382, 0.06666667, 1, 0, 1,
-0.4389393, -0.06282131, 0.2329204, 0.0627451, 1, 0, 1,
-0.4381712, 0.9962803, -0.07113209, 0.05490196, 1, 0, 1,
-0.4372746, 1.175184, -0.8948764, 0.05098039, 1, 0, 1,
-0.4368662, 0.7127948, -2.802531, 0.04313726, 1, 0, 1,
-0.4368075, -0.6551504, -2.950356, 0.03921569, 1, 0, 1,
-0.4352519, -1.113761, -3.298247, 0.03137255, 1, 0, 1,
-0.4337797, 0.1195001, -1.481198, 0.02745098, 1, 0, 1,
-0.4332635, -0.0004110702, -1.971767, 0.01960784, 1, 0, 1,
-0.4330372, -0.03484936, -1.64913, 0.01568628, 1, 0, 1,
-0.4282581, -1.65488, -3.047267, 0.007843138, 1, 0, 1,
-0.4230402, 0.06289013, -0.2584735, 0.003921569, 1, 0, 1,
-0.4210113, 1.466534, -1.343088, 0, 1, 0.003921569, 1,
-0.419296, -0.5059073, -2.423357, 0, 1, 0.01176471, 1,
-0.4187818, -1.016206, -3.383489, 0, 1, 0.01568628, 1,
-0.4165216, -0.9739328, -2.986171, 0, 1, 0.02352941, 1,
-0.4138122, 1.776665, 0.9642746, 0, 1, 0.02745098, 1,
-0.412861, 0.223866, -1.495617, 0, 1, 0.03529412, 1,
-0.4122729, 0.365456, 1.047358, 0, 1, 0.03921569, 1,
-0.4105535, 1.054228, -1.42498, 0, 1, 0.04705882, 1,
-0.4087834, 1.794246, -1.57106, 0, 1, 0.05098039, 1,
-0.4087417, 1.092554, -0.597591, 0, 1, 0.05882353, 1,
-0.4047729, -1.126818, -3.363882, 0, 1, 0.0627451, 1,
-0.4022551, 2.185728, 0.2821837, 0, 1, 0.07058824, 1,
-0.4011188, -0.495172, -3.060151, 0, 1, 0.07450981, 1,
-0.3988477, 0.7325955, -1.694919, 0, 1, 0.08235294, 1,
-0.397923, 0.1478849, -2.306517, 0, 1, 0.08627451, 1,
-0.3976804, 1.525405, 0.5992216, 0, 1, 0.09411765, 1,
-0.39697, 0.20869, -3.521684, 0, 1, 0.1019608, 1,
-0.3908606, 1.878489, 1.040997, 0, 1, 0.1058824, 1,
-0.3871606, -1.853408, -2.954554, 0, 1, 0.1137255, 1,
-0.3834733, -0.8462819, -1.365184, 0, 1, 0.1176471, 1,
-0.3799422, 0.659851, 0.780194, 0, 1, 0.1254902, 1,
-0.3778755, 1.467707, -0.5247231, 0, 1, 0.1294118, 1,
-0.3761278, -0.6334968, -1.236919, 0, 1, 0.1372549, 1,
-0.3695133, -1.099778, -2.294957, 0, 1, 0.1411765, 1,
-0.3678797, 0.1834364, -0.9526596, 0, 1, 0.1490196, 1,
-0.3672289, -0.5068456, -2.773868, 0, 1, 0.1529412, 1,
-0.366968, -0.8395758, -4.241276, 0, 1, 0.1607843, 1,
-0.3651454, 1.072482, -1.72359, 0, 1, 0.1647059, 1,
-0.3646642, -1.072956, -2.337697, 0, 1, 0.172549, 1,
-0.3608781, -1.05147, -2.3895, 0, 1, 0.1764706, 1,
-0.3595485, -0.7709788, -2.314549, 0, 1, 0.1843137, 1,
-0.355406, 1.631033, 0.1347792, 0, 1, 0.1882353, 1,
-0.3538213, 1.182816, -1.22997, 0, 1, 0.1960784, 1,
-0.3535846, 0.8152077, 0.3824228, 0, 1, 0.2039216, 1,
-0.3523163, 0.8343208, 0.2301988, 0, 1, 0.2078431, 1,
-0.3447221, -0.4466228, -2.699739, 0, 1, 0.2156863, 1,
-0.3400897, -0.3027072, -0.9330003, 0, 1, 0.2196078, 1,
-0.3300427, -0.1487109, -1.66731, 0, 1, 0.227451, 1,
-0.3291176, 1.176589, -0.9149264, 0, 1, 0.2313726, 1,
-0.3288114, -1.380038, -2.034662, 0, 1, 0.2392157, 1,
-0.3258736, -0.01305033, -0.5100958, 0, 1, 0.2431373, 1,
-0.3221373, 0.1981858, -0.3135836, 0, 1, 0.2509804, 1,
-0.3218136, -1.703839, -4.755901, 0, 1, 0.254902, 1,
-0.3195069, 1.794055, -1.401263, 0, 1, 0.2627451, 1,
-0.3194397, 0.152018, -2.003086, 0, 1, 0.2666667, 1,
-0.3193634, 0.3501657, -1.472967, 0, 1, 0.2745098, 1,
-0.3171845, 1.710415, -2.426867, 0, 1, 0.2784314, 1,
-0.316017, -0.09936192, -2.003702, 0, 1, 0.2862745, 1,
-0.3157912, 0.4510885, -0.1597831, 0, 1, 0.2901961, 1,
-0.3156395, 0.2874468, -0.9400664, 0, 1, 0.2980392, 1,
-0.3126186, 0.02004536, -3.142133, 0, 1, 0.3058824, 1,
-0.3124507, 0.0591177, -2.491336, 0, 1, 0.3098039, 1,
-0.3108492, -0.2917618, -2.995619, 0, 1, 0.3176471, 1,
-0.3089761, 0.05831333, -1.597614, 0, 1, 0.3215686, 1,
-0.3073553, 0.3858614, -2.139759, 0, 1, 0.3294118, 1,
-0.3047222, 1.661326, -0.8670736, 0, 1, 0.3333333, 1,
-0.298338, 1.762682, 1.15662, 0, 1, 0.3411765, 1,
-0.2973629, -0.2773599, -2.897259, 0, 1, 0.345098, 1,
-0.2973523, 0.9128568, -0.6781374, 0, 1, 0.3529412, 1,
-0.2949404, -1.446065, -2.314847, 0, 1, 0.3568628, 1,
-0.2925948, -1.186678, -1.931844, 0, 1, 0.3647059, 1,
-0.2871478, 0.1122989, -1.936184, 0, 1, 0.3686275, 1,
-0.2853288, -0.04620221, -2.172967, 0, 1, 0.3764706, 1,
-0.2841459, 0.8650734, 1.317462, 0, 1, 0.3803922, 1,
-0.2815581, 0.8249857, -1.553869, 0, 1, 0.3882353, 1,
-0.2791973, -0.008016086, 0.3849011, 0, 1, 0.3921569, 1,
-0.2694198, -2.064933, -3.507002, 0, 1, 0.4, 1,
-0.2691621, -0.7087263, -3.270051, 0, 1, 0.4078431, 1,
-0.268908, 0.2687981, -0.3088934, 0, 1, 0.4117647, 1,
-0.2688205, -2.007525, -2.773845, 0, 1, 0.4196078, 1,
-0.2618856, 0.7421257, -2.106394, 0, 1, 0.4235294, 1,
-0.2585564, 1.750389, 0.008361178, 0, 1, 0.4313726, 1,
-0.254231, 1.188257, -0.35066, 0, 1, 0.4352941, 1,
-0.2541497, 2.401469, -1.198364, 0, 1, 0.4431373, 1,
-0.2538447, -0.9816526, -1.047486, 0, 1, 0.4470588, 1,
-0.2492536, -0.2147268, -1.453454, 0, 1, 0.454902, 1,
-0.2486, 1.133026, -1.282001, 0, 1, 0.4588235, 1,
-0.2478031, 0.8258582, 0.08521278, 0, 1, 0.4666667, 1,
-0.2475017, 0.147273, 1.676322, 0, 1, 0.4705882, 1,
-0.2454188, 0.5900425, 1.100814, 0, 1, 0.4784314, 1,
-0.2402458, -1.828928, -1.840866, 0, 1, 0.4823529, 1,
-0.2389102, -0.07700952, -3.248207, 0, 1, 0.4901961, 1,
-0.2326186, -1.305169, -1.290001, 0, 1, 0.4941176, 1,
-0.2319571, 0.09265916, -1.037319, 0, 1, 0.5019608, 1,
-0.2304355, 0.164986, -1.147719, 0, 1, 0.509804, 1,
-0.2251815, -0.7511967, -2.138651, 0, 1, 0.5137255, 1,
-0.2227449, 0.0003988197, -0.2915803, 0, 1, 0.5215687, 1,
-0.2190999, -1.527245, -3.295573, 0, 1, 0.5254902, 1,
-0.2189816, -0.5956466, -4.621768, 0, 1, 0.5333334, 1,
-0.2180529, -1.587436, -1.099015, 0, 1, 0.5372549, 1,
-0.2174762, 0.1683588, -0.2287937, 0, 1, 0.5450981, 1,
-0.2148495, -1.317329, -4.39185, 0, 1, 0.5490196, 1,
-0.2139945, -0.4114021, -4.476277, 0, 1, 0.5568628, 1,
-0.2123065, -0.09144019, -1.322183, 0, 1, 0.5607843, 1,
-0.2081117, -0.4789806, -3.382385, 0, 1, 0.5686275, 1,
-0.2070946, -1.827858, -4.527759, 0, 1, 0.572549, 1,
-0.205274, 0.8260348, -1.410669, 0, 1, 0.5803922, 1,
-0.1971456, -0.08596825, -0.5822713, 0, 1, 0.5843138, 1,
-0.1968169, -0.6502942, -2.213492, 0, 1, 0.5921569, 1,
-0.1964564, 1.221922, -0.165713, 0, 1, 0.5960785, 1,
-0.1956114, -0.6983749, -2.338458, 0, 1, 0.6039216, 1,
-0.1946714, -0.6112777, -0.05411155, 0, 1, 0.6117647, 1,
-0.1935997, 0.05820904, -0.7741799, 0, 1, 0.6156863, 1,
-0.1928312, 0.497305, 0.985623, 0, 1, 0.6235294, 1,
-0.1905356, 1.664317, -1.031099, 0, 1, 0.627451, 1,
-0.1903162, -0.4720672, -3.016469, 0, 1, 0.6352941, 1,
-0.1834261, 0.4220278, -1.692777, 0, 1, 0.6392157, 1,
-0.1830601, 0.1391587, -0.4258246, 0, 1, 0.6470588, 1,
-0.182297, -1.594883, -3.352555, 0, 1, 0.6509804, 1,
-0.1800893, -0.5302754, -2.089008, 0, 1, 0.6588235, 1,
-0.1783713, -0.6015674, -4.594965, 0, 1, 0.6627451, 1,
-0.1758545, 0.3396122, -1.529845, 0, 1, 0.6705883, 1,
-0.1732999, -1.019918, -3.242663, 0, 1, 0.6745098, 1,
-0.1710057, 0.0196375, -1.978663, 0, 1, 0.682353, 1,
-0.1708259, -1.494318, -3.479681, 0, 1, 0.6862745, 1,
-0.1643764, 1.078582, 1.1894, 0, 1, 0.6941177, 1,
-0.1635119, -0.03525714, -2.40832, 0, 1, 0.7019608, 1,
-0.1630462, -2.372689, -2.341166, 0, 1, 0.7058824, 1,
-0.1591435, -0.1619278, -2.433326, 0, 1, 0.7137255, 1,
-0.1587021, -1.410402, -4.230783, 0, 1, 0.7176471, 1,
-0.1491448, 0.5458471, -0.9588788, 0, 1, 0.7254902, 1,
-0.1488051, -1.0031, -2.883649, 0, 1, 0.7294118, 1,
-0.1431947, -0.9129443, -4.416556, 0, 1, 0.7372549, 1,
-0.1393956, 0.5962455, -0.6209124, 0, 1, 0.7411765, 1,
-0.136579, -0.4100343, -3.042072, 0, 1, 0.7490196, 1,
-0.1361932, 0.5359201, -0.2072234, 0, 1, 0.7529412, 1,
-0.1343479, 2.53385, 0.0560124, 0, 1, 0.7607843, 1,
-0.1334442, -0.4691135, -2.991497, 0, 1, 0.7647059, 1,
-0.1258758, 0.2262263, -0.6171001, 0, 1, 0.772549, 1,
-0.1256324, 1.67672, 0.5813993, 0, 1, 0.7764706, 1,
-0.125026, -0.9765264, -0.9473484, 0, 1, 0.7843137, 1,
-0.1136559, 1.703883, 1.451064, 0, 1, 0.7882353, 1,
-0.1098338, -0.9698865, -2.660162, 0, 1, 0.7960784, 1,
-0.1058234, 0.1864246, -0.484138, 0, 1, 0.8039216, 1,
-0.1049118, -0.2939088, -3.837604, 0, 1, 0.8078431, 1,
-0.1007142, 1.262633, 0.8129691, 0, 1, 0.8156863, 1,
-0.1006925, -0.02756204, -2.029664, 0, 1, 0.8196079, 1,
-0.1006708, 0.9113514, 1.341335, 0, 1, 0.827451, 1,
-0.1003013, -0.7378634, -1.226031, 0, 1, 0.8313726, 1,
-0.09838662, -0.4433698, -3.206511, 0, 1, 0.8392157, 1,
-0.09479225, -0.4525241, -3.145915, 0, 1, 0.8431373, 1,
-0.09425315, -0.2912877, -5.944354, 0, 1, 0.8509804, 1,
-0.09332769, 1.722747, -0.7585331, 0, 1, 0.854902, 1,
-0.08884059, 0.9327338, -0.1731911, 0, 1, 0.8627451, 1,
-0.08789766, -0.4179633, -3.396409, 0, 1, 0.8666667, 1,
-0.08718742, 1.363601, 0.908897, 0, 1, 0.8745098, 1,
-0.08640145, 1.180203, -2.722515, 0, 1, 0.8784314, 1,
-0.08446909, 0.6076648, 0.08705437, 0, 1, 0.8862745, 1,
-0.08433654, 0.785284, -0.06881466, 0, 1, 0.8901961, 1,
-0.08381981, 0.1141466, -0.2637344, 0, 1, 0.8980392, 1,
-0.08012665, -0.4485423, -1.914874, 0, 1, 0.9058824, 1,
-0.07971314, -0.6469296, -3.892867, 0, 1, 0.9098039, 1,
-0.07725302, -0.3278982, -2.371326, 0, 1, 0.9176471, 1,
-0.07355671, 1.055369, 0.5208195, 0, 1, 0.9215686, 1,
-0.07328823, 1.305552, 0.1798169, 0, 1, 0.9294118, 1,
-0.06926327, -0.1212647, -3.739111, 0, 1, 0.9333333, 1,
-0.06382477, -0.1055275, -1.81166, 0, 1, 0.9411765, 1,
-0.06370192, -1.234505, -4.473607, 0, 1, 0.945098, 1,
-0.06162453, -0.850576, -2.074921, 0, 1, 0.9529412, 1,
-0.05929558, 0.5594726, -0.136366, 0, 1, 0.9568627, 1,
-0.05034474, 0.7422364, 1.574947, 0, 1, 0.9647059, 1,
-0.04915501, 0.6991529, -0.2900617, 0, 1, 0.9686275, 1,
-0.04420381, 0.6317809, -1.349888, 0, 1, 0.9764706, 1,
-0.04182559, -0.9473365, -2.593689, 0, 1, 0.9803922, 1,
-0.03420847, 1.141445, 0.4807717, 0, 1, 0.9882353, 1,
-0.03212694, 0.9844965, 0.7719421, 0, 1, 0.9921569, 1,
-0.02942541, 0.8120509, 1.435948, 0, 1, 1, 1,
-0.02911154, 0.3761548, -1.295299, 0, 0.9921569, 1, 1,
-0.02315963, 1.351025, 0.3676165, 0, 0.9882353, 1, 1,
-0.02303987, -0.6871678, -2.235135, 0, 0.9803922, 1, 1,
-0.01653322, 1.247279, -0.8652483, 0, 0.9764706, 1, 1,
-0.01571914, -0.8169975, -2.817144, 0, 0.9686275, 1, 1,
-0.009472035, -0.2225725, -5.141922, 0, 0.9647059, 1, 1,
-0.008445446, -0.8520859, -4.743527, 0, 0.9568627, 1, 1,
-0.001121789, 0.2557178, -0.1070759, 0, 0.9529412, 1, 1,
0.009095787, -0.04472486, 3.081138, 0, 0.945098, 1, 1,
0.01076072, 0.6550266, 1.974068, 0, 0.9411765, 1, 1,
0.01261867, -0.2317421, 3.401178, 0, 0.9333333, 1, 1,
0.01337102, -0.523844, 2.511416, 0, 0.9294118, 1, 1,
0.01422886, 0.3825679, 0.04103092, 0, 0.9215686, 1, 1,
0.02112024, 0.9397259, 1.351041, 0, 0.9176471, 1, 1,
0.0236567, -1.037516, 3.74335, 0, 0.9098039, 1, 1,
0.02712811, 2.048835, -0.3176399, 0, 0.9058824, 1, 1,
0.02858305, 1.273384, -0.3596179, 0, 0.8980392, 1, 1,
0.03451962, 0.7510817, 0.9866061, 0, 0.8901961, 1, 1,
0.03475486, -0.6195406, 3.576972, 0, 0.8862745, 1, 1,
0.04550945, 0.2139004, -1.597403, 0, 0.8784314, 1, 1,
0.04659054, -0.2817715, 2.186001, 0, 0.8745098, 1, 1,
0.0604578, 1.213273, -0.6781756, 0, 0.8666667, 1, 1,
0.0610662, 0.4625505, 1.069851, 0, 0.8627451, 1, 1,
0.06605369, -0.343103, 4.636224, 0, 0.854902, 1, 1,
0.07288951, -1.588495, 3.143445, 0, 0.8509804, 1, 1,
0.0776682, 1.234723, 0.08574324, 0, 0.8431373, 1, 1,
0.08885626, 0.161546, 0.5957121, 0, 0.8392157, 1, 1,
0.09555671, 1.211121, -0.3521833, 0, 0.8313726, 1, 1,
0.09576792, -0.2756873, 2.430524, 0, 0.827451, 1, 1,
0.09821793, 0.9238814, 0.4943685, 0, 0.8196079, 1, 1,
0.1045973, -1.386592, 4.199873, 0, 0.8156863, 1, 1,
0.1183935, -1.308608, 2.545757, 0, 0.8078431, 1, 1,
0.1184697, -0.07185286, 3.381088, 0, 0.8039216, 1, 1,
0.1251146, 0.7558618, -0.5172779, 0, 0.7960784, 1, 1,
0.1251153, 1.285038, -0.49396, 0, 0.7882353, 1, 1,
0.1252561, -1.352231, 1.522679, 0, 0.7843137, 1, 1,
0.1262465, -3.384218, 2.009511, 0, 0.7764706, 1, 1,
0.1279408, -0.4924493, 1.697827, 0, 0.772549, 1, 1,
0.1328133, 0.3437819, -0.479795, 0, 0.7647059, 1, 1,
0.1351537, -2.400081, 1.842314, 0, 0.7607843, 1, 1,
0.1371497, 0.9914204, 1.217233, 0, 0.7529412, 1, 1,
0.1389624, -0.006144919, 1.93897, 0, 0.7490196, 1, 1,
0.1394861, 0.09724943, 0.5873835, 0, 0.7411765, 1, 1,
0.1398364, -0.2248189, 2.43185, 0, 0.7372549, 1, 1,
0.1399969, -1.961459, 1.163185, 0, 0.7294118, 1, 1,
0.1472747, 0.6866436, 1.006578, 0, 0.7254902, 1, 1,
0.1491526, -0.5908197, 1.490042, 0, 0.7176471, 1, 1,
0.1508613, 0.9387512, 1.015952, 0, 0.7137255, 1, 1,
0.1515812, 1.387007, -1.561314, 0, 0.7058824, 1, 1,
0.152535, 0.3311338, -0.225564, 0, 0.6980392, 1, 1,
0.1592211, -0.8456023, 3.193157, 0, 0.6941177, 1, 1,
0.1610158, 0.5747221, 1.728802, 0, 0.6862745, 1, 1,
0.1628465, -2.022258, 1.967861, 0, 0.682353, 1, 1,
0.1632207, -0.03407995, 2.4244, 0, 0.6745098, 1, 1,
0.1647617, -0.6093121, 2.302831, 0, 0.6705883, 1, 1,
0.1663848, 0.1426446, 0.34633, 0, 0.6627451, 1, 1,
0.1675104, 1.38028, -0.3725235, 0, 0.6588235, 1, 1,
0.1691139, 0.556675, -0.04243221, 0, 0.6509804, 1, 1,
0.170738, 0.9471217, -0.2677338, 0, 0.6470588, 1, 1,
0.1714237, -0.3150607, 3.653274, 0, 0.6392157, 1, 1,
0.1719708, -1.093582, 2.990669, 0, 0.6352941, 1, 1,
0.1815671, -0.1446108, 3.13094, 0, 0.627451, 1, 1,
0.1839022, 1.082623, 1.469463, 0, 0.6235294, 1, 1,
0.196118, 0.9392261, 0.9919005, 0, 0.6156863, 1, 1,
0.1970596, 0.626184, 0.5873991, 0, 0.6117647, 1, 1,
0.1986421, -0.3063641, 1.931139, 0, 0.6039216, 1, 1,
0.2003785, 1.562461, 0.6610597, 0, 0.5960785, 1, 1,
0.2054032, 0.9221277, -0.3582598, 0, 0.5921569, 1, 1,
0.2081485, 0.6781147, 0.3051695, 0, 0.5843138, 1, 1,
0.2105574, -0.2132252, 2.628175, 0, 0.5803922, 1, 1,
0.2156181, -0.07832912, 1.164912, 0, 0.572549, 1, 1,
0.2160545, 1.525678, 1.158189, 0, 0.5686275, 1, 1,
0.2179804, 1.453166, -0.1737762, 0, 0.5607843, 1, 1,
0.2279448, 1.577029, -1.07735, 0, 0.5568628, 1, 1,
0.2281495, -0.4821791, 1.017316, 0, 0.5490196, 1, 1,
0.2356238, -0.7065077, 4.048484, 0, 0.5450981, 1, 1,
0.2359566, -0.01050903, 1.755572, 0, 0.5372549, 1, 1,
0.236581, -1.677158, 3.517392, 0, 0.5333334, 1, 1,
0.2367776, 1.279573, -0.2621697, 0, 0.5254902, 1, 1,
0.2371176, -0.9254512, 1.201561, 0, 0.5215687, 1, 1,
0.2390872, -0.02509148, 3.314699, 0, 0.5137255, 1, 1,
0.2401004, -1.691131, 4.036306, 0, 0.509804, 1, 1,
0.2410147, 1.83289, -0.5019789, 0, 0.5019608, 1, 1,
0.2466767, 1.105021, -1.415673, 0, 0.4941176, 1, 1,
0.2505378, -0.9784099, 3.59041, 0, 0.4901961, 1, 1,
0.2512871, 1.418137, 1.500804, 0, 0.4823529, 1, 1,
0.2526858, -0.0424164, -0.3761674, 0, 0.4784314, 1, 1,
0.2527116, 0.8467224, -1.113982, 0, 0.4705882, 1, 1,
0.2561786, -0.725523, 1.805023, 0, 0.4666667, 1, 1,
0.2576874, 1.373986, 1.471967, 0, 0.4588235, 1, 1,
0.2581979, 0.4892074, 0.9340707, 0, 0.454902, 1, 1,
0.2625844, -0.3954805, 3.684607, 0, 0.4470588, 1, 1,
0.2667606, 0.112638, 2.895556, 0, 0.4431373, 1, 1,
0.2693028, 1.598518, -0.2146928, 0, 0.4352941, 1, 1,
0.2725677, 1.357089, -0.4698426, 0, 0.4313726, 1, 1,
0.2725945, -0.03441244, 1.765337, 0, 0.4235294, 1, 1,
0.2746608, 1.489316, 0.9204573, 0, 0.4196078, 1, 1,
0.2826095, -0.4897173, 2.478773, 0, 0.4117647, 1, 1,
0.2841601, 1.634512, -0.8181602, 0, 0.4078431, 1, 1,
0.2854784, 1.998375, -1.554544, 0, 0.4, 1, 1,
0.2868563, -0.7382252, 3.727976, 0, 0.3921569, 1, 1,
0.2972982, 0.03437323, 2.676934, 0, 0.3882353, 1, 1,
0.2976664, -0.732439, 0.6011497, 0, 0.3803922, 1, 1,
0.2977607, -0.1290384, 1.325705, 0, 0.3764706, 1, 1,
0.3004006, 0.4399758, -2.308938, 0, 0.3686275, 1, 1,
0.3021464, 0.7648886, -1.413033, 0, 0.3647059, 1, 1,
0.302267, 2.055319, 0.4598143, 0, 0.3568628, 1, 1,
0.3031309, 0.03280975, -0.2149327, 0, 0.3529412, 1, 1,
0.3055246, 0.6641265, 0.1230036, 0, 0.345098, 1, 1,
0.3064928, 0.3980755, 0.3714439, 0, 0.3411765, 1, 1,
0.3068424, -0.6935641, 2.874692, 0, 0.3333333, 1, 1,
0.3070905, 1.015535, 2.580728, 0, 0.3294118, 1, 1,
0.316662, 0.2616011, 0.775224, 0, 0.3215686, 1, 1,
0.3168942, 0.3310632, 1.349586, 0, 0.3176471, 1, 1,
0.3221757, 0.5220664, 0.4485917, 0, 0.3098039, 1, 1,
0.3224555, -0.4061733, 3.214094, 0, 0.3058824, 1, 1,
0.3230968, -1.342276, 3.870106, 0, 0.2980392, 1, 1,
0.323843, 0.4656943, 0.1699732, 0, 0.2901961, 1, 1,
0.3257494, -0.778336, 1.891467, 0, 0.2862745, 1, 1,
0.325766, -0.3598791, 3.252885, 0, 0.2784314, 1, 1,
0.3272862, 1.969011, 0.4132811, 0, 0.2745098, 1, 1,
0.3294332, 0.4794693, -0.2713743, 0, 0.2666667, 1, 1,
0.3298663, 0.09011628, 1.233906, 0, 0.2627451, 1, 1,
0.330164, -1.176385, 0.4265947, 0, 0.254902, 1, 1,
0.3325677, -1.055576, 3.24999, 0, 0.2509804, 1, 1,
0.3326045, 0.9338437, -0.7320513, 0, 0.2431373, 1, 1,
0.3352709, 2.030943, -1.018546, 0, 0.2392157, 1, 1,
0.3378584, 2.05497, -1.821314, 0, 0.2313726, 1, 1,
0.3389505, 1.184524, 0.3156846, 0, 0.227451, 1, 1,
0.3401676, -1.023653, 3.867416, 0, 0.2196078, 1, 1,
0.342234, -0.3310775, 2.295369, 0, 0.2156863, 1, 1,
0.3565178, 0.2969254, 0.7580755, 0, 0.2078431, 1, 1,
0.3577273, -0.7669252, 0.6334859, 0, 0.2039216, 1, 1,
0.3612856, 0.4517511, -0.193534, 0, 0.1960784, 1, 1,
0.3628121, 1.606609, 0.567659, 0, 0.1882353, 1, 1,
0.3651164, 0.5582405, -1.606754, 0, 0.1843137, 1, 1,
0.3696456, -1.394733, 3.739444, 0, 0.1764706, 1, 1,
0.3697095, 1.119243, -0.622775, 0, 0.172549, 1, 1,
0.3724472, 0.428095, -0.1088115, 0, 0.1647059, 1, 1,
0.3738509, 0.6419281, 0.2540073, 0, 0.1607843, 1, 1,
0.3770845, -1.078628, 2.826626, 0, 0.1529412, 1, 1,
0.3778598, 0.3050752, 0.7386454, 0, 0.1490196, 1, 1,
0.3804985, 0.5062598, 1.039227, 0, 0.1411765, 1, 1,
0.383212, -0.2567006, 3.400559, 0, 0.1372549, 1, 1,
0.3851533, -0.1503823, 1.146717, 0, 0.1294118, 1, 1,
0.3855278, 0.4794337, 1.354, 0, 0.1254902, 1, 1,
0.3892751, -0.02744882, 1.471216, 0, 0.1176471, 1, 1,
0.3905421, 0.5152208, 2.374277, 0, 0.1137255, 1, 1,
0.3927117, 0.09470195, 1.747337, 0, 0.1058824, 1, 1,
0.398056, 1.063547, 1.503242, 0, 0.09803922, 1, 1,
0.398332, 1.157975, 1.412358, 0, 0.09411765, 1, 1,
0.4059568, 1.479238, -0.1976967, 0, 0.08627451, 1, 1,
0.4159536, -1.338394, 3.909501, 0, 0.08235294, 1, 1,
0.41793, -1.112869, 2.009208, 0, 0.07450981, 1, 1,
0.4193524, 0.8626127, 0.1768409, 0, 0.07058824, 1, 1,
0.4225307, -1.012036, 2.726176, 0, 0.0627451, 1, 1,
0.4228905, -1.086583, 2.903429, 0, 0.05882353, 1, 1,
0.425853, -0.7813296, 2.984911, 0, 0.05098039, 1, 1,
0.4295209, 1.607454, -0.7366921, 0, 0.04705882, 1, 1,
0.4327385, -0.4352509, 3.890868, 0, 0.03921569, 1, 1,
0.4406329, -1.002939, 3.784746, 0, 0.03529412, 1, 1,
0.4415603, -0.4479608, 3.984555, 0, 0.02745098, 1, 1,
0.4428663, -1.888129, 2.045607, 0, 0.02352941, 1, 1,
0.4444123, -0.4477914, 1.799761, 0, 0.01568628, 1, 1,
0.4444435, -0.5910667, 0.7310115, 0, 0.01176471, 1, 1,
0.4451536, -0.7029526, 4.320739, 0, 0.003921569, 1, 1,
0.4464338, -1.207081, 0.1578595, 0.003921569, 0, 1, 1,
0.4473684, -0.4283606, 2.281098, 0.007843138, 0, 1, 1,
0.4475419, -0.671882, 3.160156, 0.01568628, 0, 1, 1,
0.448437, -1.833297, 2.51556, 0.01960784, 0, 1, 1,
0.4491979, -0.7616466, 3.726088, 0.02745098, 0, 1, 1,
0.4506904, -3.368291, 3.412107, 0.03137255, 0, 1, 1,
0.4534936, 0.9254047, 0.481759, 0.03921569, 0, 1, 1,
0.4538693, 3.131619, 0.155474, 0.04313726, 0, 1, 1,
0.4539674, -0.4377917, 2.564978, 0.05098039, 0, 1, 1,
0.4609212, 0.0421918, -0.1462836, 0.05490196, 0, 1, 1,
0.4619693, -0.7064159, 2.942583, 0.0627451, 0, 1, 1,
0.4646949, -1.653777, 2.734708, 0.06666667, 0, 1, 1,
0.4695556, 0.4274178, 1.080953, 0.07450981, 0, 1, 1,
0.4723899, 0.1948448, -0.1162903, 0.07843138, 0, 1, 1,
0.4777719, 0.2495997, 1.345909, 0.08627451, 0, 1, 1,
0.4798847, -0.7710146, 3.73553, 0.09019608, 0, 1, 1,
0.480422, 0.6623343, 1.634894, 0.09803922, 0, 1, 1,
0.4884457, -1.143463, 3.505129, 0.1058824, 0, 1, 1,
0.4885657, -0.06470811, 0.91159, 0.1098039, 0, 1, 1,
0.4922763, -1.130658, 1.829682, 0.1176471, 0, 1, 1,
0.4962313, -0.5385541, 2.968619, 0.1215686, 0, 1, 1,
0.4971862, 1.294847, 0.2375546, 0.1294118, 0, 1, 1,
0.5027961, 1.064753, 0.3096142, 0.1333333, 0, 1, 1,
0.5043228, -0.4751222, 1.64542, 0.1411765, 0, 1, 1,
0.5084537, 0.340297, 0.2667021, 0.145098, 0, 1, 1,
0.5088464, -0.6710254, 0.6929816, 0.1529412, 0, 1, 1,
0.5088843, -1.681707, 1.51861, 0.1568628, 0, 1, 1,
0.51335, -0.2646313, 3.132061, 0.1647059, 0, 1, 1,
0.5134844, 0.01409095, 2.173723, 0.1686275, 0, 1, 1,
0.515005, 0.260853, 2.776974, 0.1764706, 0, 1, 1,
0.5155057, -0.2803542, 2.671751, 0.1803922, 0, 1, 1,
0.5200584, -0.9234394, 2.181413, 0.1882353, 0, 1, 1,
0.5249354, -0.7526408, 1.573648, 0.1921569, 0, 1, 1,
0.5265836, -0.325619, 1.733873, 0.2, 0, 1, 1,
0.5292997, -1.368011, 1.870587, 0.2078431, 0, 1, 1,
0.5314432, -0.6125556, 4.687917, 0.2117647, 0, 1, 1,
0.5330178, 1.046597, -0.7837185, 0.2196078, 0, 1, 1,
0.5391911, 0.1687011, 1.171426, 0.2235294, 0, 1, 1,
0.5425282, -1.142018, 0.9920608, 0.2313726, 0, 1, 1,
0.5476288, -0.2397457, -0.1977297, 0.2352941, 0, 1, 1,
0.5485403, 1.377251, 2.241502, 0.2431373, 0, 1, 1,
0.5491298, 0.769039, 1.799973, 0.2470588, 0, 1, 1,
0.550172, -3.390268, 2.543148, 0.254902, 0, 1, 1,
0.5507907, 1.156502, 0.3087387, 0.2588235, 0, 1, 1,
0.557651, 0.6220112, 2.162602, 0.2666667, 0, 1, 1,
0.5592204, -1.048223, 2.429027, 0.2705882, 0, 1, 1,
0.5652933, -0.3905025, 1.381436, 0.2784314, 0, 1, 1,
0.5905511, 0.2568254, 1.3274, 0.282353, 0, 1, 1,
0.5908368, -0.3608243, 3.133655, 0.2901961, 0, 1, 1,
0.5925868, -0.4743568, 4.008974, 0.2941177, 0, 1, 1,
0.6056178, 1.394857, -0.9682503, 0.3019608, 0, 1, 1,
0.6073793, -1.531031, 2.789175, 0.3098039, 0, 1, 1,
0.6101789, 0.8696463, 1.7743, 0.3137255, 0, 1, 1,
0.6135589, 0.1348817, -0.4280283, 0.3215686, 0, 1, 1,
0.6150116, 0.8472409, 0.9899759, 0.3254902, 0, 1, 1,
0.6156046, 1.179359, 2.286905, 0.3333333, 0, 1, 1,
0.6158166, -2.38031, 1.106765, 0.3372549, 0, 1, 1,
0.6175935, 1.336178, -0.05075325, 0.345098, 0, 1, 1,
0.6179135, -0.1857663, 1.627583, 0.3490196, 0, 1, 1,
0.6187086, -0.9010264, 3.197141, 0.3568628, 0, 1, 1,
0.6221847, 0.9095718, -0.464215, 0.3607843, 0, 1, 1,
0.6246486, -0.4260494, 1.68261, 0.3686275, 0, 1, 1,
0.6255261, 0.5305951, 0.8512229, 0.372549, 0, 1, 1,
0.6274359, 0.1220732, 0.4569026, 0.3803922, 0, 1, 1,
0.6339078, 0.3831354, 0.3255382, 0.3843137, 0, 1, 1,
0.6402878, 1.108727, 0.8307421, 0.3921569, 0, 1, 1,
0.6418278, -0.9642717, 2.717054, 0.3960784, 0, 1, 1,
0.6522634, 0.3881584, 1.326, 0.4039216, 0, 1, 1,
0.6533334, -1.320135, 1.451126, 0.4117647, 0, 1, 1,
0.673992, 2.067963, 1.262082, 0.4156863, 0, 1, 1,
0.6749541, 0.3687825, 1.267046, 0.4235294, 0, 1, 1,
0.6753123, 0.2997484, 0.9052192, 0.427451, 0, 1, 1,
0.6753952, -1.12415, 1.850562, 0.4352941, 0, 1, 1,
0.6776338, 2.006737, 1.13443, 0.4392157, 0, 1, 1,
0.6830707, -1.360828, 3.233672, 0.4470588, 0, 1, 1,
0.6865231, 0.7404124, 0.1809445, 0.4509804, 0, 1, 1,
0.6941476, 0.5244127, 1.907461, 0.4588235, 0, 1, 1,
0.698554, 0.3859412, 1.591709, 0.4627451, 0, 1, 1,
0.6989502, -0.9911067, 2.060899, 0.4705882, 0, 1, 1,
0.6992627, -0.8201323, 2.320421, 0.4745098, 0, 1, 1,
0.7037569, -0.2900458, 1.532977, 0.4823529, 0, 1, 1,
0.7123468, -0.2338133, 1.462494, 0.4862745, 0, 1, 1,
0.7206395, -0.2826203, 1.833223, 0.4941176, 0, 1, 1,
0.7224809, -0.4856041, 2.202969, 0.5019608, 0, 1, 1,
0.7232854, -1.019315, 2.151961, 0.5058824, 0, 1, 1,
0.725439, 0.141906, 1.971555, 0.5137255, 0, 1, 1,
0.7282639, -1.19684, 3.757615, 0.5176471, 0, 1, 1,
0.7293024, 2.269782, -1.446226, 0.5254902, 0, 1, 1,
0.7297583, -0.5583674, 2.575489, 0.5294118, 0, 1, 1,
0.7298943, -0.9819143, 2.80545, 0.5372549, 0, 1, 1,
0.7313858, -1.924287, 1.602702, 0.5411765, 0, 1, 1,
0.7332993, 1.1467, 1.192029, 0.5490196, 0, 1, 1,
0.7357518, -0.5475974, 0.929362, 0.5529412, 0, 1, 1,
0.7364568, -1.077818, 1.492754, 0.5607843, 0, 1, 1,
0.7444091, -0.9903574, 3.552558, 0.5647059, 0, 1, 1,
0.7465241, -1.672342, 1.827414, 0.572549, 0, 1, 1,
0.7485865, 1.869364, 0.3169974, 0.5764706, 0, 1, 1,
0.7512529, 1.152914, -0.1520418, 0.5843138, 0, 1, 1,
0.7513016, -0.9811943, 2.514652, 0.5882353, 0, 1, 1,
0.7524227, 1.052828, 1.145008, 0.5960785, 0, 1, 1,
0.7554898, -0.6120736, 0.4659073, 0.6039216, 0, 1, 1,
0.7568309, -0.115185, 2.934592, 0.6078432, 0, 1, 1,
0.7588494, -0.1431691, 1.510796, 0.6156863, 0, 1, 1,
0.7602685, 0.1386385, -0.8331433, 0.6196079, 0, 1, 1,
0.7648283, 0.04594903, 2.039961, 0.627451, 0, 1, 1,
0.7683547, 0.6918657, 1.213208, 0.6313726, 0, 1, 1,
0.7687595, -0.1664134, 1.057828, 0.6392157, 0, 1, 1,
0.7777793, -0.2426123, 4.335737, 0.6431373, 0, 1, 1,
0.7789744, -0.6683734, 2.218512, 0.6509804, 0, 1, 1,
0.7883226, -1.450368, 3.90887, 0.654902, 0, 1, 1,
0.7926161, 0.9440435, 0.6743448, 0.6627451, 0, 1, 1,
0.7949301, 0.2056019, -0.4814866, 0.6666667, 0, 1, 1,
0.7972329, -0.7656509, 4.077431, 0.6745098, 0, 1, 1,
0.7982901, 0.5514982, 1.521825, 0.6784314, 0, 1, 1,
0.7984973, -0.6760615, 3.127099, 0.6862745, 0, 1, 1,
0.7992711, -0.8885721, 0.4057445, 0.6901961, 0, 1, 1,
0.8018554, 1.298474, -0.155233, 0.6980392, 0, 1, 1,
0.8075849, -0.722901, 0.02681592, 0.7058824, 0, 1, 1,
0.8086503, -0.0006594881, 0.4974022, 0.7098039, 0, 1, 1,
0.8092856, 0.9435036, -0.09774161, 0.7176471, 0, 1, 1,
0.8210897, 1.166587, 1.32619, 0.7215686, 0, 1, 1,
0.823313, -0.4117126, 1.921847, 0.7294118, 0, 1, 1,
0.8310114, 0.4722155, 1.723584, 0.7333333, 0, 1, 1,
0.8318285, 0.9238101, 1.05404, 0.7411765, 0, 1, 1,
0.8332823, -0.03017304, 0.3608675, 0.7450981, 0, 1, 1,
0.8359652, 0.315053, 0.4475113, 0.7529412, 0, 1, 1,
0.8385237, 0.8773792, -1.000365, 0.7568628, 0, 1, 1,
0.8392809, -0.2787403, 1.534063, 0.7647059, 0, 1, 1,
0.8398482, -0.3247612, 4.042542, 0.7686275, 0, 1, 1,
0.8420643, -0.02086674, 1.335948, 0.7764706, 0, 1, 1,
0.845489, 1.081966, 0.02760677, 0.7803922, 0, 1, 1,
0.8501628, 0.5186868, -0.895339, 0.7882353, 0, 1, 1,
0.8608352, 0.7494664, 1.05968, 0.7921569, 0, 1, 1,
0.8626767, -1.439659, 1.694257, 0.8, 0, 1, 1,
0.8675573, -0.8513816, 1.046634, 0.8078431, 0, 1, 1,
0.8700023, 0.7142093, 2.271935, 0.8117647, 0, 1, 1,
0.8863947, -1.452926, 1.78785, 0.8196079, 0, 1, 1,
0.8907361, -1.187376, 1.95008, 0.8235294, 0, 1, 1,
0.8964442, 0.8625791, -0.7693178, 0.8313726, 0, 1, 1,
0.901077, 0.3678824, -0.6341047, 0.8352941, 0, 1, 1,
0.9097853, 2.043641, -0.9364032, 0.8431373, 0, 1, 1,
0.9107463, -0.634352, 1.654241, 0.8470588, 0, 1, 1,
0.9121241, 0.9185235, 0.8261285, 0.854902, 0, 1, 1,
0.9132152, 0.4690566, 0.3119903, 0.8588235, 0, 1, 1,
0.9134132, 1.112707, 1.383157, 0.8666667, 0, 1, 1,
0.9174173, 0.323721, 0.4023018, 0.8705882, 0, 1, 1,
0.9211156, 0.9448593, 0.7517059, 0.8784314, 0, 1, 1,
0.9516783, -0.392253, 3.381163, 0.8823529, 0, 1, 1,
0.9567919, -0.1476354, 2.291134, 0.8901961, 0, 1, 1,
0.9607124, 0.4086769, 1.12731, 0.8941177, 0, 1, 1,
0.9621843, -0.3076633, 3.849388, 0.9019608, 0, 1, 1,
0.9641877, 0.4366176, 2.161974, 0.9098039, 0, 1, 1,
0.9655176, -0.6000307, 3.334651, 0.9137255, 0, 1, 1,
0.9747372, -0.2079817, 0.3557611, 0.9215686, 0, 1, 1,
0.97688, 0.3923234, -0.1547242, 0.9254902, 0, 1, 1,
0.9788779, -1.361752, 3.031104, 0.9333333, 0, 1, 1,
0.9789001, 0.5345275, -0.05173038, 0.9372549, 0, 1, 1,
0.9821293, -0.3577923, 1.480929, 0.945098, 0, 1, 1,
0.9826253, -0.5862643, 1.345339, 0.9490196, 0, 1, 1,
0.9862248, -0.3808139, 1.800156, 0.9568627, 0, 1, 1,
0.9934976, -0.5248367, 2.234842, 0.9607843, 0, 1, 1,
1.000348, -0.7989317, 1.957811, 0.9686275, 0, 1, 1,
1.00079, -0.3577555, 2.047805, 0.972549, 0, 1, 1,
1.001056, -0.5506109, 2.953877, 0.9803922, 0, 1, 1,
1.003512, 0.8531625, 0.743197, 0.9843137, 0, 1, 1,
1.011995, 0.653172, 1.743214, 0.9921569, 0, 1, 1,
1.019957, -1.247811, 3.183815, 0.9960784, 0, 1, 1,
1.020388, -0.2605931, 1.856671, 1, 0, 0.9960784, 1,
1.033008, 1.31571, 1.874683, 1, 0, 0.9882353, 1,
1.033221, -0.008537827, 0.3630413, 1, 0, 0.9843137, 1,
1.03617, -0.04667442, 3.665101, 1, 0, 0.9764706, 1,
1.043288, -1.479495, 2.552402, 1, 0, 0.972549, 1,
1.052938, -1.149738, 2.468177, 1, 0, 0.9647059, 1,
1.057303, 0.5420082, 1.945144, 1, 0, 0.9607843, 1,
1.061929, 0.8660119, 1.29524, 1, 0, 0.9529412, 1,
1.070269, -0.767355, 1.196959, 1, 0, 0.9490196, 1,
1.075664, 0.3552331, 0.6711491, 1, 0, 0.9411765, 1,
1.077098, 1.425561, 1.824737, 1, 0, 0.9372549, 1,
1.078613, 1.486139, 0.8536825, 1, 0, 0.9294118, 1,
1.082775, -0.02127136, 2.061244, 1, 0, 0.9254902, 1,
1.0833, -0.09586092, 0.7649466, 1, 0, 0.9176471, 1,
1.08458, 0.686413, 2.50692, 1, 0, 0.9137255, 1,
1.086817, -0.3501852, 2.047361, 1, 0, 0.9058824, 1,
1.087124, -0.1826494, 1.979978, 1, 0, 0.9019608, 1,
1.087968, -0.7996307, 1.079915, 1, 0, 0.8941177, 1,
1.09122, 0.1464177, 2.281675, 1, 0, 0.8862745, 1,
1.094841, -0.5158344, 2.397942, 1, 0, 0.8823529, 1,
1.096854, 0.2045551, 1.870459, 1, 0, 0.8745098, 1,
1.101173, 0.4540745, 0.3242897, 1, 0, 0.8705882, 1,
1.105556, 0.89227, 0.6278167, 1, 0, 0.8627451, 1,
1.10638, 0.1234236, 1.147123, 1, 0, 0.8588235, 1,
1.109134, -0.9091011, 1.609896, 1, 0, 0.8509804, 1,
1.110847, 0.4124201, 2.972183, 1, 0, 0.8470588, 1,
1.11542, 0.7177844, 0.3017291, 1, 0, 0.8392157, 1,
1.115738, 0.995721, 0.8450813, 1, 0, 0.8352941, 1,
1.126014, 0.1523902, 2.767058, 1, 0, 0.827451, 1,
1.127101, 0.8989076, 1.143311, 1, 0, 0.8235294, 1,
1.12748, 0.5656449, 1.540445, 1, 0, 0.8156863, 1,
1.133895, -1.285876, 3.058111, 1, 0, 0.8117647, 1,
1.137017, -0.3684872, 0.6003375, 1, 0, 0.8039216, 1,
1.141721, -0.6622642, 2.824657, 1, 0, 0.7960784, 1,
1.14323, -0.9297358, 2.176172, 1, 0, 0.7921569, 1,
1.144944, -0.8397841, 1.840525, 1, 0, 0.7843137, 1,
1.150409, -1.451748, 3.6608, 1, 0, 0.7803922, 1,
1.150974, -0.6388802, 2.160547, 1, 0, 0.772549, 1,
1.157532, 0.3725448, 2.185202, 1, 0, 0.7686275, 1,
1.158038, -0.5230313, 0.5907515, 1, 0, 0.7607843, 1,
1.161047, -1.562466, 0.2991857, 1, 0, 0.7568628, 1,
1.163814, 1.163939, 1.163483, 1, 0, 0.7490196, 1,
1.164786, 0.2457018, 0.1167369, 1, 0, 0.7450981, 1,
1.169315, 1.194937, 2.353614, 1, 0, 0.7372549, 1,
1.173005, -1.47949, 2.536206, 1, 0, 0.7333333, 1,
1.174006, -0.1730657, 1.870625, 1, 0, 0.7254902, 1,
1.174059, -0.8056082, 2.238018, 1, 0, 0.7215686, 1,
1.186176, 0.737258, 0.1686626, 1, 0, 0.7137255, 1,
1.192753, -0.4656051, 1.853531, 1, 0, 0.7098039, 1,
1.193248, 0.5743423, 2.294708, 1, 0, 0.7019608, 1,
1.198148, 0.2773465, 2.490607, 1, 0, 0.6941177, 1,
1.198952, 1.9574, 1.107711, 1, 0, 0.6901961, 1,
1.205215, 1.263577, -0.285005, 1, 0, 0.682353, 1,
1.206604, -0.2380237, 2.340842, 1, 0, 0.6784314, 1,
1.208492, 0.5585867, 2.886254, 1, 0, 0.6705883, 1,
1.210404, -0.4051884, 1.175163, 1, 0, 0.6666667, 1,
1.227527, 0.4145061, 4.087896, 1, 0, 0.6588235, 1,
1.234903, 1.004525, 0.5263668, 1, 0, 0.654902, 1,
1.23572, -0.7082307, 3.218609, 1, 0, 0.6470588, 1,
1.249978, -1.033253, 2.09187, 1, 0, 0.6431373, 1,
1.254383, -0.1557354, 2.213152, 1, 0, 0.6352941, 1,
1.2567, -0.2715287, 2.38983, 1, 0, 0.6313726, 1,
1.258996, -0.06498078, 0.5581422, 1, 0, 0.6235294, 1,
1.26014, 0.471107, 1.695208, 1, 0, 0.6196079, 1,
1.290313, -0.3399388, 0.8840088, 1, 0, 0.6117647, 1,
1.300015, 0.255674, 0.3293343, 1, 0, 0.6078432, 1,
1.310891, 2.397753, 0.6656804, 1, 0, 0.6, 1,
1.311954, -0.477657, 1.430519, 1, 0, 0.5921569, 1,
1.329271, 0.9624672, 1.802677, 1, 0, 0.5882353, 1,
1.34603, -2.069303, 0.7938669, 1, 0, 0.5803922, 1,
1.346851, -0.4329647, 2.284237, 1, 0, 0.5764706, 1,
1.347049, 0.2342151, 0.5763708, 1, 0, 0.5686275, 1,
1.348326, 0.9232224, -0.1876248, 1, 0, 0.5647059, 1,
1.359271, 0.6495008, -0.2574286, 1, 0, 0.5568628, 1,
1.36511, 0.3849181, 1.040538, 1, 0, 0.5529412, 1,
1.369533, 0.6942518, 0.6271819, 1, 0, 0.5450981, 1,
1.383711, -0.1372942, 2.021731, 1, 0, 0.5411765, 1,
1.393394, 0.2785392, 0.0153094, 1, 0, 0.5333334, 1,
1.404593, 0.5003524, 1.796671, 1, 0, 0.5294118, 1,
1.404629, -1.066786, 2.698583, 1, 0, 0.5215687, 1,
1.408234, 0.04830365, 0.7410511, 1, 0, 0.5176471, 1,
1.421124, 2.395385, -0.2464409, 1, 0, 0.509804, 1,
1.423138, 1.11343, 0.2958762, 1, 0, 0.5058824, 1,
1.430556, -0.2189701, 0.09510403, 1, 0, 0.4980392, 1,
1.437309, -0.3985348, 0.1621798, 1, 0, 0.4901961, 1,
1.441442, -0.64351, 2.594815, 1, 0, 0.4862745, 1,
1.443541, 0.7995475, -0.2683592, 1, 0, 0.4784314, 1,
1.46473, -0.008656943, 1.585645, 1, 0, 0.4745098, 1,
1.465186, 0.3267799, 4.210093, 1, 0, 0.4666667, 1,
1.470131, -0.9252651, 2.188903, 1, 0, 0.4627451, 1,
1.471587, 0.8833975, 2.745308, 1, 0, 0.454902, 1,
1.475037, 0.9103546, 1.022, 1, 0, 0.4509804, 1,
1.485029, -1.061535, 2.597214, 1, 0, 0.4431373, 1,
1.486794, -0.04564551, -0.1406636, 1, 0, 0.4392157, 1,
1.493075, 1.306242, 0.5505177, 1, 0, 0.4313726, 1,
1.495358, 0.7836784, 0.600833, 1, 0, 0.427451, 1,
1.499368, -0.4636326, 2.352745, 1, 0, 0.4196078, 1,
1.501813, -0.4225608, 0.5134257, 1, 0, 0.4156863, 1,
1.50546, -0.02788704, 1.544081, 1, 0, 0.4078431, 1,
1.508965, 0.4185292, 0.4835603, 1, 0, 0.4039216, 1,
1.512024, -1.647506, 2.572504, 1, 0, 0.3960784, 1,
1.516446, -0.8735963, 1.048179, 1, 0, 0.3882353, 1,
1.555424, -0.5403011, 0.9464223, 1, 0, 0.3843137, 1,
1.558879, 1.661186, -0.7855577, 1, 0, 0.3764706, 1,
1.564641, 0.9687857, -0.2491782, 1, 0, 0.372549, 1,
1.588877, -1.920475, 3.356192, 1, 0, 0.3647059, 1,
1.592983, 0.4640304, 0.3466589, 1, 0, 0.3607843, 1,
1.597106, -1.115865, 2.630279, 1, 0, 0.3529412, 1,
1.604015, 1.570922, 0.3908499, 1, 0, 0.3490196, 1,
1.633524, 1.915741, 0.9562775, 1, 0, 0.3411765, 1,
1.643549, -0.852985, 1.362404, 1, 0, 0.3372549, 1,
1.654139, -0.7052822, 1.866907, 1, 0, 0.3294118, 1,
1.667774, 1.146898, 3.413569, 1, 0, 0.3254902, 1,
1.687725, -1.90414, 2.003726, 1, 0, 0.3176471, 1,
1.689201, -0.5202246, 1.242276, 1, 0, 0.3137255, 1,
1.692252, -0.9567269, 2.067741, 1, 0, 0.3058824, 1,
1.692272, -1.617011, 0.7232415, 1, 0, 0.2980392, 1,
1.712775, 0.7751406, 1.122991, 1, 0, 0.2941177, 1,
1.71874, 0.6085005, 0.7742363, 1, 0, 0.2862745, 1,
1.733064, -0.30644, 2.848992, 1, 0, 0.282353, 1,
1.736558, -0.7969158, 2.188246, 1, 0, 0.2745098, 1,
1.748224, -0.7090112, 2.302603, 1, 0, 0.2705882, 1,
1.759662, 1.798227, 0.2637666, 1, 0, 0.2627451, 1,
1.761546, -0.5297711, 2.197194, 1, 0, 0.2588235, 1,
1.777695, -0.06953777, 1.920738, 1, 0, 0.2509804, 1,
1.79699, -1.262607, 2.592843, 1, 0, 0.2470588, 1,
1.801975, 0.4182549, 2.233125, 1, 0, 0.2392157, 1,
1.8149, -0.09082839, 1.215133, 1, 0, 0.2352941, 1,
1.83899, 0.2287244, 1.228575, 1, 0, 0.227451, 1,
1.873473, 1.516516, 2.091266, 1, 0, 0.2235294, 1,
1.875681, -0.015762, 2.08949, 1, 0, 0.2156863, 1,
1.877807, 0.3593407, 0.9722543, 1, 0, 0.2117647, 1,
1.881822, -1.095057, -0.391148, 1, 0, 0.2039216, 1,
1.912725, 0.7296726, 1.840242, 1, 0, 0.1960784, 1,
1.914935, 0.4843768, 1.103343, 1, 0, 0.1921569, 1,
1.951751, -1.064584, 0.5414419, 1, 0, 0.1843137, 1,
1.955715, 0.7632483, 1.408236, 1, 0, 0.1803922, 1,
1.965807, 1.53766, -0.2114122, 1, 0, 0.172549, 1,
2.006989, 0.6049807, 0.7013466, 1, 0, 0.1686275, 1,
2.012134, 0.6287697, 2.091379, 1, 0, 0.1607843, 1,
2.045812, -0.6623142, 2.32694, 1, 0, 0.1568628, 1,
2.061356, -1.437679, 2.335443, 1, 0, 0.1490196, 1,
2.093102, -0.5938057, 1.786086, 1, 0, 0.145098, 1,
2.110599, 1.1743, -0.0160338, 1, 0, 0.1372549, 1,
2.11121, -0.1405173, 2.147796, 1, 0, 0.1333333, 1,
2.116936, -0.9680984, 2.293862, 1, 0, 0.1254902, 1,
2.128611, -2.197144, 2.138833, 1, 0, 0.1215686, 1,
2.141169, -1.523202, 1.484753, 1, 0, 0.1137255, 1,
2.149396, -1.814644, 2.559838, 1, 0, 0.1098039, 1,
2.152041, -0.6503059, 4.210541, 1, 0, 0.1019608, 1,
2.166564, -0.04008719, 0.8447112, 1, 0, 0.09411765, 1,
2.1722, -2.373324, 3.001961, 1, 0, 0.09019608, 1,
2.1968, -0.7387528, 1.037991, 1, 0, 0.08235294, 1,
2.218922, -0.1640402, 1.849152, 1, 0, 0.07843138, 1,
2.285497, 0.5149583, 1.341224, 1, 0, 0.07058824, 1,
2.31304, 1.358431, 0.2589981, 1, 0, 0.06666667, 1,
2.3273, 0.9707419, 1.374062, 1, 0, 0.05882353, 1,
2.355542, 0.3005634, 3.553316, 1, 0, 0.05490196, 1,
2.356157, 0.1659408, 2.457061, 1, 0, 0.04705882, 1,
2.378931, -0.9876173, 4.04689, 1, 0, 0.04313726, 1,
2.452152, 0.4587154, 2.165866, 1, 0, 0.03529412, 1,
2.511889, -1.333612, 2.979814, 1, 0, 0.03137255, 1,
2.551076, 1.672277, 1.12868, 1, 0, 0.02352941, 1,
2.640521, -1.146787, 2.365483, 1, 0, 0.01960784, 1,
2.657086, -1.654949, 2.746675, 1, 0, 0.01176471, 1,
2.81178, 0.3155986, 1.799623, 1, 0, 0.007843138, 1
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
-0.139686, -4.495728, -7.746524, 0, -0.5, 0.5, 0.5,
-0.139686, -4.495728, -7.746524, 1, -0.5, 0.5, 0.5,
-0.139686, -4.495728, -7.746524, 1, 1.5, 0.5, 0.5,
-0.139686, -4.495728, -7.746524, 0, 1.5, 0.5, 0.5
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
-4.091699, -0.1293246, -7.746524, 0, -0.5, 0.5, 0.5,
-4.091699, -0.1293246, -7.746524, 1, -0.5, 0.5, 0.5,
-4.091699, -0.1293246, -7.746524, 1, 1.5, 0.5, 0.5,
-4.091699, -0.1293246, -7.746524, 0, 1.5, 0.5, 0.5
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
-4.091699, -4.495728, -0.6282187, 0, -0.5, 0.5, 0.5,
-4.091699, -4.495728, -0.6282187, 1, -0.5, 0.5, 0.5,
-4.091699, -4.495728, -0.6282187, 1, 1.5, 0.5, 0.5,
-4.091699, -4.495728, -0.6282187, 0, 1.5, 0.5, 0.5
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
-3, -3.488096, -6.103838,
2, -3.488096, -6.103838,
-3, -3.488096, -6.103838,
-3, -3.656035, -6.377619,
-2, -3.488096, -6.103838,
-2, -3.656035, -6.377619,
-1, -3.488096, -6.103838,
-1, -3.656035, -6.377619,
0, -3.488096, -6.103838,
0, -3.656035, -6.377619,
1, -3.488096, -6.103838,
1, -3.656035, -6.377619,
2, -3.488096, -6.103838,
2, -3.656035, -6.377619
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
-3, -3.991912, -6.925181, 0, -0.5, 0.5, 0.5,
-3, -3.991912, -6.925181, 1, -0.5, 0.5, 0.5,
-3, -3.991912, -6.925181, 1, 1.5, 0.5, 0.5,
-3, -3.991912, -6.925181, 0, 1.5, 0.5, 0.5,
-2, -3.991912, -6.925181, 0, -0.5, 0.5, 0.5,
-2, -3.991912, -6.925181, 1, -0.5, 0.5, 0.5,
-2, -3.991912, -6.925181, 1, 1.5, 0.5, 0.5,
-2, -3.991912, -6.925181, 0, 1.5, 0.5, 0.5,
-1, -3.991912, -6.925181, 0, -0.5, 0.5, 0.5,
-1, -3.991912, -6.925181, 1, -0.5, 0.5, 0.5,
-1, -3.991912, -6.925181, 1, 1.5, 0.5, 0.5,
-1, -3.991912, -6.925181, 0, 1.5, 0.5, 0.5,
0, -3.991912, -6.925181, 0, -0.5, 0.5, 0.5,
0, -3.991912, -6.925181, 1, -0.5, 0.5, 0.5,
0, -3.991912, -6.925181, 1, 1.5, 0.5, 0.5,
0, -3.991912, -6.925181, 0, 1.5, 0.5, 0.5,
1, -3.991912, -6.925181, 0, -0.5, 0.5, 0.5,
1, -3.991912, -6.925181, 1, -0.5, 0.5, 0.5,
1, -3.991912, -6.925181, 1, 1.5, 0.5, 0.5,
1, -3.991912, -6.925181, 0, 1.5, 0.5, 0.5,
2, -3.991912, -6.925181, 0, -0.5, 0.5, 0.5,
2, -3.991912, -6.925181, 1, -0.5, 0.5, 0.5,
2, -3.991912, -6.925181, 1, 1.5, 0.5, 0.5,
2, -3.991912, -6.925181, 0, 1.5, 0.5, 0.5
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
-3.179696, -3, -6.103838,
-3.179696, 3, -6.103838,
-3.179696, -3, -6.103838,
-3.331696, -3, -6.377619,
-3.179696, -2, -6.103838,
-3.331696, -2, -6.377619,
-3.179696, -1, -6.103838,
-3.331696, -1, -6.377619,
-3.179696, 0, -6.103838,
-3.331696, 0, -6.377619,
-3.179696, 1, -6.103838,
-3.331696, 1, -6.377619,
-3.179696, 2, -6.103838,
-3.331696, 2, -6.377619,
-3.179696, 3, -6.103838,
-3.331696, 3, -6.377619
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
-3.635697, -3, -6.925181, 0, -0.5, 0.5, 0.5,
-3.635697, -3, -6.925181, 1, -0.5, 0.5, 0.5,
-3.635697, -3, -6.925181, 1, 1.5, 0.5, 0.5,
-3.635697, -3, -6.925181, 0, 1.5, 0.5, 0.5,
-3.635697, -2, -6.925181, 0, -0.5, 0.5, 0.5,
-3.635697, -2, -6.925181, 1, -0.5, 0.5, 0.5,
-3.635697, -2, -6.925181, 1, 1.5, 0.5, 0.5,
-3.635697, -2, -6.925181, 0, 1.5, 0.5, 0.5,
-3.635697, -1, -6.925181, 0, -0.5, 0.5, 0.5,
-3.635697, -1, -6.925181, 1, -0.5, 0.5, 0.5,
-3.635697, -1, -6.925181, 1, 1.5, 0.5, 0.5,
-3.635697, -1, -6.925181, 0, 1.5, 0.5, 0.5,
-3.635697, 0, -6.925181, 0, -0.5, 0.5, 0.5,
-3.635697, 0, -6.925181, 1, -0.5, 0.5, 0.5,
-3.635697, 0, -6.925181, 1, 1.5, 0.5, 0.5,
-3.635697, 0, -6.925181, 0, 1.5, 0.5, 0.5,
-3.635697, 1, -6.925181, 0, -0.5, 0.5, 0.5,
-3.635697, 1, -6.925181, 1, -0.5, 0.5, 0.5,
-3.635697, 1, -6.925181, 1, 1.5, 0.5, 0.5,
-3.635697, 1, -6.925181, 0, 1.5, 0.5, 0.5,
-3.635697, 2, -6.925181, 0, -0.5, 0.5, 0.5,
-3.635697, 2, -6.925181, 1, -0.5, 0.5, 0.5,
-3.635697, 2, -6.925181, 1, 1.5, 0.5, 0.5,
-3.635697, 2, -6.925181, 0, 1.5, 0.5, 0.5,
-3.635697, 3, -6.925181, 0, -0.5, 0.5, 0.5,
-3.635697, 3, -6.925181, 1, -0.5, 0.5, 0.5,
-3.635697, 3, -6.925181, 1, 1.5, 0.5, 0.5,
-3.635697, 3, -6.925181, 0, 1.5, 0.5, 0.5
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
-3.179696, -3.488096, -4,
-3.179696, -3.488096, 4,
-3.179696, -3.488096, -4,
-3.331696, -3.656035, -4,
-3.179696, -3.488096, -2,
-3.331696, -3.656035, -2,
-3.179696, -3.488096, 0,
-3.331696, -3.656035, 0,
-3.179696, -3.488096, 2,
-3.331696, -3.656035, 2,
-3.179696, -3.488096, 4,
-3.331696, -3.656035, 4
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
-3.635697, -3.991912, -4, 0, -0.5, 0.5, 0.5,
-3.635697, -3.991912, -4, 1, -0.5, 0.5, 0.5,
-3.635697, -3.991912, -4, 1, 1.5, 0.5, 0.5,
-3.635697, -3.991912, -4, 0, 1.5, 0.5, 0.5,
-3.635697, -3.991912, -2, 0, -0.5, 0.5, 0.5,
-3.635697, -3.991912, -2, 1, -0.5, 0.5, 0.5,
-3.635697, -3.991912, -2, 1, 1.5, 0.5, 0.5,
-3.635697, -3.991912, -2, 0, 1.5, 0.5, 0.5,
-3.635697, -3.991912, 0, 0, -0.5, 0.5, 0.5,
-3.635697, -3.991912, 0, 1, -0.5, 0.5, 0.5,
-3.635697, -3.991912, 0, 1, 1.5, 0.5, 0.5,
-3.635697, -3.991912, 0, 0, 1.5, 0.5, 0.5,
-3.635697, -3.991912, 2, 0, -0.5, 0.5, 0.5,
-3.635697, -3.991912, 2, 1, -0.5, 0.5, 0.5,
-3.635697, -3.991912, 2, 1, 1.5, 0.5, 0.5,
-3.635697, -3.991912, 2, 0, 1.5, 0.5, 0.5,
-3.635697, -3.991912, 4, 0, -0.5, 0.5, 0.5,
-3.635697, -3.991912, 4, 1, -0.5, 0.5, 0.5,
-3.635697, -3.991912, 4, 1, 1.5, 0.5, 0.5,
-3.635697, -3.991912, 4, 0, 1.5, 0.5, 0.5
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
-3.179696, -3.488096, -6.103838,
-3.179696, 3.229447, -6.103838,
-3.179696, -3.488096, 4.847401,
-3.179696, 3.229447, 4.847401,
-3.179696, -3.488096, -6.103838,
-3.179696, -3.488096, 4.847401,
-3.179696, 3.229447, -6.103838,
-3.179696, 3.229447, 4.847401,
-3.179696, -3.488096, -6.103838,
2.900324, -3.488096, -6.103838,
-3.179696, -3.488096, 4.847401,
2.900324, -3.488096, 4.847401,
-3.179696, 3.229447, -6.103838,
2.900324, 3.229447, -6.103838,
-3.179696, 3.229447, 4.847401,
2.900324, 3.229447, 4.847401,
2.900324, -3.488096, -6.103838,
2.900324, 3.229447, -6.103838,
2.900324, -3.488096, 4.847401,
2.900324, 3.229447, 4.847401,
2.900324, -3.488096, -6.103838,
2.900324, -3.488096, 4.847401,
2.900324, 3.229447, -6.103838,
2.900324, 3.229447, 4.847401
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
var radius = 7.589697;
var distance = 33.76742;
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
mvMatrix.translate( 0.139686, 0.1293246, 0.6282187 );
mvMatrix.scale( 1.349688, 1.221597, 0.7493334 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.76742);
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
difenacoum<-read.table("difenacoum.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-difenacoum$V2
```

```
## Error in eval(expr, envir, enclos): object 'difenacoum' not found
```

```r
y<-difenacoum$V3
```

```
## Error in eval(expr, envir, enclos): object 'difenacoum' not found
```

```r
z<-difenacoum$V4
```

```
## Error in eval(expr, envir, enclos): object 'difenacoum' not found
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
-3.091152, -0.1730618, -1.850912, 0, 0, 1, 1, 1,
-2.92066, 1.226894, -1.475558, 1, 0, 0, 1, 1,
-2.633843, -2.340256, -1.511176, 1, 0, 0, 1, 1,
-2.585531, 1.462257, -0.6378237, 1, 0, 0, 1, 1,
-2.556227, 2.885308, 0.7882673, 1, 0, 0, 1, 1,
-2.556145, -0.8899264, -1.970966, 1, 0, 0, 1, 1,
-2.550901, 1.218474, -1.150033, 0, 0, 0, 1, 1,
-2.486959, -0.7825055, -0.2059876, 0, 0, 0, 1, 1,
-2.394653, 0.02766513, -1.23354, 0, 0, 0, 1, 1,
-2.392331, 0.3335509, -3.133762, 0, 0, 0, 1, 1,
-2.390614, -0.0339827, -1.939922, 0, 0, 0, 1, 1,
-2.376087, -0.7597989, -2.035119, 0, 0, 0, 1, 1,
-2.322158, 1.314082, -0.2394325, 0, 0, 0, 1, 1,
-2.225236, -0.3966287, -2.604184, 1, 1, 1, 1, 1,
-2.219727, 0.9593766, -0.500838, 1, 1, 1, 1, 1,
-2.21911, -0.3019041, -1.100604, 1, 1, 1, 1, 1,
-2.18938, 1.755839, -0.9110696, 1, 1, 1, 1, 1,
-2.161989, -0.5417131, -1.705812, 1, 1, 1, 1, 1,
-2.125016, 1.862301, -1.349143, 1, 1, 1, 1, 1,
-2.123936, -0.6453249, -1.496336, 1, 1, 1, 1, 1,
-2.089456, -1.665391, -1.017956, 1, 1, 1, 1, 1,
-2.033323, -0.1470303, 0.1141881, 1, 1, 1, 1, 1,
-2.029979, 0.4036041, -0.1968709, 1, 1, 1, 1, 1,
-2.013638, 0.07299786, -0.1313253, 1, 1, 1, 1, 1,
-1.951509, -2.326256, -2.585536, 1, 1, 1, 1, 1,
-1.934415, -0.7964135, -2.69534, 1, 1, 1, 1, 1,
-1.925677, 0.1859598, -1.45756, 1, 1, 1, 1, 1,
-1.89655, 1.314621, -2.382794, 1, 1, 1, 1, 1,
-1.896501, -1.021917, -1.594077, 0, 0, 1, 1, 1,
-1.883834, -0.1596737, -2.226584, 1, 0, 0, 1, 1,
-1.872607, -0.5271076, -1.575531, 1, 0, 0, 1, 1,
-1.854985, 1.011345, -0.5201249, 1, 0, 0, 1, 1,
-1.852262, 0.5670846, -2.720848, 1, 0, 0, 1, 1,
-1.845308, -1.624245, -1.257266, 1, 0, 0, 1, 1,
-1.844306, 0.3025772, -1.778658, 0, 0, 0, 1, 1,
-1.843738, 0.3740479, -1.306775, 0, 0, 0, 1, 1,
-1.835476, 1.290005, -2.180202, 0, 0, 0, 1, 1,
-1.83053, 0.4230011, 0.1328233, 0, 0, 0, 1, 1,
-1.823305, -0.95342, -1.465713, 0, 0, 0, 1, 1,
-1.798378, -1.065985, -0.4508388, 0, 0, 0, 1, 1,
-1.79827, 1.425337, -1.595119, 0, 0, 0, 1, 1,
-1.785851, -1.360984, -2.417959, 1, 1, 1, 1, 1,
-1.780984, -2.129514, -1.876987, 1, 1, 1, 1, 1,
-1.762587, 0.05186335, -0.3445351, 1, 1, 1, 1, 1,
-1.757918, -0.6244825, -1.133812, 1, 1, 1, 1, 1,
-1.747454, -0.940945, -3.020024, 1, 1, 1, 1, 1,
-1.744356, -1.506467, -0.7223933, 1, 1, 1, 1, 1,
-1.732982, 0.7726496, 0.1090757, 1, 1, 1, 1, 1,
-1.722049, 0.4753891, -1.721341, 1, 1, 1, 1, 1,
-1.692911, 0.5259014, -0.6541122, 1, 1, 1, 1, 1,
-1.687417, -0.9544684, -2.215283, 1, 1, 1, 1, 1,
-1.670712, -0.299068, -1.539228, 1, 1, 1, 1, 1,
-1.657019, 0.7344351, -2.778633, 1, 1, 1, 1, 1,
-1.649805, -0.1258611, -1.951556, 1, 1, 1, 1, 1,
-1.637144, -0.4205426, -0.4375209, 1, 1, 1, 1, 1,
-1.622243, -1.829507, -1.445025, 1, 1, 1, 1, 1,
-1.610469, 1.784405, -1.116397, 0, 0, 1, 1, 1,
-1.607753, 0.6817362, -0.8165908, 1, 0, 0, 1, 1,
-1.571612, -1.137276, -3.02534, 1, 0, 0, 1, 1,
-1.534485, -0.5645275, 0.08394151, 1, 0, 0, 1, 1,
-1.532749, -0.1946034, -1.811914, 1, 0, 0, 1, 1,
-1.495253, -1.107786, -0.9823672, 1, 0, 0, 1, 1,
-1.483489, 1.334845, -1.717665, 0, 0, 0, 1, 1,
-1.476024, -0.8054479, -1.6362, 0, 0, 0, 1, 1,
-1.469123, -0.5899649, 0.8007283, 0, 0, 0, 1, 1,
-1.463726, -0.3127826, -1.804868, 0, 0, 0, 1, 1,
-1.456706, 1.302612, -0.04822246, 0, 0, 0, 1, 1,
-1.455091, -0.1638246, -1.172803, 0, 0, 0, 1, 1,
-1.453332, -0.9519799, -3.418042, 0, 0, 0, 1, 1,
-1.438358, 1.052064, -0.7394277, 1, 1, 1, 1, 1,
-1.438259, 0.3330255, -2.163292, 1, 1, 1, 1, 1,
-1.436345, 1.054279, -2.2549, 1, 1, 1, 1, 1,
-1.435161, -0.8136867, -1.979418, 1, 1, 1, 1, 1,
-1.42445, 0.2933187, -1.719966, 1, 1, 1, 1, 1,
-1.422109, 0.9703104, -0.7478942, 1, 1, 1, 1, 1,
-1.417138, 0.5623563, -0.08060359, 1, 1, 1, 1, 1,
-1.404019, -0.5058047, -1.782012, 1, 1, 1, 1, 1,
-1.400209, -0.5281618, -2.098446, 1, 1, 1, 1, 1,
-1.397849, -0.1092162, 0.7717699, 1, 1, 1, 1, 1,
-1.394659, -0.5491642, -0.6332181, 1, 1, 1, 1, 1,
-1.393244, 0.05863571, -1.264892, 1, 1, 1, 1, 1,
-1.38072, -0.2989682, -1.014591, 1, 1, 1, 1, 1,
-1.379977, -1.036986, -2.430574, 1, 1, 1, 1, 1,
-1.369613, 0.1491872, -1.122512, 1, 1, 1, 1, 1,
-1.36737, -0.5475903, -0.6506123, 0, 0, 1, 1, 1,
-1.359982, 0.6110641, -0.109457, 1, 0, 0, 1, 1,
-1.354967, -0.3495333, -2.108765, 1, 0, 0, 1, 1,
-1.348506, 0.872621, -1.406084, 1, 0, 0, 1, 1,
-1.346303, -0.7639642, -2.482825, 1, 0, 0, 1, 1,
-1.342208, -0.05957013, -0.8396738, 1, 0, 0, 1, 1,
-1.341103, 0.956811, -0.9362342, 0, 0, 0, 1, 1,
-1.328735, 0.1494485, 0.2544958, 0, 0, 0, 1, 1,
-1.320923, 0.8529504, -0.04996096, 0, 0, 0, 1, 1,
-1.302255, -0.5791017, -0.07180664, 0, 0, 0, 1, 1,
-1.301267, 0.9779695, 0.05670069, 0, 0, 0, 1, 1,
-1.299251, 0.0914308, -0.11383, 0, 0, 0, 1, 1,
-1.297383, 1.212802, -2.180437, 0, 0, 0, 1, 1,
-1.28628, 0.8148239, -0.4635917, 1, 1, 1, 1, 1,
-1.277784, 0.06306913, -0.5563204, 1, 1, 1, 1, 1,
-1.272923, 2.272306, -0.2799758, 1, 1, 1, 1, 1,
-1.271773, -0.02290929, -1.85425, 1, 1, 1, 1, 1,
-1.269466, -0.8313762, -3.471568, 1, 1, 1, 1, 1,
-1.267849, -0.462682, -2.757336, 1, 1, 1, 1, 1,
-1.263288, 0.6042522, -0.1496338, 1, 1, 1, 1, 1,
-1.26219, -0.003679881, -0.4983768, 1, 1, 1, 1, 1,
-1.261522, -1.398272, -2.871058, 1, 1, 1, 1, 1,
-1.260374, -0.8630168, -1.628279, 1, 1, 1, 1, 1,
-1.256561, -0.09814537, -2.882531, 1, 1, 1, 1, 1,
-1.241645, 0.8181581, -1.77512, 1, 1, 1, 1, 1,
-1.23831, 0.01086181, -1.46602, 1, 1, 1, 1, 1,
-1.237603, 0.2343815, -2.004209, 1, 1, 1, 1, 1,
-1.234627, -0.273098, -2.078268, 1, 1, 1, 1, 1,
-1.226632, -1.332073, -3.775727, 0, 0, 1, 1, 1,
-1.212898, 0.1789362, -1.590665, 1, 0, 0, 1, 1,
-1.21015, -1.41063, -2.390574, 1, 0, 0, 1, 1,
-1.207183, 0.1234704, -0.4280018, 1, 0, 0, 1, 1,
-1.202531, -1.241529, -3.219526, 1, 0, 0, 1, 1,
-1.202325, -0.002983375, -1.253994, 1, 0, 0, 1, 1,
-1.192678, -0.08151004, -2.414366, 0, 0, 0, 1, 1,
-1.177287, 0.8635816, -1.48712, 0, 0, 0, 1, 1,
-1.176325, -0.9201158, -1.650344, 0, 0, 0, 1, 1,
-1.173602, 0.4861935, 0.8053652, 0, 0, 0, 1, 1,
-1.169489, -2.289465, -2.32265, 0, 0, 0, 1, 1,
-1.168633, -0.4933111, -2.1576, 0, 0, 0, 1, 1,
-1.157459, 0.08897612, -1.04003, 0, 0, 0, 1, 1,
-1.154413, -0.005691221, -3.366711, 1, 1, 1, 1, 1,
-1.147074, 0.4893199, -1.022514, 1, 1, 1, 1, 1,
-1.146085, 0.2440907, -0.4937809, 1, 1, 1, 1, 1,
-1.143017, 1.49905, -1.597569, 1, 1, 1, 1, 1,
-1.141121, -0.4786742, -3.759285, 1, 1, 1, 1, 1,
-1.136545, 1.237951, -0.1851839, 1, 1, 1, 1, 1,
-1.135958, 2.159824, -0.8041302, 1, 1, 1, 1, 1,
-1.134802, -1.681203, -2.136539, 1, 1, 1, 1, 1,
-1.124992, 2.379306, -0.1213845, 1, 1, 1, 1, 1,
-1.123769, -1.99272, -2.577177, 1, 1, 1, 1, 1,
-1.11906, 0.7487498, 0.04749675, 1, 1, 1, 1, 1,
-1.110418, 0.4938623, -0.4149646, 1, 1, 1, 1, 1,
-1.10058, -0.4988809, -1.095922, 1, 1, 1, 1, 1,
-1.098273, 0.184994, -1.138338, 1, 1, 1, 1, 1,
-1.098142, 0.172501, -1.881927, 1, 1, 1, 1, 1,
-1.093101, 1.851627, -0.7071655, 0, 0, 1, 1, 1,
-1.091673, 1.343835, -1.324061, 1, 0, 0, 1, 1,
-1.077208, -0.319326, -2.114604, 1, 0, 0, 1, 1,
-1.07183, -1.561273, -1.57839, 1, 0, 0, 1, 1,
-1.068057, -0.901431, -2.218023, 1, 0, 0, 1, 1,
-1.065579, -0.8049797, -1.897114, 1, 0, 0, 1, 1,
-1.065489, -0.3997931, -0.3810701, 0, 0, 0, 1, 1,
-1.053869, 1.746131, -1.335548, 0, 0, 0, 1, 1,
-1.051371, 1.949723, 1.093433, 0, 0, 0, 1, 1,
-1.050569, -2.660701, -3.245042, 0, 0, 0, 1, 1,
-1.04695, -0.1556969, -0.1691951, 0, 0, 0, 1, 1,
-1.037338, 0.7804546, -2.87323, 0, 0, 0, 1, 1,
-1.020437, 1.028977, -2.062502, 0, 0, 0, 1, 1,
-1.019361, 0.1467587, -1.057089, 1, 1, 1, 1, 1,
-1.018628, 0.8245245, 0.2768434, 1, 1, 1, 1, 1,
-1.013939, 1.945272, 0.1045474, 1, 1, 1, 1, 1,
-0.9965967, 2.580564, -0.6145019, 1, 1, 1, 1, 1,
-0.994643, -0.7267606, -1.252884, 1, 1, 1, 1, 1,
-0.9928201, 0.6509791, -1.401353, 1, 1, 1, 1, 1,
-0.9884788, 1.811433, -0.00667371, 1, 1, 1, 1, 1,
-0.9865406, -0.6932472, -2.419049, 1, 1, 1, 1, 1,
-0.9792071, 0.0008099585, -1.815795, 1, 1, 1, 1, 1,
-0.9748655, -0.04645564, -1.046481, 1, 1, 1, 1, 1,
-0.9720709, 0.9594506, -0.248923, 1, 1, 1, 1, 1,
-0.9700884, -1.744194, -3.166663, 1, 1, 1, 1, 1,
-0.9699883, 0.2573441, -2.987013, 1, 1, 1, 1, 1,
-0.9621297, 0.09974097, -0.5894378, 1, 1, 1, 1, 1,
-0.9611191, 0.7921837, -1.67514, 1, 1, 1, 1, 1,
-0.9600562, 1.599559, -0.4884731, 0, 0, 1, 1, 1,
-0.958599, -0.3411755, -2.092823, 1, 0, 0, 1, 1,
-0.9580803, -0.7747827, -2.377276, 1, 0, 0, 1, 1,
-0.9492015, -1.038029, -1.959129, 1, 0, 0, 1, 1,
-0.9468915, -0.490974, -2.973305, 1, 0, 0, 1, 1,
-0.9445844, -0.5042339, -4.00715, 1, 0, 0, 1, 1,
-0.9441858, -0.6321194, -2.367726, 0, 0, 0, 1, 1,
-0.943406, -0.6102512, -1.658242, 0, 0, 0, 1, 1,
-0.9430011, 0.3426282, -1.270624, 0, 0, 0, 1, 1,
-0.9337872, -2.632358, -2.704038, 0, 0, 0, 1, 1,
-0.9244078, -0.6583595, -1.15354, 0, 0, 0, 1, 1,
-0.9104164, -0.05988375, -0.4745723, 0, 0, 0, 1, 1,
-0.9101676, 0.7743198, -1.641491, 0, 0, 0, 1, 1,
-0.9077653, -0.2516832, -1.23623, 1, 1, 1, 1, 1,
-0.9046882, 0.6154304, -0.2143563, 1, 1, 1, 1, 1,
-0.8999038, -0.2967485, -1.999756, 1, 1, 1, 1, 1,
-0.8822874, 0.9009949, -1.193199, 1, 1, 1, 1, 1,
-0.8807496, 0.05055436, -1.099514, 1, 1, 1, 1, 1,
-0.8805693, -1.533123, -2.761165, 1, 1, 1, 1, 1,
-0.8794045, -0.6839011, -0.5850819, 1, 1, 1, 1, 1,
-0.8784387, -0.05133997, -1.966362, 1, 1, 1, 1, 1,
-0.8718665, 1.336559, -0.6464518, 1, 1, 1, 1, 1,
-0.8666159, -0.5355105, -2.014798, 1, 1, 1, 1, 1,
-0.8624835, -1.041813, -2.582914, 1, 1, 1, 1, 1,
-0.8592719, 0.187493, -0.7923943, 1, 1, 1, 1, 1,
-0.8582074, -0.2867629, -1.855412, 1, 1, 1, 1, 1,
-0.8546043, 0.2985115, 0.727026, 1, 1, 1, 1, 1,
-0.8447503, -0.4299536, -3.330242, 1, 1, 1, 1, 1,
-0.8372459, -0.6264824, -2.724228, 0, 0, 1, 1, 1,
-0.8354027, 2.091683, -0.6204543, 1, 0, 0, 1, 1,
-0.8198546, 0.4249289, -0.9181412, 1, 0, 0, 1, 1,
-0.8130282, -0.08996857, -3.096322, 1, 0, 0, 1, 1,
-0.8122395, -0.07226008, -1.221858, 1, 0, 0, 1, 1,
-0.8091384, 0.5655966, -0.2073491, 1, 0, 0, 1, 1,
-0.8088738, -0.8819731, -3.915039, 0, 0, 0, 1, 1,
-0.8060872, -0.1959999, -2.625906, 0, 0, 0, 1, 1,
-0.805057, -1.85573, -3.579803, 0, 0, 0, 1, 1,
-0.8036684, 0.2182092, -2.428201, 0, 0, 0, 1, 1,
-0.8014557, -0.3272994, -2.248063, 0, 0, 0, 1, 1,
-0.7949646, -0.9585353, -4.071981, 0, 0, 0, 1, 1,
-0.792677, 0.5036998, -1.03589, 0, 0, 0, 1, 1,
-0.7896246, -1.390832, -2.743739, 1, 1, 1, 1, 1,
-0.7884451, 0.2384649, -0.1777689, 1, 1, 1, 1, 1,
-0.7873136, -0.03218199, -2.290421, 1, 1, 1, 1, 1,
-0.7865118, 0.4056703, -1.862274, 1, 1, 1, 1, 1,
-0.782734, 0.2255909, -1.396616, 1, 1, 1, 1, 1,
-0.7800885, 0.6222495, 0.05816198, 1, 1, 1, 1, 1,
-0.7754861, 0.8082702, -1.106084, 1, 1, 1, 1, 1,
-0.7697334, 1.047323, 0.2674218, 1, 1, 1, 1, 1,
-0.7684864, -0.3104753, 0.1910888, 1, 1, 1, 1, 1,
-0.7682638, -1.652478, -2.559872, 1, 1, 1, 1, 1,
-0.7641092, 0.1850619, 0.2512661, 1, 1, 1, 1, 1,
-0.7588438, -0.4339509, -0.9999948, 1, 1, 1, 1, 1,
-0.7556546, -2.169156, -2.623045, 1, 1, 1, 1, 1,
-0.755613, -0.4538583, -1.866061, 1, 1, 1, 1, 1,
-0.7525499, -0.9797596, -0.2753487, 1, 1, 1, 1, 1,
-0.744976, -2.253464, -5.340459, 0, 0, 1, 1, 1,
-0.7449511, 2.537322, -2.455734, 1, 0, 0, 1, 1,
-0.7420036, -0.1662282, -0.5982729, 1, 0, 0, 1, 1,
-0.7399779, 1.083154, -1.452394, 1, 0, 0, 1, 1,
-0.7267779, 1.991006, 0.768898, 1, 0, 0, 1, 1,
-0.7203126, 1.43699, -0.3089479, 1, 0, 0, 1, 1,
-0.7202326, 0.07574256, -0.95909, 0, 0, 0, 1, 1,
-0.7195167, 0.5032219, -0.7867165, 0, 0, 0, 1, 1,
-0.7147391, 1.358855, 0.003348469, 0, 0, 0, 1, 1,
-0.7121007, -1.044166, -1.979824, 0, 0, 0, 1, 1,
-0.7117056, -0.3581835, -2.184107, 0, 0, 0, 1, 1,
-0.7085679, 0.7768568, -0.1302563, 0, 0, 0, 1, 1,
-0.7084919, 1.348322, -0.625998, 0, 0, 0, 1, 1,
-0.7015415, 1.530236, 0.03758503, 1, 1, 1, 1, 1,
-0.6975884, -1.035269, -3.350506, 1, 1, 1, 1, 1,
-0.6927841, -0.933093, -1.490973, 1, 1, 1, 1, 1,
-0.6813863, -1.892476, -0.7197579, 1, 1, 1, 1, 1,
-0.6807826, -0.2007223, -0.9522628, 1, 1, 1, 1, 1,
-0.6773501, -0.1083611, -1.009597, 1, 1, 1, 1, 1,
-0.6759402, -0.8504318, -2.273959, 1, 1, 1, 1, 1,
-0.6756549, 0.4993004, -1.395542, 1, 1, 1, 1, 1,
-0.6746821, -1.484537, -2.031202, 1, 1, 1, 1, 1,
-0.674273, -1.428378, -3.554742, 1, 1, 1, 1, 1,
-0.6740285, -0.8791782, -1.339896, 1, 1, 1, 1, 1,
-0.6720901, 0.6414303, -1.558927, 1, 1, 1, 1, 1,
-0.6716556, -1.114356, -2.76176, 1, 1, 1, 1, 1,
-0.6702803, -1.375083, -3.976846, 1, 1, 1, 1, 1,
-0.669914, 2.056257, 0.8166805, 1, 1, 1, 1, 1,
-0.6695767, 1.547218, 0.7384914, 0, 0, 1, 1, 1,
-0.666329, -1.144853, -1.991993, 1, 0, 0, 1, 1,
-0.6634744, 0.09799246, -1.103411, 1, 0, 0, 1, 1,
-0.6615057, 1.099792, -0.3004721, 1, 0, 0, 1, 1,
-0.6609699, -1.1415, -0.2701695, 1, 0, 0, 1, 1,
-0.6476194, 1.951098, 0.5899621, 1, 0, 0, 1, 1,
-0.6395988, 0.3328757, -1.488485, 0, 0, 0, 1, 1,
-0.6372022, -0.3990202, -1.741326, 0, 0, 0, 1, 1,
-0.6337446, 0.993561, 0.4471715, 0, 0, 0, 1, 1,
-0.6334098, -0.2261938, -2.938183, 0, 0, 0, 1, 1,
-0.6330865, 0.4798119, -3.020274, 0, 0, 0, 1, 1,
-0.6282747, -0.104638, -1.08727, 0, 0, 0, 1, 1,
-0.6251819, -1.432492, -1.514077, 0, 0, 0, 1, 1,
-0.62366, -1.275057, -3.431302, 1, 1, 1, 1, 1,
-0.6233407, 0.9144777, 0.1827299, 1, 1, 1, 1, 1,
-0.6182376, -1.129051, -1.95618, 1, 1, 1, 1, 1,
-0.6166043, 1.057736, -0.04812085, 1, 1, 1, 1, 1,
-0.6077986, 1.030506, 0.3834445, 1, 1, 1, 1, 1,
-0.605012, 0.4071373, -1.407488, 1, 1, 1, 1, 1,
-0.604246, -2.572113, -2.135374, 1, 1, 1, 1, 1,
-0.6034354, 1.181869, -0.5993578, 1, 1, 1, 1, 1,
-0.5958287, -0.202276, -3.222315, 1, 1, 1, 1, 1,
-0.5925936, -0.5353118, -2.719424, 1, 1, 1, 1, 1,
-0.5787642, 1.017271, 2.971363, 1, 1, 1, 1, 1,
-0.5780096, -0.3051071, -2.440456, 1, 1, 1, 1, 1,
-0.5776491, 0.7905028, -1.231091, 1, 1, 1, 1, 1,
-0.57754, -0.08689103, -2.073781, 1, 1, 1, 1, 1,
-0.5757646, 1.090515, -0.1731578, 1, 1, 1, 1, 1,
-0.5755742, 0.2699541, -0.9323273, 0, 0, 1, 1, 1,
-0.5725375, -0.8892198, -3.506217, 1, 0, 0, 1, 1,
-0.5697756, 1.448596, -0.2906492, 1, 0, 0, 1, 1,
-0.5666909, 0.6612673, 1.347097, 1, 0, 0, 1, 1,
-0.5583191, 0.2401238, -0.7887217, 1, 0, 0, 1, 1,
-0.557604, 0.3629657, -2.154589, 1, 0, 0, 1, 1,
-0.5566747, 0.03105591, -3.687872, 0, 0, 0, 1, 1,
-0.5557546, -0.2628353, -2.474778, 0, 0, 0, 1, 1,
-0.5472369, -0.8351216, -2.032807, 0, 0, 0, 1, 1,
-0.5457639, -1.077979, -5.652841, 0, 0, 0, 1, 1,
-0.5430818, 1.40487, -0.7021679, 0, 0, 0, 1, 1,
-0.5397774, -0.01251291, -0.5618705, 0, 0, 0, 1, 1,
-0.5362929, 0.6217301, -1.073398, 0, 0, 0, 1, 1,
-0.5354832, 0.1073379, -2.077178, 1, 1, 1, 1, 1,
-0.5317703, -0.2995905, -1.44704, 1, 1, 1, 1, 1,
-0.522139, 1.313401, 0.3477937, 1, 1, 1, 1, 1,
-0.5142398, -0.5335919, -0.09442765, 1, 1, 1, 1, 1,
-0.5139096, -1.295535, -3.48612, 1, 1, 1, 1, 1,
-0.5041198, 0.7929028, -0.961782, 1, 1, 1, 1, 1,
-0.5039814, -0.9398224, -2.331489, 1, 1, 1, 1, 1,
-0.5035121, -0.1280937, -1.185059, 1, 1, 1, 1, 1,
-0.5024726, 0.5098124, -2.334862, 1, 1, 1, 1, 1,
-0.4988791, -0.4038047, -1.958009, 1, 1, 1, 1, 1,
-0.4967226, 0.6935157, -2.181246, 1, 1, 1, 1, 1,
-0.4904541, -0.5139837, -2.561161, 1, 1, 1, 1, 1,
-0.4897753, -1.000566, -1.548085, 1, 1, 1, 1, 1,
-0.4810337, 0.5977461, -2.860528, 1, 1, 1, 1, 1,
-0.479889, -2.413695, -3.217335, 1, 1, 1, 1, 1,
-0.4750023, 1.31779, -1.343946, 0, 0, 1, 1, 1,
-0.474376, -1.66022, -3.328598, 1, 0, 0, 1, 1,
-0.4738971, -0.5246826, -1.229553, 1, 0, 0, 1, 1,
-0.4721849, 0.8804743, -1.211741, 1, 0, 0, 1, 1,
-0.4679784, 1.003396, -1.070244, 1, 0, 0, 1, 1,
-0.4653184, 0.8140966, -1.448848, 1, 0, 0, 1, 1,
-0.4644679, 0.4801592, -0.08354641, 0, 0, 0, 1, 1,
-0.4632722, -1.139102, -2.895061, 0, 0, 0, 1, 1,
-0.4623312, 0.5213781, -1.881611, 0, 0, 0, 1, 1,
-0.4591383, 0.1926043, -0.2533126, 0, 0, 0, 1, 1,
-0.4582979, -0.0855214, -3.048742, 0, 0, 0, 1, 1,
-0.4559313, -0.2261913, -1.866107, 0, 0, 0, 1, 1,
-0.4488015, 0.3582745, -1.9146, 0, 0, 0, 1, 1,
-0.4454444, -0.9750771, -1.609134, 1, 1, 1, 1, 1,
-0.4393844, -0.6288319, -1.718382, 1, 1, 1, 1, 1,
-0.4389393, -0.06282131, 0.2329204, 1, 1, 1, 1, 1,
-0.4381712, 0.9962803, -0.07113209, 1, 1, 1, 1, 1,
-0.4372746, 1.175184, -0.8948764, 1, 1, 1, 1, 1,
-0.4368662, 0.7127948, -2.802531, 1, 1, 1, 1, 1,
-0.4368075, -0.6551504, -2.950356, 1, 1, 1, 1, 1,
-0.4352519, -1.113761, -3.298247, 1, 1, 1, 1, 1,
-0.4337797, 0.1195001, -1.481198, 1, 1, 1, 1, 1,
-0.4332635, -0.0004110702, -1.971767, 1, 1, 1, 1, 1,
-0.4330372, -0.03484936, -1.64913, 1, 1, 1, 1, 1,
-0.4282581, -1.65488, -3.047267, 1, 1, 1, 1, 1,
-0.4230402, 0.06289013, -0.2584735, 1, 1, 1, 1, 1,
-0.4210113, 1.466534, -1.343088, 1, 1, 1, 1, 1,
-0.419296, -0.5059073, -2.423357, 1, 1, 1, 1, 1,
-0.4187818, -1.016206, -3.383489, 0, 0, 1, 1, 1,
-0.4165216, -0.9739328, -2.986171, 1, 0, 0, 1, 1,
-0.4138122, 1.776665, 0.9642746, 1, 0, 0, 1, 1,
-0.412861, 0.223866, -1.495617, 1, 0, 0, 1, 1,
-0.4122729, 0.365456, 1.047358, 1, 0, 0, 1, 1,
-0.4105535, 1.054228, -1.42498, 1, 0, 0, 1, 1,
-0.4087834, 1.794246, -1.57106, 0, 0, 0, 1, 1,
-0.4087417, 1.092554, -0.597591, 0, 0, 0, 1, 1,
-0.4047729, -1.126818, -3.363882, 0, 0, 0, 1, 1,
-0.4022551, 2.185728, 0.2821837, 0, 0, 0, 1, 1,
-0.4011188, -0.495172, -3.060151, 0, 0, 0, 1, 1,
-0.3988477, 0.7325955, -1.694919, 0, 0, 0, 1, 1,
-0.397923, 0.1478849, -2.306517, 0, 0, 0, 1, 1,
-0.3976804, 1.525405, 0.5992216, 1, 1, 1, 1, 1,
-0.39697, 0.20869, -3.521684, 1, 1, 1, 1, 1,
-0.3908606, 1.878489, 1.040997, 1, 1, 1, 1, 1,
-0.3871606, -1.853408, -2.954554, 1, 1, 1, 1, 1,
-0.3834733, -0.8462819, -1.365184, 1, 1, 1, 1, 1,
-0.3799422, 0.659851, 0.780194, 1, 1, 1, 1, 1,
-0.3778755, 1.467707, -0.5247231, 1, 1, 1, 1, 1,
-0.3761278, -0.6334968, -1.236919, 1, 1, 1, 1, 1,
-0.3695133, -1.099778, -2.294957, 1, 1, 1, 1, 1,
-0.3678797, 0.1834364, -0.9526596, 1, 1, 1, 1, 1,
-0.3672289, -0.5068456, -2.773868, 1, 1, 1, 1, 1,
-0.366968, -0.8395758, -4.241276, 1, 1, 1, 1, 1,
-0.3651454, 1.072482, -1.72359, 1, 1, 1, 1, 1,
-0.3646642, -1.072956, -2.337697, 1, 1, 1, 1, 1,
-0.3608781, -1.05147, -2.3895, 1, 1, 1, 1, 1,
-0.3595485, -0.7709788, -2.314549, 0, 0, 1, 1, 1,
-0.355406, 1.631033, 0.1347792, 1, 0, 0, 1, 1,
-0.3538213, 1.182816, -1.22997, 1, 0, 0, 1, 1,
-0.3535846, 0.8152077, 0.3824228, 1, 0, 0, 1, 1,
-0.3523163, 0.8343208, 0.2301988, 1, 0, 0, 1, 1,
-0.3447221, -0.4466228, -2.699739, 1, 0, 0, 1, 1,
-0.3400897, -0.3027072, -0.9330003, 0, 0, 0, 1, 1,
-0.3300427, -0.1487109, -1.66731, 0, 0, 0, 1, 1,
-0.3291176, 1.176589, -0.9149264, 0, 0, 0, 1, 1,
-0.3288114, -1.380038, -2.034662, 0, 0, 0, 1, 1,
-0.3258736, -0.01305033, -0.5100958, 0, 0, 0, 1, 1,
-0.3221373, 0.1981858, -0.3135836, 0, 0, 0, 1, 1,
-0.3218136, -1.703839, -4.755901, 0, 0, 0, 1, 1,
-0.3195069, 1.794055, -1.401263, 1, 1, 1, 1, 1,
-0.3194397, 0.152018, -2.003086, 1, 1, 1, 1, 1,
-0.3193634, 0.3501657, -1.472967, 1, 1, 1, 1, 1,
-0.3171845, 1.710415, -2.426867, 1, 1, 1, 1, 1,
-0.316017, -0.09936192, -2.003702, 1, 1, 1, 1, 1,
-0.3157912, 0.4510885, -0.1597831, 1, 1, 1, 1, 1,
-0.3156395, 0.2874468, -0.9400664, 1, 1, 1, 1, 1,
-0.3126186, 0.02004536, -3.142133, 1, 1, 1, 1, 1,
-0.3124507, 0.0591177, -2.491336, 1, 1, 1, 1, 1,
-0.3108492, -0.2917618, -2.995619, 1, 1, 1, 1, 1,
-0.3089761, 0.05831333, -1.597614, 1, 1, 1, 1, 1,
-0.3073553, 0.3858614, -2.139759, 1, 1, 1, 1, 1,
-0.3047222, 1.661326, -0.8670736, 1, 1, 1, 1, 1,
-0.298338, 1.762682, 1.15662, 1, 1, 1, 1, 1,
-0.2973629, -0.2773599, -2.897259, 1, 1, 1, 1, 1,
-0.2973523, 0.9128568, -0.6781374, 0, 0, 1, 1, 1,
-0.2949404, -1.446065, -2.314847, 1, 0, 0, 1, 1,
-0.2925948, -1.186678, -1.931844, 1, 0, 0, 1, 1,
-0.2871478, 0.1122989, -1.936184, 1, 0, 0, 1, 1,
-0.2853288, -0.04620221, -2.172967, 1, 0, 0, 1, 1,
-0.2841459, 0.8650734, 1.317462, 1, 0, 0, 1, 1,
-0.2815581, 0.8249857, -1.553869, 0, 0, 0, 1, 1,
-0.2791973, -0.008016086, 0.3849011, 0, 0, 0, 1, 1,
-0.2694198, -2.064933, -3.507002, 0, 0, 0, 1, 1,
-0.2691621, -0.7087263, -3.270051, 0, 0, 0, 1, 1,
-0.268908, 0.2687981, -0.3088934, 0, 0, 0, 1, 1,
-0.2688205, -2.007525, -2.773845, 0, 0, 0, 1, 1,
-0.2618856, 0.7421257, -2.106394, 0, 0, 0, 1, 1,
-0.2585564, 1.750389, 0.008361178, 1, 1, 1, 1, 1,
-0.254231, 1.188257, -0.35066, 1, 1, 1, 1, 1,
-0.2541497, 2.401469, -1.198364, 1, 1, 1, 1, 1,
-0.2538447, -0.9816526, -1.047486, 1, 1, 1, 1, 1,
-0.2492536, -0.2147268, -1.453454, 1, 1, 1, 1, 1,
-0.2486, 1.133026, -1.282001, 1, 1, 1, 1, 1,
-0.2478031, 0.8258582, 0.08521278, 1, 1, 1, 1, 1,
-0.2475017, 0.147273, 1.676322, 1, 1, 1, 1, 1,
-0.2454188, 0.5900425, 1.100814, 1, 1, 1, 1, 1,
-0.2402458, -1.828928, -1.840866, 1, 1, 1, 1, 1,
-0.2389102, -0.07700952, -3.248207, 1, 1, 1, 1, 1,
-0.2326186, -1.305169, -1.290001, 1, 1, 1, 1, 1,
-0.2319571, 0.09265916, -1.037319, 1, 1, 1, 1, 1,
-0.2304355, 0.164986, -1.147719, 1, 1, 1, 1, 1,
-0.2251815, -0.7511967, -2.138651, 1, 1, 1, 1, 1,
-0.2227449, 0.0003988197, -0.2915803, 0, 0, 1, 1, 1,
-0.2190999, -1.527245, -3.295573, 1, 0, 0, 1, 1,
-0.2189816, -0.5956466, -4.621768, 1, 0, 0, 1, 1,
-0.2180529, -1.587436, -1.099015, 1, 0, 0, 1, 1,
-0.2174762, 0.1683588, -0.2287937, 1, 0, 0, 1, 1,
-0.2148495, -1.317329, -4.39185, 1, 0, 0, 1, 1,
-0.2139945, -0.4114021, -4.476277, 0, 0, 0, 1, 1,
-0.2123065, -0.09144019, -1.322183, 0, 0, 0, 1, 1,
-0.2081117, -0.4789806, -3.382385, 0, 0, 0, 1, 1,
-0.2070946, -1.827858, -4.527759, 0, 0, 0, 1, 1,
-0.205274, 0.8260348, -1.410669, 0, 0, 0, 1, 1,
-0.1971456, -0.08596825, -0.5822713, 0, 0, 0, 1, 1,
-0.1968169, -0.6502942, -2.213492, 0, 0, 0, 1, 1,
-0.1964564, 1.221922, -0.165713, 1, 1, 1, 1, 1,
-0.1956114, -0.6983749, -2.338458, 1, 1, 1, 1, 1,
-0.1946714, -0.6112777, -0.05411155, 1, 1, 1, 1, 1,
-0.1935997, 0.05820904, -0.7741799, 1, 1, 1, 1, 1,
-0.1928312, 0.497305, 0.985623, 1, 1, 1, 1, 1,
-0.1905356, 1.664317, -1.031099, 1, 1, 1, 1, 1,
-0.1903162, -0.4720672, -3.016469, 1, 1, 1, 1, 1,
-0.1834261, 0.4220278, -1.692777, 1, 1, 1, 1, 1,
-0.1830601, 0.1391587, -0.4258246, 1, 1, 1, 1, 1,
-0.182297, -1.594883, -3.352555, 1, 1, 1, 1, 1,
-0.1800893, -0.5302754, -2.089008, 1, 1, 1, 1, 1,
-0.1783713, -0.6015674, -4.594965, 1, 1, 1, 1, 1,
-0.1758545, 0.3396122, -1.529845, 1, 1, 1, 1, 1,
-0.1732999, -1.019918, -3.242663, 1, 1, 1, 1, 1,
-0.1710057, 0.0196375, -1.978663, 1, 1, 1, 1, 1,
-0.1708259, -1.494318, -3.479681, 0, 0, 1, 1, 1,
-0.1643764, 1.078582, 1.1894, 1, 0, 0, 1, 1,
-0.1635119, -0.03525714, -2.40832, 1, 0, 0, 1, 1,
-0.1630462, -2.372689, -2.341166, 1, 0, 0, 1, 1,
-0.1591435, -0.1619278, -2.433326, 1, 0, 0, 1, 1,
-0.1587021, -1.410402, -4.230783, 1, 0, 0, 1, 1,
-0.1491448, 0.5458471, -0.9588788, 0, 0, 0, 1, 1,
-0.1488051, -1.0031, -2.883649, 0, 0, 0, 1, 1,
-0.1431947, -0.9129443, -4.416556, 0, 0, 0, 1, 1,
-0.1393956, 0.5962455, -0.6209124, 0, 0, 0, 1, 1,
-0.136579, -0.4100343, -3.042072, 0, 0, 0, 1, 1,
-0.1361932, 0.5359201, -0.2072234, 0, 0, 0, 1, 1,
-0.1343479, 2.53385, 0.0560124, 0, 0, 0, 1, 1,
-0.1334442, -0.4691135, -2.991497, 1, 1, 1, 1, 1,
-0.1258758, 0.2262263, -0.6171001, 1, 1, 1, 1, 1,
-0.1256324, 1.67672, 0.5813993, 1, 1, 1, 1, 1,
-0.125026, -0.9765264, -0.9473484, 1, 1, 1, 1, 1,
-0.1136559, 1.703883, 1.451064, 1, 1, 1, 1, 1,
-0.1098338, -0.9698865, -2.660162, 1, 1, 1, 1, 1,
-0.1058234, 0.1864246, -0.484138, 1, 1, 1, 1, 1,
-0.1049118, -0.2939088, -3.837604, 1, 1, 1, 1, 1,
-0.1007142, 1.262633, 0.8129691, 1, 1, 1, 1, 1,
-0.1006925, -0.02756204, -2.029664, 1, 1, 1, 1, 1,
-0.1006708, 0.9113514, 1.341335, 1, 1, 1, 1, 1,
-0.1003013, -0.7378634, -1.226031, 1, 1, 1, 1, 1,
-0.09838662, -0.4433698, -3.206511, 1, 1, 1, 1, 1,
-0.09479225, -0.4525241, -3.145915, 1, 1, 1, 1, 1,
-0.09425315, -0.2912877, -5.944354, 1, 1, 1, 1, 1,
-0.09332769, 1.722747, -0.7585331, 0, 0, 1, 1, 1,
-0.08884059, 0.9327338, -0.1731911, 1, 0, 0, 1, 1,
-0.08789766, -0.4179633, -3.396409, 1, 0, 0, 1, 1,
-0.08718742, 1.363601, 0.908897, 1, 0, 0, 1, 1,
-0.08640145, 1.180203, -2.722515, 1, 0, 0, 1, 1,
-0.08446909, 0.6076648, 0.08705437, 1, 0, 0, 1, 1,
-0.08433654, 0.785284, -0.06881466, 0, 0, 0, 1, 1,
-0.08381981, 0.1141466, -0.2637344, 0, 0, 0, 1, 1,
-0.08012665, -0.4485423, -1.914874, 0, 0, 0, 1, 1,
-0.07971314, -0.6469296, -3.892867, 0, 0, 0, 1, 1,
-0.07725302, -0.3278982, -2.371326, 0, 0, 0, 1, 1,
-0.07355671, 1.055369, 0.5208195, 0, 0, 0, 1, 1,
-0.07328823, 1.305552, 0.1798169, 0, 0, 0, 1, 1,
-0.06926327, -0.1212647, -3.739111, 1, 1, 1, 1, 1,
-0.06382477, -0.1055275, -1.81166, 1, 1, 1, 1, 1,
-0.06370192, -1.234505, -4.473607, 1, 1, 1, 1, 1,
-0.06162453, -0.850576, -2.074921, 1, 1, 1, 1, 1,
-0.05929558, 0.5594726, -0.136366, 1, 1, 1, 1, 1,
-0.05034474, 0.7422364, 1.574947, 1, 1, 1, 1, 1,
-0.04915501, 0.6991529, -0.2900617, 1, 1, 1, 1, 1,
-0.04420381, 0.6317809, -1.349888, 1, 1, 1, 1, 1,
-0.04182559, -0.9473365, -2.593689, 1, 1, 1, 1, 1,
-0.03420847, 1.141445, 0.4807717, 1, 1, 1, 1, 1,
-0.03212694, 0.9844965, 0.7719421, 1, 1, 1, 1, 1,
-0.02942541, 0.8120509, 1.435948, 1, 1, 1, 1, 1,
-0.02911154, 0.3761548, -1.295299, 1, 1, 1, 1, 1,
-0.02315963, 1.351025, 0.3676165, 1, 1, 1, 1, 1,
-0.02303987, -0.6871678, -2.235135, 1, 1, 1, 1, 1,
-0.01653322, 1.247279, -0.8652483, 0, 0, 1, 1, 1,
-0.01571914, -0.8169975, -2.817144, 1, 0, 0, 1, 1,
-0.009472035, -0.2225725, -5.141922, 1, 0, 0, 1, 1,
-0.008445446, -0.8520859, -4.743527, 1, 0, 0, 1, 1,
-0.001121789, 0.2557178, -0.1070759, 1, 0, 0, 1, 1,
0.009095787, -0.04472486, 3.081138, 1, 0, 0, 1, 1,
0.01076072, 0.6550266, 1.974068, 0, 0, 0, 1, 1,
0.01261867, -0.2317421, 3.401178, 0, 0, 0, 1, 1,
0.01337102, -0.523844, 2.511416, 0, 0, 0, 1, 1,
0.01422886, 0.3825679, 0.04103092, 0, 0, 0, 1, 1,
0.02112024, 0.9397259, 1.351041, 0, 0, 0, 1, 1,
0.0236567, -1.037516, 3.74335, 0, 0, 0, 1, 1,
0.02712811, 2.048835, -0.3176399, 0, 0, 0, 1, 1,
0.02858305, 1.273384, -0.3596179, 1, 1, 1, 1, 1,
0.03451962, 0.7510817, 0.9866061, 1, 1, 1, 1, 1,
0.03475486, -0.6195406, 3.576972, 1, 1, 1, 1, 1,
0.04550945, 0.2139004, -1.597403, 1, 1, 1, 1, 1,
0.04659054, -0.2817715, 2.186001, 1, 1, 1, 1, 1,
0.0604578, 1.213273, -0.6781756, 1, 1, 1, 1, 1,
0.0610662, 0.4625505, 1.069851, 1, 1, 1, 1, 1,
0.06605369, -0.343103, 4.636224, 1, 1, 1, 1, 1,
0.07288951, -1.588495, 3.143445, 1, 1, 1, 1, 1,
0.0776682, 1.234723, 0.08574324, 1, 1, 1, 1, 1,
0.08885626, 0.161546, 0.5957121, 1, 1, 1, 1, 1,
0.09555671, 1.211121, -0.3521833, 1, 1, 1, 1, 1,
0.09576792, -0.2756873, 2.430524, 1, 1, 1, 1, 1,
0.09821793, 0.9238814, 0.4943685, 1, 1, 1, 1, 1,
0.1045973, -1.386592, 4.199873, 1, 1, 1, 1, 1,
0.1183935, -1.308608, 2.545757, 0, 0, 1, 1, 1,
0.1184697, -0.07185286, 3.381088, 1, 0, 0, 1, 1,
0.1251146, 0.7558618, -0.5172779, 1, 0, 0, 1, 1,
0.1251153, 1.285038, -0.49396, 1, 0, 0, 1, 1,
0.1252561, -1.352231, 1.522679, 1, 0, 0, 1, 1,
0.1262465, -3.384218, 2.009511, 1, 0, 0, 1, 1,
0.1279408, -0.4924493, 1.697827, 0, 0, 0, 1, 1,
0.1328133, 0.3437819, -0.479795, 0, 0, 0, 1, 1,
0.1351537, -2.400081, 1.842314, 0, 0, 0, 1, 1,
0.1371497, 0.9914204, 1.217233, 0, 0, 0, 1, 1,
0.1389624, -0.006144919, 1.93897, 0, 0, 0, 1, 1,
0.1394861, 0.09724943, 0.5873835, 0, 0, 0, 1, 1,
0.1398364, -0.2248189, 2.43185, 0, 0, 0, 1, 1,
0.1399969, -1.961459, 1.163185, 1, 1, 1, 1, 1,
0.1472747, 0.6866436, 1.006578, 1, 1, 1, 1, 1,
0.1491526, -0.5908197, 1.490042, 1, 1, 1, 1, 1,
0.1508613, 0.9387512, 1.015952, 1, 1, 1, 1, 1,
0.1515812, 1.387007, -1.561314, 1, 1, 1, 1, 1,
0.152535, 0.3311338, -0.225564, 1, 1, 1, 1, 1,
0.1592211, -0.8456023, 3.193157, 1, 1, 1, 1, 1,
0.1610158, 0.5747221, 1.728802, 1, 1, 1, 1, 1,
0.1628465, -2.022258, 1.967861, 1, 1, 1, 1, 1,
0.1632207, -0.03407995, 2.4244, 1, 1, 1, 1, 1,
0.1647617, -0.6093121, 2.302831, 1, 1, 1, 1, 1,
0.1663848, 0.1426446, 0.34633, 1, 1, 1, 1, 1,
0.1675104, 1.38028, -0.3725235, 1, 1, 1, 1, 1,
0.1691139, 0.556675, -0.04243221, 1, 1, 1, 1, 1,
0.170738, 0.9471217, -0.2677338, 1, 1, 1, 1, 1,
0.1714237, -0.3150607, 3.653274, 0, 0, 1, 1, 1,
0.1719708, -1.093582, 2.990669, 1, 0, 0, 1, 1,
0.1815671, -0.1446108, 3.13094, 1, 0, 0, 1, 1,
0.1839022, 1.082623, 1.469463, 1, 0, 0, 1, 1,
0.196118, 0.9392261, 0.9919005, 1, 0, 0, 1, 1,
0.1970596, 0.626184, 0.5873991, 1, 0, 0, 1, 1,
0.1986421, -0.3063641, 1.931139, 0, 0, 0, 1, 1,
0.2003785, 1.562461, 0.6610597, 0, 0, 0, 1, 1,
0.2054032, 0.9221277, -0.3582598, 0, 0, 0, 1, 1,
0.2081485, 0.6781147, 0.3051695, 0, 0, 0, 1, 1,
0.2105574, -0.2132252, 2.628175, 0, 0, 0, 1, 1,
0.2156181, -0.07832912, 1.164912, 0, 0, 0, 1, 1,
0.2160545, 1.525678, 1.158189, 0, 0, 0, 1, 1,
0.2179804, 1.453166, -0.1737762, 1, 1, 1, 1, 1,
0.2279448, 1.577029, -1.07735, 1, 1, 1, 1, 1,
0.2281495, -0.4821791, 1.017316, 1, 1, 1, 1, 1,
0.2356238, -0.7065077, 4.048484, 1, 1, 1, 1, 1,
0.2359566, -0.01050903, 1.755572, 1, 1, 1, 1, 1,
0.236581, -1.677158, 3.517392, 1, 1, 1, 1, 1,
0.2367776, 1.279573, -0.2621697, 1, 1, 1, 1, 1,
0.2371176, -0.9254512, 1.201561, 1, 1, 1, 1, 1,
0.2390872, -0.02509148, 3.314699, 1, 1, 1, 1, 1,
0.2401004, -1.691131, 4.036306, 1, 1, 1, 1, 1,
0.2410147, 1.83289, -0.5019789, 1, 1, 1, 1, 1,
0.2466767, 1.105021, -1.415673, 1, 1, 1, 1, 1,
0.2505378, -0.9784099, 3.59041, 1, 1, 1, 1, 1,
0.2512871, 1.418137, 1.500804, 1, 1, 1, 1, 1,
0.2526858, -0.0424164, -0.3761674, 1, 1, 1, 1, 1,
0.2527116, 0.8467224, -1.113982, 0, 0, 1, 1, 1,
0.2561786, -0.725523, 1.805023, 1, 0, 0, 1, 1,
0.2576874, 1.373986, 1.471967, 1, 0, 0, 1, 1,
0.2581979, 0.4892074, 0.9340707, 1, 0, 0, 1, 1,
0.2625844, -0.3954805, 3.684607, 1, 0, 0, 1, 1,
0.2667606, 0.112638, 2.895556, 1, 0, 0, 1, 1,
0.2693028, 1.598518, -0.2146928, 0, 0, 0, 1, 1,
0.2725677, 1.357089, -0.4698426, 0, 0, 0, 1, 1,
0.2725945, -0.03441244, 1.765337, 0, 0, 0, 1, 1,
0.2746608, 1.489316, 0.9204573, 0, 0, 0, 1, 1,
0.2826095, -0.4897173, 2.478773, 0, 0, 0, 1, 1,
0.2841601, 1.634512, -0.8181602, 0, 0, 0, 1, 1,
0.2854784, 1.998375, -1.554544, 0, 0, 0, 1, 1,
0.2868563, -0.7382252, 3.727976, 1, 1, 1, 1, 1,
0.2972982, 0.03437323, 2.676934, 1, 1, 1, 1, 1,
0.2976664, -0.732439, 0.6011497, 1, 1, 1, 1, 1,
0.2977607, -0.1290384, 1.325705, 1, 1, 1, 1, 1,
0.3004006, 0.4399758, -2.308938, 1, 1, 1, 1, 1,
0.3021464, 0.7648886, -1.413033, 1, 1, 1, 1, 1,
0.302267, 2.055319, 0.4598143, 1, 1, 1, 1, 1,
0.3031309, 0.03280975, -0.2149327, 1, 1, 1, 1, 1,
0.3055246, 0.6641265, 0.1230036, 1, 1, 1, 1, 1,
0.3064928, 0.3980755, 0.3714439, 1, 1, 1, 1, 1,
0.3068424, -0.6935641, 2.874692, 1, 1, 1, 1, 1,
0.3070905, 1.015535, 2.580728, 1, 1, 1, 1, 1,
0.316662, 0.2616011, 0.775224, 1, 1, 1, 1, 1,
0.3168942, 0.3310632, 1.349586, 1, 1, 1, 1, 1,
0.3221757, 0.5220664, 0.4485917, 1, 1, 1, 1, 1,
0.3224555, -0.4061733, 3.214094, 0, 0, 1, 1, 1,
0.3230968, -1.342276, 3.870106, 1, 0, 0, 1, 1,
0.323843, 0.4656943, 0.1699732, 1, 0, 0, 1, 1,
0.3257494, -0.778336, 1.891467, 1, 0, 0, 1, 1,
0.325766, -0.3598791, 3.252885, 1, 0, 0, 1, 1,
0.3272862, 1.969011, 0.4132811, 1, 0, 0, 1, 1,
0.3294332, 0.4794693, -0.2713743, 0, 0, 0, 1, 1,
0.3298663, 0.09011628, 1.233906, 0, 0, 0, 1, 1,
0.330164, -1.176385, 0.4265947, 0, 0, 0, 1, 1,
0.3325677, -1.055576, 3.24999, 0, 0, 0, 1, 1,
0.3326045, 0.9338437, -0.7320513, 0, 0, 0, 1, 1,
0.3352709, 2.030943, -1.018546, 0, 0, 0, 1, 1,
0.3378584, 2.05497, -1.821314, 0, 0, 0, 1, 1,
0.3389505, 1.184524, 0.3156846, 1, 1, 1, 1, 1,
0.3401676, -1.023653, 3.867416, 1, 1, 1, 1, 1,
0.342234, -0.3310775, 2.295369, 1, 1, 1, 1, 1,
0.3565178, 0.2969254, 0.7580755, 1, 1, 1, 1, 1,
0.3577273, -0.7669252, 0.6334859, 1, 1, 1, 1, 1,
0.3612856, 0.4517511, -0.193534, 1, 1, 1, 1, 1,
0.3628121, 1.606609, 0.567659, 1, 1, 1, 1, 1,
0.3651164, 0.5582405, -1.606754, 1, 1, 1, 1, 1,
0.3696456, -1.394733, 3.739444, 1, 1, 1, 1, 1,
0.3697095, 1.119243, -0.622775, 1, 1, 1, 1, 1,
0.3724472, 0.428095, -0.1088115, 1, 1, 1, 1, 1,
0.3738509, 0.6419281, 0.2540073, 1, 1, 1, 1, 1,
0.3770845, -1.078628, 2.826626, 1, 1, 1, 1, 1,
0.3778598, 0.3050752, 0.7386454, 1, 1, 1, 1, 1,
0.3804985, 0.5062598, 1.039227, 1, 1, 1, 1, 1,
0.383212, -0.2567006, 3.400559, 0, 0, 1, 1, 1,
0.3851533, -0.1503823, 1.146717, 1, 0, 0, 1, 1,
0.3855278, 0.4794337, 1.354, 1, 0, 0, 1, 1,
0.3892751, -0.02744882, 1.471216, 1, 0, 0, 1, 1,
0.3905421, 0.5152208, 2.374277, 1, 0, 0, 1, 1,
0.3927117, 0.09470195, 1.747337, 1, 0, 0, 1, 1,
0.398056, 1.063547, 1.503242, 0, 0, 0, 1, 1,
0.398332, 1.157975, 1.412358, 0, 0, 0, 1, 1,
0.4059568, 1.479238, -0.1976967, 0, 0, 0, 1, 1,
0.4159536, -1.338394, 3.909501, 0, 0, 0, 1, 1,
0.41793, -1.112869, 2.009208, 0, 0, 0, 1, 1,
0.4193524, 0.8626127, 0.1768409, 0, 0, 0, 1, 1,
0.4225307, -1.012036, 2.726176, 0, 0, 0, 1, 1,
0.4228905, -1.086583, 2.903429, 1, 1, 1, 1, 1,
0.425853, -0.7813296, 2.984911, 1, 1, 1, 1, 1,
0.4295209, 1.607454, -0.7366921, 1, 1, 1, 1, 1,
0.4327385, -0.4352509, 3.890868, 1, 1, 1, 1, 1,
0.4406329, -1.002939, 3.784746, 1, 1, 1, 1, 1,
0.4415603, -0.4479608, 3.984555, 1, 1, 1, 1, 1,
0.4428663, -1.888129, 2.045607, 1, 1, 1, 1, 1,
0.4444123, -0.4477914, 1.799761, 1, 1, 1, 1, 1,
0.4444435, -0.5910667, 0.7310115, 1, 1, 1, 1, 1,
0.4451536, -0.7029526, 4.320739, 1, 1, 1, 1, 1,
0.4464338, -1.207081, 0.1578595, 1, 1, 1, 1, 1,
0.4473684, -0.4283606, 2.281098, 1, 1, 1, 1, 1,
0.4475419, -0.671882, 3.160156, 1, 1, 1, 1, 1,
0.448437, -1.833297, 2.51556, 1, 1, 1, 1, 1,
0.4491979, -0.7616466, 3.726088, 1, 1, 1, 1, 1,
0.4506904, -3.368291, 3.412107, 0, 0, 1, 1, 1,
0.4534936, 0.9254047, 0.481759, 1, 0, 0, 1, 1,
0.4538693, 3.131619, 0.155474, 1, 0, 0, 1, 1,
0.4539674, -0.4377917, 2.564978, 1, 0, 0, 1, 1,
0.4609212, 0.0421918, -0.1462836, 1, 0, 0, 1, 1,
0.4619693, -0.7064159, 2.942583, 1, 0, 0, 1, 1,
0.4646949, -1.653777, 2.734708, 0, 0, 0, 1, 1,
0.4695556, 0.4274178, 1.080953, 0, 0, 0, 1, 1,
0.4723899, 0.1948448, -0.1162903, 0, 0, 0, 1, 1,
0.4777719, 0.2495997, 1.345909, 0, 0, 0, 1, 1,
0.4798847, -0.7710146, 3.73553, 0, 0, 0, 1, 1,
0.480422, 0.6623343, 1.634894, 0, 0, 0, 1, 1,
0.4884457, -1.143463, 3.505129, 0, 0, 0, 1, 1,
0.4885657, -0.06470811, 0.91159, 1, 1, 1, 1, 1,
0.4922763, -1.130658, 1.829682, 1, 1, 1, 1, 1,
0.4962313, -0.5385541, 2.968619, 1, 1, 1, 1, 1,
0.4971862, 1.294847, 0.2375546, 1, 1, 1, 1, 1,
0.5027961, 1.064753, 0.3096142, 1, 1, 1, 1, 1,
0.5043228, -0.4751222, 1.64542, 1, 1, 1, 1, 1,
0.5084537, 0.340297, 0.2667021, 1, 1, 1, 1, 1,
0.5088464, -0.6710254, 0.6929816, 1, 1, 1, 1, 1,
0.5088843, -1.681707, 1.51861, 1, 1, 1, 1, 1,
0.51335, -0.2646313, 3.132061, 1, 1, 1, 1, 1,
0.5134844, 0.01409095, 2.173723, 1, 1, 1, 1, 1,
0.515005, 0.260853, 2.776974, 1, 1, 1, 1, 1,
0.5155057, -0.2803542, 2.671751, 1, 1, 1, 1, 1,
0.5200584, -0.9234394, 2.181413, 1, 1, 1, 1, 1,
0.5249354, -0.7526408, 1.573648, 1, 1, 1, 1, 1,
0.5265836, -0.325619, 1.733873, 0, 0, 1, 1, 1,
0.5292997, -1.368011, 1.870587, 1, 0, 0, 1, 1,
0.5314432, -0.6125556, 4.687917, 1, 0, 0, 1, 1,
0.5330178, 1.046597, -0.7837185, 1, 0, 0, 1, 1,
0.5391911, 0.1687011, 1.171426, 1, 0, 0, 1, 1,
0.5425282, -1.142018, 0.9920608, 1, 0, 0, 1, 1,
0.5476288, -0.2397457, -0.1977297, 0, 0, 0, 1, 1,
0.5485403, 1.377251, 2.241502, 0, 0, 0, 1, 1,
0.5491298, 0.769039, 1.799973, 0, 0, 0, 1, 1,
0.550172, -3.390268, 2.543148, 0, 0, 0, 1, 1,
0.5507907, 1.156502, 0.3087387, 0, 0, 0, 1, 1,
0.557651, 0.6220112, 2.162602, 0, 0, 0, 1, 1,
0.5592204, -1.048223, 2.429027, 0, 0, 0, 1, 1,
0.5652933, -0.3905025, 1.381436, 1, 1, 1, 1, 1,
0.5905511, 0.2568254, 1.3274, 1, 1, 1, 1, 1,
0.5908368, -0.3608243, 3.133655, 1, 1, 1, 1, 1,
0.5925868, -0.4743568, 4.008974, 1, 1, 1, 1, 1,
0.6056178, 1.394857, -0.9682503, 1, 1, 1, 1, 1,
0.6073793, -1.531031, 2.789175, 1, 1, 1, 1, 1,
0.6101789, 0.8696463, 1.7743, 1, 1, 1, 1, 1,
0.6135589, 0.1348817, -0.4280283, 1, 1, 1, 1, 1,
0.6150116, 0.8472409, 0.9899759, 1, 1, 1, 1, 1,
0.6156046, 1.179359, 2.286905, 1, 1, 1, 1, 1,
0.6158166, -2.38031, 1.106765, 1, 1, 1, 1, 1,
0.6175935, 1.336178, -0.05075325, 1, 1, 1, 1, 1,
0.6179135, -0.1857663, 1.627583, 1, 1, 1, 1, 1,
0.6187086, -0.9010264, 3.197141, 1, 1, 1, 1, 1,
0.6221847, 0.9095718, -0.464215, 1, 1, 1, 1, 1,
0.6246486, -0.4260494, 1.68261, 0, 0, 1, 1, 1,
0.6255261, 0.5305951, 0.8512229, 1, 0, 0, 1, 1,
0.6274359, 0.1220732, 0.4569026, 1, 0, 0, 1, 1,
0.6339078, 0.3831354, 0.3255382, 1, 0, 0, 1, 1,
0.6402878, 1.108727, 0.8307421, 1, 0, 0, 1, 1,
0.6418278, -0.9642717, 2.717054, 1, 0, 0, 1, 1,
0.6522634, 0.3881584, 1.326, 0, 0, 0, 1, 1,
0.6533334, -1.320135, 1.451126, 0, 0, 0, 1, 1,
0.673992, 2.067963, 1.262082, 0, 0, 0, 1, 1,
0.6749541, 0.3687825, 1.267046, 0, 0, 0, 1, 1,
0.6753123, 0.2997484, 0.9052192, 0, 0, 0, 1, 1,
0.6753952, -1.12415, 1.850562, 0, 0, 0, 1, 1,
0.6776338, 2.006737, 1.13443, 0, 0, 0, 1, 1,
0.6830707, -1.360828, 3.233672, 1, 1, 1, 1, 1,
0.6865231, 0.7404124, 0.1809445, 1, 1, 1, 1, 1,
0.6941476, 0.5244127, 1.907461, 1, 1, 1, 1, 1,
0.698554, 0.3859412, 1.591709, 1, 1, 1, 1, 1,
0.6989502, -0.9911067, 2.060899, 1, 1, 1, 1, 1,
0.6992627, -0.8201323, 2.320421, 1, 1, 1, 1, 1,
0.7037569, -0.2900458, 1.532977, 1, 1, 1, 1, 1,
0.7123468, -0.2338133, 1.462494, 1, 1, 1, 1, 1,
0.7206395, -0.2826203, 1.833223, 1, 1, 1, 1, 1,
0.7224809, -0.4856041, 2.202969, 1, 1, 1, 1, 1,
0.7232854, -1.019315, 2.151961, 1, 1, 1, 1, 1,
0.725439, 0.141906, 1.971555, 1, 1, 1, 1, 1,
0.7282639, -1.19684, 3.757615, 1, 1, 1, 1, 1,
0.7293024, 2.269782, -1.446226, 1, 1, 1, 1, 1,
0.7297583, -0.5583674, 2.575489, 1, 1, 1, 1, 1,
0.7298943, -0.9819143, 2.80545, 0, 0, 1, 1, 1,
0.7313858, -1.924287, 1.602702, 1, 0, 0, 1, 1,
0.7332993, 1.1467, 1.192029, 1, 0, 0, 1, 1,
0.7357518, -0.5475974, 0.929362, 1, 0, 0, 1, 1,
0.7364568, -1.077818, 1.492754, 1, 0, 0, 1, 1,
0.7444091, -0.9903574, 3.552558, 1, 0, 0, 1, 1,
0.7465241, -1.672342, 1.827414, 0, 0, 0, 1, 1,
0.7485865, 1.869364, 0.3169974, 0, 0, 0, 1, 1,
0.7512529, 1.152914, -0.1520418, 0, 0, 0, 1, 1,
0.7513016, -0.9811943, 2.514652, 0, 0, 0, 1, 1,
0.7524227, 1.052828, 1.145008, 0, 0, 0, 1, 1,
0.7554898, -0.6120736, 0.4659073, 0, 0, 0, 1, 1,
0.7568309, -0.115185, 2.934592, 0, 0, 0, 1, 1,
0.7588494, -0.1431691, 1.510796, 1, 1, 1, 1, 1,
0.7602685, 0.1386385, -0.8331433, 1, 1, 1, 1, 1,
0.7648283, 0.04594903, 2.039961, 1, 1, 1, 1, 1,
0.7683547, 0.6918657, 1.213208, 1, 1, 1, 1, 1,
0.7687595, -0.1664134, 1.057828, 1, 1, 1, 1, 1,
0.7777793, -0.2426123, 4.335737, 1, 1, 1, 1, 1,
0.7789744, -0.6683734, 2.218512, 1, 1, 1, 1, 1,
0.7883226, -1.450368, 3.90887, 1, 1, 1, 1, 1,
0.7926161, 0.9440435, 0.6743448, 1, 1, 1, 1, 1,
0.7949301, 0.2056019, -0.4814866, 1, 1, 1, 1, 1,
0.7972329, -0.7656509, 4.077431, 1, 1, 1, 1, 1,
0.7982901, 0.5514982, 1.521825, 1, 1, 1, 1, 1,
0.7984973, -0.6760615, 3.127099, 1, 1, 1, 1, 1,
0.7992711, -0.8885721, 0.4057445, 1, 1, 1, 1, 1,
0.8018554, 1.298474, -0.155233, 1, 1, 1, 1, 1,
0.8075849, -0.722901, 0.02681592, 0, 0, 1, 1, 1,
0.8086503, -0.0006594881, 0.4974022, 1, 0, 0, 1, 1,
0.8092856, 0.9435036, -0.09774161, 1, 0, 0, 1, 1,
0.8210897, 1.166587, 1.32619, 1, 0, 0, 1, 1,
0.823313, -0.4117126, 1.921847, 1, 0, 0, 1, 1,
0.8310114, 0.4722155, 1.723584, 1, 0, 0, 1, 1,
0.8318285, 0.9238101, 1.05404, 0, 0, 0, 1, 1,
0.8332823, -0.03017304, 0.3608675, 0, 0, 0, 1, 1,
0.8359652, 0.315053, 0.4475113, 0, 0, 0, 1, 1,
0.8385237, 0.8773792, -1.000365, 0, 0, 0, 1, 1,
0.8392809, -0.2787403, 1.534063, 0, 0, 0, 1, 1,
0.8398482, -0.3247612, 4.042542, 0, 0, 0, 1, 1,
0.8420643, -0.02086674, 1.335948, 0, 0, 0, 1, 1,
0.845489, 1.081966, 0.02760677, 1, 1, 1, 1, 1,
0.8501628, 0.5186868, -0.895339, 1, 1, 1, 1, 1,
0.8608352, 0.7494664, 1.05968, 1, 1, 1, 1, 1,
0.8626767, -1.439659, 1.694257, 1, 1, 1, 1, 1,
0.8675573, -0.8513816, 1.046634, 1, 1, 1, 1, 1,
0.8700023, 0.7142093, 2.271935, 1, 1, 1, 1, 1,
0.8863947, -1.452926, 1.78785, 1, 1, 1, 1, 1,
0.8907361, -1.187376, 1.95008, 1, 1, 1, 1, 1,
0.8964442, 0.8625791, -0.7693178, 1, 1, 1, 1, 1,
0.901077, 0.3678824, -0.6341047, 1, 1, 1, 1, 1,
0.9097853, 2.043641, -0.9364032, 1, 1, 1, 1, 1,
0.9107463, -0.634352, 1.654241, 1, 1, 1, 1, 1,
0.9121241, 0.9185235, 0.8261285, 1, 1, 1, 1, 1,
0.9132152, 0.4690566, 0.3119903, 1, 1, 1, 1, 1,
0.9134132, 1.112707, 1.383157, 1, 1, 1, 1, 1,
0.9174173, 0.323721, 0.4023018, 0, 0, 1, 1, 1,
0.9211156, 0.9448593, 0.7517059, 1, 0, 0, 1, 1,
0.9516783, -0.392253, 3.381163, 1, 0, 0, 1, 1,
0.9567919, -0.1476354, 2.291134, 1, 0, 0, 1, 1,
0.9607124, 0.4086769, 1.12731, 1, 0, 0, 1, 1,
0.9621843, -0.3076633, 3.849388, 1, 0, 0, 1, 1,
0.9641877, 0.4366176, 2.161974, 0, 0, 0, 1, 1,
0.9655176, -0.6000307, 3.334651, 0, 0, 0, 1, 1,
0.9747372, -0.2079817, 0.3557611, 0, 0, 0, 1, 1,
0.97688, 0.3923234, -0.1547242, 0, 0, 0, 1, 1,
0.9788779, -1.361752, 3.031104, 0, 0, 0, 1, 1,
0.9789001, 0.5345275, -0.05173038, 0, 0, 0, 1, 1,
0.9821293, -0.3577923, 1.480929, 0, 0, 0, 1, 1,
0.9826253, -0.5862643, 1.345339, 1, 1, 1, 1, 1,
0.9862248, -0.3808139, 1.800156, 1, 1, 1, 1, 1,
0.9934976, -0.5248367, 2.234842, 1, 1, 1, 1, 1,
1.000348, -0.7989317, 1.957811, 1, 1, 1, 1, 1,
1.00079, -0.3577555, 2.047805, 1, 1, 1, 1, 1,
1.001056, -0.5506109, 2.953877, 1, 1, 1, 1, 1,
1.003512, 0.8531625, 0.743197, 1, 1, 1, 1, 1,
1.011995, 0.653172, 1.743214, 1, 1, 1, 1, 1,
1.019957, -1.247811, 3.183815, 1, 1, 1, 1, 1,
1.020388, -0.2605931, 1.856671, 1, 1, 1, 1, 1,
1.033008, 1.31571, 1.874683, 1, 1, 1, 1, 1,
1.033221, -0.008537827, 0.3630413, 1, 1, 1, 1, 1,
1.03617, -0.04667442, 3.665101, 1, 1, 1, 1, 1,
1.043288, -1.479495, 2.552402, 1, 1, 1, 1, 1,
1.052938, -1.149738, 2.468177, 1, 1, 1, 1, 1,
1.057303, 0.5420082, 1.945144, 0, 0, 1, 1, 1,
1.061929, 0.8660119, 1.29524, 1, 0, 0, 1, 1,
1.070269, -0.767355, 1.196959, 1, 0, 0, 1, 1,
1.075664, 0.3552331, 0.6711491, 1, 0, 0, 1, 1,
1.077098, 1.425561, 1.824737, 1, 0, 0, 1, 1,
1.078613, 1.486139, 0.8536825, 1, 0, 0, 1, 1,
1.082775, -0.02127136, 2.061244, 0, 0, 0, 1, 1,
1.0833, -0.09586092, 0.7649466, 0, 0, 0, 1, 1,
1.08458, 0.686413, 2.50692, 0, 0, 0, 1, 1,
1.086817, -0.3501852, 2.047361, 0, 0, 0, 1, 1,
1.087124, -0.1826494, 1.979978, 0, 0, 0, 1, 1,
1.087968, -0.7996307, 1.079915, 0, 0, 0, 1, 1,
1.09122, 0.1464177, 2.281675, 0, 0, 0, 1, 1,
1.094841, -0.5158344, 2.397942, 1, 1, 1, 1, 1,
1.096854, 0.2045551, 1.870459, 1, 1, 1, 1, 1,
1.101173, 0.4540745, 0.3242897, 1, 1, 1, 1, 1,
1.105556, 0.89227, 0.6278167, 1, 1, 1, 1, 1,
1.10638, 0.1234236, 1.147123, 1, 1, 1, 1, 1,
1.109134, -0.9091011, 1.609896, 1, 1, 1, 1, 1,
1.110847, 0.4124201, 2.972183, 1, 1, 1, 1, 1,
1.11542, 0.7177844, 0.3017291, 1, 1, 1, 1, 1,
1.115738, 0.995721, 0.8450813, 1, 1, 1, 1, 1,
1.126014, 0.1523902, 2.767058, 1, 1, 1, 1, 1,
1.127101, 0.8989076, 1.143311, 1, 1, 1, 1, 1,
1.12748, 0.5656449, 1.540445, 1, 1, 1, 1, 1,
1.133895, -1.285876, 3.058111, 1, 1, 1, 1, 1,
1.137017, -0.3684872, 0.6003375, 1, 1, 1, 1, 1,
1.141721, -0.6622642, 2.824657, 1, 1, 1, 1, 1,
1.14323, -0.9297358, 2.176172, 0, 0, 1, 1, 1,
1.144944, -0.8397841, 1.840525, 1, 0, 0, 1, 1,
1.150409, -1.451748, 3.6608, 1, 0, 0, 1, 1,
1.150974, -0.6388802, 2.160547, 1, 0, 0, 1, 1,
1.157532, 0.3725448, 2.185202, 1, 0, 0, 1, 1,
1.158038, -0.5230313, 0.5907515, 1, 0, 0, 1, 1,
1.161047, -1.562466, 0.2991857, 0, 0, 0, 1, 1,
1.163814, 1.163939, 1.163483, 0, 0, 0, 1, 1,
1.164786, 0.2457018, 0.1167369, 0, 0, 0, 1, 1,
1.169315, 1.194937, 2.353614, 0, 0, 0, 1, 1,
1.173005, -1.47949, 2.536206, 0, 0, 0, 1, 1,
1.174006, -0.1730657, 1.870625, 0, 0, 0, 1, 1,
1.174059, -0.8056082, 2.238018, 0, 0, 0, 1, 1,
1.186176, 0.737258, 0.1686626, 1, 1, 1, 1, 1,
1.192753, -0.4656051, 1.853531, 1, 1, 1, 1, 1,
1.193248, 0.5743423, 2.294708, 1, 1, 1, 1, 1,
1.198148, 0.2773465, 2.490607, 1, 1, 1, 1, 1,
1.198952, 1.9574, 1.107711, 1, 1, 1, 1, 1,
1.205215, 1.263577, -0.285005, 1, 1, 1, 1, 1,
1.206604, -0.2380237, 2.340842, 1, 1, 1, 1, 1,
1.208492, 0.5585867, 2.886254, 1, 1, 1, 1, 1,
1.210404, -0.4051884, 1.175163, 1, 1, 1, 1, 1,
1.227527, 0.4145061, 4.087896, 1, 1, 1, 1, 1,
1.234903, 1.004525, 0.5263668, 1, 1, 1, 1, 1,
1.23572, -0.7082307, 3.218609, 1, 1, 1, 1, 1,
1.249978, -1.033253, 2.09187, 1, 1, 1, 1, 1,
1.254383, -0.1557354, 2.213152, 1, 1, 1, 1, 1,
1.2567, -0.2715287, 2.38983, 1, 1, 1, 1, 1,
1.258996, -0.06498078, 0.5581422, 0, 0, 1, 1, 1,
1.26014, 0.471107, 1.695208, 1, 0, 0, 1, 1,
1.290313, -0.3399388, 0.8840088, 1, 0, 0, 1, 1,
1.300015, 0.255674, 0.3293343, 1, 0, 0, 1, 1,
1.310891, 2.397753, 0.6656804, 1, 0, 0, 1, 1,
1.311954, -0.477657, 1.430519, 1, 0, 0, 1, 1,
1.329271, 0.9624672, 1.802677, 0, 0, 0, 1, 1,
1.34603, -2.069303, 0.7938669, 0, 0, 0, 1, 1,
1.346851, -0.4329647, 2.284237, 0, 0, 0, 1, 1,
1.347049, 0.2342151, 0.5763708, 0, 0, 0, 1, 1,
1.348326, 0.9232224, -0.1876248, 0, 0, 0, 1, 1,
1.359271, 0.6495008, -0.2574286, 0, 0, 0, 1, 1,
1.36511, 0.3849181, 1.040538, 0, 0, 0, 1, 1,
1.369533, 0.6942518, 0.6271819, 1, 1, 1, 1, 1,
1.383711, -0.1372942, 2.021731, 1, 1, 1, 1, 1,
1.393394, 0.2785392, 0.0153094, 1, 1, 1, 1, 1,
1.404593, 0.5003524, 1.796671, 1, 1, 1, 1, 1,
1.404629, -1.066786, 2.698583, 1, 1, 1, 1, 1,
1.408234, 0.04830365, 0.7410511, 1, 1, 1, 1, 1,
1.421124, 2.395385, -0.2464409, 1, 1, 1, 1, 1,
1.423138, 1.11343, 0.2958762, 1, 1, 1, 1, 1,
1.430556, -0.2189701, 0.09510403, 1, 1, 1, 1, 1,
1.437309, -0.3985348, 0.1621798, 1, 1, 1, 1, 1,
1.441442, -0.64351, 2.594815, 1, 1, 1, 1, 1,
1.443541, 0.7995475, -0.2683592, 1, 1, 1, 1, 1,
1.46473, -0.008656943, 1.585645, 1, 1, 1, 1, 1,
1.465186, 0.3267799, 4.210093, 1, 1, 1, 1, 1,
1.470131, -0.9252651, 2.188903, 1, 1, 1, 1, 1,
1.471587, 0.8833975, 2.745308, 0, 0, 1, 1, 1,
1.475037, 0.9103546, 1.022, 1, 0, 0, 1, 1,
1.485029, -1.061535, 2.597214, 1, 0, 0, 1, 1,
1.486794, -0.04564551, -0.1406636, 1, 0, 0, 1, 1,
1.493075, 1.306242, 0.5505177, 1, 0, 0, 1, 1,
1.495358, 0.7836784, 0.600833, 1, 0, 0, 1, 1,
1.499368, -0.4636326, 2.352745, 0, 0, 0, 1, 1,
1.501813, -0.4225608, 0.5134257, 0, 0, 0, 1, 1,
1.50546, -0.02788704, 1.544081, 0, 0, 0, 1, 1,
1.508965, 0.4185292, 0.4835603, 0, 0, 0, 1, 1,
1.512024, -1.647506, 2.572504, 0, 0, 0, 1, 1,
1.516446, -0.8735963, 1.048179, 0, 0, 0, 1, 1,
1.555424, -0.5403011, 0.9464223, 0, 0, 0, 1, 1,
1.558879, 1.661186, -0.7855577, 1, 1, 1, 1, 1,
1.564641, 0.9687857, -0.2491782, 1, 1, 1, 1, 1,
1.588877, -1.920475, 3.356192, 1, 1, 1, 1, 1,
1.592983, 0.4640304, 0.3466589, 1, 1, 1, 1, 1,
1.597106, -1.115865, 2.630279, 1, 1, 1, 1, 1,
1.604015, 1.570922, 0.3908499, 1, 1, 1, 1, 1,
1.633524, 1.915741, 0.9562775, 1, 1, 1, 1, 1,
1.643549, -0.852985, 1.362404, 1, 1, 1, 1, 1,
1.654139, -0.7052822, 1.866907, 1, 1, 1, 1, 1,
1.667774, 1.146898, 3.413569, 1, 1, 1, 1, 1,
1.687725, -1.90414, 2.003726, 1, 1, 1, 1, 1,
1.689201, -0.5202246, 1.242276, 1, 1, 1, 1, 1,
1.692252, -0.9567269, 2.067741, 1, 1, 1, 1, 1,
1.692272, -1.617011, 0.7232415, 1, 1, 1, 1, 1,
1.712775, 0.7751406, 1.122991, 1, 1, 1, 1, 1,
1.71874, 0.6085005, 0.7742363, 0, 0, 1, 1, 1,
1.733064, -0.30644, 2.848992, 1, 0, 0, 1, 1,
1.736558, -0.7969158, 2.188246, 1, 0, 0, 1, 1,
1.748224, -0.7090112, 2.302603, 1, 0, 0, 1, 1,
1.759662, 1.798227, 0.2637666, 1, 0, 0, 1, 1,
1.761546, -0.5297711, 2.197194, 1, 0, 0, 1, 1,
1.777695, -0.06953777, 1.920738, 0, 0, 0, 1, 1,
1.79699, -1.262607, 2.592843, 0, 0, 0, 1, 1,
1.801975, 0.4182549, 2.233125, 0, 0, 0, 1, 1,
1.8149, -0.09082839, 1.215133, 0, 0, 0, 1, 1,
1.83899, 0.2287244, 1.228575, 0, 0, 0, 1, 1,
1.873473, 1.516516, 2.091266, 0, 0, 0, 1, 1,
1.875681, -0.015762, 2.08949, 0, 0, 0, 1, 1,
1.877807, 0.3593407, 0.9722543, 1, 1, 1, 1, 1,
1.881822, -1.095057, -0.391148, 1, 1, 1, 1, 1,
1.912725, 0.7296726, 1.840242, 1, 1, 1, 1, 1,
1.914935, 0.4843768, 1.103343, 1, 1, 1, 1, 1,
1.951751, -1.064584, 0.5414419, 1, 1, 1, 1, 1,
1.955715, 0.7632483, 1.408236, 1, 1, 1, 1, 1,
1.965807, 1.53766, -0.2114122, 1, 1, 1, 1, 1,
2.006989, 0.6049807, 0.7013466, 1, 1, 1, 1, 1,
2.012134, 0.6287697, 2.091379, 1, 1, 1, 1, 1,
2.045812, -0.6623142, 2.32694, 1, 1, 1, 1, 1,
2.061356, -1.437679, 2.335443, 1, 1, 1, 1, 1,
2.093102, -0.5938057, 1.786086, 1, 1, 1, 1, 1,
2.110599, 1.1743, -0.0160338, 1, 1, 1, 1, 1,
2.11121, -0.1405173, 2.147796, 1, 1, 1, 1, 1,
2.116936, -0.9680984, 2.293862, 1, 1, 1, 1, 1,
2.128611, -2.197144, 2.138833, 0, 0, 1, 1, 1,
2.141169, -1.523202, 1.484753, 1, 0, 0, 1, 1,
2.149396, -1.814644, 2.559838, 1, 0, 0, 1, 1,
2.152041, -0.6503059, 4.210541, 1, 0, 0, 1, 1,
2.166564, -0.04008719, 0.8447112, 1, 0, 0, 1, 1,
2.1722, -2.373324, 3.001961, 1, 0, 0, 1, 1,
2.1968, -0.7387528, 1.037991, 0, 0, 0, 1, 1,
2.218922, -0.1640402, 1.849152, 0, 0, 0, 1, 1,
2.285497, 0.5149583, 1.341224, 0, 0, 0, 1, 1,
2.31304, 1.358431, 0.2589981, 0, 0, 0, 1, 1,
2.3273, 0.9707419, 1.374062, 0, 0, 0, 1, 1,
2.355542, 0.3005634, 3.553316, 0, 0, 0, 1, 1,
2.356157, 0.1659408, 2.457061, 0, 0, 0, 1, 1,
2.378931, -0.9876173, 4.04689, 1, 1, 1, 1, 1,
2.452152, 0.4587154, 2.165866, 1, 1, 1, 1, 1,
2.511889, -1.333612, 2.979814, 1, 1, 1, 1, 1,
2.551076, 1.672277, 1.12868, 1, 1, 1, 1, 1,
2.640521, -1.146787, 2.365483, 1, 1, 1, 1, 1,
2.657086, -1.654949, 2.746675, 1, 1, 1, 1, 1,
2.81178, 0.3155986, 1.799623, 1, 1, 1, 1, 1
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
var radius = 9.441005;
var distance = 33.16113;
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
mvMatrix.translate( 0.139686, 0.1293247, 0.6282187 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.16113);
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