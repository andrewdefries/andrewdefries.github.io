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
-3.734888, -1.354537, -1.53221, 1, 0, 0, 1,
-3.427283, -0.01670148, -1.790472, 1, 0.007843138, 0, 1,
-3.020869, -0.4344946, -0.5516106, 1, 0.01176471, 0, 1,
-3.002142, 1.590828, -0.1178894, 1, 0.01960784, 0, 1,
-2.833635, 0.7528406, -0.3918374, 1, 0.02352941, 0, 1,
-2.769396, -0.08912326, -1.921795, 1, 0.03137255, 0, 1,
-2.6798, 1.789333, -0.292464, 1, 0.03529412, 0, 1,
-2.597166, 0.6148456, -0.6957746, 1, 0.04313726, 0, 1,
-2.527183, 1.323428, -0.7539358, 1, 0.04705882, 0, 1,
-2.444123, -0.12315, -1.974137, 1, 0.05490196, 0, 1,
-2.42026, -1.464797, -2.554884, 1, 0.05882353, 0, 1,
-2.418037, -0.04745603, -0.5850744, 1, 0.06666667, 0, 1,
-2.322433, 0.983543, -1.271157, 1, 0.07058824, 0, 1,
-2.298968, -2.452408, -1.733159, 1, 0.07843138, 0, 1,
-2.274614, -1.789288, -2.635927, 1, 0.08235294, 0, 1,
-2.174177, 0.09506968, -1.024868, 1, 0.09019608, 0, 1,
-2.134382, 1.046701, -3.029579, 1, 0.09411765, 0, 1,
-2.098144, -0.6840989, -4.289058, 1, 0.1019608, 0, 1,
-2.094823, 0.2031974, -2.28223, 1, 0.1098039, 0, 1,
-2.086629, -0.5925946, -3.139018, 1, 0.1137255, 0, 1,
-2.065024, -1.613643, -4.201215, 1, 0.1215686, 0, 1,
-2.063534, 1.201472, -1.504772, 1, 0.1254902, 0, 1,
-2.061098, 0.2212053, -1.422067, 1, 0.1333333, 0, 1,
-2.048189, -0.7399337, -1.556807, 1, 0.1372549, 0, 1,
-2.032422, -0.6612012, -1.514275, 1, 0.145098, 0, 1,
-2.024997, 1.47801, -1.029671, 1, 0.1490196, 0, 1,
-2.013799, 1.304338, -1.309789, 1, 0.1568628, 0, 1,
-1.990576, 0.9704279, 0.2833148, 1, 0.1607843, 0, 1,
-1.986859, 0.7784001, -1.160138, 1, 0.1686275, 0, 1,
-1.960767, 0.1732958, -0.5193065, 1, 0.172549, 0, 1,
-1.943289, 0.5616075, -1.933276, 1, 0.1803922, 0, 1,
-1.91978, 0.3760991, -1.008904, 1, 0.1843137, 0, 1,
-1.889118, -0.3698947, -1.639563, 1, 0.1921569, 0, 1,
-1.880344, -0.4688951, -2.711284, 1, 0.1960784, 0, 1,
-1.869761, 1.012988, -1.458721, 1, 0.2039216, 0, 1,
-1.861174, 1.791774, -0.8622378, 1, 0.2117647, 0, 1,
-1.855488, -1.078535, -4.038097, 1, 0.2156863, 0, 1,
-1.854214, 1.375473, -1.42429, 1, 0.2235294, 0, 1,
-1.84947, -0.4442362, -1.501933, 1, 0.227451, 0, 1,
-1.849082, 0.4847761, -0.8802916, 1, 0.2352941, 0, 1,
-1.831298, -0.1280174, -2.203635, 1, 0.2392157, 0, 1,
-1.808899, 1.673818, 0.1157388, 1, 0.2470588, 0, 1,
-1.808759, 1.56634, 0.5655856, 1, 0.2509804, 0, 1,
-1.798221, -1.962668, 0.001311931, 1, 0.2588235, 0, 1,
-1.783198, 0.06146395, -2.820498, 1, 0.2627451, 0, 1,
-1.774174, 0.461763, -1.326148, 1, 0.2705882, 0, 1,
-1.758324, 0.6156273, -1.425776, 1, 0.2745098, 0, 1,
-1.735709, -1.011999, -2.186161, 1, 0.282353, 0, 1,
-1.732756, -0.1056284, -1.925512, 1, 0.2862745, 0, 1,
-1.698427, 1.34376, -1.658458, 1, 0.2941177, 0, 1,
-1.682452, 1.551253, -1.527477, 1, 0.3019608, 0, 1,
-1.679095, -0.8943838, -1.057144, 1, 0.3058824, 0, 1,
-1.665326, -2.407845, -3.101955, 1, 0.3137255, 0, 1,
-1.659204, -0.1624192, -1.947464, 1, 0.3176471, 0, 1,
-1.659074, 0.01826879, 0.4372137, 1, 0.3254902, 0, 1,
-1.65216, 1.926725, -2.786004, 1, 0.3294118, 0, 1,
-1.651719, -1.275945, 0.4057612, 1, 0.3372549, 0, 1,
-1.643447, 0.06449002, -1.202191, 1, 0.3411765, 0, 1,
-1.64221, 0.4537431, -1.727998, 1, 0.3490196, 0, 1,
-1.63692, 0.06762177, -2.174751, 1, 0.3529412, 0, 1,
-1.620555, 0.3731583, -2.57703, 1, 0.3607843, 0, 1,
-1.615547, 0.1940113, -1.825951, 1, 0.3647059, 0, 1,
-1.60964, 0.3788116, -1.222333, 1, 0.372549, 0, 1,
-1.59597, -1.974437, -3.732329, 1, 0.3764706, 0, 1,
-1.585974, 0.5473123, 0.1904356, 1, 0.3843137, 0, 1,
-1.585072, 0.4019865, 0.608871, 1, 0.3882353, 0, 1,
-1.583263, 0.2638415, 0.1402214, 1, 0.3960784, 0, 1,
-1.574379, -0.7382432, -0.9482263, 1, 0.4039216, 0, 1,
-1.566982, 1.806112, 0.5392984, 1, 0.4078431, 0, 1,
-1.557772, 1.532859, -1.037661, 1, 0.4156863, 0, 1,
-1.55524, 1.032371, 0.1985257, 1, 0.4196078, 0, 1,
-1.550036, -0.8226893, -2.646795, 1, 0.427451, 0, 1,
-1.540004, -0.8790825, -0.862492, 1, 0.4313726, 0, 1,
-1.538286, -0.7163906, -1.350494, 1, 0.4392157, 0, 1,
-1.535018, 0.3338951, -0.4533049, 1, 0.4431373, 0, 1,
-1.533211, 0.03816474, -0.7404416, 1, 0.4509804, 0, 1,
-1.529858, 0.1246178, 0.1117432, 1, 0.454902, 0, 1,
-1.525364, 0.283647, -1.938441, 1, 0.4627451, 0, 1,
-1.52368, -0.6467987, 0.6290635, 1, 0.4666667, 0, 1,
-1.521462, 0.6593473, -1.459356, 1, 0.4745098, 0, 1,
-1.505319, 0.6089551, -0.4418124, 1, 0.4784314, 0, 1,
-1.480431, 1.749063, -1.587153, 1, 0.4862745, 0, 1,
-1.477547, 1.422024, -0.716897, 1, 0.4901961, 0, 1,
-1.458077, 0.06612867, -1.791623, 1, 0.4980392, 0, 1,
-1.448789, 0.1020188, -0.537602, 1, 0.5058824, 0, 1,
-1.446199, 2.082839, 0.3251272, 1, 0.509804, 0, 1,
-1.443743, -1.315455, -3.177528, 1, 0.5176471, 0, 1,
-1.420593, -2.081835, -2.309055, 1, 0.5215687, 0, 1,
-1.412806, 0.8559881, -0.03405348, 1, 0.5294118, 0, 1,
-1.37373, 1.303217, -0.1842032, 1, 0.5333334, 0, 1,
-1.371147, -0.01964231, -2.250471, 1, 0.5411765, 0, 1,
-1.342079, 0.106102, 0.5457723, 1, 0.5450981, 0, 1,
-1.339071, 1.552096, -0.8807399, 1, 0.5529412, 0, 1,
-1.327514, -0.6138672, -2.635511, 1, 0.5568628, 0, 1,
-1.316807, -0.2897415, -0.5621517, 1, 0.5647059, 0, 1,
-1.312435, 0.2863136, -0.701096, 1, 0.5686275, 0, 1,
-1.310848, 1.197124, -1.666743, 1, 0.5764706, 0, 1,
-1.297555, -1.404163, -1.200477, 1, 0.5803922, 0, 1,
-1.289709, 0.2049431, -1.808125, 1, 0.5882353, 0, 1,
-1.288627, 1.220347, 0.3973066, 1, 0.5921569, 0, 1,
-1.288427, 0.6350479, -0.5171117, 1, 0.6, 0, 1,
-1.287354, 0.7031523, 0.513094, 1, 0.6078432, 0, 1,
-1.281566, -2.688748, -1.407021, 1, 0.6117647, 0, 1,
-1.279432, 0.2506168, -0.6545528, 1, 0.6196079, 0, 1,
-1.278721, 0.700447, -0.5094064, 1, 0.6235294, 0, 1,
-1.274154, 0.9222009, -0.1186976, 1, 0.6313726, 0, 1,
-1.273253, 1.81439, 0.1685092, 1, 0.6352941, 0, 1,
-1.269936, 0.6108686, -2.145225, 1, 0.6431373, 0, 1,
-1.26935, 1.563596, -0.5200391, 1, 0.6470588, 0, 1,
-1.262567, 0.5290005, -1.929344, 1, 0.654902, 0, 1,
-1.257627, -1.305453, -1.652016, 1, 0.6588235, 0, 1,
-1.247493, 1.976579, -1.127887, 1, 0.6666667, 0, 1,
-1.243677, -0.3071875, -1.746942, 1, 0.6705883, 0, 1,
-1.236319, -1.120295, -2.415242, 1, 0.6784314, 0, 1,
-1.229509, -1.169332, -2.086153, 1, 0.682353, 0, 1,
-1.224585, -0.1781491, -0.9878647, 1, 0.6901961, 0, 1,
-1.224173, 1.047581, -2.119383, 1, 0.6941177, 0, 1,
-1.224012, -1.383196, -2.358068, 1, 0.7019608, 0, 1,
-1.221411, 0.5457567, 0.3179274, 1, 0.7098039, 0, 1,
-1.210862, 1.907353, -1.158363, 1, 0.7137255, 0, 1,
-1.205212, -0.1302041, -2.713806, 1, 0.7215686, 0, 1,
-1.203591, -1.346203, -2.474962, 1, 0.7254902, 0, 1,
-1.193061, 0.2042815, -0.6673102, 1, 0.7333333, 0, 1,
-1.190207, 0.05274833, -3.251416, 1, 0.7372549, 0, 1,
-1.183207, -0.4917533, -2.03618, 1, 0.7450981, 0, 1,
-1.18199, 1.032561, -1.622881, 1, 0.7490196, 0, 1,
-1.176174, -0.3071694, -3.169577, 1, 0.7568628, 0, 1,
-1.171455, -0.7326563, -1.958043, 1, 0.7607843, 0, 1,
-1.159512, 0.4131126, -0.7165231, 1, 0.7686275, 0, 1,
-1.157649, 0.861621, -1.285676, 1, 0.772549, 0, 1,
-1.141477, 0.9272035, -1.400636, 1, 0.7803922, 0, 1,
-1.140804, 0.5745832, -3.203644, 1, 0.7843137, 0, 1,
-1.129757, 0.8383165, 0.4887578, 1, 0.7921569, 0, 1,
-1.121894, -0.0464408, 0.4119298, 1, 0.7960784, 0, 1,
-1.121267, 0.8688668, -2.002043, 1, 0.8039216, 0, 1,
-1.120142, 0.2818024, -1.046014, 1, 0.8117647, 0, 1,
-1.118469, 0.2343073, -0.6569504, 1, 0.8156863, 0, 1,
-1.117433, 1.922712, -1.491939, 1, 0.8235294, 0, 1,
-1.115163, -0.7971531, -2.702855, 1, 0.827451, 0, 1,
-1.109141, -0.5463549, -2.184316, 1, 0.8352941, 0, 1,
-1.102379, -1.721976, -1.890831, 1, 0.8392157, 0, 1,
-1.085916, 0.3209895, -0.813625, 1, 0.8470588, 0, 1,
-1.083764, -0.2071543, -0.2366176, 1, 0.8509804, 0, 1,
-1.082308, 1.350444, -0.3799683, 1, 0.8588235, 0, 1,
-1.071377, -0.1536351, -2.844996, 1, 0.8627451, 0, 1,
-1.058993, -0.1613967, -2.323174, 1, 0.8705882, 0, 1,
-1.053631, -0.09027562, -0.4391456, 1, 0.8745098, 0, 1,
-1.051789, -1.025189, -1.184449, 1, 0.8823529, 0, 1,
-1.049608, -0.5193453, -1.710448, 1, 0.8862745, 0, 1,
-1.044891, 0.5455896, -2.175061, 1, 0.8941177, 0, 1,
-1.042424, -0.2854788, -2.176355, 1, 0.8980392, 0, 1,
-1.037336, 1.017584, 0.06568187, 1, 0.9058824, 0, 1,
-1.0341, 1.485559, -0.2322251, 1, 0.9137255, 0, 1,
-1.033886, -1.645566, -2.388117, 1, 0.9176471, 0, 1,
-1.028598, -0.2169672, -0.3904724, 1, 0.9254902, 0, 1,
-1.028496, 0.4427903, -2.081058, 1, 0.9294118, 0, 1,
-1.025428, 0.4005936, -1.356881, 1, 0.9372549, 0, 1,
-1.024023, 0.2975072, -0.9107615, 1, 0.9411765, 0, 1,
-1.023515, -0.4683752, -3.092201, 1, 0.9490196, 0, 1,
-1.018796, -1.817074, -0.8441744, 1, 0.9529412, 0, 1,
-1.018364, 1.13649, -4.075949, 1, 0.9607843, 0, 1,
-1.018339, 0.3595566, -0.2399938, 1, 0.9647059, 0, 1,
-1.015022, -1.671344, -4.207473, 1, 0.972549, 0, 1,
-1.007622, 0.4810685, -1.9315, 1, 0.9764706, 0, 1,
-1.003808, 0.1489997, -1.573763, 1, 0.9843137, 0, 1,
-1.002962, -0.1173907, -2.222987, 1, 0.9882353, 0, 1,
-0.9952103, -0.4023884, -0.4614534, 1, 0.9960784, 0, 1,
-0.9948922, -2.117495, -3.621728, 0.9960784, 1, 0, 1,
-0.9937264, -1.281115, -3.810106, 0.9921569, 1, 0, 1,
-0.9916121, 0.3926219, -1.40545, 0.9843137, 1, 0, 1,
-0.9880201, -0.8869596, -1.060779, 0.9803922, 1, 0, 1,
-0.9873984, 0.278959, -0.4852407, 0.972549, 1, 0, 1,
-0.9871287, -0.09889979, -1.96983, 0.9686275, 1, 0, 1,
-0.9785645, -0.4575797, -1.787619, 0.9607843, 1, 0, 1,
-0.9643844, -0.7805719, -0.8736049, 0.9568627, 1, 0, 1,
-0.9637361, 0.8688517, -0.990376, 0.9490196, 1, 0, 1,
-0.9610473, 0.1229029, -1.900173, 0.945098, 1, 0, 1,
-0.9575616, -0.06940105, -1.923879, 0.9372549, 1, 0, 1,
-0.9560115, 1.766099, 0.6639268, 0.9333333, 1, 0, 1,
-0.9519829, 0.6235247, -0.5750692, 0.9254902, 1, 0, 1,
-0.9445927, 0.02356039, -1.824104, 0.9215686, 1, 0, 1,
-0.9432867, 1.176903, -1.185894, 0.9137255, 1, 0, 1,
-0.9427803, -1.137159, -2.587852, 0.9098039, 1, 0, 1,
-0.941906, -0.8185619, -1.397392, 0.9019608, 1, 0, 1,
-0.9387355, -0.5826105, -2.287974, 0.8941177, 1, 0, 1,
-0.932821, -1.203725, -3.022486, 0.8901961, 1, 0, 1,
-0.9289005, -0.1653972, -1.318978, 0.8823529, 1, 0, 1,
-0.9194267, 0.2313272, 0.4018376, 0.8784314, 1, 0, 1,
-0.9132397, 0.8877118, -1.570412, 0.8705882, 1, 0, 1,
-0.9116049, 0.552463, -1.350792, 0.8666667, 1, 0, 1,
-0.9100189, 1.927545, -0.03835759, 0.8588235, 1, 0, 1,
-0.9037979, -1.046018, -1.786465, 0.854902, 1, 0, 1,
-0.8977289, 0.6024579, -1.528403, 0.8470588, 1, 0, 1,
-0.894608, -0.1993412, -0.9736755, 0.8431373, 1, 0, 1,
-0.8936616, -0.6162681, -0.7494001, 0.8352941, 1, 0, 1,
-0.890833, -0.9739347, -3.998761, 0.8313726, 1, 0, 1,
-0.888891, 1.114733, -0.3390941, 0.8235294, 1, 0, 1,
-0.8866268, 0.5912177, -1.586788, 0.8196079, 1, 0, 1,
-0.8822218, 0.4378617, 1.425498, 0.8117647, 1, 0, 1,
-0.8781242, 0.609379, -0.5424501, 0.8078431, 1, 0, 1,
-0.8710069, 2.393298, -2.121732, 0.8, 1, 0, 1,
-0.8703802, -1.710552, -2.337918, 0.7921569, 1, 0, 1,
-0.8692397, -0.009728791, -0.8020985, 0.7882353, 1, 0, 1,
-0.8674317, 0.04616883, -0.4147646, 0.7803922, 1, 0, 1,
-0.8669227, 0.520228, 0.4269879, 0.7764706, 1, 0, 1,
-0.8665982, 0.7149988, -2.227727, 0.7686275, 1, 0, 1,
-0.8621528, 0.1113221, -0.4973259, 0.7647059, 1, 0, 1,
-0.8620711, 1.578895, 0.6797004, 0.7568628, 1, 0, 1,
-0.8571135, -0.1481312, -1.527837, 0.7529412, 1, 0, 1,
-0.8555675, -0.6103849, -0.7796796, 0.7450981, 1, 0, 1,
-0.8549013, -0.1485607, -0.8146238, 0.7411765, 1, 0, 1,
-0.8517532, -0.2597036, -0.3419091, 0.7333333, 1, 0, 1,
-0.8505116, -0.3449778, -2.999264, 0.7294118, 1, 0, 1,
-0.8491971, -0.005246373, -0.2566681, 0.7215686, 1, 0, 1,
-0.8460288, -0.378413, -2.113834, 0.7176471, 1, 0, 1,
-0.8447534, 0.5952338, -1.486332, 0.7098039, 1, 0, 1,
-0.8373519, 0.1245302, -0.3673748, 0.7058824, 1, 0, 1,
-0.8366277, -0.5642416, -0.7414184, 0.6980392, 1, 0, 1,
-0.8339511, 0.8986099, -0.7422246, 0.6901961, 1, 0, 1,
-0.8332704, -0.04838971, -0.7889847, 0.6862745, 1, 0, 1,
-0.8306808, -0.04259536, -1.134073, 0.6784314, 1, 0, 1,
-0.826126, -1.045956, -2.367163, 0.6745098, 1, 0, 1,
-0.8197283, 1.054324, -0.8403286, 0.6666667, 1, 0, 1,
-0.8187437, -0.7832152, -2.780679, 0.6627451, 1, 0, 1,
-0.8072595, -1.269579, -1.877944, 0.654902, 1, 0, 1,
-0.8001941, 0.2374619, -0.2062034, 0.6509804, 1, 0, 1,
-0.7988529, 0.1472014, 1.153229, 0.6431373, 1, 0, 1,
-0.7897481, -1.286057, -2.152299, 0.6392157, 1, 0, 1,
-0.788035, -0.2622559, -2.935985, 0.6313726, 1, 0, 1,
-0.7863058, 0.4822534, 0.7394427, 0.627451, 1, 0, 1,
-0.7827112, -0.7956409, -2.665792, 0.6196079, 1, 0, 1,
-0.7795835, 1.003342, -0.6780952, 0.6156863, 1, 0, 1,
-0.7733377, -1.400433, -2.983563, 0.6078432, 1, 0, 1,
-0.7727703, -1.278047, -2.698061, 0.6039216, 1, 0, 1,
-0.7704712, 0.5752707, -1.657868, 0.5960785, 1, 0, 1,
-0.7692276, -0.2407783, -1.81715, 0.5882353, 1, 0, 1,
-0.759883, 2.820772, 1.391034, 0.5843138, 1, 0, 1,
-0.7532524, 1.67588, 0.7947723, 0.5764706, 1, 0, 1,
-0.7486063, -0.4315003, -2.690036, 0.572549, 1, 0, 1,
-0.7466657, 1.903815, -0.5809271, 0.5647059, 1, 0, 1,
-0.7395621, 0.4887335, 1.570737, 0.5607843, 1, 0, 1,
-0.7373782, 0.05343676, -0.9622161, 0.5529412, 1, 0, 1,
-0.7370318, -0.7855282, -2.077172, 0.5490196, 1, 0, 1,
-0.730689, 0.1673688, -1.655715, 0.5411765, 1, 0, 1,
-0.726504, 1.683111, 0.08837143, 0.5372549, 1, 0, 1,
-0.7228097, 0.2268447, -2.095081, 0.5294118, 1, 0, 1,
-0.7190978, 1.614266, -0.8890023, 0.5254902, 1, 0, 1,
-0.7190346, -0.6152393, -2.614481, 0.5176471, 1, 0, 1,
-0.7116333, -1.308233, -2.709886, 0.5137255, 1, 0, 1,
-0.7110428, -0.07386576, -0.7789372, 0.5058824, 1, 0, 1,
-0.6985427, -0.6276857, -1.632531, 0.5019608, 1, 0, 1,
-0.6967483, 1.941984, -0.1779148, 0.4941176, 1, 0, 1,
-0.6937439, -1.599491, -0.2312228, 0.4862745, 1, 0, 1,
-0.6926486, 0.3023025, -1.638182, 0.4823529, 1, 0, 1,
-0.6870834, -1.93175, -3.835579, 0.4745098, 1, 0, 1,
-0.6842228, 0.6155707, -1.427231, 0.4705882, 1, 0, 1,
-0.6819477, -0.7271895, -1.751112, 0.4627451, 1, 0, 1,
-0.6795886, -1.346901, -1.969088, 0.4588235, 1, 0, 1,
-0.6790571, -0.3392001, -2.116226, 0.4509804, 1, 0, 1,
-0.6750295, 0.2103899, -0.4902625, 0.4470588, 1, 0, 1,
-0.6739125, -0.2312503, -1.577221, 0.4392157, 1, 0, 1,
-0.6702505, 0.7959401, -2.02441, 0.4352941, 1, 0, 1,
-0.6679345, -0.4154407, -1.688882, 0.427451, 1, 0, 1,
-0.6655046, -0.2137562, -1.409052, 0.4235294, 1, 0, 1,
-0.6603588, -0.8853511, -0.6803551, 0.4156863, 1, 0, 1,
-0.6601645, 1.355332, -1.791829, 0.4117647, 1, 0, 1,
-0.6592018, 0.6712669, -1.627093, 0.4039216, 1, 0, 1,
-0.6578949, -1.746431, -2.290097, 0.3960784, 1, 0, 1,
-0.6574553, 0.1308624, -0.695038, 0.3921569, 1, 0, 1,
-0.6532183, 0.4602363, 0.06895901, 0.3843137, 1, 0, 1,
-0.6530542, 1.084768, -0.7530226, 0.3803922, 1, 0, 1,
-0.6516764, 0.01082921, -1.636164, 0.372549, 1, 0, 1,
-0.6509126, 1.87512, 1.019395, 0.3686275, 1, 0, 1,
-0.649722, 0.137753, -2.805984, 0.3607843, 1, 0, 1,
-0.6487772, 1.164308, 0.122047, 0.3568628, 1, 0, 1,
-0.6477938, -0.5765957, -2.816359, 0.3490196, 1, 0, 1,
-0.6473034, -0.5892941, -1.888939, 0.345098, 1, 0, 1,
-0.6468847, 0.3972794, -0.9465058, 0.3372549, 1, 0, 1,
-0.6464696, 0.5031135, -2.044179, 0.3333333, 1, 0, 1,
-0.6456999, -0.7321928, -3.83125, 0.3254902, 1, 0, 1,
-0.6453043, 2.125962, -0.09033179, 0.3215686, 1, 0, 1,
-0.6444322, 1.794826, -0.1101589, 0.3137255, 1, 0, 1,
-0.6440682, -1.1449, -3.352535, 0.3098039, 1, 0, 1,
-0.6406888, 0.5509892, -2.409564, 0.3019608, 1, 0, 1,
-0.636562, -0.6659336, -1.432115, 0.2941177, 1, 0, 1,
-0.6351653, 0.6071917, -1.468139, 0.2901961, 1, 0, 1,
-0.634476, -0.7658949, -2.255525, 0.282353, 1, 0, 1,
-0.6311124, 1.615008, -1.39339, 0.2784314, 1, 0, 1,
-0.6301031, 0.08833739, -0.6566958, 0.2705882, 1, 0, 1,
-0.6208512, -0.7062138, -1.692271, 0.2666667, 1, 0, 1,
-0.6178911, 0.05309768, -1.986441, 0.2588235, 1, 0, 1,
-0.6131585, 0.7106273, -0.841957, 0.254902, 1, 0, 1,
-0.6129031, 0.8883829, -2.902682, 0.2470588, 1, 0, 1,
-0.610939, -1.269267, -1.500879, 0.2431373, 1, 0, 1,
-0.6069734, -0.5777473, -2.922172, 0.2352941, 1, 0, 1,
-0.6050019, -0.7370225, -1.264927, 0.2313726, 1, 0, 1,
-0.6039565, -0.9185041, -2.095885, 0.2235294, 1, 0, 1,
-0.6031301, -0.514945, -4.225225, 0.2196078, 1, 0, 1,
-0.6016423, 1.356667, -0.08597594, 0.2117647, 1, 0, 1,
-0.5998685, -0.3592552, -2.903865, 0.2078431, 1, 0, 1,
-0.5993805, 0.1934618, -4.171492, 0.2, 1, 0, 1,
-0.5971007, -0.8140491, -2.069311, 0.1921569, 1, 0, 1,
-0.5948418, -0.4874013, -2.620093, 0.1882353, 1, 0, 1,
-0.5895693, -0.2543688, -1.524601, 0.1803922, 1, 0, 1,
-0.5842182, -0.5215979, -2.752218, 0.1764706, 1, 0, 1,
-0.5811991, 0.3493262, 1.702742, 0.1686275, 1, 0, 1,
-0.5802348, -0.7347243, -2.529254, 0.1647059, 1, 0, 1,
-0.5746943, 0.5230159, -0.6405799, 0.1568628, 1, 0, 1,
-0.5678223, 0.3722293, -1.255781, 0.1529412, 1, 0, 1,
-0.5595735, -1.71583, -0.9460151, 0.145098, 1, 0, 1,
-0.5583015, 0.8774841, -2.110186, 0.1411765, 1, 0, 1,
-0.5578969, 1.002347, -0.6336211, 0.1333333, 1, 0, 1,
-0.5578511, -1.214989, -1.853115, 0.1294118, 1, 0, 1,
-0.5575129, -0.07852046, -0.8190016, 0.1215686, 1, 0, 1,
-0.5531954, -0.5213501, -1.993411, 0.1176471, 1, 0, 1,
-0.54733, -1.076381, -0.8623826, 0.1098039, 1, 0, 1,
-0.5471935, -0.6400498, -3.277171, 0.1058824, 1, 0, 1,
-0.5448713, 0.1300408, -2.049674, 0.09803922, 1, 0, 1,
-0.5444707, -0.06597756, -2.241469, 0.09019608, 1, 0, 1,
-0.5384724, -0.8404846, -1.592585, 0.08627451, 1, 0, 1,
-0.536485, -0.4764014, -0.459311, 0.07843138, 1, 0, 1,
-0.5363158, 1.356252, -0.9792387, 0.07450981, 1, 0, 1,
-0.5355116, 0.3974935, -0.5116758, 0.06666667, 1, 0, 1,
-0.5327932, 1.506966, -0.05291609, 0.0627451, 1, 0, 1,
-0.5285866, -1.950738, -2.216557, 0.05490196, 1, 0, 1,
-0.5273074, -1.06553, -2.624201, 0.05098039, 1, 0, 1,
-0.5229593, -0.3737954, -2.086448, 0.04313726, 1, 0, 1,
-0.5215519, 0.1859439, -2.12239, 0.03921569, 1, 0, 1,
-0.5046484, -0.198711, -1.216044, 0.03137255, 1, 0, 1,
-0.5016801, 0.5607191, -0.01424492, 0.02745098, 1, 0, 1,
-0.5008289, -0.2777668, -2.965915, 0.01960784, 1, 0, 1,
-0.4978998, 0.50395, -1.739336, 0.01568628, 1, 0, 1,
-0.4955042, -0.9844093, -2.244418, 0.007843138, 1, 0, 1,
-0.4953866, -0.7841686, -3.345627, 0.003921569, 1, 0, 1,
-0.4945432, -0.8617265, -2.990302, 0, 1, 0.003921569, 1,
-0.4930963, -0.8917499, -2.466609, 0, 1, 0.01176471, 1,
-0.4925919, -0.2076451, -3.59161, 0, 1, 0.01568628, 1,
-0.4855644, -1.926455, -1.16677, 0, 1, 0.02352941, 1,
-0.4852152, 0.8817398, 0.05649138, 0, 1, 0.02745098, 1,
-0.4845814, -0.4607832, -1.169249, 0, 1, 0.03529412, 1,
-0.4845777, -0.1026158, -1.137675, 0, 1, 0.03921569, 1,
-0.4780185, -0.06230083, -3.587078, 0, 1, 0.04705882, 1,
-0.4704667, -0.3165292, -1.124354, 0, 1, 0.05098039, 1,
-0.4692215, -0.4011934, -2.32375, 0, 1, 0.05882353, 1,
-0.4687013, -1.391165, -3.25556, 0, 1, 0.0627451, 1,
-0.4675195, 0.2978373, 0.7923917, 0, 1, 0.07058824, 1,
-0.4646735, 1.117385, -1.186542, 0, 1, 0.07450981, 1,
-0.4636579, -0.6365945, -3.799624, 0, 1, 0.08235294, 1,
-0.4622122, -0.900718, -3.813305, 0, 1, 0.08627451, 1,
-0.4518994, -0.7082384, -2.198619, 0, 1, 0.09411765, 1,
-0.4491787, -0.02806215, -2.86607, 0, 1, 0.1019608, 1,
-0.4466775, -0.2712115, -0.9514499, 0, 1, 0.1058824, 1,
-0.445316, 0.2398884, -1.592227, 0, 1, 0.1137255, 1,
-0.4412468, -0.4922448, -1.4285, 0, 1, 0.1176471, 1,
-0.4369425, -0.1222739, -2.517176, 0, 1, 0.1254902, 1,
-0.4320638, 2.139785, -0.9367504, 0, 1, 0.1294118, 1,
-0.4289907, -1.512889, -3.023146, 0, 1, 0.1372549, 1,
-0.4254015, -0.4381919, -4.015944, 0, 1, 0.1411765, 1,
-0.423598, -1.163783, -2.507873, 0, 1, 0.1490196, 1,
-0.420534, -0.4199534, -2.742676, 0, 1, 0.1529412, 1,
-0.415919, -0.04090789, -0.9276589, 0, 1, 0.1607843, 1,
-0.4156245, -1.318886, -3.326275, 0, 1, 0.1647059, 1,
-0.4110374, -0.6498873, -1.23664, 0, 1, 0.172549, 1,
-0.4075164, 0.4768357, -1.522369, 0, 1, 0.1764706, 1,
-0.4009146, 1.476272, 0.5687433, 0, 1, 0.1843137, 1,
-0.3982779, 0.7030682, 0.1441767, 0, 1, 0.1882353, 1,
-0.3961008, -0.4854215, -3.839003, 0, 1, 0.1960784, 1,
-0.3940966, 0.5498419, -1.967106, 0, 1, 0.2039216, 1,
-0.3936636, 0.254555, 0.1828784, 0, 1, 0.2078431, 1,
-0.3905697, 0.8285422, 1.550092, 0, 1, 0.2156863, 1,
-0.3858781, -0.2016233, -1.42253, 0, 1, 0.2196078, 1,
-0.3796943, 0.4570441, -1.120008, 0, 1, 0.227451, 1,
-0.373675, 0.7629231, 0.3160626, 0, 1, 0.2313726, 1,
-0.3724895, 0.2704377, -1.508241, 0, 1, 0.2392157, 1,
-0.3703421, -0.2369363, -1.887067, 0, 1, 0.2431373, 1,
-0.3681364, 0.5341102, 1.36055, 0, 1, 0.2509804, 1,
-0.360229, -0.6917791, -2.891091, 0, 1, 0.254902, 1,
-0.3564693, 0.4193407, -0.2071354, 0, 1, 0.2627451, 1,
-0.354893, -0.6558569, -2.067685, 0, 1, 0.2666667, 1,
-0.3519543, 0.1488888, -2.806042, 0, 1, 0.2745098, 1,
-0.3498966, 1.300865, -0.5784764, 0, 1, 0.2784314, 1,
-0.3475919, -0.9403995, -3.833367, 0, 1, 0.2862745, 1,
-0.3467412, 0.009211536, -1.174588, 0, 1, 0.2901961, 1,
-0.3312894, -1.241685, -3.154932, 0, 1, 0.2980392, 1,
-0.3293208, -0.04287959, -2.27864, 0, 1, 0.3058824, 1,
-0.3257083, 0.3425013, -1.505953, 0, 1, 0.3098039, 1,
-0.3248787, -0.9530398, -2.397574, 0, 1, 0.3176471, 1,
-0.3240314, -0.5574984, -2.885428, 0, 1, 0.3215686, 1,
-0.321439, -0.1225204, -0.8083557, 0, 1, 0.3294118, 1,
-0.3160244, -0.9085497, -0.743904, 0, 1, 0.3333333, 1,
-0.3142525, 0.7522406, -2.642869, 0, 1, 0.3411765, 1,
-0.310416, 1.883777, -1.485018, 0, 1, 0.345098, 1,
-0.3080171, 0.6342343, -0.7763431, 0, 1, 0.3529412, 1,
-0.3071747, -1.141464, -1.614451, 0, 1, 0.3568628, 1,
-0.3047717, 1.42518, -1.650065, 0, 1, 0.3647059, 1,
-0.3040923, 0.4862072, -0.1293681, 0, 1, 0.3686275, 1,
-0.3003678, 0.5795206, -0.9302232, 0, 1, 0.3764706, 1,
-0.2947791, 0.1210219, -2.165673, 0, 1, 0.3803922, 1,
-0.2939848, 2.528213, -0.6659948, 0, 1, 0.3882353, 1,
-0.2883367, 0.2907521, -0.8141773, 0, 1, 0.3921569, 1,
-0.2870587, 1.163903, 1.081045, 0, 1, 0.4, 1,
-0.2805499, -0.2537116, -3.743848, 0, 1, 0.4078431, 1,
-0.2796523, -1.537494, -3.632087, 0, 1, 0.4117647, 1,
-0.2794346, 0.4415528, -0.7593504, 0, 1, 0.4196078, 1,
-0.2681197, -1.155053, -3.791031, 0, 1, 0.4235294, 1,
-0.26783, 1.299608, -1.439011, 0, 1, 0.4313726, 1,
-0.2658233, -0.03099182, -3.290849, 0, 1, 0.4352941, 1,
-0.265164, 0.8316829, -0.6577365, 0, 1, 0.4431373, 1,
-0.260919, -0.9269816, -3.110438, 0, 1, 0.4470588, 1,
-0.2603782, -0.02699672, -0.8970824, 0, 1, 0.454902, 1,
-0.2578454, 0.3976406, 1.332523, 0, 1, 0.4588235, 1,
-0.2574801, 1.646031, 0.6213937, 0, 1, 0.4666667, 1,
-0.2532158, -0.3121275, -2.64013, 0, 1, 0.4705882, 1,
-0.2492808, 1.083873, 1.618475, 0, 1, 0.4784314, 1,
-0.2484929, -0.4221874, -3.112757, 0, 1, 0.4823529, 1,
-0.2465571, -0.7049282, -2.040933, 0, 1, 0.4901961, 1,
-0.2343387, 0.6673644, -1.338446, 0, 1, 0.4941176, 1,
-0.2341146, 0.1710202, -0.126001, 0, 1, 0.5019608, 1,
-0.229719, -0.8325934, -3.137467, 0, 1, 0.509804, 1,
-0.2282084, 0.6656998, -0.4806143, 0, 1, 0.5137255, 1,
-0.2229805, 3.593134, -0.2882248, 0, 1, 0.5215687, 1,
-0.2220281, 0.3655109, -3.339817, 0, 1, 0.5254902, 1,
-0.218977, 1.678387, -0.3216181, 0, 1, 0.5333334, 1,
-0.2176855, 0.3686459, 0.7121913, 0, 1, 0.5372549, 1,
-0.2150196, 0.4773789, 0.1553806, 0, 1, 0.5450981, 1,
-0.2136909, -0.01907207, -1.045657, 0, 1, 0.5490196, 1,
-0.2119919, -1.238904, -2.170213, 0, 1, 0.5568628, 1,
-0.2113084, -0.8073018, -5.027621, 0, 1, 0.5607843, 1,
-0.2103888, -1.199681, -2.458913, 0, 1, 0.5686275, 1,
-0.2080003, -0.6068303, -2.579113, 0, 1, 0.572549, 1,
-0.2025336, 0.6963395, -1.610328, 0, 1, 0.5803922, 1,
-0.1985467, -0.2686721, -2.689388, 0, 1, 0.5843138, 1,
-0.1966278, -0.05746589, -1.559208, 0, 1, 0.5921569, 1,
-0.1936343, 1.151438, 0.2576274, 0, 1, 0.5960785, 1,
-0.1910415, -2.700086, -1.456682, 0, 1, 0.6039216, 1,
-0.1874136, -1.939084, -4.262198, 0, 1, 0.6117647, 1,
-0.1823671, 0.4165306, -0.5491934, 0, 1, 0.6156863, 1,
-0.1813558, 0.1253116, -0.6351843, 0, 1, 0.6235294, 1,
-0.1809821, 0.9678581, -0.6156633, 0, 1, 0.627451, 1,
-0.1791808, 0.2687558, 0.9334981, 0, 1, 0.6352941, 1,
-0.176997, 0.7083777, -2.804971, 0, 1, 0.6392157, 1,
-0.1746919, 0.4285811, -0.3506114, 0, 1, 0.6470588, 1,
-0.1689346, -0.9982319, -3.738695, 0, 1, 0.6509804, 1,
-0.16817, -1.201511, -2.016931, 0, 1, 0.6588235, 1,
-0.1655145, 0.1766751, 0.7724046, 0, 1, 0.6627451, 1,
-0.1634802, 2.137259, -0.7381991, 0, 1, 0.6705883, 1,
-0.1595597, 0.2088914, -0.5808787, 0, 1, 0.6745098, 1,
-0.1578808, 0.241682, -1.333542, 0, 1, 0.682353, 1,
-0.1547048, -0.9180264, -3.51758, 0, 1, 0.6862745, 1,
-0.1543149, -1.940957, -1.663113, 0, 1, 0.6941177, 1,
-0.1538812, 1.418636, -0.4684637, 0, 1, 0.7019608, 1,
-0.1519184, -0.03680487, -2.002154, 0, 1, 0.7058824, 1,
-0.1497833, -0.4254515, -3.191212, 0, 1, 0.7137255, 1,
-0.1470981, -0.500597, -2.371419, 0, 1, 0.7176471, 1,
-0.1451579, -0.5608824, -1.537593, 0, 1, 0.7254902, 1,
-0.139331, 0.5531981, -0.8824856, 0, 1, 0.7294118, 1,
-0.1372151, -0.3906316, -2.53977, 0, 1, 0.7372549, 1,
-0.1304271, -1.324529, -2.812328, 0, 1, 0.7411765, 1,
-0.1295596, -0.9244843, -2.36455, 0, 1, 0.7490196, 1,
-0.1250872, -0.3922061, -3.000466, 0, 1, 0.7529412, 1,
-0.1235401, 0.9502817, -1.655898, 0, 1, 0.7607843, 1,
-0.1204542, -0.7627661, -2.770149, 0, 1, 0.7647059, 1,
-0.1165167, 0.6577292, 0.9406658, 0, 1, 0.772549, 1,
-0.1154293, -1.433183, -3.543645, 0, 1, 0.7764706, 1,
-0.1132421, -0.7459664, -1.312375, 0, 1, 0.7843137, 1,
-0.1054317, -1.004264, -2.696882, 0, 1, 0.7882353, 1,
-0.1032478, -1.267378, -3.480186, 0, 1, 0.7960784, 1,
-0.1006306, 0.06649613, -0.4052944, 0, 1, 0.8039216, 1,
-0.09923994, 0.09260528, 0.6240478, 0, 1, 0.8078431, 1,
-0.0951236, 0.1651759, -1.920543, 0, 1, 0.8156863, 1,
-0.08855367, -1.204481, -2.633212, 0, 1, 0.8196079, 1,
-0.08816355, -0.5347749, -2.687319, 0, 1, 0.827451, 1,
-0.08474085, 1.791583, -0.2629981, 0, 1, 0.8313726, 1,
-0.08429119, 1.271953, 2.508606, 0, 1, 0.8392157, 1,
-0.0832236, -0.6857818, -1.742111, 0, 1, 0.8431373, 1,
-0.081297, 0.3725735, -2.72221, 0, 1, 0.8509804, 1,
-0.08106946, 0.1738206, -1.953127, 0, 1, 0.854902, 1,
-0.0787937, -0.9581374, -4.048937, 0, 1, 0.8627451, 1,
-0.07741842, -0.05431618, -3.092448, 0, 1, 0.8666667, 1,
-0.07417965, 0.5862061, -0.6074098, 0, 1, 0.8745098, 1,
-0.06985158, 0.265945, -0.4996671, 0, 1, 0.8784314, 1,
-0.06528259, 0.2017291, -1.210633, 0, 1, 0.8862745, 1,
-0.06365725, 0.1428365, -0.7169814, 0, 1, 0.8901961, 1,
-0.06284504, 1.369128, -2.032068, 0, 1, 0.8980392, 1,
-0.06252766, 1.143036, -0.9309722, 0, 1, 0.9058824, 1,
-0.05626917, 2.159663, 0.5117358, 0, 1, 0.9098039, 1,
-0.04741954, -0.6600828, -2.483732, 0, 1, 0.9176471, 1,
-0.04719616, -1.164377, -3.591326, 0, 1, 0.9215686, 1,
-0.04119625, 0.2407217, 0.4416565, 0, 1, 0.9294118, 1,
-0.02566125, 0.7982899, 1.456556, 0, 1, 0.9333333, 1,
-0.02352156, -0.4961039, -4.150403, 0, 1, 0.9411765, 1,
-0.02301136, 0.4740419, -1.882563, 0, 1, 0.945098, 1,
-0.02276295, 0.7456292, -0.8127126, 0, 1, 0.9529412, 1,
-0.02111324, -0.1541297, -2.909968, 0, 1, 0.9568627, 1,
-0.01969378, 0.5404557, -0.800403, 0, 1, 0.9647059, 1,
-0.0192515, -0.3639909, -3.779771, 0, 1, 0.9686275, 1,
-0.01702985, -2.14221, -2.798733, 0, 1, 0.9764706, 1,
-0.01469296, -1.147119, -2.412526, 0, 1, 0.9803922, 1,
-0.01416495, 1.85855, 0.7231765, 0, 1, 0.9882353, 1,
-0.01097143, 0.410413, -0.7144865, 0, 1, 0.9921569, 1,
-0.00501351, 1.741371, 0.2006562, 0, 1, 1, 1,
-0.0007200984, -1.120121, -2.306289, 0, 0.9921569, 1, 1,
0.002614394, -1.522071, 3.365504, 0, 0.9882353, 1, 1,
0.003666214, 1.64694, -1.222134, 0, 0.9803922, 1, 1,
0.006962434, 0.6461131, -0.345431, 0, 0.9764706, 1, 1,
0.007621008, 0.3348871, 0.01917901, 0, 0.9686275, 1, 1,
0.01422835, 0.5916947, 0.6206329, 0, 0.9647059, 1, 1,
0.01540421, -1.373667, 2.592406, 0, 0.9568627, 1, 1,
0.01652585, -0.2278672, 3.797044, 0, 0.9529412, 1, 1,
0.021196, 0.5858089, 0.03740499, 0, 0.945098, 1, 1,
0.02212735, 0.3449733, 0.2481845, 0, 0.9411765, 1, 1,
0.02332375, -0.7859728, 2.385817, 0, 0.9333333, 1, 1,
0.0263288, 1.305502, 0.2513887, 0, 0.9294118, 1, 1,
0.03083372, -0.6395749, 3.778322, 0, 0.9215686, 1, 1,
0.03182046, -0.207166, 1.930916, 0, 0.9176471, 1, 1,
0.03350668, -0.1282993, 2.647204, 0, 0.9098039, 1, 1,
0.03535821, 0.8944633, 1.353794, 0, 0.9058824, 1, 1,
0.03537472, 0.1448102, -0.7187379, 0, 0.8980392, 1, 1,
0.03833768, -0.2677541, 4.017434, 0, 0.8901961, 1, 1,
0.04130717, -0.05195324, 2.327461, 0, 0.8862745, 1, 1,
0.0428328, -0.4586156, 3.76003, 0, 0.8784314, 1, 1,
0.04335185, 0.2012291, -1.398832, 0, 0.8745098, 1, 1,
0.04689703, -0.07168373, 2.971575, 0, 0.8666667, 1, 1,
0.04760098, -0.6654021, 3.629076, 0, 0.8627451, 1, 1,
0.04954302, -0.69718, 2.311365, 0, 0.854902, 1, 1,
0.05323398, 2.306168, 1.335658, 0, 0.8509804, 1, 1,
0.054355, -0.2539336, 2.399226, 0, 0.8431373, 1, 1,
0.05679587, -0.7523674, 1.268848, 0, 0.8392157, 1, 1,
0.05798531, 0.487513, 0.112562, 0, 0.8313726, 1, 1,
0.05865669, 0.493898, 1.167678, 0, 0.827451, 1, 1,
0.06379533, 0.3434647, -2.35652, 0, 0.8196079, 1, 1,
0.06450712, 1.503877, -1.057137, 0, 0.8156863, 1, 1,
0.07107337, -0.03651834, 3.204575, 0, 0.8078431, 1, 1,
0.07468019, 0.2265438, 1.339709, 0, 0.8039216, 1, 1,
0.07581108, -0.4740499, 3.509649, 0, 0.7960784, 1, 1,
0.07802275, -1.105922, 3.709247, 0, 0.7882353, 1, 1,
0.08249675, -0.129109, 4.150884, 0, 0.7843137, 1, 1,
0.08257212, 0.3661924, 0.8522907, 0, 0.7764706, 1, 1,
0.08408621, 0.5066018, 0.4122432, 0, 0.772549, 1, 1,
0.08465482, -0.3797387, 3.316965, 0, 0.7647059, 1, 1,
0.08537537, 0.2535455, 2.122966, 0, 0.7607843, 1, 1,
0.08801801, -0.6754983, 1.350488, 0, 0.7529412, 1, 1,
0.09073561, 0.2256528, 1.170446, 0, 0.7490196, 1, 1,
0.1056865, -0.7204974, 2.267286, 0, 0.7411765, 1, 1,
0.1094818, 0.7641037, 0.4571781, 0, 0.7372549, 1, 1,
0.110615, 1.282274, -0.4515098, 0, 0.7294118, 1, 1,
0.1164964, -0.1410995, 3.850853, 0, 0.7254902, 1, 1,
0.1165651, -0.8299858, 0.8073688, 0, 0.7176471, 1, 1,
0.1165688, 0.6049722, 0.8475477, 0, 0.7137255, 1, 1,
0.1167946, 0.8965914, 1.969835, 0, 0.7058824, 1, 1,
0.1182309, -0.2772, 3.895328, 0, 0.6980392, 1, 1,
0.1203558, -0.2984856, 2.066529, 0, 0.6941177, 1, 1,
0.1224136, -0.4329043, 1.871304, 0, 0.6862745, 1, 1,
0.1226594, -0.1723967, 2.635662, 0, 0.682353, 1, 1,
0.124763, 1.213496, -0.549209, 0, 0.6745098, 1, 1,
0.1250371, 1.287814, 2.58179, 0, 0.6705883, 1, 1,
0.1252151, 0.1916884, 1.461499, 0, 0.6627451, 1, 1,
0.1284806, 0.3260403, 0.05319721, 0, 0.6588235, 1, 1,
0.1295794, 1.615846, -0.1695357, 0, 0.6509804, 1, 1,
0.1311839, -1.248581, 2.61434, 0, 0.6470588, 1, 1,
0.1330882, 0.5020859, -0.1634569, 0, 0.6392157, 1, 1,
0.1362951, 1.399026, 1.255894, 0, 0.6352941, 1, 1,
0.1366199, 0.8581039, 1.446476, 0, 0.627451, 1, 1,
0.1371972, 0.2952576, 0.9782965, 0, 0.6235294, 1, 1,
0.1407274, 1.630576, -0.9515772, 0, 0.6156863, 1, 1,
0.1445795, -0.9366402, 2.847286, 0, 0.6117647, 1, 1,
0.1452814, -0.02147244, 2.123593, 0, 0.6039216, 1, 1,
0.1454349, -0.2043803, 3.177551, 0, 0.5960785, 1, 1,
0.1473587, 1.30552, -1.350098, 0, 0.5921569, 1, 1,
0.1479226, -0.9969571, 1.645959, 0, 0.5843138, 1, 1,
0.151536, -1.112069, 3.797455, 0, 0.5803922, 1, 1,
0.1536898, -0.6666221, 3.482625, 0, 0.572549, 1, 1,
0.1538686, -0.9922655, 3.808192, 0, 0.5686275, 1, 1,
0.1608097, 0.7365218, 0.899959, 0, 0.5607843, 1, 1,
0.1652071, 1.073093, 1.343389, 0, 0.5568628, 1, 1,
0.1685646, -0.7160773, 3.276011, 0, 0.5490196, 1, 1,
0.169972, -2.149627, 4.380123, 0, 0.5450981, 1, 1,
0.1728216, 0.04431463, 1.312079, 0, 0.5372549, 1, 1,
0.175691, -0.08895277, 1.969022, 0, 0.5333334, 1, 1,
0.1765549, 0.5036396, 0.4906901, 0, 0.5254902, 1, 1,
0.1791907, -0.1324306, 1.577332, 0, 0.5215687, 1, 1,
0.1837304, -0.5019532, 0.9933444, 0, 0.5137255, 1, 1,
0.1871317, 0.3421428, 0.7618262, 0, 0.509804, 1, 1,
0.1877326, -0.6979225, 1.921109, 0, 0.5019608, 1, 1,
0.1960582, 2.041644, -0.4956861, 0, 0.4941176, 1, 1,
0.1963181, -0.5306515, 1.919863, 0, 0.4901961, 1, 1,
0.1973205, 2.16087, -1.256376, 0, 0.4823529, 1, 1,
0.2000108, -0.08287856, 2.205859, 0, 0.4784314, 1, 1,
0.2065695, 0.308671, -0.8954912, 0, 0.4705882, 1, 1,
0.2070544, -0.005935471, 4.284599, 0, 0.4666667, 1, 1,
0.2143395, 0.09490631, -1.668208, 0, 0.4588235, 1, 1,
0.2173291, 0.4419316, -0.08451457, 0, 0.454902, 1, 1,
0.219052, 0.2301029, 2.171622, 0, 0.4470588, 1, 1,
0.2197363, 0.1696282, -0.5801521, 0, 0.4431373, 1, 1,
0.2228986, 1.191922, 0.01540038, 0, 0.4352941, 1, 1,
0.2238406, 0.6460146, 0.2742819, 0, 0.4313726, 1, 1,
0.2246355, 1.400062, -0.01600921, 0, 0.4235294, 1, 1,
0.2257952, -1.258422, 4.153596, 0, 0.4196078, 1, 1,
0.2316411, -0.725156, 3.937631, 0, 0.4117647, 1, 1,
0.2361194, 0.4619641, -1.394398, 0, 0.4078431, 1, 1,
0.2367397, -1.010547, 2.21237, 0, 0.4, 1, 1,
0.2429317, 0.3817095, 1.154034, 0, 0.3921569, 1, 1,
0.2491847, -0.978774, 3.379773, 0, 0.3882353, 1, 1,
0.2491954, -0.3742312, 3.178377, 0, 0.3803922, 1, 1,
0.2526214, -0.9665703, 4.2381, 0, 0.3764706, 1, 1,
0.2568244, -0.08852144, 2.115584, 0, 0.3686275, 1, 1,
0.2575818, 0.2957699, 1.075192, 0, 0.3647059, 1, 1,
0.259819, -0.2090098, 3.682765, 0, 0.3568628, 1, 1,
0.260416, 0.8182866, 0.5486385, 0, 0.3529412, 1, 1,
0.2621768, 0.3478296, -0.6456887, 0, 0.345098, 1, 1,
0.269214, -0.2222734, 3.863704, 0, 0.3411765, 1, 1,
0.2706202, -0.2018789, 4.848367, 0, 0.3333333, 1, 1,
0.2743417, 1.964043, 1.047384, 0, 0.3294118, 1, 1,
0.2776175, -2.287536, 3.182631, 0, 0.3215686, 1, 1,
0.2815357, -0.7080696, 3.048807, 0, 0.3176471, 1, 1,
0.2821373, 0.5671338, 0.004563724, 0, 0.3098039, 1, 1,
0.2855524, -0.8372899, 1.130297, 0, 0.3058824, 1, 1,
0.2893086, -0.3427254, 0.9501901, 0, 0.2980392, 1, 1,
0.2931721, 0.967185, 0.2891056, 0, 0.2901961, 1, 1,
0.2977975, 0.5594852, -0.4000185, 0, 0.2862745, 1, 1,
0.2981334, -1.517277, 1.834453, 0, 0.2784314, 1, 1,
0.3015805, -0.8185349, 3.150645, 0, 0.2745098, 1, 1,
0.3035356, -1.298995, 1.964982, 0, 0.2666667, 1, 1,
0.3042152, 0.2257888, -1.107666, 0, 0.2627451, 1, 1,
0.305449, -1.264373, 4.061969, 0, 0.254902, 1, 1,
0.3079862, 1.097496, 0.4197233, 0, 0.2509804, 1, 1,
0.3133903, 0.6649942, 0.5917835, 0, 0.2431373, 1, 1,
0.3155481, -0.01422236, -0.3126754, 0, 0.2392157, 1, 1,
0.3172221, -0.5477184, 3.09696, 0, 0.2313726, 1, 1,
0.3204257, -0.9668019, 4.46784, 0, 0.227451, 1, 1,
0.3217182, 1.356619, 1.317184, 0, 0.2196078, 1, 1,
0.3244795, -0.7922393, 1.153002, 0, 0.2156863, 1, 1,
0.3299861, 0.7703724, 1.706078, 0, 0.2078431, 1, 1,
0.3322219, 0.9631605, 0.6841675, 0, 0.2039216, 1, 1,
0.3341061, -1.13169, 1.512319, 0, 0.1960784, 1, 1,
0.3347309, -0.7868433, 2.902388, 0, 0.1882353, 1, 1,
0.3370833, 0.6317669, 1.52409, 0, 0.1843137, 1, 1,
0.3400564, -0.8749275, 0.9683785, 0, 0.1764706, 1, 1,
0.3448753, -1.549703, 2.144676, 0, 0.172549, 1, 1,
0.346416, -1.380714, 2.319048, 0, 0.1647059, 1, 1,
0.3540305, 0.2794305, 1.643363, 0, 0.1607843, 1, 1,
0.3553203, 1.262218, 1.025738, 0, 0.1529412, 1, 1,
0.3572753, -0.3110325, 1.45239, 0, 0.1490196, 1, 1,
0.3578, -1.737467, 1.472681, 0, 0.1411765, 1, 1,
0.3607834, -0.6054006, 0.9857278, 0, 0.1372549, 1, 1,
0.3616679, -0.543286, 2.643799, 0, 0.1294118, 1, 1,
0.3641615, 0.3291019, 1.557606, 0, 0.1254902, 1, 1,
0.3651154, 1.758775, 0.4229683, 0, 0.1176471, 1, 1,
0.3680099, -0.3858199, 2.078986, 0, 0.1137255, 1, 1,
0.3709416, -0.555916, 1.523468, 0, 0.1058824, 1, 1,
0.3721704, -0.7129901, 1.713652, 0, 0.09803922, 1, 1,
0.3734877, -1.011639, 3.183232, 0, 0.09411765, 1, 1,
0.3766442, -0.3902971, 0.7350048, 0, 0.08627451, 1, 1,
0.3766994, 0.2153855, 1.143559, 0, 0.08235294, 1, 1,
0.3767228, 0.2312674, 1.971635, 0, 0.07450981, 1, 1,
0.3789605, 0.7905753, 1.172959, 0, 0.07058824, 1, 1,
0.3820373, -0.4302013, 2.042681, 0, 0.0627451, 1, 1,
0.3838283, 0.2276958, 2.243848, 0, 0.05882353, 1, 1,
0.385558, 1.016661, 0.1673398, 0, 0.05098039, 1, 1,
0.3865745, 1.494904, 2.137311, 0, 0.04705882, 1, 1,
0.3867557, 0.04965075, 1.027066, 0, 0.03921569, 1, 1,
0.3887652, -1.017474, 3.401362, 0, 0.03529412, 1, 1,
0.3901818, 0.4627186, 1.899629, 0, 0.02745098, 1, 1,
0.3903509, 0.3352347, 0.142204, 0, 0.02352941, 1, 1,
0.3978919, 0.4221014, -0.7899432, 0, 0.01568628, 1, 1,
0.3982148, -1.273944, 2.408499, 0, 0.01176471, 1, 1,
0.4007332, 0.1471623, 0.701103, 0, 0.003921569, 1, 1,
0.400799, -2.22109, 1.918875, 0.003921569, 0, 1, 1,
0.4008068, -0.8357902, 4.468299, 0.007843138, 0, 1, 1,
0.4008292, -0.7904505, 4.283653, 0.01568628, 0, 1, 1,
0.4022021, -0.7618748, 2.831117, 0.01960784, 0, 1, 1,
0.4034984, -0.08795037, 2.716396, 0.02745098, 0, 1, 1,
0.4098404, 0.8570325, -0.3311349, 0.03137255, 0, 1, 1,
0.4127173, 1.018372, -0.484923, 0.03921569, 0, 1, 1,
0.4159872, -1.421451, 4.076232, 0.04313726, 0, 1, 1,
0.416568, -0.4780738, 0.9424586, 0.05098039, 0, 1, 1,
0.4186843, 0.8865775, -0.02542987, 0.05490196, 0, 1, 1,
0.4336753, 1.503655, 0.7534798, 0.0627451, 0, 1, 1,
0.4420546, 2.468244, 1.342772, 0.06666667, 0, 1, 1,
0.442167, -0.957651, 1.669834, 0.07450981, 0, 1, 1,
0.4424185, 0.5700552, 0.2912608, 0.07843138, 0, 1, 1,
0.4426007, -0.7836238, 3.914229, 0.08627451, 0, 1, 1,
0.444241, -0.8278531, 3.822703, 0.09019608, 0, 1, 1,
0.4457289, -0.2843826, 2.330339, 0.09803922, 0, 1, 1,
0.4468353, 0.7110692, 0.5738392, 0.1058824, 0, 1, 1,
0.4478304, -0.2369219, 1.08328, 0.1098039, 0, 1, 1,
0.4478857, -0.01628996, 2.249039, 0.1176471, 0, 1, 1,
0.4536596, 0.22842, 1.166123, 0.1215686, 0, 1, 1,
0.4542663, -0.8078842, 2.817527, 0.1294118, 0, 1, 1,
0.4593735, 0.8202282, 0.6155534, 0.1333333, 0, 1, 1,
0.4600936, -0.5896557, 3.126326, 0.1411765, 0, 1, 1,
0.4602704, -1.443219, 2.304913, 0.145098, 0, 1, 1,
0.4640234, -0.06685548, 1.086745, 0.1529412, 0, 1, 1,
0.464858, 0.4907671, 2.31873, 0.1568628, 0, 1, 1,
0.4686454, -0.3846969, 3.408832, 0.1647059, 0, 1, 1,
0.4691434, 0.9480569, 1.504881, 0.1686275, 0, 1, 1,
0.4712619, 1.285355, 2.227304, 0.1764706, 0, 1, 1,
0.4724723, -0.4998181, 1.250866, 0.1803922, 0, 1, 1,
0.4895578, 0.5774989, 0.264655, 0.1882353, 0, 1, 1,
0.4954693, -0.8964856, 3.589558, 0.1921569, 0, 1, 1,
0.4986029, 0.8658847, 0.63271, 0.2, 0, 1, 1,
0.4988733, -0.4815734, 1.145549, 0.2078431, 0, 1, 1,
0.5022803, -1.310297, 3.327066, 0.2117647, 0, 1, 1,
0.5053817, 0.8731731, -0.9972141, 0.2196078, 0, 1, 1,
0.5108933, 0.7619821, 1.589125, 0.2235294, 0, 1, 1,
0.5206727, -0.471435, 1.029908, 0.2313726, 0, 1, 1,
0.5230396, -1.30128, 4.429584, 0.2352941, 0, 1, 1,
0.5234433, 0.8631918, 1.277253, 0.2431373, 0, 1, 1,
0.5294818, -2.439138, 3.883601, 0.2470588, 0, 1, 1,
0.5333114, -1.500801, 4.271728, 0.254902, 0, 1, 1,
0.5334263, -0.3328567, 2.539675, 0.2588235, 0, 1, 1,
0.5352089, 0.630304, 2.565616, 0.2666667, 0, 1, 1,
0.5357993, -0.9208329, 0.9351794, 0.2705882, 0, 1, 1,
0.53887, -0.2183032, 0.4645612, 0.2784314, 0, 1, 1,
0.5395342, -1.914852, 1.73009, 0.282353, 0, 1, 1,
0.5414605, 0.8379091, -0.2604839, 0.2901961, 0, 1, 1,
0.5435004, 0.7366135, 0.5434912, 0.2941177, 0, 1, 1,
0.5444617, 0.1277772, 0.1599952, 0.3019608, 0, 1, 1,
0.5505503, -1.527435, 2.730347, 0.3098039, 0, 1, 1,
0.5586482, -0.6833896, 0.8231949, 0.3137255, 0, 1, 1,
0.5616744, 0.6799336, 1.406262, 0.3215686, 0, 1, 1,
0.5626705, 1.242183, 1.570347, 0.3254902, 0, 1, 1,
0.56521, 1.554439, 0.500973, 0.3333333, 0, 1, 1,
0.566096, -0.1409033, 0.8730767, 0.3372549, 0, 1, 1,
0.5667307, 0.6244035, 0.410571, 0.345098, 0, 1, 1,
0.5682986, 1.172092, -0.8801078, 0.3490196, 0, 1, 1,
0.5737524, 2.631946, -1.381364, 0.3568628, 0, 1, 1,
0.5747522, -0.4555603, 3.150132, 0.3607843, 0, 1, 1,
0.5753937, -0.4658864, 1.535005, 0.3686275, 0, 1, 1,
0.5795661, -1.37963, 2.941687, 0.372549, 0, 1, 1,
0.5823976, -0.4741004, 2.651437, 0.3803922, 0, 1, 1,
0.582584, 0.2545276, 3.458728, 0.3843137, 0, 1, 1,
0.5833524, -0.3093922, 1.726633, 0.3921569, 0, 1, 1,
0.585461, -0.2138004, 2.761889, 0.3960784, 0, 1, 1,
0.5913591, -0.4708308, 3.117629, 0.4039216, 0, 1, 1,
0.5916678, 0.2324324, 2.17932, 0.4117647, 0, 1, 1,
0.5951412, 0.7641641, 0.857017, 0.4156863, 0, 1, 1,
0.6050216, -0.229734, 2.38346, 0.4235294, 0, 1, 1,
0.6068803, 0.5756739, -0.001275183, 0.427451, 0, 1, 1,
0.6085119, -0.02891238, 1.853498, 0.4352941, 0, 1, 1,
0.6177652, -0.08140284, 0.6082463, 0.4392157, 0, 1, 1,
0.6210873, -0.8819647, 0.5524776, 0.4470588, 0, 1, 1,
0.6220139, 0.4443993, 0.0684666, 0.4509804, 0, 1, 1,
0.6245836, 0.1524995, 0.4572015, 0.4588235, 0, 1, 1,
0.6249303, -0.8813766, 1.992421, 0.4627451, 0, 1, 1,
0.6262673, 0.3938441, -0.7943622, 0.4705882, 0, 1, 1,
0.6277627, 0.07105336, 2.02013, 0.4745098, 0, 1, 1,
0.6310782, 0.7152525, 0.1608286, 0.4823529, 0, 1, 1,
0.6319475, -0.4722621, 0.9705402, 0.4862745, 0, 1, 1,
0.6345333, 1.378085, -0.9113997, 0.4941176, 0, 1, 1,
0.6358077, -1.581077, 2.321864, 0.5019608, 0, 1, 1,
0.6369187, 0.02830379, 1.62282, 0.5058824, 0, 1, 1,
0.6410586, -0.5177096, 1.751048, 0.5137255, 0, 1, 1,
0.6414421, 0.6040376, -1.262184, 0.5176471, 0, 1, 1,
0.6466128, 0.2639869, 0.9115933, 0.5254902, 0, 1, 1,
0.6485567, -0.1464085, 2.962394, 0.5294118, 0, 1, 1,
0.6510874, -0.2505768, 1.648529, 0.5372549, 0, 1, 1,
0.6513978, 0.05442562, 1.505365, 0.5411765, 0, 1, 1,
0.6523328, 1.77882, -0.2871317, 0.5490196, 0, 1, 1,
0.6558773, -0.4967261, 2.379671, 0.5529412, 0, 1, 1,
0.6628836, 0.8950833, -0.940645, 0.5607843, 0, 1, 1,
0.6634012, -1.616357, 3.377664, 0.5647059, 0, 1, 1,
0.6647075, -0.6449277, 3.929758, 0.572549, 0, 1, 1,
0.6754894, 0.8958141, -0.08257183, 0.5764706, 0, 1, 1,
0.676627, 0.22763, 1.929564, 0.5843138, 0, 1, 1,
0.681024, -0.7107266, 3.804371, 0.5882353, 0, 1, 1,
0.6812228, -2.334685, 3.021761, 0.5960785, 0, 1, 1,
0.6838318, -1.291926, 2.550344, 0.6039216, 0, 1, 1,
0.6961694, -0.4044633, 1.934535, 0.6078432, 0, 1, 1,
0.6994394, 0.6105834, 1.93646, 0.6156863, 0, 1, 1,
0.7048461, 0.03147822, 2.842423, 0.6196079, 0, 1, 1,
0.7156216, 0.01162827, 2.181589, 0.627451, 0, 1, 1,
0.71627, -1.537291, 2.698013, 0.6313726, 0, 1, 1,
0.7175309, 1.143373, -0.3815723, 0.6392157, 0, 1, 1,
0.7243579, 0.2084592, 1.43574, 0.6431373, 0, 1, 1,
0.7289475, -1.226388, 1.782808, 0.6509804, 0, 1, 1,
0.7307081, -0.09658496, 2.529334, 0.654902, 0, 1, 1,
0.7320101, 0.4492513, 0.9933599, 0.6627451, 0, 1, 1,
0.7324056, 0.04833949, 1.201311, 0.6666667, 0, 1, 1,
0.7372582, 0.487886, 0.9435331, 0.6745098, 0, 1, 1,
0.74151, 0.4880978, 0.3771226, 0.6784314, 0, 1, 1,
0.7418994, 2.145317, -0.5970641, 0.6862745, 0, 1, 1,
0.7525759, -0.5781847, 3.317641, 0.6901961, 0, 1, 1,
0.7560267, 0.1742701, 2.83126, 0.6980392, 0, 1, 1,
0.7561382, -1.614981, 2.048776, 0.7058824, 0, 1, 1,
0.757426, -0.5504988, 1.710032, 0.7098039, 0, 1, 1,
0.762989, -0.1069488, 1.141785, 0.7176471, 0, 1, 1,
0.7650905, 0.1390292, 2.558968, 0.7215686, 0, 1, 1,
0.7682519, -0.5297322, 1.973739, 0.7294118, 0, 1, 1,
0.7743593, -0.8108343, 2.43225, 0.7333333, 0, 1, 1,
0.7789431, 1.160697, -0.3818933, 0.7411765, 0, 1, 1,
0.7807524, -1.005297, 2.441458, 0.7450981, 0, 1, 1,
0.7823331, -0.5097174, 2.036416, 0.7529412, 0, 1, 1,
0.7827814, 1.944079, -0.612419, 0.7568628, 0, 1, 1,
0.7896596, 0.7766406, 1.425512, 0.7647059, 0, 1, 1,
0.7912067, -1.019307, 0.4559385, 0.7686275, 0, 1, 1,
0.7930136, 0.1292843, 0.6037027, 0.7764706, 0, 1, 1,
0.80115, -1.645207, 2.191579, 0.7803922, 0, 1, 1,
0.8018204, 1.729004, 0.5039564, 0.7882353, 0, 1, 1,
0.8060578, 0.436872, 1.4858, 0.7921569, 0, 1, 1,
0.81162, -0.4704375, 2.047854, 0.8, 0, 1, 1,
0.8177004, -2.180473, 2.115078, 0.8078431, 0, 1, 1,
0.8194056, 0.7186052, -0.190371, 0.8117647, 0, 1, 1,
0.8198392, 1.39653, 0.1531754, 0.8196079, 0, 1, 1,
0.8223982, -0.4591831, 1.671665, 0.8235294, 0, 1, 1,
0.82631, 1.404881, -1.471915, 0.8313726, 0, 1, 1,
0.8310025, -0.685518, 2.263025, 0.8352941, 0, 1, 1,
0.8379146, 1.08581, 0.9596558, 0.8431373, 0, 1, 1,
0.8394265, 0.05730974, 1.706791, 0.8470588, 0, 1, 1,
0.8436189, -1.082984, 3.734776, 0.854902, 0, 1, 1,
0.8438309, -0.1332714, 1.197718, 0.8588235, 0, 1, 1,
0.8470035, 1.206927, 0.9931983, 0.8666667, 0, 1, 1,
0.8479977, 1.907432, -0.307159, 0.8705882, 0, 1, 1,
0.8556901, 1.296937, 0.2298762, 0.8784314, 0, 1, 1,
0.864726, 1.546085, 0.3661533, 0.8823529, 0, 1, 1,
0.8692051, -0.9827332, 3.842882, 0.8901961, 0, 1, 1,
0.8836868, -1.381419, 2.666636, 0.8941177, 0, 1, 1,
0.8837394, 0.6396212, -0.8991734, 0.9019608, 0, 1, 1,
0.8846455, -0.9402178, 1.279998, 0.9098039, 0, 1, 1,
0.8856989, -0.05772379, -1.030085, 0.9137255, 0, 1, 1,
0.8858286, -0.2009564, 0.7394095, 0.9215686, 0, 1, 1,
0.8894426, -0.02932994, 2.081498, 0.9254902, 0, 1, 1,
0.904118, 0.5844195, 2.03058, 0.9333333, 0, 1, 1,
0.9180192, 1.470564, -1.504206, 0.9372549, 0, 1, 1,
0.919414, 0.7799767, 0.2254591, 0.945098, 0, 1, 1,
0.9216616, -0.3377329, 1.713969, 0.9490196, 0, 1, 1,
0.9225945, -1.421841, 3.238367, 0.9568627, 0, 1, 1,
0.94011, 1.338538, 0.06990356, 0.9607843, 0, 1, 1,
0.9409179, 0.5724197, 0.6871502, 0.9686275, 0, 1, 1,
0.9411825, 1.316441, 0.4535638, 0.972549, 0, 1, 1,
0.9466855, 0.8419781, -0.1749758, 0.9803922, 0, 1, 1,
0.9511362, 0.3569776, 0.6993926, 0.9843137, 0, 1, 1,
0.9515097, 0.05381862, 2.876226, 0.9921569, 0, 1, 1,
0.9522281, 0.01750472, 2.555832, 0.9960784, 0, 1, 1,
0.953325, -1.217064, 2.035661, 1, 0, 0.9960784, 1,
0.9597129, -0.3242346, 0.7870066, 1, 0, 0.9882353, 1,
0.9597839, -0.8983293, 2.349387, 1, 0, 0.9843137, 1,
0.9643573, 1.378203, -0.2277061, 1, 0, 0.9764706, 1,
0.9652922, -1.620728, 2.631208, 1, 0, 0.972549, 1,
0.9709511, 0.9126417, 1.133017, 1, 0, 0.9647059, 1,
0.9857759, 0.2731558, 3.43692, 1, 0, 0.9607843, 1,
0.9908753, 1.715023, 1.03569, 1, 0, 0.9529412, 1,
0.9956649, 0.4867321, 1.452079, 1, 0, 0.9490196, 1,
0.995865, 1.753925, 0.5022385, 1, 0, 0.9411765, 1,
0.9988425, 1.182737, 1.47873, 1, 0, 0.9372549, 1,
1.001418, 0.01178612, 2.817611, 1, 0, 0.9294118, 1,
1.003091, -0.01187792, 0.9568471, 1, 0, 0.9254902, 1,
1.010648, -0.02108478, 2.747747, 1, 0, 0.9176471, 1,
1.043002, 0.6473885, 1.192963, 1, 0, 0.9137255, 1,
1.046527, 2.079348, 1.774943, 1, 0, 0.9058824, 1,
1.054745, 0.3875965, 0.8522427, 1, 0, 0.9019608, 1,
1.054813, 0.07948504, 1.179751, 1, 0, 0.8941177, 1,
1.057258, 0.8879526, -1.379877, 1, 0, 0.8862745, 1,
1.070582, 0.4497292, 0.6480073, 1, 0, 0.8823529, 1,
1.082149, 0.925446, 1.405138, 1, 0, 0.8745098, 1,
1.091962, 0.9242636, 1.111269, 1, 0, 0.8705882, 1,
1.092135, 0.4245758, 0.8108244, 1, 0, 0.8627451, 1,
1.100671, 0.495055, 1.739709, 1, 0, 0.8588235, 1,
1.103296, -0.3323921, 3.062101, 1, 0, 0.8509804, 1,
1.103747, 0.8861484, 0.5779514, 1, 0, 0.8470588, 1,
1.105818, -0.08373032, 1.169064, 1, 0, 0.8392157, 1,
1.110853, 0.7805099, -0.4872131, 1, 0, 0.8352941, 1,
1.111091, 1.375402, 1.931113, 1, 0, 0.827451, 1,
1.111826, 0.3703961, 0.03823987, 1, 0, 0.8235294, 1,
1.115911, 0.8376213, 1.575133, 1, 0, 0.8156863, 1,
1.116572, -0.8702956, 0.640618, 1, 0, 0.8117647, 1,
1.121685, 1.84967, -0.5153735, 1, 0, 0.8039216, 1,
1.124781, -0.430066, 4.27283, 1, 0, 0.7960784, 1,
1.129417, 0.05558779, 0.8610684, 1, 0, 0.7921569, 1,
1.129703, 0.3630349, 0.2582465, 1, 0, 0.7843137, 1,
1.139718, 0.7499888, 2.770993, 1, 0, 0.7803922, 1,
1.145324, 1.915016, 0.1345943, 1, 0, 0.772549, 1,
1.153372, -1.064352, 1.944299, 1, 0, 0.7686275, 1,
1.158813, 1.167205, 0.9586931, 1, 0, 0.7607843, 1,
1.159506, -0.9769635, 1.595528, 1, 0, 0.7568628, 1,
1.162664, -0.194088, 1.806523, 1, 0, 0.7490196, 1,
1.167859, 2.343448, 0.05480026, 1, 0, 0.7450981, 1,
1.175084, 0.1438206, 0.7292955, 1, 0, 0.7372549, 1,
1.176436, 0.4657326, 1.915097, 1, 0, 0.7333333, 1,
1.177328, -0.08428593, 1.173828, 1, 0, 0.7254902, 1,
1.182259, -0.6928292, 3.165699, 1, 0, 0.7215686, 1,
1.191004, -0.00130746, 1.309204, 1, 0, 0.7137255, 1,
1.193078, -0.3526596, 2.232695, 1, 0, 0.7098039, 1,
1.195431, 0.1550063, 1.212065, 1, 0, 0.7019608, 1,
1.196723, 0.3631481, 1.40678, 1, 0, 0.6941177, 1,
1.208259, 0.5035022, 1.859683, 1, 0, 0.6901961, 1,
1.215726, -0.4373897, 0.2350913, 1, 0, 0.682353, 1,
1.217397, 1.121274, -0.07240482, 1, 0, 0.6784314, 1,
1.222522, 1.166271, 1.236716, 1, 0, 0.6705883, 1,
1.233178, 0.782148, 0.5647883, 1, 0, 0.6666667, 1,
1.24321, 0.02164787, 2.816171, 1, 0, 0.6588235, 1,
1.245998, 1.00284, 1.510438, 1, 0, 0.654902, 1,
1.246673, -0.8155326, 3.705061, 1, 0, 0.6470588, 1,
1.247018, -0.1996068, 0.8818217, 1, 0, 0.6431373, 1,
1.263782, -1.031528, 2.587011, 1, 0, 0.6352941, 1,
1.264651, 0.7141738, -0.1697631, 1, 0, 0.6313726, 1,
1.271279, 0.2625411, 0.7383475, 1, 0, 0.6235294, 1,
1.285323, 1.221722, 1.520692, 1, 0, 0.6196079, 1,
1.299857, -2.330943, 2.503735, 1, 0, 0.6117647, 1,
1.304318, -0.2973064, 3.637823, 1, 0, 0.6078432, 1,
1.311374, -0.05199356, 1.114956, 1, 0, 0.6, 1,
1.314371, 0.02340871, 0.9240881, 1, 0, 0.5921569, 1,
1.316202, -0.1713458, 1.937537, 1, 0, 0.5882353, 1,
1.318198, -0.5585456, 2.328291, 1, 0, 0.5803922, 1,
1.322599, -2.297315, 1.258289, 1, 0, 0.5764706, 1,
1.325262, 1.165523, 2.504407, 1, 0, 0.5686275, 1,
1.327191, 0.6899599, 0.7952549, 1, 0, 0.5647059, 1,
1.330618, 0.5369614, 0.3284341, 1, 0, 0.5568628, 1,
1.333401, 1.746292, 0.2237399, 1, 0, 0.5529412, 1,
1.348183, -0.8316123, 4.625767, 1, 0, 0.5450981, 1,
1.351521, 0.4182011, 1.620756, 1, 0, 0.5411765, 1,
1.354123, -1.102695, 2.56361, 1, 0, 0.5333334, 1,
1.355809, 0.9470786, 0.4028846, 1, 0, 0.5294118, 1,
1.369696, -1.214702, 1.251087, 1, 0, 0.5215687, 1,
1.369927, 0.1052139, 1.283676, 1, 0, 0.5176471, 1,
1.374922, 0.1482452, 3.675006, 1, 0, 0.509804, 1,
1.378937, -2.087113, 4.897948, 1, 0, 0.5058824, 1,
1.386026, -0.08363397, 2.511017, 1, 0, 0.4980392, 1,
1.391197, 0.02570994, 0.9938965, 1, 0, 0.4901961, 1,
1.393435, 0.9078185, -0.7663325, 1, 0, 0.4862745, 1,
1.414676, -0.559289, 1.300761, 1, 0, 0.4784314, 1,
1.431434, -0.5016107, 2.959558, 1, 0, 0.4745098, 1,
1.438606, 0.1352972, 0.7896163, 1, 0, 0.4666667, 1,
1.441737, 0.02669865, 1.990218, 1, 0, 0.4627451, 1,
1.452011, -0.9301341, 3.024218, 1, 0, 0.454902, 1,
1.457673, -0.2130262, 2.857348, 1, 0, 0.4509804, 1,
1.468833, 0.3848903, 0.2892911, 1, 0, 0.4431373, 1,
1.479468, -0.5632165, 0.6854022, 1, 0, 0.4392157, 1,
1.480655, 0.9216743, 0.7720093, 1, 0, 0.4313726, 1,
1.483117, 0.7936844, 1.241747, 1, 0, 0.427451, 1,
1.487618, 1.075079, 1.465816, 1, 0, 0.4196078, 1,
1.488066, 0.9332384, 2.19127, 1, 0, 0.4156863, 1,
1.503902, 0.8640522, 1.946969, 1, 0, 0.4078431, 1,
1.514273, -1.472462, 2.455644, 1, 0, 0.4039216, 1,
1.52947, -0.4220748, 2.636073, 1, 0, 0.3960784, 1,
1.534939, -0.7028189, 2.465751, 1, 0, 0.3882353, 1,
1.538675, -2.582254, 2.915198, 1, 0, 0.3843137, 1,
1.555386, 0.2177247, 1.264853, 1, 0, 0.3764706, 1,
1.567359, -0.8838612, 2.194551, 1, 0, 0.372549, 1,
1.576233, -0.1199603, 3.234906, 1, 0, 0.3647059, 1,
1.578292, -0.4372767, 0.2548981, 1, 0, 0.3607843, 1,
1.595029, -2.538395, 1.956842, 1, 0, 0.3529412, 1,
1.595452, -3.577141, 4.438231, 1, 0, 0.3490196, 1,
1.63026, -0.8907382, 1.212902, 1, 0, 0.3411765, 1,
1.637482, 2.465417, 0.5835578, 1, 0, 0.3372549, 1,
1.637919, -0.9884888, 3.394769, 1, 0, 0.3294118, 1,
1.648786, 0.5783715, 0.734888, 1, 0, 0.3254902, 1,
1.653737, 0.3020198, 1.281452, 1, 0, 0.3176471, 1,
1.661145, 1.441177, 1.519735, 1, 0, 0.3137255, 1,
1.668615, -1.228354, 4.011902, 1, 0, 0.3058824, 1,
1.677435, 1.818011, 1.763579, 1, 0, 0.2980392, 1,
1.680321, 0.3822155, 0.953507, 1, 0, 0.2941177, 1,
1.680641, 1.664385, -1.046863, 1, 0, 0.2862745, 1,
1.682523, -0.2087836, -0.3996255, 1, 0, 0.282353, 1,
1.687128, 0.904574, 1.268342, 1, 0, 0.2745098, 1,
1.687967, 0.4648113, 0.7769774, 1, 0, 0.2705882, 1,
1.699449, -1.17958, 0.9722047, 1, 0, 0.2627451, 1,
1.70163, 0.2455604, 0.3032298, 1, 0, 0.2588235, 1,
1.717295, -1.302828, 3.347111, 1, 0, 0.2509804, 1,
1.726726, 0.5789357, 1.157162, 1, 0, 0.2470588, 1,
1.764687, 0.330302, 1.790421, 1, 0, 0.2392157, 1,
1.773504, 0.2101624, 2.248094, 1, 0, 0.2352941, 1,
1.801534, 0.8456229, 1.975148, 1, 0, 0.227451, 1,
1.808133, 0.4553467, 2.991981, 1, 0, 0.2235294, 1,
1.820791, -1.645731, -0.01242109, 1, 0, 0.2156863, 1,
1.839923, -2.249202, 3.04484, 1, 0, 0.2117647, 1,
1.855427, 0.8017358, 1.372147, 1, 0, 0.2039216, 1,
1.859148, -0.3649118, 1.17955, 1, 0, 0.1960784, 1,
1.868297, -0.9771396, 2.557795, 1, 0, 0.1921569, 1,
1.878319, 2.37607, 1.897343, 1, 0, 0.1843137, 1,
1.879084, -0.9893407, 3.635794, 1, 0, 0.1803922, 1,
1.880862, -0.3715656, -0.6152591, 1, 0, 0.172549, 1,
1.889786, 0.221357, 1.779075, 1, 0, 0.1686275, 1,
1.892022, 0.3784418, 0.5226525, 1, 0, 0.1607843, 1,
1.906095, -0.9066067, 1.73321, 1, 0, 0.1568628, 1,
1.932733, 1.085658, 0.3725762, 1, 0, 0.1490196, 1,
1.95124, 0.1531244, -0.3474195, 1, 0, 0.145098, 1,
1.966964, 0.4784289, 2.569139, 1, 0, 0.1372549, 1,
1.989701, 0.3430196, 2.284149, 1, 0, 0.1333333, 1,
2.032134, -0.548432, 2.163339, 1, 0, 0.1254902, 1,
2.039014, 1.299803, 0.426267, 1, 0, 0.1215686, 1,
2.052028, 0.4938206, 2.003682, 1, 0, 0.1137255, 1,
2.16667, -1.073325, 2.512204, 1, 0, 0.1098039, 1,
2.167181, -2.03567, 2.890493, 1, 0, 0.1019608, 1,
2.217221, -1.514058, 2.21586, 1, 0, 0.09411765, 1,
2.226599, 0.4161071, 1.1047, 1, 0, 0.09019608, 1,
2.352263, -1.087452, 2.791547, 1, 0, 0.08235294, 1,
2.375454, -0.1218141, 1.268492, 1, 0, 0.07843138, 1,
2.383934, 0.6076169, 2.169788, 1, 0, 0.07058824, 1,
2.487828, -0.3057074, 1.732558, 1, 0, 0.06666667, 1,
2.502986, 0.5783802, 1.160797, 1, 0, 0.05882353, 1,
2.586285, -1.272821, 2.593008, 1, 0, 0.05490196, 1,
2.602891, -0.3447628, 0.221108, 1, 0, 0.04705882, 1,
2.637589, -0.3210374, 1.461536, 1, 0, 0.04313726, 1,
2.65505, 0.1660469, 1.725153, 1, 0, 0.03529412, 1,
2.664289, -0.6875909, 2.090818, 1, 0, 0.03137255, 1,
2.979254, 1.119141, 2.413246, 1, 0, 0.02352941, 1,
3.661857, 1.7411, 1.037882, 1, 0, 0.01960784, 1,
3.957705, 1.799973, -0.9339993, 1, 0, 0.01176471, 1,
4.113897, 2.519271, 0.3414378, 1, 0, 0.007843138, 1
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
0.1895046, -4.792502, -6.710005, 0, -0.5, 0.5, 0.5,
0.1895046, -4.792502, -6.710005, 1, -0.5, 0.5, 0.5,
0.1895046, -4.792502, -6.710005, 1, 1.5, 0.5, 0.5,
0.1895046, -4.792502, -6.710005, 0, 1.5, 0.5, 0.5
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
-5.065257, 0.007996559, -6.710005, 0, -0.5, 0.5, 0.5,
-5.065257, 0.007996559, -6.710005, 1, -0.5, 0.5, 0.5,
-5.065257, 0.007996559, -6.710005, 1, 1.5, 0.5, 0.5,
-5.065257, 0.007996559, -6.710005, 0, 1.5, 0.5, 0.5
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
-5.065257, -4.792502, -0.06483674, 0, -0.5, 0.5, 0.5,
-5.065257, -4.792502, -0.06483674, 1, -0.5, 0.5, 0.5,
-5.065257, -4.792502, -0.06483674, 1, 1.5, 0.5, 0.5,
-5.065257, -4.792502, -0.06483674, 0, 1.5, 0.5, 0.5
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
-2, -3.684695, -5.176505,
4, -3.684695, -5.176505,
-2, -3.684695, -5.176505,
-2, -3.869329, -5.432088,
0, -3.684695, -5.176505,
0, -3.869329, -5.432088,
2, -3.684695, -5.176505,
2, -3.869329, -5.432088,
4, -3.684695, -5.176505,
4, -3.869329, -5.432088
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
"2",
"4"
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
-2, -4.238598, -5.943255, 0, -0.5, 0.5, 0.5,
-2, -4.238598, -5.943255, 1, -0.5, 0.5, 0.5,
-2, -4.238598, -5.943255, 1, 1.5, 0.5, 0.5,
-2, -4.238598, -5.943255, 0, 1.5, 0.5, 0.5,
0, -4.238598, -5.943255, 0, -0.5, 0.5, 0.5,
0, -4.238598, -5.943255, 1, -0.5, 0.5, 0.5,
0, -4.238598, -5.943255, 1, 1.5, 0.5, 0.5,
0, -4.238598, -5.943255, 0, 1.5, 0.5, 0.5,
2, -4.238598, -5.943255, 0, -0.5, 0.5, 0.5,
2, -4.238598, -5.943255, 1, -0.5, 0.5, 0.5,
2, -4.238598, -5.943255, 1, 1.5, 0.5, 0.5,
2, -4.238598, -5.943255, 0, 1.5, 0.5, 0.5,
4, -4.238598, -5.943255, 0, -0.5, 0.5, 0.5,
4, -4.238598, -5.943255, 1, -0.5, 0.5, 0.5,
4, -4.238598, -5.943255, 1, 1.5, 0.5, 0.5,
4, -4.238598, -5.943255, 0, 1.5, 0.5, 0.5
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
-3.852619, -2, -5.176505,
-3.852619, 2, -5.176505,
-3.852619, -2, -5.176505,
-4.054726, -2, -5.432088,
-3.852619, 0, -5.176505,
-4.054726, 0, -5.432088,
-3.852619, 2, -5.176505,
-4.054726, 2, -5.432088
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
-4.458938, -2, -5.943255, 0, -0.5, 0.5, 0.5,
-4.458938, -2, -5.943255, 1, -0.5, 0.5, 0.5,
-4.458938, -2, -5.943255, 1, 1.5, 0.5, 0.5,
-4.458938, -2, -5.943255, 0, 1.5, 0.5, 0.5,
-4.458938, 0, -5.943255, 0, -0.5, 0.5, 0.5,
-4.458938, 0, -5.943255, 1, -0.5, 0.5, 0.5,
-4.458938, 0, -5.943255, 1, 1.5, 0.5, 0.5,
-4.458938, 0, -5.943255, 0, 1.5, 0.5, 0.5,
-4.458938, 2, -5.943255, 0, -0.5, 0.5, 0.5,
-4.458938, 2, -5.943255, 1, -0.5, 0.5, 0.5,
-4.458938, 2, -5.943255, 1, 1.5, 0.5, 0.5,
-4.458938, 2, -5.943255, 0, 1.5, 0.5, 0.5
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
-3.852619, -3.684695, -4,
-3.852619, -3.684695, 4,
-3.852619, -3.684695, -4,
-4.054726, -3.869329, -4,
-3.852619, -3.684695, -2,
-4.054726, -3.869329, -2,
-3.852619, -3.684695, 0,
-4.054726, -3.869329, 0,
-3.852619, -3.684695, 2,
-4.054726, -3.869329, 2,
-3.852619, -3.684695, 4,
-4.054726, -3.869329, 4
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
-4.458938, -4.238598, -4, 0, -0.5, 0.5, 0.5,
-4.458938, -4.238598, -4, 1, -0.5, 0.5, 0.5,
-4.458938, -4.238598, -4, 1, 1.5, 0.5, 0.5,
-4.458938, -4.238598, -4, 0, 1.5, 0.5, 0.5,
-4.458938, -4.238598, -2, 0, -0.5, 0.5, 0.5,
-4.458938, -4.238598, -2, 1, -0.5, 0.5, 0.5,
-4.458938, -4.238598, -2, 1, 1.5, 0.5, 0.5,
-4.458938, -4.238598, -2, 0, 1.5, 0.5, 0.5,
-4.458938, -4.238598, 0, 0, -0.5, 0.5, 0.5,
-4.458938, -4.238598, 0, 1, -0.5, 0.5, 0.5,
-4.458938, -4.238598, 0, 1, 1.5, 0.5, 0.5,
-4.458938, -4.238598, 0, 0, 1.5, 0.5, 0.5,
-4.458938, -4.238598, 2, 0, -0.5, 0.5, 0.5,
-4.458938, -4.238598, 2, 1, -0.5, 0.5, 0.5,
-4.458938, -4.238598, 2, 1, 1.5, 0.5, 0.5,
-4.458938, -4.238598, 2, 0, 1.5, 0.5, 0.5,
-4.458938, -4.238598, 4, 0, -0.5, 0.5, 0.5,
-4.458938, -4.238598, 4, 1, -0.5, 0.5, 0.5,
-4.458938, -4.238598, 4, 1, 1.5, 0.5, 0.5,
-4.458938, -4.238598, 4, 0, 1.5, 0.5, 0.5
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
-3.852619, -3.684695, -5.176505,
-3.852619, 3.700688, -5.176505,
-3.852619, -3.684695, 5.046831,
-3.852619, 3.700688, 5.046831,
-3.852619, -3.684695, -5.176505,
-3.852619, -3.684695, 5.046831,
-3.852619, 3.700688, -5.176505,
-3.852619, 3.700688, 5.046831,
-3.852619, -3.684695, -5.176505,
4.231628, -3.684695, -5.176505,
-3.852619, -3.684695, 5.046831,
4.231628, -3.684695, 5.046831,
-3.852619, 3.700688, -5.176505,
4.231628, 3.700688, -5.176505,
-3.852619, 3.700688, 5.046831,
4.231628, 3.700688, 5.046831,
4.231628, -3.684695, -5.176505,
4.231628, 3.700688, -5.176505,
4.231628, -3.684695, 5.046831,
4.231628, 3.700688, 5.046831,
4.231628, -3.684695, -5.176505,
4.231628, -3.684695, 5.046831,
4.231628, 3.700688, -5.176505,
4.231628, 3.700688, 5.046831
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
var radius = 7.999299;
var distance = 35.58979;
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
mvMatrix.translate( -0.1895046, -0.007996559, 0.06483674 );
mvMatrix.scale( 1.069858, 1.171097, 0.8460055 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.58979);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
fenchlorazole-ethyl<-read.table("fenchlorazole-ethyl.xyz")
```

```
## Error in read.table("fenchlorazole-ethyl.xyz"): no lines available in input
```

```r
x<-fenchlorazole-ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenchlorazole' not found
```

```r
y<-fenchlorazole-ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenchlorazole' not found
```

```r
z<-fenchlorazole-ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenchlorazole' not found
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
-3.734888, -1.354537, -1.53221, 0, 0, 1, 1, 1,
-3.427283, -0.01670148, -1.790472, 1, 0, 0, 1, 1,
-3.020869, -0.4344946, -0.5516106, 1, 0, 0, 1, 1,
-3.002142, 1.590828, -0.1178894, 1, 0, 0, 1, 1,
-2.833635, 0.7528406, -0.3918374, 1, 0, 0, 1, 1,
-2.769396, -0.08912326, -1.921795, 1, 0, 0, 1, 1,
-2.6798, 1.789333, -0.292464, 0, 0, 0, 1, 1,
-2.597166, 0.6148456, -0.6957746, 0, 0, 0, 1, 1,
-2.527183, 1.323428, -0.7539358, 0, 0, 0, 1, 1,
-2.444123, -0.12315, -1.974137, 0, 0, 0, 1, 1,
-2.42026, -1.464797, -2.554884, 0, 0, 0, 1, 1,
-2.418037, -0.04745603, -0.5850744, 0, 0, 0, 1, 1,
-2.322433, 0.983543, -1.271157, 0, 0, 0, 1, 1,
-2.298968, -2.452408, -1.733159, 1, 1, 1, 1, 1,
-2.274614, -1.789288, -2.635927, 1, 1, 1, 1, 1,
-2.174177, 0.09506968, -1.024868, 1, 1, 1, 1, 1,
-2.134382, 1.046701, -3.029579, 1, 1, 1, 1, 1,
-2.098144, -0.6840989, -4.289058, 1, 1, 1, 1, 1,
-2.094823, 0.2031974, -2.28223, 1, 1, 1, 1, 1,
-2.086629, -0.5925946, -3.139018, 1, 1, 1, 1, 1,
-2.065024, -1.613643, -4.201215, 1, 1, 1, 1, 1,
-2.063534, 1.201472, -1.504772, 1, 1, 1, 1, 1,
-2.061098, 0.2212053, -1.422067, 1, 1, 1, 1, 1,
-2.048189, -0.7399337, -1.556807, 1, 1, 1, 1, 1,
-2.032422, -0.6612012, -1.514275, 1, 1, 1, 1, 1,
-2.024997, 1.47801, -1.029671, 1, 1, 1, 1, 1,
-2.013799, 1.304338, -1.309789, 1, 1, 1, 1, 1,
-1.990576, 0.9704279, 0.2833148, 1, 1, 1, 1, 1,
-1.986859, 0.7784001, -1.160138, 0, 0, 1, 1, 1,
-1.960767, 0.1732958, -0.5193065, 1, 0, 0, 1, 1,
-1.943289, 0.5616075, -1.933276, 1, 0, 0, 1, 1,
-1.91978, 0.3760991, -1.008904, 1, 0, 0, 1, 1,
-1.889118, -0.3698947, -1.639563, 1, 0, 0, 1, 1,
-1.880344, -0.4688951, -2.711284, 1, 0, 0, 1, 1,
-1.869761, 1.012988, -1.458721, 0, 0, 0, 1, 1,
-1.861174, 1.791774, -0.8622378, 0, 0, 0, 1, 1,
-1.855488, -1.078535, -4.038097, 0, 0, 0, 1, 1,
-1.854214, 1.375473, -1.42429, 0, 0, 0, 1, 1,
-1.84947, -0.4442362, -1.501933, 0, 0, 0, 1, 1,
-1.849082, 0.4847761, -0.8802916, 0, 0, 0, 1, 1,
-1.831298, -0.1280174, -2.203635, 0, 0, 0, 1, 1,
-1.808899, 1.673818, 0.1157388, 1, 1, 1, 1, 1,
-1.808759, 1.56634, 0.5655856, 1, 1, 1, 1, 1,
-1.798221, -1.962668, 0.001311931, 1, 1, 1, 1, 1,
-1.783198, 0.06146395, -2.820498, 1, 1, 1, 1, 1,
-1.774174, 0.461763, -1.326148, 1, 1, 1, 1, 1,
-1.758324, 0.6156273, -1.425776, 1, 1, 1, 1, 1,
-1.735709, -1.011999, -2.186161, 1, 1, 1, 1, 1,
-1.732756, -0.1056284, -1.925512, 1, 1, 1, 1, 1,
-1.698427, 1.34376, -1.658458, 1, 1, 1, 1, 1,
-1.682452, 1.551253, -1.527477, 1, 1, 1, 1, 1,
-1.679095, -0.8943838, -1.057144, 1, 1, 1, 1, 1,
-1.665326, -2.407845, -3.101955, 1, 1, 1, 1, 1,
-1.659204, -0.1624192, -1.947464, 1, 1, 1, 1, 1,
-1.659074, 0.01826879, 0.4372137, 1, 1, 1, 1, 1,
-1.65216, 1.926725, -2.786004, 1, 1, 1, 1, 1,
-1.651719, -1.275945, 0.4057612, 0, 0, 1, 1, 1,
-1.643447, 0.06449002, -1.202191, 1, 0, 0, 1, 1,
-1.64221, 0.4537431, -1.727998, 1, 0, 0, 1, 1,
-1.63692, 0.06762177, -2.174751, 1, 0, 0, 1, 1,
-1.620555, 0.3731583, -2.57703, 1, 0, 0, 1, 1,
-1.615547, 0.1940113, -1.825951, 1, 0, 0, 1, 1,
-1.60964, 0.3788116, -1.222333, 0, 0, 0, 1, 1,
-1.59597, -1.974437, -3.732329, 0, 0, 0, 1, 1,
-1.585974, 0.5473123, 0.1904356, 0, 0, 0, 1, 1,
-1.585072, 0.4019865, 0.608871, 0, 0, 0, 1, 1,
-1.583263, 0.2638415, 0.1402214, 0, 0, 0, 1, 1,
-1.574379, -0.7382432, -0.9482263, 0, 0, 0, 1, 1,
-1.566982, 1.806112, 0.5392984, 0, 0, 0, 1, 1,
-1.557772, 1.532859, -1.037661, 1, 1, 1, 1, 1,
-1.55524, 1.032371, 0.1985257, 1, 1, 1, 1, 1,
-1.550036, -0.8226893, -2.646795, 1, 1, 1, 1, 1,
-1.540004, -0.8790825, -0.862492, 1, 1, 1, 1, 1,
-1.538286, -0.7163906, -1.350494, 1, 1, 1, 1, 1,
-1.535018, 0.3338951, -0.4533049, 1, 1, 1, 1, 1,
-1.533211, 0.03816474, -0.7404416, 1, 1, 1, 1, 1,
-1.529858, 0.1246178, 0.1117432, 1, 1, 1, 1, 1,
-1.525364, 0.283647, -1.938441, 1, 1, 1, 1, 1,
-1.52368, -0.6467987, 0.6290635, 1, 1, 1, 1, 1,
-1.521462, 0.6593473, -1.459356, 1, 1, 1, 1, 1,
-1.505319, 0.6089551, -0.4418124, 1, 1, 1, 1, 1,
-1.480431, 1.749063, -1.587153, 1, 1, 1, 1, 1,
-1.477547, 1.422024, -0.716897, 1, 1, 1, 1, 1,
-1.458077, 0.06612867, -1.791623, 1, 1, 1, 1, 1,
-1.448789, 0.1020188, -0.537602, 0, 0, 1, 1, 1,
-1.446199, 2.082839, 0.3251272, 1, 0, 0, 1, 1,
-1.443743, -1.315455, -3.177528, 1, 0, 0, 1, 1,
-1.420593, -2.081835, -2.309055, 1, 0, 0, 1, 1,
-1.412806, 0.8559881, -0.03405348, 1, 0, 0, 1, 1,
-1.37373, 1.303217, -0.1842032, 1, 0, 0, 1, 1,
-1.371147, -0.01964231, -2.250471, 0, 0, 0, 1, 1,
-1.342079, 0.106102, 0.5457723, 0, 0, 0, 1, 1,
-1.339071, 1.552096, -0.8807399, 0, 0, 0, 1, 1,
-1.327514, -0.6138672, -2.635511, 0, 0, 0, 1, 1,
-1.316807, -0.2897415, -0.5621517, 0, 0, 0, 1, 1,
-1.312435, 0.2863136, -0.701096, 0, 0, 0, 1, 1,
-1.310848, 1.197124, -1.666743, 0, 0, 0, 1, 1,
-1.297555, -1.404163, -1.200477, 1, 1, 1, 1, 1,
-1.289709, 0.2049431, -1.808125, 1, 1, 1, 1, 1,
-1.288627, 1.220347, 0.3973066, 1, 1, 1, 1, 1,
-1.288427, 0.6350479, -0.5171117, 1, 1, 1, 1, 1,
-1.287354, 0.7031523, 0.513094, 1, 1, 1, 1, 1,
-1.281566, -2.688748, -1.407021, 1, 1, 1, 1, 1,
-1.279432, 0.2506168, -0.6545528, 1, 1, 1, 1, 1,
-1.278721, 0.700447, -0.5094064, 1, 1, 1, 1, 1,
-1.274154, 0.9222009, -0.1186976, 1, 1, 1, 1, 1,
-1.273253, 1.81439, 0.1685092, 1, 1, 1, 1, 1,
-1.269936, 0.6108686, -2.145225, 1, 1, 1, 1, 1,
-1.26935, 1.563596, -0.5200391, 1, 1, 1, 1, 1,
-1.262567, 0.5290005, -1.929344, 1, 1, 1, 1, 1,
-1.257627, -1.305453, -1.652016, 1, 1, 1, 1, 1,
-1.247493, 1.976579, -1.127887, 1, 1, 1, 1, 1,
-1.243677, -0.3071875, -1.746942, 0, 0, 1, 1, 1,
-1.236319, -1.120295, -2.415242, 1, 0, 0, 1, 1,
-1.229509, -1.169332, -2.086153, 1, 0, 0, 1, 1,
-1.224585, -0.1781491, -0.9878647, 1, 0, 0, 1, 1,
-1.224173, 1.047581, -2.119383, 1, 0, 0, 1, 1,
-1.224012, -1.383196, -2.358068, 1, 0, 0, 1, 1,
-1.221411, 0.5457567, 0.3179274, 0, 0, 0, 1, 1,
-1.210862, 1.907353, -1.158363, 0, 0, 0, 1, 1,
-1.205212, -0.1302041, -2.713806, 0, 0, 0, 1, 1,
-1.203591, -1.346203, -2.474962, 0, 0, 0, 1, 1,
-1.193061, 0.2042815, -0.6673102, 0, 0, 0, 1, 1,
-1.190207, 0.05274833, -3.251416, 0, 0, 0, 1, 1,
-1.183207, -0.4917533, -2.03618, 0, 0, 0, 1, 1,
-1.18199, 1.032561, -1.622881, 1, 1, 1, 1, 1,
-1.176174, -0.3071694, -3.169577, 1, 1, 1, 1, 1,
-1.171455, -0.7326563, -1.958043, 1, 1, 1, 1, 1,
-1.159512, 0.4131126, -0.7165231, 1, 1, 1, 1, 1,
-1.157649, 0.861621, -1.285676, 1, 1, 1, 1, 1,
-1.141477, 0.9272035, -1.400636, 1, 1, 1, 1, 1,
-1.140804, 0.5745832, -3.203644, 1, 1, 1, 1, 1,
-1.129757, 0.8383165, 0.4887578, 1, 1, 1, 1, 1,
-1.121894, -0.0464408, 0.4119298, 1, 1, 1, 1, 1,
-1.121267, 0.8688668, -2.002043, 1, 1, 1, 1, 1,
-1.120142, 0.2818024, -1.046014, 1, 1, 1, 1, 1,
-1.118469, 0.2343073, -0.6569504, 1, 1, 1, 1, 1,
-1.117433, 1.922712, -1.491939, 1, 1, 1, 1, 1,
-1.115163, -0.7971531, -2.702855, 1, 1, 1, 1, 1,
-1.109141, -0.5463549, -2.184316, 1, 1, 1, 1, 1,
-1.102379, -1.721976, -1.890831, 0, 0, 1, 1, 1,
-1.085916, 0.3209895, -0.813625, 1, 0, 0, 1, 1,
-1.083764, -0.2071543, -0.2366176, 1, 0, 0, 1, 1,
-1.082308, 1.350444, -0.3799683, 1, 0, 0, 1, 1,
-1.071377, -0.1536351, -2.844996, 1, 0, 0, 1, 1,
-1.058993, -0.1613967, -2.323174, 1, 0, 0, 1, 1,
-1.053631, -0.09027562, -0.4391456, 0, 0, 0, 1, 1,
-1.051789, -1.025189, -1.184449, 0, 0, 0, 1, 1,
-1.049608, -0.5193453, -1.710448, 0, 0, 0, 1, 1,
-1.044891, 0.5455896, -2.175061, 0, 0, 0, 1, 1,
-1.042424, -0.2854788, -2.176355, 0, 0, 0, 1, 1,
-1.037336, 1.017584, 0.06568187, 0, 0, 0, 1, 1,
-1.0341, 1.485559, -0.2322251, 0, 0, 0, 1, 1,
-1.033886, -1.645566, -2.388117, 1, 1, 1, 1, 1,
-1.028598, -0.2169672, -0.3904724, 1, 1, 1, 1, 1,
-1.028496, 0.4427903, -2.081058, 1, 1, 1, 1, 1,
-1.025428, 0.4005936, -1.356881, 1, 1, 1, 1, 1,
-1.024023, 0.2975072, -0.9107615, 1, 1, 1, 1, 1,
-1.023515, -0.4683752, -3.092201, 1, 1, 1, 1, 1,
-1.018796, -1.817074, -0.8441744, 1, 1, 1, 1, 1,
-1.018364, 1.13649, -4.075949, 1, 1, 1, 1, 1,
-1.018339, 0.3595566, -0.2399938, 1, 1, 1, 1, 1,
-1.015022, -1.671344, -4.207473, 1, 1, 1, 1, 1,
-1.007622, 0.4810685, -1.9315, 1, 1, 1, 1, 1,
-1.003808, 0.1489997, -1.573763, 1, 1, 1, 1, 1,
-1.002962, -0.1173907, -2.222987, 1, 1, 1, 1, 1,
-0.9952103, -0.4023884, -0.4614534, 1, 1, 1, 1, 1,
-0.9948922, -2.117495, -3.621728, 1, 1, 1, 1, 1,
-0.9937264, -1.281115, -3.810106, 0, 0, 1, 1, 1,
-0.9916121, 0.3926219, -1.40545, 1, 0, 0, 1, 1,
-0.9880201, -0.8869596, -1.060779, 1, 0, 0, 1, 1,
-0.9873984, 0.278959, -0.4852407, 1, 0, 0, 1, 1,
-0.9871287, -0.09889979, -1.96983, 1, 0, 0, 1, 1,
-0.9785645, -0.4575797, -1.787619, 1, 0, 0, 1, 1,
-0.9643844, -0.7805719, -0.8736049, 0, 0, 0, 1, 1,
-0.9637361, 0.8688517, -0.990376, 0, 0, 0, 1, 1,
-0.9610473, 0.1229029, -1.900173, 0, 0, 0, 1, 1,
-0.9575616, -0.06940105, -1.923879, 0, 0, 0, 1, 1,
-0.9560115, 1.766099, 0.6639268, 0, 0, 0, 1, 1,
-0.9519829, 0.6235247, -0.5750692, 0, 0, 0, 1, 1,
-0.9445927, 0.02356039, -1.824104, 0, 0, 0, 1, 1,
-0.9432867, 1.176903, -1.185894, 1, 1, 1, 1, 1,
-0.9427803, -1.137159, -2.587852, 1, 1, 1, 1, 1,
-0.941906, -0.8185619, -1.397392, 1, 1, 1, 1, 1,
-0.9387355, -0.5826105, -2.287974, 1, 1, 1, 1, 1,
-0.932821, -1.203725, -3.022486, 1, 1, 1, 1, 1,
-0.9289005, -0.1653972, -1.318978, 1, 1, 1, 1, 1,
-0.9194267, 0.2313272, 0.4018376, 1, 1, 1, 1, 1,
-0.9132397, 0.8877118, -1.570412, 1, 1, 1, 1, 1,
-0.9116049, 0.552463, -1.350792, 1, 1, 1, 1, 1,
-0.9100189, 1.927545, -0.03835759, 1, 1, 1, 1, 1,
-0.9037979, -1.046018, -1.786465, 1, 1, 1, 1, 1,
-0.8977289, 0.6024579, -1.528403, 1, 1, 1, 1, 1,
-0.894608, -0.1993412, -0.9736755, 1, 1, 1, 1, 1,
-0.8936616, -0.6162681, -0.7494001, 1, 1, 1, 1, 1,
-0.890833, -0.9739347, -3.998761, 1, 1, 1, 1, 1,
-0.888891, 1.114733, -0.3390941, 0, 0, 1, 1, 1,
-0.8866268, 0.5912177, -1.586788, 1, 0, 0, 1, 1,
-0.8822218, 0.4378617, 1.425498, 1, 0, 0, 1, 1,
-0.8781242, 0.609379, -0.5424501, 1, 0, 0, 1, 1,
-0.8710069, 2.393298, -2.121732, 1, 0, 0, 1, 1,
-0.8703802, -1.710552, -2.337918, 1, 0, 0, 1, 1,
-0.8692397, -0.009728791, -0.8020985, 0, 0, 0, 1, 1,
-0.8674317, 0.04616883, -0.4147646, 0, 0, 0, 1, 1,
-0.8669227, 0.520228, 0.4269879, 0, 0, 0, 1, 1,
-0.8665982, 0.7149988, -2.227727, 0, 0, 0, 1, 1,
-0.8621528, 0.1113221, -0.4973259, 0, 0, 0, 1, 1,
-0.8620711, 1.578895, 0.6797004, 0, 0, 0, 1, 1,
-0.8571135, -0.1481312, -1.527837, 0, 0, 0, 1, 1,
-0.8555675, -0.6103849, -0.7796796, 1, 1, 1, 1, 1,
-0.8549013, -0.1485607, -0.8146238, 1, 1, 1, 1, 1,
-0.8517532, -0.2597036, -0.3419091, 1, 1, 1, 1, 1,
-0.8505116, -0.3449778, -2.999264, 1, 1, 1, 1, 1,
-0.8491971, -0.005246373, -0.2566681, 1, 1, 1, 1, 1,
-0.8460288, -0.378413, -2.113834, 1, 1, 1, 1, 1,
-0.8447534, 0.5952338, -1.486332, 1, 1, 1, 1, 1,
-0.8373519, 0.1245302, -0.3673748, 1, 1, 1, 1, 1,
-0.8366277, -0.5642416, -0.7414184, 1, 1, 1, 1, 1,
-0.8339511, 0.8986099, -0.7422246, 1, 1, 1, 1, 1,
-0.8332704, -0.04838971, -0.7889847, 1, 1, 1, 1, 1,
-0.8306808, -0.04259536, -1.134073, 1, 1, 1, 1, 1,
-0.826126, -1.045956, -2.367163, 1, 1, 1, 1, 1,
-0.8197283, 1.054324, -0.8403286, 1, 1, 1, 1, 1,
-0.8187437, -0.7832152, -2.780679, 1, 1, 1, 1, 1,
-0.8072595, -1.269579, -1.877944, 0, 0, 1, 1, 1,
-0.8001941, 0.2374619, -0.2062034, 1, 0, 0, 1, 1,
-0.7988529, 0.1472014, 1.153229, 1, 0, 0, 1, 1,
-0.7897481, -1.286057, -2.152299, 1, 0, 0, 1, 1,
-0.788035, -0.2622559, -2.935985, 1, 0, 0, 1, 1,
-0.7863058, 0.4822534, 0.7394427, 1, 0, 0, 1, 1,
-0.7827112, -0.7956409, -2.665792, 0, 0, 0, 1, 1,
-0.7795835, 1.003342, -0.6780952, 0, 0, 0, 1, 1,
-0.7733377, -1.400433, -2.983563, 0, 0, 0, 1, 1,
-0.7727703, -1.278047, -2.698061, 0, 0, 0, 1, 1,
-0.7704712, 0.5752707, -1.657868, 0, 0, 0, 1, 1,
-0.7692276, -0.2407783, -1.81715, 0, 0, 0, 1, 1,
-0.759883, 2.820772, 1.391034, 0, 0, 0, 1, 1,
-0.7532524, 1.67588, 0.7947723, 1, 1, 1, 1, 1,
-0.7486063, -0.4315003, -2.690036, 1, 1, 1, 1, 1,
-0.7466657, 1.903815, -0.5809271, 1, 1, 1, 1, 1,
-0.7395621, 0.4887335, 1.570737, 1, 1, 1, 1, 1,
-0.7373782, 0.05343676, -0.9622161, 1, 1, 1, 1, 1,
-0.7370318, -0.7855282, -2.077172, 1, 1, 1, 1, 1,
-0.730689, 0.1673688, -1.655715, 1, 1, 1, 1, 1,
-0.726504, 1.683111, 0.08837143, 1, 1, 1, 1, 1,
-0.7228097, 0.2268447, -2.095081, 1, 1, 1, 1, 1,
-0.7190978, 1.614266, -0.8890023, 1, 1, 1, 1, 1,
-0.7190346, -0.6152393, -2.614481, 1, 1, 1, 1, 1,
-0.7116333, -1.308233, -2.709886, 1, 1, 1, 1, 1,
-0.7110428, -0.07386576, -0.7789372, 1, 1, 1, 1, 1,
-0.6985427, -0.6276857, -1.632531, 1, 1, 1, 1, 1,
-0.6967483, 1.941984, -0.1779148, 1, 1, 1, 1, 1,
-0.6937439, -1.599491, -0.2312228, 0, 0, 1, 1, 1,
-0.6926486, 0.3023025, -1.638182, 1, 0, 0, 1, 1,
-0.6870834, -1.93175, -3.835579, 1, 0, 0, 1, 1,
-0.6842228, 0.6155707, -1.427231, 1, 0, 0, 1, 1,
-0.6819477, -0.7271895, -1.751112, 1, 0, 0, 1, 1,
-0.6795886, -1.346901, -1.969088, 1, 0, 0, 1, 1,
-0.6790571, -0.3392001, -2.116226, 0, 0, 0, 1, 1,
-0.6750295, 0.2103899, -0.4902625, 0, 0, 0, 1, 1,
-0.6739125, -0.2312503, -1.577221, 0, 0, 0, 1, 1,
-0.6702505, 0.7959401, -2.02441, 0, 0, 0, 1, 1,
-0.6679345, -0.4154407, -1.688882, 0, 0, 0, 1, 1,
-0.6655046, -0.2137562, -1.409052, 0, 0, 0, 1, 1,
-0.6603588, -0.8853511, -0.6803551, 0, 0, 0, 1, 1,
-0.6601645, 1.355332, -1.791829, 1, 1, 1, 1, 1,
-0.6592018, 0.6712669, -1.627093, 1, 1, 1, 1, 1,
-0.6578949, -1.746431, -2.290097, 1, 1, 1, 1, 1,
-0.6574553, 0.1308624, -0.695038, 1, 1, 1, 1, 1,
-0.6532183, 0.4602363, 0.06895901, 1, 1, 1, 1, 1,
-0.6530542, 1.084768, -0.7530226, 1, 1, 1, 1, 1,
-0.6516764, 0.01082921, -1.636164, 1, 1, 1, 1, 1,
-0.6509126, 1.87512, 1.019395, 1, 1, 1, 1, 1,
-0.649722, 0.137753, -2.805984, 1, 1, 1, 1, 1,
-0.6487772, 1.164308, 0.122047, 1, 1, 1, 1, 1,
-0.6477938, -0.5765957, -2.816359, 1, 1, 1, 1, 1,
-0.6473034, -0.5892941, -1.888939, 1, 1, 1, 1, 1,
-0.6468847, 0.3972794, -0.9465058, 1, 1, 1, 1, 1,
-0.6464696, 0.5031135, -2.044179, 1, 1, 1, 1, 1,
-0.6456999, -0.7321928, -3.83125, 1, 1, 1, 1, 1,
-0.6453043, 2.125962, -0.09033179, 0, 0, 1, 1, 1,
-0.6444322, 1.794826, -0.1101589, 1, 0, 0, 1, 1,
-0.6440682, -1.1449, -3.352535, 1, 0, 0, 1, 1,
-0.6406888, 0.5509892, -2.409564, 1, 0, 0, 1, 1,
-0.636562, -0.6659336, -1.432115, 1, 0, 0, 1, 1,
-0.6351653, 0.6071917, -1.468139, 1, 0, 0, 1, 1,
-0.634476, -0.7658949, -2.255525, 0, 0, 0, 1, 1,
-0.6311124, 1.615008, -1.39339, 0, 0, 0, 1, 1,
-0.6301031, 0.08833739, -0.6566958, 0, 0, 0, 1, 1,
-0.6208512, -0.7062138, -1.692271, 0, 0, 0, 1, 1,
-0.6178911, 0.05309768, -1.986441, 0, 0, 0, 1, 1,
-0.6131585, 0.7106273, -0.841957, 0, 0, 0, 1, 1,
-0.6129031, 0.8883829, -2.902682, 0, 0, 0, 1, 1,
-0.610939, -1.269267, -1.500879, 1, 1, 1, 1, 1,
-0.6069734, -0.5777473, -2.922172, 1, 1, 1, 1, 1,
-0.6050019, -0.7370225, -1.264927, 1, 1, 1, 1, 1,
-0.6039565, -0.9185041, -2.095885, 1, 1, 1, 1, 1,
-0.6031301, -0.514945, -4.225225, 1, 1, 1, 1, 1,
-0.6016423, 1.356667, -0.08597594, 1, 1, 1, 1, 1,
-0.5998685, -0.3592552, -2.903865, 1, 1, 1, 1, 1,
-0.5993805, 0.1934618, -4.171492, 1, 1, 1, 1, 1,
-0.5971007, -0.8140491, -2.069311, 1, 1, 1, 1, 1,
-0.5948418, -0.4874013, -2.620093, 1, 1, 1, 1, 1,
-0.5895693, -0.2543688, -1.524601, 1, 1, 1, 1, 1,
-0.5842182, -0.5215979, -2.752218, 1, 1, 1, 1, 1,
-0.5811991, 0.3493262, 1.702742, 1, 1, 1, 1, 1,
-0.5802348, -0.7347243, -2.529254, 1, 1, 1, 1, 1,
-0.5746943, 0.5230159, -0.6405799, 1, 1, 1, 1, 1,
-0.5678223, 0.3722293, -1.255781, 0, 0, 1, 1, 1,
-0.5595735, -1.71583, -0.9460151, 1, 0, 0, 1, 1,
-0.5583015, 0.8774841, -2.110186, 1, 0, 0, 1, 1,
-0.5578969, 1.002347, -0.6336211, 1, 0, 0, 1, 1,
-0.5578511, -1.214989, -1.853115, 1, 0, 0, 1, 1,
-0.5575129, -0.07852046, -0.8190016, 1, 0, 0, 1, 1,
-0.5531954, -0.5213501, -1.993411, 0, 0, 0, 1, 1,
-0.54733, -1.076381, -0.8623826, 0, 0, 0, 1, 1,
-0.5471935, -0.6400498, -3.277171, 0, 0, 0, 1, 1,
-0.5448713, 0.1300408, -2.049674, 0, 0, 0, 1, 1,
-0.5444707, -0.06597756, -2.241469, 0, 0, 0, 1, 1,
-0.5384724, -0.8404846, -1.592585, 0, 0, 0, 1, 1,
-0.536485, -0.4764014, -0.459311, 0, 0, 0, 1, 1,
-0.5363158, 1.356252, -0.9792387, 1, 1, 1, 1, 1,
-0.5355116, 0.3974935, -0.5116758, 1, 1, 1, 1, 1,
-0.5327932, 1.506966, -0.05291609, 1, 1, 1, 1, 1,
-0.5285866, -1.950738, -2.216557, 1, 1, 1, 1, 1,
-0.5273074, -1.06553, -2.624201, 1, 1, 1, 1, 1,
-0.5229593, -0.3737954, -2.086448, 1, 1, 1, 1, 1,
-0.5215519, 0.1859439, -2.12239, 1, 1, 1, 1, 1,
-0.5046484, -0.198711, -1.216044, 1, 1, 1, 1, 1,
-0.5016801, 0.5607191, -0.01424492, 1, 1, 1, 1, 1,
-0.5008289, -0.2777668, -2.965915, 1, 1, 1, 1, 1,
-0.4978998, 0.50395, -1.739336, 1, 1, 1, 1, 1,
-0.4955042, -0.9844093, -2.244418, 1, 1, 1, 1, 1,
-0.4953866, -0.7841686, -3.345627, 1, 1, 1, 1, 1,
-0.4945432, -0.8617265, -2.990302, 1, 1, 1, 1, 1,
-0.4930963, -0.8917499, -2.466609, 1, 1, 1, 1, 1,
-0.4925919, -0.2076451, -3.59161, 0, 0, 1, 1, 1,
-0.4855644, -1.926455, -1.16677, 1, 0, 0, 1, 1,
-0.4852152, 0.8817398, 0.05649138, 1, 0, 0, 1, 1,
-0.4845814, -0.4607832, -1.169249, 1, 0, 0, 1, 1,
-0.4845777, -0.1026158, -1.137675, 1, 0, 0, 1, 1,
-0.4780185, -0.06230083, -3.587078, 1, 0, 0, 1, 1,
-0.4704667, -0.3165292, -1.124354, 0, 0, 0, 1, 1,
-0.4692215, -0.4011934, -2.32375, 0, 0, 0, 1, 1,
-0.4687013, -1.391165, -3.25556, 0, 0, 0, 1, 1,
-0.4675195, 0.2978373, 0.7923917, 0, 0, 0, 1, 1,
-0.4646735, 1.117385, -1.186542, 0, 0, 0, 1, 1,
-0.4636579, -0.6365945, -3.799624, 0, 0, 0, 1, 1,
-0.4622122, -0.900718, -3.813305, 0, 0, 0, 1, 1,
-0.4518994, -0.7082384, -2.198619, 1, 1, 1, 1, 1,
-0.4491787, -0.02806215, -2.86607, 1, 1, 1, 1, 1,
-0.4466775, -0.2712115, -0.9514499, 1, 1, 1, 1, 1,
-0.445316, 0.2398884, -1.592227, 1, 1, 1, 1, 1,
-0.4412468, -0.4922448, -1.4285, 1, 1, 1, 1, 1,
-0.4369425, -0.1222739, -2.517176, 1, 1, 1, 1, 1,
-0.4320638, 2.139785, -0.9367504, 1, 1, 1, 1, 1,
-0.4289907, -1.512889, -3.023146, 1, 1, 1, 1, 1,
-0.4254015, -0.4381919, -4.015944, 1, 1, 1, 1, 1,
-0.423598, -1.163783, -2.507873, 1, 1, 1, 1, 1,
-0.420534, -0.4199534, -2.742676, 1, 1, 1, 1, 1,
-0.415919, -0.04090789, -0.9276589, 1, 1, 1, 1, 1,
-0.4156245, -1.318886, -3.326275, 1, 1, 1, 1, 1,
-0.4110374, -0.6498873, -1.23664, 1, 1, 1, 1, 1,
-0.4075164, 0.4768357, -1.522369, 1, 1, 1, 1, 1,
-0.4009146, 1.476272, 0.5687433, 0, 0, 1, 1, 1,
-0.3982779, 0.7030682, 0.1441767, 1, 0, 0, 1, 1,
-0.3961008, -0.4854215, -3.839003, 1, 0, 0, 1, 1,
-0.3940966, 0.5498419, -1.967106, 1, 0, 0, 1, 1,
-0.3936636, 0.254555, 0.1828784, 1, 0, 0, 1, 1,
-0.3905697, 0.8285422, 1.550092, 1, 0, 0, 1, 1,
-0.3858781, -0.2016233, -1.42253, 0, 0, 0, 1, 1,
-0.3796943, 0.4570441, -1.120008, 0, 0, 0, 1, 1,
-0.373675, 0.7629231, 0.3160626, 0, 0, 0, 1, 1,
-0.3724895, 0.2704377, -1.508241, 0, 0, 0, 1, 1,
-0.3703421, -0.2369363, -1.887067, 0, 0, 0, 1, 1,
-0.3681364, 0.5341102, 1.36055, 0, 0, 0, 1, 1,
-0.360229, -0.6917791, -2.891091, 0, 0, 0, 1, 1,
-0.3564693, 0.4193407, -0.2071354, 1, 1, 1, 1, 1,
-0.354893, -0.6558569, -2.067685, 1, 1, 1, 1, 1,
-0.3519543, 0.1488888, -2.806042, 1, 1, 1, 1, 1,
-0.3498966, 1.300865, -0.5784764, 1, 1, 1, 1, 1,
-0.3475919, -0.9403995, -3.833367, 1, 1, 1, 1, 1,
-0.3467412, 0.009211536, -1.174588, 1, 1, 1, 1, 1,
-0.3312894, -1.241685, -3.154932, 1, 1, 1, 1, 1,
-0.3293208, -0.04287959, -2.27864, 1, 1, 1, 1, 1,
-0.3257083, 0.3425013, -1.505953, 1, 1, 1, 1, 1,
-0.3248787, -0.9530398, -2.397574, 1, 1, 1, 1, 1,
-0.3240314, -0.5574984, -2.885428, 1, 1, 1, 1, 1,
-0.321439, -0.1225204, -0.8083557, 1, 1, 1, 1, 1,
-0.3160244, -0.9085497, -0.743904, 1, 1, 1, 1, 1,
-0.3142525, 0.7522406, -2.642869, 1, 1, 1, 1, 1,
-0.310416, 1.883777, -1.485018, 1, 1, 1, 1, 1,
-0.3080171, 0.6342343, -0.7763431, 0, 0, 1, 1, 1,
-0.3071747, -1.141464, -1.614451, 1, 0, 0, 1, 1,
-0.3047717, 1.42518, -1.650065, 1, 0, 0, 1, 1,
-0.3040923, 0.4862072, -0.1293681, 1, 0, 0, 1, 1,
-0.3003678, 0.5795206, -0.9302232, 1, 0, 0, 1, 1,
-0.2947791, 0.1210219, -2.165673, 1, 0, 0, 1, 1,
-0.2939848, 2.528213, -0.6659948, 0, 0, 0, 1, 1,
-0.2883367, 0.2907521, -0.8141773, 0, 0, 0, 1, 1,
-0.2870587, 1.163903, 1.081045, 0, 0, 0, 1, 1,
-0.2805499, -0.2537116, -3.743848, 0, 0, 0, 1, 1,
-0.2796523, -1.537494, -3.632087, 0, 0, 0, 1, 1,
-0.2794346, 0.4415528, -0.7593504, 0, 0, 0, 1, 1,
-0.2681197, -1.155053, -3.791031, 0, 0, 0, 1, 1,
-0.26783, 1.299608, -1.439011, 1, 1, 1, 1, 1,
-0.2658233, -0.03099182, -3.290849, 1, 1, 1, 1, 1,
-0.265164, 0.8316829, -0.6577365, 1, 1, 1, 1, 1,
-0.260919, -0.9269816, -3.110438, 1, 1, 1, 1, 1,
-0.2603782, -0.02699672, -0.8970824, 1, 1, 1, 1, 1,
-0.2578454, 0.3976406, 1.332523, 1, 1, 1, 1, 1,
-0.2574801, 1.646031, 0.6213937, 1, 1, 1, 1, 1,
-0.2532158, -0.3121275, -2.64013, 1, 1, 1, 1, 1,
-0.2492808, 1.083873, 1.618475, 1, 1, 1, 1, 1,
-0.2484929, -0.4221874, -3.112757, 1, 1, 1, 1, 1,
-0.2465571, -0.7049282, -2.040933, 1, 1, 1, 1, 1,
-0.2343387, 0.6673644, -1.338446, 1, 1, 1, 1, 1,
-0.2341146, 0.1710202, -0.126001, 1, 1, 1, 1, 1,
-0.229719, -0.8325934, -3.137467, 1, 1, 1, 1, 1,
-0.2282084, 0.6656998, -0.4806143, 1, 1, 1, 1, 1,
-0.2229805, 3.593134, -0.2882248, 0, 0, 1, 1, 1,
-0.2220281, 0.3655109, -3.339817, 1, 0, 0, 1, 1,
-0.218977, 1.678387, -0.3216181, 1, 0, 0, 1, 1,
-0.2176855, 0.3686459, 0.7121913, 1, 0, 0, 1, 1,
-0.2150196, 0.4773789, 0.1553806, 1, 0, 0, 1, 1,
-0.2136909, -0.01907207, -1.045657, 1, 0, 0, 1, 1,
-0.2119919, -1.238904, -2.170213, 0, 0, 0, 1, 1,
-0.2113084, -0.8073018, -5.027621, 0, 0, 0, 1, 1,
-0.2103888, -1.199681, -2.458913, 0, 0, 0, 1, 1,
-0.2080003, -0.6068303, -2.579113, 0, 0, 0, 1, 1,
-0.2025336, 0.6963395, -1.610328, 0, 0, 0, 1, 1,
-0.1985467, -0.2686721, -2.689388, 0, 0, 0, 1, 1,
-0.1966278, -0.05746589, -1.559208, 0, 0, 0, 1, 1,
-0.1936343, 1.151438, 0.2576274, 1, 1, 1, 1, 1,
-0.1910415, -2.700086, -1.456682, 1, 1, 1, 1, 1,
-0.1874136, -1.939084, -4.262198, 1, 1, 1, 1, 1,
-0.1823671, 0.4165306, -0.5491934, 1, 1, 1, 1, 1,
-0.1813558, 0.1253116, -0.6351843, 1, 1, 1, 1, 1,
-0.1809821, 0.9678581, -0.6156633, 1, 1, 1, 1, 1,
-0.1791808, 0.2687558, 0.9334981, 1, 1, 1, 1, 1,
-0.176997, 0.7083777, -2.804971, 1, 1, 1, 1, 1,
-0.1746919, 0.4285811, -0.3506114, 1, 1, 1, 1, 1,
-0.1689346, -0.9982319, -3.738695, 1, 1, 1, 1, 1,
-0.16817, -1.201511, -2.016931, 1, 1, 1, 1, 1,
-0.1655145, 0.1766751, 0.7724046, 1, 1, 1, 1, 1,
-0.1634802, 2.137259, -0.7381991, 1, 1, 1, 1, 1,
-0.1595597, 0.2088914, -0.5808787, 1, 1, 1, 1, 1,
-0.1578808, 0.241682, -1.333542, 1, 1, 1, 1, 1,
-0.1547048, -0.9180264, -3.51758, 0, 0, 1, 1, 1,
-0.1543149, -1.940957, -1.663113, 1, 0, 0, 1, 1,
-0.1538812, 1.418636, -0.4684637, 1, 0, 0, 1, 1,
-0.1519184, -0.03680487, -2.002154, 1, 0, 0, 1, 1,
-0.1497833, -0.4254515, -3.191212, 1, 0, 0, 1, 1,
-0.1470981, -0.500597, -2.371419, 1, 0, 0, 1, 1,
-0.1451579, -0.5608824, -1.537593, 0, 0, 0, 1, 1,
-0.139331, 0.5531981, -0.8824856, 0, 0, 0, 1, 1,
-0.1372151, -0.3906316, -2.53977, 0, 0, 0, 1, 1,
-0.1304271, -1.324529, -2.812328, 0, 0, 0, 1, 1,
-0.1295596, -0.9244843, -2.36455, 0, 0, 0, 1, 1,
-0.1250872, -0.3922061, -3.000466, 0, 0, 0, 1, 1,
-0.1235401, 0.9502817, -1.655898, 0, 0, 0, 1, 1,
-0.1204542, -0.7627661, -2.770149, 1, 1, 1, 1, 1,
-0.1165167, 0.6577292, 0.9406658, 1, 1, 1, 1, 1,
-0.1154293, -1.433183, -3.543645, 1, 1, 1, 1, 1,
-0.1132421, -0.7459664, -1.312375, 1, 1, 1, 1, 1,
-0.1054317, -1.004264, -2.696882, 1, 1, 1, 1, 1,
-0.1032478, -1.267378, -3.480186, 1, 1, 1, 1, 1,
-0.1006306, 0.06649613, -0.4052944, 1, 1, 1, 1, 1,
-0.09923994, 0.09260528, 0.6240478, 1, 1, 1, 1, 1,
-0.0951236, 0.1651759, -1.920543, 1, 1, 1, 1, 1,
-0.08855367, -1.204481, -2.633212, 1, 1, 1, 1, 1,
-0.08816355, -0.5347749, -2.687319, 1, 1, 1, 1, 1,
-0.08474085, 1.791583, -0.2629981, 1, 1, 1, 1, 1,
-0.08429119, 1.271953, 2.508606, 1, 1, 1, 1, 1,
-0.0832236, -0.6857818, -1.742111, 1, 1, 1, 1, 1,
-0.081297, 0.3725735, -2.72221, 1, 1, 1, 1, 1,
-0.08106946, 0.1738206, -1.953127, 0, 0, 1, 1, 1,
-0.0787937, -0.9581374, -4.048937, 1, 0, 0, 1, 1,
-0.07741842, -0.05431618, -3.092448, 1, 0, 0, 1, 1,
-0.07417965, 0.5862061, -0.6074098, 1, 0, 0, 1, 1,
-0.06985158, 0.265945, -0.4996671, 1, 0, 0, 1, 1,
-0.06528259, 0.2017291, -1.210633, 1, 0, 0, 1, 1,
-0.06365725, 0.1428365, -0.7169814, 0, 0, 0, 1, 1,
-0.06284504, 1.369128, -2.032068, 0, 0, 0, 1, 1,
-0.06252766, 1.143036, -0.9309722, 0, 0, 0, 1, 1,
-0.05626917, 2.159663, 0.5117358, 0, 0, 0, 1, 1,
-0.04741954, -0.6600828, -2.483732, 0, 0, 0, 1, 1,
-0.04719616, -1.164377, -3.591326, 0, 0, 0, 1, 1,
-0.04119625, 0.2407217, 0.4416565, 0, 0, 0, 1, 1,
-0.02566125, 0.7982899, 1.456556, 1, 1, 1, 1, 1,
-0.02352156, -0.4961039, -4.150403, 1, 1, 1, 1, 1,
-0.02301136, 0.4740419, -1.882563, 1, 1, 1, 1, 1,
-0.02276295, 0.7456292, -0.8127126, 1, 1, 1, 1, 1,
-0.02111324, -0.1541297, -2.909968, 1, 1, 1, 1, 1,
-0.01969378, 0.5404557, -0.800403, 1, 1, 1, 1, 1,
-0.0192515, -0.3639909, -3.779771, 1, 1, 1, 1, 1,
-0.01702985, -2.14221, -2.798733, 1, 1, 1, 1, 1,
-0.01469296, -1.147119, -2.412526, 1, 1, 1, 1, 1,
-0.01416495, 1.85855, 0.7231765, 1, 1, 1, 1, 1,
-0.01097143, 0.410413, -0.7144865, 1, 1, 1, 1, 1,
-0.00501351, 1.741371, 0.2006562, 1, 1, 1, 1, 1,
-0.0007200984, -1.120121, -2.306289, 1, 1, 1, 1, 1,
0.002614394, -1.522071, 3.365504, 1, 1, 1, 1, 1,
0.003666214, 1.64694, -1.222134, 1, 1, 1, 1, 1,
0.006962434, 0.6461131, -0.345431, 0, 0, 1, 1, 1,
0.007621008, 0.3348871, 0.01917901, 1, 0, 0, 1, 1,
0.01422835, 0.5916947, 0.6206329, 1, 0, 0, 1, 1,
0.01540421, -1.373667, 2.592406, 1, 0, 0, 1, 1,
0.01652585, -0.2278672, 3.797044, 1, 0, 0, 1, 1,
0.021196, 0.5858089, 0.03740499, 1, 0, 0, 1, 1,
0.02212735, 0.3449733, 0.2481845, 0, 0, 0, 1, 1,
0.02332375, -0.7859728, 2.385817, 0, 0, 0, 1, 1,
0.0263288, 1.305502, 0.2513887, 0, 0, 0, 1, 1,
0.03083372, -0.6395749, 3.778322, 0, 0, 0, 1, 1,
0.03182046, -0.207166, 1.930916, 0, 0, 0, 1, 1,
0.03350668, -0.1282993, 2.647204, 0, 0, 0, 1, 1,
0.03535821, 0.8944633, 1.353794, 0, 0, 0, 1, 1,
0.03537472, 0.1448102, -0.7187379, 1, 1, 1, 1, 1,
0.03833768, -0.2677541, 4.017434, 1, 1, 1, 1, 1,
0.04130717, -0.05195324, 2.327461, 1, 1, 1, 1, 1,
0.0428328, -0.4586156, 3.76003, 1, 1, 1, 1, 1,
0.04335185, 0.2012291, -1.398832, 1, 1, 1, 1, 1,
0.04689703, -0.07168373, 2.971575, 1, 1, 1, 1, 1,
0.04760098, -0.6654021, 3.629076, 1, 1, 1, 1, 1,
0.04954302, -0.69718, 2.311365, 1, 1, 1, 1, 1,
0.05323398, 2.306168, 1.335658, 1, 1, 1, 1, 1,
0.054355, -0.2539336, 2.399226, 1, 1, 1, 1, 1,
0.05679587, -0.7523674, 1.268848, 1, 1, 1, 1, 1,
0.05798531, 0.487513, 0.112562, 1, 1, 1, 1, 1,
0.05865669, 0.493898, 1.167678, 1, 1, 1, 1, 1,
0.06379533, 0.3434647, -2.35652, 1, 1, 1, 1, 1,
0.06450712, 1.503877, -1.057137, 1, 1, 1, 1, 1,
0.07107337, -0.03651834, 3.204575, 0, 0, 1, 1, 1,
0.07468019, 0.2265438, 1.339709, 1, 0, 0, 1, 1,
0.07581108, -0.4740499, 3.509649, 1, 0, 0, 1, 1,
0.07802275, -1.105922, 3.709247, 1, 0, 0, 1, 1,
0.08249675, -0.129109, 4.150884, 1, 0, 0, 1, 1,
0.08257212, 0.3661924, 0.8522907, 1, 0, 0, 1, 1,
0.08408621, 0.5066018, 0.4122432, 0, 0, 0, 1, 1,
0.08465482, -0.3797387, 3.316965, 0, 0, 0, 1, 1,
0.08537537, 0.2535455, 2.122966, 0, 0, 0, 1, 1,
0.08801801, -0.6754983, 1.350488, 0, 0, 0, 1, 1,
0.09073561, 0.2256528, 1.170446, 0, 0, 0, 1, 1,
0.1056865, -0.7204974, 2.267286, 0, 0, 0, 1, 1,
0.1094818, 0.7641037, 0.4571781, 0, 0, 0, 1, 1,
0.110615, 1.282274, -0.4515098, 1, 1, 1, 1, 1,
0.1164964, -0.1410995, 3.850853, 1, 1, 1, 1, 1,
0.1165651, -0.8299858, 0.8073688, 1, 1, 1, 1, 1,
0.1165688, 0.6049722, 0.8475477, 1, 1, 1, 1, 1,
0.1167946, 0.8965914, 1.969835, 1, 1, 1, 1, 1,
0.1182309, -0.2772, 3.895328, 1, 1, 1, 1, 1,
0.1203558, -0.2984856, 2.066529, 1, 1, 1, 1, 1,
0.1224136, -0.4329043, 1.871304, 1, 1, 1, 1, 1,
0.1226594, -0.1723967, 2.635662, 1, 1, 1, 1, 1,
0.124763, 1.213496, -0.549209, 1, 1, 1, 1, 1,
0.1250371, 1.287814, 2.58179, 1, 1, 1, 1, 1,
0.1252151, 0.1916884, 1.461499, 1, 1, 1, 1, 1,
0.1284806, 0.3260403, 0.05319721, 1, 1, 1, 1, 1,
0.1295794, 1.615846, -0.1695357, 1, 1, 1, 1, 1,
0.1311839, -1.248581, 2.61434, 1, 1, 1, 1, 1,
0.1330882, 0.5020859, -0.1634569, 0, 0, 1, 1, 1,
0.1362951, 1.399026, 1.255894, 1, 0, 0, 1, 1,
0.1366199, 0.8581039, 1.446476, 1, 0, 0, 1, 1,
0.1371972, 0.2952576, 0.9782965, 1, 0, 0, 1, 1,
0.1407274, 1.630576, -0.9515772, 1, 0, 0, 1, 1,
0.1445795, -0.9366402, 2.847286, 1, 0, 0, 1, 1,
0.1452814, -0.02147244, 2.123593, 0, 0, 0, 1, 1,
0.1454349, -0.2043803, 3.177551, 0, 0, 0, 1, 1,
0.1473587, 1.30552, -1.350098, 0, 0, 0, 1, 1,
0.1479226, -0.9969571, 1.645959, 0, 0, 0, 1, 1,
0.151536, -1.112069, 3.797455, 0, 0, 0, 1, 1,
0.1536898, -0.6666221, 3.482625, 0, 0, 0, 1, 1,
0.1538686, -0.9922655, 3.808192, 0, 0, 0, 1, 1,
0.1608097, 0.7365218, 0.899959, 1, 1, 1, 1, 1,
0.1652071, 1.073093, 1.343389, 1, 1, 1, 1, 1,
0.1685646, -0.7160773, 3.276011, 1, 1, 1, 1, 1,
0.169972, -2.149627, 4.380123, 1, 1, 1, 1, 1,
0.1728216, 0.04431463, 1.312079, 1, 1, 1, 1, 1,
0.175691, -0.08895277, 1.969022, 1, 1, 1, 1, 1,
0.1765549, 0.5036396, 0.4906901, 1, 1, 1, 1, 1,
0.1791907, -0.1324306, 1.577332, 1, 1, 1, 1, 1,
0.1837304, -0.5019532, 0.9933444, 1, 1, 1, 1, 1,
0.1871317, 0.3421428, 0.7618262, 1, 1, 1, 1, 1,
0.1877326, -0.6979225, 1.921109, 1, 1, 1, 1, 1,
0.1960582, 2.041644, -0.4956861, 1, 1, 1, 1, 1,
0.1963181, -0.5306515, 1.919863, 1, 1, 1, 1, 1,
0.1973205, 2.16087, -1.256376, 1, 1, 1, 1, 1,
0.2000108, -0.08287856, 2.205859, 1, 1, 1, 1, 1,
0.2065695, 0.308671, -0.8954912, 0, 0, 1, 1, 1,
0.2070544, -0.005935471, 4.284599, 1, 0, 0, 1, 1,
0.2143395, 0.09490631, -1.668208, 1, 0, 0, 1, 1,
0.2173291, 0.4419316, -0.08451457, 1, 0, 0, 1, 1,
0.219052, 0.2301029, 2.171622, 1, 0, 0, 1, 1,
0.2197363, 0.1696282, -0.5801521, 1, 0, 0, 1, 1,
0.2228986, 1.191922, 0.01540038, 0, 0, 0, 1, 1,
0.2238406, 0.6460146, 0.2742819, 0, 0, 0, 1, 1,
0.2246355, 1.400062, -0.01600921, 0, 0, 0, 1, 1,
0.2257952, -1.258422, 4.153596, 0, 0, 0, 1, 1,
0.2316411, -0.725156, 3.937631, 0, 0, 0, 1, 1,
0.2361194, 0.4619641, -1.394398, 0, 0, 0, 1, 1,
0.2367397, -1.010547, 2.21237, 0, 0, 0, 1, 1,
0.2429317, 0.3817095, 1.154034, 1, 1, 1, 1, 1,
0.2491847, -0.978774, 3.379773, 1, 1, 1, 1, 1,
0.2491954, -0.3742312, 3.178377, 1, 1, 1, 1, 1,
0.2526214, -0.9665703, 4.2381, 1, 1, 1, 1, 1,
0.2568244, -0.08852144, 2.115584, 1, 1, 1, 1, 1,
0.2575818, 0.2957699, 1.075192, 1, 1, 1, 1, 1,
0.259819, -0.2090098, 3.682765, 1, 1, 1, 1, 1,
0.260416, 0.8182866, 0.5486385, 1, 1, 1, 1, 1,
0.2621768, 0.3478296, -0.6456887, 1, 1, 1, 1, 1,
0.269214, -0.2222734, 3.863704, 1, 1, 1, 1, 1,
0.2706202, -0.2018789, 4.848367, 1, 1, 1, 1, 1,
0.2743417, 1.964043, 1.047384, 1, 1, 1, 1, 1,
0.2776175, -2.287536, 3.182631, 1, 1, 1, 1, 1,
0.2815357, -0.7080696, 3.048807, 1, 1, 1, 1, 1,
0.2821373, 0.5671338, 0.004563724, 1, 1, 1, 1, 1,
0.2855524, -0.8372899, 1.130297, 0, 0, 1, 1, 1,
0.2893086, -0.3427254, 0.9501901, 1, 0, 0, 1, 1,
0.2931721, 0.967185, 0.2891056, 1, 0, 0, 1, 1,
0.2977975, 0.5594852, -0.4000185, 1, 0, 0, 1, 1,
0.2981334, -1.517277, 1.834453, 1, 0, 0, 1, 1,
0.3015805, -0.8185349, 3.150645, 1, 0, 0, 1, 1,
0.3035356, -1.298995, 1.964982, 0, 0, 0, 1, 1,
0.3042152, 0.2257888, -1.107666, 0, 0, 0, 1, 1,
0.305449, -1.264373, 4.061969, 0, 0, 0, 1, 1,
0.3079862, 1.097496, 0.4197233, 0, 0, 0, 1, 1,
0.3133903, 0.6649942, 0.5917835, 0, 0, 0, 1, 1,
0.3155481, -0.01422236, -0.3126754, 0, 0, 0, 1, 1,
0.3172221, -0.5477184, 3.09696, 0, 0, 0, 1, 1,
0.3204257, -0.9668019, 4.46784, 1, 1, 1, 1, 1,
0.3217182, 1.356619, 1.317184, 1, 1, 1, 1, 1,
0.3244795, -0.7922393, 1.153002, 1, 1, 1, 1, 1,
0.3299861, 0.7703724, 1.706078, 1, 1, 1, 1, 1,
0.3322219, 0.9631605, 0.6841675, 1, 1, 1, 1, 1,
0.3341061, -1.13169, 1.512319, 1, 1, 1, 1, 1,
0.3347309, -0.7868433, 2.902388, 1, 1, 1, 1, 1,
0.3370833, 0.6317669, 1.52409, 1, 1, 1, 1, 1,
0.3400564, -0.8749275, 0.9683785, 1, 1, 1, 1, 1,
0.3448753, -1.549703, 2.144676, 1, 1, 1, 1, 1,
0.346416, -1.380714, 2.319048, 1, 1, 1, 1, 1,
0.3540305, 0.2794305, 1.643363, 1, 1, 1, 1, 1,
0.3553203, 1.262218, 1.025738, 1, 1, 1, 1, 1,
0.3572753, -0.3110325, 1.45239, 1, 1, 1, 1, 1,
0.3578, -1.737467, 1.472681, 1, 1, 1, 1, 1,
0.3607834, -0.6054006, 0.9857278, 0, 0, 1, 1, 1,
0.3616679, -0.543286, 2.643799, 1, 0, 0, 1, 1,
0.3641615, 0.3291019, 1.557606, 1, 0, 0, 1, 1,
0.3651154, 1.758775, 0.4229683, 1, 0, 0, 1, 1,
0.3680099, -0.3858199, 2.078986, 1, 0, 0, 1, 1,
0.3709416, -0.555916, 1.523468, 1, 0, 0, 1, 1,
0.3721704, -0.7129901, 1.713652, 0, 0, 0, 1, 1,
0.3734877, -1.011639, 3.183232, 0, 0, 0, 1, 1,
0.3766442, -0.3902971, 0.7350048, 0, 0, 0, 1, 1,
0.3766994, 0.2153855, 1.143559, 0, 0, 0, 1, 1,
0.3767228, 0.2312674, 1.971635, 0, 0, 0, 1, 1,
0.3789605, 0.7905753, 1.172959, 0, 0, 0, 1, 1,
0.3820373, -0.4302013, 2.042681, 0, 0, 0, 1, 1,
0.3838283, 0.2276958, 2.243848, 1, 1, 1, 1, 1,
0.385558, 1.016661, 0.1673398, 1, 1, 1, 1, 1,
0.3865745, 1.494904, 2.137311, 1, 1, 1, 1, 1,
0.3867557, 0.04965075, 1.027066, 1, 1, 1, 1, 1,
0.3887652, -1.017474, 3.401362, 1, 1, 1, 1, 1,
0.3901818, 0.4627186, 1.899629, 1, 1, 1, 1, 1,
0.3903509, 0.3352347, 0.142204, 1, 1, 1, 1, 1,
0.3978919, 0.4221014, -0.7899432, 1, 1, 1, 1, 1,
0.3982148, -1.273944, 2.408499, 1, 1, 1, 1, 1,
0.4007332, 0.1471623, 0.701103, 1, 1, 1, 1, 1,
0.400799, -2.22109, 1.918875, 1, 1, 1, 1, 1,
0.4008068, -0.8357902, 4.468299, 1, 1, 1, 1, 1,
0.4008292, -0.7904505, 4.283653, 1, 1, 1, 1, 1,
0.4022021, -0.7618748, 2.831117, 1, 1, 1, 1, 1,
0.4034984, -0.08795037, 2.716396, 1, 1, 1, 1, 1,
0.4098404, 0.8570325, -0.3311349, 0, 0, 1, 1, 1,
0.4127173, 1.018372, -0.484923, 1, 0, 0, 1, 1,
0.4159872, -1.421451, 4.076232, 1, 0, 0, 1, 1,
0.416568, -0.4780738, 0.9424586, 1, 0, 0, 1, 1,
0.4186843, 0.8865775, -0.02542987, 1, 0, 0, 1, 1,
0.4336753, 1.503655, 0.7534798, 1, 0, 0, 1, 1,
0.4420546, 2.468244, 1.342772, 0, 0, 0, 1, 1,
0.442167, -0.957651, 1.669834, 0, 0, 0, 1, 1,
0.4424185, 0.5700552, 0.2912608, 0, 0, 0, 1, 1,
0.4426007, -0.7836238, 3.914229, 0, 0, 0, 1, 1,
0.444241, -0.8278531, 3.822703, 0, 0, 0, 1, 1,
0.4457289, -0.2843826, 2.330339, 0, 0, 0, 1, 1,
0.4468353, 0.7110692, 0.5738392, 0, 0, 0, 1, 1,
0.4478304, -0.2369219, 1.08328, 1, 1, 1, 1, 1,
0.4478857, -0.01628996, 2.249039, 1, 1, 1, 1, 1,
0.4536596, 0.22842, 1.166123, 1, 1, 1, 1, 1,
0.4542663, -0.8078842, 2.817527, 1, 1, 1, 1, 1,
0.4593735, 0.8202282, 0.6155534, 1, 1, 1, 1, 1,
0.4600936, -0.5896557, 3.126326, 1, 1, 1, 1, 1,
0.4602704, -1.443219, 2.304913, 1, 1, 1, 1, 1,
0.4640234, -0.06685548, 1.086745, 1, 1, 1, 1, 1,
0.464858, 0.4907671, 2.31873, 1, 1, 1, 1, 1,
0.4686454, -0.3846969, 3.408832, 1, 1, 1, 1, 1,
0.4691434, 0.9480569, 1.504881, 1, 1, 1, 1, 1,
0.4712619, 1.285355, 2.227304, 1, 1, 1, 1, 1,
0.4724723, -0.4998181, 1.250866, 1, 1, 1, 1, 1,
0.4895578, 0.5774989, 0.264655, 1, 1, 1, 1, 1,
0.4954693, -0.8964856, 3.589558, 1, 1, 1, 1, 1,
0.4986029, 0.8658847, 0.63271, 0, 0, 1, 1, 1,
0.4988733, -0.4815734, 1.145549, 1, 0, 0, 1, 1,
0.5022803, -1.310297, 3.327066, 1, 0, 0, 1, 1,
0.5053817, 0.8731731, -0.9972141, 1, 0, 0, 1, 1,
0.5108933, 0.7619821, 1.589125, 1, 0, 0, 1, 1,
0.5206727, -0.471435, 1.029908, 1, 0, 0, 1, 1,
0.5230396, -1.30128, 4.429584, 0, 0, 0, 1, 1,
0.5234433, 0.8631918, 1.277253, 0, 0, 0, 1, 1,
0.5294818, -2.439138, 3.883601, 0, 0, 0, 1, 1,
0.5333114, -1.500801, 4.271728, 0, 0, 0, 1, 1,
0.5334263, -0.3328567, 2.539675, 0, 0, 0, 1, 1,
0.5352089, 0.630304, 2.565616, 0, 0, 0, 1, 1,
0.5357993, -0.9208329, 0.9351794, 0, 0, 0, 1, 1,
0.53887, -0.2183032, 0.4645612, 1, 1, 1, 1, 1,
0.5395342, -1.914852, 1.73009, 1, 1, 1, 1, 1,
0.5414605, 0.8379091, -0.2604839, 1, 1, 1, 1, 1,
0.5435004, 0.7366135, 0.5434912, 1, 1, 1, 1, 1,
0.5444617, 0.1277772, 0.1599952, 1, 1, 1, 1, 1,
0.5505503, -1.527435, 2.730347, 1, 1, 1, 1, 1,
0.5586482, -0.6833896, 0.8231949, 1, 1, 1, 1, 1,
0.5616744, 0.6799336, 1.406262, 1, 1, 1, 1, 1,
0.5626705, 1.242183, 1.570347, 1, 1, 1, 1, 1,
0.56521, 1.554439, 0.500973, 1, 1, 1, 1, 1,
0.566096, -0.1409033, 0.8730767, 1, 1, 1, 1, 1,
0.5667307, 0.6244035, 0.410571, 1, 1, 1, 1, 1,
0.5682986, 1.172092, -0.8801078, 1, 1, 1, 1, 1,
0.5737524, 2.631946, -1.381364, 1, 1, 1, 1, 1,
0.5747522, -0.4555603, 3.150132, 1, 1, 1, 1, 1,
0.5753937, -0.4658864, 1.535005, 0, 0, 1, 1, 1,
0.5795661, -1.37963, 2.941687, 1, 0, 0, 1, 1,
0.5823976, -0.4741004, 2.651437, 1, 0, 0, 1, 1,
0.582584, 0.2545276, 3.458728, 1, 0, 0, 1, 1,
0.5833524, -0.3093922, 1.726633, 1, 0, 0, 1, 1,
0.585461, -0.2138004, 2.761889, 1, 0, 0, 1, 1,
0.5913591, -0.4708308, 3.117629, 0, 0, 0, 1, 1,
0.5916678, 0.2324324, 2.17932, 0, 0, 0, 1, 1,
0.5951412, 0.7641641, 0.857017, 0, 0, 0, 1, 1,
0.6050216, -0.229734, 2.38346, 0, 0, 0, 1, 1,
0.6068803, 0.5756739, -0.001275183, 0, 0, 0, 1, 1,
0.6085119, -0.02891238, 1.853498, 0, 0, 0, 1, 1,
0.6177652, -0.08140284, 0.6082463, 0, 0, 0, 1, 1,
0.6210873, -0.8819647, 0.5524776, 1, 1, 1, 1, 1,
0.6220139, 0.4443993, 0.0684666, 1, 1, 1, 1, 1,
0.6245836, 0.1524995, 0.4572015, 1, 1, 1, 1, 1,
0.6249303, -0.8813766, 1.992421, 1, 1, 1, 1, 1,
0.6262673, 0.3938441, -0.7943622, 1, 1, 1, 1, 1,
0.6277627, 0.07105336, 2.02013, 1, 1, 1, 1, 1,
0.6310782, 0.7152525, 0.1608286, 1, 1, 1, 1, 1,
0.6319475, -0.4722621, 0.9705402, 1, 1, 1, 1, 1,
0.6345333, 1.378085, -0.9113997, 1, 1, 1, 1, 1,
0.6358077, -1.581077, 2.321864, 1, 1, 1, 1, 1,
0.6369187, 0.02830379, 1.62282, 1, 1, 1, 1, 1,
0.6410586, -0.5177096, 1.751048, 1, 1, 1, 1, 1,
0.6414421, 0.6040376, -1.262184, 1, 1, 1, 1, 1,
0.6466128, 0.2639869, 0.9115933, 1, 1, 1, 1, 1,
0.6485567, -0.1464085, 2.962394, 1, 1, 1, 1, 1,
0.6510874, -0.2505768, 1.648529, 0, 0, 1, 1, 1,
0.6513978, 0.05442562, 1.505365, 1, 0, 0, 1, 1,
0.6523328, 1.77882, -0.2871317, 1, 0, 0, 1, 1,
0.6558773, -0.4967261, 2.379671, 1, 0, 0, 1, 1,
0.6628836, 0.8950833, -0.940645, 1, 0, 0, 1, 1,
0.6634012, -1.616357, 3.377664, 1, 0, 0, 1, 1,
0.6647075, -0.6449277, 3.929758, 0, 0, 0, 1, 1,
0.6754894, 0.8958141, -0.08257183, 0, 0, 0, 1, 1,
0.676627, 0.22763, 1.929564, 0, 0, 0, 1, 1,
0.681024, -0.7107266, 3.804371, 0, 0, 0, 1, 1,
0.6812228, -2.334685, 3.021761, 0, 0, 0, 1, 1,
0.6838318, -1.291926, 2.550344, 0, 0, 0, 1, 1,
0.6961694, -0.4044633, 1.934535, 0, 0, 0, 1, 1,
0.6994394, 0.6105834, 1.93646, 1, 1, 1, 1, 1,
0.7048461, 0.03147822, 2.842423, 1, 1, 1, 1, 1,
0.7156216, 0.01162827, 2.181589, 1, 1, 1, 1, 1,
0.71627, -1.537291, 2.698013, 1, 1, 1, 1, 1,
0.7175309, 1.143373, -0.3815723, 1, 1, 1, 1, 1,
0.7243579, 0.2084592, 1.43574, 1, 1, 1, 1, 1,
0.7289475, -1.226388, 1.782808, 1, 1, 1, 1, 1,
0.7307081, -0.09658496, 2.529334, 1, 1, 1, 1, 1,
0.7320101, 0.4492513, 0.9933599, 1, 1, 1, 1, 1,
0.7324056, 0.04833949, 1.201311, 1, 1, 1, 1, 1,
0.7372582, 0.487886, 0.9435331, 1, 1, 1, 1, 1,
0.74151, 0.4880978, 0.3771226, 1, 1, 1, 1, 1,
0.7418994, 2.145317, -0.5970641, 1, 1, 1, 1, 1,
0.7525759, -0.5781847, 3.317641, 1, 1, 1, 1, 1,
0.7560267, 0.1742701, 2.83126, 1, 1, 1, 1, 1,
0.7561382, -1.614981, 2.048776, 0, 0, 1, 1, 1,
0.757426, -0.5504988, 1.710032, 1, 0, 0, 1, 1,
0.762989, -0.1069488, 1.141785, 1, 0, 0, 1, 1,
0.7650905, 0.1390292, 2.558968, 1, 0, 0, 1, 1,
0.7682519, -0.5297322, 1.973739, 1, 0, 0, 1, 1,
0.7743593, -0.8108343, 2.43225, 1, 0, 0, 1, 1,
0.7789431, 1.160697, -0.3818933, 0, 0, 0, 1, 1,
0.7807524, -1.005297, 2.441458, 0, 0, 0, 1, 1,
0.7823331, -0.5097174, 2.036416, 0, 0, 0, 1, 1,
0.7827814, 1.944079, -0.612419, 0, 0, 0, 1, 1,
0.7896596, 0.7766406, 1.425512, 0, 0, 0, 1, 1,
0.7912067, -1.019307, 0.4559385, 0, 0, 0, 1, 1,
0.7930136, 0.1292843, 0.6037027, 0, 0, 0, 1, 1,
0.80115, -1.645207, 2.191579, 1, 1, 1, 1, 1,
0.8018204, 1.729004, 0.5039564, 1, 1, 1, 1, 1,
0.8060578, 0.436872, 1.4858, 1, 1, 1, 1, 1,
0.81162, -0.4704375, 2.047854, 1, 1, 1, 1, 1,
0.8177004, -2.180473, 2.115078, 1, 1, 1, 1, 1,
0.8194056, 0.7186052, -0.190371, 1, 1, 1, 1, 1,
0.8198392, 1.39653, 0.1531754, 1, 1, 1, 1, 1,
0.8223982, -0.4591831, 1.671665, 1, 1, 1, 1, 1,
0.82631, 1.404881, -1.471915, 1, 1, 1, 1, 1,
0.8310025, -0.685518, 2.263025, 1, 1, 1, 1, 1,
0.8379146, 1.08581, 0.9596558, 1, 1, 1, 1, 1,
0.8394265, 0.05730974, 1.706791, 1, 1, 1, 1, 1,
0.8436189, -1.082984, 3.734776, 1, 1, 1, 1, 1,
0.8438309, -0.1332714, 1.197718, 1, 1, 1, 1, 1,
0.8470035, 1.206927, 0.9931983, 1, 1, 1, 1, 1,
0.8479977, 1.907432, -0.307159, 0, 0, 1, 1, 1,
0.8556901, 1.296937, 0.2298762, 1, 0, 0, 1, 1,
0.864726, 1.546085, 0.3661533, 1, 0, 0, 1, 1,
0.8692051, -0.9827332, 3.842882, 1, 0, 0, 1, 1,
0.8836868, -1.381419, 2.666636, 1, 0, 0, 1, 1,
0.8837394, 0.6396212, -0.8991734, 1, 0, 0, 1, 1,
0.8846455, -0.9402178, 1.279998, 0, 0, 0, 1, 1,
0.8856989, -0.05772379, -1.030085, 0, 0, 0, 1, 1,
0.8858286, -0.2009564, 0.7394095, 0, 0, 0, 1, 1,
0.8894426, -0.02932994, 2.081498, 0, 0, 0, 1, 1,
0.904118, 0.5844195, 2.03058, 0, 0, 0, 1, 1,
0.9180192, 1.470564, -1.504206, 0, 0, 0, 1, 1,
0.919414, 0.7799767, 0.2254591, 0, 0, 0, 1, 1,
0.9216616, -0.3377329, 1.713969, 1, 1, 1, 1, 1,
0.9225945, -1.421841, 3.238367, 1, 1, 1, 1, 1,
0.94011, 1.338538, 0.06990356, 1, 1, 1, 1, 1,
0.9409179, 0.5724197, 0.6871502, 1, 1, 1, 1, 1,
0.9411825, 1.316441, 0.4535638, 1, 1, 1, 1, 1,
0.9466855, 0.8419781, -0.1749758, 1, 1, 1, 1, 1,
0.9511362, 0.3569776, 0.6993926, 1, 1, 1, 1, 1,
0.9515097, 0.05381862, 2.876226, 1, 1, 1, 1, 1,
0.9522281, 0.01750472, 2.555832, 1, 1, 1, 1, 1,
0.953325, -1.217064, 2.035661, 1, 1, 1, 1, 1,
0.9597129, -0.3242346, 0.7870066, 1, 1, 1, 1, 1,
0.9597839, -0.8983293, 2.349387, 1, 1, 1, 1, 1,
0.9643573, 1.378203, -0.2277061, 1, 1, 1, 1, 1,
0.9652922, -1.620728, 2.631208, 1, 1, 1, 1, 1,
0.9709511, 0.9126417, 1.133017, 1, 1, 1, 1, 1,
0.9857759, 0.2731558, 3.43692, 0, 0, 1, 1, 1,
0.9908753, 1.715023, 1.03569, 1, 0, 0, 1, 1,
0.9956649, 0.4867321, 1.452079, 1, 0, 0, 1, 1,
0.995865, 1.753925, 0.5022385, 1, 0, 0, 1, 1,
0.9988425, 1.182737, 1.47873, 1, 0, 0, 1, 1,
1.001418, 0.01178612, 2.817611, 1, 0, 0, 1, 1,
1.003091, -0.01187792, 0.9568471, 0, 0, 0, 1, 1,
1.010648, -0.02108478, 2.747747, 0, 0, 0, 1, 1,
1.043002, 0.6473885, 1.192963, 0, 0, 0, 1, 1,
1.046527, 2.079348, 1.774943, 0, 0, 0, 1, 1,
1.054745, 0.3875965, 0.8522427, 0, 0, 0, 1, 1,
1.054813, 0.07948504, 1.179751, 0, 0, 0, 1, 1,
1.057258, 0.8879526, -1.379877, 0, 0, 0, 1, 1,
1.070582, 0.4497292, 0.6480073, 1, 1, 1, 1, 1,
1.082149, 0.925446, 1.405138, 1, 1, 1, 1, 1,
1.091962, 0.9242636, 1.111269, 1, 1, 1, 1, 1,
1.092135, 0.4245758, 0.8108244, 1, 1, 1, 1, 1,
1.100671, 0.495055, 1.739709, 1, 1, 1, 1, 1,
1.103296, -0.3323921, 3.062101, 1, 1, 1, 1, 1,
1.103747, 0.8861484, 0.5779514, 1, 1, 1, 1, 1,
1.105818, -0.08373032, 1.169064, 1, 1, 1, 1, 1,
1.110853, 0.7805099, -0.4872131, 1, 1, 1, 1, 1,
1.111091, 1.375402, 1.931113, 1, 1, 1, 1, 1,
1.111826, 0.3703961, 0.03823987, 1, 1, 1, 1, 1,
1.115911, 0.8376213, 1.575133, 1, 1, 1, 1, 1,
1.116572, -0.8702956, 0.640618, 1, 1, 1, 1, 1,
1.121685, 1.84967, -0.5153735, 1, 1, 1, 1, 1,
1.124781, -0.430066, 4.27283, 1, 1, 1, 1, 1,
1.129417, 0.05558779, 0.8610684, 0, 0, 1, 1, 1,
1.129703, 0.3630349, 0.2582465, 1, 0, 0, 1, 1,
1.139718, 0.7499888, 2.770993, 1, 0, 0, 1, 1,
1.145324, 1.915016, 0.1345943, 1, 0, 0, 1, 1,
1.153372, -1.064352, 1.944299, 1, 0, 0, 1, 1,
1.158813, 1.167205, 0.9586931, 1, 0, 0, 1, 1,
1.159506, -0.9769635, 1.595528, 0, 0, 0, 1, 1,
1.162664, -0.194088, 1.806523, 0, 0, 0, 1, 1,
1.167859, 2.343448, 0.05480026, 0, 0, 0, 1, 1,
1.175084, 0.1438206, 0.7292955, 0, 0, 0, 1, 1,
1.176436, 0.4657326, 1.915097, 0, 0, 0, 1, 1,
1.177328, -0.08428593, 1.173828, 0, 0, 0, 1, 1,
1.182259, -0.6928292, 3.165699, 0, 0, 0, 1, 1,
1.191004, -0.00130746, 1.309204, 1, 1, 1, 1, 1,
1.193078, -0.3526596, 2.232695, 1, 1, 1, 1, 1,
1.195431, 0.1550063, 1.212065, 1, 1, 1, 1, 1,
1.196723, 0.3631481, 1.40678, 1, 1, 1, 1, 1,
1.208259, 0.5035022, 1.859683, 1, 1, 1, 1, 1,
1.215726, -0.4373897, 0.2350913, 1, 1, 1, 1, 1,
1.217397, 1.121274, -0.07240482, 1, 1, 1, 1, 1,
1.222522, 1.166271, 1.236716, 1, 1, 1, 1, 1,
1.233178, 0.782148, 0.5647883, 1, 1, 1, 1, 1,
1.24321, 0.02164787, 2.816171, 1, 1, 1, 1, 1,
1.245998, 1.00284, 1.510438, 1, 1, 1, 1, 1,
1.246673, -0.8155326, 3.705061, 1, 1, 1, 1, 1,
1.247018, -0.1996068, 0.8818217, 1, 1, 1, 1, 1,
1.263782, -1.031528, 2.587011, 1, 1, 1, 1, 1,
1.264651, 0.7141738, -0.1697631, 1, 1, 1, 1, 1,
1.271279, 0.2625411, 0.7383475, 0, 0, 1, 1, 1,
1.285323, 1.221722, 1.520692, 1, 0, 0, 1, 1,
1.299857, -2.330943, 2.503735, 1, 0, 0, 1, 1,
1.304318, -0.2973064, 3.637823, 1, 0, 0, 1, 1,
1.311374, -0.05199356, 1.114956, 1, 0, 0, 1, 1,
1.314371, 0.02340871, 0.9240881, 1, 0, 0, 1, 1,
1.316202, -0.1713458, 1.937537, 0, 0, 0, 1, 1,
1.318198, -0.5585456, 2.328291, 0, 0, 0, 1, 1,
1.322599, -2.297315, 1.258289, 0, 0, 0, 1, 1,
1.325262, 1.165523, 2.504407, 0, 0, 0, 1, 1,
1.327191, 0.6899599, 0.7952549, 0, 0, 0, 1, 1,
1.330618, 0.5369614, 0.3284341, 0, 0, 0, 1, 1,
1.333401, 1.746292, 0.2237399, 0, 0, 0, 1, 1,
1.348183, -0.8316123, 4.625767, 1, 1, 1, 1, 1,
1.351521, 0.4182011, 1.620756, 1, 1, 1, 1, 1,
1.354123, -1.102695, 2.56361, 1, 1, 1, 1, 1,
1.355809, 0.9470786, 0.4028846, 1, 1, 1, 1, 1,
1.369696, -1.214702, 1.251087, 1, 1, 1, 1, 1,
1.369927, 0.1052139, 1.283676, 1, 1, 1, 1, 1,
1.374922, 0.1482452, 3.675006, 1, 1, 1, 1, 1,
1.378937, -2.087113, 4.897948, 1, 1, 1, 1, 1,
1.386026, -0.08363397, 2.511017, 1, 1, 1, 1, 1,
1.391197, 0.02570994, 0.9938965, 1, 1, 1, 1, 1,
1.393435, 0.9078185, -0.7663325, 1, 1, 1, 1, 1,
1.414676, -0.559289, 1.300761, 1, 1, 1, 1, 1,
1.431434, -0.5016107, 2.959558, 1, 1, 1, 1, 1,
1.438606, 0.1352972, 0.7896163, 1, 1, 1, 1, 1,
1.441737, 0.02669865, 1.990218, 1, 1, 1, 1, 1,
1.452011, -0.9301341, 3.024218, 0, 0, 1, 1, 1,
1.457673, -0.2130262, 2.857348, 1, 0, 0, 1, 1,
1.468833, 0.3848903, 0.2892911, 1, 0, 0, 1, 1,
1.479468, -0.5632165, 0.6854022, 1, 0, 0, 1, 1,
1.480655, 0.9216743, 0.7720093, 1, 0, 0, 1, 1,
1.483117, 0.7936844, 1.241747, 1, 0, 0, 1, 1,
1.487618, 1.075079, 1.465816, 0, 0, 0, 1, 1,
1.488066, 0.9332384, 2.19127, 0, 0, 0, 1, 1,
1.503902, 0.8640522, 1.946969, 0, 0, 0, 1, 1,
1.514273, -1.472462, 2.455644, 0, 0, 0, 1, 1,
1.52947, -0.4220748, 2.636073, 0, 0, 0, 1, 1,
1.534939, -0.7028189, 2.465751, 0, 0, 0, 1, 1,
1.538675, -2.582254, 2.915198, 0, 0, 0, 1, 1,
1.555386, 0.2177247, 1.264853, 1, 1, 1, 1, 1,
1.567359, -0.8838612, 2.194551, 1, 1, 1, 1, 1,
1.576233, -0.1199603, 3.234906, 1, 1, 1, 1, 1,
1.578292, -0.4372767, 0.2548981, 1, 1, 1, 1, 1,
1.595029, -2.538395, 1.956842, 1, 1, 1, 1, 1,
1.595452, -3.577141, 4.438231, 1, 1, 1, 1, 1,
1.63026, -0.8907382, 1.212902, 1, 1, 1, 1, 1,
1.637482, 2.465417, 0.5835578, 1, 1, 1, 1, 1,
1.637919, -0.9884888, 3.394769, 1, 1, 1, 1, 1,
1.648786, 0.5783715, 0.734888, 1, 1, 1, 1, 1,
1.653737, 0.3020198, 1.281452, 1, 1, 1, 1, 1,
1.661145, 1.441177, 1.519735, 1, 1, 1, 1, 1,
1.668615, -1.228354, 4.011902, 1, 1, 1, 1, 1,
1.677435, 1.818011, 1.763579, 1, 1, 1, 1, 1,
1.680321, 0.3822155, 0.953507, 1, 1, 1, 1, 1,
1.680641, 1.664385, -1.046863, 0, 0, 1, 1, 1,
1.682523, -0.2087836, -0.3996255, 1, 0, 0, 1, 1,
1.687128, 0.904574, 1.268342, 1, 0, 0, 1, 1,
1.687967, 0.4648113, 0.7769774, 1, 0, 0, 1, 1,
1.699449, -1.17958, 0.9722047, 1, 0, 0, 1, 1,
1.70163, 0.2455604, 0.3032298, 1, 0, 0, 1, 1,
1.717295, -1.302828, 3.347111, 0, 0, 0, 1, 1,
1.726726, 0.5789357, 1.157162, 0, 0, 0, 1, 1,
1.764687, 0.330302, 1.790421, 0, 0, 0, 1, 1,
1.773504, 0.2101624, 2.248094, 0, 0, 0, 1, 1,
1.801534, 0.8456229, 1.975148, 0, 0, 0, 1, 1,
1.808133, 0.4553467, 2.991981, 0, 0, 0, 1, 1,
1.820791, -1.645731, -0.01242109, 0, 0, 0, 1, 1,
1.839923, -2.249202, 3.04484, 1, 1, 1, 1, 1,
1.855427, 0.8017358, 1.372147, 1, 1, 1, 1, 1,
1.859148, -0.3649118, 1.17955, 1, 1, 1, 1, 1,
1.868297, -0.9771396, 2.557795, 1, 1, 1, 1, 1,
1.878319, 2.37607, 1.897343, 1, 1, 1, 1, 1,
1.879084, -0.9893407, 3.635794, 1, 1, 1, 1, 1,
1.880862, -0.3715656, -0.6152591, 1, 1, 1, 1, 1,
1.889786, 0.221357, 1.779075, 1, 1, 1, 1, 1,
1.892022, 0.3784418, 0.5226525, 1, 1, 1, 1, 1,
1.906095, -0.9066067, 1.73321, 1, 1, 1, 1, 1,
1.932733, 1.085658, 0.3725762, 1, 1, 1, 1, 1,
1.95124, 0.1531244, -0.3474195, 1, 1, 1, 1, 1,
1.966964, 0.4784289, 2.569139, 1, 1, 1, 1, 1,
1.989701, 0.3430196, 2.284149, 1, 1, 1, 1, 1,
2.032134, -0.548432, 2.163339, 1, 1, 1, 1, 1,
2.039014, 1.299803, 0.426267, 0, 0, 1, 1, 1,
2.052028, 0.4938206, 2.003682, 1, 0, 0, 1, 1,
2.16667, -1.073325, 2.512204, 1, 0, 0, 1, 1,
2.167181, -2.03567, 2.890493, 1, 0, 0, 1, 1,
2.217221, -1.514058, 2.21586, 1, 0, 0, 1, 1,
2.226599, 0.4161071, 1.1047, 1, 0, 0, 1, 1,
2.352263, -1.087452, 2.791547, 0, 0, 0, 1, 1,
2.375454, -0.1218141, 1.268492, 0, 0, 0, 1, 1,
2.383934, 0.6076169, 2.169788, 0, 0, 0, 1, 1,
2.487828, -0.3057074, 1.732558, 0, 0, 0, 1, 1,
2.502986, 0.5783802, 1.160797, 0, 0, 0, 1, 1,
2.586285, -1.272821, 2.593008, 0, 0, 0, 1, 1,
2.602891, -0.3447628, 0.221108, 0, 0, 0, 1, 1,
2.637589, -0.3210374, 1.461536, 1, 1, 1, 1, 1,
2.65505, 0.1660469, 1.725153, 1, 1, 1, 1, 1,
2.664289, -0.6875909, 2.090818, 1, 1, 1, 1, 1,
2.979254, 1.119141, 2.413246, 1, 1, 1, 1, 1,
3.661857, 1.7411, 1.037882, 1, 1, 1, 1, 1,
3.957705, 1.799973, -0.9339993, 1, 1, 1, 1, 1,
4.113897, 2.519271, 0.3414378, 1, 1, 1, 1, 1
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
var radius = 9.889479;
var distance = 34.73638;
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
mvMatrix.translate( -0.1895046, -0.007996559, 0.06483674 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.73638);
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
