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
-3.46138, -0.2267324, -0.4024924, 1, 0, 0, 1,
-3.127104, 1.396932, -2.336444, 1, 0.007843138, 0, 1,
-2.831988, -0.9097177, -2.420705, 1, 0.01176471, 0, 1,
-2.651879, -1.005285, -2.396926, 1, 0.01960784, 0, 1,
-2.64335, -0.04348706, -2.500134, 1, 0.02352941, 0, 1,
-2.590541, -1.048218, -2.706335, 1, 0.03137255, 0, 1,
-2.570991, 0.0339746, -2.213751, 1, 0.03529412, 0, 1,
-2.525103, 0.2692612, -2.076421, 1, 0.04313726, 0, 1,
-2.438288, -0.005250867, -2.11832, 1, 0.04705882, 0, 1,
-2.392622, 1.14323, -0.5953709, 1, 0.05490196, 0, 1,
-2.375512, 0.7322102, -2.598981, 1, 0.05882353, 0, 1,
-2.35974, 0.01069409, -2.285737, 1, 0.06666667, 0, 1,
-2.352471, 1.262983, -0.8778137, 1, 0.07058824, 0, 1,
-2.338052, -1.355623, -3.506919, 1, 0.07843138, 0, 1,
-2.27352, -0.4995058, -3.351228, 1, 0.08235294, 0, 1,
-2.213404, -0.1462873, -1.125875, 1, 0.09019608, 0, 1,
-2.193781, 0.4022884, -1.37804, 1, 0.09411765, 0, 1,
-2.172623, 0.1270462, -1.969935, 1, 0.1019608, 0, 1,
-2.171815, -2.008461, -0.6375146, 1, 0.1098039, 0, 1,
-2.170288, -1.210439, -2.00485, 1, 0.1137255, 0, 1,
-2.115866, 0.07676728, -2.702081, 1, 0.1215686, 0, 1,
-2.063595, -2.583321, -3.417506, 1, 0.1254902, 0, 1,
-2.05546, -1.030958, -1.331698, 1, 0.1333333, 0, 1,
-2.049335, -1.540618, -2.964533, 1, 0.1372549, 0, 1,
-2.046562, 1.627318, -2.202214, 1, 0.145098, 0, 1,
-2.044704, 1.95803, -1.109646, 1, 0.1490196, 0, 1,
-2.041986, 0.7724574, -1.445774, 1, 0.1568628, 0, 1,
-2.033632, -0.7020551, -0.3430785, 1, 0.1607843, 0, 1,
-2.008383, 0.840082, 0.1753595, 1, 0.1686275, 0, 1,
-1.985203, -0.4500932, -0.785131, 1, 0.172549, 0, 1,
-1.975807, 1.723371, -0.9264619, 1, 0.1803922, 0, 1,
-1.974926, -0.4771997, -0.6101864, 1, 0.1843137, 0, 1,
-1.940448, -0.800979, -0.4559998, 1, 0.1921569, 0, 1,
-1.903141, 0.2833963, 1.55774, 1, 0.1960784, 0, 1,
-1.874565, -0.626399, -2.27723, 1, 0.2039216, 0, 1,
-1.846463, 0.5082453, -0.6606567, 1, 0.2117647, 0, 1,
-1.831831, -0.4909283, -0.4998579, 1, 0.2156863, 0, 1,
-1.822593, 0.03716872, -1.929182, 1, 0.2235294, 0, 1,
-1.81398, 0.04275453, -0.3085111, 1, 0.227451, 0, 1,
-1.801692, 0.5293986, -1.870544, 1, 0.2352941, 0, 1,
-1.80016, 1.117137, 0.2035686, 1, 0.2392157, 0, 1,
-1.788458, 1.316798, 0.3558886, 1, 0.2470588, 0, 1,
-1.784028, -0.878887, -2.425132, 1, 0.2509804, 0, 1,
-1.748954, -0.2104069, -0.2882878, 1, 0.2588235, 0, 1,
-1.725554, -0.4409428, -1.692479, 1, 0.2627451, 0, 1,
-1.714021, 0.231838, -1.792858, 1, 0.2705882, 0, 1,
-1.712099, -0.5986525, -0.1922687, 1, 0.2745098, 0, 1,
-1.708113, -2.351291, -2.563222, 1, 0.282353, 0, 1,
-1.697293, -0.7178582, -3.52079, 1, 0.2862745, 0, 1,
-1.685975, 1.11507, -0.9216158, 1, 0.2941177, 0, 1,
-1.681482, 1.631298, -0.09382122, 1, 0.3019608, 0, 1,
-1.668249, 0.425859, -1.040136, 1, 0.3058824, 0, 1,
-1.668155, -1.129007, -2.117591, 1, 0.3137255, 0, 1,
-1.666993, -1.012823, -1.496914, 1, 0.3176471, 0, 1,
-1.657309, 0.5631335, -1.593397, 1, 0.3254902, 0, 1,
-1.650942, -0.5663869, -3.000312, 1, 0.3294118, 0, 1,
-1.64647, -1.10699, -0.01002532, 1, 0.3372549, 0, 1,
-1.640165, -1.360246, -1.524989, 1, 0.3411765, 0, 1,
-1.638594, 0.8163645, -0.8983502, 1, 0.3490196, 0, 1,
-1.637605, 1.417976, -0.5640032, 1, 0.3529412, 0, 1,
-1.633211, 1.315242, 0.3026905, 1, 0.3607843, 0, 1,
-1.623429, 0.4109378, -1.958944, 1, 0.3647059, 0, 1,
-1.621012, 0.2946807, -1.466106, 1, 0.372549, 0, 1,
-1.615708, -0.6567163, -4.092868, 1, 0.3764706, 0, 1,
-1.615335, 0.7920119, -0.9772792, 1, 0.3843137, 0, 1,
-1.60543, -0.7202764, -2.24787, 1, 0.3882353, 0, 1,
-1.604427, -0.6176633, -2.780064, 1, 0.3960784, 0, 1,
-1.596219, -0.3242809, -3.273621, 1, 0.4039216, 0, 1,
-1.58503, 0.8534909, -1.394671, 1, 0.4078431, 0, 1,
-1.578541, 0.1638072, -0.8149521, 1, 0.4156863, 0, 1,
-1.57578, -0.0350502, -1.120576, 1, 0.4196078, 0, 1,
-1.565001, 0.6811555, -1.764399, 1, 0.427451, 0, 1,
-1.564797, -0.1746093, -0.9404457, 1, 0.4313726, 0, 1,
-1.551346, 1.018553, -0.5474767, 1, 0.4392157, 0, 1,
-1.548091, -1.371558, -2.422572, 1, 0.4431373, 0, 1,
-1.543113, 0.3831476, 0.4370632, 1, 0.4509804, 0, 1,
-1.530316, -1.176381, -3.060196, 1, 0.454902, 0, 1,
-1.529119, -0.6345556, -1.385058, 1, 0.4627451, 0, 1,
-1.528218, 0.04078441, 0.5493855, 1, 0.4666667, 0, 1,
-1.513269, 0.956306, -0.7588181, 1, 0.4745098, 0, 1,
-1.506248, -0.9197177, -1.850588, 1, 0.4784314, 0, 1,
-1.505874, 1.031761, -0.2356687, 1, 0.4862745, 0, 1,
-1.494889, -0.7949584, -1.972729, 1, 0.4901961, 0, 1,
-1.493142, -0.7065753, -0.05737372, 1, 0.4980392, 0, 1,
-1.489057, -1.172596, -1.551351, 1, 0.5058824, 0, 1,
-1.483802, -2.300002, -2.429896, 1, 0.509804, 0, 1,
-1.474711, 1.89013, -0.02602787, 1, 0.5176471, 0, 1,
-1.465647, -3.203255, -1.440653, 1, 0.5215687, 0, 1,
-1.465314, 0.4245836, -0.9817435, 1, 0.5294118, 0, 1,
-1.460974, 0.7943287, -0.04007016, 1, 0.5333334, 0, 1,
-1.457925, -0.1829474, -1.105081, 1, 0.5411765, 0, 1,
-1.457103, 0.3582886, -2.168522, 1, 0.5450981, 0, 1,
-1.451169, -0.7024035, -3.674315, 1, 0.5529412, 0, 1,
-1.43663, -0.6489708, -3.089279, 1, 0.5568628, 0, 1,
-1.43244, 0.03163899, -3.856397, 1, 0.5647059, 0, 1,
-1.431207, 0.6358609, -0.03555024, 1, 0.5686275, 0, 1,
-1.431014, -1.144922, -4.376629, 1, 0.5764706, 0, 1,
-1.428142, 0.9040369, -2.137452, 1, 0.5803922, 0, 1,
-1.425698, 0.7315798, -0.3988157, 1, 0.5882353, 0, 1,
-1.419759, 0.4236908, -1.367311, 1, 0.5921569, 0, 1,
-1.411694, -0.4228067, -2.665472, 1, 0.6, 0, 1,
-1.409488, -1.146909, -2.026271, 1, 0.6078432, 0, 1,
-1.405583, 1.666456, -0.6858897, 1, 0.6117647, 0, 1,
-1.402153, -0.2536069, -1.559794, 1, 0.6196079, 0, 1,
-1.400958, -0.9377359, -1.631488, 1, 0.6235294, 0, 1,
-1.393199, -1.162955, -2.210517, 1, 0.6313726, 0, 1,
-1.3881, -0.4183626, -3.529779, 1, 0.6352941, 0, 1,
-1.38411, -1.323881, -2.24356, 1, 0.6431373, 0, 1,
-1.380939, 0.7793553, -2.299038, 1, 0.6470588, 0, 1,
-1.377413, 1.018719, -0.7699627, 1, 0.654902, 0, 1,
-1.373394, 0.5326382, -2.578992, 1, 0.6588235, 0, 1,
-1.344581, -0.6480796, -0.8109922, 1, 0.6666667, 0, 1,
-1.344377, 2.40573, -0.03247551, 1, 0.6705883, 0, 1,
-1.343227, 0.1445974, -1.918142, 1, 0.6784314, 0, 1,
-1.339663, 0.09520011, -1.879129, 1, 0.682353, 0, 1,
-1.338668, 1.608412, -2.703752, 1, 0.6901961, 0, 1,
-1.330802, -0.02151584, -1.223067, 1, 0.6941177, 0, 1,
-1.327451, 0.1841519, 0.4633817, 1, 0.7019608, 0, 1,
-1.312598, -0.5078864, -1.888087, 1, 0.7098039, 0, 1,
-1.301661, 0.8878706, -1.573892, 1, 0.7137255, 0, 1,
-1.295038, -0.4135285, -4.252068, 1, 0.7215686, 0, 1,
-1.291177, -0.3737529, -1.708437, 1, 0.7254902, 0, 1,
-1.279805, -1.755729, -2.089676, 1, 0.7333333, 0, 1,
-1.279698, -0.4935303, -0.6170945, 1, 0.7372549, 0, 1,
-1.267868, -0.835855, -0.02675576, 1, 0.7450981, 0, 1,
-1.265684, -0.4090094, -3.430001, 1, 0.7490196, 0, 1,
-1.250888, 1.326704, 0.3466682, 1, 0.7568628, 0, 1,
-1.249743, -0.3565571, -1.261553, 1, 0.7607843, 0, 1,
-1.233524, -0.5366997, -2.188802, 1, 0.7686275, 0, 1,
-1.226094, 0.3843895, -0.6997781, 1, 0.772549, 0, 1,
-1.220638, 0.6689398, 0.2001463, 1, 0.7803922, 0, 1,
-1.216613, 0.120762, -1.807273, 1, 0.7843137, 0, 1,
-1.206417, -0.7204995, -3.132078, 1, 0.7921569, 0, 1,
-1.202695, -1.408427, -4.084208, 1, 0.7960784, 0, 1,
-1.20146, -0.75829, -0.8121479, 1, 0.8039216, 0, 1,
-1.194962, 1.414842, -1.540584, 1, 0.8117647, 0, 1,
-1.188137, -0.9054236, -2.82304, 1, 0.8156863, 0, 1,
-1.185547, 1.460865, -1.536624, 1, 0.8235294, 0, 1,
-1.182215, -1.418798, -0.4055921, 1, 0.827451, 0, 1,
-1.180801, -0.1232515, -1.189865, 1, 0.8352941, 0, 1,
-1.179776, -1.702765, -0.9697477, 1, 0.8392157, 0, 1,
-1.173438, -0.209239, -2.43991, 1, 0.8470588, 0, 1,
-1.162124, 1.356643, -2.578181, 1, 0.8509804, 0, 1,
-1.148388, 0.4055531, -1.80205, 1, 0.8588235, 0, 1,
-1.141855, -0.5388837, -0.6684604, 1, 0.8627451, 0, 1,
-1.138498, 0.06671433, -1.602481, 1, 0.8705882, 0, 1,
-1.13286, 0.8100067, -1.700476, 1, 0.8745098, 0, 1,
-1.125755, 0.08079948, -1.512293, 1, 0.8823529, 0, 1,
-1.122297, -0.4794695, -1.3692, 1, 0.8862745, 0, 1,
-1.119524, -1.632853, -2.235341, 1, 0.8941177, 0, 1,
-1.111044, -0.7601129, -2.519791, 1, 0.8980392, 0, 1,
-1.110904, 2.074666, -0.3129154, 1, 0.9058824, 0, 1,
-1.102551, -0.4179815, -3.855977, 1, 0.9137255, 0, 1,
-1.096759, -1.312195, -3.877373, 1, 0.9176471, 0, 1,
-1.094579, 0.2038881, -0.6560678, 1, 0.9254902, 0, 1,
-1.093017, 1.738457, -0.8109752, 1, 0.9294118, 0, 1,
-1.092851, -0.8612117, -1.139093, 1, 0.9372549, 0, 1,
-1.0821, 2.441417, 0.8865409, 1, 0.9411765, 0, 1,
-1.076492, -0.00907186, -2.366692, 1, 0.9490196, 0, 1,
-1.070432, 1.488218, 0.6998848, 1, 0.9529412, 0, 1,
-1.048629, -0.6992233, -1.642355, 1, 0.9607843, 0, 1,
-1.042825, 0.01209413, -2.484704, 1, 0.9647059, 0, 1,
-1.032736, -0.3049524, -2.389606, 1, 0.972549, 0, 1,
-1.029628, 0.8744843, -1.074229, 1, 0.9764706, 0, 1,
-1.029028, -0.1588127, -1.518867, 1, 0.9843137, 0, 1,
-1.01948, -0.2087541, -1.83202, 1, 0.9882353, 0, 1,
-1.016287, 0.2132565, -0.5665676, 1, 0.9960784, 0, 1,
-1.015164, 0.3460535, -1.890411, 0.9960784, 1, 0, 1,
-1.009604, -0.2718006, -2.105733, 0.9921569, 1, 0, 1,
-1.007315, -0.1153329, -0.53718, 0.9843137, 1, 0, 1,
-1.004094, -0.1405708, -2.928642, 0.9803922, 1, 0, 1,
-1.001871, -1.186814, -3.861739, 0.972549, 1, 0, 1,
-0.995503, 0.6672518, -1.599431, 0.9686275, 1, 0, 1,
-0.9850765, -0.3287508, -3.414811, 0.9607843, 1, 0, 1,
-0.9844682, 0.6785768, -1.681006, 0.9568627, 1, 0, 1,
-0.9843397, 0.6608974, -1.458944, 0.9490196, 1, 0, 1,
-0.9828053, -1.388803, -0.3907263, 0.945098, 1, 0, 1,
-0.977957, -0.1976969, -2.298413, 0.9372549, 1, 0, 1,
-0.9730521, -1.362889, -1.559794, 0.9333333, 1, 0, 1,
-0.9728649, 0.867632, -0.05534634, 0.9254902, 1, 0, 1,
-0.971025, -0.2737382, -1.785696, 0.9215686, 1, 0, 1,
-0.9700762, -0.441094, -2.429529, 0.9137255, 1, 0, 1,
-0.9642308, -0.0804418, -2.203463, 0.9098039, 1, 0, 1,
-0.963187, 2.114109, -1.501368, 0.9019608, 1, 0, 1,
-0.9614536, 1.804211, -1.480835, 0.8941177, 1, 0, 1,
-0.9547507, -0.4816709, -2.576855, 0.8901961, 1, 0, 1,
-0.9499664, 1.070584, -1.033165, 0.8823529, 1, 0, 1,
-0.9483262, 0.9665636, -1.881703, 0.8784314, 1, 0, 1,
-0.9474959, 0.103463, -0.5216574, 0.8705882, 1, 0, 1,
-0.9398565, -1.980264, -0.814666, 0.8666667, 1, 0, 1,
-0.9391382, -0.2133604, -2.125034, 0.8588235, 1, 0, 1,
-0.9390242, -0.4657108, -2.361264, 0.854902, 1, 0, 1,
-0.9331116, -0.2242544, -2.005969, 0.8470588, 1, 0, 1,
-0.9329477, 0.2061711, -1.131541, 0.8431373, 1, 0, 1,
-0.9295121, -1.391799, -2.740804, 0.8352941, 1, 0, 1,
-0.9276938, 1.003765, 0.4143191, 0.8313726, 1, 0, 1,
-0.9256772, -0.3714559, -2.381095, 0.8235294, 1, 0, 1,
-0.9253535, 0.4025541, -1.203914, 0.8196079, 1, 0, 1,
-0.918138, 0.6063638, -1.321028, 0.8117647, 1, 0, 1,
-0.9148227, 1.337238, -0.7941224, 0.8078431, 1, 0, 1,
-0.9107985, -0.04582541, -1.194056, 0.8, 1, 0, 1,
-0.906734, -0.3794475, -0.9384016, 0.7921569, 1, 0, 1,
-0.9037753, 0.3656055, -0.7780793, 0.7882353, 1, 0, 1,
-0.9017192, -1.426988, -2.790009, 0.7803922, 1, 0, 1,
-0.9010354, 0.1400216, -0.2113218, 0.7764706, 1, 0, 1,
-0.89969, 0.770674, -1.049335, 0.7686275, 1, 0, 1,
-0.890538, -1.146126, -1.774303, 0.7647059, 1, 0, 1,
-0.8852794, -0.8875579, -2.315525, 0.7568628, 1, 0, 1,
-0.8807434, -0.318539, 0.09408941, 0.7529412, 1, 0, 1,
-0.8752673, 0.4542497, 0.2317823, 0.7450981, 1, 0, 1,
-0.8722827, 2.4306, -1.341988, 0.7411765, 1, 0, 1,
-0.8626581, 0.2623022, -1.810404, 0.7333333, 1, 0, 1,
-0.856784, 1.373886, -0.9294837, 0.7294118, 1, 0, 1,
-0.8416851, 1.334718, -0.9126911, 0.7215686, 1, 0, 1,
-0.8389661, -0.4227908, -2.262356, 0.7176471, 1, 0, 1,
-0.836233, 1.059241, -1.606434, 0.7098039, 1, 0, 1,
-0.8324015, -1.013845, -2.814857, 0.7058824, 1, 0, 1,
-0.8318344, 0.09484646, -1.856378, 0.6980392, 1, 0, 1,
-0.8248984, -1.93314, -3.99964, 0.6901961, 1, 0, 1,
-0.8215895, -1.037096, -0.8575054, 0.6862745, 1, 0, 1,
-0.8200039, -0.9777153, -1.933529, 0.6784314, 1, 0, 1,
-0.819535, -1.68602, -2.51854, 0.6745098, 1, 0, 1,
-0.8173558, -1.224308, -2.584774, 0.6666667, 1, 0, 1,
-0.816331, -1.17038, -3.552388, 0.6627451, 1, 0, 1,
-0.8147854, 1.052758, -0.726624, 0.654902, 1, 0, 1,
-0.8133258, 0.1219457, -0.7578775, 0.6509804, 1, 0, 1,
-0.8125849, 1.18736, -1.25833, 0.6431373, 1, 0, 1,
-0.8110724, 1.22189, 0.0784227, 0.6392157, 1, 0, 1,
-0.8088853, -1.137413, -2.569923, 0.6313726, 1, 0, 1,
-0.8048455, 2.091184, -0.5979401, 0.627451, 1, 0, 1,
-0.8004205, 0.3940007, -1.7948, 0.6196079, 1, 0, 1,
-0.7969364, -0.6206177, -1.537445, 0.6156863, 1, 0, 1,
-0.7964027, -0.6277604, -3.17066, 0.6078432, 1, 0, 1,
-0.7903109, -0.6477806, -2.873013, 0.6039216, 1, 0, 1,
-0.7892497, 1.894273, 1.577942, 0.5960785, 1, 0, 1,
-0.7871606, 0.3183432, -1.132339, 0.5882353, 1, 0, 1,
-0.7839027, -1.444856, -1.88413, 0.5843138, 1, 0, 1,
-0.7821582, 0.8063771, -1.289886, 0.5764706, 1, 0, 1,
-0.7816925, -0.9358791, -2.978662, 0.572549, 1, 0, 1,
-0.7787876, 2.048391, 0.2206575, 0.5647059, 1, 0, 1,
-0.7745999, 2.079824, 1.215237, 0.5607843, 1, 0, 1,
-0.7707497, -0.07860116, -2.879866, 0.5529412, 1, 0, 1,
-0.7669491, -0.1617856, -0.5470478, 0.5490196, 1, 0, 1,
-0.7628665, -1.265827, -1.95663, 0.5411765, 1, 0, 1,
-0.753885, 1.245065, -1.356102, 0.5372549, 1, 0, 1,
-0.7530997, 1.161282, -0.8724036, 0.5294118, 1, 0, 1,
-0.7504685, 0.5707361, -1.698138, 0.5254902, 1, 0, 1,
-0.7472295, -0.1729321, -2.532764, 0.5176471, 1, 0, 1,
-0.7459743, -1.484274, -2.503203, 0.5137255, 1, 0, 1,
-0.7378667, 0.794591, -1.367508, 0.5058824, 1, 0, 1,
-0.7364953, -0.5690897, -1.607174, 0.5019608, 1, 0, 1,
-0.7355361, 1.014227, -1.148382, 0.4941176, 1, 0, 1,
-0.7310937, -1.242265, -2.05637, 0.4862745, 1, 0, 1,
-0.7298836, -0.2518826, -3.596354, 0.4823529, 1, 0, 1,
-0.7297297, 0.8852039, -2.190098, 0.4745098, 1, 0, 1,
-0.725439, 0.7827483, -0.5703529, 0.4705882, 1, 0, 1,
-0.7243177, -0.8823236, -3.460456, 0.4627451, 1, 0, 1,
-0.719628, -0.8248808, -2.159508, 0.4588235, 1, 0, 1,
-0.7148462, 1.850432, 0.02871621, 0.4509804, 1, 0, 1,
-0.714256, -0.1768248, -2.546285, 0.4470588, 1, 0, 1,
-0.7129251, 0.9266638, -1.869364, 0.4392157, 1, 0, 1,
-0.7106094, -0.4615384, -1.599882, 0.4352941, 1, 0, 1,
-0.7063153, 0.4645964, -1.002054, 0.427451, 1, 0, 1,
-0.7055954, -0.297002, -0.1957133, 0.4235294, 1, 0, 1,
-0.703787, 0.8068905, -0.8083858, 0.4156863, 1, 0, 1,
-0.7009614, 0.3424713, -1.39221, 0.4117647, 1, 0, 1,
-0.691851, -1.540729, -2.100855, 0.4039216, 1, 0, 1,
-0.6815793, 0.4181981, -2.607813, 0.3960784, 1, 0, 1,
-0.6748307, 0.6727026, -0.6962694, 0.3921569, 1, 0, 1,
-0.6596922, -1.894987, -3.126173, 0.3843137, 1, 0, 1,
-0.657357, 1.486499, -0.2867833, 0.3803922, 1, 0, 1,
-0.6544115, -1.870605, -3.203268, 0.372549, 1, 0, 1,
-0.6514207, -0.871522, -1.709227, 0.3686275, 1, 0, 1,
-0.6489218, -1.250107, -4.071536, 0.3607843, 1, 0, 1,
-0.6393639, -1.340039, -1.489025, 0.3568628, 1, 0, 1,
-0.6372832, 0.1958585, -3.264747, 0.3490196, 1, 0, 1,
-0.629341, -0.4769939, -2.068689, 0.345098, 1, 0, 1,
-0.6225452, 0.6316169, -1.73151, 0.3372549, 1, 0, 1,
-0.6222551, -0.6472098, -1.700724, 0.3333333, 1, 0, 1,
-0.6215414, -1.220389, -1.553706, 0.3254902, 1, 0, 1,
-0.6212672, -0.3330414, -2.716414, 0.3215686, 1, 0, 1,
-0.6211535, -1.1036, -1.496101, 0.3137255, 1, 0, 1,
-0.6191722, 0.4647197, -1.573535, 0.3098039, 1, 0, 1,
-0.6191385, 2.017764, -0.2358562, 0.3019608, 1, 0, 1,
-0.6170692, 1.534794, 0.2752505, 0.2941177, 1, 0, 1,
-0.6165807, 1.094634, -1.396493, 0.2901961, 1, 0, 1,
-0.6153117, -0.6330047, -1.807894, 0.282353, 1, 0, 1,
-0.6121156, 0.4881154, -0.4632246, 0.2784314, 1, 0, 1,
-0.6092479, 0.5547253, -0.252927, 0.2705882, 1, 0, 1,
-0.6084625, 2.506037, -0.5032775, 0.2666667, 1, 0, 1,
-0.6061024, 0.6518818, -2.780252, 0.2588235, 1, 0, 1,
-0.6018286, 0.1571307, -3.561788, 0.254902, 1, 0, 1,
-0.6017186, 0.3341414, 0.05096651, 0.2470588, 1, 0, 1,
-0.5960594, -0.4344274, -1.610291, 0.2431373, 1, 0, 1,
-0.5921775, -0.3970212, -1.900028, 0.2352941, 1, 0, 1,
-0.5882199, -1.856064, -3.724133, 0.2313726, 1, 0, 1,
-0.5851033, 0.1444169, -2.185229, 0.2235294, 1, 0, 1,
-0.5827423, 1.249846, -0.2610345, 0.2196078, 1, 0, 1,
-0.5811927, 1.690497, 0.3668858, 0.2117647, 1, 0, 1,
-0.5794532, -2.648311, -3.314234, 0.2078431, 1, 0, 1,
-0.5781721, -0.3762065, -1.741596, 0.2, 1, 0, 1,
-0.5778391, -0.6867728, -2.900979, 0.1921569, 1, 0, 1,
-0.574788, 1.088933, -0.3379459, 0.1882353, 1, 0, 1,
-0.5693277, -1.50371, -3.914631, 0.1803922, 1, 0, 1,
-0.5664886, -0.246115, -0.8554598, 0.1764706, 1, 0, 1,
-0.5628088, 0.4491706, -0.7846338, 0.1686275, 1, 0, 1,
-0.5591586, -0.4570359, -0.7647393, 0.1647059, 1, 0, 1,
-0.5483916, 0.1149449, -2.120029, 0.1568628, 1, 0, 1,
-0.5464361, -0.9386901, -3.222208, 0.1529412, 1, 0, 1,
-0.5386618, -0.9424823, -4.338045, 0.145098, 1, 0, 1,
-0.5358895, 0.14481, -1.532704, 0.1411765, 1, 0, 1,
-0.5324241, -1.831814, -2.81315, 0.1333333, 1, 0, 1,
-0.5315642, 0.3934272, -0.7832935, 0.1294118, 1, 0, 1,
-0.5283282, 0.164073, -2.863835, 0.1215686, 1, 0, 1,
-0.5269894, -1.513069, -3.237271, 0.1176471, 1, 0, 1,
-0.5269635, -2.299724, -2.787052, 0.1098039, 1, 0, 1,
-0.5235953, -1.845644, -1.990087, 0.1058824, 1, 0, 1,
-0.5233253, 0.38359, -1.483605, 0.09803922, 1, 0, 1,
-0.5208597, -0.5411936, -1.164297, 0.09019608, 1, 0, 1,
-0.5078352, 1.041068, -0.3589977, 0.08627451, 1, 0, 1,
-0.4973668, 1.218685, -0.4698014, 0.07843138, 1, 0, 1,
-0.4938097, 1.208344, -2.153421, 0.07450981, 1, 0, 1,
-0.4910084, 1.290188, -0.2236148, 0.06666667, 1, 0, 1,
-0.4900127, 0.657782, 1.009789, 0.0627451, 1, 0, 1,
-0.4890512, 2.658104, -1.9124, 0.05490196, 1, 0, 1,
-0.4883675, 0.7234792, -3.763123, 0.05098039, 1, 0, 1,
-0.487943, -0.003582494, -1.370174, 0.04313726, 1, 0, 1,
-0.4871612, 0.9981298, -0.9303736, 0.03921569, 1, 0, 1,
-0.4834058, 1.233726, -1.436874, 0.03137255, 1, 0, 1,
-0.4816723, -1.078689, 0.2973919, 0.02745098, 1, 0, 1,
-0.4787993, 1.894012, -1.051776, 0.01960784, 1, 0, 1,
-0.4745581, -0.2207326, -2.229989, 0.01568628, 1, 0, 1,
-0.4723223, 0.7155653, -0.8923176, 0.007843138, 1, 0, 1,
-0.4720938, 0.9476891, -0.2134498, 0.003921569, 1, 0, 1,
-0.4610355, 1.478654, -1.243778, 0, 1, 0.003921569, 1,
-0.45966, 1.101751, -0.02395519, 0, 1, 0.01176471, 1,
-0.4577794, 0.3464065, -0.03217956, 0, 1, 0.01568628, 1,
-0.4574184, -0.4485867, -3.816725, 0, 1, 0.02352941, 1,
-0.4563408, 1.427792, 1.88104, 0, 1, 0.02745098, 1,
-0.4497679, 1.736987, -0.2083531, 0, 1, 0.03529412, 1,
-0.4488958, 1.767874, -0.8134061, 0, 1, 0.03921569, 1,
-0.4428762, -0.7938893, -3.206461, 0, 1, 0.04705882, 1,
-0.4424642, -1.098837, -4.97127, 0, 1, 0.05098039, 1,
-0.4371716, -1.483413, -2.704421, 0, 1, 0.05882353, 1,
-0.4365735, 0.5732864, -0.9962299, 0, 1, 0.0627451, 1,
-0.4215456, 0.5286862, -0.4012728, 0, 1, 0.07058824, 1,
-0.4206493, 0.2926047, -1.665052, 0, 1, 0.07450981, 1,
-0.417099, -0.2340332, -2.779858, 0, 1, 0.08235294, 1,
-0.4166636, -1.888513, -3.076549, 0, 1, 0.08627451, 1,
-0.416307, -1.398661, -0.8994298, 0, 1, 0.09411765, 1,
-0.4135773, -0.2081321, -1.846193, 0, 1, 0.1019608, 1,
-0.4062873, 1.339883, 0.05856227, 0, 1, 0.1058824, 1,
-0.4045665, 1.925948, -0.4366584, 0, 1, 0.1137255, 1,
-0.4003641, 0.02999056, -0.5022309, 0, 1, 0.1176471, 1,
-0.3998258, -0.3146483, -3.309721, 0, 1, 0.1254902, 1,
-0.3993007, -0.4259681, -2.089651, 0, 1, 0.1294118, 1,
-0.3943824, 0.1560567, -1.197857, 0, 1, 0.1372549, 1,
-0.3906809, 0.02525145, -1.892553, 0, 1, 0.1411765, 1,
-0.3890636, -0.4566526, -2.574792, 0, 1, 0.1490196, 1,
-0.3884725, 0.207827, -0.4488759, 0, 1, 0.1529412, 1,
-0.3858677, -1.436108, -1.053721, 0, 1, 0.1607843, 1,
-0.3850634, -1.838803, -3.674141, 0, 1, 0.1647059, 1,
-0.3817166, 0.2805906, -2.257114, 0, 1, 0.172549, 1,
-0.3735462, 1.015667, -0.3135282, 0, 1, 0.1764706, 1,
-0.3733719, -2.142951, -2.030453, 0, 1, 0.1843137, 1,
-0.3730495, -1.484439, -2.090373, 0, 1, 0.1882353, 1,
-0.3722951, -0.4531695, -1.691781, 0, 1, 0.1960784, 1,
-0.37226, -1.406816, -4.094838, 0, 1, 0.2039216, 1,
-0.3688351, 1.606413, -0.3929101, 0, 1, 0.2078431, 1,
-0.3676689, -0.5259913, -2.128678, 0, 1, 0.2156863, 1,
-0.3661474, 0.5284343, -0.9496133, 0, 1, 0.2196078, 1,
-0.363562, -1.510312, -2.274749, 0, 1, 0.227451, 1,
-0.3602147, 0.3585711, 0.3092857, 0, 1, 0.2313726, 1,
-0.3579319, -0.9050369, -3.743605, 0, 1, 0.2392157, 1,
-0.3571683, 0.1608411, -2.256122, 0, 1, 0.2431373, 1,
-0.3566518, 0.9105665, 0.3354474, 0, 1, 0.2509804, 1,
-0.3532031, -0.3542356, -1.671829, 0, 1, 0.254902, 1,
-0.3514321, 1.894911, 0.6389994, 0, 1, 0.2627451, 1,
-0.3505886, -0.2119405, -1.960981, 0, 1, 0.2666667, 1,
-0.3487415, -1.139982, -2.965983, 0, 1, 0.2745098, 1,
-0.3476779, 0.9051422, -0.6171759, 0, 1, 0.2784314, 1,
-0.3460296, 2.459373, -1.346308, 0, 1, 0.2862745, 1,
-0.344386, 0.2873395, -0.7936199, 0, 1, 0.2901961, 1,
-0.340155, 1.255031, 0.4590189, 0, 1, 0.2980392, 1,
-0.3401543, -0.1046459, -2.071057, 0, 1, 0.3058824, 1,
-0.3390021, 1.17226, 0.7219952, 0, 1, 0.3098039, 1,
-0.3362356, 1.2637, -1.390347, 0, 1, 0.3176471, 1,
-0.33334, -0.336486, -1.653327, 0, 1, 0.3215686, 1,
-0.3307427, -0.8420097, -2.318812, 0, 1, 0.3294118, 1,
-0.3282346, 0.5036668, -0.334961, 0, 1, 0.3333333, 1,
-0.3263856, 0.7539855, -0.01933128, 0, 1, 0.3411765, 1,
-0.3245993, -1.00253, -2.951829, 0, 1, 0.345098, 1,
-0.323015, -0.8784842, -3.704457, 0, 1, 0.3529412, 1,
-0.3138236, -0.6886307, -4.094446, 0, 1, 0.3568628, 1,
-0.3133869, 0.9718632, -1.078844, 0, 1, 0.3647059, 1,
-0.3120483, -0.2529154, -2.607019, 0, 1, 0.3686275, 1,
-0.3112651, -0.2853149, -0.7554072, 0, 1, 0.3764706, 1,
-0.3100337, 0.8825357, -0.344186, 0, 1, 0.3803922, 1,
-0.3083907, -1.243085, -4.831829, 0, 1, 0.3882353, 1,
-0.3007518, 1.489813, 1.032878, 0, 1, 0.3921569, 1,
-0.2985426, 0.3464525, -2.404453, 0, 1, 0.4, 1,
-0.2981581, 0.8699583, -0.8683187, 0, 1, 0.4078431, 1,
-0.2953852, -2.122676, -4.667949, 0, 1, 0.4117647, 1,
-0.2941514, 0.02514307, -2.987798, 0, 1, 0.4196078, 1,
-0.2928856, -0.9514848, -5.002484, 0, 1, 0.4235294, 1,
-0.2906178, 0.8983361, -3.000489, 0, 1, 0.4313726, 1,
-0.2883833, -0.5182202, -3.158351, 0, 1, 0.4352941, 1,
-0.2813772, 0.3341359, -0.3466853, 0, 1, 0.4431373, 1,
-0.2792165, -1.141168, -3.683258, 0, 1, 0.4470588, 1,
-0.2786532, -1.33635, -3.764551, 0, 1, 0.454902, 1,
-0.2771735, 0.3091722, -1.26144, 0, 1, 0.4588235, 1,
-0.275681, 0.3721602, 0.4578376, 0, 1, 0.4666667, 1,
-0.2690376, 1.284212, -0.01847222, 0, 1, 0.4705882, 1,
-0.2638291, 0.1931874, -0.5625978, 0, 1, 0.4784314, 1,
-0.2624076, 1.678271, 0.8729274, 0, 1, 0.4823529, 1,
-0.2610129, 1.095134, -1.085713, 0, 1, 0.4901961, 1,
-0.2571641, 0.8257899, 0.6880801, 0, 1, 0.4941176, 1,
-0.2455047, 1.507077, 0.07465421, 0, 1, 0.5019608, 1,
-0.2419549, 0.2031792, -1.588691, 0, 1, 0.509804, 1,
-0.2334425, 1.552436, -0.3367137, 0, 1, 0.5137255, 1,
-0.233286, -0.6528978, -2.177872, 0, 1, 0.5215687, 1,
-0.2307576, 1.672988, -0.6008791, 0, 1, 0.5254902, 1,
-0.2300822, 0.497614, 0.004978019, 0, 1, 0.5333334, 1,
-0.2294218, -0.4187503, -1.744598, 0, 1, 0.5372549, 1,
-0.2282591, -0.2660864, -2.959218, 0, 1, 0.5450981, 1,
-0.2276781, 1.625426, -0.2564135, 0, 1, 0.5490196, 1,
-0.2267296, 0.2763632, -1.060616, 0, 1, 0.5568628, 1,
-0.2256815, -0.06009366, -1.337686, 0, 1, 0.5607843, 1,
-0.2254037, -1.42846, -2.880226, 0, 1, 0.5686275, 1,
-0.2187677, -1.332438, -2.005749, 0, 1, 0.572549, 1,
-0.217157, -1.764585, -2.71155, 0, 1, 0.5803922, 1,
-0.2138758, -0.05086625, -0.4395079, 0, 1, 0.5843138, 1,
-0.1922826, 1.141022, -1.156703, 0, 1, 0.5921569, 1,
-0.1911694, -0.1274248, -3.652884, 0, 1, 0.5960785, 1,
-0.186113, -0.6662634, -2.689743, 0, 1, 0.6039216, 1,
-0.1844282, -1.179251, -3.455792, 0, 1, 0.6117647, 1,
-0.1831312, 0.1648438, -1.524122, 0, 1, 0.6156863, 1,
-0.1823294, -0.2237239, -2.691442, 0, 1, 0.6235294, 1,
-0.1823163, 0.7259608, -0.3770392, 0, 1, 0.627451, 1,
-0.1805045, -0.7893121, -1.711719, 0, 1, 0.6352941, 1,
-0.1734655, -1.483765, -1.326038, 0, 1, 0.6392157, 1,
-0.1733295, 1.575531, 0.6998783, 0, 1, 0.6470588, 1,
-0.1726956, -0.2812062, -2.248654, 0, 1, 0.6509804, 1,
-0.1722141, 0.6425957, -0.339284, 0, 1, 0.6588235, 1,
-0.1662513, 0.726906, 0.9977644, 0, 1, 0.6627451, 1,
-0.1660632, 0.5179191, -0.05130067, 0, 1, 0.6705883, 1,
-0.1574828, -0.4414679, -3.215141, 0, 1, 0.6745098, 1,
-0.155459, -1.321585, -2.858833, 0, 1, 0.682353, 1,
-0.1493695, 3.941445, -0.9997613, 0, 1, 0.6862745, 1,
-0.1489335, -0.7132125, -3.971353, 0, 1, 0.6941177, 1,
-0.1464703, 1.082172, -0.582687, 0, 1, 0.7019608, 1,
-0.1427484, 0.3855872, -1.178383, 0, 1, 0.7058824, 1,
-0.1425598, -0.1658906, -2.478855, 0, 1, 0.7137255, 1,
-0.139785, -0.6970182, -3.558166, 0, 1, 0.7176471, 1,
-0.1329784, -0.2951757, -2.302982, 0, 1, 0.7254902, 1,
-0.1305828, -0.05547095, -3.280557, 0, 1, 0.7294118, 1,
-0.1276897, -1.84339, -2.233081, 0, 1, 0.7372549, 1,
-0.1257664, 1.227691, -0.4998552, 0, 1, 0.7411765, 1,
-0.1207513, 0.05612355, -1.535595, 0, 1, 0.7490196, 1,
-0.1203706, 0.1583852, 0.3311154, 0, 1, 0.7529412, 1,
-0.119182, -1.467016, -3.88383, 0, 1, 0.7607843, 1,
-0.1186121, 0.5014523, 0.5471544, 0, 1, 0.7647059, 1,
-0.118611, -0.6067099, -2.43261, 0, 1, 0.772549, 1,
-0.1034234, 0.1910945, 0.6113096, 0, 1, 0.7764706, 1,
-0.1030298, -0.1247795, -2.575156, 0, 1, 0.7843137, 1,
-0.09848166, -0.002464358, -0.5709436, 0, 1, 0.7882353, 1,
-0.09785835, 0.2602949, -2.005355, 0, 1, 0.7960784, 1,
-0.09413203, 0.9047824, 0.149744, 0, 1, 0.8039216, 1,
-0.09361999, 0.4581433, 0.01382124, 0, 1, 0.8078431, 1,
-0.09271504, 0.2923501, 0.1144794, 0, 1, 0.8156863, 1,
-0.0925163, -0.05425161, -2.090406, 0, 1, 0.8196079, 1,
-0.09190562, 0.5673016, -0.9419693, 0, 1, 0.827451, 1,
-0.08854302, -0.1192502, -3.207328, 0, 1, 0.8313726, 1,
-0.08435836, -0.3308594, -3.289211, 0, 1, 0.8392157, 1,
-0.08402912, 0.7378054, -0.04026354, 0, 1, 0.8431373, 1,
-0.0789225, -0.3090453, -2.193367, 0, 1, 0.8509804, 1,
-0.07501359, 1.096958, 1.145746, 0, 1, 0.854902, 1,
-0.07390266, 0.1352017, -1.062101, 0, 1, 0.8627451, 1,
-0.07244366, -0.6815313, -2.711024, 0, 1, 0.8666667, 1,
-0.07183227, 1.190239, -1.027614, 0, 1, 0.8745098, 1,
-0.06670571, 1.776211, 1.196627, 0, 1, 0.8784314, 1,
-0.06300941, -0.7677395, -2.58113, 0, 1, 0.8862745, 1,
-0.06186302, -0.8495749, -5.121879, 0, 1, 0.8901961, 1,
-0.06108867, 0.4445897, 1.577475, 0, 1, 0.8980392, 1,
-0.06057987, 0.223872, 0.2235496, 0, 1, 0.9058824, 1,
-0.05928627, -1.150458, -3.512168, 0, 1, 0.9098039, 1,
-0.05870807, 1.513938, -0.02742222, 0, 1, 0.9176471, 1,
-0.05675592, 0.1885424, -2.569443, 0, 1, 0.9215686, 1,
-0.0478537, -1.195591, -2.042529, 0, 1, 0.9294118, 1,
-0.04519794, -0.2944046, -3.690691, 0, 1, 0.9333333, 1,
-0.04487733, -0.1840623, -4.307795, 0, 1, 0.9411765, 1,
-0.04480667, -0.1579771, -4.714575, 0, 1, 0.945098, 1,
-0.03371707, 0.2470605, 1.860526, 0, 1, 0.9529412, 1,
-0.03320471, 0.394156, -0.2461306, 0, 1, 0.9568627, 1,
-0.02966489, -0.1086291, -2.771628, 0, 1, 0.9647059, 1,
-0.0296111, 0.2065457, -1.959408, 0, 1, 0.9686275, 1,
-0.02462928, -0.05830831, -0.9697611, 0, 1, 0.9764706, 1,
-0.01846208, 0.8903257, -1.851976, 0, 1, 0.9803922, 1,
-0.01835991, -0.1700777, -2.796129, 0, 1, 0.9882353, 1,
-0.0160429, 1.600582, -0.1665651, 0, 1, 0.9921569, 1,
-0.007351358, -0.7763826, -1.643819, 0, 1, 1, 1,
-0.005543873, -0.8494359, -4.896406, 0, 0.9921569, 1, 1,
-0.00547928, -0.395271, -3.619247, 0, 0.9882353, 1, 1,
-0.003814461, 1.043521, -1.157929, 0, 0.9803922, 1, 1,
-0.001147449, -0.9244179, -2.392309, 0, 0.9764706, 1, 1,
0.0004679763, 0.9747592, 0.8678949, 0, 0.9686275, 1, 1,
0.0009698845, -1.959498, 3.769187, 0, 0.9647059, 1, 1,
0.001650081, -0.1493214, 1.272654, 0, 0.9568627, 1, 1,
0.001837048, 0.2313989, 0.9944002, 0, 0.9529412, 1, 1,
0.002696283, 0.7914836, 0.2847827, 0, 0.945098, 1, 1,
0.002930867, 0.2705041, -1.149018, 0, 0.9411765, 1, 1,
0.004355273, -0.3031479, 4.470099, 0, 0.9333333, 1, 1,
0.004560438, -1.050752, 5.008723, 0, 0.9294118, 1, 1,
0.008435262, 0.3170266, -1.714075, 0, 0.9215686, 1, 1,
0.009697146, -1.566314, 3.54105, 0, 0.9176471, 1, 1,
0.0117359, 0.3039851, -0.3278845, 0, 0.9098039, 1, 1,
0.0153312, 1.15366, -0.2741171, 0, 0.9058824, 1, 1,
0.01670784, -0.1943357, 4.486257, 0, 0.8980392, 1, 1,
0.01885767, -1.50772, 2.761946, 0, 0.8901961, 1, 1,
0.01996161, -0.2785204, 2.124018, 0, 0.8862745, 1, 1,
0.0201378, 0.1787505, 0.6538572, 0, 0.8784314, 1, 1,
0.02292439, -1.39943, 3.542202, 0, 0.8745098, 1, 1,
0.03181198, -1.386272, 1.625581, 0, 0.8666667, 1, 1,
0.0344302, -1.494223, 3.199678, 0, 0.8627451, 1, 1,
0.04381356, -0.6123232, 2.978018, 0, 0.854902, 1, 1,
0.04415065, 0.9310182, 0.4876024, 0, 0.8509804, 1, 1,
0.04682986, -1.071553, 4.226043, 0, 0.8431373, 1, 1,
0.0528222, 0.2363143, 0.7683426, 0, 0.8392157, 1, 1,
0.05902746, 0.6286562, 0.6446146, 0, 0.8313726, 1, 1,
0.05955782, -0.8361492, 1.949759, 0, 0.827451, 1, 1,
0.06113728, -1.191575, 4.785109, 0, 0.8196079, 1, 1,
0.06175372, -0.4931455, 2.707839, 0, 0.8156863, 1, 1,
0.06458156, 0.37237, -0.1817307, 0, 0.8078431, 1, 1,
0.0680052, 0.735287, -0.2045546, 0, 0.8039216, 1, 1,
0.07142902, -1.071318, 3.112759, 0, 0.7960784, 1, 1,
0.07264818, 0.7147635, -0.8906766, 0, 0.7882353, 1, 1,
0.07362492, -0.8613357, 0.3177635, 0, 0.7843137, 1, 1,
0.07390189, 0.2817303, 0.1229995, 0, 0.7764706, 1, 1,
0.0743542, 1.425706, 1.15494, 0, 0.772549, 1, 1,
0.07556502, -0.2137617, 2.060143, 0, 0.7647059, 1, 1,
0.07569233, -0.7132334, 0.7004198, 0, 0.7607843, 1, 1,
0.07748332, 0.1520262, 0.1841865, 0, 0.7529412, 1, 1,
0.07837403, 1.298932, -0.1297895, 0, 0.7490196, 1, 1,
0.07992847, 1.029118, 0.09342179, 0, 0.7411765, 1, 1,
0.08078745, 1.016281, 0.1951876, 0, 0.7372549, 1, 1,
0.08112595, -1.2117, 4.499636, 0, 0.7294118, 1, 1,
0.08189122, -0.3804365, 1.974954, 0, 0.7254902, 1, 1,
0.08209644, -1.087147, 3.269904, 0, 0.7176471, 1, 1,
0.08209946, -0.2971583, 3.189222, 0, 0.7137255, 1, 1,
0.08361615, -1.681591, 4.409083, 0, 0.7058824, 1, 1,
0.08448911, -0.5983743, 1.8376, 0, 0.6980392, 1, 1,
0.08519609, 0.1983642, 1.400293, 0, 0.6941177, 1, 1,
0.08875814, -0.2755934, 2.440459, 0, 0.6862745, 1, 1,
0.08914864, -1.930692, 3.938169, 0, 0.682353, 1, 1,
0.09415174, -0.8218505, 3.5661, 0, 0.6745098, 1, 1,
0.09524, -0.4801388, 2.8712, 0, 0.6705883, 1, 1,
0.09885208, 1.241501, 0.316977, 0, 0.6627451, 1, 1,
0.1117643, -1.592352, 3.379061, 0, 0.6588235, 1, 1,
0.1150986, -0.4914285, 4.116234, 0, 0.6509804, 1, 1,
0.1159425, -0.6007583, 4.568455, 0, 0.6470588, 1, 1,
0.1251292, -1.416221, 0.4573783, 0, 0.6392157, 1, 1,
0.1281139, -0.8483881, 4.376911, 0, 0.6352941, 1, 1,
0.1328775, -0.1870654, 3.623168, 0, 0.627451, 1, 1,
0.1331785, -0.4165047, 3.044613, 0, 0.6235294, 1, 1,
0.1335069, -0.2791321, 3.326056, 0, 0.6156863, 1, 1,
0.1341017, -3.107701, 2.189741, 0, 0.6117647, 1, 1,
0.1368224, -1.587274, 3.191782, 0, 0.6039216, 1, 1,
0.137629, 0.9937508, -0.421462, 0, 0.5960785, 1, 1,
0.138647, 1.57192, -0.4071669, 0, 0.5921569, 1, 1,
0.1431378, 0.5716635, 0.4983263, 0, 0.5843138, 1, 1,
0.1538613, 0.7401285, 0.2577294, 0, 0.5803922, 1, 1,
0.1544068, -2.01667, 1.750291, 0, 0.572549, 1, 1,
0.1585092, 1.117769, -0.9138383, 0, 0.5686275, 1, 1,
0.1662791, 0.2633351, 1.191655, 0, 0.5607843, 1, 1,
0.1705378, -0.7309511, 4.499661, 0, 0.5568628, 1, 1,
0.1730169, 0.1711795, -0.5210975, 0, 0.5490196, 1, 1,
0.1751703, 0.1380073, 0.4411411, 0, 0.5450981, 1, 1,
0.1753318, 1.357159, -0.1698151, 0, 0.5372549, 1, 1,
0.1765693, 2.42486, 0.9252294, 0, 0.5333334, 1, 1,
0.1808573, 0.3056211, 0.03160223, 0, 0.5254902, 1, 1,
0.1824241, -0.08935531, 2.916888, 0, 0.5215687, 1, 1,
0.1863184, -0.1748986, 4.014982, 0, 0.5137255, 1, 1,
0.1927667, -0.9235857, 1.484316, 0, 0.509804, 1, 1,
0.1944976, 0.3823475, 0.5498755, 0, 0.5019608, 1, 1,
0.1965048, 1.073126, -1.443879, 0, 0.4941176, 1, 1,
0.1988683, 0.2330566, 0.1852898, 0, 0.4901961, 1, 1,
0.2042639, -0.6829962, 3.728827, 0, 0.4823529, 1, 1,
0.2047002, 0.2295765, 1.123635, 0, 0.4784314, 1, 1,
0.2082646, 0.5360667, 1.034323, 0, 0.4705882, 1, 1,
0.209251, -0.5614057, 3.868421, 0, 0.4666667, 1, 1,
0.2095728, 0.5387476, 1.908442, 0, 0.4588235, 1, 1,
0.2098757, 0.251256, 0.8760203, 0, 0.454902, 1, 1,
0.2137149, 1.231863, -0.5047915, 0, 0.4470588, 1, 1,
0.2239389, -0.5384942, 3.646835, 0, 0.4431373, 1, 1,
0.2264906, 0.6248006, 1.444173, 0, 0.4352941, 1, 1,
0.2293805, 0.7229921, -0.9264397, 0, 0.4313726, 1, 1,
0.2301321, 0.4519106, -2.499388, 0, 0.4235294, 1, 1,
0.2310204, -1.802596, 3.183623, 0, 0.4196078, 1, 1,
0.2314069, -0.349158, 1.779061, 0, 0.4117647, 1, 1,
0.2352759, -0.104145, 2.381974, 0, 0.4078431, 1, 1,
0.2363678, 0.4452648, 0.3353156, 0, 0.4, 1, 1,
0.2421171, -1.126488, 1.868811, 0, 0.3921569, 1, 1,
0.2431256, -1.652484, 2.967142, 0, 0.3882353, 1, 1,
0.2463496, -1.259569, 3.647574, 0, 0.3803922, 1, 1,
0.2465489, -0.7686206, 2.599425, 0, 0.3764706, 1, 1,
0.2467378, -1.575137, 5.03023, 0, 0.3686275, 1, 1,
0.2468435, -0.7017433, 3.409798, 0, 0.3647059, 1, 1,
0.2470688, -1.09268, 3.425051, 0, 0.3568628, 1, 1,
0.2470832, -0.633063, 3.811435, 0, 0.3529412, 1, 1,
0.2485004, 2.288219, -1.239398, 0, 0.345098, 1, 1,
0.251004, 1.355528, 1.182222, 0, 0.3411765, 1, 1,
0.2524839, 1.015952, 2.58984, 0, 0.3333333, 1, 1,
0.2531716, -0.6353942, 1.232361, 0, 0.3294118, 1, 1,
0.2532952, 1.036287, -0.04036419, 0, 0.3215686, 1, 1,
0.2551118, 1.942935, 0.7274784, 0, 0.3176471, 1, 1,
0.2605415, -1.218693, 3.063259, 0, 0.3098039, 1, 1,
0.264457, 0.1334584, 0.175255, 0, 0.3058824, 1, 1,
0.2646296, -0.4664581, 3.630298, 0, 0.2980392, 1, 1,
0.2673088, 0.1834, 1.729915, 0, 0.2901961, 1, 1,
0.2689125, 0.1946378, 0.7429546, 0, 0.2862745, 1, 1,
0.2690141, 1.346391, -1.232649, 0, 0.2784314, 1, 1,
0.2785355, 1.964175, 0.8135399, 0, 0.2745098, 1, 1,
0.2849297, 1.045729, -0.2323812, 0, 0.2666667, 1, 1,
0.2860723, 2.354519, -0.5691583, 0, 0.2627451, 1, 1,
0.2865424, 1.126727, 0.5621771, 0, 0.254902, 1, 1,
0.296522, -0.2591727, 0.6903577, 0, 0.2509804, 1, 1,
0.2965419, -1.091898, 2.441573, 0, 0.2431373, 1, 1,
0.3017014, -1.461464, 3.913185, 0, 0.2392157, 1, 1,
0.3029766, -0.814365, 1.248349, 0, 0.2313726, 1, 1,
0.3036923, 0.1893356, 1.462768, 0, 0.227451, 1, 1,
0.3053429, 1.416012, 0.338464, 0, 0.2196078, 1, 1,
0.3097248, 0.6009927, 2.291898, 0, 0.2156863, 1, 1,
0.3118083, 1.440905, 0.2730511, 0, 0.2078431, 1, 1,
0.3151098, -1.313488, 2.377514, 0, 0.2039216, 1, 1,
0.3173639, -0.9043167, 3.747618, 0, 0.1960784, 1, 1,
0.3201318, 0.01374803, 1.841658, 0, 0.1882353, 1, 1,
0.3224054, 0.7886964, -0.8070354, 0, 0.1843137, 1, 1,
0.3255363, 0.9899879, 0.2541064, 0, 0.1764706, 1, 1,
0.331573, 1.771654, 0.2220262, 0, 0.172549, 1, 1,
0.3351019, 0.1092658, 1.8257, 0, 0.1647059, 1, 1,
0.3381107, -0.824066, 2.869749, 0, 0.1607843, 1, 1,
0.3388028, 2.041677, 0.636894, 0, 0.1529412, 1, 1,
0.3393667, 0.8058202, -0.271356, 0, 0.1490196, 1, 1,
0.3394993, -0.5731027, 2.005888, 0, 0.1411765, 1, 1,
0.339581, -1.78256, 2.346195, 0, 0.1372549, 1, 1,
0.3439419, -2.021002, 5.355491, 0, 0.1294118, 1, 1,
0.3484779, -0.3649349, 2.392473, 0, 0.1254902, 1, 1,
0.3492164, 1.258153, 1.136721, 0, 0.1176471, 1, 1,
0.351874, -0.7305213, 2.718292, 0, 0.1137255, 1, 1,
0.3556335, -0.2417696, 0.9329286, 0, 0.1058824, 1, 1,
0.3581848, 0.7856063, 2.215735, 0, 0.09803922, 1, 1,
0.3618922, 1.151329, 0.2733136, 0, 0.09411765, 1, 1,
0.363499, 0.4843084, -0.6352254, 0, 0.08627451, 1, 1,
0.3749133, -0.05483452, 3.542199, 0, 0.08235294, 1, 1,
0.3766264, -0.8780102, 2.694009, 0, 0.07450981, 1, 1,
0.3779193, -0.8914311, 1.768843, 0, 0.07058824, 1, 1,
0.3800179, -1.403657, 4.658213, 0, 0.0627451, 1, 1,
0.38487, 1.940766, -0.196829, 0, 0.05882353, 1, 1,
0.3857365, 0.2611606, 1.131891, 0, 0.05098039, 1, 1,
0.3883349, 0.2402408, 1.056516, 0, 0.04705882, 1, 1,
0.3909079, 0.5326362, 2.761282, 0, 0.03921569, 1, 1,
0.3949149, -0.8526378, 2.680573, 0, 0.03529412, 1, 1,
0.3964323, 0.3213001, 1.803371, 0, 0.02745098, 1, 1,
0.3991202, -0.2361561, 1.715675, 0, 0.02352941, 1, 1,
0.4054171, -0.3210715, 2.228724, 0, 0.01568628, 1, 1,
0.411435, 0.5709914, -0.8596623, 0, 0.01176471, 1, 1,
0.412259, -0.2617188, 1.094552, 0, 0.003921569, 1, 1,
0.413071, 0.1098571, 1.654949, 0.003921569, 0, 1, 1,
0.4160433, -0.05168263, 0.2470047, 0.007843138, 0, 1, 1,
0.4224634, 0.4609188, 0.4727025, 0.01568628, 0, 1, 1,
0.4226124, -0.8549638, 1.777409, 0.01960784, 0, 1, 1,
0.4241402, 1.155487, 0.6584048, 0.02745098, 0, 1, 1,
0.4282872, -0.2294445, 2.851433, 0.03137255, 0, 1, 1,
0.4302426, 0.1976424, 1.193718, 0.03921569, 0, 1, 1,
0.4332905, 1.16311, -0.1095394, 0.04313726, 0, 1, 1,
0.4332911, 0.4053633, -1.082446, 0.05098039, 0, 1, 1,
0.4362853, 1.688132, 0.9778916, 0.05490196, 0, 1, 1,
0.4395976, 0.08449697, 1.190036, 0.0627451, 0, 1, 1,
0.4497659, -2.350692, 5.154066, 0.06666667, 0, 1, 1,
0.4523723, -0.7554123, 1.003339, 0.07450981, 0, 1, 1,
0.4548824, 0.157939, 1.85691, 0.07843138, 0, 1, 1,
0.4549721, 0.2212231, 1.67602, 0.08627451, 0, 1, 1,
0.4550538, 0.7180484, -0.4787937, 0.09019608, 0, 1, 1,
0.4563478, -0.41314, 2.330057, 0.09803922, 0, 1, 1,
0.460214, 0.7500025, 1.890099, 0.1058824, 0, 1, 1,
0.4603802, -0.6417069, 2.802298, 0.1098039, 0, 1, 1,
0.464498, -0.2435867, 0.7627322, 0.1176471, 0, 1, 1,
0.4710476, 0.1058648, 1.230918, 0.1215686, 0, 1, 1,
0.4722284, 0.4982689, 1.21225, 0.1294118, 0, 1, 1,
0.4733421, 0.7653774, 1.994612, 0.1333333, 0, 1, 1,
0.4743609, -1.238157, 2.35185, 0.1411765, 0, 1, 1,
0.4765197, 0.7535757, 1.154874, 0.145098, 0, 1, 1,
0.4788118, 1.440723, -0.06872624, 0.1529412, 0, 1, 1,
0.4801377, 0.1272667, 0.3291462, 0.1568628, 0, 1, 1,
0.4809399, -1.930715, 3.564101, 0.1647059, 0, 1, 1,
0.4841161, -0.2883251, 2.588971, 0.1686275, 0, 1, 1,
0.4870887, 0.6112629, -0.1076614, 0.1764706, 0, 1, 1,
0.4876367, -0.2348111, 2.523902, 0.1803922, 0, 1, 1,
0.4895999, -1.625063, 3.287696, 0.1882353, 0, 1, 1,
0.4952822, -0.7338297, 2.220748, 0.1921569, 0, 1, 1,
0.4976617, -1.352467, 2.692972, 0.2, 0, 1, 1,
0.5046583, -0.4776093, 1.972448, 0.2078431, 0, 1, 1,
0.5107842, 0.6169768, 0.2631442, 0.2117647, 0, 1, 1,
0.522881, -0.786456, 2.323297, 0.2196078, 0, 1, 1,
0.5277413, 1.193502, -0.9783859, 0.2235294, 0, 1, 1,
0.5317392, -1.579347, 3.255474, 0.2313726, 0, 1, 1,
0.5328797, -0.7949674, 0.9167774, 0.2352941, 0, 1, 1,
0.5341933, 0.03683852, 1.023939, 0.2431373, 0, 1, 1,
0.5351256, -0.8054445, 2.99691, 0.2470588, 0, 1, 1,
0.5360731, 0.2792471, 1.309927, 0.254902, 0, 1, 1,
0.5393883, 1.657542, 1.358158, 0.2588235, 0, 1, 1,
0.5465328, -1.486233, 3.002507, 0.2666667, 0, 1, 1,
0.547218, -1.767717, 3.456643, 0.2705882, 0, 1, 1,
0.5473282, 0.8751922, 0.440916, 0.2784314, 0, 1, 1,
0.556745, 1.208053, 1.939936, 0.282353, 0, 1, 1,
0.5575532, 0.3856352, 0.7713836, 0.2901961, 0, 1, 1,
0.559348, 0.5701035, 1.300649, 0.2941177, 0, 1, 1,
0.566204, -0.8991341, 2.002477, 0.3019608, 0, 1, 1,
0.5669423, 0.4135964, -0.1391039, 0.3098039, 0, 1, 1,
0.5702897, 0.3073031, 2.191944, 0.3137255, 0, 1, 1,
0.5758998, -0.2474121, 2.080259, 0.3215686, 0, 1, 1,
0.5776162, 0.5042002, 1.351289, 0.3254902, 0, 1, 1,
0.5884626, 0.6051443, 1.318599, 0.3333333, 0, 1, 1,
0.5920896, 1.082281, 1.493364, 0.3372549, 0, 1, 1,
0.5927791, 0.9242869, -0.8911402, 0.345098, 0, 1, 1,
0.6053623, -0.2095612, 2.991846, 0.3490196, 0, 1, 1,
0.614123, 0.8684436, 0.07673696, 0.3568628, 0, 1, 1,
0.6193437, 0.01759916, 0.8079317, 0.3607843, 0, 1, 1,
0.6210377, 0.328228, 2.784736, 0.3686275, 0, 1, 1,
0.6314021, -0.1269901, 2.569262, 0.372549, 0, 1, 1,
0.6358665, -2.282955, 3.013732, 0.3803922, 0, 1, 1,
0.6359518, -1.150809, 3.635693, 0.3843137, 0, 1, 1,
0.6402407, 0.1889854, 1.56836, 0.3921569, 0, 1, 1,
0.6409797, -0.2833045, 2.420104, 0.3960784, 0, 1, 1,
0.6447306, -2.373895, 1.665551, 0.4039216, 0, 1, 1,
0.6515914, 0.3050233, -0.3529816, 0.4117647, 0, 1, 1,
0.6544576, 0.7786767, -0.6453738, 0.4156863, 0, 1, 1,
0.6628132, -0.03146472, 0.2066924, 0.4235294, 0, 1, 1,
0.6648522, 0.3954708, -1.097472, 0.427451, 0, 1, 1,
0.6758945, 0.4993934, -0.2965174, 0.4352941, 0, 1, 1,
0.6760869, 0.0420029, 2.111864, 0.4392157, 0, 1, 1,
0.6825799, -0.8698899, 2.021873, 0.4470588, 0, 1, 1,
0.6871465, 0.3762197, -0.2965507, 0.4509804, 0, 1, 1,
0.6877671, 0.6698715, 2.275292, 0.4588235, 0, 1, 1,
0.6900732, 0.3752634, 0.5174632, 0.4627451, 0, 1, 1,
0.6921654, 0.2128825, 0.9376389, 0.4705882, 0, 1, 1,
0.6942257, 0.7490029, 1.213634, 0.4745098, 0, 1, 1,
0.6996487, 0.8469947, -0.9724709, 0.4823529, 0, 1, 1,
0.7002186, -0.1479634, 1.140961, 0.4862745, 0, 1, 1,
0.7045048, -0.5831727, 2.465188, 0.4941176, 0, 1, 1,
0.705034, -1.529775, 2.897437, 0.5019608, 0, 1, 1,
0.7056825, -0.04903128, 1.936963, 0.5058824, 0, 1, 1,
0.7068017, 0.2555942, 1.799319, 0.5137255, 0, 1, 1,
0.7105694, 0.2580644, 2.078089, 0.5176471, 0, 1, 1,
0.7183248, 0.4902648, 0.5116683, 0.5254902, 0, 1, 1,
0.7214812, -1.439, 3.056554, 0.5294118, 0, 1, 1,
0.7252079, -0.2806583, 1.997503, 0.5372549, 0, 1, 1,
0.7263826, 0.8725729, 1.849918, 0.5411765, 0, 1, 1,
0.7273872, -0.5501615, 2.07662, 0.5490196, 0, 1, 1,
0.7274109, 0.7951248, 0.924092, 0.5529412, 0, 1, 1,
0.7288198, -1.642493, 1.62799, 0.5607843, 0, 1, 1,
0.731069, 2.185891, 0.2565617, 0.5647059, 0, 1, 1,
0.7367596, -0.1248341, 1.939253, 0.572549, 0, 1, 1,
0.7393269, 1.346733, -0.5273345, 0.5764706, 0, 1, 1,
0.7395032, 1.786077, 1.334818, 0.5843138, 0, 1, 1,
0.7433949, 1.259641, 0.06053399, 0.5882353, 0, 1, 1,
0.7452725, -1.209212, 2.448837, 0.5960785, 0, 1, 1,
0.7468682, 0.1230949, 0.6554371, 0.6039216, 0, 1, 1,
0.7487262, 0.1151738, 1.73986, 0.6078432, 0, 1, 1,
0.7488469, -1.391094, 1.874729, 0.6156863, 0, 1, 1,
0.7582363, 0.769008, 2.306676, 0.6196079, 0, 1, 1,
0.7623569, 0.8004683, -0.7683917, 0.627451, 0, 1, 1,
0.7635509, -1.03566, 2.232406, 0.6313726, 0, 1, 1,
0.7645849, -0.2566196, 2.57721, 0.6392157, 0, 1, 1,
0.7663814, 0.531118, 1.275461, 0.6431373, 0, 1, 1,
0.7678158, 1.28352, 1.158946, 0.6509804, 0, 1, 1,
0.7683321, 0.2012252, 1.076101, 0.654902, 0, 1, 1,
0.769168, 0.894164, 1.690008, 0.6627451, 0, 1, 1,
0.7694489, -1.827205, 3.460763, 0.6666667, 0, 1, 1,
0.7707307, 0.1615652, 2.690869, 0.6745098, 0, 1, 1,
0.7714304, 0.3562383, -0.08748465, 0.6784314, 0, 1, 1,
0.7721317, 0.5939297, 0.8086941, 0.6862745, 0, 1, 1,
0.7786168, -0.8747149, 1.49492, 0.6901961, 0, 1, 1,
0.7835739, -1.443155, 0.1316135, 0.6980392, 0, 1, 1,
0.7873816, -0.5522676, 2.282735, 0.7058824, 0, 1, 1,
0.7880945, -0.4745944, 1.693582, 0.7098039, 0, 1, 1,
0.7947584, 0.9245666, 1.789275, 0.7176471, 0, 1, 1,
0.7966515, 0.2554346, 0.927803, 0.7215686, 0, 1, 1,
0.8052548, -0.3512697, 2.881065, 0.7294118, 0, 1, 1,
0.8053105, -0.6640975, 2.505006, 0.7333333, 0, 1, 1,
0.8068846, -0.1904503, 2.438888, 0.7411765, 0, 1, 1,
0.8106837, 0.130944, 1.472064, 0.7450981, 0, 1, 1,
0.8111534, -0.5058278, 3.131284, 0.7529412, 0, 1, 1,
0.8130343, 0.06670664, 3.301942, 0.7568628, 0, 1, 1,
0.8164937, -1.213221, 1.43484, 0.7647059, 0, 1, 1,
0.8165113, 0.07573769, 1.918209, 0.7686275, 0, 1, 1,
0.8208362, -0.1940523, 3.12242, 0.7764706, 0, 1, 1,
0.8259134, 0.1791923, 2.305155, 0.7803922, 0, 1, 1,
0.8287717, 1.450882, -0.2576638, 0.7882353, 0, 1, 1,
0.8321218, 0.2357555, 2.261353, 0.7921569, 0, 1, 1,
0.8345118, -0.04628774, -0.1031924, 0.8, 0, 1, 1,
0.8352866, 0.245764, 0.0738218, 0.8078431, 0, 1, 1,
0.8368448, -0.2837817, 2.87507, 0.8117647, 0, 1, 1,
0.8370376, -0.1532504, 1.142799, 0.8196079, 0, 1, 1,
0.8377678, 0.01062642, 0.3963884, 0.8235294, 0, 1, 1,
0.8380458, -0.7423019, 3.17292, 0.8313726, 0, 1, 1,
0.8412811, -0.09706604, 2.072821, 0.8352941, 0, 1, 1,
0.8414828, -1.305748, 3.036712, 0.8431373, 0, 1, 1,
0.8466259, 0.882737, 0.7767232, 0.8470588, 0, 1, 1,
0.8483405, 1.10034, -0.3527695, 0.854902, 0, 1, 1,
0.8511616, 1.821769, 1.257335, 0.8588235, 0, 1, 1,
0.8524904, -0.9961783, 2.193351, 0.8666667, 0, 1, 1,
0.8529724, 0.0780509, 3.365582, 0.8705882, 0, 1, 1,
0.8609176, 1.458521, 0.489132, 0.8784314, 0, 1, 1,
0.8638192, -0.1792162, 1.973401, 0.8823529, 0, 1, 1,
0.8638315, 0.4464078, 0.8399506, 0.8901961, 0, 1, 1,
0.8651841, 0.3806975, 2.476379, 0.8941177, 0, 1, 1,
0.8658044, 1.299741, 1.71126, 0.9019608, 0, 1, 1,
0.8679802, 1.000946, 0.5876727, 0.9098039, 0, 1, 1,
0.8779822, -0.4647478, 1.972058, 0.9137255, 0, 1, 1,
0.8797317, -1.267449, 2.527419, 0.9215686, 0, 1, 1,
0.880659, 0.3433675, -0.5291948, 0.9254902, 0, 1, 1,
0.8838495, -1.35746, 1.714128, 0.9333333, 0, 1, 1,
0.8844676, 0.303879, 2.178105, 0.9372549, 0, 1, 1,
0.885026, 0.5957742, -1.499485, 0.945098, 0, 1, 1,
0.8851042, 0.1973485, 1.987772, 0.9490196, 0, 1, 1,
0.885523, 1.897512, -0.1203053, 0.9568627, 0, 1, 1,
0.8864835, 2.111457, 0.167583, 0.9607843, 0, 1, 1,
0.8915805, 0.6631535, -0.1674347, 0.9686275, 0, 1, 1,
0.8926551, -1.720364, 2.008585, 0.972549, 0, 1, 1,
0.8934968, 0.08337321, 1.319208, 0.9803922, 0, 1, 1,
0.8951103, -0.7468566, 3.6415, 0.9843137, 0, 1, 1,
0.8991067, 1.041436, 0.8678762, 0.9921569, 0, 1, 1,
0.8994152, 0.04815744, 0.46257, 0.9960784, 0, 1, 1,
0.9250365, -1.18289, 2.425945, 1, 0, 0.9960784, 1,
0.9272991, -0.4304567, 1.517648, 1, 0, 0.9882353, 1,
0.9466856, -0.1560239, 3.47985, 1, 0, 0.9843137, 1,
0.949519, 0.8910657, -0.7431295, 1, 0, 0.9764706, 1,
0.9511161, -0.9492499, 2.974622, 1, 0, 0.972549, 1,
0.9525841, 0.6542576, 1.912832, 1, 0, 0.9647059, 1,
0.9533232, 0.5507329, 0.2542477, 1, 0, 0.9607843, 1,
0.9632567, 0.7277583, -1.897447, 1, 0, 0.9529412, 1,
0.9636021, 0.6951049, 0.001904621, 1, 0, 0.9490196, 1,
0.9669808, 1.134739, 1.648311, 1, 0, 0.9411765, 1,
0.96964, 0.2160608, 1.347819, 1, 0, 0.9372549, 1,
0.9729854, -1.040399, 3.868193, 1, 0, 0.9294118, 1,
0.9779407, 1.550284, 1.131758, 1, 0, 0.9254902, 1,
0.9795843, -2.414639, 4.598119, 1, 0, 0.9176471, 1,
0.9900143, -1.34826, 2.480644, 1, 0, 0.9137255, 1,
0.9953697, 1.91799, 0.2208395, 1, 0, 0.9058824, 1,
0.995698, -0.5725365, 2.241446, 1, 0, 0.9019608, 1,
0.9972467, 0.4659199, 1.841965, 1, 0, 0.8941177, 1,
1.00239, -1.259931, 1.627968, 1, 0, 0.8862745, 1,
1.003857, 0.221952, 3.569526, 1, 0, 0.8823529, 1,
1.006055, -0.4351989, 0.8300167, 1, 0, 0.8745098, 1,
1.021271, -0.2336703, 1.477709, 1, 0, 0.8705882, 1,
1.027958, 1.455946, 1.723657, 1, 0, 0.8627451, 1,
1.037045, 0.42965, 0.9613434, 1, 0, 0.8588235, 1,
1.043872, 0.4267594, 2.80402, 1, 0, 0.8509804, 1,
1.046273, -0.7278497, 3.343281, 1, 0, 0.8470588, 1,
1.054446, -0.6164848, 2.178259, 1, 0, 0.8392157, 1,
1.055392, -1.018406, 3.488819, 1, 0, 0.8352941, 1,
1.066247, 0.7222272, 1.149303, 1, 0, 0.827451, 1,
1.076055, -1.676508, 5.044142, 1, 0, 0.8235294, 1,
1.078196, -1.143453, 2.488964, 1, 0, 0.8156863, 1,
1.083515, -1.279484, 3.559537, 1, 0, 0.8117647, 1,
1.091553, 1.269356, 0.5349476, 1, 0, 0.8039216, 1,
1.097407, 1.769703, 0.1058502, 1, 0, 0.7960784, 1,
1.100441, -0.2828068, 1.822153, 1, 0, 0.7921569, 1,
1.103691, -0.4899289, 2.530698, 1, 0, 0.7843137, 1,
1.109343, -1.310704, 2.868658, 1, 0, 0.7803922, 1,
1.120272, -0.3978065, 2.17376, 1, 0, 0.772549, 1,
1.123708, -0.9984308, 2.548878, 1, 0, 0.7686275, 1,
1.127279, -0.5277352, -0.1282615, 1, 0, 0.7607843, 1,
1.146717, -1.181036, 1.508468, 1, 0, 0.7568628, 1,
1.14718, 1.294574, -0.3304542, 1, 0, 0.7490196, 1,
1.148223, 0.01915436, -0.09588371, 1, 0, 0.7450981, 1,
1.149375, 0.90545, 1.908216, 1, 0, 0.7372549, 1,
1.160201, 1.243289, 2.004196, 1, 0, 0.7333333, 1,
1.163634, 1.54611, 1.607153, 1, 0, 0.7254902, 1,
1.170208, 1.712863, 1.39141, 1, 0, 0.7215686, 1,
1.175439, 1.481442, 0.8859352, 1, 0, 0.7137255, 1,
1.179572, 0.5232632, 1.204052, 1, 0, 0.7098039, 1,
1.188803, -0.6902129, 0.5991186, 1, 0, 0.7019608, 1,
1.197111, 1.224051, 0.101931, 1, 0, 0.6941177, 1,
1.202056, 0.1516721, 2.249544, 1, 0, 0.6901961, 1,
1.204529, 1.044995, -0.1092029, 1, 0, 0.682353, 1,
1.20689, 0.8284406, 1.060202, 1, 0, 0.6784314, 1,
1.207721, 1.405855, -0.03842993, 1, 0, 0.6705883, 1,
1.20808, 1.696345, -0.1597189, 1, 0, 0.6666667, 1,
1.222754, -0.4308037, 2.999616, 1, 0, 0.6588235, 1,
1.225168, -0.02205538, 1.479108, 1, 0, 0.654902, 1,
1.23258, -0.3671057, 2.503757, 1, 0, 0.6470588, 1,
1.235056, -1.021918, 2.973264, 1, 0, 0.6431373, 1,
1.235818, 0.8162628, 1.456945, 1, 0, 0.6352941, 1,
1.23843, -1.790084, 2.222956, 1, 0, 0.6313726, 1,
1.24232, 1.702325, -1.65342, 1, 0, 0.6235294, 1,
1.245897, 0.631299, -0.04774909, 1, 0, 0.6196079, 1,
1.246665, 0.3077948, 1.998445, 1, 0, 0.6117647, 1,
1.250968, 0.532958, 1.779536, 1, 0, 0.6078432, 1,
1.257702, 0.6549134, 0.5014504, 1, 0, 0.6, 1,
1.258229, -0.1788593, 0.07566752, 1, 0, 0.5921569, 1,
1.261311, -0.7821561, 2.549576, 1, 0, 0.5882353, 1,
1.27677, 1.070438, 0.934893, 1, 0, 0.5803922, 1,
1.280143, 1.801672, 0.6909501, 1, 0, 0.5764706, 1,
1.281488, 1.220834, 2.035394, 1, 0, 0.5686275, 1,
1.289394, -0.4778216, 2.291191, 1, 0, 0.5647059, 1,
1.290338, -0.5056086, 2.573029, 1, 0, 0.5568628, 1,
1.292056, -1.025543, 1.525657, 1, 0, 0.5529412, 1,
1.301792, 0.3470537, 2.707437, 1, 0, 0.5450981, 1,
1.30814, -1.267742, 2.367329, 1, 0, 0.5411765, 1,
1.309129, 0.4595217, 1.839426, 1, 0, 0.5333334, 1,
1.309479, -1.852205, 1.778694, 1, 0, 0.5294118, 1,
1.321965, -0.9962834, 3.05316, 1, 0, 0.5215687, 1,
1.333937, 1.556651, -0.9790417, 1, 0, 0.5176471, 1,
1.335022, -0.8335087, 2.917384, 1, 0, 0.509804, 1,
1.336473, -0.3278335, 1.047081, 1, 0, 0.5058824, 1,
1.348556, 1.787814, 1.265512, 1, 0, 0.4980392, 1,
1.359374, 0.9469793, 1.15983, 1, 0, 0.4901961, 1,
1.359811, -0.8027757, 2.209792, 1, 0, 0.4862745, 1,
1.367615, 0.04145274, 3.042193, 1, 0, 0.4784314, 1,
1.371883, -0.02232265, 2.493036, 1, 0, 0.4745098, 1,
1.373773, -0.6146575, 2.067266, 1, 0, 0.4666667, 1,
1.376514, 0.58603, 1.47736, 1, 0, 0.4627451, 1,
1.387741, -1.115683, 1.151561, 1, 0, 0.454902, 1,
1.399177, 1.77025, 0.6594716, 1, 0, 0.4509804, 1,
1.405771, 0.005644794, 0.08776434, 1, 0, 0.4431373, 1,
1.418152, 1.084638, -0.3935421, 1, 0, 0.4392157, 1,
1.429231, -0.346752, 3.720886, 1, 0, 0.4313726, 1,
1.444135, -1.059204, 1.748676, 1, 0, 0.427451, 1,
1.473881, -1.501148, 2.586745, 1, 0, 0.4196078, 1,
1.474344, -0.01861768, 2.736876, 1, 0, 0.4156863, 1,
1.48306, 1.492901, 0.5842047, 1, 0, 0.4078431, 1,
1.490721, -1.289333, 2.541317, 1, 0, 0.4039216, 1,
1.492379, 0.6137019, 1.738146, 1, 0, 0.3960784, 1,
1.503971, -0.5379183, 0.5295682, 1, 0, 0.3882353, 1,
1.50941, -1.300645, 2.333395, 1, 0, 0.3843137, 1,
1.517248, -1.761947, 3.992007, 1, 0, 0.3764706, 1,
1.536877, 0.4497132, 1.155492, 1, 0, 0.372549, 1,
1.538444, -0.838779, 2.194528, 1, 0, 0.3647059, 1,
1.544485, -1.638659, 2.934218, 1, 0, 0.3607843, 1,
1.545321, -0.3250498, 0.4274882, 1, 0, 0.3529412, 1,
1.548305, -0.2459474, 0.9656089, 1, 0, 0.3490196, 1,
1.583863, 0.6614974, 1.362747, 1, 0, 0.3411765, 1,
1.602184, -0.6603093, 4.411589, 1, 0, 0.3372549, 1,
1.618172, -0.817122, 3.044515, 1, 0, 0.3294118, 1,
1.627202, -0.8111255, 1.406537, 1, 0, 0.3254902, 1,
1.635409, -1.214368, 2.550539, 1, 0, 0.3176471, 1,
1.639315, 0.7150074, 1.019512, 1, 0, 0.3137255, 1,
1.684922, 0.1596427, 0.3239184, 1, 0, 0.3058824, 1,
1.693614, -1.022919, 2.566887, 1, 0, 0.2980392, 1,
1.693623, 1.226007, 0.218706, 1, 0, 0.2941177, 1,
1.741505, -0.1774174, 2.66952, 1, 0, 0.2862745, 1,
1.76873, -0.4956663, 2.167977, 1, 0, 0.282353, 1,
1.781616, -1.327599, 1.632414, 1, 0, 0.2745098, 1,
1.793008, 0.54342, 0.9421267, 1, 0, 0.2705882, 1,
1.801394, -0.2401637, 0.9792225, 1, 0, 0.2627451, 1,
1.833948, 0.03554241, 1.23812, 1, 0, 0.2588235, 1,
1.845789, 0.6424029, 3.277743, 1, 0, 0.2509804, 1,
1.865235, 0.07885021, 0.9753731, 1, 0, 0.2470588, 1,
1.86888, -1.25551, 2.988181, 1, 0, 0.2392157, 1,
1.875162, 1.659395, 0.9294408, 1, 0, 0.2352941, 1,
1.887784, 0.4298031, 1.141438, 1, 0, 0.227451, 1,
1.894955, 0.5919613, 2.41268, 1, 0, 0.2235294, 1,
1.896692, -0.1728142, 3.265934, 1, 0, 0.2156863, 1,
1.90926, 0.2942457, 2.576629, 1, 0, 0.2117647, 1,
1.94492, -0.4768021, -0.1093466, 1, 0, 0.2039216, 1,
1.951131, -1.195704, -0.2597795, 1, 0, 0.1960784, 1,
1.974508, 0.3751265, 3.118317, 1, 0, 0.1921569, 1,
1.984188, -0.1209113, -0.211124, 1, 0, 0.1843137, 1,
2.018574, 1.73205, -0.07907232, 1, 0, 0.1803922, 1,
2.026995, 1.143519, 0.234448, 1, 0, 0.172549, 1,
2.037247, -0.03761227, 1.949555, 1, 0, 0.1686275, 1,
2.052945, 1.974314, 0.08162102, 1, 0, 0.1607843, 1,
2.053419, -1.063605, 1.64474, 1, 0, 0.1568628, 1,
2.063977, 0.9299625, 2.634379, 1, 0, 0.1490196, 1,
2.10045, -0.4662192, 0.1248101, 1, 0, 0.145098, 1,
2.108458, 0.3611608, 0.124187, 1, 0, 0.1372549, 1,
2.113293, -0.02863486, 0.3845908, 1, 0, 0.1333333, 1,
2.116086, -1.215048, 0.381006, 1, 0, 0.1254902, 1,
2.13097, 0.59886, 1.801748, 1, 0, 0.1215686, 1,
2.158289, -0.3682964, 0.7478207, 1, 0, 0.1137255, 1,
2.178497, -0.03182755, -0.2212601, 1, 0, 0.1098039, 1,
2.186434, -1.938258, 3.99855, 1, 0, 0.1019608, 1,
2.18836, -0.0259528, 1.200428, 1, 0, 0.09411765, 1,
2.226056, -1.19148, 2.29158, 1, 0, 0.09019608, 1,
2.228924, -0.4782388, 0.9458253, 1, 0, 0.08235294, 1,
2.30726, -0.7944309, 1.562239, 1, 0, 0.07843138, 1,
2.36895, -0.1656474, 2.838202, 1, 0, 0.07058824, 1,
2.402872, 0.3918539, 2.153991, 1, 0, 0.06666667, 1,
2.608593, -0.7942421, 3.278325, 1, 0, 0.05882353, 1,
2.749787, 0.4478585, 1.673038, 1, 0, 0.05490196, 1,
2.931064, -0.4044243, 2.268472, 1, 0, 0.04705882, 1,
2.932597, -0.8583997, 2.206419, 1, 0, 0.04313726, 1,
3.101213, -0.5023105, 1.697432, 1, 0, 0.03529412, 1,
3.130417, -0.4562182, 1.827072, 1, 0, 0.03137255, 1,
3.174915, -0.5274323, 2.521174, 1, 0, 0.02352941, 1,
3.180978, -1.164337, 0.6712438, 1, 0, 0.01960784, 1,
3.199826, 0.2412904, 3.219556, 1, 0, 0.01176471, 1,
3.470271, 1.271661, 1.815218, 1, 0, 0.007843138, 1
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
0.004445791, -4.414281, -6.897793, 0, -0.5, 0.5, 0.5,
0.004445791, -4.414281, -6.897793, 1, -0.5, 0.5, 0.5,
0.004445791, -4.414281, -6.897793, 1, 1.5, 0.5, 0.5,
0.004445791, -4.414281, -6.897793, 0, 1.5, 0.5, 0.5
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
-4.636295, 0.3690953, -6.897793, 0, -0.5, 0.5, 0.5,
-4.636295, 0.3690953, -6.897793, 1, -0.5, 0.5, 0.5,
-4.636295, 0.3690953, -6.897793, 1, 1.5, 0.5, 0.5,
-4.636295, 0.3690953, -6.897793, 0, 1.5, 0.5, 0.5
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
-4.636295, -4.414281, 0.1168058, 0, -0.5, 0.5, 0.5,
-4.636295, -4.414281, 0.1168058, 1, -0.5, 0.5, 0.5,
-4.636295, -4.414281, 0.1168058, 1, 1.5, 0.5, 0.5,
-4.636295, -4.414281, 0.1168058, 0, 1.5, 0.5, 0.5
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
-3, -3.310425, -5.27904,
3, -3.310425, -5.27904,
-3, -3.310425, -5.27904,
-3, -3.494401, -5.548832,
-2, -3.310425, -5.27904,
-2, -3.494401, -5.548832,
-1, -3.310425, -5.27904,
-1, -3.494401, -5.548832,
0, -3.310425, -5.27904,
0, -3.494401, -5.548832,
1, -3.310425, -5.27904,
1, -3.494401, -5.548832,
2, -3.310425, -5.27904,
2, -3.494401, -5.548832,
3, -3.310425, -5.27904,
3, -3.494401, -5.548832
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
-3, -3.862353, -6.088417, 0, -0.5, 0.5, 0.5,
-3, -3.862353, -6.088417, 1, -0.5, 0.5, 0.5,
-3, -3.862353, -6.088417, 1, 1.5, 0.5, 0.5,
-3, -3.862353, -6.088417, 0, 1.5, 0.5, 0.5,
-2, -3.862353, -6.088417, 0, -0.5, 0.5, 0.5,
-2, -3.862353, -6.088417, 1, -0.5, 0.5, 0.5,
-2, -3.862353, -6.088417, 1, 1.5, 0.5, 0.5,
-2, -3.862353, -6.088417, 0, 1.5, 0.5, 0.5,
-1, -3.862353, -6.088417, 0, -0.5, 0.5, 0.5,
-1, -3.862353, -6.088417, 1, -0.5, 0.5, 0.5,
-1, -3.862353, -6.088417, 1, 1.5, 0.5, 0.5,
-1, -3.862353, -6.088417, 0, 1.5, 0.5, 0.5,
0, -3.862353, -6.088417, 0, -0.5, 0.5, 0.5,
0, -3.862353, -6.088417, 1, -0.5, 0.5, 0.5,
0, -3.862353, -6.088417, 1, 1.5, 0.5, 0.5,
0, -3.862353, -6.088417, 0, 1.5, 0.5, 0.5,
1, -3.862353, -6.088417, 0, -0.5, 0.5, 0.5,
1, -3.862353, -6.088417, 1, -0.5, 0.5, 0.5,
1, -3.862353, -6.088417, 1, 1.5, 0.5, 0.5,
1, -3.862353, -6.088417, 0, 1.5, 0.5, 0.5,
2, -3.862353, -6.088417, 0, -0.5, 0.5, 0.5,
2, -3.862353, -6.088417, 1, -0.5, 0.5, 0.5,
2, -3.862353, -6.088417, 1, 1.5, 0.5, 0.5,
2, -3.862353, -6.088417, 0, 1.5, 0.5, 0.5,
3, -3.862353, -6.088417, 0, -0.5, 0.5, 0.5,
3, -3.862353, -6.088417, 1, -0.5, 0.5, 0.5,
3, -3.862353, -6.088417, 1, 1.5, 0.5, 0.5,
3, -3.862353, -6.088417, 0, 1.5, 0.5, 0.5
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
-3.565355, -2, -5.27904,
-3.565355, 2, -5.27904,
-3.565355, -2, -5.27904,
-3.743845, -2, -5.548832,
-3.565355, 0, -5.27904,
-3.743845, 0, -5.548832,
-3.565355, 2, -5.27904,
-3.743845, 2, -5.548832
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
-4.100824, -2, -6.088417, 0, -0.5, 0.5, 0.5,
-4.100824, -2, -6.088417, 1, -0.5, 0.5, 0.5,
-4.100824, -2, -6.088417, 1, 1.5, 0.5, 0.5,
-4.100824, -2, -6.088417, 0, 1.5, 0.5, 0.5,
-4.100824, 0, -6.088417, 0, -0.5, 0.5, 0.5,
-4.100824, 0, -6.088417, 1, -0.5, 0.5, 0.5,
-4.100824, 0, -6.088417, 1, 1.5, 0.5, 0.5,
-4.100824, 0, -6.088417, 0, 1.5, 0.5, 0.5,
-4.100824, 2, -6.088417, 0, -0.5, 0.5, 0.5,
-4.100824, 2, -6.088417, 1, -0.5, 0.5, 0.5,
-4.100824, 2, -6.088417, 1, 1.5, 0.5, 0.5,
-4.100824, 2, -6.088417, 0, 1.5, 0.5, 0.5
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
-3.565355, -3.310425, -4,
-3.565355, -3.310425, 4,
-3.565355, -3.310425, -4,
-3.743845, -3.494401, -4,
-3.565355, -3.310425, -2,
-3.743845, -3.494401, -2,
-3.565355, -3.310425, 0,
-3.743845, -3.494401, 0,
-3.565355, -3.310425, 2,
-3.743845, -3.494401, 2,
-3.565355, -3.310425, 4,
-3.743845, -3.494401, 4
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
-4.100824, -3.862353, -4, 0, -0.5, 0.5, 0.5,
-4.100824, -3.862353, -4, 1, -0.5, 0.5, 0.5,
-4.100824, -3.862353, -4, 1, 1.5, 0.5, 0.5,
-4.100824, -3.862353, -4, 0, 1.5, 0.5, 0.5,
-4.100824, -3.862353, -2, 0, -0.5, 0.5, 0.5,
-4.100824, -3.862353, -2, 1, -0.5, 0.5, 0.5,
-4.100824, -3.862353, -2, 1, 1.5, 0.5, 0.5,
-4.100824, -3.862353, -2, 0, 1.5, 0.5, 0.5,
-4.100824, -3.862353, 0, 0, -0.5, 0.5, 0.5,
-4.100824, -3.862353, 0, 1, -0.5, 0.5, 0.5,
-4.100824, -3.862353, 0, 1, 1.5, 0.5, 0.5,
-4.100824, -3.862353, 0, 0, 1.5, 0.5, 0.5,
-4.100824, -3.862353, 2, 0, -0.5, 0.5, 0.5,
-4.100824, -3.862353, 2, 1, -0.5, 0.5, 0.5,
-4.100824, -3.862353, 2, 1, 1.5, 0.5, 0.5,
-4.100824, -3.862353, 2, 0, 1.5, 0.5, 0.5,
-4.100824, -3.862353, 4, 0, -0.5, 0.5, 0.5,
-4.100824, -3.862353, 4, 1, -0.5, 0.5, 0.5,
-4.100824, -3.862353, 4, 1, 1.5, 0.5, 0.5,
-4.100824, -3.862353, 4, 0, 1.5, 0.5, 0.5
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
-3.565355, -3.310425, -5.27904,
-3.565355, 4.048616, -5.27904,
-3.565355, -3.310425, 5.512651,
-3.565355, 4.048616, 5.512651,
-3.565355, -3.310425, -5.27904,
-3.565355, -3.310425, 5.512651,
-3.565355, 4.048616, -5.27904,
-3.565355, 4.048616, 5.512651,
-3.565355, -3.310425, -5.27904,
3.574246, -3.310425, -5.27904,
-3.565355, -3.310425, 5.512651,
3.574246, -3.310425, 5.512651,
-3.565355, 4.048616, -5.27904,
3.574246, 4.048616, -5.27904,
-3.565355, 4.048616, 5.512651,
3.574246, 4.048616, 5.512651,
3.574246, -3.310425, -5.27904,
3.574246, 4.048616, -5.27904,
3.574246, -3.310425, 5.512651,
3.574246, 4.048616, 5.512651,
3.574246, -3.310425, -5.27904,
3.574246, -3.310425, 5.512651,
3.574246, 4.048616, -5.27904,
3.574246, 4.048616, 5.512651
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
var radius = 7.948781;
var distance = 35.36502;
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
mvMatrix.translate( -0.004445791, -0.3690953, -0.1168058 );
mvMatrix.scale( 1.203762, 1.167866, 0.7963884 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.36502);
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
metoxuron<-read.table("metoxuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-metoxuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'metoxuron' not found
```

```r
y<-metoxuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'metoxuron' not found
```

```r
z<-metoxuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'metoxuron' not found
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
-3.46138, -0.2267324, -0.4024924, 0, 0, 1, 1, 1,
-3.127104, 1.396932, -2.336444, 1, 0, 0, 1, 1,
-2.831988, -0.9097177, -2.420705, 1, 0, 0, 1, 1,
-2.651879, -1.005285, -2.396926, 1, 0, 0, 1, 1,
-2.64335, -0.04348706, -2.500134, 1, 0, 0, 1, 1,
-2.590541, -1.048218, -2.706335, 1, 0, 0, 1, 1,
-2.570991, 0.0339746, -2.213751, 0, 0, 0, 1, 1,
-2.525103, 0.2692612, -2.076421, 0, 0, 0, 1, 1,
-2.438288, -0.005250867, -2.11832, 0, 0, 0, 1, 1,
-2.392622, 1.14323, -0.5953709, 0, 0, 0, 1, 1,
-2.375512, 0.7322102, -2.598981, 0, 0, 0, 1, 1,
-2.35974, 0.01069409, -2.285737, 0, 0, 0, 1, 1,
-2.352471, 1.262983, -0.8778137, 0, 0, 0, 1, 1,
-2.338052, -1.355623, -3.506919, 1, 1, 1, 1, 1,
-2.27352, -0.4995058, -3.351228, 1, 1, 1, 1, 1,
-2.213404, -0.1462873, -1.125875, 1, 1, 1, 1, 1,
-2.193781, 0.4022884, -1.37804, 1, 1, 1, 1, 1,
-2.172623, 0.1270462, -1.969935, 1, 1, 1, 1, 1,
-2.171815, -2.008461, -0.6375146, 1, 1, 1, 1, 1,
-2.170288, -1.210439, -2.00485, 1, 1, 1, 1, 1,
-2.115866, 0.07676728, -2.702081, 1, 1, 1, 1, 1,
-2.063595, -2.583321, -3.417506, 1, 1, 1, 1, 1,
-2.05546, -1.030958, -1.331698, 1, 1, 1, 1, 1,
-2.049335, -1.540618, -2.964533, 1, 1, 1, 1, 1,
-2.046562, 1.627318, -2.202214, 1, 1, 1, 1, 1,
-2.044704, 1.95803, -1.109646, 1, 1, 1, 1, 1,
-2.041986, 0.7724574, -1.445774, 1, 1, 1, 1, 1,
-2.033632, -0.7020551, -0.3430785, 1, 1, 1, 1, 1,
-2.008383, 0.840082, 0.1753595, 0, 0, 1, 1, 1,
-1.985203, -0.4500932, -0.785131, 1, 0, 0, 1, 1,
-1.975807, 1.723371, -0.9264619, 1, 0, 0, 1, 1,
-1.974926, -0.4771997, -0.6101864, 1, 0, 0, 1, 1,
-1.940448, -0.800979, -0.4559998, 1, 0, 0, 1, 1,
-1.903141, 0.2833963, 1.55774, 1, 0, 0, 1, 1,
-1.874565, -0.626399, -2.27723, 0, 0, 0, 1, 1,
-1.846463, 0.5082453, -0.6606567, 0, 0, 0, 1, 1,
-1.831831, -0.4909283, -0.4998579, 0, 0, 0, 1, 1,
-1.822593, 0.03716872, -1.929182, 0, 0, 0, 1, 1,
-1.81398, 0.04275453, -0.3085111, 0, 0, 0, 1, 1,
-1.801692, 0.5293986, -1.870544, 0, 0, 0, 1, 1,
-1.80016, 1.117137, 0.2035686, 0, 0, 0, 1, 1,
-1.788458, 1.316798, 0.3558886, 1, 1, 1, 1, 1,
-1.784028, -0.878887, -2.425132, 1, 1, 1, 1, 1,
-1.748954, -0.2104069, -0.2882878, 1, 1, 1, 1, 1,
-1.725554, -0.4409428, -1.692479, 1, 1, 1, 1, 1,
-1.714021, 0.231838, -1.792858, 1, 1, 1, 1, 1,
-1.712099, -0.5986525, -0.1922687, 1, 1, 1, 1, 1,
-1.708113, -2.351291, -2.563222, 1, 1, 1, 1, 1,
-1.697293, -0.7178582, -3.52079, 1, 1, 1, 1, 1,
-1.685975, 1.11507, -0.9216158, 1, 1, 1, 1, 1,
-1.681482, 1.631298, -0.09382122, 1, 1, 1, 1, 1,
-1.668249, 0.425859, -1.040136, 1, 1, 1, 1, 1,
-1.668155, -1.129007, -2.117591, 1, 1, 1, 1, 1,
-1.666993, -1.012823, -1.496914, 1, 1, 1, 1, 1,
-1.657309, 0.5631335, -1.593397, 1, 1, 1, 1, 1,
-1.650942, -0.5663869, -3.000312, 1, 1, 1, 1, 1,
-1.64647, -1.10699, -0.01002532, 0, 0, 1, 1, 1,
-1.640165, -1.360246, -1.524989, 1, 0, 0, 1, 1,
-1.638594, 0.8163645, -0.8983502, 1, 0, 0, 1, 1,
-1.637605, 1.417976, -0.5640032, 1, 0, 0, 1, 1,
-1.633211, 1.315242, 0.3026905, 1, 0, 0, 1, 1,
-1.623429, 0.4109378, -1.958944, 1, 0, 0, 1, 1,
-1.621012, 0.2946807, -1.466106, 0, 0, 0, 1, 1,
-1.615708, -0.6567163, -4.092868, 0, 0, 0, 1, 1,
-1.615335, 0.7920119, -0.9772792, 0, 0, 0, 1, 1,
-1.60543, -0.7202764, -2.24787, 0, 0, 0, 1, 1,
-1.604427, -0.6176633, -2.780064, 0, 0, 0, 1, 1,
-1.596219, -0.3242809, -3.273621, 0, 0, 0, 1, 1,
-1.58503, 0.8534909, -1.394671, 0, 0, 0, 1, 1,
-1.578541, 0.1638072, -0.8149521, 1, 1, 1, 1, 1,
-1.57578, -0.0350502, -1.120576, 1, 1, 1, 1, 1,
-1.565001, 0.6811555, -1.764399, 1, 1, 1, 1, 1,
-1.564797, -0.1746093, -0.9404457, 1, 1, 1, 1, 1,
-1.551346, 1.018553, -0.5474767, 1, 1, 1, 1, 1,
-1.548091, -1.371558, -2.422572, 1, 1, 1, 1, 1,
-1.543113, 0.3831476, 0.4370632, 1, 1, 1, 1, 1,
-1.530316, -1.176381, -3.060196, 1, 1, 1, 1, 1,
-1.529119, -0.6345556, -1.385058, 1, 1, 1, 1, 1,
-1.528218, 0.04078441, 0.5493855, 1, 1, 1, 1, 1,
-1.513269, 0.956306, -0.7588181, 1, 1, 1, 1, 1,
-1.506248, -0.9197177, -1.850588, 1, 1, 1, 1, 1,
-1.505874, 1.031761, -0.2356687, 1, 1, 1, 1, 1,
-1.494889, -0.7949584, -1.972729, 1, 1, 1, 1, 1,
-1.493142, -0.7065753, -0.05737372, 1, 1, 1, 1, 1,
-1.489057, -1.172596, -1.551351, 0, 0, 1, 1, 1,
-1.483802, -2.300002, -2.429896, 1, 0, 0, 1, 1,
-1.474711, 1.89013, -0.02602787, 1, 0, 0, 1, 1,
-1.465647, -3.203255, -1.440653, 1, 0, 0, 1, 1,
-1.465314, 0.4245836, -0.9817435, 1, 0, 0, 1, 1,
-1.460974, 0.7943287, -0.04007016, 1, 0, 0, 1, 1,
-1.457925, -0.1829474, -1.105081, 0, 0, 0, 1, 1,
-1.457103, 0.3582886, -2.168522, 0, 0, 0, 1, 1,
-1.451169, -0.7024035, -3.674315, 0, 0, 0, 1, 1,
-1.43663, -0.6489708, -3.089279, 0, 0, 0, 1, 1,
-1.43244, 0.03163899, -3.856397, 0, 0, 0, 1, 1,
-1.431207, 0.6358609, -0.03555024, 0, 0, 0, 1, 1,
-1.431014, -1.144922, -4.376629, 0, 0, 0, 1, 1,
-1.428142, 0.9040369, -2.137452, 1, 1, 1, 1, 1,
-1.425698, 0.7315798, -0.3988157, 1, 1, 1, 1, 1,
-1.419759, 0.4236908, -1.367311, 1, 1, 1, 1, 1,
-1.411694, -0.4228067, -2.665472, 1, 1, 1, 1, 1,
-1.409488, -1.146909, -2.026271, 1, 1, 1, 1, 1,
-1.405583, 1.666456, -0.6858897, 1, 1, 1, 1, 1,
-1.402153, -0.2536069, -1.559794, 1, 1, 1, 1, 1,
-1.400958, -0.9377359, -1.631488, 1, 1, 1, 1, 1,
-1.393199, -1.162955, -2.210517, 1, 1, 1, 1, 1,
-1.3881, -0.4183626, -3.529779, 1, 1, 1, 1, 1,
-1.38411, -1.323881, -2.24356, 1, 1, 1, 1, 1,
-1.380939, 0.7793553, -2.299038, 1, 1, 1, 1, 1,
-1.377413, 1.018719, -0.7699627, 1, 1, 1, 1, 1,
-1.373394, 0.5326382, -2.578992, 1, 1, 1, 1, 1,
-1.344581, -0.6480796, -0.8109922, 1, 1, 1, 1, 1,
-1.344377, 2.40573, -0.03247551, 0, 0, 1, 1, 1,
-1.343227, 0.1445974, -1.918142, 1, 0, 0, 1, 1,
-1.339663, 0.09520011, -1.879129, 1, 0, 0, 1, 1,
-1.338668, 1.608412, -2.703752, 1, 0, 0, 1, 1,
-1.330802, -0.02151584, -1.223067, 1, 0, 0, 1, 1,
-1.327451, 0.1841519, 0.4633817, 1, 0, 0, 1, 1,
-1.312598, -0.5078864, -1.888087, 0, 0, 0, 1, 1,
-1.301661, 0.8878706, -1.573892, 0, 0, 0, 1, 1,
-1.295038, -0.4135285, -4.252068, 0, 0, 0, 1, 1,
-1.291177, -0.3737529, -1.708437, 0, 0, 0, 1, 1,
-1.279805, -1.755729, -2.089676, 0, 0, 0, 1, 1,
-1.279698, -0.4935303, -0.6170945, 0, 0, 0, 1, 1,
-1.267868, -0.835855, -0.02675576, 0, 0, 0, 1, 1,
-1.265684, -0.4090094, -3.430001, 1, 1, 1, 1, 1,
-1.250888, 1.326704, 0.3466682, 1, 1, 1, 1, 1,
-1.249743, -0.3565571, -1.261553, 1, 1, 1, 1, 1,
-1.233524, -0.5366997, -2.188802, 1, 1, 1, 1, 1,
-1.226094, 0.3843895, -0.6997781, 1, 1, 1, 1, 1,
-1.220638, 0.6689398, 0.2001463, 1, 1, 1, 1, 1,
-1.216613, 0.120762, -1.807273, 1, 1, 1, 1, 1,
-1.206417, -0.7204995, -3.132078, 1, 1, 1, 1, 1,
-1.202695, -1.408427, -4.084208, 1, 1, 1, 1, 1,
-1.20146, -0.75829, -0.8121479, 1, 1, 1, 1, 1,
-1.194962, 1.414842, -1.540584, 1, 1, 1, 1, 1,
-1.188137, -0.9054236, -2.82304, 1, 1, 1, 1, 1,
-1.185547, 1.460865, -1.536624, 1, 1, 1, 1, 1,
-1.182215, -1.418798, -0.4055921, 1, 1, 1, 1, 1,
-1.180801, -0.1232515, -1.189865, 1, 1, 1, 1, 1,
-1.179776, -1.702765, -0.9697477, 0, 0, 1, 1, 1,
-1.173438, -0.209239, -2.43991, 1, 0, 0, 1, 1,
-1.162124, 1.356643, -2.578181, 1, 0, 0, 1, 1,
-1.148388, 0.4055531, -1.80205, 1, 0, 0, 1, 1,
-1.141855, -0.5388837, -0.6684604, 1, 0, 0, 1, 1,
-1.138498, 0.06671433, -1.602481, 1, 0, 0, 1, 1,
-1.13286, 0.8100067, -1.700476, 0, 0, 0, 1, 1,
-1.125755, 0.08079948, -1.512293, 0, 0, 0, 1, 1,
-1.122297, -0.4794695, -1.3692, 0, 0, 0, 1, 1,
-1.119524, -1.632853, -2.235341, 0, 0, 0, 1, 1,
-1.111044, -0.7601129, -2.519791, 0, 0, 0, 1, 1,
-1.110904, 2.074666, -0.3129154, 0, 0, 0, 1, 1,
-1.102551, -0.4179815, -3.855977, 0, 0, 0, 1, 1,
-1.096759, -1.312195, -3.877373, 1, 1, 1, 1, 1,
-1.094579, 0.2038881, -0.6560678, 1, 1, 1, 1, 1,
-1.093017, 1.738457, -0.8109752, 1, 1, 1, 1, 1,
-1.092851, -0.8612117, -1.139093, 1, 1, 1, 1, 1,
-1.0821, 2.441417, 0.8865409, 1, 1, 1, 1, 1,
-1.076492, -0.00907186, -2.366692, 1, 1, 1, 1, 1,
-1.070432, 1.488218, 0.6998848, 1, 1, 1, 1, 1,
-1.048629, -0.6992233, -1.642355, 1, 1, 1, 1, 1,
-1.042825, 0.01209413, -2.484704, 1, 1, 1, 1, 1,
-1.032736, -0.3049524, -2.389606, 1, 1, 1, 1, 1,
-1.029628, 0.8744843, -1.074229, 1, 1, 1, 1, 1,
-1.029028, -0.1588127, -1.518867, 1, 1, 1, 1, 1,
-1.01948, -0.2087541, -1.83202, 1, 1, 1, 1, 1,
-1.016287, 0.2132565, -0.5665676, 1, 1, 1, 1, 1,
-1.015164, 0.3460535, -1.890411, 1, 1, 1, 1, 1,
-1.009604, -0.2718006, -2.105733, 0, 0, 1, 1, 1,
-1.007315, -0.1153329, -0.53718, 1, 0, 0, 1, 1,
-1.004094, -0.1405708, -2.928642, 1, 0, 0, 1, 1,
-1.001871, -1.186814, -3.861739, 1, 0, 0, 1, 1,
-0.995503, 0.6672518, -1.599431, 1, 0, 0, 1, 1,
-0.9850765, -0.3287508, -3.414811, 1, 0, 0, 1, 1,
-0.9844682, 0.6785768, -1.681006, 0, 0, 0, 1, 1,
-0.9843397, 0.6608974, -1.458944, 0, 0, 0, 1, 1,
-0.9828053, -1.388803, -0.3907263, 0, 0, 0, 1, 1,
-0.977957, -0.1976969, -2.298413, 0, 0, 0, 1, 1,
-0.9730521, -1.362889, -1.559794, 0, 0, 0, 1, 1,
-0.9728649, 0.867632, -0.05534634, 0, 0, 0, 1, 1,
-0.971025, -0.2737382, -1.785696, 0, 0, 0, 1, 1,
-0.9700762, -0.441094, -2.429529, 1, 1, 1, 1, 1,
-0.9642308, -0.0804418, -2.203463, 1, 1, 1, 1, 1,
-0.963187, 2.114109, -1.501368, 1, 1, 1, 1, 1,
-0.9614536, 1.804211, -1.480835, 1, 1, 1, 1, 1,
-0.9547507, -0.4816709, -2.576855, 1, 1, 1, 1, 1,
-0.9499664, 1.070584, -1.033165, 1, 1, 1, 1, 1,
-0.9483262, 0.9665636, -1.881703, 1, 1, 1, 1, 1,
-0.9474959, 0.103463, -0.5216574, 1, 1, 1, 1, 1,
-0.9398565, -1.980264, -0.814666, 1, 1, 1, 1, 1,
-0.9391382, -0.2133604, -2.125034, 1, 1, 1, 1, 1,
-0.9390242, -0.4657108, -2.361264, 1, 1, 1, 1, 1,
-0.9331116, -0.2242544, -2.005969, 1, 1, 1, 1, 1,
-0.9329477, 0.2061711, -1.131541, 1, 1, 1, 1, 1,
-0.9295121, -1.391799, -2.740804, 1, 1, 1, 1, 1,
-0.9276938, 1.003765, 0.4143191, 1, 1, 1, 1, 1,
-0.9256772, -0.3714559, -2.381095, 0, 0, 1, 1, 1,
-0.9253535, 0.4025541, -1.203914, 1, 0, 0, 1, 1,
-0.918138, 0.6063638, -1.321028, 1, 0, 0, 1, 1,
-0.9148227, 1.337238, -0.7941224, 1, 0, 0, 1, 1,
-0.9107985, -0.04582541, -1.194056, 1, 0, 0, 1, 1,
-0.906734, -0.3794475, -0.9384016, 1, 0, 0, 1, 1,
-0.9037753, 0.3656055, -0.7780793, 0, 0, 0, 1, 1,
-0.9017192, -1.426988, -2.790009, 0, 0, 0, 1, 1,
-0.9010354, 0.1400216, -0.2113218, 0, 0, 0, 1, 1,
-0.89969, 0.770674, -1.049335, 0, 0, 0, 1, 1,
-0.890538, -1.146126, -1.774303, 0, 0, 0, 1, 1,
-0.8852794, -0.8875579, -2.315525, 0, 0, 0, 1, 1,
-0.8807434, -0.318539, 0.09408941, 0, 0, 0, 1, 1,
-0.8752673, 0.4542497, 0.2317823, 1, 1, 1, 1, 1,
-0.8722827, 2.4306, -1.341988, 1, 1, 1, 1, 1,
-0.8626581, 0.2623022, -1.810404, 1, 1, 1, 1, 1,
-0.856784, 1.373886, -0.9294837, 1, 1, 1, 1, 1,
-0.8416851, 1.334718, -0.9126911, 1, 1, 1, 1, 1,
-0.8389661, -0.4227908, -2.262356, 1, 1, 1, 1, 1,
-0.836233, 1.059241, -1.606434, 1, 1, 1, 1, 1,
-0.8324015, -1.013845, -2.814857, 1, 1, 1, 1, 1,
-0.8318344, 0.09484646, -1.856378, 1, 1, 1, 1, 1,
-0.8248984, -1.93314, -3.99964, 1, 1, 1, 1, 1,
-0.8215895, -1.037096, -0.8575054, 1, 1, 1, 1, 1,
-0.8200039, -0.9777153, -1.933529, 1, 1, 1, 1, 1,
-0.819535, -1.68602, -2.51854, 1, 1, 1, 1, 1,
-0.8173558, -1.224308, -2.584774, 1, 1, 1, 1, 1,
-0.816331, -1.17038, -3.552388, 1, 1, 1, 1, 1,
-0.8147854, 1.052758, -0.726624, 0, 0, 1, 1, 1,
-0.8133258, 0.1219457, -0.7578775, 1, 0, 0, 1, 1,
-0.8125849, 1.18736, -1.25833, 1, 0, 0, 1, 1,
-0.8110724, 1.22189, 0.0784227, 1, 0, 0, 1, 1,
-0.8088853, -1.137413, -2.569923, 1, 0, 0, 1, 1,
-0.8048455, 2.091184, -0.5979401, 1, 0, 0, 1, 1,
-0.8004205, 0.3940007, -1.7948, 0, 0, 0, 1, 1,
-0.7969364, -0.6206177, -1.537445, 0, 0, 0, 1, 1,
-0.7964027, -0.6277604, -3.17066, 0, 0, 0, 1, 1,
-0.7903109, -0.6477806, -2.873013, 0, 0, 0, 1, 1,
-0.7892497, 1.894273, 1.577942, 0, 0, 0, 1, 1,
-0.7871606, 0.3183432, -1.132339, 0, 0, 0, 1, 1,
-0.7839027, -1.444856, -1.88413, 0, 0, 0, 1, 1,
-0.7821582, 0.8063771, -1.289886, 1, 1, 1, 1, 1,
-0.7816925, -0.9358791, -2.978662, 1, 1, 1, 1, 1,
-0.7787876, 2.048391, 0.2206575, 1, 1, 1, 1, 1,
-0.7745999, 2.079824, 1.215237, 1, 1, 1, 1, 1,
-0.7707497, -0.07860116, -2.879866, 1, 1, 1, 1, 1,
-0.7669491, -0.1617856, -0.5470478, 1, 1, 1, 1, 1,
-0.7628665, -1.265827, -1.95663, 1, 1, 1, 1, 1,
-0.753885, 1.245065, -1.356102, 1, 1, 1, 1, 1,
-0.7530997, 1.161282, -0.8724036, 1, 1, 1, 1, 1,
-0.7504685, 0.5707361, -1.698138, 1, 1, 1, 1, 1,
-0.7472295, -0.1729321, -2.532764, 1, 1, 1, 1, 1,
-0.7459743, -1.484274, -2.503203, 1, 1, 1, 1, 1,
-0.7378667, 0.794591, -1.367508, 1, 1, 1, 1, 1,
-0.7364953, -0.5690897, -1.607174, 1, 1, 1, 1, 1,
-0.7355361, 1.014227, -1.148382, 1, 1, 1, 1, 1,
-0.7310937, -1.242265, -2.05637, 0, 0, 1, 1, 1,
-0.7298836, -0.2518826, -3.596354, 1, 0, 0, 1, 1,
-0.7297297, 0.8852039, -2.190098, 1, 0, 0, 1, 1,
-0.725439, 0.7827483, -0.5703529, 1, 0, 0, 1, 1,
-0.7243177, -0.8823236, -3.460456, 1, 0, 0, 1, 1,
-0.719628, -0.8248808, -2.159508, 1, 0, 0, 1, 1,
-0.7148462, 1.850432, 0.02871621, 0, 0, 0, 1, 1,
-0.714256, -0.1768248, -2.546285, 0, 0, 0, 1, 1,
-0.7129251, 0.9266638, -1.869364, 0, 0, 0, 1, 1,
-0.7106094, -0.4615384, -1.599882, 0, 0, 0, 1, 1,
-0.7063153, 0.4645964, -1.002054, 0, 0, 0, 1, 1,
-0.7055954, -0.297002, -0.1957133, 0, 0, 0, 1, 1,
-0.703787, 0.8068905, -0.8083858, 0, 0, 0, 1, 1,
-0.7009614, 0.3424713, -1.39221, 1, 1, 1, 1, 1,
-0.691851, -1.540729, -2.100855, 1, 1, 1, 1, 1,
-0.6815793, 0.4181981, -2.607813, 1, 1, 1, 1, 1,
-0.6748307, 0.6727026, -0.6962694, 1, 1, 1, 1, 1,
-0.6596922, -1.894987, -3.126173, 1, 1, 1, 1, 1,
-0.657357, 1.486499, -0.2867833, 1, 1, 1, 1, 1,
-0.6544115, -1.870605, -3.203268, 1, 1, 1, 1, 1,
-0.6514207, -0.871522, -1.709227, 1, 1, 1, 1, 1,
-0.6489218, -1.250107, -4.071536, 1, 1, 1, 1, 1,
-0.6393639, -1.340039, -1.489025, 1, 1, 1, 1, 1,
-0.6372832, 0.1958585, -3.264747, 1, 1, 1, 1, 1,
-0.629341, -0.4769939, -2.068689, 1, 1, 1, 1, 1,
-0.6225452, 0.6316169, -1.73151, 1, 1, 1, 1, 1,
-0.6222551, -0.6472098, -1.700724, 1, 1, 1, 1, 1,
-0.6215414, -1.220389, -1.553706, 1, 1, 1, 1, 1,
-0.6212672, -0.3330414, -2.716414, 0, 0, 1, 1, 1,
-0.6211535, -1.1036, -1.496101, 1, 0, 0, 1, 1,
-0.6191722, 0.4647197, -1.573535, 1, 0, 0, 1, 1,
-0.6191385, 2.017764, -0.2358562, 1, 0, 0, 1, 1,
-0.6170692, 1.534794, 0.2752505, 1, 0, 0, 1, 1,
-0.6165807, 1.094634, -1.396493, 1, 0, 0, 1, 1,
-0.6153117, -0.6330047, -1.807894, 0, 0, 0, 1, 1,
-0.6121156, 0.4881154, -0.4632246, 0, 0, 0, 1, 1,
-0.6092479, 0.5547253, -0.252927, 0, 0, 0, 1, 1,
-0.6084625, 2.506037, -0.5032775, 0, 0, 0, 1, 1,
-0.6061024, 0.6518818, -2.780252, 0, 0, 0, 1, 1,
-0.6018286, 0.1571307, -3.561788, 0, 0, 0, 1, 1,
-0.6017186, 0.3341414, 0.05096651, 0, 0, 0, 1, 1,
-0.5960594, -0.4344274, -1.610291, 1, 1, 1, 1, 1,
-0.5921775, -0.3970212, -1.900028, 1, 1, 1, 1, 1,
-0.5882199, -1.856064, -3.724133, 1, 1, 1, 1, 1,
-0.5851033, 0.1444169, -2.185229, 1, 1, 1, 1, 1,
-0.5827423, 1.249846, -0.2610345, 1, 1, 1, 1, 1,
-0.5811927, 1.690497, 0.3668858, 1, 1, 1, 1, 1,
-0.5794532, -2.648311, -3.314234, 1, 1, 1, 1, 1,
-0.5781721, -0.3762065, -1.741596, 1, 1, 1, 1, 1,
-0.5778391, -0.6867728, -2.900979, 1, 1, 1, 1, 1,
-0.574788, 1.088933, -0.3379459, 1, 1, 1, 1, 1,
-0.5693277, -1.50371, -3.914631, 1, 1, 1, 1, 1,
-0.5664886, -0.246115, -0.8554598, 1, 1, 1, 1, 1,
-0.5628088, 0.4491706, -0.7846338, 1, 1, 1, 1, 1,
-0.5591586, -0.4570359, -0.7647393, 1, 1, 1, 1, 1,
-0.5483916, 0.1149449, -2.120029, 1, 1, 1, 1, 1,
-0.5464361, -0.9386901, -3.222208, 0, 0, 1, 1, 1,
-0.5386618, -0.9424823, -4.338045, 1, 0, 0, 1, 1,
-0.5358895, 0.14481, -1.532704, 1, 0, 0, 1, 1,
-0.5324241, -1.831814, -2.81315, 1, 0, 0, 1, 1,
-0.5315642, 0.3934272, -0.7832935, 1, 0, 0, 1, 1,
-0.5283282, 0.164073, -2.863835, 1, 0, 0, 1, 1,
-0.5269894, -1.513069, -3.237271, 0, 0, 0, 1, 1,
-0.5269635, -2.299724, -2.787052, 0, 0, 0, 1, 1,
-0.5235953, -1.845644, -1.990087, 0, 0, 0, 1, 1,
-0.5233253, 0.38359, -1.483605, 0, 0, 0, 1, 1,
-0.5208597, -0.5411936, -1.164297, 0, 0, 0, 1, 1,
-0.5078352, 1.041068, -0.3589977, 0, 0, 0, 1, 1,
-0.4973668, 1.218685, -0.4698014, 0, 0, 0, 1, 1,
-0.4938097, 1.208344, -2.153421, 1, 1, 1, 1, 1,
-0.4910084, 1.290188, -0.2236148, 1, 1, 1, 1, 1,
-0.4900127, 0.657782, 1.009789, 1, 1, 1, 1, 1,
-0.4890512, 2.658104, -1.9124, 1, 1, 1, 1, 1,
-0.4883675, 0.7234792, -3.763123, 1, 1, 1, 1, 1,
-0.487943, -0.003582494, -1.370174, 1, 1, 1, 1, 1,
-0.4871612, 0.9981298, -0.9303736, 1, 1, 1, 1, 1,
-0.4834058, 1.233726, -1.436874, 1, 1, 1, 1, 1,
-0.4816723, -1.078689, 0.2973919, 1, 1, 1, 1, 1,
-0.4787993, 1.894012, -1.051776, 1, 1, 1, 1, 1,
-0.4745581, -0.2207326, -2.229989, 1, 1, 1, 1, 1,
-0.4723223, 0.7155653, -0.8923176, 1, 1, 1, 1, 1,
-0.4720938, 0.9476891, -0.2134498, 1, 1, 1, 1, 1,
-0.4610355, 1.478654, -1.243778, 1, 1, 1, 1, 1,
-0.45966, 1.101751, -0.02395519, 1, 1, 1, 1, 1,
-0.4577794, 0.3464065, -0.03217956, 0, 0, 1, 1, 1,
-0.4574184, -0.4485867, -3.816725, 1, 0, 0, 1, 1,
-0.4563408, 1.427792, 1.88104, 1, 0, 0, 1, 1,
-0.4497679, 1.736987, -0.2083531, 1, 0, 0, 1, 1,
-0.4488958, 1.767874, -0.8134061, 1, 0, 0, 1, 1,
-0.4428762, -0.7938893, -3.206461, 1, 0, 0, 1, 1,
-0.4424642, -1.098837, -4.97127, 0, 0, 0, 1, 1,
-0.4371716, -1.483413, -2.704421, 0, 0, 0, 1, 1,
-0.4365735, 0.5732864, -0.9962299, 0, 0, 0, 1, 1,
-0.4215456, 0.5286862, -0.4012728, 0, 0, 0, 1, 1,
-0.4206493, 0.2926047, -1.665052, 0, 0, 0, 1, 1,
-0.417099, -0.2340332, -2.779858, 0, 0, 0, 1, 1,
-0.4166636, -1.888513, -3.076549, 0, 0, 0, 1, 1,
-0.416307, -1.398661, -0.8994298, 1, 1, 1, 1, 1,
-0.4135773, -0.2081321, -1.846193, 1, 1, 1, 1, 1,
-0.4062873, 1.339883, 0.05856227, 1, 1, 1, 1, 1,
-0.4045665, 1.925948, -0.4366584, 1, 1, 1, 1, 1,
-0.4003641, 0.02999056, -0.5022309, 1, 1, 1, 1, 1,
-0.3998258, -0.3146483, -3.309721, 1, 1, 1, 1, 1,
-0.3993007, -0.4259681, -2.089651, 1, 1, 1, 1, 1,
-0.3943824, 0.1560567, -1.197857, 1, 1, 1, 1, 1,
-0.3906809, 0.02525145, -1.892553, 1, 1, 1, 1, 1,
-0.3890636, -0.4566526, -2.574792, 1, 1, 1, 1, 1,
-0.3884725, 0.207827, -0.4488759, 1, 1, 1, 1, 1,
-0.3858677, -1.436108, -1.053721, 1, 1, 1, 1, 1,
-0.3850634, -1.838803, -3.674141, 1, 1, 1, 1, 1,
-0.3817166, 0.2805906, -2.257114, 1, 1, 1, 1, 1,
-0.3735462, 1.015667, -0.3135282, 1, 1, 1, 1, 1,
-0.3733719, -2.142951, -2.030453, 0, 0, 1, 1, 1,
-0.3730495, -1.484439, -2.090373, 1, 0, 0, 1, 1,
-0.3722951, -0.4531695, -1.691781, 1, 0, 0, 1, 1,
-0.37226, -1.406816, -4.094838, 1, 0, 0, 1, 1,
-0.3688351, 1.606413, -0.3929101, 1, 0, 0, 1, 1,
-0.3676689, -0.5259913, -2.128678, 1, 0, 0, 1, 1,
-0.3661474, 0.5284343, -0.9496133, 0, 0, 0, 1, 1,
-0.363562, -1.510312, -2.274749, 0, 0, 0, 1, 1,
-0.3602147, 0.3585711, 0.3092857, 0, 0, 0, 1, 1,
-0.3579319, -0.9050369, -3.743605, 0, 0, 0, 1, 1,
-0.3571683, 0.1608411, -2.256122, 0, 0, 0, 1, 1,
-0.3566518, 0.9105665, 0.3354474, 0, 0, 0, 1, 1,
-0.3532031, -0.3542356, -1.671829, 0, 0, 0, 1, 1,
-0.3514321, 1.894911, 0.6389994, 1, 1, 1, 1, 1,
-0.3505886, -0.2119405, -1.960981, 1, 1, 1, 1, 1,
-0.3487415, -1.139982, -2.965983, 1, 1, 1, 1, 1,
-0.3476779, 0.9051422, -0.6171759, 1, 1, 1, 1, 1,
-0.3460296, 2.459373, -1.346308, 1, 1, 1, 1, 1,
-0.344386, 0.2873395, -0.7936199, 1, 1, 1, 1, 1,
-0.340155, 1.255031, 0.4590189, 1, 1, 1, 1, 1,
-0.3401543, -0.1046459, -2.071057, 1, 1, 1, 1, 1,
-0.3390021, 1.17226, 0.7219952, 1, 1, 1, 1, 1,
-0.3362356, 1.2637, -1.390347, 1, 1, 1, 1, 1,
-0.33334, -0.336486, -1.653327, 1, 1, 1, 1, 1,
-0.3307427, -0.8420097, -2.318812, 1, 1, 1, 1, 1,
-0.3282346, 0.5036668, -0.334961, 1, 1, 1, 1, 1,
-0.3263856, 0.7539855, -0.01933128, 1, 1, 1, 1, 1,
-0.3245993, -1.00253, -2.951829, 1, 1, 1, 1, 1,
-0.323015, -0.8784842, -3.704457, 0, 0, 1, 1, 1,
-0.3138236, -0.6886307, -4.094446, 1, 0, 0, 1, 1,
-0.3133869, 0.9718632, -1.078844, 1, 0, 0, 1, 1,
-0.3120483, -0.2529154, -2.607019, 1, 0, 0, 1, 1,
-0.3112651, -0.2853149, -0.7554072, 1, 0, 0, 1, 1,
-0.3100337, 0.8825357, -0.344186, 1, 0, 0, 1, 1,
-0.3083907, -1.243085, -4.831829, 0, 0, 0, 1, 1,
-0.3007518, 1.489813, 1.032878, 0, 0, 0, 1, 1,
-0.2985426, 0.3464525, -2.404453, 0, 0, 0, 1, 1,
-0.2981581, 0.8699583, -0.8683187, 0, 0, 0, 1, 1,
-0.2953852, -2.122676, -4.667949, 0, 0, 0, 1, 1,
-0.2941514, 0.02514307, -2.987798, 0, 0, 0, 1, 1,
-0.2928856, -0.9514848, -5.002484, 0, 0, 0, 1, 1,
-0.2906178, 0.8983361, -3.000489, 1, 1, 1, 1, 1,
-0.2883833, -0.5182202, -3.158351, 1, 1, 1, 1, 1,
-0.2813772, 0.3341359, -0.3466853, 1, 1, 1, 1, 1,
-0.2792165, -1.141168, -3.683258, 1, 1, 1, 1, 1,
-0.2786532, -1.33635, -3.764551, 1, 1, 1, 1, 1,
-0.2771735, 0.3091722, -1.26144, 1, 1, 1, 1, 1,
-0.275681, 0.3721602, 0.4578376, 1, 1, 1, 1, 1,
-0.2690376, 1.284212, -0.01847222, 1, 1, 1, 1, 1,
-0.2638291, 0.1931874, -0.5625978, 1, 1, 1, 1, 1,
-0.2624076, 1.678271, 0.8729274, 1, 1, 1, 1, 1,
-0.2610129, 1.095134, -1.085713, 1, 1, 1, 1, 1,
-0.2571641, 0.8257899, 0.6880801, 1, 1, 1, 1, 1,
-0.2455047, 1.507077, 0.07465421, 1, 1, 1, 1, 1,
-0.2419549, 0.2031792, -1.588691, 1, 1, 1, 1, 1,
-0.2334425, 1.552436, -0.3367137, 1, 1, 1, 1, 1,
-0.233286, -0.6528978, -2.177872, 0, 0, 1, 1, 1,
-0.2307576, 1.672988, -0.6008791, 1, 0, 0, 1, 1,
-0.2300822, 0.497614, 0.004978019, 1, 0, 0, 1, 1,
-0.2294218, -0.4187503, -1.744598, 1, 0, 0, 1, 1,
-0.2282591, -0.2660864, -2.959218, 1, 0, 0, 1, 1,
-0.2276781, 1.625426, -0.2564135, 1, 0, 0, 1, 1,
-0.2267296, 0.2763632, -1.060616, 0, 0, 0, 1, 1,
-0.2256815, -0.06009366, -1.337686, 0, 0, 0, 1, 1,
-0.2254037, -1.42846, -2.880226, 0, 0, 0, 1, 1,
-0.2187677, -1.332438, -2.005749, 0, 0, 0, 1, 1,
-0.217157, -1.764585, -2.71155, 0, 0, 0, 1, 1,
-0.2138758, -0.05086625, -0.4395079, 0, 0, 0, 1, 1,
-0.1922826, 1.141022, -1.156703, 0, 0, 0, 1, 1,
-0.1911694, -0.1274248, -3.652884, 1, 1, 1, 1, 1,
-0.186113, -0.6662634, -2.689743, 1, 1, 1, 1, 1,
-0.1844282, -1.179251, -3.455792, 1, 1, 1, 1, 1,
-0.1831312, 0.1648438, -1.524122, 1, 1, 1, 1, 1,
-0.1823294, -0.2237239, -2.691442, 1, 1, 1, 1, 1,
-0.1823163, 0.7259608, -0.3770392, 1, 1, 1, 1, 1,
-0.1805045, -0.7893121, -1.711719, 1, 1, 1, 1, 1,
-0.1734655, -1.483765, -1.326038, 1, 1, 1, 1, 1,
-0.1733295, 1.575531, 0.6998783, 1, 1, 1, 1, 1,
-0.1726956, -0.2812062, -2.248654, 1, 1, 1, 1, 1,
-0.1722141, 0.6425957, -0.339284, 1, 1, 1, 1, 1,
-0.1662513, 0.726906, 0.9977644, 1, 1, 1, 1, 1,
-0.1660632, 0.5179191, -0.05130067, 1, 1, 1, 1, 1,
-0.1574828, -0.4414679, -3.215141, 1, 1, 1, 1, 1,
-0.155459, -1.321585, -2.858833, 1, 1, 1, 1, 1,
-0.1493695, 3.941445, -0.9997613, 0, 0, 1, 1, 1,
-0.1489335, -0.7132125, -3.971353, 1, 0, 0, 1, 1,
-0.1464703, 1.082172, -0.582687, 1, 0, 0, 1, 1,
-0.1427484, 0.3855872, -1.178383, 1, 0, 0, 1, 1,
-0.1425598, -0.1658906, -2.478855, 1, 0, 0, 1, 1,
-0.139785, -0.6970182, -3.558166, 1, 0, 0, 1, 1,
-0.1329784, -0.2951757, -2.302982, 0, 0, 0, 1, 1,
-0.1305828, -0.05547095, -3.280557, 0, 0, 0, 1, 1,
-0.1276897, -1.84339, -2.233081, 0, 0, 0, 1, 1,
-0.1257664, 1.227691, -0.4998552, 0, 0, 0, 1, 1,
-0.1207513, 0.05612355, -1.535595, 0, 0, 0, 1, 1,
-0.1203706, 0.1583852, 0.3311154, 0, 0, 0, 1, 1,
-0.119182, -1.467016, -3.88383, 0, 0, 0, 1, 1,
-0.1186121, 0.5014523, 0.5471544, 1, 1, 1, 1, 1,
-0.118611, -0.6067099, -2.43261, 1, 1, 1, 1, 1,
-0.1034234, 0.1910945, 0.6113096, 1, 1, 1, 1, 1,
-0.1030298, -0.1247795, -2.575156, 1, 1, 1, 1, 1,
-0.09848166, -0.002464358, -0.5709436, 1, 1, 1, 1, 1,
-0.09785835, 0.2602949, -2.005355, 1, 1, 1, 1, 1,
-0.09413203, 0.9047824, 0.149744, 1, 1, 1, 1, 1,
-0.09361999, 0.4581433, 0.01382124, 1, 1, 1, 1, 1,
-0.09271504, 0.2923501, 0.1144794, 1, 1, 1, 1, 1,
-0.0925163, -0.05425161, -2.090406, 1, 1, 1, 1, 1,
-0.09190562, 0.5673016, -0.9419693, 1, 1, 1, 1, 1,
-0.08854302, -0.1192502, -3.207328, 1, 1, 1, 1, 1,
-0.08435836, -0.3308594, -3.289211, 1, 1, 1, 1, 1,
-0.08402912, 0.7378054, -0.04026354, 1, 1, 1, 1, 1,
-0.0789225, -0.3090453, -2.193367, 1, 1, 1, 1, 1,
-0.07501359, 1.096958, 1.145746, 0, 0, 1, 1, 1,
-0.07390266, 0.1352017, -1.062101, 1, 0, 0, 1, 1,
-0.07244366, -0.6815313, -2.711024, 1, 0, 0, 1, 1,
-0.07183227, 1.190239, -1.027614, 1, 0, 0, 1, 1,
-0.06670571, 1.776211, 1.196627, 1, 0, 0, 1, 1,
-0.06300941, -0.7677395, -2.58113, 1, 0, 0, 1, 1,
-0.06186302, -0.8495749, -5.121879, 0, 0, 0, 1, 1,
-0.06108867, 0.4445897, 1.577475, 0, 0, 0, 1, 1,
-0.06057987, 0.223872, 0.2235496, 0, 0, 0, 1, 1,
-0.05928627, -1.150458, -3.512168, 0, 0, 0, 1, 1,
-0.05870807, 1.513938, -0.02742222, 0, 0, 0, 1, 1,
-0.05675592, 0.1885424, -2.569443, 0, 0, 0, 1, 1,
-0.0478537, -1.195591, -2.042529, 0, 0, 0, 1, 1,
-0.04519794, -0.2944046, -3.690691, 1, 1, 1, 1, 1,
-0.04487733, -0.1840623, -4.307795, 1, 1, 1, 1, 1,
-0.04480667, -0.1579771, -4.714575, 1, 1, 1, 1, 1,
-0.03371707, 0.2470605, 1.860526, 1, 1, 1, 1, 1,
-0.03320471, 0.394156, -0.2461306, 1, 1, 1, 1, 1,
-0.02966489, -0.1086291, -2.771628, 1, 1, 1, 1, 1,
-0.0296111, 0.2065457, -1.959408, 1, 1, 1, 1, 1,
-0.02462928, -0.05830831, -0.9697611, 1, 1, 1, 1, 1,
-0.01846208, 0.8903257, -1.851976, 1, 1, 1, 1, 1,
-0.01835991, -0.1700777, -2.796129, 1, 1, 1, 1, 1,
-0.0160429, 1.600582, -0.1665651, 1, 1, 1, 1, 1,
-0.007351358, -0.7763826, -1.643819, 1, 1, 1, 1, 1,
-0.005543873, -0.8494359, -4.896406, 1, 1, 1, 1, 1,
-0.00547928, -0.395271, -3.619247, 1, 1, 1, 1, 1,
-0.003814461, 1.043521, -1.157929, 1, 1, 1, 1, 1,
-0.001147449, -0.9244179, -2.392309, 0, 0, 1, 1, 1,
0.0004679763, 0.9747592, 0.8678949, 1, 0, 0, 1, 1,
0.0009698845, -1.959498, 3.769187, 1, 0, 0, 1, 1,
0.001650081, -0.1493214, 1.272654, 1, 0, 0, 1, 1,
0.001837048, 0.2313989, 0.9944002, 1, 0, 0, 1, 1,
0.002696283, 0.7914836, 0.2847827, 1, 0, 0, 1, 1,
0.002930867, 0.2705041, -1.149018, 0, 0, 0, 1, 1,
0.004355273, -0.3031479, 4.470099, 0, 0, 0, 1, 1,
0.004560438, -1.050752, 5.008723, 0, 0, 0, 1, 1,
0.008435262, 0.3170266, -1.714075, 0, 0, 0, 1, 1,
0.009697146, -1.566314, 3.54105, 0, 0, 0, 1, 1,
0.0117359, 0.3039851, -0.3278845, 0, 0, 0, 1, 1,
0.0153312, 1.15366, -0.2741171, 0, 0, 0, 1, 1,
0.01670784, -0.1943357, 4.486257, 1, 1, 1, 1, 1,
0.01885767, -1.50772, 2.761946, 1, 1, 1, 1, 1,
0.01996161, -0.2785204, 2.124018, 1, 1, 1, 1, 1,
0.0201378, 0.1787505, 0.6538572, 1, 1, 1, 1, 1,
0.02292439, -1.39943, 3.542202, 1, 1, 1, 1, 1,
0.03181198, -1.386272, 1.625581, 1, 1, 1, 1, 1,
0.0344302, -1.494223, 3.199678, 1, 1, 1, 1, 1,
0.04381356, -0.6123232, 2.978018, 1, 1, 1, 1, 1,
0.04415065, 0.9310182, 0.4876024, 1, 1, 1, 1, 1,
0.04682986, -1.071553, 4.226043, 1, 1, 1, 1, 1,
0.0528222, 0.2363143, 0.7683426, 1, 1, 1, 1, 1,
0.05902746, 0.6286562, 0.6446146, 1, 1, 1, 1, 1,
0.05955782, -0.8361492, 1.949759, 1, 1, 1, 1, 1,
0.06113728, -1.191575, 4.785109, 1, 1, 1, 1, 1,
0.06175372, -0.4931455, 2.707839, 1, 1, 1, 1, 1,
0.06458156, 0.37237, -0.1817307, 0, 0, 1, 1, 1,
0.0680052, 0.735287, -0.2045546, 1, 0, 0, 1, 1,
0.07142902, -1.071318, 3.112759, 1, 0, 0, 1, 1,
0.07264818, 0.7147635, -0.8906766, 1, 0, 0, 1, 1,
0.07362492, -0.8613357, 0.3177635, 1, 0, 0, 1, 1,
0.07390189, 0.2817303, 0.1229995, 1, 0, 0, 1, 1,
0.0743542, 1.425706, 1.15494, 0, 0, 0, 1, 1,
0.07556502, -0.2137617, 2.060143, 0, 0, 0, 1, 1,
0.07569233, -0.7132334, 0.7004198, 0, 0, 0, 1, 1,
0.07748332, 0.1520262, 0.1841865, 0, 0, 0, 1, 1,
0.07837403, 1.298932, -0.1297895, 0, 0, 0, 1, 1,
0.07992847, 1.029118, 0.09342179, 0, 0, 0, 1, 1,
0.08078745, 1.016281, 0.1951876, 0, 0, 0, 1, 1,
0.08112595, -1.2117, 4.499636, 1, 1, 1, 1, 1,
0.08189122, -0.3804365, 1.974954, 1, 1, 1, 1, 1,
0.08209644, -1.087147, 3.269904, 1, 1, 1, 1, 1,
0.08209946, -0.2971583, 3.189222, 1, 1, 1, 1, 1,
0.08361615, -1.681591, 4.409083, 1, 1, 1, 1, 1,
0.08448911, -0.5983743, 1.8376, 1, 1, 1, 1, 1,
0.08519609, 0.1983642, 1.400293, 1, 1, 1, 1, 1,
0.08875814, -0.2755934, 2.440459, 1, 1, 1, 1, 1,
0.08914864, -1.930692, 3.938169, 1, 1, 1, 1, 1,
0.09415174, -0.8218505, 3.5661, 1, 1, 1, 1, 1,
0.09524, -0.4801388, 2.8712, 1, 1, 1, 1, 1,
0.09885208, 1.241501, 0.316977, 1, 1, 1, 1, 1,
0.1117643, -1.592352, 3.379061, 1, 1, 1, 1, 1,
0.1150986, -0.4914285, 4.116234, 1, 1, 1, 1, 1,
0.1159425, -0.6007583, 4.568455, 1, 1, 1, 1, 1,
0.1251292, -1.416221, 0.4573783, 0, 0, 1, 1, 1,
0.1281139, -0.8483881, 4.376911, 1, 0, 0, 1, 1,
0.1328775, -0.1870654, 3.623168, 1, 0, 0, 1, 1,
0.1331785, -0.4165047, 3.044613, 1, 0, 0, 1, 1,
0.1335069, -0.2791321, 3.326056, 1, 0, 0, 1, 1,
0.1341017, -3.107701, 2.189741, 1, 0, 0, 1, 1,
0.1368224, -1.587274, 3.191782, 0, 0, 0, 1, 1,
0.137629, 0.9937508, -0.421462, 0, 0, 0, 1, 1,
0.138647, 1.57192, -0.4071669, 0, 0, 0, 1, 1,
0.1431378, 0.5716635, 0.4983263, 0, 0, 0, 1, 1,
0.1538613, 0.7401285, 0.2577294, 0, 0, 0, 1, 1,
0.1544068, -2.01667, 1.750291, 0, 0, 0, 1, 1,
0.1585092, 1.117769, -0.9138383, 0, 0, 0, 1, 1,
0.1662791, 0.2633351, 1.191655, 1, 1, 1, 1, 1,
0.1705378, -0.7309511, 4.499661, 1, 1, 1, 1, 1,
0.1730169, 0.1711795, -0.5210975, 1, 1, 1, 1, 1,
0.1751703, 0.1380073, 0.4411411, 1, 1, 1, 1, 1,
0.1753318, 1.357159, -0.1698151, 1, 1, 1, 1, 1,
0.1765693, 2.42486, 0.9252294, 1, 1, 1, 1, 1,
0.1808573, 0.3056211, 0.03160223, 1, 1, 1, 1, 1,
0.1824241, -0.08935531, 2.916888, 1, 1, 1, 1, 1,
0.1863184, -0.1748986, 4.014982, 1, 1, 1, 1, 1,
0.1927667, -0.9235857, 1.484316, 1, 1, 1, 1, 1,
0.1944976, 0.3823475, 0.5498755, 1, 1, 1, 1, 1,
0.1965048, 1.073126, -1.443879, 1, 1, 1, 1, 1,
0.1988683, 0.2330566, 0.1852898, 1, 1, 1, 1, 1,
0.2042639, -0.6829962, 3.728827, 1, 1, 1, 1, 1,
0.2047002, 0.2295765, 1.123635, 1, 1, 1, 1, 1,
0.2082646, 0.5360667, 1.034323, 0, 0, 1, 1, 1,
0.209251, -0.5614057, 3.868421, 1, 0, 0, 1, 1,
0.2095728, 0.5387476, 1.908442, 1, 0, 0, 1, 1,
0.2098757, 0.251256, 0.8760203, 1, 0, 0, 1, 1,
0.2137149, 1.231863, -0.5047915, 1, 0, 0, 1, 1,
0.2239389, -0.5384942, 3.646835, 1, 0, 0, 1, 1,
0.2264906, 0.6248006, 1.444173, 0, 0, 0, 1, 1,
0.2293805, 0.7229921, -0.9264397, 0, 0, 0, 1, 1,
0.2301321, 0.4519106, -2.499388, 0, 0, 0, 1, 1,
0.2310204, -1.802596, 3.183623, 0, 0, 0, 1, 1,
0.2314069, -0.349158, 1.779061, 0, 0, 0, 1, 1,
0.2352759, -0.104145, 2.381974, 0, 0, 0, 1, 1,
0.2363678, 0.4452648, 0.3353156, 0, 0, 0, 1, 1,
0.2421171, -1.126488, 1.868811, 1, 1, 1, 1, 1,
0.2431256, -1.652484, 2.967142, 1, 1, 1, 1, 1,
0.2463496, -1.259569, 3.647574, 1, 1, 1, 1, 1,
0.2465489, -0.7686206, 2.599425, 1, 1, 1, 1, 1,
0.2467378, -1.575137, 5.03023, 1, 1, 1, 1, 1,
0.2468435, -0.7017433, 3.409798, 1, 1, 1, 1, 1,
0.2470688, -1.09268, 3.425051, 1, 1, 1, 1, 1,
0.2470832, -0.633063, 3.811435, 1, 1, 1, 1, 1,
0.2485004, 2.288219, -1.239398, 1, 1, 1, 1, 1,
0.251004, 1.355528, 1.182222, 1, 1, 1, 1, 1,
0.2524839, 1.015952, 2.58984, 1, 1, 1, 1, 1,
0.2531716, -0.6353942, 1.232361, 1, 1, 1, 1, 1,
0.2532952, 1.036287, -0.04036419, 1, 1, 1, 1, 1,
0.2551118, 1.942935, 0.7274784, 1, 1, 1, 1, 1,
0.2605415, -1.218693, 3.063259, 1, 1, 1, 1, 1,
0.264457, 0.1334584, 0.175255, 0, 0, 1, 1, 1,
0.2646296, -0.4664581, 3.630298, 1, 0, 0, 1, 1,
0.2673088, 0.1834, 1.729915, 1, 0, 0, 1, 1,
0.2689125, 0.1946378, 0.7429546, 1, 0, 0, 1, 1,
0.2690141, 1.346391, -1.232649, 1, 0, 0, 1, 1,
0.2785355, 1.964175, 0.8135399, 1, 0, 0, 1, 1,
0.2849297, 1.045729, -0.2323812, 0, 0, 0, 1, 1,
0.2860723, 2.354519, -0.5691583, 0, 0, 0, 1, 1,
0.2865424, 1.126727, 0.5621771, 0, 0, 0, 1, 1,
0.296522, -0.2591727, 0.6903577, 0, 0, 0, 1, 1,
0.2965419, -1.091898, 2.441573, 0, 0, 0, 1, 1,
0.3017014, -1.461464, 3.913185, 0, 0, 0, 1, 1,
0.3029766, -0.814365, 1.248349, 0, 0, 0, 1, 1,
0.3036923, 0.1893356, 1.462768, 1, 1, 1, 1, 1,
0.3053429, 1.416012, 0.338464, 1, 1, 1, 1, 1,
0.3097248, 0.6009927, 2.291898, 1, 1, 1, 1, 1,
0.3118083, 1.440905, 0.2730511, 1, 1, 1, 1, 1,
0.3151098, -1.313488, 2.377514, 1, 1, 1, 1, 1,
0.3173639, -0.9043167, 3.747618, 1, 1, 1, 1, 1,
0.3201318, 0.01374803, 1.841658, 1, 1, 1, 1, 1,
0.3224054, 0.7886964, -0.8070354, 1, 1, 1, 1, 1,
0.3255363, 0.9899879, 0.2541064, 1, 1, 1, 1, 1,
0.331573, 1.771654, 0.2220262, 1, 1, 1, 1, 1,
0.3351019, 0.1092658, 1.8257, 1, 1, 1, 1, 1,
0.3381107, -0.824066, 2.869749, 1, 1, 1, 1, 1,
0.3388028, 2.041677, 0.636894, 1, 1, 1, 1, 1,
0.3393667, 0.8058202, -0.271356, 1, 1, 1, 1, 1,
0.3394993, -0.5731027, 2.005888, 1, 1, 1, 1, 1,
0.339581, -1.78256, 2.346195, 0, 0, 1, 1, 1,
0.3439419, -2.021002, 5.355491, 1, 0, 0, 1, 1,
0.3484779, -0.3649349, 2.392473, 1, 0, 0, 1, 1,
0.3492164, 1.258153, 1.136721, 1, 0, 0, 1, 1,
0.351874, -0.7305213, 2.718292, 1, 0, 0, 1, 1,
0.3556335, -0.2417696, 0.9329286, 1, 0, 0, 1, 1,
0.3581848, 0.7856063, 2.215735, 0, 0, 0, 1, 1,
0.3618922, 1.151329, 0.2733136, 0, 0, 0, 1, 1,
0.363499, 0.4843084, -0.6352254, 0, 0, 0, 1, 1,
0.3749133, -0.05483452, 3.542199, 0, 0, 0, 1, 1,
0.3766264, -0.8780102, 2.694009, 0, 0, 0, 1, 1,
0.3779193, -0.8914311, 1.768843, 0, 0, 0, 1, 1,
0.3800179, -1.403657, 4.658213, 0, 0, 0, 1, 1,
0.38487, 1.940766, -0.196829, 1, 1, 1, 1, 1,
0.3857365, 0.2611606, 1.131891, 1, 1, 1, 1, 1,
0.3883349, 0.2402408, 1.056516, 1, 1, 1, 1, 1,
0.3909079, 0.5326362, 2.761282, 1, 1, 1, 1, 1,
0.3949149, -0.8526378, 2.680573, 1, 1, 1, 1, 1,
0.3964323, 0.3213001, 1.803371, 1, 1, 1, 1, 1,
0.3991202, -0.2361561, 1.715675, 1, 1, 1, 1, 1,
0.4054171, -0.3210715, 2.228724, 1, 1, 1, 1, 1,
0.411435, 0.5709914, -0.8596623, 1, 1, 1, 1, 1,
0.412259, -0.2617188, 1.094552, 1, 1, 1, 1, 1,
0.413071, 0.1098571, 1.654949, 1, 1, 1, 1, 1,
0.4160433, -0.05168263, 0.2470047, 1, 1, 1, 1, 1,
0.4224634, 0.4609188, 0.4727025, 1, 1, 1, 1, 1,
0.4226124, -0.8549638, 1.777409, 1, 1, 1, 1, 1,
0.4241402, 1.155487, 0.6584048, 1, 1, 1, 1, 1,
0.4282872, -0.2294445, 2.851433, 0, 0, 1, 1, 1,
0.4302426, 0.1976424, 1.193718, 1, 0, 0, 1, 1,
0.4332905, 1.16311, -0.1095394, 1, 0, 0, 1, 1,
0.4332911, 0.4053633, -1.082446, 1, 0, 0, 1, 1,
0.4362853, 1.688132, 0.9778916, 1, 0, 0, 1, 1,
0.4395976, 0.08449697, 1.190036, 1, 0, 0, 1, 1,
0.4497659, -2.350692, 5.154066, 0, 0, 0, 1, 1,
0.4523723, -0.7554123, 1.003339, 0, 0, 0, 1, 1,
0.4548824, 0.157939, 1.85691, 0, 0, 0, 1, 1,
0.4549721, 0.2212231, 1.67602, 0, 0, 0, 1, 1,
0.4550538, 0.7180484, -0.4787937, 0, 0, 0, 1, 1,
0.4563478, -0.41314, 2.330057, 0, 0, 0, 1, 1,
0.460214, 0.7500025, 1.890099, 0, 0, 0, 1, 1,
0.4603802, -0.6417069, 2.802298, 1, 1, 1, 1, 1,
0.464498, -0.2435867, 0.7627322, 1, 1, 1, 1, 1,
0.4710476, 0.1058648, 1.230918, 1, 1, 1, 1, 1,
0.4722284, 0.4982689, 1.21225, 1, 1, 1, 1, 1,
0.4733421, 0.7653774, 1.994612, 1, 1, 1, 1, 1,
0.4743609, -1.238157, 2.35185, 1, 1, 1, 1, 1,
0.4765197, 0.7535757, 1.154874, 1, 1, 1, 1, 1,
0.4788118, 1.440723, -0.06872624, 1, 1, 1, 1, 1,
0.4801377, 0.1272667, 0.3291462, 1, 1, 1, 1, 1,
0.4809399, -1.930715, 3.564101, 1, 1, 1, 1, 1,
0.4841161, -0.2883251, 2.588971, 1, 1, 1, 1, 1,
0.4870887, 0.6112629, -0.1076614, 1, 1, 1, 1, 1,
0.4876367, -0.2348111, 2.523902, 1, 1, 1, 1, 1,
0.4895999, -1.625063, 3.287696, 1, 1, 1, 1, 1,
0.4952822, -0.7338297, 2.220748, 1, 1, 1, 1, 1,
0.4976617, -1.352467, 2.692972, 0, 0, 1, 1, 1,
0.5046583, -0.4776093, 1.972448, 1, 0, 0, 1, 1,
0.5107842, 0.6169768, 0.2631442, 1, 0, 0, 1, 1,
0.522881, -0.786456, 2.323297, 1, 0, 0, 1, 1,
0.5277413, 1.193502, -0.9783859, 1, 0, 0, 1, 1,
0.5317392, -1.579347, 3.255474, 1, 0, 0, 1, 1,
0.5328797, -0.7949674, 0.9167774, 0, 0, 0, 1, 1,
0.5341933, 0.03683852, 1.023939, 0, 0, 0, 1, 1,
0.5351256, -0.8054445, 2.99691, 0, 0, 0, 1, 1,
0.5360731, 0.2792471, 1.309927, 0, 0, 0, 1, 1,
0.5393883, 1.657542, 1.358158, 0, 0, 0, 1, 1,
0.5465328, -1.486233, 3.002507, 0, 0, 0, 1, 1,
0.547218, -1.767717, 3.456643, 0, 0, 0, 1, 1,
0.5473282, 0.8751922, 0.440916, 1, 1, 1, 1, 1,
0.556745, 1.208053, 1.939936, 1, 1, 1, 1, 1,
0.5575532, 0.3856352, 0.7713836, 1, 1, 1, 1, 1,
0.559348, 0.5701035, 1.300649, 1, 1, 1, 1, 1,
0.566204, -0.8991341, 2.002477, 1, 1, 1, 1, 1,
0.5669423, 0.4135964, -0.1391039, 1, 1, 1, 1, 1,
0.5702897, 0.3073031, 2.191944, 1, 1, 1, 1, 1,
0.5758998, -0.2474121, 2.080259, 1, 1, 1, 1, 1,
0.5776162, 0.5042002, 1.351289, 1, 1, 1, 1, 1,
0.5884626, 0.6051443, 1.318599, 1, 1, 1, 1, 1,
0.5920896, 1.082281, 1.493364, 1, 1, 1, 1, 1,
0.5927791, 0.9242869, -0.8911402, 1, 1, 1, 1, 1,
0.6053623, -0.2095612, 2.991846, 1, 1, 1, 1, 1,
0.614123, 0.8684436, 0.07673696, 1, 1, 1, 1, 1,
0.6193437, 0.01759916, 0.8079317, 1, 1, 1, 1, 1,
0.6210377, 0.328228, 2.784736, 0, 0, 1, 1, 1,
0.6314021, -0.1269901, 2.569262, 1, 0, 0, 1, 1,
0.6358665, -2.282955, 3.013732, 1, 0, 0, 1, 1,
0.6359518, -1.150809, 3.635693, 1, 0, 0, 1, 1,
0.6402407, 0.1889854, 1.56836, 1, 0, 0, 1, 1,
0.6409797, -0.2833045, 2.420104, 1, 0, 0, 1, 1,
0.6447306, -2.373895, 1.665551, 0, 0, 0, 1, 1,
0.6515914, 0.3050233, -0.3529816, 0, 0, 0, 1, 1,
0.6544576, 0.7786767, -0.6453738, 0, 0, 0, 1, 1,
0.6628132, -0.03146472, 0.2066924, 0, 0, 0, 1, 1,
0.6648522, 0.3954708, -1.097472, 0, 0, 0, 1, 1,
0.6758945, 0.4993934, -0.2965174, 0, 0, 0, 1, 1,
0.6760869, 0.0420029, 2.111864, 0, 0, 0, 1, 1,
0.6825799, -0.8698899, 2.021873, 1, 1, 1, 1, 1,
0.6871465, 0.3762197, -0.2965507, 1, 1, 1, 1, 1,
0.6877671, 0.6698715, 2.275292, 1, 1, 1, 1, 1,
0.6900732, 0.3752634, 0.5174632, 1, 1, 1, 1, 1,
0.6921654, 0.2128825, 0.9376389, 1, 1, 1, 1, 1,
0.6942257, 0.7490029, 1.213634, 1, 1, 1, 1, 1,
0.6996487, 0.8469947, -0.9724709, 1, 1, 1, 1, 1,
0.7002186, -0.1479634, 1.140961, 1, 1, 1, 1, 1,
0.7045048, -0.5831727, 2.465188, 1, 1, 1, 1, 1,
0.705034, -1.529775, 2.897437, 1, 1, 1, 1, 1,
0.7056825, -0.04903128, 1.936963, 1, 1, 1, 1, 1,
0.7068017, 0.2555942, 1.799319, 1, 1, 1, 1, 1,
0.7105694, 0.2580644, 2.078089, 1, 1, 1, 1, 1,
0.7183248, 0.4902648, 0.5116683, 1, 1, 1, 1, 1,
0.7214812, -1.439, 3.056554, 1, 1, 1, 1, 1,
0.7252079, -0.2806583, 1.997503, 0, 0, 1, 1, 1,
0.7263826, 0.8725729, 1.849918, 1, 0, 0, 1, 1,
0.7273872, -0.5501615, 2.07662, 1, 0, 0, 1, 1,
0.7274109, 0.7951248, 0.924092, 1, 0, 0, 1, 1,
0.7288198, -1.642493, 1.62799, 1, 0, 0, 1, 1,
0.731069, 2.185891, 0.2565617, 1, 0, 0, 1, 1,
0.7367596, -0.1248341, 1.939253, 0, 0, 0, 1, 1,
0.7393269, 1.346733, -0.5273345, 0, 0, 0, 1, 1,
0.7395032, 1.786077, 1.334818, 0, 0, 0, 1, 1,
0.7433949, 1.259641, 0.06053399, 0, 0, 0, 1, 1,
0.7452725, -1.209212, 2.448837, 0, 0, 0, 1, 1,
0.7468682, 0.1230949, 0.6554371, 0, 0, 0, 1, 1,
0.7487262, 0.1151738, 1.73986, 0, 0, 0, 1, 1,
0.7488469, -1.391094, 1.874729, 1, 1, 1, 1, 1,
0.7582363, 0.769008, 2.306676, 1, 1, 1, 1, 1,
0.7623569, 0.8004683, -0.7683917, 1, 1, 1, 1, 1,
0.7635509, -1.03566, 2.232406, 1, 1, 1, 1, 1,
0.7645849, -0.2566196, 2.57721, 1, 1, 1, 1, 1,
0.7663814, 0.531118, 1.275461, 1, 1, 1, 1, 1,
0.7678158, 1.28352, 1.158946, 1, 1, 1, 1, 1,
0.7683321, 0.2012252, 1.076101, 1, 1, 1, 1, 1,
0.769168, 0.894164, 1.690008, 1, 1, 1, 1, 1,
0.7694489, -1.827205, 3.460763, 1, 1, 1, 1, 1,
0.7707307, 0.1615652, 2.690869, 1, 1, 1, 1, 1,
0.7714304, 0.3562383, -0.08748465, 1, 1, 1, 1, 1,
0.7721317, 0.5939297, 0.8086941, 1, 1, 1, 1, 1,
0.7786168, -0.8747149, 1.49492, 1, 1, 1, 1, 1,
0.7835739, -1.443155, 0.1316135, 1, 1, 1, 1, 1,
0.7873816, -0.5522676, 2.282735, 0, 0, 1, 1, 1,
0.7880945, -0.4745944, 1.693582, 1, 0, 0, 1, 1,
0.7947584, 0.9245666, 1.789275, 1, 0, 0, 1, 1,
0.7966515, 0.2554346, 0.927803, 1, 0, 0, 1, 1,
0.8052548, -0.3512697, 2.881065, 1, 0, 0, 1, 1,
0.8053105, -0.6640975, 2.505006, 1, 0, 0, 1, 1,
0.8068846, -0.1904503, 2.438888, 0, 0, 0, 1, 1,
0.8106837, 0.130944, 1.472064, 0, 0, 0, 1, 1,
0.8111534, -0.5058278, 3.131284, 0, 0, 0, 1, 1,
0.8130343, 0.06670664, 3.301942, 0, 0, 0, 1, 1,
0.8164937, -1.213221, 1.43484, 0, 0, 0, 1, 1,
0.8165113, 0.07573769, 1.918209, 0, 0, 0, 1, 1,
0.8208362, -0.1940523, 3.12242, 0, 0, 0, 1, 1,
0.8259134, 0.1791923, 2.305155, 1, 1, 1, 1, 1,
0.8287717, 1.450882, -0.2576638, 1, 1, 1, 1, 1,
0.8321218, 0.2357555, 2.261353, 1, 1, 1, 1, 1,
0.8345118, -0.04628774, -0.1031924, 1, 1, 1, 1, 1,
0.8352866, 0.245764, 0.0738218, 1, 1, 1, 1, 1,
0.8368448, -0.2837817, 2.87507, 1, 1, 1, 1, 1,
0.8370376, -0.1532504, 1.142799, 1, 1, 1, 1, 1,
0.8377678, 0.01062642, 0.3963884, 1, 1, 1, 1, 1,
0.8380458, -0.7423019, 3.17292, 1, 1, 1, 1, 1,
0.8412811, -0.09706604, 2.072821, 1, 1, 1, 1, 1,
0.8414828, -1.305748, 3.036712, 1, 1, 1, 1, 1,
0.8466259, 0.882737, 0.7767232, 1, 1, 1, 1, 1,
0.8483405, 1.10034, -0.3527695, 1, 1, 1, 1, 1,
0.8511616, 1.821769, 1.257335, 1, 1, 1, 1, 1,
0.8524904, -0.9961783, 2.193351, 1, 1, 1, 1, 1,
0.8529724, 0.0780509, 3.365582, 0, 0, 1, 1, 1,
0.8609176, 1.458521, 0.489132, 1, 0, 0, 1, 1,
0.8638192, -0.1792162, 1.973401, 1, 0, 0, 1, 1,
0.8638315, 0.4464078, 0.8399506, 1, 0, 0, 1, 1,
0.8651841, 0.3806975, 2.476379, 1, 0, 0, 1, 1,
0.8658044, 1.299741, 1.71126, 1, 0, 0, 1, 1,
0.8679802, 1.000946, 0.5876727, 0, 0, 0, 1, 1,
0.8779822, -0.4647478, 1.972058, 0, 0, 0, 1, 1,
0.8797317, -1.267449, 2.527419, 0, 0, 0, 1, 1,
0.880659, 0.3433675, -0.5291948, 0, 0, 0, 1, 1,
0.8838495, -1.35746, 1.714128, 0, 0, 0, 1, 1,
0.8844676, 0.303879, 2.178105, 0, 0, 0, 1, 1,
0.885026, 0.5957742, -1.499485, 0, 0, 0, 1, 1,
0.8851042, 0.1973485, 1.987772, 1, 1, 1, 1, 1,
0.885523, 1.897512, -0.1203053, 1, 1, 1, 1, 1,
0.8864835, 2.111457, 0.167583, 1, 1, 1, 1, 1,
0.8915805, 0.6631535, -0.1674347, 1, 1, 1, 1, 1,
0.8926551, -1.720364, 2.008585, 1, 1, 1, 1, 1,
0.8934968, 0.08337321, 1.319208, 1, 1, 1, 1, 1,
0.8951103, -0.7468566, 3.6415, 1, 1, 1, 1, 1,
0.8991067, 1.041436, 0.8678762, 1, 1, 1, 1, 1,
0.8994152, 0.04815744, 0.46257, 1, 1, 1, 1, 1,
0.9250365, -1.18289, 2.425945, 1, 1, 1, 1, 1,
0.9272991, -0.4304567, 1.517648, 1, 1, 1, 1, 1,
0.9466856, -0.1560239, 3.47985, 1, 1, 1, 1, 1,
0.949519, 0.8910657, -0.7431295, 1, 1, 1, 1, 1,
0.9511161, -0.9492499, 2.974622, 1, 1, 1, 1, 1,
0.9525841, 0.6542576, 1.912832, 1, 1, 1, 1, 1,
0.9533232, 0.5507329, 0.2542477, 0, 0, 1, 1, 1,
0.9632567, 0.7277583, -1.897447, 1, 0, 0, 1, 1,
0.9636021, 0.6951049, 0.001904621, 1, 0, 0, 1, 1,
0.9669808, 1.134739, 1.648311, 1, 0, 0, 1, 1,
0.96964, 0.2160608, 1.347819, 1, 0, 0, 1, 1,
0.9729854, -1.040399, 3.868193, 1, 0, 0, 1, 1,
0.9779407, 1.550284, 1.131758, 0, 0, 0, 1, 1,
0.9795843, -2.414639, 4.598119, 0, 0, 0, 1, 1,
0.9900143, -1.34826, 2.480644, 0, 0, 0, 1, 1,
0.9953697, 1.91799, 0.2208395, 0, 0, 0, 1, 1,
0.995698, -0.5725365, 2.241446, 0, 0, 0, 1, 1,
0.9972467, 0.4659199, 1.841965, 0, 0, 0, 1, 1,
1.00239, -1.259931, 1.627968, 0, 0, 0, 1, 1,
1.003857, 0.221952, 3.569526, 1, 1, 1, 1, 1,
1.006055, -0.4351989, 0.8300167, 1, 1, 1, 1, 1,
1.021271, -0.2336703, 1.477709, 1, 1, 1, 1, 1,
1.027958, 1.455946, 1.723657, 1, 1, 1, 1, 1,
1.037045, 0.42965, 0.9613434, 1, 1, 1, 1, 1,
1.043872, 0.4267594, 2.80402, 1, 1, 1, 1, 1,
1.046273, -0.7278497, 3.343281, 1, 1, 1, 1, 1,
1.054446, -0.6164848, 2.178259, 1, 1, 1, 1, 1,
1.055392, -1.018406, 3.488819, 1, 1, 1, 1, 1,
1.066247, 0.7222272, 1.149303, 1, 1, 1, 1, 1,
1.076055, -1.676508, 5.044142, 1, 1, 1, 1, 1,
1.078196, -1.143453, 2.488964, 1, 1, 1, 1, 1,
1.083515, -1.279484, 3.559537, 1, 1, 1, 1, 1,
1.091553, 1.269356, 0.5349476, 1, 1, 1, 1, 1,
1.097407, 1.769703, 0.1058502, 1, 1, 1, 1, 1,
1.100441, -0.2828068, 1.822153, 0, 0, 1, 1, 1,
1.103691, -0.4899289, 2.530698, 1, 0, 0, 1, 1,
1.109343, -1.310704, 2.868658, 1, 0, 0, 1, 1,
1.120272, -0.3978065, 2.17376, 1, 0, 0, 1, 1,
1.123708, -0.9984308, 2.548878, 1, 0, 0, 1, 1,
1.127279, -0.5277352, -0.1282615, 1, 0, 0, 1, 1,
1.146717, -1.181036, 1.508468, 0, 0, 0, 1, 1,
1.14718, 1.294574, -0.3304542, 0, 0, 0, 1, 1,
1.148223, 0.01915436, -0.09588371, 0, 0, 0, 1, 1,
1.149375, 0.90545, 1.908216, 0, 0, 0, 1, 1,
1.160201, 1.243289, 2.004196, 0, 0, 0, 1, 1,
1.163634, 1.54611, 1.607153, 0, 0, 0, 1, 1,
1.170208, 1.712863, 1.39141, 0, 0, 0, 1, 1,
1.175439, 1.481442, 0.8859352, 1, 1, 1, 1, 1,
1.179572, 0.5232632, 1.204052, 1, 1, 1, 1, 1,
1.188803, -0.6902129, 0.5991186, 1, 1, 1, 1, 1,
1.197111, 1.224051, 0.101931, 1, 1, 1, 1, 1,
1.202056, 0.1516721, 2.249544, 1, 1, 1, 1, 1,
1.204529, 1.044995, -0.1092029, 1, 1, 1, 1, 1,
1.20689, 0.8284406, 1.060202, 1, 1, 1, 1, 1,
1.207721, 1.405855, -0.03842993, 1, 1, 1, 1, 1,
1.20808, 1.696345, -0.1597189, 1, 1, 1, 1, 1,
1.222754, -0.4308037, 2.999616, 1, 1, 1, 1, 1,
1.225168, -0.02205538, 1.479108, 1, 1, 1, 1, 1,
1.23258, -0.3671057, 2.503757, 1, 1, 1, 1, 1,
1.235056, -1.021918, 2.973264, 1, 1, 1, 1, 1,
1.235818, 0.8162628, 1.456945, 1, 1, 1, 1, 1,
1.23843, -1.790084, 2.222956, 1, 1, 1, 1, 1,
1.24232, 1.702325, -1.65342, 0, 0, 1, 1, 1,
1.245897, 0.631299, -0.04774909, 1, 0, 0, 1, 1,
1.246665, 0.3077948, 1.998445, 1, 0, 0, 1, 1,
1.250968, 0.532958, 1.779536, 1, 0, 0, 1, 1,
1.257702, 0.6549134, 0.5014504, 1, 0, 0, 1, 1,
1.258229, -0.1788593, 0.07566752, 1, 0, 0, 1, 1,
1.261311, -0.7821561, 2.549576, 0, 0, 0, 1, 1,
1.27677, 1.070438, 0.934893, 0, 0, 0, 1, 1,
1.280143, 1.801672, 0.6909501, 0, 0, 0, 1, 1,
1.281488, 1.220834, 2.035394, 0, 0, 0, 1, 1,
1.289394, -0.4778216, 2.291191, 0, 0, 0, 1, 1,
1.290338, -0.5056086, 2.573029, 0, 0, 0, 1, 1,
1.292056, -1.025543, 1.525657, 0, 0, 0, 1, 1,
1.301792, 0.3470537, 2.707437, 1, 1, 1, 1, 1,
1.30814, -1.267742, 2.367329, 1, 1, 1, 1, 1,
1.309129, 0.4595217, 1.839426, 1, 1, 1, 1, 1,
1.309479, -1.852205, 1.778694, 1, 1, 1, 1, 1,
1.321965, -0.9962834, 3.05316, 1, 1, 1, 1, 1,
1.333937, 1.556651, -0.9790417, 1, 1, 1, 1, 1,
1.335022, -0.8335087, 2.917384, 1, 1, 1, 1, 1,
1.336473, -0.3278335, 1.047081, 1, 1, 1, 1, 1,
1.348556, 1.787814, 1.265512, 1, 1, 1, 1, 1,
1.359374, 0.9469793, 1.15983, 1, 1, 1, 1, 1,
1.359811, -0.8027757, 2.209792, 1, 1, 1, 1, 1,
1.367615, 0.04145274, 3.042193, 1, 1, 1, 1, 1,
1.371883, -0.02232265, 2.493036, 1, 1, 1, 1, 1,
1.373773, -0.6146575, 2.067266, 1, 1, 1, 1, 1,
1.376514, 0.58603, 1.47736, 1, 1, 1, 1, 1,
1.387741, -1.115683, 1.151561, 0, 0, 1, 1, 1,
1.399177, 1.77025, 0.6594716, 1, 0, 0, 1, 1,
1.405771, 0.005644794, 0.08776434, 1, 0, 0, 1, 1,
1.418152, 1.084638, -0.3935421, 1, 0, 0, 1, 1,
1.429231, -0.346752, 3.720886, 1, 0, 0, 1, 1,
1.444135, -1.059204, 1.748676, 1, 0, 0, 1, 1,
1.473881, -1.501148, 2.586745, 0, 0, 0, 1, 1,
1.474344, -0.01861768, 2.736876, 0, 0, 0, 1, 1,
1.48306, 1.492901, 0.5842047, 0, 0, 0, 1, 1,
1.490721, -1.289333, 2.541317, 0, 0, 0, 1, 1,
1.492379, 0.6137019, 1.738146, 0, 0, 0, 1, 1,
1.503971, -0.5379183, 0.5295682, 0, 0, 0, 1, 1,
1.50941, -1.300645, 2.333395, 0, 0, 0, 1, 1,
1.517248, -1.761947, 3.992007, 1, 1, 1, 1, 1,
1.536877, 0.4497132, 1.155492, 1, 1, 1, 1, 1,
1.538444, -0.838779, 2.194528, 1, 1, 1, 1, 1,
1.544485, -1.638659, 2.934218, 1, 1, 1, 1, 1,
1.545321, -0.3250498, 0.4274882, 1, 1, 1, 1, 1,
1.548305, -0.2459474, 0.9656089, 1, 1, 1, 1, 1,
1.583863, 0.6614974, 1.362747, 1, 1, 1, 1, 1,
1.602184, -0.6603093, 4.411589, 1, 1, 1, 1, 1,
1.618172, -0.817122, 3.044515, 1, 1, 1, 1, 1,
1.627202, -0.8111255, 1.406537, 1, 1, 1, 1, 1,
1.635409, -1.214368, 2.550539, 1, 1, 1, 1, 1,
1.639315, 0.7150074, 1.019512, 1, 1, 1, 1, 1,
1.684922, 0.1596427, 0.3239184, 1, 1, 1, 1, 1,
1.693614, -1.022919, 2.566887, 1, 1, 1, 1, 1,
1.693623, 1.226007, 0.218706, 1, 1, 1, 1, 1,
1.741505, -0.1774174, 2.66952, 0, 0, 1, 1, 1,
1.76873, -0.4956663, 2.167977, 1, 0, 0, 1, 1,
1.781616, -1.327599, 1.632414, 1, 0, 0, 1, 1,
1.793008, 0.54342, 0.9421267, 1, 0, 0, 1, 1,
1.801394, -0.2401637, 0.9792225, 1, 0, 0, 1, 1,
1.833948, 0.03554241, 1.23812, 1, 0, 0, 1, 1,
1.845789, 0.6424029, 3.277743, 0, 0, 0, 1, 1,
1.865235, 0.07885021, 0.9753731, 0, 0, 0, 1, 1,
1.86888, -1.25551, 2.988181, 0, 0, 0, 1, 1,
1.875162, 1.659395, 0.9294408, 0, 0, 0, 1, 1,
1.887784, 0.4298031, 1.141438, 0, 0, 0, 1, 1,
1.894955, 0.5919613, 2.41268, 0, 0, 0, 1, 1,
1.896692, -0.1728142, 3.265934, 0, 0, 0, 1, 1,
1.90926, 0.2942457, 2.576629, 1, 1, 1, 1, 1,
1.94492, -0.4768021, -0.1093466, 1, 1, 1, 1, 1,
1.951131, -1.195704, -0.2597795, 1, 1, 1, 1, 1,
1.974508, 0.3751265, 3.118317, 1, 1, 1, 1, 1,
1.984188, -0.1209113, -0.211124, 1, 1, 1, 1, 1,
2.018574, 1.73205, -0.07907232, 1, 1, 1, 1, 1,
2.026995, 1.143519, 0.234448, 1, 1, 1, 1, 1,
2.037247, -0.03761227, 1.949555, 1, 1, 1, 1, 1,
2.052945, 1.974314, 0.08162102, 1, 1, 1, 1, 1,
2.053419, -1.063605, 1.64474, 1, 1, 1, 1, 1,
2.063977, 0.9299625, 2.634379, 1, 1, 1, 1, 1,
2.10045, -0.4662192, 0.1248101, 1, 1, 1, 1, 1,
2.108458, 0.3611608, 0.124187, 1, 1, 1, 1, 1,
2.113293, -0.02863486, 0.3845908, 1, 1, 1, 1, 1,
2.116086, -1.215048, 0.381006, 1, 1, 1, 1, 1,
2.13097, 0.59886, 1.801748, 0, 0, 1, 1, 1,
2.158289, -0.3682964, 0.7478207, 1, 0, 0, 1, 1,
2.178497, -0.03182755, -0.2212601, 1, 0, 0, 1, 1,
2.186434, -1.938258, 3.99855, 1, 0, 0, 1, 1,
2.18836, -0.0259528, 1.200428, 1, 0, 0, 1, 1,
2.226056, -1.19148, 2.29158, 1, 0, 0, 1, 1,
2.228924, -0.4782388, 0.9458253, 0, 0, 0, 1, 1,
2.30726, -0.7944309, 1.562239, 0, 0, 0, 1, 1,
2.36895, -0.1656474, 2.838202, 0, 0, 0, 1, 1,
2.402872, 0.3918539, 2.153991, 0, 0, 0, 1, 1,
2.608593, -0.7942421, 3.278325, 0, 0, 0, 1, 1,
2.749787, 0.4478585, 1.673038, 0, 0, 0, 1, 1,
2.931064, -0.4044243, 2.268472, 0, 0, 0, 1, 1,
2.932597, -0.8583997, 2.206419, 1, 1, 1, 1, 1,
3.101213, -0.5023105, 1.697432, 1, 1, 1, 1, 1,
3.130417, -0.4562182, 1.827072, 1, 1, 1, 1, 1,
3.174915, -0.5274323, 2.521174, 1, 1, 1, 1, 1,
3.180978, -1.164337, 0.6712438, 1, 1, 1, 1, 1,
3.199826, 0.2412904, 3.219556, 1, 1, 1, 1, 1,
3.470271, 1.271661, 1.815218, 1, 1, 1, 1, 1
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
var radius = 9.824618;
var distance = 34.50855;
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
mvMatrix.translate( -0.004445553, -0.3690953, -0.1168058 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.50855);
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
