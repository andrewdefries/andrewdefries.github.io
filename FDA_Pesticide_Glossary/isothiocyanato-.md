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
-3.160556, 0.9018764, -0.4569753, 1, 0, 0, 1,
-3.138898, 0.177665, -1.122239, 1, 0.007843138, 0, 1,
-2.728782, 0.07115693, -1.614081, 1, 0.01176471, 0, 1,
-2.645637, -1.062897, -1.675138, 1, 0.01960784, 0, 1,
-2.451505, -1.278051, -0.627672, 1, 0.02352941, 0, 1,
-2.406435, -0.0358276, -1.080554, 1, 0.03137255, 0, 1,
-2.377322, -0.5394495, -2.204399, 1, 0.03529412, 0, 1,
-2.362883, 0.3327242, -1.177088, 1, 0.04313726, 0, 1,
-2.321718, -0.4951459, -0.4642147, 1, 0.04705882, 0, 1,
-2.214978, 0.7158499, -1.383117, 1, 0.05490196, 0, 1,
-2.106834, 0.1142553, -1.860922, 1, 0.05882353, 0, 1,
-2.087533, -2.542376, -2.486617, 1, 0.06666667, 0, 1,
-2.085491, -0.6841731, -1.891341, 1, 0.07058824, 0, 1,
-2.082911, 0.6186684, 0.08826757, 1, 0.07843138, 0, 1,
-2.07437, 0.5882237, -1.630834, 1, 0.08235294, 0, 1,
-2.038953, 0.7168902, 0.3889109, 1, 0.09019608, 0, 1,
-2.020619, -0.4047541, -1.126869, 1, 0.09411765, 0, 1,
-2.003326, -0.4637351, -1.293617, 1, 0.1019608, 0, 1,
-1.994957, -1.00894, -2.312122, 1, 0.1098039, 0, 1,
-1.988567, -1.489821, -2.209546, 1, 0.1137255, 0, 1,
-1.933937, -0.5839617, -3.432379, 1, 0.1215686, 0, 1,
-1.931669, -0.5661982, -1.422017, 1, 0.1254902, 0, 1,
-1.901925, 0.572566, -1.727031, 1, 0.1333333, 0, 1,
-1.9002, -1.456261, -3.146949, 1, 0.1372549, 0, 1,
-1.875198, -0.5469237, -2.757921, 1, 0.145098, 0, 1,
-1.868246, 0.1112426, -2.646369, 1, 0.1490196, 0, 1,
-1.858811, -0.5854768, -1.523333, 1, 0.1568628, 0, 1,
-1.858271, -0.8231424, -1.597891, 1, 0.1607843, 0, 1,
-1.843015, 0.2714476, -1.396829, 1, 0.1686275, 0, 1,
-1.840286, -0.247853, -1.831851, 1, 0.172549, 0, 1,
-1.820466, -0.1396752, -0.6268055, 1, 0.1803922, 0, 1,
-1.797935, 1.577588, 0.06078534, 1, 0.1843137, 0, 1,
-1.796296, 2.44035, -0.06935935, 1, 0.1921569, 0, 1,
-1.795068, 0.5253332, -0.909332, 1, 0.1960784, 0, 1,
-1.783873, 0.1188196, -2.551065, 1, 0.2039216, 0, 1,
-1.770573, 1.273618, -0.8196669, 1, 0.2117647, 0, 1,
-1.761614, -0.6306899, -2.017877, 1, 0.2156863, 0, 1,
-1.754786, 0.02732733, -1.443715, 1, 0.2235294, 0, 1,
-1.739829, -1.941202, -2.450902, 1, 0.227451, 0, 1,
-1.735644, 0.5103959, -1.46716, 1, 0.2352941, 0, 1,
-1.735263, -2.525719, -1.302973, 1, 0.2392157, 0, 1,
-1.728203, -0.5268147, -1.016724, 1, 0.2470588, 0, 1,
-1.719872, -0.3145323, -2.261756, 1, 0.2509804, 0, 1,
-1.700694, -0.8094541, -2.203521, 1, 0.2588235, 0, 1,
-1.684302, -0.2800587, -2.177099, 1, 0.2627451, 0, 1,
-1.677708, -0.07786744, -1.719398, 1, 0.2705882, 0, 1,
-1.67, 0.6689989, -1.050678, 1, 0.2745098, 0, 1,
-1.664879, -0.01428696, -1.871436, 1, 0.282353, 0, 1,
-1.644883, 0.2642295, -0.6470008, 1, 0.2862745, 0, 1,
-1.643727, 0.4791768, -0.7057125, 1, 0.2941177, 0, 1,
-1.641656, -2.655617, -2.759802, 1, 0.3019608, 0, 1,
-1.635134, 0.6426414, -0.8709732, 1, 0.3058824, 0, 1,
-1.621844, -0.9924534, -3.329027, 1, 0.3137255, 0, 1,
-1.618227, 0.3851097, -4.090108, 1, 0.3176471, 0, 1,
-1.602428, 0.9258063, -1.322777, 1, 0.3254902, 0, 1,
-1.60034, 0.6821323, -0.4204675, 1, 0.3294118, 0, 1,
-1.598974, 0.3525098, -0.8213946, 1, 0.3372549, 0, 1,
-1.593647, -0.3825506, -2.645181, 1, 0.3411765, 0, 1,
-1.58481, 0.5622377, -2.146315, 1, 0.3490196, 0, 1,
-1.573259, 0.238046, -2.747134, 1, 0.3529412, 0, 1,
-1.567965, 0.4136389, -0.4485389, 1, 0.3607843, 0, 1,
-1.542198, -1.964413, -1.470319, 1, 0.3647059, 0, 1,
-1.540715, -0.3882467, -2.254187, 1, 0.372549, 0, 1,
-1.539863, 0.901212, -1.957139, 1, 0.3764706, 0, 1,
-1.517063, -0.8062161, -2.120828, 1, 0.3843137, 0, 1,
-1.512919, 0.3229122, -2.253305, 1, 0.3882353, 0, 1,
-1.51055, -0.7996954, -2.074455, 1, 0.3960784, 0, 1,
-1.486208, 1.190628, -2.868143, 1, 0.4039216, 0, 1,
-1.483081, 0.8263879, -0.4217405, 1, 0.4078431, 0, 1,
-1.475098, 0.100102, -3.689036, 1, 0.4156863, 0, 1,
-1.470365, 0.9580807, -1.529003, 1, 0.4196078, 0, 1,
-1.467371, 0.04887747, 0.3369673, 1, 0.427451, 0, 1,
-1.458807, 2.203639, 0.3683252, 1, 0.4313726, 0, 1,
-1.451942, -2.055611, -0.5361581, 1, 0.4392157, 0, 1,
-1.440542, -0.1481904, -1.712872, 1, 0.4431373, 0, 1,
-1.437896, 0.3996509, -1.16517, 1, 0.4509804, 0, 1,
-1.428701, 0.4289717, -2.210907, 1, 0.454902, 0, 1,
-1.427344, 1.422614, -1.933078, 1, 0.4627451, 0, 1,
-1.421993, 1.322875, 0.6489445, 1, 0.4666667, 0, 1,
-1.420746, -0.9006903, -2.543958, 1, 0.4745098, 0, 1,
-1.415605, 0.9967674, -2.248211, 1, 0.4784314, 0, 1,
-1.415169, 0.06431151, -0.4016473, 1, 0.4862745, 0, 1,
-1.398886, -0.3903209, -0.5407319, 1, 0.4901961, 0, 1,
-1.393323, 0.4181786, -0.7979208, 1, 0.4980392, 0, 1,
-1.39083, 0.5227332, -1.355925, 1, 0.5058824, 0, 1,
-1.375031, 1.228604, -0.3227544, 1, 0.509804, 0, 1,
-1.373598, 0.05120215, -1.537045, 1, 0.5176471, 0, 1,
-1.371192, 0.4535954, -0.8872979, 1, 0.5215687, 0, 1,
-1.36709, -1.434863, -1.892774, 1, 0.5294118, 0, 1,
-1.360171, -2.47484, -3.340599, 1, 0.5333334, 0, 1,
-1.35964, -1.143492, -2.279611, 1, 0.5411765, 0, 1,
-1.358725, 1.547381, -1.26883, 1, 0.5450981, 0, 1,
-1.353593, -1.115121, -3.281736, 1, 0.5529412, 0, 1,
-1.346925, 0.6382598, -2.870478, 1, 0.5568628, 0, 1,
-1.331392, 0.8821675, -1.179688, 1, 0.5647059, 0, 1,
-1.327207, -0.3748113, -2.663851, 1, 0.5686275, 0, 1,
-1.325855, 1.213084, -1.597673, 1, 0.5764706, 0, 1,
-1.320268, 0.5707623, -2.852852, 1, 0.5803922, 0, 1,
-1.310528, -0.1562051, -2.371911, 1, 0.5882353, 0, 1,
-1.307436, -1.301975, -4.050012, 1, 0.5921569, 0, 1,
-1.303506, 1.066508, -2.188015, 1, 0.6, 0, 1,
-1.29425, -0.9565704, -3.138148, 1, 0.6078432, 0, 1,
-1.289341, -1.241577, -1.969446, 1, 0.6117647, 0, 1,
-1.285231, -0.128754, -2.370546, 1, 0.6196079, 0, 1,
-1.282105, -0.8459475, -1.424039, 1, 0.6235294, 0, 1,
-1.270754, -0.8044529, -2.427827, 1, 0.6313726, 0, 1,
-1.270069, 1.35753, 0.7446869, 1, 0.6352941, 0, 1,
-1.263451, 0.05517285, 0.3888873, 1, 0.6431373, 0, 1,
-1.257001, -0.7298516, -1.580726, 1, 0.6470588, 0, 1,
-1.246864, 0.3471043, -0.6302533, 1, 0.654902, 0, 1,
-1.243043, -1.026698, -1.971507, 1, 0.6588235, 0, 1,
-1.241686, -0.03814167, -2.185235, 1, 0.6666667, 0, 1,
-1.23968, 0.6765753, -0.09637842, 1, 0.6705883, 0, 1,
-1.226897, 0.2964199, -2.381959, 1, 0.6784314, 0, 1,
-1.2264, 2.004374, -1.896711, 1, 0.682353, 0, 1,
-1.222893, 0.001721075, -2.274472, 1, 0.6901961, 0, 1,
-1.208738, -0.6150095, -2.026302, 1, 0.6941177, 0, 1,
-1.202645, 0.516318, -1.488838, 1, 0.7019608, 0, 1,
-1.191707, 1.735522, -2.793394, 1, 0.7098039, 0, 1,
-1.184288, 0.113643, -1.108142, 1, 0.7137255, 0, 1,
-1.179125, 0.4181037, -0.6430333, 1, 0.7215686, 0, 1,
-1.17254, 0.8515835, -0.2778155, 1, 0.7254902, 0, 1,
-1.164115, -1.154956, -2.922559, 1, 0.7333333, 0, 1,
-1.162235, 1.731355, -0.2876956, 1, 0.7372549, 0, 1,
-1.161742, -2.591773, -1.635447, 1, 0.7450981, 0, 1,
-1.157265, -1.285154, -3.452962, 1, 0.7490196, 0, 1,
-1.156573, 0.1585466, -2.144004, 1, 0.7568628, 0, 1,
-1.15064, 1.815101, -1.228148, 1, 0.7607843, 0, 1,
-1.149337, 1.445211, -0.5737169, 1, 0.7686275, 0, 1,
-1.146759, 0.6523812, -1.960087, 1, 0.772549, 0, 1,
-1.142211, -0.5374696, -3.352153, 1, 0.7803922, 0, 1,
-1.140881, 1.114599, -0.5067202, 1, 0.7843137, 0, 1,
-1.136393, -1.472208, -2.602942, 1, 0.7921569, 0, 1,
-1.133334, -0.8914534, -2.5477, 1, 0.7960784, 0, 1,
-1.132639, -2.391082, -2.314652, 1, 0.8039216, 0, 1,
-1.130946, 0.6840724, 0.3117757, 1, 0.8117647, 0, 1,
-1.130567, -0.08933724, -1.021679, 1, 0.8156863, 0, 1,
-1.127427, -0.07590868, -3.134115, 1, 0.8235294, 0, 1,
-1.127013, 2.431147, -1.954632, 1, 0.827451, 0, 1,
-1.126191, -0.006057458, -2.243847, 1, 0.8352941, 0, 1,
-1.115325, 1.23416, -1.636392, 1, 0.8392157, 0, 1,
-1.113747, 0.0503075, -1.084837, 1, 0.8470588, 0, 1,
-1.10578, -0.5959631, -1.802418, 1, 0.8509804, 0, 1,
-1.104391, 0.6395122, -0.682788, 1, 0.8588235, 0, 1,
-1.101369, 1.160458, 0.1120209, 1, 0.8627451, 0, 1,
-1.098667, -0.2873666, -1.393613, 1, 0.8705882, 0, 1,
-1.097783, -0.2313799, -2.848891, 1, 0.8745098, 0, 1,
-1.092242, -0.872076, -2.496014, 1, 0.8823529, 0, 1,
-1.092134, -0.419216, -2.366619, 1, 0.8862745, 0, 1,
-1.08782, 0.1512239, -1.280159, 1, 0.8941177, 0, 1,
-1.078154, 0.09434082, -2.801929, 1, 0.8980392, 0, 1,
-1.062534, -1.011288, -0.9770172, 1, 0.9058824, 0, 1,
-1.061899, -0.05519981, -1.720671, 1, 0.9137255, 0, 1,
-1.061424, 0.169567, -0.5953217, 1, 0.9176471, 0, 1,
-1.049178, -0.01018966, -0.2043594, 1, 0.9254902, 0, 1,
-1.033378, 0.3034396, -1.0578, 1, 0.9294118, 0, 1,
-1.031388, -1.307848, -2.677138, 1, 0.9372549, 0, 1,
-1.029324, -0.9177436, -1.892228, 1, 0.9411765, 0, 1,
-1.026419, -1.314551, -3.146406, 1, 0.9490196, 0, 1,
-1.023484, 0.1206814, -1.285913, 1, 0.9529412, 0, 1,
-1.021557, -0.4279988, -0.6998006, 1, 0.9607843, 0, 1,
-1.019003, 0.9607019, -2.28569, 1, 0.9647059, 0, 1,
-1.016232, 0.04499459, -2.251028, 1, 0.972549, 0, 1,
-1.015832, 0.1547721, -2.526269, 1, 0.9764706, 0, 1,
-1.014365, 1.53044, -0.9550796, 1, 0.9843137, 0, 1,
-1.008553, 0.7906231, -0.7800076, 1, 0.9882353, 0, 1,
-0.9989416, -0.0961511, -0.7130367, 1, 0.9960784, 0, 1,
-0.9954189, 0.9167845, -1.399843, 0.9960784, 1, 0, 1,
-0.9917415, -0.07605286, -1.605077, 0.9921569, 1, 0, 1,
-0.9810719, -0.5106819, -1.760798, 0.9843137, 1, 0, 1,
-0.9790722, -2.067422, -2.591528, 0.9803922, 1, 0, 1,
-0.9782366, 0.2728599, -0.6848955, 0.972549, 1, 0, 1,
-0.9745501, -0.05267326, -1.057029, 0.9686275, 1, 0, 1,
-0.9590817, 0.2030006, -1.001897, 0.9607843, 1, 0, 1,
-0.9537743, -0.7574944, -2.983358, 0.9568627, 1, 0, 1,
-0.9515557, 0.06183133, -2.765539, 0.9490196, 1, 0, 1,
-0.949875, 0.4924775, -2.569117, 0.945098, 1, 0, 1,
-0.9408039, 0.02318391, -2.899366, 0.9372549, 1, 0, 1,
-0.9343083, 0.8218024, -0.1268993, 0.9333333, 1, 0, 1,
-0.9294226, 1.616475, -0.0533342, 0.9254902, 1, 0, 1,
-0.9274063, -0.761828, -2.698036, 0.9215686, 1, 0, 1,
-0.9215929, -0.1206827, -2.378514, 0.9137255, 1, 0, 1,
-0.9125764, -0.03502454, -2.228202, 0.9098039, 1, 0, 1,
-0.9098943, -1.437242, -1.671991, 0.9019608, 1, 0, 1,
-0.9062177, -0.2122165, -2.095031, 0.8941177, 1, 0, 1,
-0.9049617, 0.723044, -0.04465982, 0.8901961, 1, 0, 1,
-0.9032289, 0.5998318, -2.120977, 0.8823529, 1, 0, 1,
-0.9019995, 0.5057536, -0.09740823, 0.8784314, 1, 0, 1,
-0.900205, -0.46505, -0.4767853, 0.8705882, 1, 0, 1,
-0.8930528, 1.092006, -1.245055, 0.8666667, 1, 0, 1,
-0.8900406, 0.527573, -0.9651737, 0.8588235, 1, 0, 1,
-0.8893005, 0.3884848, -0.4471656, 0.854902, 1, 0, 1,
-0.8888919, -0.01294121, -1.3421, 0.8470588, 1, 0, 1,
-0.8814775, -1.111766, -4.725449, 0.8431373, 1, 0, 1,
-0.8779259, -0.8288828, -1.967444, 0.8352941, 1, 0, 1,
-0.8769379, 0.6909554, -0.279325, 0.8313726, 1, 0, 1,
-0.8708532, 0.01579358, -3.405303, 0.8235294, 1, 0, 1,
-0.8708482, 0.8368493, 1.450225, 0.8196079, 1, 0, 1,
-0.867323, -1.745792, -3.230962, 0.8117647, 1, 0, 1,
-0.8600374, -0.2033323, -1.37129, 0.8078431, 1, 0, 1,
-0.8561842, 2.357409, -0.1228098, 0.8, 1, 0, 1,
-0.8556215, -1.043573, -2.965758, 0.7921569, 1, 0, 1,
-0.8550016, 0.6583087, -2.081488, 0.7882353, 1, 0, 1,
-0.8530026, 0.01231664, -2.81572, 0.7803922, 1, 0, 1,
-0.8482702, -0.8371551, -2.331084, 0.7764706, 1, 0, 1,
-0.8479082, 0.5497038, -2.04624, 0.7686275, 1, 0, 1,
-0.8433158, 0.02645442, -2.613142, 0.7647059, 1, 0, 1,
-0.8370023, 0.9600253, -0.1282725, 0.7568628, 1, 0, 1,
-0.8364431, -0.5724506, -1.963968, 0.7529412, 1, 0, 1,
-0.8341894, -0.4114408, -3.541926, 0.7450981, 1, 0, 1,
-0.8293962, -1.558688, -1.391805, 0.7411765, 1, 0, 1,
-0.827809, -0.5360766, -2.291436, 0.7333333, 1, 0, 1,
-0.8209566, -0.03211022, -2.684568, 0.7294118, 1, 0, 1,
-0.8150219, 0.06844283, -0.1701157, 0.7215686, 1, 0, 1,
-0.8149785, -1.95422, -4.784275, 0.7176471, 1, 0, 1,
-0.8065624, -0.6164427, -1.91653, 0.7098039, 1, 0, 1,
-0.8062049, 0.8140324, -1.366312, 0.7058824, 1, 0, 1,
-0.7993182, -0.5969673, -1.153119, 0.6980392, 1, 0, 1,
-0.7954634, 0.5360742, -1.504281, 0.6901961, 1, 0, 1,
-0.7941321, -0.9515661, -2.941463, 0.6862745, 1, 0, 1,
-0.7916959, 0.850435, -1.042591, 0.6784314, 1, 0, 1,
-0.7867283, -0.231438, -2.840889, 0.6745098, 1, 0, 1,
-0.7861647, -0.9545589, -1.393231, 0.6666667, 1, 0, 1,
-0.7856076, 0.4209478, -1.316403, 0.6627451, 1, 0, 1,
-0.7837946, 0.3266472, -1.98414, 0.654902, 1, 0, 1,
-0.7783852, -0.9706581, -2.109267, 0.6509804, 1, 0, 1,
-0.7752061, -0.4375148, -2.748188, 0.6431373, 1, 0, 1,
-0.7718649, -0.8139298, -2.657288, 0.6392157, 1, 0, 1,
-0.7624152, 0.07679334, -1.714518, 0.6313726, 1, 0, 1,
-0.7590124, 1.245682, -0.06658648, 0.627451, 1, 0, 1,
-0.7582914, 0.578211, 0.8501719, 0.6196079, 1, 0, 1,
-0.7548662, 2.50642, 0.563524, 0.6156863, 1, 0, 1,
-0.7498364, -0.8742062, -1.340896, 0.6078432, 1, 0, 1,
-0.7391412, 0.1099756, -1.273356, 0.6039216, 1, 0, 1,
-0.7365625, -0.7869177, -2.764701, 0.5960785, 1, 0, 1,
-0.733054, 0.5925961, 0.05496761, 0.5882353, 1, 0, 1,
-0.7231375, 0.1323007, -0.5298698, 0.5843138, 1, 0, 1,
-0.721858, 2.269622, -1.432227, 0.5764706, 1, 0, 1,
-0.7213174, -0.2532437, -1.13412, 0.572549, 1, 0, 1,
-0.7079167, 1.218663, -0.6646802, 0.5647059, 1, 0, 1,
-0.6958869, 0.9354007, -0.4446552, 0.5607843, 1, 0, 1,
-0.6909859, -0.08865815, -0.7606688, 0.5529412, 1, 0, 1,
-0.6889567, 2.642784, 1.409737, 0.5490196, 1, 0, 1,
-0.683332, 0.9812412, -1.990705, 0.5411765, 1, 0, 1,
-0.6830488, 1.9059, -0.7075398, 0.5372549, 1, 0, 1,
-0.6827369, -0.3671811, -2.299954, 0.5294118, 1, 0, 1,
-0.6824946, 1.775264, -0.7003232, 0.5254902, 1, 0, 1,
-0.681509, -0.6058872, -3.428895, 0.5176471, 1, 0, 1,
-0.6805648, -0.3849501, -0.4292074, 0.5137255, 1, 0, 1,
-0.6795742, 0.4078061, -2.0658, 0.5058824, 1, 0, 1,
-0.6789978, -0.7443327, -2.181316, 0.5019608, 1, 0, 1,
-0.6704056, -0.6763862, -2.625604, 0.4941176, 1, 0, 1,
-0.6682937, 0.1219271, -1.890602, 0.4862745, 1, 0, 1,
-0.6676061, -0.9589586, -2.490726, 0.4823529, 1, 0, 1,
-0.664965, 2.47033, 0.1911854, 0.4745098, 1, 0, 1,
-0.6623031, 0.01396641, -0.8059947, 0.4705882, 1, 0, 1,
-0.6555396, 0.176098, 0.1605935, 0.4627451, 1, 0, 1,
-0.6543555, 0.1607966, -0.4039184, 0.4588235, 1, 0, 1,
-0.6537801, -0.629315, -2.833615, 0.4509804, 1, 0, 1,
-0.6489917, -0.2329974, -1.706346, 0.4470588, 1, 0, 1,
-0.6477571, -1.545766, -4.719045, 0.4392157, 1, 0, 1,
-0.6469057, 0.3335496, -0.9585834, 0.4352941, 1, 0, 1,
-0.6443996, -1.081428, -4.153015, 0.427451, 1, 0, 1,
-0.6426461, 2.895953, -0.6314582, 0.4235294, 1, 0, 1,
-0.6387184, 1.341719, 1.003582, 0.4156863, 1, 0, 1,
-0.6379666, 0.198681, -1.557511, 0.4117647, 1, 0, 1,
-0.6357509, 0.5678867, -0.3514288, 0.4039216, 1, 0, 1,
-0.6350083, 1.707285, -2.051778, 0.3960784, 1, 0, 1,
-0.6314235, 1.008901, -1.282657, 0.3921569, 1, 0, 1,
-0.6248473, -0.8606027, -2.37347, 0.3843137, 1, 0, 1,
-0.6205937, -0.5251148, -3.005144, 0.3803922, 1, 0, 1,
-0.6189472, 1.37526, -0.3266992, 0.372549, 1, 0, 1,
-0.618232, -0.06447461, -2.130949, 0.3686275, 1, 0, 1,
-0.6178845, -1.271361, -2.02392, 0.3607843, 1, 0, 1,
-0.6149892, -0.287172, -1.847819, 0.3568628, 1, 0, 1,
-0.6136111, -0.09424078, -2.059454, 0.3490196, 1, 0, 1,
-0.6114364, -0.7305264, -3.033161, 0.345098, 1, 0, 1,
-0.6107996, 0.6655874, -1.291442, 0.3372549, 1, 0, 1,
-0.6019655, 1.22078, -0.334949, 0.3333333, 1, 0, 1,
-0.5994713, -0.3916838, -1.513167, 0.3254902, 1, 0, 1,
-0.5992603, -1.299243, -1.470328, 0.3215686, 1, 0, 1,
-0.5991675, 0.2860276, -1.41173, 0.3137255, 1, 0, 1,
-0.5958454, -0.8872051, -2.533709, 0.3098039, 1, 0, 1,
-0.5919929, -1.252507, -2.498897, 0.3019608, 1, 0, 1,
-0.5895599, 1.615604, 0.1005843, 0.2941177, 1, 0, 1,
-0.5862606, 1.115932, -0.5518184, 0.2901961, 1, 0, 1,
-0.5847763, 1.56295, -0.3096505, 0.282353, 1, 0, 1,
-0.5819228, -0.4028449, -2.554894, 0.2784314, 1, 0, 1,
-0.5795822, 1.138713, 1.364221, 0.2705882, 1, 0, 1,
-0.5757891, -1.02774, -2.560268, 0.2666667, 1, 0, 1,
-0.5745961, -0.9237387, -2.064237, 0.2588235, 1, 0, 1,
-0.5743959, -2.161679, -3.729008, 0.254902, 1, 0, 1,
-0.5730819, -0.7868463, -0.7562077, 0.2470588, 1, 0, 1,
-0.5721433, 0.4307543, -1.166694, 0.2431373, 1, 0, 1,
-0.5713561, -0.863123, -3.702877, 0.2352941, 1, 0, 1,
-0.5682276, -1.606533, -1.190095, 0.2313726, 1, 0, 1,
-0.5679467, 0.3960077, -0.9243529, 0.2235294, 1, 0, 1,
-0.5563597, -1.073875, -3.435838, 0.2196078, 1, 0, 1,
-0.555742, -0.846867, -1.469526, 0.2117647, 1, 0, 1,
-0.5509257, 1.30869, 0.09594318, 0.2078431, 1, 0, 1,
-0.5506465, -2.169725, -2.668238, 0.2, 1, 0, 1,
-0.5502771, 0.8045505, -0.7371672, 0.1921569, 1, 0, 1,
-0.5497139, 0.5526762, 0.4147037, 0.1882353, 1, 0, 1,
-0.5485609, 0.6566217, -0.2552931, 0.1803922, 1, 0, 1,
-0.5452769, -0.6173265, -2.244203, 0.1764706, 1, 0, 1,
-0.5445172, -0.3061553, -0.8584756, 0.1686275, 1, 0, 1,
-0.5443702, -0.1679757, -1.017125, 0.1647059, 1, 0, 1,
-0.5441387, 0.1373529, -2.636341, 0.1568628, 1, 0, 1,
-0.5436939, -0.7679063, -1.849887, 0.1529412, 1, 0, 1,
-0.5428185, -1.246874, -1.473541, 0.145098, 1, 0, 1,
-0.5423238, 0.1533572, -0.8396613, 0.1411765, 1, 0, 1,
-0.5330595, 1.354529, 0.5097519, 0.1333333, 1, 0, 1,
-0.52887, 0.2157894, -2.042686, 0.1294118, 1, 0, 1,
-0.5259208, 1.758346, -0.6265272, 0.1215686, 1, 0, 1,
-0.5247201, 2.649397, -1.194709, 0.1176471, 1, 0, 1,
-0.5091648, 1.279259, 0.8288898, 0.1098039, 1, 0, 1,
-0.5050386, -0.06817104, -1.655132, 0.1058824, 1, 0, 1,
-0.5023075, -1.016034, -2.557817, 0.09803922, 1, 0, 1,
-0.5022426, 0.513546, -1.067415, 0.09019608, 1, 0, 1,
-0.4955765, -1.089136, -1.665395, 0.08627451, 1, 0, 1,
-0.4943155, -0.1547533, -2.579151, 0.07843138, 1, 0, 1,
-0.4911469, -0.02409329, -1.300301, 0.07450981, 1, 0, 1,
-0.4875806, 1.377467, 0.8263227, 0.06666667, 1, 0, 1,
-0.4856635, -0.1114808, -1.480353, 0.0627451, 1, 0, 1,
-0.4803343, -2.038728, -2.796879, 0.05490196, 1, 0, 1,
-0.4760017, 1.107478, -0.3015088, 0.05098039, 1, 0, 1,
-0.4752539, -1.597237, -3.16778, 0.04313726, 1, 0, 1,
-0.4752157, -0.09108316, -1.780807, 0.03921569, 1, 0, 1,
-0.4742795, -1.172617, -2.753344, 0.03137255, 1, 0, 1,
-0.4680568, -1.074888, -2.269983, 0.02745098, 1, 0, 1,
-0.4672678, 1.593328, -0.09497583, 0.01960784, 1, 0, 1,
-0.4649589, -0.6314111, -2.835003, 0.01568628, 1, 0, 1,
-0.4622054, 0.5980607, 0.8973781, 0.007843138, 1, 0, 1,
-0.4599802, 0.08360383, -0.05410279, 0.003921569, 1, 0, 1,
-0.455896, -0.4556979, -1.330751, 0, 1, 0.003921569, 1,
-0.4549514, 0.773875, -0.5407217, 0, 1, 0.01176471, 1,
-0.449919, 0.3006141, -3.294167, 0, 1, 0.01568628, 1,
-0.4497206, 1.516387, -2.141082, 0, 1, 0.02352941, 1,
-0.4494431, 1.09544, 0.717445, 0, 1, 0.02745098, 1,
-0.4480499, 0.9307699, -0.660486, 0, 1, 0.03529412, 1,
-0.4454556, 0.4135277, 0.05942243, 0, 1, 0.03921569, 1,
-0.4424147, 1.89478, 0.3186246, 0, 1, 0.04705882, 1,
-0.440244, 0.6697138, 0.6032106, 0, 1, 0.05098039, 1,
-0.4390543, -0.3135102, -2.832386, 0, 1, 0.05882353, 1,
-0.4388178, 0.2798878, -2.161771, 0, 1, 0.0627451, 1,
-0.4342457, -0.3837838, -1.391785, 0, 1, 0.07058824, 1,
-0.4340016, -0.8513026, -1.134024, 0, 1, 0.07450981, 1,
-0.4332276, -0.03961251, -1.320318, 0, 1, 0.08235294, 1,
-0.4295047, 0.8017191, -2.273066, 0, 1, 0.08627451, 1,
-0.4219797, 1.240172, 0.597762, 0, 1, 0.09411765, 1,
-0.4198805, 0.4573839, -1.793385, 0, 1, 0.1019608, 1,
-0.4184398, -0.2500956, -2.721738, 0, 1, 0.1058824, 1,
-0.4142937, -0.1530394, -1.82787, 0, 1, 0.1137255, 1,
-0.4075039, 0.1697225, -2.661172, 0, 1, 0.1176471, 1,
-0.4037092, 2.12368, 1.460206, 0, 1, 0.1254902, 1,
-0.397637, 0.4825375, -1.059365, 0, 1, 0.1294118, 1,
-0.3925794, -0.4546487, -2.406561, 0, 1, 0.1372549, 1,
-0.3911993, 2.002677, 2.123375, 0, 1, 0.1411765, 1,
-0.3900723, 2.076429, 0.5704088, 0, 1, 0.1490196, 1,
-0.389057, -1.074399, -3.311316, 0, 1, 0.1529412, 1,
-0.3883046, 0.6501647, 0.479053, 0, 1, 0.1607843, 1,
-0.3819893, 1.28063, -1.215643, 0, 1, 0.1647059, 1,
-0.3795429, 1.617406, -0.7722182, 0, 1, 0.172549, 1,
-0.3786814, 1.210312, -0.5477684, 0, 1, 0.1764706, 1,
-0.3772138, -0.6718417, -1.776042, 0, 1, 0.1843137, 1,
-0.3763997, 0.3895083, 1.543941, 0, 1, 0.1882353, 1,
-0.3749374, -0.1496582, -1.521144, 0, 1, 0.1960784, 1,
-0.3740867, -0.1437782, -1.964749, 0, 1, 0.2039216, 1,
-0.3740833, -1.339511, -1.550198, 0, 1, 0.2078431, 1,
-0.3695836, -0.2563179, -2.681324, 0, 1, 0.2156863, 1,
-0.3652588, -1.093407, -3.988238, 0, 1, 0.2196078, 1,
-0.3646211, -0.1507621, -1.226318, 0, 1, 0.227451, 1,
-0.3632205, 1.361954, 1.362509, 0, 1, 0.2313726, 1,
-0.360347, -0.8817126, -1.224642, 0, 1, 0.2392157, 1,
-0.3601834, -0.4435653, -4.105967, 0, 1, 0.2431373, 1,
-0.3575974, 1.62261, 0.2538138, 0, 1, 0.2509804, 1,
-0.3541915, -0.9290503, -3.813719, 0, 1, 0.254902, 1,
-0.3540702, 0.2074425, -1.385687, 0, 1, 0.2627451, 1,
-0.3536084, -2.371871, -1.867214, 0, 1, 0.2666667, 1,
-0.3525355, -1.161207, -3.771959, 0, 1, 0.2745098, 1,
-0.3511046, 0.3406753, -2.015154, 0, 1, 0.2784314, 1,
-0.3501991, -1.109055, -3.174204, 0, 1, 0.2862745, 1,
-0.3483592, 0.1136894, 0.1045795, 0, 1, 0.2901961, 1,
-0.3456923, 0.774817, -1.849584, 0, 1, 0.2980392, 1,
-0.3419131, -0.9826961, -2.403554, 0, 1, 0.3058824, 1,
-0.3416615, 0.6993597, -0.5259062, 0, 1, 0.3098039, 1,
-0.3369879, -1.832346, -0.6997083, 0, 1, 0.3176471, 1,
-0.3348764, 0.1309822, -0.4724987, 0, 1, 0.3215686, 1,
-0.3324798, -1.87305, -0.6272814, 0, 1, 0.3294118, 1,
-0.3309883, -0.1725779, -1.48102, 0, 1, 0.3333333, 1,
-0.3282094, 1.042372, -1.516382, 0, 1, 0.3411765, 1,
-0.3244458, 0.4130678, -0.3561152, 0, 1, 0.345098, 1,
-0.3104897, 1.439827, 0.2427362, 0, 1, 0.3529412, 1,
-0.3087182, 0.2500602, -1.335469, 0, 1, 0.3568628, 1,
-0.3081765, 0.817294, 0.6537669, 0, 1, 0.3647059, 1,
-0.307988, 0.596883, -1.56909, 0, 1, 0.3686275, 1,
-0.3078116, -0.537838, -2.554082, 0, 1, 0.3764706, 1,
-0.3077173, 1.502233, -0.1923514, 0, 1, 0.3803922, 1,
-0.3027432, 2.355298, -2.099133, 0, 1, 0.3882353, 1,
-0.3015494, 0.729553, -0.7570745, 0, 1, 0.3921569, 1,
-0.301489, 0.3566963, -1.171934, 0, 1, 0.4, 1,
-0.2880486, -0.3626544, -2.819969, 0, 1, 0.4078431, 1,
-0.286443, 0.8087444, -0.1606345, 0, 1, 0.4117647, 1,
-0.2784725, 1.074362, 0.3316414, 0, 1, 0.4196078, 1,
-0.272419, -1.59478, -2.17834, 0, 1, 0.4235294, 1,
-0.2692555, 1.833713, -1.811868, 0, 1, 0.4313726, 1,
-0.2689881, -1.820598, -3.889166, 0, 1, 0.4352941, 1,
-0.267058, -0.6448536, -3.50604, 0, 1, 0.4431373, 1,
-0.2655044, 0.2807392, -0.3173287, 0, 1, 0.4470588, 1,
-0.2648346, 0.7771198, -0.7540344, 0, 1, 0.454902, 1,
-0.2588501, 0.001548587, -1.885255, 0, 1, 0.4588235, 1,
-0.2516392, -1.104431, -2.79612, 0, 1, 0.4666667, 1,
-0.2506467, -0.6239152, -4.27945, 0, 1, 0.4705882, 1,
-0.2486567, -0.9246723, -3.638066, 0, 1, 0.4784314, 1,
-0.2477476, 0.7194335, -0.2997819, 0, 1, 0.4823529, 1,
-0.2475591, -1.237546, -2.139802, 0, 1, 0.4901961, 1,
-0.2441853, 3.029904, -0.3803049, 0, 1, 0.4941176, 1,
-0.2439718, 0.9241171, -1.402097, 0, 1, 0.5019608, 1,
-0.2414872, -0.03960294, -0.1213033, 0, 1, 0.509804, 1,
-0.2414554, -0.1226081, -1.693569, 0, 1, 0.5137255, 1,
-0.2379097, 0.118797, -0.8843149, 0, 1, 0.5215687, 1,
-0.2321493, 0.3851948, -1.338305, 0, 1, 0.5254902, 1,
-0.2314218, -0.3608235, -2.569407, 0, 1, 0.5333334, 1,
-0.2278055, 2.698062, -0.883799, 0, 1, 0.5372549, 1,
-0.2264318, -0.2015776, -2.378605, 0, 1, 0.5450981, 1,
-0.2257049, -1.61974, -1.576899, 0, 1, 0.5490196, 1,
-0.2247066, 0.1120017, -1.93561, 0, 1, 0.5568628, 1,
-0.222909, -0.5725499, -2.856455, 0, 1, 0.5607843, 1,
-0.2225825, -1.447571, -2.585992, 0, 1, 0.5686275, 1,
-0.218761, 0.4827506, 0.112482, 0, 1, 0.572549, 1,
-0.2185885, 0.0268567, -0.5542652, 0, 1, 0.5803922, 1,
-0.2183495, 0.5743614, 0.0842335, 0, 1, 0.5843138, 1,
-0.2174525, 1.33189, 0.82028, 0, 1, 0.5921569, 1,
-0.2086774, 0.7690501, -0.6618165, 0, 1, 0.5960785, 1,
-0.1925372, 0.246034, -0.7594317, 0, 1, 0.6039216, 1,
-0.1921126, -2.02361, -3.765015, 0, 1, 0.6117647, 1,
-0.1895923, -0.7757568, -3.912563, 0, 1, 0.6156863, 1,
-0.1878889, -1.586637, -4.063732, 0, 1, 0.6235294, 1,
-0.1843332, 0.1161321, -1.188125, 0, 1, 0.627451, 1,
-0.1795827, -1.331474, -2.861241, 0, 1, 0.6352941, 1,
-0.1757778, -1.235303, -3.849658, 0, 1, 0.6392157, 1,
-0.1723575, 0.245534, -1.426193, 0, 1, 0.6470588, 1,
-0.170978, 0.07712422, -1.712155, 0, 1, 0.6509804, 1,
-0.1707276, 0.3577485, 0.1103914, 0, 1, 0.6588235, 1,
-0.1687263, -0.3501914, -2.101348, 0, 1, 0.6627451, 1,
-0.1681659, 0.1171921, -0.7141827, 0, 1, 0.6705883, 1,
-0.1652541, -0.1755361, -1.917525, 0, 1, 0.6745098, 1,
-0.1577989, 2.660368, 0.1213064, 0, 1, 0.682353, 1,
-0.1575637, -0.8989519, -3.071623, 0, 1, 0.6862745, 1,
-0.1574138, 0.5228621, -0.7509122, 0, 1, 0.6941177, 1,
-0.1571442, 0.3340376, 0.6400855, 0, 1, 0.7019608, 1,
-0.1553756, -0.6138884, -3.215921, 0, 1, 0.7058824, 1,
-0.1533738, 0.01382918, -2.245552, 0, 1, 0.7137255, 1,
-0.1519524, 0.5540413, -1.087107, 0, 1, 0.7176471, 1,
-0.1467053, 0.00757114, 0.2508148, 0, 1, 0.7254902, 1,
-0.1436496, -0.8322731, -3.802172, 0, 1, 0.7294118, 1,
-0.1372693, 1.536805, -0.3150685, 0, 1, 0.7372549, 1,
-0.1370793, 1.742606, -0.002056112, 0, 1, 0.7411765, 1,
-0.1361205, -0.2673559, -2.346831, 0, 1, 0.7490196, 1,
-0.135022, 0.8719003, 0.6161973, 0, 1, 0.7529412, 1,
-0.1315617, 2.030725, 0.6493039, 0, 1, 0.7607843, 1,
-0.1306404, 1.135667, -1.594906, 0, 1, 0.7647059, 1,
-0.1300827, -0.9925393, -2.151052, 0, 1, 0.772549, 1,
-0.1260017, -1.552426, -3.528151, 0, 1, 0.7764706, 1,
-0.119672, 1.158637, -0.4389539, 0, 1, 0.7843137, 1,
-0.1178572, 0.9845353, -0.6363299, 0, 1, 0.7882353, 1,
-0.1164381, 0.6260616, -1.312454, 0, 1, 0.7960784, 1,
-0.1163973, 1.346978, -0.1163016, 0, 1, 0.8039216, 1,
-0.1148846, -0.4636597, -2.849221, 0, 1, 0.8078431, 1,
-0.1130155, 1.104635, -0.8010141, 0, 1, 0.8156863, 1,
-0.1111939, -0.1594415, -3.914248, 0, 1, 0.8196079, 1,
-0.1103932, -1.437989, -3.388553, 0, 1, 0.827451, 1,
-0.1100332, -1.250978, -2.978465, 0, 1, 0.8313726, 1,
-0.108504, -0.2114229, -2.669199, 0, 1, 0.8392157, 1,
-0.1025302, -1.328353, -3.299549, 0, 1, 0.8431373, 1,
-0.1013417, -0.4405851, -3.367714, 0, 1, 0.8509804, 1,
-0.0909637, 0.4077578, -0.8555789, 0, 1, 0.854902, 1,
-0.0904741, -1.974267, -2.757139, 0, 1, 0.8627451, 1,
-0.08983403, 0.1016229, -1.283302, 0, 1, 0.8666667, 1,
-0.08458115, -1.088171, -6.210145, 0, 1, 0.8745098, 1,
-0.07740177, -0.4115902, -4.276268, 0, 1, 0.8784314, 1,
-0.07566146, 0.6934199, -0.3940212, 0, 1, 0.8862745, 1,
-0.07103691, -0.06017115, -2.349559, 0, 1, 0.8901961, 1,
-0.07029507, 0.1015837, -0.2530784, 0, 1, 0.8980392, 1,
-0.06799155, -0.299876, -2.87706, 0, 1, 0.9058824, 1,
-0.06123189, -1.26881, -3.996682, 0, 1, 0.9098039, 1,
-0.0591438, 0.6618605, -1.353916, 0, 1, 0.9176471, 1,
-0.05375049, -0.3617547, -3.25069, 0, 1, 0.9215686, 1,
-0.05338674, 1.640544, -1.013487, 0, 1, 0.9294118, 1,
-0.05063812, -0.04820057, -1.897813, 0, 1, 0.9333333, 1,
-0.04870423, 0.205697, 0.7528071, 0, 1, 0.9411765, 1,
-0.04456972, -1.178941, -2.42351, 0, 1, 0.945098, 1,
-0.0439253, -0.4664845, -1.724234, 0, 1, 0.9529412, 1,
-0.0349907, -0.3644768, -4.683125, 0, 1, 0.9568627, 1,
-0.03207675, 0.4368374, -0.7409857, 0, 1, 0.9647059, 1,
-0.03066955, -0.07769726, -2.311582, 0, 1, 0.9686275, 1,
-0.02701565, -0.5305457, -1.449738, 0, 1, 0.9764706, 1,
-0.02407805, -1.231074, -4.041791, 0, 1, 0.9803922, 1,
-0.02117419, 0.01646709, -0.8026708, 0, 1, 0.9882353, 1,
-0.01945223, 1.378679, -1.853722, 0, 1, 0.9921569, 1,
-0.01361915, -0.2115084, -3.620959, 0, 1, 1, 1,
-0.01161447, -0.2883513, -3.296574, 0, 0.9921569, 1, 1,
-0.01059515, 1.281479, -0.2426198, 0, 0.9882353, 1, 1,
-0.0100868, 0.03377292, 0.5732888, 0, 0.9803922, 1, 1,
-0.009279446, -2.116895, -3.082635, 0, 0.9764706, 1, 1,
-0.008470139, 0.7950372, -0.07617549, 0, 0.9686275, 1, 1,
-0.00618891, 1.051506, 1.25898, 0, 0.9647059, 1, 1,
-0.0006021255, -0.3909803, -2.82201, 0, 0.9568627, 1, 1,
0.004774699, 1.172524, -0.2072871, 0, 0.9529412, 1, 1,
0.00694244, -0.06689908, 3.245542, 0, 0.945098, 1, 1,
0.009455635, -0.802443, 1.31503, 0, 0.9411765, 1, 1,
0.009596068, 2.186067, -1.879508, 0, 0.9333333, 1, 1,
0.01185787, -0.09598593, 3.634078, 0, 0.9294118, 1, 1,
0.01307803, 1.55444, -0.2951082, 0, 0.9215686, 1, 1,
0.01668383, -0.1130875, 2.889299, 0, 0.9176471, 1, 1,
0.02168292, -0.2626378, 3.299049, 0, 0.9098039, 1, 1,
0.02283153, 1.909176, 1.077907, 0, 0.9058824, 1, 1,
0.02525129, -0.5969024, 4.94763, 0, 0.8980392, 1, 1,
0.02793978, -0.02599298, 2.711553, 0, 0.8901961, 1, 1,
0.02851292, -0.2286524, 2.752842, 0, 0.8862745, 1, 1,
0.02898442, 0.2308641, 0.9075137, 0, 0.8784314, 1, 1,
0.02991926, -0.4842071, 2.469139, 0, 0.8745098, 1, 1,
0.03937038, 0.359142, -0.8252515, 0, 0.8666667, 1, 1,
0.03983429, -0.6789827, 3.348505, 0, 0.8627451, 1, 1,
0.04020661, 1.046385, 0.9478318, 0, 0.854902, 1, 1,
0.04141936, 0.1666715, 0.8760046, 0, 0.8509804, 1, 1,
0.04481568, -0.7456405, 3.764133, 0, 0.8431373, 1, 1,
0.04670866, -1.490706, 3.750467, 0, 0.8392157, 1, 1,
0.04979028, 0.4329814, -0.473383, 0, 0.8313726, 1, 1,
0.05337493, -0.4135006, 4.113895, 0, 0.827451, 1, 1,
0.05392324, 0.7107964, -0.3223253, 0, 0.8196079, 1, 1,
0.05629158, 0.7465693, -0.5734496, 0, 0.8156863, 1, 1,
0.05816879, 0.2693744, 1.175668, 0, 0.8078431, 1, 1,
0.05904771, 0.4407635, 0.5504044, 0, 0.8039216, 1, 1,
0.06774562, -0.5687244, 3.992891, 0, 0.7960784, 1, 1,
0.06805402, -1.369351, 2.083133, 0, 0.7882353, 1, 1,
0.06807446, -2.132308, 3.423496, 0, 0.7843137, 1, 1,
0.07019021, -0.03452577, 2.797834, 0, 0.7764706, 1, 1,
0.07104525, -1.599124, 3.006284, 0, 0.772549, 1, 1,
0.07319248, 0.2024531, 0.4308209, 0, 0.7647059, 1, 1,
0.07572579, 0.8007506, -2.107861, 0, 0.7607843, 1, 1,
0.08114871, -0.4162833, 3.523816, 0, 0.7529412, 1, 1,
0.08549958, 0.07780653, -0.9815872, 0, 0.7490196, 1, 1,
0.08643004, 0.4792551, -0.2913089, 0, 0.7411765, 1, 1,
0.08646027, 1.277864, 0.01171049, 0, 0.7372549, 1, 1,
0.08844925, 0.6653119, -0.5975418, 0, 0.7294118, 1, 1,
0.09434028, -0.2663673, 2.67078, 0, 0.7254902, 1, 1,
0.09543592, 0.2368834, 1.706918, 0, 0.7176471, 1, 1,
0.09559535, -0.5833845, 2.972256, 0, 0.7137255, 1, 1,
0.09576296, -1.789946, 3.904886, 0, 0.7058824, 1, 1,
0.09766423, 1.064019, -0.2937984, 0, 0.6980392, 1, 1,
0.0992656, 1.084167, -0.532888, 0, 0.6941177, 1, 1,
0.1045057, -1.095926, 1.37996, 0, 0.6862745, 1, 1,
0.1062544, -0.6536555, 3.157043, 0, 0.682353, 1, 1,
0.106485, -0.5717286, 2.496508, 0, 0.6745098, 1, 1,
0.1074807, -1.85905, 3.160198, 0, 0.6705883, 1, 1,
0.11006, 0.07096922, 1.676712, 0, 0.6627451, 1, 1,
0.1113868, 0.916178, -0.3097105, 0, 0.6588235, 1, 1,
0.1132528, 0.634544, 0.9025577, 0, 0.6509804, 1, 1,
0.1230488, -1.205553, 2.038369, 0, 0.6470588, 1, 1,
0.1233211, 0.8781896, -1.623477, 0, 0.6392157, 1, 1,
0.1246162, 1.551841, -0.5563892, 0, 0.6352941, 1, 1,
0.125881, -0.4959042, 1.494857, 0, 0.627451, 1, 1,
0.1300025, -0.09502207, 2.164611, 0, 0.6235294, 1, 1,
0.1318954, 0.8941218, -0.2496187, 0, 0.6156863, 1, 1,
0.1319003, 0.05412707, 0.1351849, 0, 0.6117647, 1, 1,
0.1320845, 0.8957112, -0.8629811, 0, 0.6039216, 1, 1,
0.1375826, 0.6144043, 1.102163, 0, 0.5960785, 1, 1,
0.1380676, 0.5092606, -0.06469071, 0, 0.5921569, 1, 1,
0.1391044, 1.039136, 1.955212, 0, 0.5843138, 1, 1,
0.1403606, 0.3373461, 0.134431, 0, 0.5803922, 1, 1,
0.1409613, 0.05968811, 1.189651, 0, 0.572549, 1, 1,
0.1448608, -1.591537, 3.944277, 0, 0.5686275, 1, 1,
0.1492341, 0.4289774, 0.8113002, 0, 0.5607843, 1, 1,
0.1502903, 0.04688312, 0.6854073, 0, 0.5568628, 1, 1,
0.1516891, -0.2804271, 0.5131143, 0, 0.5490196, 1, 1,
0.1536533, -2.13831, 4.992588, 0, 0.5450981, 1, 1,
0.1567361, 2.497437, -0.3088319, 0, 0.5372549, 1, 1,
0.1579285, -0.1709253, 2.080709, 0, 0.5333334, 1, 1,
0.1599987, 0.6985537, -0.7006118, 0, 0.5254902, 1, 1,
0.163275, 0.1998916, 0.0599365, 0, 0.5215687, 1, 1,
0.1659181, 0.5224717, -0.665518, 0, 0.5137255, 1, 1,
0.1709544, -0.6133212, 4.383782, 0, 0.509804, 1, 1,
0.1712916, 0.4766372, 0.07664797, 0, 0.5019608, 1, 1,
0.1713008, -0.8052325, 3.090693, 0, 0.4941176, 1, 1,
0.171587, -0.4053504, 3.212312, 0, 0.4901961, 1, 1,
0.1761351, -0.3813195, 2.704874, 0, 0.4823529, 1, 1,
0.1825004, 0.8979413, 1.790546, 0, 0.4784314, 1, 1,
0.1836219, -0.7702686, 1.943995, 0, 0.4705882, 1, 1,
0.1855384, -0.6653175, 1.51753, 0, 0.4666667, 1, 1,
0.1925565, -0.4453714, 0.721875, 0, 0.4588235, 1, 1,
0.1952082, 0.03757204, 0.458694, 0, 0.454902, 1, 1,
0.2024008, -0.091332, 2.50527, 0, 0.4470588, 1, 1,
0.2087902, 1.423356, 1.702538, 0, 0.4431373, 1, 1,
0.2097529, 2.055446, -1.705387, 0, 0.4352941, 1, 1,
0.2119813, -1.51555, 2.833889, 0, 0.4313726, 1, 1,
0.2139169, 1.521781, 0.7152581, 0, 0.4235294, 1, 1,
0.2150887, 0.01810688, -0.5291609, 0, 0.4196078, 1, 1,
0.2157878, -2.1705, 2.434492, 0, 0.4117647, 1, 1,
0.216614, -1.259584, 1.618256, 0, 0.4078431, 1, 1,
0.2199505, 0.0479013, -0.1743047, 0, 0.4, 1, 1,
0.2248812, -2.315153, 3.796619, 0, 0.3921569, 1, 1,
0.225179, -1.199592, 1.689626, 0, 0.3882353, 1, 1,
0.2285633, 0.1125368, 0.6881604, 0, 0.3803922, 1, 1,
0.2302549, -1.101908, 2.41137, 0, 0.3764706, 1, 1,
0.2327798, -0.2514628, 3.905159, 0, 0.3686275, 1, 1,
0.233999, -1.945711, 5.225246, 0, 0.3647059, 1, 1,
0.2348415, 0.7225609, 0.353711, 0, 0.3568628, 1, 1,
0.2457083, -1.360534, 3.306223, 0, 0.3529412, 1, 1,
0.2502134, 0.2401179, -0.5511023, 0, 0.345098, 1, 1,
0.2531891, -0.1676429, 2.452584, 0, 0.3411765, 1, 1,
0.2557328, 0.1748798, 0.7525164, 0, 0.3333333, 1, 1,
0.2568429, -1.967989, 3.279472, 0, 0.3294118, 1, 1,
0.2584287, 0.1643565, 1.481224, 0, 0.3215686, 1, 1,
0.2673994, -0.9957002, 2.416761, 0, 0.3176471, 1, 1,
0.2745978, 0.6753835, 0.7966063, 0, 0.3098039, 1, 1,
0.2759121, -0.8213943, 3.350099, 0, 0.3058824, 1, 1,
0.2785017, 1.40312, 0.818169, 0, 0.2980392, 1, 1,
0.2801497, 0.5362765, 1.319551, 0, 0.2901961, 1, 1,
0.2818652, -0.6415726, 2.068642, 0, 0.2862745, 1, 1,
0.2819497, 0.238501, 0.4534336, 0, 0.2784314, 1, 1,
0.287319, -0.0009907105, 0.3036304, 0, 0.2745098, 1, 1,
0.2878281, -3.474562, 2.649336, 0, 0.2666667, 1, 1,
0.2882459, -0.5068436, 1.876843, 0, 0.2627451, 1, 1,
0.2890154, -2.485486, 2.398263, 0, 0.254902, 1, 1,
0.2903574, -0.6626831, 2.693932, 0, 0.2509804, 1, 1,
0.2912494, 0.4103318, -0.1986001, 0, 0.2431373, 1, 1,
0.2968874, -0.9283617, 2.726901, 0, 0.2392157, 1, 1,
0.3020937, 0.3682875, -1.573326, 0, 0.2313726, 1, 1,
0.3024988, -0.7451714, 5.048922, 0, 0.227451, 1, 1,
0.302803, -1.064828, 1.3076, 0, 0.2196078, 1, 1,
0.3060518, 1.305676, -0.078235, 0, 0.2156863, 1, 1,
0.3065688, 0.1253465, -0.8831308, 0, 0.2078431, 1, 1,
0.3072347, 0.2389645, -0.2817603, 0, 0.2039216, 1, 1,
0.3100632, 0.3972829, 1.905673, 0, 0.1960784, 1, 1,
0.3152453, -0.9228635, 2.343367, 0, 0.1882353, 1, 1,
0.3175702, -0.2911342, 2.520964, 0, 0.1843137, 1, 1,
0.3217765, -1.675805, 4.372465, 0, 0.1764706, 1, 1,
0.3229429, -1.411842, 3.912237, 0, 0.172549, 1, 1,
0.323208, 0.6067405, -0.4183396, 0, 0.1647059, 1, 1,
0.3274783, 0.9267976, 0.2769836, 0, 0.1607843, 1, 1,
0.3277502, -0.4931077, 1.800153, 0, 0.1529412, 1, 1,
0.3277984, -0.3089839, 1.435334, 0, 0.1490196, 1, 1,
0.3295391, -1.949033, 1.900448, 0, 0.1411765, 1, 1,
0.3357686, 0.0716387, 2.275597, 0, 0.1372549, 1, 1,
0.3383296, 1.342378, 2.899974, 0, 0.1294118, 1, 1,
0.3400657, 0.31909, 1.673721, 0, 0.1254902, 1, 1,
0.3402924, -0.0702071, 0.8555635, 0, 0.1176471, 1, 1,
0.3417182, -0.466252, 1.422529, 0, 0.1137255, 1, 1,
0.3417739, -1.30507, 2.455755, 0, 0.1058824, 1, 1,
0.3436053, -0.9815767, 3.407323, 0, 0.09803922, 1, 1,
0.3449694, 1.675157, -0.4730777, 0, 0.09411765, 1, 1,
0.3451904, -1.19097, 2.172929, 0, 0.08627451, 1, 1,
0.3457353, 1.279081, 0.594103, 0, 0.08235294, 1, 1,
0.3462921, 0.04354345, 1.657499, 0, 0.07450981, 1, 1,
0.3467085, -0.9523742, 2.725469, 0, 0.07058824, 1, 1,
0.3478453, -0.1475386, 0.3810574, 0, 0.0627451, 1, 1,
0.3515065, 1.174212, 2.570862, 0, 0.05882353, 1, 1,
0.3544146, -1.671288, 2.330352, 0, 0.05098039, 1, 1,
0.3589502, 1.149279, -1.296423, 0, 0.04705882, 1, 1,
0.3668987, -2.723042, 3.102302, 0, 0.03921569, 1, 1,
0.3673514, 0.9613392, 1.370142, 0, 0.03529412, 1, 1,
0.3705468, 0.2655182, 1.161189, 0, 0.02745098, 1, 1,
0.371449, -0.9809657, 2.479454, 0, 0.02352941, 1, 1,
0.3721995, -0.03913851, 2.464908, 0, 0.01568628, 1, 1,
0.3723062, -0.3548581, 3.311479, 0, 0.01176471, 1, 1,
0.3731491, -0.8481005, 3.367748, 0, 0.003921569, 1, 1,
0.3771209, 1.886133, 0.8352153, 0.003921569, 0, 1, 1,
0.3793907, -1.216448, 1.683981, 0.007843138, 0, 1, 1,
0.3810319, -1.036109, 2.969386, 0.01568628, 0, 1, 1,
0.3819487, -0.3900298, 2.338318, 0.01960784, 0, 1, 1,
0.3844067, -1.352391, 3.40647, 0.02745098, 0, 1, 1,
0.3859717, 0.1426904, 1.015004, 0.03137255, 0, 1, 1,
0.3890917, -2.025616, 3.6543, 0.03921569, 0, 1, 1,
0.3938671, 1.233011, -1.257879, 0.04313726, 0, 1, 1,
0.4010767, 1.883968, 0.4301993, 0.05098039, 0, 1, 1,
0.4012798, 0.0691874, 2.643475, 0.05490196, 0, 1, 1,
0.4039742, -1.117861, 3.398584, 0.0627451, 0, 1, 1,
0.4156163, 0.09666693, 0.9211663, 0.06666667, 0, 1, 1,
0.4200066, -0.3861316, 2.536578, 0.07450981, 0, 1, 1,
0.4218301, 0.7102386, -0.8305796, 0.07843138, 0, 1, 1,
0.4234216, -0.1280029, 1.406838, 0.08627451, 0, 1, 1,
0.4252928, -0.5823604, 2.739526, 0.09019608, 0, 1, 1,
0.4261995, 0.3996959, 2.898601, 0.09803922, 0, 1, 1,
0.4276302, 1.694741, 0.5079942, 0.1058824, 0, 1, 1,
0.4302261, -0.06547417, 1.506676, 0.1098039, 0, 1, 1,
0.4328419, -0.6921028, 2.971092, 0.1176471, 0, 1, 1,
0.4364758, -1.760808, 5.120528, 0.1215686, 0, 1, 1,
0.4470405, -1.242754, 2.444009, 0.1294118, 0, 1, 1,
0.4501874, 1.124904, 0.9308671, 0.1333333, 0, 1, 1,
0.4511214, 1.568128, -1.67167, 0.1411765, 0, 1, 1,
0.4513842, -1.925481, 0.6880608, 0.145098, 0, 1, 1,
0.4513876, 1.187732, 0.8256014, 0.1529412, 0, 1, 1,
0.4528431, 1.158543, 0.4964187, 0.1568628, 0, 1, 1,
0.4528936, -0.2581916, 2.925895, 0.1647059, 0, 1, 1,
0.4629283, -0.1821354, 1.346816, 0.1686275, 0, 1, 1,
0.4718201, -1.169319, 1.658669, 0.1764706, 0, 1, 1,
0.4758149, -1.476378, 1.37665, 0.1803922, 0, 1, 1,
0.4766233, 0.1857685, 2.317693, 0.1882353, 0, 1, 1,
0.4793413, 0.452759, -0.3171887, 0.1921569, 0, 1, 1,
0.4833282, 0.701858, -0.1700184, 0.2, 0, 1, 1,
0.4836739, -1.726016, 4.217083, 0.2078431, 0, 1, 1,
0.4944445, 1.422687, 0.3138004, 0.2117647, 0, 1, 1,
0.4951272, 0.2765933, -0.7206674, 0.2196078, 0, 1, 1,
0.5020081, 1.039249, -1.478652, 0.2235294, 0, 1, 1,
0.5039456, -0.3013344, 2.781835, 0.2313726, 0, 1, 1,
0.508721, -0.9889669, 4.221524, 0.2352941, 0, 1, 1,
0.5126154, -0.7293991, 3.004701, 0.2431373, 0, 1, 1,
0.515343, -0.3247227, 2.372537, 0.2470588, 0, 1, 1,
0.5178685, -1.237837, 3.314016, 0.254902, 0, 1, 1,
0.5314614, -0.3779975, 2.256959, 0.2588235, 0, 1, 1,
0.5339068, -1.578065, 4.784546, 0.2666667, 0, 1, 1,
0.5398527, 0.1424712, 1.147935, 0.2705882, 0, 1, 1,
0.5413732, 1.341757, -0.2119107, 0.2784314, 0, 1, 1,
0.5421736, 0.2815759, 2.141597, 0.282353, 0, 1, 1,
0.5429944, 0.2409119, -0.5602392, 0.2901961, 0, 1, 1,
0.5504015, -0.0861912, 2.631984, 0.2941177, 0, 1, 1,
0.5611246, 0.7418378, 0.04402179, 0.3019608, 0, 1, 1,
0.562748, 0.02911885, -0.391576, 0.3098039, 0, 1, 1,
0.5642877, 0.4052295, -0.6555361, 0.3137255, 0, 1, 1,
0.5662119, -0.1231753, 1.409487, 0.3215686, 0, 1, 1,
0.5702597, 0.9540939, -0.2747268, 0.3254902, 0, 1, 1,
0.5730878, -0.05037113, 2.244594, 0.3333333, 0, 1, 1,
0.5771173, -2.564339, 1.603557, 0.3372549, 0, 1, 1,
0.5791765, 0.7579485, 1.095852, 0.345098, 0, 1, 1,
0.5801659, 1.035806, 0.04814311, 0.3490196, 0, 1, 1,
0.5891825, 0.125239, 0.327464, 0.3568628, 0, 1, 1,
0.5896202, 1.182638, -1.125625, 0.3607843, 0, 1, 1,
0.5943429, -0.1812577, 3.086714, 0.3686275, 0, 1, 1,
0.5981035, -1.389158, 4.560726, 0.372549, 0, 1, 1,
0.6000614, 0.4574699, 0.9061868, 0.3803922, 0, 1, 1,
0.6025096, -0.5302699, 4.512677, 0.3843137, 0, 1, 1,
0.6027904, 0.0380564, 2.603608, 0.3921569, 0, 1, 1,
0.6043285, -1.839956, 2.225161, 0.3960784, 0, 1, 1,
0.6055275, 0.9070351, 0.1426185, 0.4039216, 0, 1, 1,
0.6074966, -1.088279, 1.917197, 0.4117647, 0, 1, 1,
0.6130192, -1.228837, 2.441293, 0.4156863, 0, 1, 1,
0.6136112, 0.1745729, 1.960857, 0.4235294, 0, 1, 1,
0.6137634, -0.3966098, 2.526269, 0.427451, 0, 1, 1,
0.6156332, -0.9439254, 3.848832, 0.4352941, 0, 1, 1,
0.617228, -0.8554769, 3.156515, 0.4392157, 0, 1, 1,
0.6202831, -0.3526426, 2.48845, 0.4470588, 0, 1, 1,
0.6219014, 0.2331384, 0.3225155, 0.4509804, 0, 1, 1,
0.6238783, 1.882545, 1.124016, 0.4588235, 0, 1, 1,
0.6249608, -0.1367576, 2.504986, 0.4627451, 0, 1, 1,
0.6253592, 1.856432, 0.1354879, 0.4705882, 0, 1, 1,
0.6268671, 1.54099, -2.368912, 0.4745098, 0, 1, 1,
0.6360286, 1.363629, 0.9756484, 0.4823529, 0, 1, 1,
0.6365433, 0.1357286, 2.028152, 0.4862745, 0, 1, 1,
0.6389449, -0.5256208, 2.584446, 0.4941176, 0, 1, 1,
0.6399012, -0.5576643, 2.896495, 0.5019608, 0, 1, 1,
0.6420064, -1.255845, 4.360961, 0.5058824, 0, 1, 1,
0.6436176, -0.2324975, 1.825739, 0.5137255, 0, 1, 1,
0.6491162, -0.1247659, 3.56033, 0.5176471, 0, 1, 1,
0.6515946, 1.781539, -0.4155988, 0.5254902, 0, 1, 1,
0.6593971, 1.485824, -0.06415936, 0.5294118, 0, 1, 1,
0.6679229, -0.838705, 2.786267, 0.5372549, 0, 1, 1,
0.6783201, 0.3919597, 2.300551, 0.5411765, 0, 1, 1,
0.6823548, 0.6538209, 2.865824, 0.5490196, 0, 1, 1,
0.6871271, -2.463606, 2.396694, 0.5529412, 0, 1, 1,
0.6874518, -0.7177609, 1.242715, 0.5607843, 0, 1, 1,
0.6897511, 1.273261, 0.2887333, 0.5647059, 0, 1, 1,
0.6919087, -1.977391, 2.432839, 0.572549, 0, 1, 1,
0.693203, -0.5861895, 4.12389, 0.5764706, 0, 1, 1,
0.6938453, -0.9323193, 2.216444, 0.5843138, 0, 1, 1,
0.6973308, -1.154781, 3.390436, 0.5882353, 0, 1, 1,
0.6993494, 0.2354291, 0.06067871, 0.5960785, 0, 1, 1,
0.6999262, 0.7745061, -0.5281557, 0.6039216, 0, 1, 1,
0.7012215, 1.44985, -0.9305547, 0.6078432, 0, 1, 1,
0.7021043, 0.4559195, 0.8125264, 0.6156863, 0, 1, 1,
0.7032385, -0.329045, 2.370455, 0.6196079, 0, 1, 1,
0.7057293, 0.9914459, 0.7891977, 0.627451, 0, 1, 1,
0.7073164, 2.383238, 0.7009347, 0.6313726, 0, 1, 1,
0.7214701, -1.474687, 3.256386, 0.6392157, 0, 1, 1,
0.7258151, 1.546976, 0.9321594, 0.6431373, 0, 1, 1,
0.7284716, -0.01656553, 2.621609, 0.6509804, 0, 1, 1,
0.7355798, 0.3942212, 0.675612, 0.654902, 0, 1, 1,
0.7369938, -0.1179036, 2.493712, 0.6627451, 0, 1, 1,
0.7375743, 0.003189934, 1.723676, 0.6666667, 0, 1, 1,
0.739191, 0.7677205, -0.1083264, 0.6745098, 0, 1, 1,
0.7405345, -1.022068, 4.228731, 0.6784314, 0, 1, 1,
0.7475809, 0.1141681, -0.4705085, 0.6862745, 0, 1, 1,
0.7580568, 1.381572, 1.181101, 0.6901961, 0, 1, 1,
0.763498, -1.441727, 3.185651, 0.6980392, 0, 1, 1,
0.7705465, 0.0598975, 2.67414, 0.7058824, 0, 1, 1,
0.7748485, 0.842307, 1.679187, 0.7098039, 0, 1, 1,
0.7754108, -0.7742847, 2.553154, 0.7176471, 0, 1, 1,
0.7773177, 0.3614867, 0.5758767, 0.7215686, 0, 1, 1,
0.7788209, -0.3825635, 1.765419, 0.7294118, 0, 1, 1,
0.7809148, 0.8500937, 0.1608403, 0.7333333, 0, 1, 1,
0.7813962, -1.191756, 2.275803, 0.7411765, 0, 1, 1,
0.78869, 1.070418, 0.5675917, 0.7450981, 0, 1, 1,
0.7910746, -0.01629595, 3.128326, 0.7529412, 0, 1, 1,
0.7912567, -0.1343454, 1.702285, 0.7568628, 0, 1, 1,
0.7955613, -1.332806, 3.587313, 0.7647059, 0, 1, 1,
0.7995672, 0.3722068, 2.595194, 0.7686275, 0, 1, 1,
0.8002323, 0.5148734, 1.66996, 0.7764706, 0, 1, 1,
0.8029249, 0.06594165, 0.617331, 0.7803922, 0, 1, 1,
0.8061603, 2.285806, -1.533999, 0.7882353, 0, 1, 1,
0.8069294, 1.491026, -0.8307344, 0.7921569, 0, 1, 1,
0.8109976, 0.3874654, 1.50319, 0.8, 0, 1, 1,
0.819728, 0.6524001, 0.6503367, 0.8078431, 0, 1, 1,
0.8202933, -0.6539917, 0.7642463, 0.8117647, 0, 1, 1,
0.8219497, -1.242646, 3.308897, 0.8196079, 0, 1, 1,
0.8221502, 0.765086, 1.747435, 0.8235294, 0, 1, 1,
0.8345686, 1.475451, 0.3553168, 0.8313726, 0, 1, 1,
0.8351141, -0.1214798, 1.177696, 0.8352941, 0, 1, 1,
0.8357323, 0.5107913, 0.7651846, 0.8431373, 0, 1, 1,
0.8445684, 1.000179, 0.4356288, 0.8470588, 0, 1, 1,
0.8501909, 0.7088391, -0.1932093, 0.854902, 0, 1, 1,
0.8536682, 0.01033162, 1.383492, 0.8588235, 0, 1, 1,
0.8543935, 0.8002235, 1.500277, 0.8666667, 0, 1, 1,
0.8551679, -0.3532609, 1.819734, 0.8705882, 0, 1, 1,
0.8590436, 1.324294, -0.2808768, 0.8784314, 0, 1, 1,
0.8597496, 1.259189, -1.64435, 0.8823529, 0, 1, 1,
0.8610689, 1.711385, 1.254638, 0.8901961, 0, 1, 1,
0.8652439, -0.2594686, 1.359871, 0.8941177, 0, 1, 1,
0.867057, 1.581389, 1.849851, 0.9019608, 0, 1, 1,
0.8679433, 0.8918, 2.639364, 0.9098039, 0, 1, 1,
0.8701108, -1.52595, 2.691941, 0.9137255, 0, 1, 1,
0.8871948, -1.117174, 3.200382, 0.9215686, 0, 1, 1,
0.8913057, -0.2306958, 1.524076, 0.9254902, 0, 1, 1,
0.8922774, 0.2284833, 2.164638, 0.9333333, 0, 1, 1,
0.8972191, 0.0796944, 3.783366, 0.9372549, 0, 1, 1,
0.89726, 1.516954, 0.1937835, 0.945098, 0, 1, 1,
0.8991827, 0.39971, 2.620691, 0.9490196, 0, 1, 1,
0.9012839, 0.04672392, -0.2918789, 0.9568627, 0, 1, 1,
0.9098833, 0.09460178, 1.593821, 0.9607843, 0, 1, 1,
0.9228114, -0.1474212, -0.3689274, 0.9686275, 0, 1, 1,
0.9239721, 0.423532, 2.168635, 0.972549, 0, 1, 1,
0.925816, 0.8352442, -0.1005477, 0.9803922, 0, 1, 1,
0.9263797, 0.1548415, 2.001501, 0.9843137, 0, 1, 1,
0.9385922, 0.4004299, 0.1668688, 0.9921569, 0, 1, 1,
0.9459579, 0.4743073, 0.009956256, 0.9960784, 0, 1, 1,
0.9548972, -0.4965102, 1.811686, 1, 0, 0.9960784, 1,
0.9616843, -1.662854, 2.565163, 1, 0, 0.9882353, 1,
0.964416, 0.6223138, 0.620556, 1, 0, 0.9843137, 1,
0.9651971, 1.006172, 1.413438, 1, 0, 0.9764706, 1,
0.9728321, 0.5648556, 3.379346, 1, 0, 0.972549, 1,
0.9809726, 1.289397, 1.106883, 1, 0, 0.9647059, 1,
0.9889497, -0.6714541, 0.4916763, 1, 0, 0.9607843, 1,
0.9902039, 0.0904943, 3.039942, 1, 0, 0.9529412, 1,
0.9921271, -1.121516, 2.560379, 1, 0, 0.9490196, 1,
0.9961867, 0.000171432, -1.448311, 1, 0, 0.9411765, 1,
0.9976128, -1.136594, 3.918878, 1, 0, 0.9372549, 1,
0.9986037, -1.475001, 2.225505, 1, 0, 0.9294118, 1,
1.004247, 0.06276672, 1.575497, 1, 0, 0.9254902, 1,
1.013785, 0.4096085, 1.195049, 1, 0, 0.9176471, 1,
1.01433, 1.006515, -0.3065329, 1, 0, 0.9137255, 1,
1.017059, -0.5191349, 1.300083, 1, 0, 0.9058824, 1,
1.030738, -1.860584, 2.27991, 1, 0, 0.9019608, 1,
1.031441, -0.4975441, 3.873401, 1, 0, 0.8941177, 1,
1.031531, 2.001373, -0.8941068, 1, 0, 0.8862745, 1,
1.033157, -1.050796, 1.512049, 1, 0, 0.8823529, 1,
1.040606, -0.7465194, 3.383497, 1, 0, 0.8745098, 1,
1.050202, -0.6161016, 0.502564, 1, 0, 0.8705882, 1,
1.051672, -0.9218493, 2.621208, 1, 0, 0.8627451, 1,
1.054679, 0.5462805, 1.232027, 1, 0, 0.8588235, 1,
1.057047, 0.5800707, 0.9584193, 1, 0, 0.8509804, 1,
1.062957, -0.09484829, 2.945573, 1, 0, 0.8470588, 1,
1.085282, 1.312462, 2.178114, 1, 0, 0.8392157, 1,
1.087222, -1.077727, 1.214991, 1, 0, 0.8352941, 1,
1.090464, -0.3375559, 0.5381585, 1, 0, 0.827451, 1,
1.09262, 1.383914, -0.183858, 1, 0, 0.8235294, 1,
1.101388, -0.3525798, 1.019227, 1, 0, 0.8156863, 1,
1.105216, -0.9474224, 1.497108, 1, 0, 0.8117647, 1,
1.113815, 1.235781, -0.3476267, 1, 0, 0.8039216, 1,
1.127304, -1.464397, 3.136639, 1, 0, 0.7960784, 1,
1.134727, -0.8164555, 1.529489, 1, 0, 0.7921569, 1,
1.142961, -1.677416, 2.067406, 1, 0, 0.7843137, 1,
1.147934, -0.2754068, 3.648913, 1, 0, 0.7803922, 1,
1.156886, -0.939162, 0.4510843, 1, 0, 0.772549, 1,
1.157108, 0.1088929, 1.934342, 1, 0, 0.7686275, 1,
1.159996, -0.4360034, 2.622095, 1, 0, 0.7607843, 1,
1.173775, -1.305035, 2.894034, 1, 0, 0.7568628, 1,
1.180828, 0.003784847, 0.448947, 1, 0, 0.7490196, 1,
1.193517, 0.6947815, 0.8820122, 1, 0, 0.7450981, 1,
1.196525, -0.6023751, 3.381169, 1, 0, 0.7372549, 1,
1.203631, 1.174111, 0.6470085, 1, 0, 0.7333333, 1,
1.206712, -1.76002, 2.530697, 1, 0, 0.7254902, 1,
1.211454, -0.9766197, 2.813829, 1, 0, 0.7215686, 1,
1.21549, 0.7339426, 1.064233, 1, 0, 0.7137255, 1,
1.216067, -0.9701582, 1.657373, 1, 0, 0.7098039, 1,
1.219948, -0.4386676, 1.686756, 1, 0, 0.7019608, 1,
1.232244, 1.610296, 1.140425, 1, 0, 0.6941177, 1,
1.240694, 0.06598471, 0.4646123, 1, 0, 0.6901961, 1,
1.241777, 0.2292358, 0.5626551, 1, 0, 0.682353, 1,
1.244759, 1.202338, -0.01020991, 1, 0, 0.6784314, 1,
1.251752, -0.3453389, 2.095666, 1, 0, 0.6705883, 1,
1.261323, 1.465438, 1.617891, 1, 0, 0.6666667, 1,
1.264741, 0.05322853, 2.012866, 1, 0, 0.6588235, 1,
1.273394, 1.704251, 1.39777, 1, 0, 0.654902, 1,
1.273698, 0.1530353, -0.3392301, 1, 0, 0.6470588, 1,
1.276163, -0.7419549, 2.284254, 1, 0, 0.6431373, 1,
1.287155, 0.5901418, 1.796591, 1, 0, 0.6352941, 1,
1.296974, 0.6680935, 0.2153224, 1, 0, 0.6313726, 1,
1.301707, -0.1507719, 2.555606, 1, 0, 0.6235294, 1,
1.305898, 0.6726272, -0.07526096, 1, 0, 0.6196079, 1,
1.30647, 0.5743002, 1.549514, 1, 0, 0.6117647, 1,
1.308172, -0.7963137, 0.8510669, 1, 0, 0.6078432, 1,
1.308289, 0.2938459, 0.4418897, 1, 0, 0.6, 1,
1.310471, -1.435895, 1.816907, 1, 0, 0.5921569, 1,
1.323453, -0.3571356, 3.260768, 1, 0, 0.5882353, 1,
1.325992, -1.887741, 3.541632, 1, 0, 0.5803922, 1,
1.326503, -0.2627698, 2.524058, 1, 0, 0.5764706, 1,
1.334563, -1.134001, 3.536544, 1, 0, 0.5686275, 1,
1.337632, -0.07346068, 1.63965, 1, 0, 0.5647059, 1,
1.355015, 0.3916882, 2.251814, 1, 0, 0.5568628, 1,
1.360612, -0.7886193, 0.5061612, 1, 0, 0.5529412, 1,
1.367878, 1.157834, 0.7374698, 1, 0, 0.5450981, 1,
1.368289, -0.7311318, 2.593986, 1, 0, 0.5411765, 1,
1.372, 0.5219013, 1.332516, 1, 0, 0.5333334, 1,
1.395385, 2.155413, 0.8150935, 1, 0, 0.5294118, 1,
1.40362, 0.5797589, -0.08056182, 1, 0, 0.5215687, 1,
1.406401, 0.05967904, 0.25217, 1, 0, 0.5176471, 1,
1.406819, 0.6496438, 1.493575, 1, 0, 0.509804, 1,
1.413268, 0.1496932, 0.6979774, 1, 0, 0.5058824, 1,
1.430498, 0.1057172, -0.2638492, 1, 0, 0.4980392, 1,
1.432193, 0.06890976, 1.398989, 1, 0, 0.4901961, 1,
1.436672, -0.6830624, 3.190034, 1, 0, 0.4862745, 1,
1.450104, 1.04958, 1.639846, 1, 0, 0.4784314, 1,
1.462506, -0.7387828, 4.523549, 1, 0, 0.4745098, 1,
1.467479, -0.1871708, 4.076291, 1, 0, 0.4666667, 1,
1.46998, 1.922407, 1.947954, 1, 0, 0.4627451, 1,
1.476792, 0.2263441, 1.328171, 1, 0, 0.454902, 1,
1.483882, -0.430166, 2.402202, 1, 0, 0.4509804, 1,
1.485327, 0.4202233, 0.311745, 1, 0, 0.4431373, 1,
1.491135, 1.171718, 0.6556801, 1, 0, 0.4392157, 1,
1.49116, -1.011735, 2.882358, 1, 0, 0.4313726, 1,
1.502276, 0.3188542, 1.676497, 1, 0, 0.427451, 1,
1.520357, -0.6670709, 0.6581694, 1, 0, 0.4196078, 1,
1.526368, 0.5874561, 0.6693098, 1, 0, 0.4156863, 1,
1.530831, 0.7058937, 1.22201, 1, 0, 0.4078431, 1,
1.534235, 0.4357527, 0.9704809, 1, 0, 0.4039216, 1,
1.534311, 0.0824678, 1.095853, 1, 0, 0.3960784, 1,
1.539861, 0.4183771, -0.04262724, 1, 0, 0.3882353, 1,
1.541858, -0.3162676, 2.152349, 1, 0, 0.3843137, 1,
1.549332, 0.4046789, 4.326708, 1, 0, 0.3764706, 1,
1.55981, -0.6852978, 2.482656, 1, 0, 0.372549, 1,
1.567227, 0.7601222, 0.8841073, 1, 0, 0.3647059, 1,
1.571473, 0.5690837, 0.8467874, 1, 0, 0.3607843, 1,
1.575617, -0.6983021, 1.234227, 1, 0, 0.3529412, 1,
1.577843, -0.4615136, 3.140081, 1, 0, 0.3490196, 1,
1.578586, -0.5873899, 2.616762, 1, 0, 0.3411765, 1,
1.579137, -1.934898, 2.756595, 1, 0, 0.3372549, 1,
1.581934, 0.107541, -0.3834616, 1, 0, 0.3294118, 1,
1.585933, -0.1333679, 1.937678, 1, 0, 0.3254902, 1,
1.58831, 1.354818, 2.342815, 1, 0, 0.3176471, 1,
1.591007, 1.096173, 0.439981, 1, 0, 0.3137255, 1,
1.603523, 0.5834406, 1.492052, 1, 0, 0.3058824, 1,
1.603856, 0.5199608, 1.153241, 1, 0, 0.2980392, 1,
1.609414, 1.432115, 1.730134, 1, 0, 0.2941177, 1,
1.614476, -0.94052, 2.805225, 1, 0, 0.2862745, 1,
1.62124, 0.2697983, 2.914943, 1, 0, 0.282353, 1,
1.62311, 1.436553, -0.5221995, 1, 0, 0.2745098, 1,
1.62353, 1.65628, 0.4378204, 1, 0, 0.2705882, 1,
1.625322, 1.673459, -1.019141, 1, 0, 0.2627451, 1,
1.639334, -1.218631, 1.991893, 1, 0, 0.2588235, 1,
1.649959, 0.3901836, 2.133357, 1, 0, 0.2509804, 1,
1.659182, 0.4987688, -0.5291631, 1, 0, 0.2470588, 1,
1.670982, 0.5677336, -0.3723866, 1, 0, 0.2392157, 1,
1.692173, 0.3126104, 2.598553, 1, 0, 0.2352941, 1,
1.705391, -1.791881, 2.615556, 1, 0, 0.227451, 1,
1.709359, -1.310752, 3.722044, 1, 0, 0.2235294, 1,
1.730906, 0.8795745, 0.5172371, 1, 0, 0.2156863, 1,
1.735705, 0.2952975, 0.1501411, 1, 0, 0.2117647, 1,
1.780184, -1.844898, 3.181656, 1, 0, 0.2039216, 1,
1.78295, 0.9580085, 1.046439, 1, 0, 0.1960784, 1,
1.794441, -0.5595518, 1.831701, 1, 0, 0.1921569, 1,
1.801503, 0.5704918, 0.2073647, 1, 0, 0.1843137, 1,
1.81136, -0.4668933, 2.23019, 1, 0, 0.1803922, 1,
1.830896, 0.3196943, 1.595068, 1, 0, 0.172549, 1,
1.849923, -0.3134981, 0.8744462, 1, 0, 0.1686275, 1,
1.903397, 0.47054, 2.27897, 1, 0, 0.1607843, 1,
1.950957, 0.0361076, 1.495535, 1, 0, 0.1568628, 1,
1.973967, -1.032807, 2.69582, 1, 0, 0.1490196, 1,
1.981419, 1.340911, 1.201953, 1, 0, 0.145098, 1,
1.990184, -0.3110752, 0.292261, 1, 0, 0.1372549, 1,
2.002279, 0.5843314, 1.254785, 1, 0, 0.1333333, 1,
2.006548, -1.103181, 2.662093, 1, 0, 0.1254902, 1,
2.024079, -0.02036086, 1.107086, 1, 0, 0.1215686, 1,
2.035985, 1.058309, 2.243385, 1, 0, 0.1137255, 1,
2.042315, 0.1037885, -0.5131324, 1, 0, 0.1098039, 1,
2.051567, 0.3340487, 2.231093, 1, 0, 0.1019608, 1,
2.052643, 0.6784758, 0.1102871, 1, 0, 0.09411765, 1,
2.075349, 0.7774054, 2.163707, 1, 0, 0.09019608, 1,
2.177416, -0.6759328, 2.509394, 1, 0, 0.08235294, 1,
2.325448, 0.4413536, 0.006814536, 1, 0, 0.07843138, 1,
2.33608, 0.2974197, 1.671565, 1, 0, 0.07058824, 1,
2.340282, 2.068551, 1.086946, 1, 0, 0.06666667, 1,
2.347954, 1.191387, 1.378935, 1, 0, 0.05882353, 1,
2.349674, -0.258247, 0.364181, 1, 0, 0.05490196, 1,
2.410206, -0.3360001, 2.543642, 1, 0, 0.04705882, 1,
2.435841, -0.2277192, 2.465436, 1, 0, 0.04313726, 1,
2.471705, 0.7299187, 1.525702, 1, 0, 0.03529412, 1,
2.538083, -0.6421086, 2.658042, 1, 0, 0.03137255, 1,
2.576051, -1.031189, 3.172429, 1, 0, 0.02352941, 1,
2.584831, 0.4885609, 2.454021, 1, 0, 0.01960784, 1,
2.597923, 1.289988, 1.878282, 1, 0, 0.01176471, 1,
3.013625, 0.02630964, 2.403291, 1, 0, 0.007843138, 1
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
-0.07346535, -4.577069, -8.148444, 0, -0.5, 0.5, 0.5,
-0.07346535, -4.577069, -8.148444, 1, -0.5, 0.5, 0.5,
-0.07346535, -4.577069, -8.148444, 1, 1.5, 0.5, 0.5,
-0.07346535, -4.577069, -8.148444, 0, 1.5, 0.5, 0.5
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
-4.207079, -0.2223291, -8.148444, 0, -0.5, 0.5, 0.5,
-4.207079, -0.2223291, -8.148444, 1, -0.5, 0.5, 0.5,
-4.207079, -0.2223291, -8.148444, 1, 1.5, 0.5, 0.5,
-4.207079, -0.2223291, -8.148444, 0, 1.5, 0.5, 0.5
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
-4.207079, -4.577069, -0.4924495, 0, -0.5, 0.5, 0.5,
-4.207079, -4.577069, -0.4924495, 1, -0.5, 0.5, 0.5,
-4.207079, -4.577069, -0.4924495, 1, 1.5, 0.5, 0.5,
-4.207079, -4.577069, -0.4924495, 0, 1.5, 0.5, 0.5
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
-3, -3.572129, -6.381676,
3, -3.572129, -6.381676,
-3, -3.572129, -6.381676,
-3, -3.739619, -6.676137,
-2, -3.572129, -6.381676,
-2, -3.739619, -6.676137,
-1, -3.572129, -6.381676,
-1, -3.739619, -6.676137,
0, -3.572129, -6.381676,
0, -3.739619, -6.676137,
1, -3.572129, -6.381676,
1, -3.739619, -6.676137,
2, -3.572129, -6.381676,
2, -3.739619, -6.676137,
3, -3.572129, -6.381676,
3, -3.739619, -6.676137
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
-3, -4.074599, -7.26506, 0, -0.5, 0.5, 0.5,
-3, -4.074599, -7.26506, 1, -0.5, 0.5, 0.5,
-3, -4.074599, -7.26506, 1, 1.5, 0.5, 0.5,
-3, -4.074599, -7.26506, 0, 1.5, 0.5, 0.5,
-2, -4.074599, -7.26506, 0, -0.5, 0.5, 0.5,
-2, -4.074599, -7.26506, 1, -0.5, 0.5, 0.5,
-2, -4.074599, -7.26506, 1, 1.5, 0.5, 0.5,
-2, -4.074599, -7.26506, 0, 1.5, 0.5, 0.5,
-1, -4.074599, -7.26506, 0, -0.5, 0.5, 0.5,
-1, -4.074599, -7.26506, 1, -0.5, 0.5, 0.5,
-1, -4.074599, -7.26506, 1, 1.5, 0.5, 0.5,
-1, -4.074599, -7.26506, 0, 1.5, 0.5, 0.5,
0, -4.074599, -7.26506, 0, -0.5, 0.5, 0.5,
0, -4.074599, -7.26506, 1, -0.5, 0.5, 0.5,
0, -4.074599, -7.26506, 1, 1.5, 0.5, 0.5,
0, -4.074599, -7.26506, 0, 1.5, 0.5, 0.5,
1, -4.074599, -7.26506, 0, -0.5, 0.5, 0.5,
1, -4.074599, -7.26506, 1, -0.5, 0.5, 0.5,
1, -4.074599, -7.26506, 1, 1.5, 0.5, 0.5,
1, -4.074599, -7.26506, 0, 1.5, 0.5, 0.5,
2, -4.074599, -7.26506, 0, -0.5, 0.5, 0.5,
2, -4.074599, -7.26506, 1, -0.5, 0.5, 0.5,
2, -4.074599, -7.26506, 1, 1.5, 0.5, 0.5,
2, -4.074599, -7.26506, 0, 1.5, 0.5, 0.5,
3, -4.074599, -7.26506, 0, -0.5, 0.5, 0.5,
3, -4.074599, -7.26506, 1, -0.5, 0.5, 0.5,
3, -4.074599, -7.26506, 1, 1.5, 0.5, 0.5,
3, -4.074599, -7.26506, 0, 1.5, 0.5, 0.5
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
-3.253168, -3, -6.381676,
-3.253168, 3, -6.381676,
-3.253168, -3, -6.381676,
-3.412153, -3, -6.676137,
-3.253168, -2, -6.381676,
-3.412153, -2, -6.676137,
-3.253168, -1, -6.381676,
-3.412153, -1, -6.676137,
-3.253168, 0, -6.381676,
-3.412153, 0, -6.676137,
-3.253168, 1, -6.381676,
-3.412153, 1, -6.676137,
-3.253168, 2, -6.381676,
-3.412153, 2, -6.676137,
-3.253168, 3, -6.381676,
-3.412153, 3, -6.676137
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
-3.730124, -3, -7.26506, 0, -0.5, 0.5, 0.5,
-3.730124, -3, -7.26506, 1, -0.5, 0.5, 0.5,
-3.730124, -3, -7.26506, 1, 1.5, 0.5, 0.5,
-3.730124, -3, -7.26506, 0, 1.5, 0.5, 0.5,
-3.730124, -2, -7.26506, 0, -0.5, 0.5, 0.5,
-3.730124, -2, -7.26506, 1, -0.5, 0.5, 0.5,
-3.730124, -2, -7.26506, 1, 1.5, 0.5, 0.5,
-3.730124, -2, -7.26506, 0, 1.5, 0.5, 0.5,
-3.730124, -1, -7.26506, 0, -0.5, 0.5, 0.5,
-3.730124, -1, -7.26506, 1, -0.5, 0.5, 0.5,
-3.730124, -1, -7.26506, 1, 1.5, 0.5, 0.5,
-3.730124, -1, -7.26506, 0, 1.5, 0.5, 0.5,
-3.730124, 0, -7.26506, 0, -0.5, 0.5, 0.5,
-3.730124, 0, -7.26506, 1, -0.5, 0.5, 0.5,
-3.730124, 0, -7.26506, 1, 1.5, 0.5, 0.5,
-3.730124, 0, -7.26506, 0, 1.5, 0.5, 0.5,
-3.730124, 1, -7.26506, 0, -0.5, 0.5, 0.5,
-3.730124, 1, -7.26506, 1, -0.5, 0.5, 0.5,
-3.730124, 1, -7.26506, 1, 1.5, 0.5, 0.5,
-3.730124, 1, -7.26506, 0, 1.5, 0.5, 0.5,
-3.730124, 2, -7.26506, 0, -0.5, 0.5, 0.5,
-3.730124, 2, -7.26506, 1, -0.5, 0.5, 0.5,
-3.730124, 2, -7.26506, 1, 1.5, 0.5, 0.5,
-3.730124, 2, -7.26506, 0, 1.5, 0.5, 0.5,
-3.730124, 3, -7.26506, 0, -0.5, 0.5, 0.5,
-3.730124, 3, -7.26506, 1, -0.5, 0.5, 0.5,
-3.730124, 3, -7.26506, 1, 1.5, 0.5, 0.5,
-3.730124, 3, -7.26506, 0, 1.5, 0.5, 0.5
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
-3.253168, -3.572129, -6,
-3.253168, -3.572129, 4,
-3.253168, -3.572129, -6,
-3.412153, -3.739619, -6,
-3.253168, -3.572129, -4,
-3.412153, -3.739619, -4,
-3.253168, -3.572129, -2,
-3.412153, -3.739619, -2,
-3.253168, -3.572129, 0,
-3.412153, -3.739619, 0,
-3.253168, -3.572129, 2,
-3.412153, -3.739619, 2,
-3.253168, -3.572129, 4,
-3.412153, -3.739619, 4
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
-3.730124, -4.074599, -6, 0, -0.5, 0.5, 0.5,
-3.730124, -4.074599, -6, 1, -0.5, 0.5, 0.5,
-3.730124, -4.074599, -6, 1, 1.5, 0.5, 0.5,
-3.730124, -4.074599, -6, 0, 1.5, 0.5, 0.5,
-3.730124, -4.074599, -4, 0, -0.5, 0.5, 0.5,
-3.730124, -4.074599, -4, 1, -0.5, 0.5, 0.5,
-3.730124, -4.074599, -4, 1, 1.5, 0.5, 0.5,
-3.730124, -4.074599, -4, 0, 1.5, 0.5, 0.5,
-3.730124, -4.074599, -2, 0, -0.5, 0.5, 0.5,
-3.730124, -4.074599, -2, 1, -0.5, 0.5, 0.5,
-3.730124, -4.074599, -2, 1, 1.5, 0.5, 0.5,
-3.730124, -4.074599, -2, 0, 1.5, 0.5, 0.5,
-3.730124, -4.074599, 0, 0, -0.5, 0.5, 0.5,
-3.730124, -4.074599, 0, 1, -0.5, 0.5, 0.5,
-3.730124, -4.074599, 0, 1, 1.5, 0.5, 0.5,
-3.730124, -4.074599, 0, 0, 1.5, 0.5, 0.5,
-3.730124, -4.074599, 2, 0, -0.5, 0.5, 0.5,
-3.730124, -4.074599, 2, 1, -0.5, 0.5, 0.5,
-3.730124, -4.074599, 2, 1, 1.5, 0.5, 0.5,
-3.730124, -4.074599, 2, 0, 1.5, 0.5, 0.5,
-3.730124, -4.074599, 4, 0, -0.5, 0.5, 0.5,
-3.730124, -4.074599, 4, 1, -0.5, 0.5, 0.5,
-3.730124, -4.074599, 4, 1, 1.5, 0.5, 0.5,
-3.730124, -4.074599, 4, 0, 1.5, 0.5, 0.5
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
-3.253168, -3.572129, -6.381676,
-3.253168, 3.127471, -6.381676,
-3.253168, -3.572129, 5.396777,
-3.253168, 3.127471, 5.396777,
-3.253168, -3.572129, -6.381676,
-3.253168, -3.572129, 5.396777,
-3.253168, 3.127471, -6.381676,
-3.253168, 3.127471, 5.396777,
-3.253168, -3.572129, -6.381676,
3.106238, -3.572129, -6.381676,
-3.253168, -3.572129, 5.396777,
3.106238, -3.572129, 5.396777,
-3.253168, 3.127471, -6.381676,
3.106238, 3.127471, -6.381676,
-3.253168, 3.127471, 5.396777,
3.106238, 3.127471, 5.396777,
3.106238, -3.572129, -6.381676,
3.106238, 3.127471, -6.381676,
3.106238, -3.572129, 5.396777,
3.106238, 3.127471, 5.396777,
3.106238, -3.572129, -6.381676,
3.106238, -3.572129, 5.396777,
3.106238, 3.127471, -6.381676,
3.106238, 3.127471, 5.396777
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
var radius = 7.992936;
var distance = 35.56147;
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
mvMatrix.translate( 0.07346535, 0.2223291, 0.4924495 );
mvMatrix.scale( 1.358951, 1.289945, 0.7337227 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.56147);
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


