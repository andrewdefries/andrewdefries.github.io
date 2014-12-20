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
-3.309502, 1.817883, 0.9282174, 1, 0, 0, 1,
-3.109676, 0.6719364, -4.120135, 1, 0.007843138, 0, 1,
-3.086807, -0.5471203, -1.26277, 1, 0.01176471, 0, 1,
-2.748579, 0.9726595, -0.2358515, 1, 0.01960784, 0, 1,
-2.634498, 0.4160351, -1.140958, 1, 0.02352941, 0, 1,
-2.585253, -0.4179063, -0.2088061, 1, 0.03137255, 0, 1,
-2.551426, -0.6386105, -3.346418, 1, 0.03529412, 0, 1,
-2.538913, -0.7869943, -1.612144, 1, 0.04313726, 0, 1,
-2.391852, 1.806706, -1.750886, 1, 0.04705882, 0, 1,
-2.311214, 0.236191, 0.519633, 1, 0.05490196, 0, 1,
-2.292416, 0.2278897, -1.712088, 1, 0.05882353, 0, 1,
-2.260894, 1.542529, -1.962062, 1, 0.06666667, 0, 1,
-2.232138, 1.076641, -1.536297, 1, 0.07058824, 0, 1,
-2.208867, 0.2993265, 0.1381398, 1, 0.07843138, 0, 1,
-2.207142, 0.4176842, -2.156661, 1, 0.08235294, 0, 1,
-2.194488, 0.2533586, -2.729982, 1, 0.09019608, 0, 1,
-2.191818, -0.9384095, -2.071093, 1, 0.09411765, 0, 1,
-2.164737, -1.634297, -2.607826, 1, 0.1019608, 0, 1,
-2.145044, 1.027164, -1.945579, 1, 0.1098039, 0, 1,
-2.136151, 0.8789161, 0.505748, 1, 0.1137255, 0, 1,
-2.130525, -0.8847996, -1.45473, 1, 0.1215686, 0, 1,
-2.114317, 0.2310615, -2.202359, 1, 0.1254902, 0, 1,
-2.054514, 1.49925, -0.7675025, 1, 0.1333333, 0, 1,
-2.034178, -0.2037579, -1.159131, 1, 0.1372549, 0, 1,
-2.015969, 0.7367909, -0.2112689, 1, 0.145098, 0, 1,
-2.014096, -0.4357665, -2.658464, 1, 0.1490196, 0, 1,
-2.003103, -1.083397, -3.539617, 1, 0.1568628, 0, 1,
-1.994775, -0.2038081, -2.596767, 1, 0.1607843, 0, 1,
-1.988468, 1.840979, -0.6658899, 1, 0.1686275, 0, 1,
-1.948965, -1.096131, -3.292778, 1, 0.172549, 0, 1,
-1.92462, 0.1497403, -2.337171, 1, 0.1803922, 0, 1,
-1.924041, -0.6598198, -1.468297, 1, 0.1843137, 0, 1,
-1.92081, -0.07370178, -1.928505, 1, 0.1921569, 0, 1,
-1.914895, -0.01669447, -2.985532, 1, 0.1960784, 0, 1,
-1.906149, -1.480518, -3.058674, 1, 0.2039216, 0, 1,
-1.902465, 1.379093, -1.49379, 1, 0.2117647, 0, 1,
-1.898329, 0.1353097, -2.482412, 1, 0.2156863, 0, 1,
-1.892707, -0.8179172, -3.123306, 1, 0.2235294, 0, 1,
-1.887373, -0.7433099, -1.194022, 1, 0.227451, 0, 1,
-1.835693, -1.053059, -2.374281, 1, 0.2352941, 0, 1,
-1.818995, -0.3149546, -2.243689, 1, 0.2392157, 0, 1,
-1.814653, -1.514844, -1.428394, 1, 0.2470588, 0, 1,
-1.80791, 0.7000701, 0.6257877, 1, 0.2509804, 0, 1,
-1.790451, -1.3157, -4.334921, 1, 0.2588235, 0, 1,
-1.77895, -0.5836815, -1.582984, 1, 0.2627451, 0, 1,
-1.765835, 1.177153, -0.2373502, 1, 0.2705882, 0, 1,
-1.755623, -0.002407048, -4.020001, 1, 0.2745098, 0, 1,
-1.745556, -0.1831262, -2.80554, 1, 0.282353, 0, 1,
-1.74342, 0.7096495, -1.928104, 1, 0.2862745, 0, 1,
-1.73684, 0.3910867, -1.003272, 1, 0.2941177, 0, 1,
-1.717041, 0.2810878, 0.506862, 1, 0.3019608, 0, 1,
-1.713208, 0.0741391, -1.781089, 1, 0.3058824, 0, 1,
-1.70535, -1.74108, -2.712266, 1, 0.3137255, 0, 1,
-1.704049, 0.06195036, -3.514461, 1, 0.3176471, 0, 1,
-1.703369, 1.120963, -1.409024, 1, 0.3254902, 0, 1,
-1.696574, -0.6625656, -1.948887, 1, 0.3294118, 0, 1,
-1.689463, 1.280266, 0.6616962, 1, 0.3372549, 0, 1,
-1.671119, 0.2266791, -1.320183, 1, 0.3411765, 0, 1,
-1.651096, -1.6735, -1.247372, 1, 0.3490196, 0, 1,
-1.642437, 0.9838918, -0.856298, 1, 0.3529412, 0, 1,
-1.640508, -0.4075324, -0.9773142, 1, 0.3607843, 0, 1,
-1.639078, -0.04756313, -2.228121, 1, 0.3647059, 0, 1,
-1.62817, 1.668283, 0.310095, 1, 0.372549, 0, 1,
-1.613619, 0.6754997, -0.07469936, 1, 0.3764706, 0, 1,
-1.611626, 1.44992, -0.4613651, 1, 0.3843137, 0, 1,
-1.608035, 1.288201, 1.083551, 1, 0.3882353, 0, 1,
-1.600031, -1.423392, -2.228791, 1, 0.3960784, 0, 1,
-1.599601, 0.4340092, -2.826182, 1, 0.4039216, 0, 1,
-1.593598, -1.534376, -2.368129, 1, 0.4078431, 0, 1,
-1.587467, -0.370242, -2.266445, 1, 0.4156863, 0, 1,
-1.581114, 0.5410972, 0.03592935, 1, 0.4196078, 0, 1,
-1.578184, -0.1503997, 0.5537503, 1, 0.427451, 0, 1,
-1.568525, 0.7881524, -3.194585, 1, 0.4313726, 0, 1,
-1.565098, -0.6740688, -2.22919, 1, 0.4392157, 0, 1,
-1.562339, -0.03323353, -0.9104042, 1, 0.4431373, 0, 1,
-1.560229, 0.6925399, -0.1715282, 1, 0.4509804, 0, 1,
-1.557634, 0.03988986, -1.27091, 1, 0.454902, 0, 1,
-1.539228, -0.06568682, -2.417676, 1, 0.4627451, 0, 1,
-1.5344, 1.526442, -1.541708, 1, 0.4666667, 0, 1,
-1.508684, -0.07415608, -1.191491, 1, 0.4745098, 0, 1,
-1.503323, 1.101161, -0.586906, 1, 0.4784314, 0, 1,
-1.502416, -0.1414053, -1.758514, 1, 0.4862745, 0, 1,
-1.497454, -1.023901, -2.282219, 1, 0.4901961, 0, 1,
-1.4907, -2.237742, -1.343094, 1, 0.4980392, 0, 1,
-1.488663, -0.855345, -1.763082, 1, 0.5058824, 0, 1,
-1.488146, 0.8717515, -0.3683437, 1, 0.509804, 0, 1,
-1.484827, -2.364974, -2.294725, 1, 0.5176471, 0, 1,
-1.484133, 0.3055594, -1.802062, 1, 0.5215687, 0, 1,
-1.453162, 1.411234, -0.5339692, 1, 0.5294118, 0, 1,
-1.443303, 0.5082517, -1.315006, 1, 0.5333334, 0, 1,
-1.442396, 0.3938891, -2.100432, 1, 0.5411765, 0, 1,
-1.439986, -0.9716349, -1.852584, 1, 0.5450981, 0, 1,
-1.432987, 1.519499, -1.779268, 1, 0.5529412, 0, 1,
-1.422639, 1.115716, 0.4561574, 1, 0.5568628, 0, 1,
-1.420369, -1.408454, -2.172624, 1, 0.5647059, 0, 1,
-1.418958, -0.6758274, -1.204461, 1, 0.5686275, 0, 1,
-1.415586, -1.343578, -2.247453, 1, 0.5764706, 0, 1,
-1.411637, -1.065846, -0.9204587, 1, 0.5803922, 0, 1,
-1.409314, 1.24454, -0.1529181, 1, 0.5882353, 0, 1,
-1.389801, 0.9356912, -2.398645, 1, 0.5921569, 0, 1,
-1.388291, -0.4435982, -3.026073, 1, 0.6, 0, 1,
-1.382943, 2.464841, -2.004425, 1, 0.6078432, 0, 1,
-1.375639, 0.8028823, -2.353341, 1, 0.6117647, 0, 1,
-1.370036, -0.9021974, -2.376269, 1, 0.6196079, 0, 1,
-1.369401, 0.1765542, -1.711518, 1, 0.6235294, 0, 1,
-1.362257, -2.107421, -2.657779, 1, 0.6313726, 0, 1,
-1.340804, 0.02722804, -3.303379, 1, 0.6352941, 0, 1,
-1.33827, -2.373963, -4.560503, 1, 0.6431373, 0, 1,
-1.336773, 2.098099, -1.17193, 1, 0.6470588, 0, 1,
-1.335147, -0.3075276, -1.385063, 1, 0.654902, 0, 1,
-1.333688, 0.03444803, 0.1674767, 1, 0.6588235, 0, 1,
-1.331642, -1.406548, -1.347497, 1, 0.6666667, 0, 1,
-1.329055, 0.06355865, 0.5351307, 1, 0.6705883, 0, 1,
-1.322303, -0.8491295, -3.15843, 1, 0.6784314, 0, 1,
-1.320594, 2.30785, -0.7856742, 1, 0.682353, 0, 1,
-1.304073, -0.7229515, -3.365062, 1, 0.6901961, 0, 1,
-1.295661, -0.1115669, 0.2182131, 1, 0.6941177, 0, 1,
-1.265875, 0.403084, -0.6576036, 1, 0.7019608, 0, 1,
-1.241991, 1.713687, 0.4462962, 1, 0.7098039, 0, 1,
-1.223372, -0.003150888, -3.045319, 1, 0.7137255, 0, 1,
-1.217768, 0.6037122, -1.585046, 1, 0.7215686, 0, 1,
-1.214991, -0.4058729, -2.035977, 1, 0.7254902, 0, 1,
-1.210266, -1.052232, -2.430366, 1, 0.7333333, 0, 1,
-1.207363, -0.3429788, 0.2331889, 1, 0.7372549, 0, 1,
-1.191403, -0.1462546, -1.312146, 1, 0.7450981, 0, 1,
-1.188638, 0.503351, -0.6764687, 1, 0.7490196, 0, 1,
-1.183185, -0.0180011, -2.010494, 1, 0.7568628, 0, 1,
-1.180436, -0.4882881, -0.9539526, 1, 0.7607843, 0, 1,
-1.174222, 0.5589553, -1.813101, 1, 0.7686275, 0, 1,
-1.173806, 2.221645, 0.8119465, 1, 0.772549, 0, 1,
-1.151406, 0.3296819, -3.491741, 1, 0.7803922, 0, 1,
-1.142126, -0.2602315, -1.752948, 1, 0.7843137, 0, 1,
-1.1377, 1.74512, 1.277974, 1, 0.7921569, 0, 1,
-1.136223, -0.855124, -1.697844, 1, 0.7960784, 0, 1,
-1.132896, -0.4857186, -2.527858, 1, 0.8039216, 0, 1,
-1.132324, -0.1656099, -0.8025182, 1, 0.8117647, 0, 1,
-1.132052, 1.15333, -0.9470022, 1, 0.8156863, 0, 1,
-1.131498, -0.9495842, -2.576662, 1, 0.8235294, 0, 1,
-1.127588, 1.882462, -0.9416286, 1, 0.827451, 0, 1,
-1.11489, 0.1322353, -0.6325091, 1, 0.8352941, 0, 1,
-1.10202, 1.044545, -0.01378289, 1, 0.8392157, 0, 1,
-1.095673, 1.40503, -1.635273, 1, 0.8470588, 0, 1,
-1.089396, -0.7628099, -2.41081, 1, 0.8509804, 0, 1,
-1.083655, -1.124308, -2.458813, 1, 0.8588235, 0, 1,
-1.079893, -0.1134697, -2.828979, 1, 0.8627451, 0, 1,
-1.072902, 1.507451, -0.9307458, 1, 0.8705882, 0, 1,
-1.072259, -1.140811, -1.887202, 1, 0.8745098, 0, 1,
-1.063752, 0.8722153, -2.67712, 1, 0.8823529, 0, 1,
-1.060401, -0.1744848, -0.7918138, 1, 0.8862745, 0, 1,
-1.05533, 0.2167925, -2.768795, 1, 0.8941177, 0, 1,
-1.051212, -1.655967, -3.743936, 1, 0.8980392, 0, 1,
-1.039777, -2.677457, -4.066962, 1, 0.9058824, 0, 1,
-1.029953, 1.013588, -2.72098, 1, 0.9137255, 0, 1,
-1.025306, -1.888232, -3.532502, 1, 0.9176471, 0, 1,
-1.017919, 0.7370451, -1.881952, 1, 0.9254902, 0, 1,
-1.011377, -1.137725, -2.396091, 1, 0.9294118, 0, 1,
-1.010796, 0.4949977, -1.94066, 1, 0.9372549, 0, 1,
-1.00356, 0.2141529, -2.351762, 1, 0.9411765, 0, 1,
-0.9989695, -0.09559891, -2.584572, 1, 0.9490196, 0, 1,
-0.9961536, 1.557145, -0.8359844, 1, 0.9529412, 0, 1,
-0.9959866, 2.909092, -1.594978, 1, 0.9607843, 0, 1,
-0.9920623, 0.6523231, 1.302747, 1, 0.9647059, 0, 1,
-0.9895748, 1.015863, -0.8230724, 1, 0.972549, 0, 1,
-0.978881, 0.4934941, -0.08769288, 1, 0.9764706, 0, 1,
-0.9673291, -0.4606506, -1.058327, 1, 0.9843137, 0, 1,
-0.9603633, 0.1260676, 0.2986884, 1, 0.9882353, 0, 1,
-0.9564118, 0.8552365, -0.3173345, 1, 0.9960784, 0, 1,
-0.9558675, -0.8003634, -4.07698, 0.9960784, 1, 0, 1,
-0.9526505, -0.9457117, -2.284863, 0.9921569, 1, 0, 1,
-0.9497511, 1.403402, 1.531301, 0.9843137, 1, 0, 1,
-0.9449764, -0.03762977, -2.352695, 0.9803922, 1, 0, 1,
-0.9333917, 1.704296, -2.419302, 0.972549, 1, 0, 1,
-0.9131548, 0.4335111, -1.052849, 0.9686275, 1, 0, 1,
-0.9106638, 0.3563007, -0.905049, 0.9607843, 1, 0, 1,
-0.9098168, -0.4039968, -1.981511, 0.9568627, 1, 0, 1,
-0.9097548, 0.1909505, -1.254786, 0.9490196, 1, 0, 1,
-0.9061868, -1.35188, -2.297948, 0.945098, 1, 0, 1,
-0.8992245, -2.005106, -2.225349, 0.9372549, 1, 0, 1,
-0.8968416, 0.3346872, -2.041195, 0.9333333, 1, 0, 1,
-0.8906559, 0.8885939, -0.4423138, 0.9254902, 1, 0, 1,
-0.8902031, 1.021752, 0.3153169, 0.9215686, 1, 0, 1,
-0.8864912, 0.2818071, -0.2458722, 0.9137255, 1, 0, 1,
-0.8862305, -0.9833063, -1.999114, 0.9098039, 1, 0, 1,
-0.8835893, -0.8291654, -1.794712, 0.9019608, 1, 0, 1,
-0.8823528, 1.163118, -1.196969, 0.8941177, 1, 0, 1,
-0.8779358, -0.141997, -1.872147, 0.8901961, 1, 0, 1,
-0.871207, -0.3998768, -1.100747, 0.8823529, 1, 0, 1,
-0.8679456, 0.8298646, -0.8668019, 0.8784314, 1, 0, 1,
-0.8663125, 2.035098, -0.6636046, 0.8705882, 1, 0, 1,
-0.8661212, -1.089278, -3.444044, 0.8666667, 1, 0, 1,
-0.8660119, -0.5487019, -2.861467, 0.8588235, 1, 0, 1,
-0.8647144, -0.06997764, -3.309651, 0.854902, 1, 0, 1,
-0.8575555, 0.6392517, -2.004564, 0.8470588, 1, 0, 1,
-0.8566166, 0.8137241, 0.275251, 0.8431373, 1, 0, 1,
-0.8481738, 0.4033815, -1.334475, 0.8352941, 1, 0, 1,
-0.8451578, -1.293995, -3.608313, 0.8313726, 1, 0, 1,
-0.8448834, 0.1341946, -0.7748134, 0.8235294, 1, 0, 1,
-0.8427079, -0.2315773, -0.7434563, 0.8196079, 1, 0, 1,
-0.8420486, 1.510905, 1.04115, 0.8117647, 1, 0, 1,
-0.8411613, 0.4844432, -0.4985951, 0.8078431, 1, 0, 1,
-0.8395592, -0.9448851, -3.197272, 0.8, 1, 0, 1,
-0.8385273, -0.581894, -3.550157, 0.7921569, 1, 0, 1,
-0.8334237, -0.807934, -1.68884, 0.7882353, 1, 0, 1,
-0.8302258, 0.6579484, -1.856983, 0.7803922, 1, 0, 1,
-0.8261359, -0.3396356, -1.108868, 0.7764706, 1, 0, 1,
-0.8229578, -0.2315897, -1.986545, 0.7686275, 1, 0, 1,
-0.8225586, 0.475859, -2.562144, 0.7647059, 1, 0, 1,
-0.8213959, -1.112255, -1.965284, 0.7568628, 1, 0, 1,
-0.8189909, 0.3881195, -1.752511, 0.7529412, 1, 0, 1,
-0.8189306, 0.5308737, -0.5442954, 0.7450981, 1, 0, 1,
-0.8122109, 0.04239896, -1.678416, 0.7411765, 1, 0, 1,
-0.8117355, -1.458128, -2.684614, 0.7333333, 1, 0, 1,
-0.8097178, -0.6059435, -1.858744, 0.7294118, 1, 0, 1,
-0.8012827, -1.741089, -2.838381, 0.7215686, 1, 0, 1,
-0.795424, -2.148576, -1.333204, 0.7176471, 1, 0, 1,
-0.7937955, 0.2062886, -2.323898, 0.7098039, 1, 0, 1,
-0.7933415, -0.683465, -0.8622946, 0.7058824, 1, 0, 1,
-0.7812558, -1.101965, -2.495035, 0.6980392, 1, 0, 1,
-0.7804081, 1.227106, -0.2348744, 0.6901961, 1, 0, 1,
-0.7773507, -0.4593211, -3.682064, 0.6862745, 1, 0, 1,
-0.7765387, 0.2499284, -1.744913, 0.6784314, 1, 0, 1,
-0.7754487, 1.551548, 1.234904, 0.6745098, 1, 0, 1,
-0.773806, -1.111987, -2.345291, 0.6666667, 1, 0, 1,
-0.7715284, -0.0054372, -1.823709, 0.6627451, 1, 0, 1,
-0.7631505, 2.130784, -1.128364, 0.654902, 1, 0, 1,
-0.7626342, 0.03512501, -0.4296714, 0.6509804, 1, 0, 1,
-0.759866, -4.184582, -2.868955, 0.6431373, 1, 0, 1,
-0.7494692, 1.931524, 1.627584, 0.6392157, 1, 0, 1,
-0.7485812, -0.1352506, 0.2151696, 0.6313726, 1, 0, 1,
-0.7472704, 0.00771502, -3.521495, 0.627451, 1, 0, 1,
-0.7427328, 1.19449, 0.3109222, 0.6196079, 1, 0, 1,
-0.7415699, -1.009477, -3.089895, 0.6156863, 1, 0, 1,
-0.7396853, -0.899698, -3.705053, 0.6078432, 1, 0, 1,
-0.7322396, -0.4626026, -1.435141, 0.6039216, 1, 0, 1,
-0.7220571, -2.037291, -1.408666, 0.5960785, 1, 0, 1,
-0.7191979, -0.5400758, -1.505824, 0.5882353, 1, 0, 1,
-0.7180815, 0.3768292, -0.8757831, 0.5843138, 1, 0, 1,
-0.7140661, 0.2480219, -0.250347, 0.5764706, 1, 0, 1,
-0.712691, -1.766534, -3.059282, 0.572549, 1, 0, 1,
-0.7122664, -1.842055, -1.47841, 0.5647059, 1, 0, 1,
-0.7074938, 0.772102, 0.6234742, 0.5607843, 1, 0, 1,
-0.7059901, 0.8436395, 0.5047057, 0.5529412, 1, 0, 1,
-0.7057995, 1.170429, 1.206825, 0.5490196, 1, 0, 1,
-0.6986372, 0.1123384, -0.7031705, 0.5411765, 1, 0, 1,
-0.6981492, 1.049428, 0.439342, 0.5372549, 1, 0, 1,
-0.6899417, 0.1904704, -3.584939, 0.5294118, 1, 0, 1,
-0.6856531, -2.487844, -3.089621, 0.5254902, 1, 0, 1,
-0.6835672, -1.169918, -2.491918, 0.5176471, 1, 0, 1,
-0.680355, 0.08113095, -1.818298, 0.5137255, 1, 0, 1,
-0.6794062, -0.4449585, -1.628882, 0.5058824, 1, 0, 1,
-0.678729, -0.4039253, -0.6869434, 0.5019608, 1, 0, 1,
-0.6767818, -0.4836311, -1.791514, 0.4941176, 1, 0, 1,
-0.6701517, -0.8529875, -0.967073, 0.4862745, 1, 0, 1,
-0.6638295, -1.124801, -2.420506, 0.4823529, 1, 0, 1,
-0.6598381, 0.07841075, -1.396349, 0.4745098, 1, 0, 1,
-0.6551802, -1.298351, -3.582741, 0.4705882, 1, 0, 1,
-0.6551765, 1.003014, -1.286137, 0.4627451, 1, 0, 1,
-0.6523727, -0.6630538, -2.652631, 0.4588235, 1, 0, 1,
-0.6481574, 0.7358868, -0.150915, 0.4509804, 1, 0, 1,
-0.6458737, -0.1349234, -2.455514, 0.4470588, 1, 0, 1,
-0.6435402, 1.851043, -0.7438379, 0.4392157, 1, 0, 1,
-0.6397578, 1.871191, 1.552469, 0.4352941, 1, 0, 1,
-0.6319139, 1.878067, 0.5949347, 0.427451, 1, 0, 1,
-0.6287377, -0.2006927, -3.233218, 0.4235294, 1, 0, 1,
-0.6228491, -0.3379197, -0.5691079, 0.4156863, 1, 0, 1,
-0.6223421, 0.3287492, 0.3963385, 0.4117647, 1, 0, 1,
-0.6174888, 0.7154201, -1.114354, 0.4039216, 1, 0, 1,
-0.6169248, -0.388078, -1.95105, 0.3960784, 1, 0, 1,
-0.6150421, 0.556092, -0.8259161, 0.3921569, 1, 0, 1,
-0.609083, 1.635867, -1.35261, 0.3843137, 1, 0, 1,
-0.606522, 1.572405, -0.8021392, 0.3803922, 1, 0, 1,
-0.6032574, 1.889854, 1.4855, 0.372549, 1, 0, 1,
-0.5988697, -0.3321094, -2.952296, 0.3686275, 1, 0, 1,
-0.5963349, 0.3234262, -1.444102, 0.3607843, 1, 0, 1,
-0.595285, 1.062078, -1.001615, 0.3568628, 1, 0, 1,
-0.5923297, 0.3182362, -0.4195518, 0.3490196, 1, 0, 1,
-0.5922267, 0.1017906, 0.02784969, 0.345098, 1, 0, 1,
-0.5897648, 1.216102, -0.779878, 0.3372549, 1, 0, 1,
-0.5875478, 1.143829, 0.7734134, 0.3333333, 1, 0, 1,
-0.5856631, 0.9007329, -1.244771, 0.3254902, 1, 0, 1,
-0.5837857, 0.2835083, -1.309396, 0.3215686, 1, 0, 1,
-0.5786631, 0.03962337, -0.5732582, 0.3137255, 1, 0, 1,
-0.5781377, -0.3657731, -4.525904, 0.3098039, 1, 0, 1,
-0.5727516, -1.205891, -2.681534, 0.3019608, 1, 0, 1,
-0.5720448, -0.6654598, -0.5087362, 0.2941177, 1, 0, 1,
-0.5706539, -0.8852544, -3.561768, 0.2901961, 1, 0, 1,
-0.5700051, -0.03988653, -0.5417287, 0.282353, 1, 0, 1,
-0.5539688, -0.210604, -1.443235, 0.2784314, 1, 0, 1,
-0.5530701, -0.03919033, -3.498945, 0.2705882, 1, 0, 1,
-0.5526109, -2.464843, -1.212296, 0.2666667, 1, 0, 1,
-0.5445778, -0.07142806, -3.951952, 0.2588235, 1, 0, 1,
-0.540812, 0.3662868, -1.009117, 0.254902, 1, 0, 1,
-0.5399339, -0.4779687, -3.172636, 0.2470588, 1, 0, 1,
-0.5300631, 1.161966, 0.2438393, 0.2431373, 1, 0, 1,
-0.5287476, -0.2850282, -2.568893, 0.2352941, 1, 0, 1,
-0.5287465, -1.020316, -2.013963, 0.2313726, 1, 0, 1,
-0.5222468, 1.86958, -0.7983448, 0.2235294, 1, 0, 1,
-0.5206621, -0.1712059, -1.324619, 0.2196078, 1, 0, 1,
-0.5197589, -0.3398705, -1.105964, 0.2117647, 1, 0, 1,
-0.5191321, 0.5858908, -0.0364591, 0.2078431, 1, 0, 1,
-0.510874, -0.9422452, -1.53846, 0.2, 1, 0, 1,
-0.5085104, -1.30089, -1.510895, 0.1921569, 1, 0, 1,
-0.5005738, 0.01306375, -2.069627, 0.1882353, 1, 0, 1,
-0.4968989, 0.725504, -0.3297617, 0.1803922, 1, 0, 1,
-0.4964251, 0.7499647, -0.008235113, 0.1764706, 1, 0, 1,
-0.4926563, 1.012951, 0.3513659, 0.1686275, 1, 0, 1,
-0.4864948, 0.2988973, -0.6158188, 0.1647059, 1, 0, 1,
-0.4855562, 0.2780783, -0.7294866, 0.1568628, 1, 0, 1,
-0.4805909, -0.9422333, -1.660405, 0.1529412, 1, 0, 1,
-0.4795703, 0.2575967, -0.2099268, 0.145098, 1, 0, 1,
-0.4748897, 1.254846, 0.1361599, 0.1411765, 1, 0, 1,
-0.4737121, -2.49394, -2.802937, 0.1333333, 1, 0, 1,
-0.4696266, -0.4881994, -2.312198, 0.1294118, 1, 0, 1,
-0.467975, -0.532833, -3.458906, 0.1215686, 1, 0, 1,
-0.461777, -1.575517, -3.608134, 0.1176471, 1, 0, 1,
-0.4586669, 0.3627291, 0.3783717, 0.1098039, 1, 0, 1,
-0.4580601, 0.8463931, -1.908964, 0.1058824, 1, 0, 1,
-0.4513373, -1.466146, -2.718769, 0.09803922, 1, 0, 1,
-0.4432086, -1.254269, -2.855944, 0.09019608, 1, 0, 1,
-0.436178, 1.716563, -2.092312, 0.08627451, 1, 0, 1,
-0.4348716, 0.04880176, -2.494395, 0.07843138, 1, 0, 1,
-0.4333584, -0.7496831, -1.288695, 0.07450981, 1, 0, 1,
-0.4293784, 0.6188172, -0.178261, 0.06666667, 1, 0, 1,
-0.4271513, 0.8194226, 0.1885302, 0.0627451, 1, 0, 1,
-0.4221916, -0.1708596, -2.509864, 0.05490196, 1, 0, 1,
-0.4206729, 1.110756, -0.9089984, 0.05098039, 1, 0, 1,
-0.4170942, -0.2971478, -3.064433, 0.04313726, 1, 0, 1,
-0.4118885, 0.7867262, 0.1024321, 0.03921569, 1, 0, 1,
-0.4047942, 0.6155987, 0.6142698, 0.03137255, 1, 0, 1,
-0.4041933, -0.8883563, -3.394105, 0.02745098, 1, 0, 1,
-0.4037651, 0.003438421, -2.094641, 0.01960784, 1, 0, 1,
-0.4033935, -1.345184, -2.773475, 0.01568628, 1, 0, 1,
-0.4027414, -0.5381454, 0.759085, 0.007843138, 1, 0, 1,
-0.40074, 0.7956106, -1.132751, 0.003921569, 1, 0, 1,
-0.3980735, -0.2829285, -2.429603, 0, 1, 0.003921569, 1,
-0.3973393, 0.922899, -3.18567, 0, 1, 0.01176471, 1,
-0.3919609, -0.2451336, -1.265551, 0, 1, 0.01568628, 1,
-0.3897456, 0.320871, -1.641889, 0, 1, 0.02352941, 1,
-0.3890059, 0.5247304, -1.263287, 0, 1, 0.02745098, 1,
-0.3846967, 0.7541746, -2.984495, 0, 1, 0.03529412, 1,
-0.3837561, -1.516491, -5.048802, 0, 1, 0.03921569, 1,
-0.3720331, 1.94002, 0.4601909, 0, 1, 0.04705882, 1,
-0.3704621, -1.111864, -3.8853, 0, 1, 0.05098039, 1,
-0.3697548, 1.651714, 1.488744, 0, 1, 0.05882353, 1,
-0.3648046, -0.9664366, -2.734092, 0, 1, 0.0627451, 1,
-0.3630261, -0.3405729, -0.5257393, 0, 1, 0.07058824, 1,
-0.3626586, 1.20471, 0.5541759, 0, 1, 0.07450981, 1,
-0.3621838, 0.7789018, 1.666075, 0, 1, 0.08235294, 1,
-0.3614408, 1.143186, 0.9493172, 0, 1, 0.08627451, 1,
-0.3553875, -1.325896, -2.361316, 0, 1, 0.09411765, 1,
-0.3547585, 0.2692188, -0.4762631, 0, 1, 0.1019608, 1,
-0.3541412, -0.2902579, -2.740447, 0, 1, 0.1058824, 1,
-0.353794, 1.140616, 1.026533, 0, 1, 0.1137255, 1,
-0.3519933, 0.2305492, -2.468305, 0, 1, 0.1176471, 1,
-0.3514908, -0.1188041, -2.529294, 0, 1, 0.1254902, 1,
-0.3455033, 1.683729, -0.8807262, 0, 1, 0.1294118, 1,
-0.3421579, -0.2621358, -1.145661, 0, 1, 0.1372549, 1,
-0.3420528, -0.2623612, -1.640758, 0, 1, 0.1411765, 1,
-0.3386191, -0.5754818, -2.989474, 0, 1, 0.1490196, 1,
-0.3373985, 0.5105369, -0.03056688, 0, 1, 0.1529412, 1,
-0.3368807, 0.5347969, 0.1847189, 0, 1, 0.1607843, 1,
-0.3265042, -1.008685, -0.153681, 0, 1, 0.1647059, 1,
-0.3259878, 0.8138331, 2.015728, 0, 1, 0.172549, 1,
-0.3203574, -0.8673673, -1.024886, 0, 1, 0.1764706, 1,
-0.3192846, 0.04432787, -2.694694, 0, 1, 0.1843137, 1,
-0.3192028, 0.7185742, -0.5486045, 0, 1, 0.1882353, 1,
-0.318922, 0.06342974, -1.975853, 0, 1, 0.1960784, 1,
-0.3166751, -0.4810539, -2.812167, 0, 1, 0.2039216, 1,
-0.3156158, -0.4106576, -1.999229, 0, 1, 0.2078431, 1,
-0.3154849, -0.02142982, -2.864676, 0, 1, 0.2156863, 1,
-0.3143348, 0.231159, -0.68264, 0, 1, 0.2196078, 1,
-0.3134971, 0.1346355, -1.138744, 0, 1, 0.227451, 1,
-0.3064203, -1.774686, -2.421489, 0, 1, 0.2313726, 1,
-0.3032273, -0.2730458, -1.784701, 0, 1, 0.2392157, 1,
-0.3029552, 0.856216, 1.017421, 0, 1, 0.2431373, 1,
-0.3028327, 0.3890994, -1.027202, 0, 1, 0.2509804, 1,
-0.3016041, 0.5986019, -0.4896861, 0, 1, 0.254902, 1,
-0.3002548, 1.121251, -3.311806, 0, 1, 0.2627451, 1,
-0.2971845, 0.07396019, -3.251311, 0, 1, 0.2666667, 1,
-0.2968451, -0.4914998, -0.1734478, 0, 1, 0.2745098, 1,
-0.2961698, 1.028832, -0.3351332, 0, 1, 0.2784314, 1,
-0.2908692, 1.425211, -2.120984, 0, 1, 0.2862745, 1,
-0.2876135, -1.763919, -3.676025, 0, 1, 0.2901961, 1,
-0.2857742, 0.9419969, -2.146523, 0, 1, 0.2980392, 1,
-0.2856895, 2.110402, 1.340116, 0, 1, 0.3058824, 1,
-0.2763475, 1.578945, 0.5892418, 0, 1, 0.3098039, 1,
-0.2761343, -0.6866311, -0.8043309, 0, 1, 0.3176471, 1,
-0.2661019, -1.556283, -2.105505, 0, 1, 0.3215686, 1,
-0.2659003, -0.3191055, -4.059852, 0, 1, 0.3294118, 1,
-0.2648581, 1.800403, 0.3411146, 0, 1, 0.3333333, 1,
-0.2592397, -0.6392593, -5.27189, 0, 1, 0.3411765, 1,
-0.2590753, -3.216059, -3.711204, 0, 1, 0.345098, 1,
-0.2546552, 0.4860431, -0.3391462, 0, 1, 0.3529412, 1,
-0.2495509, -0.5777285, -4.337224, 0, 1, 0.3568628, 1,
-0.2495211, 0.4443644, -0.005841479, 0, 1, 0.3647059, 1,
-0.2465466, 1.096651, -0.9347474, 0, 1, 0.3686275, 1,
-0.2453546, -0.4412836, -2.587253, 0, 1, 0.3764706, 1,
-0.2428895, -1.217885, -3.957264, 0, 1, 0.3803922, 1,
-0.2369438, -0.2031821, -1.363154, 0, 1, 0.3882353, 1,
-0.2320809, 0.4967091, -0.905813, 0, 1, 0.3921569, 1,
-0.2318209, -0.001472914, -0.8740035, 0, 1, 0.4, 1,
-0.2301262, -0.670292, -3.787656, 0, 1, 0.4078431, 1,
-0.2264685, -0.4953234, -3.38595, 0, 1, 0.4117647, 1,
-0.221888, -0.5119932, -1.438852, 0, 1, 0.4196078, 1,
-0.2158742, -0.7658272, -4.183475, 0, 1, 0.4235294, 1,
-0.2152156, -0.8676716, -2.981229, 0, 1, 0.4313726, 1,
-0.2137097, 0.2054407, -0.1688822, 0, 1, 0.4352941, 1,
-0.2133614, -0.4654125, -2.925655, 0, 1, 0.4431373, 1,
-0.2130972, -0.5177789, -3.060739, 0, 1, 0.4470588, 1,
-0.211819, -0.2436782, -1.451169, 0, 1, 0.454902, 1,
-0.2109097, 0.2869359, -0.8205589, 0, 1, 0.4588235, 1,
-0.2064, -1.919014, -1.541669, 0, 1, 0.4666667, 1,
-0.2040633, -0.009562573, 0.378698, 0, 1, 0.4705882, 1,
-0.198647, 0.6386961, -1.272624, 0, 1, 0.4784314, 1,
-0.198304, 0.1122658, -0.6536425, 0, 1, 0.4823529, 1,
-0.1973806, 0.6231825, -0.03188132, 0, 1, 0.4901961, 1,
-0.1916289, 1.116238, -1.002546, 0, 1, 0.4941176, 1,
-0.1825443, 1.802074, -0.6707976, 0, 1, 0.5019608, 1,
-0.1820764, 1.583066, 1.055453, 0, 1, 0.509804, 1,
-0.1706818, 0.8355011, -0.06147538, 0, 1, 0.5137255, 1,
-0.1688489, 0.7382318, -0.4731686, 0, 1, 0.5215687, 1,
-0.1664279, -0.6446555, -1.826483, 0, 1, 0.5254902, 1,
-0.1654015, 0.2600715, -0.8324892, 0, 1, 0.5333334, 1,
-0.1635155, -0.56335, -2.150303, 0, 1, 0.5372549, 1,
-0.1631694, 0.910598, -0.5890371, 0, 1, 0.5450981, 1,
-0.1601581, -1.601728, -4.199264, 0, 1, 0.5490196, 1,
-0.1582413, 0.7415699, 0.6029749, 0, 1, 0.5568628, 1,
-0.1524862, -0.5473889, -2.637642, 0, 1, 0.5607843, 1,
-0.1520526, 0.75058, -2.021834, 0, 1, 0.5686275, 1,
-0.1501593, -1.244795, -4.228014, 0, 1, 0.572549, 1,
-0.1495326, 0.05988201, -2.288934, 0, 1, 0.5803922, 1,
-0.1485452, 0.2991728, 1.675691, 0, 1, 0.5843138, 1,
-0.1466567, -0.4174165, -2.718347, 0, 1, 0.5921569, 1,
-0.1456574, 0.2797782, -0.5095001, 0, 1, 0.5960785, 1,
-0.1405673, -1.687419, -3.061449, 0, 1, 0.6039216, 1,
-0.1397434, -1.593164, -2.510125, 0, 1, 0.6117647, 1,
-0.1395369, 0.4560061, 0.6104356, 0, 1, 0.6156863, 1,
-0.1393811, 0.3013925, -0.2860505, 0, 1, 0.6235294, 1,
-0.1372699, -0.1125177, -3.161519, 0, 1, 0.627451, 1,
-0.1353622, 0.9549795, -0.02602391, 0, 1, 0.6352941, 1,
-0.1347273, -1.028688, -3.153317, 0, 1, 0.6392157, 1,
-0.1328312, 1.02778, -1.552811, 0, 1, 0.6470588, 1,
-0.1321005, -0.1100348, -1.463304, 0, 1, 0.6509804, 1,
-0.1259488, -0.5012434, -2.748208, 0, 1, 0.6588235, 1,
-0.120519, -0.3886034, -4.286862, 0, 1, 0.6627451, 1,
-0.1170586, 0.7011117, -0.8830274, 0, 1, 0.6705883, 1,
-0.1118351, -1.838365, -2.149316, 0, 1, 0.6745098, 1,
-0.10925, -1.562568, -3.940341, 0, 1, 0.682353, 1,
-0.103043, 0.4349905, -1.709249, 0, 1, 0.6862745, 1,
-0.1030303, 0.313551, 1.039706, 0, 1, 0.6941177, 1,
-0.1016231, 0.6293392, 0.7349163, 0, 1, 0.7019608, 1,
-0.09975172, -0.2631978, -1.627699, 0, 1, 0.7058824, 1,
-0.09597435, -1.2205, -6.059659, 0, 1, 0.7137255, 1,
-0.09562948, -0.181298, -2.557769, 0, 1, 0.7176471, 1,
-0.09506478, 0.3813638, -1.399674, 0, 1, 0.7254902, 1,
-0.09485551, 0.197956, -0.5482659, 0, 1, 0.7294118, 1,
-0.09007856, -0.7529266, -3.042527, 0, 1, 0.7372549, 1,
-0.08879348, -0.6852466, -2.916908, 0, 1, 0.7411765, 1,
-0.08164947, 0.82488, -0.01037125, 0, 1, 0.7490196, 1,
-0.08064731, -1.137624, -2.584429, 0, 1, 0.7529412, 1,
-0.07989118, 1.096869, 0.7820007, 0, 1, 0.7607843, 1,
-0.07838962, 0.7775179, 0.83411, 0, 1, 0.7647059, 1,
-0.07738969, -1.492823, -2.964908, 0, 1, 0.772549, 1,
-0.07635275, -1.438159, -4.128526, 0, 1, 0.7764706, 1,
-0.07535037, -0.6734766, -4.162143, 0, 1, 0.7843137, 1,
-0.07068142, -1.115101, -3.586003, 0, 1, 0.7882353, 1,
-0.06922624, -0.6787293, -3.487922, 0, 1, 0.7960784, 1,
-0.06700364, -0.8648312, -3.382442, 0, 1, 0.8039216, 1,
-0.06647276, -0.5435039, -5.395601, 0, 1, 0.8078431, 1,
-0.06553341, 0.03873889, -2.642402, 0, 1, 0.8156863, 1,
-0.06403141, 0.09151495, -1.373537, 0, 1, 0.8196079, 1,
-0.06388598, 0.2494146, -0.2346144, 0, 1, 0.827451, 1,
-0.059636, -1.465753, -2.512441, 0, 1, 0.8313726, 1,
-0.0585207, 0.1274023, 0.3903576, 0, 1, 0.8392157, 1,
-0.05533565, -0.1507793, -2.960126, 0, 1, 0.8431373, 1,
-0.05147014, -0.3468857, -2.664657, 0, 1, 0.8509804, 1,
-0.0514162, 0.08300855, -1.319507, 0, 1, 0.854902, 1,
-0.05127863, 1.09734, 0.8207228, 0, 1, 0.8627451, 1,
-0.05099666, 0.7772892, -0.4400426, 0, 1, 0.8666667, 1,
-0.04979639, 1.53031, 0.08074227, 0, 1, 0.8745098, 1,
-0.04916696, -0.3504905, -4.603903, 0, 1, 0.8784314, 1,
-0.04571727, 0.1956387, -0.5860769, 0, 1, 0.8862745, 1,
-0.04381422, 1.281847, 0.406, 0, 1, 0.8901961, 1,
-0.03752938, 1.805027, -0.3463701, 0, 1, 0.8980392, 1,
-0.03333189, -1.689386, -2.569942, 0, 1, 0.9058824, 1,
-0.02917245, -1.293241, -2.716769, 0, 1, 0.9098039, 1,
-0.02764696, -0.167663, -4.315258, 0, 1, 0.9176471, 1,
-0.02607772, 1.179617, 1.15512, 0, 1, 0.9215686, 1,
-0.02113447, 0.06556108, -1.044547, 0, 1, 0.9294118, 1,
-0.01832825, -0.7428359, -3.294547, 0, 1, 0.9333333, 1,
-0.01557189, -0.2910393, -2.780221, 0, 1, 0.9411765, 1,
-0.01209627, -0.7474105, -3.476199, 0, 1, 0.945098, 1,
-0.009159267, -0.716007, -2.428569, 0, 1, 0.9529412, 1,
-0.00856364, -1.120716, -3.074093, 0, 1, 0.9568627, 1,
-0.007092616, -0.3937344, -1.823763, 0, 1, 0.9647059, 1,
-0.004925611, 0.02535963, 0.9109097, 0, 1, 0.9686275, 1,
-0.003119151, 0.4455747, -1.358563, 0, 1, 0.9764706, 1,
-0.001595862, 0.6031207, 0.5501592, 0, 1, 0.9803922, 1,
0.004599869, -0.3048779, 2.219533, 0, 1, 0.9882353, 1,
0.01095893, 0.05973215, 1.674431, 0, 1, 0.9921569, 1,
0.0116932, -2.040808, 2.215291, 0, 1, 1, 1,
0.01220133, -0.6277972, 2.642381, 0, 0.9921569, 1, 1,
0.01366563, 0.1783728, -1.095131, 0, 0.9882353, 1, 1,
0.01726743, 2.06179, 1.001709, 0, 0.9803922, 1, 1,
0.01733935, -1.492524, 1.961907, 0, 0.9764706, 1, 1,
0.01973421, 2.258233, -0.2465122, 0, 0.9686275, 1, 1,
0.02218608, -0.6396697, 2.351009, 0, 0.9647059, 1, 1,
0.02250507, -0.2219395, 3.740284, 0, 0.9568627, 1, 1,
0.0229974, 0.5890567, -0.3551369, 0, 0.9529412, 1, 1,
0.02315699, 0.5059985, 0.9591177, 0, 0.945098, 1, 1,
0.02571579, 0.3539872, 1.097862, 0, 0.9411765, 1, 1,
0.02679854, -0.3402693, 4.304523, 0, 0.9333333, 1, 1,
0.02721559, -0.1937553, 2.554471, 0, 0.9294118, 1, 1,
0.0273213, -0.2745314, 1.812165, 0, 0.9215686, 1, 1,
0.03402746, -0.2041384, 4.274336, 0, 0.9176471, 1, 1,
0.03504273, 0.0493633, 1.552076, 0, 0.9098039, 1, 1,
0.04093737, -1.604401, 2.649916, 0, 0.9058824, 1, 1,
0.04139875, -0.4491583, 3.230964, 0, 0.8980392, 1, 1,
0.04246655, -0.6179063, 3.896695, 0, 0.8901961, 1, 1,
0.04316352, -0.4587378, 2.525462, 0, 0.8862745, 1, 1,
0.04394979, -1.600913, 2.510364, 0, 0.8784314, 1, 1,
0.04426555, 0.5689608, -0.1845021, 0, 0.8745098, 1, 1,
0.045124, 1.016479, 1.740555, 0, 0.8666667, 1, 1,
0.04564736, -0.8585312, 4.383255, 0, 0.8627451, 1, 1,
0.04843488, 1.449923, -0.9103656, 0, 0.854902, 1, 1,
0.05596488, -2.025421, 4.331091, 0, 0.8509804, 1, 1,
0.05856198, -0.8587986, 4.64755, 0, 0.8431373, 1, 1,
0.05876946, 0.7446993, -0.008614586, 0, 0.8392157, 1, 1,
0.0624436, 3.442287, 0.2624128, 0, 0.8313726, 1, 1,
0.06348863, 0.2229661, 0.6556655, 0, 0.827451, 1, 1,
0.06498095, -0.8246194, 3.218695, 0, 0.8196079, 1, 1,
0.06502292, -0.9494774, 3.062118, 0, 0.8156863, 1, 1,
0.06514461, -0.05908944, 3.257577, 0, 0.8078431, 1, 1,
0.06595065, -1.647858, 2.583621, 0, 0.8039216, 1, 1,
0.06756324, -0.6839795, 4.128508, 0, 0.7960784, 1, 1,
0.06829959, 1.786122, 1.742275, 0, 0.7882353, 1, 1,
0.07612684, 0.2943025, 1.470163, 0, 0.7843137, 1, 1,
0.07799184, -0.4054297, 4.0708, 0, 0.7764706, 1, 1,
0.08087612, -0.5099165, 2.336469, 0, 0.772549, 1, 1,
0.08195134, 1.402919, -1.596766, 0, 0.7647059, 1, 1,
0.08532492, -0.1891737, 3.024302, 0, 0.7607843, 1, 1,
0.08551846, -1.552389, 3.551728, 0, 0.7529412, 1, 1,
0.08833608, 0.2347919, 0.9420637, 0, 0.7490196, 1, 1,
0.09002712, 1.50636, -0.9260873, 0, 0.7411765, 1, 1,
0.09289332, 0.2790992, -0.724126, 0, 0.7372549, 1, 1,
0.1010711, -0.01099565, 1.241233, 0, 0.7294118, 1, 1,
0.1021867, -0.7724519, 2.717677, 0, 0.7254902, 1, 1,
0.10499, -0.8729013, 3.200608, 0, 0.7176471, 1, 1,
0.1093613, 0.7902293, 1.272066, 0, 0.7137255, 1, 1,
0.1131607, -1.009591, 3.022189, 0, 0.7058824, 1, 1,
0.1139782, 0.5783096, -0.1407124, 0, 0.6980392, 1, 1,
0.1152292, -2.662937, 3.190459, 0, 0.6941177, 1, 1,
0.116883, -1.483918, 1.015366, 0, 0.6862745, 1, 1,
0.1174921, 0.8251008, -0.0882414, 0, 0.682353, 1, 1,
0.1201682, -0.9821996, 2.086213, 0, 0.6745098, 1, 1,
0.1205193, -0.5038395, 2.180565, 0, 0.6705883, 1, 1,
0.1225008, -0.919382, 2.355926, 0, 0.6627451, 1, 1,
0.1228689, -2.00038, 5.848403, 0, 0.6588235, 1, 1,
0.1239886, -0.2403138, 2.440972, 0, 0.6509804, 1, 1,
0.12521, 0.9848216, 0.1163454, 0, 0.6470588, 1, 1,
0.1440507, -0.9014903, 2.59438, 0, 0.6392157, 1, 1,
0.1442083, -0.9528258, 1.119193, 0, 0.6352941, 1, 1,
0.1457346, -0.4532328, 3.629846, 0, 0.627451, 1, 1,
0.1463395, 1.798157, 1.495029, 0, 0.6235294, 1, 1,
0.146698, 1.084285, 1.4932, 0, 0.6156863, 1, 1,
0.1505421, 0.2956341, -1.947421, 0, 0.6117647, 1, 1,
0.1513029, -2.755896, 4.024412, 0, 0.6039216, 1, 1,
0.1521935, 0.9183632, 1.016002, 0, 0.5960785, 1, 1,
0.1536732, -0.6476855, 3.676464, 0, 0.5921569, 1, 1,
0.1564493, 1.355767, -0.7916355, 0, 0.5843138, 1, 1,
0.1574642, -0.1954852, 0.07115231, 0, 0.5803922, 1, 1,
0.1585578, -1.357534, 2.982498, 0, 0.572549, 1, 1,
0.1586215, -0.9172409, 3.206648, 0, 0.5686275, 1, 1,
0.1599107, 0.3663036, 1.157252, 0, 0.5607843, 1, 1,
0.1602089, 1.609298, 1.471523, 0, 0.5568628, 1, 1,
0.1615375, 0.9984481, 0.3368791, 0, 0.5490196, 1, 1,
0.16186, 0.1371055, 0.7261895, 0, 0.5450981, 1, 1,
0.1638233, 0.211186, -0.4335384, 0, 0.5372549, 1, 1,
0.1666546, -1.159449, 3.209658, 0, 0.5333334, 1, 1,
0.1667129, -0.6827086, 4.209529, 0, 0.5254902, 1, 1,
0.1685862, 0.6712756, 1.167943, 0, 0.5215687, 1, 1,
0.1714157, -0.8085618, 0.6220828, 0, 0.5137255, 1, 1,
0.1719362, 0.8431404, 0.04878144, 0, 0.509804, 1, 1,
0.1732663, 0.8436833, 0.2147202, 0, 0.5019608, 1, 1,
0.1740016, 0.6978543, 1.021604, 0, 0.4941176, 1, 1,
0.1746117, 0.8961586, 0.3323816, 0, 0.4901961, 1, 1,
0.1804784, -0.9797381, 2.787829, 0, 0.4823529, 1, 1,
0.1830669, -0.3820187, 3.42013, 0, 0.4784314, 1, 1,
0.1886665, 0.1325404, 0.8581337, 0, 0.4705882, 1, 1,
0.1988284, 0.1883205, -0.2571865, 0, 0.4666667, 1, 1,
0.2044104, -0.7473255, 1.066195, 0, 0.4588235, 1, 1,
0.2052414, 2.409209, 1.153779, 0, 0.454902, 1, 1,
0.2061242, 0.7384585, -0.06696934, 0, 0.4470588, 1, 1,
0.2079887, 0.03218066, 1.815195, 0, 0.4431373, 1, 1,
0.2109152, -0.09071651, 1.651613, 0, 0.4352941, 1, 1,
0.2124661, -0.6232149, 3.264678, 0, 0.4313726, 1, 1,
0.2132466, -0.3143148, 1.202734, 0, 0.4235294, 1, 1,
0.2177429, -0.8148571, 3.185613, 0, 0.4196078, 1, 1,
0.2201299, -0.6679257, 3.463928, 0, 0.4117647, 1, 1,
0.2211484, 1.458248, -0.5020966, 0, 0.4078431, 1, 1,
0.2217026, -1.387864, 4.253368, 0, 0.4, 1, 1,
0.2232544, -1.667713, 3.380563, 0, 0.3921569, 1, 1,
0.2236867, 0.544454, 1.229588, 0, 0.3882353, 1, 1,
0.2296916, 0.06517451, 2.514521, 0, 0.3803922, 1, 1,
0.2307123, -0.6363603, 3.641599, 0, 0.3764706, 1, 1,
0.233989, -0.5406737, 1.500716, 0, 0.3686275, 1, 1,
0.2350657, 0.5057866, 2.506517, 0, 0.3647059, 1, 1,
0.2353991, 0.4721809, -0.01908258, 0, 0.3568628, 1, 1,
0.2387917, -0.707579, 0.9632882, 0, 0.3529412, 1, 1,
0.2394694, -1.813861, 3.863962, 0, 0.345098, 1, 1,
0.2517557, 1.02059, -0.728555, 0, 0.3411765, 1, 1,
0.2518854, -2.148315, 3.912148, 0, 0.3333333, 1, 1,
0.2548717, 0.199132, 1.067307, 0, 0.3294118, 1, 1,
0.2563943, -2.235354, 3.814816, 0, 0.3215686, 1, 1,
0.2564728, -0.5824654, 2.530073, 0, 0.3176471, 1, 1,
0.2644485, 1.177505, 1.046221, 0, 0.3098039, 1, 1,
0.2658733, 1.237077, 0.3665022, 0, 0.3058824, 1, 1,
0.2662157, -0.1100562, 2.352242, 0, 0.2980392, 1, 1,
0.2733335, -0.539674, 3.9803, 0, 0.2901961, 1, 1,
0.273396, -0.5101064, 2.550969, 0, 0.2862745, 1, 1,
0.2749957, 0.08986716, 1.132635, 0, 0.2784314, 1, 1,
0.283148, -0.5330047, 2.09529, 0, 0.2745098, 1, 1,
0.2886306, -0.7000245, 3.336351, 0, 0.2666667, 1, 1,
0.2893457, -0.03967358, 1.903754, 0, 0.2627451, 1, 1,
0.2925065, 0.2355518, 1.299124, 0, 0.254902, 1, 1,
0.2948809, 1.013035, 1.094734, 0, 0.2509804, 1, 1,
0.3018849, 0.230445, 0.3265122, 0, 0.2431373, 1, 1,
0.3047068, -1.314718, 3.601153, 0, 0.2392157, 1, 1,
0.3071571, 0.5785464, 1.120185, 0, 0.2313726, 1, 1,
0.3073491, 0.2203963, 2.453366, 0, 0.227451, 1, 1,
0.3074854, 0.3722183, -0.8329547, 0, 0.2196078, 1, 1,
0.3111211, 1.849476, 0.83939, 0, 0.2156863, 1, 1,
0.3227184, 0.3160654, 2.667313, 0, 0.2078431, 1, 1,
0.328398, 0.270667, 2.334174, 0, 0.2039216, 1, 1,
0.3343481, -0.8448586, 4.9878, 0, 0.1960784, 1, 1,
0.3378863, 0.9405344, 0.8031435, 0, 0.1882353, 1, 1,
0.3384086, 0.7921606, 2.021814, 0, 0.1843137, 1, 1,
0.3396024, -0.5368288, 2.005202, 0, 0.1764706, 1, 1,
0.3409841, 1.212704, 0.08453708, 0, 0.172549, 1, 1,
0.3424285, -1.913367, 0.6957296, 0, 0.1647059, 1, 1,
0.3506069, 0.04774557, 0.5322227, 0, 0.1607843, 1, 1,
0.3512437, 0.9863108, -0.1730643, 0, 0.1529412, 1, 1,
0.3520523, -0.2738896, 3.883379, 0, 0.1490196, 1, 1,
0.3537992, 0.3450156, 0.4585575, 0, 0.1411765, 1, 1,
0.3546588, -0.3600425, 1.377471, 0, 0.1372549, 1, 1,
0.3581023, 0.9590033, 0.4659091, 0, 0.1294118, 1, 1,
0.3583937, 0.4240358, 0.4587109, 0, 0.1254902, 1, 1,
0.3599854, 0.6387982, 1.930204, 0, 0.1176471, 1, 1,
0.3616498, -0.6339214, 3.186661, 0, 0.1137255, 1, 1,
0.362265, 2.613552, 0.8419372, 0, 0.1058824, 1, 1,
0.3804073, 0.7082218, 2.372427, 0, 0.09803922, 1, 1,
0.3833882, -0.2239423, 3.465785, 0, 0.09411765, 1, 1,
0.3887377, -0.08128709, -0.8172118, 0, 0.08627451, 1, 1,
0.3903157, -0.00338801, 0.8364702, 0, 0.08235294, 1, 1,
0.3917027, -1.29958, 2.038143, 0, 0.07450981, 1, 1,
0.3950358, 2.495457, -0.3266504, 0, 0.07058824, 1, 1,
0.3982988, 1.461848, 0.4476414, 0, 0.0627451, 1, 1,
0.3999497, -1.188693, 1.945988, 0, 0.05882353, 1, 1,
0.4000358, 0.5929177, 1.561665, 0, 0.05098039, 1, 1,
0.402158, 1.27179, 1.43108, 0, 0.04705882, 1, 1,
0.4059825, -0.7515226, 1.355358, 0, 0.03921569, 1, 1,
0.4060516, 0.7128219, 2.106494, 0, 0.03529412, 1, 1,
0.4076696, -0.1669238, 0.3758599, 0, 0.02745098, 1, 1,
0.4120237, -0.4539104, 0.2534707, 0, 0.02352941, 1, 1,
0.4132764, 3.076402, 0.08447598, 0, 0.01568628, 1, 1,
0.4154342, 1.212554, -1.043457, 0, 0.01176471, 1, 1,
0.4191222, 0.1275184, 1.795194, 0, 0.003921569, 1, 1,
0.42238, -0.2104739, 0.8560442, 0.003921569, 0, 1, 1,
0.4234535, 1.439312, -1.026998, 0.007843138, 0, 1, 1,
0.4236655, -1.123365, 2.68888, 0.01568628, 0, 1, 1,
0.4262637, 1.352178, -0.005943572, 0.01960784, 0, 1, 1,
0.4270085, -1.201009, 3.418339, 0.02745098, 0, 1, 1,
0.4312591, -0.4005473, 1.649598, 0.03137255, 0, 1, 1,
0.4361795, 0.4242686, 1.973654, 0.03921569, 0, 1, 1,
0.4407718, 1.992957, -0.01038542, 0.04313726, 0, 1, 1,
0.4414718, -0.8284318, 3.972477, 0.05098039, 0, 1, 1,
0.4464169, 0.5146327, 3.429626, 0.05490196, 0, 1, 1,
0.4469082, 0.7098196, 2.005646, 0.0627451, 0, 1, 1,
0.4492979, -0.6729009, 1.953907, 0.06666667, 0, 1, 1,
0.4494873, 1.139431, -0.7257369, 0.07450981, 0, 1, 1,
0.4513989, 0.3723671, 1.626075, 0.07843138, 0, 1, 1,
0.4520167, -1.572679, 2.845503, 0.08627451, 0, 1, 1,
0.4557103, -1.725864, 3.674215, 0.09019608, 0, 1, 1,
0.4582263, -1.106474, 1.576627, 0.09803922, 0, 1, 1,
0.4639457, -0.513792, 3.964482, 0.1058824, 0, 1, 1,
0.4674708, -0.01285262, 2.382085, 0.1098039, 0, 1, 1,
0.4707425, 0.2620746, 3.024731, 0.1176471, 0, 1, 1,
0.4716888, -0.6157187, 2.877672, 0.1215686, 0, 1, 1,
0.472391, -0.6059536, 2.088501, 0.1294118, 0, 1, 1,
0.4734452, 0.4143836, -0.7281132, 0.1333333, 0, 1, 1,
0.4753212, -0.4486983, 3.037219, 0.1411765, 0, 1, 1,
0.4756896, 0.8484112, 0.08616062, 0.145098, 0, 1, 1,
0.4760909, 0.4299078, 3.235856, 0.1529412, 0, 1, 1,
0.4782155, -0.4735872, 2.137624, 0.1568628, 0, 1, 1,
0.4806957, 1.344933, 0.3722827, 0.1647059, 0, 1, 1,
0.4841392, -1.319513, 3.032253, 0.1686275, 0, 1, 1,
0.4874673, -0.1742263, 1.161182, 0.1764706, 0, 1, 1,
0.4880224, -0.8975896, 2.115891, 0.1803922, 0, 1, 1,
0.4921854, -0.1349015, 0.6830534, 0.1882353, 0, 1, 1,
0.4932996, -0.5166096, 2.174024, 0.1921569, 0, 1, 1,
0.4943489, 1.080261, 0.7014148, 0.2, 0, 1, 1,
0.4946597, 0.9010152, -0.4618067, 0.2078431, 0, 1, 1,
0.4963212, -0.5495778, 4.682811, 0.2117647, 0, 1, 1,
0.5018778, -0.1436422, 2.001274, 0.2196078, 0, 1, 1,
0.5020303, 0.6055998, 1.284344, 0.2235294, 0, 1, 1,
0.5023586, 1.136325, 0.1353288, 0.2313726, 0, 1, 1,
0.5114447, -0.9561546, 3.315385, 0.2352941, 0, 1, 1,
0.51239, -0.0914835, 0.8329927, 0.2431373, 0, 1, 1,
0.5152588, -1.357019, 3.289459, 0.2470588, 0, 1, 1,
0.5162312, 0.474825, 1.127877, 0.254902, 0, 1, 1,
0.5186931, -2.179343, 4.167918, 0.2588235, 0, 1, 1,
0.5198489, 1.643196, -1.257157, 0.2666667, 0, 1, 1,
0.5210492, -2.199172, 3.7318, 0.2705882, 0, 1, 1,
0.521888, -0.6088187, 3.650168, 0.2784314, 0, 1, 1,
0.5232895, -0.8921795, 3.597854, 0.282353, 0, 1, 1,
0.5258893, 0.4177232, 2.128947, 0.2901961, 0, 1, 1,
0.5305648, 0.3277848, 0.9943266, 0.2941177, 0, 1, 1,
0.5323368, -1.586601, 2.271488, 0.3019608, 0, 1, 1,
0.5324523, -0.512223, 4.508049, 0.3098039, 0, 1, 1,
0.5334453, 0.2106979, 0.6290708, 0.3137255, 0, 1, 1,
0.5349383, 0.8915365, -0.1955613, 0.3215686, 0, 1, 1,
0.5438834, 0.02252783, 1.402386, 0.3254902, 0, 1, 1,
0.5511824, 1.283504, 1.563036, 0.3333333, 0, 1, 1,
0.5554361, -0.2203435, 2.210562, 0.3372549, 0, 1, 1,
0.5568619, -1.397937, 1.885555, 0.345098, 0, 1, 1,
0.5620184, -0.3823663, 1.749917, 0.3490196, 0, 1, 1,
0.5660633, 1.713692, -0.8457448, 0.3568628, 0, 1, 1,
0.5680943, 0.5935179, 1.124333, 0.3607843, 0, 1, 1,
0.5701421, 1.206347, 1.052073, 0.3686275, 0, 1, 1,
0.5710078, 1.149018, -0.0594703, 0.372549, 0, 1, 1,
0.571444, 0.6696206, 1.61842, 0.3803922, 0, 1, 1,
0.5717049, 0.9687026, 0.4789671, 0.3843137, 0, 1, 1,
0.5731695, 1.204227, 0.5282158, 0.3921569, 0, 1, 1,
0.574204, 0.7071139, -0.4400446, 0.3960784, 0, 1, 1,
0.575493, 0.9485137, 1.365014, 0.4039216, 0, 1, 1,
0.5767354, -0.8009021, 3.61854, 0.4117647, 0, 1, 1,
0.5787385, -0.2514883, 3.350831, 0.4156863, 0, 1, 1,
0.5831969, 0.4269035, 0.6124792, 0.4235294, 0, 1, 1,
0.5843678, 1.238495, 0.5340012, 0.427451, 0, 1, 1,
0.5850101, -0.9256878, 2.703534, 0.4352941, 0, 1, 1,
0.5906609, -1.100384, 3.007188, 0.4392157, 0, 1, 1,
0.5972599, -0.8030964, 1.665279, 0.4470588, 0, 1, 1,
0.600212, 0.1720689, -0.5292696, 0.4509804, 0, 1, 1,
0.6029438, 0.710458, -0.9745203, 0.4588235, 0, 1, 1,
0.6057498, 0.1877946, 3.02382, 0.4627451, 0, 1, 1,
0.6121389, 0.3168525, -0.2663396, 0.4705882, 0, 1, 1,
0.6145068, -2.227855, 2.787567, 0.4745098, 0, 1, 1,
0.6146435, 0.6527044, 1.330967, 0.4823529, 0, 1, 1,
0.6161081, 2.038496, -1.889317, 0.4862745, 0, 1, 1,
0.6174829, -0.5266863, 4.869282, 0.4941176, 0, 1, 1,
0.6197713, -0.7901589, 3.282096, 0.5019608, 0, 1, 1,
0.6209692, -0.2134465, 1.169623, 0.5058824, 0, 1, 1,
0.6276529, 0.5448232, 1.270589, 0.5137255, 0, 1, 1,
0.6325937, 1.391014, -1.977234, 0.5176471, 0, 1, 1,
0.6352177, -0.6238767, 3.167979, 0.5254902, 0, 1, 1,
0.6427618, -0.2647543, 0.1823473, 0.5294118, 0, 1, 1,
0.6461707, 0.5918842, 0.440062, 0.5372549, 0, 1, 1,
0.6519471, -1.270168, 2.3504, 0.5411765, 0, 1, 1,
0.6553995, -1.183426, 2.121419, 0.5490196, 0, 1, 1,
0.6577822, -0.2843518, 2.76013, 0.5529412, 0, 1, 1,
0.6624229, 0.915796, 0.7113212, 0.5607843, 0, 1, 1,
0.6646094, 0.009720226, 0.2433097, 0.5647059, 0, 1, 1,
0.6662351, -1.9366, 3.381947, 0.572549, 0, 1, 1,
0.6691973, 0.9858243, 1.303586, 0.5764706, 0, 1, 1,
0.6699305, 0.8852723, -1.200793, 0.5843138, 0, 1, 1,
0.6728888, -0.2905444, 0.1408027, 0.5882353, 0, 1, 1,
0.6751489, -0.4252496, 3.523476, 0.5960785, 0, 1, 1,
0.6755051, 0.6465469, 0.02058088, 0.6039216, 0, 1, 1,
0.6780997, -0.3817057, 2.18929, 0.6078432, 0, 1, 1,
0.682601, 0.4506641, 0.1862422, 0.6156863, 0, 1, 1,
0.6852635, 0.5383158, 1.824962, 0.6196079, 0, 1, 1,
0.6890357, 1.384763, -0.01922447, 0.627451, 0, 1, 1,
0.6942959, -1.178643, 3.526672, 0.6313726, 0, 1, 1,
0.6994002, -1.339512, 1.57012, 0.6392157, 0, 1, 1,
0.7033491, -1.422113, 0.3101216, 0.6431373, 0, 1, 1,
0.7037632, -0.05953979, 3.958144, 0.6509804, 0, 1, 1,
0.7043061, -1.998754, 1.716258, 0.654902, 0, 1, 1,
0.7045758, -1.671888, 2.581571, 0.6627451, 0, 1, 1,
0.7051908, -0.09056567, 4.423606, 0.6666667, 0, 1, 1,
0.717649, -1.136745, 4.022733, 0.6745098, 0, 1, 1,
0.7220334, 0.3998953, -0.7252028, 0.6784314, 0, 1, 1,
0.724353, -0.302527, 2.253106, 0.6862745, 0, 1, 1,
0.7264183, 1.295039, 0.5950196, 0.6901961, 0, 1, 1,
0.732115, -0.8559712, 4.70483, 0.6980392, 0, 1, 1,
0.73585, 0.1610333, -0.7931924, 0.7058824, 0, 1, 1,
0.7396445, 1.161932, 0.007210173, 0.7098039, 0, 1, 1,
0.7396988, -0.2688565, 0.5217913, 0.7176471, 0, 1, 1,
0.7408218, 0.456127, 1.971414, 0.7215686, 0, 1, 1,
0.7414098, 1.301947, 0.06459174, 0.7294118, 0, 1, 1,
0.7468951, -0.3322313, 1.668215, 0.7333333, 0, 1, 1,
0.7476919, 0.6351832, 1.440353, 0.7411765, 0, 1, 1,
0.7638207, -0.01867909, 1.114902, 0.7450981, 0, 1, 1,
0.7688708, -0.6287464, 2.207253, 0.7529412, 0, 1, 1,
0.774973, 1.413441, -0.3868377, 0.7568628, 0, 1, 1,
0.7775391, 0.8742898, 0.8027004, 0.7647059, 0, 1, 1,
0.7799937, -0.4666179, 1.07095, 0.7686275, 0, 1, 1,
0.7836931, -0.08984735, 3.513668, 0.7764706, 0, 1, 1,
0.7857556, -0.1306107, 3.104181, 0.7803922, 0, 1, 1,
0.7992643, -1.000958, 1.756404, 0.7882353, 0, 1, 1,
0.8005437, 1.262541, -1.670097, 0.7921569, 0, 1, 1,
0.811875, 2.257418, 0.4196413, 0.8, 0, 1, 1,
0.8175182, 0.9336572, 0.4465138, 0.8078431, 0, 1, 1,
0.8219813, -0.6226728, 2.652167, 0.8117647, 0, 1, 1,
0.8253674, 0.7266437, 0.649873, 0.8196079, 0, 1, 1,
0.826008, -0.07918922, 0.6910194, 0.8235294, 0, 1, 1,
0.8372616, 1.033827, 1.271332, 0.8313726, 0, 1, 1,
0.8451664, 0.1584539, -0.07104069, 0.8352941, 0, 1, 1,
0.8463527, -0.7464088, 2.329947, 0.8431373, 0, 1, 1,
0.8513055, 0.5763589, -1.251703, 0.8470588, 0, 1, 1,
0.8545383, 1.705344, -0.006500971, 0.854902, 0, 1, 1,
0.8574667, -0.0676021, 1.825457, 0.8588235, 0, 1, 1,
0.8582856, -0.8381666, 2.052854, 0.8666667, 0, 1, 1,
0.8610406, 1.126356, -1.973644, 0.8705882, 0, 1, 1,
0.8621513, -1.467206, 3.957932, 0.8784314, 0, 1, 1,
0.8735573, -0.1759687, 1.661072, 0.8823529, 0, 1, 1,
0.8782379, 0.4211326, 2.007445, 0.8901961, 0, 1, 1,
0.8862602, -0.06443914, 1.450072, 0.8941177, 0, 1, 1,
0.8869612, 2.599406, -0.07688738, 0.9019608, 0, 1, 1,
0.8875017, -1.786313, 2.522379, 0.9098039, 0, 1, 1,
0.8972575, 0.867542, 1.347249, 0.9137255, 0, 1, 1,
0.9039404, 0.2127487, 2.16403, 0.9215686, 0, 1, 1,
0.9044327, -0.3041313, 2.097199, 0.9254902, 0, 1, 1,
0.9062039, -0.8633161, 3.180574, 0.9333333, 0, 1, 1,
0.909734, 0.8365635, 1.418943, 0.9372549, 0, 1, 1,
0.9132295, -0.3203923, 2.072855, 0.945098, 0, 1, 1,
0.9140535, 0.7763037, 1.109414, 0.9490196, 0, 1, 1,
0.9212455, -0.5855618, 1.281628, 0.9568627, 0, 1, 1,
0.9275063, 0.6890696, 0.7861739, 0.9607843, 0, 1, 1,
0.9318601, -0.2626531, 1.911612, 0.9686275, 0, 1, 1,
0.9343594, 1.960647, 0.6591664, 0.972549, 0, 1, 1,
0.9349183, -0.313587, 2.219181, 0.9803922, 0, 1, 1,
0.9368333, 1.773206, 1.113415, 0.9843137, 0, 1, 1,
0.9444005, 1.297207, 0.9078283, 0.9921569, 0, 1, 1,
0.955108, -0.6255442, 0.841883, 0.9960784, 0, 1, 1,
0.9555883, 0.454008, 1.543345, 1, 0, 0.9960784, 1,
0.9634519, -0.7672856, 2.591981, 1, 0, 0.9882353, 1,
0.9651438, 1.429557, 1.476646, 1, 0, 0.9843137, 1,
0.9726905, -0.1377349, 1.275162, 1, 0, 0.9764706, 1,
0.9750945, 0.7957754, -0.05431196, 1, 0, 0.972549, 1,
0.9766985, 0.2248745, 1.403479, 1, 0, 0.9647059, 1,
0.9806672, 0.7048927, 1.443903, 1, 0, 0.9607843, 1,
0.985954, -0.8666283, 2.610379, 1, 0, 0.9529412, 1,
0.986651, 0.06279431, -0.3672318, 1, 0, 0.9490196, 1,
0.9904245, -0.6447002, 1.456194, 1, 0, 0.9411765, 1,
0.9969572, 0.9332946, -0.3484542, 1, 0, 0.9372549, 1,
0.9980119, 0.8859367, 2.257998, 1, 0, 0.9294118, 1,
1.000083, -0.9997327, 3.238866, 1, 0, 0.9254902, 1,
1.002149, 0.162701, 0.6777669, 1, 0, 0.9176471, 1,
1.011082, 0.09248347, 2.109709, 1, 0, 0.9137255, 1,
1.012489, 0.825204, 1.132861, 1, 0, 0.9058824, 1,
1.015295, 1.100176, -0.2535253, 1, 0, 0.9019608, 1,
1.015537, -0.6722531, 4.342606, 1, 0, 0.8941177, 1,
1.01824, -2.019021, 2.958077, 1, 0, 0.8862745, 1,
1.021004, -0.1546917, 0.9647616, 1, 0, 0.8823529, 1,
1.036533, 0.5110641, 1.607506, 1, 0, 0.8745098, 1,
1.050194, -0.6920947, 3.1443, 1, 0, 0.8705882, 1,
1.057698, 0.9696144, 2.514296, 1, 0, 0.8627451, 1,
1.061659, -1.109835, 3.538685, 1, 0, 0.8588235, 1,
1.062155, -0.179881, 0.2617464, 1, 0, 0.8509804, 1,
1.069037, -0.4828364, 0.9892808, 1, 0, 0.8470588, 1,
1.074556, 0.1965441, 1.702218, 1, 0, 0.8392157, 1,
1.075073, 0.4725205, 2.068449, 1, 0, 0.8352941, 1,
1.077352, 0.6354595, 0.9060018, 1, 0, 0.827451, 1,
1.079308, 1.129863, 0.7973101, 1, 0, 0.8235294, 1,
1.080523, -0.8719149, 3.654531, 1, 0, 0.8156863, 1,
1.086504, 0.7549015, -0.7756494, 1, 0, 0.8117647, 1,
1.086714, 0.5292982, 1.939787, 1, 0, 0.8039216, 1,
1.102399, 0.1783645, 1.494178, 1, 0, 0.7960784, 1,
1.109073, 1.652885, -0.06023585, 1, 0, 0.7921569, 1,
1.112215, 0.1655788, 1.008852, 1, 0, 0.7843137, 1,
1.114366, 1.078767, 1.300278, 1, 0, 0.7803922, 1,
1.115113, -0.6988752, 1.723417, 1, 0, 0.772549, 1,
1.116119, 0.2963797, 1.389362, 1, 0, 0.7686275, 1,
1.116214, 1.460687, -0.6959599, 1, 0, 0.7607843, 1,
1.116618, -0.3035221, 0.410097, 1, 0, 0.7568628, 1,
1.117872, 1.040909, -0.5485591, 1, 0, 0.7490196, 1,
1.120981, 0.9754185, 1.803773, 1, 0, 0.7450981, 1,
1.122387, 0.6306244, 0.989195, 1, 0, 0.7372549, 1,
1.134709, 1.262825, 0.6805036, 1, 0, 0.7333333, 1,
1.135391, -1.360675, 4.29057, 1, 0, 0.7254902, 1,
1.136574, -0.4779249, 0.7337142, 1, 0, 0.7215686, 1,
1.141711, 1.549901, 1.329959, 1, 0, 0.7137255, 1,
1.144233, 0.1472038, 1.271796, 1, 0, 0.7098039, 1,
1.146259, 1.493642, 0.7698879, 1, 0, 0.7019608, 1,
1.147899, -1.008183, 0.1286368, 1, 0, 0.6941177, 1,
1.148602, -0.4556439, 1.957373, 1, 0, 0.6901961, 1,
1.150715, 0.01856566, 0.8491419, 1, 0, 0.682353, 1,
1.157045, -0.3991131, 2.736291, 1, 0, 0.6784314, 1,
1.159058, 0.4599324, 0.727147, 1, 0, 0.6705883, 1,
1.159879, -0.5274288, 1.779299, 1, 0, 0.6666667, 1,
1.161807, 0.8547273, 1.278766, 1, 0, 0.6588235, 1,
1.170726, -1.045372, 2.105929, 1, 0, 0.654902, 1,
1.174208, 1.329894, -1.023029, 1, 0, 0.6470588, 1,
1.183957, 0.1622441, 0.3014383, 1, 0, 0.6431373, 1,
1.193676, -0.8058189, 3.49524, 1, 0, 0.6352941, 1,
1.202832, -0.01176803, 0.9251904, 1, 0, 0.6313726, 1,
1.206255, -0.5198542, 2.756198, 1, 0, 0.6235294, 1,
1.209994, -0.948393, 2.715189, 1, 0, 0.6196079, 1,
1.215857, -0.6820325, 1.023474, 1, 0, 0.6117647, 1,
1.217256, -0.7884121, 1.056227, 1, 0, 0.6078432, 1,
1.217517, -0.3556225, 2.843114, 1, 0, 0.6, 1,
1.220258, 0.1128069, 0.1429583, 1, 0, 0.5921569, 1,
1.230741, -0.0748313, 2.348847, 1, 0, 0.5882353, 1,
1.232611, -0.223075, 3.252431, 1, 0, 0.5803922, 1,
1.244707, -0.1280353, 0.2889145, 1, 0, 0.5764706, 1,
1.306857, 1.441281, 0.1639467, 1, 0, 0.5686275, 1,
1.313634, 1.014587, 0.3227427, 1, 0, 0.5647059, 1,
1.316136, 0.6779534, -0.3592754, 1, 0, 0.5568628, 1,
1.318112, 0.1840869, 2.637934, 1, 0, 0.5529412, 1,
1.328924, 1.648609, 1.30592, 1, 0, 0.5450981, 1,
1.342454, -0.2336363, 0.4817774, 1, 0, 0.5411765, 1,
1.344711, -0.7241239, 3.131535, 1, 0, 0.5333334, 1,
1.345545, 0.08357766, 2.832122, 1, 0, 0.5294118, 1,
1.352491, -0.2241712, 1.669514, 1, 0, 0.5215687, 1,
1.354169, 1.800485, 1.578434, 1, 0, 0.5176471, 1,
1.356978, -0.04510461, -0.3347136, 1, 0, 0.509804, 1,
1.368342, 0.2861634, 1.685214, 1, 0, 0.5058824, 1,
1.369512, -1.093414, 2.260236, 1, 0, 0.4980392, 1,
1.374569, -0.2444529, 0.3798284, 1, 0, 0.4901961, 1,
1.376154, -0.6204275, 3.480559, 1, 0, 0.4862745, 1,
1.376389, -1.018883, 0.9761056, 1, 0, 0.4784314, 1,
1.386518, 0.06851263, 3.045283, 1, 0, 0.4745098, 1,
1.38959, -0.3261085, 2.451927, 1, 0, 0.4666667, 1,
1.411651, -0.6347201, 2.03121, 1, 0, 0.4627451, 1,
1.412964, -0.942356, 3.289543, 1, 0, 0.454902, 1,
1.438601, -0.7016138, 3.257677, 1, 0, 0.4509804, 1,
1.439986, -1.786701, 2.999088, 1, 0, 0.4431373, 1,
1.441367, 0.2627187, 3.434905, 1, 0, 0.4392157, 1,
1.45538, -2.714367, -0.06716616, 1, 0, 0.4313726, 1,
1.461824, -2.186165, 3.085441, 1, 0, 0.427451, 1,
1.462795, -0.1974812, 2.948437, 1, 0, 0.4196078, 1,
1.485131, 0.2580529, 0.3849688, 1, 0, 0.4156863, 1,
1.485485, -0.8360227, 2.155055, 1, 0, 0.4078431, 1,
1.496404, 0.4503997, 1.328573, 1, 0, 0.4039216, 1,
1.500752, -1.011408, 2.931832, 1, 0, 0.3960784, 1,
1.507908, -2.078626, 3.322956, 1, 0, 0.3882353, 1,
1.516992, 1.062307, 0.2128633, 1, 0, 0.3843137, 1,
1.521583, 2.332078, 1.302467, 1, 0, 0.3764706, 1,
1.553512, 1.69463, 0.4663173, 1, 0, 0.372549, 1,
1.559002, 0.479497, 2.193518, 1, 0, 0.3647059, 1,
1.562245, -0.9868603, 2.721909, 1, 0, 0.3607843, 1,
1.570791, 0.5317644, 2.333774, 1, 0, 0.3529412, 1,
1.573169, -2.006855, 3.47043, 1, 0, 0.3490196, 1,
1.576281, 0.007387547, 1.823068, 1, 0, 0.3411765, 1,
1.579153, -0.4491232, 1.634643, 1, 0, 0.3372549, 1,
1.579825, -0.9944807, 2.395753, 1, 0, 0.3294118, 1,
1.58046, -1.399184, 1.65144, 1, 0, 0.3254902, 1,
1.581699, 0.9893734, 1.500138, 1, 0, 0.3176471, 1,
1.605588, 0.4074733, 3.163477, 1, 0, 0.3137255, 1,
1.610733, 1.115184, 0.9622435, 1, 0, 0.3058824, 1,
1.61138, 2.67539, 0.1392493, 1, 0, 0.2980392, 1,
1.618894, 1.120883, 1.941808, 1, 0, 0.2941177, 1,
1.622333, -0.6824865, 1.065052, 1, 0, 0.2862745, 1,
1.625177, -0.2211477, 3.077025, 1, 0, 0.282353, 1,
1.645255, 0.01118683, 2.902804, 1, 0, 0.2745098, 1,
1.664953, 0.4823915, 1.799667, 1, 0, 0.2705882, 1,
1.671347, 1.456258, 0.5318567, 1, 0, 0.2627451, 1,
1.700845, -0.5359005, 1.795397, 1, 0, 0.2588235, 1,
1.712285, -0.3145336, 1.977611, 1, 0, 0.2509804, 1,
1.713844, -0.7340726, 2.883127, 1, 0, 0.2470588, 1,
1.741024, -0.07949401, 2.807156, 1, 0, 0.2392157, 1,
1.745425, 0.5610813, 0.4912513, 1, 0, 0.2352941, 1,
1.756457, 0.4704953, 2.880817, 1, 0, 0.227451, 1,
1.76881, 0.6279639, 1.733583, 1, 0, 0.2235294, 1,
1.769197, 0.1337799, 1.09854, 1, 0, 0.2156863, 1,
1.774823, -0.08125561, 1.863892, 1, 0, 0.2117647, 1,
1.783118, -0.3551416, 0.7557045, 1, 0, 0.2039216, 1,
1.801774, 0.4613534, -0.2280777, 1, 0, 0.1960784, 1,
1.806895, -2.023468, 2.351498, 1, 0, 0.1921569, 1,
1.84885, -1.73476, 2.722098, 1, 0, 0.1843137, 1,
1.860908, -0.5946761, 2.861051, 1, 0, 0.1803922, 1,
1.871601, -0.7762464, 1.270704, 1, 0, 0.172549, 1,
1.915479, 0.3043022, 1.562004, 1, 0, 0.1686275, 1,
1.921311, 0.7765946, 0.9158856, 1, 0, 0.1607843, 1,
1.925563, 1.047533, 1.862619, 1, 0, 0.1568628, 1,
1.962318, 1.172605, -0.04681198, 1, 0, 0.1490196, 1,
1.965265, 0.9041667, -0.8678492, 1, 0, 0.145098, 1,
1.974467, -0.297867, 1.292817, 1, 0, 0.1372549, 1,
2.040403, -0.2857428, 2.604959, 1, 0, 0.1333333, 1,
2.04367, 0.6061141, 3.037189, 1, 0, 0.1254902, 1,
2.079661, 0.3210177, 1.010384, 1, 0, 0.1215686, 1,
2.101478, 0.07904899, 2.460232, 1, 0, 0.1137255, 1,
2.10177, 0.7485009, -0.03926488, 1, 0, 0.1098039, 1,
2.12976, -1.089602, -0.3218668, 1, 0, 0.1019608, 1,
2.151743, 1.731449, 1.039615, 1, 0, 0.09411765, 1,
2.191797, 1.854291, -0.4620748, 1, 0, 0.09019608, 1,
2.196344, 0.8196698, 2.040718, 1, 0, 0.08235294, 1,
2.233918, -0.6493039, 1.58948, 1, 0, 0.07843138, 1,
2.274658, 0.4781036, 0.7893959, 1, 0, 0.07058824, 1,
2.317996, 1.000548, 1.375377, 1, 0, 0.06666667, 1,
2.340413, 0.6164303, 1.18768, 1, 0, 0.05882353, 1,
2.387377, -0.03563931, 2.160915, 1, 0, 0.05490196, 1,
2.428444, 2.863371, -0.09421666, 1, 0, 0.04705882, 1,
2.429058, -1.553098, 1.747566, 1, 0, 0.04313726, 1,
2.542465, -2.114765, 2.943098, 1, 0, 0.03529412, 1,
2.584107, -1.530001, 0.286333, 1, 0, 0.03137255, 1,
2.613258, -0.9827122, 3.032598, 1, 0, 0.02352941, 1,
3.010771, -0.2011247, 1.677943, 1, 0, 0.01960784, 1,
3.162638, -0.6461598, 1.36063, 1, 0, 0.01176471, 1,
3.186774, -1.346557, 0.9596582, 1, 0, 0.007843138, 1
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
-0.0613637, -5.477336, -8.078076, 0, -0.5, 0.5, 0.5,
-0.0613637, -5.477336, -8.078076, 1, -0.5, 0.5, 0.5,
-0.0613637, -5.477336, -8.078076, 1, 1.5, 0.5, 0.5,
-0.0613637, -5.477336, -8.078076, 0, 1.5, 0.5, 0.5
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
-4.41062, -0.3711474, -8.078076, 0, -0.5, 0.5, 0.5,
-4.41062, -0.3711474, -8.078076, 1, -0.5, 0.5, 0.5,
-4.41062, -0.3711474, -8.078076, 1, 1.5, 0.5, 0.5,
-4.41062, -0.3711474, -8.078076, 0, 1.5, 0.5, 0.5
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
-4.41062, -5.477336, -0.105628, 0, -0.5, 0.5, 0.5,
-4.41062, -5.477336, -0.105628, 1, -0.5, 0.5, 0.5,
-4.41062, -5.477336, -0.105628, 1, 1.5, 0.5, 0.5,
-4.41062, -5.477336, -0.105628, 0, 1.5, 0.5, 0.5
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
-3, -4.298985, -6.23828,
3, -4.298985, -6.23828,
-3, -4.298985, -6.23828,
-3, -4.495377, -6.544913,
-2, -4.298985, -6.23828,
-2, -4.495377, -6.544913,
-1, -4.298985, -6.23828,
-1, -4.495377, -6.544913,
0, -4.298985, -6.23828,
0, -4.495377, -6.544913,
1, -4.298985, -6.23828,
1, -4.495377, -6.544913,
2, -4.298985, -6.23828,
2, -4.495377, -6.544913,
3, -4.298985, -6.23828,
3, -4.495377, -6.544913
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
-3, -4.88816, -7.158178, 0, -0.5, 0.5, 0.5,
-3, -4.88816, -7.158178, 1, -0.5, 0.5, 0.5,
-3, -4.88816, -7.158178, 1, 1.5, 0.5, 0.5,
-3, -4.88816, -7.158178, 0, 1.5, 0.5, 0.5,
-2, -4.88816, -7.158178, 0, -0.5, 0.5, 0.5,
-2, -4.88816, -7.158178, 1, -0.5, 0.5, 0.5,
-2, -4.88816, -7.158178, 1, 1.5, 0.5, 0.5,
-2, -4.88816, -7.158178, 0, 1.5, 0.5, 0.5,
-1, -4.88816, -7.158178, 0, -0.5, 0.5, 0.5,
-1, -4.88816, -7.158178, 1, -0.5, 0.5, 0.5,
-1, -4.88816, -7.158178, 1, 1.5, 0.5, 0.5,
-1, -4.88816, -7.158178, 0, 1.5, 0.5, 0.5,
0, -4.88816, -7.158178, 0, -0.5, 0.5, 0.5,
0, -4.88816, -7.158178, 1, -0.5, 0.5, 0.5,
0, -4.88816, -7.158178, 1, 1.5, 0.5, 0.5,
0, -4.88816, -7.158178, 0, 1.5, 0.5, 0.5,
1, -4.88816, -7.158178, 0, -0.5, 0.5, 0.5,
1, -4.88816, -7.158178, 1, -0.5, 0.5, 0.5,
1, -4.88816, -7.158178, 1, 1.5, 0.5, 0.5,
1, -4.88816, -7.158178, 0, 1.5, 0.5, 0.5,
2, -4.88816, -7.158178, 0, -0.5, 0.5, 0.5,
2, -4.88816, -7.158178, 1, -0.5, 0.5, 0.5,
2, -4.88816, -7.158178, 1, 1.5, 0.5, 0.5,
2, -4.88816, -7.158178, 0, 1.5, 0.5, 0.5,
3, -4.88816, -7.158178, 0, -0.5, 0.5, 0.5,
3, -4.88816, -7.158178, 1, -0.5, 0.5, 0.5,
3, -4.88816, -7.158178, 1, 1.5, 0.5, 0.5,
3, -4.88816, -7.158178, 0, 1.5, 0.5, 0.5
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
-3.406946, -4, -6.23828,
-3.406946, 2, -6.23828,
-3.406946, -4, -6.23828,
-3.574225, -4, -6.544913,
-3.406946, -2, -6.23828,
-3.574225, -2, -6.544913,
-3.406946, 0, -6.23828,
-3.574225, 0, -6.544913,
-3.406946, 2, -6.23828,
-3.574225, 2, -6.544913
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
"-4",
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
-3.908783, -4, -7.158178, 0, -0.5, 0.5, 0.5,
-3.908783, -4, -7.158178, 1, -0.5, 0.5, 0.5,
-3.908783, -4, -7.158178, 1, 1.5, 0.5, 0.5,
-3.908783, -4, -7.158178, 0, 1.5, 0.5, 0.5,
-3.908783, -2, -7.158178, 0, -0.5, 0.5, 0.5,
-3.908783, -2, -7.158178, 1, -0.5, 0.5, 0.5,
-3.908783, -2, -7.158178, 1, 1.5, 0.5, 0.5,
-3.908783, -2, -7.158178, 0, 1.5, 0.5, 0.5,
-3.908783, 0, -7.158178, 0, -0.5, 0.5, 0.5,
-3.908783, 0, -7.158178, 1, -0.5, 0.5, 0.5,
-3.908783, 0, -7.158178, 1, 1.5, 0.5, 0.5,
-3.908783, 0, -7.158178, 0, 1.5, 0.5, 0.5,
-3.908783, 2, -7.158178, 0, -0.5, 0.5, 0.5,
-3.908783, 2, -7.158178, 1, -0.5, 0.5, 0.5,
-3.908783, 2, -7.158178, 1, 1.5, 0.5, 0.5,
-3.908783, 2, -7.158178, 0, 1.5, 0.5, 0.5
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
-3.406946, -4.298985, -6,
-3.406946, -4.298985, 4,
-3.406946, -4.298985, -6,
-3.574225, -4.495377, -6,
-3.406946, -4.298985, -4,
-3.574225, -4.495377, -4,
-3.406946, -4.298985, -2,
-3.574225, -4.495377, -2,
-3.406946, -4.298985, 0,
-3.574225, -4.495377, 0,
-3.406946, -4.298985, 2,
-3.574225, -4.495377, 2,
-3.406946, -4.298985, 4,
-3.574225, -4.495377, 4
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
"-6",
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
-3.908783, -4.88816, -6, 0, -0.5, 0.5, 0.5,
-3.908783, -4.88816, -6, 1, -0.5, 0.5, 0.5,
-3.908783, -4.88816, -6, 1, 1.5, 0.5, 0.5,
-3.908783, -4.88816, -6, 0, 1.5, 0.5, 0.5,
-3.908783, -4.88816, -4, 0, -0.5, 0.5, 0.5,
-3.908783, -4.88816, -4, 1, -0.5, 0.5, 0.5,
-3.908783, -4.88816, -4, 1, 1.5, 0.5, 0.5,
-3.908783, -4.88816, -4, 0, 1.5, 0.5, 0.5,
-3.908783, -4.88816, -2, 0, -0.5, 0.5, 0.5,
-3.908783, -4.88816, -2, 1, -0.5, 0.5, 0.5,
-3.908783, -4.88816, -2, 1, 1.5, 0.5, 0.5,
-3.908783, -4.88816, -2, 0, 1.5, 0.5, 0.5,
-3.908783, -4.88816, 0, 0, -0.5, 0.5, 0.5,
-3.908783, -4.88816, 0, 1, -0.5, 0.5, 0.5,
-3.908783, -4.88816, 0, 1, 1.5, 0.5, 0.5,
-3.908783, -4.88816, 0, 0, 1.5, 0.5, 0.5,
-3.908783, -4.88816, 2, 0, -0.5, 0.5, 0.5,
-3.908783, -4.88816, 2, 1, -0.5, 0.5, 0.5,
-3.908783, -4.88816, 2, 1, 1.5, 0.5, 0.5,
-3.908783, -4.88816, 2, 0, 1.5, 0.5, 0.5,
-3.908783, -4.88816, 4, 0, -0.5, 0.5, 0.5,
-3.908783, -4.88816, 4, 1, -0.5, 0.5, 0.5,
-3.908783, -4.88816, 4, 1, 1.5, 0.5, 0.5,
-3.908783, -4.88816, 4, 0, 1.5, 0.5, 0.5
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
-3.406946, -4.298985, -6.23828,
-3.406946, 3.55669, -6.23828,
-3.406946, -4.298985, 6.027024,
-3.406946, 3.55669, 6.027024,
-3.406946, -4.298985, -6.23828,
-3.406946, -4.298985, 6.027024,
-3.406946, 3.55669, -6.23828,
-3.406946, 3.55669, 6.027024,
-3.406946, -4.298985, -6.23828,
3.284218, -4.298985, -6.23828,
-3.406946, -4.298985, 6.027024,
3.284218, -4.298985, 6.027024,
-3.406946, 3.55669, -6.23828,
3.284218, 3.55669, -6.23828,
-3.406946, 3.55669, 6.027024,
3.284218, 3.55669, 6.027024,
3.284218, -4.298985, -6.23828,
3.284218, 3.55669, -6.23828,
3.284218, -4.298985, 6.027024,
3.284218, 3.55669, 6.027024,
3.284218, -4.298985, -6.23828,
3.284218, -4.298985, 6.027024,
3.284218, 3.55669, -6.23828,
3.284218, 3.55669, 6.027024
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
var radius = 8.559044;
var distance = 38.08015;
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
mvMatrix.translate( 0.0613637, 0.3711474, 0.105628 );
mvMatrix.scale( 1.383049, 1.178028, 0.7545028 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.08015);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
dodemorph<-read.table("dodemorph.xyz")
```

```
## Error in read.table("dodemorph.xyz"): no lines available in input
```

```r
x<-dodemorph$V2
```

```
## Error in eval(expr, envir, enclos): object 'dodemorph' not found
```

```r
y<-dodemorph$V3
```

```
## Error in eval(expr, envir, enclos): object 'dodemorph' not found
```

```r
z<-dodemorph$V4
```

```
## Error in eval(expr, envir, enclos): object 'dodemorph' not found
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
-3.309502, 1.817883, 0.9282174, 0, 0, 1, 1, 1,
-3.109676, 0.6719364, -4.120135, 1, 0, 0, 1, 1,
-3.086807, -0.5471203, -1.26277, 1, 0, 0, 1, 1,
-2.748579, 0.9726595, -0.2358515, 1, 0, 0, 1, 1,
-2.634498, 0.4160351, -1.140958, 1, 0, 0, 1, 1,
-2.585253, -0.4179063, -0.2088061, 1, 0, 0, 1, 1,
-2.551426, -0.6386105, -3.346418, 0, 0, 0, 1, 1,
-2.538913, -0.7869943, -1.612144, 0, 0, 0, 1, 1,
-2.391852, 1.806706, -1.750886, 0, 0, 0, 1, 1,
-2.311214, 0.236191, 0.519633, 0, 0, 0, 1, 1,
-2.292416, 0.2278897, -1.712088, 0, 0, 0, 1, 1,
-2.260894, 1.542529, -1.962062, 0, 0, 0, 1, 1,
-2.232138, 1.076641, -1.536297, 0, 0, 0, 1, 1,
-2.208867, 0.2993265, 0.1381398, 1, 1, 1, 1, 1,
-2.207142, 0.4176842, -2.156661, 1, 1, 1, 1, 1,
-2.194488, 0.2533586, -2.729982, 1, 1, 1, 1, 1,
-2.191818, -0.9384095, -2.071093, 1, 1, 1, 1, 1,
-2.164737, -1.634297, -2.607826, 1, 1, 1, 1, 1,
-2.145044, 1.027164, -1.945579, 1, 1, 1, 1, 1,
-2.136151, 0.8789161, 0.505748, 1, 1, 1, 1, 1,
-2.130525, -0.8847996, -1.45473, 1, 1, 1, 1, 1,
-2.114317, 0.2310615, -2.202359, 1, 1, 1, 1, 1,
-2.054514, 1.49925, -0.7675025, 1, 1, 1, 1, 1,
-2.034178, -0.2037579, -1.159131, 1, 1, 1, 1, 1,
-2.015969, 0.7367909, -0.2112689, 1, 1, 1, 1, 1,
-2.014096, -0.4357665, -2.658464, 1, 1, 1, 1, 1,
-2.003103, -1.083397, -3.539617, 1, 1, 1, 1, 1,
-1.994775, -0.2038081, -2.596767, 1, 1, 1, 1, 1,
-1.988468, 1.840979, -0.6658899, 0, 0, 1, 1, 1,
-1.948965, -1.096131, -3.292778, 1, 0, 0, 1, 1,
-1.92462, 0.1497403, -2.337171, 1, 0, 0, 1, 1,
-1.924041, -0.6598198, -1.468297, 1, 0, 0, 1, 1,
-1.92081, -0.07370178, -1.928505, 1, 0, 0, 1, 1,
-1.914895, -0.01669447, -2.985532, 1, 0, 0, 1, 1,
-1.906149, -1.480518, -3.058674, 0, 0, 0, 1, 1,
-1.902465, 1.379093, -1.49379, 0, 0, 0, 1, 1,
-1.898329, 0.1353097, -2.482412, 0, 0, 0, 1, 1,
-1.892707, -0.8179172, -3.123306, 0, 0, 0, 1, 1,
-1.887373, -0.7433099, -1.194022, 0, 0, 0, 1, 1,
-1.835693, -1.053059, -2.374281, 0, 0, 0, 1, 1,
-1.818995, -0.3149546, -2.243689, 0, 0, 0, 1, 1,
-1.814653, -1.514844, -1.428394, 1, 1, 1, 1, 1,
-1.80791, 0.7000701, 0.6257877, 1, 1, 1, 1, 1,
-1.790451, -1.3157, -4.334921, 1, 1, 1, 1, 1,
-1.77895, -0.5836815, -1.582984, 1, 1, 1, 1, 1,
-1.765835, 1.177153, -0.2373502, 1, 1, 1, 1, 1,
-1.755623, -0.002407048, -4.020001, 1, 1, 1, 1, 1,
-1.745556, -0.1831262, -2.80554, 1, 1, 1, 1, 1,
-1.74342, 0.7096495, -1.928104, 1, 1, 1, 1, 1,
-1.73684, 0.3910867, -1.003272, 1, 1, 1, 1, 1,
-1.717041, 0.2810878, 0.506862, 1, 1, 1, 1, 1,
-1.713208, 0.0741391, -1.781089, 1, 1, 1, 1, 1,
-1.70535, -1.74108, -2.712266, 1, 1, 1, 1, 1,
-1.704049, 0.06195036, -3.514461, 1, 1, 1, 1, 1,
-1.703369, 1.120963, -1.409024, 1, 1, 1, 1, 1,
-1.696574, -0.6625656, -1.948887, 1, 1, 1, 1, 1,
-1.689463, 1.280266, 0.6616962, 0, 0, 1, 1, 1,
-1.671119, 0.2266791, -1.320183, 1, 0, 0, 1, 1,
-1.651096, -1.6735, -1.247372, 1, 0, 0, 1, 1,
-1.642437, 0.9838918, -0.856298, 1, 0, 0, 1, 1,
-1.640508, -0.4075324, -0.9773142, 1, 0, 0, 1, 1,
-1.639078, -0.04756313, -2.228121, 1, 0, 0, 1, 1,
-1.62817, 1.668283, 0.310095, 0, 0, 0, 1, 1,
-1.613619, 0.6754997, -0.07469936, 0, 0, 0, 1, 1,
-1.611626, 1.44992, -0.4613651, 0, 0, 0, 1, 1,
-1.608035, 1.288201, 1.083551, 0, 0, 0, 1, 1,
-1.600031, -1.423392, -2.228791, 0, 0, 0, 1, 1,
-1.599601, 0.4340092, -2.826182, 0, 0, 0, 1, 1,
-1.593598, -1.534376, -2.368129, 0, 0, 0, 1, 1,
-1.587467, -0.370242, -2.266445, 1, 1, 1, 1, 1,
-1.581114, 0.5410972, 0.03592935, 1, 1, 1, 1, 1,
-1.578184, -0.1503997, 0.5537503, 1, 1, 1, 1, 1,
-1.568525, 0.7881524, -3.194585, 1, 1, 1, 1, 1,
-1.565098, -0.6740688, -2.22919, 1, 1, 1, 1, 1,
-1.562339, -0.03323353, -0.9104042, 1, 1, 1, 1, 1,
-1.560229, 0.6925399, -0.1715282, 1, 1, 1, 1, 1,
-1.557634, 0.03988986, -1.27091, 1, 1, 1, 1, 1,
-1.539228, -0.06568682, -2.417676, 1, 1, 1, 1, 1,
-1.5344, 1.526442, -1.541708, 1, 1, 1, 1, 1,
-1.508684, -0.07415608, -1.191491, 1, 1, 1, 1, 1,
-1.503323, 1.101161, -0.586906, 1, 1, 1, 1, 1,
-1.502416, -0.1414053, -1.758514, 1, 1, 1, 1, 1,
-1.497454, -1.023901, -2.282219, 1, 1, 1, 1, 1,
-1.4907, -2.237742, -1.343094, 1, 1, 1, 1, 1,
-1.488663, -0.855345, -1.763082, 0, 0, 1, 1, 1,
-1.488146, 0.8717515, -0.3683437, 1, 0, 0, 1, 1,
-1.484827, -2.364974, -2.294725, 1, 0, 0, 1, 1,
-1.484133, 0.3055594, -1.802062, 1, 0, 0, 1, 1,
-1.453162, 1.411234, -0.5339692, 1, 0, 0, 1, 1,
-1.443303, 0.5082517, -1.315006, 1, 0, 0, 1, 1,
-1.442396, 0.3938891, -2.100432, 0, 0, 0, 1, 1,
-1.439986, -0.9716349, -1.852584, 0, 0, 0, 1, 1,
-1.432987, 1.519499, -1.779268, 0, 0, 0, 1, 1,
-1.422639, 1.115716, 0.4561574, 0, 0, 0, 1, 1,
-1.420369, -1.408454, -2.172624, 0, 0, 0, 1, 1,
-1.418958, -0.6758274, -1.204461, 0, 0, 0, 1, 1,
-1.415586, -1.343578, -2.247453, 0, 0, 0, 1, 1,
-1.411637, -1.065846, -0.9204587, 1, 1, 1, 1, 1,
-1.409314, 1.24454, -0.1529181, 1, 1, 1, 1, 1,
-1.389801, 0.9356912, -2.398645, 1, 1, 1, 1, 1,
-1.388291, -0.4435982, -3.026073, 1, 1, 1, 1, 1,
-1.382943, 2.464841, -2.004425, 1, 1, 1, 1, 1,
-1.375639, 0.8028823, -2.353341, 1, 1, 1, 1, 1,
-1.370036, -0.9021974, -2.376269, 1, 1, 1, 1, 1,
-1.369401, 0.1765542, -1.711518, 1, 1, 1, 1, 1,
-1.362257, -2.107421, -2.657779, 1, 1, 1, 1, 1,
-1.340804, 0.02722804, -3.303379, 1, 1, 1, 1, 1,
-1.33827, -2.373963, -4.560503, 1, 1, 1, 1, 1,
-1.336773, 2.098099, -1.17193, 1, 1, 1, 1, 1,
-1.335147, -0.3075276, -1.385063, 1, 1, 1, 1, 1,
-1.333688, 0.03444803, 0.1674767, 1, 1, 1, 1, 1,
-1.331642, -1.406548, -1.347497, 1, 1, 1, 1, 1,
-1.329055, 0.06355865, 0.5351307, 0, 0, 1, 1, 1,
-1.322303, -0.8491295, -3.15843, 1, 0, 0, 1, 1,
-1.320594, 2.30785, -0.7856742, 1, 0, 0, 1, 1,
-1.304073, -0.7229515, -3.365062, 1, 0, 0, 1, 1,
-1.295661, -0.1115669, 0.2182131, 1, 0, 0, 1, 1,
-1.265875, 0.403084, -0.6576036, 1, 0, 0, 1, 1,
-1.241991, 1.713687, 0.4462962, 0, 0, 0, 1, 1,
-1.223372, -0.003150888, -3.045319, 0, 0, 0, 1, 1,
-1.217768, 0.6037122, -1.585046, 0, 0, 0, 1, 1,
-1.214991, -0.4058729, -2.035977, 0, 0, 0, 1, 1,
-1.210266, -1.052232, -2.430366, 0, 0, 0, 1, 1,
-1.207363, -0.3429788, 0.2331889, 0, 0, 0, 1, 1,
-1.191403, -0.1462546, -1.312146, 0, 0, 0, 1, 1,
-1.188638, 0.503351, -0.6764687, 1, 1, 1, 1, 1,
-1.183185, -0.0180011, -2.010494, 1, 1, 1, 1, 1,
-1.180436, -0.4882881, -0.9539526, 1, 1, 1, 1, 1,
-1.174222, 0.5589553, -1.813101, 1, 1, 1, 1, 1,
-1.173806, 2.221645, 0.8119465, 1, 1, 1, 1, 1,
-1.151406, 0.3296819, -3.491741, 1, 1, 1, 1, 1,
-1.142126, -0.2602315, -1.752948, 1, 1, 1, 1, 1,
-1.1377, 1.74512, 1.277974, 1, 1, 1, 1, 1,
-1.136223, -0.855124, -1.697844, 1, 1, 1, 1, 1,
-1.132896, -0.4857186, -2.527858, 1, 1, 1, 1, 1,
-1.132324, -0.1656099, -0.8025182, 1, 1, 1, 1, 1,
-1.132052, 1.15333, -0.9470022, 1, 1, 1, 1, 1,
-1.131498, -0.9495842, -2.576662, 1, 1, 1, 1, 1,
-1.127588, 1.882462, -0.9416286, 1, 1, 1, 1, 1,
-1.11489, 0.1322353, -0.6325091, 1, 1, 1, 1, 1,
-1.10202, 1.044545, -0.01378289, 0, 0, 1, 1, 1,
-1.095673, 1.40503, -1.635273, 1, 0, 0, 1, 1,
-1.089396, -0.7628099, -2.41081, 1, 0, 0, 1, 1,
-1.083655, -1.124308, -2.458813, 1, 0, 0, 1, 1,
-1.079893, -0.1134697, -2.828979, 1, 0, 0, 1, 1,
-1.072902, 1.507451, -0.9307458, 1, 0, 0, 1, 1,
-1.072259, -1.140811, -1.887202, 0, 0, 0, 1, 1,
-1.063752, 0.8722153, -2.67712, 0, 0, 0, 1, 1,
-1.060401, -0.1744848, -0.7918138, 0, 0, 0, 1, 1,
-1.05533, 0.2167925, -2.768795, 0, 0, 0, 1, 1,
-1.051212, -1.655967, -3.743936, 0, 0, 0, 1, 1,
-1.039777, -2.677457, -4.066962, 0, 0, 0, 1, 1,
-1.029953, 1.013588, -2.72098, 0, 0, 0, 1, 1,
-1.025306, -1.888232, -3.532502, 1, 1, 1, 1, 1,
-1.017919, 0.7370451, -1.881952, 1, 1, 1, 1, 1,
-1.011377, -1.137725, -2.396091, 1, 1, 1, 1, 1,
-1.010796, 0.4949977, -1.94066, 1, 1, 1, 1, 1,
-1.00356, 0.2141529, -2.351762, 1, 1, 1, 1, 1,
-0.9989695, -0.09559891, -2.584572, 1, 1, 1, 1, 1,
-0.9961536, 1.557145, -0.8359844, 1, 1, 1, 1, 1,
-0.9959866, 2.909092, -1.594978, 1, 1, 1, 1, 1,
-0.9920623, 0.6523231, 1.302747, 1, 1, 1, 1, 1,
-0.9895748, 1.015863, -0.8230724, 1, 1, 1, 1, 1,
-0.978881, 0.4934941, -0.08769288, 1, 1, 1, 1, 1,
-0.9673291, -0.4606506, -1.058327, 1, 1, 1, 1, 1,
-0.9603633, 0.1260676, 0.2986884, 1, 1, 1, 1, 1,
-0.9564118, 0.8552365, -0.3173345, 1, 1, 1, 1, 1,
-0.9558675, -0.8003634, -4.07698, 1, 1, 1, 1, 1,
-0.9526505, -0.9457117, -2.284863, 0, 0, 1, 1, 1,
-0.9497511, 1.403402, 1.531301, 1, 0, 0, 1, 1,
-0.9449764, -0.03762977, -2.352695, 1, 0, 0, 1, 1,
-0.9333917, 1.704296, -2.419302, 1, 0, 0, 1, 1,
-0.9131548, 0.4335111, -1.052849, 1, 0, 0, 1, 1,
-0.9106638, 0.3563007, -0.905049, 1, 0, 0, 1, 1,
-0.9098168, -0.4039968, -1.981511, 0, 0, 0, 1, 1,
-0.9097548, 0.1909505, -1.254786, 0, 0, 0, 1, 1,
-0.9061868, -1.35188, -2.297948, 0, 0, 0, 1, 1,
-0.8992245, -2.005106, -2.225349, 0, 0, 0, 1, 1,
-0.8968416, 0.3346872, -2.041195, 0, 0, 0, 1, 1,
-0.8906559, 0.8885939, -0.4423138, 0, 0, 0, 1, 1,
-0.8902031, 1.021752, 0.3153169, 0, 0, 0, 1, 1,
-0.8864912, 0.2818071, -0.2458722, 1, 1, 1, 1, 1,
-0.8862305, -0.9833063, -1.999114, 1, 1, 1, 1, 1,
-0.8835893, -0.8291654, -1.794712, 1, 1, 1, 1, 1,
-0.8823528, 1.163118, -1.196969, 1, 1, 1, 1, 1,
-0.8779358, -0.141997, -1.872147, 1, 1, 1, 1, 1,
-0.871207, -0.3998768, -1.100747, 1, 1, 1, 1, 1,
-0.8679456, 0.8298646, -0.8668019, 1, 1, 1, 1, 1,
-0.8663125, 2.035098, -0.6636046, 1, 1, 1, 1, 1,
-0.8661212, -1.089278, -3.444044, 1, 1, 1, 1, 1,
-0.8660119, -0.5487019, -2.861467, 1, 1, 1, 1, 1,
-0.8647144, -0.06997764, -3.309651, 1, 1, 1, 1, 1,
-0.8575555, 0.6392517, -2.004564, 1, 1, 1, 1, 1,
-0.8566166, 0.8137241, 0.275251, 1, 1, 1, 1, 1,
-0.8481738, 0.4033815, -1.334475, 1, 1, 1, 1, 1,
-0.8451578, -1.293995, -3.608313, 1, 1, 1, 1, 1,
-0.8448834, 0.1341946, -0.7748134, 0, 0, 1, 1, 1,
-0.8427079, -0.2315773, -0.7434563, 1, 0, 0, 1, 1,
-0.8420486, 1.510905, 1.04115, 1, 0, 0, 1, 1,
-0.8411613, 0.4844432, -0.4985951, 1, 0, 0, 1, 1,
-0.8395592, -0.9448851, -3.197272, 1, 0, 0, 1, 1,
-0.8385273, -0.581894, -3.550157, 1, 0, 0, 1, 1,
-0.8334237, -0.807934, -1.68884, 0, 0, 0, 1, 1,
-0.8302258, 0.6579484, -1.856983, 0, 0, 0, 1, 1,
-0.8261359, -0.3396356, -1.108868, 0, 0, 0, 1, 1,
-0.8229578, -0.2315897, -1.986545, 0, 0, 0, 1, 1,
-0.8225586, 0.475859, -2.562144, 0, 0, 0, 1, 1,
-0.8213959, -1.112255, -1.965284, 0, 0, 0, 1, 1,
-0.8189909, 0.3881195, -1.752511, 0, 0, 0, 1, 1,
-0.8189306, 0.5308737, -0.5442954, 1, 1, 1, 1, 1,
-0.8122109, 0.04239896, -1.678416, 1, 1, 1, 1, 1,
-0.8117355, -1.458128, -2.684614, 1, 1, 1, 1, 1,
-0.8097178, -0.6059435, -1.858744, 1, 1, 1, 1, 1,
-0.8012827, -1.741089, -2.838381, 1, 1, 1, 1, 1,
-0.795424, -2.148576, -1.333204, 1, 1, 1, 1, 1,
-0.7937955, 0.2062886, -2.323898, 1, 1, 1, 1, 1,
-0.7933415, -0.683465, -0.8622946, 1, 1, 1, 1, 1,
-0.7812558, -1.101965, -2.495035, 1, 1, 1, 1, 1,
-0.7804081, 1.227106, -0.2348744, 1, 1, 1, 1, 1,
-0.7773507, -0.4593211, -3.682064, 1, 1, 1, 1, 1,
-0.7765387, 0.2499284, -1.744913, 1, 1, 1, 1, 1,
-0.7754487, 1.551548, 1.234904, 1, 1, 1, 1, 1,
-0.773806, -1.111987, -2.345291, 1, 1, 1, 1, 1,
-0.7715284, -0.0054372, -1.823709, 1, 1, 1, 1, 1,
-0.7631505, 2.130784, -1.128364, 0, 0, 1, 1, 1,
-0.7626342, 0.03512501, -0.4296714, 1, 0, 0, 1, 1,
-0.759866, -4.184582, -2.868955, 1, 0, 0, 1, 1,
-0.7494692, 1.931524, 1.627584, 1, 0, 0, 1, 1,
-0.7485812, -0.1352506, 0.2151696, 1, 0, 0, 1, 1,
-0.7472704, 0.00771502, -3.521495, 1, 0, 0, 1, 1,
-0.7427328, 1.19449, 0.3109222, 0, 0, 0, 1, 1,
-0.7415699, -1.009477, -3.089895, 0, 0, 0, 1, 1,
-0.7396853, -0.899698, -3.705053, 0, 0, 0, 1, 1,
-0.7322396, -0.4626026, -1.435141, 0, 0, 0, 1, 1,
-0.7220571, -2.037291, -1.408666, 0, 0, 0, 1, 1,
-0.7191979, -0.5400758, -1.505824, 0, 0, 0, 1, 1,
-0.7180815, 0.3768292, -0.8757831, 0, 0, 0, 1, 1,
-0.7140661, 0.2480219, -0.250347, 1, 1, 1, 1, 1,
-0.712691, -1.766534, -3.059282, 1, 1, 1, 1, 1,
-0.7122664, -1.842055, -1.47841, 1, 1, 1, 1, 1,
-0.7074938, 0.772102, 0.6234742, 1, 1, 1, 1, 1,
-0.7059901, 0.8436395, 0.5047057, 1, 1, 1, 1, 1,
-0.7057995, 1.170429, 1.206825, 1, 1, 1, 1, 1,
-0.6986372, 0.1123384, -0.7031705, 1, 1, 1, 1, 1,
-0.6981492, 1.049428, 0.439342, 1, 1, 1, 1, 1,
-0.6899417, 0.1904704, -3.584939, 1, 1, 1, 1, 1,
-0.6856531, -2.487844, -3.089621, 1, 1, 1, 1, 1,
-0.6835672, -1.169918, -2.491918, 1, 1, 1, 1, 1,
-0.680355, 0.08113095, -1.818298, 1, 1, 1, 1, 1,
-0.6794062, -0.4449585, -1.628882, 1, 1, 1, 1, 1,
-0.678729, -0.4039253, -0.6869434, 1, 1, 1, 1, 1,
-0.6767818, -0.4836311, -1.791514, 1, 1, 1, 1, 1,
-0.6701517, -0.8529875, -0.967073, 0, 0, 1, 1, 1,
-0.6638295, -1.124801, -2.420506, 1, 0, 0, 1, 1,
-0.6598381, 0.07841075, -1.396349, 1, 0, 0, 1, 1,
-0.6551802, -1.298351, -3.582741, 1, 0, 0, 1, 1,
-0.6551765, 1.003014, -1.286137, 1, 0, 0, 1, 1,
-0.6523727, -0.6630538, -2.652631, 1, 0, 0, 1, 1,
-0.6481574, 0.7358868, -0.150915, 0, 0, 0, 1, 1,
-0.6458737, -0.1349234, -2.455514, 0, 0, 0, 1, 1,
-0.6435402, 1.851043, -0.7438379, 0, 0, 0, 1, 1,
-0.6397578, 1.871191, 1.552469, 0, 0, 0, 1, 1,
-0.6319139, 1.878067, 0.5949347, 0, 0, 0, 1, 1,
-0.6287377, -0.2006927, -3.233218, 0, 0, 0, 1, 1,
-0.6228491, -0.3379197, -0.5691079, 0, 0, 0, 1, 1,
-0.6223421, 0.3287492, 0.3963385, 1, 1, 1, 1, 1,
-0.6174888, 0.7154201, -1.114354, 1, 1, 1, 1, 1,
-0.6169248, -0.388078, -1.95105, 1, 1, 1, 1, 1,
-0.6150421, 0.556092, -0.8259161, 1, 1, 1, 1, 1,
-0.609083, 1.635867, -1.35261, 1, 1, 1, 1, 1,
-0.606522, 1.572405, -0.8021392, 1, 1, 1, 1, 1,
-0.6032574, 1.889854, 1.4855, 1, 1, 1, 1, 1,
-0.5988697, -0.3321094, -2.952296, 1, 1, 1, 1, 1,
-0.5963349, 0.3234262, -1.444102, 1, 1, 1, 1, 1,
-0.595285, 1.062078, -1.001615, 1, 1, 1, 1, 1,
-0.5923297, 0.3182362, -0.4195518, 1, 1, 1, 1, 1,
-0.5922267, 0.1017906, 0.02784969, 1, 1, 1, 1, 1,
-0.5897648, 1.216102, -0.779878, 1, 1, 1, 1, 1,
-0.5875478, 1.143829, 0.7734134, 1, 1, 1, 1, 1,
-0.5856631, 0.9007329, -1.244771, 1, 1, 1, 1, 1,
-0.5837857, 0.2835083, -1.309396, 0, 0, 1, 1, 1,
-0.5786631, 0.03962337, -0.5732582, 1, 0, 0, 1, 1,
-0.5781377, -0.3657731, -4.525904, 1, 0, 0, 1, 1,
-0.5727516, -1.205891, -2.681534, 1, 0, 0, 1, 1,
-0.5720448, -0.6654598, -0.5087362, 1, 0, 0, 1, 1,
-0.5706539, -0.8852544, -3.561768, 1, 0, 0, 1, 1,
-0.5700051, -0.03988653, -0.5417287, 0, 0, 0, 1, 1,
-0.5539688, -0.210604, -1.443235, 0, 0, 0, 1, 1,
-0.5530701, -0.03919033, -3.498945, 0, 0, 0, 1, 1,
-0.5526109, -2.464843, -1.212296, 0, 0, 0, 1, 1,
-0.5445778, -0.07142806, -3.951952, 0, 0, 0, 1, 1,
-0.540812, 0.3662868, -1.009117, 0, 0, 0, 1, 1,
-0.5399339, -0.4779687, -3.172636, 0, 0, 0, 1, 1,
-0.5300631, 1.161966, 0.2438393, 1, 1, 1, 1, 1,
-0.5287476, -0.2850282, -2.568893, 1, 1, 1, 1, 1,
-0.5287465, -1.020316, -2.013963, 1, 1, 1, 1, 1,
-0.5222468, 1.86958, -0.7983448, 1, 1, 1, 1, 1,
-0.5206621, -0.1712059, -1.324619, 1, 1, 1, 1, 1,
-0.5197589, -0.3398705, -1.105964, 1, 1, 1, 1, 1,
-0.5191321, 0.5858908, -0.0364591, 1, 1, 1, 1, 1,
-0.510874, -0.9422452, -1.53846, 1, 1, 1, 1, 1,
-0.5085104, -1.30089, -1.510895, 1, 1, 1, 1, 1,
-0.5005738, 0.01306375, -2.069627, 1, 1, 1, 1, 1,
-0.4968989, 0.725504, -0.3297617, 1, 1, 1, 1, 1,
-0.4964251, 0.7499647, -0.008235113, 1, 1, 1, 1, 1,
-0.4926563, 1.012951, 0.3513659, 1, 1, 1, 1, 1,
-0.4864948, 0.2988973, -0.6158188, 1, 1, 1, 1, 1,
-0.4855562, 0.2780783, -0.7294866, 1, 1, 1, 1, 1,
-0.4805909, -0.9422333, -1.660405, 0, 0, 1, 1, 1,
-0.4795703, 0.2575967, -0.2099268, 1, 0, 0, 1, 1,
-0.4748897, 1.254846, 0.1361599, 1, 0, 0, 1, 1,
-0.4737121, -2.49394, -2.802937, 1, 0, 0, 1, 1,
-0.4696266, -0.4881994, -2.312198, 1, 0, 0, 1, 1,
-0.467975, -0.532833, -3.458906, 1, 0, 0, 1, 1,
-0.461777, -1.575517, -3.608134, 0, 0, 0, 1, 1,
-0.4586669, 0.3627291, 0.3783717, 0, 0, 0, 1, 1,
-0.4580601, 0.8463931, -1.908964, 0, 0, 0, 1, 1,
-0.4513373, -1.466146, -2.718769, 0, 0, 0, 1, 1,
-0.4432086, -1.254269, -2.855944, 0, 0, 0, 1, 1,
-0.436178, 1.716563, -2.092312, 0, 0, 0, 1, 1,
-0.4348716, 0.04880176, -2.494395, 0, 0, 0, 1, 1,
-0.4333584, -0.7496831, -1.288695, 1, 1, 1, 1, 1,
-0.4293784, 0.6188172, -0.178261, 1, 1, 1, 1, 1,
-0.4271513, 0.8194226, 0.1885302, 1, 1, 1, 1, 1,
-0.4221916, -0.1708596, -2.509864, 1, 1, 1, 1, 1,
-0.4206729, 1.110756, -0.9089984, 1, 1, 1, 1, 1,
-0.4170942, -0.2971478, -3.064433, 1, 1, 1, 1, 1,
-0.4118885, 0.7867262, 0.1024321, 1, 1, 1, 1, 1,
-0.4047942, 0.6155987, 0.6142698, 1, 1, 1, 1, 1,
-0.4041933, -0.8883563, -3.394105, 1, 1, 1, 1, 1,
-0.4037651, 0.003438421, -2.094641, 1, 1, 1, 1, 1,
-0.4033935, -1.345184, -2.773475, 1, 1, 1, 1, 1,
-0.4027414, -0.5381454, 0.759085, 1, 1, 1, 1, 1,
-0.40074, 0.7956106, -1.132751, 1, 1, 1, 1, 1,
-0.3980735, -0.2829285, -2.429603, 1, 1, 1, 1, 1,
-0.3973393, 0.922899, -3.18567, 1, 1, 1, 1, 1,
-0.3919609, -0.2451336, -1.265551, 0, 0, 1, 1, 1,
-0.3897456, 0.320871, -1.641889, 1, 0, 0, 1, 1,
-0.3890059, 0.5247304, -1.263287, 1, 0, 0, 1, 1,
-0.3846967, 0.7541746, -2.984495, 1, 0, 0, 1, 1,
-0.3837561, -1.516491, -5.048802, 1, 0, 0, 1, 1,
-0.3720331, 1.94002, 0.4601909, 1, 0, 0, 1, 1,
-0.3704621, -1.111864, -3.8853, 0, 0, 0, 1, 1,
-0.3697548, 1.651714, 1.488744, 0, 0, 0, 1, 1,
-0.3648046, -0.9664366, -2.734092, 0, 0, 0, 1, 1,
-0.3630261, -0.3405729, -0.5257393, 0, 0, 0, 1, 1,
-0.3626586, 1.20471, 0.5541759, 0, 0, 0, 1, 1,
-0.3621838, 0.7789018, 1.666075, 0, 0, 0, 1, 1,
-0.3614408, 1.143186, 0.9493172, 0, 0, 0, 1, 1,
-0.3553875, -1.325896, -2.361316, 1, 1, 1, 1, 1,
-0.3547585, 0.2692188, -0.4762631, 1, 1, 1, 1, 1,
-0.3541412, -0.2902579, -2.740447, 1, 1, 1, 1, 1,
-0.353794, 1.140616, 1.026533, 1, 1, 1, 1, 1,
-0.3519933, 0.2305492, -2.468305, 1, 1, 1, 1, 1,
-0.3514908, -0.1188041, -2.529294, 1, 1, 1, 1, 1,
-0.3455033, 1.683729, -0.8807262, 1, 1, 1, 1, 1,
-0.3421579, -0.2621358, -1.145661, 1, 1, 1, 1, 1,
-0.3420528, -0.2623612, -1.640758, 1, 1, 1, 1, 1,
-0.3386191, -0.5754818, -2.989474, 1, 1, 1, 1, 1,
-0.3373985, 0.5105369, -0.03056688, 1, 1, 1, 1, 1,
-0.3368807, 0.5347969, 0.1847189, 1, 1, 1, 1, 1,
-0.3265042, -1.008685, -0.153681, 1, 1, 1, 1, 1,
-0.3259878, 0.8138331, 2.015728, 1, 1, 1, 1, 1,
-0.3203574, -0.8673673, -1.024886, 1, 1, 1, 1, 1,
-0.3192846, 0.04432787, -2.694694, 0, 0, 1, 1, 1,
-0.3192028, 0.7185742, -0.5486045, 1, 0, 0, 1, 1,
-0.318922, 0.06342974, -1.975853, 1, 0, 0, 1, 1,
-0.3166751, -0.4810539, -2.812167, 1, 0, 0, 1, 1,
-0.3156158, -0.4106576, -1.999229, 1, 0, 0, 1, 1,
-0.3154849, -0.02142982, -2.864676, 1, 0, 0, 1, 1,
-0.3143348, 0.231159, -0.68264, 0, 0, 0, 1, 1,
-0.3134971, 0.1346355, -1.138744, 0, 0, 0, 1, 1,
-0.3064203, -1.774686, -2.421489, 0, 0, 0, 1, 1,
-0.3032273, -0.2730458, -1.784701, 0, 0, 0, 1, 1,
-0.3029552, 0.856216, 1.017421, 0, 0, 0, 1, 1,
-0.3028327, 0.3890994, -1.027202, 0, 0, 0, 1, 1,
-0.3016041, 0.5986019, -0.4896861, 0, 0, 0, 1, 1,
-0.3002548, 1.121251, -3.311806, 1, 1, 1, 1, 1,
-0.2971845, 0.07396019, -3.251311, 1, 1, 1, 1, 1,
-0.2968451, -0.4914998, -0.1734478, 1, 1, 1, 1, 1,
-0.2961698, 1.028832, -0.3351332, 1, 1, 1, 1, 1,
-0.2908692, 1.425211, -2.120984, 1, 1, 1, 1, 1,
-0.2876135, -1.763919, -3.676025, 1, 1, 1, 1, 1,
-0.2857742, 0.9419969, -2.146523, 1, 1, 1, 1, 1,
-0.2856895, 2.110402, 1.340116, 1, 1, 1, 1, 1,
-0.2763475, 1.578945, 0.5892418, 1, 1, 1, 1, 1,
-0.2761343, -0.6866311, -0.8043309, 1, 1, 1, 1, 1,
-0.2661019, -1.556283, -2.105505, 1, 1, 1, 1, 1,
-0.2659003, -0.3191055, -4.059852, 1, 1, 1, 1, 1,
-0.2648581, 1.800403, 0.3411146, 1, 1, 1, 1, 1,
-0.2592397, -0.6392593, -5.27189, 1, 1, 1, 1, 1,
-0.2590753, -3.216059, -3.711204, 1, 1, 1, 1, 1,
-0.2546552, 0.4860431, -0.3391462, 0, 0, 1, 1, 1,
-0.2495509, -0.5777285, -4.337224, 1, 0, 0, 1, 1,
-0.2495211, 0.4443644, -0.005841479, 1, 0, 0, 1, 1,
-0.2465466, 1.096651, -0.9347474, 1, 0, 0, 1, 1,
-0.2453546, -0.4412836, -2.587253, 1, 0, 0, 1, 1,
-0.2428895, -1.217885, -3.957264, 1, 0, 0, 1, 1,
-0.2369438, -0.2031821, -1.363154, 0, 0, 0, 1, 1,
-0.2320809, 0.4967091, -0.905813, 0, 0, 0, 1, 1,
-0.2318209, -0.001472914, -0.8740035, 0, 0, 0, 1, 1,
-0.2301262, -0.670292, -3.787656, 0, 0, 0, 1, 1,
-0.2264685, -0.4953234, -3.38595, 0, 0, 0, 1, 1,
-0.221888, -0.5119932, -1.438852, 0, 0, 0, 1, 1,
-0.2158742, -0.7658272, -4.183475, 0, 0, 0, 1, 1,
-0.2152156, -0.8676716, -2.981229, 1, 1, 1, 1, 1,
-0.2137097, 0.2054407, -0.1688822, 1, 1, 1, 1, 1,
-0.2133614, -0.4654125, -2.925655, 1, 1, 1, 1, 1,
-0.2130972, -0.5177789, -3.060739, 1, 1, 1, 1, 1,
-0.211819, -0.2436782, -1.451169, 1, 1, 1, 1, 1,
-0.2109097, 0.2869359, -0.8205589, 1, 1, 1, 1, 1,
-0.2064, -1.919014, -1.541669, 1, 1, 1, 1, 1,
-0.2040633, -0.009562573, 0.378698, 1, 1, 1, 1, 1,
-0.198647, 0.6386961, -1.272624, 1, 1, 1, 1, 1,
-0.198304, 0.1122658, -0.6536425, 1, 1, 1, 1, 1,
-0.1973806, 0.6231825, -0.03188132, 1, 1, 1, 1, 1,
-0.1916289, 1.116238, -1.002546, 1, 1, 1, 1, 1,
-0.1825443, 1.802074, -0.6707976, 1, 1, 1, 1, 1,
-0.1820764, 1.583066, 1.055453, 1, 1, 1, 1, 1,
-0.1706818, 0.8355011, -0.06147538, 1, 1, 1, 1, 1,
-0.1688489, 0.7382318, -0.4731686, 0, 0, 1, 1, 1,
-0.1664279, -0.6446555, -1.826483, 1, 0, 0, 1, 1,
-0.1654015, 0.2600715, -0.8324892, 1, 0, 0, 1, 1,
-0.1635155, -0.56335, -2.150303, 1, 0, 0, 1, 1,
-0.1631694, 0.910598, -0.5890371, 1, 0, 0, 1, 1,
-0.1601581, -1.601728, -4.199264, 1, 0, 0, 1, 1,
-0.1582413, 0.7415699, 0.6029749, 0, 0, 0, 1, 1,
-0.1524862, -0.5473889, -2.637642, 0, 0, 0, 1, 1,
-0.1520526, 0.75058, -2.021834, 0, 0, 0, 1, 1,
-0.1501593, -1.244795, -4.228014, 0, 0, 0, 1, 1,
-0.1495326, 0.05988201, -2.288934, 0, 0, 0, 1, 1,
-0.1485452, 0.2991728, 1.675691, 0, 0, 0, 1, 1,
-0.1466567, -0.4174165, -2.718347, 0, 0, 0, 1, 1,
-0.1456574, 0.2797782, -0.5095001, 1, 1, 1, 1, 1,
-0.1405673, -1.687419, -3.061449, 1, 1, 1, 1, 1,
-0.1397434, -1.593164, -2.510125, 1, 1, 1, 1, 1,
-0.1395369, 0.4560061, 0.6104356, 1, 1, 1, 1, 1,
-0.1393811, 0.3013925, -0.2860505, 1, 1, 1, 1, 1,
-0.1372699, -0.1125177, -3.161519, 1, 1, 1, 1, 1,
-0.1353622, 0.9549795, -0.02602391, 1, 1, 1, 1, 1,
-0.1347273, -1.028688, -3.153317, 1, 1, 1, 1, 1,
-0.1328312, 1.02778, -1.552811, 1, 1, 1, 1, 1,
-0.1321005, -0.1100348, -1.463304, 1, 1, 1, 1, 1,
-0.1259488, -0.5012434, -2.748208, 1, 1, 1, 1, 1,
-0.120519, -0.3886034, -4.286862, 1, 1, 1, 1, 1,
-0.1170586, 0.7011117, -0.8830274, 1, 1, 1, 1, 1,
-0.1118351, -1.838365, -2.149316, 1, 1, 1, 1, 1,
-0.10925, -1.562568, -3.940341, 1, 1, 1, 1, 1,
-0.103043, 0.4349905, -1.709249, 0, 0, 1, 1, 1,
-0.1030303, 0.313551, 1.039706, 1, 0, 0, 1, 1,
-0.1016231, 0.6293392, 0.7349163, 1, 0, 0, 1, 1,
-0.09975172, -0.2631978, -1.627699, 1, 0, 0, 1, 1,
-0.09597435, -1.2205, -6.059659, 1, 0, 0, 1, 1,
-0.09562948, -0.181298, -2.557769, 1, 0, 0, 1, 1,
-0.09506478, 0.3813638, -1.399674, 0, 0, 0, 1, 1,
-0.09485551, 0.197956, -0.5482659, 0, 0, 0, 1, 1,
-0.09007856, -0.7529266, -3.042527, 0, 0, 0, 1, 1,
-0.08879348, -0.6852466, -2.916908, 0, 0, 0, 1, 1,
-0.08164947, 0.82488, -0.01037125, 0, 0, 0, 1, 1,
-0.08064731, -1.137624, -2.584429, 0, 0, 0, 1, 1,
-0.07989118, 1.096869, 0.7820007, 0, 0, 0, 1, 1,
-0.07838962, 0.7775179, 0.83411, 1, 1, 1, 1, 1,
-0.07738969, -1.492823, -2.964908, 1, 1, 1, 1, 1,
-0.07635275, -1.438159, -4.128526, 1, 1, 1, 1, 1,
-0.07535037, -0.6734766, -4.162143, 1, 1, 1, 1, 1,
-0.07068142, -1.115101, -3.586003, 1, 1, 1, 1, 1,
-0.06922624, -0.6787293, -3.487922, 1, 1, 1, 1, 1,
-0.06700364, -0.8648312, -3.382442, 1, 1, 1, 1, 1,
-0.06647276, -0.5435039, -5.395601, 1, 1, 1, 1, 1,
-0.06553341, 0.03873889, -2.642402, 1, 1, 1, 1, 1,
-0.06403141, 0.09151495, -1.373537, 1, 1, 1, 1, 1,
-0.06388598, 0.2494146, -0.2346144, 1, 1, 1, 1, 1,
-0.059636, -1.465753, -2.512441, 1, 1, 1, 1, 1,
-0.0585207, 0.1274023, 0.3903576, 1, 1, 1, 1, 1,
-0.05533565, -0.1507793, -2.960126, 1, 1, 1, 1, 1,
-0.05147014, -0.3468857, -2.664657, 1, 1, 1, 1, 1,
-0.0514162, 0.08300855, -1.319507, 0, 0, 1, 1, 1,
-0.05127863, 1.09734, 0.8207228, 1, 0, 0, 1, 1,
-0.05099666, 0.7772892, -0.4400426, 1, 0, 0, 1, 1,
-0.04979639, 1.53031, 0.08074227, 1, 0, 0, 1, 1,
-0.04916696, -0.3504905, -4.603903, 1, 0, 0, 1, 1,
-0.04571727, 0.1956387, -0.5860769, 1, 0, 0, 1, 1,
-0.04381422, 1.281847, 0.406, 0, 0, 0, 1, 1,
-0.03752938, 1.805027, -0.3463701, 0, 0, 0, 1, 1,
-0.03333189, -1.689386, -2.569942, 0, 0, 0, 1, 1,
-0.02917245, -1.293241, -2.716769, 0, 0, 0, 1, 1,
-0.02764696, -0.167663, -4.315258, 0, 0, 0, 1, 1,
-0.02607772, 1.179617, 1.15512, 0, 0, 0, 1, 1,
-0.02113447, 0.06556108, -1.044547, 0, 0, 0, 1, 1,
-0.01832825, -0.7428359, -3.294547, 1, 1, 1, 1, 1,
-0.01557189, -0.2910393, -2.780221, 1, 1, 1, 1, 1,
-0.01209627, -0.7474105, -3.476199, 1, 1, 1, 1, 1,
-0.009159267, -0.716007, -2.428569, 1, 1, 1, 1, 1,
-0.00856364, -1.120716, -3.074093, 1, 1, 1, 1, 1,
-0.007092616, -0.3937344, -1.823763, 1, 1, 1, 1, 1,
-0.004925611, 0.02535963, 0.9109097, 1, 1, 1, 1, 1,
-0.003119151, 0.4455747, -1.358563, 1, 1, 1, 1, 1,
-0.001595862, 0.6031207, 0.5501592, 1, 1, 1, 1, 1,
0.004599869, -0.3048779, 2.219533, 1, 1, 1, 1, 1,
0.01095893, 0.05973215, 1.674431, 1, 1, 1, 1, 1,
0.0116932, -2.040808, 2.215291, 1, 1, 1, 1, 1,
0.01220133, -0.6277972, 2.642381, 1, 1, 1, 1, 1,
0.01366563, 0.1783728, -1.095131, 1, 1, 1, 1, 1,
0.01726743, 2.06179, 1.001709, 1, 1, 1, 1, 1,
0.01733935, -1.492524, 1.961907, 0, 0, 1, 1, 1,
0.01973421, 2.258233, -0.2465122, 1, 0, 0, 1, 1,
0.02218608, -0.6396697, 2.351009, 1, 0, 0, 1, 1,
0.02250507, -0.2219395, 3.740284, 1, 0, 0, 1, 1,
0.0229974, 0.5890567, -0.3551369, 1, 0, 0, 1, 1,
0.02315699, 0.5059985, 0.9591177, 1, 0, 0, 1, 1,
0.02571579, 0.3539872, 1.097862, 0, 0, 0, 1, 1,
0.02679854, -0.3402693, 4.304523, 0, 0, 0, 1, 1,
0.02721559, -0.1937553, 2.554471, 0, 0, 0, 1, 1,
0.0273213, -0.2745314, 1.812165, 0, 0, 0, 1, 1,
0.03402746, -0.2041384, 4.274336, 0, 0, 0, 1, 1,
0.03504273, 0.0493633, 1.552076, 0, 0, 0, 1, 1,
0.04093737, -1.604401, 2.649916, 0, 0, 0, 1, 1,
0.04139875, -0.4491583, 3.230964, 1, 1, 1, 1, 1,
0.04246655, -0.6179063, 3.896695, 1, 1, 1, 1, 1,
0.04316352, -0.4587378, 2.525462, 1, 1, 1, 1, 1,
0.04394979, -1.600913, 2.510364, 1, 1, 1, 1, 1,
0.04426555, 0.5689608, -0.1845021, 1, 1, 1, 1, 1,
0.045124, 1.016479, 1.740555, 1, 1, 1, 1, 1,
0.04564736, -0.8585312, 4.383255, 1, 1, 1, 1, 1,
0.04843488, 1.449923, -0.9103656, 1, 1, 1, 1, 1,
0.05596488, -2.025421, 4.331091, 1, 1, 1, 1, 1,
0.05856198, -0.8587986, 4.64755, 1, 1, 1, 1, 1,
0.05876946, 0.7446993, -0.008614586, 1, 1, 1, 1, 1,
0.0624436, 3.442287, 0.2624128, 1, 1, 1, 1, 1,
0.06348863, 0.2229661, 0.6556655, 1, 1, 1, 1, 1,
0.06498095, -0.8246194, 3.218695, 1, 1, 1, 1, 1,
0.06502292, -0.9494774, 3.062118, 1, 1, 1, 1, 1,
0.06514461, -0.05908944, 3.257577, 0, 0, 1, 1, 1,
0.06595065, -1.647858, 2.583621, 1, 0, 0, 1, 1,
0.06756324, -0.6839795, 4.128508, 1, 0, 0, 1, 1,
0.06829959, 1.786122, 1.742275, 1, 0, 0, 1, 1,
0.07612684, 0.2943025, 1.470163, 1, 0, 0, 1, 1,
0.07799184, -0.4054297, 4.0708, 1, 0, 0, 1, 1,
0.08087612, -0.5099165, 2.336469, 0, 0, 0, 1, 1,
0.08195134, 1.402919, -1.596766, 0, 0, 0, 1, 1,
0.08532492, -0.1891737, 3.024302, 0, 0, 0, 1, 1,
0.08551846, -1.552389, 3.551728, 0, 0, 0, 1, 1,
0.08833608, 0.2347919, 0.9420637, 0, 0, 0, 1, 1,
0.09002712, 1.50636, -0.9260873, 0, 0, 0, 1, 1,
0.09289332, 0.2790992, -0.724126, 0, 0, 0, 1, 1,
0.1010711, -0.01099565, 1.241233, 1, 1, 1, 1, 1,
0.1021867, -0.7724519, 2.717677, 1, 1, 1, 1, 1,
0.10499, -0.8729013, 3.200608, 1, 1, 1, 1, 1,
0.1093613, 0.7902293, 1.272066, 1, 1, 1, 1, 1,
0.1131607, -1.009591, 3.022189, 1, 1, 1, 1, 1,
0.1139782, 0.5783096, -0.1407124, 1, 1, 1, 1, 1,
0.1152292, -2.662937, 3.190459, 1, 1, 1, 1, 1,
0.116883, -1.483918, 1.015366, 1, 1, 1, 1, 1,
0.1174921, 0.8251008, -0.0882414, 1, 1, 1, 1, 1,
0.1201682, -0.9821996, 2.086213, 1, 1, 1, 1, 1,
0.1205193, -0.5038395, 2.180565, 1, 1, 1, 1, 1,
0.1225008, -0.919382, 2.355926, 1, 1, 1, 1, 1,
0.1228689, -2.00038, 5.848403, 1, 1, 1, 1, 1,
0.1239886, -0.2403138, 2.440972, 1, 1, 1, 1, 1,
0.12521, 0.9848216, 0.1163454, 1, 1, 1, 1, 1,
0.1440507, -0.9014903, 2.59438, 0, 0, 1, 1, 1,
0.1442083, -0.9528258, 1.119193, 1, 0, 0, 1, 1,
0.1457346, -0.4532328, 3.629846, 1, 0, 0, 1, 1,
0.1463395, 1.798157, 1.495029, 1, 0, 0, 1, 1,
0.146698, 1.084285, 1.4932, 1, 0, 0, 1, 1,
0.1505421, 0.2956341, -1.947421, 1, 0, 0, 1, 1,
0.1513029, -2.755896, 4.024412, 0, 0, 0, 1, 1,
0.1521935, 0.9183632, 1.016002, 0, 0, 0, 1, 1,
0.1536732, -0.6476855, 3.676464, 0, 0, 0, 1, 1,
0.1564493, 1.355767, -0.7916355, 0, 0, 0, 1, 1,
0.1574642, -0.1954852, 0.07115231, 0, 0, 0, 1, 1,
0.1585578, -1.357534, 2.982498, 0, 0, 0, 1, 1,
0.1586215, -0.9172409, 3.206648, 0, 0, 0, 1, 1,
0.1599107, 0.3663036, 1.157252, 1, 1, 1, 1, 1,
0.1602089, 1.609298, 1.471523, 1, 1, 1, 1, 1,
0.1615375, 0.9984481, 0.3368791, 1, 1, 1, 1, 1,
0.16186, 0.1371055, 0.7261895, 1, 1, 1, 1, 1,
0.1638233, 0.211186, -0.4335384, 1, 1, 1, 1, 1,
0.1666546, -1.159449, 3.209658, 1, 1, 1, 1, 1,
0.1667129, -0.6827086, 4.209529, 1, 1, 1, 1, 1,
0.1685862, 0.6712756, 1.167943, 1, 1, 1, 1, 1,
0.1714157, -0.8085618, 0.6220828, 1, 1, 1, 1, 1,
0.1719362, 0.8431404, 0.04878144, 1, 1, 1, 1, 1,
0.1732663, 0.8436833, 0.2147202, 1, 1, 1, 1, 1,
0.1740016, 0.6978543, 1.021604, 1, 1, 1, 1, 1,
0.1746117, 0.8961586, 0.3323816, 1, 1, 1, 1, 1,
0.1804784, -0.9797381, 2.787829, 1, 1, 1, 1, 1,
0.1830669, -0.3820187, 3.42013, 1, 1, 1, 1, 1,
0.1886665, 0.1325404, 0.8581337, 0, 0, 1, 1, 1,
0.1988284, 0.1883205, -0.2571865, 1, 0, 0, 1, 1,
0.2044104, -0.7473255, 1.066195, 1, 0, 0, 1, 1,
0.2052414, 2.409209, 1.153779, 1, 0, 0, 1, 1,
0.2061242, 0.7384585, -0.06696934, 1, 0, 0, 1, 1,
0.2079887, 0.03218066, 1.815195, 1, 0, 0, 1, 1,
0.2109152, -0.09071651, 1.651613, 0, 0, 0, 1, 1,
0.2124661, -0.6232149, 3.264678, 0, 0, 0, 1, 1,
0.2132466, -0.3143148, 1.202734, 0, 0, 0, 1, 1,
0.2177429, -0.8148571, 3.185613, 0, 0, 0, 1, 1,
0.2201299, -0.6679257, 3.463928, 0, 0, 0, 1, 1,
0.2211484, 1.458248, -0.5020966, 0, 0, 0, 1, 1,
0.2217026, -1.387864, 4.253368, 0, 0, 0, 1, 1,
0.2232544, -1.667713, 3.380563, 1, 1, 1, 1, 1,
0.2236867, 0.544454, 1.229588, 1, 1, 1, 1, 1,
0.2296916, 0.06517451, 2.514521, 1, 1, 1, 1, 1,
0.2307123, -0.6363603, 3.641599, 1, 1, 1, 1, 1,
0.233989, -0.5406737, 1.500716, 1, 1, 1, 1, 1,
0.2350657, 0.5057866, 2.506517, 1, 1, 1, 1, 1,
0.2353991, 0.4721809, -0.01908258, 1, 1, 1, 1, 1,
0.2387917, -0.707579, 0.9632882, 1, 1, 1, 1, 1,
0.2394694, -1.813861, 3.863962, 1, 1, 1, 1, 1,
0.2517557, 1.02059, -0.728555, 1, 1, 1, 1, 1,
0.2518854, -2.148315, 3.912148, 1, 1, 1, 1, 1,
0.2548717, 0.199132, 1.067307, 1, 1, 1, 1, 1,
0.2563943, -2.235354, 3.814816, 1, 1, 1, 1, 1,
0.2564728, -0.5824654, 2.530073, 1, 1, 1, 1, 1,
0.2644485, 1.177505, 1.046221, 1, 1, 1, 1, 1,
0.2658733, 1.237077, 0.3665022, 0, 0, 1, 1, 1,
0.2662157, -0.1100562, 2.352242, 1, 0, 0, 1, 1,
0.2733335, -0.539674, 3.9803, 1, 0, 0, 1, 1,
0.273396, -0.5101064, 2.550969, 1, 0, 0, 1, 1,
0.2749957, 0.08986716, 1.132635, 1, 0, 0, 1, 1,
0.283148, -0.5330047, 2.09529, 1, 0, 0, 1, 1,
0.2886306, -0.7000245, 3.336351, 0, 0, 0, 1, 1,
0.2893457, -0.03967358, 1.903754, 0, 0, 0, 1, 1,
0.2925065, 0.2355518, 1.299124, 0, 0, 0, 1, 1,
0.2948809, 1.013035, 1.094734, 0, 0, 0, 1, 1,
0.3018849, 0.230445, 0.3265122, 0, 0, 0, 1, 1,
0.3047068, -1.314718, 3.601153, 0, 0, 0, 1, 1,
0.3071571, 0.5785464, 1.120185, 0, 0, 0, 1, 1,
0.3073491, 0.2203963, 2.453366, 1, 1, 1, 1, 1,
0.3074854, 0.3722183, -0.8329547, 1, 1, 1, 1, 1,
0.3111211, 1.849476, 0.83939, 1, 1, 1, 1, 1,
0.3227184, 0.3160654, 2.667313, 1, 1, 1, 1, 1,
0.328398, 0.270667, 2.334174, 1, 1, 1, 1, 1,
0.3343481, -0.8448586, 4.9878, 1, 1, 1, 1, 1,
0.3378863, 0.9405344, 0.8031435, 1, 1, 1, 1, 1,
0.3384086, 0.7921606, 2.021814, 1, 1, 1, 1, 1,
0.3396024, -0.5368288, 2.005202, 1, 1, 1, 1, 1,
0.3409841, 1.212704, 0.08453708, 1, 1, 1, 1, 1,
0.3424285, -1.913367, 0.6957296, 1, 1, 1, 1, 1,
0.3506069, 0.04774557, 0.5322227, 1, 1, 1, 1, 1,
0.3512437, 0.9863108, -0.1730643, 1, 1, 1, 1, 1,
0.3520523, -0.2738896, 3.883379, 1, 1, 1, 1, 1,
0.3537992, 0.3450156, 0.4585575, 1, 1, 1, 1, 1,
0.3546588, -0.3600425, 1.377471, 0, 0, 1, 1, 1,
0.3581023, 0.9590033, 0.4659091, 1, 0, 0, 1, 1,
0.3583937, 0.4240358, 0.4587109, 1, 0, 0, 1, 1,
0.3599854, 0.6387982, 1.930204, 1, 0, 0, 1, 1,
0.3616498, -0.6339214, 3.186661, 1, 0, 0, 1, 1,
0.362265, 2.613552, 0.8419372, 1, 0, 0, 1, 1,
0.3804073, 0.7082218, 2.372427, 0, 0, 0, 1, 1,
0.3833882, -0.2239423, 3.465785, 0, 0, 0, 1, 1,
0.3887377, -0.08128709, -0.8172118, 0, 0, 0, 1, 1,
0.3903157, -0.00338801, 0.8364702, 0, 0, 0, 1, 1,
0.3917027, -1.29958, 2.038143, 0, 0, 0, 1, 1,
0.3950358, 2.495457, -0.3266504, 0, 0, 0, 1, 1,
0.3982988, 1.461848, 0.4476414, 0, 0, 0, 1, 1,
0.3999497, -1.188693, 1.945988, 1, 1, 1, 1, 1,
0.4000358, 0.5929177, 1.561665, 1, 1, 1, 1, 1,
0.402158, 1.27179, 1.43108, 1, 1, 1, 1, 1,
0.4059825, -0.7515226, 1.355358, 1, 1, 1, 1, 1,
0.4060516, 0.7128219, 2.106494, 1, 1, 1, 1, 1,
0.4076696, -0.1669238, 0.3758599, 1, 1, 1, 1, 1,
0.4120237, -0.4539104, 0.2534707, 1, 1, 1, 1, 1,
0.4132764, 3.076402, 0.08447598, 1, 1, 1, 1, 1,
0.4154342, 1.212554, -1.043457, 1, 1, 1, 1, 1,
0.4191222, 0.1275184, 1.795194, 1, 1, 1, 1, 1,
0.42238, -0.2104739, 0.8560442, 1, 1, 1, 1, 1,
0.4234535, 1.439312, -1.026998, 1, 1, 1, 1, 1,
0.4236655, -1.123365, 2.68888, 1, 1, 1, 1, 1,
0.4262637, 1.352178, -0.005943572, 1, 1, 1, 1, 1,
0.4270085, -1.201009, 3.418339, 1, 1, 1, 1, 1,
0.4312591, -0.4005473, 1.649598, 0, 0, 1, 1, 1,
0.4361795, 0.4242686, 1.973654, 1, 0, 0, 1, 1,
0.4407718, 1.992957, -0.01038542, 1, 0, 0, 1, 1,
0.4414718, -0.8284318, 3.972477, 1, 0, 0, 1, 1,
0.4464169, 0.5146327, 3.429626, 1, 0, 0, 1, 1,
0.4469082, 0.7098196, 2.005646, 1, 0, 0, 1, 1,
0.4492979, -0.6729009, 1.953907, 0, 0, 0, 1, 1,
0.4494873, 1.139431, -0.7257369, 0, 0, 0, 1, 1,
0.4513989, 0.3723671, 1.626075, 0, 0, 0, 1, 1,
0.4520167, -1.572679, 2.845503, 0, 0, 0, 1, 1,
0.4557103, -1.725864, 3.674215, 0, 0, 0, 1, 1,
0.4582263, -1.106474, 1.576627, 0, 0, 0, 1, 1,
0.4639457, -0.513792, 3.964482, 0, 0, 0, 1, 1,
0.4674708, -0.01285262, 2.382085, 1, 1, 1, 1, 1,
0.4707425, 0.2620746, 3.024731, 1, 1, 1, 1, 1,
0.4716888, -0.6157187, 2.877672, 1, 1, 1, 1, 1,
0.472391, -0.6059536, 2.088501, 1, 1, 1, 1, 1,
0.4734452, 0.4143836, -0.7281132, 1, 1, 1, 1, 1,
0.4753212, -0.4486983, 3.037219, 1, 1, 1, 1, 1,
0.4756896, 0.8484112, 0.08616062, 1, 1, 1, 1, 1,
0.4760909, 0.4299078, 3.235856, 1, 1, 1, 1, 1,
0.4782155, -0.4735872, 2.137624, 1, 1, 1, 1, 1,
0.4806957, 1.344933, 0.3722827, 1, 1, 1, 1, 1,
0.4841392, -1.319513, 3.032253, 1, 1, 1, 1, 1,
0.4874673, -0.1742263, 1.161182, 1, 1, 1, 1, 1,
0.4880224, -0.8975896, 2.115891, 1, 1, 1, 1, 1,
0.4921854, -0.1349015, 0.6830534, 1, 1, 1, 1, 1,
0.4932996, -0.5166096, 2.174024, 1, 1, 1, 1, 1,
0.4943489, 1.080261, 0.7014148, 0, 0, 1, 1, 1,
0.4946597, 0.9010152, -0.4618067, 1, 0, 0, 1, 1,
0.4963212, -0.5495778, 4.682811, 1, 0, 0, 1, 1,
0.5018778, -0.1436422, 2.001274, 1, 0, 0, 1, 1,
0.5020303, 0.6055998, 1.284344, 1, 0, 0, 1, 1,
0.5023586, 1.136325, 0.1353288, 1, 0, 0, 1, 1,
0.5114447, -0.9561546, 3.315385, 0, 0, 0, 1, 1,
0.51239, -0.0914835, 0.8329927, 0, 0, 0, 1, 1,
0.5152588, -1.357019, 3.289459, 0, 0, 0, 1, 1,
0.5162312, 0.474825, 1.127877, 0, 0, 0, 1, 1,
0.5186931, -2.179343, 4.167918, 0, 0, 0, 1, 1,
0.5198489, 1.643196, -1.257157, 0, 0, 0, 1, 1,
0.5210492, -2.199172, 3.7318, 0, 0, 0, 1, 1,
0.521888, -0.6088187, 3.650168, 1, 1, 1, 1, 1,
0.5232895, -0.8921795, 3.597854, 1, 1, 1, 1, 1,
0.5258893, 0.4177232, 2.128947, 1, 1, 1, 1, 1,
0.5305648, 0.3277848, 0.9943266, 1, 1, 1, 1, 1,
0.5323368, -1.586601, 2.271488, 1, 1, 1, 1, 1,
0.5324523, -0.512223, 4.508049, 1, 1, 1, 1, 1,
0.5334453, 0.2106979, 0.6290708, 1, 1, 1, 1, 1,
0.5349383, 0.8915365, -0.1955613, 1, 1, 1, 1, 1,
0.5438834, 0.02252783, 1.402386, 1, 1, 1, 1, 1,
0.5511824, 1.283504, 1.563036, 1, 1, 1, 1, 1,
0.5554361, -0.2203435, 2.210562, 1, 1, 1, 1, 1,
0.5568619, -1.397937, 1.885555, 1, 1, 1, 1, 1,
0.5620184, -0.3823663, 1.749917, 1, 1, 1, 1, 1,
0.5660633, 1.713692, -0.8457448, 1, 1, 1, 1, 1,
0.5680943, 0.5935179, 1.124333, 1, 1, 1, 1, 1,
0.5701421, 1.206347, 1.052073, 0, 0, 1, 1, 1,
0.5710078, 1.149018, -0.0594703, 1, 0, 0, 1, 1,
0.571444, 0.6696206, 1.61842, 1, 0, 0, 1, 1,
0.5717049, 0.9687026, 0.4789671, 1, 0, 0, 1, 1,
0.5731695, 1.204227, 0.5282158, 1, 0, 0, 1, 1,
0.574204, 0.7071139, -0.4400446, 1, 0, 0, 1, 1,
0.575493, 0.9485137, 1.365014, 0, 0, 0, 1, 1,
0.5767354, -0.8009021, 3.61854, 0, 0, 0, 1, 1,
0.5787385, -0.2514883, 3.350831, 0, 0, 0, 1, 1,
0.5831969, 0.4269035, 0.6124792, 0, 0, 0, 1, 1,
0.5843678, 1.238495, 0.5340012, 0, 0, 0, 1, 1,
0.5850101, -0.9256878, 2.703534, 0, 0, 0, 1, 1,
0.5906609, -1.100384, 3.007188, 0, 0, 0, 1, 1,
0.5972599, -0.8030964, 1.665279, 1, 1, 1, 1, 1,
0.600212, 0.1720689, -0.5292696, 1, 1, 1, 1, 1,
0.6029438, 0.710458, -0.9745203, 1, 1, 1, 1, 1,
0.6057498, 0.1877946, 3.02382, 1, 1, 1, 1, 1,
0.6121389, 0.3168525, -0.2663396, 1, 1, 1, 1, 1,
0.6145068, -2.227855, 2.787567, 1, 1, 1, 1, 1,
0.6146435, 0.6527044, 1.330967, 1, 1, 1, 1, 1,
0.6161081, 2.038496, -1.889317, 1, 1, 1, 1, 1,
0.6174829, -0.5266863, 4.869282, 1, 1, 1, 1, 1,
0.6197713, -0.7901589, 3.282096, 1, 1, 1, 1, 1,
0.6209692, -0.2134465, 1.169623, 1, 1, 1, 1, 1,
0.6276529, 0.5448232, 1.270589, 1, 1, 1, 1, 1,
0.6325937, 1.391014, -1.977234, 1, 1, 1, 1, 1,
0.6352177, -0.6238767, 3.167979, 1, 1, 1, 1, 1,
0.6427618, -0.2647543, 0.1823473, 1, 1, 1, 1, 1,
0.6461707, 0.5918842, 0.440062, 0, 0, 1, 1, 1,
0.6519471, -1.270168, 2.3504, 1, 0, 0, 1, 1,
0.6553995, -1.183426, 2.121419, 1, 0, 0, 1, 1,
0.6577822, -0.2843518, 2.76013, 1, 0, 0, 1, 1,
0.6624229, 0.915796, 0.7113212, 1, 0, 0, 1, 1,
0.6646094, 0.009720226, 0.2433097, 1, 0, 0, 1, 1,
0.6662351, -1.9366, 3.381947, 0, 0, 0, 1, 1,
0.6691973, 0.9858243, 1.303586, 0, 0, 0, 1, 1,
0.6699305, 0.8852723, -1.200793, 0, 0, 0, 1, 1,
0.6728888, -0.2905444, 0.1408027, 0, 0, 0, 1, 1,
0.6751489, -0.4252496, 3.523476, 0, 0, 0, 1, 1,
0.6755051, 0.6465469, 0.02058088, 0, 0, 0, 1, 1,
0.6780997, -0.3817057, 2.18929, 0, 0, 0, 1, 1,
0.682601, 0.4506641, 0.1862422, 1, 1, 1, 1, 1,
0.6852635, 0.5383158, 1.824962, 1, 1, 1, 1, 1,
0.6890357, 1.384763, -0.01922447, 1, 1, 1, 1, 1,
0.6942959, -1.178643, 3.526672, 1, 1, 1, 1, 1,
0.6994002, -1.339512, 1.57012, 1, 1, 1, 1, 1,
0.7033491, -1.422113, 0.3101216, 1, 1, 1, 1, 1,
0.7037632, -0.05953979, 3.958144, 1, 1, 1, 1, 1,
0.7043061, -1.998754, 1.716258, 1, 1, 1, 1, 1,
0.7045758, -1.671888, 2.581571, 1, 1, 1, 1, 1,
0.7051908, -0.09056567, 4.423606, 1, 1, 1, 1, 1,
0.717649, -1.136745, 4.022733, 1, 1, 1, 1, 1,
0.7220334, 0.3998953, -0.7252028, 1, 1, 1, 1, 1,
0.724353, -0.302527, 2.253106, 1, 1, 1, 1, 1,
0.7264183, 1.295039, 0.5950196, 1, 1, 1, 1, 1,
0.732115, -0.8559712, 4.70483, 1, 1, 1, 1, 1,
0.73585, 0.1610333, -0.7931924, 0, 0, 1, 1, 1,
0.7396445, 1.161932, 0.007210173, 1, 0, 0, 1, 1,
0.7396988, -0.2688565, 0.5217913, 1, 0, 0, 1, 1,
0.7408218, 0.456127, 1.971414, 1, 0, 0, 1, 1,
0.7414098, 1.301947, 0.06459174, 1, 0, 0, 1, 1,
0.7468951, -0.3322313, 1.668215, 1, 0, 0, 1, 1,
0.7476919, 0.6351832, 1.440353, 0, 0, 0, 1, 1,
0.7638207, -0.01867909, 1.114902, 0, 0, 0, 1, 1,
0.7688708, -0.6287464, 2.207253, 0, 0, 0, 1, 1,
0.774973, 1.413441, -0.3868377, 0, 0, 0, 1, 1,
0.7775391, 0.8742898, 0.8027004, 0, 0, 0, 1, 1,
0.7799937, -0.4666179, 1.07095, 0, 0, 0, 1, 1,
0.7836931, -0.08984735, 3.513668, 0, 0, 0, 1, 1,
0.7857556, -0.1306107, 3.104181, 1, 1, 1, 1, 1,
0.7992643, -1.000958, 1.756404, 1, 1, 1, 1, 1,
0.8005437, 1.262541, -1.670097, 1, 1, 1, 1, 1,
0.811875, 2.257418, 0.4196413, 1, 1, 1, 1, 1,
0.8175182, 0.9336572, 0.4465138, 1, 1, 1, 1, 1,
0.8219813, -0.6226728, 2.652167, 1, 1, 1, 1, 1,
0.8253674, 0.7266437, 0.649873, 1, 1, 1, 1, 1,
0.826008, -0.07918922, 0.6910194, 1, 1, 1, 1, 1,
0.8372616, 1.033827, 1.271332, 1, 1, 1, 1, 1,
0.8451664, 0.1584539, -0.07104069, 1, 1, 1, 1, 1,
0.8463527, -0.7464088, 2.329947, 1, 1, 1, 1, 1,
0.8513055, 0.5763589, -1.251703, 1, 1, 1, 1, 1,
0.8545383, 1.705344, -0.006500971, 1, 1, 1, 1, 1,
0.8574667, -0.0676021, 1.825457, 1, 1, 1, 1, 1,
0.8582856, -0.8381666, 2.052854, 1, 1, 1, 1, 1,
0.8610406, 1.126356, -1.973644, 0, 0, 1, 1, 1,
0.8621513, -1.467206, 3.957932, 1, 0, 0, 1, 1,
0.8735573, -0.1759687, 1.661072, 1, 0, 0, 1, 1,
0.8782379, 0.4211326, 2.007445, 1, 0, 0, 1, 1,
0.8862602, -0.06443914, 1.450072, 1, 0, 0, 1, 1,
0.8869612, 2.599406, -0.07688738, 1, 0, 0, 1, 1,
0.8875017, -1.786313, 2.522379, 0, 0, 0, 1, 1,
0.8972575, 0.867542, 1.347249, 0, 0, 0, 1, 1,
0.9039404, 0.2127487, 2.16403, 0, 0, 0, 1, 1,
0.9044327, -0.3041313, 2.097199, 0, 0, 0, 1, 1,
0.9062039, -0.8633161, 3.180574, 0, 0, 0, 1, 1,
0.909734, 0.8365635, 1.418943, 0, 0, 0, 1, 1,
0.9132295, -0.3203923, 2.072855, 0, 0, 0, 1, 1,
0.9140535, 0.7763037, 1.109414, 1, 1, 1, 1, 1,
0.9212455, -0.5855618, 1.281628, 1, 1, 1, 1, 1,
0.9275063, 0.6890696, 0.7861739, 1, 1, 1, 1, 1,
0.9318601, -0.2626531, 1.911612, 1, 1, 1, 1, 1,
0.9343594, 1.960647, 0.6591664, 1, 1, 1, 1, 1,
0.9349183, -0.313587, 2.219181, 1, 1, 1, 1, 1,
0.9368333, 1.773206, 1.113415, 1, 1, 1, 1, 1,
0.9444005, 1.297207, 0.9078283, 1, 1, 1, 1, 1,
0.955108, -0.6255442, 0.841883, 1, 1, 1, 1, 1,
0.9555883, 0.454008, 1.543345, 1, 1, 1, 1, 1,
0.9634519, -0.7672856, 2.591981, 1, 1, 1, 1, 1,
0.9651438, 1.429557, 1.476646, 1, 1, 1, 1, 1,
0.9726905, -0.1377349, 1.275162, 1, 1, 1, 1, 1,
0.9750945, 0.7957754, -0.05431196, 1, 1, 1, 1, 1,
0.9766985, 0.2248745, 1.403479, 1, 1, 1, 1, 1,
0.9806672, 0.7048927, 1.443903, 0, 0, 1, 1, 1,
0.985954, -0.8666283, 2.610379, 1, 0, 0, 1, 1,
0.986651, 0.06279431, -0.3672318, 1, 0, 0, 1, 1,
0.9904245, -0.6447002, 1.456194, 1, 0, 0, 1, 1,
0.9969572, 0.9332946, -0.3484542, 1, 0, 0, 1, 1,
0.9980119, 0.8859367, 2.257998, 1, 0, 0, 1, 1,
1.000083, -0.9997327, 3.238866, 0, 0, 0, 1, 1,
1.002149, 0.162701, 0.6777669, 0, 0, 0, 1, 1,
1.011082, 0.09248347, 2.109709, 0, 0, 0, 1, 1,
1.012489, 0.825204, 1.132861, 0, 0, 0, 1, 1,
1.015295, 1.100176, -0.2535253, 0, 0, 0, 1, 1,
1.015537, -0.6722531, 4.342606, 0, 0, 0, 1, 1,
1.01824, -2.019021, 2.958077, 0, 0, 0, 1, 1,
1.021004, -0.1546917, 0.9647616, 1, 1, 1, 1, 1,
1.036533, 0.5110641, 1.607506, 1, 1, 1, 1, 1,
1.050194, -0.6920947, 3.1443, 1, 1, 1, 1, 1,
1.057698, 0.9696144, 2.514296, 1, 1, 1, 1, 1,
1.061659, -1.109835, 3.538685, 1, 1, 1, 1, 1,
1.062155, -0.179881, 0.2617464, 1, 1, 1, 1, 1,
1.069037, -0.4828364, 0.9892808, 1, 1, 1, 1, 1,
1.074556, 0.1965441, 1.702218, 1, 1, 1, 1, 1,
1.075073, 0.4725205, 2.068449, 1, 1, 1, 1, 1,
1.077352, 0.6354595, 0.9060018, 1, 1, 1, 1, 1,
1.079308, 1.129863, 0.7973101, 1, 1, 1, 1, 1,
1.080523, -0.8719149, 3.654531, 1, 1, 1, 1, 1,
1.086504, 0.7549015, -0.7756494, 1, 1, 1, 1, 1,
1.086714, 0.5292982, 1.939787, 1, 1, 1, 1, 1,
1.102399, 0.1783645, 1.494178, 1, 1, 1, 1, 1,
1.109073, 1.652885, -0.06023585, 0, 0, 1, 1, 1,
1.112215, 0.1655788, 1.008852, 1, 0, 0, 1, 1,
1.114366, 1.078767, 1.300278, 1, 0, 0, 1, 1,
1.115113, -0.6988752, 1.723417, 1, 0, 0, 1, 1,
1.116119, 0.2963797, 1.389362, 1, 0, 0, 1, 1,
1.116214, 1.460687, -0.6959599, 1, 0, 0, 1, 1,
1.116618, -0.3035221, 0.410097, 0, 0, 0, 1, 1,
1.117872, 1.040909, -0.5485591, 0, 0, 0, 1, 1,
1.120981, 0.9754185, 1.803773, 0, 0, 0, 1, 1,
1.122387, 0.6306244, 0.989195, 0, 0, 0, 1, 1,
1.134709, 1.262825, 0.6805036, 0, 0, 0, 1, 1,
1.135391, -1.360675, 4.29057, 0, 0, 0, 1, 1,
1.136574, -0.4779249, 0.7337142, 0, 0, 0, 1, 1,
1.141711, 1.549901, 1.329959, 1, 1, 1, 1, 1,
1.144233, 0.1472038, 1.271796, 1, 1, 1, 1, 1,
1.146259, 1.493642, 0.7698879, 1, 1, 1, 1, 1,
1.147899, -1.008183, 0.1286368, 1, 1, 1, 1, 1,
1.148602, -0.4556439, 1.957373, 1, 1, 1, 1, 1,
1.150715, 0.01856566, 0.8491419, 1, 1, 1, 1, 1,
1.157045, -0.3991131, 2.736291, 1, 1, 1, 1, 1,
1.159058, 0.4599324, 0.727147, 1, 1, 1, 1, 1,
1.159879, -0.5274288, 1.779299, 1, 1, 1, 1, 1,
1.161807, 0.8547273, 1.278766, 1, 1, 1, 1, 1,
1.170726, -1.045372, 2.105929, 1, 1, 1, 1, 1,
1.174208, 1.329894, -1.023029, 1, 1, 1, 1, 1,
1.183957, 0.1622441, 0.3014383, 1, 1, 1, 1, 1,
1.193676, -0.8058189, 3.49524, 1, 1, 1, 1, 1,
1.202832, -0.01176803, 0.9251904, 1, 1, 1, 1, 1,
1.206255, -0.5198542, 2.756198, 0, 0, 1, 1, 1,
1.209994, -0.948393, 2.715189, 1, 0, 0, 1, 1,
1.215857, -0.6820325, 1.023474, 1, 0, 0, 1, 1,
1.217256, -0.7884121, 1.056227, 1, 0, 0, 1, 1,
1.217517, -0.3556225, 2.843114, 1, 0, 0, 1, 1,
1.220258, 0.1128069, 0.1429583, 1, 0, 0, 1, 1,
1.230741, -0.0748313, 2.348847, 0, 0, 0, 1, 1,
1.232611, -0.223075, 3.252431, 0, 0, 0, 1, 1,
1.244707, -0.1280353, 0.2889145, 0, 0, 0, 1, 1,
1.306857, 1.441281, 0.1639467, 0, 0, 0, 1, 1,
1.313634, 1.014587, 0.3227427, 0, 0, 0, 1, 1,
1.316136, 0.6779534, -0.3592754, 0, 0, 0, 1, 1,
1.318112, 0.1840869, 2.637934, 0, 0, 0, 1, 1,
1.328924, 1.648609, 1.30592, 1, 1, 1, 1, 1,
1.342454, -0.2336363, 0.4817774, 1, 1, 1, 1, 1,
1.344711, -0.7241239, 3.131535, 1, 1, 1, 1, 1,
1.345545, 0.08357766, 2.832122, 1, 1, 1, 1, 1,
1.352491, -0.2241712, 1.669514, 1, 1, 1, 1, 1,
1.354169, 1.800485, 1.578434, 1, 1, 1, 1, 1,
1.356978, -0.04510461, -0.3347136, 1, 1, 1, 1, 1,
1.368342, 0.2861634, 1.685214, 1, 1, 1, 1, 1,
1.369512, -1.093414, 2.260236, 1, 1, 1, 1, 1,
1.374569, -0.2444529, 0.3798284, 1, 1, 1, 1, 1,
1.376154, -0.6204275, 3.480559, 1, 1, 1, 1, 1,
1.376389, -1.018883, 0.9761056, 1, 1, 1, 1, 1,
1.386518, 0.06851263, 3.045283, 1, 1, 1, 1, 1,
1.38959, -0.3261085, 2.451927, 1, 1, 1, 1, 1,
1.411651, -0.6347201, 2.03121, 1, 1, 1, 1, 1,
1.412964, -0.942356, 3.289543, 0, 0, 1, 1, 1,
1.438601, -0.7016138, 3.257677, 1, 0, 0, 1, 1,
1.439986, -1.786701, 2.999088, 1, 0, 0, 1, 1,
1.441367, 0.2627187, 3.434905, 1, 0, 0, 1, 1,
1.45538, -2.714367, -0.06716616, 1, 0, 0, 1, 1,
1.461824, -2.186165, 3.085441, 1, 0, 0, 1, 1,
1.462795, -0.1974812, 2.948437, 0, 0, 0, 1, 1,
1.485131, 0.2580529, 0.3849688, 0, 0, 0, 1, 1,
1.485485, -0.8360227, 2.155055, 0, 0, 0, 1, 1,
1.496404, 0.4503997, 1.328573, 0, 0, 0, 1, 1,
1.500752, -1.011408, 2.931832, 0, 0, 0, 1, 1,
1.507908, -2.078626, 3.322956, 0, 0, 0, 1, 1,
1.516992, 1.062307, 0.2128633, 0, 0, 0, 1, 1,
1.521583, 2.332078, 1.302467, 1, 1, 1, 1, 1,
1.553512, 1.69463, 0.4663173, 1, 1, 1, 1, 1,
1.559002, 0.479497, 2.193518, 1, 1, 1, 1, 1,
1.562245, -0.9868603, 2.721909, 1, 1, 1, 1, 1,
1.570791, 0.5317644, 2.333774, 1, 1, 1, 1, 1,
1.573169, -2.006855, 3.47043, 1, 1, 1, 1, 1,
1.576281, 0.007387547, 1.823068, 1, 1, 1, 1, 1,
1.579153, -0.4491232, 1.634643, 1, 1, 1, 1, 1,
1.579825, -0.9944807, 2.395753, 1, 1, 1, 1, 1,
1.58046, -1.399184, 1.65144, 1, 1, 1, 1, 1,
1.581699, 0.9893734, 1.500138, 1, 1, 1, 1, 1,
1.605588, 0.4074733, 3.163477, 1, 1, 1, 1, 1,
1.610733, 1.115184, 0.9622435, 1, 1, 1, 1, 1,
1.61138, 2.67539, 0.1392493, 1, 1, 1, 1, 1,
1.618894, 1.120883, 1.941808, 1, 1, 1, 1, 1,
1.622333, -0.6824865, 1.065052, 0, 0, 1, 1, 1,
1.625177, -0.2211477, 3.077025, 1, 0, 0, 1, 1,
1.645255, 0.01118683, 2.902804, 1, 0, 0, 1, 1,
1.664953, 0.4823915, 1.799667, 1, 0, 0, 1, 1,
1.671347, 1.456258, 0.5318567, 1, 0, 0, 1, 1,
1.700845, -0.5359005, 1.795397, 1, 0, 0, 1, 1,
1.712285, -0.3145336, 1.977611, 0, 0, 0, 1, 1,
1.713844, -0.7340726, 2.883127, 0, 0, 0, 1, 1,
1.741024, -0.07949401, 2.807156, 0, 0, 0, 1, 1,
1.745425, 0.5610813, 0.4912513, 0, 0, 0, 1, 1,
1.756457, 0.4704953, 2.880817, 0, 0, 0, 1, 1,
1.76881, 0.6279639, 1.733583, 0, 0, 0, 1, 1,
1.769197, 0.1337799, 1.09854, 0, 0, 0, 1, 1,
1.774823, -0.08125561, 1.863892, 1, 1, 1, 1, 1,
1.783118, -0.3551416, 0.7557045, 1, 1, 1, 1, 1,
1.801774, 0.4613534, -0.2280777, 1, 1, 1, 1, 1,
1.806895, -2.023468, 2.351498, 1, 1, 1, 1, 1,
1.84885, -1.73476, 2.722098, 1, 1, 1, 1, 1,
1.860908, -0.5946761, 2.861051, 1, 1, 1, 1, 1,
1.871601, -0.7762464, 1.270704, 1, 1, 1, 1, 1,
1.915479, 0.3043022, 1.562004, 1, 1, 1, 1, 1,
1.921311, 0.7765946, 0.9158856, 1, 1, 1, 1, 1,
1.925563, 1.047533, 1.862619, 1, 1, 1, 1, 1,
1.962318, 1.172605, -0.04681198, 1, 1, 1, 1, 1,
1.965265, 0.9041667, -0.8678492, 1, 1, 1, 1, 1,
1.974467, -0.297867, 1.292817, 1, 1, 1, 1, 1,
2.040403, -0.2857428, 2.604959, 1, 1, 1, 1, 1,
2.04367, 0.6061141, 3.037189, 1, 1, 1, 1, 1,
2.079661, 0.3210177, 1.010384, 0, 0, 1, 1, 1,
2.101478, 0.07904899, 2.460232, 1, 0, 0, 1, 1,
2.10177, 0.7485009, -0.03926488, 1, 0, 0, 1, 1,
2.12976, -1.089602, -0.3218668, 1, 0, 0, 1, 1,
2.151743, 1.731449, 1.039615, 1, 0, 0, 1, 1,
2.191797, 1.854291, -0.4620748, 1, 0, 0, 1, 1,
2.196344, 0.8196698, 2.040718, 0, 0, 0, 1, 1,
2.233918, -0.6493039, 1.58948, 0, 0, 0, 1, 1,
2.274658, 0.4781036, 0.7893959, 0, 0, 0, 1, 1,
2.317996, 1.000548, 1.375377, 0, 0, 0, 1, 1,
2.340413, 0.6164303, 1.18768, 0, 0, 0, 1, 1,
2.387377, -0.03563931, 2.160915, 0, 0, 0, 1, 1,
2.428444, 2.863371, -0.09421666, 0, 0, 0, 1, 1,
2.429058, -1.553098, 1.747566, 1, 1, 1, 1, 1,
2.542465, -2.114765, 2.943098, 1, 1, 1, 1, 1,
2.584107, -1.530001, 0.286333, 1, 1, 1, 1, 1,
2.613258, -0.9827122, 3.032598, 1, 1, 1, 1, 1,
3.010771, -0.2011247, 1.677943, 1, 1, 1, 1, 1,
3.162638, -0.6461598, 1.36063, 1, 1, 1, 1, 1,
3.186774, -1.346557, 0.9596582, 1, 1, 1, 1, 1
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
var radius = 10.41081;
var distance = 36.56754;
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
mvMatrix.translate( 0.0613637, 0.3711474, 0.105628 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.56754);
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
