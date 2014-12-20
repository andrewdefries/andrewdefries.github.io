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
-2.782643, 0.9372065, -3.241588, 1, 0, 0, 1,
-2.726426, 1.350813, -2.266303, 1, 0.007843138, 0, 1,
-2.681364, -0.356416, -2.174473, 1, 0.01176471, 0, 1,
-2.62076, -1.970555, -1.939144, 1, 0.01960784, 0, 1,
-2.564564, -2.195249, -1.795771, 1, 0.02352941, 0, 1,
-2.464964, 0.5325674, -1.298603, 1, 0.03137255, 0, 1,
-2.446197, -0.5129327, -0.04850199, 1, 0.03529412, 0, 1,
-2.323618, 2.142304, -0.763825, 1, 0.04313726, 0, 1,
-2.316024, -0.3720365, -2.824636, 1, 0.04705882, 0, 1,
-2.241875, 0.2191259, -2.258224, 1, 0.05490196, 0, 1,
-2.233565, 0.05489223, -2.854721, 1, 0.05882353, 0, 1,
-2.23122, -0.09104517, -0.9608501, 1, 0.06666667, 0, 1,
-2.172383, -1.422083, -3.417148, 1, 0.07058824, 0, 1,
-2.172295, 0.9782903, -2.122074, 1, 0.07843138, 0, 1,
-2.166041, -0.8775962, -3.148847, 1, 0.08235294, 0, 1,
-2.164823, 0.2435707, -0.3973936, 1, 0.09019608, 0, 1,
-2.153031, -2.579868, -0.48818, 1, 0.09411765, 0, 1,
-2.107106, 1.086384, -0.6214007, 1, 0.1019608, 0, 1,
-2.103391, -0.2298606, -0.102231, 1, 0.1098039, 0, 1,
-2.086267, 0.6288371, -4.155704, 1, 0.1137255, 0, 1,
-2.065194, -0.1459055, -1.99169, 1, 0.1215686, 0, 1,
-2.041066, -0.2680063, -1.581784, 1, 0.1254902, 0, 1,
-2.008542, -1.618715, -1.766998, 1, 0.1333333, 0, 1,
-1.970496, 0.01921417, 0.2576051, 1, 0.1372549, 0, 1,
-1.942921, -1.193255, -2.258319, 1, 0.145098, 0, 1,
-1.930678, 0.7688292, -0.3157281, 1, 0.1490196, 0, 1,
-1.928032, -0.253019, -1.768247, 1, 0.1568628, 0, 1,
-1.906636, 2.111499, -0.8462867, 1, 0.1607843, 0, 1,
-1.883065, -1.268901, -1.14302, 1, 0.1686275, 0, 1,
-1.864136, -0.3980193, -3.685577, 1, 0.172549, 0, 1,
-1.847857, -0.3537433, -0.3734961, 1, 0.1803922, 0, 1,
-1.841483, -1.115947, -3.035579, 1, 0.1843137, 0, 1,
-1.809082, -1.412602, -1.103712, 1, 0.1921569, 0, 1,
-1.80734, 1.917703, -0.4047333, 1, 0.1960784, 0, 1,
-1.80476, 1.791817, -1.016328, 1, 0.2039216, 0, 1,
-1.78319, 1.861184, -0.2913565, 1, 0.2117647, 0, 1,
-1.781075, -2.128022, -1.68104, 1, 0.2156863, 0, 1,
-1.779174, -1.419893, -2.313762, 1, 0.2235294, 0, 1,
-1.759652, -0.5668017, -2.071503, 1, 0.227451, 0, 1,
-1.732279, -0.8419139, -2.075538, 1, 0.2352941, 0, 1,
-1.72032, 1.154581, 0.9786212, 1, 0.2392157, 0, 1,
-1.711717, -1.477732, -3.573613, 1, 0.2470588, 0, 1,
-1.70792, 2.737449, 0.4396618, 1, 0.2509804, 0, 1,
-1.705794, 1.031332, -1.470876, 1, 0.2588235, 0, 1,
-1.679289, -0.3284037, -4.228912, 1, 0.2627451, 0, 1,
-1.665065, -0.8070156, -1.390452, 1, 0.2705882, 0, 1,
-1.630374, -1.084288, -2.005795, 1, 0.2745098, 0, 1,
-1.630144, 0.01378762, -0.4980999, 1, 0.282353, 0, 1,
-1.628955, 0.8921868, 0.4836545, 1, 0.2862745, 0, 1,
-1.596802, -0.4241409, -1.797246, 1, 0.2941177, 0, 1,
-1.592524, 1.467433, -1.886451, 1, 0.3019608, 0, 1,
-1.58963, 2.102133, 0.8884035, 1, 0.3058824, 0, 1,
-1.583958, 0.7831407, -0.5372979, 1, 0.3137255, 0, 1,
-1.575017, 0.9126351, -0.8384808, 1, 0.3176471, 0, 1,
-1.573671, 0.15666, -3.447881, 1, 0.3254902, 0, 1,
-1.571807, -0.1289527, -1.227969, 1, 0.3294118, 0, 1,
-1.571284, -0.6585304, 0.5645159, 1, 0.3372549, 0, 1,
-1.565419, 0.7037855, -0.3607289, 1, 0.3411765, 0, 1,
-1.557152, -0.9476708, -1.454876, 1, 0.3490196, 0, 1,
-1.554154, -1.620748, -1.772037, 1, 0.3529412, 0, 1,
-1.542591, -0.761319, -3.024076, 1, 0.3607843, 0, 1,
-1.538491, 0.6825437, -0.1191822, 1, 0.3647059, 0, 1,
-1.504465, -0.1664305, -2.050595, 1, 0.372549, 0, 1,
-1.498909, -1.299252, -1.912801, 1, 0.3764706, 0, 1,
-1.495177, -0.006899585, -0.9382447, 1, 0.3843137, 0, 1,
-1.486227, 0.3762098, -2.60989, 1, 0.3882353, 0, 1,
-1.459437, -0.4238976, -1.568253, 1, 0.3960784, 0, 1,
-1.449385, 0.7746755, -0.05109036, 1, 0.4039216, 0, 1,
-1.444647, 0.9989395, -0.7123551, 1, 0.4078431, 0, 1,
-1.43573, -0.2757439, -0.8351955, 1, 0.4156863, 0, 1,
-1.432333, -1.10806, -2.047621, 1, 0.4196078, 0, 1,
-1.432279, -0.9743206, -2.180971, 1, 0.427451, 0, 1,
-1.430226, -0.6806206, -2.979408, 1, 0.4313726, 0, 1,
-1.42722, 0.4955133, -0.3539354, 1, 0.4392157, 0, 1,
-1.411652, 1.223303, -2.958385, 1, 0.4431373, 0, 1,
-1.408731, -0.5280456, -1.460281, 1, 0.4509804, 0, 1,
-1.406366, -1.002184, -1.508352, 1, 0.454902, 0, 1,
-1.398187, 0.907226, 0.724692, 1, 0.4627451, 0, 1,
-1.394421, 0.6726649, 1.603639, 1, 0.4666667, 0, 1,
-1.394013, 1.774217, -0.3981434, 1, 0.4745098, 0, 1,
-1.393205, 1.611002, -1.390689, 1, 0.4784314, 0, 1,
-1.389458, -1.58995, -3.483066, 1, 0.4862745, 0, 1,
-1.386322, -0.8928851, -2.217691, 1, 0.4901961, 0, 1,
-1.384709, 0.9970387, -1.321811, 1, 0.4980392, 0, 1,
-1.360156, 0.299388, -0.4928797, 1, 0.5058824, 0, 1,
-1.359967, -0.9707609, -1.764656, 1, 0.509804, 0, 1,
-1.352667, 1.679469, -0.9047412, 1, 0.5176471, 0, 1,
-1.348802, -1.750217, -2.765436, 1, 0.5215687, 0, 1,
-1.344728, 1.225146, -0.8823668, 1, 0.5294118, 0, 1,
-1.339133, 1.926032, -1.309606, 1, 0.5333334, 0, 1,
-1.33858, -0.9010524, -2.024033, 1, 0.5411765, 0, 1,
-1.337759, -1.471628, -2.748638, 1, 0.5450981, 0, 1,
-1.337698, 0.01622676, -2.206833, 1, 0.5529412, 0, 1,
-1.326256, -1.070413, -0.5072569, 1, 0.5568628, 0, 1,
-1.319837, -1.421664, -0.7360786, 1, 0.5647059, 0, 1,
-1.318871, -2.437658, -2.658366, 1, 0.5686275, 0, 1,
-1.318289, -1.389452, -1.818092, 1, 0.5764706, 0, 1,
-1.314807, -0.9434636, -1.784675, 1, 0.5803922, 0, 1,
-1.312644, -1.667979, -1.768158, 1, 0.5882353, 0, 1,
-1.300426, 0.7435589, -0.04712303, 1, 0.5921569, 0, 1,
-1.300175, 0.3075508, -0.7883125, 1, 0.6, 0, 1,
-1.299798, -1.258561, -3.055191, 1, 0.6078432, 0, 1,
-1.299716, 0.8567919, -2.33153, 1, 0.6117647, 0, 1,
-1.296911, 0.1571729, -2.714896, 1, 0.6196079, 0, 1,
-1.291782, 0.4801805, -0.6862773, 1, 0.6235294, 0, 1,
-1.291164, 0.4471849, -0.6787493, 1, 0.6313726, 0, 1,
-1.290377, 1.177377, -1.721515, 1, 0.6352941, 0, 1,
-1.284446, -0.6466051, -2.095522, 1, 0.6431373, 0, 1,
-1.282309, 0.128279, -0.4738388, 1, 0.6470588, 0, 1,
-1.277887, -0.3000818, -1.543533, 1, 0.654902, 0, 1,
-1.270066, -0.3201089, -3.232675, 1, 0.6588235, 0, 1,
-1.265369, 0.1118254, -1.88316, 1, 0.6666667, 0, 1,
-1.260501, -0.1613174, -2.129988, 1, 0.6705883, 0, 1,
-1.25215, -1.12811, -0.9171987, 1, 0.6784314, 0, 1,
-1.251618, 1.860545, -0.3472567, 1, 0.682353, 0, 1,
-1.251024, -0.5374963, -1.689163, 1, 0.6901961, 0, 1,
-1.247907, 0.6660392, 0.1271331, 1, 0.6941177, 0, 1,
-1.243109, 0.2187958, -0.9489452, 1, 0.7019608, 0, 1,
-1.235399, 0.3456307, -1.435084, 1, 0.7098039, 0, 1,
-1.221872, -0.2492936, -1.165277, 1, 0.7137255, 0, 1,
-1.21838, -0.8028766, -2.152392, 1, 0.7215686, 0, 1,
-1.207495, 1.022178, -0.6635526, 1, 0.7254902, 0, 1,
-1.205328, -0.8202005, -4.371746, 1, 0.7333333, 0, 1,
-1.192688, 0.1194351, -2.137036, 1, 0.7372549, 0, 1,
-1.18006, -0.3686236, -0.4397016, 1, 0.7450981, 0, 1,
-1.178156, -0.6520921, -3.371165, 1, 0.7490196, 0, 1,
-1.16915, 1.865476, -0.8318339, 1, 0.7568628, 0, 1,
-1.168623, -1.161988, -2.690024, 1, 0.7607843, 0, 1,
-1.165624, -0.2916313, -2.425911, 1, 0.7686275, 0, 1,
-1.157062, -0.4104698, -1.358461, 1, 0.772549, 0, 1,
-1.154224, 0.9182318, -0.4140941, 1, 0.7803922, 0, 1,
-1.129814, 0.2865109, -0.709246, 1, 0.7843137, 0, 1,
-1.128864, -0.490184, -3.071896, 1, 0.7921569, 0, 1,
-1.126833, -1.055422, -2.026289, 1, 0.7960784, 0, 1,
-1.125081, 0.5763731, -0.4876943, 1, 0.8039216, 0, 1,
-1.124015, -1.079904, -2.62006, 1, 0.8117647, 0, 1,
-1.118406, 0.3554647, -1.538419, 1, 0.8156863, 0, 1,
-1.110671, 0.1781693, -2.172537, 1, 0.8235294, 0, 1,
-1.105175, -1.795783, -2.338245, 1, 0.827451, 0, 1,
-1.104104, -0.365459, -1.95132, 1, 0.8352941, 0, 1,
-1.097121, 0.6868154, -0.8917444, 1, 0.8392157, 0, 1,
-1.094455, -1.560114, -1.143629, 1, 0.8470588, 0, 1,
-1.093197, 0.05729982, -1.88017, 1, 0.8509804, 0, 1,
-1.089033, 0.2661931, -1.031953, 1, 0.8588235, 0, 1,
-1.083855, -0.5417745, -1.869311, 1, 0.8627451, 0, 1,
-1.070944, 0.6707309, -2.1493, 1, 0.8705882, 0, 1,
-1.061573, -0.5858166, -1.873097, 1, 0.8745098, 0, 1,
-1.059898, 0.4383099, -1.087241, 1, 0.8823529, 0, 1,
-1.058834, -0.06175815, -2.72341, 1, 0.8862745, 0, 1,
-1.054335, -1.844316, -2.320999, 1, 0.8941177, 0, 1,
-1.052455, -0.364533, -3.094793, 1, 0.8980392, 0, 1,
-1.047703, 0.3614176, -2.45386, 1, 0.9058824, 0, 1,
-1.043573, -0.3742397, -1.986483, 1, 0.9137255, 0, 1,
-1.038838, -1.301215, -1.672473, 1, 0.9176471, 0, 1,
-1.03779, 0.604968, -0.2673882, 1, 0.9254902, 0, 1,
-1.033424, -0.3169161, -0.1175211, 1, 0.9294118, 0, 1,
-1.029502, -1.835318, -2.695715, 1, 0.9372549, 0, 1,
-1.027483, -0.09570693, -2.162934, 1, 0.9411765, 0, 1,
-1.026023, 0.2294643, -1.272015, 1, 0.9490196, 0, 1,
-1.016277, 0.2376447, -1.455214, 1, 0.9529412, 0, 1,
-1.006806, 1.020254, -1.232233, 1, 0.9607843, 0, 1,
-1.006257, 0.02226385, -2.048609, 1, 0.9647059, 0, 1,
-1.000517, -2.026095, -3.453807, 1, 0.972549, 0, 1,
-0.9944956, -1.111704, -1.818736, 1, 0.9764706, 0, 1,
-0.9927471, -0.2109867, -1.351698, 1, 0.9843137, 0, 1,
-0.9843509, 1.606235, -0.9933648, 1, 0.9882353, 0, 1,
-0.9572264, 0.2287191, -2.430077, 1, 0.9960784, 0, 1,
-0.9534929, 0.6163812, -0.4387472, 0.9960784, 1, 0, 1,
-0.9526854, 0.7948089, -2.37153, 0.9921569, 1, 0, 1,
-0.9480842, 0.04038229, -1.596798, 0.9843137, 1, 0, 1,
-0.9325683, -1.284203, -2.978609, 0.9803922, 1, 0, 1,
-0.9300641, -0.7052013, -2.488407, 0.972549, 1, 0, 1,
-0.9280303, 0.8134587, -0.6481937, 0.9686275, 1, 0, 1,
-0.9278598, 0.3002102, -1.251513, 0.9607843, 1, 0, 1,
-0.9270831, 0.3430821, -1.491182, 0.9568627, 1, 0, 1,
-0.9235241, -1.194009, -2.891777, 0.9490196, 1, 0, 1,
-0.9228089, -1.527652, -0.7530762, 0.945098, 1, 0, 1,
-0.9220209, 0.2456227, -2.113984, 0.9372549, 1, 0, 1,
-0.9088089, -0.3077091, -4.552687, 0.9333333, 1, 0, 1,
-0.9084789, 0.6719362, -0.0342967, 0.9254902, 1, 0, 1,
-0.9081725, 0.004302516, -2.619071, 0.9215686, 1, 0, 1,
-0.9057305, -0.5349965, -3.259508, 0.9137255, 1, 0, 1,
-0.9004792, -0.2979746, -1.893187, 0.9098039, 1, 0, 1,
-0.9000309, -1.993784, -2.587049, 0.9019608, 1, 0, 1,
-0.8995755, 0.2990545, -0.05907016, 0.8941177, 1, 0, 1,
-0.8967846, -0.3489798, -2.197403, 0.8901961, 1, 0, 1,
-0.8935643, -0.5800671, -2.66712, 0.8823529, 1, 0, 1,
-0.8933285, -0.4203517, -1.462924, 0.8784314, 1, 0, 1,
-0.8847546, 0.1177586, 0.08967644, 0.8705882, 1, 0, 1,
-0.8834218, 1.07682, -0.4272387, 0.8666667, 1, 0, 1,
-0.8783292, 0.9536262, -1.515515, 0.8588235, 1, 0, 1,
-0.8778066, 0.4994171, -1.917326, 0.854902, 1, 0, 1,
-0.8739769, 1.786224, -0.02052402, 0.8470588, 1, 0, 1,
-0.8726804, 0.8810226, -1.413208, 0.8431373, 1, 0, 1,
-0.8671964, 1.28781, -2.027718, 0.8352941, 1, 0, 1,
-0.8650765, 1.035568, -0.5168382, 0.8313726, 1, 0, 1,
-0.8602954, 0.554323, 0.1414991, 0.8235294, 1, 0, 1,
-0.8595651, 0.08186416, -2.444815, 0.8196079, 1, 0, 1,
-0.8574901, -2.045906, -3.548271, 0.8117647, 1, 0, 1,
-0.8554987, -0.4316495, -1.307243, 0.8078431, 1, 0, 1,
-0.8522571, 0.8521699, -2.568197, 0.8, 1, 0, 1,
-0.8458084, 0.210064, -0.09237464, 0.7921569, 1, 0, 1,
-0.8455425, -0.5680272, -1.135285, 0.7882353, 1, 0, 1,
-0.8402606, -0.5461782, -1.738688, 0.7803922, 1, 0, 1,
-0.8393051, 1.117961, -0.1056422, 0.7764706, 1, 0, 1,
-0.8318228, -0.471487, -1.99292, 0.7686275, 1, 0, 1,
-0.8277332, -0.9780773, -1.292088, 0.7647059, 1, 0, 1,
-0.8202929, -0.6635526, -2.254701, 0.7568628, 1, 0, 1,
-0.8160239, 0.1362974, -0.1227154, 0.7529412, 1, 0, 1,
-0.8144202, 0.7021654, -0.1675509, 0.7450981, 1, 0, 1,
-0.8048887, 1.311954, -0.07149588, 0.7411765, 1, 0, 1,
-0.7993312, -1.599603, -2.293054, 0.7333333, 1, 0, 1,
-0.7993022, 2.493883, 1.18336, 0.7294118, 1, 0, 1,
-0.7986776, -0.04819348, -0.8018814, 0.7215686, 1, 0, 1,
-0.7918009, 0.6268007, -0.1416212, 0.7176471, 1, 0, 1,
-0.7866197, 1.080021, -1.748959, 0.7098039, 1, 0, 1,
-0.7862066, 0.8221353, 0.2211173, 0.7058824, 1, 0, 1,
-0.7861974, 0.5400163, -2.847953, 0.6980392, 1, 0, 1,
-0.7840374, 0.4101085, -1.713244, 0.6901961, 1, 0, 1,
-0.7817345, -0.1024765, -3.052788, 0.6862745, 1, 0, 1,
-0.7791005, -0.3565983, -3.338155, 0.6784314, 1, 0, 1,
-0.7757673, -1.087374, -3.205958, 0.6745098, 1, 0, 1,
-0.7706916, 0.9509627, -0.8385949, 0.6666667, 1, 0, 1,
-0.7651507, 0.502814, -2.407455, 0.6627451, 1, 0, 1,
-0.7626088, 2.428618, 0.05057331, 0.654902, 1, 0, 1,
-0.7528051, 0.1970836, -1.846858, 0.6509804, 1, 0, 1,
-0.7502141, 1.013752, -1.783024, 0.6431373, 1, 0, 1,
-0.7446285, -0.4959763, -2.240587, 0.6392157, 1, 0, 1,
-0.7380733, 1.430857, 0.04018103, 0.6313726, 1, 0, 1,
-0.7303059, -1.746781, -2.201785, 0.627451, 1, 0, 1,
-0.7285545, -0.9079687, -1.35692, 0.6196079, 1, 0, 1,
-0.7285062, -1.295747, -2.92603, 0.6156863, 1, 0, 1,
-0.7210659, -0.6003087, -1.813829, 0.6078432, 1, 0, 1,
-0.719322, 0.963272, 0.06992007, 0.6039216, 1, 0, 1,
-0.7089368, -0.9276005, -2.68077, 0.5960785, 1, 0, 1,
-0.7084333, -0.08724201, -2.95179, 0.5882353, 1, 0, 1,
-0.706862, 0.818336, -1.043679, 0.5843138, 1, 0, 1,
-0.70634, -0.9333692, -2.147681, 0.5764706, 1, 0, 1,
-0.6983512, -0.1518223, 0.08872388, 0.572549, 1, 0, 1,
-0.6928151, -0.4797071, -2.765368, 0.5647059, 1, 0, 1,
-0.6924014, -1.384898, -2.387914, 0.5607843, 1, 0, 1,
-0.6873127, 2.020227, -2.292435, 0.5529412, 1, 0, 1,
-0.6799026, -1.693882, -3.190829, 0.5490196, 1, 0, 1,
-0.6783662, 0.2906468, -2.736313, 0.5411765, 1, 0, 1,
-0.6782894, 0.6890761, -1.298797, 0.5372549, 1, 0, 1,
-0.6753621, 1.947003, -0.3452936, 0.5294118, 1, 0, 1,
-0.6749762, 1.248461, 0.6932339, 0.5254902, 1, 0, 1,
-0.667685, -1.627938, -0.8130279, 0.5176471, 1, 0, 1,
-0.6676374, -0.005557624, -3.927577, 0.5137255, 1, 0, 1,
-0.6672752, 0.1521444, -1.38781, 0.5058824, 1, 0, 1,
-0.6641136, -1.061561, -1.948689, 0.5019608, 1, 0, 1,
-0.6609477, 0.1502053, -0.8330771, 0.4941176, 1, 0, 1,
-0.6598179, -0.1965085, -2.968577, 0.4862745, 1, 0, 1,
-0.6573266, -1.113575, -1.826849, 0.4823529, 1, 0, 1,
-0.65689, -0.2263902, -1.262709, 0.4745098, 1, 0, 1,
-0.6520184, -1.187826, -3.930398, 0.4705882, 1, 0, 1,
-0.6468546, 0.5782014, 0.04322805, 0.4627451, 1, 0, 1,
-0.6459045, 0.7107462, -0.1671659, 0.4588235, 1, 0, 1,
-0.6414772, -0.741235, -3.641083, 0.4509804, 1, 0, 1,
-0.6325524, -1.180376, -2.118081, 0.4470588, 1, 0, 1,
-0.6322865, 1.401498, 0.8810831, 0.4392157, 1, 0, 1,
-0.6233193, -1.209019, -4.438339, 0.4352941, 1, 0, 1,
-0.6203615, -1.198002, -1.991, 0.427451, 1, 0, 1,
-0.6201944, -0.5241262, -1.006042, 0.4235294, 1, 0, 1,
-0.6194761, -0.0451131, 0.1999172, 0.4156863, 1, 0, 1,
-0.6193241, -0.6326723, -3.276793, 0.4117647, 1, 0, 1,
-0.6175717, -0.8398206, -2.243085, 0.4039216, 1, 0, 1,
-0.6111159, -0.3345025, -1.3635, 0.3960784, 1, 0, 1,
-0.6080867, -0.6621458, -0.876989, 0.3921569, 1, 0, 1,
-0.604764, 0.5529751, 0.4644787, 0.3843137, 1, 0, 1,
-0.6028619, 0.06548686, -1.446373, 0.3803922, 1, 0, 1,
-0.598253, -0.5460238, -3.681906, 0.372549, 1, 0, 1,
-0.5950315, 1.347848, 0.5372655, 0.3686275, 1, 0, 1,
-0.5939606, 0.3564094, -1.783614, 0.3607843, 1, 0, 1,
-0.5913869, -0.7339788, -2.87677, 0.3568628, 1, 0, 1,
-0.5839188, 0.6595846, -0.04079939, 0.3490196, 1, 0, 1,
-0.5752897, 0.343693, -2.797436, 0.345098, 1, 0, 1,
-0.5744444, -0.5334079, -2.043196, 0.3372549, 1, 0, 1,
-0.5666329, -0.1474013, -1.748253, 0.3333333, 1, 0, 1,
-0.5648733, 1.41943, -0.5457992, 0.3254902, 1, 0, 1,
-0.5643827, 1.075817, -0.07451269, 0.3215686, 1, 0, 1,
-0.5643007, -0.6710158, -0.9975927, 0.3137255, 1, 0, 1,
-0.5635583, 0.1197864, -1.817073, 0.3098039, 1, 0, 1,
-0.5630271, 1.588844, -0.4191708, 0.3019608, 1, 0, 1,
-0.5615904, -0.1283574, -3.24124, 0.2941177, 1, 0, 1,
-0.5584229, -1.315993, -4.082458, 0.2901961, 1, 0, 1,
-0.5583845, 1.628411, 0.4189125, 0.282353, 1, 0, 1,
-0.5540701, 0.5944775, -1.581053, 0.2784314, 1, 0, 1,
-0.5466695, 0.4594583, -3.176705, 0.2705882, 1, 0, 1,
-0.5461255, -0.586063, -4.272866, 0.2666667, 1, 0, 1,
-0.5454001, 0.5883791, -0.4284615, 0.2588235, 1, 0, 1,
-0.5370251, 0.4971228, -2.050096, 0.254902, 1, 0, 1,
-0.5348231, -0.05781234, -2.366492, 0.2470588, 1, 0, 1,
-0.5307172, 0.8584646, -1.351182, 0.2431373, 1, 0, 1,
-0.5286055, 0.2382357, -0.2837613, 0.2352941, 1, 0, 1,
-0.528448, -1.312355, -2.356078, 0.2313726, 1, 0, 1,
-0.5261955, 0.9372534, 0.03711421, 0.2235294, 1, 0, 1,
-0.5186343, 0.5370423, -0.5066687, 0.2196078, 1, 0, 1,
-0.5183047, -1.206207, -0.03864334, 0.2117647, 1, 0, 1,
-0.5134695, 0.5487214, -0.4899071, 0.2078431, 1, 0, 1,
-0.5115681, 1.588975, -1.210731, 0.2, 1, 0, 1,
-0.5113893, -0.1546851, -3.296762, 0.1921569, 1, 0, 1,
-0.5107816, -1.183756, -3.284676, 0.1882353, 1, 0, 1,
-0.5093688, 0.05566198, -2.129711, 0.1803922, 1, 0, 1,
-0.5086924, -0.2513891, -2.640365, 0.1764706, 1, 0, 1,
-0.5030287, 0.2895575, 0.4303607, 0.1686275, 1, 0, 1,
-0.496177, 0.6047045, -2.8668, 0.1647059, 1, 0, 1,
-0.4949721, -0.5737832, -5.168565, 0.1568628, 1, 0, 1,
-0.4919045, -0.5794739, -0.8401469, 0.1529412, 1, 0, 1,
-0.4873689, -0.7869204, -2.629699, 0.145098, 1, 0, 1,
-0.4842077, 0.06495541, -1.0494, 0.1411765, 1, 0, 1,
-0.4821454, 1.202233, -0.5399898, 0.1333333, 1, 0, 1,
-0.4756748, 0.4893627, -0.9295245, 0.1294118, 1, 0, 1,
-0.4752887, 0.9592574, 0.6731827, 0.1215686, 1, 0, 1,
-0.4726903, 1.997949, -1.695285, 0.1176471, 1, 0, 1,
-0.4647345, 0.7648911, -2.113691, 0.1098039, 1, 0, 1,
-0.461363, 0.6216571, -1.746139, 0.1058824, 1, 0, 1,
-0.4568499, 0.6127528, -1.862637, 0.09803922, 1, 0, 1,
-0.4525753, 0.639771, -0.3068995, 0.09019608, 1, 0, 1,
-0.4506197, -0.2074898, -3.215444, 0.08627451, 1, 0, 1,
-0.4503452, -0.956754, -3.618574, 0.07843138, 1, 0, 1,
-0.4453433, -0.107825, -0.00247893, 0.07450981, 1, 0, 1,
-0.4445096, 0.6345052, -0.9517775, 0.06666667, 1, 0, 1,
-0.4438681, -0.8542467, -2.464253, 0.0627451, 1, 0, 1,
-0.4415635, -0.2972035, -3.603289, 0.05490196, 1, 0, 1,
-0.437636, -0.5909457, -2.34872, 0.05098039, 1, 0, 1,
-0.4371783, -2.610012, -3.349343, 0.04313726, 1, 0, 1,
-0.4370732, -1.095691, -3.484124, 0.03921569, 1, 0, 1,
-0.4370559, 0.2446029, 0.2210003, 0.03137255, 1, 0, 1,
-0.43571, 0.01534821, -1.596453, 0.02745098, 1, 0, 1,
-0.4339978, 0.7487056, -0.122243, 0.01960784, 1, 0, 1,
-0.4228875, 0.5529286, -1.058473, 0.01568628, 1, 0, 1,
-0.4216622, 2.001578, -1.645259, 0.007843138, 1, 0, 1,
-0.4196536, -1.39025, -1.272957, 0.003921569, 1, 0, 1,
-0.4177598, -0.9930991, -1.917399, 0, 1, 0.003921569, 1,
-0.4130576, 1.629651, 0.5410894, 0, 1, 0.01176471, 1,
-0.409272, -0.05702578, -1.268904, 0, 1, 0.01568628, 1,
-0.4078671, -0.4857365, -3.787331, 0, 1, 0.02352941, 1,
-0.3951128, -0.9855717, -2.323673, 0, 1, 0.02745098, 1,
-0.3931167, 1.824169, -1.196147, 0, 1, 0.03529412, 1,
-0.3901297, -1.246478, -2.590236, 0, 1, 0.03921569, 1,
-0.3852446, -0.723646, -3.305444, 0, 1, 0.04705882, 1,
-0.3803829, 2.300399, -0.6240851, 0, 1, 0.05098039, 1,
-0.377569, -0.3614514, -0.7231843, 0, 1, 0.05882353, 1,
-0.3760805, 0.8976356, 1.093324, 0, 1, 0.0627451, 1,
-0.3757842, -0.9165876, -3.238835, 0, 1, 0.07058824, 1,
-0.3696346, -1.473338, -2.886489, 0, 1, 0.07450981, 1,
-0.3643393, 0.7410101, -0.0849127, 0, 1, 0.08235294, 1,
-0.3562035, -1.225812, -0.6105071, 0, 1, 0.08627451, 1,
-0.3487814, -0.7666039, -2.376788, 0, 1, 0.09411765, 1,
-0.3445149, -1.381498, -3.954758, 0, 1, 0.1019608, 1,
-0.3428255, -0.08128673, -2.085095, 0, 1, 0.1058824, 1,
-0.3425682, 0.344895, -2.270038, 0, 1, 0.1137255, 1,
-0.3418213, 0.111011, -1.471878, 0, 1, 0.1176471, 1,
-0.3377409, -2.424966, -3.299656, 0, 1, 0.1254902, 1,
-0.3363353, -0.4956415, -0.5537673, 0, 1, 0.1294118, 1,
-0.3340288, 0.7342593, -0.5358507, 0, 1, 0.1372549, 1,
-0.3165177, 0.6798999, -0.4261922, 0, 1, 0.1411765, 1,
-0.3112507, 1.508566, 0.06527892, 0, 1, 0.1490196, 1,
-0.3104061, 0.9905956, 1.249235, 0, 1, 0.1529412, 1,
-0.3039154, -1.475307, -3.098775, 0, 1, 0.1607843, 1,
-0.3023991, 0.4399508, -1.261526, 0, 1, 0.1647059, 1,
-0.3019014, 1.204092, 0.1801383, 0, 1, 0.172549, 1,
-0.2983249, -0.224318, -1.899857, 0, 1, 0.1764706, 1,
-0.296801, -1.489928, -1.970369, 0, 1, 0.1843137, 1,
-0.2931432, -0.4036013, -2.173442, 0, 1, 0.1882353, 1,
-0.2871057, 0.4275463, -0.9582686, 0, 1, 0.1960784, 1,
-0.2852091, 0.9839999, 0.5584478, 0, 1, 0.2039216, 1,
-0.283012, 1.01554, -0.5885581, 0, 1, 0.2078431, 1,
-0.2733033, 0.3030072, -0.2330291, 0, 1, 0.2156863, 1,
-0.2726544, 0.07102096, -2.243716, 0, 1, 0.2196078, 1,
-0.2724701, -0.6776773, -2.779909, 0, 1, 0.227451, 1,
-0.2714418, -0.5820342, -0.6717223, 0, 1, 0.2313726, 1,
-0.2695393, 0.4608249, -1.208844, 0, 1, 0.2392157, 1,
-0.2676992, 0.3320174, 0.1839648, 0, 1, 0.2431373, 1,
-0.2621823, -0.08937205, -1.349125, 0, 1, 0.2509804, 1,
-0.2593713, -0.7682391, -3.908933, 0, 1, 0.254902, 1,
-0.2564583, -0.03606491, -0.3521906, 0, 1, 0.2627451, 1,
-0.2545286, 0.1939419, -0.8070448, 0, 1, 0.2666667, 1,
-0.2497157, -0.2016852, -3.45, 0, 1, 0.2745098, 1,
-0.2443396, -0.3318665, -2.047348, 0, 1, 0.2784314, 1,
-0.2437824, -0.177915, -2.571227, 0, 1, 0.2862745, 1,
-0.2434062, -1.443668, -2.832023, 0, 1, 0.2901961, 1,
-0.2427616, 0.1165647, -2.627261, 0, 1, 0.2980392, 1,
-0.2408947, 0.7358745, -0.09562813, 0, 1, 0.3058824, 1,
-0.2338327, -0.1803757, -1.993196, 0, 1, 0.3098039, 1,
-0.2321587, -1.094355, -1.760744, 0, 1, 0.3176471, 1,
-0.2256037, 0.3917905, -0.06141333, 0, 1, 0.3215686, 1,
-0.2235558, 1.129249, 1.647892, 0, 1, 0.3294118, 1,
-0.2204617, -1.622884, -1.844556, 0, 1, 0.3333333, 1,
-0.2139777, 0.1612591, -0.740094, 0, 1, 0.3411765, 1,
-0.2132992, -0.3891172, -1.718466, 0, 1, 0.345098, 1,
-0.2130594, 0.1049735, -2.161236, 0, 1, 0.3529412, 1,
-0.2119727, 0.3770738, 0.5680959, 0, 1, 0.3568628, 1,
-0.2114819, 0.0879304, -1.302834, 0, 1, 0.3647059, 1,
-0.2078626, -0.9637291, -3.961484, 0, 1, 0.3686275, 1,
-0.2076721, -0.2329541, -5.329939, 0, 1, 0.3764706, 1,
-0.2067461, 0.1987577, -1.729564, 0, 1, 0.3803922, 1,
-0.2066035, 0.4332518, 0.5385778, 0, 1, 0.3882353, 1,
-0.206013, 0.8235466, -0.3950258, 0, 1, 0.3921569, 1,
-0.2039558, -2.243396, -4.751371, 0, 1, 0.4, 1,
-0.2004457, 1.363615, -0.4258059, 0, 1, 0.4078431, 1,
-0.2000412, 0.5789956, -2.259063, 0, 1, 0.4117647, 1,
-0.1995311, -0.6664549, -1.177218, 0, 1, 0.4196078, 1,
-0.1957983, -0.5479659, -1.082677, 0, 1, 0.4235294, 1,
-0.1898611, -0.9909773, -3.467568, 0, 1, 0.4313726, 1,
-0.1898389, -0.1735386, -3.356723, 0, 1, 0.4352941, 1,
-0.1859682, 0.3588917, -0.8958178, 0, 1, 0.4431373, 1,
-0.1851057, -0.7256454, -3.139733, 0, 1, 0.4470588, 1,
-0.1843478, 1.548248, -1.531732, 0, 1, 0.454902, 1,
-0.1830607, 0.3397265, -0.1115086, 0, 1, 0.4588235, 1,
-0.1804309, 0.2883674, 0.3522426, 0, 1, 0.4666667, 1,
-0.1754109, 2.098905, -0.5764228, 0, 1, 0.4705882, 1,
-0.1726197, -1.054781, -2.959991, 0, 1, 0.4784314, 1,
-0.1712466, 0.2074886, -2.933299, 0, 1, 0.4823529, 1,
-0.1692521, -0.4721384, -2.602065, 0, 1, 0.4901961, 1,
-0.1669242, -0.1187486, -1.282316, 0, 1, 0.4941176, 1,
-0.1668488, 1.349343, -0.9814637, 0, 1, 0.5019608, 1,
-0.1654629, -0.3623054, -4.081253, 0, 1, 0.509804, 1,
-0.1644401, 0.4269393, -1.182068, 0, 1, 0.5137255, 1,
-0.1536257, 0.107045, -0.1177496, 0, 1, 0.5215687, 1,
-0.1511411, 0.6519516, 1.496114, 0, 1, 0.5254902, 1,
-0.149267, 0.1231103, -0.636292, 0, 1, 0.5333334, 1,
-0.1455564, -1.123333, -2.836872, 0, 1, 0.5372549, 1,
-0.1451906, 0.1539199, -0.4959144, 0, 1, 0.5450981, 1,
-0.1429694, -0.1463968, -4.106172, 0, 1, 0.5490196, 1,
-0.1360676, -0.368035, -3.538155, 0, 1, 0.5568628, 1,
-0.1358041, -1.088484, -2.766436, 0, 1, 0.5607843, 1,
-0.1326237, -0.009901709, -2.760479, 0, 1, 0.5686275, 1,
-0.1314613, -0.7411702, -3.647221, 0, 1, 0.572549, 1,
-0.1307997, -1.723686, -2.660859, 0, 1, 0.5803922, 1,
-0.1253549, 0.01541847, -1.169381, 0, 1, 0.5843138, 1,
-0.1235922, -0.8444064, -3.64195, 0, 1, 0.5921569, 1,
-0.1234903, 0.4724009, 0.6562341, 0, 1, 0.5960785, 1,
-0.121242, 1.749407, -0.388845, 0, 1, 0.6039216, 1,
-0.1188655, 0.9922172, -0.9479601, 0, 1, 0.6117647, 1,
-0.115273, 0.4989482, -0.1980476, 0, 1, 0.6156863, 1,
-0.1111295, 0.9846708, 0.1262376, 0, 1, 0.6235294, 1,
-0.1101408, -0.7358059, -4.061261, 0, 1, 0.627451, 1,
-0.1082893, -0.5617826, -2.922971, 0, 1, 0.6352941, 1,
-0.1036963, 1.513047, 1.132198, 0, 1, 0.6392157, 1,
-0.1004968, 0.9608437, 0.1396344, 0, 1, 0.6470588, 1,
-0.1000376, -0.3943544, -2.823707, 0, 1, 0.6509804, 1,
-0.09538854, 0.02549238, -1.819642, 0, 1, 0.6588235, 1,
-0.09511692, 1.020229, 0.5736799, 0, 1, 0.6627451, 1,
-0.09474427, -0.7283584, -1.342212, 0, 1, 0.6705883, 1,
-0.0913412, -1.130024, -3.898599, 0, 1, 0.6745098, 1,
-0.09079833, -0.5701532, -2.364182, 0, 1, 0.682353, 1,
-0.08899732, -0.7591275, -1.676115, 0, 1, 0.6862745, 1,
-0.08774909, 0.7098879, 0.04286481, 0, 1, 0.6941177, 1,
-0.08638501, -0.3728487, -1.952026, 0, 1, 0.7019608, 1,
-0.08496826, -1.972135, -3.738632, 0, 1, 0.7058824, 1,
-0.08280876, -0.6194386, -3.389538, 0, 1, 0.7137255, 1,
-0.08204055, 0.3208113, -0.4823454, 0, 1, 0.7176471, 1,
-0.08039246, 1.134161, -0.1780474, 0, 1, 0.7254902, 1,
-0.07884713, 0.5229331, -0.09134381, 0, 1, 0.7294118, 1,
-0.07841988, -1.241861, -2.094886, 0, 1, 0.7372549, 1,
-0.07706586, -0.07687669, -2.523697, 0, 1, 0.7411765, 1,
-0.07353652, -1.689521, -2.111243, 0, 1, 0.7490196, 1,
-0.07318996, 0.487622, 0.6930196, 0, 1, 0.7529412, 1,
-0.0654406, 0.6577916, 1.194383, 0, 1, 0.7607843, 1,
-0.06498221, -1.172081, -2.734449, 0, 1, 0.7647059, 1,
-0.06271276, 0.4803685, -0.02790659, 0, 1, 0.772549, 1,
-0.0597628, 0.007878961, -0.7030616, 0, 1, 0.7764706, 1,
-0.05844829, -0.6060568, -3.831243, 0, 1, 0.7843137, 1,
-0.05745767, 0.9506851, 0.8215582, 0, 1, 0.7882353, 1,
-0.05506327, 0.9881083, -1.453925, 0, 1, 0.7960784, 1,
-0.05400248, -1.681774, -1.739365, 0, 1, 0.8039216, 1,
-0.04982657, -0.3238435, -3.157243, 0, 1, 0.8078431, 1,
-0.0443128, 0.5971057, 0.4585671, 0, 1, 0.8156863, 1,
-0.04385522, -0.6103684, -2.277856, 0, 1, 0.8196079, 1,
-0.03862392, 0.3302521, -0.4890364, 0, 1, 0.827451, 1,
-0.03550819, -0.4817524, -2.253353, 0, 1, 0.8313726, 1,
-0.0345533, -0.831198, -3.05656, 0, 1, 0.8392157, 1,
-0.03407959, -0.303455, -2.454049, 0, 1, 0.8431373, 1,
-0.03237541, -0.7320117, -3.131638, 0, 1, 0.8509804, 1,
-0.03001244, -1.058806, -1.692538, 0, 1, 0.854902, 1,
-0.02402606, 0.2268234, 0.5222277, 0, 1, 0.8627451, 1,
-0.0230015, 1.557366, -1.500765, 0, 1, 0.8666667, 1,
-0.02240518, -0.3699145, -0.816557, 0, 1, 0.8745098, 1,
-0.0217683, -0.1189876, -2.882197, 0, 1, 0.8784314, 1,
-0.02132627, -1.449209, -3.080099, 0, 1, 0.8862745, 1,
-0.01956975, 0.02395223, -0.3757808, 0, 1, 0.8901961, 1,
-0.01665629, -0.9239333, -1.027785, 0, 1, 0.8980392, 1,
-0.01275339, 0.4102935, 0.7534154, 0, 1, 0.9058824, 1,
-0.00613049, 0.4822847, -0.2317501, 0, 1, 0.9098039, 1,
-0.002464853, -0.7939342, -3.355662, 0, 1, 0.9176471, 1,
-0.001261061, -0.7707683, -1.506024, 0, 1, 0.9215686, 1,
0.0002842878, -2.925982, 5.066049, 0, 1, 0.9294118, 1,
0.003459816, -0.2372815, 5.783905, 0, 1, 0.9333333, 1,
0.003908065, -0.4062204, 3.182963, 0, 1, 0.9411765, 1,
0.005713158, -0.1116027, 4.107651, 0, 1, 0.945098, 1,
0.006521231, -0.2513779, 2.582362, 0, 1, 0.9529412, 1,
0.009136047, 0.7621533, 0.3065675, 0, 1, 0.9568627, 1,
0.00987216, 0.3234062, -0.2295398, 0, 1, 0.9647059, 1,
0.01169171, -0.5936108, 4.45455, 0, 1, 0.9686275, 1,
0.01474562, 0.7421677, 0.5487983, 0, 1, 0.9764706, 1,
0.01624263, -1.50857, 3.526624, 0, 1, 0.9803922, 1,
0.02017807, 0.9378296, -1.458628, 0, 1, 0.9882353, 1,
0.02066684, -1.976386, 4.781179, 0, 1, 0.9921569, 1,
0.02073144, -1.066023, 4.382016, 0, 1, 1, 1,
0.02133787, 0.8202406, -2.068876, 0, 0.9921569, 1, 1,
0.02156511, -0.4067298, 2.422612, 0, 0.9882353, 1, 1,
0.02518588, 2.265454, -1.002358, 0, 0.9803922, 1, 1,
0.026958, -0.2132008, 3.849459, 0, 0.9764706, 1, 1,
0.03153088, 1.129374, -0.05295793, 0, 0.9686275, 1, 1,
0.03159826, 0.1352178, -0.7357122, 0, 0.9647059, 1, 1,
0.032268, 0.2505084, 1.000239, 0, 0.9568627, 1, 1,
0.03290889, -0.3631239, 2.600877, 0, 0.9529412, 1, 1,
0.03315809, -0.005853168, 0.7652657, 0, 0.945098, 1, 1,
0.03587123, 0.6937218, 1.099735, 0, 0.9411765, 1, 1,
0.0402265, -1.221369, 2.42569, 0, 0.9333333, 1, 1,
0.04046527, 0.9060777, 0.2565083, 0, 0.9294118, 1, 1,
0.0446818, 3.026308, -0.2669454, 0, 0.9215686, 1, 1,
0.04565481, -0.4184017, 3.550783, 0, 0.9176471, 1, 1,
0.04710126, -1.141088, 3.004871, 0, 0.9098039, 1, 1,
0.04830946, -0.2409769, 2.031415, 0, 0.9058824, 1, 1,
0.05081177, 0.269106, 1.742898, 0, 0.8980392, 1, 1,
0.05236823, 0.006161193, 1.105014, 0, 0.8901961, 1, 1,
0.05458489, 0.6880999, -0.5326154, 0, 0.8862745, 1, 1,
0.05957624, 0.7556416, 0.8376265, 0, 0.8784314, 1, 1,
0.06402696, -0.3249957, 4.747149, 0, 0.8745098, 1, 1,
0.06989708, 0.5746668, 1.147076, 0, 0.8666667, 1, 1,
0.0710163, 1.053101, 1.697262, 0, 0.8627451, 1, 1,
0.0719805, -0.3771856, 3.382408, 0, 0.854902, 1, 1,
0.07260173, 0.5428258, 0.6095928, 0, 0.8509804, 1, 1,
0.07530271, -0.04335616, 2.297522, 0, 0.8431373, 1, 1,
0.07690042, 0.8448889, -0.8795547, 0, 0.8392157, 1, 1,
0.07971747, -0.1414232, 2.457638, 0, 0.8313726, 1, 1,
0.08250825, -0.469839, 2.436917, 0, 0.827451, 1, 1,
0.08280664, -1.256169, 3.940133, 0, 0.8196079, 1, 1,
0.08330805, -0.2267546, 2.74379, 0, 0.8156863, 1, 1,
0.08529117, 0.7220486, -0.3193126, 0, 0.8078431, 1, 1,
0.09038384, 1.490823, -0.9846787, 0, 0.8039216, 1, 1,
0.09605661, 0.5139487, -0.1323081, 0, 0.7960784, 1, 1,
0.1094593, 0.8767884, 1.233569, 0, 0.7882353, 1, 1,
0.1118099, 0.2853872, 0.4803089, 0, 0.7843137, 1, 1,
0.1162077, -0.2145009, 3.0666, 0, 0.7764706, 1, 1,
0.1183119, -0.9619235, 3.200412, 0, 0.772549, 1, 1,
0.1213314, 0.1133822, 1.338125, 0, 0.7647059, 1, 1,
0.1357938, -0.5128065, 2.459121, 0, 0.7607843, 1, 1,
0.1361311, 0.07556865, 1.187559, 0, 0.7529412, 1, 1,
0.1361852, 0.1228186, -0.02470864, 0, 0.7490196, 1, 1,
0.1375087, 0.1372531, 1.336457, 0, 0.7411765, 1, 1,
0.1424969, -0.3567637, 2.573277, 0, 0.7372549, 1, 1,
0.1456898, 0.4291413, 1.234074, 0, 0.7294118, 1, 1,
0.1473849, -0.2778471, 2.571289, 0, 0.7254902, 1, 1,
0.1493076, -0.8292025, 2.986339, 0, 0.7176471, 1, 1,
0.1504299, 0.1125405, 0.192913, 0, 0.7137255, 1, 1,
0.1517706, -1.588757, 3.750243, 0, 0.7058824, 1, 1,
0.1611206, 0.07138583, 1.405568, 0, 0.6980392, 1, 1,
0.1625889, -0.3277597, 0.9086436, 0, 0.6941177, 1, 1,
0.1634236, 0.55192, -0.6542767, 0, 0.6862745, 1, 1,
0.1647993, 1.126869, -0.04246029, 0, 0.682353, 1, 1,
0.1653651, -1.670138, 3.212497, 0, 0.6745098, 1, 1,
0.1686327, 0.3591945, 2.230315, 0, 0.6705883, 1, 1,
0.1692476, 0.6200924, -0.9272815, 0, 0.6627451, 1, 1,
0.1740474, 0.009538194, 1.119058, 0, 0.6588235, 1, 1,
0.1798023, 1.035346, -0.05617258, 0, 0.6509804, 1, 1,
0.1806234, 0.481906, 1.374448, 0, 0.6470588, 1, 1,
0.1841061, 0.5681663, 0.2452921, 0, 0.6392157, 1, 1,
0.1903036, -1.645124, 3.585783, 0, 0.6352941, 1, 1,
0.1928015, -0.8487393, 2.423794, 0, 0.627451, 1, 1,
0.1958832, -1.200612, 3.337988, 0, 0.6235294, 1, 1,
0.1965909, 2.042844, 0.5009206, 0, 0.6156863, 1, 1,
0.1970161, 0.7371833, 1.429451, 0, 0.6117647, 1, 1,
0.202875, -0.3982547, 3.620168, 0, 0.6039216, 1, 1,
0.2039669, 1.649148, -0.90979, 0, 0.5960785, 1, 1,
0.2046543, -1.352043, 4.742774, 0, 0.5921569, 1, 1,
0.2073132, 0.3601874, 1.802556, 0, 0.5843138, 1, 1,
0.2078409, 0.09457642, -0.6830039, 0, 0.5803922, 1, 1,
0.2124644, -0.4023922, 1.993739, 0, 0.572549, 1, 1,
0.2133905, 0.8899465, -1.500934, 0, 0.5686275, 1, 1,
0.2143372, 0.1538576, 1.159303, 0, 0.5607843, 1, 1,
0.2149974, -0.7709822, 3.845744, 0, 0.5568628, 1, 1,
0.2165876, -0.4623345, 1.240662, 0, 0.5490196, 1, 1,
0.2172675, 1.472214, -0.2691359, 0, 0.5450981, 1, 1,
0.2193976, 0.1863412, 1.402644, 0, 0.5372549, 1, 1,
0.2242698, -1.229842, 3.179302, 0, 0.5333334, 1, 1,
0.2250512, -0.7174096, 1.770572, 0, 0.5254902, 1, 1,
0.2297992, -0.6511907, 0.246757, 0, 0.5215687, 1, 1,
0.2298969, -0.3867875, 1.253, 0, 0.5137255, 1, 1,
0.2302511, -0.4410943, 4.327291, 0, 0.509804, 1, 1,
0.2346341, -0.7037045, 4.091375, 0, 0.5019608, 1, 1,
0.2349158, -1.452522, 1.117596, 0, 0.4941176, 1, 1,
0.2361276, 1.98722, 1.008191, 0, 0.4901961, 1, 1,
0.237516, -0.8990173, 1.89588, 0, 0.4823529, 1, 1,
0.2411581, 0.1931535, 1.189997, 0, 0.4784314, 1, 1,
0.2436057, 1.833318, -0.4428848, 0, 0.4705882, 1, 1,
0.2537344, -0.4223995, 3.818668, 0, 0.4666667, 1, 1,
0.256044, 0.5496357, -0.2759106, 0, 0.4588235, 1, 1,
0.2568363, -0.1567231, 2.044748, 0, 0.454902, 1, 1,
0.2569357, 0.1987208, 0.06238805, 0, 0.4470588, 1, 1,
0.2590042, 0.3026991, -0.09947717, 0, 0.4431373, 1, 1,
0.2603608, -0.4987054, 3.043624, 0, 0.4352941, 1, 1,
0.2614868, -0.1460142, 1.778267, 0, 0.4313726, 1, 1,
0.2624521, 0.1160362, 0.9305102, 0, 0.4235294, 1, 1,
0.2661177, 0.5037925, 2.467407, 0, 0.4196078, 1, 1,
0.2676565, 2.290988, 1.645016, 0, 0.4117647, 1, 1,
0.2680132, 0.1734515, 0.5378127, 0, 0.4078431, 1, 1,
0.2685031, -0.02865245, -0.4554752, 0, 0.4, 1, 1,
0.2718542, -1.067127, 1.484146, 0, 0.3921569, 1, 1,
0.2726524, 0.1832327, 1.977195, 0, 0.3882353, 1, 1,
0.2818803, 1.154819, 0.7255225, 0, 0.3803922, 1, 1,
0.2862847, -0.8430336, 2.778432, 0, 0.3764706, 1, 1,
0.2936724, -0.7400088, 1.514925, 0, 0.3686275, 1, 1,
0.2968356, -0.9025318, 2.896875, 0, 0.3647059, 1, 1,
0.3016212, -1.363648, 3.313008, 0, 0.3568628, 1, 1,
0.3024521, 0.1692824, 2.016049, 0, 0.3529412, 1, 1,
0.3026176, -0.001298836, 3.127308, 0, 0.345098, 1, 1,
0.3036691, -0.7620648, 3.111031, 0, 0.3411765, 1, 1,
0.3046161, -0.6034506, 2.000393, 0, 0.3333333, 1, 1,
0.3060781, -0.04794045, 1.936693, 0, 0.3294118, 1, 1,
0.3169625, -0.4734826, 2.747444, 0, 0.3215686, 1, 1,
0.3193739, 1.423755, -0.8934144, 0, 0.3176471, 1, 1,
0.3207414, 0.6159746, 0.1079484, 0, 0.3098039, 1, 1,
0.3217413, 1.297361, 0.0369863, 0, 0.3058824, 1, 1,
0.3223615, -1.396996, 2.020684, 0, 0.2980392, 1, 1,
0.3229275, 0.117193, 1.525406, 0, 0.2901961, 1, 1,
0.3315982, -0.2932438, 1.766955, 0, 0.2862745, 1, 1,
0.3383946, 2.598512, 0.7226008, 0, 0.2784314, 1, 1,
0.3398371, 0.8971483, 2.173702, 0, 0.2745098, 1, 1,
0.3433174, 0.6725506, 0.4437547, 0, 0.2666667, 1, 1,
0.3448663, 1.237155, 1.657225, 0, 0.2627451, 1, 1,
0.345222, -2.088386, 4.401821, 0, 0.254902, 1, 1,
0.3452878, -0.961422, 2.111937, 0, 0.2509804, 1, 1,
0.3484305, 0.2114208, 1.562618, 0, 0.2431373, 1, 1,
0.3528911, 0.361477, -0.7318779, 0, 0.2392157, 1, 1,
0.3533579, 0.5282419, 0.7595928, 0, 0.2313726, 1, 1,
0.3588036, -1.247492, 0.7974609, 0, 0.227451, 1, 1,
0.3626408, 0.08736832, -0.5980736, 0, 0.2196078, 1, 1,
0.3638938, 0.8178424, -0.335174, 0, 0.2156863, 1, 1,
0.3647746, 0.2677312, 0.2932053, 0, 0.2078431, 1, 1,
0.3661372, 0.7266716, 1.434151, 0, 0.2039216, 1, 1,
0.3724238, -0.93126, 3.942571, 0, 0.1960784, 1, 1,
0.373872, -0.7272005, 3.497699, 0, 0.1882353, 1, 1,
0.3757079, 0.8397371, 0.01410918, 0, 0.1843137, 1, 1,
0.3767035, -2.183861, 3.109165, 0, 0.1764706, 1, 1,
0.3773963, -0.7533014, 0.8767967, 0, 0.172549, 1, 1,
0.3808601, 1.605051, -0.008603434, 0, 0.1647059, 1, 1,
0.3809906, -0.7450211, 2.325613, 0, 0.1607843, 1, 1,
0.3814062, 0.4928153, -0.6682333, 0, 0.1529412, 1, 1,
0.3822474, 2.075339, -0.7415144, 0, 0.1490196, 1, 1,
0.3835934, 1.940998, 0.1165666, 0, 0.1411765, 1, 1,
0.3888295, -0.07315972, 2.369245, 0, 0.1372549, 1, 1,
0.3979882, 0.7142135, -0.6605542, 0, 0.1294118, 1, 1,
0.402522, 0.729885, 1.45845, 0, 0.1254902, 1, 1,
0.4037357, -0.7213009, 1.8627, 0, 0.1176471, 1, 1,
0.4053046, 0.1314798, 1.153221, 0, 0.1137255, 1, 1,
0.4086678, 0.01476264, 3.366037, 0, 0.1058824, 1, 1,
0.4090201, 0.4626376, 2.352625, 0, 0.09803922, 1, 1,
0.4092431, 0.5910908, -0.02351866, 0, 0.09411765, 1, 1,
0.4102631, 2.172526, 1.591368, 0, 0.08627451, 1, 1,
0.4189196, 0.6510783, -0.1779626, 0, 0.08235294, 1, 1,
0.4265344, -0.1758522, 2.723122, 0, 0.07450981, 1, 1,
0.4292347, 0.3486356, -0.5942423, 0, 0.07058824, 1, 1,
0.4297912, 1.13929, 1.107389, 0, 0.0627451, 1, 1,
0.4309809, -0.5727819, 1.671857, 0, 0.05882353, 1, 1,
0.431011, 0.9322529, 2.283678, 0, 0.05098039, 1, 1,
0.4364191, -1.368723, 2.188209, 0, 0.04705882, 1, 1,
0.4370118, -0.3387815, 2.902854, 0, 0.03921569, 1, 1,
0.4391862, 0.5401962, 0.5687696, 0, 0.03529412, 1, 1,
0.4511012, -1.600703, 2.797387, 0, 0.02745098, 1, 1,
0.4515003, 0.105534, -1.853113, 0, 0.02352941, 1, 1,
0.4588572, 0.04817233, -1.927866, 0, 0.01568628, 1, 1,
0.4615276, 1.291754, 1.100114, 0, 0.01176471, 1, 1,
0.4628728, 0.2667892, 2.324267, 0, 0.003921569, 1, 1,
0.4713697, -1.959417, 3.361827, 0.003921569, 0, 1, 1,
0.4760823, 1.148685, 1.227977, 0.007843138, 0, 1, 1,
0.4777273, 0.4712065, -1.009543, 0.01568628, 0, 1, 1,
0.480685, 0.8550969, 0.8991042, 0.01960784, 0, 1, 1,
0.484834, -0.7124387, 1.671242, 0.02745098, 0, 1, 1,
0.4865769, -0.1496913, 2.268663, 0.03137255, 0, 1, 1,
0.4872193, -1.241228, 1.611598, 0.03921569, 0, 1, 1,
0.4901074, -0.3187868, 1.510242, 0.04313726, 0, 1, 1,
0.4930983, 0.7266904, 2.419486, 0.05098039, 0, 1, 1,
0.4980789, 0.1072001, 0.8931541, 0.05490196, 0, 1, 1,
0.5037547, -1.079892, 0.4309962, 0.0627451, 0, 1, 1,
0.5066353, 1.769274, -1.121126, 0.06666667, 0, 1, 1,
0.5081273, -0.6454836, 3.646834, 0.07450981, 0, 1, 1,
0.5121018, 0.6191461, 1.140474, 0.07843138, 0, 1, 1,
0.512848, 0.5988577, 1.70837, 0.08627451, 0, 1, 1,
0.5164363, 0.03501603, 2.961208, 0.09019608, 0, 1, 1,
0.5181838, -1.634412, 3.7651, 0.09803922, 0, 1, 1,
0.527658, 0.2478857, 1.7036, 0.1058824, 0, 1, 1,
0.529594, -0.3605514, 2.145389, 0.1098039, 0, 1, 1,
0.5313064, 0.8771214, -1.444622, 0.1176471, 0, 1, 1,
0.5391722, 0.04444828, 3.79029, 0.1215686, 0, 1, 1,
0.540849, -0.3713008, 1.851824, 0.1294118, 0, 1, 1,
0.5442287, 1.202579, 0.7115924, 0.1333333, 0, 1, 1,
0.5466747, 0.48276, 0.7130185, 0.1411765, 0, 1, 1,
0.5507898, 0.7561188, 2.540429, 0.145098, 0, 1, 1,
0.5571054, -1.247506, 1.750556, 0.1529412, 0, 1, 1,
0.5590301, -0.2437728, 3.518285, 0.1568628, 0, 1, 1,
0.562887, -1.82013, 3.611607, 0.1647059, 0, 1, 1,
0.5670908, -0.2069957, 2.013468, 0.1686275, 0, 1, 1,
0.5682126, -1.070067, 3.585705, 0.1764706, 0, 1, 1,
0.5721542, -0.8897049, 3.090486, 0.1803922, 0, 1, 1,
0.578972, 1.043134, 1.132793, 0.1882353, 0, 1, 1,
0.5873402, -0.6161433, 3.170971, 0.1921569, 0, 1, 1,
0.5895022, 1.134411, -1.027178, 0.2, 0, 1, 1,
0.590929, 0.9961968, -0.1049204, 0.2078431, 0, 1, 1,
0.5913126, -0.3318515, 2.966065, 0.2117647, 0, 1, 1,
0.5950345, -1.320484, 3.960678, 0.2196078, 0, 1, 1,
0.598479, 0.3982386, 1.102562, 0.2235294, 0, 1, 1,
0.6013469, 0.199608, 2.667758, 0.2313726, 0, 1, 1,
0.6040348, -0.01358934, 0.8426636, 0.2352941, 0, 1, 1,
0.6048069, -0.5978249, 2.473617, 0.2431373, 0, 1, 1,
0.6048115, -2.351887, 2.938745, 0.2470588, 0, 1, 1,
0.60607, -0.7721806, 1.157411, 0.254902, 0, 1, 1,
0.6183453, 1.258539, 0.9620864, 0.2588235, 0, 1, 1,
0.6212631, -1.471862, 1.570674, 0.2666667, 0, 1, 1,
0.625421, -0.04531788, 0.1698753, 0.2705882, 0, 1, 1,
0.6316779, 0.2283563, 2.665165, 0.2784314, 0, 1, 1,
0.6398081, 1.44863, 1.437703, 0.282353, 0, 1, 1,
0.6445433, -0.05604099, 1.260785, 0.2901961, 0, 1, 1,
0.6459991, -0.7438509, 2.526187, 0.2941177, 0, 1, 1,
0.6492485, -1.383799, 3.275327, 0.3019608, 0, 1, 1,
0.6512312, 0.6667587, -1.059715, 0.3098039, 0, 1, 1,
0.6548415, -0.914276, 2.927152, 0.3137255, 0, 1, 1,
0.6557773, 0.06553485, 0.5885366, 0.3215686, 0, 1, 1,
0.6564868, 0.1401597, 0.1290641, 0.3254902, 0, 1, 1,
0.6566387, 0.5847392, 1.016886, 0.3333333, 0, 1, 1,
0.6637914, 0.3802153, 2.34662, 0.3372549, 0, 1, 1,
0.6661063, -0.6788815, 1.777565, 0.345098, 0, 1, 1,
0.6668323, 0.2977451, 2.982194, 0.3490196, 0, 1, 1,
0.6686099, 1.546173, 1.697055, 0.3568628, 0, 1, 1,
0.6688827, 1.255068, 1.263872, 0.3607843, 0, 1, 1,
0.6745911, 0.8827997, -0.7269804, 0.3686275, 0, 1, 1,
0.6758262, -0.03592632, 2.377388, 0.372549, 0, 1, 1,
0.6758857, -1.550606, 1.450142, 0.3803922, 0, 1, 1,
0.6764746, -0.1549429, 3.425119, 0.3843137, 0, 1, 1,
0.6805465, 0.2750552, 2.872144, 0.3921569, 0, 1, 1,
0.6811538, -0.1319468, 2.676233, 0.3960784, 0, 1, 1,
0.6844338, -1.616151, 2.474998, 0.4039216, 0, 1, 1,
0.6873831, 0.5604022, 1.691279, 0.4117647, 0, 1, 1,
0.6914668, -0.3961566, 2.60482, 0.4156863, 0, 1, 1,
0.6927332, 0.589491, 1.988739, 0.4235294, 0, 1, 1,
0.6929035, 0.3649845, 2.121704, 0.427451, 0, 1, 1,
0.6929237, 0.181854, 0.5409012, 0.4352941, 0, 1, 1,
0.698791, -0.9596986, 1.547354, 0.4392157, 0, 1, 1,
0.7021908, 0.3190434, 1.701125, 0.4470588, 0, 1, 1,
0.7024362, 0.04914608, 1.874078, 0.4509804, 0, 1, 1,
0.7027306, -0.1831761, 2.364619, 0.4588235, 0, 1, 1,
0.7036214, 0.8713891, 0.1311772, 0.4627451, 0, 1, 1,
0.7039471, 1.784629, -0.2427405, 0.4705882, 0, 1, 1,
0.7084977, -0.8155067, 2.982033, 0.4745098, 0, 1, 1,
0.7179188, 2.281081, -0.3108031, 0.4823529, 0, 1, 1,
0.719077, 1.380041, 0.1967987, 0.4862745, 0, 1, 1,
0.7198949, -1.925941, 3.759621, 0.4941176, 0, 1, 1,
0.7208169, -0.02596393, 3.089822, 0.5019608, 0, 1, 1,
0.7208868, -0.7254588, 2.011582, 0.5058824, 0, 1, 1,
0.7214531, -0.7079157, 3.783828, 0.5137255, 0, 1, 1,
0.7227491, -0.2861488, 4.018599, 0.5176471, 0, 1, 1,
0.7263846, -0.452088, 2.422411, 0.5254902, 0, 1, 1,
0.7296601, -1.247748, 3.70487, 0.5294118, 0, 1, 1,
0.730911, 0.915167, 1.028119, 0.5372549, 0, 1, 1,
0.7324026, 1.270838, -0.4209411, 0.5411765, 0, 1, 1,
0.7371425, -1.173107, 1.711421, 0.5490196, 0, 1, 1,
0.7372684, -0.1183241, 3.194136, 0.5529412, 0, 1, 1,
0.7385222, -0.7636704, 2.522177, 0.5607843, 0, 1, 1,
0.7537431, -1.228353, 3.44195, 0.5647059, 0, 1, 1,
0.7548025, 0.1915489, 1.560645, 0.572549, 0, 1, 1,
0.7696109, 0.983111, -0.1734779, 0.5764706, 0, 1, 1,
0.772329, -0.7611321, 1.980617, 0.5843138, 0, 1, 1,
0.7724162, -0.6447678, 2.613876, 0.5882353, 0, 1, 1,
0.772476, -1.997873, 2.850825, 0.5960785, 0, 1, 1,
0.7753689, 0.02705697, -0.1541599, 0.6039216, 0, 1, 1,
0.7796134, -0.2989813, 2.957649, 0.6078432, 0, 1, 1,
0.7972496, -0.9177596, 3.755432, 0.6156863, 0, 1, 1,
0.7985566, 1.116528, 0.2241771, 0.6196079, 0, 1, 1,
0.8020002, 0.7548198, -0.112443, 0.627451, 0, 1, 1,
0.8026091, -0.1731524, 0.7391557, 0.6313726, 0, 1, 1,
0.8028141, 0.1907809, 1.637077, 0.6392157, 0, 1, 1,
0.8094845, -1.875289, 0.9439559, 0.6431373, 0, 1, 1,
0.811672, -0.3257051, 1.178764, 0.6509804, 0, 1, 1,
0.8183643, 1.008967, 1.52291, 0.654902, 0, 1, 1,
0.8187577, -0.05735162, 2.100657, 0.6627451, 0, 1, 1,
0.8230457, -0.5574728, 1.611058, 0.6666667, 0, 1, 1,
0.8235684, -0.3619466, 2.914569, 0.6745098, 0, 1, 1,
0.8256102, 0.6131507, 1.09226, 0.6784314, 0, 1, 1,
0.8303442, 0.3086281, 0.3379674, 0.6862745, 0, 1, 1,
0.8314653, 0.0138502, 1.470484, 0.6901961, 0, 1, 1,
0.8349347, 0.7362335, 0.3684472, 0.6980392, 0, 1, 1,
0.8390235, 0.2255287, 1.422119, 0.7058824, 0, 1, 1,
0.8402329, -0.7728897, 2.837186, 0.7098039, 0, 1, 1,
0.8413043, 0.9189007, 1.278391, 0.7176471, 0, 1, 1,
0.8433986, -0.8625568, 1.881836, 0.7215686, 0, 1, 1,
0.8488796, -0.1747293, 2.683697, 0.7294118, 0, 1, 1,
0.8510672, 0.4411725, 2.389664, 0.7333333, 0, 1, 1,
0.8512775, 0.8494588, 2.52982, 0.7411765, 0, 1, 1,
0.852728, 0.2796625, 2.969037, 0.7450981, 0, 1, 1,
0.8549385, 0.8156416, 1.742121, 0.7529412, 0, 1, 1,
0.8555915, 0.6070558, 1.207435, 0.7568628, 0, 1, 1,
0.8630431, 0.3308223, 2.202787, 0.7647059, 0, 1, 1,
0.8655986, 0.71267, 0.5225465, 0.7686275, 0, 1, 1,
0.8662992, -0.8356662, 1.68754, 0.7764706, 0, 1, 1,
0.8675231, -1.365505, 5.086983, 0.7803922, 0, 1, 1,
0.8770163, -0.009624308, 0.2262536, 0.7882353, 0, 1, 1,
0.8826777, 0.702318, 1.037224, 0.7921569, 0, 1, 1,
0.8846398, 0.4510663, -0.5599093, 0.8, 0, 1, 1,
0.8864027, 0.3399221, 0.0146066, 0.8078431, 0, 1, 1,
0.8868188, -1.6748, 3.468409, 0.8117647, 0, 1, 1,
0.8871896, -0.9377281, 1.987876, 0.8196079, 0, 1, 1,
0.887305, 0.4259542, 0.2715881, 0.8235294, 0, 1, 1,
0.8879992, -0.2326949, 1.959388, 0.8313726, 0, 1, 1,
0.8891632, 1.328114, 0.2636779, 0.8352941, 0, 1, 1,
0.8895267, 0.6666134, -1.928676, 0.8431373, 0, 1, 1,
0.900952, -0.1800256, 1.325982, 0.8470588, 0, 1, 1,
0.9031774, -1.19132, 1.172318, 0.854902, 0, 1, 1,
0.9106997, -0.1068451, 0.01616025, 0.8588235, 0, 1, 1,
0.9131277, 2.302754, 1.383929, 0.8666667, 0, 1, 1,
0.9152951, 0.4785771, 1.171471, 0.8705882, 0, 1, 1,
0.915756, -0.2042172, -0.01357374, 0.8784314, 0, 1, 1,
0.9190221, 0.3880782, 2.665289, 0.8823529, 0, 1, 1,
0.9201282, 0.2762438, 2.240992, 0.8901961, 0, 1, 1,
0.9206182, -0.8015619, 0.8500253, 0.8941177, 0, 1, 1,
0.9243484, -1.418015, 1.972165, 0.9019608, 0, 1, 1,
0.9360453, -0.5128856, 1.743913, 0.9098039, 0, 1, 1,
0.9377698, 2.168366, -0.3322064, 0.9137255, 0, 1, 1,
0.9399821, -0.5086802, 2.322754, 0.9215686, 0, 1, 1,
0.9408847, -0.2865118, 1.930664, 0.9254902, 0, 1, 1,
0.9417996, 0.6529937, 1.526605, 0.9333333, 0, 1, 1,
0.9426333, 0.04198663, 0.9009215, 0.9372549, 0, 1, 1,
0.9447531, 0.8288387, 2.654758, 0.945098, 0, 1, 1,
0.9496751, 0.3851407, 1.01436, 0.9490196, 0, 1, 1,
0.9562168, -0.263695, 0.5395995, 0.9568627, 0, 1, 1,
0.9565564, -0.4029813, 1.892117, 0.9607843, 0, 1, 1,
0.9717105, -1.288727, 3.878076, 0.9686275, 0, 1, 1,
0.971815, 1.212144, -0.6595634, 0.972549, 0, 1, 1,
0.9719559, 0.2081906, 2.33214, 0.9803922, 0, 1, 1,
0.9731346, -1.313653, 3.007395, 0.9843137, 0, 1, 1,
0.9743142, 1.020732, -1.180038, 0.9921569, 0, 1, 1,
0.9798019, 1.972993, 0.3065996, 0.9960784, 0, 1, 1,
0.9798966, 0.6974626, 0.8412722, 1, 0, 0.9960784, 1,
0.9861038, 1.551376, 1.741479, 1, 0, 0.9882353, 1,
0.9880338, -0.3231797, 2.424659, 1, 0, 0.9843137, 1,
0.9902087, 1.166534, 1.470942, 1, 0, 0.9764706, 1,
0.9937826, 0.736447, -0.2311164, 1, 0, 0.972549, 1,
0.9951873, 0.2620119, 0.5229141, 1, 0, 0.9647059, 1,
0.9964032, -0.3271898, 1.594788, 1, 0, 0.9607843, 1,
0.9981942, 0.2815931, 0.3188447, 1, 0, 0.9529412, 1,
1.010588, 0.4379661, -0.5899808, 1, 0, 0.9490196, 1,
1.01122, -0.1030917, 0.3408862, 1, 0, 0.9411765, 1,
1.017226, 0.4577, 2.449257, 1, 0, 0.9372549, 1,
1.022786, 0.9494479, 0.08750639, 1, 0, 0.9294118, 1,
1.032065, -0.7437754, 2.230075, 1, 0, 0.9254902, 1,
1.04011, -1.883206, 2.885878, 1, 0, 0.9176471, 1,
1.043069, 1.769122, 1.000323, 1, 0, 0.9137255, 1,
1.044145, -0.4651186, 0.09611832, 1, 0, 0.9058824, 1,
1.044586, -1.971288, 1.911515, 1, 0, 0.9019608, 1,
1.051199, -0.4449774, 1.176193, 1, 0, 0.8941177, 1,
1.054219, -0.1992243, -0.02318498, 1, 0, 0.8862745, 1,
1.059234, 1.288128, -0.3095445, 1, 0, 0.8823529, 1,
1.063449, 0.7024736, 0.9951009, 1, 0, 0.8745098, 1,
1.065046, 1.372416, 0.4358654, 1, 0, 0.8705882, 1,
1.066132, 1.018827, 0.7421203, 1, 0, 0.8627451, 1,
1.069439, -1.993462, 1.627701, 1, 0, 0.8588235, 1,
1.0736, 1.389711, -0.7195275, 1, 0, 0.8509804, 1,
1.088861, 0.3623058, 2.749331, 1, 0, 0.8470588, 1,
1.105448, -0.1412704, 2.928294, 1, 0, 0.8392157, 1,
1.107645, -1.551687, 3.146109, 1, 0, 0.8352941, 1,
1.113128, -0.981209, 2.282825, 1, 0, 0.827451, 1,
1.113712, -0.7662752, 3.705359, 1, 0, 0.8235294, 1,
1.115247, 0.8951614, 0.7117636, 1, 0, 0.8156863, 1,
1.115808, -0.5276591, 2.650397, 1, 0, 0.8117647, 1,
1.120804, 1.056413, 0.68235, 1, 0, 0.8039216, 1,
1.124365, 0.08635028, 0.1674289, 1, 0, 0.7960784, 1,
1.133014, -0.5396165, 2.99324, 1, 0, 0.7921569, 1,
1.134447, -0.02088428, 1.477801, 1, 0, 0.7843137, 1,
1.135538, 1.352036, 0.9183809, 1, 0, 0.7803922, 1,
1.136734, 0.2434196, 1.642401, 1, 0, 0.772549, 1,
1.13699, 0.1659132, -0.4232455, 1, 0, 0.7686275, 1,
1.139584, -1.427906, 2.056842, 1, 0, 0.7607843, 1,
1.142507, -1.766451, 3.817738, 1, 0, 0.7568628, 1,
1.145828, 0.8176954, 0.2692893, 1, 0, 0.7490196, 1,
1.158346, 0.5788063, 1.240746, 1, 0, 0.7450981, 1,
1.162234, 0.6173933, 1.172005, 1, 0, 0.7372549, 1,
1.166664, 0.5109507, 0.8812662, 1, 0, 0.7333333, 1,
1.1699, -0.8177925, 0.05787012, 1, 0, 0.7254902, 1,
1.177538, 1.781217, 3.06797, 1, 0, 0.7215686, 1,
1.179123, -1.310342, 4.442643, 1, 0, 0.7137255, 1,
1.187564, 0.7537541, -0.8481441, 1, 0, 0.7098039, 1,
1.190307, 1.143121, 1.882804, 1, 0, 0.7019608, 1,
1.191293, -0.5966403, 1.007091, 1, 0, 0.6941177, 1,
1.192214, -0.4840561, 2.20796, 1, 0, 0.6901961, 1,
1.19359, 0.01628879, 0.8321921, 1, 0, 0.682353, 1,
1.19679, 0.2085584, 0.8498868, 1, 0, 0.6784314, 1,
1.200191, 0.01540496, 1.459723, 1, 0, 0.6705883, 1,
1.20056, -1.681434, 1.611077, 1, 0, 0.6666667, 1,
1.204054, -0.702334, 0.3466626, 1, 0, 0.6588235, 1,
1.208319, -1.804831, 0.9045953, 1, 0, 0.654902, 1,
1.227937, -0.9173671, 3.523463, 1, 0, 0.6470588, 1,
1.229324, 0.3778242, 1.440251, 1, 0, 0.6431373, 1,
1.231558, -0.6558539, 3.212492, 1, 0, 0.6352941, 1,
1.232923, 0.3997064, 2.397307, 1, 0, 0.6313726, 1,
1.234958, -1.384137, 2.664826, 1, 0, 0.6235294, 1,
1.23734, 0.7280867, 0.8819962, 1, 0, 0.6196079, 1,
1.237988, 1.125095, 1.387808, 1, 0, 0.6117647, 1,
1.242764, -0.2868057, 1.407313, 1, 0, 0.6078432, 1,
1.244007, -0.1521355, 1.223236, 1, 0, 0.6, 1,
1.247227, 0.9931694, 0.9509427, 1, 0, 0.5921569, 1,
1.259345, -0.9876303, 1.959041, 1, 0, 0.5882353, 1,
1.26305, -0.6864217, 2.360991, 1, 0, 0.5803922, 1,
1.27279, 1.417927, 0.5092944, 1, 0, 0.5764706, 1,
1.273405, 0.29492, 0.8496438, 1, 0, 0.5686275, 1,
1.279888, 0.7628135, 0.07376716, 1, 0, 0.5647059, 1,
1.283201, -1.140747, 1.388639, 1, 0, 0.5568628, 1,
1.284766, -1.484231, 1.498305, 1, 0, 0.5529412, 1,
1.29309, -0.9191055, 1.309238, 1, 0, 0.5450981, 1,
1.299319, -0.07894751, 2.618985, 1, 0, 0.5411765, 1,
1.309477, 0.223691, 0.2312471, 1, 0, 0.5333334, 1,
1.313549, -1.143067, 2.74326, 1, 0, 0.5294118, 1,
1.323854, -1.894969, 3.162137, 1, 0, 0.5215687, 1,
1.345772, 1.732334, 0.1608727, 1, 0, 0.5176471, 1,
1.36748, -0.3633141, 2.065403, 1, 0, 0.509804, 1,
1.373662, 0.8759437, 1.222773, 1, 0, 0.5058824, 1,
1.375651, 2.455222, -1.610311, 1, 0, 0.4980392, 1,
1.380547, -0.05990083, 0.2158876, 1, 0, 0.4901961, 1,
1.383247, 0.9010299, -1.143722, 1, 0, 0.4862745, 1,
1.390242, 0.4987341, -0.8277115, 1, 0, 0.4784314, 1,
1.402559, -0.5175882, 2.427837, 1, 0, 0.4745098, 1,
1.432082, -0.4858441, 1.155535, 1, 0, 0.4666667, 1,
1.440471, 0.9994391, 1.286568, 1, 0, 0.4627451, 1,
1.444475, 2.251148, 0.5660573, 1, 0, 0.454902, 1,
1.447101, -0.8127041, 1.890066, 1, 0, 0.4509804, 1,
1.461916, -0.6988265, 2.028162, 1, 0, 0.4431373, 1,
1.467355, -0.1570426, 2.852065, 1, 0, 0.4392157, 1,
1.470958, 0.3918175, 1.668662, 1, 0, 0.4313726, 1,
1.472181, -0.3457592, -0.001253886, 1, 0, 0.427451, 1,
1.474519, 0.720196, 2.119457, 1, 0, 0.4196078, 1,
1.480459, -0.8926009, 1.459699, 1, 0, 0.4156863, 1,
1.483746, 0.8817291, 0.678807, 1, 0, 0.4078431, 1,
1.491973, 0.1344761, 1.751261, 1, 0, 0.4039216, 1,
1.493971, -0.4952087, 3.488402, 1, 0, 0.3960784, 1,
1.501163, 0.7681263, 1.437424, 1, 0, 0.3882353, 1,
1.513404, 1.101357, 0.9029289, 1, 0, 0.3843137, 1,
1.518483, -0.2382419, 2.507715, 1, 0, 0.3764706, 1,
1.519762, 1.471702, 2.244186, 1, 0, 0.372549, 1,
1.537577, -1.530211, 5.364845, 1, 0, 0.3647059, 1,
1.542668, 0.3411182, 0.5078271, 1, 0, 0.3607843, 1,
1.555032, 1.248747, 1.491684, 1, 0, 0.3529412, 1,
1.556957, -1.868914, 2.423126, 1, 0, 0.3490196, 1,
1.560992, 0.4424392, 1.405796, 1, 0, 0.3411765, 1,
1.571791, 1.176514, -0.7577294, 1, 0, 0.3372549, 1,
1.576081, -0.3468919, 0.8895171, 1, 0, 0.3294118, 1,
1.577483, 0.7574434, 1.471693, 1, 0, 0.3254902, 1,
1.614652, 1.649001, 2.162438, 1, 0, 0.3176471, 1,
1.625279, -0.5432437, 2.426481, 1, 0, 0.3137255, 1,
1.626277, -1.542701, 2.844237, 1, 0, 0.3058824, 1,
1.627522, -0.2872232, 1.724679, 1, 0, 0.2980392, 1,
1.63388, -0.668951, 1.796987, 1, 0, 0.2941177, 1,
1.639128, -0.09775728, 1.153693, 1, 0, 0.2862745, 1,
1.652392, 0.7120713, -0.3710646, 1, 0, 0.282353, 1,
1.655425, 0.3709157, 1.119902, 1, 0, 0.2745098, 1,
1.663391, -0.05001301, 1.906988, 1, 0, 0.2705882, 1,
1.663697, -0.2873186, 3.550689, 1, 0, 0.2627451, 1,
1.669264, 1.596096, 1.675783, 1, 0, 0.2588235, 1,
1.673305, -0.05535551, -0.3379282, 1, 0, 0.2509804, 1,
1.688198, -0.08459438, 3.549483, 1, 0, 0.2470588, 1,
1.697887, -0.8360696, 2.481862, 1, 0, 0.2392157, 1,
1.705049, -0.6187888, 3.134746, 1, 0, 0.2352941, 1,
1.722968, -0.7796727, 0.3258894, 1, 0, 0.227451, 1,
1.762728, 1.029653, -0.09977506, 1, 0, 0.2235294, 1,
1.771937, 1.189789, 1.224865, 1, 0, 0.2156863, 1,
1.780151, 2.464952, 0.8371149, 1, 0, 0.2117647, 1,
1.781701, -1.964179, 2.226864, 1, 0, 0.2039216, 1,
1.785249, 0.2400417, 1.672536, 1, 0, 0.1960784, 1,
1.80092, -0.6191829, 1.962485, 1, 0, 0.1921569, 1,
1.835585, -0.3200741, 3.161774, 1, 0, 0.1843137, 1,
1.84047, 1.797049, 1.984595, 1, 0, 0.1803922, 1,
1.865327, -0.7693395, 2.563443, 1, 0, 0.172549, 1,
1.878535, 0.1510307, 1.57933, 1, 0, 0.1686275, 1,
1.933733, -0.06596391, -0.1994759, 1, 0, 0.1607843, 1,
1.937976, -0.3716126, 0.7979544, 1, 0, 0.1568628, 1,
1.948782, -0.8930641, 0.4291478, 1, 0, 0.1490196, 1,
1.953362, -0.5242407, 2.610822, 1, 0, 0.145098, 1,
1.995794, 1.426778, 0.3355178, 1, 0, 0.1372549, 1,
2.003265, 0.3141166, -0.07979048, 1, 0, 0.1333333, 1,
2.005225, 1.174202, 2.537847, 1, 0, 0.1254902, 1,
2.010782, 0.4164684, 1.609739, 1, 0, 0.1215686, 1,
2.015254, -0.1424349, 1.89278, 1, 0, 0.1137255, 1,
2.025106, 0.2369692, 1.45517, 1, 0, 0.1098039, 1,
2.144184, 0.6418893, 0.1568314, 1, 0, 0.1019608, 1,
2.162672, 0.2780297, 2.004039, 1, 0, 0.09411765, 1,
2.173148, 0.9891245, 0.7099694, 1, 0, 0.09019608, 1,
2.183487, 1.431221, -0.1280771, 1, 0, 0.08235294, 1,
2.221936, -1.006473, 1.872988, 1, 0, 0.07843138, 1,
2.243917, 0.3904296, 0.4190662, 1, 0, 0.07058824, 1,
2.256807, 0.076263, 1.087971, 1, 0, 0.06666667, 1,
2.263865, -0.4751975, 3.027877, 1, 0, 0.05882353, 1,
2.314731, -0.09476601, 3.01095, 1, 0, 0.05490196, 1,
2.330341, 0.02191382, 2.085825, 1, 0, 0.04705882, 1,
2.406509, -0.038986, -0.1710673, 1, 0, 0.04313726, 1,
2.496404, -0.9692304, 2.324056, 1, 0, 0.03529412, 1,
2.528165, -1.044461, 2.932684, 1, 0, 0.03137255, 1,
2.538718, -0.04551795, 0.3753498, 1, 0, 0.02352941, 1,
2.752642, -1.106356, 2.421718, 1, 0, 0.01960784, 1,
2.999651, -0.5804203, 0.1484607, 1, 0, 0.01176471, 1,
3.097362, 0.264393, 1.871327, 1, 0, 0.007843138, 1
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
0.1573596, -3.934895, -7.213736, 0, -0.5, 0.5, 0.5,
0.1573596, -3.934895, -7.213736, 1, -0.5, 0.5, 0.5,
0.1573596, -3.934895, -7.213736, 1, 1.5, 0.5, 0.5,
0.1573596, -3.934895, -7.213736, 0, 1.5, 0.5, 0.5
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
-3.779303, 0.05016267, -7.213736, 0, -0.5, 0.5, 0.5,
-3.779303, 0.05016267, -7.213736, 1, -0.5, 0.5, 0.5,
-3.779303, 0.05016267, -7.213736, 1, 1.5, 0.5, 0.5,
-3.779303, 0.05016267, -7.213736, 0, 1.5, 0.5, 0.5
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
-3.779303, -3.934895, 0.2269828, 0, -0.5, 0.5, 0.5,
-3.779303, -3.934895, 0.2269828, 1, -0.5, 0.5, 0.5,
-3.779303, -3.934895, 0.2269828, 1, 1.5, 0.5, 0.5,
-3.779303, -3.934895, 0.2269828, 0, 1.5, 0.5, 0.5
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
-2, -3.015267, -5.496646,
3, -3.015267, -5.496646,
-2, -3.015267, -5.496646,
-2, -3.168538, -5.782828,
-1, -3.015267, -5.496646,
-1, -3.168538, -5.782828,
0, -3.015267, -5.496646,
0, -3.168538, -5.782828,
1, -3.015267, -5.496646,
1, -3.168538, -5.782828,
2, -3.015267, -5.496646,
2, -3.168538, -5.782828,
3, -3.015267, -5.496646,
3, -3.168538, -5.782828
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
-2, -3.475081, -6.355191, 0, -0.5, 0.5, 0.5,
-2, -3.475081, -6.355191, 1, -0.5, 0.5, 0.5,
-2, -3.475081, -6.355191, 1, 1.5, 0.5, 0.5,
-2, -3.475081, -6.355191, 0, 1.5, 0.5, 0.5,
-1, -3.475081, -6.355191, 0, -0.5, 0.5, 0.5,
-1, -3.475081, -6.355191, 1, -0.5, 0.5, 0.5,
-1, -3.475081, -6.355191, 1, 1.5, 0.5, 0.5,
-1, -3.475081, -6.355191, 0, 1.5, 0.5, 0.5,
0, -3.475081, -6.355191, 0, -0.5, 0.5, 0.5,
0, -3.475081, -6.355191, 1, -0.5, 0.5, 0.5,
0, -3.475081, -6.355191, 1, 1.5, 0.5, 0.5,
0, -3.475081, -6.355191, 0, 1.5, 0.5, 0.5,
1, -3.475081, -6.355191, 0, -0.5, 0.5, 0.5,
1, -3.475081, -6.355191, 1, -0.5, 0.5, 0.5,
1, -3.475081, -6.355191, 1, 1.5, 0.5, 0.5,
1, -3.475081, -6.355191, 0, 1.5, 0.5, 0.5,
2, -3.475081, -6.355191, 0, -0.5, 0.5, 0.5,
2, -3.475081, -6.355191, 1, -0.5, 0.5, 0.5,
2, -3.475081, -6.355191, 1, 1.5, 0.5, 0.5,
2, -3.475081, -6.355191, 0, 1.5, 0.5, 0.5,
3, -3.475081, -6.355191, 0, -0.5, 0.5, 0.5,
3, -3.475081, -6.355191, 1, -0.5, 0.5, 0.5,
3, -3.475081, -6.355191, 1, 1.5, 0.5, 0.5,
3, -3.475081, -6.355191, 0, 1.5, 0.5, 0.5
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
-2.870843, -2, -5.496646,
-2.870843, 3, -5.496646,
-2.870843, -2, -5.496646,
-3.022253, -2, -5.782828,
-2.870843, -1, -5.496646,
-3.022253, -1, -5.782828,
-2.870843, 0, -5.496646,
-3.022253, 0, -5.782828,
-2.870843, 1, -5.496646,
-3.022253, 1, -5.782828,
-2.870843, 2, -5.496646,
-3.022253, 2, -5.782828,
-2.870843, 3, -5.496646,
-3.022253, 3, -5.782828
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
-3.325073, -2, -6.355191, 0, -0.5, 0.5, 0.5,
-3.325073, -2, -6.355191, 1, -0.5, 0.5, 0.5,
-3.325073, -2, -6.355191, 1, 1.5, 0.5, 0.5,
-3.325073, -2, -6.355191, 0, 1.5, 0.5, 0.5,
-3.325073, -1, -6.355191, 0, -0.5, 0.5, 0.5,
-3.325073, -1, -6.355191, 1, -0.5, 0.5, 0.5,
-3.325073, -1, -6.355191, 1, 1.5, 0.5, 0.5,
-3.325073, -1, -6.355191, 0, 1.5, 0.5, 0.5,
-3.325073, 0, -6.355191, 0, -0.5, 0.5, 0.5,
-3.325073, 0, -6.355191, 1, -0.5, 0.5, 0.5,
-3.325073, 0, -6.355191, 1, 1.5, 0.5, 0.5,
-3.325073, 0, -6.355191, 0, 1.5, 0.5, 0.5,
-3.325073, 1, -6.355191, 0, -0.5, 0.5, 0.5,
-3.325073, 1, -6.355191, 1, -0.5, 0.5, 0.5,
-3.325073, 1, -6.355191, 1, 1.5, 0.5, 0.5,
-3.325073, 1, -6.355191, 0, 1.5, 0.5, 0.5,
-3.325073, 2, -6.355191, 0, -0.5, 0.5, 0.5,
-3.325073, 2, -6.355191, 1, -0.5, 0.5, 0.5,
-3.325073, 2, -6.355191, 1, 1.5, 0.5, 0.5,
-3.325073, 2, -6.355191, 0, 1.5, 0.5, 0.5,
-3.325073, 3, -6.355191, 0, -0.5, 0.5, 0.5,
-3.325073, 3, -6.355191, 1, -0.5, 0.5, 0.5,
-3.325073, 3, -6.355191, 1, 1.5, 0.5, 0.5,
-3.325073, 3, -6.355191, 0, 1.5, 0.5, 0.5
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
-2.870843, -3.015267, -4,
-2.870843, -3.015267, 4,
-2.870843, -3.015267, -4,
-3.022253, -3.168538, -4,
-2.870843, -3.015267, -2,
-3.022253, -3.168538, -2,
-2.870843, -3.015267, 0,
-3.022253, -3.168538, 0,
-2.870843, -3.015267, 2,
-3.022253, -3.168538, 2,
-2.870843, -3.015267, 4,
-3.022253, -3.168538, 4
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
-3.325073, -3.475081, -4, 0, -0.5, 0.5, 0.5,
-3.325073, -3.475081, -4, 1, -0.5, 0.5, 0.5,
-3.325073, -3.475081, -4, 1, 1.5, 0.5, 0.5,
-3.325073, -3.475081, -4, 0, 1.5, 0.5, 0.5,
-3.325073, -3.475081, -2, 0, -0.5, 0.5, 0.5,
-3.325073, -3.475081, -2, 1, -0.5, 0.5, 0.5,
-3.325073, -3.475081, -2, 1, 1.5, 0.5, 0.5,
-3.325073, -3.475081, -2, 0, 1.5, 0.5, 0.5,
-3.325073, -3.475081, 0, 0, -0.5, 0.5, 0.5,
-3.325073, -3.475081, 0, 1, -0.5, 0.5, 0.5,
-3.325073, -3.475081, 0, 1, 1.5, 0.5, 0.5,
-3.325073, -3.475081, 0, 0, 1.5, 0.5, 0.5,
-3.325073, -3.475081, 2, 0, -0.5, 0.5, 0.5,
-3.325073, -3.475081, 2, 1, -0.5, 0.5, 0.5,
-3.325073, -3.475081, 2, 1, 1.5, 0.5, 0.5,
-3.325073, -3.475081, 2, 0, 1.5, 0.5, 0.5,
-3.325073, -3.475081, 4, 0, -0.5, 0.5, 0.5,
-3.325073, -3.475081, 4, 1, -0.5, 0.5, 0.5,
-3.325073, -3.475081, 4, 1, 1.5, 0.5, 0.5,
-3.325073, -3.475081, 4, 0, 1.5, 0.5, 0.5
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
-2.870843, -3.015267, -5.496646,
-2.870843, 3.115592, -5.496646,
-2.870843, -3.015267, 5.950612,
-2.870843, 3.115592, 5.950612,
-2.870843, -3.015267, -5.496646,
-2.870843, -3.015267, 5.950612,
-2.870843, 3.115592, -5.496646,
-2.870843, 3.115592, 5.950612,
-2.870843, -3.015267, -5.496646,
3.185562, -3.015267, -5.496646,
-2.870843, -3.015267, 5.950612,
3.185562, -3.015267, 5.950612,
-2.870843, 3.115592, -5.496646,
3.185562, 3.115592, -5.496646,
-2.870843, 3.115592, 5.950612,
3.185562, 3.115592, 5.950612,
3.185562, -3.015267, -5.496646,
3.185562, 3.115592, -5.496646,
3.185562, -3.015267, 5.950612,
3.185562, 3.115592, 5.950612,
3.185562, -3.015267, -5.496646,
3.185562, -3.015267, 5.950612,
3.185562, 3.115592, -5.496646,
3.185562, 3.115592, 5.950612
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
var radius = 7.651165;
var distance = 34.04089;
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
mvMatrix.translate( -0.1573596, -0.05016267, -0.2269828 );
mvMatrix.scale( 1.365924, 1.349336, 0.7226699 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.04089);
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
methyl_bromide_methy<-read.table("methyl_bromide_methy.xyz")
```

```
## Error in read.table("methyl_bromide_methy.xyz"): no lines available in input
```

```r
x<-methyl_bromide_methy$V2
```

```
## Error in eval(expr, envir, enclos): object 'methyl_bromide_methy' not found
```

```r
y<-methyl_bromide_methy$V3
```

```
## Error in eval(expr, envir, enclos): object 'methyl_bromide_methy' not found
```

```r
z<-methyl_bromide_methy$V4
```

```
## Error in eval(expr, envir, enclos): object 'methyl_bromide_methy' not found
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
-2.782643, 0.9372065, -3.241588, 0, 0, 1, 1, 1,
-2.726426, 1.350813, -2.266303, 1, 0, 0, 1, 1,
-2.681364, -0.356416, -2.174473, 1, 0, 0, 1, 1,
-2.62076, -1.970555, -1.939144, 1, 0, 0, 1, 1,
-2.564564, -2.195249, -1.795771, 1, 0, 0, 1, 1,
-2.464964, 0.5325674, -1.298603, 1, 0, 0, 1, 1,
-2.446197, -0.5129327, -0.04850199, 0, 0, 0, 1, 1,
-2.323618, 2.142304, -0.763825, 0, 0, 0, 1, 1,
-2.316024, -0.3720365, -2.824636, 0, 0, 0, 1, 1,
-2.241875, 0.2191259, -2.258224, 0, 0, 0, 1, 1,
-2.233565, 0.05489223, -2.854721, 0, 0, 0, 1, 1,
-2.23122, -0.09104517, -0.9608501, 0, 0, 0, 1, 1,
-2.172383, -1.422083, -3.417148, 0, 0, 0, 1, 1,
-2.172295, 0.9782903, -2.122074, 1, 1, 1, 1, 1,
-2.166041, -0.8775962, -3.148847, 1, 1, 1, 1, 1,
-2.164823, 0.2435707, -0.3973936, 1, 1, 1, 1, 1,
-2.153031, -2.579868, -0.48818, 1, 1, 1, 1, 1,
-2.107106, 1.086384, -0.6214007, 1, 1, 1, 1, 1,
-2.103391, -0.2298606, -0.102231, 1, 1, 1, 1, 1,
-2.086267, 0.6288371, -4.155704, 1, 1, 1, 1, 1,
-2.065194, -0.1459055, -1.99169, 1, 1, 1, 1, 1,
-2.041066, -0.2680063, -1.581784, 1, 1, 1, 1, 1,
-2.008542, -1.618715, -1.766998, 1, 1, 1, 1, 1,
-1.970496, 0.01921417, 0.2576051, 1, 1, 1, 1, 1,
-1.942921, -1.193255, -2.258319, 1, 1, 1, 1, 1,
-1.930678, 0.7688292, -0.3157281, 1, 1, 1, 1, 1,
-1.928032, -0.253019, -1.768247, 1, 1, 1, 1, 1,
-1.906636, 2.111499, -0.8462867, 1, 1, 1, 1, 1,
-1.883065, -1.268901, -1.14302, 0, 0, 1, 1, 1,
-1.864136, -0.3980193, -3.685577, 1, 0, 0, 1, 1,
-1.847857, -0.3537433, -0.3734961, 1, 0, 0, 1, 1,
-1.841483, -1.115947, -3.035579, 1, 0, 0, 1, 1,
-1.809082, -1.412602, -1.103712, 1, 0, 0, 1, 1,
-1.80734, 1.917703, -0.4047333, 1, 0, 0, 1, 1,
-1.80476, 1.791817, -1.016328, 0, 0, 0, 1, 1,
-1.78319, 1.861184, -0.2913565, 0, 0, 0, 1, 1,
-1.781075, -2.128022, -1.68104, 0, 0, 0, 1, 1,
-1.779174, -1.419893, -2.313762, 0, 0, 0, 1, 1,
-1.759652, -0.5668017, -2.071503, 0, 0, 0, 1, 1,
-1.732279, -0.8419139, -2.075538, 0, 0, 0, 1, 1,
-1.72032, 1.154581, 0.9786212, 0, 0, 0, 1, 1,
-1.711717, -1.477732, -3.573613, 1, 1, 1, 1, 1,
-1.70792, 2.737449, 0.4396618, 1, 1, 1, 1, 1,
-1.705794, 1.031332, -1.470876, 1, 1, 1, 1, 1,
-1.679289, -0.3284037, -4.228912, 1, 1, 1, 1, 1,
-1.665065, -0.8070156, -1.390452, 1, 1, 1, 1, 1,
-1.630374, -1.084288, -2.005795, 1, 1, 1, 1, 1,
-1.630144, 0.01378762, -0.4980999, 1, 1, 1, 1, 1,
-1.628955, 0.8921868, 0.4836545, 1, 1, 1, 1, 1,
-1.596802, -0.4241409, -1.797246, 1, 1, 1, 1, 1,
-1.592524, 1.467433, -1.886451, 1, 1, 1, 1, 1,
-1.58963, 2.102133, 0.8884035, 1, 1, 1, 1, 1,
-1.583958, 0.7831407, -0.5372979, 1, 1, 1, 1, 1,
-1.575017, 0.9126351, -0.8384808, 1, 1, 1, 1, 1,
-1.573671, 0.15666, -3.447881, 1, 1, 1, 1, 1,
-1.571807, -0.1289527, -1.227969, 1, 1, 1, 1, 1,
-1.571284, -0.6585304, 0.5645159, 0, 0, 1, 1, 1,
-1.565419, 0.7037855, -0.3607289, 1, 0, 0, 1, 1,
-1.557152, -0.9476708, -1.454876, 1, 0, 0, 1, 1,
-1.554154, -1.620748, -1.772037, 1, 0, 0, 1, 1,
-1.542591, -0.761319, -3.024076, 1, 0, 0, 1, 1,
-1.538491, 0.6825437, -0.1191822, 1, 0, 0, 1, 1,
-1.504465, -0.1664305, -2.050595, 0, 0, 0, 1, 1,
-1.498909, -1.299252, -1.912801, 0, 0, 0, 1, 1,
-1.495177, -0.006899585, -0.9382447, 0, 0, 0, 1, 1,
-1.486227, 0.3762098, -2.60989, 0, 0, 0, 1, 1,
-1.459437, -0.4238976, -1.568253, 0, 0, 0, 1, 1,
-1.449385, 0.7746755, -0.05109036, 0, 0, 0, 1, 1,
-1.444647, 0.9989395, -0.7123551, 0, 0, 0, 1, 1,
-1.43573, -0.2757439, -0.8351955, 1, 1, 1, 1, 1,
-1.432333, -1.10806, -2.047621, 1, 1, 1, 1, 1,
-1.432279, -0.9743206, -2.180971, 1, 1, 1, 1, 1,
-1.430226, -0.6806206, -2.979408, 1, 1, 1, 1, 1,
-1.42722, 0.4955133, -0.3539354, 1, 1, 1, 1, 1,
-1.411652, 1.223303, -2.958385, 1, 1, 1, 1, 1,
-1.408731, -0.5280456, -1.460281, 1, 1, 1, 1, 1,
-1.406366, -1.002184, -1.508352, 1, 1, 1, 1, 1,
-1.398187, 0.907226, 0.724692, 1, 1, 1, 1, 1,
-1.394421, 0.6726649, 1.603639, 1, 1, 1, 1, 1,
-1.394013, 1.774217, -0.3981434, 1, 1, 1, 1, 1,
-1.393205, 1.611002, -1.390689, 1, 1, 1, 1, 1,
-1.389458, -1.58995, -3.483066, 1, 1, 1, 1, 1,
-1.386322, -0.8928851, -2.217691, 1, 1, 1, 1, 1,
-1.384709, 0.9970387, -1.321811, 1, 1, 1, 1, 1,
-1.360156, 0.299388, -0.4928797, 0, 0, 1, 1, 1,
-1.359967, -0.9707609, -1.764656, 1, 0, 0, 1, 1,
-1.352667, 1.679469, -0.9047412, 1, 0, 0, 1, 1,
-1.348802, -1.750217, -2.765436, 1, 0, 0, 1, 1,
-1.344728, 1.225146, -0.8823668, 1, 0, 0, 1, 1,
-1.339133, 1.926032, -1.309606, 1, 0, 0, 1, 1,
-1.33858, -0.9010524, -2.024033, 0, 0, 0, 1, 1,
-1.337759, -1.471628, -2.748638, 0, 0, 0, 1, 1,
-1.337698, 0.01622676, -2.206833, 0, 0, 0, 1, 1,
-1.326256, -1.070413, -0.5072569, 0, 0, 0, 1, 1,
-1.319837, -1.421664, -0.7360786, 0, 0, 0, 1, 1,
-1.318871, -2.437658, -2.658366, 0, 0, 0, 1, 1,
-1.318289, -1.389452, -1.818092, 0, 0, 0, 1, 1,
-1.314807, -0.9434636, -1.784675, 1, 1, 1, 1, 1,
-1.312644, -1.667979, -1.768158, 1, 1, 1, 1, 1,
-1.300426, 0.7435589, -0.04712303, 1, 1, 1, 1, 1,
-1.300175, 0.3075508, -0.7883125, 1, 1, 1, 1, 1,
-1.299798, -1.258561, -3.055191, 1, 1, 1, 1, 1,
-1.299716, 0.8567919, -2.33153, 1, 1, 1, 1, 1,
-1.296911, 0.1571729, -2.714896, 1, 1, 1, 1, 1,
-1.291782, 0.4801805, -0.6862773, 1, 1, 1, 1, 1,
-1.291164, 0.4471849, -0.6787493, 1, 1, 1, 1, 1,
-1.290377, 1.177377, -1.721515, 1, 1, 1, 1, 1,
-1.284446, -0.6466051, -2.095522, 1, 1, 1, 1, 1,
-1.282309, 0.128279, -0.4738388, 1, 1, 1, 1, 1,
-1.277887, -0.3000818, -1.543533, 1, 1, 1, 1, 1,
-1.270066, -0.3201089, -3.232675, 1, 1, 1, 1, 1,
-1.265369, 0.1118254, -1.88316, 1, 1, 1, 1, 1,
-1.260501, -0.1613174, -2.129988, 0, 0, 1, 1, 1,
-1.25215, -1.12811, -0.9171987, 1, 0, 0, 1, 1,
-1.251618, 1.860545, -0.3472567, 1, 0, 0, 1, 1,
-1.251024, -0.5374963, -1.689163, 1, 0, 0, 1, 1,
-1.247907, 0.6660392, 0.1271331, 1, 0, 0, 1, 1,
-1.243109, 0.2187958, -0.9489452, 1, 0, 0, 1, 1,
-1.235399, 0.3456307, -1.435084, 0, 0, 0, 1, 1,
-1.221872, -0.2492936, -1.165277, 0, 0, 0, 1, 1,
-1.21838, -0.8028766, -2.152392, 0, 0, 0, 1, 1,
-1.207495, 1.022178, -0.6635526, 0, 0, 0, 1, 1,
-1.205328, -0.8202005, -4.371746, 0, 0, 0, 1, 1,
-1.192688, 0.1194351, -2.137036, 0, 0, 0, 1, 1,
-1.18006, -0.3686236, -0.4397016, 0, 0, 0, 1, 1,
-1.178156, -0.6520921, -3.371165, 1, 1, 1, 1, 1,
-1.16915, 1.865476, -0.8318339, 1, 1, 1, 1, 1,
-1.168623, -1.161988, -2.690024, 1, 1, 1, 1, 1,
-1.165624, -0.2916313, -2.425911, 1, 1, 1, 1, 1,
-1.157062, -0.4104698, -1.358461, 1, 1, 1, 1, 1,
-1.154224, 0.9182318, -0.4140941, 1, 1, 1, 1, 1,
-1.129814, 0.2865109, -0.709246, 1, 1, 1, 1, 1,
-1.128864, -0.490184, -3.071896, 1, 1, 1, 1, 1,
-1.126833, -1.055422, -2.026289, 1, 1, 1, 1, 1,
-1.125081, 0.5763731, -0.4876943, 1, 1, 1, 1, 1,
-1.124015, -1.079904, -2.62006, 1, 1, 1, 1, 1,
-1.118406, 0.3554647, -1.538419, 1, 1, 1, 1, 1,
-1.110671, 0.1781693, -2.172537, 1, 1, 1, 1, 1,
-1.105175, -1.795783, -2.338245, 1, 1, 1, 1, 1,
-1.104104, -0.365459, -1.95132, 1, 1, 1, 1, 1,
-1.097121, 0.6868154, -0.8917444, 0, 0, 1, 1, 1,
-1.094455, -1.560114, -1.143629, 1, 0, 0, 1, 1,
-1.093197, 0.05729982, -1.88017, 1, 0, 0, 1, 1,
-1.089033, 0.2661931, -1.031953, 1, 0, 0, 1, 1,
-1.083855, -0.5417745, -1.869311, 1, 0, 0, 1, 1,
-1.070944, 0.6707309, -2.1493, 1, 0, 0, 1, 1,
-1.061573, -0.5858166, -1.873097, 0, 0, 0, 1, 1,
-1.059898, 0.4383099, -1.087241, 0, 0, 0, 1, 1,
-1.058834, -0.06175815, -2.72341, 0, 0, 0, 1, 1,
-1.054335, -1.844316, -2.320999, 0, 0, 0, 1, 1,
-1.052455, -0.364533, -3.094793, 0, 0, 0, 1, 1,
-1.047703, 0.3614176, -2.45386, 0, 0, 0, 1, 1,
-1.043573, -0.3742397, -1.986483, 0, 0, 0, 1, 1,
-1.038838, -1.301215, -1.672473, 1, 1, 1, 1, 1,
-1.03779, 0.604968, -0.2673882, 1, 1, 1, 1, 1,
-1.033424, -0.3169161, -0.1175211, 1, 1, 1, 1, 1,
-1.029502, -1.835318, -2.695715, 1, 1, 1, 1, 1,
-1.027483, -0.09570693, -2.162934, 1, 1, 1, 1, 1,
-1.026023, 0.2294643, -1.272015, 1, 1, 1, 1, 1,
-1.016277, 0.2376447, -1.455214, 1, 1, 1, 1, 1,
-1.006806, 1.020254, -1.232233, 1, 1, 1, 1, 1,
-1.006257, 0.02226385, -2.048609, 1, 1, 1, 1, 1,
-1.000517, -2.026095, -3.453807, 1, 1, 1, 1, 1,
-0.9944956, -1.111704, -1.818736, 1, 1, 1, 1, 1,
-0.9927471, -0.2109867, -1.351698, 1, 1, 1, 1, 1,
-0.9843509, 1.606235, -0.9933648, 1, 1, 1, 1, 1,
-0.9572264, 0.2287191, -2.430077, 1, 1, 1, 1, 1,
-0.9534929, 0.6163812, -0.4387472, 1, 1, 1, 1, 1,
-0.9526854, 0.7948089, -2.37153, 0, 0, 1, 1, 1,
-0.9480842, 0.04038229, -1.596798, 1, 0, 0, 1, 1,
-0.9325683, -1.284203, -2.978609, 1, 0, 0, 1, 1,
-0.9300641, -0.7052013, -2.488407, 1, 0, 0, 1, 1,
-0.9280303, 0.8134587, -0.6481937, 1, 0, 0, 1, 1,
-0.9278598, 0.3002102, -1.251513, 1, 0, 0, 1, 1,
-0.9270831, 0.3430821, -1.491182, 0, 0, 0, 1, 1,
-0.9235241, -1.194009, -2.891777, 0, 0, 0, 1, 1,
-0.9228089, -1.527652, -0.7530762, 0, 0, 0, 1, 1,
-0.9220209, 0.2456227, -2.113984, 0, 0, 0, 1, 1,
-0.9088089, -0.3077091, -4.552687, 0, 0, 0, 1, 1,
-0.9084789, 0.6719362, -0.0342967, 0, 0, 0, 1, 1,
-0.9081725, 0.004302516, -2.619071, 0, 0, 0, 1, 1,
-0.9057305, -0.5349965, -3.259508, 1, 1, 1, 1, 1,
-0.9004792, -0.2979746, -1.893187, 1, 1, 1, 1, 1,
-0.9000309, -1.993784, -2.587049, 1, 1, 1, 1, 1,
-0.8995755, 0.2990545, -0.05907016, 1, 1, 1, 1, 1,
-0.8967846, -0.3489798, -2.197403, 1, 1, 1, 1, 1,
-0.8935643, -0.5800671, -2.66712, 1, 1, 1, 1, 1,
-0.8933285, -0.4203517, -1.462924, 1, 1, 1, 1, 1,
-0.8847546, 0.1177586, 0.08967644, 1, 1, 1, 1, 1,
-0.8834218, 1.07682, -0.4272387, 1, 1, 1, 1, 1,
-0.8783292, 0.9536262, -1.515515, 1, 1, 1, 1, 1,
-0.8778066, 0.4994171, -1.917326, 1, 1, 1, 1, 1,
-0.8739769, 1.786224, -0.02052402, 1, 1, 1, 1, 1,
-0.8726804, 0.8810226, -1.413208, 1, 1, 1, 1, 1,
-0.8671964, 1.28781, -2.027718, 1, 1, 1, 1, 1,
-0.8650765, 1.035568, -0.5168382, 1, 1, 1, 1, 1,
-0.8602954, 0.554323, 0.1414991, 0, 0, 1, 1, 1,
-0.8595651, 0.08186416, -2.444815, 1, 0, 0, 1, 1,
-0.8574901, -2.045906, -3.548271, 1, 0, 0, 1, 1,
-0.8554987, -0.4316495, -1.307243, 1, 0, 0, 1, 1,
-0.8522571, 0.8521699, -2.568197, 1, 0, 0, 1, 1,
-0.8458084, 0.210064, -0.09237464, 1, 0, 0, 1, 1,
-0.8455425, -0.5680272, -1.135285, 0, 0, 0, 1, 1,
-0.8402606, -0.5461782, -1.738688, 0, 0, 0, 1, 1,
-0.8393051, 1.117961, -0.1056422, 0, 0, 0, 1, 1,
-0.8318228, -0.471487, -1.99292, 0, 0, 0, 1, 1,
-0.8277332, -0.9780773, -1.292088, 0, 0, 0, 1, 1,
-0.8202929, -0.6635526, -2.254701, 0, 0, 0, 1, 1,
-0.8160239, 0.1362974, -0.1227154, 0, 0, 0, 1, 1,
-0.8144202, 0.7021654, -0.1675509, 1, 1, 1, 1, 1,
-0.8048887, 1.311954, -0.07149588, 1, 1, 1, 1, 1,
-0.7993312, -1.599603, -2.293054, 1, 1, 1, 1, 1,
-0.7993022, 2.493883, 1.18336, 1, 1, 1, 1, 1,
-0.7986776, -0.04819348, -0.8018814, 1, 1, 1, 1, 1,
-0.7918009, 0.6268007, -0.1416212, 1, 1, 1, 1, 1,
-0.7866197, 1.080021, -1.748959, 1, 1, 1, 1, 1,
-0.7862066, 0.8221353, 0.2211173, 1, 1, 1, 1, 1,
-0.7861974, 0.5400163, -2.847953, 1, 1, 1, 1, 1,
-0.7840374, 0.4101085, -1.713244, 1, 1, 1, 1, 1,
-0.7817345, -0.1024765, -3.052788, 1, 1, 1, 1, 1,
-0.7791005, -0.3565983, -3.338155, 1, 1, 1, 1, 1,
-0.7757673, -1.087374, -3.205958, 1, 1, 1, 1, 1,
-0.7706916, 0.9509627, -0.8385949, 1, 1, 1, 1, 1,
-0.7651507, 0.502814, -2.407455, 1, 1, 1, 1, 1,
-0.7626088, 2.428618, 0.05057331, 0, 0, 1, 1, 1,
-0.7528051, 0.1970836, -1.846858, 1, 0, 0, 1, 1,
-0.7502141, 1.013752, -1.783024, 1, 0, 0, 1, 1,
-0.7446285, -0.4959763, -2.240587, 1, 0, 0, 1, 1,
-0.7380733, 1.430857, 0.04018103, 1, 0, 0, 1, 1,
-0.7303059, -1.746781, -2.201785, 1, 0, 0, 1, 1,
-0.7285545, -0.9079687, -1.35692, 0, 0, 0, 1, 1,
-0.7285062, -1.295747, -2.92603, 0, 0, 0, 1, 1,
-0.7210659, -0.6003087, -1.813829, 0, 0, 0, 1, 1,
-0.719322, 0.963272, 0.06992007, 0, 0, 0, 1, 1,
-0.7089368, -0.9276005, -2.68077, 0, 0, 0, 1, 1,
-0.7084333, -0.08724201, -2.95179, 0, 0, 0, 1, 1,
-0.706862, 0.818336, -1.043679, 0, 0, 0, 1, 1,
-0.70634, -0.9333692, -2.147681, 1, 1, 1, 1, 1,
-0.6983512, -0.1518223, 0.08872388, 1, 1, 1, 1, 1,
-0.6928151, -0.4797071, -2.765368, 1, 1, 1, 1, 1,
-0.6924014, -1.384898, -2.387914, 1, 1, 1, 1, 1,
-0.6873127, 2.020227, -2.292435, 1, 1, 1, 1, 1,
-0.6799026, -1.693882, -3.190829, 1, 1, 1, 1, 1,
-0.6783662, 0.2906468, -2.736313, 1, 1, 1, 1, 1,
-0.6782894, 0.6890761, -1.298797, 1, 1, 1, 1, 1,
-0.6753621, 1.947003, -0.3452936, 1, 1, 1, 1, 1,
-0.6749762, 1.248461, 0.6932339, 1, 1, 1, 1, 1,
-0.667685, -1.627938, -0.8130279, 1, 1, 1, 1, 1,
-0.6676374, -0.005557624, -3.927577, 1, 1, 1, 1, 1,
-0.6672752, 0.1521444, -1.38781, 1, 1, 1, 1, 1,
-0.6641136, -1.061561, -1.948689, 1, 1, 1, 1, 1,
-0.6609477, 0.1502053, -0.8330771, 1, 1, 1, 1, 1,
-0.6598179, -0.1965085, -2.968577, 0, 0, 1, 1, 1,
-0.6573266, -1.113575, -1.826849, 1, 0, 0, 1, 1,
-0.65689, -0.2263902, -1.262709, 1, 0, 0, 1, 1,
-0.6520184, -1.187826, -3.930398, 1, 0, 0, 1, 1,
-0.6468546, 0.5782014, 0.04322805, 1, 0, 0, 1, 1,
-0.6459045, 0.7107462, -0.1671659, 1, 0, 0, 1, 1,
-0.6414772, -0.741235, -3.641083, 0, 0, 0, 1, 1,
-0.6325524, -1.180376, -2.118081, 0, 0, 0, 1, 1,
-0.6322865, 1.401498, 0.8810831, 0, 0, 0, 1, 1,
-0.6233193, -1.209019, -4.438339, 0, 0, 0, 1, 1,
-0.6203615, -1.198002, -1.991, 0, 0, 0, 1, 1,
-0.6201944, -0.5241262, -1.006042, 0, 0, 0, 1, 1,
-0.6194761, -0.0451131, 0.1999172, 0, 0, 0, 1, 1,
-0.6193241, -0.6326723, -3.276793, 1, 1, 1, 1, 1,
-0.6175717, -0.8398206, -2.243085, 1, 1, 1, 1, 1,
-0.6111159, -0.3345025, -1.3635, 1, 1, 1, 1, 1,
-0.6080867, -0.6621458, -0.876989, 1, 1, 1, 1, 1,
-0.604764, 0.5529751, 0.4644787, 1, 1, 1, 1, 1,
-0.6028619, 0.06548686, -1.446373, 1, 1, 1, 1, 1,
-0.598253, -0.5460238, -3.681906, 1, 1, 1, 1, 1,
-0.5950315, 1.347848, 0.5372655, 1, 1, 1, 1, 1,
-0.5939606, 0.3564094, -1.783614, 1, 1, 1, 1, 1,
-0.5913869, -0.7339788, -2.87677, 1, 1, 1, 1, 1,
-0.5839188, 0.6595846, -0.04079939, 1, 1, 1, 1, 1,
-0.5752897, 0.343693, -2.797436, 1, 1, 1, 1, 1,
-0.5744444, -0.5334079, -2.043196, 1, 1, 1, 1, 1,
-0.5666329, -0.1474013, -1.748253, 1, 1, 1, 1, 1,
-0.5648733, 1.41943, -0.5457992, 1, 1, 1, 1, 1,
-0.5643827, 1.075817, -0.07451269, 0, 0, 1, 1, 1,
-0.5643007, -0.6710158, -0.9975927, 1, 0, 0, 1, 1,
-0.5635583, 0.1197864, -1.817073, 1, 0, 0, 1, 1,
-0.5630271, 1.588844, -0.4191708, 1, 0, 0, 1, 1,
-0.5615904, -0.1283574, -3.24124, 1, 0, 0, 1, 1,
-0.5584229, -1.315993, -4.082458, 1, 0, 0, 1, 1,
-0.5583845, 1.628411, 0.4189125, 0, 0, 0, 1, 1,
-0.5540701, 0.5944775, -1.581053, 0, 0, 0, 1, 1,
-0.5466695, 0.4594583, -3.176705, 0, 0, 0, 1, 1,
-0.5461255, -0.586063, -4.272866, 0, 0, 0, 1, 1,
-0.5454001, 0.5883791, -0.4284615, 0, 0, 0, 1, 1,
-0.5370251, 0.4971228, -2.050096, 0, 0, 0, 1, 1,
-0.5348231, -0.05781234, -2.366492, 0, 0, 0, 1, 1,
-0.5307172, 0.8584646, -1.351182, 1, 1, 1, 1, 1,
-0.5286055, 0.2382357, -0.2837613, 1, 1, 1, 1, 1,
-0.528448, -1.312355, -2.356078, 1, 1, 1, 1, 1,
-0.5261955, 0.9372534, 0.03711421, 1, 1, 1, 1, 1,
-0.5186343, 0.5370423, -0.5066687, 1, 1, 1, 1, 1,
-0.5183047, -1.206207, -0.03864334, 1, 1, 1, 1, 1,
-0.5134695, 0.5487214, -0.4899071, 1, 1, 1, 1, 1,
-0.5115681, 1.588975, -1.210731, 1, 1, 1, 1, 1,
-0.5113893, -0.1546851, -3.296762, 1, 1, 1, 1, 1,
-0.5107816, -1.183756, -3.284676, 1, 1, 1, 1, 1,
-0.5093688, 0.05566198, -2.129711, 1, 1, 1, 1, 1,
-0.5086924, -0.2513891, -2.640365, 1, 1, 1, 1, 1,
-0.5030287, 0.2895575, 0.4303607, 1, 1, 1, 1, 1,
-0.496177, 0.6047045, -2.8668, 1, 1, 1, 1, 1,
-0.4949721, -0.5737832, -5.168565, 1, 1, 1, 1, 1,
-0.4919045, -0.5794739, -0.8401469, 0, 0, 1, 1, 1,
-0.4873689, -0.7869204, -2.629699, 1, 0, 0, 1, 1,
-0.4842077, 0.06495541, -1.0494, 1, 0, 0, 1, 1,
-0.4821454, 1.202233, -0.5399898, 1, 0, 0, 1, 1,
-0.4756748, 0.4893627, -0.9295245, 1, 0, 0, 1, 1,
-0.4752887, 0.9592574, 0.6731827, 1, 0, 0, 1, 1,
-0.4726903, 1.997949, -1.695285, 0, 0, 0, 1, 1,
-0.4647345, 0.7648911, -2.113691, 0, 0, 0, 1, 1,
-0.461363, 0.6216571, -1.746139, 0, 0, 0, 1, 1,
-0.4568499, 0.6127528, -1.862637, 0, 0, 0, 1, 1,
-0.4525753, 0.639771, -0.3068995, 0, 0, 0, 1, 1,
-0.4506197, -0.2074898, -3.215444, 0, 0, 0, 1, 1,
-0.4503452, -0.956754, -3.618574, 0, 0, 0, 1, 1,
-0.4453433, -0.107825, -0.00247893, 1, 1, 1, 1, 1,
-0.4445096, 0.6345052, -0.9517775, 1, 1, 1, 1, 1,
-0.4438681, -0.8542467, -2.464253, 1, 1, 1, 1, 1,
-0.4415635, -0.2972035, -3.603289, 1, 1, 1, 1, 1,
-0.437636, -0.5909457, -2.34872, 1, 1, 1, 1, 1,
-0.4371783, -2.610012, -3.349343, 1, 1, 1, 1, 1,
-0.4370732, -1.095691, -3.484124, 1, 1, 1, 1, 1,
-0.4370559, 0.2446029, 0.2210003, 1, 1, 1, 1, 1,
-0.43571, 0.01534821, -1.596453, 1, 1, 1, 1, 1,
-0.4339978, 0.7487056, -0.122243, 1, 1, 1, 1, 1,
-0.4228875, 0.5529286, -1.058473, 1, 1, 1, 1, 1,
-0.4216622, 2.001578, -1.645259, 1, 1, 1, 1, 1,
-0.4196536, -1.39025, -1.272957, 1, 1, 1, 1, 1,
-0.4177598, -0.9930991, -1.917399, 1, 1, 1, 1, 1,
-0.4130576, 1.629651, 0.5410894, 1, 1, 1, 1, 1,
-0.409272, -0.05702578, -1.268904, 0, 0, 1, 1, 1,
-0.4078671, -0.4857365, -3.787331, 1, 0, 0, 1, 1,
-0.3951128, -0.9855717, -2.323673, 1, 0, 0, 1, 1,
-0.3931167, 1.824169, -1.196147, 1, 0, 0, 1, 1,
-0.3901297, -1.246478, -2.590236, 1, 0, 0, 1, 1,
-0.3852446, -0.723646, -3.305444, 1, 0, 0, 1, 1,
-0.3803829, 2.300399, -0.6240851, 0, 0, 0, 1, 1,
-0.377569, -0.3614514, -0.7231843, 0, 0, 0, 1, 1,
-0.3760805, 0.8976356, 1.093324, 0, 0, 0, 1, 1,
-0.3757842, -0.9165876, -3.238835, 0, 0, 0, 1, 1,
-0.3696346, -1.473338, -2.886489, 0, 0, 0, 1, 1,
-0.3643393, 0.7410101, -0.0849127, 0, 0, 0, 1, 1,
-0.3562035, -1.225812, -0.6105071, 0, 0, 0, 1, 1,
-0.3487814, -0.7666039, -2.376788, 1, 1, 1, 1, 1,
-0.3445149, -1.381498, -3.954758, 1, 1, 1, 1, 1,
-0.3428255, -0.08128673, -2.085095, 1, 1, 1, 1, 1,
-0.3425682, 0.344895, -2.270038, 1, 1, 1, 1, 1,
-0.3418213, 0.111011, -1.471878, 1, 1, 1, 1, 1,
-0.3377409, -2.424966, -3.299656, 1, 1, 1, 1, 1,
-0.3363353, -0.4956415, -0.5537673, 1, 1, 1, 1, 1,
-0.3340288, 0.7342593, -0.5358507, 1, 1, 1, 1, 1,
-0.3165177, 0.6798999, -0.4261922, 1, 1, 1, 1, 1,
-0.3112507, 1.508566, 0.06527892, 1, 1, 1, 1, 1,
-0.3104061, 0.9905956, 1.249235, 1, 1, 1, 1, 1,
-0.3039154, -1.475307, -3.098775, 1, 1, 1, 1, 1,
-0.3023991, 0.4399508, -1.261526, 1, 1, 1, 1, 1,
-0.3019014, 1.204092, 0.1801383, 1, 1, 1, 1, 1,
-0.2983249, -0.224318, -1.899857, 1, 1, 1, 1, 1,
-0.296801, -1.489928, -1.970369, 0, 0, 1, 1, 1,
-0.2931432, -0.4036013, -2.173442, 1, 0, 0, 1, 1,
-0.2871057, 0.4275463, -0.9582686, 1, 0, 0, 1, 1,
-0.2852091, 0.9839999, 0.5584478, 1, 0, 0, 1, 1,
-0.283012, 1.01554, -0.5885581, 1, 0, 0, 1, 1,
-0.2733033, 0.3030072, -0.2330291, 1, 0, 0, 1, 1,
-0.2726544, 0.07102096, -2.243716, 0, 0, 0, 1, 1,
-0.2724701, -0.6776773, -2.779909, 0, 0, 0, 1, 1,
-0.2714418, -0.5820342, -0.6717223, 0, 0, 0, 1, 1,
-0.2695393, 0.4608249, -1.208844, 0, 0, 0, 1, 1,
-0.2676992, 0.3320174, 0.1839648, 0, 0, 0, 1, 1,
-0.2621823, -0.08937205, -1.349125, 0, 0, 0, 1, 1,
-0.2593713, -0.7682391, -3.908933, 0, 0, 0, 1, 1,
-0.2564583, -0.03606491, -0.3521906, 1, 1, 1, 1, 1,
-0.2545286, 0.1939419, -0.8070448, 1, 1, 1, 1, 1,
-0.2497157, -0.2016852, -3.45, 1, 1, 1, 1, 1,
-0.2443396, -0.3318665, -2.047348, 1, 1, 1, 1, 1,
-0.2437824, -0.177915, -2.571227, 1, 1, 1, 1, 1,
-0.2434062, -1.443668, -2.832023, 1, 1, 1, 1, 1,
-0.2427616, 0.1165647, -2.627261, 1, 1, 1, 1, 1,
-0.2408947, 0.7358745, -0.09562813, 1, 1, 1, 1, 1,
-0.2338327, -0.1803757, -1.993196, 1, 1, 1, 1, 1,
-0.2321587, -1.094355, -1.760744, 1, 1, 1, 1, 1,
-0.2256037, 0.3917905, -0.06141333, 1, 1, 1, 1, 1,
-0.2235558, 1.129249, 1.647892, 1, 1, 1, 1, 1,
-0.2204617, -1.622884, -1.844556, 1, 1, 1, 1, 1,
-0.2139777, 0.1612591, -0.740094, 1, 1, 1, 1, 1,
-0.2132992, -0.3891172, -1.718466, 1, 1, 1, 1, 1,
-0.2130594, 0.1049735, -2.161236, 0, 0, 1, 1, 1,
-0.2119727, 0.3770738, 0.5680959, 1, 0, 0, 1, 1,
-0.2114819, 0.0879304, -1.302834, 1, 0, 0, 1, 1,
-0.2078626, -0.9637291, -3.961484, 1, 0, 0, 1, 1,
-0.2076721, -0.2329541, -5.329939, 1, 0, 0, 1, 1,
-0.2067461, 0.1987577, -1.729564, 1, 0, 0, 1, 1,
-0.2066035, 0.4332518, 0.5385778, 0, 0, 0, 1, 1,
-0.206013, 0.8235466, -0.3950258, 0, 0, 0, 1, 1,
-0.2039558, -2.243396, -4.751371, 0, 0, 0, 1, 1,
-0.2004457, 1.363615, -0.4258059, 0, 0, 0, 1, 1,
-0.2000412, 0.5789956, -2.259063, 0, 0, 0, 1, 1,
-0.1995311, -0.6664549, -1.177218, 0, 0, 0, 1, 1,
-0.1957983, -0.5479659, -1.082677, 0, 0, 0, 1, 1,
-0.1898611, -0.9909773, -3.467568, 1, 1, 1, 1, 1,
-0.1898389, -0.1735386, -3.356723, 1, 1, 1, 1, 1,
-0.1859682, 0.3588917, -0.8958178, 1, 1, 1, 1, 1,
-0.1851057, -0.7256454, -3.139733, 1, 1, 1, 1, 1,
-0.1843478, 1.548248, -1.531732, 1, 1, 1, 1, 1,
-0.1830607, 0.3397265, -0.1115086, 1, 1, 1, 1, 1,
-0.1804309, 0.2883674, 0.3522426, 1, 1, 1, 1, 1,
-0.1754109, 2.098905, -0.5764228, 1, 1, 1, 1, 1,
-0.1726197, -1.054781, -2.959991, 1, 1, 1, 1, 1,
-0.1712466, 0.2074886, -2.933299, 1, 1, 1, 1, 1,
-0.1692521, -0.4721384, -2.602065, 1, 1, 1, 1, 1,
-0.1669242, -0.1187486, -1.282316, 1, 1, 1, 1, 1,
-0.1668488, 1.349343, -0.9814637, 1, 1, 1, 1, 1,
-0.1654629, -0.3623054, -4.081253, 1, 1, 1, 1, 1,
-0.1644401, 0.4269393, -1.182068, 1, 1, 1, 1, 1,
-0.1536257, 0.107045, -0.1177496, 0, 0, 1, 1, 1,
-0.1511411, 0.6519516, 1.496114, 1, 0, 0, 1, 1,
-0.149267, 0.1231103, -0.636292, 1, 0, 0, 1, 1,
-0.1455564, -1.123333, -2.836872, 1, 0, 0, 1, 1,
-0.1451906, 0.1539199, -0.4959144, 1, 0, 0, 1, 1,
-0.1429694, -0.1463968, -4.106172, 1, 0, 0, 1, 1,
-0.1360676, -0.368035, -3.538155, 0, 0, 0, 1, 1,
-0.1358041, -1.088484, -2.766436, 0, 0, 0, 1, 1,
-0.1326237, -0.009901709, -2.760479, 0, 0, 0, 1, 1,
-0.1314613, -0.7411702, -3.647221, 0, 0, 0, 1, 1,
-0.1307997, -1.723686, -2.660859, 0, 0, 0, 1, 1,
-0.1253549, 0.01541847, -1.169381, 0, 0, 0, 1, 1,
-0.1235922, -0.8444064, -3.64195, 0, 0, 0, 1, 1,
-0.1234903, 0.4724009, 0.6562341, 1, 1, 1, 1, 1,
-0.121242, 1.749407, -0.388845, 1, 1, 1, 1, 1,
-0.1188655, 0.9922172, -0.9479601, 1, 1, 1, 1, 1,
-0.115273, 0.4989482, -0.1980476, 1, 1, 1, 1, 1,
-0.1111295, 0.9846708, 0.1262376, 1, 1, 1, 1, 1,
-0.1101408, -0.7358059, -4.061261, 1, 1, 1, 1, 1,
-0.1082893, -0.5617826, -2.922971, 1, 1, 1, 1, 1,
-0.1036963, 1.513047, 1.132198, 1, 1, 1, 1, 1,
-0.1004968, 0.9608437, 0.1396344, 1, 1, 1, 1, 1,
-0.1000376, -0.3943544, -2.823707, 1, 1, 1, 1, 1,
-0.09538854, 0.02549238, -1.819642, 1, 1, 1, 1, 1,
-0.09511692, 1.020229, 0.5736799, 1, 1, 1, 1, 1,
-0.09474427, -0.7283584, -1.342212, 1, 1, 1, 1, 1,
-0.0913412, -1.130024, -3.898599, 1, 1, 1, 1, 1,
-0.09079833, -0.5701532, -2.364182, 1, 1, 1, 1, 1,
-0.08899732, -0.7591275, -1.676115, 0, 0, 1, 1, 1,
-0.08774909, 0.7098879, 0.04286481, 1, 0, 0, 1, 1,
-0.08638501, -0.3728487, -1.952026, 1, 0, 0, 1, 1,
-0.08496826, -1.972135, -3.738632, 1, 0, 0, 1, 1,
-0.08280876, -0.6194386, -3.389538, 1, 0, 0, 1, 1,
-0.08204055, 0.3208113, -0.4823454, 1, 0, 0, 1, 1,
-0.08039246, 1.134161, -0.1780474, 0, 0, 0, 1, 1,
-0.07884713, 0.5229331, -0.09134381, 0, 0, 0, 1, 1,
-0.07841988, -1.241861, -2.094886, 0, 0, 0, 1, 1,
-0.07706586, -0.07687669, -2.523697, 0, 0, 0, 1, 1,
-0.07353652, -1.689521, -2.111243, 0, 0, 0, 1, 1,
-0.07318996, 0.487622, 0.6930196, 0, 0, 0, 1, 1,
-0.0654406, 0.6577916, 1.194383, 0, 0, 0, 1, 1,
-0.06498221, -1.172081, -2.734449, 1, 1, 1, 1, 1,
-0.06271276, 0.4803685, -0.02790659, 1, 1, 1, 1, 1,
-0.0597628, 0.007878961, -0.7030616, 1, 1, 1, 1, 1,
-0.05844829, -0.6060568, -3.831243, 1, 1, 1, 1, 1,
-0.05745767, 0.9506851, 0.8215582, 1, 1, 1, 1, 1,
-0.05506327, 0.9881083, -1.453925, 1, 1, 1, 1, 1,
-0.05400248, -1.681774, -1.739365, 1, 1, 1, 1, 1,
-0.04982657, -0.3238435, -3.157243, 1, 1, 1, 1, 1,
-0.0443128, 0.5971057, 0.4585671, 1, 1, 1, 1, 1,
-0.04385522, -0.6103684, -2.277856, 1, 1, 1, 1, 1,
-0.03862392, 0.3302521, -0.4890364, 1, 1, 1, 1, 1,
-0.03550819, -0.4817524, -2.253353, 1, 1, 1, 1, 1,
-0.0345533, -0.831198, -3.05656, 1, 1, 1, 1, 1,
-0.03407959, -0.303455, -2.454049, 1, 1, 1, 1, 1,
-0.03237541, -0.7320117, -3.131638, 1, 1, 1, 1, 1,
-0.03001244, -1.058806, -1.692538, 0, 0, 1, 1, 1,
-0.02402606, 0.2268234, 0.5222277, 1, 0, 0, 1, 1,
-0.0230015, 1.557366, -1.500765, 1, 0, 0, 1, 1,
-0.02240518, -0.3699145, -0.816557, 1, 0, 0, 1, 1,
-0.0217683, -0.1189876, -2.882197, 1, 0, 0, 1, 1,
-0.02132627, -1.449209, -3.080099, 1, 0, 0, 1, 1,
-0.01956975, 0.02395223, -0.3757808, 0, 0, 0, 1, 1,
-0.01665629, -0.9239333, -1.027785, 0, 0, 0, 1, 1,
-0.01275339, 0.4102935, 0.7534154, 0, 0, 0, 1, 1,
-0.00613049, 0.4822847, -0.2317501, 0, 0, 0, 1, 1,
-0.002464853, -0.7939342, -3.355662, 0, 0, 0, 1, 1,
-0.001261061, -0.7707683, -1.506024, 0, 0, 0, 1, 1,
0.0002842878, -2.925982, 5.066049, 0, 0, 0, 1, 1,
0.003459816, -0.2372815, 5.783905, 1, 1, 1, 1, 1,
0.003908065, -0.4062204, 3.182963, 1, 1, 1, 1, 1,
0.005713158, -0.1116027, 4.107651, 1, 1, 1, 1, 1,
0.006521231, -0.2513779, 2.582362, 1, 1, 1, 1, 1,
0.009136047, 0.7621533, 0.3065675, 1, 1, 1, 1, 1,
0.00987216, 0.3234062, -0.2295398, 1, 1, 1, 1, 1,
0.01169171, -0.5936108, 4.45455, 1, 1, 1, 1, 1,
0.01474562, 0.7421677, 0.5487983, 1, 1, 1, 1, 1,
0.01624263, -1.50857, 3.526624, 1, 1, 1, 1, 1,
0.02017807, 0.9378296, -1.458628, 1, 1, 1, 1, 1,
0.02066684, -1.976386, 4.781179, 1, 1, 1, 1, 1,
0.02073144, -1.066023, 4.382016, 1, 1, 1, 1, 1,
0.02133787, 0.8202406, -2.068876, 1, 1, 1, 1, 1,
0.02156511, -0.4067298, 2.422612, 1, 1, 1, 1, 1,
0.02518588, 2.265454, -1.002358, 1, 1, 1, 1, 1,
0.026958, -0.2132008, 3.849459, 0, 0, 1, 1, 1,
0.03153088, 1.129374, -0.05295793, 1, 0, 0, 1, 1,
0.03159826, 0.1352178, -0.7357122, 1, 0, 0, 1, 1,
0.032268, 0.2505084, 1.000239, 1, 0, 0, 1, 1,
0.03290889, -0.3631239, 2.600877, 1, 0, 0, 1, 1,
0.03315809, -0.005853168, 0.7652657, 1, 0, 0, 1, 1,
0.03587123, 0.6937218, 1.099735, 0, 0, 0, 1, 1,
0.0402265, -1.221369, 2.42569, 0, 0, 0, 1, 1,
0.04046527, 0.9060777, 0.2565083, 0, 0, 0, 1, 1,
0.0446818, 3.026308, -0.2669454, 0, 0, 0, 1, 1,
0.04565481, -0.4184017, 3.550783, 0, 0, 0, 1, 1,
0.04710126, -1.141088, 3.004871, 0, 0, 0, 1, 1,
0.04830946, -0.2409769, 2.031415, 0, 0, 0, 1, 1,
0.05081177, 0.269106, 1.742898, 1, 1, 1, 1, 1,
0.05236823, 0.006161193, 1.105014, 1, 1, 1, 1, 1,
0.05458489, 0.6880999, -0.5326154, 1, 1, 1, 1, 1,
0.05957624, 0.7556416, 0.8376265, 1, 1, 1, 1, 1,
0.06402696, -0.3249957, 4.747149, 1, 1, 1, 1, 1,
0.06989708, 0.5746668, 1.147076, 1, 1, 1, 1, 1,
0.0710163, 1.053101, 1.697262, 1, 1, 1, 1, 1,
0.0719805, -0.3771856, 3.382408, 1, 1, 1, 1, 1,
0.07260173, 0.5428258, 0.6095928, 1, 1, 1, 1, 1,
0.07530271, -0.04335616, 2.297522, 1, 1, 1, 1, 1,
0.07690042, 0.8448889, -0.8795547, 1, 1, 1, 1, 1,
0.07971747, -0.1414232, 2.457638, 1, 1, 1, 1, 1,
0.08250825, -0.469839, 2.436917, 1, 1, 1, 1, 1,
0.08280664, -1.256169, 3.940133, 1, 1, 1, 1, 1,
0.08330805, -0.2267546, 2.74379, 1, 1, 1, 1, 1,
0.08529117, 0.7220486, -0.3193126, 0, 0, 1, 1, 1,
0.09038384, 1.490823, -0.9846787, 1, 0, 0, 1, 1,
0.09605661, 0.5139487, -0.1323081, 1, 0, 0, 1, 1,
0.1094593, 0.8767884, 1.233569, 1, 0, 0, 1, 1,
0.1118099, 0.2853872, 0.4803089, 1, 0, 0, 1, 1,
0.1162077, -0.2145009, 3.0666, 1, 0, 0, 1, 1,
0.1183119, -0.9619235, 3.200412, 0, 0, 0, 1, 1,
0.1213314, 0.1133822, 1.338125, 0, 0, 0, 1, 1,
0.1357938, -0.5128065, 2.459121, 0, 0, 0, 1, 1,
0.1361311, 0.07556865, 1.187559, 0, 0, 0, 1, 1,
0.1361852, 0.1228186, -0.02470864, 0, 0, 0, 1, 1,
0.1375087, 0.1372531, 1.336457, 0, 0, 0, 1, 1,
0.1424969, -0.3567637, 2.573277, 0, 0, 0, 1, 1,
0.1456898, 0.4291413, 1.234074, 1, 1, 1, 1, 1,
0.1473849, -0.2778471, 2.571289, 1, 1, 1, 1, 1,
0.1493076, -0.8292025, 2.986339, 1, 1, 1, 1, 1,
0.1504299, 0.1125405, 0.192913, 1, 1, 1, 1, 1,
0.1517706, -1.588757, 3.750243, 1, 1, 1, 1, 1,
0.1611206, 0.07138583, 1.405568, 1, 1, 1, 1, 1,
0.1625889, -0.3277597, 0.9086436, 1, 1, 1, 1, 1,
0.1634236, 0.55192, -0.6542767, 1, 1, 1, 1, 1,
0.1647993, 1.126869, -0.04246029, 1, 1, 1, 1, 1,
0.1653651, -1.670138, 3.212497, 1, 1, 1, 1, 1,
0.1686327, 0.3591945, 2.230315, 1, 1, 1, 1, 1,
0.1692476, 0.6200924, -0.9272815, 1, 1, 1, 1, 1,
0.1740474, 0.009538194, 1.119058, 1, 1, 1, 1, 1,
0.1798023, 1.035346, -0.05617258, 1, 1, 1, 1, 1,
0.1806234, 0.481906, 1.374448, 1, 1, 1, 1, 1,
0.1841061, 0.5681663, 0.2452921, 0, 0, 1, 1, 1,
0.1903036, -1.645124, 3.585783, 1, 0, 0, 1, 1,
0.1928015, -0.8487393, 2.423794, 1, 0, 0, 1, 1,
0.1958832, -1.200612, 3.337988, 1, 0, 0, 1, 1,
0.1965909, 2.042844, 0.5009206, 1, 0, 0, 1, 1,
0.1970161, 0.7371833, 1.429451, 1, 0, 0, 1, 1,
0.202875, -0.3982547, 3.620168, 0, 0, 0, 1, 1,
0.2039669, 1.649148, -0.90979, 0, 0, 0, 1, 1,
0.2046543, -1.352043, 4.742774, 0, 0, 0, 1, 1,
0.2073132, 0.3601874, 1.802556, 0, 0, 0, 1, 1,
0.2078409, 0.09457642, -0.6830039, 0, 0, 0, 1, 1,
0.2124644, -0.4023922, 1.993739, 0, 0, 0, 1, 1,
0.2133905, 0.8899465, -1.500934, 0, 0, 0, 1, 1,
0.2143372, 0.1538576, 1.159303, 1, 1, 1, 1, 1,
0.2149974, -0.7709822, 3.845744, 1, 1, 1, 1, 1,
0.2165876, -0.4623345, 1.240662, 1, 1, 1, 1, 1,
0.2172675, 1.472214, -0.2691359, 1, 1, 1, 1, 1,
0.2193976, 0.1863412, 1.402644, 1, 1, 1, 1, 1,
0.2242698, -1.229842, 3.179302, 1, 1, 1, 1, 1,
0.2250512, -0.7174096, 1.770572, 1, 1, 1, 1, 1,
0.2297992, -0.6511907, 0.246757, 1, 1, 1, 1, 1,
0.2298969, -0.3867875, 1.253, 1, 1, 1, 1, 1,
0.2302511, -0.4410943, 4.327291, 1, 1, 1, 1, 1,
0.2346341, -0.7037045, 4.091375, 1, 1, 1, 1, 1,
0.2349158, -1.452522, 1.117596, 1, 1, 1, 1, 1,
0.2361276, 1.98722, 1.008191, 1, 1, 1, 1, 1,
0.237516, -0.8990173, 1.89588, 1, 1, 1, 1, 1,
0.2411581, 0.1931535, 1.189997, 1, 1, 1, 1, 1,
0.2436057, 1.833318, -0.4428848, 0, 0, 1, 1, 1,
0.2537344, -0.4223995, 3.818668, 1, 0, 0, 1, 1,
0.256044, 0.5496357, -0.2759106, 1, 0, 0, 1, 1,
0.2568363, -0.1567231, 2.044748, 1, 0, 0, 1, 1,
0.2569357, 0.1987208, 0.06238805, 1, 0, 0, 1, 1,
0.2590042, 0.3026991, -0.09947717, 1, 0, 0, 1, 1,
0.2603608, -0.4987054, 3.043624, 0, 0, 0, 1, 1,
0.2614868, -0.1460142, 1.778267, 0, 0, 0, 1, 1,
0.2624521, 0.1160362, 0.9305102, 0, 0, 0, 1, 1,
0.2661177, 0.5037925, 2.467407, 0, 0, 0, 1, 1,
0.2676565, 2.290988, 1.645016, 0, 0, 0, 1, 1,
0.2680132, 0.1734515, 0.5378127, 0, 0, 0, 1, 1,
0.2685031, -0.02865245, -0.4554752, 0, 0, 0, 1, 1,
0.2718542, -1.067127, 1.484146, 1, 1, 1, 1, 1,
0.2726524, 0.1832327, 1.977195, 1, 1, 1, 1, 1,
0.2818803, 1.154819, 0.7255225, 1, 1, 1, 1, 1,
0.2862847, -0.8430336, 2.778432, 1, 1, 1, 1, 1,
0.2936724, -0.7400088, 1.514925, 1, 1, 1, 1, 1,
0.2968356, -0.9025318, 2.896875, 1, 1, 1, 1, 1,
0.3016212, -1.363648, 3.313008, 1, 1, 1, 1, 1,
0.3024521, 0.1692824, 2.016049, 1, 1, 1, 1, 1,
0.3026176, -0.001298836, 3.127308, 1, 1, 1, 1, 1,
0.3036691, -0.7620648, 3.111031, 1, 1, 1, 1, 1,
0.3046161, -0.6034506, 2.000393, 1, 1, 1, 1, 1,
0.3060781, -0.04794045, 1.936693, 1, 1, 1, 1, 1,
0.3169625, -0.4734826, 2.747444, 1, 1, 1, 1, 1,
0.3193739, 1.423755, -0.8934144, 1, 1, 1, 1, 1,
0.3207414, 0.6159746, 0.1079484, 1, 1, 1, 1, 1,
0.3217413, 1.297361, 0.0369863, 0, 0, 1, 1, 1,
0.3223615, -1.396996, 2.020684, 1, 0, 0, 1, 1,
0.3229275, 0.117193, 1.525406, 1, 0, 0, 1, 1,
0.3315982, -0.2932438, 1.766955, 1, 0, 0, 1, 1,
0.3383946, 2.598512, 0.7226008, 1, 0, 0, 1, 1,
0.3398371, 0.8971483, 2.173702, 1, 0, 0, 1, 1,
0.3433174, 0.6725506, 0.4437547, 0, 0, 0, 1, 1,
0.3448663, 1.237155, 1.657225, 0, 0, 0, 1, 1,
0.345222, -2.088386, 4.401821, 0, 0, 0, 1, 1,
0.3452878, -0.961422, 2.111937, 0, 0, 0, 1, 1,
0.3484305, 0.2114208, 1.562618, 0, 0, 0, 1, 1,
0.3528911, 0.361477, -0.7318779, 0, 0, 0, 1, 1,
0.3533579, 0.5282419, 0.7595928, 0, 0, 0, 1, 1,
0.3588036, -1.247492, 0.7974609, 1, 1, 1, 1, 1,
0.3626408, 0.08736832, -0.5980736, 1, 1, 1, 1, 1,
0.3638938, 0.8178424, -0.335174, 1, 1, 1, 1, 1,
0.3647746, 0.2677312, 0.2932053, 1, 1, 1, 1, 1,
0.3661372, 0.7266716, 1.434151, 1, 1, 1, 1, 1,
0.3724238, -0.93126, 3.942571, 1, 1, 1, 1, 1,
0.373872, -0.7272005, 3.497699, 1, 1, 1, 1, 1,
0.3757079, 0.8397371, 0.01410918, 1, 1, 1, 1, 1,
0.3767035, -2.183861, 3.109165, 1, 1, 1, 1, 1,
0.3773963, -0.7533014, 0.8767967, 1, 1, 1, 1, 1,
0.3808601, 1.605051, -0.008603434, 1, 1, 1, 1, 1,
0.3809906, -0.7450211, 2.325613, 1, 1, 1, 1, 1,
0.3814062, 0.4928153, -0.6682333, 1, 1, 1, 1, 1,
0.3822474, 2.075339, -0.7415144, 1, 1, 1, 1, 1,
0.3835934, 1.940998, 0.1165666, 1, 1, 1, 1, 1,
0.3888295, -0.07315972, 2.369245, 0, 0, 1, 1, 1,
0.3979882, 0.7142135, -0.6605542, 1, 0, 0, 1, 1,
0.402522, 0.729885, 1.45845, 1, 0, 0, 1, 1,
0.4037357, -0.7213009, 1.8627, 1, 0, 0, 1, 1,
0.4053046, 0.1314798, 1.153221, 1, 0, 0, 1, 1,
0.4086678, 0.01476264, 3.366037, 1, 0, 0, 1, 1,
0.4090201, 0.4626376, 2.352625, 0, 0, 0, 1, 1,
0.4092431, 0.5910908, -0.02351866, 0, 0, 0, 1, 1,
0.4102631, 2.172526, 1.591368, 0, 0, 0, 1, 1,
0.4189196, 0.6510783, -0.1779626, 0, 0, 0, 1, 1,
0.4265344, -0.1758522, 2.723122, 0, 0, 0, 1, 1,
0.4292347, 0.3486356, -0.5942423, 0, 0, 0, 1, 1,
0.4297912, 1.13929, 1.107389, 0, 0, 0, 1, 1,
0.4309809, -0.5727819, 1.671857, 1, 1, 1, 1, 1,
0.431011, 0.9322529, 2.283678, 1, 1, 1, 1, 1,
0.4364191, -1.368723, 2.188209, 1, 1, 1, 1, 1,
0.4370118, -0.3387815, 2.902854, 1, 1, 1, 1, 1,
0.4391862, 0.5401962, 0.5687696, 1, 1, 1, 1, 1,
0.4511012, -1.600703, 2.797387, 1, 1, 1, 1, 1,
0.4515003, 0.105534, -1.853113, 1, 1, 1, 1, 1,
0.4588572, 0.04817233, -1.927866, 1, 1, 1, 1, 1,
0.4615276, 1.291754, 1.100114, 1, 1, 1, 1, 1,
0.4628728, 0.2667892, 2.324267, 1, 1, 1, 1, 1,
0.4713697, -1.959417, 3.361827, 1, 1, 1, 1, 1,
0.4760823, 1.148685, 1.227977, 1, 1, 1, 1, 1,
0.4777273, 0.4712065, -1.009543, 1, 1, 1, 1, 1,
0.480685, 0.8550969, 0.8991042, 1, 1, 1, 1, 1,
0.484834, -0.7124387, 1.671242, 1, 1, 1, 1, 1,
0.4865769, -0.1496913, 2.268663, 0, 0, 1, 1, 1,
0.4872193, -1.241228, 1.611598, 1, 0, 0, 1, 1,
0.4901074, -0.3187868, 1.510242, 1, 0, 0, 1, 1,
0.4930983, 0.7266904, 2.419486, 1, 0, 0, 1, 1,
0.4980789, 0.1072001, 0.8931541, 1, 0, 0, 1, 1,
0.5037547, -1.079892, 0.4309962, 1, 0, 0, 1, 1,
0.5066353, 1.769274, -1.121126, 0, 0, 0, 1, 1,
0.5081273, -0.6454836, 3.646834, 0, 0, 0, 1, 1,
0.5121018, 0.6191461, 1.140474, 0, 0, 0, 1, 1,
0.512848, 0.5988577, 1.70837, 0, 0, 0, 1, 1,
0.5164363, 0.03501603, 2.961208, 0, 0, 0, 1, 1,
0.5181838, -1.634412, 3.7651, 0, 0, 0, 1, 1,
0.527658, 0.2478857, 1.7036, 0, 0, 0, 1, 1,
0.529594, -0.3605514, 2.145389, 1, 1, 1, 1, 1,
0.5313064, 0.8771214, -1.444622, 1, 1, 1, 1, 1,
0.5391722, 0.04444828, 3.79029, 1, 1, 1, 1, 1,
0.540849, -0.3713008, 1.851824, 1, 1, 1, 1, 1,
0.5442287, 1.202579, 0.7115924, 1, 1, 1, 1, 1,
0.5466747, 0.48276, 0.7130185, 1, 1, 1, 1, 1,
0.5507898, 0.7561188, 2.540429, 1, 1, 1, 1, 1,
0.5571054, -1.247506, 1.750556, 1, 1, 1, 1, 1,
0.5590301, -0.2437728, 3.518285, 1, 1, 1, 1, 1,
0.562887, -1.82013, 3.611607, 1, 1, 1, 1, 1,
0.5670908, -0.2069957, 2.013468, 1, 1, 1, 1, 1,
0.5682126, -1.070067, 3.585705, 1, 1, 1, 1, 1,
0.5721542, -0.8897049, 3.090486, 1, 1, 1, 1, 1,
0.578972, 1.043134, 1.132793, 1, 1, 1, 1, 1,
0.5873402, -0.6161433, 3.170971, 1, 1, 1, 1, 1,
0.5895022, 1.134411, -1.027178, 0, 0, 1, 1, 1,
0.590929, 0.9961968, -0.1049204, 1, 0, 0, 1, 1,
0.5913126, -0.3318515, 2.966065, 1, 0, 0, 1, 1,
0.5950345, -1.320484, 3.960678, 1, 0, 0, 1, 1,
0.598479, 0.3982386, 1.102562, 1, 0, 0, 1, 1,
0.6013469, 0.199608, 2.667758, 1, 0, 0, 1, 1,
0.6040348, -0.01358934, 0.8426636, 0, 0, 0, 1, 1,
0.6048069, -0.5978249, 2.473617, 0, 0, 0, 1, 1,
0.6048115, -2.351887, 2.938745, 0, 0, 0, 1, 1,
0.60607, -0.7721806, 1.157411, 0, 0, 0, 1, 1,
0.6183453, 1.258539, 0.9620864, 0, 0, 0, 1, 1,
0.6212631, -1.471862, 1.570674, 0, 0, 0, 1, 1,
0.625421, -0.04531788, 0.1698753, 0, 0, 0, 1, 1,
0.6316779, 0.2283563, 2.665165, 1, 1, 1, 1, 1,
0.6398081, 1.44863, 1.437703, 1, 1, 1, 1, 1,
0.6445433, -0.05604099, 1.260785, 1, 1, 1, 1, 1,
0.6459991, -0.7438509, 2.526187, 1, 1, 1, 1, 1,
0.6492485, -1.383799, 3.275327, 1, 1, 1, 1, 1,
0.6512312, 0.6667587, -1.059715, 1, 1, 1, 1, 1,
0.6548415, -0.914276, 2.927152, 1, 1, 1, 1, 1,
0.6557773, 0.06553485, 0.5885366, 1, 1, 1, 1, 1,
0.6564868, 0.1401597, 0.1290641, 1, 1, 1, 1, 1,
0.6566387, 0.5847392, 1.016886, 1, 1, 1, 1, 1,
0.6637914, 0.3802153, 2.34662, 1, 1, 1, 1, 1,
0.6661063, -0.6788815, 1.777565, 1, 1, 1, 1, 1,
0.6668323, 0.2977451, 2.982194, 1, 1, 1, 1, 1,
0.6686099, 1.546173, 1.697055, 1, 1, 1, 1, 1,
0.6688827, 1.255068, 1.263872, 1, 1, 1, 1, 1,
0.6745911, 0.8827997, -0.7269804, 0, 0, 1, 1, 1,
0.6758262, -0.03592632, 2.377388, 1, 0, 0, 1, 1,
0.6758857, -1.550606, 1.450142, 1, 0, 0, 1, 1,
0.6764746, -0.1549429, 3.425119, 1, 0, 0, 1, 1,
0.6805465, 0.2750552, 2.872144, 1, 0, 0, 1, 1,
0.6811538, -0.1319468, 2.676233, 1, 0, 0, 1, 1,
0.6844338, -1.616151, 2.474998, 0, 0, 0, 1, 1,
0.6873831, 0.5604022, 1.691279, 0, 0, 0, 1, 1,
0.6914668, -0.3961566, 2.60482, 0, 0, 0, 1, 1,
0.6927332, 0.589491, 1.988739, 0, 0, 0, 1, 1,
0.6929035, 0.3649845, 2.121704, 0, 0, 0, 1, 1,
0.6929237, 0.181854, 0.5409012, 0, 0, 0, 1, 1,
0.698791, -0.9596986, 1.547354, 0, 0, 0, 1, 1,
0.7021908, 0.3190434, 1.701125, 1, 1, 1, 1, 1,
0.7024362, 0.04914608, 1.874078, 1, 1, 1, 1, 1,
0.7027306, -0.1831761, 2.364619, 1, 1, 1, 1, 1,
0.7036214, 0.8713891, 0.1311772, 1, 1, 1, 1, 1,
0.7039471, 1.784629, -0.2427405, 1, 1, 1, 1, 1,
0.7084977, -0.8155067, 2.982033, 1, 1, 1, 1, 1,
0.7179188, 2.281081, -0.3108031, 1, 1, 1, 1, 1,
0.719077, 1.380041, 0.1967987, 1, 1, 1, 1, 1,
0.7198949, -1.925941, 3.759621, 1, 1, 1, 1, 1,
0.7208169, -0.02596393, 3.089822, 1, 1, 1, 1, 1,
0.7208868, -0.7254588, 2.011582, 1, 1, 1, 1, 1,
0.7214531, -0.7079157, 3.783828, 1, 1, 1, 1, 1,
0.7227491, -0.2861488, 4.018599, 1, 1, 1, 1, 1,
0.7263846, -0.452088, 2.422411, 1, 1, 1, 1, 1,
0.7296601, -1.247748, 3.70487, 1, 1, 1, 1, 1,
0.730911, 0.915167, 1.028119, 0, 0, 1, 1, 1,
0.7324026, 1.270838, -0.4209411, 1, 0, 0, 1, 1,
0.7371425, -1.173107, 1.711421, 1, 0, 0, 1, 1,
0.7372684, -0.1183241, 3.194136, 1, 0, 0, 1, 1,
0.7385222, -0.7636704, 2.522177, 1, 0, 0, 1, 1,
0.7537431, -1.228353, 3.44195, 1, 0, 0, 1, 1,
0.7548025, 0.1915489, 1.560645, 0, 0, 0, 1, 1,
0.7696109, 0.983111, -0.1734779, 0, 0, 0, 1, 1,
0.772329, -0.7611321, 1.980617, 0, 0, 0, 1, 1,
0.7724162, -0.6447678, 2.613876, 0, 0, 0, 1, 1,
0.772476, -1.997873, 2.850825, 0, 0, 0, 1, 1,
0.7753689, 0.02705697, -0.1541599, 0, 0, 0, 1, 1,
0.7796134, -0.2989813, 2.957649, 0, 0, 0, 1, 1,
0.7972496, -0.9177596, 3.755432, 1, 1, 1, 1, 1,
0.7985566, 1.116528, 0.2241771, 1, 1, 1, 1, 1,
0.8020002, 0.7548198, -0.112443, 1, 1, 1, 1, 1,
0.8026091, -0.1731524, 0.7391557, 1, 1, 1, 1, 1,
0.8028141, 0.1907809, 1.637077, 1, 1, 1, 1, 1,
0.8094845, -1.875289, 0.9439559, 1, 1, 1, 1, 1,
0.811672, -0.3257051, 1.178764, 1, 1, 1, 1, 1,
0.8183643, 1.008967, 1.52291, 1, 1, 1, 1, 1,
0.8187577, -0.05735162, 2.100657, 1, 1, 1, 1, 1,
0.8230457, -0.5574728, 1.611058, 1, 1, 1, 1, 1,
0.8235684, -0.3619466, 2.914569, 1, 1, 1, 1, 1,
0.8256102, 0.6131507, 1.09226, 1, 1, 1, 1, 1,
0.8303442, 0.3086281, 0.3379674, 1, 1, 1, 1, 1,
0.8314653, 0.0138502, 1.470484, 1, 1, 1, 1, 1,
0.8349347, 0.7362335, 0.3684472, 1, 1, 1, 1, 1,
0.8390235, 0.2255287, 1.422119, 0, 0, 1, 1, 1,
0.8402329, -0.7728897, 2.837186, 1, 0, 0, 1, 1,
0.8413043, 0.9189007, 1.278391, 1, 0, 0, 1, 1,
0.8433986, -0.8625568, 1.881836, 1, 0, 0, 1, 1,
0.8488796, -0.1747293, 2.683697, 1, 0, 0, 1, 1,
0.8510672, 0.4411725, 2.389664, 1, 0, 0, 1, 1,
0.8512775, 0.8494588, 2.52982, 0, 0, 0, 1, 1,
0.852728, 0.2796625, 2.969037, 0, 0, 0, 1, 1,
0.8549385, 0.8156416, 1.742121, 0, 0, 0, 1, 1,
0.8555915, 0.6070558, 1.207435, 0, 0, 0, 1, 1,
0.8630431, 0.3308223, 2.202787, 0, 0, 0, 1, 1,
0.8655986, 0.71267, 0.5225465, 0, 0, 0, 1, 1,
0.8662992, -0.8356662, 1.68754, 0, 0, 0, 1, 1,
0.8675231, -1.365505, 5.086983, 1, 1, 1, 1, 1,
0.8770163, -0.009624308, 0.2262536, 1, 1, 1, 1, 1,
0.8826777, 0.702318, 1.037224, 1, 1, 1, 1, 1,
0.8846398, 0.4510663, -0.5599093, 1, 1, 1, 1, 1,
0.8864027, 0.3399221, 0.0146066, 1, 1, 1, 1, 1,
0.8868188, -1.6748, 3.468409, 1, 1, 1, 1, 1,
0.8871896, -0.9377281, 1.987876, 1, 1, 1, 1, 1,
0.887305, 0.4259542, 0.2715881, 1, 1, 1, 1, 1,
0.8879992, -0.2326949, 1.959388, 1, 1, 1, 1, 1,
0.8891632, 1.328114, 0.2636779, 1, 1, 1, 1, 1,
0.8895267, 0.6666134, -1.928676, 1, 1, 1, 1, 1,
0.900952, -0.1800256, 1.325982, 1, 1, 1, 1, 1,
0.9031774, -1.19132, 1.172318, 1, 1, 1, 1, 1,
0.9106997, -0.1068451, 0.01616025, 1, 1, 1, 1, 1,
0.9131277, 2.302754, 1.383929, 1, 1, 1, 1, 1,
0.9152951, 0.4785771, 1.171471, 0, 0, 1, 1, 1,
0.915756, -0.2042172, -0.01357374, 1, 0, 0, 1, 1,
0.9190221, 0.3880782, 2.665289, 1, 0, 0, 1, 1,
0.9201282, 0.2762438, 2.240992, 1, 0, 0, 1, 1,
0.9206182, -0.8015619, 0.8500253, 1, 0, 0, 1, 1,
0.9243484, -1.418015, 1.972165, 1, 0, 0, 1, 1,
0.9360453, -0.5128856, 1.743913, 0, 0, 0, 1, 1,
0.9377698, 2.168366, -0.3322064, 0, 0, 0, 1, 1,
0.9399821, -0.5086802, 2.322754, 0, 0, 0, 1, 1,
0.9408847, -0.2865118, 1.930664, 0, 0, 0, 1, 1,
0.9417996, 0.6529937, 1.526605, 0, 0, 0, 1, 1,
0.9426333, 0.04198663, 0.9009215, 0, 0, 0, 1, 1,
0.9447531, 0.8288387, 2.654758, 0, 0, 0, 1, 1,
0.9496751, 0.3851407, 1.01436, 1, 1, 1, 1, 1,
0.9562168, -0.263695, 0.5395995, 1, 1, 1, 1, 1,
0.9565564, -0.4029813, 1.892117, 1, 1, 1, 1, 1,
0.9717105, -1.288727, 3.878076, 1, 1, 1, 1, 1,
0.971815, 1.212144, -0.6595634, 1, 1, 1, 1, 1,
0.9719559, 0.2081906, 2.33214, 1, 1, 1, 1, 1,
0.9731346, -1.313653, 3.007395, 1, 1, 1, 1, 1,
0.9743142, 1.020732, -1.180038, 1, 1, 1, 1, 1,
0.9798019, 1.972993, 0.3065996, 1, 1, 1, 1, 1,
0.9798966, 0.6974626, 0.8412722, 1, 1, 1, 1, 1,
0.9861038, 1.551376, 1.741479, 1, 1, 1, 1, 1,
0.9880338, -0.3231797, 2.424659, 1, 1, 1, 1, 1,
0.9902087, 1.166534, 1.470942, 1, 1, 1, 1, 1,
0.9937826, 0.736447, -0.2311164, 1, 1, 1, 1, 1,
0.9951873, 0.2620119, 0.5229141, 1, 1, 1, 1, 1,
0.9964032, -0.3271898, 1.594788, 0, 0, 1, 1, 1,
0.9981942, 0.2815931, 0.3188447, 1, 0, 0, 1, 1,
1.010588, 0.4379661, -0.5899808, 1, 0, 0, 1, 1,
1.01122, -0.1030917, 0.3408862, 1, 0, 0, 1, 1,
1.017226, 0.4577, 2.449257, 1, 0, 0, 1, 1,
1.022786, 0.9494479, 0.08750639, 1, 0, 0, 1, 1,
1.032065, -0.7437754, 2.230075, 0, 0, 0, 1, 1,
1.04011, -1.883206, 2.885878, 0, 0, 0, 1, 1,
1.043069, 1.769122, 1.000323, 0, 0, 0, 1, 1,
1.044145, -0.4651186, 0.09611832, 0, 0, 0, 1, 1,
1.044586, -1.971288, 1.911515, 0, 0, 0, 1, 1,
1.051199, -0.4449774, 1.176193, 0, 0, 0, 1, 1,
1.054219, -0.1992243, -0.02318498, 0, 0, 0, 1, 1,
1.059234, 1.288128, -0.3095445, 1, 1, 1, 1, 1,
1.063449, 0.7024736, 0.9951009, 1, 1, 1, 1, 1,
1.065046, 1.372416, 0.4358654, 1, 1, 1, 1, 1,
1.066132, 1.018827, 0.7421203, 1, 1, 1, 1, 1,
1.069439, -1.993462, 1.627701, 1, 1, 1, 1, 1,
1.0736, 1.389711, -0.7195275, 1, 1, 1, 1, 1,
1.088861, 0.3623058, 2.749331, 1, 1, 1, 1, 1,
1.105448, -0.1412704, 2.928294, 1, 1, 1, 1, 1,
1.107645, -1.551687, 3.146109, 1, 1, 1, 1, 1,
1.113128, -0.981209, 2.282825, 1, 1, 1, 1, 1,
1.113712, -0.7662752, 3.705359, 1, 1, 1, 1, 1,
1.115247, 0.8951614, 0.7117636, 1, 1, 1, 1, 1,
1.115808, -0.5276591, 2.650397, 1, 1, 1, 1, 1,
1.120804, 1.056413, 0.68235, 1, 1, 1, 1, 1,
1.124365, 0.08635028, 0.1674289, 1, 1, 1, 1, 1,
1.133014, -0.5396165, 2.99324, 0, 0, 1, 1, 1,
1.134447, -0.02088428, 1.477801, 1, 0, 0, 1, 1,
1.135538, 1.352036, 0.9183809, 1, 0, 0, 1, 1,
1.136734, 0.2434196, 1.642401, 1, 0, 0, 1, 1,
1.13699, 0.1659132, -0.4232455, 1, 0, 0, 1, 1,
1.139584, -1.427906, 2.056842, 1, 0, 0, 1, 1,
1.142507, -1.766451, 3.817738, 0, 0, 0, 1, 1,
1.145828, 0.8176954, 0.2692893, 0, 0, 0, 1, 1,
1.158346, 0.5788063, 1.240746, 0, 0, 0, 1, 1,
1.162234, 0.6173933, 1.172005, 0, 0, 0, 1, 1,
1.166664, 0.5109507, 0.8812662, 0, 0, 0, 1, 1,
1.1699, -0.8177925, 0.05787012, 0, 0, 0, 1, 1,
1.177538, 1.781217, 3.06797, 0, 0, 0, 1, 1,
1.179123, -1.310342, 4.442643, 1, 1, 1, 1, 1,
1.187564, 0.7537541, -0.8481441, 1, 1, 1, 1, 1,
1.190307, 1.143121, 1.882804, 1, 1, 1, 1, 1,
1.191293, -0.5966403, 1.007091, 1, 1, 1, 1, 1,
1.192214, -0.4840561, 2.20796, 1, 1, 1, 1, 1,
1.19359, 0.01628879, 0.8321921, 1, 1, 1, 1, 1,
1.19679, 0.2085584, 0.8498868, 1, 1, 1, 1, 1,
1.200191, 0.01540496, 1.459723, 1, 1, 1, 1, 1,
1.20056, -1.681434, 1.611077, 1, 1, 1, 1, 1,
1.204054, -0.702334, 0.3466626, 1, 1, 1, 1, 1,
1.208319, -1.804831, 0.9045953, 1, 1, 1, 1, 1,
1.227937, -0.9173671, 3.523463, 1, 1, 1, 1, 1,
1.229324, 0.3778242, 1.440251, 1, 1, 1, 1, 1,
1.231558, -0.6558539, 3.212492, 1, 1, 1, 1, 1,
1.232923, 0.3997064, 2.397307, 1, 1, 1, 1, 1,
1.234958, -1.384137, 2.664826, 0, 0, 1, 1, 1,
1.23734, 0.7280867, 0.8819962, 1, 0, 0, 1, 1,
1.237988, 1.125095, 1.387808, 1, 0, 0, 1, 1,
1.242764, -0.2868057, 1.407313, 1, 0, 0, 1, 1,
1.244007, -0.1521355, 1.223236, 1, 0, 0, 1, 1,
1.247227, 0.9931694, 0.9509427, 1, 0, 0, 1, 1,
1.259345, -0.9876303, 1.959041, 0, 0, 0, 1, 1,
1.26305, -0.6864217, 2.360991, 0, 0, 0, 1, 1,
1.27279, 1.417927, 0.5092944, 0, 0, 0, 1, 1,
1.273405, 0.29492, 0.8496438, 0, 0, 0, 1, 1,
1.279888, 0.7628135, 0.07376716, 0, 0, 0, 1, 1,
1.283201, -1.140747, 1.388639, 0, 0, 0, 1, 1,
1.284766, -1.484231, 1.498305, 0, 0, 0, 1, 1,
1.29309, -0.9191055, 1.309238, 1, 1, 1, 1, 1,
1.299319, -0.07894751, 2.618985, 1, 1, 1, 1, 1,
1.309477, 0.223691, 0.2312471, 1, 1, 1, 1, 1,
1.313549, -1.143067, 2.74326, 1, 1, 1, 1, 1,
1.323854, -1.894969, 3.162137, 1, 1, 1, 1, 1,
1.345772, 1.732334, 0.1608727, 1, 1, 1, 1, 1,
1.36748, -0.3633141, 2.065403, 1, 1, 1, 1, 1,
1.373662, 0.8759437, 1.222773, 1, 1, 1, 1, 1,
1.375651, 2.455222, -1.610311, 1, 1, 1, 1, 1,
1.380547, -0.05990083, 0.2158876, 1, 1, 1, 1, 1,
1.383247, 0.9010299, -1.143722, 1, 1, 1, 1, 1,
1.390242, 0.4987341, -0.8277115, 1, 1, 1, 1, 1,
1.402559, -0.5175882, 2.427837, 1, 1, 1, 1, 1,
1.432082, -0.4858441, 1.155535, 1, 1, 1, 1, 1,
1.440471, 0.9994391, 1.286568, 1, 1, 1, 1, 1,
1.444475, 2.251148, 0.5660573, 0, 0, 1, 1, 1,
1.447101, -0.8127041, 1.890066, 1, 0, 0, 1, 1,
1.461916, -0.6988265, 2.028162, 1, 0, 0, 1, 1,
1.467355, -0.1570426, 2.852065, 1, 0, 0, 1, 1,
1.470958, 0.3918175, 1.668662, 1, 0, 0, 1, 1,
1.472181, -0.3457592, -0.001253886, 1, 0, 0, 1, 1,
1.474519, 0.720196, 2.119457, 0, 0, 0, 1, 1,
1.480459, -0.8926009, 1.459699, 0, 0, 0, 1, 1,
1.483746, 0.8817291, 0.678807, 0, 0, 0, 1, 1,
1.491973, 0.1344761, 1.751261, 0, 0, 0, 1, 1,
1.493971, -0.4952087, 3.488402, 0, 0, 0, 1, 1,
1.501163, 0.7681263, 1.437424, 0, 0, 0, 1, 1,
1.513404, 1.101357, 0.9029289, 0, 0, 0, 1, 1,
1.518483, -0.2382419, 2.507715, 1, 1, 1, 1, 1,
1.519762, 1.471702, 2.244186, 1, 1, 1, 1, 1,
1.537577, -1.530211, 5.364845, 1, 1, 1, 1, 1,
1.542668, 0.3411182, 0.5078271, 1, 1, 1, 1, 1,
1.555032, 1.248747, 1.491684, 1, 1, 1, 1, 1,
1.556957, -1.868914, 2.423126, 1, 1, 1, 1, 1,
1.560992, 0.4424392, 1.405796, 1, 1, 1, 1, 1,
1.571791, 1.176514, -0.7577294, 1, 1, 1, 1, 1,
1.576081, -0.3468919, 0.8895171, 1, 1, 1, 1, 1,
1.577483, 0.7574434, 1.471693, 1, 1, 1, 1, 1,
1.614652, 1.649001, 2.162438, 1, 1, 1, 1, 1,
1.625279, -0.5432437, 2.426481, 1, 1, 1, 1, 1,
1.626277, -1.542701, 2.844237, 1, 1, 1, 1, 1,
1.627522, -0.2872232, 1.724679, 1, 1, 1, 1, 1,
1.63388, -0.668951, 1.796987, 1, 1, 1, 1, 1,
1.639128, -0.09775728, 1.153693, 0, 0, 1, 1, 1,
1.652392, 0.7120713, -0.3710646, 1, 0, 0, 1, 1,
1.655425, 0.3709157, 1.119902, 1, 0, 0, 1, 1,
1.663391, -0.05001301, 1.906988, 1, 0, 0, 1, 1,
1.663697, -0.2873186, 3.550689, 1, 0, 0, 1, 1,
1.669264, 1.596096, 1.675783, 1, 0, 0, 1, 1,
1.673305, -0.05535551, -0.3379282, 0, 0, 0, 1, 1,
1.688198, -0.08459438, 3.549483, 0, 0, 0, 1, 1,
1.697887, -0.8360696, 2.481862, 0, 0, 0, 1, 1,
1.705049, -0.6187888, 3.134746, 0, 0, 0, 1, 1,
1.722968, -0.7796727, 0.3258894, 0, 0, 0, 1, 1,
1.762728, 1.029653, -0.09977506, 0, 0, 0, 1, 1,
1.771937, 1.189789, 1.224865, 0, 0, 0, 1, 1,
1.780151, 2.464952, 0.8371149, 1, 1, 1, 1, 1,
1.781701, -1.964179, 2.226864, 1, 1, 1, 1, 1,
1.785249, 0.2400417, 1.672536, 1, 1, 1, 1, 1,
1.80092, -0.6191829, 1.962485, 1, 1, 1, 1, 1,
1.835585, -0.3200741, 3.161774, 1, 1, 1, 1, 1,
1.84047, 1.797049, 1.984595, 1, 1, 1, 1, 1,
1.865327, -0.7693395, 2.563443, 1, 1, 1, 1, 1,
1.878535, 0.1510307, 1.57933, 1, 1, 1, 1, 1,
1.933733, -0.06596391, -0.1994759, 1, 1, 1, 1, 1,
1.937976, -0.3716126, 0.7979544, 1, 1, 1, 1, 1,
1.948782, -0.8930641, 0.4291478, 1, 1, 1, 1, 1,
1.953362, -0.5242407, 2.610822, 1, 1, 1, 1, 1,
1.995794, 1.426778, 0.3355178, 1, 1, 1, 1, 1,
2.003265, 0.3141166, -0.07979048, 1, 1, 1, 1, 1,
2.005225, 1.174202, 2.537847, 1, 1, 1, 1, 1,
2.010782, 0.4164684, 1.609739, 0, 0, 1, 1, 1,
2.015254, -0.1424349, 1.89278, 1, 0, 0, 1, 1,
2.025106, 0.2369692, 1.45517, 1, 0, 0, 1, 1,
2.144184, 0.6418893, 0.1568314, 1, 0, 0, 1, 1,
2.162672, 0.2780297, 2.004039, 1, 0, 0, 1, 1,
2.173148, 0.9891245, 0.7099694, 1, 0, 0, 1, 1,
2.183487, 1.431221, -0.1280771, 0, 0, 0, 1, 1,
2.221936, -1.006473, 1.872988, 0, 0, 0, 1, 1,
2.243917, 0.3904296, 0.4190662, 0, 0, 0, 1, 1,
2.256807, 0.076263, 1.087971, 0, 0, 0, 1, 1,
2.263865, -0.4751975, 3.027877, 0, 0, 0, 1, 1,
2.314731, -0.09476601, 3.01095, 0, 0, 0, 1, 1,
2.330341, 0.02191382, 2.085825, 0, 0, 0, 1, 1,
2.406509, -0.038986, -0.1710673, 1, 1, 1, 1, 1,
2.496404, -0.9692304, 2.324056, 1, 1, 1, 1, 1,
2.528165, -1.044461, 2.932684, 1, 1, 1, 1, 1,
2.538718, -0.04551795, 0.3753498, 1, 1, 1, 1, 1,
2.752642, -1.106356, 2.421718, 1, 1, 1, 1, 1,
2.999651, -0.5804203, 0.1484607, 1, 1, 1, 1, 1,
3.097362, 0.264393, 1.871327, 1, 1, 1, 1, 1
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
var radius = 9.483414;
var distance = 33.31009;
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
mvMatrix.translate( -0.1573595, -0.05016267, -0.2269828 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.31009);
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
