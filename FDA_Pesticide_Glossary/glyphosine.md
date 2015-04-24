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
-3.416597, 0.4080136, -1.417848, 1, 0, 0, 1,
-3.217195, 0.5939823, 1.122312, 1, 0.007843138, 0, 1,
-3.050378, 0.790733, -0.367031, 1, 0.01176471, 0, 1,
-2.686236, 0.4571671, -1.042973, 1, 0.01960784, 0, 1,
-2.621345, -0.363061, -1.777561, 1, 0.02352941, 0, 1,
-2.620343, 0.5347006, -1.919194, 1, 0.03137255, 0, 1,
-2.554065, 1.109473, -0.467351, 1, 0.03529412, 0, 1,
-2.532984, -1.586251, -2.259421, 1, 0.04313726, 0, 1,
-2.387096, 0.07591071, -2.139487, 1, 0.04705882, 0, 1,
-2.381946, 1.377167, -2.051165, 1, 0.05490196, 0, 1,
-2.362034, 1.385798, -0.6935105, 1, 0.05882353, 0, 1,
-2.352249, -1.621839, -2.585719, 1, 0.06666667, 0, 1,
-2.258883, -1.405078, -0.4207346, 1, 0.07058824, 0, 1,
-2.254817, 0.9461736, -0.4115978, 1, 0.07843138, 0, 1,
-2.233594, -0.2723675, -3.028848, 1, 0.08235294, 0, 1,
-2.229732, -0.3290684, -2.286819, 1, 0.09019608, 0, 1,
-2.208412, 0.1781191, -1.924832, 1, 0.09411765, 0, 1,
-2.190625, -0.8063194, -2.412834, 1, 0.1019608, 0, 1,
-2.104119, 0.5383228, -2.381603, 1, 0.1098039, 0, 1,
-2.086301, -0.6941844, -1.423387, 1, 0.1137255, 0, 1,
-2.06137, -2.171871, -3.069073, 1, 0.1215686, 0, 1,
-2.025884, -0.2933557, -1.894475, 1, 0.1254902, 0, 1,
-1.961254, 0.6952745, -1.67716, 1, 0.1333333, 0, 1,
-1.943048, 0.5875732, -1.773903, 1, 0.1372549, 0, 1,
-1.940003, 0.05436637, -1.01917, 1, 0.145098, 0, 1,
-1.92293, -0.2029439, -0.2259986, 1, 0.1490196, 0, 1,
-1.887647, 2.448095, -1.932444, 1, 0.1568628, 0, 1,
-1.884061, 0.977179, -0.6228444, 1, 0.1607843, 0, 1,
-1.852358, 2.179143, 1.663743, 1, 0.1686275, 0, 1,
-1.845438, 1.609576, -1.295823, 1, 0.172549, 0, 1,
-1.825255, 1.000744, 1.496522, 1, 0.1803922, 0, 1,
-1.81699, -1.570839, -1.023332, 1, 0.1843137, 0, 1,
-1.802678, 1.267904, -2.123835, 1, 0.1921569, 0, 1,
-1.786064, 1.102197, -2.792714, 1, 0.1960784, 0, 1,
-1.778996, -0.476651, -1.271862, 1, 0.2039216, 0, 1,
-1.774624, -0.6396797, -3.062469, 1, 0.2117647, 0, 1,
-1.771191, 0.3011248, -0.2443201, 1, 0.2156863, 0, 1,
-1.769531, -0.424345, -0.482876, 1, 0.2235294, 0, 1,
-1.757158, -0.8346713, -2.55377, 1, 0.227451, 0, 1,
-1.755751, 0.2845659, 0.05898369, 1, 0.2352941, 0, 1,
-1.744263, -0.6658194, -2.473324, 1, 0.2392157, 0, 1,
-1.738015, 1.46086, -0.9253142, 1, 0.2470588, 0, 1,
-1.660046, 2.036398, -0.8334087, 1, 0.2509804, 0, 1,
-1.644345, -1.607791, -1.938116, 1, 0.2588235, 0, 1,
-1.642485, -0.9704083, -1.303171, 1, 0.2627451, 0, 1,
-1.606737, 0.07948859, -1.990561, 1, 0.2705882, 0, 1,
-1.594462, 0.583793, -0.1518954, 1, 0.2745098, 0, 1,
-1.592537, -0.3037505, -0.6296358, 1, 0.282353, 0, 1,
-1.589494, -0.6819502, -1.045733, 1, 0.2862745, 0, 1,
-1.58249, -0.6269019, -1.587416, 1, 0.2941177, 0, 1,
-1.573524, 1.501541, -1.02797, 1, 0.3019608, 0, 1,
-1.572653, -0.2295453, -2.406869, 1, 0.3058824, 0, 1,
-1.556191, -1.283226, -1.35356, 1, 0.3137255, 0, 1,
-1.554127, 1.039288, -0.4323957, 1, 0.3176471, 0, 1,
-1.547357, -1.595409, -2.490866, 1, 0.3254902, 0, 1,
-1.545699, -0.9887192, -2.914927, 1, 0.3294118, 0, 1,
-1.543704, 1.709713, -0.2519805, 1, 0.3372549, 0, 1,
-1.541709, 1.30159, -2.168147, 1, 0.3411765, 0, 1,
-1.534401, 1.400673, -2.39183, 1, 0.3490196, 0, 1,
-1.521968, 0.4234199, -1.889861, 1, 0.3529412, 0, 1,
-1.51584, 0.3313977, -0.8243865, 1, 0.3607843, 0, 1,
-1.513488, -0.9025521, -1.984028, 1, 0.3647059, 0, 1,
-1.500247, -0.0350697, -1.330602, 1, 0.372549, 0, 1,
-1.498202, -0.57725, -2.892167, 1, 0.3764706, 0, 1,
-1.498053, 0.2117762, -1.98375, 1, 0.3843137, 0, 1,
-1.495791, 0.6190468, -1.984, 1, 0.3882353, 0, 1,
-1.478922, -0.3188678, -2.224232, 1, 0.3960784, 0, 1,
-1.475905, 0.7782414, 0.6942812, 1, 0.4039216, 0, 1,
-1.473974, -0.3885175, -3.074233, 1, 0.4078431, 0, 1,
-1.473728, 0.4892323, 0.6527742, 1, 0.4156863, 0, 1,
-1.472965, -0.6508409, -1.820789, 1, 0.4196078, 0, 1,
-1.472957, 1.445768, -1.004718, 1, 0.427451, 0, 1,
-1.45681, 1.174242, -1.92238, 1, 0.4313726, 0, 1,
-1.454461, -0.2471138, -1.890526, 1, 0.4392157, 0, 1,
-1.451657, 1.501141, -0.7594669, 1, 0.4431373, 0, 1,
-1.446622, 0.7128325, -0.7751907, 1, 0.4509804, 0, 1,
-1.444284, 0.9816697, -0.3259204, 1, 0.454902, 0, 1,
-1.436807, 1.612507, -1.240754, 1, 0.4627451, 0, 1,
-1.435892, -0.7693834, -2.065784, 1, 0.4666667, 0, 1,
-1.432879, -0.4058361, -0.1231709, 1, 0.4745098, 0, 1,
-1.416027, 1.978002, 0.5898384, 1, 0.4784314, 0, 1,
-1.413674, -0.4420935, -2.538896, 1, 0.4862745, 0, 1,
-1.408085, 1.645458, -1.648837, 1, 0.4901961, 0, 1,
-1.407047, 0.5393087, -0.2634221, 1, 0.4980392, 0, 1,
-1.403712, -0.1321568, -0.8790906, 1, 0.5058824, 0, 1,
-1.396556, -0.1715155, -0.07900922, 1, 0.509804, 0, 1,
-1.393708, 0.2321811, -0.2465226, 1, 0.5176471, 0, 1,
-1.382226, -1.142166, -1.88539, 1, 0.5215687, 0, 1,
-1.379855, -0.3732991, -1.014204, 1, 0.5294118, 0, 1,
-1.373426, -0.008742623, -1.0011, 1, 0.5333334, 0, 1,
-1.369943, -0.7292756, -0.3296134, 1, 0.5411765, 0, 1,
-1.368629, -2.069164, -2.404593, 1, 0.5450981, 0, 1,
-1.364357, 0.3818652, -0.3639998, 1, 0.5529412, 0, 1,
-1.360885, 0.3346963, -1.337692, 1, 0.5568628, 0, 1,
-1.359223, 0.2023132, -1.532853, 1, 0.5647059, 0, 1,
-1.357654, 0.1968911, -0.7105708, 1, 0.5686275, 0, 1,
-1.354563, 0.6635113, -1.480098, 1, 0.5764706, 0, 1,
-1.349879, -0.2574898, -1.29632, 1, 0.5803922, 0, 1,
-1.349675, 0.5695477, -0.9779823, 1, 0.5882353, 0, 1,
-1.344532, -2.192078, -1.789052, 1, 0.5921569, 0, 1,
-1.342962, -1.012715, -3.007295, 1, 0.6, 0, 1,
-1.340838, -0.6583827, -2.341302, 1, 0.6078432, 0, 1,
-1.338346, 0.9078341, -1.465407, 1, 0.6117647, 0, 1,
-1.338172, -1.005096, -0.1531563, 1, 0.6196079, 0, 1,
-1.335099, 0.5965167, -0.2808749, 1, 0.6235294, 0, 1,
-1.331404, -0.1119942, -2.154067, 1, 0.6313726, 0, 1,
-1.32333, -0.649682, -2.773869, 1, 0.6352941, 0, 1,
-1.312803, 1.802543, -1.024444, 1, 0.6431373, 0, 1,
-1.311014, -0.5256427, -1.406112, 1, 0.6470588, 0, 1,
-1.307132, 1.105181, -1.88398, 1, 0.654902, 0, 1,
-1.306935, -1.014202, -3.567611, 1, 0.6588235, 0, 1,
-1.303981, -0.08757447, -2.782402, 1, 0.6666667, 0, 1,
-1.302913, -0.1966083, -0.4330161, 1, 0.6705883, 0, 1,
-1.291749, 0.6771888, -0.2172389, 1, 0.6784314, 0, 1,
-1.286911, -0.1856374, -1.838749, 1, 0.682353, 0, 1,
-1.285119, 0.8554571, -0.6997899, 1, 0.6901961, 0, 1,
-1.279241, 0.3345929, -3.898615, 1, 0.6941177, 0, 1,
-1.273908, -0.4029536, -2.430109, 1, 0.7019608, 0, 1,
-1.266558, -2.625724, -2.844968, 1, 0.7098039, 0, 1,
-1.257035, 0.3403885, -1.09646, 1, 0.7137255, 0, 1,
-1.250241, 1.562783, -0.6820441, 1, 0.7215686, 0, 1,
-1.248157, -0.1766048, -1.713312, 1, 0.7254902, 0, 1,
-1.247687, -0.08696365, -2.917649, 1, 0.7333333, 0, 1,
-1.247679, 0.2384859, -1.467253, 1, 0.7372549, 0, 1,
-1.239966, -1.886616, -2.698553, 1, 0.7450981, 0, 1,
-1.231073, 0.2045656, -1.514892, 1, 0.7490196, 0, 1,
-1.217085, 0.7451444, 1.244508, 1, 0.7568628, 0, 1,
-1.212093, -0.04905613, -1.956725, 1, 0.7607843, 0, 1,
-1.205965, -0.1576199, -1.299446, 1, 0.7686275, 0, 1,
-1.205311, 1.652828, -1.50153, 1, 0.772549, 0, 1,
-1.205006, -1.027283, -3.739508, 1, 0.7803922, 0, 1,
-1.203329, 0.21632, -1.624571, 1, 0.7843137, 0, 1,
-1.199835, 0.7498725, -1.47622, 1, 0.7921569, 0, 1,
-1.197737, 0.9099445, -0.2648359, 1, 0.7960784, 0, 1,
-1.197232, 1.521143, -0.8724702, 1, 0.8039216, 0, 1,
-1.195143, 0.2742121, -0.5269138, 1, 0.8117647, 0, 1,
-1.194682, -1.557574, -4.368842, 1, 0.8156863, 0, 1,
-1.194464, -1.197255, -1.185696, 1, 0.8235294, 0, 1,
-1.187091, 0.1742598, -3.112629, 1, 0.827451, 0, 1,
-1.179508, -1.494725, -2.280607, 1, 0.8352941, 0, 1,
-1.175244, 0.2866705, -2.324828, 1, 0.8392157, 0, 1,
-1.164475, 1.301921, -1.632899, 1, 0.8470588, 0, 1,
-1.164382, -0.2029767, -0.7315878, 1, 0.8509804, 0, 1,
-1.164337, -0.38192, -2.767151, 1, 0.8588235, 0, 1,
-1.153781, 0.4821356, -0.8201278, 1, 0.8627451, 0, 1,
-1.148744, 1.302235, -0.8345376, 1, 0.8705882, 0, 1,
-1.14748, 0.2411129, -1.863827, 1, 0.8745098, 0, 1,
-1.145533, 0.7630529, -0.1960235, 1, 0.8823529, 0, 1,
-1.1359, 0.7207494, -2.229309, 1, 0.8862745, 0, 1,
-1.132486, -0.3615343, -2.081832, 1, 0.8941177, 0, 1,
-1.130583, -0.3975558, -1.667663, 1, 0.8980392, 0, 1,
-1.125034, -0.4358606, -1.478517, 1, 0.9058824, 0, 1,
-1.119475, -0.1111582, -1.534076, 1, 0.9137255, 0, 1,
-1.117733, 0.3000273, -2.143727, 1, 0.9176471, 0, 1,
-1.109985, 0.7369393, -1.543225, 1, 0.9254902, 0, 1,
-1.107925, -0.9064999, -1.4743, 1, 0.9294118, 0, 1,
-1.103553, -0.04145743, -2.058243, 1, 0.9372549, 0, 1,
-1.093242, 0.6432628, -0.309696, 1, 0.9411765, 0, 1,
-1.087741, -0.7064731, -1.898616, 1, 0.9490196, 0, 1,
-1.087077, -0.4319838, -1.745909, 1, 0.9529412, 0, 1,
-1.083767, -1.06847, -1.442838, 1, 0.9607843, 0, 1,
-1.079125, -0.05779259, -1.539377, 1, 0.9647059, 0, 1,
-1.077333, -1.56108, -2.788188, 1, 0.972549, 0, 1,
-1.067926, -1.303054, -2.399644, 1, 0.9764706, 0, 1,
-1.065862, 0.973759, -2.183682, 1, 0.9843137, 0, 1,
-1.058473, -0.942665, -0.8926224, 1, 0.9882353, 0, 1,
-1.057984, 0.06662792, -0.5499386, 1, 0.9960784, 0, 1,
-1.052668, -1.405746, -2.692435, 0.9960784, 1, 0, 1,
-1.050404, -2.050668, -3.233729, 0.9921569, 1, 0, 1,
-1.039856, -0.6329386, -2.141892, 0.9843137, 1, 0, 1,
-1.036411, -0.7769288, -3.438736, 0.9803922, 1, 0, 1,
-1.027892, 1.530126, -0.1224024, 0.972549, 1, 0, 1,
-1.017713, -0.9411408, -1.452288, 0.9686275, 1, 0, 1,
-1.010661, -0.2573235, -2.299508, 0.9607843, 1, 0, 1,
-1.008821, 0.7268102, -0.1539057, 0.9568627, 1, 0, 1,
-1.008089, -1.067615, -2.188281, 0.9490196, 1, 0, 1,
-1.006577, 0.6293213, -3.126576, 0.945098, 1, 0, 1,
-1.004742, 0.1867747, -1.696415, 0.9372549, 1, 0, 1,
-1.002536, 0.4282001, -1.075763, 0.9333333, 1, 0, 1,
-0.9968703, -1.537399, -2.888248, 0.9254902, 1, 0, 1,
-0.9925407, 0.1717334, -2.771304, 0.9215686, 1, 0, 1,
-0.9844968, 2.310162, 0.4798702, 0.9137255, 1, 0, 1,
-0.9844757, 0.5660744, -2.135952, 0.9098039, 1, 0, 1,
-0.9793683, 0.8370194, -1.251319, 0.9019608, 1, 0, 1,
-0.9792039, 0.04437326, -2.896815, 0.8941177, 1, 0, 1,
-0.9682439, 0.2647327, -0.9245834, 0.8901961, 1, 0, 1,
-0.9613096, 0.8872753, 0.9441943, 0.8823529, 1, 0, 1,
-0.9473726, -1.173005, -2.642264, 0.8784314, 1, 0, 1,
-0.945302, 2.70326, 0.02776536, 0.8705882, 1, 0, 1,
-0.9354671, -1.294006, -2.725741, 0.8666667, 1, 0, 1,
-0.932205, 1.359189, -1.706044, 0.8588235, 1, 0, 1,
-0.9220091, 1.102375, -1.336668, 0.854902, 1, 0, 1,
-0.9191045, 1.4189, -0.3931759, 0.8470588, 1, 0, 1,
-0.9107671, -0.1512786, -1.930606, 0.8431373, 1, 0, 1,
-0.9103934, -1.587597, -3.654755, 0.8352941, 1, 0, 1,
-0.9060032, -0.7402658, -1.857278, 0.8313726, 1, 0, 1,
-0.9050676, -1.31894, -3.483588, 0.8235294, 1, 0, 1,
-0.9049519, -0.4915181, -2.175901, 0.8196079, 1, 0, 1,
-0.8969796, -0.5329707, -2.309715, 0.8117647, 1, 0, 1,
-0.8940538, -0.676829, -2.779371, 0.8078431, 1, 0, 1,
-0.8780514, 0.7952737, -0.5533257, 0.8, 1, 0, 1,
-0.8750234, -1.744635, -4.398084, 0.7921569, 1, 0, 1,
-0.8734992, -0.1852008, -1.668521, 0.7882353, 1, 0, 1,
-0.8714314, 0.04935874, -2.852377, 0.7803922, 1, 0, 1,
-0.8561015, 0.6298065, -1.648702, 0.7764706, 1, 0, 1,
-0.8422003, 0.362836, -2.404187, 0.7686275, 1, 0, 1,
-0.8421434, -0.4797721, -2.289873, 0.7647059, 1, 0, 1,
-0.8383344, -0.1229478, -2.676689, 0.7568628, 1, 0, 1,
-0.8375947, -0.2458718, -2.973635, 0.7529412, 1, 0, 1,
-0.8208575, -0.6214901, -3.23522, 0.7450981, 1, 0, 1,
-0.820522, -0.248371, -0.8312648, 0.7411765, 1, 0, 1,
-0.8196191, 0.791068, -0.3867897, 0.7333333, 1, 0, 1,
-0.8183709, 0.1630935, -2.855646, 0.7294118, 1, 0, 1,
-0.8062343, 1.810065, -1.857517, 0.7215686, 1, 0, 1,
-0.8041589, -2.042862, -3.046731, 0.7176471, 1, 0, 1,
-0.7970118, -2.24041, -2.557377, 0.7098039, 1, 0, 1,
-0.7961815, -0.2235238, -1.027413, 0.7058824, 1, 0, 1,
-0.7862241, -2.226021, -0.297774, 0.6980392, 1, 0, 1,
-0.7859522, -0.3772776, -2.656683, 0.6901961, 1, 0, 1,
-0.7805198, -1.010331, -2.183619, 0.6862745, 1, 0, 1,
-0.7701617, 0.3471156, -1.647349, 0.6784314, 1, 0, 1,
-0.7621003, 0.4221408, -1.709678, 0.6745098, 1, 0, 1,
-0.7609448, 0.1131302, -1.183673, 0.6666667, 1, 0, 1,
-0.7581474, 0.2216409, -4.243849, 0.6627451, 1, 0, 1,
-0.7557953, 0.3475841, -0.6867551, 0.654902, 1, 0, 1,
-0.7549456, 0.797873, 0.9103942, 0.6509804, 1, 0, 1,
-0.7481515, 0.1481633, -1.791334, 0.6431373, 1, 0, 1,
-0.7453363, -1.70555, -2.915174, 0.6392157, 1, 0, 1,
-0.7452964, 0.8963903, -0.9610873, 0.6313726, 1, 0, 1,
-0.7401303, -1.477824, -2.419617, 0.627451, 1, 0, 1,
-0.7368549, 0.8940971, 0.2934924, 0.6196079, 1, 0, 1,
-0.734402, -0.10602, -1.575535, 0.6156863, 1, 0, 1,
-0.7282423, -0.01292816, -1.814776, 0.6078432, 1, 0, 1,
-0.7281949, 1.549978, 2.116237, 0.6039216, 1, 0, 1,
-0.7261822, 0.7228072, -0.3937601, 0.5960785, 1, 0, 1,
-0.7261214, -0.6214798, -1.783165, 0.5882353, 1, 0, 1,
-0.7246182, -0.1048113, -3.202139, 0.5843138, 1, 0, 1,
-0.7217628, 0.5172707, -1.352919, 0.5764706, 1, 0, 1,
-0.7187876, -1.731925, -1.851967, 0.572549, 1, 0, 1,
-0.7184976, -0.2811297, -1.930974, 0.5647059, 1, 0, 1,
-0.7121292, -0.4330029, -2.649021, 0.5607843, 1, 0, 1,
-0.7120778, 0.5905316, 0.1507185, 0.5529412, 1, 0, 1,
-0.7109426, -0.5411758, -3.244898, 0.5490196, 1, 0, 1,
-0.7025835, 0.6529443, -0.4217803, 0.5411765, 1, 0, 1,
-0.6992468, 0.3915541, 0.3944131, 0.5372549, 1, 0, 1,
-0.6983639, -0.2919872, -1.999138, 0.5294118, 1, 0, 1,
-0.6979665, 0.2523375, -0.3142699, 0.5254902, 1, 0, 1,
-0.6950997, 1.263861, 1.060266, 0.5176471, 1, 0, 1,
-0.691448, 1.548261, -0.5811054, 0.5137255, 1, 0, 1,
-0.6896878, -1.777702, -1.027442, 0.5058824, 1, 0, 1,
-0.6754118, -1.013782, -3.852317, 0.5019608, 1, 0, 1,
-0.6749588, -0.5511495, -2.125122, 0.4941176, 1, 0, 1,
-0.674526, 0.624202, -2.232321, 0.4862745, 1, 0, 1,
-0.6723313, 0.7624494, -0.8661411, 0.4823529, 1, 0, 1,
-0.6700729, 0.4940426, 0.6061493, 0.4745098, 1, 0, 1,
-0.6695035, 1.706334, -1.078237, 0.4705882, 1, 0, 1,
-0.6683047, -1.086309, -2.08906, 0.4627451, 1, 0, 1,
-0.6617378, -0.217154, -3.228473, 0.4588235, 1, 0, 1,
-0.6615344, -1.270281, -2.791662, 0.4509804, 1, 0, 1,
-0.6615167, -1.188098, -3.410443, 0.4470588, 1, 0, 1,
-0.6612957, 1.474484, 0.3852286, 0.4392157, 1, 0, 1,
-0.6612753, -0.02736425, -2.555896, 0.4352941, 1, 0, 1,
-0.6553055, 0.2397149, -1.519983, 0.427451, 1, 0, 1,
-0.6521704, 0.1969652, -2.075004, 0.4235294, 1, 0, 1,
-0.6490732, 0.7291465, -1.05722, 0.4156863, 1, 0, 1,
-0.6463641, 0.5172364, -0.2783115, 0.4117647, 1, 0, 1,
-0.646295, -0.05732521, -0.388302, 0.4039216, 1, 0, 1,
-0.6443448, -0.5732226, -2.847679, 0.3960784, 1, 0, 1,
-0.6359503, 0.3069602, -0.3489985, 0.3921569, 1, 0, 1,
-0.6336439, 0.5311264, -1.907978, 0.3843137, 1, 0, 1,
-0.6335677, -0.3514818, -1.126354, 0.3803922, 1, 0, 1,
-0.6297817, -0.8655055, -2.314152, 0.372549, 1, 0, 1,
-0.6287103, -1.311536, -2.374567, 0.3686275, 1, 0, 1,
-0.6211045, 1.424061, -0.1872052, 0.3607843, 1, 0, 1,
-0.6128463, 1.018813, -1.5538, 0.3568628, 1, 0, 1,
-0.605817, 0.886254, -0.5729977, 0.3490196, 1, 0, 1,
-0.6055231, 0.5143384, -0.08772784, 0.345098, 1, 0, 1,
-0.6018741, -0.2814075, -2.856435, 0.3372549, 1, 0, 1,
-0.5985867, -1.22783, -2.47776, 0.3333333, 1, 0, 1,
-0.5832511, -0.4174798, -4.2331, 0.3254902, 1, 0, 1,
-0.5827575, 1.617947, -2.735656, 0.3215686, 1, 0, 1,
-0.5787635, 0.3033825, -0.5999001, 0.3137255, 1, 0, 1,
-0.575548, 0.218412, -2.33806, 0.3098039, 1, 0, 1,
-0.5653447, 1.467246, -2.563565, 0.3019608, 1, 0, 1,
-0.5651643, -0.2953861, -3.502216, 0.2941177, 1, 0, 1,
-0.5569989, 0.4119306, -2.860777, 0.2901961, 1, 0, 1,
-0.5568953, -0.5191473, -2.366689, 0.282353, 1, 0, 1,
-0.5565934, -0.8913504, -2.19009, 0.2784314, 1, 0, 1,
-0.5541113, -0.0120965, -1.750183, 0.2705882, 1, 0, 1,
-0.5520727, -0.4407584, -1.833154, 0.2666667, 1, 0, 1,
-0.5516855, 0.7113308, -0.1776642, 0.2588235, 1, 0, 1,
-0.5509841, 1.31702, -0.7230434, 0.254902, 1, 0, 1,
-0.550053, 1.451447, 0.1891097, 0.2470588, 1, 0, 1,
-0.5474192, -0.9164801, -2.213096, 0.2431373, 1, 0, 1,
-0.5461462, 0.9274949, -1.351961, 0.2352941, 1, 0, 1,
-0.5437315, -0.9128829, -4.725297, 0.2313726, 1, 0, 1,
-0.5334585, -0.3274782, -1.823774, 0.2235294, 1, 0, 1,
-0.5333065, 1.221828, -0.6931412, 0.2196078, 1, 0, 1,
-0.532695, 1.881664, -0.5094844, 0.2117647, 1, 0, 1,
-0.5303711, 1.182284, 0.1929551, 0.2078431, 1, 0, 1,
-0.5272979, 1.629828, -0.1780348, 0.2, 1, 0, 1,
-0.5262992, 0.4932466, 0.8731507, 0.1921569, 1, 0, 1,
-0.5194225, 0.3995433, 0.08519623, 0.1882353, 1, 0, 1,
-0.5175475, 1.582358, -1.386829, 0.1803922, 1, 0, 1,
-0.5164881, -0.435597, -2.353567, 0.1764706, 1, 0, 1,
-0.5109215, -3.411339, -2.064163, 0.1686275, 1, 0, 1,
-0.5108525, 1.455449, -0.9585359, 0.1647059, 1, 0, 1,
-0.5059798, 1.073066, -1.846053, 0.1568628, 1, 0, 1,
-0.5050092, 0.2779115, -0.8129462, 0.1529412, 1, 0, 1,
-0.5026882, 0.4423585, -1.59621, 0.145098, 1, 0, 1,
-0.4981916, -0.753189, -2.78983, 0.1411765, 1, 0, 1,
-0.4974347, 0.8507829, -1.520442, 0.1333333, 1, 0, 1,
-0.4923034, -1.177534, -4.296107, 0.1294118, 1, 0, 1,
-0.4912308, 0.6247314, 1.20891, 0.1215686, 1, 0, 1,
-0.4909982, 0.1351558, -2.108174, 0.1176471, 1, 0, 1,
-0.4897172, 2.035519, -1.554251, 0.1098039, 1, 0, 1,
-0.4852602, 0.285622, 0.02984169, 0.1058824, 1, 0, 1,
-0.4816329, -2.451915, -4.113638, 0.09803922, 1, 0, 1,
-0.4750656, 0.5077323, -0.1164483, 0.09019608, 1, 0, 1,
-0.4733612, 0.9137215, -0.4323617, 0.08627451, 1, 0, 1,
-0.4711606, 0.4530759, -0.6374621, 0.07843138, 1, 0, 1,
-0.4708569, -0.5291563, -2.815401, 0.07450981, 1, 0, 1,
-0.4702019, -0.2085972, -2.205153, 0.06666667, 1, 0, 1,
-0.4677602, 0.5716019, -0.2081471, 0.0627451, 1, 0, 1,
-0.4541878, -0.3928125, -1.816378, 0.05490196, 1, 0, 1,
-0.4526814, 0.7901638, 1.194482, 0.05098039, 1, 0, 1,
-0.4462779, 0.1832298, -0.2059099, 0.04313726, 1, 0, 1,
-0.4431609, -0.3666004, -1.117091, 0.03921569, 1, 0, 1,
-0.4429885, -1.543546, -3.846847, 0.03137255, 1, 0, 1,
-0.4409851, 0.6342391, -0.9045394, 0.02745098, 1, 0, 1,
-0.4391603, 1.114027, 0.4423317, 0.01960784, 1, 0, 1,
-0.4362955, 0.1351301, -1.263801, 0.01568628, 1, 0, 1,
-0.4362883, -1.860097, -3.587768, 0.007843138, 1, 0, 1,
-0.4357118, -0.5367206, -2.04747, 0.003921569, 1, 0, 1,
-0.4332065, 0.4490299, -0.9841694, 0, 1, 0.003921569, 1,
-0.4304394, -0.3655777, -1.281241, 0, 1, 0.01176471, 1,
-0.4288715, 0.5227223, 0.5469877, 0, 1, 0.01568628, 1,
-0.4224657, -0.3305805, -2.887162, 0, 1, 0.02352941, 1,
-0.419774, 1.592862, 0.8060349, 0, 1, 0.02745098, 1,
-0.4173707, -0.3381908, -4.546415, 0, 1, 0.03529412, 1,
-0.4139036, -0.4165613, -3.885559, 0, 1, 0.03921569, 1,
-0.4136313, -1.844025, -2.377349, 0, 1, 0.04705882, 1,
-0.4116189, 0.1926885, -1.769341, 0, 1, 0.05098039, 1,
-0.4111643, -0.1410058, -2.731039, 0, 1, 0.05882353, 1,
-0.4093343, 0.04425046, -1.278292, 0, 1, 0.0627451, 1,
-0.4058886, -0.2107923, -2.770094, 0, 1, 0.07058824, 1,
-0.4038053, -0.7538129, -2.128737, 0, 1, 0.07450981, 1,
-0.401937, -0.4201711, -1.883231, 0, 1, 0.08235294, 1,
-0.396399, 1.081609, -1.106699, 0, 1, 0.08627451, 1,
-0.390417, -1.164668, -0.4337364, 0, 1, 0.09411765, 1,
-0.3892457, 0.3219669, -0.6318171, 0, 1, 0.1019608, 1,
-0.387846, -0.1183712, 0.2101414, 0, 1, 0.1058824, 1,
-0.3861526, 0.2058827, -2.499326, 0, 1, 0.1137255, 1,
-0.3851629, -0.918272, -3.488727, 0, 1, 0.1176471, 1,
-0.3824818, 0.4737712, -0.3350367, 0, 1, 0.1254902, 1,
-0.3809378, -1.954081, -2.781392, 0, 1, 0.1294118, 1,
-0.3771964, -1.21077, -3.503955, 0, 1, 0.1372549, 1,
-0.3751653, -0.7393231, -3.591717, 0, 1, 0.1411765, 1,
-0.3741969, 1.344502, -1.896093, 0, 1, 0.1490196, 1,
-0.3736171, 0.3518991, -0.2340332, 0, 1, 0.1529412, 1,
-0.3662229, -0.1454892, -1.191442, 0, 1, 0.1607843, 1,
-0.3527253, 0.1060067, 0.7168807, 0, 1, 0.1647059, 1,
-0.343423, -1.286689, -3.706929, 0, 1, 0.172549, 1,
-0.3394508, 0.8720168, 0.2572508, 0, 1, 0.1764706, 1,
-0.3367063, -0.5380264, -2.604318, 0, 1, 0.1843137, 1,
-0.3364604, 0.1386187, -0.5430186, 0, 1, 0.1882353, 1,
-0.3321052, 0.5201184, -0.868259, 0, 1, 0.1960784, 1,
-0.3292892, -0.8250829, -3.526466, 0, 1, 0.2039216, 1,
-0.3271359, -0.350879, -2.688124, 0, 1, 0.2078431, 1,
-0.3204443, -0.1233317, -2.246315, 0, 1, 0.2156863, 1,
-0.3200417, 0.04765375, -2.915381, 0, 1, 0.2196078, 1,
-0.3183307, 0.6759122, -1.067266, 0, 1, 0.227451, 1,
-0.3181377, -0.6021727, -1.719427, 0, 1, 0.2313726, 1,
-0.3173932, 0.9719735, 0.0361986, 0, 1, 0.2392157, 1,
-0.3149483, 0.8266302, 1.49822, 0, 1, 0.2431373, 1,
-0.3115394, -0.003823799, -1.789507, 0, 1, 0.2509804, 1,
-0.3105203, 0.01755342, -1.155867, 0, 1, 0.254902, 1,
-0.3076491, 0.8014123, 0.3802031, 0, 1, 0.2627451, 1,
-0.3054557, 0.9436985, -0.8056985, 0, 1, 0.2666667, 1,
-0.3044886, 0.3139355, -1.749616, 0, 1, 0.2745098, 1,
-0.2971743, -0.3951321, -4.055259, 0, 1, 0.2784314, 1,
-0.2961852, -0.4718289, -3.139592, 0, 1, 0.2862745, 1,
-0.2942996, 0.419978, 0.8451205, 0, 1, 0.2901961, 1,
-0.2910595, 0.6712641, -1.925337, 0, 1, 0.2980392, 1,
-0.2878071, -0.154422, -1.006664, 0, 1, 0.3058824, 1,
-0.2873419, -0.04305561, -1.266817, 0, 1, 0.3098039, 1,
-0.2767493, -1.751225, -3.923156, 0, 1, 0.3176471, 1,
-0.2750673, -0.2549997, -1.322626, 0, 1, 0.3215686, 1,
-0.2739899, 0.7152216, -0.0601709, 0, 1, 0.3294118, 1,
-0.2739885, -0.18573, -1.303758, 0, 1, 0.3333333, 1,
-0.2702976, 0.06392924, -0.178859, 0, 1, 0.3411765, 1,
-0.2666019, -0.1910248, -1.007536, 0, 1, 0.345098, 1,
-0.2626232, -1.295642, -2.311037, 0, 1, 0.3529412, 1,
-0.261077, -2.069478, -3.367744, 0, 1, 0.3568628, 1,
-0.259879, -1.438353, -5.765494, 0, 1, 0.3647059, 1,
-0.2596652, -2.208732, -3.555146, 0, 1, 0.3686275, 1,
-0.256715, 1.088908, -1.387978, 0, 1, 0.3764706, 1,
-0.2559998, -1.685707, -2.728715, 0, 1, 0.3803922, 1,
-0.2519448, -1.698552, -0.2452332, 0, 1, 0.3882353, 1,
-0.2435787, 1.335472, -0.8458247, 0, 1, 0.3921569, 1,
-0.2416333, 0.7724491, -2.814519, 0, 1, 0.4, 1,
-0.2349991, 0.7527102, 0.699845, 0, 1, 0.4078431, 1,
-0.2346683, -0.3039463, -4.797767, 0, 1, 0.4117647, 1,
-0.2325986, -0.9431622, -3.179006, 0, 1, 0.4196078, 1,
-0.2280339, 0.7931077, -1.867254, 0, 1, 0.4235294, 1,
-0.2271458, 1.692643, -0.5064489, 0, 1, 0.4313726, 1,
-0.22396, -0.1753517, -1.641901, 0, 1, 0.4352941, 1,
-0.2230982, 0.3131468, -1.253626, 0, 1, 0.4431373, 1,
-0.2177414, -0.4413294, -2.125556, 0, 1, 0.4470588, 1,
-0.2087767, -0.8242317, -2.492748, 0, 1, 0.454902, 1,
-0.2062593, 1.254621, -0.5993083, 0, 1, 0.4588235, 1,
-0.2010419, 1.230271, -0.649776, 0, 1, 0.4666667, 1,
-0.199697, -0.06606174, -1.589362, 0, 1, 0.4705882, 1,
-0.198681, 2.082027, -0.2368975, 0, 1, 0.4784314, 1,
-0.1962162, 1.099534, 0.3427093, 0, 1, 0.4823529, 1,
-0.1952218, 1.742329, 0.230069, 0, 1, 0.4901961, 1,
-0.1926019, 2.019819, 1.078256, 0, 1, 0.4941176, 1,
-0.1905658, -1.035438, -2.53433, 0, 1, 0.5019608, 1,
-0.1905223, 0.6449334, -0.07459089, 0, 1, 0.509804, 1,
-0.1900883, -0.6264568, -3.723162, 0, 1, 0.5137255, 1,
-0.1865921, -0.5623468, -3.158173, 0, 1, 0.5215687, 1,
-0.1861004, 0.9038503, -0.04772096, 0, 1, 0.5254902, 1,
-0.186001, 0.7529215, -1.128167, 0, 1, 0.5333334, 1,
-0.1854964, 1.117486, 0.2980555, 0, 1, 0.5372549, 1,
-0.1762277, -0.649993, -2.49215, 0, 1, 0.5450981, 1,
-0.1754183, -0.994508, -2.667947, 0, 1, 0.5490196, 1,
-0.175085, -0.008311542, -1.903084, 0, 1, 0.5568628, 1,
-0.1744354, 0.619575, 0.6392525, 0, 1, 0.5607843, 1,
-0.1674125, -0.1936996, -2.808517, 0, 1, 0.5686275, 1,
-0.1653691, -1.193618, -3.09692, 0, 1, 0.572549, 1,
-0.1629208, -0.2041634, -3.254948, 0, 1, 0.5803922, 1,
-0.161407, -0.7261828, -2.81358, 0, 1, 0.5843138, 1,
-0.1598692, 1.817289, 0.6682643, 0, 1, 0.5921569, 1,
-0.1598665, 0.1142269, -0.5960429, 0, 1, 0.5960785, 1,
-0.1577119, 0.7830841, -0.8318565, 0, 1, 0.6039216, 1,
-0.1540039, -0.9673066, -2.220016, 0, 1, 0.6117647, 1,
-0.1521647, 1.441046, -0.9306764, 0, 1, 0.6156863, 1,
-0.1520821, 0.9336001, -1.696566, 0, 1, 0.6235294, 1,
-0.1520588, -0.5259479, -2.378451, 0, 1, 0.627451, 1,
-0.1424704, -0.9191453, -2.928485, 0, 1, 0.6352941, 1,
-0.1416827, 0.9447416, -1.195528, 0, 1, 0.6392157, 1,
-0.141402, 0.03000802, -0.8315823, 0, 1, 0.6470588, 1,
-0.1390502, -0.2524767, -3.580355, 0, 1, 0.6509804, 1,
-0.1378037, -0.04780604, -1.654431, 0, 1, 0.6588235, 1,
-0.1321536, -0.584151, -3.066617, 0, 1, 0.6627451, 1,
-0.1293101, 1.638224, -0.8681452, 0, 1, 0.6705883, 1,
-0.1285444, -2.339455, -3.914051, 0, 1, 0.6745098, 1,
-0.1251795, -0.9029691, -3.512048, 0, 1, 0.682353, 1,
-0.1188258, -1.175042, -3.122918, 0, 1, 0.6862745, 1,
-0.1177724, -0.6009301, -3.583935, 0, 1, 0.6941177, 1,
-0.1103963, 1.673456, -0.3614909, 0, 1, 0.7019608, 1,
-0.104868, -1.695353, -4.831217, 0, 1, 0.7058824, 1,
-0.1043231, -0.7579997, -3.998598, 0, 1, 0.7137255, 1,
-0.1033566, -1.126668, -2.396936, 0, 1, 0.7176471, 1,
-0.1006123, -0.5234531, -3.440383, 0, 1, 0.7254902, 1,
-0.09609753, 1.620542, -0.5525045, 0, 1, 0.7294118, 1,
-0.09514215, -0.4494916, -2.805974, 0, 1, 0.7372549, 1,
-0.08830219, -0.3735952, -3.014626, 0, 1, 0.7411765, 1,
-0.08762281, 0.7006761, 1.226639, 0, 1, 0.7490196, 1,
-0.0857923, 0.0005282118, -3.496416, 0, 1, 0.7529412, 1,
-0.08517072, -0.7291204, -1.741074, 0, 1, 0.7607843, 1,
-0.08495808, 0.9823399, -0.720931, 0, 1, 0.7647059, 1,
-0.08437175, -1.771761, -2.761979, 0, 1, 0.772549, 1,
-0.07778782, -0.7207549, -2.529435, 0, 1, 0.7764706, 1,
-0.07469265, -0.2744548, -3.338042, 0, 1, 0.7843137, 1,
-0.07350801, 0.4654225, 0.6598087, 0, 1, 0.7882353, 1,
-0.05811009, 0.4043523, -0.9206825, 0, 1, 0.7960784, 1,
-0.05664372, -0.1658335, -2.486356, 0, 1, 0.8039216, 1,
-0.05600533, -0.1715083, -4.15854, 0, 1, 0.8078431, 1,
-0.05554973, -0.5148594, -2.055952, 0, 1, 0.8156863, 1,
-0.05547554, -0.838249, -2.234284, 0, 1, 0.8196079, 1,
-0.0535552, -1.281101, -4.67349, 0, 1, 0.827451, 1,
-0.05172478, -0.01041433, -1.819967, 0, 1, 0.8313726, 1,
-0.0510141, 0.6031932, 1.558933, 0, 1, 0.8392157, 1,
-0.04598559, -1.429791, -1.557305, 0, 1, 0.8431373, 1,
-0.04434166, 0.4104564, 0.5660777, 0, 1, 0.8509804, 1,
-0.04388003, -1.920561, -3.895173, 0, 1, 0.854902, 1,
-0.0412515, 0.7421345, 1.402667, 0, 1, 0.8627451, 1,
-0.03295559, 0.3364319, -0.7616186, 0, 1, 0.8666667, 1,
-0.0316177, -0.5098938, -3.008031, 0, 1, 0.8745098, 1,
-0.02706539, -1.472009, -1.915027, 0, 1, 0.8784314, 1,
-0.02609884, -1.246006, -2.459131, 0, 1, 0.8862745, 1,
-0.02569244, 0.4993853, 1.28301, 0, 1, 0.8901961, 1,
-0.02535428, 0.6147717, 0.3903387, 0, 1, 0.8980392, 1,
-0.0211024, 1.422821, 0.3454412, 0, 1, 0.9058824, 1,
-0.0207172, 0.5711771, 0.7603674, 0, 1, 0.9098039, 1,
-0.02047799, 0.1832904, 0.1954302, 0, 1, 0.9176471, 1,
-0.01977951, -0.9406588, -3.364178, 0, 1, 0.9215686, 1,
-0.01046098, 0.2157387, -0.8470044, 0, 1, 0.9294118, 1,
-0.01024395, -0.5611525, -3.253431, 0, 1, 0.9333333, 1,
-0.01018417, 0.7888597, 0.3415796, 0, 1, 0.9411765, 1,
-0.009657849, 0.413462, -0.8687728, 0, 1, 0.945098, 1,
-0.008428998, -0.883871, -2.703501, 0, 1, 0.9529412, 1,
-0.004485017, -1.539261, -2.75486, 0, 1, 0.9568627, 1,
-0.003591294, 1.47034, 0.2469234, 0, 1, 0.9647059, 1,
0.005441774, 0.1387345, 1.023299, 0, 1, 0.9686275, 1,
0.009341038, -0.8667106, 3.07459, 0, 1, 0.9764706, 1,
0.01763617, -0.08225516, 2.657098, 0, 1, 0.9803922, 1,
0.01783593, 0.8053885, 1.222243, 0, 1, 0.9882353, 1,
0.01981043, 0.7273543, -1.012589, 0, 1, 0.9921569, 1,
0.02900592, -0.8382491, 2.095979, 0, 1, 1, 1,
0.03073868, 2.744295, -0.470992, 0, 0.9921569, 1, 1,
0.0319871, -1.199869, 4.908864, 0, 0.9882353, 1, 1,
0.03374052, -0.03638222, 3.443616, 0, 0.9803922, 1, 1,
0.0338196, -1.541517, 3.473216, 0, 0.9764706, 1, 1,
0.0364681, -1.836647, 1.908759, 0, 0.9686275, 1, 1,
0.0370543, 0.3240173, -0.06148938, 0, 0.9647059, 1, 1,
0.03870317, 0.2514523, 0.02452821, 0, 0.9568627, 1, 1,
0.04094335, 0.1475736, 0.8308425, 0, 0.9529412, 1, 1,
0.04727244, -0.5612516, 2.955013, 0, 0.945098, 1, 1,
0.0538101, 0.1054268, -1.318953, 0, 0.9411765, 1, 1,
0.05563492, -0.01622838, 2.479563, 0, 0.9333333, 1, 1,
0.05885554, -1.141941, 2.777174, 0, 0.9294118, 1, 1,
0.06312671, 0.6598479, 0.4464346, 0, 0.9215686, 1, 1,
0.06637799, 0.01534708, 1.193454, 0, 0.9176471, 1, 1,
0.0671737, -1.448745, 3.234011, 0, 0.9098039, 1, 1,
0.08035746, 0.5283145, 0.2940452, 0, 0.9058824, 1, 1,
0.08208087, 1.872818, -0.2989447, 0, 0.8980392, 1, 1,
0.08217301, -0.9400563, 3.653068, 0, 0.8901961, 1, 1,
0.08290847, 0.9950154, -1.538096, 0, 0.8862745, 1, 1,
0.08315119, -0.584033, 3.74981, 0, 0.8784314, 1, 1,
0.08465452, -1.366489, 2.514272, 0, 0.8745098, 1, 1,
0.0857787, -0.9488415, 2.45169, 0, 0.8666667, 1, 1,
0.08579875, -1.148457, 4.561, 0, 0.8627451, 1, 1,
0.08957592, -1.534671, 5.540652, 0, 0.854902, 1, 1,
0.09184247, 0.1703678, -0.6481211, 0, 0.8509804, 1, 1,
0.09248028, 1.480911, -1.70677, 0, 0.8431373, 1, 1,
0.09333902, -1.725571, 4.902617, 0, 0.8392157, 1, 1,
0.09883036, 0.9816565, 1.147249, 0, 0.8313726, 1, 1,
0.09898777, -0.01922646, 2.113621, 0, 0.827451, 1, 1,
0.09935359, -0.4506206, 2.837016, 0, 0.8196079, 1, 1,
0.1001468, -1.374258, 2.851748, 0, 0.8156863, 1, 1,
0.1082802, -0.1017998, 4.120205, 0, 0.8078431, 1, 1,
0.1090999, -1.607488, 3.651997, 0, 0.8039216, 1, 1,
0.1113586, -1.343511, 2.707917, 0, 0.7960784, 1, 1,
0.1142563, 0.8017949, 0.3100767, 0, 0.7882353, 1, 1,
0.1187442, -0.6350068, 3.02833, 0, 0.7843137, 1, 1,
0.1192561, 0.2547467, 1.355773, 0, 0.7764706, 1, 1,
0.121876, 0.8747634, 1.397661, 0, 0.772549, 1, 1,
0.1245238, -0.6954917, 3.985904, 0, 0.7647059, 1, 1,
0.1274261, -0.3313217, 1.213534, 0, 0.7607843, 1, 1,
0.1288321, 0.09028798, 2.916325, 0, 0.7529412, 1, 1,
0.1291024, 0.6512077, 0.3106568, 0, 0.7490196, 1, 1,
0.1317157, 0.6990829, -1.990301, 0, 0.7411765, 1, 1,
0.1349641, 0.7136915, 0.7778351, 0, 0.7372549, 1, 1,
0.1350493, 2.039967, 1.463023, 0, 0.7294118, 1, 1,
0.1366729, -0.1140972, 1.179179, 0, 0.7254902, 1, 1,
0.1383732, 1.75172, 0.4239768, 0, 0.7176471, 1, 1,
0.1392026, 0.4921553, 0.8129945, 0, 0.7137255, 1, 1,
0.1416707, 0.1196781, -0.2917087, 0, 0.7058824, 1, 1,
0.1444595, 0.1086852, 0.7936589, 0, 0.6980392, 1, 1,
0.1459167, 1.419829, 0.4636067, 0, 0.6941177, 1, 1,
0.1487943, 0.4149169, 0.8015139, 0, 0.6862745, 1, 1,
0.1490333, 0.7210372, 0.9269283, 0, 0.682353, 1, 1,
0.1507382, -0.1483283, -0.5965595, 0, 0.6745098, 1, 1,
0.1522559, 0.6645969, 1.268116, 0, 0.6705883, 1, 1,
0.152398, 3.097759, -1.854363, 0, 0.6627451, 1, 1,
0.1551893, -0.3546248, 3.603679, 0, 0.6588235, 1, 1,
0.1560785, 0.8869863, 0.3542261, 0, 0.6509804, 1, 1,
0.1578072, -1.902431, 2.833528, 0, 0.6470588, 1, 1,
0.1584428, -1.380396, 1.953784, 0, 0.6392157, 1, 1,
0.1590805, -0.2129976, 2.508548, 0, 0.6352941, 1, 1,
0.1590933, -0.6370103, 3.145671, 0, 0.627451, 1, 1,
0.1616826, -0.8475789, 2.685236, 0, 0.6235294, 1, 1,
0.1628388, 1.433535, 1.08111, 0, 0.6156863, 1, 1,
0.1642889, 0.4939714, 0.001955553, 0, 0.6117647, 1, 1,
0.1709274, 0.01403953, 2.41481, 0, 0.6039216, 1, 1,
0.1736743, -2.242026, 4.189888, 0, 0.5960785, 1, 1,
0.1791301, 0.97185, -0.06640001, 0, 0.5921569, 1, 1,
0.1828428, 0.4179698, 0.7028868, 0, 0.5843138, 1, 1,
0.1840516, -0.3093327, 2.756855, 0, 0.5803922, 1, 1,
0.1866946, 0.3219496, -0.1482341, 0, 0.572549, 1, 1,
0.1918501, 0.2209083, 1.770209, 0, 0.5686275, 1, 1,
0.1935148, -0.8460389, 4.062531, 0, 0.5607843, 1, 1,
0.1978669, 0.3536885, 1.886169, 0, 0.5568628, 1, 1,
0.2011222, -0.1503411, 0.3454134, 0, 0.5490196, 1, 1,
0.202149, 0.6568976, 0.1097875, 0, 0.5450981, 1, 1,
0.2023849, 0.203251, 2.135863, 0, 0.5372549, 1, 1,
0.2053299, -0.2055076, 1.410903, 0, 0.5333334, 1, 1,
0.2053768, 2.096925, 0.3959952, 0, 0.5254902, 1, 1,
0.210698, 0.543108, 1.607485, 0, 0.5215687, 1, 1,
0.2150328, 1.409812, 0.7867576, 0, 0.5137255, 1, 1,
0.2196049, 0.0107076, 1.275069, 0, 0.509804, 1, 1,
0.2196697, -0.4771976, 4.012315, 0, 0.5019608, 1, 1,
0.2210465, -0.333208, 3.762585, 0, 0.4941176, 1, 1,
0.2220675, -0.5107762, 3.882303, 0, 0.4901961, 1, 1,
0.2258535, -0.6859813, 2.097034, 0, 0.4823529, 1, 1,
0.2268833, 1.177964, 1.273129, 0, 0.4784314, 1, 1,
0.229282, -1.426117, 2.105953, 0, 0.4705882, 1, 1,
0.2346089, 0.3562903, -0.6878142, 0, 0.4666667, 1, 1,
0.2352727, -1.175318, 4.046823, 0, 0.4588235, 1, 1,
0.2368933, 0.8399323, 0.2414557, 0, 0.454902, 1, 1,
0.2373099, 1.620763, -1.055395, 0, 0.4470588, 1, 1,
0.2413654, -0.04849505, 2.853312, 0, 0.4431373, 1, 1,
0.2429403, -0.4941588, 3.165558, 0, 0.4352941, 1, 1,
0.2454495, 1.03374, 1.075175, 0, 0.4313726, 1, 1,
0.2456964, -0.7489707, 1.724778, 0, 0.4235294, 1, 1,
0.2464568, -0.8565257, 3.498999, 0, 0.4196078, 1, 1,
0.2506412, -0.8025245, 3.957371, 0, 0.4117647, 1, 1,
0.2518728, -0.1307281, 2.437628, 0, 0.4078431, 1, 1,
0.2525847, -0.5132013, 1.622248, 0, 0.4, 1, 1,
0.2595637, -0.02234567, 0.3189987, 0, 0.3921569, 1, 1,
0.2650154, -0.2191082, 2.096057, 0, 0.3882353, 1, 1,
0.2664508, 0.391314, 1.248731, 0, 0.3803922, 1, 1,
0.2672455, -1.181516, 3.213475, 0, 0.3764706, 1, 1,
0.26776, 1.064758, 1.281943, 0, 0.3686275, 1, 1,
0.2709666, -0.5940767, 3.610626, 0, 0.3647059, 1, 1,
0.2709788, 0.140029, 1.23967, 0, 0.3568628, 1, 1,
0.2776803, 0.7302228, 0.1552097, 0, 0.3529412, 1, 1,
0.2811683, 0.8281389, -0.8671337, 0, 0.345098, 1, 1,
0.2882372, -0.7278138, 2.704616, 0, 0.3411765, 1, 1,
0.2901567, -0.443266, 1.694938, 0, 0.3333333, 1, 1,
0.292891, 1.169327, -0.03833554, 0, 0.3294118, 1, 1,
0.2935995, -2.348159, 1.772431, 0, 0.3215686, 1, 1,
0.2938042, -0.6282855, 2.492524, 0, 0.3176471, 1, 1,
0.2958527, 0.6172718, -0.6199157, 0, 0.3098039, 1, 1,
0.3018173, -0.2222841, 1.301327, 0, 0.3058824, 1, 1,
0.3118133, -1.065486, 3.535039, 0, 0.2980392, 1, 1,
0.3124238, -0.5030574, 2.477938, 0, 0.2901961, 1, 1,
0.31667, 0.08692653, 0.6500118, 0, 0.2862745, 1, 1,
0.3205365, -0.1304204, 0.7989377, 0, 0.2784314, 1, 1,
0.3214685, 1.079217, 0.0606062, 0, 0.2745098, 1, 1,
0.3221889, 0.2782997, 1.791457, 0, 0.2666667, 1, 1,
0.3295818, -1.114696, 3.912158, 0, 0.2627451, 1, 1,
0.3331708, -0.2737877, 1.802643, 0, 0.254902, 1, 1,
0.3343635, -1.97766, 2.164752, 0, 0.2509804, 1, 1,
0.3354829, 0.7146669, 0.3885386, 0, 0.2431373, 1, 1,
0.3369914, 0.3340415, -0.9998307, 0, 0.2392157, 1, 1,
0.3391937, 2.953156, 0.6634458, 0, 0.2313726, 1, 1,
0.3400544, -0.3843532, 1.124177, 0, 0.227451, 1, 1,
0.3421373, 0.09048223, 1.48332, 0, 0.2196078, 1, 1,
0.3422514, -0.8835694, 2.735819, 0, 0.2156863, 1, 1,
0.3451755, -1.649169, 3.559659, 0, 0.2078431, 1, 1,
0.3482477, 0.4072839, 1.345817, 0, 0.2039216, 1, 1,
0.3532032, 1.693321, -1.713333, 0, 0.1960784, 1, 1,
0.3535154, 1.459158, 0.4825938, 0, 0.1882353, 1, 1,
0.3539311, 0.1240521, -1.107263, 0, 0.1843137, 1, 1,
0.3564304, 1.544572, -1.291032, 0, 0.1764706, 1, 1,
0.3566511, -2.106419, 3.624221, 0, 0.172549, 1, 1,
0.3568365, 0.8416716, 1.053039, 0, 0.1647059, 1, 1,
0.359468, -0.3873833, 4.3846, 0, 0.1607843, 1, 1,
0.3621724, 0.43993, -0.001571891, 0, 0.1529412, 1, 1,
0.3626591, -0.2200224, 2.037052, 0, 0.1490196, 1, 1,
0.3680829, 0.9964812, 0.6692697, 0, 0.1411765, 1, 1,
0.3687566, 0.3516448, 2.210259, 0, 0.1372549, 1, 1,
0.3688002, -1.042551, 3.621746, 0, 0.1294118, 1, 1,
0.3692313, 1.369322, -2.128302, 0, 0.1254902, 1, 1,
0.3700381, -0.8600136, 2.587738, 0, 0.1176471, 1, 1,
0.3724908, -0.4951612, 2.738836, 0, 0.1137255, 1, 1,
0.3737509, 0.7737413, -0.5604152, 0, 0.1058824, 1, 1,
0.3748262, -0.8910457, 3.980336, 0, 0.09803922, 1, 1,
0.3780574, 0.7384447, -1.069121, 0, 0.09411765, 1, 1,
0.3787125, -0.7095404, 4.038539, 0, 0.08627451, 1, 1,
0.3831648, -1.342569, 2.651583, 0, 0.08235294, 1, 1,
0.3832341, -1.215144, 2.750116, 0, 0.07450981, 1, 1,
0.3839993, -0.3467067, 3.125424, 0, 0.07058824, 1, 1,
0.3849213, -0.8295268, 4.72146, 0, 0.0627451, 1, 1,
0.3856485, -0.2215868, -0.4215705, 0, 0.05882353, 1, 1,
0.3860528, 0.01886761, 3.070045, 0, 0.05098039, 1, 1,
0.3879735, -0.271167, 0.5692806, 0, 0.04705882, 1, 1,
0.3897921, 0.7209437, 0.4730584, 0, 0.03921569, 1, 1,
0.3928628, 0.4181159, -0.2396262, 0, 0.03529412, 1, 1,
0.3950715, 1.336119, 0.7573751, 0, 0.02745098, 1, 1,
0.3958639, -1.416154, 2.381018, 0, 0.02352941, 1, 1,
0.3978306, 0.1305692, 1.963618, 0, 0.01568628, 1, 1,
0.401875, -0.8405389, 2.031601, 0, 0.01176471, 1, 1,
0.4098184, 0.1800644, 1.474406, 0, 0.003921569, 1, 1,
0.410403, -0.3932465, 2.30126, 0.003921569, 0, 1, 1,
0.41344, 0.1121729, -0.3076915, 0.007843138, 0, 1, 1,
0.4153023, -1.781538, 3.288245, 0.01568628, 0, 1, 1,
0.4158922, 0.0630777, 1.525023, 0.01960784, 0, 1, 1,
0.4182221, -0.4058136, 1.343948, 0.02745098, 0, 1, 1,
0.4240051, -1.059967, 2.607422, 0.03137255, 0, 1, 1,
0.4299532, 1.04252, 2.273865, 0.03921569, 0, 1, 1,
0.4304132, -0.8509401, 1.878076, 0.04313726, 0, 1, 1,
0.432791, -1.461761, 2.501874, 0.05098039, 0, 1, 1,
0.4347938, -0.7182554, 2.311706, 0.05490196, 0, 1, 1,
0.4389705, -0.2278069, 2.74437, 0.0627451, 0, 1, 1,
0.4410803, -0.105231, 1.76855, 0.06666667, 0, 1, 1,
0.4448706, 2.022395, 1.783832, 0.07450981, 0, 1, 1,
0.4485787, -0.5645323, 2.381643, 0.07843138, 0, 1, 1,
0.4490478, -1.146863, 3.08009, 0.08627451, 0, 1, 1,
0.4507405, -0.5868053, 2.639607, 0.09019608, 0, 1, 1,
0.4522844, 0.7457981, 0.7817206, 0.09803922, 0, 1, 1,
0.4561066, -0.4199701, 1.081962, 0.1058824, 0, 1, 1,
0.4566354, 1.081133, 1.312211, 0.1098039, 0, 1, 1,
0.4574855, -1.032375, 2.467251, 0.1176471, 0, 1, 1,
0.4592457, -0.5771218, 3.765664, 0.1215686, 0, 1, 1,
0.4603381, 0.5077257, 1.110988, 0.1294118, 0, 1, 1,
0.4607682, 1.2005, -0.9599761, 0.1333333, 0, 1, 1,
0.4668323, 2.898804, -1.457927, 0.1411765, 0, 1, 1,
0.4668836, 0.8358718, 1.897091, 0.145098, 0, 1, 1,
0.4682463, 0.312365, 1.307435, 0.1529412, 0, 1, 1,
0.4702067, 1.560257, 2.183834, 0.1568628, 0, 1, 1,
0.4716777, 0.469225, 0.7570224, 0.1647059, 0, 1, 1,
0.4734583, -0.6672837, 3.204581, 0.1686275, 0, 1, 1,
0.47468, -1.17448, 3.421404, 0.1764706, 0, 1, 1,
0.4772825, 1.267646, -0.6836012, 0.1803922, 0, 1, 1,
0.4810975, -1.37203, 2.55089, 0.1882353, 0, 1, 1,
0.4838389, -1.245285, 0.04800728, 0.1921569, 0, 1, 1,
0.4907016, 0.6441653, 0.6820947, 0.2, 0, 1, 1,
0.4929471, -1.578874, 3.300956, 0.2078431, 0, 1, 1,
0.4954521, -0.1094414, 2.169305, 0.2117647, 0, 1, 1,
0.4978605, -0.1644387, 2.597522, 0.2196078, 0, 1, 1,
0.4996607, -0.2247511, 1.211239, 0.2235294, 0, 1, 1,
0.5071877, 0.569722, 1.755313, 0.2313726, 0, 1, 1,
0.5143508, -0.2846839, 2.196347, 0.2352941, 0, 1, 1,
0.5167394, 0.7192025, 2.833285, 0.2431373, 0, 1, 1,
0.5293717, -0.008532736, 0.8630621, 0.2470588, 0, 1, 1,
0.5301454, -0.754732, 4.10812, 0.254902, 0, 1, 1,
0.5338907, -0.1135067, 0.8901376, 0.2588235, 0, 1, 1,
0.53727, 0.2095153, 2.19503, 0.2666667, 0, 1, 1,
0.5386741, -1.979615, 1.936667, 0.2705882, 0, 1, 1,
0.5388821, -0.5110373, 2.495166, 0.2784314, 0, 1, 1,
0.5402283, 2.13269, 0.728615, 0.282353, 0, 1, 1,
0.5465637, -0.3932712, 3.687253, 0.2901961, 0, 1, 1,
0.5483201, 0.04176157, 2.149571, 0.2941177, 0, 1, 1,
0.5549667, -0.4200775, 2.655697, 0.3019608, 0, 1, 1,
0.5569537, 1.078323, 0.2815676, 0.3098039, 0, 1, 1,
0.5581488, 0.7488372, 0.4467096, 0.3137255, 0, 1, 1,
0.5590851, -0.3211147, 3.107131, 0.3215686, 0, 1, 1,
0.5601776, -0.9186064, 4.345254, 0.3254902, 0, 1, 1,
0.5633736, 0.5283668, 2.107165, 0.3333333, 0, 1, 1,
0.5716487, 0.9971779, -0.2842516, 0.3372549, 0, 1, 1,
0.5720232, -1.561638, 0.8809478, 0.345098, 0, 1, 1,
0.5721694, 1.747897, -0.9169862, 0.3490196, 0, 1, 1,
0.5768977, -0.3317688, 1.446047, 0.3568628, 0, 1, 1,
0.5771531, 1.443591, 0.6899569, 0.3607843, 0, 1, 1,
0.5776335, 1.753169, -1.646486, 0.3686275, 0, 1, 1,
0.5777553, -0.6918908, 2.641146, 0.372549, 0, 1, 1,
0.5808319, 0.8529568, 0.5478804, 0.3803922, 0, 1, 1,
0.5814365, -0.3283392, 3.129616, 0.3843137, 0, 1, 1,
0.5893624, 0.1574973, -0.5974762, 0.3921569, 0, 1, 1,
0.5911769, -1.308663, 0.833299, 0.3960784, 0, 1, 1,
0.5949885, -0.6215956, 2.614578, 0.4039216, 0, 1, 1,
0.595345, -0.8531687, 2.512218, 0.4117647, 0, 1, 1,
0.6024152, 0.3288841, 0.5328858, 0.4156863, 0, 1, 1,
0.6033664, 0.6143746, 3.14971, 0.4235294, 0, 1, 1,
0.6130885, -0.2236854, 1.106807, 0.427451, 0, 1, 1,
0.6137586, -0.3106624, 3.071531, 0.4352941, 0, 1, 1,
0.6150101, 0.8516685, -1.489065, 0.4392157, 0, 1, 1,
0.6167841, -2.088937, 3.117921, 0.4470588, 0, 1, 1,
0.6269404, 1.683089, 0.434494, 0.4509804, 0, 1, 1,
0.6296893, -0.4289768, 1.493189, 0.4588235, 0, 1, 1,
0.6329579, 0.3040737, 2.003865, 0.4627451, 0, 1, 1,
0.6411474, -0.6734024, 0.1405382, 0.4705882, 0, 1, 1,
0.6425722, 0.185268, 1.407811, 0.4745098, 0, 1, 1,
0.6449784, -0.09452661, 1.645037, 0.4823529, 0, 1, 1,
0.6457399, 1.363751, 1.007655, 0.4862745, 0, 1, 1,
0.6487265, 0.4761843, 0.3279914, 0.4941176, 0, 1, 1,
0.6487609, -0.7620921, 4.701273, 0.5019608, 0, 1, 1,
0.6530418, 0.1857789, 0.3145016, 0.5058824, 0, 1, 1,
0.6540403, -0.2810307, 1.797046, 0.5137255, 0, 1, 1,
0.655345, 0.8315892, 0.7398046, 0.5176471, 0, 1, 1,
0.6569122, 1.043913, 0.8274301, 0.5254902, 0, 1, 1,
0.6611094, 0.9126093, 0.8752879, 0.5294118, 0, 1, 1,
0.664518, 2.633952, -0.09883656, 0.5372549, 0, 1, 1,
0.6713021, 0.09045488, 2.643942, 0.5411765, 0, 1, 1,
0.6724175, -0.4010085, 2.397039, 0.5490196, 0, 1, 1,
0.6838652, 0.5358456, 1.297367, 0.5529412, 0, 1, 1,
0.6881854, 0.6182112, 0.578491, 0.5607843, 0, 1, 1,
0.6884891, -0.4042459, 1.479676, 0.5647059, 0, 1, 1,
0.6915737, -1.549298, 1.01495, 0.572549, 0, 1, 1,
0.6951499, -0.6334357, 4.463656, 0.5764706, 0, 1, 1,
0.695541, -0.7337179, 2.242171, 0.5843138, 0, 1, 1,
0.6968421, -0.6858898, 1.831235, 0.5882353, 0, 1, 1,
0.7031375, 0.3479885, 1.664324, 0.5960785, 0, 1, 1,
0.7033779, 2.177892, -0.5912575, 0.6039216, 0, 1, 1,
0.7080474, -1.264204, 2.580493, 0.6078432, 0, 1, 1,
0.7128587, 1.322977, 0.787126, 0.6156863, 0, 1, 1,
0.7203494, 1.211521, 2.065326, 0.6196079, 0, 1, 1,
0.7254582, -0.639313, 1.526688, 0.627451, 0, 1, 1,
0.7293673, -0.6358939, 0.9423138, 0.6313726, 0, 1, 1,
0.7364781, 1.134214, 0.2460617, 0.6392157, 0, 1, 1,
0.7372146, 0.8420519, 3.278004, 0.6431373, 0, 1, 1,
0.7396452, 0.3048056, 0.7004536, 0.6509804, 0, 1, 1,
0.7402163, -0.8454676, 3.001243, 0.654902, 0, 1, 1,
0.7434158, -1.092788, 3.957586, 0.6627451, 0, 1, 1,
0.7484872, 0.7885954, 2.632402, 0.6666667, 0, 1, 1,
0.7500762, -0.8466699, 3.864882, 0.6745098, 0, 1, 1,
0.7504469, 1.270627, 1.15494, 0.6784314, 0, 1, 1,
0.7584711, 0.4330348, 0.7241631, 0.6862745, 0, 1, 1,
0.7596888, -0.1712894, 2.5467, 0.6901961, 0, 1, 1,
0.7603743, -0.02875441, 1.451098, 0.6980392, 0, 1, 1,
0.763684, -1.447422, 1.949508, 0.7058824, 0, 1, 1,
0.7679353, -2.059019, 3.309272, 0.7098039, 0, 1, 1,
0.7701848, 0.8092613, 2.514074, 0.7176471, 0, 1, 1,
0.7791179, -2.214559, 3.783099, 0.7215686, 0, 1, 1,
0.7817829, -1.089737, 1.06467, 0.7294118, 0, 1, 1,
0.7844145, 0.1340327, 1.161357, 0.7333333, 0, 1, 1,
0.7911326, 0.4301238, 1.86401, 0.7411765, 0, 1, 1,
0.7920831, -1.126664, 2.298398, 0.7450981, 0, 1, 1,
0.7938122, 1.819605, 0.3821285, 0.7529412, 0, 1, 1,
0.7953581, 0.460013, 2.151917, 0.7568628, 0, 1, 1,
0.8039488, -0.4366971, 1.056426, 0.7647059, 0, 1, 1,
0.8065518, -0.237997, 0.5362484, 0.7686275, 0, 1, 1,
0.8077469, 0.4106675, 0.1785304, 0.7764706, 0, 1, 1,
0.8125588, -1.369051, 0.9194043, 0.7803922, 0, 1, 1,
0.8174344, -0.7359154, 1.887345, 0.7882353, 0, 1, 1,
0.8194614, 0.5333042, -0.5533045, 0.7921569, 0, 1, 1,
0.8218839, -0.6122627, 2.5992, 0.8, 0, 1, 1,
0.8246849, -0.8604318, 2.582948, 0.8078431, 0, 1, 1,
0.8287104, -0.000823307, 1.111937, 0.8117647, 0, 1, 1,
0.8311778, -0.6282015, 3.121948, 0.8196079, 0, 1, 1,
0.8460265, -1.267242, 3.170043, 0.8235294, 0, 1, 1,
0.8465618, -0.3868591, 2.553481, 0.8313726, 0, 1, 1,
0.849303, -0.5259518, 3.218514, 0.8352941, 0, 1, 1,
0.8606781, -0.09991369, 1.970719, 0.8431373, 0, 1, 1,
0.8618412, -0.7299766, 1.885686, 0.8470588, 0, 1, 1,
0.8660036, 0.2592718, 2.300494, 0.854902, 0, 1, 1,
0.8698198, 1.524951, 0.3359978, 0.8588235, 0, 1, 1,
0.8730063, -0.1031322, 2.577781, 0.8666667, 0, 1, 1,
0.8738325, -1.185814, 2.994059, 0.8705882, 0, 1, 1,
0.8810031, -1.234033, 2.566642, 0.8784314, 0, 1, 1,
0.8832988, 0.3987608, 0.6615502, 0.8823529, 0, 1, 1,
0.8841459, -1.490039, 3.614488, 0.8901961, 0, 1, 1,
0.8850377, -1.048259, 2.883292, 0.8941177, 0, 1, 1,
0.8864267, 2.048505, 0.1925333, 0.9019608, 0, 1, 1,
0.8873567, -0.6918818, 2.307463, 0.9098039, 0, 1, 1,
0.8883582, -0.6497692, 3.752627, 0.9137255, 0, 1, 1,
0.8913097, -0.6659135, 1.476108, 0.9215686, 0, 1, 1,
0.8916792, -0.4757074, 0.09147658, 0.9254902, 0, 1, 1,
0.8971865, 0.5656461, -0.2541247, 0.9333333, 0, 1, 1,
0.8986849, -0.8914669, 1.805058, 0.9372549, 0, 1, 1,
0.8995146, 0.09422574, 0.6261483, 0.945098, 0, 1, 1,
0.9196267, -1.670455, 2.062622, 0.9490196, 0, 1, 1,
0.920873, 0.0001756198, 1.510123, 0.9568627, 0, 1, 1,
0.9296456, -0.8667512, 2.445398, 0.9607843, 0, 1, 1,
0.9347951, -0.6084508, 2.144778, 0.9686275, 0, 1, 1,
0.9461417, -0.1641695, 3.065854, 0.972549, 0, 1, 1,
0.9485487, -1.532921, 2.449539, 0.9803922, 0, 1, 1,
0.9553499, -0.7252268, 2.087871, 0.9843137, 0, 1, 1,
0.9555896, 0.8885244, 1.45948, 0.9921569, 0, 1, 1,
0.9634675, -0.0005405045, 2.436293, 0.9960784, 0, 1, 1,
0.9642372, -1.612457, 1.996599, 1, 0, 0.9960784, 1,
0.9646021, 1.370596, -1.023917, 1, 0, 0.9882353, 1,
0.9656667, 1.464124, -0.303899, 1, 0, 0.9843137, 1,
0.9697291, 1.284949, 0.0683372, 1, 0, 0.9764706, 1,
0.9747239, 0.4569699, -0.487558, 1, 0, 0.972549, 1,
0.9824554, -0.7377526, 2.316358, 1, 0, 0.9647059, 1,
0.9829737, -0.47079, 3.066, 1, 0, 0.9607843, 1,
0.9847386, 0.5854504, 0.0467202, 1, 0, 0.9529412, 1,
0.9929544, 1.410537, 0.6595401, 1, 0, 0.9490196, 1,
0.9952264, 1.054693, -1.229142, 1, 0, 0.9411765, 1,
1.001455, 0.8315858, -0.3735969, 1, 0, 0.9372549, 1,
1.00293, 0.5195346, 3.633605, 1, 0, 0.9294118, 1,
1.005108, -2.24467, 2.640986, 1, 0, 0.9254902, 1,
1.005825, 1.293191, 0.3957712, 1, 0, 0.9176471, 1,
1.007018, 1.236229, -0.4527767, 1, 0, 0.9137255, 1,
1.008086, -0.4077363, 1.663224, 1, 0, 0.9058824, 1,
1.011651, -0.6181598, 2.061184, 1, 0, 0.9019608, 1,
1.018428, -0.4675449, 0.8162482, 1, 0, 0.8941177, 1,
1.022646, 0.5421965, 0.4547498, 1, 0, 0.8862745, 1,
1.025977, 0.05328701, 0.8765722, 1, 0, 0.8823529, 1,
1.02876, 0.2404231, 2.615858, 1, 0, 0.8745098, 1,
1.031327, 1.000902, -0.3681294, 1, 0, 0.8705882, 1,
1.032135, 2.077384, 2.048284, 1, 0, 0.8627451, 1,
1.036619, 1.903557, -1.210993, 1, 0, 0.8588235, 1,
1.046269, -0.1680301, 1.032066, 1, 0, 0.8509804, 1,
1.048107, 0.098963, 2.08762, 1, 0, 0.8470588, 1,
1.066533, 0.4824101, 1.493075, 1, 0, 0.8392157, 1,
1.071626, 0.145935, 1.623898, 1, 0, 0.8352941, 1,
1.094208, -1.652329, 0.9530598, 1, 0, 0.827451, 1,
1.097764, 0.4805633, 1.226164, 1, 0, 0.8235294, 1,
1.097808, -0.5223466, 3.190239, 1, 0, 0.8156863, 1,
1.101516, 0.3607767, 0.7781523, 1, 0, 0.8117647, 1,
1.103238, -0.2916487, 2.363142, 1, 0, 0.8039216, 1,
1.105351, 1.824561, 0.1214318, 1, 0, 0.7960784, 1,
1.107834, 2.023083, 0.1594079, 1, 0, 0.7921569, 1,
1.11086, -0.1028937, 0.8159046, 1, 0, 0.7843137, 1,
1.118159, -0.6250312, 3.584215, 1, 0, 0.7803922, 1,
1.118922, -0.2202863, 1.257305, 1, 0, 0.772549, 1,
1.121664, 1.000268, -0.9246024, 1, 0, 0.7686275, 1,
1.130328, 0.05259022, -0.3325121, 1, 0, 0.7607843, 1,
1.137249, -0.587544, 2.03943, 1, 0, 0.7568628, 1,
1.138003, -0.3641319, 0.5455683, 1, 0, 0.7490196, 1,
1.138391, 1.24371, 2.351893, 1, 0, 0.7450981, 1,
1.140978, 0.5161774, 0.3901003, 1, 0, 0.7372549, 1,
1.152459, -0.3732391, 3.022754, 1, 0, 0.7333333, 1,
1.156956, 2.488661, 0.7550727, 1, 0, 0.7254902, 1,
1.159439, 0.4446517, 2.311426, 1, 0, 0.7215686, 1,
1.165944, -1.592404, 1.653304, 1, 0, 0.7137255, 1,
1.172997, 0.671658, 3.361073, 1, 0, 0.7098039, 1,
1.179976, -0.7811188, 1.215536, 1, 0, 0.7019608, 1,
1.181748, 1.493899, 1.656611, 1, 0, 0.6941177, 1,
1.187034, -1.229896, 2.02953, 1, 0, 0.6901961, 1,
1.190061, 1.619299, 0.4547304, 1, 0, 0.682353, 1,
1.208451, -2.211366, 2.541242, 1, 0, 0.6784314, 1,
1.210489, 0.7881178, 0.5194915, 1, 0, 0.6705883, 1,
1.21824, -0.3645131, 2.275179, 1, 0, 0.6666667, 1,
1.232278, -1.282034, 2.771107, 1, 0, 0.6588235, 1,
1.233793, -0.7949508, 2.042609, 1, 0, 0.654902, 1,
1.234069, -0.07884025, 2.212744, 1, 0, 0.6470588, 1,
1.237987, -1.739314, 2.711326, 1, 0, 0.6431373, 1,
1.238916, -0.3509667, 0.9744384, 1, 0, 0.6352941, 1,
1.246062, 0.4241598, 2.001763, 1, 0, 0.6313726, 1,
1.256587, 0.9633659, -0.6439813, 1, 0, 0.6235294, 1,
1.269665, -2.208942, 2.574353, 1, 0, 0.6196079, 1,
1.270483, -1.066073, 1.206197, 1, 0, 0.6117647, 1,
1.273253, 0.8904446, 0.2786089, 1, 0, 0.6078432, 1,
1.27693, -1.232381, 2.291059, 1, 0, 0.6, 1,
1.277948, 1.792829, 1.853249, 1, 0, 0.5921569, 1,
1.282811, -0.3904304, 3.701494, 1, 0, 0.5882353, 1,
1.283922, 0.6161077, -0.4308879, 1, 0, 0.5803922, 1,
1.288588, 0.4276512, 1.112268, 1, 0, 0.5764706, 1,
1.29278, -0.1038167, 1.788173, 1, 0, 0.5686275, 1,
1.295566, 0.5597315, 2.643437, 1, 0, 0.5647059, 1,
1.303948, -0.1052197, 3.441298, 1, 0, 0.5568628, 1,
1.305926, 0.1565709, -0.4153427, 1, 0, 0.5529412, 1,
1.309596, -0.3903103, 2.15651, 1, 0, 0.5450981, 1,
1.312896, -1.322357, 2.721546, 1, 0, 0.5411765, 1,
1.315699, -1.276133, 2.211513, 1, 0, 0.5333334, 1,
1.349468, 0.9985883, 3.046136, 1, 0, 0.5294118, 1,
1.361916, 0.1509929, 1.7471, 1, 0, 0.5215687, 1,
1.36404, 1.441556, 0.4184173, 1, 0, 0.5176471, 1,
1.372421, -1.144753, 2.746392, 1, 0, 0.509804, 1,
1.37442, 0.07486963, 2.208839, 1, 0, 0.5058824, 1,
1.37814, -0.02679356, 0.00978101, 1, 0, 0.4980392, 1,
1.378609, 1.374471, -0.02444194, 1, 0, 0.4901961, 1,
1.381153, 1.467308, 0.1741632, 1, 0, 0.4862745, 1,
1.412818, 0.1389077, 3.206033, 1, 0, 0.4784314, 1,
1.419259, 0.9404548, -0.4563293, 1, 0, 0.4745098, 1,
1.420067, 1.543293, 0.8993922, 1, 0, 0.4666667, 1,
1.434094, 1.363251, 0.6074069, 1, 0, 0.4627451, 1,
1.450405, 0.8363277, 2.102591, 1, 0, 0.454902, 1,
1.459566, -0.06308474, 2.101236, 1, 0, 0.4509804, 1,
1.465395, 1.764184, 1.372395, 1, 0, 0.4431373, 1,
1.466354, -0.37024, 1.896643, 1, 0, 0.4392157, 1,
1.485319, 0.7322799, 3.231169, 1, 0, 0.4313726, 1,
1.486433, 0.5153403, 3.196747, 1, 0, 0.427451, 1,
1.488701, 1.330954, 1.723001, 1, 0, 0.4196078, 1,
1.497883, -2.550197, 1.898355, 1, 0, 0.4156863, 1,
1.514855, -0.3479922, 1.635584, 1, 0, 0.4078431, 1,
1.5163, -1.068051, 1.515692, 1, 0, 0.4039216, 1,
1.537677, -0.2415992, 2.191589, 1, 0, 0.3960784, 1,
1.541358, 0.07657868, -1.610395, 1, 0, 0.3882353, 1,
1.54292, 1.427667, -0.2980767, 1, 0, 0.3843137, 1,
1.544229, 0.5724137, 1.078394, 1, 0, 0.3764706, 1,
1.546446, 0.250557, 1.262972, 1, 0, 0.372549, 1,
1.56312, -1.263757, 2.240828, 1, 0, 0.3647059, 1,
1.580965, 0.9666911, 3.167022, 1, 0, 0.3607843, 1,
1.582653, -0.03353811, 0.02780782, 1, 0, 0.3529412, 1,
1.583367, 0.1312239, 0.3555559, 1, 0, 0.3490196, 1,
1.588037, -2.287127, 0.7270437, 1, 0, 0.3411765, 1,
1.604612, -0.7223624, 2.197256, 1, 0, 0.3372549, 1,
1.605907, 1.546791, 2.436269, 1, 0, 0.3294118, 1,
1.616756, 0.5106437, 0.4323955, 1, 0, 0.3254902, 1,
1.636445, -1.275139, 2.195969, 1, 0, 0.3176471, 1,
1.646934, 0.7249194, 2.622782, 1, 0, 0.3137255, 1,
1.664042, 0.7790658, 2.483487, 1, 0, 0.3058824, 1,
1.667794, -0.7034279, 3.269076, 1, 0, 0.2980392, 1,
1.679541, 0.05335454, 2.876799, 1, 0, 0.2941177, 1,
1.681503, -1.559815, 2.343896, 1, 0, 0.2862745, 1,
1.706246, -0.2299294, 1.090746, 1, 0, 0.282353, 1,
1.739902, 1.256454, -0.5163879, 1, 0, 0.2745098, 1,
1.750246, -0.07073502, 2.164517, 1, 0, 0.2705882, 1,
1.755862, -1.338424, 1.723487, 1, 0, 0.2627451, 1,
1.767244, 1.710303, 1.061508, 1, 0, 0.2588235, 1,
1.779538, 0.0279754, 0.6101657, 1, 0, 0.2509804, 1,
1.781042, -1.761391, 3.879843, 1, 0, 0.2470588, 1,
1.789214, 0.1516477, 2.148698, 1, 0, 0.2392157, 1,
1.797246, -0.4863644, 0.8973848, 1, 0, 0.2352941, 1,
1.806992, 0.841883, 0.7831671, 1, 0, 0.227451, 1,
1.827956, -0.9366554, 1.325805, 1, 0, 0.2235294, 1,
1.834428, -0.7897885, 0.6016484, 1, 0, 0.2156863, 1,
1.842181, -0.4032445, 0.5470922, 1, 0, 0.2117647, 1,
1.843874, -0.02780964, 1.386536, 1, 0, 0.2039216, 1,
1.853106, -0.7320256, 1.265833, 1, 0, 0.1960784, 1,
1.863656, 1.539602, 0.8277414, 1, 0, 0.1921569, 1,
1.886455, -0.4424201, 1.201838, 1, 0, 0.1843137, 1,
1.887181, 0.03754478, 1.479802, 1, 0, 0.1803922, 1,
1.930391, 0.2949655, 1.342042, 1, 0, 0.172549, 1,
1.937975, -0.05112512, 2.145, 1, 0, 0.1686275, 1,
1.938377, -0.7637107, 1.640662, 1, 0, 0.1607843, 1,
1.954953, -0.1987637, 0.694553, 1, 0, 0.1568628, 1,
1.967888, 0.4186922, 3.073957, 1, 0, 0.1490196, 1,
2.006787, -0.5063564, 1.491737, 1, 0, 0.145098, 1,
2.010617, 2.064398, 0.764236, 1, 0, 0.1372549, 1,
2.042414, 1.641744, 1.785933, 1, 0, 0.1333333, 1,
2.044887, 0.4650217, 2.114583, 1, 0, 0.1254902, 1,
2.052739, 1.891417, 0.5809765, 1, 0, 0.1215686, 1,
2.148153, 0.1958925, 2.099679, 1, 0, 0.1137255, 1,
2.167294, -0.3189821, 1.296773, 1, 0, 0.1098039, 1,
2.174736, 1.300708, 0.3072253, 1, 0, 0.1019608, 1,
2.205417, -1.698481, 1.025502, 1, 0, 0.09411765, 1,
2.210734, -0.4329614, 0.3761692, 1, 0, 0.09019608, 1,
2.214663, -0.003143089, 1.050991, 1, 0, 0.08235294, 1,
2.222114, 1.053364, 1.130701, 1, 0, 0.07843138, 1,
2.226113, 1.295301, 2.259411, 1, 0, 0.07058824, 1,
2.233306, 0.06536601, 3.068928, 1, 0, 0.06666667, 1,
2.28126, -0.5038163, -0.1712362, 1, 0, 0.05882353, 1,
2.294413, -0.633747, 0.4856653, 1, 0, 0.05490196, 1,
2.353102, 1.372666, 0.3497394, 1, 0, 0.04705882, 1,
2.35323, 0.6176079, 0.5034918, 1, 0, 0.04313726, 1,
2.400519, 0.6571755, 0.3922964, 1, 0, 0.03529412, 1,
2.410126, -0.3652028, 0.2838192, 1, 0, 0.03137255, 1,
2.413174, -0.4762705, 1.139066, 1, 0, 0.02352941, 1,
2.462279, 0.2896811, 2.439172, 1, 0, 0.01960784, 1,
2.542086, 1.115548, 3.610971, 1, 0, 0.01176471, 1,
3.327601, -0.618288, 2.463721, 1, 0, 0.007843138, 1
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
-0.04449809, -4.514631, -7.681886, 0, -0.5, 0.5, 0.5,
-0.04449809, -4.514631, -7.681886, 1, -0.5, 0.5, 0.5,
-0.04449809, -4.514631, -7.681886, 1, 1.5, 0.5, 0.5,
-0.04449809, -4.514631, -7.681886, 0, 1.5, 0.5, 0.5
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
-4.559739, -0.1567903, -7.681886, 0, -0.5, 0.5, 0.5,
-4.559739, -0.1567903, -7.681886, 1, -0.5, 0.5, 0.5,
-4.559739, -0.1567903, -7.681886, 1, 1.5, 0.5, 0.5,
-4.559739, -0.1567903, -7.681886, 0, 1.5, 0.5, 0.5
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
-4.559739, -4.514631, -0.1124208, 0, -0.5, 0.5, 0.5,
-4.559739, -4.514631, -0.1124208, 1, -0.5, 0.5, 0.5,
-4.559739, -4.514631, -0.1124208, 1, 1.5, 0.5, 0.5,
-4.559739, -4.514631, -0.1124208, 0, 1.5, 0.5, 0.5
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
-3, -3.508976, -5.935086,
3, -3.508976, -5.935086,
-3, -3.508976, -5.935086,
-3, -3.676585, -6.226219,
-2, -3.508976, -5.935086,
-2, -3.676585, -6.226219,
-1, -3.508976, -5.935086,
-1, -3.676585, -6.226219,
0, -3.508976, -5.935086,
0, -3.676585, -6.226219,
1, -3.508976, -5.935086,
1, -3.676585, -6.226219,
2, -3.508976, -5.935086,
2, -3.676585, -6.226219,
3, -3.508976, -5.935086,
3, -3.676585, -6.226219
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
-3, -4.011803, -6.808486, 0, -0.5, 0.5, 0.5,
-3, -4.011803, -6.808486, 1, -0.5, 0.5, 0.5,
-3, -4.011803, -6.808486, 1, 1.5, 0.5, 0.5,
-3, -4.011803, -6.808486, 0, 1.5, 0.5, 0.5,
-2, -4.011803, -6.808486, 0, -0.5, 0.5, 0.5,
-2, -4.011803, -6.808486, 1, -0.5, 0.5, 0.5,
-2, -4.011803, -6.808486, 1, 1.5, 0.5, 0.5,
-2, -4.011803, -6.808486, 0, 1.5, 0.5, 0.5,
-1, -4.011803, -6.808486, 0, -0.5, 0.5, 0.5,
-1, -4.011803, -6.808486, 1, -0.5, 0.5, 0.5,
-1, -4.011803, -6.808486, 1, 1.5, 0.5, 0.5,
-1, -4.011803, -6.808486, 0, 1.5, 0.5, 0.5,
0, -4.011803, -6.808486, 0, -0.5, 0.5, 0.5,
0, -4.011803, -6.808486, 1, -0.5, 0.5, 0.5,
0, -4.011803, -6.808486, 1, 1.5, 0.5, 0.5,
0, -4.011803, -6.808486, 0, 1.5, 0.5, 0.5,
1, -4.011803, -6.808486, 0, -0.5, 0.5, 0.5,
1, -4.011803, -6.808486, 1, -0.5, 0.5, 0.5,
1, -4.011803, -6.808486, 1, 1.5, 0.5, 0.5,
1, -4.011803, -6.808486, 0, 1.5, 0.5, 0.5,
2, -4.011803, -6.808486, 0, -0.5, 0.5, 0.5,
2, -4.011803, -6.808486, 1, -0.5, 0.5, 0.5,
2, -4.011803, -6.808486, 1, 1.5, 0.5, 0.5,
2, -4.011803, -6.808486, 0, 1.5, 0.5, 0.5,
3, -4.011803, -6.808486, 0, -0.5, 0.5, 0.5,
3, -4.011803, -6.808486, 1, -0.5, 0.5, 0.5,
3, -4.011803, -6.808486, 1, 1.5, 0.5, 0.5,
3, -4.011803, -6.808486, 0, 1.5, 0.5, 0.5
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
-3.51776, -3, -5.935086,
-3.51776, 3, -5.935086,
-3.51776, -3, -5.935086,
-3.691423, -3, -6.226219,
-3.51776, -2, -5.935086,
-3.691423, -2, -6.226219,
-3.51776, -1, -5.935086,
-3.691423, -1, -6.226219,
-3.51776, 0, -5.935086,
-3.691423, 0, -6.226219,
-3.51776, 1, -5.935086,
-3.691423, 1, -6.226219,
-3.51776, 2, -5.935086,
-3.691423, 2, -6.226219,
-3.51776, 3, -5.935086,
-3.691423, 3, -6.226219
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
-4.038749, -3, -6.808486, 0, -0.5, 0.5, 0.5,
-4.038749, -3, -6.808486, 1, -0.5, 0.5, 0.5,
-4.038749, -3, -6.808486, 1, 1.5, 0.5, 0.5,
-4.038749, -3, -6.808486, 0, 1.5, 0.5, 0.5,
-4.038749, -2, -6.808486, 0, -0.5, 0.5, 0.5,
-4.038749, -2, -6.808486, 1, -0.5, 0.5, 0.5,
-4.038749, -2, -6.808486, 1, 1.5, 0.5, 0.5,
-4.038749, -2, -6.808486, 0, 1.5, 0.5, 0.5,
-4.038749, -1, -6.808486, 0, -0.5, 0.5, 0.5,
-4.038749, -1, -6.808486, 1, -0.5, 0.5, 0.5,
-4.038749, -1, -6.808486, 1, 1.5, 0.5, 0.5,
-4.038749, -1, -6.808486, 0, 1.5, 0.5, 0.5,
-4.038749, 0, -6.808486, 0, -0.5, 0.5, 0.5,
-4.038749, 0, -6.808486, 1, -0.5, 0.5, 0.5,
-4.038749, 0, -6.808486, 1, 1.5, 0.5, 0.5,
-4.038749, 0, -6.808486, 0, 1.5, 0.5, 0.5,
-4.038749, 1, -6.808486, 0, -0.5, 0.5, 0.5,
-4.038749, 1, -6.808486, 1, -0.5, 0.5, 0.5,
-4.038749, 1, -6.808486, 1, 1.5, 0.5, 0.5,
-4.038749, 1, -6.808486, 0, 1.5, 0.5, 0.5,
-4.038749, 2, -6.808486, 0, -0.5, 0.5, 0.5,
-4.038749, 2, -6.808486, 1, -0.5, 0.5, 0.5,
-4.038749, 2, -6.808486, 1, 1.5, 0.5, 0.5,
-4.038749, 2, -6.808486, 0, 1.5, 0.5, 0.5,
-4.038749, 3, -6.808486, 0, -0.5, 0.5, 0.5,
-4.038749, 3, -6.808486, 1, -0.5, 0.5, 0.5,
-4.038749, 3, -6.808486, 1, 1.5, 0.5, 0.5,
-4.038749, 3, -6.808486, 0, 1.5, 0.5, 0.5
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
-3.51776, -3.508976, -4,
-3.51776, -3.508976, 4,
-3.51776, -3.508976, -4,
-3.691423, -3.676585, -4,
-3.51776, -3.508976, -2,
-3.691423, -3.676585, -2,
-3.51776, -3.508976, 0,
-3.691423, -3.676585, 0,
-3.51776, -3.508976, 2,
-3.691423, -3.676585, 2,
-3.51776, -3.508976, 4,
-3.691423, -3.676585, 4
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
-4.038749, -4.011803, -4, 0, -0.5, 0.5, 0.5,
-4.038749, -4.011803, -4, 1, -0.5, 0.5, 0.5,
-4.038749, -4.011803, -4, 1, 1.5, 0.5, 0.5,
-4.038749, -4.011803, -4, 0, 1.5, 0.5, 0.5,
-4.038749, -4.011803, -2, 0, -0.5, 0.5, 0.5,
-4.038749, -4.011803, -2, 1, -0.5, 0.5, 0.5,
-4.038749, -4.011803, -2, 1, 1.5, 0.5, 0.5,
-4.038749, -4.011803, -2, 0, 1.5, 0.5, 0.5,
-4.038749, -4.011803, 0, 0, -0.5, 0.5, 0.5,
-4.038749, -4.011803, 0, 1, -0.5, 0.5, 0.5,
-4.038749, -4.011803, 0, 1, 1.5, 0.5, 0.5,
-4.038749, -4.011803, 0, 0, 1.5, 0.5, 0.5,
-4.038749, -4.011803, 2, 0, -0.5, 0.5, 0.5,
-4.038749, -4.011803, 2, 1, -0.5, 0.5, 0.5,
-4.038749, -4.011803, 2, 1, 1.5, 0.5, 0.5,
-4.038749, -4.011803, 2, 0, 1.5, 0.5, 0.5,
-4.038749, -4.011803, 4, 0, -0.5, 0.5, 0.5,
-4.038749, -4.011803, 4, 1, -0.5, 0.5, 0.5,
-4.038749, -4.011803, 4, 1, 1.5, 0.5, 0.5,
-4.038749, -4.011803, 4, 0, 1.5, 0.5, 0.5
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
-3.51776, -3.508976, -5.935086,
-3.51776, 3.195395, -5.935086,
-3.51776, -3.508976, 5.710245,
-3.51776, 3.195395, 5.710245,
-3.51776, -3.508976, -5.935086,
-3.51776, -3.508976, 5.710245,
-3.51776, 3.195395, -5.935086,
-3.51776, 3.195395, 5.710245,
-3.51776, -3.508976, -5.935086,
3.428764, -3.508976, -5.935086,
-3.51776, -3.508976, 5.710245,
3.428764, -3.508976, 5.710245,
-3.51776, 3.195395, -5.935086,
3.428764, 3.195395, -5.935086,
-3.51776, 3.195395, 5.710245,
3.428764, 3.195395, 5.710245,
3.428764, -3.508976, -5.935086,
3.428764, 3.195395, -5.935086,
3.428764, -3.508976, 5.710245,
3.428764, 3.195395, 5.710245,
3.428764, -3.508976, -5.935086,
3.428764, -3.508976, 5.710245,
3.428764, 3.195395, -5.935086,
3.428764, 3.195395, 5.710245
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
var radius = 8.077354;
var distance = 35.93706;
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
mvMatrix.translate( 0.04449809, 0.1567903, 0.1124208 );
mvMatrix.scale( 1.257232, 1.302642, 0.7499481 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.93706);
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
glyphosine<-read.table("glyphosine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-glyphosine$V2
```

```
## Error in eval(expr, envir, enclos): object 'glyphosine' not found
```

```r
y<-glyphosine$V3
```

```
## Error in eval(expr, envir, enclos): object 'glyphosine' not found
```

```r
z<-glyphosine$V4
```

```
## Error in eval(expr, envir, enclos): object 'glyphosine' not found
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
-3.416597, 0.4080136, -1.417848, 0, 0, 1, 1, 1,
-3.217195, 0.5939823, 1.122312, 1, 0, 0, 1, 1,
-3.050378, 0.790733, -0.367031, 1, 0, 0, 1, 1,
-2.686236, 0.4571671, -1.042973, 1, 0, 0, 1, 1,
-2.621345, -0.363061, -1.777561, 1, 0, 0, 1, 1,
-2.620343, 0.5347006, -1.919194, 1, 0, 0, 1, 1,
-2.554065, 1.109473, -0.467351, 0, 0, 0, 1, 1,
-2.532984, -1.586251, -2.259421, 0, 0, 0, 1, 1,
-2.387096, 0.07591071, -2.139487, 0, 0, 0, 1, 1,
-2.381946, 1.377167, -2.051165, 0, 0, 0, 1, 1,
-2.362034, 1.385798, -0.6935105, 0, 0, 0, 1, 1,
-2.352249, -1.621839, -2.585719, 0, 0, 0, 1, 1,
-2.258883, -1.405078, -0.4207346, 0, 0, 0, 1, 1,
-2.254817, 0.9461736, -0.4115978, 1, 1, 1, 1, 1,
-2.233594, -0.2723675, -3.028848, 1, 1, 1, 1, 1,
-2.229732, -0.3290684, -2.286819, 1, 1, 1, 1, 1,
-2.208412, 0.1781191, -1.924832, 1, 1, 1, 1, 1,
-2.190625, -0.8063194, -2.412834, 1, 1, 1, 1, 1,
-2.104119, 0.5383228, -2.381603, 1, 1, 1, 1, 1,
-2.086301, -0.6941844, -1.423387, 1, 1, 1, 1, 1,
-2.06137, -2.171871, -3.069073, 1, 1, 1, 1, 1,
-2.025884, -0.2933557, -1.894475, 1, 1, 1, 1, 1,
-1.961254, 0.6952745, -1.67716, 1, 1, 1, 1, 1,
-1.943048, 0.5875732, -1.773903, 1, 1, 1, 1, 1,
-1.940003, 0.05436637, -1.01917, 1, 1, 1, 1, 1,
-1.92293, -0.2029439, -0.2259986, 1, 1, 1, 1, 1,
-1.887647, 2.448095, -1.932444, 1, 1, 1, 1, 1,
-1.884061, 0.977179, -0.6228444, 1, 1, 1, 1, 1,
-1.852358, 2.179143, 1.663743, 0, 0, 1, 1, 1,
-1.845438, 1.609576, -1.295823, 1, 0, 0, 1, 1,
-1.825255, 1.000744, 1.496522, 1, 0, 0, 1, 1,
-1.81699, -1.570839, -1.023332, 1, 0, 0, 1, 1,
-1.802678, 1.267904, -2.123835, 1, 0, 0, 1, 1,
-1.786064, 1.102197, -2.792714, 1, 0, 0, 1, 1,
-1.778996, -0.476651, -1.271862, 0, 0, 0, 1, 1,
-1.774624, -0.6396797, -3.062469, 0, 0, 0, 1, 1,
-1.771191, 0.3011248, -0.2443201, 0, 0, 0, 1, 1,
-1.769531, -0.424345, -0.482876, 0, 0, 0, 1, 1,
-1.757158, -0.8346713, -2.55377, 0, 0, 0, 1, 1,
-1.755751, 0.2845659, 0.05898369, 0, 0, 0, 1, 1,
-1.744263, -0.6658194, -2.473324, 0, 0, 0, 1, 1,
-1.738015, 1.46086, -0.9253142, 1, 1, 1, 1, 1,
-1.660046, 2.036398, -0.8334087, 1, 1, 1, 1, 1,
-1.644345, -1.607791, -1.938116, 1, 1, 1, 1, 1,
-1.642485, -0.9704083, -1.303171, 1, 1, 1, 1, 1,
-1.606737, 0.07948859, -1.990561, 1, 1, 1, 1, 1,
-1.594462, 0.583793, -0.1518954, 1, 1, 1, 1, 1,
-1.592537, -0.3037505, -0.6296358, 1, 1, 1, 1, 1,
-1.589494, -0.6819502, -1.045733, 1, 1, 1, 1, 1,
-1.58249, -0.6269019, -1.587416, 1, 1, 1, 1, 1,
-1.573524, 1.501541, -1.02797, 1, 1, 1, 1, 1,
-1.572653, -0.2295453, -2.406869, 1, 1, 1, 1, 1,
-1.556191, -1.283226, -1.35356, 1, 1, 1, 1, 1,
-1.554127, 1.039288, -0.4323957, 1, 1, 1, 1, 1,
-1.547357, -1.595409, -2.490866, 1, 1, 1, 1, 1,
-1.545699, -0.9887192, -2.914927, 1, 1, 1, 1, 1,
-1.543704, 1.709713, -0.2519805, 0, 0, 1, 1, 1,
-1.541709, 1.30159, -2.168147, 1, 0, 0, 1, 1,
-1.534401, 1.400673, -2.39183, 1, 0, 0, 1, 1,
-1.521968, 0.4234199, -1.889861, 1, 0, 0, 1, 1,
-1.51584, 0.3313977, -0.8243865, 1, 0, 0, 1, 1,
-1.513488, -0.9025521, -1.984028, 1, 0, 0, 1, 1,
-1.500247, -0.0350697, -1.330602, 0, 0, 0, 1, 1,
-1.498202, -0.57725, -2.892167, 0, 0, 0, 1, 1,
-1.498053, 0.2117762, -1.98375, 0, 0, 0, 1, 1,
-1.495791, 0.6190468, -1.984, 0, 0, 0, 1, 1,
-1.478922, -0.3188678, -2.224232, 0, 0, 0, 1, 1,
-1.475905, 0.7782414, 0.6942812, 0, 0, 0, 1, 1,
-1.473974, -0.3885175, -3.074233, 0, 0, 0, 1, 1,
-1.473728, 0.4892323, 0.6527742, 1, 1, 1, 1, 1,
-1.472965, -0.6508409, -1.820789, 1, 1, 1, 1, 1,
-1.472957, 1.445768, -1.004718, 1, 1, 1, 1, 1,
-1.45681, 1.174242, -1.92238, 1, 1, 1, 1, 1,
-1.454461, -0.2471138, -1.890526, 1, 1, 1, 1, 1,
-1.451657, 1.501141, -0.7594669, 1, 1, 1, 1, 1,
-1.446622, 0.7128325, -0.7751907, 1, 1, 1, 1, 1,
-1.444284, 0.9816697, -0.3259204, 1, 1, 1, 1, 1,
-1.436807, 1.612507, -1.240754, 1, 1, 1, 1, 1,
-1.435892, -0.7693834, -2.065784, 1, 1, 1, 1, 1,
-1.432879, -0.4058361, -0.1231709, 1, 1, 1, 1, 1,
-1.416027, 1.978002, 0.5898384, 1, 1, 1, 1, 1,
-1.413674, -0.4420935, -2.538896, 1, 1, 1, 1, 1,
-1.408085, 1.645458, -1.648837, 1, 1, 1, 1, 1,
-1.407047, 0.5393087, -0.2634221, 1, 1, 1, 1, 1,
-1.403712, -0.1321568, -0.8790906, 0, 0, 1, 1, 1,
-1.396556, -0.1715155, -0.07900922, 1, 0, 0, 1, 1,
-1.393708, 0.2321811, -0.2465226, 1, 0, 0, 1, 1,
-1.382226, -1.142166, -1.88539, 1, 0, 0, 1, 1,
-1.379855, -0.3732991, -1.014204, 1, 0, 0, 1, 1,
-1.373426, -0.008742623, -1.0011, 1, 0, 0, 1, 1,
-1.369943, -0.7292756, -0.3296134, 0, 0, 0, 1, 1,
-1.368629, -2.069164, -2.404593, 0, 0, 0, 1, 1,
-1.364357, 0.3818652, -0.3639998, 0, 0, 0, 1, 1,
-1.360885, 0.3346963, -1.337692, 0, 0, 0, 1, 1,
-1.359223, 0.2023132, -1.532853, 0, 0, 0, 1, 1,
-1.357654, 0.1968911, -0.7105708, 0, 0, 0, 1, 1,
-1.354563, 0.6635113, -1.480098, 0, 0, 0, 1, 1,
-1.349879, -0.2574898, -1.29632, 1, 1, 1, 1, 1,
-1.349675, 0.5695477, -0.9779823, 1, 1, 1, 1, 1,
-1.344532, -2.192078, -1.789052, 1, 1, 1, 1, 1,
-1.342962, -1.012715, -3.007295, 1, 1, 1, 1, 1,
-1.340838, -0.6583827, -2.341302, 1, 1, 1, 1, 1,
-1.338346, 0.9078341, -1.465407, 1, 1, 1, 1, 1,
-1.338172, -1.005096, -0.1531563, 1, 1, 1, 1, 1,
-1.335099, 0.5965167, -0.2808749, 1, 1, 1, 1, 1,
-1.331404, -0.1119942, -2.154067, 1, 1, 1, 1, 1,
-1.32333, -0.649682, -2.773869, 1, 1, 1, 1, 1,
-1.312803, 1.802543, -1.024444, 1, 1, 1, 1, 1,
-1.311014, -0.5256427, -1.406112, 1, 1, 1, 1, 1,
-1.307132, 1.105181, -1.88398, 1, 1, 1, 1, 1,
-1.306935, -1.014202, -3.567611, 1, 1, 1, 1, 1,
-1.303981, -0.08757447, -2.782402, 1, 1, 1, 1, 1,
-1.302913, -0.1966083, -0.4330161, 0, 0, 1, 1, 1,
-1.291749, 0.6771888, -0.2172389, 1, 0, 0, 1, 1,
-1.286911, -0.1856374, -1.838749, 1, 0, 0, 1, 1,
-1.285119, 0.8554571, -0.6997899, 1, 0, 0, 1, 1,
-1.279241, 0.3345929, -3.898615, 1, 0, 0, 1, 1,
-1.273908, -0.4029536, -2.430109, 1, 0, 0, 1, 1,
-1.266558, -2.625724, -2.844968, 0, 0, 0, 1, 1,
-1.257035, 0.3403885, -1.09646, 0, 0, 0, 1, 1,
-1.250241, 1.562783, -0.6820441, 0, 0, 0, 1, 1,
-1.248157, -0.1766048, -1.713312, 0, 0, 0, 1, 1,
-1.247687, -0.08696365, -2.917649, 0, 0, 0, 1, 1,
-1.247679, 0.2384859, -1.467253, 0, 0, 0, 1, 1,
-1.239966, -1.886616, -2.698553, 0, 0, 0, 1, 1,
-1.231073, 0.2045656, -1.514892, 1, 1, 1, 1, 1,
-1.217085, 0.7451444, 1.244508, 1, 1, 1, 1, 1,
-1.212093, -0.04905613, -1.956725, 1, 1, 1, 1, 1,
-1.205965, -0.1576199, -1.299446, 1, 1, 1, 1, 1,
-1.205311, 1.652828, -1.50153, 1, 1, 1, 1, 1,
-1.205006, -1.027283, -3.739508, 1, 1, 1, 1, 1,
-1.203329, 0.21632, -1.624571, 1, 1, 1, 1, 1,
-1.199835, 0.7498725, -1.47622, 1, 1, 1, 1, 1,
-1.197737, 0.9099445, -0.2648359, 1, 1, 1, 1, 1,
-1.197232, 1.521143, -0.8724702, 1, 1, 1, 1, 1,
-1.195143, 0.2742121, -0.5269138, 1, 1, 1, 1, 1,
-1.194682, -1.557574, -4.368842, 1, 1, 1, 1, 1,
-1.194464, -1.197255, -1.185696, 1, 1, 1, 1, 1,
-1.187091, 0.1742598, -3.112629, 1, 1, 1, 1, 1,
-1.179508, -1.494725, -2.280607, 1, 1, 1, 1, 1,
-1.175244, 0.2866705, -2.324828, 0, 0, 1, 1, 1,
-1.164475, 1.301921, -1.632899, 1, 0, 0, 1, 1,
-1.164382, -0.2029767, -0.7315878, 1, 0, 0, 1, 1,
-1.164337, -0.38192, -2.767151, 1, 0, 0, 1, 1,
-1.153781, 0.4821356, -0.8201278, 1, 0, 0, 1, 1,
-1.148744, 1.302235, -0.8345376, 1, 0, 0, 1, 1,
-1.14748, 0.2411129, -1.863827, 0, 0, 0, 1, 1,
-1.145533, 0.7630529, -0.1960235, 0, 0, 0, 1, 1,
-1.1359, 0.7207494, -2.229309, 0, 0, 0, 1, 1,
-1.132486, -0.3615343, -2.081832, 0, 0, 0, 1, 1,
-1.130583, -0.3975558, -1.667663, 0, 0, 0, 1, 1,
-1.125034, -0.4358606, -1.478517, 0, 0, 0, 1, 1,
-1.119475, -0.1111582, -1.534076, 0, 0, 0, 1, 1,
-1.117733, 0.3000273, -2.143727, 1, 1, 1, 1, 1,
-1.109985, 0.7369393, -1.543225, 1, 1, 1, 1, 1,
-1.107925, -0.9064999, -1.4743, 1, 1, 1, 1, 1,
-1.103553, -0.04145743, -2.058243, 1, 1, 1, 1, 1,
-1.093242, 0.6432628, -0.309696, 1, 1, 1, 1, 1,
-1.087741, -0.7064731, -1.898616, 1, 1, 1, 1, 1,
-1.087077, -0.4319838, -1.745909, 1, 1, 1, 1, 1,
-1.083767, -1.06847, -1.442838, 1, 1, 1, 1, 1,
-1.079125, -0.05779259, -1.539377, 1, 1, 1, 1, 1,
-1.077333, -1.56108, -2.788188, 1, 1, 1, 1, 1,
-1.067926, -1.303054, -2.399644, 1, 1, 1, 1, 1,
-1.065862, 0.973759, -2.183682, 1, 1, 1, 1, 1,
-1.058473, -0.942665, -0.8926224, 1, 1, 1, 1, 1,
-1.057984, 0.06662792, -0.5499386, 1, 1, 1, 1, 1,
-1.052668, -1.405746, -2.692435, 1, 1, 1, 1, 1,
-1.050404, -2.050668, -3.233729, 0, 0, 1, 1, 1,
-1.039856, -0.6329386, -2.141892, 1, 0, 0, 1, 1,
-1.036411, -0.7769288, -3.438736, 1, 0, 0, 1, 1,
-1.027892, 1.530126, -0.1224024, 1, 0, 0, 1, 1,
-1.017713, -0.9411408, -1.452288, 1, 0, 0, 1, 1,
-1.010661, -0.2573235, -2.299508, 1, 0, 0, 1, 1,
-1.008821, 0.7268102, -0.1539057, 0, 0, 0, 1, 1,
-1.008089, -1.067615, -2.188281, 0, 0, 0, 1, 1,
-1.006577, 0.6293213, -3.126576, 0, 0, 0, 1, 1,
-1.004742, 0.1867747, -1.696415, 0, 0, 0, 1, 1,
-1.002536, 0.4282001, -1.075763, 0, 0, 0, 1, 1,
-0.9968703, -1.537399, -2.888248, 0, 0, 0, 1, 1,
-0.9925407, 0.1717334, -2.771304, 0, 0, 0, 1, 1,
-0.9844968, 2.310162, 0.4798702, 1, 1, 1, 1, 1,
-0.9844757, 0.5660744, -2.135952, 1, 1, 1, 1, 1,
-0.9793683, 0.8370194, -1.251319, 1, 1, 1, 1, 1,
-0.9792039, 0.04437326, -2.896815, 1, 1, 1, 1, 1,
-0.9682439, 0.2647327, -0.9245834, 1, 1, 1, 1, 1,
-0.9613096, 0.8872753, 0.9441943, 1, 1, 1, 1, 1,
-0.9473726, -1.173005, -2.642264, 1, 1, 1, 1, 1,
-0.945302, 2.70326, 0.02776536, 1, 1, 1, 1, 1,
-0.9354671, -1.294006, -2.725741, 1, 1, 1, 1, 1,
-0.932205, 1.359189, -1.706044, 1, 1, 1, 1, 1,
-0.9220091, 1.102375, -1.336668, 1, 1, 1, 1, 1,
-0.9191045, 1.4189, -0.3931759, 1, 1, 1, 1, 1,
-0.9107671, -0.1512786, -1.930606, 1, 1, 1, 1, 1,
-0.9103934, -1.587597, -3.654755, 1, 1, 1, 1, 1,
-0.9060032, -0.7402658, -1.857278, 1, 1, 1, 1, 1,
-0.9050676, -1.31894, -3.483588, 0, 0, 1, 1, 1,
-0.9049519, -0.4915181, -2.175901, 1, 0, 0, 1, 1,
-0.8969796, -0.5329707, -2.309715, 1, 0, 0, 1, 1,
-0.8940538, -0.676829, -2.779371, 1, 0, 0, 1, 1,
-0.8780514, 0.7952737, -0.5533257, 1, 0, 0, 1, 1,
-0.8750234, -1.744635, -4.398084, 1, 0, 0, 1, 1,
-0.8734992, -0.1852008, -1.668521, 0, 0, 0, 1, 1,
-0.8714314, 0.04935874, -2.852377, 0, 0, 0, 1, 1,
-0.8561015, 0.6298065, -1.648702, 0, 0, 0, 1, 1,
-0.8422003, 0.362836, -2.404187, 0, 0, 0, 1, 1,
-0.8421434, -0.4797721, -2.289873, 0, 0, 0, 1, 1,
-0.8383344, -0.1229478, -2.676689, 0, 0, 0, 1, 1,
-0.8375947, -0.2458718, -2.973635, 0, 0, 0, 1, 1,
-0.8208575, -0.6214901, -3.23522, 1, 1, 1, 1, 1,
-0.820522, -0.248371, -0.8312648, 1, 1, 1, 1, 1,
-0.8196191, 0.791068, -0.3867897, 1, 1, 1, 1, 1,
-0.8183709, 0.1630935, -2.855646, 1, 1, 1, 1, 1,
-0.8062343, 1.810065, -1.857517, 1, 1, 1, 1, 1,
-0.8041589, -2.042862, -3.046731, 1, 1, 1, 1, 1,
-0.7970118, -2.24041, -2.557377, 1, 1, 1, 1, 1,
-0.7961815, -0.2235238, -1.027413, 1, 1, 1, 1, 1,
-0.7862241, -2.226021, -0.297774, 1, 1, 1, 1, 1,
-0.7859522, -0.3772776, -2.656683, 1, 1, 1, 1, 1,
-0.7805198, -1.010331, -2.183619, 1, 1, 1, 1, 1,
-0.7701617, 0.3471156, -1.647349, 1, 1, 1, 1, 1,
-0.7621003, 0.4221408, -1.709678, 1, 1, 1, 1, 1,
-0.7609448, 0.1131302, -1.183673, 1, 1, 1, 1, 1,
-0.7581474, 0.2216409, -4.243849, 1, 1, 1, 1, 1,
-0.7557953, 0.3475841, -0.6867551, 0, 0, 1, 1, 1,
-0.7549456, 0.797873, 0.9103942, 1, 0, 0, 1, 1,
-0.7481515, 0.1481633, -1.791334, 1, 0, 0, 1, 1,
-0.7453363, -1.70555, -2.915174, 1, 0, 0, 1, 1,
-0.7452964, 0.8963903, -0.9610873, 1, 0, 0, 1, 1,
-0.7401303, -1.477824, -2.419617, 1, 0, 0, 1, 1,
-0.7368549, 0.8940971, 0.2934924, 0, 0, 0, 1, 1,
-0.734402, -0.10602, -1.575535, 0, 0, 0, 1, 1,
-0.7282423, -0.01292816, -1.814776, 0, 0, 0, 1, 1,
-0.7281949, 1.549978, 2.116237, 0, 0, 0, 1, 1,
-0.7261822, 0.7228072, -0.3937601, 0, 0, 0, 1, 1,
-0.7261214, -0.6214798, -1.783165, 0, 0, 0, 1, 1,
-0.7246182, -0.1048113, -3.202139, 0, 0, 0, 1, 1,
-0.7217628, 0.5172707, -1.352919, 1, 1, 1, 1, 1,
-0.7187876, -1.731925, -1.851967, 1, 1, 1, 1, 1,
-0.7184976, -0.2811297, -1.930974, 1, 1, 1, 1, 1,
-0.7121292, -0.4330029, -2.649021, 1, 1, 1, 1, 1,
-0.7120778, 0.5905316, 0.1507185, 1, 1, 1, 1, 1,
-0.7109426, -0.5411758, -3.244898, 1, 1, 1, 1, 1,
-0.7025835, 0.6529443, -0.4217803, 1, 1, 1, 1, 1,
-0.6992468, 0.3915541, 0.3944131, 1, 1, 1, 1, 1,
-0.6983639, -0.2919872, -1.999138, 1, 1, 1, 1, 1,
-0.6979665, 0.2523375, -0.3142699, 1, 1, 1, 1, 1,
-0.6950997, 1.263861, 1.060266, 1, 1, 1, 1, 1,
-0.691448, 1.548261, -0.5811054, 1, 1, 1, 1, 1,
-0.6896878, -1.777702, -1.027442, 1, 1, 1, 1, 1,
-0.6754118, -1.013782, -3.852317, 1, 1, 1, 1, 1,
-0.6749588, -0.5511495, -2.125122, 1, 1, 1, 1, 1,
-0.674526, 0.624202, -2.232321, 0, 0, 1, 1, 1,
-0.6723313, 0.7624494, -0.8661411, 1, 0, 0, 1, 1,
-0.6700729, 0.4940426, 0.6061493, 1, 0, 0, 1, 1,
-0.6695035, 1.706334, -1.078237, 1, 0, 0, 1, 1,
-0.6683047, -1.086309, -2.08906, 1, 0, 0, 1, 1,
-0.6617378, -0.217154, -3.228473, 1, 0, 0, 1, 1,
-0.6615344, -1.270281, -2.791662, 0, 0, 0, 1, 1,
-0.6615167, -1.188098, -3.410443, 0, 0, 0, 1, 1,
-0.6612957, 1.474484, 0.3852286, 0, 0, 0, 1, 1,
-0.6612753, -0.02736425, -2.555896, 0, 0, 0, 1, 1,
-0.6553055, 0.2397149, -1.519983, 0, 0, 0, 1, 1,
-0.6521704, 0.1969652, -2.075004, 0, 0, 0, 1, 1,
-0.6490732, 0.7291465, -1.05722, 0, 0, 0, 1, 1,
-0.6463641, 0.5172364, -0.2783115, 1, 1, 1, 1, 1,
-0.646295, -0.05732521, -0.388302, 1, 1, 1, 1, 1,
-0.6443448, -0.5732226, -2.847679, 1, 1, 1, 1, 1,
-0.6359503, 0.3069602, -0.3489985, 1, 1, 1, 1, 1,
-0.6336439, 0.5311264, -1.907978, 1, 1, 1, 1, 1,
-0.6335677, -0.3514818, -1.126354, 1, 1, 1, 1, 1,
-0.6297817, -0.8655055, -2.314152, 1, 1, 1, 1, 1,
-0.6287103, -1.311536, -2.374567, 1, 1, 1, 1, 1,
-0.6211045, 1.424061, -0.1872052, 1, 1, 1, 1, 1,
-0.6128463, 1.018813, -1.5538, 1, 1, 1, 1, 1,
-0.605817, 0.886254, -0.5729977, 1, 1, 1, 1, 1,
-0.6055231, 0.5143384, -0.08772784, 1, 1, 1, 1, 1,
-0.6018741, -0.2814075, -2.856435, 1, 1, 1, 1, 1,
-0.5985867, -1.22783, -2.47776, 1, 1, 1, 1, 1,
-0.5832511, -0.4174798, -4.2331, 1, 1, 1, 1, 1,
-0.5827575, 1.617947, -2.735656, 0, 0, 1, 1, 1,
-0.5787635, 0.3033825, -0.5999001, 1, 0, 0, 1, 1,
-0.575548, 0.218412, -2.33806, 1, 0, 0, 1, 1,
-0.5653447, 1.467246, -2.563565, 1, 0, 0, 1, 1,
-0.5651643, -0.2953861, -3.502216, 1, 0, 0, 1, 1,
-0.5569989, 0.4119306, -2.860777, 1, 0, 0, 1, 1,
-0.5568953, -0.5191473, -2.366689, 0, 0, 0, 1, 1,
-0.5565934, -0.8913504, -2.19009, 0, 0, 0, 1, 1,
-0.5541113, -0.0120965, -1.750183, 0, 0, 0, 1, 1,
-0.5520727, -0.4407584, -1.833154, 0, 0, 0, 1, 1,
-0.5516855, 0.7113308, -0.1776642, 0, 0, 0, 1, 1,
-0.5509841, 1.31702, -0.7230434, 0, 0, 0, 1, 1,
-0.550053, 1.451447, 0.1891097, 0, 0, 0, 1, 1,
-0.5474192, -0.9164801, -2.213096, 1, 1, 1, 1, 1,
-0.5461462, 0.9274949, -1.351961, 1, 1, 1, 1, 1,
-0.5437315, -0.9128829, -4.725297, 1, 1, 1, 1, 1,
-0.5334585, -0.3274782, -1.823774, 1, 1, 1, 1, 1,
-0.5333065, 1.221828, -0.6931412, 1, 1, 1, 1, 1,
-0.532695, 1.881664, -0.5094844, 1, 1, 1, 1, 1,
-0.5303711, 1.182284, 0.1929551, 1, 1, 1, 1, 1,
-0.5272979, 1.629828, -0.1780348, 1, 1, 1, 1, 1,
-0.5262992, 0.4932466, 0.8731507, 1, 1, 1, 1, 1,
-0.5194225, 0.3995433, 0.08519623, 1, 1, 1, 1, 1,
-0.5175475, 1.582358, -1.386829, 1, 1, 1, 1, 1,
-0.5164881, -0.435597, -2.353567, 1, 1, 1, 1, 1,
-0.5109215, -3.411339, -2.064163, 1, 1, 1, 1, 1,
-0.5108525, 1.455449, -0.9585359, 1, 1, 1, 1, 1,
-0.5059798, 1.073066, -1.846053, 1, 1, 1, 1, 1,
-0.5050092, 0.2779115, -0.8129462, 0, 0, 1, 1, 1,
-0.5026882, 0.4423585, -1.59621, 1, 0, 0, 1, 1,
-0.4981916, -0.753189, -2.78983, 1, 0, 0, 1, 1,
-0.4974347, 0.8507829, -1.520442, 1, 0, 0, 1, 1,
-0.4923034, -1.177534, -4.296107, 1, 0, 0, 1, 1,
-0.4912308, 0.6247314, 1.20891, 1, 0, 0, 1, 1,
-0.4909982, 0.1351558, -2.108174, 0, 0, 0, 1, 1,
-0.4897172, 2.035519, -1.554251, 0, 0, 0, 1, 1,
-0.4852602, 0.285622, 0.02984169, 0, 0, 0, 1, 1,
-0.4816329, -2.451915, -4.113638, 0, 0, 0, 1, 1,
-0.4750656, 0.5077323, -0.1164483, 0, 0, 0, 1, 1,
-0.4733612, 0.9137215, -0.4323617, 0, 0, 0, 1, 1,
-0.4711606, 0.4530759, -0.6374621, 0, 0, 0, 1, 1,
-0.4708569, -0.5291563, -2.815401, 1, 1, 1, 1, 1,
-0.4702019, -0.2085972, -2.205153, 1, 1, 1, 1, 1,
-0.4677602, 0.5716019, -0.2081471, 1, 1, 1, 1, 1,
-0.4541878, -0.3928125, -1.816378, 1, 1, 1, 1, 1,
-0.4526814, 0.7901638, 1.194482, 1, 1, 1, 1, 1,
-0.4462779, 0.1832298, -0.2059099, 1, 1, 1, 1, 1,
-0.4431609, -0.3666004, -1.117091, 1, 1, 1, 1, 1,
-0.4429885, -1.543546, -3.846847, 1, 1, 1, 1, 1,
-0.4409851, 0.6342391, -0.9045394, 1, 1, 1, 1, 1,
-0.4391603, 1.114027, 0.4423317, 1, 1, 1, 1, 1,
-0.4362955, 0.1351301, -1.263801, 1, 1, 1, 1, 1,
-0.4362883, -1.860097, -3.587768, 1, 1, 1, 1, 1,
-0.4357118, -0.5367206, -2.04747, 1, 1, 1, 1, 1,
-0.4332065, 0.4490299, -0.9841694, 1, 1, 1, 1, 1,
-0.4304394, -0.3655777, -1.281241, 1, 1, 1, 1, 1,
-0.4288715, 0.5227223, 0.5469877, 0, 0, 1, 1, 1,
-0.4224657, -0.3305805, -2.887162, 1, 0, 0, 1, 1,
-0.419774, 1.592862, 0.8060349, 1, 0, 0, 1, 1,
-0.4173707, -0.3381908, -4.546415, 1, 0, 0, 1, 1,
-0.4139036, -0.4165613, -3.885559, 1, 0, 0, 1, 1,
-0.4136313, -1.844025, -2.377349, 1, 0, 0, 1, 1,
-0.4116189, 0.1926885, -1.769341, 0, 0, 0, 1, 1,
-0.4111643, -0.1410058, -2.731039, 0, 0, 0, 1, 1,
-0.4093343, 0.04425046, -1.278292, 0, 0, 0, 1, 1,
-0.4058886, -0.2107923, -2.770094, 0, 0, 0, 1, 1,
-0.4038053, -0.7538129, -2.128737, 0, 0, 0, 1, 1,
-0.401937, -0.4201711, -1.883231, 0, 0, 0, 1, 1,
-0.396399, 1.081609, -1.106699, 0, 0, 0, 1, 1,
-0.390417, -1.164668, -0.4337364, 1, 1, 1, 1, 1,
-0.3892457, 0.3219669, -0.6318171, 1, 1, 1, 1, 1,
-0.387846, -0.1183712, 0.2101414, 1, 1, 1, 1, 1,
-0.3861526, 0.2058827, -2.499326, 1, 1, 1, 1, 1,
-0.3851629, -0.918272, -3.488727, 1, 1, 1, 1, 1,
-0.3824818, 0.4737712, -0.3350367, 1, 1, 1, 1, 1,
-0.3809378, -1.954081, -2.781392, 1, 1, 1, 1, 1,
-0.3771964, -1.21077, -3.503955, 1, 1, 1, 1, 1,
-0.3751653, -0.7393231, -3.591717, 1, 1, 1, 1, 1,
-0.3741969, 1.344502, -1.896093, 1, 1, 1, 1, 1,
-0.3736171, 0.3518991, -0.2340332, 1, 1, 1, 1, 1,
-0.3662229, -0.1454892, -1.191442, 1, 1, 1, 1, 1,
-0.3527253, 0.1060067, 0.7168807, 1, 1, 1, 1, 1,
-0.343423, -1.286689, -3.706929, 1, 1, 1, 1, 1,
-0.3394508, 0.8720168, 0.2572508, 1, 1, 1, 1, 1,
-0.3367063, -0.5380264, -2.604318, 0, 0, 1, 1, 1,
-0.3364604, 0.1386187, -0.5430186, 1, 0, 0, 1, 1,
-0.3321052, 0.5201184, -0.868259, 1, 0, 0, 1, 1,
-0.3292892, -0.8250829, -3.526466, 1, 0, 0, 1, 1,
-0.3271359, -0.350879, -2.688124, 1, 0, 0, 1, 1,
-0.3204443, -0.1233317, -2.246315, 1, 0, 0, 1, 1,
-0.3200417, 0.04765375, -2.915381, 0, 0, 0, 1, 1,
-0.3183307, 0.6759122, -1.067266, 0, 0, 0, 1, 1,
-0.3181377, -0.6021727, -1.719427, 0, 0, 0, 1, 1,
-0.3173932, 0.9719735, 0.0361986, 0, 0, 0, 1, 1,
-0.3149483, 0.8266302, 1.49822, 0, 0, 0, 1, 1,
-0.3115394, -0.003823799, -1.789507, 0, 0, 0, 1, 1,
-0.3105203, 0.01755342, -1.155867, 0, 0, 0, 1, 1,
-0.3076491, 0.8014123, 0.3802031, 1, 1, 1, 1, 1,
-0.3054557, 0.9436985, -0.8056985, 1, 1, 1, 1, 1,
-0.3044886, 0.3139355, -1.749616, 1, 1, 1, 1, 1,
-0.2971743, -0.3951321, -4.055259, 1, 1, 1, 1, 1,
-0.2961852, -0.4718289, -3.139592, 1, 1, 1, 1, 1,
-0.2942996, 0.419978, 0.8451205, 1, 1, 1, 1, 1,
-0.2910595, 0.6712641, -1.925337, 1, 1, 1, 1, 1,
-0.2878071, -0.154422, -1.006664, 1, 1, 1, 1, 1,
-0.2873419, -0.04305561, -1.266817, 1, 1, 1, 1, 1,
-0.2767493, -1.751225, -3.923156, 1, 1, 1, 1, 1,
-0.2750673, -0.2549997, -1.322626, 1, 1, 1, 1, 1,
-0.2739899, 0.7152216, -0.0601709, 1, 1, 1, 1, 1,
-0.2739885, -0.18573, -1.303758, 1, 1, 1, 1, 1,
-0.2702976, 0.06392924, -0.178859, 1, 1, 1, 1, 1,
-0.2666019, -0.1910248, -1.007536, 1, 1, 1, 1, 1,
-0.2626232, -1.295642, -2.311037, 0, 0, 1, 1, 1,
-0.261077, -2.069478, -3.367744, 1, 0, 0, 1, 1,
-0.259879, -1.438353, -5.765494, 1, 0, 0, 1, 1,
-0.2596652, -2.208732, -3.555146, 1, 0, 0, 1, 1,
-0.256715, 1.088908, -1.387978, 1, 0, 0, 1, 1,
-0.2559998, -1.685707, -2.728715, 1, 0, 0, 1, 1,
-0.2519448, -1.698552, -0.2452332, 0, 0, 0, 1, 1,
-0.2435787, 1.335472, -0.8458247, 0, 0, 0, 1, 1,
-0.2416333, 0.7724491, -2.814519, 0, 0, 0, 1, 1,
-0.2349991, 0.7527102, 0.699845, 0, 0, 0, 1, 1,
-0.2346683, -0.3039463, -4.797767, 0, 0, 0, 1, 1,
-0.2325986, -0.9431622, -3.179006, 0, 0, 0, 1, 1,
-0.2280339, 0.7931077, -1.867254, 0, 0, 0, 1, 1,
-0.2271458, 1.692643, -0.5064489, 1, 1, 1, 1, 1,
-0.22396, -0.1753517, -1.641901, 1, 1, 1, 1, 1,
-0.2230982, 0.3131468, -1.253626, 1, 1, 1, 1, 1,
-0.2177414, -0.4413294, -2.125556, 1, 1, 1, 1, 1,
-0.2087767, -0.8242317, -2.492748, 1, 1, 1, 1, 1,
-0.2062593, 1.254621, -0.5993083, 1, 1, 1, 1, 1,
-0.2010419, 1.230271, -0.649776, 1, 1, 1, 1, 1,
-0.199697, -0.06606174, -1.589362, 1, 1, 1, 1, 1,
-0.198681, 2.082027, -0.2368975, 1, 1, 1, 1, 1,
-0.1962162, 1.099534, 0.3427093, 1, 1, 1, 1, 1,
-0.1952218, 1.742329, 0.230069, 1, 1, 1, 1, 1,
-0.1926019, 2.019819, 1.078256, 1, 1, 1, 1, 1,
-0.1905658, -1.035438, -2.53433, 1, 1, 1, 1, 1,
-0.1905223, 0.6449334, -0.07459089, 1, 1, 1, 1, 1,
-0.1900883, -0.6264568, -3.723162, 1, 1, 1, 1, 1,
-0.1865921, -0.5623468, -3.158173, 0, 0, 1, 1, 1,
-0.1861004, 0.9038503, -0.04772096, 1, 0, 0, 1, 1,
-0.186001, 0.7529215, -1.128167, 1, 0, 0, 1, 1,
-0.1854964, 1.117486, 0.2980555, 1, 0, 0, 1, 1,
-0.1762277, -0.649993, -2.49215, 1, 0, 0, 1, 1,
-0.1754183, -0.994508, -2.667947, 1, 0, 0, 1, 1,
-0.175085, -0.008311542, -1.903084, 0, 0, 0, 1, 1,
-0.1744354, 0.619575, 0.6392525, 0, 0, 0, 1, 1,
-0.1674125, -0.1936996, -2.808517, 0, 0, 0, 1, 1,
-0.1653691, -1.193618, -3.09692, 0, 0, 0, 1, 1,
-0.1629208, -0.2041634, -3.254948, 0, 0, 0, 1, 1,
-0.161407, -0.7261828, -2.81358, 0, 0, 0, 1, 1,
-0.1598692, 1.817289, 0.6682643, 0, 0, 0, 1, 1,
-0.1598665, 0.1142269, -0.5960429, 1, 1, 1, 1, 1,
-0.1577119, 0.7830841, -0.8318565, 1, 1, 1, 1, 1,
-0.1540039, -0.9673066, -2.220016, 1, 1, 1, 1, 1,
-0.1521647, 1.441046, -0.9306764, 1, 1, 1, 1, 1,
-0.1520821, 0.9336001, -1.696566, 1, 1, 1, 1, 1,
-0.1520588, -0.5259479, -2.378451, 1, 1, 1, 1, 1,
-0.1424704, -0.9191453, -2.928485, 1, 1, 1, 1, 1,
-0.1416827, 0.9447416, -1.195528, 1, 1, 1, 1, 1,
-0.141402, 0.03000802, -0.8315823, 1, 1, 1, 1, 1,
-0.1390502, -0.2524767, -3.580355, 1, 1, 1, 1, 1,
-0.1378037, -0.04780604, -1.654431, 1, 1, 1, 1, 1,
-0.1321536, -0.584151, -3.066617, 1, 1, 1, 1, 1,
-0.1293101, 1.638224, -0.8681452, 1, 1, 1, 1, 1,
-0.1285444, -2.339455, -3.914051, 1, 1, 1, 1, 1,
-0.1251795, -0.9029691, -3.512048, 1, 1, 1, 1, 1,
-0.1188258, -1.175042, -3.122918, 0, 0, 1, 1, 1,
-0.1177724, -0.6009301, -3.583935, 1, 0, 0, 1, 1,
-0.1103963, 1.673456, -0.3614909, 1, 0, 0, 1, 1,
-0.104868, -1.695353, -4.831217, 1, 0, 0, 1, 1,
-0.1043231, -0.7579997, -3.998598, 1, 0, 0, 1, 1,
-0.1033566, -1.126668, -2.396936, 1, 0, 0, 1, 1,
-0.1006123, -0.5234531, -3.440383, 0, 0, 0, 1, 1,
-0.09609753, 1.620542, -0.5525045, 0, 0, 0, 1, 1,
-0.09514215, -0.4494916, -2.805974, 0, 0, 0, 1, 1,
-0.08830219, -0.3735952, -3.014626, 0, 0, 0, 1, 1,
-0.08762281, 0.7006761, 1.226639, 0, 0, 0, 1, 1,
-0.0857923, 0.0005282118, -3.496416, 0, 0, 0, 1, 1,
-0.08517072, -0.7291204, -1.741074, 0, 0, 0, 1, 1,
-0.08495808, 0.9823399, -0.720931, 1, 1, 1, 1, 1,
-0.08437175, -1.771761, -2.761979, 1, 1, 1, 1, 1,
-0.07778782, -0.7207549, -2.529435, 1, 1, 1, 1, 1,
-0.07469265, -0.2744548, -3.338042, 1, 1, 1, 1, 1,
-0.07350801, 0.4654225, 0.6598087, 1, 1, 1, 1, 1,
-0.05811009, 0.4043523, -0.9206825, 1, 1, 1, 1, 1,
-0.05664372, -0.1658335, -2.486356, 1, 1, 1, 1, 1,
-0.05600533, -0.1715083, -4.15854, 1, 1, 1, 1, 1,
-0.05554973, -0.5148594, -2.055952, 1, 1, 1, 1, 1,
-0.05547554, -0.838249, -2.234284, 1, 1, 1, 1, 1,
-0.0535552, -1.281101, -4.67349, 1, 1, 1, 1, 1,
-0.05172478, -0.01041433, -1.819967, 1, 1, 1, 1, 1,
-0.0510141, 0.6031932, 1.558933, 1, 1, 1, 1, 1,
-0.04598559, -1.429791, -1.557305, 1, 1, 1, 1, 1,
-0.04434166, 0.4104564, 0.5660777, 1, 1, 1, 1, 1,
-0.04388003, -1.920561, -3.895173, 0, 0, 1, 1, 1,
-0.0412515, 0.7421345, 1.402667, 1, 0, 0, 1, 1,
-0.03295559, 0.3364319, -0.7616186, 1, 0, 0, 1, 1,
-0.0316177, -0.5098938, -3.008031, 1, 0, 0, 1, 1,
-0.02706539, -1.472009, -1.915027, 1, 0, 0, 1, 1,
-0.02609884, -1.246006, -2.459131, 1, 0, 0, 1, 1,
-0.02569244, 0.4993853, 1.28301, 0, 0, 0, 1, 1,
-0.02535428, 0.6147717, 0.3903387, 0, 0, 0, 1, 1,
-0.0211024, 1.422821, 0.3454412, 0, 0, 0, 1, 1,
-0.0207172, 0.5711771, 0.7603674, 0, 0, 0, 1, 1,
-0.02047799, 0.1832904, 0.1954302, 0, 0, 0, 1, 1,
-0.01977951, -0.9406588, -3.364178, 0, 0, 0, 1, 1,
-0.01046098, 0.2157387, -0.8470044, 0, 0, 0, 1, 1,
-0.01024395, -0.5611525, -3.253431, 1, 1, 1, 1, 1,
-0.01018417, 0.7888597, 0.3415796, 1, 1, 1, 1, 1,
-0.009657849, 0.413462, -0.8687728, 1, 1, 1, 1, 1,
-0.008428998, -0.883871, -2.703501, 1, 1, 1, 1, 1,
-0.004485017, -1.539261, -2.75486, 1, 1, 1, 1, 1,
-0.003591294, 1.47034, 0.2469234, 1, 1, 1, 1, 1,
0.005441774, 0.1387345, 1.023299, 1, 1, 1, 1, 1,
0.009341038, -0.8667106, 3.07459, 1, 1, 1, 1, 1,
0.01763617, -0.08225516, 2.657098, 1, 1, 1, 1, 1,
0.01783593, 0.8053885, 1.222243, 1, 1, 1, 1, 1,
0.01981043, 0.7273543, -1.012589, 1, 1, 1, 1, 1,
0.02900592, -0.8382491, 2.095979, 1, 1, 1, 1, 1,
0.03073868, 2.744295, -0.470992, 1, 1, 1, 1, 1,
0.0319871, -1.199869, 4.908864, 1, 1, 1, 1, 1,
0.03374052, -0.03638222, 3.443616, 1, 1, 1, 1, 1,
0.0338196, -1.541517, 3.473216, 0, 0, 1, 1, 1,
0.0364681, -1.836647, 1.908759, 1, 0, 0, 1, 1,
0.0370543, 0.3240173, -0.06148938, 1, 0, 0, 1, 1,
0.03870317, 0.2514523, 0.02452821, 1, 0, 0, 1, 1,
0.04094335, 0.1475736, 0.8308425, 1, 0, 0, 1, 1,
0.04727244, -0.5612516, 2.955013, 1, 0, 0, 1, 1,
0.0538101, 0.1054268, -1.318953, 0, 0, 0, 1, 1,
0.05563492, -0.01622838, 2.479563, 0, 0, 0, 1, 1,
0.05885554, -1.141941, 2.777174, 0, 0, 0, 1, 1,
0.06312671, 0.6598479, 0.4464346, 0, 0, 0, 1, 1,
0.06637799, 0.01534708, 1.193454, 0, 0, 0, 1, 1,
0.0671737, -1.448745, 3.234011, 0, 0, 0, 1, 1,
0.08035746, 0.5283145, 0.2940452, 0, 0, 0, 1, 1,
0.08208087, 1.872818, -0.2989447, 1, 1, 1, 1, 1,
0.08217301, -0.9400563, 3.653068, 1, 1, 1, 1, 1,
0.08290847, 0.9950154, -1.538096, 1, 1, 1, 1, 1,
0.08315119, -0.584033, 3.74981, 1, 1, 1, 1, 1,
0.08465452, -1.366489, 2.514272, 1, 1, 1, 1, 1,
0.0857787, -0.9488415, 2.45169, 1, 1, 1, 1, 1,
0.08579875, -1.148457, 4.561, 1, 1, 1, 1, 1,
0.08957592, -1.534671, 5.540652, 1, 1, 1, 1, 1,
0.09184247, 0.1703678, -0.6481211, 1, 1, 1, 1, 1,
0.09248028, 1.480911, -1.70677, 1, 1, 1, 1, 1,
0.09333902, -1.725571, 4.902617, 1, 1, 1, 1, 1,
0.09883036, 0.9816565, 1.147249, 1, 1, 1, 1, 1,
0.09898777, -0.01922646, 2.113621, 1, 1, 1, 1, 1,
0.09935359, -0.4506206, 2.837016, 1, 1, 1, 1, 1,
0.1001468, -1.374258, 2.851748, 1, 1, 1, 1, 1,
0.1082802, -0.1017998, 4.120205, 0, 0, 1, 1, 1,
0.1090999, -1.607488, 3.651997, 1, 0, 0, 1, 1,
0.1113586, -1.343511, 2.707917, 1, 0, 0, 1, 1,
0.1142563, 0.8017949, 0.3100767, 1, 0, 0, 1, 1,
0.1187442, -0.6350068, 3.02833, 1, 0, 0, 1, 1,
0.1192561, 0.2547467, 1.355773, 1, 0, 0, 1, 1,
0.121876, 0.8747634, 1.397661, 0, 0, 0, 1, 1,
0.1245238, -0.6954917, 3.985904, 0, 0, 0, 1, 1,
0.1274261, -0.3313217, 1.213534, 0, 0, 0, 1, 1,
0.1288321, 0.09028798, 2.916325, 0, 0, 0, 1, 1,
0.1291024, 0.6512077, 0.3106568, 0, 0, 0, 1, 1,
0.1317157, 0.6990829, -1.990301, 0, 0, 0, 1, 1,
0.1349641, 0.7136915, 0.7778351, 0, 0, 0, 1, 1,
0.1350493, 2.039967, 1.463023, 1, 1, 1, 1, 1,
0.1366729, -0.1140972, 1.179179, 1, 1, 1, 1, 1,
0.1383732, 1.75172, 0.4239768, 1, 1, 1, 1, 1,
0.1392026, 0.4921553, 0.8129945, 1, 1, 1, 1, 1,
0.1416707, 0.1196781, -0.2917087, 1, 1, 1, 1, 1,
0.1444595, 0.1086852, 0.7936589, 1, 1, 1, 1, 1,
0.1459167, 1.419829, 0.4636067, 1, 1, 1, 1, 1,
0.1487943, 0.4149169, 0.8015139, 1, 1, 1, 1, 1,
0.1490333, 0.7210372, 0.9269283, 1, 1, 1, 1, 1,
0.1507382, -0.1483283, -0.5965595, 1, 1, 1, 1, 1,
0.1522559, 0.6645969, 1.268116, 1, 1, 1, 1, 1,
0.152398, 3.097759, -1.854363, 1, 1, 1, 1, 1,
0.1551893, -0.3546248, 3.603679, 1, 1, 1, 1, 1,
0.1560785, 0.8869863, 0.3542261, 1, 1, 1, 1, 1,
0.1578072, -1.902431, 2.833528, 1, 1, 1, 1, 1,
0.1584428, -1.380396, 1.953784, 0, 0, 1, 1, 1,
0.1590805, -0.2129976, 2.508548, 1, 0, 0, 1, 1,
0.1590933, -0.6370103, 3.145671, 1, 0, 0, 1, 1,
0.1616826, -0.8475789, 2.685236, 1, 0, 0, 1, 1,
0.1628388, 1.433535, 1.08111, 1, 0, 0, 1, 1,
0.1642889, 0.4939714, 0.001955553, 1, 0, 0, 1, 1,
0.1709274, 0.01403953, 2.41481, 0, 0, 0, 1, 1,
0.1736743, -2.242026, 4.189888, 0, 0, 0, 1, 1,
0.1791301, 0.97185, -0.06640001, 0, 0, 0, 1, 1,
0.1828428, 0.4179698, 0.7028868, 0, 0, 0, 1, 1,
0.1840516, -0.3093327, 2.756855, 0, 0, 0, 1, 1,
0.1866946, 0.3219496, -0.1482341, 0, 0, 0, 1, 1,
0.1918501, 0.2209083, 1.770209, 0, 0, 0, 1, 1,
0.1935148, -0.8460389, 4.062531, 1, 1, 1, 1, 1,
0.1978669, 0.3536885, 1.886169, 1, 1, 1, 1, 1,
0.2011222, -0.1503411, 0.3454134, 1, 1, 1, 1, 1,
0.202149, 0.6568976, 0.1097875, 1, 1, 1, 1, 1,
0.2023849, 0.203251, 2.135863, 1, 1, 1, 1, 1,
0.2053299, -0.2055076, 1.410903, 1, 1, 1, 1, 1,
0.2053768, 2.096925, 0.3959952, 1, 1, 1, 1, 1,
0.210698, 0.543108, 1.607485, 1, 1, 1, 1, 1,
0.2150328, 1.409812, 0.7867576, 1, 1, 1, 1, 1,
0.2196049, 0.0107076, 1.275069, 1, 1, 1, 1, 1,
0.2196697, -0.4771976, 4.012315, 1, 1, 1, 1, 1,
0.2210465, -0.333208, 3.762585, 1, 1, 1, 1, 1,
0.2220675, -0.5107762, 3.882303, 1, 1, 1, 1, 1,
0.2258535, -0.6859813, 2.097034, 1, 1, 1, 1, 1,
0.2268833, 1.177964, 1.273129, 1, 1, 1, 1, 1,
0.229282, -1.426117, 2.105953, 0, 0, 1, 1, 1,
0.2346089, 0.3562903, -0.6878142, 1, 0, 0, 1, 1,
0.2352727, -1.175318, 4.046823, 1, 0, 0, 1, 1,
0.2368933, 0.8399323, 0.2414557, 1, 0, 0, 1, 1,
0.2373099, 1.620763, -1.055395, 1, 0, 0, 1, 1,
0.2413654, -0.04849505, 2.853312, 1, 0, 0, 1, 1,
0.2429403, -0.4941588, 3.165558, 0, 0, 0, 1, 1,
0.2454495, 1.03374, 1.075175, 0, 0, 0, 1, 1,
0.2456964, -0.7489707, 1.724778, 0, 0, 0, 1, 1,
0.2464568, -0.8565257, 3.498999, 0, 0, 0, 1, 1,
0.2506412, -0.8025245, 3.957371, 0, 0, 0, 1, 1,
0.2518728, -0.1307281, 2.437628, 0, 0, 0, 1, 1,
0.2525847, -0.5132013, 1.622248, 0, 0, 0, 1, 1,
0.2595637, -0.02234567, 0.3189987, 1, 1, 1, 1, 1,
0.2650154, -0.2191082, 2.096057, 1, 1, 1, 1, 1,
0.2664508, 0.391314, 1.248731, 1, 1, 1, 1, 1,
0.2672455, -1.181516, 3.213475, 1, 1, 1, 1, 1,
0.26776, 1.064758, 1.281943, 1, 1, 1, 1, 1,
0.2709666, -0.5940767, 3.610626, 1, 1, 1, 1, 1,
0.2709788, 0.140029, 1.23967, 1, 1, 1, 1, 1,
0.2776803, 0.7302228, 0.1552097, 1, 1, 1, 1, 1,
0.2811683, 0.8281389, -0.8671337, 1, 1, 1, 1, 1,
0.2882372, -0.7278138, 2.704616, 1, 1, 1, 1, 1,
0.2901567, -0.443266, 1.694938, 1, 1, 1, 1, 1,
0.292891, 1.169327, -0.03833554, 1, 1, 1, 1, 1,
0.2935995, -2.348159, 1.772431, 1, 1, 1, 1, 1,
0.2938042, -0.6282855, 2.492524, 1, 1, 1, 1, 1,
0.2958527, 0.6172718, -0.6199157, 1, 1, 1, 1, 1,
0.3018173, -0.2222841, 1.301327, 0, 0, 1, 1, 1,
0.3118133, -1.065486, 3.535039, 1, 0, 0, 1, 1,
0.3124238, -0.5030574, 2.477938, 1, 0, 0, 1, 1,
0.31667, 0.08692653, 0.6500118, 1, 0, 0, 1, 1,
0.3205365, -0.1304204, 0.7989377, 1, 0, 0, 1, 1,
0.3214685, 1.079217, 0.0606062, 1, 0, 0, 1, 1,
0.3221889, 0.2782997, 1.791457, 0, 0, 0, 1, 1,
0.3295818, -1.114696, 3.912158, 0, 0, 0, 1, 1,
0.3331708, -0.2737877, 1.802643, 0, 0, 0, 1, 1,
0.3343635, -1.97766, 2.164752, 0, 0, 0, 1, 1,
0.3354829, 0.7146669, 0.3885386, 0, 0, 0, 1, 1,
0.3369914, 0.3340415, -0.9998307, 0, 0, 0, 1, 1,
0.3391937, 2.953156, 0.6634458, 0, 0, 0, 1, 1,
0.3400544, -0.3843532, 1.124177, 1, 1, 1, 1, 1,
0.3421373, 0.09048223, 1.48332, 1, 1, 1, 1, 1,
0.3422514, -0.8835694, 2.735819, 1, 1, 1, 1, 1,
0.3451755, -1.649169, 3.559659, 1, 1, 1, 1, 1,
0.3482477, 0.4072839, 1.345817, 1, 1, 1, 1, 1,
0.3532032, 1.693321, -1.713333, 1, 1, 1, 1, 1,
0.3535154, 1.459158, 0.4825938, 1, 1, 1, 1, 1,
0.3539311, 0.1240521, -1.107263, 1, 1, 1, 1, 1,
0.3564304, 1.544572, -1.291032, 1, 1, 1, 1, 1,
0.3566511, -2.106419, 3.624221, 1, 1, 1, 1, 1,
0.3568365, 0.8416716, 1.053039, 1, 1, 1, 1, 1,
0.359468, -0.3873833, 4.3846, 1, 1, 1, 1, 1,
0.3621724, 0.43993, -0.001571891, 1, 1, 1, 1, 1,
0.3626591, -0.2200224, 2.037052, 1, 1, 1, 1, 1,
0.3680829, 0.9964812, 0.6692697, 1, 1, 1, 1, 1,
0.3687566, 0.3516448, 2.210259, 0, 0, 1, 1, 1,
0.3688002, -1.042551, 3.621746, 1, 0, 0, 1, 1,
0.3692313, 1.369322, -2.128302, 1, 0, 0, 1, 1,
0.3700381, -0.8600136, 2.587738, 1, 0, 0, 1, 1,
0.3724908, -0.4951612, 2.738836, 1, 0, 0, 1, 1,
0.3737509, 0.7737413, -0.5604152, 1, 0, 0, 1, 1,
0.3748262, -0.8910457, 3.980336, 0, 0, 0, 1, 1,
0.3780574, 0.7384447, -1.069121, 0, 0, 0, 1, 1,
0.3787125, -0.7095404, 4.038539, 0, 0, 0, 1, 1,
0.3831648, -1.342569, 2.651583, 0, 0, 0, 1, 1,
0.3832341, -1.215144, 2.750116, 0, 0, 0, 1, 1,
0.3839993, -0.3467067, 3.125424, 0, 0, 0, 1, 1,
0.3849213, -0.8295268, 4.72146, 0, 0, 0, 1, 1,
0.3856485, -0.2215868, -0.4215705, 1, 1, 1, 1, 1,
0.3860528, 0.01886761, 3.070045, 1, 1, 1, 1, 1,
0.3879735, -0.271167, 0.5692806, 1, 1, 1, 1, 1,
0.3897921, 0.7209437, 0.4730584, 1, 1, 1, 1, 1,
0.3928628, 0.4181159, -0.2396262, 1, 1, 1, 1, 1,
0.3950715, 1.336119, 0.7573751, 1, 1, 1, 1, 1,
0.3958639, -1.416154, 2.381018, 1, 1, 1, 1, 1,
0.3978306, 0.1305692, 1.963618, 1, 1, 1, 1, 1,
0.401875, -0.8405389, 2.031601, 1, 1, 1, 1, 1,
0.4098184, 0.1800644, 1.474406, 1, 1, 1, 1, 1,
0.410403, -0.3932465, 2.30126, 1, 1, 1, 1, 1,
0.41344, 0.1121729, -0.3076915, 1, 1, 1, 1, 1,
0.4153023, -1.781538, 3.288245, 1, 1, 1, 1, 1,
0.4158922, 0.0630777, 1.525023, 1, 1, 1, 1, 1,
0.4182221, -0.4058136, 1.343948, 1, 1, 1, 1, 1,
0.4240051, -1.059967, 2.607422, 0, 0, 1, 1, 1,
0.4299532, 1.04252, 2.273865, 1, 0, 0, 1, 1,
0.4304132, -0.8509401, 1.878076, 1, 0, 0, 1, 1,
0.432791, -1.461761, 2.501874, 1, 0, 0, 1, 1,
0.4347938, -0.7182554, 2.311706, 1, 0, 0, 1, 1,
0.4389705, -0.2278069, 2.74437, 1, 0, 0, 1, 1,
0.4410803, -0.105231, 1.76855, 0, 0, 0, 1, 1,
0.4448706, 2.022395, 1.783832, 0, 0, 0, 1, 1,
0.4485787, -0.5645323, 2.381643, 0, 0, 0, 1, 1,
0.4490478, -1.146863, 3.08009, 0, 0, 0, 1, 1,
0.4507405, -0.5868053, 2.639607, 0, 0, 0, 1, 1,
0.4522844, 0.7457981, 0.7817206, 0, 0, 0, 1, 1,
0.4561066, -0.4199701, 1.081962, 0, 0, 0, 1, 1,
0.4566354, 1.081133, 1.312211, 1, 1, 1, 1, 1,
0.4574855, -1.032375, 2.467251, 1, 1, 1, 1, 1,
0.4592457, -0.5771218, 3.765664, 1, 1, 1, 1, 1,
0.4603381, 0.5077257, 1.110988, 1, 1, 1, 1, 1,
0.4607682, 1.2005, -0.9599761, 1, 1, 1, 1, 1,
0.4668323, 2.898804, -1.457927, 1, 1, 1, 1, 1,
0.4668836, 0.8358718, 1.897091, 1, 1, 1, 1, 1,
0.4682463, 0.312365, 1.307435, 1, 1, 1, 1, 1,
0.4702067, 1.560257, 2.183834, 1, 1, 1, 1, 1,
0.4716777, 0.469225, 0.7570224, 1, 1, 1, 1, 1,
0.4734583, -0.6672837, 3.204581, 1, 1, 1, 1, 1,
0.47468, -1.17448, 3.421404, 1, 1, 1, 1, 1,
0.4772825, 1.267646, -0.6836012, 1, 1, 1, 1, 1,
0.4810975, -1.37203, 2.55089, 1, 1, 1, 1, 1,
0.4838389, -1.245285, 0.04800728, 1, 1, 1, 1, 1,
0.4907016, 0.6441653, 0.6820947, 0, 0, 1, 1, 1,
0.4929471, -1.578874, 3.300956, 1, 0, 0, 1, 1,
0.4954521, -0.1094414, 2.169305, 1, 0, 0, 1, 1,
0.4978605, -0.1644387, 2.597522, 1, 0, 0, 1, 1,
0.4996607, -0.2247511, 1.211239, 1, 0, 0, 1, 1,
0.5071877, 0.569722, 1.755313, 1, 0, 0, 1, 1,
0.5143508, -0.2846839, 2.196347, 0, 0, 0, 1, 1,
0.5167394, 0.7192025, 2.833285, 0, 0, 0, 1, 1,
0.5293717, -0.008532736, 0.8630621, 0, 0, 0, 1, 1,
0.5301454, -0.754732, 4.10812, 0, 0, 0, 1, 1,
0.5338907, -0.1135067, 0.8901376, 0, 0, 0, 1, 1,
0.53727, 0.2095153, 2.19503, 0, 0, 0, 1, 1,
0.5386741, -1.979615, 1.936667, 0, 0, 0, 1, 1,
0.5388821, -0.5110373, 2.495166, 1, 1, 1, 1, 1,
0.5402283, 2.13269, 0.728615, 1, 1, 1, 1, 1,
0.5465637, -0.3932712, 3.687253, 1, 1, 1, 1, 1,
0.5483201, 0.04176157, 2.149571, 1, 1, 1, 1, 1,
0.5549667, -0.4200775, 2.655697, 1, 1, 1, 1, 1,
0.5569537, 1.078323, 0.2815676, 1, 1, 1, 1, 1,
0.5581488, 0.7488372, 0.4467096, 1, 1, 1, 1, 1,
0.5590851, -0.3211147, 3.107131, 1, 1, 1, 1, 1,
0.5601776, -0.9186064, 4.345254, 1, 1, 1, 1, 1,
0.5633736, 0.5283668, 2.107165, 1, 1, 1, 1, 1,
0.5716487, 0.9971779, -0.2842516, 1, 1, 1, 1, 1,
0.5720232, -1.561638, 0.8809478, 1, 1, 1, 1, 1,
0.5721694, 1.747897, -0.9169862, 1, 1, 1, 1, 1,
0.5768977, -0.3317688, 1.446047, 1, 1, 1, 1, 1,
0.5771531, 1.443591, 0.6899569, 1, 1, 1, 1, 1,
0.5776335, 1.753169, -1.646486, 0, 0, 1, 1, 1,
0.5777553, -0.6918908, 2.641146, 1, 0, 0, 1, 1,
0.5808319, 0.8529568, 0.5478804, 1, 0, 0, 1, 1,
0.5814365, -0.3283392, 3.129616, 1, 0, 0, 1, 1,
0.5893624, 0.1574973, -0.5974762, 1, 0, 0, 1, 1,
0.5911769, -1.308663, 0.833299, 1, 0, 0, 1, 1,
0.5949885, -0.6215956, 2.614578, 0, 0, 0, 1, 1,
0.595345, -0.8531687, 2.512218, 0, 0, 0, 1, 1,
0.6024152, 0.3288841, 0.5328858, 0, 0, 0, 1, 1,
0.6033664, 0.6143746, 3.14971, 0, 0, 0, 1, 1,
0.6130885, -0.2236854, 1.106807, 0, 0, 0, 1, 1,
0.6137586, -0.3106624, 3.071531, 0, 0, 0, 1, 1,
0.6150101, 0.8516685, -1.489065, 0, 0, 0, 1, 1,
0.6167841, -2.088937, 3.117921, 1, 1, 1, 1, 1,
0.6269404, 1.683089, 0.434494, 1, 1, 1, 1, 1,
0.6296893, -0.4289768, 1.493189, 1, 1, 1, 1, 1,
0.6329579, 0.3040737, 2.003865, 1, 1, 1, 1, 1,
0.6411474, -0.6734024, 0.1405382, 1, 1, 1, 1, 1,
0.6425722, 0.185268, 1.407811, 1, 1, 1, 1, 1,
0.6449784, -0.09452661, 1.645037, 1, 1, 1, 1, 1,
0.6457399, 1.363751, 1.007655, 1, 1, 1, 1, 1,
0.6487265, 0.4761843, 0.3279914, 1, 1, 1, 1, 1,
0.6487609, -0.7620921, 4.701273, 1, 1, 1, 1, 1,
0.6530418, 0.1857789, 0.3145016, 1, 1, 1, 1, 1,
0.6540403, -0.2810307, 1.797046, 1, 1, 1, 1, 1,
0.655345, 0.8315892, 0.7398046, 1, 1, 1, 1, 1,
0.6569122, 1.043913, 0.8274301, 1, 1, 1, 1, 1,
0.6611094, 0.9126093, 0.8752879, 1, 1, 1, 1, 1,
0.664518, 2.633952, -0.09883656, 0, 0, 1, 1, 1,
0.6713021, 0.09045488, 2.643942, 1, 0, 0, 1, 1,
0.6724175, -0.4010085, 2.397039, 1, 0, 0, 1, 1,
0.6838652, 0.5358456, 1.297367, 1, 0, 0, 1, 1,
0.6881854, 0.6182112, 0.578491, 1, 0, 0, 1, 1,
0.6884891, -0.4042459, 1.479676, 1, 0, 0, 1, 1,
0.6915737, -1.549298, 1.01495, 0, 0, 0, 1, 1,
0.6951499, -0.6334357, 4.463656, 0, 0, 0, 1, 1,
0.695541, -0.7337179, 2.242171, 0, 0, 0, 1, 1,
0.6968421, -0.6858898, 1.831235, 0, 0, 0, 1, 1,
0.7031375, 0.3479885, 1.664324, 0, 0, 0, 1, 1,
0.7033779, 2.177892, -0.5912575, 0, 0, 0, 1, 1,
0.7080474, -1.264204, 2.580493, 0, 0, 0, 1, 1,
0.7128587, 1.322977, 0.787126, 1, 1, 1, 1, 1,
0.7203494, 1.211521, 2.065326, 1, 1, 1, 1, 1,
0.7254582, -0.639313, 1.526688, 1, 1, 1, 1, 1,
0.7293673, -0.6358939, 0.9423138, 1, 1, 1, 1, 1,
0.7364781, 1.134214, 0.2460617, 1, 1, 1, 1, 1,
0.7372146, 0.8420519, 3.278004, 1, 1, 1, 1, 1,
0.7396452, 0.3048056, 0.7004536, 1, 1, 1, 1, 1,
0.7402163, -0.8454676, 3.001243, 1, 1, 1, 1, 1,
0.7434158, -1.092788, 3.957586, 1, 1, 1, 1, 1,
0.7484872, 0.7885954, 2.632402, 1, 1, 1, 1, 1,
0.7500762, -0.8466699, 3.864882, 1, 1, 1, 1, 1,
0.7504469, 1.270627, 1.15494, 1, 1, 1, 1, 1,
0.7584711, 0.4330348, 0.7241631, 1, 1, 1, 1, 1,
0.7596888, -0.1712894, 2.5467, 1, 1, 1, 1, 1,
0.7603743, -0.02875441, 1.451098, 1, 1, 1, 1, 1,
0.763684, -1.447422, 1.949508, 0, 0, 1, 1, 1,
0.7679353, -2.059019, 3.309272, 1, 0, 0, 1, 1,
0.7701848, 0.8092613, 2.514074, 1, 0, 0, 1, 1,
0.7791179, -2.214559, 3.783099, 1, 0, 0, 1, 1,
0.7817829, -1.089737, 1.06467, 1, 0, 0, 1, 1,
0.7844145, 0.1340327, 1.161357, 1, 0, 0, 1, 1,
0.7911326, 0.4301238, 1.86401, 0, 0, 0, 1, 1,
0.7920831, -1.126664, 2.298398, 0, 0, 0, 1, 1,
0.7938122, 1.819605, 0.3821285, 0, 0, 0, 1, 1,
0.7953581, 0.460013, 2.151917, 0, 0, 0, 1, 1,
0.8039488, -0.4366971, 1.056426, 0, 0, 0, 1, 1,
0.8065518, -0.237997, 0.5362484, 0, 0, 0, 1, 1,
0.8077469, 0.4106675, 0.1785304, 0, 0, 0, 1, 1,
0.8125588, -1.369051, 0.9194043, 1, 1, 1, 1, 1,
0.8174344, -0.7359154, 1.887345, 1, 1, 1, 1, 1,
0.8194614, 0.5333042, -0.5533045, 1, 1, 1, 1, 1,
0.8218839, -0.6122627, 2.5992, 1, 1, 1, 1, 1,
0.8246849, -0.8604318, 2.582948, 1, 1, 1, 1, 1,
0.8287104, -0.000823307, 1.111937, 1, 1, 1, 1, 1,
0.8311778, -0.6282015, 3.121948, 1, 1, 1, 1, 1,
0.8460265, -1.267242, 3.170043, 1, 1, 1, 1, 1,
0.8465618, -0.3868591, 2.553481, 1, 1, 1, 1, 1,
0.849303, -0.5259518, 3.218514, 1, 1, 1, 1, 1,
0.8606781, -0.09991369, 1.970719, 1, 1, 1, 1, 1,
0.8618412, -0.7299766, 1.885686, 1, 1, 1, 1, 1,
0.8660036, 0.2592718, 2.300494, 1, 1, 1, 1, 1,
0.8698198, 1.524951, 0.3359978, 1, 1, 1, 1, 1,
0.8730063, -0.1031322, 2.577781, 1, 1, 1, 1, 1,
0.8738325, -1.185814, 2.994059, 0, 0, 1, 1, 1,
0.8810031, -1.234033, 2.566642, 1, 0, 0, 1, 1,
0.8832988, 0.3987608, 0.6615502, 1, 0, 0, 1, 1,
0.8841459, -1.490039, 3.614488, 1, 0, 0, 1, 1,
0.8850377, -1.048259, 2.883292, 1, 0, 0, 1, 1,
0.8864267, 2.048505, 0.1925333, 1, 0, 0, 1, 1,
0.8873567, -0.6918818, 2.307463, 0, 0, 0, 1, 1,
0.8883582, -0.6497692, 3.752627, 0, 0, 0, 1, 1,
0.8913097, -0.6659135, 1.476108, 0, 0, 0, 1, 1,
0.8916792, -0.4757074, 0.09147658, 0, 0, 0, 1, 1,
0.8971865, 0.5656461, -0.2541247, 0, 0, 0, 1, 1,
0.8986849, -0.8914669, 1.805058, 0, 0, 0, 1, 1,
0.8995146, 0.09422574, 0.6261483, 0, 0, 0, 1, 1,
0.9196267, -1.670455, 2.062622, 1, 1, 1, 1, 1,
0.920873, 0.0001756198, 1.510123, 1, 1, 1, 1, 1,
0.9296456, -0.8667512, 2.445398, 1, 1, 1, 1, 1,
0.9347951, -0.6084508, 2.144778, 1, 1, 1, 1, 1,
0.9461417, -0.1641695, 3.065854, 1, 1, 1, 1, 1,
0.9485487, -1.532921, 2.449539, 1, 1, 1, 1, 1,
0.9553499, -0.7252268, 2.087871, 1, 1, 1, 1, 1,
0.9555896, 0.8885244, 1.45948, 1, 1, 1, 1, 1,
0.9634675, -0.0005405045, 2.436293, 1, 1, 1, 1, 1,
0.9642372, -1.612457, 1.996599, 1, 1, 1, 1, 1,
0.9646021, 1.370596, -1.023917, 1, 1, 1, 1, 1,
0.9656667, 1.464124, -0.303899, 1, 1, 1, 1, 1,
0.9697291, 1.284949, 0.0683372, 1, 1, 1, 1, 1,
0.9747239, 0.4569699, -0.487558, 1, 1, 1, 1, 1,
0.9824554, -0.7377526, 2.316358, 1, 1, 1, 1, 1,
0.9829737, -0.47079, 3.066, 0, 0, 1, 1, 1,
0.9847386, 0.5854504, 0.0467202, 1, 0, 0, 1, 1,
0.9929544, 1.410537, 0.6595401, 1, 0, 0, 1, 1,
0.9952264, 1.054693, -1.229142, 1, 0, 0, 1, 1,
1.001455, 0.8315858, -0.3735969, 1, 0, 0, 1, 1,
1.00293, 0.5195346, 3.633605, 1, 0, 0, 1, 1,
1.005108, -2.24467, 2.640986, 0, 0, 0, 1, 1,
1.005825, 1.293191, 0.3957712, 0, 0, 0, 1, 1,
1.007018, 1.236229, -0.4527767, 0, 0, 0, 1, 1,
1.008086, -0.4077363, 1.663224, 0, 0, 0, 1, 1,
1.011651, -0.6181598, 2.061184, 0, 0, 0, 1, 1,
1.018428, -0.4675449, 0.8162482, 0, 0, 0, 1, 1,
1.022646, 0.5421965, 0.4547498, 0, 0, 0, 1, 1,
1.025977, 0.05328701, 0.8765722, 1, 1, 1, 1, 1,
1.02876, 0.2404231, 2.615858, 1, 1, 1, 1, 1,
1.031327, 1.000902, -0.3681294, 1, 1, 1, 1, 1,
1.032135, 2.077384, 2.048284, 1, 1, 1, 1, 1,
1.036619, 1.903557, -1.210993, 1, 1, 1, 1, 1,
1.046269, -0.1680301, 1.032066, 1, 1, 1, 1, 1,
1.048107, 0.098963, 2.08762, 1, 1, 1, 1, 1,
1.066533, 0.4824101, 1.493075, 1, 1, 1, 1, 1,
1.071626, 0.145935, 1.623898, 1, 1, 1, 1, 1,
1.094208, -1.652329, 0.9530598, 1, 1, 1, 1, 1,
1.097764, 0.4805633, 1.226164, 1, 1, 1, 1, 1,
1.097808, -0.5223466, 3.190239, 1, 1, 1, 1, 1,
1.101516, 0.3607767, 0.7781523, 1, 1, 1, 1, 1,
1.103238, -0.2916487, 2.363142, 1, 1, 1, 1, 1,
1.105351, 1.824561, 0.1214318, 1, 1, 1, 1, 1,
1.107834, 2.023083, 0.1594079, 0, 0, 1, 1, 1,
1.11086, -0.1028937, 0.8159046, 1, 0, 0, 1, 1,
1.118159, -0.6250312, 3.584215, 1, 0, 0, 1, 1,
1.118922, -0.2202863, 1.257305, 1, 0, 0, 1, 1,
1.121664, 1.000268, -0.9246024, 1, 0, 0, 1, 1,
1.130328, 0.05259022, -0.3325121, 1, 0, 0, 1, 1,
1.137249, -0.587544, 2.03943, 0, 0, 0, 1, 1,
1.138003, -0.3641319, 0.5455683, 0, 0, 0, 1, 1,
1.138391, 1.24371, 2.351893, 0, 0, 0, 1, 1,
1.140978, 0.5161774, 0.3901003, 0, 0, 0, 1, 1,
1.152459, -0.3732391, 3.022754, 0, 0, 0, 1, 1,
1.156956, 2.488661, 0.7550727, 0, 0, 0, 1, 1,
1.159439, 0.4446517, 2.311426, 0, 0, 0, 1, 1,
1.165944, -1.592404, 1.653304, 1, 1, 1, 1, 1,
1.172997, 0.671658, 3.361073, 1, 1, 1, 1, 1,
1.179976, -0.7811188, 1.215536, 1, 1, 1, 1, 1,
1.181748, 1.493899, 1.656611, 1, 1, 1, 1, 1,
1.187034, -1.229896, 2.02953, 1, 1, 1, 1, 1,
1.190061, 1.619299, 0.4547304, 1, 1, 1, 1, 1,
1.208451, -2.211366, 2.541242, 1, 1, 1, 1, 1,
1.210489, 0.7881178, 0.5194915, 1, 1, 1, 1, 1,
1.21824, -0.3645131, 2.275179, 1, 1, 1, 1, 1,
1.232278, -1.282034, 2.771107, 1, 1, 1, 1, 1,
1.233793, -0.7949508, 2.042609, 1, 1, 1, 1, 1,
1.234069, -0.07884025, 2.212744, 1, 1, 1, 1, 1,
1.237987, -1.739314, 2.711326, 1, 1, 1, 1, 1,
1.238916, -0.3509667, 0.9744384, 1, 1, 1, 1, 1,
1.246062, 0.4241598, 2.001763, 1, 1, 1, 1, 1,
1.256587, 0.9633659, -0.6439813, 0, 0, 1, 1, 1,
1.269665, -2.208942, 2.574353, 1, 0, 0, 1, 1,
1.270483, -1.066073, 1.206197, 1, 0, 0, 1, 1,
1.273253, 0.8904446, 0.2786089, 1, 0, 0, 1, 1,
1.27693, -1.232381, 2.291059, 1, 0, 0, 1, 1,
1.277948, 1.792829, 1.853249, 1, 0, 0, 1, 1,
1.282811, -0.3904304, 3.701494, 0, 0, 0, 1, 1,
1.283922, 0.6161077, -0.4308879, 0, 0, 0, 1, 1,
1.288588, 0.4276512, 1.112268, 0, 0, 0, 1, 1,
1.29278, -0.1038167, 1.788173, 0, 0, 0, 1, 1,
1.295566, 0.5597315, 2.643437, 0, 0, 0, 1, 1,
1.303948, -0.1052197, 3.441298, 0, 0, 0, 1, 1,
1.305926, 0.1565709, -0.4153427, 0, 0, 0, 1, 1,
1.309596, -0.3903103, 2.15651, 1, 1, 1, 1, 1,
1.312896, -1.322357, 2.721546, 1, 1, 1, 1, 1,
1.315699, -1.276133, 2.211513, 1, 1, 1, 1, 1,
1.349468, 0.9985883, 3.046136, 1, 1, 1, 1, 1,
1.361916, 0.1509929, 1.7471, 1, 1, 1, 1, 1,
1.36404, 1.441556, 0.4184173, 1, 1, 1, 1, 1,
1.372421, -1.144753, 2.746392, 1, 1, 1, 1, 1,
1.37442, 0.07486963, 2.208839, 1, 1, 1, 1, 1,
1.37814, -0.02679356, 0.00978101, 1, 1, 1, 1, 1,
1.378609, 1.374471, -0.02444194, 1, 1, 1, 1, 1,
1.381153, 1.467308, 0.1741632, 1, 1, 1, 1, 1,
1.412818, 0.1389077, 3.206033, 1, 1, 1, 1, 1,
1.419259, 0.9404548, -0.4563293, 1, 1, 1, 1, 1,
1.420067, 1.543293, 0.8993922, 1, 1, 1, 1, 1,
1.434094, 1.363251, 0.6074069, 1, 1, 1, 1, 1,
1.450405, 0.8363277, 2.102591, 0, 0, 1, 1, 1,
1.459566, -0.06308474, 2.101236, 1, 0, 0, 1, 1,
1.465395, 1.764184, 1.372395, 1, 0, 0, 1, 1,
1.466354, -0.37024, 1.896643, 1, 0, 0, 1, 1,
1.485319, 0.7322799, 3.231169, 1, 0, 0, 1, 1,
1.486433, 0.5153403, 3.196747, 1, 0, 0, 1, 1,
1.488701, 1.330954, 1.723001, 0, 0, 0, 1, 1,
1.497883, -2.550197, 1.898355, 0, 0, 0, 1, 1,
1.514855, -0.3479922, 1.635584, 0, 0, 0, 1, 1,
1.5163, -1.068051, 1.515692, 0, 0, 0, 1, 1,
1.537677, -0.2415992, 2.191589, 0, 0, 0, 1, 1,
1.541358, 0.07657868, -1.610395, 0, 0, 0, 1, 1,
1.54292, 1.427667, -0.2980767, 0, 0, 0, 1, 1,
1.544229, 0.5724137, 1.078394, 1, 1, 1, 1, 1,
1.546446, 0.250557, 1.262972, 1, 1, 1, 1, 1,
1.56312, -1.263757, 2.240828, 1, 1, 1, 1, 1,
1.580965, 0.9666911, 3.167022, 1, 1, 1, 1, 1,
1.582653, -0.03353811, 0.02780782, 1, 1, 1, 1, 1,
1.583367, 0.1312239, 0.3555559, 1, 1, 1, 1, 1,
1.588037, -2.287127, 0.7270437, 1, 1, 1, 1, 1,
1.604612, -0.7223624, 2.197256, 1, 1, 1, 1, 1,
1.605907, 1.546791, 2.436269, 1, 1, 1, 1, 1,
1.616756, 0.5106437, 0.4323955, 1, 1, 1, 1, 1,
1.636445, -1.275139, 2.195969, 1, 1, 1, 1, 1,
1.646934, 0.7249194, 2.622782, 1, 1, 1, 1, 1,
1.664042, 0.7790658, 2.483487, 1, 1, 1, 1, 1,
1.667794, -0.7034279, 3.269076, 1, 1, 1, 1, 1,
1.679541, 0.05335454, 2.876799, 1, 1, 1, 1, 1,
1.681503, -1.559815, 2.343896, 0, 0, 1, 1, 1,
1.706246, -0.2299294, 1.090746, 1, 0, 0, 1, 1,
1.739902, 1.256454, -0.5163879, 1, 0, 0, 1, 1,
1.750246, -0.07073502, 2.164517, 1, 0, 0, 1, 1,
1.755862, -1.338424, 1.723487, 1, 0, 0, 1, 1,
1.767244, 1.710303, 1.061508, 1, 0, 0, 1, 1,
1.779538, 0.0279754, 0.6101657, 0, 0, 0, 1, 1,
1.781042, -1.761391, 3.879843, 0, 0, 0, 1, 1,
1.789214, 0.1516477, 2.148698, 0, 0, 0, 1, 1,
1.797246, -0.4863644, 0.8973848, 0, 0, 0, 1, 1,
1.806992, 0.841883, 0.7831671, 0, 0, 0, 1, 1,
1.827956, -0.9366554, 1.325805, 0, 0, 0, 1, 1,
1.834428, -0.7897885, 0.6016484, 0, 0, 0, 1, 1,
1.842181, -0.4032445, 0.5470922, 1, 1, 1, 1, 1,
1.843874, -0.02780964, 1.386536, 1, 1, 1, 1, 1,
1.853106, -0.7320256, 1.265833, 1, 1, 1, 1, 1,
1.863656, 1.539602, 0.8277414, 1, 1, 1, 1, 1,
1.886455, -0.4424201, 1.201838, 1, 1, 1, 1, 1,
1.887181, 0.03754478, 1.479802, 1, 1, 1, 1, 1,
1.930391, 0.2949655, 1.342042, 1, 1, 1, 1, 1,
1.937975, -0.05112512, 2.145, 1, 1, 1, 1, 1,
1.938377, -0.7637107, 1.640662, 1, 1, 1, 1, 1,
1.954953, -0.1987637, 0.694553, 1, 1, 1, 1, 1,
1.967888, 0.4186922, 3.073957, 1, 1, 1, 1, 1,
2.006787, -0.5063564, 1.491737, 1, 1, 1, 1, 1,
2.010617, 2.064398, 0.764236, 1, 1, 1, 1, 1,
2.042414, 1.641744, 1.785933, 1, 1, 1, 1, 1,
2.044887, 0.4650217, 2.114583, 1, 1, 1, 1, 1,
2.052739, 1.891417, 0.5809765, 0, 0, 1, 1, 1,
2.148153, 0.1958925, 2.099679, 1, 0, 0, 1, 1,
2.167294, -0.3189821, 1.296773, 1, 0, 0, 1, 1,
2.174736, 1.300708, 0.3072253, 1, 0, 0, 1, 1,
2.205417, -1.698481, 1.025502, 1, 0, 0, 1, 1,
2.210734, -0.4329614, 0.3761692, 1, 0, 0, 1, 1,
2.214663, -0.003143089, 1.050991, 0, 0, 0, 1, 1,
2.222114, 1.053364, 1.130701, 0, 0, 0, 1, 1,
2.226113, 1.295301, 2.259411, 0, 0, 0, 1, 1,
2.233306, 0.06536601, 3.068928, 0, 0, 0, 1, 1,
2.28126, -0.5038163, -0.1712362, 0, 0, 0, 1, 1,
2.294413, -0.633747, 0.4856653, 0, 0, 0, 1, 1,
2.353102, 1.372666, 0.3497394, 0, 0, 0, 1, 1,
2.35323, 0.6176079, 0.5034918, 1, 1, 1, 1, 1,
2.400519, 0.6571755, 0.3922964, 1, 1, 1, 1, 1,
2.410126, -0.3652028, 0.2838192, 1, 1, 1, 1, 1,
2.413174, -0.4762705, 1.139066, 1, 1, 1, 1, 1,
2.462279, 0.2896811, 2.439172, 1, 1, 1, 1, 1,
2.542086, 1.115548, 3.610971, 1, 1, 1, 1, 1,
3.327601, -0.618288, 2.463721, 1, 1, 1, 1, 1
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
var radius = 9.929279;
var distance = 34.87617;
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
mvMatrix.translate( 0.04449821, 0.1567903, 0.1124208 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.87617);
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