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
-3.223744, 0.5822893, -1.258621, 1, 0, 0, 1,
-2.818652, 1.580864, 0.2716404, 1, 0.007843138, 0, 1,
-2.713567, -1.920452, -1.807594, 1, 0.01176471, 0, 1,
-2.707983, -1.681915, -2.451996, 1, 0.01960784, 0, 1,
-2.700115, -0.2538382, -0.959854, 1, 0.02352941, 0, 1,
-2.633461, -0.1042988, -1.297939, 1, 0.03137255, 0, 1,
-2.610677, 0.4244081, -1.651424, 1, 0.03529412, 0, 1,
-2.599411, 0.2365314, -3.504345, 1, 0.04313726, 0, 1,
-2.487824, -0.3422387, -3.256052, 1, 0.04705882, 0, 1,
-2.396956, -0.2642528, -0.9588528, 1, 0.05490196, 0, 1,
-2.354393, -0.2467455, -1.901524, 1, 0.05882353, 0, 1,
-2.340656, 0.4489853, 0.3671152, 1, 0.06666667, 0, 1,
-2.333243, 0.3588142, -1.944537, 1, 0.07058824, 0, 1,
-2.316693, -1.686768, -3.140069, 1, 0.07843138, 0, 1,
-2.303785, 0.7314536, -2.940623, 1, 0.08235294, 0, 1,
-2.273296, 0.9780118, -1.364817, 1, 0.09019608, 0, 1,
-2.267436, 0.1868319, -2.337789, 1, 0.09411765, 0, 1,
-2.247542, 0.01731451, -1.534456, 1, 0.1019608, 0, 1,
-2.247135, -0.6174026, -2.486725, 1, 0.1098039, 0, 1,
-2.230793, 0.2406831, -1.797897, 1, 0.1137255, 0, 1,
-2.203939, -0.04199657, -0.7252377, 1, 0.1215686, 0, 1,
-2.196541, 0.8043886, -1.468615, 1, 0.1254902, 0, 1,
-2.145983, -1.54638, -3.028709, 1, 0.1333333, 0, 1,
-2.111279, -0.5412934, -1.57199, 1, 0.1372549, 0, 1,
-2.096658, -1.638338, -0.2519732, 1, 0.145098, 0, 1,
-2.055403, -1.279931, -1.775836, 1, 0.1490196, 0, 1,
-2.032773, 0.3876603, -2.630963, 1, 0.1568628, 0, 1,
-2.02536, -1.396464, -1.266147, 1, 0.1607843, 0, 1,
-2.010385, -1.938696, -2.612094, 1, 0.1686275, 0, 1,
-2.003767, 1.136805, -1.669862, 1, 0.172549, 0, 1,
-1.994328, -1.117867, -1.341439, 1, 0.1803922, 0, 1,
-1.988881, 0.5061807, 0.1133732, 1, 0.1843137, 0, 1,
-1.987688, -0.1910227, -2.985478, 1, 0.1921569, 0, 1,
-1.987318, 1.395918, -0.1295916, 1, 0.1960784, 0, 1,
-1.980341, -0.7462429, -1.45818, 1, 0.2039216, 0, 1,
-1.959935, 1.400497, 0.1983034, 1, 0.2117647, 0, 1,
-1.920268, -0.2551625, -0.5193579, 1, 0.2156863, 0, 1,
-1.911949, -0.746867, -2.465051, 1, 0.2235294, 0, 1,
-1.894593, -0.854818, -2.473923, 1, 0.227451, 0, 1,
-1.892407, 0.4934096, -0.3694059, 1, 0.2352941, 0, 1,
-1.844552, -0.8235333, -1.939907, 1, 0.2392157, 0, 1,
-1.838227, 0.4179197, -3.011405, 1, 0.2470588, 0, 1,
-1.837897, 0.955552, -2.466493, 1, 0.2509804, 0, 1,
-1.828163, 0.176174, 0.851517, 1, 0.2588235, 0, 1,
-1.824087, -0.1627087, -0.05175411, 1, 0.2627451, 0, 1,
-1.815371, 1.571946, -1.368072, 1, 0.2705882, 0, 1,
-1.803449, 1.678916, -1.682906, 1, 0.2745098, 0, 1,
-1.790934, 1.53009, -2.334436, 1, 0.282353, 0, 1,
-1.783497, -1.20215, -2.901695, 1, 0.2862745, 0, 1,
-1.77332, -1.326437, -2.922776, 1, 0.2941177, 0, 1,
-1.766545, 0.947261, -1.752158, 1, 0.3019608, 0, 1,
-1.746577, 0.1971173, -1.735355, 1, 0.3058824, 0, 1,
-1.745091, 1.572211, -2.097308, 1, 0.3137255, 0, 1,
-1.735106, 1.972788, 0.4345203, 1, 0.3176471, 0, 1,
-1.734514, -0.3694451, -0.5078878, 1, 0.3254902, 0, 1,
-1.719987, 1.360104, -0.8461223, 1, 0.3294118, 0, 1,
-1.713951, -1.006813, -0.4952721, 1, 0.3372549, 0, 1,
-1.713447, -0.2979183, 0.05425335, 1, 0.3411765, 0, 1,
-1.711671, -0.2832478, -2.595526, 1, 0.3490196, 0, 1,
-1.700691, 1.343195, -2.077258, 1, 0.3529412, 0, 1,
-1.686255, 0.09607091, -1.685571, 1, 0.3607843, 0, 1,
-1.670465, -0.7125715, -1.45344, 1, 0.3647059, 0, 1,
-1.663824, 1.345176, -0.01279397, 1, 0.372549, 0, 1,
-1.657972, 2.607176, -1.185884, 1, 0.3764706, 0, 1,
-1.642319, 0.4382393, -1.164315, 1, 0.3843137, 0, 1,
-1.61162, -0.7041807, -3.474338, 1, 0.3882353, 0, 1,
-1.611282, -0.4210044, -2.323088, 1, 0.3960784, 0, 1,
-1.602109, 0.2639935, -0.4795501, 1, 0.4039216, 0, 1,
-1.585521, -0.2833601, 0.2832679, 1, 0.4078431, 0, 1,
-1.569159, -0.2304826, -0.5425073, 1, 0.4156863, 0, 1,
-1.562681, 0.685913, -0.3760929, 1, 0.4196078, 0, 1,
-1.560894, -1.860985, -1.428006, 1, 0.427451, 0, 1,
-1.55443, -0.6220802, -3.829317, 1, 0.4313726, 0, 1,
-1.54924, -0.9913277, -3.464256, 1, 0.4392157, 0, 1,
-1.548569, 1.576779, -1.649525, 1, 0.4431373, 0, 1,
-1.541088, 2.124761, -0.7716609, 1, 0.4509804, 0, 1,
-1.54098, -0.08388965, -1.122151, 1, 0.454902, 0, 1,
-1.538435, -0.1736493, -0.6040616, 1, 0.4627451, 0, 1,
-1.531733, 1.083895, -1.417414, 1, 0.4666667, 0, 1,
-1.52547, 1.362542, -1.161451, 1, 0.4745098, 0, 1,
-1.500771, 0.3577113, -2.851081, 1, 0.4784314, 0, 1,
-1.497355, 0.2373423, -0.9417819, 1, 0.4862745, 0, 1,
-1.493385, 0.6177095, -0.4469585, 1, 0.4901961, 0, 1,
-1.491608, -0.5004063, -1.1636, 1, 0.4980392, 0, 1,
-1.489571, -0.1475737, -1.803393, 1, 0.5058824, 0, 1,
-1.479174, -0.8117951, -1.028328, 1, 0.509804, 0, 1,
-1.477793, -1.277732, -2.644323, 1, 0.5176471, 0, 1,
-1.476194, 0.02720303, 0.2314095, 1, 0.5215687, 0, 1,
-1.471725, -0.4321015, -1.904314, 1, 0.5294118, 0, 1,
-1.466457, 0.7703221, -1.205192, 1, 0.5333334, 0, 1,
-1.447418, -1.069346, -2.242598, 1, 0.5411765, 0, 1,
-1.442835, -0.1667549, -0.2923562, 1, 0.5450981, 0, 1,
-1.435587, -0.006551793, -4.059785, 1, 0.5529412, 0, 1,
-1.431139, 0.01468848, 0.07995787, 1, 0.5568628, 0, 1,
-1.398527, 0.9292792, -0.7229012, 1, 0.5647059, 0, 1,
-1.378378, -0.5683618, -2.57342, 1, 0.5686275, 0, 1,
-1.369456, 1.619578, -1.039508, 1, 0.5764706, 0, 1,
-1.365646, -0.3505674, -2.261603, 1, 0.5803922, 0, 1,
-1.363831, 0.8736575, -1.321806, 1, 0.5882353, 0, 1,
-1.360202, -0.1760632, -0.9077851, 1, 0.5921569, 0, 1,
-1.359099, -0.4380783, -1.7317, 1, 0.6, 0, 1,
-1.350679, -2.40795, -2.407053, 1, 0.6078432, 0, 1,
-1.34956, -0.0297771, -0.435414, 1, 0.6117647, 0, 1,
-1.349142, 0.5248188, -1.185579, 1, 0.6196079, 0, 1,
-1.345729, -1.69681, -1.108832, 1, 0.6235294, 0, 1,
-1.345176, -0.03705227, -2.174, 1, 0.6313726, 0, 1,
-1.340627, -0.8012279, -2.953468, 1, 0.6352941, 0, 1,
-1.33948, -2.117335, -3.508995, 1, 0.6431373, 0, 1,
-1.334054, 0.480473, -1.951392, 1, 0.6470588, 0, 1,
-1.330492, -0.6298429, -2.90864, 1, 0.654902, 0, 1,
-1.327433, 0.1837758, -0.6267852, 1, 0.6588235, 0, 1,
-1.325886, -0.2342233, -2.598175, 1, 0.6666667, 0, 1,
-1.322165, 0.9861978, -1.066782, 1, 0.6705883, 0, 1,
-1.300371, -2.150853, -2.186644, 1, 0.6784314, 0, 1,
-1.292839, -0.2795703, -0.2016664, 1, 0.682353, 0, 1,
-1.282969, -1.074324, -2.745563, 1, 0.6901961, 0, 1,
-1.279866, 0.02362872, -2.590496, 1, 0.6941177, 0, 1,
-1.277366, 0.185347, -1.67248, 1, 0.7019608, 0, 1,
-1.272346, 0.2812657, -0.3380627, 1, 0.7098039, 0, 1,
-1.268198, 0.1893467, -0.8162156, 1, 0.7137255, 0, 1,
-1.261236, -0.3083237, 0.3573665, 1, 0.7215686, 0, 1,
-1.255822, 0.6115218, 0.7735485, 1, 0.7254902, 0, 1,
-1.244345, -0.4119457, -2.528099, 1, 0.7333333, 0, 1,
-1.240747, 0.5834361, -1.656785, 1, 0.7372549, 0, 1,
-1.236818, 0.4020891, -0.8658398, 1, 0.7450981, 0, 1,
-1.235846, -0.3510386, -2.275155, 1, 0.7490196, 0, 1,
-1.226585, 1.139816, -1.863354, 1, 0.7568628, 0, 1,
-1.226436, 0.1789958, -0.8960596, 1, 0.7607843, 0, 1,
-1.225648, 1.10372, -1.897166, 1, 0.7686275, 0, 1,
-1.21261, -0.1915364, -1.222743, 1, 0.772549, 0, 1,
-1.209719, 0.3824169, -2.060401, 1, 0.7803922, 0, 1,
-1.206777, 1.140338, -0.3461672, 1, 0.7843137, 0, 1,
-1.204177, -0.1656415, -0.7073997, 1, 0.7921569, 0, 1,
-1.193688, -0.3434483, -1.829696, 1, 0.7960784, 0, 1,
-1.187926, 0.06961503, -0.05974427, 1, 0.8039216, 0, 1,
-1.183908, 0.6785226, -0.3588898, 1, 0.8117647, 0, 1,
-1.182513, 2.044913, -2.43889, 1, 0.8156863, 0, 1,
-1.174143, -0.3586462, -0.7908295, 1, 0.8235294, 0, 1,
-1.165893, -1.315459, -2.900828, 1, 0.827451, 0, 1,
-1.16424, 1.723869, -0.2225603, 1, 0.8352941, 0, 1,
-1.16303, -1.084296, -3.212144, 1, 0.8392157, 0, 1,
-1.162582, 0.7140169, 0.4045753, 1, 0.8470588, 0, 1,
-1.161231, 0.6199243, -0.4539384, 1, 0.8509804, 0, 1,
-1.159443, -0.5583737, -1.682977, 1, 0.8588235, 0, 1,
-1.140378, 1.015475, -1.723676, 1, 0.8627451, 0, 1,
-1.134406, 0.9146312, -0.7719935, 1, 0.8705882, 0, 1,
-1.121152, -0.1757462, -2.965069, 1, 0.8745098, 0, 1,
-1.119481, -1.837845, -3.393735, 1, 0.8823529, 0, 1,
-1.114322, 0.64939, 0.2075043, 1, 0.8862745, 0, 1,
-1.11092, -0.1591929, -2.278996, 1, 0.8941177, 0, 1,
-1.106213, -1.812022, -3.961466, 1, 0.8980392, 0, 1,
-1.102795, -0.04857533, -1.620991, 1, 0.9058824, 0, 1,
-1.090953, -0.05962482, -1.784032, 1, 0.9137255, 0, 1,
-1.088875, 0.441798, 0.280749, 1, 0.9176471, 0, 1,
-1.084524, -0.550871, -2.338774, 1, 0.9254902, 0, 1,
-1.082595, -1.176869, -0.9460054, 1, 0.9294118, 0, 1,
-1.072864, -1.052379, -1.514695, 1, 0.9372549, 0, 1,
-1.069603, 0.3446031, -1.747036, 1, 0.9411765, 0, 1,
-1.068329, 0.1540695, -1.757811, 1, 0.9490196, 0, 1,
-1.062066, -0.7771006, -2.414202, 1, 0.9529412, 0, 1,
-1.057335, -0.3055297, -1.226813, 1, 0.9607843, 0, 1,
-1.055431, 1.373503, 0.4315904, 1, 0.9647059, 0, 1,
-1.05236, 0.2789761, 0.1357908, 1, 0.972549, 0, 1,
-1.042555, 1.226233, -0.8285142, 1, 0.9764706, 0, 1,
-1.037849, 0.08831859, -1.538351, 1, 0.9843137, 0, 1,
-1.035424, 0.1497109, -3.400599, 1, 0.9882353, 0, 1,
-1.034895, -1.447091, -3.404555, 1, 0.9960784, 0, 1,
-1.03295, 1.174657, -1.170978, 0.9960784, 1, 0, 1,
-1.020807, -1.173617, -0.2227786, 0.9921569, 1, 0, 1,
-1.017645, -0.7853858, -2.338483, 0.9843137, 1, 0, 1,
-0.9840693, 1.350425, -0.05733551, 0.9803922, 1, 0, 1,
-0.9817001, 0.9364529, 0.2438886, 0.972549, 1, 0, 1,
-0.9813471, -0.2224045, -2.192838, 0.9686275, 1, 0, 1,
-0.9784636, -1.63772, -1.932528, 0.9607843, 1, 0, 1,
-0.9760206, 1.277299, -2.294933, 0.9568627, 1, 0, 1,
-0.9741573, -0.5819884, -2.71493, 0.9490196, 1, 0, 1,
-0.9694522, -0.9075977, -3.367767, 0.945098, 1, 0, 1,
-0.966422, 1.100781, -1.208918, 0.9372549, 1, 0, 1,
-0.9651598, 0.1926332, -2.123823, 0.9333333, 1, 0, 1,
-0.9608911, -1.185193, -4.083588, 0.9254902, 1, 0, 1,
-0.9574082, 2.004228, 0.1841134, 0.9215686, 1, 0, 1,
-0.9569761, -0.04043936, -0.9291217, 0.9137255, 1, 0, 1,
-0.9559985, -0.2533098, -0.6044496, 0.9098039, 1, 0, 1,
-0.9527971, 1.27053, 0.3585451, 0.9019608, 1, 0, 1,
-0.9526349, 1.174095, -0.6894957, 0.8941177, 1, 0, 1,
-0.9520739, 1.151423, -1.839057, 0.8901961, 1, 0, 1,
-0.9461047, 0.5082868, -1.138829, 0.8823529, 1, 0, 1,
-0.9445086, 0.9985383, 0.6634847, 0.8784314, 1, 0, 1,
-0.9326038, -1.448832, -2.915367, 0.8705882, 1, 0, 1,
-0.9228924, 0.4934698, -2.978553, 0.8666667, 1, 0, 1,
-0.9166051, 0.2118139, -1.57022, 0.8588235, 1, 0, 1,
-0.9081901, 0.3490929, -1.237761, 0.854902, 1, 0, 1,
-0.9078408, 0.4111345, -2.250541, 0.8470588, 1, 0, 1,
-0.8913308, -0.1990056, -2.128942, 0.8431373, 1, 0, 1,
-0.8848521, 1.021647, -1.188709, 0.8352941, 1, 0, 1,
-0.8722858, -0.140596, -1.500155, 0.8313726, 1, 0, 1,
-0.8634013, 2.139985, -1.219183, 0.8235294, 1, 0, 1,
-0.8606753, -0.7120411, -1.704973, 0.8196079, 1, 0, 1,
-0.8572842, 2.275271, -0.6426381, 0.8117647, 1, 0, 1,
-0.8568996, 0.1475944, -1.832875, 0.8078431, 1, 0, 1,
-0.8544372, -0.7583283, -1.867391, 0.8, 1, 0, 1,
-0.8490061, 0.7389987, -0.0638357, 0.7921569, 1, 0, 1,
-0.8440231, -0.2261237, -0.7963134, 0.7882353, 1, 0, 1,
-0.8383707, 1.064509, -0.08175154, 0.7803922, 1, 0, 1,
-0.8382447, -1.900086, -3.502676, 0.7764706, 1, 0, 1,
-0.8360131, 0.6760496, 0.1174788, 0.7686275, 1, 0, 1,
-0.8348083, -2.146353, -2.437465, 0.7647059, 1, 0, 1,
-0.8279328, 0.7449598, -0.4654325, 0.7568628, 1, 0, 1,
-0.8239367, -0.3947148, -2.523361, 0.7529412, 1, 0, 1,
-0.8197868, 0.3020741, -1.155476, 0.7450981, 1, 0, 1,
-0.8158695, -0.01551768, -1.314142, 0.7411765, 1, 0, 1,
-0.8131366, -1.615911, -3.120198, 0.7333333, 1, 0, 1,
-0.8075483, -1.653732, -1.721018, 0.7294118, 1, 0, 1,
-0.8039576, -1.562265, -3.424657, 0.7215686, 1, 0, 1,
-0.7912038, -0.006595051, -1.015952, 0.7176471, 1, 0, 1,
-0.7910088, 0.4209679, 0.8852304, 0.7098039, 1, 0, 1,
-0.7906881, 0.09084232, -3.170717, 0.7058824, 1, 0, 1,
-0.7902161, -0.3266627, -1.67763, 0.6980392, 1, 0, 1,
-0.7886339, 0.5689704, -0.406718, 0.6901961, 1, 0, 1,
-0.784493, -0.9823936, -3.684072, 0.6862745, 1, 0, 1,
-0.7841455, 1.789769, -0.9137815, 0.6784314, 1, 0, 1,
-0.7840325, 3.887057, 0.4036342, 0.6745098, 1, 0, 1,
-0.7829363, -1.687813, -2.500607, 0.6666667, 1, 0, 1,
-0.781155, 2.107435, 0.08135314, 0.6627451, 1, 0, 1,
-0.7772902, 0.1890608, -1.951375, 0.654902, 1, 0, 1,
-0.7769672, 1.615457, -1.695389, 0.6509804, 1, 0, 1,
-0.7730615, 0.4480921, -0.4266818, 0.6431373, 1, 0, 1,
-0.7618256, -0.3033448, -1.674504, 0.6392157, 1, 0, 1,
-0.7602327, -1.345664, -1.49538, 0.6313726, 1, 0, 1,
-0.7587349, -1.382102, -4.187203, 0.627451, 1, 0, 1,
-0.758579, -0.6403287, -2.948954, 0.6196079, 1, 0, 1,
-0.7581288, 2.092817, -0.1845032, 0.6156863, 1, 0, 1,
-0.7574711, 2.201749, 0.455896, 0.6078432, 1, 0, 1,
-0.7424355, 0.05151979, -1.753374, 0.6039216, 1, 0, 1,
-0.7354794, 1.132113, -1.21139, 0.5960785, 1, 0, 1,
-0.7346646, 1.373143, -0.5129146, 0.5882353, 1, 0, 1,
-0.733678, 0.8737974, -2.547723, 0.5843138, 1, 0, 1,
-0.7334359, 1.287863, 0.8058945, 0.5764706, 1, 0, 1,
-0.7331648, 0.0795003, -1.994478, 0.572549, 1, 0, 1,
-0.7326722, 0.4326724, -0.8591487, 0.5647059, 1, 0, 1,
-0.7322002, -0.1110929, -3.158494, 0.5607843, 1, 0, 1,
-0.7268127, 0.006619613, -0.6625623, 0.5529412, 1, 0, 1,
-0.7261663, 0.3363385, -1.590774, 0.5490196, 1, 0, 1,
-0.7198992, -1.178685, -3.635451, 0.5411765, 1, 0, 1,
-0.7160364, 0.2043927, -0.8415365, 0.5372549, 1, 0, 1,
-0.7137461, -0.1279015, -3.903082, 0.5294118, 1, 0, 1,
-0.7127013, 0.04413625, -2.926283, 0.5254902, 1, 0, 1,
-0.7092313, 0.5305479, 0.3905152, 0.5176471, 1, 0, 1,
-0.7012241, -1.48339, -4.747272, 0.5137255, 1, 0, 1,
-0.699127, 1.717027, -0.01545958, 0.5058824, 1, 0, 1,
-0.6988504, 1.162284, -1.300341, 0.5019608, 1, 0, 1,
-0.6987764, -0.3087463, -1.767913, 0.4941176, 1, 0, 1,
-0.6910475, -0.5001505, -2.447435, 0.4862745, 1, 0, 1,
-0.6872566, 0.8931402, -0.5136059, 0.4823529, 1, 0, 1,
-0.6864261, 0.0374405, 1.261755, 0.4745098, 1, 0, 1,
-0.6855416, -0.1177086, -2.660378, 0.4705882, 1, 0, 1,
-0.683692, 0.4879359, -1.07989, 0.4627451, 1, 0, 1,
-0.6815259, -0.2383219, -2.659802, 0.4588235, 1, 0, 1,
-0.6809834, -1.741729, -2.728829, 0.4509804, 1, 0, 1,
-0.6787615, -1.173797, -2.686914, 0.4470588, 1, 0, 1,
-0.6735241, 2.215259, 1.023448, 0.4392157, 1, 0, 1,
-0.6734706, 0.2493528, -2.278054, 0.4352941, 1, 0, 1,
-0.6729839, -1.777663, -2.5532, 0.427451, 1, 0, 1,
-0.6709441, -0.6457121, -2.59722, 0.4235294, 1, 0, 1,
-0.670513, 0.7453362, -1.010851, 0.4156863, 1, 0, 1,
-0.669744, -0.00875403, -1.202205, 0.4117647, 1, 0, 1,
-0.6688079, -0.1886454, -4.133182, 0.4039216, 1, 0, 1,
-0.6686338, -2.571017, -4.086088, 0.3960784, 1, 0, 1,
-0.6665744, -0.2667924, -2.003057, 0.3921569, 1, 0, 1,
-0.6661012, -0.3187611, -1.083493, 0.3843137, 1, 0, 1,
-0.6608006, -1.129914, -2.536807, 0.3803922, 1, 0, 1,
-0.6464012, 1.405686, 0.9464934, 0.372549, 1, 0, 1,
-0.6462197, -0.813277, -1.882364, 0.3686275, 1, 0, 1,
-0.639153, -0.0873397, -1.108262, 0.3607843, 1, 0, 1,
-0.6381978, -0.6766651, -1.555654, 0.3568628, 1, 0, 1,
-0.6358535, 0.6602879, -2.32068, 0.3490196, 1, 0, 1,
-0.6349222, 2.302775, 0.5636727, 0.345098, 1, 0, 1,
-0.6290992, 0.6106978, -0.9772059, 0.3372549, 1, 0, 1,
-0.6287994, 0.2652644, -1.226192, 0.3333333, 1, 0, 1,
-0.6264554, -0.6939279, -2.971414, 0.3254902, 1, 0, 1,
-0.6264313, -1.387331, -3.428514, 0.3215686, 1, 0, 1,
-0.6251007, -1.021767, -3.237115, 0.3137255, 1, 0, 1,
-0.6243436, -0.1326779, -1.362229, 0.3098039, 1, 0, 1,
-0.6234252, -0.9446892, -2.208844, 0.3019608, 1, 0, 1,
-0.6183732, 0.948172, -1.265991, 0.2941177, 1, 0, 1,
-0.6167676, 1.719703, 0.1309495, 0.2901961, 1, 0, 1,
-0.6145058, 0.1390803, -1.68754, 0.282353, 1, 0, 1,
-0.6056342, -0.1213554, -1.717965, 0.2784314, 1, 0, 1,
-0.6051164, -0.7422855, -1.713888, 0.2705882, 1, 0, 1,
-0.6031535, 1.547584, -1.25408, 0.2666667, 1, 0, 1,
-0.5987387, 0.06055388, -3.509639, 0.2588235, 1, 0, 1,
-0.5929281, -1.191763, -3.744643, 0.254902, 1, 0, 1,
-0.5907516, 1.64144, -0.2113926, 0.2470588, 1, 0, 1,
-0.588837, 0.4657136, -2.567205, 0.2431373, 1, 0, 1,
-0.5877571, -1.9255, -2.24795, 0.2352941, 1, 0, 1,
-0.5875065, 1.01464, -0.4066586, 0.2313726, 1, 0, 1,
-0.5870826, 2.194474, -0.8268033, 0.2235294, 1, 0, 1,
-0.579273, -0.5206321, -2.610152, 0.2196078, 1, 0, 1,
-0.5716407, 0.6281845, 0.1351802, 0.2117647, 1, 0, 1,
-0.5715408, -0.5313929, -1.771764, 0.2078431, 1, 0, 1,
-0.5661359, 0.8837391, -1.205742, 0.2, 1, 0, 1,
-0.5564076, 0.5789338, 0.7714481, 0.1921569, 1, 0, 1,
-0.553107, -0.001707077, -2.319739, 0.1882353, 1, 0, 1,
-0.5514385, -0.1904208, 0.7249463, 0.1803922, 1, 0, 1,
-0.5489488, -0.9332092, -2.216932, 0.1764706, 1, 0, 1,
-0.5477703, 1.900817, -1.807512, 0.1686275, 1, 0, 1,
-0.5452129, -0.06585341, -1.630659, 0.1647059, 1, 0, 1,
-0.544594, 0.6087757, -1.918754, 0.1568628, 1, 0, 1,
-0.5384293, 0.0417568, -1.626991, 0.1529412, 1, 0, 1,
-0.5369713, -2.207853, -2.776727, 0.145098, 1, 0, 1,
-0.5343682, 1.015443, -2.041514, 0.1411765, 1, 0, 1,
-0.527452, 1.212051, -0.8747098, 0.1333333, 1, 0, 1,
-0.5262029, -1.148732, -1.795967, 0.1294118, 1, 0, 1,
-0.5201183, 0.8498306, -0.842788, 0.1215686, 1, 0, 1,
-0.5181679, -1.2633, -3.616027, 0.1176471, 1, 0, 1,
-0.5181329, 0.9300864, -0.04140439, 0.1098039, 1, 0, 1,
-0.5169391, -1.997352, -2.633137, 0.1058824, 1, 0, 1,
-0.5130095, 2.106819, 0.4745382, 0.09803922, 1, 0, 1,
-0.5121281, -1.134437, -2.323174, 0.09019608, 1, 0, 1,
-0.5105652, 1.422083, 0.3979315, 0.08627451, 1, 0, 1,
-0.5103356, 1.598109, -0.05076984, 0.07843138, 1, 0, 1,
-0.5078909, 0.4692803, 0.179153, 0.07450981, 1, 0, 1,
-0.5056183, 1.458082, 0.4076135, 0.06666667, 1, 0, 1,
-0.5033351, -1.890242, -4.322043, 0.0627451, 1, 0, 1,
-0.4989941, 1.981146, -0.1305827, 0.05490196, 1, 0, 1,
-0.4929464, 0.5650041, 0.1865799, 0.05098039, 1, 0, 1,
-0.4906304, -1.186114, -1.84598, 0.04313726, 1, 0, 1,
-0.4897137, 0.2311877, -1.6134, 0.03921569, 1, 0, 1,
-0.4870089, -1.261729, -2.873009, 0.03137255, 1, 0, 1,
-0.4861814, -0.1001267, -0.1623332, 0.02745098, 1, 0, 1,
-0.4857233, -1.323299, -4.603884, 0.01960784, 1, 0, 1,
-0.4828994, -0.6824758, -2.803609, 0.01568628, 1, 0, 1,
-0.4800763, -0.5691049, -1.437281, 0.007843138, 1, 0, 1,
-0.4765868, 0.60444, -1.198978, 0.003921569, 1, 0, 1,
-0.4762481, -0.1485799, -2.068331, 0, 1, 0.003921569, 1,
-0.4742521, -0.5776051, -3.075308, 0, 1, 0.01176471, 1,
-0.4641329, -0.1780347, -2.551575, 0, 1, 0.01568628, 1,
-0.4627679, 0.16402, -3.155507, 0, 1, 0.02352941, 1,
-0.4622984, 0.03890725, -1.633349, 0, 1, 0.02745098, 1,
-0.4560339, -1.762318, -3.652137, 0, 1, 0.03529412, 1,
-0.4493653, -0.3527752, -2.238162, 0, 1, 0.03921569, 1,
-0.4489914, -0.5777253, -2.938667, 0, 1, 0.04705882, 1,
-0.4437748, -0.341171, -1.429851, 0, 1, 0.05098039, 1,
-0.4389887, -1.353199, -3.766439, 0, 1, 0.05882353, 1,
-0.4377221, 0.1488015, -1.150413, 0, 1, 0.0627451, 1,
-0.4287974, -0.3052896, -1.036612, 0, 1, 0.07058824, 1,
-0.4279324, -0.2120018, -2.534193, 0, 1, 0.07450981, 1,
-0.42619, 1.439115, -1.507426, 0, 1, 0.08235294, 1,
-0.4260677, 0.3378366, -1.66441, 0, 1, 0.08627451, 1,
-0.4239115, 0.9331088, 0.09488352, 0, 1, 0.09411765, 1,
-0.4115321, -0.4600959, -3.67375, 0, 1, 0.1019608, 1,
-0.4106902, 0.7494612, -1.991922, 0, 1, 0.1058824, 1,
-0.4044303, 1.353201, -0.7545806, 0, 1, 0.1137255, 1,
-0.402654, 1.147215, -0.9353791, 0, 1, 0.1176471, 1,
-0.398795, -1.516209, -3.929968, 0, 1, 0.1254902, 1,
-0.3931049, -0.1288002, -1.519682, 0, 1, 0.1294118, 1,
-0.3926966, -1.08372, -2.644588, 0, 1, 0.1372549, 1,
-0.3894074, 0.3466624, -0.5223846, 0, 1, 0.1411765, 1,
-0.3846561, 0.8931117, -1.963087, 0, 1, 0.1490196, 1,
-0.3823989, -0.6592727, -0.7840554, 0, 1, 0.1529412, 1,
-0.3805162, -0.5090967, -0.4037501, 0, 1, 0.1607843, 1,
-0.3772244, 0.6284354, -1.141379, 0, 1, 0.1647059, 1,
-0.3756552, -0.05454563, -1.14303, 0, 1, 0.172549, 1,
-0.372699, 1.248185, -1.226029, 0, 1, 0.1764706, 1,
-0.3724439, -0.4671966, -3.093785, 0, 1, 0.1843137, 1,
-0.3720631, -1.088194, -1.750244, 0, 1, 0.1882353, 1,
-0.3714528, 0.8553915, -3.218811, 0, 1, 0.1960784, 1,
-0.3708568, 1.622154, -1.097803, 0, 1, 0.2039216, 1,
-0.3704667, 0.05438567, -2.928049, 0, 1, 0.2078431, 1,
-0.3685602, -0.2525993, -1.566896, 0, 1, 0.2156863, 1,
-0.3615674, 2.27391, 0.1368399, 0, 1, 0.2196078, 1,
-0.3614901, 2.083043, 0.6528597, 0, 1, 0.227451, 1,
-0.359054, -2.839059, -4.045298, 0, 1, 0.2313726, 1,
-0.3587573, -0.6318963, -3.505591, 0, 1, 0.2392157, 1,
-0.3586649, 1.243889, 0.1685846, 0, 1, 0.2431373, 1,
-0.3569644, -0.0409632, -0.1187015, 0, 1, 0.2509804, 1,
-0.3565269, -0.5678473, -1.794685, 0, 1, 0.254902, 1,
-0.3563664, -0.5400267, -2.552797, 0, 1, 0.2627451, 1,
-0.355604, -0.07571906, -1.898666, 0, 1, 0.2666667, 1,
-0.3489107, 0.5666229, -0.3741942, 0, 1, 0.2745098, 1,
-0.3482035, 1.745437, 1.004884, 0, 1, 0.2784314, 1,
-0.3479668, -0.7299392, -2.683535, 0, 1, 0.2862745, 1,
-0.342706, 1.570115, 1.673188, 0, 1, 0.2901961, 1,
-0.3422855, 0.4983943, -0.8802403, 0, 1, 0.2980392, 1,
-0.3414085, -0.6171854, -2.67882, 0, 1, 0.3058824, 1,
-0.3394938, 0.381193, -1.095292, 0, 1, 0.3098039, 1,
-0.3385394, -0.2452811, -2.082916, 0, 1, 0.3176471, 1,
-0.3292519, 0.0977051, -1.674017, 0, 1, 0.3215686, 1,
-0.321721, -0.05392055, -1.503868, 0, 1, 0.3294118, 1,
-0.3178093, 0.9597127, -2.700927, 0, 1, 0.3333333, 1,
-0.3136506, 0.04219138, -0.7366617, 0, 1, 0.3411765, 1,
-0.3114052, 0.4709776, -0.313087, 0, 1, 0.345098, 1,
-0.3106662, -0.3623129, -3.510951, 0, 1, 0.3529412, 1,
-0.3004229, -2.099993, -3.595578, 0, 1, 0.3568628, 1,
-0.2956293, 0.2167862, -1.120234, 0, 1, 0.3647059, 1,
-0.2950409, -1.898695, -3.274803, 0, 1, 0.3686275, 1,
-0.2867621, -1.157931, -3.960145, 0, 1, 0.3764706, 1,
-0.2779692, -0.1590201, -1.986281, 0, 1, 0.3803922, 1,
-0.2760397, -1.745433, -2.40633, 0, 1, 0.3882353, 1,
-0.2755851, 0.5152121, -1.633086, 0, 1, 0.3921569, 1,
-0.2754175, -0.6407881, -3.864069, 0, 1, 0.4, 1,
-0.2723773, -0.2545931, -1.881953, 0, 1, 0.4078431, 1,
-0.2635914, -1.289118, -3.200578, 0, 1, 0.4117647, 1,
-0.2629123, -0.527144, -2.815452, 0, 1, 0.4196078, 1,
-0.2606263, 0.6957686, -0.5550042, 0, 1, 0.4235294, 1,
-0.253855, 0.6847975, -1.491701, 0, 1, 0.4313726, 1,
-0.2513715, 0.02226469, -0.6029847, 0, 1, 0.4352941, 1,
-0.2474932, 0.4157841, 0.03257487, 0, 1, 0.4431373, 1,
-0.2474368, 1.486961, 0.2262281, 0, 1, 0.4470588, 1,
-0.2418915, -0.02473342, -1.645464, 0, 1, 0.454902, 1,
-0.2406495, 0.6395751, -0.05103261, 0, 1, 0.4588235, 1,
-0.2264343, 0.2716706, 0.6789926, 0, 1, 0.4666667, 1,
-0.226113, -1.025128, -4.002234, 0, 1, 0.4705882, 1,
-0.2225146, -0.2625724, -0.8898643, 0, 1, 0.4784314, 1,
-0.2196717, -0.03367035, -1.178889, 0, 1, 0.4823529, 1,
-0.2192291, -0.01628629, -1.483206, 0, 1, 0.4901961, 1,
-0.2171652, 1.27459, -0.9533299, 0, 1, 0.4941176, 1,
-0.216572, 0.4479222, -1.60519, 0, 1, 0.5019608, 1,
-0.2140206, -1.766009, -1.308427, 0, 1, 0.509804, 1,
-0.2138017, 1.707214, 0.1903587, 0, 1, 0.5137255, 1,
-0.2137539, -1.353788, -2.081742, 0, 1, 0.5215687, 1,
-0.212626, 0.1857356, -0.6496471, 0, 1, 0.5254902, 1,
-0.2102244, -0.9850146, -2.949625, 0, 1, 0.5333334, 1,
-0.2101329, 0.6903434, 1.304355, 0, 1, 0.5372549, 1,
-0.2084948, 0.7760878, -0.2775444, 0, 1, 0.5450981, 1,
-0.2071992, -0.5583894, -1.735261, 0, 1, 0.5490196, 1,
-0.2031125, 1.035025, -0.8277148, 0, 1, 0.5568628, 1,
-0.2015005, -0.6836563, -2.701558, 0, 1, 0.5607843, 1,
-0.2010584, 1.938322, 0.1451732, 0, 1, 0.5686275, 1,
-0.1954924, 0.996931, 2.681217, 0, 1, 0.572549, 1,
-0.1951868, 0.004068685, -1.613117, 0, 1, 0.5803922, 1,
-0.193423, 0.04113227, -2.434459, 0, 1, 0.5843138, 1,
-0.1929338, 1.236688, 0.2776411, 0, 1, 0.5921569, 1,
-0.1887938, 0.5252606, 0.7077013, 0, 1, 0.5960785, 1,
-0.188194, -0.5395285, -4.876263, 0, 1, 0.6039216, 1,
-0.1875728, 1.160426, -2.710166, 0, 1, 0.6117647, 1,
-0.1861964, -0.5539091, -1.251103, 0, 1, 0.6156863, 1,
-0.1857922, 0.5351764, -0.1718795, 0, 1, 0.6235294, 1,
-0.1842788, 1.587746, -1.770015, 0, 1, 0.627451, 1,
-0.1841003, -1.284983, -4.4185, 0, 1, 0.6352941, 1,
-0.1765388, -0.04359948, -2.408111, 0, 1, 0.6392157, 1,
-0.1737479, -1.55729, -3.492711, 0, 1, 0.6470588, 1,
-0.1668727, 0.5019037, 0.2518361, 0, 1, 0.6509804, 1,
-0.1663162, 0.4098553, -0.4536637, 0, 1, 0.6588235, 1,
-0.1635475, 0.2105757, -0.4514138, 0, 1, 0.6627451, 1,
-0.1630069, 0.7819903, -0.009980171, 0, 1, 0.6705883, 1,
-0.1544561, 1.431002, -0.2182887, 0, 1, 0.6745098, 1,
-0.1502042, 1.085544, 0.1585714, 0, 1, 0.682353, 1,
-0.1456495, -0.6559229, -4.573139, 0, 1, 0.6862745, 1,
-0.1437658, 1.299656, 1.926006, 0, 1, 0.6941177, 1,
-0.1431617, 2.544194, 1.98887, 0, 1, 0.7019608, 1,
-0.1389495, 0.6291294, 0.6003562, 0, 1, 0.7058824, 1,
-0.1355825, 0.2140264, -0.4071789, 0, 1, 0.7137255, 1,
-0.1299299, 0.5246059, -1.428225, 0, 1, 0.7176471, 1,
-0.129153, -0.3783112, -1.69528, 0, 1, 0.7254902, 1,
-0.1278972, 0.6188717, 0.2092845, 0, 1, 0.7294118, 1,
-0.1275252, -0.8412775, -3.254838, 0, 1, 0.7372549, 1,
-0.1258164, -1.563533, -4.43851, 0, 1, 0.7411765, 1,
-0.1214107, 0.7299595, -0.784228, 0, 1, 0.7490196, 1,
-0.1131189, 0.9369128, 0.6601469, 0, 1, 0.7529412, 1,
-0.1106703, 1.76683, -0.5496873, 0, 1, 0.7607843, 1,
-0.1078168, 0.1732149, -0.6930656, 0, 1, 0.7647059, 1,
-0.1055247, -0.5231881, -3.035637, 0, 1, 0.772549, 1,
-0.1010955, 0.683039, -0.4659105, 0, 1, 0.7764706, 1,
-0.09857975, -0.8076103, -4.28302, 0, 1, 0.7843137, 1,
-0.09796821, 1.003333, -0.3478229, 0, 1, 0.7882353, 1,
-0.09465016, 0.5631114, 0.2989024, 0, 1, 0.7960784, 1,
-0.08624931, -0.8488753, -3.442091, 0, 1, 0.8039216, 1,
-0.08562186, 0.6031448, 0.04222072, 0, 1, 0.8078431, 1,
-0.08514142, 0.05137748, 0.3408943, 0, 1, 0.8156863, 1,
-0.0833888, -0.3241278, -1.990072, 0, 1, 0.8196079, 1,
-0.08273531, -1.450948, -3.109902, 0, 1, 0.827451, 1,
-0.08224169, -0.1821196, -2.586622, 0, 1, 0.8313726, 1,
-0.08143397, -0.2404469, -2.980741, 0, 1, 0.8392157, 1,
-0.081387, 1.333233, 0.8665559, 0, 1, 0.8431373, 1,
-0.07834119, -1.356456, -2.254626, 0, 1, 0.8509804, 1,
-0.07683823, 2.849551, 0.5330067, 0, 1, 0.854902, 1,
-0.07658859, 0.365469, 0.7134362, 0, 1, 0.8627451, 1,
-0.07370685, -0.3212068, -3.03842, 0, 1, 0.8666667, 1,
-0.07242225, -0.4888358, -2.280361, 0, 1, 0.8745098, 1,
-0.07088704, 2.149696, -0.5054979, 0, 1, 0.8784314, 1,
-0.07076974, 0.7240444, -0.1316009, 0, 1, 0.8862745, 1,
-0.06871758, -0.04272333, -2.850874, 0, 1, 0.8901961, 1,
-0.06535043, -1.22911, -1.155376, 0, 1, 0.8980392, 1,
-0.06439696, 0.202705, -2.290772, 0, 1, 0.9058824, 1,
-0.06202655, -0.6629189, -1.899663, 0, 1, 0.9098039, 1,
-0.06082372, -0.08246239, -3.044632, 0, 1, 0.9176471, 1,
-0.05926773, 1.490349, 0.137739, 0, 1, 0.9215686, 1,
-0.05632707, -0.9405342, -2.821184, 0, 1, 0.9294118, 1,
-0.05407302, -0.8977932, -3.345743, 0, 1, 0.9333333, 1,
-0.05283775, -1.284308, -3.511317, 0, 1, 0.9411765, 1,
-0.05145954, 0.1693384, -0.2502472, 0, 1, 0.945098, 1,
-0.04800388, 0.8465403, 1.029742, 0, 1, 0.9529412, 1,
-0.04776865, -1.220544, -5.598844, 0, 1, 0.9568627, 1,
-0.04183071, 0.4223592, -1.096653, 0, 1, 0.9647059, 1,
-0.03693739, 0.9303619, -1.13064, 0, 1, 0.9686275, 1,
-0.03494876, 1.156906, -1.130461, 0, 1, 0.9764706, 1,
-0.03494448, 0.2335719, 0.3943076, 0, 1, 0.9803922, 1,
-0.03447943, -0.1047752, -1.396353, 0, 1, 0.9882353, 1,
-0.03428192, -0.8817676, -3.580644, 0, 1, 0.9921569, 1,
-0.03224609, -0.3432687, -3.57303, 0, 1, 1, 1,
-0.02901563, 0.921081, 0.6473243, 0, 0.9921569, 1, 1,
-0.02730483, 1.280075, -0.5790319, 0, 0.9882353, 1, 1,
-0.02461363, 1.448208, 0.5120695, 0, 0.9803922, 1, 1,
-0.02105179, -0.9645578, -2.412421, 0, 0.9764706, 1, 1,
-0.0201423, 0.2727482, 1.445078, 0, 0.9686275, 1, 1,
-0.01704948, -0.2247452, -2.721652, 0, 0.9647059, 1, 1,
-0.01463824, 0.2546194, 0.7364874, 0, 0.9568627, 1, 1,
-0.008930551, -0.7345908, -3.639053, 0, 0.9529412, 1, 1,
-0.003397838, -0.3042083, -3.877063, 0, 0.945098, 1, 1,
-0.0006431855, -0.0923809, -1.801173, 0, 0.9411765, 1, 1,
-0.0005628893, 0.4916462, 1.384052, 0, 0.9333333, 1, 1,
-0.0001318172, -0.3206795, -1.934843, 0, 0.9294118, 1, 1,
0.001099543, -0.3024344, 4.348597, 0, 0.9215686, 1, 1,
0.005026243, 1.399261, 0.4659455, 0, 0.9176471, 1, 1,
0.007130081, 1.077919, -0.2627639, 0, 0.9098039, 1, 1,
0.01167221, 0.5555402, -2.473172, 0, 0.9058824, 1, 1,
0.01276881, -1.175003, 2.695752, 0, 0.8980392, 1, 1,
0.0144654, -0.2649341, 4.123459, 0, 0.8901961, 1, 1,
0.0144761, -1.97512, 3.327625, 0, 0.8862745, 1, 1,
0.01563101, -0.6825321, 4.556119, 0, 0.8784314, 1, 1,
0.01766636, 0.3092979, -1.378584, 0, 0.8745098, 1, 1,
0.0179428, -1.570925, 4.721863, 0, 0.8666667, 1, 1,
0.01964512, -0.7317413, 3.588151, 0, 0.8627451, 1, 1,
0.02260234, 2.155271, 0.883684, 0, 0.854902, 1, 1,
0.02355016, 0.8279163, 1.321911, 0, 0.8509804, 1, 1,
0.02508244, 1.030051, -0.2468988, 0, 0.8431373, 1, 1,
0.02638579, 0.0556742, 1.052622, 0, 0.8392157, 1, 1,
0.02947141, -0.5354127, 1.24715, 0, 0.8313726, 1, 1,
0.03031074, 0.2587154, 0.3288016, 0, 0.827451, 1, 1,
0.0305735, -1.124197, 2.070938, 0, 0.8196079, 1, 1,
0.03713016, 1.147801, 0.7281378, 0, 0.8156863, 1, 1,
0.03963797, 0.09178867, 0.4851777, 0, 0.8078431, 1, 1,
0.04686074, 0.2962032, 1.076714, 0, 0.8039216, 1, 1,
0.04769595, 1.150452, 0.7946787, 0, 0.7960784, 1, 1,
0.05556392, 0.3816455, -1.694267, 0, 0.7882353, 1, 1,
0.05757564, 1.201045, -0.6506267, 0, 0.7843137, 1, 1,
0.06527406, 1.434915, -0.5790051, 0, 0.7764706, 1, 1,
0.06564225, -0.6912893, 2.393019, 0, 0.772549, 1, 1,
0.06861649, -0.06005456, 2.09126, 0, 0.7647059, 1, 1,
0.06874399, -1.084737, 2.690742, 0, 0.7607843, 1, 1,
0.07070636, -1.631236, 2.923318, 0, 0.7529412, 1, 1,
0.0712778, 1.643245, -1.27515, 0, 0.7490196, 1, 1,
0.07209499, 0.8326862, 0.3442113, 0, 0.7411765, 1, 1,
0.07246398, 0.7228801, 0.1119874, 0, 0.7372549, 1, 1,
0.07263276, 0.07814346, -0.5523326, 0, 0.7294118, 1, 1,
0.073686, -1.513918, 1.544575, 0, 0.7254902, 1, 1,
0.07569713, -0.4271848, 3.635437, 0, 0.7176471, 1, 1,
0.07881927, 1.733683, 0.673063, 0, 0.7137255, 1, 1,
0.08559964, -0.008754672, 1.804115, 0, 0.7058824, 1, 1,
0.09722888, -0.7128578, 4.169991, 0, 0.6980392, 1, 1,
0.09784929, -0.1497917, 0.9900215, 0, 0.6941177, 1, 1,
0.1023165, -0.9866332, 4.198866, 0, 0.6862745, 1, 1,
0.1030809, 0.3304085, -0.06335273, 0, 0.682353, 1, 1,
0.1038133, -0.8299067, 0.6441789, 0, 0.6745098, 1, 1,
0.1062341, 1.313043, -0.6838496, 0, 0.6705883, 1, 1,
0.106673, -1.152328, 3.893226, 0, 0.6627451, 1, 1,
0.1076364, 0.4809193, -1.574988, 0, 0.6588235, 1, 1,
0.1085933, -0.3176413, 1.990504, 0, 0.6509804, 1, 1,
0.1115936, 1.948696, -0.09658223, 0, 0.6470588, 1, 1,
0.1125812, -0.01829093, 1.773784, 0, 0.6392157, 1, 1,
0.1146213, 1.915894, -0.5059467, 0, 0.6352941, 1, 1,
0.1148908, 0.8320334, -0.571022, 0, 0.627451, 1, 1,
0.1195894, -0.7625712, 2.574818, 0, 0.6235294, 1, 1,
0.1215353, 0.8175209, -0.3379103, 0, 0.6156863, 1, 1,
0.1220518, -2.145586, 1.541047, 0, 0.6117647, 1, 1,
0.1265189, -0.1669493, 3.610621, 0, 0.6039216, 1, 1,
0.1284903, 0.5982978, 0.1282377, 0, 0.5960785, 1, 1,
0.1373983, -1.038485, 3.461166, 0, 0.5921569, 1, 1,
0.1446162, -1.16311, 3.102372, 0, 0.5843138, 1, 1,
0.1452185, 0.5757146, 0.7374958, 0, 0.5803922, 1, 1,
0.1464329, 2.23817, -1.251339, 0, 0.572549, 1, 1,
0.1466348, 1.286236, -0.702523, 0, 0.5686275, 1, 1,
0.1472531, 0.1671467, 1.425224, 0, 0.5607843, 1, 1,
0.1492461, 0.992897, -0.5415264, 0, 0.5568628, 1, 1,
0.1517909, -1.746308, 2.385022, 0, 0.5490196, 1, 1,
0.1525133, -0.3818731, 2.466942, 0, 0.5450981, 1, 1,
0.1537167, -1.673682, 3.516072, 0, 0.5372549, 1, 1,
0.1560091, 1.808022, -1.061283, 0, 0.5333334, 1, 1,
0.1563518, 0.3981505, 0.979336, 0, 0.5254902, 1, 1,
0.1568971, 0.5117133, 1.92758, 0, 0.5215687, 1, 1,
0.1574907, -0.5291052, 2.94953, 0, 0.5137255, 1, 1,
0.17266, -0.6504714, 1.95579, 0, 0.509804, 1, 1,
0.173602, 1.210009, 1.6746, 0, 0.5019608, 1, 1,
0.1740458, -0.0977876, 1.836295, 0, 0.4941176, 1, 1,
0.1751682, -1.366917, 1.588948, 0, 0.4901961, 1, 1,
0.1756449, -0.5540905, 2.015261, 0, 0.4823529, 1, 1,
0.1756823, 1.074654, 1.395682, 0, 0.4784314, 1, 1,
0.1763534, 0.3851757, -0.2509821, 0, 0.4705882, 1, 1,
0.1779078, 0.4628568, 1.685916, 0, 0.4666667, 1, 1,
0.1823626, -1.010972, 3.524508, 0, 0.4588235, 1, 1,
0.1835468, 0.400604, -0.408809, 0, 0.454902, 1, 1,
0.1872951, 0.3833916, -1.57094, 0, 0.4470588, 1, 1,
0.1882773, 0.4098209, -0.4466749, 0, 0.4431373, 1, 1,
0.1886976, -0.7917477, 1.796725, 0, 0.4352941, 1, 1,
0.1897075, -0.1215541, 0.9084772, 0, 0.4313726, 1, 1,
0.1902468, 0.08127212, 2.057242, 0, 0.4235294, 1, 1,
0.1906164, -0.4554761, 2.360172, 0, 0.4196078, 1, 1,
0.1918363, -0.1156574, -0.5024067, 0, 0.4117647, 1, 1,
0.1931961, 0.261834, 2.173368, 0, 0.4078431, 1, 1,
0.1938075, 0.1687817, 0.4083912, 0, 0.4, 1, 1,
0.1960478, -1.114202, 5.023046, 0, 0.3921569, 1, 1,
0.1962961, -0.4953634, 1.997713, 0, 0.3882353, 1, 1,
0.196352, 1.186083, 1.353657, 0, 0.3803922, 1, 1,
0.1979862, 1.775476, 1.167231, 0, 0.3764706, 1, 1,
0.2025246, -0.107728, 0.6814824, 0, 0.3686275, 1, 1,
0.2104321, -2.098734, 5.192927, 0, 0.3647059, 1, 1,
0.2122672, 1.686094, 0.7474619, 0, 0.3568628, 1, 1,
0.2131613, 0.3218501, 1.656538, 0, 0.3529412, 1, 1,
0.2132186, 1.650015, 1.136068, 0, 0.345098, 1, 1,
0.2151294, -0.4642915, 2.337348, 0, 0.3411765, 1, 1,
0.2177385, -0.5378866, 2.199717, 0, 0.3333333, 1, 1,
0.2204757, 0.8281552, 1.401146, 0, 0.3294118, 1, 1,
0.2205581, -2.01991, 0.7545734, 0, 0.3215686, 1, 1,
0.2212355, -0.5925609, 3.643315, 0, 0.3176471, 1, 1,
0.2213574, 0.9146479, -0.4553343, 0, 0.3098039, 1, 1,
0.2237573, 0.8692856, -1.129888, 0, 0.3058824, 1, 1,
0.2250523, -0.3794773, 2.48496, 0, 0.2980392, 1, 1,
0.2265968, 0.4326351, 1.137595, 0, 0.2901961, 1, 1,
0.226704, -1.988479, 3.613585, 0, 0.2862745, 1, 1,
0.2288984, -0.4827908, 2.458162, 0, 0.2784314, 1, 1,
0.2331384, -2.51527, 2.244084, 0, 0.2745098, 1, 1,
0.237505, -1.306956, 2.179027, 0, 0.2666667, 1, 1,
0.2380879, -1.860931, 1.101524, 0, 0.2627451, 1, 1,
0.2436533, 0.7086785, -0.8331947, 0, 0.254902, 1, 1,
0.2490689, 0.1014044, 2.64568, 0, 0.2509804, 1, 1,
0.2497931, -1.36903, 3.308919, 0, 0.2431373, 1, 1,
0.2571785, -1.339027, 1.672745, 0, 0.2392157, 1, 1,
0.258175, -0.9214255, 2.778093, 0, 0.2313726, 1, 1,
0.2647213, -0.522249, 2.833041, 0, 0.227451, 1, 1,
0.2657957, 0.162912, 0.4265893, 0, 0.2196078, 1, 1,
0.2667552, 1.10041, 0.04242801, 0, 0.2156863, 1, 1,
0.2695797, -1.928381, 3.303565, 0, 0.2078431, 1, 1,
0.2714897, -0.9557512, 2.487775, 0, 0.2039216, 1, 1,
0.2751746, 1.447676, -0.1732811, 0, 0.1960784, 1, 1,
0.2791031, -0.4079398, 1.809402, 0, 0.1882353, 1, 1,
0.2809148, -0.5618654, 3.46499, 0, 0.1843137, 1, 1,
0.2835254, 0.1622184, -0.7579334, 0, 0.1764706, 1, 1,
0.2846705, 1.100267, -0.1591215, 0, 0.172549, 1, 1,
0.2900659, 0.6733418, 0.7488645, 0, 0.1647059, 1, 1,
0.2916985, 0.2692642, 1.910116, 0, 0.1607843, 1, 1,
0.2939318, 1.027171, 0.3490117, 0, 0.1529412, 1, 1,
0.2963275, -1.027911, 2.994876, 0, 0.1490196, 1, 1,
0.3006092, 0.6917051, 1.754371, 0, 0.1411765, 1, 1,
0.3018264, 0.4847083, 0.1446255, 0, 0.1372549, 1, 1,
0.3023798, 1.630818, 0.2317, 0, 0.1294118, 1, 1,
0.3025583, -0.646423, 3.443904, 0, 0.1254902, 1, 1,
0.3069817, 0.5449754, -0.7521449, 0, 0.1176471, 1, 1,
0.3086598, 0.552793, 1.247201, 0, 0.1137255, 1, 1,
0.3102487, -0.1751455, 2.644944, 0, 0.1058824, 1, 1,
0.3119852, 0.6083182, -0.5443837, 0, 0.09803922, 1, 1,
0.3126951, -1.067315, 2.326054, 0, 0.09411765, 1, 1,
0.3162039, 1.240113, 0.3111096, 0, 0.08627451, 1, 1,
0.316573, 1.110186, 1.651608, 0, 0.08235294, 1, 1,
0.3170395, -1.197587, 2.847368, 0, 0.07450981, 1, 1,
0.3189602, -0.6053413, 1.745137, 0, 0.07058824, 1, 1,
0.3240798, -0.02753943, 3.072171, 0, 0.0627451, 1, 1,
0.3293001, 0.2371339, 0.2329433, 0, 0.05882353, 1, 1,
0.3417363, -0.8965445, 2.773963, 0, 0.05098039, 1, 1,
0.3453861, -0.388043, 0.05683706, 0, 0.04705882, 1, 1,
0.3460996, -0.2220759, 2.418423, 0, 0.03921569, 1, 1,
0.3461974, 0.09473177, 0.9549052, 0, 0.03529412, 1, 1,
0.3489965, -0.3965602, 4.18194, 0, 0.02745098, 1, 1,
0.3551921, -1.200996, 2.638681, 0, 0.02352941, 1, 1,
0.3582908, 2.563486, 1.170253, 0, 0.01568628, 1, 1,
0.3610998, 0.3624167, 1.855172, 0, 0.01176471, 1, 1,
0.3618844, 0.6558914, 1.138576, 0, 0.003921569, 1, 1,
0.3727379, 0.7283935, -0.1214981, 0.003921569, 0, 1, 1,
0.373196, 0.4162645, 1.744147, 0.007843138, 0, 1, 1,
0.374642, 0.3310999, 2.051434, 0.01568628, 0, 1, 1,
0.3777371, 0.7289003, 0.6762832, 0.01960784, 0, 1, 1,
0.3802236, -1.151584, 2.056808, 0.02745098, 0, 1, 1,
0.3844433, 0.3688255, 2.060212, 0.03137255, 0, 1, 1,
0.3874324, -0.1223903, 1.681406, 0.03921569, 0, 1, 1,
0.3891769, 0.4408759, -1.319007, 0.04313726, 0, 1, 1,
0.392307, -0.860918, 4.218551, 0.05098039, 0, 1, 1,
0.3941221, -0.157484, 3.358742, 0.05490196, 0, 1, 1,
0.3976661, -0.8459781, 0.7241023, 0.0627451, 0, 1, 1,
0.4034445, -1.904039, 3.780576, 0.06666667, 0, 1, 1,
0.4055202, -0.2987891, -0.2465823, 0.07450981, 0, 1, 1,
0.4071277, 0.4193142, -0.2500801, 0.07843138, 0, 1, 1,
0.4083082, 1.638103, 0.8103654, 0.08627451, 0, 1, 1,
0.4178961, -0.007819044, -0.1360051, 0.09019608, 0, 1, 1,
0.4192671, -0.772567, 3.035981, 0.09803922, 0, 1, 1,
0.4228397, -0.8133581, 3.296074, 0.1058824, 0, 1, 1,
0.4231403, 0.9735874, 1.350451, 0.1098039, 0, 1, 1,
0.4240372, -1.173077, 2.247256, 0.1176471, 0, 1, 1,
0.4307086, 0.1797018, 2.226321, 0.1215686, 0, 1, 1,
0.4314199, 0.7622071, 0.1736683, 0.1294118, 0, 1, 1,
0.4352657, -0.9931036, 4.124946, 0.1333333, 0, 1, 1,
0.4353646, 0.6387689, -0.1702585, 0.1411765, 0, 1, 1,
0.4377831, 1.211066, -0.2129302, 0.145098, 0, 1, 1,
0.4409719, -0.2001135, 2.041768, 0.1529412, 0, 1, 1,
0.4413177, -1.388325, 3.081764, 0.1568628, 0, 1, 1,
0.4444032, 1.581135, 1.35591, 0.1647059, 0, 1, 1,
0.4481975, -0.5811121, 3.519753, 0.1686275, 0, 1, 1,
0.4484226, 0.04193367, 2.101636, 0.1764706, 0, 1, 1,
0.4498504, -0.2578378, 2.958275, 0.1803922, 0, 1, 1,
0.4502829, 0.3299947, 0.6075253, 0.1882353, 0, 1, 1,
0.4507312, 0.9647555, 0.547452, 0.1921569, 0, 1, 1,
0.4542908, 0.3546694, 1.704977, 0.2, 0, 1, 1,
0.4565456, 1.062976, 1.369391, 0.2078431, 0, 1, 1,
0.4596821, -0.2179426, 3.282961, 0.2117647, 0, 1, 1,
0.4612249, -0.5704318, 4.058022, 0.2196078, 0, 1, 1,
0.4628157, 1.343721, -0.8156891, 0.2235294, 0, 1, 1,
0.4703637, 0.2988465, 1.040291, 0.2313726, 0, 1, 1,
0.4756042, -0.6933911, 3.209574, 0.2352941, 0, 1, 1,
0.4840842, -1.6051, 3.005456, 0.2431373, 0, 1, 1,
0.4845701, -0.1976489, 2.983371, 0.2470588, 0, 1, 1,
0.4855987, 0.7708688, 0.7703376, 0.254902, 0, 1, 1,
0.4986514, 0.5880548, 1.337774, 0.2588235, 0, 1, 1,
0.5033978, 1.371507, 1.082288, 0.2666667, 0, 1, 1,
0.5059006, -2.671758, 2.298561, 0.2705882, 0, 1, 1,
0.5061908, -1.661784, 3.720071, 0.2784314, 0, 1, 1,
0.5073694, -0.379611, 1.839207, 0.282353, 0, 1, 1,
0.5143594, 0.473071, 2.908667, 0.2901961, 0, 1, 1,
0.5158904, -0.08094303, -0.1054091, 0.2941177, 0, 1, 1,
0.5181357, 0.879281, 1.838697, 0.3019608, 0, 1, 1,
0.5279196, 0.3122468, 0.5247362, 0.3098039, 0, 1, 1,
0.5280424, 0.7653622, -0.9532326, 0.3137255, 0, 1, 1,
0.5297791, 0.5862794, 1.180391, 0.3215686, 0, 1, 1,
0.5300002, -1.19076, 3.218908, 0.3254902, 0, 1, 1,
0.5310715, -1.449673, 2.168703, 0.3333333, 0, 1, 1,
0.5328103, 1.336105, 1.953506, 0.3372549, 0, 1, 1,
0.5361167, 0.3786603, 1.705324, 0.345098, 0, 1, 1,
0.538159, -1.182132, 3.670596, 0.3490196, 0, 1, 1,
0.5491846, -1.543848, 1.984049, 0.3568628, 0, 1, 1,
0.5522462, -2.152711, 2.659809, 0.3607843, 0, 1, 1,
0.5680159, -0.5317021, 1.920852, 0.3686275, 0, 1, 1,
0.570556, 0.8095842, 1.08823, 0.372549, 0, 1, 1,
0.575271, -1.133661, 3.488607, 0.3803922, 0, 1, 1,
0.5766029, 1.445649, 0.7965, 0.3843137, 0, 1, 1,
0.5775957, 1.169192, -0.6747432, 0.3921569, 0, 1, 1,
0.5801305, 1.464725, 1.58368, 0.3960784, 0, 1, 1,
0.5802225, -0.07291497, 1.81885, 0.4039216, 0, 1, 1,
0.5811248, 0.3266315, 0.9643489, 0.4117647, 0, 1, 1,
0.5829527, -1.656459, 2.94411, 0.4156863, 0, 1, 1,
0.5904264, 0.3789409, 0.1017811, 0.4235294, 0, 1, 1,
0.5916939, -0.03054425, 1.5045, 0.427451, 0, 1, 1,
0.5961241, -0.1827693, 2.412039, 0.4352941, 0, 1, 1,
0.5982568, 2.631289, 0.5771827, 0.4392157, 0, 1, 1,
0.599263, -1.324462, 3.68765, 0.4470588, 0, 1, 1,
0.6002722, 0.09232453, 0.5232388, 0.4509804, 0, 1, 1,
0.6009381, -0.9457679, 0.9688419, 0.4588235, 0, 1, 1,
0.6037245, 0.3284198, 1.899447, 0.4627451, 0, 1, 1,
0.609075, -0.9243642, 1.522833, 0.4705882, 0, 1, 1,
0.6103588, -0.2356014, 3.843601, 0.4745098, 0, 1, 1,
0.6132927, -1.497338, 3.322956, 0.4823529, 0, 1, 1,
0.6193793, -0.2265093, 0.8943956, 0.4862745, 0, 1, 1,
0.6202925, 0.2038606, 0.5708421, 0.4941176, 0, 1, 1,
0.6294881, 1.326883, 0.2574617, 0.5019608, 0, 1, 1,
0.6305156, -0.06070377, 2.015354, 0.5058824, 0, 1, 1,
0.6319838, -0.4706069, 0.3573966, 0.5137255, 0, 1, 1,
0.6322753, -0.2203401, 2.636766, 0.5176471, 0, 1, 1,
0.6327831, -0.6558586, 2.049853, 0.5254902, 0, 1, 1,
0.6364231, 2.500604, -0.3772187, 0.5294118, 0, 1, 1,
0.6380014, 0.6774727, 0.2087919, 0.5372549, 0, 1, 1,
0.642455, 0.749361, 0.7788811, 0.5411765, 0, 1, 1,
0.6464621, -0.233593, 2.017279, 0.5490196, 0, 1, 1,
0.6537626, 0.9309176, 1.034037, 0.5529412, 0, 1, 1,
0.6555271, 0.9110084, 1.262218, 0.5607843, 0, 1, 1,
0.6569765, 0.00043973, 2.499761, 0.5647059, 0, 1, 1,
0.6675322, -0.5314933, 3.280546, 0.572549, 0, 1, 1,
0.6704837, -0.7088912, 2.501355, 0.5764706, 0, 1, 1,
0.674093, -1.069776, 2.416334, 0.5843138, 0, 1, 1,
0.6779069, 0.2363898, -0.5122653, 0.5882353, 0, 1, 1,
0.6824183, 1.365894, 0.6977027, 0.5960785, 0, 1, 1,
0.6922504, -0.8137714, 2.042172, 0.6039216, 0, 1, 1,
0.6965647, 1.29096, 1.01198, 0.6078432, 0, 1, 1,
0.697021, -1.573999, 2.303183, 0.6156863, 0, 1, 1,
0.6993046, 0.4738174, -0.214412, 0.6196079, 0, 1, 1,
0.7061701, -0.7794852, 2.72403, 0.627451, 0, 1, 1,
0.7098118, 0.1001641, 1.383533, 0.6313726, 0, 1, 1,
0.7210708, -0.7877527, 2.472034, 0.6392157, 0, 1, 1,
0.7215423, 1.029393, 1.489981, 0.6431373, 0, 1, 1,
0.7215616, -0.06840478, 2.286344, 0.6509804, 0, 1, 1,
0.7270618, -0.3626443, 1.507871, 0.654902, 0, 1, 1,
0.735162, -0.8957046, 1.524294, 0.6627451, 0, 1, 1,
0.7362156, 1.126319, -0.6404052, 0.6666667, 0, 1, 1,
0.7394924, -0.8481104, 4.453945, 0.6745098, 0, 1, 1,
0.7449207, -0.2601794, 1.100753, 0.6784314, 0, 1, 1,
0.7504781, -0.1409052, 2.885559, 0.6862745, 0, 1, 1,
0.7521004, -2.678127, 3.949679, 0.6901961, 0, 1, 1,
0.7525514, -0.3003012, 2.056337, 0.6980392, 0, 1, 1,
0.7586747, -0.8877396, 3.504071, 0.7058824, 0, 1, 1,
0.7649372, 0.4688298, 0.7837829, 0.7098039, 0, 1, 1,
0.7652515, 0.9513267, 1.364255, 0.7176471, 0, 1, 1,
0.7681281, -0.09597563, 2.745061, 0.7215686, 0, 1, 1,
0.7692159, 0.4063055, 1.398864, 0.7294118, 0, 1, 1,
0.7773134, 0.220022, 1.424486, 0.7333333, 0, 1, 1,
0.7777071, 0.1213713, 1.886806, 0.7411765, 0, 1, 1,
0.777803, -1.65986, 2.964678, 0.7450981, 0, 1, 1,
0.7860031, 1.025499, 1.305796, 0.7529412, 0, 1, 1,
0.7903076, 1.647846, 1.505352, 0.7568628, 0, 1, 1,
0.7953926, 0.07666467, 1.144206, 0.7647059, 0, 1, 1,
0.7971622, 1.283239, -0.792638, 0.7686275, 0, 1, 1,
0.7972772, -0.4072097, 3.458824, 0.7764706, 0, 1, 1,
0.8029465, 0.3446972, -1.09678, 0.7803922, 0, 1, 1,
0.8071682, -1.075605, 4.09708, 0.7882353, 0, 1, 1,
0.8086962, 0.7574403, 0.7744186, 0.7921569, 0, 1, 1,
0.811073, -0.9215948, 3.807647, 0.8, 0, 1, 1,
0.8128153, 0.5214879, -0.2988783, 0.8078431, 0, 1, 1,
0.824177, 0.05294987, 1.611683, 0.8117647, 0, 1, 1,
0.8333482, -0.01619351, 2.423992, 0.8196079, 0, 1, 1,
0.8349909, 1.155164, -0.2938708, 0.8235294, 0, 1, 1,
0.8375452, -2.052321, 1.235093, 0.8313726, 0, 1, 1,
0.8438753, -0.6449478, 3.420054, 0.8352941, 0, 1, 1,
0.8451898, -0.4718226, 0.3940338, 0.8431373, 0, 1, 1,
0.8487778, 0.681181, 0.001370245, 0.8470588, 0, 1, 1,
0.8492398, -1.555639, 2.759719, 0.854902, 0, 1, 1,
0.8511486, -1.951114, 4.869065, 0.8588235, 0, 1, 1,
0.8546882, -1.029848, 3.005976, 0.8666667, 0, 1, 1,
0.8550308, -1.236362, 0.5393223, 0.8705882, 0, 1, 1,
0.8591364, -0.3928688, 1.830487, 0.8784314, 0, 1, 1,
0.8591806, -0.6596946, 1.715164, 0.8823529, 0, 1, 1,
0.861522, 1.500598, -0.4237488, 0.8901961, 0, 1, 1,
0.8641577, -1.128846, 2.198967, 0.8941177, 0, 1, 1,
0.8769602, -1.596179, 3.205142, 0.9019608, 0, 1, 1,
0.8876202, -0.8079221, 4.205866, 0.9098039, 0, 1, 1,
0.8959931, -0.01268821, 1.113153, 0.9137255, 0, 1, 1,
0.9041141, -0.8258429, 1.546533, 0.9215686, 0, 1, 1,
0.9048985, -2.03021, 2.954127, 0.9254902, 0, 1, 1,
0.9064442, 1.44508, -0.889847, 0.9333333, 0, 1, 1,
0.909615, -0.348828, 1.925772, 0.9372549, 0, 1, 1,
0.9178005, 0.005462736, 2.764664, 0.945098, 0, 1, 1,
0.9200421, -0.3655938, 1.153007, 0.9490196, 0, 1, 1,
0.9217473, -0.4181493, 1.630682, 0.9568627, 0, 1, 1,
0.9239547, 0.8850229, -0.2475103, 0.9607843, 0, 1, 1,
0.9293099, 0.4574727, 1.391635, 0.9686275, 0, 1, 1,
0.930537, -0.04982125, 2.155934, 0.972549, 0, 1, 1,
0.9327378, 1.747878, 0.1723232, 0.9803922, 0, 1, 1,
0.9333388, -0.8525543, 2.836881, 0.9843137, 0, 1, 1,
0.9350573, -0.4447843, 0.9884204, 0.9921569, 0, 1, 1,
0.9381475, -1.406582, 3.232526, 0.9960784, 0, 1, 1,
0.9406756, -0.05279296, 0.9761271, 1, 0, 0.9960784, 1,
0.9447139, 0.7891994, -0.5018805, 1, 0, 0.9882353, 1,
0.9462843, -0.2170928, 3.531702, 1, 0, 0.9843137, 1,
0.9474469, -0.6305445, 1.488574, 1, 0, 0.9764706, 1,
0.9501878, -0.4210274, 1.267994, 1, 0, 0.972549, 1,
0.9536424, -0.05428952, 1.518413, 1, 0, 0.9647059, 1,
0.9543883, -1.227395, 0.2191838, 1, 0, 0.9607843, 1,
0.9556479, -1.254828, 2.354771, 1, 0, 0.9529412, 1,
0.9610751, 1.757483, 1.448359, 1, 0, 0.9490196, 1,
0.962743, 0.3334554, 0.647288, 1, 0, 0.9411765, 1,
0.9665633, -0.7443545, 3.165509, 1, 0, 0.9372549, 1,
0.9776741, -0.6200804, 0.8941194, 1, 0, 0.9294118, 1,
0.9807782, -0.1274422, 1.79671, 1, 0, 0.9254902, 1,
0.9841276, 1.385081, 1.773676, 1, 0, 0.9176471, 1,
0.9846305, -1.106695, 0.8993549, 1, 0, 0.9137255, 1,
0.9870104, 0.5583995, -0.3436622, 1, 0, 0.9058824, 1,
1.006341, 0.593179, -1.292493, 1, 0, 0.9019608, 1,
1.012113, 0.8033521, 1.373945, 1, 0, 0.8941177, 1,
1.013028, 0.1651959, 1.259562, 1, 0, 0.8862745, 1,
1.015545, 0.5708974, 2.446598, 1, 0, 0.8823529, 1,
1.022441, -0.8988631, 2.947796, 1, 0, 0.8745098, 1,
1.0236, -2.657878, 1.308579, 1, 0, 0.8705882, 1,
1.024214, -0.2421881, 0.3556645, 1, 0, 0.8627451, 1,
1.0296, 0.3348118, 0.95298, 1, 0, 0.8588235, 1,
1.046155, -0.6391367, 1.093566, 1, 0, 0.8509804, 1,
1.047239, -0.4311423, 1.901895, 1, 0, 0.8470588, 1,
1.050015, 0.1961147, -1.000401, 1, 0, 0.8392157, 1,
1.051706, 0.003803993, 2.423007, 1, 0, 0.8352941, 1,
1.063581, -0.4298145, 1.222866, 1, 0, 0.827451, 1,
1.067902, -1.379458, 1.807052, 1, 0, 0.8235294, 1,
1.068385, -1.091599, 1.86991, 1, 0, 0.8156863, 1,
1.07302, 0.218858, 2.400157, 1, 0, 0.8117647, 1,
1.078675, 2.157253, -0.2650782, 1, 0, 0.8039216, 1,
1.088415, -1.744325, 4.773653, 1, 0, 0.7960784, 1,
1.095714, -1.875555, 1.035904, 1, 0, 0.7921569, 1,
1.097215, 0.5636261, 3.215331, 1, 0, 0.7843137, 1,
1.099547, 0.743666, 1.901892, 1, 0, 0.7803922, 1,
1.107274, -1.144428, 2.266483, 1, 0, 0.772549, 1,
1.110327, 0.4552583, 0.8659268, 1, 0, 0.7686275, 1,
1.119804, -0.1426355, -0.05913084, 1, 0, 0.7607843, 1,
1.122626, 0.08826474, 1.239058, 1, 0, 0.7568628, 1,
1.123722, -1.683566, 1.836488, 1, 0, 0.7490196, 1,
1.126751, -0.9721898, 0.8363682, 1, 0, 0.7450981, 1,
1.127945, -0.2789372, 1.900905, 1, 0, 0.7372549, 1,
1.132044, -0.9169101, 0.8078645, 1, 0, 0.7333333, 1,
1.137979, -0.7121264, 2.070561, 1, 0, 0.7254902, 1,
1.141731, 0.9716639, -0.1424858, 1, 0, 0.7215686, 1,
1.143432, 0.5016124, 1.271657, 1, 0, 0.7137255, 1,
1.153419, 0.9764907, 1.935668, 1, 0, 0.7098039, 1,
1.158646, 0.6768625, 0.9788694, 1, 0, 0.7019608, 1,
1.159595, 0.0800826, 1.431379, 1, 0, 0.6941177, 1,
1.160495, -0.8705525, 3.135753, 1, 0, 0.6901961, 1,
1.163149, 0.6493662, 1.058612, 1, 0, 0.682353, 1,
1.165821, -1.721067, 2.535469, 1, 0, 0.6784314, 1,
1.174209, -2.062598, 4.105391, 1, 0, 0.6705883, 1,
1.178004, -0.4635359, 1.335136, 1, 0, 0.6666667, 1,
1.183419, 0.3871268, 1.895727, 1, 0, 0.6588235, 1,
1.191385, 0.3052818, 0.6625599, 1, 0, 0.654902, 1,
1.191962, 2.156087, 0.7599044, 1, 0, 0.6470588, 1,
1.195134, 0.6912947, 1.401432, 1, 0, 0.6431373, 1,
1.197539, 0.4619458, 1.319351, 1, 0, 0.6352941, 1,
1.19974, 0.3195644, 0.8851755, 1, 0, 0.6313726, 1,
1.200807, -0.1926294, 0.6647453, 1, 0, 0.6235294, 1,
1.206472, 1.74153, 0.8839227, 1, 0, 0.6196079, 1,
1.206475, -0.1759412, 0.9352853, 1, 0, 0.6117647, 1,
1.214015, -0.3641079, 2.777608, 1, 0, 0.6078432, 1,
1.222388, -0.6016216, 1.290634, 1, 0, 0.6, 1,
1.223788, -1.487121, -0.04298243, 1, 0, 0.5921569, 1,
1.228129, 1.168232, 2.522188, 1, 0, 0.5882353, 1,
1.234816, 0.2827362, 0.7144362, 1, 0, 0.5803922, 1,
1.271645, -0.08498678, 3.494888, 1, 0, 0.5764706, 1,
1.273675, 0.7146832, 2.20044, 1, 0, 0.5686275, 1,
1.280507, 0.1870699, 1.924402, 1, 0, 0.5647059, 1,
1.282336, -0.570485, 0.9849368, 1, 0, 0.5568628, 1,
1.292918, 0.6804526, 1.542194, 1, 0, 0.5529412, 1,
1.296837, -0.2196247, 2.84538, 1, 0, 0.5450981, 1,
1.303014, 1.434369, 1.559461, 1, 0, 0.5411765, 1,
1.306781, -1.353827, 2.018284, 1, 0, 0.5333334, 1,
1.308929, 0.05081123, 0.8910068, 1, 0, 0.5294118, 1,
1.313029, -1.037937, 1.708149, 1, 0, 0.5215687, 1,
1.315558, -0.09043048, 1.72321, 1, 0, 0.5176471, 1,
1.327321, -0.9915224, 1.327976, 1, 0, 0.509804, 1,
1.342165, 0.4921784, 1.807967, 1, 0, 0.5058824, 1,
1.346501, 1.113729, 0.0370016, 1, 0, 0.4980392, 1,
1.350038, 0.03901428, 2.909148, 1, 0, 0.4901961, 1,
1.353829, 1.016405, -0.3340843, 1, 0, 0.4862745, 1,
1.363947, 0.1644, 1.618921, 1, 0, 0.4784314, 1,
1.378581, 1.132631, -0.16529, 1, 0, 0.4745098, 1,
1.385471, 0.2832505, 1.642845, 1, 0, 0.4666667, 1,
1.394491, 0.5765888, -0.1142505, 1, 0, 0.4627451, 1,
1.396481, 0.1738691, 1.999708, 1, 0, 0.454902, 1,
1.39815, -0.7200083, 3.083388, 1, 0, 0.4509804, 1,
1.404273, 0.1943939, 1.478566, 1, 0, 0.4431373, 1,
1.406176, 1.576725, 0.5798156, 1, 0, 0.4392157, 1,
1.408422, -0.4610176, 0.7849573, 1, 0, 0.4313726, 1,
1.415965, 0.8159376, -0.2294214, 1, 0, 0.427451, 1,
1.421985, -0.8334334, 1.879186, 1, 0, 0.4196078, 1,
1.423572, 0.38114, 2.152491, 1, 0, 0.4156863, 1,
1.439458, -0.3321134, 3.018201, 1, 0, 0.4078431, 1,
1.44089, -0.526899, 1.524309, 1, 0, 0.4039216, 1,
1.448644, 0.9282225, 1.785282, 1, 0, 0.3960784, 1,
1.452946, 1.176131, 0.8124945, 1, 0, 0.3882353, 1,
1.453292, 0.107028, 1.895728, 1, 0, 0.3843137, 1,
1.456031, -0.9461496, 2.057556, 1, 0, 0.3764706, 1,
1.457055, 0.3295995, 0.003800889, 1, 0, 0.372549, 1,
1.490837, 0.4823531, 4.351598, 1, 0, 0.3647059, 1,
1.502172, 0.4562381, -0.6146981, 1, 0, 0.3607843, 1,
1.503954, 1.057124, 0.4550422, 1, 0, 0.3529412, 1,
1.508995, 0.5836855, 1.397752, 1, 0, 0.3490196, 1,
1.526018, -1.289806, 2.711808, 1, 0, 0.3411765, 1,
1.529948, -0.5400442, 0.382654, 1, 0, 0.3372549, 1,
1.536658, 0.7091969, 1.185686, 1, 0, 0.3294118, 1,
1.543945, 0.08681719, 2.728745, 1, 0, 0.3254902, 1,
1.551206, 1.537352, 1.61528, 1, 0, 0.3176471, 1,
1.552216, -1.034081, 1.311141, 1, 0, 0.3137255, 1,
1.566819, -0.6656283, 1.455983, 1, 0, 0.3058824, 1,
1.570067, -0.03157172, 1.508317, 1, 0, 0.2980392, 1,
1.570708, -0.9413342, 0.9594641, 1, 0, 0.2941177, 1,
1.588412, -2.075743, 0.1170887, 1, 0, 0.2862745, 1,
1.599853, -0.2289224, 1.367327, 1, 0, 0.282353, 1,
1.601194, -0.7544041, 2.853106, 1, 0, 0.2745098, 1,
1.603415, -0.6250906, 1.615109, 1, 0, 0.2705882, 1,
1.605641, 1.482337, 0.3716193, 1, 0, 0.2627451, 1,
1.606602, 0.8587252, 0.5009792, 1, 0, 0.2588235, 1,
1.610268, -0.49377, -0.3566998, 1, 0, 0.2509804, 1,
1.622801, 0.3411075, 1.350029, 1, 0, 0.2470588, 1,
1.627542, 0.3920615, 1.213971, 1, 0, 0.2392157, 1,
1.643893, -0.6060649, 2.835372, 1, 0, 0.2352941, 1,
1.645288, 0.2417505, 2.146431, 1, 0, 0.227451, 1,
1.667671, -1.867175, 1.18839, 1, 0, 0.2235294, 1,
1.668629, 0.4599309, -0.1112515, 1, 0, 0.2156863, 1,
1.683831, 0.5206084, 2.355199, 1, 0, 0.2117647, 1,
1.69095, 1.302681, 0.4388974, 1, 0, 0.2039216, 1,
1.706443, -0.2907139, 0.6488746, 1, 0, 0.1960784, 1,
1.727674, -0.8030612, 3.647306, 1, 0, 0.1921569, 1,
1.738039, 1.447617, 1.893698, 1, 0, 0.1843137, 1,
1.738095, -0.4532682, -0.3152598, 1, 0, 0.1803922, 1,
1.741825, 0.3672005, 1.902999, 1, 0, 0.172549, 1,
1.774984, 1.61111, 0.4989263, 1, 0, 0.1686275, 1,
1.827414, -0.08218565, 1.729211, 1, 0, 0.1607843, 1,
1.834925, -1.054619, 1.305236, 1, 0, 0.1568628, 1,
1.857618, -1.669327, 3.082758, 1, 0, 0.1490196, 1,
1.863811, 1.083427, 2.348563, 1, 0, 0.145098, 1,
1.88449, 1.152093, -0.08805409, 1, 0, 0.1372549, 1,
1.89166, 0.2783777, 2.910127, 1, 0, 0.1333333, 1,
1.912707, 0.6413952, 1.826865, 1, 0, 0.1254902, 1,
1.923995, -1.417382, 0.9437616, 1, 0, 0.1215686, 1,
1.947858, -0.8043077, 1.905764, 1, 0, 0.1137255, 1,
1.952633, -0.2279618, 1.536381, 1, 0, 0.1098039, 1,
1.997465, -1.154527, 2.678868, 1, 0, 0.1019608, 1,
2.029707, 0.4183787, 0.7715837, 1, 0, 0.09411765, 1,
2.057328, 0.7984604, 0.6937712, 1, 0, 0.09019608, 1,
2.149846, -0.2950352, 0.7626011, 1, 0, 0.08235294, 1,
2.178284, -0.2636508, 3.027537, 1, 0, 0.07843138, 1,
2.184443, -1.379635, 2.438823, 1, 0, 0.07058824, 1,
2.186629, 0.02770367, 2.519475, 1, 0, 0.06666667, 1,
2.192123, 0.8727803, -0.1664221, 1, 0, 0.05882353, 1,
2.230104, 1.303276, 0.2584601, 1, 0, 0.05490196, 1,
2.2573, -0.3376728, 1.994219, 1, 0, 0.04705882, 1,
2.350711, 2.49484, 1.036283, 1, 0, 0.04313726, 1,
2.374663, -0.2200555, 0.4605957, 1, 0, 0.03529412, 1,
2.392144, -0.09342086, 2.470804, 1, 0, 0.03137255, 1,
2.394588, -0.4507339, 0.2423795, 1, 0, 0.02352941, 1,
2.394861, 0.918511, 1.644717, 1, 0, 0.01960784, 1,
2.718616, 0.6086466, 0.06414697, 1, 0, 0.01176471, 1,
3.020231, 0.000227718, 1.657368, 1, 0, 0.007843138, 1
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
-0.1017568, -3.979135, -7.428049, 0, -0.5, 0.5, 0.5,
-0.1017568, -3.979135, -7.428049, 1, -0.5, 0.5, 0.5,
-0.1017568, -3.979135, -7.428049, 1, 1.5, 0.5, 0.5,
-0.1017568, -3.979135, -7.428049, 0, 1.5, 0.5, 0.5
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
-4.282098, 0.5239991, -7.428049, 0, -0.5, 0.5, 0.5,
-4.282098, 0.5239991, -7.428049, 1, -0.5, 0.5, 0.5,
-4.282098, 0.5239991, -7.428049, 1, 1.5, 0.5, 0.5,
-4.282098, 0.5239991, -7.428049, 0, 1.5, 0.5, 0.5
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
-4.282098, -3.979135, -0.2029583, 0, -0.5, 0.5, 0.5,
-4.282098, -3.979135, -0.2029583, 1, -0.5, 0.5, 0.5,
-4.282098, -3.979135, -0.2029583, 1, 1.5, 0.5, 0.5,
-4.282098, -3.979135, -0.2029583, 0, 1.5, 0.5, 0.5
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
-3, -2.93995, -5.760721,
3, -2.93995, -5.760721,
-3, -2.93995, -5.760721,
-3, -3.113148, -6.038609,
-2, -2.93995, -5.760721,
-2, -3.113148, -6.038609,
-1, -2.93995, -5.760721,
-1, -3.113148, -6.038609,
0, -2.93995, -5.760721,
0, -3.113148, -6.038609,
1, -2.93995, -5.760721,
1, -3.113148, -6.038609,
2, -2.93995, -5.760721,
2, -3.113148, -6.038609,
3, -2.93995, -5.760721,
3, -3.113148, -6.038609
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
-3, -3.459543, -6.594385, 0, -0.5, 0.5, 0.5,
-3, -3.459543, -6.594385, 1, -0.5, 0.5, 0.5,
-3, -3.459543, -6.594385, 1, 1.5, 0.5, 0.5,
-3, -3.459543, -6.594385, 0, 1.5, 0.5, 0.5,
-2, -3.459543, -6.594385, 0, -0.5, 0.5, 0.5,
-2, -3.459543, -6.594385, 1, -0.5, 0.5, 0.5,
-2, -3.459543, -6.594385, 1, 1.5, 0.5, 0.5,
-2, -3.459543, -6.594385, 0, 1.5, 0.5, 0.5,
-1, -3.459543, -6.594385, 0, -0.5, 0.5, 0.5,
-1, -3.459543, -6.594385, 1, -0.5, 0.5, 0.5,
-1, -3.459543, -6.594385, 1, 1.5, 0.5, 0.5,
-1, -3.459543, -6.594385, 0, 1.5, 0.5, 0.5,
0, -3.459543, -6.594385, 0, -0.5, 0.5, 0.5,
0, -3.459543, -6.594385, 1, -0.5, 0.5, 0.5,
0, -3.459543, -6.594385, 1, 1.5, 0.5, 0.5,
0, -3.459543, -6.594385, 0, 1.5, 0.5, 0.5,
1, -3.459543, -6.594385, 0, -0.5, 0.5, 0.5,
1, -3.459543, -6.594385, 1, -0.5, 0.5, 0.5,
1, -3.459543, -6.594385, 1, 1.5, 0.5, 0.5,
1, -3.459543, -6.594385, 0, 1.5, 0.5, 0.5,
2, -3.459543, -6.594385, 0, -0.5, 0.5, 0.5,
2, -3.459543, -6.594385, 1, -0.5, 0.5, 0.5,
2, -3.459543, -6.594385, 1, 1.5, 0.5, 0.5,
2, -3.459543, -6.594385, 0, 1.5, 0.5, 0.5,
3, -3.459543, -6.594385, 0, -0.5, 0.5, 0.5,
3, -3.459543, -6.594385, 1, -0.5, 0.5, 0.5,
3, -3.459543, -6.594385, 1, 1.5, 0.5, 0.5,
3, -3.459543, -6.594385, 0, 1.5, 0.5, 0.5
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
-3.317404, -2, -5.760721,
-3.317404, 3, -5.760721,
-3.317404, -2, -5.760721,
-3.478186, -2, -6.038609,
-3.317404, -1, -5.760721,
-3.478186, -1, -6.038609,
-3.317404, 0, -5.760721,
-3.478186, 0, -6.038609,
-3.317404, 1, -5.760721,
-3.478186, 1, -6.038609,
-3.317404, 2, -5.760721,
-3.478186, 2, -6.038609,
-3.317404, 3, -5.760721,
-3.478186, 3, -6.038609
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
-3.799751, -2, -6.594385, 0, -0.5, 0.5, 0.5,
-3.799751, -2, -6.594385, 1, -0.5, 0.5, 0.5,
-3.799751, -2, -6.594385, 1, 1.5, 0.5, 0.5,
-3.799751, -2, -6.594385, 0, 1.5, 0.5, 0.5,
-3.799751, -1, -6.594385, 0, -0.5, 0.5, 0.5,
-3.799751, -1, -6.594385, 1, -0.5, 0.5, 0.5,
-3.799751, -1, -6.594385, 1, 1.5, 0.5, 0.5,
-3.799751, -1, -6.594385, 0, 1.5, 0.5, 0.5,
-3.799751, 0, -6.594385, 0, -0.5, 0.5, 0.5,
-3.799751, 0, -6.594385, 1, -0.5, 0.5, 0.5,
-3.799751, 0, -6.594385, 1, 1.5, 0.5, 0.5,
-3.799751, 0, -6.594385, 0, 1.5, 0.5, 0.5,
-3.799751, 1, -6.594385, 0, -0.5, 0.5, 0.5,
-3.799751, 1, -6.594385, 1, -0.5, 0.5, 0.5,
-3.799751, 1, -6.594385, 1, 1.5, 0.5, 0.5,
-3.799751, 1, -6.594385, 0, 1.5, 0.5, 0.5,
-3.799751, 2, -6.594385, 0, -0.5, 0.5, 0.5,
-3.799751, 2, -6.594385, 1, -0.5, 0.5, 0.5,
-3.799751, 2, -6.594385, 1, 1.5, 0.5, 0.5,
-3.799751, 2, -6.594385, 0, 1.5, 0.5, 0.5,
-3.799751, 3, -6.594385, 0, -0.5, 0.5, 0.5,
-3.799751, 3, -6.594385, 1, -0.5, 0.5, 0.5,
-3.799751, 3, -6.594385, 1, 1.5, 0.5, 0.5,
-3.799751, 3, -6.594385, 0, 1.5, 0.5, 0.5
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
-3.317404, -2.93995, -4,
-3.317404, -2.93995, 4,
-3.317404, -2.93995, -4,
-3.478186, -3.113148, -4,
-3.317404, -2.93995, -2,
-3.478186, -3.113148, -2,
-3.317404, -2.93995, 0,
-3.478186, -3.113148, 0,
-3.317404, -2.93995, 2,
-3.478186, -3.113148, 2,
-3.317404, -2.93995, 4,
-3.478186, -3.113148, 4
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
-3.799751, -3.459543, -4, 0, -0.5, 0.5, 0.5,
-3.799751, -3.459543, -4, 1, -0.5, 0.5, 0.5,
-3.799751, -3.459543, -4, 1, 1.5, 0.5, 0.5,
-3.799751, -3.459543, -4, 0, 1.5, 0.5, 0.5,
-3.799751, -3.459543, -2, 0, -0.5, 0.5, 0.5,
-3.799751, -3.459543, -2, 1, -0.5, 0.5, 0.5,
-3.799751, -3.459543, -2, 1, 1.5, 0.5, 0.5,
-3.799751, -3.459543, -2, 0, 1.5, 0.5, 0.5,
-3.799751, -3.459543, 0, 0, -0.5, 0.5, 0.5,
-3.799751, -3.459543, 0, 1, -0.5, 0.5, 0.5,
-3.799751, -3.459543, 0, 1, 1.5, 0.5, 0.5,
-3.799751, -3.459543, 0, 0, 1.5, 0.5, 0.5,
-3.799751, -3.459543, 2, 0, -0.5, 0.5, 0.5,
-3.799751, -3.459543, 2, 1, -0.5, 0.5, 0.5,
-3.799751, -3.459543, 2, 1, 1.5, 0.5, 0.5,
-3.799751, -3.459543, 2, 0, 1.5, 0.5, 0.5,
-3.799751, -3.459543, 4, 0, -0.5, 0.5, 0.5,
-3.799751, -3.459543, 4, 1, -0.5, 0.5, 0.5,
-3.799751, -3.459543, 4, 1, 1.5, 0.5, 0.5,
-3.799751, -3.459543, 4, 0, 1.5, 0.5, 0.5
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
-3.317404, -2.93995, -5.760721,
-3.317404, 3.987949, -5.760721,
-3.317404, -2.93995, 5.354804,
-3.317404, 3.987949, 5.354804,
-3.317404, -2.93995, -5.760721,
-3.317404, -2.93995, 5.354804,
-3.317404, 3.987949, -5.760721,
-3.317404, 3.987949, 5.354804,
-3.317404, -2.93995, -5.760721,
3.11389, -2.93995, -5.760721,
-3.317404, -2.93995, 5.354804,
3.11389, -2.93995, 5.354804,
-3.317404, 3.987949, -5.760721,
3.11389, 3.987949, -5.760721,
-3.317404, 3.987949, 5.354804,
3.11389, 3.987949, 5.354804,
3.11389, -2.93995, -5.760721,
3.11389, 3.987949, -5.760721,
3.11389, -2.93995, 5.354804,
3.11389, 3.987949, 5.354804,
3.11389, -2.93995, -5.760721,
3.11389, -2.93995, 5.354804,
3.11389, 3.987949, -5.760721,
3.11389, 3.987949, 5.354804
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
var radius = 7.791584;
var distance = 34.66564;
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
mvMatrix.translate( 0.1017568, -0.5239991, 0.2029583 );
mvMatrix.scale( 1.309909, 1.216013, 0.7578961 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.66564);
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
ethoxyquin<-read.table("ethoxyquin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethoxyquin$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethoxyquin' not found
```

```r
y<-ethoxyquin$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethoxyquin' not found
```

```r
z<-ethoxyquin$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethoxyquin' not found
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
-3.223744, 0.5822893, -1.258621, 0, 0, 1, 1, 1,
-2.818652, 1.580864, 0.2716404, 1, 0, 0, 1, 1,
-2.713567, -1.920452, -1.807594, 1, 0, 0, 1, 1,
-2.707983, -1.681915, -2.451996, 1, 0, 0, 1, 1,
-2.700115, -0.2538382, -0.959854, 1, 0, 0, 1, 1,
-2.633461, -0.1042988, -1.297939, 1, 0, 0, 1, 1,
-2.610677, 0.4244081, -1.651424, 0, 0, 0, 1, 1,
-2.599411, 0.2365314, -3.504345, 0, 0, 0, 1, 1,
-2.487824, -0.3422387, -3.256052, 0, 0, 0, 1, 1,
-2.396956, -0.2642528, -0.9588528, 0, 0, 0, 1, 1,
-2.354393, -0.2467455, -1.901524, 0, 0, 0, 1, 1,
-2.340656, 0.4489853, 0.3671152, 0, 0, 0, 1, 1,
-2.333243, 0.3588142, -1.944537, 0, 0, 0, 1, 1,
-2.316693, -1.686768, -3.140069, 1, 1, 1, 1, 1,
-2.303785, 0.7314536, -2.940623, 1, 1, 1, 1, 1,
-2.273296, 0.9780118, -1.364817, 1, 1, 1, 1, 1,
-2.267436, 0.1868319, -2.337789, 1, 1, 1, 1, 1,
-2.247542, 0.01731451, -1.534456, 1, 1, 1, 1, 1,
-2.247135, -0.6174026, -2.486725, 1, 1, 1, 1, 1,
-2.230793, 0.2406831, -1.797897, 1, 1, 1, 1, 1,
-2.203939, -0.04199657, -0.7252377, 1, 1, 1, 1, 1,
-2.196541, 0.8043886, -1.468615, 1, 1, 1, 1, 1,
-2.145983, -1.54638, -3.028709, 1, 1, 1, 1, 1,
-2.111279, -0.5412934, -1.57199, 1, 1, 1, 1, 1,
-2.096658, -1.638338, -0.2519732, 1, 1, 1, 1, 1,
-2.055403, -1.279931, -1.775836, 1, 1, 1, 1, 1,
-2.032773, 0.3876603, -2.630963, 1, 1, 1, 1, 1,
-2.02536, -1.396464, -1.266147, 1, 1, 1, 1, 1,
-2.010385, -1.938696, -2.612094, 0, 0, 1, 1, 1,
-2.003767, 1.136805, -1.669862, 1, 0, 0, 1, 1,
-1.994328, -1.117867, -1.341439, 1, 0, 0, 1, 1,
-1.988881, 0.5061807, 0.1133732, 1, 0, 0, 1, 1,
-1.987688, -0.1910227, -2.985478, 1, 0, 0, 1, 1,
-1.987318, 1.395918, -0.1295916, 1, 0, 0, 1, 1,
-1.980341, -0.7462429, -1.45818, 0, 0, 0, 1, 1,
-1.959935, 1.400497, 0.1983034, 0, 0, 0, 1, 1,
-1.920268, -0.2551625, -0.5193579, 0, 0, 0, 1, 1,
-1.911949, -0.746867, -2.465051, 0, 0, 0, 1, 1,
-1.894593, -0.854818, -2.473923, 0, 0, 0, 1, 1,
-1.892407, 0.4934096, -0.3694059, 0, 0, 0, 1, 1,
-1.844552, -0.8235333, -1.939907, 0, 0, 0, 1, 1,
-1.838227, 0.4179197, -3.011405, 1, 1, 1, 1, 1,
-1.837897, 0.955552, -2.466493, 1, 1, 1, 1, 1,
-1.828163, 0.176174, 0.851517, 1, 1, 1, 1, 1,
-1.824087, -0.1627087, -0.05175411, 1, 1, 1, 1, 1,
-1.815371, 1.571946, -1.368072, 1, 1, 1, 1, 1,
-1.803449, 1.678916, -1.682906, 1, 1, 1, 1, 1,
-1.790934, 1.53009, -2.334436, 1, 1, 1, 1, 1,
-1.783497, -1.20215, -2.901695, 1, 1, 1, 1, 1,
-1.77332, -1.326437, -2.922776, 1, 1, 1, 1, 1,
-1.766545, 0.947261, -1.752158, 1, 1, 1, 1, 1,
-1.746577, 0.1971173, -1.735355, 1, 1, 1, 1, 1,
-1.745091, 1.572211, -2.097308, 1, 1, 1, 1, 1,
-1.735106, 1.972788, 0.4345203, 1, 1, 1, 1, 1,
-1.734514, -0.3694451, -0.5078878, 1, 1, 1, 1, 1,
-1.719987, 1.360104, -0.8461223, 1, 1, 1, 1, 1,
-1.713951, -1.006813, -0.4952721, 0, 0, 1, 1, 1,
-1.713447, -0.2979183, 0.05425335, 1, 0, 0, 1, 1,
-1.711671, -0.2832478, -2.595526, 1, 0, 0, 1, 1,
-1.700691, 1.343195, -2.077258, 1, 0, 0, 1, 1,
-1.686255, 0.09607091, -1.685571, 1, 0, 0, 1, 1,
-1.670465, -0.7125715, -1.45344, 1, 0, 0, 1, 1,
-1.663824, 1.345176, -0.01279397, 0, 0, 0, 1, 1,
-1.657972, 2.607176, -1.185884, 0, 0, 0, 1, 1,
-1.642319, 0.4382393, -1.164315, 0, 0, 0, 1, 1,
-1.61162, -0.7041807, -3.474338, 0, 0, 0, 1, 1,
-1.611282, -0.4210044, -2.323088, 0, 0, 0, 1, 1,
-1.602109, 0.2639935, -0.4795501, 0, 0, 0, 1, 1,
-1.585521, -0.2833601, 0.2832679, 0, 0, 0, 1, 1,
-1.569159, -0.2304826, -0.5425073, 1, 1, 1, 1, 1,
-1.562681, 0.685913, -0.3760929, 1, 1, 1, 1, 1,
-1.560894, -1.860985, -1.428006, 1, 1, 1, 1, 1,
-1.55443, -0.6220802, -3.829317, 1, 1, 1, 1, 1,
-1.54924, -0.9913277, -3.464256, 1, 1, 1, 1, 1,
-1.548569, 1.576779, -1.649525, 1, 1, 1, 1, 1,
-1.541088, 2.124761, -0.7716609, 1, 1, 1, 1, 1,
-1.54098, -0.08388965, -1.122151, 1, 1, 1, 1, 1,
-1.538435, -0.1736493, -0.6040616, 1, 1, 1, 1, 1,
-1.531733, 1.083895, -1.417414, 1, 1, 1, 1, 1,
-1.52547, 1.362542, -1.161451, 1, 1, 1, 1, 1,
-1.500771, 0.3577113, -2.851081, 1, 1, 1, 1, 1,
-1.497355, 0.2373423, -0.9417819, 1, 1, 1, 1, 1,
-1.493385, 0.6177095, -0.4469585, 1, 1, 1, 1, 1,
-1.491608, -0.5004063, -1.1636, 1, 1, 1, 1, 1,
-1.489571, -0.1475737, -1.803393, 0, 0, 1, 1, 1,
-1.479174, -0.8117951, -1.028328, 1, 0, 0, 1, 1,
-1.477793, -1.277732, -2.644323, 1, 0, 0, 1, 1,
-1.476194, 0.02720303, 0.2314095, 1, 0, 0, 1, 1,
-1.471725, -0.4321015, -1.904314, 1, 0, 0, 1, 1,
-1.466457, 0.7703221, -1.205192, 1, 0, 0, 1, 1,
-1.447418, -1.069346, -2.242598, 0, 0, 0, 1, 1,
-1.442835, -0.1667549, -0.2923562, 0, 0, 0, 1, 1,
-1.435587, -0.006551793, -4.059785, 0, 0, 0, 1, 1,
-1.431139, 0.01468848, 0.07995787, 0, 0, 0, 1, 1,
-1.398527, 0.9292792, -0.7229012, 0, 0, 0, 1, 1,
-1.378378, -0.5683618, -2.57342, 0, 0, 0, 1, 1,
-1.369456, 1.619578, -1.039508, 0, 0, 0, 1, 1,
-1.365646, -0.3505674, -2.261603, 1, 1, 1, 1, 1,
-1.363831, 0.8736575, -1.321806, 1, 1, 1, 1, 1,
-1.360202, -0.1760632, -0.9077851, 1, 1, 1, 1, 1,
-1.359099, -0.4380783, -1.7317, 1, 1, 1, 1, 1,
-1.350679, -2.40795, -2.407053, 1, 1, 1, 1, 1,
-1.34956, -0.0297771, -0.435414, 1, 1, 1, 1, 1,
-1.349142, 0.5248188, -1.185579, 1, 1, 1, 1, 1,
-1.345729, -1.69681, -1.108832, 1, 1, 1, 1, 1,
-1.345176, -0.03705227, -2.174, 1, 1, 1, 1, 1,
-1.340627, -0.8012279, -2.953468, 1, 1, 1, 1, 1,
-1.33948, -2.117335, -3.508995, 1, 1, 1, 1, 1,
-1.334054, 0.480473, -1.951392, 1, 1, 1, 1, 1,
-1.330492, -0.6298429, -2.90864, 1, 1, 1, 1, 1,
-1.327433, 0.1837758, -0.6267852, 1, 1, 1, 1, 1,
-1.325886, -0.2342233, -2.598175, 1, 1, 1, 1, 1,
-1.322165, 0.9861978, -1.066782, 0, 0, 1, 1, 1,
-1.300371, -2.150853, -2.186644, 1, 0, 0, 1, 1,
-1.292839, -0.2795703, -0.2016664, 1, 0, 0, 1, 1,
-1.282969, -1.074324, -2.745563, 1, 0, 0, 1, 1,
-1.279866, 0.02362872, -2.590496, 1, 0, 0, 1, 1,
-1.277366, 0.185347, -1.67248, 1, 0, 0, 1, 1,
-1.272346, 0.2812657, -0.3380627, 0, 0, 0, 1, 1,
-1.268198, 0.1893467, -0.8162156, 0, 0, 0, 1, 1,
-1.261236, -0.3083237, 0.3573665, 0, 0, 0, 1, 1,
-1.255822, 0.6115218, 0.7735485, 0, 0, 0, 1, 1,
-1.244345, -0.4119457, -2.528099, 0, 0, 0, 1, 1,
-1.240747, 0.5834361, -1.656785, 0, 0, 0, 1, 1,
-1.236818, 0.4020891, -0.8658398, 0, 0, 0, 1, 1,
-1.235846, -0.3510386, -2.275155, 1, 1, 1, 1, 1,
-1.226585, 1.139816, -1.863354, 1, 1, 1, 1, 1,
-1.226436, 0.1789958, -0.8960596, 1, 1, 1, 1, 1,
-1.225648, 1.10372, -1.897166, 1, 1, 1, 1, 1,
-1.21261, -0.1915364, -1.222743, 1, 1, 1, 1, 1,
-1.209719, 0.3824169, -2.060401, 1, 1, 1, 1, 1,
-1.206777, 1.140338, -0.3461672, 1, 1, 1, 1, 1,
-1.204177, -0.1656415, -0.7073997, 1, 1, 1, 1, 1,
-1.193688, -0.3434483, -1.829696, 1, 1, 1, 1, 1,
-1.187926, 0.06961503, -0.05974427, 1, 1, 1, 1, 1,
-1.183908, 0.6785226, -0.3588898, 1, 1, 1, 1, 1,
-1.182513, 2.044913, -2.43889, 1, 1, 1, 1, 1,
-1.174143, -0.3586462, -0.7908295, 1, 1, 1, 1, 1,
-1.165893, -1.315459, -2.900828, 1, 1, 1, 1, 1,
-1.16424, 1.723869, -0.2225603, 1, 1, 1, 1, 1,
-1.16303, -1.084296, -3.212144, 0, 0, 1, 1, 1,
-1.162582, 0.7140169, 0.4045753, 1, 0, 0, 1, 1,
-1.161231, 0.6199243, -0.4539384, 1, 0, 0, 1, 1,
-1.159443, -0.5583737, -1.682977, 1, 0, 0, 1, 1,
-1.140378, 1.015475, -1.723676, 1, 0, 0, 1, 1,
-1.134406, 0.9146312, -0.7719935, 1, 0, 0, 1, 1,
-1.121152, -0.1757462, -2.965069, 0, 0, 0, 1, 1,
-1.119481, -1.837845, -3.393735, 0, 0, 0, 1, 1,
-1.114322, 0.64939, 0.2075043, 0, 0, 0, 1, 1,
-1.11092, -0.1591929, -2.278996, 0, 0, 0, 1, 1,
-1.106213, -1.812022, -3.961466, 0, 0, 0, 1, 1,
-1.102795, -0.04857533, -1.620991, 0, 0, 0, 1, 1,
-1.090953, -0.05962482, -1.784032, 0, 0, 0, 1, 1,
-1.088875, 0.441798, 0.280749, 1, 1, 1, 1, 1,
-1.084524, -0.550871, -2.338774, 1, 1, 1, 1, 1,
-1.082595, -1.176869, -0.9460054, 1, 1, 1, 1, 1,
-1.072864, -1.052379, -1.514695, 1, 1, 1, 1, 1,
-1.069603, 0.3446031, -1.747036, 1, 1, 1, 1, 1,
-1.068329, 0.1540695, -1.757811, 1, 1, 1, 1, 1,
-1.062066, -0.7771006, -2.414202, 1, 1, 1, 1, 1,
-1.057335, -0.3055297, -1.226813, 1, 1, 1, 1, 1,
-1.055431, 1.373503, 0.4315904, 1, 1, 1, 1, 1,
-1.05236, 0.2789761, 0.1357908, 1, 1, 1, 1, 1,
-1.042555, 1.226233, -0.8285142, 1, 1, 1, 1, 1,
-1.037849, 0.08831859, -1.538351, 1, 1, 1, 1, 1,
-1.035424, 0.1497109, -3.400599, 1, 1, 1, 1, 1,
-1.034895, -1.447091, -3.404555, 1, 1, 1, 1, 1,
-1.03295, 1.174657, -1.170978, 1, 1, 1, 1, 1,
-1.020807, -1.173617, -0.2227786, 0, 0, 1, 1, 1,
-1.017645, -0.7853858, -2.338483, 1, 0, 0, 1, 1,
-0.9840693, 1.350425, -0.05733551, 1, 0, 0, 1, 1,
-0.9817001, 0.9364529, 0.2438886, 1, 0, 0, 1, 1,
-0.9813471, -0.2224045, -2.192838, 1, 0, 0, 1, 1,
-0.9784636, -1.63772, -1.932528, 1, 0, 0, 1, 1,
-0.9760206, 1.277299, -2.294933, 0, 0, 0, 1, 1,
-0.9741573, -0.5819884, -2.71493, 0, 0, 0, 1, 1,
-0.9694522, -0.9075977, -3.367767, 0, 0, 0, 1, 1,
-0.966422, 1.100781, -1.208918, 0, 0, 0, 1, 1,
-0.9651598, 0.1926332, -2.123823, 0, 0, 0, 1, 1,
-0.9608911, -1.185193, -4.083588, 0, 0, 0, 1, 1,
-0.9574082, 2.004228, 0.1841134, 0, 0, 0, 1, 1,
-0.9569761, -0.04043936, -0.9291217, 1, 1, 1, 1, 1,
-0.9559985, -0.2533098, -0.6044496, 1, 1, 1, 1, 1,
-0.9527971, 1.27053, 0.3585451, 1, 1, 1, 1, 1,
-0.9526349, 1.174095, -0.6894957, 1, 1, 1, 1, 1,
-0.9520739, 1.151423, -1.839057, 1, 1, 1, 1, 1,
-0.9461047, 0.5082868, -1.138829, 1, 1, 1, 1, 1,
-0.9445086, 0.9985383, 0.6634847, 1, 1, 1, 1, 1,
-0.9326038, -1.448832, -2.915367, 1, 1, 1, 1, 1,
-0.9228924, 0.4934698, -2.978553, 1, 1, 1, 1, 1,
-0.9166051, 0.2118139, -1.57022, 1, 1, 1, 1, 1,
-0.9081901, 0.3490929, -1.237761, 1, 1, 1, 1, 1,
-0.9078408, 0.4111345, -2.250541, 1, 1, 1, 1, 1,
-0.8913308, -0.1990056, -2.128942, 1, 1, 1, 1, 1,
-0.8848521, 1.021647, -1.188709, 1, 1, 1, 1, 1,
-0.8722858, -0.140596, -1.500155, 1, 1, 1, 1, 1,
-0.8634013, 2.139985, -1.219183, 0, 0, 1, 1, 1,
-0.8606753, -0.7120411, -1.704973, 1, 0, 0, 1, 1,
-0.8572842, 2.275271, -0.6426381, 1, 0, 0, 1, 1,
-0.8568996, 0.1475944, -1.832875, 1, 0, 0, 1, 1,
-0.8544372, -0.7583283, -1.867391, 1, 0, 0, 1, 1,
-0.8490061, 0.7389987, -0.0638357, 1, 0, 0, 1, 1,
-0.8440231, -0.2261237, -0.7963134, 0, 0, 0, 1, 1,
-0.8383707, 1.064509, -0.08175154, 0, 0, 0, 1, 1,
-0.8382447, -1.900086, -3.502676, 0, 0, 0, 1, 1,
-0.8360131, 0.6760496, 0.1174788, 0, 0, 0, 1, 1,
-0.8348083, -2.146353, -2.437465, 0, 0, 0, 1, 1,
-0.8279328, 0.7449598, -0.4654325, 0, 0, 0, 1, 1,
-0.8239367, -0.3947148, -2.523361, 0, 0, 0, 1, 1,
-0.8197868, 0.3020741, -1.155476, 1, 1, 1, 1, 1,
-0.8158695, -0.01551768, -1.314142, 1, 1, 1, 1, 1,
-0.8131366, -1.615911, -3.120198, 1, 1, 1, 1, 1,
-0.8075483, -1.653732, -1.721018, 1, 1, 1, 1, 1,
-0.8039576, -1.562265, -3.424657, 1, 1, 1, 1, 1,
-0.7912038, -0.006595051, -1.015952, 1, 1, 1, 1, 1,
-0.7910088, 0.4209679, 0.8852304, 1, 1, 1, 1, 1,
-0.7906881, 0.09084232, -3.170717, 1, 1, 1, 1, 1,
-0.7902161, -0.3266627, -1.67763, 1, 1, 1, 1, 1,
-0.7886339, 0.5689704, -0.406718, 1, 1, 1, 1, 1,
-0.784493, -0.9823936, -3.684072, 1, 1, 1, 1, 1,
-0.7841455, 1.789769, -0.9137815, 1, 1, 1, 1, 1,
-0.7840325, 3.887057, 0.4036342, 1, 1, 1, 1, 1,
-0.7829363, -1.687813, -2.500607, 1, 1, 1, 1, 1,
-0.781155, 2.107435, 0.08135314, 1, 1, 1, 1, 1,
-0.7772902, 0.1890608, -1.951375, 0, 0, 1, 1, 1,
-0.7769672, 1.615457, -1.695389, 1, 0, 0, 1, 1,
-0.7730615, 0.4480921, -0.4266818, 1, 0, 0, 1, 1,
-0.7618256, -0.3033448, -1.674504, 1, 0, 0, 1, 1,
-0.7602327, -1.345664, -1.49538, 1, 0, 0, 1, 1,
-0.7587349, -1.382102, -4.187203, 1, 0, 0, 1, 1,
-0.758579, -0.6403287, -2.948954, 0, 0, 0, 1, 1,
-0.7581288, 2.092817, -0.1845032, 0, 0, 0, 1, 1,
-0.7574711, 2.201749, 0.455896, 0, 0, 0, 1, 1,
-0.7424355, 0.05151979, -1.753374, 0, 0, 0, 1, 1,
-0.7354794, 1.132113, -1.21139, 0, 0, 0, 1, 1,
-0.7346646, 1.373143, -0.5129146, 0, 0, 0, 1, 1,
-0.733678, 0.8737974, -2.547723, 0, 0, 0, 1, 1,
-0.7334359, 1.287863, 0.8058945, 1, 1, 1, 1, 1,
-0.7331648, 0.0795003, -1.994478, 1, 1, 1, 1, 1,
-0.7326722, 0.4326724, -0.8591487, 1, 1, 1, 1, 1,
-0.7322002, -0.1110929, -3.158494, 1, 1, 1, 1, 1,
-0.7268127, 0.006619613, -0.6625623, 1, 1, 1, 1, 1,
-0.7261663, 0.3363385, -1.590774, 1, 1, 1, 1, 1,
-0.7198992, -1.178685, -3.635451, 1, 1, 1, 1, 1,
-0.7160364, 0.2043927, -0.8415365, 1, 1, 1, 1, 1,
-0.7137461, -0.1279015, -3.903082, 1, 1, 1, 1, 1,
-0.7127013, 0.04413625, -2.926283, 1, 1, 1, 1, 1,
-0.7092313, 0.5305479, 0.3905152, 1, 1, 1, 1, 1,
-0.7012241, -1.48339, -4.747272, 1, 1, 1, 1, 1,
-0.699127, 1.717027, -0.01545958, 1, 1, 1, 1, 1,
-0.6988504, 1.162284, -1.300341, 1, 1, 1, 1, 1,
-0.6987764, -0.3087463, -1.767913, 1, 1, 1, 1, 1,
-0.6910475, -0.5001505, -2.447435, 0, 0, 1, 1, 1,
-0.6872566, 0.8931402, -0.5136059, 1, 0, 0, 1, 1,
-0.6864261, 0.0374405, 1.261755, 1, 0, 0, 1, 1,
-0.6855416, -0.1177086, -2.660378, 1, 0, 0, 1, 1,
-0.683692, 0.4879359, -1.07989, 1, 0, 0, 1, 1,
-0.6815259, -0.2383219, -2.659802, 1, 0, 0, 1, 1,
-0.6809834, -1.741729, -2.728829, 0, 0, 0, 1, 1,
-0.6787615, -1.173797, -2.686914, 0, 0, 0, 1, 1,
-0.6735241, 2.215259, 1.023448, 0, 0, 0, 1, 1,
-0.6734706, 0.2493528, -2.278054, 0, 0, 0, 1, 1,
-0.6729839, -1.777663, -2.5532, 0, 0, 0, 1, 1,
-0.6709441, -0.6457121, -2.59722, 0, 0, 0, 1, 1,
-0.670513, 0.7453362, -1.010851, 0, 0, 0, 1, 1,
-0.669744, -0.00875403, -1.202205, 1, 1, 1, 1, 1,
-0.6688079, -0.1886454, -4.133182, 1, 1, 1, 1, 1,
-0.6686338, -2.571017, -4.086088, 1, 1, 1, 1, 1,
-0.6665744, -0.2667924, -2.003057, 1, 1, 1, 1, 1,
-0.6661012, -0.3187611, -1.083493, 1, 1, 1, 1, 1,
-0.6608006, -1.129914, -2.536807, 1, 1, 1, 1, 1,
-0.6464012, 1.405686, 0.9464934, 1, 1, 1, 1, 1,
-0.6462197, -0.813277, -1.882364, 1, 1, 1, 1, 1,
-0.639153, -0.0873397, -1.108262, 1, 1, 1, 1, 1,
-0.6381978, -0.6766651, -1.555654, 1, 1, 1, 1, 1,
-0.6358535, 0.6602879, -2.32068, 1, 1, 1, 1, 1,
-0.6349222, 2.302775, 0.5636727, 1, 1, 1, 1, 1,
-0.6290992, 0.6106978, -0.9772059, 1, 1, 1, 1, 1,
-0.6287994, 0.2652644, -1.226192, 1, 1, 1, 1, 1,
-0.6264554, -0.6939279, -2.971414, 1, 1, 1, 1, 1,
-0.6264313, -1.387331, -3.428514, 0, 0, 1, 1, 1,
-0.6251007, -1.021767, -3.237115, 1, 0, 0, 1, 1,
-0.6243436, -0.1326779, -1.362229, 1, 0, 0, 1, 1,
-0.6234252, -0.9446892, -2.208844, 1, 0, 0, 1, 1,
-0.6183732, 0.948172, -1.265991, 1, 0, 0, 1, 1,
-0.6167676, 1.719703, 0.1309495, 1, 0, 0, 1, 1,
-0.6145058, 0.1390803, -1.68754, 0, 0, 0, 1, 1,
-0.6056342, -0.1213554, -1.717965, 0, 0, 0, 1, 1,
-0.6051164, -0.7422855, -1.713888, 0, 0, 0, 1, 1,
-0.6031535, 1.547584, -1.25408, 0, 0, 0, 1, 1,
-0.5987387, 0.06055388, -3.509639, 0, 0, 0, 1, 1,
-0.5929281, -1.191763, -3.744643, 0, 0, 0, 1, 1,
-0.5907516, 1.64144, -0.2113926, 0, 0, 0, 1, 1,
-0.588837, 0.4657136, -2.567205, 1, 1, 1, 1, 1,
-0.5877571, -1.9255, -2.24795, 1, 1, 1, 1, 1,
-0.5875065, 1.01464, -0.4066586, 1, 1, 1, 1, 1,
-0.5870826, 2.194474, -0.8268033, 1, 1, 1, 1, 1,
-0.579273, -0.5206321, -2.610152, 1, 1, 1, 1, 1,
-0.5716407, 0.6281845, 0.1351802, 1, 1, 1, 1, 1,
-0.5715408, -0.5313929, -1.771764, 1, 1, 1, 1, 1,
-0.5661359, 0.8837391, -1.205742, 1, 1, 1, 1, 1,
-0.5564076, 0.5789338, 0.7714481, 1, 1, 1, 1, 1,
-0.553107, -0.001707077, -2.319739, 1, 1, 1, 1, 1,
-0.5514385, -0.1904208, 0.7249463, 1, 1, 1, 1, 1,
-0.5489488, -0.9332092, -2.216932, 1, 1, 1, 1, 1,
-0.5477703, 1.900817, -1.807512, 1, 1, 1, 1, 1,
-0.5452129, -0.06585341, -1.630659, 1, 1, 1, 1, 1,
-0.544594, 0.6087757, -1.918754, 1, 1, 1, 1, 1,
-0.5384293, 0.0417568, -1.626991, 0, 0, 1, 1, 1,
-0.5369713, -2.207853, -2.776727, 1, 0, 0, 1, 1,
-0.5343682, 1.015443, -2.041514, 1, 0, 0, 1, 1,
-0.527452, 1.212051, -0.8747098, 1, 0, 0, 1, 1,
-0.5262029, -1.148732, -1.795967, 1, 0, 0, 1, 1,
-0.5201183, 0.8498306, -0.842788, 1, 0, 0, 1, 1,
-0.5181679, -1.2633, -3.616027, 0, 0, 0, 1, 1,
-0.5181329, 0.9300864, -0.04140439, 0, 0, 0, 1, 1,
-0.5169391, -1.997352, -2.633137, 0, 0, 0, 1, 1,
-0.5130095, 2.106819, 0.4745382, 0, 0, 0, 1, 1,
-0.5121281, -1.134437, -2.323174, 0, 0, 0, 1, 1,
-0.5105652, 1.422083, 0.3979315, 0, 0, 0, 1, 1,
-0.5103356, 1.598109, -0.05076984, 0, 0, 0, 1, 1,
-0.5078909, 0.4692803, 0.179153, 1, 1, 1, 1, 1,
-0.5056183, 1.458082, 0.4076135, 1, 1, 1, 1, 1,
-0.5033351, -1.890242, -4.322043, 1, 1, 1, 1, 1,
-0.4989941, 1.981146, -0.1305827, 1, 1, 1, 1, 1,
-0.4929464, 0.5650041, 0.1865799, 1, 1, 1, 1, 1,
-0.4906304, -1.186114, -1.84598, 1, 1, 1, 1, 1,
-0.4897137, 0.2311877, -1.6134, 1, 1, 1, 1, 1,
-0.4870089, -1.261729, -2.873009, 1, 1, 1, 1, 1,
-0.4861814, -0.1001267, -0.1623332, 1, 1, 1, 1, 1,
-0.4857233, -1.323299, -4.603884, 1, 1, 1, 1, 1,
-0.4828994, -0.6824758, -2.803609, 1, 1, 1, 1, 1,
-0.4800763, -0.5691049, -1.437281, 1, 1, 1, 1, 1,
-0.4765868, 0.60444, -1.198978, 1, 1, 1, 1, 1,
-0.4762481, -0.1485799, -2.068331, 1, 1, 1, 1, 1,
-0.4742521, -0.5776051, -3.075308, 1, 1, 1, 1, 1,
-0.4641329, -0.1780347, -2.551575, 0, 0, 1, 1, 1,
-0.4627679, 0.16402, -3.155507, 1, 0, 0, 1, 1,
-0.4622984, 0.03890725, -1.633349, 1, 0, 0, 1, 1,
-0.4560339, -1.762318, -3.652137, 1, 0, 0, 1, 1,
-0.4493653, -0.3527752, -2.238162, 1, 0, 0, 1, 1,
-0.4489914, -0.5777253, -2.938667, 1, 0, 0, 1, 1,
-0.4437748, -0.341171, -1.429851, 0, 0, 0, 1, 1,
-0.4389887, -1.353199, -3.766439, 0, 0, 0, 1, 1,
-0.4377221, 0.1488015, -1.150413, 0, 0, 0, 1, 1,
-0.4287974, -0.3052896, -1.036612, 0, 0, 0, 1, 1,
-0.4279324, -0.2120018, -2.534193, 0, 0, 0, 1, 1,
-0.42619, 1.439115, -1.507426, 0, 0, 0, 1, 1,
-0.4260677, 0.3378366, -1.66441, 0, 0, 0, 1, 1,
-0.4239115, 0.9331088, 0.09488352, 1, 1, 1, 1, 1,
-0.4115321, -0.4600959, -3.67375, 1, 1, 1, 1, 1,
-0.4106902, 0.7494612, -1.991922, 1, 1, 1, 1, 1,
-0.4044303, 1.353201, -0.7545806, 1, 1, 1, 1, 1,
-0.402654, 1.147215, -0.9353791, 1, 1, 1, 1, 1,
-0.398795, -1.516209, -3.929968, 1, 1, 1, 1, 1,
-0.3931049, -0.1288002, -1.519682, 1, 1, 1, 1, 1,
-0.3926966, -1.08372, -2.644588, 1, 1, 1, 1, 1,
-0.3894074, 0.3466624, -0.5223846, 1, 1, 1, 1, 1,
-0.3846561, 0.8931117, -1.963087, 1, 1, 1, 1, 1,
-0.3823989, -0.6592727, -0.7840554, 1, 1, 1, 1, 1,
-0.3805162, -0.5090967, -0.4037501, 1, 1, 1, 1, 1,
-0.3772244, 0.6284354, -1.141379, 1, 1, 1, 1, 1,
-0.3756552, -0.05454563, -1.14303, 1, 1, 1, 1, 1,
-0.372699, 1.248185, -1.226029, 1, 1, 1, 1, 1,
-0.3724439, -0.4671966, -3.093785, 0, 0, 1, 1, 1,
-0.3720631, -1.088194, -1.750244, 1, 0, 0, 1, 1,
-0.3714528, 0.8553915, -3.218811, 1, 0, 0, 1, 1,
-0.3708568, 1.622154, -1.097803, 1, 0, 0, 1, 1,
-0.3704667, 0.05438567, -2.928049, 1, 0, 0, 1, 1,
-0.3685602, -0.2525993, -1.566896, 1, 0, 0, 1, 1,
-0.3615674, 2.27391, 0.1368399, 0, 0, 0, 1, 1,
-0.3614901, 2.083043, 0.6528597, 0, 0, 0, 1, 1,
-0.359054, -2.839059, -4.045298, 0, 0, 0, 1, 1,
-0.3587573, -0.6318963, -3.505591, 0, 0, 0, 1, 1,
-0.3586649, 1.243889, 0.1685846, 0, 0, 0, 1, 1,
-0.3569644, -0.0409632, -0.1187015, 0, 0, 0, 1, 1,
-0.3565269, -0.5678473, -1.794685, 0, 0, 0, 1, 1,
-0.3563664, -0.5400267, -2.552797, 1, 1, 1, 1, 1,
-0.355604, -0.07571906, -1.898666, 1, 1, 1, 1, 1,
-0.3489107, 0.5666229, -0.3741942, 1, 1, 1, 1, 1,
-0.3482035, 1.745437, 1.004884, 1, 1, 1, 1, 1,
-0.3479668, -0.7299392, -2.683535, 1, 1, 1, 1, 1,
-0.342706, 1.570115, 1.673188, 1, 1, 1, 1, 1,
-0.3422855, 0.4983943, -0.8802403, 1, 1, 1, 1, 1,
-0.3414085, -0.6171854, -2.67882, 1, 1, 1, 1, 1,
-0.3394938, 0.381193, -1.095292, 1, 1, 1, 1, 1,
-0.3385394, -0.2452811, -2.082916, 1, 1, 1, 1, 1,
-0.3292519, 0.0977051, -1.674017, 1, 1, 1, 1, 1,
-0.321721, -0.05392055, -1.503868, 1, 1, 1, 1, 1,
-0.3178093, 0.9597127, -2.700927, 1, 1, 1, 1, 1,
-0.3136506, 0.04219138, -0.7366617, 1, 1, 1, 1, 1,
-0.3114052, 0.4709776, -0.313087, 1, 1, 1, 1, 1,
-0.3106662, -0.3623129, -3.510951, 0, 0, 1, 1, 1,
-0.3004229, -2.099993, -3.595578, 1, 0, 0, 1, 1,
-0.2956293, 0.2167862, -1.120234, 1, 0, 0, 1, 1,
-0.2950409, -1.898695, -3.274803, 1, 0, 0, 1, 1,
-0.2867621, -1.157931, -3.960145, 1, 0, 0, 1, 1,
-0.2779692, -0.1590201, -1.986281, 1, 0, 0, 1, 1,
-0.2760397, -1.745433, -2.40633, 0, 0, 0, 1, 1,
-0.2755851, 0.5152121, -1.633086, 0, 0, 0, 1, 1,
-0.2754175, -0.6407881, -3.864069, 0, 0, 0, 1, 1,
-0.2723773, -0.2545931, -1.881953, 0, 0, 0, 1, 1,
-0.2635914, -1.289118, -3.200578, 0, 0, 0, 1, 1,
-0.2629123, -0.527144, -2.815452, 0, 0, 0, 1, 1,
-0.2606263, 0.6957686, -0.5550042, 0, 0, 0, 1, 1,
-0.253855, 0.6847975, -1.491701, 1, 1, 1, 1, 1,
-0.2513715, 0.02226469, -0.6029847, 1, 1, 1, 1, 1,
-0.2474932, 0.4157841, 0.03257487, 1, 1, 1, 1, 1,
-0.2474368, 1.486961, 0.2262281, 1, 1, 1, 1, 1,
-0.2418915, -0.02473342, -1.645464, 1, 1, 1, 1, 1,
-0.2406495, 0.6395751, -0.05103261, 1, 1, 1, 1, 1,
-0.2264343, 0.2716706, 0.6789926, 1, 1, 1, 1, 1,
-0.226113, -1.025128, -4.002234, 1, 1, 1, 1, 1,
-0.2225146, -0.2625724, -0.8898643, 1, 1, 1, 1, 1,
-0.2196717, -0.03367035, -1.178889, 1, 1, 1, 1, 1,
-0.2192291, -0.01628629, -1.483206, 1, 1, 1, 1, 1,
-0.2171652, 1.27459, -0.9533299, 1, 1, 1, 1, 1,
-0.216572, 0.4479222, -1.60519, 1, 1, 1, 1, 1,
-0.2140206, -1.766009, -1.308427, 1, 1, 1, 1, 1,
-0.2138017, 1.707214, 0.1903587, 1, 1, 1, 1, 1,
-0.2137539, -1.353788, -2.081742, 0, 0, 1, 1, 1,
-0.212626, 0.1857356, -0.6496471, 1, 0, 0, 1, 1,
-0.2102244, -0.9850146, -2.949625, 1, 0, 0, 1, 1,
-0.2101329, 0.6903434, 1.304355, 1, 0, 0, 1, 1,
-0.2084948, 0.7760878, -0.2775444, 1, 0, 0, 1, 1,
-0.2071992, -0.5583894, -1.735261, 1, 0, 0, 1, 1,
-0.2031125, 1.035025, -0.8277148, 0, 0, 0, 1, 1,
-0.2015005, -0.6836563, -2.701558, 0, 0, 0, 1, 1,
-0.2010584, 1.938322, 0.1451732, 0, 0, 0, 1, 1,
-0.1954924, 0.996931, 2.681217, 0, 0, 0, 1, 1,
-0.1951868, 0.004068685, -1.613117, 0, 0, 0, 1, 1,
-0.193423, 0.04113227, -2.434459, 0, 0, 0, 1, 1,
-0.1929338, 1.236688, 0.2776411, 0, 0, 0, 1, 1,
-0.1887938, 0.5252606, 0.7077013, 1, 1, 1, 1, 1,
-0.188194, -0.5395285, -4.876263, 1, 1, 1, 1, 1,
-0.1875728, 1.160426, -2.710166, 1, 1, 1, 1, 1,
-0.1861964, -0.5539091, -1.251103, 1, 1, 1, 1, 1,
-0.1857922, 0.5351764, -0.1718795, 1, 1, 1, 1, 1,
-0.1842788, 1.587746, -1.770015, 1, 1, 1, 1, 1,
-0.1841003, -1.284983, -4.4185, 1, 1, 1, 1, 1,
-0.1765388, -0.04359948, -2.408111, 1, 1, 1, 1, 1,
-0.1737479, -1.55729, -3.492711, 1, 1, 1, 1, 1,
-0.1668727, 0.5019037, 0.2518361, 1, 1, 1, 1, 1,
-0.1663162, 0.4098553, -0.4536637, 1, 1, 1, 1, 1,
-0.1635475, 0.2105757, -0.4514138, 1, 1, 1, 1, 1,
-0.1630069, 0.7819903, -0.009980171, 1, 1, 1, 1, 1,
-0.1544561, 1.431002, -0.2182887, 1, 1, 1, 1, 1,
-0.1502042, 1.085544, 0.1585714, 1, 1, 1, 1, 1,
-0.1456495, -0.6559229, -4.573139, 0, 0, 1, 1, 1,
-0.1437658, 1.299656, 1.926006, 1, 0, 0, 1, 1,
-0.1431617, 2.544194, 1.98887, 1, 0, 0, 1, 1,
-0.1389495, 0.6291294, 0.6003562, 1, 0, 0, 1, 1,
-0.1355825, 0.2140264, -0.4071789, 1, 0, 0, 1, 1,
-0.1299299, 0.5246059, -1.428225, 1, 0, 0, 1, 1,
-0.129153, -0.3783112, -1.69528, 0, 0, 0, 1, 1,
-0.1278972, 0.6188717, 0.2092845, 0, 0, 0, 1, 1,
-0.1275252, -0.8412775, -3.254838, 0, 0, 0, 1, 1,
-0.1258164, -1.563533, -4.43851, 0, 0, 0, 1, 1,
-0.1214107, 0.7299595, -0.784228, 0, 0, 0, 1, 1,
-0.1131189, 0.9369128, 0.6601469, 0, 0, 0, 1, 1,
-0.1106703, 1.76683, -0.5496873, 0, 0, 0, 1, 1,
-0.1078168, 0.1732149, -0.6930656, 1, 1, 1, 1, 1,
-0.1055247, -0.5231881, -3.035637, 1, 1, 1, 1, 1,
-0.1010955, 0.683039, -0.4659105, 1, 1, 1, 1, 1,
-0.09857975, -0.8076103, -4.28302, 1, 1, 1, 1, 1,
-0.09796821, 1.003333, -0.3478229, 1, 1, 1, 1, 1,
-0.09465016, 0.5631114, 0.2989024, 1, 1, 1, 1, 1,
-0.08624931, -0.8488753, -3.442091, 1, 1, 1, 1, 1,
-0.08562186, 0.6031448, 0.04222072, 1, 1, 1, 1, 1,
-0.08514142, 0.05137748, 0.3408943, 1, 1, 1, 1, 1,
-0.0833888, -0.3241278, -1.990072, 1, 1, 1, 1, 1,
-0.08273531, -1.450948, -3.109902, 1, 1, 1, 1, 1,
-0.08224169, -0.1821196, -2.586622, 1, 1, 1, 1, 1,
-0.08143397, -0.2404469, -2.980741, 1, 1, 1, 1, 1,
-0.081387, 1.333233, 0.8665559, 1, 1, 1, 1, 1,
-0.07834119, -1.356456, -2.254626, 1, 1, 1, 1, 1,
-0.07683823, 2.849551, 0.5330067, 0, 0, 1, 1, 1,
-0.07658859, 0.365469, 0.7134362, 1, 0, 0, 1, 1,
-0.07370685, -0.3212068, -3.03842, 1, 0, 0, 1, 1,
-0.07242225, -0.4888358, -2.280361, 1, 0, 0, 1, 1,
-0.07088704, 2.149696, -0.5054979, 1, 0, 0, 1, 1,
-0.07076974, 0.7240444, -0.1316009, 1, 0, 0, 1, 1,
-0.06871758, -0.04272333, -2.850874, 0, 0, 0, 1, 1,
-0.06535043, -1.22911, -1.155376, 0, 0, 0, 1, 1,
-0.06439696, 0.202705, -2.290772, 0, 0, 0, 1, 1,
-0.06202655, -0.6629189, -1.899663, 0, 0, 0, 1, 1,
-0.06082372, -0.08246239, -3.044632, 0, 0, 0, 1, 1,
-0.05926773, 1.490349, 0.137739, 0, 0, 0, 1, 1,
-0.05632707, -0.9405342, -2.821184, 0, 0, 0, 1, 1,
-0.05407302, -0.8977932, -3.345743, 1, 1, 1, 1, 1,
-0.05283775, -1.284308, -3.511317, 1, 1, 1, 1, 1,
-0.05145954, 0.1693384, -0.2502472, 1, 1, 1, 1, 1,
-0.04800388, 0.8465403, 1.029742, 1, 1, 1, 1, 1,
-0.04776865, -1.220544, -5.598844, 1, 1, 1, 1, 1,
-0.04183071, 0.4223592, -1.096653, 1, 1, 1, 1, 1,
-0.03693739, 0.9303619, -1.13064, 1, 1, 1, 1, 1,
-0.03494876, 1.156906, -1.130461, 1, 1, 1, 1, 1,
-0.03494448, 0.2335719, 0.3943076, 1, 1, 1, 1, 1,
-0.03447943, -0.1047752, -1.396353, 1, 1, 1, 1, 1,
-0.03428192, -0.8817676, -3.580644, 1, 1, 1, 1, 1,
-0.03224609, -0.3432687, -3.57303, 1, 1, 1, 1, 1,
-0.02901563, 0.921081, 0.6473243, 1, 1, 1, 1, 1,
-0.02730483, 1.280075, -0.5790319, 1, 1, 1, 1, 1,
-0.02461363, 1.448208, 0.5120695, 1, 1, 1, 1, 1,
-0.02105179, -0.9645578, -2.412421, 0, 0, 1, 1, 1,
-0.0201423, 0.2727482, 1.445078, 1, 0, 0, 1, 1,
-0.01704948, -0.2247452, -2.721652, 1, 0, 0, 1, 1,
-0.01463824, 0.2546194, 0.7364874, 1, 0, 0, 1, 1,
-0.008930551, -0.7345908, -3.639053, 1, 0, 0, 1, 1,
-0.003397838, -0.3042083, -3.877063, 1, 0, 0, 1, 1,
-0.0006431855, -0.0923809, -1.801173, 0, 0, 0, 1, 1,
-0.0005628893, 0.4916462, 1.384052, 0, 0, 0, 1, 1,
-0.0001318172, -0.3206795, -1.934843, 0, 0, 0, 1, 1,
0.001099543, -0.3024344, 4.348597, 0, 0, 0, 1, 1,
0.005026243, 1.399261, 0.4659455, 0, 0, 0, 1, 1,
0.007130081, 1.077919, -0.2627639, 0, 0, 0, 1, 1,
0.01167221, 0.5555402, -2.473172, 0, 0, 0, 1, 1,
0.01276881, -1.175003, 2.695752, 1, 1, 1, 1, 1,
0.0144654, -0.2649341, 4.123459, 1, 1, 1, 1, 1,
0.0144761, -1.97512, 3.327625, 1, 1, 1, 1, 1,
0.01563101, -0.6825321, 4.556119, 1, 1, 1, 1, 1,
0.01766636, 0.3092979, -1.378584, 1, 1, 1, 1, 1,
0.0179428, -1.570925, 4.721863, 1, 1, 1, 1, 1,
0.01964512, -0.7317413, 3.588151, 1, 1, 1, 1, 1,
0.02260234, 2.155271, 0.883684, 1, 1, 1, 1, 1,
0.02355016, 0.8279163, 1.321911, 1, 1, 1, 1, 1,
0.02508244, 1.030051, -0.2468988, 1, 1, 1, 1, 1,
0.02638579, 0.0556742, 1.052622, 1, 1, 1, 1, 1,
0.02947141, -0.5354127, 1.24715, 1, 1, 1, 1, 1,
0.03031074, 0.2587154, 0.3288016, 1, 1, 1, 1, 1,
0.0305735, -1.124197, 2.070938, 1, 1, 1, 1, 1,
0.03713016, 1.147801, 0.7281378, 1, 1, 1, 1, 1,
0.03963797, 0.09178867, 0.4851777, 0, 0, 1, 1, 1,
0.04686074, 0.2962032, 1.076714, 1, 0, 0, 1, 1,
0.04769595, 1.150452, 0.7946787, 1, 0, 0, 1, 1,
0.05556392, 0.3816455, -1.694267, 1, 0, 0, 1, 1,
0.05757564, 1.201045, -0.6506267, 1, 0, 0, 1, 1,
0.06527406, 1.434915, -0.5790051, 1, 0, 0, 1, 1,
0.06564225, -0.6912893, 2.393019, 0, 0, 0, 1, 1,
0.06861649, -0.06005456, 2.09126, 0, 0, 0, 1, 1,
0.06874399, -1.084737, 2.690742, 0, 0, 0, 1, 1,
0.07070636, -1.631236, 2.923318, 0, 0, 0, 1, 1,
0.0712778, 1.643245, -1.27515, 0, 0, 0, 1, 1,
0.07209499, 0.8326862, 0.3442113, 0, 0, 0, 1, 1,
0.07246398, 0.7228801, 0.1119874, 0, 0, 0, 1, 1,
0.07263276, 0.07814346, -0.5523326, 1, 1, 1, 1, 1,
0.073686, -1.513918, 1.544575, 1, 1, 1, 1, 1,
0.07569713, -0.4271848, 3.635437, 1, 1, 1, 1, 1,
0.07881927, 1.733683, 0.673063, 1, 1, 1, 1, 1,
0.08559964, -0.008754672, 1.804115, 1, 1, 1, 1, 1,
0.09722888, -0.7128578, 4.169991, 1, 1, 1, 1, 1,
0.09784929, -0.1497917, 0.9900215, 1, 1, 1, 1, 1,
0.1023165, -0.9866332, 4.198866, 1, 1, 1, 1, 1,
0.1030809, 0.3304085, -0.06335273, 1, 1, 1, 1, 1,
0.1038133, -0.8299067, 0.6441789, 1, 1, 1, 1, 1,
0.1062341, 1.313043, -0.6838496, 1, 1, 1, 1, 1,
0.106673, -1.152328, 3.893226, 1, 1, 1, 1, 1,
0.1076364, 0.4809193, -1.574988, 1, 1, 1, 1, 1,
0.1085933, -0.3176413, 1.990504, 1, 1, 1, 1, 1,
0.1115936, 1.948696, -0.09658223, 1, 1, 1, 1, 1,
0.1125812, -0.01829093, 1.773784, 0, 0, 1, 1, 1,
0.1146213, 1.915894, -0.5059467, 1, 0, 0, 1, 1,
0.1148908, 0.8320334, -0.571022, 1, 0, 0, 1, 1,
0.1195894, -0.7625712, 2.574818, 1, 0, 0, 1, 1,
0.1215353, 0.8175209, -0.3379103, 1, 0, 0, 1, 1,
0.1220518, -2.145586, 1.541047, 1, 0, 0, 1, 1,
0.1265189, -0.1669493, 3.610621, 0, 0, 0, 1, 1,
0.1284903, 0.5982978, 0.1282377, 0, 0, 0, 1, 1,
0.1373983, -1.038485, 3.461166, 0, 0, 0, 1, 1,
0.1446162, -1.16311, 3.102372, 0, 0, 0, 1, 1,
0.1452185, 0.5757146, 0.7374958, 0, 0, 0, 1, 1,
0.1464329, 2.23817, -1.251339, 0, 0, 0, 1, 1,
0.1466348, 1.286236, -0.702523, 0, 0, 0, 1, 1,
0.1472531, 0.1671467, 1.425224, 1, 1, 1, 1, 1,
0.1492461, 0.992897, -0.5415264, 1, 1, 1, 1, 1,
0.1517909, -1.746308, 2.385022, 1, 1, 1, 1, 1,
0.1525133, -0.3818731, 2.466942, 1, 1, 1, 1, 1,
0.1537167, -1.673682, 3.516072, 1, 1, 1, 1, 1,
0.1560091, 1.808022, -1.061283, 1, 1, 1, 1, 1,
0.1563518, 0.3981505, 0.979336, 1, 1, 1, 1, 1,
0.1568971, 0.5117133, 1.92758, 1, 1, 1, 1, 1,
0.1574907, -0.5291052, 2.94953, 1, 1, 1, 1, 1,
0.17266, -0.6504714, 1.95579, 1, 1, 1, 1, 1,
0.173602, 1.210009, 1.6746, 1, 1, 1, 1, 1,
0.1740458, -0.0977876, 1.836295, 1, 1, 1, 1, 1,
0.1751682, -1.366917, 1.588948, 1, 1, 1, 1, 1,
0.1756449, -0.5540905, 2.015261, 1, 1, 1, 1, 1,
0.1756823, 1.074654, 1.395682, 1, 1, 1, 1, 1,
0.1763534, 0.3851757, -0.2509821, 0, 0, 1, 1, 1,
0.1779078, 0.4628568, 1.685916, 1, 0, 0, 1, 1,
0.1823626, -1.010972, 3.524508, 1, 0, 0, 1, 1,
0.1835468, 0.400604, -0.408809, 1, 0, 0, 1, 1,
0.1872951, 0.3833916, -1.57094, 1, 0, 0, 1, 1,
0.1882773, 0.4098209, -0.4466749, 1, 0, 0, 1, 1,
0.1886976, -0.7917477, 1.796725, 0, 0, 0, 1, 1,
0.1897075, -0.1215541, 0.9084772, 0, 0, 0, 1, 1,
0.1902468, 0.08127212, 2.057242, 0, 0, 0, 1, 1,
0.1906164, -0.4554761, 2.360172, 0, 0, 0, 1, 1,
0.1918363, -0.1156574, -0.5024067, 0, 0, 0, 1, 1,
0.1931961, 0.261834, 2.173368, 0, 0, 0, 1, 1,
0.1938075, 0.1687817, 0.4083912, 0, 0, 0, 1, 1,
0.1960478, -1.114202, 5.023046, 1, 1, 1, 1, 1,
0.1962961, -0.4953634, 1.997713, 1, 1, 1, 1, 1,
0.196352, 1.186083, 1.353657, 1, 1, 1, 1, 1,
0.1979862, 1.775476, 1.167231, 1, 1, 1, 1, 1,
0.2025246, -0.107728, 0.6814824, 1, 1, 1, 1, 1,
0.2104321, -2.098734, 5.192927, 1, 1, 1, 1, 1,
0.2122672, 1.686094, 0.7474619, 1, 1, 1, 1, 1,
0.2131613, 0.3218501, 1.656538, 1, 1, 1, 1, 1,
0.2132186, 1.650015, 1.136068, 1, 1, 1, 1, 1,
0.2151294, -0.4642915, 2.337348, 1, 1, 1, 1, 1,
0.2177385, -0.5378866, 2.199717, 1, 1, 1, 1, 1,
0.2204757, 0.8281552, 1.401146, 1, 1, 1, 1, 1,
0.2205581, -2.01991, 0.7545734, 1, 1, 1, 1, 1,
0.2212355, -0.5925609, 3.643315, 1, 1, 1, 1, 1,
0.2213574, 0.9146479, -0.4553343, 1, 1, 1, 1, 1,
0.2237573, 0.8692856, -1.129888, 0, 0, 1, 1, 1,
0.2250523, -0.3794773, 2.48496, 1, 0, 0, 1, 1,
0.2265968, 0.4326351, 1.137595, 1, 0, 0, 1, 1,
0.226704, -1.988479, 3.613585, 1, 0, 0, 1, 1,
0.2288984, -0.4827908, 2.458162, 1, 0, 0, 1, 1,
0.2331384, -2.51527, 2.244084, 1, 0, 0, 1, 1,
0.237505, -1.306956, 2.179027, 0, 0, 0, 1, 1,
0.2380879, -1.860931, 1.101524, 0, 0, 0, 1, 1,
0.2436533, 0.7086785, -0.8331947, 0, 0, 0, 1, 1,
0.2490689, 0.1014044, 2.64568, 0, 0, 0, 1, 1,
0.2497931, -1.36903, 3.308919, 0, 0, 0, 1, 1,
0.2571785, -1.339027, 1.672745, 0, 0, 0, 1, 1,
0.258175, -0.9214255, 2.778093, 0, 0, 0, 1, 1,
0.2647213, -0.522249, 2.833041, 1, 1, 1, 1, 1,
0.2657957, 0.162912, 0.4265893, 1, 1, 1, 1, 1,
0.2667552, 1.10041, 0.04242801, 1, 1, 1, 1, 1,
0.2695797, -1.928381, 3.303565, 1, 1, 1, 1, 1,
0.2714897, -0.9557512, 2.487775, 1, 1, 1, 1, 1,
0.2751746, 1.447676, -0.1732811, 1, 1, 1, 1, 1,
0.2791031, -0.4079398, 1.809402, 1, 1, 1, 1, 1,
0.2809148, -0.5618654, 3.46499, 1, 1, 1, 1, 1,
0.2835254, 0.1622184, -0.7579334, 1, 1, 1, 1, 1,
0.2846705, 1.100267, -0.1591215, 1, 1, 1, 1, 1,
0.2900659, 0.6733418, 0.7488645, 1, 1, 1, 1, 1,
0.2916985, 0.2692642, 1.910116, 1, 1, 1, 1, 1,
0.2939318, 1.027171, 0.3490117, 1, 1, 1, 1, 1,
0.2963275, -1.027911, 2.994876, 1, 1, 1, 1, 1,
0.3006092, 0.6917051, 1.754371, 1, 1, 1, 1, 1,
0.3018264, 0.4847083, 0.1446255, 0, 0, 1, 1, 1,
0.3023798, 1.630818, 0.2317, 1, 0, 0, 1, 1,
0.3025583, -0.646423, 3.443904, 1, 0, 0, 1, 1,
0.3069817, 0.5449754, -0.7521449, 1, 0, 0, 1, 1,
0.3086598, 0.552793, 1.247201, 1, 0, 0, 1, 1,
0.3102487, -0.1751455, 2.644944, 1, 0, 0, 1, 1,
0.3119852, 0.6083182, -0.5443837, 0, 0, 0, 1, 1,
0.3126951, -1.067315, 2.326054, 0, 0, 0, 1, 1,
0.3162039, 1.240113, 0.3111096, 0, 0, 0, 1, 1,
0.316573, 1.110186, 1.651608, 0, 0, 0, 1, 1,
0.3170395, -1.197587, 2.847368, 0, 0, 0, 1, 1,
0.3189602, -0.6053413, 1.745137, 0, 0, 0, 1, 1,
0.3240798, -0.02753943, 3.072171, 0, 0, 0, 1, 1,
0.3293001, 0.2371339, 0.2329433, 1, 1, 1, 1, 1,
0.3417363, -0.8965445, 2.773963, 1, 1, 1, 1, 1,
0.3453861, -0.388043, 0.05683706, 1, 1, 1, 1, 1,
0.3460996, -0.2220759, 2.418423, 1, 1, 1, 1, 1,
0.3461974, 0.09473177, 0.9549052, 1, 1, 1, 1, 1,
0.3489965, -0.3965602, 4.18194, 1, 1, 1, 1, 1,
0.3551921, -1.200996, 2.638681, 1, 1, 1, 1, 1,
0.3582908, 2.563486, 1.170253, 1, 1, 1, 1, 1,
0.3610998, 0.3624167, 1.855172, 1, 1, 1, 1, 1,
0.3618844, 0.6558914, 1.138576, 1, 1, 1, 1, 1,
0.3727379, 0.7283935, -0.1214981, 1, 1, 1, 1, 1,
0.373196, 0.4162645, 1.744147, 1, 1, 1, 1, 1,
0.374642, 0.3310999, 2.051434, 1, 1, 1, 1, 1,
0.3777371, 0.7289003, 0.6762832, 1, 1, 1, 1, 1,
0.3802236, -1.151584, 2.056808, 1, 1, 1, 1, 1,
0.3844433, 0.3688255, 2.060212, 0, 0, 1, 1, 1,
0.3874324, -0.1223903, 1.681406, 1, 0, 0, 1, 1,
0.3891769, 0.4408759, -1.319007, 1, 0, 0, 1, 1,
0.392307, -0.860918, 4.218551, 1, 0, 0, 1, 1,
0.3941221, -0.157484, 3.358742, 1, 0, 0, 1, 1,
0.3976661, -0.8459781, 0.7241023, 1, 0, 0, 1, 1,
0.4034445, -1.904039, 3.780576, 0, 0, 0, 1, 1,
0.4055202, -0.2987891, -0.2465823, 0, 0, 0, 1, 1,
0.4071277, 0.4193142, -0.2500801, 0, 0, 0, 1, 1,
0.4083082, 1.638103, 0.8103654, 0, 0, 0, 1, 1,
0.4178961, -0.007819044, -0.1360051, 0, 0, 0, 1, 1,
0.4192671, -0.772567, 3.035981, 0, 0, 0, 1, 1,
0.4228397, -0.8133581, 3.296074, 0, 0, 0, 1, 1,
0.4231403, 0.9735874, 1.350451, 1, 1, 1, 1, 1,
0.4240372, -1.173077, 2.247256, 1, 1, 1, 1, 1,
0.4307086, 0.1797018, 2.226321, 1, 1, 1, 1, 1,
0.4314199, 0.7622071, 0.1736683, 1, 1, 1, 1, 1,
0.4352657, -0.9931036, 4.124946, 1, 1, 1, 1, 1,
0.4353646, 0.6387689, -0.1702585, 1, 1, 1, 1, 1,
0.4377831, 1.211066, -0.2129302, 1, 1, 1, 1, 1,
0.4409719, -0.2001135, 2.041768, 1, 1, 1, 1, 1,
0.4413177, -1.388325, 3.081764, 1, 1, 1, 1, 1,
0.4444032, 1.581135, 1.35591, 1, 1, 1, 1, 1,
0.4481975, -0.5811121, 3.519753, 1, 1, 1, 1, 1,
0.4484226, 0.04193367, 2.101636, 1, 1, 1, 1, 1,
0.4498504, -0.2578378, 2.958275, 1, 1, 1, 1, 1,
0.4502829, 0.3299947, 0.6075253, 1, 1, 1, 1, 1,
0.4507312, 0.9647555, 0.547452, 1, 1, 1, 1, 1,
0.4542908, 0.3546694, 1.704977, 0, 0, 1, 1, 1,
0.4565456, 1.062976, 1.369391, 1, 0, 0, 1, 1,
0.4596821, -0.2179426, 3.282961, 1, 0, 0, 1, 1,
0.4612249, -0.5704318, 4.058022, 1, 0, 0, 1, 1,
0.4628157, 1.343721, -0.8156891, 1, 0, 0, 1, 1,
0.4703637, 0.2988465, 1.040291, 1, 0, 0, 1, 1,
0.4756042, -0.6933911, 3.209574, 0, 0, 0, 1, 1,
0.4840842, -1.6051, 3.005456, 0, 0, 0, 1, 1,
0.4845701, -0.1976489, 2.983371, 0, 0, 0, 1, 1,
0.4855987, 0.7708688, 0.7703376, 0, 0, 0, 1, 1,
0.4986514, 0.5880548, 1.337774, 0, 0, 0, 1, 1,
0.5033978, 1.371507, 1.082288, 0, 0, 0, 1, 1,
0.5059006, -2.671758, 2.298561, 0, 0, 0, 1, 1,
0.5061908, -1.661784, 3.720071, 1, 1, 1, 1, 1,
0.5073694, -0.379611, 1.839207, 1, 1, 1, 1, 1,
0.5143594, 0.473071, 2.908667, 1, 1, 1, 1, 1,
0.5158904, -0.08094303, -0.1054091, 1, 1, 1, 1, 1,
0.5181357, 0.879281, 1.838697, 1, 1, 1, 1, 1,
0.5279196, 0.3122468, 0.5247362, 1, 1, 1, 1, 1,
0.5280424, 0.7653622, -0.9532326, 1, 1, 1, 1, 1,
0.5297791, 0.5862794, 1.180391, 1, 1, 1, 1, 1,
0.5300002, -1.19076, 3.218908, 1, 1, 1, 1, 1,
0.5310715, -1.449673, 2.168703, 1, 1, 1, 1, 1,
0.5328103, 1.336105, 1.953506, 1, 1, 1, 1, 1,
0.5361167, 0.3786603, 1.705324, 1, 1, 1, 1, 1,
0.538159, -1.182132, 3.670596, 1, 1, 1, 1, 1,
0.5491846, -1.543848, 1.984049, 1, 1, 1, 1, 1,
0.5522462, -2.152711, 2.659809, 1, 1, 1, 1, 1,
0.5680159, -0.5317021, 1.920852, 0, 0, 1, 1, 1,
0.570556, 0.8095842, 1.08823, 1, 0, 0, 1, 1,
0.575271, -1.133661, 3.488607, 1, 0, 0, 1, 1,
0.5766029, 1.445649, 0.7965, 1, 0, 0, 1, 1,
0.5775957, 1.169192, -0.6747432, 1, 0, 0, 1, 1,
0.5801305, 1.464725, 1.58368, 1, 0, 0, 1, 1,
0.5802225, -0.07291497, 1.81885, 0, 0, 0, 1, 1,
0.5811248, 0.3266315, 0.9643489, 0, 0, 0, 1, 1,
0.5829527, -1.656459, 2.94411, 0, 0, 0, 1, 1,
0.5904264, 0.3789409, 0.1017811, 0, 0, 0, 1, 1,
0.5916939, -0.03054425, 1.5045, 0, 0, 0, 1, 1,
0.5961241, -0.1827693, 2.412039, 0, 0, 0, 1, 1,
0.5982568, 2.631289, 0.5771827, 0, 0, 0, 1, 1,
0.599263, -1.324462, 3.68765, 1, 1, 1, 1, 1,
0.6002722, 0.09232453, 0.5232388, 1, 1, 1, 1, 1,
0.6009381, -0.9457679, 0.9688419, 1, 1, 1, 1, 1,
0.6037245, 0.3284198, 1.899447, 1, 1, 1, 1, 1,
0.609075, -0.9243642, 1.522833, 1, 1, 1, 1, 1,
0.6103588, -0.2356014, 3.843601, 1, 1, 1, 1, 1,
0.6132927, -1.497338, 3.322956, 1, 1, 1, 1, 1,
0.6193793, -0.2265093, 0.8943956, 1, 1, 1, 1, 1,
0.6202925, 0.2038606, 0.5708421, 1, 1, 1, 1, 1,
0.6294881, 1.326883, 0.2574617, 1, 1, 1, 1, 1,
0.6305156, -0.06070377, 2.015354, 1, 1, 1, 1, 1,
0.6319838, -0.4706069, 0.3573966, 1, 1, 1, 1, 1,
0.6322753, -0.2203401, 2.636766, 1, 1, 1, 1, 1,
0.6327831, -0.6558586, 2.049853, 1, 1, 1, 1, 1,
0.6364231, 2.500604, -0.3772187, 1, 1, 1, 1, 1,
0.6380014, 0.6774727, 0.2087919, 0, 0, 1, 1, 1,
0.642455, 0.749361, 0.7788811, 1, 0, 0, 1, 1,
0.6464621, -0.233593, 2.017279, 1, 0, 0, 1, 1,
0.6537626, 0.9309176, 1.034037, 1, 0, 0, 1, 1,
0.6555271, 0.9110084, 1.262218, 1, 0, 0, 1, 1,
0.6569765, 0.00043973, 2.499761, 1, 0, 0, 1, 1,
0.6675322, -0.5314933, 3.280546, 0, 0, 0, 1, 1,
0.6704837, -0.7088912, 2.501355, 0, 0, 0, 1, 1,
0.674093, -1.069776, 2.416334, 0, 0, 0, 1, 1,
0.6779069, 0.2363898, -0.5122653, 0, 0, 0, 1, 1,
0.6824183, 1.365894, 0.6977027, 0, 0, 0, 1, 1,
0.6922504, -0.8137714, 2.042172, 0, 0, 0, 1, 1,
0.6965647, 1.29096, 1.01198, 0, 0, 0, 1, 1,
0.697021, -1.573999, 2.303183, 1, 1, 1, 1, 1,
0.6993046, 0.4738174, -0.214412, 1, 1, 1, 1, 1,
0.7061701, -0.7794852, 2.72403, 1, 1, 1, 1, 1,
0.7098118, 0.1001641, 1.383533, 1, 1, 1, 1, 1,
0.7210708, -0.7877527, 2.472034, 1, 1, 1, 1, 1,
0.7215423, 1.029393, 1.489981, 1, 1, 1, 1, 1,
0.7215616, -0.06840478, 2.286344, 1, 1, 1, 1, 1,
0.7270618, -0.3626443, 1.507871, 1, 1, 1, 1, 1,
0.735162, -0.8957046, 1.524294, 1, 1, 1, 1, 1,
0.7362156, 1.126319, -0.6404052, 1, 1, 1, 1, 1,
0.7394924, -0.8481104, 4.453945, 1, 1, 1, 1, 1,
0.7449207, -0.2601794, 1.100753, 1, 1, 1, 1, 1,
0.7504781, -0.1409052, 2.885559, 1, 1, 1, 1, 1,
0.7521004, -2.678127, 3.949679, 1, 1, 1, 1, 1,
0.7525514, -0.3003012, 2.056337, 1, 1, 1, 1, 1,
0.7586747, -0.8877396, 3.504071, 0, 0, 1, 1, 1,
0.7649372, 0.4688298, 0.7837829, 1, 0, 0, 1, 1,
0.7652515, 0.9513267, 1.364255, 1, 0, 0, 1, 1,
0.7681281, -0.09597563, 2.745061, 1, 0, 0, 1, 1,
0.7692159, 0.4063055, 1.398864, 1, 0, 0, 1, 1,
0.7773134, 0.220022, 1.424486, 1, 0, 0, 1, 1,
0.7777071, 0.1213713, 1.886806, 0, 0, 0, 1, 1,
0.777803, -1.65986, 2.964678, 0, 0, 0, 1, 1,
0.7860031, 1.025499, 1.305796, 0, 0, 0, 1, 1,
0.7903076, 1.647846, 1.505352, 0, 0, 0, 1, 1,
0.7953926, 0.07666467, 1.144206, 0, 0, 0, 1, 1,
0.7971622, 1.283239, -0.792638, 0, 0, 0, 1, 1,
0.7972772, -0.4072097, 3.458824, 0, 0, 0, 1, 1,
0.8029465, 0.3446972, -1.09678, 1, 1, 1, 1, 1,
0.8071682, -1.075605, 4.09708, 1, 1, 1, 1, 1,
0.8086962, 0.7574403, 0.7744186, 1, 1, 1, 1, 1,
0.811073, -0.9215948, 3.807647, 1, 1, 1, 1, 1,
0.8128153, 0.5214879, -0.2988783, 1, 1, 1, 1, 1,
0.824177, 0.05294987, 1.611683, 1, 1, 1, 1, 1,
0.8333482, -0.01619351, 2.423992, 1, 1, 1, 1, 1,
0.8349909, 1.155164, -0.2938708, 1, 1, 1, 1, 1,
0.8375452, -2.052321, 1.235093, 1, 1, 1, 1, 1,
0.8438753, -0.6449478, 3.420054, 1, 1, 1, 1, 1,
0.8451898, -0.4718226, 0.3940338, 1, 1, 1, 1, 1,
0.8487778, 0.681181, 0.001370245, 1, 1, 1, 1, 1,
0.8492398, -1.555639, 2.759719, 1, 1, 1, 1, 1,
0.8511486, -1.951114, 4.869065, 1, 1, 1, 1, 1,
0.8546882, -1.029848, 3.005976, 1, 1, 1, 1, 1,
0.8550308, -1.236362, 0.5393223, 0, 0, 1, 1, 1,
0.8591364, -0.3928688, 1.830487, 1, 0, 0, 1, 1,
0.8591806, -0.6596946, 1.715164, 1, 0, 0, 1, 1,
0.861522, 1.500598, -0.4237488, 1, 0, 0, 1, 1,
0.8641577, -1.128846, 2.198967, 1, 0, 0, 1, 1,
0.8769602, -1.596179, 3.205142, 1, 0, 0, 1, 1,
0.8876202, -0.8079221, 4.205866, 0, 0, 0, 1, 1,
0.8959931, -0.01268821, 1.113153, 0, 0, 0, 1, 1,
0.9041141, -0.8258429, 1.546533, 0, 0, 0, 1, 1,
0.9048985, -2.03021, 2.954127, 0, 0, 0, 1, 1,
0.9064442, 1.44508, -0.889847, 0, 0, 0, 1, 1,
0.909615, -0.348828, 1.925772, 0, 0, 0, 1, 1,
0.9178005, 0.005462736, 2.764664, 0, 0, 0, 1, 1,
0.9200421, -0.3655938, 1.153007, 1, 1, 1, 1, 1,
0.9217473, -0.4181493, 1.630682, 1, 1, 1, 1, 1,
0.9239547, 0.8850229, -0.2475103, 1, 1, 1, 1, 1,
0.9293099, 0.4574727, 1.391635, 1, 1, 1, 1, 1,
0.930537, -0.04982125, 2.155934, 1, 1, 1, 1, 1,
0.9327378, 1.747878, 0.1723232, 1, 1, 1, 1, 1,
0.9333388, -0.8525543, 2.836881, 1, 1, 1, 1, 1,
0.9350573, -0.4447843, 0.9884204, 1, 1, 1, 1, 1,
0.9381475, -1.406582, 3.232526, 1, 1, 1, 1, 1,
0.9406756, -0.05279296, 0.9761271, 1, 1, 1, 1, 1,
0.9447139, 0.7891994, -0.5018805, 1, 1, 1, 1, 1,
0.9462843, -0.2170928, 3.531702, 1, 1, 1, 1, 1,
0.9474469, -0.6305445, 1.488574, 1, 1, 1, 1, 1,
0.9501878, -0.4210274, 1.267994, 1, 1, 1, 1, 1,
0.9536424, -0.05428952, 1.518413, 1, 1, 1, 1, 1,
0.9543883, -1.227395, 0.2191838, 0, 0, 1, 1, 1,
0.9556479, -1.254828, 2.354771, 1, 0, 0, 1, 1,
0.9610751, 1.757483, 1.448359, 1, 0, 0, 1, 1,
0.962743, 0.3334554, 0.647288, 1, 0, 0, 1, 1,
0.9665633, -0.7443545, 3.165509, 1, 0, 0, 1, 1,
0.9776741, -0.6200804, 0.8941194, 1, 0, 0, 1, 1,
0.9807782, -0.1274422, 1.79671, 0, 0, 0, 1, 1,
0.9841276, 1.385081, 1.773676, 0, 0, 0, 1, 1,
0.9846305, -1.106695, 0.8993549, 0, 0, 0, 1, 1,
0.9870104, 0.5583995, -0.3436622, 0, 0, 0, 1, 1,
1.006341, 0.593179, -1.292493, 0, 0, 0, 1, 1,
1.012113, 0.8033521, 1.373945, 0, 0, 0, 1, 1,
1.013028, 0.1651959, 1.259562, 0, 0, 0, 1, 1,
1.015545, 0.5708974, 2.446598, 1, 1, 1, 1, 1,
1.022441, -0.8988631, 2.947796, 1, 1, 1, 1, 1,
1.0236, -2.657878, 1.308579, 1, 1, 1, 1, 1,
1.024214, -0.2421881, 0.3556645, 1, 1, 1, 1, 1,
1.0296, 0.3348118, 0.95298, 1, 1, 1, 1, 1,
1.046155, -0.6391367, 1.093566, 1, 1, 1, 1, 1,
1.047239, -0.4311423, 1.901895, 1, 1, 1, 1, 1,
1.050015, 0.1961147, -1.000401, 1, 1, 1, 1, 1,
1.051706, 0.003803993, 2.423007, 1, 1, 1, 1, 1,
1.063581, -0.4298145, 1.222866, 1, 1, 1, 1, 1,
1.067902, -1.379458, 1.807052, 1, 1, 1, 1, 1,
1.068385, -1.091599, 1.86991, 1, 1, 1, 1, 1,
1.07302, 0.218858, 2.400157, 1, 1, 1, 1, 1,
1.078675, 2.157253, -0.2650782, 1, 1, 1, 1, 1,
1.088415, -1.744325, 4.773653, 1, 1, 1, 1, 1,
1.095714, -1.875555, 1.035904, 0, 0, 1, 1, 1,
1.097215, 0.5636261, 3.215331, 1, 0, 0, 1, 1,
1.099547, 0.743666, 1.901892, 1, 0, 0, 1, 1,
1.107274, -1.144428, 2.266483, 1, 0, 0, 1, 1,
1.110327, 0.4552583, 0.8659268, 1, 0, 0, 1, 1,
1.119804, -0.1426355, -0.05913084, 1, 0, 0, 1, 1,
1.122626, 0.08826474, 1.239058, 0, 0, 0, 1, 1,
1.123722, -1.683566, 1.836488, 0, 0, 0, 1, 1,
1.126751, -0.9721898, 0.8363682, 0, 0, 0, 1, 1,
1.127945, -0.2789372, 1.900905, 0, 0, 0, 1, 1,
1.132044, -0.9169101, 0.8078645, 0, 0, 0, 1, 1,
1.137979, -0.7121264, 2.070561, 0, 0, 0, 1, 1,
1.141731, 0.9716639, -0.1424858, 0, 0, 0, 1, 1,
1.143432, 0.5016124, 1.271657, 1, 1, 1, 1, 1,
1.153419, 0.9764907, 1.935668, 1, 1, 1, 1, 1,
1.158646, 0.6768625, 0.9788694, 1, 1, 1, 1, 1,
1.159595, 0.0800826, 1.431379, 1, 1, 1, 1, 1,
1.160495, -0.8705525, 3.135753, 1, 1, 1, 1, 1,
1.163149, 0.6493662, 1.058612, 1, 1, 1, 1, 1,
1.165821, -1.721067, 2.535469, 1, 1, 1, 1, 1,
1.174209, -2.062598, 4.105391, 1, 1, 1, 1, 1,
1.178004, -0.4635359, 1.335136, 1, 1, 1, 1, 1,
1.183419, 0.3871268, 1.895727, 1, 1, 1, 1, 1,
1.191385, 0.3052818, 0.6625599, 1, 1, 1, 1, 1,
1.191962, 2.156087, 0.7599044, 1, 1, 1, 1, 1,
1.195134, 0.6912947, 1.401432, 1, 1, 1, 1, 1,
1.197539, 0.4619458, 1.319351, 1, 1, 1, 1, 1,
1.19974, 0.3195644, 0.8851755, 1, 1, 1, 1, 1,
1.200807, -0.1926294, 0.6647453, 0, 0, 1, 1, 1,
1.206472, 1.74153, 0.8839227, 1, 0, 0, 1, 1,
1.206475, -0.1759412, 0.9352853, 1, 0, 0, 1, 1,
1.214015, -0.3641079, 2.777608, 1, 0, 0, 1, 1,
1.222388, -0.6016216, 1.290634, 1, 0, 0, 1, 1,
1.223788, -1.487121, -0.04298243, 1, 0, 0, 1, 1,
1.228129, 1.168232, 2.522188, 0, 0, 0, 1, 1,
1.234816, 0.2827362, 0.7144362, 0, 0, 0, 1, 1,
1.271645, -0.08498678, 3.494888, 0, 0, 0, 1, 1,
1.273675, 0.7146832, 2.20044, 0, 0, 0, 1, 1,
1.280507, 0.1870699, 1.924402, 0, 0, 0, 1, 1,
1.282336, -0.570485, 0.9849368, 0, 0, 0, 1, 1,
1.292918, 0.6804526, 1.542194, 0, 0, 0, 1, 1,
1.296837, -0.2196247, 2.84538, 1, 1, 1, 1, 1,
1.303014, 1.434369, 1.559461, 1, 1, 1, 1, 1,
1.306781, -1.353827, 2.018284, 1, 1, 1, 1, 1,
1.308929, 0.05081123, 0.8910068, 1, 1, 1, 1, 1,
1.313029, -1.037937, 1.708149, 1, 1, 1, 1, 1,
1.315558, -0.09043048, 1.72321, 1, 1, 1, 1, 1,
1.327321, -0.9915224, 1.327976, 1, 1, 1, 1, 1,
1.342165, 0.4921784, 1.807967, 1, 1, 1, 1, 1,
1.346501, 1.113729, 0.0370016, 1, 1, 1, 1, 1,
1.350038, 0.03901428, 2.909148, 1, 1, 1, 1, 1,
1.353829, 1.016405, -0.3340843, 1, 1, 1, 1, 1,
1.363947, 0.1644, 1.618921, 1, 1, 1, 1, 1,
1.378581, 1.132631, -0.16529, 1, 1, 1, 1, 1,
1.385471, 0.2832505, 1.642845, 1, 1, 1, 1, 1,
1.394491, 0.5765888, -0.1142505, 1, 1, 1, 1, 1,
1.396481, 0.1738691, 1.999708, 0, 0, 1, 1, 1,
1.39815, -0.7200083, 3.083388, 1, 0, 0, 1, 1,
1.404273, 0.1943939, 1.478566, 1, 0, 0, 1, 1,
1.406176, 1.576725, 0.5798156, 1, 0, 0, 1, 1,
1.408422, -0.4610176, 0.7849573, 1, 0, 0, 1, 1,
1.415965, 0.8159376, -0.2294214, 1, 0, 0, 1, 1,
1.421985, -0.8334334, 1.879186, 0, 0, 0, 1, 1,
1.423572, 0.38114, 2.152491, 0, 0, 0, 1, 1,
1.439458, -0.3321134, 3.018201, 0, 0, 0, 1, 1,
1.44089, -0.526899, 1.524309, 0, 0, 0, 1, 1,
1.448644, 0.9282225, 1.785282, 0, 0, 0, 1, 1,
1.452946, 1.176131, 0.8124945, 0, 0, 0, 1, 1,
1.453292, 0.107028, 1.895728, 0, 0, 0, 1, 1,
1.456031, -0.9461496, 2.057556, 1, 1, 1, 1, 1,
1.457055, 0.3295995, 0.003800889, 1, 1, 1, 1, 1,
1.490837, 0.4823531, 4.351598, 1, 1, 1, 1, 1,
1.502172, 0.4562381, -0.6146981, 1, 1, 1, 1, 1,
1.503954, 1.057124, 0.4550422, 1, 1, 1, 1, 1,
1.508995, 0.5836855, 1.397752, 1, 1, 1, 1, 1,
1.526018, -1.289806, 2.711808, 1, 1, 1, 1, 1,
1.529948, -0.5400442, 0.382654, 1, 1, 1, 1, 1,
1.536658, 0.7091969, 1.185686, 1, 1, 1, 1, 1,
1.543945, 0.08681719, 2.728745, 1, 1, 1, 1, 1,
1.551206, 1.537352, 1.61528, 1, 1, 1, 1, 1,
1.552216, -1.034081, 1.311141, 1, 1, 1, 1, 1,
1.566819, -0.6656283, 1.455983, 1, 1, 1, 1, 1,
1.570067, -0.03157172, 1.508317, 1, 1, 1, 1, 1,
1.570708, -0.9413342, 0.9594641, 1, 1, 1, 1, 1,
1.588412, -2.075743, 0.1170887, 0, 0, 1, 1, 1,
1.599853, -0.2289224, 1.367327, 1, 0, 0, 1, 1,
1.601194, -0.7544041, 2.853106, 1, 0, 0, 1, 1,
1.603415, -0.6250906, 1.615109, 1, 0, 0, 1, 1,
1.605641, 1.482337, 0.3716193, 1, 0, 0, 1, 1,
1.606602, 0.8587252, 0.5009792, 1, 0, 0, 1, 1,
1.610268, -0.49377, -0.3566998, 0, 0, 0, 1, 1,
1.622801, 0.3411075, 1.350029, 0, 0, 0, 1, 1,
1.627542, 0.3920615, 1.213971, 0, 0, 0, 1, 1,
1.643893, -0.6060649, 2.835372, 0, 0, 0, 1, 1,
1.645288, 0.2417505, 2.146431, 0, 0, 0, 1, 1,
1.667671, -1.867175, 1.18839, 0, 0, 0, 1, 1,
1.668629, 0.4599309, -0.1112515, 0, 0, 0, 1, 1,
1.683831, 0.5206084, 2.355199, 1, 1, 1, 1, 1,
1.69095, 1.302681, 0.4388974, 1, 1, 1, 1, 1,
1.706443, -0.2907139, 0.6488746, 1, 1, 1, 1, 1,
1.727674, -0.8030612, 3.647306, 1, 1, 1, 1, 1,
1.738039, 1.447617, 1.893698, 1, 1, 1, 1, 1,
1.738095, -0.4532682, -0.3152598, 1, 1, 1, 1, 1,
1.741825, 0.3672005, 1.902999, 1, 1, 1, 1, 1,
1.774984, 1.61111, 0.4989263, 1, 1, 1, 1, 1,
1.827414, -0.08218565, 1.729211, 1, 1, 1, 1, 1,
1.834925, -1.054619, 1.305236, 1, 1, 1, 1, 1,
1.857618, -1.669327, 3.082758, 1, 1, 1, 1, 1,
1.863811, 1.083427, 2.348563, 1, 1, 1, 1, 1,
1.88449, 1.152093, -0.08805409, 1, 1, 1, 1, 1,
1.89166, 0.2783777, 2.910127, 1, 1, 1, 1, 1,
1.912707, 0.6413952, 1.826865, 1, 1, 1, 1, 1,
1.923995, -1.417382, 0.9437616, 0, 0, 1, 1, 1,
1.947858, -0.8043077, 1.905764, 1, 0, 0, 1, 1,
1.952633, -0.2279618, 1.536381, 1, 0, 0, 1, 1,
1.997465, -1.154527, 2.678868, 1, 0, 0, 1, 1,
2.029707, 0.4183787, 0.7715837, 1, 0, 0, 1, 1,
2.057328, 0.7984604, 0.6937712, 1, 0, 0, 1, 1,
2.149846, -0.2950352, 0.7626011, 0, 0, 0, 1, 1,
2.178284, -0.2636508, 3.027537, 0, 0, 0, 1, 1,
2.184443, -1.379635, 2.438823, 0, 0, 0, 1, 1,
2.186629, 0.02770367, 2.519475, 0, 0, 0, 1, 1,
2.192123, 0.8727803, -0.1664221, 0, 0, 0, 1, 1,
2.230104, 1.303276, 0.2584601, 0, 0, 0, 1, 1,
2.2573, -0.3376728, 1.994219, 0, 0, 0, 1, 1,
2.350711, 2.49484, 1.036283, 1, 1, 1, 1, 1,
2.374663, -0.2200555, 0.4605957, 1, 1, 1, 1, 1,
2.392144, -0.09342086, 2.470804, 1, 1, 1, 1, 1,
2.394588, -0.4507339, 0.2423795, 1, 1, 1, 1, 1,
2.394861, 0.918511, 1.644717, 1, 1, 1, 1, 1,
2.718616, 0.6086466, 0.06414697, 1, 1, 1, 1, 1,
3.020231, 0.000227718, 1.657368, 1, 1, 1, 1, 1
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
var radius = 9.648349;
var distance = 33.88942;
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
mvMatrix.translate( 0.1017568, -0.5239991, 0.2029583 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.88942);
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
