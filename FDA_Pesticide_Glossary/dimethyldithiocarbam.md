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
-2.604852, 0.7307965, -1.050795, 1, 0, 0, 1,
-2.57506, -0.4756261, -1.53458, 1, 0.007843138, 0, 1,
-2.531312, -0.3405915, -1.726622, 1, 0.01176471, 0, 1,
-2.527537, -0.5915347, -2.256607, 1, 0.01960784, 0, 1,
-2.525228, -2.285259, -0.7748801, 1, 0.02352941, 0, 1,
-2.449242, 1.843337, -0.8397809, 1, 0.03137255, 0, 1,
-2.448031, 0.05638267, -2.293425, 1, 0.03529412, 0, 1,
-2.409891, 1.284983, -0.3013368, 1, 0.04313726, 0, 1,
-2.407097, -1.261956, -1.436202, 1, 0.04705882, 0, 1,
-2.405757, -0.2157416, -2.522992, 1, 0.05490196, 0, 1,
-2.348697, -1.799298, -2.541713, 1, 0.05882353, 0, 1,
-2.333192, -0.4768653, -2.257778, 1, 0.06666667, 0, 1,
-2.322784, -1.181726, -0.8258128, 1, 0.07058824, 0, 1,
-2.300571, -0.9732242, -2.556779, 1, 0.07843138, 0, 1,
-2.270447, -0.7482722, -2.367418, 1, 0.08235294, 0, 1,
-2.24134, -0.4707285, -2.992925, 1, 0.09019608, 0, 1,
-2.233157, -0.3882042, -2.194223, 1, 0.09411765, 0, 1,
-2.232091, 0.4493139, -1.961353, 1, 0.1019608, 0, 1,
-2.230147, -0.8347053, -2.090414, 1, 0.1098039, 0, 1,
-2.206775, -1.210772, -1.359501, 1, 0.1137255, 0, 1,
-2.179578, 0.9768104, 0.2550598, 1, 0.1215686, 0, 1,
-2.131428, -0.04549442, -2.187011, 1, 0.1254902, 0, 1,
-2.099045, -0.3631514, -3.614059, 1, 0.1333333, 0, 1,
-2.074447, 0.7532293, -2.983386, 1, 0.1372549, 0, 1,
-2.06857, 0.5872898, -2.462198, 1, 0.145098, 0, 1,
-2.03888, -0.7131409, -1.285724, 1, 0.1490196, 0, 1,
-2.006204, 1.714375, -1.272355, 1, 0.1568628, 0, 1,
-1.999127, -0.9369243, -4.490667, 1, 0.1607843, 0, 1,
-1.970863, 1.058803, -1.768479, 1, 0.1686275, 0, 1,
-1.940188, -1.330705, -0.5691925, 1, 0.172549, 0, 1,
-1.939625, 0.05720816, -2.103252, 1, 0.1803922, 0, 1,
-1.921143, 0.3834346, -1.355207, 1, 0.1843137, 0, 1,
-1.91391, 0.163933, -1.22125, 1, 0.1921569, 0, 1,
-1.904858, -1.846245, -2.545604, 1, 0.1960784, 0, 1,
-1.904633, -1.181839, -2.204469, 1, 0.2039216, 0, 1,
-1.90418, 2.8539, -1.060905, 1, 0.2117647, 0, 1,
-1.891588, -1.191549, -2.988314, 1, 0.2156863, 0, 1,
-1.889394, -1.29991, -2.220441, 1, 0.2235294, 0, 1,
-1.888042, 0.8076315, -1.360356, 1, 0.227451, 0, 1,
-1.879988, -1.37516, -1.511111, 1, 0.2352941, 0, 1,
-1.828331, 0.4752649, -0.4039462, 1, 0.2392157, 0, 1,
-1.82294, -0.5322221, -0.4763206, 1, 0.2470588, 0, 1,
-1.820098, 0.5573453, -0.3231205, 1, 0.2509804, 0, 1,
-1.819522, -0.5785247, -1.769569, 1, 0.2588235, 0, 1,
-1.817597, 0.3642195, -3.245427, 1, 0.2627451, 0, 1,
-1.802722, -0.2065336, -2.819563, 1, 0.2705882, 0, 1,
-1.788693, -1.170963, -2.7493, 1, 0.2745098, 0, 1,
-1.773867, -0.8711306, -2.106233, 1, 0.282353, 0, 1,
-1.705211, 1.810529, -1.420579, 1, 0.2862745, 0, 1,
-1.683699, 0.615827, 0.1276099, 1, 0.2941177, 0, 1,
-1.680431, -2.006215, -2.297321, 1, 0.3019608, 0, 1,
-1.673746, -0.193593, -0.07145542, 1, 0.3058824, 0, 1,
-1.664189, -0.2218595, -3.595677, 1, 0.3137255, 0, 1,
-1.654211, 0.8846133, -0.7737045, 1, 0.3176471, 0, 1,
-1.631766, 0.2030511, -1.004987, 1, 0.3254902, 0, 1,
-1.631529, 0.5004264, -1.140118, 1, 0.3294118, 0, 1,
-1.611928, 0.4806141, -0.3133496, 1, 0.3372549, 0, 1,
-1.610245, -1.340426, -1.82332, 1, 0.3411765, 0, 1,
-1.58971, -1.703082, -1.222968, 1, 0.3490196, 0, 1,
-1.588538, -1.084625, -1.394332, 1, 0.3529412, 0, 1,
-1.548726, -1.272481, -2.991864, 1, 0.3607843, 0, 1,
-1.546603, -0.486272, -2.804853, 1, 0.3647059, 0, 1,
-1.543439, 0.1573613, -0.6341643, 1, 0.372549, 0, 1,
-1.54194, -0.4907984, -2.104339, 1, 0.3764706, 0, 1,
-1.516597, -0.9049438, -0.9585139, 1, 0.3843137, 0, 1,
-1.507055, -0.8677763, -1.889154, 1, 0.3882353, 0, 1,
-1.504326, 0.002256215, -1.124986, 1, 0.3960784, 0, 1,
-1.489038, -0.6783315, -1.926569, 1, 0.4039216, 0, 1,
-1.475604, -0.2549891, -1.127311, 1, 0.4078431, 0, 1,
-1.474929, -2.605295, -2.399779, 1, 0.4156863, 0, 1,
-1.473923, 0.02526921, -0.4487086, 1, 0.4196078, 0, 1,
-1.473462, -0.4985955, -1.010385, 1, 0.427451, 0, 1,
-1.467554, -0.785826, -1.081309, 1, 0.4313726, 0, 1,
-1.460011, 0.1452173, -2.02954, 1, 0.4392157, 0, 1,
-1.451136, -0.9572527, -0.7150716, 1, 0.4431373, 0, 1,
-1.446407, 1.986353, -0.9422106, 1, 0.4509804, 0, 1,
-1.445861, 0.1884883, -3.44312, 1, 0.454902, 0, 1,
-1.424201, 0.07926414, -2.005493, 1, 0.4627451, 0, 1,
-1.40897, -0.4291992, -0.8546642, 1, 0.4666667, 0, 1,
-1.399304, 1.143657, -0.15903, 1, 0.4745098, 0, 1,
-1.39798, -0.3672476, -2.253577, 1, 0.4784314, 0, 1,
-1.389012, -0.0514222, -1.358993, 1, 0.4862745, 0, 1,
-1.381848, 0.4246574, -1.111639, 1, 0.4901961, 0, 1,
-1.37345, -0.8302013, -1.21086, 1, 0.4980392, 0, 1,
-1.37119, -0.492471, -3.009751, 1, 0.5058824, 0, 1,
-1.371024, 0.463458, -1.941116, 1, 0.509804, 0, 1,
-1.370973, -0.114505, -1.354406, 1, 0.5176471, 0, 1,
-1.366894, 0.3671636, -0.6956383, 1, 0.5215687, 0, 1,
-1.360677, -0.09037527, -0.6773728, 1, 0.5294118, 0, 1,
-1.359058, -0.4525624, -3.798216, 1, 0.5333334, 0, 1,
-1.335908, -0.7384663, -2.550382, 1, 0.5411765, 0, 1,
-1.335613, 0.9801262, -1.085972, 1, 0.5450981, 0, 1,
-1.331439, 1.096174, -1.722403, 1, 0.5529412, 0, 1,
-1.321169, -0.4293146, -2.276834, 1, 0.5568628, 0, 1,
-1.32036, -0.4417436, -0.1790886, 1, 0.5647059, 0, 1,
-1.319809, 0.4327007, -0.01975494, 1, 0.5686275, 0, 1,
-1.308117, 1.075592, -1.658824, 1, 0.5764706, 0, 1,
-1.303119, -0.9391348, -2.860018, 1, 0.5803922, 0, 1,
-1.289753, -1.243977, -3.936475, 1, 0.5882353, 0, 1,
-1.287315, 0.264217, -1.501626, 1, 0.5921569, 0, 1,
-1.283561, 1.029009, -1.511327, 1, 0.6, 0, 1,
-1.274214, 1.907065, -0.6914614, 1, 0.6078432, 0, 1,
-1.271611, 0.07472545, -1.102277, 1, 0.6117647, 0, 1,
-1.266923, 1.830776, -1.743989, 1, 0.6196079, 0, 1,
-1.265298, 0.4079092, -3.298105, 1, 0.6235294, 0, 1,
-1.258035, 0.2708394, -2.849524, 1, 0.6313726, 0, 1,
-1.25735, -0.4621465, -1.798386, 1, 0.6352941, 0, 1,
-1.246403, -1.34869, -1.855176, 1, 0.6431373, 0, 1,
-1.243504, -0.135048, -0.5912715, 1, 0.6470588, 0, 1,
-1.233984, 0.4181124, -1.639938, 1, 0.654902, 0, 1,
-1.23306, 0.6268336, -1.581857, 1, 0.6588235, 0, 1,
-1.231309, -0.04730628, 0.1908692, 1, 0.6666667, 0, 1,
-1.229074, -0.4025521, -1.431606, 1, 0.6705883, 0, 1,
-1.213056, -1.278119, -4.000476, 1, 0.6784314, 0, 1,
-1.210614, 1.115167, -0.6911271, 1, 0.682353, 0, 1,
-1.201872, 0.4619044, -1.658258, 1, 0.6901961, 0, 1,
-1.196991, -1.229792, -0.3602214, 1, 0.6941177, 0, 1,
-1.195614, 0.1925314, -0.1230585, 1, 0.7019608, 0, 1,
-1.191254, 0.2797765, -0.9892042, 1, 0.7098039, 0, 1,
-1.189036, -0.3491198, -0.6991864, 1, 0.7137255, 0, 1,
-1.18547, 1.544232, -1.357653, 1, 0.7215686, 0, 1,
-1.172339, -0.5820696, -0.790844, 1, 0.7254902, 0, 1,
-1.164924, 1.630513, -0.1127866, 1, 0.7333333, 0, 1,
-1.164357, -0.05742315, -3.427116, 1, 0.7372549, 0, 1,
-1.149803, 0.7447599, -0.8265214, 1, 0.7450981, 0, 1,
-1.137832, -1.356322, -2.938708, 1, 0.7490196, 0, 1,
-1.129469, 0.6088985, -0.8697352, 1, 0.7568628, 0, 1,
-1.126129, 0.6409011, -0.2892849, 1, 0.7607843, 0, 1,
-1.12463, 0.5526784, -0.7802541, 1, 0.7686275, 0, 1,
-1.124531, -2.05721, -2.273742, 1, 0.772549, 0, 1,
-1.123636, -1.219306, -2.137996, 1, 0.7803922, 0, 1,
-1.119262, -0.7636082, -2.330787, 1, 0.7843137, 0, 1,
-1.116322, -0.4454052, -0.3188429, 1, 0.7921569, 0, 1,
-1.116039, 1.513412, -0.06251042, 1, 0.7960784, 0, 1,
-1.113404, 0.3989488, -3.420581, 1, 0.8039216, 0, 1,
-1.092041, 0.7073367, -1.348683, 1, 0.8117647, 0, 1,
-1.090311, 0.7848641, -0.7385075, 1, 0.8156863, 0, 1,
-1.080735, -0.1289035, -0.1858819, 1, 0.8235294, 0, 1,
-1.079932, 0.6611642, -3.477513, 1, 0.827451, 0, 1,
-1.076252, -0.4494205, -1.765472, 1, 0.8352941, 0, 1,
-1.075047, 0.3530393, -1.089564, 1, 0.8392157, 0, 1,
-1.06617, -1.538609, -1.846769, 1, 0.8470588, 0, 1,
-1.06305, 1.312384, -0.4654277, 1, 0.8509804, 0, 1,
-1.055189, 0.3293641, -2.68457, 1, 0.8588235, 0, 1,
-1.054159, -0.3743275, -3.715201, 1, 0.8627451, 0, 1,
-1.045672, 0.590966, -0.9220143, 1, 0.8705882, 0, 1,
-1.026428, 0.7190795, -0.4472345, 1, 0.8745098, 0, 1,
-1.019703, -0.4511591, -2.811191, 1, 0.8823529, 0, 1,
-1.018279, 1.380543, -1.250653, 1, 0.8862745, 0, 1,
-1.014828, 0.4068915, -3.56438, 1, 0.8941177, 0, 1,
-1.010676, -0.2473551, -2.360273, 1, 0.8980392, 0, 1,
-1.004136, -0.4731269, -3.886838, 1, 0.9058824, 0, 1,
-1.000049, 0.5132343, -0.9893568, 1, 0.9137255, 0, 1,
-0.9882451, 0.078284, -3.39487, 1, 0.9176471, 0, 1,
-0.978439, 0.5086161, -0.4759798, 1, 0.9254902, 0, 1,
-0.9772671, 0.7594302, 1.260137, 1, 0.9294118, 0, 1,
-0.9707032, -1.140547, -1.602159, 1, 0.9372549, 0, 1,
-0.9706957, -0.5745869, -0.6462972, 1, 0.9411765, 0, 1,
-0.9629902, 0.7518447, -2.836033, 1, 0.9490196, 0, 1,
-0.9532623, 0.2419738, -0.7893409, 1, 0.9529412, 0, 1,
-0.9501518, -0.5991328, -0.8326281, 1, 0.9607843, 0, 1,
-0.9451444, -0.6657058, -2.919484, 1, 0.9647059, 0, 1,
-0.9445137, 0.6889317, -1.063389, 1, 0.972549, 0, 1,
-0.9395224, 0.434683, -1.983381, 1, 0.9764706, 0, 1,
-0.9361032, 0.2257936, -0.7050027, 1, 0.9843137, 0, 1,
-0.929302, -2.085013, -1.863266, 1, 0.9882353, 0, 1,
-0.918419, -0.4238485, -0.8869069, 1, 0.9960784, 0, 1,
-0.916028, -0.4365135, -3.472356, 0.9960784, 1, 0, 1,
-0.9121923, 0.4669406, -0.2837866, 0.9921569, 1, 0, 1,
-0.9119694, 0.1885445, -1.57462, 0.9843137, 1, 0, 1,
-0.9119576, -0.9823608, -0.9033722, 0.9803922, 1, 0, 1,
-0.910952, -0.1806609, -2.010646, 0.972549, 1, 0, 1,
-0.9106244, -0.7872285, -0.8329687, 0.9686275, 1, 0, 1,
-0.9103671, 0.08036569, -2.124963, 0.9607843, 1, 0, 1,
-0.9014009, -0.7175306, -0.7318061, 0.9568627, 1, 0, 1,
-0.8978981, 0.4463782, 0.7958784, 0.9490196, 1, 0, 1,
-0.8947459, 0.3316675, -0.3853357, 0.945098, 1, 0, 1,
-0.8845064, -0.1177675, 0.31255, 0.9372549, 1, 0, 1,
-0.8813239, 0.8488163, -1.081668, 0.9333333, 1, 0, 1,
-0.8801962, 0.9367084, 0.134776, 0.9254902, 1, 0, 1,
-0.8799514, 0.03223944, -2.191612, 0.9215686, 1, 0, 1,
-0.8721896, 1.080773, 1.426952, 0.9137255, 1, 0, 1,
-0.8718128, 0.0319467, -1.278129, 0.9098039, 1, 0, 1,
-0.8665295, -1.432583, -2.850372, 0.9019608, 1, 0, 1,
-0.8592103, 0.7152303, -0.4225414, 0.8941177, 1, 0, 1,
-0.8503659, 0.4243774, -0.4717037, 0.8901961, 1, 0, 1,
-0.8420891, -1.408098, -3.221059, 0.8823529, 1, 0, 1,
-0.8417262, -0.9904555, -3.783143, 0.8784314, 1, 0, 1,
-0.8335399, 0.4355341, -1.471497, 0.8705882, 1, 0, 1,
-0.8335109, -0.8672534, -2.801444, 0.8666667, 1, 0, 1,
-0.8312331, -0.3677743, -2.360812, 0.8588235, 1, 0, 1,
-0.830525, -0.3489103, -2.54452, 0.854902, 1, 0, 1,
-0.8271967, 0.1341717, -0.5592499, 0.8470588, 1, 0, 1,
-0.8267985, -1.317462, -1.501163, 0.8431373, 1, 0, 1,
-0.8188143, 2.146781, -0.09351167, 0.8352941, 1, 0, 1,
-0.8187529, -1.56992, -2.791524, 0.8313726, 1, 0, 1,
-0.8174844, -0.166651, 0.1514339, 0.8235294, 1, 0, 1,
-0.8143956, -2.372043, -1.916402, 0.8196079, 1, 0, 1,
-0.7992575, 0.3481006, -3.512771, 0.8117647, 1, 0, 1,
-0.7954341, -0.09454802, -3.070333, 0.8078431, 1, 0, 1,
-0.7953354, -0.1951901, -2.162271, 0.8, 1, 0, 1,
-0.7937444, -0.2599956, -0.4007182, 0.7921569, 1, 0, 1,
-0.7910823, 0.691378, -1.510327, 0.7882353, 1, 0, 1,
-0.785499, -1.006028, -2.236254, 0.7803922, 1, 0, 1,
-0.7825651, -0.3844942, -3.087568, 0.7764706, 1, 0, 1,
-0.7804925, 1.268558, 0.5736217, 0.7686275, 1, 0, 1,
-0.7700777, 0.6962615, -0.8088139, 0.7647059, 1, 0, 1,
-0.7637568, -1.662542, -3.901845, 0.7568628, 1, 0, 1,
-0.7630973, -0.2686387, -2.069878, 0.7529412, 1, 0, 1,
-0.7623652, 0.4159923, -0.6306627, 0.7450981, 1, 0, 1,
-0.7615502, -0.7508888, -3.463608, 0.7411765, 1, 0, 1,
-0.7578869, 1.114711, -0.3482768, 0.7333333, 1, 0, 1,
-0.7551714, 0.2389773, -0.5103568, 0.7294118, 1, 0, 1,
-0.7540707, 0.08917558, -1.15849, 0.7215686, 1, 0, 1,
-0.7538275, -0.1872182, -1.006455, 0.7176471, 1, 0, 1,
-0.7517205, 0.6473652, -1.264577, 0.7098039, 1, 0, 1,
-0.7514009, -0.1063515, -1.756303, 0.7058824, 1, 0, 1,
-0.7493924, -0.469066, -2.683797, 0.6980392, 1, 0, 1,
-0.7467475, 0.8758427, -2.804181, 0.6901961, 1, 0, 1,
-0.7461994, 0.9691048, -0.5704324, 0.6862745, 1, 0, 1,
-0.7310994, -0.1712897, -0.8454588, 0.6784314, 1, 0, 1,
-0.7283768, 1.318695, 1.303393, 0.6745098, 1, 0, 1,
-0.7239839, 0.4501238, -0.8928273, 0.6666667, 1, 0, 1,
-0.7118366, -2.589935, -4.008584, 0.6627451, 1, 0, 1,
-0.7116399, 1.253257, 0.879392, 0.654902, 1, 0, 1,
-0.7049369, 0.60593, -0.6735308, 0.6509804, 1, 0, 1,
-0.700991, -0.2391818, -0.3865784, 0.6431373, 1, 0, 1,
-0.6975143, 0.4058441, 0.3565426, 0.6392157, 1, 0, 1,
-0.6884142, -0.8393203, -2.122779, 0.6313726, 1, 0, 1,
-0.6843259, 1.195299, -1.651925, 0.627451, 1, 0, 1,
-0.6833804, 0.5354691, -2.189185, 0.6196079, 1, 0, 1,
-0.6764237, -1.080247, -1.452819, 0.6156863, 1, 0, 1,
-0.6642416, 1.219182, 1.071643, 0.6078432, 1, 0, 1,
-0.6640342, 0.6239268, -1.690136, 0.6039216, 1, 0, 1,
-0.6612505, -1.003633, -2.757451, 0.5960785, 1, 0, 1,
-0.6600487, -0.6513236, -1.594913, 0.5882353, 1, 0, 1,
-0.6586893, 0.07047092, -3.195395, 0.5843138, 1, 0, 1,
-0.6511891, -0.05202068, -1.61851, 0.5764706, 1, 0, 1,
-0.6484917, 0.5070403, -1.821769, 0.572549, 1, 0, 1,
-0.6467533, 1.533307, -0.1302341, 0.5647059, 1, 0, 1,
-0.6444542, 0.3833964, -1.590612, 0.5607843, 1, 0, 1,
-0.643847, -0.7353203, -3.670946, 0.5529412, 1, 0, 1,
-0.6429904, 1.261783, -1.17205, 0.5490196, 1, 0, 1,
-0.6420195, 1.312917, -0.9884234, 0.5411765, 1, 0, 1,
-0.6397262, -2.505589, -2.97554, 0.5372549, 1, 0, 1,
-0.6381929, -1.258668, -2.668668, 0.5294118, 1, 0, 1,
-0.6323875, -0.5991133, -3.636039, 0.5254902, 1, 0, 1,
-0.6260895, 0.5485854, 0.05398616, 0.5176471, 1, 0, 1,
-0.6231847, -0.4529459, -2.384706, 0.5137255, 1, 0, 1,
-0.6202459, 0.4459364, -0.3416944, 0.5058824, 1, 0, 1,
-0.6197078, -0.4640148, -2.502492, 0.5019608, 1, 0, 1,
-0.6129663, -1.073156, -3.612623, 0.4941176, 1, 0, 1,
-0.6127811, 0.3453633, -1.989919, 0.4862745, 1, 0, 1,
-0.6122664, 0.5736954, 0.389624, 0.4823529, 1, 0, 1,
-0.6091574, 0.3714674, -1.483721, 0.4745098, 1, 0, 1,
-0.5999256, 0.06945287, -1.713335, 0.4705882, 1, 0, 1,
-0.5980727, 0.2538997, -1.070168, 0.4627451, 1, 0, 1,
-0.5978649, 1.130926, 0.3677314, 0.4588235, 1, 0, 1,
-0.5890266, 1.471221, -0.1260535, 0.4509804, 1, 0, 1,
-0.5860222, 0.3066564, -2.16309, 0.4470588, 1, 0, 1,
-0.576436, 1.343502, 0.5712504, 0.4392157, 1, 0, 1,
-0.5764019, -0.1097882, -0.354964, 0.4352941, 1, 0, 1,
-0.5729542, -0.2526318, -1.787791, 0.427451, 1, 0, 1,
-0.5719029, -0.127797, 0.1818708, 0.4235294, 1, 0, 1,
-0.5703139, -1.229669, -2.524833, 0.4156863, 1, 0, 1,
-0.5686548, -0.7992663, -3.963845, 0.4117647, 1, 0, 1,
-0.5682907, 0.4008878, -1.62038, 0.4039216, 1, 0, 1,
-0.5670409, 0.7553615, -0.1096248, 0.3960784, 1, 0, 1,
-0.5637342, 0.2175708, -0.6679981, 0.3921569, 1, 0, 1,
-0.560383, -0.3882165, -1.101482, 0.3843137, 1, 0, 1,
-0.5550677, -0.746909, -2.421506, 0.3803922, 1, 0, 1,
-0.553839, -0.6142887, -3.270279, 0.372549, 1, 0, 1,
-0.5506258, -0.4950229, -4.269672, 0.3686275, 1, 0, 1,
-0.5502114, -0.9543877, -2.697423, 0.3607843, 1, 0, 1,
-0.5496411, 0.7549774, 0.1291744, 0.3568628, 1, 0, 1,
-0.5423354, -0.006316543, -1.222444, 0.3490196, 1, 0, 1,
-0.5357196, 0.8507913, -0.6064959, 0.345098, 1, 0, 1,
-0.533131, 0.615487, -0.7994921, 0.3372549, 1, 0, 1,
-0.5265622, -0.9428769, -3.196665, 0.3333333, 1, 0, 1,
-0.5190971, 1.239223, -0.1024011, 0.3254902, 1, 0, 1,
-0.5167351, -2.035196, -2.473097, 0.3215686, 1, 0, 1,
-0.5132213, 2.641265, -0.379232, 0.3137255, 1, 0, 1,
-0.5109032, -0.7539085, -3.236871, 0.3098039, 1, 0, 1,
-0.5024353, -0.2162999, -0.8957164, 0.3019608, 1, 0, 1,
-0.4975222, -1.046562, -1.902061, 0.2941177, 1, 0, 1,
-0.4939294, -0.2473891, -2.820722, 0.2901961, 1, 0, 1,
-0.4930206, 0.505707, -1.213194, 0.282353, 1, 0, 1,
-0.4929639, -0.2789087, -1.729362, 0.2784314, 1, 0, 1,
-0.4924894, 0.6505996, -0.8972552, 0.2705882, 1, 0, 1,
-0.4907885, 0.7224455, 1.424972, 0.2666667, 1, 0, 1,
-0.489424, -0.3046226, -1.29146, 0.2588235, 1, 0, 1,
-0.4866259, 0.4891376, -1.170406, 0.254902, 1, 0, 1,
-0.4822367, 0.6115506, -2.654583, 0.2470588, 1, 0, 1,
-0.4813216, -0.5281305, -1.820866, 0.2431373, 1, 0, 1,
-0.4794731, -0.02476189, -2.069535, 0.2352941, 1, 0, 1,
-0.4720376, -0.888945, -1.17309, 0.2313726, 1, 0, 1,
-0.4698406, 0.6277714, -2.961156, 0.2235294, 1, 0, 1,
-0.4645419, 0.7878309, -0.2991192, 0.2196078, 1, 0, 1,
-0.464099, -0.4377736, -2.349994, 0.2117647, 1, 0, 1,
-0.462386, 1.499194, -0.06527016, 0.2078431, 1, 0, 1,
-0.4605799, -0.9869651, -3.35659, 0.2, 1, 0, 1,
-0.4591484, -0.7076785, -3.598389, 0.1921569, 1, 0, 1,
-0.4461181, 1.643795, -0.09243218, 0.1882353, 1, 0, 1,
-0.4460245, -0.639061, -2.541368, 0.1803922, 1, 0, 1,
-0.4458989, 1.305691, -1.571957, 0.1764706, 1, 0, 1,
-0.4384994, -0.09446692, -3.529515, 0.1686275, 1, 0, 1,
-0.4360802, -0.5872439, -1.268065, 0.1647059, 1, 0, 1,
-0.4327233, 0.06631677, -1.68689, 0.1568628, 1, 0, 1,
-0.4302101, 2.113741, -0.6599984, 0.1529412, 1, 0, 1,
-0.4289534, 0.6341633, -0.5999786, 0.145098, 1, 0, 1,
-0.4257102, 1.326962, 0.785971, 0.1411765, 1, 0, 1,
-0.4241747, 1.1018, -0.5192736, 0.1333333, 1, 0, 1,
-0.4179741, 0.4867618, -1.498203, 0.1294118, 1, 0, 1,
-0.4155343, -0.5381311, -4.444645, 0.1215686, 1, 0, 1,
-0.4144171, -0.809585, -3.685754, 0.1176471, 1, 0, 1,
-0.4126689, -0.8216263, -2.275834, 0.1098039, 1, 0, 1,
-0.4088329, 0.0324511, -1.405403, 0.1058824, 1, 0, 1,
-0.4086757, -1.386886, -2.095874, 0.09803922, 1, 0, 1,
-0.4059331, 1.567313, -1.234353, 0.09019608, 1, 0, 1,
-0.4054258, 0.4928689, -2.268929, 0.08627451, 1, 0, 1,
-0.4050668, 0.5081899, 0.9502138, 0.07843138, 1, 0, 1,
-0.4029305, -0.6209687, -1.290355, 0.07450981, 1, 0, 1,
-0.4028763, 0.4988803, -0.5580661, 0.06666667, 1, 0, 1,
-0.4007494, 1.046008, 0.7695709, 0.0627451, 1, 0, 1,
-0.400292, -0.7143697, -2.213198, 0.05490196, 1, 0, 1,
-0.3957978, 1.424869, -0.2387262, 0.05098039, 1, 0, 1,
-0.3950883, 0.4617572, -0.8218131, 0.04313726, 1, 0, 1,
-0.3905857, 1.659472, -1.00364, 0.03921569, 1, 0, 1,
-0.3901727, 0.525365, -0.2709244, 0.03137255, 1, 0, 1,
-0.382144, -0.2725623, -3.543552, 0.02745098, 1, 0, 1,
-0.3812045, 0.2292233, -0.7426195, 0.01960784, 1, 0, 1,
-0.3788707, 1.892823, -0.096086, 0.01568628, 1, 0, 1,
-0.3770832, -1.017389, -1.941046, 0.007843138, 1, 0, 1,
-0.3766786, 0.961399, -2.888636, 0.003921569, 1, 0, 1,
-0.3766173, -1.017582, -3.745169, 0, 1, 0.003921569, 1,
-0.3755893, 0.7829105, -0.7810594, 0, 1, 0.01176471, 1,
-0.3752322, 2.186419, -0.6515793, 0, 1, 0.01568628, 1,
-0.3745852, -0.4250158, -3.085395, 0, 1, 0.02352941, 1,
-0.3654058, -0.6780499, -2.949303, 0, 1, 0.02745098, 1,
-0.3642971, 0.5964559, 0.07458892, 0, 1, 0.03529412, 1,
-0.3638652, -0.7942442, -0.6133237, 0, 1, 0.03921569, 1,
-0.3604736, -1.470753, -4.35455, 0, 1, 0.04705882, 1,
-0.356727, -0.4534694, -3.612549, 0, 1, 0.05098039, 1,
-0.3534945, 0.5621009, 0.06710328, 0, 1, 0.05882353, 1,
-0.3500479, 1.248592, 0.5905966, 0, 1, 0.0627451, 1,
-0.349185, -0.6147817, -1.405877, 0, 1, 0.07058824, 1,
-0.3360562, 1.678373, -0.4229034, 0, 1, 0.07450981, 1,
-0.3335114, 0.2500503, -2.924154, 0, 1, 0.08235294, 1,
-0.3322164, 1.011333, -1.373869, 0, 1, 0.08627451, 1,
-0.3319396, 1.106489, 1.321688, 0, 1, 0.09411765, 1,
-0.3285978, 2.200421, -2.292793, 0, 1, 0.1019608, 1,
-0.3268398, 0.2686467, -1.176174, 0, 1, 0.1058824, 1,
-0.325495, -0.1816279, -1.937046, 0, 1, 0.1137255, 1,
-0.3247832, -0.5886171, -3.096683, 0, 1, 0.1176471, 1,
-0.3239856, 0.3123204, 0.02270248, 0, 1, 0.1254902, 1,
-0.3217457, 0.4057913, -1.044787, 0, 1, 0.1294118, 1,
-0.3204699, 0.5616319, -1.240907, 0, 1, 0.1372549, 1,
-0.3196414, -0.02082289, -1.843778, 0, 1, 0.1411765, 1,
-0.3144656, 0.06402627, -2.145522, 0, 1, 0.1490196, 1,
-0.3091381, 2.307277, -2.127116, 0, 1, 0.1529412, 1,
-0.3070478, -2.828751, -3.867711, 0, 1, 0.1607843, 1,
-0.3043874, 0.9734612, 0.2484615, 0, 1, 0.1647059, 1,
-0.3041373, 0.6658984, 1.904929, 0, 1, 0.172549, 1,
-0.2980748, 0.9847374, 1.70548, 0, 1, 0.1764706, 1,
-0.2978494, -0.9326631, -2.672186, 0, 1, 0.1843137, 1,
-0.2923497, 0.5646652, -1.008086, 0, 1, 0.1882353, 1,
-0.2889207, 1.129597, 0.4530532, 0, 1, 0.1960784, 1,
-0.2878717, 1.545634, 0.5198175, 0, 1, 0.2039216, 1,
-0.2868192, 0.4449548, -1.499662, 0, 1, 0.2078431, 1,
-0.2857371, 0.5187155, -3.062911, 0, 1, 0.2156863, 1,
-0.2808156, 0.8722661, 0.297987, 0, 1, 0.2196078, 1,
-0.2771084, 2.492222, 0.9758161, 0, 1, 0.227451, 1,
-0.2761892, 1.042643, 0.2308897, 0, 1, 0.2313726, 1,
-0.2738179, 1.157191, -0.6859471, 0, 1, 0.2392157, 1,
-0.2733737, -2.192407, -2.499961, 0, 1, 0.2431373, 1,
-0.2692683, -0.1486496, -0.8333235, 0, 1, 0.2509804, 1,
-0.2679707, 0.02775719, -0.8284556, 0, 1, 0.254902, 1,
-0.2632026, 1.519254, -1.569343, 0, 1, 0.2627451, 1,
-0.2585624, 0.3218231, -0.2352526, 0, 1, 0.2666667, 1,
-0.2573, 0.4901216, -0.877026, 0, 1, 0.2745098, 1,
-0.2528895, -1.889444, -2.86637, 0, 1, 0.2784314, 1,
-0.2527011, 0.6083584, -1.28624, 0, 1, 0.2862745, 1,
-0.251265, -1.049271, -3.938296, 0, 1, 0.2901961, 1,
-0.2499097, -0.542419, -3.14575, 0, 1, 0.2980392, 1,
-0.2496342, 2.111498, -0.04992215, 0, 1, 0.3058824, 1,
-0.2473843, 0.4221926, -1.214613, 0, 1, 0.3098039, 1,
-0.2427216, 1.129496, -0.285728, 0, 1, 0.3176471, 1,
-0.2399308, -0.4336035, -1.139808, 0, 1, 0.3215686, 1,
-0.2355748, 0.4907551, -3.078248, 0, 1, 0.3294118, 1,
-0.2318104, 0.2435697, 1.096774, 0, 1, 0.3333333, 1,
-0.2285763, -0.9980831, -2.548119, 0, 1, 0.3411765, 1,
-0.2262619, 0.1185061, 0.2647319, 0, 1, 0.345098, 1,
-0.2252834, 0.1035269, -1.017483, 0, 1, 0.3529412, 1,
-0.2241321, -1.347039, -2.846053, 0, 1, 0.3568628, 1,
-0.2210559, 0.4950248, -0.3184525, 0, 1, 0.3647059, 1,
-0.2197833, -0.8522251, -5.077077, 0, 1, 0.3686275, 1,
-0.2188143, 0.7340414, -0.956045, 0, 1, 0.3764706, 1,
-0.216857, -1.009067, -3.199697, 0, 1, 0.3803922, 1,
-0.2168019, -0.0565368, -3.275337, 0, 1, 0.3882353, 1,
-0.2146883, -0.3845767, -2.988887, 0, 1, 0.3921569, 1,
-0.213944, -1.257547, -3.097927, 0, 1, 0.4, 1,
-0.2138862, 0.9186321, -0.4034397, 0, 1, 0.4078431, 1,
-0.2098392, -0.4900981, -2.706167, 0, 1, 0.4117647, 1,
-0.2094396, -0.713443, -2.59071, 0, 1, 0.4196078, 1,
-0.1971122, 0.3717937, -1.97508, 0, 1, 0.4235294, 1,
-0.1879322, -0.6473721, -3.583463, 0, 1, 0.4313726, 1,
-0.1825558, 1.404683, -1.144924, 0, 1, 0.4352941, 1,
-0.1789671, 0.8167847, -0.8669549, 0, 1, 0.4431373, 1,
-0.1771792, -0.9937572, -1.447827, 0, 1, 0.4470588, 1,
-0.1721694, -1.696011, -2.598808, 0, 1, 0.454902, 1,
-0.1708511, 1.721938, 0.06953417, 0, 1, 0.4588235, 1,
-0.1707508, 0.4148126, -1.128698, 0, 1, 0.4666667, 1,
-0.1637273, -0.7336603, -1.320365, 0, 1, 0.4705882, 1,
-0.1609897, -0.279469, -4.416831, 0, 1, 0.4784314, 1,
-0.1603641, 1.076361, -1.292807, 0, 1, 0.4823529, 1,
-0.1538465, -0.1966701, -2.379696, 0, 1, 0.4901961, 1,
-0.1527727, -0.2977025, -4.012387, 0, 1, 0.4941176, 1,
-0.1520772, 0.7919129, -1.80186, 0, 1, 0.5019608, 1,
-0.1403447, -0.6407815, -3.060697, 0, 1, 0.509804, 1,
-0.1398685, -0.6197712, -3.869004, 0, 1, 0.5137255, 1,
-0.1396696, -1.086738, -2.545495, 0, 1, 0.5215687, 1,
-0.1392932, 0.03503473, -2.205078, 0, 1, 0.5254902, 1,
-0.1392549, -1.133827, -2.965131, 0, 1, 0.5333334, 1,
-0.1341547, -0.6946341, -4.607783, 0, 1, 0.5372549, 1,
-0.1320616, -0.613714, -2.360204, 0, 1, 0.5450981, 1,
-0.1317681, -0.9573594, -2.804383, 0, 1, 0.5490196, 1,
-0.1307296, 0.4505034, 0.6421538, 0, 1, 0.5568628, 1,
-0.1305626, 0.4748465, -0.9417332, 0, 1, 0.5607843, 1,
-0.1281131, 1.260814, 0.1343758, 0, 1, 0.5686275, 1,
-0.1246148, 1.198741, -0.0008488265, 0, 1, 0.572549, 1,
-0.124081, 1.634527, -1.193301, 0, 1, 0.5803922, 1,
-0.1233038, 0.3142763, -0.4426998, 0, 1, 0.5843138, 1,
-0.1231008, -0.6669316, -2.704247, 0, 1, 0.5921569, 1,
-0.121741, 0.2856189, 0.0552614, 0, 1, 0.5960785, 1,
-0.1212189, -1.27109, -3.908244, 0, 1, 0.6039216, 1,
-0.1195617, 1.286346, 0.211997, 0, 1, 0.6117647, 1,
-0.117188, 2.253348, -1.34715, 0, 1, 0.6156863, 1,
-0.1171695, 0.2392615, -0.5497668, 0, 1, 0.6235294, 1,
-0.1146265, -1.627895, -4.775887, 0, 1, 0.627451, 1,
-0.1091601, 1.458169, 0.6871355, 0, 1, 0.6352941, 1,
-0.1080416, -1.438468, -3.085519, 0, 1, 0.6392157, 1,
-0.1058823, 1.756082, 0.4707149, 0, 1, 0.6470588, 1,
-0.1052572, 0.4040906, -0.8640737, 0, 1, 0.6509804, 1,
-0.1051425, 1.582196, -0.2183348, 0, 1, 0.6588235, 1,
-0.1025973, 1.188453, -1.529249, 0, 1, 0.6627451, 1,
-0.1013432, -0.3367731, -2.268839, 0, 1, 0.6705883, 1,
-0.09740097, 1.16999, -0.1952655, 0, 1, 0.6745098, 1,
-0.09584839, 1.649149, -1.617469, 0, 1, 0.682353, 1,
-0.08950585, -0.1740475, -1.397804, 0, 1, 0.6862745, 1,
-0.08672754, 0.01029475, -1.485128, 0, 1, 0.6941177, 1,
-0.0864042, 0.6766835, -0.5582611, 0, 1, 0.7019608, 1,
-0.08638203, 1.158872, 0.4846714, 0, 1, 0.7058824, 1,
-0.08516193, 0.9914404, 0.7630877, 0, 1, 0.7137255, 1,
-0.08400077, -0.6834697, -2.208277, 0, 1, 0.7176471, 1,
-0.08378223, 1.145233, -0.3916705, 0, 1, 0.7254902, 1,
-0.0833355, -1.533697, -3.369374, 0, 1, 0.7294118, 1,
-0.08282845, 1.226642, -0.06614463, 0, 1, 0.7372549, 1,
-0.0817073, -0.4096879, -3.336942, 0, 1, 0.7411765, 1,
-0.08162557, 0.7714093, -0.9047744, 0, 1, 0.7490196, 1,
-0.08142075, -0.2603942, -1.237575, 0, 1, 0.7529412, 1,
-0.08062784, -0.5653009, -4.446289, 0, 1, 0.7607843, 1,
-0.0756797, 0.7926493, -1.334586, 0, 1, 0.7647059, 1,
-0.07520533, 1.676466, -0.6556401, 0, 1, 0.772549, 1,
-0.07334466, 2.4294, 0.3510508, 0, 1, 0.7764706, 1,
-0.0719515, 0.009731242, -2.265485, 0, 1, 0.7843137, 1,
-0.07150849, -0.8520261, -3.265539, 0, 1, 0.7882353, 1,
-0.07136589, 0.9010841, -2.345724, 0, 1, 0.7960784, 1,
-0.07036503, 1.647988, -0.7687488, 0, 1, 0.8039216, 1,
-0.06397433, -0.9111442, -2.762002, 0, 1, 0.8078431, 1,
-0.05826432, -0.5185447, -2.554438, 0, 1, 0.8156863, 1,
-0.05483316, -1.288247, -2.588075, 0, 1, 0.8196079, 1,
-0.05309768, -0.2984795, -3.562129, 0, 1, 0.827451, 1,
-0.05284448, -0.009610125, -3.213108, 0, 1, 0.8313726, 1,
-0.05111977, 0.07776525, 0.3994723, 0, 1, 0.8392157, 1,
-0.04967802, -0.9851046, -3.868627, 0, 1, 0.8431373, 1,
-0.04924228, 0.1615354, 0.3954397, 0, 1, 0.8509804, 1,
-0.04551353, -0.706761, -1.903017, 0, 1, 0.854902, 1,
-0.04326594, 0.491622, -1.367505, 0, 1, 0.8627451, 1,
-0.04098714, -0.04704414, -1.393224, 0, 1, 0.8666667, 1,
-0.03495961, -0.1101606, -2.862712, 0, 1, 0.8745098, 1,
-0.03350624, -0.7308991, -1.926535, 0, 1, 0.8784314, 1,
-0.03242264, -1.402634, -3.591503, 0, 1, 0.8862745, 1,
-0.03077671, -1.996722, -2.790615, 0, 1, 0.8901961, 1,
-0.02994356, -2.500485, -2.975442, 0, 1, 0.8980392, 1,
-0.02294714, 2.054938, 1.028363, 0, 1, 0.9058824, 1,
-0.007579802, -0.3741412, -3.869067, 0, 1, 0.9098039, 1,
-0.005915419, 2.97101, -1.098302, 0, 1, 0.9176471, 1,
-0.003789452, 0.138895, -0.8321996, 0, 1, 0.9215686, 1,
-0.00335142, -0.1518623, -2.00159, 0, 1, 0.9294118, 1,
-0.001563803, 0.9057311, -0.1613512, 0, 1, 0.9333333, 1,
-7.908035e-05, 0.563517, 0.8222943, 0, 1, 0.9411765, 1,
0.001109266, 0.9144062, 0.7076097, 0, 1, 0.945098, 1,
0.005963163, -0.8246732, 3.451823, 0, 1, 0.9529412, 1,
0.006063893, -0.05637069, 2.916736, 0, 1, 0.9568627, 1,
0.007578876, -0.8329505, 2.639772, 0, 1, 0.9647059, 1,
0.007711316, 0.6686916, 0.3406394, 0, 1, 0.9686275, 1,
0.008743507, -0.2546814, 2.222616, 0, 1, 0.9764706, 1,
0.009157975, -0.898414, 2.239003, 0, 1, 0.9803922, 1,
0.01263877, -1.795863, 3.123491, 0, 1, 0.9882353, 1,
0.01400538, -0.5510042, 2.530463, 0, 1, 0.9921569, 1,
0.0147327, -0.01381182, 2.034181, 0, 1, 1, 1,
0.01534509, 0.4161491, 0.1284, 0, 0.9921569, 1, 1,
0.01622258, -1.205323, 5.671618, 0, 0.9882353, 1, 1,
0.01658488, -1.585557, 3.263528, 0, 0.9803922, 1, 1,
0.01765351, 0.2417396, 1.17568, 0, 0.9764706, 1, 1,
0.0185518, 0.1969684, -0.3754829, 0, 0.9686275, 1, 1,
0.02056795, -0.06698541, 1.585361, 0, 0.9647059, 1, 1,
0.02728843, 0.5988061, -1.087567, 0, 0.9568627, 1, 1,
0.03233102, 0.5176642, -0.5968252, 0, 0.9529412, 1, 1,
0.03709327, -1.512859, 4.021379, 0, 0.945098, 1, 1,
0.03753854, 1.084744, -0.5689416, 0, 0.9411765, 1, 1,
0.03776765, -0.2679389, 3.666389, 0, 0.9333333, 1, 1,
0.04121359, 0.59547, -1.369994, 0, 0.9294118, 1, 1,
0.04267158, -1.305097, 3.000112, 0, 0.9215686, 1, 1,
0.04317986, 2.794612, 0.3007812, 0, 0.9176471, 1, 1,
0.04599155, -0.2987173, 3.623163, 0, 0.9098039, 1, 1,
0.05114629, -0.7196751, 2.632488, 0, 0.9058824, 1, 1,
0.05189858, 0.2011903, 0.810931, 0, 0.8980392, 1, 1,
0.0589917, 0.8764357, 1.374912, 0, 0.8901961, 1, 1,
0.05961039, 0.5735886, 0.4174149, 0, 0.8862745, 1, 1,
0.06019143, -1.590619, 3.9313, 0, 0.8784314, 1, 1,
0.06291737, -0.06617256, 2.774795, 0, 0.8745098, 1, 1,
0.0634637, 0.8865348, 0.1438452, 0, 0.8666667, 1, 1,
0.06350119, -0.3728172, 3.34084, 0, 0.8627451, 1, 1,
0.06652923, 0.3028911, 1.002443, 0, 0.854902, 1, 1,
0.06938693, -1.242344, 2.939847, 0, 0.8509804, 1, 1,
0.07271049, 1.150532, -1.904589, 0, 0.8431373, 1, 1,
0.07302767, -0.2869573, 3.261977, 0, 0.8392157, 1, 1,
0.07444135, -0.08398771, 3.673141, 0, 0.8313726, 1, 1,
0.07470008, -0.4669858, 4.984715, 0, 0.827451, 1, 1,
0.07605069, -0.2871102, 3.418996, 0, 0.8196079, 1, 1,
0.07828944, -0.2199983, 1.842316, 0, 0.8156863, 1, 1,
0.07982523, 0.559774, 2.202374, 0, 0.8078431, 1, 1,
0.08954026, 0.5159334, -0.8325939, 0, 0.8039216, 1, 1,
0.09013557, -0.2057689, 3.012288, 0, 0.7960784, 1, 1,
0.0921727, -0.6420217, 1.581091, 0, 0.7882353, 1, 1,
0.09258576, 0.6410457, -0.392019, 0, 0.7843137, 1, 1,
0.09260829, 0.2062517, 0.4709208, 0, 0.7764706, 1, 1,
0.09564178, -0.07641926, 2.901204, 0, 0.772549, 1, 1,
0.0984004, 0.8611842, 0.2116683, 0, 0.7647059, 1, 1,
0.098943, -0.4334926, 0.9906934, 0, 0.7607843, 1, 1,
0.1016437, -1.255393, 3.368285, 0, 0.7529412, 1, 1,
0.1027998, 0.02764775, 1.637761, 0, 0.7490196, 1, 1,
0.1047942, 0.8647665, 0.4752859, 0, 0.7411765, 1, 1,
0.1061815, 0.9199512, 0.4184281, 0, 0.7372549, 1, 1,
0.1078749, 1.267219, 0.3013378, 0, 0.7294118, 1, 1,
0.1108667, 1.436005, 0.442921, 0, 0.7254902, 1, 1,
0.1118141, -1.242865, 2.190595, 0, 0.7176471, 1, 1,
0.113061, 2.264807, -0.3474096, 0, 0.7137255, 1, 1,
0.1137177, 0.50859, 1.764149, 0, 0.7058824, 1, 1,
0.1179417, 0.1630341, 1.557806, 0, 0.6980392, 1, 1,
0.1191415, -0.138303, 1.699258, 0, 0.6941177, 1, 1,
0.1198926, -1.808134, 4.675279, 0, 0.6862745, 1, 1,
0.1240774, -2.212774, 4.240733, 0, 0.682353, 1, 1,
0.1249853, 1.025837, 0.3161229, 0, 0.6745098, 1, 1,
0.126025, -2.096339, 3.448259, 0, 0.6705883, 1, 1,
0.1276953, -1.486775, 3.364773, 0, 0.6627451, 1, 1,
0.1339867, -0.2127675, 3.015958, 0, 0.6588235, 1, 1,
0.1371086, 0.02711063, 1.680214, 0, 0.6509804, 1, 1,
0.139318, -1.763372, 4.188567, 0, 0.6470588, 1, 1,
0.1397542, 0.6281293, -0.2319745, 0, 0.6392157, 1, 1,
0.1421038, 0.4887621, 1.10257, 0, 0.6352941, 1, 1,
0.1428315, 1.303952, -1.061296, 0, 0.627451, 1, 1,
0.1496654, 0.4778875, 0.2540678, 0, 0.6235294, 1, 1,
0.1505129, -0.2684702, 2.907618, 0, 0.6156863, 1, 1,
0.151975, -0.8290271, 2.979434, 0, 0.6117647, 1, 1,
0.1532439, 0.6002522, 0.08264701, 0, 0.6039216, 1, 1,
0.1544532, 0.3943421, 0.5281425, 0, 0.5960785, 1, 1,
0.15568, 0.01851038, 1.399676, 0, 0.5921569, 1, 1,
0.1579938, 0.79539, 0.2752791, 0, 0.5843138, 1, 1,
0.1584752, -0.1059633, 1.690091, 0, 0.5803922, 1, 1,
0.1587175, 0.01703805, 0.4351611, 0, 0.572549, 1, 1,
0.1591517, -0.8506408, 2.278788, 0, 0.5686275, 1, 1,
0.159576, -0.03341475, 3.134709, 0, 0.5607843, 1, 1,
0.160046, -0.4693076, 2.337553, 0, 0.5568628, 1, 1,
0.161609, -2.097725, 2.186622, 0, 0.5490196, 1, 1,
0.1626093, -0.5753356, 2.132106, 0, 0.5450981, 1, 1,
0.1669572, -0.2271243, 3.296811, 0, 0.5372549, 1, 1,
0.1687516, -0.09001636, 1.037578, 0, 0.5333334, 1, 1,
0.1703881, 0.1668423, 1.211927, 0, 0.5254902, 1, 1,
0.1793729, 0.6948156, 0.440488, 0, 0.5215687, 1, 1,
0.1809458, -1.157376, 2.787177, 0, 0.5137255, 1, 1,
0.1818229, -0.9491633, 2.520897, 0, 0.509804, 1, 1,
0.1828209, -1.093874, 3.082432, 0, 0.5019608, 1, 1,
0.1883848, 0.7046977, 1.539442, 0, 0.4941176, 1, 1,
0.1900838, -0.2817076, 3.183667, 0, 0.4901961, 1, 1,
0.2062413, -0.08232134, 2.670646, 0, 0.4823529, 1, 1,
0.2064413, 1.089703, 0.7840065, 0, 0.4784314, 1, 1,
0.2071451, 2.620651, -0.2879944, 0, 0.4705882, 1, 1,
0.2080343, 1.558027, 0.4150297, 0, 0.4666667, 1, 1,
0.2081131, -1.358677, 3.572034, 0, 0.4588235, 1, 1,
0.2083124, -0.2751133, 2.88569, 0, 0.454902, 1, 1,
0.21035, -0.6873029, 2.909787, 0, 0.4470588, 1, 1,
0.2139645, -0.6958876, 4.685064, 0, 0.4431373, 1, 1,
0.2144643, 0.08197396, -0.3559544, 0, 0.4352941, 1, 1,
0.2155369, -0.3188793, 0.7530237, 0, 0.4313726, 1, 1,
0.2200779, 0.8969694, -2.177201, 0, 0.4235294, 1, 1,
0.2311864, 0.8963478, 1.24789, 0, 0.4196078, 1, 1,
0.2376754, 0.5549266, -1.327857, 0, 0.4117647, 1, 1,
0.2382701, 0.3296432, 1.906026, 0, 0.4078431, 1, 1,
0.239029, -0.3294107, 1.772972, 0, 0.4, 1, 1,
0.2397813, 0.3907688, 0.4496284, 0, 0.3921569, 1, 1,
0.2521992, -0.0754324, 3.228723, 0, 0.3882353, 1, 1,
0.2571028, 1.239483, -0.7346516, 0, 0.3803922, 1, 1,
0.2631534, 1.487288, 0.3481432, 0, 0.3764706, 1, 1,
0.2705367, -2.243881, 1.859557, 0, 0.3686275, 1, 1,
0.2705662, 1.435127, 0.6056216, 0, 0.3647059, 1, 1,
0.270734, -0.9421224, 3.508041, 0, 0.3568628, 1, 1,
0.2736596, -0.6703145, 3.225369, 0, 0.3529412, 1, 1,
0.2744479, 0.9085314, 0.7444063, 0, 0.345098, 1, 1,
0.2744963, -0.1410548, 3.17612, 0, 0.3411765, 1, 1,
0.2754036, -0.509486, 3.014685, 0, 0.3333333, 1, 1,
0.2848517, -1.988203, 3.859827, 0, 0.3294118, 1, 1,
0.2874568, -1.309313, 4.437647, 0, 0.3215686, 1, 1,
0.2936528, 1.107447, 1.553849, 0, 0.3176471, 1, 1,
0.2938741, -0.8420579, 1.568124, 0, 0.3098039, 1, 1,
0.2945995, 0.6642803, 0.3687353, 0, 0.3058824, 1, 1,
0.2949123, 0.02725865, 1.857429, 0, 0.2980392, 1, 1,
0.3005736, -0.691759, 3.6368, 0, 0.2901961, 1, 1,
0.3020949, 1.824097, 1.017115, 0, 0.2862745, 1, 1,
0.3031269, 0.6883728, 1.537454, 0, 0.2784314, 1, 1,
0.3034582, -0.7830468, 3.444564, 0, 0.2745098, 1, 1,
0.3037828, -1.128388, 3.541373, 0, 0.2666667, 1, 1,
0.3049847, 0.3610055, 1.54513, 0, 0.2627451, 1, 1,
0.3163251, -0.06954301, 0.4885209, 0, 0.254902, 1, 1,
0.320777, -0.7489046, 4.374622, 0, 0.2509804, 1, 1,
0.3246106, -1.266036, 2.697935, 0, 0.2431373, 1, 1,
0.3262095, 0.6023778, 0.8810925, 0, 0.2392157, 1, 1,
0.3276644, -2.172684, 3.6631, 0, 0.2313726, 1, 1,
0.3290256, 0.1965902, 1.426031, 0, 0.227451, 1, 1,
0.3300995, 0.2515807, 0.8222114, 0, 0.2196078, 1, 1,
0.3362105, -0.3101619, 1.112686, 0, 0.2156863, 1, 1,
0.3435359, 0.5213453, 0.3678201, 0, 0.2078431, 1, 1,
0.3463455, -0.6016855, 3.178129, 0, 0.2039216, 1, 1,
0.3512838, -0.180478, 1.210315, 0, 0.1960784, 1, 1,
0.351583, -1.234748, 3.528519, 0, 0.1882353, 1, 1,
0.3517613, 3.251425, -0.297659, 0, 0.1843137, 1, 1,
0.3543175, -2.022922, 2.449282, 0, 0.1764706, 1, 1,
0.3560189, 1.37302, -1.065111, 0, 0.172549, 1, 1,
0.3588846, -0.4370434, 1.941064, 0, 0.1647059, 1, 1,
0.3617159, -0.4872275, 3.183889, 0, 0.1607843, 1, 1,
0.3646847, 0.9687163, 1.073192, 0, 0.1529412, 1, 1,
0.3675404, -1.744398, 3.047757, 0, 0.1490196, 1, 1,
0.3705447, 0.9375077, 0.301576, 0, 0.1411765, 1, 1,
0.3712947, -3.499773, 3.244972, 0, 0.1372549, 1, 1,
0.3715062, -0.2568108, 2.604077, 0, 0.1294118, 1, 1,
0.3746378, 0.6230848, 0.7819709, 0, 0.1254902, 1, 1,
0.3764873, 1.251823, 0.04850097, 0, 0.1176471, 1, 1,
0.376753, 0.8161723, -0.6577799, 0, 0.1137255, 1, 1,
0.3792769, -0.903479, 4.696076, 0, 0.1058824, 1, 1,
0.3792851, -0.1942392, 0.0681845, 0, 0.09803922, 1, 1,
0.3877671, -0.06270213, 0.6513044, 0, 0.09411765, 1, 1,
0.3895156, -0.9267473, 3.803187, 0, 0.08627451, 1, 1,
0.3900163, 0.8726742, -0.8203072, 0, 0.08235294, 1, 1,
0.3969906, 0.3173763, -0.7872304, 0, 0.07450981, 1, 1,
0.3970952, 0.3807171, 2.723324, 0, 0.07058824, 1, 1,
0.3995935, -0.3249862, 4.009423, 0, 0.0627451, 1, 1,
0.4013678, 0.7344654, 0.9615955, 0, 0.05882353, 1, 1,
0.402596, 0.2617224, 2.404582, 0, 0.05098039, 1, 1,
0.4035123, -1.583067, 3.575183, 0, 0.04705882, 1, 1,
0.4060075, -0.3100017, 2.687537, 0, 0.03921569, 1, 1,
0.4062206, 1.620964, 1.210911, 0, 0.03529412, 1, 1,
0.413581, 1.037326, 2.117268, 0, 0.02745098, 1, 1,
0.4166682, -1.175356, 2.816087, 0, 0.02352941, 1, 1,
0.422125, -2.17905, 1.768586, 0, 0.01568628, 1, 1,
0.4240911, 0.6440055, 1.481819, 0, 0.01176471, 1, 1,
0.4304951, 0.8472317, 1.838241, 0, 0.003921569, 1, 1,
0.4331603, 0.9081587, -1.113677, 0.003921569, 0, 1, 1,
0.4347531, 0.5444084, 0.4010611, 0.007843138, 0, 1, 1,
0.4350541, 0.380572, -0.006229747, 0.01568628, 0, 1, 1,
0.4362824, 0.6156794, 2.590121, 0.01960784, 0, 1, 1,
0.4418472, 0.6300247, 1.316426, 0.02745098, 0, 1, 1,
0.447644, -0.8674279, 2.518501, 0.03137255, 0, 1, 1,
0.447825, 0.8594346, -0.1493818, 0.03921569, 0, 1, 1,
0.4481837, 1.334537, -1.110832, 0.04313726, 0, 1, 1,
0.4519898, 0.3387295, 0.9625866, 0.05098039, 0, 1, 1,
0.4520728, -0.09791567, 1.701761, 0.05490196, 0, 1, 1,
0.4549835, -0.01643902, 0.400867, 0.0627451, 0, 1, 1,
0.4556525, -0.9221935, 2.017738, 0.06666667, 0, 1, 1,
0.4583988, 1.284441, -0.7689846, 0.07450981, 0, 1, 1,
0.4592021, 0.9620896, 0.03361051, 0.07843138, 0, 1, 1,
0.461394, -0.2522464, 1.195921, 0.08627451, 0, 1, 1,
0.4672379, 0.1082832, 0.4878753, 0.09019608, 0, 1, 1,
0.4680426, -0.9232738, 2.115269, 0.09803922, 0, 1, 1,
0.4708015, -1.309788, 1.524403, 0.1058824, 0, 1, 1,
0.473133, 0.8608521, 0.3327791, 0.1098039, 0, 1, 1,
0.4744945, 0.539896, 2.011385, 0.1176471, 0, 1, 1,
0.4750909, -0.4306912, 1.728704, 0.1215686, 0, 1, 1,
0.4757854, -2.267887, 1.791493, 0.1294118, 0, 1, 1,
0.4767516, 0.4192939, -0.3056236, 0.1333333, 0, 1, 1,
0.4768612, -0.9194254, 2.867971, 0.1411765, 0, 1, 1,
0.4779208, 0.8967889, 1.273923, 0.145098, 0, 1, 1,
0.4780032, 0.9315001, -0.6787711, 0.1529412, 0, 1, 1,
0.4796404, 0.3768906, 1.619725, 0.1568628, 0, 1, 1,
0.4799984, -1.855927, 2.104635, 0.1647059, 0, 1, 1,
0.4807563, 0.3522703, 0.8051302, 0.1686275, 0, 1, 1,
0.4810524, -0.5365545, 2.696147, 0.1764706, 0, 1, 1,
0.4863696, 2.609532, 1.302984, 0.1803922, 0, 1, 1,
0.4875545, 2.029729, 1.151875, 0.1882353, 0, 1, 1,
0.4971265, 1.709594, 0.7997705, 0.1921569, 0, 1, 1,
0.5017421, -1.008123, 1.84886, 0.2, 0, 1, 1,
0.5070413, -1.586989, 2.918909, 0.2078431, 0, 1, 1,
0.508186, -1.866231, 1.467239, 0.2117647, 0, 1, 1,
0.5131832, -1.731437, 2.892582, 0.2196078, 0, 1, 1,
0.5134423, -1.288236, 1.040829, 0.2235294, 0, 1, 1,
0.5160325, 1.906356, -0.643766, 0.2313726, 0, 1, 1,
0.5169666, -2.046049, 2.685594, 0.2352941, 0, 1, 1,
0.5180029, 0.7236577, 0.1559573, 0.2431373, 0, 1, 1,
0.5207478, -0.4622652, 2.451808, 0.2470588, 0, 1, 1,
0.5267275, -2.348905, 3.168135, 0.254902, 0, 1, 1,
0.5371403, -1.36887, 4.987854, 0.2588235, 0, 1, 1,
0.537243, -1.307333, 2.292627, 0.2666667, 0, 1, 1,
0.5410585, 2.034611, -0.8035786, 0.2705882, 0, 1, 1,
0.5528631, -1.311641, 2.824508, 0.2784314, 0, 1, 1,
0.5556015, 0.2243492, 1.921651, 0.282353, 0, 1, 1,
0.5573512, 0.454381, 0.1459784, 0.2901961, 0, 1, 1,
0.5589839, 1.08752, -0.537932, 0.2941177, 0, 1, 1,
0.5617505, -1.254297, 2.773658, 0.3019608, 0, 1, 1,
0.5653136, 0.3133978, 0.7745759, 0.3098039, 0, 1, 1,
0.5659138, -1.593454, 3.188098, 0.3137255, 0, 1, 1,
0.5663397, -0.8051171, 3.171943, 0.3215686, 0, 1, 1,
0.5740582, 0.2626152, 1.618243, 0.3254902, 0, 1, 1,
0.5740784, -0.483538, 3.17368, 0.3333333, 0, 1, 1,
0.574685, -0.4259537, 1.876515, 0.3372549, 0, 1, 1,
0.5762795, 0.5540621, 0.2412411, 0.345098, 0, 1, 1,
0.5766072, 1.267188, -1.103417, 0.3490196, 0, 1, 1,
0.5777414, -2.028594, 1.881174, 0.3568628, 0, 1, 1,
0.5802447, -2.337623, 2.057132, 0.3607843, 0, 1, 1,
0.5821947, -1.972551, 3.181113, 0.3686275, 0, 1, 1,
0.5849043, -1.372247, 3.587871, 0.372549, 0, 1, 1,
0.585952, -0.5406549, 0.8444311, 0.3803922, 0, 1, 1,
0.587515, 1.796856, -2.444063, 0.3843137, 0, 1, 1,
0.5986302, 0.1444949, -0.1686203, 0.3921569, 0, 1, 1,
0.6001227, 0.04072316, 2.194283, 0.3960784, 0, 1, 1,
0.606223, 0.3046983, -0.07081204, 0.4039216, 0, 1, 1,
0.6067969, -1.364128, 1.038465, 0.4117647, 0, 1, 1,
0.6081601, -0.9865311, -0.1418903, 0.4156863, 0, 1, 1,
0.6103407, -1.370858, 3.609049, 0.4235294, 0, 1, 1,
0.6163567, -0.3280002, 4.290206, 0.427451, 0, 1, 1,
0.6204702, 0.2961259, 0.2991943, 0.4352941, 0, 1, 1,
0.6236282, 1.306074, 1.500163, 0.4392157, 0, 1, 1,
0.6426191, 0.4422888, -0.5012959, 0.4470588, 0, 1, 1,
0.6499583, -0.2129547, 0.7870402, 0.4509804, 0, 1, 1,
0.6504407, 2.104174, -1.211605, 0.4588235, 0, 1, 1,
0.6518483, -0.7639325, 3.200601, 0.4627451, 0, 1, 1,
0.652317, -0.2812654, 2.158359, 0.4705882, 0, 1, 1,
0.6527929, -1.216116, 1.837273, 0.4745098, 0, 1, 1,
0.6612235, 1.04393, 0.1137163, 0.4823529, 0, 1, 1,
0.6657405, 0.07631432, 1.544501, 0.4862745, 0, 1, 1,
0.6670008, 0.1529431, 1.103267, 0.4941176, 0, 1, 1,
0.6748352, 0.3853175, 0.7814806, 0.5019608, 0, 1, 1,
0.6752869, -2.589799, 2.304451, 0.5058824, 0, 1, 1,
0.6779119, -0.2042086, 1.830349, 0.5137255, 0, 1, 1,
0.6792706, -0.09802949, -0.038139, 0.5176471, 0, 1, 1,
0.6837733, 0.9133049, 1.631631, 0.5254902, 0, 1, 1,
0.6838917, 1.671431, 0.1526304, 0.5294118, 0, 1, 1,
0.6845939, 0.3828178, 0.1539548, 0.5372549, 0, 1, 1,
0.6864024, 0.02263341, 1.181383, 0.5411765, 0, 1, 1,
0.6887065, -1.040484, 2.290613, 0.5490196, 0, 1, 1,
0.6959315, 0.6172398, -0.01283271, 0.5529412, 0, 1, 1,
0.7005816, 1.017763, 1.044094, 0.5607843, 0, 1, 1,
0.7018499, -0.6465816, 3.001122, 0.5647059, 0, 1, 1,
0.702503, 0.6680383, 1.928975, 0.572549, 0, 1, 1,
0.7114962, -0.07708883, 0.04397555, 0.5764706, 0, 1, 1,
0.7143198, 0.510992, 0.8524617, 0.5843138, 0, 1, 1,
0.7185792, 0.8840472, 1.185833, 0.5882353, 0, 1, 1,
0.7199349, 1.418091, 0.4508643, 0.5960785, 0, 1, 1,
0.720063, -0.321176, 2.147766, 0.6039216, 0, 1, 1,
0.7219758, -0.13079, 2.477476, 0.6078432, 0, 1, 1,
0.7235981, -0.9597224, 1.414426, 0.6156863, 0, 1, 1,
0.7297945, 0.04813219, 2.583836, 0.6196079, 0, 1, 1,
0.7366022, 0.6646802, 1.438272, 0.627451, 0, 1, 1,
0.7389542, 0.5289605, -0.6435729, 0.6313726, 0, 1, 1,
0.7390895, 0.1333209, 0.7488565, 0.6392157, 0, 1, 1,
0.740766, -0.08141541, 4.425852, 0.6431373, 0, 1, 1,
0.7420526, -1.275231, 2.444464, 0.6509804, 0, 1, 1,
0.7444004, -0.4461132, 3.441117, 0.654902, 0, 1, 1,
0.744539, 0.03337667, -1.052702, 0.6627451, 0, 1, 1,
0.7476733, -1.044919, 2.150339, 0.6666667, 0, 1, 1,
0.7480426, 1.085987, 0.6602432, 0.6745098, 0, 1, 1,
0.7484715, -0.765774, 2.411622, 0.6784314, 0, 1, 1,
0.7485227, -0.01732933, 3.571734, 0.6862745, 0, 1, 1,
0.7501765, -0.9837083, 1.162117, 0.6901961, 0, 1, 1,
0.7503268, 0.2610941, 1.299853, 0.6980392, 0, 1, 1,
0.7549093, 0.7630165, -1.134164, 0.7058824, 0, 1, 1,
0.76039, 0.1535904, 1.560188, 0.7098039, 0, 1, 1,
0.7669964, 0.5319711, 0.6610584, 0.7176471, 0, 1, 1,
0.7706201, -0.5446088, 1.203498, 0.7215686, 0, 1, 1,
0.7748778, 1.235896, -0.4974358, 0.7294118, 0, 1, 1,
0.775664, -0.445847, 1.759192, 0.7333333, 0, 1, 1,
0.7759895, -1.411514, 3.282666, 0.7411765, 0, 1, 1,
0.7780144, -0.2267769, 1.774696, 0.7450981, 0, 1, 1,
0.7825585, 2.066461, -0.8796453, 0.7529412, 0, 1, 1,
0.7830993, 0.01214235, 1.306364, 0.7568628, 0, 1, 1,
0.7840826, 0.434347, 2.412065, 0.7647059, 0, 1, 1,
0.7855107, 1.783161, 0.908859, 0.7686275, 0, 1, 1,
0.7863066, -1.314561, 4.493289, 0.7764706, 0, 1, 1,
0.7946608, -1.420472, 3.482748, 0.7803922, 0, 1, 1,
0.8050874, -0.8331435, 1.82691, 0.7882353, 0, 1, 1,
0.8120027, -0.256265, 1.522859, 0.7921569, 0, 1, 1,
0.8169824, 0.4618393, 1.983002, 0.8, 0, 1, 1,
0.8208501, -0.5279008, 3.23915, 0.8078431, 0, 1, 1,
0.8208504, -0.8663126, 1.776397, 0.8117647, 0, 1, 1,
0.8213977, -0.6706583, 2.248612, 0.8196079, 0, 1, 1,
0.8240036, -0.5928125, 3.14649, 0.8235294, 0, 1, 1,
0.8276635, 1.92379, 0.36751, 0.8313726, 0, 1, 1,
0.8286117, 0.4307771, 3.824332, 0.8352941, 0, 1, 1,
0.8330995, -0.1946555, 0.4347537, 0.8431373, 0, 1, 1,
0.8332115, 0.06869638, 1.235196, 0.8470588, 0, 1, 1,
0.8370176, 0.5309395, 1.875751, 0.854902, 0, 1, 1,
0.8428665, 0.549008, 2.869626, 0.8588235, 0, 1, 1,
0.8450235, -0.8257811, 0.2388482, 0.8666667, 0, 1, 1,
0.8455167, -0.5042674, 2.508063, 0.8705882, 0, 1, 1,
0.8561659, 0.7981508, 2.658097, 0.8784314, 0, 1, 1,
0.8564379, 1.147827, -0.8828238, 0.8823529, 0, 1, 1,
0.8564515, 0.1562812, 1.976304, 0.8901961, 0, 1, 1,
0.8594616, 1.135021, 0.3962852, 0.8941177, 0, 1, 1,
0.8602647, -0.2346773, 3.149169, 0.9019608, 0, 1, 1,
0.8668549, -1.295708, 4.257857, 0.9098039, 0, 1, 1,
0.8676418, -1.871815, 1.89929, 0.9137255, 0, 1, 1,
0.8684696, -0.2960575, 2.067522, 0.9215686, 0, 1, 1,
0.8703895, -0.298341, 1.693025, 0.9254902, 0, 1, 1,
0.8709083, 0.6235341, 2.28084, 0.9333333, 0, 1, 1,
0.8717365, 0.4713056, 2.541993, 0.9372549, 0, 1, 1,
0.8735326, 1.174149, 0.9438769, 0.945098, 0, 1, 1,
0.8769933, 0.8252448, 0.3812669, 0.9490196, 0, 1, 1,
0.8776671, 0.9624003, 0.1907081, 0.9568627, 0, 1, 1,
0.8789314, 1.126229, -0.09335666, 0.9607843, 0, 1, 1,
0.8792877, 1.317502, 0.7298826, 0.9686275, 0, 1, 1,
0.8809234, -0.2702754, 2.003792, 0.972549, 0, 1, 1,
0.8833809, 0.1580297, -0.2501587, 0.9803922, 0, 1, 1,
0.8898744, -0.4579069, 2.049744, 0.9843137, 0, 1, 1,
0.8904231, 1.302852, -0.8986534, 0.9921569, 0, 1, 1,
0.8916595, 1.995118, -0.3088917, 0.9960784, 0, 1, 1,
0.892359, -0.6899135, -0.02480791, 1, 0, 0.9960784, 1,
0.893183, -0.9934983, 3.044565, 1, 0, 0.9882353, 1,
0.8936155, -0.6354206, 2.317924, 1, 0, 0.9843137, 1,
0.8950455, -0.4821757, 1.02197, 1, 0, 0.9764706, 1,
0.8996508, 1.725001, 0.8053502, 1, 0, 0.972549, 1,
0.9018908, -0.2979997, 0.8000698, 1, 0, 0.9647059, 1,
0.9043408, -1.110893, 2.243022, 1, 0, 0.9607843, 1,
0.9189966, 1.363463, 1.988739, 1, 0, 0.9529412, 1,
0.9248747, -0.2433224, 0.06840479, 1, 0, 0.9490196, 1,
0.9339929, 0.8549204, -0.1164551, 1, 0, 0.9411765, 1,
0.9362152, 0.5808263, 0.9642355, 1, 0, 0.9372549, 1,
0.9399868, 1.129819, 0.9591194, 1, 0, 0.9294118, 1,
0.9423057, 0.06254533, 0.2508823, 1, 0, 0.9254902, 1,
0.945515, -2.572116, 3.470336, 1, 0, 0.9176471, 1,
0.952574, 1.894554, 1.529704, 1, 0, 0.9137255, 1,
0.963653, 0.4184173, 2.208483, 1, 0, 0.9058824, 1,
0.9655696, 0.4543116, 0.3553824, 1, 0, 0.9019608, 1,
0.9766018, -0.2827717, 3.508911, 1, 0, 0.8941177, 1,
0.977645, -1.285744, 3.614118, 1, 0, 0.8862745, 1,
0.9912523, 0.9495869, -0.661999, 1, 0, 0.8823529, 1,
0.992161, 0.3257689, 0.2248843, 1, 0, 0.8745098, 1,
1.004629, 0.08299673, 2.88369, 1, 0, 0.8705882, 1,
1.007122, -2.315916, 1.971383, 1, 0, 0.8627451, 1,
1.012621, -0.9803392, 2.447853, 1, 0, 0.8588235, 1,
1.023406, 2.998348, 1.277107, 1, 0, 0.8509804, 1,
1.025143, 2.539448, 0.8500156, 1, 0, 0.8470588, 1,
1.033512, -0.7653266, 2.997969, 1, 0, 0.8392157, 1,
1.045191, 0.7359478, 0.9812487, 1, 0, 0.8352941, 1,
1.052777, 0.9210954, 0.5014457, 1, 0, 0.827451, 1,
1.062747, 1.007762, 2.416089, 1, 0, 0.8235294, 1,
1.064345, 0.6503157, -0.8237368, 1, 0, 0.8156863, 1,
1.064543, 0.5949851, 1.729181, 1, 0, 0.8117647, 1,
1.069285, 0.1126404, -0.54693, 1, 0, 0.8039216, 1,
1.071071, -2.794064, 1.314968, 1, 0, 0.7960784, 1,
1.071734, 0.3593425, -0.1607814, 1, 0, 0.7921569, 1,
1.075856, 1.249812, -0.7057578, 1, 0, 0.7843137, 1,
1.080697, -1.079894, 2.374631, 1, 0, 0.7803922, 1,
1.084591, -2.052765, 1.940348, 1, 0, 0.772549, 1,
1.089297, 0.4865573, 0.9566366, 1, 0, 0.7686275, 1,
1.091047, 0.9226625, 0.1700538, 1, 0, 0.7607843, 1,
1.091419, -1.706561, 4.540733, 1, 0, 0.7568628, 1,
1.102768, -0.1805378, 2.147929, 1, 0, 0.7490196, 1,
1.103363, 0.1336214, 1.422714, 1, 0, 0.7450981, 1,
1.110445, -1.346839, 2.606373, 1, 0, 0.7372549, 1,
1.111287, 0.7045081, 1.834448, 1, 0, 0.7333333, 1,
1.111936, -1.068443, 0.9084969, 1, 0, 0.7254902, 1,
1.113211, 0.2674519, 0.03350715, 1, 0, 0.7215686, 1,
1.116067, 0.4231607, 1.255759, 1, 0, 0.7137255, 1,
1.121591, 0.4281567, 1.308643, 1, 0, 0.7098039, 1,
1.122746, -1.409681, 3.183949, 1, 0, 0.7019608, 1,
1.123562, -0.0961478, 2.394259, 1, 0, 0.6941177, 1,
1.129192, 0.1027565, 1.337861, 1, 0, 0.6901961, 1,
1.130146, -0.7923869, 4.331286, 1, 0, 0.682353, 1,
1.131464, -1.166852, 1.332564, 1, 0, 0.6784314, 1,
1.136206, -1.191442, 2.431203, 1, 0, 0.6705883, 1,
1.143238, 0.5238102, 0.171895, 1, 0, 0.6666667, 1,
1.148726, -0.4803401, 3.416529, 1, 0, 0.6588235, 1,
1.153387, -0.8827962, 2.715668, 1, 0, 0.654902, 1,
1.159027, -0.5325932, 2.382465, 1, 0, 0.6470588, 1,
1.16279, 0.8101714, 1.582404, 1, 0, 0.6431373, 1,
1.188917, 0.2445659, 2.16154, 1, 0, 0.6352941, 1,
1.196266, -1.041808, 2.77712, 1, 0, 0.6313726, 1,
1.202512, 0.5182289, 1.920307, 1, 0, 0.6235294, 1,
1.206752, 0.4516592, 2.019933, 1, 0, 0.6196079, 1,
1.210532, 0.9314578, 0.8328801, 1, 0, 0.6117647, 1,
1.21057, 0.02541516, 0.4904381, 1, 0, 0.6078432, 1,
1.213517, 1.056257, -0.5965384, 1, 0, 0.6, 1,
1.21893, -1.310983, 3.294279, 1, 0, 0.5921569, 1,
1.241011, -0.197466, -0.4538152, 1, 0, 0.5882353, 1,
1.255815, -0.4526419, 0.4628062, 1, 0, 0.5803922, 1,
1.255849, 0.5414533, 1.267664, 1, 0, 0.5764706, 1,
1.262839, -1.408927, 2.426315, 1, 0, 0.5686275, 1,
1.275268, -0.5825958, 1.848172, 1, 0, 0.5647059, 1,
1.293556, -2.232317, 4.533164, 1, 0, 0.5568628, 1,
1.314282, -0.3661218, 0.2306463, 1, 0, 0.5529412, 1,
1.320662, 0.9944653, 0.3954442, 1, 0, 0.5450981, 1,
1.3245, -0.7620021, 0.5823555, 1, 0, 0.5411765, 1,
1.324707, 0.2854138, 1.633286, 1, 0, 0.5333334, 1,
1.327743, -0.3991881, 1.031659, 1, 0, 0.5294118, 1,
1.331541, 0.2362489, 2.155978, 1, 0, 0.5215687, 1,
1.338855, -0.9925857, 2.143081, 1, 0, 0.5176471, 1,
1.345981, -0.1700721, 2.475173, 1, 0, 0.509804, 1,
1.349498, 0.4337541, 2.733063, 1, 0, 0.5058824, 1,
1.360853, -0.3995986, 1.9046, 1, 0, 0.4980392, 1,
1.37246, 0.475462, 1.474585, 1, 0, 0.4901961, 1,
1.379603, -0.4827411, 1.915256, 1, 0, 0.4862745, 1,
1.383197, 0.1980399, -0.3139245, 1, 0, 0.4784314, 1,
1.385758, 1.949503, 2.700834, 1, 0, 0.4745098, 1,
1.388984, -1.038775, 0.9928912, 1, 0, 0.4666667, 1,
1.389503, -1.376882, 3.067519, 1, 0, 0.4627451, 1,
1.392667, -0.1368676, 2.336895, 1, 0, 0.454902, 1,
1.396515, -0.5513965, 2.624249, 1, 0, 0.4509804, 1,
1.400151, -1.095417, 2.051594, 1, 0, 0.4431373, 1,
1.401503, -0.2246069, 0.3269528, 1, 0, 0.4392157, 1,
1.402112, -0.3393619, 1.850123, 1, 0, 0.4313726, 1,
1.404195, -0.1926942, 0.4815843, 1, 0, 0.427451, 1,
1.411609, -1.185714, 3.988288, 1, 0, 0.4196078, 1,
1.430122, -0.1189537, 1.890642, 1, 0, 0.4156863, 1,
1.447987, 1.904443, 0.4963609, 1, 0, 0.4078431, 1,
1.461134, 1.562787, -0.1347097, 1, 0, 0.4039216, 1,
1.468277, 0.4035536, 2.119424, 1, 0, 0.3960784, 1,
1.472764, 1.25094, 0.726853, 1, 0, 0.3882353, 1,
1.48797, 1.081632, 0.03832954, 1, 0, 0.3843137, 1,
1.507931, 1.963927, 2.097707, 1, 0, 0.3764706, 1,
1.515921, 0.6582893, -0.03396867, 1, 0, 0.372549, 1,
1.541682, 1.184204, 0.4382805, 1, 0, 0.3647059, 1,
1.541698, 0.7782476, 2.805719, 1, 0, 0.3607843, 1,
1.545502, 1.977189, 3.001719, 1, 0, 0.3529412, 1,
1.566123, 0.9480426, 1.314211, 1, 0, 0.3490196, 1,
1.579556, 0.004737029, -0.6378656, 1, 0, 0.3411765, 1,
1.590949, -1.57265, 1.946213, 1, 0, 0.3372549, 1,
1.593462, -0.7080836, 0.2424556, 1, 0, 0.3294118, 1,
1.603038, -0.4785168, 1.808005, 1, 0, 0.3254902, 1,
1.608657, -0.127219, 1.468974, 1, 0, 0.3176471, 1,
1.612601, -0.3356726, 3.61733, 1, 0, 0.3137255, 1,
1.637144, 0.3396305, 0.111523, 1, 0, 0.3058824, 1,
1.654707, 0.7321305, 0.8427869, 1, 0, 0.2980392, 1,
1.65634, -0.3616431, 1.526578, 1, 0, 0.2941177, 1,
1.663284, 1.524441, 1.885285, 1, 0, 0.2862745, 1,
1.667372, -1.989499, 1.845349, 1, 0, 0.282353, 1,
1.669873, 1.505944, 0.4239641, 1, 0, 0.2745098, 1,
1.721371, -1.533888, 1.930076, 1, 0, 0.2705882, 1,
1.762333, 0.7076914, 2.542227, 1, 0, 0.2627451, 1,
1.770995, 0.2603458, 2.992229, 1, 0, 0.2588235, 1,
1.778456, -1.043385, 0.4879042, 1, 0, 0.2509804, 1,
1.782496, 0.6073205, 0.3557366, 1, 0, 0.2470588, 1,
1.78716, 0.6571895, 0.5286848, 1, 0, 0.2392157, 1,
1.793441, -0.8893257, 2.528582, 1, 0, 0.2352941, 1,
1.802849, -0.7684611, 1.337625, 1, 0, 0.227451, 1,
1.825239, 0.8171728, 2.069702, 1, 0, 0.2235294, 1,
1.826005, 0.0611173, 2.282716, 1, 0, 0.2156863, 1,
1.841028, -0.2125127, 2.693569, 1, 0, 0.2117647, 1,
1.841789, 1.123991, 0.6123376, 1, 0, 0.2039216, 1,
1.849956, -1.169654, 2.264979, 1, 0, 0.1960784, 1,
1.851691, -0.52662, 0.8605757, 1, 0, 0.1921569, 1,
1.863612, 1.361726, 2.502912, 1, 0, 0.1843137, 1,
1.890167, 0.2289068, 2.413798, 1, 0, 0.1803922, 1,
1.929587, 0.2711889, 0.4824843, 1, 0, 0.172549, 1,
1.939563, -0.8249989, 2.640961, 1, 0, 0.1686275, 1,
1.967032, 0.2422236, -0.3678108, 1, 0, 0.1607843, 1,
1.980804, -0.8378869, 1.333558, 1, 0, 0.1568628, 1,
2.000111, -1.263197, 2.242947, 1, 0, 0.1490196, 1,
2.004064, 0.756418, 0.5384696, 1, 0, 0.145098, 1,
2.014001, 1.688003, 1.62649, 1, 0, 0.1372549, 1,
2.02442, 0.1337137, 3.77315, 1, 0, 0.1333333, 1,
2.047917, -0.466502, 2.969889, 1, 0, 0.1254902, 1,
2.051271, -0.4333813, 1.89197, 1, 0, 0.1215686, 1,
2.063841, 1.638814, 1.814823, 1, 0, 0.1137255, 1,
2.074596, -1.797221, 3.165133, 1, 0, 0.1098039, 1,
2.080328, 0.948807, 2.334642, 1, 0, 0.1019608, 1,
2.155053, -0.2700213, 0.2661707, 1, 0, 0.09411765, 1,
2.251142, 0.8275576, 1.227524, 1, 0, 0.09019608, 1,
2.276633, -1.091357, 1.000825, 1, 0, 0.08235294, 1,
2.297892, 0.5673037, 0.8320233, 1, 0, 0.07843138, 1,
2.29972, -0.7017024, 0.93322, 1, 0, 0.07058824, 1,
2.312165, 1.044754, 0.9495454, 1, 0, 0.06666667, 1,
2.358814, 0.3891429, 1.409109, 1, 0, 0.05882353, 1,
2.374398, -0.4081563, 0.7422985, 1, 0, 0.05490196, 1,
2.41805, -0.6076892, 0.9476243, 1, 0, 0.04705882, 1,
2.501945, -0.1207605, 1.433734, 1, 0, 0.04313726, 1,
2.538473, 1.121701, -0.3149135, 1, 0, 0.03529412, 1,
2.882021, -1.13609, -0.1708985, 1, 0, 0.03137255, 1,
3.0009, 0.9720222, 2.449729, 1, 0, 0.02352941, 1,
3.134918, 0.1624069, 2.662318, 1, 0, 0.01960784, 1,
3.181759, 0.03039867, 1.558634, 1, 0, 0.01176471, 1,
3.444049, 0.5938542, 0.09494592, 1, 0, 0.007843138, 1
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
0.4195988, -4.644101, -6.898982, 0, -0.5, 0.5, 0.5,
0.4195988, -4.644101, -6.898982, 1, -0.5, 0.5, 0.5,
0.4195988, -4.644101, -6.898982, 1, 1.5, 0.5, 0.5,
0.4195988, -4.644101, -6.898982, 0, 1.5, 0.5, 0.5
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
-3.630141, -0.1241739, -6.898982, 0, -0.5, 0.5, 0.5,
-3.630141, -0.1241739, -6.898982, 1, -0.5, 0.5, 0.5,
-3.630141, -0.1241739, -6.898982, 1, 1.5, 0.5, 0.5,
-3.630141, -0.1241739, -6.898982, 0, 1.5, 0.5, 0.5
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
-3.630141, -4.644101, 0.2972705, 0, -0.5, 0.5, 0.5,
-3.630141, -4.644101, 0.2972705, 1, -0.5, 0.5, 0.5,
-3.630141, -4.644101, 0.2972705, 1, 1.5, 0.5, 0.5,
-3.630141, -4.644101, 0.2972705, 0, 1.5, 0.5, 0.5
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
-2, -3.601041, -5.238308,
3, -3.601041, -5.238308,
-2, -3.601041, -5.238308,
-2, -3.774884, -5.515087,
-1, -3.601041, -5.238308,
-1, -3.774884, -5.515087,
0, -3.601041, -5.238308,
0, -3.774884, -5.515087,
1, -3.601041, -5.238308,
1, -3.774884, -5.515087,
2, -3.601041, -5.238308,
2, -3.774884, -5.515087,
3, -3.601041, -5.238308,
3, -3.774884, -5.515087
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
-2, -4.122571, -6.068645, 0, -0.5, 0.5, 0.5,
-2, -4.122571, -6.068645, 1, -0.5, 0.5, 0.5,
-2, -4.122571, -6.068645, 1, 1.5, 0.5, 0.5,
-2, -4.122571, -6.068645, 0, 1.5, 0.5, 0.5,
-1, -4.122571, -6.068645, 0, -0.5, 0.5, 0.5,
-1, -4.122571, -6.068645, 1, -0.5, 0.5, 0.5,
-1, -4.122571, -6.068645, 1, 1.5, 0.5, 0.5,
-1, -4.122571, -6.068645, 0, 1.5, 0.5, 0.5,
0, -4.122571, -6.068645, 0, -0.5, 0.5, 0.5,
0, -4.122571, -6.068645, 1, -0.5, 0.5, 0.5,
0, -4.122571, -6.068645, 1, 1.5, 0.5, 0.5,
0, -4.122571, -6.068645, 0, 1.5, 0.5, 0.5,
1, -4.122571, -6.068645, 0, -0.5, 0.5, 0.5,
1, -4.122571, -6.068645, 1, -0.5, 0.5, 0.5,
1, -4.122571, -6.068645, 1, 1.5, 0.5, 0.5,
1, -4.122571, -6.068645, 0, 1.5, 0.5, 0.5,
2, -4.122571, -6.068645, 0, -0.5, 0.5, 0.5,
2, -4.122571, -6.068645, 1, -0.5, 0.5, 0.5,
2, -4.122571, -6.068645, 1, 1.5, 0.5, 0.5,
2, -4.122571, -6.068645, 0, 1.5, 0.5, 0.5,
3, -4.122571, -6.068645, 0, -0.5, 0.5, 0.5,
3, -4.122571, -6.068645, 1, -0.5, 0.5, 0.5,
3, -4.122571, -6.068645, 1, 1.5, 0.5, 0.5,
3, -4.122571, -6.068645, 0, 1.5, 0.5, 0.5
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
-2.695585, -3, -5.238308,
-2.695585, 3, -5.238308,
-2.695585, -3, -5.238308,
-2.851344, -3, -5.515087,
-2.695585, -2, -5.238308,
-2.851344, -2, -5.515087,
-2.695585, -1, -5.238308,
-2.851344, -1, -5.515087,
-2.695585, 0, -5.238308,
-2.851344, 0, -5.515087,
-2.695585, 1, -5.238308,
-2.851344, 1, -5.515087,
-2.695585, 2, -5.238308,
-2.851344, 2, -5.515087,
-2.695585, 3, -5.238308,
-2.851344, 3, -5.515087
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
-3.162863, -3, -6.068645, 0, -0.5, 0.5, 0.5,
-3.162863, -3, -6.068645, 1, -0.5, 0.5, 0.5,
-3.162863, -3, -6.068645, 1, 1.5, 0.5, 0.5,
-3.162863, -3, -6.068645, 0, 1.5, 0.5, 0.5,
-3.162863, -2, -6.068645, 0, -0.5, 0.5, 0.5,
-3.162863, -2, -6.068645, 1, -0.5, 0.5, 0.5,
-3.162863, -2, -6.068645, 1, 1.5, 0.5, 0.5,
-3.162863, -2, -6.068645, 0, 1.5, 0.5, 0.5,
-3.162863, -1, -6.068645, 0, -0.5, 0.5, 0.5,
-3.162863, -1, -6.068645, 1, -0.5, 0.5, 0.5,
-3.162863, -1, -6.068645, 1, 1.5, 0.5, 0.5,
-3.162863, -1, -6.068645, 0, 1.5, 0.5, 0.5,
-3.162863, 0, -6.068645, 0, -0.5, 0.5, 0.5,
-3.162863, 0, -6.068645, 1, -0.5, 0.5, 0.5,
-3.162863, 0, -6.068645, 1, 1.5, 0.5, 0.5,
-3.162863, 0, -6.068645, 0, 1.5, 0.5, 0.5,
-3.162863, 1, -6.068645, 0, -0.5, 0.5, 0.5,
-3.162863, 1, -6.068645, 1, -0.5, 0.5, 0.5,
-3.162863, 1, -6.068645, 1, 1.5, 0.5, 0.5,
-3.162863, 1, -6.068645, 0, 1.5, 0.5, 0.5,
-3.162863, 2, -6.068645, 0, -0.5, 0.5, 0.5,
-3.162863, 2, -6.068645, 1, -0.5, 0.5, 0.5,
-3.162863, 2, -6.068645, 1, 1.5, 0.5, 0.5,
-3.162863, 2, -6.068645, 0, 1.5, 0.5, 0.5,
-3.162863, 3, -6.068645, 0, -0.5, 0.5, 0.5,
-3.162863, 3, -6.068645, 1, -0.5, 0.5, 0.5,
-3.162863, 3, -6.068645, 1, 1.5, 0.5, 0.5,
-3.162863, 3, -6.068645, 0, 1.5, 0.5, 0.5
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
-2.695585, -3.601041, -4,
-2.695585, -3.601041, 4,
-2.695585, -3.601041, -4,
-2.851344, -3.774884, -4,
-2.695585, -3.601041, -2,
-2.851344, -3.774884, -2,
-2.695585, -3.601041, 0,
-2.851344, -3.774884, 0,
-2.695585, -3.601041, 2,
-2.851344, -3.774884, 2,
-2.695585, -3.601041, 4,
-2.851344, -3.774884, 4
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
-3.162863, -4.122571, -4, 0, -0.5, 0.5, 0.5,
-3.162863, -4.122571, -4, 1, -0.5, 0.5, 0.5,
-3.162863, -4.122571, -4, 1, 1.5, 0.5, 0.5,
-3.162863, -4.122571, -4, 0, 1.5, 0.5, 0.5,
-3.162863, -4.122571, -2, 0, -0.5, 0.5, 0.5,
-3.162863, -4.122571, -2, 1, -0.5, 0.5, 0.5,
-3.162863, -4.122571, -2, 1, 1.5, 0.5, 0.5,
-3.162863, -4.122571, -2, 0, 1.5, 0.5, 0.5,
-3.162863, -4.122571, 0, 0, -0.5, 0.5, 0.5,
-3.162863, -4.122571, 0, 1, -0.5, 0.5, 0.5,
-3.162863, -4.122571, 0, 1, 1.5, 0.5, 0.5,
-3.162863, -4.122571, 0, 0, 1.5, 0.5, 0.5,
-3.162863, -4.122571, 2, 0, -0.5, 0.5, 0.5,
-3.162863, -4.122571, 2, 1, -0.5, 0.5, 0.5,
-3.162863, -4.122571, 2, 1, 1.5, 0.5, 0.5,
-3.162863, -4.122571, 2, 0, 1.5, 0.5, 0.5,
-3.162863, -4.122571, 4, 0, -0.5, 0.5, 0.5,
-3.162863, -4.122571, 4, 1, -0.5, 0.5, 0.5,
-3.162863, -4.122571, 4, 1, 1.5, 0.5, 0.5,
-3.162863, -4.122571, 4, 0, 1.5, 0.5, 0.5
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
-2.695585, -3.601041, -5.238308,
-2.695585, 3.352693, -5.238308,
-2.695585, -3.601041, 5.832849,
-2.695585, 3.352693, 5.832849,
-2.695585, -3.601041, -5.238308,
-2.695585, -3.601041, 5.832849,
-2.695585, 3.352693, -5.238308,
-2.695585, 3.352693, 5.832849,
-2.695585, -3.601041, -5.238308,
3.534783, -3.601041, -5.238308,
-2.695585, -3.601041, 5.832849,
3.534783, -3.601041, 5.832849,
-2.695585, 3.352693, -5.238308,
3.534783, 3.352693, -5.238308,
-2.695585, 3.352693, 5.832849,
3.534783, 3.352693, 5.832849,
3.534783, -3.601041, -5.238308,
3.534783, 3.352693, -5.238308,
3.534783, -3.601041, 5.832849,
3.534783, 3.352693, 5.832849,
3.534783, -3.601041, -5.238308,
3.534783, -3.601041, 5.832849,
3.534783, 3.352693, -5.238308,
3.534783, 3.352693, 5.832849
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
var radius = 7.733367;
var distance = 34.40662;
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
mvMatrix.translate( -0.4195988, 0.1241739, -0.2972705 );
mvMatrix.scale( 1.34205, 1.202443, 0.7552479 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.40662);
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
dimethyldithiocarbam<-read.table("dimethyldithiocarbam.xyz")
```

```
## Error in read.table("dimethyldithiocarbam.xyz"): no lines available in input
```

```r
x<-dimethyldithiocarbam$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimethyldithiocarbam' not found
```

```r
y<-dimethyldithiocarbam$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimethyldithiocarbam' not found
```

```r
z<-dimethyldithiocarbam$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimethyldithiocarbam' not found
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
-2.604852, 0.7307965, -1.050795, 0, 0, 1, 1, 1,
-2.57506, -0.4756261, -1.53458, 1, 0, 0, 1, 1,
-2.531312, -0.3405915, -1.726622, 1, 0, 0, 1, 1,
-2.527537, -0.5915347, -2.256607, 1, 0, 0, 1, 1,
-2.525228, -2.285259, -0.7748801, 1, 0, 0, 1, 1,
-2.449242, 1.843337, -0.8397809, 1, 0, 0, 1, 1,
-2.448031, 0.05638267, -2.293425, 0, 0, 0, 1, 1,
-2.409891, 1.284983, -0.3013368, 0, 0, 0, 1, 1,
-2.407097, -1.261956, -1.436202, 0, 0, 0, 1, 1,
-2.405757, -0.2157416, -2.522992, 0, 0, 0, 1, 1,
-2.348697, -1.799298, -2.541713, 0, 0, 0, 1, 1,
-2.333192, -0.4768653, -2.257778, 0, 0, 0, 1, 1,
-2.322784, -1.181726, -0.8258128, 0, 0, 0, 1, 1,
-2.300571, -0.9732242, -2.556779, 1, 1, 1, 1, 1,
-2.270447, -0.7482722, -2.367418, 1, 1, 1, 1, 1,
-2.24134, -0.4707285, -2.992925, 1, 1, 1, 1, 1,
-2.233157, -0.3882042, -2.194223, 1, 1, 1, 1, 1,
-2.232091, 0.4493139, -1.961353, 1, 1, 1, 1, 1,
-2.230147, -0.8347053, -2.090414, 1, 1, 1, 1, 1,
-2.206775, -1.210772, -1.359501, 1, 1, 1, 1, 1,
-2.179578, 0.9768104, 0.2550598, 1, 1, 1, 1, 1,
-2.131428, -0.04549442, -2.187011, 1, 1, 1, 1, 1,
-2.099045, -0.3631514, -3.614059, 1, 1, 1, 1, 1,
-2.074447, 0.7532293, -2.983386, 1, 1, 1, 1, 1,
-2.06857, 0.5872898, -2.462198, 1, 1, 1, 1, 1,
-2.03888, -0.7131409, -1.285724, 1, 1, 1, 1, 1,
-2.006204, 1.714375, -1.272355, 1, 1, 1, 1, 1,
-1.999127, -0.9369243, -4.490667, 1, 1, 1, 1, 1,
-1.970863, 1.058803, -1.768479, 0, 0, 1, 1, 1,
-1.940188, -1.330705, -0.5691925, 1, 0, 0, 1, 1,
-1.939625, 0.05720816, -2.103252, 1, 0, 0, 1, 1,
-1.921143, 0.3834346, -1.355207, 1, 0, 0, 1, 1,
-1.91391, 0.163933, -1.22125, 1, 0, 0, 1, 1,
-1.904858, -1.846245, -2.545604, 1, 0, 0, 1, 1,
-1.904633, -1.181839, -2.204469, 0, 0, 0, 1, 1,
-1.90418, 2.8539, -1.060905, 0, 0, 0, 1, 1,
-1.891588, -1.191549, -2.988314, 0, 0, 0, 1, 1,
-1.889394, -1.29991, -2.220441, 0, 0, 0, 1, 1,
-1.888042, 0.8076315, -1.360356, 0, 0, 0, 1, 1,
-1.879988, -1.37516, -1.511111, 0, 0, 0, 1, 1,
-1.828331, 0.4752649, -0.4039462, 0, 0, 0, 1, 1,
-1.82294, -0.5322221, -0.4763206, 1, 1, 1, 1, 1,
-1.820098, 0.5573453, -0.3231205, 1, 1, 1, 1, 1,
-1.819522, -0.5785247, -1.769569, 1, 1, 1, 1, 1,
-1.817597, 0.3642195, -3.245427, 1, 1, 1, 1, 1,
-1.802722, -0.2065336, -2.819563, 1, 1, 1, 1, 1,
-1.788693, -1.170963, -2.7493, 1, 1, 1, 1, 1,
-1.773867, -0.8711306, -2.106233, 1, 1, 1, 1, 1,
-1.705211, 1.810529, -1.420579, 1, 1, 1, 1, 1,
-1.683699, 0.615827, 0.1276099, 1, 1, 1, 1, 1,
-1.680431, -2.006215, -2.297321, 1, 1, 1, 1, 1,
-1.673746, -0.193593, -0.07145542, 1, 1, 1, 1, 1,
-1.664189, -0.2218595, -3.595677, 1, 1, 1, 1, 1,
-1.654211, 0.8846133, -0.7737045, 1, 1, 1, 1, 1,
-1.631766, 0.2030511, -1.004987, 1, 1, 1, 1, 1,
-1.631529, 0.5004264, -1.140118, 1, 1, 1, 1, 1,
-1.611928, 0.4806141, -0.3133496, 0, 0, 1, 1, 1,
-1.610245, -1.340426, -1.82332, 1, 0, 0, 1, 1,
-1.58971, -1.703082, -1.222968, 1, 0, 0, 1, 1,
-1.588538, -1.084625, -1.394332, 1, 0, 0, 1, 1,
-1.548726, -1.272481, -2.991864, 1, 0, 0, 1, 1,
-1.546603, -0.486272, -2.804853, 1, 0, 0, 1, 1,
-1.543439, 0.1573613, -0.6341643, 0, 0, 0, 1, 1,
-1.54194, -0.4907984, -2.104339, 0, 0, 0, 1, 1,
-1.516597, -0.9049438, -0.9585139, 0, 0, 0, 1, 1,
-1.507055, -0.8677763, -1.889154, 0, 0, 0, 1, 1,
-1.504326, 0.002256215, -1.124986, 0, 0, 0, 1, 1,
-1.489038, -0.6783315, -1.926569, 0, 0, 0, 1, 1,
-1.475604, -0.2549891, -1.127311, 0, 0, 0, 1, 1,
-1.474929, -2.605295, -2.399779, 1, 1, 1, 1, 1,
-1.473923, 0.02526921, -0.4487086, 1, 1, 1, 1, 1,
-1.473462, -0.4985955, -1.010385, 1, 1, 1, 1, 1,
-1.467554, -0.785826, -1.081309, 1, 1, 1, 1, 1,
-1.460011, 0.1452173, -2.02954, 1, 1, 1, 1, 1,
-1.451136, -0.9572527, -0.7150716, 1, 1, 1, 1, 1,
-1.446407, 1.986353, -0.9422106, 1, 1, 1, 1, 1,
-1.445861, 0.1884883, -3.44312, 1, 1, 1, 1, 1,
-1.424201, 0.07926414, -2.005493, 1, 1, 1, 1, 1,
-1.40897, -0.4291992, -0.8546642, 1, 1, 1, 1, 1,
-1.399304, 1.143657, -0.15903, 1, 1, 1, 1, 1,
-1.39798, -0.3672476, -2.253577, 1, 1, 1, 1, 1,
-1.389012, -0.0514222, -1.358993, 1, 1, 1, 1, 1,
-1.381848, 0.4246574, -1.111639, 1, 1, 1, 1, 1,
-1.37345, -0.8302013, -1.21086, 1, 1, 1, 1, 1,
-1.37119, -0.492471, -3.009751, 0, 0, 1, 1, 1,
-1.371024, 0.463458, -1.941116, 1, 0, 0, 1, 1,
-1.370973, -0.114505, -1.354406, 1, 0, 0, 1, 1,
-1.366894, 0.3671636, -0.6956383, 1, 0, 0, 1, 1,
-1.360677, -0.09037527, -0.6773728, 1, 0, 0, 1, 1,
-1.359058, -0.4525624, -3.798216, 1, 0, 0, 1, 1,
-1.335908, -0.7384663, -2.550382, 0, 0, 0, 1, 1,
-1.335613, 0.9801262, -1.085972, 0, 0, 0, 1, 1,
-1.331439, 1.096174, -1.722403, 0, 0, 0, 1, 1,
-1.321169, -0.4293146, -2.276834, 0, 0, 0, 1, 1,
-1.32036, -0.4417436, -0.1790886, 0, 0, 0, 1, 1,
-1.319809, 0.4327007, -0.01975494, 0, 0, 0, 1, 1,
-1.308117, 1.075592, -1.658824, 0, 0, 0, 1, 1,
-1.303119, -0.9391348, -2.860018, 1, 1, 1, 1, 1,
-1.289753, -1.243977, -3.936475, 1, 1, 1, 1, 1,
-1.287315, 0.264217, -1.501626, 1, 1, 1, 1, 1,
-1.283561, 1.029009, -1.511327, 1, 1, 1, 1, 1,
-1.274214, 1.907065, -0.6914614, 1, 1, 1, 1, 1,
-1.271611, 0.07472545, -1.102277, 1, 1, 1, 1, 1,
-1.266923, 1.830776, -1.743989, 1, 1, 1, 1, 1,
-1.265298, 0.4079092, -3.298105, 1, 1, 1, 1, 1,
-1.258035, 0.2708394, -2.849524, 1, 1, 1, 1, 1,
-1.25735, -0.4621465, -1.798386, 1, 1, 1, 1, 1,
-1.246403, -1.34869, -1.855176, 1, 1, 1, 1, 1,
-1.243504, -0.135048, -0.5912715, 1, 1, 1, 1, 1,
-1.233984, 0.4181124, -1.639938, 1, 1, 1, 1, 1,
-1.23306, 0.6268336, -1.581857, 1, 1, 1, 1, 1,
-1.231309, -0.04730628, 0.1908692, 1, 1, 1, 1, 1,
-1.229074, -0.4025521, -1.431606, 0, 0, 1, 1, 1,
-1.213056, -1.278119, -4.000476, 1, 0, 0, 1, 1,
-1.210614, 1.115167, -0.6911271, 1, 0, 0, 1, 1,
-1.201872, 0.4619044, -1.658258, 1, 0, 0, 1, 1,
-1.196991, -1.229792, -0.3602214, 1, 0, 0, 1, 1,
-1.195614, 0.1925314, -0.1230585, 1, 0, 0, 1, 1,
-1.191254, 0.2797765, -0.9892042, 0, 0, 0, 1, 1,
-1.189036, -0.3491198, -0.6991864, 0, 0, 0, 1, 1,
-1.18547, 1.544232, -1.357653, 0, 0, 0, 1, 1,
-1.172339, -0.5820696, -0.790844, 0, 0, 0, 1, 1,
-1.164924, 1.630513, -0.1127866, 0, 0, 0, 1, 1,
-1.164357, -0.05742315, -3.427116, 0, 0, 0, 1, 1,
-1.149803, 0.7447599, -0.8265214, 0, 0, 0, 1, 1,
-1.137832, -1.356322, -2.938708, 1, 1, 1, 1, 1,
-1.129469, 0.6088985, -0.8697352, 1, 1, 1, 1, 1,
-1.126129, 0.6409011, -0.2892849, 1, 1, 1, 1, 1,
-1.12463, 0.5526784, -0.7802541, 1, 1, 1, 1, 1,
-1.124531, -2.05721, -2.273742, 1, 1, 1, 1, 1,
-1.123636, -1.219306, -2.137996, 1, 1, 1, 1, 1,
-1.119262, -0.7636082, -2.330787, 1, 1, 1, 1, 1,
-1.116322, -0.4454052, -0.3188429, 1, 1, 1, 1, 1,
-1.116039, 1.513412, -0.06251042, 1, 1, 1, 1, 1,
-1.113404, 0.3989488, -3.420581, 1, 1, 1, 1, 1,
-1.092041, 0.7073367, -1.348683, 1, 1, 1, 1, 1,
-1.090311, 0.7848641, -0.7385075, 1, 1, 1, 1, 1,
-1.080735, -0.1289035, -0.1858819, 1, 1, 1, 1, 1,
-1.079932, 0.6611642, -3.477513, 1, 1, 1, 1, 1,
-1.076252, -0.4494205, -1.765472, 1, 1, 1, 1, 1,
-1.075047, 0.3530393, -1.089564, 0, 0, 1, 1, 1,
-1.06617, -1.538609, -1.846769, 1, 0, 0, 1, 1,
-1.06305, 1.312384, -0.4654277, 1, 0, 0, 1, 1,
-1.055189, 0.3293641, -2.68457, 1, 0, 0, 1, 1,
-1.054159, -0.3743275, -3.715201, 1, 0, 0, 1, 1,
-1.045672, 0.590966, -0.9220143, 1, 0, 0, 1, 1,
-1.026428, 0.7190795, -0.4472345, 0, 0, 0, 1, 1,
-1.019703, -0.4511591, -2.811191, 0, 0, 0, 1, 1,
-1.018279, 1.380543, -1.250653, 0, 0, 0, 1, 1,
-1.014828, 0.4068915, -3.56438, 0, 0, 0, 1, 1,
-1.010676, -0.2473551, -2.360273, 0, 0, 0, 1, 1,
-1.004136, -0.4731269, -3.886838, 0, 0, 0, 1, 1,
-1.000049, 0.5132343, -0.9893568, 0, 0, 0, 1, 1,
-0.9882451, 0.078284, -3.39487, 1, 1, 1, 1, 1,
-0.978439, 0.5086161, -0.4759798, 1, 1, 1, 1, 1,
-0.9772671, 0.7594302, 1.260137, 1, 1, 1, 1, 1,
-0.9707032, -1.140547, -1.602159, 1, 1, 1, 1, 1,
-0.9706957, -0.5745869, -0.6462972, 1, 1, 1, 1, 1,
-0.9629902, 0.7518447, -2.836033, 1, 1, 1, 1, 1,
-0.9532623, 0.2419738, -0.7893409, 1, 1, 1, 1, 1,
-0.9501518, -0.5991328, -0.8326281, 1, 1, 1, 1, 1,
-0.9451444, -0.6657058, -2.919484, 1, 1, 1, 1, 1,
-0.9445137, 0.6889317, -1.063389, 1, 1, 1, 1, 1,
-0.9395224, 0.434683, -1.983381, 1, 1, 1, 1, 1,
-0.9361032, 0.2257936, -0.7050027, 1, 1, 1, 1, 1,
-0.929302, -2.085013, -1.863266, 1, 1, 1, 1, 1,
-0.918419, -0.4238485, -0.8869069, 1, 1, 1, 1, 1,
-0.916028, -0.4365135, -3.472356, 1, 1, 1, 1, 1,
-0.9121923, 0.4669406, -0.2837866, 0, 0, 1, 1, 1,
-0.9119694, 0.1885445, -1.57462, 1, 0, 0, 1, 1,
-0.9119576, -0.9823608, -0.9033722, 1, 0, 0, 1, 1,
-0.910952, -0.1806609, -2.010646, 1, 0, 0, 1, 1,
-0.9106244, -0.7872285, -0.8329687, 1, 0, 0, 1, 1,
-0.9103671, 0.08036569, -2.124963, 1, 0, 0, 1, 1,
-0.9014009, -0.7175306, -0.7318061, 0, 0, 0, 1, 1,
-0.8978981, 0.4463782, 0.7958784, 0, 0, 0, 1, 1,
-0.8947459, 0.3316675, -0.3853357, 0, 0, 0, 1, 1,
-0.8845064, -0.1177675, 0.31255, 0, 0, 0, 1, 1,
-0.8813239, 0.8488163, -1.081668, 0, 0, 0, 1, 1,
-0.8801962, 0.9367084, 0.134776, 0, 0, 0, 1, 1,
-0.8799514, 0.03223944, -2.191612, 0, 0, 0, 1, 1,
-0.8721896, 1.080773, 1.426952, 1, 1, 1, 1, 1,
-0.8718128, 0.0319467, -1.278129, 1, 1, 1, 1, 1,
-0.8665295, -1.432583, -2.850372, 1, 1, 1, 1, 1,
-0.8592103, 0.7152303, -0.4225414, 1, 1, 1, 1, 1,
-0.8503659, 0.4243774, -0.4717037, 1, 1, 1, 1, 1,
-0.8420891, -1.408098, -3.221059, 1, 1, 1, 1, 1,
-0.8417262, -0.9904555, -3.783143, 1, 1, 1, 1, 1,
-0.8335399, 0.4355341, -1.471497, 1, 1, 1, 1, 1,
-0.8335109, -0.8672534, -2.801444, 1, 1, 1, 1, 1,
-0.8312331, -0.3677743, -2.360812, 1, 1, 1, 1, 1,
-0.830525, -0.3489103, -2.54452, 1, 1, 1, 1, 1,
-0.8271967, 0.1341717, -0.5592499, 1, 1, 1, 1, 1,
-0.8267985, -1.317462, -1.501163, 1, 1, 1, 1, 1,
-0.8188143, 2.146781, -0.09351167, 1, 1, 1, 1, 1,
-0.8187529, -1.56992, -2.791524, 1, 1, 1, 1, 1,
-0.8174844, -0.166651, 0.1514339, 0, 0, 1, 1, 1,
-0.8143956, -2.372043, -1.916402, 1, 0, 0, 1, 1,
-0.7992575, 0.3481006, -3.512771, 1, 0, 0, 1, 1,
-0.7954341, -0.09454802, -3.070333, 1, 0, 0, 1, 1,
-0.7953354, -0.1951901, -2.162271, 1, 0, 0, 1, 1,
-0.7937444, -0.2599956, -0.4007182, 1, 0, 0, 1, 1,
-0.7910823, 0.691378, -1.510327, 0, 0, 0, 1, 1,
-0.785499, -1.006028, -2.236254, 0, 0, 0, 1, 1,
-0.7825651, -0.3844942, -3.087568, 0, 0, 0, 1, 1,
-0.7804925, 1.268558, 0.5736217, 0, 0, 0, 1, 1,
-0.7700777, 0.6962615, -0.8088139, 0, 0, 0, 1, 1,
-0.7637568, -1.662542, -3.901845, 0, 0, 0, 1, 1,
-0.7630973, -0.2686387, -2.069878, 0, 0, 0, 1, 1,
-0.7623652, 0.4159923, -0.6306627, 1, 1, 1, 1, 1,
-0.7615502, -0.7508888, -3.463608, 1, 1, 1, 1, 1,
-0.7578869, 1.114711, -0.3482768, 1, 1, 1, 1, 1,
-0.7551714, 0.2389773, -0.5103568, 1, 1, 1, 1, 1,
-0.7540707, 0.08917558, -1.15849, 1, 1, 1, 1, 1,
-0.7538275, -0.1872182, -1.006455, 1, 1, 1, 1, 1,
-0.7517205, 0.6473652, -1.264577, 1, 1, 1, 1, 1,
-0.7514009, -0.1063515, -1.756303, 1, 1, 1, 1, 1,
-0.7493924, -0.469066, -2.683797, 1, 1, 1, 1, 1,
-0.7467475, 0.8758427, -2.804181, 1, 1, 1, 1, 1,
-0.7461994, 0.9691048, -0.5704324, 1, 1, 1, 1, 1,
-0.7310994, -0.1712897, -0.8454588, 1, 1, 1, 1, 1,
-0.7283768, 1.318695, 1.303393, 1, 1, 1, 1, 1,
-0.7239839, 0.4501238, -0.8928273, 1, 1, 1, 1, 1,
-0.7118366, -2.589935, -4.008584, 1, 1, 1, 1, 1,
-0.7116399, 1.253257, 0.879392, 0, 0, 1, 1, 1,
-0.7049369, 0.60593, -0.6735308, 1, 0, 0, 1, 1,
-0.700991, -0.2391818, -0.3865784, 1, 0, 0, 1, 1,
-0.6975143, 0.4058441, 0.3565426, 1, 0, 0, 1, 1,
-0.6884142, -0.8393203, -2.122779, 1, 0, 0, 1, 1,
-0.6843259, 1.195299, -1.651925, 1, 0, 0, 1, 1,
-0.6833804, 0.5354691, -2.189185, 0, 0, 0, 1, 1,
-0.6764237, -1.080247, -1.452819, 0, 0, 0, 1, 1,
-0.6642416, 1.219182, 1.071643, 0, 0, 0, 1, 1,
-0.6640342, 0.6239268, -1.690136, 0, 0, 0, 1, 1,
-0.6612505, -1.003633, -2.757451, 0, 0, 0, 1, 1,
-0.6600487, -0.6513236, -1.594913, 0, 0, 0, 1, 1,
-0.6586893, 0.07047092, -3.195395, 0, 0, 0, 1, 1,
-0.6511891, -0.05202068, -1.61851, 1, 1, 1, 1, 1,
-0.6484917, 0.5070403, -1.821769, 1, 1, 1, 1, 1,
-0.6467533, 1.533307, -0.1302341, 1, 1, 1, 1, 1,
-0.6444542, 0.3833964, -1.590612, 1, 1, 1, 1, 1,
-0.643847, -0.7353203, -3.670946, 1, 1, 1, 1, 1,
-0.6429904, 1.261783, -1.17205, 1, 1, 1, 1, 1,
-0.6420195, 1.312917, -0.9884234, 1, 1, 1, 1, 1,
-0.6397262, -2.505589, -2.97554, 1, 1, 1, 1, 1,
-0.6381929, -1.258668, -2.668668, 1, 1, 1, 1, 1,
-0.6323875, -0.5991133, -3.636039, 1, 1, 1, 1, 1,
-0.6260895, 0.5485854, 0.05398616, 1, 1, 1, 1, 1,
-0.6231847, -0.4529459, -2.384706, 1, 1, 1, 1, 1,
-0.6202459, 0.4459364, -0.3416944, 1, 1, 1, 1, 1,
-0.6197078, -0.4640148, -2.502492, 1, 1, 1, 1, 1,
-0.6129663, -1.073156, -3.612623, 1, 1, 1, 1, 1,
-0.6127811, 0.3453633, -1.989919, 0, 0, 1, 1, 1,
-0.6122664, 0.5736954, 0.389624, 1, 0, 0, 1, 1,
-0.6091574, 0.3714674, -1.483721, 1, 0, 0, 1, 1,
-0.5999256, 0.06945287, -1.713335, 1, 0, 0, 1, 1,
-0.5980727, 0.2538997, -1.070168, 1, 0, 0, 1, 1,
-0.5978649, 1.130926, 0.3677314, 1, 0, 0, 1, 1,
-0.5890266, 1.471221, -0.1260535, 0, 0, 0, 1, 1,
-0.5860222, 0.3066564, -2.16309, 0, 0, 0, 1, 1,
-0.576436, 1.343502, 0.5712504, 0, 0, 0, 1, 1,
-0.5764019, -0.1097882, -0.354964, 0, 0, 0, 1, 1,
-0.5729542, -0.2526318, -1.787791, 0, 0, 0, 1, 1,
-0.5719029, -0.127797, 0.1818708, 0, 0, 0, 1, 1,
-0.5703139, -1.229669, -2.524833, 0, 0, 0, 1, 1,
-0.5686548, -0.7992663, -3.963845, 1, 1, 1, 1, 1,
-0.5682907, 0.4008878, -1.62038, 1, 1, 1, 1, 1,
-0.5670409, 0.7553615, -0.1096248, 1, 1, 1, 1, 1,
-0.5637342, 0.2175708, -0.6679981, 1, 1, 1, 1, 1,
-0.560383, -0.3882165, -1.101482, 1, 1, 1, 1, 1,
-0.5550677, -0.746909, -2.421506, 1, 1, 1, 1, 1,
-0.553839, -0.6142887, -3.270279, 1, 1, 1, 1, 1,
-0.5506258, -0.4950229, -4.269672, 1, 1, 1, 1, 1,
-0.5502114, -0.9543877, -2.697423, 1, 1, 1, 1, 1,
-0.5496411, 0.7549774, 0.1291744, 1, 1, 1, 1, 1,
-0.5423354, -0.006316543, -1.222444, 1, 1, 1, 1, 1,
-0.5357196, 0.8507913, -0.6064959, 1, 1, 1, 1, 1,
-0.533131, 0.615487, -0.7994921, 1, 1, 1, 1, 1,
-0.5265622, -0.9428769, -3.196665, 1, 1, 1, 1, 1,
-0.5190971, 1.239223, -0.1024011, 1, 1, 1, 1, 1,
-0.5167351, -2.035196, -2.473097, 0, 0, 1, 1, 1,
-0.5132213, 2.641265, -0.379232, 1, 0, 0, 1, 1,
-0.5109032, -0.7539085, -3.236871, 1, 0, 0, 1, 1,
-0.5024353, -0.2162999, -0.8957164, 1, 0, 0, 1, 1,
-0.4975222, -1.046562, -1.902061, 1, 0, 0, 1, 1,
-0.4939294, -0.2473891, -2.820722, 1, 0, 0, 1, 1,
-0.4930206, 0.505707, -1.213194, 0, 0, 0, 1, 1,
-0.4929639, -0.2789087, -1.729362, 0, 0, 0, 1, 1,
-0.4924894, 0.6505996, -0.8972552, 0, 0, 0, 1, 1,
-0.4907885, 0.7224455, 1.424972, 0, 0, 0, 1, 1,
-0.489424, -0.3046226, -1.29146, 0, 0, 0, 1, 1,
-0.4866259, 0.4891376, -1.170406, 0, 0, 0, 1, 1,
-0.4822367, 0.6115506, -2.654583, 0, 0, 0, 1, 1,
-0.4813216, -0.5281305, -1.820866, 1, 1, 1, 1, 1,
-0.4794731, -0.02476189, -2.069535, 1, 1, 1, 1, 1,
-0.4720376, -0.888945, -1.17309, 1, 1, 1, 1, 1,
-0.4698406, 0.6277714, -2.961156, 1, 1, 1, 1, 1,
-0.4645419, 0.7878309, -0.2991192, 1, 1, 1, 1, 1,
-0.464099, -0.4377736, -2.349994, 1, 1, 1, 1, 1,
-0.462386, 1.499194, -0.06527016, 1, 1, 1, 1, 1,
-0.4605799, -0.9869651, -3.35659, 1, 1, 1, 1, 1,
-0.4591484, -0.7076785, -3.598389, 1, 1, 1, 1, 1,
-0.4461181, 1.643795, -0.09243218, 1, 1, 1, 1, 1,
-0.4460245, -0.639061, -2.541368, 1, 1, 1, 1, 1,
-0.4458989, 1.305691, -1.571957, 1, 1, 1, 1, 1,
-0.4384994, -0.09446692, -3.529515, 1, 1, 1, 1, 1,
-0.4360802, -0.5872439, -1.268065, 1, 1, 1, 1, 1,
-0.4327233, 0.06631677, -1.68689, 1, 1, 1, 1, 1,
-0.4302101, 2.113741, -0.6599984, 0, 0, 1, 1, 1,
-0.4289534, 0.6341633, -0.5999786, 1, 0, 0, 1, 1,
-0.4257102, 1.326962, 0.785971, 1, 0, 0, 1, 1,
-0.4241747, 1.1018, -0.5192736, 1, 0, 0, 1, 1,
-0.4179741, 0.4867618, -1.498203, 1, 0, 0, 1, 1,
-0.4155343, -0.5381311, -4.444645, 1, 0, 0, 1, 1,
-0.4144171, -0.809585, -3.685754, 0, 0, 0, 1, 1,
-0.4126689, -0.8216263, -2.275834, 0, 0, 0, 1, 1,
-0.4088329, 0.0324511, -1.405403, 0, 0, 0, 1, 1,
-0.4086757, -1.386886, -2.095874, 0, 0, 0, 1, 1,
-0.4059331, 1.567313, -1.234353, 0, 0, 0, 1, 1,
-0.4054258, 0.4928689, -2.268929, 0, 0, 0, 1, 1,
-0.4050668, 0.5081899, 0.9502138, 0, 0, 0, 1, 1,
-0.4029305, -0.6209687, -1.290355, 1, 1, 1, 1, 1,
-0.4028763, 0.4988803, -0.5580661, 1, 1, 1, 1, 1,
-0.4007494, 1.046008, 0.7695709, 1, 1, 1, 1, 1,
-0.400292, -0.7143697, -2.213198, 1, 1, 1, 1, 1,
-0.3957978, 1.424869, -0.2387262, 1, 1, 1, 1, 1,
-0.3950883, 0.4617572, -0.8218131, 1, 1, 1, 1, 1,
-0.3905857, 1.659472, -1.00364, 1, 1, 1, 1, 1,
-0.3901727, 0.525365, -0.2709244, 1, 1, 1, 1, 1,
-0.382144, -0.2725623, -3.543552, 1, 1, 1, 1, 1,
-0.3812045, 0.2292233, -0.7426195, 1, 1, 1, 1, 1,
-0.3788707, 1.892823, -0.096086, 1, 1, 1, 1, 1,
-0.3770832, -1.017389, -1.941046, 1, 1, 1, 1, 1,
-0.3766786, 0.961399, -2.888636, 1, 1, 1, 1, 1,
-0.3766173, -1.017582, -3.745169, 1, 1, 1, 1, 1,
-0.3755893, 0.7829105, -0.7810594, 1, 1, 1, 1, 1,
-0.3752322, 2.186419, -0.6515793, 0, 0, 1, 1, 1,
-0.3745852, -0.4250158, -3.085395, 1, 0, 0, 1, 1,
-0.3654058, -0.6780499, -2.949303, 1, 0, 0, 1, 1,
-0.3642971, 0.5964559, 0.07458892, 1, 0, 0, 1, 1,
-0.3638652, -0.7942442, -0.6133237, 1, 0, 0, 1, 1,
-0.3604736, -1.470753, -4.35455, 1, 0, 0, 1, 1,
-0.356727, -0.4534694, -3.612549, 0, 0, 0, 1, 1,
-0.3534945, 0.5621009, 0.06710328, 0, 0, 0, 1, 1,
-0.3500479, 1.248592, 0.5905966, 0, 0, 0, 1, 1,
-0.349185, -0.6147817, -1.405877, 0, 0, 0, 1, 1,
-0.3360562, 1.678373, -0.4229034, 0, 0, 0, 1, 1,
-0.3335114, 0.2500503, -2.924154, 0, 0, 0, 1, 1,
-0.3322164, 1.011333, -1.373869, 0, 0, 0, 1, 1,
-0.3319396, 1.106489, 1.321688, 1, 1, 1, 1, 1,
-0.3285978, 2.200421, -2.292793, 1, 1, 1, 1, 1,
-0.3268398, 0.2686467, -1.176174, 1, 1, 1, 1, 1,
-0.325495, -0.1816279, -1.937046, 1, 1, 1, 1, 1,
-0.3247832, -0.5886171, -3.096683, 1, 1, 1, 1, 1,
-0.3239856, 0.3123204, 0.02270248, 1, 1, 1, 1, 1,
-0.3217457, 0.4057913, -1.044787, 1, 1, 1, 1, 1,
-0.3204699, 0.5616319, -1.240907, 1, 1, 1, 1, 1,
-0.3196414, -0.02082289, -1.843778, 1, 1, 1, 1, 1,
-0.3144656, 0.06402627, -2.145522, 1, 1, 1, 1, 1,
-0.3091381, 2.307277, -2.127116, 1, 1, 1, 1, 1,
-0.3070478, -2.828751, -3.867711, 1, 1, 1, 1, 1,
-0.3043874, 0.9734612, 0.2484615, 1, 1, 1, 1, 1,
-0.3041373, 0.6658984, 1.904929, 1, 1, 1, 1, 1,
-0.2980748, 0.9847374, 1.70548, 1, 1, 1, 1, 1,
-0.2978494, -0.9326631, -2.672186, 0, 0, 1, 1, 1,
-0.2923497, 0.5646652, -1.008086, 1, 0, 0, 1, 1,
-0.2889207, 1.129597, 0.4530532, 1, 0, 0, 1, 1,
-0.2878717, 1.545634, 0.5198175, 1, 0, 0, 1, 1,
-0.2868192, 0.4449548, -1.499662, 1, 0, 0, 1, 1,
-0.2857371, 0.5187155, -3.062911, 1, 0, 0, 1, 1,
-0.2808156, 0.8722661, 0.297987, 0, 0, 0, 1, 1,
-0.2771084, 2.492222, 0.9758161, 0, 0, 0, 1, 1,
-0.2761892, 1.042643, 0.2308897, 0, 0, 0, 1, 1,
-0.2738179, 1.157191, -0.6859471, 0, 0, 0, 1, 1,
-0.2733737, -2.192407, -2.499961, 0, 0, 0, 1, 1,
-0.2692683, -0.1486496, -0.8333235, 0, 0, 0, 1, 1,
-0.2679707, 0.02775719, -0.8284556, 0, 0, 0, 1, 1,
-0.2632026, 1.519254, -1.569343, 1, 1, 1, 1, 1,
-0.2585624, 0.3218231, -0.2352526, 1, 1, 1, 1, 1,
-0.2573, 0.4901216, -0.877026, 1, 1, 1, 1, 1,
-0.2528895, -1.889444, -2.86637, 1, 1, 1, 1, 1,
-0.2527011, 0.6083584, -1.28624, 1, 1, 1, 1, 1,
-0.251265, -1.049271, -3.938296, 1, 1, 1, 1, 1,
-0.2499097, -0.542419, -3.14575, 1, 1, 1, 1, 1,
-0.2496342, 2.111498, -0.04992215, 1, 1, 1, 1, 1,
-0.2473843, 0.4221926, -1.214613, 1, 1, 1, 1, 1,
-0.2427216, 1.129496, -0.285728, 1, 1, 1, 1, 1,
-0.2399308, -0.4336035, -1.139808, 1, 1, 1, 1, 1,
-0.2355748, 0.4907551, -3.078248, 1, 1, 1, 1, 1,
-0.2318104, 0.2435697, 1.096774, 1, 1, 1, 1, 1,
-0.2285763, -0.9980831, -2.548119, 1, 1, 1, 1, 1,
-0.2262619, 0.1185061, 0.2647319, 1, 1, 1, 1, 1,
-0.2252834, 0.1035269, -1.017483, 0, 0, 1, 1, 1,
-0.2241321, -1.347039, -2.846053, 1, 0, 0, 1, 1,
-0.2210559, 0.4950248, -0.3184525, 1, 0, 0, 1, 1,
-0.2197833, -0.8522251, -5.077077, 1, 0, 0, 1, 1,
-0.2188143, 0.7340414, -0.956045, 1, 0, 0, 1, 1,
-0.216857, -1.009067, -3.199697, 1, 0, 0, 1, 1,
-0.2168019, -0.0565368, -3.275337, 0, 0, 0, 1, 1,
-0.2146883, -0.3845767, -2.988887, 0, 0, 0, 1, 1,
-0.213944, -1.257547, -3.097927, 0, 0, 0, 1, 1,
-0.2138862, 0.9186321, -0.4034397, 0, 0, 0, 1, 1,
-0.2098392, -0.4900981, -2.706167, 0, 0, 0, 1, 1,
-0.2094396, -0.713443, -2.59071, 0, 0, 0, 1, 1,
-0.1971122, 0.3717937, -1.97508, 0, 0, 0, 1, 1,
-0.1879322, -0.6473721, -3.583463, 1, 1, 1, 1, 1,
-0.1825558, 1.404683, -1.144924, 1, 1, 1, 1, 1,
-0.1789671, 0.8167847, -0.8669549, 1, 1, 1, 1, 1,
-0.1771792, -0.9937572, -1.447827, 1, 1, 1, 1, 1,
-0.1721694, -1.696011, -2.598808, 1, 1, 1, 1, 1,
-0.1708511, 1.721938, 0.06953417, 1, 1, 1, 1, 1,
-0.1707508, 0.4148126, -1.128698, 1, 1, 1, 1, 1,
-0.1637273, -0.7336603, -1.320365, 1, 1, 1, 1, 1,
-0.1609897, -0.279469, -4.416831, 1, 1, 1, 1, 1,
-0.1603641, 1.076361, -1.292807, 1, 1, 1, 1, 1,
-0.1538465, -0.1966701, -2.379696, 1, 1, 1, 1, 1,
-0.1527727, -0.2977025, -4.012387, 1, 1, 1, 1, 1,
-0.1520772, 0.7919129, -1.80186, 1, 1, 1, 1, 1,
-0.1403447, -0.6407815, -3.060697, 1, 1, 1, 1, 1,
-0.1398685, -0.6197712, -3.869004, 1, 1, 1, 1, 1,
-0.1396696, -1.086738, -2.545495, 0, 0, 1, 1, 1,
-0.1392932, 0.03503473, -2.205078, 1, 0, 0, 1, 1,
-0.1392549, -1.133827, -2.965131, 1, 0, 0, 1, 1,
-0.1341547, -0.6946341, -4.607783, 1, 0, 0, 1, 1,
-0.1320616, -0.613714, -2.360204, 1, 0, 0, 1, 1,
-0.1317681, -0.9573594, -2.804383, 1, 0, 0, 1, 1,
-0.1307296, 0.4505034, 0.6421538, 0, 0, 0, 1, 1,
-0.1305626, 0.4748465, -0.9417332, 0, 0, 0, 1, 1,
-0.1281131, 1.260814, 0.1343758, 0, 0, 0, 1, 1,
-0.1246148, 1.198741, -0.0008488265, 0, 0, 0, 1, 1,
-0.124081, 1.634527, -1.193301, 0, 0, 0, 1, 1,
-0.1233038, 0.3142763, -0.4426998, 0, 0, 0, 1, 1,
-0.1231008, -0.6669316, -2.704247, 0, 0, 0, 1, 1,
-0.121741, 0.2856189, 0.0552614, 1, 1, 1, 1, 1,
-0.1212189, -1.27109, -3.908244, 1, 1, 1, 1, 1,
-0.1195617, 1.286346, 0.211997, 1, 1, 1, 1, 1,
-0.117188, 2.253348, -1.34715, 1, 1, 1, 1, 1,
-0.1171695, 0.2392615, -0.5497668, 1, 1, 1, 1, 1,
-0.1146265, -1.627895, -4.775887, 1, 1, 1, 1, 1,
-0.1091601, 1.458169, 0.6871355, 1, 1, 1, 1, 1,
-0.1080416, -1.438468, -3.085519, 1, 1, 1, 1, 1,
-0.1058823, 1.756082, 0.4707149, 1, 1, 1, 1, 1,
-0.1052572, 0.4040906, -0.8640737, 1, 1, 1, 1, 1,
-0.1051425, 1.582196, -0.2183348, 1, 1, 1, 1, 1,
-0.1025973, 1.188453, -1.529249, 1, 1, 1, 1, 1,
-0.1013432, -0.3367731, -2.268839, 1, 1, 1, 1, 1,
-0.09740097, 1.16999, -0.1952655, 1, 1, 1, 1, 1,
-0.09584839, 1.649149, -1.617469, 1, 1, 1, 1, 1,
-0.08950585, -0.1740475, -1.397804, 0, 0, 1, 1, 1,
-0.08672754, 0.01029475, -1.485128, 1, 0, 0, 1, 1,
-0.0864042, 0.6766835, -0.5582611, 1, 0, 0, 1, 1,
-0.08638203, 1.158872, 0.4846714, 1, 0, 0, 1, 1,
-0.08516193, 0.9914404, 0.7630877, 1, 0, 0, 1, 1,
-0.08400077, -0.6834697, -2.208277, 1, 0, 0, 1, 1,
-0.08378223, 1.145233, -0.3916705, 0, 0, 0, 1, 1,
-0.0833355, -1.533697, -3.369374, 0, 0, 0, 1, 1,
-0.08282845, 1.226642, -0.06614463, 0, 0, 0, 1, 1,
-0.0817073, -0.4096879, -3.336942, 0, 0, 0, 1, 1,
-0.08162557, 0.7714093, -0.9047744, 0, 0, 0, 1, 1,
-0.08142075, -0.2603942, -1.237575, 0, 0, 0, 1, 1,
-0.08062784, -0.5653009, -4.446289, 0, 0, 0, 1, 1,
-0.0756797, 0.7926493, -1.334586, 1, 1, 1, 1, 1,
-0.07520533, 1.676466, -0.6556401, 1, 1, 1, 1, 1,
-0.07334466, 2.4294, 0.3510508, 1, 1, 1, 1, 1,
-0.0719515, 0.009731242, -2.265485, 1, 1, 1, 1, 1,
-0.07150849, -0.8520261, -3.265539, 1, 1, 1, 1, 1,
-0.07136589, 0.9010841, -2.345724, 1, 1, 1, 1, 1,
-0.07036503, 1.647988, -0.7687488, 1, 1, 1, 1, 1,
-0.06397433, -0.9111442, -2.762002, 1, 1, 1, 1, 1,
-0.05826432, -0.5185447, -2.554438, 1, 1, 1, 1, 1,
-0.05483316, -1.288247, -2.588075, 1, 1, 1, 1, 1,
-0.05309768, -0.2984795, -3.562129, 1, 1, 1, 1, 1,
-0.05284448, -0.009610125, -3.213108, 1, 1, 1, 1, 1,
-0.05111977, 0.07776525, 0.3994723, 1, 1, 1, 1, 1,
-0.04967802, -0.9851046, -3.868627, 1, 1, 1, 1, 1,
-0.04924228, 0.1615354, 0.3954397, 1, 1, 1, 1, 1,
-0.04551353, -0.706761, -1.903017, 0, 0, 1, 1, 1,
-0.04326594, 0.491622, -1.367505, 1, 0, 0, 1, 1,
-0.04098714, -0.04704414, -1.393224, 1, 0, 0, 1, 1,
-0.03495961, -0.1101606, -2.862712, 1, 0, 0, 1, 1,
-0.03350624, -0.7308991, -1.926535, 1, 0, 0, 1, 1,
-0.03242264, -1.402634, -3.591503, 1, 0, 0, 1, 1,
-0.03077671, -1.996722, -2.790615, 0, 0, 0, 1, 1,
-0.02994356, -2.500485, -2.975442, 0, 0, 0, 1, 1,
-0.02294714, 2.054938, 1.028363, 0, 0, 0, 1, 1,
-0.007579802, -0.3741412, -3.869067, 0, 0, 0, 1, 1,
-0.005915419, 2.97101, -1.098302, 0, 0, 0, 1, 1,
-0.003789452, 0.138895, -0.8321996, 0, 0, 0, 1, 1,
-0.00335142, -0.1518623, -2.00159, 0, 0, 0, 1, 1,
-0.001563803, 0.9057311, -0.1613512, 1, 1, 1, 1, 1,
-7.908035e-05, 0.563517, 0.8222943, 1, 1, 1, 1, 1,
0.001109266, 0.9144062, 0.7076097, 1, 1, 1, 1, 1,
0.005963163, -0.8246732, 3.451823, 1, 1, 1, 1, 1,
0.006063893, -0.05637069, 2.916736, 1, 1, 1, 1, 1,
0.007578876, -0.8329505, 2.639772, 1, 1, 1, 1, 1,
0.007711316, 0.6686916, 0.3406394, 1, 1, 1, 1, 1,
0.008743507, -0.2546814, 2.222616, 1, 1, 1, 1, 1,
0.009157975, -0.898414, 2.239003, 1, 1, 1, 1, 1,
0.01263877, -1.795863, 3.123491, 1, 1, 1, 1, 1,
0.01400538, -0.5510042, 2.530463, 1, 1, 1, 1, 1,
0.0147327, -0.01381182, 2.034181, 1, 1, 1, 1, 1,
0.01534509, 0.4161491, 0.1284, 1, 1, 1, 1, 1,
0.01622258, -1.205323, 5.671618, 1, 1, 1, 1, 1,
0.01658488, -1.585557, 3.263528, 1, 1, 1, 1, 1,
0.01765351, 0.2417396, 1.17568, 0, 0, 1, 1, 1,
0.0185518, 0.1969684, -0.3754829, 1, 0, 0, 1, 1,
0.02056795, -0.06698541, 1.585361, 1, 0, 0, 1, 1,
0.02728843, 0.5988061, -1.087567, 1, 0, 0, 1, 1,
0.03233102, 0.5176642, -0.5968252, 1, 0, 0, 1, 1,
0.03709327, -1.512859, 4.021379, 1, 0, 0, 1, 1,
0.03753854, 1.084744, -0.5689416, 0, 0, 0, 1, 1,
0.03776765, -0.2679389, 3.666389, 0, 0, 0, 1, 1,
0.04121359, 0.59547, -1.369994, 0, 0, 0, 1, 1,
0.04267158, -1.305097, 3.000112, 0, 0, 0, 1, 1,
0.04317986, 2.794612, 0.3007812, 0, 0, 0, 1, 1,
0.04599155, -0.2987173, 3.623163, 0, 0, 0, 1, 1,
0.05114629, -0.7196751, 2.632488, 0, 0, 0, 1, 1,
0.05189858, 0.2011903, 0.810931, 1, 1, 1, 1, 1,
0.0589917, 0.8764357, 1.374912, 1, 1, 1, 1, 1,
0.05961039, 0.5735886, 0.4174149, 1, 1, 1, 1, 1,
0.06019143, -1.590619, 3.9313, 1, 1, 1, 1, 1,
0.06291737, -0.06617256, 2.774795, 1, 1, 1, 1, 1,
0.0634637, 0.8865348, 0.1438452, 1, 1, 1, 1, 1,
0.06350119, -0.3728172, 3.34084, 1, 1, 1, 1, 1,
0.06652923, 0.3028911, 1.002443, 1, 1, 1, 1, 1,
0.06938693, -1.242344, 2.939847, 1, 1, 1, 1, 1,
0.07271049, 1.150532, -1.904589, 1, 1, 1, 1, 1,
0.07302767, -0.2869573, 3.261977, 1, 1, 1, 1, 1,
0.07444135, -0.08398771, 3.673141, 1, 1, 1, 1, 1,
0.07470008, -0.4669858, 4.984715, 1, 1, 1, 1, 1,
0.07605069, -0.2871102, 3.418996, 1, 1, 1, 1, 1,
0.07828944, -0.2199983, 1.842316, 1, 1, 1, 1, 1,
0.07982523, 0.559774, 2.202374, 0, 0, 1, 1, 1,
0.08954026, 0.5159334, -0.8325939, 1, 0, 0, 1, 1,
0.09013557, -0.2057689, 3.012288, 1, 0, 0, 1, 1,
0.0921727, -0.6420217, 1.581091, 1, 0, 0, 1, 1,
0.09258576, 0.6410457, -0.392019, 1, 0, 0, 1, 1,
0.09260829, 0.2062517, 0.4709208, 1, 0, 0, 1, 1,
0.09564178, -0.07641926, 2.901204, 0, 0, 0, 1, 1,
0.0984004, 0.8611842, 0.2116683, 0, 0, 0, 1, 1,
0.098943, -0.4334926, 0.9906934, 0, 0, 0, 1, 1,
0.1016437, -1.255393, 3.368285, 0, 0, 0, 1, 1,
0.1027998, 0.02764775, 1.637761, 0, 0, 0, 1, 1,
0.1047942, 0.8647665, 0.4752859, 0, 0, 0, 1, 1,
0.1061815, 0.9199512, 0.4184281, 0, 0, 0, 1, 1,
0.1078749, 1.267219, 0.3013378, 1, 1, 1, 1, 1,
0.1108667, 1.436005, 0.442921, 1, 1, 1, 1, 1,
0.1118141, -1.242865, 2.190595, 1, 1, 1, 1, 1,
0.113061, 2.264807, -0.3474096, 1, 1, 1, 1, 1,
0.1137177, 0.50859, 1.764149, 1, 1, 1, 1, 1,
0.1179417, 0.1630341, 1.557806, 1, 1, 1, 1, 1,
0.1191415, -0.138303, 1.699258, 1, 1, 1, 1, 1,
0.1198926, -1.808134, 4.675279, 1, 1, 1, 1, 1,
0.1240774, -2.212774, 4.240733, 1, 1, 1, 1, 1,
0.1249853, 1.025837, 0.3161229, 1, 1, 1, 1, 1,
0.126025, -2.096339, 3.448259, 1, 1, 1, 1, 1,
0.1276953, -1.486775, 3.364773, 1, 1, 1, 1, 1,
0.1339867, -0.2127675, 3.015958, 1, 1, 1, 1, 1,
0.1371086, 0.02711063, 1.680214, 1, 1, 1, 1, 1,
0.139318, -1.763372, 4.188567, 1, 1, 1, 1, 1,
0.1397542, 0.6281293, -0.2319745, 0, 0, 1, 1, 1,
0.1421038, 0.4887621, 1.10257, 1, 0, 0, 1, 1,
0.1428315, 1.303952, -1.061296, 1, 0, 0, 1, 1,
0.1496654, 0.4778875, 0.2540678, 1, 0, 0, 1, 1,
0.1505129, -0.2684702, 2.907618, 1, 0, 0, 1, 1,
0.151975, -0.8290271, 2.979434, 1, 0, 0, 1, 1,
0.1532439, 0.6002522, 0.08264701, 0, 0, 0, 1, 1,
0.1544532, 0.3943421, 0.5281425, 0, 0, 0, 1, 1,
0.15568, 0.01851038, 1.399676, 0, 0, 0, 1, 1,
0.1579938, 0.79539, 0.2752791, 0, 0, 0, 1, 1,
0.1584752, -0.1059633, 1.690091, 0, 0, 0, 1, 1,
0.1587175, 0.01703805, 0.4351611, 0, 0, 0, 1, 1,
0.1591517, -0.8506408, 2.278788, 0, 0, 0, 1, 1,
0.159576, -0.03341475, 3.134709, 1, 1, 1, 1, 1,
0.160046, -0.4693076, 2.337553, 1, 1, 1, 1, 1,
0.161609, -2.097725, 2.186622, 1, 1, 1, 1, 1,
0.1626093, -0.5753356, 2.132106, 1, 1, 1, 1, 1,
0.1669572, -0.2271243, 3.296811, 1, 1, 1, 1, 1,
0.1687516, -0.09001636, 1.037578, 1, 1, 1, 1, 1,
0.1703881, 0.1668423, 1.211927, 1, 1, 1, 1, 1,
0.1793729, 0.6948156, 0.440488, 1, 1, 1, 1, 1,
0.1809458, -1.157376, 2.787177, 1, 1, 1, 1, 1,
0.1818229, -0.9491633, 2.520897, 1, 1, 1, 1, 1,
0.1828209, -1.093874, 3.082432, 1, 1, 1, 1, 1,
0.1883848, 0.7046977, 1.539442, 1, 1, 1, 1, 1,
0.1900838, -0.2817076, 3.183667, 1, 1, 1, 1, 1,
0.2062413, -0.08232134, 2.670646, 1, 1, 1, 1, 1,
0.2064413, 1.089703, 0.7840065, 1, 1, 1, 1, 1,
0.2071451, 2.620651, -0.2879944, 0, 0, 1, 1, 1,
0.2080343, 1.558027, 0.4150297, 1, 0, 0, 1, 1,
0.2081131, -1.358677, 3.572034, 1, 0, 0, 1, 1,
0.2083124, -0.2751133, 2.88569, 1, 0, 0, 1, 1,
0.21035, -0.6873029, 2.909787, 1, 0, 0, 1, 1,
0.2139645, -0.6958876, 4.685064, 1, 0, 0, 1, 1,
0.2144643, 0.08197396, -0.3559544, 0, 0, 0, 1, 1,
0.2155369, -0.3188793, 0.7530237, 0, 0, 0, 1, 1,
0.2200779, 0.8969694, -2.177201, 0, 0, 0, 1, 1,
0.2311864, 0.8963478, 1.24789, 0, 0, 0, 1, 1,
0.2376754, 0.5549266, -1.327857, 0, 0, 0, 1, 1,
0.2382701, 0.3296432, 1.906026, 0, 0, 0, 1, 1,
0.239029, -0.3294107, 1.772972, 0, 0, 0, 1, 1,
0.2397813, 0.3907688, 0.4496284, 1, 1, 1, 1, 1,
0.2521992, -0.0754324, 3.228723, 1, 1, 1, 1, 1,
0.2571028, 1.239483, -0.7346516, 1, 1, 1, 1, 1,
0.2631534, 1.487288, 0.3481432, 1, 1, 1, 1, 1,
0.2705367, -2.243881, 1.859557, 1, 1, 1, 1, 1,
0.2705662, 1.435127, 0.6056216, 1, 1, 1, 1, 1,
0.270734, -0.9421224, 3.508041, 1, 1, 1, 1, 1,
0.2736596, -0.6703145, 3.225369, 1, 1, 1, 1, 1,
0.2744479, 0.9085314, 0.7444063, 1, 1, 1, 1, 1,
0.2744963, -0.1410548, 3.17612, 1, 1, 1, 1, 1,
0.2754036, -0.509486, 3.014685, 1, 1, 1, 1, 1,
0.2848517, -1.988203, 3.859827, 1, 1, 1, 1, 1,
0.2874568, -1.309313, 4.437647, 1, 1, 1, 1, 1,
0.2936528, 1.107447, 1.553849, 1, 1, 1, 1, 1,
0.2938741, -0.8420579, 1.568124, 1, 1, 1, 1, 1,
0.2945995, 0.6642803, 0.3687353, 0, 0, 1, 1, 1,
0.2949123, 0.02725865, 1.857429, 1, 0, 0, 1, 1,
0.3005736, -0.691759, 3.6368, 1, 0, 0, 1, 1,
0.3020949, 1.824097, 1.017115, 1, 0, 0, 1, 1,
0.3031269, 0.6883728, 1.537454, 1, 0, 0, 1, 1,
0.3034582, -0.7830468, 3.444564, 1, 0, 0, 1, 1,
0.3037828, -1.128388, 3.541373, 0, 0, 0, 1, 1,
0.3049847, 0.3610055, 1.54513, 0, 0, 0, 1, 1,
0.3163251, -0.06954301, 0.4885209, 0, 0, 0, 1, 1,
0.320777, -0.7489046, 4.374622, 0, 0, 0, 1, 1,
0.3246106, -1.266036, 2.697935, 0, 0, 0, 1, 1,
0.3262095, 0.6023778, 0.8810925, 0, 0, 0, 1, 1,
0.3276644, -2.172684, 3.6631, 0, 0, 0, 1, 1,
0.3290256, 0.1965902, 1.426031, 1, 1, 1, 1, 1,
0.3300995, 0.2515807, 0.8222114, 1, 1, 1, 1, 1,
0.3362105, -0.3101619, 1.112686, 1, 1, 1, 1, 1,
0.3435359, 0.5213453, 0.3678201, 1, 1, 1, 1, 1,
0.3463455, -0.6016855, 3.178129, 1, 1, 1, 1, 1,
0.3512838, -0.180478, 1.210315, 1, 1, 1, 1, 1,
0.351583, -1.234748, 3.528519, 1, 1, 1, 1, 1,
0.3517613, 3.251425, -0.297659, 1, 1, 1, 1, 1,
0.3543175, -2.022922, 2.449282, 1, 1, 1, 1, 1,
0.3560189, 1.37302, -1.065111, 1, 1, 1, 1, 1,
0.3588846, -0.4370434, 1.941064, 1, 1, 1, 1, 1,
0.3617159, -0.4872275, 3.183889, 1, 1, 1, 1, 1,
0.3646847, 0.9687163, 1.073192, 1, 1, 1, 1, 1,
0.3675404, -1.744398, 3.047757, 1, 1, 1, 1, 1,
0.3705447, 0.9375077, 0.301576, 1, 1, 1, 1, 1,
0.3712947, -3.499773, 3.244972, 0, 0, 1, 1, 1,
0.3715062, -0.2568108, 2.604077, 1, 0, 0, 1, 1,
0.3746378, 0.6230848, 0.7819709, 1, 0, 0, 1, 1,
0.3764873, 1.251823, 0.04850097, 1, 0, 0, 1, 1,
0.376753, 0.8161723, -0.6577799, 1, 0, 0, 1, 1,
0.3792769, -0.903479, 4.696076, 1, 0, 0, 1, 1,
0.3792851, -0.1942392, 0.0681845, 0, 0, 0, 1, 1,
0.3877671, -0.06270213, 0.6513044, 0, 0, 0, 1, 1,
0.3895156, -0.9267473, 3.803187, 0, 0, 0, 1, 1,
0.3900163, 0.8726742, -0.8203072, 0, 0, 0, 1, 1,
0.3969906, 0.3173763, -0.7872304, 0, 0, 0, 1, 1,
0.3970952, 0.3807171, 2.723324, 0, 0, 0, 1, 1,
0.3995935, -0.3249862, 4.009423, 0, 0, 0, 1, 1,
0.4013678, 0.7344654, 0.9615955, 1, 1, 1, 1, 1,
0.402596, 0.2617224, 2.404582, 1, 1, 1, 1, 1,
0.4035123, -1.583067, 3.575183, 1, 1, 1, 1, 1,
0.4060075, -0.3100017, 2.687537, 1, 1, 1, 1, 1,
0.4062206, 1.620964, 1.210911, 1, 1, 1, 1, 1,
0.413581, 1.037326, 2.117268, 1, 1, 1, 1, 1,
0.4166682, -1.175356, 2.816087, 1, 1, 1, 1, 1,
0.422125, -2.17905, 1.768586, 1, 1, 1, 1, 1,
0.4240911, 0.6440055, 1.481819, 1, 1, 1, 1, 1,
0.4304951, 0.8472317, 1.838241, 1, 1, 1, 1, 1,
0.4331603, 0.9081587, -1.113677, 1, 1, 1, 1, 1,
0.4347531, 0.5444084, 0.4010611, 1, 1, 1, 1, 1,
0.4350541, 0.380572, -0.006229747, 1, 1, 1, 1, 1,
0.4362824, 0.6156794, 2.590121, 1, 1, 1, 1, 1,
0.4418472, 0.6300247, 1.316426, 1, 1, 1, 1, 1,
0.447644, -0.8674279, 2.518501, 0, 0, 1, 1, 1,
0.447825, 0.8594346, -0.1493818, 1, 0, 0, 1, 1,
0.4481837, 1.334537, -1.110832, 1, 0, 0, 1, 1,
0.4519898, 0.3387295, 0.9625866, 1, 0, 0, 1, 1,
0.4520728, -0.09791567, 1.701761, 1, 0, 0, 1, 1,
0.4549835, -0.01643902, 0.400867, 1, 0, 0, 1, 1,
0.4556525, -0.9221935, 2.017738, 0, 0, 0, 1, 1,
0.4583988, 1.284441, -0.7689846, 0, 0, 0, 1, 1,
0.4592021, 0.9620896, 0.03361051, 0, 0, 0, 1, 1,
0.461394, -0.2522464, 1.195921, 0, 0, 0, 1, 1,
0.4672379, 0.1082832, 0.4878753, 0, 0, 0, 1, 1,
0.4680426, -0.9232738, 2.115269, 0, 0, 0, 1, 1,
0.4708015, -1.309788, 1.524403, 0, 0, 0, 1, 1,
0.473133, 0.8608521, 0.3327791, 1, 1, 1, 1, 1,
0.4744945, 0.539896, 2.011385, 1, 1, 1, 1, 1,
0.4750909, -0.4306912, 1.728704, 1, 1, 1, 1, 1,
0.4757854, -2.267887, 1.791493, 1, 1, 1, 1, 1,
0.4767516, 0.4192939, -0.3056236, 1, 1, 1, 1, 1,
0.4768612, -0.9194254, 2.867971, 1, 1, 1, 1, 1,
0.4779208, 0.8967889, 1.273923, 1, 1, 1, 1, 1,
0.4780032, 0.9315001, -0.6787711, 1, 1, 1, 1, 1,
0.4796404, 0.3768906, 1.619725, 1, 1, 1, 1, 1,
0.4799984, -1.855927, 2.104635, 1, 1, 1, 1, 1,
0.4807563, 0.3522703, 0.8051302, 1, 1, 1, 1, 1,
0.4810524, -0.5365545, 2.696147, 1, 1, 1, 1, 1,
0.4863696, 2.609532, 1.302984, 1, 1, 1, 1, 1,
0.4875545, 2.029729, 1.151875, 1, 1, 1, 1, 1,
0.4971265, 1.709594, 0.7997705, 1, 1, 1, 1, 1,
0.5017421, -1.008123, 1.84886, 0, 0, 1, 1, 1,
0.5070413, -1.586989, 2.918909, 1, 0, 0, 1, 1,
0.508186, -1.866231, 1.467239, 1, 0, 0, 1, 1,
0.5131832, -1.731437, 2.892582, 1, 0, 0, 1, 1,
0.5134423, -1.288236, 1.040829, 1, 0, 0, 1, 1,
0.5160325, 1.906356, -0.643766, 1, 0, 0, 1, 1,
0.5169666, -2.046049, 2.685594, 0, 0, 0, 1, 1,
0.5180029, 0.7236577, 0.1559573, 0, 0, 0, 1, 1,
0.5207478, -0.4622652, 2.451808, 0, 0, 0, 1, 1,
0.5267275, -2.348905, 3.168135, 0, 0, 0, 1, 1,
0.5371403, -1.36887, 4.987854, 0, 0, 0, 1, 1,
0.537243, -1.307333, 2.292627, 0, 0, 0, 1, 1,
0.5410585, 2.034611, -0.8035786, 0, 0, 0, 1, 1,
0.5528631, -1.311641, 2.824508, 1, 1, 1, 1, 1,
0.5556015, 0.2243492, 1.921651, 1, 1, 1, 1, 1,
0.5573512, 0.454381, 0.1459784, 1, 1, 1, 1, 1,
0.5589839, 1.08752, -0.537932, 1, 1, 1, 1, 1,
0.5617505, -1.254297, 2.773658, 1, 1, 1, 1, 1,
0.5653136, 0.3133978, 0.7745759, 1, 1, 1, 1, 1,
0.5659138, -1.593454, 3.188098, 1, 1, 1, 1, 1,
0.5663397, -0.8051171, 3.171943, 1, 1, 1, 1, 1,
0.5740582, 0.2626152, 1.618243, 1, 1, 1, 1, 1,
0.5740784, -0.483538, 3.17368, 1, 1, 1, 1, 1,
0.574685, -0.4259537, 1.876515, 1, 1, 1, 1, 1,
0.5762795, 0.5540621, 0.2412411, 1, 1, 1, 1, 1,
0.5766072, 1.267188, -1.103417, 1, 1, 1, 1, 1,
0.5777414, -2.028594, 1.881174, 1, 1, 1, 1, 1,
0.5802447, -2.337623, 2.057132, 1, 1, 1, 1, 1,
0.5821947, -1.972551, 3.181113, 0, 0, 1, 1, 1,
0.5849043, -1.372247, 3.587871, 1, 0, 0, 1, 1,
0.585952, -0.5406549, 0.8444311, 1, 0, 0, 1, 1,
0.587515, 1.796856, -2.444063, 1, 0, 0, 1, 1,
0.5986302, 0.1444949, -0.1686203, 1, 0, 0, 1, 1,
0.6001227, 0.04072316, 2.194283, 1, 0, 0, 1, 1,
0.606223, 0.3046983, -0.07081204, 0, 0, 0, 1, 1,
0.6067969, -1.364128, 1.038465, 0, 0, 0, 1, 1,
0.6081601, -0.9865311, -0.1418903, 0, 0, 0, 1, 1,
0.6103407, -1.370858, 3.609049, 0, 0, 0, 1, 1,
0.6163567, -0.3280002, 4.290206, 0, 0, 0, 1, 1,
0.6204702, 0.2961259, 0.2991943, 0, 0, 0, 1, 1,
0.6236282, 1.306074, 1.500163, 0, 0, 0, 1, 1,
0.6426191, 0.4422888, -0.5012959, 1, 1, 1, 1, 1,
0.6499583, -0.2129547, 0.7870402, 1, 1, 1, 1, 1,
0.6504407, 2.104174, -1.211605, 1, 1, 1, 1, 1,
0.6518483, -0.7639325, 3.200601, 1, 1, 1, 1, 1,
0.652317, -0.2812654, 2.158359, 1, 1, 1, 1, 1,
0.6527929, -1.216116, 1.837273, 1, 1, 1, 1, 1,
0.6612235, 1.04393, 0.1137163, 1, 1, 1, 1, 1,
0.6657405, 0.07631432, 1.544501, 1, 1, 1, 1, 1,
0.6670008, 0.1529431, 1.103267, 1, 1, 1, 1, 1,
0.6748352, 0.3853175, 0.7814806, 1, 1, 1, 1, 1,
0.6752869, -2.589799, 2.304451, 1, 1, 1, 1, 1,
0.6779119, -0.2042086, 1.830349, 1, 1, 1, 1, 1,
0.6792706, -0.09802949, -0.038139, 1, 1, 1, 1, 1,
0.6837733, 0.9133049, 1.631631, 1, 1, 1, 1, 1,
0.6838917, 1.671431, 0.1526304, 1, 1, 1, 1, 1,
0.6845939, 0.3828178, 0.1539548, 0, 0, 1, 1, 1,
0.6864024, 0.02263341, 1.181383, 1, 0, 0, 1, 1,
0.6887065, -1.040484, 2.290613, 1, 0, 0, 1, 1,
0.6959315, 0.6172398, -0.01283271, 1, 0, 0, 1, 1,
0.7005816, 1.017763, 1.044094, 1, 0, 0, 1, 1,
0.7018499, -0.6465816, 3.001122, 1, 0, 0, 1, 1,
0.702503, 0.6680383, 1.928975, 0, 0, 0, 1, 1,
0.7114962, -0.07708883, 0.04397555, 0, 0, 0, 1, 1,
0.7143198, 0.510992, 0.8524617, 0, 0, 0, 1, 1,
0.7185792, 0.8840472, 1.185833, 0, 0, 0, 1, 1,
0.7199349, 1.418091, 0.4508643, 0, 0, 0, 1, 1,
0.720063, -0.321176, 2.147766, 0, 0, 0, 1, 1,
0.7219758, -0.13079, 2.477476, 0, 0, 0, 1, 1,
0.7235981, -0.9597224, 1.414426, 1, 1, 1, 1, 1,
0.7297945, 0.04813219, 2.583836, 1, 1, 1, 1, 1,
0.7366022, 0.6646802, 1.438272, 1, 1, 1, 1, 1,
0.7389542, 0.5289605, -0.6435729, 1, 1, 1, 1, 1,
0.7390895, 0.1333209, 0.7488565, 1, 1, 1, 1, 1,
0.740766, -0.08141541, 4.425852, 1, 1, 1, 1, 1,
0.7420526, -1.275231, 2.444464, 1, 1, 1, 1, 1,
0.7444004, -0.4461132, 3.441117, 1, 1, 1, 1, 1,
0.744539, 0.03337667, -1.052702, 1, 1, 1, 1, 1,
0.7476733, -1.044919, 2.150339, 1, 1, 1, 1, 1,
0.7480426, 1.085987, 0.6602432, 1, 1, 1, 1, 1,
0.7484715, -0.765774, 2.411622, 1, 1, 1, 1, 1,
0.7485227, -0.01732933, 3.571734, 1, 1, 1, 1, 1,
0.7501765, -0.9837083, 1.162117, 1, 1, 1, 1, 1,
0.7503268, 0.2610941, 1.299853, 1, 1, 1, 1, 1,
0.7549093, 0.7630165, -1.134164, 0, 0, 1, 1, 1,
0.76039, 0.1535904, 1.560188, 1, 0, 0, 1, 1,
0.7669964, 0.5319711, 0.6610584, 1, 0, 0, 1, 1,
0.7706201, -0.5446088, 1.203498, 1, 0, 0, 1, 1,
0.7748778, 1.235896, -0.4974358, 1, 0, 0, 1, 1,
0.775664, -0.445847, 1.759192, 1, 0, 0, 1, 1,
0.7759895, -1.411514, 3.282666, 0, 0, 0, 1, 1,
0.7780144, -0.2267769, 1.774696, 0, 0, 0, 1, 1,
0.7825585, 2.066461, -0.8796453, 0, 0, 0, 1, 1,
0.7830993, 0.01214235, 1.306364, 0, 0, 0, 1, 1,
0.7840826, 0.434347, 2.412065, 0, 0, 0, 1, 1,
0.7855107, 1.783161, 0.908859, 0, 0, 0, 1, 1,
0.7863066, -1.314561, 4.493289, 0, 0, 0, 1, 1,
0.7946608, -1.420472, 3.482748, 1, 1, 1, 1, 1,
0.8050874, -0.8331435, 1.82691, 1, 1, 1, 1, 1,
0.8120027, -0.256265, 1.522859, 1, 1, 1, 1, 1,
0.8169824, 0.4618393, 1.983002, 1, 1, 1, 1, 1,
0.8208501, -0.5279008, 3.23915, 1, 1, 1, 1, 1,
0.8208504, -0.8663126, 1.776397, 1, 1, 1, 1, 1,
0.8213977, -0.6706583, 2.248612, 1, 1, 1, 1, 1,
0.8240036, -0.5928125, 3.14649, 1, 1, 1, 1, 1,
0.8276635, 1.92379, 0.36751, 1, 1, 1, 1, 1,
0.8286117, 0.4307771, 3.824332, 1, 1, 1, 1, 1,
0.8330995, -0.1946555, 0.4347537, 1, 1, 1, 1, 1,
0.8332115, 0.06869638, 1.235196, 1, 1, 1, 1, 1,
0.8370176, 0.5309395, 1.875751, 1, 1, 1, 1, 1,
0.8428665, 0.549008, 2.869626, 1, 1, 1, 1, 1,
0.8450235, -0.8257811, 0.2388482, 1, 1, 1, 1, 1,
0.8455167, -0.5042674, 2.508063, 0, 0, 1, 1, 1,
0.8561659, 0.7981508, 2.658097, 1, 0, 0, 1, 1,
0.8564379, 1.147827, -0.8828238, 1, 0, 0, 1, 1,
0.8564515, 0.1562812, 1.976304, 1, 0, 0, 1, 1,
0.8594616, 1.135021, 0.3962852, 1, 0, 0, 1, 1,
0.8602647, -0.2346773, 3.149169, 1, 0, 0, 1, 1,
0.8668549, -1.295708, 4.257857, 0, 0, 0, 1, 1,
0.8676418, -1.871815, 1.89929, 0, 0, 0, 1, 1,
0.8684696, -0.2960575, 2.067522, 0, 0, 0, 1, 1,
0.8703895, -0.298341, 1.693025, 0, 0, 0, 1, 1,
0.8709083, 0.6235341, 2.28084, 0, 0, 0, 1, 1,
0.8717365, 0.4713056, 2.541993, 0, 0, 0, 1, 1,
0.8735326, 1.174149, 0.9438769, 0, 0, 0, 1, 1,
0.8769933, 0.8252448, 0.3812669, 1, 1, 1, 1, 1,
0.8776671, 0.9624003, 0.1907081, 1, 1, 1, 1, 1,
0.8789314, 1.126229, -0.09335666, 1, 1, 1, 1, 1,
0.8792877, 1.317502, 0.7298826, 1, 1, 1, 1, 1,
0.8809234, -0.2702754, 2.003792, 1, 1, 1, 1, 1,
0.8833809, 0.1580297, -0.2501587, 1, 1, 1, 1, 1,
0.8898744, -0.4579069, 2.049744, 1, 1, 1, 1, 1,
0.8904231, 1.302852, -0.8986534, 1, 1, 1, 1, 1,
0.8916595, 1.995118, -0.3088917, 1, 1, 1, 1, 1,
0.892359, -0.6899135, -0.02480791, 1, 1, 1, 1, 1,
0.893183, -0.9934983, 3.044565, 1, 1, 1, 1, 1,
0.8936155, -0.6354206, 2.317924, 1, 1, 1, 1, 1,
0.8950455, -0.4821757, 1.02197, 1, 1, 1, 1, 1,
0.8996508, 1.725001, 0.8053502, 1, 1, 1, 1, 1,
0.9018908, -0.2979997, 0.8000698, 1, 1, 1, 1, 1,
0.9043408, -1.110893, 2.243022, 0, 0, 1, 1, 1,
0.9189966, 1.363463, 1.988739, 1, 0, 0, 1, 1,
0.9248747, -0.2433224, 0.06840479, 1, 0, 0, 1, 1,
0.9339929, 0.8549204, -0.1164551, 1, 0, 0, 1, 1,
0.9362152, 0.5808263, 0.9642355, 1, 0, 0, 1, 1,
0.9399868, 1.129819, 0.9591194, 1, 0, 0, 1, 1,
0.9423057, 0.06254533, 0.2508823, 0, 0, 0, 1, 1,
0.945515, -2.572116, 3.470336, 0, 0, 0, 1, 1,
0.952574, 1.894554, 1.529704, 0, 0, 0, 1, 1,
0.963653, 0.4184173, 2.208483, 0, 0, 0, 1, 1,
0.9655696, 0.4543116, 0.3553824, 0, 0, 0, 1, 1,
0.9766018, -0.2827717, 3.508911, 0, 0, 0, 1, 1,
0.977645, -1.285744, 3.614118, 0, 0, 0, 1, 1,
0.9912523, 0.9495869, -0.661999, 1, 1, 1, 1, 1,
0.992161, 0.3257689, 0.2248843, 1, 1, 1, 1, 1,
1.004629, 0.08299673, 2.88369, 1, 1, 1, 1, 1,
1.007122, -2.315916, 1.971383, 1, 1, 1, 1, 1,
1.012621, -0.9803392, 2.447853, 1, 1, 1, 1, 1,
1.023406, 2.998348, 1.277107, 1, 1, 1, 1, 1,
1.025143, 2.539448, 0.8500156, 1, 1, 1, 1, 1,
1.033512, -0.7653266, 2.997969, 1, 1, 1, 1, 1,
1.045191, 0.7359478, 0.9812487, 1, 1, 1, 1, 1,
1.052777, 0.9210954, 0.5014457, 1, 1, 1, 1, 1,
1.062747, 1.007762, 2.416089, 1, 1, 1, 1, 1,
1.064345, 0.6503157, -0.8237368, 1, 1, 1, 1, 1,
1.064543, 0.5949851, 1.729181, 1, 1, 1, 1, 1,
1.069285, 0.1126404, -0.54693, 1, 1, 1, 1, 1,
1.071071, -2.794064, 1.314968, 1, 1, 1, 1, 1,
1.071734, 0.3593425, -0.1607814, 0, 0, 1, 1, 1,
1.075856, 1.249812, -0.7057578, 1, 0, 0, 1, 1,
1.080697, -1.079894, 2.374631, 1, 0, 0, 1, 1,
1.084591, -2.052765, 1.940348, 1, 0, 0, 1, 1,
1.089297, 0.4865573, 0.9566366, 1, 0, 0, 1, 1,
1.091047, 0.9226625, 0.1700538, 1, 0, 0, 1, 1,
1.091419, -1.706561, 4.540733, 0, 0, 0, 1, 1,
1.102768, -0.1805378, 2.147929, 0, 0, 0, 1, 1,
1.103363, 0.1336214, 1.422714, 0, 0, 0, 1, 1,
1.110445, -1.346839, 2.606373, 0, 0, 0, 1, 1,
1.111287, 0.7045081, 1.834448, 0, 0, 0, 1, 1,
1.111936, -1.068443, 0.9084969, 0, 0, 0, 1, 1,
1.113211, 0.2674519, 0.03350715, 0, 0, 0, 1, 1,
1.116067, 0.4231607, 1.255759, 1, 1, 1, 1, 1,
1.121591, 0.4281567, 1.308643, 1, 1, 1, 1, 1,
1.122746, -1.409681, 3.183949, 1, 1, 1, 1, 1,
1.123562, -0.0961478, 2.394259, 1, 1, 1, 1, 1,
1.129192, 0.1027565, 1.337861, 1, 1, 1, 1, 1,
1.130146, -0.7923869, 4.331286, 1, 1, 1, 1, 1,
1.131464, -1.166852, 1.332564, 1, 1, 1, 1, 1,
1.136206, -1.191442, 2.431203, 1, 1, 1, 1, 1,
1.143238, 0.5238102, 0.171895, 1, 1, 1, 1, 1,
1.148726, -0.4803401, 3.416529, 1, 1, 1, 1, 1,
1.153387, -0.8827962, 2.715668, 1, 1, 1, 1, 1,
1.159027, -0.5325932, 2.382465, 1, 1, 1, 1, 1,
1.16279, 0.8101714, 1.582404, 1, 1, 1, 1, 1,
1.188917, 0.2445659, 2.16154, 1, 1, 1, 1, 1,
1.196266, -1.041808, 2.77712, 1, 1, 1, 1, 1,
1.202512, 0.5182289, 1.920307, 0, 0, 1, 1, 1,
1.206752, 0.4516592, 2.019933, 1, 0, 0, 1, 1,
1.210532, 0.9314578, 0.8328801, 1, 0, 0, 1, 1,
1.21057, 0.02541516, 0.4904381, 1, 0, 0, 1, 1,
1.213517, 1.056257, -0.5965384, 1, 0, 0, 1, 1,
1.21893, -1.310983, 3.294279, 1, 0, 0, 1, 1,
1.241011, -0.197466, -0.4538152, 0, 0, 0, 1, 1,
1.255815, -0.4526419, 0.4628062, 0, 0, 0, 1, 1,
1.255849, 0.5414533, 1.267664, 0, 0, 0, 1, 1,
1.262839, -1.408927, 2.426315, 0, 0, 0, 1, 1,
1.275268, -0.5825958, 1.848172, 0, 0, 0, 1, 1,
1.293556, -2.232317, 4.533164, 0, 0, 0, 1, 1,
1.314282, -0.3661218, 0.2306463, 0, 0, 0, 1, 1,
1.320662, 0.9944653, 0.3954442, 1, 1, 1, 1, 1,
1.3245, -0.7620021, 0.5823555, 1, 1, 1, 1, 1,
1.324707, 0.2854138, 1.633286, 1, 1, 1, 1, 1,
1.327743, -0.3991881, 1.031659, 1, 1, 1, 1, 1,
1.331541, 0.2362489, 2.155978, 1, 1, 1, 1, 1,
1.338855, -0.9925857, 2.143081, 1, 1, 1, 1, 1,
1.345981, -0.1700721, 2.475173, 1, 1, 1, 1, 1,
1.349498, 0.4337541, 2.733063, 1, 1, 1, 1, 1,
1.360853, -0.3995986, 1.9046, 1, 1, 1, 1, 1,
1.37246, 0.475462, 1.474585, 1, 1, 1, 1, 1,
1.379603, -0.4827411, 1.915256, 1, 1, 1, 1, 1,
1.383197, 0.1980399, -0.3139245, 1, 1, 1, 1, 1,
1.385758, 1.949503, 2.700834, 1, 1, 1, 1, 1,
1.388984, -1.038775, 0.9928912, 1, 1, 1, 1, 1,
1.389503, -1.376882, 3.067519, 1, 1, 1, 1, 1,
1.392667, -0.1368676, 2.336895, 0, 0, 1, 1, 1,
1.396515, -0.5513965, 2.624249, 1, 0, 0, 1, 1,
1.400151, -1.095417, 2.051594, 1, 0, 0, 1, 1,
1.401503, -0.2246069, 0.3269528, 1, 0, 0, 1, 1,
1.402112, -0.3393619, 1.850123, 1, 0, 0, 1, 1,
1.404195, -0.1926942, 0.4815843, 1, 0, 0, 1, 1,
1.411609, -1.185714, 3.988288, 0, 0, 0, 1, 1,
1.430122, -0.1189537, 1.890642, 0, 0, 0, 1, 1,
1.447987, 1.904443, 0.4963609, 0, 0, 0, 1, 1,
1.461134, 1.562787, -0.1347097, 0, 0, 0, 1, 1,
1.468277, 0.4035536, 2.119424, 0, 0, 0, 1, 1,
1.472764, 1.25094, 0.726853, 0, 0, 0, 1, 1,
1.48797, 1.081632, 0.03832954, 0, 0, 0, 1, 1,
1.507931, 1.963927, 2.097707, 1, 1, 1, 1, 1,
1.515921, 0.6582893, -0.03396867, 1, 1, 1, 1, 1,
1.541682, 1.184204, 0.4382805, 1, 1, 1, 1, 1,
1.541698, 0.7782476, 2.805719, 1, 1, 1, 1, 1,
1.545502, 1.977189, 3.001719, 1, 1, 1, 1, 1,
1.566123, 0.9480426, 1.314211, 1, 1, 1, 1, 1,
1.579556, 0.004737029, -0.6378656, 1, 1, 1, 1, 1,
1.590949, -1.57265, 1.946213, 1, 1, 1, 1, 1,
1.593462, -0.7080836, 0.2424556, 1, 1, 1, 1, 1,
1.603038, -0.4785168, 1.808005, 1, 1, 1, 1, 1,
1.608657, -0.127219, 1.468974, 1, 1, 1, 1, 1,
1.612601, -0.3356726, 3.61733, 1, 1, 1, 1, 1,
1.637144, 0.3396305, 0.111523, 1, 1, 1, 1, 1,
1.654707, 0.7321305, 0.8427869, 1, 1, 1, 1, 1,
1.65634, -0.3616431, 1.526578, 1, 1, 1, 1, 1,
1.663284, 1.524441, 1.885285, 0, 0, 1, 1, 1,
1.667372, -1.989499, 1.845349, 1, 0, 0, 1, 1,
1.669873, 1.505944, 0.4239641, 1, 0, 0, 1, 1,
1.721371, -1.533888, 1.930076, 1, 0, 0, 1, 1,
1.762333, 0.7076914, 2.542227, 1, 0, 0, 1, 1,
1.770995, 0.2603458, 2.992229, 1, 0, 0, 1, 1,
1.778456, -1.043385, 0.4879042, 0, 0, 0, 1, 1,
1.782496, 0.6073205, 0.3557366, 0, 0, 0, 1, 1,
1.78716, 0.6571895, 0.5286848, 0, 0, 0, 1, 1,
1.793441, -0.8893257, 2.528582, 0, 0, 0, 1, 1,
1.802849, -0.7684611, 1.337625, 0, 0, 0, 1, 1,
1.825239, 0.8171728, 2.069702, 0, 0, 0, 1, 1,
1.826005, 0.0611173, 2.282716, 0, 0, 0, 1, 1,
1.841028, -0.2125127, 2.693569, 1, 1, 1, 1, 1,
1.841789, 1.123991, 0.6123376, 1, 1, 1, 1, 1,
1.849956, -1.169654, 2.264979, 1, 1, 1, 1, 1,
1.851691, -0.52662, 0.8605757, 1, 1, 1, 1, 1,
1.863612, 1.361726, 2.502912, 1, 1, 1, 1, 1,
1.890167, 0.2289068, 2.413798, 1, 1, 1, 1, 1,
1.929587, 0.2711889, 0.4824843, 1, 1, 1, 1, 1,
1.939563, -0.8249989, 2.640961, 1, 1, 1, 1, 1,
1.967032, 0.2422236, -0.3678108, 1, 1, 1, 1, 1,
1.980804, -0.8378869, 1.333558, 1, 1, 1, 1, 1,
2.000111, -1.263197, 2.242947, 1, 1, 1, 1, 1,
2.004064, 0.756418, 0.5384696, 1, 1, 1, 1, 1,
2.014001, 1.688003, 1.62649, 1, 1, 1, 1, 1,
2.02442, 0.1337137, 3.77315, 1, 1, 1, 1, 1,
2.047917, -0.466502, 2.969889, 1, 1, 1, 1, 1,
2.051271, -0.4333813, 1.89197, 0, 0, 1, 1, 1,
2.063841, 1.638814, 1.814823, 1, 0, 0, 1, 1,
2.074596, -1.797221, 3.165133, 1, 0, 0, 1, 1,
2.080328, 0.948807, 2.334642, 1, 0, 0, 1, 1,
2.155053, -0.2700213, 0.2661707, 1, 0, 0, 1, 1,
2.251142, 0.8275576, 1.227524, 1, 0, 0, 1, 1,
2.276633, -1.091357, 1.000825, 0, 0, 0, 1, 1,
2.297892, 0.5673037, 0.8320233, 0, 0, 0, 1, 1,
2.29972, -0.7017024, 0.93322, 0, 0, 0, 1, 1,
2.312165, 1.044754, 0.9495454, 0, 0, 0, 1, 1,
2.358814, 0.3891429, 1.409109, 0, 0, 0, 1, 1,
2.374398, -0.4081563, 0.7422985, 0, 0, 0, 1, 1,
2.41805, -0.6076892, 0.9476243, 0, 0, 0, 1, 1,
2.501945, -0.1207605, 1.433734, 1, 1, 1, 1, 1,
2.538473, 1.121701, -0.3149135, 1, 1, 1, 1, 1,
2.882021, -1.13609, -0.1708985, 1, 1, 1, 1, 1,
3.0009, 0.9720222, 2.449729, 1, 1, 1, 1, 1,
3.134918, 0.1624069, 2.662318, 1, 1, 1, 1, 1,
3.181759, 0.03039867, 1.558634, 1, 1, 1, 1, 1,
3.444049, 0.5938542, 0.09494592, 1, 1, 1, 1, 1
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
var radius = 9.587961;
var distance = 33.6773;
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
mvMatrix.translate( -0.4195988, 0.1241739, -0.2972705 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.6773);
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
