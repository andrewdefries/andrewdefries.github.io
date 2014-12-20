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
-2.774493, 0.405748, -0.4045631, 1, 0, 0, 1,
-2.602592, 1.330639, 0.145838, 1, 0.007843138, 0, 1,
-2.591903, -1.721078, -2.354913, 1, 0.01176471, 0, 1,
-2.534381, -0.1550016, -1.278388, 1, 0.01960784, 0, 1,
-2.507403, 0.2979226, -0.273894, 1, 0.02352941, 0, 1,
-2.4402, -1.248797, -2.147259, 1, 0.03137255, 0, 1,
-2.394387, 1.341371, -1.583954, 1, 0.03529412, 0, 1,
-2.361127, -0.6124895, -0.3040234, 1, 0.04313726, 0, 1,
-2.341796, 1.288632, -0.3913567, 1, 0.04705882, 0, 1,
-2.332602, 1.470844, -0.3307028, 1, 0.05490196, 0, 1,
-2.263948, 1.290893, -1.162091, 1, 0.05882353, 0, 1,
-2.24759, -0.1110064, -0.8939595, 1, 0.06666667, 0, 1,
-2.239175, -0.6060415, -0.6085758, 1, 0.07058824, 0, 1,
-2.225992, 0.6409354, -2.519851, 1, 0.07843138, 0, 1,
-2.175364, -0.2496799, -0.4853436, 1, 0.08235294, 0, 1,
-2.129581, 1.039114, -0.7534914, 1, 0.09019608, 0, 1,
-2.113624, 0.6419489, 0.05456831, 1, 0.09411765, 0, 1,
-2.0982, 0.2993535, -2.138027, 1, 0.1019608, 0, 1,
-2.087793, -0.4357285, -2.778786, 1, 0.1098039, 0, 1,
-2.07773, -0.1891749, -1.358755, 1, 0.1137255, 0, 1,
-2.053969, 0.1761455, -0.379234, 1, 0.1215686, 0, 1,
-2.031914, 1.035658, -1.148374, 1, 0.1254902, 0, 1,
-2.006177, 0.5158812, -1.539208, 1, 0.1333333, 0, 1,
-1.962891, 1.038543, -1.567662, 1, 0.1372549, 0, 1,
-1.958261, -0.5451671, -1.61217, 1, 0.145098, 0, 1,
-1.929852, -1.162779, -0.8318721, 1, 0.1490196, 0, 1,
-1.908777, -2.016287, -3.106124, 1, 0.1568628, 0, 1,
-1.891955, -0.1208722, -2.566229, 1, 0.1607843, 0, 1,
-1.872301, 0.3887836, 0.2535238, 1, 0.1686275, 0, 1,
-1.867625, 0.2347991, -1.444781, 1, 0.172549, 0, 1,
-1.843305, 1.605776, -0.06608304, 1, 0.1803922, 0, 1,
-1.842818, -0.3233538, -2.752609, 1, 0.1843137, 0, 1,
-1.831463, -0.1124226, -0.4810792, 1, 0.1921569, 0, 1,
-1.827944, -0.649921, -0.6960651, 1, 0.1960784, 0, 1,
-1.804582, 1.101753, -0.2551881, 1, 0.2039216, 0, 1,
-1.787811, -0.2248828, -2.012483, 1, 0.2117647, 0, 1,
-1.787507, -0.5390739, -1.027272, 1, 0.2156863, 0, 1,
-1.784071, -0.8475838, -1.319773, 1, 0.2235294, 0, 1,
-1.752427, -0.7475401, -3.431245, 1, 0.227451, 0, 1,
-1.737554, 0.5125369, -0.4154734, 1, 0.2352941, 0, 1,
-1.730955, 0.4086507, -1.610353, 1, 0.2392157, 0, 1,
-1.707832, -1.301553, -4.81538, 1, 0.2470588, 0, 1,
-1.671974, -1.373266, -0.7653059, 1, 0.2509804, 0, 1,
-1.668934, -0.1794819, -1.489582, 1, 0.2588235, 0, 1,
-1.657003, -0.5881621, -2.459013, 1, 0.2627451, 0, 1,
-1.652443, 0.2356142, -1.668367, 1, 0.2705882, 0, 1,
-1.649138, 1.02178, -1.439122, 1, 0.2745098, 0, 1,
-1.629714, -1.271135, -1.386615, 1, 0.282353, 0, 1,
-1.61076, 0.9278509, -1.674564, 1, 0.2862745, 0, 1,
-1.600765, -0.01618581, -1.739653, 1, 0.2941177, 0, 1,
-1.596899, 1.333921, 0.741132, 1, 0.3019608, 0, 1,
-1.596524, 0.5740017, -1.363217, 1, 0.3058824, 0, 1,
-1.578928, 0.07312918, -3.125386, 1, 0.3137255, 0, 1,
-1.576052, 0.1769545, -1.921461, 1, 0.3176471, 0, 1,
-1.569316, 0.8480466, -0.9136463, 1, 0.3254902, 0, 1,
-1.567224, -0.4080677, -2.532225, 1, 0.3294118, 0, 1,
-1.559774, -0.2618628, -1.769422, 1, 0.3372549, 0, 1,
-1.549764, -0.1453432, -1.989808, 1, 0.3411765, 0, 1,
-1.547668, 0.3313621, -0.9109222, 1, 0.3490196, 0, 1,
-1.539126, -0.06578361, -1.041593, 1, 0.3529412, 0, 1,
-1.530626, 0.05014199, -0.7592012, 1, 0.3607843, 0, 1,
-1.528091, 0.4371004, -0.2271912, 1, 0.3647059, 0, 1,
-1.523303, 0.7515365, -1.201402, 1, 0.372549, 0, 1,
-1.484601, -0.2938891, -2.390987, 1, 0.3764706, 0, 1,
-1.483794, 0.4621239, -1.505831, 1, 0.3843137, 0, 1,
-1.465414, -0.2966568, -1.695162, 1, 0.3882353, 0, 1,
-1.464106, -0.1939344, -0.02306026, 1, 0.3960784, 0, 1,
-1.462048, -1.613846, -2.543816, 1, 0.4039216, 0, 1,
-1.455641, -0.6583769, -2.324004, 1, 0.4078431, 0, 1,
-1.445035, -1.14618, -2.803535, 1, 0.4156863, 0, 1,
-1.435696, 1.145648, -1.458867, 1, 0.4196078, 0, 1,
-1.421681, -1.220596, -2.275935, 1, 0.427451, 0, 1,
-1.420603, 0.2808291, -1.081651, 1, 0.4313726, 0, 1,
-1.384883, -0.2914801, -1.585831, 1, 0.4392157, 0, 1,
-1.367457, -1.07372, -2.059681, 1, 0.4431373, 0, 1,
-1.36691, -1.095664, -2.75907, 1, 0.4509804, 0, 1,
-1.355501, -0.3807992, -1.788539, 1, 0.454902, 0, 1,
-1.34644, 1.447825, -0.807285, 1, 0.4627451, 0, 1,
-1.335169, 2.69159, -1.531909, 1, 0.4666667, 0, 1,
-1.326846, 0.3262354, -0.7991104, 1, 0.4745098, 0, 1,
-1.316746, -0.7074441, -1.250621, 1, 0.4784314, 0, 1,
-1.316489, -0.8407894, -2.996698, 1, 0.4862745, 0, 1,
-1.315655, 0.3239354, -0.414221, 1, 0.4901961, 0, 1,
-1.312249, -0.320793, -2.260839, 1, 0.4980392, 0, 1,
-1.311942, -0.8427529, -1.799921, 1, 0.5058824, 0, 1,
-1.309828, -0.693813, -1.01124, 1, 0.509804, 0, 1,
-1.30074, 1.182509, 0.6172649, 1, 0.5176471, 0, 1,
-1.300051, -0.546236, -3.280568, 1, 0.5215687, 0, 1,
-1.296721, -0.08626507, 0.09999578, 1, 0.5294118, 0, 1,
-1.29539, 0.3947636, -2.61679, 1, 0.5333334, 0, 1,
-1.292991, -0.6403732, -3.516937, 1, 0.5411765, 0, 1,
-1.283338, -1.962356, -1.517013, 1, 0.5450981, 0, 1,
-1.282399, -0.2106927, -1.115038, 1, 0.5529412, 0, 1,
-1.278966, 1.386277, -3.116639, 1, 0.5568628, 0, 1,
-1.264158, 1.410631, 1.110584, 1, 0.5647059, 0, 1,
-1.253004, -1.693289, -1.231556, 1, 0.5686275, 0, 1,
-1.252228, -0.1271665, -2.104312, 1, 0.5764706, 0, 1,
-1.248352, 1.544443, -1.762516, 1, 0.5803922, 0, 1,
-1.246397, 1.188514, -1.250743, 1, 0.5882353, 0, 1,
-1.245302, 0.2710654, -1.326929, 1, 0.5921569, 0, 1,
-1.236922, -1.065345, -0.435759, 1, 0.6, 0, 1,
-1.236869, -0.5334461, -2.332657, 1, 0.6078432, 0, 1,
-1.226135, -1.429876, -1.380096, 1, 0.6117647, 0, 1,
-1.225582, -0.6683682, -0.7613835, 1, 0.6196079, 0, 1,
-1.212113, -0.5816458, -2.852623, 1, 0.6235294, 0, 1,
-1.196149, -1.32913, -3.391004, 1, 0.6313726, 0, 1,
-1.195245, -1.602014, -2.928496, 1, 0.6352941, 0, 1,
-1.1926, -0.1399757, -2.515896, 1, 0.6431373, 0, 1,
-1.191979, 0.5076733, 0.5581818, 1, 0.6470588, 0, 1,
-1.188691, 0.8309983, -1.154949, 1, 0.654902, 0, 1,
-1.186322, -0.4800738, -2.420489, 1, 0.6588235, 0, 1,
-1.170974, 2.103042, -0.492025, 1, 0.6666667, 0, 1,
-1.169286, 1.154173, 0.002008147, 1, 0.6705883, 0, 1,
-1.167389, -0.8523127, -3.273999, 1, 0.6784314, 0, 1,
-1.16047, -0.351991, -1.292351, 1, 0.682353, 0, 1,
-1.15264, -0.02765302, -0.6750187, 1, 0.6901961, 0, 1,
-1.147811, -0.5804141, -2.219264, 1, 0.6941177, 0, 1,
-1.137336, -1.61426, -2.485725, 1, 0.7019608, 0, 1,
-1.135414, -0.1003551, -1.391864, 1, 0.7098039, 0, 1,
-1.133049, 0.3572045, -2.144675, 1, 0.7137255, 0, 1,
-1.124122, 0.9395591, -1.526076, 1, 0.7215686, 0, 1,
-1.123376, 0.4808066, -2.142278, 1, 0.7254902, 0, 1,
-1.121963, -3.432642, -2.261767, 1, 0.7333333, 0, 1,
-1.118737, -0.2994689, -2.42208, 1, 0.7372549, 0, 1,
-1.113231, -0.4678105, -3.684652, 1, 0.7450981, 0, 1,
-1.112867, 0.6008491, -1.557725, 1, 0.7490196, 0, 1,
-1.11107, 0.9548234, -1.392083, 1, 0.7568628, 0, 1,
-1.105038, 0.537518, -1.409413, 1, 0.7607843, 0, 1,
-1.089653, 1.001177, -0.8333347, 1, 0.7686275, 0, 1,
-1.088068, 0.7368336, -0.6323351, 1, 0.772549, 0, 1,
-1.077036, 0.08341704, -2.487668, 1, 0.7803922, 0, 1,
-1.076154, -0.346409, -2.867537, 1, 0.7843137, 0, 1,
-1.073248, 0.8661518, -0.1675117, 1, 0.7921569, 0, 1,
-1.073149, -0.7699137, -3.226626, 1, 0.7960784, 0, 1,
-1.059864, -0.6998079, -2.236081, 1, 0.8039216, 0, 1,
-1.058474, -1.23759, -2.333089, 1, 0.8117647, 0, 1,
-1.056211, 0.7017616, -1.263564, 1, 0.8156863, 0, 1,
-1.050545, -1.478014, -1.591938, 1, 0.8235294, 0, 1,
-1.049316, 2.364559, -1.717627, 1, 0.827451, 0, 1,
-1.04392, 1.358266, -0.3583492, 1, 0.8352941, 0, 1,
-1.040221, -1.131522, -2.908814, 1, 0.8392157, 0, 1,
-1.034877, 0.01235181, -0.6592599, 1, 0.8470588, 0, 1,
-1.029253, -1.219524, -3.023488, 1, 0.8509804, 0, 1,
-1.022878, 0.03929016, -2.459188, 1, 0.8588235, 0, 1,
-1.005226, -0.660025, -1.736431, 1, 0.8627451, 0, 1,
-1.003498, 1.797142, -1.456337, 1, 0.8705882, 0, 1,
-0.9932478, -0.5768965, -2.430367, 1, 0.8745098, 0, 1,
-0.9907157, 1.231598, -0.1342129, 1, 0.8823529, 0, 1,
-0.9890319, 1.01235, 0.7332007, 1, 0.8862745, 0, 1,
-0.9884163, -1.014588, -2.338917, 1, 0.8941177, 0, 1,
-0.9838084, 0.006308401, -2.060165, 1, 0.8980392, 0, 1,
-0.9836394, -0.07494773, -1.49149, 1, 0.9058824, 0, 1,
-0.9809477, 0.9200031, -0.9088599, 1, 0.9137255, 0, 1,
-0.9773404, 0.354653, -1.42859, 1, 0.9176471, 0, 1,
-0.9761984, -0.5593638, -2.037052, 1, 0.9254902, 0, 1,
-0.9723526, -0.2154826, -1.030226, 1, 0.9294118, 0, 1,
-0.9678274, -1.027664, -1.345003, 1, 0.9372549, 0, 1,
-0.9669276, 1.120579, -0.0192638, 1, 0.9411765, 0, 1,
-0.96207, 1.433558, 1.274606, 1, 0.9490196, 0, 1,
-0.9605485, 1.016993, -0.5342442, 1, 0.9529412, 0, 1,
-0.9587657, 2.207085, -3.093906, 1, 0.9607843, 0, 1,
-0.9553171, 0.2943985, -0.8676652, 1, 0.9647059, 0, 1,
-0.9478037, 0.07170505, -1.455794, 1, 0.972549, 0, 1,
-0.9445691, 1.158225, -1.179265, 1, 0.9764706, 0, 1,
-0.942111, -0.3289279, -3.720773, 1, 0.9843137, 0, 1,
-0.9335099, 0.6608317, -0.1572771, 1, 0.9882353, 0, 1,
-0.9261681, -2.439299, -1.310578, 1, 0.9960784, 0, 1,
-0.9199615, 0.7118114, -1.824336, 0.9960784, 1, 0, 1,
-0.902227, -0.9835276, -1.594284, 0.9921569, 1, 0, 1,
-0.9022083, 1.793562, -0.6971214, 0.9843137, 1, 0, 1,
-0.9007911, -0.3363172, -1.112502, 0.9803922, 1, 0, 1,
-0.9005536, -0.1649198, -1.468184, 0.972549, 1, 0, 1,
-0.9001516, 0.255682, -1.37438, 0.9686275, 1, 0, 1,
-0.8988356, 0.0612838, -0.5995508, 0.9607843, 1, 0, 1,
-0.888864, 1.600684, -1.063396, 0.9568627, 1, 0, 1,
-0.8766506, 1.80273, -0.6234646, 0.9490196, 1, 0, 1,
-0.8750361, -0.0680703, -1.375482, 0.945098, 1, 0, 1,
-0.8704159, 0.3283831, -1.552518, 0.9372549, 1, 0, 1,
-0.8652017, -0.05047332, -1.751602, 0.9333333, 1, 0, 1,
-0.8598295, -1.529172, -1.576507, 0.9254902, 1, 0, 1,
-0.859227, 0.8693293, 0.0586449, 0.9215686, 1, 0, 1,
-0.8557671, 0.1481147, -0.58573, 0.9137255, 1, 0, 1,
-0.8553609, 0.2443323, -1.586702, 0.9098039, 1, 0, 1,
-0.8509139, 1.416091, 0.5366651, 0.9019608, 1, 0, 1,
-0.848933, 0.1904215, -0.5054752, 0.8941177, 1, 0, 1,
-0.8487512, -0.4566712, -3.325963, 0.8901961, 1, 0, 1,
-0.8465864, 0.8497195, -0.4791006, 0.8823529, 1, 0, 1,
-0.8422304, 0.3034489, -0.9847608, 0.8784314, 1, 0, 1,
-0.8355125, -0.2723579, -0.7034919, 0.8705882, 1, 0, 1,
-0.8341011, -1.672914, -2.459868, 0.8666667, 1, 0, 1,
-0.8304296, 1.406036, -0.2780106, 0.8588235, 1, 0, 1,
-0.8290657, 0.2440996, -1.962293, 0.854902, 1, 0, 1,
-0.8269738, 0.1419898, -0.8018669, 0.8470588, 1, 0, 1,
-0.8261377, 0.9770518, -2.399168, 0.8431373, 1, 0, 1,
-0.8255678, -0.6927221, -1.426946, 0.8352941, 1, 0, 1,
-0.8218313, -0.2870871, -2.353048, 0.8313726, 1, 0, 1,
-0.8120946, -0.04505697, -1.319307, 0.8235294, 1, 0, 1,
-0.8056031, -1.311676, -3.603449, 0.8196079, 1, 0, 1,
-0.8025181, -1.201935, -2.579894, 0.8117647, 1, 0, 1,
-0.793369, -1.233744, -1.71086, 0.8078431, 1, 0, 1,
-0.7929226, -1.529966, -2.681495, 0.8, 1, 0, 1,
-0.7752512, 0.5844561, -1.868456, 0.7921569, 1, 0, 1,
-0.7744273, 1.005986, -1.717191, 0.7882353, 1, 0, 1,
-0.7736079, -1.179791, -2.748546, 0.7803922, 1, 0, 1,
-0.7697632, 0.177871, -1.32867, 0.7764706, 1, 0, 1,
-0.7679361, -1.149726, -2.99955, 0.7686275, 1, 0, 1,
-0.7669851, 0.02965734, -1.821572, 0.7647059, 1, 0, 1,
-0.7628111, 0.4568211, -1.083137, 0.7568628, 1, 0, 1,
-0.7591096, -1.367888, -1.826887, 0.7529412, 1, 0, 1,
-0.7587577, -1.554813, -4.478586, 0.7450981, 1, 0, 1,
-0.7569945, 0.08582707, -1.743803, 0.7411765, 1, 0, 1,
-0.7476979, 1.135927, -0.5990981, 0.7333333, 1, 0, 1,
-0.7439198, 0.1397801, -2.150957, 0.7294118, 1, 0, 1,
-0.736255, 0.1906254, -1.86733, 0.7215686, 1, 0, 1,
-0.7352194, -0.0804121, -0.09184746, 0.7176471, 1, 0, 1,
-0.7333947, -0.1812144, -2.316567, 0.7098039, 1, 0, 1,
-0.7320892, -1.636415, -1.166543, 0.7058824, 1, 0, 1,
-0.7293208, 0.9574832, -1.659831, 0.6980392, 1, 0, 1,
-0.7254304, 0.03026241, -2.501209, 0.6901961, 1, 0, 1,
-0.7243093, -0.4097983, -4.089974, 0.6862745, 1, 0, 1,
-0.7198101, 0.004888113, -1.525286, 0.6784314, 1, 0, 1,
-0.7178646, -0.5793688, -2.940911, 0.6745098, 1, 0, 1,
-0.7120818, -0.4749875, -0.46461, 0.6666667, 1, 0, 1,
-0.7094767, -0.3888274, -2.596869, 0.6627451, 1, 0, 1,
-0.7091201, -1.137773, -2.313296, 0.654902, 1, 0, 1,
-0.7058697, 0.6558999, -1.505088, 0.6509804, 1, 0, 1,
-0.7039086, 0.2259234, -2.636097, 0.6431373, 1, 0, 1,
-0.7011586, 1.250318, 0.9199474, 0.6392157, 1, 0, 1,
-0.6991524, -0.2105995, -3.193037, 0.6313726, 1, 0, 1,
-0.6932382, -1.053499, -3.104603, 0.627451, 1, 0, 1,
-0.6928871, 0.1067695, 0.384674, 0.6196079, 1, 0, 1,
-0.6901268, 0.5452077, 0.9036977, 0.6156863, 1, 0, 1,
-0.6837265, -1.032727, -2.590438, 0.6078432, 1, 0, 1,
-0.6817633, 0.1506791, -1.590934, 0.6039216, 1, 0, 1,
-0.6731822, 0.04395672, 0.5344463, 0.5960785, 1, 0, 1,
-0.6731737, 1.029869, -0.5740924, 0.5882353, 1, 0, 1,
-0.6704072, -0.551141, -3.380019, 0.5843138, 1, 0, 1,
-0.666505, 0.07861497, -3.256893, 0.5764706, 1, 0, 1,
-0.6664052, 0.4793886, -1.145999, 0.572549, 1, 0, 1,
-0.6651014, 0.006783923, -2.445181, 0.5647059, 1, 0, 1,
-0.6608329, -0.03748932, -1.83895, 0.5607843, 1, 0, 1,
-0.6601344, 0.4779166, -1.595016, 0.5529412, 1, 0, 1,
-0.6582197, 1.3722, -1.690264, 0.5490196, 1, 0, 1,
-0.653289, 1.482157, 0.1102381, 0.5411765, 1, 0, 1,
-0.6523896, 0.2448961, -1.509649, 0.5372549, 1, 0, 1,
-0.6493962, 0.6468277, -0.4422422, 0.5294118, 1, 0, 1,
-0.6489366, -0.8498561, -3.074006, 0.5254902, 1, 0, 1,
-0.6471025, 1.102276, -0.3120641, 0.5176471, 1, 0, 1,
-0.6447183, 0.1202847, -0.9219192, 0.5137255, 1, 0, 1,
-0.6424062, 0.2253035, -1.879735, 0.5058824, 1, 0, 1,
-0.6404279, 0.4607026, -1.049413, 0.5019608, 1, 0, 1,
-0.6395718, -1.073333, -1.571852, 0.4941176, 1, 0, 1,
-0.6384929, 1.070429, 0.4852349, 0.4862745, 1, 0, 1,
-0.6369129, -0.6121358, -2.781429, 0.4823529, 1, 0, 1,
-0.6353311, -0.5571957, -1.572974, 0.4745098, 1, 0, 1,
-0.6328349, 2.598804, -0.2895407, 0.4705882, 1, 0, 1,
-0.6306231, -1.183419, -1.097974, 0.4627451, 1, 0, 1,
-0.6244159, 0.5052315, -2.381481, 0.4588235, 1, 0, 1,
-0.6134419, 0.6976871, -2.015379, 0.4509804, 1, 0, 1,
-0.6117456, 1.205919, 0.4546334, 0.4470588, 1, 0, 1,
-0.6084646, -0.3187269, -1.562302, 0.4392157, 1, 0, 1,
-0.6075109, 1.883919, -0.2797728, 0.4352941, 1, 0, 1,
-0.6004921, -0.6171132, -1.007428, 0.427451, 1, 0, 1,
-0.5989165, 0.7651852, -1.123043, 0.4235294, 1, 0, 1,
-0.5972062, -0.132814, -1.080993, 0.4156863, 1, 0, 1,
-0.5914671, -1.114879, -2.694051, 0.4117647, 1, 0, 1,
-0.5804688, 1.364248, -0.9769443, 0.4039216, 1, 0, 1,
-0.5785893, -0.4376169, -3.090588, 0.3960784, 1, 0, 1,
-0.5769144, -0.4457101, -1.9711, 0.3921569, 1, 0, 1,
-0.571813, -1.706208, -3.147095, 0.3843137, 1, 0, 1,
-0.5696115, 0.2894731, -1.995499, 0.3803922, 1, 0, 1,
-0.5672704, -0.5191403, -0.6427082, 0.372549, 1, 0, 1,
-0.5653596, -0.3979812, -1.943769, 0.3686275, 1, 0, 1,
-0.563575, -1.263048, -0.4605946, 0.3607843, 1, 0, 1,
-0.557671, 0.8917524, 1.025274, 0.3568628, 1, 0, 1,
-0.5553244, 0.3429081, -2.411571, 0.3490196, 1, 0, 1,
-0.5524685, 0.3458444, 1.094111, 0.345098, 1, 0, 1,
-0.5508468, 0.1204972, -1.252078, 0.3372549, 1, 0, 1,
-0.5496108, -0.9078376, -2.840226, 0.3333333, 1, 0, 1,
-0.5454599, -2.408088, -3.35075, 0.3254902, 1, 0, 1,
-0.5450473, -0.6591669, -2.534224, 0.3215686, 1, 0, 1,
-0.5436156, 1.105619, -2.898856, 0.3137255, 1, 0, 1,
-0.5415247, 0.1192611, -0.8499137, 0.3098039, 1, 0, 1,
-0.5386201, 0.2700961, -2.65031, 0.3019608, 1, 0, 1,
-0.5349901, 1.277078, 0.6585933, 0.2941177, 1, 0, 1,
-0.5346096, 1.410142, 0.5509844, 0.2901961, 1, 0, 1,
-0.5315633, -0.6197376, -4.179102, 0.282353, 1, 0, 1,
-0.5306953, -0.9888127, -2.209948, 0.2784314, 1, 0, 1,
-0.5297667, -0.57311, -2.872391, 0.2705882, 1, 0, 1,
-0.5235712, 0.1160493, -2.685723, 0.2666667, 1, 0, 1,
-0.5192575, -0.4232633, -2.986327, 0.2588235, 1, 0, 1,
-0.5148164, -0.4918201, -2.528866, 0.254902, 1, 0, 1,
-0.5130942, -0.01094063, -1.283413, 0.2470588, 1, 0, 1,
-0.5118646, -0.3266734, -1.760377, 0.2431373, 1, 0, 1,
-0.5111105, -0.8733184, -2.307469, 0.2352941, 1, 0, 1,
-0.505978, 0.6563433, -0.3788225, 0.2313726, 1, 0, 1,
-0.4999782, 0.521201, -0.2558074, 0.2235294, 1, 0, 1,
-0.499885, -1.35603, -1.633033, 0.2196078, 1, 0, 1,
-0.4992406, 1.443579, 0.2644923, 0.2117647, 1, 0, 1,
-0.4949408, -0.9698905, -3.298437, 0.2078431, 1, 0, 1,
-0.4942905, 0.01946056, -0.5227326, 0.2, 1, 0, 1,
-0.4917141, 0.08330318, -2.992897, 0.1921569, 1, 0, 1,
-0.486647, 0.4518232, -1.437982, 0.1882353, 1, 0, 1,
-0.4846339, -1.638668, -0.921441, 0.1803922, 1, 0, 1,
-0.4813595, 0.6443969, -0.3627227, 0.1764706, 1, 0, 1,
-0.4776498, 0.03916933, -3.900939, 0.1686275, 1, 0, 1,
-0.4770935, 0.3514434, -1.892104, 0.1647059, 1, 0, 1,
-0.4738609, 0.2941439, -1.041442, 0.1568628, 1, 0, 1,
-0.4731157, 1.472528, 0.6286455, 0.1529412, 1, 0, 1,
-0.4712818, -0.3109928, -1.523877, 0.145098, 1, 0, 1,
-0.4703108, -0.4271718, -2.315005, 0.1411765, 1, 0, 1,
-0.4673877, 0.1113826, 1.409233, 0.1333333, 1, 0, 1,
-0.4658259, 1.182174, -1.812813, 0.1294118, 1, 0, 1,
-0.4630479, 1.136761, -0.4749105, 0.1215686, 1, 0, 1,
-0.4627616, -0.0952919, -1.029742, 0.1176471, 1, 0, 1,
-0.4578144, -0.2029901, 0.5753878, 0.1098039, 1, 0, 1,
-0.456316, -1.201868, -0.1969006, 0.1058824, 1, 0, 1,
-0.4457589, 0.5605045, 0.03705493, 0.09803922, 1, 0, 1,
-0.444657, -0.5269799, -3.052801, 0.09019608, 1, 0, 1,
-0.4410962, 1.123602, -0.6866539, 0.08627451, 1, 0, 1,
-0.4399384, -0.5640225, -1.915751, 0.07843138, 1, 0, 1,
-0.4385085, 0.791144, -0.004648888, 0.07450981, 1, 0, 1,
-0.436645, -1.412309, -2.563648, 0.06666667, 1, 0, 1,
-0.43558, 0.3851156, -0.1545196, 0.0627451, 1, 0, 1,
-0.4343449, -0.3844452, -2.991114, 0.05490196, 1, 0, 1,
-0.4308331, -0.7000604, -2.086748, 0.05098039, 1, 0, 1,
-0.4303516, 0.8798141, -0.9424657, 0.04313726, 1, 0, 1,
-0.4236048, -1.259022, -4.106532, 0.03921569, 1, 0, 1,
-0.4189124, -1.254648, -2.491698, 0.03137255, 1, 0, 1,
-0.4143798, 1.069159, -1.363018, 0.02745098, 1, 0, 1,
-0.4133214, -0.885437, -3.524264, 0.01960784, 1, 0, 1,
-0.4108469, 1.538065, -0.8334424, 0.01568628, 1, 0, 1,
-0.4105774, 0.8005747, 0.770913, 0.007843138, 1, 0, 1,
-0.4099521, 2.02256, -1.03888, 0.003921569, 1, 0, 1,
-0.4088498, 1.060142, 1.073051, 0, 1, 0.003921569, 1,
-0.4070156, -0.331953, -4.242124, 0, 1, 0.01176471, 1,
-0.4050054, -0.5077931, -2.995024, 0, 1, 0.01568628, 1,
-0.4024964, 0.03993549, -1.042057, 0, 1, 0.02352941, 1,
-0.4004069, 0.01441354, -0.5183415, 0, 1, 0.02745098, 1,
-0.3956621, 1.209302, 0.475437, 0, 1, 0.03529412, 1,
-0.3950975, 0.2765387, -0.9372352, 0, 1, 0.03921569, 1,
-0.3943141, 0.1688129, -1.726961, 0, 1, 0.04705882, 1,
-0.3922701, -1.133071, -2.178547, 0, 1, 0.05098039, 1,
-0.3859768, 0.8283991, 0.9381672, 0, 1, 0.05882353, 1,
-0.3818798, -0.4450082, -4.909942, 0, 1, 0.0627451, 1,
-0.381261, -1.556312, -3.179631, 0, 1, 0.07058824, 1,
-0.3787426, -0.6889296, -3.506436, 0, 1, 0.07450981, 1,
-0.377675, -1.90159, -3.534616, 0, 1, 0.08235294, 1,
-0.3773402, 1.099527, -0.3917343, 0, 1, 0.08627451, 1,
-0.3732157, -1.432874, -2.098632, 0, 1, 0.09411765, 1,
-0.3667078, 0.9291729, -0.1885415, 0, 1, 0.1019608, 1,
-0.3663728, 0.3037411, -4.199316, 0, 1, 0.1058824, 1,
-0.3635755, -0.4180382, -3.206256, 0, 1, 0.1137255, 1,
-0.3581967, -1.229421, -3.712448, 0, 1, 0.1176471, 1,
-0.3574018, 0.6989208, 0.9068432, 0, 1, 0.1254902, 1,
-0.3563727, 0.7364849, -0.6475819, 0, 1, 0.1294118, 1,
-0.3562528, -0.05926459, -2.61139, 0, 1, 0.1372549, 1,
-0.3558834, 0.3526165, -0.5467042, 0, 1, 0.1411765, 1,
-0.3556855, 0.04521651, -1.841842, 0, 1, 0.1490196, 1,
-0.3548104, -0.3331117, -2.608035, 0, 1, 0.1529412, 1,
-0.3547506, 0.6308992, -0.9911075, 0, 1, 0.1607843, 1,
-0.3442877, 0.3706893, -1.165422, 0, 1, 0.1647059, 1,
-0.3370457, 0.5173244, 0.1094301, 0, 1, 0.172549, 1,
-0.3278269, -0.2050807, -1.828056, 0, 1, 0.1764706, 1,
-0.3249404, 0.05789443, -1.059247, 0, 1, 0.1843137, 1,
-0.3233414, -0.5130218, -2.314405, 0, 1, 0.1882353, 1,
-0.319345, -0.04657604, -2.044999, 0, 1, 0.1960784, 1,
-0.3162224, -0.1448018, -2.235787, 0, 1, 0.2039216, 1,
-0.3147214, -0.2872027, -1.183306, 0, 1, 0.2078431, 1,
-0.3131976, 1.676006, 2.56852, 0, 1, 0.2156863, 1,
-0.3115289, -0.2926339, -1.671503, 0, 1, 0.2196078, 1,
-0.3109604, 0.6114516, -1.566687, 0, 1, 0.227451, 1,
-0.3089814, -0.01739426, -3.383619, 0, 1, 0.2313726, 1,
-0.3086734, 1.255318, -0.7182643, 0, 1, 0.2392157, 1,
-0.3059545, 0.2539905, 0.04456, 0, 1, 0.2431373, 1,
-0.3050306, 1.38026, 1.297341, 0, 1, 0.2509804, 1,
-0.3040026, -0.7253247, -2.914395, 0, 1, 0.254902, 1,
-0.3039654, 1.535838, -1.69597, 0, 1, 0.2627451, 1,
-0.3010124, 2.341511, -0.7836373, 0, 1, 0.2666667, 1,
-0.2983591, 0.04075626, -0.6935731, 0, 1, 0.2745098, 1,
-0.2946405, -0.4301506, -4.179187, 0, 1, 0.2784314, 1,
-0.2920056, 0.09655403, 0.6677231, 0, 1, 0.2862745, 1,
-0.2917282, 0.5257623, 0.5524822, 0, 1, 0.2901961, 1,
-0.289836, 0.07761893, 1.54623, 0, 1, 0.2980392, 1,
-0.2841636, 0.5177619, -0.470212, 0, 1, 0.3058824, 1,
-0.2840996, 1.900389, -0.9729602, 0, 1, 0.3098039, 1,
-0.2827509, 0.10105, -1.886972, 0, 1, 0.3176471, 1,
-0.2814963, -0.23257, -3.423873, 0, 1, 0.3215686, 1,
-0.2811753, 0.577387, -0.06456933, 0, 1, 0.3294118, 1,
-0.2811741, 0.6400209, 0.8313528, 0, 1, 0.3333333, 1,
-0.2795885, -1.037134, -2.051626, 0, 1, 0.3411765, 1,
-0.2793459, 0.03704791, -2.551172, 0, 1, 0.345098, 1,
-0.2789203, -1.083668, -3.618831, 0, 1, 0.3529412, 1,
-0.2773766, -1.751588, -4.343599, 0, 1, 0.3568628, 1,
-0.2757484, 0.1297015, -2.353552, 0, 1, 0.3647059, 1,
-0.2745482, -0.8923734, -3.885859, 0, 1, 0.3686275, 1,
-0.2693643, -0.05985933, -1.965273, 0, 1, 0.3764706, 1,
-0.268233, 0.7679055, 0.9342091, 0, 1, 0.3803922, 1,
-0.267206, -1.072984, -0.4092861, 0, 1, 0.3882353, 1,
-0.2535693, -0.2881706, -2.23946, 0, 1, 0.3921569, 1,
-0.253063, -0.3480054, -1.719534, 0, 1, 0.4, 1,
-0.2521687, 0.4257078, -0.5460511, 0, 1, 0.4078431, 1,
-0.2495984, 0.5065656, -0.9504395, 0, 1, 0.4117647, 1,
-0.2463123, -0.2661633, -2.892759, 0, 1, 0.4196078, 1,
-0.2460962, -0.5332168, -3.106299, 0, 1, 0.4235294, 1,
-0.241572, 0.5751632, -0.1783742, 0, 1, 0.4313726, 1,
-0.240477, -0.2568095, -2.440716, 0, 1, 0.4352941, 1,
-0.2344865, 0.2556858, 1.047446, 0, 1, 0.4431373, 1,
-0.2321586, -0.6680441, -2.975299, 0, 1, 0.4470588, 1,
-0.2271899, 0.2954608, -1.610197, 0, 1, 0.454902, 1,
-0.2264399, 0.1179875, -0.5060297, 0, 1, 0.4588235, 1,
-0.2250382, -0.5078772, -3.545291, 0, 1, 0.4666667, 1,
-0.2224146, -1.784051, -3.563498, 0, 1, 0.4705882, 1,
-0.2159708, 0.9391264, 0.06489743, 0, 1, 0.4784314, 1,
-0.2126139, -0.5912381, -3.885433, 0, 1, 0.4823529, 1,
-0.2112922, -1.526052, -2.137295, 0, 1, 0.4901961, 1,
-0.2038566, -2.376961, -4.100467, 0, 1, 0.4941176, 1,
-0.2019903, 0.2539947, 0.02956763, 0, 1, 0.5019608, 1,
-0.194965, 1.326014, -0.5109766, 0, 1, 0.509804, 1,
-0.1915468, 1.1405, -0.6609314, 0, 1, 0.5137255, 1,
-0.1889476, 0.7068778, -1.460325, 0, 1, 0.5215687, 1,
-0.1880264, -1.746531, -3.548657, 0, 1, 0.5254902, 1,
-0.1879691, -0.9191931, -4.346806, 0, 1, 0.5333334, 1,
-0.1862375, 0.5385144, -2.353042, 0, 1, 0.5372549, 1,
-0.1825773, 0.003591217, -2.684405, 0, 1, 0.5450981, 1,
-0.1804546, -0.6517506, -2.695426, 0, 1, 0.5490196, 1,
-0.1765306, -0.4279625, -2.876569, 0, 1, 0.5568628, 1,
-0.1741488, 1.550501, 0.7924014, 0, 1, 0.5607843, 1,
-0.1699259, -0.05104252, -2.402168, 0, 1, 0.5686275, 1,
-0.1674429, 0.8187366, -0.1253514, 0, 1, 0.572549, 1,
-0.166631, -0.1464746, -2.275599, 0, 1, 0.5803922, 1,
-0.1635903, 0.5115193, 0.1061422, 0, 1, 0.5843138, 1,
-0.1608716, -0.5677499, -1.59577, 0, 1, 0.5921569, 1,
-0.1583134, -0.5370432, -4.462393, 0, 1, 0.5960785, 1,
-0.1563015, 1.166923, 1.506792, 0, 1, 0.6039216, 1,
-0.1519935, -1.07849, -4.070391, 0, 1, 0.6117647, 1,
-0.1509722, 1.113663, -1.782336, 0, 1, 0.6156863, 1,
-0.140473, 0.7401918, -2.024418, 0, 1, 0.6235294, 1,
-0.139201, 0.55286, -2.120383, 0, 1, 0.627451, 1,
-0.1377406, 0.9732528, -1.522087, 0, 1, 0.6352941, 1,
-0.1363893, -0.2393615, -2.588432, 0, 1, 0.6392157, 1,
-0.1334114, 0.5966108, -2.463099, 0, 1, 0.6470588, 1,
-0.1250318, -0.5159716, -2.2695, 0, 1, 0.6509804, 1,
-0.1221313, 0.04646757, -3.360252, 0, 1, 0.6588235, 1,
-0.1209023, 0.965049, -1.332394, 0, 1, 0.6627451, 1,
-0.1198491, 1.950626, -1.337852, 0, 1, 0.6705883, 1,
-0.1190249, -1.383634, -4.645138, 0, 1, 0.6745098, 1,
-0.1190001, -0.04106104, -2.911431, 0, 1, 0.682353, 1,
-0.1183158, -1.315171, -2.291258, 0, 1, 0.6862745, 1,
-0.1175979, 1.172914, -1.267382, 0, 1, 0.6941177, 1,
-0.1167791, -0.1755143, -1.184452, 0, 1, 0.7019608, 1,
-0.1166863, -0.1764333, -1.24945, 0, 1, 0.7058824, 1,
-0.1154766, 0.3147292, 0.5111458, 0, 1, 0.7137255, 1,
-0.1126771, 0.02640484, -2.633914, 0, 1, 0.7176471, 1,
-0.1119099, -0.1267674, -3.325742, 0, 1, 0.7254902, 1,
-0.1110458, 0.2013049, -1.285578, 0, 1, 0.7294118, 1,
-0.1103086, 0.3372634, 0.2408375, 0, 1, 0.7372549, 1,
-0.1070621, 0.8458033, -1.180931, 0, 1, 0.7411765, 1,
-0.106875, -0.05787932, -2.10205, 0, 1, 0.7490196, 1,
-0.106676, -0.2226778, -0.4381241, 0, 1, 0.7529412, 1,
-0.1035669, 1.061693, 0.6180127, 0, 1, 0.7607843, 1,
-0.1014265, 0.4292893, -0.845863, 0, 1, 0.7647059, 1,
-0.09905519, -1.449206, -4.036928, 0, 1, 0.772549, 1,
-0.09819031, 0.8533359, 1.245956, 0, 1, 0.7764706, 1,
-0.09428106, -0.4297542, -2.164054, 0, 1, 0.7843137, 1,
-0.08824196, 0.6050833, 0.2528204, 0, 1, 0.7882353, 1,
-0.08760799, -0.681493, -3.765654, 0, 1, 0.7960784, 1,
-0.08379898, -0.3751062, -4.847907, 0, 1, 0.8039216, 1,
-0.06606872, -1.270627, -2.502387, 0, 1, 0.8078431, 1,
-0.0635791, 1.028315, 0.06921674, 0, 1, 0.8156863, 1,
-0.06128809, -0.7197438, -2.658186, 0, 1, 0.8196079, 1,
-0.05907009, -0.4782196, -2.765133, 0, 1, 0.827451, 1,
-0.05774117, -1.445226, -1.798455, 0, 1, 0.8313726, 1,
-0.05146136, -0.3663345, -3.190417, 0, 1, 0.8392157, 1,
-0.05002949, 0.819951, 0.5227606, 0, 1, 0.8431373, 1,
-0.04504294, 0.1019589, 0.7098444, 0, 1, 0.8509804, 1,
-0.04274853, 1.669137, 1.336536, 0, 1, 0.854902, 1,
-0.0421346, 0.9104323, 1.330726, 0, 1, 0.8627451, 1,
-0.04100734, 1.324764, 1.726674, 0, 1, 0.8666667, 1,
-0.03934047, -0.06707929, -5.331073, 0, 1, 0.8745098, 1,
-0.03811835, 0.4495813, -1.25653, 0, 1, 0.8784314, 1,
-0.03317318, 1.407048, 0.4108468, 0, 1, 0.8862745, 1,
-0.02952771, -0.9617575, -2.095885, 0, 1, 0.8901961, 1,
-0.02577596, -2.15502, -2.696002, 0, 1, 0.8980392, 1,
-0.02277219, 0.5096107, -0.7010288, 0, 1, 0.9058824, 1,
-0.02076478, -0.284647, -3.203024, 0, 1, 0.9098039, 1,
-0.02047939, -0.3190583, -3.843014, 0, 1, 0.9176471, 1,
-0.01323107, -0.1999143, -2.080202, 0, 1, 0.9215686, 1,
-0.0127249, 0.8225579, 0.5709018, 0, 1, 0.9294118, 1,
-0.005446206, 0.8107176, 1.656138, 0, 1, 0.9333333, 1,
-0.002314235, 0.02524829, -1.818558, 0, 1, 0.9411765, 1,
-0.001528467, 0.7429416, 0.3046093, 0, 1, 0.945098, 1,
0.001317882, 1.034564, -0.377102, 0, 1, 0.9529412, 1,
0.004651346, 0.3111437, 1.220144, 0, 1, 0.9568627, 1,
0.005887012, 0.03760007, 1.841429, 0, 1, 0.9647059, 1,
0.007907663, -0.6913823, 2.961779, 0, 1, 0.9686275, 1,
0.01550815, 0.3773238, -0.6436567, 0, 1, 0.9764706, 1,
0.0169377, -1.569731, 3.031018, 0, 1, 0.9803922, 1,
0.0317019, 1.453518, -0.8027641, 0, 1, 0.9882353, 1,
0.03237711, 0.3447408, 1.27239, 0, 1, 0.9921569, 1,
0.0330482, -0.4706392, 3.253362, 0, 1, 1, 1,
0.0349893, -1.788376, 3.27445, 0, 0.9921569, 1, 1,
0.03637581, 0.01205488, 0.5989358, 0, 0.9882353, 1, 1,
0.03704209, -1.913721, 3.054856, 0, 0.9803922, 1, 1,
0.0371437, -1.057289, 3.698786, 0, 0.9764706, 1, 1,
0.03853387, -2.698993, 2.692002, 0, 0.9686275, 1, 1,
0.03866788, 1.109735, 0.4627349, 0, 0.9647059, 1, 1,
0.04398891, 0.8238961, -0.003651979, 0, 0.9568627, 1, 1,
0.04557826, 0.6848221, -1.989333, 0, 0.9529412, 1, 1,
0.04618914, 0.4595501, -0.2436765, 0, 0.945098, 1, 1,
0.04637288, 0.2552673, -0.02408011, 0, 0.9411765, 1, 1,
0.04733124, 1.769296, -1.419502, 0, 0.9333333, 1, 1,
0.04751387, -1.883235, 3.513588, 0, 0.9294118, 1, 1,
0.04942706, 1.050112, -0.6458499, 0, 0.9215686, 1, 1,
0.04979791, -0.7214477, 2.143826, 0, 0.9176471, 1, 1,
0.05364821, -0.3902876, 2.785528, 0, 0.9098039, 1, 1,
0.05408624, 0.6554073, -0.2110143, 0, 0.9058824, 1, 1,
0.05690766, 1.02439, 1.737299, 0, 0.8980392, 1, 1,
0.05848854, 0.2846675, 2.35977, 0, 0.8901961, 1, 1,
0.05972181, -0.05007382, 1.62124, 0, 0.8862745, 1, 1,
0.06086522, 0.8629803, -1.056538, 0, 0.8784314, 1, 1,
0.06786077, 0.8097414, 0.3446007, 0, 0.8745098, 1, 1,
0.07153285, 0.4953208, -0.3725143, 0, 0.8666667, 1, 1,
0.07642366, 0.9731554, 0.06543644, 0, 0.8627451, 1, 1,
0.07655471, -1.627282, 1.618965, 0, 0.854902, 1, 1,
0.07691953, 1.064645, 0.7382166, 0, 0.8509804, 1, 1,
0.07785685, -1.733976, 4.101816, 0, 0.8431373, 1, 1,
0.08109145, -0.2957206, 4.349786, 0, 0.8392157, 1, 1,
0.09862179, 1.378344, 1.263596, 0, 0.8313726, 1, 1,
0.09956255, -0.8848215, 2.945882, 0, 0.827451, 1, 1,
0.1086916, -0.8329251, 2.919592, 0, 0.8196079, 1, 1,
0.1148512, 0.4505956, 0.9884462, 0, 0.8156863, 1, 1,
0.1151411, 0.5608851, 1.18859, 0, 0.8078431, 1, 1,
0.1157523, -1.885261, 2.336983, 0, 0.8039216, 1, 1,
0.1176246, -0.7482526, 2.841198, 0, 0.7960784, 1, 1,
0.1206555, -1.217006, 1.948133, 0, 0.7882353, 1, 1,
0.1212172, -0.03863972, 1.701296, 0, 0.7843137, 1, 1,
0.1218207, 0.3818087, -0.2286749, 0, 0.7764706, 1, 1,
0.1289692, 0.4229341, -1.683291, 0, 0.772549, 1, 1,
0.1297473, 0.8163895, 0.5657673, 0, 0.7647059, 1, 1,
0.1333675, -0.2574524, 4.347896, 0, 0.7607843, 1, 1,
0.136893, 0.5755792, 1.623018, 0, 0.7529412, 1, 1,
0.137376, 0.8576323, 1.69895, 0, 0.7490196, 1, 1,
0.1428806, -1.528399, 2.192644, 0, 0.7411765, 1, 1,
0.156388, 1.061338, 0.427413, 0, 0.7372549, 1, 1,
0.1577843, -0.15863, 1.56235, 0, 0.7294118, 1, 1,
0.1590627, -1.420099, 3.758612, 0, 0.7254902, 1, 1,
0.1596215, -0.6776677, 2.777681, 0, 0.7176471, 1, 1,
0.1596866, 0.2706822, 1.944653, 0, 0.7137255, 1, 1,
0.1650217, -0.8488391, 4.178348, 0, 0.7058824, 1, 1,
0.1664997, -0.03914803, 2.525761, 0, 0.6980392, 1, 1,
0.1682381, 1.030831, -0.6421205, 0, 0.6941177, 1, 1,
0.1699434, 0.07080763, 0.5903643, 0, 0.6862745, 1, 1,
0.1749632, -0.5034946, 1.279866, 0, 0.682353, 1, 1,
0.1761048, 0.6375999, 0.04129142, 0, 0.6745098, 1, 1,
0.179478, -0.7177299, 3.957934, 0, 0.6705883, 1, 1,
0.179749, 0.3257948, 0.3356123, 0, 0.6627451, 1, 1,
0.1800532, -0.5714268, 2.211599, 0, 0.6588235, 1, 1,
0.1821322, -0.5858198, 3.348641, 0, 0.6509804, 1, 1,
0.1869579, -0.247561, 3.101294, 0, 0.6470588, 1, 1,
0.1929272, 0.5312139, 0.1655679, 0, 0.6392157, 1, 1,
0.1961348, -1.097386, 1.805893, 0, 0.6352941, 1, 1,
0.2010524, -0.6104062, 3.816189, 0, 0.627451, 1, 1,
0.2023443, -1.567509, 2.70998, 0, 0.6235294, 1, 1,
0.2078477, 0.0001132187, 1.02208, 0, 0.6156863, 1, 1,
0.2100637, -1.437495, 3.013221, 0, 0.6117647, 1, 1,
0.2201902, 0.2723693, 0.5119821, 0, 0.6039216, 1, 1,
0.2283619, -0.5327218, 3.404118, 0, 0.5960785, 1, 1,
0.2306982, 1.946305, 1.940824, 0, 0.5921569, 1, 1,
0.2311967, 0.169356, -0.6445891, 0, 0.5843138, 1, 1,
0.2323911, -0.5027525, 2.845, 0, 0.5803922, 1, 1,
0.2337267, 0.4844904, 1.744036, 0, 0.572549, 1, 1,
0.2338296, 1.168916, -0.5037695, 0, 0.5686275, 1, 1,
0.2344813, -0.04248213, 3.199325, 0, 0.5607843, 1, 1,
0.234957, 0.3228343, -0.8794467, 0, 0.5568628, 1, 1,
0.236665, -0.636449, 2.79953, 0, 0.5490196, 1, 1,
0.237022, -1.176072, 1.802722, 0, 0.5450981, 1, 1,
0.2400931, 1.391122, -1.067226, 0, 0.5372549, 1, 1,
0.2436386, 0.1239308, 2.684969, 0, 0.5333334, 1, 1,
0.2449408, 0.3108702, 2.197554, 0, 0.5254902, 1, 1,
0.2479666, 0.6147153, -0.01593994, 0, 0.5215687, 1, 1,
0.2487866, -0.5866169, 1.998941, 0, 0.5137255, 1, 1,
0.2513692, 0.2676973, 1.883649, 0, 0.509804, 1, 1,
0.2531916, -0.8133534, 2.794448, 0, 0.5019608, 1, 1,
0.2540622, 1.798233, 0.4877192, 0, 0.4941176, 1, 1,
0.2603931, 0.6725284, -0.1779863, 0, 0.4901961, 1, 1,
0.2621181, 1.23043, -0.2301809, 0, 0.4823529, 1, 1,
0.2637519, 1.746839, -0.8823677, 0, 0.4784314, 1, 1,
0.2668809, -0.6477355, 3.46329, 0, 0.4705882, 1, 1,
0.2684067, 0.5910843, 0.9095532, 0, 0.4666667, 1, 1,
0.270465, 1.103763, -0.0007202421, 0, 0.4588235, 1, 1,
0.2705725, 1.034389, 0.04546462, 0, 0.454902, 1, 1,
0.2726901, -0.9709831, 1.826124, 0, 0.4470588, 1, 1,
0.273239, -1.352024, 4.033551, 0, 0.4431373, 1, 1,
0.2757968, -0.7306874, 3.550103, 0, 0.4352941, 1, 1,
0.2766127, -1.407565, 0.668993, 0, 0.4313726, 1, 1,
0.2771364, 0.4146618, 0.5296384, 0, 0.4235294, 1, 1,
0.2783152, 0.1995852, 0.587932, 0, 0.4196078, 1, 1,
0.2796906, 0.6684752, 0.3704826, 0, 0.4117647, 1, 1,
0.2823816, 0.1528451, 1.317448, 0, 0.4078431, 1, 1,
0.2848022, 0.2979971, 2.316185, 0, 0.4, 1, 1,
0.2861492, -0.2674222, 4.2789, 0, 0.3921569, 1, 1,
0.2914282, 0.8474338, 1.782649, 0, 0.3882353, 1, 1,
0.2923885, 0.3947126, 0.07967003, 0, 0.3803922, 1, 1,
0.2925031, -0.05617068, 1.647059, 0, 0.3764706, 1, 1,
0.2928517, 0.1484081, 2.04638, 0, 0.3686275, 1, 1,
0.2967534, 0.4765065, -0.9273055, 0, 0.3647059, 1, 1,
0.2983144, -0.3881255, 3.112763, 0, 0.3568628, 1, 1,
0.2995281, 0.6096065, -0.1119019, 0, 0.3529412, 1, 1,
0.304476, 0.6392906, 1.335281, 0, 0.345098, 1, 1,
0.3059961, -1.137337, 3.471875, 0, 0.3411765, 1, 1,
0.3070019, -0.6121181, 3.789607, 0, 0.3333333, 1, 1,
0.3096314, -0.925472, 3.641205, 0, 0.3294118, 1, 1,
0.3100171, 0.1412039, 1.75358, 0, 0.3215686, 1, 1,
0.3121014, 0.05571635, 0.8699304, 0, 0.3176471, 1, 1,
0.3123928, -1.419783, 4.283125, 0, 0.3098039, 1, 1,
0.3130273, -0.7749403, 1.793692, 0, 0.3058824, 1, 1,
0.3171052, -0.5051546, 2.773422, 0, 0.2980392, 1, 1,
0.3190675, 0.4215441, 0.7902522, 0, 0.2901961, 1, 1,
0.3193135, 0.2854603, 0.04570968, 0, 0.2862745, 1, 1,
0.3193348, -0.9011948, 3.796497, 0, 0.2784314, 1, 1,
0.3196932, 0.7068938, 2.742297, 0, 0.2745098, 1, 1,
0.3197831, -0.6207622, 3.278037, 0, 0.2666667, 1, 1,
0.320363, -1.634493, 3.176393, 0, 0.2627451, 1, 1,
0.3234955, 0.8832954, 2.379239, 0, 0.254902, 1, 1,
0.3238889, -0.618619, 3.909886, 0, 0.2509804, 1, 1,
0.3243576, -0.9507511, 1.244606, 0, 0.2431373, 1, 1,
0.3340963, 0.7785657, 1.874719, 0, 0.2392157, 1, 1,
0.3371855, 0.1938402, 0.2910465, 0, 0.2313726, 1, 1,
0.3418621, -0.7173331, 3.369819, 0, 0.227451, 1, 1,
0.3419186, 0.6619618, 1.228985, 0, 0.2196078, 1, 1,
0.3420442, -0.02239411, 2.909146, 0, 0.2156863, 1, 1,
0.3426566, 0.6817353, 1.826529, 0, 0.2078431, 1, 1,
0.3481275, -0.6115157, 3.048213, 0, 0.2039216, 1, 1,
0.3483886, -1.048092, 1.891643, 0, 0.1960784, 1, 1,
0.3486559, 1.187022, 0.1324545, 0, 0.1882353, 1, 1,
0.3492688, -3.109906, 3.740752, 0, 0.1843137, 1, 1,
0.3500149, -2.730729, 1.755604, 0, 0.1764706, 1, 1,
0.3513524, 1.289161, 1.520565, 0, 0.172549, 1, 1,
0.3555899, 1.177647, 1.61365, 0, 0.1647059, 1, 1,
0.3575012, -1.500912, 3.167572, 0, 0.1607843, 1, 1,
0.3597945, 0.7260567, 0.4651415, 0, 0.1529412, 1, 1,
0.3618376, -0.418333, 3.036748, 0, 0.1490196, 1, 1,
0.3678318, 1.327198, -0.8375497, 0, 0.1411765, 1, 1,
0.3685485, -0.1094368, 0.4024671, 0, 0.1372549, 1, 1,
0.3689481, 0.008290228, 1.083401, 0, 0.1294118, 1, 1,
0.3691551, 1.132985, 0.5543534, 0, 0.1254902, 1, 1,
0.3706219, 1.503848, -1.432756, 0, 0.1176471, 1, 1,
0.3726543, -1.66708, 1.722523, 0, 0.1137255, 1, 1,
0.3741118, -1.27679, 2.619161, 0, 0.1058824, 1, 1,
0.3757478, 0.04566799, 1.396112, 0, 0.09803922, 1, 1,
0.376707, -0.1567445, 1.50056, 0, 0.09411765, 1, 1,
0.3768534, -0.2077818, 1.276626, 0, 0.08627451, 1, 1,
0.3852182, 0.1346759, -0.0008843906, 0, 0.08235294, 1, 1,
0.389449, -0.2989536, 4.065702, 0, 0.07450981, 1, 1,
0.3956363, 0.3461911, 0.02472579, 0, 0.07058824, 1, 1,
0.3959846, 0.2487557, -0.06779496, 0, 0.0627451, 1, 1,
0.3974913, 1.96265, 0.9473482, 0, 0.05882353, 1, 1,
0.3981772, 0.09238721, 3.005218, 0, 0.05098039, 1, 1,
0.4002399, 0.5434875, 0.9358793, 0, 0.04705882, 1, 1,
0.4008912, 0.4311431, 0.8616955, 0, 0.03921569, 1, 1,
0.404518, 0.2188807, 1.543101, 0, 0.03529412, 1, 1,
0.4069217, 0.8129907, 1.333103, 0, 0.02745098, 1, 1,
0.4089859, -3.894449, 2.069685, 0, 0.02352941, 1, 1,
0.4113089, 1.493308, 0.184322, 0, 0.01568628, 1, 1,
0.4116426, 0.8203869, 0.4322131, 0, 0.01176471, 1, 1,
0.4130266, -0.3029618, 0.4858826, 0, 0.003921569, 1, 1,
0.4135731, 0.5522159, 2.211599, 0.003921569, 0, 1, 1,
0.4167308, 0.1401782, 0.9481786, 0.007843138, 0, 1, 1,
0.4182178, -0.6086646, 1.337513, 0.01568628, 0, 1, 1,
0.4189128, 0.9930161, -0.8312149, 0.01960784, 0, 1, 1,
0.4194474, 0.4667708, 1.89768, 0.02745098, 0, 1, 1,
0.4203676, 0.9915889, 2.596152, 0.03137255, 0, 1, 1,
0.423585, 0.6986723, 1.940978, 0.03921569, 0, 1, 1,
0.42375, -0.7187164, 2.322922, 0.04313726, 0, 1, 1,
0.4241012, 0.5000589, 0.5058525, 0.05098039, 0, 1, 1,
0.4243036, 0.8253216, 0.6933736, 0.05490196, 0, 1, 1,
0.4263209, 0.2255808, -0.5027938, 0.0627451, 0, 1, 1,
0.4290458, 1.873953, -1.570237, 0.06666667, 0, 1, 1,
0.4291087, 0.6992031, 0.7578679, 0.07450981, 0, 1, 1,
0.4291569, -0.4219258, 1.517662, 0.07843138, 0, 1, 1,
0.431107, 0.09632588, 1.074333, 0.08627451, 0, 1, 1,
0.4357516, -0.7695439, 2.241102, 0.09019608, 0, 1, 1,
0.4456965, -0.2720595, 0.5687585, 0.09803922, 0, 1, 1,
0.4486932, 0.2920955, 0.1811398, 0.1058824, 0, 1, 1,
0.4490381, -0.8775195, 2.805837, 0.1098039, 0, 1, 1,
0.4496416, 1.000999, 1.625298, 0.1176471, 0, 1, 1,
0.4499437, 0.4040636, 0.5481294, 0.1215686, 0, 1, 1,
0.4508884, -0.91369, 2.739578, 0.1294118, 0, 1, 1,
0.4525481, 0.7508081, 0.09226717, 0.1333333, 0, 1, 1,
0.4530301, -0.9235685, 3.00436, 0.1411765, 0, 1, 1,
0.4534431, 0.6275054, 1.73052, 0.145098, 0, 1, 1,
0.4539125, 0.3037711, 2.406643, 0.1529412, 0, 1, 1,
0.4579171, -0.9198827, -0.005421306, 0.1568628, 0, 1, 1,
0.4592652, 0.2747592, 2.153128, 0.1647059, 0, 1, 1,
0.4619951, 0.5339561, 1.622663, 0.1686275, 0, 1, 1,
0.4631781, 1.922412, 0.1613496, 0.1764706, 0, 1, 1,
0.4715033, -0.6559204, 1.944476, 0.1803922, 0, 1, 1,
0.4725817, -1.061515, 2.556181, 0.1882353, 0, 1, 1,
0.4755807, -0.09441158, 3.487582, 0.1921569, 0, 1, 1,
0.476699, 0.5419098, -0.2437969, 0.2, 0, 1, 1,
0.4807663, 0.08144892, 2.655119, 0.2078431, 0, 1, 1,
0.4850971, 0.6438908, 2.366534, 0.2117647, 0, 1, 1,
0.4853913, -0.2967251, 1.254618, 0.2196078, 0, 1, 1,
0.4894972, -1.122178, 1.725672, 0.2235294, 0, 1, 1,
0.4939546, -1.355678, 1.852488, 0.2313726, 0, 1, 1,
0.4944025, -1.80757, 1.034631, 0.2352941, 0, 1, 1,
0.4961097, -0.763651, 2.908985, 0.2431373, 0, 1, 1,
0.4973105, 1.239141, 0.1115578, 0.2470588, 0, 1, 1,
0.4974983, -0.8356895, 2.052751, 0.254902, 0, 1, 1,
0.4984014, 2.036233, 1.150573, 0.2588235, 0, 1, 1,
0.4998851, 0.02203029, 2.061666, 0.2666667, 0, 1, 1,
0.5082344, -0.1889848, 0.8638893, 0.2705882, 0, 1, 1,
0.5120278, -0.8160326, 2.393687, 0.2784314, 0, 1, 1,
0.5229852, -1.295988, 3.310902, 0.282353, 0, 1, 1,
0.5253572, 2.245804, -1.635538, 0.2901961, 0, 1, 1,
0.5331521, 1.034075, 0.4551648, 0.2941177, 0, 1, 1,
0.5334145, 0.4087384, 0.7208428, 0.3019608, 0, 1, 1,
0.5339559, 0.3677722, 0.5621629, 0.3098039, 0, 1, 1,
0.5407789, 0.6833535, -1.260801, 0.3137255, 0, 1, 1,
0.5434018, -0.2126011, 1.76297, 0.3215686, 0, 1, 1,
0.5490167, -0.005409468, 2.58889, 0.3254902, 0, 1, 1,
0.5518916, 0.347834, -0.2285972, 0.3333333, 0, 1, 1,
0.5562441, -0.1804702, 2.714547, 0.3372549, 0, 1, 1,
0.5575572, 0.7713445, 0.5351372, 0.345098, 0, 1, 1,
0.5609209, -0.354322, 3.528512, 0.3490196, 0, 1, 1,
0.5630064, 0.5096188, 0.2929677, 0.3568628, 0, 1, 1,
0.5632739, 1.301956, -0.1168048, 0.3607843, 0, 1, 1,
0.5708609, -1.467358, 2.760196, 0.3686275, 0, 1, 1,
0.5736528, -2.586192, 3.404466, 0.372549, 0, 1, 1,
0.577414, -0.4058919, 1.369917, 0.3803922, 0, 1, 1,
0.5840029, -0.8224272, 2.997138, 0.3843137, 0, 1, 1,
0.5933296, 0.2530372, 3.013522, 0.3921569, 0, 1, 1,
0.5961309, 0.7335793, -0.09057565, 0.3960784, 0, 1, 1,
0.5983571, -0.4717275, 3.761752, 0.4039216, 0, 1, 1,
0.5984636, 1.27562, -0.6331448, 0.4117647, 0, 1, 1,
0.5993319, -0.563138, 5.632181, 0.4156863, 0, 1, 1,
0.5996261, 1.860196, 0.6573521, 0.4235294, 0, 1, 1,
0.6012953, -0.7629402, 2.681958, 0.427451, 0, 1, 1,
0.6024222, 0.5325047, -0.1127121, 0.4352941, 0, 1, 1,
0.6090938, 1.711717, 1.4134, 0.4392157, 0, 1, 1,
0.6137717, -0.9789158, 3.9552, 0.4470588, 0, 1, 1,
0.6148868, -0.9453952, 3.585051, 0.4509804, 0, 1, 1,
0.6197415, -0.278662, 3.141365, 0.4588235, 0, 1, 1,
0.6247406, -0.4313959, 0.4636246, 0.4627451, 0, 1, 1,
0.6255286, 0.110647, 0.9469449, 0.4705882, 0, 1, 1,
0.6262756, 0.7203216, -0.1522869, 0.4745098, 0, 1, 1,
0.6316643, -1.055687, 5.280383, 0.4823529, 0, 1, 1,
0.6358297, 0.6639755, 1.122817, 0.4862745, 0, 1, 1,
0.6380988, -1.395265, 3.624595, 0.4941176, 0, 1, 1,
0.6420097, 0.1624302, 1.116628, 0.5019608, 0, 1, 1,
0.6422283, 0.3478595, 1.019346, 0.5058824, 0, 1, 1,
0.6445477, 0.06732068, 1.706583, 0.5137255, 0, 1, 1,
0.6504708, -0.5677301, 2.246513, 0.5176471, 0, 1, 1,
0.6540664, -0.7932649, 3.174707, 0.5254902, 0, 1, 1,
0.6542371, -1.006294, 2.011746, 0.5294118, 0, 1, 1,
0.6555815, -0.7762486, 0.6717151, 0.5372549, 0, 1, 1,
0.6566023, 0.04923171, 2.472319, 0.5411765, 0, 1, 1,
0.6588036, -1.297344, 1.48504, 0.5490196, 0, 1, 1,
0.6589775, 1.22779, -0.5857347, 0.5529412, 0, 1, 1,
0.6625794, 0.4196862, -0.330307, 0.5607843, 0, 1, 1,
0.6639532, -0.3825445, 1.148154, 0.5647059, 0, 1, 1,
0.6734368, -0.9268923, 1.702401, 0.572549, 0, 1, 1,
0.6778246, 0.3983575, 1.043119, 0.5764706, 0, 1, 1,
0.6830649, 1.047929, -0.07266289, 0.5843138, 0, 1, 1,
0.6963493, 0.03926642, 1.611623, 0.5882353, 0, 1, 1,
0.6963661, -0.7010835, 3.504251, 0.5960785, 0, 1, 1,
0.696754, 0.3389512, 2.135957, 0.6039216, 0, 1, 1,
0.6970091, -1.149224, 4.722695, 0.6078432, 0, 1, 1,
0.6971431, 0.6165203, 1.940323, 0.6156863, 0, 1, 1,
0.6971836, 0.197908, 2.26698, 0.6196079, 0, 1, 1,
0.6988772, 0.4526869, 1.527393, 0.627451, 0, 1, 1,
0.699188, 0.3819353, 0.1635837, 0.6313726, 0, 1, 1,
0.6999584, 3.743949, 1.751338, 0.6392157, 0, 1, 1,
0.7010152, 0.455196, 0.886526, 0.6431373, 0, 1, 1,
0.7025491, 1.08517, 1.43997, 0.6509804, 0, 1, 1,
0.7026105, -1.00343, 3.184716, 0.654902, 0, 1, 1,
0.7027781, -0.4188802, 1.247886, 0.6627451, 0, 1, 1,
0.7032047, -0.395715, 0.5382555, 0.6666667, 0, 1, 1,
0.7036389, -0.5935175, 2.205536, 0.6745098, 0, 1, 1,
0.7101148, -0.3848689, 2.180374, 0.6784314, 0, 1, 1,
0.710541, -0.6577066, 1.884695, 0.6862745, 0, 1, 1,
0.7161961, 1.536737, 0.5721623, 0.6901961, 0, 1, 1,
0.7225097, 0.919274, 1.828998, 0.6980392, 0, 1, 1,
0.7312316, -1.807198, 3.41891, 0.7058824, 0, 1, 1,
0.7402599, -0.3656284, 3.524972, 0.7098039, 0, 1, 1,
0.744472, 0.6841539, -0.6967396, 0.7176471, 0, 1, 1,
0.7514387, -0.9415424, -0.09426239, 0.7215686, 0, 1, 1,
0.754197, -1.27475, 1.208941, 0.7294118, 0, 1, 1,
0.7595207, 0.9613281, 2.364569, 0.7333333, 0, 1, 1,
0.7600306, 0.4328012, 0.3658576, 0.7411765, 0, 1, 1,
0.7771946, 0.05331538, 1.33594, 0.7450981, 0, 1, 1,
0.7838282, -1.340146, 2.748444, 0.7529412, 0, 1, 1,
0.7877269, 0.5581549, -0.09124988, 0.7568628, 0, 1, 1,
0.8016053, 0.3996017, 1.336148, 0.7647059, 0, 1, 1,
0.8032427, -1.063399, 3.585901, 0.7686275, 0, 1, 1,
0.8075454, 0.04593721, 2.125966, 0.7764706, 0, 1, 1,
0.8082917, 0.6029006, -0.6484205, 0.7803922, 0, 1, 1,
0.8186491, -1.523677, 0.7427565, 0.7882353, 0, 1, 1,
0.8267512, -0.5228291, 3.367998, 0.7921569, 0, 1, 1,
0.8277056, 0.2199941, 1.64124, 0.8, 0, 1, 1,
0.8310028, -0.2908957, 0.597774, 0.8078431, 0, 1, 1,
0.8340064, -1.455361, 2.147642, 0.8117647, 0, 1, 1,
0.8375142, -0.74652, 2.018916, 0.8196079, 0, 1, 1,
0.8453978, 0.4817291, 0.382131, 0.8235294, 0, 1, 1,
0.8540128, 0.7470837, 0.9751341, 0.8313726, 0, 1, 1,
0.8566091, 0.4135149, 0.6549565, 0.8352941, 0, 1, 1,
0.8605211, 1.105047, 0.4699104, 0.8431373, 0, 1, 1,
0.8631468, 0.3533109, 1.586378, 0.8470588, 0, 1, 1,
0.8724859, -2.057601, 1.534621, 0.854902, 0, 1, 1,
0.877477, -0.1692773, 1.42202, 0.8588235, 0, 1, 1,
0.8781796, 0.6368152, 0.3976662, 0.8666667, 0, 1, 1,
0.8893928, 0.01884427, 0.5035856, 0.8705882, 0, 1, 1,
0.8907487, -0.1439693, 1.213104, 0.8784314, 0, 1, 1,
0.8933901, -1.05767, 3.816359, 0.8823529, 0, 1, 1,
0.9025047, 1.259012, -0.355887, 0.8901961, 0, 1, 1,
0.9071714, -0.07890207, 1.534346, 0.8941177, 0, 1, 1,
0.9105163, -1.561326, 1.456344, 0.9019608, 0, 1, 1,
0.9146862, -0.8837779, 0.6734835, 0.9098039, 0, 1, 1,
0.9185649, 1.166557, 2.468816, 0.9137255, 0, 1, 1,
0.9200519, 0.08345792, 2.066662, 0.9215686, 0, 1, 1,
0.9203704, -1.314622, 1.60479, 0.9254902, 0, 1, 1,
0.924196, -1.6772, 3.897761, 0.9333333, 0, 1, 1,
0.9280485, 0.3099778, 1.17708, 0.9372549, 0, 1, 1,
0.9336247, 0.3485855, 0.9647647, 0.945098, 0, 1, 1,
0.9404258, -0.7631318, 2.398004, 0.9490196, 0, 1, 1,
0.9407599, 1.411489, -0.3163815, 0.9568627, 0, 1, 1,
0.9423428, 0.2201745, 1.631903, 0.9607843, 0, 1, 1,
0.9451284, 0.1427279, 3.101732, 0.9686275, 0, 1, 1,
0.9525189, -2.260756, 3.78477, 0.972549, 0, 1, 1,
0.9540904, 0.5957608, 2.407891, 0.9803922, 0, 1, 1,
0.9564661, -1.325147, 3.573701, 0.9843137, 0, 1, 1,
0.9641359, -0.1288412, 1.601537, 0.9921569, 0, 1, 1,
0.9687417, -0.1981674, 2.60515, 0.9960784, 0, 1, 1,
0.9723276, -0.2544416, 2.616248, 1, 0, 0.9960784, 1,
0.9803759, 1.614809, -0.4743917, 1, 0, 0.9882353, 1,
0.9803979, 2.601906, -0.3759206, 1, 0, 0.9843137, 1,
0.9847685, -0.2109727, 1.440185, 1, 0, 0.9764706, 1,
0.9861206, -1.660261, 1.543439, 1, 0, 0.972549, 1,
0.9872207, 0.9288832, -0.9578995, 1, 0, 0.9647059, 1,
0.9962737, -0.6019073, 3.686589, 1, 0, 0.9607843, 1,
1.000057, -1.628539, 4.209587, 1, 0, 0.9529412, 1,
1.002478, 0.4976083, 2.026445, 1, 0, 0.9490196, 1,
1.004896, 0.9534339, -0.7839548, 1, 0, 0.9411765, 1,
1.01013, 0.5263277, -0.285247, 1, 0, 0.9372549, 1,
1.014914, -0.06941308, 0.6414636, 1, 0, 0.9294118, 1,
1.027113, -0.3884618, 0.7740885, 1, 0, 0.9254902, 1,
1.033098, -0.4676122, 0.1870317, 1, 0, 0.9176471, 1,
1.033257, -0.3576977, 1.977969, 1, 0, 0.9137255, 1,
1.036312, -0.927642, 0.7415594, 1, 0, 0.9058824, 1,
1.047076, 0.9537044, -0.2924786, 1, 0, 0.9019608, 1,
1.050633, -0.6754581, 0.5880917, 1, 0, 0.8941177, 1,
1.051295, 0.5732032, -0.09993897, 1, 0, 0.8862745, 1,
1.056892, -0.2708395, 1.762126, 1, 0, 0.8823529, 1,
1.065465, -0.5433844, 1.308626, 1, 0, 0.8745098, 1,
1.069792, 0.1157364, 1.090636, 1, 0, 0.8705882, 1,
1.076506, -1.663201, 2.08701, 1, 0, 0.8627451, 1,
1.082948, 0.4594835, -0.1084968, 1, 0, 0.8588235, 1,
1.088247, 0.7151043, 0.891436, 1, 0, 0.8509804, 1,
1.091029, 1.294269, 1.232783, 1, 0, 0.8470588, 1,
1.097546, 1.063114, 0.8073867, 1, 0, 0.8392157, 1,
1.099622, -0.7282523, 2.440456, 1, 0, 0.8352941, 1,
1.105268, 0.7689131, 1.297831, 1, 0, 0.827451, 1,
1.108242, -1.168226, 2.227217, 1, 0, 0.8235294, 1,
1.112102, -1.939079, 3.081252, 1, 0, 0.8156863, 1,
1.122767, 0.2586278, 0.3118504, 1, 0, 0.8117647, 1,
1.125253, -1.25826, 2.672323, 1, 0, 0.8039216, 1,
1.125887, -1.748754, 2.945225, 1, 0, 0.7960784, 1,
1.126033, 0.5088229, -0.5902639, 1, 0, 0.7921569, 1,
1.13074, -0.4243598, 1.15212, 1, 0, 0.7843137, 1,
1.132252, 1.38842, 0.7055152, 1, 0, 0.7803922, 1,
1.139373, 0.7323467, 0.391372, 1, 0, 0.772549, 1,
1.14009, -1.398163, 3.122674, 1, 0, 0.7686275, 1,
1.149986, -0.513557, -0.03333703, 1, 0, 0.7607843, 1,
1.157764, -1.000657, 1.729147, 1, 0, 0.7568628, 1,
1.158509, 2.65426, -0.06085599, 1, 0, 0.7490196, 1,
1.160507, 1.26026, 1.465014, 1, 0, 0.7450981, 1,
1.16055, 0.4599835, 0.3110224, 1, 0, 0.7372549, 1,
1.165342, -1.136372, 2.569776, 1, 0, 0.7333333, 1,
1.171728, -0.7805105, 2.62675, 1, 0, 0.7254902, 1,
1.17753, 0.3048127, 1.129985, 1, 0, 0.7215686, 1,
1.179332, -0.3328912, 1.657731, 1, 0, 0.7137255, 1,
1.179653, -0.6219929, 1.573651, 1, 0, 0.7098039, 1,
1.181561, 0.7933611, 1.922732, 1, 0, 0.7019608, 1,
1.184433, 0.7859529, 0.5389087, 1, 0, 0.6941177, 1,
1.185603, 1.041476, 0.8989182, 1, 0, 0.6901961, 1,
1.193647, -1.165646, 2.547509, 1, 0, 0.682353, 1,
1.194709, -0.8884201, 2.091256, 1, 0, 0.6784314, 1,
1.195713, 1.636636, 0.5125364, 1, 0, 0.6705883, 1,
1.203625, -0.6207013, 2.213116, 1, 0, 0.6666667, 1,
1.217726, -0.9188219, 1.908938, 1, 0, 0.6588235, 1,
1.218446, -0.751301, 2.903982, 1, 0, 0.654902, 1,
1.218755, 0.7611839, 0.7405921, 1, 0, 0.6470588, 1,
1.230695, 0.1651507, 2.220466, 1, 0, 0.6431373, 1,
1.232865, -0.3764879, 1.316092, 1, 0, 0.6352941, 1,
1.242662, 0.9536343, 1.599582, 1, 0, 0.6313726, 1,
1.243621, -1.727282, 3.350126, 1, 0, 0.6235294, 1,
1.244826, 0.09612763, 1.415774, 1, 0, 0.6196079, 1,
1.249976, -0.03788812, 2.201994, 1, 0, 0.6117647, 1,
1.256921, 0.1320284, 3.408774, 1, 0, 0.6078432, 1,
1.274116, 1.665062, 0.3777187, 1, 0, 0.6, 1,
1.276074, 0.2269528, 0.2915194, 1, 0, 0.5921569, 1,
1.278289, -0.3513406, 2.21634, 1, 0, 0.5882353, 1,
1.293381, -0.07524789, 2.713403, 1, 0, 0.5803922, 1,
1.298343, -1.828511, 2.121873, 1, 0, 0.5764706, 1,
1.299586, 0.7773803, 2.181566, 1, 0, 0.5686275, 1,
1.310294, -0.1403901, 0.8266637, 1, 0, 0.5647059, 1,
1.311511, -1.227247, 2.94275, 1, 0, 0.5568628, 1,
1.312895, 0.5953568, 1.325902, 1, 0, 0.5529412, 1,
1.315088, -1.324188, 1.609408, 1, 0, 0.5450981, 1,
1.318346, 0.9541077, 0.5695276, 1, 0, 0.5411765, 1,
1.322428, -0.4980484, 3.084371, 1, 0, 0.5333334, 1,
1.324037, 0.009873109, 2.3428, 1, 0, 0.5294118, 1,
1.324301, 2.184417, 1.583447, 1, 0, 0.5215687, 1,
1.357642, 1.064584, 1.135694, 1, 0, 0.5176471, 1,
1.369592, -0.2690789, 2.79921, 1, 0, 0.509804, 1,
1.375795, -0.7856598, 1.783528, 1, 0, 0.5058824, 1,
1.388402, 1.691372, 0.4789387, 1, 0, 0.4980392, 1,
1.394593, -0.3057905, 1.481834, 1, 0, 0.4901961, 1,
1.398033, 0.05766841, 1.395047, 1, 0, 0.4862745, 1,
1.413029, -0.2216059, 2.259156, 1, 0, 0.4784314, 1,
1.420955, 0.1047037, 1.488816, 1, 0, 0.4745098, 1,
1.422991, -1.134174, 2.099056, 1, 0, 0.4666667, 1,
1.437019, -1.363101, 2.420096, 1, 0, 0.4627451, 1,
1.437118, 1.728677, -1.092301, 1, 0, 0.454902, 1,
1.438551, -0.2922979, 2.189123, 1, 0, 0.4509804, 1,
1.449553, -1.815877, 2.374945, 1, 0, 0.4431373, 1,
1.450434, 0.1455363, 1.776996, 1, 0, 0.4392157, 1,
1.452115, 0.07557461, -0.005917653, 1, 0, 0.4313726, 1,
1.455846, -0.991554, 1.654678, 1, 0, 0.427451, 1,
1.463297, 0.154316, 0.7617676, 1, 0, 0.4196078, 1,
1.467944, -0.8379972, 2.638924, 1, 0, 0.4156863, 1,
1.468165, 1.435433, 2.025726, 1, 0, 0.4078431, 1,
1.482905, 0.4145661, 3.001033, 1, 0, 0.4039216, 1,
1.485341, 1.866948, 1.510207, 1, 0, 0.3960784, 1,
1.542448, 0.2721093, 2.724305, 1, 0, 0.3882353, 1,
1.543366, 0.6607113, 1.937482, 1, 0, 0.3843137, 1,
1.555793, 0.5476183, 0.9365727, 1, 0, 0.3764706, 1,
1.577575, -0.8335363, 3.242433, 1, 0, 0.372549, 1,
1.578705, 0.9804223, 1.237746, 1, 0, 0.3647059, 1,
1.610936, -0.912395, 0.4034247, 1, 0, 0.3607843, 1,
1.614833, -1.461255, 2.70815, 1, 0, 0.3529412, 1,
1.619443, -0.454392, 1.825723, 1, 0, 0.3490196, 1,
1.633875, -1.390897, 0.6167544, 1, 0, 0.3411765, 1,
1.671828, 0.04340013, 0.5811528, 1, 0, 0.3372549, 1,
1.672262, -0.3847433, 1.683892, 1, 0, 0.3294118, 1,
1.672446, 0.2271667, 2.124076, 1, 0, 0.3254902, 1,
1.681401, -1.129024, 2.977139, 1, 0, 0.3176471, 1,
1.682044, -1.30861, 1.369403, 1, 0, 0.3137255, 1,
1.685329, 1.463974, 2.173595, 1, 0, 0.3058824, 1,
1.69559, 1.04809, 1.193338, 1, 0, 0.2980392, 1,
1.71924, -0.0401166, 1.108379, 1, 0, 0.2941177, 1,
1.723364, 0.4495679, 3.269987, 1, 0, 0.2862745, 1,
1.755596, 1.223917, 0.9025351, 1, 0, 0.282353, 1,
1.808229, -0.3872691, 2.901341, 1, 0, 0.2745098, 1,
1.816693, -0.2984106, 0.9593189, 1, 0, 0.2705882, 1,
1.820726, -0.657343, 1.501887, 1, 0, 0.2627451, 1,
1.878252, -0.8614107, 3.502441, 1, 0, 0.2588235, 1,
1.883713, 0.1553413, -0.2862179, 1, 0, 0.2509804, 1,
1.912404, -1.60272, 2.470216, 1, 0, 0.2470588, 1,
1.913023, -0.554478, 2.261601, 1, 0, 0.2392157, 1,
1.926713, 1.086073, 1.524539, 1, 0, 0.2352941, 1,
1.9295, -0.6956877, 2.863532, 1, 0, 0.227451, 1,
1.940917, -0.598478, 0.2290704, 1, 0, 0.2235294, 1,
1.944993, -1.456879, 0.7200776, 1, 0, 0.2156863, 1,
1.94864, 1.550381, -1.847127, 1, 0, 0.2117647, 1,
1.976661, 1.270232, 2.666959, 1, 0, 0.2039216, 1,
1.990634, -0.9851933, 2.300619, 1, 0, 0.1960784, 1,
1.991559, 0.1109444, 2.191467, 1, 0, 0.1921569, 1,
1.997303, -0.2628603, 1.471108, 1, 0, 0.1843137, 1,
2.071919, -1.008349, 1.600043, 1, 0, 0.1803922, 1,
2.081015, 0.9241987, 0.4956654, 1, 0, 0.172549, 1,
2.115579, 1.962408, 1.906644, 1, 0, 0.1686275, 1,
2.125882, -0.7755491, 1.257881, 1, 0, 0.1607843, 1,
2.141685, -0.2687752, 4.325506, 1, 0, 0.1568628, 1,
2.14849, 0.6159137, 0.2180787, 1, 0, 0.1490196, 1,
2.154094, -0.9730772, 2.439852, 1, 0, 0.145098, 1,
2.164363, -0.1128228, 2.586349, 1, 0, 0.1372549, 1,
2.17667, -0.3178478, -0.1419217, 1, 0, 0.1333333, 1,
2.264029, -1.142847, 2.291703, 1, 0, 0.1254902, 1,
2.294029, -0.9011644, 3.848245, 1, 0, 0.1215686, 1,
2.31379, -0.862242, 0.1788836, 1, 0, 0.1137255, 1,
2.339698, -0.976418, 0.4470588, 1, 0, 0.1098039, 1,
2.37074, -0.88672, 1.656217, 1, 0, 0.1019608, 1,
2.377682, 0.4864995, 1.530221, 1, 0, 0.09411765, 1,
2.405975, -0.07399173, 0.001755199, 1, 0, 0.09019608, 1,
2.429895, 0.5440921, 1.325064, 1, 0, 0.08235294, 1,
2.474842, -3.480769, 3.26762, 1, 0, 0.07843138, 1,
2.560409, 0.4474329, 0.2580506, 1, 0, 0.07058824, 1,
2.570001, -0.05806868, 0.3360926, 1, 0, 0.06666667, 1,
2.582433, 0.2879713, 0.5294397, 1, 0, 0.05882353, 1,
2.590117, 0.01773826, 2.927521, 1, 0, 0.05490196, 1,
2.628908, -0.3338901, 1.780166, 1, 0, 0.04705882, 1,
2.637044, 0.03521008, 1.434338, 1, 0, 0.04313726, 1,
2.747277, -1.403827, 2.45907, 1, 0, 0.03529412, 1,
2.758209, -0.6322316, 2.370181, 1, 0, 0.03137255, 1,
2.767454, -0.2452021, 3.061451, 1, 0, 0.02352941, 1,
2.822442, -0.8732192, 1.677418, 1, 0, 0.01960784, 1,
2.973326, -0.1131091, 0.5012799, 1, 0, 0.01176471, 1,
3.221368, 0.9000537, 1.248021, 1, 0, 0.007843138, 1
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
0.2234372, -5.189157, -7.189345, 0, -0.5, 0.5, 0.5,
0.2234372, -5.189157, -7.189345, 1, -0.5, 0.5, 0.5,
0.2234372, -5.189157, -7.189345, 1, 1.5, 0.5, 0.5,
0.2234372, -5.189157, -7.189345, 0, 1.5, 0.5, 0.5
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
-3.790792, -0.07525015, -7.189345, 0, -0.5, 0.5, 0.5,
-3.790792, -0.07525015, -7.189345, 1, -0.5, 0.5, 0.5,
-3.790792, -0.07525015, -7.189345, 1, 1.5, 0.5, 0.5,
-3.790792, -0.07525015, -7.189345, 0, 1.5, 0.5, 0.5
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
-3.790792, -5.189157, 0.1505537, 0, -0.5, 0.5, 0.5,
-3.790792, -5.189157, 0.1505537, 1, -0.5, 0.5, 0.5,
-3.790792, -5.189157, 0.1505537, 1, 1.5, 0.5, 0.5,
-3.790792, -5.189157, 0.1505537, 0, 1.5, 0.5, 0.5
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
-2, -4.009025, -5.495522,
3, -4.009025, -5.495522,
-2, -4.009025, -5.495522,
-2, -4.205714, -5.777826,
-1, -4.009025, -5.495522,
-1, -4.205714, -5.777826,
0, -4.009025, -5.495522,
0, -4.205714, -5.777826,
1, -4.009025, -5.495522,
1, -4.205714, -5.777826,
2, -4.009025, -5.495522,
2, -4.205714, -5.777826,
3, -4.009025, -5.495522,
3, -4.205714, -5.777826
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
-2, -4.599092, -6.342433, 0, -0.5, 0.5, 0.5,
-2, -4.599092, -6.342433, 1, -0.5, 0.5, 0.5,
-2, -4.599092, -6.342433, 1, 1.5, 0.5, 0.5,
-2, -4.599092, -6.342433, 0, 1.5, 0.5, 0.5,
-1, -4.599092, -6.342433, 0, -0.5, 0.5, 0.5,
-1, -4.599092, -6.342433, 1, -0.5, 0.5, 0.5,
-1, -4.599092, -6.342433, 1, 1.5, 0.5, 0.5,
-1, -4.599092, -6.342433, 0, 1.5, 0.5, 0.5,
0, -4.599092, -6.342433, 0, -0.5, 0.5, 0.5,
0, -4.599092, -6.342433, 1, -0.5, 0.5, 0.5,
0, -4.599092, -6.342433, 1, 1.5, 0.5, 0.5,
0, -4.599092, -6.342433, 0, 1.5, 0.5, 0.5,
1, -4.599092, -6.342433, 0, -0.5, 0.5, 0.5,
1, -4.599092, -6.342433, 1, -0.5, 0.5, 0.5,
1, -4.599092, -6.342433, 1, 1.5, 0.5, 0.5,
1, -4.599092, -6.342433, 0, 1.5, 0.5, 0.5,
2, -4.599092, -6.342433, 0, -0.5, 0.5, 0.5,
2, -4.599092, -6.342433, 1, -0.5, 0.5, 0.5,
2, -4.599092, -6.342433, 1, 1.5, 0.5, 0.5,
2, -4.599092, -6.342433, 0, 1.5, 0.5, 0.5,
3, -4.599092, -6.342433, 0, -0.5, 0.5, 0.5,
3, -4.599092, -6.342433, 1, -0.5, 0.5, 0.5,
3, -4.599092, -6.342433, 1, 1.5, 0.5, 0.5,
3, -4.599092, -6.342433, 0, 1.5, 0.5, 0.5
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
-2.864431, -2, -5.495522,
-2.864431, 2, -5.495522,
-2.864431, -2, -5.495522,
-3.018825, -2, -5.777826,
-2.864431, 0, -5.495522,
-3.018825, 0, -5.777826,
-2.864431, 2, -5.495522,
-3.018825, 2, -5.777826
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
-3.327611, -2, -6.342433, 0, -0.5, 0.5, 0.5,
-3.327611, -2, -6.342433, 1, -0.5, 0.5, 0.5,
-3.327611, -2, -6.342433, 1, 1.5, 0.5, 0.5,
-3.327611, -2, -6.342433, 0, 1.5, 0.5, 0.5,
-3.327611, 0, -6.342433, 0, -0.5, 0.5, 0.5,
-3.327611, 0, -6.342433, 1, -0.5, 0.5, 0.5,
-3.327611, 0, -6.342433, 1, 1.5, 0.5, 0.5,
-3.327611, 0, -6.342433, 0, 1.5, 0.5, 0.5,
-3.327611, 2, -6.342433, 0, -0.5, 0.5, 0.5,
-3.327611, 2, -6.342433, 1, -0.5, 0.5, 0.5,
-3.327611, 2, -6.342433, 1, 1.5, 0.5, 0.5,
-3.327611, 2, -6.342433, 0, 1.5, 0.5, 0.5
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
-2.864431, -4.009025, -4,
-2.864431, -4.009025, 4,
-2.864431, -4.009025, -4,
-3.018825, -4.205714, -4,
-2.864431, -4.009025, -2,
-3.018825, -4.205714, -2,
-2.864431, -4.009025, 0,
-3.018825, -4.205714, 0,
-2.864431, -4.009025, 2,
-3.018825, -4.205714, 2,
-2.864431, -4.009025, 4,
-3.018825, -4.205714, 4
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
-3.327611, -4.599092, -4, 0, -0.5, 0.5, 0.5,
-3.327611, -4.599092, -4, 1, -0.5, 0.5, 0.5,
-3.327611, -4.599092, -4, 1, 1.5, 0.5, 0.5,
-3.327611, -4.599092, -4, 0, 1.5, 0.5, 0.5,
-3.327611, -4.599092, -2, 0, -0.5, 0.5, 0.5,
-3.327611, -4.599092, -2, 1, -0.5, 0.5, 0.5,
-3.327611, -4.599092, -2, 1, 1.5, 0.5, 0.5,
-3.327611, -4.599092, -2, 0, 1.5, 0.5, 0.5,
-3.327611, -4.599092, 0, 0, -0.5, 0.5, 0.5,
-3.327611, -4.599092, 0, 1, -0.5, 0.5, 0.5,
-3.327611, -4.599092, 0, 1, 1.5, 0.5, 0.5,
-3.327611, -4.599092, 0, 0, 1.5, 0.5, 0.5,
-3.327611, -4.599092, 2, 0, -0.5, 0.5, 0.5,
-3.327611, -4.599092, 2, 1, -0.5, 0.5, 0.5,
-3.327611, -4.599092, 2, 1, 1.5, 0.5, 0.5,
-3.327611, -4.599092, 2, 0, 1.5, 0.5, 0.5,
-3.327611, -4.599092, 4, 0, -0.5, 0.5, 0.5,
-3.327611, -4.599092, 4, 1, -0.5, 0.5, 0.5,
-3.327611, -4.599092, 4, 1, 1.5, 0.5, 0.5,
-3.327611, -4.599092, 4, 0, 1.5, 0.5, 0.5
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
-2.864431, -4.009025, -5.495522,
-2.864431, 3.858525, -5.495522,
-2.864431, -4.009025, 5.796629,
-2.864431, 3.858525, 5.796629,
-2.864431, -4.009025, -5.495522,
-2.864431, -4.009025, 5.796629,
-2.864431, 3.858525, -5.495522,
-2.864431, 3.858525, 5.796629,
-2.864431, -4.009025, -5.495522,
3.311306, -4.009025, -5.495522,
-2.864431, -4.009025, 5.796629,
3.311306, -4.009025, 5.796629,
-2.864431, 3.858525, -5.495522,
3.311306, 3.858525, -5.495522,
-2.864431, 3.858525, 5.796629,
3.311306, 3.858525, 5.796629,
3.311306, -4.009025, -5.495522,
3.311306, 3.858525, -5.495522,
3.311306, -4.009025, 5.796629,
3.311306, 3.858525, 5.796629,
3.311306, -4.009025, -5.495522,
3.311306, -4.009025, 5.796629,
3.311306, 3.858525, -5.495522,
3.311306, 3.858525, 5.796629
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
var radius = 8.054983;
var distance = 35.83753;
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
mvMatrix.translate( -0.2234372, 0.07525015, -0.1505537 );
mvMatrix.scale( 1.410229, 1.106978, 0.7712618 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.83753);
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
m-phenoxybenzyl_alco<-read.table("m-phenoxybenzyl_alco.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-m-phenoxybenzyl_alco$V2
```

```
## Error in eval(expr, envir, enclos): object 'm' not found
```

```r
y<-m-phenoxybenzyl_alco$V3
```

```
## Error in eval(expr, envir, enclos): object 'm' not found
```

```r
z<-m-phenoxybenzyl_alco$V4
```

```
## Error in eval(expr, envir, enclos): object 'm' not found
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
-2.774493, 0.405748, -0.4045631, 0, 0, 1, 1, 1,
-2.602592, 1.330639, 0.145838, 1, 0, 0, 1, 1,
-2.591903, -1.721078, -2.354913, 1, 0, 0, 1, 1,
-2.534381, -0.1550016, -1.278388, 1, 0, 0, 1, 1,
-2.507403, 0.2979226, -0.273894, 1, 0, 0, 1, 1,
-2.4402, -1.248797, -2.147259, 1, 0, 0, 1, 1,
-2.394387, 1.341371, -1.583954, 0, 0, 0, 1, 1,
-2.361127, -0.6124895, -0.3040234, 0, 0, 0, 1, 1,
-2.341796, 1.288632, -0.3913567, 0, 0, 0, 1, 1,
-2.332602, 1.470844, -0.3307028, 0, 0, 0, 1, 1,
-2.263948, 1.290893, -1.162091, 0, 0, 0, 1, 1,
-2.24759, -0.1110064, -0.8939595, 0, 0, 0, 1, 1,
-2.239175, -0.6060415, -0.6085758, 0, 0, 0, 1, 1,
-2.225992, 0.6409354, -2.519851, 1, 1, 1, 1, 1,
-2.175364, -0.2496799, -0.4853436, 1, 1, 1, 1, 1,
-2.129581, 1.039114, -0.7534914, 1, 1, 1, 1, 1,
-2.113624, 0.6419489, 0.05456831, 1, 1, 1, 1, 1,
-2.0982, 0.2993535, -2.138027, 1, 1, 1, 1, 1,
-2.087793, -0.4357285, -2.778786, 1, 1, 1, 1, 1,
-2.07773, -0.1891749, -1.358755, 1, 1, 1, 1, 1,
-2.053969, 0.1761455, -0.379234, 1, 1, 1, 1, 1,
-2.031914, 1.035658, -1.148374, 1, 1, 1, 1, 1,
-2.006177, 0.5158812, -1.539208, 1, 1, 1, 1, 1,
-1.962891, 1.038543, -1.567662, 1, 1, 1, 1, 1,
-1.958261, -0.5451671, -1.61217, 1, 1, 1, 1, 1,
-1.929852, -1.162779, -0.8318721, 1, 1, 1, 1, 1,
-1.908777, -2.016287, -3.106124, 1, 1, 1, 1, 1,
-1.891955, -0.1208722, -2.566229, 1, 1, 1, 1, 1,
-1.872301, 0.3887836, 0.2535238, 0, 0, 1, 1, 1,
-1.867625, 0.2347991, -1.444781, 1, 0, 0, 1, 1,
-1.843305, 1.605776, -0.06608304, 1, 0, 0, 1, 1,
-1.842818, -0.3233538, -2.752609, 1, 0, 0, 1, 1,
-1.831463, -0.1124226, -0.4810792, 1, 0, 0, 1, 1,
-1.827944, -0.649921, -0.6960651, 1, 0, 0, 1, 1,
-1.804582, 1.101753, -0.2551881, 0, 0, 0, 1, 1,
-1.787811, -0.2248828, -2.012483, 0, 0, 0, 1, 1,
-1.787507, -0.5390739, -1.027272, 0, 0, 0, 1, 1,
-1.784071, -0.8475838, -1.319773, 0, 0, 0, 1, 1,
-1.752427, -0.7475401, -3.431245, 0, 0, 0, 1, 1,
-1.737554, 0.5125369, -0.4154734, 0, 0, 0, 1, 1,
-1.730955, 0.4086507, -1.610353, 0, 0, 0, 1, 1,
-1.707832, -1.301553, -4.81538, 1, 1, 1, 1, 1,
-1.671974, -1.373266, -0.7653059, 1, 1, 1, 1, 1,
-1.668934, -0.1794819, -1.489582, 1, 1, 1, 1, 1,
-1.657003, -0.5881621, -2.459013, 1, 1, 1, 1, 1,
-1.652443, 0.2356142, -1.668367, 1, 1, 1, 1, 1,
-1.649138, 1.02178, -1.439122, 1, 1, 1, 1, 1,
-1.629714, -1.271135, -1.386615, 1, 1, 1, 1, 1,
-1.61076, 0.9278509, -1.674564, 1, 1, 1, 1, 1,
-1.600765, -0.01618581, -1.739653, 1, 1, 1, 1, 1,
-1.596899, 1.333921, 0.741132, 1, 1, 1, 1, 1,
-1.596524, 0.5740017, -1.363217, 1, 1, 1, 1, 1,
-1.578928, 0.07312918, -3.125386, 1, 1, 1, 1, 1,
-1.576052, 0.1769545, -1.921461, 1, 1, 1, 1, 1,
-1.569316, 0.8480466, -0.9136463, 1, 1, 1, 1, 1,
-1.567224, -0.4080677, -2.532225, 1, 1, 1, 1, 1,
-1.559774, -0.2618628, -1.769422, 0, 0, 1, 1, 1,
-1.549764, -0.1453432, -1.989808, 1, 0, 0, 1, 1,
-1.547668, 0.3313621, -0.9109222, 1, 0, 0, 1, 1,
-1.539126, -0.06578361, -1.041593, 1, 0, 0, 1, 1,
-1.530626, 0.05014199, -0.7592012, 1, 0, 0, 1, 1,
-1.528091, 0.4371004, -0.2271912, 1, 0, 0, 1, 1,
-1.523303, 0.7515365, -1.201402, 0, 0, 0, 1, 1,
-1.484601, -0.2938891, -2.390987, 0, 0, 0, 1, 1,
-1.483794, 0.4621239, -1.505831, 0, 0, 0, 1, 1,
-1.465414, -0.2966568, -1.695162, 0, 0, 0, 1, 1,
-1.464106, -0.1939344, -0.02306026, 0, 0, 0, 1, 1,
-1.462048, -1.613846, -2.543816, 0, 0, 0, 1, 1,
-1.455641, -0.6583769, -2.324004, 0, 0, 0, 1, 1,
-1.445035, -1.14618, -2.803535, 1, 1, 1, 1, 1,
-1.435696, 1.145648, -1.458867, 1, 1, 1, 1, 1,
-1.421681, -1.220596, -2.275935, 1, 1, 1, 1, 1,
-1.420603, 0.2808291, -1.081651, 1, 1, 1, 1, 1,
-1.384883, -0.2914801, -1.585831, 1, 1, 1, 1, 1,
-1.367457, -1.07372, -2.059681, 1, 1, 1, 1, 1,
-1.36691, -1.095664, -2.75907, 1, 1, 1, 1, 1,
-1.355501, -0.3807992, -1.788539, 1, 1, 1, 1, 1,
-1.34644, 1.447825, -0.807285, 1, 1, 1, 1, 1,
-1.335169, 2.69159, -1.531909, 1, 1, 1, 1, 1,
-1.326846, 0.3262354, -0.7991104, 1, 1, 1, 1, 1,
-1.316746, -0.7074441, -1.250621, 1, 1, 1, 1, 1,
-1.316489, -0.8407894, -2.996698, 1, 1, 1, 1, 1,
-1.315655, 0.3239354, -0.414221, 1, 1, 1, 1, 1,
-1.312249, -0.320793, -2.260839, 1, 1, 1, 1, 1,
-1.311942, -0.8427529, -1.799921, 0, 0, 1, 1, 1,
-1.309828, -0.693813, -1.01124, 1, 0, 0, 1, 1,
-1.30074, 1.182509, 0.6172649, 1, 0, 0, 1, 1,
-1.300051, -0.546236, -3.280568, 1, 0, 0, 1, 1,
-1.296721, -0.08626507, 0.09999578, 1, 0, 0, 1, 1,
-1.29539, 0.3947636, -2.61679, 1, 0, 0, 1, 1,
-1.292991, -0.6403732, -3.516937, 0, 0, 0, 1, 1,
-1.283338, -1.962356, -1.517013, 0, 0, 0, 1, 1,
-1.282399, -0.2106927, -1.115038, 0, 0, 0, 1, 1,
-1.278966, 1.386277, -3.116639, 0, 0, 0, 1, 1,
-1.264158, 1.410631, 1.110584, 0, 0, 0, 1, 1,
-1.253004, -1.693289, -1.231556, 0, 0, 0, 1, 1,
-1.252228, -0.1271665, -2.104312, 0, 0, 0, 1, 1,
-1.248352, 1.544443, -1.762516, 1, 1, 1, 1, 1,
-1.246397, 1.188514, -1.250743, 1, 1, 1, 1, 1,
-1.245302, 0.2710654, -1.326929, 1, 1, 1, 1, 1,
-1.236922, -1.065345, -0.435759, 1, 1, 1, 1, 1,
-1.236869, -0.5334461, -2.332657, 1, 1, 1, 1, 1,
-1.226135, -1.429876, -1.380096, 1, 1, 1, 1, 1,
-1.225582, -0.6683682, -0.7613835, 1, 1, 1, 1, 1,
-1.212113, -0.5816458, -2.852623, 1, 1, 1, 1, 1,
-1.196149, -1.32913, -3.391004, 1, 1, 1, 1, 1,
-1.195245, -1.602014, -2.928496, 1, 1, 1, 1, 1,
-1.1926, -0.1399757, -2.515896, 1, 1, 1, 1, 1,
-1.191979, 0.5076733, 0.5581818, 1, 1, 1, 1, 1,
-1.188691, 0.8309983, -1.154949, 1, 1, 1, 1, 1,
-1.186322, -0.4800738, -2.420489, 1, 1, 1, 1, 1,
-1.170974, 2.103042, -0.492025, 1, 1, 1, 1, 1,
-1.169286, 1.154173, 0.002008147, 0, 0, 1, 1, 1,
-1.167389, -0.8523127, -3.273999, 1, 0, 0, 1, 1,
-1.16047, -0.351991, -1.292351, 1, 0, 0, 1, 1,
-1.15264, -0.02765302, -0.6750187, 1, 0, 0, 1, 1,
-1.147811, -0.5804141, -2.219264, 1, 0, 0, 1, 1,
-1.137336, -1.61426, -2.485725, 1, 0, 0, 1, 1,
-1.135414, -0.1003551, -1.391864, 0, 0, 0, 1, 1,
-1.133049, 0.3572045, -2.144675, 0, 0, 0, 1, 1,
-1.124122, 0.9395591, -1.526076, 0, 0, 0, 1, 1,
-1.123376, 0.4808066, -2.142278, 0, 0, 0, 1, 1,
-1.121963, -3.432642, -2.261767, 0, 0, 0, 1, 1,
-1.118737, -0.2994689, -2.42208, 0, 0, 0, 1, 1,
-1.113231, -0.4678105, -3.684652, 0, 0, 0, 1, 1,
-1.112867, 0.6008491, -1.557725, 1, 1, 1, 1, 1,
-1.11107, 0.9548234, -1.392083, 1, 1, 1, 1, 1,
-1.105038, 0.537518, -1.409413, 1, 1, 1, 1, 1,
-1.089653, 1.001177, -0.8333347, 1, 1, 1, 1, 1,
-1.088068, 0.7368336, -0.6323351, 1, 1, 1, 1, 1,
-1.077036, 0.08341704, -2.487668, 1, 1, 1, 1, 1,
-1.076154, -0.346409, -2.867537, 1, 1, 1, 1, 1,
-1.073248, 0.8661518, -0.1675117, 1, 1, 1, 1, 1,
-1.073149, -0.7699137, -3.226626, 1, 1, 1, 1, 1,
-1.059864, -0.6998079, -2.236081, 1, 1, 1, 1, 1,
-1.058474, -1.23759, -2.333089, 1, 1, 1, 1, 1,
-1.056211, 0.7017616, -1.263564, 1, 1, 1, 1, 1,
-1.050545, -1.478014, -1.591938, 1, 1, 1, 1, 1,
-1.049316, 2.364559, -1.717627, 1, 1, 1, 1, 1,
-1.04392, 1.358266, -0.3583492, 1, 1, 1, 1, 1,
-1.040221, -1.131522, -2.908814, 0, 0, 1, 1, 1,
-1.034877, 0.01235181, -0.6592599, 1, 0, 0, 1, 1,
-1.029253, -1.219524, -3.023488, 1, 0, 0, 1, 1,
-1.022878, 0.03929016, -2.459188, 1, 0, 0, 1, 1,
-1.005226, -0.660025, -1.736431, 1, 0, 0, 1, 1,
-1.003498, 1.797142, -1.456337, 1, 0, 0, 1, 1,
-0.9932478, -0.5768965, -2.430367, 0, 0, 0, 1, 1,
-0.9907157, 1.231598, -0.1342129, 0, 0, 0, 1, 1,
-0.9890319, 1.01235, 0.7332007, 0, 0, 0, 1, 1,
-0.9884163, -1.014588, -2.338917, 0, 0, 0, 1, 1,
-0.9838084, 0.006308401, -2.060165, 0, 0, 0, 1, 1,
-0.9836394, -0.07494773, -1.49149, 0, 0, 0, 1, 1,
-0.9809477, 0.9200031, -0.9088599, 0, 0, 0, 1, 1,
-0.9773404, 0.354653, -1.42859, 1, 1, 1, 1, 1,
-0.9761984, -0.5593638, -2.037052, 1, 1, 1, 1, 1,
-0.9723526, -0.2154826, -1.030226, 1, 1, 1, 1, 1,
-0.9678274, -1.027664, -1.345003, 1, 1, 1, 1, 1,
-0.9669276, 1.120579, -0.0192638, 1, 1, 1, 1, 1,
-0.96207, 1.433558, 1.274606, 1, 1, 1, 1, 1,
-0.9605485, 1.016993, -0.5342442, 1, 1, 1, 1, 1,
-0.9587657, 2.207085, -3.093906, 1, 1, 1, 1, 1,
-0.9553171, 0.2943985, -0.8676652, 1, 1, 1, 1, 1,
-0.9478037, 0.07170505, -1.455794, 1, 1, 1, 1, 1,
-0.9445691, 1.158225, -1.179265, 1, 1, 1, 1, 1,
-0.942111, -0.3289279, -3.720773, 1, 1, 1, 1, 1,
-0.9335099, 0.6608317, -0.1572771, 1, 1, 1, 1, 1,
-0.9261681, -2.439299, -1.310578, 1, 1, 1, 1, 1,
-0.9199615, 0.7118114, -1.824336, 1, 1, 1, 1, 1,
-0.902227, -0.9835276, -1.594284, 0, 0, 1, 1, 1,
-0.9022083, 1.793562, -0.6971214, 1, 0, 0, 1, 1,
-0.9007911, -0.3363172, -1.112502, 1, 0, 0, 1, 1,
-0.9005536, -0.1649198, -1.468184, 1, 0, 0, 1, 1,
-0.9001516, 0.255682, -1.37438, 1, 0, 0, 1, 1,
-0.8988356, 0.0612838, -0.5995508, 1, 0, 0, 1, 1,
-0.888864, 1.600684, -1.063396, 0, 0, 0, 1, 1,
-0.8766506, 1.80273, -0.6234646, 0, 0, 0, 1, 1,
-0.8750361, -0.0680703, -1.375482, 0, 0, 0, 1, 1,
-0.8704159, 0.3283831, -1.552518, 0, 0, 0, 1, 1,
-0.8652017, -0.05047332, -1.751602, 0, 0, 0, 1, 1,
-0.8598295, -1.529172, -1.576507, 0, 0, 0, 1, 1,
-0.859227, 0.8693293, 0.0586449, 0, 0, 0, 1, 1,
-0.8557671, 0.1481147, -0.58573, 1, 1, 1, 1, 1,
-0.8553609, 0.2443323, -1.586702, 1, 1, 1, 1, 1,
-0.8509139, 1.416091, 0.5366651, 1, 1, 1, 1, 1,
-0.848933, 0.1904215, -0.5054752, 1, 1, 1, 1, 1,
-0.8487512, -0.4566712, -3.325963, 1, 1, 1, 1, 1,
-0.8465864, 0.8497195, -0.4791006, 1, 1, 1, 1, 1,
-0.8422304, 0.3034489, -0.9847608, 1, 1, 1, 1, 1,
-0.8355125, -0.2723579, -0.7034919, 1, 1, 1, 1, 1,
-0.8341011, -1.672914, -2.459868, 1, 1, 1, 1, 1,
-0.8304296, 1.406036, -0.2780106, 1, 1, 1, 1, 1,
-0.8290657, 0.2440996, -1.962293, 1, 1, 1, 1, 1,
-0.8269738, 0.1419898, -0.8018669, 1, 1, 1, 1, 1,
-0.8261377, 0.9770518, -2.399168, 1, 1, 1, 1, 1,
-0.8255678, -0.6927221, -1.426946, 1, 1, 1, 1, 1,
-0.8218313, -0.2870871, -2.353048, 1, 1, 1, 1, 1,
-0.8120946, -0.04505697, -1.319307, 0, 0, 1, 1, 1,
-0.8056031, -1.311676, -3.603449, 1, 0, 0, 1, 1,
-0.8025181, -1.201935, -2.579894, 1, 0, 0, 1, 1,
-0.793369, -1.233744, -1.71086, 1, 0, 0, 1, 1,
-0.7929226, -1.529966, -2.681495, 1, 0, 0, 1, 1,
-0.7752512, 0.5844561, -1.868456, 1, 0, 0, 1, 1,
-0.7744273, 1.005986, -1.717191, 0, 0, 0, 1, 1,
-0.7736079, -1.179791, -2.748546, 0, 0, 0, 1, 1,
-0.7697632, 0.177871, -1.32867, 0, 0, 0, 1, 1,
-0.7679361, -1.149726, -2.99955, 0, 0, 0, 1, 1,
-0.7669851, 0.02965734, -1.821572, 0, 0, 0, 1, 1,
-0.7628111, 0.4568211, -1.083137, 0, 0, 0, 1, 1,
-0.7591096, -1.367888, -1.826887, 0, 0, 0, 1, 1,
-0.7587577, -1.554813, -4.478586, 1, 1, 1, 1, 1,
-0.7569945, 0.08582707, -1.743803, 1, 1, 1, 1, 1,
-0.7476979, 1.135927, -0.5990981, 1, 1, 1, 1, 1,
-0.7439198, 0.1397801, -2.150957, 1, 1, 1, 1, 1,
-0.736255, 0.1906254, -1.86733, 1, 1, 1, 1, 1,
-0.7352194, -0.0804121, -0.09184746, 1, 1, 1, 1, 1,
-0.7333947, -0.1812144, -2.316567, 1, 1, 1, 1, 1,
-0.7320892, -1.636415, -1.166543, 1, 1, 1, 1, 1,
-0.7293208, 0.9574832, -1.659831, 1, 1, 1, 1, 1,
-0.7254304, 0.03026241, -2.501209, 1, 1, 1, 1, 1,
-0.7243093, -0.4097983, -4.089974, 1, 1, 1, 1, 1,
-0.7198101, 0.004888113, -1.525286, 1, 1, 1, 1, 1,
-0.7178646, -0.5793688, -2.940911, 1, 1, 1, 1, 1,
-0.7120818, -0.4749875, -0.46461, 1, 1, 1, 1, 1,
-0.7094767, -0.3888274, -2.596869, 1, 1, 1, 1, 1,
-0.7091201, -1.137773, -2.313296, 0, 0, 1, 1, 1,
-0.7058697, 0.6558999, -1.505088, 1, 0, 0, 1, 1,
-0.7039086, 0.2259234, -2.636097, 1, 0, 0, 1, 1,
-0.7011586, 1.250318, 0.9199474, 1, 0, 0, 1, 1,
-0.6991524, -0.2105995, -3.193037, 1, 0, 0, 1, 1,
-0.6932382, -1.053499, -3.104603, 1, 0, 0, 1, 1,
-0.6928871, 0.1067695, 0.384674, 0, 0, 0, 1, 1,
-0.6901268, 0.5452077, 0.9036977, 0, 0, 0, 1, 1,
-0.6837265, -1.032727, -2.590438, 0, 0, 0, 1, 1,
-0.6817633, 0.1506791, -1.590934, 0, 0, 0, 1, 1,
-0.6731822, 0.04395672, 0.5344463, 0, 0, 0, 1, 1,
-0.6731737, 1.029869, -0.5740924, 0, 0, 0, 1, 1,
-0.6704072, -0.551141, -3.380019, 0, 0, 0, 1, 1,
-0.666505, 0.07861497, -3.256893, 1, 1, 1, 1, 1,
-0.6664052, 0.4793886, -1.145999, 1, 1, 1, 1, 1,
-0.6651014, 0.006783923, -2.445181, 1, 1, 1, 1, 1,
-0.6608329, -0.03748932, -1.83895, 1, 1, 1, 1, 1,
-0.6601344, 0.4779166, -1.595016, 1, 1, 1, 1, 1,
-0.6582197, 1.3722, -1.690264, 1, 1, 1, 1, 1,
-0.653289, 1.482157, 0.1102381, 1, 1, 1, 1, 1,
-0.6523896, 0.2448961, -1.509649, 1, 1, 1, 1, 1,
-0.6493962, 0.6468277, -0.4422422, 1, 1, 1, 1, 1,
-0.6489366, -0.8498561, -3.074006, 1, 1, 1, 1, 1,
-0.6471025, 1.102276, -0.3120641, 1, 1, 1, 1, 1,
-0.6447183, 0.1202847, -0.9219192, 1, 1, 1, 1, 1,
-0.6424062, 0.2253035, -1.879735, 1, 1, 1, 1, 1,
-0.6404279, 0.4607026, -1.049413, 1, 1, 1, 1, 1,
-0.6395718, -1.073333, -1.571852, 1, 1, 1, 1, 1,
-0.6384929, 1.070429, 0.4852349, 0, 0, 1, 1, 1,
-0.6369129, -0.6121358, -2.781429, 1, 0, 0, 1, 1,
-0.6353311, -0.5571957, -1.572974, 1, 0, 0, 1, 1,
-0.6328349, 2.598804, -0.2895407, 1, 0, 0, 1, 1,
-0.6306231, -1.183419, -1.097974, 1, 0, 0, 1, 1,
-0.6244159, 0.5052315, -2.381481, 1, 0, 0, 1, 1,
-0.6134419, 0.6976871, -2.015379, 0, 0, 0, 1, 1,
-0.6117456, 1.205919, 0.4546334, 0, 0, 0, 1, 1,
-0.6084646, -0.3187269, -1.562302, 0, 0, 0, 1, 1,
-0.6075109, 1.883919, -0.2797728, 0, 0, 0, 1, 1,
-0.6004921, -0.6171132, -1.007428, 0, 0, 0, 1, 1,
-0.5989165, 0.7651852, -1.123043, 0, 0, 0, 1, 1,
-0.5972062, -0.132814, -1.080993, 0, 0, 0, 1, 1,
-0.5914671, -1.114879, -2.694051, 1, 1, 1, 1, 1,
-0.5804688, 1.364248, -0.9769443, 1, 1, 1, 1, 1,
-0.5785893, -0.4376169, -3.090588, 1, 1, 1, 1, 1,
-0.5769144, -0.4457101, -1.9711, 1, 1, 1, 1, 1,
-0.571813, -1.706208, -3.147095, 1, 1, 1, 1, 1,
-0.5696115, 0.2894731, -1.995499, 1, 1, 1, 1, 1,
-0.5672704, -0.5191403, -0.6427082, 1, 1, 1, 1, 1,
-0.5653596, -0.3979812, -1.943769, 1, 1, 1, 1, 1,
-0.563575, -1.263048, -0.4605946, 1, 1, 1, 1, 1,
-0.557671, 0.8917524, 1.025274, 1, 1, 1, 1, 1,
-0.5553244, 0.3429081, -2.411571, 1, 1, 1, 1, 1,
-0.5524685, 0.3458444, 1.094111, 1, 1, 1, 1, 1,
-0.5508468, 0.1204972, -1.252078, 1, 1, 1, 1, 1,
-0.5496108, -0.9078376, -2.840226, 1, 1, 1, 1, 1,
-0.5454599, -2.408088, -3.35075, 1, 1, 1, 1, 1,
-0.5450473, -0.6591669, -2.534224, 0, 0, 1, 1, 1,
-0.5436156, 1.105619, -2.898856, 1, 0, 0, 1, 1,
-0.5415247, 0.1192611, -0.8499137, 1, 0, 0, 1, 1,
-0.5386201, 0.2700961, -2.65031, 1, 0, 0, 1, 1,
-0.5349901, 1.277078, 0.6585933, 1, 0, 0, 1, 1,
-0.5346096, 1.410142, 0.5509844, 1, 0, 0, 1, 1,
-0.5315633, -0.6197376, -4.179102, 0, 0, 0, 1, 1,
-0.5306953, -0.9888127, -2.209948, 0, 0, 0, 1, 1,
-0.5297667, -0.57311, -2.872391, 0, 0, 0, 1, 1,
-0.5235712, 0.1160493, -2.685723, 0, 0, 0, 1, 1,
-0.5192575, -0.4232633, -2.986327, 0, 0, 0, 1, 1,
-0.5148164, -0.4918201, -2.528866, 0, 0, 0, 1, 1,
-0.5130942, -0.01094063, -1.283413, 0, 0, 0, 1, 1,
-0.5118646, -0.3266734, -1.760377, 1, 1, 1, 1, 1,
-0.5111105, -0.8733184, -2.307469, 1, 1, 1, 1, 1,
-0.505978, 0.6563433, -0.3788225, 1, 1, 1, 1, 1,
-0.4999782, 0.521201, -0.2558074, 1, 1, 1, 1, 1,
-0.499885, -1.35603, -1.633033, 1, 1, 1, 1, 1,
-0.4992406, 1.443579, 0.2644923, 1, 1, 1, 1, 1,
-0.4949408, -0.9698905, -3.298437, 1, 1, 1, 1, 1,
-0.4942905, 0.01946056, -0.5227326, 1, 1, 1, 1, 1,
-0.4917141, 0.08330318, -2.992897, 1, 1, 1, 1, 1,
-0.486647, 0.4518232, -1.437982, 1, 1, 1, 1, 1,
-0.4846339, -1.638668, -0.921441, 1, 1, 1, 1, 1,
-0.4813595, 0.6443969, -0.3627227, 1, 1, 1, 1, 1,
-0.4776498, 0.03916933, -3.900939, 1, 1, 1, 1, 1,
-0.4770935, 0.3514434, -1.892104, 1, 1, 1, 1, 1,
-0.4738609, 0.2941439, -1.041442, 1, 1, 1, 1, 1,
-0.4731157, 1.472528, 0.6286455, 0, 0, 1, 1, 1,
-0.4712818, -0.3109928, -1.523877, 1, 0, 0, 1, 1,
-0.4703108, -0.4271718, -2.315005, 1, 0, 0, 1, 1,
-0.4673877, 0.1113826, 1.409233, 1, 0, 0, 1, 1,
-0.4658259, 1.182174, -1.812813, 1, 0, 0, 1, 1,
-0.4630479, 1.136761, -0.4749105, 1, 0, 0, 1, 1,
-0.4627616, -0.0952919, -1.029742, 0, 0, 0, 1, 1,
-0.4578144, -0.2029901, 0.5753878, 0, 0, 0, 1, 1,
-0.456316, -1.201868, -0.1969006, 0, 0, 0, 1, 1,
-0.4457589, 0.5605045, 0.03705493, 0, 0, 0, 1, 1,
-0.444657, -0.5269799, -3.052801, 0, 0, 0, 1, 1,
-0.4410962, 1.123602, -0.6866539, 0, 0, 0, 1, 1,
-0.4399384, -0.5640225, -1.915751, 0, 0, 0, 1, 1,
-0.4385085, 0.791144, -0.004648888, 1, 1, 1, 1, 1,
-0.436645, -1.412309, -2.563648, 1, 1, 1, 1, 1,
-0.43558, 0.3851156, -0.1545196, 1, 1, 1, 1, 1,
-0.4343449, -0.3844452, -2.991114, 1, 1, 1, 1, 1,
-0.4308331, -0.7000604, -2.086748, 1, 1, 1, 1, 1,
-0.4303516, 0.8798141, -0.9424657, 1, 1, 1, 1, 1,
-0.4236048, -1.259022, -4.106532, 1, 1, 1, 1, 1,
-0.4189124, -1.254648, -2.491698, 1, 1, 1, 1, 1,
-0.4143798, 1.069159, -1.363018, 1, 1, 1, 1, 1,
-0.4133214, -0.885437, -3.524264, 1, 1, 1, 1, 1,
-0.4108469, 1.538065, -0.8334424, 1, 1, 1, 1, 1,
-0.4105774, 0.8005747, 0.770913, 1, 1, 1, 1, 1,
-0.4099521, 2.02256, -1.03888, 1, 1, 1, 1, 1,
-0.4088498, 1.060142, 1.073051, 1, 1, 1, 1, 1,
-0.4070156, -0.331953, -4.242124, 1, 1, 1, 1, 1,
-0.4050054, -0.5077931, -2.995024, 0, 0, 1, 1, 1,
-0.4024964, 0.03993549, -1.042057, 1, 0, 0, 1, 1,
-0.4004069, 0.01441354, -0.5183415, 1, 0, 0, 1, 1,
-0.3956621, 1.209302, 0.475437, 1, 0, 0, 1, 1,
-0.3950975, 0.2765387, -0.9372352, 1, 0, 0, 1, 1,
-0.3943141, 0.1688129, -1.726961, 1, 0, 0, 1, 1,
-0.3922701, -1.133071, -2.178547, 0, 0, 0, 1, 1,
-0.3859768, 0.8283991, 0.9381672, 0, 0, 0, 1, 1,
-0.3818798, -0.4450082, -4.909942, 0, 0, 0, 1, 1,
-0.381261, -1.556312, -3.179631, 0, 0, 0, 1, 1,
-0.3787426, -0.6889296, -3.506436, 0, 0, 0, 1, 1,
-0.377675, -1.90159, -3.534616, 0, 0, 0, 1, 1,
-0.3773402, 1.099527, -0.3917343, 0, 0, 0, 1, 1,
-0.3732157, -1.432874, -2.098632, 1, 1, 1, 1, 1,
-0.3667078, 0.9291729, -0.1885415, 1, 1, 1, 1, 1,
-0.3663728, 0.3037411, -4.199316, 1, 1, 1, 1, 1,
-0.3635755, -0.4180382, -3.206256, 1, 1, 1, 1, 1,
-0.3581967, -1.229421, -3.712448, 1, 1, 1, 1, 1,
-0.3574018, 0.6989208, 0.9068432, 1, 1, 1, 1, 1,
-0.3563727, 0.7364849, -0.6475819, 1, 1, 1, 1, 1,
-0.3562528, -0.05926459, -2.61139, 1, 1, 1, 1, 1,
-0.3558834, 0.3526165, -0.5467042, 1, 1, 1, 1, 1,
-0.3556855, 0.04521651, -1.841842, 1, 1, 1, 1, 1,
-0.3548104, -0.3331117, -2.608035, 1, 1, 1, 1, 1,
-0.3547506, 0.6308992, -0.9911075, 1, 1, 1, 1, 1,
-0.3442877, 0.3706893, -1.165422, 1, 1, 1, 1, 1,
-0.3370457, 0.5173244, 0.1094301, 1, 1, 1, 1, 1,
-0.3278269, -0.2050807, -1.828056, 1, 1, 1, 1, 1,
-0.3249404, 0.05789443, -1.059247, 0, 0, 1, 1, 1,
-0.3233414, -0.5130218, -2.314405, 1, 0, 0, 1, 1,
-0.319345, -0.04657604, -2.044999, 1, 0, 0, 1, 1,
-0.3162224, -0.1448018, -2.235787, 1, 0, 0, 1, 1,
-0.3147214, -0.2872027, -1.183306, 1, 0, 0, 1, 1,
-0.3131976, 1.676006, 2.56852, 1, 0, 0, 1, 1,
-0.3115289, -0.2926339, -1.671503, 0, 0, 0, 1, 1,
-0.3109604, 0.6114516, -1.566687, 0, 0, 0, 1, 1,
-0.3089814, -0.01739426, -3.383619, 0, 0, 0, 1, 1,
-0.3086734, 1.255318, -0.7182643, 0, 0, 0, 1, 1,
-0.3059545, 0.2539905, 0.04456, 0, 0, 0, 1, 1,
-0.3050306, 1.38026, 1.297341, 0, 0, 0, 1, 1,
-0.3040026, -0.7253247, -2.914395, 0, 0, 0, 1, 1,
-0.3039654, 1.535838, -1.69597, 1, 1, 1, 1, 1,
-0.3010124, 2.341511, -0.7836373, 1, 1, 1, 1, 1,
-0.2983591, 0.04075626, -0.6935731, 1, 1, 1, 1, 1,
-0.2946405, -0.4301506, -4.179187, 1, 1, 1, 1, 1,
-0.2920056, 0.09655403, 0.6677231, 1, 1, 1, 1, 1,
-0.2917282, 0.5257623, 0.5524822, 1, 1, 1, 1, 1,
-0.289836, 0.07761893, 1.54623, 1, 1, 1, 1, 1,
-0.2841636, 0.5177619, -0.470212, 1, 1, 1, 1, 1,
-0.2840996, 1.900389, -0.9729602, 1, 1, 1, 1, 1,
-0.2827509, 0.10105, -1.886972, 1, 1, 1, 1, 1,
-0.2814963, -0.23257, -3.423873, 1, 1, 1, 1, 1,
-0.2811753, 0.577387, -0.06456933, 1, 1, 1, 1, 1,
-0.2811741, 0.6400209, 0.8313528, 1, 1, 1, 1, 1,
-0.2795885, -1.037134, -2.051626, 1, 1, 1, 1, 1,
-0.2793459, 0.03704791, -2.551172, 1, 1, 1, 1, 1,
-0.2789203, -1.083668, -3.618831, 0, 0, 1, 1, 1,
-0.2773766, -1.751588, -4.343599, 1, 0, 0, 1, 1,
-0.2757484, 0.1297015, -2.353552, 1, 0, 0, 1, 1,
-0.2745482, -0.8923734, -3.885859, 1, 0, 0, 1, 1,
-0.2693643, -0.05985933, -1.965273, 1, 0, 0, 1, 1,
-0.268233, 0.7679055, 0.9342091, 1, 0, 0, 1, 1,
-0.267206, -1.072984, -0.4092861, 0, 0, 0, 1, 1,
-0.2535693, -0.2881706, -2.23946, 0, 0, 0, 1, 1,
-0.253063, -0.3480054, -1.719534, 0, 0, 0, 1, 1,
-0.2521687, 0.4257078, -0.5460511, 0, 0, 0, 1, 1,
-0.2495984, 0.5065656, -0.9504395, 0, 0, 0, 1, 1,
-0.2463123, -0.2661633, -2.892759, 0, 0, 0, 1, 1,
-0.2460962, -0.5332168, -3.106299, 0, 0, 0, 1, 1,
-0.241572, 0.5751632, -0.1783742, 1, 1, 1, 1, 1,
-0.240477, -0.2568095, -2.440716, 1, 1, 1, 1, 1,
-0.2344865, 0.2556858, 1.047446, 1, 1, 1, 1, 1,
-0.2321586, -0.6680441, -2.975299, 1, 1, 1, 1, 1,
-0.2271899, 0.2954608, -1.610197, 1, 1, 1, 1, 1,
-0.2264399, 0.1179875, -0.5060297, 1, 1, 1, 1, 1,
-0.2250382, -0.5078772, -3.545291, 1, 1, 1, 1, 1,
-0.2224146, -1.784051, -3.563498, 1, 1, 1, 1, 1,
-0.2159708, 0.9391264, 0.06489743, 1, 1, 1, 1, 1,
-0.2126139, -0.5912381, -3.885433, 1, 1, 1, 1, 1,
-0.2112922, -1.526052, -2.137295, 1, 1, 1, 1, 1,
-0.2038566, -2.376961, -4.100467, 1, 1, 1, 1, 1,
-0.2019903, 0.2539947, 0.02956763, 1, 1, 1, 1, 1,
-0.194965, 1.326014, -0.5109766, 1, 1, 1, 1, 1,
-0.1915468, 1.1405, -0.6609314, 1, 1, 1, 1, 1,
-0.1889476, 0.7068778, -1.460325, 0, 0, 1, 1, 1,
-0.1880264, -1.746531, -3.548657, 1, 0, 0, 1, 1,
-0.1879691, -0.9191931, -4.346806, 1, 0, 0, 1, 1,
-0.1862375, 0.5385144, -2.353042, 1, 0, 0, 1, 1,
-0.1825773, 0.003591217, -2.684405, 1, 0, 0, 1, 1,
-0.1804546, -0.6517506, -2.695426, 1, 0, 0, 1, 1,
-0.1765306, -0.4279625, -2.876569, 0, 0, 0, 1, 1,
-0.1741488, 1.550501, 0.7924014, 0, 0, 0, 1, 1,
-0.1699259, -0.05104252, -2.402168, 0, 0, 0, 1, 1,
-0.1674429, 0.8187366, -0.1253514, 0, 0, 0, 1, 1,
-0.166631, -0.1464746, -2.275599, 0, 0, 0, 1, 1,
-0.1635903, 0.5115193, 0.1061422, 0, 0, 0, 1, 1,
-0.1608716, -0.5677499, -1.59577, 0, 0, 0, 1, 1,
-0.1583134, -0.5370432, -4.462393, 1, 1, 1, 1, 1,
-0.1563015, 1.166923, 1.506792, 1, 1, 1, 1, 1,
-0.1519935, -1.07849, -4.070391, 1, 1, 1, 1, 1,
-0.1509722, 1.113663, -1.782336, 1, 1, 1, 1, 1,
-0.140473, 0.7401918, -2.024418, 1, 1, 1, 1, 1,
-0.139201, 0.55286, -2.120383, 1, 1, 1, 1, 1,
-0.1377406, 0.9732528, -1.522087, 1, 1, 1, 1, 1,
-0.1363893, -0.2393615, -2.588432, 1, 1, 1, 1, 1,
-0.1334114, 0.5966108, -2.463099, 1, 1, 1, 1, 1,
-0.1250318, -0.5159716, -2.2695, 1, 1, 1, 1, 1,
-0.1221313, 0.04646757, -3.360252, 1, 1, 1, 1, 1,
-0.1209023, 0.965049, -1.332394, 1, 1, 1, 1, 1,
-0.1198491, 1.950626, -1.337852, 1, 1, 1, 1, 1,
-0.1190249, -1.383634, -4.645138, 1, 1, 1, 1, 1,
-0.1190001, -0.04106104, -2.911431, 1, 1, 1, 1, 1,
-0.1183158, -1.315171, -2.291258, 0, 0, 1, 1, 1,
-0.1175979, 1.172914, -1.267382, 1, 0, 0, 1, 1,
-0.1167791, -0.1755143, -1.184452, 1, 0, 0, 1, 1,
-0.1166863, -0.1764333, -1.24945, 1, 0, 0, 1, 1,
-0.1154766, 0.3147292, 0.5111458, 1, 0, 0, 1, 1,
-0.1126771, 0.02640484, -2.633914, 1, 0, 0, 1, 1,
-0.1119099, -0.1267674, -3.325742, 0, 0, 0, 1, 1,
-0.1110458, 0.2013049, -1.285578, 0, 0, 0, 1, 1,
-0.1103086, 0.3372634, 0.2408375, 0, 0, 0, 1, 1,
-0.1070621, 0.8458033, -1.180931, 0, 0, 0, 1, 1,
-0.106875, -0.05787932, -2.10205, 0, 0, 0, 1, 1,
-0.106676, -0.2226778, -0.4381241, 0, 0, 0, 1, 1,
-0.1035669, 1.061693, 0.6180127, 0, 0, 0, 1, 1,
-0.1014265, 0.4292893, -0.845863, 1, 1, 1, 1, 1,
-0.09905519, -1.449206, -4.036928, 1, 1, 1, 1, 1,
-0.09819031, 0.8533359, 1.245956, 1, 1, 1, 1, 1,
-0.09428106, -0.4297542, -2.164054, 1, 1, 1, 1, 1,
-0.08824196, 0.6050833, 0.2528204, 1, 1, 1, 1, 1,
-0.08760799, -0.681493, -3.765654, 1, 1, 1, 1, 1,
-0.08379898, -0.3751062, -4.847907, 1, 1, 1, 1, 1,
-0.06606872, -1.270627, -2.502387, 1, 1, 1, 1, 1,
-0.0635791, 1.028315, 0.06921674, 1, 1, 1, 1, 1,
-0.06128809, -0.7197438, -2.658186, 1, 1, 1, 1, 1,
-0.05907009, -0.4782196, -2.765133, 1, 1, 1, 1, 1,
-0.05774117, -1.445226, -1.798455, 1, 1, 1, 1, 1,
-0.05146136, -0.3663345, -3.190417, 1, 1, 1, 1, 1,
-0.05002949, 0.819951, 0.5227606, 1, 1, 1, 1, 1,
-0.04504294, 0.1019589, 0.7098444, 1, 1, 1, 1, 1,
-0.04274853, 1.669137, 1.336536, 0, 0, 1, 1, 1,
-0.0421346, 0.9104323, 1.330726, 1, 0, 0, 1, 1,
-0.04100734, 1.324764, 1.726674, 1, 0, 0, 1, 1,
-0.03934047, -0.06707929, -5.331073, 1, 0, 0, 1, 1,
-0.03811835, 0.4495813, -1.25653, 1, 0, 0, 1, 1,
-0.03317318, 1.407048, 0.4108468, 1, 0, 0, 1, 1,
-0.02952771, -0.9617575, -2.095885, 0, 0, 0, 1, 1,
-0.02577596, -2.15502, -2.696002, 0, 0, 0, 1, 1,
-0.02277219, 0.5096107, -0.7010288, 0, 0, 0, 1, 1,
-0.02076478, -0.284647, -3.203024, 0, 0, 0, 1, 1,
-0.02047939, -0.3190583, -3.843014, 0, 0, 0, 1, 1,
-0.01323107, -0.1999143, -2.080202, 0, 0, 0, 1, 1,
-0.0127249, 0.8225579, 0.5709018, 0, 0, 0, 1, 1,
-0.005446206, 0.8107176, 1.656138, 1, 1, 1, 1, 1,
-0.002314235, 0.02524829, -1.818558, 1, 1, 1, 1, 1,
-0.001528467, 0.7429416, 0.3046093, 1, 1, 1, 1, 1,
0.001317882, 1.034564, -0.377102, 1, 1, 1, 1, 1,
0.004651346, 0.3111437, 1.220144, 1, 1, 1, 1, 1,
0.005887012, 0.03760007, 1.841429, 1, 1, 1, 1, 1,
0.007907663, -0.6913823, 2.961779, 1, 1, 1, 1, 1,
0.01550815, 0.3773238, -0.6436567, 1, 1, 1, 1, 1,
0.0169377, -1.569731, 3.031018, 1, 1, 1, 1, 1,
0.0317019, 1.453518, -0.8027641, 1, 1, 1, 1, 1,
0.03237711, 0.3447408, 1.27239, 1, 1, 1, 1, 1,
0.0330482, -0.4706392, 3.253362, 1, 1, 1, 1, 1,
0.0349893, -1.788376, 3.27445, 1, 1, 1, 1, 1,
0.03637581, 0.01205488, 0.5989358, 1, 1, 1, 1, 1,
0.03704209, -1.913721, 3.054856, 1, 1, 1, 1, 1,
0.0371437, -1.057289, 3.698786, 0, 0, 1, 1, 1,
0.03853387, -2.698993, 2.692002, 1, 0, 0, 1, 1,
0.03866788, 1.109735, 0.4627349, 1, 0, 0, 1, 1,
0.04398891, 0.8238961, -0.003651979, 1, 0, 0, 1, 1,
0.04557826, 0.6848221, -1.989333, 1, 0, 0, 1, 1,
0.04618914, 0.4595501, -0.2436765, 1, 0, 0, 1, 1,
0.04637288, 0.2552673, -0.02408011, 0, 0, 0, 1, 1,
0.04733124, 1.769296, -1.419502, 0, 0, 0, 1, 1,
0.04751387, -1.883235, 3.513588, 0, 0, 0, 1, 1,
0.04942706, 1.050112, -0.6458499, 0, 0, 0, 1, 1,
0.04979791, -0.7214477, 2.143826, 0, 0, 0, 1, 1,
0.05364821, -0.3902876, 2.785528, 0, 0, 0, 1, 1,
0.05408624, 0.6554073, -0.2110143, 0, 0, 0, 1, 1,
0.05690766, 1.02439, 1.737299, 1, 1, 1, 1, 1,
0.05848854, 0.2846675, 2.35977, 1, 1, 1, 1, 1,
0.05972181, -0.05007382, 1.62124, 1, 1, 1, 1, 1,
0.06086522, 0.8629803, -1.056538, 1, 1, 1, 1, 1,
0.06786077, 0.8097414, 0.3446007, 1, 1, 1, 1, 1,
0.07153285, 0.4953208, -0.3725143, 1, 1, 1, 1, 1,
0.07642366, 0.9731554, 0.06543644, 1, 1, 1, 1, 1,
0.07655471, -1.627282, 1.618965, 1, 1, 1, 1, 1,
0.07691953, 1.064645, 0.7382166, 1, 1, 1, 1, 1,
0.07785685, -1.733976, 4.101816, 1, 1, 1, 1, 1,
0.08109145, -0.2957206, 4.349786, 1, 1, 1, 1, 1,
0.09862179, 1.378344, 1.263596, 1, 1, 1, 1, 1,
0.09956255, -0.8848215, 2.945882, 1, 1, 1, 1, 1,
0.1086916, -0.8329251, 2.919592, 1, 1, 1, 1, 1,
0.1148512, 0.4505956, 0.9884462, 1, 1, 1, 1, 1,
0.1151411, 0.5608851, 1.18859, 0, 0, 1, 1, 1,
0.1157523, -1.885261, 2.336983, 1, 0, 0, 1, 1,
0.1176246, -0.7482526, 2.841198, 1, 0, 0, 1, 1,
0.1206555, -1.217006, 1.948133, 1, 0, 0, 1, 1,
0.1212172, -0.03863972, 1.701296, 1, 0, 0, 1, 1,
0.1218207, 0.3818087, -0.2286749, 1, 0, 0, 1, 1,
0.1289692, 0.4229341, -1.683291, 0, 0, 0, 1, 1,
0.1297473, 0.8163895, 0.5657673, 0, 0, 0, 1, 1,
0.1333675, -0.2574524, 4.347896, 0, 0, 0, 1, 1,
0.136893, 0.5755792, 1.623018, 0, 0, 0, 1, 1,
0.137376, 0.8576323, 1.69895, 0, 0, 0, 1, 1,
0.1428806, -1.528399, 2.192644, 0, 0, 0, 1, 1,
0.156388, 1.061338, 0.427413, 0, 0, 0, 1, 1,
0.1577843, -0.15863, 1.56235, 1, 1, 1, 1, 1,
0.1590627, -1.420099, 3.758612, 1, 1, 1, 1, 1,
0.1596215, -0.6776677, 2.777681, 1, 1, 1, 1, 1,
0.1596866, 0.2706822, 1.944653, 1, 1, 1, 1, 1,
0.1650217, -0.8488391, 4.178348, 1, 1, 1, 1, 1,
0.1664997, -0.03914803, 2.525761, 1, 1, 1, 1, 1,
0.1682381, 1.030831, -0.6421205, 1, 1, 1, 1, 1,
0.1699434, 0.07080763, 0.5903643, 1, 1, 1, 1, 1,
0.1749632, -0.5034946, 1.279866, 1, 1, 1, 1, 1,
0.1761048, 0.6375999, 0.04129142, 1, 1, 1, 1, 1,
0.179478, -0.7177299, 3.957934, 1, 1, 1, 1, 1,
0.179749, 0.3257948, 0.3356123, 1, 1, 1, 1, 1,
0.1800532, -0.5714268, 2.211599, 1, 1, 1, 1, 1,
0.1821322, -0.5858198, 3.348641, 1, 1, 1, 1, 1,
0.1869579, -0.247561, 3.101294, 1, 1, 1, 1, 1,
0.1929272, 0.5312139, 0.1655679, 0, 0, 1, 1, 1,
0.1961348, -1.097386, 1.805893, 1, 0, 0, 1, 1,
0.2010524, -0.6104062, 3.816189, 1, 0, 0, 1, 1,
0.2023443, -1.567509, 2.70998, 1, 0, 0, 1, 1,
0.2078477, 0.0001132187, 1.02208, 1, 0, 0, 1, 1,
0.2100637, -1.437495, 3.013221, 1, 0, 0, 1, 1,
0.2201902, 0.2723693, 0.5119821, 0, 0, 0, 1, 1,
0.2283619, -0.5327218, 3.404118, 0, 0, 0, 1, 1,
0.2306982, 1.946305, 1.940824, 0, 0, 0, 1, 1,
0.2311967, 0.169356, -0.6445891, 0, 0, 0, 1, 1,
0.2323911, -0.5027525, 2.845, 0, 0, 0, 1, 1,
0.2337267, 0.4844904, 1.744036, 0, 0, 0, 1, 1,
0.2338296, 1.168916, -0.5037695, 0, 0, 0, 1, 1,
0.2344813, -0.04248213, 3.199325, 1, 1, 1, 1, 1,
0.234957, 0.3228343, -0.8794467, 1, 1, 1, 1, 1,
0.236665, -0.636449, 2.79953, 1, 1, 1, 1, 1,
0.237022, -1.176072, 1.802722, 1, 1, 1, 1, 1,
0.2400931, 1.391122, -1.067226, 1, 1, 1, 1, 1,
0.2436386, 0.1239308, 2.684969, 1, 1, 1, 1, 1,
0.2449408, 0.3108702, 2.197554, 1, 1, 1, 1, 1,
0.2479666, 0.6147153, -0.01593994, 1, 1, 1, 1, 1,
0.2487866, -0.5866169, 1.998941, 1, 1, 1, 1, 1,
0.2513692, 0.2676973, 1.883649, 1, 1, 1, 1, 1,
0.2531916, -0.8133534, 2.794448, 1, 1, 1, 1, 1,
0.2540622, 1.798233, 0.4877192, 1, 1, 1, 1, 1,
0.2603931, 0.6725284, -0.1779863, 1, 1, 1, 1, 1,
0.2621181, 1.23043, -0.2301809, 1, 1, 1, 1, 1,
0.2637519, 1.746839, -0.8823677, 1, 1, 1, 1, 1,
0.2668809, -0.6477355, 3.46329, 0, 0, 1, 1, 1,
0.2684067, 0.5910843, 0.9095532, 1, 0, 0, 1, 1,
0.270465, 1.103763, -0.0007202421, 1, 0, 0, 1, 1,
0.2705725, 1.034389, 0.04546462, 1, 0, 0, 1, 1,
0.2726901, -0.9709831, 1.826124, 1, 0, 0, 1, 1,
0.273239, -1.352024, 4.033551, 1, 0, 0, 1, 1,
0.2757968, -0.7306874, 3.550103, 0, 0, 0, 1, 1,
0.2766127, -1.407565, 0.668993, 0, 0, 0, 1, 1,
0.2771364, 0.4146618, 0.5296384, 0, 0, 0, 1, 1,
0.2783152, 0.1995852, 0.587932, 0, 0, 0, 1, 1,
0.2796906, 0.6684752, 0.3704826, 0, 0, 0, 1, 1,
0.2823816, 0.1528451, 1.317448, 0, 0, 0, 1, 1,
0.2848022, 0.2979971, 2.316185, 0, 0, 0, 1, 1,
0.2861492, -0.2674222, 4.2789, 1, 1, 1, 1, 1,
0.2914282, 0.8474338, 1.782649, 1, 1, 1, 1, 1,
0.2923885, 0.3947126, 0.07967003, 1, 1, 1, 1, 1,
0.2925031, -0.05617068, 1.647059, 1, 1, 1, 1, 1,
0.2928517, 0.1484081, 2.04638, 1, 1, 1, 1, 1,
0.2967534, 0.4765065, -0.9273055, 1, 1, 1, 1, 1,
0.2983144, -0.3881255, 3.112763, 1, 1, 1, 1, 1,
0.2995281, 0.6096065, -0.1119019, 1, 1, 1, 1, 1,
0.304476, 0.6392906, 1.335281, 1, 1, 1, 1, 1,
0.3059961, -1.137337, 3.471875, 1, 1, 1, 1, 1,
0.3070019, -0.6121181, 3.789607, 1, 1, 1, 1, 1,
0.3096314, -0.925472, 3.641205, 1, 1, 1, 1, 1,
0.3100171, 0.1412039, 1.75358, 1, 1, 1, 1, 1,
0.3121014, 0.05571635, 0.8699304, 1, 1, 1, 1, 1,
0.3123928, -1.419783, 4.283125, 1, 1, 1, 1, 1,
0.3130273, -0.7749403, 1.793692, 0, 0, 1, 1, 1,
0.3171052, -0.5051546, 2.773422, 1, 0, 0, 1, 1,
0.3190675, 0.4215441, 0.7902522, 1, 0, 0, 1, 1,
0.3193135, 0.2854603, 0.04570968, 1, 0, 0, 1, 1,
0.3193348, -0.9011948, 3.796497, 1, 0, 0, 1, 1,
0.3196932, 0.7068938, 2.742297, 1, 0, 0, 1, 1,
0.3197831, -0.6207622, 3.278037, 0, 0, 0, 1, 1,
0.320363, -1.634493, 3.176393, 0, 0, 0, 1, 1,
0.3234955, 0.8832954, 2.379239, 0, 0, 0, 1, 1,
0.3238889, -0.618619, 3.909886, 0, 0, 0, 1, 1,
0.3243576, -0.9507511, 1.244606, 0, 0, 0, 1, 1,
0.3340963, 0.7785657, 1.874719, 0, 0, 0, 1, 1,
0.3371855, 0.1938402, 0.2910465, 0, 0, 0, 1, 1,
0.3418621, -0.7173331, 3.369819, 1, 1, 1, 1, 1,
0.3419186, 0.6619618, 1.228985, 1, 1, 1, 1, 1,
0.3420442, -0.02239411, 2.909146, 1, 1, 1, 1, 1,
0.3426566, 0.6817353, 1.826529, 1, 1, 1, 1, 1,
0.3481275, -0.6115157, 3.048213, 1, 1, 1, 1, 1,
0.3483886, -1.048092, 1.891643, 1, 1, 1, 1, 1,
0.3486559, 1.187022, 0.1324545, 1, 1, 1, 1, 1,
0.3492688, -3.109906, 3.740752, 1, 1, 1, 1, 1,
0.3500149, -2.730729, 1.755604, 1, 1, 1, 1, 1,
0.3513524, 1.289161, 1.520565, 1, 1, 1, 1, 1,
0.3555899, 1.177647, 1.61365, 1, 1, 1, 1, 1,
0.3575012, -1.500912, 3.167572, 1, 1, 1, 1, 1,
0.3597945, 0.7260567, 0.4651415, 1, 1, 1, 1, 1,
0.3618376, -0.418333, 3.036748, 1, 1, 1, 1, 1,
0.3678318, 1.327198, -0.8375497, 1, 1, 1, 1, 1,
0.3685485, -0.1094368, 0.4024671, 0, 0, 1, 1, 1,
0.3689481, 0.008290228, 1.083401, 1, 0, 0, 1, 1,
0.3691551, 1.132985, 0.5543534, 1, 0, 0, 1, 1,
0.3706219, 1.503848, -1.432756, 1, 0, 0, 1, 1,
0.3726543, -1.66708, 1.722523, 1, 0, 0, 1, 1,
0.3741118, -1.27679, 2.619161, 1, 0, 0, 1, 1,
0.3757478, 0.04566799, 1.396112, 0, 0, 0, 1, 1,
0.376707, -0.1567445, 1.50056, 0, 0, 0, 1, 1,
0.3768534, -0.2077818, 1.276626, 0, 0, 0, 1, 1,
0.3852182, 0.1346759, -0.0008843906, 0, 0, 0, 1, 1,
0.389449, -0.2989536, 4.065702, 0, 0, 0, 1, 1,
0.3956363, 0.3461911, 0.02472579, 0, 0, 0, 1, 1,
0.3959846, 0.2487557, -0.06779496, 0, 0, 0, 1, 1,
0.3974913, 1.96265, 0.9473482, 1, 1, 1, 1, 1,
0.3981772, 0.09238721, 3.005218, 1, 1, 1, 1, 1,
0.4002399, 0.5434875, 0.9358793, 1, 1, 1, 1, 1,
0.4008912, 0.4311431, 0.8616955, 1, 1, 1, 1, 1,
0.404518, 0.2188807, 1.543101, 1, 1, 1, 1, 1,
0.4069217, 0.8129907, 1.333103, 1, 1, 1, 1, 1,
0.4089859, -3.894449, 2.069685, 1, 1, 1, 1, 1,
0.4113089, 1.493308, 0.184322, 1, 1, 1, 1, 1,
0.4116426, 0.8203869, 0.4322131, 1, 1, 1, 1, 1,
0.4130266, -0.3029618, 0.4858826, 1, 1, 1, 1, 1,
0.4135731, 0.5522159, 2.211599, 1, 1, 1, 1, 1,
0.4167308, 0.1401782, 0.9481786, 1, 1, 1, 1, 1,
0.4182178, -0.6086646, 1.337513, 1, 1, 1, 1, 1,
0.4189128, 0.9930161, -0.8312149, 1, 1, 1, 1, 1,
0.4194474, 0.4667708, 1.89768, 1, 1, 1, 1, 1,
0.4203676, 0.9915889, 2.596152, 0, 0, 1, 1, 1,
0.423585, 0.6986723, 1.940978, 1, 0, 0, 1, 1,
0.42375, -0.7187164, 2.322922, 1, 0, 0, 1, 1,
0.4241012, 0.5000589, 0.5058525, 1, 0, 0, 1, 1,
0.4243036, 0.8253216, 0.6933736, 1, 0, 0, 1, 1,
0.4263209, 0.2255808, -0.5027938, 1, 0, 0, 1, 1,
0.4290458, 1.873953, -1.570237, 0, 0, 0, 1, 1,
0.4291087, 0.6992031, 0.7578679, 0, 0, 0, 1, 1,
0.4291569, -0.4219258, 1.517662, 0, 0, 0, 1, 1,
0.431107, 0.09632588, 1.074333, 0, 0, 0, 1, 1,
0.4357516, -0.7695439, 2.241102, 0, 0, 0, 1, 1,
0.4456965, -0.2720595, 0.5687585, 0, 0, 0, 1, 1,
0.4486932, 0.2920955, 0.1811398, 0, 0, 0, 1, 1,
0.4490381, -0.8775195, 2.805837, 1, 1, 1, 1, 1,
0.4496416, 1.000999, 1.625298, 1, 1, 1, 1, 1,
0.4499437, 0.4040636, 0.5481294, 1, 1, 1, 1, 1,
0.4508884, -0.91369, 2.739578, 1, 1, 1, 1, 1,
0.4525481, 0.7508081, 0.09226717, 1, 1, 1, 1, 1,
0.4530301, -0.9235685, 3.00436, 1, 1, 1, 1, 1,
0.4534431, 0.6275054, 1.73052, 1, 1, 1, 1, 1,
0.4539125, 0.3037711, 2.406643, 1, 1, 1, 1, 1,
0.4579171, -0.9198827, -0.005421306, 1, 1, 1, 1, 1,
0.4592652, 0.2747592, 2.153128, 1, 1, 1, 1, 1,
0.4619951, 0.5339561, 1.622663, 1, 1, 1, 1, 1,
0.4631781, 1.922412, 0.1613496, 1, 1, 1, 1, 1,
0.4715033, -0.6559204, 1.944476, 1, 1, 1, 1, 1,
0.4725817, -1.061515, 2.556181, 1, 1, 1, 1, 1,
0.4755807, -0.09441158, 3.487582, 1, 1, 1, 1, 1,
0.476699, 0.5419098, -0.2437969, 0, 0, 1, 1, 1,
0.4807663, 0.08144892, 2.655119, 1, 0, 0, 1, 1,
0.4850971, 0.6438908, 2.366534, 1, 0, 0, 1, 1,
0.4853913, -0.2967251, 1.254618, 1, 0, 0, 1, 1,
0.4894972, -1.122178, 1.725672, 1, 0, 0, 1, 1,
0.4939546, -1.355678, 1.852488, 1, 0, 0, 1, 1,
0.4944025, -1.80757, 1.034631, 0, 0, 0, 1, 1,
0.4961097, -0.763651, 2.908985, 0, 0, 0, 1, 1,
0.4973105, 1.239141, 0.1115578, 0, 0, 0, 1, 1,
0.4974983, -0.8356895, 2.052751, 0, 0, 0, 1, 1,
0.4984014, 2.036233, 1.150573, 0, 0, 0, 1, 1,
0.4998851, 0.02203029, 2.061666, 0, 0, 0, 1, 1,
0.5082344, -0.1889848, 0.8638893, 0, 0, 0, 1, 1,
0.5120278, -0.8160326, 2.393687, 1, 1, 1, 1, 1,
0.5229852, -1.295988, 3.310902, 1, 1, 1, 1, 1,
0.5253572, 2.245804, -1.635538, 1, 1, 1, 1, 1,
0.5331521, 1.034075, 0.4551648, 1, 1, 1, 1, 1,
0.5334145, 0.4087384, 0.7208428, 1, 1, 1, 1, 1,
0.5339559, 0.3677722, 0.5621629, 1, 1, 1, 1, 1,
0.5407789, 0.6833535, -1.260801, 1, 1, 1, 1, 1,
0.5434018, -0.2126011, 1.76297, 1, 1, 1, 1, 1,
0.5490167, -0.005409468, 2.58889, 1, 1, 1, 1, 1,
0.5518916, 0.347834, -0.2285972, 1, 1, 1, 1, 1,
0.5562441, -0.1804702, 2.714547, 1, 1, 1, 1, 1,
0.5575572, 0.7713445, 0.5351372, 1, 1, 1, 1, 1,
0.5609209, -0.354322, 3.528512, 1, 1, 1, 1, 1,
0.5630064, 0.5096188, 0.2929677, 1, 1, 1, 1, 1,
0.5632739, 1.301956, -0.1168048, 1, 1, 1, 1, 1,
0.5708609, -1.467358, 2.760196, 0, 0, 1, 1, 1,
0.5736528, -2.586192, 3.404466, 1, 0, 0, 1, 1,
0.577414, -0.4058919, 1.369917, 1, 0, 0, 1, 1,
0.5840029, -0.8224272, 2.997138, 1, 0, 0, 1, 1,
0.5933296, 0.2530372, 3.013522, 1, 0, 0, 1, 1,
0.5961309, 0.7335793, -0.09057565, 1, 0, 0, 1, 1,
0.5983571, -0.4717275, 3.761752, 0, 0, 0, 1, 1,
0.5984636, 1.27562, -0.6331448, 0, 0, 0, 1, 1,
0.5993319, -0.563138, 5.632181, 0, 0, 0, 1, 1,
0.5996261, 1.860196, 0.6573521, 0, 0, 0, 1, 1,
0.6012953, -0.7629402, 2.681958, 0, 0, 0, 1, 1,
0.6024222, 0.5325047, -0.1127121, 0, 0, 0, 1, 1,
0.6090938, 1.711717, 1.4134, 0, 0, 0, 1, 1,
0.6137717, -0.9789158, 3.9552, 1, 1, 1, 1, 1,
0.6148868, -0.9453952, 3.585051, 1, 1, 1, 1, 1,
0.6197415, -0.278662, 3.141365, 1, 1, 1, 1, 1,
0.6247406, -0.4313959, 0.4636246, 1, 1, 1, 1, 1,
0.6255286, 0.110647, 0.9469449, 1, 1, 1, 1, 1,
0.6262756, 0.7203216, -0.1522869, 1, 1, 1, 1, 1,
0.6316643, -1.055687, 5.280383, 1, 1, 1, 1, 1,
0.6358297, 0.6639755, 1.122817, 1, 1, 1, 1, 1,
0.6380988, -1.395265, 3.624595, 1, 1, 1, 1, 1,
0.6420097, 0.1624302, 1.116628, 1, 1, 1, 1, 1,
0.6422283, 0.3478595, 1.019346, 1, 1, 1, 1, 1,
0.6445477, 0.06732068, 1.706583, 1, 1, 1, 1, 1,
0.6504708, -0.5677301, 2.246513, 1, 1, 1, 1, 1,
0.6540664, -0.7932649, 3.174707, 1, 1, 1, 1, 1,
0.6542371, -1.006294, 2.011746, 1, 1, 1, 1, 1,
0.6555815, -0.7762486, 0.6717151, 0, 0, 1, 1, 1,
0.6566023, 0.04923171, 2.472319, 1, 0, 0, 1, 1,
0.6588036, -1.297344, 1.48504, 1, 0, 0, 1, 1,
0.6589775, 1.22779, -0.5857347, 1, 0, 0, 1, 1,
0.6625794, 0.4196862, -0.330307, 1, 0, 0, 1, 1,
0.6639532, -0.3825445, 1.148154, 1, 0, 0, 1, 1,
0.6734368, -0.9268923, 1.702401, 0, 0, 0, 1, 1,
0.6778246, 0.3983575, 1.043119, 0, 0, 0, 1, 1,
0.6830649, 1.047929, -0.07266289, 0, 0, 0, 1, 1,
0.6963493, 0.03926642, 1.611623, 0, 0, 0, 1, 1,
0.6963661, -0.7010835, 3.504251, 0, 0, 0, 1, 1,
0.696754, 0.3389512, 2.135957, 0, 0, 0, 1, 1,
0.6970091, -1.149224, 4.722695, 0, 0, 0, 1, 1,
0.6971431, 0.6165203, 1.940323, 1, 1, 1, 1, 1,
0.6971836, 0.197908, 2.26698, 1, 1, 1, 1, 1,
0.6988772, 0.4526869, 1.527393, 1, 1, 1, 1, 1,
0.699188, 0.3819353, 0.1635837, 1, 1, 1, 1, 1,
0.6999584, 3.743949, 1.751338, 1, 1, 1, 1, 1,
0.7010152, 0.455196, 0.886526, 1, 1, 1, 1, 1,
0.7025491, 1.08517, 1.43997, 1, 1, 1, 1, 1,
0.7026105, -1.00343, 3.184716, 1, 1, 1, 1, 1,
0.7027781, -0.4188802, 1.247886, 1, 1, 1, 1, 1,
0.7032047, -0.395715, 0.5382555, 1, 1, 1, 1, 1,
0.7036389, -0.5935175, 2.205536, 1, 1, 1, 1, 1,
0.7101148, -0.3848689, 2.180374, 1, 1, 1, 1, 1,
0.710541, -0.6577066, 1.884695, 1, 1, 1, 1, 1,
0.7161961, 1.536737, 0.5721623, 1, 1, 1, 1, 1,
0.7225097, 0.919274, 1.828998, 1, 1, 1, 1, 1,
0.7312316, -1.807198, 3.41891, 0, 0, 1, 1, 1,
0.7402599, -0.3656284, 3.524972, 1, 0, 0, 1, 1,
0.744472, 0.6841539, -0.6967396, 1, 0, 0, 1, 1,
0.7514387, -0.9415424, -0.09426239, 1, 0, 0, 1, 1,
0.754197, -1.27475, 1.208941, 1, 0, 0, 1, 1,
0.7595207, 0.9613281, 2.364569, 1, 0, 0, 1, 1,
0.7600306, 0.4328012, 0.3658576, 0, 0, 0, 1, 1,
0.7771946, 0.05331538, 1.33594, 0, 0, 0, 1, 1,
0.7838282, -1.340146, 2.748444, 0, 0, 0, 1, 1,
0.7877269, 0.5581549, -0.09124988, 0, 0, 0, 1, 1,
0.8016053, 0.3996017, 1.336148, 0, 0, 0, 1, 1,
0.8032427, -1.063399, 3.585901, 0, 0, 0, 1, 1,
0.8075454, 0.04593721, 2.125966, 0, 0, 0, 1, 1,
0.8082917, 0.6029006, -0.6484205, 1, 1, 1, 1, 1,
0.8186491, -1.523677, 0.7427565, 1, 1, 1, 1, 1,
0.8267512, -0.5228291, 3.367998, 1, 1, 1, 1, 1,
0.8277056, 0.2199941, 1.64124, 1, 1, 1, 1, 1,
0.8310028, -0.2908957, 0.597774, 1, 1, 1, 1, 1,
0.8340064, -1.455361, 2.147642, 1, 1, 1, 1, 1,
0.8375142, -0.74652, 2.018916, 1, 1, 1, 1, 1,
0.8453978, 0.4817291, 0.382131, 1, 1, 1, 1, 1,
0.8540128, 0.7470837, 0.9751341, 1, 1, 1, 1, 1,
0.8566091, 0.4135149, 0.6549565, 1, 1, 1, 1, 1,
0.8605211, 1.105047, 0.4699104, 1, 1, 1, 1, 1,
0.8631468, 0.3533109, 1.586378, 1, 1, 1, 1, 1,
0.8724859, -2.057601, 1.534621, 1, 1, 1, 1, 1,
0.877477, -0.1692773, 1.42202, 1, 1, 1, 1, 1,
0.8781796, 0.6368152, 0.3976662, 1, 1, 1, 1, 1,
0.8893928, 0.01884427, 0.5035856, 0, 0, 1, 1, 1,
0.8907487, -0.1439693, 1.213104, 1, 0, 0, 1, 1,
0.8933901, -1.05767, 3.816359, 1, 0, 0, 1, 1,
0.9025047, 1.259012, -0.355887, 1, 0, 0, 1, 1,
0.9071714, -0.07890207, 1.534346, 1, 0, 0, 1, 1,
0.9105163, -1.561326, 1.456344, 1, 0, 0, 1, 1,
0.9146862, -0.8837779, 0.6734835, 0, 0, 0, 1, 1,
0.9185649, 1.166557, 2.468816, 0, 0, 0, 1, 1,
0.9200519, 0.08345792, 2.066662, 0, 0, 0, 1, 1,
0.9203704, -1.314622, 1.60479, 0, 0, 0, 1, 1,
0.924196, -1.6772, 3.897761, 0, 0, 0, 1, 1,
0.9280485, 0.3099778, 1.17708, 0, 0, 0, 1, 1,
0.9336247, 0.3485855, 0.9647647, 0, 0, 0, 1, 1,
0.9404258, -0.7631318, 2.398004, 1, 1, 1, 1, 1,
0.9407599, 1.411489, -0.3163815, 1, 1, 1, 1, 1,
0.9423428, 0.2201745, 1.631903, 1, 1, 1, 1, 1,
0.9451284, 0.1427279, 3.101732, 1, 1, 1, 1, 1,
0.9525189, -2.260756, 3.78477, 1, 1, 1, 1, 1,
0.9540904, 0.5957608, 2.407891, 1, 1, 1, 1, 1,
0.9564661, -1.325147, 3.573701, 1, 1, 1, 1, 1,
0.9641359, -0.1288412, 1.601537, 1, 1, 1, 1, 1,
0.9687417, -0.1981674, 2.60515, 1, 1, 1, 1, 1,
0.9723276, -0.2544416, 2.616248, 1, 1, 1, 1, 1,
0.9803759, 1.614809, -0.4743917, 1, 1, 1, 1, 1,
0.9803979, 2.601906, -0.3759206, 1, 1, 1, 1, 1,
0.9847685, -0.2109727, 1.440185, 1, 1, 1, 1, 1,
0.9861206, -1.660261, 1.543439, 1, 1, 1, 1, 1,
0.9872207, 0.9288832, -0.9578995, 1, 1, 1, 1, 1,
0.9962737, -0.6019073, 3.686589, 0, 0, 1, 1, 1,
1.000057, -1.628539, 4.209587, 1, 0, 0, 1, 1,
1.002478, 0.4976083, 2.026445, 1, 0, 0, 1, 1,
1.004896, 0.9534339, -0.7839548, 1, 0, 0, 1, 1,
1.01013, 0.5263277, -0.285247, 1, 0, 0, 1, 1,
1.014914, -0.06941308, 0.6414636, 1, 0, 0, 1, 1,
1.027113, -0.3884618, 0.7740885, 0, 0, 0, 1, 1,
1.033098, -0.4676122, 0.1870317, 0, 0, 0, 1, 1,
1.033257, -0.3576977, 1.977969, 0, 0, 0, 1, 1,
1.036312, -0.927642, 0.7415594, 0, 0, 0, 1, 1,
1.047076, 0.9537044, -0.2924786, 0, 0, 0, 1, 1,
1.050633, -0.6754581, 0.5880917, 0, 0, 0, 1, 1,
1.051295, 0.5732032, -0.09993897, 0, 0, 0, 1, 1,
1.056892, -0.2708395, 1.762126, 1, 1, 1, 1, 1,
1.065465, -0.5433844, 1.308626, 1, 1, 1, 1, 1,
1.069792, 0.1157364, 1.090636, 1, 1, 1, 1, 1,
1.076506, -1.663201, 2.08701, 1, 1, 1, 1, 1,
1.082948, 0.4594835, -0.1084968, 1, 1, 1, 1, 1,
1.088247, 0.7151043, 0.891436, 1, 1, 1, 1, 1,
1.091029, 1.294269, 1.232783, 1, 1, 1, 1, 1,
1.097546, 1.063114, 0.8073867, 1, 1, 1, 1, 1,
1.099622, -0.7282523, 2.440456, 1, 1, 1, 1, 1,
1.105268, 0.7689131, 1.297831, 1, 1, 1, 1, 1,
1.108242, -1.168226, 2.227217, 1, 1, 1, 1, 1,
1.112102, -1.939079, 3.081252, 1, 1, 1, 1, 1,
1.122767, 0.2586278, 0.3118504, 1, 1, 1, 1, 1,
1.125253, -1.25826, 2.672323, 1, 1, 1, 1, 1,
1.125887, -1.748754, 2.945225, 1, 1, 1, 1, 1,
1.126033, 0.5088229, -0.5902639, 0, 0, 1, 1, 1,
1.13074, -0.4243598, 1.15212, 1, 0, 0, 1, 1,
1.132252, 1.38842, 0.7055152, 1, 0, 0, 1, 1,
1.139373, 0.7323467, 0.391372, 1, 0, 0, 1, 1,
1.14009, -1.398163, 3.122674, 1, 0, 0, 1, 1,
1.149986, -0.513557, -0.03333703, 1, 0, 0, 1, 1,
1.157764, -1.000657, 1.729147, 0, 0, 0, 1, 1,
1.158509, 2.65426, -0.06085599, 0, 0, 0, 1, 1,
1.160507, 1.26026, 1.465014, 0, 0, 0, 1, 1,
1.16055, 0.4599835, 0.3110224, 0, 0, 0, 1, 1,
1.165342, -1.136372, 2.569776, 0, 0, 0, 1, 1,
1.171728, -0.7805105, 2.62675, 0, 0, 0, 1, 1,
1.17753, 0.3048127, 1.129985, 0, 0, 0, 1, 1,
1.179332, -0.3328912, 1.657731, 1, 1, 1, 1, 1,
1.179653, -0.6219929, 1.573651, 1, 1, 1, 1, 1,
1.181561, 0.7933611, 1.922732, 1, 1, 1, 1, 1,
1.184433, 0.7859529, 0.5389087, 1, 1, 1, 1, 1,
1.185603, 1.041476, 0.8989182, 1, 1, 1, 1, 1,
1.193647, -1.165646, 2.547509, 1, 1, 1, 1, 1,
1.194709, -0.8884201, 2.091256, 1, 1, 1, 1, 1,
1.195713, 1.636636, 0.5125364, 1, 1, 1, 1, 1,
1.203625, -0.6207013, 2.213116, 1, 1, 1, 1, 1,
1.217726, -0.9188219, 1.908938, 1, 1, 1, 1, 1,
1.218446, -0.751301, 2.903982, 1, 1, 1, 1, 1,
1.218755, 0.7611839, 0.7405921, 1, 1, 1, 1, 1,
1.230695, 0.1651507, 2.220466, 1, 1, 1, 1, 1,
1.232865, -0.3764879, 1.316092, 1, 1, 1, 1, 1,
1.242662, 0.9536343, 1.599582, 1, 1, 1, 1, 1,
1.243621, -1.727282, 3.350126, 0, 0, 1, 1, 1,
1.244826, 0.09612763, 1.415774, 1, 0, 0, 1, 1,
1.249976, -0.03788812, 2.201994, 1, 0, 0, 1, 1,
1.256921, 0.1320284, 3.408774, 1, 0, 0, 1, 1,
1.274116, 1.665062, 0.3777187, 1, 0, 0, 1, 1,
1.276074, 0.2269528, 0.2915194, 1, 0, 0, 1, 1,
1.278289, -0.3513406, 2.21634, 0, 0, 0, 1, 1,
1.293381, -0.07524789, 2.713403, 0, 0, 0, 1, 1,
1.298343, -1.828511, 2.121873, 0, 0, 0, 1, 1,
1.299586, 0.7773803, 2.181566, 0, 0, 0, 1, 1,
1.310294, -0.1403901, 0.8266637, 0, 0, 0, 1, 1,
1.311511, -1.227247, 2.94275, 0, 0, 0, 1, 1,
1.312895, 0.5953568, 1.325902, 0, 0, 0, 1, 1,
1.315088, -1.324188, 1.609408, 1, 1, 1, 1, 1,
1.318346, 0.9541077, 0.5695276, 1, 1, 1, 1, 1,
1.322428, -0.4980484, 3.084371, 1, 1, 1, 1, 1,
1.324037, 0.009873109, 2.3428, 1, 1, 1, 1, 1,
1.324301, 2.184417, 1.583447, 1, 1, 1, 1, 1,
1.357642, 1.064584, 1.135694, 1, 1, 1, 1, 1,
1.369592, -0.2690789, 2.79921, 1, 1, 1, 1, 1,
1.375795, -0.7856598, 1.783528, 1, 1, 1, 1, 1,
1.388402, 1.691372, 0.4789387, 1, 1, 1, 1, 1,
1.394593, -0.3057905, 1.481834, 1, 1, 1, 1, 1,
1.398033, 0.05766841, 1.395047, 1, 1, 1, 1, 1,
1.413029, -0.2216059, 2.259156, 1, 1, 1, 1, 1,
1.420955, 0.1047037, 1.488816, 1, 1, 1, 1, 1,
1.422991, -1.134174, 2.099056, 1, 1, 1, 1, 1,
1.437019, -1.363101, 2.420096, 1, 1, 1, 1, 1,
1.437118, 1.728677, -1.092301, 0, 0, 1, 1, 1,
1.438551, -0.2922979, 2.189123, 1, 0, 0, 1, 1,
1.449553, -1.815877, 2.374945, 1, 0, 0, 1, 1,
1.450434, 0.1455363, 1.776996, 1, 0, 0, 1, 1,
1.452115, 0.07557461, -0.005917653, 1, 0, 0, 1, 1,
1.455846, -0.991554, 1.654678, 1, 0, 0, 1, 1,
1.463297, 0.154316, 0.7617676, 0, 0, 0, 1, 1,
1.467944, -0.8379972, 2.638924, 0, 0, 0, 1, 1,
1.468165, 1.435433, 2.025726, 0, 0, 0, 1, 1,
1.482905, 0.4145661, 3.001033, 0, 0, 0, 1, 1,
1.485341, 1.866948, 1.510207, 0, 0, 0, 1, 1,
1.542448, 0.2721093, 2.724305, 0, 0, 0, 1, 1,
1.543366, 0.6607113, 1.937482, 0, 0, 0, 1, 1,
1.555793, 0.5476183, 0.9365727, 1, 1, 1, 1, 1,
1.577575, -0.8335363, 3.242433, 1, 1, 1, 1, 1,
1.578705, 0.9804223, 1.237746, 1, 1, 1, 1, 1,
1.610936, -0.912395, 0.4034247, 1, 1, 1, 1, 1,
1.614833, -1.461255, 2.70815, 1, 1, 1, 1, 1,
1.619443, -0.454392, 1.825723, 1, 1, 1, 1, 1,
1.633875, -1.390897, 0.6167544, 1, 1, 1, 1, 1,
1.671828, 0.04340013, 0.5811528, 1, 1, 1, 1, 1,
1.672262, -0.3847433, 1.683892, 1, 1, 1, 1, 1,
1.672446, 0.2271667, 2.124076, 1, 1, 1, 1, 1,
1.681401, -1.129024, 2.977139, 1, 1, 1, 1, 1,
1.682044, -1.30861, 1.369403, 1, 1, 1, 1, 1,
1.685329, 1.463974, 2.173595, 1, 1, 1, 1, 1,
1.69559, 1.04809, 1.193338, 1, 1, 1, 1, 1,
1.71924, -0.0401166, 1.108379, 1, 1, 1, 1, 1,
1.723364, 0.4495679, 3.269987, 0, 0, 1, 1, 1,
1.755596, 1.223917, 0.9025351, 1, 0, 0, 1, 1,
1.808229, -0.3872691, 2.901341, 1, 0, 0, 1, 1,
1.816693, -0.2984106, 0.9593189, 1, 0, 0, 1, 1,
1.820726, -0.657343, 1.501887, 1, 0, 0, 1, 1,
1.878252, -0.8614107, 3.502441, 1, 0, 0, 1, 1,
1.883713, 0.1553413, -0.2862179, 0, 0, 0, 1, 1,
1.912404, -1.60272, 2.470216, 0, 0, 0, 1, 1,
1.913023, -0.554478, 2.261601, 0, 0, 0, 1, 1,
1.926713, 1.086073, 1.524539, 0, 0, 0, 1, 1,
1.9295, -0.6956877, 2.863532, 0, 0, 0, 1, 1,
1.940917, -0.598478, 0.2290704, 0, 0, 0, 1, 1,
1.944993, -1.456879, 0.7200776, 0, 0, 0, 1, 1,
1.94864, 1.550381, -1.847127, 1, 1, 1, 1, 1,
1.976661, 1.270232, 2.666959, 1, 1, 1, 1, 1,
1.990634, -0.9851933, 2.300619, 1, 1, 1, 1, 1,
1.991559, 0.1109444, 2.191467, 1, 1, 1, 1, 1,
1.997303, -0.2628603, 1.471108, 1, 1, 1, 1, 1,
2.071919, -1.008349, 1.600043, 1, 1, 1, 1, 1,
2.081015, 0.9241987, 0.4956654, 1, 1, 1, 1, 1,
2.115579, 1.962408, 1.906644, 1, 1, 1, 1, 1,
2.125882, -0.7755491, 1.257881, 1, 1, 1, 1, 1,
2.141685, -0.2687752, 4.325506, 1, 1, 1, 1, 1,
2.14849, 0.6159137, 0.2180787, 1, 1, 1, 1, 1,
2.154094, -0.9730772, 2.439852, 1, 1, 1, 1, 1,
2.164363, -0.1128228, 2.586349, 1, 1, 1, 1, 1,
2.17667, -0.3178478, -0.1419217, 1, 1, 1, 1, 1,
2.264029, -1.142847, 2.291703, 1, 1, 1, 1, 1,
2.294029, -0.9011644, 3.848245, 0, 0, 1, 1, 1,
2.31379, -0.862242, 0.1788836, 1, 0, 0, 1, 1,
2.339698, -0.976418, 0.4470588, 1, 0, 0, 1, 1,
2.37074, -0.88672, 1.656217, 1, 0, 0, 1, 1,
2.377682, 0.4864995, 1.530221, 1, 0, 0, 1, 1,
2.405975, -0.07399173, 0.001755199, 1, 0, 0, 1, 1,
2.429895, 0.5440921, 1.325064, 0, 0, 0, 1, 1,
2.474842, -3.480769, 3.26762, 0, 0, 0, 1, 1,
2.560409, 0.4474329, 0.2580506, 0, 0, 0, 1, 1,
2.570001, -0.05806868, 0.3360926, 0, 0, 0, 1, 1,
2.582433, 0.2879713, 0.5294397, 0, 0, 0, 1, 1,
2.590117, 0.01773826, 2.927521, 0, 0, 0, 1, 1,
2.628908, -0.3338901, 1.780166, 0, 0, 0, 1, 1,
2.637044, 0.03521008, 1.434338, 1, 1, 1, 1, 1,
2.747277, -1.403827, 2.45907, 1, 1, 1, 1, 1,
2.758209, -0.6322316, 2.370181, 1, 1, 1, 1, 1,
2.767454, -0.2452021, 3.061451, 1, 1, 1, 1, 1,
2.822442, -0.8732192, 1.677418, 1, 1, 1, 1, 1,
2.973326, -0.1131091, 0.5012799, 1, 1, 1, 1, 1,
3.221368, 0.9000537, 1.248021, 1, 1, 1, 1, 1
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
var radius = 9.913412;
var distance = 34.82044;
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
mvMatrix.translate( -0.2234373, 0.07525015, -0.1505537 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.82044);
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
