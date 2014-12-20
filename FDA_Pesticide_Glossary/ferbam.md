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
-3.395124, 1.109717, -0.732731, 1, 0, 0, 1,
-3.074532, -1.554261, -3.058994, 1, 0.007843138, 0, 1,
-3.044074, 0.8099315, -0.8671846, 1, 0.01176471, 0, 1,
-2.916463, -0.4882091, -1.396223, 1, 0.01960784, 0, 1,
-2.710339, -0.03711323, 0.7090194, 1, 0.02352941, 0, 1,
-2.577082, 0.3829305, 0.2020701, 1, 0.03137255, 0, 1,
-2.455537, -1.008537, -1.899952, 1, 0.03529412, 0, 1,
-2.452997, -1.079522, -1.775218, 1, 0.04313726, 0, 1,
-2.439919, 1.198329, -0.8294674, 1, 0.04705882, 0, 1,
-2.422735, 0.4440161, -2.652487, 1, 0.05490196, 0, 1,
-2.411779, -0.4443748, -1.514857, 1, 0.05882353, 0, 1,
-2.409148, -0.614269, -1.628449, 1, 0.06666667, 0, 1,
-2.379699, -0.05571327, -1.632394, 1, 0.07058824, 0, 1,
-2.252627, 1.97396, -1.578078, 1, 0.07843138, 0, 1,
-2.198432, 1.224854, -0.9578443, 1, 0.08235294, 0, 1,
-2.186563, -0.6517071, -0.7196497, 1, 0.09019608, 0, 1,
-2.167713, 0.2753931, -0.6277208, 1, 0.09411765, 0, 1,
-2.165119, -0.1695179, -1.087877, 1, 0.1019608, 0, 1,
-2.145177, 1.251293, -1.487767, 1, 0.1098039, 0, 1,
-2.133614, -1.850854, -1.695814, 1, 0.1137255, 0, 1,
-2.127301, -0.4497488, -1.483519, 1, 0.1215686, 0, 1,
-2.113855, -0.7181262, -1.157108, 1, 0.1254902, 0, 1,
-2.08823, 0.3439345, -1.638721, 1, 0.1333333, 0, 1,
-2.067592, -0.7950538, -2.287712, 1, 0.1372549, 0, 1,
-2.046614, 0.7971555, -3.12638, 1, 0.145098, 0, 1,
-2.029881, 0.4794763, -1.569543, 1, 0.1490196, 0, 1,
-2.026451, 0.1508494, -2.154017, 1, 0.1568628, 0, 1,
-2.005841, 0.3125932, -2.190179, 1, 0.1607843, 0, 1,
-1.988326, -0.616135, -0.7627008, 1, 0.1686275, 0, 1,
-1.986985, 1.642046, -0.1333439, 1, 0.172549, 0, 1,
-1.925857, -0.6572541, -1.887279, 1, 0.1803922, 0, 1,
-1.922462, -1.222348, -1.922516, 1, 0.1843137, 0, 1,
-1.885661, 0.37637, -0.744607, 1, 0.1921569, 0, 1,
-1.884835, -0.1912976, -2.911251, 1, 0.1960784, 0, 1,
-1.870295, 0.4181309, -1.279541, 1, 0.2039216, 0, 1,
-1.851715, -0.688785, -2.879824, 1, 0.2117647, 0, 1,
-1.846308, 0.4465506, -0.0009763513, 1, 0.2156863, 0, 1,
-1.844394, 2.344715, -0.4962066, 1, 0.2235294, 0, 1,
-1.837844, -0.8929917, -1.446561, 1, 0.227451, 0, 1,
-1.830714, -0.2432506, -1.568268, 1, 0.2352941, 0, 1,
-1.826426, -1.500938, -1.674791, 1, 0.2392157, 0, 1,
-1.825054, 0.5808488, -0.5386826, 1, 0.2470588, 0, 1,
-1.800176, -0.1579663, -2.682469, 1, 0.2509804, 0, 1,
-1.798023, 1.866195, -0.2029864, 1, 0.2588235, 0, 1,
-1.794616, 0.2180742, -0.8714806, 1, 0.2627451, 0, 1,
-1.766529, -1.905544, -1.314894, 1, 0.2705882, 0, 1,
-1.757346, 0.2249083, -2.284988, 1, 0.2745098, 0, 1,
-1.755733, -0.02523373, -1.810374, 1, 0.282353, 0, 1,
-1.741687, 1.353231, -1.55316, 1, 0.2862745, 0, 1,
-1.737338, -0.04991527, -2.935168, 1, 0.2941177, 0, 1,
-1.736955, -0.7070002, -2.289559, 1, 0.3019608, 0, 1,
-1.723852, 0.1883084, -2.00211, 1, 0.3058824, 0, 1,
-1.700818, -0.9388658, -0.5900372, 1, 0.3137255, 0, 1,
-1.656581, 0.7042645, -0.3913218, 1, 0.3176471, 0, 1,
-1.639551, 0.2888643, -0.121158, 1, 0.3254902, 0, 1,
-1.617607, -2.599591, -0.272598, 1, 0.3294118, 0, 1,
-1.617356, 1.336764, -1.513671, 1, 0.3372549, 0, 1,
-1.606036, -0.4964674, 0.7463495, 1, 0.3411765, 0, 1,
-1.599593, -1.114854, -1.366198, 1, 0.3490196, 0, 1,
-1.598516, -0.5487775, -1.40585, 1, 0.3529412, 0, 1,
-1.597827, -0.5708039, -1.911406, 1, 0.3607843, 0, 1,
-1.584317, -1.15809, -3.932228, 1, 0.3647059, 0, 1,
-1.575029, 0.8410177, -3.366789, 1, 0.372549, 0, 1,
-1.56875, -0.5064101, -2.151992, 1, 0.3764706, 0, 1,
-1.567019, 1.748103, -2.783631, 1, 0.3843137, 0, 1,
-1.560253, -1.074318, -2.37985, 1, 0.3882353, 0, 1,
-1.542641, -0.14408, -0.6724549, 1, 0.3960784, 0, 1,
-1.530821, 0.8405375, -0.3266403, 1, 0.4039216, 0, 1,
-1.528095, -0.3405068, -3.39497, 1, 0.4078431, 0, 1,
-1.507944, 0.8137686, 0.06006116, 1, 0.4156863, 0, 1,
-1.494495, 0.4292507, -1.299853, 1, 0.4196078, 0, 1,
-1.494136, 0.8757988, 0.03323979, 1, 0.427451, 0, 1,
-1.487192, -0.7230633, -3.006343, 1, 0.4313726, 0, 1,
-1.474851, 0.333127, 0.1164129, 1, 0.4392157, 0, 1,
-1.460859, -2.022242, -4.43444, 1, 0.4431373, 0, 1,
-1.456854, 1.390094, -1.033267, 1, 0.4509804, 0, 1,
-1.451262, 0.5719559, -0.9698828, 1, 0.454902, 0, 1,
-1.446372, 2.009643, -0.2071675, 1, 0.4627451, 0, 1,
-1.442374, 1.64735, -1.080288, 1, 0.4666667, 0, 1,
-1.423224, 0.1617918, -1.255251, 1, 0.4745098, 0, 1,
-1.422372, 2.266971, -2.045472, 1, 0.4784314, 0, 1,
-1.401602, -0.393382, -2.776302, 1, 0.4862745, 0, 1,
-1.393255, -0.8565587, -3.104465, 1, 0.4901961, 0, 1,
-1.389794, -1.288514, -3.201167, 1, 0.4980392, 0, 1,
-1.380464, 0.2438654, -3.400026, 1, 0.5058824, 0, 1,
-1.368498, 0.5044569, -1.967003, 1, 0.509804, 0, 1,
-1.365586, 1.545154, -1.548062, 1, 0.5176471, 0, 1,
-1.364628, 0.5280144, -1.23138, 1, 0.5215687, 0, 1,
-1.36268, -0.733497, -2.570687, 1, 0.5294118, 0, 1,
-1.338263, -0.7316623, -2.634778, 1, 0.5333334, 0, 1,
-1.333232, 0.1833756, -2.213868, 1, 0.5411765, 0, 1,
-1.330993, 0.3448754, -1.557149, 1, 0.5450981, 0, 1,
-1.329845, -0.7197309, -2.785391, 1, 0.5529412, 0, 1,
-1.324298, -2.109254, -1.069844, 1, 0.5568628, 0, 1,
-1.318933, -1.651581, -0.9431645, 1, 0.5647059, 0, 1,
-1.317771, -0.5212418, -1.851147, 1, 0.5686275, 0, 1,
-1.308848, 2.239031, -3.108233, 1, 0.5764706, 0, 1,
-1.300464, -0.05832201, -0.3614824, 1, 0.5803922, 0, 1,
-1.288365, -0.2876087, -4.60022, 1, 0.5882353, 0, 1,
-1.274723, 0.07407188, -1.384518, 1, 0.5921569, 0, 1,
-1.272526, -1.224271, -2.664173, 1, 0.6, 0, 1,
-1.244949, 1.994685, 2.002333, 1, 0.6078432, 0, 1,
-1.240139, -0.1169413, -0.3261455, 1, 0.6117647, 0, 1,
-1.238763, -0.1591207, -1.520856, 1, 0.6196079, 0, 1,
-1.237935, -0.9427159, -2.422984, 1, 0.6235294, 0, 1,
-1.231945, -0.4142435, -1.815119, 1, 0.6313726, 0, 1,
-1.23071, -0.4424456, -3.060667, 1, 0.6352941, 0, 1,
-1.215442, 0.4480399, -0.06337673, 1, 0.6431373, 0, 1,
-1.214085, -0.8524283, -0.718677, 1, 0.6470588, 0, 1,
-1.211889, 0.8538861, 0.1546651, 1, 0.654902, 0, 1,
-1.207801, 0.05639056, -2.64691, 1, 0.6588235, 0, 1,
-1.194686, -0.1631476, -1.973386, 1, 0.6666667, 0, 1,
-1.18906, -1.119146, -2.850749, 1, 0.6705883, 0, 1,
-1.184723, 0.1931447, -1.119609, 1, 0.6784314, 0, 1,
-1.176511, -1.065358, -2.234807, 1, 0.682353, 0, 1,
-1.174121, 0.8812748, 0.6923032, 1, 0.6901961, 0, 1,
-1.169841, 0.6676333, -2.788953, 1, 0.6941177, 0, 1,
-1.166871, 0.2382322, -0.674886, 1, 0.7019608, 0, 1,
-1.162652, 1.048739, -1.065289, 1, 0.7098039, 0, 1,
-1.161843, 0.09137571, 0.2889149, 1, 0.7137255, 0, 1,
-1.158613, -1.297202, -2.379977, 1, 0.7215686, 0, 1,
-1.155928, 1.021948, 0.00852224, 1, 0.7254902, 0, 1,
-1.150521, 0.4737058, -3.903606, 1, 0.7333333, 0, 1,
-1.150059, 0.9461944, -1.880556, 1, 0.7372549, 0, 1,
-1.149604, -2.585134, -2.261207, 1, 0.7450981, 0, 1,
-1.147665, -1.405957, -0.7535915, 1, 0.7490196, 0, 1,
-1.143993, -0.2282391, -1.903917, 1, 0.7568628, 0, 1,
-1.137558, -1.081621, -3.138313, 1, 0.7607843, 0, 1,
-1.133969, -1.217437, -1.444413, 1, 0.7686275, 0, 1,
-1.127036, 0.6901084, -1.437295, 1, 0.772549, 0, 1,
-1.126422, 0.0396536, -1.25041, 1, 0.7803922, 0, 1,
-1.126406, -0.3212939, -1.632002, 1, 0.7843137, 0, 1,
-1.123723, 2.455219, -0.7804669, 1, 0.7921569, 0, 1,
-1.117515, 0.1645377, -0.8893894, 1, 0.7960784, 0, 1,
-1.116404, 0.6488277, -1.037304, 1, 0.8039216, 0, 1,
-1.112803, 1.082334, -2.727575, 1, 0.8117647, 0, 1,
-1.111136, 0.417862, 0.4720823, 1, 0.8156863, 0, 1,
-1.110377, -0.1110464, -2.287131, 1, 0.8235294, 0, 1,
-1.108055, 0.4212192, -1.393324, 1, 0.827451, 0, 1,
-1.106994, -0.1864601, -1.966998, 1, 0.8352941, 0, 1,
-1.093113, 0.7992771, 0.8628607, 1, 0.8392157, 0, 1,
-1.086909, -1.736136, -2.918606, 1, 0.8470588, 0, 1,
-1.086333, -0.1480844, -2.4658, 1, 0.8509804, 0, 1,
-1.082241, -1.163913, -2.285642, 1, 0.8588235, 0, 1,
-1.078371, 1.068481, -2.418788, 1, 0.8627451, 0, 1,
-1.077854, -1.025556, -1.579483, 1, 0.8705882, 0, 1,
-1.073662, 1.201768, -0.0692032, 1, 0.8745098, 0, 1,
-1.064252, 1.177323, -0.05722768, 1, 0.8823529, 0, 1,
-1.057428, 1.203219, -1.489886, 1, 0.8862745, 0, 1,
-1.052274, 0.5305191, -1.265566, 1, 0.8941177, 0, 1,
-1.05201, -0.1608749, -1.36025, 1, 0.8980392, 0, 1,
-1.046359, 0.4285727, -2.369705, 1, 0.9058824, 0, 1,
-1.043722, 0.6113918, 0.84101, 1, 0.9137255, 0, 1,
-1.043637, 0.2699919, -0.9077166, 1, 0.9176471, 0, 1,
-1.043368, -0.3354487, -1.398827, 1, 0.9254902, 0, 1,
-1.03677, -0.05582815, -2.322568, 1, 0.9294118, 0, 1,
-1.034561, 1.472806, -1.216492, 1, 0.9372549, 0, 1,
-1.031468, -0.2808928, -0.03644393, 1, 0.9411765, 0, 1,
-1.019741, -1.551855, -1.61817, 1, 0.9490196, 0, 1,
-1.006284, 0.3072071, -3.780263, 1, 0.9529412, 0, 1,
-1.005529, 1.194111, -1.900443, 1, 0.9607843, 0, 1,
-1.002701, -1.73939, -2.584199, 1, 0.9647059, 0, 1,
-1.002415, -0.2782609, -2.626031, 1, 0.972549, 0, 1,
-0.9903802, 0.7409036, -1.142523, 1, 0.9764706, 0, 1,
-0.9888522, -0.2099089, -2.930902, 1, 0.9843137, 0, 1,
-0.983893, 2.011177, -0.6622266, 1, 0.9882353, 0, 1,
-0.980414, -0.1974062, -1.587273, 1, 0.9960784, 0, 1,
-0.9576463, -0.4489204, -2.13607, 0.9960784, 1, 0, 1,
-0.9567924, 0.4523006, -0.9547252, 0.9921569, 1, 0, 1,
-0.9546357, 0.0924407, -1.578885, 0.9843137, 1, 0, 1,
-0.9541551, -0.6873863, -3.477215, 0.9803922, 1, 0, 1,
-0.9521508, 0.7319328, -1.025809, 0.972549, 1, 0, 1,
-0.9517398, -1.035859, -3.19817, 0.9686275, 1, 0, 1,
-0.9511795, 1.009812, -0.6266593, 0.9607843, 1, 0, 1,
-0.94516, -0.9935167, -0.8883063, 0.9568627, 1, 0, 1,
-0.9362187, 0.100442, -0.8815283, 0.9490196, 1, 0, 1,
-0.9280728, 0.4779862, -1.728697, 0.945098, 1, 0, 1,
-0.9210412, 0.370498, -1.076263, 0.9372549, 1, 0, 1,
-0.9119009, -0.3800045, -2.369136, 0.9333333, 1, 0, 1,
-0.9098604, -0.4479657, -0.9719288, 0.9254902, 1, 0, 1,
-0.9088418, -0.6775069, -2.75887, 0.9215686, 1, 0, 1,
-0.9072517, 1.08099, -1.051449, 0.9137255, 1, 0, 1,
-0.9067234, 0.7717823, -1.26293, 0.9098039, 1, 0, 1,
-0.9032521, 0.8629469, -0.5508642, 0.9019608, 1, 0, 1,
-0.8952544, -0.4843483, -2.920533, 0.8941177, 1, 0, 1,
-0.8922307, -0.6108714, -2.08076, 0.8901961, 1, 0, 1,
-0.8814396, 1.588953, -2.684322, 0.8823529, 1, 0, 1,
-0.8724085, 0.914743, -0.3097965, 0.8784314, 1, 0, 1,
-0.8699473, -0.7985243, -2.490794, 0.8705882, 1, 0, 1,
-0.8669244, 1.158817, -0.2855748, 0.8666667, 1, 0, 1,
-0.8623896, 0.3161976, -0.2963692, 0.8588235, 1, 0, 1,
-0.8478117, -0.1462955, -0.7006987, 0.854902, 1, 0, 1,
-0.8457729, 0.9027616, -0.8868704, 0.8470588, 1, 0, 1,
-0.8429021, -1.717853, -1.856531, 0.8431373, 1, 0, 1,
-0.8407288, -0.1207471, 0.3981474, 0.8352941, 1, 0, 1,
-0.8406931, -0.4252129, -3.153442, 0.8313726, 1, 0, 1,
-0.840359, -0.7765246, -3.438727, 0.8235294, 1, 0, 1,
-0.8278159, -1.507296, -2.762812, 0.8196079, 1, 0, 1,
-0.8278109, -0.09568321, -1.809365, 0.8117647, 1, 0, 1,
-0.8270662, 2.575433, -0.1177484, 0.8078431, 1, 0, 1,
-0.8268698, -1.596531, -2.718574, 0.8, 1, 0, 1,
-0.8268189, 0.5408317, -2.432637, 0.7921569, 1, 0, 1,
-0.8193099, -1.465982, -0.6891271, 0.7882353, 1, 0, 1,
-0.8177862, -0.3118309, -3.602736, 0.7803922, 1, 0, 1,
-0.8115324, -0.8425878, -2.616466, 0.7764706, 1, 0, 1,
-0.8114313, 1.373367, -0.744473, 0.7686275, 1, 0, 1,
-0.8077576, 0.9416559, 0.04529214, 0.7647059, 1, 0, 1,
-0.8051114, 0.9963676, 0.1696997, 0.7568628, 1, 0, 1,
-0.80387, -1.728433, -1.999466, 0.7529412, 1, 0, 1,
-0.8023522, 0.2807443, -0.3839495, 0.7450981, 1, 0, 1,
-0.8007718, -1.737934, -2.294692, 0.7411765, 1, 0, 1,
-0.792951, -0.7421182, -0.6510358, 0.7333333, 1, 0, 1,
-0.7917227, -0.1563853, -4.422942, 0.7294118, 1, 0, 1,
-0.7909018, 1.910163, -1.416098, 0.7215686, 1, 0, 1,
-0.7907941, -0.5310756, -2.276423, 0.7176471, 1, 0, 1,
-0.7883958, 0.7929903, -0.4342899, 0.7098039, 1, 0, 1,
-0.7855433, 1.004748, -0.8202369, 0.7058824, 1, 0, 1,
-0.7811177, 0.1768296, -1.027214, 0.6980392, 1, 0, 1,
-0.7775421, 0.07476383, -2.251505, 0.6901961, 1, 0, 1,
-0.7676774, -0.3779401, -1.167836, 0.6862745, 1, 0, 1,
-0.7635121, -0.9437915, -2.879169, 0.6784314, 1, 0, 1,
-0.7603348, -0.658447, -3.349229, 0.6745098, 1, 0, 1,
-0.756532, 1.414913, -2.011372, 0.6666667, 1, 0, 1,
-0.756242, 0.6063376, -0.5351447, 0.6627451, 1, 0, 1,
-0.7546772, -0.9965752, -1.868896, 0.654902, 1, 0, 1,
-0.7504207, -0.9077535, -2.7885, 0.6509804, 1, 0, 1,
-0.7503364, -0.6603231, -3.552121, 0.6431373, 1, 0, 1,
-0.7474697, -1.029485, -4.22128, 0.6392157, 1, 0, 1,
-0.7425268, 0.3017905, -3.367712, 0.6313726, 1, 0, 1,
-0.7422696, 0.4434991, -1.906331, 0.627451, 1, 0, 1,
-0.7409633, 0.1158173, -2.456898, 0.6196079, 1, 0, 1,
-0.7365971, -0.2270245, -2.353076, 0.6156863, 1, 0, 1,
-0.734543, 0.457107, -0.7508233, 0.6078432, 1, 0, 1,
-0.7309673, -0.4018437, -1.230272, 0.6039216, 1, 0, 1,
-0.7215887, 0.2073066, -4.224237, 0.5960785, 1, 0, 1,
-0.7212635, 0.8000731, -2.547529, 0.5882353, 1, 0, 1,
-0.7212212, -0.7773619, -1.179154, 0.5843138, 1, 0, 1,
-0.7175253, 0.2729067, -0.75094, 0.5764706, 1, 0, 1,
-0.7147129, 1.028797, 0.0241308, 0.572549, 1, 0, 1,
-0.7122827, -1.158718, -2.492512, 0.5647059, 1, 0, 1,
-0.7078012, -0.01019729, -1.509483, 0.5607843, 1, 0, 1,
-0.7024053, -0.05268099, -1.626134, 0.5529412, 1, 0, 1,
-0.7018165, -0.7671039, -2.314858, 0.5490196, 1, 0, 1,
-0.7015284, -0.5763036, -2.216244, 0.5411765, 1, 0, 1,
-0.6970565, 1.445835, -0.007539647, 0.5372549, 1, 0, 1,
-0.6966078, 1.218074, 0.11988, 0.5294118, 1, 0, 1,
-0.6964662, 1.528076, -1.782421, 0.5254902, 1, 0, 1,
-0.6949808, -0.6679621, -1.74245, 0.5176471, 1, 0, 1,
-0.694464, 2.40018, 0.6373191, 0.5137255, 1, 0, 1,
-0.6941032, -1.14292, -3.436669, 0.5058824, 1, 0, 1,
-0.691704, -1.350305, -3.056247, 0.5019608, 1, 0, 1,
-0.6914589, -0.2853444, -1.374293, 0.4941176, 1, 0, 1,
-0.6884681, 0.1855831, -2.049412, 0.4862745, 1, 0, 1,
-0.6854988, -0.1184969, -1.06122, 0.4823529, 1, 0, 1,
-0.6837973, -0.4227626, -1.413616, 0.4745098, 1, 0, 1,
-0.679691, -0.234208, -2.219259, 0.4705882, 1, 0, 1,
-0.6759781, -1.385596, -2.925703, 0.4627451, 1, 0, 1,
-0.6741627, 0.1769501, -2.205098, 0.4588235, 1, 0, 1,
-0.6717324, 1.366813, 1.075335, 0.4509804, 1, 0, 1,
-0.6704148, -0.4461822, -1.339556, 0.4470588, 1, 0, 1,
-0.6688762, 1.979598, 0.8362731, 0.4392157, 1, 0, 1,
-0.6634367, 0.09213359, -1.679115, 0.4352941, 1, 0, 1,
-0.6627101, 1.220451, -0.3503141, 0.427451, 1, 0, 1,
-0.6608795, 1.713753, -0.1938267, 0.4235294, 1, 0, 1,
-0.6577978, -0.9639536, -3.634486, 0.4156863, 1, 0, 1,
-0.6571941, 0.4138781, -0.2580777, 0.4117647, 1, 0, 1,
-0.6455664, 0.5243461, -0.203013, 0.4039216, 1, 0, 1,
-0.6452402, 0.502799, -1.676808, 0.3960784, 1, 0, 1,
-0.6429366, -0.2736056, -1.35043, 0.3921569, 1, 0, 1,
-0.6405355, 0.04982289, -0.8581309, 0.3843137, 1, 0, 1,
-0.6402852, -0.1201865, -0.8664793, 0.3803922, 1, 0, 1,
-0.6368762, -1.18807, -2.821714, 0.372549, 1, 0, 1,
-0.6362826, 0.2404275, -0.1008276, 0.3686275, 1, 0, 1,
-0.6345064, 1.044022, 0.1568221, 0.3607843, 1, 0, 1,
-0.6325311, 0.4765261, 1.051776, 0.3568628, 1, 0, 1,
-0.6308806, 2.008967, 0.6346133, 0.3490196, 1, 0, 1,
-0.6265265, 1.06977, -2.175488, 0.345098, 1, 0, 1,
-0.6251622, -0.03928139, 0.1473001, 0.3372549, 1, 0, 1,
-0.6185824, 1.125606, -3.071694, 0.3333333, 1, 0, 1,
-0.6165346, -0.03169199, -1.591979, 0.3254902, 1, 0, 1,
-0.6131427, 0.2855167, -1.525325, 0.3215686, 1, 0, 1,
-0.6109873, -0.5613832, -1.892605, 0.3137255, 1, 0, 1,
-0.6077048, 0.5040913, -2.347423, 0.3098039, 1, 0, 1,
-0.602982, -0.6196141, -2.218895, 0.3019608, 1, 0, 1,
-0.6003629, -0.4458199, -2.209018, 0.2941177, 1, 0, 1,
-0.5996564, -0.8916787, -1.091146, 0.2901961, 1, 0, 1,
-0.5971127, 0.8577035, -1.600559, 0.282353, 1, 0, 1,
-0.590246, 0.6856592, -0.3348053, 0.2784314, 1, 0, 1,
-0.5874233, 2.590451, 0.3398286, 0.2705882, 1, 0, 1,
-0.5870519, -0.5261684, 0.2246475, 0.2666667, 1, 0, 1,
-0.5808619, -1.472135, -2.322405, 0.2588235, 1, 0, 1,
-0.5767776, 0.6345209, -0.1784245, 0.254902, 1, 0, 1,
-0.5754934, 0.484639, -0.609744, 0.2470588, 1, 0, 1,
-0.5697548, -1.257138, -3.264912, 0.2431373, 1, 0, 1,
-0.5688857, 0.7226648, -0.23866, 0.2352941, 1, 0, 1,
-0.5684551, 0.0903236, -2.025689, 0.2313726, 1, 0, 1,
-0.5631752, 0.3834197, -2.6972, 0.2235294, 1, 0, 1,
-0.5627153, 0.3239723, -0.85488, 0.2196078, 1, 0, 1,
-0.5459391, 0.3050098, -1.536459, 0.2117647, 1, 0, 1,
-0.5454811, 1.231444, -1.224745, 0.2078431, 1, 0, 1,
-0.5334466, 1.520305, 1.78911, 0.2, 1, 0, 1,
-0.5277095, 0.7887315, 0.1412212, 0.1921569, 1, 0, 1,
-0.5274652, 0.5277053, -0.2121264, 0.1882353, 1, 0, 1,
-0.5256321, -2.426295, -3.495952, 0.1803922, 1, 0, 1,
-0.5247874, -0.767227, -2.661499, 0.1764706, 1, 0, 1,
-0.524124, 0.778567, -1.057856, 0.1686275, 1, 0, 1,
-0.5202425, 0.4030888, 0.4919841, 0.1647059, 1, 0, 1,
-0.5118428, -0.165021, -2.469779, 0.1568628, 1, 0, 1,
-0.5077094, -0.7166178, -1.693767, 0.1529412, 1, 0, 1,
-0.4978558, 0.1167014, -1.520134, 0.145098, 1, 0, 1,
-0.4951969, -0.7335334, -2.238672, 0.1411765, 1, 0, 1,
-0.49415, 0.295364, -1.72866, 0.1333333, 1, 0, 1,
-0.4825887, -0.326987, -3.280653, 0.1294118, 1, 0, 1,
-0.4812867, 1.257429, -2.583885, 0.1215686, 1, 0, 1,
-0.479546, -1.233669, -0.4751877, 0.1176471, 1, 0, 1,
-0.4751587, -0.8221442, -1.872539, 0.1098039, 1, 0, 1,
-0.4748577, -1.363273, -0.6754332, 0.1058824, 1, 0, 1,
-0.4731057, 1.141399, -0.319722, 0.09803922, 1, 0, 1,
-0.473054, 0.7210572, -0.03391792, 0.09019608, 1, 0, 1,
-0.4677852, 0.6965032, -0.7516927, 0.08627451, 1, 0, 1,
-0.4631976, 0.8302394, 0.9666911, 0.07843138, 1, 0, 1,
-0.4599595, -0.5113242, -2.756372, 0.07450981, 1, 0, 1,
-0.4559051, 0.236407, -0.7039024, 0.06666667, 1, 0, 1,
-0.454697, 0.2185476, -3.245323, 0.0627451, 1, 0, 1,
-0.4546648, -1.875845, -4.754123, 0.05490196, 1, 0, 1,
-0.4533356, 0.4922771, -0.6502448, 0.05098039, 1, 0, 1,
-0.4473015, -0.8690923, -4.426537, 0.04313726, 1, 0, 1,
-0.4443075, -0.8045675, -1.867872, 0.03921569, 1, 0, 1,
-0.4360922, -0.8547452, -2.494723, 0.03137255, 1, 0, 1,
-0.4359888, -0.4597906, -2.110716, 0.02745098, 1, 0, 1,
-0.4348866, -0.06613365, -0.9907496, 0.01960784, 1, 0, 1,
-0.4338735, 1.824554, -0.7351584, 0.01568628, 1, 0, 1,
-0.4330509, -1.378479, -1.547744, 0.007843138, 1, 0, 1,
-0.4246103, 0.2935153, -0.3940867, 0.003921569, 1, 0, 1,
-0.4222473, -0.1628962, -1.453134, 0, 1, 0.003921569, 1,
-0.421114, -0.1294549, -0.887584, 0, 1, 0.01176471, 1,
-0.4208894, -0.8495454, -2.364249, 0, 1, 0.01568628, 1,
-0.4182436, 1.176485, 1.110127, 0, 1, 0.02352941, 1,
-0.4141909, 0.1410377, -2.132068, 0, 1, 0.02745098, 1,
-0.4120893, 0.6951448, -0.2571508, 0, 1, 0.03529412, 1,
-0.4088143, 0.9259191, -1.649367, 0, 1, 0.03921569, 1,
-0.408548, -0.8335275, -1.028516, 0, 1, 0.04705882, 1,
-0.4076726, 0.3845655, 0.2667954, 0, 1, 0.05098039, 1,
-0.4066215, 0.7385753, -1.704823, 0, 1, 0.05882353, 1,
-0.4039511, -0.9378731, -3.157645, 0, 1, 0.0627451, 1,
-0.4026411, -0.3715645, -3.22582, 0, 1, 0.07058824, 1,
-0.4022624, -0.4272676, -2.747885, 0, 1, 0.07450981, 1,
-0.4019941, -1.370626, -2.962838, 0, 1, 0.08235294, 1,
-0.4015913, 0.3219805, -1.17842, 0, 1, 0.08627451, 1,
-0.3883433, -1.612534, -2.46015, 0, 1, 0.09411765, 1,
-0.3870161, -1.056023, -2.956596, 0, 1, 0.1019608, 1,
-0.3855759, -0.6473977, -0.8265264, 0, 1, 0.1058824, 1,
-0.3820766, -1.098355, -2.241353, 0, 1, 0.1137255, 1,
-0.3768711, -0.3469646, -0.5898225, 0, 1, 0.1176471, 1,
-0.3767418, -0.6019034, -1.98274, 0, 1, 0.1254902, 1,
-0.3727144, -2.263182, -2.040284, 0, 1, 0.1294118, 1,
-0.3667254, 1.261685, 0.4599535, 0, 1, 0.1372549, 1,
-0.3649035, 2.228093, -0.3381462, 0, 1, 0.1411765, 1,
-0.3599108, 0.7470142, -0.2262138, 0, 1, 0.1490196, 1,
-0.3570692, 0.382864, -1.04318, 0, 1, 0.1529412, 1,
-0.3537929, 0.08152814, -1.563761, 0, 1, 0.1607843, 1,
-0.3528786, 1.84748, 0.646338, 0, 1, 0.1647059, 1,
-0.3501311, 0.4361187, -0.2789468, 0, 1, 0.172549, 1,
-0.349252, 0.03308591, -3.050858, 0, 1, 0.1764706, 1,
-0.3395486, -2.048452, -3.034974, 0, 1, 0.1843137, 1,
-0.3374059, -0.8865557, -3.383755, 0, 1, 0.1882353, 1,
-0.3334627, -1.702993, -1.531365, 0, 1, 0.1960784, 1,
-0.331618, -0.3840944, -4.42933, 0, 1, 0.2039216, 1,
-0.3302483, -0.1835514, -4.055454, 0, 1, 0.2078431, 1,
-0.3292481, 0.4396909, -2.332328, 0, 1, 0.2156863, 1,
-0.3249535, 2.312571, 1.704255, 0, 1, 0.2196078, 1,
-0.3224009, -1.712932, -4.519495, 0, 1, 0.227451, 1,
-0.3159949, 0.4778465, -1.066556, 0, 1, 0.2313726, 1,
-0.315482, -0.8536691, -4.220582, 0, 1, 0.2392157, 1,
-0.3149523, 0.5464947, -1.167363, 0, 1, 0.2431373, 1,
-0.3145718, 0.454836, -0.772714, 0, 1, 0.2509804, 1,
-0.3140839, 0.3731673, 1.259718, 0, 1, 0.254902, 1,
-0.3121642, 1.987627, -1.253208, 0, 1, 0.2627451, 1,
-0.3113086, -1.793354, -2.288074, 0, 1, 0.2666667, 1,
-0.3083763, -0.952323, -2.048642, 0, 1, 0.2745098, 1,
-0.3021615, 0.3868669, -0.467768, 0, 1, 0.2784314, 1,
-0.2982655, -0.4487457, -1.923033, 0, 1, 0.2862745, 1,
-0.2958174, 2.033848, 0.6747591, 0, 1, 0.2901961, 1,
-0.2953505, -1.468395, -2.737978, 0, 1, 0.2980392, 1,
-0.2930882, -0.09626752, -0.4699244, 0, 1, 0.3058824, 1,
-0.2866985, 0.05954706, -2.234026, 0, 1, 0.3098039, 1,
-0.2842614, 0.5001602, -0.7731896, 0, 1, 0.3176471, 1,
-0.2814578, -0.3609428, -3.06249, 0, 1, 0.3215686, 1,
-0.2797479, 0.2314731, -1.258359, 0, 1, 0.3294118, 1,
-0.2780191, 2.380851, -2.013193, 0, 1, 0.3333333, 1,
-0.2731511, -1.721932, -3.467415, 0, 1, 0.3411765, 1,
-0.2684916, -0.6947304, -3.729302, 0, 1, 0.345098, 1,
-0.2655716, -0.3625276, -4.765336, 0, 1, 0.3529412, 1,
-0.2539353, 0.4352279, -1.558088, 0, 1, 0.3568628, 1,
-0.2513737, 0.05125056, -1.674235, 0, 1, 0.3647059, 1,
-0.2509169, -0.504523, -2.774267, 0, 1, 0.3686275, 1,
-0.2498325, 0.4493895, -0.1850186, 0, 1, 0.3764706, 1,
-0.2487824, -0.7191638, -1.798738, 0, 1, 0.3803922, 1,
-0.2468459, -1.330556, -1.76197, 0, 1, 0.3882353, 1,
-0.2449737, -0.8256359, 0.6389381, 0, 1, 0.3921569, 1,
-0.2432775, -1.557365, -4.115835, 0, 1, 0.4, 1,
-0.2340134, -1.07383, -3.455213, 0, 1, 0.4078431, 1,
-0.2321985, -0.5861887, -2.126504, 0, 1, 0.4117647, 1,
-0.2249431, 0.513027, 1.87166, 0, 1, 0.4196078, 1,
-0.2135964, -0.3728779, -2.330614, 0, 1, 0.4235294, 1,
-0.2117976, 0.2686754, -0.2368271, 0, 1, 0.4313726, 1,
-0.2109219, 0.1392548, -2.264889, 0, 1, 0.4352941, 1,
-0.2099755, -1.746605, -2.179459, 0, 1, 0.4431373, 1,
-0.2082329, 0.04829837, 0.7827029, 0, 1, 0.4470588, 1,
-0.2055706, -1.427883, -4.219579, 0, 1, 0.454902, 1,
-0.2014118, 0.638064, 0.3820548, 0, 1, 0.4588235, 1,
-0.1987311, -0.7734808, -2.931468, 0, 1, 0.4666667, 1,
-0.1983708, -1.196825, -3.14121, 0, 1, 0.4705882, 1,
-0.1973704, 0.5386245, -1.089711, 0, 1, 0.4784314, 1,
-0.1903531, 1.856049, -1.470764, 0, 1, 0.4823529, 1,
-0.189339, -0.9939483, -2.471513, 0, 1, 0.4901961, 1,
-0.188349, 2.440687, -0.4988761, 0, 1, 0.4941176, 1,
-0.1840806, -0.7311682, -2.023289, 0, 1, 0.5019608, 1,
-0.1796206, 1.009786, -3.212826, 0, 1, 0.509804, 1,
-0.1753893, 0.004170478, -3.799643, 0, 1, 0.5137255, 1,
-0.175309, -0.4607981, -2.134987, 0, 1, 0.5215687, 1,
-0.1720911, -0.8018231, -5.129482, 0, 1, 0.5254902, 1,
-0.1717655, 0.339824, -1.880153, 0, 1, 0.5333334, 1,
-0.1692767, 1.188077, -0.5044215, 0, 1, 0.5372549, 1,
-0.1633851, 0.8701658, -0.4365317, 0, 1, 0.5450981, 1,
-0.1622755, 0.0348321, -0.514035, 0, 1, 0.5490196, 1,
-0.1609282, 0.4285119, -0.4272692, 0, 1, 0.5568628, 1,
-0.1599228, 0.8917785, -0.5271953, 0, 1, 0.5607843, 1,
-0.1598466, -0.3032884, -3.450687, 0, 1, 0.5686275, 1,
-0.159481, -1.290478, -3.246033, 0, 1, 0.572549, 1,
-0.1541609, 0.03060532, -2.770477, 0, 1, 0.5803922, 1,
-0.1521126, 0.7159073, 0.4319497, 0, 1, 0.5843138, 1,
-0.1501069, 1.462081, 0.6939501, 0, 1, 0.5921569, 1,
-0.1495932, -0.363135, -3.36979, 0, 1, 0.5960785, 1,
-0.1447527, -0.8501442, -1.010055, 0, 1, 0.6039216, 1,
-0.1417943, -0.7381796, -3.727508, 0, 1, 0.6117647, 1,
-0.138691, -1.521404, -3.765525, 0, 1, 0.6156863, 1,
-0.1377838, -0.3871842, -1.708773, 0, 1, 0.6235294, 1,
-0.135173, 0.6624888, 0.119284, 0, 1, 0.627451, 1,
-0.134217, -1.811648, -3.664105, 0, 1, 0.6352941, 1,
-0.1308641, -0.07636908, -2.397285, 0, 1, 0.6392157, 1,
-0.1302927, -0.5301988, -4.353376, 0, 1, 0.6470588, 1,
-0.1259183, -0.6783937, -2.30925, 0, 1, 0.6509804, 1,
-0.120797, 0.456721, 0.0473335, 0, 1, 0.6588235, 1,
-0.1206199, 0.3001211, -0.7059001, 0, 1, 0.6627451, 1,
-0.1194085, 1.816511, -1.126214, 0, 1, 0.6705883, 1,
-0.1191271, 1.082234, 0.4151001, 0, 1, 0.6745098, 1,
-0.1168218, -0.2532281, -3.309572, 0, 1, 0.682353, 1,
-0.1151631, 1.275068, 0.05743285, 0, 1, 0.6862745, 1,
-0.1141717, -1.804127, -3.15761, 0, 1, 0.6941177, 1,
-0.1010348, 2.480039, -0.2614673, 0, 1, 0.7019608, 1,
-0.09845613, 0.3351243, 1.085893, 0, 1, 0.7058824, 1,
-0.09823964, 0.7659416, -0.9658931, 0, 1, 0.7137255, 1,
-0.0974654, -0.6945692, -4.277853, 0, 1, 0.7176471, 1,
-0.09596713, 0.1961528, 0.9544465, 0, 1, 0.7254902, 1,
-0.09461171, 0.2026393, -0.8266733, 0, 1, 0.7294118, 1,
-0.09190098, 0.8085791, 0.4250961, 0, 1, 0.7372549, 1,
-0.09047903, 0.9083923, 1.269962, 0, 1, 0.7411765, 1,
-0.08994962, 1.709584, -0.3310914, 0, 1, 0.7490196, 1,
-0.08830535, 1.968242, -0.6944299, 0, 1, 0.7529412, 1,
-0.08692788, -0.8200069, -2.29092, 0, 1, 0.7607843, 1,
-0.08564525, -0.954825, -1.896555, 0, 1, 0.7647059, 1,
-0.08506416, -0.6556823, -3.906576, 0, 1, 0.772549, 1,
-0.08446443, -0.8635015, -2.812576, 0, 1, 0.7764706, 1,
-0.08128751, 1.36393, -0.5744498, 0, 1, 0.7843137, 1,
-0.08086079, -0.7982916, -5.223217, 0, 1, 0.7882353, 1,
-0.080072, 1.870522, 1.874344, 0, 1, 0.7960784, 1,
-0.07827277, -0.09346833, -2.898367, 0, 1, 0.8039216, 1,
-0.07379024, 0.006780049, -3.750397, 0, 1, 0.8078431, 1,
-0.06992395, 1.239799, -0.2013036, 0, 1, 0.8156863, 1,
-0.0661374, 0.5739465, -0.1887625, 0, 1, 0.8196079, 1,
-0.06441311, 1.288982, -1.700576, 0, 1, 0.827451, 1,
-0.06094739, -1.728227, -3.023118, 0, 1, 0.8313726, 1,
-0.05988105, 0.4094785, 0.37583, 0, 1, 0.8392157, 1,
-0.05830437, -1.451733, -3.705817, 0, 1, 0.8431373, 1,
-0.05772017, -1.811048, -2.989228, 0, 1, 0.8509804, 1,
-0.05569608, 0.1440669, -0.2838471, 0, 1, 0.854902, 1,
-0.05422066, 0.2604628, -0.06355541, 0, 1, 0.8627451, 1,
-0.05308094, 1.062169, 1.855728, 0, 1, 0.8666667, 1,
-0.04897406, -1.311294, -3.537563, 0, 1, 0.8745098, 1,
-0.04158545, -1.005281, -4.748157, 0, 1, 0.8784314, 1,
-0.04072594, 1.952599, 0.1412167, 0, 1, 0.8862745, 1,
-0.03913735, 0.6863837, 0.9882155, 0, 1, 0.8901961, 1,
-0.03814259, -0.7587039, -3.296718, 0, 1, 0.8980392, 1,
-0.03517506, 1.597085, 0.4809188, 0, 1, 0.9058824, 1,
-0.03452189, 0.653747, -0.4003116, 0, 1, 0.9098039, 1,
-0.03409393, -0.6901776, -3.765849, 0, 1, 0.9176471, 1,
-0.03317295, -0.7977592, -2.89764, 0, 1, 0.9215686, 1,
-0.03105828, -2.05915, -3.210958, 0, 1, 0.9294118, 1,
-0.0285859, 0.7166677, 0.6152323, 0, 1, 0.9333333, 1,
-0.02672984, -0.09129247, -0.8954172, 0, 1, 0.9411765, 1,
-0.024315, 1.202427, -0.8073344, 0, 1, 0.945098, 1,
-0.0218698, -0.04014966, -4.340223, 0, 1, 0.9529412, 1,
-0.02017316, -1.504792, -3.895146, 0, 1, 0.9568627, 1,
-0.01503341, -1.745388, -2.011998, 0, 1, 0.9647059, 1,
-0.008308733, -0.01679738, -1.2309, 0, 1, 0.9686275, 1,
-0.006536786, -0.3299453, -2.587332, 0, 1, 0.9764706, 1,
-0.001201127, -0.7946205, -3.192602, 0, 1, 0.9803922, 1,
0.005459996, 1.824781, 0.05949005, 0, 1, 0.9882353, 1,
0.00759334, 0.7102042, 1.31251, 0, 1, 0.9921569, 1,
0.01018643, -0.8045363, 2.827675, 0, 1, 1, 1,
0.01387582, 1.458327, 3.539816, 0, 0.9921569, 1, 1,
0.01472739, 1.077488, -0.3260843, 0, 0.9882353, 1, 1,
0.01579695, 0.3492644, 0.8490508, 0, 0.9803922, 1, 1,
0.01867443, -0.475165, 3.360187, 0, 0.9764706, 1, 1,
0.01965664, -1.278912, 3.536139, 0, 0.9686275, 1, 1,
0.02240471, -0.5501732, 4.098904, 0, 0.9647059, 1, 1,
0.02328875, -0.6522531, 2.83503, 0, 0.9568627, 1, 1,
0.02688728, -0.1004766, 3.28732, 0, 0.9529412, 1, 1,
0.02749451, 0.9059206, -1.43026, 0, 0.945098, 1, 1,
0.03008657, -0.3934135, 3.576519, 0, 0.9411765, 1, 1,
0.03046617, 0.2267232, -1.180777, 0, 0.9333333, 1, 1,
0.0347463, -1.321968, 3.215185, 0, 0.9294118, 1, 1,
0.0367315, 0.9944688, 0.635675, 0, 0.9215686, 1, 1,
0.04033878, 1.457543, 0.4864487, 0, 0.9176471, 1, 1,
0.0419046, -0.1895138, 0.6056795, 0, 0.9098039, 1, 1,
0.04623871, 0.9381502, 0.5866759, 0, 0.9058824, 1, 1,
0.04695237, -0.07434767, 3.071651, 0, 0.8980392, 1, 1,
0.04770924, -0.2576875, 4.232037, 0, 0.8901961, 1, 1,
0.0483592, -0.8290355, 3.298601, 0, 0.8862745, 1, 1,
0.04867354, -0.3460872, 3.912707, 0, 0.8784314, 1, 1,
0.05092649, -1.284313, 2.413826, 0, 0.8745098, 1, 1,
0.05624847, -0.7229411, 2.937945, 0, 0.8666667, 1, 1,
0.05709894, -0.1922978, 0.9531206, 0, 0.8627451, 1, 1,
0.06224268, -0.8074971, 3.370484, 0, 0.854902, 1, 1,
0.06288887, 0.3497584, 0.2756992, 0, 0.8509804, 1, 1,
0.0635201, 1.145094, -1.190002, 0, 0.8431373, 1, 1,
0.06465655, -1.592203, 1.870183, 0, 0.8392157, 1, 1,
0.06627476, 0.126793, 1.883724, 0, 0.8313726, 1, 1,
0.06840735, 1.219879, 0.2635163, 0, 0.827451, 1, 1,
0.06885405, -0.9503551, 4.292922, 0, 0.8196079, 1, 1,
0.06972773, -0.004807048, 1.052868, 0, 0.8156863, 1, 1,
0.07094092, -0.7861421, 3.398073, 0, 0.8078431, 1, 1,
0.07571749, -1.437835, 3.559962, 0, 0.8039216, 1, 1,
0.07582165, 0.3836696, 2.013684, 0, 0.7960784, 1, 1,
0.07863294, -1.106015, 3.837027, 0, 0.7882353, 1, 1,
0.07992916, -0.6060907, 2.746268, 0, 0.7843137, 1, 1,
0.08046055, -0.2308697, 3.754797, 0, 0.7764706, 1, 1,
0.08776176, 0.5572108, 0.2573096, 0, 0.772549, 1, 1,
0.09006231, -0.9833169, 3.190905, 0, 0.7647059, 1, 1,
0.09151736, -1.653196, 2.303837, 0, 0.7607843, 1, 1,
0.09222623, -0.7181635, 4.304058, 0, 0.7529412, 1, 1,
0.09292044, -0.6393855, 3.142971, 0, 0.7490196, 1, 1,
0.0961091, -0.6390566, 2.241821, 0, 0.7411765, 1, 1,
0.09839349, 1.189063, -1.002678, 0, 0.7372549, 1, 1,
0.1003766, -1.724977, 2.524803, 0, 0.7294118, 1, 1,
0.1007937, 0.2087479, 0.7748314, 0, 0.7254902, 1, 1,
0.1066686, -0.359554, 4.028249, 0, 0.7176471, 1, 1,
0.1073557, 0.05759277, 2.259001, 0, 0.7137255, 1, 1,
0.1122013, 0.8666555, -0.4536005, 0, 0.7058824, 1, 1,
0.1135992, 0.9513535, 1.649763, 0, 0.6980392, 1, 1,
0.1160585, -0.03591233, 0.1928722, 0, 0.6941177, 1, 1,
0.1177959, -0.8693554, 1.492835, 0, 0.6862745, 1, 1,
0.1206399, -2.264479, 2.863613, 0, 0.682353, 1, 1,
0.1230291, -1.117393, 2.878673, 0, 0.6745098, 1, 1,
0.1237814, 0.1596818, 0.1985375, 0, 0.6705883, 1, 1,
0.1252947, -1.242683, 1.116977, 0, 0.6627451, 1, 1,
0.1267945, -0.4995728, 1.969274, 0, 0.6588235, 1, 1,
0.1345021, -0.9704594, 2.647386, 0, 0.6509804, 1, 1,
0.1400333, 0.852438, 0.235359, 0, 0.6470588, 1, 1,
0.1406533, 0.9632238, 0.2778382, 0, 0.6392157, 1, 1,
0.1410602, -2.251464, 2.984237, 0, 0.6352941, 1, 1,
0.1421036, 0.3487986, -0.03249181, 0, 0.627451, 1, 1,
0.1454637, 1.520388, 0.7398194, 0, 0.6235294, 1, 1,
0.1570668, 0.5206224, -1.176761, 0, 0.6156863, 1, 1,
0.1593195, 0.2786233, 0.4349323, 0, 0.6117647, 1, 1,
0.1656915, 2.904641, 0.3240002, 0, 0.6039216, 1, 1,
0.1674079, -1.53447, 3.151233, 0, 0.5960785, 1, 1,
0.1710356, -0.3656372, 2.406845, 0, 0.5921569, 1, 1,
0.1766893, 0.5963357, 0.02495578, 0, 0.5843138, 1, 1,
0.1783368, -0.7216594, 2.182434, 0, 0.5803922, 1, 1,
0.1795728, -1.203155, 1.347006, 0, 0.572549, 1, 1,
0.1802333, -0.6497198, 3.467855, 0, 0.5686275, 1, 1,
0.1810827, -1.094367, 2.522617, 0, 0.5607843, 1, 1,
0.1835122, 0.7060061, 0.3350827, 0, 0.5568628, 1, 1,
0.183524, 0.7544507, 0.104756, 0, 0.5490196, 1, 1,
0.1841836, -0.834487, 4.138061, 0, 0.5450981, 1, 1,
0.1845481, 0.5168521, 1.125444, 0, 0.5372549, 1, 1,
0.1908866, -1.22892, 3.733653, 0, 0.5333334, 1, 1,
0.2011673, -0.9131945, 2.53584, 0, 0.5254902, 1, 1,
0.2018109, -0.8292201, 2.140766, 0, 0.5215687, 1, 1,
0.2109378, -0.4581299, 2.930986, 0, 0.5137255, 1, 1,
0.211178, 1.517581, -1.321913, 0, 0.509804, 1, 1,
0.2125044, 0.8448712, 0.6560869, 0, 0.5019608, 1, 1,
0.2157178, 0.5905842, -1.363094, 0, 0.4941176, 1, 1,
0.2180345, 0.7173558, 1.64069, 0, 0.4901961, 1, 1,
0.2236193, 0.9627933, 0.05533767, 0, 0.4823529, 1, 1,
0.2237224, 0.1625087, -0.07445377, 0, 0.4784314, 1, 1,
0.2247677, -0.8097531, 2.394374, 0, 0.4705882, 1, 1,
0.2300613, -0.6200091, 2.541856, 0, 0.4666667, 1, 1,
0.2317751, -0.8631924, 3.502181, 0, 0.4588235, 1, 1,
0.2327781, -1.704857, 3.346584, 0, 0.454902, 1, 1,
0.2336454, 0.8622554, 2.358306, 0, 0.4470588, 1, 1,
0.2373156, -0.5225402, 3.234824, 0, 0.4431373, 1, 1,
0.2437851, 0.1972981, 1.746189, 0, 0.4352941, 1, 1,
0.2500993, -0.1985585, 2.776101, 0, 0.4313726, 1, 1,
0.2514342, 0.9217575, -0.6391426, 0, 0.4235294, 1, 1,
0.2546165, 0.0447757, 2.011771, 0, 0.4196078, 1, 1,
0.258274, -0.2727189, 1.68393, 0, 0.4117647, 1, 1,
0.2590272, -1.164322, 2.11675, 0, 0.4078431, 1, 1,
0.2596967, 1.953131, 0.9155369, 0, 0.4, 1, 1,
0.2669848, -0.4622206, 2.541438, 0, 0.3921569, 1, 1,
0.2679993, -1.473867, 2.283384, 0, 0.3882353, 1, 1,
0.2709961, 1.146073, -1.247578, 0, 0.3803922, 1, 1,
0.2725016, -0.5328894, 1.139143, 0, 0.3764706, 1, 1,
0.272898, -1.062912, 3.26198, 0, 0.3686275, 1, 1,
0.2776881, -1.410651, 4.197499, 0, 0.3647059, 1, 1,
0.2793425, 0.132137, 1.892107, 0, 0.3568628, 1, 1,
0.2803037, -0.05282867, 0.9216669, 0, 0.3529412, 1, 1,
0.2812434, 0.2215237, 0.9147537, 0, 0.345098, 1, 1,
0.2818497, 2.262172, -0.5758346, 0, 0.3411765, 1, 1,
0.2861156, -0.4838128, 1.89497, 0, 0.3333333, 1, 1,
0.2924441, -0.1036811, 2.988275, 0, 0.3294118, 1, 1,
0.2935913, 0.7518317, 0.4658262, 0, 0.3215686, 1, 1,
0.2978555, 1.996225, -0.205762, 0, 0.3176471, 1, 1,
0.3002876, -0.6149821, 2.74569, 0, 0.3098039, 1, 1,
0.3035226, -0.6546058, 0.9765909, 0, 0.3058824, 1, 1,
0.3059581, -0.1568402, 1.83119, 0, 0.2980392, 1, 1,
0.3068851, 0.2546602, 1.802815, 0, 0.2901961, 1, 1,
0.3092616, -0.4257225, 0.6171119, 0, 0.2862745, 1, 1,
0.3107553, 1.256724, 0.4838187, 0, 0.2784314, 1, 1,
0.3139195, -0.16391, 2.808004, 0, 0.2745098, 1, 1,
0.3210488, 0.03120527, 0.9696177, 0, 0.2666667, 1, 1,
0.3311315, -0.4441128, 2.880831, 0, 0.2627451, 1, 1,
0.3344912, -0.4565126, 0.7756635, 0, 0.254902, 1, 1,
0.3345198, 0.7711747, -0.433322, 0, 0.2509804, 1, 1,
0.3348364, 1.080432, -0.8777534, 0, 0.2431373, 1, 1,
0.3357191, 1.126541, 0.015348, 0, 0.2392157, 1, 1,
0.3389088, -0.9902906, 3.066902, 0, 0.2313726, 1, 1,
0.3401726, 0.04133384, 2.847808, 0, 0.227451, 1, 1,
0.3425059, 0.9873163, -1.712815, 0, 0.2196078, 1, 1,
0.3536219, -0.05175603, 2.810043, 0, 0.2156863, 1, 1,
0.3537047, -0.8921679, 4.085549, 0, 0.2078431, 1, 1,
0.3543092, 0.5484558, 1.580648, 0, 0.2039216, 1, 1,
0.3571869, -2.069508, 3.776799, 0, 0.1960784, 1, 1,
0.3605007, 0.3455697, 0.9467481, 0, 0.1882353, 1, 1,
0.3611203, -0.9678755, 3.262987, 0, 0.1843137, 1, 1,
0.3618231, -0.6275157, 2.480903, 0, 0.1764706, 1, 1,
0.3632846, -1.026081, 2.630742, 0, 0.172549, 1, 1,
0.3664814, -1.522027, 3.391301, 0, 0.1647059, 1, 1,
0.3686026, 0.6168938, -0.416803, 0, 0.1607843, 1, 1,
0.3740988, 1.861927, 1.617861, 0, 0.1529412, 1, 1,
0.376542, 0.2593651, 0.2051046, 0, 0.1490196, 1, 1,
0.3864419, 0.9037279, 1.203185, 0, 0.1411765, 1, 1,
0.386713, 0.7817864, -0.1024583, 0, 0.1372549, 1, 1,
0.3880315, 1.187194, -0.5077628, 0, 0.1294118, 1, 1,
0.388838, 0.09583659, 1.190316, 0, 0.1254902, 1, 1,
0.3908951, -2.160834, 3.365477, 0, 0.1176471, 1, 1,
0.3914532, -0.600449, 3.14221, 0, 0.1137255, 1, 1,
0.3999105, -0.09649557, 1.143087, 0, 0.1058824, 1, 1,
0.4020784, 1.531068, -1.061893, 0, 0.09803922, 1, 1,
0.4193794, 0.941305, -0.7069917, 0, 0.09411765, 1, 1,
0.4332625, 0.7036275, 0.9440122, 0, 0.08627451, 1, 1,
0.4410687, -0.148536, 1.714831, 0, 0.08235294, 1, 1,
0.4450195, -0.9221574, 2.835592, 0, 0.07450981, 1, 1,
0.4499047, 0.4012232, 1.986395, 0, 0.07058824, 1, 1,
0.4578995, -0.3491837, 1.886329, 0, 0.0627451, 1, 1,
0.4639105, -1.039836, 2.503823, 0, 0.05882353, 1, 1,
0.4661119, -0.5083978, 1.731839, 0, 0.05098039, 1, 1,
0.4718761, -1.497271, 2.496166, 0, 0.04705882, 1, 1,
0.4728337, -0.09685679, 1.776159, 0, 0.03921569, 1, 1,
0.4826058, -2.384775, 1.417493, 0, 0.03529412, 1, 1,
0.4858612, -1.66303, 1.015135, 0, 0.02745098, 1, 1,
0.4860659, 1.528295, -0.3868131, 0, 0.02352941, 1, 1,
0.48808, 0.8648842, 0.9053686, 0, 0.01568628, 1, 1,
0.4882809, 0.6171025, 2.15417, 0, 0.01176471, 1, 1,
0.489213, -0.6247277, 2.299383, 0, 0.003921569, 1, 1,
0.4908172, -0.1811355, 1.710631, 0.003921569, 0, 1, 1,
0.4919004, 0.1681579, -1.103073, 0.007843138, 0, 1, 1,
0.4926844, 0.02388505, 0.6732239, 0.01568628, 0, 1, 1,
0.4939271, 0.7132399, -0.3801599, 0.01960784, 0, 1, 1,
0.495529, -1.42898, 2.928248, 0.02745098, 0, 1, 1,
0.4956815, 1.17138, 1.567097, 0.03137255, 0, 1, 1,
0.5006897, 0.9135221, -0.7731228, 0.03921569, 0, 1, 1,
0.5053749, 0.7197796, 0.003666658, 0.04313726, 0, 1, 1,
0.5068541, -1.52484, 2.903602, 0.05098039, 0, 1, 1,
0.5094019, -0.05798408, 2.573624, 0.05490196, 0, 1, 1,
0.5098987, 0.3057365, 0.188739, 0.0627451, 0, 1, 1,
0.5102904, -1.143481, 2.096575, 0.06666667, 0, 1, 1,
0.5105133, -0.4475016, 1.546511, 0.07450981, 0, 1, 1,
0.512419, 2.146811, 1.325132, 0.07843138, 0, 1, 1,
0.5134469, -0.5772259, 2.983522, 0.08627451, 0, 1, 1,
0.5172069, -1.101427, 3.125804, 0.09019608, 0, 1, 1,
0.525731, -0.3876643, 3.987099, 0.09803922, 0, 1, 1,
0.5273549, -1.211287, 2.386111, 0.1058824, 0, 1, 1,
0.528865, -1.56156, 1.156344, 0.1098039, 0, 1, 1,
0.5324273, 2.013368, 0.3814595, 0.1176471, 0, 1, 1,
0.5372454, -0.4850133, 2.548712, 0.1215686, 0, 1, 1,
0.5388524, 0.1153126, 0.5043942, 0.1294118, 0, 1, 1,
0.5442322, -0.3691332, 1.64775, 0.1333333, 0, 1, 1,
0.5504073, -0.1163422, 1.724696, 0.1411765, 0, 1, 1,
0.5514724, 0.0882956, 2.243265, 0.145098, 0, 1, 1,
0.5530735, 0.9750943, 1.530404, 0.1529412, 0, 1, 1,
0.5534018, 1.656887, 0.7232822, 0.1568628, 0, 1, 1,
0.5538848, -1.948012, 2.052997, 0.1647059, 0, 1, 1,
0.5557405, 0.3892324, -0.6693807, 0.1686275, 0, 1, 1,
0.5566032, 0.0004255894, 1.424366, 0.1764706, 0, 1, 1,
0.5664085, 1.153043, 2.489504, 0.1803922, 0, 1, 1,
0.5664327, -0.6271391, 2.479475, 0.1882353, 0, 1, 1,
0.5692309, 0.5512651, 1.041924, 0.1921569, 0, 1, 1,
0.5696377, -0.09783104, -0.01382745, 0.2, 0, 1, 1,
0.5712339, -0.3976126, 1.986904, 0.2078431, 0, 1, 1,
0.5716942, 0.292946, -0.09625905, 0.2117647, 0, 1, 1,
0.5749288, 0.07024202, 0.990555, 0.2196078, 0, 1, 1,
0.580686, 0.7625172, -0.9602141, 0.2235294, 0, 1, 1,
0.5814291, -0.8862393, 2.457628, 0.2313726, 0, 1, 1,
0.5868816, 0.7351138, 0.9688889, 0.2352941, 0, 1, 1,
0.5883225, -1.644602, 3.465972, 0.2431373, 0, 1, 1,
0.5929182, 0.2319518, 2.024287, 0.2470588, 0, 1, 1,
0.5959156, -0.7653863, 3.609864, 0.254902, 0, 1, 1,
0.6034, 0.484984, 0.8212101, 0.2588235, 0, 1, 1,
0.6063945, 1.183868, 1.01693, 0.2666667, 0, 1, 1,
0.6066895, 0.7789901, 0.2184665, 0.2705882, 0, 1, 1,
0.6177627, 0.1726293, 2.312281, 0.2784314, 0, 1, 1,
0.6200159, 0.5545675, 0.9260582, 0.282353, 0, 1, 1,
0.6202968, -0.850293, 1.606043, 0.2901961, 0, 1, 1,
0.6271399, -0.4972105, 4.070833, 0.2941177, 0, 1, 1,
0.6306174, 0.4752828, 4.101506, 0.3019608, 0, 1, 1,
0.6308184, -0.8110558, 2.235427, 0.3098039, 0, 1, 1,
0.6311711, -0.3603669, 0.2530596, 0.3137255, 0, 1, 1,
0.6313634, -0.3708861, 1.044993, 0.3215686, 0, 1, 1,
0.6325151, -1.334212, 1.697927, 0.3254902, 0, 1, 1,
0.6359556, -0.4412262, 1.518515, 0.3333333, 0, 1, 1,
0.6393153, 0.2524954, 2.835821, 0.3372549, 0, 1, 1,
0.6465105, -0.2782343, 2.254537, 0.345098, 0, 1, 1,
0.6471952, -0.02443475, 1.564889, 0.3490196, 0, 1, 1,
0.6481082, -0.6151271, 2.671339, 0.3568628, 0, 1, 1,
0.6547372, -0.4424738, 1.857135, 0.3607843, 0, 1, 1,
0.6547998, 0.006424536, 1.57839, 0.3686275, 0, 1, 1,
0.6579059, 1.936688, 2.540197, 0.372549, 0, 1, 1,
0.6613182, -1.67114, 2.784374, 0.3803922, 0, 1, 1,
0.6637734, 0.1358183, 2.971823, 0.3843137, 0, 1, 1,
0.6659852, -0.4613441, 4.094661, 0.3921569, 0, 1, 1,
0.6704257, 0.405033, 1.528209, 0.3960784, 0, 1, 1,
0.6711915, -1.017871, 3.62588, 0.4039216, 0, 1, 1,
0.6721923, -2.634563, 3.161551, 0.4117647, 0, 1, 1,
0.6763769, 0.7141142, -1.049171, 0.4156863, 0, 1, 1,
0.6787424, -0.2892682, 2.125809, 0.4235294, 0, 1, 1,
0.6792119, 0.5684565, -0.3650456, 0.427451, 0, 1, 1,
0.679247, 0.1102141, 1.874336, 0.4352941, 0, 1, 1,
0.6832272, -0.9452409, 2.12552, 0.4392157, 0, 1, 1,
0.6900299, -0.3471708, 2.624669, 0.4470588, 0, 1, 1,
0.6930526, 0.1417494, 2.301198, 0.4509804, 0, 1, 1,
0.6935732, -0.1848404, 0.1753392, 0.4588235, 0, 1, 1,
0.6980411, -1.394806, 3.337611, 0.4627451, 0, 1, 1,
0.6987867, -0.02863053, 2.096369, 0.4705882, 0, 1, 1,
0.7067425, 0.1815716, -0.8047671, 0.4745098, 0, 1, 1,
0.7072883, -0.1323183, 1.735681, 0.4823529, 0, 1, 1,
0.7143422, -1.47175, 1.345966, 0.4862745, 0, 1, 1,
0.7174725, -0.6850958, 1.25676, 0.4941176, 0, 1, 1,
0.71749, -0.5272361, 1.151698, 0.5019608, 0, 1, 1,
0.7197682, 0.3694358, 1.377145, 0.5058824, 0, 1, 1,
0.7206112, 0.2479964, 3.181786, 0.5137255, 0, 1, 1,
0.7255611, 1.786892, -1.010368, 0.5176471, 0, 1, 1,
0.7260203, -1.366395, 4.256383, 0.5254902, 0, 1, 1,
0.727582, 0.37231, 1.718173, 0.5294118, 0, 1, 1,
0.7283809, 1.858142, 0.5688922, 0.5372549, 0, 1, 1,
0.7306704, -0.2263453, 2.200954, 0.5411765, 0, 1, 1,
0.7326025, 0.9386349, 2.771198, 0.5490196, 0, 1, 1,
0.7369425, 0.5656638, 1.446738, 0.5529412, 0, 1, 1,
0.7377372, 1.536442, 1.415025, 0.5607843, 0, 1, 1,
0.7477617, 0.6318874, -0.3474002, 0.5647059, 0, 1, 1,
0.7496515, 0.8292058, 0.9844634, 0.572549, 0, 1, 1,
0.7520829, -0.5878525, 4.047159, 0.5764706, 0, 1, 1,
0.7535796, 2.221366, 0.9356632, 0.5843138, 0, 1, 1,
0.754153, -0.6479579, 0.3548356, 0.5882353, 0, 1, 1,
0.7602984, 0.1870983, 2.723196, 0.5960785, 0, 1, 1,
0.761306, -0.8926708, 2.671425, 0.6039216, 0, 1, 1,
0.7614976, 1.004784, 0.98787, 0.6078432, 0, 1, 1,
0.7644668, 0.3339807, 1.206149, 0.6156863, 0, 1, 1,
0.7656987, 0.01554007, 1.811282, 0.6196079, 0, 1, 1,
0.7661248, -1.849672, 3.092794, 0.627451, 0, 1, 1,
0.7751446, 0.406278, 2.239565, 0.6313726, 0, 1, 1,
0.7778371, -1.168646, 3.152178, 0.6392157, 0, 1, 1,
0.7781178, -0.07269389, 1.995608, 0.6431373, 0, 1, 1,
0.779794, 0.7366714, 0.7595687, 0.6509804, 0, 1, 1,
0.7817003, -1.750423, 3.386551, 0.654902, 0, 1, 1,
0.7818869, -0.5378085, 2.751433, 0.6627451, 0, 1, 1,
0.7821875, -0.2855478, 2.63237, 0.6666667, 0, 1, 1,
0.7831743, 2.603883, 1.456914, 0.6745098, 0, 1, 1,
0.7838861, -0.2884159, 3.541637, 0.6784314, 0, 1, 1,
0.7905278, -1.978436, 1.626369, 0.6862745, 0, 1, 1,
0.7988705, 2.590477, 2.078484, 0.6901961, 0, 1, 1,
0.8042678, -2.329642, 4.215064, 0.6980392, 0, 1, 1,
0.8072611, 0.4587869, 1.929393, 0.7058824, 0, 1, 1,
0.8096266, -0.900929, 3.075361, 0.7098039, 0, 1, 1,
0.8121016, 1.597216, 1.036375, 0.7176471, 0, 1, 1,
0.815869, 1.691649, -0.6847735, 0.7215686, 0, 1, 1,
0.8160865, 1.054908, 1.030459, 0.7294118, 0, 1, 1,
0.8195273, 0.8324036, 0.6086971, 0.7333333, 0, 1, 1,
0.8295053, -0.153519, 0.9676611, 0.7411765, 0, 1, 1,
0.8337505, -1.027944, 3.381198, 0.7450981, 0, 1, 1,
0.8351449, 0.05288195, 1.224189, 0.7529412, 0, 1, 1,
0.8352671, 0.08787982, 0.82234, 0.7568628, 0, 1, 1,
0.8389902, 0.4919464, 0.7834296, 0.7647059, 0, 1, 1,
0.8418261, 0.7353374, 2.094138, 0.7686275, 0, 1, 1,
0.8436379, -0.3395841, 2.56882, 0.7764706, 0, 1, 1,
0.8439071, 0.2970912, -0.2241828, 0.7803922, 0, 1, 1,
0.8483729, -0.3924805, 0.7362576, 0.7882353, 0, 1, 1,
0.8485802, 0.4712925, 0.8632837, 0.7921569, 0, 1, 1,
0.8492508, -0.5179071, 1.530452, 0.8, 0, 1, 1,
0.8532121, 0.1740137, 3.295113, 0.8078431, 0, 1, 1,
0.8636418, 0.681875, 0.3598104, 0.8117647, 0, 1, 1,
0.864226, 0.9668545, 1.728734, 0.8196079, 0, 1, 1,
0.8650811, -0.7651186, 2.300013, 0.8235294, 0, 1, 1,
0.8663256, -1.766781, 3.03687, 0.8313726, 0, 1, 1,
0.8676514, -0.6344402, 1.763703, 0.8352941, 0, 1, 1,
0.8703626, -0.1855858, 2.202014, 0.8431373, 0, 1, 1,
0.8749171, -0.6561328, 3.614955, 0.8470588, 0, 1, 1,
0.8773019, 2.118259, -1.238156, 0.854902, 0, 1, 1,
0.877304, 0.9836324, 2.37308, 0.8588235, 0, 1, 1,
0.8852752, -0.03018583, 1.893231, 0.8666667, 0, 1, 1,
0.8860623, -1.731664, 2.531412, 0.8705882, 0, 1, 1,
0.8873094, 0.8579826, -0.6193828, 0.8784314, 0, 1, 1,
0.8927928, -0.9716754, 1.083555, 0.8823529, 0, 1, 1,
0.8942963, -1.661571, 1.704643, 0.8901961, 0, 1, 1,
0.8981601, 0.1775123, 0.8288878, 0.8941177, 0, 1, 1,
0.8982474, 0.6704403, 1.319449, 0.9019608, 0, 1, 1,
0.905236, -1.291255, 0.8612202, 0.9098039, 0, 1, 1,
0.9091248, -0.5295347, 3.958221, 0.9137255, 0, 1, 1,
0.9151481, 0.877578, 0.465874, 0.9215686, 0, 1, 1,
0.9161963, -0.6532747, 2.093751, 0.9254902, 0, 1, 1,
0.9180775, 0.9181898, -0.5116891, 0.9333333, 0, 1, 1,
0.9188557, -1.171587, 3.756877, 0.9372549, 0, 1, 1,
0.9220209, -1.14737, 0.3036955, 0.945098, 0, 1, 1,
0.9331984, -2.055643, 1.48111, 0.9490196, 0, 1, 1,
0.9338969, 1.925285, 1.197164, 0.9568627, 0, 1, 1,
0.935253, 0.1158092, 0.8799662, 0.9607843, 0, 1, 1,
0.936377, -0.6158814, 3.574478, 0.9686275, 0, 1, 1,
0.9383604, -0.3125197, 3.349231, 0.972549, 0, 1, 1,
0.9392931, 0.2705368, 2.049294, 0.9803922, 0, 1, 1,
0.9410582, -0.06456364, 1.175234, 0.9843137, 0, 1, 1,
0.9453409, 0.1450496, 3.83942, 0.9921569, 0, 1, 1,
0.9505823, -3.274882, 1.269344, 0.9960784, 0, 1, 1,
0.9618716, 0.619364, 0.6029681, 1, 0, 0.9960784, 1,
0.9671819, 0.5703311, 0.5588843, 1, 0, 0.9882353, 1,
0.9720165, 0.9859596, -0.3626604, 1, 0, 0.9843137, 1,
0.991849, 0.02967525, 1.716559, 1, 0, 0.9764706, 1,
0.9930233, 1.021097, 2.082552, 1, 0, 0.972549, 1,
0.9988852, -1.717855, 3.128623, 1, 0, 0.9647059, 1,
1.001896, 0.287038, 2.250631, 1, 0, 0.9607843, 1,
1.00445, -0.5749558, 1.75534, 1, 0, 0.9529412, 1,
1.015296, -0.4976539, 3.242193, 1, 0, 0.9490196, 1,
1.01768, 0.5342316, -0.04024493, 1, 0, 0.9411765, 1,
1.018478, 0.5676581, 0.9032096, 1, 0, 0.9372549, 1,
1.021325, 0.1844826, 0.4101276, 1, 0, 0.9294118, 1,
1.028805, 1.414917, 1.586922, 1, 0, 0.9254902, 1,
1.038867, 2.181665, 1.917678, 1, 0, 0.9176471, 1,
1.039934, 0.01302128, 1.799276, 1, 0, 0.9137255, 1,
1.041108, -1.487447, 3.9158, 1, 0, 0.9058824, 1,
1.043762, 0.5044839, 1.134132, 1, 0, 0.9019608, 1,
1.050383, 0.8344575, 0.7317954, 1, 0, 0.8941177, 1,
1.057523, -0.7873935, 0.5255908, 1, 0, 0.8862745, 1,
1.059995, 1.727955, -0.3442352, 1, 0, 0.8823529, 1,
1.063689, -0.7098307, 2.128903, 1, 0, 0.8745098, 1,
1.07046, 1.469885, 2.005346, 1, 0, 0.8705882, 1,
1.074669, 0.8659439, -0.07961439, 1, 0, 0.8627451, 1,
1.076157, 0.1928566, -0.3016579, 1, 0, 0.8588235, 1,
1.077325, -0.2338117, 1.497686, 1, 0, 0.8509804, 1,
1.078161, -0.7390782, 2.705244, 1, 0, 0.8470588, 1,
1.079008, 0.6249886, -0.5981873, 1, 0, 0.8392157, 1,
1.079812, -1.639593, 1.727868, 1, 0, 0.8352941, 1,
1.084015, 1.213174, -0.3895767, 1, 0, 0.827451, 1,
1.085062, -0.03796187, 0.9335595, 1, 0, 0.8235294, 1,
1.088945, -0.6804026, 1.837087, 1, 0, 0.8156863, 1,
1.090006, 0.6370909, 2.134996, 1, 0, 0.8117647, 1,
1.093486, -0.1455546, 1.429759, 1, 0, 0.8039216, 1,
1.094803, 0.4089793, 0.8313174, 1, 0, 0.7960784, 1,
1.097575, -1.230862, 2.418914, 1, 0, 0.7921569, 1,
1.110312, -0.6447526, -0.1025681, 1, 0, 0.7843137, 1,
1.113808, -1.410321, 4.615324, 1, 0, 0.7803922, 1,
1.114341, -1.953086, 0.7837614, 1, 0, 0.772549, 1,
1.115635, 0.05966146, 1.141174, 1, 0, 0.7686275, 1,
1.126539, 1.523272, 0.5843638, 1, 0, 0.7607843, 1,
1.138631, -0.8605583, 1.118889, 1, 0, 0.7568628, 1,
1.141219, 0.8126665, 0.3903717, 1, 0, 0.7490196, 1,
1.153543, 0.3913428, 0.4229481, 1, 0, 0.7450981, 1,
1.163885, 0.6189403, 0.4313065, 1, 0, 0.7372549, 1,
1.170233, -1.85297, 2.797744, 1, 0, 0.7333333, 1,
1.182915, -0.8679506, 4.105741, 1, 0, 0.7254902, 1,
1.193736, -0.470778, 3.393934, 1, 0, 0.7215686, 1,
1.196009, -0.2454671, 1.793503, 1, 0, 0.7137255, 1,
1.197342, 0.2391667, 1.352871, 1, 0, 0.7098039, 1,
1.203718, -0.04682472, -0.3289365, 1, 0, 0.7019608, 1,
1.206361, -0.1117879, 2.445625, 1, 0, 0.6941177, 1,
1.214214, -0.997248, 2.206685, 1, 0, 0.6901961, 1,
1.215412, 0.5508333, 0.6023172, 1, 0, 0.682353, 1,
1.216669, -0.6469487, 2.391574, 1, 0, 0.6784314, 1,
1.225726, 0.6177899, 0.733055, 1, 0, 0.6705883, 1,
1.233821, 0.598056, 1.360903, 1, 0, 0.6666667, 1,
1.246471, 1.689294, 1.187246, 1, 0, 0.6588235, 1,
1.247611, 1.861929, -0.6639439, 1, 0, 0.654902, 1,
1.249047, -0.5032889, 1.54013, 1, 0, 0.6470588, 1,
1.267043, -1.315472, 4.081318, 1, 0, 0.6431373, 1,
1.269875, -0.3563916, 1.59578, 1, 0, 0.6352941, 1,
1.272659, 1.102131, 1.719635, 1, 0, 0.6313726, 1,
1.280297, 0.4619233, -1.103821, 1, 0, 0.6235294, 1,
1.281335, -0.3447624, 4.090137, 1, 0, 0.6196079, 1,
1.281533, 0.1986067, 1.765006, 1, 0, 0.6117647, 1,
1.287517, 0.8645831, 2.023026, 1, 0, 0.6078432, 1,
1.289623, 2.077342, -0.3147658, 1, 0, 0.6, 1,
1.295202, -0.1615927, 3.094542, 1, 0, 0.5921569, 1,
1.295654, 0.3301418, 1.438945, 1, 0, 0.5882353, 1,
1.296891, -0.2852136, 0.07298113, 1, 0, 0.5803922, 1,
1.300997, -1.949313, 0.7817364, 1, 0, 0.5764706, 1,
1.302068, 0.9041263, 0.9591885, 1, 0, 0.5686275, 1,
1.310704, -0.9078794, 2.333524, 1, 0, 0.5647059, 1,
1.311255, 1.84577, 0.1638831, 1, 0, 0.5568628, 1,
1.314349, -0.2481674, 3.326152, 1, 0, 0.5529412, 1,
1.319854, -0.03708844, 2.44417, 1, 0, 0.5450981, 1,
1.328054, -0.3096465, -0.2863729, 1, 0, 0.5411765, 1,
1.332615, 0.3654721, 1.472648, 1, 0, 0.5333334, 1,
1.336165, 0.6176272, 0.7857317, 1, 0, 0.5294118, 1,
1.337741, -1.217968, 1.184931, 1, 0, 0.5215687, 1,
1.338873, -0.8892685, 3.013321, 1, 0, 0.5176471, 1,
1.343948, -0.1976105, 1.593757, 1, 0, 0.509804, 1,
1.34462, -1.808311, 2.114846, 1, 0, 0.5058824, 1,
1.34677, 0.2582061, 1.905679, 1, 0, 0.4980392, 1,
1.347287, -0.5412045, 2.056341, 1, 0, 0.4901961, 1,
1.350847, -0.7396275, 3.171654, 1, 0, 0.4862745, 1,
1.373342, -0.2057721, 2.892154, 1, 0, 0.4784314, 1,
1.373961, -0.1032475, 0.4381974, 1, 0, 0.4745098, 1,
1.374619, 1.418167, 1.19673, 1, 0, 0.4666667, 1,
1.375565, 1.330456, 2.119936, 1, 0, 0.4627451, 1,
1.377467, 0.04093413, 2.896915, 1, 0, 0.454902, 1,
1.395153, 2.098115, -0.9094844, 1, 0, 0.4509804, 1,
1.397176, 0.1266352, 2.998527, 1, 0, 0.4431373, 1,
1.40631, 1.125443, 0.2630677, 1, 0, 0.4392157, 1,
1.415627, 0.2689182, 1.839122, 1, 0, 0.4313726, 1,
1.426269, 0.7115694, 1.515102, 1, 0, 0.427451, 1,
1.441044, -0.0144103, -0.1152959, 1, 0, 0.4196078, 1,
1.463235, 1.476648, -0.2035626, 1, 0, 0.4156863, 1,
1.509562, -0.3219467, 1.419238, 1, 0, 0.4078431, 1,
1.530189, 0.3189141, 3.268315, 1, 0, 0.4039216, 1,
1.53386, -0.07077846, 1.191707, 1, 0, 0.3960784, 1,
1.5352, 0.3024148, 1.199211, 1, 0, 0.3882353, 1,
1.538283, -1.280806, 1.555354, 1, 0, 0.3843137, 1,
1.551433, 0.2231975, 1.778656, 1, 0, 0.3764706, 1,
1.575128, -0.1509066, 0.8064216, 1, 0, 0.372549, 1,
1.579771, -0.3014512, 1.115058, 1, 0, 0.3647059, 1,
1.5857, -1.995248, 2.618385, 1, 0, 0.3607843, 1,
1.596548, -0.3805656, 1.383183, 1, 0, 0.3529412, 1,
1.598784, 1.13392, -0.05045861, 1, 0, 0.3490196, 1,
1.603546, -0.7811326, 2.275458, 1, 0, 0.3411765, 1,
1.604775, -0.8226267, 3.181644, 1, 0, 0.3372549, 1,
1.607595, 1.756812, 2.547821, 1, 0, 0.3294118, 1,
1.619208, -1.179734, 1.686069, 1, 0, 0.3254902, 1,
1.620762, -1.07687, 2.916904, 1, 0, 0.3176471, 1,
1.622587, -0.5818163, -0.9752734, 1, 0, 0.3137255, 1,
1.625759, -0.1573927, 0.5832965, 1, 0, 0.3058824, 1,
1.631889, 0.4828771, 0.7058609, 1, 0, 0.2980392, 1,
1.633486, -0.4394765, -0.1006022, 1, 0, 0.2941177, 1,
1.642129, 0.3349116, 0.8278513, 1, 0, 0.2862745, 1,
1.668246, -1.153963, 2.480208, 1, 0, 0.282353, 1,
1.687951, -0.5534935, 0.7845736, 1, 0, 0.2745098, 1,
1.690722, 1.273956, 0.5336053, 1, 0, 0.2705882, 1,
1.714701, 0.7540454, 2.08692, 1, 0, 0.2627451, 1,
1.721008, 0.2473524, 1.58168, 1, 0, 0.2588235, 1,
1.721387, 0.5575545, 1.387551, 1, 0, 0.2509804, 1,
1.725151, 2.915367, 0.03007827, 1, 0, 0.2470588, 1,
1.736923, -1.423571, 1.620851, 1, 0, 0.2392157, 1,
1.746791, -0.2506959, 1.75066, 1, 0, 0.2352941, 1,
1.759401, 0.8035139, 1.286897, 1, 0, 0.227451, 1,
1.76829, -0.2671341, 1.862113, 1, 0, 0.2235294, 1,
1.779644, 1.006144, 0.5595837, 1, 0, 0.2156863, 1,
1.805131, -0.7997773, 2.356269, 1, 0, 0.2117647, 1,
1.822972, -1.245671, 3.29106, 1, 0, 0.2039216, 1,
1.827721, 1.376256, 2.249849, 1, 0, 0.1960784, 1,
1.833127, 0.88286, 0.1186681, 1, 0, 0.1921569, 1,
1.893533, -0.9182096, 3.476838, 1, 0, 0.1843137, 1,
1.937285, -0.486897, 1.676122, 1, 0, 0.1803922, 1,
1.95387, 0.8669811, 3.015007, 1, 0, 0.172549, 1,
1.954099, 1.585628, 2.090337, 1, 0, 0.1686275, 1,
1.955975, -1.119377, 1.753961, 1, 0, 0.1607843, 1,
1.96294, 0.3094976, -0.01125688, 1, 0, 0.1568628, 1,
1.963684, -1.892748, 3.071642, 1, 0, 0.1490196, 1,
1.965687, -0.9161665, 0.681289, 1, 0, 0.145098, 1,
1.967511, 0.676002, 2.506854, 1, 0, 0.1372549, 1,
1.975596, -0.1296569, 3.926274, 1, 0, 0.1333333, 1,
1.980939, -1.005446, 1.704768, 1, 0, 0.1254902, 1,
1.98495, 1.111341, 2.088197, 1, 0, 0.1215686, 1,
1.995078, -0.2718056, 2.217618, 1, 0, 0.1137255, 1,
2.028753, -1.937258, 2.52309, 1, 0, 0.1098039, 1,
2.040019, 0.89504, 0.5758677, 1, 0, 0.1019608, 1,
2.060441, 0.2466451, 1.612617, 1, 0, 0.09411765, 1,
2.154028, -1.3495, 1.689835, 1, 0, 0.09019608, 1,
2.168159, 0.3992858, 2.46555, 1, 0, 0.08235294, 1,
2.182572, -2.241628, 3.470639, 1, 0, 0.07843138, 1,
2.185281, 0.3416787, 2.470305, 1, 0, 0.07058824, 1,
2.246386, -0.9329413, 3.669923, 1, 0, 0.06666667, 1,
2.307975, 0.2066336, -0.3482856, 1, 0, 0.05882353, 1,
2.354465, -0.3240832, 3.496723, 1, 0, 0.05490196, 1,
2.374698, 0.6264815, 3.41755, 1, 0, 0.04705882, 1,
2.394328, 0.5196481, 2.931385, 1, 0, 0.04313726, 1,
2.433863, -0.1015072, 2.640232, 1, 0, 0.03529412, 1,
2.441271, 0.2933729, 2.764198, 1, 0, 0.03137255, 1,
2.454863, 0.5165851, 1.550067, 1, 0, 0.02352941, 1,
2.464557, 1.888776, 2.171763, 1, 0, 0.01960784, 1,
2.484338, -2.270004, 2.815329, 1, 0, 0.01176471, 1,
3.158182, -1.212101, 2.817783, 1, 0, 0.007843138, 1
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
-0.118471, -4.32413, -6.89085, 0, -0.5, 0.5, 0.5,
-0.118471, -4.32413, -6.89085, 1, -0.5, 0.5, 0.5,
-0.118471, -4.32413, -6.89085, 1, 1.5, 0.5, 0.5,
-0.118471, -4.32413, -6.89085, 0, 1.5, 0.5, 0.5
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
-4.505909, -0.1797577, -6.89085, 0, -0.5, 0.5, 0.5,
-4.505909, -0.1797577, -6.89085, 1, -0.5, 0.5, 0.5,
-4.505909, -0.1797577, -6.89085, 1, 1.5, 0.5, 0.5,
-4.505909, -0.1797577, -6.89085, 0, 1.5, 0.5, 0.5
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
-4.505909, -4.32413, -0.3039463, 0, -0.5, 0.5, 0.5,
-4.505909, -4.32413, -0.3039463, 1, -0.5, 0.5, 0.5,
-4.505909, -4.32413, -0.3039463, 1, 1.5, 0.5, 0.5,
-4.505909, -4.32413, -0.3039463, 0, 1.5, 0.5, 0.5
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
-3, -3.367736, -5.370795,
3, -3.367736, -5.370795,
-3, -3.367736, -5.370795,
-3, -3.527135, -5.624137,
-2, -3.367736, -5.370795,
-2, -3.527135, -5.624137,
-1, -3.367736, -5.370795,
-1, -3.527135, -5.624137,
0, -3.367736, -5.370795,
0, -3.527135, -5.624137,
1, -3.367736, -5.370795,
1, -3.527135, -5.624137,
2, -3.367736, -5.370795,
2, -3.527135, -5.624137,
3, -3.367736, -5.370795,
3, -3.527135, -5.624137
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
-3, -3.845933, -6.130823, 0, -0.5, 0.5, 0.5,
-3, -3.845933, -6.130823, 1, -0.5, 0.5, 0.5,
-3, -3.845933, -6.130823, 1, 1.5, 0.5, 0.5,
-3, -3.845933, -6.130823, 0, 1.5, 0.5, 0.5,
-2, -3.845933, -6.130823, 0, -0.5, 0.5, 0.5,
-2, -3.845933, -6.130823, 1, -0.5, 0.5, 0.5,
-2, -3.845933, -6.130823, 1, 1.5, 0.5, 0.5,
-2, -3.845933, -6.130823, 0, 1.5, 0.5, 0.5,
-1, -3.845933, -6.130823, 0, -0.5, 0.5, 0.5,
-1, -3.845933, -6.130823, 1, -0.5, 0.5, 0.5,
-1, -3.845933, -6.130823, 1, 1.5, 0.5, 0.5,
-1, -3.845933, -6.130823, 0, 1.5, 0.5, 0.5,
0, -3.845933, -6.130823, 0, -0.5, 0.5, 0.5,
0, -3.845933, -6.130823, 1, -0.5, 0.5, 0.5,
0, -3.845933, -6.130823, 1, 1.5, 0.5, 0.5,
0, -3.845933, -6.130823, 0, 1.5, 0.5, 0.5,
1, -3.845933, -6.130823, 0, -0.5, 0.5, 0.5,
1, -3.845933, -6.130823, 1, -0.5, 0.5, 0.5,
1, -3.845933, -6.130823, 1, 1.5, 0.5, 0.5,
1, -3.845933, -6.130823, 0, 1.5, 0.5, 0.5,
2, -3.845933, -6.130823, 0, -0.5, 0.5, 0.5,
2, -3.845933, -6.130823, 1, -0.5, 0.5, 0.5,
2, -3.845933, -6.130823, 1, 1.5, 0.5, 0.5,
2, -3.845933, -6.130823, 0, 1.5, 0.5, 0.5,
3, -3.845933, -6.130823, 0, -0.5, 0.5, 0.5,
3, -3.845933, -6.130823, 1, -0.5, 0.5, 0.5,
3, -3.845933, -6.130823, 1, 1.5, 0.5, 0.5,
3, -3.845933, -6.130823, 0, 1.5, 0.5, 0.5
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
-3.493424, -3, -5.370795,
-3.493424, 2, -5.370795,
-3.493424, -3, -5.370795,
-3.662171, -3, -5.624137,
-3.493424, -2, -5.370795,
-3.662171, -2, -5.624137,
-3.493424, -1, -5.370795,
-3.662171, -1, -5.624137,
-3.493424, 0, -5.370795,
-3.662171, 0, -5.624137,
-3.493424, 1, -5.370795,
-3.662171, 1, -5.624137,
-3.493424, 2, -5.370795,
-3.662171, 2, -5.624137
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
-3.999667, -3, -6.130823, 0, -0.5, 0.5, 0.5,
-3.999667, -3, -6.130823, 1, -0.5, 0.5, 0.5,
-3.999667, -3, -6.130823, 1, 1.5, 0.5, 0.5,
-3.999667, -3, -6.130823, 0, 1.5, 0.5, 0.5,
-3.999667, -2, -6.130823, 0, -0.5, 0.5, 0.5,
-3.999667, -2, -6.130823, 1, -0.5, 0.5, 0.5,
-3.999667, -2, -6.130823, 1, 1.5, 0.5, 0.5,
-3.999667, -2, -6.130823, 0, 1.5, 0.5, 0.5,
-3.999667, -1, -6.130823, 0, -0.5, 0.5, 0.5,
-3.999667, -1, -6.130823, 1, -0.5, 0.5, 0.5,
-3.999667, -1, -6.130823, 1, 1.5, 0.5, 0.5,
-3.999667, -1, -6.130823, 0, 1.5, 0.5, 0.5,
-3.999667, 0, -6.130823, 0, -0.5, 0.5, 0.5,
-3.999667, 0, -6.130823, 1, -0.5, 0.5, 0.5,
-3.999667, 0, -6.130823, 1, 1.5, 0.5, 0.5,
-3.999667, 0, -6.130823, 0, 1.5, 0.5, 0.5,
-3.999667, 1, -6.130823, 0, -0.5, 0.5, 0.5,
-3.999667, 1, -6.130823, 1, -0.5, 0.5, 0.5,
-3.999667, 1, -6.130823, 1, 1.5, 0.5, 0.5,
-3.999667, 1, -6.130823, 0, 1.5, 0.5, 0.5,
-3.999667, 2, -6.130823, 0, -0.5, 0.5, 0.5,
-3.999667, 2, -6.130823, 1, -0.5, 0.5, 0.5,
-3.999667, 2, -6.130823, 1, 1.5, 0.5, 0.5,
-3.999667, 2, -6.130823, 0, 1.5, 0.5, 0.5
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
-3.493424, -3.367736, -4,
-3.493424, -3.367736, 4,
-3.493424, -3.367736, -4,
-3.662171, -3.527135, -4,
-3.493424, -3.367736, -2,
-3.662171, -3.527135, -2,
-3.493424, -3.367736, 0,
-3.662171, -3.527135, 0,
-3.493424, -3.367736, 2,
-3.662171, -3.527135, 2,
-3.493424, -3.367736, 4,
-3.662171, -3.527135, 4
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
-3.999667, -3.845933, -4, 0, -0.5, 0.5, 0.5,
-3.999667, -3.845933, -4, 1, -0.5, 0.5, 0.5,
-3.999667, -3.845933, -4, 1, 1.5, 0.5, 0.5,
-3.999667, -3.845933, -4, 0, 1.5, 0.5, 0.5,
-3.999667, -3.845933, -2, 0, -0.5, 0.5, 0.5,
-3.999667, -3.845933, -2, 1, -0.5, 0.5, 0.5,
-3.999667, -3.845933, -2, 1, 1.5, 0.5, 0.5,
-3.999667, -3.845933, -2, 0, 1.5, 0.5, 0.5,
-3.999667, -3.845933, 0, 0, -0.5, 0.5, 0.5,
-3.999667, -3.845933, 0, 1, -0.5, 0.5, 0.5,
-3.999667, -3.845933, 0, 1, 1.5, 0.5, 0.5,
-3.999667, -3.845933, 0, 0, 1.5, 0.5, 0.5,
-3.999667, -3.845933, 2, 0, -0.5, 0.5, 0.5,
-3.999667, -3.845933, 2, 1, -0.5, 0.5, 0.5,
-3.999667, -3.845933, 2, 1, 1.5, 0.5, 0.5,
-3.999667, -3.845933, 2, 0, 1.5, 0.5, 0.5,
-3.999667, -3.845933, 4, 0, -0.5, 0.5, 0.5,
-3.999667, -3.845933, 4, 1, -0.5, 0.5, 0.5,
-3.999667, -3.845933, 4, 1, 1.5, 0.5, 0.5,
-3.999667, -3.845933, 4, 0, 1.5, 0.5, 0.5
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
-3.493424, -3.367736, -5.370795,
-3.493424, 3.008221, -5.370795,
-3.493424, -3.367736, 4.762903,
-3.493424, 3.008221, 4.762903,
-3.493424, -3.367736, -5.370795,
-3.493424, -3.367736, 4.762903,
-3.493424, 3.008221, -5.370795,
-3.493424, 3.008221, 4.762903,
-3.493424, -3.367736, -5.370795,
3.256482, -3.367736, -5.370795,
-3.493424, -3.367736, 4.762903,
3.256482, -3.367736, 4.762903,
-3.493424, 3.008221, -5.370795,
3.256482, 3.008221, -5.370795,
-3.493424, 3.008221, 4.762903,
3.256482, 3.008221, 4.762903,
3.256482, -3.367736, -5.370795,
3.256482, 3.008221, -5.370795,
3.256482, -3.367736, 4.762903,
3.256482, 3.008221, 4.762903,
3.256482, -3.367736, -5.370795,
3.256482, -3.367736, 4.762903,
3.256482, 3.008221, -5.370795,
3.256482, 3.008221, 4.762903
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
var radius = 7.339191;
var distance = 32.65289;
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
mvMatrix.translate( 0.118471, 0.1797577, 0.3039463 );
mvMatrix.scale( 1.175613, 1.244563, 0.7830584 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.65289);
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
ferbam<-read.table("ferbam.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ferbam$V2
```

```
## Error in eval(expr, envir, enclos): object 'ferbam' not found
```

```r
y<-ferbam$V3
```

```
## Error in eval(expr, envir, enclos): object 'ferbam' not found
```

```r
z<-ferbam$V4
```

```
## Error in eval(expr, envir, enclos): object 'ferbam' not found
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
-3.395124, 1.109717, -0.732731, 0, 0, 1, 1, 1,
-3.074532, -1.554261, -3.058994, 1, 0, 0, 1, 1,
-3.044074, 0.8099315, -0.8671846, 1, 0, 0, 1, 1,
-2.916463, -0.4882091, -1.396223, 1, 0, 0, 1, 1,
-2.710339, -0.03711323, 0.7090194, 1, 0, 0, 1, 1,
-2.577082, 0.3829305, 0.2020701, 1, 0, 0, 1, 1,
-2.455537, -1.008537, -1.899952, 0, 0, 0, 1, 1,
-2.452997, -1.079522, -1.775218, 0, 0, 0, 1, 1,
-2.439919, 1.198329, -0.8294674, 0, 0, 0, 1, 1,
-2.422735, 0.4440161, -2.652487, 0, 0, 0, 1, 1,
-2.411779, -0.4443748, -1.514857, 0, 0, 0, 1, 1,
-2.409148, -0.614269, -1.628449, 0, 0, 0, 1, 1,
-2.379699, -0.05571327, -1.632394, 0, 0, 0, 1, 1,
-2.252627, 1.97396, -1.578078, 1, 1, 1, 1, 1,
-2.198432, 1.224854, -0.9578443, 1, 1, 1, 1, 1,
-2.186563, -0.6517071, -0.7196497, 1, 1, 1, 1, 1,
-2.167713, 0.2753931, -0.6277208, 1, 1, 1, 1, 1,
-2.165119, -0.1695179, -1.087877, 1, 1, 1, 1, 1,
-2.145177, 1.251293, -1.487767, 1, 1, 1, 1, 1,
-2.133614, -1.850854, -1.695814, 1, 1, 1, 1, 1,
-2.127301, -0.4497488, -1.483519, 1, 1, 1, 1, 1,
-2.113855, -0.7181262, -1.157108, 1, 1, 1, 1, 1,
-2.08823, 0.3439345, -1.638721, 1, 1, 1, 1, 1,
-2.067592, -0.7950538, -2.287712, 1, 1, 1, 1, 1,
-2.046614, 0.7971555, -3.12638, 1, 1, 1, 1, 1,
-2.029881, 0.4794763, -1.569543, 1, 1, 1, 1, 1,
-2.026451, 0.1508494, -2.154017, 1, 1, 1, 1, 1,
-2.005841, 0.3125932, -2.190179, 1, 1, 1, 1, 1,
-1.988326, -0.616135, -0.7627008, 0, 0, 1, 1, 1,
-1.986985, 1.642046, -0.1333439, 1, 0, 0, 1, 1,
-1.925857, -0.6572541, -1.887279, 1, 0, 0, 1, 1,
-1.922462, -1.222348, -1.922516, 1, 0, 0, 1, 1,
-1.885661, 0.37637, -0.744607, 1, 0, 0, 1, 1,
-1.884835, -0.1912976, -2.911251, 1, 0, 0, 1, 1,
-1.870295, 0.4181309, -1.279541, 0, 0, 0, 1, 1,
-1.851715, -0.688785, -2.879824, 0, 0, 0, 1, 1,
-1.846308, 0.4465506, -0.0009763513, 0, 0, 0, 1, 1,
-1.844394, 2.344715, -0.4962066, 0, 0, 0, 1, 1,
-1.837844, -0.8929917, -1.446561, 0, 0, 0, 1, 1,
-1.830714, -0.2432506, -1.568268, 0, 0, 0, 1, 1,
-1.826426, -1.500938, -1.674791, 0, 0, 0, 1, 1,
-1.825054, 0.5808488, -0.5386826, 1, 1, 1, 1, 1,
-1.800176, -0.1579663, -2.682469, 1, 1, 1, 1, 1,
-1.798023, 1.866195, -0.2029864, 1, 1, 1, 1, 1,
-1.794616, 0.2180742, -0.8714806, 1, 1, 1, 1, 1,
-1.766529, -1.905544, -1.314894, 1, 1, 1, 1, 1,
-1.757346, 0.2249083, -2.284988, 1, 1, 1, 1, 1,
-1.755733, -0.02523373, -1.810374, 1, 1, 1, 1, 1,
-1.741687, 1.353231, -1.55316, 1, 1, 1, 1, 1,
-1.737338, -0.04991527, -2.935168, 1, 1, 1, 1, 1,
-1.736955, -0.7070002, -2.289559, 1, 1, 1, 1, 1,
-1.723852, 0.1883084, -2.00211, 1, 1, 1, 1, 1,
-1.700818, -0.9388658, -0.5900372, 1, 1, 1, 1, 1,
-1.656581, 0.7042645, -0.3913218, 1, 1, 1, 1, 1,
-1.639551, 0.2888643, -0.121158, 1, 1, 1, 1, 1,
-1.617607, -2.599591, -0.272598, 1, 1, 1, 1, 1,
-1.617356, 1.336764, -1.513671, 0, 0, 1, 1, 1,
-1.606036, -0.4964674, 0.7463495, 1, 0, 0, 1, 1,
-1.599593, -1.114854, -1.366198, 1, 0, 0, 1, 1,
-1.598516, -0.5487775, -1.40585, 1, 0, 0, 1, 1,
-1.597827, -0.5708039, -1.911406, 1, 0, 0, 1, 1,
-1.584317, -1.15809, -3.932228, 1, 0, 0, 1, 1,
-1.575029, 0.8410177, -3.366789, 0, 0, 0, 1, 1,
-1.56875, -0.5064101, -2.151992, 0, 0, 0, 1, 1,
-1.567019, 1.748103, -2.783631, 0, 0, 0, 1, 1,
-1.560253, -1.074318, -2.37985, 0, 0, 0, 1, 1,
-1.542641, -0.14408, -0.6724549, 0, 0, 0, 1, 1,
-1.530821, 0.8405375, -0.3266403, 0, 0, 0, 1, 1,
-1.528095, -0.3405068, -3.39497, 0, 0, 0, 1, 1,
-1.507944, 0.8137686, 0.06006116, 1, 1, 1, 1, 1,
-1.494495, 0.4292507, -1.299853, 1, 1, 1, 1, 1,
-1.494136, 0.8757988, 0.03323979, 1, 1, 1, 1, 1,
-1.487192, -0.7230633, -3.006343, 1, 1, 1, 1, 1,
-1.474851, 0.333127, 0.1164129, 1, 1, 1, 1, 1,
-1.460859, -2.022242, -4.43444, 1, 1, 1, 1, 1,
-1.456854, 1.390094, -1.033267, 1, 1, 1, 1, 1,
-1.451262, 0.5719559, -0.9698828, 1, 1, 1, 1, 1,
-1.446372, 2.009643, -0.2071675, 1, 1, 1, 1, 1,
-1.442374, 1.64735, -1.080288, 1, 1, 1, 1, 1,
-1.423224, 0.1617918, -1.255251, 1, 1, 1, 1, 1,
-1.422372, 2.266971, -2.045472, 1, 1, 1, 1, 1,
-1.401602, -0.393382, -2.776302, 1, 1, 1, 1, 1,
-1.393255, -0.8565587, -3.104465, 1, 1, 1, 1, 1,
-1.389794, -1.288514, -3.201167, 1, 1, 1, 1, 1,
-1.380464, 0.2438654, -3.400026, 0, 0, 1, 1, 1,
-1.368498, 0.5044569, -1.967003, 1, 0, 0, 1, 1,
-1.365586, 1.545154, -1.548062, 1, 0, 0, 1, 1,
-1.364628, 0.5280144, -1.23138, 1, 0, 0, 1, 1,
-1.36268, -0.733497, -2.570687, 1, 0, 0, 1, 1,
-1.338263, -0.7316623, -2.634778, 1, 0, 0, 1, 1,
-1.333232, 0.1833756, -2.213868, 0, 0, 0, 1, 1,
-1.330993, 0.3448754, -1.557149, 0, 0, 0, 1, 1,
-1.329845, -0.7197309, -2.785391, 0, 0, 0, 1, 1,
-1.324298, -2.109254, -1.069844, 0, 0, 0, 1, 1,
-1.318933, -1.651581, -0.9431645, 0, 0, 0, 1, 1,
-1.317771, -0.5212418, -1.851147, 0, 0, 0, 1, 1,
-1.308848, 2.239031, -3.108233, 0, 0, 0, 1, 1,
-1.300464, -0.05832201, -0.3614824, 1, 1, 1, 1, 1,
-1.288365, -0.2876087, -4.60022, 1, 1, 1, 1, 1,
-1.274723, 0.07407188, -1.384518, 1, 1, 1, 1, 1,
-1.272526, -1.224271, -2.664173, 1, 1, 1, 1, 1,
-1.244949, 1.994685, 2.002333, 1, 1, 1, 1, 1,
-1.240139, -0.1169413, -0.3261455, 1, 1, 1, 1, 1,
-1.238763, -0.1591207, -1.520856, 1, 1, 1, 1, 1,
-1.237935, -0.9427159, -2.422984, 1, 1, 1, 1, 1,
-1.231945, -0.4142435, -1.815119, 1, 1, 1, 1, 1,
-1.23071, -0.4424456, -3.060667, 1, 1, 1, 1, 1,
-1.215442, 0.4480399, -0.06337673, 1, 1, 1, 1, 1,
-1.214085, -0.8524283, -0.718677, 1, 1, 1, 1, 1,
-1.211889, 0.8538861, 0.1546651, 1, 1, 1, 1, 1,
-1.207801, 0.05639056, -2.64691, 1, 1, 1, 1, 1,
-1.194686, -0.1631476, -1.973386, 1, 1, 1, 1, 1,
-1.18906, -1.119146, -2.850749, 0, 0, 1, 1, 1,
-1.184723, 0.1931447, -1.119609, 1, 0, 0, 1, 1,
-1.176511, -1.065358, -2.234807, 1, 0, 0, 1, 1,
-1.174121, 0.8812748, 0.6923032, 1, 0, 0, 1, 1,
-1.169841, 0.6676333, -2.788953, 1, 0, 0, 1, 1,
-1.166871, 0.2382322, -0.674886, 1, 0, 0, 1, 1,
-1.162652, 1.048739, -1.065289, 0, 0, 0, 1, 1,
-1.161843, 0.09137571, 0.2889149, 0, 0, 0, 1, 1,
-1.158613, -1.297202, -2.379977, 0, 0, 0, 1, 1,
-1.155928, 1.021948, 0.00852224, 0, 0, 0, 1, 1,
-1.150521, 0.4737058, -3.903606, 0, 0, 0, 1, 1,
-1.150059, 0.9461944, -1.880556, 0, 0, 0, 1, 1,
-1.149604, -2.585134, -2.261207, 0, 0, 0, 1, 1,
-1.147665, -1.405957, -0.7535915, 1, 1, 1, 1, 1,
-1.143993, -0.2282391, -1.903917, 1, 1, 1, 1, 1,
-1.137558, -1.081621, -3.138313, 1, 1, 1, 1, 1,
-1.133969, -1.217437, -1.444413, 1, 1, 1, 1, 1,
-1.127036, 0.6901084, -1.437295, 1, 1, 1, 1, 1,
-1.126422, 0.0396536, -1.25041, 1, 1, 1, 1, 1,
-1.126406, -0.3212939, -1.632002, 1, 1, 1, 1, 1,
-1.123723, 2.455219, -0.7804669, 1, 1, 1, 1, 1,
-1.117515, 0.1645377, -0.8893894, 1, 1, 1, 1, 1,
-1.116404, 0.6488277, -1.037304, 1, 1, 1, 1, 1,
-1.112803, 1.082334, -2.727575, 1, 1, 1, 1, 1,
-1.111136, 0.417862, 0.4720823, 1, 1, 1, 1, 1,
-1.110377, -0.1110464, -2.287131, 1, 1, 1, 1, 1,
-1.108055, 0.4212192, -1.393324, 1, 1, 1, 1, 1,
-1.106994, -0.1864601, -1.966998, 1, 1, 1, 1, 1,
-1.093113, 0.7992771, 0.8628607, 0, 0, 1, 1, 1,
-1.086909, -1.736136, -2.918606, 1, 0, 0, 1, 1,
-1.086333, -0.1480844, -2.4658, 1, 0, 0, 1, 1,
-1.082241, -1.163913, -2.285642, 1, 0, 0, 1, 1,
-1.078371, 1.068481, -2.418788, 1, 0, 0, 1, 1,
-1.077854, -1.025556, -1.579483, 1, 0, 0, 1, 1,
-1.073662, 1.201768, -0.0692032, 0, 0, 0, 1, 1,
-1.064252, 1.177323, -0.05722768, 0, 0, 0, 1, 1,
-1.057428, 1.203219, -1.489886, 0, 0, 0, 1, 1,
-1.052274, 0.5305191, -1.265566, 0, 0, 0, 1, 1,
-1.05201, -0.1608749, -1.36025, 0, 0, 0, 1, 1,
-1.046359, 0.4285727, -2.369705, 0, 0, 0, 1, 1,
-1.043722, 0.6113918, 0.84101, 0, 0, 0, 1, 1,
-1.043637, 0.2699919, -0.9077166, 1, 1, 1, 1, 1,
-1.043368, -0.3354487, -1.398827, 1, 1, 1, 1, 1,
-1.03677, -0.05582815, -2.322568, 1, 1, 1, 1, 1,
-1.034561, 1.472806, -1.216492, 1, 1, 1, 1, 1,
-1.031468, -0.2808928, -0.03644393, 1, 1, 1, 1, 1,
-1.019741, -1.551855, -1.61817, 1, 1, 1, 1, 1,
-1.006284, 0.3072071, -3.780263, 1, 1, 1, 1, 1,
-1.005529, 1.194111, -1.900443, 1, 1, 1, 1, 1,
-1.002701, -1.73939, -2.584199, 1, 1, 1, 1, 1,
-1.002415, -0.2782609, -2.626031, 1, 1, 1, 1, 1,
-0.9903802, 0.7409036, -1.142523, 1, 1, 1, 1, 1,
-0.9888522, -0.2099089, -2.930902, 1, 1, 1, 1, 1,
-0.983893, 2.011177, -0.6622266, 1, 1, 1, 1, 1,
-0.980414, -0.1974062, -1.587273, 1, 1, 1, 1, 1,
-0.9576463, -0.4489204, -2.13607, 1, 1, 1, 1, 1,
-0.9567924, 0.4523006, -0.9547252, 0, 0, 1, 1, 1,
-0.9546357, 0.0924407, -1.578885, 1, 0, 0, 1, 1,
-0.9541551, -0.6873863, -3.477215, 1, 0, 0, 1, 1,
-0.9521508, 0.7319328, -1.025809, 1, 0, 0, 1, 1,
-0.9517398, -1.035859, -3.19817, 1, 0, 0, 1, 1,
-0.9511795, 1.009812, -0.6266593, 1, 0, 0, 1, 1,
-0.94516, -0.9935167, -0.8883063, 0, 0, 0, 1, 1,
-0.9362187, 0.100442, -0.8815283, 0, 0, 0, 1, 1,
-0.9280728, 0.4779862, -1.728697, 0, 0, 0, 1, 1,
-0.9210412, 0.370498, -1.076263, 0, 0, 0, 1, 1,
-0.9119009, -0.3800045, -2.369136, 0, 0, 0, 1, 1,
-0.9098604, -0.4479657, -0.9719288, 0, 0, 0, 1, 1,
-0.9088418, -0.6775069, -2.75887, 0, 0, 0, 1, 1,
-0.9072517, 1.08099, -1.051449, 1, 1, 1, 1, 1,
-0.9067234, 0.7717823, -1.26293, 1, 1, 1, 1, 1,
-0.9032521, 0.8629469, -0.5508642, 1, 1, 1, 1, 1,
-0.8952544, -0.4843483, -2.920533, 1, 1, 1, 1, 1,
-0.8922307, -0.6108714, -2.08076, 1, 1, 1, 1, 1,
-0.8814396, 1.588953, -2.684322, 1, 1, 1, 1, 1,
-0.8724085, 0.914743, -0.3097965, 1, 1, 1, 1, 1,
-0.8699473, -0.7985243, -2.490794, 1, 1, 1, 1, 1,
-0.8669244, 1.158817, -0.2855748, 1, 1, 1, 1, 1,
-0.8623896, 0.3161976, -0.2963692, 1, 1, 1, 1, 1,
-0.8478117, -0.1462955, -0.7006987, 1, 1, 1, 1, 1,
-0.8457729, 0.9027616, -0.8868704, 1, 1, 1, 1, 1,
-0.8429021, -1.717853, -1.856531, 1, 1, 1, 1, 1,
-0.8407288, -0.1207471, 0.3981474, 1, 1, 1, 1, 1,
-0.8406931, -0.4252129, -3.153442, 1, 1, 1, 1, 1,
-0.840359, -0.7765246, -3.438727, 0, 0, 1, 1, 1,
-0.8278159, -1.507296, -2.762812, 1, 0, 0, 1, 1,
-0.8278109, -0.09568321, -1.809365, 1, 0, 0, 1, 1,
-0.8270662, 2.575433, -0.1177484, 1, 0, 0, 1, 1,
-0.8268698, -1.596531, -2.718574, 1, 0, 0, 1, 1,
-0.8268189, 0.5408317, -2.432637, 1, 0, 0, 1, 1,
-0.8193099, -1.465982, -0.6891271, 0, 0, 0, 1, 1,
-0.8177862, -0.3118309, -3.602736, 0, 0, 0, 1, 1,
-0.8115324, -0.8425878, -2.616466, 0, 0, 0, 1, 1,
-0.8114313, 1.373367, -0.744473, 0, 0, 0, 1, 1,
-0.8077576, 0.9416559, 0.04529214, 0, 0, 0, 1, 1,
-0.8051114, 0.9963676, 0.1696997, 0, 0, 0, 1, 1,
-0.80387, -1.728433, -1.999466, 0, 0, 0, 1, 1,
-0.8023522, 0.2807443, -0.3839495, 1, 1, 1, 1, 1,
-0.8007718, -1.737934, -2.294692, 1, 1, 1, 1, 1,
-0.792951, -0.7421182, -0.6510358, 1, 1, 1, 1, 1,
-0.7917227, -0.1563853, -4.422942, 1, 1, 1, 1, 1,
-0.7909018, 1.910163, -1.416098, 1, 1, 1, 1, 1,
-0.7907941, -0.5310756, -2.276423, 1, 1, 1, 1, 1,
-0.7883958, 0.7929903, -0.4342899, 1, 1, 1, 1, 1,
-0.7855433, 1.004748, -0.8202369, 1, 1, 1, 1, 1,
-0.7811177, 0.1768296, -1.027214, 1, 1, 1, 1, 1,
-0.7775421, 0.07476383, -2.251505, 1, 1, 1, 1, 1,
-0.7676774, -0.3779401, -1.167836, 1, 1, 1, 1, 1,
-0.7635121, -0.9437915, -2.879169, 1, 1, 1, 1, 1,
-0.7603348, -0.658447, -3.349229, 1, 1, 1, 1, 1,
-0.756532, 1.414913, -2.011372, 1, 1, 1, 1, 1,
-0.756242, 0.6063376, -0.5351447, 1, 1, 1, 1, 1,
-0.7546772, -0.9965752, -1.868896, 0, 0, 1, 1, 1,
-0.7504207, -0.9077535, -2.7885, 1, 0, 0, 1, 1,
-0.7503364, -0.6603231, -3.552121, 1, 0, 0, 1, 1,
-0.7474697, -1.029485, -4.22128, 1, 0, 0, 1, 1,
-0.7425268, 0.3017905, -3.367712, 1, 0, 0, 1, 1,
-0.7422696, 0.4434991, -1.906331, 1, 0, 0, 1, 1,
-0.7409633, 0.1158173, -2.456898, 0, 0, 0, 1, 1,
-0.7365971, -0.2270245, -2.353076, 0, 0, 0, 1, 1,
-0.734543, 0.457107, -0.7508233, 0, 0, 0, 1, 1,
-0.7309673, -0.4018437, -1.230272, 0, 0, 0, 1, 1,
-0.7215887, 0.2073066, -4.224237, 0, 0, 0, 1, 1,
-0.7212635, 0.8000731, -2.547529, 0, 0, 0, 1, 1,
-0.7212212, -0.7773619, -1.179154, 0, 0, 0, 1, 1,
-0.7175253, 0.2729067, -0.75094, 1, 1, 1, 1, 1,
-0.7147129, 1.028797, 0.0241308, 1, 1, 1, 1, 1,
-0.7122827, -1.158718, -2.492512, 1, 1, 1, 1, 1,
-0.7078012, -0.01019729, -1.509483, 1, 1, 1, 1, 1,
-0.7024053, -0.05268099, -1.626134, 1, 1, 1, 1, 1,
-0.7018165, -0.7671039, -2.314858, 1, 1, 1, 1, 1,
-0.7015284, -0.5763036, -2.216244, 1, 1, 1, 1, 1,
-0.6970565, 1.445835, -0.007539647, 1, 1, 1, 1, 1,
-0.6966078, 1.218074, 0.11988, 1, 1, 1, 1, 1,
-0.6964662, 1.528076, -1.782421, 1, 1, 1, 1, 1,
-0.6949808, -0.6679621, -1.74245, 1, 1, 1, 1, 1,
-0.694464, 2.40018, 0.6373191, 1, 1, 1, 1, 1,
-0.6941032, -1.14292, -3.436669, 1, 1, 1, 1, 1,
-0.691704, -1.350305, -3.056247, 1, 1, 1, 1, 1,
-0.6914589, -0.2853444, -1.374293, 1, 1, 1, 1, 1,
-0.6884681, 0.1855831, -2.049412, 0, 0, 1, 1, 1,
-0.6854988, -0.1184969, -1.06122, 1, 0, 0, 1, 1,
-0.6837973, -0.4227626, -1.413616, 1, 0, 0, 1, 1,
-0.679691, -0.234208, -2.219259, 1, 0, 0, 1, 1,
-0.6759781, -1.385596, -2.925703, 1, 0, 0, 1, 1,
-0.6741627, 0.1769501, -2.205098, 1, 0, 0, 1, 1,
-0.6717324, 1.366813, 1.075335, 0, 0, 0, 1, 1,
-0.6704148, -0.4461822, -1.339556, 0, 0, 0, 1, 1,
-0.6688762, 1.979598, 0.8362731, 0, 0, 0, 1, 1,
-0.6634367, 0.09213359, -1.679115, 0, 0, 0, 1, 1,
-0.6627101, 1.220451, -0.3503141, 0, 0, 0, 1, 1,
-0.6608795, 1.713753, -0.1938267, 0, 0, 0, 1, 1,
-0.6577978, -0.9639536, -3.634486, 0, 0, 0, 1, 1,
-0.6571941, 0.4138781, -0.2580777, 1, 1, 1, 1, 1,
-0.6455664, 0.5243461, -0.203013, 1, 1, 1, 1, 1,
-0.6452402, 0.502799, -1.676808, 1, 1, 1, 1, 1,
-0.6429366, -0.2736056, -1.35043, 1, 1, 1, 1, 1,
-0.6405355, 0.04982289, -0.8581309, 1, 1, 1, 1, 1,
-0.6402852, -0.1201865, -0.8664793, 1, 1, 1, 1, 1,
-0.6368762, -1.18807, -2.821714, 1, 1, 1, 1, 1,
-0.6362826, 0.2404275, -0.1008276, 1, 1, 1, 1, 1,
-0.6345064, 1.044022, 0.1568221, 1, 1, 1, 1, 1,
-0.6325311, 0.4765261, 1.051776, 1, 1, 1, 1, 1,
-0.6308806, 2.008967, 0.6346133, 1, 1, 1, 1, 1,
-0.6265265, 1.06977, -2.175488, 1, 1, 1, 1, 1,
-0.6251622, -0.03928139, 0.1473001, 1, 1, 1, 1, 1,
-0.6185824, 1.125606, -3.071694, 1, 1, 1, 1, 1,
-0.6165346, -0.03169199, -1.591979, 1, 1, 1, 1, 1,
-0.6131427, 0.2855167, -1.525325, 0, 0, 1, 1, 1,
-0.6109873, -0.5613832, -1.892605, 1, 0, 0, 1, 1,
-0.6077048, 0.5040913, -2.347423, 1, 0, 0, 1, 1,
-0.602982, -0.6196141, -2.218895, 1, 0, 0, 1, 1,
-0.6003629, -0.4458199, -2.209018, 1, 0, 0, 1, 1,
-0.5996564, -0.8916787, -1.091146, 1, 0, 0, 1, 1,
-0.5971127, 0.8577035, -1.600559, 0, 0, 0, 1, 1,
-0.590246, 0.6856592, -0.3348053, 0, 0, 0, 1, 1,
-0.5874233, 2.590451, 0.3398286, 0, 0, 0, 1, 1,
-0.5870519, -0.5261684, 0.2246475, 0, 0, 0, 1, 1,
-0.5808619, -1.472135, -2.322405, 0, 0, 0, 1, 1,
-0.5767776, 0.6345209, -0.1784245, 0, 0, 0, 1, 1,
-0.5754934, 0.484639, -0.609744, 0, 0, 0, 1, 1,
-0.5697548, -1.257138, -3.264912, 1, 1, 1, 1, 1,
-0.5688857, 0.7226648, -0.23866, 1, 1, 1, 1, 1,
-0.5684551, 0.0903236, -2.025689, 1, 1, 1, 1, 1,
-0.5631752, 0.3834197, -2.6972, 1, 1, 1, 1, 1,
-0.5627153, 0.3239723, -0.85488, 1, 1, 1, 1, 1,
-0.5459391, 0.3050098, -1.536459, 1, 1, 1, 1, 1,
-0.5454811, 1.231444, -1.224745, 1, 1, 1, 1, 1,
-0.5334466, 1.520305, 1.78911, 1, 1, 1, 1, 1,
-0.5277095, 0.7887315, 0.1412212, 1, 1, 1, 1, 1,
-0.5274652, 0.5277053, -0.2121264, 1, 1, 1, 1, 1,
-0.5256321, -2.426295, -3.495952, 1, 1, 1, 1, 1,
-0.5247874, -0.767227, -2.661499, 1, 1, 1, 1, 1,
-0.524124, 0.778567, -1.057856, 1, 1, 1, 1, 1,
-0.5202425, 0.4030888, 0.4919841, 1, 1, 1, 1, 1,
-0.5118428, -0.165021, -2.469779, 1, 1, 1, 1, 1,
-0.5077094, -0.7166178, -1.693767, 0, 0, 1, 1, 1,
-0.4978558, 0.1167014, -1.520134, 1, 0, 0, 1, 1,
-0.4951969, -0.7335334, -2.238672, 1, 0, 0, 1, 1,
-0.49415, 0.295364, -1.72866, 1, 0, 0, 1, 1,
-0.4825887, -0.326987, -3.280653, 1, 0, 0, 1, 1,
-0.4812867, 1.257429, -2.583885, 1, 0, 0, 1, 1,
-0.479546, -1.233669, -0.4751877, 0, 0, 0, 1, 1,
-0.4751587, -0.8221442, -1.872539, 0, 0, 0, 1, 1,
-0.4748577, -1.363273, -0.6754332, 0, 0, 0, 1, 1,
-0.4731057, 1.141399, -0.319722, 0, 0, 0, 1, 1,
-0.473054, 0.7210572, -0.03391792, 0, 0, 0, 1, 1,
-0.4677852, 0.6965032, -0.7516927, 0, 0, 0, 1, 1,
-0.4631976, 0.8302394, 0.9666911, 0, 0, 0, 1, 1,
-0.4599595, -0.5113242, -2.756372, 1, 1, 1, 1, 1,
-0.4559051, 0.236407, -0.7039024, 1, 1, 1, 1, 1,
-0.454697, 0.2185476, -3.245323, 1, 1, 1, 1, 1,
-0.4546648, -1.875845, -4.754123, 1, 1, 1, 1, 1,
-0.4533356, 0.4922771, -0.6502448, 1, 1, 1, 1, 1,
-0.4473015, -0.8690923, -4.426537, 1, 1, 1, 1, 1,
-0.4443075, -0.8045675, -1.867872, 1, 1, 1, 1, 1,
-0.4360922, -0.8547452, -2.494723, 1, 1, 1, 1, 1,
-0.4359888, -0.4597906, -2.110716, 1, 1, 1, 1, 1,
-0.4348866, -0.06613365, -0.9907496, 1, 1, 1, 1, 1,
-0.4338735, 1.824554, -0.7351584, 1, 1, 1, 1, 1,
-0.4330509, -1.378479, -1.547744, 1, 1, 1, 1, 1,
-0.4246103, 0.2935153, -0.3940867, 1, 1, 1, 1, 1,
-0.4222473, -0.1628962, -1.453134, 1, 1, 1, 1, 1,
-0.421114, -0.1294549, -0.887584, 1, 1, 1, 1, 1,
-0.4208894, -0.8495454, -2.364249, 0, 0, 1, 1, 1,
-0.4182436, 1.176485, 1.110127, 1, 0, 0, 1, 1,
-0.4141909, 0.1410377, -2.132068, 1, 0, 0, 1, 1,
-0.4120893, 0.6951448, -0.2571508, 1, 0, 0, 1, 1,
-0.4088143, 0.9259191, -1.649367, 1, 0, 0, 1, 1,
-0.408548, -0.8335275, -1.028516, 1, 0, 0, 1, 1,
-0.4076726, 0.3845655, 0.2667954, 0, 0, 0, 1, 1,
-0.4066215, 0.7385753, -1.704823, 0, 0, 0, 1, 1,
-0.4039511, -0.9378731, -3.157645, 0, 0, 0, 1, 1,
-0.4026411, -0.3715645, -3.22582, 0, 0, 0, 1, 1,
-0.4022624, -0.4272676, -2.747885, 0, 0, 0, 1, 1,
-0.4019941, -1.370626, -2.962838, 0, 0, 0, 1, 1,
-0.4015913, 0.3219805, -1.17842, 0, 0, 0, 1, 1,
-0.3883433, -1.612534, -2.46015, 1, 1, 1, 1, 1,
-0.3870161, -1.056023, -2.956596, 1, 1, 1, 1, 1,
-0.3855759, -0.6473977, -0.8265264, 1, 1, 1, 1, 1,
-0.3820766, -1.098355, -2.241353, 1, 1, 1, 1, 1,
-0.3768711, -0.3469646, -0.5898225, 1, 1, 1, 1, 1,
-0.3767418, -0.6019034, -1.98274, 1, 1, 1, 1, 1,
-0.3727144, -2.263182, -2.040284, 1, 1, 1, 1, 1,
-0.3667254, 1.261685, 0.4599535, 1, 1, 1, 1, 1,
-0.3649035, 2.228093, -0.3381462, 1, 1, 1, 1, 1,
-0.3599108, 0.7470142, -0.2262138, 1, 1, 1, 1, 1,
-0.3570692, 0.382864, -1.04318, 1, 1, 1, 1, 1,
-0.3537929, 0.08152814, -1.563761, 1, 1, 1, 1, 1,
-0.3528786, 1.84748, 0.646338, 1, 1, 1, 1, 1,
-0.3501311, 0.4361187, -0.2789468, 1, 1, 1, 1, 1,
-0.349252, 0.03308591, -3.050858, 1, 1, 1, 1, 1,
-0.3395486, -2.048452, -3.034974, 0, 0, 1, 1, 1,
-0.3374059, -0.8865557, -3.383755, 1, 0, 0, 1, 1,
-0.3334627, -1.702993, -1.531365, 1, 0, 0, 1, 1,
-0.331618, -0.3840944, -4.42933, 1, 0, 0, 1, 1,
-0.3302483, -0.1835514, -4.055454, 1, 0, 0, 1, 1,
-0.3292481, 0.4396909, -2.332328, 1, 0, 0, 1, 1,
-0.3249535, 2.312571, 1.704255, 0, 0, 0, 1, 1,
-0.3224009, -1.712932, -4.519495, 0, 0, 0, 1, 1,
-0.3159949, 0.4778465, -1.066556, 0, 0, 0, 1, 1,
-0.315482, -0.8536691, -4.220582, 0, 0, 0, 1, 1,
-0.3149523, 0.5464947, -1.167363, 0, 0, 0, 1, 1,
-0.3145718, 0.454836, -0.772714, 0, 0, 0, 1, 1,
-0.3140839, 0.3731673, 1.259718, 0, 0, 0, 1, 1,
-0.3121642, 1.987627, -1.253208, 1, 1, 1, 1, 1,
-0.3113086, -1.793354, -2.288074, 1, 1, 1, 1, 1,
-0.3083763, -0.952323, -2.048642, 1, 1, 1, 1, 1,
-0.3021615, 0.3868669, -0.467768, 1, 1, 1, 1, 1,
-0.2982655, -0.4487457, -1.923033, 1, 1, 1, 1, 1,
-0.2958174, 2.033848, 0.6747591, 1, 1, 1, 1, 1,
-0.2953505, -1.468395, -2.737978, 1, 1, 1, 1, 1,
-0.2930882, -0.09626752, -0.4699244, 1, 1, 1, 1, 1,
-0.2866985, 0.05954706, -2.234026, 1, 1, 1, 1, 1,
-0.2842614, 0.5001602, -0.7731896, 1, 1, 1, 1, 1,
-0.2814578, -0.3609428, -3.06249, 1, 1, 1, 1, 1,
-0.2797479, 0.2314731, -1.258359, 1, 1, 1, 1, 1,
-0.2780191, 2.380851, -2.013193, 1, 1, 1, 1, 1,
-0.2731511, -1.721932, -3.467415, 1, 1, 1, 1, 1,
-0.2684916, -0.6947304, -3.729302, 1, 1, 1, 1, 1,
-0.2655716, -0.3625276, -4.765336, 0, 0, 1, 1, 1,
-0.2539353, 0.4352279, -1.558088, 1, 0, 0, 1, 1,
-0.2513737, 0.05125056, -1.674235, 1, 0, 0, 1, 1,
-0.2509169, -0.504523, -2.774267, 1, 0, 0, 1, 1,
-0.2498325, 0.4493895, -0.1850186, 1, 0, 0, 1, 1,
-0.2487824, -0.7191638, -1.798738, 1, 0, 0, 1, 1,
-0.2468459, -1.330556, -1.76197, 0, 0, 0, 1, 1,
-0.2449737, -0.8256359, 0.6389381, 0, 0, 0, 1, 1,
-0.2432775, -1.557365, -4.115835, 0, 0, 0, 1, 1,
-0.2340134, -1.07383, -3.455213, 0, 0, 0, 1, 1,
-0.2321985, -0.5861887, -2.126504, 0, 0, 0, 1, 1,
-0.2249431, 0.513027, 1.87166, 0, 0, 0, 1, 1,
-0.2135964, -0.3728779, -2.330614, 0, 0, 0, 1, 1,
-0.2117976, 0.2686754, -0.2368271, 1, 1, 1, 1, 1,
-0.2109219, 0.1392548, -2.264889, 1, 1, 1, 1, 1,
-0.2099755, -1.746605, -2.179459, 1, 1, 1, 1, 1,
-0.2082329, 0.04829837, 0.7827029, 1, 1, 1, 1, 1,
-0.2055706, -1.427883, -4.219579, 1, 1, 1, 1, 1,
-0.2014118, 0.638064, 0.3820548, 1, 1, 1, 1, 1,
-0.1987311, -0.7734808, -2.931468, 1, 1, 1, 1, 1,
-0.1983708, -1.196825, -3.14121, 1, 1, 1, 1, 1,
-0.1973704, 0.5386245, -1.089711, 1, 1, 1, 1, 1,
-0.1903531, 1.856049, -1.470764, 1, 1, 1, 1, 1,
-0.189339, -0.9939483, -2.471513, 1, 1, 1, 1, 1,
-0.188349, 2.440687, -0.4988761, 1, 1, 1, 1, 1,
-0.1840806, -0.7311682, -2.023289, 1, 1, 1, 1, 1,
-0.1796206, 1.009786, -3.212826, 1, 1, 1, 1, 1,
-0.1753893, 0.004170478, -3.799643, 1, 1, 1, 1, 1,
-0.175309, -0.4607981, -2.134987, 0, 0, 1, 1, 1,
-0.1720911, -0.8018231, -5.129482, 1, 0, 0, 1, 1,
-0.1717655, 0.339824, -1.880153, 1, 0, 0, 1, 1,
-0.1692767, 1.188077, -0.5044215, 1, 0, 0, 1, 1,
-0.1633851, 0.8701658, -0.4365317, 1, 0, 0, 1, 1,
-0.1622755, 0.0348321, -0.514035, 1, 0, 0, 1, 1,
-0.1609282, 0.4285119, -0.4272692, 0, 0, 0, 1, 1,
-0.1599228, 0.8917785, -0.5271953, 0, 0, 0, 1, 1,
-0.1598466, -0.3032884, -3.450687, 0, 0, 0, 1, 1,
-0.159481, -1.290478, -3.246033, 0, 0, 0, 1, 1,
-0.1541609, 0.03060532, -2.770477, 0, 0, 0, 1, 1,
-0.1521126, 0.7159073, 0.4319497, 0, 0, 0, 1, 1,
-0.1501069, 1.462081, 0.6939501, 0, 0, 0, 1, 1,
-0.1495932, -0.363135, -3.36979, 1, 1, 1, 1, 1,
-0.1447527, -0.8501442, -1.010055, 1, 1, 1, 1, 1,
-0.1417943, -0.7381796, -3.727508, 1, 1, 1, 1, 1,
-0.138691, -1.521404, -3.765525, 1, 1, 1, 1, 1,
-0.1377838, -0.3871842, -1.708773, 1, 1, 1, 1, 1,
-0.135173, 0.6624888, 0.119284, 1, 1, 1, 1, 1,
-0.134217, -1.811648, -3.664105, 1, 1, 1, 1, 1,
-0.1308641, -0.07636908, -2.397285, 1, 1, 1, 1, 1,
-0.1302927, -0.5301988, -4.353376, 1, 1, 1, 1, 1,
-0.1259183, -0.6783937, -2.30925, 1, 1, 1, 1, 1,
-0.120797, 0.456721, 0.0473335, 1, 1, 1, 1, 1,
-0.1206199, 0.3001211, -0.7059001, 1, 1, 1, 1, 1,
-0.1194085, 1.816511, -1.126214, 1, 1, 1, 1, 1,
-0.1191271, 1.082234, 0.4151001, 1, 1, 1, 1, 1,
-0.1168218, -0.2532281, -3.309572, 1, 1, 1, 1, 1,
-0.1151631, 1.275068, 0.05743285, 0, 0, 1, 1, 1,
-0.1141717, -1.804127, -3.15761, 1, 0, 0, 1, 1,
-0.1010348, 2.480039, -0.2614673, 1, 0, 0, 1, 1,
-0.09845613, 0.3351243, 1.085893, 1, 0, 0, 1, 1,
-0.09823964, 0.7659416, -0.9658931, 1, 0, 0, 1, 1,
-0.0974654, -0.6945692, -4.277853, 1, 0, 0, 1, 1,
-0.09596713, 0.1961528, 0.9544465, 0, 0, 0, 1, 1,
-0.09461171, 0.2026393, -0.8266733, 0, 0, 0, 1, 1,
-0.09190098, 0.8085791, 0.4250961, 0, 0, 0, 1, 1,
-0.09047903, 0.9083923, 1.269962, 0, 0, 0, 1, 1,
-0.08994962, 1.709584, -0.3310914, 0, 0, 0, 1, 1,
-0.08830535, 1.968242, -0.6944299, 0, 0, 0, 1, 1,
-0.08692788, -0.8200069, -2.29092, 0, 0, 0, 1, 1,
-0.08564525, -0.954825, -1.896555, 1, 1, 1, 1, 1,
-0.08506416, -0.6556823, -3.906576, 1, 1, 1, 1, 1,
-0.08446443, -0.8635015, -2.812576, 1, 1, 1, 1, 1,
-0.08128751, 1.36393, -0.5744498, 1, 1, 1, 1, 1,
-0.08086079, -0.7982916, -5.223217, 1, 1, 1, 1, 1,
-0.080072, 1.870522, 1.874344, 1, 1, 1, 1, 1,
-0.07827277, -0.09346833, -2.898367, 1, 1, 1, 1, 1,
-0.07379024, 0.006780049, -3.750397, 1, 1, 1, 1, 1,
-0.06992395, 1.239799, -0.2013036, 1, 1, 1, 1, 1,
-0.0661374, 0.5739465, -0.1887625, 1, 1, 1, 1, 1,
-0.06441311, 1.288982, -1.700576, 1, 1, 1, 1, 1,
-0.06094739, -1.728227, -3.023118, 1, 1, 1, 1, 1,
-0.05988105, 0.4094785, 0.37583, 1, 1, 1, 1, 1,
-0.05830437, -1.451733, -3.705817, 1, 1, 1, 1, 1,
-0.05772017, -1.811048, -2.989228, 1, 1, 1, 1, 1,
-0.05569608, 0.1440669, -0.2838471, 0, 0, 1, 1, 1,
-0.05422066, 0.2604628, -0.06355541, 1, 0, 0, 1, 1,
-0.05308094, 1.062169, 1.855728, 1, 0, 0, 1, 1,
-0.04897406, -1.311294, -3.537563, 1, 0, 0, 1, 1,
-0.04158545, -1.005281, -4.748157, 1, 0, 0, 1, 1,
-0.04072594, 1.952599, 0.1412167, 1, 0, 0, 1, 1,
-0.03913735, 0.6863837, 0.9882155, 0, 0, 0, 1, 1,
-0.03814259, -0.7587039, -3.296718, 0, 0, 0, 1, 1,
-0.03517506, 1.597085, 0.4809188, 0, 0, 0, 1, 1,
-0.03452189, 0.653747, -0.4003116, 0, 0, 0, 1, 1,
-0.03409393, -0.6901776, -3.765849, 0, 0, 0, 1, 1,
-0.03317295, -0.7977592, -2.89764, 0, 0, 0, 1, 1,
-0.03105828, -2.05915, -3.210958, 0, 0, 0, 1, 1,
-0.0285859, 0.7166677, 0.6152323, 1, 1, 1, 1, 1,
-0.02672984, -0.09129247, -0.8954172, 1, 1, 1, 1, 1,
-0.024315, 1.202427, -0.8073344, 1, 1, 1, 1, 1,
-0.0218698, -0.04014966, -4.340223, 1, 1, 1, 1, 1,
-0.02017316, -1.504792, -3.895146, 1, 1, 1, 1, 1,
-0.01503341, -1.745388, -2.011998, 1, 1, 1, 1, 1,
-0.008308733, -0.01679738, -1.2309, 1, 1, 1, 1, 1,
-0.006536786, -0.3299453, -2.587332, 1, 1, 1, 1, 1,
-0.001201127, -0.7946205, -3.192602, 1, 1, 1, 1, 1,
0.005459996, 1.824781, 0.05949005, 1, 1, 1, 1, 1,
0.00759334, 0.7102042, 1.31251, 1, 1, 1, 1, 1,
0.01018643, -0.8045363, 2.827675, 1, 1, 1, 1, 1,
0.01387582, 1.458327, 3.539816, 1, 1, 1, 1, 1,
0.01472739, 1.077488, -0.3260843, 1, 1, 1, 1, 1,
0.01579695, 0.3492644, 0.8490508, 1, 1, 1, 1, 1,
0.01867443, -0.475165, 3.360187, 0, 0, 1, 1, 1,
0.01965664, -1.278912, 3.536139, 1, 0, 0, 1, 1,
0.02240471, -0.5501732, 4.098904, 1, 0, 0, 1, 1,
0.02328875, -0.6522531, 2.83503, 1, 0, 0, 1, 1,
0.02688728, -0.1004766, 3.28732, 1, 0, 0, 1, 1,
0.02749451, 0.9059206, -1.43026, 1, 0, 0, 1, 1,
0.03008657, -0.3934135, 3.576519, 0, 0, 0, 1, 1,
0.03046617, 0.2267232, -1.180777, 0, 0, 0, 1, 1,
0.0347463, -1.321968, 3.215185, 0, 0, 0, 1, 1,
0.0367315, 0.9944688, 0.635675, 0, 0, 0, 1, 1,
0.04033878, 1.457543, 0.4864487, 0, 0, 0, 1, 1,
0.0419046, -0.1895138, 0.6056795, 0, 0, 0, 1, 1,
0.04623871, 0.9381502, 0.5866759, 0, 0, 0, 1, 1,
0.04695237, -0.07434767, 3.071651, 1, 1, 1, 1, 1,
0.04770924, -0.2576875, 4.232037, 1, 1, 1, 1, 1,
0.0483592, -0.8290355, 3.298601, 1, 1, 1, 1, 1,
0.04867354, -0.3460872, 3.912707, 1, 1, 1, 1, 1,
0.05092649, -1.284313, 2.413826, 1, 1, 1, 1, 1,
0.05624847, -0.7229411, 2.937945, 1, 1, 1, 1, 1,
0.05709894, -0.1922978, 0.9531206, 1, 1, 1, 1, 1,
0.06224268, -0.8074971, 3.370484, 1, 1, 1, 1, 1,
0.06288887, 0.3497584, 0.2756992, 1, 1, 1, 1, 1,
0.0635201, 1.145094, -1.190002, 1, 1, 1, 1, 1,
0.06465655, -1.592203, 1.870183, 1, 1, 1, 1, 1,
0.06627476, 0.126793, 1.883724, 1, 1, 1, 1, 1,
0.06840735, 1.219879, 0.2635163, 1, 1, 1, 1, 1,
0.06885405, -0.9503551, 4.292922, 1, 1, 1, 1, 1,
0.06972773, -0.004807048, 1.052868, 1, 1, 1, 1, 1,
0.07094092, -0.7861421, 3.398073, 0, 0, 1, 1, 1,
0.07571749, -1.437835, 3.559962, 1, 0, 0, 1, 1,
0.07582165, 0.3836696, 2.013684, 1, 0, 0, 1, 1,
0.07863294, -1.106015, 3.837027, 1, 0, 0, 1, 1,
0.07992916, -0.6060907, 2.746268, 1, 0, 0, 1, 1,
0.08046055, -0.2308697, 3.754797, 1, 0, 0, 1, 1,
0.08776176, 0.5572108, 0.2573096, 0, 0, 0, 1, 1,
0.09006231, -0.9833169, 3.190905, 0, 0, 0, 1, 1,
0.09151736, -1.653196, 2.303837, 0, 0, 0, 1, 1,
0.09222623, -0.7181635, 4.304058, 0, 0, 0, 1, 1,
0.09292044, -0.6393855, 3.142971, 0, 0, 0, 1, 1,
0.0961091, -0.6390566, 2.241821, 0, 0, 0, 1, 1,
0.09839349, 1.189063, -1.002678, 0, 0, 0, 1, 1,
0.1003766, -1.724977, 2.524803, 1, 1, 1, 1, 1,
0.1007937, 0.2087479, 0.7748314, 1, 1, 1, 1, 1,
0.1066686, -0.359554, 4.028249, 1, 1, 1, 1, 1,
0.1073557, 0.05759277, 2.259001, 1, 1, 1, 1, 1,
0.1122013, 0.8666555, -0.4536005, 1, 1, 1, 1, 1,
0.1135992, 0.9513535, 1.649763, 1, 1, 1, 1, 1,
0.1160585, -0.03591233, 0.1928722, 1, 1, 1, 1, 1,
0.1177959, -0.8693554, 1.492835, 1, 1, 1, 1, 1,
0.1206399, -2.264479, 2.863613, 1, 1, 1, 1, 1,
0.1230291, -1.117393, 2.878673, 1, 1, 1, 1, 1,
0.1237814, 0.1596818, 0.1985375, 1, 1, 1, 1, 1,
0.1252947, -1.242683, 1.116977, 1, 1, 1, 1, 1,
0.1267945, -0.4995728, 1.969274, 1, 1, 1, 1, 1,
0.1345021, -0.9704594, 2.647386, 1, 1, 1, 1, 1,
0.1400333, 0.852438, 0.235359, 1, 1, 1, 1, 1,
0.1406533, 0.9632238, 0.2778382, 0, 0, 1, 1, 1,
0.1410602, -2.251464, 2.984237, 1, 0, 0, 1, 1,
0.1421036, 0.3487986, -0.03249181, 1, 0, 0, 1, 1,
0.1454637, 1.520388, 0.7398194, 1, 0, 0, 1, 1,
0.1570668, 0.5206224, -1.176761, 1, 0, 0, 1, 1,
0.1593195, 0.2786233, 0.4349323, 1, 0, 0, 1, 1,
0.1656915, 2.904641, 0.3240002, 0, 0, 0, 1, 1,
0.1674079, -1.53447, 3.151233, 0, 0, 0, 1, 1,
0.1710356, -0.3656372, 2.406845, 0, 0, 0, 1, 1,
0.1766893, 0.5963357, 0.02495578, 0, 0, 0, 1, 1,
0.1783368, -0.7216594, 2.182434, 0, 0, 0, 1, 1,
0.1795728, -1.203155, 1.347006, 0, 0, 0, 1, 1,
0.1802333, -0.6497198, 3.467855, 0, 0, 0, 1, 1,
0.1810827, -1.094367, 2.522617, 1, 1, 1, 1, 1,
0.1835122, 0.7060061, 0.3350827, 1, 1, 1, 1, 1,
0.183524, 0.7544507, 0.104756, 1, 1, 1, 1, 1,
0.1841836, -0.834487, 4.138061, 1, 1, 1, 1, 1,
0.1845481, 0.5168521, 1.125444, 1, 1, 1, 1, 1,
0.1908866, -1.22892, 3.733653, 1, 1, 1, 1, 1,
0.2011673, -0.9131945, 2.53584, 1, 1, 1, 1, 1,
0.2018109, -0.8292201, 2.140766, 1, 1, 1, 1, 1,
0.2109378, -0.4581299, 2.930986, 1, 1, 1, 1, 1,
0.211178, 1.517581, -1.321913, 1, 1, 1, 1, 1,
0.2125044, 0.8448712, 0.6560869, 1, 1, 1, 1, 1,
0.2157178, 0.5905842, -1.363094, 1, 1, 1, 1, 1,
0.2180345, 0.7173558, 1.64069, 1, 1, 1, 1, 1,
0.2236193, 0.9627933, 0.05533767, 1, 1, 1, 1, 1,
0.2237224, 0.1625087, -0.07445377, 1, 1, 1, 1, 1,
0.2247677, -0.8097531, 2.394374, 0, 0, 1, 1, 1,
0.2300613, -0.6200091, 2.541856, 1, 0, 0, 1, 1,
0.2317751, -0.8631924, 3.502181, 1, 0, 0, 1, 1,
0.2327781, -1.704857, 3.346584, 1, 0, 0, 1, 1,
0.2336454, 0.8622554, 2.358306, 1, 0, 0, 1, 1,
0.2373156, -0.5225402, 3.234824, 1, 0, 0, 1, 1,
0.2437851, 0.1972981, 1.746189, 0, 0, 0, 1, 1,
0.2500993, -0.1985585, 2.776101, 0, 0, 0, 1, 1,
0.2514342, 0.9217575, -0.6391426, 0, 0, 0, 1, 1,
0.2546165, 0.0447757, 2.011771, 0, 0, 0, 1, 1,
0.258274, -0.2727189, 1.68393, 0, 0, 0, 1, 1,
0.2590272, -1.164322, 2.11675, 0, 0, 0, 1, 1,
0.2596967, 1.953131, 0.9155369, 0, 0, 0, 1, 1,
0.2669848, -0.4622206, 2.541438, 1, 1, 1, 1, 1,
0.2679993, -1.473867, 2.283384, 1, 1, 1, 1, 1,
0.2709961, 1.146073, -1.247578, 1, 1, 1, 1, 1,
0.2725016, -0.5328894, 1.139143, 1, 1, 1, 1, 1,
0.272898, -1.062912, 3.26198, 1, 1, 1, 1, 1,
0.2776881, -1.410651, 4.197499, 1, 1, 1, 1, 1,
0.2793425, 0.132137, 1.892107, 1, 1, 1, 1, 1,
0.2803037, -0.05282867, 0.9216669, 1, 1, 1, 1, 1,
0.2812434, 0.2215237, 0.9147537, 1, 1, 1, 1, 1,
0.2818497, 2.262172, -0.5758346, 1, 1, 1, 1, 1,
0.2861156, -0.4838128, 1.89497, 1, 1, 1, 1, 1,
0.2924441, -0.1036811, 2.988275, 1, 1, 1, 1, 1,
0.2935913, 0.7518317, 0.4658262, 1, 1, 1, 1, 1,
0.2978555, 1.996225, -0.205762, 1, 1, 1, 1, 1,
0.3002876, -0.6149821, 2.74569, 1, 1, 1, 1, 1,
0.3035226, -0.6546058, 0.9765909, 0, 0, 1, 1, 1,
0.3059581, -0.1568402, 1.83119, 1, 0, 0, 1, 1,
0.3068851, 0.2546602, 1.802815, 1, 0, 0, 1, 1,
0.3092616, -0.4257225, 0.6171119, 1, 0, 0, 1, 1,
0.3107553, 1.256724, 0.4838187, 1, 0, 0, 1, 1,
0.3139195, -0.16391, 2.808004, 1, 0, 0, 1, 1,
0.3210488, 0.03120527, 0.9696177, 0, 0, 0, 1, 1,
0.3311315, -0.4441128, 2.880831, 0, 0, 0, 1, 1,
0.3344912, -0.4565126, 0.7756635, 0, 0, 0, 1, 1,
0.3345198, 0.7711747, -0.433322, 0, 0, 0, 1, 1,
0.3348364, 1.080432, -0.8777534, 0, 0, 0, 1, 1,
0.3357191, 1.126541, 0.015348, 0, 0, 0, 1, 1,
0.3389088, -0.9902906, 3.066902, 0, 0, 0, 1, 1,
0.3401726, 0.04133384, 2.847808, 1, 1, 1, 1, 1,
0.3425059, 0.9873163, -1.712815, 1, 1, 1, 1, 1,
0.3536219, -0.05175603, 2.810043, 1, 1, 1, 1, 1,
0.3537047, -0.8921679, 4.085549, 1, 1, 1, 1, 1,
0.3543092, 0.5484558, 1.580648, 1, 1, 1, 1, 1,
0.3571869, -2.069508, 3.776799, 1, 1, 1, 1, 1,
0.3605007, 0.3455697, 0.9467481, 1, 1, 1, 1, 1,
0.3611203, -0.9678755, 3.262987, 1, 1, 1, 1, 1,
0.3618231, -0.6275157, 2.480903, 1, 1, 1, 1, 1,
0.3632846, -1.026081, 2.630742, 1, 1, 1, 1, 1,
0.3664814, -1.522027, 3.391301, 1, 1, 1, 1, 1,
0.3686026, 0.6168938, -0.416803, 1, 1, 1, 1, 1,
0.3740988, 1.861927, 1.617861, 1, 1, 1, 1, 1,
0.376542, 0.2593651, 0.2051046, 1, 1, 1, 1, 1,
0.3864419, 0.9037279, 1.203185, 1, 1, 1, 1, 1,
0.386713, 0.7817864, -0.1024583, 0, 0, 1, 1, 1,
0.3880315, 1.187194, -0.5077628, 1, 0, 0, 1, 1,
0.388838, 0.09583659, 1.190316, 1, 0, 0, 1, 1,
0.3908951, -2.160834, 3.365477, 1, 0, 0, 1, 1,
0.3914532, -0.600449, 3.14221, 1, 0, 0, 1, 1,
0.3999105, -0.09649557, 1.143087, 1, 0, 0, 1, 1,
0.4020784, 1.531068, -1.061893, 0, 0, 0, 1, 1,
0.4193794, 0.941305, -0.7069917, 0, 0, 0, 1, 1,
0.4332625, 0.7036275, 0.9440122, 0, 0, 0, 1, 1,
0.4410687, -0.148536, 1.714831, 0, 0, 0, 1, 1,
0.4450195, -0.9221574, 2.835592, 0, 0, 0, 1, 1,
0.4499047, 0.4012232, 1.986395, 0, 0, 0, 1, 1,
0.4578995, -0.3491837, 1.886329, 0, 0, 0, 1, 1,
0.4639105, -1.039836, 2.503823, 1, 1, 1, 1, 1,
0.4661119, -0.5083978, 1.731839, 1, 1, 1, 1, 1,
0.4718761, -1.497271, 2.496166, 1, 1, 1, 1, 1,
0.4728337, -0.09685679, 1.776159, 1, 1, 1, 1, 1,
0.4826058, -2.384775, 1.417493, 1, 1, 1, 1, 1,
0.4858612, -1.66303, 1.015135, 1, 1, 1, 1, 1,
0.4860659, 1.528295, -0.3868131, 1, 1, 1, 1, 1,
0.48808, 0.8648842, 0.9053686, 1, 1, 1, 1, 1,
0.4882809, 0.6171025, 2.15417, 1, 1, 1, 1, 1,
0.489213, -0.6247277, 2.299383, 1, 1, 1, 1, 1,
0.4908172, -0.1811355, 1.710631, 1, 1, 1, 1, 1,
0.4919004, 0.1681579, -1.103073, 1, 1, 1, 1, 1,
0.4926844, 0.02388505, 0.6732239, 1, 1, 1, 1, 1,
0.4939271, 0.7132399, -0.3801599, 1, 1, 1, 1, 1,
0.495529, -1.42898, 2.928248, 1, 1, 1, 1, 1,
0.4956815, 1.17138, 1.567097, 0, 0, 1, 1, 1,
0.5006897, 0.9135221, -0.7731228, 1, 0, 0, 1, 1,
0.5053749, 0.7197796, 0.003666658, 1, 0, 0, 1, 1,
0.5068541, -1.52484, 2.903602, 1, 0, 0, 1, 1,
0.5094019, -0.05798408, 2.573624, 1, 0, 0, 1, 1,
0.5098987, 0.3057365, 0.188739, 1, 0, 0, 1, 1,
0.5102904, -1.143481, 2.096575, 0, 0, 0, 1, 1,
0.5105133, -0.4475016, 1.546511, 0, 0, 0, 1, 1,
0.512419, 2.146811, 1.325132, 0, 0, 0, 1, 1,
0.5134469, -0.5772259, 2.983522, 0, 0, 0, 1, 1,
0.5172069, -1.101427, 3.125804, 0, 0, 0, 1, 1,
0.525731, -0.3876643, 3.987099, 0, 0, 0, 1, 1,
0.5273549, -1.211287, 2.386111, 0, 0, 0, 1, 1,
0.528865, -1.56156, 1.156344, 1, 1, 1, 1, 1,
0.5324273, 2.013368, 0.3814595, 1, 1, 1, 1, 1,
0.5372454, -0.4850133, 2.548712, 1, 1, 1, 1, 1,
0.5388524, 0.1153126, 0.5043942, 1, 1, 1, 1, 1,
0.5442322, -0.3691332, 1.64775, 1, 1, 1, 1, 1,
0.5504073, -0.1163422, 1.724696, 1, 1, 1, 1, 1,
0.5514724, 0.0882956, 2.243265, 1, 1, 1, 1, 1,
0.5530735, 0.9750943, 1.530404, 1, 1, 1, 1, 1,
0.5534018, 1.656887, 0.7232822, 1, 1, 1, 1, 1,
0.5538848, -1.948012, 2.052997, 1, 1, 1, 1, 1,
0.5557405, 0.3892324, -0.6693807, 1, 1, 1, 1, 1,
0.5566032, 0.0004255894, 1.424366, 1, 1, 1, 1, 1,
0.5664085, 1.153043, 2.489504, 1, 1, 1, 1, 1,
0.5664327, -0.6271391, 2.479475, 1, 1, 1, 1, 1,
0.5692309, 0.5512651, 1.041924, 1, 1, 1, 1, 1,
0.5696377, -0.09783104, -0.01382745, 0, 0, 1, 1, 1,
0.5712339, -0.3976126, 1.986904, 1, 0, 0, 1, 1,
0.5716942, 0.292946, -0.09625905, 1, 0, 0, 1, 1,
0.5749288, 0.07024202, 0.990555, 1, 0, 0, 1, 1,
0.580686, 0.7625172, -0.9602141, 1, 0, 0, 1, 1,
0.5814291, -0.8862393, 2.457628, 1, 0, 0, 1, 1,
0.5868816, 0.7351138, 0.9688889, 0, 0, 0, 1, 1,
0.5883225, -1.644602, 3.465972, 0, 0, 0, 1, 1,
0.5929182, 0.2319518, 2.024287, 0, 0, 0, 1, 1,
0.5959156, -0.7653863, 3.609864, 0, 0, 0, 1, 1,
0.6034, 0.484984, 0.8212101, 0, 0, 0, 1, 1,
0.6063945, 1.183868, 1.01693, 0, 0, 0, 1, 1,
0.6066895, 0.7789901, 0.2184665, 0, 0, 0, 1, 1,
0.6177627, 0.1726293, 2.312281, 1, 1, 1, 1, 1,
0.6200159, 0.5545675, 0.9260582, 1, 1, 1, 1, 1,
0.6202968, -0.850293, 1.606043, 1, 1, 1, 1, 1,
0.6271399, -0.4972105, 4.070833, 1, 1, 1, 1, 1,
0.6306174, 0.4752828, 4.101506, 1, 1, 1, 1, 1,
0.6308184, -0.8110558, 2.235427, 1, 1, 1, 1, 1,
0.6311711, -0.3603669, 0.2530596, 1, 1, 1, 1, 1,
0.6313634, -0.3708861, 1.044993, 1, 1, 1, 1, 1,
0.6325151, -1.334212, 1.697927, 1, 1, 1, 1, 1,
0.6359556, -0.4412262, 1.518515, 1, 1, 1, 1, 1,
0.6393153, 0.2524954, 2.835821, 1, 1, 1, 1, 1,
0.6465105, -0.2782343, 2.254537, 1, 1, 1, 1, 1,
0.6471952, -0.02443475, 1.564889, 1, 1, 1, 1, 1,
0.6481082, -0.6151271, 2.671339, 1, 1, 1, 1, 1,
0.6547372, -0.4424738, 1.857135, 1, 1, 1, 1, 1,
0.6547998, 0.006424536, 1.57839, 0, 0, 1, 1, 1,
0.6579059, 1.936688, 2.540197, 1, 0, 0, 1, 1,
0.6613182, -1.67114, 2.784374, 1, 0, 0, 1, 1,
0.6637734, 0.1358183, 2.971823, 1, 0, 0, 1, 1,
0.6659852, -0.4613441, 4.094661, 1, 0, 0, 1, 1,
0.6704257, 0.405033, 1.528209, 1, 0, 0, 1, 1,
0.6711915, -1.017871, 3.62588, 0, 0, 0, 1, 1,
0.6721923, -2.634563, 3.161551, 0, 0, 0, 1, 1,
0.6763769, 0.7141142, -1.049171, 0, 0, 0, 1, 1,
0.6787424, -0.2892682, 2.125809, 0, 0, 0, 1, 1,
0.6792119, 0.5684565, -0.3650456, 0, 0, 0, 1, 1,
0.679247, 0.1102141, 1.874336, 0, 0, 0, 1, 1,
0.6832272, -0.9452409, 2.12552, 0, 0, 0, 1, 1,
0.6900299, -0.3471708, 2.624669, 1, 1, 1, 1, 1,
0.6930526, 0.1417494, 2.301198, 1, 1, 1, 1, 1,
0.6935732, -0.1848404, 0.1753392, 1, 1, 1, 1, 1,
0.6980411, -1.394806, 3.337611, 1, 1, 1, 1, 1,
0.6987867, -0.02863053, 2.096369, 1, 1, 1, 1, 1,
0.7067425, 0.1815716, -0.8047671, 1, 1, 1, 1, 1,
0.7072883, -0.1323183, 1.735681, 1, 1, 1, 1, 1,
0.7143422, -1.47175, 1.345966, 1, 1, 1, 1, 1,
0.7174725, -0.6850958, 1.25676, 1, 1, 1, 1, 1,
0.71749, -0.5272361, 1.151698, 1, 1, 1, 1, 1,
0.7197682, 0.3694358, 1.377145, 1, 1, 1, 1, 1,
0.7206112, 0.2479964, 3.181786, 1, 1, 1, 1, 1,
0.7255611, 1.786892, -1.010368, 1, 1, 1, 1, 1,
0.7260203, -1.366395, 4.256383, 1, 1, 1, 1, 1,
0.727582, 0.37231, 1.718173, 1, 1, 1, 1, 1,
0.7283809, 1.858142, 0.5688922, 0, 0, 1, 1, 1,
0.7306704, -0.2263453, 2.200954, 1, 0, 0, 1, 1,
0.7326025, 0.9386349, 2.771198, 1, 0, 0, 1, 1,
0.7369425, 0.5656638, 1.446738, 1, 0, 0, 1, 1,
0.7377372, 1.536442, 1.415025, 1, 0, 0, 1, 1,
0.7477617, 0.6318874, -0.3474002, 1, 0, 0, 1, 1,
0.7496515, 0.8292058, 0.9844634, 0, 0, 0, 1, 1,
0.7520829, -0.5878525, 4.047159, 0, 0, 0, 1, 1,
0.7535796, 2.221366, 0.9356632, 0, 0, 0, 1, 1,
0.754153, -0.6479579, 0.3548356, 0, 0, 0, 1, 1,
0.7602984, 0.1870983, 2.723196, 0, 0, 0, 1, 1,
0.761306, -0.8926708, 2.671425, 0, 0, 0, 1, 1,
0.7614976, 1.004784, 0.98787, 0, 0, 0, 1, 1,
0.7644668, 0.3339807, 1.206149, 1, 1, 1, 1, 1,
0.7656987, 0.01554007, 1.811282, 1, 1, 1, 1, 1,
0.7661248, -1.849672, 3.092794, 1, 1, 1, 1, 1,
0.7751446, 0.406278, 2.239565, 1, 1, 1, 1, 1,
0.7778371, -1.168646, 3.152178, 1, 1, 1, 1, 1,
0.7781178, -0.07269389, 1.995608, 1, 1, 1, 1, 1,
0.779794, 0.7366714, 0.7595687, 1, 1, 1, 1, 1,
0.7817003, -1.750423, 3.386551, 1, 1, 1, 1, 1,
0.7818869, -0.5378085, 2.751433, 1, 1, 1, 1, 1,
0.7821875, -0.2855478, 2.63237, 1, 1, 1, 1, 1,
0.7831743, 2.603883, 1.456914, 1, 1, 1, 1, 1,
0.7838861, -0.2884159, 3.541637, 1, 1, 1, 1, 1,
0.7905278, -1.978436, 1.626369, 1, 1, 1, 1, 1,
0.7988705, 2.590477, 2.078484, 1, 1, 1, 1, 1,
0.8042678, -2.329642, 4.215064, 1, 1, 1, 1, 1,
0.8072611, 0.4587869, 1.929393, 0, 0, 1, 1, 1,
0.8096266, -0.900929, 3.075361, 1, 0, 0, 1, 1,
0.8121016, 1.597216, 1.036375, 1, 0, 0, 1, 1,
0.815869, 1.691649, -0.6847735, 1, 0, 0, 1, 1,
0.8160865, 1.054908, 1.030459, 1, 0, 0, 1, 1,
0.8195273, 0.8324036, 0.6086971, 1, 0, 0, 1, 1,
0.8295053, -0.153519, 0.9676611, 0, 0, 0, 1, 1,
0.8337505, -1.027944, 3.381198, 0, 0, 0, 1, 1,
0.8351449, 0.05288195, 1.224189, 0, 0, 0, 1, 1,
0.8352671, 0.08787982, 0.82234, 0, 0, 0, 1, 1,
0.8389902, 0.4919464, 0.7834296, 0, 0, 0, 1, 1,
0.8418261, 0.7353374, 2.094138, 0, 0, 0, 1, 1,
0.8436379, -0.3395841, 2.56882, 0, 0, 0, 1, 1,
0.8439071, 0.2970912, -0.2241828, 1, 1, 1, 1, 1,
0.8483729, -0.3924805, 0.7362576, 1, 1, 1, 1, 1,
0.8485802, 0.4712925, 0.8632837, 1, 1, 1, 1, 1,
0.8492508, -0.5179071, 1.530452, 1, 1, 1, 1, 1,
0.8532121, 0.1740137, 3.295113, 1, 1, 1, 1, 1,
0.8636418, 0.681875, 0.3598104, 1, 1, 1, 1, 1,
0.864226, 0.9668545, 1.728734, 1, 1, 1, 1, 1,
0.8650811, -0.7651186, 2.300013, 1, 1, 1, 1, 1,
0.8663256, -1.766781, 3.03687, 1, 1, 1, 1, 1,
0.8676514, -0.6344402, 1.763703, 1, 1, 1, 1, 1,
0.8703626, -0.1855858, 2.202014, 1, 1, 1, 1, 1,
0.8749171, -0.6561328, 3.614955, 1, 1, 1, 1, 1,
0.8773019, 2.118259, -1.238156, 1, 1, 1, 1, 1,
0.877304, 0.9836324, 2.37308, 1, 1, 1, 1, 1,
0.8852752, -0.03018583, 1.893231, 1, 1, 1, 1, 1,
0.8860623, -1.731664, 2.531412, 0, 0, 1, 1, 1,
0.8873094, 0.8579826, -0.6193828, 1, 0, 0, 1, 1,
0.8927928, -0.9716754, 1.083555, 1, 0, 0, 1, 1,
0.8942963, -1.661571, 1.704643, 1, 0, 0, 1, 1,
0.8981601, 0.1775123, 0.8288878, 1, 0, 0, 1, 1,
0.8982474, 0.6704403, 1.319449, 1, 0, 0, 1, 1,
0.905236, -1.291255, 0.8612202, 0, 0, 0, 1, 1,
0.9091248, -0.5295347, 3.958221, 0, 0, 0, 1, 1,
0.9151481, 0.877578, 0.465874, 0, 0, 0, 1, 1,
0.9161963, -0.6532747, 2.093751, 0, 0, 0, 1, 1,
0.9180775, 0.9181898, -0.5116891, 0, 0, 0, 1, 1,
0.9188557, -1.171587, 3.756877, 0, 0, 0, 1, 1,
0.9220209, -1.14737, 0.3036955, 0, 0, 0, 1, 1,
0.9331984, -2.055643, 1.48111, 1, 1, 1, 1, 1,
0.9338969, 1.925285, 1.197164, 1, 1, 1, 1, 1,
0.935253, 0.1158092, 0.8799662, 1, 1, 1, 1, 1,
0.936377, -0.6158814, 3.574478, 1, 1, 1, 1, 1,
0.9383604, -0.3125197, 3.349231, 1, 1, 1, 1, 1,
0.9392931, 0.2705368, 2.049294, 1, 1, 1, 1, 1,
0.9410582, -0.06456364, 1.175234, 1, 1, 1, 1, 1,
0.9453409, 0.1450496, 3.83942, 1, 1, 1, 1, 1,
0.9505823, -3.274882, 1.269344, 1, 1, 1, 1, 1,
0.9618716, 0.619364, 0.6029681, 1, 1, 1, 1, 1,
0.9671819, 0.5703311, 0.5588843, 1, 1, 1, 1, 1,
0.9720165, 0.9859596, -0.3626604, 1, 1, 1, 1, 1,
0.991849, 0.02967525, 1.716559, 1, 1, 1, 1, 1,
0.9930233, 1.021097, 2.082552, 1, 1, 1, 1, 1,
0.9988852, -1.717855, 3.128623, 1, 1, 1, 1, 1,
1.001896, 0.287038, 2.250631, 0, 0, 1, 1, 1,
1.00445, -0.5749558, 1.75534, 1, 0, 0, 1, 1,
1.015296, -0.4976539, 3.242193, 1, 0, 0, 1, 1,
1.01768, 0.5342316, -0.04024493, 1, 0, 0, 1, 1,
1.018478, 0.5676581, 0.9032096, 1, 0, 0, 1, 1,
1.021325, 0.1844826, 0.4101276, 1, 0, 0, 1, 1,
1.028805, 1.414917, 1.586922, 0, 0, 0, 1, 1,
1.038867, 2.181665, 1.917678, 0, 0, 0, 1, 1,
1.039934, 0.01302128, 1.799276, 0, 0, 0, 1, 1,
1.041108, -1.487447, 3.9158, 0, 0, 0, 1, 1,
1.043762, 0.5044839, 1.134132, 0, 0, 0, 1, 1,
1.050383, 0.8344575, 0.7317954, 0, 0, 0, 1, 1,
1.057523, -0.7873935, 0.5255908, 0, 0, 0, 1, 1,
1.059995, 1.727955, -0.3442352, 1, 1, 1, 1, 1,
1.063689, -0.7098307, 2.128903, 1, 1, 1, 1, 1,
1.07046, 1.469885, 2.005346, 1, 1, 1, 1, 1,
1.074669, 0.8659439, -0.07961439, 1, 1, 1, 1, 1,
1.076157, 0.1928566, -0.3016579, 1, 1, 1, 1, 1,
1.077325, -0.2338117, 1.497686, 1, 1, 1, 1, 1,
1.078161, -0.7390782, 2.705244, 1, 1, 1, 1, 1,
1.079008, 0.6249886, -0.5981873, 1, 1, 1, 1, 1,
1.079812, -1.639593, 1.727868, 1, 1, 1, 1, 1,
1.084015, 1.213174, -0.3895767, 1, 1, 1, 1, 1,
1.085062, -0.03796187, 0.9335595, 1, 1, 1, 1, 1,
1.088945, -0.6804026, 1.837087, 1, 1, 1, 1, 1,
1.090006, 0.6370909, 2.134996, 1, 1, 1, 1, 1,
1.093486, -0.1455546, 1.429759, 1, 1, 1, 1, 1,
1.094803, 0.4089793, 0.8313174, 1, 1, 1, 1, 1,
1.097575, -1.230862, 2.418914, 0, 0, 1, 1, 1,
1.110312, -0.6447526, -0.1025681, 1, 0, 0, 1, 1,
1.113808, -1.410321, 4.615324, 1, 0, 0, 1, 1,
1.114341, -1.953086, 0.7837614, 1, 0, 0, 1, 1,
1.115635, 0.05966146, 1.141174, 1, 0, 0, 1, 1,
1.126539, 1.523272, 0.5843638, 1, 0, 0, 1, 1,
1.138631, -0.8605583, 1.118889, 0, 0, 0, 1, 1,
1.141219, 0.8126665, 0.3903717, 0, 0, 0, 1, 1,
1.153543, 0.3913428, 0.4229481, 0, 0, 0, 1, 1,
1.163885, 0.6189403, 0.4313065, 0, 0, 0, 1, 1,
1.170233, -1.85297, 2.797744, 0, 0, 0, 1, 1,
1.182915, -0.8679506, 4.105741, 0, 0, 0, 1, 1,
1.193736, -0.470778, 3.393934, 0, 0, 0, 1, 1,
1.196009, -0.2454671, 1.793503, 1, 1, 1, 1, 1,
1.197342, 0.2391667, 1.352871, 1, 1, 1, 1, 1,
1.203718, -0.04682472, -0.3289365, 1, 1, 1, 1, 1,
1.206361, -0.1117879, 2.445625, 1, 1, 1, 1, 1,
1.214214, -0.997248, 2.206685, 1, 1, 1, 1, 1,
1.215412, 0.5508333, 0.6023172, 1, 1, 1, 1, 1,
1.216669, -0.6469487, 2.391574, 1, 1, 1, 1, 1,
1.225726, 0.6177899, 0.733055, 1, 1, 1, 1, 1,
1.233821, 0.598056, 1.360903, 1, 1, 1, 1, 1,
1.246471, 1.689294, 1.187246, 1, 1, 1, 1, 1,
1.247611, 1.861929, -0.6639439, 1, 1, 1, 1, 1,
1.249047, -0.5032889, 1.54013, 1, 1, 1, 1, 1,
1.267043, -1.315472, 4.081318, 1, 1, 1, 1, 1,
1.269875, -0.3563916, 1.59578, 1, 1, 1, 1, 1,
1.272659, 1.102131, 1.719635, 1, 1, 1, 1, 1,
1.280297, 0.4619233, -1.103821, 0, 0, 1, 1, 1,
1.281335, -0.3447624, 4.090137, 1, 0, 0, 1, 1,
1.281533, 0.1986067, 1.765006, 1, 0, 0, 1, 1,
1.287517, 0.8645831, 2.023026, 1, 0, 0, 1, 1,
1.289623, 2.077342, -0.3147658, 1, 0, 0, 1, 1,
1.295202, -0.1615927, 3.094542, 1, 0, 0, 1, 1,
1.295654, 0.3301418, 1.438945, 0, 0, 0, 1, 1,
1.296891, -0.2852136, 0.07298113, 0, 0, 0, 1, 1,
1.300997, -1.949313, 0.7817364, 0, 0, 0, 1, 1,
1.302068, 0.9041263, 0.9591885, 0, 0, 0, 1, 1,
1.310704, -0.9078794, 2.333524, 0, 0, 0, 1, 1,
1.311255, 1.84577, 0.1638831, 0, 0, 0, 1, 1,
1.314349, -0.2481674, 3.326152, 0, 0, 0, 1, 1,
1.319854, -0.03708844, 2.44417, 1, 1, 1, 1, 1,
1.328054, -0.3096465, -0.2863729, 1, 1, 1, 1, 1,
1.332615, 0.3654721, 1.472648, 1, 1, 1, 1, 1,
1.336165, 0.6176272, 0.7857317, 1, 1, 1, 1, 1,
1.337741, -1.217968, 1.184931, 1, 1, 1, 1, 1,
1.338873, -0.8892685, 3.013321, 1, 1, 1, 1, 1,
1.343948, -0.1976105, 1.593757, 1, 1, 1, 1, 1,
1.34462, -1.808311, 2.114846, 1, 1, 1, 1, 1,
1.34677, 0.2582061, 1.905679, 1, 1, 1, 1, 1,
1.347287, -0.5412045, 2.056341, 1, 1, 1, 1, 1,
1.350847, -0.7396275, 3.171654, 1, 1, 1, 1, 1,
1.373342, -0.2057721, 2.892154, 1, 1, 1, 1, 1,
1.373961, -0.1032475, 0.4381974, 1, 1, 1, 1, 1,
1.374619, 1.418167, 1.19673, 1, 1, 1, 1, 1,
1.375565, 1.330456, 2.119936, 1, 1, 1, 1, 1,
1.377467, 0.04093413, 2.896915, 0, 0, 1, 1, 1,
1.395153, 2.098115, -0.9094844, 1, 0, 0, 1, 1,
1.397176, 0.1266352, 2.998527, 1, 0, 0, 1, 1,
1.40631, 1.125443, 0.2630677, 1, 0, 0, 1, 1,
1.415627, 0.2689182, 1.839122, 1, 0, 0, 1, 1,
1.426269, 0.7115694, 1.515102, 1, 0, 0, 1, 1,
1.441044, -0.0144103, -0.1152959, 0, 0, 0, 1, 1,
1.463235, 1.476648, -0.2035626, 0, 0, 0, 1, 1,
1.509562, -0.3219467, 1.419238, 0, 0, 0, 1, 1,
1.530189, 0.3189141, 3.268315, 0, 0, 0, 1, 1,
1.53386, -0.07077846, 1.191707, 0, 0, 0, 1, 1,
1.5352, 0.3024148, 1.199211, 0, 0, 0, 1, 1,
1.538283, -1.280806, 1.555354, 0, 0, 0, 1, 1,
1.551433, 0.2231975, 1.778656, 1, 1, 1, 1, 1,
1.575128, -0.1509066, 0.8064216, 1, 1, 1, 1, 1,
1.579771, -0.3014512, 1.115058, 1, 1, 1, 1, 1,
1.5857, -1.995248, 2.618385, 1, 1, 1, 1, 1,
1.596548, -0.3805656, 1.383183, 1, 1, 1, 1, 1,
1.598784, 1.13392, -0.05045861, 1, 1, 1, 1, 1,
1.603546, -0.7811326, 2.275458, 1, 1, 1, 1, 1,
1.604775, -0.8226267, 3.181644, 1, 1, 1, 1, 1,
1.607595, 1.756812, 2.547821, 1, 1, 1, 1, 1,
1.619208, -1.179734, 1.686069, 1, 1, 1, 1, 1,
1.620762, -1.07687, 2.916904, 1, 1, 1, 1, 1,
1.622587, -0.5818163, -0.9752734, 1, 1, 1, 1, 1,
1.625759, -0.1573927, 0.5832965, 1, 1, 1, 1, 1,
1.631889, 0.4828771, 0.7058609, 1, 1, 1, 1, 1,
1.633486, -0.4394765, -0.1006022, 1, 1, 1, 1, 1,
1.642129, 0.3349116, 0.8278513, 0, 0, 1, 1, 1,
1.668246, -1.153963, 2.480208, 1, 0, 0, 1, 1,
1.687951, -0.5534935, 0.7845736, 1, 0, 0, 1, 1,
1.690722, 1.273956, 0.5336053, 1, 0, 0, 1, 1,
1.714701, 0.7540454, 2.08692, 1, 0, 0, 1, 1,
1.721008, 0.2473524, 1.58168, 1, 0, 0, 1, 1,
1.721387, 0.5575545, 1.387551, 0, 0, 0, 1, 1,
1.725151, 2.915367, 0.03007827, 0, 0, 0, 1, 1,
1.736923, -1.423571, 1.620851, 0, 0, 0, 1, 1,
1.746791, -0.2506959, 1.75066, 0, 0, 0, 1, 1,
1.759401, 0.8035139, 1.286897, 0, 0, 0, 1, 1,
1.76829, -0.2671341, 1.862113, 0, 0, 0, 1, 1,
1.779644, 1.006144, 0.5595837, 0, 0, 0, 1, 1,
1.805131, -0.7997773, 2.356269, 1, 1, 1, 1, 1,
1.822972, -1.245671, 3.29106, 1, 1, 1, 1, 1,
1.827721, 1.376256, 2.249849, 1, 1, 1, 1, 1,
1.833127, 0.88286, 0.1186681, 1, 1, 1, 1, 1,
1.893533, -0.9182096, 3.476838, 1, 1, 1, 1, 1,
1.937285, -0.486897, 1.676122, 1, 1, 1, 1, 1,
1.95387, 0.8669811, 3.015007, 1, 1, 1, 1, 1,
1.954099, 1.585628, 2.090337, 1, 1, 1, 1, 1,
1.955975, -1.119377, 1.753961, 1, 1, 1, 1, 1,
1.96294, 0.3094976, -0.01125688, 1, 1, 1, 1, 1,
1.963684, -1.892748, 3.071642, 1, 1, 1, 1, 1,
1.965687, -0.9161665, 0.681289, 1, 1, 1, 1, 1,
1.967511, 0.676002, 2.506854, 1, 1, 1, 1, 1,
1.975596, -0.1296569, 3.926274, 1, 1, 1, 1, 1,
1.980939, -1.005446, 1.704768, 1, 1, 1, 1, 1,
1.98495, 1.111341, 2.088197, 0, 0, 1, 1, 1,
1.995078, -0.2718056, 2.217618, 1, 0, 0, 1, 1,
2.028753, -1.937258, 2.52309, 1, 0, 0, 1, 1,
2.040019, 0.89504, 0.5758677, 1, 0, 0, 1, 1,
2.060441, 0.2466451, 1.612617, 1, 0, 0, 1, 1,
2.154028, -1.3495, 1.689835, 1, 0, 0, 1, 1,
2.168159, 0.3992858, 2.46555, 0, 0, 0, 1, 1,
2.182572, -2.241628, 3.470639, 0, 0, 0, 1, 1,
2.185281, 0.3416787, 2.470305, 0, 0, 0, 1, 1,
2.246386, -0.9329413, 3.669923, 0, 0, 0, 1, 1,
2.307975, 0.2066336, -0.3482856, 0, 0, 0, 1, 1,
2.354465, -0.3240832, 3.496723, 0, 0, 0, 1, 1,
2.374698, 0.6264815, 3.41755, 0, 0, 0, 1, 1,
2.394328, 0.5196481, 2.931385, 1, 1, 1, 1, 1,
2.433863, -0.1015072, 2.640232, 1, 1, 1, 1, 1,
2.441271, 0.2933729, 2.764198, 1, 1, 1, 1, 1,
2.454863, 0.5165851, 1.550067, 1, 1, 1, 1, 1,
2.464557, 1.888776, 2.171763, 1, 1, 1, 1, 1,
2.484338, -2.270004, 2.815329, 1, 1, 1, 1, 1,
3.158182, -1.212101, 2.817783, 1, 1, 1, 1, 1
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
var radius = 9.209672;
var distance = 32.34858;
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
mvMatrix.translate( 0.1184711, 0.1797577, 0.3039463 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.34858);
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
