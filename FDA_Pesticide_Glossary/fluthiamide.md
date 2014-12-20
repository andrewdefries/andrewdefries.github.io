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
-2.913506, 0.6831669, 0.07149477, 1, 0, 0, 1,
-2.761613, 0.8830826, -2.319607, 1, 0.007843138, 0, 1,
-2.632002, -0.6218479, -0.7381321, 1, 0.01176471, 0, 1,
-2.59182, 0.2002497, 0.2138258, 1, 0.01960784, 0, 1,
-2.569364, 0.1466616, 1.212286, 1, 0.02352941, 0, 1,
-2.519313, 0.3942579, -1.426949, 1, 0.03137255, 0, 1,
-2.364174, 1.280542, -0.6920319, 1, 0.03529412, 0, 1,
-2.341272, -0.3695483, -0.137862, 1, 0.04313726, 0, 1,
-2.340596, 2.495454, -1.364837, 1, 0.04705882, 0, 1,
-2.32643, -0.5713378, -2.341961, 1, 0.05490196, 0, 1,
-2.316607, -1.311703, -1.16604, 1, 0.05882353, 0, 1,
-2.315935, 1.329016, 0.337199, 1, 0.06666667, 0, 1,
-2.260689, -0.3726666, -0.3976009, 1, 0.07058824, 0, 1,
-2.225408, -0.4151008, -2.494837, 1, 0.07843138, 0, 1,
-2.219697, -0.08365759, -1.950467, 1, 0.08235294, 0, 1,
-2.195827, -0.7125248, -0.08743715, 1, 0.09019608, 0, 1,
-2.187722, 0.8121564, -0.9283687, 1, 0.09411765, 0, 1,
-2.183128, 1.05243, 0.01482487, 1, 0.1019608, 0, 1,
-2.107647, -0.3548931, -1.335959, 1, 0.1098039, 0, 1,
-2.102379, -0.7457525, -2.987308, 1, 0.1137255, 0, 1,
-2.065603, 0.8523517, -1.004993, 1, 0.1215686, 0, 1,
-2.060929, 1.435131, -2.62153, 1, 0.1254902, 0, 1,
-2.042958, 0.5124687, -1.429572, 1, 0.1333333, 0, 1,
-2.030141, -2.152647, -2.18385, 1, 0.1372549, 0, 1,
-1.997654, -0.2382798, -1.47151, 1, 0.145098, 0, 1,
-1.971899, -0.5687544, -2.12591, 1, 0.1490196, 0, 1,
-1.964327, -1.091931, -0.5567598, 1, 0.1568628, 0, 1,
-1.949452, -1.002045, -1.191048, 1, 0.1607843, 0, 1,
-1.937458, -1.480929, -2.518167, 1, 0.1686275, 0, 1,
-1.90107, -0.1782008, -1.155425, 1, 0.172549, 0, 1,
-1.883106, 1.363566, 0.2202055, 1, 0.1803922, 0, 1,
-1.837223, -0.5498319, -2.543355, 1, 0.1843137, 0, 1,
-1.833336, 0.07412487, -1.706895, 1, 0.1921569, 0, 1,
-1.818681, 1.160933, 0.009243264, 1, 0.1960784, 0, 1,
-1.817459, 1.882105, -1.374837, 1, 0.2039216, 0, 1,
-1.778775, 1.294562, 0.2134791, 1, 0.2117647, 0, 1,
-1.773218, -0.6389754, -2.098827, 1, 0.2156863, 0, 1,
-1.765381, 0.8560991, -0.6981745, 1, 0.2235294, 0, 1,
-1.741128, -0.2716004, -1.722291, 1, 0.227451, 0, 1,
-1.740422, -0.2961217, -1.235248, 1, 0.2352941, 0, 1,
-1.738272, 1.535716, -0.2926945, 1, 0.2392157, 0, 1,
-1.726449, 0.8886195, -1.269434, 1, 0.2470588, 0, 1,
-1.713889, -1.235201, -3.144627, 1, 0.2509804, 0, 1,
-1.707447, 1.090517, -1.3736, 1, 0.2588235, 0, 1,
-1.697257, 0.5218842, -1.485098, 1, 0.2627451, 0, 1,
-1.685614, -0.5147332, -2.137341, 1, 0.2705882, 0, 1,
-1.678291, 0.2129726, -1.178191, 1, 0.2745098, 0, 1,
-1.676572, -1.478418, -3.646194, 1, 0.282353, 0, 1,
-1.674949, -2.530124, -1.965901, 1, 0.2862745, 0, 1,
-1.673804, 1.071114, -1.468422, 1, 0.2941177, 0, 1,
-1.659632, 0.5739505, -1.195368, 1, 0.3019608, 0, 1,
-1.643971, -0.6940076, -1.96494, 1, 0.3058824, 0, 1,
-1.638131, -0.2551598, -0.7016415, 1, 0.3137255, 0, 1,
-1.631681, 0.9885879, -1.653189, 1, 0.3176471, 0, 1,
-1.619576, 1.113327, 0.7041442, 1, 0.3254902, 0, 1,
-1.616662, -0.7354922, -0.621096, 1, 0.3294118, 0, 1,
-1.604384, -1.351286, -2.819545, 1, 0.3372549, 0, 1,
-1.603536, 0.572454, -2.591556, 1, 0.3411765, 0, 1,
-1.602061, -0.2476601, -1.958362, 1, 0.3490196, 0, 1,
-1.574934, -1.345424, -0.9917668, 1, 0.3529412, 0, 1,
-1.559622, 1.081097, -1.012601, 1, 0.3607843, 0, 1,
-1.557729, -0.03501999, 0.6024038, 1, 0.3647059, 0, 1,
-1.552255, -0.4767426, -2.177407, 1, 0.372549, 0, 1,
-1.547373, -0.9811798, -1.002894, 1, 0.3764706, 0, 1,
-1.543376, 0.3720552, -1.328581, 1, 0.3843137, 0, 1,
-1.538157, -0.4761388, -2.716388, 1, 0.3882353, 0, 1,
-1.535475, 0.6904154, -1.72655, 1, 0.3960784, 0, 1,
-1.524001, 2.01708, -0.3734137, 1, 0.4039216, 0, 1,
-1.516992, -0.1168227, -2.960429, 1, 0.4078431, 0, 1,
-1.512327, 0.5117533, -1.923306, 1, 0.4156863, 0, 1,
-1.511134, 0.6564634, -0.6280179, 1, 0.4196078, 0, 1,
-1.498917, -2.161199, -2.078817, 1, 0.427451, 0, 1,
-1.495123, 0.3228881, 0.9746729, 1, 0.4313726, 0, 1,
-1.488352, 0.8911833, -2.538998, 1, 0.4392157, 0, 1,
-1.484641, -0.1160283, -0.7495744, 1, 0.4431373, 0, 1,
-1.477545, -0.3598921, -1.024057, 1, 0.4509804, 0, 1,
-1.468703, -1.062629, -1.079103, 1, 0.454902, 0, 1,
-1.46745, -0.7695649, -3.433597, 1, 0.4627451, 0, 1,
-1.466035, -0.7533658, -2.795442, 1, 0.4666667, 0, 1,
-1.464826, 1.141872, -0.4473205, 1, 0.4745098, 0, 1,
-1.461595, 0.9555779, -2.482579, 1, 0.4784314, 0, 1,
-1.452401, -1.509935, -3.357241, 1, 0.4862745, 0, 1,
-1.435134, -0.7480197, -3.692214, 1, 0.4901961, 0, 1,
-1.431877, 1.633111, 0.6766233, 1, 0.4980392, 0, 1,
-1.425752, 1.238442, -1.495155, 1, 0.5058824, 0, 1,
-1.411153, -1.059853, -3.31106, 1, 0.509804, 0, 1,
-1.410026, -0.5890893, -1.662546, 1, 0.5176471, 0, 1,
-1.403802, -0.4076803, -0.3012347, 1, 0.5215687, 0, 1,
-1.398632, 0.6780704, -0.670019, 1, 0.5294118, 0, 1,
-1.394014, 0.4185331, -1.18008, 1, 0.5333334, 0, 1,
-1.390432, -0.3838496, -1.366096, 1, 0.5411765, 0, 1,
-1.387202, 1.695371, -0.3270443, 1, 0.5450981, 0, 1,
-1.386823, 0.1414717, -1.005497, 1, 0.5529412, 0, 1,
-1.383295, -0.8487456, -2.957924, 1, 0.5568628, 0, 1,
-1.382015, -0.8356717, -3.638552, 1, 0.5647059, 0, 1,
-1.381947, -0.712035, -1.44991, 1, 0.5686275, 0, 1,
-1.378971, -0.8162507, -2.82384, 1, 0.5764706, 0, 1,
-1.371503, -0.5417932, -1.418213, 1, 0.5803922, 0, 1,
-1.365649, -1.357636, -2.557082, 1, 0.5882353, 0, 1,
-1.358306, -0.4707189, -2.037588, 1, 0.5921569, 0, 1,
-1.352763, -0.1698651, -2.151424, 1, 0.6, 0, 1,
-1.350546, -0.4215802, -3.710862, 1, 0.6078432, 0, 1,
-1.342864, -0.2808616, -0.8034015, 1, 0.6117647, 0, 1,
-1.333117, 1.056447, -1.130212, 1, 0.6196079, 0, 1,
-1.329458, -0.7677933, -2.939927, 1, 0.6235294, 0, 1,
-1.318624, -1.197298, -2.080397, 1, 0.6313726, 0, 1,
-1.317735, 1.785506, 0.8865386, 1, 0.6352941, 0, 1,
-1.309571, 0.05866532, -2.081787, 1, 0.6431373, 0, 1,
-1.300838, -0.9671982, -2.071216, 1, 0.6470588, 0, 1,
-1.300482, 1.006533, -1.50739, 1, 0.654902, 0, 1,
-1.2931, -2.572018, -6.07271, 1, 0.6588235, 0, 1,
-1.287153, -1.920711, -5.622462, 1, 0.6666667, 0, 1,
-1.285936, -0.5326354, -1.615009, 1, 0.6705883, 0, 1,
-1.277636, -0.8462146, -4.212706, 1, 0.6784314, 0, 1,
-1.265048, -0.6190152, -1.862316, 1, 0.682353, 0, 1,
-1.263815, 1.031352, 0.2692049, 1, 0.6901961, 0, 1,
-1.258944, 0.9096476, -0.3853057, 1, 0.6941177, 0, 1,
-1.252081, -0.7507919, -1.590847, 1, 0.7019608, 0, 1,
-1.245864, 2.29044, 1.966364, 1, 0.7098039, 0, 1,
-1.245644, 0.1095794, -1.27657, 1, 0.7137255, 0, 1,
-1.235262, 0.2135247, -4.280013, 1, 0.7215686, 0, 1,
-1.231641, 0.5552798, -0.6037235, 1, 0.7254902, 0, 1,
-1.230374, -0.2992437, -1.345914, 1, 0.7333333, 0, 1,
-1.22955, -1.63683, -1.394838, 1, 0.7372549, 0, 1,
-1.225579, -0.5394804, -2.678013, 1, 0.7450981, 0, 1,
-1.213456, 1.036559, 0.796544, 1, 0.7490196, 0, 1,
-1.212677, 2.736985, 1.460366, 1, 0.7568628, 0, 1,
-1.204777, 0.05964676, -1.233601, 1, 0.7607843, 0, 1,
-1.200421, -0.7138841, -1.357609, 1, 0.7686275, 0, 1,
-1.199363, -1.20604, -2.46038, 1, 0.772549, 0, 1,
-1.19885, 0.4441625, -1.874253, 1, 0.7803922, 0, 1,
-1.194335, -1.764755, -3.611463, 1, 0.7843137, 0, 1,
-1.187503, 1.502781, -1.987405, 1, 0.7921569, 0, 1,
-1.171061, -0.8861184, -3.825181, 1, 0.7960784, 0, 1,
-1.155634, 1.754094, -0.7258387, 1, 0.8039216, 0, 1,
-1.155104, 0.1672666, 0.6162189, 1, 0.8117647, 0, 1,
-1.153543, -1.763753, -2.58779, 1, 0.8156863, 0, 1,
-1.153095, -0.7889344, -0.772607, 1, 0.8235294, 0, 1,
-1.146201, 0.2204884, -2.284299, 1, 0.827451, 0, 1,
-1.138805, 1.047038, -1.459209, 1, 0.8352941, 0, 1,
-1.131283, -1.104329, -1.164875, 1, 0.8392157, 0, 1,
-1.127134, -1.508695, -1.822823, 1, 0.8470588, 0, 1,
-1.124492, -1.124744, -2.55083, 1, 0.8509804, 0, 1,
-1.11087, -0.1998392, -1.80596, 1, 0.8588235, 0, 1,
-1.10613, 0.4605747, -2.635164, 1, 0.8627451, 0, 1,
-1.1059, -0.535213, -1.904764, 1, 0.8705882, 0, 1,
-1.105845, -1.365667, -3.169092, 1, 0.8745098, 0, 1,
-1.103973, -0.544583, -1.336463, 1, 0.8823529, 0, 1,
-1.096789, 2.393988, -2.184089, 1, 0.8862745, 0, 1,
-1.093983, 1.729488, -2.235679, 1, 0.8941177, 0, 1,
-1.092836, 0.3609505, -1.522488, 1, 0.8980392, 0, 1,
-1.09168, 0.05645288, -2.657645, 1, 0.9058824, 0, 1,
-1.089661, 0.1553227, -3.01764, 1, 0.9137255, 0, 1,
-1.083364, -0.8344191, -1.540528, 1, 0.9176471, 0, 1,
-1.082525, 1.125148, -1.134633, 1, 0.9254902, 0, 1,
-1.0714, 0.07784811, -3.407461, 1, 0.9294118, 0, 1,
-1.065817, -0.144054, -3.019418, 1, 0.9372549, 0, 1,
-1.064778, -1.172001, -0.4941885, 1, 0.9411765, 0, 1,
-1.062588, 0.9994895, -1.318535, 1, 0.9490196, 0, 1,
-1.06021, -1.373942, -2.297055, 1, 0.9529412, 0, 1,
-1.058162, -0.2540209, -2.28922, 1, 0.9607843, 0, 1,
-1.056285, 1.551428, -1.486156, 1, 0.9647059, 0, 1,
-1.05612, -0.4074838, -1.396811, 1, 0.972549, 0, 1,
-1.047655, -1.0017, -2.691302, 1, 0.9764706, 0, 1,
-1.046701, 0.5296878, -1.749969, 1, 0.9843137, 0, 1,
-1.041434, 1.168384, 0.586412, 1, 0.9882353, 0, 1,
-1.036419, 0.7527106, -0.7423149, 1, 0.9960784, 0, 1,
-1.035634, 0.9818933, -1.344049, 0.9960784, 1, 0, 1,
-1.034655, 0.2417883, -0.8534756, 0.9921569, 1, 0, 1,
-1.032076, 0.005899225, -2.081004, 0.9843137, 1, 0, 1,
-1.029628, 0.5001603, -1.210094, 0.9803922, 1, 0, 1,
-1.02514, -0.5270963, -1.916135, 0.972549, 1, 0, 1,
-1.023235, -0.9376631, -0.304371, 0.9686275, 1, 0, 1,
-1.021491, -0.4869047, -0.6778485, 0.9607843, 1, 0, 1,
-1.016047, 0.1208994, -2.31207, 0.9568627, 1, 0, 1,
-1.006568, 0.05392877, 0.6970858, 0.9490196, 1, 0, 1,
-1.003998, 2.065294, -2.801663, 0.945098, 1, 0, 1,
-1.00342, -0.8591151, -2.380169, 0.9372549, 1, 0, 1,
-1.002853, -0.758773, -2.866495, 0.9333333, 1, 0, 1,
-1.002663, 0.221505, -2.234934, 0.9254902, 1, 0, 1,
-1.000602, 0.1356944, -1.114005, 0.9215686, 1, 0, 1,
-0.9960524, -1.190366, -3.553392, 0.9137255, 1, 0, 1,
-0.9908652, -1.508419, -2.241108, 0.9098039, 1, 0, 1,
-0.990206, -0.7540435, -1.378807, 0.9019608, 1, 0, 1,
-0.9879593, 0.1121407, -1.351997, 0.8941177, 1, 0, 1,
-0.9839903, -0.8617342, -2.421776, 0.8901961, 1, 0, 1,
-0.9729638, -0.136549, -3.106026, 0.8823529, 1, 0, 1,
-0.9574032, 0.03280576, -2.375011, 0.8784314, 1, 0, 1,
-0.9561963, 0.1216091, -3.236552, 0.8705882, 1, 0, 1,
-0.9543146, -0.297447, -1.171466, 0.8666667, 1, 0, 1,
-0.950983, 1.690173, -0.1408779, 0.8588235, 1, 0, 1,
-0.9466652, -0.6484584, -3.175621, 0.854902, 1, 0, 1,
-0.9466504, 0.6322935, -0.574818, 0.8470588, 1, 0, 1,
-0.9452872, -1.530447, -1.298977, 0.8431373, 1, 0, 1,
-0.9448006, -1.267721, -2.469943, 0.8352941, 1, 0, 1,
-0.9432884, 1.169613, -0.0521186, 0.8313726, 1, 0, 1,
-0.9420252, 0.3872274, -1.066173, 0.8235294, 1, 0, 1,
-0.9411823, -1.62029, -1.308671, 0.8196079, 1, 0, 1,
-0.9379049, 1.218469, 0.295097, 0.8117647, 1, 0, 1,
-0.9378139, 1.496953, -1.839134, 0.8078431, 1, 0, 1,
-0.9207363, 0.3712673, -0.5335945, 0.8, 1, 0, 1,
-0.9204754, 0.6246809, -1.478599, 0.7921569, 1, 0, 1,
-0.9170234, 0.2592403, -2.881493, 0.7882353, 1, 0, 1,
-0.9152083, -0.6267847, -2.316797, 0.7803922, 1, 0, 1,
-0.9136326, 0.8258086, -2.061527, 0.7764706, 1, 0, 1,
-0.9115926, 0.9516897, -1.006878, 0.7686275, 1, 0, 1,
-0.9095149, 0.05599231, -1.569396, 0.7647059, 1, 0, 1,
-0.906018, 0.5370187, -1.798151, 0.7568628, 1, 0, 1,
-0.9021502, 0.9006403, -1.085568, 0.7529412, 1, 0, 1,
-0.9002682, 1.010945, -2.182497, 0.7450981, 1, 0, 1,
-0.8949064, -0.8066895, -2.469309, 0.7411765, 1, 0, 1,
-0.8912816, 0.5846938, -1.182732, 0.7333333, 1, 0, 1,
-0.8843773, -1.767517, -1.781257, 0.7294118, 1, 0, 1,
-0.8719232, 1.094635, 1.047429, 0.7215686, 1, 0, 1,
-0.8661639, 0.9483772, 0.122232, 0.7176471, 1, 0, 1,
-0.8589401, -0.2598849, -2.238002, 0.7098039, 1, 0, 1,
-0.8566034, -1.186194, -2.735842, 0.7058824, 1, 0, 1,
-0.8481846, 0.6901408, -1.238905, 0.6980392, 1, 0, 1,
-0.8324643, 0.176377, -1.903692, 0.6901961, 1, 0, 1,
-0.8317209, -0.03319129, -0.9486693, 0.6862745, 1, 0, 1,
-0.830451, 0.1659951, -1.834377, 0.6784314, 1, 0, 1,
-0.8299127, -1.626344, -2.861391, 0.6745098, 1, 0, 1,
-0.8295063, 0.4570271, -1.697433, 0.6666667, 1, 0, 1,
-0.8269621, 0.3954328, -1.840778, 0.6627451, 1, 0, 1,
-0.8250202, 1.300717, 0.1904578, 0.654902, 1, 0, 1,
-0.8189836, -1.659203, -3.725982, 0.6509804, 1, 0, 1,
-0.8179364, -0.9805252, -3.14815, 0.6431373, 1, 0, 1,
-0.8166559, 0.6784279, -0.3650936, 0.6392157, 1, 0, 1,
-0.8125137, -2.09094, -2.542128, 0.6313726, 1, 0, 1,
-0.8113051, -0.2635352, -1.21517, 0.627451, 1, 0, 1,
-0.8067378, 1.287881, -0.8652526, 0.6196079, 1, 0, 1,
-0.8027826, 0.1256347, -0.72105, 0.6156863, 1, 0, 1,
-0.7979275, -1.984151, -3.677856, 0.6078432, 1, 0, 1,
-0.797828, -0.307344, -3.424423, 0.6039216, 1, 0, 1,
-0.7859715, -2.279559, -5.145215, 0.5960785, 1, 0, 1,
-0.7841118, -1.311884, -2.378731, 0.5882353, 1, 0, 1,
-0.7800165, -0.27237, -1.122365, 0.5843138, 1, 0, 1,
-0.7780229, 1.283474, -0.7132906, 0.5764706, 1, 0, 1,
-0.7743886, -0.8613979, -0.8610742, 0.572549, 1, 0, 1,
-0.7701421, -0.1524726, -1.620751, 0.5647059, 1, 0, 1,
-0.768832, -0.529505, -1.541861, 0.5607843, 1, 0, 1,
-0.7677686, -0.1723668, -1.707965, 0.5529412, 1, 0, 1,
-0.7658899, -0.1467588, -3.148097, 0.5490196, 1, 0, 1,
-0.7622533, 1.650929, -0.2267725, 0.5411765, 1, 0, 1,
-0.7617147, 0.1397631, -0.5402596, 0.5372549, 1, 0, 1,
-0.7565489, 0.2019709, -3.023309, 0.5294118, 1, 0, 1,
-0.7516481, -0.4274021, -3.009991, 0.5254902, 1, 0, 1,
-0.7449074, 0.4866024, -0.3700927, 0.5176471, 1, 0, 1,
-0.7443527, 1.808356, 0.2797637, 0.5137255, 1, 0, 1,
-0.7432553, -1.027196, 0.1381245, 0.5058824, 1, 0, 1,
-0.7424489, -1.606261, -3.016025, 0.5019608, 1, 0, 1,
-0.7373004, 0.8986765, -1.296183, 0.4941176, 1, 0, 1,
-0.7317315, 0.8769962, -0.8444536, 0.4862745, 1, 0, 1,
-0.7190722, -0.5598874, -2.111051, 0.4823529, 1, 0, 1,
-0.7133207, -0.4123718, -4.567985, 0.4745098, 1, 0, 1,
-0.7102038, -0.5409555, -1.518783, 0.4705882, 1, 0, 1,
-0.7081547, 0.3587551, -1.659373, 0.4627451, 1, 0, 1,
-0.705046, -1.737658, -3.739892, 0.4588235, 1, 0, 1,
-0.7044432, 1.612687, -0.8336747, 0.4509804, 1, 0, 1,
-0.7028518, 0.1480323, -0.8149195, 0.4470588, 1, 0, 1,
-0.7018427, 1.369645, -1.845508, 0.4392157, 1, 0, 1,
-0.7010894, 1.044117, -1.131784, 0.4352941, 1, 0, 1,
-0.6983036, -0.8973089, -2.736104, 0.427451, 1, 0, 1,
-0.6978118, -0.4157516, -1.741002, 0.4235294, 1, 0, 1,
-0.6759236, -1.866287, -2.498281, 0.4156863, 1, 0, 1,
-0.6737527, 0.8995505, -0.1550835, 0.4117647, 1, 0, 1,
-0.671814, -1.646056, -2.95551, 0.4039216, 1, 0, 1,
-0.6701694, -1.50514, -2.948794, 0.3960784, 1, 0, 1,
-0.6631876, -0.1137159, -1.924247, 0.3921569, 1, 0, 1,
-0.6591088, 2.014351, 0.8498184, 0.3843137, 1, 0, 1,
-0.6507146, 0.1079144, -1.483749, 0.3803922, 1, 0, 1,
-0.6475936, -0.8127893, -3.906842, 0.372549, 1, 0, 1,
-0.6414313, 0.2580321, -2.730128, 0.3686275, 1, 0, 1,
-0.6408381, -1.054904, -2.757641, 0.3607843, 1, 0, 1,
-0.6408004, 0.2813524, -0.905046, 0.3568628, 1, 0, 1,
-0.6384207, -1.083139, -3.539743, 0.3490196, 1, 0, 1,
-0.6352246, -0.3523321, -2.678506, 0.345098, 1, 0, 1,
-0.6329642, 0.5323543, -1.106183, 0.3372549, 1, 0, 1,
-0.628504, 0.2472592, -0.4924056, 0.3333333, 1, 0, 1,
-0.6229197, -1.278971, -2.454103, 0.3254902, 1, 0, 1,
-0.6190097, -1.395661, -1.920551, 0.3215686, 1, 0, 1,
-0.6145234, -0.3384807, -1.560158, 0.3137255, 1, 0, 1,
-0.6128022, -0.540898, -2.292896, 0.3098039, 1, 0, 1,
-0.6065103, -0.7744053, -2.088629, 0.3019608, 1, 0, 1,
-0.6059271, -1.733819, -3.25971, 0.2941177, 1, 0, 1,
-0.6053081, 1.933089, -0.7530959, 0.2901961, 1, 0, 1,
-0.6022549, 0.0796161, -0.08003856, 0.282353, 1, 0, 1,
-0.5998606, 1.196076, -0.5867004, 0.2784314, 1, 0, 1,
-0.5989404, -1.217266, -4.260912, 0.2705882, 1, 0, 1,
-0.5956147, -0.2564973, -0.9514978, 0.2666667, 1, 0, 1,
-0.5918603, -0.1889312, -1.260882, 0.2588235, 1, 0, 1,
-0.588363, 1.454836, -0.19972, 0.254902, 1, 0, 1,
-0.5853392, 1.581643, -1.905776, 0.2470588, 1, 0, 1,
-0.5797053, 1.671809, -2.086809, 0.2431373, 1, 0, 1,
-0.5789422, -0.4872769, -2.473844, 0.2352941, 1, 0, 1,
-0.5769959, -1.449272, -3.602429, 0.2313726, 1, 0, 1,
-0.5747053, 2.262795, -1.25593, 0.2235294, 1, 0, 1,
-0.5728726, 0.9185044, 0.2838658, 0.2196078, 1, 0, 1,
-0.571249, -1.10548, -3.489468, 0.2117647, 1, 0, 1,
-0.5695678, 2.575114, -0.2509899, 0.2078431, 1, 0, 1,
-0.5631844, -1.154932, -2.194568, 0.2, 1, 0, 1,
-0.5627455, 0.2499586, -0.1603623, 0.1921569, 1, 0, 1,
-0.559715, 0.686271, -2.241038, 0.1882353, 1, 0, 1,
-0.5573607, -0.08610107, -2.890221, 0.1803922, 1, 0, 1,
-0.550847, 0.4308005, -1.440955, 0.1764706, 1, 0, 1,
-0.5427948, -0.5227061, -1.232454, 0.1686275, 1, 0, 1,
-0.5423001, -0.8956196, -4.141798, 0.1647059, 1, 0, 1,
-0.5364482, -0.9583433, -3.835442, 0.1568628, 1, 0, 1,
-0.5287427, -0.7524254, -3.332516, 0.1529412, 1, 0, 1,
-0.5257347, -0.9609863, -1.966083, 0.145098, 1, 0, 1,
-0.5232832, 0.3678735, -1.05301, 0.1411765, 1, 0, 1,
-0.5224817, 0.5328268, 0.552571, 0.1333333, 1, 0, 1,
-0.5221943, -0.4240518, -1.699419, 0.1294118, 1, 0, 1,
-0.5210203, -0.06344164, -0.05373584, 0.1215686, 1, 0, 1,
-0.5194338, 0.1120378, -0.6803446, 0.1176471, 1, 0, 1,
-0.51867, -0.8970591, -3.720272, 0.1098039, 1, 0, 1,
-0.5127043, -0.001425321, -1.65378, 0.1058824, 1, 0, 1,
-0.5057234, -0.465566, -0.1624066, 0.09803922, 1, 0, 1,
-0.5052429, 0.8252473, 0.5542676, 0.09019608, 1, 0, 1,
-0.5001017, 0.6255859, 0.002794418, 0.08627451, 1, 0, 1,
-0.4988816, 0.6920464, 0.8191408, 0.07843138, 1, 0, 1,
-0.4965611, -2.003014, -3.343419, 0.07450981, 1, 0, 1,
-0.4940247, -1.429775, -3.604466, 0.06666667, 1, 0, 1,
-0.4940131, 0.1484387, 0.7020219, 0.0627451, 1, 0, 1,
-0.4901011, -0.1896843, -1.748725, 0.05490196, 1, 0, 1,
-0.4897596, 0.08012596, -1.420088, 0.05098039, 1, 0, 1,
-0.4879793, -0.1102772, -1.607982, 0.04313726, 1, 0, 1,
-0.4878996, -1.556948, -1.571472, 0.03921569, 1, 0, 1,
-0.4874859, 0.3514733, -2.323993, 0.03137255, 1, 0, 1,
-0.4793247, 1.200919, 0.4316549, 0.02745098, 1, 0, 1,
-0.4779869, 0.6025374, 0.5093035, 0.01960784, 1, 0, 1,
-0.4768903, -1.767157, -2.22784, 0.01568628, 1, 0, 1,
-0.4748766, 0.769253, 0.02482538, 0.007843138, 1, 0, 1,
-0.4741297, 0.7514856, 0.2665026, 0.003921569, 1, 0, 1,
-0.473388, -0.2558094, -1.369955, 0, 1, 0.003921569, 1,
-0.4686746, 1.369698, 1.500569, 0, 1, 0.01176471, 1,
-0.4668485, 0.6486712, -1.558804, 0, 1, 0.01568628, 1,
-0.4661754, -0.3294461, -3.501783, 0, 1, 0.02352941, 1,
-0.4659957, -1.476801, -3.137652, 0, 1, 0.02745098, 1,
-0.4616549, -0.4873946, -1.730146, 0, 1, 0.03529412, 1,
-0.4607332, -0.07476214, -2.331074, 0, 1, 0.03921569, 1,
-0.4606399, 1.230071, -0.5669559, 0, 1, 0.04705882, 1,
-0.4605624, 1.161702, -1.359468, 0, 1, 0.05098039, 1,
-0.4590956, 0.6858427, -0.6140431, 0, 1, 0.05882353, 1,
-0.45896, 1.31704, -0.8082494, 0, 1, 0.0627451, 1,
-0.4570415, 0.2682052, -0.5595967, 0, 1, 0.07058824, 1,
-0.4536029, -1.351713, -2.771182, 0, 1, 0.07450981, 1,
-0.4504208, 0.08363762, -0.1931481, 0, 1, 0.08235294, 1,
-0.4467286, -1.974832, -2.822447, 0, 1, 0.08627451, 1,
-0.4466096, 1.379937, 0.1605331, 0, 1, 0.09411765, 1,
-0.4430267, 0.5882255, -0.6808729, 0, 1, 0.1019608, 1,
-0.4406227, 0.8110654, -0.5216454, 0, 1, 0.1058824, 1,
-0.4355819, -0.6977301, -3.700873, 0, 1, 0.1137255, 1,
-0.4343501, 0.3832247, -0.8091465, 0, 1, 0.1176471, 1,
-0.4337481, 1.860515, -0.7805659, 0, 1, 0.1254902, 1,
-0.4332104, -1.950132, -1.044425, 0, 1, 0.1294118, 1,
-0.4330708, -1.877268, -3.882164, 0, 1, 0.1372549, 1,
-0.4296151, -2.915139, -3.469186, 0, 1, 0.1411765, 1,
-0.4289146, -0.2006447, -1.301092, 0, 1, 0.1490196, 1,
-0.4259793, -0.764616, -2.399072, 0, 1, 0.1529412, 1,
-0.4241687, -0.7912175, -2.641599, 0, 1, 0.1607843, 1,
-0.4185856, -0.7978084, -3.208776, 0, 1, 0.1647059, 1,
-0.4144866, -1.736345, -2.264979, 0, 1, 0.172549, 1,
-0.412815, -0.9819092, -1.998309, 0, 1, 0.1764706, 1,
-0.4101157, -0.04895719, -3.377955, 0, 1, 0.1843137, 1,
-0.4095621, 1.454648, 1.7537, 0, 1, 0.1882353, 1,
-0.4064777, 1.128929, 0.7218481, 0, 1, 0.1960784, 1,
-0.3989051, -1.625977, -2.884255, 0, 1, 0.2039216, 1,
-0.3984431, -0.3327934, -1.505571, 0, 1, 0.2078431, 1,
-0.3975474, 0.1862591, -0.8724864, 0, 1, 0.2156863, 1,
-0.3971541, -0.3458511, -3.208925, 0, 1, 0.2196078, 1,
-0.3950494, 0.8925665, -1.841296, 0, 1, 0.227451, 1,
-0.3913795, -0.3819464, -2.290832, 0, 1, 0.2313726, 1,
-0.3885443, -1.097199, -2.547927, 0, 1, 0.2392157, 1,
-0.385181, 0.02735233, -2.171082, 0, 1, 0.2431373, 1,
-0.3832906, 0.5334909, -1.221562, 0, 1, 0.2509804, 1,
-0.3794287, -1.041853, -3.811574, 0, 1, 0.254902, 1,
-0.3725152, 0.8449134, -1.06619, 0, 1, 0.2627451, 1,
-0.372109, -0.5651218, -3.874821, 0, 1, 0.2666667, 1,
-0.3719727, -0.4632984, -0.4026264, 0, 1, 0.2745098, 1,
-0.3713844, -1.437341, -3.236739, 0, 1, 0.2784314, 1,
-0.3713711, -0.644248, -3.200922, 0, 1, 0.2862745, 1,
-0.3706145, -1.186869, -1.3558, 0, 1, 0.2901961, 1,
-0.3705798, -0.338017, -0.7828647, 0, 1, 0.2980392, 1,
-0.3673951, -1.392256, -3.791829, 0, 1, 0.3058824, 1,
-0.3669773, 1.14427, 1.101415, 0, 1, 0.3098039, 1,
-0.3615564, -1.115688, -4.046687, 0, 1, 0.3176471, 1,
-0.3613557, -0.2621109, -3.77326, 0, 1, 0.3215686, 1,
-0.3605343, -1.462595, -2.528365, 0, 1, 0.3294118, 1,
-0.3595515, -0.3253019, -3.435212, 0, 1, 0.3333333, 1,
-0.3583904, 1.097662, -0.5601511, 0, 1, 0.3411765, 1,
-0.3573492, -1.989651, -3.726098, 0, 1, 0.345098, 1,
-0.3560479, -1.073904, -4.358076, 0, 1, 0.3529412, 1,
-0.3481554, -1.769081, -4.2383, 0, 1, 0.3568628, 1,
-0.3456621, -0.2581457, -3.056876, 0, 1, 0.3647059, 1,
-0.343363, 0.9697992, -1.903168, 0, 1, 0.3686275, 1,
-0.3430941, -0.001475495, -1.661064, 0, 1, 0.3764706, 1,
-0.3414177, 0.2549361, -0.1471832, 0, 1, 0.3803922, 1,
-0.339059, 0.5670072, -0.434858, 0, 1, 0.3882353, 1,
-0.3364876, -0.4467729, -1.115205, 0, 1, 0.3921569, 1,
-0.334096, -0.8639119, -3.352822, 0, 1, 0.4, 1,
-0.3334357, -0.3605789, -1.512932, 0, 1, 0.4078431, 1,
-0.3303823, -1.568719, -2.076197, 0, 1, 0.4117647, 1,
-0.3302542, -0.81925, -4.4505, 0, 1, 0.4196078, 1,
-0.3247895, -1.12189, -3.691447, 0, 1, 0.4235294, 1,
-0.3236871, -1.013498, -2.595714, 0, 1, 0.4313726, 1,
-0.3229982, 0.3427674, -0.4136791, 0, 1, 0.4352941, 1,
-0.3221678, -0.6443275, -2.047819, 0, 1, 0.4431373, 1,
-0.3217145, 1.489377, -0.6310663, 0, 1, 0.4470588, 1,
-0.3153797, -1.951884, -1.830201, 0, 1, 0.454902, 1,
-0.3062025, -0.9787156, -0.6256558, 0, 1, 0.4588235, 1,
-0.2993587, 0.5132602, -2.015023, 0, 1, 0.4666667, 1,
-0.2966464, -0.04617434, -1.547197, 0, 1, 0.4705882, 1,
-0.2943083, 0.3564882, 0.9572371, 0, 1, 0.4784314, 1,
-0.2943068, 2.597831, 2.183513, 0, 1, 0.4823529, 1,
-0.2924681, -0.8386341, -2.131282, 0, 1, 0.4901961, 1,
-0.2899724, -0.5562681, -1.650577, 0, 1, 0.4941176, 1,
-0.2867096, -0.06398712, -2.19875, 0, 1, 0.5019608, 1,
-0.2813451, -0.6607708, -1.775133, 0, 1, 0.509804, 1,
-0.2784976, 0.3656093, -0.8308599, 0, 1, 0.5137255, 1,
-0.2783109, 0.6707042, 0.6799815, 0, 1, 0.5215687, 1,
-0.2768517, -1.01687, -1.172033, 0, 1, 0.5254902, 1,
-0.2710019, -0.4252065, -4.032098, 0, 1, 0.5333334, 1,
-0.2681712, 0.434659, -0.8694986, 0, 1, 0.5372549, 1,
-0.2666605, 0.8667518, 0.08451787, 0, 1, 0.5450981, 1,
-0.2644531, -1.696139, -3.922252, 0, 1, 0.5490196, 1,
-0.2611106, -0.7177602, -2.333244, 0, 1, 0.5568628, 1,
-0.2595427, 2.001313, -2.046458, 0, 1, 0.5607843, 1,
-0.2577075, 2.34329, 0.8736221, 0, 1, 0.5686275, 1,
-0.256833, -0.1578823, -1.354616, 0, 1, 0.572549, 1,
-0.2527886, -1.834257, -1.896232, 0, 1, 0.5803922, 1,
-0.2508359, -0.432034, -2.072758, 0, 1, 0.5843138, 1,
-0.2494621, 0.4400056, -0.912164, 0, 1, 0.5921569, 1,
-0.2454648, 1.042306, 0.1034942, 0, 1, 0.5960785, 1,
-0.2428572, -2.025665, -3.913088, 0, 1, 0.6039216, 1,
-0.2341431, 0.8891445, -0.6161435, 0, 1, 0.6117647, 1,
-0.2328988, -0.5440023, -1.812497, 0, 1, 0.6156863, 1,
-0.2274955, -0.1651874, -3.299036, 0, 1, 0.6235294, 1,
-0.2270475, -0.4719732, -4.571253, 0, 1, 0.627451, 1,
-0.2269261, 0.5778621, 0.5225368, 0, 1, 0.6352941, 1,
-0.2256063, 0.5384343, -0.6191941, 0, 1, 0.6392157, 1,
-0.2231458, 1.151944, -0.3743881, 0, 1, 0.6470588, 1,
-0.2213716, 0.6381903, 0.3195649, 0, 1, 0.6509804, 1,
-0.2210511, -0.3714281, -3.300865, 0, 1, 0.6588235, 1,
-0.2199169, -1.175091, -2.173707, 0, 1, 0.6627451, 1,
-0.2193535, -0.4770302, -3.559347, 0, 1, 0.6705883, 1,
-0.2172915, 0.7495695, 0.09232298, 0, 1, 0.6745098, 1,
-0.2165086, 0.4300969, -0.1053652, 0, 1, 0.682353, 1,
-0.2132985, -0.5253492, -2.207034, 0, 1, 0.6862745, 1,
-0.2086591, 0.0009057575, 0.4932849, 0, 1, 0.6941177, 1,
-0.2025042, -0.2764972, -2.365356, 0, 1, 0.7019608, 1,
-0.200103, -1.284524, -3.385485, 0, 1, 0.7058824, 1,
-0.1984445, -0.6481474, -2.134458, 0, 1, 0.7137255, 1,
-0.1943914, 0.2518877, -1.534247, 0, 1, 0.7176471, 1,
-0.1939229, 1.288549, 1.47196, 0, 1, 0.7254902, 1,
-0.1928547, 0.2036991, 0.9178448, 0, 1, 0.7294118, 1,
-0.191412, 0.6986052, -1.873319, 0, 1, 0.7372549, 1,
-0.1885405, 1.020983, 0.5955935, 0, 1, 0.7411765, 1,
-0.1876008, -0.4478332, -2.017324, 0, 1, 0.7490196, 1,
-0.1825012, -1.592987, -3.45534, 0, 1, 0.7529412, 1,
-0.175795, 0.3096175, 0.4403883, 0, 1, 0.7607843, 1,
-0.1755887, 0.3000403, -1.03181, 0, 1, 0.7647059, 1,
-0.1737846, 0.7317353, -0.1411943, 0, 1, 0.772549, 1,
-0.1737417, -0.1149846, -2.000671, 0, 1, 0.7764706, 1,
-0.1640962, -0.5727094, -1.527257, 0, 1, 0.7843137, 1,
-0.1632914, -0.3572814, -3.205456, 0, 1, 0.7882353, 1,
-0.1625623, 0.8547553, -2.863057, 0, 1, 0.7960784, 1,
-0.1583294, -0.3006011, -4.041985, 0, 1, 0.8039216, 1,
-0.1535326, -0.9895903, -2.603243, 0, 1, 0.8078431, 1,
-0.1531798, 1.159902, -0.6391215, 0, 1, 0.8156863, 1,
-0.1521533, -0.3681589, -2.283196, 0, 1, 0.8196079, 1,
-0.1514527, -0.02716671, -1.897147, 0, 1, 0.827451, 1,
-0.1507235, -0.3616121, -3.143492, 0, 1, 0.8313726, 1,
-0.1483769, -0.9679803, -3.215955, 0, 1, 0.8392157, 1,
-0.1468938, 0.1169268, -1.759999, 0, 1, 0.8431373, 1,
-0.1431814, -0.4522757, -2.890299, 0, 1, 0.8509804, 1,
-0.1425021, -0.6847056, -2.333866, 0, 1, 0.854902, 1,
-0.1386603, -1.312404, -1.002969, 0, 1, 0.8627451, 1,
-0.1379628, -1.092703, -2.10927, 0, 1, 0.8666667, 1,
-0.1372099, 1.078189, 0.2490997, 0, 1, 0.8745098, 1,
-0.1361571, -0.1126037, -3.434937, 0, 1, 0.8784314, 1,
-0.1356169, 0.006047937, -1.955702, 0, 1, 0.8862745, 1,
-0.1305659, 0.9195901, -0.6735678, 0, 1, 0.8901961, 1,
-0.1220205, 1.030129, 0.4143925, 0, 1, 0.8980392, 1,
-0.1183918, 1.433457, -0.8603356, 0, 1, 0.9058824, 1,
-0.1169749, -0.5576921, -5.795062, 0, 1, 0.9098039, 1,
-0.1105833, 0.23649, -3.069417, 0, 1, 0.9176471, 1,
-0.105148, -0.7985784, -1.348823, 0, 1, 0.9215686, 1,
-0.1027854, -1.845191, -2.699196, 0, 1, 0.9294118, 1,
-0.1015706, 1.479385, -2.120266, 0, 1, 0.9333333, 1,
-0.09998024, -0.5007853, -2.089312, 0, 1, 0.9411765, 1,
-0.09949911, 0.1163458, -0.5128455, 0, 1, 0.945098, 1,
-0.09680139, -1.619236, -5.614174, 0, 1, 0.9529412, 1,
-0.08574739, 0.7898714, -0.623329, 0, 1, 0.9568627, 1,
-0.07437786, 0.8102734, 0.8512133, 0, 1, 0.9647059, 1,
-0.07368945, 1.488033, 1.054758, 0, 1, 0.9686275, 1,
-0.07179238, 0.8074915, 0.06609535, 0, 1, 0.9764706, 1,
-0.07031536, 0.8799068, 0.7729744, 0, 1, 0.9803922, 1,
-0.06337235, -0.7545289, -2.261253, 0, 1, 0.9882353, 1,
-0.06151018, 1.195246, -1.964696, 0, 1, 0.9921569, 1,
-0.05863274, 0.3424781, 0.6239791, 0, 1, 1, 1,
-0.05270354, 0.8352149, -1.562116, 0, 0.9921569, 1, 1,
-0.05057807, -1.965378, -4.042115, 0, 0.9882353, 1, 1,
-0.04989255, 1.085286, 0.1847944, 0, 0.9803922, 1, 1,
-0.04732094, -0.1203833, -1.466137, 0, 0.9764706, 1, 1,
-0.04032531, -0.4906799, -3.58373, 0, 0.9686275, 1, 1,
-0.0400045, -0.1035088, -2.227446, 0, 0.9647059, 1, 1,
-0.03927539, 0.1458193, -1.058363, 0, 0.9568627, 1, 1,
-0.03911961, -0.4391441, -3.414622, 0, 0.9529412, 1, 1,
-0.03837952, 0.06093782, -1.642269, 0, 0.945098, 1, 1,
-0.03158547, 1.168, -1.417567, 0, 0.9411765, 1, 1,
-0.02988784, -0.7839739, -1.725671, 0, 0.9333333, 1, 1,
-0.02761006, 0.5089698, 0.008554739, 0, 0.9294118, 1, 1,
-0.02414678, -0.001121741, -1.402305, 0, 0.9215686, 1, 1,
-0.01849766, -0.7974841, -2.365839, 0, 0.9176471, 1, 1,
-0.01147785, -1.030828, -2.674261, 0, 0.9098039, 1, 1,
-0.005202348, 0.9284465, 0.8741759, 0, 0.9058824, 1, 1,
-0.001143359, -1.040675, -2.207962, 0, 0.8980392, 1, 1,
0.001246862, -0.7051609, 2.34542, 0, 0.8901961, 1, 1,
0.003346446, 0.1126165, -1.259663, 0, 0.8862745, 1, 1,
0.009374052, 1.644556, -0.009519612, 0, 0.8784314, 1, 1,
0.01166256, -0.7739037, 2.553996, 0, 0.8745098, 1, 1,
0.01369744, 1.159351, -0.2446906, 0, 0.8666667, 1, 1,
0.01671233, -0.6067759, 3.228371, 0, 0.8627451, 1, 1,
0.01710357, -2.130941, 2.335143, 0, 0.854902, 1, 1,
0.02498776, -0.645132, 4.295412, 0, 0.8509804, 1, 1,
0.02766262, 1.194375, 0.7838823, 0, 0.8431373, 1, 1,
0.03016429, 0.5456768, 1.103102, 0, 0.8392157, 1, 1,
0.03219943, -0.8949137, 3.17116, 0, 0.8313726, 1, 1,
0.0332429, -2.343823, 4.187921, 0, 0.827451, 1, 1,
0.03417779, -0.3142264, 4.004912, 0, 0.8196079, 1, 1,
0.04079102, 1.250897, -0.7584558, 0, 0.8156863, 1, 1,
0.04119269, 0.5526129, -1.266826, 0, 0.8078431, 1, 1,
0.0418698, 0.5499062, 0.668569, 0, 0.8039216, 1, 1,
0.04211637, -1.223603, 4.10182, 0, 0.7960784, 1, 1,
0.04567857, 0.9595606, 0.5953409, 0, 0.7882353, 1, 1,
0.0517692, -3.416733, 3.499639, 0, 0.7843137, 1, 1,
0.05742465, 1.487066, 0.8537979, 0, 0.7764706, 1, 1,
0.05838658, 1.617636, 0.7917759, 0, 0.772549, 1, 1,
0.06414016, 0.8278342, 1.525768, 0, 0.7647059, 1, 1,
0.0649593, 0.2463994, -0.09085505, 0, 0.7607843, 1, 1,
0.06570744, 1.38971, 0.1963417, 0, 0.7529412, 1, 1,
0.06608275, 0.01080076, 0.6715699, 0, 0.7490196, 1, 1,
0.07002563, 0.4744643, -0.2190468, 0, 0.7411765, 1, 1,
0.071854, 0.1081451, -0.3307071, 0, 0.7372549, 1, 1,
0.07717347, 1.341929, 0.9970834, 0, 0.7294118, 1, 1,
0.0788144, 0.8562604, -0.7813304, 0, 0.7254902, 1, 1,
0.08204372, 1.4161, 0.9987621, 0, 0.7176471, 1, 1,
0.08264314, -0.6321022, 4.295626, 0, 0.7137255, 1, 1,
0.08473819, 0.1511681, 0.007701157, 0, 0.7058824, 1, 1,
0.08615855, 1.733271, -0.5236325, 0, 0.6980392, 1, 1,
0.09318771, 1.150206, 1.495271, 0, 0.6941177, 1, 1,
0.09509745, 1.387987, 0.2373687, 0, 0.6862745, 1, 1,
0.09703319, -0.07119337, 1.933318, 0, 0.682353, 1, 1,
0.09968248, 0.4279732, 0.736641, 0, 0.6745098, 1, 1,
0.1073435, -0.0004075395, 1.109475, 0, 0.6705883, 1, 1,
0.10904, -0.7743208, 1.431469, 0, 0.6627451, 1, 1,
0.1143727, -0.6189754, 4.60891, 0, 0.6588235, 1, 1,
0.114904, -0.9365503, 3.48428, 0, 0.6509804, 1, 1,
0.1150155, -1.432849, 2.524753, 0, 0.6470588, 1, 1,
0.1158695, 1.470814, -0.5670268, 0, 0.6392157, 1, 1,
0.1176358, -1.214255, 3.202546, 0, 0.6352941, 1, 1,
0.1190704, 0.1516392, 0.2377031, 0, 0.627451, 1, 1,
0.127349, -1.967309, 2.638435, 0, 0.6235294, 1, 1,
0.1282808, -0.3152939, 2.003291, 0, 0.6156863, 1, 1,
0.129691, 0.9567878, -1.434899, 0, 0.6117647, 1, 1,
0.132035, -1.298043, 2.694397, 0, 0.6039216, 1, 1,
0.134026, -1.397982, 1.528092, 0, 0.5960785, 1, 1,
0.1354111, -0.2720292, 2.857438, 0, 0.5921569, 1, 1,
0.138784, 0.4597411, 0.4001859, 0, 0.5843138, 1, 1,
0.1395309, -1.342099, 3.240148, 0, 0.5803922, 1, 1,
0.1459265, -0.8552982, 3.548818, 0, 0.572549, 1, 1,
0.1487235, 0.8421028, 0.379865, 0, 0.5686275, 1, 1,
0.149915, -1.484393, 1.972735, 0, 0.5607843, 1, 1,
0.1508405, -0.3819791, 2.862968, 0, 0.5568628, 1, 1,
0.1545982, -0.7317106, 3.816743, 0, 0.5490196, 1, 1,
0.1642177, 0.6252772, 1.384444, 0, 0.5450981, 1, 1,
0.172651, 0.4919876, 0.03350602, 0, 0.5372549, 1, 1,
0.176157, 0.5156944, 0.03791161, 0, 0.5333334, 1, 1,
0.1780777, -0.5170494, 3.84374, 0, 0.5254902, 1, 1,
0.1847162, 0.7454315, -0.06666992, 0, 0.5215687, 1, 1,
0.1922102, 0.3436012, 0.6765387, 0, 0.5137255, 1, 1,
0.1944144, -2.001927, 3.609705, 0, 0.509804, 1, 1,
0.1958279, -0.4901665, 1.140453, 0, 0.5019608, 1, 1,
0.1978338, -0.0617664, 2.60681, 0, 0.4941176, 1, 1,
0.1985095, 0.2245078, 2.64327, 0, 0.4901961, 1, 1,
0.1997649, 0.2845294, 1.31845, 0, 0.4823529, 1, 1,
0.2007215, -0.004095481, 0.6823613, 0, 0.4784314, 1, 1,
0.202343, -1.419616, 2.313103, 0, 0.4705882, 1, 1,
0.2046526, 0.5897716, 1.739703, 0, 0.4666667, 1, 1,
0.2090945, 0.363855, 0.1930141, 0, 0.4588235, 1, 1,
0.2096603, 0.8744273, -0.4505211, 0, 0.454902, 1, 1,
0.2115192, -0.3752162, 3.046836, 0, 0.4470588, 1, 1,
0.2136899, 0.5031465, 0.641124, 0, 0.4431373, 1, 1,
0.2148982, 0.9299635, 0.5890991, 0, 0.4352941, 1, 1,
0.2173598, -0.9287846, 4.286193, 0, 0.4313726, 1, 1,
0.2258911, -0.6357527, 2.595096, 0, 0.4235294, 1, 1,
0.2292311, -2.295697, 1.572329, 0, 0.4196078, 1, 1,
0.2317976, 0.3379497, 2.135799, 0, 0.4117647, 1, 1,
0.2323956, -0.216237, 2.653512, 0, 0.4078431, 1, 1,
0.2349222, -0.07618, 1.753708, 0, 0.4, 1, 1,
0.2353614, 0.9489998, 1.32918, 0, 0.3921569, 1, 1,
0.2369338, -0.7174199, 1.145406, 0, 0.3882353, 1, 1,
0.2426464, -0.4138832, 2.279694, 0, 0.3803922, 1, 1,
0.2452849, 1.510757, -0.5990493, 0, 0.3764706, 1, 1,
0.2465933, -0.9796144, 2.092639, 0, 0.3686275, 1, 1,
0.2480683, 1.546229, 0.3110924, 0, 0.3647059, 1, 1,
0.2492295, -0.4736427, 5.775734, 0, 0.3568628, 1, 1,
0.2552571, -2.353946, 4.097417, 0, 0.3529412, 1, 1,
0.2573176, -0.6292192, 2.704083, 0, 0.345098, 1, 1,
0.2577739, 0.8234693, 2.076495, 0, 0.3411765, 1, 1,
0.2600938, -0.3028382, 2.388801, 0, 0.3333333, 1, 1,
0.2656934, 0.8014272, 1.489479, 0, 0.3294118, 1, 1,
0.2676698, -0.2700229, 2.16616, 0, 0.3215686, 1, 1,
0.2721339, -2.103285, 2.598752, 0, 0.3176471, 1, 1,
0.2732335, 1.378058, 0.1010217, 0, 0.3098039, 1, 1,
0.2799582, 0.6807812, 0.3239784, 0, 0.3058824, 1, 1,
0.2834305, 0.8116685, -0.6024314, 0, 0.2980392, 1, 1,
0.284574, 0.540449, 1.032077, 0, 0.2901961, 1, 1,
0.284899, 0.3689395, 0.1736698, 0, 0.2862745, 1, 1,
0.2851725, 0.6983857, 0.371305, 0, 0.2784314, 1, 1,
0.2894893, -0.9128899, 4.197158, 0, 0.2745098, 1, 1,
0.2913089, 1.444141, 0.09955676, 0, 0.2666667, 1, 1,
0.2953279, -0.3014646, 3.751447, 0, 0.2627451, 1, 1,
0.2990713, 0.20031, 1.19632, 0, 0.254902, 1, 1,
0.3019845, 0.07549646, 1.74928, 0, 0.2509804, 1, 1,
0.3186338, -0.2191381, 2.078864, 0, 0.2431373, 1, 1,
0.321122, 0.8638912, 1.67468, 0, 0.2392157, 1, 1,
0.3236542, -1.141402, 3.784602, 0, 0.2313726, 1, 1,
0.3237344, -0.355715, 5.027298, 0, 0.227451, 1, 1,
0.3243813, 0.7660348, 1.582057, 0, 0.2196078, 1, 1,
0.3270916, 1.422488, 0.2131702, 0, 0.2156863, 1, 1,
0.3321537, 2.005126, -0.9843463, 0, 0.2078431, 1, 1,
0.3330967, 1.302459, 0.6600927, 0, 0.2039216, 1, 1,
0.3391421, -1.31005, 4.242286, 0, 0.1960784, 1, 1,
0.3396254, 1.955574, 0.5452565, 0, 0.1882353, 1, 1,
0.345502, -0.01027045, 0.03992125, 0, 0.1843137, 1, 1,
0.3486283, 1.029305, -0.2164429, 0, 0.1764706, 1, 1,
0.351107, 0.7444643, 0.7954882, 0, 0.172549, 1, 1,
0.3583239, 0.9107465, 0.5173144, 0, 0.1647059, 1, 1,
0.3638307, 0.06625585, 0.8298062, 0, 0.1607843, 1, 1,
0.3656831, -1.669523, 3.501611, 0, 0.1529412, 1, 1,
0.3663696, 0.8972355, 1.786802, 0, 0.1490196, 1, 1,
0.3747615, -0.4991297, 3.168172, 0, 0.1411765, 1, 1,
0.376293, -1.089069, 1.738519, 0, 0.1372549, 1, 1,
0.3813714, -1.662612, 3.018603, 0, 0.1294118, 1, 1,
0.3825363, 2.051288, -0.6563861, 0, 0.1254902, 1, 1,
0.3880765, 0.1778163, 1.097187, 0, 0.1176471, 1, 1,
0.394673, -0.4019592, 0.2221918, 0, 0.1137255, 1, 1,
0.396636, -0.4208083, 0.8494955, 0, 0.1058824, 1, 1,
0.3969561, 0.9322172, 3.706871, 0, 0.09803922, 1, 1,
0.3999963, -1.165634, 4.759794, 0, 0.09411765, 1, 1,
0.4011892, 0.307892, 0.7335538, 0, 0.08627451, 1, 1,
0.4019579, 1.112107, 0.1801123, 0, 0.08235294, 1, 1,
0.4023353, 0.9133714, 1.988717, 0, 0.07450981, 1, 1,
0.4105147, -0.07987987, 1.239333, 0, 0.07058824, 1, 1,
0.4146451, 0.354723, -0.6302682, 0, 0.0627451, 1, 1,
0.415701, 0.3240592, 1.812893, 0, 0.05882353, 1, 1,
0.4160688, -0.5596628, 2.511107, 0, 0.05098039, 1, 1,
0.4180286, -2.00892, 1.761736, 0, 0.04705882, 1, 1,
0.420431, -1.371793, 2.570472, 0, 0.03921569, 1, 1,
0.4205592, -0.3041175, 3.131033, 0, 0.03529412, 1, 1,
0.4207269, 0.3098833, 1.425373, 0, 0.02745098, 1, 1,
0.4232874, 0.3940183, -0.0009448112, 0, 0.02352941, 1, 1,
0.4252083, 1.238722, -1.016766, 0, 0.01568628, 1, 1,
0.4277593, 1.276675, -0.08150547, 0, 0.01176471, 1, 1,
0.4367754, -0.03067102, 0.4104057, 0, 0.003921569, 1, 1,
0.4378112, 0.5421667, 0.8574741, 0.003921569, 0, 1, 1,
0.4400356, -0.6548274, 3.487216, 0.007843138, 0, 1, 1,
0.4405078, -0.407733, 2.272857, 0.01568628, 0, 1, 1,
0.4416242, -2.664807, 2.240707, 0.01960784, 0, 1, 1,
0.4489895, -1.816702, 3.091226, 0.02745098, 0, 1, 1,
0.4505464, 1.402136, -0.5233585, 0.03137255, 0, 1, 1,
0.4511941, -1.662704, 2.605941, 0.03921569, 0, 1, 1,
0.4537126, -1.280775, 2.702603, 0.04313726, 0, 1, 1,
0.4558699, -0.7213345, 4.424072, 0.05098039, 0, 1, 1,
0.4569517, -1.604693, 3.758654, 0.05490196, 0, 1, 1,
0.4608821, -0.9275287, 3.091746, 0.0627451, 0, 1, 1,
0.4646389, 1.322178, -0.172338, 0.06666667, 0, 1, 1,
0.4664285, 1.471884, 2.518519, 0.07450981, 0, 1, 1,
0.4688043, -0.6702171, 4.77335, 0.07843138, 0, 1, 1,
0.4727152, 0.6269282, -1.373693, 0.08627451, 0, 1, 1,
0.4730165, -1.29518, 3.631592, 0.09019608, 0, 1, 1,
0.4752582, -0.2280679, 3.13625, 0.09803922, 0, 1, 1,
0.4797073, -0.1075893, 1.84799, 0.1058824, 0, 1, 1,
0.483191, -0.667321, 2.17004, 0.1098039, 0, 1, 1,
0.4834763, -0.04745514, 0.4525466, 0.1176471, 0, 1, 1,
0.4852617, -0.1581173, 2.453973, 0.1215686, 0, 1, 1,
0.4855991, 0.2076587, 0.3316977, 0.1294118, 0, 1, 1,
0.4899931, -0.8536803, 1.124792, 0.1333333, 0, 1, 1,
0.4900524, 0.9458945, -0.3127008, 0.1411765, 0, 1, 1,
0.4955992, 0.1473097, 0.1921229, 0.145098, 0, 1, 1,
0.495811, -1.671345, 3.19817, 0.1529412, 0, 1, 1,
0.4962051, 0.6599492, 0.2855615, 0.1568628, 0, 1, 1,
0.4992253, 0.4581816, 0.2771699, 0.1647059, 0, 1, 1,
0.5047824, -0.7994594, 3.495228, 0.1686275, 0, 1, 1,
0.5052465, -0.7040142, 3.142685, 0.1764706, 0, 1, 1,
0.5085195, 0.7129701, 0.7885454, 0.1803922, 0, 1, 1,
0.5118893, 1.331561, -1.055135, 0.1882353, 0, 1, 1,
0.5129183, -0.6325284, 2.03618, 0.1921569, 0, 1, 1,
0.5169894, -0.8876605, 1.567864, 0.2, 0, 1, 1,
0.5194153, -0.2611869, 3.475965, 0.2078431, 0, 1, 1,
0.5208981, -1.309262, 2.295762, 0.2117647, 0, 1, 1,
0.526565, 0.1232239, -0.2043323, 0.2196078, 0, 1, 1,
0.528775, 1.538196, 2.202036, 0.2235294, 0, 1, 1,
0.5338141, -0.3700229, 0.8184908, 0.2313726, 0, 1, 1,
0.536921, -0.08289467, 0.2446371, 0.2352941, 0, 1, 1,
0.542622, 0.3713035, 1.24424, 0.2431373, 0, 1, 1,
0.5494709, -0.3160136, 3.554849, 0.2470588, 0, 1, 1,
0.5519115, -0.3910267, 1.399291, 0.254902, 0, 1, 1,
0.5549502, 0.3184647, 0.4101062, 0.2588235, 0, 1, 1,
0.5612905, -0.7122587, 4.308886, 0.2666667, 0, 1, 1,
0.5624866, -0.1666934, 1.298112, 0.2705882, 0, 1, 1,
0.5657666, 0.0003632476, 0.3416546, 0.2784314, 0, 1, 1,
0.5658247, -0.1275452, 2.326843, 0.282353, 0, 1, 1,
0.566567, 0.09756757, 1.804133, 0.2901961, 0, 1, 1,
0.5672282, -0.9197164, 3.612115, 0.2941177, 0, 1, 1,
0.5686218, 1.741564, -0.3211342, 0.3019608, 0, 1, 1,
0.5697439, 0.8207263, 0.9126573, 0.3098039, 0, 1, 1,
0.5703077, -0.3248107, 3.553966, 0.3137255, 0, 1, 1,
0.5735919, 0.03517061, 1.747054, 0.3215686, 0, 1, 1,
0.5753205, -1.269625, 2.591569, 0.3254902, 0, 1, 1,
0.5874826, -1.051587, 2.129098, 0.3333333, 0, 1, 1,
0.5905293, 0.5746693, 0.8656266, 0.3372549, 0, 1, 1,
0.5919698, -0.2098493, 1.905129, 0.345098, 0, 1, 1,
0.59326, -0.4409357, 1.682557, 0.3490196, 0, 1, 1,
0.593712, -1.629067, 3.234609, 0.3568628, 0, 1, 1,
0.5939565, -0.6026572, 2.36838, 0.3607843, 0, 1, 1,
0.5950419, 0.07954585, 2.603354, 0.3686275, 0, 1, 1,
0.596302, -0.7539911, 1.199961, 0.372549, 0, 1, 1,
0.5969607, 0.2976349, 1.944379, 0.3803922, 0, 1, 1,
0.6047625, -0.9566377, 1.730797, 0.3843137, 0, 1, 1,
0.6054292, -1.950573, 2.447504, 0.3921569, 0, 1, 1,
0.6104345, -0.8364463, 3.382043, 0.3960784, 0, 1, 1,
0.6104633, 0.108716, 1.845487, 0.4039216, 0, 1, 1,
0.6111755, -0.735759, 2.681616, 0.4117647, 0, 1, 1,
0.6161082, 1.048659, -0.9888778, 0.4156863, 0, 1, 1,
0.6219167, 0.7045984, -0.3261658, 0.4235294, 0, 1, 1,
0.6250836, 2.27494, 1.562298, 0.427451, 0, 1, 1,
0.6260518, -0.4023251, 2.637608, 0.4352941, 0, 1, 1,
0.6281413, -1.268453, 2.559003, 0.4392157, 0, 1, 1,
0.6298898, -0.741465, 3.721117, 0.4470588, 0, 1, 1,
0.6319575, 0.2803739, 1.927619, 0.4509804, 0, 1, 1,
0.6340695, -0.2990885, 2.93463, 0.4588235, 0, 1, 1,
0.6406379, 0.1093876, 2.114212, 0.4627451, 0, 1, 1,
0.6415616, 0.9509538, 2.79199, 0.4705882, 0, 1, 1,
0.644367, 0.7535709, 1.999251, 0.4745098, 0, 1, 1,
0.6469144, 1.016418, 2.481709, 0.4823529, 0, 1, 1,
0.6507894, -0.1639677, 1.536051, 0.4862745, 0, 1, 1,
0.652383, -0.1571625, 0.7750174, 0.4941176, 0, 1, 1,
0.6555519, 0.4220953, 1.120783, 0.5019608, 0, 1, 1,
0.6589807, 0.5722895, -0.2529873, 0.5058824, 0, 1, 1,
0.6616219, 0.1510501, 2.809059, 0.5137255, 0, 1, 1,
0.6690561, -0.3705056, 3.457411, 0.5176471, 0, 1, 1,
0.6729645, -1.039818, 1.846918, 0.5254902, 0, 1, 1,
0.6815546, -0.3517468, 2.782295, 0.5294118, 0, 1, 1,
0.6824752, -0.5876116, 1.89662, 0.5372549, 0, 1, 1,
0.6865329, 0.6851876, 0.324089, 0.5411765, 0, 1, 1,
0.6886546, 0.4440372, 1.839807, 0.5490196, 0, 1, 1,
0.6907806, -0.1882522, 1.584239, 0.5529412, 0, 1, 1,
0.6912252, 0.09667641, 1.404384, 0.5607843, 0, 1, 1,
0.6923866, -0.3047659, 2.445784, 0.5647059, 0, 1, 1,
0.6984002, -0.3285064, 3.653637, 0.572549, 0, 1, 1,
0.7044566, -0.09788779, 2.455935, 0.5764706, 0, 1, 1,
0.7187026, -0.745864, 1.548856, 0.5843138, 0, 1, 1,
0.722035, 0.1114648, 1.174968, 0.5882353, 0, 1, 1,
0.7272915, 0.2799007, 3.031802, 0.5960785, 0, 1, 1,
0.7407261, 1.142719, 1.588989, 0.6039216, 0, 1, 1,
0.7425615, -0.8124546, 2.013814, 0.6078432, 0, 1, 1,
0.7429835, 0.1718407, 3.096013, 0.6156863, 0, 1, 1,
0.7450009, -0.5888534, 2.612048, 0.6196079, 0, 1, 1,
0.746922, -0.02338323, 1.686549, 0.627451, 0, 1, 1,
0.7472851, -0.02842547, 2.794197, 0.6313726, 0, 1, 1,
0.7519644, -2.121814, 3.556528, 0.6392157, 0, 1, 1,
0.7672551, -0.3847946, 3.159678, 0.6431373, 0, 1, 1,
0.7673395, -1.446785, 4.278389, 0.6509804, 0, 1, 1,
0.7711312, 0.5396123, -0.09495635, 0.654902, 0, 1, 1,
0.7738026, -1.523774, 1.396642, 0.6627451, 0, 1, 1,
0.773939, 1.567605, -0.5440623, 0.6666667, 0, 1, 1,
0.7806436, 0.2715283, 0.5755926, 0.6745098, 0, 1, 1,
0.7813062, -0.5904053, 2.413132, 0.6784314, 0, 1, 1,
0.7827613, -0.5049644, 2.20198, 0.6862745, 0, 1, 1,
0.785031, -0.7892199, 1.832183, 0.6901961, 0, 1, 1,
0.7877303, -0.3922781, 3.187845, 0.6980392, 0, 1, 1,
0.7933657, 1.619605, -0.3623506, 0.7058824, 0, 1, 1,
0.7961794, -0.9326351, 3.450169, 0.7098039, 0, 1, 1,
0.7969376, -1.713521, 2.843268, 0.7176471, 0, 1, 1,
0.8010815, 0.01648435, 3.213908, 0.7215686, 0, 1, 1,
0.8035728, -0.1260293, 1.447273, 0.7294118, 0, 1, 1,
0.8044254, -0.4576532, 1.602891, 0.7333333, 0, 1, 1,
0.808654, 1.289746, 1.610331, 0.7411765, 0, 1, 1,
0.8112546, -0.6504326, 2.378084, 0.7450981, 0, 1, 1,
0.8128942, -1.301449, 4.252553, 0.7529412, 0, 1, 1,
0.8171542, 1.608816, 0.264404, 0.7568628, 0, 1, 1,
0.8178657, -0.8167084, -0.07692853, 0.7647059, 0, 1, 1,
0.8227901, -0.1462164, 1.732393, 0.7686275, 0, 1, 1,
0.8236191, 0.02952194, 2.694932, 0.7764706, 0, 1, 1,
0.8322151, 0.263895, 1.598617, 0.7803922, 0, 1, 1,
0.837325, -1.39303, 2.621732, 0.7882353, 0, 1, 1,
0.8406503, 1.516056, 0.08317118, 0.7921569, 0, 1, 1,
0.8425639, 0.001007687, 0.8377678, 0.8, 0, 1, 1,
0.8446057, 0.6752009, 0.823895, 0.8078431, 0, 1, 1,
0.8498501, 0.6387143, 0.8616135, 0.8117647, 0, 1, 1,
0.8499656, 0.7513883, -0.5726091, 0.8196079, 0, 1, 1,
0.8606881, -1.420786, 2.029476, 0.8235294, 0, 1, 1,
0.8644673, -0.1909457, 1.263725, 0.8313726, 0, 1, 1,
0.8702808, 0.21931, 1.208709, 0.8352941, 0, 1, 1,
0.8753257, 0.6422585, 0.2695053, 0.8431373, 0, 1, 1,
0.8816609, -0.7321824, 0.8712791, 0.8470588, 0, 1, 1,
0.8852589, -0.2933827, 0.2570291, 0.854902, 0, 1, 1,
0.8853282, 1.313426, -0.2750819, 0.8588235, 0, 1, 1,
0.8943421, -0.4013954, 0.9785749, 0.8666667, 0, 1, 1,
0.8958914, 1.184855, 0.9564078, 0.8705882, 0, 1, 1,
0.8968184, 0.8796411, -0.1573588, 0.8784314, 0, 1, 1,
0.9034661, 0.5920779, 1.30906, 0.8823529, 0, 1, 1,
0.9069483, 1.258114, -0.2932485, 0.8901961, 0, 1, 1,
0.9101474, 0.260489, 0.1615584, 0.8941177, 0, 1, 1,
0.9173277, 0.3284399, -0.3297775, 0.9019608, 0, 1, 1,
0.9330897, 0.206801, 1.030375, 0.9098039, 0, 1, 1,
0.9407798, 0.5505694, 0.5517672, 0.9137255, 0, 1, 1,
0.9466447, 0.5624304, 2.023848, 0.9215686, 0, 1, 1,
0.9483904, -0.6043298, 2.446403, 0.9254902, 0, 1, 1,
0.959866, -1.279444, 3.712478, 0.9333333, 0, 1, 1,
0.9617094, -0.721735, 1.84532, 0.9372549, 0, 1, 1,
0.9637133, -0.1856468, 0.6663926, 0.945098, 0, 1, 1,
0.9643347, 0.1549233, 3.627832, 0.9490196, 0, 1, 1,
0.9693035, 0.7830085, 0.8460664, 0.9568627, 0, 1, 1,
0.9703404, 0.7618327, 2.196666, 0.9607843, 0, 1, 1,
0.9756988, -0.5905115, 3.007249, 0.9686275, 0, 1, 1,
0.9766391, -0.9176134, 2.103057, 0.972549, 0, 1, 1,
0.9833618, -0.4714464, 2.493217, 0.9803922, 0, 1, 1,
0.9835613, 0.3543476, 1.441598, 0.9843137, 0, 1, 1,
0.9883068, 1.264012, 0.999629, 0.9921569, 0, 1, 1,
0.9888225, 1.046062, -0.158495, 0.9960784, 0, 1, 1,
0.9957865, -0.180634, 1.263334, 1, 0, 0.9960784, 1,
0.9960145, 0.2199851, 2.487198, 1, 0, 0.9882353, 1,
0.9992765, -0.3140109, 2.832647, 1, 0, 0.9843137, 1,
1.000699, -0.01720708, 0.1658696, 1, 0, 0.9764706, 1,
1.003503, 0.2270773, -1.607207, 1, 0, 0.972549, 1,
1.015817, -1.722635, 2.982153, 1, 0, 0.9647059, 1,
1.018254, 1.108048, 1.216081, 1, 0, 0.9607843, 1,
1.023816, 0.481746, -0.04101387, 1, 0, 0.9529412, 1,
1.030724, -0.6669904, 1.477374, 1, 0, 0.9490196, 1,
1.034113, -1.78595, 3.884013, 1, 0, 0.9411765, 1,
1.040048, 1.310765, 1.525444, 1, 0, 0.9372549, 1,
1.041287, -0.4315667, 0.04088017, 1, 0, 0.9294118, 1,
1.041989, -0.7654175, 2.803369, 1, 0, 0.9254902, 1,
1.042141, -1.058647, 2.693101, 1, 0, 0.9176471, 1,
1.042734, -0.9662421, 2.5553, 1, 0, 0.9137255, 1,
1.042736, 1.556488, 1.792656, 1, 0, 0.9058824, 1,
1.052037, 1.008283, 0.621123, 1, 0, 0.9019608, 1,
1.060196, -0.6862903, 2.061899, 1, 0, 0.8941177, 1,
1.062463, -0.1699694, 1.980614, 1, 0, 0.8862745, 1,
1.066243, 0.3554583, 0.3888518, 1, 0, 0.8823529, 1,
1.068072, 0.3559117, 2.300843, 1, 0, 0.8745098, 1,
1.079916, 0.6430834, -0.1771876, 1, 0, 0.8705882, 1,
1.081976, -1.671, 3.693924, 1, 0, 0.8627451, 1,
1.08407, -0.471574, 2.675681, 1, 0, 0.8588235, 1,
1.086089, -1.342083, 3.704901, 1, 0, 0.8509804, 1,
1.088181, -0.3611558, 2.042943, 1, 0, 0.8470588, 1,
1.089365, 0.6066474, 1.110383, 1, 0, 0.8392157, 1,
1.097788, -0.2525891, 2.775396, 1, 0, 0.8352941, 1,
1.101752, 1.020189, 2.065484, 1, 0, 0.827451, 1,
1.107331, -0.412285, 2.60967, 1, 0, 0.8235294, 1,
1.111733, -0.3529535, 1.748947, 1, 0, 0.8156863, 1,
1.119196, -0.1367082, 0.9968444, 1, 0, 0.8117647, 1,
1.122941, -1.182921, 3.225028, 1, 0, 0.8039216, 1,
1.123955, -0.8691424, 1.840009, 1, 0, 0.7960784, 1,
1.127247, 1.622627, 1.610265, 1, 0, 0.7921569, 1,
1.138748, -0.4737674, 1.296775, 1, 0, 0.7843137, 1,
1.144909, 0.2872229, 1.262189, 1, 0, 0.7803922, 1,
1.145027, -0.7618451, 1.948413, 1, 0, 0.772549, 1,
1.156889, -1.116253, 1.215276, 1, 0, 0.7686275, 1,
1.160756, -0.3068465, 2.592149, 1, 0, 0.7607843, 1,
1.161063, 0.07327808, 0.7445797, 1, 0, 0.7568628, 1,
1.162127, -0.1057999, 2.095485, 1, 0, 0.7490196, 1,
1.16712, -0.07400909, 2.280309, 1, 0, 0.7450981, 1,
1.169894, -0.5394069, 1.508659, 1, 0, 0.7372549, 1,
1.170355, 0.283724, 1.682619, 1, 0, 0.7333333, 1,
1.183113, -1.010622, 2.324404, 1, 0, 0.7254902, 1,
1.187226, 0.03832612, 0.8920339, 1, 0, 0.7215686, 1,
1.1902, 1.591846, 0.9965298, 1, 0, 0.7137255, 1,
1.192493, 1.545468, 0.7479493, 1, 0, 0.7098039, 1,
1.196492, -0.941986, 2.776689, 1, 0, 0.7019608, 1,
1.196585, -1.28158, 2.710779, 1, 0, 0.6941177, 1,
1.200268, -1.76141, 1.83967, 1, 0, 0.6901961, 1,
1.208799, -0.3889467, 1.834659, 1, 0, 0.682353, 1,
1.209401, -1.083813, 1.85118, 1, 0, 0.6784314, 1,
1.211848, 1.051163, 1.622384, 1, 0, 0.6705883, 1,
1.213484, -0.1816265, 1.917254, 1, 0, 0.6666667, 1,
1.213708, -2.123655, 2.585365, 1, 0, 0.6588235, 1,
1.21372, 0.3756188, 1.349542, 1, 0, 0.654902, 1,
1.218128, 0.621982, 2.384356, 1, 0, 0.6470588, 1,
1.218247, 0.9529965, 1.843673, 1, 0, 0.6431373, 1,
1.221536, 0.981022, 1.131152, 1, 0, 0.6352941, 1,
1.222676, -0.03988705, 1.91168, 1, 0, 0.6313726, 1,
1.225621, -0.2624177, -0.2879817, 1, 0, 0.6235294, 1,
1.229733, -1.650972, 1.407896, 1, 0, 0.6196079, 1,
1.230914, -1.324105, 2.753357, 1, 0, 0.6117647, 1,
1.231921, -1.684407, 2.479943, 1, 0, 0.6078432, 1,
1.235814, -0.6368259, 2.18392, 1, 0, 0.6, 1,
1.245716, 0.2065119, 1.111871, 1, 0, 0.5921569, 1,
1.254092, 0.2854356, 0.5581242, 1, 0, 0.5882353, 1,
1.257728, -1.181263, 1.489848, 1, 0, 0.5803922, 1,
1.25802, 1.863804, 1.854416, 1, 0, 0.5764706, 1,
1.262788, 0.6429389, 1.869362, 1, 0, 0.5686275, 1,
1.270339, 0.2859068, 0.5910511, 1, 0, 0.5647059, 1,
1.283311, -1.354384, 2.679996, 1, 0, 0.5568628, 1,
1.295015, 0.9699198, 2.46064, 1, 0, 0.5529412, 1,
1.296723, -0.2326716, 1.475538, 1, 0, 0.5450981, 1,
1.308683, 1.051525, 1.683462, 1, 0, 0.5411765, 1,
1.326408, -0.9041507, 2.908463, 1, 0, 0.5333334, 1,
1.33389, 0.4772219, 0.4832073, 1, 0, 0.5294118, 1,
1.334501, -0.0213225, 2.710301, 1, 0, 0.5215687, 1,
1.342652, 0.1884897, 0.6996362, 1, 0, 0.5176471, 1,
1.342891, 1.700138, 0.6415, 1, 0, 0.509804, 1,
1.350486, 0.189721, 3.239926, 1, 0, 0.5058824, 1,
1.357422, 0.2079279, 1.413204, 1, 0, 0.4980392, 1,
1.360657, 1.593008, -1.676087, 1, 0, 0.4901961, 1,
1.367651, -1.339462, 3.667835, 1, 0, 0.4862745, 1,
1.387149, 0.6113654, 1.361801, 1, 0, 0.4784314, 1,
1.390068, -0.470034, 1.722663, 1, 0, 0.4745098, 1,
1.39417, 0.7849366, -0.2900544, 1, 0, 0.4666667, 1,
1.399189, -1.740178, 1.668382, 1, 0, 0.4627451, 1,
1.399659, 0.5373328, 0.4015906, 1, 0, 0.454902, 1,
1.408484, 0.2852743, 1.936691, 1, 0, 0.4509804, 1,
1.41362, 0.5949714, 1.346982, 1, 0, 0.4431373, 1,
1.414871, -1.854245, 1.56687, 1, 0, 0.4392157, 1,
1.41533, 0.1282582, 1.086585, 1, 0, 0.4313726, 1,
1.424868, 0.01600431, 2.15657, 1, 0, 0.427451, 1,
1.426042, 0.3983525, 1.534332, 1, 0, 0.4196078, 1,
1.451506, -0.5527682, 1.102795, 1, 0, 0.4156863, 1,
1.460029, 0.6778009, 1.557601, 1, 0, 0.4078431, 1,
1.468722, 1.372583, 1.279478, 1, 0, 0.4039216, 1,
1.473223, -0.9397596, 3.787846, 1, 0, 0.3960784, 1,
1.482471, 0.1951421, 0.4918644, 1, 0, 0.3882353, 1,
1.487155, -2.867731, 2.419482, 1, 0, 0.3843137, 1,
1.494545, 0.995847, 0.8200271, 1, 0, 0.3764706, 1,
1.49608, 0.03050139, 2.286723, 1, 0, 0.372549, 1,
1.516015, -1.079328, 3.99018, 1, 0, 0.3647059, 1,
1.516807, -1.615974, 2.934927, 1, 0, 0.3607843, 1,
1.517677, -0.637504, 2.047107, 1, 0, 0.3529412, 1,
1.518025, -1.058069, 2.531629, 1, 0, 0.3490196, 1,
1.522068, 1.30598, 0.773439, 1, 0, 0.3411765, 1,
1.543842, -0.3497618, 3.577309, 1, 0, 0.3372549, 1,
1.544418, -0.3925573, 2.254702, 1, 0, 0.3294118, 1,
1.548447, 1.651223, 0.4907673, 1, 0, 0.3254902, 1,
1.549787, 0.4082941, 1.099018, 1, 0, 0.3176471, 1,
1.560816, -0.3883797, 2.809834, 1, 0, 0.3137255, 1,
1.562594, -0.001997372, 2.206635, 1, 0, 0.3058824, 1,
1.562964, -0.6102165, 3.967269, 1, 0, 0.2980392, 1,
1.568055, -0.316412, 0.4108639, 1, 0, 0.2941177, 1,
1.57767, -0.3314805, 1.688169, 1, 0, 0.2862745, 1,
1.61126, 1.436234, 1.359355, 1, 0, 0.282353, 1,
1.614987, -0.303623, 2.33403, 1, 0, 0.2745098, 1,
1.617703, 2.260361, -0.2203448, 1, 0, 0.2705882, 1,
1.634604, -2.173302, 0.36303, 1, 0, 0.2627451, 1,
1.656915, -0.2332231, 2.277963, 1, 0, 0.2588235, 1,
1.666505, -0.7436759, 1.89982, 1, 0, 0.2509804, 1,
1.667575, -1.039505, 0.9597853, 1, 0, 0.2470588, 1,
1.672466, -1.118686, -0.7173379, 1, 0, 0.2392157, 1,
1.693725, -1.819203, 1.551763, 1, 0, 0.2352941, 1,
1.694001, 0.7925584, 0.8875287, 1, 0, 0.227451, 1,
1.709817, -0.1755149, 0.9396276, 1, 0, 0.2235294, 1,
1.719352, 1.664389, 0.1056222, 1, 0, 0.2156863, 1,
1.738378, -0.1917637, 1.033613, 1, 0, 0.2117647, 1,
1.742845, -0.2833669, 0.3690739, 1, 0, 0.2039216, 1,
1.743715, -3.412398, 3.009401, 1, 0, 0.1960784, 1,
1.763534, -1.376172, 1.623887, 1, 0, 0.1921569, 1,
1.770659, 0.1306712, 0.3576728, 1, 0, 0.1843137, 1,
1.7792, -0.1199917, -0.2686882, 1, 0, 0.1803922, 1,
1.782465, 1.432327, 1.881882, 1, 0, 0.172549, 1,
1.786115, -0.3076378, 2.309181, 1, 0, 0.1686275, 1,
1.800546, 1.257825, 0.1048009, 1, 0, 0.1607843, 1,
1.820014, 1.227124, 1.229752, 1, 0, 0.1568628, 1,
1.825181, 1.255473, 0.7794436, 1, 0, 0.1490196, 1,
1.828044, 0.1044067, 0.8065111, 1, 0, 0.145098, 1,
1.856134, 0.4412944, 1.90613, 1, 0, 0.1372549, 1,
1.870299, 0.1336608, 0.4564289, 1, 0, 0.1333333, 1,
1.871484, 1.219706, 0.4396791, 1, 0, 0.1254902, 1,
1.91879, -0.320731, 2.399915, 1, 0, 0.1215686, 1,
1.920257, 0.02486286, 1.906483, 1, 0, 0.1137255, 1,
1.947786, -0.5536052, 0.178676, 1, 0, 0.1098039, 1,
1.980904, -0.4402264, 0.852743, 1, 0, 0.1019608, 1,
1.982834, -0.3699123, 1.298026, 1, 0, 0.09411765, 1,
1.983158, -0.9523951, 2.457723, 1, 0, 0.09019608, 1,
2.001476, 0.6918651, 3.226015, 1, 0, 0.08235294, 1,
2.002486, -0.6670439, 2.414689, 1, 0, 0.07843138, 1,
2.011217, -0.01885247, 0.3145524, 1, 0, 0.07058824, 1,
2.101938, 0.9543704, 0.8912721, 1, 0, 0.06666667, 1,
2.119514, 0.2736734, 1.399417, 1, 0, 0.05882353, 1,
2.145834, -0.07411424, 1.247895, 1, 0, 0.05490196, 1,
2.169713, 0.3078375, 3.717949, 1, 0, 0.04705882, 1,
2.180804, -1.559607, 1.32986, 1, 0, 0.04313726, 1,
2.226928, 0.3386366, 1.898606, 1, 0, 0.03529412, 1,
2.430018, -1.010605, 1.289647, 1, 0, 0.03137255, 1,
2.514015, -1.521101, 3.897116, 1, 0, 0.02352941, 1,
2.594848, 0.4109981, 1.805497, 1, 0, 0.01960784, 1,
2.60792, 2.554428, 1.366244, 1, 0, 0.01176471, 1,
2.660392, 0.5302252, 3.057907, 1, 0, 0.007843138, 1
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
-0.1265568, -4.459788, -8.081021, 0, -0.5, 0.5, 0.5,
-0.1265568, -4.459788, -8.081021, 1, -0.5, 0.5, 0.5,
-0.1265568, -4.459788, -8.081021, 1, 1.5, 0.5, 0.5,
-0.1265568, -4.459788, -8.081021, 0, 1.5, 0.5, 0.5
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
-3.858281, -0.339874, -8.081021, 0, -0.5, 0.5, 0.5,
-3.858281, -0.339874, -8.081021, 1, -0.5, 0.5, 0.5,
-3.858281, -0.339874, -8.081021, 1, 1.5, 0.5, 0.5,
-3.858281, -0.339874, -8.081021, 0, 1.5, 0.5, 0.5
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
-3.858281, -4.459788, -0.1484878, 0, -0.5, 0.5, 0.5,
-3.858281, -4.459788, -0.1484878, 1, -0.5, 0.5, 0.5,
-3.858281, -4.459788, -0.1484878, 1, 1.5, 0.5, 0.5,
-3.858281, -4.459788, -0.1484878, 0, 1.5, 0.5, 0.5
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
-2, -3.509038, -6.250437,
2, -3.509038, -6.250437,
-2, -3.509038, -6.250437,
-2, -3.667497, -6.555534,
-1, -3.509038, -6.250437,
-1, -3.667497, -6.555534,
0, -3.509038, -6.250437,
0, -3.667497, -6.555534,
1, -3.509038, -6.250437,
1, -3.667497, -6.555534,
2, -3.509038, -6.250437,
2, -3.667497, -6.555534
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
-2, -3.984413, -7.165729, 0, -0.5, 0.5, 0.5,
-2, -3.984413, -7.165729, 1, -0.5, 0.5, 0.5,
-2, -3.984413, -7.165729, 1, 1.5, 0.5, 0.5,
-2, -3.984413, -7.165729, 0, 1.5, 0.5, 0.5,
-1, -3.984413, -7.165729, 0, -0.5, 0.5, 0.5,
-1, -3.984413, -7.165729, 1, -0.5, 0.5, 0.5,
-1, -3.984413, -7.165729, 1, 1.5, 0.5, 0.5,
-1, -3.984413, -7.165729, 0, 1.5, 0.5, 0.5,
0, -3.984413, -7.165729, 0, -0.5, 0.5, 0.5,
0, -3.984413, -7.165729, 1, -0.5, 0.5, 0.5,
0, -3.984413, -7.165729, 1, 1.5, 0.5, 0.5,
0, -3.984413, -7.165729, 0, 1.5, 0.5, 0.5,
1, -3.984413, -7.165729, 0, -0.5, 0.5, 0.5,
1, -3.984413, -7.165729, 1, -0.5, 0.5, 0.5,
1, -3.984413, -7.165729, 1, 1.5, 0.5, 0.5,
1, -3.984413, -7.165729, 0, 1.5, 0.5, 0.5,
2, -3.984413, -7.165729, 0, -0.5, 0.5, 0.5,
2, -3.984413, -7.165729, 1, -0.5, 0.5, 0.5,
2, -3.984413, -7.165729, 1, 1.5, 0.5, 0.5,
2, -3.984413, -7.165729, 0, 1.5, 0.5, 0.5
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
-2.997114, -3, -6.250437,
-2.997114, 2, -6.250437,
-2.997114, -3, -6.250437,
-3.140642, -3, -6.555534,
-2.997114, -2, -6.250437,
-3.140642, -2, -6.555534,
-2.997114, -1, -6.250437,
-3.140642, -1, -6.555534,
-2.997114, 0, -6.250437,
-3.140642, 0, -6.555534,
-2.997114, 1, -6.250437,
-3.140642, 1, -6.555534,
-2.997114, 2, -6.250437,
-3.140642, 2, -6.555534
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
-3.427698, -3, -7.165729, 0, -0.5, 0.5, 0.5,
-3.427698, -3, -7.165729, 1, -0.5, 0.5, 0.5,
-3.427698, -3, -7.165729, 1, 1.5, 0.5, 0.5,
-3.427698, -3, -7.165729, 0, 1.5, 0.5, 0.5,
-3.427698, -2, -7.165729, 0, -0.5, 0.5, 0.5,
-3.427698, -2, -7.165729, 1, -0.5, 0.5, 0.5,
-3.427698, -2, -7.165729, 1, 1.5, 0.5, 0.5,
-3.427698, -2, -7.165729, 0, 1.5, 0.5, 0.5,
-3.427698, -1, -7.165729, 0, -0.5, 0.5, 0.5,
-3.427698, -1, -7.165729, 1, -0.5, 0.5, 0.5,
-3.427698, -1, -7.165729, 1, 1.5, 0.5, 0.5,
-3.427698, -1, -7.165729, 0, 1.5, 0.5, 0.5,
-3.427698, 0, -7.165729, 0, -0.5, 0.5, 0.5,
-3.427698, 0, -7.165729, 1, -0.5, 0.5, 0.5,
-3.427698, 0, -7.165729, 1, 1.5, 0.5, 0.5,
-3.427698, 0, -7.165729, 0, 1.5, 0.5, 0.5,
-3.427698, 1, -7.165729, 0, -0.5, 0.5, 0.5,
-3.427698, 1, -7.165729, 1, -0.5, 0.5, 0.5,
-3.427698, 1, -7.165729, 1, 1.5, 0.5, 0.5,
-3.427698, 1, -7.165729, 0, 1.5, 0.5, 0.5,
-3.427698, 2, -7.165729, 0, -0.5, 0.5, 0.5,
-3.427698, 2, -7.165729, 1, -0.5, 0.5, 0.5,
-3.427698, 2, -7.165729, 1, 1.5, 0.5, 0.5,
-3.427698, 2, -7.165729, 0, 1.5, 0.5, 0.5
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
-2.997114, -3.509038, -6,
-2.997114, -3.509038, 4,
-2.997114, -3.509038, -6,
-3.140642, -3.667497, -6,
-2.997114, -3.509038, -4,
-3.140642, -3.667497, -4,
-2.997114, -3.509038, -2,
-3.140642, -3.667497, -2,
-2.997114, -3.509038, 0,
-3.140642, -3.667497, 0,
-2.997114, -3.509038, 2,
-3.140642, -3.667497, 2,
-2.997114, -3.509038, 4,
-3.140642, -3.667497, 4
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
-3.427698, -3.984413, -6, 0, -0.5, 0.5, 0.5,
-3.427698, -3.984413, -6, 1, -0.5, 0.5, 0.5,
-3.427698, -3.984413, -6, 1, 1.5, 0.5, 0.5,
-3.427698, -3.984413, -6, 0, 1.5, 0.5, 0.5,
-3.427698, -3.984413, -4, 0, -0.5, 0.5, 0.5,
-3.427698, -3.984413, -4, 1, -0.5, 0.5, 0.5,
-3.427698, -3.984413, -4, 1, 1.5, 0.5, 0.5,
-3.427698, -3.984413, -4, 0, 1.5, 0.5, 0.5,
-3.427698, -3.984413, -2, 0, -0.5, 0.5, 0.5,
-3.427698, -3.984413, -2, 1, -0.5, 0.5, 0.5,
-3.427698, -3.984413, -2, 1, 1.5, 0.5, 0.5,
-3.427698, -3.984413, -2, 0, 1.5, 0.5, 0.5,
-3.427698, -3.984413, 0, 0, -0.5, 0.5, 0.5,
-3.427698, -3.984413, 0, 1, -0.5, 0.5, 0.5,
-3.427698, -3.984413, 0, 1, 1.5, 0.5, 0.5,
-3.427698, -3.984413, 0, 0, 1.5, 0.5, 0.5,
-3.427698, -3.984413, 2, 0, -0.5, 0.5, 0.5,
-3.427698, -3.984413, 2, 1, -0.5, 0.5, 0.5,
-3.427698, -3.984413, 2, 1, 1.5, 0.5, 0.5,
-3.427698, -3.984413, 2, 0, 1.5, 0.5, 0.5,
-3.427698, -3.984413, 4, 0, -0.5, 0.5, 0.5,
-3.427698, -3.984413, 4, 1, -0.5, 0.5, 0.5,
-3.427698, -3.984413, 4, 1, 1.5, 0.5, 0.5,
-3.427698, -3.984413, 4, 0, 1.5, 0.5, 0.5
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
-2.997114, -3.509038, -6.250437,
-2.997114, 2.82929, -6.250437,
-2.997114, -3.509038, 5.953461,
-2.997114, 2.82929, 5.953461,
-2.997114, -3.509038, -6.250437,
-2.997114, -3.509038, 5.953461,
-2.997114, 2.82929, -6.250437,
-2.997114, 2.82929, 5.953461,
-2.997114, -3.509038, -6.250437,
2.744, -3.509038, -6.250437,
-2.997114, -3.509038, 5.953461,
2.744, -3.509038, 5.953461,
-2.997114, 2.82929, -6.250437,
2.744, 2.82929, -6.250437,
-2.997114, 2.82929, 5.953461,
2.744, 2.82929, 5.953461,
2.744, -3.509038, -6.250437,
2.744, 2.82929, -6.250437,
2.744, -3.509038, 5.953461,
2.744, 2.82929, 5.953461,
2.744, -3.509038, -6.250437,
2.744, -3.509038, 5.953461,
2.744, 2.82929, -6.250437,
2.744, 2.82929, 5.953461
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
var radius = 7.957385;
var distance = 35.40331;
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
mvMatrix.translate( 0.1265568, 0.339874, 0.1484878 );
mvMatrix.scale( 1.498608, 1.357405, 0.7049944 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.40331);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
fluthiamide<-read.table("fluthiamide.xyz")
```

```
## Error in read.table("fluthiamide.xyz"): no lines available in input
```

```r
x<-fluthiamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluthiamide' not found
```

```r
y<-fluthiamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluthiamide' not found
```

```r
z<-fluthiamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluthiamide' not found
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
-2.913506, 0.6831669, 0.07149477, 0, 0, 1, 1, 1,
-2.761613, 0.8830826, -2.319607, 1, 0, 0, 1, 1,
-2.632002, -0.6218479, -0.7381321, 1, 0, 0, 1, 1,
-2.59182, 0.2002497, 0.2138258, 1, 0, 0, 1, 1,
-2.569364, 0.1466616, 1.212286, 1, 0, 0, 1, 1,
-2.519313, 0.3942579, -1.426949, 1, 0, 0, 1, 1,
-2.364174, 1.280542, -0.6920319, 0, 0, 0, 1, 1,
-2.341272, -0.3695483, -0.137862, 0, 0, 0, 1, 1,
-2.340596, 2.495454, -1.364837, 0, 0, 0, 1, 1,
-2.32643, -0.5713378, -2.341961, 0, 0, 0, 1, 1,
-2.316607, -1.311703, -1.16604, 0, 0, 0, 1, 1,
-2.315935, 1.329016, 0.337199, 0, 0, 0, 1, 1,
-2.260689, -0.3726666, -0.3976009, 0, 0, 0, 1, 1,
-2.225408, -0.4151008, -2.494837, 1, 1, 1, 1, 1,
-2.219697, -0.08365759, -1.950467, 1, 1, 1, 1, 1,
-2.195827, -0.7125248, -0.08743715, 1, 1, 1, 1, 1,
-2.187722, 0.8121564, -0.9283687, 1, 1, 1, 1, 1,
-2.183128, 1.05243, 0.01482487, 1, 1, 1, 1, 1,
-2.107647, -0.3548931, -1.335959, 1, 1, 1, 1, 1,
-2.102379, -0.7457525, -2.987308, 1, 1, 1, 1, 1,
-2.065603, 0.8523517, -1.004993, 1, 1, 1, 1, 1,
-2.060929, 1.435131, -2.62153, 1, 1, 1, 1, 1,
-2.042958, 0.5124687, -1.429572, 1, 1, 1, 1, 1,
-2.030141, -2.152647, -2.18385, 1, 1, 1, 1, 1,
-1.997654, -0.2382798, -1.47151, 1, 1, 1, 1, 1,
-1.971899, -0.5687544, -2.12591, 1, 1, 1, 1, 1,
-1.964327, -1.091931, -0.5567598, 1, 1, 1, 1, 1,
-1.949452, -1.002045, -1.191048, 1, 1, 1, 1, 1,
-1.937458, -1.480929, -2.518167, 0, 0, 1, 1, 1,
-1.90107, -0.1782008, -1.155425, 1, 0, 0, 1, 1,
-1.883106, 1.363566, 0.2202055, 1, 0, 0, 1, 1,
-1.837223, -0.5498319, -2.543355, 1, 0, 0, 1, 1,
-1.833336, 0.07412487, -1.706895, 1, 0, 0, 1, 1,
-1.818681, 1.160933, 0.009243264, 1, 0, 0, 1, 1,
-1.817459, 1.882105, -1.374837, 0, 0, 0, 1, 1,
-1.778775, 1.294562, 0.2134791, 0, 0, 0, 1, 1,
-1.773218, -0.6389754, -2.098827, 0, 0, 0, 1, 1,
-1.765381, 0.8560991, -0.6981745, 0, 0, 0, 1, 1,
-1.741128, -0.2716004, -1.722291, 0, 0, 0, 1, 1,
-1.740422, -0.2961217, -1.235248, 0, 0, 0, 1, 1,
-1.738272, 1.535716, -0.2926945, 0, 0, 0, 1, 1,
-1.726449, 0.8886195, -1.269434, 1, 1, 1, 1, 1,
-1.713889, -1.235201, -3.144627, 1, 1, 1, 1, 1,
-1.707447, 1.090517, -1.3736, 1, 1, 1, 1, 1,
-1.697257, 0.5218842, -1.485098, 1, 1, 1, 1, 1,
-1.685614, -0.5147332, -2.137341, 1, 1, 1, 1, 1,
-1.678291, 0.2129726, -1.178191, 1, 1, 1, 1, 1,
-1.676572, -1.478418, -3.646194, 1, 1, 1, 1, 1,
-1.674949, -2.530124, -1.965901, 1, 1, 1, 1, 1,
-1.673804, 1.071114, -1.468422, 1, 1, 1, 1, 1,
-1.659632, 0.5739505, -1.195368, 1, 1, 1, 1, 1,
-1.643971, -0.6940076, -1.96494, 1, 1, 1, 1, 1,
-1.638131, -0.2551598, -0.7016415, 1, 1, 1, 1, 1,
-1.631681, 0.9885879, -1.653189, 1, 1, 1, 1, 1,
-1.619576, 1.113327, 0.7041442, 1, 1, 1, 1, 1,
-1.616662, -0.7354922, -0.621096, 1, 1, 1, 1, 1,
-1.604384, -1.351286, -2.819545, 0, 0, 1, 1, 1,
-1.603536, 0.572454, -2.591556, 1, 0, 0, 1, 1,
-1.602061, -0.2476601, -1.958362, 1, 0, 0, 1, 1,
-1.574934, -1.345424, -0.9917668, 1, 0, 0, 1, 1,
-1.559622, 1.081097, -1.012601, 1, 0, 0, 1, 1,
-1.557729, -0.03501999, 0.6024038, 1, 0, 0, 1, 1,
-1.552255, -0.4767426, -2.177407, 0, 0, 0, 1, 1,
-1.547373, -0.9811798, -1.002894, 0, 0, 0, 1, 1,
-1.543376, 0.3720552, -1.328581, 0, 0, 0, 1, 1,
-1.538157, -0.4761388, -2.716388, 0, 0, 0, 1, 1,
-1.535475, 0.6904154, -1.72655, 0, 0, 0, 1, 1,
-1.524001, 2.01708, -0.3734137, 0, 0, 0, 1, 1,
-1.516992, -0.1168227, -2.960429, 0, 0, 0, 1, 1,
-1.512327, 0.5117533, -1.923306, 1, 1, 1, 1, 1,
-1.511134, 0.6564634, -0.6280179, 1, 1, 1, 1, 1,
-1.498917, -2.161199, -2.078817, 1, 1, 1, 1, 1,
-1.495123, 0.3228881, 0.9746729, 1, 1, 1, 1, 1,
-1.488352, 0.8911833, -2.538998, 1, 1, 1, 1, 1,
-1.484641, -0.1160283, -0.7495744, 1, 1, 1, 1, 1,
-1.477545, -0.3598921, -1.024057, 1, 1, 1, 1, 1,
-1.468703, -1.062629, -1.079103, 1, 1, 1, 1, 1,
-1.46745, -0.7695649, -3.433597, 1, 1, 1, 1, 1,
-1.466035, -0.7533658, -2.795442, 1, 1, 1, 1, 1,
-1.464826, 1.141872, -0.4473205, 1, 1, 1, 1, 1,
-1.461595, 0.9555779, -2.482579, 1, 1, 1, 1, 1,
-1.452401, -1.509935, -3.357241, 1, 1, 1, 1, 1,
-1.435134, -0.7480197, -3.692214, 1, 1, 1, 1, 1,
-1.431877, 1.633111, 0.6766233, 1, 1, 1, 1, 1,
-1.425752, 1.238442, -1.495155, 0, 0, 1, 1, 1,
-1.411153, -1.059853, -3.31106, 1, 0, 0, 1, 1,
-1.410026, -0.5890893, -1.662546, 1, 0, 0, 1, 1,
-1.403802, -0.4076803, -0.3012347, 1, 0, 0, 1, 1,
-1.398632, 0.6780704, -0.670019, 1, 0, 0, 1, 1,
-1.394014, 0.4185331, -1.18008, 1, 0, 0, 1, 1,
-1.390432, -0.3838496, -1.366096, 0, 0, 0, 1, 1,
-1.387202, 1.695371, -0.3270443, 0, 0, 0, 1, 1,
-1.386823, 0.1414717, -1.005497, 0, 0, 0, 1, 1,
-1.383295, -0.8487456, -2.957924, 0, 0, 0, 1, 1,
-1.382015, -0.8356717, -3.638552, 0, 0, 0, 1, 1,
-1.381947, -0.712035, -1.44991, 0, 0, 0, 1, 1,
-1.378971, -0.8162507, -2.82384, 0, 0, 0, 1, 1,
-1.371503, -0.5417932, -1.418213, 1, 1, 1, 1, 1,
-1.365649, -1.357636, -2.557082, 1, 1, 1, 1, 1,
-1.358306, -0.4707189, -2.037588, 1, 1, 1, 1, 1,
-1.352763, -0.1698651, -2.151424, 1, 1, 1, 1, 1,
-1.350546, -0.4215802, -3.710862, 1, 1, 1, 1, 1,
-1.342864, -0.2808616, -0.8034015, 1, 1, 1, 1, 1,
-1.333117, 1.056447, -1.130212, 1, 1, 1, 1, 1,
-1.329458, -0.7677933, -2.939927, 1, 1, 1, 1, 1,
-1.318624, -1.197298, -2.080397, 1, 1, 1, 1, 1,
-1.317735, 1.785506, 0.8865386, 1, 1, 1, 1, 1,
-1.309571, 0.05866532, -2.081787, 1, 1, 1, 1, 1,
-1.300838, -0.9671982, -2.071216, 1, 1, 1, 1, 1,
-1.300482, 1.006533, -1.50739, 1, 1, 1, 1, 1,
-1.2931, -2.572018, -6.07271, 1, 1, 1, 1, 1,
-1.287153, -1.920711, -5.622462, 1, 1, 1, 1, 1,
-1.285936, -0.5326354, -1.615009, 0, 0, 1, 1, 1,
-1.277636, -0.8462146, -4.212706, 1, 0, 0, 1, 1,
-1.265048, -0.6190152, -1.862316, 1, 0, 0, 1, 1,
-1.263815, 1.031352, 0.2692049, 1, 0, 0, 1, 1,
-1.258944, 0.9096476, -0.3853057, 1, 0, 0, 1, 1,
-1.252081, -0.7507919, -1.590847, 1, 0, 0, 1, 1,
-1.245864, 2.29044, 1.966364, 0, 0, 0, 1, 1,
-1.245644, 0.1095794, -1.27657, 0, 0, 0, 1, 1,
-1.235262, 0.2135247, -4.280013, 0, 0, 0, 1, 1,
-1.231641, 0.5552798, -0.6037235, 0, 0, 0, 1, 1,
-1.230374, -0.2992437, -1.345914, 0, 0, 0, 1, 1,
-1.22955, -1.63683, -1.394838, 0, 0, 0, 1, 1,
-1.225579, -0.5394804, -2.678013, 0, 0, 0, 1, 1,
-1.213456, 1.036559, 0.796544, 1, 1, 1, 1, 1,
-1.212677, 2.736985, 1.460366, 1, 1, 1, 1, 1,
-1.204777, 0.05964676, -1.233601, 1, 1, 1, 1, 1,
-1.200421, -0.7138841, -1.357609, 1, 1, 1, 1, 1,
-1.199363, -1.20604, -2.46038, 1, 1, 1, 1, 1,
-1.19885, 0.4441625, -1.874253, 1, 1, 1, 1, 1,
-1.194335, -1.764755, -3.611463, 1, 1, 1, 1, 1,
-1.187503, 1.502781, -1.987405, 1, 1, 1, 1, 1,
-1.171061, -0.8861184, -3.825181, 1, 1, 1, 1, 1,
-1.155634, 1.754094, -0.7258387, 1, 1, 1, 1, 1,
-1.155104, 0.1672666, 0.6162189, 1, 1, 1, 1, 1,
-1.153543, -1.763753, -2.58779, 1, 1, 1, 1, 1,
-1.153095, -0.7889344, -0.772607, 1, 1, 1, 1, 1,
-1.146201, 0.2204884, -2.284299, 1, 1, 1, 1, 1,
-1.138805, 1.047038, -1.459209, 1, 1, 1, 1, 1,
-1.131283, -1.104329, -1.164875, 0, 0, 1, 1, 1,
-1.127134, -1.508695, -1.822823, 1, 0, 0, 1, 1,
-1.124492, -1.124744, -2.55083, 1, 0, 0, 1, 1,
-1.11087, -0.1998392, -1.80596, 1, 0, 0, 1, 1,
-1.10613, 0.4605747, -2.635164, 1, 0, 0, 1, 1,
-1.1059, -0.535213, -1.904764, 1, 0, 0, 1, 1,
-1.105845, -1.365667, -3.169092, 0, 0, 0, 1, 1,
-1.103973, -0.544583, -1.336463, 0, 0, 0, 1, 1,
-1.096789, 2.393988, -2.184089, 0, 0, 0, 1, 1,
-1.093983, 1.729488, -2.235679, 0, 0, 0, 1, 1,
-1.092836, 0.3609505, -1.522488, 0, 0, 0, 1, 1,
-1.09168, 0.05645288, -2.657645, 0, 0, 0, 1, 1,
-1.089661, 0.1553227, -3.01764, 0, 0, 0, 1, 1,
-1.083364, -0.8344191, -1.540528, 1, 1, 1, 1, 1,
-1.082525, 1.125148, -1.134633, 1, 1, 1, 1, 1,
-1.0714, 0.07784811, -3.407461, 1, 1, 1, 1, 1,
-1.065817, -0.144054, -3.019418, 1, 1, 1, 1, 1,
-1.064778, -1.172001, -0.4941885, 1, 1, 1, 1, 1,
-1.062588, 0.9994895, -1.318535, 1, 1, 1, 1, 1,
-1.06021, -1.373942, -2.297055, 1, 1, 1, 1, 1,
-1.058162, -0.2540209, -2.28922, 1, 1, 1, 1, 1,
-1.056285, 1.551428, -1.486156, 1, 1, 1, 1, 1,
-1.05612, -0.4074838, -1.396811, 1, 1, 1, 1, 1,
-1.047655, -1.0017, -2.691302, 1, 1, 1, 1, 1,
-1.046701, 0.5296878, -1.749969, 1, 1, 1, 1, 1,
-1.041434, 1.168384, 0.586412, 1, 1, 1, 1, 1,
-1.036419, 0.7527106, -0.7423149, 1, 1, 1, 1, 1,
-1.035634, 0.9818933, -1.344049, 1, 1, 1, 1, 1,
-1.034655, 0.2417883, -0.8534756, 0, 0, 1, 1, 1,
-1.032076, 0.005899225, -2.081004, 1, 0, 0, 1, 1,
-1.029628, 0.5001603, -1.210094, 1, 0, 0, 1, 1,
-1.02514, -0.5270963, -1.916135, 1, 0, 0, 1, 1,
-1.023235, -0.9376631, -0.304371, 1, 0, 0, 1, 1,
-1.021491, -0.4869047, -0.6778485, 1, 0, 0, 1, 1,
-1.016047, 0.1208994, -2.31207, 0, 0, 0, 1, 1,
-1.006568, 0.05392877, 0.6970858, 0, 0, 0, 1, 1,
-1.003998, 2.065294, -2.801663, 0, 0, 0, 1, 1,
-1.00342, -0.8591151, -2.380169, 0, 0, 0, 1, 1,
-1.002853, -0.758773, -2.866495, 0, 0, 0, 1, 1,
-1.002663, 0.221505, -2.234934, 0, 0, 0, 1, 1,
-1.000602, 0.1356944, -1.114005, 0, 0, 0, 1, 1,
-0.9960524, -1.190366, -3.553392, 1, 1, 1, 1, 1,
-0.9908652, -1.508419, -2.241108, 1, 1, 1, 1, 1,
-0.990206, -0.7540435, -1.378807, 1, 1, 1, 1, 1,
-0.9879593, 0.1121407, -1.351997, 1, 1, 1, 1, 1,
-0.9839903, -0.8617342, -2.421776, 1, 1, 1, 1, 1,
-0.9729638, -0.136549, -3.106026, 1, 1, 1, 1, 1,
-0.9574032, 0.03280576, -2.375011, 1, 1, 1, 1, 1,
-0.9561963, 0.1216091, -3.236552, 1, 1, 1, 1, 1,
-0.9543146, -0.297447, -1.171466, 1, 1, 1, 1, 1,
-0.950983, 1.690173, -0.1408779, 1, 1, 1, 1, 1,
-0.9466652, -0.6484584, -3.175621, 1, 1, 1, 1, 1,
-0.9466504, 0.6322935, -0.574818, 1, 1, 1, 1, 1,
-0.9452872, -1.530447, -1.298977, 1, 1, 1, 1, 1,
-0.9448006, -1.267721, -2.469943, 1, 1, 1, 1, 1,
-0.9432884, 1.169613, -0.0521186, 1, 1, 1, 1, 1,
-0.9420252, 0.3872274, -1.066173, 0, 0, 1, 1, 1,
-0.9411823, -1.62029, -1.308671, 1, 0, 0, 1, 1,
-0.9379049, 1.218469, 0.295097, 1, 0, 0, 1, 1,
-0.9378139, 1.496953, -1.839134, 1, 0, 0, 1, 1,
-0.9207363, 0.3712673, -0.5335945, 1, 0, 0, 1, 1,
-0.9204754, 0.6246809, -1.478599, 1, 0, 0, 1, 1,
-0.9170234, 0.2592403, -2.881493, 0, 0, 0, 1, 1,
-0.9152083, -0.6267847, -2.316797, 0, 0, 0, 1, 1,
-0.9136326, 0.8258086, -2.061527, 0, 0, 0, 1, 1,
-0.9115926, 0.9516897, -1.006878, 0, 0, 0, 1, 1,
-0.9095149, 0.05599231, -1.569396, 0, 0, 0, 1, 1,
-0.906018, 0.5370187, -1.798151, 0, 0, 0, 1, 1,
-0.9021502, 0.9006403, -1.085568, 0, 0, 0, 1, 1,
-0.9002682, 1.010945, -2.182497, 1, 1, 1, 1, 1,
-0.8949064, -0.8066895, -2.469309, 1, 1, 1, 1, 1,
-0.8912816, 0.5846938, -1.182732, 1, 1, 1, 1, 1,
-0.8843773, -1.767517, -1.781257, 1, 1, 1, 1, 1,
-0.8719232, 1.094635, 1.047429, 1, 1, 1, 1, 1,
-0.8661639, 0.9483772, 0.122232, 1, 1, 1, 1, 1,
-0.8589401, -0.2598849, -2.238002, 1, 1, 1, 1, 1,
-0.8566034, -1.186194, -2.735842, 1, 1, 1, 1, 1,
-0.8481846, 0.6901408, -1.238905, 1, 1, 1, 1, 1,
-0.8324643, 0.176377, -1.903692, 1, 1, 1, 1, 1,
-0.8317209, -0.03319129, -0.9486693, 1, 1, 1, 1, 1,
-0.830451, 0.1659951, -1.834377, 1, 1, 1, 1, 1,
-0.8299127, -1.626344, -2.861391, 1, 1, 1, 1, 1,
-0.8295063, 0.4570271, -1.697433, 1, 1, 1, 1, 1,
-0.8269621, 0.3954328, -1.840778, 1, 1, 1, 1, 1,
-0.8250202, 1.300717, 0.1904578, 0, 0, 1, 1, 1,
-0.8189836, -1.659203, -3.725982, 1, 0, 0, 1, 1,
-0.8179364, -0.9805252, -3.14815, 1, 0, 0, 1, 1,
-0.8166559, 0.6784279, -0.3650936, 1, 0, 0, 1, 1,
-0.8125137, -2.09094, -2.542128, 1, 0, 0, 1, 1,
-0.8113051, -0.2635352, -1.21517, 1, 0, 0, 1, 1,
-0.8067378, 1.287881, -0.8652526, 0, 0, 0, 1, 1,
-0.8027826, 0.1256347, -0.72105, 0, 0, 0, 1, 1,
-0.7979275, -1.984151, -3.677856, 0, 0, 0, 1, 1,
-0.797828, -0.307344, -3.424423, 0, 0, 0, 1, 1,
-0.7859715, -2.279559, -5.145215, 0, 0, 0, 1, 1,
-0.7841118, -1.311884, -2.378731, 0, 0, 0, 1, 1,
-0.7800165, -0.27237, -1.122365, 0, 0, 0, 1, 1,
-0.7780229, 1.283474, -0.7132906, 1, 1, 1, 1, 1,
-0.7743886, -0.8613979, -0.8610742, 1, 1, 1, 1, 1,
-0.7701421, -0.1524726, -1.620751, 1, 1, 1, 1, 1,
-0.768832, -0.529505, -1.541861, 1, 1, 1, 1, 1,
-0.7677686, -0.1723668, -1.707965, 1, 1, 1, 1, 1,
-0.7658899, -0.1467588, -3.148097, 1, 1, 1, 1, 1,
-0.7622533, 1.650929, -0.2267725, 1, 1, 1, 1, 1,
-0.7617147, 0.1397631, -0.5402596, 1, 1, 1, 1, 1,
-0.7565489, 0.2019709, -3.023309, 1, 1, 1, 1, 1,
-0.7516481, -0.4274021, -3.009991, 1, 1, 1, 1, 1,
-0.7449074, 0.4866024, -0.3700927, 1, 1, 1, 1, 1,
-0.7443527, 1.808356, 0.2797637, 1, 1, 1, 1, 1,
-0.7432553, -1.027196, 0.1381245, 1, 1, 1, 1, 1,
-0.7424489, -1.606261, -3.016025, 1, 1, 1, 1, 1,
-0.7373004, 0.8986765, -1.296183, 1, 1, 1, 1, 1,
-0.7317315, 0.8769962, -0.8444536, 0, 0, 1, 1, 1,
-0.7190722, -0.5598874, -2.111051, 1, 0, 0, 1, 1,
-0.7133207, -0.4123718, -4.567985, 1, 0, 0, 1, 1,
-0.7102038, -0.5409555, -1.518783, 1, 0, 0, 1, 1,
-0.7081547, 0.3587551, -1.659373, 1, 0, 0, 1, 1,
-0.705046, -1.737658, -3.739892, 1, 0, 0, 1, 1,
-0.7044432, 1.612687, -0.8336747, 0, 0, 0, 1, 1,
-0.7028518, 0.1480323, -0.8149195, 0, 0, 0, 1, 1,
-0.7018427, 1.369645, -1.845508, 0, 0, 0, 1, 1,
-0.7010894, 1.044117, -1.131784, 0, 0, 0, 1, 1,
-0.6983036, -0.8973089, -2.736104, 0, 0, 0, 1, 1,
-0.6978118, -0.4157516, -1.741002, 0, 0, 0, 1, 1,
-0.6759236, -1.866287, -2.498281, 0, 0, 0, 1, 1,
-0.6737527, 0.8995505, -0.1550835, 1, 1, 1, 1, 1,
-0.671814, -1.646056, -2.95551, 1, 1, 1, 1, 1,
-0.6701694, -1.50514, -2.948794, 1, 1, 1, 1, 1,
-0.6631876, -0.1137159, -1.924247, 1, 1, 1, 1, 1,
-0.6591088, 2.014351, 0.8498184, 1, 1, 1, 1, 1,
-0.6507146, 0.1079144, -1.483749, 1, 1, 1, 1, 1,
-0.6475936, -0.8127893, -3.906842, 1, 1, 1, 1, 1,
-0.6414313, 0.2580321, -2.730128, 1, 1, 1, 1, 1,
-0.6408381, -1.054904, -2.757641, 1, 1, 1, 1, 1,
-0.6408004, 0.2813524, -0.905046, 1, 1, 1, 1, 1,
-0.6384207, -1.083139, -3.539743, 1, 1, 1, 1, 1,
-0.6352246, -0.3523321, -2.678506, 1, 1, 1, 1, 1,
-0.6329642, 0.5323543, -1.106183, 1, 1, 1, 1, 1,
-0.628504, 0.2472592, -0.4924056, 1, 1, 1, 1, 1,
-0.6229197, -1.278971, -2.454103, 1, 1, 1, 1, 1,
-0.6190097, -1.395661, -1.920551, 0, 0, 1, 1, 1,
-0.6145234, -0.3384807, -1.560158, 1, 0, 0, 1, 1,
-0.6128022, -0.540898, -2.292896, 1, 0, 0, 1, 1,
-0.6065103, -0.7744053, -2.088629, 1, 0, 0, 1, 1,
-0.6059271, -1.733819, -3.25971, 1, 0, 0, 1, 1,
-0.6053081, 1.933089, -0.7530959, 1, 0, 0, 1, 1,
-0.6022549, 0.0796161, -0.08003856, 0, 0, 0, 1, 1,
-0.5998606, 1.196076, -0.5867004, 0, 0, 0, 1, 1,
-0.5989404, -1.217266, -4.260912, 0, 0, 0, 1, 1,
-0.5956147, -0.2564973, -0.9514978, 0, 0, 0, 1, 1,
-0.5918603, -0.1889312, -1.260882, 0, 0, 0, 1, 1,
-0.588363, 1.454836, -0.19972, 0, 0, 0, 1, 1,
-0.5853392, 1.581643, -1.905776, 0, 0, 0, 1, 1,
-0.5797053, 1.671809, -2.086809, 1, 1, 1, 1, 1,
-0.5789422, -0.4872769, -2.473844, 1, 1, 1, 1, 1,
-0.5769959, -1.449272, -3.602429, 1, 1, 1, 1, 1,
-0.5747053, 2.262795, -1.25593, 1, 1, 1, 1, 1,
-0.5728726, 0.9185044, 0.2838658, 1, 1, 1, 1, 1,
-0.571249, -1.10548, -3.489468, 1, 1, 1, 1, 1,
-0.5695678, 2.575114, -0.2509899, 1, 1, 1, 1, 1,
-0.5631844, -1.154932, -2.194568, 1, 1, 1, 1, 1,
-0.5627455, 0.2499586, -0.1603623, 1, 1, 1, 1, 1,
-0.559715, 0.686271, -2.241038, 1, 1, 1, 1, 1,
-0.5573607, -0.08610107, -2.890221, 1, 1, 1, 1, 1,
-0.550847, 0.4308005, -1.440955, 1, 1, 1, 1, 1,
-0.5427948, -0.5227061, -1.232454, 1, 1, 1, 1, 1,
-0.5423001, -0.8956196, -4.141798, 1, 1, 1, 1, 1,
-0.5364482, -0.9583433, -3.835442, 1, 1, 1, 1, 1,
-0.5287427, -0.7524254, -3.332516, 0, 0, 1, 1, 1,
-0.5257347, -0.9609863, -1.966083, 1, 0, 0, 1, 1,
-0.5232832, 0.3678735, -1.05301, 1, 0, 0, 1, 1,
-0.5224817, 0.5328268, 0.552571, 1, 0, 0, 1, 1,
-0.5221943, -0.4240518, -1.699419, 1, 0, 0, 1, 1,
-0.5210203, -0.06344164, -0.05373584, 1, 0, 0, 1, 1,
-0.5194338, 0.1120378, -0.6803446, 0, 0, 0, 1, 1,
-0.51867, -0.8970591, -3.720272, 0, 0, 0, 1, 1,
-0.5127043, -0.001425321, -1.65378, 0, 0, 0, 1, 1,
-0.5057234, -0.465566, -0.1624066, 0, 0, 0, 1, 1,
-0.5052429, 0.8252473, 0.5542676, 0, 0, 0, 1, 1,
-0.5001017, 0.6255859, 0.002794418, 0, 0, 0, 1, 1,
-0.4988816, 0.6920464, 0.8191408, 0, 0, 0, 1, 1,
-0.4965611, -2.003014, -3.343419, 1, 1, 1, 1, 1,
-0.4940247, -1.429775, -3.604466, 1, 1, 1, 1, 1,
-0.4940131, 0.1484387, 0.7020219, 1, 1, 1, 1, 1,
-0.4901011, -0.1896843, -1.748725, 1, 1, 1, 1, 1,
-0.4897596, 0.08012596, -1.420088, 1, 1, 1, 1, 1,
-0.4879793, -0.1102772, -1.607982, 1, 1, 1, 1, 1,
-0.4878996, -1.556948, -1.571472, 1, 1, 1, 1, 1,
-0.4874859, 0.3514733, -2.323993, 1, 1, 1, 1, 1,
-0.4793247, 1.200919, 0.4316549, 1, 1, 1, 1, 1,
-0.4779869, 0.6025374, 0.5093035, 1, 1, 1, 1, 1,
-0.4768903, -1.767157, -2.22784, 1, 1, 1, 1, 1,
-0.4748766, 0.769253, 0.02482538, 1, 1, 1, 1, 1,
-0.4741297, 0.7514856, 0.2665026, 1, 1, 1, 1, 1,
-0.473388, -0.2558094, -1.369955, 1, 1, 1, 1, 1,
-0.4686746, 1.369698, 1.500569, 1, 1, 1, 1, 1,
-0.4668485, 0.6486712, -1.558804, 0, 0, 1, 1, 1,
-0.4661754, -0.3294461, -3.501783, 1, 0, 0, 1, 1,
-0.4659957, -1.476801, -3.137652, 1, 0, 0, 1, 1,
-0.4616549, -0.4873946, -1.730146, 1, 0, 0, 1, 1,
-0.4607332, -0.07476214, -2.331074, 1, 0, 0, 1, 1,
-0.4606399, 1.230071, -0.5669559, 1, 0, 0, 1, 1,
-0.4605624, 1.161702, -1.359468, 0, 0, 0, 1, 1,
-0.4590956, 0.6858427, -0.6140431, 0, 0, 0, 1, 1,
-0.45896, 1.31704, -0.8082494, 0, 0, 0, 1, 1,
-0.4570415, 0.2682052, -0.5595967, 0, 0, 0, 1, 1,
-0.4536029, -1.351713, -2.771182, 0, 0, 0, 1, 1,
-0.4504208, 0.08363762, -0.1931481, 0, 0, 0, 1, 1,
-0.4467286, -1.974832, -2.822447, 0, 0, 0, 1, 1,
-0.4466096, 1.379937, 0.1605331, 1, 1, 1, 1, 1,
-0.4430267, 0.5882255, -0.6808729, 1, 1, 1, 1, 1,
-0.4406227, 0.8110654, -0.5216454, 1, 1, 1, 1, 1,
-0.4355819, -0.6977301, -3.700873, 1, 1, 1, 1, 1,
-0.4343501, 0.3832247, -0.8091465, 1, 1, 1, 1, 1,
-0.4337481, 1.860515, -0.7805659, 1, 1, 1, 1, 1,
-0.4332104, -1.950132, -1.044425, 1, 1, 1, 1, 1,
-0.4330708, -1.877268, -3.882164, 1, 1, 1, 1, 1,
-0.4296151, -2.915139, -3.469186, 1, 1, 1, 1, 1,
-0.4289146, -0.2006447, -1.301092, 1, 1, 1, 1, 1,
-0.4259793, -0.764616, -2.399072, 1, 1, 1, 1, 1,
-0.4241687, -0.7912175, -2.641599, 1, 1, 1, 1, 1,
-0.4185856, -0.7978084, -3.208776, 1, 1, 1, 1, 1,
-0.4144866, -1.736345, -2.264979, 1, 1, 1, 1, 1,
-0.412815, -0.9819092, -1.998309, 1, 1, 1, 1, 1,
-0.4101157, -0.04895719, -3.377955, 0, 0, 1, 1, 1,
-0.4095621, 1.454648, 1.7537, 1, 0, 0, 1, 1,
-0.4064777, 1.128929, 0.7218481, 1, 0, 0, 1, 1,
-0.3989051, -1.625977, -2.884255, 1, 0, 0, 1, 1,
-0.3984431, -0.3327934, -1.505571, 1, 0, 0, 1, 1,
-0.3975474, 0.1862591, -0.8724864, 1, 0, 0, 1, 1,
-0.3971541, -0.3458511, -3.208925, 0, 0, 0, 1, 1,
-0.3950494, 0.8925665, -1.841296, 0, 0, 0, 1, 1,
-0.3913795, -0.3819464, -2.290832, 0, 0, 0, 1, 1,
-0.3885443, -1.097199, -2.547927, 0, 0, 0, 1, 1,
-0.385181, 0.02735233, -2.171082, 0, 0, 0, 1, 1,
-0.3832906, 0.5334909, -1.221562, 0, 0, 0, 1, 1,
-0.3794287, -1.041853, -3.811574, 0, 0, 0, 1, 1,
-0.3725152, 0.8449134, -1.06619, 1, 1, 1, 1, 1,
-0.372109, -0.5651218, -3.874821, 1, 1, 1, 1, 1,
-0.3719727, -0.4632984, -0.4026264, 1, 1, 1, 1, 1,
-0.3713844, -1.437341, -3.236739, 1, 1, 1, 1, 1,
-0.3713711, -0.644248, -3.200922, 1, 1, 1, 1, 1,
-0.3706145, -1.186869, -1.3558, 1, 1, 1, 1, 1,
-0.3705798, -0.338017, -0.7828647, 1, 1, 1, 1, 1,
-0.3673951, -1.392256, -3.791829, 1, 1, 1, 1, 1,
-0.3669773, 1.14427, 1.101415, 1, 1, 1, 1, 1,
-0.3615564, -1.115688, -4.046687, 1, 1, 1, 1, 1,
-0.3613557, -0.2621109, -3.77326, 1, 1, 1, 1, 1,
-0.3605343, -1.462595, -2.528365, 1, 1, 1, 1, 1,
-0.3595515, -0.3253019, -3.435212, 1, 1, 1, 1, 1,
-0.3583904, 1.097662, -0.5601511, 1, 1, 1, 1, 1,
-0.3573492, -1.989651, -3.726098, 1, 1, 1, 1, 1,
-0.3560479, -1.073904, -4.358076, 0, 0, 1, 1, 1,
-0.3481554, -1.769081, -4.2383, 1, 0, 0, 1, 1,
-0.3456621, -0.2581457, -3.056876, 1, 0, 0, 1, 1,
-0.343363, 0.9697992, -1.903168, 1, 0, 0, 1, 1,
-0.3430941, -0.001475495, -1.661064, 1, 0, 0, 1, 1,
-0.3414177, 0.2549361, -0.1471832, 1, 0, 0, 1, 1,
-0.339059, 0.5670072, -0.434858, 0, 0, 0, 1, 1,
-0.3364876, -0.4467729, -1.115205, 0, 0, 0, 1, 1,
-0.334096, -0.8639119, -3.352822, 0, 0, 0, 1, 1,
-0.3334357, -0.3605789, -1.512932, 0, 0, 0, 1, 1,
-0.3303823, -1.568719, -2.076197, 0, 0, 0, 1, 1,
-0.3302542, -0.81925, -4.4505, 0, 0, 0, 1, 1,
-0.3247895, -1.12189, -3.691447, 0, 0, 0, 1, 1,
-0.3236871, -1.013498, -2.595714, 1, 1, 1, 1, 1,
-0.3229982, 0.3427674, -0.4136791, 1, 1, 1, 1, 1,
-0.3221678, -0.6443275, -2.047819, 1, 1, 1, 1, 1,
-0.3217145, 1.489377, -0.6310663, 1, 1, 1, 1, 1,
-0.3153797, -1.951884, -1.830201, 1, 1, 1, 1, 1,
-0.3062025, -0.9787156, -0.6256558, 1, 1, 1, 1, 1,
-0.2993587, 0.5132602, -2.015023, 1, 1, 1, 1, 1,
-0.2966464, -0.04617434, -1.547197, 1, 1, 1, 1, 1,
-0.2943083, 0.3564882, 0.9572371, 1, 1, 1, 1, 1,
-0.2943068, 2.597831, 2.183513, 1, 1, 1, 1, 1,
-0.2924681, -0.8386341, -2.131282, 1, 1, 1, 1, 1,
-0.2899724, -0.5562681, -1.650577, 1, 1, 1, 1, 1,
-0.2867096, -0.06398712, -2.19875, 1, 1, 1, 1, 1,
-0.2813451, -0.6607708, -1.775133, 1, 1, 1, 1, 1,
-0.2784976, 0.3656093, -0.8308599, 1, 1, 1, 1, 1,
-0.2783109, 0.6707042, 0.6799815, 0, 0, 1, 1, 1,
-0.2768517, -1.01687, -1.172033, 1, 0, 0, 1, 1,
-0.2710019, -0.4252065, -4.032098, 1, 0, 0, 1, 1,
-0.2681712, 0.434659, -0.8694986, 1, 0, 0, 1, 1,
-0.2666605, 0.8667518, 0.08451787, 1, 0, 0, 1, 1,
-0.2644531, -1.696139, -3.922252, 1, 0, 0, 1, 1,
-0.2611106, -0.7177602, -2.333244, 0, 0, 0, 1, 1,
-0.2595427, 2.001313, -2.046458, 0, 0, 0, 1, 1,
-0.2577075, 2.34329, 0.8736221, 0, 0, 0, 1, 1,
-0.256833, -0.1578823, -1.354616, 0, 0, 0, 1, 1,
-0.2527886, -1.834257, -1.896232, 0, 0, 0, 1, 1,
-0.2508359, -0.432034, -2.072758, 0, 0, 0, 1, 1,
-0.2494621, 0.4400056, -0.912164, 0, 0, 0, 1, 1,
-0.2454648, 1.042306, 0.1034942, 1, 1, 1, 1, 1,
-0.2428572, -2.025665, -3.913088, 1, 1, 1, 1, 1,
-0.2341431, 0.8891445, -0.6161435, 1, 1, 1, 1, 1,
-0.2328988, -0.5440023, -1.812497, 1, 1, 1, 1, 1,
-0.2274955, -0.1651874, -3.299036, 1, 1, 1, 1, 1,
-0.2270475, -0.4719732, -4.571253, 1, 1, 1, 1, 1,
-0.2269261, 0.5778621, 0.5225368, 1, 1, 1, 1, 1,
-0.2256063, 0.5384343, -0.6191941, 1, 1, 1, 1, 1,
-0.2231458, 1.151944, -0.3743881, 1, 1, 1, 1, 1,
-0.2213716, 0.6381903, 0.3195649, 1, 1, 1, 1, 1,
-0.2210511, -0.3714281, -3.300865, 1, 1, 1, 1, 1,
-0.2199169, -1.175091, -2.173707, 1, 1, 1, 1, 1,
-0.2193535, -0.4770302, -3.559347, 1, 1, 1, 1, 1,
-0.2172915, 0.7495695, 0.09232298, 1, 1, 1, 1, 1,
-0.2165086, 0.4300969, -0.1053652, 1, 1, 1, 1, 1,
-0.2132985, -0.5253492, -2.207034, 0, 0, 1, 1, 1,
-0.2086591, 0.0009057575, 0.4932849, 1, 0, 0, 1, 1,
-0.2025042, -0.2764972, -2.365356, 1, 0, 0, 1, 1,
-0.200103, -1.284524, -3.385485, 1, 0, 0, 1, 1,
-0.1984445, -0.6481474, -2.134458, 1, 0, 0, 1, 1,
-0.1943914, 0.2518877, -1.534247, 1, 0, 0, 1, 1,
-0.1939229, 1.288549, 1.47196, 0, 0, 0, 1, 1,
-0.1928547, 0.2036991, 0.9178448, 0, 0, 0, 1, 1,
-0.191412, 0.6986052, -1.873319, 0, 0, 0, 1, 1,
-0.1885405, 1.020983, 0.5955935, 0, 0, 0, 1, 1,
-0.1876008, -0.4478332, -2.017324, 0, 0, 0, 1, 1,
-0.1825012, -1.592987, -3.45534, 0, 0, 0, 1, 1,
-0.175795, 0.3096175, 0.4403883, 0, 0, 0, 1, 1,
-0.1755887, 0.3000403, -1.03181, 1, 1, 1, 1, 1,
-0.1737846, 0.7317353, -0.1411943, 1, 1, 1, 1, 1,
-0.1737417, -0.1149846, -2.000671, 1, 1, 1, 1, 1,
-0.1640962, -0.5727094, -1.527257, 1, 1, 1, 1, 1,
-0.1632914, -0.3572814, -3.205456, 1, 1, 1, 1, 1,
-0.1625623, 0.8547553, -2.863057, 1, 1, 1, 1, 1,
-0.1583294, -0.3006011, -4.041985, 1, 1, 1, 1, 1,
-0.1535326, -0.9895903, -2.603243, 1, 1, 1, 1, 1,
-0.1531798, 1.159902, -0.6391215, 1, 1, 1, 1, 1,
-0.1521533, -0.3681589, -2.283196, 1, 1, 1, 1, 1,
-0.1514527, -0.02716671, -1.897147, 1, 1, 1, 1, 1,
-0.1507235, -0.3616121, -3.143492, 1, 1, 1, 1, 1,
-0.1483769, -0.9679803, -3.215955, 1, 1, 1, 1, 1,
-0.1468938, 0.1169268, -1.759999, 1, 1, 1, 1, 1,
-0.1431814, -0.4522757, -2.890299, 1, 1, 1, 1, 1,
-0.1425021, -0.6847056, -2.333866, 0, 0, 1, 1, 1,
-0.1386603, -1.312404, -1.002969, 1, 0, 0, 1, 1,
-0.1379628, -1.092703, -2.10927, 1, 0, 0, 1, 1,
-0.1372099, 1.078189, 0.2490997, 1, 0, 0, 1, 1,
-0.1361571, -0.1126037, -3.434937, 1, 0, 0, 1, 1,
-0.1356169, 0.006047937, -1.955702, 1, 0, 0, 1, 1,
-0.1305659, 0.9195901, -0.6735678, 0, 0, 0, 1, 1,
-0.1220205, 1.030129, 0.4143925, 0, 0, 0, 1, 1,
-0.1183918, 1.433457, -0.8603356, 0, 0, 0, 1, 1,
-0.1169749, -0.5576921, -5.795062, 0, 0, 0, 1, 1,
-0.1105833, 0.23649, -3.069417, 0, 0, 0, 1, 1,
-0.105148, -0.7985784, -1.348823, 0, 0, 0, 1, 1,
-0.1027854, -1.845191, -2.699196, 0, 0, 0, 1, 1,
-0.1015706, 1.479385, -2.120266, 1, 1, 1, 1, 1,
-0.09998024, -0.5007853, -2.089312, 1, 1, 1, 1, 1,
-0.09949911, 0.1163458, -0.5128455, 1, 1, 1, 1, 1,
-0.09680139, -1.619236, -5.614174, 1, 1, 1, 1, 1,
-0.08574739, 0.7898714, -0.623329, 1, 1, 1, 1, 1,
-0.07437786, 0.8102734, 0.8512133, 1, 1, 1, 1, 1,
-0.07368945, 1.488033, 1.054758, 1, 1, 1, 1, 1,
-0.07179238, 0.8074915, 0.06609535, 1, 1, 1, 1, 1,
-0.07031536, 0.8799068, 0.7729744, 1, 1, 1, 1, 1,
-0.06337235, -0.7545289, -2.261253, 1, 1, 1, 1, 1,
-0.06151018, 1.195246, -1.964696, 1, 1, 1, 1, 1,
-0.05863274, 0.3424781, 0.6239791, 1, 1, 1, 1, 1,
-0.05270354, 0.8352149, -1.562116, 1, 1, 1, 1, 1,
-0.05057807, -1.965378, -4.042115, 1, 1, 1, 1, 1,
-0.04989255, 1.085286, 0.1847944, 1, 1, 1, 1, 1,
-0.04732094, -0.1203833, -1.466137, 0, 0, 1, 1, 1,
-0.04032531, -0.4906799, -3.58373, 1, 0, 0, 1, 1,
-0.0400045, -0.1035088, -2.227446, 1, 0, 0, 1, 1,
-0.03927539, 0.1458193, -1.058363, 1, 0, 0, 1, 1,
-0.03911961, -0.4391441, -3.414622, 1, 0, 0, 1, 1,
-0.03837952, 0.06093782, -1.642269, 1, 0, 0, 1, 1,
-0.03158547, 1.168, -1.417567, 0, 0, 0, 1, 1,
-0.02988784, -0.7839739, -1.725671, 0, 0, 0, 1, 1,
-0.02761006, 0.5089698, 0.008554739, 0, 0, 0, 1, 1,
-0.02414678, -0.001121741, -1.402305, 0, 0, 0, 1, 1,
-0.01849766, -0.7974841, -2.365839, 0, 0, 0, 1, 1,
-0.01147785, -1.030828, -2.674261, 0, 0, 0, 1, 1,
-0.005202348, 0.9284465, 0.8741759, 0, 0, 0, 1, 1,
-0.001143359, -1.040675, -2.207962, 1, 1, 1, 1, 1,
0.001246862, -0.7051609, 2.34542, 1, 1, 1, 1, 1,
0.003346446, 0.1126165, -1.259663, 1, 1, 1, 1, 1,
0.009374052, 1.644556, -0.009519612, 1, 1, 1, 1, 1,
0.01166256, -0.7739037, 2.553996, 1, 1, 1, 1, 1,
0.01369744, 1.159351, -0.2446906, 1, 1, 1, 1, 1,
0.01671233, -0.6067759, 3.228371, 1, 1, 1, 1, 1,
0.01710357, -2.130941, 2.335143, 1, 1, 1, 1, 1,
0.02498776, -0.645132, 4.295412, 1, 1, 1, 1, 1,
0.02766262, 1.194375, 0.7838823, 1, 1, 1, 1, 1,
0.03016429, 0.5456768, 1.103102, 1, 1, 1, 1, 1,
0.03219943, -0.8949137, 3.17116, 1, 1, 1, 1, 1,
0.0332429, -2.343823, 4.187921, 1, 1, 1, 1, 1,
0.03417779, -0.3142264, 4.004912, 1, 1, 1, 1, 1,
0.04079102, 1.250897, -0.7584558, 1, 1, 1, 1, 1,
0.04119269, 0.5526129, -1.266826, 0, 0, 1, 1, 1,
0.0418698, 0.5499062, 0.668569, 1, 0, 0, 1, 1,
0.04211637, -1.223603, 4.10182, 1, 0, 0, 1, 1,
0.04567857, 0.9595606, 0.5953409, 1, 0, 0, 1, 1,
0.0517692, -3.416733, 3.499639, 1, 0, 0, 1, 1,
0.05742465, 1.487066, 0.8537979, 1, 0, 0, 1, 1,
0.05838658, 1.617636, 0.7917759, 0, 0, 0, 1, 1,
0.06414016, 0.8278342, 1.525768, 0, 0, 0, 1, 1,
0.0649593, 0.2463994, -0.09085505, 0, 0, 0, 1, 1,
0.06570744, 1.38971, 0.1963417, 0, 0, 0, 1, 1,
0.06608275, 0.01080076, 0.6715699, 0, 0, 0, 1, 1,
0.07002563, 0.4744643, -0.2190468, 0, 0, 0, 1, 1,
0.071854, 0.1081451, -0.3307071, 0, 0, 0, 1, 1,
0.07717347, 1.341929, 0.9970834, 1, 1, 1, 1, 1,
0.0788144, 0.8562604, -0.7813304, 1, 1, 1, 1, 1,
0.08204372, 1.4161, 0.9987621, 1, 1, 1, 1, 1,
0.08264314, -0.6321022, 4.295626, 1, 1, 1, 1, 1,
0.08473819, 0.1511681, 0.007701157, 1, 1, 1, 1, 1,
0.08615855, 1.733271, -0.5236325, 1, 1, 1, 1, 1,
0.09318771, 1.150206, 1.495271, 1, 1, 1, 1, 1,
0.09509745, 1.387987, 0.2373687, 1, 1, 1, 1, 1,
0.09703319, -0.07119337, 1.933318, 1, 1, 1, 1, 1,
0.09968248, 0.4279732, 0.736641, 1, 1, 1, 1, 1,
0.1073435, -0.0004075395, 1.109475, 1, 1, 1, 1, 1,
0.10904, -0.7743208, 1.431469, 1, 1, 1, 1, 1,
0.1143727, -0.6189754, 4.60891, 1, 1, 1, 1, 1,
0.114904, -0.9365503, 3.48428, 1, 1, 1, 1, 1,
0.1150155, -1.432849, 2.524753, 1, 1, 1, 1, 1,
0.1158695, 1.470814, -0.5670268, 0, 0, 1, 1, 1,
0.1176358, -1.214255, 3.202546, 1, 0, 0, 1, 1,
0.1190704, 0.1516392, 0.2377031, 1, 0, 0, 1, 1,
0.127349, -1.967309, 2.638435, 1, 0, 0, 1, 1,
0.1282808, -0.3152939, 2.003291, 1, 0, 0, 1, 1,
0.129691, 0.9567878, -1.434899, 1, 0, 0, 1, 1,
0.132035, -1.298043, 2.694397, 0, 0, 0, 1, 1,
0.134026, -1.397982, 1.528092, 0, 0, 0, 1, 1,
0.1354111, -0.2720292, 2.857438, 0, 0, 0, 1, 1,
0.138784, 0.4597411, 0.4001859, 0, 0, 0, 1, 1,
0.1395309, -1.342099, 3.240148, 0, 0, 0, 1, 1,
0.1459265, -0.8552982, 3.548818, 0, 0, 0, 1, 1,
0.1487235, 0.8421028, 0.379865, 0, 0, 0, 1, 1,
0.149915, -1.484393, 1.972735, 1, 1, 1, 1, 1,
0.1508405, -0.3819791, 2.862968, 1, 1, 1, 1, 1,
0.1545982, -0.7317106, 3.816743, 1, 1, 1, 1, 1,
0.1642177, 0.6252772, 1.384444, 1, 1, 1, 1, 1,
0.172651, 0.4919876, 0.03350602, 1, 1, 1, 1, 1,
0.176157, 0.5156944, 0.03791161, 1, 1, 1, 1, 1,
0.1780777, -0.5170494, 3.84374, 1, 1, 1, 1, 1,
0.1847162, 0.7454315, -0.06666992, 1, 1, 1, 1, 1,
0.1922102, 0.3436012, 0.6765387, 1, 1, 1, 1, 1,
0.1944144, -2.001927, 3.609705, 1, 1, 1, 1, 1,
0.1958279, -0.4901665, 1.140453, 1, 1, 1, 1, 1,
0.1978338, -0.0617664, 2.60681, 1, 1, 1, 1, 1,
0.1985095, 0.2245078, 2.64327, 1, 1, 1, 1, 1,
0.1997649, 0.2845294, 1.31845, 1, 1, 1, 1, 1,
0.2007215, -0.004095481, 0.6823613, 1, 1, 1, 1, 1,
0.202343, -1.419616, 2.313103, 0, 0, 1, 1, 1,
0.2046526, 0.5897716, 1.739703, 1, 0, 0, 1, 1,
0.2090945, 0.363855, 0.1930141, 1, 0, 0, 1, 1,
0.2096603, 0.8744273, -0.4505211, 1, 0, 0, 1, 1,
0.2115192, -0.3752162, 3.046836, 1, 0, 0, 1, 1,
0.2136899, 0.5031465, 0.641124, 1, 0, 0, 1, 1,
0.2148982, 0.9299635, 0.5890991, 0, 0, 0, 1, 1,
0.2173598, -0.9287846, 4.286193, 0, 0, 0, 1, 1,
0.2258911, -0.6357527, 2.595096, 0, 0, 0, 1, 1,
0.2292311, -2.295697, 1.572329, 0, 0, 0, 1, 1,
0.2317976, 0.3379497, 2.135799, 0, 0, 0, 1, 1,
0.2323956, -0.216237, 2.653512, 0, 0, 0, 1, 1,
0.2349222, -0.07618, 1.753708, 0, 0, 0, 1, 1,
0.2353614, 0.9489998, 1.32918, 1, 1, 1, 1, 1,
0.2369338, -0.7174199, 1.145406, 1, 1, 1, 1, 1,
0.2426464, -0.4138832, 2.279694, 1, 1, 1, 1, 1,
0.2452849, 1.510757, -0.5990493, 1, 1, 1, 1, 1,
0.2465933, -0.9796144, 2.092639, 1, 1, 1, 1, 1,
0.2480683, 1.546229, 0.3110924, 1, 1, 1, 1, 1,
0.2492295, -0.4736427, 5.775734, 1, 1, 1, 1, 1,
0.2552571, -2.353946, 4.097417, 1, 1, 1, 1, 1,
0.2573176, -0.6292192, 2.704083, 1, 1, 1, 1, 1,
0.2577739, 0.8234693, 2.076495, 1, 1, 1, 1, 1,
0.2600938, -0.3028382, 2.388801, 1, 1, 1, 1, 1,
0.2656934, 0.8014272, 1.489479, 1, 1, 1, 1, 1,
0.2676698, -0.2700229, 2.16616, 1, 1, 1, 1, 1,
0.2721339, -2.103285, 2.598752, 1, 1, 1, 1, 1,
0.2732335, 1.378058, 0.1010217, 1, 1, 1, 1, 1,
0.2799582, 0.6807812, 0.3239784, 0, 0, 1, 1, 1,
0.2834305, 0.8116685, -0.6024314, 1, 0, 0, 1, 1,
0.284574, 0.540449, 1.032077, 1, 0, 0, 1, 1,
0.284899, 0.3689395, 0.1736698, 1, 0, 0, 1, 1,
0.2851725, 0.6983857, 0.371305, 1, 0, 0, 1, 1,
0.2894893, -0.9128899, 4.197158, 1, 0, 0, 1, 1,
0.2913089, 1.444141, 0.09955676, 0, 0, 0, 1, 1,
0.2953279, -0.3014646, 3.751447, 0, 0, 0, 1, 1,
0.2990713, 0.20031, 1.19632, 0, 0, 0, 1, 1,
0.3019845, 0.07549646, 1.74928, 0, 0, 0, 1, 1,
0.3186338, -0.2191381, 2.078864, 0, 0, 0, 1, 1,
0.321122, 0.8638912, 1.67468, 0, 0, 0, 1, 1,
0.3236542, -1.141402, 3.784602, 0, 0, 0, 1, 1,
0.3237344, -0.355715, 5.027298, 1, 1, 1, 1, 1,
0.3243813, 0.7660348, 1.582057, 1, 1, 1, 1, 1,
0.3270916, 1.422488, 0.2131702, 1, 1, 1, 1, 1,
0.3321537, 2.005126, -0.9843463, 1, 1, 1, 1, 1,
0.3330967, 1.302459, 0.6600927, 1, 1, 1, 1, 1,
0.3391421, -1.31005, 4.242286, 1, 1, 1, 1, 1,
0.3396254, 1.955574, 0.5452565, 1, 1, 1, 1, 1,
0.345502, -0.01027045, 0.03992125, 1, 1, 1, 1, 1,
0.3486283, 1.029305, -0.2164429, 1, 1, 1, 1, 1,
0.351107, 0.7444643, 0.7954882, 1, 1, 1, 1, 1,
0.3583239, 0.9107465, 0.5173144, 1, 1, 1, 1, 1,
0.3638307, 0.06625585, 0.8298062, 1, 1, 1, 1, 1,
0.3656831, -1.669523, 3.501611, 1, 1, 1, 1, 1,
0.3663696, 0.8972355, 1.786802, 1, 1, 1, 1, 1,
0.3747615, -0.4991297, 3.168172, 1, 1, 1, 1, 1,
0.376293, -1.089069, 1.738519, 0, 0, 1, 1, 1,
0.3813714, -1.662612, 3.018603, 1, 0, 0, 1, 1,
0.3825363, 2.051288, -0.6563861, 1, 0, 0, 1, 1,
0.3880765, 0.1778163, 1.097187, 1, 0, 0, 1, 1,
0.394673, -0.4019592, 0.2221918, 1, 0, 0, 1, 1,
0.396636, -0.4208083, 0.8494955, 1, 0, 0, 1, 1,
0.3969561, 0.9322172, 3.706871, 0, 0, 0, 1, 1,
0.3999963, -1.165634, 4.759794, 0, 0, 0, 1, 1,
0.4011892, 0.307892, 0.7335538, 0, 0, 0, 1, 1,
0.4019579, 1.112107, 0.1801123, 0, 0, 0, 1, 1,
0.4023353, 0.9133714, 1.988717, 0, 0, 0, 1, 1,
0.4105147, -0.07987987, 1.239333, 0, 0, 0, 1, 1,
0.4146451, 0.354723, -0.6302682, 0, 0, 0, 1, 1,
0.415701, 0.3240592, 1.812893, 1, 1, 1, 1, 1,
0.4160688, -0.5596628, 2.511107, 1, 1, 1, 1, 1,
0.4180286, -2.00892, 1.761736, 1, 1, 1, 1, 1,
0.420431, -1.371793, 2.570472, 1, 1, 1, 1, 1,
0.4205592, -0.3041175, 3.131033, 1, 1, 1, 1, 1,
0.4207269, 0.3098833, 1.425373, 1, 1, 1, 1, 1,
0.4232874, 0.3940183, -0.0009448112, 1, 1, 1, 1, 1,
0.4252083, 1.238722, -1.016766, 1, 1, 1, 1, 1,
0.4277593, 1.276675, -0.08150547, 1, 1, 1, 1, 1,
0.4367754, -0.03067102, 0.4104057, 1, 1, 1, 1, 1,
0.4378112, 0.5421667, 0.8574741, 1, 1, 1, 1, 1,
0.4400356, -0.6548274, 3.487216, 1, 1, 1, 1, 1,
0.4405078, -0.407733, 2.272857, 1, 1, 1, 1, 1,
0.4416242, -2.664807, 2.240707, 1, 1, 1, 1, 1,
0.4489895, -1.816702, 3.091226, 1, 1, 1, 1, 1,
0.4505464, 1.402136, -0.5233585, 0, 0, 1, 1, 1,
0.4511941, -1.662704, 2.605941, 1, 0, 0, 1, 1,
0.4537126, -1.280775, 2.702603, 1, 0, 0, 1, 1,
0.4558699, -0.7213345, 4.424072, 1, 0, 0, 1, 1,
0.4569517, -1.604693, 3.758654, 1, 0, 0, 1, 1,
0.4608821, -0.9275287, 3.091746, 1, 0, 0, 1, 1,
0.4646389, 1.322178, -0.172338, 0, 0, 0, 1, 1,
0.4664285, 1.471884, 2.518519, 0, 0, 0, 1, 1,
0.4688043, -0.6702171, 4.77335, 0, 0, 0, 1, 1,
0.4727152, 0.6269282, -1.373693, 0, 0, 0, 1, 1,
0.4730165, -1.29518, 3.631592, 0, 0, 0, 1, 1,
0.4752582, -0.2280679, 3.13625, 0, 0, 0, 1, 1,
0.4797073, -0.1075893, 1.84799, 0, 0, 0, 1, 1,
0.483191, -0.667321, 2.17004, 1, 1, 1, 1, 1,
0.4834763, -0.04745514, 0.4525466, 1, 1, 1, 1, 1,
0.4852617, -0.1581173, 2.453973, 1, 1, 1, 1, 1,
0.4855991, 0.2076587, 0.3316977, 1, 1, 1, 1, 1,
0.4899931, -0.8536803, 1.124792, 1, 1, 1, 1, 1,
0.4900524, 0.9458945, -0.3127008, 1, 1, 1, 1, 1,
0.4955992, 0.1473097, 0.1921229, 1, 1, 1, 1, 1,
0.495811, -1.671345, 3.19817, 1, 1, 1, 1, 1,
0.4962051, 0.6599492, 0.2855615, 1, 1, 1, 1, 1,
0.4992253, 0.4581816, 0.2771699, 1, 1, 1, 1, 1,
0.5047824, -0.7994594, 3.495228, 1, 1, 1, 1, 1,
0.5052465, -0.7040142, 3.142685, 1, 1, 1, 1, 1,
0.5085195, 0.7129701, 0.7885454, 1, 1, 1, 1, 1,
0.5118893, 1.331561, -1.055135, 1, 1, 1, 1, 1,
0.5129183, -0.6325284, 2.03618, 1, 1, 1, 1, 1,
0.5169894, -0.8876605, 1.567864, 0, 0, 1, 1, 1,
0.5194153, -0.2611869, 3.475965, 1, 0, 0, 1, 1,
0.5208981, -1.309262, 2.295762, 1, 0, 0, 1, 1,
0.526565, 0.1232239, -0.2043323, 1, 0, 0, 1, 1,
0.528775, 1.538196, 2.202036, 1, 0, 0, 1, 1,
0.5338141, -0.3700229, 0.8184908, 1, 0, 0, 1, 1,
0.536921, -0.08289467, 0.2446371, 0, 0, 0, 1, 1,
0.542622, 0.3713035, 1.24424, 0, 0, 0, 1, 1,
0.5494709, -0.3160136, 3.554849, 0, 0, 0, 1, 1,
0.5519115, -0.3910267, 1.399291, 0, 0, 0, 1, 1,
0.5549502, 0.3184647, 0.4101062, 0, 0, 0, 1, 1,
0.5612905, -0.7122587, 4.308886, 0, 0, 0, 1, 1,
0.5624866, -0.1666934, 1.298112, 0, 0, 0, 1, 1,
0.5657666, 0.0003632476, 0.3416546, 1, 1, 1, 1, 1,
0.5658247, -0.1275452, 2.326843, 1, 1, 1, 1, 1,
0.566567, 0.09756757, 1.804133, 1, 1, 1, 1, 1,
0.5672282, -0.9197164, 3.612115, 1, 1, 1, 1, 1,
0.5686218, 1.741564, -0.3211342, 1, 1, 1, 1, 1,
0.5697439, 0.8207263, 0.9126573, 1, 1, 1, 1, 1,
0.5703077, -0.3248107, 3.553966, 1, 1, 1, 1, 1,
0.5735919, 0.03517061, 1.747054, 1, 1, 1, 1, 1,
0.5753205, -1.269625, 2.591569, 1, 1, 1, 1, 1,
0.5874826, -1.051587, 2.129098, 1, 1, 1, 1, 1,
0.5905293, 0.5746693, 0.8656266, 1, 1, 1, 1, 1,
0.5919698, -0.2098493, 1.905129, 1, 1, 1, 1, 1,
0.59326, -0.4409357, 1.682557, 1, 1, 1, 1, 1,
0.593712, -1.629067, 3.234609, 1, 1, 1, 1, 1,
0.5939565, -0.6026572, 2.36838, 1, 1, 1, 1, 1,
0.5950419, 0.07954585, 2.603354, 0, 0, 1, 1, 1,
0.596302, -0.7539911, 1.199961, 1, 0, 0, 1, 1,
0.5969607, 0.2976349, 1.944379, 1, 0, 0, 1, 1,
0.6047625, -0.9566377, 1.730797, 1, 0, 0, 1, 1,
0.6054292, -1.950573, 2.447504, 1, 0, 0, 1, 1,
0.6104345, -0.8364463, 3.382043, 1, 0, 0, 1, 1,
0.6104633, 0.108716, 1.845487, 0, 0, 0, 1, 1,
0.6111755, -0.735759, 2.681616, 0, 0, 0, 1, 1,
0.6161082, 1.048659, -0.9888778, 0, 0, 0, 1, 1,
0.6219167, 0.7045984, -0.3261658, 0, 0, 0, 1, 1,
0.6250836, 2.27494, 1.562298, 0, 0, 0, 1, 1,
0.6260518, -0.4023251, 2.637608, 0, 0, 0, 1, 1,
0.6281413, -1.268453, 2.559003, 0, 0, 0, 1, 1,
0.6298898, -0.741465, 3.721117, 1, 1, 1, 1, 1,
0.6319575, 0.2803739, 1.927619, 1, 1, 1, 1, 1,
0.6340695, -0.2990885, 2.93463, 1, 1, 1, 1, 1,
0.6406379, 0.1093876, 2.114212, 1, 1, 1, 1, 1,
0.6415616, 0.9509538, 2.79199, 1, 1, 1, 1, 1,
0.644367, 0.7535709, 1.999251, 1, 1, 1, 1, 1,
0.6469144, 1.016418, 2.481709, 1, 1, 1, 1, 1,
0.6507894, -0.1639677, 1.536051, 1, 1, 1, 1, 1,
0.652383, -0.1571625, 0.7750174, 1, 1, 1, 1, 1,
0.6555519, 0.4220953, 1.120783, 1, 1, 1, 1, 1,
0.6589807, 0.5722895, -0.2529873, 1, 1, 1, 1, 1,
0.6616219, 0.1510501, 2.809059, 1, 1, 1, 1, 1,
0.6690561, -0.3705056, 3.457411, 1, 1, 1, 1, 1,
0.6729645, -1.039818, 1.846918, 1, 1, 1, 1, 1,
0.6815546, -0.3517468, 2.782295, 1, 1, 1, 1, 1,
0.6824752, -0.5876116, 1.89662, 0, 0, 1, 1, 1,
0.6865329, 0.6851876, 0.324089, 1, 0, 0, 1, 1,
0.6886546, 0.4440372, 1.839807, 1, 0, 0, 1, 1,
0.6907806, -0.1882522, 1.584239, 1, 0, 0, 1, 1,
0.6912252, 0.09667641, 1.404384, 1, 0, 0, 1, 1,
0.6923866, -0.3047659, 2.445784, 1, 0, 0, 1, 1,
0.6984002, -0.3285064, 3.653637, 0, 0, 0, 1, 1,
0.7044566, -0.09788779, 2.455935, 0, 0, 0, 1, 1,
0.7187026, -0.745864, 1.548856, 0, 0, 0, 1, 1,
0.722035, 0.1114648, 1.174968, 0, 0, 0, 1, 1,
0.7272915, 0.2799007, 3.031802, 0, 0, 0, 1, 1,
0.7407261, 1.142719, 1.588989, 0, 0, 0, 1, 1,
0.7425615, -0.8124546, 2.013814, 0, 0, 0, 1, 1,
0.7429835, 0.1718407, 3.096013, 1, 1, 1, 1, 1,
0.7450009, -0.5888534, 2.612048, 1, 1, 1, 1, 1,
0.746922, -0.02338323, 1.686549, 1, 1, 1, 1, 1,
0.7472851, -0.02842547, 2.794197, 1, 1, 1, 1, 1,
0.7519644, -2.121814, 3.556528, 1, 1, 1, 1, 1,
0.7672551, -0.3847946, 3.159678, 1, 1, 1, 1, 1,
0.7673395, -1.446785, 4.278389, 1, 1, 1, 1, 1,
0.7711312, 0.5396123, -0.09495635, 1, 1, 1, 1, 1,
0.7738026, -1.523774, 1.396642, 1, 1, 1, 1, 1,
0.773939, 1.567605, -0.5440623, 1, 1, 1, 1, 1,
0.7806436, 0.2715283, 0.5755926, 1, 1, 1, 1, 1,
0.7813062, -0.5904053, 2.413132, 1, 1, 1, 1, 1,
0.7827613, -0.5049644, 2.20198, 1, 1, 1, 1, 1,
0.785031, -0.7892199, 1.832183, 1, 1, 1, 1, 1,
0.7877303, -0.3922781, 3.187845, 1, 1, 1, 1, 1,
0.7933657, 1.619605, -0.3623506, 0, 0, 1, 1, 1,
0.7961794, -0.9326351, 3.450169, 1, 0, 0, 1, 1,
0.7969376, -1.713521, 2.843268, 1, 0, 0, 1, 1,
0.8010815, 0.01648435, 3.213908, 1, 0, 0, 1, 1,
0.8035728, -0.1260293, 1.447273, 1, 0, 0, 1, 1,
0.8044254, -0.4576532, 1.602891, 1, 0, 0, 1, 1,
0.808654, 1.289746, 1.610331, 0, 0, 0, 1, 1,
0.8112546, -0.6504326, 2.378084, 0, 0, 0, 1, 1,
0.8128942, -1.301449, 4.252553, 0, 0, 0, 1, 1,
0.8171542, 1.608816, 0.264404, 0, 0, 0, 1, 1,
0.8178657, -0.8167084, -0.07692853, 0, 0, 0, 1, 1,
0.8227901, -0.1462164, 1.732393, 0, 0, 0, 1, 1,
0.8236191, 0.02952194, 2.694932, 0, 0, 0, 1, 1,
0.8322151, 0.263895, 1.598617, 1, 1, 1, 1, 1,
0.837325, -1.39303, 2.621732, 1, 1, 1, 1, 1,
0.8406503, 1.516056, 0.08317118, 1, 1, 1, 1, 1,
0.8425639, 0.001007687, 0.8377678, 1, 1, 1, 1, 1,
0.8446057, 0.6752009, 0.823895, 1, 1, 1, 1, 1,
0.8498501, 0.6387143, 0.8616135, 1, 1, 1, 1, 1,
0.8499656, 0.7513883, -0.5726091, 1, 1, 1, 1, 1,
0.8606881, -1.420786, 2.029476, 1, 1, 1, 1, 1,
0.8644673, -0.1909457, 1.263725, 1, 1, 1, 1, 1,
0.8702808, 0.21931, 1.208709, 1, 1, 1, 1, 1,
0.8753257, 0.6422585, 0.2695053, 1, 1, 1, 1, 1,
0.8816609, -0.7321824, 0.8712791, 1, 1, 1, 1, 1,
0.8852589, -0.2933827, 0.2570291, 1, 1, 1, 1, 1,
0.8853282, 1.313426, -0.2750819, 1, 1, 1, 1, 1,
0.8943421, -0.4013954, 0.9785749, 1, 1, 1, 1, 1,
0.8958914, 1.184855, 0.9564078, 0, 0, 1, 1, 1,
0.8968184, 0.8796411, -0.1573588, 1, 0, 0, 1, 1,
0.9034661, 0.5920779, 1.30906, 1, 0, 0, 1, 1,
0.9069483, 1.258114, -0.2932485, 1, 0, 0, 1, 1,
0.9101474, 0.260489, 0.1615584, 1, 0, 0, 1, 1,
0.9173277, 0.3284399, -0.3297775, 1, 0, 0, 1, 1,
0.9330897, 0.206801, 1.030375, 0, 0, 0, 1, 1,
0.9407798, 0.5505694, 0.5517672, 0, 0, 0, 1, 1,
0.9466447, 0.5624304, 2.023848, 0, 0, 0, 1, 1,
0.9483904, -0.6043298, 2.446403, 0, 0, 0, 1, 1,
0.959866, -1.279444, 3.712478, 0, 0, 0, 1, 1,
0.9617094, -0.721735, 1.84532, 0, 0, 0, 1, 1,
0.9637133, -0.1856468, 0.6663926, 0, 0, 0, 1, 1,
0.9643347, 0.1549233, 3.627832, 1, 1, 1, 1, 1,
0.9693035, 0.7830085, 0.8460664, 1, 1, 1, 1, 1,
0.9703404, 0.7618327, 2.196666, 1, 1, 1, 1, 1,
0.9756988, -0.5905115, 3.007249, 1, 1, 1, 1, 1,
0.9766391, -0.9176134, 2.103057, 1, 1, 1, 1, 1,
0.9833618, -0.4714464, 2.493217, 1, 1, 1, 1, 1,
0.9835613, 0.3543476, 1.441598, 1, 1, 1, 1, 1,
0.9883068, 1.264012, 0.999629, 1, 1, 1, 1, 1,
0.9888225, 1.046062, -0.158495, 1, 1, 1, 1, 1,
0.9957865, -0.180634, 1.263334, 1, 1, 1, 1, 1,
0.9960145, 0.2199851, 2.487198, 1, 1, 1, 1, 1,
0.9992765, -0.3140109, 2.832647, 1, 1, 1, 1, 1,
1.000699, -0.01720708, 0.1658696, 1, 1, 1, 1, 1,
1.003503, 0.2270773, -1.607207, 1, 1, 1, 1, 1,
1.015817, -1.722635, 2.982153, 1, 1, 1, 1, 1,
1.018254, 1.108048, 1.216081, 0, 0, 1, 1, 1,
1.023816, 0.481746, -0.04101387, 1, 0, 0, 1, 1,
1.030724, -0.6669904, 1.477374, 1, 0, 0, 1, 1,
1.034113, -1.78595, 3.884013, 1, 0, 0, 1, 1,
1.040048, 1.310765, 1.525444, 1, 0, 0, 1, 1,
1.041287, -0.4315667, 0.04088017, 1, 0, 0, 1, 1,
1.041989, -0.7654175, 2.803369, 0, 0, 0, 1, 1,
1.042141, -1.058647, 2.693101, 0, 0, 0, 1, 1,
1.042734, -0.9662421, 2.5553, 0, 0, 0, 1, 1,
1.042736, 1.556488, 1.792656, 0, 0, 0, 1, 1,
1.052037, 1.008283, 0.621123, 0, 0, 0, 1, 1,
1.060196, -0.6862903, 2.061899, 0, 0, 0, 1, 1,
1.062463, -0.1699694, 1.980614, 0, 0, 0, 1, 1,
1.066243, 0.3554583, 0.3888518, 1, 1, 1, 1, 1,
1.068072, 0.3559117, 2.300843, 1, 1, 1, 1, 1,
1.079916, 0.6430834, -0.1771876, 1, 1, 1, 1, 1,
1.081976, -1.671, 3.693924, 1, 1, 1, 1, 1,
1.08407, -0.471574, 2.675681, 1, 1, 1, 1, 1,
1.086089, -1.342083, 3.704901, 1, 1, 1, 1, 1,
1.088181, -0.3611558, 2.042943, 1, 1, 1, 1, 1,
1.089365, 0.6066474, 1.110383, 1, 1, 1, 1, 1,
1.097788, -0.2525891, 2.775396, 1, 1, 1, 1, 1,
1.101752, 1.020189, 2.065484, 1, 1, 1, 1, 1,
1.107331, -0.412285, 2.60967, 1, 1, 1, 1, 1,
1.111733, -0.3529535, 1.748947, 1, 1, 1, 1, 1,
1.119196, -0.1367082, 0.9968444, 1, 1, 1, 1, 1,
1.122941, -1.182921, 3.225028, 1, 1, 1, 1, 1,
1.123955, -0.8691424, 1.840009, 1, 1, 1, 1, 1,
1.127247, 1.622627, 1.610265, 0, 0, 1, 1, 1,
1.138748, -0.4737674, 1.296775, 1, 0, 0, 1, 1,
1.144909, 0.2872229, 1.262189, 1, 0, 0, 1, 1,
1.145027, -0.7618451, 1.948413, 1, 0, 0, 1, 1,
1.156889, -1.116253, 1.215276, 1, 0, 0, 1, 1,
1.160756, -0.3068465, 2.592149, 1, 0, 0, 1, 1,
1.161063, 0.07327808, 0.7445797, 0, 0, 0, 1, 1,
1.162127, -0.1057999, 2.095485, 0, 0, 0, 1, 1,
1.16712, -0.07400909, 2.280309, 0, 0, 0, 1, 1,
1.169894, -0.5394069, 1.508659, 0, 0, 0, 1, 1,
1.170355, 0.283724, 1.682619, 0, 0, 0, 1, 1,
1.183113, -1.010622, 2.324404, 0, 0, 0, 1, 1,
1.187226, 0.03832612, 0.8920339, 0, 0, 0, 1, 1,
1.1902, 1.591846, 0.9965298, 1, 1, 1, 1, 1,
1.192493, 1.545468, 0.7479493, 1, 1, 1, 1, 1,
1.196492, -0.941986, 2.776689, 1, 1, 1, 1, 1,
1.196585, -1.28158, 2.710779, 1, 1, 1, 1, 1,
1.200268, -1.76141, 1.83967, 1, 1, 1, 1, 1,
1.208799, -0.3889467, 1.834659, 1, 1, 1, 1, 1,
1.209401, -1.083813, 1.85118, 1, 1, 1, 1, 1,
1.211848, 1.051163, 1.622384, 1, 1, 1, 1, 1,
1.213484, -0.1816265, 1.917254, 1, 1, 1, 1, 1,
1.213708, -2.123655, 2.585365, 1, 1, 1, 1, 1,
1.21372, 0.3756188, 1.349542, 1, 1, 1, 1, 1,
1.218128, 0.621982, 2.384356, 1, 1, 1, 1, 1,
1.218247, 0.9529965, 1.843673, 1, 1, 1, 1, 1,
1.221536, 0.981022, 1.131152, 1, 1, 1, 1, 1,
1.222676, -0.03988705, 1.91168, 1, 1, 1, 1, 1,
1.225621, -0.2624177, -0.2879817, 0, 0, 1, 1, 1,
1.229733, -1.650972, 1.407896, 1, 0, 0, 1, 1,
1.230914, -1.324105, 2.753357, 1, 0, 0, 1, 1,
1.231921, -1.684407, 2.479943, 1, 0, 0, 1, 1,
1.235814, -0.6368259, 2.18392, 1, 0, 0, 1, 1,
1.245716, 0.2065119, 1.111871, 1, 0, 0, 1, 1,
1.254092, 0.2854356, 0.5581242, 0, 0, 0, 1, 1,
1.257728, -1.181263, 1.489848, 0, 0, 0, 1, 1,
1.25802, 1.863804, 1.854416, 0, 0, 0, 1, 1,
1.262788, 0.6429389, 1.869362, 0, 0, 0, 1, 1,
1.270339, 0.2859068, 0.5910511, 0, 0, 0, 1, 1,
1.283311, -1.354384, 2.679996, 0, 0, 0, 1, 1,
1.295015, 0.9699198, 2.46064, 0, 0, 0, 1, 1,
1.296723, -0.2326716, 1.475538, 1, 1, 1, 1, 1,
1.308683, 1.051525, 1.683462, 1, 1, 1, 1, 1,
1.326408, -0.9041507, 2.908463, 1, 1, 1, 1, 1,
1.33389, 0.4772219, 0.4832073, 1, 1, 1, 1, 1,
1.334501, -0.0213225, 2.710301, 1, 1, 1, 1, 1,
1.342652, 0.1884897, 0.6996362, 1, 1, 1, 1, 1,
1.342891, 1.700138, 0.6415, 1, 1, 1, 1, 1,
1.350486, 0.189721, 3.239926, 1, 1, 1, 1, 1,
1.357422, 0.2079279, 1.413204, 1, 1, 1, 1, 1,
1.360657, 1.593008, -1.676087, 1, 1, 1, 1, 1,
1.367651, -1.339462, 3.667835, 1, 1, 1, 1, 1,
1.387149, 0.6113654, 1.361801, 1, 1, 1, 1, 1,
1.390068, -0.470034, 1.722663, 1, 1, 1, 1, 1,
1.39417, 0.7849366, -0.2900544, 1, 1, 1, 1, 1,
1.399189, -1.740178, 1.668382, 1, 1, 1, 1, 1,
1.399659, 0.5373328, 0.4015906, 0, 0, 1, 1, 1,
1.408484, 0.2852743, 1.936691, 1, 0, 0, 1, 1,
1.41362, 0.5949714, 1.346982, 1, 0, 0, 1, 1,
1.414871, -1.854245, 1.56687, 1, 0, 0, 1, 1,
1.41533, 0.1282582, 1.086585, 1, 0, 0, 1, 1,
1.424868, 0.01600431, 2.15657, 1, 0, 0, 1, 1,
1.426042, 0.3983525, 1.534332, 0, 0, 0, 1, 1,
1.451506, -0.5527682, 1.102795, 0, 0, 0, 1, 1,
1.460029, 0.6778009, 1.557601, 0, 0, 0, 1, 1,
1.468722, 1.372583, 1.279478, 0, 0, 0, 1, 1,
1.473223, -0.9397596, 3.787846, 0, 0, 0, 1, 1,
1.482471, 0.1951421, 0.4918644, 0, 0, 0, 1, 1,
1.487155, -2.867731, 2.419482, 0, 0, 0, 1, 1,
1.494545, 0.995847, 0.8200271, 1, 1, 1, 1, 1,
1.49608, 0.03050139, 2.286723, 1, 1, 1, 1, 1,
1.516015, -1.079328, 3.99018, 1, 1, 1, 1, 1,
1.516807, -1.615974, 2.934927, 1, 1, 1, 1, 1,
1.517677, -0.637504, 2.047107, 1, 1, 1, 1, 1,
1.518025, -1.058069, 2.531629, 1, 1, 1, 1, 1,
1.522068, 1.30598, 0.773439, 1, 1, 1, 1, 1,
1.543842, -0.3497618, 3.577309, 1, 1, 1, 1, 1,
1.544418, -0.3925573, 2.254702, 1, 1, 1, 1, 1,
1.548447, 1.651223, 0.4907673, 1, 1, 1, 1, 1,
1.549787, 0.4082941, 1.099018, 1, 1, 1, 1, 1,
1.560816, -0.3883797, 2.809834, 1, 1, 1, 1, 1,
1.562594, -0.001997372, 2.206635, 1, 1, 1, 1, 1,
1.562964, -0.6102165, 3.967269, 1, 1, 1, 1, 1,
1.568055, -0.316412, 0.4108639, 1, 1, 1, 1, 1,
1.57767, -0.3314805, 1.688169, 0, 0, 1, 1, 1,
1.61126, 1.436234, 1.359355, 1, 0, 0, 1, 1,
1.614987, -0.303623, 2.33403, 1, 0, 0, 1, 1,
1.617703, 2.260361, -0.2203448, 1, 0, 0, 1, 1,
1.634604, -2.173302, 0.36303, 1, 0, 0, 1, 1,
1.656915, -0.2332231, 2.277963, 1, 0, 0, 1, 1,
1.666505, -0.7436759, 1.89982, 0, 0, 0, 1, 1,
1.667575, -1.039505, 0.9597853, 0, 0, 0, 1, 1,
1.672466, -1.118686, -0.7173379, 0, 0, 0, 1, 1,
1.693725, -1.819203, 1.551763, 0, 0, 0, 1, 1,
1.694001, 0.7925584, 0.8875287, 0, 0, 0, 1, 1,
1.709817, -0.1755149, 0.9396276, 0, 0, 0, 1, 1,
1.719352, 1.664389, 0.1056222, 0, 0, 0, 1, 1,
1.738378, -0.1917637, 1.033613, 1, 1, 1, 1, 1,
1.742845, -0.2833669, 0.3690739, 1, 1, 1, 1, 1,
1.743715, -3.412398, 3.009401, 1, 1, 1, 1, 1,
1.763534, -1.376172, 1.623887, 1, 1, 1, 1, 1,
1.770659, 0.1306712, 0.3576728, 1, 1, 1, 1, 1,
1.7792, -0.1199917, -0.2686882, 1, 1, 1, 1, 1,
1.782465, 1.432327, 1.881882, 1, 1, 1, 1, 1,
1.786115, -0.3076378, 2.309181, 1, 1, 1, 1, 1,
1.800546, 1.257825, 0.1048009, 1, 1, 1, 1, 1,
1.820014, 1.227124, 1.229752, 1, 1, 1, 1, 1,
1.825181, 1.255473, 0.7794436, 1, 1, 1, 1, 1,
1.828044, 0.1044067, 0.8065111, 1, 1, 1, 1, 1,
1.856134, 0.4412944, 1.90613, 1, 1, 1, 1, 1,
1.870299, 0.1336608, 0.4564289, 1, 1, 1, 1, 1,
1.871484, 1.219706, 0.4396791, 1, 1, 1, 1, 1,
1.91879, -0.320731, 2.399915, 0, 0, 1, 1, 1,
1.920257, 0.02486286, 1.906483, 1, 0, 0, 1, 1,
1.947786, -0.5536052, 0.178676, 1, 0, 0, 1, 1,
1.980904, -0.4402264, 0.852743, 1, 0, 0, 1, 1,
1.982834, -0.3699123, 1.298026, 1, 0, 0, 1, 1,
1.983158, -0.9523951, 2.457723, 1, 0, 0, 1, 1,
2.001476, 0.6918651, 3.226015, 0, 0, 0, 1, 1,
2.002486, -0.6670439, 2.414689, 0, 0, 0, 1, 1,
2.011217, -0.01885247, 0.3145524, 0, 0, 0, 1, 1,
2.101938, 0.9543704, 0.8912721, 0, 0, 0, 1, 1,
2.119514, 0.2736734, 1.399417, 0, 0, 0, 1, 1,
2.145834, -0.07411424, 1.247895, 0, 0, 0, 1, 1,
2.169713, 0.3078375, 3.717949, 0, 0, 0, 1, 1,
2.180804, -1.559607, 1.32986, 1, 1, 1, 1, 1,
2.226928, 0.3386366, 1.898606, 1, 1, 1, 1, 1,
2.430018, -1.010605, 1.289647, 1, 1, 1, 1, 1,
2.514015, -1.521101, 3.897116, 1, 1, 1, 1, 1,
2.594848, 0.4109981, 1.805497, 1, 1, 1, 1, 1,
2.60792, 2.554428, 1.366244, 1, 1, 1, 1, 1,
2.660392, 0.5302252, 3.057907, 1, 1, 1, 1, 1
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
var radius = 9.771233;
var distance = 34.32104;
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
mvMatrix.translate( 0.1265568, 0.339874, 0.1484878 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.32104);
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
