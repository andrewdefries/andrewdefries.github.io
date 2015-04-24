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
-3.228076, -0.5619834, -1.957662, 1, 0, 0, 1,
-3.131855, 0.2585847, -3.546537, 1, 0.007843138, 0, 1,
-2.80536, 0.9296094, -2.739446, 1, 0.01176471, 0, 1,
-2.763571, 1.398158, -1.880609, 1, 0.01960784, 0, 1,
-2.710905, 0.07920348, -0.1949975, 1, 0.02352941, 0, 1,
-2.581937, 0.3561682, 0.7131313, 1, 0.03137255, 0, 1,
-2.503457, 0.2551529, -0.7361739, 1, 0.03529412, 0, 1,
-2.475278, -1.476924, -3.545946, 1, 0.04313726, 0, 1,
-2.415904, -0.1130493, -1.922585, 1, 0.04705882, 0, 1,
-2.391817, 0.1866791, -1.798513, 1, 0.05490196, 0, 1,
-2.386362, 0.303304, -0.3598063, 1, 0.05882353, 0, 1,
-2.378793, 1.481062, -0.732526, 1, 0.06666667, 0, 1,
-2.357065, -0.05439046, -0.8178053, 1, 0.07058824, 0, 1,
-2.251598, -0.6186785, -1.107916, 1, 0.07843138, 0, 1,
-2.236582, -0.9803751, -3.323552, 1, 0.08235294, 0, 1,
-2.214508, 1.703778, -1.03143, 1, 0.09019608, 0, 1,
-2.192932, -0.5803028, -2.611748, 1, 0.09411765, 0, 1,
-2.09884, -0.2036763, -1.728752, 1, 0.1019608, 0, 1,
-2.068649, -0.6951573, -2.246289, 1, 0.1098039, 0, 1,
-2.026163, 0.2838183, -1.631315, 1, 0.1137255, 0, 1,
-1.982635, -1.664082, -1.607801, 1, 0.1215686, 0, 1,
-1.972529, 1.144622, -2.884106, 1, 0.1254902, 0, 1,
-1.943147, 1.444253, -0.8271238, 1, 0.1333333, 0, 1,
-1.939539, -1.892564, -1.397095, 1, 0.1372549, 0, 1,
-1.920305, -1.03809, -2.849076, 1, 0.145098, 0, 1,
-1.914693, -0.7323461, -1.698204, 1, 0.1490196, 0, 1,
-1.907784, -0.6873519, -1.072396, 1, 0.1568628, 0, 1,
-1.900038, 0.860629, -1.020594, 1, 0.1607843, 0, 1,
-1.891702, -0.4982047, -0.9273468, 1, 0.1686275, 0, 1,
-1.890114, -0.04227763, -3.058339, 1, 0.172549, 0, 1,
-1.864155, -0.3030691, -0.9445672, 1, 0.1803922, 0, 1,
-1.828661, 0.1597767, -1.734899, 1, 0.1843137, 0, 1,
-1.822831, -0.1173166, -1.392604, 1, 0.1921569, 0, 1,
-1.816071, -0.9920484, -2.278075, 1, 0.1960784, 0, 1,
-1.800979, 1.189949, -2.259673, 1, 0.2039216, 0, 1,
-1.779453, 1.348237, -0.7588058, 1, 0.2117647, 0, 1,
-1.772323, 0.9859045, -1.12112, 1, 0.2156863, 0, 1,
-1.772151, 0.6137591, -0.5400062, 1, 0.2235294, 0, 1,
-1.770737, 1.097374, -0.6157695, 1, 0.227451, 0, 1,
-1.769949, -0.8219024, -2.565606, 1, 0.2352941, 0, 1,
-1.769152, -0.2080536, -2.098789, 1, 0.2392157, 0, 1,
-1.75851, -0.258239, 0.3673105, 1, 0.2470588, 0, 1,
-1.739801, 0.598859, -2.248321, 1, 0.2509804, 0, 1,
-1.719246, 1.319142, -1.42987, 1, 0.2588235, 0, 1,
-1.716201, 0.8816096, -1.542689, 1, 0.2627451, 0, 1,
-1.714838, -1.045805, -2.158098, 1, 0.2705882, 0, 1,
-1.686603, -1.223047, -0.6166199, 1, 0.2745098, 0, 1,
-1.684465, 0.4302579, -2.02778, 1, 0.282353, 0, 1,
-1.675387, -0.3577113, -1.884153, 1, 0.2862745, 0, 1,
-1.672709, 0.6060389, -1.738024, 1, 0.2941177, 0, 1,
-1.668424, -1.365704, -1.963284, 1, 0.3019608, 0, 1,
-1.666781, -0.1109634, -1.685657, 1, 0.3058824, 0, 1,
-1.656829, 0.4453912, -1.1008, 1, 0.3137255, 0, 1,
-1.64833, 1.372668, -1.386731, 1, 0.3176471, 0, 1,
-1.635963, -1.098279, -4.797287, 1, 0.3254902, 0, 1,
-1.630938, -0.5548322, -2.126975, 1, 0.3294118, 0, 1,
-1.608639, 0.3590148, -0.7487285, 1, 0.3372549, 0, 1,
-1.577533, -0.6319341, -3.503458, 1, 0.3411765, 0, 1,
-1.575062, -1.669534, -1.277625, 1, 0.3490196, 0, 1,
-1.571727, -0.9578294, -2.667393, 1, 0.3529412, 0, 1,
-1.571004, 0.8162243, -1.225649, 1, 0.3607843, 0, 1,
-1.559663, 0.1640147, -0.6888051, 1, 0.3647059, 0, 1,
-1.52911, -0.5659914, -1.001203, 1, 0.372549, 0, 1,
-1.528515, -0.2928374, -2.103216, 1, 0.3764706, 0, 1,
-1.52831, -1.681778, -1.876335, 1, 0.3843137, 0, 1,
-1.520687, 0.6730518, -0.9313729, 1, 0.3882353, 0, 1,
-1.51076, 0.5824712, -1.376643, 1, 0.3960784, 0, 1,
-1.507781, 1.675475, -0.450139, 1, 0.4039216, 0, 1,
-1.507397, 1.056465, -1.305688, 1, 0.4078431, 0, 1,
-1.507361, -1.218585, -3.209564, 1, 0.4156863, 0, 1,
-1.499109, -1.363254, -2.091236, 1, 0.4196078, 0, 1,
-1.496768, -0.02268662, -0.109692, 1, 0.427451, 0, 1,
-1.489262, -0.9426334, -0.4235115, 1, 0.4313726, 0, 1,
-1.480467, -2.069351, -4.667191, 1, 0.4392157, 0, 1,
-1.473145, 0.5970478, -3.195838, 1, 0.4431373, 0, 1,
-1.472848, -0.1941871, -1.156906, 1, 0.4509804, 0, 1,
-1.472663, 0.6943285, 0.8310282, 1, 0.454902, 0, 1,
-1.466448, 0.4391975, -0.6467841, 1, 0.4627451, 0, 1,
-1.43971, 0.5324338, 0.246938, 1, 0.4666667, 0, 1,
-1.434769, 1.007044, -0.6199518, 1, 0.4745098, 0, 1,
-1.426928, 0.3479128, -2.152654, 1, 0.4784314, 0, 1,
-1.420852, -0.7168016, -2.624913, 1, 0.4862745, 0, 1,
-1.420463, 0.09551881, -1.855936, 1, 0.4901961, 0, 1,
-1.419192, -1.439035, -2.472294, 1, 0.4980392, 0, 1,
-1.414999, 0.9833521, -0.9030812, 1, 0.5058824, 0, 1,
-1.403185, -0.1591806, -0.04686714, 1, 0.509804, 0, 1,
-1.401013, -0.5300067, -1.244882, 1, 0.5176471, 0, 1,
-1.399227, -0.82173, -2.84907, 1, 0.5215687, 0, 1,
-1.393268, -2.440781, -1.916498, 1, 0.5294118, 0, 1,
-1.392476, -0.5970085, -2.690354, 1, 0.5333334, 0, 1,
-1.391372, -1.164752, -3.032718, 1, 0.5411765, 0, 1,
-1.385481, 0.1147446, -1.265038, 1, 0.5450981, 0, 1,
-1.367657, 0.431518, 0.2330175, 1, 0.5529412, 0, 1,
-1.363329, -1.017548, -3.283034, 1, 0.5568628, 0, 1,
-1.358681, 1.458295, 0.4162834, 1, 0.5647059, 0, 1,
-1.331837, 0.6235971, -2.824473, 1, 0.5686275, 0, 1,
-1.327232, -0.8406773, -2.219053, 1, 0.5764706, 0, 1,
-1.29718, 0.3566178, -1.61851, 1, 0.5803922, 0, 1,
-1.295007, -0.4277298, -0.6507336, 1, 0.5882353, 0, 1,
-1.294448, 0.3122154, -3.126388, 1, 0.5921569, 0, 1,
-1.293034, 0.4042413, -2.387085, 1, 0.6, 0, 1,
-1.284003, 0.03627823, -1.729037, 1, 0.6078432, 0, 1,
-1.273471, 0.02247175, -1.327431, 1, 0.6117647, 0, 1,
-1.257638, -0.2536933, -1.635824, 1, 0.6196079, 0, 1,
-1.243044, 1.544524, -1.619984, 1, 0.6235294, 0, 1,
-1.241411, -0.9954897, -3.41315, 1, 0.6313726, 0, 1,
-1.240455, 1.706394, -0.6524647, 1, 0.6352941, 0, 1,
-1.237369, -0.1013185, -0.3381395, 1, 0.6431373, 0, 1,
-1.224041, -0.4386215, -2.243933, 1, 0.6470588, 0, 1,
-1.222124, 1.406706, 0.2971429, 1, 0.654902, 0, 1,
-1.219937, -0.9621976, -3.63962, 1, 0.6588235, 0, 1,
-1.215646, -0.3077225, -1.901265, 1, 0.6666667, 0, 1,
-1.215615, -0.1756582, 0.1282995, 1, 0.6705883, 0, 1,
-1.208541, -0.2473271, -3.324574, 1, 0.6784314, 0, 1,
-1.204979, -0.04777042, -2.290722, 1, 0.682353, 0, 1,
-1.192567, 0.9382333, -1.005397, 1, 0.6901961, 0, 1,
-1.171553, 0.3333878, 0.2250672, 1, 0.6941177, 0, 1,
-1.162093, -2.474231, -1.395271, 1, 0.7019608, 0, 1,
-1.158018, -0.1598693, -0.9571127, 1, 0.7098039, 0, 1,
-1.15512, 0.5834752, -1.485536, 1, 0.7137255, 0, 1,
-1.149872, 0.411541, -2.256796, 1, 0.7215686, 0, 1,
-1.144113, -0.2155225, -2.49956, 1, 0.7254902, 0, 1,
-1.13238, -0.46522, -1.560387, 1, 0.7333333, 0, 1,
-1.114625, 2.23627, -0.6571228, 1, 0.7372549, 0, 1,
-1.11243, -0.7985711, -1.300042, 1, 0.7450981, 0, 1,
-1.110608, -0.865847, -3.657143, 1, 0.7490196, 0, 1,
-1.107019, -2.509768, -2.643134, 1, 0.7568628, 0, 1,
-1.102985, 0.136963, -1.692642, 1, 0.7607843, 0, 1,
-1.09564, 0.955987, -0.7144411, 1, 0.7686275, 0, 1,
-1.09356, -0.3866388, -3.152866, 1, 0.772549, 0, 1,
-1.092359, 1.842641, 0.1126003, 1, 0.7803922, 0, 1,
-1.092307, 2.133351, 0.609924, 1, 0.7843137, 0, 1,
-1.091892, -1.778946, -1.825148, 1, 0.7921569, 0, 1,
-1.089437, 1.371964, -1.020867, 1, 0.7960784, 0, 1,
-1.088658, 1.403431, -1.421175, 1, 0.8039216, 0, 1,
-1.086605, -0.7225025, -3.343657, 1, 0.8117647, 0, 1,
-1.084867, -0.3164003, -3.15292, 1, 0.8156863, 0, 1,
-1.075366, -0.1714993, -1.492015, 1, 0.8235294, 0, 1,
-1.07441, -0.833697, -3.729052, 1, 0.827451, 0, 1,
-1.068848, 0.4028868, -1.530588, 1, 0.8352941, 0, 1,
-1.065558, 0.1015213, 0.8142694, 1, 0.8392157, 0, 1,
-1.058424, -0.1367926, -4.151235, 1, 0.8470588, 0, 1,
-1.054155, 1.024416, -0.2703935, 1, 0.8509804, 0, 1,
-1.050547, 0.7702654, -1.125545, 1, 0.8588235, 0, 1,
-1.047391, 0.6481801, 0.9265832, 1, 0.8627451, 0, 1,
-1.043299, -0.5257312, -2.735182, 1, 0.8705882, 0, 1,
-1.040545, -0.5206847, -2.080595, 1, 0.8745098, 0, 1,
-1.034444, 0.6727212, -1.861674, 1, 0.8823529, 0, 1,
-1.017813, -0.4819205, -2.8097, 1, 0.8862745, 0, 1,
-1.017256, -0.6436589, -2.264058, 1, 0.8941177, 0, 1,
-1.015088, 2.336384, -1.316275, 1, 0.8980392, 0, 1,
-1.011154, -1.480364, -1.992422, 1, 0.9058824, 0, 1,
-1.010699, 0.7272782, 0.1538559, 1, 0.9137255, 0, 1,
-1.009413, -0.08678938, -2.842803, 1, 0.9176471, 0, 1,
-1.005924, 0.4547866, -0.332561, 1, 0.9254902, 0, 1,
-1.001441, -0.9543238, -2.795726, 1, 0.9294118, 0, 1,
-0.9997053, 0.1309851, -1.80527, 1, 0.9372549, 0, 1,
-0.9960088, -0.2683259, -2.294211, 1, 0.9411765, 0, 1,
-0.9906128, 0.07784364, -1.971469, 1, 0.9490196, 0, 1,
-0.9848226, -0.005171606, -1.455885, 1, 0.9529412, 0, 1,
-0.9785905, -0.06490842, -1.287891, 1, 0.9607843, 0, 1,
-0.9760072, -1.370637, -3.622123, 1, 0.9647059, 0, 1,
-0.9604083, 1.328198, 0.3859629, 1, 0.972549, 0, 1,
-0.9582481, -0.555548, -2.138061, 1, 0.9764706, 0, 1,
-0.957657, 0.6096652, -2.319679, 1, 0.9843137, 0, 1,
-0.9510836, 1.343293, 0.2641578, 1, 0.9882353, 0, 1,
-0.9480656, -0.1715796, -3.062995, 1, 0.9960784, 0, 1,
-0.9474244, 0.6265451, -1.865302, 0.9960784, 1, 0, 1,
-0.9372148, -0.5290075, -1.046966, 0.9921569, 1, 0, 1,
-0.936864, 0.6313975, -1.39724, 0.9843137, 1, 0, 1,
-0.9354663, -1.316518, -2.943792, 0.9803922, 1, 0, 1,
-0.9341335, -1.482887, -1.056953, 0.972549, 1, 0, 1,
-0.9324187, 1.401636, -0.08060887, 0.9686275, 1, 0, 1,
-0.9293071, 0.5890251, -1.875818, 0.9607843, 1, 0, 1,
-0.9225951, -0.3239881, -1.261471, 0.9568627, 1, 0, 1,
-0.9188109, 1.257399, 0.6257086, 0.9490196, 1, 0, 1,
-0.9162892, -1.056046, -0.4062439, 0.945098, 1, 0, 1,
-0.9140771, 0.6718105, -0.0380512, 0.9372549, 1, 0, 1,
-0.9123126, -0.4961818, -2.675806, 0.9333333, 1, 0, 1,
-0.9089904, 0.7663002, 0.5012323, 0.9254902, 1, 0, 1,
-0.9010539, 0.1225275, -2.988486, 0.9215686, 1, 0, 1,
-0.8859413, -1.088501, -0.07074466, 0.9137255, 1, 0, 1,
-0.8817301, 0.626965, -0.6506312, 0.9098039, 1, 0, 1,
-0.8813523, 1.014001, -1.184743, 0.9019608, 1, 0, 1,
-0.876793, -1.62118, -3.308268, 0.8941177, 1, 0, 1,
-0.8687699, 0.2965769, -2.156085, 0.8901961, 1, 0, 1,
-0.8609046, -0.435739, -2.07616, 0.8823529, 1, 0, 1,
-0.8593832, -0.7509904, -2.294637, 0.8784314, 1, 0, 1,
-0.8584222, 0.2404462, -0.5843313, 0.8705882, 1, 0, 1,
-0.8517334, -0.4094577, -2.598531, 0.8666667, 1, 0, 1,
-0.8502196, -0.4951746, -2.707668, 0.8588235, 1, 0, 1,
-0.8496274, -0.9010164, -2.895933, 0.854902, 1, 0, 1,
-0.8481065, 1.105189, 0.1600399, 0.8470588, 1, 0, 1,
-0.8465899, -2.794766, -3.117581, 0.8431373, 1, 0, 1,
-0.8464154, -1.203517, -1.715742, 0.8352941, 1, 0, 1,
-0.8450784, -1.014267, -0.4588674, 0.8313726, 1, 0, 1,
-0.8408365, -1.212914, -0.5517878, 0.8235294, 1, 0, 1,
-0.8400964, 0.7587875, -2.397671, 0.8196079, 1, 0, 1,
-0.836601, 0.3204031, -0.4888458, 0.8117647, 1, 0, 1,
-0.8349393, -2.291764, -2.513619, 0.8078431, 1, 0, 1,
-0.8301461, 2.199411, -1.132665, 0.8, 1, 0, 1,
-0.8283235, -1.611187, -4.107521, 0.7921569, 1, 0, 1,
-0.817201, 0.8391474, -2.118031, 0.7882353, 1, 0, 1,
-0.8125082, -1.124519, -3.915978, 0.7803922, 1, 0, 1,
-0.8111773, -0.05119356, -0.9359643, 0.7764706, 1, 0, 1,
-0.8099161, 0.1312222, -1.474392, 0.7686275, 1, 0, 1,
-0.8023328, 0.183213, -1.551424, 0.7647059, 1, 0, 1,
-0.8022476, -0.6102684, -1.812514, 0.7568628, 1, 0, 1,
-0.8018994, -0.6375397, -3.136497, 0.7529412, 1, 0, 1,
-0.8013095, 0.4491542, -2.618712, 0.7450981, 1, 0, 1,
-0.7986726, 0.6774019, -0.8164216, 0.7411765, 1, 0, 1,
-0.7985132, -0.4428414, -3.724779, 0.7333333, 1, 0, 1,
-0.7954082, 1.606564, -0.497768, 0.7294118, 1, 0, 1,
-0.7917665, -0.2049475, -3.533088, 0.7215686, 1, 0, 1,
-0.7893254, 1.340072, -2.342939, 0.7176471, 1, 0, 1,
-0.7870074, 0.5707439, -1.370768, 0.7098039, 1, 0, 1,
-0.7837752, 0.8829923, -0.5787317, 0.7058824, 1, 0, 1,
-0.7797095, -0.155083, -1.399688, 0.6980392, 1, 0, 1,
-0.7767913, 1.480302, -1.002144, 0.6901961, 1, 0, 1,
-0.7767237, 0.2058831, 0.2518754, 0.6862745, 1, 0, 1,
-0.7746958, 0.7847574, -0.9133471, 0.6784314, 1, 0, 1,
-0.7661911, -0.5870103, -1.776728, 0.6745098, 1, 0, 1,
-0.7646732, 0.9055209, 0.290128, 0.6666667, 1, 0, 1,
-0.7606819, -2.382087, -4.9401, 0.6627451, 1, 0, 1,
-0.7584037, -0.233773, -2.828187, 0.654902, 1, 0, 1,
-0.7511587, -1.331215, -2.087423, 0.6509804, 1, 0, 1,
-0.748713, -0.4967724, -1.502363, 0.6431373, 1, 0, 1,
-0.7474452, 1.294765, 0.6488101, 0.6392157, 1, 0, 1,
-0.7393167, 0.2185989, -2.336229, 0.6313726, 1, 0, 1,
-0.7360618, 0.9289243, 0.4618016, 0.627451, 1, 0, 1,
-0.7354499, -1.044553, -3.039615, 0.6196079, 1, 0, 1,
-0.7282039, -1.365297, -3.3336, 0.6156863, 1, 0, 1,
-0.7271357, 2.185872, -0.9000236, 0.6078432, 1, 0, 1,
-0.7261905, 1.072553, -2.062586, 0.6039216, 1, 0, 1,
-0.7221897, 0.4395092, -2.430264, 0.5960785, 1, 0, 1,
-0.7210684, -1.61189, -3.350382, 0.5882353, 1, 0, 1,
-0.7196643, 0.8933392, -1.645294, 0.5843138, 1, 0, 1,
-0.718949, -0.4098041, -2.502699, 0.5764706, 1, 0, 1,
-0.7186669, 0.7437545, -0.6169601, 0.572549, 1, 0, 1,
-0.715507, 0.7238263, 1.009309, 0.5647059, 1, 0, 1,
-0.6950403, 0.917779, -1.02529, 0.5607843, 1, 0, 1,
-0.6792161, -1.580316, -1.700421, 0.5529412, 1, 0, 1,
-0.6790268, -1.429049, -1.758979, 0.5490196, 1, 0, 1,
-0.6737121, 0.6273522, -2.225623, 0.5411765, 1, 0, 1,
-0.6728383, 0.8505595, -1.436941, 0.5372549, 1, 0, 1,
-0.6682258, 0.5045274, -1.526589, 0.5294118, 1, 0, 1,
-0.6669747, 0.05074557, -2.814487, 0.5254902, 1, 0, 1,
-0.6608974, 0.5434045, -0.6627479, 0.5176471, 1, 0, 1,
-0.6596134, -1.456455, -2.868789, 0.5137255, 1, 0, 1,
-0.6573818, -1.063375, -1.364178, 0.5058824, 1, 0, 1,
-0.6569915, 0.05988683, -0.9231477, 0.5019608, 1, 0, 1,
-0.655573, 0.9737219, -1.125091, 0.4941176, 1, 0, 1,
-0.6473684, -0.9295622, -0.2800702, 0.4862745, 1, 0, 1,
-0.6404889, 1.27439, 0.9128927, 0.4823529, 1, 0, 1,
-0.6348539, 1.06662, 0.2779894, 0.4745098, 1, 0, 1,
-0.6297683, -1.22856, -1.768841, 0.4705882, 1, 0, 1,
-0.6268409, -0.2069567, -2.216779, 0.4627451, 1, 0, 1,
-0.6216507, 0.13409, -1.446308, 0.4588235, 1, 0, 1,
-0.6211495, 1.114518, -0.651897, 0.4509804, 1, 0, 1,
-0.6189764, 0.9452194, -0.6454856, 0.4470588, 1, 0, 1,
-0.6170206, 1.66416, 0.5335396, 0.4392157, 1, 0, 1,
-0.6099359, -1.064818, -1.895247, 0.4352941, 1, 0, 1,
-0.6074263, -0.8272689, -1.907917, 0.427451, 1, 0, 1,
-0.6052038, -0.1140012, -1.799993, 0.4235294, 1, 0, 1,
-0.6018309, -0.6538887, -2.726301, 0.4156863, 1, 0, 1,
-0.6008733, 2.096945, 0.8934478, 0.4117647, 1, 0, 1,
-0.5981326, 0.8830028, 1.285718, 0.4039216, 1, 0, 1,
-0.5961168, -2.67317, -2.855266, 0.3960784, 1, 0, 1,
-0.5924023, 1.250063, -1.151686, 0.3921569, 1, 0, 1,
-0.5899897, -1.272224, -3.782148, 0.3843137, 1, 0, 1,
-0.5893257, 1.683481, 0.5571035, 0.3803922, 1, 0, 1,
-0.5888632, 0.520874, -0.8082515, 0.372549, 1, 0, 1,
-0.5834841, 0.7826899, 0.8792739, 0.3686275, 1, 0, 1,
-0.5827229, 0.5882008, -1.018145, 0.3607843, 1, 0, 1,
-0.5821835, 0.4029381, -0.6356008, 0.3568628, 1, 0, 1,
-0.5818169, 0.9832876, -0.6370843, 0.3490196, 1, 0, 1,
-0.5791635, 0.6078703, 1.121971, 0.345098, 1, 0, 1,
-0.5767294, 0.2578078, -0.9359589, 0.3372549, 1, 0, 1,
-0.5754003, -0.3982912, -1.8239, 0.3333333, 1, 0, 1,
-0.575334, 1.279663, -0.9607871, 0.3254902, 1, 0, 1,
-0.5688739, -0.6913654, -2.906718, 0.3215686, 1, 0, 1,
-0.5667145, -0.342588, -3.050464, 0.3137255, 1, 0, 1,
-0.5648419, -0.5206311, -2.05069, 0.3098039, 1, 0, 1,
-0.5552426, -0.06732903, 1.0986, 0.3019608, 1, 0, 1,
-0.5519884, -1.137851, -3.021079, 0.2941177, 1, 0, 1,
-0.5480505, -0.4192912, -3.338721, 0.2901961, 1, 0, 1,
-0.5441612, -1.702021, -2.994375, 0.282353, 1, 0, 1,
-0.542825, 0.5218223, -1.431009, 0.2784314, 1, 0, 1,
-0.5416319, 0.8854602, -1.541669, 0.2705882, 1, 0, 1,
-0.537083, -0.1615762, -1.78295, 0.2666667, 1, 0, 1,
-0.5355392, -0.5229282, -3.219379, 0.2588235, 1, 0, 1,
-0.5343502, 0.5633709, -0.3055241, 0.254902, 1, 0, 1,
-0.5341411, 0.6564214, -0.2115376, 0.2470588, 1, 0, 1,
-0.533184, -0.07898359, -0.9530146, 0.2431373, 1, 0, 1,
-0.5308101, 0.9958825, 0.04004523, 0.2352941, 1, 0, 1,
-0.526499, -0.1622084, -1.347901, 0.2313726, 1, 0, 1,
-0.5251021, -1.098874, -0.5168691, 0.2235294, 1, 0, 1,
-0.5234935, 0.6689529, -0.2416308, 0.2196078, 1, 0, 1,
-0.5174889, 0.4444849, -0.9834467, 0.2117647, 1, 0, 1,
-0.5160744, 0.1843993, -1.482357, 0.2078431, 1, 0, 1,
-0.5145307, 0.5812496, -2.517585, 0.2, 1, 0, 1,
-0.5143639, 0.2094894, -1.700907, 0.1921569, 1, 0, 1,
-0.5128101, 0.2760279, -1.417558, 0.1882353, 1, 0, 1,
-0.511968, -0.6969183, -2.741213, 0.1803922, 1, 0, 1,
-0.511669, 1.345176, -1.149247, 0.1764706, 1, 0, 1,
-0.5094522, 0.4999472, -1.885269, 0.1686275, 1, 0, 1,
-0.5072688, 0.4203145, -0.8334991, 0.1647059, 1, 0, 1,
-0.503962, 1.679021, 0.02566967, 0.1568628, 1, 0, 1,
-0.49812, 1.759858, 1.423535, 0.1529412, 1, 0, 1,
-0.4935298, -0.2140035, -2.166081, 0.145098, 1, 0, 1,
-0.4861983, -0.9277065, -2.396897, 0.1411765, 1, 0, 1,
-0.4845923, 0.3085635, -0.4055316, 0.1333333, 1, 0, 1,
-0.4790761, -0.05274745, -2.68433, 0.1294118, 1, 0, 1,
-0.4771767, -0.368631, -3.256235, 0.1215686, 1, 0, 1,
-0.4769285, -1.095636, -1.846331, 0.1176471, 1, 0, 1,
-0.4764835, 0.7679316, -1.326357, 0.1098039, 1, 0, 1,
-0.4743676, 0.2803205, -1.991466, 0.1058824, 1, 0, 1,
-0.4720569, 0.3457076, 0.9270071, 0.09803922, 1, 0, 1,
-0.47086, -0.5734666, -2.333575, 0.09019608, 1, 0, 1,
-0.4701258, 1.857498, -0.2937987, 0.08627451, 1, 0, 1,
-0.4679624, -0.04742632, -0.8449933, 0.07843138, 1, 0, 1,
-0.4678251, 0.3811477, -0.8681862, 0.07450981, 1, 0, 1,
-0.4627683, 0.5269663, 0.1012384, 0.06666667, 1, 0, 1,
-0.4625932, 0.0006359866, -1.375077, 0.0627451, 1, 0, 1,
-0.4611922, -0.03554667, -2.651074, 0.05490196, 1, 0, 1,
-0.4605469, 0.2391987, 1.059065, 0.05098039, 1, 0, 1,
-0.4587425, -1.643639, -2.923783, 0.04313726, 1, 0, 1,
-0.4568675, 0.7735937, -1.140229, 0.03921569, 1, 0, 1,
-0.450927, -0.3678208, -3.766562, 0.03137255, 1, 0, 1,
-0.4500184, 0.05606596, -1.687453, 0.02745098, 1, 0, 1,
-0.4495631, 0.8280444, -0.1733442, 0.01960784, 1, 0, 1,
-0.4463466, 2.400752, -0.4779918, 0.01568628, 1, 0, 1,
-0.438069, 0.5219578, -0.3849103, 0.007843138, 1, 0, 1,
-0.437302, 0.100459, -1.110671, 0.003921569, 1, 0, 1,
-0.4350978, -0.7763991, -2.046995, 0, 1, 0.003921569, 1,
-0.4338271, -0.88091, -0.8724481, 0, 1, 0.01176471, 1,
-0.4299209, 0.2416853, -0.6117474, 0, 1, 0.01568628, 1,
-0.42489, 0.1654371, -0.083433, 0, 1, 0.02352941, 1,
-0.4235282, -1.311573, -3.082412, 0, 1, 0.02745098, 1,
-0.4211107, 0.169314, 0.01401169, 0, 1, 0.03529412, 1,
-0.4196883, 2.241466, -0.1898247, 0, 1, 0.03921569, 1,
-0.418887, 0.2886788, 0.5489036, 0, 1, 0.04705882, 1,
-0.4188055, 0.59444, 0.9588423, 0, 1, 0.05098039, 1,
-0.4185044, -0.5545418, -2.26494, 0, 1, 0.05882353, 1,
-0.4161448, 0.2908385, -0.07156853, 0, 1, 0.0627451, 1,
-0.415251, 0.05516239, -0.2986169, 0, 1, 0.07058824, 1,
-0.4145623, -0.163551, -0.7024544, 0, 1, 0.07450981, 1,
-0.4068321, 0.7853264, -1.176387, 0, 1, 0.08235294, 1,
-0.4052636, -1.265578, -1.798715, 0, 1, 0.08627451, 1,
-0.3994046, -0.6426789, -0.7187033, 0, 1, 0.09411765, 1,
-0.3986975, 0.3283082, -1.149457, 0, 1, 0.1019608, 1,
-0.3962769, -0.7828334, -1.933611, 0, 1, 0.1058824, 1,
-0.3923483, -0.6293117, -0.9860544, 0, 1, 0.1137255, 1,
-0.389906, 1.86348, -0.5004628, 0, 1, 0.1176471, 1,
-0.3832385, 1.948989, 0.1193182, 0, 1, 0.1254902, 1,
-0.3809615, 1.59926, 0.1943111, 0, 1, 0.1294118, 1,
-0.3808581, 1.170394, -0.198065, 0, 1, 0.1372549, 1,
-0.3807448, 0.4136607, -1.389688, 0, 1, 0.1411765, 1,
-0.3780168, -1.114318, -3.587528, 0, 1, 0.1490196, 1,
-0.3666175, 1.577347, -0.3808035, 0, 1, 0.1529412, 1,
-0.3664187, 0.1842674, -3.238332, 0, 1, 0.1607843, 1,
-0.3642267, 0.01588148, -1.945344, 0, 1, 0.1647059, 1,
-0.363939, 0.9210474, 0.6652482, 0, 1, 0.172549, 1,
-0.358171, 1.387235, -0.7311636, 0, 1, 0.1764706, 1,
-0.3580188, 0.09343393, -1.168258, 0, 1, 0.1843137, 1,
-0.3567722, 0.00782241, -1.659413, 0, 1, 0.1882353, 1,
-0.3565118, -0.5899876, -3.869916, 0, 1, 0.1960784, 1,
-0.3561558, -0.3231927, -2.247306, 0, 1, 0.2039216, 1,
-0.3557022, -0.5767152, -3.540329, 0, 1, 0.2078431, 1,
-0.3556765, 1.324394, 0.6287922, 0, 1, 0.2156863, 1,
-0.3533056, -0.9052629, -2.417799, 0, 1, 0.2196078, 1,
-0.3504788, -0.802093, -2.832053, 0, 1, 0.227451, 1,
-0.3470892, -0.5324122, -1.276051, 0, 1, 0.2313726, 1,
-0.3448608, -0.03730623, -1.182875, 0, 1, 0.2392157, 1,
-0.3413893, -0.6845084, -3.718224, 0, 1, 0.2431373, 1,
-0.3357186, 1.479733, 0.4410277, 0, 1, 0.2509804, 1,
-0.332113, -0.2855498, -1.582657, 0, 1, 0.254902, 1,
-0.3299161, 0.9741741, -0.8784105, 0, 1, 0.2627451, 1,
-0.3273006, -0.05185322, -1.476911, 0, 1, 0.2666667, 1,
-0.3233426, -0.06240306, -1.054842, 0, 1, 0.2745098, 1,
-0.3178312, -0.07532035, -0.8009921, 0, 1, 0.2784314, 1,
-0.3154573, 0.2448972, -1.47008, 0, 1, 0.2862745, 1,
-0.3099724, 1.087063, 0.6117871, 0, 1, 0.2901961, 1,
-0.3094444, 0.2122033, -2.099399, 0, 1, 0.2980392, 1,
-0.3071896, -0.8264509, -1.348426, 0, 1, 0.3058824, 1,
-0.3064922, 1.937732, 0.2950986, 0, 1, 0.3098039, 1,
-0.306348, -0.4180165, -2.230374, 0, 1, 0.3176471, 1,
-0.3060168, -1.662241, -0.3256666, 0, 1, 0.3215686, 1,
-0.3031497, 0.7081484, -0.4193183, 0, 1, 0.3294118, 1,
-0.3001549, -0.5395631, -2.662055, 0, 1, 0.3333333, 1,
-0.2891643, -0.3359184, -1.484934, 0, 1, 0.3411765, 1,
-0.2831517, 0.3030687, -1.030704, 0, 1, 0.345098, 1,
-0.282898, -1.161384, -1.800935, 0, 1, 0.3529412, 1,
-0.2812336, 0.07395819, -1.057456, 0, 1, 0.3568628, 1,
-0.2802162, 0.983343, -1.094222, 0, 1, 0.3647059, 1,
-0.2786495, -0.6179876, -2.444946, 0, 1, 0.3686275, 1,
-0.2785215, 0.1499881, -0.6620234, 0, 1, 0.3764706, 1,
-0.2740758, 1.075185, 2.39181, 0, 1, 0.3803922, 1,
-0.2738639, 0.2051715, -0.09270913, 0, 1, 0.3882353, 1,
-0.2738522, -0.07219645, -1.679902, 0, 1, 0.3921569, 1,
-0.2735769, -0.1316544, -2.91046, 0, 1, 0.4, 1,
-0.267654, -1.316032, -2.544048, 0, 1, 0.4078431, 1,
-0.266601, 0.5062473, -0.3305286, 0, 1, 0.4117647, 1,
-0.2622609, 1.24504, -0.5232968, 0, 1, 0.4196078, 1,
-0.2605942, 0.8413, -1.353579, 0, 1, 0.4235294, 1,
-0.2459628, 0.1792085, 1.312335, 0, 1, 0.4313726, 1,
-0.2453413, 0.7999396, 1.744982, 0, 1, 0.4352941, 1,
-0.2356564, -0.6072764, -2.853765, 0, 1, 0.4431373, 1,
-0.2347393, -1.171384, -2.830925, 0, 1, 0.4470588, 1,
-0.2326722, -2.520818, -1.905205, 0, 1, 0.454902, 1,
-0.2310578, 0.02396839, -2.551963, 0, 1, 0.4588235, 1,
-0.2293792, -1.120041, -4.555432, 0, 1, 0.4666667, 1,
-0.2280529, 0.200899, -0.5246868, 0, 1, 0.4705882, 1,
-0.2267272, 0.04750791, -1.314353, 0, 1, 0.4784314, 1,
-0.2210522, -0.4727145, -4.409802, 0, 1, 0.4823529, 1,
-0.2193876, 1.254669, 1.303646, 0, 1, 0.4901961, 1,
-0.2162782, 1.081944, 1.086676, 0, 1, 0.4941176, 1,
-0.2115138, 0.5416698, -1.603788, 0, 1, 0.5019608, 1,
-0.2054243, -0.2593599, -1.966582, 0, 1, 0.509804, 1,
-0.2046966, 0.08556337, -1.128869, 0, 1, 0.5137255, 1,
-0.2042052, 0.2038578, 0.8551683, 0, 1, 0.5215687, 1,
-0.2032417, -0.7124853, -2.943875, 0, 1, 0.5254902, 1,
-0.2020103, -0.5550855, -4.836484, 0, 1, 0.5333334, 1,
-0.1966083, -0.1140352, -2.879383, 0, 1, 0.5372549, 1,
-0.1963118, 1.828703, -0.001253465, 0, 1, 0.5450981, 1,
-0.1898365, -1.85101, -2.702301, 0, 1, 0.5490196, 1,
-0.1843378, -0.08943371, -1.220901, 0, 1, 0.5568628, 1,
-0.1809816, 1.052206, -0.1973382, 0, 1, 0.5607843, 1,
-0.1754588, -1.134101, -1.891524, 0, 1, 0.5686275, 1,
-0.1727054, 0.7668812, -0.5985566, 0, 1, 0.572549, 1,
-0.168181, 1.423008, 0.5200019, 0, 1, 0.5803922, 1,
-0.1608747, 1.178282, -0.2718874, 0, 1, 0.5843138, 1,
-0.1608452, -0.405647, -2.172064, 0, 1, 0.5921569, 1,
-0.1607234, 1.593063, 0.5676669, 0, 1, 0.5960785, 1,
-0.1594782, -1.285136, -2.949367, 0, 1, 0.6039216, 1,
-0.1573596, -1.004579, -2.829753, 0, 1, 0.6117647, 1,
-0.1565848, -0.1768509, -2.035136, 0, 1, 0.6156863, 1,
-0.1533337, -0.3748374, -0.8773753, 0, 1, 0.6235294, 1,
-0.1519519, 1.062228, 0.365167, 0, 1, 0.627451, 1,
-0.1483653, 0.3313448, -0.7509027, 0, 1, 0.6352941, 1,
-0.1468774, 0.2839705, 0.1554438, 0, 1, 0.6392157, 1,
-0.1447958, 0.1202473, -1.334269, 0, 1, 0.6470588, 1,
-0.142093, -0.1663516, -1.527994, 0, 1, 0.6509804, 1,
-0.1395047, -2.870469, -3.973171, 0, 1, 0.6588235, 1,
-0.1379002, 0.4538969, -0.8414409, 0, 1, 0.6627451, 1,
-0.1360419, -0.1234707, -3.122155, 0, 1, 0.6705883, 1,
-0.1345639, 1.544381, -0.7314154, 0, 1, 0.6745098, 1,
-0.1315906, -0.8683699, -3.395303, 0, 1, 0.682353, 1,
-0.1315577, 2.37009, -0.6302469, 0, 1, 0.6862745, 1,
-0.1283449, 0.278547, 0.4652296, 0, 1, 0.6941177, 1,
-0.1281922, 0.1637377, 1.499279, 0, 1, 0.7019608, 1,
-0.1239857, -0.9683444, -1.782838, 0, 1, 0.7058824, 1,
-0.1131742, -0.1967622, -4.584685, 0, 1, 0.7137255, 1,
-0.1060248, -2.039845, -3.661233, 0, 1, 0.7176471, 1,
-0.1052744, -0.386904, -1.707043, 0, 1, 0.7254902, 1,
-0.1035778, 1.359283, -0.4864177, 0, 1, 0.7294118, 1,
-0.1006435, -0.6815564, -5.864219, 0, 1, 0.7372549, 1,
-0.09908526, -1.767205, -2.868623, 0, 1, 0.7411765, 1,
-0.09830833, 0.1701983, -0.4927926, 0, 1, 0.7490196, 1,
-0.09269511, -0.9250672, -2.242083, 0, 1, 0.7529412, 1,
-0.09214074, -0.3481833, -4.211822, 0, 1, 0.7607843, 1,
-0.08772589, -0.3587397, -3.146952, 0, 1, 0.7647059, 1,
-0.08722111, -0.8193857, -2.285524, 0, 1, 0.772549, 1,
-0.08399037, 0.5034834, 0.009230448, 0, 1, 0.7764706, 1,
-0.08339435, 2.166718, 0.7325406, 0, 1, 0.7843137, 1,
-0.08256925, -0.7067867, -2.833034, 0, 1, 0.7882353, 1,
-0.08196809, -0.1012442, -3.371005, 0, 1, 0.7960784, 1,
-0.0802581, -0.1240162, -0.8013864, 0, 1, 0.8039216, 1,
-0.07850219, -0.1207383, -2.058048, 0, 1, 0.8078431, 1,
-0.07686179, -1.030127, -2.472611, 0, 1, 0.8156863, 1,
-0.07679159, 0.2825232, -0.6220289, 0, 1, 0.8196079, 1,
-0.07555613, 0.4603148, 1.512642, 0, 1, 0.827451, 1,
-0.07555539, 0.4346594, 2.371027, 0, 1, 0.8313726, 1,
-0.0748114, -0.06291062, -2.969539, 0, 1, 0.8392157, 1,
-0.07450556, 0.3159036, -0.2777237, 0, 1, 0.8431373, 1,
-0.07255957, 1.057192, -0.08595479, 0, 1, 0.8509804, 1,
-0.07139435, -1.487726, -2.036209, 0, 1, 0.854902, 1,
-0.07087858, -0.5487337, -5.246793, 0, 1, 0.8627451, 1,
-0.06944745, 1.431275, -0.7437116, 0, 1, 0.8666667, 1,
-0.06835859, -0.8045903, -2.043109, 0, 1, 0.8745098, 1,
-0.06302804, -0.1277024, -2.673697, 0, 1, 0.8784314, 1,
-0.06113987, -0.7939526, -3.627019, 0, 1, 0.8862745, 1,
-0.06023761, 0.8242447, 0.146103, 0, 1, 0.8901961, 1,
-0.05393777, -0.1875251, -4.278119, 0, 1, 0.8980392, 1,
-0.05324955, -1.641828, -3.496947, 0, 1, 0.9058824, 1,
-0.05284756, -0.2348561, -1.818409, 0, 1, 0.9098039, 1,
-0.0526225, 0.4907779, -1.461861, 0, 1, 0.9176471, 1,
-0.052078, 1.090789, 1.306803, 0, 1, 0.9215686, 1,
-0.05080719, 0.5224515, 1.078423, 0, 1, 0.9294118, 1,
-0.04305712, 1.308435, 2.019917, 0, 1, 0.9333333, 1,
-0.03885432, -0.2193291, -4.585093, 0, 1, 0.9411765, 1,
-0.0371346, 1.124548, -0.6092975, 0, 1, 0.945098, 1,
-0.03204263, 1.184361, 1.098583, 0, 1, 0.9529412, 1,
-0.02888856, -0.6175963, -3.481276, 0, 1, 0.9568627, 1,
-0.02148541, 0.1437416, 0.7044918, 0, 1, 0.9647059, 1,
-0.02039147, -0.338444, -2.359142, 0, 1, 0.9686275, 1,
-0.01543247, -0.07297351, -4.093564, 0, 1, 0.9764706, 1,
-0.012699, 0.4570909, -0.6683005, 0, 1, 0.9803922, 1,
-0.01162765, 0.6017779, -0.2324231, 0, 1, 0.9882353, 1,
-0.009289727, 0.1560354, -1.17104, 0, 1, 0.9921569, 1,
-0.005374224, -1.028483, -2.946048, 0, 1, 1, 1,
-0.004282864, 0.8461068, 0.7736497, 0, 0.9921569, 1, 1,
0.001313016, 0.4422557, -0.3258166, 0, 0.9882353, 1, 1,
0.009040966, -0.5542067, 2.371273, 0, 0.9803922, 1, 1,
0.01313588, 0.02547007, 2.045063, 0, 0.9764706, 1, 1,
0.01511556, -1.209289, 2.033016, 0, 0.9686275, 1, 1,
0.01556847, -0.6963786, 3.626142, 0, 0.9647059, 1, 1,
0.0158643, 0.5826004, -0.9238161, 0, 0.9568627, 1, 1,
0.01655859, -0.8078274, 2.608458, 0, 0.9529412, 1, 1,
0.01729075, -1.006661, 3.443322, 0, 0.945098, 1, 1,
0.01732931, 0.5863085, -0.8306993, 0, 0.9411765, 1, 1,
0.02243261, 0.1567584, -0.4242285, 0, 0.9333333, 1, 1,
0.02410462, 0.5365331, -0.06840962, 0, 0.9294118, 1, 1,
0.02477575, 0.5469952, -1.355878, 0, 0.9215686, 1, 1,
0.02586707, -0.7361614, 3.435168, 0, 0.9176471, 1, 1,
0.02922149, -0.9718359, 5.161991, 0, 0.9098039, 1, 1,
0.03210473, 0.5682665, -1.597416, 0, 0.9058824, 1, 1,
0.0378991, -1.053517, 3.608834, 0, 0.8980392, 1, 1,
0.04378575, 1.47787, 0.0613331, 0, 0.8901961, 1, 1,
0.04467642, 1.541527, 0.07792655, 0, 0.8862745, 1, 1,
0.04692498, -1.44921, 3.463448, 0, 0.8784314, 1, 1,
0.05817398, -0.5277954, 3.584024, 0, 0.8745098, 1, 1,
0.06318143, 1.750971, 0.8097816, 0, 0.8666667, 1, 1,
0.06699282, 0.2803217, 2.301469, 0, 0.8627451, 1, 1,
0.06727526, 0.1921885, 0.6697648, 0, 0.854902, 1, 1,
0.06796934, -1.359666, 2.904428, 0, 0.8509804, 1, 1,
0.06960057, 1.987701, -0.3829133, 0, 0.8431373, 1, 1,
0.07581329, -1.231167, 3.752324, 0, 0.8392157, 1, 1,
0.07617504, -1.601771, 3.296973, 0, 0.8313726, 1, 1,
0.07997038, -0.6586459, 3.388095, 0, 0.827451, 1, 1,
0.08181661, 1.375964, 2.159495, 0, 0.8196079, 1, 1,
0.08260931, 1.730374, -1.122672, 0, 0.8156863, 1, 1,
0.08521365, 0.1141731, -0.4297078, 0, 0.8078431, 1, 1,
0.08861525, -1.542364, 3.95573, 0, 0.8039216, 1, 1,
0.08944958, 0.4595982, 0.8221444, 0, 0.7960784, 1, 1,
0.08948074, -0.2035303, 2.167526, 0, 0.7882353, 1, 1,
0.09113903, -0.3035895, 0.9993715, 0, 0.7843137, 1, 1,
0.09116698, -0.3581919, 1.580819, 0, 0.7764706, 1, 1,
0.0914012, 1.163188, 1.014074, 0, 0.772549, 1, 1,
0.09206105, 0.1261835, 0.8972288, 0, 0.7647059, 1, 1,
0.1001222, 1.573315, 1.334615, 0, 0.7607843, 1, 1,
0.1011035, 0.915038, -1.319787, 0, 0.7529412, 1, 1,
0.1015251, -2.136916, 2.354903, 0, 0.7490196, 1, 1,
0.1018299, 0.3094772, 0.2803562, 0, 0.7411765, 1, 1,
0.1023732, -1.189912, 1.94648, 0, 0.7372549, 1, 1,
0.1041544, 0.2209395, 1.349767, 0, 0.7294118, 1, 1,
0.1046965, -1.207987, 3.725683, 0, 0.7254902, 1, 1,
0.1051598, -0.4566423, 3.454885, 0, 0.7176471, 1, 1,
0.1109177, 0.07774606, 0.7543678, 0, 0.7137255, 1, 1,
0.1129694, 0.6293083, -0.7269847, 0, 0.7058824, 1, 1,
0.1157926, -0.6234692, 3.380168, 0, 0.6980392, 1, 1,
0.1161811, 0.3931712, 0.5027493, 0, 0.6941177, 1, 1,
0.1182684, 0.3304188, -0.4773341, 0, 0.6862745, 1, 1,
0.1189296, -0.4202633, 3.172608, 0, 0.682353, 1, 1,
0.1203807, 0.2111572, -0.7542396, 0, 0.6745098, 1, 1,
0.121616, -0.06331775, 2.411947, 0, 0.6705883, 1, 1,
0.1219849, -0.5933781, 3.969488, 0, 0.6627451, 1, 1,
0.1242248, -0.6256256, 3.08938, 0, 0.6588235, 1, 1,
0.1253767, -0.5780394, 3.327212, 0, 0.6509804, 1, 1,
0.1325003, -0.07520039, 2.404491, 0, 0.6470588, 1, 1,
0.1345692, -0.2878004, 1.701149, 0, 0.6392157, 1, 1,
0.1389093, 0.2604748, -0.1366219, 0, 0.6352941, 1, 1,
0.1425645, 0.3273958, 0.5908144, 0, 0.627451, 1, 1,
0.143378, -0.05518967, 1.615428, 0, 0.6235294, 1, 1,
0.1434961, -0.5209007, 3.075295, 0, 0.6156863, 1, 1,
0.1477069, -1.127792, 2.669585, 0, 0.6117647, 1, 1,
0.1491058, 0.2403161, -0.4304124, 0, 0.6039216, 1, 1,
0.1502393, -0.5342317, 0.7300419, 0, 0.5960785, 1, 1,
0.1515425, -2.344502, 3.979584, 0, 0.5921569, 1, 1,
0.1525075, 1.529704, 0.1339214, 0, 0.5843138, 1, 1,
0.1547491, 0.07627645, -0.5894253, 0, 0.5803922, 1, 1,
0.1605428, 1.169661, -1.875291, 0, 0.572549, 1, 1,
0.161831, -0.6556357, 1.462535, 0, 0.5686275, 1, 1,
0.1641397, -0.7179929, 3.653316, 0, 0.5607843, 1, 1,
0.1643525, 0.06062627, 1.816485, 0, 0.5568628, 1, 1,
0.1647735, 0.7471502, 0.08481113, 0, 0.5490196, 1, 1,
0.1665628, -0.886551, 2.401114, 0, 0.5450981, 1, 1,
0.1699482, 1.490954, -2.151289, 0, 0.5372549, 1, 1,
0.1807455, 0.5935717, 1.769914, 0, 0.5333334, 1, 1,
0.1824119, -0.5124828, 3.284304, 0, 0.5254902, 1, 1,
0.1824919, 1.266302, 0.9834673, 0, 0.5215687, 1, 1,
0.1849177, -0.5697358, 2.273368, 0, 0.5137255, 1, 1,
0.184955, -0.06524308, 2.504603, 0, 0.509804, 1, 1,
0.1891845, 2.001883, -0.8459083, 0, 0.5019608, 1, 1,
0.1928148, 1.783733, 2.367647, 0, 0.4941176, 1, 1,
0.193153, -0.4658216, 2.348049, 0, 0.4901961, 1, 1,
0.1952344, 1.544618, -0.00244312, 0, 0.4823529, 1, 1,
0.1997683, -0.4151692, 2.566995, 0, 0.4784314, 1, 1,
0.2002026, 0.07681235, 0.4811317, 0, 0.4705882, 1, 1,
0.2034861, 0.5574911, -1.408305, 0, 0.4666667, 1, 1,
0.2039871, -0.2078649, 1.560779, 0, 0.4588235, 1, 1,
0.2046987, 1.19911, -0.1516844, 0, 0.454902, 1, 1,
0.2050681, 2.173805, -0.4288767, 0, 0.4470588, 1, 1,
0.2055607, -0.1102185, 1.707982, 0, 0.4431373, 1, 1,
0.2061403, 0.8198045, 0.3035958, 0, 0.4352941, 1, 1,
0.2100142, -0.2965193, 2.179792, 0, 0.4313726, 1, 1,
0.2147732, -0.9495825, 4.89353, 0, 0.4235294, 1, 1,
0.216282, 0.1986462, 1.102059, 0, 0.4196078, 1, 1,
0.217287, 1.05747, -0.6535018, 0, 0.4117647, 1, 1,
0.2174318, 0.3858817, 0.7821061, 0, 0.4078431, 1, 1,
0.2220452, 1.010752, 0.3156649, 0, 0.4, 1, 1,
0.2241425, 0.1454643, 2.718879, 0, 0.3921569, 1, 1,
0.2275501, -0.4832644, 1.5024, 0, 0.3882353, 1, 1,
0.2303876, -0.2011708, 0.9122785, 0, 0.3803922, 1, 1,
0.2352359, 0.637126, 0.3798522, 0, 0.3764706, 1, 1,
0.2367371, -0.8043097, 2.743288, 0, 0.3686275, 1, 1,
0.2415759, -0.5689665, 2.403898, 0, 0.3647059, 1, 1,
0.2448747, -0.1252978, 1.146546, 0, 0.3568628, 1, 1,
0.2507508, -0.2186986, 3.328807, 0, 0.3529412, 1, 1,
0.2605455, -1.780184, 2.562521, 0, 0.345098, 1, 1,
0.2636097, -0.7911401, 2.532671, 0, 0.3411765, 1, 1,
0.2660121, -1.044702, 2.226181, 0, 0.3333333, 1, 1,
0.2681268, 0.1287593, 1.588466, 0, 0.3294118, 1, 1,
0.2711654, 1.213014, 1.136313, 0, 0.3215686, 1, 1,
0.275798, 1.676296, -0.7842772, 0, 0.3176471, 1, 1,
0.27748, 0.3413069, 3.068952, 0, 0.3098039, 1, 1,
0.2802566, 0.7531896, -0.5538258, 0, 0.3058824, 1, 1,
0.2858376, 0.3585202, 1.375554, 0, 0.2980392, 1, 1,
0.294164, -0.5966657, 1.613982, 0, 0.2901961, 1, 1,
0.294704, -0.2448158, 2.499261, 0, 0.2862745, 1, 1,
0.2950114, -0.2284983, 2.985034, 0, 0.2784314, 1, 1,
0.3011751, 0.9124593, 0.2877446, 0, 0.2745098, 1, 1,
0.3040833, 0.408655, 1.679241, 0, 0.2666667, 1, 1,
0.3090519, 1.035284, -0.670562, 0, 0.2627451, 1, 1,
0.3162955, 1.683392, -0.4922887, 0, 0.254902, 1, 1,
0.3166662, 0.03706999, 0.7747402, 0, 0.2509804, 1, 1,
0.3219923, -1.52917, 1.874835, 0, 0.2431373, 1, 1,
0.3232181, -0.6396888, 1.169809, 0, 0.2392157, 1, 1,
0.3245914, -1.626743, 2.227355, 0, 0.2313726, 1, 1,
0.3262169, 1.333996, 0.1193001, 0, 0.227451, 1, 1,
0.3268219, 0.8990995, 1.075369, 0, 0.2196078, 1, 1,
0.3341705, 0.8096247, 0.7940139, 0, 0.2156863, 1, 1,
0.3356247, 0.1131033, 0.4205179, 0, 0.2078431, 1, 1,
0.346039, -0.8678564, 3.138563, 0, 0.2039216, 1, 1,
0.3473526, 0.6776106, 1.726044, 0, 0.1960784, 1, 1,
0.3479229, 0.4501468, -0.8961624, 0, 0.1882353, 1, 1,
0.3511874, 0.2340738, -0.8645015, 0, 0.1843137, 1, 1,
0.3527771, -0.1627304, 1.338643, 0, 0.1764706, 1, 1,
0.352991, -1.761363, 3.458694, 0, 0.172549, 1, 1,
0.3541692, 0.9808588, 0.09743708, 0, 0.1647059, 1, 1,
0.3577844, 0.2098053, -0.9995167, 0, 0.1607843, 1, 1,
0.3579013, 0.9846169, -1.340397, 0, 0.1529412, 1, 1,
0.361499, -0.5462009, 3.257638, 0, 0.1490196, 1, 1,
0.3670353, -0.7290903, 1.29641, 0, 0.1411765, 1, 1,
0.3741581, -0.9382969, 2.341238, 0, 0.1372549, 1, 1,
0.3890865, -0.3639973, 1.670609, 0, 0.1294118, 1, 1,
0.392145, -1.038872, 0.9155631, 0, 0.1254902, 1, 1,
0.3953061, -1.885877, 1.50074, 0, 0.1176471, 1, 1,
0.4002127, -2.171974, 2.622785, 0, 0.1137255, 1, 1,
0.4034765, 0.506566, -0.1109049, 0, 0.1058824, 1, 1,
0.4035421, 0.1624218, 2.504577, 0, 0.09803922, 1, 1,
0.4059419, 0.9554755, -0.0520123, 0, 0.09411765, 1, 1,
0.4123965, -1.116252, 4.715276, 0, 0.08627451, 1, 1,
0.4145078, -0.9312006, 4.161535, 0, 0.08235294, 1, 1,
0.4170036, 0.9016599, -0.1961222, 0, 0.07450981, 1, 1,
0.4171057, -0.8247381, 2.521527, 0, 0.07058824, 1, 1,
0.4182577, -0.5445597, 3.106123, 0, 0.0627451, 1, 1,
0.4260222, 0.7914493, -0.1260164, 0, 0.05882353, 1, 1,
0.4308649, -0.7956674, 0.9429005, 0, 0.05098039, 1, 1,
0.4356201, -0.05051205, 1.300074, 0, 0.04705882, 1, 1,
0.4360629, 1.721135, -1.395217, 0, 0.03921569, 1, 1,
0.43674, 1.279377, 0.9584485, 0, 0.03529412, 1, 1,
0.4389647, 0.7498094, 1.255372, 0, 0.02745098, 1, 1,
0.4443227, 0.5510886, 2.385548, 0, 0.02352941, 1, 1,
0.4469537, -0.03402054, 2.076044, 0, 0.01568628, 1, 1,
0.4470327, 0.3862124, 1.437538, 0, 0.01176471, 1, 1,
0.4474356, 0.505596, -0.9077399, 0, 0.003921569, 1, 1,
0.4499331, -1.337871, 2.227704, 0.003921569, 0, 1, 1,
0.4529669, 0.2048845, -0.9443492, 0.007843138, 0, 1, 1,
0.462683, -0.2672106, 3.036279, 0.01568628, 0, 1, 1,
0.4659841, 0.3795806, 3.036975, 0.01960784, 0, 1, 1,
0.4687111, 0.1193683, 2.83673, 0.02745098, 0, 1, 1,
0.4693637, 0.6236665, 0.7935637, 0.03137255, 0, 1, 1,
0.4737023, -0.3995787, 2.088565, 0.03921569, 0, 1, 1,
0.4745239, 1.196482, -0.8932782, 0.04313726, 0, 1, 1,
0.4773606, 0.9306569, -0.2999715, 0.05098039, 0, 1, 1,
0.4774801, 1.69507, 0.6480445, 0.05490196, 0, 1, 1,
0.477553, 1.50875, 0.7664292, 0.0627451, 0, 1, 1,
0.4787434, -1.611786, 1.846672, 0.06666667, 0, 1, 1,
0.4805624, -0.2492936, 1.874597, 0.07450981, 0, 1, 1,
0.4833108, 0.463809, 1.09788, 0.07843138, 0, 1, 1,
0.4864265, 0.993916, 2.553372, 0.08627451, 0, 1, 1,
0.4872918, -0.6786997, 2.097912, 0.09019608, 0, 1, 1,
0.4880297, -0.2744787, 2.380108, 0.09803922, 0, 1, 1,
0.4889299, 1.645124, -0.1768512, 0.1058824, 0, 1, 1,
0.4952289, 0.249804, 3.072818, 0.1098039, 0, 1, 1,
0.495248, -0.7754639, 1.274567, 0.1176471, 0, 1, 1,
0.497103, 2.527035, 0.6247683, 0.1215686, 0, 1, 1,
0.4985079, -0.2247392, 0.3345626, 0.1294118, 0, 1, 1,
0.4992868, 1.086562, 1.183144, 0.1333333, 0, 1, 1,
0.5007823, 0.6901657, 1.218765, 0.1411765, 0, 1, 1,
0.5072908, 0.1095277, 0.04890189, 0.145098, 0, 1, 1,
0.5077506, -0.5290927, 2.874811, 0.1529412, 0, 1, 1,
0.5122756, -0.6588041, 3.183743, 0.1568628, 0, 1, 1,
0.513282, -0.750756, 4.374134, 0.1647059, 0, 1, 1,
0.5173397, 0.2364755, 1.292439, 0.1686275, 0, 1, 1,
0.5191253, 0.9469898, 1.065434, 0.1764706, 0, 1, 1,
0.5241874, -0.7951178, 3.821348, 0.1803922, 0, 1, 1,
0.5266069, 0.4113019, 0.3896125, 0.1882353, 0, 1, 1,
0.5330413, -1.884155, 2.794194, 0.1921569, 0, 1, 1,
0.5338604, -1.623156, 3.781757, 0.2, 0, 1, 1,
0.5362939, 1.971769, 1.735091, 0.2078431, 0, 1, 1,
0.538774, 0.5074542, 1.924076, 0.2117647, 0, 1, 1,
0.5435901, 0.2624762, 0.513695, 0.2196078, 0, 1, 1,
0.5460817, 0.3180415, 2.245579, 0.2235294, 0, 1, 1,
0.5530857, 0.427593, 1.072468, 0.2313726, 0, 1, 1,
0.5563215, -0.7605004, 3.150199, 0.2352941, 0, 1, 1,
0.5598888, 1.695779, 0.4023982, 0.2431373, 0, 1, 1,
0.5607662, -0.7513788, 2.59914, 0.2470588, 0, 1, 1,
0.5630206, -0.6897522, 1.858848, 0.254902, 0, 1, 1,
0.5633734, 0.05953041, 1.690936, 0.2588235, 0, 1, 1,
0.5651309, 0.9366204, 0.640954, 0.2666667, 0, 1, 1,
0.5696775, -0.4812773, 1.883576, 0.2705882, 0, 1, 1,
0.569793, 0.005227932, 2.031093, 0.2784314, 0, 1, 1,
0.5718102, -0.02763161, 1.765527, 0.282353, 0, 1, 1,
0.5723621, -1.080368, 3.948294, 0.2901961, 0, 1, 1,
0.577552, -0.610789, 1.981399, 0.2941177, 0, 1, 1,
0.5783912, 2.16344, -0.2036231, 0.3019608, 0, 1, 1,
0.5785551, -1.963179, 3.456808, 0.3098039, 0, 1, 1,
0.5896918, 0.09957371, 2.449905, 0.3137255, 0, 1, 1,
0.5898134, -0.868921, 1.611966, 0.3215686, 0, 1, 1,
0.5914488, 0.9332221, 1.445198, 0.3254902, 0, 1, 1,
0.5962288, -1.829544, 3.845387, 0.3333333, 0, 1, 1,
0.6041418, -0.4354513, 1.752511, 0.3372549, 0, 1, 1,
0.60509, -1.434696, 1.375322, 0.345098, 0, 1, 1,
0.6065361, -1.126498, 3.998995, 0.3490196, 0, 1, 1,
0.6083508, -0.4403161, 2.503188, 0.3568628, 0, 1, 1,
0.6092627, 1.191262, -0.69687, 0.3607843, 0, 1, 1,
0.6108722, -0.5761127, 2.183096, 0.3686275, 0, 1, 1,
0.6117736, 0.06689846, 2.378674, 0.372549, 0, 1, 1,
0.6126898, 0.1950731, 2.100765, 0.3803922, 0, 1, 1,
0.6148527, -0.7095018, 1.703125, 0.3843137, 0, 1, 1,
0.6185977, 0.8203788, -0.02984985, 0.3921569, 0, 1, 1,
0.6193928, 1.071107, 0.1862143, 0.3960784, 0, 1, 1,
0.6246906, 0.7026445, -0.2469836, 0.4039216, 0, 1, 1,
0.6261274, -0.918295, 0.8888851, 0.4117647, 0, 1, 1,
0.6299569, -1.188512, 2.319806, 0.4156863, 0, 1, 1,
0.6362892, 1.324273, -0.1771345, 0.4235294, 0, 1, 1,
0.6367777, 1.677151, -0.1017242, 0.427451, 0, 1, 1,
0.6388517, -2.156404, 4.055704, 0.4352941, 0, 1, 1,
0.639789, 0.140442, 1.960672, 0.4392157, 0, 1, 1,
0.6462151, 1.459182, 2.043025, 0.4470588, 0, 1, 1,
0.6474208, -0.2421838, 1.29695, 0.4509804, 0, 1, 1,
0.6479234, -0.7145536, 3.527801, 0.4588235, 0, 1, 1,
0.6607562, 0.5091473, 1.259845, 0.4627451, 0, 1, 1,
0.6673015, -0.308439, -0.3087247, 0.4705882, 0, 1, 1,
0.6693764, 0.08787121, -0.06588338, 0.4745098, 0, 1, 1,
0.670535, -0.8576538, 2.842451, 0.4823529, 0, 1, 1,
0.6744471, -1.749171, 4.178015, 0.4862745, 0, 1, 1,
0.6794896, -0.3105259, 1.957677, 0.4941176, 0, 1, 1,
0.6828647, 0.6072865, -1.811114, 0.5019608, 0, 1, 1,
0.6834441, -0.5193747, -0.07070234, 0.5058824, 0, 1, 1,
0.6843258, 0.9456496, 0.5261888, 0.5137255, 0, 1, 1,
0.6951387, 0.4189703, -0.1152239, 0.5176471, 0, 1, 1,
0.7038596, -0.7600486, 2.614239, 0.5254902, 0, 1, 1,
0.7119184, -0.280093, 1.176268, 0.5294118, 0, 1, 1,
0.718177, -0.2753724, 3.990704, 0.5372549, 0, 1, 1,
0.7183149, -0.07474679, 0.6550745, 0.5411765, 0, 1, 1,
0.7243284, 2.307563, -0.5203325, 0.5490196, 0, 1, 1,
0.7355416, -2.214256, 2.495193, 0.5529412, 0, 1, 1,
0.7436624, 0.1442939, -0.1569689, 0.5607843, 0, 1, 1,
0.7478783, -0.2766109, 0.9638426, 0.5647059, 0, 1, 1,
0.7495524, 0.5939575, 1.452349, 0.572549, 0, 1, 1,
0.7518971, 0.3109314, 1.941661, 0.5764706, 0, 1, 1,
0.7533962, 0.8987487, 1.367743, 0.5843138, 0, 1, 1,
0.7578174, -2.051415, 4.957249, 0.5882353, 0, 1, 1,
0.761648, -0.7946541, 2.910574, 0.5960785, 0, 1, 1,
0.7750356, 2.297351, 0.7019438, 0.6039216, 0, 1, 1,
0.7755463, -1.001978, 2.286248, 0.6078432, 0, 1, 1,
0.7765975, 0.5380843, 1.535015, 0.6156863, 0, 1, 1,
0.7800047, -0.1517141, 1.272415, 0.6196079, 0, 1, 1,
0.7842605, -0.8024932, 2.099304, 0.627451, 0, 1, 1,
0.7914412, 0.8950968, 1.112789, 0.6313726, 0, 1, 1,
0.7964826, 0.3491349, 0.6209137, 0.6392157, 0, 1, 1,
0.800157, 0.3863935, 3.968223, 0.6431373, 0, 1, 1,
0.8021625, -0.2110126, 3.225266, 0.6509804, 0, 1, 1,
0.8029748, -2.090735, 1.801841, 0.654902, 0, 1, 1,
0.8083041, 2.295223, 0.03567042, 0.6627451, 0, 1, 1,
0.813194, -0.7383957, 2.011006, 0.6666667, 0, 1, 1,
0.8167816, -1.019534, 1.801258, 0.6745098, 0, 1, 1,
0.8178952, 0.2477643, 0.5628493, 0.6784314, 0, 1, 1,
0.8275325, -0.3696328, 2.994047, 0.6862745, 0, 1, 1,
0.8275531, 0.768869, 1.436875, 0.6901961, 0, 1, 1,
0.8298545, 0.1894107, 2.726958, 0.6980392, 0, 1, 1,
0.8334766, 0.7872723, -0.5708559, 0.7058824, 0, 1, 1,
0.8472672, 1.345647, -0.6047554, 0.7098039, 0, 1, 1,
0.8536606, -0.3254963, 2.249704, 0.7176471, 0, 1, 1,
0.8551832, -0.7339035, 1.941005, 0.7215686, 0, 1, 1,
0.8567429, 1.648999, 0.8612437, 0.7294118, 0, 1, 1,
0.8590476, -0.09646408, 1.052093, 0.7333333, 0, 1, 1,
0.8593457, 1.815935, 0.6794538, 0.7411765, 0, 1, 1,
0.8657984, 1.083468, 1.480026, 0.7450981, 0, 1, 1,
0.8666285, 1.441123, 2.078472, 0.7529412, 0, 1, 1,
0.8731683, -0.03174157, 0.5650436, 0.7568628, 0, 1, 1,
0.8746747, 0.4507495, 0.5376975, 0.7647059, 0, 1, 1,
0.8772855, 0.6760415, 0.8924092, 0.7686275, 0, 1, 1,
0.8802794, 1.318949, 0.5117114, 0.7764706, 0, 1, 1,
0.8835573, 0.9400567, 1.774987, 0.7803922, 0, 1, 1,
0.8911333, -0.1256771, 2.879234, 0.7882353, 0, 1, 1,
0.8969473, 0.06239937, 1.633919, 0.7921569, 0, 1, 1,
0.8972353, 0.00909719, 1.760487, 0.8, 0, 1, 1,
0.8976818, -0.4132139, 2.900568, 0.8078431, 0, 1, 1,
0.9028333, -0.9900746, 2.548727, 0.8117647, 0, 1, 1,
0.9030271, 2.014523, -0.4664952, 0.8196079, 0, 1, 1,
0.9122274, -0.3925016, 2.56941, 0.8235294, 0, 1, 1,
0.9148012, 0.01586839, 2.566355, 0.8313726, 0, 1, 1,
0.921504, -0.5976024, 3.724159, 0.8352941, 0, 1, 1,
0.9219671, 0.8802879, 1.019658, 0.8431373, 0, 1, 1,
0.9285418, 1.140132, -0.318736, 0.8470588, 0, 1, 1,
0.9301395, 0.766906, 0.5122122, 0.854902, 0, 1, 1,
0.9361527, -0.6187803, 0.7242346, 0.8588235, 0, 1, 1,
0.9420102, -1.321123, 3.804034, 0.8666667, 0, 1, 1,
0.9484758, 0.1133676, 2.577289, 0.8705882, 0, 1, 1,
0.9489866, 0.1329601, 2.593104, 0.8784314, 0, 1, 1,
0.9524885, 2.0563, 1.468334, 0.8823529, 0, 1, 1,
0.9541401, -0.3350489, 1.563773, 0.8901961, 0, 1, 1,
0.9557059, 0.591403, 2.666958, 0.8941177, 0, 1, 1,
0.9564077, -1.093058, 4.776608, 0.9019608, 0, 1, 1,
0.9576399, 2.704519, -2.40981, 0.9098039, 0, 1, 1,
0.9618415, -0.9092426, 1.826188, 0.9137255, 0, 1, 1,
0.961958, 0.3347219, 1.458541, 0.9215686, 0, 1, 1,
0.9620433, -0.06978773, 1.736538, 0.9254902, 0, 1, 1,
0.964174, 1.332391, 2.154451, 0.9333333, 0, 1, 1,
0.964179, 0.4077296, 1.943383, 0.9372549, 0, 1, 1,
0.9643956, -0.3449105, 1.198357, 0.945098, 0, 1, 1,
0.9729179, -0.3017954, 2.813202, 0.9490196, 0, 1, 1,
0.9759716, 0.344967, 3.116035, 0.9568627, 0, 1, 1,
0.9823253, -0.9688962, 1.043772, 0.9607843, 0, 1, 1,
0.9835986, -1.107083, 2.146103, 0.9686275, 0, 1, 1,
0.9836032, -0.5350916, 2.524888, 0.972549, 0, 1, 1,
0.984834, -1.090639, 2.914606, 0.9803922, 0, 1, 1,
1.000544, -0.1566034, 0.4616666, 0.9843137, 0, 1, 1,
1.015716, 0.6491327, -1.042234, 0.9921569, 0, 1, 1,
1.020722, -0.7054347, 3.187766, 0.9960784, 0, 1, 1,
1.022326, -0.7269044, 1.612992, 1, 0, 0.9960784, 1,
1.030557, 0.3495351, 2.655295, 1, 0, 0.9882353, 1,
1.035642, 1.351784, 1.180407, 1, 0, 0.9843137, 1,
1.036803, 1.156788, 0.8726116, 1, 0, 0.9764706, 1,
1.040145, -1.431968, 3.339784, 1, 0, 0.972549, 1,
1.041009, 0.2837603, 2.501726, 1, 0, 0.9647059, 1,
1.043099, -1.496357, 2.252706, 1, 0, 0.9607843, 1,
1.050577, -1.06535, 2.771687, 1, 0, 0.9529412, 1,
1.054526, -0.04496527, 2.514884, 1, 0, 0.9490196, 1,
1.05585, 1.234002, 0.8280063, 1, 0, 0.9411765, 1,
1.058212, 0.244922, 2.887523, 1, 0, 0.9372549, 1,
1.060893, 0.6060294, 0.4872195, 1, 0, 0.9294118, 1,
1.068154, -0.2718519, 1.125023, 1, 0, 0.9254902, 1,
1.068631, 0.3283562, 1.38463, 1, 0, 0.9176471, 1,
1.072774, 0.7253307, 2.120198, 1, 0, 0.9137255, 1,
1.072863, -0.1259013, 1.094094, 1, 0, 0.9058824, 1,
1.073625, -1.170605, 3.006555, 1, 0, 0.9019608, 1,
1.076123, -0.8945606, 3.544248, 1, 0, 0.8941177, 1,
1.082776, -0.1186154, 1.512322, 1, 0, 0.8862745, 1,
1.082978, 3.313775, 1.476331, 1, 0, 0.8823529, 1,
1.087575, -0.3296784, 2.250539, 1, 0, 0.8745098, 1,
1.096212, -1.287469, 3.487296, 1, 0, 0.8705882, 1,
1.099281, -0.2819979, 2.563877, 1, 0, 0.8627451, 1,
1.10937, 1.810944, 0.298729, 1, 0, 0.8588235, 1,
1.112434, 0.04222731, 2.00993, 1, 0, 0.8509804, 1,
1.118366, 0.9834166, -0.2114624, 1, 0, 0.8470588, 1,
1.124172, 1.578117, 2.930089, 1, 0, 0.8392157, 1,
1.125761, 0.8130007, 1.813012, 1, 0, 0.8352941, 1,
1.132216, -1.30667, 2.101879, 1, 0, 0.827451, 1,
1.132454, 0.01187107, 2.375672, 1, 0, 0.8235294, 1,
1.133776, 0.3029862, 2.069016, 1, 0, 0.8156863, 1,
1.134534, 0.1525708, 1.523299, 1, 0, 0.8117647, 1,
1.140056, 0.2512153, 1.787433, 1, 0, 0.8039216, 1,
1.148417, -0.2735376, 1.337414, 1, 0, 0.7960784, 1,
1.14915, -0.7016338, 2.087457, 1, 0, 0.7921569, 1,
1.150265, 0.3473575, 2.644589, 1, 0, 0.7843137, 1,
1.155433, -2.518075, 1.940628, 1, 0, 0.7803922, 1,
1.16797, -0.08246817, 1.990174, 1, 0, 0.772549, 1,
1.173452, -0.7122593, 1.257896, 1, 0, 0.7686275, 1,
1.175464, -0.4887531, 1.763604, 1, 0, 0.7607843, 1,
1.180013, -0.7053005, 2.132996, 1, 0, 0.7568628, 1,
1.184148, 0.3266396, 2.1832, 1, 0, 0.7490196, 1,
1.18525, 0.219657, 1.115002, 1, 0, 0.7450981, 1,
1.186763, -1.458264, 2.788999, 1, 0, 0.7372549, 1,
1.192447, -2.636766, 2.707611, 1, 0, 0.7333333, 1,
1.201782, -0.001583126, 1.004174, 1, 0, 0.7254902, 1,
1.20304, 0.07551945, 0.7930224, 1, 0, 0.7215686, 1,
1.204994, -1.283008, 1.934408, 1, 0, 0.7137255, 1,
1.206253, -0.8636779, 1.96674, 1, 0, 0.7098039, 1,
1.213029, -2.43586, 2.659695, 1, 0, 0.7019608, 1,
1.220249, -0.7232166, 2.5902, 1, 0, 0.6941177, 1,
1.22025, -1.43879, 3.876985, 1, 0, 0.6901961, 1,
1.220525, 0.3139542, 1.522668, 1, 0, 0.682353, 1,
1.236271, 0.8679323, 0.2384796, 1, 0, 0.6784314, 1,
1.23891, -0.8446651, 3.76245, 1, 0, 0.6705883, 1,
1.247763, -1.024609, 0.7894166, 1, 0, 0.6666667, 1,
1.254372, -0.143262, 2.181664, 1, 0, 0.6588235, 1,
1.256254, 1.307574, 0.1036749, 1, 0, 0.654902, 1,
1.259402, 0.9424289, 0.6058198, 1, 0, 0.6470588, 1,
1.260751, 0.592259, 0.3571115, 1, 0, 0.6431373, 1,
1.271617, -0.2166074, 1.087699, 1, 0, 0.6352941, 1,
1.279392, 0.2013253, 0.2437115, 1, 0, 0.6313726, 1,
1.280904, -1.766888, 0.8743508, 1, 0, 0.6235294, 1,
1.281257, 0.646487, 1.275264, 1, 0, 0.6196079, 1,
1.282295, -1.802885, 3.228059, 1, 0, 0.6117647, 1,
1.297788, -1.108544, 3.415045, 1, 0, 0.6078432, 1,
1.301063, -0.0839208, 2.614119, 1, 0, 0.6, 1,
1.306263, 1.268957, -0.1406667, 1, 0, 0.5921569, 1,
1.307482, 0.7649855, -0.2295136, 1, 0, 0.5882353, 1,
1.308336, -1.804104, 0.7848337, 1, 0, 0.5803922, 1,
1.348397, 0.1721031, 2.721657, 1, 0, 0.5764706, 1,
1.354012, 0.576609, 2.043961, 1, 0, 0.5686275, 1,
1.355321, -2.906992, 2.489482, 1, 0, 0.5647059, 1,
1.36101, 1.130147, 0.1266299, 1, 0, 0.5568628, 1,
1.363059, 0.06493971, 1.754173, 1, 0, 0.5529412, 1,
1.367828, 0.1918401, 1.606215, 1, 0, 0.5450981, 1,
1.371519, -1.103293, 2.198114, 1, 0, 0.5411765, 1,
1.401911, 0.1129302, 2.702548, 1, 0, 0.5333334, 1,
1.408151, -1.688726, 1.813365, 1, 0, 0.5294118, 1,
1.410053, 0.9708549, 2.022048, 1, 0, 0.5215687, 1,
1.425189, -0.9947494, 2.123514, 1, 0, 0.5176471, 1,
1.431076, 1.372646, 1.316414, 1, 0, 0.509804, 1,
1.436846, 1.378362, 3.454098, 1, 0, 0.5058824, 1,
1.453931, -1.367909, 1.753681, 1, 0, 0.4980392, 1,
1.459108, -1.340616, 2.371654, 1, 0, 0.4901961, 1,
1.469818, -0.7890445, 2.622502, 1, 0, 0.4862745, 1,
1.486003, 1.086687, 1.472711, 1, 0, 0.4784314, 1,
1.496318, 0.9119832, 1.156375, 1, 0, 0.4745098, 1,
1.504587, 0.3764413, 2.022367, 1, 0, 0.4666667, 1,
1.514721, 0.5987771, -0.458132, 1, 0, 0.4627451, 1,
1.518407, 0.2527671, -0.9652316, 1, 0, 0.454902, 1,
1.522072, 0.2171569, 0.8668437, 1, 0, 0.4509804, 1,
1.529237, 0.5633307, 0.2089366, 1, 0, 0.4431373, 1,
1.532591, 0.4735878, 0.9947774, 1, 0, 0.4392157, 1,
1.543275, -1.162881, 4.507039, 1, 0, 0.4313726, 1,
1.550339, 0.1857123, -0.1219958, 1, 0, 0.427451, 1,
1.566738, -1.297957, 2.858478, 1, 0, 0.4196078, 1,
1.584757, 0.5673795, 0.4094617, 1, 0, 0.4156863, 1,
1.588678, 0.7744291, -0.3905298, 1, 0, 0.4078431, 1,
1.588787, 1.945253, 1.199604, 1, 0, 0.4039216, 1,
1.610103, -1.077597, 2.66328, 1, 0, 0.3960784, 1,
1.623539, 0.4758804, 0.7922044, 1, 0, 0.3882353, 1,
1.625027, 0.3194199, 1.330112, 1, 0, 0.3843137, 1,
1.625221, -0.4986502, 2.567518, 1, 0, 0.3764706, 1,
1.645597, -1.349011, 1.876377, 1, 0, 0.372549, 1,
1.651026, 0.0577172, 1.748239, 1, 0, 0.3647059, 1,
1.65264, 1.209026, 1.234965, 1, 0, 0.3607843, 1,
1.658524, 2.111155, 2.119191, 1, 0, 0.3529412, 1,
1.661996, -0.137382, 1.200497, 1, 0, 0.3490196, 1,
1.667573, -0.888829, 2.327242, 1, 0, 0.3411765, 1,
1.6987, -1.098451, 2.133273, 1, 0, 0.3372549, 1,
1.701746, 1.30415, 2.000262, 1, 0, 0.3294118, 1,
1.711137, 0.9559525, 1.969353, 1, 0, 0.3254902, 1,
1.711243, -1.382885, 1.483825, 1, 0, 0.3176471, 1,
1.711657, -1.164428, 2.818084, 1, 0, 0.3137255, 1,
1.72218, 0.2633401, 1.937348, 1, 0, 0.3058824, 1,
1.732578, 0.2964248, 1.205663, 1, 0, 0.2980392, 1,
1.737421, 0.04914933, 0.8998523, 1, 0, 0.2941177, 1,
1.746359, -0.8686911, 2.069243, 1, 0, 0.2862745, 1,
1.747997, -0.3914887, 0.9, 1, 0, 0.282353, 1,
1.758795, 0.6036601, 1.001508, 1, 0, 0.2745098, 1,
1.776864, -0.1545957, 2.815014, 1, 0, 0.2705882, 1,
1.779866, -1.073292, 0.8395548, 1, 0, 0.2627451, 1,
1.780525, -1.21677, 1.661468, 1, 0, 0.2588235, 1,
1.805855, 0.5813946, -0.2098896, 1, 0, 0.2509804, 1,
1.812148, -0.04383334, 3.463654, 1, 0, 0.2470588, 1,
1.821365, 0.6802785, 0.6537032, 1, 0, 0.2392157, 1,
1.821639, -0.06419776, 2.112019, 1, 0, 0.2352941, 1,
1.827777, 0.1943889, 0.6652538, 1, 0, 0.227451, 1,
1.856832, -1.33132, 1.195658, 1, 0, 0.2235294, 1,
1.859045, 0.4345548, 1.367306, 1, 0, 0.2156863, 1,
1.891337, 0.9220083, 1.382962, 1, 0, 0.2117647, 1,
1.900034, 0.6672159, 1.183613, 1, 0, 0.2039216, 1,
1.931562, 1.017087, -0.5505122, 1, 0, 0.1960784, 1,
1.931696, -0.678832, 1.01097, 1, 0, 0.1921569, 1,
1.94481, 0.1365051, 2.164815, 1, 0, 0.1843137, 1,
1.946043, 0.4077738, 1.146745, 1, 0, 0.1803922, 1,
1.948697, -0.126617, 1.584441, 1, 0, 0.172549, 1,
1.967212, 1.267106, -0.1108803, 1, 0, 0.1686275, 1,
1.982217, -0.480746, 0.2725476, 1, 0, 0.1607843, 1,
1.984981, -1.164013, 4.451837, 1, 0, 0.1568628, 1,
2.06057, 0.7113562, 1.809852, 1, 0, 0.1490196, 1,
2.090366, -0.696982, 2.106714, 1, 0, 0.145098, 1,
2.116081, -0.5334345, 0.6501615, 1, 0, 0.1372549, 1,
2.121857, -0.8307196, 1.25624, 1, 0, 0.1333333, 1,
2.134542, -1.409028, 2.916079, 1, 0, 0.1254902, 1,
2.143445, 1.91723, 1.59121, 1, 0, 0.1215686, 1,
2.190448, 0.08853566, 0.03404279, 1, 0, 0.1137255, 1,
2.196558, 0.3452064, 1.348177, 1, 0, 0.1098039, 1,
2.211597, -1.343165, 3.060717, 1, 0, 0.1019608, 1,
2.218457, 0.3474861, 2.26283, 1, 0, 0.09411765, 1,
2.235258, 0.1301877, 2.797256, 1, 0, 0.09019608, 1,
2.237771, -0.3557648, 1.601118, 1, 0, 0.08235294, 1,
2.245249, 1.164501, 2.308929, 1, 0, 0.07843138, 1,
2.2947, -1.412382, 1.362621, 1, 0, 0.07058824, 1,
2.295816, -0.8240968, 2.14579, 1, 0, 0.06666667, 1,
2.326487, -0.9447991, 2.453439, 1, 0, 0.05882353, 1,
2.336164, 1.518188, 0.6789153, 1, 0, 0.05490196, 1,
2.343804, -0.506458, 0.4720699, 1, 0, 0.04705882, 1,
2.385557, -0.3122149, 1.73201, 1, 0, 0.04313726, 1,
2.444609, -0.7967508, 1.103156, 1, 0, 0.03529412, 1,
2.5428, -1.393332, 3.505473, 1, 0, 0.03137255, 1,
2.598618, 0.087106, 2.002127, 1, 0, 0.02352941, 1,
2.613396, 1.570903, 1.88823, 1, 0, 0.01960784, 1,
2.678375, -1.733048, 0.04422537, 1, 0, 0.01176471, 1,
3.185585, 0.237695, 2.856694, 1, 0, 0.007843138, 1
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
-0.02124548, -3.961412, -7.733162, 0, -0.5, 0.5, 0.5,
-0.02124548, -3.961412, -7.733162, 1, -0.5, 0.5, 0.5,
-0.02124548, -3.961412, -7.733162, 1, 1.5, 0.5, 0.5,
-0.02124548, -3.961412, -7.733162, 0, 1.5, 0.5, 0.5
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
-4.315192, 0.2033914, -7.733162, 0, -0.5, 0.5, 0.5,
-4.315192, 0.2033914, -7.733162, 1, -0.5, 0.5, 0.5,
-4.315192, 0.2033914, -7.733162, 1, 1.5, 0.5, 0.5,
-4.315192, 0.2033914, -7.733162, 0, 1.5, 0.5, 0.5
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
-4.315192, -3.961412, -0.351114, 0, -0.5, 0.5, 0.5,
-4.315192, -3.961412, -0.351114, 1, -0.5, 0.5, 0.5,
-4.315192, -3.961412, -0.351114, 1, 1.5, 0.5, 0.5,
-4.315192, -3.961412, -0.351114, 0, 1.5, 0.5, 0.5
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
-3, -3.000303, -6.029613,
3, -3.000303, -6.029613,
-3, -3.000303, -6.029613,
-3, -3.160488, -6.313537,
-2, -3.000303, -6.029613,
-2, -3.160488, -6.313537,
-1, -3.000303, -6.029613,
-1, -3.160488, -6.313537,
0, -3.000303, -6.029613,
0, -3.160488, -6.313537,
1, -3.000303, -6.029613,
1, -3.160488, -6.313537,
2, -3.000303, -6.029613,
2, -3.160488, -6.313537,
3, -3.000303, -6.029613,
3, -3.160488, -6.313537
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
-3, -3.480857, -6.881387, 0, -0.5, 0.5, 0.5,
-3, -3.480857, -6.881387, 1, -0.5, 0.5, 0.5,
-3, -3.480857, -6.881387, 1, 1.5, 0.5, 0.5,
-3, -3.480857, -6.881387, 0, 1.5, 0.5, 0.5,
-2, -3.480857, -6.881387, 0, -0.5, 0.5, 0.5,
-2, -3.480857, -6.881387, 1, -0.5, 0.5, 0.5,
-2, -3.480857, -6.881387, 1, 1.5, 0.5, 0.5,
-2, -3.480857, -6.881387, 0, 1.5, 0.5, 0.5,
-1, -3.480857, -6.881387, 0, -0.5, 0.5, 0.5,
-1, -3.480857, -6.881387, 1, -0.5, 0.5, 0.5,
-1, -3.480857, -6.881387, 1, 1.5, 0.5, 0.5,
-1, -3.480857, -6.881387, 0, 1.5, 0.5, 0.5,
0, -3.480857, -6.881387, 0, -0.5, 0.5, 0.5,
0, -3.480857, -6.881387, 1, -0.5, 0.5, 0.5,
0, -3.480857, -6.881387, 1, 1.5, 0.5, 0.5,
0, -3.480857, -6.881387, 0, 1.5, 0.5, 0.5,
1, -3.480857, -6.881387, 0, -0.5, 0.5, 0.5,
1, -3.480857, -6.881387, 1, -0.5, 0.5, 0.5,
1, -3.480857, -6.881387, 1, 1.5, 0.5, 0.5,
1, -3.480857, -6.881387, 0, 1.5, 0.5, 0.5,
2, -3.480857, -6.881387, 0, -0.5, 0.5, 0.5,
2, -3.480857, -6.881387, 1, -0.5, 0.5, 0.5,
2, -3.480857, -6.881387, 1, 1.5, 0.5, 0.5,
2, -3.480857, -6.881387, 0, 1.5, 0.5, 0.5,
3, -3.480857, -6.881387, 0, -0.5, 0.5, 0.5,
3, -3.480857, -6.881387, 1, -0.5, 0.5, 0.5,
3, -3.480857, -6.881387, 1, 1.5, 0.5, 0.5,
3, -3.480857, -6.881387, 0, 1.5, 0.5, 0.5
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
-3.324281, -2, -6.029613,
-3.324281, 3, -6.029613,
-3.324281, -2, -6.029613,
-3.489433, -2, -6.313537,
-3.324281, -1, -6.029613,
-3.489433, -1, -6.313537,
-3.324281, 0, -6.029613,
-3.489433, 0, -6.313537,
-3.324281, 1, -6.029613,
-3.489433, 1, -6.313537,
-3.324281, 2, -6.029613,
-3.489433, 2, -6.313537,
-3.324281, 3, -6.029613,
-3.489433, 3, -6.313537
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
-3.819737, -2, -6.881387, 0, -0.5, 0.5, 0.5,
-3.819737, -2, -6.881387, 1, -0.5, 0.5, 0.5,
-3.819737, -2, -6.881387, 1, 1.5, 0.5, 0.5,
-3.819737, -2, -6.881387, 0, 1.5, 0.5, 0.5,
-3.819737, -1, -6.881387, 0, -0.5, 0.5, 0.5,
-3.819737, -1, -6.881387, 1, -0.5, 0.5, 0.5,
-3.819737, -1, -6.881387, 1, 1.5, 0.5, 0.5,
-3.819737, -1, -6.881387, 0, 1.5, 0.5, 0.5,
-3.819737, 0, -6.881387, 0, -0.5, 0.5, 0.5,
-3.819737, 0, -6.881387, 1, -0.5, 0.5, 0.5,
-3.819737, 0, -6.881387, 1, 1.5, 0.5, 0.5,
-3.819737, 0, -6.881387, 0, 1.5, 0.5, 0.5,
-3.819737, 1, -6.881387, 0, -0.5, 0.5, 0.5,
-3.819737, 1, -6.881387, 1, -0.5, 0.5, 0.5,
-3.819737, 1, -6.881387, 1, 1.5, 0.5, 0.5,
-3.819737, 1, -6.881387, 0, 1.5, 0.5, 0.5,
-3.819737, 2, -6.881387, 0, -0.5, 0.5, 0.5,
-3.819737, 2, -6.881387, 1, -0.5, 0.5, 0.5,
-3.819737, 2, -6.881387, 1, 1.5, 0.5, 0.5,
-3.819737, 2, -6.881387, 0, 1.5, 0.5, 0.5,
-3.819737, 3, -6.881387, 0, -0.5, 0.5, 0.5,
-3.819737, 3, -6.881387, 1, -0.5, 0.5, 0.5,
-3.819737, 3, -6.881387, 1, 1.5, 0.5, 0.5,
-3.819737, 3, -6.881387, 0, 1.5, 0.5, 0.5
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
-3.324281, -3.000303, -4,
-3.324281, -3.000303, 4,
-3.324281, -3.000303, -4,
-3.489433, -3.160488, -4,
-3.324281, -3.000303, -2,
-3.489433, -3.160488, -2,
-3.324281, -3.000303, 0,
-3.489433, -3.160488, 0,
-3.324281, -3.000303, 2,
-3.489433, -3.160488, 2,
-3.324281, -3.000303, 4,
-3.489433, -3.160488, 4
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
-3.819737, -3.480857, -4, 0, -0.5, 0.5, 0.5,
-3.819737, -3.480857, -4, 1, -0.5, 0.5, 0.5,
-3.819737, -3.480857, -4, 1, 1.5, 0.5, 0.5,
-3.819737, -3.480857, -4, 0, 1.5, 0.5, 0.5,
-3.819737, -3.480857, -2, 0, -0.5, 0.5, 0.5,
-3.819737, -3.480857, -2, 1, -0.5, 0.5, 0.5,
-3.819737, -3.480857, -2, 1, 1.5, 0.5, 0.5,
-3.819737, -3.480857, -2, 0, 1.5, 0.5, 0.5,
-3.819737, -3.480857, 0, 0, -0.5, 0.5, 0.5,
-3.819737, -3.480857, 0, 1, -0.5, 0.5, 0.5,
-3.819737, -3.480857, 0, 1, 1.5, 0.5, 0.5,
-3.819737, -3.480857, 0, 0, 1.5, 0.5, 0.5,
-3.819737, -3.480857, 2, 0, -0.5, 0.5, 0.5,
-3.819737, -3.480857, 2, 1, -0.5, 0.5, 0.5,
-3.819737, -3.480857, 2, 1, 1.5, 0.5, 0.5,
-3.819737, -3.480857, 2, 0, 1.5, 0.5, 0.5,
-3.819737, -3.480857, 4, 0, -0.5, 0.5, 0.5,
-3.819737, -3.480857, 4, 1, -0.5, 0.5, 0.5,
-3.819737, -3.480857, 4, 1, 1.5, 0.5, 0.5,
-3.819737, -3.480857, 4, 0, 1.5, 0.5, 0.5
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
-3.324281, -3.000303, -6.029613,
-3.324281, 3.407086, -6.029613,
-3.324281, -3.000303, 5.327384,
-3.324281, 3.407086, 5.327384,
-3.324281, -3.000303, -6.029613,
-3.324281, -3.000303, 5.327384,
-3.324281, 3.407086, -6.029613,
-3.324281, 3.407086, 5.327384,
-3.324281, -3.000303, -6.029613,
3.28179, -3.000303, -6.029613,
-3.324281, -3.000303, 5.327384,
3.28179, -3.000303, 5.327384,
-3.324281, 3.407086, -6.029613,
3.28179, 3.407086, -6.029613,
-3.324281, 3.407086, 5.327384,
3.28179, 3.407086, 5.327384,
3.28179, -3.000303, -6.029613,
3.28179, 3.407086, -6.029613,
3.28179, -3.000303, 5.327384,
3.28179, 3.407086, 5.327384,
3.28179, -3.000303, -6.029613,
3.28179, -3.000303, 5.327384,
3.28179, 3.407086, -6.029613,
3.28179, 3.407086, 5.327384
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
var radius = 7.805551;
var distance = 34.72778;
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
mvMatrix.translate( 0.02124548, -0.2033914, 0.351114 );
mvMatrix.scale( 1.277539, 1.317153, 0.7431114 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.72778);
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
flumetsulam<-read.table("flumetsulam.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flumetsulam$V2
```

```
## Error in eval(expr, envir, enclos): object 'flumetsulam' not found
```

```r
y<-flumetsulam$V3
```

```
## Error in eval(expr, envir, enclos): object 'flumetsulam' not found
```

```r
z<-flumetsulam$V4
```

```
## Error in eval(expr, envir, enclos): object 'flumetsulam' not found
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
-3.228076, -0.5619834, -1.957662, 0, 0, 1, 1, 1,
-3.131855, 0.2585847, -3.546537, 1, 0, 0, 1, 1,
-2.80536, 0.9296094, -2.739446, 1, 0, 0, 1, 1,
-2.763571, 1.398158, -1.880609, 1, 0, 0, 1, 1,
-2.710905, 0.07920348, -0.1949975, 1, 0, 0, 1, 1,
-2.581937, 0.3561682, 0.7131313, 1, 0, 0, 1, 1,
-2.503457, 0.2551529, -0.7361739, 0, 0, 0, 1, 1,
-2.475278, -1.476924, -3.545946, 0, 0, 0, 1, 1,
-2.415904, -0.1130493, -1.922585, 0, 0, 0, 1, 1,
-2.391817, 0.1866791, -1.798513, 0, 0, 0, 1, 1,
-2.386362, 0.303304, -0.3598063, 0, 0, 0, 1, 1,
-2.378793, 1.481062, -0.732526, 0, 0, 0, 1, 1,
-2.357065, -0.05439046, -0.8178053, 0, 0, 0, 1, 1,
-2.251598, -0.6186785, -1.107916, 1, 1, 1, 1, 1,
-2.236582, -0.9803751, -3.323552, 1, 1, 1, 1, 1,
-2.214508, 1.703778, -1.03143, 1, 1, 1, 1, 1,
-2.192932, -0.5803028, -2.611748, 1, 1, 1, 1, 1,
-2.09884, -0.2036763, -1.728752, 1, 1, 1, 1, 1,
-2.068649, -0.6951573, -2.246289, 1, 1, 1, 1, 1,
-2.026163, 0.2838183, -1.631315, 1, 1, 1, 1, 1,
-1.982635, -1.664082, -1.607801, 1, 1, 1, 1, 1,
-1.972529, 1.144622, -2.884106, 1, 1, 1, 1, 1,
-1.943147, 1.444253, -0.8271238, 1, 1, 1, 1, 1,
-1.939539, -1.892564, -1.397095, 1, 1, 1, 1, 1,
-1.920305, -1.03809, -2.849076, 1, 1, 1, 1, 1,
-1.914693, -0.7323461, -1.698204, 1, 1, 1, 1, 1,
-1.907784, -0.6873519, -1.072396, 1, 1, 1, 1, 1,
-1.900038, 0.860629, -1.020594, 1, 1, 1, 1, 1,
-1.891702, -0.4982047, -0.9273468, 0, 0, 1, 1, 1,
-1.890114, -0.04227763, -3.058339, 1, 0, 0, 1, 1,
-1.864155, -0.3030691, -0.9445672, 1, 0, 0, 1, 1,
-1.828661, 0.1597767, -1.734899, 1, 0, 0, 1, 1,
-1.822831, -0.1173166, -1.392604, 1, 0, 0, 1, 1,
-1.816071, -0.9920484, -2.278075, 1, 0, 0, 1, 1,
-1.800979, 1.189949, -2.259673, 0, 0, 0, 1, 1,
-1.779453, 1.348237, -0.7588058, 0, 0, 0, 1, 1,
-1.772323, 0.9859045, -1.12112, 0, 0, 0, 1, 1,
-1.772151, 0.6137591, -0.5400062, 0, 0, 0, 1, 1,
-1.770737, 1.097374, -0.6157695, 0, 0, 0, 1, 1,
-1.769949, -0.8219024, -2.565606, 0, 0, 0, 1, 1,
-1.769152, -0.2080536, -2.098789, 0, 0, 0, 1, 1,
-1.75851, -0.258239, 0.3673105, 1, 1, 1, 1, 1,
-1.739801, 0.598859, -2.248321, 1, 1, 1, 1, 1,
-1.719246, 1.319142, -1.42987, 1, 1, 1, 1, 1,
-1.716201, 0.8816096, -1.542689, 1, 1, 1, 1, 1,
-1.714838, -1.045805, -2.158098, 1, 1, 1, 1, 1,
-1.686603, -1.223047, -0.6166199, 1, 1, 1, 1, 1,
-1.684465, 0.4302579, -2.02778, 1, 1, 1, 1, 1,
-1.675387, -0.3577113, -1.884153, 1, 1, 1, 1, 1,
-1.672709, 0.6060389, -1.738024, 1, 1, 1, 1, 1,
-1.668424, -1.365704, -1.963284, 1, 1, 1, 1, 1,
-1.666781, -0.1109634, -1.685657, 1, 1, 1, 1, 1,
-1.656829, 0.4453912, -1.1008, 1, 1, 1, 1, 1,
-1.64833, 1.372668, -1.386731, 1, 1, 1, 1, 1,
-1.635963, -1.098279, -4.797287, 1, 1, 1, 1, 1,
-1.630938, -0.5548322, -2.126975, 1, 1, 1, 1, 1,
-1.608639, 0.3590148, -0.7487285, 0, 0, 1, 1, 1,
-1.577533, -0.6319341, -3.503458, 1, 0, 0, 1, 1,
-1.575062, -1.669534, -1.277625, 1, 0, 0, 1, 1,
-1.571727, -0.9578294, -2.667393, 1, 0, 0, 1, 1,
-1.571004, 0.8162243, -1.225649, 1, 0, 0, 1, 1,
-1.559663, 0.1640147, -0.6888051, 1, 0, 0, 1, 1,
-1.52911, -0.5659914, -1.001203, 0, 0, 0, 1, 1,
-1.528515, -0.2928374, -2.103216, 0, 0, 0, 1, 1,
-1.52831, -1.681778, -1.876335, 0, 0, 0, 1, 1,
-1.520687, 0.6730518, -0.9313729, 0, 0, 0, 1, 1,
-1.51076, 0.5824712, -1.376643, 0, 0, 0, 1, 1,
-1.507781, 1.675475, -0.450139, 0, 0, 0, 1, 1,
-1.507397, 1.056465, -1.305688, 0, 0, 0, 1, 1,
-1.507361, -1.218585, -3.209564, 1, 1, 1, 1, 1,
-1.499109, -1.363254, -2.091236, 1, 1, 1, 1, 1,
-1.496768, -0.02268662, -0.109692, 1, 1, 1, 1, 1,
-1.489262, -0.9426334, -0.4235115, 1, 1, 1, 1, 1,
-1.480467, -2.069351, -4.667191, 1, 1, 1, 1, 1,
-1.473145, 0.5970478, -3.195838, 1, 1, 1, 1, 1,
-1.472848, -0.1941871, -1.156906, 1, 1, 1, 1, 1,
-1.472663, 0.6943285, 0.8310282, 1, 1, 1, 1, 1,
-1.466448, 0.4391975, -0.6467841, 1, 1, 1, 1, 1,
-1.43971, 0.5324338, 0.246938, 1, 1, 1, 1, 1,
-1.434769, 1.007044, -0.6199518, 1, 1, 1, 1, 1,
-1.426928, 0.3479128, -2.152654, 1, 1, 1, 1, 1,
-1.420852, -0.7168016, -2.624913, 1, 1, 1, 1, 1,
-1.420463, 0.09551881, -1.855936, 1, 1, 1, 1, 1,
-1.419192, -1.439035, -2.472294, 1, 1, 1, 1, 1,
-1.414999, 0.9833521, -0.9030812, 0, 0, 1, 1, 1,
-1.403185, -0.1591806, -0.04686714, 1, 0, 0, 1, 1,
-1.401013, -0.5300067, -1.244882, 1, 0, 0, 1, 1,
-1.399227, -0.82173, -2.84907, 1, 0, 0, 1, 1,
-1.393268, -2.440781, -1.916498, 1, 0, 0, 1, 1,
-1.392476, -0.5970085, -2.690354, 1, 0, 0, 1, 1,
-1.391372, -1.164752, -3.032718, 0, 0, 0, 1, 1,
-1.385481, 0.1147446, -1.265038, 0, 0, 0, 1, 1,
-1.367657, 0.431518, 0.2330175, 0, 0, 0, 1, 1,
-1.363329, -1.017548, -3.283034, 0, 0, 0, 1, 1,
-1.358681, 1.458295, 0.4162834, 0, 0, 0, 1, 1,
-1.331837, 0.6235971, -2.824473, 0, 0, 0, 1, 1,
-1.327232, -0.8406773, -2.219053, 0, 0, 0, 1, 1,
-1.29718, 0.3566178, -1.61851, 1, 1, 1, 1, 1,
-1.295007, -0.4277298, -0.6507336, 1, 1, 1, 1, 1,
-1.294448, 0.3122154, -3.126388, 1, 1, 1, 1, 1,
-1.293034, 0.4042413, -2.387085, 1, 1, 1, 1, 1,
-1.284003, 0.03627823, -1.729037, 1, 1, 1, 1, 1,
-1.273471, 0.02247175, -1.327431, 1, 1, 1, 1, 1,
-1.257638, -0.2536933, -1.635824, 1, 1, 1, 1, 1,
-1.243044, 1.544524, -1.619984, 1, 1, 1, 1, 1,
-1.241411, -0.9954897, -3.41315, 1, 1, 1, 1, 1,
-1.240455, 1.706394, -0.6524647, 1, 1, 1, 1, 1,
-1.237369, -0.1013185, -0.3381395, 1, 1, 1, 1, 1,
-1.224041, -0.4386215, -2.243933, 1, 1, 1, 1, 1,
-1.222124, 1.406706, 0.2971429, 1, 1, 1, 1, 1,
-1.219937, -0.9621976, -3.63962, 1, 1, 1, 1, 1,
-1.215646, -0.3077225, -1.901265, 1, 1, 1, 1, 1,
-1.215615, -0.1756582, 0.1282995, 0, 0, 1, 1, 1,
-1.208541, -0.2473271, -3.324574, 1, 0, 0, 1, 1,
-1.204979, -0.04777042, -2.290722, 1, 0, 0, 1, 1,
-1.192567, 0.9382333, -1.005397, 1, 0, 0, 1, 1,
-1.171553, 0.3333878, 0.2250672, 1, 0, 0, 1, 1,
-1.162093, -2.474231, -1.395271, 1, 0, 0, 1, 1,
-1.158018, -0.1598693, -0.9571127, 0, 0, 0, 1, 1,
-1.15512, 0.5834752, -1.485536, 0, 0, 0, 1, 1,
-1.149872, 0.411541, -2.256796, 0, 0, 0, 1, 1,
-1.144113, -0.2155225, -2.49956, 0, 0, 0, 1, 1,
-1.13238, -0.46522, -1.560387, 0, 0, 0, 1, 1,
-1.114625, 2.23627, -0.6571228, 0, 0, 0, 1, 1,
-1.11243, -0.7985711, -1.300042, 0, 0, 0, 1, 1,
-1.110608, -0.865847, -3.657143, 1, 1, 1, 1, 1,
-1.107019, -2.509768, -2.643134, 1, 1, 1, 1, 1,
-1.102985, 0.136963, -1.692642, 1, 1, 1, 1, 1,
-1.09564, 0.955987, -0.7144411, 1, 1, 1, 1, 1,
-1.09356, -0.3866388, -3.152866, 1, 1, 1, 1, 1,
-1.092359, 1.842641, 0.1126003, 1, 1, 1, 1, 1,
-1.092307, 2.133351, 0.609924, 1, 1, 1, 1, 1,
-1.091892, -1.778946, -1.825148, 1, 1, 1, 1, 1,
-1.089437, 1.371964, -1.020867, 1, 1, 1, 1, 1,
-1.088658, 1.403431, -1.421175, 1, 1, 1, 1, 1,
-1.086605, -0.7225025, -3.343657, 1, 1, 1, 1, 1,
-1.084867, -0.3164003, -3.15292, 1, 1, 1, 1, 1,
-1.075366, -0.1714993, -1.492015, 1, 1, 1, 1, 1,
-1.07441, -0.833697, -3.729052, 1, 1, 1, 1, 1,
-1.068848, 0.4028868, -1.530588, 1, 1, 1, 1, 1,
-1.065558, 0.1015213, 0.8142694, 0, 0, 1, 1, 1,
-1.058424, -0.1367926, -4.151235, 1, 0, 0, 1, 1,
-1.054155, 1.024416, -0.2703935, 1, 0, 0, 1, 1,
-1.050547, 0.7702654, -1.125545, 1, 0, 0, 1, 1,
-1.047391, 0.6481801, 0.9265832, 1, 0, 0, 1, 1,
-1.043299, -0.5257312, -2.735182, 1, 0, 0, 1, 1,
-1.040545, -0.5206847, -2.080595, 0, 0, 0, 1, 1,
-1.034444, 0.6727212, -1.861674, 0, 0, 0, 1, 1,
-1.017813, -0.4819205, -2.8097, 0, 0, 0, 1, 1,
-1.017256, -0.6436589, -2.264058, 0, 0, 0, 1, 1,
-1.015088, 2.336384, -1.316275, 0, 0, 0, 1, 1,
-1.011154, -1.480364, -1.992422, 0, 0, 0, 1, 1,
-1.010699, 0.7272782, 0.1538559, 0, 0, 0, 1, 1,
-1.009413, -0.08678938, -2.842803, 1, 1, 1, 1, 1,
-1.005924, 0.4547866, -0.332561, 1, 1, 1, 1, 1,
-1.001441, -0.9543238, -2.795726, 1, 1, 1, 1, 1,
-0.9997053, 0.1309851, -1.80527, 1, 1, 1, 1, 1,
-0.9960088, -0.2683259, -2.294211, 1, 1, 1, 1, 1,
-0.9906128, 0.07784364, -1.971469, 1, 1, 1, 1, 1,
-0.9848226, -0.005171606, -1.455885, 1, 1, 1, 1, 1,
-0.9785905, -0.06490842, -1.287891, 1, 1, 1, 1, 1,
-0.9760072, -1.370637, -3.622123, 1, 1, 1, 1, 1,
-0.9604083, 1.328198, 0.3859629, 1, 1, 1, 1, 1,
-0.9582481, -0.555548, -2.138061, 1, 1, 1, 1, 1,
-0.957657, 0.6096652, -2.319679, 1, 1, 1, 1, 1,
-0.9510836, 1.343293, 0.2641578, 1, 1, 1, 1, 1,
-0.9480656, -0.1715796, -3.062995, 1, 1, 1, 1, 1,
-0.9474244, 0.6265451, -1.865302, 1, 1, 1, 1, 1,
-0.9372148, -0.5290075, -1.046966, 0, 0, 1, 1, 1,
-0.936864, 0.6313975, -1.39724, 1, 0, 0, 1, 1,
-0.9354663, -1.316518, -2.943792, 1, 0, 0, 1, 1,
-0.9341335, -1.482887, -1.056953, 1, 0, 0, 1, 1,
-0.9324187, 1.401636, -0.08060887, 1, 0, 0, 1, 1,
-0.9293071, 0.5890251, -1.875818, 1, 0, 0, 1, 1,
-0.9225951, -0.3239881, -1.261471, 0, 0, 0, 1, 1,
-0.9188109, 1.257399, 0.6257086, 0, 0, 0, 1, 1,
-0.9162892, -1.056046, -0.4062439, 0, 0, 0, 1, 1,
-0.9140771, 0.6718105, -0.0380512, 0, 0, 0, 1, 1,
-0.9123126, -0.4961818, -2.675806, 0, 0, 0, 1, 1,
-0.9089904, 0.7663002, 0.5012323, 0, 0, 0, 1, 1,
-0.9010539, 0.1225275, -2.988486, 0, 0, 0, 1, 1,
-0.8859413, -1.088501, -0.07074466, 1, 1, 1, 1, 1,
-0.8817301, 0.626965, -0.6506312, 1, 1, 1, 1, 1,
-0.8813523, 1.014001, -1.184743, 1, 1, 1, 1, 1,
-0.876793, -1.62118, -3.308268, 1, 1, 1, 1, 1,
-0.8687699, 0.2965769, -2.156085, 1, 1, 1, 1, 1,
-0.8609046, -0.435739, -2.07616, 1, 1, 1, 1, 1,
-0.8593832, -0.7509904, -2.294637, 1, 1, 1, 1, 1,
-0.8584222, 0.2404462, -0.5843313, 1, 1, 1, 1, 1,
-0.8517334, -0.4094577, -2.598531, 1, 1, 1, 1, 1,
-0.8502196, -0.4951746, -2.707668, 1, 1, 1, 1, 1,
-0.8496274, -0.9010164, -2.895933, 1, 1, 1, 1, 1,
-0.8481065, 1.105189, 0.1600399, 1, 1, 1, 1, 1,
-0.8465899, -2.794766, -3.117581, 1, 1, 1, 1, 1,
-0.8464154, -1.203517, -1.715742, 1, 1, 1, 1, 1,
-0.8450784, -1.014267, -0.4588674, 1, 1, 1, 1, 1,
-0.8408365, -1.212914, -0.5517878, 0, 0, 1, 1, 1,
-0.8400964, 0.7587875, -2.397671, 1, 0, 0, 1, 1,
-0.836601, 0.3204031, -0.4888458, 1, 0, 0, 1, 1,
-0.8349393, -2.291764, -2.513619, 1, 0, 0, 1, 1,
-0.8301461, 2.199411, -1.132665, 1, 0, 0, 1, 1,
-0.8283235, -1.611187, -4.107521, 1, 0, 0, 1, 1,
-0.817201, 0.8391474, -2.118031, 0, 0, 0, 1, 1,
-0.8125082, -1.124519, -3.915978, 0, 0, 0, 1, 1,
-0.8111773, -0.05119356, -0.9359643, 0, 0, 0, 1, 1,
-0.8099161, 0.1312222, -1.474392, 0, 0, 0, 1, 1,
-0.8023328, 0.183213, -1.551424, 0, 0, 0, 1, 1,
-0.8022476, -0.6102684, -1.812514, 0, 0, 0, 1, 1,
-0.8018994, -0.6375397, -3.136497, 0, 0, 0, 1, 1,
-0.8013095, 0.4491542, -2.618712, 1, 1, 1, 1, 1,
-0.7986726, 0.6774019, -0.8164216, 1, 1, 1, 1, 1,
-0.7985132, -0.4428414, -3.724779, 1, 1, 1, 1, 1,
-0.7954082, 1.606564, -0.497768, 1, 1, 1, 1, 1,
-0.7917665, -0.2049475, -3.533088, 1, 1, 1, 1, 1,
-0.7893254, 1.340072, -2.342939, 1, 1, 1, 1, 1,
-0.7870074, 0.5707439, -1.370768, 1, 1, 1, 1, 1,
-0.7837752, 0.8829923, -0.5787317, 1, 1, 1, 1, 1,
-0.7797095, -0.155083, -1.399688, 1, 1, 1, 1, 1,
-0.7767913, 1.480302, -1.002144, 1, 1, 1, 1, 1,
-0.7767237, 0.2058831, 0.2518754, 1, 1, 1, 1, 1,
-0.7746958, 0.7847574, -0.9133471, 1, 1, 1, 1, 1,
-0.7661911, -0.5870103, -1.776728, 1, 1, 1, 1, 1,
-0.7646732, 0.9055209, 0.290128, 1, 1, 1, 1, 1,
-0.7606819, -2.382087, -4.9401, 1, 1, 1, 1, 1,
-0.7584037, -0.233773, -2.828187, 0, 0, 1, 1, 1,
-0.7511587, -1.331215, -2.087423, 1, 0, 0, 1, 1,
-0.748713, -0.4967724, -1.502363, 1, 0, 0, 1, 1,
-0.7474452, 1.294765, 0.6488101, 1, 0, 0, 1, 1,
-0.7393167, 0.2185989, -2.336229, 1, 0, 0, 1, 1,
-0.7360618, 0.9289243, 0.4618016, 1, 0, 0, 1, 1,
-0.7354499, -1.044553, -3.039615, 0, 0, 0, 1, 1,
-0.7282039, -1.365297, -3.3336, 0, 0, 0, 1, 1,
-0.7271357, 2.185872, -0.9000236, 0, 0, 0, 1, 1,
-0.7261905, 1.072553, -2.062586, 0, 0, 0, 1, 1,
-0.7221897, 0.4395092, -2.430264, 0, 0, 0, 1, 1,
-0.7210684, -1.61189, -3.350382, 0, 0, 0, 1, 1,
-0.7196643, 0.8933392, -1.645294, 0, 0, 0, 1, 1,
-0.718949, -0.4098041, -2.502699, 1, 1, 1, 1, 1,
-0.7186669, 0.7437545, -0.6169601, 1, 1, 1, 1, 1,
-0.715507, 0.7238263, 1.009309, 1, 1, 1, 1, 1,
-0.6950403, 0.917779, -1.02529, 1, 1, 1, 1, 1,
-0.6792161, -1.580316, -1.700421, 1, 1, 1, 1, 1,
-0.6790268, -1.429049, -1.758979, 1, 1, 1, 1, 1,
-0.6737121, 0.6273522, -2.225623, 1, 1, 1, 1, 1,
-0.6728383, 0.8505595, -1.436941, 1, 1, 1, 1, 1,
-0.6682258, 0.5045274, -1.526589, 1, 1, 1, 1, 1,
-0.6669747, 0.05074557, -2.814487, 1, 1, 1, 1, 1,
-0.6608974, 0.5434045, -0.6627479, 1, 1, 1, 1, 1,
-0.6596134, -1.456455, -2.868789, 1, 1, 1, 1, 1,
-0.6573818, -1.063375, -1.364178, 1, 1, 1, 1, 1,
-0.6569915, 0.05988683, -0.9231477, 1, 1, 1, 1, 1,
-0.655573, 0.9737219, -1.125091, 1, 1, 1, 1, 1,
-0.6473684, -0.9295622, -0.2800702, 0, 0, 1, 1, 1,
-0.6404889, 1.27439, 0.9128927, 1, 0, 0, 1, 1,
-0.6348539, 1.06662, 0.2779894, 1, 0, 0, 1, 1,
-0.6297683, -1.22856, -1.768841, 1, 0, 0, 1, 1,
-0.6268409, -0.2069567, -2.216779, 1, 0, 0, 1, 1,
-0.6216507, 0.13409, -1.446308, 1, 0, 0, 1, 1,
-0.6211495, 1.114518, -0.651897, 0, 0, 0, 1, 1,
-0.6189764, 0.9452194, -0.6454856, 0, 0, 0, 1, 1,
-0.6170206, 1.66416, 0.5335396, 0, 0, 0, 1, 1,
-0.6099359, -1.064818, -1.895247, 0, 0, 0, 1, 1,
-0.6074263, -0.8272689, -1.907917, 0, 0, 0, 1, 1,
-0.6052038, -0.1140012, -1.799993, 0, 0, 0, 1, 1,
-0.6018309, -0.6538887, -2.726301, 0, 0, 0, 1, 1,
-0.6008733, 2.096945, 0.8934478, 1, 1, 1, 1, 1,
-0.5981326, 0.8830028, 1.285718, 1, 1, 1, 1, 1,
-0.5961168, -2.67317, -2.855266, 1, 1, 1, 1, 1,
-0.5924023, 1.250063, -1.151686, 1, 1, 1, 1, 1,
-0.5899897, -1.272224, -3.782148, 1, 1, 1, 1, 1,
-0.5893257, 1.683481, 0.5571035, 1, 1, 1, 1, 1,
-0.5888632, 0.520874, -0.8082515, 1, 1, 1, 1, 1,
-0.5834841, 0.7826899, 0.8792739, 1, 1, 1, 1, 1,
-0.5827229, 0.5882008, -1.018145, 1, 1, 1, 1, 1,
-0.5821835, 0.4029381, -0.6356008, 1, 1, 1, 1, 1,
-0.5818169, 0.9832876, -0.6370843, 1, 1, 1, 1, 1,
-0.5791635, 0.6078703, 1.121971, 1, 1, 1, 1, 1,
-0.5767294, 0.2578078, -0.9359589, 1, 1, 1, 1, 1,
-0.5754003, -0.3982912, -1.8239, 1, 1, 1, 1, 1,
-0.575334, 1.279663, -0.9607871, 1, 1, 1, 1, 1,
-0.5688739, -0.6913654, -2.906718, 0, 0, 1, 1, 1,
-0.5667145, -0.342588, -3.050464, 1, 0, 0, 1, 1,
-0.5648419, -0.5206311, -2.05069, 1, 0, 0, 1, 1,
-0.5552426, -0.06732903, 1.0986, 1, 0, 0, 1, 1,
-0.5519884, -1.137851, -3.021079, 1, 0, 0, 1, 1,
-0.5480505, -0.4192912, -3.338721, 1, 0, 0, 1, 1,
-0.5441612, -1.702021, -2.994375, 0, 0, 0, 1, 1,
-0.542825, 0.5218223, -1.431009, 0, 0, 0, 1, 1,
-0.5416319, 0.8854602, -1.541669, 0, 0, 0, 1, 1,
-0.537083, -0.1615762, -1.78295, 0, 0, 0, 1, 1,
-0.5355392, -0.5229282, -3.219379, 0, 0, 0, 1, 1,
-0.5343502, 0.5633709, -0.3055241, 0, 0, 0, 1, 1,
-0.5341411, 0.6564214, -0.2115376, 0, 0, 0, 1, 1,
-0.533184, -0.07898359, -0.9530146, 1, 1, 1, 1, 1,
-0.5308101, 0.9958825, 0.04004523, 1, 1, 1, 1, 1,
-0.526499, -0.1622084, -1.347901, 1, 1, 1, 1, 1,
-0.5251021, -1.098874, -0.5168691, 1, 1, 1, 1, 1,
-0.5234935, 0.6689529, -0.2416308, 1, 1, 1, 1, 1,
-0.5174889, 0.4444849, -0.9834467, 1, 1, 1, 1, 1,
-0.5160744, 0.1843993, -1.482357, 1, 1, 1, 1, 1,
-0.5145307, 0.5812496, -2.517585, 1, 1, 1, 1, 1,
-0.5143639, 0.2094894, -1.700907, 1, 1, 1, 1, 1,
-0.5128101, 0.2760279, -1.417558, 1, 1, 1, 1, 1,
-0.511968, -0.6969183, -2.741213, 1, 1, 1, 1, 1,
-0.511669, 1.345176, -1.149247, 1, 1, 1, 1, 1,
-0.5094522, 0.4999472, -1.885269, 1, 1, 1, 1, 1,
-0.5072688, 0.4203145, -0.8334991, 1, 1, 1, 1, 1,
-0.503962, 1.679021, 0.02566967, 1, 1, 1, 1, 1,
-0.49812, 1.759858, 1.423535, 0, 0, 1, 1, 1,
-0.4935298, -0.2140035, -2.166081, 1, 0, 0, 1, 1,
-0.4861983, -0.9277065, -2.396897, 1, 0, 0, 1, 1,
-0.4845923, 0.3085635, -0.4055316, 1, 0, 0, 1, 1,
-0.4790761, -0.05274745, -2.68433, 1, 0, 0, 1, 1,
-0.4771767, -0.368631, -3.256235, 1, 0, 0, 1, 1,
-0.4769285, -1.095636, -1.846331, 0, 0, 0, 1, 1,
-0.4764835, 0.7679316, -1.326357, 0, 0, 0, 1, 1,
-0.4743676, 0.2803205, -1.991466, 0, 0, 0, 1, 1,
-0.4720569, 0.3457076, 0.9270071, 0, 0, 0, 1, 1,
-0.47086, -0.5734666, -2.333575, 0, 0, 0, 1, 1,
-0.4701258, 1.857498, -0.2937987, 0, 0, 0, 1, 1,
-0.4679624, -0.04742632, -0.8449933, 0, 0, 0, 1, 1,
-0.4678251, 0.3811477, -0.8681862, 1, 1, 1, 1, 1,
-0.4627683, 0.5269663, 0.1012384, 1, 1, 1, 1, 1,
-0.4625932, 0.0006359866, -1.375077, 1, 1, 1, 1, 1,
-0.4611922, -0.03554667, -2.651074, 1, 1, 1, 1, 1,
-0.4605469, 0.2391987, 1.059065, 1, 1, 1, 1, 1,
-0.4587425, -1.643639, -2.923783, 1, 1, 1, 1, 1,
-0.4568675, 0.7735937, -1.140229, 1, 1, 1, 1, 1,
-0.450927, -0.3678208, -3.766562, 1, 1, 1, 1, 1,
-0.4500184, 0.05606596, -1.687453, 1, 1, 1, 1, 1,
-0.4495631, 0.8280444, -0.1733442, 1, 1, 1, 1, 1,
-0.4463466, 2.400752, -0.4779918, 1, 1, 1, 1, 1,
-0.438069, 0.5219578, -0.3849103, 1, 1, 1, 1, 1,
-0.437302, 0.100459, -1.110671, 1, 1, 1, 1, 1,
-0.4350978, -0.7763991, -2.046995, 1, 1, 1, 1, 1,
-0.4338271, -0.88091, -0.8724481, 1, 1, 1, 1, 1,
-0.4299209, 0.2416853, -0.6117474, 0, 0, 1, 1, 1,
-0.42489, 0.1654371, -0.083433, 1, 0, 0, 1, 1,
-0.4235282, -1.311573, -3.082412, 1, 0, 0, 1, 1,
-0.4211107, 0.169314, 0.01401169, 1, 0, 0, 1, 1,
-0.4196883, 2.241466, -0.1898247, 1, 0, 0, 1, 1,
-0.418887, 0.2886788, 0.5489036, 1, 0, 0, 1, 1,
-0.4188055, 0.59444, 0.9588423, 0, 0, 0, 1, 1,
-0.4185044, -0.5545418, -2.26494, 0, 0, 0, 1, 1,
-0.4161448, 0.2908385, -0.07156853, 0, 0, 0, 1, 1,
-0.415251, 0.05516239, -0.2986169, 0, 0, 0, 1, 1,
-0.4145623, -0.163551, -0.7024544, 0, 0, 0, 1, 1,
-0.4068321, 0.7853264, -1.176387, 0, 0, 0, 1, 1,
-0.4052636, -1.265578, -1.798715, 0, 0, 0, 1, 1,
-0.3994046, -0.6426789, -0.7187033, 1, 1, 1, 1, 1,
-0.3986975, 0.3283082, -1.149457, 1, 1, 1, 1, 1,
-0.3962769, -0.7828334, -1.933611, 1, 1, 1, 1, 1,
-0.3923483, -0.6293117, -0.9860544, 1, 1, 1, 1, 1,
-0.389906, 1.86348, -0.5004628, 1, 1, 1, 1, 1,
-0.3832385, 1.948989, 0.1193182, 1, 1, 1, 1, 1,
-0.3809615, 1.59926, 0.1943111, 1, 1, 1, 1, 1,
-0.3808581, 1.170394, -0.198065, 1, 1, 1, 1, 1,
-0.3807448, 0.4136607, -1.389688, 1, 1, 1, 1, 1,
-0.3780168, -1.114318, -3.587528, 1, 1, 1, 1, 1,
-0.3666175, 1.577347, -0.3808035, 1, 1, 1, 1, 1,
-0.3664187, 0.1842674, -3.238332, 1, 1, 1, 1, 1,
-0.3642267, 0.01588148, -1.945344, 1, 1, 1, 1, 1,
-0.363939, 0.9210474, 0.6652482, 1, 1, 1, 1, 1,
-0.358171, 1.387235, -0.7311636, 1, 1, 1, 1, 1,
-0.3580188, 0.09343393, -1.168258, 0, 0, 1, 1, 1,
-0.3567722, 0.00782241, -1.659413, 1, 0, 0, 1, 1,
-0.3565118, -0.5899876, -3.869916, 1, 0, 0, 1, 1,
-0.3561558, -0.3231927, -2.247306, 1, 0, 0, 1, 1,
-0.3557022, -0.5767152, -3.540329, 1, 0, 0, 1, 1,
-0.3556765, 1.324394, 0.6287922, 1, 0, 0, 1, 1,
-0.3533056, -0.9052629, -2.417799, 0, 0, 0, 1, 1,
-0.3504788, -0.802093, -2.832053, 0, 0, 0, 1, 1,
-0.3470892, -0.5324122, -1.276051, 0, 0, 0, 1, 1,
-0.3448608, -0.03730623, -1.182875, 0, 0, 0, 1, 1,
-0.3413893, -0.6845084, -3.718224, 0, 0, 0, 1, 1,
-0.3357186, 1.479733, 0.4410277, 0, 0, 0, 1, 1,
-0.332113, -0.2855498, -1.582657, 0, 0, 0, 1, 1,
-0.3299161, 0.9741741, -0.8784105, 1, 1, 1, 1, 1,
-0.3273006, -0.05185322, -1.476911, 1, 1, 1, 1, 1,
-0.3233426, -0.06240306, -1.054842, 1, 1, 1, 1, 1,
-0.3178312, -0.07532035, -0.8009921, 1, 1, 1, 1, 1,
-0.3154573, 0.2448972, -1.47008, 1, 1, 1, 1, 1,
-0.3099724, 1.087063, 0.6117871, 1, 1, 1, 1, 1,
-0.3094444, 0.2122033, -2.099399, 1, 1, 1, 1, 1,
-0.3071896, -0.8264509, -1.348426, 1, 1, 1, 1, 1,
-0.3064922, 1.937732, 0.2950986, 1, 1, 1, 1, 1,
-0.306348, -0.4180165, -2.230374, 1, 1, 1, 1, 1,
-0.3060168, -1.662241, -0.3256666, 1, 1, 1, 1, 1,
-0.3031497, 0.7081484, -0.4193183, 1, 1, 1, 1, 1,
-0.3001549, -0.5395631, -2.662055, 1, 1, 1, 1, 1,
-0.2891643, -0.3359184, -1.484934, 1, 1, 1, 1, 1,
-0.2831517, 0.3030687, -1.030704, 1, 1, 1, 1, 1,
-0.282898, -1.161384, -1.800935, 0, 0, 1, 1, 1,
-0.2812336, 0.07395819, -1.057456, 1, 0, 0, 1, 1,
-0.2802162, 0.983343, -1.094222, 1, 0, 0, 1, 1,
-0.2786495, -0.6179876, -2.444946, 1, 0, 0, 1, 1,
-0.2785215, 0.1499881, -0.6620234, 1, 0, 0, 1, 1,
-0.2740758, 1.075185, 2.39181, 1, 0, 0, 1, 1,
-0.2738639, 0.2051715, -0.09270913, 0, 0, 0, 1, 1,
-0.2738522, -0.07219645, -1.679902, 0, 0, 0, 1, 1,
-0.2735769, -0.1316544, -2.91046, 0, 0, 0, 1, 1,
-0.267654, -1.316032, -2.544048, 0, 0, 0, 1, 1,
-0.266601, 0.5062473, -0.3305286, 0, 0, 0, 1, 1,
-0.2622609, 1.24504, -0.5232968, 0, 0, 0, 1, 1,
-0.2605942, 0.8413, -1.353579, 0, 0, 0, 1, 1,
-0.2459628, 0.1792085, 1.312335, 1, 1, 1, 1, 1,
-0.2453413, 0.7999396, 1.744982, 1, 1, 1, 1, 1,
-0.2356564, -0.6072764, -2.853765, 1, 1, 1, 1, 1,
-0.2347393, -1.171384, -2.830925, 1, 1, 1, 1, 1,
-0.2326722, -2.520818, -1.905205, 1, 1, 1, 1, 1,
-0.2310578, 0.02396839, -2.551963, 1, 1, 1, 1, 1,
-0.2293792, -1.120041, -4.555432, 1, 1, 1, 1, 1,
-0.2280529, 0.200899, -0.5246868, 1, 1, 1, 1, 1,
-0.2267272, 0.04750791, -1.314353, 1, 1, 1, 1, 1,
-0.2210522, -0.4727145, -4.409802, 1, 1, 1, 1, 1,
-0.2193876, 1.254669, 1.303646, 1, 1, 1, 1, 1,
-0.2162782, 1.081944, 1.086676, 1, 1, 1, 1, 1,
-0.2115138, 0.5416698, -1.603788, 1, 1, 1, 1, 1,
-0.2054243, -0.2593599, -1.966582, 1, 1, 1, 1, 1,
-0.2046966, 0.08556337, -1.128869, 1, 1, 1, 1, 1,
-0.2042052, 0.2038578, 0.8551683, 0, 0, 1, 1, 1,
-0.2032417, -0.7124853, -2.943875, 1, 0, 0, 1, 1,
-0.2020103, -0.5550855, -4.836484, 1, 0, 0, 1, 1,
-0.1966083, -0.1140352, -2.879383, 1, 0, 0, 1, 1,
-0.1963118, 1.828703, -0.001253465, 1, 0, 0, 1, 1,
-0.1898365, -1.85101, -2.702301, 1, 0, 0, 1, 1,
-0.1843378, -0.08943371, -1.220901, 0, 0, 0, 1, 1,
-0.1809816, 1.052206, -0.1973382, 0, 0, 0, 1, 1,
-0.1754588, -1.134101, -1.891524, 0, 0, 0, 1, 1,
-0.1727054, 0.7668812, -0.5985566, 0, 0, 0, 1, 1,
-0.168181, 1.423008, 0.5200019, 0, 0, 0, 1, 1,
-0.1608747, 1.178282, -0.2718874, 0, 0, 0, 1, 1,
-0.1608452, -0.405647, -2.172064, 0, 0, 0, 1, 1,
-0.1607234, 1.593063, 0.5676669, 1, 1, 1, 1, 1,
-0.1594782, -1.285136, -2.949367, 1, 1, 1, 1, 1,
-0.1573596, -1.004579, -2.829753, 1, 1, 1, 1, 1,
-0.1565848, -0.1768509, -2.035136, 1, 1, 1, 1, 1,
-0.1533337, -0.3748374, -0.8773753, 1, 1, 1, 1, 1,
-0.1519519, 1.062228, 0.365167, 1, 1, 1, 1, 1,
-0.1483653, 0.3313448, -0.7509027, 1, 1, 1, 1, 1,
-0.1468774, 0.2839705, 0.1554438, 1, 1, 1, 1, 1,
-0.1447958, 0.1202473, -1.334269, 1, 1, 1, 1, 1,
-0.142093, -0.1663516, -1.527994, 1, 1, 1, 1, 1,
-0.1395047, -2.870469, -3.973171, 1, 1, 1, 1, 1,
-0.1379002, 0.4538969, -0.8414409, 1, 1, 1, 1, 1,
-0.1360419, -0.1234707, -3.122155, 1, 1, 1, 1, 1,
-0.1345639, 1.544381, -0.7314154, 1, 1, 1, 1, 1,
-0.1315906, -0.8683699, -3.395303, 1, 1, 1, 1, 1,
-0.1315577, 2.37009, -0.6302469, 0, 0, 1, 1, 1,
-0.1283449, 0.278547, 0.4652296, 1, 0, 0, 1, 1,
-0.1281922, 0.1637377, 1.499279, 1, 0, 0, 1, 1,
-0.1239857, -0.9683444, -1.782838, 1, 0, 0, 1, 1,
-0.1131742, -0.1967622, -4.584685, 1, 0, 0, 1, 1,
-0.1060248, -2.039845, -3.661233, 1, 0, 0, 1, 1,
-0.1052744, -0.386904, -1.707043, 0, 0, 0, 1, 1,
-0.1035778, 1.359283, -0.4864177, 0, 0, 0, 1, 1,
-0.1006435, -0.6815564, -5.864219, 0, 0, 0, 1, 1,
-0.09908526, -1.767205, -2.868623, 0, 0, 0, 1, 1,
-0.09830833, 0.1701983, -0.4927926, 0, 0, 0, 1, 1,
-0.09269511, -0.9250672, -2.242083, 0, 0, 0, 1, 1,
-0.09214074, -0.3481833, -4.211822, 0, 0, 0, 1, 1,
-0.08772589, -0.3587397, -3.146952, 1, 1, 1, 1, 1,
-0.08722111, -0.8193857, -2.285524, 1, 1, 1, 1, 1,
-0.08399037, 0.5034834, 0.009230448, 1, 1, 1, 1, 1,
-0.08339435, 2.166718, 0.7325406, 1, 1, 1, 1, 1,
-0.08256925, -0.7067867, -2.833034, 1, 1, 1, 1, 1,
-0.08196809, -0.1012442, -3.371005, 1, 1, 1, 1, 1,
-0.0802581, -0.1240162, -0.8013864, 1, 1, 1, 1, 1,
-0.07850219, -0.1207383, -2.058048, 1, 1, 1, 1, 1,
-0.07686179, -1.030127, -2.472611, 1, 1, 1, 1, 1,
-0.07679159, 0.2825232, -0.6220289, 1, 1, 1, 1, 1,
-0.07555613, 0.4603148, 1.512642, 1, 1, 1, 1, 1,
-0.07555539, 0.4346594, 2.371027, 1, 1, 1, 1, 1,
-0.0748114, -0.06291062, -2.969539, 1, 1, 1, 1, 1,
-0.07450556, 0.3159036, -0.2777237, 1, 1, 1, 1, 1,
-0.07255957, 1.057192, -0.08595479, 1, 1, 1, 1, 1,
-0.07139435, -1.487726, -2.036209, 0, 0, 1, 1, 1,
-0.07087858, -0.5487337, -5.246793, 1, 0, 0, 1, 1,
-0.06944745, 1.431275, -0.7437116, 1, 0, 0, 1, 1,
-0.06835859, -0.8045903, -2.043109, 1, 0, 0, 1, 1,
-0.06302804, -0.1277024, -2.673697, 1, 0, 0, 1, 1,
-0.06113987, -0.7939526, -3.627019, 1, 0, 0, 1, 1,
-0.06023761, 0.8242447, 0.146103, 0, 0, 0, 1, 1,
-0.05393777, -0.1875251, -4.278119, 0, 0, 0, 1, 1,
-0.05324955, -1.641828, -3.496947, 0, 0, 0, 1, 1,
-0.05284756, -0.2348561, -1.818409, 0, 0, 0, 1, 1,
-0.0526225, 0.4907779, -1.461861, 0, 0, 0, 1, 1,
-0.052078, 1.090789, 1.306803, 0, 0, 0, 1, 1,
-0.05080719, 0.5224515, 1.078423, 0, 0, 0, 1, 1,
-0.04305712, 1.308435, 2.019917, 1, 1, 1, 1, 1,
-0.03885432, -0.2193291, -4.585093, 1, 1, 1, 1, 1,
-0.0371346, 1.124548, -0.6092975, 1, 1, 1, 1, 1,
-0.03204263, 1.184361, 1.098583, 1, 1, 1, 1, 1,
-0.02888856, -0.6175963, -3.481276, 1, 1, 1, 1, 1,
-0.02148541, 0.1437416, 0.7044918, 1, 1, 1, 1, 1,
-0.02039147, -0.338444, -2.359142, 1, 1, 1, 1, 1,
-0.01543247, -0.07297351, -4.093564, 1, 1, 1, 1, 1,
-0.012699, 0.4570909, -0.6683005, 1, 1, 1, 1, 1,
-0.01162765, 0.6017779, -0.2324231, 1, 1, 1, 1, 1,
-0.009289727, 0.1560354, -1.17104, 1, 1, 1, 1, 1,
-0.005374224, -1.028483, -2.946048, 1, 1, 1, 1, 1,
-0.004282864, 0.8461068, 0.7736497, 1, 1, 1, 1, 1,
0.001313016, 0.4422557, -0.3258166, 1, 1, 1, 1, 1,
0.009040966, -0.5542067, 2.371273, 1, 1, 1, 1, 1,
0.01313588, 0.02547007, 2.045063, 0, 0, 1, 1, 1,
0.01511556, -1.209289, 2.033016, 1, 0, 0, 1, 1,
0.01556847, -0.6963786, 3.626142, 1, 0, 0, 1, 1,
0.0158643, 0.5826004, -0.9238161, 1, 0, 0, 1, 1,
0.01655859, -0.8078274, 2.608458, 1, 0, 0, 1, 1,
0.01729075, -1.006661, 3.443322, 1, 0, 0, 1, 1,
0.01732931, 0.5863085, -0.8306993, 0, 0, 0, 1, 1,
0.02243261, 0.1567584, -0.4242285, 0, 0, 0, 1, 1,
0.02410462, 0.5365331, -0.06840962, 0, 0, 0, 1, 1,
0.02477575, 0.5469952, -1.355878, 0, 0, 0, 1, 1,
0.02586707, -0.7361614, 3.435168, 0, 0, 0, 1, 1,
0.02922149, -0.9718359, 5.161991, 0, 0, 0, 1, 1,
0.03210473, 0.5682665, -1.597416, 0, 0, 0, 1, 1,
0.0378991, -1.053517, 3.608834, 1, 1, 1, 1, 1,
0.04378575, 1.47787, 0.0613331, 1, 1, 1, 1, 1,
0.04467642, 1.541527, 0.07792655, 1, 1, 1, 1, 1,
0.04692498, -1.44921, 3.463448, 1, 1, 1, 1, 1,
0.05817398, -0.5277954, 3.584024, 1, 1, 1, 1, 1,
0.06318143, 1.750971, 0.8097816, 1, 1, 1, 1, 1,
0.06699282, 0.2803217, 2.301469, 1, 1, 1, 1, 1,
0.06727526, 0.1921885, 0.6697648, 1, 1, 1, 1, 1,
0.06796934, -1.359666, 2.904428, 1, 1, 1, 1, 1,
0.06960057, 1.987701, -0.3829133, 1, 1, 1, 1, 1,
0.07581329, -1.231167, 3.752324, 1, 1, 1, 1, 1,
0.07617504, -1.601771, 3.296973, 1, 1, 1, 1, 1,
0.07997038, -0.6586459, 3.388095, 1, 1, 1, 1, 1,
0.08181661, 1.375964, 2.159495, 1, 1, 1, 1, 1,
0.08260931, 1.730374, -1.122672, 1, 1, 1, 1, 1,
0.08521365, 0.1141731, -0.4297078, 0, 0, 1, 1, 1,
0.08861525, -1.542364, 3.95573, 1, 0, 0, 1, 1,
0.08944958, 0.4595982, 0.8221444, 1, 0, 0, 1, 1,
0.08948074, -0.2035303, 2.167526, 1, 0, 0, 1, 1,
0.09113903, -0.3035895, 0.9993715, 1, 0, 0, 1, 1,
0.09116698, -0.3581919, 1.580819, 1, 0, 0, 1, 1,
0.0914012, 1.163188, 1.014074, 0, 0, 0, 1, 1,
0.09206105, 0.1261835, 0.8972288, 0, 0, 0, 1, 1,
0.1001222, 1.573315, 1.334615, 0, 0, 0, 1, 1,
0.1011035, 0.915038, -1.319787, 0, 0, 0, 1, 1,
0.1015251, -2.136916, 2.354903, 0, 0, 0, 1, 1,
0.1018299, 0.3094772, 0.2803562, 0, 0, 0, 1, 1,
0.1023732, -1.189912, 1.94648, 0, 0, 0, 1, 1,
0.1041544, 0.2209395, 1.349767, 1, 1, 1, 1, 1,
0.1046965, -1.207987, 3.725683, 1, 1, 1, 1, 1,
0.1051598, -0.4566423, 3.454885, 1, 1, 1, 1, 1,
0.1109177, 0.07774606, 0.7543678, 1, 1, 1, 1, 1,
0.1129694, 0.6293083, -0.7269847, 1, 1, 1, 1, 1,
0.1157926, -0.6234692, 3.380168, 1, 1, 1, 1, 1,
0.1161811, 0.3931712, 0.5027493, 1, 1, 1, 1, 1,
0.1182684, 0.3304188, -0.4773341, 1, 1, 1, 1, 1,
0.1189296, -0.4202633, 3.172608, 1, 1, 1, 1, 1,
0.1203807, 0.2111572, -0.7542396, 1, 1, 1, 1, 1,
0.121616, -0.06331775, 2.411947, 1, 1, 1, 1, 1,
0.1219849, -0.5933781, 3.969488, 1, 1, 1, 1, 1,
0.1242248, -0.6256256, 3.08938, 1, 1, 1, 1, 1,
0.1253767, -0.5780394, 3.327212, 1, 1, 1, 1, 1,
0.1325003, -0.07520039, 2.404491, 1, 1, 1, 1, 1,
0.1345692, -0.2878004, 1.701149, 0, 0, 1, 1, 1,
0.1389093, 0.2604748, -0.1366219, 1, 0, 0, 1, 1,
0.1425645, 0.3273958, 0.5908144, 1, 0, 0, 1, 1,
0.143378, -0.05518967, 1.615428, 1, 0, 0, 1, 1,
0.1434961, -0.5209007, 3.075295, 1, 0, 0, 1, 1,
0.1477069, -1.127792, 2.669585, 1, 0, 0, 1, 1,
0.1491058, 0.2403161, -0.4304124, 0, 0, 0, 1, 1,
0.1502393, -0.5342317, 0.7300419, 0, 0, 0, 1, 1,
0.1515425, -2.344502, 3.979584, 0, 0, 0, 1, 1,
0.1525075, 1.529704, 0.1339214, 0, 0, 0, 1, 1,
0.1547491, 0.07627645, -0.5894253, 0, 0, 0, 1, 1,
0.1605428, 1.169661, -1.875291, 0, 0, 0, 1, 1,
0.161831, -0.6556357, 1.462535, 0, 0, 0, 1, 1,
0.1641397, -0.7179929, 3.653316, 1, 1, 1, 1, 1,
0.1643525, 0.06062627, 1.816485, 1, 1, 1, 1, 1,
0.1647735, 0.7471502, 0.08481113, 1, 1, 1, 1, 1,
0.1665628, -0.886551, 2.401114, 1, 1, 1, 1, 1,
0.1699482, 1.490954, -2.151289, 1, 1, 1, 1, 1,
0.1807455, 0.5935717, 1.769914, 1, 1, 1, 1, 1,
0.1824119, -0.5124828, 3.284304, 1, 1, 1, 1, 1,
0.1824919, 1.266302, 0.9834673, 1, 1, 1, 1, 1,
0.1849177, -0.5697358, 2.273368, 1, 1, 1, 1, 1,
0.184955, -0.06524308, 2.504603, 1, 1, 1, 1, 1,
0.1891845, 2.001883, -0.8459083, 1, 1, 1, 1, 1,
0.1928148, 1.783733, 2.367647, 1, 1, 1, 1, 1,
0.193153, -0.4658216, 2.348049, 1, 1, 1, 1, 1,
0.1952344, 1.544618, -0.00244312, 1, 1, 1, 1, 1,
0.1997683, -0.4151692, 2.566995, 1, 1, 1, 1, 1,
0.2002026, 0.07681235, 0.4811317, 0, 0, 1, 1, 1,
0.2034861, 0.5574911, -1.408305, 1, 0, 0, 1, 1,
0.2039871, -0.2078649, 1.560779, 1, 0, 0, 1, 1,
0.2046987, 1.19911, -0.1516844, 1, 0, 0, 1, 1,
0.2050681, 2.173805, -0.4288767, 1, 0, 0, 1, 1,
0.2055607, -0.1102185, 1.707982, 1, 0, 0, 1, 1,
0.2061403, 0.8198045, 0.3035958, 0, 0, 0, 1, 1,
0.2100142, -0.2965193, 2.179792, 0, 0, 0, 1, 1,
0.2147732, -0.9495825, 4.89353, 0, 0, 0, 1, 1,
0.216282, 0.1986462, 1.102059, 0, 0, 0, 1, 1,
0.217287, 1.05747, -0.6535018, 0, 0, 0, 1, 1,
0.2174318, 0.3858817, 0.7821061, 0, 0, 0, 1, 1,
0.2220452, 1.010752, 0.3156649, 0, 0, 0, 1, 1,
0.2241425, 0.1454643, 2.718879, 1, 1, 1, 1, 1,
0.2275501, -0.4832644, 1.5024, 1, 1, 1, 1, 1,
0.2303876, -0.2011708, 0.9122785, 1, 1, 1, 1, 1,
0.2352359, 0.637126, 0.3798522, 1, 1, 1, 1, 1,
0.2367371, -0.8043097, 2.743288, 1, 1, 1, 1, 1,
0.2415759, -0.5689665, 2.403898, 1, 1, 1, 1, 1,
0.2448747, -0.1252978, 1.146546, 1, 1, 1, 1, 1,
0.2507508, -0.2186986, 3.328807, 1, 1, 1, 1, 1,
0.2605455, -1.780184, 2.562521, 1, 1, 1, 1, 1,
0.2636097, -0.7911401, 2.532671, 1, 1, 1, 1, 1,
0.2660121, -1.044702, 2.226181, 1, 1, 1, 1, 1,
0.2681268, 0.1287593, 1.588466, 1, 1, 1, 1, 1,
0.2711654, 1.213014, 1.136313, 1, 1, 1, 1, 1,
0.275798, 1.676296, -0.7842772, 1, 1, 1, 1, 1,
0.27748, 0.3413069, 3.068952, 1, 1, 1, 1, 1,
0.2802566, 0.7531896, -0.5538258, 0, 0, 1, 1, 1,
0.2858376, 0.3585202, 1.375554, 1, 0, 0, 1, 1,
0.294164, -0.5966657, 1.613982, 1, 0, 0, 1, 1,
0.294704, -0.2448158, 2.499261, 1, 0, 0, 1, 1,
0.2950114, -0.2284983, 2.985034, 1, 0, 0, 1, 1,
0.3011751, 0.9124593, 0.2877446, 1, 0, 0, 1, 1,
0.3040833, 0.408655, 1.679241, 0, 0, 0, 1, 1,
0.3090519, 1.035284, -0.670562, 0, 0, 0, 1, 1,
0.3162955, 1.683392, -0.4922887, 0, 0, 0, 1, 1,
0.3166662, 0.03706999, 0.7747402, 0, 0, 0, 1, 1,
0.3219923, -1.52917, 1.874835, 0, 0, 0, 1, 1,
0.3232181, -0.6396888, 1.169809, 0, 0, 0, 1, 1,
0.3245914, -1.626743, 2.227355, 0, 0, 0, 1, 1,
0.3262169, 1.333996, 0.1193001, 1, 1, 1, 1, 1,
0.3268219, 0.8990995, 1.075369, 1, 1, 1, 1, 1,
0.3341705, 0.8096247, 0.7940139, 1, 1, 1, 1, 1,
0.3356247, 0.1131033, 0.4205179, 1, 1, 1, 1, 1,
0.346039, -0.8678564, 3.138563, 1, 1, 1, 1, 1,
0.3473526, 0.6776106, 1.726044, 1, 1, 1, 1, 1,
0.3479229, 0.4501468, -0.8961624, 1, 1, 1, 1, 1,
0.3511874, 0.2340738, -0.8645015, 1, 1, 1, 1, 1,
0.3527771, -0.1627304, 1.338643, 1, 1, 1, 1, 1,
0.352991, -1.761363, 3.458694, 1, 1, 1, 1, 1,
0.3541692, 0.9808588, 0.09743708, 1, 1, 1, 1, 1,
0.3577844, 0.2098053, -0.9995167, 1, 1, 1, 1, 1,
0.3579013, 0.9846169, -1.340397, 1, 1, 1, 1, 1,
0.361499, -0.5462009, 3.257638, 1, 1, 1, 1, 1,
0.3670353, -0.7290903, 1.29641, 1, 1, 1, 1, 1,
0.3741581, -0.9382969, 2.341238, 0, 0, 1, 1, 1,
0.3890865, -0.3639973, 1.670609, 1, 0, 0, 1, 1,
0.392145, -1.038872, 0.9155631, 1, 0, 0, 1, 1,
0.3953061, -1.885877, 1.50074, 1, 0, 0, 1, 1,
0.4002127, -2.171974, 2.622785, 1, 0, 0, 1, 1,
0.4034765, 0.506566, -0.1109049, 1, 0, 0, 1, 1,
0.4035421, 0.1624218, 2.504577, 0, 0, 0, 1, 1,
0.4059419, 0.9554755, -0.0520123, 0, 0, 0, 1, 1,
0.4123965, -1.116252, 4.715276, 0, 0, 0, 1, 1,
0.4145078, -0.9312006, 4.161535, 0, 0, 0, 1, 1,
0.4170036, 0.9016599, -0.1961222, 0, 0, 0, 1, 1,
0.4171057, -0.8247381, 2.521527, 0, 0, 0, 1, 1,
0.4182577, -0.5445597, 3.106123, 0, 0, 0, 1, 1,
0.4260222, 0.7914493, -0.1260164, 1, 1, 1, 1, 1,
0.4308649, -0.7956674, 0.9429005, 1, 1, 1, 1, 1,
0.4356201, -0.05051205, 1.300074, 1, 1, 1, 1, 1,
0.4360629, 1.721135, -1.395217, 1, 1, 1, 1, 1,
0.43674, 1.279377, 0.9584485, 1, 1, 1, 1, 1,
0.4389647, 0.7498094, 1.255372, 1, 1, 1, 1, 1,
0.4443227, 0.5510886, 2.385548, 1, 1, 1, 1, 1,
0.4469537, -0.03402054, 2.076044, 1, 1, 1, 1, 1,
0.4470327, 0.3862124, 1.437538, 1, 1, 1, 1, 1,
0.4474356, 0.505596, -0.9077399, 1, 1, 1, 1, 1,
0.4499331, -1.337871, 2.227704, 1, 1, 1, 1, 1,
0.4529669, 0.2048845, -0.9443492, 1, 1, 1, 1, 1,
0.462683, -0.2672106, 3.036279, 1, 1, 1, 1, 1,
0.4659841, 0.3795806, 3.036975, 1, 1, 1, 1, 1,
0.4687111, 0.1193683, 2.83673, 1, 1, 1, 1, 1,
0.4693637, 0.6236665, 0.7935637, 0, 0, 1, 1, 1,
0.4737023, -0.3995787, 2.088565, 1, 0, 0, 1, 1,
0.4745239, 1.196482, -0.8932782, 1, 0, 0, 1, 1,
0.4773606, 0.9306569, -0.2999715, 1, 0, 0, 1, 1,
0.4774801, 1.69507, 0.6480445, 1, 0, 0, 1, 1,
0.477553, 1.50875, 0.7664292, 1, 0, 0, 1, 1,
0.4787434, -1.611786, 1.846672, 0, 0, 0, 1, 1,
0.4805624, -0.2492936, 1.874597, 0, 0, 0, 1, 1,
0.4833108, 0.463809, 1.09788, 0, 0, 0, 1, 1,
0.4864265, 0.993916, 2.553372, 0, 0, 0, 1, 1,
0.4872918, -0.6786997, 2.097912, 0, 0, 0, 1, 1,
0.4880297, -0.2744787, 2.380108, 0, 0, 0, 1, 1,
0.4889299, 1.645124, -0.1768512, 0, 0, 0, 1, 1,
0.4952289, 0.249804, 3.072818, 1, 1, 1, 1, 1,
0.495248, -0.7754639, 1.274567, 1, 1, 1, 1, 1,
0.497103, 2.527035, 0.6247683, 1, 1, 1, 1, 1,
0.4985079, -0.2247392, 0.3345626, 1, 1, 1, 1, 1,
0.4992868, 1.086562, 1.183144, 1, 1, 1, 1, 1,
0.5007823, 0.6901657, 1.218765, 1, 1, 1, 1, 1,
0.5072908, 0.1095277, 0.04890189, 1, 1, 1, 1, 1,
0.5077506, -0.5290927, 2.874811, 1, 1, 1, 1, 1,
0.5122756, -0.6588041, 3.183743, 1, 1, 1, 1, 1,
0.513282, -0.750756, 4.374134, 1, 1, 1, 1, 1,
0.5173397, 0.2364755, 1.292439, 1, 1, 1, 1, 1,
0.5191253, 0.9469898, 1.065434, 1, 1, 1, 1, 1,
0.5241874, -0.7951178, 3.821348, 1, 1, 1, 1, 1,
0.5266069, 0.4113019, 0.3896125, 1, 1, 1, 1, 1,
0.5330413, -1.884155, 2.794194, 1, 1, 1, 1, 1,
0.5338604, -1.623156, 3.781757, 0, 0, 1, 1, 1,
0.5362939, 1.971769, 1.735091, 1, 0, 0, 1, 1,
0.538774, 0.5074542, 1.924076, 1, 0, 0, 1, 1,
0.5435901, 0.2624762, 0.513695, 1, 0, 0, 1, 1,
0.5460817, 0.3180415, 2.245579, 1, 0, 0, 1, 1,
0.5530857, 0.427593, 1.072468, 1, 0, 0, 1, 1,
0.5563215, -0.7605004, 3.150199, 0, 0, 0, 1, 1,
0.5598888, 1.695779, 0.4023982, 0, 0, 0, 1, 1,
0.5607662, -0.7513788, 2.59914, 0, 0, 0, 1, 1,
0.5630206, -0.6897522, 1.858848, 0, 0, 0, 1, 1,
0.5633734, 0.05953041, 1.690936, 0, 0, 0, 1, 1,
0.5651309, 0.9366204, 0.640954, 0, 0, 0, 1, 1,
0.5696775, -0.4812773, 1.883576, 0, 0, 0, 1, 1,
0.569793, 0.005227932, 2.031093, 1, 1, 1, 1, 1,
0.5718102, -0.02763161, 1.765527, 1, 1, 1, 1, 1,
0.5723621, -1.080368, 3.948294, 1, 1, 1, 1, 1,
0.577552, -0.610789, 1.981399, 1, 1, 1, 1, 1,
0.5783912, 2.16344, -0.2036231, 1, 1, 1, 1, 1,
0.5785551, -1.963179, 3.456808, 1, 1, 1, 1, 1,
0.5896918, 0.09957371, 2.449905, 1, 1, 1, 1, 1,
0.5898134, -0.868921, 1.611966, 1, 1, 1, 1, 1,
0.5914488, 0.9332221, 1.445198, 1, 1, 1, 1, 1,
0.5962288, -1.829544, 3.845387, 1, 1, 1, 1, 1,
0.6041418, -0.4354513, 1.752511, 1, 1, 1, 1, 1,
0.60509, -1.434696, 1.375322, 1, 1, 1, 1, 1,
0.6065361, -1.126498, 3.998995, 1, 1, 1, 1, 1,
0.6083508, -0.4403161, 2.503188, 1, 1, 1, 1, 1,
0.6092627, 1.191262, -0.69687, 1, 1, 1, 1, 1,
0.6108722, -0.5761127, 2.183096, 0, 0, 1, 1, 1,
0.6117736, 0.06689846, 2.378674, 1, 0, 0, 1, 1,
0.6126898, 0.1950731, 2.100765, 1, 0, 0, 1, 1,
0.6148527, -0.7095018, 1.703125, 1, 0, 0, 1, 1,
0.6185977, 0.8203788, -0.02984985, 1, 0, 0, 1, 1,
0.6193928, 1.071107, 0.1862143, 1, 0, 0, 1, 1,
0.6246906, 0.7026445, -0.2469836, 0, 0, 0, 1, 1,
0.6261274, -0.918295, 0.8888851, 0, 0, 0, 1, 1,
0.6299569, -1.188512, 2.319806, 0, 0, 0, 1, 1,
0.6362892, 1.324273, -0.1771345, 0, 0, 0, 1, 1,
0.6367777, 1.677151, -0.1017242, 0, 0, 0, 1, 1,
0.6388517, -2.156404, 4.055704, 0, 0, 0, 1, 1,
0.639789, 0.140442, 1.960672, 0, 0, 0, 1, 1,
0.6462151, 1.459182, 2.043025, 1, 1, 1, 1, 1,
0.6474208, -0.2421838, 1.29695, 1, 1, 1, 1, 1,
0.6479234, -0.7145536, 3.527801, 1, 1, 1, 1, 1,
0.6607562, 0.5091473, 1.259845, 1, 1, 1, 1, 1,
0.6673015, -0.308439, -0.3087247, 1, 1, 1, 1, 1,
0.6693764, 0.08787121, -0.06588338, 1, 1, 1, 1, 1,
0.670535, -0.8576538, 2.842451, 1, 1, 1, 1, 1,
0.6744471, -1.749171, 4.178015, 1, 1, 1, 1, 1,
0.6794896, -0.3105259, 1.957677, 1, 1, 1, 1, 1,
0.6828647, 0.6072865, -1.811114, 1, 1, 1, 1, 1,
0.6834441, -0.5193747, -0.07070234, 1, 1, 1, 1, 1,
0.6843258, 0.9456496, 0.5261888, 1, 1, 1, 1, 1,
0.6951387, 0.4189703, -0.1152239, 1, 1, 1, 1, 1,
0.7038596, -0.7600486, 2.614239, 1, 1, 1, 1, 1,
0.7119184, -0.280093, 1.176268, 1, 1, 1, 1, 1,
0.718177, -0.2753724, 3.990704, 0, 0, 1, 1, 1,
0.7183149, -0.07474679, 0.6550745, 1, 0, 0, 1, 1,
0.7243284, 2.307563, -0.5203325, 1, 0, 0, 1, 1,
0.7355416, -2.214256, 2.495193, 1, 0, 0, 1, 1,
0.7436624, 0.1442939, -0.1569689, 1, 0, 0, 1, 1,
0.7478783, -0.2766109, 0.9638426, 1, 0, 0, 1, 1,
0.7495524, 0.5939575, 1.452349, 0, 0, 0, 1, 1,
0.7518971, 0.3109314, 1.941661, 0, 0, 0, 1, 1,
0.7533962, 0.8987487, 1.367743, 0, 0, 0, 1, 1,
0.7578174, -2.051415, 4.957249, 0, 0, 0, 1, 1,
0.761648, -0.7946541, 2.910574, 0, 0, 0, 1, 1,
0.7750356, 2.297351, 0.7019438, 0, 0, 0, 1, 1,
0.7755463, -1.001978, 2.286248, 0, 0, 0, 1, 1,
0.7765975, 0.5380843, 1.535015, 1, 1, 1, 1, 1,
0.7800047, -0.1517141, 1.272415, 1, 1, 1, 1, 1,
0.7842605, -0.8024932, 2.099304, 1, 1, 1, 1, 1,
0.7914412, 0.8950968, 1.112789, 1, 1, 1, 1, 1,
0.7964826, 0.3491349, 0.6209137, 1, 1, 1, 1, 1,
0.800157, 0.3863935, 3.968223, 1, 1, 1, 1, 1,
0.8021625, -0.2110126, 3.225266, 1, 1, 1, 1, 1,
0.8029748, -2.090735, 1.801841, 1, 1, 1, 1, 1,
0.8083041, 2.295223, 0.03567042, 1, 1, 1, 1, 1,
0.813194, -0.7383957, 2.011006, 1, 1, 1, 1, 1,
0.8167816, -1.019534, 1.801258, 1, 1, 1, 1, 1,
0.8178952, 0.2477643, 0.5628493, 1, 1, 1, 1, 1,
0.8275325, -0.3696328, 2.994047, 1, 1, 1, 1, 1,
0.8275531, 0.768869, 1.436875, 1, 1, 1, 1, 1,
0.8298545, 0.1894107, 2.726958, 1, 1, 1, 1, 1,
0.8334766, 0.7872723, -0.5708559, 0, 0, 1, 1, 1,
0.8472672, 1.345647, -0.6047554, 1, 0, 0, 1, 1,
0.8536606, -0.3254963, 2.249704, 1, 0, 0, 1, 1,
0.8551832, -0.7339035, 1.941005, 1, 0, 0, 1, 1,
0.8567429, 1.648999, 0.8612437, 1, 0, 0, 1, 1,
0.8590476, -0.09646408, 1.052093, 1, 0, 0, 1, 1,
0.8593457, 1.815935, 0.6794538, 0, 0, 0, 1, 1,
0.8657984, 1.083468, 1.480026, 0, 0, 0, 1, 1,
0.8666285, 1.441123, 2.078472, 0, 0, 0, 1, 1,
0.8731683, -0.03174157, 0.5650436, 0, 0, 0, 1, 1,
0.8746747, 0.4507495, 0.5376975, 0, 0, 0, 1, 1,
0.8772855, 0.6760415, 0.8924092, 0, 0, 0, 1, 1,
0.8802794, 1.318949, 0.5117114, 0, 0, 0, 1, 1,
0.8835573, 0.9400567, 1.774987, 1, 1, 1, 1, 1,
0.8911333, -0.1256771, 2.879234, 1, 1, 1, 1, 1,
0.8969473, 0.06239937, 1.633919, 1, 1, 1, 1, 1,
0.8972353, 0.00909719, 1.760487, 1, 1, 1, 1, 1,
0.8976818, -0.4132139, 2.900568, 1, 1, 1, 1, 1,
0.9028333, -0.9900746, 2.548727, 1, 1, 1, 1, 1,
0.9030271, 2.014523, -0.4664952, 1, 1, 1, 1, 1,
0.9122274, -0.3925016, 2.56941, 1, 1, 1, 1, 1,
0.9148012, 0.01586839, 2.566355, 1, 1, 1, 1, 1,
0.921504, -0.5976024, 3.724159, 1, 1, 1, 1, 1,
0.9219671, 0.8802879, 1.019658, 1, 1, 1, 1, 1,
0.9285418, 1.140132, -0.318736, 1, 1, 1, 1, 1,
0.9301395, 0.766906, 0.5122122, 1, 1, 1, 1, 1,
0.9361527, -0.6187803, 0.7242346, 1, 1, 1, 1, 1,
0.9420102, -1.321123, 3.804034, 1, 1, 1, 1, 1,
0.9484758, 0.1133676, 2.577289, 0, 0, 1, 1, 1,
0.9489866, 0.1329601, 2.593104, 1, 0, 0, 1, 1,
0.9524885, 2.0563, 1.468334, 1, 0, 0, 1, 1,
0.9541401, -0.3350489, 1.563773, 1, 0, 0, 1, 1,
0.9557059, 0.591403, 2.666958, 1, 0, 0, 1, 1,
0.9564077, -1.093058, 4.776608, 1, 0, 0, 1, 1,
0.9576399, 2.704519, -2.40981, 0, 0, 0, 1, 1,
0.9618415, -0.9092426, 1.826188, 0, 0, 0, 1, 1,
0.961958, 0.3347219, 1.458541, 0, 0, 0, 1, 1,
0.9620433, -0.06978773, 1.736538, 0, 0, 0, 1, 1,
0.964174, 1.332391, 2.154451, 0, 0, 0, 1, 1,
0.964179, 0.4077296, 1.943383, 0, 0, 0, 1, 1,
0.9643956, -0.3449105, 1.198357, 0, 0, 0, 1, 1,
0.9729179, -0.3017954, 2.813202, 1, 1, 1, 1, 1,
0.9759716, 0.344967, 3.116035, 1, 1, 1, 1, 1,
0.9823253, -0.9688962, 1.043772, 1, 1, 1, 1, 1,
0.9835986, -1.107083, 2.146103, 1, 1, 1, 1, 1,
0.9836032, -0.5350916, 2.524888, 1, 1, 1, 1, 1,
0.984834, -1.090639, 2.914606, 1, 1, 1, 1, 1,
1.000544, -0.1566034, 0.4616666, 1, 1, 1, 1, 1,
1.015716, 0.6491327, -1.042234, 1, 1, 1, 1, 1,
1.020722, -0.7054347, 3.187766, 1, 1, 1, 1, 1,
1.022326, -0.7269044, 1.612992, 1, 1, 1, 1, 1,
1.030557, 0.3495351, 2.655295, 1, 1, 1, 1, 1,
1.035642, 1.351784, 1.180407, 1, 1, 1, 1, 1,
1.036803, 1.156788, 0.8726116, 1, 1, 1, 1, 1,
1.040145, -1.431968, 3.339784, 1, 1, 1, 1, 1,
1.041009, 0.2837603, 2.501726, 1, 1, 1, 1, 1,
1.043099, -1.496357, 2.252706, 0, 0, 1, 1, 1,
1.050577, -1.06535, 2.771687, 1, 0, 0, 1, 1,
1.054526, -0.04496527, 2.514884, 1, 0, 0, 1, 1,
1.05585, 1.234002, 0.8280063, 1, 0, 0, 1, 1,
1.058212, 0.244922, 2.887523, 1, 0, 0, 1, 1,
1.060893, 0.6060294, 0.4872195, 1, 0, 0, 1, 1,
1.068154, -0.2718519, 1.125023, 0, 0, 0, 1, 1,
1.068631, 0.3283562, 1.38463, 0, 0, 0, 1, 1,
1.072774, 0.7253307, 2.120198, 0, 0, 0, 1, 1,
1.072863, -0.1259013, 1.094094, 0, 0, 0, 1, 1,
1.073625, -1.170605, 3.006555, 0, 0, 0, 1, 1,
1.076123, -0.8945606, 3.544248, 0, 0, 0, 1, 1,
1.082776, -0.1186154, 1.512322, 0, 0, 0, 1, 1,
1.082978, 3.313775, 1.476331, 1, 1, 1, 1, 1,
1.087575, -0.3296784, 2.250539, 1, 1, 1, 1, 1,
1.096212, -1.287469, 3.487296, 1, 1, 1, 1, 1,
1.099281, -0.2819979, 2.563877, 1, 1, 1, 1, 1,
1.10937, 1.810944, 0.298729, 1, 1, 1, 1, 1,
1.112434, 0.04222731, 2.00993, 1, 1, 1, 1, 1,
1.118366, 0.9834166, -0.2114624, 1, 1, 1, 1, 1,
1.124172, 1.578117, 2.930089, 1, 1, 1, 1, 1,
1.125761, 0.8130007, 1.813012, 1, 1, 1, 1, 1,
1.132216, -1.30667, 2.101879, 1, 1, 1, 1, 1,
1.132454, 0.01187107, 2.375672, 1, 1, 1, 1, 1,
1.133776, 0.3029862, 2.069016, 1, 1, 1, 1, 1,
1.134534, 0.1525708, 1.523299, 1, 1, 1, 1, 1,
1.140056, 0.2512153, 1.787433, 1, 1, 1, 1, 1,
1.148417, -0.2735376, 1.337414, 1, 1, 1, 1, 1,
1.14915, -0.7016338, 2.087457, 0, 0, 1, 1, 1,
1.150265, 0.3473575, 2.644589, 1, 0, 0, 1, 1,
1.155433, -2.518075, 1.940628, 1, 0, 0, 1, 1,
1.16797, -0.08246817, 1.990174, 1, 0, 0, 1, 1,
1.173452, -0.7122593, 1.257896, 1, 0, 0, 1, 1,
1.175464, -0.4887531, 1.763604, 1, 0, 0, 1, 1,
1.180013, -0.7053005, 2.132996, 0, 0, 0, 1, 1,
1.184148, 0.3266396, 2.1832, 0, 0, 0, 1, 1,
1.18525, 0.219657, 1.115002, 0, 0, 0, 1, 1,
1.186763, -1.458264, 2.788999, 0, 0, 0, 1, 1,
1.192447, -2.636766, 2.707611, 0, 0, 0, 1, 1,
1.201782, -0.001583126, 1.004174, 0, 0, 0, 1, 1,
1.20304, 0.07551945, 0.7930224, 0, 0, 0, 1, 1,
1.204994, -1.283008, 1.934408, 1, 1, 1, 1, 1,
1.206253, -0.8636779, 1.96674, 1, 1, 1, 1, 1,
1.213029, -2.43586, 2.659695, 1, 1, 1, 1, 1,
1.220249, -0.7232166, 2.5902, 1, 1, 1, 1, 1,
1.22025, -1.43879, 3.876985, 1, 1, 1, 1, 1,
1.220525, 0.3139542, 1.522668, 1, 1, 1, 1, 1,
1.236271, 0.8679323, 0.2384796, 1, 1, 1, 1, 1,
1.23891, -0.8446651, 3.76245, 1, 1, 1, 1, 1,
1.247763, -1.024609, 0.7894166, 1, 1, 1, 1, 1,
1.254372, -0.143262, 2.181664, 1, 1, 1, 1, 1,
1.256254, 1.307574, 0.1036749, 1, 1, 1, 1, 1,
1.259402, 0.9424289, 0.6058198, 1, 1, 1, 1, 1,
1.260751, 0.592259, 0.3571115, 1, 1, 1, 1, 1,
1.271617, -0.2166074, 1.087699, 1, 1, 1, 1, 1,
1.279392, 0.2013253, 0.2437115, 1, 1, 1, 1, 1,
1.280904, -1.766888, 0.8743508, 0, 0, 1, 1, 1,
1.281257, 0.646487, 1.275264, 1, 0, 0, 1, 1,
1.282295, -1.802885, 3.228059, 1, 0, 0, 1, 1,
1.297788, -1.108544, 3.415045, 1, 0, 0, 1, 1,
1.301063, -0.0839208, 2.614119, 1, 0, 0, 1, 1,
1.306263, 1.268957, -0.1406667, 1, 0, 0, 1, 1,
1.307482, 0.7649855, -0.2295136, 0, 0, 0, 1, 1,
1.308336, -1.804104, 0.7848337, 0, 0, 0, 1, 1,
1.348397, 0.1721031, 2.721657, 0, 0, 0, 1, 1,
1.354012, 0.576609, 2.043961, 0, 0, 0, 1, 1,
1.355321, -2.906992, 2.489482, 0, 0, 0, 1, 1,
1.36101, 1.130147, 0.1266299, 0, 0, 0, 1, 1,
1.363059, 0.06493971, 1.754173, 0, 0, 0, 1, 1,
1.367828, 0.1918401, 1.606215, 1, 1, 1, 1, 1,
1.371519, -1.103293, 2.198114, 1, 1, 1, 1, 1,
1.401911, 0.1129302, 2.702548, 1, 1, 1, 1, 1,
1.408151, -1.688726, 1.813365, 1, 1, 1, 1, 1,
1.410053, 0.9708549, 2.022048, 1, 1, 1, 1, 1,
1.425189, -0.9947494, 2.123514, 1, 1, 1, 1, 1,
1.431076, 1.372646, 1.316414, 1, 1, 1, 1, 1,
1.436846, 1.378362, 3.454098, 1, 1, 1, 1, 1,
1.453931, -1.367909, 1.753681, 1, 1, 1, 1, 1,
1.459108, -1.340616, 2.371654, 1, 1, 1, 1, 1,
1.469818, -0.7890445, 2.622502, 1, 1, 1, 1, 1,
1.486003, 1.086687, 1.472711, 1, 1, 1, 1, 1,
1.496318, 0.9119832, 1.156375, 1, 1, 1, 1, 1,
1.504587, 0.3764413, 2.022367, 1, 1, 1, 1, 1,
1.514721, 0.5987771, -0.458132, 1, 1, 1, 1, 1,
1.518407, 0.2527671, -0.9652316, 0, 0, 1, 1, 1,
1.522072, 0.2171569, 0.8668437, 1, 0, 0, 1, 1,
1.529237, 0.5633307, 0.2089366, 1, 0, 0, 1, 1,
1.532591, 0.4735878, 0.9947774, 1, 0, 0, 1, 1,
1.543275, -1.162881, 4.507039, 1, 0, 0, 1, 1,
1.550339, 0.1857123, -0.1219958, 1, 0, 0, 1, 1,
1.566738, -1.297957, 2.858478, 0, 0, 0, 1, 1,
1.584757, 0.5673795, 0.4094617, 0, 0, 0, 1, 1,
1.588678, 0.7744291, -0.3905298, 0, 0, 0, 1, 1,
1.588787, 1.945253, 1.199604, 0, 0, 0, 1, 1,
1.610103, -1.077597, 2.66328, 0, 0, 0, 1, 1,
1.623539, 0.4758804, 0.7922044, 0, 0, 0, 1, 1,
1.625027, 0.3194199, 1.330112, 0, 0, 0, 1, 1,
1.625221, -0.4986502, 2.567518, 1, 1, 1, 1, 1,
1.645597, -1.349011, 1.876377, 1, 1, 1, 1, 1,
1.651026, 0.0577172, 1.748239, 1, 1, 1, 1, 1,
1.65264, 1.209026, 1.234965, 1, 1, 1, 1, 1,
1.658524, 2.111155, 2.119191, 1, 1, 1, 1, 1,
1.661996, -0.137382, 1.200497, 1, 1, 1, 1, 1,
1.667573, -0.888829, 2.327242, 1, 1, 1, 1, 1,
1.6987, -1.098451, 2.133273, 1, 1, 1, 1, 1,
1.701746, 1.30415, 2.000262, 1, 1, 1, 1, 1,
1.711137, 0.9559525, 1.969353, 1, 1, 1, 1, 1,
1.711243, -1.382885, 1.483825, 1, 1, 1, 1, 1,
1.711657, -1.164428, 2.818084, 1, 1, 1, 1, 1,
1.72218, 0.2633401, 1.937348, 1, 1, 1, 1, 1,
1.732578, 0.2964248, 1.205663, 1, 1, 1, 1, 1,
1.737421, 0.04914933, 0.8998523, 1, 1, 1, 1, 1,
1.746359, -0.8686911, 2.069243, 0, 0, 1, 1, 1,
1.747997, -0.3914887, 0.9, 1, 0, 0, 1, 1,
1.758795, 0.6036601, 1.001508, 1, 0, 0, 1, 1,
1.776864, -0.1545957, 2.815014, 1, 0, 0, 1, 1,
1.779866, -1.073292, 0.8395548, 1, 0, 0, 1, 1,
1.780525, -1.21677, 1.661468, 1, 0, 0, 1, 1,
1.805855, 0.5813946, -0.2098896, 0, 0, 0, 1, 1,
1.812148, -0.04383334, 3.463654, 0, 0, 0, 1, 1,
1.821365, 0.6802785, 0.6537032, 0, 0, 0, 1, 1,
1.821639, -0.06419776, 2.112019, 0, 0, 0, 1, 1,
1.827777, 0.1943889, 0.6652538, 0, 0, 0, 1, 1,
1.856832, -1.33132, 1.195658, 0, 0, 0, 1, 1,
1.859045, 0.4345548, 1.367306, 0, 0, 0, 1, 1,
1.891337, 0.9220083, 1.382962, 1, 1, 1, 1, 1,
1.900034, 0.6672159, 1.183613, 1, 1, 1, 1, 1,
1.931562, 1.017087, -0.5505122, 1, 1, 1, 1, 1,
1.931696, -0.678832, 1.01097, 1, 1, 1, 1, 1,
1.94481, 0.1365051, 2.164815, 1, 1, 1, 1, 1,
1.946043, 0.4077738, 1.146745, 1, 1, 1, 1, 1,
1.948697, -0.126617, 1.584441, 1, 1, 1, 1, 1,
1.967212, 1.267106, -0.1108803, 1, 1, 1, 1, 1,
1.982217, -0.480746, 0.2725476, 1, 1, 1, 1, 1,
1.984981, -1.164013, 4.451837, 1, 1, 1, 1, 1,
2.06057, 0.7113562, 1.809852, 1, 1, 1, 1, 1,
2.090366, -0.696982, 2.106714, 1, 1, 1, 1, 1,
2.116081, -0.5334345, 0.6501615, 1, 1, 1, 1, 1,
2.121857, -0.8307196, 1.25624, 1, 1, 1, 1, 1,
2.134542, -1.409028, 2.916079, 1, 1, 1, 1, 1,
2.143445, 1.91723, 1.59121, 0, 0, 1, 1, 1,
2.190448, 0.08853566, 0.03404279, 1, 0, 0, 1, 1,
2.196558, 0.3452064, 1.348177, 1, 0, 0, 1, 1,
2.211597, -1.343165, 3.060717, 1, 0, 0, 1, 1,
2.218457, 0.3474861, 2.26283, 1, 0, 0, 1, 1,
2.235258, 0.1301877, 2.797256, 1, 0, 0, 1, 1,
2.237771, -0.3557648, 1.601118, 0, 0, 0, 1, 1,
2.245249, 1.164501, 2.308929, 0, 0, 0, 1, 1,
2.2947, -1.412382, 1.362621, 0, 0, 0, 1, 1,
2.295816, -0.8240968, 2.14579, 0, 0, 0, 1, 1,
2.326487, -0.9447991, 2.453439, 0, 0, 0, 1, 1,
2.336164, 1.518188, 0.6789153, 0, 0, 0, 1, 1,
2.343804, -0.506458, 0.4720699, 0, 0, 0, 1, 1,
2.385557, -0.3122149, 1.73201, 1, 1, 1, 1, 1,
2.444609, -0.7967508, 1.103156, 1, 1, 1, 1, 1,
2.5428, -1.393332, 3.505473, 1, 1, 1, 1, 1,
2.598618, 0.087106, 2.002127, 1, 1, 1, 1, 1,
2.613396, 1.570903, 1.88823, 1, 1, 1, 1, 1,
2.678375, -1.733048, 0.04422537, 1, 1, 1, 1, 1,
3.185585, 0.237695, 2.856694, 1, 1, 1, 1, 1
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
var radius = 9.653289;
var distance = 33.90677;
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
mvMatrix.translate( 0.02124548, -0.2033914, 0.351114 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.90677);
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