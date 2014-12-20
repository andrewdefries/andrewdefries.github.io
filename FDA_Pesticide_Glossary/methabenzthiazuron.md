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
-2.518999, -1.246323, -4.107244, 1, 0, 0, 1,
-2.474459, -1.457051, -2.700823, 1, 0.007843138, 0, 1,
-2.433639, -1.816774, -1.710712, 1, 0.01176471, 0, 1,
-2.415811, -0.9366452, -2.920329, 1, 0.01960784, 0, 1,
-2.287404, 0.06490677, -1.106013, 1, 0.02352941, 0, 1,
-2.284858, -0.5379277, -1.934477, 1, 0.03137255, 0, 1,
-2.274407, 0.1338308, -2.333535, 1, 0.03529412, 0, 1,
-2.265653, 2.613397, -2.502801, 1, 0.04313726, 0, 1,
-2.265604, -0.548115, -1.072734, 1, 0.04705882, 0, 1,
-2.250076, 0.2988826, -1.745052, 1, 0.05490196, 0, 1,
-2.203854, 1.102951, -2.872501, 1, 0.05882353, 0, 1,
-2.158903, -0.1990012, -1.68867, 1, 0.06666667, 0, 1,
-2.138179, 0.191666, -1.25933, 1, 0.07058824, 0, 1,
-2.135437, 0.4121689, 0.1268157, 1, 0.07843138, 0, 1,
-2.106431, 0.8136393, -0.6316974, 1, 0.08235294, 0, 1,
-2.081283, -0.7181824, -3.493197, 1, 0.09019608, 0, 1,
-2.056783, -1.800113, -2.285762, 1, 0.09411765, 0, 1,
-2.05259, -2.298561, -1.137437, 1, 0.1019608, 0, 1,
-2.013439, -0.9882882, -0.4484393, 1, 0.1098039, 0, 1,
-2.010075, 1.021811, -0.3890546, 1, 0.1137255, 0, 1,
-2.007525, 1.302444, -1.433733, 1, 0.1215686, 0, 1,
-1.984303, 0.250187, 0.1836183, 1, 0.1254902, 0, 1,
-1.980688, -1.269396, -1.444558, 1, 0.1333333, 0, 1,
-1.951595, -1.57807, -1.976801, 1, 0.1372549, 0, 1,
-1.914156, 0.7696053, -3.262214, 1, 0.145098, 0, 1,
-1.909871, 0.8064657, 0.02624668, 1, 0.1490196, 0, 1,
-1.895976, 0.08799618, -1.571579, 1, 0.1568628, 0, 1,
-1.888656, 0.7115682, -1.950696, 1, 0.1607843, 0, 1,
-1.877797, -0.9589319, -2.872001, 1, 0.1686275, 0, 1,
-1.876826, -0.7426454, 0.1364892, 1, 0.172549, 0, 1,
-1.866368, -0.8938045, -1.370752, 1, 0.1803922, 0, 1,
-1.861326, -0.9050756, -1.243444, 1, 0.1843137, 0, 1,
-1.837324, -0.8496808, -2.899978, 1, 0.1921569, 0, 1,
-1.81721, -0.6839516, -2.520117, 1, 0.1960784, 0, 1,
-1.81219, 1.024236, -0.5937048, 1, 0.2039216, 0, 1,
-1.80405, 0.7954393, -0.5828159, 1, 0.2117647, 0, 1,
-1.800863, -1.738663, -2.104104, 1, 0.2156863, 0, 1,
-1.794019, -1.507626, -2.308332, 1, 0.2235294, 0, 1,
-1.789606, 0.8276864, -0.08217832, 1, 0.227451, 0, 1,
-1.773825, -0.4152762, -1.252678, 1, 0.2352941, 0, 1,
-1.770955, -0.2521852, -2.048702, 1, 0.2392157, 0, 1,
-1.769861, 0.1915748, -2.199717, 1, 0.2470588, 0, 1,
-1.768556, -0.855665, -1.361081, 1, 0.2509804, 0, 1,
-1.760883, -0.6659078, -2.981504, 1, 0.2588235, 0, 1,
-1.760747, -1.105961, -2.534883, 1, 0.2627451, 0, 1,
-1.76031, 0.4458465, -0.952625, 1, 0.2705882, 0, 1,
-1.724809, 0.5266724, 0.5756184, 1, 0.2745098, 0, 1,
-1.724234, 1.148787, -2.95405, 1, 0.282353, 0, 1,
-1.719796, 0.01286012, -3.542011, 1, 0.2862745, 0, 1,
-1.70636, -0.5929416, -1.258641, 1, 0.2941177, 0, 1,
-1.704663, 0.2738148, -1.394132, 1, 0.3019608, 0, 1,
-1.703376, -0.07704243, -1.717476, 1, 0.3058824, 0, 1,
-1.700031, 0.7733068, -2.628265, 1, 0.3137255, 0, 1,
-1.687196, -0.3825528, -1.509615, 1, 0.3176471, 0, 1,
-1.686999, -0.9139617, -2.107296, 1, 0.3254902, 0, 1,
-1.681599, 1.298982, -0.8203561, 1, 0.3294118, 0, 1,
-1.670474, -1.230562, -3.462052, 1, 0.3372549, 0, 1,
-1.668793, 0.6495073, -0.5764029, 1, 0.3411765, 0, 1,
-1.623614, 2.16436, -0.8608051, 1, 0.3490196, 0, 1,
-1.614982, 1.318319, -1.215718, 1, 0.3529412, 0, 1,
-1.608343, -0.08949532, -1.093799, 1, 0.3607843, 0, 1,
-1.591115, -0.1592104, -1.821352, 1, 0.3647059, 0, 1,
-1.583579, 0.7188147, 0.6893384, 1, 0.372549, 0, 1,
-1.581998, 1.063637, 0.2424026, 1, 0.3764706, 0, 1,
-1.575813, 1.332184, -0.665703, 1, 0.3843137, 0, 1,
-1.572369, 0.3000498, -0.4059057, 1, 0.3882353, 0, 1,
-1.560245, 1.646655, -1.867148, 1, 0.3960784, 0, 1,
-1.556447, -0.4837812, -0.8011781, 1, 0.4039216, 0, 1,
-1.553743, 0.4714298, -0.02992287, 1, 0.4078431, 0, 1,
-1.553112, -0.04770941, 0.3340224, 1, 0.4156863, 0, 1,
-1.551492, 0.7422197, -1.429095, 1, 0.4196078, 0, 1,
-1.550237, -1.422528, -3.567622, 1, 0.427451, 0, 1,
-1.549446, -1.897178, -3.020877, 1, 0.4313726, 0, 1,
-1.536312, -0.7106275, -0.7685944, 1, 0.4392157, 0, 1,
-1.529057, -2.27138, -2.551341, 1, 0.4431373, 0, 1,
-1.511708, 1.574094, -0.6064827, 1, 0.4509804, 0, 1,
-1.494153, 2.416175, -0.1952676, 1, 0.454902, 0, 1,
-1.488986, -0.2204874, -1.688397, 1, 0.4627451, 0, 1,
-1.477149, -0.07340468, -2.384633, 1, 0.4666667, 0, 1,
-1.469333, -3.385068, -3.515061, 1, 0.4745098, 0, 1,
-1.464302, 0.3933035, -2.925627, 1, 0.4784314, 0, 1,
-1.458759, -0.9448963, -1.766362, 1, 0.4862745, 0, 1,
-1.449732, 0.9138367, 0.4357414, 1, 0.4901961, 0, 1,
-1.435084, -1.26043, -0.3447184, 1, 0.4980392, 0, 1,
-1.432732, 0.4353951, -1.887919, 1, 0.5058824, 0, 1,
-1.425468, 0.2980306, -0.4959937, 1, 0.509804, 0, 1,
-1.423572, -0.5817901, -3.687824, 1, 0.5176471, 0, 1,
-1.406752, -0.5260493, -3.123904, 1, 0.5215687, 0, 1,
-1.398797, 2.703621, -0.01876895, 1, 0.5294118, 0, 1,
-1.397663, -0.9316773, -1.827118, 1, 0.5333334, 0, 1,
-1.393237, 0.7620531, -3.460564, 1, 0.5411765, 0, 1,
-1.386026, 1.301676, -0.707042, 1, 0.5450981, 0, 1,
-1.384694, 1.103712, -0.1571547, 1, 0.5529412, 0, 1,
-1.38118, -0.2908532, -0.7972918, 1, 0.5568628, 0, 1,
-1.37892, 0.2703973, -2.347308, 1, 0.5647059, 0, 1,
-1.378545, 0.06589969, -2.557024, 1, 0.5686275, 0, 1,
-1.373059, -0.5904981, -2.875288, 1, 0.5764706, 0, 1,
-1.365219, 2.060029, -0.4663336, 1, 0.5803922, 0, 1,
-1.360523, 0.6851717, -2.358327, 1, 0.5882353, 0, 1,
-1.35384, 0.3854592, -0.5451801, 1, 0.5921569, 0, 1,
-1.352443, -0.490558, 0.05487242, 1, 0.6, 0, 1,
-1.337943, 0.6764727, -0.6272035, 1, 0.6078432, 0, 1,
-1.33736, -0.1760644, -0.09096052, 1, 0.6117647, 0, 1,
-1.33598, -0.1167176, -1.94124, 1, 0.6196079, 0, 1,
-1.332717, -0.2693375, -1.219328, 1, 0.6235294, 0, 1,
-1.332328, -1.194621, -2.742298, 1, 0.6313726, 0, 1,
-1.325402, 0.2691254, -2.518596, 1, 0.6352941, 0, 1,
-1.324186, 1.07826, -1.244083, 1, 0.6431373, 0, 1,
-1.321322, -1.03361, -1.033833, 1, 0.6470588, 0, 1,
-1.311616, 1.316984, -1.250072, 1, 0.654902, 0, 1,
-1.309019, 1.27524, -0.316618, 1, 0.6588235, 0, 1,
-1.303134, 0.4891644, -1.496426, 1, 0.6666667, 0, 1,
-1.293092, 0.3084545, -1.294448, 1, 0.6705883, 0, 1,
-1.288571, 0.8632869, -1.399955, 1, 0.6784314, 0, 1,
-1.28845, -1.818069, -4.383424, 1, 0.682353, 0, 1,
-1.28826, 0.579483, -1.424807, 1, 0.6901961, 0, 1,
-1.282888, -0.06591732, -1.265325, 1, 0.6941177, 0, 1,
-1.271153, 0.7456074, -0.3768187, 1, 0.7019608, 0, 1,
-1.269827, -0.214019, -2.513241, 1, 0.7098039, 0, 1,
-1.255963, 0.5805901, -0.4203194, 1, 0.7137255, 0, 1,
-1.252759, -1.084974, -3.562363, 1, 0.7215686, 0, 1,
-1.249688, 0.05463988, -0.4467874, 1, 0.7254902, 0, 1,
-1.240126, 0.599018, -1.782812, 1, 0.7333333, 0, 1,
-1.238499, 1.057424, -2.02819, 1, 0.7372549, 0, 1,
-1.228098, -0.2358369, -1.70419, 1, 0.7450981, 0, 1,
-1.21669, 0.6934317, -1.830529, 1, 0.7490196, 0, 1,
-1.20026, -0.1557272, -2.111993, 1, 0.7568628, 0, 1,
-1.196024, -0.7420365, -0.1340191, 1, 0.7607843, 0, 1,
-1.194239, 1.691492, -0.6209935, 1, 0.7686275, 0, 1,
-1.173007, -1.664522, -2.495426, 1, 0.772549, 0, 1,
-1.168192, 0.2543561, -1.069867, 1, 0.7803922, 0, 1,
-1.166548, 0.3456804, -1.111385, 1, 0.7843137, 0, 1,
-1.161249, -0.547024, -2.877245, 1, 0.7921569, 0, 1,
-1.155762, 1.515717, -0.7931992, 1, 0.7960784, 0, 1,
-1.15465, -1.657645, -3.476941, 1, 0.8039216, 0, 1,
-1.151558, 1.587555, 0.3050872, 1, 0.8117647, 0, 1,
-1.150235, -1.432721, -2.709893, 1, 0.8156863, 0, 1,
-1.145434, -0.3092451, -2.005028, 1, 0.8235294, 0, 1,
-1.144565, 0.8742377, -2.121943, 1, 0.827451, 0, 1,
-1.144299, -0.2317831, -2.323859, 1, 0.8352941, 0, 1,
-1.138664, 1.416647, -1.194799, 1, 0.8392157, 0, 1,
-1.135507, -0.6222216, -3.306367, 1, 0.8470588, 0, 1,
-1.128832, 0.07070102, -3.166152, 1, 0.8509804, 0, 1,
-1.123488, 0.1245688, -2.417111, 1, 0.8588235, 0, 1,
-1.120979, -0.1154984, -2.322245, 1, 0.8627451, 0, 1,
-1.119745, -0.3681062, -2.709117, 1, 0.8705882, 0, 1,
-1.11698, -1.074519, -2.761128, 1, 0.8745098, 0, 1,
-1.114587, -1.128195, -2.160103, 1, 0.8823529, 0, 1,
-1.111378, -0.5498397, -1.34398, 1, 0.8862745, 0, 1,
-1.110803, -0.05733474, -1.182982, 1, 0.8941177, 0, 1,
-1.106576, -0.7323416, -3.63139, 1, 0.8980392, 0, 1,
-1.104299, -0.7488397, -3.159263, 1, 0.9058824, 0, 1,
-1.103922, -1.049637, -1.697578, 1, 0.9137255, 0, 1,
-1.101003, 0.4148589, -1.505744, 1, 0.9176471, 0, 1,
-1.091391, 1.890099, -1.327495, 1, 0.9254902, 0, 1,
-1.083159, 0.2125938, -0.3752804, 1, 0.9294118, 0, 1,
-1.081538, -2.120358, -3.643448, 1, 0.9372549, 0, 1,
-1.068196, -1.245167, -0.3298443, 1, 0.9411765, 0, 1,
-1.060306, 0.3091707, -0.9597935, 1, 0.9490196, 0, 1,
-1.057573, -0.745771, -1.642339, 1, 0.9529412, 0, 1,
-1.05437, 0.3144608, -1.347644, 1, 0.9607843, 0, 1,
-1.051113, 1.04492, -1.27298, 1, 0.9647059, 0, 1,
-1.05043, 0.6449482, -1.794109, 1, 0.972549, 0, 1,
-1.044643, -0.3552876, -0.8273021, 1, 0.9764706, 0, 1,
-1.044328, -0.7303963, -0.952271, 1, 0.9843137, 0, 1,
-1.041591, -2.328149, -1.751421, 1, 0.9882353, 0, 1,
-1.038472, 1.199016, -1.160351, 1, 0.9960784, 0, 1,
-1.035412, -0.02028422, -1.616664, 0.9960784, 1, 0, 1,
-1.033616, -0.3443815, -1.413528, 0.9921569, 1, 0, 1,
-1.031048, 1.026041, 0.5757304, 0.9843137, 1, 0, 1,
-1.029388, 0.8514965, -1.510359, 0.9803922, 1, 0, 1,
-1.024198, 0.0677578, -1.760461, 0.972549, 1, 0, 1,
-1.020609, -0.7992225, -2.542323, 0.9686275, 1, 0, 1,
-1.018902, -1.951332, -2.441591, 0.9607843, 1, 0, 1,
-1.007693, -0.2773159, -1.996249, 0.9568627, 1, 0, 1,
-1.004775, -0.7141262, -1.636796, 0.9490196, 1, 0, 1,
-1.001255, -0.6117408, -5.203009, 0.945098, 1, 0, 1,
-0.9964955, -1.496852, -3.104658, 0.9372549, 1, 0, 1,
-0.9938158, -0.2336295, -1.415741, 0.9333333, 1, 0, 1,
-0.9886866, 0.5752744, -0.6430904, 0.9254902, 1, 0, 1,
-0.9882273, 0.005834483, -0.543762, 0.9215686, 1, 0, 1,
-0.9733762, 0.5388194, -2.162158, 0.9137255, 1, 0, 1,
-0.9731401, -1.095939, -2.238312, 0.9098039, 1, 0, 1,
-0.9731099, -0.6115482, -2.984491, 0.9019608, 1, 0, 1,
-0.969852, -0.8636304, -2.492587, 0.8941177, 1, 0, 1,
-0.9695752, -0.309396, -1.195867, 0.8901961, 1, 0, 1,
-0.9694892, 0.40607, -0.8542467, 0.8823529, 1, 0, 1,
-0.9655645, -1.099771, -2.02919, 0.8784314, 1, 0, 1,
-0.9640889, -0.09170136, -2.444016, 0.8705882, 1, 0, 1,
-0.9612021, 0.4077991, -0.9242677, 0.8666667, 1, 0, 1,
-0.9606262, -0.2010554, -1.005194, 0.8588235, 1, 0, 1,
-0.9524113, -2.741065, -4.018938, 0.854902, 1, 0, 1,
-0.9505137, -1.44305, -2.486832, 0.8470588, 1, 0, 1,
-0.9500993, -1.699831, -2.997797, 0.8431373, 1, 0, 1,
-0.9446377, -0.5306341, -2.682422, 0.8352941, 1, 0, 1,
-0.9413139, -0.1635194, -1.380968, 0.8313726, 1, 0, 1,
-0.9386427, 1.028418, -0.8221187, 0.8235294, 1, 0, 1,
-0.93858, -1.722802, -1.807482, 0.8196079, 1, 0, 1,
-0.9383369, -1.054611, -2.494444, 0.8117647, 1, 0, 1,
-0.9297062, 1.247082, -0.8825834, 0.8078431, 1, 0, 1,
-0.9284932, 0.03454025, 0.9172983, 0.8, 1, 0, 1,
-0.9239522, -1.017871, -2.258444, 0.7921569, 1, 0, 1,
-0.9168687, -0.9803408, -1.619514, 0.7882353, 1, 0, 1,
-0.9044058, 0.1348296, -0.5724249, 0.7803922, 1, 0, 1,
-0.9027572, 1.253395, -1.805231, 0.7764706, 1, 0, 1,
-0.9012045, 0.5774713, -0.8894641, 0.7686275, 1, 0, 1,
-0.8993701, -0.2118047, -1.985647, 0.7647059, 1, 0, 1,
-0.8955066, -0.7302718, -2.227087, 0.7568628, 1, 0, 1,
-0.8890053, 0.6340293, -4.090605, 0.7529412, 1, 0, 1,
-0.8882494, -0.4673445, -1.680331, 0.7450981, 1, 0, 1,
-0.8869256, 0.6886949, -3.090304, 0.7411765, 1, 0, 1,
-0.8816975, -1.015227, -2.970357, 0.7333333, 1, 0, 1,
-0.8814327, 0.3150487, -2.020853, 0.7294118, 1, 0, 1,
-0.8806975, 0.06012307, -3.746284, 0.7215686, 1, 0, 1,
-0.8794185, -0.2702028, -3.498499, 0.7176471, 1, 0, 1,
-0.8760448, 0.2449644, -2.226227, 0.7098039, 1, 0, 1,
-0.8726997, 0.217394, -1.127266, 0.7058824, 1, 0, 1,
-0.8687034, 0.1573961, -1.510767, 0.6980392, 1, 0, 1,
-0.8652691, -0.9545311, -0.8619183, 0.6901961, 1, 0, 1,
-0.8619503, -0.5295272, -3.00654, 0.6862745, 1, 0, 1,
-0.8391023, 1.026599, 0.6524209, 0.6784314, 1, 0, 1,
-0.838325, 1.289602, -0.4113275, 0.6745098, 1, 0, 1,
-0.8312243, -0.278541, -1.205845, 0.6666667, 1, 0, 1,
-0.8297238, 1.419329, -1.992887, 0.6627451, 1, 0, 1,
-0.8282596, 2.505012, -1.362196, 0.654902, 1, 0, 1,
-0.8214707, -0.8348303, -3.930405, 0.6509804, 1, 0, 1,
-0.8157775, -0.9784551, -3.573569, 0.6431373, 1, 0, 1,
-0.8154323, -0.2705372, -1.578712, 0.6392157, 1, 0, 1,
-0.8136452, -0.1416997, -3.263487, 0.6313726, 1, 0, 1,
-0.8054857, 2.096079, -0.9580557, 0.627451, 1, 0, 1,
-0.8033947, -0.2460237, -0.5426782, 0.6196079, 1, 0, 1,
-0.8009049, -0.2036324, -0.8552108, 0.6156863, 1, 0, 1,
-0.7972279, 0.8363096, -0.006282061, 0.6078432, 1, 0, 1,
-0.7923764, -0.06233247, -0.5094709, 0.6039216, 1, 0, 1,
-0.7779511, -0.5322928, -2.682908, 0.5960785, 1, 0, 1,
-0.7776375, 1.655613, -1.588257, 0.5882353, 1, 0, 1,
-0.7665572, 0.4004343, -2.989181, 0.5843138, 1, 0, 1,
-0.7661633, 0.1403697, -1.614922, 0.5764706, 1, 0, 1,
-0.7624599, -0.8908693, -1.340976, 0.572549, 1, 0, 1,
-0.7623346, 0.704109, -3.547575, 0.5647059, 1, 0, 1,
-0.7612001, 0.7510738, -0.43388, 0.5607843, 1, 0, 1,
-0.757661, 0.8955746, -0.7602111, 0.5529412, 1, 0, 1,
-0.7565517, -0.3246317, -2.647807, 0.5490196, 1, 0, 1,
-0.7497448, 2.26161, -0.05068258, 0.5411765, 1, 0, 1,
-0.7426664, -0.2024358, -2.200383, 0.5372549, 1, 0, 1,
-0.7407426, 0.4342438, -0.4999456, 0.5294118, 1, 0, 1,
-0.7397438, 0.8869886, -1.328084, 0.5254902, 1, 0, 1,
-0.7357062, -0.9742455, -2.918535, 0.5176471, 1, 0, 1,
-0.7330652, 0.3823484, -2.571263, 0.5137255, 1, 0, 1,
-0.7317383, 0.3597218, -1.041453, 0.5058824, 1, 0, 1,
-0.7291886, -1.165016, -3.217623, 0.5019608, 1, 0, 1,
-0.7264667, -1.218451, -2.66996, 0.4941176, 1, 0, 1,
-0.723647, 0.6093698, -1.117348, 0.4862745, 1, 0, 1,
-0.717741, -0.5131477, -2.727178, 0.4823529, 1, 0, 1,
-0.7171006, -1.055957, -1.74773, 0.4745098, 1, 0, 1,
-0.7158911, -0.7318797, -0.5093165, 0.4705882, 1, 0, 1,
-0.7094351, 0.1341, -1.182589, 0.4627451, 1, 0, 1,
-0.703301, -0.7645919, -3.028803, 0.4588235, 1, 0, 1,
-0.7020143, -0.2550922, -1.895148, 0.4509804, 1, 0, 1,
-0.6883446, -0.7824421, -0.942266, 0.4470588, 1, 0, 1,
-0.6821696, -0.3695039, -3.181947, 0.4392157, 1, 0, 1,
-0.6816891, 0.6041011, -1.114867, 0.4352941, 1, 0, 1,
-0.6806536, 0.3323255, -0.07880811, 0.427451, 1, 0, 1,
-0.6785648, -1.057033, -1.095703, 0.4235294, 1, 0, 1,
-0.6736054, 0.4521457, -2.669422, 0.4156863, 1, 0, 1,
-0.6668346, -0.1944281, -1.33376, 0.4117647, 1, 0, 1,
-0.6660946, 0.7245656, -0.07228778, 0.4039216, 1, 0, 1,
-0.663887, -0.1634475, -0.4827242, 0.3960784, 1, 0, 1,
-0.6622614, -0.18864, 0.8469441, 0.3921569, 1, 0, 1,
-0.6597719, -0.1615407, -1.685513, 0.3843137, 1, 0, 1,
-0.6585075, 0.4369306, -2.353659, 0.3803922, 1, 0, 1,
-0.6574863, 1.242787, 0.05686615, 0.372549, 1, 0, 1,
-0.6490456, -0.5441235, -1.446531, 0.3686275, 1, 0, 1,
-0.647614, 0.1057868, -2.487406, 0.3607843, 1, 0, 1,
-0.644275, -0.1027052, -0.925823, 0.3568628, 1, 0, 1,
-0.6421922, 2.077737, -1.939415, 0.3490196, 1, 0, 1,
-0.6408151, 0.2888032, -0.1078354, 0.345098, 1, 0, 1,
-0.6404004, 1.406342, 0.1961798, 0.3372549, 1, 0, 1,
-0.6380644, 0.596164, -1.775375, 0.3333333, 1, 0, 1,
-0.6306903, -1.669143, -3.449726, 0.3254902, 1, 0, 1,
-0.6276188, -0.9405478, -4.097835, 0.3215686, 1, 0, 1,
-0.6267695, 1.238124, -0.07599819, 0.3137255, 1, 0, 1,
-0.6263702, 0.5462964, -0.3932561, 0.3098039, 1, 0, 1,
-0.625206, 0.106028, -2.578954, 0.3019608, 1, 0, 1,
-0.6248556, -0.7116842, -1.725401, 0.2941177, 1, 0, 1,
-0.6213426, 1.187576, -0.7636126, 0.2901961, 1, 0, 1,
-0.6141764, 0.306789, -1.020879, 0.282353, 1, 0, 1,
-0.6070324, 0.03657956, 0.1167795, 0.2784314, 1, 0, 1,
-0.6044549, -1.996864, -3.959203, 0.2705882, 1, 0, 1,
-0.6022284, -2.672313, -3.146709, 0.2666667, 1, 0, 1,
-0.601553, 1.245534, -1.669539, 0.2588235, 1, 0, 1,
-0.59488, 0.4893047, -1.786517, 0.254902, 1, 0, 1,
-0.5918956, 0.3185745, 0.186512, 0.2470588, 1, 0, 1,
-0.5898092, 0.4799197, -1.652107, 0.2431373, 1, 0, 1,
-0.5895759, 0.690015, -1.574394, 0.2352941, 1, 0, 1,
-0.5868968, 0.9492612, -0.2976885, 0.2313726, 1, 0, 1,
-0.582507, 0.01663154, -2.46917, 0.2235294, 1, 0, 1,
-0.5783811, 0.1295398, -1.142427, 0.2196078, 1, 0, 1,
-0.5766155, 1.351428, -0.5880612, 0.2117647, 1, 0, 1,
-0.5745218, -0.9350401, -1.588916, 0.2078431, 1, 0, 1,
-0.5725394, -1.00917, -1.707824, 0.2, 1, 0, 1,
-0.5670359, -1.10906, -3.118651, 0.1921569, 1, 0, 1,
-0.5601008, -0.4604908, -1.281655, 0.1882353, 1, 0, 1,
-0.5551949, -0.3053878, -2.87041, 0.1803922, 1, 0, 1,
-0.5541635, -1.895854, -1.942544, 0.1764706, 1, 0, 1,
-0.5488021, 0.496718, -0.07163352, 0.1686275, 1, 0, 1,
-0.5456784, 0.4315029, -1.436893, 0.1647059, 1, 0, 1,
-0.5437256, -0.1267734, -0.05575096, 0.1568628, 1, 0, 1,
-0.5429045, -0.03201536, -2.360762, 0.1529412, 1, 0, 1,
-0.5421555, -0.8595039, -2.232622, 0.145098, 1, 0, 1,
-0.5406907, -1.809312, -4.091945, 0.1411765, 1, 0, 1,
-0.5406677, 0.1702405, -0.9600387, 0.1333333, 1, 0, 1,
-0.5382257, 0.5149449, -0.234236, 0.1294118, 1, 0, 1,
-0.5345628, 0.1724837, -1.208596, 0.1215686, 1, 0, 1,
-0.5324532, -0.4839589, -0.8078593, 0.1176471, 1, 0, 1,
-0.529284, -0.625362, -2.181226, 0.1098039, 1, 0, 1,
-0.5287791, -0.4964615, -3.057543, 0.1058824, 1, 0, 1,
-0.525246, 0.1831123, -1.951593, 0.09803922, 1, 0, 1,
-0.523013, -0.9123895, -3.374214, 0.09019608, 1, 0, 1,
-0.5229743, -0.8851745, -4.282436, 0.08627451, 1, 0, 1,
-0.5222433, 0.7764818, -2.168994, 0.07843138, 1, 0, 1,
-0.5073984, -0.0598281, -2.417822, 0.07450981, 1, 0, 1,
-0.5073735, 1.381924, -2.68609, 0.06666667, 1, 0, 1,
-0.5062156, -0.07254133, -0.6056319, 0.0627451, 1, 0, 1,
-0.4981013, 0.6913018, -1.562831, 0.05490196, 1, 0, 1,
-0.4956683, 1.078313, -2.243852, 0.05098039, 1, 0, 1,
-0.4926891, -2.740403, -4.402597, 0.04313726, 1, 0, 1,
-0.490933, 0.8445584, 0.3377663, 0.03921569, 1, 0, 1,
-0.488153, 1.801671, -1.890267, 0.03137255, 1, 0, 1,
-0.4867313, 0.5265367, -1.408268, 0.02745098, 1, 0, 1,
-0.4866398, 0.7249581, -0.5520592, 0.01960784, 1, 0, 1,
-0.482694, -2.448287, -4.242305, 0.01568628, 1, 0, 1,
-0.4826083, 0.5158724, 0.1244047, 0.007843138, 1, 0, 1,
-0.4786875, -0.09154277, -2.28853, 0.003921569, 1, 0, 1,
-0.4768929, 0.7383815, -0.1528189, 0, 1, 0.003921569, 1,
-0.47646, -0.1174988, -1.940896, 0, 1, 0.01176471, 1,
-0.47086, -1.001059, -1.269649, 0, 1, 0.01568628, 1,
-0.469646, 0.4876028, -1.229103, 0, 1, 0.02352941, 1,
-0.4653798, -0.7960595, -3.877908, 0, 1, 0.02745098, 1,
-0.4644292, -0.5287031, -1.484716, 0, 1, 0.03529412, 1,
-0.4562057, 0.8594086, -1.110874, 0, 1, 0.03921569, 1,
-0.4548864, -0.6936439, -4.438006, 0, 1, 0.04705882, 1,
-0.4470801, -0.704616, -3.249931, 0, 1, 0.05098039, 1,
-0.4463996, 0.1734992, -1.762019, 0, 1, 0.05882353, 1,
-0.445612, -0.4640077, -3.011675, 0, 1, 0.0627451, 1,
-0.4453019, -3.814299, -4.125874, 0, 1, 0.07058824, 1,
-0.4407257, -0.5964035, -0.3782378, 0, 1, 0.07450981, 1,
-0.4403508, 0.01635973, 0.2450926, 0, 1, 0.08235294, 1,
-0.4380144, 1.683697, -1.07229, 0, 1, 0.08627451, 1,
-0.4362769, -1.03093, -2.18557, 0, 1, 0.09411765, 1,
-0.4347151, -0.288811, -2.543005, 0, 1, 0.1019608, 1,
-0.4281529, 0.05325906, -0.4409696, 0, 1, 0.1058824, 1,
-0.4278344, -0.7400869, -1.755583, 0, 1, 0.1137255, 1,
-0.4254151, -0.7093294, -3.493454, 0, 1, 0.1176471, 1,
-0.4231871, -0.6932085, -2.350869, 0, 1, 0.1254902, 1,
-0.4126939, -0.2520508, -1.818219, 0, 1, 0.1294118, 1,
-0.4109612, -0.2403188, -2.010177, 0, 1, 0.1372549, 1,
-0.4086055, -0.4534084, -1.736877, 0, 1, 0.1411765, 1,
-0.408029, 0.2172849, -0.8897806, 0, 1, 0.1490196, 1,
-0.4070183, -0.3999013, -2.04394, 0, 1, 0.1529412, 1,
-0.4063838, 0.136755, -2.135435, 0, 1, 0.1607843, 1,
-0.4056075, 0.161158, -0.4124552, 0, 1, 0.1647059, 1,
-0.402374, 0.8692645, -0.9494322, 0, 1, 0.172549, 1,
-0.3880288, 1.160835, -0.3137738, 0, 1, 0.1764706, 1,
-0.3855608, -0.456502, -1.735567, 0, 1, 0.1843137, 1,
-0.3844359, 0.5195858, -1.528979, 0, 1, 0.1882353, 1,
-0.3842826, -0.1900614, -0.6414499, 0, 1, 0.1960784, 1,
-0.3817827, -1.828978, -3.746023, 0, 1, 0.2039216, 1,
-0.3798114, -0.9026949, -2.892744, 0, 1, 0.2078431, 1,
-0.3780639, -0.9817322, -3.983159, 0, 1, 0.2156863, 1,
-0.3713783, -0.639955, -3.38925, 0, 1, 0.2196078, 1,
-0.3648422, -0.2101244, -1.831199, 0, 1, 0.227451, 1,
-0.3615969, 0.8171419, 0.1014234, 0, 1, 0.2313726, 1,
-0.3585225, 2.421249, -0.2534052, 0, 1, 0.2392157, 1,
-0.3509251, -0.7888361, -2.581605, 0, 1, 0.2431373, 1,
-0.3500939, -0.1829415, -2.367931, 0, 1, 0.2509804, 1,
-0.3470027, 1.188004, -0.5219146, 0, 1, 0.254902, 1,
-0.3468803, 0.7626263, 1.152277, 0, 1, 0.2627451, 1,
-0.3432471, 0.6535907, -0.5308026, 0, 1, 0.2666667, 1,
-0.341981, 0.00898329, -1.082613, 0, 1, 0.2745098, 1,
-0.3379156, -0.7867505, -3.305517, 0, 1, 0.2784314, 1,
-0.3369831, 0.0883007, -2.024554, 0, 1, 0.2862745, 1,
-0.3335822, 0.7841052, 0.3766755, 0, 1, 0.2901961, 1,
-0.3319749, 0.1116574, -1.685887, 0, 1, 0.2980392, 1,
-0.3316283, 0.02408709, 1.538869, 0, 1, 0.3058824, 1,
-0.3291151, 1.604116, 0.4192061, 0, 1, 0.3098039, 1,
-0.3200766, 0.6199725, -1.346214, 0, 1, 0.3176471, 1,
-0.3174785, 0.04836998, -1.25624, 0, 1, 0.3215686, 1,
-0.3163891, 1.052024, 1.237405, 0, 1, 0.3294118, 1,
-0.3092524, 0.4037297, -1.89199, 0, 1, 0.3333333, 1,
-0.3079493, 2.396708, -0.6519178, 0, 1, 0.3411765, 1,
-0.3070378, 0.7072818, -0.5093919, 0, 1, 0.345098, 1,
-0.3036144, 0.731286, -0.09630577, 0, 1, 0.3529412, 1,
-0.2977522, -1.202659, -4.088067, 0, 1, 0.3568628, 1,
-0.2975597, 1.330044, -0.4273849, 0, 1, 0.3647059, 1,
-0.2933846, -0.657092, -1.649615, 0, 1, 0.3686275, 1,
-0.2914895, -0.6803166, -1.452766, 0, 1, 0.3764706, 1,
-0.2853819, -0.9177316, -1.885168, 0, 1, 0.3803922, 1,
-0.2837571, 0.413456, -1.874423, 0, 1, 0.3882353, 1,
-0.2827199, 0.7121007, -1.16378, 0, 1, 0.3921569, 1,
-0.2804154, 0.6230503, 0.8789849, 0, 1, 0.4, 1,
-0.2791993, -0.365305, -2.71132, 0, 1, 0.4078431, 1,
-0.2736111, -2.067932, -2.934485, 0, 1, 0.4117647, 1,
-0.2707497, 0.02767483, -2.296094, 0, 1, 0.4196078, 1,
-0.2687254, 0.4546175, -1.809083, 0, 1, 0.4235294, 1,
-0.2684576, -0.8998028, -1.898656, 0, 1, 0.4313726, 1,
-0.2681312, -1.760854, -3.881201, 0, 1, 0.4352941, 1,
-0.2668898, 1.578878, -0.3908915, 0, 1, 0.4431373, 1,
-0.2647095, 0.8003947, -0.5564689, 0, 1, 0.4470588, 1,
-0.2643657, 0.8362991, -0.3121577, 0, 1, 0.454902, 1,
-0.2524614, 1.113418, -2.190815, 0, 1, 0.4588235, 1,
-0.250365, -1.1735, -1.288274, 0, 1, 0.4666667, 1,
-0.2462941, 2.429343, 1.045902, 0, 1, 0.4705882, 1,
-0.2446976, 1.584876, 0.6116971, 0, 1, 0.4784314, 1,
-0.2446743, -0.5148577, -3.506057, 0, 1, 0.4823529, 1,
-0.2409892, 0.7135364, -1.561944, 0, 1, 0.4901961, 1,
-0.2389636, 0.3855113, -0.3328249, 0, 1, 0.4941176, 1,
-0.2349933, 0.8651447, 0.08254024, 0, 1, 0.5019608, 1,
-0.2339634, 0.5738491, 0.3088403, 0, 1, 0.509804, 1,
-0.2329154, -1.439867, -1.573186, 0, 1, 0.5137255, 1,
-0.2328441, 0.01699456, -0.2991112, 0, 1, 0.5215687, 1,
-0.231303, -0.6633956, -3.738618, 0, 1, 0.5254902, 1,
-0.2301375, 0.6636419, -1.039497, 0, 1, 0.5333334, 1,
-0.2208942, -0.5844366, -1.459233, 0, 1, 0.5372549, 1,
-0.21931, 0.1162971, -1.412476, 0, 1, 0.5450981, 1,
-0.2191688, 1.175241, 1.413776, 0, 1, 0.5490196, 1,
-0.2146349, -0.2743819, -2.325683, 0, 1, 0.5568628, 1,
-0.2145545, 0.1919223, -1.286524, 0, 1, 0.5607843, 1,
-0.2138663, -2.659806, -2.426231, 0, 1, 0.5686275, 1,
-0.2136337, -1.347813, -4.233449, 0, 1, 0.572549, 1,
-0.2046944, -0.04550734, -1.424065, 0, 1, 0.5803922, 1,
-0.2025727, 1.799341, -0.7798824, 0, 1, 0.5843138, 1,
-0.1945394, 0.2528519, -3.14406, 0, 1, 0.5921569, 1,
-0.1899701, -0.7568501, -2.477536, 0, 1, 0.5960785, 1,
-0.1891849, -1.235271, -4.376557, 0, 1, 0.6039216, 1,
-0.1858803, -0.3485005, -1.95569, 0, 1, 0.6117647, 1,
-0.1855448, 0.07516402, -1.394745, 0, 1, 0.6156863, 1,
-0.1833904, 0.3941648, -0.8622807, 0, 1, 0.6235294, 1,
-0.1831605, -0.1637857, -1.336569, 0, 1, 0.627451, 1,
-0.18001, -0.3699515, -2.183053, 0, 1, 0.6352941, 1,
-0.1761065, -1.361556, -3.985168, 0, 1, 0.6392157, 1,
-0.1727008, -0.3924936, -3.444019, 0, 1, 0.6470588, 1,
-0.1717218, -1.177187, -2.576993, 0, 1, 0.6509804, 1,
-0.1671849, 0.5303591, 0.203499, 0, 1, 0.6588235, 1,
-0.1651271, -0.08856685, -2.250089, 0, 1, 0.6627451, 1,
-0.1641417, -0.4397811, -2.901879, 0, 1, 0.6705883, 1,
-0.1575785, 0.2369962, -0.01245142, 0, 1, 0.6745098, 1,
-0.1565249, -1.43558, -2.733481, 0, 1, 0.682353, 1,
-0.1564158, -0.7487115, -3.506813, 0, 1, 0.6862745, 1,
-0.1533352, -0.6416813, -3.822645, 0, 1, 0.6941177, 1,
-0.1515308, -1.266027, -2.774886, 0, 1, 0.7019608, 1,
-0.1435622, -0.9578564, -3.229526, 0, 1, 0.7058824, 1,
-0.1406653, -0.7268926, -2.099836, 0, 1, 0.7137255, 1,
-0.1381029, -0.1567201, -0.6622334, 0, 1, 0.7176471, 1,
-0.135027, 0.7535588, 0.9948177, 0, 1, 0.7254902, 1,
-0.1327486, -1.148469, -3.454515, 0, 1, 0.7294118, 1,
-0.1294221, 1.090411, -0.3510542, 0, 1, 0.7372549, 1,
-0.1265795, -0.7146182, -2.35137, 0, 1, 0.7411765, 1,
-0.1236629, -1.944445, -2.03425, 0, 1, 0.7490196, 1,
-0.1200637, -0.7351841, -4.139617, 0, 1, 0.7529412, 1,
-0.1194254, 2.09809, -0.8389778, 0, 1, 0.7607843, 1,
-0.1168667, -1.84528, -3.448683, 0, 1, 0.7647059, 1,
-0.1151692, 0.07559923, -2.213044, 0, 1, 0.772549, 1,
-0.1149161, -0.5637091, -2.571103, 0, 1, 0.7764706, 1,
-0.1144268, -1.022347, -2.904712, 0, 1, 0.7843137, 1,
-0.1139553, -0.5565967, -4.242131, 0, 1, 0.7882353, 1,
-0.1133542, 0.4324502, 0.1270269, 0, 1, 0.7960784, 1,
-0.112514, 0.8225265, 0.7621637, 0, 1, 0.8039216, 1,
-0.1061903, -1.353179, -3.267654, 0, 1, 0.8078431, 1,
-0.1057776, 0.2673213, -0.7769549, 0, 1, 0.8156863, 1,
-0.1027856, -1.17854, -3.001345, 0, 1, 0.8196079, 1,
-0.1020828, 0.6636434, -0.1049172, 0, 1, 0.827451, 1,
-0.1012067, -0.7804232, -2.576626, 0, 1, 0.8313726, 1,
-0.09815421, 0.09827157, -1.715798, 0, 1, 0.8392157, 1,
-0.0976947, -0.5404496, -2.15111, 0, 1, 0.8431373, 1,
-0.09745762, 0.5220014, -1.016796, 0, 1, 0.8509804, 1,
-0.09547096, -0.4095522, -4.30047, 0, 1, 0.854902, 1,
-0.08536366, 0.2661945, 0.05057798, 0, 1, 0.8627451, 1,
-0.0837783, 1.042988, 1.699704, 0, 1, 0.8666667, 1,
-0.0766359, -0.04136255, -2.271168, 0, 1, 0.8745098, 1,
-0.07281205, 3.111534, -1.056697, 0, 1, 0.8784314, 1,
-0.07252663, 0.4869778, 0.3109558, 0, 1, 0.8862745, 1,
-0.07085633, -1.647439, -2.958353, 0, 1, 0.8901961, 1,
-0.06855798, -1.574612, -3.137954, 0, 1, 0.8980392, 1,
-0.06654394, 0.492222, 0.6311653, 0, 1, 0.9058824, 1,
-0.06532768, -1.328114, -4.563795, 0, 1, 0.9098039, 1,
-0.06007519, -0.6336549, -4.848256, 0, 1, 0.9176471, 1,
-0.05864891, -0.6237733, -4.088104, 0, 1, 0.9215686, 1,
-0.05594755, 0.4085029, 0.2702984, 0, 1, 0.9294118, 1,
-0.05580029, -0.9807823, -3.377316, 0, 1, 0.9333333, 1,
-0.05147525, -0.6157, -2.45484, 0, 1, 0.9411765, 1,
-0.05107217, -0.9001319, -3.679783, 0, 1, 0.945098, 1,
-0.04711229, 0.7982275, -0.4229535, 0, 1, 0.9529412, 1,
-0.04441434, -0.501078, -4.752266, 0, 1, 0.9568627, 1,
-0.03349383, 0.178966, -0.5157746, 0, 1, 0.9647059, 1,
-0.03106437, -1.592655, -3.504423, 0, 1, 0.9686275, 1,
-0.03068707, 1.535511, -0.4847524, 0, 1, 0.9764706, 1,
-0.02531841, -0.752769, -2.179048, 0, 1, 0.9803922, 1,
-0.01861837, 1.911456, 0.9248126, 0, 1, 0.9882353, 1,
-0.008865265, 0.6878784, 0.3419619, 0, 1, 0.9921569, 1,
-0.00446473, 0.04674789, 0.6479443, 0, 1, 1, 1,
-0.003288366, 0.06034521, -1.22577, 0, 0.9921569, 1, 1,
-0.002531243, 0.2107285, -0.05155184, 0, 0.9882353, 1, 1,
-6.593477e-05, -1.65897, -5.214694, 0, 0.9803922, 1, 1,
0.0007903292, 0.1510438, 0.2850368, 0, 0.9764706, 1, 1,
0.002240826, -0.8839208, 3.506586, 0, 0.9686275, 1, 1,
0.002899941, -1.75487, 4.906713, 0, 0.9647059, 1, 1,
0.003827368, 0.09658524, 0.3122859, 0, 0.9568627, 1, 1,
0.005245539, -0.1346852, 4.59349, 0, 0.9529412, 1, 1,
0.006922372, 0.2785805, 0.995134, 0, 0.945098, 1, 1,
0.007087805, -0.7936018, 3.728442, 0, 0.9411765, 1, 1,
0.01014328, 0.8389907, -1.180818, 0, 0.9333333, 1, 1,
0.01191316, 1.179995, 0.5118528, 0, 0.9294118, 1, 1,
0.0172981, -0.7551938, 3.011299, 0, 0.9215686, 1, 1,
0.02312578, 0.003363585, 1.065444, 0, 0.9176471, 1, 1,
0.02327459, -0.1357635, 2.469196, 0, 0.9098039, 1, 1,
0.02432582, -0.9395302, 2.571417, 0, 0.9058824, 1, 1,
0.02658255, 1.896699, -0.1679655, 0, 0.8980392, 1, 1,
0.03133075, -0.6679735, 3.972011, 0, 0.8901961, 1, 1,
0.03134032, -1.341378, 1.631982, 0, 0.8862745, 1, 1,
0.03460038, 0.3276586, 0.408536, 0, 0.8784314, 1, 1,
0.03660116, 0.5776576, 0.1629426, 0, 0.8745098, 1, 1,
0.0378117, 1.726722, 0.3840336, 0, 0.8666667, 1, 1,
0.03926272, 0.4925465, 0.175027, 0, 0.8627451, 1, 1,
0.0458464, 0.8042565, -0.4870726, 0, 0.854902, 1, 1,
0.05239443, -0.7495779, 2.71999, 0, 0.8509804, 1, 1,
0.05263923, -1.002272, 4.700927, 0, 0.8431373, 1, 1,
0.05400178, 0.2421047, 0.9815634, 0, 0.8392157, 1, 1,
0.05458113, -2.02895, 4.271449, 0, 0.8313726, 1, 1,
0.05539394, 0.6568549, 1.106597, 0, 0.827451, 1, 1,
0.05624871, -0.2964165, 3.902367, 0, 0.8196079, 1, 1,
0.05901925, -0.7013654, 3.154787, 0, 0.8156863, 1, 1,
0.06045911, -1.696295, 1.382024, 0, 0.8078431, 1, 1,
0.06179001, -0.3093653, 3.458169, 0, 0.8039216, 1, 1,
0.06481318, 1.364709, -1.504732, 0, 0.7960784, 1, 1,
0.06599755, 1.330333, 1.646625, 0, 0.7882353, 1, 1,
0.06758413, -1.271007, 2.046453, 0, 0.7843137, 1, 1,
0.06809453, 1.62329, 0.2258489, 0, 0.7764706, 1, 1,
0.06855496, 0.7666104, 0.08840685, 0, 0.772549, 1, 1,
0.06930761, 0.7274944, 0.1385046, 0, 0.7647059, 1, 1,
0.07009299, -0.2852831, 2.406621, 0, 0.7607843, 1, 1,
0.07385095, -1.194229, 2.716096, 0, 0.7529412, 1, 1,
0.07662514, -1.575421, 3.41577, 0, 0.7490196, 1, 1,
0.07832102, 1.222623, -0.0769719, 0, 0.7411765, 1, 1,
0.07980857, 0.5514187, 1.247066, 0, 0.7372549, 1, 1,
0.08133404, 0.4606273, -0.05531106, 0, 0.7294118, 1, 1,
0.08189579, -0.3555076, 2.359349, 0, 0.7254902, 1, 1,
0.08270826, 0.02624128, 3.895176, 0, 0.7176471, 1, 1,
0.09775456, 1.360946, 1.535943, 0, 0.7137255, 1, 1,
0.100622, -2.221364, 3.956373, 0, 0.7058824, 1, 1,
0.1034621, -1.67058, 1.900283, 0, 0.6980392, 1, 1,
0.104932, -2.161095, 2.28204, 0, 0.6941177, 1, 1,
0.1054759, -1.86934, 5.414767, 0, 0.6862745, 1, 1,
0.1082946, -0.147904, 5.18941, 0, 0.682353, 1, 1,
0.1123262, 1.501492, 0.3726056, 0, 0.6745098, 1, 1,
0.1161442, -0.6865919, 1.048671, 0, 0.6705883, 1, 1,
0.1236643, -0.9119672, 3.98738, 0, 0.6627451, 1, 1,
0.1258503, -0.1456972, 2.442389, 0, 0.6588235, 1, 1,
0.1273686, -0.1621769, 3.717342, 0, 0.6509804, 1, 1,
0.1275624, -1.265344, 2.104576, 0, 0.6470588, 1, 1,
0.1306271, 0.2425988, 0.6550802, 0, 0.6392157, 1, 1,
0.1340195, -1.696178, 2.558788, 0, 0.6352941, 1, 1,
0.1350197, -1.520359, 3.020752, 0, 0.627451, 1, 1,
0.1385749, -1.208609, 2.829935, 0, 0.6235294, 1, 1,
0.139322, 0.3233691, 1.132759, 0, 0.6156863, 1, 1,
0.139752, 1.391219, -0.2553055, 0, 0.6117647, 1, 1,
0.1406104, -0.1760753, 1.077247, 0, 0.6039216, 1, 1,
0.142591, 0.7245005, 0.7688087, 0, 0.5960785, 1, 1,
0.1448313, 0.3782395, 1.165363, 0, 0.5921569, 1, 1,
0.1471921, -0.5652454, 4.687226, 0, 0.5843138, 1, 1,
0.1498399, 1.330357, 0.187567, 0, 0.5803922, 1, 1,
0.1551826, 1.158889, 1.297691, 0, 0.572549, 1, 1,
0.1570439, -0.319754, 3.152848, 0, 0.5686275, 1, 1,
0.1632302, -1.723823, 3.881208, 0, 0.5607843, 1, 1,
0.1632887, -0.8840607, 3.364594, 0, 0.5568628, 1, 1,
0.1651732, 0.9446352, 0.06131746, 0, 0.5490196, 1, 1,
0.1673302, -2.561989, 3.210747, 0, 0.5450981, 1, 1,
0.1683529, 0.09391364, -0.03386899, 0, 0.5372549, 1, 1,
0.1735639, -2.002845, 4.506675, 0, 0.5333334, 1, 1,
0.1786818, 1.063098, 1.761633, 0, 0.5254902, 1, 1,
0.1788775, 0.7788581, 0.0621152, 0, 0.5215687, 1, 1,
0.1889241, 1.067039, 0.1337003, 0, 0.5137255, 1, 1,
0.1891215, 0.247621, 1.562392, 0, 0.509804, 1, 1,
0.1895901, 0.8182868, 0.5478109, 0, 0.5019608, 1, 1,
0.1908183, -0.1291116, 2.573425, 0, 0.4941176, 1, 1,
0.1969471, 0.275848, 0.9289501, 0, 0.4901961, 1, 1,
0.2011433, 0.7552968, 0.6179265, 0, 0.4823529, 1, 1,
0.2029025, -0.2025573, 0.6467744, 0, 0.4784314, 1, 1,
0.2102063, -1.461053, 2.94697, 0, 0.4705882, 1, 1,
0.210994, 0.07024293, 0.5441646, 0, 0.4666667, 1, 1,
0.2111488, -1.09897, 2.244683, 0, 0.4588235, 1, 1,
0.2113038, 1.291462, 0.8995759, 0, 0.454902, 1, 1,
0.2121006, -0.6946051, 2.565928, 0, 0.4470588, 1, 1,
0.2133293, 0.8175175, 0.5288814, 0, 0.4431373, 1, 1,
0.2145217, -1.357125, 3.714222, 0, 0.4352941, 1, 1,
0.2169029, -0.4097705, 3.516319, 0, 0.4313726, 1, 1,
0.2177161, 1.390318, 0.9659377, 0, 0.4235294, 1, 1,
0.2198236, 0.3587551, 0.7095636, 0, 0.4196078, 1, 1,
0.2228845, -0.4779019, 1.624846, 0, 0.4117647, 1, 1,
0.225647, -0.2507363, 3.168242, 0, 0.4078431, 1, 1,
0.2284107, 0.3622805, -0.5135791, 0, 0.4, 1, 1,
0.233656, 0.03906457, 1.87433, 0, 0.3921569, 1, 1,
0.2363953, 1.591046, 0.3568422, 0, 0.3882353, 1, 1,
0.2366578, 0.3180302, 0.8905652, 0, 0.3803922, 1, 1,
0.2394094, -1.3179, 1.22192, 0, 0.3764706, 1, 1,
0.2397247, 1.279034, 1.02998, 0, 0.3686275, 1, 1,
0.2447128, -0.05870355, 1.508178, 0, 0.3647059, 1, 1,
0.2529993, -0.6023834, 3.644314, 0, 0.3568628, 1, 1,
0.2604802, 1.084708, 0.8655949, 0, 0.3529412, 1, 1,
0.2605584, 0.315116, 0.7929604, 0, 0.345098, 1, 1,
0.2624284, 0.1662167, 1.405373, 0, 0.3411765, 1, 1,
0.2682718, -1.338398, 3.093358, 0, 0.3333333, 1, 1,
0.2744968, -2.090513, 4.987147, 0, 0.3294118, 1, 1,
0.2773641, 0.07710345, 1.261527, 0, 0.3215686, 1, 1,
0.2783104, -0.5866002, 4.03444, 0, 0.3176471, 1, 1,
0.2808018, 0.7139195, 1.18707, 0, 0.3098039, 1, 1,
0.2812613, -0.3883585, 5.81031, 0, 0.3058824, 1, 1,
0.2836795, 0.882633, 0.5142683, 0, 0.2980392, 1, 1,
0.288845, 0.7993076, 0.9185893, 0, 0.2901961, 1, 1,
0.2927666, 0.2892313, -0.03626869, 0, 0.2862745, 1, 1,
0.2936654, -0.03295564, 2.042536, 0, 0.2784314, 1, 1,
0.2937594, -0.3590171, 2.042342, 0, 0.2745098, 1, 1,
0.2949224, 0.6427865, 1.43281, 0, 0.2666667, 1, 1,
0.2985631, -0.08105657, 2.068278, 0, 0.2627451, 1, 1,
0.2988994, -0.4268132, 0.4181079, 0, 0.254902, 1, 1,
0.2989892, 1.405991, 1.686849, 0, 0.2509804, 1, 1,
0.3029466, -1.813284, 2.544185, 0, 0.2431373, 1, 1,
0.3034433, -0.5016991, 2.439695, 0, 0.2392157, 1, 1,
0.3042438, -1.123296, 3.017498, 0, 0.2313726, 1, 1,
0.3054668, 1.548199, -0.9311666, 0, 0.227451, 1, 1,
0.3099831, -1.806557, 2.53836, 0, 0.2196078, 1, 1,
0.3115371, 0.5852529, 1.808587, 0, 0.2156863, 1, 1,
0.316387, 0.3549024, -0.4263722, 0, 0.2078431, 1, 1,
0.3214713, 0.07594753, 0.1402946, 0, 0.2039216, 1, 1,
0.3238573, 0.3550638, 2.131789, 0, 0.1960784, 1, 1,
0.3242202, -2.046536, 3.624625, 0, 0.1882353, 1, 1,
0.3243406, 0.1299805, 0.2442117, 0, 0.1843137, 1, 1,
0.3257226, -0.7464687, 3.746405, 0, 0.1764706, 1, 1,
0.3265943, -0.01766278, 1.533505, 0, 0.172549, 1, 1,
0.3332467, 0.9649188, -0.08658448, 0, 0.1647059, 1, 1,
0.3357659, -2.199845, 4.018368, 0, 0.1607843, 1, 1,
0.3370616, 0.2544386, 0.8793715, 0, 0.1529412, 1, 1,
0.3379106, 0.4364578, 0.7034802, 0, 0.1490196, 1, 1,
0.3417445, 0.1023145, 2.19761, 0, 0.1411765, 1, 1,
0.3418875, 1.41719, 0.2973014, 0, 0.1372549, 1, 1,
0.3430093, 0.3576944, 0.4372242, 0, 0.1294118, 1, 1,
0.3439374, -0.983317, 2.112309, 0, 0.1254902, 1, 1,
0.3441977, 0.1096729, 2.836369, 0, 0.1176471, 1, 1,
0.3455966, -1.165836, 2.796993, 0, 0.1137255, 1, 1,
0.3457459, -1.723516, 2.393553, 0, 0.1058824, 1, 1,
0.3469676, 1.363006, 0.5215209, 0, 0.09803922, 1, 1,
0.3502454, 1.859558, 1.387635, 0, 0.09411765, 1, 1,
0.3534153, -0.03630412, 0.981756, 0, 0.08627451, 1, 1,
0.3635192, -0.2914619, 3.077486, 0, 0.08235294, 1, 1,
0.367927, -0.04828559, 1.847518, 0, 0.07450981, 1, 1,
0.3700493, 1.213994, -1.623048, 0, 0.07058824, 1, 1,
0.3739637, -0.4044353, 1.692607, 0, 0.0627451, 1, 1,
0.3743306, -1.830793, 2.4619, 0, 0.05882353, 1, 1,
0.3743641, 0.1029354, 2.580572, 0, 0.05098039, 1, 1,
0.3756275, 0.385984, 1.961701, 0, 0.04705882, 1, 1,
0.3763397, 0.2336523, 2.27368, 0, 0.03921569, 1, 1,
0.3771648, -1.682759, 3.673156, 0, 0.03529412, 1, 1,
0.37987, 0.5494424, -1.015138, 0, 0.02745098, 1, 1,
0.3800253, -1.743443, 4.336607, 0, 0.02352941, 1, 1,
0.3800389, 1.328101, -0.2590648, 0, 0.01568628, 1, 1,
0.3833191, -0.8359782, 1.83387, 0, 0.01176471, 1, 1,
0.3923686, -1.250964, 3.080022, 0, 0.003921569, 1, 1,
0.3966725, 1.208179, 0.01827928, 0.003921569, 0, 1, 1,
0.3986838, -0.1370669, 2.523925, 0.007843138, 0, 1, 1,
0.4004703, 1.280977, -0.4982612, 0.01568628, 0, 1, 1,
0.4035395, -1.998899, 2.923612, 0.01960784, 0, 1, 1,
0.4072377, -0.5837104, 3.356454, 0.02745098, 0, 1, 1,
0.4091338, -0.3322538, 2.266975, 0.03137255, 0, 1, 1,
0.4097189, -0.2751677, 3.826761, 0.03921569, 0, 1, 1,
0.4160926, 0.3044926, 1.349972, 0.04313726, 0, 1, 1,
0.4169228, 0.7141696, 1.931403, 0.05098039, 0, 1, 1,
0.4186104, -0.6428844, 2.122424, 0.05490196, 0, 1, 1,
0.4206291, 0.5782791, 0.1716855, 0.0627451, 0, 1, 1,
0.427892, -0.4987466, 3.195617, 0.06666667, 0, 1, 1,
0.430694, 0.4115278, 0.0930823, 0.07450981, 0, 1, 1,
0.4311025, -0.4161257, 2.907298, 0.07843138, 0, 1, 1,
0.4312532, 1.297686, 2.452682, 0.08627451, 0, 1, 1,
0.4361548, -1.038625, 5.016869, 0.09019608, 0, 1, 1,
0.4365541, 1.069626, 1.193894, 0.09803922, 0, 1, 1,
0.4378002, 0.7152658, 0.2236553, 0.1058824, 0, 1, 1,
0.4431589, 0.5857896, -0.9248617, 0.1098039, 0, 1, 1,
0.4481251, -0.3765836, 2.488864, 0.1176471, 0, 1, 1,
0.4657938, 0.4217135, 1.518386, 0.1215686, 0, 1, 1,
0.4720807, 0.2929704, 0.3645562, 0.1294118, 0, 1, 1,
0.4734501, 0.3696541, 0.9502692, 0.1333333, 0, 1, 1,
0.4743611, -0.8614785, 2.955093, 0.1411765, 0, 1, 1,
0.4772219, 0.5721117, 1.915748, 0.145098, 0, 1, 1,
0.4838462, 0.2052288, -0.4148211, 0.1529412, 0, 1, 1,
0.4907216, 0.9510176, -0.7669863, 0.1568628, 0, 1, 1,
0.4912674, 0.4507421, 0.4927509, 0.1647059, 0, 1, 1,
0.5008476, -1.702334, 3.743677, 0.1686275, 0, 1, 1,
0.5009031, -0.2893151, 2.385231, 0.1764706, 0, 1, 1,
0.5029058, -0.6759956, 1.153889, 0.1803922, 0, 1, 1,
0.5069815, 0.3099236, 0.0506806, 0.1882353, 0, 1, 1,
0.5070755, -1.730157, 3.058694, 0.1921569, 0, 1, 1,
0.5085921, -1.063581, 2.421218, 0.2, 0, 1, 1,
0.5093583, 0.6256999, 0.48393, 0.2078431, 0, 1, 1,
0.5094727, 0.7303182, -1.025939, 0.2117647, 0, 1, 1,
0.5169863, -0.6081201, 2.638278, 0.2196078, 0, 1, 1,
0.5172215, 0.1808711, 1.897974, 0.2235294, 0, 1, 1,
0.5194631, -0.1431507, 3.038571, 0.2313726, 0, 1, 1,
0.5241243, 0.6942194, 2.726368, 0.2352941, 0, 1, 1,
0.533599, -0.4369029, 2.546422, 0.2431373, 0, 1, 1,
0.5391181, 0.7218126, -0.2155587, 0.2470588, 0, 1, 1,
0.5396104, -0.252335, 1.298688, 0.254902, 0, 1, 1,
0.5402176, 0.08243556, 0.949562, 0.2588235, 0, 1, 1,
0.5407085, 0.2230004, 2.169181, 0.2666667, 0, 1, 1,
0.5418077, -0.2977855, 1.436841, 0.2705882, 0, 1, 1,
0.5428365, 0.3324788, 0.2873395, 0.2784314, 0, 1, 1,
0.5450047, -1.364804, 3.947067, 0.282353, 0, 1, 1,
0.5485974, -1.182904, 2.833087, 0.2901961, 0, 1, 1,
0.5526412, -1.921526, 2.936359, 0.2941177, 0, 1, 1,
0.5537112, 0.9304322, 0.4981978, 0.3019608, 0, 1, 1,
0.5541662, 0.3473561, 0.8366918, 0.3098039, 0, 1, 1,
0.5596837, 0.5234714, 1.311029, 0.3137255, 0, 1, 1,
0.5610684, 0.1160012, 1.426388, 0.3215686, 0, 1, 1,
0.5630341, -0.1812421, 1.841327, 0.3254902, 0, 1, 1,
0.5639406, -0.1606266, 2.136347, 0.3333333, 0, 1, 1,
0.5706751, -0.7087432, 2.281125, 0.3372549, 0, 1, 1,
0.5711609, -2.026697, 4.867869, 0.345098, 0, 1, 1,
0.5740382, -0.03524426, 0.1113809, 0.3490196, 0, 1, 1,
0.5744242, -0.0270681, 0.9876363, 0.3568628, 0, 1, 1,
0.5816452, -0.5702336, 1.947718, 0.3607843, 0, 1, 1,
0.584055, -1.619705, 4.767369, 0.3686275, 0, 1, 1,
0.5842423, 0.7501148, 1.986247, 0.372549, 0, 1, 1,
0.5858821, 0.9850885, 0.9784152, 0.3803922, 0, 1, 1,
0.5861524, 1.350919, 1.575907, 0.3843137, 0, 1, 1,
0.5876125, 1.212164, 0.6949726, 0.3921569, 0, 1, 1,
0.5884398, 1.876503, 1.282076, 0.3960784, 0, 1, 1,
0.588821, 0.1305045, 1.137541, 0.4039216, 0, 1, 1,
0.5902629, 0.4299738, 0.4042949, 0.4117647, 0, 1, 1,
0.5931753, 0.8506495, -0.2075186, 0.4156863, 0, 1, 1,
0.5949283, 0.4866758, 1.739152, 0.4235294, 0, 1, 1,
0.5952635, 1.198334, 1.79072, 0.427451, 0, 1, 1,
0.5955596, 0.2334193, -0.2315417, 0.4352941, 0, 1, 1,
0.597405, -0.09545496, -0.3558749, 0.4392157, 0, 1, 1,
0.6007695, -0.09668107, 3.635145, 0.4470588, 0, 1, 1,
0.6043471, 0.7648768, 0.4608692, 0.4509804, 0, 1, 1,
0.6079566, -1.288368, 2.618589, 0.4588235, 0, 1, 1,
0.6083878, -0.5804621, 2.131093, 0.4627451, 0, 1, 1,
0.6094479, 2.225163, -0.488524, 0.4705882, 0, 1, 1,
0.6173999, -0.3170923, 2.868963, 0.4745098, 0, 1, 1,
0.6205995, 0.6917409, -0.2077259, 0.4823529, 0, 1, 1,
0.6227063, 0.4384993, 0.5045611, 0.4862745, 0, 1, 1,
0.6301128, -0.05437524, 2.873499, 0.4941176, 0, 1, 1,
0.6340729, -1.581353, 3.156979, 0.5019608, 0, 1, 1,
0.6436459, 0.3585467, 0.4071536, 0.5058824, 0, 1, 1,
0.6444923, 1.892338, -0.3678605, 0.5137255, 0, 1, 1,
0.6494797, 1.536052, 0.6431621, 0.5176471, 0, 1, 1,
0.6514137, 0.3249479, 1.947016, 0.5254902, 0, 1, 1,
0.6575373, 0.6694378, 1.085517, 0.5294118, 0, 1, 1,
0.6578729, -0.2976818, 4.183052, 0.5372549, 0, 1, 1,
0.6606238, -0.558118, 3.331465, 0.5411765, 0, 1, 1,
0.6612449, -1.167008, 2.304989, 0.5490196, 0, 1, 1,
0.6635334, 2.023591, -2.026948, 0.5529412, 0, 1, 1,
0.665563, -0.008187158, 2.688985, 0.5607843, 0, 1, 1,
0.6670383, -1.646961, 1.878679, 0.5647059, 0, 1, 1,
0.6685128, -0.7940677, 3.110113, 0.572549, 0, 1, 1,
0.6709903, -1.157337, 3.6407, 0.5764706, 0, 1, 1,
0.6723379, 0.3418292, 2.179901, 0.5843138, 0, 1, 1,
0.6737435, -0.4858013, 3.051139, 0.5882353, 0, 1, 1,
0.6776979, 0.537265, 0.9679508, 0.5960785, 0, 1, 1,
0.684429, 1.198191, 0.3583894, 0.6039216, 0, 1, 1,
0.6890501, 0.9920732, -0.5151331, 0.6078432, 0, 1, 1,
0.6913407, 0.02645457, 0.9673322, 0.6156863, 0, 1, 1,
0.7007326, 1.485548, 1.332086, 0.6196079, 0, 1, 1,
0.7029715, -1.704891, 3.792716, 0.627451, 0, 1, 1,
0.7032869, 2.200863, 0.432486, 0.6313726, 0, 1, 1,
0.7059146, 2.381655, 0.2150966, 0.6392157, 0, 1, 1,
0.7070245, -0.8051041, 2.205024, 0.6431373, 0, 1, 1,
0.7088161, 0.3053731, 2.418819, 0.6509804, 0, 1, 1,
0.7149553, -1.03168, 1.43988, 0.654902, 0, 1, 1,
0.718814, -0.674368, 2.105959, 0.6627451, 0, 1, 1,
0.7208614, 0.8369994, -0.4199868, 0.6666667, 0, 1, 1,
0.7216826, -0.01733863, 1.111279, 0.6745098, 0, 1, 1,
0.7266893, 1.46685, -0.8506856, 0.6784314, 0, 1, 1,
0.7301416, 0.2151564, 1.151193, 0.6862745, 0, 1, 1,
0.730596, -0.01358403, 0.01137005, 0.6901961, 0, 1, 1,
0.7398475, -1.473546, 2.973333, 0.6980392, 0, 1, 1,
0.7426627, 0.6377146, 1.925884, 0.7058824, 0, 1, 1,
0.7529086, -0.02382861, -0.2744233, 0.7098039, 0, 1, 1,
0.7535311, -0.4531843, 3.010339, 0.7176471, 0, 1, 1,
0.7582898, 1.092814, 0.3996798, 0.7215686, 0, 1, 1,
0.7613034, 0.32731, 2.526215, 0.7294118, 0, 1, 1,
0.765879, -1.874051, 2.064903, 0.7333333, 0, 1, 1,
0.7685794, -0.6197242, 2.749043, 0.7411765, 0, 1, 1,
0.7700477, 0.8997519, -2.034617, 0.7450981, 0, 1, 1,
0.7741091, -0.9374458, 2.918427, 0.7529412, 0, 1, 1,
0.780421, 0.04579155, 1.760564, 0.7568628, 0, 1, 1,
0.7887784, -0.2983677, 0.03637061, 0.7647059, 0, 1, 1,
0.78973, -0.440603, 2.160891, 0.7686275, 0, 1, 1,
0.7943309, -0.9590815, 2.806207, 0.7764706, 0, 1, 1,
0.7961224, 1.251246, -0.006833535, 0.7803922, 0, 1, 1,
0.8020332, -1.556155, 2.50426, 0.7882353, 0, 1, 1,
0.8022975, -1.488499, 3.985822, 0.7921569, 0, 1, 1,
0.8064149, 0.6951352, 1.353164, 0.8, 0, 1, 1,
0.8275232, -1.518231, 3.303847, 0.8078431, 0, 1, 1,
0.8287942, 0.3383994, 1.24353, 0.8117647, 0, 1, 1,
0.8316217, 0.8295024, 0.9321565, 0.8196079, 0, 1, 1,
0.8324206, -2.378536, 2.792672, 0.8235294, 0, 1, 1,
0.8347936, 1.296909, 1.891889, 0.8313726, 0, 1, 1,
0.8358259, -1.67535, 1.988174, 0.8352941, 0, 1, 1,
0.8481518, 2.178886, -0.8548199, 0.8431373, 0, 1, 1,
0.8501397, -0.9395955, 3.066052, 0.8470588, 0, 1, 1,
0.8516172, -0.3694724, 2.435895, 0.854902, 0, 1, 1,
0.8555893, -1.28591, 1.304042, 0.8588235, 0, 1, 1,
0.8563951, 0.6394591, -0.187386, 0.8666667, 0, 1, 1,
0.8655151, -0.5287871, 2.306113, 0.8705882, 0, 1, 1,
0.8674368, 0.2525695, 1.5482, 0.8784314, 0, 1, 1,
0.8754273, 1.013521, 0.08340089, 0.8823529, 0, 1, 1,
0.8764012, -1.140133, 1.201465, 0.8901961, 0, 1, 1,
0.8777981, 1.497838, 0.1768276, 0.8941177, 0, 1, 1,
0.8785759, -1.529821, 2.081593, 0.9019608, 0, 1, 1,
0.8805655, -2.176548, 2.919244, 0.9098039, 0, 1, 1,
0.882234, 0.3321762, 4.722142, 0.9137255, 0, 1, 1,
0.8876936, 0.3871339, 2.265686, 0.9215686, 0, 1, 1,
0.8888417, 0.2236543, 3.917856, 0.9254902, 0, 1, 1,
0.8892959, 0.09091721, 1.945859, 0.9333333, 0, 1, 1,
0.9012768, -0.09922612, 2.375406, 0.9372549, 0, 1, 1,
0.9089468, -1.085666, 3.973575, 0.945098, 0, 1, 1,
0.9139438, 1.116775, -0.7958074, 0.9490196, 0, 1, 1,
0.9164051, 0.5083268, -0.3343014, 0.9568627, 0, 1, 1,
0.9180937, 0.1685737, 1.74376, 0.9607843, 0, 1, 1,
0.9212574, 1.890903, 1.017267, 0.9686275, 0, 1, 1,
0.9249004, 0.4136652, 2.146473, 0.972549, 0, 1, 1,
0.9259269, 0.6641673, 0.6221036, 0.9803922, 0, 1, 1,
0.9317525, -0.8367116, 2.570773, 0.9843137, 0, 1, 1,
0.9367887, 0.08664807, 1.607228, 0.9921569, 0, 1, 1,
0.9387222, 0.05732547, 0.1629773, 0.9960784, 0, 1, 1,
0.9390425, -1.299485, 3.116229, 1, 0, 0.9960784, 1,
0.9399275, 2.499216, 0.8577537, 1, 0, 0.9882353, 1,
0.9420551, 0.1022176, 2.766017, 1, 0, 0.9843137, 1,
0.9422608, 0.3232879, 0.3461028, 1, 0, 0.9764706, 1,
0.9434122, 0.08406814, 0.06247335, 1, 0, 0.972549, 1,
0.9456201, 1.528196, 0.3888902, 1, 0, 0.9647059, 1,
0.9554958, 0.6448095, 1.060568, 1, 0, 0.9607843, 1,
0.9594919, -1.824873, 2.960298, 1, 0, 0.9529412, 1,
0.9615496, 1.433604, -3.31673, 1, 0, 0.9490196, 1,
0.963255, -0.4494585, 2.775341, 1, 0, 0.9411765, 1,
0.9641431, 0.344007, 2.211092, 1, 0, 0.9372549, 1,
0.9704826, 1.948902, 1.321031, 1, 0, 0.9294118, 1,
0.9723351, 0.5256397, 0.2388067, 1, 0, 0.9254902, 1,
0.9753917, 2.436848, 0.7284157, 1, 0, 0.9176471, 1,
0.9845135, 1.018331, -0.09946153, 1, 0, 0.9137255, 1,
0.9872096, 0.4206379, 1.167384, 1, 0, 0.9058824, 1,
0.9882329, -0.818108, 4.402211, 1, 0, 0.9019608, 1,
0.9891288, 0.5016453, 0.8817149, 1, 0, 0.8941177, 1,
0.9932647, -0.1635266, 2.38606, 1, 0, 0.8862745, 1,
0.9994249, 0.1233959, 2.357465, 1, 0, 0.8823529, 1,
0.9995325, 0.1741392, 0.9379092, 1, 0, 0.8745098, 1,
1.017578, -0.09825741, 2.870571, 1, 0, 0.8705882, 1,
1.019592, -1.162822, 1.254317, 1, 0, 0.8627451, 1,
1.026572, 0.7941035, 1.295636, 1, 0, 0.8588235, 1,
1.028076, 1.933869, -0.4118213, 1, 0, 0.8509804, 1,
1.028783, -0.6747903, 3.148974, 1, 0, 0.8470588, 1,
1.033234, 0.5895724, 1.43135, 1, 0, 0.8392157, 1,
1.036607, -0.2082376, 2.421209, 1, 0, 0.8352941, 1,
1.044797, -0.3648896, 1.451738, 1, 0, 0.827451, 1,
1.047134, 0.004091099, 2.620931, 1, 0, 0.8235294, 1,
1.048299, -0.4306884, 2.081944, 1, 0, 0.8156863, 1,
1.074462, 0.07370416, 1.149619, 1, 0, 0.8117647, 1,
1.08004, -0.6788246, 0.9291037, 1, 0, 0.8039216, 1,
1.092817, 0.5233039, 0.5413665, 1, 0, 0.7960784, 1,
1.111008, 1.376304, 1.841782, 1, 0, 0.7921569, 1,
1.113219, -1.175547, 4.715272, 1, 0, 0.7843137, 1,
1.113247, 0.4789633, 1.654534, 1, 0, 0.7803922, 1,
1.11556, -1.695723, 3.292465, 1, 0, 0.772549, 1,
1.118799, -0.2095156, -0.5484352, 1, 0, 0.7686275, 1,
1.125913, 0.1141672, 2.585261, 1, 0, 0.7607843, 1,
1.127413, 0.4345348, 0.6971283, 1, 0, 0.7568628, 1,
1.127744, 0.4794739, 1.010488, 1, 0, 0.7490196, 1,
1.130279, -0.4541451, 1.120265, 1, 0, 0.7450981, 1,
1.136765, 0.2790727, 2.530338, 1, 0, 0.7372549, 1,
1.14681, -0.03099658, -0.01751534, 1, 0, 0.7333333, 1,
1.151, -0.3742267, 1.803851, 1, 0, 0.7254902, 1,
1.156584, 1.650941, 0.2172346, 1, 0, 0.7215686, 1,
1.158828, -1.060396, 0.9636034, 1, 0, 0.7137255, 1,
1.160161, 1.052736, -0.6188422, 1, 0, 0.7098039, 1,
1.163235, -0.05564324, 2.190255, 1, 0, 0.7019608, 1,
1.171096, 0.1721065, -0.1947559, 1, 0, 0.6941177, 1,
1.173564, 2.077241, 0.84191, 1, 0, 0.6901961, 1,
1.174986, -0.6811743, 0.8976039, 1, 0, 0.682353, 1,
1.181815, -0.5618063, 0.7716929, 1, 0, 0.6784314, 1,
1.183051, -1.179136, 2.515022, 1, 0, 0.6705883, 1,
1.184008, -0.0468915, -0.1623795, 1, 0, 0.6666667, 1,
1.191884, -0.3878815, 2.175051, 1, 0, 0.6588235, 1,
1.195667, 0.2823426, 0.4692076, 1, 0, 0.654902, 1,
1.195912, 0.7684297, 1.479755, 1, 0, 0.6470588, 1,
1.196793, -0.5510275, 1.104305, 1, 0, 0.6431373, 1,
1.197034, 2.570362, -0.4560334, 1, 0, 0.6352941, 1,
1.197702, 0.8113103, 1.506808, 1, 0, 0.6313726, 1,
1.204359, -0.6425703, 2.162964, 1, 0, 0.6235294, 1,
1.207616, 0.1449097, 1.01349, 1, 0, 0.6196079, 1,
1.216059, -0.2013185, 0.1260445, 1, 0, 0.6117647, 1,
1.216097, 0.4941082, 0.1835737, 1, 0, 0.6078432, 1,
1.218794, 1.512983, 1.115041, 1, 0, 0.6, 1,
1.223243, 0.5400729, -0.04809568, 1, 0, 0.5921569, 1,
1.224576, 1.341578, -0.3419487, 1, 0, 0.5882353, 1,
1.228094, -0.118947, 1.683348, 1, 0, 0.5803922, 1,
1.230838, 0.5866728, 0.7375812, 1, 0, 0.5764706, 1,
1.232463, 0.2307182, 1.312074, 1, 0, 0.5686275, 1,
1.242073, 0.01353987, 0.9651563, 1, 0, 0.5647059, 1,
1.24385, 0.004212598, 1.709008, 1, 0, 0.5568628, 1,
1.244348, 0.8914423, 2.408105, 1, 0, 0.5529412, 1,
1.246794, -0.3943597, 1.759261, 1, 0, 0.5450981, 1,
1.248195, 0.6355746, 1.111778, 1, 0, 0.5411765, 1,
1.252227, -0.2161466, 1.977068, 1, 0, 0.5333334, 1,
1.253329, -1.585172, 2.635488, 1, 0, 0.5294118, 1,
1.254908, 1.928628, 2.20916, 1, 0, 0.5215687, 1,
1.277889, 0.1119442, 2.26811, 1, 0, 0.5176471, 1,
1.304201, 1.786029, 1.319759, 1, 0, 0.509804, 1,
1.304717, -1.369874, 2.090391, 1, 0, 0.5058824, 1,
1.316797, 0.01737222, 1.014428, 1, 0, 0.4980392, 1,
1.318652, -2.865898, 3.187652, 1, 0, 0.4901961, 1,
1.338416, 1.789128, 0.8553759, 1, 0, 0.4862745, 1,
1.341999, -0.5892724, 2.966523, 1, 0, 0.4784314, 1,
1.356843, -0.2696658, 0.4861761, 1, 0, 0.4745098, 1,
1.358328, -0.8643157, 4.125849, 1, 0, 0.4666667, 1,
1.360419, 1.047206, 1.531182, 1, 0, 0.4627451, 1,
1.361318, -0.1485688, 2.8482, 1, 0, 0.454902, 1,
1.362697, 1.283299, 2.26775, 1, 0, 0.4509804, 1,
1.367475, 0.2998566, 1.136714, 1, 0, 0.4431373, 1,
1.386653, -0.2531912, 1.521884, 1, 0, 0.4392157, 1,
1.400511, 0.453871, 1.252803, 1, 0, 0.4313726, 1,
1.42061, -1.813026, 1.523207, 1, 0, 0.427451, 1,
1.422703, 0.7033868, -1.007554, 1, 0, 0.4196078, 1,
1.440898, -0.01876121, 3.022397, 1, 0, 0.4156863, 1,
1.460298, 0.8805636, 1.567914, 1, 0, 0.4078431, 1,
1.464494, -1.577655, 3.531832, 1, 0, 0.4039216, 1,
1.47962, -1.528777, 2.182062, 1, 0, 0.3960784, 1,
1.508938, 1.034979, 1.183343, 1, 0, 0.3882353, 1,
1.51681, 0.310481, 1.220093, 1, 0, 0.3843137, 1,
1.519251, 1.954907, 0.7281944, 1, 0, 0.3764706, 1,
1.521754, 1.272107, 0.7565032, 1, 0, 0.372549, 1,
1.521969, -1.904338, 4.11713, 1, 0, 0.3647059, 1,
1.541214, -0.1316879, 1.308824, 1, 0, 0.3607843, 1,
1.547444, -0.2895139, 1.637507, 1, 0, 0.3529412, 1,
1.549691, 0.1667606, 1.959196, 1, 0, 0.3490196, 1,
1.549864, 0.01662466, 3.761184, 1, 0, 0.3411765, 1,
1.55614, 1.443246, 1.076397, 1, 0, 0.3372549, 1,
1.565566, 0.383605, 0.5064952, 1, 0, 0.3294118, 1,
1.570827, -0.6094595, 2.464591, 1, 0, 0.3254902, 1,
1.576787, -0.007688178, 2.03796, 1, 0, 0.3176471, 1,
1.577703, 0.1398842, 0.3020053, 1, 0, 0.3137255, 1,
1.592455, 0.5067219, 0.8294058, 1, 0, 0.3058824, 1,
1.598145, -0.935551, 3.63382, 1, 0, 0.2980392, 1,
1.600459, 1.323674, 0.4023054, 1, 0, 0.2941177, 1,
1.608193, 0.4246325, 3.316902, 1, 0, 0.2862745, 1,
1.614589, 0.1623648, 2.335608, 1, 0, 0.282353, 1,
1.625959, 0.1155694, 2.563312, 1, 0, 0.2745098, 1,
1.632291, 0.1290299, 0.3547486, 1, 0, 0.2705882, 1,
1.636857, 0.6240038, 1.149063, 1, 0, 0.2627451, 1,
1.645531, 0.3260602, 2.879928, 1, 0, 0.2588235, 1,
1.654136, -2.373839, 2.848913, 1, 0, 0.2509804, 1,
1.654544, -0.3635344, 1.443261, 1, 0, 0.2470588, 1,
1.675233, 1.806918, 0.9585218, 1, 0, 0.2392157, 1,
1.681495, -0.03120214, 3.287153, 1, 0, 0.2352941, 1,
1.682203, 1.088067, 1.090899, 1, 0, 0.227451, 1,
1.708539, 0.6448889, 2.064392, 1, 0, 0.2235294, 1,
1.708694, -0.4447388, 2.873253, 1, 0, 0.2156863, 1,
1.714534, 0.5707558, 1.628091, 1, 0, 0.2117647, 1,
1.728471, 0.1756182, 0.7545776, 1, 0, 0.2039216, 1,
1.744261, 2.550866, -0.4677436, 1, 0, 0.1960784, 1,
1.752889, 0.8778172, 1.689128, 1, 0, 0.1921569, 1,
1.760216, 0.717531, 3.223831, 1, 0, 0.1843137, 1,
1.761063, -0.9835503, 1.286193, 1, 0, 0.1803922, 1,
1.764145, -0.01305, 1.768082, 1, 0, 0.172549, 1,
1.834333, -1.462295, 1.804918, 1, 0, 0.1686275, 1,
1.835261, 0.6787051, 0.08660221, 1, 0, 0.1607843, 1,
1.907502, -1.572692, 2.117708, 1, 0, 0.1568628, 1,
1.911759, -0.1761369, 1.663244, 1, 0, 0.1490196, 1,
1.925792, 0.3452485, 0.791584, 1, 0, 0.145098, 1,
1.928235, -0.6987559, 1.445676, 1, 0, 0.1372549, 1,
1.948989, 0.5607969, 1.436829, 1, 0, 0.1333333, 1,
1.972687, 0.4890648, 0.05784568, 1, 0, 0.1254902, 1,
1.985903, 1.584016, 2.289209, 1, 0, 0.1215686, 1,
2.029452, -0.0379282, 2.220942, 1, 0, 0.1137255, 1,
2.061575, -1.309798, 2.087591, 1, 0, 0.1098039, 1,
2.067772, 1.202272, 1.554468, 1, 0, 0.1019608, 1,
2.094312, 1.087937, 1.030288, 1, 0, 0.09411765, 1,
2.098808, 1.386249, 1.891831, 1, 0, 0.09019608, 1,
2.131069, 0.4727269, 2.846172, 1, 0, 0.08235294, 1,
2.147113, 1.716633, 0.7265806, 1, 0, 0.07843138, 1,
2.174611, 0.2242547, 3.258898, 1, 0, 0.07058824, 1,
2.201781, -0.6306913, 1.005223, 1, 0, 0.06666667, 1,
2.22252, 0.4008942, 0.5830715, 1, 0, 0.05882353, 1,
2.249765, 0.1700923, 0.3111311, 1, 0, 0.05490196, 1,
2.282952, 0.6532536, 2.210119, 1, 0, 0.04705882, 1,
2.299766, -1.391881, 2.632573, 1, 0, 0.04313726, 1,
2.353806, -0.1051715, 0.04113161, 1, 0, 0.03529412, 1,
2.369477, -2.020076, 2.586609, 1, 0, 0.03137255, 1,
2.399599, -1.653663, 0.6374812, 1, 0, 0.02352941, 1,
2.5867, -0.8285253, 1.576887, 1, 0, 0.01960784, 1,
2.602203, -0.7010198, 2.958639, 1, 0, 0.01176471, 1,
3.300031, -0.9632893, 2.552887, 1, 0, 0.007843138, 1
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
0.3905162, -4.988228, -7.083432, 0, -0.5, 0.5, 0.5,
0.3905162, -4.988228, -7.083432, 1, -0.5, 0.5, 0.5,
0.3905162, -4.988228, -7.083432, 1, 1.5, 0.5, 0.5,
0.3905162, -4.988228, -7.083432, 0, 1.5, 0.5, 0.5
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
-3.505324, -0.3513825, -7.083432, 0, -0.5, 0.5, 0.5,
-3.505324, -0.3513825, -7.083432, 1, -0.5, 0.5, 0.5,
-3.505324, -0.3513825, -7.083432, 1, 1.5, 0.5, 0.5,
-3.505324, -0.3513825, -7.083432, 0, 1.5, 0.5, 0.5
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
-3.505324, -4.988228, 0.2978082, 0, -0.5, 0.5, 0.5,
-3.505324, -4.988228, 0.2978082, 1, -0.5, 0.5, 0.5,
-3.505324, -4.988228, 0.2978082, 1, 1.5, 0.5, 0.5,
-3.505324, -4.988228, 0.2978082, 0, 1.5, 0.5, 0.5
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
-2, -3.918187, -5.380069,
3, -3.918187, -5.380069,
-2, -3.918187, -5.380069,
-2, -4.096527, -5.663962,
-1, -3.918187, -5.380069,
-1, -4.096527, -5.663962,
0, -3.918187, -5.380069,
0, -4.096527, -5.663962,
1, -3.918187, -5.380069,
1, -4.096527, -5.663962,
2, -3.918187, -5.380069,
2, -4.096527, -5.663962,
3, -3.918187, -5.380069,
3, -4.096527, -5.663962
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
-2, -4.453207, -6.23175, 0, -0.5, 0.5, 0.5,
-2, -4.453207, -6.23175, 1, -0.5, 0.5, 0.5,
-2, -4.453207, -6.23175, 1, 1.5, 0.5, 0.5,
-2, -4.453207, -6.23175, 0, 1.5, 0.5, 0.5,
-1, -4.453207, -6.23175, 0, -0.5, 0.5, 0.5,
-1, -4.453207, -6.23175, 1, -0.5, 0.5, 0.5,
-1, -4.453207, -6.23175, 1, 1.5, 0.5, 0.5,
-1, -4.453207, -6.23175, 0, 1.5, 0.5, 0.5,
0, -4.453207, -6.23175, 0, -0.5, 0.5, 0.5,
0, -4.453207, -6.23175, 1, -0.5, 0.5, 0.5,
0, -4.453207, -6.23175, 1, 1.5, 0.5, 0.5,
0, -4.453207, -6.23175, 0, 1.5, 0.5, 0.5,
1, -4.453207, -6.23175, 0, -0.5, 0.5, 0.5,
1, -4.453207, -6.23175, 1, -0.5, 0.5, 0.5,
1, -4.453207, -6.23175, 1, 1.5, 0.5, 0.5,
1, -4.453207, -6.23175, 0, 1.5, 0.5, 0.5,
2, -4.453207, -6.23175, 0, -0.5, 0.5, 0.5,
2, -4.453207, -6.23175, 1, -0.5, 0.5, 0.5,
2, -4.453207, -6.23175, 1, 1.5, 0.5, 0.5,
2, -4.453207, -6.23175, 0, 1.5, 0.5, 0.5,
3, -4.453207, -6.23175, 0, -0.5, 0.5, 0.5,
3, -4.453207, -6.23175, 1, -0.5, 0.5, 0.5,
3, -4.453207, -6.23175, 1, 1.5, 0.5, 0.5,
3, -4.453207, -6.23175, 0, 1.5, 0.5, 0.5
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
-2.606284, -3, -5.380069,
-2.606284, 3, -5.380069,
-2.606284, -3, -5.380069,
-2.756124, -3, -5.663962,
-2.606284, -2, -5.380069,
-2.756124, -2, -5.663962,
-2.606284, -1, -5.380069,
-2.756124, -1, -5.663962,
-2.606284, 0, -5.380069,
-2.756124, 0, -5.663962,
-2.606284, 1, -5.380069,
-2.756124, 1, -5.663962,
-2.606284, 2, -5.380069,
-2.756124, 2, -5.663962,
-2.606284, 3, -5.380069,
-2.756124, 3, -5.663962
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
-3.055804, -3, -6.23175, 0, -0.5, 0.5, 0.5,
-3.055804, -3, -6.23175, 1, -0.5, 0.5, 0.5,
-3.055804, -3, -6.23175, 1, 1.5, 0.5, 0.5,
-3.055804, -3, -6.23175, 0, 1.5, 0.5, 0.5,
-3.055804, -2, -6.23175, 0, -0.5, 0.5, 0.5,
-3.055804, -2, -6.23175, 1, -0.5, 0.5, 0.5,
-3.055804, -2, -6.23175, 1, 1.5, 0.5, 0.5,
-3.055804, -2, -6.23175, 0, 1.5, 0.5, 0.5,
-3.055804, -1, -6.23175, 0, -0.5, 0.5, 0.5,
-3.055804, -1, -6.23175, 1, -0.5, 0.5, 0.5,
-3.055804, -1, -6.23175, 1, 1.5, 0.5, 0.5,
-3.055804, -1, -6.23175, 0, 1.5, 0.5, 0.5,
-3.055804, 0, -6.23175, 0, -0.5, 0.5, 0.5,
-3.055804, 0, -6.23175, 1, -0.5, 0.5, 0.5,
-3.055804, 0, -6.23175, 1, 1.5, 0.5, 0.5,
-3.055804, 0, -6.23175, 0, 1.5, 0.5, 0.5,
-3.055804, 1, -6.23175, 0, -0.5, 0.5, 0.5,
-3.055804, 1, -6.23175, 1, -0.5, 0.5, 0.5,
-3.055804, 1, -6.23175, 1, 1.5, 0.5, 0.5,
-3.055804, 1, -6.23175, 0, 1.5, 0.5, 0.5,
-3.055804, 2, -6.23175, 0, -0.5, 0.5, 0.5,
-3.055804, 2, -6.23175, 1, -0.5, 0.5, 0.5,
-3.055804, 2, -6.23175, 1, 1.5, 0.5, 0.5,
-3.055804, 2, -6.23175, 0, 1.5, 0.5, 0.5,
-3.055804, 3, -6.23175, 0, -0.5, 0.5, 0.5,
-3.055804, 3, -6.23175, 1, -0.5, 0.5, 0.5,
-3.055804, 3, -6.23175, 1, 1.5, 0.5, 0.5,
-3.055804, 3, -6.23175, 0, 1.5, 0.5, 0.5
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
-2.606284, -3.918187, -4,
-2.606284, -3.918187, 4,
-2.606284, -3.918187, -4,
-2.756124, -4.096527, -4,
-2.606284, -3.918187, -2,
-2.756124, -4.096527, -2,
-2.606284, -3.918187, 0,
-2.756124, -4.096527, 0,
-2.606284, -3.918187, 2,
-2.756124, -4.096527, 2,
-2.606284, -3.918187, 4,
-2.756124, -4.096527, 4
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
-3.055804, -4.453207, -4, 0, -0.5, 0.5, 0.5,
-3.055804, -4.453207, -4, 1, -0.5, 0.5, 0.5,
-3.055804, -4.453207, -4, 1, 1.5, 0.5, 0.5,
-3.055804, -4.453207, -4, 0, 1.5, 0.5, 0.5,
-3.055804, -4.453207, -2, 0, -0.5, 0.5, 0.5,
-3.055804, -4.453207, -2, 1, -0.5, 0.5, 0.5,
-3.055804, -4.453207, -2, 1, 1.5, 0.5, 0.5,
-3.055804, -4.453207, -2, 0, 1.5, 0.5, 0.5,
-3.055804, -4.453207, 0, 0, -0.5, 0.5, 0.5,
-3.055804, -4.453207, 0, 1, -0.5, 0.5, 0.5,
-3.055804, -4.453207, 0, 1, 1.5, 0.5, 0.5,
-3.055804, -4.453207, 0, 0, 1.5, 0.5, 0.5,
-3.055804, -4.453207, 2, 0, -0.5, 0.5, 0.5,
-3.055804, -4.453207, 2, 1, -0.5, 0.5, 0.5,
-3.055804, -4.453207, 2, 1, 1.5, 0.5, 0.5,
-3.055804, -4.453207, 2, 0, 1.5, 0.5, 0.5,
-3.055804, -4.453207, 4, 0, -0.5, 0.5, 0.5,
-3.055804, -4.453207, 4, 1, -0.5, 0.5, 0.5,
-3.055804, -4.453207, 4, 1, 1.5, 0.5, 0.5,
-3.055804, -4.453207, 4, 0, 1.5, 0.5, 0.5
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
-2.606284, -3.918187, -5.380069,
-2.606284, 3.215422, -5.380069,
-2.606284, -3.918187, 5.975685,
-2.606284, 3.215422, 5.975685,
-2.606284, -3.918187, -5.380069,
-2.606284, -3.918187, 5.975685,
-2.606284, 3.215422, -5.380069,
-2.606284, 3.215422, 5.975685,
-2.606284, -3.918187, -5.380069,
3.387317, -3.918187, -5.380069,
-2.606284, -3.918187, 5.975685,
3.387317, -3.918187, 5.975685,
-2.606284, 3.215422, -5.380069,
3.387317, 3.215422, -5.380069,
-2.606284, 3.215422, 5.975685,
3.387317, 3.215422, 5.975685,
3.387317, -3.918187, -5.380069,
3.387317, 3.215422, -5.380069,
3.387317, -3.918187, 5.975685,
3.387317, 3.215422, 5.975685,
3.387317, -3.918187, -5.380069,
3.387317, -3.918187, 5.975685,
3.387317, 3.215422, -5.380069,
3.387317, 3.215422, 5.975685
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
var radius = 7.843605;
var distance = 34.89708;
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
mvMatrix.translate( -0.3905162, 0.3513825, -0.2978082 );
mvMatrix.scale( 1.414952, 1.188832, 0.7468161 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.89708);
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
methabenzthiazuron<-read.table("methabenzthiazuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methabenzthiazuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'methabenzthiazuron' not found
```

```r
y<-methabenzthiazuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'methabenzthiazuron' not found
```

```r
z<-methabenzthiazuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'methabenzthiazuron' not found
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
-2.518999, -1.246323, -4.107244, 0, 0, 1, 1, 1,
-2.474459, -1.457051, -2.700823, 1, 0, 0, 1, 1,
-2.433639, -1.816774, -1.710712, 1, 0, 0, 1, 1,
-2.415811, -0.9366452, -2.920329, 1, 0, 0, 1, 1,
-2.287404, 0.06490677, -1.106013, 1, 0, 0, 1, 1,
-2.284858, -0.5379277, -1.934477, 1, 0, 0, 1, 1,
-2.274407, 0.1338308, -2.333535, 0, 0, 0, 1, 1,
-2.265653, 2.613397, -2.502801, 0, 0, 0, 1, 1,
-2.265604, -0.548115, -1.072734, 0, 0, 0, 1, 1,
-2.250076, 0.2988826, -1.745052, 0, 0, 0, 1, 1,
-2.203854, 1.102951, -2.872501, 0, 0, 0, 1, 1,
-2.158903, -0.1990012, -1.68867, 0, 0, 0, 1, 1,
-2.138179, 0.191666, -1.25933, 0, 0, 0, 1, 1,
-2.135437, 0.4121689, 0.1268157, 1, 1, 1, 1, 1,
-2.106431, 0.8136393, -0.6316974, 1, 1, 1, 1, 1,
-2.081283, -0.7181824, -3.493197, 1, 1, 1, 1, 1,
-2.056783, -1.800113, -2.285762, 1, 1, 1, 1, 1,
-2.05259, -2.298561, -1.137437, 1, 1, 1, 1, 1,
-2.013439, -0.9882882, -0.4484393, 1, 1, 1, 1, 1,
-2.010075, 1.021811, -0.3890546, 1, 1, 1, 1, 1,
-2.007525, 1.302444, -1.433733, 1, 1, 1, 1, 1,
-1.984303, 0.250187, 0.1836183, 1, 1, 1, 1, 1,
-1.980688, -1.269396, -1.444558, 1, 1, 1, 1, 1,
-1.951595, -1.57807, -1.976801, 1, 1, 1, 1, 1,
-1.914156, 0.7696053, -3.262214, 1, 1, 1, 1, 1,
-1.909871, 0.8064657, 0.02624668, 1, 1, 1, 1, 1,
-1.895976, 0.08799618, -1.571579, 1, 1, 1, 1, 1,
-1.888656, 0.7115682, -1.950696, 1, 1, 1, 1, 1,
-1.877797, -0.9589319, -2.872001, 0, 0, 1, 1, 1,
-1.876826, -0.7426454, 0.1364892, 1, 0, 0, 1, 1,
-1.866368, -0.8938045, -1.370752, 1, 0, 0, 1, 1,
-1.861326, -0.9050756, -1.243444, 1, 0, 0, 1, 1,
-1.837324, -0.8496808, -2.899978, 1, 0, 0, 1, 1,
-1.81721, -0.6839516, -2.520117, 1, 0, 0, 1, 1,
-1.81219, 1.024236, -0.5937048, 0, 0, 0, 1, 1,
-1.80405, 0.7954393, -0.5828159, 0, 0, 0, 1, 1,
-1.800863, -1.738663, -2.104104, 0, 0, 0, 1, 1,
-1.794019, -1.507626, -2.308332, 0, 0, 0, 1, 1,
-1.789606, 0.8276864, -0.08217832, 0, 0, 0, 1, 1,
-1.773825, -0.4152762, -1.252678, 0, 0, 0, 1, 1,
-1.770955, -0.2521852, -2.048702, 0, 0, 0, 1, 1,
-1.769861, 0.1915748, -2.199717, 1, 1, 1, 1, 1,
-1.768556, -0.855665, -1.361081, 1, 1, 1, 1, 1,
-1.760883, -0.6659078, -2.981504, 1, 1, 1, 1, 1,
-1.760747, -1.105961, -2.534883, 1, 1, 1, 1, 1,
-1.76031, 0.4458465, -0.952625, 1, 1, 1, 1, 1,
-1.724809, 0.5266724, 0.5756184, 1, 1, 1, 1, 1,
-1.724234, 1.148787, -2.95405, 1, 1, 1, 1, 1,
-1.719796, 0.01286012, -3.542011, 1, 1, 1, 1, 1,
-1.70636, -0.5929416, -1.258641, 1, 1, 1, 1, 1,
-1.704663, 0.2738148, -1.394132, 1, 1, 1, 1, 1,
-1.703376, -0.07704243, -1.717476, 1, 1, 1, 1, 1,
-1.700031, 0.7733068, -2.628265, 1, 1, 1, 1, 1,
-1.687196, -0.3825528, -1.509615, 1, 1, 1, 1, 1,
-1.686999, -0.9139617, -2.107296, 1, 1, 1, 1, 1,
-1.681599, 1.298982, -0.8203561, 1, 1, 1, 1, 1,
-1.670474, -1.230562, -3.462052, 0, 0, 1, 1, 1,
-1.668793, 0.6495073, -0.5764029, 1, 0, 0, 1, 1,
-1.623614, 2.16436, -0.8608051, 1, 0, 0, 1, 1,
-1.614982, 1.318319, -1.215718, 1, 0, 0, 1, 1,
-1.608343, -0.08949532, -1.093799, 1, 0, 0, 1, 1,
-1.591115, -0.1592104, -1.821352, 1, 0, 0, 1, 1,
-1.583579, 0.7188147, 0.6893384, 0, 0, 0, 1, 1,
-1.581998, 1.063637, 0.2424026, 0, 0, 0, 1, 1,
-1.575813, 1.332184, -0.665703, 0, 0, 0, 1, 1,
-1.572369, 0.3000498, -0.4059057, 0, 0, 0, 1, 1,
-1.560245, 1.646655, -1.867148, 0, 0, 0, 1, 1,
-1.556447, -0.4837812, -0.8011781, 0, 0, 0, 1, 1,
-1.553743, 0.4714298, -0.02992287, 0, 0, 0, 1, 1,
-1.553112, -0.04770941, 0.3340224, 1, 1, 1, 1, 1,
-1.551492, 0.7422197, -1.429095, 1, 1, 1, 1, 1,
-1.550237, -1.422528, -3.567622, 1, 1, 1, 1, 1,
-1.549446, -1.897178, -3.020877, 1, 1, 1, 1, 1,
-1.536312, -0.7106275, -0.7685944, 1, 1, 1, 1, 1,
-1.529057, -2.27138, -2.551341, 1, 1, 1, 1, 1,
-1.511708, 1.574094, -0.6064827, 1, 1, 1, 1, 1,
-1.494153, 2.416175, -0.1952676, 1, 1, 1, 1, 1,
-1.488986, -0.2204874, -1.688397, 1, 1, 1, 1, 1,
-1.477149, -0.07340468, -2.384633, 1, 1, 1, 1, 1,
-1.469333, -3.385068, -3.515061, 1, 1, 1, 1, 1,
-1.464302, 0.3933035, -2.925627, 1, 1, 1, 1, 1,
-1.458759, -0.9448963, -1.766362, 1, 1, 1, 1, 1,
-1.449732, 0.9138367, 0.4357414, 1, 1, 1, 1, 1,
-1.435084, -1.26043, -0.3447184, 1, 1, 1, 1, 1,
-1.432732, 0.4353951, -1.887919, 0, 0, 1, 1, 1,
-1.425468, 0.2980306, -0.4959937, 1, 0, 0, 1, 1,
-1.423572, -0.5817901, -3.687824, 1, 0, 0, 1, 1,
-1.406752, -0.5260493, -3.123904, 1, 0, 0, 1, 1,
-1.398797, 2.703621, -0.01876895, 1, 0, 0, 1, 1,
-1.397663, -0.9316773, -1.827118, 1, 0, 0, 1, 1,
-1.393237, 0.7620531, -3.460564, 0, 0, 0, 1, 1,
-1.386026, 1.301676, -0.707042, 0, 0, 0, 1, 1,
-1.384694, 1.103712, -0.1571547, 0, 0, 0, 1, 1,
-1.38118, -0.2908532, -0.7972918, 0, 0, 0, 1, 1,
-1.37892, 0.2703973, -2.347308, 0, 0, 0, 1, 1,
-1.378545, 0.06589969, -2.557024, 0, 0, 0, 1, 1,
-1.373059, -0.5904981, -2.875288, 0, 0, 0, 1, 1,
-1.365219, 2.060029, -0.4663336, 1, 1, 1, 1, 1,
-1.360523, 0.6851717, -2.358327, 1, 1, 1, 1, 1,
-1.35384, 0.3854592, -0.5451801, 1, 1, 1, 1, 1,
-1.352443, -0.490558, 0.05487242, 1, 1, 1, 1, 1,
-1.337943, 0.6764727, -0.6272035, 1, 1, 1, 1, 1,
-1.33736, -0.1760644, -0.09096052, 1, 1, 1, 1, 1,
-1.33598, -0.1167176, -1.94124, 1, 1, 1, 1, 1,
-1.332717, -0.2693375, -1.219328, 1, 1, 1, 1, 1,
-1.332328, -1.194621, -2.742298, 1, 1, 1, 1, 1,
-1.325402, 0.2691254, -2.518596, 1, 1, 1, 1, 1,
-1.324186, 1.07826, -1.244083, 1, 1, 1, 1, 1,
-1.321322, -1.03361, -1.033833, 1, 1, 1, 1, 1,
-1.311616, 1.316984, -1.250072, 1, 1, 1, 1, 1,
-1.309019, 1.27524, -0.316618, 1, 1, 1, 1, 1,
-1.303134, 0.4891644, -1.496426, 1, 1, 1, 1, 1,
-1.293092, 0.3084545, -1.294448, 0, 0, 1, 1, 1,
-1.288571, 0.8632869, -1.399955, 1, 0, 0, 1, 1,
-1.28845, -1.818069, -4.383424, 1, 0, 0, 1, 1,
-1.28826, 0.579483, -1.424807, 1, 0, 0, 1, 1,
-1.282888, -0.06591732, -1.265325, 1, 0, 0, 1, 1,
-1.271153, 0.7456074, -0.3768187, 1, 0, 0, 1, 1,
-1.269827, -0.214019, -2.513241, 0, 0, 0, 1, 1,
-1.255963, 0.5805901, -0.4203194, 0, 0, 0, 1, 1,
-1.252759, -1.084974, -3.562363, 0, 0, 0, 1, 1,
-1.249688, 0.05463988, -0.4467874, 0, 0, 0, 1, 1,
-1.240126, 0.599018, -1.782812, 0, 0, 0, 1, 1,
-1.238499, 1.057424, -2.02819, 0, 0, 0, 1, 1,
-1.228098, -0.2358369, -1.70419, 0, 0, 0, 1, 1,
-1.21669, 0.6934317, -1.830529, 1, 1, 1, 1, 1,
-1.20026, -0.1557272, -2.111993, 1, 1, 1, 1, 1,
-1.196024, -0.7420365, -0.1340191, 1, 1, 1, 1, 1,
-1.194239, 1.691492, -0.6209935, 1, 1, 1, 1, 1,
-1.173007, -1.664522, -2.495426, 1, 1, 1, 1, 1,
-1.168192, 0.2543561, -1.069867, 1, 1, 1, 1, 1,
-1.166548, 0.3456804, -1.111385, 1, 1, 1, 1, 1,
-1.161249, -0.547024, -2.877245, 1, 1, 1, 1, 1,
-1.155762, 1.515717, -0.7931992, 1, 1, 1, 1, 1,
-1.15465, -1.657645, -3.476941, 1, 1, 1, 1, 1,
-1.151558, 1.587555, 0.3050872, 1, 1, 1, 1, 1,
-1.150235, -1.432721, -2.709893, 1, 1, 1, 1, 1,
-1.145434, -0.3092451, -2.005028, 1, 1, 1, 1, 1,
-1.144565, 0.8742377, -2.121943, 1, 1, 1, 1, 1,
-1.144299, -0.2317831, -2.323859, 1, 1, 1, 1, 1,
-1.138664, 1.416647, -1.194799, 0, 0, 1, 1, 1,
-1.135507, -0.6222216, -3.306367, 1, 0, 0, 1, 1,
-1.128832, 0.07070102, -3.166152, 1, 0, 0, 1, 1,
-1.123488, 0.1245688, -2.417111, 1, 0, 0, 1, 1,
-1.120979, -0.1154984, -2.322245, 1, 0, 0, 1, 1,
-1.119745, -0.3681062, -2.709117, 1, 0, 0, 1, 1,
-1.11698, -1.074519, -2.761128, 0, 0, 0, 1, 1,
-1.114587, -1.128195, -2.160103, 0, 0, 0, 1, 1,
-1.111378, -0.5498397, -1.34398, 0, 0, 0, 1, 1,
-1.110803, -0.05733474, -1.182982, 0, 0, 0, 1, 1,
-1.106576, -0.7323416, -3.63139, 0, 0, 0, 1, 1,
-1.104299, -0.7488397, -3.159263, 0, 0, 0, 1, 1,
-1.103922, -1.049637, -1.697578, 0, 0, 0, 1, 1,
-1.101003, 0.4148589, -1.505744, 1, 1, 1, 1, 1,
-1.091391, 1.890099, -1.327495, 1, 1, 1, 1, 1,
-1.083159, 0.2125938, -0.3752804, 1, 1, 1, 1, 1,
-1.081538, -2.120358, -3.643448, 1, 1, 1, 1, 1,
-1.068196, -1.245167, -0.3298443, 1, 1, 1, 1, 1,
-1.060306, 0.3091707, -0.9597935, 1, 1, 1, 1, 1,
-1.057573, -0.745771, -1.642339, 1, 1, 1, 1, 1,
-1.05437, 0.3144608, -1.347644, 1, 1, 1, 1, 1,
-1.051113, 1.04492, -1.27298, 1, 1, 1, 1, 1,
-1.05043, 0.6449482, -1.794109, 1, 1, 1, 1, 1,
-1.044643, -0.3552876, -0.8273021, 1, 1, 1, 1, 1,
-1.044328, -0.7303963, -0.952271, 1, 1, 1, 1, 1,
-1.041591, -2.328149, -1.751421, 1, 1, 1, 1, 1,
-1.038472, 1.199016, -1.160351, 1, 1, 1, 1, 1,
-1.035412, -0.02028422, -1.616664, 1, 1, 1, 1, 1,
-1.033616, -0.3443815, -1.413528, 0, 0, 1, 1, 1,
-1.031048, 1.026041, 0.5757304, 1, 0, 0, 1, 1,
-1.029388, 0.8514965, -1.510359, 1, 0, 0, 1, 1,
-1.024198, 0.0677578, -1.760461, 1, 0, 0, 1, 1,
-1.020609, -0.7992225, -2.542323, 1, 0, 0, 1, 1,
-1.018902, -1.951332, -2.441591, 1, 0, 0, 1, 1,
-1.007693, -0.2773159, -1.996249, 0, 0, 0, 1, 1,
-1.004775, -0.7141262, -1.636796, 0, 0, 0, 1, 1,
-1.001255, -0.6117408, -5.203009, 0, 0, 0, 1, 1,
-0.9964955, -1.496852, -3.104658, 0, 0, 0, 1, 1,
-0.9938158, -0.2336295, -1.415741, 0, 0, 0, 1, 1,
-0.9886866, 0.5752744, -0.6430904, 0, 0, 0, 1, 1,
-0.9882273, 0.005834483, -0.543762, 0, 0, 0, 1, 1,
-0.9733762, 0.5388194, -2.162158, 1, 1, 1, 1, 1,
-0.9731401, -1.095939, -2.238312, 1, 1, 1, 1, 1,
-0.9731099, -0.6115482, -2.984491, 1, 1, 1, 1, 1,
-0.969852, -0.8636304, -2.492587, 1, 1, 1, 1, 1,
-0.9695752, -0.309396, -1.195867, 1, 1, 1, 1, 1,
-0.9694892, 0.40607, -0.8542467, 1, 1, 1, 1, 1,
-0.9655645, -1.099771, -2.02919, 1, 1, 1, 1, 1,
-0.9640889, -0.09170136, -2.444016, 1, 1, 1, 1, 1,
-0.9612021, 0.4077991, -0.9242677, 1, 1, 1, 1, 1,
-0.9606262, -0.2010554, -1.005194, 1, 1, 1, 1, 1,
-0.9524113, -2.741065, -4.018938, 1, 1, 1, 1, 1,
-0.9505137, -1.44305, -2.486832, 1, 1, 1, 1, 1,
-0.9500993, -1.699831, -2.997797, 1, 1, 1, 1, 1,
-0.9446377, -0.5306341, -2.682422, 1, 1, 1, 1, 1,
-0.9413139, -0.1635194, -1.380968, 1, 1, 1, 1, 1,
-0.9386427, 1.028418, -0.8221187, 0, 0, 1, 1, 1,
-0.93858, -1.722802, -1.807482, 1, 0, 0, 1, 1,
-0.9383369, -1.054611, -2.494444, 1, 0, 0, 1, 1,
-0.9297062, 1.247082, -0.8825834, 1, 0, 0, 1, 1,
-0.9284932, 0.03454025, 0.9172983, 1, 0, 0, 1, 1,
-0.9239522, -1.017871, -2.258444, 1, 0, 0, 1, 1,
-0.9168687, -0.9803408, -1.619514, 0, 0, 0, 1, 1,
-0.9044058, 0.1348296, -0.5724249, 0, 0, 0, 1, 1,
-0.9027572, 1.253395, -1.805231, 0, 0, 0, 1, 1,
-0.9012045, 0.5774713, -0.8894641, 0, 0, 0, 1, 1,
-0.8993701, -0.2118047, -1.985647, 0, 0, 0, 1, 1,
-0.8955066, -0.7302718, -2.227087, 0, 0, 0, 1, 1,
-0.8890053, 0.6340293, -4.090605, 0, 0, 0, 1, 1,
-0.8882494, -0.4673445, -1.680331, 1, 1, 1, 1, 1,
-0.8869256, 0.6886949, -3.090304, 1, 1, 1, 1, 1,
-0.8816975, -1.015227, -2.970357, 1, 1, 1, 1, 1,
-0.8814327, 0.3150487, -2.020853, 1, 1, 1, 1, 1,
-0.8806975, 0.06012307, -3.746284, 1, 1, 1, 1, 1,
-0.8794185, -0.2702028, -3.498499, 1, 1, 1, 1, 1,
-0.8760448, 0.2449644, -2.226227, 1, 1, 1, 1, 1,
-0.8726997, 0.217394, -1.127266, 1, 1, 1, 1, 1,
-0.8687034, 0.1573961, -1.510767, 1, 1, 1, 1, 1,
-0.8652691, -0.9545311, -0.8619183, 1, 1, 1, 1, 1,
-0.8619503, -0.5295272, -3.00654, 1, 1, 1, 1, 1,
-0.8391023, 1.026599, 0.6524209, 1, 1, 1, 1, 1,
-0.838325, 1.289602, -0.4113275, 1, 1, 1, 1, 1,
-0.8312243, -0.278541, -1.205845, 1, 1, 1, 1, 1,
-0.8297238, 1.419329, -1.992887, 1, 1, 1, 1, 1,
-0.8282596, 2.505012, -1.362196, 0, 0, 1, 1, 1,
-0.8214707, -0.8348303, -3.930405, 1, 0, 0, 1, 1,
-0.8157775, -0.9784551, -3.573569, 1, 0, 0, 1, 1,
-0.8154323, -0.2705372, -1.578712, 1, 0, 0, 1, 1,
-0.8136452, -0.1416997, -3.263487, 1, 0, 0, 1, 1,
-0.8054857, 2.096079, -0.9580557, 1, 0, 0, 1, 1,
-0.8033947, -0.2460237, -0.5426782, 0, 0, 0, 1, 1,
-0.8009049, -0.2036324, -0.8552108, 0, 0, 0, 1, 1,
-0.7972279, 0.8363096, -0.006282061, 0, 0, 0, 1, 1,
-0.7923764, -0.06233247, -0.5094709, 0, 0, 0, 1, 1,
-0.7779511, -0.5322928, -2.682908, 0, 0, 0, 1, 1,
-0.7776375, 1.655613, -1.588257, 0, 0, 0, 1, 1,
-0.7665572, 0.4004343, -2.989181, 0, 0, 0, 1, 1,
-0.7661633, 0.1403697, -1.614922, 1, 1, 1, 1, 1,
-0.7624599, -0.8908693, -1.340976, 1, 1, 1, 1, 1,
-0.7623346, 0.704109, -3.547575, 1, 1, 1, 1, 1,
-0.7612001, 0.7510738, -0.43388, 1, 1, 1, 1, 1,
-0.757661, 0.8955746, -0.7602111, 1, 1, 1, 1, 1,
-0.7565517, -0.3246317, -2.647807, 1, 1, 1, 1, 1,
-0.7497448, 2.26161, -0.05068258, 1, 1, 1, 1, 1,
-0.7426664, -0.2024358, -2.200383, 1, 1, 1, 1, 1,
-0.7407426, 0.4342438, -0.4999456, 1, 1, 1, 1, 1,
-0.7397438, 0.8869886, -1.328084, 1, 1, 1, 1, 1,
-0.7357062, -0.9742455, -2.918535, 1, 1, 1, 1, 1,
-0.7330652, 0.3823484, -2.571263, 1, 1, 1, 1, 1,
-0.7317383, 0.3597218, -1.041453, 1, 1, 1, 1, 1,
-0.7291886, -1.165016, -3.217623, 1, 1, 1, 1, 1,
-0.7264667, -1.218451, -2.66996, 1, 1, 1, 1, 1,
-0.723647, 0.6093698, -1.117348, 0, 0, 1, 1, 1,
-0.717741, -0.5131477, -2.727178, 1, 0, 0, 1, 1,
-0.7171006, -1.055957, -1.74773, 1, 0, 0, 1, 1,
-0.7158911, -0.7318797, -0.5093165, 1, 0, 0, 1, 1,
-0.7094351, 0.1341, -1.182589, 1, 0, 0, 1, 1,
-0.703301, -0.7645919, -3.028803, 1, 0, 0, 1, 1,
-0.7020143, -0.2550922, -1.895148, 0, 0, 0, 1, 1,
-0.6883446, -0.7824421, -0.942266, 0, 0, 0, 1, 1,
-0.6821696, -0.3695039, -3.181947, 0, 0, 0, 1, 1,
-0.6816891, 0.6041011, -1.114867, 0, 0, 0, 1, 1,
-0.6806536, 0.3323255, -0.07880811, 0, 0, 0, 1, 1,
-0.6785648, -1.057033, -1.095703, 0, 0, 0, 1, 1,
-0.6736054, 0.4521457, -2.669422, 0, 0, 0, 1, 1,
-0.6668346, -0.1944281, -1.33376, 1, 1, 1, 1, 1,
-0.6660946, 0.7245656, -0.07228778, 1, 1, 1, 1, 1,
-0.663887, -0.1634475, -0.4827242, 1, 1, 1, 1, 1,
-0.6622614, -0.18864, 0.8469441, 1, 1, 1, 1, 1,
-0.6597719, -0.1615407, -1.685513, 1, 1, 1, 1, 1,
-0.6585075, 0.4369306, -2.353659, 1, 1, 1, 1, 1,
-0.6574863, 1.242787, 0.05686615, 1, 1, 1, 1, 1,
-0.6490456, -0.5441235, -1.446531, 1, 1, 1, 1, 1,
-0.647614, 0.1057868, -2.487406, 1, 1, 1, 1, 1,
-0.644275, -0.1027052, -0.925823, 1, 1, 1, 1, 1,
-0.6421922, 2.077737, -1.939415, 1, 1, 1, 1, 1,
-0.6408151, 0.2888032, -0.1078354, 1, 1, 1, 1, 1,
-0.6404004, 1.406342, 0.1961798, 1, 1, 1, 1, 1,
-0.6380644, 0.596164, -1.775375, 1, 1, 1, 1, 1,
-0.6306903, -1.669143, -3.449726, 1, 1, 1, 1, 1,
-0.6276188, -0.9405478, -4.097835, 0, 0, 1, 1, 1,
-0.6267695, 1.238124, -0.07599819, 1, 0, 0, 1, 1,
-0.6263702, 0.5462964, -0.3932561, 1, 0, 0, 1, 1,
-0.625206, 0.106028, -2.578954, 1, 0, 0, 1, 1,
-0.6248556, -0.7116842, -1.725401, 1, 0, 0, 1, 1,
-0.6213426, 1.187576, -0.7636126, 1, 0, 0, 1, 1,
-0.6141764, 0.306789, -1.020879, 0, 0, 0, 1, 1,
-0.6070324, 0.03657956, 0.1167795, 0, 0, 0, 1, 1,
-0.6044549, -1.996864, -3.959203, 0, 0, 0, 1, 1,
-0.6022284, -2.672313, -3.146709, 0, 0, 0, 1, 1,
-0.601553, 1.245534, -1.669539, 0, 0, 0, 1, 1,
-0.59488, 0.4893047, -1.786517, 0, 0, 0, 1, 1,
-0.5918956, 0.3185745, 0.186512, 0, 0, 0, 1, 1,
-0.5898092, 0.4799197, -1.652107, 1, 1, 1, 1, 1,
-0.5895759, 0.690015, -1.574394, 1, 1, 1, 1, 1,
-0.5868968, 0.9492612, -0.2976885, 1, 1, 1, 1, 1,
-0.582507, 0.01663154, -2.46917, 1, 1, 1, 1, 1,
-0.5783811, 0.1295398, -1.142427, 1, 1, 1, 1, 1,
-0.5766155, 1.351428, -0.5880612, 1, 1, 1, 1, 1,
-0.5745218, -0.9350401, -1.588916, 1, 1, 1, 1, 1,
-0.5725394, -1.00917, -1.707824, 1, 1, 1, 1, 1,
-0.5670359, -1.10906, -3.118651, 1, 1, 1, 1, 1,
-0.5601008, -0.4604908, -1.281655, 1, 1, 1, 1, 1,
-0.5551949, -0.3053878, -2.87041, 1, 1, 1, 1, 1,
-0.5541635, -1.895854, -1.942544, 1, 1, 1, 1, 1,
-0.5488021, 0.496718, -0.07163352, 1, 1, 1, 1, 1,
-0.5456784, 0.4315029, -1.436893, 1, 1, 1, 1, 1,
-0.5437256, -0.1267734, -0.05575096, 1, 1, 1, 1, 1,
-0.5429045, -0.03201536, -2.360762, 0, 0, 1, 1, 1,
-0.5421555, -0.8595039, -2.232622, 1, 0, 0, 1, 1,
-0.5406907, -1.809312, -4.091945, 1, 0, 0, 1, 1,
-0.5406677, 0.1702405, -0.9600387, 1, 0, 0, 1, 1,
-0.5382257, 0.5149449, -0.234236, 1, 0, 0, 1, 1,
-0.5345628, 0.1724837, -1.208596, 1, 0, 0, 1, 1,
-0.5324532, -0.4839589, -0.8078593, 0, 0, 0, 1, 1,
-0.529284, -0.625362, -2.181226, 0, 0, 0, 1, 1,
-0.5287791, -0.4964615, -3.057543, 0, 0, 0, 1, 1,
-0.525246, 0.1831123, -1.951593, 0, 0, 0, 1, 1,
-0.523013, -0.9123895, -3.374214, 0, 0, 0, 1, 1,
-0.5229743, -0.8851745, -4.282436, 0, 0, 0, 1, 1,
-0.5222433, 0.7764818, -2.168994, 0, 0, 0, 1, 1,
-0.5073984, -0.0598281, -2.417822, 1, 1, 1, 1, 1,
-0.5073735, 1.381924, -2.68609, 1, 1, 1, 1, 1,
-0.5062156, -0.07254133, -0.6056319, 1, 1, 1, 1, 1,
-0.4981013, 0.6913018, -1.562831, 1, 1, 1, 1, 1,
-0.4956683, 1.078313, -2.243852, 1, 1, 1, 1, 1,
-0.4926891, -2.740403, -4.402597, 1, 1, 1, 1, 1,
-0.490933, 0.8445584, 0.3377663, 1, 1, 1, 1, 1,
-0.488153, 1.801671, -1.890267, 1, 1, 1, 1, 1,
-0.4867313, 0.5265367, -1.408268, 1, 1, 1, 1, 1,
-0.4866398, 0.7249581, -0.5520592, 1, 1, 1, 1, 1,
-0.482694, -2.448287, -4.242305, 1, 1, 1, 1, 1,
-0.4826083, 0.5158724, 0.1244047, 1, 1, 1, 1, 1,
-0.4786875, -0.09154277, -2.28853, 1, 1, 1, 1, 1,
-0.4768929, 0.7383815, -0.1528189, 1, 1, 1, 1, 1,
-0.47646, -0.1174988, -1.940896, 1, 1, 1, 1, 1,
-0.47086, -1.001059, -1.269649, 0, 0, 1, 1, 1,
-0.469646, 0.4876028, -1.229103, 1, 0, 0, 1, 1,
-0.4653798, -0.7960595, -3.877908, 1, 0, 0, 1, 1,
-0.4644292, -0.5287031, -1.484716, 1, 0, 0, 1, 1,
-0.4562057, 0.8594086, -1.110874, 1, 0, 0, 1, 1,
-0.4548864, -0.6936439, -4.438006, 1, 0, 0, 1, 1,
-0.4470801, -0.704616, -3.249931, 0, 0, 0, 1, 1,
-0.4463996, 0.1734992, -1.762019, 0, 0, 0, 1, 1,
-0.445612, -0.4640077, -3.011675, 0, 0, 0, 1, 1,
-0.4453019, -3.814299, -4.125874, 0, 0, 0, 1, 1,
-0.4407257, -0.5964035, -0.3782378, 0, 0, 0, 1, 1,
-0.4403508, 0.01635973, 0.2450926, 0, 0, 0, 1, 1,
-0.4380144, 1.683697, -1.07229, 0, 0, 0, 1, 1,
-0.4362769, -1.03093, -2.18557, 1, 1, 1, 1, 1,
-0.4347151, -0.288811, -2.543005, 1, 1, 1, 1, 1,
-0.4281529, 0.05325906, -0.4409696, 1, 1, 1, 1, 1,
-0.4278344, -0.7400869, -1.755583, 1, 1, 1, 1, 1,
-0.4254151, -0.7093294, -3.493454, 1, 1, 1, 1, 1,
-0.4231871, -0.6932085, -2.350869, 1, 1, 1, 1, 1,
-0.4126939, -0.2520508, -1.818219, 1, 1, 1, 1, 1,
-0.4109612, -0.2403188, -2.010177, 1, 1, 1, 1, 1,
-0.4086055, -0.4534084, -1.736877, 1, 1, 1, 1, 1,
-0.408029, 0.2172849, -0.8897806, 1, 1, 1, 1, 1,
-0.4070183, -0.3999013, -2.04394, 1, 1, 1, 1, 1,
-0.4063838, 0.136755, -2.135435, 1, 1, 1, 1, 1,
-0.4056075, 0.161158, -0.4124552, 1, 1, 1, 1, 1,
-0.402374, 0.8692645, -0.9494322, 1, 1, 1, 1, 1,
-0.3880288, 1.160835, -0.3137738, 1, 1, 1, 1, 1,
-0.3855608, -0.456502, -1.735567, 0, 0, 1, 1, 1,
-0.3844359, 0.5195858, -1.528979, 1, 0, 0, 1, 1,
-0.3842826, -0.1900614, -0.6414499, 1, 0, 0, 1, 1,
-0.3817827, -1.828978, -3.746023, 1, 0, 0, 1, 1,
-0.3798114, -0.9026949, -2.892744, 1, 0, 0, 1, 1,
-0.3780639, -0.9817322, -3.983159, 1, 0, 0, 1, 1,
-0.3713783, -0.639955, -3.38925, 0, 0, 0, 1, 1,
-0.3648422, -0.2101244, -1.831199, 0, 0, 0, 1, 1,
-0.3615969, 0.8171419, 0.1014234, 0, 0, 0, 1, 1,
-0.3585225, 2.421249, -0.2534052, 0, 0, 0, 1, 1,
-0.3509251, -0.7888361, -2.581605, 0, 0, 0, 1, 1,
-0.3500939, -0.1829415, -2.367931, 0, 0, 0, 1, 1,
-0.3470027, 1.188004, -0.5219146, 0, 0, 0, 1, 1,
-0.3468803, 0.7626263, 1.152277, 1, 1, 1, 1, 1,
-0.3432471, 0.6535907, -0.5308026, 1, 1, 1, 1, 1,
-0.341981, 0.00898329, -1.082613, 1, 1, 1, 1, 1,
-0.3379156, -0.7867505, -3.305517, 1, 1, 1, 1, 1,
-0.3369831, 0.0883007, -2.024554, 1, 1, 1, 1, 1,
-0.3335822, 0.7841052, 0.3766755, 1, 1, 1, 1, 1,
-0.3319749, 0.1116574, -1.685887, 1, 1, 1, 1, 1,
-0.3316283, 0.02408709, 1.538869, 1, 1, 1, 1, 1,
-0.3291151, 1.604116, 0.4192061, 1, 1, 1, 1, 1,
-0.3200766, 0.6199725, -1.346214, 1, 1, 1, 1, 1,
-0.3174785, 0.04836998, -1.25624, 1, 1, 1, 1, 1,
-0.3163891, 1.052024, 1.237405, 1, 1, 1, 1, 1,
-0.3092524, 0.4037297, -1.89199, 1, 1, 1, 1, 1,
-0.3079493, 2.396708, -0.6519178, 1, 1, 1, 1, 1,
-0.3070378, 0.7072818, -0.5093919, 1, 1, 1, 1, 1,
-0.3036144, 0.731286, -0.09630577, 0, 0, 1, 1, 1,
-0.2977522, -1.202659, -4.088067, 1, 0, 0, 1, 1,
-0.2975597, 1.330044, -0.4273849, 1, 0, 0, 1, 1,
-0.2933846, -0.657092, -1.649615, 1, 0, 0, 1, 1,
-0.2914895, -0.6803166, -1.452766, 1, 0, 0, 1, 1,
-0.2853819, -0.9177316, -1.885168, 1, 0, 0, 1, 1,
-0.2837571, 0.413456, -1.874423, 0, 0, 0, 1, 1,
-0.2827199, 0.7121007, -1.16378, 0, 0, 0, 1, 1,
-0.2804154, 0.6230503, 0.8789849, 0, 0, 0, 1, 1,
-0.2791993, -0.365305, -2.71132, 0, 0, 0, 1, 1,
-0.2736111, -2.067932, -2.934485, 0, 0, 0, 1, 1,
-0.2707497, 0.02767483, -2.296094, 0, 0, 0, 1, 1,
-0.2687254, 0.4546175, -1.809083, 0, 0, 0, 1, 1,
-0.2684576, -0.8998028, -1.898656, 1, 1, 1, 1, 1,
-0.2681312, -1.760854, -3.881201, 1, 1, 1, 1, 1,
-0.2668898, 1.578878, -0.3908915, 1, 1, 1, 1, 1,
-0.2647095, 0.8003947, -0.5564689, 1, 1, 1, 1, 1,
-0.2643657, 0.8362991, -0.3121577, 1, 1, 1, 1, 1,
-0.2524614, 1.113418, -2.190815, 1, 1, 1, 1, 1,
-0.250365, -1.1735, -1.288274, 1, 1, 1, 1, 1,
-0.2462941, 2.429343, 1.045902, 1, 1, 1, 1, 1,
-0.2446976, 1.584876, 0.6116971, 1, 1, 1, 1, 1,
-0.2446743, -0.5148577, -3.506057, 1, 1, 1, 1, 1,
-0.2409892, 0.7135364, -1.561944, 1, 1, 1, 1, 1,
-0.2389636, 0.3855113, -0.3328249, 1, 1, 1, 1, 1,
-0.2349933, 0.8651447, 0.08254024, 1, 1, 1, 1, 1,
-0.2339634, 0.5738491, 0.3088403, 1, 1, 1, 1, 1,
-0.2329154, -1.439867, -1.573186, 1, 1, 1, 1, 1,
-0.2328441, 0.01699456, -0.2991112, 0, 0, 1, 1, 1,
-0.231303, -0.6633956, -3.738618, 1, 0, 0, 1, 1,
-0.2301375, 0.6636419, -1.039497, 1, 0, 0, 1, 1,
-0.2208942, -0.5844366, -1.459233, 1, 0, 0, 1, 1,
-0.21931, 0.1162971, -1.412476, 1, 0, 0, 1, 1,
-0.2191688, 1.175241, 1.413776, 1, 0, 0, 1, 1,
-0.2146349, -0.2743819, -2.325683, 0, 0, 0, 1, 1,
-0.2145545, 0.1919223, -1.286524, 0, 0, 0, 1, 1,
-0.2138663, -2.659806, -2.426231, 0, 0, 0, 1, 1,
-0.2136337, -1.347813, -4.233449, 0, 0, 0, 1, 1,
-0.2046944, -0.04550734, -1.424065, 0, 0, 0, 1, 1,
-0.2025727, 1.799341, -0.7798824, 0, 0, 0, 1, 1,
-0.1945394, 0.2528519, -3.14406, 0, 0, 0, 1, 1,
-0.1899701, -0.7568501, -2.477536, 1, 1, 1, 1, 1,
-0.1891849, -1.235271, -4.376557, 1, 1, 1, 1, 1,
-0.1858803, -0.3485005, -1.95569, 1, 1, 1, 1, 1,
-0.1855448, 0.07516402, -1.394745, 1, 1, 1, 1, 1,
-0.1833904, 0.3941648, -0.8622807, 1, 1, 1, 1, 1,
-0.1831605, -0.1637857, -1.336569, 1, 1, 1, 1, 1,
-0.18001, -0.3699515, -2.183053, 1, 1, 1, 1, 1,
-0.1761065, -1.361556, -3.985168, 1, 1, 1, 1, 1,
-0.1727008, -0.3924936, -3.444019, 1, 1, 1, 1, 1,
-0.1717218, -1.177187, -2.576993, 1, 1, 1, 1, 1,
-0.1671849, 0.5303591, 0.203499, 1, 1, 1, 1, 1,
-0.1651271, -0.08856685, -2.250089, 1, 1, 1, 1, 1,
-0.1641417, -0.4397811, -2.901879, 1, 1, 1, 1, 1,
-0.1575785, 0.2369962, -0.01245142, 1, 1, 1, 1, 1,
-0.1565249, -1.43558, -2.733481, 1, 1, 1, 1, 1,
-0.1564158, -0.7487115, -3.506813, 0, 0, 1, 1, 1,
-0.1533352, -0.6416813, -3.822645, 1, 0, 0, 1, 1,
-0.1515308, -1.266027, -2.774886, 1, 0, 0, 1, 1,
-0.1435622, -0.9578564, -3.229526, 1, 0, 0, 1, 1,
-0.1406653, -0.7268926, -2.099836, 1, 0, 0, 1, 1,
-0.1381029, -0.1567201, -0.6622334, 1, 0, 0, 1, 1,
-0.135027, 0.7535588, 0.9948177, 0, 0, 0, 1, 1,
-0.1327486, -1.148469, -3.454515, 0, 0, 0, 1, 1,
-0.1294221, 1.090411, -0.3510542, 0, 0, 0, 1, 1,
-0.1265795, -0.7146182, -2.35137, 0, 0, 0, 1, 1,
-0.1236629, -1.944445, -2.03425, 0, 0, 0, 1, 1,
-0.1200637, -0.7351841, -4.139617, 0, 0, 0, 1, 1,
-0.1194254, 2.09809, -0.8389778, 0, 0, 0, 1, 1,
-0.1168667, -1.84528, -3.448683, 1, 1, 1, 1, 1,
-0.1151692, 0.07559923, -2.213044, 1, 1, 1, 1, 1,
-0.1149161, -0.5637091, -2.571103, 1, 1, 1, 1, 1,
-0.1144268, -1.022347, -2.904712, 1, 1, 1, 1, 1,
-0.1139553, -0.5565967, -4.242131, 1, 1, 1, 1, 1,
-0.1133542, 0.4324502, 0.1270269, 1, 1, 1, 1, 1,
-0.112514, 0.8225265, 0.7621637, 1, 1, 1, 1, 1,
-0.1061903, -1.353179, -3.267654, 1, 1, 1, 1, 1,
-0.1057776, 0.2673213, -0.7769549, 1, 1, 1, 1, 1,
-0.1027856, -1.17854, -3.001345, 1, 1, 1, 1, 1,
-0.1020828, 0.6636434, -0.1049172, 1, 1, 1, 1, 1,
-0.1012067, -0.7804232, -2.576626, 1, 1, 1, 1, 1,
-0.09815421, 0.09827157, -1.715798, 1, 1, 1, 1, 1,
-0.0976947, -0.5404496, -2.15111, 1, 1, 1, 1, 1,
-0.09745762, 0.5220014, -1.016796, 1, 1, 1, 1, 1,
-0.09547096, -0.4095522, -4.30047, 0, 0, 1, 1, 1,
-0.08536366, 0.2661945, 0.05057798, 1, 0, 0, 1, 1,
-0.0837783, 1.042988, 1.699704, 1, 0, 0, 1, 1,
-0.0766359, -0.04136255, -2.271168, 1, 0, 0, 1, 1,
-0.07281205, 3.111534, -1.056697, 1, 0, 0, 1, 1,
-0.07252663, 0.4869778, 0.3109558, 1, 0, 0, 1, 1,
-0.07085633, -1.647439, -2.958353, 0, 0, 0, 1, 1,
-0.06855798, -1.574612, -3.137954, 0, 0, 0, 1, 1,
-0.06654394, 0.492222, 0.6311653, 0, 0, 0, 1, 1,
-0.06532768, -1.328114, -4.563795, 0, 0, 0, 1, 1,
-0.06007519, -0.6336549, -4.848256, 0, 0, 0, 1, 1,
-0.05864891, -0.6237733, -4.088104, 0, 0, 0, 1, 1,
-0.05594755, 0.4085029, 0.2702984, 0, 0, 0, 1, 1,
-0.05580029, -0.9807823, -3.377316, 1, 1, 1, 1, 1,
-0.05147525, -0.6157, -2.45484, 1, 1, 1, 1, 1,
-0.05107217, -0.9001319, -3.679783, 1, 1, 1, 1, 1,
-0.04711229, 0.7982275, -0.4229535, 1, 1, 1, 1, 1,
-0.04441434, -0.501078, -4.752266, 1, 1, 1, 1, 1,
-0.03349383, 0.178966, -0.5157746, 1, 1, 1, 1, 1,
-0.03106437, -1.592655, -3.504423, 1, 1, 1, 1, 1,
-0.03068707, 1.535511, -0.4847524, 1, 1, 1, 1, 1,
-0.02531841, -0.752769, -2.179048, 1, 1, 1, 1, 1,
-0.01861837, 1.911456, 0.9248126, 1, 1, 1, 1, 1,
-0.008865265, 0.6878784, 0.3419619, 1, 1, 1, 1, 1,
-0.00446473, 0.04674789, 0.6479443, 1, 1, 1, 1, 1,
-0.003288366, 0.06034521, -1.22577, 1, 1, 1, 1, 1,
-0.002531243, 0.2107285, -0.05155184, 1, 1, 1, 1, 1,
-6.593477e-05, -1.65897, -5.214694, 1, 1, 1, 1, 1,
0.0007903292, 0.1510438, 0.2850368, 0, 0, 1, 1, 1,
0.002240826, -0.8839208, 3.506586, 1, 0, 0, 1, 1,
0.002899941, -1.75487, 4.906713, 1, 0, 0, 1, 1,
0.003827368, 0.09658524, 0.3122859, 1, 0, 0, 1, 1,
0.005245539, -0.1346852, 4.59349, 1, 0, 0, 1, 1,
0.006922372, 0.2785805, 0.995134, 1, 0, 0, 1, 1,
0.007087805, -0.7936018, 3.728442, 0, 0, 0, 1, 1,
0.01014328, 0.8389907, -1.180818, 0, 0, 0, 1, 1,
0.01191316, 1.179995, 0.5118528, 0, 0, 0, 1, 1,
0.0172981, -0.7551938, 3.011299, 0, 0, 0, 1, 1,
0.02312578, 0.003363585, 1.065444, 0, 0, 0, 1, 1,
0.02327459, -0.1357635, 2.469196, 0, 0, 0, 1, 1,
0.02432582, -0.9395302, 2.571417, 0, 0, 0, 1, 1,
0.02658255, 1.896699, -0.1679655, 1, 1, 1, 1, 1,
0.03133075, -0.6679735, 3.972011, 1, 1, 1, 1, 1,
0.03134032, -1.341378, 1.631982, 1, 1, 1, 1, 1,
0.03460038, 0.3276586, 0.408536, 1, 1, 1, 1, 1,
0.03660116, 0.5776576, 0.1629426, 1, 1, 1, 1, 1,
0.0378117, 1.726722, 0.3840336, 1, 1, 1, 1, 1,
0.03926272, 0.4925465, 0.175027, 1, 1, 1, 1, 1,
0.0458464, 0.8042565, -0.4870726, 1, 1, 1, 1, 1,
0.05239443, -0.7495779, 2.71999, 1, 1, 1, 1, 1,
0.05263923, -1.002272, 4.700927, 1, 1, 1, 1, 1,
0.05400178, 0.2421047, 0.9815634, 1, 1, 1, 1, 1,
0.05458113, -2.02895, 4.271449, 1, 1, 1, 1, 1,
0.05539394, 0.6568549, 1.106597, 1, 1, 1, 1, 1,
0.05624871, -0.2964165, 3.902367, 1, 1, 1, 1, 1,
0.05901925, -0.7013654, 3.154787, 1, 1, 1, 1, 1,
0.06045911, -1.696295, 1.382024, 0, 0, 1, 1, 1,
0.06179001, -0.3093653, 3.458169, 1, 0, 0, 1, 1,
0.06481318, 1.364709, -1.504732, 1, 0, 0, 1, 1,
0.06599755, 1.330333, 1.646625, 1, 0, 0, 1, 1,
0.06758413, -1.271007, 2.046453, 1, 0, 0, 1, 1,
0.06809453, 1.62329, 0.2258489, 1, 0, 0, 1, 1,
0.06855496, 0.7666104, 0.08840685, 0, 0, 0, 1, 1,
0.06930761, 0.7274944, 0.1385046, 0, 0, 0, 1, 1,
0.07009299, -0.2852831, 2.406621, 0, 0, 0, 1, 1,
0.07385095, -1.194229, 2.716096, 0, 0, 0, 1, 1,
0.07662514, -1.575421, 3.41577, 0, 0, 0, 1, 1,
0.07832102, 1.222623, -0.0769719, 0, 0, 0, 1, 1,
0.07980857, 0.5514187, 1.247066, 0, 0, 0, 1, 1,
0.08133404, 0.4606273, -0.05531106, 1, 1, 1, 1, 1,
0.08189579, -0.3555076, 2.359349, 1, 1, 1, 1, 1,
0.08270826, 0.02624128, 3.895176, 1, 1, 1, 1, 1,
0.09775456, 1.360946, 1.535943, 1, 1, 1, 1, 1,
0.100622, -2.221364, 3.956373, 1, 1, 1, 1, 1,
0.1034621, -1.67058, 1.900283, 1, 1, 1, 1, 1,
0.104932, -2.161095, 2.28204, 1, 1, 1, 1, 1,
0.1054759, -1.86934, 5.414767, 1, 1, 1, 1, 1,
0.1082946, -0.147904, 5.18941, 1, 1, 1, 1, 1,
0.1123262, 1.501492, 0.3726056, 1, 1, 1, 1, 1,
0.1161442, -0.6865919, 1.048671, 1, 1, 1, 1, 1,
0.1236643, -0.9119672, 3.98738, 1, 1, 1, 1, 1,
0.1258503, -0.1456972, 2.442389, 1, 1, 1, 1, 1,
0.1273686, -0.1621769, 3.717342, 1, 1, 1, 1, 1,
0.1275624, -1.265344, 2.104576, 1, 1, 1, 1, 1,
0.1306271, 0.2425988, 0.6550802, 0, 0, 1, 1, 1,
0.1340195, -1.696178, 2.558788, 1, 0, 0, 1, 1,
0.1350197, -1.520359, 3.020752, 1, 0, 0, 1, 1,
0.1385749, -1.208609, 2.829935, 1, 0, 0, 1, 1,
0.139322, 0.3233691, 1.132759, 1, 0, 0, 1, 1,
0.139752, 1.391219, -0.2553055, 1, 0, 0, 1, 1,
0.1406104, -0.1760753, 1.077247, 0, 0, 0, 1, 1,
0.142591, 0.7245005, 0.7688087, 0, 0, 0, 1, 1,
0.1448313, 0.3782395, 1.165363, 0, 0, 0, 1, 1,
0.1471921, -0.5652454, 4.687226, 0, 0, 0, 1, 1,
0.1498399, 1.330357, 0.187567, 0, 0, 0, 1, 1,
0.1551826, 1.158889, 1.297691, 0, 0, 0, 1, 1,
0.1570439, -0.319754, 3.152848, 0, 0, 0, 1, 1,
0.1632302, -1.723823, 3.881208, 1, 1, 1, 1, 1,
0.1632887, -0.8840607, 3.364594, 1, 1, 1, 1, 1,
0.1651732, 0.9446352, 0.06131746, 1, 1, 1, 1, 1,
0.1673302, -2.561989, 3.210747, 1, 1, 1, 1, 1,
0.1683529, 0.09391364, -0.03386899, 1, 1, 1, 1, 1,
0.1735639, -2.002845, 4.506675, 1, 1, 1, 1, 1,
0.1786818, 1.063098, 1.761633, 1, 1, 1, 1, 1,
0.1788775, 0.7788581, 0.0621152, 1, 1, 1, 1, 1,
0.1889241, 1.067039, 0.1337003, 1, 1, 1, 1, 1,
0.1891215, 0.247621, 1.562392, 1, 1, 1, 1, 1,
0.1895901, 0.8182868, 0.5478109, 1, 1, 1, 1, 1,
0.1908183, -0.1291116, 2.573425, 1, 1, 1, 1, 1,
0.1969471, 0.275848, 0.9289501, 1, 1, 1, 1, 1,
0.2011433, 0.7552968, 0.6179265, 1, 1, 1, 1, 1,
0.2029025, -0.2025573, 0.6467744, 1, 1, 1, 1, 1,
0.2102063, -1.461053, 2.94697, 0, 0, 1, 1, 1,
0.210994, 0.07024293, 0.5441646, 1, 0, 0, 1, 1,
0.2111488, -1.09897, 2.244683, 1, 0, 0, 1, 1,
0.2113038, 1.291462, 0.8995759, 1, 0, 0, 1, 1,
0.2121006, -0.6946051, 2.565928, 1, 0, 0, 1, 1,
0.2133293, 0.8175175, 0.5288814, 1, 0, 0, 1, 1,
0.2145217, -1.357125, 3.714222, 0, 0, 0, 1, 1,
0.2169029, -0.4097705, 3.516319, 0, 0, 0, 1, 1,
0.2177161, 1.390318, 0.9659377, 0, 0, 0, 1, 1,
0.2198236, 0.3587551, 0.7095636, 0, 0, 0, 1, 1,
0.2228845, -0.4779019, 1.624846, 0, 0, 0, 1, 1,
0.225647, -0.2507363, 3.168242, 0, 0, 0, 1, 1,
0.2284107, 0.3622805, -0.5135791, 0, 0, 0, 1, 1,
0.233656, 0.03906457, 1.87433, 1, 1, 1, 1, 1,
0.2363953, 1.591046, 0.3568422, 1, 1, 1, 1, 1,
0.2366578, 0.3180302, 0.8905652, 1, 1, 1, 1, 1,
0.2394094, -1.3179, 1.22192, 1, 1, 1, 1, 1,
0.2397247, 1.279034, 1.02998, 1, 1, 1, 1, 1,
0.2447128, -0.05870355, 1.508178, 1, 1, 1, 1, 1,
0.2529993, -0.6023834, 3.644314, 1, 1, 1, 1, 1,
0.2604802, 1.084708, 0.8655949, 1, 1, 1, 1, 1,
0.2605584, 0.315116, 0.7929604, 1, 1, 1, 1, 1,
0.2624284, 0.1662167, 1.405373, 1, 1, 1, 1, 1,
0.2682718, -1.338398, 3.093358, 1, 1, 1, 1, 1,
0.2744968, -2.090513, 4.987147, 1, 1, 1, 1, 1,
0.2773641, 0.07710345, 1.261527, 1, 1, 1, 1, 1,
0.2783104, -0.5866002, 4.03444, 1, 1, 1, 1, 1,
0.2808018, 0.7139195, 1.18707, 1, 1, 1, 1, 1,
0.2812613, -0.3883585, 5.81031, 0, 0, 1, 1, 1,
0.2836795, 0.882633, 0.5142683, 1, 0, 0, 1, 1,
0.288845, 0.7993076, 0.9185893, 1, 0, 0, 1, 1,
0.2927666, 0.2892313, -0.03626869, 1, 0, 0, 1, 1,
0.2936654, -0.03295564, 2.042536, 1, 0, 0, 1, 1,
0.2937594, -0.3590171, 2.042342, 1, 0, 0, 1, 1,
0.2949224, 0.6427865, 1.43281, 0, 0, 0, 1, 1,
0.2985631, -0.08105657, 2.068278, 0, 0, 0, 1, 1,
0.2988994, -0.4268132, 0.4181079, 0, 0, 0, 1, 1,
0.2989892, 1.405991, 1.686849, 0, 0, 0, 1, 1,
0.3029466, -1.813284, 2.544185, 0, 0, 0, 1, 1,
0.3034433, -0.5016991, 2.439695, 0, 0, 0, 1, 1,
0.3042438, -1.123296, 3.017498, 0, 0, 0, 1, 1,
0.3054668, 1.548199, -0.9311666, 1, 1, 1, 1, 1,
0.3099831, -1.806557, 2.53836, 1, 1, 1, 1, 1,
0.3115371, 0.5852529, 1.808587, 1, 1, 1, 1, 1,
0.316387, 0.3549024, -0.4263722, 1, 1, 1, 1, 1,
0.3214713, 0.07594753, 0.1402946, 1, 1, 1, 1, 1,
0.3238573, 0.3550638, 2.131789, 1, 1, 1, 1, 1,
0.3242202, -2.046536, 3.624625, 1, 1, 1, 1, 1,
0.3243406, 0.1299805, 0.2442117, 1, 1, 1, 1, 1,
0.3257226, -0.7464687, 3.746405, 1, 1, 1, 1, 1,
0.3265943, -0.01766278, 1.533505, 1, 1, 1, 1, 1,
0.3332467, 0.9649188, -0.08658448, 1, 1, 1, 1, 1,
0.3357659, -2.199845, 4.018368, 1, 1, 1, 1, 1,
0.3370616, 0.2544386, 0.8793715, 1, 1, 1, 1, 1,
0.3379106, 0.4364578, 0.7034802, 1, 1, 1, 1, 1,
0.3417445, 0.1023145, 2.19761, 1, 1, 1, 1, 1,
0.3418875, 1.41719, 0.2973014, 0, 0, 1, 1, 1,
0.3430093, 0.3576944, 0.4372242, 1, 0, 0, 1, 1,
0.3439374, -0.983317, 2.112309, 1, 0, 0, 1, 1,
0.3441977, 0.1096729, 2.836369, 1, 0, 0, 1, 1,
0.3455966, -1.165836, 2.796993, 1, 0, 0, 1, 1,
0.3457459, -1.723516, 2.393553, 1, 0, 0, 1, 1,
0.3469676, 1.363006, 0.5215209, 0, 0, 0, 1, 1,
0.3502454, 1.859558, 1.387635, 0, 0, 0, 1, 1,
0.3534153, -0.03630412, 0.981756, 0, 0, 0, 1, 1,
0.3635192, -0.2914619, 3.077486, 0, 0, 0, 1, 1,
0.367927, -0.04828559, 1.847518, 0, 0, 0, 1, 1,
0.3700493, 1.213994, -1.623048, 0, 0, 0, 1, 1,
0.3739637, -0.4044353, 1.692607, 0, 0, 0, 1, 1,
0.3743306, -1.830793, 2.4619, 1, 1, 1, 1, 1,
0.3743641, 0.1029354, 2.580572, 1, 1, 1, 1, 1,
0.3756275, 0.385984, 1.961701, 1, 1, 1, 1, 1,
0.3763397, 0.2336523, 2.27368, 1, 1, 1, 1, 1,
0.3771648, -1.682759, 3.673156, 1, 1, 1, 1, 1,
0.37987, 0.5494424, -1.015138, 1, 1, 1, 1, 1,
0.3800253, -1.743443, 4.336607, 1, 1, 1, 1, 1,
0.3800389, 1.328101, -0.2590648, 1, 1, 1, 1, 1,
0.3833191, -0.8359782, 1.83387, 1, 1, 1, 1, 1,
0.3923686, -1.250964, 3.080022, 1, 1, 1, 1, 1,
0.3966725, 1.208179, 0.01827928, 1, 1, 1, 1, 1,
0.3986838, -0.1370669, 2.523925, 1, 1, 1, 1, 1,
0.4004703, 1.280977, -0.4982612, 1, 1, 1, 1, 1,
0.4035395, -1.998899, 2.923612, 1, 1, 1, 1, 1,
0.4072377, -0.5837104, 3.356454, 1, 1, 1, 1, 1,
0.4091338, -0.3322538, 2.266975, 0, 0, 1, 1, 1,
0.4097189, -0.2751677, 3.826761, 1, 0, 0, 1, 1,
0.4160926, 0.3044926, 1.349972, 1, 0, 0, 1, 1,
0.4169228, 0.7141696, 1.931403, 1, 0, 0, 1, 1,
0.4186104, -0.6428844, 2.122424, 1, 0, 0, 1, 1,
0.4206291, 0.5782791, 0.1716855, 1, 0, 0, 1, 1,
0.427892, -0.4987466, 3.195617, 0, 0, 0, 1, 1,
0.430694, 0.4115278, 0.0930823, 0, 0, 0, 1, 1,
0.4311025, -0.4161257, 2.907298, 0, 0, 0, 1, 1,
0.4312532, 1.297686, 2.452682, 0, 0, 0, 1, 1,
0.4361548, -1.038625, 5.016869, 0, 0, 0, 1, 1,
0.4365541, 1.069626, 1.193894, 0, 0, 0, 1, 1,
0.4378002, 0.7152658, 0.2236553, 0, 0, 0, 1, 1,
0.4431589, 0.5857896, -0.9248617, 1, 1, 1, 1, 1,
0.4481251, -0.3765836, 2.488864, 1, 1, 1, 1, 1,
0.4657938, 0.4217135, 1.518386, 1, 1, 1, 1, 1,
0.4720807, 0.2929704, 0.3645562, 1, 1, 1, 1, 1,
0.4734501, 0.3696541, 0.9502692, 1, 1, 1, 1, 1,
0.4743611, -0.8614785, 2.955093, 1, 1, 1, 1, 1,
0.4772219, 0.5721117, 1.915748, 1, 1, 1, 1, 1,
0.4838462, 0.2052288, -0.4148211, 1, 1, 1, 1, 1,
0.4907216, 0.9510176, -0.7669863, 1, 1, 1, 1, 1,
0.4912674, 0.4507421, 0.4927509, 1, 1, 1, 1, 1,
0.5008476, -1.702334, 3.743677, 1, 1, 1, 1, 1,
0.5009031, -0.2893151, 2.385231, 1, 1, 1, 1, 1,
0.5029058, -0.6759956, 1.153889, 1, 1, 1, 1, 1,
0.5069815, 0.3099236, 0.0506806, 1, 1, 1, 1, 1,
0.5070755, -1.730157, 3.058694, 1, 1, 1, 1, 1,
0.5085921, -1.063581, 2.421218, 0, 0, 1, 1, 1,
0.5093583, 0.6256999, 0.48393, 1, 0, 0, 1, 1,
0.5094727, 0.7303182, -1.025939, 1, 0, 0, 1, 1,
0.5169863, -0.6081201, 2.638278, 1, 0, 0, 1, 1,
0.5172215, 0.1808711, 1.897974, 1, 0, 0, 1, 1,
0.5194631, -0.1431507, 3.038571, 1, 0, 0, 1, 1,
0.5241243, 0.6942194, 2.726368, 0, 0, 0, 1, 1,
0.533599, -0.4369029, 2.546422, 0, 0, 0, 1, 1,
0.5391181, 0.7218126, -0.2155587, 0, 0, 0, 1, 1,
0.5396104, -0.252335, 1.298688, 0, 0, 0, 1, 1,
0.5402176, 0.08243556, 0.949562, 0, 0, 0, 1, 1,
0.5407085, 0.2230004, 2.169181, 0, 0, 0, 1, 1,
0.5418077, -0.2977855, 1.436841, 0, 0, 0, 1, 1,
0.5428365, 0.3324788, 0.2873395, 1, 1, 1, 1, 1,
0.5450047, -1.364804, 3.947067, 1, 1, 1, 1, 1,
0.5485974, -1.182904, 2.833087, 1, 1, 1, 1, 1,
0.5526412, -1.921526, 2.936359, 1, 1, 1, 1, 1,
0.5537112, 0.9304322, 0.4981978, 1, 1, 1, 1, 1,
0.5541662, 0.3473561, 0.8366918, 1, 1, 1, 1, 1,
0.5596837, 0.5234714, 1.311029, 1, 1, 1, 1, 1,
0.5610684, 0.1160012, 1.426388, 1, 1, 1, 1, 1,
0.5630341, -0.1812421, 1.841327, 1, 1, 1, 1, 1,
0.5639406, -0.1606266, 2.136347, 1, 1, 1, 1, 1,
0.5706751, -0.7087432, 2.281125, 1, 1, 1, 1, 1,
0.5711609, -2.026697, 4.867869, 1, 1, 1, 1, 1,
0.5740382, -0.03524426, 0.1113809, 1, 1, 1, 1, 1,
0.5744242, -0.0270681, 0.9876363, 1, 1, 1, 1, 1,
0.5816452, -0.5702336, 1.947718, 1, 1, 1, 1, 1,
0.584055, -1.619705, 4.767369, 0, 0, 1, 1, 1,
0.5842423, 0.7501148, 1.986247, 1, 0, 0, 1, 1,
0.5858821, 0.9850885, 0.9784152, 1, 0, 0, 1, 1,
0.5861524, 1.350919, 1.575907, 1, 0, 0, 1, 1,
0.5876125, 1.212164, 0.6949726, 1, 0, 0, 1, 1,
0.5884398, 1.876503, 1.282076, 1, 0, 0, 1, 1,
0.588821, 0.1305045, 1.137541, 0, 0, 0, 1, 1,
0.5902629, 0.4299738, 0.4042949, 0, 0, 0, 1, 1,
0.5931753, 0.8506495, -0.2075186, 0, 0, 0, 1, 1,
0.5949283, 0.4866758, 1.739152, 0, 0, 0, 1, 1,
0.5952635, 1.198334, 1.79072, 0, 0, 0, 1, 1,
0.5955596, 0.2334193, -0.2315417, 0, 0, 0, 1, 1,
0.597405, -0.09545496, -0.3558749, 0, 0, 0, 1, 1,
0.6007695, -0.09668107, 3.635145, 1, 1, 1, 1, 1,
0.6043471, 0.7648768, 0.4608692, 1, 1, 1, 1, 1,
0.6079566, -1.288368, 2.618589, 1, 1, 1, 1, 1,
0.6083878, -0.5804621, 2.131093, 1, 1, 1, 1, 1,
0.6094479, 2.225163, -0.488524, 1, 1, 1, 1, 1,
0.6173999, -0.3170923, 2.868963, 1, 1, 1, 1, 1,
0.6205995, 0.6917409, -0.2077259, 1, 1, 1, 1, 1,
0.6227063, 0.4384993, 0.5045611, 1, 1, 1, 1, 1,
0.6301128, -0.05437524, 2.873499, 1, 1, 1, 1, 1,
0.6340729, -1.581353, 3.156979, 1, 1, 1, 1, 1,
0.6436459, 0.3585467, 0.4071536, 1, 1, 1, 1, 1,
0.6444923, 1.892338, -0.3678605, 1, 1, 1, 1, 1,
0.6494797, 1.536052, 0.6431621, 1, 1, 1, 1, 1,
0.6514137, 0.3249479, 1.947016, 1, 1, 1, 1, 1,
0.6575373, 0.6694378, 1.085517, 1, 1, 1, 1, 1,
0.6578729, -0.2976818, 4.183052, 0, 0, 1, 1, 1,
0.6606238, -0.558118, 3.331465, 1, 0, 0, 1, 1,
0.6612449, -1.167008, 2.304989, 1, 0, 0, 1, 1,
0.6635334, 2.023591, -2.026948, 1, 0, 0, 1, 1,
0.665563, -0.008187158, 2.688985, 1, 0, 0, 1, 1,
0.6670383, -1.646961, 1.878679, 1, 0, 0, 1, 1,
0.6685128, -0.7940677, 3.110113, 0, 0, 0, 1, 1,
0.6709903, -1.157337, 3.6407, 0, 0, 0, 1, 1,
0.6723379, 0.3418292, 2.179901, 0, 0, 0, 1, 1,
0.6737435, -0.4858013, 3.051139, 0, 0, 0, 1, 1,
0.6776979, 0.537265, 0.9679508, 0, 0, 0, 1, 1,
0.684429, 1.198191, 0.3583894, 0, 0, 0, 1, 1,
0.6890501, 0.9920732, -0.5151331, 0, 0, 0, 1, 1,
0.6913407, 0.02645457, 0.9673322, 1, 1, 1, 1, 1,
0.7007326, 1.485548, 1.332086, 1, 1, 1, 1, 1,
0.7029715, -1.704891, 3.792716, 1, 1, 1, 1, 1,
0.7032869, 2.200863, 0.432486, 1, 1, 1, 1, 1,
0.7059146, 2.381655, 0.2150966, 1, 1, 1, 1, 1,
0.7070245, -0.8051041, 2.205024, 1, 1, 1, 1, 1,
0.7088161, 0.3053731, 2.418819, 1, 1, 1, 1, 1,
0.7149553, -1.03168, 1.43988, 1, 1, 1, 1, 1,
0.718814, -0.674368, 2.105959, 1, 1, 1, 1, 1,
0.7208614, 0.8369994, -0.4199868, 1, 1, 1, 1, 1,
0.7216826, -0.01733863, 1.111279, 1, 1, 1, 1, 1,
0.7266893, 1.46685, -0.8506856, 1, 1, 1, 1, 1,
0.7301416, 0.2151564, 1.151193, 1, 1, 1, 1, 1,
0.730596, -0.01358403, 0.01137005, 1, 1, 1, 1, 1,
0.7398475, -1.473546, 2.973333, 1, 1, 1, 1, 1,
0.7426627, 0.6377146, 1.925884, 0, 0, 1, 1, 1,
0.7529086, -0.02382861, -0.2744233, 1, 0, 0, 1, 1,
0.7535311, -0.4531843, 3.010339, 1, 0, 0, 1, 1,
0.7582898, 1.092814, 0.3996798, 1, 0, 0, 1, 1,
0.7613034, 0.32731, 2.526215, 1, 0, 0, 1, 1,
0.765879, -1.874051, 2.064903, 1, 0, 0, 1, 1,
0.7685794, -0.6197242, 2.749043, 0, 0, 0, 1, 1,
0.7700477, 0.8997519, -2.034617, 0, 0, 0, 1, 1,
0.7741091, -0.9374458, 2.918427, 0, 0, 0, 1, 1,
0.780421, 0.04579155, 1.760564, 0, 0, 0, 1, 1,
0.7887784, -0.2983677, 0.03637061, 0, 0, 0, 1, 1,
0.78973, -0.440603, 2.160891, 0, 0, 0, 1, 1,
0.7943309, -0.9590815, 2.806207, 0, 0, 0, 1, 1,
0.7961224, 1.251246, -0.006833535, 1, 1, 1, 1, 1,
0.8020332, -1.556155, 2.50426, 1, 1, 1, 1, 1,
0.8022975, -1.488499, 3.985822, 1, 1, 1, 1, 1,
0.8064149, 0.6951352, 1.353164, 1, 1, 1, 1, 1,
0.8275232, -1.518231, 3.303847, 1, 1, 1, 1, 1,
0.8287942, 0.3383994, 1.24353, 1, 1, 1, 1, 1,
0.8316217, 0.8295024, 0.9321565, 1, 1, 1, 1, 1,
0.8324206, -2.378536, 2.792672, 1, 1, 1, 1, 1,
0.8347936, 1.296909, 1.891889, 1, 1, 1, 1, 1,
0.8358259, -1.67535, 1.988174, 1, 1, 1, 1, 1,
0.8481518, 2.178886, -0.8548199, 1, 1, 1, 1, 1,
0.8501397, -0.9395955, 3.066052, 1, 1, 1, 1, 1,
0.8516172, -0.3694724, 2.435895, 1, 1, 1, 1, 1,
0.8555893, -1.28591, 1.304042, 1, 1, 1, 1, 1,
0.8563951, 0.6394591, -0.187386, 1, 1, 1, 1, 1,
0.8655151, -0.5287871, 2.306113, 0, 0, 1, 1, 1,
0.8674368, 0.2525695, 1.5482, 1, 0, 0, 1, 1,
0.8754273, 1.013521, 0.08340089, 1, 0, 0, 1, 1,
0.8764012, -1.140133, 1.201465, 1, 0, 0, 1, 1,
0.8777981, 1.497838, 0.1768276, 1, 0, 0, 1, 1,
0.8785759, -1.529821, 2.081593, 1, 0, 0, 1, 1,
0.8805655, -2.176548, 2.919244, 0, 0, 0, 1, 1,
0.882234, 0.3321762, 4.722142, 0, 0, 0, 1, 1,
0.8876936, 0.3871339, 2.265686, 0, 0, 0, 1, 1,
0.8888417, 0.2236543, 3.917856, 0, 0, 0, 1, 1,
0.8892959, 0.09091721, 1.945859, 0, 0, 0, 1, 1,
0.9012768, -0.09922612, 2.375406, 0, 0, 0, 1, 1,
0.9089468, -1.085666, 3.973575, 0, 0, 0, 1, 1,
0.9139438, 1.116775, -0.7958074, 1, 1, 1, 1, 1,
0.9164051, 0.5083268, -0.3343014, 1, 1, 1, 1, 1,
0.9180937, 0.1685737, 1.74376, 1, 1, 1, 1, 1,
0.9212574, 1.890903, 1.017267, 1, 1, 1, 1, 1,
0.9249004, 0.4136652, 2.146473, 1, 1, 1, 1, 1,
0.9259269, 0.6641673, 0.6221036, 1, 1, 1, 1, 1,
0.9317525, -0.8367116, 2.570773, 1, 1, 1, 1, 1,
0.9367887, 0.08664807, 1.607228, 1, 1, 1, 1, 1,
0.9387222, 0.05732547, 0.1629773, 1, 1, 1, 1, 1,
0.9390425, -1.299485, 3.116229, 1, 1, 1, 1, 1,
0.9399275, 2.499216, 0.8577537, 1, 1, 1, 1, 1,
0.9420551, 0.1022176, 2.766017, 1, 1, 1, 1, 1,
0.9422608, 0.3232879, 0.3461028, 1, 1, 1, 1, 1,
0.9434122, 0.08406814, 0.06247335, 1, 1, 1, 1, 1,
0.9456201, 1.528196, 0.3888902, 1, 1, 1, 1, 1,
0.9554958, 0.6448095, 1.060568, 0, 0, 1, 1, 1,
0.9594919, -1.824873, 2.960298, 1, 0, 0, 1, 1,
0.9615496, 1.433604, -3.31673, 1, 0, 0, 1, 1,
0.963255, -0.4494585, 2.775341, 1, 0, 0, 1, 1,
0.9641431, 0.344007, 2.211092, 1, 0, 0, 1, 1,
0.9704826, 1.948902, 1.321031, 1, 0, 0, 1, 1,
0.9723351, 0.5256397, 0.2388067, 0, 0, 0, 1, 1,
0.9753917, 2.436848, 0.7284157, 0, 0, 0, 1, 1,
0.9845135, 1.018331, -0.09946153, 0, 0, 0, 1, 1,
0.9872096, 0.4206379, 1.167384, 0, 0, 0, 1, 1,
0.9882329, -0.818108, 4.402211, 0, 0, 0, 1, 1,
0.9891288, 0.5016453, 0.8817149, 0, 0, 0, 1, 1,
0.9932647, -0.1635266, 2.38606, 0, 0, 0, 1, 1,
0.9994249, 0.1233959, 2.357465, 1, 1, 1, 1, 1,
0.9995325, 0.1741392, 0.9379092, 1, 1, 1, 1, 1,
1.017578, -0.09825741, 2.870571, 1, 1, 1, 1, 1,
1.019592, -1.162822, 1.254317, 1, 1, 1, 1, 1,
1.026572, 0.7941035, 1.295636, 1, 1, 1, 1, 1,
1.028076, 1.933869, -0.4118213, 1, 1, 1, 1, 1,
1.028783, -0.6747903, 3.148974, 1, 1, 1, 1, 1,
1.033234, 0.5895724, 1.43135, 1, 1, 1, 1, 1,
1.036607, -0.2082376, 2.421209, 1, 1, 1, 1, 1,
1.044797, -0.3648896, 1.451738, 1, 1, 1, 1, 1,
1.047134, 0.004091099, 2.620931, 1, 1, 1, 1, 1,
1.048299, -0.4306884, 2.081944, 1, 1, 1, 1, 1,
1.074462, 0.07370416, 1.149619, 1, 1, 1, 1, 1,
1.08004, -0.6788246, 0.9291037, 1, 1, 1, 1, 1,
1.092817, 0.5233039, 0.5413665, 1, 1, 1, 1, 1,
1.111008, 1.376304, 1.841782, 0, 0, 1, 1, 1,
1.113219, -1.175547, 4.715272, 1, 0, 0, 1, 1,
1.113247, 0.4789633, 1.654534, 1, 0, 0, 1, 1,
1.11556, -1.695723, 3.292465, 1, 0, 0, 1, 1,
1.118799, -0.2095156, -0.5484352, 1, 0, 0, 1, 1,
1.125913, 0.1141672, 2.585261, 1, 0, 0, 1, 1,
1.127413, 0.4345348, 0.6971283, 0, 0, 0, 1, 1,
1.127744, 0.4794739, 1.010488, 0, 0, 0, 1, 1,
1.130279, -0.4541451, 1.120265, 0, 0, 0, 1, 1,
1.136765, 0.2790727, 2.530338, 0, 0, 0, 1, 1,
1.14681, -0.03099658, -0.01751534, 0, 0, 0, 1, 1,
1.151, -0.3742267, 1.803851, 0, 0, 0, 1, 1,
1.156584, 1.650941, 0.2172346, 0, 0, 0, 1, 1,
1.158828, -1.060396, 0.9636034, 1, 1, 1, 1, 1,
1.160161, 1.052736, -0.6188422, 1, 1, 1, 1, 1,
1.163235, -0.05564324, 2.190255, 1, 1, 1, 1, 1,
1.171096, 0.1721065, -0.1947559, 1, 1, 1, 1, 1,
1.173564, 2.077241, 0.84191, 1, 1, 1, 1, 1,
1.174986, -0.6811743, 0.8976039, 1, 1, 1, 1, 1,
1.181815, -0.5618063, 0.7716929, 1, 1, 1, 1, 1,
1.183051, -1.179136, 2.515022, 1, 1, 1, 1, 1,
1.184008, -0.0468915, -0.1623795, 1, 1, 1, 1, 1,
1.191884, -0.3878815, 2.175051, 1, 1, 1, 1, 1,
1.195667, 0.2823426, 0.4692076, 1, 1, 1, 1, 1,
1.195912, 0.7684297, 1.479755, 1, 1, 1, 1, 1,
1.196793, -0.5510275, 1.104305, 1, 1, 1, 1, 1,
1.197034, 2.570362, -0.4560334, 1, 1, 1, 1, 1,
1.197702, 0.8113103, 1.506808, 1, 1, 1, 1, 1,
1.204359, -0.6425703, 2.162964, 0, 0, 1, 1, 1,
1.207616, 0.1449097, 1.01349, 1, 0, 0, 1, 1,
1.216059, -0.2013185, 0.1260445, 1, 0, 0, 1, 1,
1.216097, 0.4941082, 0.1835737, 1, 0, 0, 1, 1,
1.218794, 1.512983, 1.115041, 1, 0, 0, 1, 1,
1.223243, 0.5400729, -0.04809568, 1, 0, 0, 1, 1,
1.224576, 1.341578, -0.3419487, 0, 0, 0, 1, 1,
1.228094, -0.118947, 1.683348, 0, 0, 0, 1, 1,
1.230838, 0.5866728, 0.7375812, 0, 0, 0, 1, 1,
1.232463, 0.2307182, 1.312074, 0, 0, 0, 1, 1,
1.242073, 0.01353987, 0.9651563, 0, 0, 0, 1, 1,
1.24385, 0.004212598, 1.709008, 0, 0, 0, 1, 1,
1.244348, 0.8914423, 2.408105, 0, 0, 0, 1, 1,
1.246794, -0.3943597, 1.759261, 1, 1, 1, 1, 1,
1.248195, 0.6355746, 1.111778, 1, 1, 1, 1, 1,
1.252227, -0.2161466, 1.977068, 1, 1, 1, 1, 1,
1.253329, -1.585172, 2.635488, 1, 1, 1, 1, 1,
1.254908, 1.928628, 2.20916, 1, 1, 1, 1, 1,
1.277889, 0.1119442, 2.26811, 1, 1, 1, 1, 1,
1.304201, 1.786029, 1.319759, 1, 1, 1, 1, 1,
1.304717, -1.369874, 2.090391, 1, 1, 1, 1, 1,
1.316797, 0.01737222, 1.014428, 1, 1, 1, 1, 1,
1.318652, -2.865898, 3.187652, 1, 1, 1, 1, 1,
1.338416, 1.789128, 0.8553759, 1, 1, 1, 1, 1,
1.341999, -0.5892724, 2.966523, 1, 1, 1, 1, 1,
1.356843, -0.2696658, 0.4861761, 1, 1, 1, 1, 1,
1.358328, -0.8643157, 4.125849, 1, 1, 1, 1, 1,
1.360419, 1.047206, 1.531182, 1, 1, 1, 1, 1,
1.361318, -0.1485688, 2.8482, 0, 0, 1, 1, 1,
1.362697, 1.283299, 2.26775, 1, 0, 0, 1, 1,
1.367475, 0.2998566, 1.136714, 1, 0, 0, 1, 1,
1.386653, -0.2531912, 1.521884, 1, 0, 0, 1, 1,
1.400511, 0.453871, 1.252803, 1, 0, 0, 1, 1,
1.42061, -1.813026, 1.523207, 1, 0, 0, 1, 1,
1.422703, 0.7033868, -1.007554, 0, 0, 0, 1, 1,
1.440898, -0.01876121, 3.022397, 0, 0, 0, 1, 1,
1.460298, 0.8805636, 1.567914, 0, 0, 0, 1, 1,
1.464494, -1.577655, 3.531832, 0, 0, 0, 1, 1,
1.47962, -1.528777, 2.182062, 0, 0, 0, 1, 1,
1.508938, 1.034979, 1.183343, 0, 0, 0, 1, 1,
1.51681, 0.310481, 1.220093, 0, 0, 0, 1, 1,
1.519251, 1.954907, 0.7281944, 1, 1, 1, 1, 1,
1.521754, 1.272107, 0.7565032, 1, 1, 1, 1, 1,
1.521969, -1.904338, 4.11713, 1, 1, 1, 1, 1,
1.541214, -0.1316879, 1.308824, 1, 1, 1, 1, 1,
1.547444, -0.2895139, 1.637507, 1, 1, 1, 1, 1,
1.549691, 0.1667606, 1.959196, 1, 1, 1, 1, 1,
1.549864, 0.01662466, 3.761184, 1, 1, 1, 1, 1,
1.55614, 1.443246, 1.076397, 1, 1, 1, 1, 1,
1.565566, 0.383605, 0.5064952, 1, 1, 1, 1, 1,
1.570827, -0.6094595, 2.464591, 1, 1, 1, 1, 1,
1.576787, -0.007688178, 2.03796, 1, 1, 1, 1, 1,
1.577703, 0.1398842, 0.3020053, 1, 1, 1, 1, 1,
1.592455, 0.5067219, 0.8294058, 1, 1, 1, 1, 1,
1.598145, -0.935551, 3.63382, 1, 1, 1, 1, 1,
1.600459, 1.323674, 0.4023054, 1, 1, 1, 1, 1,
1.608193, 0.4246325, 3.316902, 0, 0, 1, 1, 1,
1.614589, 0.1623648, 2.335608, 1, 0, 0, 1, 1,
1.625959, 0.1155694, 2.563312, 1, 0, 0, 1, 1,
1.632291, 0.1290299, 0.3547486, 1, 0, 0, 1, 1,
1.636857, 0.6240038, 1.149063, 1, 0, 0, 1, 1,
1.645531, 0.3260602, 2.879928, 1, 0, 0, 1, 1,
1.654136, -2.373839, 2.848913, 0, 0, 0, 1, 1,
1.654544, -0.3635344, 1.443261, 0, 0, 0, 1, 1,
1.675233, 1.806918, 0.9585218, 0, 0, 0, 1, 1,
1.681495, -0.03120214, 3.287153, 0, 0, 0, 1, 1,
1.682203, 1.088067, 1.090899, 0, 0, 0, 1, 1,
1.708539, 0.6448889, 2.064392, 0, 0, 0, 1, 1,
1.708694, -0.4447388, 2.873253, 0, 0, 0, 1, 1,
1.714534, 0.5707558, 1.628091, 1, 1, 1, 1, 1,
1.728471, 0.1756182, 0.7545776, 1, 1, 1, 1, 1,
1.744261, 2.550866, -0.4677436, 1, 1, 1, 1, 1,
1.752889, 0.8778172, 1.689128, 1, 1, 1, 1, 1,
1.760216, 0.717531, 3.223831, 1, 1, 1, 1, 1,
1.761063, -0.9835503, 1.286193, 1, 1, 1, 1, 1,
1.764145, -0.01305, 1.768082, 1, 1, 1, 1, 1,
1.834333, -1.462295, 1.804918, 1, 1, 1, 1, 1,
1.835261, 0.6787051, 0.08660221, 1, 1, 1, 1, 1,
1.907502, -1.572692, 2.117708, 1, 1, 1, 1, 1,
1.911759, -0.1761369, 1.663244, 1, 1, 1, 1, 1,
1.925792, 0.3452485, 0.791584, 1, 1, 1, 1, 1,
1.928235, -0.6987559, 1.445676, 1, 1, 1, 1, 1,
1.948989, 0.5607969, 1.436829, 1, 1, 1, 1, 1,
1.972687, 0.4890648, 0.05784568, 1, 1, 1, 1, 1,
1.985903, 1.584016, 2.289209, 0, 0, 1, 1, 1,
2.029452, -0.0379282, 2.220942, 1, 0, 0, 1, 1,
2.061575, -1.309798, 2.087591, 1, 0, 0, 1, 1,
2.067772, 1.202272, 1.554468, 1, 0, 0, 1, 1,
2.094312, 1.087937, 1.030288, 1, 0, 0, 1, 1,
2.098808, 1.386249, 1.891831, 1, 0, 0, 1, 1,
2.131069, 0.4727269, 2.846172, 0, 0, 0, 1, 1,
2.147113, 1.716633, 0.7265806, 0, 0, 0, 1, 1,
2.174611, 0.2242547, 3.258898, 0, 0, 0, 1, 1,
2.201781, -0.6306913, 1.005223, 0, 0, 0, 1, 1,
2.22252, 0.4008942, 0.5830715, 0, 0, 0, 1, 1,
2.249765, 0.1700923, 0.3111311, 0, 0, 0, 1, 1,
2.282952, 0.6532536, 2.210119, 0, 0, 0, 1, 1,
2.299766, -1.391881, 2.632573, 1, 1, 1, 1, 1,
2.353806, -0.1051715, 0.04113161, 1, 1, 1, 1, 1,
2.369477, -2.020076, 2.586609, 1, 1, 1, 1, 1,
2.399599, -1.653663, 0.6374812, 1, 1, 1, 1, 1,
2.5867, -0.8285253, 1.576887, 1, 1, 1, 1, 1,
2.602203, -0.7010198, 2.958639, 1, 1, 1, 1, 1,
3.300031, -0.9632893, 2.552887, 1, 1, 1, 1, 1
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
var radius = 9.690907;
var distance = 34.0389;
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
mvMatrix.translate( -0.3905162, 0.3513825, -0.2978082 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.0389);
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
