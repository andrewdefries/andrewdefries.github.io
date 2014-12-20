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
-3.459992, 0.1877665, -1.412993, 1, 0, 0, 1,
-3.070247, 1.70955, -1.089932, 1, 0.007843138, 0, 1,
-2.890939, -1.34004, -1.813344, 1, 0.01176471, 0, 1,
-2.639442, -0.6135899, -1.864143, 1, 0.01960784, 0, 1,
-2.544175, -0.8963572, -0.8096157, 1, 0.02352941, 0, 1,
-2.467414, 0.923136, -0.3720313, 1, 0.03137255, 0, 1,
-2.443998, -0.2279655, -0.3951244, 1, 0.03529412, 0, 1,
-2.382268, 0.01995078, -3.222742, 1, 0.04313726, 0, 1,
-2.375939, 1.479282, -2.109555, 1, 0.04705882, 0, 1,
-2.370561, -0.08928218, -1.437754, 1, 0.05490196, 0, 1,
-2.331698, -0.41797, -2.612767, 1, 0.05882353, 0, 1,
-2.281008, -0.3962548, 0.2804761, 1, 0.06666667, 0, 1,
-2.247717, -0.3517335, -1.580418, 1, 0.07058824, 0, 1,
-2.200224, 0.6945162, -0.8295671, 1, 0.07843138, 0, 1,
-2.197797, 0.4281514, -2.844782, 1, 0.08235294, 0, 1,
-2.149601, -1.302563, -1.18555, 1, 0.09019608, 0, 1,
-2.12069, -0.2070825, -2.218609, 1, 0.09411765, 0, 1,
-2.059492, -0.8284002, -2.923139, 1, 0.1019608, 0, 1,
-2.051308, 0.01201136, -1.380041, 1, 0.1098039, 0, 1,
-2.050174, 0.09523949, -0.8298112, 1, 0.1137255, 0, 1,
-2.048846, -0.5938807, -1.854948, 1, 0.1215686, 0, 1,
-2.040968, -1.128004, -3.063447, 1, 0.1254902, 0, 1,
-1.975127, -1.209825, -1.97125, 1, 0.1333333, 0, 1,
-1.973627, 0.01828495, -1.704733, 1, 0.1372549, 0, 1,
-1.9561, -1.058743, -2.474884, 1, 0.145098, 0, 1,
-1.912815, -0.02721979, -1.506386, 1, 0.1490196, 0, 1,
-1.897036, -0.8590702, -3.365405, 1, 0.1568628, 0, 1,
-1.887235, 0.6405588, -1.778722, 1, 0.1607843, 0, 1,
-1.884732, 1.106767, -2.249015, 1, 0.1686275, 0, 1,
-1.865095, 0.1085769, -0.3025239, 1, 0.172549, 0, 1,
-1.861847, -0.2599986, -3.013216, 1, 0.1803922, 0, 1,
-1.851191, -1.518777, -3.042116, 1, 0.1843137, 0, 1,
-1.837388, 0.9929477, -0.5427306, 1, 0.1921569, 0, 1,
-1.835223, -0.09021801, -0.8337037, 1, 0.1960784, 0, 1,
-1.832928, 1.253619, -1.727121, 1, 0.2039216, 0, 1,
-1.807939, 0.5532771, -0.4251426, 1, 0.2117647, 0, 1,
-1.807575, -1.953827, -0.1716777, 1, 0.2156863, 0, 1,
-1.802139, 0.8864425, -0.5072623, 1, 0.2235294, 0, 1,
-1.78555, -0.2021867, -1.250502, 1, 0.227451, 0, 1,
-1.774308, 2.715037, 0.01270632, 1, 0.2352941, 0, 1,
-1.764596, 0.7843632, -1.474617, 1, 0.2392157, 0, 1,
-1.7258, 0.9294862, -1.33394, 1, 0.2470588, 0, 1,
-1.724124, 0.1788098, -2.797901, 1, 0.2509804, 0, 1,
-1.694101, 0.1206732, -0.7733817, 1, 0.2588235, 0, 1,
-1.69384, 0.6386303, 1.092304, 1, 0.2627451, 0, 1,
-1.687814, 2.047117, -1.520242, 1, 0.2705882, 0, 1,
-1.684002, -1.483086, -1.695984, 1, 0.2745098, 0, 1,
-1.663438, -0.2399633, -3.368989, 1, 0.282353, 0, 1,
-1.656717, -0.3708189, -2.531013, 1, 0.2862745, 0, 1,
-1.656051, -0.4698595, -3.754222, 1, 0.2941177, 0, 1,
-1.635139, 2.454075, -0.7597813, 1, 0.3019608, 0, 1,
-1.634333, 0.9991255, -1.456167, 1, 0.3058824, 0, 1,
-1.630615, -0.1520694, -2.178706, 1, 0.3137255, 0, 1,
-1.624481, 0.3006103, -0.3412692, 1, 0.3176471, 0, 1,
-1.623764, -0.9485797, -1.250404, 1, 0.3254902, 0, 1,
-1.618351, 1.15461, -1.152748, 1, 0.3294118, 0, 1,
-1.615868, 0.4217537, -2.060997, 1, 0.3372549, 0, 1,
-1.603375, 2.580113, 0.07136373, 1, 0.3411765, 0, 1,
-1.581604, -0.4642794, -2.072032, 1, 0.3490196, 0, 1,
-1.579494, 0.5155811, -2.888798, 1, 0.3529412, 0, 1,
-1.574114, 0.137152, -0.2319642, 1, 0.3607843, 0, 1,
-1.567778, -0.440349, -2.22223, 1, 0.3647059, 0, 1,
-1.524573, 0.5408428, -2.452973, 1, 0.372549, 0, 1,
-1.516231, -0.5232683, 0.09343424, 1, 0.3764706, 0, 1,
-1.509534, 0.06237591, -1.65633, 1, 0.3843137, 0, 1,
-1.505775, 0.745595, -0.8532816, 1, 0.3882353, 0, 1,
-1.502953, -0.1999139, -2.086184, 1, 0.3960784, 0, 1,
-1.493665, -0.6967948, -1.8191, 1, 0.4039216, 0, 1,
-1.480714, 0.3898892, 0.9181626, 1, 0.4078431, 0, 1,
-1.466001, 0.2456063, -0.6594662, 1, 0.4156863, 0, 1,
-1.457307, -0.06875005, -3.020558, 1, 0.4196078, 0, 1,
-1.449116, 0.04921713, -0.4195922, 1, 0.427451, 0, 1,
-1.44648, 1.060183, -1.276851, 1, 0.4313726, 0, 1,
-1.446322, 2.430471, -0.7750249, 1, 0.4392157, 0, 1,
-1.44266, -0.6443107, -2.877498, 1, 0.4431373, 0, 1,
-1.441406, -0.6779673, -1.649633, 1, 0.4509804, 0, 1,
-1.420436, 1.70105, -2.14411, 1, 0.454902, 0, 1,
-1.419608, 0.3151648, -2.472297, 1, 0.4627451, 0, 1,
-1.381691, -1.662401, -2.294723, 1, 0.4666667, 0, 1,
-1.36827, 0.7571933, -1.04647, 1, 0.4745098, 0, 1,
-1.364727, -0.8735308, -3.436993, 1, 0.4784314, 0, 1,
-1.355765, -0.4983558, -2.491803, 1, 0.4862745, 0, 1,
-1.342586, 0.2307506, -1.517897, 1, 0.4901961, 0, 1,
-1.340644, 1.650104, -1.004951, 1, 0.4980392, 0, 1,
-1.338496, -0.7542781, -2.502636, 1, 0.5058824, 0, 1,
-1.338485, -0.8047195, -0.8706431, 1, 0.509804, 0, 1,
-1.335164, -0.03562934, 0.1641693, 1, 0.5176471, 0, 1,
-1.33222, -0.9713935, -3.68627, 1, 0.5215687, 0, 1,
-1.329199, -0.2234049, -3.590726, 1, 0.5294118, 0, 1,
-1.324945, -0.1218119, 0.2095163, 1, 0.5333334, 0, 1,
-1.322111, -0.374341, -3.700508, 1, 0.5411765, 0, 1,
-1.319733, -0.5648844, -1.895097, 1, 0.5450981, 0, 1,
-1.318217, -0.2983981, -2.424317, 1, 0.5529412, 0, 1,
-1.31423, -1.320538, -1.107914, 1, 0.5568628, 0, 1,
-1.313693, 1.035711, -1.837857, 1, 0.5647059, 0, 1,
-1.310222, -0.7806975, -2.811789, 1, 0.5686275, 0, 1,
-1.309934, 0.6093319, -1.813224, 1, 0.5764706, 0, 1,
-1.302063, 1.067712, -0.6308773, 1, 0.5803922, 0, 1,
-1.299362, -0.07518802, -0.3371803, 1, 0.5882353, 0, 1,
-1.293974, 1.619714, -0.2925396, 1, 0.5921569, 0, 1,
-1.29384, 0.0818591, -2.067076, 1, 0.6, 0, 1,
-1.287116, -0.6459655, -2.041744, 1, 0.6078432, 0, 1,
-1.280107, 0.2144097, -1.122598, 1, 0.6117647, 0, 1,
-1.272235, -0.6835248, -2.45314, 1, 0.6196079, 0, 1,
-1.268429, 0.8418553, -0.3790255, 1, 0.6235294, 0, 1,
-1.265269, 2.821147, -0.2218969, 1, 0.6313726, 0, 1,
-1.264614, 0.8647051, -1.567873, 1, 0.6352941, 0, 1,
-1.254728, 0.9446982, -1.748497, 1, 0.6431373, 0, 1,
-1.251669, -0.07461891, -0.8396558, 1, 0.6470588, 0, 1,
-1.246669, -0.032141, -1.333688, 1, 0.654902, 0, 1,
-1.239628, 0.5643256, -0.112717, 1, 0.6588235, 0, 1,
-1.218965, -0.8530618, -1.828561, 1, 0.6666667, 0, 1,
-1.205992, -0.3177162, -2.543034, 1, 0.6705883, 0, 1,
-1.201468, -1.879468, -1.421629, 1, 0.6784314, 0, 1,
-1.194904, 0.5838485, -0.515864, 1, 0.682353, 0, 1,
-1.193352, -1.687772, -2.122941, 1, 0.6901961, 0, 1,
-1.19268, 0.6757841, -1.313442, 1, 0.6941177, 0, 1,
-1.182014, 0.85832, -1.745888, 1, 0.7019608, 0, 1,
-1.181268, -1.178705, -2.574567, 1, 0.7098039, 0, 1,
-1.178404, 1.868486, 0.7406825, 1, 0.7137255, 0, 1,
-1.157481, 0.65493, -0.1410237, 1, 0.7215686, 0, 1,
-1.152358, 2.274816, 1.581095, 1, 0.7254902, 0, 1,
-1.151061, -0.4339657, -1.668685, 1, 0.7333333, 0, 1,
-1.149329, -1.127458, -0.02332555, 1, 0.7372549, 0, 1,
-1.142936, -0.5585051, -2.605369, 1, 0.7450981, 0, 1,
-1.135304, -1.705526, -4.936297, 1, 0.7490196, 0, 1,
-1.12467, -1.132673, -3.356235, 1, 0.7568628, 0, 1,
-1.119356, -0.2296679, -1.530772, 1, 0.7607843, 0, 1,
-1.117859, -0.0356578, -0.5942344, 1, 0.7686275, 0, 1,
-1.107847, -1.106647, -1.815153, 1, 0.772549, 0, 1,
-1.103235, -0.4725272, -1.922426, 1, 0.7803922, 0, 1,
-1.10263, 0.04972719, -2.815461, 1, 0.7843137, 0, 1,
-1.088192, -1.17578, -1.156367, 1, 0.7921569, 0, 1,
-1.081989, 1.585074, -0.4250221, 1, 0.7960784, 0, 1,
-1.070746, -1.292218, -2.051883, 1, 0.8039216, 0, 1,
-1.04178, 0.560714, -0.5131606, 1, 0.8117647, 0, 1,
-1.040972, -0.9920272, -1.222078, 1, 0.8156863, 0, 1,
-1.039687, -2.023817, -1.35419, 1, 0.8235294, 0, 1,
-1.039032, 0.6173233, -2.539054, 1, 0.827451, 0, 1,
-1.038909, -0.6492788, -1.183673, 1, 0.8352941, 0, 1,
-1.036794, -1.1446, -3.470093, 1, 0.8392157, 0, 1,
-1.031489, -0.6015901, 0.2877222, 1, 0.8470588, 0, 1,
-1.016978, -0.9753873, -3.153657, 1, 0.8509804, 0, 1,
-1.009748, -0.7804638, -2.369604, 1, 0.8588235, 0, 1,
-1.007377, 0.1683737, -0.8161309, 1, 0.8627451, 0, 1,
-1.006835, 0.9745584, 0.7512022, 1, 0.8705882, 0, 1,
-1.005483, -1.147004, -1.79584, 1, 0.8745098, 0, 1,
-1.005313, 1.662137, -1.275271, 1, 0.8823529, 0, 1,
-0.9993417, 0.2045769, -1.44953, 1, 0.8862745, 0, 1,
-0.9942564, 1.61897, 0.421226, 1, 0.8941177, 0, 1,
-0.991841, 1.524925, -0.8031493, 1, 0.8980392, 0, 1,
-0.9899952, -0.703653, -1.924275, 1, 0.9058824, 0, 1,
-0.9809672, -1.007551, -2.87874, 1, 0.9137255, 0, 1,
-0.9769038, 0.5758435, -1.805277, 1, 0.9176471, 0, 1,
-0.9747823, 0.4772578, -2.097115, 1, 0.9254902, 0, 1,
-0.9739277, 1.207621, -0.8711301, 1, 0.9294118, 0, 1,
-0.9673584, 0.1289599, 1.214359, 1, 0.9372549, 0, 1,
-0.9621354, -1.205746, -2.51618, 1, 0.9411765, 0, 1,
-0.9611969, -0.6649541, -3.291194, 1, 0.9490196, 0, 1,
-0.9608287, 0.1027806, -1.410102, 1, 0.9529412, 0, 1,
-0.9604284, -0.3931739, -3.955945, 1, 0.9607843, 0, 1,
-0.9603313, -0.5137693, -2.570748, 1, 0.9647059, 0, 1,
-0.9489818, -0.2035499, -1.188484, 1, 0.972549, 0, 1,
-0.943556, 3.615024, 1.179212, 1, 0.9764706, 0, 1,
-0.9432375, 2.562562, -1.466816, 1, 0.9843137, 0, 1,
-0.9392141, -1.187122, -2.970684, 1, 0.9882353, 0, 1,
-0.9357275, 2.824069, 0.002140883, 1, 0.9960784, 0, 1,
-0.935402, -1.463117, -3.066776, 0.9960784, 1, 0, 1,
-0.9294533, 0.3116143, -1.138691, 0.9921569, 1, 0, 1,
-0.9223567, -0.6150894, -2.738111, 0.9843137, 1, 0, 1,
-0.9200588, 2.188, 0.7575619, 0.9803922, 1, 0, 1,
-0.9194041, -0.7138411, -2.122449, 0.972549, 1, 0, 1,
-0.9177281, -1.847548, -2.130457, 0.9686275, 1, 0, 1,
-0.9112403, -0.945927, -3.695971, 0.9607843, 1, 0, 1,
-0.9048401, 0.3443923, -1.231467, 0.9568627, 1, 0, 1,
-0.8989007, -0.1530918, 1.030968, 0.9490196, 1, 0, 1,
-0.8978043, 2.252173, -1.521075, 0.945098, 1, 0, 1,
-0.8969228, 0.07266825, 0.4983556, 0.9372549, 1, 0, 1,
-0.8945857, -0.08885887, -1.318388, 0.9333333, 1, 0, 1,
-0.8909276, -0.7422553, -1.760976, 0.9254902, 1, 0, 1,
-0.8886824, 0.1811859, -0.02885723, 0.9215686, 1, 0, 1,
-0.8759974, -1.437952, -2.881427, 0.9137255, 1, 0, 1,
-0.8743601, 0.6431772, -1.398232, 0.9098039, 1, 0, 1,
-0.871782, -0.1884594, -3.951061, 0.9019608, 1, 0, 1,
-0.8701543, -1.464668, -1.808693, 0.8941177, 1, 0, 1,
-0.8577433, 0.4515914, -0.7898245, 0.8901961, 1, 0, 1,
-0.8549588, 0.9530367, 1.017046, 0.8823529, 1, 0, 1,
-0.853237, -1.277202, -2.676947, 0.8784314, 1, 0, 1,
-0.8528765, -1.405097, -3.115498, 0.8705882, 1, 0, 1,
-0.8478064, 0.4000438, 0.01867019, 0.8666667, 1, 0, 1,
-0.844356, -0.5036649, -3.374877, 0.8588235, 1, 0, 1,
-0.8432523, -0.2844408, -2.503156, 0.854902, 1, 0, 1,
-0.8424193, 1.211232, -1.0569, 0.8470588, 1, 0, 1,
-0.8394533, 0.001949113, -1.8475, 0.8431373, 1, 0, 1,
-0.8365713, 0.4313427, -1.354019, 0.8352941, 1, 0, 1,
-0.8289509, 0.2867939, 1.164934, 0.8313726, 1, 0, 1,
-0.8242675, -1.305494, -4.408619, 0.8235294, 1, 0, 1,
-0.8107761, 0.9074193, -0.3070073, 0.8196079, 1, 0, 1,
-0.8068027, -1.102081, -1.899383, 0.8117647, 1, 0, 1,
-0.8026506, 0.3050988, -1.609618, 0.8078431, 1, 0, 1,
-0.7990226, 1.323599, 0.8783344, 0.8, 1, 0, 1,
-0.7973542, -0.04134864, 0.7523924, 0.7921569, 1, 0, 1,
-0.7919558, 0.9574721, -0.7847717, 0.7882353, 1, 0, 1,
-0.7883445, 1.178673, -0.04368324, 0.7803922, 1, 0, 1,
-0.7864142, -0.5877577, -2.329343, 0.7764706, 1, 0, 1,
-0.7850593, -0.51337, -2.301644, 0.7686275, 1, 0, 1,
-0.7834761, -0.8111567, -2.220109, 0.7647059, 1, 0, 1,
-0.7831196, 0.2743055, -0.1048036, 0.7568628, 1, 0, 1,
-0.7822189, -0.9545767, -3.320526, 0.7529412, 1, 0, 1,
-0.77877, 0.2474866, -1.435747, 0.7450981, 1, 0, 1,
-0.7741826, 0.5415372, -0.03288836, 0.7411765, 1, 0, 1,
-0.7733119, 0.6421406, 0.5495894, 0.7333333, 1, 0, 1,
-0.7678846, 0.2730222, -2.244619, 0.7294118, 1, 0, 1,
-0.7668618, -0.4318051, -1.561551, 0.7215686, 1, 0, 1,
-0.7646731, -0.5090371, -3.262336, 0.7176471, 1, 0, 1,
-0.7561055, 1.365893, 0.1508849, 0.7098039, 1, 0, 1,
-0.7533084, -0.7555515, -2.751682, 0.7058824, 1, 0, 1,
-0.7511123, 1.120777, -0.9577821, 0.6980392, 1, 0, 1,
-0.7476237, 1.436331, -1.458862, 0.6901961, 1, 0, 1,
-0.7420011, 1.066436, -0.82687, 0.6862745, 1, 0, 1,
-0.7397631, -0.6617982, -2.458128, 0.6784314, 1, 0, 1,
-0.7353611, -0.1633118, -2.318181, 0.6745098, 1, 0, 1,
-0.7331746, 0.8915951, -1.242869, 0.6666667, 1, 0, 1,
-0.732553, -1.27049, -3.294907, 0.6627451, 1, 0, 1,
-0.7315962, -0.01306157, -1.773236, 0.654902, 1, 0, 1,
-0.7310355, -1.512478, -3.738517, 0.6509804, 1, 0, 1,
-0.7200383, -1.641645, -1.80167, 0.6431373, 1, 0, 1,
-0.7145626, 0.04075336, -0.9086848, 0.6392157, 1, 0, 1,
-0.7141976, 0.3522108, 0.4740312, 0.6313726, 1, 0, 1,
-0.7134873, -1.204816, -2.220074, 0.627451, 1, 0, 1,
-0.7127056, 0.4335504, 0.3675962, 0.6196079, 1, 0, 1,
-0.7092986, -0.1712517, -0.04977293, 0.6156863, 1, 0, 1,
-0.7080396, 0.7290033, -0.8367569, 0.6078432, 1, 0, 1,
-0.7073699, -0.04190551, -3.091836, 0.6039216, 1, 0, 1,
-0.7023702, -0.08623451, -0.5909057, 0.5960785, 1, 0, 1,
-0.7022427, 0.6141927, -0.6307263, 0.5882353, 1, 0, 1,
-0.6982294, 0.2636093, -0.6883603, 0.5843138, 1, 0, 1,
-0.6978601, 0.5282696, -2.016574, 0.5764706, 1, 0, 1,
-0.6977479, 0.6492907, -1.942707, 0.572549, 1, 0, 1,
-0.6970941, -0.6390309, -1.723857, 0.5647059, 1, 0, 1,
-0.6970499, -0.6383281, -3.475302, 0.5607843, 1, 0, 1,
-0.6923136, -0.6949498, -3.155517, 0.5529412, 1, 0, 1,
-0.690499, 0.02361492, -2.090348, 0.5490196, 1, 0, 1,
-0.6901521, -0.5759175, -5.29425, 0.5411765, 1, 0, 1,
-0.6881764, 0.7824146, -0.4915594, 0.5372549, 1, 0, 1,
-0.6743459, 0.7215917, 0.4861705, 0.5294118, 1, 0, 1,
-0.6726905, -0.7140829, -1.975815, 0.5254902, 1, 0, 1,
-0.671277, 1.318301, 0.538966, 0.5176471, 1, 0, 1,
-0.6712086, 1.624802, -0.01204497, 0.5137255, 1, 0, 1,
-0.6696058, -1.199128, -2.696528, 0.5058824, 1, 0, 1,
-0.6667051, -1.741676, -3.169017, 0.5019608, 1, 0, 1,
-0.6655558, -1.107846, -1.440524, 0.4941176, 1, 0, 1,
-0.6634062, -0.05902123, -2.389162, 0.4862745, 1, 0, 1,
-0.6618339, -1.367904, -2.206745, 0.4823529, 1, 0, 1,
-0.6605055, 0.5103719, -1.027788, 0.4745098, 1, 0, 1,
-0.6591582, 0.1665275, -3.529369, 0.4705882, 1, 0, 1,
-0.65807, -0.3713909, -2.740338, 0.4627451, 1, 0, 1,
-0.6568104, 1.246141, 0.6461373, 0.4588235, 1, 0, 1,
-0.6550773, -1.126921, -3.996862, 0.4509804, 1, 0, 1,
-0.6541869, 1.339321, -1.431379, 0.4470588, 1, 0, 1,
-0.6480601, 0.889353, -2.145801, 0.4392157, 1, 0, 1,
-0.6463954, -0.6832994, -1.921572, 0.4352941, 1, 0, 1,
-0.6451556, 0.2543666, 0.3291845, 0.427451, 1, 0, 1,
-0.6438282, 1.10825, -2.847646, 0.4235294, 1, 0, 1,
-0.6424937, -1.284719, -1.801472, 0.4156863, 1, 0, 1,
-0.6351297, -0.3210543, -1.378675, 0.4117647, 1, 0, 1,
-0.6336441, -0.7567344, -3.194059, 0.4039216, 1, 0, 1,
-0.6297456, -0.4490068, -3.789752, 0.3960784, 1, 0, 1,
-0.628213, -0.9296905, -2.800322, 0.3921569, 1, 0, 1,
-0.6263636, -1.095256, -3.002182, 0.3843137, 1, 0, 1,
-0.6222154, -0.8608152, -3.674924, 0.3803922, 1, 0, 1,
-0.6216195, -1.645564, -3.137178, 0.372549, 1, 0, 1,
-0.6214635, 0.1615417, -1.922002, 0.3686275, 1, 0, 1,
-0.6212456, 0.8651181, -2.057369, 0.3607843, 1, 0, 1,
-0.6204293, 0.9617736, -1.712365, 0.3568628, 1, 0, 1,
-0.6097708, 0.4617285, -0.8381788, 0.3490196, 1, 0, 1,
-0.6088899, -0.416311, -1.224527, 0.345098, 1, 0, 1,
-0.606554, -0.3510697, -3.072818, 0.3372549, 1, 0, 1,
-0.6018581, 0.1746033, -2.317007, 0.3333333, 1, 0, 1,
-0.599127, 1.049952, 0.3917771, 0.3254902, 1, 0, 1,
-0.5977783, -0.6868044, -1.437906, 0.3215686, 1, 0, 1,
-0.5955979, 0.2953643, -0.6298246, 0.3137255, 1, 0, 1,
-0.5930737, -1.202335, -2.172936, 0.3098039, 1, 0, 1,
-0.584179, 0.5765003, -0.7933622, 0.3019608, 1, 0, 1,
-0.5783778, -1.053972, -1.783597, 0.2941177, 1, 0, 1,
-0.5761199, -0.773808, -3.577429, 0.2901961, 1, 0, 1,
-0.5749996, 0.8891593, -0.2761543, 0.282353, 1, 0, 1,
-0.5705176, 1.462127, 1.377707, 0.2784314, 1, 0, 1,
-0.5668877, 0.2630132, -2.211512, 0.2705882, 1, 0, 1,
-0.5640255, 0.0796892, -2.741476, 0.2666667, 1, 0, 1,
-0.5635806, -1.844144, -1.895027, 0.2588235, 1, 0, 1,
-0.5626758, 1.133718, -0.04163242, 0.254902, 1, 0, 1,
-0.559579, -0.03740691, -4.043138, 0.2470588, 1, 0, 1,
-0.5563983, 0.4684945, -0.01689167, 0.2431373, 1, 0, 1,
-0.5529425, 1.170829, -1.20574, 0.2352941, 1, 0, 1,
-0.5497636, 1.105178, -0.8048443, 0.2313726, 1, 0, 1,
-0.5488536, -0.3241889, -2.358942, 0.2235294, 1, 0, 1,
-0.5455705, -0.6571457, -1.295865, 0.2196078, 1, 0, 1,
-0.5454083, -0.2421196, -1.971567, 0.2117647, 1, 0, 1,
-0.5453696, -0.04853054, -1.107661, 0.2078431, 1, 0, 1,
-0.5386515, 2.109249, -1.101996, 0.2, 1, 0, 1,
-0.5338171, -0.4185351, -2.250256, 0.1921569, 1, 0, 1,
-0.5335178, -0.06175567, -2.027054, 0.1882353, 1, 0, 1,
-0.5294772, -0.6544121, -3.582062, 0.1803922, 1, 0, 1,
-0.5237085, 0.3904933, -2.195438, 0.1764706, 1, 0, 1,
-0.5192609, 1.097132, -1.471307, 0.1686275, 1, 0, 1,
-0.5173482, 0.3031912, -0.3812186, 0.1647059, 1, 0, 1,
-0.5151715, 1.762605, 1.055443, 0.1568628, 1, 0, 1,
-0.5141149, -1.979751, -2.910352, 0.1529412, 1, 0, 1,
-0.5116695, -1.910592, -3.49984, 0.145098, 1, 0, 1,
-0.5113702, -0.3526816, -2.800066, 0.1411765, 1, 0, 1,
-0.5020016, -0.5503297, -0.6814319, 0.1333333, 1, 0, 1,
-0.4940135, -0.1167844, -1.117308, 0.1294118, 1, 0, 1,
-0.4906941, 1.26201, -0.5027111, 0.1215686, 1, 0, 1,
-0.4887809, 0.6220308, -1.481886, 0.1176471, 1, 0, 1,
-0.4884412, -0.9776704, -3.915745, 0.1098039, 1, 0, 1,
-0.4790185, 0.7292076, -1.472365, 0.1058824, 1, 0, 1,
-0.477478, -1.164616, -3.073567, 0.09803922, 1, 0, 1,
-0.4739338, 0.3560502, -0.8745174, 0.09019608, 1, 0, 1,
-0.4729658, -0.256042, -2.271996, 0.08627451, 1, 0, 1,
-0.4720139, 0.04611547, -0.12813, 0.07843138, 1, 0, 1,
-0.4705629, -1.334544, -3.653805, 0.07450981, 1, 0, 1,
-0.4683182, -0.8279935, -1.977268, 0.06666667, 1, 0, 1,
-0.4677486, -0.3846512, -2.773894, 0.0627451, 1, 0, 1,
-0.4668812, 0.481138, -3.051835, 0.05490196, 1, 0, 1,
-0.4664789, 0.02989775, -2.104266, 0.05098039, 1, 0, 1,
-0.4657843, -0.7184182, -1.373948, 0.04313726, 1, 0, 1,
-0.4620085, -0.3328939, -2.764835, 0.03921569, 1, 0, 1,
-0.4598275, 0.105369, -1.258502, 0.03137255, 1, 0, 1,
-0.459049, -0.3721824, -2.002979, 0.02745098, 1, 0, 1,
-0.4550908, 0.408694, -2.400694, 0.01960784, 1, 0, 1,
-0.454899, -1.007572, -2.872565, 0.01568628, 1, 0, 1,
-0.4546883, 0.4455994, -2.162131, 0.007843138, 1, 0, 1,
-0.4479864, 0.04185061, -1.1897, 0.003921569, 1, 0, 1,
-0.4478528, 0.3011599, -1.728325, 0, 1, 0.003921569, 1,
-0.4445686, -0.4930183, -2.37707, 0, 1, 0.01176471, 1,
-0.4431331, -0.4261088, -2.162496, 0, 1, 0.01568628, 1,
-0.4420937, 0.9692791, -1.769345, 0, 1, 0.02352941, 1,
-0.4382312, 0.5936273, -0.3339875, 0, 1, 0.02745098, 1,
-0.4279253, -1.109419, -3.632744, 0, 1, 0.03529412, 1,
-0.4267593, 0.1899943, -1.966347, 0, 1, 0.03921569, 1,
-0.4207037, -1.144402, -3.818467, 0, 1, 0.04705882, 1,
-0.4205829, 0.1198235, -1.181434, 0, 1, 0.05098039, 1,
-0.4185231, -0.1925575, -2.543377, 0, 1, 0.05882353, 1,
-0.4033647, -0.02141797, -1.082117, 0, 1, 0.0627451, 1,
-0.4030607, -0.9403182, -2.01459, 0, 1, 0.07058824, 1,
-0.3945199, -1.752914, -2.981744, 0, 1, 0.07450981, 1,
-0.3911687, 0.8181295, -0.05180601, 0, 1, 0.08235294, 1,
-0.3909137, -0.4932844, -1.847041, 0, 1, 0.08627451, 1,
-0.3901469, -0.8997628, -2.740979, 0, 1, 0.09411765, 1,
-0.3899356, -0.2918562, -2.175787, 0, 1, 0.1019608, 1,
-0.3897385, 0.8608279, -2.041969, 0, 1, 0.1058824, 1,
-0.3894129, -1.886727, -3.42809, 0, 1, 0.1137255, 1,
-0.3892887, 0.8374369, -1.539424, 0, 1, 0.1176471, 1,
-0.3883841, -0.4058936, -4.212201, 0, 1, 0.1254902, 1,
-0.3864082, -0.01505278, -2.930574, 0, 1, 0.1294118, 1,
-0.3773604, 0.1931114, -2.825303, 0, 1, 0.1372549, 1,
-0.3767062, 1.577903, 0.9830914, 0, 1, 0.1411765, 1,
-0.3763559, 0.6396098, -0.7832517, 0, 1, 0.1490196, 1,
-0.3715424, 0.336176, -1.793394, 0, 1, 0.1529412, 1,
-0.3706123, 1.043657, -1.034829, 0, 1, 0.1607843, 1,
-0.3701192, 0.5113217, -0.1405946, 0, 1, 0.1647059, 1,
-0.3578621, 1.069719, 1.84588, 0, 1, 0.172549, 1,
-0.3496854, 0.1195455, -0.3705143, 0, 1, 0.1764706, 1,
-0.3461342, -0.4339325, -2.838419, 0, 1, 0.1843137, 1,
-0.3427835, -0.5030891, -2.383474, 0, 1, 0.1882353, 1,
-0.3407589, -0.8768371, -2.941847, 0, 1, 0.1960784, 1,
-0.3398652, 0.7008508, 0.02248692, 0, 1, 0.2039216, 1,
-0.3383729, 1.725451, 0.4392583, 0, 1, 0.2078431, 1,
-0.3379077, 0.3257642, 0.1216807, 0, 1, 0.2156863, 1,
-0.3368238, -0.1199009, -1.850035, 0, 1, 0.2196078, 1,
-0.3353839, -0.4676963, -3.997383, 0, 1, 0.227451, 1,
-0.3328836, -0.9008855, -2.852901, 0, 1, 0.2313726, 1,
-0.3312737, -0.6552869, -3.3481, 0, 1, 0.2392157, 1,
-0.3305245, 0.3050171, 0.3700337, 0, 1, 0.2431373, 1,
-0.3305046, 1.503896, 1.310355, 0, 1, 0.2509804, 1,
-0.3231088, -1.850859, -3.230554, 0, 1, 0.254902, 1,
-0.3153468, -0.1378275, -1.943312, 0, 1, 0.2627451, 1,
-0.311743, -0.04243604, -1.476573, 0, 1, 0.2666667, 1,
-0.3052552, -1.857795, -3.955703, 0, 1, 0.2745098, 1,
-0.3023302, 0.3879856, 0.8528631, 0, 1, 0.2784314, 1,
-0.2978266, -1.394866, -2.069128, 0, 1, 0.2862745, 1,
-0.2973539, 0.3705052, 0.4053195, 0, 1, 0.2901961, 1,
-0.297011, -0.1058471, -2.273109, 0, 1, 0.2980392, 1,
-0.2919865, -1.355473, -3.333385, 0, 1, 0.3058824, 1,
-0.2884596, 0.2517553, -1.368272, 0, 1, 0.3098039, 1,
-0.2884481, 0.6862097, -1.924767, 0, 1, 0.3176471, 1,
-0.2846127, 0.354447, 0.1063965, 0, 1, 0.3215686, 1,
-0.2830721, 0.1213289, -1.707995, 0, 1, 0.3294118, 1,
-0.2814392, -2.009434, -2.16281, 0, 1, 0.3333333, 1,
-0.2802439, 0.3600548, -0.6094697, 0, 1, 0.3411765, 1,
-0.2798065, 0.411588, 0.2458873, 0, 1, 0.345098, 1,
-0.2779599, 0.2278547, -2.452156, 0, 1, 0.3529412, 1,
-0.2774706, -1.115647, -3.364474, 0, 1, 0.3568628, 1,
-0.2771229, 0.3951861, -1.630414, 0, 1, 0.3647059, 1,
-0.275593, -1.164019, -3.37744, 0, 1, 0.3686275, 1,
-0.2747615, 2.388144, 0.008237922, 0, 1, 0.3764706, 1,
-0.2732861, 0.9117526, -1.390889, 0, 1, 0.3803922, 1,
-0.2730602, 0.4307715, 0.9571576, 0, 1, 0.3882353, 1,
-0.2697737, 1.718418, 0.4805004, 0, 1, 0.3921569, 1,
-0.2690963, -0.612859, -2.404636, 0, 1, 0.4, 1,
-0.2689212, 0.69138, -1.576179, 0, 1, 0.4078431, 1,
-0.2647134, -1.053199, -4.625633, 0, 1, 0.4117647, 1,
-0.2644001, 0.8478377, 1.28153, 0, 1, 0.4196078, 1,
-0.2616709, -0.07189959, 0.01336616, 0, 1, 0.4235294, 1,
-0.2543872, 0.8281453, -0.5157219, 0, 1, 0.4313726, 1,
-0.2539182, -0.1392273, -2.70411, 0, 1, 0.4352941, 1,
-0.2526284, 1.787586, 1.205615, 0, 1, 0.4431373, 1,
-0.2516798, -0.3117374, -1.683268, 0, 1, 0.4470588, 1,
-0.2479869, 1.751789, -0.4727251, 0, 1, 0.454902, 1,
-0.2458964, -0.2198891, -2.846231, 0, 1, 0.4588235, 1,
-0.2445552, 1.39319, -0.7350613, 0, 1, 0.4666667, 1,
-0.2438695, -1.185926, -2.656399, 0, 1, 0.4705882, 1,
-0.2438665, -2.006598, -2.981089, 0, 1, 0.4784314, 1,
-0.2418282, -1.670778, -1.763298, 0, 1, 0.4823529, 1,
-0.2417518, -0.2815682, -2.780584, 0, 1, 0.4901961, 1,
-0.2408964, -2.096404, -2.976153, 0, 1, 0.4941176, 1,
-0.2406681, -1.05977, -1.764589, 0, 1, 0.5019608, 1,
-0.2388401, 0.8544509, 0.1108548, 0, 1, 0.509804, 1,
-0.234666, 0.2234893, -0.7749425, 0, 1, 0.5137255, 1,
-0.231045, 0.7633786, -2.361466, 0, 1, 0.5215687, 1,
-0.2305867, -0.3786546, -2.215093, 0, 1, 0.5254902, 1,
-0.2228832, 1.920141, -0.4013582, 0, 1, 0.5333334, 1,
-0.2221653, -1.226242, -3.376933, 0, 1, 0.5372549, 1,
-0.220947, 0.2839989, -1.344568, 0, 1, 0.5450981, 1,
-0.2154963, 0.06490612, -2.208977, 0, 1, 0.5490196, 1,
-0.2131577, -0.1171757, -1.783832, 0, 1, 0.5568628, 1,
-0.2081568, 1.925225, 0.6226064, 0, 1, 0.5607843, 1,
-0.2046813, 1.224166, 0.3609563, 0, 1, 0.5686275, 1,
-0.204162, 0.2846473, -0.724881, 0, 1, 0.572549, 1,
-0.203398, -0.1536726, -2.476261, 0, 1, 0.5803922, 1,
-0.1981282, -0.8976005, -2.825782, 0, 1, 0.5843138, 1,
-0.1973231, -0.4261925, -3.836463, 0, 1, 0.5921569, 1,
-0.1900594, -0.0301048, -0.873921, 0, 1, 0.5960785, 1,
-0.1898328, -1.957694, -1.812602, 0, 1, 0.6039216, 1,
-0.1778161, -0.5896488, -5.049656, 0, 1, 0.6117647, 1,
-0.1713634, -0.3591796, -4.618396, 0, 1, 0.6156863, 1,
-0.1704956, 0.6833394, -0.8565937, 0, 1, 0.6235294, 1,
-0.1691204, 0.2561847, -1.263744, 0, 1, 0.627451, 1,
-0.1651924, 1.045032, 0.08629559, 0, 1, 0.6352941, 1,
-0.161306, 0.4254576, -1.055976, 0, 1, 0.6392157, 1,
-0.1537222, 0.3347094, -0.1432294, 0, 1, 0.6470588, 1,
-0.1457946, 0.08611718, -1.966194, 0, 1, 0.6509804, 1,
-0.1424759, -1.424753, -1.919532, 0, 1, 0.6588235, 1,
-0.138043, 0.4430611, -0.5718277, 0, 1, 0.6627451, 1,
-0.1348157, 1.044116, -0.7621279, 0, 1, 0.6705883, 1,
-0.1345711, 0.7157546, -1.129262, 0, 1, 0.6745098, 1,
-0.1326226, -1.286991, -2.157595, 0, 1, 0.682353, 1,
-0.1308263, 0.9287017, -0.856953, 0, 1, 0.6862745, 1,
-0.1277444, 0.6262046, 0.9603713, 0, 1, 0.6941177, 1,
-0.1270653, 2.55658, -0.7432592, 0, 1, 0.7019608, 1,
-0.1234057, -1.279161, -3.130159, 0, 1, 0.7058824, 1,
-0.121457, 0.4751055, 2.003341, 0, 1, 0.7137255, 1,
-0.1209341, -1.231038, -1.74343, 0, 1, 0.7176471, 1,
-0.1207779, -0.5472353, -3.293915, 0, 1, 0.7254902, 1,
-0.120012, 0.830322, -0.3861218, 0, 1, 0.7294118, 1,
-0.1180766, 0.6130853, -0.5161289, 0, 1, 0.7372549, 1,
-0.1157051, 0.0613814, -3.573023, 0, 1, 0.7411765, 1,
-0.1156996, -0.5210869, -3.25888, 0, 1, 0.7490196, 1,
-0.1142089, 0.623399, 0.5175946, 0, 1, 0.7529412, 1,
-0.1136445, -2.114833, -4.766909, 0, 1, 0.7607843, 1,
-0.1118869, 0.316025, 0.0213689, 0, 1, 0.7647059, 1,
-0.1106919, 0.4152814, -0.1105806, 0, 1, 0.772549, 1,
-0.1067182, 0.09457546, -0.4458897, 0, 1, 0.7764706, 1,
-0.1053895, 0.3971109, 0.4105502, 0, 1, 0.7843137, 1,
-0.1048416, 0.02756556, -1.694049, 0, 1, 0.7882353, 1,
-0.104806, -1.063589, -0.3129091, 0, 1, 0.7960784, 1,
-0.102909, -0.1172376, -1.595227, 0, 1, 0.8039216, 1,
-0.1024797, 0.5921088, 0.6108837, 0, 1, 0.8078431, 1,
-0.1018586, 0.511583, -0.446934, 0, 1, 0.8156863, 1,
-0.1009969, -0.1496797, -3.738421, 0, 1, 0.8196079, 1,
-0.09724431, -0.6789925, -3.221245, 0, 1, 0.827451, 1,
-0.09284605, 0.7205271, -0.1595134, 0, 1, 0.8313726, 1,
-0.09054167, 1.066172, -0.7141945, 0, 1, 0.8392157, 1,
-0.08632389, -0.5190997, -2.88467, 0, 1, 0.8431373, 1,
-0.08502341, 2.975501, -0.530929, 0, 1, 0.8509804, 1,
-0.08499299, -1.26001, -1.664498, 0, 1, 0.854902, 1,
-0.08484898, 0.9731599, -0.8325137, 0, 1, 0.8627451, 1,
-0.07987404, -1.087707, -1.46862, 0, 1, 0.8666667, 1,
-0.07837189, 1.011716, -0.02885291, 0, 1, 0.8745098, 1,
-0.07825174, 1.354751, -1.472634, 0, 1, 0.8784314, 1,
-0.07561731, 0.1861257, -0.1945402, 0, 1, 0.8862745, 1,
-0.06905666, 1.068775, -0.378116, 0, 1, 0.8901961, 1,
-0.0676371, -0.5759494, -2.055551, 0, 1, 0.8980392, 1,
-0.06616054, -0.6018962, -3.139933, 0, 1, 0.9058824, 1,
-0.06498146, 0.1523142, -0.3524014, 0, 1, 0.9098039, 1,
-0.06055899, -1.127542, -3.555957, 0, 1, 0.9176471, 1,
-0.05856612, 1.150361, 0.01670565, 0, 1, 0.9215686, 1,
-0.05851509, -1.093592, -3.213347, 0, 1, 0.9294118, 1,
-0.05387288, 0.3874973, 1.21103, 0, 1, 0.9333333, 1,
-0.05367867, -2.111557, -2.887232, 0, 1, 0.9411765, 1,
-0.04693946, 0.6473308, -0.6599934, 0, 1, 0.945098, 1,
-0.04666648, -0.9423918, -4.031195, 0, 1, 0.9529412, 1,
-0.04633363, 0.3993884, -0.5382863, 0, 1, 0.9568627, 1,
-0.04203423, -1.15463, -2.61243, 0, 1, 0.9647059, 1,
-0.03916799, -0.1142241, -1.618866, 0, 1, 0.9686275, 1,
-0.03880359, 0.521885, 1.300271, 0, 1, 0.9764706, 1,
-0.03838588, 1.273497, 1.586721, 0, 1, 0.9803922, 1,
-0.0360994, -1.342978, -2.053542, 0, 1, 0.9882353, 1,
-0.02958612, -2.191413, -4.448872, 0, 1, 0.9921569, 1,
-0.02858007, 0.2550169, -1.74301, 0, 1, 1, 1,
-0.02701297, -0.6293731, -1.700278, 0, 0.9921569, 1, 1,
-0.02463217, -0.70023, -4.1543, 0, 0.9882353, 1, 1,
-0.02239449, 1.239823, -1.748908, 0, 0.9803922, 1, 1,
-0.01904789, 0.7217599, -0.4029173, 0, 0.9764706, 1, 1,
-0.01161546, -0.3468524, -4.293714, 0, 0.9686275, 1, 1,
-0.01069204, -0.9141978, -2.545351, 0, 0.9647059, 1, 1,
-0.01025854, -0.3362045, -2.538528, 0, 0.9568627, 1, 1,
-0.008604344, -0.3860224, -2.030113, 0, 0.9529412, 1, 1,
-0.004093627, 1.549317, 0.2016838, 0, 0.945098, 1, 1,
-0.001975328, 2.288671, 1.102649, 0, 0.9411765, 1, 1,
-0.000473229, 0.6070136, 0.1591412, 0, 0.9333333, 1, 1,
0.003621874, -0.3324055, 2.588893, 0, 0.9294118, 1, 1,
0.005324403, -0.1731962, 1.479965, 0, 0.9215686, 1, 1,
0.01165123, 0.7420894, 0.3065828, 0, 0.9176471, 1, 1,
0.01217689, -0.07035936, 5.342425, 0, 0.9098039, 1, 1,
0.01288249, 0.4125945, 1.861182, 0, 0.9058824, 1, 1,
0.01822886, -1.553598, 3.764528, 0, 0.8980392, 1, 1,
0.02096485, 0.8244421, -0.7705696, 0, 0.8901961, 1, 1,
0.02113617, 1.32506, 1.52031, 0, 0.8862745, 1, 1,
0.02240093, -1.545675, 3.822654, 0, 0.8784314, 1, 1,
0.02244822, -0.794501, 2.208554, 0, 0.8745098, 1, 1,
0.02496855, 0.1115743, -1.420277, 0, 0.8666667, 1, 1,
0.02767304, 2.317159, -0.5189794, 0, 0.8627451, 1, 1,
0.02873554, -0.08559744, 1.447816, 0, 0.854902, 1, 1,
0.03264521, 1.317196, 1.510669, 0, 0.8509804, 1, 1,
0.03505123, -0.4567765, 4.144619, 0, 0.8431373, 1, 1,
0.03565876, 0.03651607, 0.07286023, 0, 0.8392157, 1, 1,
0.03867397, -1.644576, 3.305072, 0, 0.8313726, 1, 1,
0.04056666, -1.353037, 2.292692, 0, 0.827451, 1, 1,
0.04212814, 1.809692, -1.408414, 0, 0.8196079, 1, 1,
0.04479266, -1.166592, 5.481802, 0, 0.8156863, 1, 1,
0.04701859, -0.1580835, 3.465505, 0, 0.8078431, 1, 1,
0.04724642, 1.576755, -0.5748844, 0, 0.8039216, 1, 1,
0.04804799, 0.01454772, 1.088315, 0, 0.7960784, 1, 1,
0.05017763, -0.9673533, 2.97317, 0, 0.7882353, 1, 1,
0.05193322, 0.9670588, -0.2593367, 0, 0.7843137, 1, 1,
0.06829409, 0.1871954, 0.8787463, 0, 0.7764706, 1, 1,
0.06912716, -1.392174, 2.844047, 0, 0.772549, 1, 1,
0.06937852, -2.032592, 3.060112, 0, 0.7647059, 1, 1,
0.07026315, -0.4166454, 2.388365, 0, 0.7607843, 1, 1,
0.07757041, 0.9474847, -0.1541652, 0, 0.7529412, 1, 1,
0.07823446, -0.2445971, 1.479171, 0, 0.7490196, 1, 1,
0.0789064, 0.2034984, 0.3813772, 0, 0.7411765, 1, 1,
0.08028763, -0.5835596, 1.674357, 0, 0.7372549, 1, 1,
0.08112015, -1.045499, 1.87227, 0, 0.7294118, 1, 1,
0.08237354, -0.3219024, 2.845564, 0, 0.7254902, 1, 1,
0.08410213, 2.126657, 0.1868113, 0, 0.7176471, 1, 1,
0.08462745, -1.147546, 3.846019, 0, 0.7137255, 1, 1,
0.08811226, -1.374444, 3.689143, 0, 0.7058824, 1, 1,
0.08983155, -0.9860002, 1.13194, 0, 0.6980392, 1, 1,
0.08993983, -0.2137602, 1.904108, 0, 0.6941177, 1, 1,
0.09411097, 0.3486721, 0.9326375, 0, 0.6862745, 1, 1,
0.1020443, -1.761168, 2.130935, 0, 0.682353, 1, 1,
0.1085245, -0.5798163, 2.710911, 0, 0.6745098, 1, 1,
0.1104334, -0.3782224, 1.349018, 0, 0.6705883, 1, 1,
0.1113013, 0.3317913, -0.9553509, 0, 0.6627451, 1, 1,
0.1148471, 0.2261809, 0.5235028, 0, 0.6588235, 1, 1,
0.1169408, 0.4877271, -0.3972785, 0, 0.6509804, 1, 1,
0.1269989, 0.2271946, -1.324826, 0, 0.6470588, 1, 1,
0.1271596, 0.1268499, 2.309388, 0, 0.6392157, 1, 1,
0.1281058, 0.7551954, -1.681752, 0, 0.6352941, 1, 1,
0.1282964, 1.374805, -1.244833, 0, 0.627451, 1, 1,
0.1313132, 1.975276, 1.872676, 0, 0.6235294, 1, 1,
0.1350763, -0.7811399, 1.535761, 0, 0.6156863, 1, 1,
0.1365543, 0.3706675, 0.9108429, 0, 0.6117647, 1, 1,
0.1370666, -1.905623, 2.187617, 0, 0.6039216, 1, 1,
0.1432441, 0.0656723, 0.5026399, 0, 0.5960785, 1, 1,
0.1539689, -0.3669444, 4.536419, 0, 0.5921569, 1, 1,
0.1552327, -1.558012, 2.8381, 0, 0.5843138, 1, 1,
0.1554641, 1.355778, 0.4230201, 0, 0.5803922, 1, 1,
0.1597598, 1.683989, -0.4243946, 0, 0.572549, 1, 1,
0.1603329, 1.215382, 1.688542, 0, 0.5686275, 1, 1,
0.1619502, 0.4710934, 1.180032, 0, 0.5607843, 1, 1,
0.1620452, 1.959568, 0.1283896, 0, 0.5568628, 1, 1,
0.1668382, -0.1598776, 3.408769, 0, 0.5490196, 1, 1,
0.1693264, -0.2464957, 3.049017, 0, 0.5450981, 1, 1,
0.1704393, -1.617247, 3.103338, 0, 0.5372549, 1, 1,
0.1707956, 1.147189, 1.094932, 0, 0.5333334, 1, 1,
0.1742526, -0.1651075, 2.200052, 0, 0.5254902, 1, 1,
0.1768618, -1.361641, 1.955266, 0, 0.5215687, 1, 1,
0.1794195, -0.07635626, 2.661659, 0, 0.5137255, 1, 1,
0.1795697, -0.3150182, 4.141824, 0, 0.509804, 1, 1,
0.1798321, -0.420375, 3.493616, 0, 0.5019608, 1, 1,
0.1803601, 0.3412419, -0.6253052, 0, 0.4941176, 1, 1,
0.1841413, 0.03865097, 0.2604837, 0, 0.4901961, 1, 1,
0.1923209, -1.911734, 2.814831, 0, 0.4823529, 1, 1,
0.1924386, 0.2205248, 0.1948961, 0, 0.4784314, 1, 1,
0.1943418, -0.4512309, 2.334161, 0, 0.4705882, 1, 1,
0.195772, -3.060372, 1.744774, 0, 0.4666667, 1, 1,
0.1961893, -0.7717943, 3.325921, 0, 0.4588235, 1, 1,
0.2110787, 1.205386, 0.3536768, 0, 0.454902, 1, 1,
0.2222464, 1.297422, 2.272344, 0, 0.4470588, 1, 1,
0.2241174, 0.4322876, -0.1798676, 0, 0.4431373, 1, 1,
0.2306467, 0.1935704, 0.5159189, 0, 0.4352941, 1, 1,
0.2338549, -0.4353302, 3.203997, 0, 0.4313726, 1, 1,
0.2339821, -0.2477778, 2.364001, 0, 0.4235294, 1, 1,
0.2346996, -1.356634, 2.343802, 0, 0.4196078, 1, 1,
0.2391218, -0.07705759, 3.242525, 0, 0.4117647, 1, 1,
0.2392297, 0.3079251, -0.3420436, 0, 0.4078431, 1, 1,
0.239559, -0.9598894, 1.628908, 0, 0.4, 1, 1,
0.2397644, 1.137136, 0.273308, 0, 0.3921569, 1, 1,
0.2410333, -1.588341, 5.31672, 0, 0.3882353, 1, 1,
0.2429511, -1.427152, 3.379838, 0, 0.3803922, 1, 1,
0.2441958, -0.8422179, 1.821163, 0, 0.3764706, 1, 1,
0.2476171, 0.6183166, -0.9519485, 0, 0.3686275, 1, 1,
0.2505077, 0.418231, 0.2010021, 0, 0.3647059, 1, 1,
0.2515505, -0.6790633, 1.564742, 0, 0.3568628, 1, 1,
0.2534883, -0.1049588, 3.39111, 0, 0.3529412, 1, 1,
0.2551366, 2.434996, -1.871123, 0, 0.345098, 1, 1,
0.2621651, -0.02453415, 1.416782, 0, 0.3411765, 1, 1,
0.2636307, -0.5378792, 2.877838, 0, 0.3333333, 1, 1,
0.2651401, -0.8472947, 3.605007, 0, 0.3294118, 1, 1,
0.2672836, 0.3281366, 0.5473715, 0, 0.3215686, 1, 1,
0.2696811, -2.362478, 2.265031, 0, 0.3176471, 1, 1,
0.2716076, 1.098313, 0.4287819, 0, 0.3098039, 1, 1,
0.274427, -0.5598447, 4.890079, 0, 0.3058824, 1, 1,
0.2751561, 0.1046051, 0.5437703, 0, 0.2980392, 1, 1,
0.277714, -0.7610795, 4.695059, 0, 0.2901961, 1, 1,
0.2791332, 0.8502554, -0.08268712, 0, 0.2862745, 1, 1,
0.2794701, 0.6026285, -0.0938075, 0, 0.2784314, 1, 1,
0.2806547, -0.2643898, 2.455852, 0, 0.2745098, 1, 1,
0.2812746, 0.1847348, 1.514982, 0, 0.2666667, 1, 1,
0.2833096, 1.568586, 0.3068139, 0, 0.2627451, 1, 1,
0.2845195, 1.104417, -1.144943, 0, 0.254902, 1, 1,
0.2856268, 0.06687215, 0.4015578, 0, 0.2509804, 1, 1,
0.2862938, 0.4881679, -0.3987405, 0, 0.2431373, 1, 1,
0.2913319, 0.7963688, 1.18312, 0, 0.2392157, 1, 1,
0.2931218, 0.3322324, 1.139263, 0, 0.2313726, 1, 1,
0.2941287, -0.279142, 3.06177, 0, 0.227451, 1, 1,
0.3093784, -0.7701671, 2.857111, 0, 0.2196078, 1, 1,
0.3116839, -0.5352397, 1.072388, 0, 0.2156863, 1, 1,
0.3151472, -0.09849674, 0.7156485, 0, 0.2078431, 1, 1,
0.3176165, -1.965845, 1.427495, 0, 0.2039216, 1, 1,
0.318102, 0.205968, 2.146691, 0, 0.1960784, 1, 1,
0.3183427, -1.620215, 3.640795, 0, 0.1882353, 1, 1,
0.3217629, -1.006213, 1.685969, 0, 0.1843137, 1, 1,
0.3220857, 1.492021, -0.8433486, 0, 0.1764706, 1, 1,
0.3223641, 0.6135925, 1.68753, 0, 0.172549, 1, 1,
0.3233227, 0.3788316, -0.59561, 0, 0.1647059, 1, 1,
0.3250252, -0.5682183, 1.689231, 0, 0.1607843, 1, 1,
0.3391112, 0.5274763, 0.8960594, 0, 0.1529412, 1, 1,
0.3447047, 0.6131545, 0.6404242, 0, 0.1490196, 1, 1,
0.3471097, -0.8941876, 2.794605, 0, 0.1411765, 1, 1,
0.349378, -0.4171173, 4.164478, 0, 0.1372549, 1, 1,
0.3525611, 0.06126606, 0.9164125, 0, 0.1294118, 1, 1,
0.355505, -0.7312342, 1.293704, 0, 0.1254902, 1, 1,
0.3566623, -0.9179357, 1.992136, 0, 0.1176471, 1, 1,
0.3567933, 0.3210421, 0.8099503, 0, 0.1137255, 1, 1,
0.362578, 0.7548761, -0.2129548, 0, 0.1058824, 1, 1,
0.3662243, 2.7439, 0.2344658, 0, 0.09803922, 1, 1,
0.3885643, 1.138103, 1.582371, 0, 0.09411765, 1, 1,
0.3891069, 0.665897, 0.8995335, 0, 0.08627451, 1, 1,
0.389276, 0.9976962, 1.123452, 0, 0.08235294, 1, 1,
0.3907941, 0.94057, 1.471029, 0, 0.07450981, 1, 1,
0.3936284, -0.1021911, 0.791776, 0, 0.07058824, 1, 1,
0.3941414, -2.7464, 3.66722, 0, 0.0627451, 1, 1,
0.3960474, -0.7791552, 3.392194, 0, 0.05882353, 1, 1,
0.3961973, 2.734499, -1.438016, 0, 0.05098039, 1, 1,
0.3986877, 0.9507151, 1.203906, 0, 0.04705882, 1, 1,
0.3990191, 0.1293737, -0.5481207, 0, 0.03921569, 1, 1,
0.3998279, -0.4146838, 4.098512, 0, 0.03529412, 1, 1,
0.4064573, -1.340396, 3.686561, 0, 0.02745098, 1, 1,
0.4066063, -0.6048534, 1.682302, 0, 0.02352941, 1, 1,
0.408021, -0.02663822, 2.893713, 0, 0.01568628, 1, 1,
0.4125683, 0.8992529, -0.03717175, 0, 0.01176471, 1, 1,
0.4137964, 1.703767, -0.5800288, 0, 0.003921569, 1, 1,
0.4151589, -0.4599468, 2.570518, 0.003921569, 0, 1, 1,
0.4187838, 1.158992, 0.2074302, 0.007843138, 0, 1, 1,
0.4189052, -0.6706482, 2.626122, 0.01568628, 0, 1, 1,
0.4212917, 0.1813003, 0.6170908, 0.01960784, 0, 1, 1,
0.4226575, -1.710403, 0.8132845, 0.02745098, 0, 1, 1,
0.4244068, -1.663932, 3.150606, 0.03137255, 0, 1, 1,
0.4281448, 1.49572, 1.359181, 0.03921569, 0, 1, 1,
0.4336524, 1.63739, -0.3017413, 0.04313726, 0, 1, 1,
0.4363262, -1.027011, 2.676118, 0.05098039, 0, 1, 1,
0.4374626, 0.9574473, 0.1479992, 0.05490196, 0, 1, 1,
0.4377985, -0.04101023, 2.543619, 0.0627451, 0, 1, 1,
0.4413034, -0.8468812, 2.012707, 0.06666667, 0, 1, 1,
0.4421948, -0.9785982, 3.606885, 0.07450981, 0, 1, 1,
0.443434, 2.037603, -0.4252106, 0.07843138, 0, 1, 1,
0.447395, -0.4210423, 2.580968, 0.08627451, 0, 1, 1,
0.4512748, 0.3351298, 0.3833172, 0.09019608, 0, 1, 1,
0.4526336, 0.3705163, 1.486708, 0.09803922, 0, 1, 1,
0.4559068, -0.3790267, 1.67396, 0.1058824, 0, 1, 1,
0.4641706, -1.939125, 2.860783, 0.1098039, 0, 1, 1,
0.4673148, -2.422109, 3.54987, 0.1176471, 0, 1, 1,
0.4695354, 0.02367556, 0.5847791, 0.1215686, 0, 1, 1,
0.4697727, -0.3536379, 1.509796, 0.1294118, 0, 1, 1,
0.4738984, -1.459238, 4.973208, 0.1333333, 0, 1, 1,
0.4746329, 0.08068185, 0.01103862, 0.1411765, 0, 1, 1,
0.4781595, -1.176209, 3.288934, 0.145098, 0, 1, 1,
0.4960326, 0.8277344, 1.397878, 0.1529412, 0, 1, 1,
0.4966404, -0.8242942, 3.138778, 0.1568628, 0, 1, 1,
0.4973884, -1.172033, 2.745952, 0.1647059, 0, 1, 1,
0.5047511, -0.8743824, 2.762973, 0.1686275, 0, 1, 1,
0.5090379, -0.03169473, 2.835182, 0.1764706, 0, 1, 1,
0.5096035, -2.882349, 4.319652, 0.1803922, 0, 1, 1,
0.5119354, 1.769994, -0.05959986, 0.1882353, 0, 1, 1,
0.5121071, -0.7323453, 2.213915, 0.1921569, 0, 1, 1,
0.5123478, 1.607059, -1.805996, 0.2, 0, 1, 1,
0.5168408, 0.7593466, 1.116682, 0.2078431, 0, 1, 1,
0.5197724, -1.107206, 3.165936, 0.2117647, 0, 1, 1,
0.5258645, 0.07825063, 1.200591, 0.2196078, 0, 1, 1,
0.5294854, -0.3690555, 1.638493, 0.2235294, 0, 1, 1,
0.5304807, 0.7857491, 1.23281, 0.2313726, 0, 1, 1,
0.5314202, -0.2282083, 3.05843, 0.2352941, 0, 1, 1,
0.5371109, -0.939931, 3.36078, 0.2431373, 0, 1, 1,
0.5386621, 0.7863995, -0.7882942, 0.2470588, 0, 1, 1,
0.5394464, -0.8627021, 2.948353, 0.254902, 0, 1, 1,
0.5396588, -0.6464999, 2.933668, 0.2588235, 0, 1, 1,
0.5414875, -1.056745, 4.899099, 0.2666667, 0, 1, 1,
0.5418262, 0.1554032, 2.929472, 0.2705882, 0, 1, 1,
0.5428334, 1.065322, 1.043479, 0.2784314, 0, 1, 1,
0.5500235, -0.1480505, -0.3433579, 0.282353, 0, 1, 1,
0.551998, 1.072455, 0.09823753, 0.2901961, 0, 1, 1,
0.5592628, -2.227889, 2.375636, 0.2941177, 0, 1, 1,
0.5602075, -0.6027858, 2.383509, 0.3019608, 0, 1, 1,
0.5638356, 0.4339775, 0.1243072, 0.3098039, 0, 1, 1,
0.5643392, 0.6539218, 0.8480554, 0.3137255, 0, 1, 1,
0.5650972, 1.231438, 0.6143603, 0.3215686, 0, 1, 1,
0.5699516, -0.9208001, 4.13814, 0.3254902, 0, 1, 1,
0.5704676, -0.05059949, 0.6775388, 0.3333333, 0, 1, 1,
0.5788348, -1.136699, 1.512033, 0.3372549, 0, 1, 1,
0.5791707, 0.3589137, 2.571527, 0.345098, 0, 1, 1,
0.5801544, 0.1668212, 0.6237553, 0.3490196, 0, 1, 1,
0.5858534, 0.04513685, 1.960413, 0.3568628, 0, 1, 1,
0.5908133, 0.2576147, 1.526549, 0.3607843, 0, 1, 1,
0.5956909, -0.690143, 1.871003, 0.3686275, 0, 1, 1,
0.6008837, -1.999833, 2.96553, 0.372549, 0, 1, 1,
0.6063085, -0.9815034, 1.041744, 0.3803922, 0, 1, 1,
0.6071069, -3.397874, 1.963649, 0.3843137, 0, 1, 1,
0.6136203, 1.096494, 1.144384, 0.3921569, 0, 1, 1,
0.6138239, -0.2749346, -0.5561493, 0.3960784, 0, 1, 1,
0.6166077, -1.624684, 2.736282, 0.4039216, 0, 1, 1,
0.6186972, 1.350572, 0.6560183, 0.4117647, 0, 1, 1,
0.6189482, -0.003506284, 0.3619416, 0.4156863, 0, 1, 1,
0.619179, -0.4773279, 0.235943, 0.4235294, 0, 1, 1,
0.6227505, -0.3036889, 2.231083, 0.427451, 0, 1, 1,
0.6229926, 0.3311284, 3.394874, 0.4352941, 0, 1, 1,
0.6243581, 0.1195305, 1.870902, 0.4392157, 0, 1, 1,
0.6275432, 0.5645212, 1.569543, 0.4470588, 0, 1, 1,
0.6286741, 0.612759, 0.9639427, 0.4509804, 0, 1, 1,
0.62934, 0.4805935, 1.128331, 0.4588235, 0, 1, 1,
0.6296042, -1.494714, 1.684143, 0.4627451, 0, 1, 1,
0.6316667, 0.8802949, 0.5792929, 0.4705882, 0, 1, 1,
0.6343985, 0.4718259, 0.4522439, 0.4745098, 0, 1, 1,
0.6346174, 0.9621605, -0.5400062, 0.4823529, 0, 1, 1,
0.6355606, 0.3984192, 2.159258, 0.4862745, 0, 1, 1,
0.6463881, -0.05128053, 0.08157867, 0.4941176, 0, 1, 1,
0.6469866, 0.7571447, 1.44839, 0.5019608, 0, 1, 1,
0.6513973, 2.12269, 0.6508787, 0.5058824, 0, 1, 1,
0.6586136, -0.01869582, -0.4830069, 0.5137255, 0, 1, 1,
0.659771, 0.2674232, 1.090487, 0.5176471, 0, 1, 1,
0.6646022, 0.06311783, 1.345792, 0.5254902, 0, 1, 1,
0.6688378, -0.01958172, 2.404402, 0.5294118, 0, 1, 1,
0.6698882, -2.183433, 2.812439, 0.5372549, 0, 1, 1,
0.6768415, 0.3664659, 0.5929706, 0.5411765, 0, 1, 1,
0.6788648, -0.6466576, 3.206393, 0.5490196, 0, 1, 1,
0.6854077, -0.6646231, 1.558653, 0.5529412, 0, 1, 1,
0.6886885, -0.2421608, 2.355611, 0.5607843, 0, 1, 1,
0.6887687, 1.370901, -0.6132681, 0.5647059, 0, 1, 1,
0.6904054, 1.540729, 1.512226, 0.572549, 0, 1, 1,
0.6942762, -0.8662956, 2.855866, 0.5764706, 0, 1, 1,
0.6942964, -0.7889297, 1.600026, 0.5843138, 0, 1, 1,
0.6951382, -0.4867183, 1.6085, 0.5882353, 0, 1, 1,
0.6973003, -0.8536481, 3.677331, 0.5960785, 0, 1, 1,
0.6989413, 1.088315, -0.5247941, 0.6039216, 0, 1, 1,
0.709213, -2.058977, 1.896647, 0.6078432, 0, 1, 1,
0.7100918, -0.152706, 0.521701, 0.6156863, 0, 1, 1,
0.7109091, 0.38449, 2.386525, 0.6196079, 0, 1, 1,
0.7112763, -1.193764, 1.869825, 0.627451, 0, 1, 1,
0.7223659, -0.07913783, 0.9599946, 0.6313726, 0, 1, 1,
0.7249006, 1.114979, -0.6476156, 0.6392157, 0, 1, 1,
0.7257071, -1.012255, 2.699485, 0.6431373, 0, 1, 1,
0.7262089, -0.4941726, 1.488927, 0.6509804, 0, 1, 1,
0.7343305, 0.5841271, 1.06493, 0.654902, 0, 1, 1,
0.735963, 0.9711043, -0.5158501, 0.6627451, 0, 1, 1,
0.7481116, 0.4505234, 2.157609, 0.6666667, 0, 1, 1,
0.7481614, 1.407779, -0.5139053, 0.6745098, 0, 1, 1,
0.7495638, 1.435603, -0.7248958, 0.6784314, 0, 1, 1,
0.7569534, 0.5131156, 0.3277858, 0.6862745, 0, 1, 1,
0.7639784, -0.584119, 4.598701, 0.6901961, 0, 1, 1,
0.765296, 0.2365705, 1.63132, 0.6980392, 0, 1, 1,
0.765638, 0.5239201, 1.491253, 0.7058824, 0, 1, 1,
0.7734527, 1.446846, 0.0147461, 0.7098039, 0, 1, 1,
0.7757023, -0.07211655, 1.487212, 0.7176471, 0, 1, 1,
0.7766234, -1.831997, 3.837285, 0.7215686, 0, 1, 1,
0.7801204, -1.713744, 3.337438, 0.7294118, 0, 1, 1,
0.7816778, 0.246501, 1.12767, 0.7333333, 0, 1, 1,
0.7838325, -0.02459864, 2.485033, 0.7411765, 0, 1, 1,
0.7843565, -1.184254, 1.677229, 0.7450981, 0, 1, 1,
0.78624, -0.5323596, 0.9932539, 0.7529412, 0, 1, 1,
0.7890492, 0.8674302, 0.4874299, 0.7568628, 0, 1, 1,
0.7985012, 1.394035, -0.3439809, 0.7647059, 0, 1, 1,
0.7993183, 1.042786, -0.6553171, 0.7686275, 0, 1, 1,
0.8001819, 0.522181, -0.1953396, 0.7764706, 0, 1, 1,
0.8029686, 1.123061, 0.2539611, 0.7803922, 0, 1, 1,
0.8055474, -1.457819, 2.190567, 0.7882353, 0, 1, 1,
0.8131899, -0.4575734, 1.789541, 0.7921569, 0, 1, 1,
0.8182609, 0.4373143, 0.3254457, 0.8, 0, 1, 1,
0.8190725, -0.03301312, 2.570946, 0.8078431, 0, 1, 1,
0.8194121, 0.180683, 1.005059, 0.8117647, 0, 1, 1,
0.8244048, 0.705007, 0.7311243, 0.8196079, 0, 1, 1,
0.8306773, 0.09728967, 3.237003, 0.8235294, 0, 1, 1,
0.8319563, 0.5134436, 0.5160372, 0.8313726, 0, 1, 1,
0.8339477, -0.1945384, 1.976821, 0.8352941, 0, 1, 1,
0.8344858, -0.02620067, 1.257587, 0.8431373, 0, 1, 1,
0.8374438, -2.626227, 4.47549, 0.8470588, 0, 1, 1,
0.8386902, 0.633743, -0.6497708, 0.854902, 0, 1, 1,
0.8476326, -0.1408474, 2.519653, 0.8588235, 0, 1, 1,
0.8507071, -0.968538, 4.320306, 0.8666667, 0, 1, 1,
0.8568147, 0.7774523, 1.992106, 0.8705882, 0, 1, 1,
0.8642005, -0.1686589, 1.915502, 0.8784314, 0, 1, 1,
0.8726596, -0.009940881, 1.100874, 0.8823529, 0, 1, 1,
0.8733735, 1.436405, 0.7655536, 0.8901961, 0, 1, 1,
0.8774846, 0.9585677, 0.242785, 0.8941177, 0, 1, 1,
0.8778584, -0.2342276, 1.269217, 0.9019608, 0, 1, 1,
0.8780267, 1.800274, -1.383838, 0.9098039, 0, 1, 1,
0.8806822, -1.900869, 2.169779, 0.9137255, 0, 1, 1,
0.882416, 0.8972425, 0.5376511, 0.9215686, 0, 1, 1,
0.8828701, 1.446315, 0.668733, 0.9254902, 0, 1, 1,
0.8831253, -1.672217, 3.475631, 0.9333333, 0, 1, 1,
0.8832619, -0.4989696, 0.5014161, 0.9372549, 0, 1, 1,
0.885242, 0.1490273, 1.213961, 0.945098, 0, 1, 1,
0.8913019, 0.4186685, 0.8778633, 0.9490196, 0, 1, 1,
0.8921366, 0.7356834, 2.0504, 0.9568627, 0, 1, 1,
0.8923076, -1.599418, 2.920826, 0.9607843, 0, 1, 1,
0.8945605, 0.2871182, -0.5065764, 0.9686275, 0, 1, 1,
0.9004894, 1.167104, -0.7293901, 0.972549, 0, 1, 1,
0.9032755, 1.935294, -0.04847199, 0.9803922, 0, 1, 1,
0.9043185, 0.7429738, 0.02776746, 0.9843137, 0, 1, 1,
0.9165766, 0.8030466, 0.5863498, 0.9921569, 0, 1, 1,
0.9224374, -0.0839917, 1.520779, 0.9960784, 0, 1, 1,
0.9257261, -1.112399, 1.857672, 1, 0, 0.9960784, 1,
0.9327704, 1.140069, 1.27282, 1, 0, 0.9882353, 1,
0.9329147, -1.433905, 2.490152, 1, 0, 0.9843137, 1,
0.9500511, 1.153088, -0.3129056, 1, 0, 0.9764706, 1,
0.9521694, 2.257885, 1.267463, 1, 0, 0.972549, 1,
0.9557484, 1.788717, 0.176182, 1, 0, 0.9647059, 1,
0.9571639, -1.267874, 4.332198, 1, 0, 0.9607843, 1,
0.959008, 0.1827248, 3.00757, 1, 0, 0.9529412, 1,
0.9661865, 1.134764, 0.936892, 1, 0, 0.9490196, 1,
0.9726588, -1.679369, 3.461181, 1, 0, 0.9411765, 1,
0.9734854, -0.1834362, 0.8060303, 1, 0, 0.9372549, 1,
0.974285, 0.9460015, 1.745263, 1, 0, 0.9294118, 1,
0.9763107, -0.2307885, 3.96991, 1, 0, 0.9254902, 1,
0.9812259, 0.008808569, 2.513936, 1, 0, 0.9176471, 1,
0.9820902, 0.3407133, 1.509485, 1, 0, 0.9137255, 1,
0.9998254, -1.133208, 1.951067, 1, 0, 0.9058824, 1,
1.005604, 1.849845, 1.823667, 1, 0, 0.9019608, 1,
1.006379, 0.1285041, 2.533049, 1, 0, 0.8941177, 1,
1.008062, 0.7578911, 0.8397871, 1, 0, 0.8862745, 1,
1.009228, -1.283585, 1.373615, 1, 0, 0.8823529, 1,
1.01476, -0.6411574, 2.67204, 1, 0, 0.8745098, 1,
1.020975, 0.5305723, 1.903686, 1, 0, 0.8705882, 1,
1.032728, 0.328128, -1.402567, 1, 0, 0.8627451, 1,
1.038063, 0.4095031, 0.5987141, 1, 0, 0.8588235, 1,
1.043736, -1.595099, 1.031495, 1, 0, 0.8509804, 1,
1.045238, 0.5840169, 2.661314, 1, 0, 0.8470588, 1,
1.061685, 0.4329524, 2.655927, 1, 0, 0.8392157, 1,
1.063082, -2.289423, 4.357899, 1, 0, 0.8352941, 1,
1.077923, -0.9940198, 0.3087515, 1, 0, 0.827451, 1,
1.083661, 0.4586335, 2.283633, 1, 0, 0.8235294, 1,
1.089116, 1.160799, 1.936161, 1, 0, 0.8156863, 1,
1.090321, -0.1699186, 1.566166, 1, 0, 0.8117647, 1,
1.103746, -0.7896219, 2.120421, 1, 0, 0.8039216, 1,
1.106905, 2.293898, 1.247829, 1, 0, 0.7960784, 1,
1.115373, -0.1069695, 0.486513, 1, 0, 0.7921569, 1,
1.120697, 0.3843496, 1.670921, 1, 0, 0.7843137, 1,
1.122318, 0.9904602, 2.424828, 1, 0, 0.7803922, 1,
1.124498, 0.8633733, 0.7735913, 1, 0, 0.772549, 1,
1.126012, -1.267433, 3.011196, 1, 0, 0.7686275, 1,
1.130011, 0.1373971, 1.686644, 1, 0, 0.7607843, 1,
1.150381, 1.022277, 0.5970941, 1, 0, 0.7568628, 1,
1.151119, -0.1862605, 2.773793, 1, 0, 0.7490196, 1,
1.15492, -0.937105, 2.403497, 1, 0, 0.7450981, 1,
1.155779, -0.1366198, 1.768828, 1, 0, 0.7372549, 1,
1.159966, -1.480141, 0.624162, 1, 0, 0.7333333, 1,
1.163002, -1.093729, 2.866438, 1, 0, 0.7254902, 1,
1.175076, 0.08765898, 0.6359914, 1, 0, 0.7215686, 1,
1.186806, -1.42787, 1.637235, 1, 0, 0.7137255, 1,
1.200369, -2.508455, 4.38304, 1, 0, 0.7098039, 1,
1.205628, -1.030554, 2.833397, 1, 0, 0.7019608, 1,
1.210562, 1.519619, 0.01567111, 1, 0, 0.6941177, 1,
1.22382, -0.3933207, 1.512117, 1, 0, 0.6901961, 1,
1.224694, -1.558591, 0.9981989, 1, 0, 0.682353, 1,
1.230878, 0.6975411, 2.943636, 1, 0, 0.6784314, 1,
1.231854, 0.3033873, 1.715108, 1, 0, 0.6705883, 1,
1.239622, 0.7117468, 1.842481, 1, 0, 0.6666667, 1,
1.260799, 0.3294726, 2.030161, 1, 0, 0.6588235, 1,
1.263416, 0.0554714, 1.050857, 1, 0, 0.654902, 1,
1.282213, 0.9042448, 2.097987, 1, 0, 0.6470588, 1,
1.284603, -0.242271, 1.093934, 1, 0, 0.6431373, 1,
1.293543, -0.89321, 1.541313, 1, 0, 0.6352941, 1,
1.295564, 1.109725, 0.3630816, 1, 0, 0.6313726, 1,
1.296403, 0.3077077, 0.997019, 1, 0, 0.6235294, 1,
1.320265, -1.447167, 2.339334, 1, 0, 0.6196079, 1,
1.320962, 0.7959839, -0.4205166, 1, 0, 0.6117647, 1,
1.322543, 1.263407, 0.484642, 1, 0, 0.6078432, 1,
1.32931, -0.4266978, 2.111424, 1, 0, 0.6, 1,
1.333091, 1.823549, 1.171572, 1, 0, 0.5921569, 1,
1.338906, -0.3690616, 1.109861, 1, 0, 0.5882353, 1,
1.341056, 0.06653664, 1.294323, 1, 0, 0.5803922, 1,
1.344566, 0.9805022, 0.01332968, 1, 0, 0.5764706, 1,
1.348349, -1.561811, 2.060684, 1, 0, 0.5686275, 1,
1.349928, -1.019168, 1.274693, 1, 0, 0.5647059, 1,
1.351074, -0.5511037, 2.190857, 1, 0, 0.5568628, 1,
1.36315, -0.2380993, 1.51255, 1, 0, 0.5529412, 1,
1.371337, -0.3509479, 1.572755, 1, 0, 0.5450981, 1,
1.37748, -0.7553347, 2.466496, 1, 0, 0.5411765, 1,
1.382251, -0.2046169, -0.002192435, 1, 0, 0.5333334, 1,
1.401675, 0.9634949, 0.8472065, 1, 0, 0.5294118, 1,
1.40458, -1.760071, 2.806466, 1, 0, 0.5215687, 1,
1.41134, -0.3180337, 3.405771, 1, 0, 0.5176471, 1,
1.412967, 2.421288, 0.5849454, 1, 0, 0.509804, 1,
1.415749, -0.3121908, 3.102093, 1, 0, 0.5058824, 1,
1.435542, -0.2767753, 1.376658, 1, 0, 0.4980392, 1,
1.44331, -0.4144764, 2.562797, 1, 0, 0.4901961, 1,
1.443675, 1.664346, -1.069702, 1, 0, 0.4862745, 1,
1.451525, -1.654938, 2.603325, 1, 0, 0.4784314, 1,
1.455657, 0.1622082, 1.178142, 1, 0, 0.4745098, 1,
1.477834, -1.732625, 1.410512, 1, 0, 0.4666667, 1,
1.483821, -1.509278, 1.720299, 1, 0, 0.4627451, 1,
1.484746, 1.426657, 2.470384, 1, 0, 0.454902, 1,
1.490926, -1.748114, 1.214998, 1, 0, 0.4509804, 1,
1.511554, 0.399473, 3.701435, 1, 0, 0.4431373, 1,
1.512775, 0.5727714, -0.4102967, 1, 0, 0.4392157, 1,
1.537007, 1.205987, 1.374552, 1, 0, 0.4313726, 1,
1.54338, 0.3415573, 0.4400641, 1, 0, 0.427451, 1,
1.55802, -1.739595, 1.225137, 1, 0, 0.4196078, 1,
1.565733, -0.4359833, -0.7509129, 1, 0, 0.4156863, 1,
1.56603, 1.045176, 2.525153, 1, 0, 0.4078431, 1,
1.58132, -0.301256, 1.127855, 1, 0, 0.4039216, 1,
1.588942, -0.5847006, 1.613086, 1, 0, 0.3960784, 1,
1.591322, 0.3090281, 3.030002, 1, 0, 0.3882353, 1,
1.602416, 1.015708, -0.624702, 1, 0, 0.3843137, 1,
1.623888, 1.088736, -0.1551505, 1, 0, 0.3764706, 1,
1.628793, 0.6558255, 0.9451342, 1, 0, 0.372549, 1,
1.631721, -0.6264235, 0.9984378, 1, 0, 0.3647059, 1,
1.666117, -0.8236824, 2.531399, 1, 0, 0.3607843, 1,
1.67723, 0.9598727, 0.7776276, 1, 0, 0.3529412, 1,
1.682499, -0.4470645, 1.187162, 1, 0, 0.3490196, 1,
1.683156, -0.5999264, 2.866771, 1, 0, 0.3411765, 1,
1.687148, -0.2425331, 3.40713, 1, 0, 0.3372549, 1,
1.706094, 0.5036994, 0.4779756, 1, 0, 0.3294118, 1,
1.726226, -3.570289, 3.149784, 1, 0, 0.3254902, 1,
1.729003, -0.5294156, 1.918892, 1, 0, 0.3176471, 1,
1.73014, 0.9039941, 1.682324, 1, 0, 0.3137255, 1,
1.737248, -0.1796135, 3.584959, 1, 0, 0.3058824, 1,
1.745153, -1.411692, 2.769106, 1, 0, 0.2980392, 1,
1.750703, 0.3498979, 2.151463, 1, 0, 0.2941177, 1,
1.761177, 0.3365957, 1.165433, 1, 0, 0.2862745, 1,
1.761804, 0.2455287, 0.7562205, 1, 0, 0.282353, 1,
1.76537, -0.008675825, 0.857671, 1, 0, 0.2745098, 1,
1.773363, -0.2016511, 2.159355, 1, 0, 0.2705882, 1,
1.777767, 0.8432067, 0.6921576, 1, 0, 0.2627451, 1,
1.780082, -0.7743707, 2.970616, 1, 0, 0.2588235, 1,
1.782999, 1.208038, 1.443622, 1, 0, 0.2509804, 1,
1.801335, 0.8421677, 2.460817, 1, 0, 0.2470588, 1,
1.816029, -1.769767, 2.967337, 1, 0, 0.2392157, 1,
1.819321, 0.4428634, 0.5662102, 1, 0, 0.2352941, 1,
1.822529, 1.999456, 0.4228806, 1, 0, 0.227451, 1,
1.823332, -0.01902284, 2.124109, 1, 0, 0.2235294, 1,
1.839, 0.9756815, 0.9243349, 1, 0, 0.2156863, 1,
1.839966, 1.4091, 1.361186, 1, 0, 0.2117647, 1,
1.845479, -0.4177921, -0.2013939, 1, 0, 0.2039216, 1,
1.894134, 1.332291, 1.017359, 1, 0, 0.1960784, 1,
1.947406, 0.1159907, 1.481908, 1, 0, 0.1921569, 1,
1.947427, 0.1841663, 0.9314356, 1, 0, 0.1843137, 1,
1.975937, 0.1216096, 0.8509873, 1, 0, 0.1803922, 1,
1.979363, 0.5858404, 1.466526, 1, 0, 0.172549, 1,
1.984216, -1.315156, 3.02578, 1, 0, 0.1686275, 1,
1.990953, 1.188545, -0.03988691, 1, 0, 0.1607843, 1,
1.994264, 0.5554734, 1.010724, 1, 0, 0.1568628, 1,
2.015625, -0.1760197, 2.48921, 1, 0, 0.1490196, 1,
2.029131, 1.041449, 0.9968864, 1, 0, 0.145098, 1,
2.057224, -1.525624, 2.561465, 1, 0, 0.1372549, 1,
2.062809, -0.2529717, 1.725564, 1, 0, 0.1333333, 1,
2.068095, -0.3473116, 2.328682, 1, 0, 0.1254902, 1,
2.113871, -1.195511, 1.895059, 1, 0, 0.1215686, 1,
2.119173, -0.3930684, 2.08629, 1, 0, 0.1137255, 1,
2.12437, -0.6452149, 2.072448, 1, 0, 0.1098039, 1,
2.126906, -0.1191459, 1.325409, 1, 0, 0.1019608, 1,
2.149892, -0.3142169, 1.297188, 1, 0, 0.09411765, 1,
2.180683, -0.1714003, 2.62073, 1, 0, 0.09019608, 1,
2.21067, -0.3680635, 1.407299, 1, 0, 0.08235294, 1,
2.24883, 0.1638372, 1.094243, 1, 0, 0.07843138, 1,
2.266407, -0.3682498, 2.020924, 1, 0, 0.07058824, 1,
2.318846, 0.4730015, 1.47096, 1, 0, 0.06666667, 1,
2.334049, -1.037595, 3.302637, 1, 0, 0.05882353, 1,
2.413002, 1.766979, -0.4283477, 1, 0, 0.05490196, 1,
2.42266, 0.1083714, 1.472285, 1, 0, 0.04705882, 1,
2.511344, 0.6560779, 1.805478, 1, 0, 0.04313726, 1,
2.524662, 0.6778646, 0.08248986, 1, 0, 0.03529412, 1,
2.549384, 2.24235, 2.132157, 1, 0, 0.03137255, 1,
2.568098, 0.1680513, 0.8009826, 1, 0, 0.02352941, 1,
2.63227, 0.2986364, 1.603455, 1, 0, 0.01960784, 1,
2.747234, -1.068172, 1.331227, 1, 0, 0.01176471, 1,
3.625558, -1.08085, 0.8866413, 1, 0, 0.007843138, 1
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
0.0827831, -4.7882, -7.12079, 0, -0.5, 0.5, 0.5,
0.0827831, -4.7882, -7.12079, 1, -0.5, 0.5, 0.5,
0.0827831, -4.7882, -7.12079, 1, 1.5, 0.5, 0.5,
0.0827831, -4.7882, -7.12079, 0, 1.5, 0.5, 0.5
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
-4.660992, 0.02236748, -7.12079, 0, -0.5, 0.5, 0.5,
-4.660992, 0.02236748, -7.12079, 1, -0.5, 0.5, 0.5,
-4.660992, 0.02236748, -7.12079, 1, 1.5, 0.5, 0.5,
-4.660992, 0.02236748, -7.12079, 0, 1.5, 0.5, 0.5
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
-4.660992, -4.7882, 0.09377646, 0, -0.5, 0.5, 0.5,
-4.660992, -4.7882, 0.09377646, 1, -0.5, 0.5, 0.5,
-4.660992, -4.7882, 0.09377646, 1, 1.5, 0.5, 0.5,
-4.660992, -4.7882, 0.09377646, 0, 1.5, 0.5, 0.5
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
-2, -3.678069, -5.45589,
2, -3.678069, -5.45589,
-2, -3.678069, -5.45589,
-2, -3.863091, -5.733374,
0, -3.678069, -5.45589,
0, -3.863091, -5.733374,
2, -3.678069, -5.45589,
2, -3.863091, -5.733374
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
"0",
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
-2, -4.233134, -6.288341, 0, -0.5, 0.5, 0.5,
-2, -4.233134, -6.288341, 1, -0.5, 0.5, 0.5,
-2, -4.233134, -6.288341, 1, 1.5, 0.5, 0.5,
-2, -4.233134, -6.288341, 0, 1.5, 0.5, 0.5,
0, -4.233134, -6.288341, 0, -0.5, 0.5, 0.5,
0, -4.233134, -6.288341, 1, -0.5, 0.5, 0.5,
0, -4.233134, -6.288341, 1, 1.5, 0.5, 0.5,
0, -4.233134, -6.288341, 0, 1.5, 0.5, 0.5,
2, -4.233134, -6.288341, 0, -0.5, 0.5, 0.5,
2, -4.233134, -6.288341, 1, -0.5, 0.5, 0.5,
2, -4.233134, -6.288341, 1, 1.5, 0.5, 0.5,
2, -4.233134, -6.288341, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.566275, -2, -5.45589,
-3.566275, 2, -5.45589,
-3.566275, -2, -5.45589,
-3.748728, -2, -5.733374,
-3.566275, 0, -5.45589,
-3.748728, 0, -5.733374,
-3.566275, 2, -5.45589,
-3.748728, 2, -5.733374
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
-4.113634, -2, -6.288341, 0, -0.5, 0.5, 0.5,
-4.113634, -2, -6.288341, 1, -0.5, 0.5, 0.5,
-4.113634, -2, -6.288341, 1, 1.5, 0.5, 0.5,
-4.113634, -2, -6.288341, 0, 1.5, 0.5, 0.5,
-4.113634, 0, -6.288341, 0, -0.5, 0.5, 0.5,
-4.113634, 0, -6.288341, 1, -0.5, 0.5, 0.5,
-4.113634, 0, -6.288341, 1, 1.5, 0.5, 0.5,
-4.113634, 0, -6.288341, 0, 1.5, 0.5, 0.5,
-4.113634, 2, -6.288341, 0, -0.5, 0.5, 0.5,
-4.113634, 2, -6.288341, 1, -0.5, 0.5, 0.5,
-4.113634, 2, -6.288341, 1, 1.5, 0.5, 0.5,
-4.113634, 2, -6.288341, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.566275, -3.678069, -4,
-3.566275, -3.678069, 4,
-3.566275, -3.678069, -4,
-3.748728, -3.863091, -4,
-3.566275, -3.678069, -2,
-3.748728, -3.863091, -2,
-3.566275, -3.678069, 0,
-3.748728, -3.863091, 0,
-3.566275, -3.678069, 2,
-3.748728, -3.863091, 2,
-3.566275, -3.678069, 4,
-3.748728, -3.863091, 4
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
-4.113634, -4.233134, -4, 0, -0.5, 0.5, 0.5,
-4.113634, -4.233134, -4, 1, -0.5, 0.5, 0.5,
-4.113634, -4.233134, -4, 1, 1.5, 0.5, 0.5,
-4.113634, -4.233134, -4, 0, 1.5, 0.5, 0.5,
-4.113634, -4.233134, -2, 0, -0.5, 0.5, 0.5,
-4.113634, -4.233134, -2, 1, -0.5, 0.5, 0.5,
-4.113634, -4.233134, -2, 1, 1.5, 0.5, 0.5,
-4.113634, -4.233134, -2, 0, 1.5, 0.5, 0.5,
-4.113634, -4.233134, 0, 0, -0.5, 0.5, 0.5,
-4.113634, -4.233134, 0, 1, -0.5, 0.5, 0.5,
-4.113634, -4.233134, 0, 1, 1.5, 0.5, 0.5,
-4.113634, -4.233134, 0, 0, 1.5, 0.5, 0.5,
-4.113634, -4.233134, 2, 0, -0.5, 0.5, 0.5,
-4.113634, -4.233134, 2, 1, -0.5, 0.5, 0.5,
-4.113634, -4.233134, 2, 1, 1.5, 0.5, 0.5,
-4.113634, -4.233134, 2, 0, 1.5, 0.5, 0.5,
-4.113634, -4.233134, 4, 0, -0.5, 0.5, 0.5,
-4.113634, -4.233134, 4, 1, -0.5, 0.5, 0.5,
-4.113634, -4.233134, 4, 1, 1.5, 0.5, 0.5,
-4.113634, -4.233134, 4, 0, 1.5, 0.5, 0.5
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
-3.566275, -3.678069, -5.45589,
-3.566275, 3.722804, -5.45589,
-3.566275, -3.678069, 5.643443,
-3.566275, 3.722804, 5.643443,
-3.566275, -3.678069, -5.45589,
-3.566275, -3.678069, 5.643443,
-3.566275, 3.722804, -5.45589,
-3.566275, 3.722804, 5.643443,
-3.566275, -3.678069, -5.45589,
3.731841, -3.678069, -5.45589,
-3.566275, -3.678069, 5.643443,
3.731841, -3.678069, 5.643443,
-3.566275, 3.722804, -5.45589,
3.731841, 3.722804, -5.45589,
-3.566275, 3.722804, 5.643443,
3.731841, 3.722804, 5.643443,
3.731841, -3.678069, -5.45589,
3.731841, 3.722804, -5.45589,
3.731841, -3.678069, 5.643443,
3.731841, 3.722804, 5.643443,
3.731841, -3.678069, -5.45589,
3.731841, -3.678069, 5.643443,
3.731841, 3.722804, -5.45589,
3.731841, 3.722804, 5.643443
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
var radius = 8.119852;
var distance = 36.12614;
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
mvMatrix.translate( -0.0827831, -0.02236748, -0.09377646 );
mvMatrix.scale( 1.20296, 1.186258, 0.7909793 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.12614);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
ethylene_dichloride_<-read.table("ethylene_dichloride_.xyz", skip=1)
x<-ethylene_dichloride_$V2
y<-ethylene_dichloride_$V3
z<-ethylene_dichloride_$V4
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
7, 5, 2, 0, 0, 1, 1, 1,
1, 1, 1, 1, 0, 0, 1, 1,
2, 2, 1, 1, 0, 0, 1, 1,
4, 1, 1, 1, 0, 0, 1, 1,
2, 3, 1, 1, 0, 0, 1, 1,
3, 4, 1, 1, 0, 0, 1, 1,
5, 4, 1, 0, 0, 0, 1, 1,
6, 3, 1, 0, 0, 0, 1, 1
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
var radius = 5.742169;
var distance = 20.16912;
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
mvMatrix.translate( -4, -3, -1.5 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -20.16912);
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
