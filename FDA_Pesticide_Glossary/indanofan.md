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
-2.858601, 0.4985508, -1.183962, 1, 0, 0, 1,
-2.693986, 0.4362317, -2.620805, 1, 0.007843138, 0, 1,
-2.661102, 0.2427294, -1.319811, 1, 0.01176471, 0, 1,
-2.648479, 0.1988567, -0.9501894, 1, 0.01960784, 0, 1,
-2.498064, -0.006049132, -1.528787, 1, 0.02352941, 0, 1,
-2.493222, -0.1811711, -2.416351, 1, 0.03137255, 0, 1,
-2.485846, 0.7931064, -2.253471, 1, 0.03529412, 0, 1,
-2.484537, 0.1476506, 0.2700945, 1, 0.04313726, 0, 1,
-2.439349, -1.056744, -0.2424803, 1, 0.04705882, 0, 1,
-2.351268, 0.2308186, -0.8077299, 1, 0.05490196, 0, 1,
-2.349812, 0.3342614, 0.8209899, 1, 0.05882353, 0, 1,
-2.335726, 0.4038524, -2.413397, 1, 0.06666667, 0, 1,
-2.314418, 0.1777429, 0.3548166, 1, 0.07058824, 0, 1,
-2.313547, 0.5416373, -0.9361611, 1, 0.07843138, 0, 1,
-2.294889, 0.2920457, -0.7982544, 1, 0.08235294, 0, 1,
-2.234233, 0.6600648, -2.600593, 1, 0.09019608, 0, 1,
-2.204402, 0.7469676, -1.698778, 1, 0.09411765, 0, 1,
-2.185252, 0.1407133, -1.527453, 1, 0.1019608, 0, 1,
-2.177435, 0.005082326, -1.370064, 1, 0.1098039, 0, 1,
-2.175691, 1.060953, -1.621448, 1, 0.1137255, 0, 1,
-2.166505, 0.2378404, 1.154916, 1, 0.1215686, 0, 1,
-2.111197, 0.8836163, -1.761157, 1, 0.1254902, 0, 1,
-2.097513, 0.9309617, -1.031682, 1, 0.1333333, 0, 1,
-2.095068, 1.00674, 0.3178791, 1, 0.1372549, 0, 1,
-2.083311, -0.7141789, -1.554152, 1, 0.145098, 0, 1,
-2.070257, 1.044453, -0.8045744, 1, 0.1490196, 0, 1,
-1.991837, 0.1734686, 0.09190013, 1, 0.1568628, 0, 1,
-1.942846, -0.9775774, -2.751797, 1, 0.1607843, 0, 1,
-1.938862, 0.3244702, -2.467273, 1, 0.1686275, 0, 1,
-1.924097, -0.5731004, -1.23341, 1, 0.172549, 0, 1,
-1.909205, 1.861108, -1.745319, 1, 0.1803922, 0, 1,
-1.893014, 0.2875621, -3.509244, 1, 0.1843137, 0, 1,
-1.891444, 0.2829949, -2.468172, 1, 0.1921569, 0, 1,
-1.849199, -0.8742124, -1.555126, 1, 0.1960784, 0, 1,
-1.825983, 0.4545863, -3.21706, 1, 0.2039216, 0, 1,
-1.820643, -0.7635821, -1.686598, 1, 0.2117647, 0, 1,
-1.801121, 0.2553029, -1.679646, 1, 0.2156863, 0, 1,
-1.743881, 0.6078711, -1.795266, 1, 0.2235294, 0, 1,
-1.731087, 0.8593595, -1.297356, 1, 0.227451, 0, 1,
-1.730594, -0.05762534, -0.4987158, 1, 0.2352941, 0, 1,
-1.723438, -0.4366531, -2.390855, 1, 0.2392157, 0, 1,
-1.718979, 1.178638, -1.233016, 1, 0.2470588, 0, 1,
-1.701508, 1.152021, -0.3806489, 1, 0.2509804, 0, 1,
-1.666866, 0.5680853, -0.1598113, 1, 0.2588235, 0, 1,
-1.657783, -0.9795998, -2.202836, 1, 0.2627451, 0, 1,
-1.650781, -2.739454, -3.396049, 1, 0.2705882, 0, 1,
-1.638204, 1.660518, -2.724458, 1, 0.2745098, 0, 1,
-1.616506, 1.529277, -0.9819418, 1, 0.282353, 0, 1,
-1.602013, -0.562306, -2.063245, 1, 0.2862745, 0, 1,
-1.597833, 0.6099689, -1.184367, 1, 0.2941177, 0, 1,
-1.587037, 0.1662017, -1.21905, 1, 0.3019608, 0, 1,
-1.583956, -1.282925, -1.750988, 1, 0.3058824, 0, 1,
-1.57433, -0.5042548, -3.835742, 1, 0.3137255, 0, 1,
-1.563641, 1.432572, -1.86621, 1, 0.3176471, 0, 1,
-1.559613, 0.1066635, -1.838311, 1, 0.3254902, 0, 1,
-1.558924, 0.4037922, -3.437446, 1, 0.3294118, 0, 1,
-1.555916, -0.03526859, -0.5062342, 1, 0.3372549, 0, 1,
-1.551996, 1.093349, 0.4542783, 1, 0.3411765, 0, 1,
-1.549956, 0.01552263, -1.902595, 1, 0.3490196, 0, 1,
-1.546678, 0.3216713, -1.283405, 1, 0.3529412, 0, 1,
-1.512437, 0.9453384, -1.149363, 1, 0.3607843, 0, 1,
-1.510592, 0.273498, -1.723094, 1, 0.3647059, 0, 1,
-1.50694, 0.485525, -0.5431734, 1, 0.372549, 0, 1,
-1.491676, -2.219189, -1.956811, 1, 0.3764706, 0, 1,
-1.48593, -1.313214, -1.059822, 1, 0.3843137, 0, 1,
-1.479031, -0.2058961, -0.5778121, 1, 0.3882353, 0, 1,
-1.472466, -0.5498565, -1.979706, 1, 0.3960784, 0, 1,
-1.467841, -0.5309083, -2.61436, 1, 0.4039216, 0, 1,
-1.463646, 0.1696427, -1.220919, 1, 0.4078431, 0, 1,
-1.454714, 0.4376451, -0.6131767, 1, 0.4156863, 0, 1,
-1.448667, 0.2214269, -2.100673, 1, 0.4196078, 0, 1,
-1.448182, 1.025044, -3.094943, 1, 0.427451, 0, 1,
-1.432881, -1.230502, -2.41512, 1, 0.4313726, 0, 1,
-1.427078, -0.07573864, -2.183172, 1, 0.4392157, 0, 1,
-1.425331, 0.1958864, -1.294651, 1, 0.4431373, 0, 1,
-1.405705, -0.5713374, -3.489867, 1, 0.4509804, 0, 1,
-1.399712, 0.6123294, -0.499872, 1, 0.454902, 0, 1,
-1.393224, -2.278533, -2.94534, 1, 0.4627451, 0, 1,
-1.393055, -0.7130697, -2.570436, 1, 0.4666667, 0, 1,
-1.391998, -1.116706, -2.181792, 1, 0.4745098, 0, 1,
-1.37925, -1.929229, -2.267147, 1, 0.4784314, 0, 1,
-1.367027, 0.1140233, -3.906377, 1, 0.4862745, 0, 1,
-1.365608, 0.9886923, -0.246958, 1, 0.4901961, 0, 1,
-1.365224, -0.6559711, -0.3362426, 1, 0.4980392, 0, 1,
-1.355451, 0.9514945, -2.509126, 1, 0.5058824, 0, 1,
-1.35381, 0.7272449, -0.796106, 1, 0.509804, 0, 1,
-1.350854, 0.4044396, -2.597326, 1, 0.5176471, 0, 1,
-1.349048, 0.5711949, -1.726609, 1, 0.5215687, 0, 1,
-1.340164, 0.8901003, 1.526905, 1, 0.5294118, 0, 1,
-1.311436, 0.2271117, -2.250862, 1, 0.5333334, 0, 1,
-1.30961, 0.2555383, -1.514497, 1, 0.5411765, 0, 1,
-1.304282, -0.8819668, -2.023336, 1, 0.5450981, 0, 1,
-1.302599, -0.284191, -1.535894, 1, 0.5529412, 0, 1,
-1.295506, 0.07699696, -2.420836, 1, 0.5568628, 0, 1,
-1.295076, -0.2972703, -2.547504, 1, 0.5647059, 0, 1,
-1.294407, -0.8372839, -1.956561, 1, 0.5686275, 0, 1,
-1.292928, 0.9849261, -1.756326, 1, 0.5764706, 0, 1,
-1.292598, 0.7365023, -0.204116, 1, 0.5803922, 0, 1,
-1.290269, -1.16734, -1.409059, 1, 0.5882353, 0, 1,
-1.282568, 0.1650094, -1.615282, 1, 0.5921569, 0, 1,
-1.279732, -0.3422492, -0.4044689, 1, 0.6, 0, 1,
-1.272108, 1.21836, -0.8104053, 1, 0.6078432, 0, 1,
-1.268316, 0.5845252, -1.742581, 1, 0.6117647, 0, 1,
-1.266624, -0.7490143, -1.911103, 1, 0.6196079, 0, 1,
-1.264501, -1.045761, -3.30486, 1, 0.6235294, 0, 1,
-1.248965, 0.5013196, -1.117372, 1, 0.6313726, 0, 1,
-1.243763, 0.5267711, -2.72646, 1, 0.6352941, 0, 1,
-1.243267, -0.8619012, -1.675067, 1, 0.6431373, 0, 1,
-1.239674, 0.9416394, -0.8984743, 1, 0.6470588, 0, 1,
-1.23472, 0.4746675, -1.901217, 1, 0.654902, 0, 1,
-1.234077, 0.883938, -2.12243, 1, 0.6588235, 0, 1,
-1.221978, 0.2019818, -1.193603, 1, 0.6666667, 0, 1,
-1.215779, 1.983192, -0.5170198, 1, 0.6705883, 0, 1,
-1.21279, -1.389313, -2.352792, 1, 0.6784314, 0, 1,
-1.210075, -0.3632933, -0.6155686, 1, 0.682353, 0, 1,
-1.205593, -0.3500282, -2.64724, 1, 0.6901961, 0, 1,
-1.202146, -1.540483, -2.90988, 1, 0.6941177, 0, 1,
-1.193718, 0.5704705, -1.035707, 1, 0.7019608, 0, 1,
-1.188082, 0.927299, -0.7306432, 1, 0.7098039, 0, 1,
-1.187922, 2.140656, -1.692786, 1, 0.7137255, 0, 1,
-1.185478, -0.7630548, -0.6033164, 1, 0.7215686, 0, 1,
-1.177683, -0.4334611, -4.032986, 1, 0.7254902, 0, 1,
-1.168047, 0.5041702, -1.586013, 1, 0.7333333, 0, 1,
-1.163271, -0.5704592, -2.199204, 1, 0.7372549, 0, 1,
-1.155268, 0.86589, -1.483281, 1, 0.7450981, 0, 1,
-1.139077, -1.023193, -2.598308, 1, 0.7490196, 0, 1,
-1.132342, 0.01957821, -1.476661, 1, 0.7568628, 0, 1,
-1.131457, -0.4159997, -2.186043, 1, 0.7607843, 0, 1,
-1.130343, -0.1688707, -2.693018, 1, 0.7686275, 0, 1,
-1.128642, 1.509962, -0.2474684, 1, 0.772549, 0, 1,
-1.127033, 0.8742543, -1.683915, 1, 0.7803922, 0, 1,
-1.114094, -0.3379406, -3.225686, 1, 0.7843137, 0, 1,
-1.111012, -0.4260105, -1.388251, 1, 0.7921569, 0, 1,
-1.102932, 0.7012365, -1.15088, 1, 0.7960784, 0, 1,
-1.099998, -0.2826363, -2.282434, 1, 0.8039216, 0, 1,
-1.094472, -0.06617676, -0.9408358, 1, 0.8117647, 0, 1,
-1.089423, 0.4014251, -1.053413, 1, 0.8156863, 0, 1,
-1.089313, 2.281224, 0.04943995, 1, 0.8235294, 0, 1,
-1.085629, -1.409436, -1.645938, 1, 0.827451, 0, 1,
-1.081795, 0.7960833, -1.445147, 1, 0.8352941, 0, 1,
-1.080889, -1.83495, -1.286478, 1, 0.8392157, 0, 1,
-1.064237, -0.3182287, -0.3476625, 1, 0.8470588, 0, 1,
-1.059478, 0.6915979, -0.715914, 1, 0.8509804, 0, 1,
-1.058269, -0.4985801, -3.49959, 1, 0.8588235, 0, 1,
-1.054156, 0.1625515, -2.455936, 1, 0.8627451, 0, 1,
-1.05093, -1.05085, -4.094111, 1, 0.8705882, 0, 1,
-1.045602, -1.503325, -1.890674, 1, 0.8745098, 0, 1,
-1.042965, 0.759748, -0.9565012, 1, 0.8823529, 0, 1,
-1.039036, 1.429725, -0.8015893, 1, 0.8862745, 0, 1,
-1.037772, 0.7289925, 0.44056, 1, 0.8941177, 0, 1,
-1.035658, -1.340465, -2.860898, 1, 0.8980392, 0, 1,
-1.034607, -0.9218605, -4.415728, 1, 0.9058824, 0, 1,
-1.031824, 0.8987314, -1.930235, 1, 0.9137255, 0, 1,
-1.025809, -1.12465, -3.22622, 1, 0.9176471, 0, 1,
-1.025611, 0.05280548, -0.1555053, 1, 0.9254902, 0, 1,
-1.005853, 1.093919, -2.504221, 1, 0.9294118, 0, 1,
-1.004448, 0.3035788, -1.682721, 1, 0.9372549, 0, 1,
-0.9999488, 0.8477339, -1.357378, 1, 0.9411765, 0, 1,
-0.9992201, 0.5874664, -0.7659717, 1, 0.9490196, 0, 1,
-0.9953682, -0.0006896147, -1.47307, 1, 0.9529412, 0, 1,
-0.9940454, 0.3665433, -0.4622617, 1, 0.9607843, 0, 1,
-0.9934759, 0.361087, -3.040072, 1, 0.9647059, 0, 1,
-0.9931611, -1.241223, -1.64188, 1, 0.972549, 0, 1,
-0.9911178, 0.4532158, -1.96723, 1, 0.9764706, 0, 1,
-0.9897742, 1.283312, -1.941467, 1, 0.9843137, 0, 1,
-0.98751, -0.05122742, -1.948067, 1, 0.9882353, 0, 1,
-0.9854591, 0.03097975, -1.002647, 1, 0.9960784, 0, 1,
-0.9830189, 1.125284, -1.012143, 0.9960784, 1, 0, 1,
-0.9699186, -0.2732464, -3.848193, 0.9921569, 1, 0, 1,
-0.9655473, -0.1528305, -3.071685, 0.9843137, 1, 0, 1,
-0.9593414, 0.3918821, -0.9403726, 0.9803922, 1, 0, 1,
-0.9573771, 2.009065, -1.799704, 0.972549, 1, 0, 1,
-0.9531174, -0.9932535, -1.761235, 0.9686275, 1, 0, 1,
-0.9523849, 0.4967101, -1.148287, 0.9607843, 1, 0, 1,
-0.9435706, 0.4112366, -0.5397269, 0.9568627, 1, 0, 1,
-0.9324831, 0.0530346, -2.889007, 0.9490196, 1, 0, 1,
-0.9312286, 2.179017, 0.1554713, 0.945098, 1, 0, 1,
-0.9308924, 0.3025463, -0.8611069, 0.9372549, 1, 0, 1,
-0.9305831, -2.112596, -3.387289, 0.9333333, 1, 0, 1,
-0.925401, -0.481623, -1.792421, 0.9254902, 1, 0, 1,
-0.9163029, 1.363907, -1.079955, 0.9215686, 1, 0, 1,
-0.9120558, 0.06655117, -2.084027, 0.9137255, 1, 0, 1,
-0.9016806, -0.05629201, -1.605447, 0.9098039, 1, 0, 1,
-0.8990078, 0.970601, -1.704082, 0.9019608, 1, 0, 1,
-0.8988596, -0.02096701, -0.9336025, 0.8941177, 1, 0, 1,
-0.898814, -0.8113953, -1.13369, 0.8901961, 1, 0, 1,
-0.8961352, -0.1137645, -0.3390508, 0.8823529, 1, 0, 1,
-0.8947192, 0.4052796, -1.331028, 0.8784314, 1, 0, 1,
-0.8776557, -0.3467806, -2.037927, 0.8705882, 1, 0, 1,
-0.873989, -0.2841846, -0.7292988, 0.8666667, 1, 0, 1,
-0.8719465, -0.9600453, -2.123614, 0.8588235, 1, 0, 1,
-0.869247, -0.02261998, -1.256136, 0.854902, 1, 0, 1,
-0.8668275, 0.4216946, -0.04152573, 0.8470588, 1, 0, 1,
-0.8666666, 0.7531647, -0.4979285, 0.8431373, 1, 0, 1,
-0.8606156, -1.010545, -2.14613, 0.8352941, 1, 0, 1,
-0.8600265, 1.216098, -0.874566, 0.8313726, 1, 0, 1,
-0.8554144, -1.074172, -1.589303, 0.8235294, 1, 0, 1,
-0.8491216, 0.2250379, -1.002763, 0.8196079, 1, 0, 1,
-0.8471487, 0.5543034, 0.2156183, 0.8117647, 1, 0, 1,
-0.8364235, 0.6725937, -0.273149, 0.8078431, 1, 0, 1,
-0.8363317, 0.3685656, -3.080633, 0.8, 1, 0, 1,
-0.8355774, -0.9286479, -2.328022, 0.7921569, 1, 0, 1,
-0.8333032, -0.6065878, -2.817179, 0.7882353, 1, 0, 1,
-0.8299243, 0.5780122, -1.691624, 0.7803922, 1, 0, 1,
-0.8284692, -0.2084054, -2.237687, 0.7764706, 1, 0, 1,
-0.8267541, 0.09021089, 0.1690697, 0.7686275, 1, 0, 1,
-0.8239954, 0.4399975, -2.145548, 0.7647059, 1, 0, 1,
-0.8154135, 0.1505521, -0.9278933, 0.7568628, 1, 0, 1,
-0.8141209, 2.304885, 0.1108133, 0.7529412, 1, 0, 1,
-0.8119238, -0.09253264, -1.80178, 0.7450981, 1, 0, 1,
-0.8102184, -0.179028, -1.567677, 0.7411765, 1, 0, 1,
-0.8099704, 0.4111135, -2.700266, 0.7333333, 1, 0, 1,
-0.8093772, -0.5771921, -1.808996, 0.7294118, 1, 0, 1,
-0.8060275, -0.3646823, -1.314989, 0.7215686, 1, 0, 1,
-0.8041383, 0.2650016, -2.626272, 0.7176471, 1, 0, 1,
-0.8033469, 0.9715784, -1.111317, 0.7098039, 1, 0, 1,
-0.798691, -1.851867, -1.914957, 0.7058824, 1, 0, 1,
-0.7980457, -0.02364418, -1.466956, 0.6980392, 1, 0, 1,
-0.7940818, -0.9926783, -2.091712, 0.6901961, 1, 0, 1,
-0.7939297, 0.3911257, -0.8223622, 0.6862745, 1, 0, 1,
-0.788435, 0.6278448, 1.025445, 0.6784314, 1, 0, 1,
-0.7871037, 1.462286, 2.036975, 0.6745098, 1, 0, 1,
-0.7830279, 0.7122052, -1.316068, 0.6666667, 1, 0, 1,
-0.7827461, 0.1354622, -1.526891, 0.6627451, 1, 0, 1,
-0.7755483, -0.6192315, -2.074164, 0.654902, 1, 0, 1,
-0.7746536, -0.7465519, -3.360904, 0.6509804, 1, 0, 1,
-0.7616366, 0.5486056, -0.8836139, 0.6431373, 1, 0, 1,
-0.7598564, 0.007712635, -1.595557, 0.6392157, 1, 0, 1,
-0.7558756, -1.06666, -3.63951, 0.6313726, 1, 0, 1,
-0.7531328, -0.2601882, -3.074908, 0.627451, 1, 0, 1,
-0.7506117, 1.20468, -1.723582, 0.6196079, 1, 0, 1,
-0.7494264, -0.2767234, -2.960517, 0.6156863, 1, 0, 1,
-0.7493696, 0.2691811, 0.1891907, 0.6078432, 1, 0, 1,
-0.7364212, 0.6785263, -1.528592, 0.6039216, 1, 0, 1,
-0.7324535, -0.3297017, -1.081724, 0.5960785, 1, 0, 1,
-0.7310107, -0.3281762, -0.387219, 0.5882353, 1, 0, 1,
-0.7293018, 1.050228, -0.09918322, 0.5843138, 1, 0, 1,
-0.7268821, -0.3230188, -1.074127, 0.5764706, 1, 0, 1,
-0.721579, 0.1629905, 0.3059964, 0.572549, 1, 0, 1,
-0.712955, 0.2817718, -0.7445498, 0.5647059, 1, 0, 1,
-0.7089674, -0.09559676, -1.612262, 0.5607843, 1, 0, 1,
-0.7038969, 1.295476, 0.9105032, 0.5529412, 1, 0, 1,
-0.7015232, -0.09815441, -0.9502063, 0.5490196, 1, 0, 1,
-0.695597, -1.28684, -4.318828, 0.5411765, 1, 0, 1,
-0.6907519, 0.2062956, -0.1826286, 0.5372549, 1, 0, 1,
-0.6895421, 1.059747, -0.5273127, 0.5294118, 1, 0, 1,
-0.6867861, -0.8824561, -2.115092, 0.5254902, 1, 0, 1,
-0.6846634, 1.071674, -2.035654, 0.5176471, 1, 0, 1,
-0.6838835, -0.09174568, -0.8991328, 0.5137255, 1, 0, 1,
-0.6781833, 1.152516, -0.7736494, 0.5058824, 1, 0, 1,
-0.6769738, -1.597306, -4.141287, 0.5019608, 1, 0, 1,
-0.6741268, 0.3438187, -1.315584, 0.4941176, 1, 0, 1,
-0.6740196, 0.09569491, -0.6226757, 0.4862745, 1, 0, 1,
-0.6691228, 0.3594355, -0.9804315, 0.4823529, 1, 0, 1,
-0.6651409, 0.6124907, -0.2129926, 0.4745098, 1, 0, 1,
-0.6638467, 0.5561453, -3.976531, 0.4705882, 1, 0, 1,
-0.6602467, 2.417299, 0.211821, 0.4627451, 1, 0, 1,
-0.6553476, -0.2945636, -1.679981, 0.4588235, 1, 0, 1,
-0.6510591, 0.6456176, -0.9833896, 0.4509804, 1, 0, 1,
-0.6484134, -0.3367887, -2.034646, 0.4470588, 1, 0, 1,
-0.6470366, -0.1145309, -2.518806, 0.4392157, 1, 0, 1,
-0.6465312, -1.237897, -4.250707, 0.4352941, 1, 0, 1,
-0.6456755, 0.1369837, -0.5280321, 0.427451, 1, 0, 1,
-0.6401798, -0.1215648, -2.719064, 0.4235294, 1, 0, 1,
-0.6336166, 0.775335, -2.184596, 0.4156863, 1, 0, 1,
-0.6285881, 1.024711, -0.04916087, 0.4117647, 1, 0, 1,
-0.6268359, -0.4570243, -3.078347, 0.4039216, 1, 0, 1,
-0.6249456, 1.3776, -1.218972, 0.3960784, 1, 0, 1,
-0.6230622, -0.05747892, -1.705933, 0.3921569, 1, 0, 1,
-0.6227682, -0.8989947, -3.107081, 0.3843137, 1, 0, 1,
-0.622328, 1.076719, -3.162294, 0.3803922, 1, 0, 1,
-0.6188551, -1.669317, -1.998088, 0.372549, 1, 0, 1,
-0.6087378, 1.048784, -0.5634445, 0.3686275, 1, 0, 1,
-0.6085822, -0.7729073, -1.028394, 0.3607843, 1, 0, 1,
-0.6058281, 0.3713789, 0.2108937, 0.3568628, 1, 0, 1,
-0.6004074, -0.6229755, -3.298951, 0.3490196, 1, 0, 1,
-0.5998481, -0.2541155, -1.306026, 0.345098, 1, 0, 1,
-0.5957063, -1.230023, -2.851934, 0.3372549, 1, 0, 1,
-0.5933067, 1.441955, 1.659487, 0.3333333, 1, 0, 1,
-0.5892375, -1.128159, -1.60107, 0.3254902, 1, 0, 1,
-0.5871252, 0.1831127, -0.4088679, 0.3215686, 1, 0, 1,
-0.5857925, -0.03124943, -1.394148, 0.3137255, 1, 0, 1,
-0.5831761, -1.707306, -3.862982, 0.3098039, 1, 0, 1,
-0.5831072, 1.845132, 1.519736, 0.3019608, 1, 0, 1,
-0.582532, 0.0820081, -0.3696951, 0.2941177, 1, 0, 1,
-0.5774561, -1.716853, -4.65176, 0.2901961, 1, 0, 1,
-0.5632413, 0.6576421, 0.5888222, 0.282353, 1, 0, 1,
-0.5626332, -0.8506221, -2.349761, 0.2784314, 1, 0, 1,
-0.5622799, -1.014517, -1.879476, 0.2705882, 1, 0, 1,
-0.5616351, 0.7279512, -0.2647643, 0.2666667, 1, 0, 1,
-0.5569558, 0.3878244, -1.654312, 0.2588235, 1, 0, 1,
-0.5556986, 1.410392, -1.491385, 0.254902, 1, 0, 1,
-0.5439747, -0.2959726, -1.85511, 0.2470588, 1, 0, 1,
-0.5429066, 1.311089, 0.9098436, 0.2431373, 1, 0, 1,
-0.5394881, -0.5708925, -1.560702, 0.2352941, 1, 0, 1,
-0.5295555, 0.819923, 0.4179569, 0.2313726, 1, 0, 1,
-0.5292237, 0.5510338, 0.2258047, 0.2235294, 1, 0, 1,
-0.5224116, -2.016066, -2.243118, 0.2196078, 1, 0, 1,
-0.5206689, 0.2104036, -1.027411, 0.2117647, 1, 0, 1,
-0.519913, 0.7374908, -1.127053, 0.2078431, 1, 0, 1,
-0.5125045, -0.4978799, -0.5613425, 0.2, 1, 0, 1,
-0.5102143, 0.4166127, -1.302463, 0.1921569, 1, 0, 1,
-0.5060713, 0.766739, 0.2674752, 0.1882353, 1, 0, 1,
-0.499121, -1.196105, -3.222156, 0.1803922, 1, 0, 1,
-0.4986004, 0.6962328, 0.780917, 0.1764706, 1, 0, 1,
-0.4923503, -0.5716112, -1.617102, 0.1686275, 1, 0, 1,
-0.4921444, 1.271889, -0.09416318, 0.1647059, 1, 0, 1,
-0.475908, -1.03828, -2.602978, 0.1568628, 1, 0, 1,
-0.4752519, 1.59702, -1.279334, 0.1529412, 1, 0, 1,
-0.4738612, 1.385509, -0.4949509, 0.145098, 1, 0, 1,
-0.4730268, 0.5682983, -1.791293, 0.1411765, 1, 0, 1,
-0.4708104, 0.55735, 0.843505, 0.1333333, 1, 0, 1,
-0.4703985, 0.9230594, -1.272192, 0.1294118, 1, 0, 1,
-0.4688035, 0.5693578, -1.217576, 0.1215686, 1, 0, 1,
-0.4675208, -0.3366727, -1.330044, 0.1176471, 1, 0, 1,
-0.4643137, -0.9783736, -2.280774, 0.1098039, 1, 0, 1,
-0.4633599, 0.5528326, -0.04814891, 0.1058824, 1, 0, 1,
-0.4632576, 0.3802696, -0.8354888, 0.09803922, 1, 0, 1,
-0.4625593, -2.02741, -3.105929, 0.09019608, 1, 0, 1,
-0.4617774, 0.1146657, -1.71751, 0.08627451, 1, 0, 1,
-0.4553266, -0.05901416, 0.4198071, 0.07843138, 1, 0, 1,
-0.4546074, -1.185963, -2.067272, 0.07450981, 1, 0, 1,
-0.4519165, -0.7263507, -2.231467, 0.06666667, 1, 0, 1,
-0.4449748, -0.1857443, -1.895964, 0.0627451, 1, 0, 1,
-0.4437091, -0.4387755, -2.577788, 0.05490196, 1, 0, 1,
-0.4408108, 0.3806865, -0.9679634, 0.05098039, 1, 0, 1,
-0.4376419, -0.1613327, -0.8551285, 0.04313726, 1, 0, 1,
-0.431087, 3.540385, 0.5323614, 0.03921569, 1, 0, 1,
-0.4297666, -0.5595316, -3.613156, 0.03137255, 1, 0, 1,
-0.4280315, -0.2052801, -0.9724514, 0.02745098, 1, 0, 1,
-0.4279675, -0.02267515, -3.419584, 0.01960784, 1, 0, 1,
-0.4265318, 0.6078207, 0.3565415, 0.01568628, 1, 0, 1,
-0.4225965, 0.2344823, -0.4787074, 0.007843138, 1, 0, 1,
-0.4206511, -0.9246503, -1.401931, 0.003921569, 1, 0, 1,
-0.4198035, 0.4949948, -2.160456, 0, 1, 0.003921569, 1,
-0.4194551, 0.1862892, -0.06382941, 0, 1, 0.01176471, 1,
-0.4186434, -0.3109713, -1.710981, 0, 1, 0.01568628, 1,
-0.4117698, 0.2430592, 0.2935345, 0, 1, 0.02352941, 1,
-0.4109622, 1.06153, 0.3503075, 0, 1, 0.02745098, 1,
-0.4060189, -0.1273591, -3.108363, 0, 1, 0.03529412, 1,
-0.4037921, 1.71782, 0.9218048, 0, 1, 0.03921569, 1,
-0.4032708, -0.2252215, -4.323832, 0, 1, 0.04705882, 1,
-0.3899049, 0.8373165, -0.7780704, 0, 1, 0.05098039, 1,
-0.3886944, -2.414864, -2.601792, 0, 1, 0.05882353, 1,
-0.3870542, 0.007637642, -2.140089, 0, 1, 0.0627451, 1,
-0.3852063, -0.6721061, -1.680886, 0, 1, 0.07058824, 1,
-0.3831413, -0.0402325, -1.630878, 0, 1, 0.07450981, 1,
-0.3831306, 1.260109, -1.762435, 0, 1, 0.08235294, 1,
-0.3820924, -0.3729517, -2.333961, 0, 1, 0.08627451, 1,
-0.3817327, 0.6973274, -1.90013, 0, 1, 0.09411765, 1,
-0.3798899, -0.4484244, -2.753245, 0, 1, 0.1019608, 1,
-0.3798833, 0.4658217, -2.689327, 0, 1, 0.1058824, 1,
-0.3790622, -0.1332972, -1.621338, 0, 1, 0.1137255, 1,
-0.3772479, -1.230298, -3.105626, 0, 1, 0.1176471, 1,
-0.376267, 0.3328218, -1.909052, 0, 1, 0.1254902, 1,
-0.3757425, -0.4484968, -1.255025, 0, 1, 0.1294118, 1,
-0.3745142, -0.02497832, -3.607191, 0, 1, 0.1372549, 1,
-0.3716297, 1.203796, 0.4220617, 0, 1, 0.1411765, 1,
-0.3697359, 0.526118, -0.8942329, 0, 1, 0.1490196, 1,
-0.3689214, 0.210236, -0.6911574, 0, 1, 0.1529412, 1,
-0.3683203, -1.576556, -2.867441, 0, 1, 0.1607843, 1,
-0.3648956, 0.5786186, -0.531234, 0, 1, 0.1647059, 1,
-0.3625169, -1.497952, -2.661186, 0, 1, 0.172549, 1,
-0.3551374, -0.6092363, -4.055695, 0, 1, 0.1764706, 1,
-0.3515558, -1.591449, -3.163028, 0, 1, 0.1843137, 1,
-0.350215, 0.7585646, -2.37071, 0, 1, 0.1882353, 1,
-0.3498147, 0.04398351, -2.327249, 0, 1, 0.1960784, 1,
-0.348078, -0.829089, -1.716466, 0, 1, 0.2039216, 1,
-0.3477453, -1.332424, -4.06533, 0, 1, 0.2078431, 1,
-0.342661, -0.5152487, -0.9607893, 0, 1, 0.2156863, 1,
-0.3415159, -0.4203685, -1.391078, 0, 1, 0.2196078, 1,
-0.34051, -0.04614436, -3.494265, 0, 1, 0.227451, 1,
-0.3379356, -0.1602644, -1.694181, 0, 1, 0.2313726, 1,
-0.3377557, -0.2463686, -1.554891, 0, 1, 0.2392157, 1,
-0.3352917, -1.865473, -2.751158, 0, 1, 0.2431373, 1,
-0.3344199, -1.774114, -3.717604, 0, 1, 0.2509804, 1,
-0.3329248, -0.761196, -3.19308, 0, 1, 0.254902, 1,
-0.3294869, 1.492758, 1.09109, 0, 1, 0.2627451, 1,
-0.3292356, 0.6174634, 0.6958643, 0, 1, 0.2666667, 1,
-0.3288209, -0.4568093, -0.816108, 0, 1, 0.2745098, 1,
-0.3217672, -1.943868, -2.655988, 0, 1, 0.2784314, 1,
-0.3198187, 1.208583, 1.021109, 0, 1, 0.2862745, 1,
-0.3169765, -0.7130202, -2.256657, 0, 1, 0.2901961, 1,
-0.3129987, -0.3183136, -1.66882, 0, 1, 0.2980392, 1,
-0.3129837, 0.9677173, -1.69726, 0, 1, 0.3058824, 1,
-0.3115185, 1.271564, 1.786667, 0, 1, 0.3098039, 1,
-0.3074643, -0.6792184, -3.263322, 0, 1, 0.3176471, 1,
-0.3066395, 0.1356625, 0.1757921, 0, 1, 0.3215686, 1,
-0.3056843, -1.885839, -3.077761, 0, 1, 0.3294118, 1,
-0.3025268, 0.5215517, -0.9397998, 0, 1, 0.3333333, 1,
-0.3016534, 0.6982775, -0.5592379, 0, 1, 0.3411765, 1,
-0.3016407, 0.1796653, -0.3775834, 0, 1, 0.345098, 1,
-0.3011552, -1.283136, -2.698389, 0, 1, 0.3529412, 1,
-0.3009636, -0.9812137, -2.686373, 0, 1, 0.3568628, 1,
-0.2988773, -0.3437038, -0.6480837, 0, 1, 0.3647059, 1,
-0.2915335, -1.480461, -3.465806, 0, 1, 0.3686275, 1,
-0.2909935, 1.770947, 0.4750513, 0, 1, 0.3764706, 1,
-0.2779779, 0.8409663, -0.4094878, 0, 1, 0.3803922, 1,
-0.2737688, 0.8864204, 0.4227948, 0, 1, 0.3882353, 1,
-0.2708091, 0.2418191, 0.1010359, 0, 1, 0.3921569, 1,
-0.2695539, -0.3111866, 0.04055936, 0, 1, 0.4, 1,
-0.266102, 2.520415, 0.1124023, 0, 1, 0.4078431, 1,
-0.2659186, -0.5503585, -1.242964, 0, 1, 0.4117647, 1,
-0.2635094, -0.7525002, -3.577611, 0, 1, 0.4196078, 1,
-0.257564, 0.02882934, -0.8118883, 0, 1, 0.4235294, 1,
-0.2531586, 1.97474, -2.451516, 0, 1, 0.4313726, 1,
-0.2467739, -1.087374, -3.185238, 0, 1, 0.4352941, 1,
-0.2440891, -0.09951476, -1.146914, 0, 1, 0.4431373, 1,
-0.2416606, -0.4047264, -3.243108, 0, 1, 0.4470588, 1,
-0.2355146, -1.211877, -3.506013, 0, 1, 0.454902, 1,
-0.2348456, 1.503813, -0.538374, 0, 1, 0.4588235, 1,
-0.228918, 0.1198557, -1.986506, 0, 1, 0.4666667, 1,
-0.2266343, -1.276776, -2.68055, 0, 1, 0.4705882, 1,
-0.2222952, -0.5830597, -3.801863, 0, 1, 0.4784314, 1,
-0.2180358, 0.2547601, -0.5610371, 0, 1, 0.4823529, 1,
-0.2134222, 0.7443032, 0.6326501, 0, 1, 0.4901961, 1,
-0.2130281, 0.1118052, -1.976443, 0, 1, 0.4941176, 1,
-0.2124467, -0.1864274, -0.4242178, 0, 1, 0.5019608, 1,
-0.2085174, -1.153255, -3.508943, 0, 1, 0.509804, 1,
-0.2032138, 0.8474498, -1.777297, 0, 1, 0.5137255, 1,
-0.2027042, 0.7833405, -0.8462092, 0, 1, 0.5215687, 1,
-0.2025342, -2.292217, -5.070214, 0, 1, 0.5254902, 1,
-0.2015522, -1.216175, -2.834632, 0, 1, 0.5333334, 1,
-0.2014553, -1.449583, -2.783405, 0, 1, 0.5372549, 1,
-0.2000563, -0.370901, -1.991462, 0, 1, 0.5450981, 1,
-0.1980585, 1.193087, -0.4845072, 0, 1, 0.5490196, 1,
-0.1958201, -0.69029, -1.933644, 0, 1, 0.5568628, 1,
-0.1954791, -0.03587122, -1.548685, 0, 1, 0.5607843, 1,
-0.1724019, -0.3626336, -2.960723, 0, 1, 0.5686275, 1,
-0.1696864, -0.09212399, -1.517031, 0, 1, 0.572549, 1,
-0.1680647, 0.3615972, -2.205026, 0, 1, 0.5803922, 1,
-0.1664953, 1.126552, 0.9194978, 0, 1, 0.5843138, 1,
-0.1657907, 1.415329, 2.592767, 0, 1, 0.5921569, 1,
-0.1650606, -0.3569837, -3.393497, 0, 1, 0.5960785, 1,
-0.1607843, -0.5080199, -2.835653, 0, 1, 0.6039216, 1,
-0.1592131, 0.1601384, 0.7936636, 0, 1, 0.6117647, 1,
-0.1523571, -0.0109484, -2.364861, 0, 1, 0.6156863, 1,
-0.1481985, -1.177065, -2.88714, 0, 1, 0.6235294, 1,
-0.1475272, 1.157237, -0.08010612, 0, 1, 0.627451, 1,
-0.1449141, 0.5335813, -0.7265503, 0, 1, 0.6352941, 1,
-0.1395363, 1.256353, -0.07153296, 0, 1, 0.6392157, 1,
-0.1395129, 1.380805, 0.4933373, 0, 1, 0.6470588, 1,
-0.1359121, -1.080977, -4.478871, 0, 1, 0.6509804, 1,
-0.1355789, 0.7031293, -0.4157007, 0, 1, 0.6588235, 1,
-0.133243, -1.449391, -1.675659, 0, 1, 0.6627451, 1,
-0.131322, -0.9526732, -1.429236, 0, 1, 0.6705883, 1,
-0.1289055, 0.09594711, -0.1221019, 0, 1, 0.6745098, 1,
-0.1261687, 0.4683627, -0.8095427, 0, 1, 0.682353, 1,
-0.1232434, -0.9525778, -2.528649, 0, 1, 0.6862745, 1,
-0.1204059, -0.5755617, -1.723322, 0, 1, 0.6941177, 1,
-0.1179803, 0.4397745, 0.736146, 0, 1, 0.7019608, 1,
-0.1168564, 0.69635, -0.9911164, 0, 1, 0.7058824, 1,
-0.1119762, -0.6178868, -4.960563, 0, 1, 0.7137255, 1,
-0.1102781, 0.8464528, 1.120654, 0, 1, 0.7176471, 1,
-0.1098403, -1.481215, -3.510611, 0, 1, 0.7254902, 1,
-0.1095851, 2.017333, 0.3999683, 0, 1, 0.7294118, 1,
-0.1024812, 0.4040017, -0.07560763, 0, 1, 0.7372549, 1,
-0.1010547, -1.405, -3.908735, 0, 1, 0.7411765, 1,
-0.09973719, -1.598764, -2.609115, 0, 1, 0.7490196, 1,
-0.09892172, 0.3181762, 0.7130516, 0, 1, 0.7529412, 1,
-0.09589338, 1.20087, 0.9246342, 0, 1, 0.7607843, 1,
-0.09450928, 0.2835493, -0.9115732, 0, 1, 0.7647059, 1,
-0.09218609, -0.9022209, -3.873612, 0, 1, 0.772549, 1,
-0.09210818, 0.3532472, -0.4997964, 0, 1, 0.7764706, 1,
-0.08217687, -1.401111, -3.632178, 0, 1, 0.7843137, 1,
-0.07935973, 0.04537669, -0.06518985, 0, 1, 0.7882353, 1,
-0.07901014, -0.9307494, -2.197091, 0, 1, 0.7960784, 1,
-0.07344511, -0.9025984, -2.11348, 0, 1, 0.8039216, 1,
-0.06987116, 0.9195363, 0.1413751, 0, 1, 0.8078431, 1,
-0.06796635, 0.1732349, 0.02762292, 0, 1, 0.8156863, 1,
-0.06730057, 0.7201825, -2.251007, 0, 1, 0.8196079, 1,
-0.06483443, 0.5164039, 0.3715339, 0, 1, 0.827451, 1,
-0.06276274, -0.4352717, -1.877327, 0, 1, 0.8313726, 1,
-0.05827883, -1.659055, -4.374024, 0, 1, 0.8392157, 1,
-0.05648959, 0.8111037, -1.60173, 0, 1, 0.8431373, 1,
-0.04744798, -1.017121, -2.75023, 0, 1, 0.8509804, 1,
-0.04448919, -1.04298, -3.606076, 0, 1, 0.854902, 1,
-0.03714171, -0.338737, -3.364476, 0, 1, 0.8627451, 1,
-0.03316457, -1.263727, -3.742513, 0, 1, 0.8666667, 1,
-0.03088403, -0.3313333, -2.405073, 0, 1, 0.8745098, 1,
-0.03065071, 0.2806733, 0.1906205, 0, 1, 0.8784314, 1,
-0.02592834, 0.5959981, 0.4030245, 0, 1, 0.8862745, 1,
-0.02538746, 1.35588, 1.340582, 0, 1, 0.8901961, 1,
-0.02120838, 0.8852868, -0.4830635, 0, 1, 0.8980392, 1,
-0.02078975, 0.7009374, 0.8835354, 0, 1, 0.9058824, 1,
-0.01510508, -1.492659, -3.32121, 0, 1, 0.9098039, 1,
-0.01258001, 0.2048483, 1.457585, 0, 1, 0.9176471, 1,
-0.01174498, 0.30656, 0.4889104, 0, 1, 0.9215686, 1,
-0.0116074, -1.12315, -3.378506, 0, 1, 0.9294118, 1,
-0.01104579, -1.373109, -3.011247, 0, 1, 0.9333333, 1,
-0.01050956, 0.6776838, 1.648761, 0, 1, 0.9411765, 1,
-0.01029824, -1.307818, -4.191946, 0, 1, 0.945098, 1,
-0.01022575, -0.4501374, -4.818043, 0, 1, 0.9529412, 1,
-0.007290774, -0.6633239, -3.476019, 0, 1, 0.9568627, 1,
-0.006531862, -2.402616, -4.99473, 0, 1, 0.9647059, 1,
-0.005372828, -0.583091, -6.265514, 0, 1, 0.9686275, 1,
-0.004057817, 0.1811809, 0.1201243, 0, 1, 0.9764706, 1,
-0.003945244, -1.063175, -2.931032, 0, 1, 0.9803922, 1,
-0.0009059252, 0.529043, -1.647197, 0, 1, 0.9882353, 1,
0.004229789, -0.2730115, 5.464517, 0, 1, 0.9921569, 1,
0.01077238, 0.08879359, 0.9468851, 0, 1, 1, 1,
0.0153251, 0.3803934, 0.2149393, 0, 0.9921569, 1, 1,
0.0192384, 0.002484574, 1.990977, 0, 0.9882353, 1, 1,
0.01970653, -1.043847, 3.423058, 0, 0.9803922, 1, 1,
0.01973817, -2.787871, 3.503388, 0, 0.9764706, 1, 1,
0.02165629, -0.09478931, 1.183607, 0, 0.9686275, 1, 1,
0.02504846, 0.4233843, -0.6980322, 0, 0.9647059, 1, 1,
0.0263235, 0.4175813, 1.175088, 0, 0.9568627, 1, 1,
0.03002309, 0.4517442, 0.6900456, 0, 0.9529412, 1, 1,
0.03669854, 0.02660457, -0.1097974, 0, 0.945098, 1, 1,
0.04004709, 0.2141579, 1.182284, 0, 0.9411765, 1, 1,
0.04823489, 0.1353806, 0.8876502, 0, 0.9333333, 1, 1,
0.05309328, -0.05729323, 4.096385, 0, 0.9294118, 1, 1,
0.05377435, 1.093256, -0.7912837, 0, 0.9215686, 1, 1,
0.05447907, 0.8946585, 0.7000852, 0, 0.9176471, 1, 1,
0.06108313, -0.7209857, 4.027582, 0, 0.9098039, 1, 1,
0.06351654, 0.5667736, 0.4338516, 0, 0.9058824, 1, 1,
0.06435929, 0.4151473, -0.5231885, 0, 0.8980392, 1, 1,
0.06545104, -0.4078789, 2.514875, 0, 0.8901961, 1, 1,
0.07157752, -1.102546, 2.414275, 0, 0.8862745, 1, 1,
0.07166142, 0.1707148, 1.98687, 0, 0.8784314, 1, 1,
0.0727847, -0.04033672, 0.997115, 0, 0.8745098, 1, 1,
0.07551271, -0.2153175, 2.740077, 0, 0.8666667, 1, 1,
0.07596252, -0.06188277, 1.650094, 0, 0.8627451, 1, 1,
0.07656487, -0.3167314, 1.994535, 0, 0.854902, 1, 1,
0.08501043, -1.096576, 2.433326, 0, 0.8509804, 1, 1,
0.08539753, -0.5056335, 2.853268, 0, 0.8431373, 1, 1,
0.08808874, -0.01582398, 2.244176, 0, 0.8392157, 1, 1,
0.08809083, -0.3057752, 3.553037, 0, 0.8313726, 1, 1,
0.08993252, -0.3471225, 3.1826, 0, 0.827451, 1, 1,
0.09021585, 0.001315161, 1.774791, 0, 0.8196079, 1, 1,
0.09081807, -1.922442, 2.997293, 0, 0.8156863, 1, 1,
0.09227064, 0.105801, -0.4529303, 0, 0.8078431, 1, 1,
0.09283106, 0.696197, -0.5721056, 0, 0.8039216, 1, 1,
0.09961684, 0.2247828, 1.225773, 0, 0.7960784, 1, 1,
0.1013421, 0.7892064, -0.7935479, 0, 0.7882353, 1, 1,
0.1054448, 0.355276, 1.673786, 0, 0.7843137, 1, 1,
0.1087495, -1.299181, 2.218889, 0, 0.7764706, 1, 1,
0.1096904, -0.5643196, 2.623936, 0, 0.772549, 1, 1,
0.1131076, -1.327922, 2.349261, 0, 0.7647059, 1, 1,
0.1145036, -0.4316891, 2.260905, 0, 0.7607843, 1, 1,
0.1149761, -0.1757263, 2.299362, 0, 0.7529412, 1, 1,
0.1170698, -0.7798163, 3.4706, 0, 0.7490196, 1, 1,
0.1188675, -0.6356938, 3.410475, 0, 0.7411765, 1, 1,
0.1242384, 1.399643, -0.5074753, 0, 0.7372549, 1, 1,
0.1288672, -0.07721796, 1.122653, 0, 0.7294118, 1, 1,
0.133858, 0.9748335, -1.970764, 0, 0.7254902, 1, 1,
0.137391, 0.6446442, 0.7275449, 0, 0.7176471, 1, 1,
0.1422061, -0.5226267, 1.482733, 0, 0.7137255, 1, 1,
0.1448292, -0.6350247, 2.802443, 0, 0.7058824, 1, 1,
0.1501896, 0.7804473, -0.6137203, 0, 0.6980392, 1, 1,
0.1521725, -2.27665, 3.472141, 0, 0.6941177, 1, 1,
0.1523439, -0.4341358, 2.877548, 0, 0.6862745, 1, 1,
0.1529084, -0.05032452, 1.043965, 0, 0.682353, 1, 1,
0.1547706, -2.099679, 2.002276, 0, 0.6745098, 1, 1,
0.1560637, 0.3006075, -1.126054, 0, 0.6705883, 1, 1,
0.1580603, 0.6250967, 0.8988318, 0, 0.6627451, 1, 1,
0.1592833, 1.546033, 0.03254342, 0, 0.6588235, 1, 1,
0.1609143, 1.730722, 1.286465, 0, 0.6509804, 1, 1,
0.1631001, 0.925231, 1.591545, 0, 0.6470588, 1, 1,
0.164162, 0.1136523, 0.5237686, 0, 0.6392157, 1, 1,
0.1671593, -0.3014373, 2.040378, 0, 0.6352941, 1, 1,
0.1675007, 2.293682, -0.2694684, 0, 0.627451, 1, 1,
0.1676176, 0.799741, -1.190902, 0, 0.6235294, 1, 1,
0.1684434, -0.9138684, 5.126941, 0, 0.6156863, 1, 1,
0.1685503, 1.256501, 2.223359, 0, 0.6117647, 1, 1,
0.169679, 1.082412, 1.196501, 0, 0.6039216, 1, 1,
0.1716225, -0.2335163, 4.010474, 0, 0.5960785, 1, 1,
0.1720634, -0.3936671, 3.581228, 0, 0.5921569, 1, 1,
0.1726687, 0.447396, 0.7477849, 0, 0.5843138, 1, 1,
0.1766297, -0.6131296, 1.274351, 0, 0.5803922, 1, 1,
0.1803635, 1.138448, 0.9726443, 0, 0.572549, 1, 1,
0.1812269, 1.233498, -0.5559772, 0, 0.5686275, 1, 1,
0.1816819, 0.4291714, -0.1496688, 0, 0.5607843, 1, 1,
0.1894707, -0.03641208, 2.368481, 0, 0.5568628, 1, 1,
0.1916653, 0.7743849, 0.03008607, 0, 0.5490196, 1, 1,
0.1931374, -0.1112686, 3.521908, 0, 0.5450981, 1, 1,
0.1931415, -1.255394, 4.065595, 0, 0.5372549, 1, 1,
0.1947335, 1.502592, 2.290037, 0, 0.5333334, 1, 1,
0.194759, 0.4454011, 1.413529, 0, 0.5254902, 1, 1,
0.195211, 1.028772, 1.519184, 0, 0.5215687, 1, 1,
0.1974009, -1.704895, 3.044392, 0, 0.5137255, 1, 1,
0.1996267, -0.5432905, 1.841136, 0, 0.509804, 1, 1,
0.2024279, 2.072246, 1.255899, 0, 0.5019608, 1, 1,
0.2035204, -1.662277, 2.388383, 0, 0.4941176, 1, 1,
0.2077187, -0.3638578, 2.022843, 0, 0.4901961, 1, 1,
0.2099026, -1.164943, 0.3454565, 0, 0.4823529, 1, 1,
0.2112433, 0.5597991, -0.2431121, 0, 0.4784314, 1, 1,
0.2242564, 0.6204711, 1.073779, 0, 0.4705882, 1, 1,
0.2267007, 0.07450112, 1.835226, 0, 0.4666667, 1, 1,
0.2282399, -0.5799647, 4.638377, 0, 0.4588235, 1, 1,
0.2283628, 0.7089193, 0.6941684, 0, 0.454902, 1, 1,
0.2323342, -0.3893493, 2.817395, 0, 0.4470588, 1, 1,
0.2380238, -1.533197, 2.924762, 0, 0.4431373, 1, 1,
0.2389018, -0.8799168, 3.243611, 0, 0.4352941, 1, 1,
0.2417, -0.2987397, 3.454906, 0, 0.4313726, 1, 1,
0.2461133, -0.6731573, 3.155409, 0, 0.4235294, 1, 1,
0.2514793, -1.579687, 1.60805, 0, 0.4196078, 1, 1,
0.2521884, 1.462558, 1.746234, 0, 0.4117647, 1, 1,
0.2535265, -0.427819, 3.403857, 0, 0.4078431, 1, 1,
0.2541783, 0.07184297, -0.11433, 0, 0.4, 1, 1,
0.2570078, -0.4707911, 4.334648, 0, 0.3921569, 1, 1,
0.2574528, 0.2821854, -0.5987466, 0, 0.3882353, 1, 1,
0.2593373, 1.475048, -0.3519545, 0, 0.3803922, 1, 1,
0.2626276, 0.1197326, 2.137841, 0, 0.3764706, 1, 1,
0.2626306, 1.227004, 0.2249857, 0, 0.3686275, 1, 1,
0.2632777, -1.037543, 5.056685, 0, 0.3647059, 1, 1,
0.2633447, 1.013042, -0.8979926, 0, 0.3568628, 1, 1,
0.2654553, 0.7230846, 0.06414649, 0, 0.3529412, 1, 1,
0.2665843, 0.0697023, 2.246511, 0, 0.345098, 1, 1,
0.2688661, -1.717682, 4.646537, 0, 0.3411765, 1, 1,
0.270184, 1.463551, 0.6765039, 0, 0.3333333, 1, 1,
0.2710553, 1.935378, -1.174563, 0, 0.3294118, 1, 1,
0.2714052, 0.4498246, 1.301196, 0, 0.3215686, 1, 1,
0.2718998, 0.2295295, 2.463305, 0, 0.3176471, 1, 1,
0.2721562, 0.5252346, 1.540478, 0, 0.3098039, 1, 1,
0.2722949, -0.0464394, 2.801409, 0, 0.3058824, 1, 1,
0.2725863, -0.6256819, 2.530628, 0, 0.2980392, 1, 1,
0.2754116, -1.45506, 2.937162, 0, 0.2901961, 1, 1,
0.2757353, 0.1705354, 1.35735, 0, 0.2862745, 1, 1,
0.2788047, 2.390811, 2.763581, 0, 0.2784314, 1, 1,
0.2797422, -0.1267801, 1.869266, 0, 0.2745098, 1, 1,
0.2812475, 0.7761033, 1.548739, 0, 0.2666667, 1, 1,
0.2836339, 0.3606357, 1.90953, 0, 0.2627451, 1, 1,
0.284255, 0.559673, 0.3228913, 0, 0.254902, 1, 1,
0.28611, -1.734293, 2.215303, 0, 0.2509804, 1, 1,
0.2886244, -1.703079, 4.46086, 0, 0.2431373, 1, 1,
0.2893773, 0.1912286, 1.174817, 0, 0.2392157, 1, 1,
0.2918829, -0.0956989, 0.8012621, 0, 0.2313726, 1, 1,
0.2975411, -1.086891, 3.098564, 0, 0.227451, 1, 1,
0.3018613, -0.8385186, 5.040865, 0, 0.2196078, 1, 1,
0.3063593, 2.46349, 0.5805094, 0, 0.2156863, 1, 1,
0.3066561, -0.978363, 3.262386, 0, 0.2078431, 1, 1,
0.3083892, 0.6435466, 1.241615, 0, 0.2039216, 1, 1,
0.309914, -0.4366431, 2.063996, 0, 0.1960784, 1, 1,
0.3105725, 0.5168072, -0.900353, 0, 0.1882353, 1, 1,
0.3142117, 0.3715129, 0.8640552, 0, 0.1843137, 1, 1,
0.3169277, -0.2499442, 2.486854, 0, 0.1764706, 1, 1,
0.3249739, 0.6311648, 0.3510192, 0, 0.172549, 1, 1,
0.3312285, 0.2898015, 0.7598802, 0, 0.1647059, 1, 1,
0.3369133, -1.329081, 1.950309, 0, 0.1607843, 1, 1,
0.3373635, -1.554619, 3.053823, 0, 0.1529412, 1, 1,
0.3376028, -0.1573854, 1.069294, 0, 0.1490196, 1, 1,
0.3381507, -0.3714479, 3.169332, 0, 0.1411765, 1, 1,
0.3519196, 2.849947, -2.080607, 0, 0.1372549, 1, 1,
0.3538301, 0.09058444, 0.2860478, 0, 0.1294118, 1, 1,
0.3540999, 2.1656, 0.2013779, 0, 0.1254902, 1, 1,
0.3548756, -1.20272, 1.845132, 0, 0.1176471, 1, 1,
0.3569253, -1.213041, 2.54053, 0, 0.1137255, 1, 1,
0.3577793, 0.9909216, -0.739253, 0, 0.1058824, 1, 1,
0.3618003, -1.368769, 3.092289, 0, 0.09803922, 1, 1,
0.3648506, 1.732554, -1.175743, 0, 0.09411765, 1, 1,
0.3676981, -0.7819806, 3.173157, 0, 0.08627451, 1, 1,
0.370546, 0.279533, 0.4647615, 0, 0.08235294, 1, 1,
0.3712863, -0.9513743, 3.742217, 0, 0.07450981, 1, 1,
0.3750774, 1.789762, -1.398971, 0, 0.07058824, 1, 1,
0.3774262, -0.0641664, 0.3158976, 0, 0.0627451, 1, 1,
0.3784379, -1.032749, 4.034185, 0, 0.05882353, 1, 1,
0.3818517, -0.3311664, 2.724497, 0, 0.05098039, 1, 1,
0.3841595, -0.6148822, 2.044042, 0, 0.04705882, 1, 1,
0.3856359, 1.642952, -0.56433, 0, 0.03921569, 1, 1,
0.3915802, -1.784823, 1.818445, 0, 0.03529412, 1, 1,
0.3970217, -0.5289111, 2.685219, 0, 0.02745098, 1, 1,
0.3970835, 0.9213254, 2.240152, 0, 0.02352941, 1, 1,
0.3978092, 0.04355593, 0.9363893, 0, 0.01568628, 1, 1,
0.4004248, -2.741627, 3.439274, 0, 0.01176471, 1, 1,
0.4030195, -0.4546301, 2.83402, 0, 0.003921569, 1, 1,
0.4034419, -0.3777825, 1.893156, 0.003921569, 0, 1, 1,
0.4048451, 0.905829, 1.757685, 0.007843138, 0, 1, 1,
0.4068323, 2.307866, -0.8600271, 0.01568628, 0, 1, 1,
0.4070278, -0.2616068, -0.2145735, 0.01960784, 0, 1, 1,
0.4103997, -0.102124, 0.4058587, 0.02745098, 0, 1, 1,
0.4144358, -0.6001922, 2.262261, 0.03137255, 0, 1, 1,
0.4210573, -1.173484, 3.388091, 0.03921569, 0, 1, 1,
0.4315172, -1.015015, 1.978161, 0.04313726, 0, 1, 1,
0.4318163, 0.4681164, -1.347056, 0.05098039, 0, 1, 1,
0.4339891, 1.105999, 1.23136, 0.05490196, 0, 1, 1,
0.4341778, 0.7447057, -0.5465513, 0.0627451, 0, 1, 1,
0.4348095, 0.7165669, -0.08361559, 0.06666667, 0, 1, 1,
0.4357263, -0.4499616, 1.067126, 0.07450981, 0, 1, 1,
0.4382737, 0.7830925, 2.266987, 0.07843138, 0, 1, 1,
0.4418917, 1.159678, 1.172669, 0.08627451, 0, 1, 1,
0.4449585, 0.4432504, 2.411986, 0.09019608, 0, 1, 1,
0.4462016, 0.8591673, 1.452077, 0.09803922, 0, 1, 1,
0.4473181, 1.981261, -0.9307543, 0.1058824, 0, 1, 1,
0.4486836, 0.5276558, -0.5035045, 0.1098039, 0, 1, 1,
0.4490353, 0.1876363, 0.3573036, 0.1176471, 0, 1, 1,
0.4505085, -0.3588107, 3.24492, 0.1215686, 0, 1, 1,
0.4512745, 3.027384, 2.821191, 0.1294118, 0, 1, 1,
0.4518567, 0.600563, -0.3478928, 0.1333333, 0, 1, 1,
0.4531232, 0.8036897, 2.521856, 0.1411765, 0, 1, 1,
0.4573552, -0.4832426, 2.24771, 0.145098, 0, 1, 1,
0.4591212, -0.6656437, 2.231694, 0.1529412, 0, 1, 1,
0.4654384, -0.09340201, 1.178931, 0.1568628, 0, 1, 1,
0.4692921, -0.1764941, 4.812353, 0.1647059, 0, 1, 1,
0.4706611, 0.2140639, -0.1562375, 0.1686275, 0, 1, 1,
0.4732864, -0.675153, 1.742207, 0.1764706, 0, 1, 1,
0.4743225, -0.9488468, 4.343984, 0.1803922, 0, 1, 1,
0.4781693, 0.02163731, 0.7031474, 0.1882353, 0, 1, 1,
0.4795698, -0.7713462, 2.68805, 0.1921569, 0, 1, 1,
0.4813744, 0.4632208, 0.1685834, 0.2, 0, 1, 1,
0.4861352, -0.8905038, 2.411907, 0.2078431, 0, 1, 1,
0.4940233, 1.969622, 0.6608788, 0.2117647, 0, 1, 1,
0.4990666, 3.038632, -1.508462, 0.2196078, 0, 1, 1,
0.5060539, 1.30342, 2.37406, 0.2235294, 0, 1, 1,
0.5079161, -0.9736079, 2.527416, 0.2313726, 0, 1, 1,
0.5086703, 1.88488, -0.9686896, 0.2352941, 0, 1, 1,
0.5087914, -0.2999408, 2.276879, 0.2431373, 0, 1, 1,
0.5105556, -0.3824693, 1.646726, 0.2470588, 0, 1, 1,
0.5120856, -1.379303, 2.403618, 0.254902, 0, 1, 1,
0.5159963, -0.4385141, 1.345903, 0.2588235, 0, 1, 1,
0.5172135, 0.359022, 1.474558, 0.2666667, 0, 1, 1,
0.5199864, 0.06202314, 0.5679368, 0.2705882, 0, 1, 1,
0.5213978, 0.6062886, -0.002093951, 0.2784314, 0, 1, 1,
0.5249718, -1.821747, 4.898207, 0.282353, 0, 1, 1,
0.5262674, 0.5534366, 1.226941, 0.2901961, 0, 1, 1,
0.5264368, 0.3611969, 0.6594311, 0.2941177, 0, 1, 1,
0.5282714, -0.02916944, -0.1038796, 0.3019608, 0, 1, 1,
0.5307272, -0.5528266, 1.222656, 0.3098039, 0, 1, 1,
0.5340202, -0.254838, 3.014058, 0.3137255, 0, 1, 1,
0.5342109, 0.3811311, -0.9713321, 0.3215686, 0, 1, 1,
0.5407194, -0.6507323, 3.839266, 0.3254902, 0, 1, 1,
0.5416895, -0.2301888, 2.082852, 0.3333333, 0, 1, 1,
0.5416919, -0.8756716, 2.161932, 0.3372549, 0, 1, 1,
0.5422193, 2.002085, 0.5940065, 0.345098, 0, 1, 1,
0.5440094, -0.2455998, 0.8967425, 0.3490196, 0, 1, 1,
0.5468737, -0.5552791, 1.345184, 0.3568628, 0, 1, 1,
0.5478446, 0.2569002, 0.4119698, 0.3607843, 0, 1, 1,
0.5482588, 1.873225, -0.1944919, 0.3686275, 0, 1, 1,
0.5518373, 0.6324854, 0.3364484, 0.372549, 0, 1, 1,
0.552744, -0.3281484, 2.55978, 0.3803922, 0, 1, 1,
0.5578119, -1.571781, 2.396976, 0.3843137, 0, 1, 1,
0.5614287, -0.1384854, 0.1305229, 0.3921569, 0, 1, 1,
0.5617195, -1.241449, 3.172375, 0.3960784, 0, 1, 1,
0.5647225, 0.4035577, 1.942982, 0.4039216, 0, 1, 1,
0.5712568, 0.08999811, 1.359624, 0.4117647, 0, 1, 1,
0.5770123, 1.186316, 0.09227309, 0.4156863, 0, 1, 1,
0.5773651, 1.395048, -0.5700191, 0.4235294, 0, 1, 1,
0.5795178, 0.1596014, 2.348354, 0.427451, 0, 1, 1,
0.5814758, -0.4697574, 2.565827, 0.4352941, 0, 1, 1,
0.5822664, -2.033069, 3.000115, 0.4392157, 0, 1, 1,
0.5824282, 1.172469, -0.1870033, 0.4470588, 0, 1, 1,
0.5898109, 0.8655296, -0.231803, 0.4509804, 0, 1, 1,
0.5949671, -1.396055, 0.9991981, 0.4588235, 0, 1, 1,
0.5966563, 1.038505, 0.3459676, 0.4627451, 0, 1, 1,
0.5968777, 0.3644794, 0.1467875, 0.4705882, 0, 1, 1,
0.5976335, 1.644732, 0.6934344, 0.4745098, 0, 1, 1,
0.5979261, -0.7758226, 3.987101, 0.4823529, 0, 1, 1,
0.6028959, -0.02133659, -0.4269387, 0.4862745, 0, 1, 1,
0.6126127, -0.5078269, 3.025257, 0.4941176, 0, 1, 1,
0.6168084, -0.6296824, 1.353069, 0.5019608, 0, 1, 1,
0.6181749, -0.4497568, 2.071712, 0.5058824, 0, 1, 1,
0.6215782, 0.4900768, 1.783004, 0.5137255, 0, 1, 1,
0.622839, 1.84971, 1.387265, 0.5176471, 0, 1, 1,
0.6229963, 0.08979373, 0.002134327, 0.5254902, 0, 1, 1,
0.6266652, -0.9533512, 3.379066, 0.5294118, 0, 1, 1,
0.6298393, 1.891162, 0.6051598, 0.5372549, 0, 1, 1,
0.6324026, -0.2896866, 2.644208, 0.5411765, 0, 1, 1,
0.6462762, 0.9298781, 0.9918688, 0.5490196, 0, 1, 1,
0.6518399, 0.541177, 0.4385172, 0.5529412, 0, 1, 1,
0.6536372, -1.595635, 1.991349, 0.5607843, 0, 1, 1,
0.6556197, -0.8719882, 1.808923, 0.5647059, 0, 1, 1,
0.6564804, -0.7541124, 1.48847, 0.572549, 0, 1, 1,
0.6565954, -0.18142, -0.8104826, 0.5764706, 0, 1, 1,
0.6677169, 1.649386, -1.033015, 0.5843138, 0, 1, 1,
0.6701512, 0.4064567, 0.4247542, 0.5882353, 0, 1, 1,
0.6723853, 0.8466449, -0.6674906, 0.5960785, 0, 1, 1,
0.676551, -1.035715, 2.415081, 0.6039216, 0, 1, 1,
0.6777135, -1.78813, 2.34052, 0.6078432, 0, 1, 1,
0.6791353, 1.024399, 1.579616, 0.6156863, 0, 1, 1,
0.6836263, -1.68576, 3.045468, 0.6196079, 0, 1, 1,
0.6838503, 0.5291615, -0.8083768, 0.627451, 0, 1, 1,
0.6841789, -1.310359, 3.261998, 0.6313726, 0, 1, 1,
0.6858332, 0.791037, -0.4346405, 0.6392157, 0, 1, 1,
0.6895108, -0.03679258, 1.241693, 0.6431373, 0, 1, 1,
0.6908967, 0.1161821, 1.567574, 0.6509804, 0, 1, 1,
0.7081902, 1.214002, 1.833117, 0.654902, 0, 1, 1,
0.7105268, 0.01297055, 2.341611, 0.6627451, 0, 1, 1,
0.7119661, 0.226222, 0.8807088, 0.6666667, 0, 1, 1,
0.7154042, -0.4444832, 2.849516, 0.6745098, 0, 1, 1,
0.7160689, 0.4693753, 1.105887, 0.6784314, 0, 1, 1,
0.7203389, 0.1759436, 2.586043, 0.6862745, 0, 1, 1,
0.7210668, -0.1753472, 2.355094, 0.6901961, 0, 1, 1,
0.7215998, 0.632943, 1.546087, 0.6980392, 0, 1, 1,
0.722993, -0.3817295, 1.56161, 0.7058824, 0, 1, 1,
0.7301659, -0.6904051, 1.667168, 0.7098039, 0, 1, 1,
0.7302314, 0.3670573, 1.129386, 0.7176471, 0, 1, 1,
0.7343693, -0.1157563, 3.072895, 0.7215686, 0, 1, 1,
0.7352757, -0.1828493, 1.123913, 0.7294118, 0, 1, 1,
0.7357795, 0.1308171, 0.516501, 0.7333333, 0, 1, 1,
0.7394052, 1.124052, -0.9594302, 0.7411765, 0, 1, 1,
0.7415086, 0.4328378, 4.472999, 0.7450981, 0, 1, 1,
0.7498522, 0.6399102, 1.071478, 0.7529412, 0, 1, 1,
0.751096, -0.532649, 0.8526078, 0.7568628, 0, 1, 1,
0.7599746, 0.4951605, -0.5314944, 0.7647059, 0, 1, 1,
0.7625338, -1.268563, 2.0437, 0.7686275, 0, 1, 1,
0.7717561, -0.8959735, 1.123672, 0.7764706, 0, 1, 1,
0.7727207, 0.3982888, 1.72642, 0.7803922, 0, 1, 1,
0.7732079, -0.2071784, 1.776855, 0.7882353, 0, 1, 1,
0.7775776, 0.1766798, 1.90401, 0.7921569, 0, 1, 1,
0.7800612, -2.824996, 3.005525, 0.8, 0, 1, 1,
0.7853519, 1.216336, 1.428026, 0.8078431, 0, 1, 1,
0.7861717, -3.307182, 2.550154, 0.8117647, 0, 1, 1,
0.7898043, -1.645814, 3.388473, 0.8196079, 0, 1, 1,
0.7959206, -0.7819032, 1.779379, 0.8235294, 0, 1, 1,
0.7971198, 0.2971402, 0.5585511, 0.8313726, 0, 1, 1,
0.7972991, -0.1437323, 2.789288, 0.8352941, 0, 1, 1,
0.8104515, -0.802627, 2.257743, 0.8431373, 0, 1, 1,
0.810951, 0.05885272, 2.074809, 0.8470588, 0, 1, 1,
0.8141568, 0.127197, 1.722621, 0.854902, 0, 1, 1,
0.8178318, 0.07805253, -0.3028712, 0.8588235, 0, 1, 1,
0.8221325, 0.4920405, -0.190087, 0.8666667, 0, 1, 1,
0.8226894, 0.04341287, 0.5951908, 0.8705882, 0, 1, 1,
0.824488, -0.3166992, 1.401281, 0.8784314, 0, 1, 1,
0.8309693, -2.106236, 1.019572, 0.8823529, 0, 1, 1,
0.8345849, 0.3461771, 2.658424, 0.8901961, 0, 1, 1,
0.8351808, 0.1489807, -0.5128536, 0.8941177, 0, 1, 1,
0.8388298, 0.4547954, -0.0922101, 0.9019608, 0, 1, 1,
0.8447098, 0.08705477, 1.779562, 0.9098039, 0, 1, 1,
0.8545013, 0.8556994, 2.481805, 0.9137255, 0, 1, 1,
0.857183, -0.6077603, 2.467623, 0.9215686, 0, 1, 1,
0.8605303, 0.9025739, 0.06279982, 0.9254902, 0, 1, 1,
0.8605817, -1.246442, 1.422585, 0.9333333, 0, 1, 1,
0.8694365, 0.250816, 1.582451, 0.9372549, 0, 1, 1,
0.8771729, 0.3673369, 3.732428, 0.945098, 0, 1, 1,
0.8776154, 0.6254515, 1.651272, 0.9490196, 0, 1, 1,
0.8818387, 1.340836, 0.9263728, 0.9568627, 0, 1, 1,
0.8869697, 0.2760862, 1.514786, 0.9607843, 0, 1, 1,
0.8905272, -0.8773368, 3.387799, 0.9686275, 0, 1, 1,
0.8918824, -1.151631, 2.03688, 0.972549, 0, 1, 1,
0.8934751, -0.178285, 2.523229, 0.9803922, 0, 1, 1,
0.8948427, 0.7968999, 0.00223714, 0.9843137, 0, 1, 1,
0.8962366, -1.301123, 1.445952, 0.9921569, 0, 1, 1,
0.8992599, 1.447644, -0.6441069, 0.9960784, 0, 1, 1,
0.9011419, 1.558682, 0.2321703, 1, 0, 0.9960784, 1,
0.9066416, 1.346395, 0.3275772, 1, 0, 0.9882353, 1,
0.9096716, -0.414653, 1.979042, 1, 0, 0.9843137, 1,
0.9171845, 0.6156372, 1.491771, 1, 0, 0.9764706, 1,
0.9172839, -1.43144, 2.974301, 1, 0, 0.972549, 1,
0.9396128, 0.8872771, 1.328926, 1, 0, 0.9647059, 1,
0.9403008, 1.355485, -0.5256343, 1, 0, 0.9607843, 1,
0.9444233, 0.1747259, 0.6702813, 1, 0, 0.9529412, 1,
0.9446979, 0.4507184, 0.8153561, 1, 0, 0.9490196, 1,
0.9457079, -1.204366, 2.921084, 1, 0, 0.9411765, 1,
0.950284, 0.9407992, -0.6986736, 1, 0, 0.9372549, 1,
0.9542567, -0.05392737, 1.771827, 1, 0, 0.9294118, 1,
0.957371, -0.2066862, 1.291876, 1, 0, 0.9254902, 1,
0.9600955, -0.9509399, 1.866058, 1, 0, 0.9176471, 1,
0.9610983, -0.5666754, 2.155975, 1, 0, 0.9137255, 1,
0.9632965, 0.5904347, 1.129357, 1, 0, 0.9058824, 1,
0.9634307, 1.223024, -0.4155419, 1, 0, 0.9019608, 1,
0.9665372, 0.3963621, -0.03946234, 1, 0, 0.8941177, 1,
0.966827, 2.470303, -0.2894792, 1, 0, 0.8862745, 1,
0.9723567, 0.2140731, 0.7403141, 1, 0, 0.8823529, 1,
0.9729494, 0.8771398, 0.6533589, 1, 0, 0.8745098, 1,
0.9848607, 0.1681247, 0.8972128, 1, 0, 0.8705882, 1,
0.994745, 0.3548706, 0.2791123, 1, 0, 0.8627451, 1,
0.9956566, 0.8619383, 1.234944, 1, 0, 0.8588235, 1,
0.9959467, -0.2900218, 0.2884611, 1, 0, 0.8509804, 1,
0.9982071, 0.5153921, 1.520519, 1, 0, 0.8470588, 1,
1.00193, 1.103192, -0.06911487, 1, 0, 0.8392157, 1,
1.004157, 0.1615757, 2.079077, 1, 0, 0.8352941, 1,
1.01597, 0.1571511, -0.3677621, 1, 0, 0.827451, 1,
1.017326, -1.116844, 2.092561, 1, 0, 0.8235294, 1,
1.018111, 0.7267023, 3.123115, 1, 0, 0.8156863, 1,
1.021369, 2.020257, 0.6024179, 1, 0, 0.8117647, 1,
1.022742, -1.455233, 3.460042, 1, 0, 0.8039216, 1,
1.034998, 0.4637129, 2.11811, 1, 0, 0.7960784, 1,
1.035108, 1.10845, 0.9919567, 1, 0, 0.7921569, 1,
1.043185, 0.1437043, 0.4872482, 1, 0, 0.7843137, 1,
1.056569, -0.02639752, -0.02660251, 1, 0, 0.7803922, 1,
1.058649, 1.200517, 0.821409, 1, 0, 0.772549, 1,
1.06332, 0.5771809, 0.6211022, 1, 0, 0.7686275, 1,
1.073212, -0.4999368, -0.2217192, 1, 0, 0.7607843, 1,
1.073585, -0.5897948, 1.200551, 1, 0, 0.7568628, 1,
1.076375, -0.4555158, 0.3893349, 1, 0, 0.7490196, 1,
1.081748, -1.192598, 4.174985, 1, 0, 0.7450981, 1,
1.088086, -1.761356, 3.242759, 1, 0, 0.7372549, 1,
1.089175, 0.137033, 2.138582, 1, 0, 0.7333333, 1,
1.089689, 1.431243, 1.091758, 1, 0, 0.7254902, 1,
1.095101, -0.930158, 2.281221, 1, 0, 0.7215686, 1,
1.114116, 1.582304, 1.6896, 1, 0, 0.7137255, 1,
1.114148, 2.496577, -0.3897004, 1, 0, 0.7098039, 1,
1.121969, -0.5188987, 0.6086871, 1, 0, 0.7019608, 1,
1.127082, -1.478654, 1.495878, 1, 0, 0.6941177, 1,
1.12715, 0.4850394, 0.4005646, 1, 0, 0.6901961, 1,
1.135288, -0.1949073, 2.69334, 1, 0, 0.682353, 1,
1.135615, -0.7473383, 1.041822, 1, 0, 0.6784314, 1,
1.158066, 0.3492927, 1.840259, 1, 0, 0.6705883, 1,
1.163815, 1.561783, -0.4825182, 1, 0, 0.6666667, 1,
1.165738, 0.5904526, 1.927161, 1, 0, 0.6588235, 1,
1.165884, -0.3895471, 2.768014, 1, 0, 0.654902, 1,
1.166608, 0.5388301, 1.347223, 1, 0, 0.6470588, 1,
1.170154, 1.047623, -0.3824017, 1, 0, 0.6431373, 1,
1.170996, -0.3119596, 2.557995, 1, 0, 0.6352941, 1,
1.186483, 0.3448498, 2.611941, 1, 0, 0.6313726, 1,
1.189436, 0.9573121, 0.4850621, 1, 0, 0.6235294, 1,
1.190349, -0.1116045, 1.079545, 1, 0, 0.6196079, 1,
1.194886, 0.02325581, 2.679446, 1, 0, 0.6117647, 1,
1.20075, 0.3474392, 1.743026, 1, 0, 0.6078432, 1,
1.230211, -0.3805238, 2.668392, 1, 0, 0.6, 1,
1.232641, 0.9249503, 1.53234, 1, 0, 0.5921569, 1,
1.238182, 0.2294544, 0.1823286, 1, 0, 0.5882353, 1,
1.246308, -0.404581, 1.28361, 1, 0, 0.5803922, 1,
1.255572, -0.2929719, 1.638491, 1, 0, 0.5764706, 1,
1.258445, -0.6584101, 2.25441, 1, 0, 0.5686275, 1,
1.260708, 0.4619187, 1.14837, 1, 0, 0.5647059, 1,
1.261331, 1.05252, 1.441874, 1, 0, 0.5568628, 1,
1.266144, 1.106448, -0.7508025, 1, 0, 0.5529412, 1,
1.269548, -0.1529502, 1.977464, 1, 0, 0.5450981, 1,
1.270071, -0.5829669, 1.061986, 1, 0, 0.5411765, 1,
1.287161, 1.57281, -0.3503388, 1, 0, 0.5333334, 1,
1.291582, -0.9332352, 1.128311, 1, 0, 0.5294118, 1,
1.295926, -1.163957, 2.944405, 1, 0, 0.5215687, 1,
1.298947, 0.3734803, 1.878023, 1, 0, 0.5176471, 1,
1.300992, 0.4872424, 0.5874745, 1, 0, 0.509804, 1,
1.311653, -0.5415393, 2.690591, 1, 0, 0.5058824, 1,
1.320592, -0.2693993, 0.874384, 1, 0, 0.4980392, 1,
1.321391, 0.4124691, 2.485437, 1, 0, 0.4901961, 1,
1.325157, -0.7923845, 1.708952, 1, 0, 0.4862745, 1,
1.33791, 1.156558, 2.456445, 1, 0, 0.4784314, 1,
1.338178, 0.8667656, 1.714202, 1, 0, 0.4745098, 1,
1.362848, -0.5274316, 1.266836, 1, 0, 0.4666667, 1,
1.364669, 0.1029683, 0.2010539, 1, 0, 0.4627451, 1,
1.366873, 0.05587894, 0.8513714, 1, 0, 0.454902, 1,
1.383286, -0.816871, 3.116807, 1, 0, 0.4509804, 1,
1.385763, -1.020767, 3.537264, 1, 0, 0.4431373, 1,
1.393053, 2.009372, 0.2282519, 1, 0, 0.4392157, 1,
1.407971, -2.145209, 3.216231, 1, 0, 0.4313726, 1,
1.414767, -1.489092, 3.722089, 1, 0, 0.427451, 1,
1.418317, -1.156741, 2.691686, 1, 0, 0.4196078, 1,
1.418396, 1.279073, -0.1308949, 1, 0, 0.4156863, 1,
1.420303, 1.62073, 1.19509, 1, 0, 0.4078431, 1,
1.435344, -0.779045, 1.814584, 1, 0, 0.4039216, 1,
1.444599, 2.042724, -1.083022, 1, 0, 0.3960784, 1,
1.447972, 2.682996, 0.1909514, 1, 0, 0.3882353, 1,
1.451135, 1.371322, 1.993187, 1, 0, 0.3843137, 1,
1.460156, 1.337069, -0.55975, 1, 0, 0.3764706, 1,
1.474622, -0.7208455, 1.661257, 1, 0, 0.372549, 1,
1.479125, -0.9898289, 4.255574, 1, 0, 0.3647059, 1,
1.485465, -0.3929544, 0.3779423, 1, 0, 0.3607843, 1,
1.489106, -1.306292, 2.937884, 1, 0, 0.3529412, 1,
1.491476, -0.05296957, 0.8270161, 1, 0, 0.3490196, 1,
1.494118, 1.066089, 0.6427371, 1, 0, 0.3411765, 1,
1.49618, 0.3587775, 1.863346, 1, 0, 0.3372549, 1,
1.510813, -0.01717807, 2.04832, 1, 0, 0.3294118, 1,
1.519785, -1.016177, 1.526754, 1, 0, 0.3254902, 1,
1.53574, -0.2151055, 1.811279, 1, 0, 0.3176471, 1,
1.5364, 0.5492924, 2.109864, 1, 0, 0.3137255, 1,
1.542792, 0.308687, 1.93968, 1, 0, 0.3058824, 1,
1.545219, -0.06702031, 0.8838153, 1, 0, 0.2980392, 1,
1.545794, -0.8365917, 2.469233, 1, 0, 0.2941177, 1,
1.548127, 0.03059686, 3.777819, 1, 0, 0.2862745, 1,
1.568896, 0.7447216, 1.566493, 1, 0, 0.282353, 1,
1.571016, 0.2119772, 0.9011661, 1, 0, 0.2745098, 1,
1.576566, -1.467778, 1.458991, 1, 0, 0.2705882, 1,
1.58961, -0.0891844, 1.754066, 1, 0, 0.2627451, 1,
1.603673, 2.055076, 1.307001, 1, 0, 0.2588235, 1,
1.603748, -0.3774322, 2.044375, 1, 0, 0.2509804, 1,
1.609245, 0.4646559, 0.4896105, 1, 0, 0.2470588, 1,
1.609967, 0.3005031, -0.7990753, 1, 0, 0.2392157, 1,
1.632426, -1.580147, 4.669232, 1, 0, 0.2352941, 1,
1.636455, -2.280309, 1.783827, 1, 0, 0.227451, 1,
1.637039, 0.674983, 0.7437517, 1, 0, 0.2235294, 1,
1.663309, -1.099242, 0.5472252, 1, 0, 0.2156863, 1,
1.669866, 0.03036708, 1.638434, 1, 0, 0.2117647, 1,
1.687317, -1.700674, 3.021439, 1, 0, 0.2039216, 1,
1.730784, 1.024163, 1.370861, 1, 0, 0.1960784, 1,
1.733707, -0.1175586, 1.141269, 1, 0, 0.1921569, 1,
1.745765, -0.09200437, 0.8337547, 1, 0, 0.1843137, 1,
1.789689, 0.1065874, -0.7177945, 1, 0, 0.1803922, 1,
1.804197, -0.5198821, 1.10984, 1, 0, 0.172549, 1,
1.838153, -1.215009, 3.105947, 1, 0, 0.1686275, 1,
1.845957, -1.1765, 3.691011, 1, 0, 0.1607843, 1,
1.887565, -0.2634335, 1.67855, 1, 0, 0.1568628, 1,
1.895709, 1.164012, 1.83778, 1, 0, 0.1490196, 1,
1.904157, 0.2703346, 1.472515, 1, 0, 0.145098, 1,
1.92687, -0.7863416, 1.227998, 1, 0, 0.1372549, 1,
1.977391, 0.6881807, 2.879246, 1, 0, 0.1333333, 1,
1.986445, -0.421767, 0.6560663, 1, 0, 0.1254902, 1,
1.990646, -0.09478036, 3.71553, 1, 0, 0.1215686, 1,
2.004565, 0.3368416, 0.9847971, 1, 0, 0.1137255, 1,
2.010956, -1.322636, 1.113866, 1, 0, 0.1098039, 1,
2.079814, -2.568515, 2.962236, 1, 0, 0.1019608, 1,
2.087776, 0.4888922, -0.2741154, 1, 0, 0.09411765, 1,
2.10322, -0.874114, 2.574887, 1, 0, 0.09019608, 1,
2.113783, 0.4831845, 1.37071, 1, 0, 0.08235294, 1,
2.143204, -1.48221, 2.401793, 1, 0, 0.07843138, 1,
2.252236, -0.2571975, 1.486263, 1, 0, 0.07058824, 1,
2.33484, 0.2658209, 2.227906, 1, 0, 0.06666667, 1,
2.385988, 2.034456, 1.32549, 1, 0, 0.05882353, 1,
2.41015, -0.9017208, 1.112612, 1, 0, 0.05490196, 1,
2.60992, 0.1097128, 3.189245, 1, 0, 0.04705882, 1,
2.640273, 0.7576469, 0.3267519, 1, 0, 0.04313726, 1,
2.747066, 0.663625, 3.316457, 1, 0, 0.03529412, 1,
2.861186, -0.4969833, 1.993615, 1, 0, 0.03137255, 1,
2.916315, -0.2326457, 2.448838, 1, 0, 0.02352941, 1,
2.93, -1.673571, 2.918135, 1, 0, 0.01960784, 1,
3.074393, 0.5457402, 2.032935, 1, 0, 0.01176471, 1,
3.463192, -0.05973714, 2.633786, 1, 0, 0.007843138, 1
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
0.3022954, -4.467845, -8.253755, 0, -0.5, 0.5, 0.5,
0.3022954, -4.467845, -8.253755, 1, -0.5, 0.5, 0.5,
0.3022954, -4.467845, -8.253755, 1, 1.5, 0.5, 0.5,
0.3022954, -4.467845, -8.253755, 0, 1.5, 0.5, 0.5
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
-3.930145, 0.1166011, -8.253755, 0, -0.5, 0.5, 0.5,
-3.930145, 0.1166011, -8.253755, 1, -0.5, 0.5, 0.5,
-3.930145, 0.1166011, -8.253755, 1, 1.5, 0.5, 0.5,
-3.930145, 0.1166011, -8.253755, 0, 1.5, 0.5, 0.5
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
-3.930145, -4.467845, -0.4004984, 0, -0.5, 0.5, 0.5,
-3.930145, -4.467845, -0.4004984, 1, -0.5, 0.5, 0.5,
-3.930145, -4.467845, -0.4004984, 1, 1.5, 0.5, 0.5,
-3.930145, -4.467845, -0.4004984, 0, 1.5, 0.5, 0.5
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
-2, -3.409896, -6.441464,
3, -3.409896, -6.441464,
-2, -3.409896, -6.441464,
-2, -3.586221, -6.743513,
-1, -3.409896, -6.441464,
-1, -3.586221, -6.743513,
0, -3.409896, -6.441464,
0, -3.586221, -6.743513,
1, -3.409896, -6.441464,
1, -3.586221, -6.743513,
2, -3.409896, -6.441464,
2, -3.586221, -6.743513,
3, -3.409896, -6.441464,
3, -3.586221, -6.743513
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
-2, -3.93887, -7.347609, 0, -0.5, 0.5, 0.5,
-2, -3.93887, -7.347609, 1, -0.5, 0.5, 0.5,
-2, -3.93887, -7.347609, 1, 1.5, 0.5, 0.5,
-2, -3.93887, -7.347609, 0, 1.5, 0.5, 0.5,
-1, -3.93887, -7.347609, 0, -0.5, 0.5, 0.5,
-1, -3.93887, -7.347609, 1, -0.5, 0.5, 0.5,
-1, -3.93887, -7.347609, 1, 1.5, 0.5, 0.5,
-1, -3.93887, -7.347609, 0, 1.5, 0.5, 0.5,
0, -3.93887, -7.347609, 0, -0.5, 0.5, 0.5,
0, -3.93887, -7.347609, 1, -0.5, 0.5, 0.5,
0, -3.93887, -7.347609, 1, 1.5, 0.5, 0.5,
0, -3.93887, -7.347609, 0, 1.5, 0.5, 0.5,
1, -3.93887, -7.347609, 0, -0.5, 0.5, 0.5,
1, -3.93887, -7.347609, 1, -0.5, 0.5, 0.5,
1, -3.93887, -7.347609, 1, 1.5, 0.5, 0.5,
1, -3.93887, -7.347609, 0, 1.5, 0.5, 0.5,
2, -3.93887, -7.347609, 0, -0.5, 0.5, 0.5,
2, -3.93887, -7.347609, 1, -0.5, 0.5, 0.5,
2, -3.93887, -7.347609, 1, 1.5, 0.5, 0.5,
2, -3.93887, -7.347609, 0, 1.5, 0.5, 0.5,
3, -3.93887, -7.347609, 0, -0.5, 0.5, 0.5,
3, -3.93887, -7.347609, 1, -0.5, 0.5, 0.5,
3, -3.93887, -7.347609, 1, 1.5, 0.5, 0.5,
3, -3.93887, -7.347609, 0, 1.5, 0.5, 0.5
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
-2.953428, -3, -6.441464,
-2.953428, 3, -6.441464,
-2.953428, -3, -6.441464,
-3.116214, -3, -6.743513,
-2.953428, -2, -6.441464,
-3.116214, -2, -6.743513,
-2.953428, -1, -6.441464,
-3.116214, -1, -6.743513,
-2.953428, 0, -6.441464,
-3.116214, 0, -6.743513,
-2.953428, 1, -6.441464,
-3.116214, 1, -6.743513,
-2.953428, 2, -6.441464,
-3.116214, 2, -6.743513,
-2.953428, 3, -6.441464,
-3.116214, 3, -6.743513
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
-3.441786, -3, -7.347609, 0, -0.5, 0.5, 0.5,
-3.441786, -3, -7.347609, 1, -0.5, 0.5, 0.5,
-3.441786, -3, -7.347609, 1, 1.5, 0.5, 0.5,
-3.441786, -3, -7.347609, 0, 1.5, 0.5, 0.5,
-3.441786, -2, -7.347609, 0, -0.5, 0.5, 0.5,
-3.441786, -2, -7.347609, 1, -0.5, 0.5, 0.5,
-3.441786, -2, -7.347609, 1, 1.5, 0.5, 0.5,
-3.441786, -2, -7.347609, 0, 1.5, 0.5, 0.5,
-3.441786, -1, -7.347609, 0, -0.5, 0.5, 0.5,
-3.441786, -1, -7.347609, 1, -0.5, 0.5, 0.5,
-3.441786, -1, -7.347609, 1, 1.5, 0.5, 0.5,
-3.441786, -1, -7.347609, 0, 1.5, 0.5, 0.5,
-3.441786, 0, -7.347609, 0, -0.5, 0.5, 0.5,
-3.441786, 0, -7.347609, 1, -0.5, 0.5, 0.5,
-3.441786, 0, -7.347609, 1, 1.5, 0.5, 0.5,
-3.441786, 0, -7.347609, 0, 1.5, 0.5, 0.5,
-3.441786, 1, -7.347609, 0, -0.5, 0.5, 0.5,
-3.441786, 1, -7.347609, 1, -0.5, 0.5, 0.5,
-3.441786, 1, -7.347609, 1, 1.5, 0.5, 0.5,
-3.441786, 1, -7.347609, 0, 1.5, 0.5, 0.5,
-3.441786, 2, -7.347609, 0, -0.5, 0.5, 0.5,
-3.441786, 2, -7.347609, 1, -0.5, 0.5, 0.5,
-3.441786, 2, -7.347609, 1, 1.5, 0.5, 0.5,
-3.441786, 2, -7.347609, 0, 1.5, 0.5, 0.5,
-3.441786, 3, -7.347609, 0, -0.5, 0.5, 0.5,
-3.441786, 3, -7.347609, 1, -0.5, 0.5, 0.5,
-3.441786, 3, -7.347609, 1, 1.5, 0.5, 0.5,
-3.441786, 3, -7.347609, 0, 1.5, 0.5, 0.5
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
-2.953428, -3.409896, -6,
-2.953428, -3.409896, 4,
-2.953428, -3.409896, -6,
-3.116214, -3.586221, -6,
-2.953428, -3.409896, -4,
-3.116214, -3.586221, -4,
-2.953428, -3.409896, -2,
-3.116214, -3.586221, -2,
-2.953428, -3.409896, 0,
-3.116214, -3.586221, 0,
-2.953428, -3.409896, 2,
-3.116214, -3.586221, 2,
-2.953428, -3.409896, 4,
-3.116214, -3.586221, 4
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
-3.441786, -3.93887, -6, 0, -0.5, 0.5, 0.5,
-3.441786, -3.93887, -6, 1, -0.5, 0.5, 0.5,
-3.441786, -3.93887, -6, 1, 1.5, 0.5, 0.5,
-3.441786, -3.93887, -6, 0, 1.5, 0.5, 0.5,
-3.441786, -3.93887, -4, 0, -0.5, 0.5, 0.5,
-3.441786, -3.93887, -4, 1, -0.5, 0.5, 0.5,
-3.441786, -3.93887, -4, 1, 1.5, 0.5, 0.5,
-3.441786, -3.93887, -4, 0, 1.5, 0.5, 0.5,
-3.441786, -3.93887, -2, 0, -0.5, 0.5, 0.5,
-3.441786, -3.93887, -2, 1, -0.5, 0.5, 0.5,
-3.441786, -3.93887, -2, 1, 1.5, 0.5, 0.5,
-3.441786, -3.93887, -2, 0, 1.5, 0.5, 0.5,
-3.441786, -3.93887, 0, 0, -0.5, 0.5, 0.5,
-3.441786, -3.93887, 0, 1, -0.5, 0.5, 0.5,
-3.441786, -3.93887, 0, 1, 1.5, 0.5, 0.5,
-3.441786, -3.93887, 0, 0, 1.5, 0.5, 0.5,
-3.441786, -3.93887, 2, 0, -0.5, 0.5, 0.5,
-3.441786, -3.93887, 2, 1, -0.5, 0.5, 0.5,
-3.441786, -3.93887, 2, 1, 1.5, 0.5, 0.5,
-3.441786, -3.93887, 2, 0, 1.5, 0.5, 0.5,
-3.441786, -3.93887, 4, 0, -0.5, 0.5, 0.5,
-3.441786, -3.93887, 4, 1, -0.5, 0.5, 0.5,
-3.441786, -3.93887, 4, 1, 1.5, 0.5, 0.5,
-3.441786, -3.93887, 4, 0, 1.5, 0.5, 0.5
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
-2.953428, -3.409896, -6.441464,
-2.953428, 3.643098, -6.441464,
-2.953428, -3.409896, 5.640468,
-2.953428, 3.643098, 5.640468,
-2.953428, -3.409896, -6.441464,
-2.953428, -3.409896, 5.640468,
-2.953428, 3.643098, -6.441464,
-2.953428, 3.643098, 5.640468,
-2.953428, -3.409896, -6.441464,
3.558019, -3.409896, -6.441464,
-2.953428, -3.409896, 5.640468,
3.558019, -3.409896, 5.640468,
-2.953428, 3.643098, -6.441464,
3.558019, 3.643098, -6.441464,
-2.953428, 3.643098, 5.640468,
3.558019, 3.643098, 5.640468,
3.558019, -3.409896, -6.441464,
3.558019, 3.643098, -6.441464,
3.558019, -3.409896, 5.640468,
3.558019, 3.643098, 5.640468,
3.558019, -3.409896, -6.441464,
3.558019, -3.409896, 5.640468,
3.558019, 3.643098, -6.441464,
3.558019, 3.643098, 5.640468
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
var radius = 8.239871;
var distance = 36.66012;
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
mvMatrix.translate( -0.3022954, -0.1166011, 0.4004984 );
mvMatrix.scale( 1.368223, 1.263167, 0.7373912 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.66012);
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
indanofan<-read.table("indanofan.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-indanofan$V2
```

```
## Error in eval(expr, envir, enclos): object 'indanofan' not found
```

```r
y<-indanofan$V3
```

```
## Error in eval(expr, envir, enclos): object 'indanofan' not found
```

```r
z<-indanofan$V4
```

```
## Error in eval(expr, envir, enclos): object 'indanofan' not found
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
-2.858601, 0.4985508, -1.183962, 0, 0, 1, 1, 1,
-2.693986, 0.4362317, -2.620805, 1, 0, 0, 1, 1,
-2.661102, 0.2427294, -1.319811, 1, 0, 0, 1, 1,
-2.648479, 0.1988567, -0.9501894, 1, 0, 0, 1, 1,
-2.498064, -0.006049132, -1.528787, 1, 0, 0, 1, 1,
-2.493222, -0.1811711, -2.416351, 1, 0, 0, 1, 1,
-2.485846, 0.7931064, -2.253471, 0, 0, 0, 1, 1,
-2.484537, 0.1476506, 0.2700945, 0, 0, 0, 1, 1,
-2.439349, -1.056744, -0.2424803, 0, 0, 0, 1, 1,
-2.351268, 0.2308186, -0.8077299, 0, 0, 0, 1, 1,
-2.349812, 0.3342614, 0.8209899, 0, 0, 0, 1, 1,
-2.335726, 0.4038524, -2.413397, 0, 0, 0, 1, 1,
-2.314418, 0.1777429, 0.3548166, 0, 0, 0, 1, 1,
-2.313547, 0.5416373, -0.9361611, 1, 1, 1, 1, 1,
-2.294889, 0.2920457, -0.7982544, 1, 1, 1, 1, 1,
-2.234233, 0.6600648, -2.600593, 1, 1, 1, 1, 1,
-2.204402, 0.7469676, -1.698778, 1, 1, 1, 1, 1,
-2.185252, 0.1407133, -1.527453, 1, 1, 1, 1, 1,
-2.177435, 0.005082326, -1.370064, 1, 1, 1, 1, 1,
-2.175691, 1.060953, -1.621448, 1, 1, 1, 1, 1,
-2.166505, 0.2378404, 1.154916, 1, 1, 1, 1, 1,
-2.111197, 0.8836163, -1.761157, 1, 1, 1, 1, 1,
-2.097513, 0.9309617, -1.031682, 1, 1, 1, 1, 1,
-2.095068, 1.00674, 0.3178791, 1, 1, 1, 1, 1,
-2.083311, -0.7141789, -1.554152, 1, 1, 1, 1, 1,
-2.070257, 1.044453, -0.8045744, 1, 1, 1, 1, 1,
-1.991837, 0.1734686, 0.09190013, 1, 1, 1, 1, 1,
-1.942846, -0.9775774, -2.751797, 1, 1, 1, 1, 1,
-1.938862, 0.3244702, -2.467273, 0, 0, 1, 1, 1,
-1.924097, -0.5731004, -1.23341, 1, 0, 0, 1, 1,
-1.909205, 1.861108, -1.745319, 1, 0, 0, 1, 1,
-1.893014, 0.2875621, -3.509244, 1, 0, 0, 1, 1,
-1.891444, 0.2829949, -2.468172, 1, 0, 0, 1, 1,
-1.849199, -0.8742124, -1.555126, 1, 0, 0, 1, 1,
-1.825983, 0.4545863, -3.21706, 0, 0, 0, 1, 1,
-1.820643, -0.7635821, -1.686598, 0, 0, 0, 1, 1,
-1.801121, 0.2553029, -1.679646, 0, 0, 0, 1, 1,
-1.743881, 0.6078711, -1.795266, 0, 0, 0, 1, 1,
-1.731087, 0.8593595, -1.297356, 0, 0, 0, 1, 1,
-1.730594, -0.05762534, -0.4987158, 0, 0, 0, 1, 1,
-1.723438, -0.4366531, -2.390855, 0, 0, 0, 1, 1,
-1.718979, 1.178638, -1.233016, 1, 1, 1, 1, 1,
-1.701508, 1.152021, -0.3806489, 1, 1, 1, 1, 1,
-1.666866, 0.5680853, -0.1598113, 1, 1, 1, 1, 1,
-1.657783, -0.9795998, -2.202836, 1, 1, 1, 1, 1,
-1.650781, -2.739454, -3.396049, 1, 1, 1, 1, 1,
-1.638204, 1.660518, -2.724458, 1, 1, 1, 1, 1,
-1.616506, 1.529277, -0.9819418, 1, 1, 1, 1, 1,
-1.602013, -0.562306, -2.063245, 1, 1, 1, 1, 1,
-1.597833, 0.6099689, -1.184367, 1, 1, 1, 1, 1,
-1.587037, 0.1662017, -1.21905, 1, 1, 1, 1, 1,
-1.583956, -1.282925, -1.750988, 1, 1, 1, 1, 1,
-1.57433, -0.5042548, -3.835742, 1, 1, 1, 1, 1,
-1.563641, 1.432572, -1.86621, 1, 1, 1, 1, 1,
-1.559613, 0.1066635, -1.838311, 1, 1, 1, 1, 1,
-1.558924, 0.4037922, -3.437446, 1, 1, 1, 1, 1,
-1.555916, -0.03526859, -0.5062342, 0, 0, 1, 1, 1,
-1.551996, 1.093349, 0.4542783, 1, 0, 0, 1, 1,
-1.549956, 0.01552263, -1.902595, 1, 0, 0, 1, 1,
-1.546678, 0.3216713, -1.283405, 1, 0, 0, 1, 1,
-1.512437, 0.9453384, -1.149363, 1, 0, 0, 1, 1,
-1.510592, 0.273498, -1.723094, 1, 0, 0, 1, 1,
-1.50694, 0.485525, -0.5431734, 0, 0, 0, 1, 1,
-1.491676, -2.219189, -1.956811, 0, 0, 0, 1, 1,
-1.48593, -1.313214, -1.059822, 0, 0, 0, 1, 1,
-1.479031, -0.2058961, -0.5778121, 0, 0, 0, 1, 1,
-1.472466, -0.5498565, -1.979706, 0, 0, 0, 1, 1,
-1.467841, -0.5309083, -2.61436, 0, 0, 0, 1, 1,
-1.463646, 0.1696427, -1.220919, 0, 0, 0, 1, 1,
-1.454714, 0.4376451, -0.6131767, 1, 1, 1, 1, 1,
-1.448667, 0.2214269, -2.100673, 1, 1, 1, 1, 1,
-1.448182, 1.025044, -3.094943, 1, 1, 1, 1, 1,
-1.432881, -1.230502, -2.41512, 1, 1, 1, 1, 1,
-1.427078, -0.07573864, -2.183172, 1, 1, 1, 1, 1,
-1.425331, 0.1958864, -1.294651, 1, 1, 1, 1, 1,
-1.405705, -0.5713374, -3.489867, 1, 1, 1, 1, 1,
-1.399712, 0.6123294, -0.499872, 1, 1, 1, 1, 1,
-1.393224, -2.278533, -2.94534, 1, 1, 1, 1, 1,
-1.393055, -0.7130697, -2.570436, 1, 1, 1, 1, 1,
-1.391998, -1.116706, -2.181792, 1, 1, 1, 1, 1,
-1.37925, -1.929229, -2.267147, 1, 1, 1, 1, 1,
-1.367027, 0.1140233, -3.906377, 1, 1, 1, 1, 1,
-1.365608, 0.9886923, -0.246958, 1, 1, 1, 1, 1,
-1.365224, -0.6559711, -0.3362426, 1, 1, 1, 1, 1,
-1.355451, 0.9514945, -2.509126, 0, 0, 1, 1, 1,
-1.35381, 0.7272449, -0.796106, 1, 0, 0, 1, 1,
-1.350854, 0.4044396, -2.597326, 1, 0, 0, 1, 1,
-1.349048, 0.5711949, -1.726609, 1, 0, 0, 1, 1,
-1.340164, 0.8901003, 1.526905, 1, 0, 0, 1, 1,
-1.311436, 0.2271117, -2.250862, 1, 0, 0, 1, 1,
-1.30961, 0.2555383, -1.514497, 0, 0, 0, 1, 1,
-1.304282, -0.8819668, -2.023336, 0, 0, 0, 1, 1,
-1.302599, -0.284191, -1.535894, 0, 0, 0, 1, 1,
-1.295506, 0.07699696, -2.420836, 0, 0, 0, 1, 1,
-1.295076, -0.2972703, -2.547504, 0, 0, 0, 1, 1,
-1.294407, -0.8372839, -1.956561, 0, 0, 0, 1, 1,
-1.292928, 0.9849261, -1.756326, 0, 0, 0, 1, 1,
-1.292598, 0.7365023, -0.204116, 1, 1, 1, 1, 1,
-1.290269, -1.16734, -1.409059, 1, 1, 1, 1, 1,
-1.282568, 0.1650094, -1.615282, 1, 1, 1, 1, 1,
-1.279732, -0.3422492, -0.4044689, 1, 1, 1, 1, 1,
-1.272108, 1.21836, -0.8104053, 1, 1, 1, 1, 1,
-1.268316, 0.5845252, -1.742581, 1, 1, 1, 1, 1,
-1.266624, -0.7490143, -1.911103, 1, 1, 1, 1, 1,
-1.264501, -1.045761, -3.30486, 1, 1, 1, 1, 1,
-1.248965, 0.5013196, -1.117372, 1, 1, 1, 1, 1,
-1.243763, 0.5267711, -2.72646, 1, 1, 1, 1, 1,
-1.243267, -0.8619012, -1.675067, 1, 1, 1, 1, 1,
-1.239674, 0.9416394, -0.8984743, 1, 1, 1, 1, 1,
-1.23472, 0.4746675, -1.901217, 1, 1, 1, 1, 1,
-1.234077, 0.883938, -2.12243, 1, 1, 1, 1, 1,
-1.221978, 0.2019818, -1.193603, 1, 1, 1, 1, 1,
-1.215779, 1.983192, -0.5170198, 0, 0, 1, 1, 1,
-1.21279, -1.389313, -2.352792, 1, 0, 0, 1, 1,
-1.210075, -0.3632933, -0.6155686, 1, 0, 0, 1, 1,
-1.205593, -0.3500282, -2.64724, 1, 0, 0, 1, 1,
-1.202146, -1.540483, -2.90988, 1, 0, 0, 1, 1,
-1.193718, 0.5704705, -1.035707, 1, 0, 0, 1, 1,
-1.188082, 0.927299, -0.7306432, 0, 0, 0, 1, 1,
-1.187922, 2.140656, -1.692786, 0, 0, 0, 1, 1,
-1.185478, -0.7630548, -0.6033164, 0, 0, 0, 1, 1,
-1.177683, -0.4334611, -4.032986, 0, 0, 0, 1, 1,
-1.168047, 0.5041702, -1.586013, 0, 0, 0, 1, 1,
-1.163271, -0.5704592, -2.199204, 0, 0, 0, 1, 1,
-1.155268, 0.86589, -1.483281, 0, 0, 0, 1, 1,
-1.139077, -1.023193, -2.598308, 1, 1, 1, 1, 1,
-1.132342, 0.01957821, -1.476661, 1, 1, 1, 1, 1,
-1.131457, -0.4159997, -2.186043, 1, 1, 1, 1, 1,
-1.130343, -0.1688707, -2.693018, 1, 1, 1, 1, 1,
-1.128642, 1.509962, -0.2474684, 1, 1, 1, 1, 1,
-1.127033, 0.8742543, -1.683915, 1, 1, 1, 1, 1,
-1.114094, -0.3379406, -3.225686, 1, 1, 1, 1, 1,
-1.111012, -0.4260105, -1.388251, 1, 1, 1, 1, 1,
-1.102932, 0.7012365, -1.15088, 1, 1, 1, 1, 1,
-1.099998, -0.2826363, -2.282434, 1, 1, 1, 1, 1,
-1.094472, -0.06617676, -0.9408358, 1, 1, 1, 1, 1,
-1.089423, 0.4014251, -1.053413, 1, 1, 1, 1, 1,
-1.089313, 2.281224, 0.04943995, 1, 1, 1, 1, 1,
-1.085629, -1.409436, -1.645938, 1, 1, 1, 1, 1,
-1.081795, 0.7960833, -1.445147, 1, 1, 1, 1, 1,
-1.080889, -1.83495, -1.286478, 0, 0, 1, 1, 1,
-1.064237, -0.3182287, -0.3476625, 1, 0, 0, 1, 1,
-1.059478, 0.6915979, -0.715914, 1, 0, 0, 1, 1,
-1.058269, -0.4985801, -3.49959, 1, 0, 0, 1, 1,
-1.054156, 0.1625515, -2.455936, 1, 0, 0, 1, 1,
-1.05093, -1.05085, -4.094111, 1, 0, 0, 1, 1,
-1.045602, -1.503325, -1.890674, 0, 0, 0, 1, 1,
-1.042965, 0.759748, -0.9565012, 0, 0, 0, 1, 1,
-1.039036, 1.429725, -0.8015893, 0, 0, 0, 1, 1,
-1.037772, 0.7289925, 0.44056, 0, 0, 0, 1, 1,
-1.035658, -1.340465, -2.860898, 0, 0, 0, 1, 1,
-1.034607, -0.9218605, -4.415728, 0, 0, 0, 1, 1,
-1.031824, 0.8987314, -1.930235, 0, 0, 0, 1, 1,
-1.025809, -1.12465, -3.22622, 1, 1, 1, 1, 1,
-1.025611, 0.05280548, -0.1555053, 1, 1, 1, 1, 1,
-1.005853, 1.093919, -2.504221, 1, 1, 1, 1, 1,
-1.004448, 0.3035788, -1.682721, 1, 1, 1, 1, 1,
-0.9999488, 0.8477339, -1.357378, 1, 1, 1, 1, 1,
-0.9992201, 0.5874664, -0.7659717, 1, 1, 1, 1, 1,
-0.9953682, -0.0006896147, -1.47307, 1, 1, 1, 1, 1,
-0.9940454, 0.3665433, -0.4622617, 1, 1, 1, 1, 1,
-0.9934759, 0.361087, -3.040072, 1, 1, 1, 1, 1,
-0.9931611, -1.241223, -1.64188, 1, 1, 1, 1, 1,
-0.9911178, 0.4532158, -1.96723, 1, 1, 1, 1, 1,
-0.9897742, 1.283312, -1.941467, 1, 1, 1, 1, 1,
-0.98751, -0.05122742, -1.948067, 1, 1, 1, 1, 1,
-0.9854591, 0.03097975, -1.002647, 1, 1, 1, 1, 1,
-0.9830189, 1.125284, -1.012143, 1, 1, 1, 1, 1,
-0.9699186, -0.2732464, -3.848193, 0, 0, 1, 1, 1,
-0.9655473, -0.1528305, -3.071685, 1, 0, 0, 1, 1,
-0.9593414, 0.3918821, -0.9403726, 1, 0, 0, 1, 1,
-0.9573771, 2.009065, -1.799704, 1, 0, 0, 1, 1,
-0.9531174, -0.9932535, -1.761235, 1, 0, 0, 1, 1,
-0.9523849, 0.4967101, -1.148287, 1, 0, 0, 1, 1,
-0.9435706, 0.4112366, -0.5397269, 0, 0, 0, 1, 1,
-0.9324831, 0.0530346, -2.889007, 0, 0, 0, 1, 1,
-0.9312286, 2.179017, 0.1554713, 0, 0, 0, 1, 1,
-0.9308924, 0.3025463, -0.8611069, 0, 0, 0, 1, 1,
-0.9305831, -2.112596, -3.387289, 0, 0, 0, 1, 1,
-0.925401, -0.481623, -1.792421, 0, 0, 0, 1, 1,
-0.9163029, 1.363907, -1.079955, 0, 0, 0, 1, 1,
-0.9120558, 0.06655117, -2.084027, 1, 1, 1, 1, 1,
-0.9016806, -0.05629201, -1.605447, 1, 1, 1, 1, 1,
-0.8990078, 0.970601, -1.704082, 1, 1, 1, 1, 1,
-0.8988596, -0.02096701, -0.9336025, 1, 1, 1, 1, 1,
-0.898814, -0.8113953, -1.13369, 1, 1, 1, 1, 1,
-0.8961352, -0.1137645, -0.3390508, 1, 1, 1, 1, 1,
-0.8947192, 0.4052796, -1.331028, 1, 1, 1, 1, 1,
-0.8776557, -0.3467806, -2.037927, 1, 1, 1, 1, 1,
-0.873989, -0.2841846, -0.7292988, 1, 1, 1, 1, 1,
-0.8719465, -0.9600453, -2.123614, 1, 1, 1, 1, 1,
-0.869247, -0.02261998, -1.256136, 1, 1, 1, 1, 1,
-0.8668275, 0.4216946, -0.04152573, 1, 1, 1, 1, 1,
-0.8666666, 0.7531647, -0.4979285, 1, 1, 1, 1, 1,
-0.8606156, -1.010545, -2.14613, 1, 1, 1, 1, 1,
-0.8600265, 1.216098, -0.874566, 1, 1, 1, 1, 1,
-0.8554144, -1.074172, -1.589303, 0, 0, 1, 1, 1,
-0.8491216, 0.2250379, -1.002763, 1, 0, 0, 1, 1,
-0.8471487, 0.5543034, 0.2156183, 1, 0, 0, 1, 1,
-0.8364235, 0.6725937, -0.273149, 1, 0, 0, 1, 1,
-0.8363317, 0.3685656, -3.080633, 1, 0, 0, 1, 1,
-0.8355774, -0.9286479, -2.328022, 1, 0, 0, 1, 1,
-0.8333032, -0.6065878, -2.817179, 0, 0, 0, 1, 1,
-0.8299243, 0.5780122, -1.691624, 0, 0, 0, 1, 1,
-0.8284692, -0.2084054, -2.237687, 0, 0, 0, 1, 1,
-0.8267541, 0.09021089, 0.1690697, 0, 0, 0, 1, 1,
-0.8239954, 0.4399975, -2.145548, 0, 0, 0, 1, 1,
-0.8154135, 0.1505521, -0.9278933, 0, 0, 0, 1, 1,
-0.8141209, 2.304885, 0.1108133, 0, 0, 0, 1, 1,
-0.8119238, -0.09253264, -1.80178, 1, 1, 1, 1, 1,
-0.8102184, -0.179028, -1.567677, 1, 1, 1, 1, 1,
-0.8099704, 0.4111135, -2.700266, 1, 1, 1, 1, 1,
-0.8093772, -0.5771921, -1.808996, 1, 1, 1, 1, 1,
-0.8060275, -0.3646823, -1.314989, 1, 1, 1, 1, 1,
-0.8041383, 0.2650016, -2.626272, 1, 1, 1, 1, 1,
-0.8033469, 0.9715784, -1.111317, 1, 1, 1, 1, 1,
-0.798691, -1.851867, -1.914957, 1, 1, 1, 1, 1,
-0.7980457, -0.02364418, -1.466956, 1, 1, 1, 1, 1,
-0.7940818, -0.9926783, -2.091712, 1, 1, 1, 1, 1,
-0.7939297, 0.3911257, -0.8223622, 1, 1, 1, 1, 1,
-0.788435, 0.6278448, 1.025445, 1, 1, 1, 1, 1,
-0.7871037, 1.462286, 2.036975, 1, 1, 1, 1, 1,
-0.7830279, 0.7122052, -1.316068, 1, 1, 1, 1, 1,
-0.7827461, 0.1354622, -1.526891, 1, 1, 1, 1, 1,
-0.7755483, -0.6192315, -2.074164, 0, 0, 1, 1, 1,
-0.7746536, -0.7465519, -3.360904, 1, 0, 0, 1, 1,
-0.7616366, 0.5486056, -0.8836139, 1, 0, 0, 1, 1,
-0.7598564, 0.007712635, -1.595557, 1, 0, 0, 1, 1,
-0.7558756, -1.06666, -3.63951, 1, 0, 0, 1, 1,
-0.7531328, -0.2601882, -3.074908, 1, 0, 0, 1, 1,
-0.7506117, 1.20468, -1.723582, 0, 0, 0, 1, 1,
-0.7494264, -0.2767234, -2.960517, 0, 0, 0, 1, 1,
-0.7493696, 0.2691811, 0.1891907, 0, 0, 0, 1, 1,
-0.7364212, 0.6785263, -1.528592, 0, 0, 0, 1, 1,
-0.7324535, -0.3297017, -1.081724, 0, 0, 0, 1, 1,
-0.7310107, -0.3281762, -0.387219, 0, 0, 0, 1, 1,
-0.7293018, 1.050228, -0.09918322, 0, 0, 0, 1, 1,
-0.7268821, -0.3230188, -1.074127, 1, 1, 1, 1, 1,
-0.721579, 0.1629905, 0.3059964, 1, 1, 1, 1, 1,
-0.712955, 0.2817718, -0.7445498, 1, 1, 1, 1, 1,
-0.7089674, -0.09559676, -1.612262, 1, 1, 1, 1, 1,
-0.7038969, 1.295476, 0.9105032, 1, 1, 1, 1, 1,
-0.7015232, -0.09815441, -0.9502063, 1, 1, 1, 1, 1,
-0.695597, -1.28684, -4.318828, 1, 1, 1, 1, 1,
-0.6907519, 0.2062956, -0.1826286, 1, 1, 1, 1, 1,
-0.6895421, 1.059747, -0.5273127, 1, 1, 1, 1, 1,
-0.6867861, -0.8824561, -2.115092, 1, 1, 1, 1, 1,
-0.6846634, 1.071674, -2.035654, 1, 1, 1, 1, 1,
-0.6838835, -0.09174568, -0.8991328, 1, 1, 1, 1, 1,
-0.6781833, 1.152516, -0.7736494, 1, 1, 1, 1, 1,
-0.6769738, -1.597306, -4.141287, 1, 1, 1, 1, 1,
-0.6741268, 0.3438187, -1.315584, 1, 1, 1, 1, 1,
-0.6740196, 0.09569491, -0.6226757, 0, 0, 1, 1, 1,
-0.6691228, 0.3594355, -0.9804315, 1, 0, 0, 1, 1,
-0.6651409, 0.6124907, -0.2129926, 1, 0, 0, 1, 1,
-0.6638467, 0.5561453, -3.976531, 1, 0, 0, 1, 1,
-0.6602467, 2.417299, 0.211821, 1, 0, 0, 1, 1,
-0.6553476, -0.2945636, -1.679981, 1, 0, 0, 1, 1,
-0.6510591, 0.6456176, -0.9833896, 0, 0, 0, 1, 1,
-0.6484134, -0.3367887, -2.034646, 0, 0, 0, 1, 1,
-0.6470366, -0.1145309, -2.518806, 0, 0, 0, 1, 1,
-0.6465312, -1.237897, -4.250707, 0, 0, 0, 1, 1,
-0.6456755, 0.1369837, -0.5280321, 0, 0, 0, 1, 1,
-0.6401798, -0.1215648, -2.719064, 0, 0, 0, 1, 1,
-0.6336166, 0.775335, -2.184596, 0, 0, 0, 1, 1,
-0.6285881, 1.024711, -0.04916087, 1, 1, 1, 1, 1,
-0.6268359, -0.4570243, -3.078347, 1, 1, 1, 1, 1,
-0.6249456, 1.3776, -1.218972, 1, 1, 1, 1, 1,
-0.6230622, -0.05747892, -1.705933, 1, 1, 1, 1, 1,
-0.6227682, -0.8989947, -3.107081, 1, 1, 1, 1, 1,
-0.622328, 1.076719, -3.162294, 1, 1, 1, 1, 1,
-0.6188551, -1.669317, -1.998088, 1, 1, 1, 1, 1,
-0.6087378, 1.048784, -0.5634445, 1, 1, 1, 1, 1,
-0.6085822, -0.7729073, -1.028394, 1, 1, 1, 1, 1,
-0.6058281, 0.3713789, 0.2108937, 1, 1, 1, 1, 1,
-0.6004074, -0.6229755, -3.298951, 1, 1, 1, 1, 1,
-0.5998481, -0.2541155, -1.306026, 1, 1, 1, 1, 1,
-0.5957063, -1.230023, -2.851934, 1, 1, 1, 1, 1,
-0.5933067, 1.441955, 1.659487, 1, 1, 1, 1, 1,
-0.5892375, -1.128159, -1.60107, 1, 1, 1, 1, 1,
-0.5871252, 0.1831127, -0.4088679, 0, 0, 1, 1, 1,
-0.5857925, -0.03124943, -1.394148, 1, 0, 0, 1, 1,
-0.5831761, -1.707306, -3.862982, 1, 0, 0, 1, 1,
-0.5831072, 1.845132, 1.519736, 1, 0, 0, 1, 1,
-0.582532, 0.0820081, -0.3696951, 1, 0, 0, 1, 1,
-0.5774561, -1.716853, -4.65176, 1, 0, 0, 1, 1,
-0.5632413, 0.6576421, 0.5888222, 0, 0, 0, 1, 1,
-0.5626332, -0.8506221, -2.349761, 0, 0, 0, 1, 1,
-0.5622799, -1.014517, -1.879476, 0, 0, 0, 1, 1,
-0.5616351, 0.7279512, -0.2647643, 0, 0, 0, 1, 1,
-0.5569558, 0.3878244, -1.654312, 0, 0, 0, 1, 1,
-0.5556986, 1.410392, -1.491385, 0, 0, 0, 1, 1,
-0.5439747, -0.2959726, -1.85511, 0, 0, 0, 1, 1,
-0.5429066, 1.311089, 0.9098436, 1, 1, 1, 1, 1,
-0.5394881, -0.5708925, -1.560702, 1, 1, 1, 1, 1,
-0.5295555, 0.819923, 0.4179569, 1, 1, 1, 1, 1,
-0.5292237, 0.5510338, 0.2258047, 1, 1, 1, 1, 1,
-0.5224116, -2.016066, -2.243118, 1, 1, 1, 1, 1,
-0.5206689, 0.2104036, -1.027411, 1, 1, 1, 1, 1,
-0.519913, 0.7374908, -1.127053, 1, 1, 1, 1, 1,
-0.5125045, -0.4978799, -0.5613425, 1, 1, 1, 1, 1,
-0.5102143, 0.4166127, -1.302463, 1, 1, 1, 1, 1,
-0.5060713, 0.766739, 0.2674752, 1, 1, 1, 1, 1,
-0.499121, -1.196105, -3.222156, 1, 1, 1, 1, 1,
-0.4986004, 0.6962328, 0.780917, 1, 1, 1, 1, 1,
-0.4923503, -0.5716112, -1.617102, 1, 1, 1, 1, 1,
-0.4921444, 1.271889, -0.09416318, 1, 1, 1, 1, 1,
-0.475908, -1.03828, -2.602978, 1, 1, 1, 1, 1,
-0.4752519, 1.59702, -1.279334, 0, 0, 1, 1, 1,
-0.4738612, 1.385509, -0.4949509, 1, 0, 0, 1, 1,
-0.4730268, 0.5682983, -1.791293, 1, 0, 0, 1, 1,
-0.4708104, 0.55735, 0.843505, 1, 0, 0, 1, 1,
-0.4703985, 0.9230594, -1.272192, 1, 0, 0, 1, 1,
-0.4688035, 0.5693578, -1.217576, 1, 0, 0, 1, 1,
-0.4675208, -0.3366727, -1.330044, 0, 0, 0, 1, 1,
-0.4643137, -0.9783736, -2.280774, 0, 0, 0, 1, 1,
-0.4633599, 0.5528326, -0.04814891, 0, 0, 0, 1, 1,
-0.4632576, 0.3802696, -0.8354888, 0, 0, 0, 1, 1,
-0.4625593, -2.02741, -3.105929, 0, 0, 0, 1, 1,
-0.4617774, 0.1146657, -1.71751, 0, 0, 0, 1, 1,
-0.4553266, -0.05901416, 0.4198071, 0, 0, 0, 1, 1,
-0.4546074, -1.185963, -2.067272, 1, 1, 1, 1, 1,
-0.4519165, -0.7263507, -2.231467, 1, 1, 1, 1, 1,
-0.4449748, -0.1857443, -1.895964, 1, 1, 1, 1, 1,
-0.4437091, -0.4387755, -2.577788, 1, 1, 1, 1, 1,
-0.4408108, 0.3806865, -0.9679634, 1, 1, 1, 1, 1,
-0.4376419, -0.1613327, -0.8551285, 1, 1, 1, 1, 1,
-0.431087, 3.540385, 0.5323614, 1, 1, 1, 1, 1,
-0.4297666, -0.5595316, -3.613156, 1, 1, 1, 1, 1,
-0.4280315, -0.2052801, -0.9724514, 1, 1, 1, 1, 1,
-0.4279675, -0.02267515, -3.419584, 1, 1, 1, 1, 1,
-0.4265318, 0.6078207, 0.3565415, 1, 1, 1, 1, 1,
-0.4225965, 0.2344823, -0.4787074, 1, 1, 1, 1, 1,
-0.4206511, -0.9246503, -1.401931, 1, 1, 1, 1, 1,
-0.4198035, 0.4949948, -2.160456, 1, 1, 1, 1, 1,
-0.4194551, 0.1862892, -0.06382941, 1, 1, 1, 1, 1,
-0.4186434, -0.3109713, -1.710981, 0, 0, 1, 1, 1,
-0.4117698, 0.2430592, 0.2935345, 1, 0, 0, 1, 1,
-0.4109622, 1.06153, 0.3503075, 1, 0, 0, 1, 1,
-0.4060189, -0.1273591, -3.108363, 1, 0, 0, 1, 1,
-0.4037921, 1.71782, 0.9218048, 1, 0, 0, 1, 1,
-0.4032708, -0.2252215, -4.323832, 1, 0, 0, 1, 1,
-0.3899049, 0.8373165, -0.7780704, 0, 0, 0, 1, 1,
-0.3886944, -2.414864, -2.601792, 0, 0, 0, 1, 1,
-0.3870542, 0.007637642, -2.140089, 0, 0, 0, 1, 1,
-0.3852063, -0.6721061, -1.680886, 0, 0, 0, 1, 1,
-0.3831413, -0.0402325, -1.630878, 0, 0, 0, 1, 1,
-0.3831306, 1.260109, -1.762435, 0, 0, 0, 1, 1,
-0.3820924, -0.3729517, -2.333961, 0, 0, 0, 1, 1,
-0.3817327, 0.6973274, -1.90013, 1, 1, 1, 1, 1,
-0.3798899, -0.4484244, -2.753245, 1, 1, 1, 1, 1,
-0.3798833, 0.4658217, -2.689327, 1, 1, 1, 1, 1,
-0.3790622, -0.1332972, -1.621338, 1, 1, 1, 1, 1,
-0.3772479, -1.230298, -3.105626, 1, 1, 1, 1, 1,
-0.376267, 0.3328218, -1.909052, 1, 1, 1, 1, 1,
-0.3757425, -0.4484968, -1.255025, 1, 1, 1, 1, 1,
-0.3745142, -0.02497832, -3.607191, 1, 1, 1, 1, 1,
-0.3716297, 1.203796, 0.4220617, 1, 1, 1, 1, 1,
-0.3697359, 0.526118, -0.8942329, 1, 1, 1, 1, 1,
-0.3689214, 0.210236, -0.6911574, 1, 1, 1, 1, 1,
-0.3683203, -1.576556, -2.867441, 1, 1, 1, 1, 1,
-0.3648956, 0.5786186, -0.531234, 1, 1, 1, 1, 1,
-0.3625169, -1.497952, -2.661186, 1, 1, 1, 1, 1,
-0.3551374, -0.6092363, -4.055695, 1, 1, 1, 1, 1,
-0.3515558, -1.591449, -3.163028, 0, 0, 1, 1, 1,
-0.350215, 0.7585646, -2.37071, 1, 0, 0, 1, 1,
-0.3498147, 0.04398351, -2.327249, 1, 0, 0, 1, 1,
-0.348078, -0.829089, -1.716466, 1, 0, 0, 1, 1,
-0.3477453, -1.332424, -4.06533, 1, 0, 0, 1, 1,
-0.342661, -0.5152487, -0.9607893, 1, 0, 0, 1, 1,
-0.3415159, -0.4203685, -1.391078, 0, 0, 0, 1, 1,
-0.34051, -0.04614436, -3.494265, 0, 0, 0, 1, 1,
-0.3379356, -0.1602644, -1.694181, 0, 0, 0, 1, 1,
-0.3377557, -0.2463686, -1.554891, 0, 0, 0, 1, 1,
-0.3352917, -1.865473, -2.751158, 0, 0, 0, 1, 1,
-0.3344199, -1.774114, -3.717604, 0, 0, 0, 1, 1,
-0.3329248, -0.761196, -3.19308, 0, 0, 0, 1, 1,
-0.3294869, 1.492758, 1.09109, 1, 1, 1, 1, 1,
-0.3292356, 0.6174634, 0.6958643, 1, 1, 1, 1, 1,
-0.3288209, -0.4568093, -0.816108, 1, 1, 1, 1, 1,
-0.3217672, -1.943868, -2.655988, 1, 1, 1, 1, 1,
-0.3198187, 1.208583, 1.021109, 1, 1, 1, 1, 1,
-0.3169765, -0.7130202, -2.256657, 1, 1, 1, 1, 1,
-0.3129987, -0.3183136, -1.66882, 1, 1, 1, 1, 1,
-0.3129837, 0.9677173, -1.69726, 1, 1, 1, 1, 1,
-0.3115185, 1.271564, 1.786667, 1, 1, 1, 1, 1,
-0.3074643, -0.6792184, -3.263322, 1, 1, 1, 1, 1,
-0.3066395, 0.1356625, 0.1757921, 1, 1, 1, 1, 1,
-0.3056843, -1.885839, -3.077761, 1, 1, 1, 1, 1,
-0.3025268, 0.5215517, -0.9397998, 1, 1, 1, 1, 1,
-0.3016534, 0.6982775, -0.5592379, 1, 1, 1, 1, 1,
-0.3016407, 0.1796653, -0.3775834, 1, 1, 1, 1, 1,
-0.3011552, -1.283136, -2.698389, 0, 0, 1, 1, 1,
-0.3009636, -0.9812137, -2.686373, 1, 0, 0, 1, 1,
-0.2988773, -0.3437038, -0.6480837, 1, 0, 0, 1, 1,
-0.2915335, -1.480461, -3.465806, 1, 0, 0, 1, 1,
-0.2909935, 1.770947, 0.4750513, 1, 0, 0, 1, 1,
-0.2779779, 0.8409663, -0.4094878, 1, 0, 0, 1, 1,
-0.2737688, 0.8864204, 0.4227948, 0, 0, 0, 1, 1,
-0.2708091, 0.2418191, 0.1010359, 0, 0, 0, 1, 1,
-0.2695539, -0.3111866, 0.04055936, 0, 0, 0, 1, 1,
-0.266102, 2.520415, 0.1124023, 0, 0, 0, 1, 1,
-0.2659186, -0.5503585, -1.242964, 0, 0, 0, 1, 1,
-0.2635094, -0.7525002, -3.577611, 0, 0, 0, 1, 1,
-0.257564, 0.02882934, -0.8118883, 0, 0, 0, 1, 1,
-0.2531586, 1.97474, -2.451516, 1, 1, 1, 1, 1,
-0.2467739, -1.087374, -3.185238, 1, 1, 1, 1, 1,
-0.2440891, -0.09951476, -1.146914, 1, 1, 1, 1, 1,
-0.2416606, -0.4047264, -3.243108, 1, 1, 1, 1, 1,
-0.2355146, -1.211877, -3.506013, 1, 1, 1, 1, 1,
-0.2348456, 1.503813, -0.538374, 1, 1, 1, 1, 1,
-0.228918, 0.1198557, -1.986506, 1, 1, 1, 1, 1,
-0.2266343, -1.276776, -2.68055, 1, 1, 1, 1, 1,
-0.2222952, -0.5830597, -3.801863, 1, 1, 1, 1, 1,
-0.2180358, 0.2547601, -0.5610371, 1, 1, 1, 1, 1,
-0.2134222, 0.7443032, 0.6326501, 1, 1, 1, 1, 1,
-0.2130281, 0.1118052, -1.976443, 1, 1, 1, 1, 1,
-0.2124467, -0.1864274, -0.4242178, 1, 1, 1, 1, 1,
-0.2085174, -1.153255, -3.508943, 1, 1, 1, 1, 1,
-0.2032138, 0.8474498, -1.777297, 1, 1, 1, 1, 1,
-0.2027042, 0.7833405, -0.8462092, 0, 0, 1, 1, 1,
-0.2025342, -2.292217, -5.070214, 1, 0, 0, 1, 1,
-0.2015522, -1.216175, -2.834632, 1, 0, 0, 1, 1,
-0.2014553, -1.449583, -2.783405, 1, 0, 0, 1, 1,
-0.2000563, -0.370901, -1.991462, 1, 0, 0, 1, 1,
-0.1980585, 1.193087, -0.4845072, 1, 0, 0, 1, 1,
-0.1958201, -0.69029, -1.933644, 0, 0, 0, 1, 1,
-0.1954791, -0.03587122, -1.548685, 0, 0, 0, 1, 1,
-0.1724019, -0.3626336, -2.960723, 0, 0, 0, 1, 1,
-0.1696864, -0.09212399, -1.517031, 0, 0, 0, 1, 1,
-0.1680647, 0.3615972, -2.205026, 0, 0, 0, 1, 1,
-0.1664953, 1.126552, 0.9194978, 0, 0, 0, 1, 1,
-0.1657907, 1.415329, 2.592767, 0, 0, 0, 1, 1,
-0.1650606, -0.3569837, -3.393497, 1, 1, 1, 1, 1,
-0.1607843, -0.5080199, -2.835653, 1, 1, 1, 1, 1,
-0.1592131, 0.1601384, 0.7936636, 1, 1, 1, 1, 1,
-0.1523571, -0.0109484, -2.364861, 1, 1, 1, 1, 1,
-0.1481985, -1.177065, -2.88714, 1, 1, 1, 1, 1,
-0.1475272, 1.157237, -0.08010612, 1, 1, 1, 1, 1,
-0.1449141, 0.5335813, -0.7265503, 1, 1, 1, 1, 1,
-0.1395363, 1.256353, -0.07153296, 1, 1, 1, 1, 1,
-0.1395129, 1.380805, 0.4933373, 1, 1, 1, 1, 1,
-0.1359121, -1.080977, -4.478871, 1, 1, 1, 1, 1,
-0.1355789, 0.7031293, -0.4157007, 1, 1, 1, 1, 1,
-0.133243, -1.449391, -1.675659, 1, 1, 1, 1, 1,
-0.131322, -0.9526732, -1.429236, 1, 1, 1, 1, 1,
-0.1289055, 0.09594711, -0.1221019, 1, 1, 1, 1, 1,
-0.1261687, 0.4683627, -0.8095427, 1, 1, 1, 1, 1,
-0.1232434, -0.9525778, -2.528649, 0, 0, 1, 1, 1,
-0.1204059, -0.5755617, -1.723322, 1, 0, 0, 1, 1,
-0.1179803, 0.4397745, 0.736146, 1, 0, 0, 1, 1,
-0.1168564, 0.69635, -0.9911164, 1, 0, 0, 1, 1,
-0.1119762, -0.6178868, -4.960563, 1, 0, 0, 1, 1,
-0.1102781, 0.8464528, 1.120654, 1, 0, 0, 1, 1,
-0.1098403, -1.481215, -3.510611, 0, 0, 0, 1, 1,
-0.1095851, 2.017333, 0.3999683, 0, 0, 0, 1, 1,
-0.1024812, 0.4040017, -0.07560763, 0, 0, 0, 1, 1,
-0.1010547, -1.405, -3.908735, 0, 0, 0, 1, 1,
-0.09973719, -1.598764, -2.609115, 0, 0, 0, 1, 1,
-0.09892172, 0.3181762, 0.7130516, 0, 0, 0, 1, 1,
-0.09589338, 1.20087, 0.9246342, 0, 0, 0, 1, 1,
-0.09450928, 0.2835493, -0.9115732, 1, 1, 1, 1, 1,
-0.09218609, -0.9022209, -3.873612, 1, 1, 1, 1, 1,
-0.09210818, 0.3532472, -0.4997964, 1, 1, 1, 1, 1,
-0.08217687, -1.401111, -3.632178, 1, 1, 1, 1, 1,
-0.07935973, 0.04537669, -0.06518985, 1, 1, 1, 1, 1,
-0.07901014, -0.9307494, -2.197091, 1, 1, 1, 1, 1,
-0.07344511, -0.9025984, -2.11348, 1, 1, 1, 1, 1,
-0.06987116, 0.9195363, 0.1413751, 1, 1, 1, 1, 1,
-0.06796635, 0.1732349, 0.02762292, 1, 1, 1, 1, 1,
-0.06730057, 0.7201825, -2.251007, 1, 1, 1, 1, 1,
-0.06483443, 0.5164039, 0.3715339, 1, 1, 1, 1, 1,
-0.06276274, -0.4352717, -1.877327, 1, 1, 1, 1, 1,
-0.05827883, -1.659055, -4.374024, 1, 1, 1, 1, 1,
-0.05648959, 0.8111037, -1.60173, 1, 1, 1, 1, 1,
-0.04744798, -1.017121, -2.75023, 1, 1, 1, 1, 1,
-0.04448919, -1.04298, -3.606076, 0, 0, 1, 1, 1,
-0.03714171, -0.338737, -3.364476, 1, 0, 0, 1, 1,
-0.03316457, -1.263727, -3.742513, 1, 0, 0, 1, 1,
-0.03088403, -0.3313333, -2.405073, 1, 0, 0, 1, 1,
-0.03065071, 0.2806733, 0.1906205, 1, 0, 0, 1, 1,
-0.02592834, 0.5959981, 0.4030245, 1, 0, 0, 1, 1,
-0.02538746, 1.35588, 1.340582, 0, 0, 0, 1, 1,
-0.02120838, 0.8852868, -0.4830635, 0, 0, 0, 1, 1,
-0.02078975, 0.7009374, 0.8835354, 0, 0, 0, 1, 1,
-0.01510508, -1.492659, -3.32121, 0, 0, 0, 1, 1,
-0.01258001, 0.2048483, 1.457585, 0, 0, 0, 1, 1,
-0.01174498, 0.30656, 0.4889104, 0, 0, 0, 1, 1,
-0.0116074, -1.12315, -3.378506, 0, 0, 0, 1, 1,
-0.01104579, -1.373109, -3.011247, 1, 1, 1, 1, 1,
-0.01050956, 0.6776838, 1.648761, 1, 1, 1, 1, 1,
-0.01029824, -1.307818, -4.191946, 1, 1, 1, 1, 1,
-0.01022575, -0.4501374, -4.818043, 1, 1, 1, 1, 1,
-0.007290774, -0.6633239, -3.476019, 1, 1, 1, 1, 1,
-0.006531862, -2.402616, -4.99473, 1, 1, 1, 1, 1,
-0.005372828, -0.583091, -6.265514, 1, 1, 1, 1, 1,
-0.004057817, 0.1811809, 0.1201243, 1, 1, 1, 1, 1,
-0.003945244, -1.063175, -2.931032, 1, 1, 1, 1, 1,
-0.0009059252, 0.529043, -1.647197, 1, 1, 1, 1, 1,
0.004229789, -0.2730115, 5.464517, 1, 1, 1, 1, 1,
0.01077238, 0.08879359, 0.9468851, 1, 1, 1, 1, 1,
0.0153251, 0.3803934, 0.2149393, 1, 1, 1, 1, 1,
0.0192384, 0.002484574, 1.990977, 1, 1, 1, 1, 1,
0.01970653, -1.043847, 3.423058, 1, 1, 1, 1, 1,
0.01973817, -2.787871, 3.503388, 0, 0, 1, 1, 1,
0.02165629, -0.09478931, 1.183607, 1, 0, 0, 1, 1,
0.02504846, 0.4233843, -0.6980322, 1, 0, 0, 1, 1,
0.0263235, 0.4175813, 1.175088, 1, 0, 0, 1, 1,
0.03002309, 0.4517442, 0.6900456, 1, 0, 0, 1, 1,
0.03669854, 0.02660457, -0.1097974, 1, 0, 0, 1, 1,
0.04004709, 0.2141579, 1.182284, 0, 0, 0, 1, 1,
0.04823489, 0.1353806, 0.8876502, 0, 0, 0, 1, 1,
0.05309328, -0.05729323, 4.096385, 0, 0, 0, 1, 1,
0.05377435, 1.093256, -0.7912837, 0, 0, 0, 1, 1,
0.05447907, 0.8946585, 0.7000852, 0, 0, 0, 1, 1,
0.06108313, -0.7209857, 4.027582, 0, 0, 0, 1, 1,
0.06351654, 0.5667736, 0.4338516, 0, 0, 0, 1, 1,
0.06435929, 0.4151473, -0.5231885, 1, 1, 1, 1, 1,
0.06545104, -0.4078789, 2.514875, 1, 1, 1, 1, 1,
0.07157752, -1.102546, 2.414275, 1, 1, 1, 1, 1,
0.07166142, 0.1707148, 1.98687, 1, 1, 1, 1, 1,
0.0727847, -0.04033672, 0.997115, 1, 1, 1, 1, 1,
0.07551271, -0.2153175, 2.740077, 1, 1, 1, 1, 1,
0.07596252, -0.06188277, 1.650094, 1, 1, 1, 1, 1,
0.07656487, -0.3167314, 1.994535, 1, 1, 1, 1, 1,
0.08501043, -1.096576, 2.433326, 1, 1, 1, 1, 1,
0.08539753, -0.5056335, 2.853268, 1, 1, 1, 1, 1,
0.08808874, -0.01582398, 2.244176, 1, 1, 1, 1, 1,
0.08809083, -0.3057752, 3.553037, 1, 1, 1, 1, 1,
0.08993252, -0.3471225, 3.1826, 1, 1, 1, 1, 1,
0.09021585, 0.001315161, 1.774791, 1, 1, 1, 1, 1,
0.09081807, -1.922442, 2.997293, 1, 1, 1, 1, 1,
0.09227064, 0.105801, -0.4529303, 0, 0, 1, 1, 1,
0.09283106, 0.696197, -0.5721056, 1, 0, 0, 1, 1,
0.09961684, 0.2247828, 1.225773, 1, 0, 0, 1, 1,
0.1013421, 0.7892064, -0.7935479, 1, 0, 0, 1, 1,
0.1054448, 0.355276, 1.673786, 1, 0, 0, 1, 1,
0.1087495, -1.299181, 2.218889, 1, 0, 0, 1, 1,
0.1096904, -0.5643196, 2.623936, 0, 0, 0, 1, 1,
0.1131076, -1.327922, 2.349261, 0, 0, 0, 1, 1,
0.1145036, -0.4316891, 2.260905, 0, 0, 0, 1, 1,
0.1149761, -0.1757263, 2.299362, 0, 0, 0, 1, 1,
0.1170698, -0.7798163, 3.4706, 0, 0, 0, 1, 1,
0.1188675, -0.6356938, 3.410475, 0, 0, 0, 1, 1,
0.1242384, 1.399643, -0.5074753, 0, 0, 0, 1, 1,
0.1288672, -0.07721796, 1.122653, 1, 1, 1, 1, 1,
0.133858, 0.9748335, -1.970764, 1, 1, 1, 1, 1,
0.137391, 0.6446442, 0.7275449, 1, 1, 1, 1, 1,
0.1422061, -0.5226267, 1.482733, 1, 1, 1, 1, 1,
0.1448292, -0.6350247, 2.802443, 1, 1, 1, 1, 1,
0.1501896, 0.7804473, -0.6137203, 1, 1, 1, 1, 1,
0.1521725, -2.27665, 3.472141, 1, 1, 1, 1, 1,
0.1523439, -0.4341358, 2.877548, 1, 1, 1, 1, 1,
0.1529084, -0.05032452, 1.043965, 1, 1, 1, 1, 1,
0.1547706, -2.099679, 2.002276, 1, 1, 1, 1, 1,
0.1560637, 0.3006075, -1.126054, 1, 1, 1, 1, 1,
0.1580603, 0.6250967, 0.8988318, 1, 1, 1, 1, 1,
0.1592833, 1.546033, 0.03254342, 1, 1, 1, 1, 1,
0.1609143, 1.730722, 1.286465, 1, 1, 1, 1, 1,
0.1631001, 0.925231, 1.591545, 1, 1, 1, 1, 1,
0.164162, 0.1136523, 0.5237686, 0, 0, 1, 1, 1,
0.1671593, -0.3014373, 2.040378, 1, 0, 0, 1, 1,
0.1675007, 2.293682, -0.2694684, 1, 0, 0, 1, 1,
0.1676176, 0.799741, -1.190902, 1, 0, 0, 1, 1,
0.1684434, -0.9138684, 5.126941, 1, 0, 0, 1, 1,
0.1685503, 1.256501, 2.223359, 1, 0, 0, 1, 1,
0.169679, 1.082412, 1.196501, 0, 0, 0, 1, 1,
0.1716225, -0.2335163, 4.010474, 0, 0, 0, 1, 1,
0.1720634, -0.3936671, 3.581228, 0, 0, 0, 1, 1,
0.1726687, 0.447396, 0.7477849, 0, 0, 0, 1, 1,
0.1766297, -0.6131296, 1.274351, 0, 0, 0, 1, 1,
0.1803635, 1.138448, 0.9726443, 0, 0, 0, 1, 1,
0.1812269, 1.233498, -0.5559772, 0, 0, 0, 1, 1,
0.1816819, 0.4291714, -0.1496688, 1, 1, 1, 1, 1,
0.1894707, -0.03641208, 2.368481, 1, 1, 1, 1, 1,
0.1916653, 0.7743849, 0.03008607, 1, 1, 1, 1, 1,
0.1931374, -0.1112686, 3.521908, 1, 1, 1, 1, 1,
0.1931415, -1.255394, 4.065595, 1, 1, 1, 1, 1,
0.1947335, 1.502592, 2.290037, 1, 1, 1, 1, 1,
0.194759, 0.4454011, 1.413529, 1, 1, 1, 1, 1,
0.195211, 1.028772, 1.519184, 1, 1, 1, 1, 1,
0.1974009, -1.704895, 3.044392, 1, 1, 1, 1, 1,
0.1996267, -0.5432905, 1.841136, 1, 1, 1, 1, 1,
0.2024279, 2.072246, 1.255899, 1, 1, 1, 1, 1,
0.2035204, -1.662277, 2.388383, 1, 1, 1, 1, 1,
0.2077187, -0.3638578, 2.022843, 1, 1, 1, 1, 1,
0.2099026, -1.164943, 0.3454565, 1, 1, 1, 1, 1,
0.2112433, 0.5597991, -0.2431121, 1, 1, 1, 1, 1,
0.2242564, 0.6204711, 1.073779, 0, 0, 1, 1, 1,
0.2267007, 0.07450112, 1.835226, 1, 0, 0, 1, 1,
0.2282399, -0.5799647, 4.638377, 1, 0, 0, 1, 1,
0.2283628, 0.7089193, 0.6941684, 1, 0, 0, 1, 1,
0.2323342, -0.3893493, 2.817395, 1, 0, 0, 1, 1,
0.2380238, -1.533197, 2.924762, 1, 0, 0, 1, 1,
0.2389018, -0.8799168, 3.243611, 0, 0, 0, 1, 1,
0.2417, -0.2987397, 3.454906, 0, 0, 0, 1, 1,
0.2461133, -0.6731573, 3.155409, 0, 0, 0, 1, 1,
0.2514793, -1.579687, 1.60805, 0, 0, 0, 1, 1,
0.2521884, 1.462558, 1.746234, 0, 0, 0, 1, 1,
0.2535265, -0.427819, 3.403857, 0, 0, 0, 1, 1,
0.2541783, 0.07184297, -0.11433, 0, 0, 0, 1, 1,
0.2570078, -0.4707911, 4.334648, 1, 1, 1, 1, 1,
0.2574528, 0.2821854, -0.5987466, 1, 1, 1, 1, 1,
0.2593373, 1.475048, -0.3519545, 1, 1, 1, 1, 1,
0.2626276, 0.1197326, 2.137841, 1, 1, 1, 1, 1,
0.2626306, 1.227004, 0.2249857, 1, 1, 1, 1, 1,
0.2632777, -1.037543, 5.056685, 1, 1, 1, 1, 1,
0.2633447, 1.013042, -0.8979926, 1, 1, 1, 1, 1,
0.2654553, 0.7230846, 0.06414649, 1, 1, 1, 1, 1,
0.2665843, 0.0697023, 2.246511, 1, 1, 1, 1, 1,
0.2688661, -1.717682, 4.646537, 1, 1, 1, 1, 1,
0.270184, 1.463551, 0.6765039, 1, 1, 1, 1, 1,
0.2710553, 1.935378, -1.174563, 1, 1, 1, 1, 1,
0.2714052, 0.4498246, 1.301196, 1, 1, 1, 1, 1,
0.2718998, 0.2295295, 2.463305, 1, 1, 1, 1, 1,
0.2721562, 0.5252346, 1.540478, 1, 1, 1, 1, 1,
0.2722949, -0.0464394, 2.801409, 0, 0, 1, 1, 1,
0.2725863, -0.6256819, 2.530628, 1, 0, 0, 1, 1,
0.2754116, -1.45506, 2.937162, 1, 0, 0, 1, 1,
0.2757353, 0.1705354, 1.35735, 1, 0, 0, 1, 1,
0.2788047, 2.390811, 2.763581, 1, 0, 0, 1, 1,
0.2797422, -0.1267801, 1.869266, 1, 0, 0, 1, 1,
0.2812475, 0.7761033, 1.548739, 0, 0, 0, 1, 1,
0.2836339, 0.3606357, 1.90953, 0, 0, 0, 1, 1,
0.284255, 0.559673, 0.3228913, 0, 0, 0, 1, 1,
0.28611, -1.734293, 2.215303, 0, 0, 0, 1, 1,
0.2886244, -1.703079, 4.46086, 0, 0, 0, 1, 1,
0.2893773, 0.1912286, 1.174817, 0, 0, 0, 1, 1,
0.2918829, -0.0956989, 0.8012621, 0, 0, 0, 1, 1,
0.2975411, -1.086891, 3.098564, 1, 1, 1, 1, 1,
0.3018613, -0.8385186, 5.040865, 1, 1, 1, 1, 1,
0.3063593, 2.46349, 0.5805094, 1, 1, 1, 1, 1,
0.3066561, -0.978363, 3.262386, 1, 1, 1, 1, 1,
0.3083892, 0.6435466, 1.241615, 1, 1, 1, 1, 1,
0.309914, -0.4366431, 2.063996, 1, 1, 1, 1, 1,
0.3105725, 0.5168072, -0.900353, 1, 1, 1, 1, 1,
0.3142117, 0.3715129, 0.8640552, 1, 1, 1, 1, 1,
0.3169277, -0.2499442, 2.486854, 1, 1, 1, 1, 1,
0.3249739, 0.6311648, 0.3510192, 1, 1, 1, 1, 1,
0.3312285, 0.2898015, 0.7598802, 1, 1, 1, 1, 1,
0.3369133, -1.329081, 1.950309, 1, 1, 1, 1, 1,
0.3373635, -1.554619, 3.053823, 1, 1, 1, 1, 1,
0.3376028, -0.1573854, 1.069294, 1, 1, 1, 1, 1,
0.3381507, -0.3714479, 3.169332, 1, 1, 1, 1, 1,
0.3519196, 2.849947, -2.080607, 0, 0, 1, 1, 1,
0.3538301, 0.09058444, 0.2860478, 1, 0, 0, 1, 1,
0.3540999, 2.1656, 0.2013779, 1, 0, 0, 1, 1,
0.3548756, -1.20272, 1.845132, 1, 0, 0, 1, 1,
0.3569253, -1.213041, 2.54053, 1, 0, 0, 1, 1,
0.3577793, 0.9909216, -0.739253, 1, 0, 0, 1, 1,
0.3618003, -1.368769, 3.092289, 0, 0, 0, 1, 1,
0.3648506, 1.732554, -1.175743, 0, 0, 0, 1, 1,
0.3676981, -0.7819806, 3.173157, 0, 0, 0, 1, 1,
0.370546, 0.279533, 0.4647615, 0, 0, 0, 1, 1,
0.3712863, -0.9513743, 3.742217, 0, 0, 0, 1, 1,
0.3750774, 1.789762, -1.398971, 0, 0, 0, 1, 1,
0.3774262, -0.0641664, 0.3158976, 0, 0, 0, 1, 1,
0.3784379, -1.032749, 4.034185, 1, 1, 1, 1, 1,
0.3818517, -0.3311664, 2.724497, 1, 1, 1, 1, 1,
0.3841595, -0.6148822, 2.044042, 1, 1, 1, 1, 1,
0.3856359, 1.642952, -0.56433, 1, 1, 1, 1, 1,
0.3915802, -1.784823, 1.818445, 1, 1, 1, 1, 1,
0.3970217, -0.5289111, 2.685219, 1, 1, 1, 1, 1,
0.3970835, 0.9213254, 2.240152, 1, 1, 1, 1, 1,
0.3978092, 0.04355593, 0.9363893, 1, 1, 1, 1, 1,
0.4004248, -2.741627, 3.439274, 1, 1, 1, 1, 1,
0.4030195, -0.4546301, 2.83402, 1, 1, 1, 1, 1,
0.4034419, -0.3777825, 1.893156, 1, 1, 1, 1, 1,
0.4048451, 0.905829, 1.757685, 1, 1, 1, 1, 1,
0.4068323, 2.307866, -0.8600271, 1, 1, 1, 1, 1,
0.4070278, -0.2616068, -0.2145735, 1, 1, 1, 1, 1,
0.4103997, -0.102124, 0.4058587, 1, 1, 1, 1, 1,
0.4144358, -0.6001922, 2.262261, 0, 0, 1, 1, 1,
0.4210573, -1.173484, 3.388091, 1, 0, 0, 1, 1,
0.4315172, -1.015015, 1.978161, 1, 0, 0, 1, 1,
0.4318163, 0.4681164, -1.347056, 1, 0, 0, 1, 1,
0.4339891, 1.105999, 1.23136, 1, 0, 0, 1, 1,
0.4341778, 0.7447057, -0.5465513, 1, 0, 0, 1, 1,
0.4348095, 0.7165669, -0.08361559, 0, 0, 0, 1, 1,
0.4357263, -0.4499616, 1.067126, 0, 0, 0, 1, 1,
0.4382737, 0.7830925, 2.266987, 0, 0, 0, 1, 1,
0.4418917, 1.159678, 1.172669, 0, 0, 0, 1, 1,
0.4449585, 0.4432504, 2.411986, 0, 0, 0, 1, 1,
0.4462016, 0.8591673, 1.452077, 0, 0, 0, 1, 1,
0.4473181, 1.981261, -0.9307543, 0, 0, 0, 1, 1,
0.4486836, 0.5276558, -0.5035045, 1, 1, 1, 1, 1,
0.4490353, 0.1876363, 0.3573036, 1, 1, 1, 1, 1,
0.4505085, -0.3588107, 3.24492, 1, 1, 1, 1, 1,
0.4512745, 3.027384, 2.821191, 1, 1, 1, 1, 1,
0.4518567, 0.600563, -0.3478928, 1, 1, 1, 1, 1,
0.4531232, 0.8036897, 2.521856, 1, 1, 1, 1, 1,
0.4573552, -0.4832426, 2.24771, 1, 1, 1, 1, 1,
0.4591212, -0.6656437, 2.231694, 1, 1, 1, 1, 1,
0.4654384, -0.09340201, 1.178931, 1, 1, 1, 1, 1,
0.4692921, -0.1764941, 4.812353, 1, 1, 1, 1, 1,
0.4706611, 0.2140639, -0.1562375, 1, 1, 1, 1, 1,
0.4732864, -0.675153, 1.742207, 1, 1, 1, 1, 1,
0.4743225, -0.9488468, 4.343984, 1, 1, 1, 1, 1,
0.4781693, 0.02163731, 0.7031474, 1, 1, 1, 1, 1,
0.4795698, -0.7713462, 2.68805, 1, 1, 1, 1, 1,
0.4813744, 0.4632208, 0.1685834, 0, 0, 1, 1, 1,
0.4861352, -0.8905038, 2.411907, 1, 0, 0, 1, 1,
0.4940233, 1.969622, 0.6608788, 1, 0, 0, 1, 1,
0.4990666, 3.038632, -1.508462, 1, 0, 0, 1, 1,
0.5060539, 1.30342, 2.37406, 1, 0, 0, 1, 1,
0.5079161, -0.9736079, 2.527416, 1, 0, 0, 1, 1,
0.5086703, 1.88488, -0.9686896, 0, 0, 0, 1, 1,
0.5087914, -0.2999408, 2.276879, 0, 0, 0, 1, 1,
0.5105556, -0.3824693, 1.646726, 0, 0, 0, 1, 1,
0.5120856, -1.379303, 2.403618, 0, 0, 0, 1, 1,
0.5159963, -0.4385141, 1.345903, 0, 0, 0, 1, 1,
0.5172135, 0.359022, 1.474558, 0, 0, 0, 1, 1,
0.5199864, 0.06202314, 0.5679368, 0, 0, 0, 1, 1,
0.5213978, 0.6062886, -0.002093951, 1, 1, 1, 1, 1,
0.5249718, -1.821747, 4.898207, 1, 1, 1, 1, 1,
0.5262674, 0.5534366, 1.226941, 1, 1, 1, 1, 1,
0.5264368, 0.3611969, 0.6594311, 1, 1, 1, 1, 1,
0.5282714, -0.02916944, -0.1038796, 1, 1, 1, 1, 1,
0.5307272, -0.5528266, 1.222656, 1, 1, 1, 1, 1,
0.5340202, -0.254838, 3.014058, 1, 1, 1, 1, 1,
0.5342109, 0.3811311, -0.9713321, 1, 1, 1, 1, 1,
0.5407194, -0.6507323, 3.839266, 1, 1, 1, 1, 1,
0.5416895, -0.2301888, 2.082852, 1, 1, 1, 1, 1,
0.5416919, -0.8756716, 2.161932, 1, 1, 1, 1, 1,
0.5422193, 2.002085, 0.5940065, 1, 1, 1, 1, 1,
0.5440094, -0.2455998, 0.8967425, 1, 1, 1, 1, 1,
0.5468737, -0.5552791, 1.345184, 1, 1, 1, 1, 1,
0.5478446, 0.2569002, 0.4119698, 1, 1, 1, 1, 1,
0.5482588, 1.873225, -0.1944919, 0, 0, 1, 1, 1,
0.5518373, 0.6324854, 0.3364484, 1, 0, 0, 1, 1,
0.552744, -0.3281484, 2.55978, 1, 0, 0, 1, 1,
0.5578119, -1.571781, 2.396976, 1, 0, 0, 1, 1,
0.5614287, -0.1384854, 0.1305229, 1, 0, 0, 1, 1,
0.5617195, -1.241449, 3.172375, 1, 0, 0, 1, 1,
0.5647225, 0.4035577, 1.942982, 0, 0, 0, 1, 1,
0.5712568, 0.08999811, 1.359624, 0, 0, 0, 1, 1,
0.5770123, 1.186316, 0.09227309, 0, 0, 0, 1, 1,
0.5773651, 1.395048, -0.5700191, 0, 0, 0, 1, 1,
0.5795178, 0.1596014, 2.348354, 0, 0, 0, 1, 1,
0.5814758, -0.4697574, 2.565827, 0, 0, 0, 1, 1,
0.5822664, -2.033069, 3.000115, 0, 0, 0, 1, 1,
0.5824282, 1.172469, -0.1870033, 1, 1, 1, 1, 1,
0.5898109, 0.8655296, -0.231803, 1, 1, 1, 1, 1,
0.5949671, -1.396055, 0.9991981, 1, 1, 1, 1, 1,
0.5966563, 1.038505, 0.3459676, 1, 1, 1, 1, 1,
0.5968777, 0.3644794, 0.1467875, 1, 1, 1, 1, 1,
0.5976335, 1.644732, 0.6934344, 1, 1, 1, 1, 1,
0.5979261, -0.7758226, 3.987101, 1, 1, 1, 1, 1,
0.6028959, -0.02133659, -0.4269387, 1, 1, 1, 1, 1,
0.6126127, -0.5078269, 3.025257, 1, 1, 1, 1, 1,
0.6168084, -0.6296824, 1.353069, 1, 1, 1, 1, 1,
0.6181749, -0.4497568, 2.071712, 1, 1, 1, 1, 1,
0.6215782, 0.4900768, 1.783004, 1, 1, 1, 1, 1,
0.622839, 1.84971, 1.387265, 1, 1, 1, 1, 1,
0.6229963, 0.08979373, 0.002134327, 1, 1, 1, 1, 1,
0.6266652, -0.9533512, 3.379066, 1, 1, 1, 1, 1,
0.6298393, 1.891162, 0.6051598, 0, 0, 1, 1, 1,
0.6324026, -0.2896866, 2.644208, 1, 0, 0, 1, 1,
0.6462762, 0.9298781, 0.9918688, 1, 0, 0, 1, 1,
0.6518399, 0.541177, 0.4385172, 1, 0, 0, 1, 1,
0.6536372, -1.595635, 1.991349, 1, 0, 0, 1, 1,
0.6556197, -0.8719882, 1.808923, 1, 0, 0, 1, 1,
0.6564804, -0.7541124, 1.48847, 0, 0, 0, 1, 1,
0.6565954, -0.18142, -0.8104826, 0, 0, 0, 1, 1,
0.6677169, 1.649386, -1.033015, 0, 0, 0, 1, 1,
0.6701512, 0.4064567, 0.4247542, 0, 0, 0, 1, 1,
0.6723853, 0.8466449, -0.6674906, 0, 0, 0, 1, 1,
0.676551, -1.035715, 2.415081, 0, 0, 0, 1, 1,
0.6777135, -1.78813, 2.34052, 0, 0, 0, 1, 1,
0.6791353, 1.024399, 1.579616, 1, 1, 1, 1, 1,
0.6836263, -1.68576, 3.045468, 1, 1, 1, 1, 1,
0.6838503, 0.5291615, -0.8083768, 1, 1, 1, 1, 1,
0.6841789, -1.310359, 3.261998, 1, 1, 1, 1, 1,
0.6858332, 0.791037, -0.4346405, 1, 1, 1, 1, 1,
0.6895108, -0.03679258, 1.241693, 1, 1, 1, 1, 1,
0.6908967, 0.1161821, 1.567574, 1, 1, 1, 1, 1,
0.7081902, 1.214002, 1.833117, 1, 1, 1, 1, 1,
0.7105268, 0.01297055, 2.341611, 1, 1, 1, 1, 1,
0.7119661, 0.226222, 0.8807088, 1, 1, 1, 1, 1,
0.7154042, -0.4444832, 2.849516, 1, 1, 1, 1, 1,
0.7160689, 0.4693753, 1.105887, 1, 1, 1, 1, 1,
0.7203389, 0.1759436, 2.586043, 1, 1, 1, 1, 1,
0.7210668, -0.1753472, 2.355094, 1, 1, 1, 1, 1,
0.7215998, 0.632943, 1.546087, 1, 1, 1, 1, 1,
0.722993, -0.3817295, 1.56161, 0, 0, 1, 1, 1,
0.7301659, -0.6904051, 1.667168, 1, 0, 0, 1, 1,
0.7302314, 0.3670573, 1.129386, 1, 0, 0, 1, 1,
0.7343693, -0.1157563, 3.072895, 1, 0, 0, 1, 1,
0.7352757, -0.1828493, 1.123913, 1, 0, 0, 1, 1,
0.7357795, 0.1308171, 0.516501, 1, 0, 0, 1, 1,
0.7394052, 1.124052, -0.9594302, 0, 0, 0, 1, 1,
0.7415086, 0.4328378, 4.472999, 0, 0, 0, 1, 1,
0.7498522, 0.6399102, 1.071478, 0, 0, 0, 1, 1,
0.751096, -0.532649, 0.8526078, 0, 0, 0, 1, 1,
0.7599746, 0.4951605, -0.5314944, 0, 0, 0, 1, 1,
0.7625338, -1.268563, 2.0437, 0, 0, 0, 1, 1,
0.7717561, -0.8959735, 1.123672, 0, 0, 0, 1, 1,
0.7727207, 0.3982888, 1.72642, 1, 1, 1, 1, 1,
0.7732079, -0.2071784, 1.776855, 1, 1, 1, 1, 1,
0.7775776, 0.1766798, 1.90401, 1, 1, 1, 1, 1,
0.7800612, -2.824996, 3.005525, 1, 1, 1, 1, 1,
0.7853519, 1.216336, 1.428026, 1, 1, 1, 1, 1,
0.7861717, -3.307182, 2.550154, 1, 1, 1, 1, 1,
0.7898043, -1.645814, 3.388473, 1, 1, 1, 1, 1,
0.7959206, -0.7819032, 1.779379, 1, 1, 1, 1, 1,
0.7971198, 0.2971402, 0.5585511, 1, 1, 1, 1, 1,
0.7972991, -0.1437323, 2.789288, 1, 1, 1, 1, 1,
0.8104515, -0.802627, 2.257743, 1, 1, 1, 1, 1,
0.810951, 0.05885272, 2.074809, 1, 1, 1, 1, 1,
0.8141568, 0.127197, 1.722621, 1, 1, 1, 1, 1,
0.8178318, 0.07805253, -0.3028712, 1, 1, 1, 1, 1,
0.8221325, 0.4920405, -0.190087, 1, 1, 1, 1, 1,
0.8226894, 0.04341287, 0.5951908, 0, 0, 1, 1, 1,
0.824488, -0.3166992, 1.401281, 1, 0, 0, 1, 1,
0.8309693, -2.106236, 1.019572, 1, 0, 0, 1, 1,
0.8345849, 0.3461771, 2.658424, 1, 0, 0, 1, 1,
0.8351808, 0.1489807, -0.5128536, 1, 0, 0, 1, 1,
0.8388298, 0.4547954, -0.0922101, 1, 0, 0, 1, 1,
0.8447098, 0.08705477, 1.779562, 0, 0, 0, 1, 1,
0.8545013, 0.8556994, 2.481805, 0, 0, 0, 1, 1,
0.857183, -0.6077603, 2.467623, 0, 0, 0, 1, 1,
0.8605303, 0.9025739, 0.06279982, 0, 0, 0, 1, 1,
0.8605817, -1.246442, 1.422585, 0, 0, 0, 1, 1,
0.8694365, 0.250816, 1.582451, 0, 0, 0, 1, 1,
0.8771729, 0.3673369, 3.732428, 0, 0, 0, 1, 1,
0.8776154, 0.6254515, 1.651272, 1, 1, 1, 1, 1,
0.8818387, 1.340836, 0.9263728, 1, 1, 1, 1, 1,
0.8869697, 0.2760862, 1.514786, 1, 1, 1, 1, 1,
0.8905272, -0.8773368, 3.387799, 1, 1, 1, 1, 1,
0.8918824, -1.151631, 2.03688, 1, 1, 1, 1, 1,
0.8934751, -0.178285, 2.523229, 1, 1, 1, 1, 1,
0.8948427, 0.7968999, 0.00223714, 1, 1, 1, 1, 1,
0.8962366, -1.301123, 1.445952, 1, 1, 1, 1, 1,
0.8992599, 1.447644, -0.6441069, 1, 1, 1, 1, 1,
0.9011419, 1.558682, 0.2321703, 1, 1, 1, 1, 1,
0.9066416, 1.346395, 0.3275772, 1, 1, 1, 1, 1,
0.9096716, -0.414653, 1.979042, 1, 1, 1, 1, 1,
0.9171845, 0.6156372, 1.491771, 1, 1, 1, 1, 1,
0.9172839, -1.43144, 2.974301, 1, 1, 1, 1, 1,
0.9396128, 0.8872771, 1.328926, 1, 1, 1, 1, 1,
0.9403008, 1.355485, -0.5256343, 0, 0, 1, 1, 1,
0.9444233, 0.1747259, 0.6702813, 1, 0, 0, 1, 1,
0.9446979, 0.4507184, 0.8153561, 1, 0, 0, 1, 1,
0.9457079, -1.204366, 2.921084, 1, 0, 0, 1, 1,
0.950284, 0.9407992, -0.6986736, 1, 0, 0, 1, 1,
0.9542567, -0.05392737, 1.771827, 1, 0, 0, 1, 1,
0.957371, -0.2066862, 1.291876, 0, 0, 0, 1, 1,
0.9600955, -0.9509399, 1.866058, 0, 0, 0, 1, 1,
0.9610983, -0.5666754, 2.155975, 0, 0, 0, 1, 1,
0.9632965, 0.5904347, 1.129357, 0, 0, 0, 1, 1,
0.9634307, 1.223024, -0.4155419, 0, 0, 0, 1, 1,
0.9665372, 0.3963621, -0.03946234, 0, 0, 0, 1, 1,
0.966827, 2.470303, -0.2894792, 0, 0, 0, 1, 1,
0.9723567, 0.2140731, 0.7403141, 1, 1, 1, 1, 1,
0.9729494, 0.8771398, 0.6533589, 1, 1, 1, 1, 1,
0.9848607, 0.1681247, 0.8972128, 1, 1, 1, 1, 1,
0.994745, 0.3548706, 0.2791123, 1, 1, 1, 1, 1,
0.9956566, 0.8619383, 1.234944, 1, 1, 1, 1, 1,
0.9959467, -0.2900218, 0.2884611, 1, 1, 1, 1, 1,
0.9982071, 0.5153921, 1.520519, 1, 1, 1, 1, 1,
1.00193, 1.103192, -0.06911487, 1, 1, 1, 1, 1,
1.004157, 0.1615757, 2.079077, 1, 1, 1, 1, 1,
1.01597, 0.1571511, -0.3677621, 1, 1, 1, 1, 1,
1.017326, -1.116844, 2.092561, 1, 1, 1, 1, 1,
1.018111, 0.7267023, 3.123115, 1, 1, 1, 1, 1,
1.021369, 2.020257, 0.6024179, 1, 1, 1, 1, 1,
1.022742, -1.455233, 3.460042, 1, 1, 1, 1, 1,
1.034998, 0.4637129, 2.11811, 1, 1, 1, 1, 1,
1.035108, 1.10845, 0.9919567, 0, 0, 1, 1, 1,
1.043185, 0.1437043, 0.4872482, 1, 0, 0, 1, 1,
1.056569, -0.02639752, -0.02660251, 1, 0, 0, 1, 1,
1.058649, 1.200517, 0.821409, 1, 0, 0, 1, 1,
1.06332, 0.5771809, 0.6211022, 1, 0, 0, 1, 1,
1.073212, -0.4999368, -0.2217192, 1, 0, 0, 1, 1,
1.073585, -0.5897948, 1.200551, 0, 0, 0, 1, 1,
1.076375, -0.4555158, 0.3893349, 0, 0, 0, 1, 1,
1.081748, -1.192598, 4.174985, 0, 0, 0, 1, 1,
1.088086, -1.761356, 3.242759, 0, 0, 0, 1, 1,
1.089175, 0.137033, 2.138582, 0, 0, 0, 1, 1,
1.089689, 1.431243, 1.091758, 0, 0, 0, 1, 1,
1.095101, -0.930158, 2.281221, 0, 0, 0, 1, 1,
1.114116, 1.582304, 1.6896, 1, 1, 1, 1, 1,
1.114148, 2.496577, -0.3897004, 1, 1, 1, 1, 1,
1.121969, -0.5188987, 0.6086871, 1, 1, 1, 1, 1,
1.127082, -1.478654, 1.495878, 1, 1, 1, 1, 1,
1.12715, 0.4850394, 0.4005646, 1, 1, 1, 1, 1,
1.135288, -0.1949073, 2.69334, 1, 1, 1, 1, 1,
1.135615, -0.7473383, 1.041822, 1, 1, 1, 1, 1,
1.158066, 0.3492927, 1.840259, 1, 1, 1, 1, 1,
1.163815, 1.561783, -0.4825182, 1, 1, 1, 1, 1,
1.165738, 0.5904526, 1.927161, 1, 1, 1, 1, 1,
1.165884, -0.3895471, 2.768014, 1, 1, 1, 1, 1,
1.166608, 0.5388301, 1.347223, 1, 1, 1, 1, 1,
1.170154, 1.047623, -0.3824017, 1, 1, 1, 1, 1,
1.170996, -0.3119596, 2.557995, 1, 1, 1, 1, 1,
1.186483, 0.3448498, 2.611941, 1, 1, 1, 1, 1,
1.189436, 0.9573121, 0.4850621, 0, 0, 1, 1, 1,
1.190349, -0.1116045, 1.079545, 1, 0, 0, 1, 1,
1.194886, 0.02325581, 2.679446, 1, 0, 0, 1, 1,
1.20075, 0.3474392, 1.743026, 1, 0, 0, 1, 1,
1.230211, -0.3805238, 2.668392, 1, 0, 0, 1, 1,
1.232641, 0.9249503, 1.53234, 1, 0, 0, 1, 1,
1.238182, 0.2294544, 0.1823286, 0, 0, 0, 1, 1,
1.246308, -0.404581, 1.28361, 0, 0, 0, 1, 1,
1.255572, -0.2929719, 1.638491, 0, 0, 0, 1, 1,
1.258445, -0.6584101, 2.25441, 0, 0, 0, 1, 1,
1.260708, 0.4619187, 1.14837, 0, 0, 0, 1, 1,
1.261331, 1.05252, 1.441874, 0, 0, 0, 1, 1,
1.266144, 1.106448, -0.7508025, 0, 0, 0, 1, 1,
1.269548, -0.1529502, 1.977464, 1, 1, 1, 1, 1,
1.270071, -0.5829669, 1.061986, 1, 1, 1, 1, 1,
1.287161, 1.57281, -0.3503388, 1, 1, 1, 1, 1,
1.291582, -0.9332352, 1.128311, 1, 1, 1, 1, 1,
1.295926, -1.163957, 2.944405, 1, 1, 1, 1, 1,
1.298947, 0.3734803, 1.878023, 1, 1, 1, 1, 1,
1.300992, 0.4872424, 0.5874745, 1, 1, 1, 1, 1,
1.311653, -0.5415393, 2.690591, 1, 1, 1, 1, 1,
1.320592, -0.2693993, 0.874384, 1, 1, 1, 1, 1,
1.321391, 0.4124691, 2.485437, 1, 1, 1, 1, 1,
1.325157, -0.7923845, 1.708952, 1, 1, 1, 1, 1,
1.33791, 1.156558, 2.456445, 1, 1, 1, 1, 1,
1.338178, 0.8667656, 1.714202, 1, 1, 1, 1, 1,
1.362848, -0.5274316, 1.266836, 1, 1, 1, 1, 1,
1.364669, 0.1029683, 0.2010539, 1, 1, 1, 1, 1,
1.366873, 0.05587894, 0.8513714, 0, 0, 1, 1, 1,
1.383286, -0.816871, 3.116807, 1, 0, 0, 1, 1,
1.385763, -1.020767, 3.537264, 1, 0, 0, 1, 1,
1.393053, 2.009372, 0.2282519, 1, 0, 0, 1, 1,
1.407971, -2.145209, 3.216231, 1, 0, 0, 1, 1,
1.414767, -1.489092, 3.722089, 1, 0, 0, 1, 1,
1.418317, -1.156741, 2.691686, 0, 0, 0, 1, 1,
1.418396, 1.279073, -0.1308949, 0, 0, 0, 1, 1,
1.420303, 1.62073, 1.19509, 0, 0, 0, 1, 1,
1.435344, -0.779045, 1.814584, 0, 0, 0, 1, 1,
1.444599, 2.042724, -1.083022, 0, 0, 0, 1, 1,
1.447972, 2.682996, 0.1909514, 0, 0, 0, 1, 1,
1.451135, 1.371322, 1.993187, 0, 0, 0, 1, 1,
1.460156, 1.337069, -0.55975, 1, 1, 1, 1, 1,
1.474622, -0.7208455, 1.661257, 1, 1, 1, 1, 1,
1.479125, -0.9898289, 4.255574, 1, 1, 1, 1, 1,
1.485465, -0.3929544, 0.3779423, 1, 1, 1, 1, 1,
1.489106, -1.306292, 2.937884, 1, 1, 1, 1, 1,
1.491476, -0.05296957, 0.8270161, 1, 1, 1, 1, 1,
1.494118, 1.066089, 0.6427371, 1, 1, 1, 1, 1,
1.49618, 0.3587775, 1.863346, 1, 1, 1, 1, 1,
1.510813, -0.01717807, 2.04832, 1, 1, 1, 1, 1,
1.519785, -1.016177, 1.526754, 1, 1, 1, 1, 1,
1.53574, -0.2151055, 1.811279, 1, 1, 1, 1, 1,
1.5364, 0.5492924, 2.109864, 1, 1, 1, 1, 1,
1.542792, 0.308687, 1.93968, 1, 1, 1, 1, 1,
1.545219, -0.06702031, 0.8838153, 1, 1, 1, 1, 1,
1.545794, -0.8365917, 2.469233, 1, 1, 1, 1, 1,
1.548127, 0.03059686, 3.777819, 0, 0, 1, 1, 1,
1.568896, 0.7447216, 1.566493, 1, 0, 0, 1, 1,
1.571016, 0.2119772, 0.9011661, 1, 0, 0, 1, 1,
1.576566, -1.467778, 1.458991, 1, 0, 0, 1, 1,
1.58961, -0.0891844, 1.754066, 1, 0, 0, 1, 1,
1.603673, 2.055076, 1.307001, 1, 0, 0, 1, 1,
1.603748, -0.3774322, 2.044375, 0, 0, 0, 1, 1,
1.609245, 0.4646559, 0.4896105, 0, 0, 0, 1, 1,
1.609967, 0.3005031, -0.7990753, 0, 0, 0, 1, 1,
1.632426, -1.580147, 4.669232, 0, 0, 0, 1, 1,
1.636455, -2.280309, 1.783827, 0, 0, 0, 1, 1,
1.637039, 0.674983, 0.7437517, 0, 0, 0, 1, 1,
1.663309, -1.099242, 0.5472252, 0, 0, 0, 1, 1,
1.669866, 0.03036708, 1.638434, 1, 1, 1, 1, 1,
1.687317, -1.700674, 3.021439, 1, 1, 1, 1, 1,
1.730784, 1.024163, 1.370861, 1, 1, 1, 1, 1,
1.733707, -0.1175586, 1.141269, 1, 1, 1, 1, 1,
1.745765, -0.09200437, 0.8337547, 1, 1, 1, 1, 1,
1.789689, 0.1065874, -0.7177945, 1, 1, 1, 1, 1,
1.804197, -0.5198821, 1.10984, 1, 1, 1, 1, 1,
1.838153, -1.215009, 3.105947, 1, 1, 1, 1, 1,
1.845957, -1.1765, 3.691011, 1, 1, 1, 1, 1,
1.887565, -0.2634335, 1.67855, 1, 1, 1, 1, 1,
1.895709, 1.164012, 1.83778, 1, 1, 1, 1, 1,
1.904157, 0.2703346, 1.472515, 1, 1, 1, 1, 1,
1.92687, -0.7863416, 1.227998, 1, 1, 1, 1, 1,
1.977391, 0.6881807, 2.879246, 1, 1, 1, 1, 1,
1.986445, -0.421767, 0.6560663, 1, 1, 1, 1, 1,
1.990646, -0.09478036, 3.71553, 0, 0, 1, 1, 1,
2.004565, 0.3368416, 0.9847971, 1, 0, 0, 1, 1,
2.010956, -1.322636, 1.113866, 1, 0, 0, 1, 1,
2.079814, -2.568515, 2.962236, 1, 0, 0, 1, 1,
2.087776, 0.4888922, -0.2741154, 1, 0, 0, 1, 1,
2.10322, -0.874114, 2.574887, 1, 0, 0, 1, 1,
2.113783, 0.4831845, 1.37071, 0, 0, 0, 1, 1,
2.143204, -1.48221, 2.401793, 0, 0, 0, 1, 1,
2.252236, -0.2571975, 1.486263, 0, 0, 0, 1, 1,
2.33484, 0.2658209, 2.227906, 0, 0, 0, 1, 1,
2.385988, 2.034456, 1.32549, 0, 0, 0, 1, 1,
2.41015, -0.9017208, 1.112612, 0, 0, 0, 1, 1,
2.60992, 0.1097128, 3.189245, 0, 0, 0, 1, 1,
2.640273, 0.7576469, 0.3267519, 1, 1, 1, 1, 1,
2.747066, 0.663625, 3.316457, 1, 1, 1, 1, 1,
2.861186, -0.4969833, 1.993615, 1, 1, 1, 1, 1,
2.916315, -0.2326457, 2.448838, 1, 1, 1, 1, 1,
2.93, -1.673571, 2.918135, 1, 1, 1, 1, 1,
3.074393, 0.5457402, 2.032935, 1, 1, 1, 1, 1,
3.463192, -0.05973714, 2.633786, 1, 1, 1, 1, 1
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
var radius = 10.08235;
var distance = 35.41382;
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
mvMatrix.translate( -0.3022956, -0.116601, 0.4004984 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.41382);
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