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
-3.72038, 0.348661, -1.945927, 1, 0, 0, 1,
-2.691381, -0.5589252, -2.247988, 1, 0.007843138, 0, 1,
-2.535515, -0.1844485, -3.775336, 1, 0.01176471, 0, 1,
-2.515684, 1.20529, -0.8479691, 1, 0.01960784, 0, 1,
-2.514878, -0.5524756, -2.126212, 1, 0.02352941, 0, 1,
-2.459627, -0.6512366, -1.281895, 1, 0.03137255, 0, 1,
-2.427925, 1.0288, -0.2048119, 1, 0.03529412, 0, 1,
-2.387766, -0.925721, -2.138863, 1, 0.04313726, 0, 1,
-2.350516, -0.7899613, -1.677391, 1, 0.04705882, 0, 1,
-2.319947, 0.3319041, -1.346973, 1, 0.05490196, 0, 1,
-2.319168, -0.8783829, -1.020083, 1, 0.05882353, 0, 1,
-2.279191, 0.9928544, -2.138746, 1, 0.06666667, 0, 1,
-2.262969, 0.2087418, -2.122844, 1, 0.07058824, 0, 1,
-2.20758, 0.9385912, -0.2943425, 1, 0.07843138, 0, 1,
-2.18384, 1.568234, -0.8119872, 1, 0.08235294, 0, 1,
-2.180192, 0.3579653, -0.2031935, 1, 0.09019608, 0, 1,
-2.14374, -0.1222194, -2.193121, 1, 0.09411765, 0, 1,
-2.138288, 0.03567391, -4.059712, 1, 0.1019608, 0, 1,
-2.115818, 0.990572, -1.070824, 1, 0.1098039, 0, 1,
-2.083958, -0.1195355, -1.038614, 1, 0.1137255, 0, 1,
-2.076037, 0.8692326, -1.36283, 1, 0.1215686, 0, 1,
-2.071712, 0.9763052, -2.31025, 1, 0.1254902, 0, 1,
-2.036395, -0.8610032, -1.786782, 1, 0.1333333, 0, 1,
-2.02001, 1.144464, -0.2044288, 1, 0.1372549, 0, 1,
-2.014034, -1.262582, -1.637521, 1, 0.145098, 0, 1,
-1.999367, 0.3125771, -0.9136534, 1, 0.1490196, 0, 1,
-1.979251, 1.116701, -1.762836, 1, 0.1568628, 0, 1,
-1.975728, -1.183172, -3.215664, 1, 0.1607843, 0, 1,
-1.951585, -0.5018904, -1.826335, 1, 0.1686275, 0, 1,
-1.884492, 1.077421, 0.4598303, 1, 0.172549, 0, 1,
-1.884174, 1.385011, -0.9999728, 1, 0.1803922, 0, 1,
-1.834981, -0.08626335, -1.96184, 1, 0.1843137, 0, 1,
-1.827863, 0.6198407, -2.762319, 1, 0.1921569, 0, 1,
-1.825746, -0.7046797, -1.655976, 1, 0.1960784, 0, 1,
-1.82067, -0.5931038, -2.722286, 1, 0.2039216, 0, 1,
-1.813294, -1.375769, -2.731226, 1, 0.2117647, 0, 1,
-1.80835, -0.1433471, -1.546284, 1, 0.2156863, 0, 1,
-1.782258, 0.05219334, -1.528511, 1, 0.2235294, 0, 1,
-1.777073, -1.167825, -2.61899, 1, 0.227451, 0, 1,
-1.776665, -1.102048, -1.665533, 1, 0.2352941, 0, 1,
-1.774508, -0.9968933, -2.411713, 1, 0.2392157, 0, 1,
-1.771243, -0.04446538, -1.524109, 1, 0.2470588, 0, 1,
-1.759506, 0.6485656, -0.940116, 1, 0.2509804, 0, 1,
-1.743583, 0.9787024, 0.148642, 1, 0.2588235, 0, 1,
-1.740783, 1.075423, -0.05513496, 1, 0.2627451, 0, 1,
-1.732998, 0.5654235, -3.043858, 1, 0.2705882, 0, 1,
-1.704458, -1.480655, -1.705349, 1, 0.2745098, 0, 1,
-1.695266, 0.1001856, 1.727331, 1, 0.282353, 0, 1,
-1.694105, -0.6764004, -2.016554, 1, 0.2862745, 0, 1,
-1.677944, 1.165411, -1.576066, 1, 0.2941177, 0, 1,
-1.668192, 1.160241, -1.602083, 1, 0.3019608, 0, 1,
-1.667581, -0.3674984, -0.05024867, 1, 0.3058824, 0, 1,
-1.649113, 0.9569378, -0.8388358, 1, 0.3137255, 0, 1,
-1.637593, 0.375902, -0.18147, 1, 0.3176471, 0, 1,
-1.637248, -0.7222345, -2.910926, 1, 0.3254902, 0, 1,
-1.616168, -0.7339294, -2.481614, 1, 0.3294118, 0, 1,
-1.611979, 1.645885, -0.768186, 1, 0.3372549, 0, 1,
-1.600949, -1.173985, -3.461477, 1, 0.3411765, 0, 1,
-1.571282, 0.3972352, -0.2223603, 1, 0.3490196, 0, 1,
-1.562238, 0.08385335, -2.207897, 1, 0.3529412, 0, 1,
-1.56163, 0.4660026, -1.22903, 1, 0.3607843, 0, 1,
-1.56138, 1.354078, -2.071127, 1, 0.3647059, 0, 1,
-1.554674, 1.410956, -0.4607039, 1, 0.372549, 0, 1,
-1.528791, 0.3793185, -2.127095, 1, 0.3764706, 0, 1,
-1.525027, -2.013965, -2.3008, 1, 0.3843137, 0, 1,
-1.521734, -0.01483997, -2.394119, 1, 0.3882353, 0, 1,
-1.514327, -0.3698068, -1.252166, 1, 0.3960784, 0, 1,
-1.514304, -1.785845, -2.599565, 1, 0.4039216, 0, 1,
-1.513119, -1.441731, -0.5661554, 1, 0.4078431, 0, 1,
-1.512663, -2.053855, -2.367148, 1, 0.4156863, 0, 1,
-1.506153, -0.1211664, 0.0157259, 1, 0.4196078, 0, 1,
-1.503339, -0.5056571, -3.563737, 1, 0.427451, 0, 1,
-1.490104, -1.041453, -2.226842, 1, 0.4313726, 0, 1,
-1.489649, 0.5177063, -2.300088, 1, 0.4392157, 0, 1,
-1.471681, -0.5558177, -0.3812656, 1, 0.4431373, 0, 1,
-1.466489, -0.4426998, -1.97587, 1, 0.4509804, 0, 1,
-1.466354, 0.8898323, 0.986192, 1, 0.454902, 0, 1,
-1.462348, 1.257578, -2.3144, 1, 0.4627451, 0, 1,
-1.46077, -1.86486, -2.111157, 1, 0.4666667, 0, 1,
-1.459442, -1.339304, -0.6729254, 1, 0.4745098, 0, 1,
-1.447662, 0.6304101, -2.864967, 1, 0.4784314, 0, 1,
-1.439247, 0.4037293, -1.423554, 1, 0.4862745, 0, 1,
-1.429322, 2.245102, -0.4675604, 1, 0.4901961, 0, 1,
-1.42539, 1.227873, -1.241069, 1, 0.4980392, 0, 1,
-1.412244, -0.6047332, -4.523818, 1, 0.5058824, 0, 1,
-1.411537, -0.9174189, -3.146127, 1, 0.509804, 0, 1,
-1.405288, 2.205889, -1.937361, 1, 0.5176471, 0, 1,
-1.38396, 0.3036731, -1.376261, 1, 0.5215687, 0, 1,
-1.380935, 0.2273972, -1.532118, 1, 0.5294118, 0, 1,
-1.380251, -1.308226, -1.493032, 1, 0.5333334, 0, 1,
-1.378592, -0.7344501, -2.842753, 1, 0.5411765, 0, 1,
-1.377769, -0.5965649, -0.05710592, 1, 0.5450981, 0, 1,
-1.35648, 1.436698, -0.4302498, 1, 0.5529412, 0, 1,
-1.355399, -1.03508, -2.771993, 1, 0.5568628, 0, 1,
-1.350607, 0.2438416, -2.72582, 1, 0.5647059, 0, 1,
-1.348929, 1.090445, -2.530522, 1, 0.5686275, 0, 1,
-1.341476, 0.1726059, 0.6043412, 1, 0.5764706, 0, 1,
-1.339272, -0.815287, -1.67617, 1, 0.5803922, 0, 1,
-1.338522, 1.325428, -0.2584247, 1, 0.5882353, 0, 1,
-1.336596, -0.5724795, -2.532089, 1, 0.5921569, 0, 1,
-1.336178, -1.313653, -0.8608028, 1, 0.6, 0, 1,
-1.335886, -0.9890381, -2.315266, 1, 0.6078432, 0, 1,
-1.331993, -0.6454695, -3.058116, 1, 0.6117647, 0, 1,
-1.323842, 0.4672418, -1.562964, 1, 0.6196079, 0, 1,
-1.32345, -0.2171777, -2.839885, 1, 0.6235294, 0, 1,
-1.32246, 1.891737, -0.8726074, 1, 0.6313726, 0, 1,
-1.322025, -0.8794281, -1.134522, 1, 0.6352941, 0, 1,
-1.313435, -0.03697167, -0.7660384, 1, 0.6431373, 0, 1,
-1.29828, -0.1793438, -0.6617613, 1, 0.6470588, 0, 1,
-1.295649, 0.2513547, -2.320327, 1, 0.654902, 0, 1,
-1.281861, 0.4653872, -0.7942823, 1, 0.6588235, 0, 1,
-1.278632, -0.4951817, -4.037676, 1, 0.6666667, 0, 1,
-1.270289, -0.8320792, -3.269253, 1, 0.6705883, 0, 1,
-1.268475, -0.9970679, -0.9839963, 1, 0.6784314, 0, 1,
-1.262622, 0.2410382, -1.565114, 1, 0.682353, 0, 1,
-1.253203, 1.621695, 0.3888517, 1, 0.6901961, 0, 1,
-1.247839, -1.141835, -0.9014082, 1, 0.6941177, 0, 1,
-1.236857, -0.6759228, -2.965279, 1, 0.7019608, 0, 1,
-1.23535, -0.5482223, -1.570531, 1, 0.7098039, 0, 1,
-1.234051, -1.610793, -3.029891, 1, 0.7137255, 0, 1,
-1.224461, -0.6773723, -0.3781641, 1, 0.7215686, 0, 1,
-1.219502, 1.420654, 0.5667626, 1, 0.7254902, 0, 1,
-1.214265, -1.742173, -3.159026, 1, 0.7333333, 0, 1,
-1.213076, -0.2554941, 0.3737137, 1, 0.7372549, 0, 1,
-1.209608, 0.2103345, -1.110345, 1, 0.7450981, 0, 1,
-1.20334, 0.1996566, -1.172058, 1, 0.7490196, 0, 1,
-1.199952, 1.533212, -1.657703, 1, 0.7568628, 0, 1,
-1.191967, 1.181401, 0.4576268, 1, 0.7607843, 0, 1,
-1.187896, -0.8304438, -2.029742, 1, 0.7686275, 0, 1,
-1.187319, 1.469469, -1.083725, 1, 0.772549, 0, 1,
-1.156375, 0.3698668, -0.5325119, 1, 0.7803922, 0, 1,
-1.1458, -0.2437077, -1.943027, 1, 0.7843137, 0, 1,
-1.145637, -1.162228, -1.176726, 1, 0.7921569, 0, 1,
-1.140359, -0.6389214, -4.013473, 1, 0.7960784, 0, 1,
-1.139036, -0.3802961, -0.4537108, 1, 0.8039216, 0, 1,
-1.132873, 0.1871553, -2.866045, 1, 0.8117647, 0, 1,
-1.131967, -2.411835, -3.587187, 1, 0.8156863, 0, 1,
-1.129117, 1.320333, -1.472308, 1, 0.8235294, 0, 1,
-1.125892, -0.6747255, -3.391973, 1, 0.827451, 0, 1,
-1.124262, 1.745145, -1.538495, 1, 0.8352941, 0, 1,
-1.12362, 0.1660354, -0.9760594, 1, 0.8392157, 0, 1,
-1.118902, 0.8586114, -0.1905978, 1, 0.8470588, 0, 1,
-1.112428, -0.9685243, -1.863069, 1, 0.8509804, 0, 1,
-1.111073, -0.9945164, -2.833637, 1, 0.8588235, 0, 1,
-1.105342, -0.2716199, -1.909755, 1, 0.8627451, 0, 1,
-1.103034, 0.6211306, -0.7129948, 1, 0.8705882, 0, 1,
-1.099789, 1.471059, -0.360113, 1, 0.8745098, 0, 1,
-1.091246, 1.190845, -2.71956, 1, 0.8823529, 0, 1,
-1.082809, 0.7916585, -0.5841841, 1, 0.8862745, 0, 1,
-1.074369, 0.9481325, 0.2546258, 1, 0.8941177, 0, 1,
-1.072086, -0.1784578, -3.189566, 1, 0.8980392, 0, 1,
-1.054015, -0.3245344, -3.611881, 1, 0.9058824, 0, 1,
-1.052102, -0.5416069, -0.8133359, 1, 0.9137255, 0, 1,
-1.049299, -0.2675787, -1.826509, 1, 0.9176471, 0, 1,
-1.041964, -0.5672861, -1.248111, 1, 0.9254902, 0, 1,
-1.041715, -1.565062, -2.054138, 1, 0.9294118, 0, 1,
-1.03962, 0.07086913, -1.885348, 1, 0.9372549, 0, 1,
-1.031371, 0.3240089, -0.7219855, 1, 0.9411765, 0, 1,
-1.027883, 0.2365917, -2.683025, 1, 0.9490196, 0, 1,
-1.023513, -2.438734, -4.521824, 1, 0.9529412, 0, 1,
-1.02095, -0.002065744, -1.627245, 1, 0.9607843, 0, 1,
-1.018921, -1.38657, -2.445004, 1, 0.9647059, 0, 1,
-1.007979, -0.2270807, -2.655738, 1, 0.972549, 0, 1,
-1.001564, 1.209996, 0.6505957, 1, 0.9764706, 0, 1,
-1.000254, -1.29398, -4.151608, 1, 0.9843137, 0, 1,
-1.000244, -1.291607, -1.265412, 1, 0.9882353, 0, 1,
-0.9971257, 0.09173971, -0.8788622, 1, 0.9960784, 0, 1,
-0.9968488, 0.6737329, -0.8186261, 0.9960784, 1, 0, 1,
-0.9948797, 0.7789678, -1.097953, 0.9921569, 1, 0, 1,
-0.9929138, -0.2966753, -1.969804, 0.9843137, 1, 0, 1,
-0.9923515, 1.059798, -2.465341, 0.9803922, 1, 0, 1,
-0.9865344, -1.465883, -1.628182, 0.972549, 1, 0, 1,
-0.9835454, 0.08955001, -1.589809, 0.9686275, 1, 0, 1,
-0.9805484, -0.1571407, -3.66737, 0.9607843, 1, 0, 1,
-0.9773563, 0.2620387, -2.165877, 0.9568627, 1, 0, 1,
-0.9769158, 1.554502, -1.355748, 0.9490196, 1, 0, 1,
-0.9767715, -0.9624348, -3.072731, 0.945098, 1, 0, 1,
-0.9657009, 1.247628, -1.888865, 0.9372549, 1, 0, 1,
-0.96487, -0.08374458, -0.4206919, 0.9333333, 1, 0, 1,
-0.9634935, 1.222017, -0.001648918, 0.9254902, 1, 0, 1,
-0.9623463, 1.35284, -0.1891577, 0.9215686, 1, 0, 1,
-0.9621904, 0.6371031, -2.180055, 0.9137255, 1, 0, 1,
-0.9485627, 0.5025191, -1.012425, 0.9098039, 1, 0, 1,
-0.9440023, -1.433981, -3.279044, 0.9019608, 1, 0, 1,
-0.9227389, -0.4535068, -1.444418, 0.8941177, 1, 0, 1,
-0.9116861, 2.262299, -0.1271687, 0.8901961, 1, 0, 1,
-0.9025111, 0.3291922, -1.897802, 0.8823529, 1, 0, 1,
-0.8968636, -2.353738, -1.72404, 0.8784314, 1, 0, 1,
-0.8950521, 0.666155, -0.05573441, 0.8705882, 1, 0, 1,
-0.8875521, -0.4846944, -2.488618, 0.8666667, 1, 0, 1,
-0.8861049, -0.1067534, -0.8450207, 0.8588235, 1, 0, 1,
-0.8820821, -0.3417693, -3.174445, 0.854902, 1, 0, 1,
-0.8740828, -0.313008, -1.672911, 0.8470588, 1, 0, 1,
-0.8718953, -2.098532, -2.402995, 0.8431373, 1, 0, 1,
-0.8701284, 0.1630829, -2.243746, 0.8352941, 1, 0, 1,
-0.8693401, -0.07112774, -2.69719, 0.8313726, 1, 0, 1,
-0.868426, 0.05731246, -2.139427, 0.8235294, 1, 0, 1,
-0.8645533, 0.2074331, -0.6173981, 0.8196079, 1, 0, 1,
-0.855371, -1.133409, -2.509553, 0.8117647, 1, 0, 1,
-0.8359057, -0.571695, -3.338303, 0.8078431, 1, 0, 1,
-0.8340839, -1.943207, -2.045507, 0.8, 1, 0, 1,
-0.8339639, -0.9973285, -1.754482, 0.7921569, 1, 0, 1,
-0.8325632, -0.06609372, -1.652263, 0.7882353, 1, 0, 1,
-0.8291728, -0.4821975, -3.897182, 0.7803922, 1, 0, 1,
-0.8262368, 0.9048166, 0.3384886, 0.7764706, 1, 0, 1,
-0.8181483, -0.3581303, -2.058064, 0.7686275, 1, 0, 1,
-0.8088366, -0.4292363, -0.9436283, 0.7647059, 1, 0, 1,
-0.8056698, -0.3701223, -2.535764, 0.7568628, 1, 0, 1,
-0.797265, -1.610216, -3.371411, 0.7529412, 1, 0, 1,
-0.7942247, -2.371773, -1.252041, 0.7450981, 1, 0, 1,
-0.7926537, -0.9190324, -2.521338, 0.7411765, 1, 0, 1,
-0.7921999, -0.4076163, -1.172208, 0.7333333, 1, 0, 1,
-0.7916568, 0.4315704, -0.6099363, 0.7294118, 1, 0, 1,
-0.791566, -0.1439977, -1.390712, 0.7215686, 1, 0, 1,
-0.7872617, 1.436657, 1.632578, 0.7176471, 1, 0, 1,
-0.7843869, 0.8478142, -1.570783, 0.7098039, 1, 0, 1,
-0.781368, 0.1501334, -0.7486377, 0.7058824, 1, 0, 1,
-0.7791159, -1.534541, -1.750272, 0.6980392, 1, 0, 1,
-0.7786654, -2.071452, -3.170348, 0.6901961, 1, 0, 1,
-0.7741589, 1.178191, -2.413525, 0.6862745, 1, 0, 1,
-0.7734097, 0.4462626, -0.9667964, 0.6784314, 1, 0, 1,
-0.769832, -0.9762486, -2.890587, 0.6745098, 1, 0, 1,
-0.7685104, 0.5414426, -0.5170425, 0.6666667, 1, 0, 1,
-0.7645165, 0.2806568, -2.222429, 0.6627451, 1, 0, 1,
-0.7640952, 0.6333954, -0.6784456, 0.654902, 1, 0, 1,
-0.7599576, -0.0544285, -1.706422, 0.6509804, 1, 0, 1,
-0.7583184, 2.127926, -1.605175, 0.6431373, 1, 0, 1,
-0.7581016, -0.5058489, -1.991673, 0.6392157, 1, 0, 1,
-0.7573142, -1.433696, -3.263052, 0.6313726, 1, 0, 1,
-0.7566945, -0.1093781, -2.190973, 0.627451, 1, 0, 1,
-0.7526634, -0.01484128, -1.251159, 0.6196079, 1, 0, 1,
-0.7514644, 2.083049, -0.743462, 0.6156863, 1, 0, 1,
-0.7506125, -1.401774, -2.202023, 0.6078432, 1, 0, 1,
-0.749684, 0.9139277, -1.591907, 0.6039216, 1, 0, 1,
-0.7453376, -0.4385028, -2.628643, 0.5960785, 1, 0, 1,
-0.7445006, 0.1227257, -0.5516925, 0.5882353, 1, 0, 1,
-0.7399929, -0.6741449, -3.001365, 0.5843138, 1, 0, 1,
-0.7363427, 0.4505143, -1.370126, 0.5764706, 1, 0, 1,
-0.73533, 2.499904, 0.8396105, 0.572549, 1, 0, 1,
-0.7262372, -1.163938, -3.069448, 0.5647059, 1, 0, 1,
-0.7210819, 0.997722, 0.23993, 0.5607843, 1, 0, 1,
-0.7207065, 0.6413977, -2.290897, 0.5529412, 1, 0, 1,
-0.7184885, -0.09001471, -1.231204, 0.5490196, 1, 0, 1,
-0.7113884, -0.927323, -3.679549, 0.5411765, 1, 0, 1,
-0.6997964, -0.4803627, -3.123945, 0.5372549, 1, 0, 1,
-0.6976041, -0.2224069, -3.103393, 0.5294118, 1, 0, 1,
-0.6929947, -0.7058188, -2.180816, 0.5254902, 1, 0, 1,
-0.6814909, 0.6832215, -1.207745, 0.5176471, 1, 0, 1,
-0.6765991, -1.827405, -4.728078, 0.5137255, 1, 0, 1,
-0.6763281, -0.02479749, -2.062371, 0.5058824, 1, 0, 1,
-0.6729178, 0.9361949, -1.44778, 0.5019608, 1, 0, 1,
-0.6726451, -0.4098951, -4.203279, 0.4941176, 1, 0, 1,
-0.6725742, -1.004113, -4.140545, 0.4862745, 1, 0, 1,
-0.6655294, -0.7854488, -3.830651, 0.4823529, 1, 0, 1,
-0.6646655, 0.3559817, -1.980272, 0.4745098, 1, 0, 1,
-0.6541652, 1.147467, -0.2706429, 0.4705882, 1, 0, 1,
-0.6526732, -0.2441629, -0.4416609, 0.4627451, 1, 0, 1,
-0.650547, -1.17039, -4.092373, 0.4588235, 1, 0, 1,
-0.6499646, -0.1392424, -1.159682, 0.4509804, 1, 0, 1,
-0.649147, -0.247614, -2.052035, 0.4470588, 1, 0, 1,
-0.6446245, -0.4598564, -1.027479, 0.4392157, 1, 0, 1,
-0.6440053, 0.2456892, -0.2020819, 0.4352941, 1, 0, 1,
-0.6419631, 0.7420265, -1.126143, 0.427451, 1, 0, 1,
-0.6313781, 1.426843, -1.616316, 0.4235294, 1, 0, 1,
-0.631018, 0.2011176, -0.8592286, 0.4156863, 1, 0, 1,
-0.6191797, -1.504903, -3.325745, 0.4117647, 1, 0, 1,
-0.6177583, -1.506873, -2.726694, 0.4039216, 1, 0, 1,
-0.6106097, 1.136464, -0.0716477, 0.3960784, 1, 0, 1,
-0.6061217, -1.981991, -5.264326, 0.3921569, 1, 0, 1,
-0.6025016, -0.2416885, -3.327343, 0.3843137, 1, 0, 1,
-0.6014495, 0.5382178, -0.3061527, 0.3803922, 1, 0, 1,
-0.5918683, -0.2862885, -1.510966, 0.372549, 1, 0, 1,
-0.5895008, -0.5415547, -1.793893, 0.3686275, 1, 0, 1,
-0.5821474, -0.03501548, -2.25397, 0.3607843, 1, 0, 1,
-0.5748692, -1.368643, -2.096412, 0.3568628, 1, 0, 1,
-0.5711048, -0.1218034, -1.624106, 0.3490196, 1, 0, 1,
-0.5701755, -0.5485717, -1.816837, 0.345098, 1, 0, 1,
-0.5695688, 0.1382718, -1.04386, 0.3372549, 1, 0, 1,
-0.5689499, -0.3129498, -4.011798, 0.3333333, 1, 0, 1,
-0.5648685, -1.308001, -2.48934, 0.3254902, 1, 0, 1,
-0.5594152, -0.2363929, -2.259537, 0.3215686, 1, 0, 1,
-0.5579133, -0.1373942, -1.986494, 0.3137255, 1, 0, 1,
-0.5575815, 0.3016425, -1.989698, 0.3098039, 1, 0, 1,
-0.5558033, -0.8646252, -1.568535, 0.3019608, 1, 0, 1,
-0.5492291, -0.3569243, -1.537434, 0.2941177, 1, 0, 1,
-0.5478208, -0.8488804, -4.747488, 0.2901961, 1, 0, 1,
-0.5399246, -0.3998768, -1.282011, 0.282353, 1, 0, 1,
-0.534681, 0.1866701, -2.197305, 0.2784314, 1, 0, 1,
-0.5336913, 0.4733975, -0.8574198, 0.2705882, 1, 0, 1,
-0.5286866, 0.8933413, -0.05758762, 0.2666667, 1, 0, 1,
-0.5278079, -1.038426, -3.49434, 0.2588235, 1, 0, 1,
-0.5244954, -0.9076449, -2.573548, 0.254902, 1, 0, 1,
-0.5235861, 0.6120064, -2.672558, 0.2470588, 1, 0, 1,
-0.5224392, -2.888112, -2.063283, 0.2431373, 1, 0, 1,
-0.5198312, -0.8820993, -4.562253, 0.2352941, 1, 0, 1,
-0.5172949, -1.037496, -3.418109, 0.2313726, 1, 0, 1,
-0.5095473, -0.07594323, 0.2336115, 0.2235294, 1, 0, 1,
-0.5050693, 0.5041859, -0.3691036, 0.2196078, 1, 0, 1,
-0.5040492, -1.396054, -3.869984, 0.2117647, 1, 0, 1,
-0.5033146, 0.721226, -2.279232, 0.2078431, 1, 0, 1,
-0.5020643, -0.6099942, -3.296997, 0.2, 1, 0, 1,
-0.5003739, 0.09554124, -0.8234527, 0.1921569, 1, 0, 1,
-0.5001397, 1.343244, -1.092551, 0.1882353, 1, 0, 1,
-0.4992736, 0.8626183, -0.1567628, 0.1803922, 1, 0, 1,
-0.497141, -1.853771, -3.398151, 0.1764706, 1, 0, 1,
-0.4886351, 0.5941675, 0.1741832, 0.1686275, 1, 0, 1,
-0.4786358, 0.288746, -1.786027, 0.1647059, 1, 0, 1,
-0.4782692, -0.5099976, -2.333832, 0.1568628, 1, 0, 1,
-0.4776452, -2.586846, -4.202031, 0.1529412, 1, 0, 1,
-0.4653994, 0.6353745, -2.011778, 0.145098, 1, 0, 1,
-0.464208, -0.4692625, -2.505925, 0.1411765, 1, 0, 1,
-0.46383, 1.076796, -0.8950033, 0.1333333, 1, 0, 1,
-0.4607147, -0.6106766, -2.154748, 0.1294118, 1, 0, 1,
-0.4593197, 2.022536, 0.0045642, 0.1215686, 1, 0, 1,
-0.4585366, 0.6952997, -0.8195582, 0.1176471, 1, 0, 1,
-0.4576589, -1.618961, -4.489421, 0.1098039, 1, 0, 1,
-0.45402, -0.04394665, -2.549761, 0.1058824, 1, 0, 1,
-0.4515651, 0.9257297, 1.763957, 0.09803922, 1, 0, 1,
-0.4483126, -1.365222, -3.494147, 0.09019608, 1, 0, 1,
-0.4459493, 0.9327238, -0.9972153, 0.08627451, 1, 0, 1,
-0.4404766, 0.7729775, -1.944307, 0.07843138, 1, 0, 1,
-0.4394771, 1.110798, 0.6610175, 0.07450981, 1, 0, 1,
-0.4310083, -0.3436977, -2.755847, 0.06666667, 1, 0, 1,
-0.4310004, -1.072373, -3.825926, 0.0627451, 1, 0, 1,
-0.4291725, 0.2025866, -0.8123008, 0.05490196, 1, 0, 1,
-0.4289322, -1.023926, -2.145121, 0.05098039, 1, 0, 1,
-0.4271073, -1.206623, -3.886647, 0.04313726, 1, 0, 1,
-0.4259556, 0.5609467, -1.388449, 0.03921569, 1, 0, 1,
-0.4241602, 0.6009709, -2.233714, 0.03137255, 1, 0, 1,
-0.4237642, -1.783503, -3.41491, 0.02745098, 1, 0, 1,
-0.4217798, -0.03029247, -3.934898, 0.01960784, 1, 0, 1,
-0.4167937, -0.5377784, -3.618497, 0.01568628, 1, 0, 1,
-0.4167167, -0.8789085, -2.987348, 0.007843138, 1, 0, 1,
-0.4156639, 0.4960027, -1.67961, 0.003921569, 1, 0, 1,
-0.4156632, 1.274098, 0.6132286, 0, 1, 0.003921569, 1,
-0.4099746, -0.1113462, -1.330421, 0, 1, 0.01176471, 1,
-0.4078753, 0.1201697, -0.4251225, 0, 1, 0.01568628, 1,
-0.406962, 1.232319, -0.5412549, 0, 1, 0.02352941, 1,
-0.4067758, 0.3229995, -0.2801179, 0, 1, 0.02745098, 1,
-0.4063058, -0.7108711, -0.9080803, 0, 1, 0.03529412, 1,
-0.3972937, -0.1151481, -0.06424116, 0, 1, 0.03921569, 1,
-0.3961751, 1.714158, 0.1471435, 0, 1, 0.04705882, 1,
-0.394638, 0.203683, -1.70733, 0, 1, 0.05098039, 1,
-0.390691, 0.1709658, -1.359307, 0, 1, 0.05882353, 1,
-0.386218, -0.7078158, -4.903873, 0, 1, 0.0627451, 1,
-0.386039, 0.1709362, -1.255118, 0, 1, 0.07058824, 1,
-0.3840309, -0.6486617, -2.222945, 0, 1, 0.07450981, 1,
-0.3821529, -0.1770364, -0.4735278, 0, 1, 0.08235294, 1,
-0.3812172, -0.4229499, -1.242139, 0, 1, 0.08627451, 1,
-0.3797072, 1.941229, -0.01252415, 0, 1, 0.09411765, 1,
-0.3680311, 1.024386, 1.993255, 0, 1, 0.1019608, 1,
-0.3670161, -0.669866, -1.611236, 0, 1, 0.1058824, 1,
-0.3646096, 0.689415, -0.3980826, 0, 1, 0.1137255, 1,
-0.3639053, -0.9753162, -2.602163, 0, 1, 0.1176471, 1,
-0.3619491, -1.309813, -4.97419, 0, 1, 0.1254902, 1,
-0.3546939, 1.106929, -0.2045545, 0, 1, 0.1294118, 1,
-0.3501902, -1.177525, -3.604179, 0, 1, 0.1372549, 1,
-0.3472687, 0.3065173, -1.342, 0, 1, 0.1411765, 1,
-0.3406673, 1.545919, 0.6963398, 0, 1, 0.1490196, 1,
-0.3362033, 0.8602525, -2.000903, 0, 1, 0.1529412, 1,
-0.3353849, 0.253552, 0.6582586, 0, 1, 0.1607843, 1,
-0.3341711, -0.5295358, -2.715448, 0, 1, 0.1647059, 1,
-0.3311037, -0.7366472, -2.402543, 0, 1, 0.172549, 1,
-0.3284215, -0.3632234, -0.7184007, 0, 1, 0.1764706, 1,
-0.3206352, 0.6309922, -0.5179222, 0, 1, 0.1843137, 1,
-0.3182031, 0.187126, -0.9561378, 0, 1, 0.1882353, 1,
-0.3157896, 0.5381174, 0.1475859, 0, 1, 0.1960784, 1,
-0.3142282, -0.1255452, -3.896798, 0, 1, 0.2039216, 1,
-0.3124647, 1.217758, -0.6365504, 0, 1, 0.2078431, 1,
-0.3115301, 0.7221037, 1.200848, 0, 1, 0.2156863, 1,
-0.3108539, 0.8953827, -0.8231717, 0, 1, 0.2196078, 1,
-0.3086756, 1.725215, -1.333572, 0, 1, 0.227451, 1,
-0.3086461, 1.229647, 1.543359, 0, 1, 0.2313726, 1,
-0.3078361, 1.526039, 0.03720459, 0, 1, 0.2392157, 1,
-0.3068427, 0.7444141, 2.105482, 0, 1, 0.2431373, 1,
-0.3053223, 0.3275767, 0.8646802, 0, 1, 0.2509804, 1,
-0.303025, -2.157963, -1.179983, 0, 1, 0.254902, 1,
-0.3021027, -0.1571853, -1.776325, 0, 1, 0.2627451, 1,
-0.3012163, 0.9332551, 0.713884, 0, 1, 0.2666667, 1,
-0.3000741, 0.9451184, -0.1377485, 0, 1, 0.2745098, 1,
-0.2916328, -0.561536, -2.482756, 0, 1, 0.2784314, 1,
-0.2894786, -0.9611859, -4.206253, 0, 1, 0.2862745, 1,
-0.2874814, 0.7788892, -0.6028669, 0, 1, 0.2901961, 1,
-0.2813656, -0.2044636, -3.210108, 0, 1, 0.2980392, 1,
-0.2806761, -0.1690122, -1.733938, 0, 1, 0.3058824, 1,
-0.2803462, 0.01751641, -0.456743, 0, 1, 0.3098039, 1,
-0.2793876, 1.074427, 0.9285348, 0, 1, 0.3176471, 1,
-0.2771938, -0.1813046, -3.313051, 0, 1, 0.3215686, 1,
-0.2770422, 1.331634, -0.7279539, 0, 1, 0.3294118, 1,
-0.2748584, 0.3064055, 1.445246, 0, 1, 0.3333333, 1,
-0.2747181, -0.2907085, -2.168911, 0, 1, 0.3411765, 1,
-0.2742814, -1.512657, -4.674668, 0, 1, 0.345098, 1,
-0.2720191, 1.637282, -0.8366634, 0, 1, 0.3529412, 1,
-0.2705339, -0.09787334, -2.037613, 0, 1, 0.3568628, 1,
-0.2681833, -0.08119818, -1.320271, 0, 1, 0.3647059, 1,
-0.2656357, 3.083326, 0.1747087, 0, 1, 0.3686275, 1,
-0.2635514, 1.214539, 0.3370651, 0, 1, 0.3764706, 1,
-0.2627466, -0.3190556, -4.042637, 0, 1, 0.3803922, 1,
-0.2605627, -1.305159, -1.74528, 0, 1, 0.3882353, 1,
-0.260503, -0.577823, -2.261657, 0, 1, 0.3921569, 1,
-0.259159, -1.221154, -4.068471, 0, 1, 0.4, 1,
-0.2590583, 0.556992, 0.18495, 0, 1, 0.4078431, 1,
-0.2581235, 0.6964546, -1.252102, 0, 1, 0.4117647, 1,
-0.2557599, 0.541666, -1.949733, 0, 1, 0.4196078, 1,
-0.252911, 1.692191, -1.324564, 0, 1, 0.4235294, 1,
-0.2523545, -0.7425425, -1.43089, 0, 1, 0.4313726, 1,
-0.2497275, 0.3511682, 1.620082, 0, 1, 0.4352941, 1,
-0.2483143, 0.5189031, -1.907446, 0, 1, 0.4431373, 1,
-0.2439247, -1.277791, -2.266417, 0, 1, 0.4470588, 1,
-0.2422778, 0.828998, 0.8536509, 0, 1, 0.454902, 1,
-0.235796, -0.4856631, -2.232231, 0, 1, 0.4588235, 1,
-0.2297494, -0.02715405, -2.865282, 0, 1, 0.4666667, 1,
-0.2252115, -0.7243249, -3.639482, 0, 1, 0.4705882, 1,
-0.2216443, 0.09269553, -1.348573, 0, 1, 0.4784314, 1,
-0.2152333, -1.114703, -3.444493, 0, 1, 0.4823529, 1,
-0.2150823, -0.6532252, -2.607776, 0, 1, 0.4901961, 1,
-0.215037, -0.9582449, -4.705781, 0, 1, 0.4941176, 1,
-0.2078702, -0.4368117, -2.506796, 0, 1, 0.5019608, 1,
-0.2064715, -1.078544, -5.77827, 0, 1, 0.509804, 1,
-0.2055956, -1.221277, -3.171612, 0, 1, 0.5137255, 1,
-0.2042873, -0.1771369, -2.038828, 0, 1, 0.5215687, 1,
-0.1978587, 0.4148921, -0.2333131, 0, 1, 0.5254902, 1,
-0.1956142, 0.4773983, 0.3109552, 0, 1, 0.5333334, 1,
-0.1952968, 1.051257, -0.2527574, 0, 1, 0.5372549, 1,
-0.1697499, 0.9103496, -0.8913516, 0, 1, 0.5450981, 1,
-0.1686972, 0.2391905, -1.201205, 0, 1, 0.5490196, 1,
-0.1672522, -1.133613, -2.227839, 0, 1, 0.5568628, 1,
-0.1667678, 0.4432332, 0.4466507, 0, 1, 0.5607843, 1,
-0.1636974, 0.2017594, 0.02303642, 0, 1, 0.5686275, 1,
-0.1626943, 0.4012706, 0.731544, 0, 1, 0.572549, 1,
-0.1580702, 0.5543544, -0.6703286, 0, 1, 0.5803922, 1,
-0.1568535, 1.519684, -2.063498, 0, 1, 0.5843138, 1,
-0.1549231, 0.430011, -1.762357, 0, 1, 0.5921569, 1,
-0.1535963, 0.4409561, 0.7745199, 0, 1, 0.5960785, 1,
-0.1500902, -1.559985, -3.249238, 0, 1, 0.6039216, 1,
-0.149823, -0.1578571, -3.386068, 0, 1, 0.6117647, 1,
-0.147736, 0.1184284, -0.9624903, 0, 1, 0.6156863, 1,
-0.1448576, -1.635989, -2.19301, 0, 1, 0.6235294, 1,
-0.139973, -0.1574326, -3.361366, 0, 1, 0.627451, 1,
-0.1366095, -1.492476, -4.931884, 0, 1, 0.6352941, 1,
-0.1360372, 0.2943446, 0.3787537, 0, 1, 0.6392157, 1,
-0.1346876, 0.8937826, -1.770517, 0, 1, 0.6470588, 1,
-0.1341839, -0.1597734, -3.620447, 0, 1, 0.6509804, 1,
-0.1275852, 0.2651828, 1.766872, 0, 1, 0.6588235, 1,
-0.1236775, 0.452068, -0.3930899, 0, 1, 0.6627451, 1,
-0.1209832, 0.6201404, 0.5594093, 0, 1, 0.6705883, 1,
-0.1182559, -1.095056, -2.670162, 0, 1, 0.6745098, 1,
-0.1131841, -1.215149, -3.156853, 0, 1, 0.682353, 1,
-0.1086676, 1.821303, 0.005367196, 0, 1, 0.6862745, 1,
-0.1080597, -1.322031, -3.328283, 0, 1, 0.6941177, 1,
-0.107704, 2.244606, -0.9953821, 0, 1, 0.7019608, 1,
-0.1072786, -0.3165243, -2.620013, 0, 1, 0.7058824, 1,
-0.1036565, -0.4320798, -4.118773, 0, 1, 0.7137255, 1,
-0.1031716, -1.105731, -3.010821, 0, 1, 0.7176471, 1,
-0.09720222, 0.3257079, -0.8474116, 0, 1, 0.7254902, 1,
-0.09698663, 0.1046669, 0.2131005, 0, 1, 0.7294118, 1,
-0.0943913, 0.2361061, -1.283361, 0, 1, 0.7372549, 1,
-0.09387469, 0.3324734, -0.6721407, 0, 1, 0.7411765, 1,
-0.09387072, 0.09762653, -1.326523, 0, 1, 0.7490196, 1,
-0.09164025, -1.889848, -3.193458, 0, 1, 0.7529412, 1,
-0.08707822, 0.2270693, -0.3324177, 0, 1, 0.7607843, 1,
-0.08698054, 0.1996312, 0.1813615, 0, 1, 0.7647059, 1,
-0.08695929, 0.7368637, 0.08101398, 0, 1, 0.772549, 1,
-0.08246485, 0.05201644, -1.24823, 0, 1, 0.7764706, 1,
-0.0806429, 0.6102031, -0.871708, 0, 1, 0.7843137, 1,
-0.0713428, 0.6614398, -0.6179863, 0, 1, 0.7882353, 1,
-0.06809406, -1.428156, -3.875299, 0, 1, 0.7960784, 1,
-0.06737267, -0.732769, -2.552489, 0, 1, 0.8039216, 1,
-0.06725652, 0.3708776, -1.615319, 0, 1, 0.8078431, 1,
-0.06482492, -0.54827, -3.75273, 0, 1, 0.8156863, 1,
-0.06365561, 1.215665, -1.032547, 0, 1, 0.8196079, 1,
-0.05924316, 1.345815, -0.4379953, 0, 1, 0.827451, 1,
-0.05281049, 0.514973, -0.132166, 0, 1, 0.8313726, 1,
-0.04997585, 0.09967063, 0.856667, 0, 1, 0.8392157, 1,
-0.04689557, -0.6463022, -4.922862, 0, 1, 0.8431373, 1,
-0.03757948, -0.03686614, -2.728308, 0, 1, 0.8509804, 1,
-0.03394449, -0.1019199, -2.8796, 0, 1, 0.854902, 1,
-0.03067634, 0.4426371, 0.5968652, 0, 1, 0.8627451, 1,
-0.02860442, -1.224009, -4.576563, 0, 1, 0.8666667, 1,
-0.02821234, 0.3983983, -0.480322, 0, 1, 0.8745098, 1,
-0.0261397, -0.3191442, -2.94392, 0, 1, 0.8784314, 1,
-0.0240498, -0.536281, -2.778446, 0, 1, 0.8862745, 1,
-0.02308447, 0.2350968, 0.6821107, 0, 1, 0.8901961, 1,
-0.01656172, -0.5549804, -3.142966, 0, 1, 0.8980392, 1,
-0.01418633, 0.8096742, -0.1583435, 0, 1, 0.9058824, 1,
-0.01398033, -0.1821888, -3.915385, 0, 1, 0.9098039, 1,
-0.01143386, -0.1658151, -3.466392, 0, 1, 0.9176471, 1,
-0.00063662, -1.627159, -3.637681, 0, 1, 0.9215686, 1,
0.004343328, -1.287696, 4.628797, 0, 1, 0.9294118, 1,
0.005093714, -1.295349, 3.25757, 0, 1, 0.9333333, 1,
0.00798755, 2.178488, -0.5306967, 0, 1, 0.9411765, 1,
0.01060773, -0.7504688, 3.914283, 0, 1, 0.945098, 1,
0.01117056, 0.3088966, -0.0161013, 0, 1, 0.9529412, 1,
0.01526431, 0.5162158, 0.377868, 0, 1, 0.9568627, 1,
0.01567464, 0.1435716, -1.028136, 0, 1, 0.9647059, 1,
0.01700916, 0.0305497, 0.9248517, 0, 1, 0.9686275, 1,
0.02097581, 0.678557, -0.0251061, 0, 1, 0.9764706, 1,
0.02162864, -0.414453, 3.396215, 0, 1, 0.9803922, 1,
0.02466524, -1.701287, 4.184312, 0, 1, 0.9882353, 1,
0.02622639, -0.702198, 3.961505, 0, 1, 0.9921569, 1,
0.02862097, -0.5899013, 3.353287, 0, 1, 1, 1,
0.03057956, -2.018179, 1.461436, 0, 0.9921569, 1, 1,
0.03642901, -1.217205, 1.934731, 0, 0.9882353, 1, 1,
0.04110368, -2.040417, 3.798653, 0, 0.9803922, 1, 1,
0.0432098, 0.3057255, -1.004729, 0, 0.9764706, 1, 1,
0.04625451, -0.3798641, 3.903059, 0, 0.9686275, 1, 1,
0.05007119, 0.7472598, -0.1533395, 0, 0.9647059, 1, 1,
0.05118834, -0.3292606, 3.431063, 0, 0.9568627, 1, 1,
0.05715917, -2.156772, 2.488809, 0, 0.9529412, 1, 1,
0.05979452, -0.1039891, 1.964009, 0, 0.945098, 1, 1,
0.06381915, -0.4591921, 3.051489, 0, 0.9411765, 1, 1,
0.06775516, 0.5516134, 0.01058681, 0, 0.9333333, 1, 1,
0.07151651, -2.444081, 2.461149, 0, 0.9294118, 1, 1,
0.0720052, -0.3770997, 2.390391, 0, 0.9215686, 1, 1,
0.07216915, -2.407023, 1.122706, 0, 0.9176471, 1, 1,
0.07345222, -0.8826349, 3.860841, 0, 0.9098039, 1, 1,
0.07459075, 0.6062455, -0.0393109, 0, 0.9058824, 1, 1,
0.07592506, -0.9341595, 3.3391, 0, 0.8980392, 1, 1,
0.07660387, -0.8204279, 1.058408, 0, 0.8901961, 1, 1,
0.0771571, -0.1452721, 1.846864, 0, 0.8862745, 1, 1,
0.08127198, -2.079096, 5.219666, 0, 0.8784314, 1, 1,
0.085467, -0.7142601, 2.857649, 0, 0.8745098, 1, 1,
0.08885318, -1.351893, 1.580008, 0, 0.8666667, 1, 1,
0.08972228, -1.065142, 1.413843, 0, 0.8627451, 1, 1,
0.08989191, 2.309432, 0.3381746, 0, 0.854902, 1, 1,
0.09161515, -1.574412, 3.809986, 0, 0.8509804, 1, 1,
0.0917833, -2.221421, 3.030707, 0, 0.8431373, 1, 1,
0.09183269, 0.5182353, -0.9276105, 0, 0.8392157, 1, 1,
0.09340221, 0.1658898, 1.036595, 0, 0.8313726, 1, 1,
0.0939497, 0.199329, 0.6279649, 0, 0.827451, 1, 1,
0.09433981, 1.073606, 0.02883171, 0, 0.8196079, 1, 1,
0.09526269, 0.04403694, 0.7895827, 0, 0.8156863, 1, 1,
0.09774767, 0.8314105, 0.1147739, 0, 0.8078431, 1, 1,
0.09842263, 0.02227331, 2.383364, 0, 0.8039216, 1, 1,
0.1005327, 0.6259269, 1.013802, 0, 0.7960784, 1, 1,
0.100995, 0.1411885, 0.3903869, 0, 0.7882353, 1, 1,
0.1014865, -0.4331721, 4.793971, 0, 0.7843137, 1, 1,
0.1032597, 0.4313269, 0.3268078, 0, 0.7764706, 1, 1,
0.104652, 0.2825334, 1.545837, 0, 0.772549, 1, 1,
0.1056226, -0.3037165, 3.122499, 0, 0.7647059, 1, 1,
0.1057573, 1.273124, -1.014029, 0, 0.7607843, 1, 1,
0.1077228, 1.008563, 0.8251838, 0, 0.7529412, 1, 1,
0.1097163, -0.4938434, 2.852461, 0, 0.7490196, 1, 1,
0.1112263, -1.917755, 3.531934, 0, 0.7411765, 1, 1,
0.1154494, -0.3889788, 3.502242, 0, 0.7372549, 1, 1,
0.1216937, -0.0883299, 2.03596, 0, 0.7294118, 1, 1,
0.1230892, 2.18425, -0.1419892, 0, 0.7254902, 1, 1,
0.1302055, -0.2373087, 2.487725, 0, 0.7176471, 1, 1,
0.1328265, -1.191443, 3.259773, 0, 0.7137255, 1, 1,
0.1360614, 0.27449, 0.1105394, 0, 0.7058824, 1, 1,
0.1373635, 1.593926, -1.419852, 0, 0.6980392, 1, 1,
0.138438, 1.413389, 0.4071059, 0, 0.6941177, 1, 1,
0.1404376, -1.362105, 1.980038, 0, 0.6862745, 1, 1,
0.1423264, 0.004582265, 0.7795336, 0, 0.682353, 1, 1,
0.1426031, 0.0358431, 0.6570872, 0, 0.6745098, 1, 1,
0.1437303, 1.085208, -0.2788274, 0, 0.6705883, 1, 1,
0.1450212, 0.9030916, 1.319061, 0, 0.6627451, 1, 1,
0.1456836, 0.2829933, 0.9766295, 0, 0.6588235, 1, 1,
0.1481686, -0.1684077, 2.797702, 0, 0.6509804, 1, 1,
0.1484945, 0.4323485, 0.7970454, 0, 0.6470588, 1, 1,
0.1493035, 0.3877233, -1.226554, 0, 0.6392157, 1, 1,
0.1494392, 0.08021671, -0.8737186, 0, 0.6352941, 1, 1,
0.1500588, 0.7799522, 0.4539576, 0, 0.627451, 1, 1,
0.1548707, -1.231628, 2.906936, 0, 0.6235294, 1, 1,
0.1561604, 0.9626147, -1.169872, 0, 0.6156863, 1, 1,
0.1571001, -1.179254, 2.933206, 0, 0.6117647, 1, 1,
0.1581681, -1.030448, 3.672834, 0, 0.6039216, 1, 1,
0.1601691, -1.509342, 1.851158, 0, 0.5960785, 1, 1,
0.1620052, -0.02390797, 2.068658, 0, 0.5921569, 1, 1,
0.1638935, 0.7126586, 1.873325, 0, 0.5843138, 1, 1,
0.1779925, 0.8503585, 0.7883112, 0, 0.5803922, 1, 1,
0.1788532, -0.7249147, 2.724009, 0, 0.572549, 1, 1,
0.1838526, -1.483343, 3.683471, 0, 0.5686275, 1, 1,
0.1962876, -0.3370066, 2.725358, 0, 0.5607843, 1, 1,
0.1998711, -0.1506576, 2.663781, 0, 0.5568628, 1, 1,
0.2010669, 0.1344243, 1.44785, 0, 0.5490196, 1, 1,
0.2093082, -1.913465, 2.969906, 0, 0.5450981, 1, 1,
0.2135742, 0.2111823, -0.9732465, 0, 0.5372549, 1, 1,
0.2152289, 0.3230224, 3.464015, 0, 0.5333334, 1, 1,
0.2187327, 0.1157845, 1.749333, 0, 0.5254902, 1, 1,
0.2246237, -0.8968202, 3.996336, 0, 0.5215687, 1, 1,
0.2286467, -0.2836985, 4.557482, 0, 0.5137255, 1, 1,
0.229198, -2.18092, 1.374998, 0, 0.509804, 1, 1,
0.2310122, 1.088129, 1.226538, 0, 0.5019608, 1, 1,
0.2318279, 0.6548638, 1.133541, 0, 0.4941176, 1, 1,
0.2322397, 0.4663267, 0.1309219, 0, 0.4901961, 1, 1,
0.2377475, 0.9934016, -0.2673101, 0, 0.4823529, 1, 1,
0.241639, -0.8704841, 3.577989, 0, 0.4784314, 1, 1,
0.2420999, 0.59842, 0.4680875, 0, 0.4705882, 1, 1,
0.2446387, 1.227014, 1.47833, 0, 0.4666667, 1, 1,
0.2447811, 0.3492031, 0.1572502, 0, 0.4588235, 1, 1,
0.2502375, -0.04960804, 1.551635, 0, 0.454902, 1, 1,
0.2514865, 0.1891272, 0.5160102, 0, 0.4470588, 1, 1,
0.2519218, 0.4297554, 0.407242, 0, 0.4431373, 1, 1,
0.2542189, -0.7407888, 4.704257, 0, 0.4352941, 1, 1,
0.2555385, -0.06729777, 0.8353237, 0, 0.4313726, 1, 1,
0.2563828, -0.257893, 2.594661, 0, 0.4235294, 1, 1,
0.2579704, 0.1423503, 0.9065785, 0, 0.4196078, 1, 1,
0.2626447, -1.443601, 2.275918, 0, 0.4117647, 1, 1,
0.2626694, 1.562906, -1.718185, 0, 0.4078431, 1, 1,
0.263531, 0.7512201, 0.8551014, 0, 0.4, 1, 1,
0.2657644, 0.5231634, 0.2021263, 0, 0.3921569, 1, 1,
0.2678377, 0.2542394, 1.834018, 0, 0.3882353, 1, 1,
0.2707372, -0.8051317, 2.59768, 0, 0.3803922, 1, 1,
0.2754927, 0.3980069, 1.182987, 0, 0.3764706, 1, 1,
0.277419, -0.5313338, 2.529427, 0, 0.3686275, 1, 1,
0.2838354, -0.6084157, 2.881758, 0, 0.3647059, 1, 1,
0.2890619, 0.02772478, 1.473376, 0, 0.3568628, 1, 1,
0.2922897, -0.1751175, 3.028485, 0, 0.3529412, 1, 1,
0.293155, -0.8444337, 3.439052, 0, 0.345098, 1, 1,
0.294709, 0.9016426, -1.137557, 0, 0.3411765, 1, 1,
0.2991241, -0.4583778, 2.661861, 0, 0.3333333, 1, 1,
0.3014363, -0.7217081, 3.778304, 0, 0.3294118, 1, 1,
0.3024008, 0.2208287, 0.2373583, 0, 0.3215686, 1, 1,
0.3114857, 1.032444, 1.091864, 0, 0.3176471, 1, 1,
0.3134721, -0.1914302, 2.556261, 0, 0.3098039, 1, 1,
0.3135997, -1.412401, 2.211305, 0, 0.3058824, 1, 1,
0.3158183, -1.101414, 2.360588, 0, 0.2980392, 1, 1,
0.3170357, -0.4432993, 1.890037, 0, 0.2901961, 1, 1,
0.3170836, -0.1427656, 1.950766, 0, 0.2862745, 1, 1,
0.3173213, 0.03571846, 0.6933321, 0, 0.2784314, 1, 1,
0.3199258, -1.535116, 2.251931, 0, 0.2745098, 1, 1,
0.321161, -1.434662, 2.182886, 0, 0.2666667, 1, 1,
0.3297824, 1.022344, -1.246636, 0, 0.2627451, 1, 1,
0.3339262, 0.6092086, -0.273592, 0, 0.254902, 1, 1,
0.334291, -0.723118, 3.730431, 0, 0.2509804, 1, 1,
0.3344419, 0.2231504, 0.8411049, 0, 0.2431373, 1, 1,
0.3432685, -0.558746, 2.028247, 0, 0.2392157, 1, 1,
0.3436524, 0.3649064, 0.05079117, 0, 0.2313726, 1, 1,
0.3438809, -0.7087487, 3.924846, 0, 0.227451, 1, 1,
0.3524577, 0.4975911, -1.737873, 0, 0.2196078, 1, 1,
0.3538742, 1.764624, 1.165099, 0, 0.2156863, 1, 1,
0.3562602, -0.1367344, 1.139012, 0, 0.2078431, 1, 1,
0.3669007, -1.084467, 2.372438, 0, 0.2039216, 1, 1,
0.3708749, -0.4019279, 3.286389, 0, 0.1960784, 1, 1,
0.3763476, -0.4969951, 0.7547038, 0, 0.1882353, 1, 1,
0.3771119, -0.411995, 2.032194, 0, 0.1843137, 1, 1,
0.37751, 0.4850131, 0.3717769, 0, 0.1764706, 1, 1,
0.3775704, 1.191525, 2.030116, 0, 0.172549, 1, 1,
0.3790499, -0.09544122, 1.717494, 0, 0.1647059, 1, 1,
0.385002, 0.8453473, 0.2309005, 0, 0.1607843, 1, 1,
0.3886382, -0.1485704, 1.857915, 0, 0.1529412, 1, 1,
0.3900581, -0.09788578, 2.762432, 0, 0.1490196, 1, 1,
0.3909229, 1.425782, 1.148495, 0, 0.1411765, 1, 1,
0.3976194, -0.9147468, 2.890936, 0, 0.1372549, 1, 1,
0.4033248, 1.0992, 0.3031873, 0, 0.1294118, 1, 1,
0.4054737, -0.3638458, 2.883231, 0, 0.1254902, 1, 1,
0.4089392, -0.01409112, -0.1408427, 0, 0.1176471, 1, 1,
0.4152363, -0.7059475, 3.709165, 0, 0.1137255, 1, 1,
0.4169604, -0.2802257, 3.448977, 0, 0.1058824, 1, 1,
0.4175194, 0.3776414, 1.54865, 0, 0.09803922, 1, 1,
0.4194753, 0.4811378, 1.480638, 0, 0.09411765, 1, 1,
0.4263549, -1.108427, 3.86407, 0, 0.08627451, 1, 1,
0.4285882, -1.21931, 2.74281, 0, 0.08235294, 1, 1,
0.4294727, 0.2677409, 0.8750532, 0, 0.07450981, 1, 1,
0.4319563, 0.7027289, -0.4228234, 0, 0.07058824, 1, 1,
0.432693, -1.6321, 3.8029, 0, 0.0627451, 1, 1,
0.4339976, 1.594578, 0.5898748, 0, 0.05882353, 1, 1,
0.4353541, -0.7290869, 1.182296, 0, 0.05098039, 1, 1,
0.435978, 0.01809778, 2.380522, 0, 0.04705882, 1, 1,
0.4409576, -0.420513, 1.958301, 0, 0.03921569, 1, 1,
0.4447308, -0.1737282, 1.36183, 0, 0.03529412, 1, 1,
0.4494749, -1.234515, 3.37731, 0, 0.02745098, 1, 1,
0.4494865, 0.597214, -1.90249, 0, 0.02352941, 1, 1,
0.4499035, -0.4593704, 1.993911, 0, 0.01568628, 1, 1,
0.4500289, 1.586769, -0.2526886, 0, 0.01176471, 1, 1,
0.4541353, 0.07460478, -0.007292746, 0, 0.003921569, 1, 1,
0.4549716, -0.6565285, 2.19681, 0.003921569, 0, 1, 1,
0.4550183, 0.4920901, 1.772119, 0.007843138, 0, 1, 1,
0.4561949, 0.1144743, 0.8496103, 0.01568628, 0, 1, 1,
0.4584248, 1.211507, -0.2556685, 0.01960784, 0, 1, 1,
0.4655141, -0.5960441, 1.936896, 0.02745098, 0, 1, 1,
0.4695131, -0.03144512, 2.004563, 0.03137255, 0, 1, 1,
0.4706927, 0.936535, -0.3915413, 0.03921569, 0, 1, 1,
0.4768301, 1.298212, 1.201024, 0.04313726, 0, 1, 1,
0.4791718, -1.268892, 3.520018, 0.05098039, 0, 1, 1,
0.4849086, -2.031999, 2.043343, 0.05490196, 0, 1, 1,
0.4863059, -0.3244956, 3.961829, 0.0627451, 0, 1, 1,
0.4917129, -0.9062843, 1.237148, 0.06666667, 0, 1, 1,
0.4924838, 1.941792, 0.2536229, 0.07450981, 0, 1, 1,
0.4947031, -0.9077219, 3.418289, 0.07843138, 0, 1, 1,
0.4973414, -1.389354, 2.908744, 0.08627451, 0, 1, 1,
0.4975074, -1.095611, 3.671588, 0.09019608, 0, 1, 1,
0.4996091, -2.528008, 2.810922, 0.09803922, 0, 1, 1,
0.5008147, 1.473272, 0.1479891, 0.1058824, 0, 1, 1,
0.502261, 0.9976302, 3.487564, 0.1098039, 0, 1, 1,
0.5030932, 0.05007245, 1.598488, 0.1176471, 0, 1, 1,
0.5068309, -0.58964, 4.688856, 0.1215686, 0, 1, 1,
0.5160564, -2.715979, 3.554282, 0.1294118, 0, 1, 1,
0.5170889, -2.283883, 3.703943, 0.1333333, 0, 1, 1,
0.5193686, -0.3334078, 2.129114, 0.1411765, 0, 1, 1,
0.5197343, 1.548651, 0.937738, 0.145098, 0, 1, 1,
0.5220099, 0.2270777, 1.605624, 0.1529412, 0, 1, 1,
0.5230272, 0.07249936, 1.602289, 0.1568628, 0, 1, 1,
0.5259298, 0.9782, 1.326555, 0.1647059, 0, 1, 1,
0.5265594, -0.857334, 1.815618, 0.1686275, 0, 1, 1,
0.5308306, -0.01899049, 1.091392, 0.1764706, 0, 1, 1,
0.5332494, -1.560926, 2.76959, 0.1803922, 0, 1, 1,
0.5411509, 0.8330444, 0.6447552, 0.1882353, 0, 1, 1,
0.5419779, -0.1880799, 1.335989, 0.1921569, 0, 1, 1,
0.5442371, -0.9449486, 3.662613, 0.2, 0, 1, 1,
0.5474395, -0.5941562, 3.003587, 0.2078431, 0, 1, 1,
0.551766, -1.524517, 3.055775, 0.2117647, 0, 1, 1,
0.5528292, -1.235144, 1.402341, 0.2196078, 0, 1, 1,
0.554755, 0.887848, 0.3129975, 0.2235294, 0, 1, 1,
0.5582862, 0.4958068, 1.430899, 0.2313726, 0, 1, 1,
0.5602253, 1.609708, -0.1639685, 0.2352941, 0, 1, 1,
0.5603176, -0.3067106, 2.264232, 0.2431373, 0, 1, 1,
0.5608716, -0.08862458, -0.09940078, 0.2470588, 0, 1, 1,
0.5622442, -1.308159, 3.442235, 0.254902, 0, 1, 1,
0.5670443, -0.8578079, 3.879702, 0.2588235, 0, 1, 1,
0.5676103, 1.676112, -1.539647, 0.2666667, 0, 1, 1,
0.5689767, -0.2712295, 0.8611307, 0.2705882, 0, 1, 1,
0.5706819, -0.8009887, 2.647204, 0.2784314, 0, 1, 1,
0.5713981, 0.5809731, 1.626217, 0.282353, 0, 1, 1,
0.5741576, 0.6323266, 2.359123, 0.2901961, 0, 1, 1,
0.5765451, 0.3727046, -1.097208, 0.2941177, 0, 1, 1,
0.5774093, 0.2508328, 2.076945, 0.3019608, 0, 1, 1,
0.5778368, -1.49543, 2.204112, 0.3098039, 0, 1, 1,
0.5801103, 0.3444552, -0.1599943, 0.3137255, 0, 1, 1,
0.580992, 1.004842, -0.6912606, 0.3215686, 0, 1, 1,
0.5820517, -0.8295327, 4.62257, 0.3254902, 0, 1, 1,
0.5867248, 0.188355, 0.996704, 0.3333333, 0, 1, 1,
0.5874361, 1.050297, -1.0838, 0.3372549, 0, 1, 1,
0.5921945, 1.487891, 1.228999, 0.345098, 0, 1, 1,
0.5945796, 0.136472, 0.6631699, 0.3490196, 0, 1, 1,
0.5976309, -1.251993, 3.352834, 0.3568628, 0, 1, 1,
0.6022043, 1.174425, 0.8933186, 0.3607843, 0, 1, 1,
0.6046406, -1.384472, 1.897599, 0.3686275, 0, 1, 1,
0.6085235, -1.318293, 1.094141, 0.372549, 0, 1, 1,
0.6100605, -1.123419, 3.673374, 0.3803922, 0, 1, 1,
0.614019, -0.777012, 3.560301, 0.3843137, 0, 1, 1,
0.6159448, -1.72515, 3.111094, 0.3921569, 0, 1, 1,
0.6165277, -0.4641638, 2.377569, 0.3960784, 0, 1, 1,
0.6175455, -0.07003557, 3.417331, 0.4039216, 0, 1, 1,
0.6194328, 0.1873812, 0.5665192, 0.4117647, 0, 1, 1,
0.6209977, 0.6306956, 1.240716, 0.4156863, 0, 1, 1,
0.6223217, 0.02179964, 1.122765, 0.4235294, 0, 1, 1,
0.6271103, 0.9629765, -0.734912, 0.427451, 0, 1, 1,
0.6337842, -0.106125, 2.036194, 0.4352941, 0, 1, 1,
0.6378468, -0.04825255, 0.8982049, 0.4392157, 0, 1, 1,
0.649643, -0.9642553, 4.748832, 0.4470588, 0, 1, 1,
0.6537463, -1.393422, 2.843373, 0.4509804, 0, 1, 1,
0.6541642, 0.2565333, 0.495586, 0.4588235, 0, 1, 1,
0.6589633, 0.1488038, 1.003507, 0.4627451, 0, 1, 1,
0.6604155, -0.001218, 1.076123, 0.4705882, 0, 1, 1,
0.6638353, 0.1189455, 1.970916, 0.4745098, 0, 1, 1,
0.6674122, -0.8056486, 3.784202, 0.4823529, 0, 1, 1,
0.6740099, -0.204228, 0.6631207, 0.4862745, 0, 1, 1,
0.6755645, -1.019544, 0.5364093, 0.4941176, 0, 1, 1,
0.67857, -1.091917, 2.749934, 0.5019608, 0, 1, 1,
0.6848769, -1.050072, 3.228537, 0.5058824, 0, 1, 1,
0.7070462, 0.9136003, 1.143269, 0.5137255, 0, 1, 1,
0.711795, -1.682434, 2.866599, 0.5176471, 0, 1, 1,
0.7197973, -0.9497419, 3.572157, 0.5254902, 0, 1, 1,
0.7229421, 1.240303, 1.51106, 0.5294118, 0, 1, 1,
0.7255039, -0.1083034, -0.9303604, 0.5372549, 0, 1, 1,
0.7260661, 1.255151, 1.478367, 0.5411765, 0, 1, 1,
0.7277226, 1.870069, 1.725349, 0.5490196, 0, 1, 1,
0.7323364, -0.5889265, -0.2327943, 0.5529412, 0, 1, 1,
0.7378961, -0.2628954, 0.9757562, 0.5607843, 0, 1, 1,
0.7399778, 0.3535199, 2.262738, 0.5647059, 0, 1, 1,
0.7407637, -0.9164961, 1.319161, 0.572549, 0, 1, 1,
0.7447333, -0.242821, 4.097633, 0.5764706, 0, 1, 1,
0.7485207, -1.276654, 1.97028, 0.5843138, 0, 1, 1,
0.7502946, 0.9738998, 1.791816, 0.5882353, 0, 1, 1,
0.7510028, 1.032669, 0.6900311, 0.5960785, 0, 1, 1,
0.756005, 0.001132361, 3.228332, 0.6039216, 0, 1, 1,
0.7560984, -2.111895, 3.528503, 0.6078432, 0, 1, 1,
0.7580456, -0.6778719, 2.554448, 0.6156863, 0, 1, 1,
0.7587028, 0.4620084, 1.602909, 0.6196079, 0, 1, 1,
0.7633576, -0.07333276, 1.332039, 0.627451, 0, 1, 1,
0.7657263, 0.9047656, -0.2702367, 0.6313726, 0, 1, 1,
0.7696396, -1.96149, 3.030496, 0.6392157, 0, 1, 1,
0.7771244, -0.4777863, 3.605615, 0.6431373, 0, 1, 1,
0.7788535, 0.8555419, 1.605133, 0.6509804, 0, 1, 1,
0.7808684, -0.3013639, 0.6322354, 0.654902, 0, 1, 1,
0.7856227, -0.04778639, 2.226198, 0.6627451, 0, 1, 1,
0.791111, -0.4744725, -0.3367158, 0.6666667, 0, 1, 1,
0.798072, -0.1370865, 1.870356, 0.6745098, 0, 1, 1,
0.8001266, -1.798709, 3.403616, 0.6784314, 0, 1, 1,
0.8039587, 0.5979816, 1.524009, 0.6862745, 0, 1, 1,
0.8040587, 0.2071804, 0.2378483, 0.6901961, 0, 1, 1,
0.8054537, 0.244728, 1.082118, 0.6980392, 0, 1, 1,
0.8087067, -0.6830066, 2.618993, 0.7058824, 0, 1, 1,
0.8113909, -2.127028, 3.831461, 0.7098039, 0, 1, 1,
0.8136219, 0.1044579, 2.438903, 0.7176471, 0, 1, 1,
0.8215162, -0.5534949, 4.352777, 0.7215686, 0, 1, 1,
0.8305944, 1.247131, 0.7781633, 0.7294118, 0, 1, 1,
0.8353122, 0.1857401, 2.000077, 0.7333333, 0, 1, 1,
0.8424374, -0.543386, 1.99361, 0.7411765, 0, 1, 1,
0.8440018, -0.0750904, -0.132388, 0.7450981, 0, 1, 1,
0.8461685, -1.344152, 3.61205, 0.7529412, 0, 1, 1,
0.8518142, -0.7492027, 3.098953, 0.7568628, 0, 1, 1,
0.854766, -0.7752823, 0.5390341, 0.7647059, 0, 1, 1,
0.8549231, -0.5288192, 2.652119, 0.7686275, 0, 1, 1,
0.8626997, 2.411795, -0.8217977, 0.7764706, 0, 1, 1,
0.865503, 1.492626, 1.452545, 0.7803922, 0, 1, 1,
0.8713037, -0.1753725, 1.415385, 0.7882353, 0, 1, 1,
0.8773487, 0.2069644, 2.21445, 0.7921569, 0, 1, 1,
0.8869724, 0.8327097, -1.125522, 0.8, 0, 1, 1,
0.8909013, 1.052234, -1.531255, 0.8078431, 0, 1, 1,
0.8926549, 0.8964626, 1.73552, 0.8117647, 0, 1, 1,
0.8974809, -0.4768909, 1.493113, 0.8196079, 0, 1, 1,
0.9030252, 0.6944879, 0.2468491, 0.8235294, 0, 1, 1,
0.9097145, -1.43914, 2.483618, 0.8313726, 0, 1, 1,
0.9108035, -0.02322329, 0.579109, 0.8352941, 0, 1, 1,
0.9118611, 0.3227028, 1.10449, 0.8431373, 0, 1, 1,
0.9180263, -1.054334, 1.971288, 0.8470588, 0, 1, 1,
0.9233801, -0.9532946, 3.705344, 0.854902, 0, 1, 1,
0.9290827, -0.2456738, 1.765292, 0.8588235, 0, 1, 1,
0.9333165, 0.4244083, 0.6307427, 0.8666667, 0, 1, 1,
0.93774, 0.223875, -1.164477, 0.8705882, 0, 1, 1,
0.9417098, -0.9928102, 1.86929, 0.8784314, 0, 1, 1,
0.9425018, -0.02385946, 0.5445163, 0.8823529, 0, 1, 1,
0.9435846, 0.5239013, 2.107467, 0.8901961, 0, 1, 1,
0.9447123, 0.6598979, 1.609686, 0.8941177, 0, 1, 1,
0.9452885, 0.9478636, 1.317374, 0.9019608, 0, 1, 1,
0.9480958, -0.8563197, 3.940695, 0.9098039, 0, 1, 1,
0.9491415, 1.337156, 0.4050454, 0.9137255, 0, 1, 1,
0.9518973, 0.4959419, 1.669265, 0.9215686, 0, 1, 1,
0.9525877, 0.5131407, 0.8815542, 0.9254902, 0, 1, 1,
0.9618742, 0.6877186, 1.019835, 0.9333333, 0, 1, 1,
0.9636205, 1.360879, 1.55713, 0.9372549, 0, 1, 1,
0.9645081, -0.2193751, 2.752921, 0.945098, 0, 1, 1,
0.9751879, -1.700218, 2.677155, 0.9490196, 0, 1, 1,
0.9764278, 1.374576, -0.5853381, 0.9568627, 0, 1, 1,
0.9851682, -0.2603052, 1.071171, 0.9607843, 0, 1, 1,
0.9868556, -0.4710539, 2.100223, 0.9686275, 0, 1, 1,
0.9874688, -1.257236, 2.38628, 0.972549, 0, 1, 1,
0.9895934, -0.1227253, 0.3010447, 0.9803922, 0, 1, 1,
0.9912809, -0.2158403, 0.8665244, 0.9843137, 0, 1, 1,
0.9938069, 0.3963337, 1.729804, 0.9921569, 0, 1, 1,
0.9956167, -1.180213, 3.17237, 0.9960784, 0, 1, 1,
0.9986975, -1.641566, -1.239268, 1, 0, 0.9960784, 1,
1.00335, -0.5499349, 3.696523, 1, 0, 0.9882353, 1,
1.005261, 1.943393, -0.4353602, 1, 0, 0.9843137, 1,
1.010857, -1.207914, 3.227628, 1, 0, 0.9764706, 1,
1.019157, -0.4002199, 1.654899, 1, 0, 0.972549, 1,
1.020758, -0.02100758, 0.7620757, 1, 0, 0.9647059, 1,
1.024029, -1.088894, 3.353313, 1, 0, 0.9607843, 1,
1.025128, -0.4167312, 2.587817, 1, 0, 0.9529412, 1,
1.025631, -1.154583, 3.396311, 1, 0, 0.9490196, 1,
1.028212, -0.428489, 2.087323, 1, 0, 0.9411765, 1,
1.033713, -1.03981, 2.318487, 1, 0, 0.9372549, 1,
1.037944, 2.422455, 1.318326, 1, 0, 0.9294118, 1,
1.040768, 0.1562781, 1.656096, 1, 0, 0.9254902, 1,
1.042765, -2.044586, 3.62656, 1, 0, 0.9176471, 1,
1.05184, 0.02632384, 1.510762, 1, 0, 0.9137255, 1,
1.055076, -0.05239445, 1.865626, 1, 0, 0.9058824, 1,
1.056847, -0.5049741, 1.230721, 1, 0, 0.9019608, 1,
1.057725, -0.6067653, 1.712915, 1, 0, 0.8941177, 1,
1.059817, 0.366321, 0.004229614, 1, 0, 0.8862745, 1,
1.064386, -1.196667, 2.814404, 1, 0, 0.8823529, 1,
1.069125, -0.2324897, 1.393223, 1, 0, 0.8745098, 1,
1.069692, -0.6970353, 2.68159, 1, 0, 0.8705882, 1,
1.071314, -0.4110789, 2.249331, 1, 0, 0.8627451, 1,
1.073943, -0.175928, 2.698066, 1, 0, 0.8588235, 1,
1.082623, -0.8884329, 4.067681, 1, 0, 0.8509804, 1,
1.097701, 0.1354785, 0.383691, 1, 0, 0.8470588, 1,
1.114005, -2.04325, 2.679021, 1, 0, 0.8392157, 1,
1.114712, 0.1690201, 1.978939, 1, 0, 0.8352941, 1,
1.116373, 0.7916903, -0.2271378, 1, 0, 0.827451, 1,
1.128888, -0.6268014, 3.434318, 1, 0, 0.8235294, 1,
1.130923, -0.7395055, 2.117324, 1, 0, 0.8156863, 1,
1.139374, 0.03309537, 1.491742, 1, 0, 0.8117647, 1,
1.151064, -0.9143714, 0.1609438, 1, 0, 0.8039216, 1,
1.153078, 0.4111381, 2.950059, 1, 0, 0.7960784, 1,
1.155022, 1.188316, 2.230639, 1, 0, 0.7921569, 1,
1.155834, 0.7988446, 0.8384306, 1, 0, 0.7843137, 1,
1.155948, 1.186254, 1.327427, 1, 0, 0.7803922, 1,
1.156085, 1.023515, 1.369591, 1, 0, 0.772549, 1,
1.158518, 1.587034, 2.754242, 1, 0, 0.7686275, 1,
1.165017, 0.5188696, 3.101992, 1, 0, 0.7607843, 1,
1.166066, 0.4740479, 1.47452, 1, 0, 0.7568628, 1,
1.168776, 1.566123, 1.695957, 1, 0, 0.7490196, 1,
1.170686, 0.4006751, 0.9962439, 1, 0, 0.7450981, 1,
1.17179, -0.1417676, 1.899921, 1, 0, 0.7372549, 1,
1.181459, 0.008537963, 1.350031, 1, 0, 0.7333333, 1,
1.181955, -1.917426, 2.618045, 1, 0, 0.7254902, 1,
1.18436, -0.01203193, 0.7743915, 1, 0, 0.7215686, 1,
1.186636, 1.047208, 2.186868, 1, 0, 0.7137255, 1,
1.189085, -0.9443367, 3.15645, 1, 0, 0.7098039, 1,
1.202243, 1.183436, 0.2882074, 1, 0, 0.7019608, 1,
1.210263, -1.809136, 3.000637, 1, 0, 0.6941177, 1,
1.210825, -1.297474, 0.9032954, 1, 0, 0.6901961, 1,
1.21498, 0.1042035, -1.091743, 1, 0, 0.682353, 1,
1.22079, 0.590113, 1.604524, 1, 0, 0.6784314, 1,
1.224244, 1.177193, 0.8676668, 1, 0, 0.6705883, 1,
1.22844, 0.9598387, -0.1332284, 1, 0, 0.6666667, 1,
1.231743, -0.5162225, 2.234297, 1, 0, 0.6588235, 1,
1.23526, 1.502168, -0.2578259, 1, 0, 0.654902, 1,
1.23782, 0.05301659, -0.5184256, 1, 0, 0.6470588, 1,
1.238337, 1.015713, -0.4256894, 1, 0, 0.6431373, 1,
1.239731, -0.4984657, 1.984125, 1, 0, 0.6352941, 1,
1.249102, -0.4098883, 3.615797, 1, 0, 0.6313726, 1,
1.250715, 0.5813648, 2.466408, 1, 0, 0.6235294, 1,
1.252999, 1.431309, -0.3908737, 1, 0, 0.6196079, 1,
1.257342, 0.7335631, 0.05946317, 1, 0, 0.6117647, 1,
1.262688, 1.28283, 1.487739, 1, 0, 0.6078432, 1,
1.268521, -2.379628, 4.925116, 1, 0, 0.6, 1,
1.287731, -0.1289412, 1.593271, 1, 0, 0.5921569, 1,
1.301917, 0.8906333, 1.919572, 1, 0, 0.5882353, 1,
1.310858, 0.1265666, 1.124439, 1, 0, 0.5803922, 1,
1.314093, 2.297611, -0.8653257, 1, 0, 0.5764706, 1,
1.323671, 0.5608926, -0.2388816, 1, 0, 0.5686275, 1,
1.33229, 0.8627213, -0.809695, 1, 0, 0.5647059, 1,
1.335396, -0.1648461, 2.354332, 1, 0, 0.5568628, 1,
1.337668, -0.1001303, 1.089723, 1, 0, 0.5529412, 1,
1.3388, -0.6383439, 0.4105294, 1, 0, 0.5450981, 1,
1.34349, -0.3353861, 0.519324, 1, 0, 0.5411765, 1,
1.343936, -1.357259, 3.589887, 1, 0, 0.5333334, 1,
1.344114, 1.621724, 0.9437997, 1, 0, 0.5294118, 1,
1.348219, 1.476214, 1.515511, 1, 0, 0.5215687, 1,
1.358345, -1.522064, 2.134792, 1, 0, 0.5176471, 1,
1.3654, -0.1640558, -0.1408258, 1, 0, 0.509804, 1,
1.370079, 0.4534325, 0.9781179, 1, 0, 0.5058824, 1,
1.374171, 1.747756, -0.4960051, 1, 0, 0.4980392, 1,
1.398902, 0.2611749, 1.450524, 1, 0, 0.4901961, 1,
1.400666, 0.160139, 1.373875, 1, 0, 0.4862745, 1,
1.40437, 0.7579339, 0.3652759, 1, 0, 0.4784314, 1,
1.406587, -0.09875956, 1.526285, 1, 0, 0.4745098, 1,
1.462683, 1.033052, -0.1994816, 1, 0, 0.4666667, 1,
1.464661, 0.8574628, 0.4870662, 1, 0, 0.4627451, 1,
1.47645, 0.8278379, 0.1685742, 1, 0, 0.454902, 1,
1.477138, -0.5876023, 2.801523, 1, 0, 0.4509804, 1,
1.493923, 0.2462092, 1.473802, 1, 0, 0.4431373, 1,
1.500727, -0.3659693, 2.685001, 1, 0, 0.4392157, 1,
1.519191, 1.580317, 1.653609, 1, 0, 0.4313726, 1,
1.527227, 0.7554902, 0.9692048, 1, 0, 0.427451, 1,
1.541094, 0.01275171, 1.042352, 1, 0, 0.4196078, 1,
1.543007, 1.315287, 0.5785102, 1, 0, 0.4156863, 1,
1.543588, -1.148028, 2.897848, 1, 0, 0.4078431, 1,
1.547609, 0.7529092, -1.21757, 1, 0, 0.4039216, 1,
1.563479, 2.869113, 1.337716, 1, 0, 0.3960784, 1,
1.582802, -0.4782144, 2.954615, 1, 0, 0.3882353, 1,
1.58796, -0.07958849, 2.84228, 1, 0, 0.3843137, 1,
1.592847, -1.969249, 2.457242, 1, 0, 0.3764706, 1,
1.602285, -1.224934, 1.029738, 1, 0, 0.372549, 1,
1.615693, 2.027013, 1.250899, 1, 0, 0.3647059, 1,
1.617726, 1.089999, 1.730635, 1, 0, 0.3607843, 1,
1.632739, -0.8305233, 2.500993, 1, 0, 0.3529412, 1,
1.639773, -0.9311588, 3.529063, 1, 0, 0.3490196, 1,
1.649684, -0.2115544, 0.2973891, 1, 0, 0.3411765, 1,
1.650781, -0.05766144, 1.855785, 1, 0, 0.3372549, 1,
1.661016, 0.5520301, 0.8758197, 1, 0, 0.3294118, 1,
1.67238, 0.5181376, 0.5652859, 1, 0, 0.3254902, 1,
1.673634, -0.4708647, 2.910659, 1, 0, 0.3176471, 1,
1.687484, -0.2021058, 2.27851, 1, 0, 0.3137255, 1,
1.691197, 0.3164701, 2.691028, 1, 0, 0.3058824, 1,
1.702216, 0.8688172, 2.360504, 1, 0, 0.2980392, 1,
1.732571, 0.1754008, 0.8639567, 1, 0, 0.2941177, 1,
1.736251, 0.9544311, 1.71869, 1, 0, 0.2862745, 1,
1.76283, -1.029364, 2.000715, 1, 0, 0.282353, 1,
1.782968, 2.855877, 1.309759, 1, 0, 0.2745098, 1,
1.787863, 0.5161384, -0.7749576, 1, 0, 0.2705882, 1,
1.815545, -0.6270354, 1.493921, 1, 0, 0.2627451, 1,
1.816808, -1.070267, 1.634382, 1, 0, 0.2588235, 1,
1.819225, 0.9746352, 0.0307324, 1, 0, 0.2509804, 1,
1.847949, 0.5548902, 1.697901, 1, 0, 0.2470588, 1,
1.856174, -0.1925521, 1.876909, 1, 0, 0.2392157, 1,
1.856639, 1.855543, 0.9597889, 1, 0, 0.2352941, 1,
1.872879, -0.08851214, 1.372904, 1, 0, 0.227451, 1,
1.877115, -0.7264532, 2.763211, 1, 0, 0.2235294, 1,
1.880583, 1.651686, 0.5715261, 1, 0, 0.2156863, 1,
1.887099, 0.1249098, 0.7729291, 1, 0, 0.2117647, 1,
1.898222, 1.910076, 0.9439008, 1, 0, 0.2039216, 1,
1.936274, -1.720828, 2.05248, 1, 0, 0.1960784, 1,
1.952073, -1.671622, 2.484516, 1, 0, 0.1921569, 1,
1.961025, 0.9884776, 1.747353, 1, 0, 0.1843137, 1,
1.98677, 1.377613, 2.902103, 1, 0, 0.1803922, 1,
1.999891, 0.1282334, 1.496608, 1, 0, 0.172549, 1,
2.011362, 1.682936, 1.264373, 1, 0, 0.1686275, 1,
2.019692, 1.149336, 2.056297, 1, 0, 0.1607843, 1,
2.038323, 1.111422, 2.59217, 1, 0, 0.1568628, 1,
2.057808, 1.489501, 0.2258168, 1, 0, 0.1490196, 1,
2.063315, 0.1618409, 2.520356, 1, 0, 0.145098, 1,
2.066596, 0.5859469, 1.106397, 1, 0, 0.1372549, 1,
2.066993, -2.405977, 3.185717, 1, 0, 0.1333333, 1,
2.067089, -0.2682684, 1.023021, 1, 0, 0.1254902, 1,
2.082211, -1.750707, 2.773563, 1, 0, 0.1215686, 1,
2.114479, -0.6590656, 1.110606, 1, 0, 0.1137255, 1,
2.138885, -1.17653, 1.926987, 1, 0, 0.1098039, 1,
2.13917, -0.4563672, 1.107669, 1, 0, 0.1019608, 1,
2.172903, -0.6675061, 4.201864, 1, 0, 0.09411765, 1,
2.217399, 0.2763293, 0.5963814, 1, 0, 0.09019608, 1,
2.24134, -1.770264, 1.900512, 1, 0, 0.08235294, 1,
2.27908, -0.4598324, 1.404793, 1, 0, 0.07843138, 1,
2.330593, -0.1867213, 0.4800255, 1, 0, 0.07058824, 1,
2.342612, 0.4718871, 2.715268, 1, 0, 0.06666667, 1,
2.347727, -0.5031548, 2.648148, 1, 0, 0.05882353, 1,
2.356847, 1.361062, 0.449503, 1, 0, 0.05490196, 1,
2.427656, -0.2868797, 2.615317, 1, 0, 0.04705882, 1,
2.465812, 0.4302084, 0.7230777, 1, 0, 0.04313726, 1,
2.491504, 0.4777437, 3.064979, 1, 0, 0.03529412, 1,
2.494127, -1.040396, 2.589872, 1, 0, 0.03137255, 1,
2.517368, 0.3507203, 0.07535813, 1, 0, 0.02352941, 1,
2.529224, -1.788922, 0.5395371, 1, 0, 0.01960784, 1,
3.070136, -0.7471597, 2.115484, 1, 0, 0.01176471, 1,
3.562599, -0.1769436, 2.898171, 1, 0, 0.007843138, 1
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
-0.0788908, -3.900271, -7.64242, 0, -0.5, 0.5, 0.5,
-0.0788908, -3.900271, -7.64242, 1, -0.5, 0.5, 0.5,
-0.0788908, -3.900271, -7.64242, 1, 1.5, 0.5, 0.5,
-0.0788908, -3.900271, -7.64242, 0, 1.5, 0.5, 0.5
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
-4.954845, 0.09760678, -7.64242, 0, -0.5, 0.5, 0.5,
-4.954845, 0.09760678, -7.64242, 1, -0.5, 0.5, 0.5,
-4.954845, 0.09760678, -7.64242, 1, 1.5, 0.5, 0.5,
-4.954845, 0.09760678, -7.64242, 0, 1.5, 0.5, 0.5
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
-4.954845, -3.900271, -0.2793016, 0, -0.5, 0.5, 0.5,
-4.954845, -3.900271, -0.2793016, 1, -0.5, 0.5, 0.5,
-4.954845, -3.900271, -0.2793016, 1, 1.5, 0.5, 0.5,
-4.954845, -3.900271, -0.2793016, 0, 1.5, 0.5, 0.5
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
-2, -2.977684, -5.943239,
2, -2.977684, -5.943239,
-2, -2.977684, -5.943239,
-2, -3.131449, -6.226436,
0, -2.977684, -5.943239,
0, -3.131449, -6.226436,
2, -2.977684, -5.943239,
2, -3.131449, -6.226436
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
-2, -3.438977, -6.79283, 0, -0.5, 0.5, 0.5,
-2, -3.438977, -6.79283, 1, -0.5, 0.5, 0.5,
-2, -3.438977, -6.79283, 1, 1.5, 0.5, 0.5,
-2, -3.438977, -6.79283, 0, 1.5, 0.5, 0.5,
0, -3.438977, -6.79283, 0, -0.5, 0.5, 0.5,
0, -3.438977, -6.79283, 1, -0.5, 0.5, 0.5,
0, -3.438977, -6.79283, 1, 1.5, 0.5, 0.5,
0, -3.438977, -6.79283, 0, 1.5, 0.5, 0.5,
2, -3.438977, -6.79283, 0, -0.5, 0.5, 0.5,
2, -3.438977, -6.79283, 1, -0.5, 0.5, 0.5,
2, -3.438977, -6.79283, 1, 1.5, 0.5, 0.5,
2, -3.438977, -6.79283, 0, 1.5, 0.5, 0.5
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
-3.829625, -2, -5.943239,
-3.829625, 3, -5.943239,
-3.829625, -2, -5.943239,
-4.017162, -2, -6.226436,
-3.829625, -1, -5.943239,
-4.017162, -1, -6.226436,
-3.829625, 0, -5.943239,
-4.017162, 0, -6.226436,
-3.829625, 1, -5.943239,
-4.017162, 1, -6.226436,
-3.829625, 2, -5.943239,
-4.017162, 2, -6.226436,
-3.829625, 3, -5.943239,
-4.017162, 3, -6.226436
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
-4.392235, -2, -6.79283, 0, -0.5, 0.5, 0.5,
-4.392235, -2, -6.79283, 1, -0.5, 0.5, 0.5,
-4.392235, -2, -6.79283, 1, 1.5, 0.5, 0.5,
-4.392235, -2, -6.79283, 0, 1.5, 0.5, 0.5,
-4.392235, -1, -6.79283, 0, -0.5, 0.5, 0.5,
-4.392235, -1, -6.79283, 1, -0.5, 0.5, 0.5,
-4.392235, -1, -6.79283, 1, 1.5, 0.5, 0.5,
-4.392235, -1, -6.79283, 0, 1.5, 0.5, 0.5,
-4.392235, 0, -6.79283, 0, -0.5, 0.5, 0.5,
-4.392235, 0, -6.79283, 1, -0.5, 0.5, 0.5,
-4.392235, 0, -6.79283, 1, 1.5, 0.5, 0.5,
-4.392235, 0, -6.79283, 0, 1.5, 0.5, 0.5,
-4.392235, 1, -6.79283, 0, -0.5, 0.5, 0.5,
-4.392235, 1, -6.79283, 1, -0.5, 0.5, 0.5,
-4.392235, 1, -6.79283, 1, 1.5, 0.5, 0.5,
-4.392235, 1, -6.79283, 0, 1.5, 0.5, 0.5,
-4.392235, 2, -6.79283, 0, -0.5, 0.5, 0.5,
-4.392235, 2, -6.79283, 1, -0.5, 0.5, 0.5,
-4.392235, 2, -6.79283, 1, 1.5, 0.5, 0.5,
-4.392235, 2, -6.79283, 0, 1.5, 0.5, 0.5,
-4.392235, 3, -6.79283, 0, -0.5, 0.5, 0.5,
-4.392235, 3, -6.79283, 1, -0.5, 0.5, 0.5,
-4.392235, 3, -6.79283, 1, 1.5, 0.5, 0.5,
-4.392235, 3, -6.79283, 0, 1.5, 0.5, 0.5
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
-3.829625, -2.977684, -4,
-3.829625, -2.977684, 4,
-3.829625, -2.977684, -4,
-4.017162, -3.131449, -4,
-3.829625, -2.977684, -2,
-4.017162, -3.131449, -2,
-3.829625, -2.977684, 0,
-4.017162, -3.131449, 0,
-3.829625, -2.977684, 2,
-4.017162, -3.131449, 2,
-3.829625, -2.977684, 4,
-4.017162, -3.131449, 4
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
-4.392235, -3.438977, -4, 0, -0.5, 0.5, 0.5,
-4.392235, -3.438977, -4, 1, -0.5, 0.5, 0.5,
-4.392235, -3.438977, -4, 1, 1.5, 0.5, 0.5,
-4.392235, -3.438977, -4, 0, 1.5, 0.5, 0.5,
-4.392235, -3.438977, -2, 0, -0.5, 0.5, 0.5,
-4.392235, -3.438977, -2, 1, -0.5, 0.5, 0.5,
-4.392235, -3.438977, -2, 1, 1.5, 0.5, 0.5,
-4.392235, -3.438977, -2, 0, 1.5, 0.5, 0.5,
-4.392235, -3.438977, 0, 0, -0.5, 0.5, 0.5,
-4.392235, -3.438977, 0, 1, -0.5, 0.5, 0.5,
-4.392235, -3.438977, 0, 1, 1.5, 0.5, 0.5,
-4.392235, -3.438977, 0, 0, 1.5, 0.5, 0.5,
-4.392235, -3.438977, 2, 0, -0.5, 0.5, 0.5,
-4.392235, -3.438977, 2, 1, -0.5, 0.5, 0.5,
-4.392235, -3.438977, 2, 1, 1.5, 0.5, 0.5,
-4.392235, -3.438977, 2, 0, 1.5, 0.5, 0.5,
-4.392235, -3.438977, 4, 0, -0.5, 0.5, 0.5,
-4.392235, -3.438977, 4, 1, -0.5, 0.5, 0.5,
-4.392235, -3.438977, 4, 1, 1.5, 0.5, 0.5,
-4.392235, -3.438977, 4, 0, 1.5, 0.5, 0.5
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
-3.829625, -2.977684, -5.943239,
-3.829625, 3.172897, -5.943239,
-3.829625, -2.977684, 5.384635,
-3.829625, 3.172897, 5.384635,
-3.829625, -2.977684, -5.943239,
-3.829625, -2.977684, 5.384635,
-3.829625, 3.172897, -5.943239,
-3.829625, 3.172897, 5.384635,
-3.829625, -2.977684, -5.943239,
3.671843, -2.977684, -5.943239,
-3.829625, -2.977684, 5.384635,
3.671843, -2.977684, 5.384635,
-3.829625, 3.172897, -5.943239,
3.671843, 3.172897, -5.943239,
-3.829625, 3.172897, 5.384635,
3.671843, 3.172897, 5.384635,
3.671843, -2.977684, -5.943239,
3.671843, 3.172897, -5.943239,
3.671843, -2.977684, 5.384635,
3.671843, 3.172897, 5.384635,
3.671843, -2.977684, -5.943239,
3.671843, -2.977684, 5.384635,
3.671843, 3.172897, -5.943239,
3.671843, 3.172897, 5.384635
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
var radius = 7.963697;
var distance = 35.43139;
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
mvMatrix.translate( 0.0788908, -0.09760678, 0.2793016 );
mvMatrix.scale( 1.147843, 1.39995, 0.7601166 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.43139);
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
hydroxyhippuric_acid<-read.table("hydroxyhippuric_acid.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-hydroxyhippuric_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'hydroxyhippuric_acid' not found
```

```r
y<-hydroxyhippuric_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'hydroxyhippuric_acid' not found
```

```r
z<-hydroxyhippuric_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'hydroxyhippuric_acid' not found
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
-3.72038, 0.348661, -1.945927, 0, 0, 1, 1, 1,
-2.691381, -0.5589252, -2.247988, 1, 0, 0, 1, 1,
-2.535515, -0.1844485, -3.775336, 1, 0, 0, 1, 1,
-2.515684, 1.20529, -0.8479691, 1, 0, 0, 1, 1,
-2.514878, -0.5524756, -2.126212, 1, 0, 0, 1, 1,
-2.459627, -0.6512366, -1.281895, 1, 0, 0, 1, 1,
-2.427925, 1.0288, -0.2048119, 0, 0, 0, 1, 1,
-2.387766, -0.925721, -2.138863, 0, 0, 0, 1, 1,
-2.350516, -0.7899613, -1.677391, 0, 0, 0, 1, 1,
-2.319947, 0.3319041, -1.346973, 0, 0, 0, 1, 1,
-2.319168, -0.8783829, -1.020083, 0, 0, 0, 1, 1,
-2.279191, 0.9928544, -2.138746, 0, 0, 0, 1, 1,
-2.262969, 0.2087418, -2.122844, 0, 0, 0, 1, 1,
-2.20758, 0.9385912, -0.2943425, 1, 1, 1, 1, 1,
-2.18384, 1.568234, -0.8119872, 1, 1, 1, 1, 1,
-2.180192, 0.3579653, -0.2031935, 1, 1, 1, 1, 1,
-2.14374, -0.1222194, -2.193121, 1, 1, 1, 1, 1,
-2.138288, 0.03567391, -4.059712, 1, 1, 1, 1, 1,
-2.115818, 0.990572, -1.070824, 1, 1, 1, 1, 1,
-2.083958, -0.1195355, -1.038614, 1, 1, 1, 1, 1,
-2.076037, 0.8692326, -1.36283, 1, 1, 1, 1, 1,
-2.071712, 0.9763052, -2.31025, 1, 1, 1, 1, 1,
-2.036395, -0.8610032, -1.786782, 1, 1, 1, 1, 1,
-2.02001, 1.144464, -0.2044288, 1, 1, 1, 1, 1,
-2.014034, -1.262582, -1.637521, 1, 1, 1, 1, 1,
-1.999367, 0.3125771, -0.9136534, 1, 1, 1, 1, 1,
-1.979251, 1.116701, -1.762836, 1, 1, 1, 1, 1,
-1.975728, -1.183172, -3.215664, 1, 1, 1, 1, 1,
-1.951585, -0.5018904, -1.826335, 0, 0, 1, 1, 1,
-1.884492, 1.077421, 0.4598303, 1, 0, 0, 1, 1,
-1.884174, 1.385011, -0.9999728, 1, 0, 0, 1, 1,
-1.834981, -0.08626335, -1.96184, 1, 0, 0, 1, 1,
-1.827863, 0.6198407, -2.762319, 1, 0, 0, 1, 1,
-1.825746, -0.7046797, -1.655976, 1, 0, 0, 1, 1,
-1.82067, -0.5931038, -2.722286, 0, 0, 0, 1, 1,
-1.813294, -1.375769, -2.731226, 0, 0, 0, 1, 1,
-1.80835, -0.1433471, -1.546284, 0, 0, 0, 1, 1,
-1.782258, 0.05219334, -1.528511, 0, 0, 0, 1, 1,
-1.777073, -1.167825, -2.61899, 0, 0, 0, 1, 1,
-1.776665, -1.102048, -1.665533, 0, 0, 0, 1, 1,
-1.774508, -0.9968933, -2.411713, 0, 0, 0, 1, 1,
-1.771243, -0.04446538, -1.524109, 1, 1, 1, 1, 1,
-1.759506, 0.6485656, -0.940116, 1, 1, 1, 1, 1,
-1.743583, 0.9787024, 0.148642, 1, 1, 1, 1, 1,
-1.740783, 1.075423, -0.05513496, 1, 1, 1, 1, 1,
-1.732998, 0.5654235, -3.043858, 1, 1, 1, 1, 1,
-1.704458, -1.480655, -1.705349, 1, 1, 1, 1, 1,
-1.695266, 0.1001856, 1.727331, 1, 1, 1, 1, 1,
-1.694105, -0.6764004, -2.016554, 1, 1, 1, 1, 1,
-1.677944, 1.165411, -1.576066, 1, 1, 1, 1, 1,
-1.668192, 1.160241, -1.602083, 1, 1, 1, 1, 1,
-1.667581, -0.3674984, -0.05024867, 1, 1, 1, 1, 1,
-1.649113, 0.9569378, -0.8388358, 1, 1, 1, 1, 1,
-1.637593, 0.375902, -0.18147, 1, 1, 1, 1, 1,
-1.637248, -0.7222345, -2.910926, 1, 1, 1, 1, 1,
-1.616168, -0.7339294, -2.481614, 1, 1, 1, 1, 1,
-1.611979, 1.645885, -0.768186, 0, 0, 1, 1, 1,
-1.600949, -1.173985, -3.461477, 1, 0, 0, 1, 1,
-1.571282, 0.3972352, -0.2223603, 1, 0, 0, 1, 1,
-1.562238, 0.08385335, -2.207897, 1, 0, 0, 1, 1,
-1.56163, 0.4660026, -1.22903, 1, 0, 0, 1, 1,
-1.56138, 1.354078, -2.071127, 1, 0, 0, 1, 1,
-1.554674, 1.410956, -0.4607039, 0, 0, 0, 1, 1,
-1.528791, 0.3793185, -2.127095, 0, 0, 0, 1, 1,
-1.525027, -2.013965, -2.3008, 0, 0, 0, 1, 1,
-1.521734, -0.01483997, -2.394119, 0, 0, 0, 1, 1,
-1.514327, -0.3698068, -1.252166, 0, 0, 0, 1, 1,
-1.514304, -1.785845, -2.599565, 0, 0, 0, 1, 1,
-1.513119, -1.441731, -0.5661554, 0, 0, 0, 1, 1,
-1.512663, -2.053855, -2.367148, 1, 1, 1, 1, 1,
-1.506153, -0.1211664, 0.0157259, 1, 1, 1, 1, 1,
-1.503339, -0.5056571, -3.563737, 1, 1, 1, 1, 1,
-1.490104, -1.041453, -2.226842, 1, 1, 1, 1, 1,
-1.489649, 0.5177063, -2.300088, 1, 1, 1, 1, 1,
-1.471681, -0.5558177, -0.3812656, 1, 1, 1, 1, 1,
-1.466489, -0.4426998, -1.97587, 1, 1, 1, 1, 1,
-1.466354, 0.8898323, 0.986192, 1, 1, 1, 1, 1,
-1.462348, 1.257578, -2.3144, 1, 1, 1, 1, 1,
-1.46077, -1.86486, -2.111157, 1, 1, 1, 1, 1,
-1.459442, -1.339304, -0.6729254, 1, 1, 1, 1, 1,
-1.447662, 0.6304101, -2.864967, 1, 1, 1, 1, 1,
-1.439247, 0.4037293, -1.423554, 1, 1, 1, 1, 1,
-1.429322, 2.245102, -0.4675604, 1, 1, 1, 1, 1,
-1.42539, 1.227873, -1.241069, 1, 1, 1, 1, 1,
-1.412244, -0.6047332, -4.523818, 0, 0, 1, 1, 1,
-1.411537, -0.9174189, -3.146127, 1, 0, 0, 1, 1,
-1.405288, 2.205889, -1.937361, 1, 0, 0, 1, 1,
-1.38396, 0.3036731, -1.376261, 1, 0, 0, 1, 1,
-1.380935, 0.2273972, -1.532118, 1, 0, 0, 1, 1,
-1.380251, -1.308226, -1.493032, 1, 0, 0, 1, 1,
-1.378592, -0.7344501, -2.842753, 0, 0, 0, 1, 1,
-1.377769, -0.5965649, -0.05710592, 0, 0, 0, 1, 1,
-1.35648, 1.436698, -0.4302498, 0, 0, 0, 1, 1,
-1.355399, -1.03508, -2.771993, 0, 0, 0, 1, 1,
-1.350607, 0.2438416, -2.72582, 0, 0, 0, 1, 1,
-1.348929, 1.090445, -2.530522, 0, 0, 0, 1, 1,
-1.341476, 0.1726059, 0.6043412, 0, 0, 0, 1, 1,
-1.339272, -0.815287, -1.67617, 1, 1, 1, 1, 1,
-1.338522, 1.325428, -0.2584247, 1, 1, 1, 1, 1,
-1.336596, -0.5724795, -2.532089, 1, 1, 1, 1, 1,
-1.336178, -1.313653, -0.8608028, 1, 1, 1, 1, 1,
-1.335886, -0.9890381, -2.315266, 1, 1, 1, 1, 1,
-1.331993, -0.6454695, -3.058116, 1, 1, 1, 1, 1,
-1.323842, 0.4672418, -1.562964, 1, 1, 1, 1, 1,
-1.32345, -0.2171777, -2.839885, 1, 1, 1, 1, 1,
-1.32246, 1.891737, -0.8726074, 1, 1, 1, 1, 1,
-1.322025, -0.8794281, -1.134522, 1, 1, 1, 1, 1,
-1.313435, -0.03697167, -0.7660384, 1, 1, 1, 1, 1,
-1.29828, -0.1793438, -0.6617613, 1, 1, 1, 1, 1,
-1.295649, 0.2513547, -2.320327, 1, 1, 1, 1, 1,
-1.281861, 0.4653872, -0.7942823, 1, 1, 1, 1, 1,
-1.278632, -0.4951817, -4.037676, 1, 1, 1, 1, 1,
-1.270289, -0.8320792, -3.269253, 0, 0, 1, 1, 1,
-1.268475, -0.9970679, -0.9839963, 1, 0, 0, 1, 1,
-1.262622, 0.2410382, -1.565114, 1, 0, 0, 1, 1,
-1.253203, 1.621695, 0.3888517, 1, 0, 0, 1, 1,
-1.247839, -1.141835, -0.9014082, 1, 0, 0, 1, 1,
-1.236857, -0.6759228, -2.965279, 1, 0, 0, 1, 1,
-1.23535, -0.5482223, -1.570531, 0, 0, 0, 1, 1,
-1.234051, -1.610793, -3.029891, 0, 0, 0, 1, 1,
-1.224461, -0.6773723, -0.3781641, 0, 0, 0, 1, 1,
-1.219502, 1.420654, 0.5667626, 0, 0, 0, 1, 1,
-1.214265, -1.742173, -3.159026, 0, 0, 0, 1, 1,
-1.213076, -0.2554941, 0.3737137, 0, 0, 0, 1, 1,
-1.209608, 0.2103345, -1.110345, 0, 0, 0, 1, 1,
-1.20334, 0.1996566, -1.172058, 1, 1, 1, 1, 1,
-1.199952, 1.533212, -1.657703, 1, 1, 1, 1, 1,
-1.191967, 1.181401, 0.4576268, 1, 1, 1, 1, 1,
-1.187896, -0.8304438, -2.029742, 1, 1, 1, 1, 1,
-1.187319, 1.469469, -1.083725, 1, 1, 1, 1, 1,
-1.156375, 0.3698668, -0.5325119, 1, 1, 1, 1, 1,
-1.1458, -0.2437077, -1.943027, 1, 1, 1, 1, 1,
-1.145637, -1.162228, -1.176726, 1, 1, 1, 1, 1,
-1.140359, -0.6389214, -4.013473, 1, 1, 1, 1, 1,
-1.139036, -0.3802961, -0.4537108, 1, 1, 1, 1, 1,
-1.132873, 0.1871553, -2.866045, 1, 1, 1, 1, 1,
-1.131967, -2.411835, -3.587187, 1, 1, 1, 1, 1,
-1.129117, 1.320333, -1.472308, 1, 1, 1, 1, 1,
-1.125892, -0.6747255, -3.391973, 1, 1, 1, 1, 1,
-1.124262, 1.745145, -1.538495, 1, 1, 1, 1, 1,
-1.12362, 0.1660354, -0.9760594, 0, 0, 1, 1, 1,
-1.118902, 0.8586114, -0.1905978, 1, 0, 0, 1, 1,
-1.112428, -0.9685243, -1.863069, 1, 0, 0, 1, 1,
-1.111073, -0.9945164, -2.833637, 1, 0, 0, 1, 1,
-1.105342, -0.2716199, -1.909755, 1, 0, 0, 1, 1,
-1.103034, 0.6211306, -0.7129948, 1, 0, 0, 1, 1,
-1.099789, 1.471059, -0.360113, 0, 0, 0, 1, 1,
-1.091246, 1.190845, -2.71956, 0, 0, 0, 1, 1,
-1.082809, 0.7916585, -0.5841841, 0, 0, 0, 1, 1,
-1.074369, 0.9481325, 0.2546258, 0, 0, 0, 1, 1,
-1.072086, -0.1784578, -3.189566, 0, 0, 0, 1, 1,
-1.054015, -0.3245344, -3.611881, 0, 0, 0, 1, 1,
-1.052102, -0.5416069, -0.8133359, 0, 0, 0, 1, 1,
-1.049299, -0.2675787, -1.826509, 1, 1, 1, 1, 1,
-1.041964, -0.5672861, -1.248111, 1, 1, 1, 1, 1,
-1.041715, -1.565062, -2.054138, 1, 1, 1, 1, 1,
-1.03962, 0.07086913, -1.885348, 1, 1, 1, 1, 1,
-1.031371, 0.3240089, -0.7219855, 1, 1, 1, 1, 1,
-1.027883, 0.2365917, -2.683025, 1, 1, 1, 1, 1,
-1.023513, -2.438734, -4.521824, 1, 1, 1, 1, 1,
-1.02095, -0.002065744, -1.627245, 1, 1, 1, 1, 1,
-1.018921, -1.38657, -2.445004, 1, 1, 1, 1, 1,
-1.007979, -0.2270807, -2.655738, 1, 1, 1, 1, 1,
-1.001564, 1.209996, 0.6505957, 1, 1, 1, 1, 1,
-1.000254, -1.29398, -4.151608, 1, 1, 1, 1, 1,
-1.000244, -1.291607, -1.265412, 1, 1, 1, 1, 1,
-0.9971257, 0.09173971, -0.8788622, 1, 1, 1, 1, 1,
-0.9968488, 0.6737329, -0.8186261, 1, 1, 1, 1, 1,
-0.9948797, 0.7789678, -1.097953, 0, 0, 1, 1, 1,
-0.9929138, -0.2966753, -1.969804, 1, 0, 0, 1, 1,
-0.9923515, 1.059798, -2.465341, 1, 0, 0, 1, 1,
-0.9865344, -1.465883, -1.628182, 1, 0, 0, 1, 1,
-0.9835454, 0.08955001, -1.589809, 1, 0, 0, 1, 1,
-0.9805484, -0.1571407, -3.66737, 1, 0, 0, 1, 1,
-0.9773563, 0.2620387, -2.165877, 0, 0, 0, 1, 1,
-0.9769158, 1.554502, -1.355748, 0, 0, 0, 1, 1,
-0.9767715, -0.9624348, -3.072731, 0, 0, 0, 1, 1,
-0.9657009, 1.247628, -1.888865, 0, 0, 0, 1, 1,
-0.96487, -0.08374458, -0.4206919, 0, 0, 0, 1, 1,
-0.9634935, 1.222017, -0.001648918, 0, 0, 0, 1, 1,
-0.9623463, 1.35284, -0.1891577, 0, 0, 0, 1, 1,
-0.9621904, 0.6371031, -2.180055, 1, 1, 1, 1, 1,
-0.9485627, 0.5025191, -1.012425, 1, 1, 1, 1, 1,
-0.9440023, -1.433981, -3.279044, 1, 1, 1, 1, 1,
-0.9227389, -0.4535068, -1.444418, 1, 1, 1, 1, 1,
-0.9116861, 2.262299, -0.1271687, 1, 1, 1, 1, 1,
-0.9025111, 0.3291922, -1.897802, 1, 1, 1, 1, 1,
-0.8968636, -2.353738, -1.72404, 1, 1, 1, 1, 1,
-0.8950521, 0.666155, -0.05573441, 1, 1, 1, 1, 1,
-0.8875521, -0.4846944, -2.488618, 1, 1, 1, 1, 1,
-0.8861049, -0.1067534, -0.8450207, 1, 1, 1, 1, 1,
-0.8820821, -0.3417693, -3.174445, 1, 1, 1, 1, 1,
-0.8740828, -0.313008, -1.672911, 1, 1, 1, 1, 1,
-0.8718953, -2.098532, -2.402995, 1, 1, 1, 1, 1,
-0.8701284, 0.1630829, -2.243746, 1, 1, 1, 1, 1,
-0.8693401, -0.07112774, -2.69719, 1, 1, 1, 1, 1,
-0.868426, 0.05731246, -2.139427, 0, 0, 1, 1, 1,
-0.8645533, 0.2074331, -0.6173981, 1, 0, 0, 1, 1,
-0.855371, -1.133409, -2.509553, 1, 0, 0, 1, 1,
-0.8359057, -0.571695, -3.338303, 1, 0, 0, 1, 1,
-0.8340839, -1.943207, -2.045507, 1, 0, 0, 1, 1,
-0.8339639, -0.9973285, -1.754482, 1, 0, 0, 1, 1,
-0.8325632, -0.06609372, -1.652263, 0, 0, 0, 1, 1,
-0.8291728, -0.4821975, -3.897182, 0, 0, 0, 1, 1,
-0.8262368, 0.9048166, 0.3384886, 0, 0, 0, 1, 1,
-0.8181483, -0.3581303, -2.058064, 0, 0, 0, 1, 1,
-0.8088366, -0.4292363, -0.9436283, 0, 0, 0, 1, 1,
-0.8056698, -0.3701223, -2.535764, 0, 0, 0, 1, 1,
-0.797265, -1.610216, -3.371411, 0, 0, 0, 1, 1,
-0.7942247, -2.371773, -1.252041, 1, 1, 1, 1, 1,
-0.7926537, -0.9190324, -2.521338, 1, 1, 1, 1, 1,
-0.7921999, -0.4076163, -1.172208, 1, 1, 1, 1, 1,
-0.7916568, 0.4315704, -0.6099363, 1, 1, 1, 1, 1,
-0.791566, -0.1439977, -1.390712, 1, 1, 1, 1, 1,
-0.7872617, 1.436657, 1.632578, 1, 1, 1, 1, 1,
-0.7843869, 0.8478142, -1.570783, 1, 1, 1, 1, 1,
-0.781368, 0.1501334, -0.7486377, 1, 1, 1, 1, 1,
-0.7791159, -1.534541, -1.750272, 1, 1, 1, 1, 1,
-0.7786654, -2.071452, -3.170348, 1, 1, 1, 1, 1,
-0.7741589, 1.178191, -2.413525, 1, 1, 1, 1, 1,
-0.7734097, 0.4462626, -0.9667964, 1, 1, 1, 1, 1,
-0.769832, -0.9762486, -2.890587, 1, 1, 1, 1, 1,
-0.7685104, 0.5414426, -0.5170425, 1, 1, 1, 1, 1,
-0.7645165, 0.2806568, -2.222429, 1, 1, 1, 1, 1,
-0.7640952, 0.6333954, -0.6784456, 0, 0, 1, 1, 1,
-0.7599576, -0.0544285, -1.706422, 1, 0, 0, 1, 1,
-0.7583184, 2.127926, -1.605175, 1, 0, 0, 1, 1,
-0.7581016, -0.5058489, -1.991673, 1, 0, 0, 1, 1,
-0.7573142, -1.433696, -3.263052, 1, 0, 0, 1, 1,
-0.7566945, -0.1093781, -2.190973, 1, 0, 0, 1, 1,
-0.7526634, -0.01484128, -1.251159, 0, 0, 0, 1, 1,
-0.7514644, 2.083049, -0.743462, 0, 0, 0, 1, 1,
-0.7506125, -1.401774, -2.202023, 0, 0, 0, 1, 1,
-0.749684, 0.9139277, -1.591907, 0, 0, 0, 1, 1,
-0.7453376, -0.4385028, -2.628643, 0, 0, 0, 1, 1,
-0.7445006, 0.1227257, -0.5516925, 0, 0, 0, 1, 1,
-0.7399929, -0.6741449, -3.001365, 0, 0, 0, 1, 1,
-0.7363427, 0.4505143, -1.370126, 1, 1, 1, 1, 1,
-0.73533, 2.499904, 0.8396105, 1, 1, 1, 1, 1,
-0.7262372, -1.163938, -3.069448, 1, 1, 1, 1, 1,
-0.7210819, 0.997722, 0.23993, 1, 1, 1, 1, 1,
-0.7207065, 0.6413977, -2.290897, 1, 1, 1, 1, 1,
-0.7184885, -0.09001471, -1.231204, 1, 1, 1, 1, 1,
-0.7113884, -0.927323, -3.679549, 1, 1, 1, 1, 1,
-0.6997964, -0.4803627, -3.123945, 1, 1, 1, 1, 1,
-0.6976041, -0.2224069, -3.103393, 1, 1, 1, 1, 1,
-0.6929947, -0.7058188, -2.180816, 1, 1, 1, 1, 1,
-0.6814909, 0.6832215, -1.207745, 1, 1, 1, 1, 1,
-0.6765991, -1.827405, -4.728078, 1, 1, 1, 1, 1,
-0.6763281, -0.02479749, -2.062371, 1, 1, 1, 1, 1,
-0.6729178, 0.9361949, -1.44778, 1, 1, 1, 1, 1,
-0.6726451, -0.4098951, -4.203279, 1, 1, 1, 1, 1,
-0.6725742, -1.004113, -4.140545, 0, 0, 1, 1, 1,
-0.6655294, -0.7854488, -3.830651, 1, 0, 0, 1, 1,
-0.6646655, 0.3559817, -1.980272, 1, 0, 0, 1, 1,
-0.6541652, 1.147467, -0.2706429, 1, 0, 0, 1, 1,
-0.6526732, -0.2441629, -0.4416609, 1, 0, 0, 1, 1,
-0.650547, -1.17039, -4.092373, 1, 0, 0, 1, 1,
-0.6499646, -0.1392424, -1.159682, 0, 0, 0, 1, 1,
-0.649147, -0.247614, -2.052035, 0, 0, 0, 1, 1,
-0.6446245, -0.4598564, -1.027479, 0, 0, 0, 1, 1,
-0.6440053, 0.2456892, -0.2020819, 0, 0, 0, 1, 1,
-0.6419631, 0.7420265, -1.126143, 0, 0, 0, 1, 1,
-0.6313781, 1.426843, -1.616316, 0, 0, 0, 1, 1,
-0.631018, 0.2011176, -0.8592286, 0, 0, 0, 1, 1,
-0.6191797, -1.504903, -3.325745, 1, 1, 1, 1, 1,
-0.6177583, -1.506873, -2.726694, 1, 1, 1, 1, 1,
-0.6106097, 1.136464, -0.0716477, 1, 1, 1, 1, 1,
-0.6061217, -1.981991, -5.264326, 1, 1, 1, 1, 1,
-0.6025016, -0.2416885, -3.327343, 1, 1, 1, 1, 1,
-0.6014495, 0.5382178, -0.3061527, 1, 1, 1, 1, 1,
-0.5918683, -0.2862885, -1.510966, 1, 1, 1, 1, 1,
-0.5895008, -0.5415547, -1.793893, 1, 1, 1, 1, 1,
-0.5821474, -0.03501548, -2.25397, 1, 1, 1, 1, 1,
-0.5748692, -1.368643, -2.096412, 1, 1, 1, 1, 1,
-0.5711048, -0.1218034, -1.624106, 1, 1, 1, 1, 1,
-0.5701755, -0.5485717, -1.816837, 1, 1, 1, 1, 1,
-0.5695688, 0.1382718, -1.04386, 1, 1, 1, 1, 1,
-0.5689499, -0.3129498, -4.011798, 1, 1, 1, 1, 1,
-0.5648685, -1.308001, -2.48934, 1, 1, 1, 1, 1,
-0.5594152, -0.2363929, -2.259537, 0, 0, 1, 1, 1,
-0.5579133, -0.1373942, -1.986494, 1, 0, 0, 1, 1,
-0.5575815, 0.3016425, -1.989698, 1, 0, 0, 1, 1,
-0.5558033, -0.8646252, -1.568535, 1, 0, 0, 1, 1,
-0.5492291, -0.3569243, -1.537434, 1, 0, 0, 1, 1,
-0.5478208, -0.8488804, -4.747488, 1, 0, 0, 1, 1,
-0.5399246, -0.3998768, -1.282011, 0, 0, 0, 1, 1,
-0.534681, 0.1866701, -2.197305, 0, 0, 0, 1, 1,
-0.5336913, 0.4733975, -0.8574198, 0, 0, 0, 1, 1,
-0.5286866, 0.8933413, -0.05758762, 0, 0, 0, 1, 1,
-0.5278079, -1.038426, -3.49434, 0, 0, 0, 1, 1,
-0.5244954, -0.9076449, -2.573548, 0, 0, 0, 1, 1,
-0.5235861, 0.6120064, -2.672558, 0, 0, 0, 1, 1,
-0.5224392, -2.888112, -2.063283, 1, 1, 1, 1, 1,
-0.5198312, -0.8820993, -4.562253, 1, 1, 1, 1, 1,
-0.5172949, -1.037496, -3.418109, 1, 1, 1, 1, 1,
-0.5095473, -0.07594323, 0.2336115, 1, 1, 1, 1, 1,
-0.5050693, 0.5041859, -0.3691036, 1, 1, 1, 1, 1,
-0.5040492, -1.396054, -3.869984, 1, 1, 1, 1, 1,
-0.5033146, 0.721226, -2.279232, 1, 1, 1, 1, 1,
-0.5020643, -0.6099942, -3.296997, 1, 1, 1, 1, 1,
-0.5003739, 0.09554124, -0.8234527, 1, 1, 1, 1, 1,
-0.5001397, 1.343244, -1.092551, 1, 1, 1, 1, 1,
-0.4992736, 0.8626183, -0.1567628, 1, 1, 1, 1, 1,
-0.497141, -1.853771, -3.398151, 1, 1, 1, 1, 1,
-0.4886351, 0.5941675, 0.1741832, 1, 1, 1, 1, 1,
-0.4786358, 0.288746, -1.786027, 1, 1, 1, 1, 1,
-0.4782692, -0.5099976, -2.333832, 1, 1, 1, 1, 1,
-0.4776452, -2.586846, -4.202031, 0, 0, 1, 1, 1,
-0.4653994, 0.6353745, -2.011778, 1, 0, 0, 1, 1,
-0.464208, -0.4692625, -2.505925, 1, 0, 0, 1, 1,
-0.46383, 1.076796, -0.8950033, 1, 0, 0, 1, 1,
-0.4607147, -0.6106766, -2.154748, 1, 0, 0, 1, 1,
-0.4593197, 2.022536, 0.0045642, 1, 0, 0, 1, 1,
-0.4585366, 0.6952997, -0.8195582, 0, 0, 0, 1, 1,
-0.4576589, -1.618961, -4.489421, 0, 0, 0, 1, 1,
-0.45402, -0.04394665, -2.549761, 0, 0, 0, 1, 1,
-0.4515651, 0.9257297, 1.763957, 0, 0, 0, 1, 1,
-0.4483126, -1.365222, -3.494147, 0, 0, 0, 1, 1,
-0.4459493, 0.9327238, -0.9972153, 0, 0, 0, 1, 1,
-0.4404766, 0.7729775, -1.944307, 0, 0, 0, 1, 1,
-0.4394771, 1.110798, 0.6610175, 1, 1, 1, 1, 1,
-0.4310083, -0.3436977, -2.755847, 1, 1, 1, 1, 1,
-0.4310004, -1.072373, -3.825926, 1, 1, 1, 1, 1,
-0.4291725, 0.2025866, -0.8123008, 1, 1, 1, 1, 1,
-0.4289322, -1.023926, -2.145121, 1, 1, 1, 1, 1,
-0.4271073, -1.206623, -3.886647, 1, 1, 1, 1, 1,
-0.4259556, 0.5609467, -1.388449, 1, 1, 1, 1, 1,
-0.4241602, 0.6009709, -2.233714, 1, 1, 1, 1, 1,
-0.4237642, -1.783503, -3.41491, 1, 1, 1, 1, 1,
-0.4217798, -0.03029247, -3.934898, 1, 1, 1, 1, 1,
-0.4167937, -0.5377784, -3.618497, 1, 1, 1, 1, 1,
-0.4167167, -0.8789085, -2.987348, 1, 1, 1, 1, 1,
-0.4156639, 0.4960027, -1.67961, 1, 1, 1, 1, 1,
-0.4156632, 1.274098, 0.6132286, 1, 1, 1, 1, 1,
-0.4099746, -0.1113462, -1.330421, 1, 1, 1, 1, 1,
-0.4078753, 0.1201697, -0.4251225, 0, 0, 1, 1, 1,
-0.406962, 1.232319, -0.5412549, 1, 0, 0, 1, 1,
-0.4067758, 0.3229995, -0.2801179, 1, 0, 0, 1, 1,
-0.4063058, -0.7108711, -0.9080803, 1, 0, 0, 1, 1,
-0.3972937, -0.1151481, -0.06424116, 1, 0, 0, 1, 1,
-0.3961751, 1.714158, 0.1471435, 1, 0, 0, 1, 1,
-0.394638, 0.203683, -1.70733, 0, 0, 0, 1, 1,
-0.390691, 0.1709658, -1.359307, 0, 0, 0, 1, 1,
-0.386218, -0.7078158, -4.903873, 0, 0, 0, 1, 1,
-0.386039, 0.1709362, -1.255118, 0, 0, 0, 1, 1,
-0.3840309, -0.6486617, -2.222945, 0, 0, 0, 1, 1,
-0.3821529, -0.1770364, -0.4735278, 0, 0, 0, 1, 1,
-0.3812172, -0.4229499, -1.242139, 0, 0, 0, 1, 1,
-0.3797072, 1.941229, -0.01252415, 1, 1, 1, 1, 1,
-0.3680311, 1.024386, 1.993255, 1, 1, 1, 1, 1,
-0.3670161, -0.669866, -1.611236, 1, 1, 1, 1, 1,
-0.3646096, 0.689415, -0.3980826, 1, 1, 1, 1, 1,
-0.3639053, -0.9753162, -2.602163, 1, 1, 1, 1, 1,
-0.3619491, -1.309813, -4.97419, 1, 1, 1, 1, 1,
-0.3546939, 1.106929, -0.2045545, 1, 1, 1, 1, 1,
-0.3501902, -1.177525, -3.604179, 1, 1, 1, 1, 1,
-0.3472687, 0.3065173, -1.342, 1, 1, 1, 1, 1,
-0.3406673, 1.545919, 0.6963398, 1, 1, 1, 1, 1,
-0.3362033, 0.8602525, -2.000903, 1, 1, 1, 1, 1,
-0.3353849, 0.253552, 0.6582586, 1, 1, 1, 1, 1,
-0.3341711, -0.5295358, -2.715448, 1, 1, 1, 1, 1,
-0.3311037, -0.7366472, -2.402543, 1, 1, 1, 1, 1,
-0.3284215, -0.3632234, -0.7184007, 1, 1, 1, 1, 1,
-0.3206352, 0.6309922, -0.5179222, 0, 0, 1, 1, 1,
-0.3182031, 0.187126, -0.9561378, 1, 0, 0, 1, 1,
-0.3157896, 0.5381174, 0.1475859, 1, 0, 0, 1, 1,
-0.3142282, -0.1255452, -3.896798, 1, 0, 0, 1, 1,
-0.3124647, 1.217758, -0.6365504, 1, 0, 0, 1, 1,
-0.3115301, 0.7221037, 1.200848, 1, 0, 0, 1, 1,
-0.3108539, 0.8953827, -0.8231717, 0, 0, 0, 1, 1,
-0.3086756, 1.725215, -1.333572, 0, 0, 0, 1, 1,
-0.3086461, 1.229647, 1.543359, 0, 0, 0, 1, 1,
-0.3078361, 1.526039, 0.03720459, 0, 0, 0, 1, 1,
-0.3068427, 0.7444141, 2.105482, 0, 0, 0, 1, 1,
-0.3053223, 0.3275767, 0.8646802, 0, 0, 0, 1, 1,
-0.303025, -2.157963, -1.179983, 0, 0, 0, 1, 1,
-0.3021027, -0.1571853, -1.776325, 1, 1, 1, 1, 1,
-0.3012163, 0.9332551, 0.713884, 1, 1, 1, 1, 1,
-0.3000741, 0.9451184, -0.1377485, 1, 1, 1, 1, 1,
-0.2916328, -0.561536, -2.482756, 1, 1, 1, 1, 1,
-0.2894786, -0.9611859, -4.206253, 1, 1, 1, 1, 1,
-0.2874814, 0.7788892, -0.6028669, 1, 1, 1, 1, 1,
-0.2813656, -0.2044636, -3.210108, 1, 1, 1, 1, 1,
-0.2806761, -0.1690122, -1.733938, 1, 1, 1, 1, 1,
-0.2803462, 0.01751641, -0.456743, 1, 1, 1, 1, 1,
-0.2793876, 1.074427, 0.9285348, 1, 1, 1, 1, 1,
-0.2771938, -0.1813046, -3.313051, 1, 1, 1, 1, 1,
-0.2770422, 1.331634, -0.7279539, 1, 1, 1, 1, 1,
-0.2748584, 0.3064055, 1.445246, 1, 1, 1, 1, 1,
-0.2747181, -0.2907085, -2.168911, 1, 1, 1, 1, 1,
-0.2742814, -1.512657, -4.674668, 1, 1, 1, 1, 1,
-0.2720191, 1.637282, -0.8366634, 0, 0, 1, 1, 1,
-0.2705339, -0.09787334, -2.037613, 1, 0, 0, 1, 1,
-0.2681833, -0.08119818, -1.320271, 1, 0, 0, 1, 1,
-0.2656357, 3.083326, 0.1747087, 1, 0, 0, 1, 1,
-0.2635514, 1.214539, 0.3370651, 1, 0, 0, 1, 1,
-0.2627466, -0.3190556, -4.042637, 1, 0, 0, 1, 1,
-0.2605627, -1.305159, -1.74528, 0, 0, 0, 1, 1,
-0.260503, -0.577823, -2.261657, 0, 0, 0, 1, 1,
-0.259159, -1.221154, -4.068471, 0, 0, 0, 1, 1,
-0.2590583, 0.556992, 0.18495, 0, 0, 0, 1, 1,
-0.2581235, 0.6964546, -1.252102, 0, 0, 0, 1, 1,
-0.2557599, 0.541666, -1.949733, 0, 0, 0, 1, 1,
-0.252911, 1.692191, -1.324564, 0, 0, 0, 1, 1,
-0.2523545, -0.7425425, -1.43089, 1, 1, 1, 1, 1,
-0.2497275, 0.3511682, 1.620082, 1, 1, 1, 1, 1,
-0.2483143, 0.5189031, -1.907446, 1, 1, 1, 1, 1,
-0.2439247, -1.277791, -2.266417, 1, 1, 1, 1, 1,
-0.2422778, 0.828998, 0.8536509, 1, 1, 1, 1, 1,
-0.235796, -0.4856631, -2.232231, 1, 1, 1, 1, 1,
-0.2297494, -0.02715405, -2.865282, 1, 1, 1, 1, 1,
-0.2252115, -0.7243249, -3.639482, 1, 1, 1, 1, 1,
-0.2216443, 0.09269553, -1.348573, 1, 1, 1, 1, 1,
-0.2152333, -1.114703, -3.444493, 1, 1, 1, 1, 1,
-0.2150823, -0.6532252, -2.607776, 1, 1, 1, 1, 1,
-0.215037, -0.9582449, -4.705781, 1, 1, 1, 1, 1,
-0.2078702, -0.4368117, -2.506796, 1, 1, 1, 1, 1,
-0.2064715, -1.078544, -5.77827, 1, 1, 1, 1, 1,
-0.2055956, -1.221277, -3.171612, 1, 1, 1, 1, 1,
-0.2042873, -0.1771369, -2.038828, 0, 0, 1, 1, 1,
-0.1978587, 0.4148921, -0.2333131, 1, 0, 0, 1, 1,
-0.1956142, 0.4773983, 0.3109552, 1, 0, 0, 1, 1,
-0.1952968, 1.051257, -0.2527574, 1, 0, 0, 1, 1,
-0.1697499, 0.9103496, -0.8913516, 1, 0, 0, 1, 1,
-0.1686972, 0.2391905, -1.201205, 1, 0, 0, 1, 1,
-0.1672522, -1.133613, -2.227839, 0, 0, 0, 1, 1,
-0.1667678, 0.4432332, 0.4466507, 0, 0, 0, 1, 1,
-0.1636974, 0.2017594, 0.02303642, 0, 0, 0, 1, 1,
-0.1626943, 0.4012706, 0.731544, 0, 0, 0, 1, 1,
-0.1580702, 0.5543544, -0.6703286, 0, 0, 0, 1, 1,
-0.1568535, 1.519684, -2.063498, 0, 0, 0, 1, 1,
-0.1549231, 0.430011, -1.762357, 0, 0, 0, 1, 1,
-0.1535963, 0.4409561, 0.7745199, 1, 1, 1, 1, 1,
-0.1500902, -1.559985, -3.249238, 1, 1, 1, 1, 1,
-0.149823, -0.1578571, -3.386068, 1, 1, 1, 1, 1,
-0.147736, 0.1184284, -0.9624903, 1, 1, 1, 1, 1,
-0.1448576, -1.635989, -2.19301, 1, 1, 1, 1, 1,
-0.139973, -0.1574326, -3.361366, 1, 1, 1, 1, 1,
-0.1366095, -1.492476, -4.931884, 1, 1, 1, 1, 1,
-0.1360372, 0.2943446, 0.3787537, 1, 1, 1, 1, 1,
-0.1346876, 0.8937826, -1.770517, 1, 1, 1, 1, 1,
-0.1341839, -0.1597734, -3.620447, 1, 1, 1, 1, 1,
-0.1275852, 0.2651828, 1.766872, 1, 1, 1, 1, 1,
-0.1236775, 0.452068, -0.3930899, 1, 1, 1, 1, 1,
-0.1209832, 0.6201404, 0.5594093, 1, 1, 1, 1, 1,
-0.1182559, -1.095056, -2.670162, 1, 1, 1, 1, 1,
-0.1131841, -1.215149, -3.156853, 1, 1, 1, 1, 1,
-0.1086676, 1.821303, 0.005367196, 0, 0, 1, 1, 1,
-0.1080597, -1.322031, -3.328283, 1, 0, 0, 1, 1,
-0.107704, 2.244606, -0.9953821, 1, 0, 0, 1, 1,
-0.1072786, -0.3165243, -2.620013, 1, 0, 0, 1, 1,
-0.1036565, -0.4320798, -4.118773, 1, 0, 0, 1, 1,
-0.1031716, -1.105731, -3.010821, 1, 0, 0, 1, 1,
-0.09720222, 0.3257079, -0.8474116, 0, 0, 0, 1, 1,
-0.09698663, 0.1046669, 0.2131005, 0, 0, 0, 1, 1,
-0.0943913, 0.2361061, -1.283361, 0, 0, 0, 1, 1,
-0.09387469, 0.3324734, -0.6721407, 0, 0, 0, 1, 1,
-0.09387072, 0.09762653, -1.326523, 0, 0, 0, 1, 1,
-0.09164025, -1.889848, -3.193458, 0, 0, 0, 1, 1,
-0.08707822, 0.2270693, -0.3324177, 0, 0, 0, 1, 1,
-0.08698054, 0.1996312, 0.1813615, 1, 1, 1, 1, 1,
-0.08695929, 0.7368637, 0.08101398, 1, 1, 1, 1, 1,
-0.08246485, 0.05201644, -1.24823, 1, 1, 1, 1, 1,
-0.0806429, 0.6102031, -0.871708, 1, 1, 1, 1, 1,
-0.0713428, 0.6614398, -0.6179863, 1, 1, 1, 1, 1,
-0.06809406, -1.428156, -3.875299, 1, 1, 1, 1, 1,
-0.06737267, -0.732769, -2.552489, 1, 1, 1, 1, 1,
-0.06725652, 0.3708776, -1.615319, 1, 1, 1, 1, 1,
-0.06482492, -0.54827, -3.75273, 1, 1, 1, 1, 1,
-0.06365561, 1.215665, -1.032547, 1, 1, 1, 1, 1,
-0.05924316, 1.345815, -0.4379953, 1, 1, 1, 1, 1,
-0.05281049, 0.514973, -0.132166, 1, 1, 1, 1, 1,
-0.04997585, 0.09967063, 0.856667, 1, 1, 1, 1, 1,
-0.04689557, -0.6463022, -4.922862, 1, 1, 1, 1, 1,
-0.03757948, -0.03686614, -2.728308, 1, 1, 1, 1, 1,
-0.03394449, -0.1019199, -2.8796, 0, 0, 1, 1, 1,
-0.03067634, 0.4426371, 0.5968652, 1, 0, 0, 1, 1,
-0.02860442, -1.224009, -4.576563, 1, 0, 0, 1, 1,
-0.02821234, 0.3983983, -0.480322, 1, 0, 0, 1, 1,
-0.0261397, -0.3191442, -2.94392, 1, 0, 0, 1, 1,
-0.0240498, -0.536281, -2.778446, 1, 0, 0, 1, 1,
-0.02308447, 0.2350968, 0.6821107, 0, 0, 0, 1, 1,
-0.01656172, -0.5549804, -3.142966, 0, 0, 0, 1, 1,
-0.01418633, 0.8096742, -0.1583435, 0, 0, 0, 1, 1,
-0.01398033, -0.1821888, -3.915385, 0, 0, 0, 1, 1,
-0.01143386, -0.1658151, -3.466392, 0, 0, 0, 1, 1,
-0.00063662, -1.627159, -3.637681, 0, 0, 0, 1, 1,
0.004343328, -1.287696, 4.628797, 0, 0, 0, 1, 1,
0.005093714, -1.295349, 3.25757, 1, 1, 1, 1, 1,
0.00798755, 2.178488, -0.5306967, 1, 1, 1, 1, 1,
0.01060773, -0.7504688, 3.914283, 1, 1, 1, 1, 1,
0.01117056, 0.3088966, -0.0161013, 1, 1, 1, 1, 1,
0.01526431, 0.5162158, 0.377868, 1, 1, 1, 1, 1,
0.01567464, 0.1435716, -1.028136, 1, 1, 1, 1, 1,
0.01700916, 0.0305497, 0.9248517, 1, 1, 1, 1, 1,
0.02097581, 0.678557, -0.0251061, 1, 1, 1, 1, 1,
0.02162864, -0.414453, 3.396215, 1, 1, 1, 1, 1,
0.02466524, -1.701287, 4.184312, 1, 1, 1, 1, 1,
0.02622639, -0.702198, 3.961505, 1, 1, 1, 1, 1,
0.02862097, -0.5899013, 3.353287, 1, 1, 1, 1, 1,
0.03057956, -2.018179, 1.461436, 1, 1, 1, 1, 1,
0.03642901, -1.217205, 1.934731, 1, 1, 1, 1, 1,
0.04110368, -2.040417, 3.798653, 1, 1, 1, 1, 1,
0.0432098, 0.3057255, -1.004729, 0, 0, 1, 1, 1,
0.04625451, -0.3798641, 3.903059, 1, 0, 0, 1, 1,
0.05007119, 0.7472598, -0.1533395, 1, 0, 0, 1, 1,
0.05118834, -0.3292606, 3.431063, 1, 0, 0, 1, 1,
0.05715917, -2.156772, 2.488809, 1, 0, 0, 1, 1,
0.05979452, -0.1039891, 1.964009, 1, 0, 0, 1, 1,
0.06381915, -0.4591921, 3.051489, 0, 0, 0, 1, 1,
0.06775516, 0.5516134, 0.01058681, 0, 0, 0, 1, 1,
0.07151651, -2.444081, 2.461149, 0, 0, 0, 1, 1,
0.0720052, -0.3770997, 2.390391, 0, 0, 0, 1, 1,
0.07216915, -2.407023, 1.122706, 0, 0, 0, 1, 1,
0.07345222, -0.8826349, 3.860841, 0, 0, 0, 1, 1,
0.07459075, 0.6062455, -0.0393109, 0, 0, 0, 1, 1,
0.07592506, -0.9341595, 3.3391, 1, 1, 1, 1, 1,
0.07660387, -0.8204279, 1.058408, 1, 1, 1, 1, 1,
0.0771571, -0.1452721, 1.846864, 1, 1, 1, 1, 1,
0.08127198, -2.079096, 5.219666, 1, 1, 1, 1, 1,
0.085467, -0.7142601, 2.857649, 1, 1, 1, 1, 1,
0.08885318, -1.351893, 1.580008, 1, 1, 1, 1, 1,
0.08972228, -1.065142, 1.413843, 1, 1, 1, 1, 1,
0.08989191, 2.309432, 0.3381746, 1, 1, 1, 1, 1,
0.09161515, -1.574412, 3.809986, 1, 1, 1, 1, 1,
0.0917833, -2.221421, 3.030707, 1, 1, 1, 1, 1,
0.09183269, 0.5182353, -0.9276105, 1, 1, 1, 1, 1,
0.09340221, 0.1658898, 1.036595, 1, 1, 1, 1, 1,
0.0939497, 0.199329, 0.6279649, 1, 1, 1, 1, 1,
0.09433981, 1.073606, 0.02883171, 1, 1, 1, 1, 1,
0.09526269, 0.04403694, 0.7895827, 1, 1, 1, 1, 1,
0.09774767, 0.8314105, 0.1147739, 0, 0, 1, 1, 1,
0.09842263, 0.02227331, 2.383364, 1, 0, 0, 1, 1,
0.1005327, 0.6259269, 1.013802, 1, 0, 0, 1, 1,
0.100995, 0.1411885, 0.3903869, 1, 0, 0, 1, 1,
0.1014865, -0.4331721, 4.793971, 1, 0, 0, 1, 1,
0.1032597, 0.4313269, 0.3268078, 1, 0, 0, 1, 1,
0.104652, 0.2825334, 1.545837, 0, 0, 0, 1, 1,
0.1056226, -0.3037165, 3.122499, 0, 0, 0, 1, 1,
0.1057573, 1.273124, -1.014029, 0, 0, 0, 1, 1,
0.1077228, 1.008563, 0.8251838, 0, 0, 0, 1, 1,
0.1097163, -0.4938434, 2.852461, 0, 0, 0, 1, 1,
0.1112263, -1.917755, 3.531934, 0, 0, 0, 1, 1,
0.1154494, -0.3889788, 3.502242, 0, 0, 0, 1, 1,
0.1216937, -0.0883299, 2.03596, 1, 1, 1, 1, 1,
0.1230892, 2.18425, -0.1419892, 1, 1, 1, 1, 1,
0.1302055, -0.2373087, 2.487725, 1, 1, 1, 1, 1,
0.1328265, -1.191443, 3.259773, 1, 1, 1, 1, 1,
0.1360614, 0.27449, 0.1105394, 1, 1, 1, 1, 1,
0.1373635, 1.593926, -1.419852, 1, 1, 1, 1, 1,
0.138438, 1.413389, 0.4071059, 1, 1, 1, 1, 1,
0.1404376, -1.362105, 1.980038, 1, 1, 1, 1, 1,
0.1423264, 0.004582265, 0.7795336, 1, 1, 1, 1, 1,
0.1426031, 0.0358431, 0.6570872, 1, 1, 1, 1, 1,
0.1437303, 1.085208, -0.2788274, 1, 1, 1, 1, 1,
0.1450212, 0.9030916, 1.319061, 1, 1, 1, 1, 1,
0.1456836, 0.2829933, 0.9766295, 1, 1, 1, 1, 1,
0.1481686, -0.1684077, 2.797702, 1, 1, 1, 1, 1,
0.1484945, 0.4323485, 0.7970454, 1, 1, 1, 1, 1,
0.1493035, 0.3877233, -1.226554, 0, 0, 1, 1, 1,
0.1494392, 0.08021671, -0.8737186, 1, 0, 0, 1, 1,
0.1500588, 0.7799522, 0.4539576, 1, 0, 0, 1, 1,
0.1548707, -1.231628, 2.906936, 1, 0, 0, 1, 1,
0.1561604, 0.9626147, -1.169872, 1, 0, 0, 1, 1,
0.1571001, -1.179254, 2.933206, 1, 0, 0, 1, 1,
0.1581681, -1.030448, 3.672834, 0, 0, 0, 1, 1,
0.1601691, -1.509342, 1.851158, 0, 0, 0, 1, 1,
0.1620052, -0.02390797, 2.068658, 0, 0, 0, 1, 1,
0.1638935, 0.7126586, 1.873325, 0, 0, 0, 1, 1,
0.1779925, 0.8503585, 0.7883112, 0, 0, 0, 1, 1,
0.1788532, -0.7249147, 2.724009, 0, 0, 0, 1, 1,
0.1838526, -1.483343, 3.683471, 0, 0, 0, 1, 1,
0.1962876, -0.3370066, 2.725358, 1, 1, 1, 1, 1,
0.1998711, -0.1506576, 2.663781, 1, 1, 1, 1, 1,
0.2010669, 0.1344243, 1.44785, 1, 1, 1, 1, 1,
0.2093082, -1.913465, 2.969906, 1, 1, 1, 1, 1,
0.2135742, 0.2111823, -0.9732465, 1, 1, 1, 1, 1,
0.2152289, 0.3230224, 3.464015, 1, 1, 1, 1, 1,
0.2187327, 0.1157845, 1.749333, 1, 1, 1, 1, 1,
0.2246237, -0.8968202, 3.996336, 1, 1, 1, 1, 1,
0.2286467, -0.2836985, 4.557482, 1, 1, 1, 1, 1,
0.229198, -2.18092, 1.374998, 1, 1, 1, 1, 1,
0.2310122, 1.088129, 1.226538, 1, 1, 1, 1, 1,
0.2318279, 0.6548638, 1.133541, 1, 1, 1, 1, 1,
0.2322397, 0.4663267, 0.1309219, 1, 1, 1, 1, 1,
0.2377475, 0.9934016, -0.2673101, 1, 1, 1, 1, 1,
0.241639, -0.8704841, 3.577989, 1, 1, 1, 1, 1,
0.2420999, 0.59842, 0.4680875, 0, 0, 1, 1, 1,
0.2446387, 1.227014, 1.47833, 1, 0, 0, 1, 1,
0.2447811, 0.3492031, 0.1572502, 1, 0, 0, 1, 1,
0.2502375, -0.04960804, 1.551635, 1, 0, 0, 1, 1,
0.2514865, 0.1891272, 0.5160102, 1, 0, 0, 1, 1,
0.2519218, 0.4297554, 0.407242, 1, 0, 0, 1, 1,
0.2542189, -0.7407888, 4.704257, 0, 0, 0, 1, 1,
0.2555385, -0.06729777, 0.8353237, 0, 0, 0, 1, 1,
0.2563828, -0.257893, 2.594661, 0, 0, 0, 1, 1,
0.2579704, 0.1423503, 0.9065785, 0, 0, 0, 1, 1,
0.2626447, -1.443601, 2.275918, 0, 0, 0, 1, 1,
0.2626694, 1.562906, -1.718185, 0, 0, 0, 1, 1,
0.263531, 0.7512201, 0.8551014, 0, 0, 0, 1, 1,
0.2657644, 0.5231634, 0.2021263, 1, 1, 1, 1, 1,
0.2678377, 0.2542394, 1.834018, 1, 1, 1, 1, 1,
0.2707372, -0.8051317, 2.59768, 1, 1, 1, 1, 1,
0.2754927, 0.3980069, 1.182987, 1, 1, 1, 1, 1,
0.277419, -0.5313338, 2.529427, 1, 1, 1, 1, 1,
0.2838354, -0.6084157, 2.881758, 1, 1, 1, 1, 1,
0.2890619, 0.02772478, 1.473376, 1, 1, 1, 1, 1,
0.2922897, -0.1751175, 3.028485, 1, 1, 1, 1, 1,
0.293155, -0.8444337, 3.439052, 1, 1, 1, 1, 1,
0.294709, 0.9016426, -1.137557, 1, 1, 1, 1, 1,
0.2991241, -0.4583778, 2.661861, 1, 1, 1, 1, 1,
0.3014363, -0.7217081, 3.778304, 1, 1, 1, 1, 1,
0.3024008, 0.2208287, 0.2373583, 1, 1, 1, 1, 1,
0.3114857, 1.032444, 1.091864, 1, 1, 1, 1, 1,
0.3134721, -0.1914302, 2.556261, 1, 1, 1, 1, 1,
0.3135997, -1.412401, 2.211305, 0, 0, 1, 1, 1,
0.3158183, -1.101414, 2.360588, 1, 0, 0, 1, 1,
0.3170357, -0.4432993, 1.890037, 1, 0, 0, 1, 1,
0.3170836, -0.1427656, 1.950766, 1, 0, 0, 1, 1,
0.3173213, 0.03571846, 0.6933321, 1, 0, 0, 1, 1,
0.3199258, -1.535116, 2.251931, 1, 0, 0, 1, 1,
0.321161, -1.434662, 2.182886, 0, 0, 0, 1, 1,
0.3297824, 1.022344, -1.246636, 0, 0, 0, 1, 1,
0.3339262, 0.6092086, -0.273592, 0, 0, 0, 1, 1,
0.334291, -0.723118, 3.730431, 0, 0, 0, 1, 1,
0.3344419, 0.2231504, 0.8411049, 0, 0, 0, 1, 1,
0.3432685, -0.558746, 2.028247, 0, 0, 0, 1, 1,
0.3436524, 0.3649064, 0.05079117, 0, 0, 0, 1, 1,
0.3438809, -0.7087487, 3.924846, 1, 1, 1, 1, 1,
0.3524577, 0.4975911, -1.737873, 1, 1, 1, 1, 1,
0.3538742, 1.764624, 1.165099, 1, 1, 1, 1, 1,
0.3562602, -0.1367344, 1.139012, 1, 1, 1, 1, 1,
0.3669007, -1.084467, 2.372438, 1, 1, 1, 1, 1,
0.3708749, -0.4019279, 3.286389, 1, 1, 1, 1, 1,
0.3763476, -0.4969951, 0.7547038, 1, 1, 1, 1, 1,
0.3771119, -0.411995, 2.032194, 1, 1, 1, 1, 1,
0.37751, 0.4850131, 0.3717769, 1, 1, 1, 1, 1,
0.3775704, 1.191525, 2.030116, 1, 1, 1, 1, 1,
0.3790499, -0.09544122, 1.717494, 1, 1, 1, 1, 1,
0.385002, 0.8453473, 0.2309005, 1, 1, 1, 1, 1,
0.3886382, -0.1485704, 1.857915, 1, 1, 1, 1, 1,
0.3900581, -0.09788578, 2.762432, 1, 1, 1, 1, 1,
0.3909229, 1.425782, 1.148495, 1, 1, 1, 1, 1,
0.3976194, -0.9147468, 2.890936, 0, 0, 1, 1, 1,
0.4033248, 1.0992, 0.3031873, 1, 0, 0, 1, 1,
0.4054737, -0.3638458, 2.883231, 1, 0, 0, 1, 1,
0.4089392, -0.01409112, -0.1408427, 1, 0, 0, 1, 1,
0.4152363, -0.7059475, 3.709165, 1, 0, 0, 1, 1,
0.4169604, -0.2802257, 3.448977, 1, 0, 0, 1, 1,
0.4175194, 0.3776414, 1.54865, 0, 0, 0, 1, 1,
0.4194753, 0.4811378, 1.480638, 0, 0, 0, 1, 1,
0.4263549, -1.108427, 3.86407, 0, 0, 0, 1, 1,
0.4285882, -1.21931, 2.74281, 0, 0, 0, 1, 1,
0.4294727, 0.2677409, 0.8750532, 0, 0, 0, 1, 1,
0.4319563, 0.7027289, -0.4228234, 0, 0, 0, 1, 1,
0.432693, -1.6321, 3.8029, 0, 0, 0, 1, 1,
0.4339976, 1.594578, 0.5898748, 1, 1, 1, 1, 1,
0.4353541, -0.7290869, 1.182296, 1, 1, 1, 1, 1,
0.435978, 0.01809778, 2.380522, 1, 1, 1, 1, 1,
0.4409576, -0.420513, 1.958301, 1, 1, 1, 1, 1,
0.4447308, -0.1737282, 1.36183, 1, 1, 1, 1, 1,
0.4494749, -1.234515, 3.37731, 1, 1, 1, 1, 1,
0.4494865, 0.597214, -1.90249, 1, 1, 1, 1, 1,
0.4499035, -0.4593704, 1.993911, 1, 1, 1, 1, 1,
0.4500289, 1.586769, -0.2526886, 1, 1, 1, 1, 1,
0.4541353, 0.07460478, -0.007292746, 1, 1, 1, 1, 1,
0.4549716, -0.6565285, 2.19681, 1, 1, 1, 1, 1,
0.4550183, 0.4920901, 1.772119, 1, 1, 1, 1, 1,
0.4561949, 0.1144743, 0.8496103, 1, 1, 1, 1, 1,
0.4584248, 1.211507, -0.2556685, 1, 1, 1, 1, 1,
0.4655141, -0.5960441, 1.936896, 1, 1, 1, 1, 1,
0.4695131, -0.03144512, 2.004563, 0, 0, 1, 1, 1,
0.4706927, 0.936535, -0.3915413, 1, 0, 0, 1, 1,
0.4768301, 1.298212, 1.201024, 1, 0, 0, 1, 1,
0.4791718, -1.268892, 3.520018, 1, 0, 0, 1, 1,
0.4849086, -2.031999, 2.043343, 1, 0, 0, 1, 1,
0.4863059, -0.3244956, 3.961829, 1, 0, 0, 1, 1,
0.4917129, -0.9062843, 1.237148, 0, 0, 0, 1, 1,
0.4924838, 1.941792, 0.2536229, 0, 0, 0, 1, 1,
0.4947031, -0.9077219, 3.418289, 0, 0, 0, 1, 1,
0.4973414, -1.389354, 2.908744, 0, 0, 0, 1, 1,
0.4975074, -1.095611, 3.671588, 0, 0, 0, 1, 1,
0.4996091, -2.528008, 2.810922, 0, 0, 0, 1, 1,
0.5008147, 1.473272, 0.1479891, 0, 0, 0, 1, 1,
0.502261, 0.9976302, 3.487564, 1, 1, 1, 1, 1,
0.5030932, 0.05007245, 1.598488, 1, 1, 1, 1, 1,
0.5068309, -0.58964, 4.688856, 1, 1, 1, 1, 1,
0.5160564, -2.715979, 3.554282, 1, 1, 1, 1, 1,
0.5170889, -2.283883, 3.703943, 1, 1, 1, 1, 1,
0.5193686, -0.3334078, 2.129114, 1, 1, 1, 1, 1,
0.5197343, 1.548651, 0.937738, 1, 1, 1, 1, 1,
0.5220099, 0.2270777, 1.605624, 1, 1, 1, 1, 1,
0.5230272, 0.07249936, 1.602289, 1, 1, 1, 1, 1,
0.5259298, 0.9782, 1.326555, 1, 1, 1, 1, 1,
0.5265594, -0.857334, 1.815618, 1, 1, 1, 1, 1,
0.5308306, -0.01899049, 1.091392, 1, 1, 1, 1, 1,
0.5332494, -1.560926, 2.76959, 1, 1, 1, 1, 1,
0.5411509, 0.8330444, 0.6447552, 1, 1, 1, 1, 1,
0.5419779, -0.1880799, 1.335989, 1, 1, 1, 1, 1,
0.5442371, -0.9449486, 3.662613, 0, 0, 1, 1, 1,
0.5474395, -0.5941562, 3.003587, 1, 0, 0, 1, 1,
0.551766, -1.524517, 3.055775, 1, 0, 0, 1, 1,
0.5528292, -1.235144, 1.402341, 1, 0, 0, 1, 1,
0.554755, 0.887848, 0.3129975, 1, 0, 0, 1, 1,
0.5582862, 0.4958068, 1.430899, 1, 0, 0, 1, 1,
0.5602253, 1.609708, -0.1639685, 0, 0, 0, 1, 1,
0.5603176, -0.3067106, 2.264232, 0, 0, 0, 1, 1,
0.5608716, -0.08862458, -0.09940078, 0, 0, 0, 1, 1,
0.5622442, -1.308159, 3.442235, 0, 0, 0, 1, 1,
0.5670443, -0.8578079, 3.879702, 0, 0, 0, 1, 1,
0.5676103, 1.676112, -1.539647, 0, 0, 0, 1, 1,
0.5689767, -0.2712295, 0.8611307, 0, 0, 0, 1, 1,
0.5706819, -0.8009887, 2.647204, 1, 1, 1, 1, 1,
0.5713981, 0.5809731, 1.626217, 1, 1, 1, 1, 1,
0.5741576, 0.6323266, 2.359123, 1, 1, 1, 1, 1,
0.5765451, 0.3727046, -1.097208, 1, 1, 1, 1, 1,
0.5774093, 0.2508328, 2.076945, 1, 1, 1, 1, 1,
0.5778368, -1.49543, 2.204112, 1, 1, 1, 1, 1,
0.5801103, 0.3444552, -0.1599943, 1, 1, 1, 1, 1,
0.580992, 1.004842, -0.6912606, 1, 1, 1, 1, 1,
0.5820517, -0.8295327, 4.62257, 1, 1, 1, 1, 1,
0.5867248, 0.188355, 0.996704, 1, 1, 1, 1, 1,
0.5874361, 1.050297, -1.0838, 1, 1, 1, 1, 1,
0.5921945, 1.487891, 1.228999, 1, 1, 1, 1, 1,
0.5945796, 0.136472, 0.6631699, 1, 1, 1, 1, 1,
0.5976309, -1.251993, 3.352834, 1, 1, 1, 1, 1,
0.6022043, 1.174425, 0.8933186, 1, 1, 1, 1, 1,
0.6046406, -1.384472, 1.897599, 0, 0, 1, 1, 1,
0.6085235, -1.318293, 1.094141, 1, 0, 0, 1, 1,
0.6100605, -1.123419, 3.673374, 1, 0, 0, 1, 1,
0.614019, -0.777012, 3.560301, 1, 0, 0, 1, 1,
0.6159448, -1.72515, 3.111094, 1, 0, 0, 1, 1,
0.6165277, -0.4641638, 2.377569, 1, 0, 0, 1, 1,
0.6175455, -0.07003557, 3.417331, 0, 0, 0, 1, 1,
0.6194328, 0.1873812, 0.5665192, 0, 0, 0, 1, 1,
0.6209977, 0.6306956, 1.240716, 0, 0, 0, 1, 1,
0.6223217, 0.02179964, 1.122765, 0, 0, 0, 1, 1,
0.6271103, 0.9629765, -0.734912, 0, 0, 0, 1, 1,
0.6337842, -0.106125, 2.036194, 0, 0, 0, 1, 1,
0.6378468, -0.04825255, 0.8982049, 0, 0, 0, 1, 1,
0.649643, -0.9642553, 4.748832, 1, 1, 1, 1, 1,
0.6537463, -1.393422, 2.843373, 1, 1, 1, 1, 1,
0.6541642, 0.2565333, 0.495586, 1, 1, 1, 1, 1,
0.6589633, 0.1488038, 1.003507, 1, 1, 1, 1, 1,
0.6604155, -0.001218, 1.076123, 1, 1, 1, 1, 1,
0.6638353, 0.1189455, 1.970916, 1, 1, 1, 1, 1,
0.6674122, -0.8056486, 3.784202, 1, 1, 1, 1, 1,
0.6740099, -0.204228, 0.6631207, 1, 1, 1, 1, 1,
0.6755645, -1.019544, 0.5364093, 1, 1, 1, 1, 1,
0.67857, -1.091917, 2.749934, 1, 1, 1, 1, 1,
0.6848769, -1.050072, 3.228537, 1, 1, 1, 1, 1,
0.7070462, 0.9136003, 1.143269, 1, 1, 1, 1, 1,
0.711795, -1.682434, 2.866599, 1, 1, 1, 1, 1,
0.7197973, -0.9497419, 3.572157, 1, 1, 1, 1, 1,
0.7229421, 1.240303, 1.51106, 1, 1, 1, 1, 1,
0.7255039, -0.1083034, -0.9303604, 0, 0, 1, 1, 1,
0.7260661, 1.255151, 1.478367, 1, 0, 0, 1, 1,
0.7277226, 1.870069, 1.725349, 1, 0, 0, 1, 1,
0.7323364, -0.5889265, -0.2327943, 1, 0, 0, 1, 1,
0.7378961, -0.2628954, 0.9757562, 1, 0, 0, 1, 1,
0.7399778, 0.3535199, 2.262738, 1, 0, 0, 1, 1,
0.7407637, -0.9164961, 1.319161, 0, 0, 0, 1, 1,
0.7447333, -0.242821, 4.097633, 0, 0, 0, 1, 1,
0.7485207, -1.276654, 1.97028, 0, 0, 0, 1, 1,
0.7502946, 0.9738998, 1.791816, 0, 0, 0, 1, 1,
0.7510028, 1.032669, 0.6900311, 0, 0, 0, 1, 1,
0.756005, 0.001132361, 3.228332, 0, 0, 0, 1, 1,
0.7560984, -2.111895, 3.528503, 0, 0, 0, 1, 1,
0.7580456, -0.6778719, 2.554448, 1, 1, 1, 1, 1,
0.7587028, 0.4620084, 1.602909, 1, 1, 1, 1, 1,
0.7633576, -0.07333276, 1.332039, 1, 1, 1, 1, 1,
0.7657263, 0.9047656, -0.2702367, 1, 1, 1, 1, 1,
0.7696396, -1.96149, 3.030496, 1, 1, 1, 1, 1,
0.7771244, -0.4777863, 3.605615, 1, 1, 1, 1, 1,
0.7788535, 0.8555419, 1.605133, 1, 1, 1, 1, 1,
0.7808684, -0.3013639, 0.6322354, 1, 1, 1, 1, 1,
0.7856227, -0.04778639, 2.226198, 1, 1, 1, 1, 1,
0.791111, -0.4744725, -0.3367158, 1, 1, 1, 1, 1,
0.798072, -0.1370865, 1.870356, 1, 1, 1, 1, 1,
0.8001266, -1.798709, 3.403616, 1, 1, 1, 1, 1,
0.8039587, 0.5979816, 1.524009, 1, 1, 1, 1, 1,
0.8040587, 0.2071804, 0.2378483, 1, 1, 1, 1, 1,
0.8054537, 0.244728, 1.082118, 1, 1, 1, 1, 1,
0.8087067, -0.6830066, 2.618993, 0, 0, 1, 1, 1,
0.8113909, -2.127028, 3.831461, 1, 0, 0, 1, 1,
0.8136219, 0.1044579, 2.438903, 1, 0, 0, 1, 1,
0.8215162, -0.5534949, 4.352777, 1, 0, 0, 1, 1,
0.8305944, 1.247131, 0.7781633, 1, 0, 0, 1, 1,
0.8353122, 0.1857401, 2.000077, 1, 0, 0, 1, 1,
0.8424374, -0.543386, 1.99361, 0, 0, 0, 1, 1,
0.8440018, -0.0750904, -0.132388, 0, 0, 0, 1, 1,
0.8461685, -1.344152, 3.61205, 0, 0, 0, 1, 1,
0.8518142, -0.7492027, 3.098953, 0, 0, 0, 1, 1,
0.854766, -0.7752823, 0.5390341, 0, 0, 0, 1, 1,
0.8549231, -0.5288192, 2.652119, 0, 0, 0, 1, 1,
0.8626997, 2.411795, -0.8217977, 0, 0, 0, 1, 1,
0.865503, 1.492626, 1.452545, 1, 1, 1, 1, 1,
0.8713037, -0.1753725, 1.415385, 1, 1, 1, 1, 1,
0.8773487, 0.2069644, 2.21445, 1, 1, 1, 1, 1,
0.8869724, 0.8327097, -1.125522, 1, 1, 1, 1, 1,
0.8909013, 1.052234, -1.531255, 1, 1, 1, 1, 1,
0.8926549, 0.8964626, 1.73552, 1, 1, 1, 1, 1,
0.8974809, -0.4768909, 1.493113, 1, 1, 1, 1, 1,
0.9030252, 0.6944879, 0.2468491, 1, 1, 1, 1, 1,
0.9097145, -1.43914, 2.483618, 1, 1, 1, 1, 1,
0.9108035, -0.02322329, 0.579109, 1, 1, 1, 1, 1,
0.9118611, 0.3227028, 1.10449, 1, 1, 1, 1, 1,
0.9180263, -1.054334, 1.971288, 1, 1, 1, 1, 1,
0.9233801, -0.9532946, 3.705344, 1, 1, 1, 1, 1,
0.9290827, -0.2456738, 1.765292, 1, 1, 1, 1, 1,
0.9333165, 0.4244083, 0.6307427, 1, 1, 1, 1, 1,
0.93774, 0.223875, -1.164477, 0, 0, 1, 1, 1,
0.9417098, -0.9928102, 1.86929, 1, 0, 0, 1, 1,
0.9425018, -0.02385946, 0.5445163, 1, 0, 0, 1, 1,
0.9435846, 0.5239013, 2.107467, 1, 0, 0, 1, 1,
0.9447123, 0.6598979, 1.609686, 1, 0, 0, 1, 1,
0.9452885, 0.9478636, 1.317374, 1, 0, 0, 1, 1,
0.9480958, -0.8563197, 3.940695, 0, 0, 0, 1, 1,
0.9491415, 1.337156, 0.4050454, 0, 0, 0, 1, 1,
0.9518973, 0.4959419, 1.669265, 0, 0, 0, 1, 1,
0.9525877, 0.5131407, 0.8815542, 0, 0, 0, 1, 1,
0.9618742, 0.6877186, 1.019835, 0, 0, 0, 1, 1,
0.9636205, 1.360879, 1.55713, 0, 0, 0, 1, 1,
0.9645081, -0.2193751, 2.752921, 0, 0, 0, 1, 1,
0.9751879, -1.700218, 2.677155, 1, 1, 1, 1, 1,
0.9764278, 1.374576, -0.5853381, 1, 1, 1, 1, 1,
0.9851682, -0.2603052, 1.071171, 1, 1, 1, 1, 1,
0.9868556, -0.4710539, 2.100223, 1, 1, 1, 1, 1,
0.9874688, -1.257236, 2.38628, 1, 1, 1, 1, 1,
0.9895934, -0.1227253, 0.3010447, 1, 1, 1, 1, 1,
0.9912809, -0.2158403, 0.8665244, 1, 1, 1, 1, 1,
0.9938069, 0.3963337, 1.729804, 1, 1, 1, 1, 1,
0.9956167, -1.180213, 3.17237, 1, 1, 1, 1, 1,
0.9986975, -1.641566, -1.239268, 1, 1, 1, 1, 1,
1.00335, -0.5499349, 3.696523, 1, 1, 1, 1, 1,
1.005261, 1.943393, -0.4353602, 1, 1, 1, 1, 1,
1.010857, -1.207914, 3.227628, 1, 1, 1, 1, 1,
1.019157, -0.4002199, 1.654899, 1, 1, 1, 1, 1,
1.020758, -0.02100758, 0.7620757, 1, 1, 1, 1, 1,
1.024029, -1.088894, 3.353313, 0, 0, 1, 1, 1,
1.025128, -0.4167312, 2.587817, 1, 0, 0, 1, 1,
1.025631, -1.154583, 3.396311, 1, 0, 0, 1, 1,
1.028212, -0.428489, 2.087323, 1, 0, 0, 1, 1,
1.033713, -1.03981, 2.318487, 1, 0, 0, 1, 1,
1.037944, 2.422455, 1.318326, 1, 0, 0, 1, 1,
1.040768, 0.1562781, 1.656096, 0, 0, 0, 1, 1,
1.042765, -2.044586, 3.62656, 0, 0, 0, 1, 1,
1.05184, 0.02632384, 1.510762, 0, 0, 0, 1, 1,
1.055076, -0.05239445, 1.865626, 0, 0, 0, 1, 1,
1.056847, -0.5049741, 1.230721, 0, 0, 0, 1, 1,
1.057725, -0.6067653, 1.712915, 0, 0, 0, 1, 1,
1.059817, 0.366321, 0.004229614, 0, 0, 0, 1, 1,
1.064386, -1.196667, 2.814404, 1, 1, 1, 1, 1,
1.069125, -0.2324897, 1.393223, 1, 1, 1, 1, 1,
1.069692, -0.6970353, 2.68159, 1, 1, 1, 1, 1,
1.071314, -0.4110789, 2.249331, 1, 1, 1, 1, 1,
1.073943, -0.175928, 2.698066, 1, 1, 1, 1, 1,
1.082623, -0.8884329, 4.067681, 1, 1, 1, 1, 1,
1.097701, 0.1354785, 0.383691, 1, 1, 1, 1, 1,
1.114005, -2.04325, 2.679021, 1, 1, 1, 1, 1,
1.114712, 0.1690201, 1.978939, 1, 1, 1, 1, 1,
1.116373, 0.7916903, -0.2271378, 1, 1, 1, 1, 1,
1.128888, -0.6268014, 3.434318, 1, 1, 1, 1, 1,
1.130923, -0.7395055, 2.117324, 1, 1, 1, 1, 1,
1.139374, 0.03309537, 1.491742, 1, 1, 1, 1, 1,
1.151064, -0.9143714, 0.1609438, 1, 1, 1, 1, 1,
1.153078, 0.4111381, 2.950059, 1, 1, 1, 1, 1,
1.155022, 1.188316, 2.230639, 0, 0, 1, 1, 1,
1.155834, 0.7988446, 0.8384306, 1, 0, 0, 1, 1,
1.155948, 1.186254, 1.327427, 1, 0, 0, 1, 1,
1.156085, 1.023515, 1.369591, 1, 0, 0, 1, 1,
1.158518, 1.587034, 2.754242, 1, 0, 0, 1, 1,
1.165017, 0.5188696, 3.101992, 1, 0, 0, 1, 1,
1.166066, 0.4740479, 1.47452, 0, 0, 0, 1, 1,
1.168776, 1.566123, 1.695957, 0, 0, 0, 1, 1,
1.170686, 0.4006751, 0.9962439, 0, 0, 0, 1, 1,
1.17179, -0.1417676, 1.899921, 0, 0, 0, 1, 1,
1.181459, 0.008537963, 1.350031, 0, 0, 0, 1, 1,
1.181955, -1.917426, 2.618045, 0, 0, 0, 1, 1,
1.18436, -0.01203193, 0.7743915, 0, 0, 0, 1, 1,
1.186636, 1.047208, 2.186868, 1, 1, 1, 1, 1,
1.189085, -0.9443367, 3.15645, 1, 1, 1, 1, 1,
1.202243, 1.183436, 0.2882074, 1, 1, 1, 1, 1,
1.210263, -1.809136, 3.000637, 1, 1, 1, 1, 1,
1.210825, -1.297474, 0.9032954, 1, 1, 1, 1, 1,
1.21498, 0.1042035, -1.091743, 1, 1, 1, 1, 1,
1.22079, 0.590113, 1.604524, 1, 1, 1, 1, 1,
1.224244, 1.177193, 0.8676668, 1, 1, 1, 1, 1,
1.22844, 0.9598387, -0.1332284, 1, 1, 1, 1, 1,
1.231743, -0.5162225, 2.234297, 1, 1, 1, 1, 1,
1.23526, 1.502168, -0.2578259, 1, 1, 1, 1, 1,
1.23782, 0.05301659, -0.5184256, 1, 1, 1, 1, 1,
1.238337, 1.015713, -0.4256894, 1, 1, 1, 1, 1,
1.239731, -0.4984657, 1.984125, 1, 1, 1, 1, 1,
1.249102, -0.4098883, 3.615797, 1, 1, 1, 1, 1,
1.250715, 0.5813648, 2.466408, 0, 0, 1, 1, 1,
1.252999, 1.431309, -0.3908737, 1, 0, 0, 1, 1,
1.257342, 0.7335631, 0.05946317, 1, 0, 0, 1, 1,
1.262688, 1.28283, 1.487739, 1, 0, 0, 1, 1,
1.268521, -2.379628, 4.925116, 1, 0, 0, 1, 1,
1.287731, -0.1289412, 1.593271, 1, 0, 0, 1, 1,
1.301917, 0.8906333, 1.919572, 0, 0, 0, 1, 1,
1.310858, 0.1265666, 1.124439, 0, 0, 0, 1, 1,
1.314093, 2.297611, -0.8653257, 0, 0, 0, 1, 1,
1.323671, 0.5608926, -0.2388816, 0, 0, 0, 1, 1,
1.33229, 0.8627213, -0.809695, 0, 0, 0, 1, 1,
1.335396, -0.1648461, 2.354332, 0, 0, 0, 1, 1,
1.337668, -0.1001303, 1.089723, 0, 0, 0, 1, 1,
1.3388, -0.6383439, 0.4105294, 1, 1, 1, 1, 1,
1.34349, -0.3353861, 0.519324, 1, 1, 1, 1, 1,
1.343936, -1.357259, 3.589887, 1, 1, 1, 1, 1,
1.344114, 1.621724, 0.9437997, 1, 1, 1, 1, 1,
1.348219, 1.476214, 1.515511, 1, 1, 1, 1, 1,
1.358345, -1.522064, 2.134792, 1, 1, 1, 1, 1,
1.3654, -0.1640558, -0.1408258, 1, 1, 1, 1, 1,
1.370079, 0.4534325, 0.9781179, 1, 1, 1, 1, 1,
1.374171, 1.747756, -0.4960051, 1, 1, 1, 1, 1,
1.398902, 0.2611749, 1.450524, 1, 1, 1, 1, 1,
1.400666, 0.160139, 1.373875, 1, 1, 1, 1, 1,
1.40437, 0.7579339, 0.3652759, 1, 1, 1, 1, 1,
1.406587, -0.09875956, 1.526285, 1, 1, 1, 1, 1,
1.462683, 1.033052, -0.1994816, 1, 1, 1, 1, 1,
1.464661, 0.8574628, 0.4870662, 1, 1, 1, 1, 1,
1.47645, 0.8278379, 0.1685742, 0, 0, 1, 1, 1,
1.477138, -0.5876023, 2.801523, 1, 0, 0, 1, 1,
1.493923, 0.2462092, 1.473802, 1, 0, 0, 1, 1,
1.500727, -0.3659693, 2.685001, 1, 0, 0, 1, 1,
1.519191, 1.580317, 1.653609, 1, 0, 0, 1, 1,
1.527227, 0.7554902, 0.9692048, 1, 0, 0, 1, 1,
1.541094, 0.01275171, 1.042352, 0, 0, 0, 1, 1,
1.543007, 1.315287, 0.5785102, 0, 0, 0, 1, 1,
1.543588, -1.148028, 2.897848, 0, 0, 0, 1, 1,
1.547609, 0.7529092, -1.21757, 0, 0, 0, 1, 1,
1.563479, 2.869113, 1.337716, 0, 0, 0, 1, 1,
1.582802, -0.4782144, 2.954615, 0, 0, 0, 1, 1,
1.58796, -0.07958849, 2.84228, 0, 0, 0, 1, 1,
1.592847, -1.969249, 2.457242, 1, 1, 1, 1, 1,
1.602285, -1.224934, 1.029738, 1, 1, 1, 1, 1,
1.615693, 2.027013, 1.250899, 1, 1, 1, 1, 1,
1.617726, 1.089999, 1.730635, 1, 1, 1, 1, 1,
1.632739, -0.8305233, 2.500993, 1, 1, 1, 1, 1,
1.639773, -0.9311588, 3.529063, 1, 1, 1, 1, 1,
1.649684, -0.2115544, 0.2973891, 1, 1, 1, 1, 1,
1.650781, -0.05766144, 1.855785, 1, 1, 1, 1, 1,
1.661016, 0.5520301, 0.8758197, 1, 1, 1, 1, 1,
1.67238, 0.5181376, 0.5652859, 1, 1, 1, 1, 1,
1.673634, -0.4708647, 2.910659, 1, 1, 1, 1, 1,
1.687484, -0.2021058, 2.27851, 1, 1, 1, 1, 1,
1.691197, 0.3164701, 2.691028, 1, 1, 1, 1, 1,
1.702216, 0.8688172, 2.360504, 1, 1, 1, 1, 1,
1.732571, 0.1754008, 0.8639567, 1, 1, 1, 1, 1,
1.736251, 0.9544311, 1.71869, 0, 0, 1, 1, 1,
1.76283, -1.029364, 2.000715, 1, 0, 0, 1, 1,
1.782968, 2.855877, 1.309759, 1, 0, 0, 1, 1,
1.787863, 0.5161384, -0.7749576, 1, 0, 0, 1, 1,
1.815545, -0.6270354, 1.493921, 1, 0, 0, 1, 1,
1.816808, -1.070267, 1.634382, 1, 0, 0, 1, 1,
1.819225, 0.9746352, 0.0307324, 0, 0, 0, 1, 1,
1.847949, 0.5548902, 1.697901, 0, 0, 0, 1, 1,
1.856174, -0.1925521, 1.876909, 0, 0, 0, 1, 1,
1.856639, 1.855543, 0.9597889, 0, 0, 0, 1, 1,
1.872879, -0.08851214, 1.372904, 0, 0, 0, 1, 1,
1.877115, -0.7264532, 2.763211, 0, 0, 0, 1, 1,
1.880583, 1.651686, 0.5715261, 0, 0, 0, 1, 1,
1.887099, 0.1249098, 0.7729291, 1, 1, 1, 1, 1,
1.898222, 1.910076, 0.9439008, 1, 1, 1, 1, 1,
1.936274, -1.720828, 2.05248, 1, 1, 1, 1, 1,
1.952073, -1.671622, 2.484516, 1, 1, 1, 1, 1,
1.961025, 0.9884776, 1.747353, 1, 1, 1, 1, 1,
1.98677, 1.377613, 2.902103, 1, 1, 1, 1, 1,
1.999891, 0.1282334, 1.496608, 1, 1, 1, 1, 1,
2.011362, 1.682936, 1.264373, 1, 1, 1, 1, 1,
2.019692, 1.149336, 2.056297, 1, 1, 1, 1, 1,
2.038323, 1.111422, 2.59217, 1, 1, 1, 1, 1,
2.057808, 1.489501, 0.2258168, 1, 1, 1, 1, 1,
2.063315, 0.1618409, 2.520356, 1, 1, 1, 1, 1,
2.066596, 0.5859469, 1.106397, 1, 1, 1, 1, 1,
2.066993, -2.405977, 3.185717, 1, 1, 1, 1, 1,
2.067089, -0.2682684, 1.023021, 1, 1, 1, 1, 1,
2.082211, -1.750707, 2.773563, 0, 0, 1, 1, 1,
2.114479, -0.6590656, 1.110606, 1, 0, 0, 1, 1,
2.138885, -1.17653, 1.926987, 1, 0, 0, 1, 1,
2.13917, -0.4563672, 1.107669, 1, 0, 0, 1, 1,
2.172903, -0.6675061, 4.201864, 1, 0, 0, 1, 1,
2.217399, 0.2763293, 0.5963814, 1, 0, 0, 1, 1,
2.24134, -1.770264, 1.900512, 0, 0, 0, 1, 1,
2.27908, -0.4598324, 1.404793, 0, 0, 0, 1, 1,
2.330593, -0.1867213, 0.4800255, 0, 0, 0, 1, 1,
2.342612, 0.4718871, 2.715268, 0, 0, 0, 1, 1,
2.347727, -0.5031548, 2.648148, 0, 0, 0, 1, 1,
2.356847, 1.361062, 0.449503, 0, 0, 0, 1, 1,
2.427656, -0.2868797, 2.615317, 0, 0, 0, 1, 1,
2.465812, 0.4302084, 0.7230777, 1, 1, 1, 1, 1,
2.491504, 0.4777437, 3.064979, 1, 1, 1, 1, 1,
2.494127, -1.040396, 2.589872, 1, 1, 1, 1, 1,
2.517368, 0.3507203, 0.07535813, 1, 1, 1, 1, 1,
2.529224, -1.788922, 0.5395371, 1, 1, 1, 1, 1,
3.070136, -0.7471597, 2.115484, 1, 1, 1, 1, 1,
3.562599, -0.1769436, 2.898171, 1, 1, 1, 1, 1
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
var radius = 9.818137;
var distance = 34.48579;
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
mvMatrix.translate( 0.0788908, -0.09760678, 0.2793016 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.48579);
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
