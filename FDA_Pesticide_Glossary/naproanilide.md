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
-3.776891, 0.2275722, -2.210728, 1, 0, 0, 1,
-3.015026, 0.03130525, -0.7115147, 1, 0.007843138, 0, 1,
-2.900823, 0.4400208, 0.04657611, 1, 0.01176471, 0, 1,
-2.893717, 0.344878, -0.0303219, 1, 0.01960784, 0, 1,
-2.773845, 0.0006871714, -3.227481, 1, 0.02352941, 0, 1,
-2.411175, 0.5936511, -0.1700393, 1, 0.03137255, 0, 1,
-2.407705, -1.020457, -2.26253, 1, 0.03529412, 0, 1,
-2.285745, 1.32535, -1.769977, 1, 0.04313726, 0, 1,
-2.282767, -1.423853, -3.094557, 1, 0.04705882, 0, 1,
-2.268512, -0.3028568, -2.415896, 1, 0.05490196, 0, 1,
-2.232285, 1.20607, -2.958173, 1, 0.05882353, 0, 1,
-2.230649, 1.66197, -3.830236, 1, 0.06666667, 0, 1,
-2.21627, 0.00582249, -2.524401, 1, 0.07058824, 0, 1,
-2.139422, -0.8452247, -0.7539949, 1, 0.07843138, 0, 1,
-2.103361, -0.2112977, -1.150379, 1, 0.08235294, 0, 1,
-2.078506, 1.403683, -0.242682, 1, 0.09019608, 0, 1,
-2.073836, 1.902909, -0.6108741, 1, 0.09411765, 0, 1,
-2.049195, 0.6991182, -1.535695, 1, 0.1019608, 0, 1,
-2.040581, -0.8243824, -1.327849, 1, 0.1098039, 0, 1,
-2.013946, 0.6649363, 0.2439627, 1, 0.1137255, 0, 1,
-1.909712, -0.7331171, -1.832587, 1, 0.1215686, 0, 1,
-1.86559, -0.4793952, -0.6829477, 1, 0.1254902, 0, 1,
-1.864441, 1.133194, -0.5586424, 1, 0.1333333, 0, 1,
-1.861738, -2.432654, -2.012413, 1, 0.1372549, 0, 1,
-1.850108, -1.716852, -2.948457, 1, 0.145098, 0, 1,
-1.847903, -0.9516861, -2.860561, 1, 0.1490196, 0, 1,
-1.841672, -0.08184572, -0.70619, 1, 0.1568628, 0, 1,
-1.831696, 1.461654, 0.8424084, 1, 0.1607843, 0, 1,
-1.763723, 1.847541, 0.5228427, 1, 0.1686275, 0, 1,
-1.738674, 0.1379852, -1.629575, 1, 0.172549, 0, 1,
-1.731972, -0.006098727, -3.317471, 1, 0.1803922, 0, 1,
-1.706575, 1.526834, 0.4167944, 1, 0.1843137, 0, 1,
-1.702901, 0.539817, -1.143234, 1, 0.1921569, 0, 1,
-1.696254, -1.822792, -2.952821, 1, 0.1960784, 0, 1,
-1.69283, 0.09476448, -2.047052, 1, 0.2039216, 0, 1,
-1.680188, -1.208768, -1.649982, 1, 0.2117647, 0, 1,
-1.676042, -0.6725909, -3.431001, 1, 0.2156863, 0, 1,
-1.661147, -0.3157938, -1.539399, 1, 0.2235294, 0, 1,
-1.65085, -0.7970292, -0.7562106, 1, 0.227451, 0, 1,
-1.648061, -0.6947224, -0.4691712, 1, 0.2352941, 0, 1,
-1.645361, -0.05218906, -2.012917, 1, 0.2392157, 0, 1,
-1.641474, 0.8343894, -1.770113, 1, 0.2470588, 0, 1,
-1.635346, -0.8659495, -0.8537343, 1, 0.2509804, 0, 1,
-1.631367, 0.6469375, -1.558868, 1, 0.2588235, 0, 1,
-1.629058, -0.6144087, -3.169531, 1, 0.2627451, 0, 1,
-1.617812, -0.9780428, -1.013777, 1, 0.2705882, 0, 1,
-1.614985, 1.032451, -2.444831, 1, 0.2745098, 0, 1,
-1.61027, -0.8627926, 0.2314985, 1, 0.282353, 0, 1,
-1.607281, 0.5306584, -0.4897446, 1, 0.2862745, 0, 1,
-1.602389, 0.3117661, -1.552624, 1, 0.2941177, 0, 1,
-1.594558, 1.973268, -0.2059939, 1, 0.3019608, 0, 1,
-1.594056, 0.9899591, -1.736833, 1, 0.3058824, 0, 1,
-1.580188, 0.6424189, -1.209203, 1, 0.3137255, 0, 1,
-1.574418, -0.9673064, -1.551123, 1, 0.3176471, 0, 1,
-1.572403, 1.112146, 0.7232274, 1, 0.3254902, 0, 1,
-1.570098, 0.4815446, -2.823212, 1, 0.3294118, 0, 1,
-1.569254, 0.03143499, 0.1592802, 1, 0.3372549, 0, 1,
-1.568122, 0.4290741, -0.557289, 1, 0.3411765, 0, 1,
-1.566451, 0.6127741, 0.2577594, 1, 0.3490196, 0, 1,
-1.564186, 0.4595447, 0.2282326, 1, 0.3529412, 0, 1,
-1.560008, 0.07754554, -0.3486658, 1, 0.3607843, 0, 1,
-1.553327, 1.072394, 0.3984307, 1, 0.3647059, 0, 1,
-1.547035, -0.09622681, -1.460407, 1, 0.372549, 0, 1,
-1.538186, -1.265597, -2.755501, 1, 0.3764706, 0, 1,
-1.537116, 0.6264884, -1.988954, 1, 0.3843137, 0, 1,
-1.530239, 0.6265243, -2.807688, 1, 0.3882353, 0, 1,
-1.503091, 0.9382452, -1.086145, 1, 0.3960784, 0, 1,
-1.493479, 0.2390167, -1.276245, 1, 0.4039216, 0, 1,
-1.485661, -0.3158218, -2.598379, 1, 0.4078431, 0, 1,
-1.474349, 0.2194581, -0.6904016, 1, 0.4156863, 0, 1,
-1.463964, -0.6833063, -2.464995, 1, 0.4196078, 0, 1,
-1.452599, -0.1376727, -0.9443931, 1, 0.427451, 0, 1,
-1.448742, -0.9439642, -1.075691, 1, 0.4313726, 0, 1,
-1.422556, 0.5150135, -2.0753, 1, 0.4392157, 0, 1,
-1.401622, 0.003372717, -2.712416, 1, 0.4431373, 0, 1,
-1.395843, -0.6607905, -1.542253, 1, 0.4509804, 0, 1,
-1.391841, 0.1459689, -0.7837856, 1, 0.454902, 0, 1,
-1.390496, 1.226865, -1.470219, 1, 0.4627451, 0, 1,
-1.382044, -1.034919, -1.045277, 1, 0.4666667, 0, 1,
-1.376173, 0.9712363, -0.1267094, 1, 0.4745098, 0, 1,
-1.371881, -0.6208702, -2.363345, 1, 0.4784314, 0, 1,
-1.369074, -1.610369, -1.244417, 1, 0.4862745, 0, 1,
-1.353422, -0.7519605, -2.903572, 1, 0.4901961, 0, 1,
-1.330944, 0.04737669, -2.59523, 1, 0.4980392, 0, 1,
-1.326293, -0.3097781, -2.114362, 1, 0.5058824, 0, 1,
-1.322685, 0.6215279, -0.5574063, 1, 0.509804, 0, 1,
-1.306836, -0.8449175, -2.943989, 1, 0.5176471, 0, 1,
-1.306794, -0.8354449, -0.9796582, 1, 0.5215687, 0, 1,
-1.303762, -0.5137622, -0.5341352, 1, 0.5294118, 0, 1,
-1.297486, -1.097847, -3.39298, 1, 0.5333334, 0, 1,
-1.296919, -0.3369798, -1.124226, 1, 0.5411765, 0, 1,
-1.295525, -0.2647823, -1.091787, 1, 0.5450981, 0, 1,
-1.289938, -1.490316, -4.306819, 1, 0.5529412, 0, 1,
-1.289575, -0.5682299, -1.491582, 1, 0.5568628, 0, 1,
-1.275973, 0.8932252, -0.5657951, 1, 0.5647059, 0, 1,
-1.271217, -1.068328, -2.471851, 1, 0.5686275, 0, 1,
-1.270157, -0.5136175, -3.014582, 1, 0.5764706, 0, 1,
-1.267107, -0.293814, -0.4128682, 1, 0.5803922, 0, 1,
-1.258192, -0.8102493, -0.2583049, 1, 0.5882353, 0, 1,
-1.257668, 0.4269758, -1.412893, 1, 0.5921569, 0, 1,
-1.25278, 0.05782099, -1.48773, 1, 0.6, 0, 1,
-1.252569, 1.303449, -0.1255458, 1, 0.6078432, 0, 1,
-1.249301, -1.179138, -1.051573, 1, 0.6117647, 0, 1,
-1.247839, -0.1740286, -1.085681, 1, 0.6196079, 0, 1,
-1.244661, -1.711832, -3.095414, 1, 0.6235294, 0, 1,
-1.244465, 1.303514, -1.017527, 1, 0.6313726, 0, 1,
-1.242256, -0.1432117, -1.457227, 1, 0.6352941, 0, 1,
-1.231932, 0.5994489, -2.654573, 1, 0.6431373, 0, 1,
-1.22832, -0.5436803, -0.9243806, 1, 0.6470588, 0, 1,
-1.21428, 0.6689483, 0.01557358, 1, 0.654902, 0, 1,
-1.213227, 0.6830458, -0.5650268, 1, 0.6588235, 0, 1,
-1.206702, 0.4283401, -1.843646, 1, 0.6666667, 0, 1,
-1.201843, 1.639741, -1.835312, 1, 0.6705883, 0, 1,
-1.197377, -0.7003928, -3.687643, 1, 0.6784314, 0, 1,
-1.193415, 0.3136852, -1.2809, 1, 0.682353, 0, 1,
-1.191389, -0.5839129, -2.033094, 1, 0.6901961, 0, 1,
-1.189159, 1.748237, -0.1926423, 1, 0.6941177, 0, 1,
-1.188393, 1.348238, -1.561611, 1, 0.7019608, 0, 1,
-1.180647, 0.9040733, -1.312865, 1, 0.7098039, 0, 1,
-1.178788, 1.195032, -0.3702675, 1, 0.7137255, 0, 1,
-1.176287, -1.28846, -2.416049, 1, 0.7215686, 0, 1,
-1.175985, -0.925924, -3.358923, 1, 0.7254902, 0, 1,
-1.174469, 0.7721727, -1.991411, 1, 0.7333333, 0, 1,
-1.17381, -0.4058954, -1.963802, 1, 0.7372549, 0, 1,
-1.164733, -1.408322, 0.2565419, 1, 0.7450981, 0, 1,
-1.161652, -0.751761, -2.681026, 1, 0.7490196, 0, 1,
-1.157768, 0.3030806, -2.62337, 1, 0.7568628, 0, 1,
-1.156407, 0.6393995, -0.6896169, 1, 0.7607843, 0, 1,
-1.145454, 2.103899, -0.195491, 1, 0.7686275, 0, 1,
-1.144029, 0.1697172, 0.2051736, 1, 0.772549, 0, 1,
-1.143933, 0.5961367, -1.294638, 1, 0.7803922, 0, 1,
-1.143034, -0.6746649, -0.4146756, 1, 0.7843137, 0, 1,
-1.14125, -0.09492154, -1.17704, 1, 0.7921569, 0, 1,
-1.13922, -2.188105, -1.561728, 1, 0.7960784, 0, 1,
-1.137826, -0.0836412, -1.586278, 1, 0.8039216, 0, 1,
-1.130067, -0.274673, -1.570996, 1, 0.8117647, 0, 1,
-1.128742, -0.3296429, -3.367071, 1, 0.8156863, 0, 1,
-1.128374, 1.008049, -1.065325, 1, 0.8235294, 0, 1,
-1.127555, -0.9319023, -2.617101, 1, 0.827451, 0, 1,
-1.123116, 1.779356, -2.054888, 1, 0.8352941, 0, 1,
-1.116647, -0.4884489, -1.409778, 1, 0.8392157, 0, 1,
-1.106729, 0.3267285, 0.3363974, 1, 0.8470588, 0, 1,
-1.099031, 0.7321079, 0.2725953, 1, 0.8509804, 0, 1,
-1.097999, -0.1529016, -2.121722, 1, 0.8588235, 0, 1,
-1.09767, -0.4724703, -2.59595, 1, 0.8627451, 0, 1,
-1.096845, -1.74633, -3.408141, 1, 0.8705882, 0, 1,
-1.087491, 1.63492, 0.6356026, 1, 0.8745098, 0, 1,
-1.08508, -1.038226, -2.45831, 1, 0.8823529, 0, 1,
-1.077607, 2.582469, -1.862602, 1, 0.8862745, 0, 1,
-1.055239, -0.4573972, -2.944111, 1, 0.8941177, 0, 1,
-1.033309, -1.717779, -3.096508, 1, 0.8980392, 0, 1,
-1.031611, -0.2202061, -1.541407, 1, 0.9058824, 0, 1,
-1.027518, 0.09610023, -1.792702, 1, 0.9137255, 0, 1,
-1.016132, 0.3136146, -1.173427, 1, 0.9176471, 0, 1,
-1.014253, -2.759588, -3.635138, 1, 0.9254902, 0, 1,
-1.008241, -0.7683811, -1.670122, 1, 0.9294118, 0, 1,
-1.001803, -0.7264702, -3.405742, 1, 0.9372549, 0, 1,
-0.9983209, -0.6282357, -1.937656, 1, 0.9411765, 0, 1,
-0.9927634, -2.362756, -1.783256, 1, 0.9490196, 0, 1,
-0.9923589, -1.207628, -2.340925, 1, 0.9529412, 0, 1,
-0.988208, 0.579459, -1.651597, 1, 0.9607843, 0, 1,
-0.9843574, 1.156899, -0.9447519, 1, 0.9647059, 0, 1,
-0.9779686, 0.3245027, -1.053948, 1, 0.972549, 0, 1,
-0.9776105, -1.615782, -2.762427, 1, 0.9764706, 0, 1,
-0.9774159, 1.188814, -0.3418486, 1, 0.9843137, 0, 1,
-0.9761454, 0.8936751, -1.853018, 1, 0.9882353, 0, 1,
-0.9696277, -1.099186, -2.526733, 1, 0.9960784, 0, 1,
-0.9659992, -2.389739, -2.801652, 0.9960784, 1, 0, 1,
-0.9658165, -0.2735689, -0.9923162, 0.9921569, 1, 0, 1,
-0.9656337, -0.8851396, -2.207849, 0.9843137, 1, 0, 1,
-0.965528, -0.8069179, -1.93015, 0.9803922, 1, 0, 1,
-0.9647684, 0.6275049, -2.370422, 0.972549, 1, 0, 1,
-0.9625385, -0.703443, -3.521064, 0.9686275, 1, 0, 1,
-0.9611791, 0.2332416, -0.00397348, 0.9607843, 1, 0, 1,
-0.9611515, -1.555579, -1.628511, 0.9568627, 1, 0, 1,
-0.9501132, 0.5083483, -1.447927, 0.9490196, 1, 0, 1,
-0.9500305, 0.8401705, -1.345589, 0.945098, 1, 0, 1,
-0.9470987, -0.01849111, -0.9306413, 0.9372549, 1, 0, 1,
-0.9469385, 1.232383, -0.398838, 0.9333333, 1, 0, 1,
-0.9468619, 0.6712443, -2.614492, 0.9254902, 1, 0, 1,
-0.9446936, -0.2648229, -2.254599, 0.9215686, 1, 0, 1,
-0.9431668, 0.5311959, -0.203996, 0.9137255, 1, 0, 1,
-0.9424208, -0.3318141, -1.862484, 0.9098039, 1, 0, 1,
-0.9367148, 0.6659191, 0.06472962, 0.9019608, 1, 0, 1,
-0.9327193, -0.03387395, -1.258044, 0.8941177, 1, 0, 1,
-0.9283862, -1.376643, -3.311067, 0.8901961, 1, 0, 1,
-0.9274137, 0.5477588, -0.7193892, 0.8823529, 1, 0, 1,
-0.9232337, 0.5250578, -1.145537, 0.8784314, 1, 0, 1,
-0.9230753, -1.817048, -1.837501, 0.8705882, 1, 0, 1,
-0.9197914, -0.7180106, -3.90764, 0.8666667, 1, 0, 1,
-0.91774, 0.6359721, 0.4086422, 0.8588235, 1, 0, 1,
-0.9156757, 0.7725759, -1.586992, 0.854902, 1, 0, 1,
-0.9155927, -0.4565996, -4.123307, 0.8470588, 1, 0, 1,
-0.9145826, -0.2849131, -2.968983, 0.8431373, 1, 0, 1,
-0.9083079, 0.1628629, -1.526498, 0.8352941, 1, 0, 1,
-0.9064882, -1.513103, -2.317746, 0.8313726, 1, 0, 1,
-0.9019188, -1.261161, -4.704974, 0.8235294, 1, 0, 1,
-0.9007808, -0.7571642, -2.13619, 0.8196079, 1, 0, 1,
-0.9005548, 1.637002, -1.241078, 0.8117647, 1, 0, 1,
-0.8910843, -0.3781375, -0.1857234, 0.8078431, 1, 0, 1,
-0.8860373, 0.458901, 0.09159682, 0.8, 1, 0, 1,
-0.8854321, -0.5594518, -1.253659, 0.7921569, 1, 0, 1,
-0.8832237, -0.4870682, -2.07774, 0.7882353, 1, 0, 1,
-0.8802753, -1.652456, -3.475965, 0.7803922, 1, 0, 1,
-0.8770953, -1.318475, -2.99227, 0.7764706, 1, 0, 1,
-0.8764659, 0.1805052, -1.645426, 0.7686275, 1, 0, 1,
-0.8764449, -0.5471146, -1.835957, 0.7647059, 1, 0, 1,
-0.870797, -0.9936588, -2.143239, 0.7568628, 1, 0, 1,
-0.8635634, 0.7333611, -0.02549233, 0.7529412, 1, 0, 1,
-0.8635495, -1.060821, -2.429159, 0.7450981, 1, 0, 1,
-0.8621345, 0.3243081, -0.7162618, 0.7411765, 1, 0, 1,
-0.8572475, -0.364121, -3.317607, 0.7333333, 1, 0, 1,
-0.8567184, -0.6505916, -2.350184, 0.7294118, 1, 0, 1,
-0.8557491, 0.8917301, -2.308034, 0.7215686, 1, 0, 1,
-0.8476685, -0.4399583, -1.039015, 0.7176471, 1, 0, 1,
-0.8455966, -0.6879869, -4.453987, 0.7098039, 1, 0, 1,
-0.8402446, 0.9110263, -0.06590346, 0.7058824, 1, 0, 1,
-0.8369153, 0.03612484, -1.471432, 0.6980392, 1, 0, 1,
-0.8368532, 0.07591589, 0.01427083, 0.6901961, 1, 0, 1,
-0.8323196, 1.127083, -0.7987322, 0.6862745, 1, 0, 1,
-0.8293789, -0.2600729, -1.539779, 0.6784314, 1, 0, 1,
-0.8268427, -0.2142433, -1.297282, 0.6745098, 1, 0, 1,
-0.8259897, 0.8270307, -0.1327876, 0.6666667, 1, 0, 1,
-0.8240671, 0.1831144, -1.086753, 0.6627451, 1, 0, 1,
-0.8207026, 0.9273238, -1.238211, 0.654902, 1, 0, 1,
-0.8154712, -0.4826032, -2.437164, 0.6509804, 1, 0, 1,
-0.8137945, -0.188603, -1.288595, 0.6431373, 1, 0, 1,
-0.8109593, 0.1870538, -2.052899, 0.6392157, 1, 0, 1,
-0.800447, 0.7543703, -1.132727, 0.6313726, 1, 0, 1,
-0.7876008, -1.629274, -1.777147, 0.627451, 1, 0, 1,
-0.7715212, -0.166196, -2.606702, 0.6196079, 1, 0, 1,
-0.7694817, 0.5468838, -0.5856928, 0.6156863, 1, 0, 1,
-0.7694103, -1.234383, -0.9866581, 0.6078432, 1, 0, 1,
-0.7665902, -1.351495, -4.352637, 0.6039216, 1, 0, 1,
-0.7607227, -0.3790002, -2.215108, 0.5960785, 1, 0, 1,
-0.7589965, -0.2186246, -1.293038, 0.5882353, 1, 0, 1,
-0.7543504, -0.6307348, -2.611655, 0.5843138, 1, 0, 1,
-0.752878, -1.453391, -2.934213, 0.5764706, 1, 0, 1,
-0.7414419, 0.7362797, -0.2477602, 0.572549, 1, 0, 1,
-0.7377785, -0.2294459, -2.227473, 0.5647059, 1, 0, 1,
-0.7364622, -0.4864116, -2.058024, 0.5607843, 1, 0, 1,
-0.7356652, -0.5017984, -2.187449, 0.5529412, 1, 0, 1,
-0.7326253, 0.7155258, -2.070157, 0.5490196, 1, 0, 1,
-0.729222, -0.3750832, -3.535431, 0.5411765, 1, 0, 1,
-0.7287896, 0.5475274, -1.510198, 0.5372549, 1, 0, 1,
-0.7272231, 0.08235383, -1.316072, 0.5294118, 1, 0, 1,
-0.7095083, 2.41431, -0.5627908, 0.5254902, 1, 0, 1,
-0.7089675, -0.04077106, -1.704796, 0.5176471, 1, 0, 1,
-0.6974427, 0.9512246, -1.224838, 0.5137255, 1, 0, 1,
-0.6930529, -0.418076, -2.791914, 0.5058824, 1, 0, 1,
-0.6912268, -0.3287203, -0.7474615, 0.5019608, 1, 0, 1,
-0.6893235, -0.600209, -0.3380928, 0.4941176, 1, 0, 1,
-0.6858118, 0.5127916, -1.64136, 0.4862745, 1, 0, 1,
-0.6828305, 0.5609429, -0.3370698, 0.4823529, 1, 0, 1,
-0.676006, -0.06920981, -2.773525, 0.4745098, 1, 0, 1,
-0.6741813, 0.2015574, -0.08733682, 0.4705882, 1, 0, 1,
-0.672273, -0.4424648, -2.550147, 0.4627451, 1, 0, 1,
-0.6657807, 0.3679146, -1.588322, 0.4588235, 1, 0, 1,
-0.6639516, 0.755092, -1.448848, 0.4509804, 1, 0, 1,
-0.6632032, -2.434616, -3.762575, 0.4470588, 1, 0, 1,
-0.6549599, 0.09166376, 0.09435315, 0.4392157, 1, 0, 1,
-0.6536054, 0.5537367, -1.034007, 0.4352941, 1, 0, 1,
-0.6532301, 0.4822472, -1.097363, 0.427451, 1, 0, 1,
-0.6503193, -1.928335, -3.994735, 0.4235294, 1, 0, 1,
-0.6492113, -0.8770108, -1.756965, 0.4156863, 1, 0, 1,
-0.6415004, -0.2607429, -2.290554, 0.4117647, 1, 0, 1,
-0.6379483, -0.2098315, -1.302087, 0.4039216, 1, 0, 1,
-0.6343608, -1.138204, -2.375701, 0.3960784, 1, 0, 1,
-0.6332335, 0.2313296, -1.617999, 0.3921569, 1, 0, 1,
-0.6329371, 1.267933, -0.1877947, 0.3843137, 1, 0, 1,
-0.6275541, -0.9140105, -2.119817, 0.3803922, 1, 0, 1,
-0.625586, 0.4843712, -0.8070227, 0.372549, 1, 0, 1,
-0.6197159, -0.4557612, -2.002126, 0.3686275, 1, 0, 1,
-0.6136329, -0.4285005, -1.276265, 0.3607843, 1, 0, 1,
-0.6132504, -0.4880138, -2.086551, 0.3568628, 1, 0, 1,
-0.6094226, -0.5415591, -2.526976, 0.3490196, 1, 0, 1,
-0.604363, -0.3416405, -2.673995, 0.345098, 1, 0, 1,
-0.6031438, -0.2188201, -2.239504, 0.3372549, 1, 0, 1,
-0.6008182, 0.03177725, -1.219341, 0.3333333, 1, 0, 1,
-0.5975612, 0.5807087, -1.948207, 0.3254902, 1, 0, 1,
-0.5963531, 0.1498963, -1.939453, 0.3215686, 1, 0, 1,
-0.5948876, 1.989057, 0.4717382, 0.3137255, 1, 0, 1,
-0.5937462, 1.189164, -1.609403, 0.3098039, 1, 0, 1,
-0.5908074, 1.542977, -1.037009, 0.3019608, 1, 0, 1,
-0.5895041, -1.88176, -3.006786, 0.2941177, 1, 0, 1,
-0.5889972, -1.470654, -3.75104, 0.2901961, 1, 0, 1,
-0.5861642, 1.178733, 0.1321344, 0.282353, 1, 0, 1,
-0.585027, 2.200784, -0.08533042, 0.2784314, 1, 0, 1,
-0.5838774, -1.107838, -1.544203, 0.2705882, 1, 0, 1,
-0.5830415, 1.733046, 0.2481895, 0.2666667, 1, 0, 1,
-0.5817157, 0.2467359, -3.696966, 0.2588235, 1, 0, 1,
-0.5766177, 0.07389536, -2.873188, 0.254902, 1, 0, 1,
-0.5761322, -1.106807, -1.453437, 0.2470588, 1, 0, 1,
-0.5755827, 1.581185, 0.1398248, 0.2431373, 1, 0, 1,
-0.572075, 0.01634448, 0.5935183, 0.2352941, 1, 0, 1,
-0.5718512, -0.8272204, -1.95186, 0.2313726, 1, 0, 1,
-0.5653726, 0.233625, -1.602969, 0.2235294, 1, 0, 1,
-0.5642704, 0.4033083, -0.726424, 0.2196078, 1, 0, 1,
-0.5628353, -1.574033, -2.321554, 0.2117647, 1, 0, 1,
-0.5569693, 0.486744, -1.886551, 0.2078431, 1, 0, 1,
-0.5561482, 0.5418984, -0.1343584, 0.2, 1, 0, 1,
-0.5502519, 1.061876, -0.8860916, 0.1921569, 1, 0, 1,
-0.5447975, -0.2112276, -0.8126662, 0.1882353, 1, 0, 1,
-0.543874, 0.3656873, -1.958717, 0.1803922, 1, 0, 1,
-0.5433203, 0.4835994, -1.404225, 0.1764706, 1, 0, 1,
-0.5423734, 0.6897411, 0.1983197, 0.1686275, 1, 0, 1,
-0.5421159, 0.5283042, -0.5691198, 0.1647059, 1, 0, 1,
-0.5380878, -0.3589788, -2.034188, 0.1568628, 1, 0, 1,
-0.5365642, 1.097886, -0.5226675, 0.1529412, 1, 0, 1,
-0.5343031, 1.022973, 0.5933089, 0.145098, 1, 0, 1,
-0.5342745, 1.177484, 0.2094695, 0.1411765, 1, 0, 1,
-0.5335406, 0.8860832, -0.2039586, 0.1333333, 1, 0, 1,
-0.5328255, -1.589639, -1.946974, 0.1294118, 1, 0, 1,
-0.525875, 0.4360922, -0.08731616, 0.1215686, 1, 0, 1,
-0.5122259, -0.0177406, -1.628744, 0.1176471, 1, 0, 1,
-0.5102505, 0.4323793, -1.686143, 0.1098039, 1, 0, 1,
-0.5098618, -0.6130775, -0.5432321, 0.1058824, 1, 0, 1,
-0.5046233, -0.2928975, 0.07277211, 0.09803922, 1, 0, 1,
-0.4999124, 0.504572, -0.9131796, 0.09019608, 1, 0, 1,
-0.495115, -0.5032741, -3.255909, 0.08627451, 1, 0, 1,
-0.49501, -1.126351, -2.448318, 0.07843138, 1, 0, 1,
-0.4942969, 0.02380611, -2.562602, 0.07450981, 1, 0, 1,
-0.4919321, 0.9302139, -0.1191545, 0.06666667, 1, 0, 1,
-0.4909735, 0.2662294, -1.45919, 0.0627451, 1, 0, 1,
-0.4863008, -0.9423127, -2.080519, 0.05490196, 1, 0, 1,
-0.4861922, 0.4272807, -2.949533, 0.05098039, 1, 0, 1,
-0.4781852, -0.513442, -1.630241, 0.04313726, 1, 0, 1,
-0.4774306, -0.0563221, -1.406061, 0.03921569, 1, 0, 1,
-0.4772558, 2.029245, 1.111942, 0.03137255, 1, 0, 1,
-0.4742759, -1.565868, -3.98672, 0.02745098, 1, 0, 1,
-0.4721636, 0.1650744, -3.137858, 0.01960784, 1, 0, 1,
-0.4714301, 1.341315, -0.3051585, 0.01568628, 1, 0, 1,
-0.4573093, 0.9769098, -0.2771212, 0.007843138, 1, 0, 1,
-0.452249, 0.9746991, -1.112543, 0.003921569, 1, 0, 1,
-0.4352023, 0.3187212, -2.878503, 0, 1, 0.003921569, 1,
-0.4314953, -0.1499676, -1.163899, 0, 1, 0.01176471, 1,
-0.4313564, 0.2330896, -0.2703559, 0, 1, 0.01568628, 1,
-0.4294274, -1.390048, -2.17331, 0, 1, 0.02352941, 1,
-0.4208367, -0.1646039, 0.7724509, 0, 1, 0.02745098, 1,
-0.4207999, 1.013287, -0.8756391, 0, 1, 0.03529412, 1,
-0.41942, 1.250346, 1.128086, 0, 1, 0.03921569, 1,
-0.4188853, 0.4842161, 0.12905, 0, 1, 0.04705882, 1,
-0.4181687, 0.6671414, -0.8394536, 0, 1, 0.05098039, 1,
-0.4171096, -0.8090901, -3.17861, 0, 1, 0.05882353, 1,
-0.4164558, -1.077605, -3.829924, 0, 1, 0.0627451, 1,
-0.410917, -0.247311, -1.047609, 0, 1, 0.07058824, 1,
-0.4050782, 2.547977, 0.06709898, 0, 1, 0.07450981, 1,
-0.4027594, -0.01859248, -1.586395, 0, 1, 0.08235294, 1,
-0.4014143, 0.6243126, -0.1259281, 0, 1, 0.08627451, 1,
-0.3969667, -0.8044096, -1.195746, 0, 1, 0.09411765, 1,
-0.3943524, -0.1047059, -2.18781, 0, 1, 0.1019608, 1,
-0.3896671, 1.258656, -0.1042796, 0, 1, 0.1058824, 1,
-0.3868341, -0.6565306, -2.843774, 0, 1, 0.1137255, 1,
-0.3848602, -0.5067715, -2.948073, 0, 1, 0.1176471, 1,
-0.384509, 0.3822113, -1.359405, 0, 1, 0.1254902, 1,
-0.3831053, 1.158645, 2.442667, 0, 1, 0.1294118, 1,
-0.3830084, 0.8130326, -1.114121, 0, 1, 0.1372549, 1,
-0.3828456, 0.9677968, -0.4249543, 0, 1, 0.1411765, 1,
-0.3757555, 0.976617, -1.726781, 0, 1, 0.1490196, 1,
-0.3743237, -0.6804236, -1.437343, 0, 1, 0.1529412, 1,
-0.3733394, -2.247251, -5.812181, 0, 1, 0.1607843, 1,
-0.3714151, 1.478677, 0.214551, 0, 1, 0.1647059, 1,
-0.3682674, -0.02634366, -2.349997, 0, 1, 0.172549, 1,
-0.3631886, 1.115585, -1.680285, 0, 1, 0.1764706, 1,
-0.3625312, -2.255343, -3.894964, 0, 1, 0.1843137, 1,
-0.3569025, 0.2676187, 0.4401555, 0, 1, 0.1882353, 1,
-0.3561916, -0.1210278, -2.154517, 0, 1, 0.1960784, 1,
-0.3555147, -0.5618371, -2.580807, 0, 1, 0.2039216, 1,
-0.3515578, -1.339459, -1.805827, 0, 1, 0.2078431, 1,
-0.3476804, -1.165227, -2.533972, 0, 1, 0.2156863, 1,
-0.345736, 0.2800564, -0.06581785, 0, 1, 0.2196078, 1,
-0.3422298, 1.638326, 0.331745, 0, 1, 0.227451, 1,
-0.3404357, 0.6913093, 0.5068417, 0, 1, 0.2313726, 1,
-0.3345088, -1.063837, -2.067323, 0, 1, 0.2392157, 1,
-0.3331492, -0.3201519, -4.042734, 0, 1, 0.2431373, 1,
-0.3275399, 0.8834592, -0.0539559, 0, 1, 0.2509804, 1,
-0.3239236, 0.2263276, -1.084177, 0, 1, 0.254902, 1,
-0.3230869, -0.668048, -1.969758, 0, 1, 0.2627451, 1,
-0.3218679, -1.625295, -2.445611, 0, 1, 0.2666667, 1,
-0.3138298, 0.4052893, -0.9469957, 0, 1, 0.2745098, 1,
-0.3134558, -0.1133145, -1.929856, 0, 1, 0.2784314, 1,
-0.3098905, -1.446508, -2.825968, 0, 1, 0.2862745, 1,
-0.3085781, -0.3824736, -3.69898, 0, 1, 0.2901961, 1,
-0.3038978, 0.08075712, 0.336237, 0, 1, 0.2980392, 1,
-0.3026415, -0.9026778, -2.986062, 0, 1, 0.3058824, 1,
-0.3017652, 0.4427937, 0.5030006, 0, 1, 0.3098039, 1,
-0.3002484, -1.408111, -5.464502, 0, 1, 0.3176471, 1,
-0.2936054, 0.03412471, -2.100174, 0, 1, 0.3215686, 1,
-0.2925443, -0.4493896, -2.776844, 0, 1, 0.3294118, 1,
-0.2919271, 1.293876, 1.32865, 0, 1, 0.3333333, 1,
-0.2877249, -0.8278089, -2.036146, 0, 1, 0.3411765, 1,
-0.2853955, -0.675885, -1.586442, 0, 1, 0.345098, 1,
-0.2797931, 2.057417, -0.735344, 0, 1, 0.3529412, 1,
-0.2791612, -0.6122943, -4.181351, 0, 1, 0.3568628, 1,
-0.2780421, 0.5636522, -1.408843, 0, 1, 0.3647059, 1,
-0.2768339, -0.6990452, -2.885547, 0, 1, 0.3686275, 1,
-0.2756583, 0.5376078, 0.4010572, 0, 1, 0.3764706, 1,
-0.274899, 0.7516264, -1.04593, 0, 1, 0.3803922, 1,
-0.2722099, -0.121553, -1.464406, 0, 1, 0.3882353, 1,
-0.2668881, 0.6182562, -1.553624, 0, 1, 0.3921569, 1,
-0.2649427, -0.4435292, -4.349639, 0, 1, 0.4, 1,
-0.2644296, 2.918599, -1.672972, 0, 1, 0.4078431, 1,
-0.2629178, 0.8548536, -0.895296, 0, 1, 0.4117647, 1,
-0.2620099, -1.399505, -2.774081, 0, 1, 0.4196078, 1,
-0.2610965, 0.1472084, -0.001439035, 0, 1, 0.4235294, 1,
-0.2493218, -0.07184099, -1.099622, 0, 1, 0.4313726, 1,
-0.248515, 1.728993, -0.2601185, 0, 1, 0.4352941, 1,
-0.2448866, -0.4093895, -2.147571, 0, 1, 0.4431373, 1,
-0.2445557, -0.5577644, -1.418394, 0, 1, 0.4470588, 1,
-0.2441646, 1.297336, 0.5096549, 0, 1, 0.454902, 1,
-0.2425598, 0.9903451, -2.648638, 0, 1, 0.4588235, 1,
-0.2404514, 0.6176632, 0.2832567, 0, 1, 0.4666667, 1,
-0.2374977, -0.8275496, -2.506505, 0, 1, 0.4705882, 1,
-0.2360821, -1.589962, -4.131297, 0, 1, 0.4784314, 1,
-0.2279477, 0.6029502, -2.267925, 0, 1, 0.4823529, 1,
-0.226636, -1.709361, -2.275896, 0, 1, 0.4901961, 1,
-0.2198639, -0.5278014, -3.212614, 0, 1, 0.4941176, 1,
-0.2188352, -1.283361, -0.1750934, 0, 1, 0.5019608, 1,
-0.2181537, 1.850181, 0.3562837, 0, 1, 0.509804, 1,
-0.2170751, -0.8113324, -2.236166, 0, 1, 0.5137255, 1,
-0.2169088, -0.6486709, -2.64493, 0, 1, 0.5215687, 1,
-0.2154355, 1.353385, -0.3825591, 0, 1, 0.5254902, 1,
-0.2138515, 1.280754, 0.0102547, 0, 1, 0.5333334, 1,
-0.2130378, 1.318406, 0.6876133, 0, 1, 0.5372549, 1,
-0.2084094, 0.02318568, -0.5824358, 0, 1, 0.5450981, 1,
-0.1981638, 0.6273217, 1.503024, 0, 1, 0.5490196, 1,
-0.1971439, -1.489784, -3.498538, 0, 1, 0.5568628, 1,
-0.1967436, 1.033935, -0.3510384, 0, 1, 0.5607843, 1,
-0.1964539, -0.270048, -2.576849, 0, 1, 0.5686275, 1,
-0.1938962, -0.09305953, -0.4484914, 0, 1, 0.572549, 1,
-0.1917162, 1.952231, 0.8698685, 0, 1, 0.5803922, 1,
-0.1909162, 0.1201319, 1.218993, 0, 1, 0.5843138, 1,
-0.1887364, 0.2027048, -0.313011, 0, 1, 0.5921569, 1,
-0.1843879, 0.4042059, -0.09640469, 0, 1, 0.5960785, 1,
-0.1790859, 1.497322, -1.13715, 0, 1, 0.6039216, 1,
-0.1771359, 0.4998874, 0.288472, 0, 1, 0.6117647, 1,
-0.173778, 0.04266634, 0.2056473, 0, 1, 0.6156863, 1,
-0.1729264, -2.326685, -3.91526, 0, 1, 0.6235294, 1,
-0.1708759, 0.05775858, -1.966304, 0, 1, 0.627451, 1,
-0.1679138, -0.1237021, -1.690054, 0, 1, 0.6352941, 1,
-0.155148, 0.1371992, -3.171122, 0, 1, 0.6392157, 1,
-0.1540035, 1.368688, 0.6568986, 0, 1, 0.6470588, 1,
-0.1526121, -0.1490724, -3.723042, 0, 1, 0.6509804, 1,
-0.1486199, 0.3362419, 0.214413, 0, 1, 0.6588235, 1,
-0.1478329, -1.09628, -2.233777, 0, 1, 0.6627451, 1,
-0.1476449, -1.33302, -2.668195, 0, 1, 0.6705883, 1,
-0.1459196, -1.515593, -4.473368, 0, 1, 0.6745098, 1,
-0.1457535, -1.079692, -3.41514, 0, 1, 0.682353, 1,
-0.1424738, 1.014053, 0.7876295, 0, 1, 0.6862745, 1,
-0.141526, -0.05865778, -1.57204, 0, 1, 0.6941177, 1,
-0.1393097, 0.1369175, -1.270969, 0, 1, 0.7019608, 1,
-0.1380444, 0.09583173, -1.691011, 0, 1, 0.7058824, 1,
-0.137922, -0.4732398, -3.956647, 0, 1, 0.7137255, 1,
-0.1346454, -0.7194139, -2.684191, 0, 1, 0.7176471, 1,
-0.1323878, 1.746867, 0.3430383, 0, 1, 0.7254902, 1,
-0.1253234, -0.7426063, -3.030865, 0, 1, 0.7294118, 1,
-0.1169582, -0.9389961, -3.325113, 0, 1, 0.7372549, 1,
-0.1147487, -1.098212, 0.1006715, 0, 1, 0.7411765, 1,
-0.1116898, 1.774261, 1.035346, 0, 1, 0.7490196, 1,
-0.1107732, 0.6458852, -1.579475, 0, 1, 0.7529412, 1,
-0.1037201, -0.7267066, -2.072668, 0, 1, 0.7607843, 1,
-0.1017383, -0.01233998, -0.4033128, 0, 1, 0.7647059, 1,
-0.09983864, -0.5229094, -3.31677, 0, 1, 0.772549, 1,
-0.09908388, -1.84193, -5.171721, 0, 1, 0.7764706, 1,
-0.09835507, -0.05700916, -2.173647, 0, 1, 0.7843137, 1,
-0.09765005, -0.7020382, -3.883827, 0, 1, 0.7882353, 1,
-0.09711138, -0.1399163, -2.715142, 0, 1, 0.7960784, 1,
-0.09682323, -0.92785, -3.828528, 0, 1, 0.8039216, 1,
-0.09268987, -1.622315, -3.90642, 0, 1, 0.8078431, 1,
-0.08934488, -0.3059866, -3.930737, 0, 1, 0.8156863, 1,
-0.08782419, -0.1315206, -2.726301, 0, 1, 0.8196079, 1,
-0.08442596, 0.2819647, -0.792064, 0, 1, 0.827451, 1,
-0.0836691, 0.2406016, 0.5149292, 0, 1, 0.8313726, 1,
-0.07805452, -0.7215179, -2.705404, 0, 1, 0.8392157, 1,
-0.0730954, 1.27395, -0.5110682, 0, 1, 0.8431373, 1,
-0.07219994, 0.03666211, -1.961467, 0, 1, 0.8509804, 1,
-0.07176767, -1.104207, -3.075582, 0, 1, 0.854902, 1,
-0.06976804, 0.6795613, 1.657111, 0, 1, 0.8627451, 1,
-0.06923611, 0.1683961, 0.6531543, 0, 1, 0.8666667, 1,
-0.06600208, -1.257061, -2.715698, 0, 1, 0.8745098, 1,
-0.06075627, -1.253004, -2.347758, 0, 1, 0.8784314, 1,
-0.05951323, 0.1801114, -0.1822122, 0, 1, 0.8862745, 1,
-0.05821289, -0.9998225, -3.479234, 0, 1, 0.8901961, 1,
-0.05536574, -0.1993402, -4.026, 0, 1, 0.8980392, 1,
-0.05366569, 0.9529648, -1.933002, 0, 1, 0.9058824, 1,
-0.05224842, -0.5110381, -2.055509, 0, 1, 0.9098039, 1,
-0.04988975, 1.02982, 0.7076475, 0, 1, 0.9176471, 1,
-0.0396142, -0.4027099, -4.637562, 0, 1, 0.9215686, 1,
-0.03631599, -0.9867892, -3.164335, 0, 1, 0.9294118, 1,
-0.02828864, 1.666888, -0.2630178, 0, 1, 0.9333333, 1,
-0.02827502, 0.5019467, 0.594138, 0, 1, 0.9411765, 1,
-0.02699579, -1.924523, -2.652766, 0, 1, 0.945098, 1,
-0.0248517, -0.9869808, -4.28536, 0, 1, 0.9529412, 1,
-0.02480058, -0.3651628, -4.428794, 0, 1, 0.9568627, 1,
-0.02422907, -0.07322761, -3.946363, 0, 1, 0.9647059, 1,
-0.01907775, 1.921895, 1.647766, 0, 1, 0.9686275, 1,
-0.01742129, -1.385139, -4.088489, 0, 1, 0.9764706, 1,
-0.01696661, 0.5583424, 0.8980213, 0, 1, 0.9803922, 1,
-0.01687602, -0.4243896, -2.793239, 0, 1, 0.9882353, 1,
-0.01345434, 1.304263, 0.8987934, 0, 1, 0.9921569, 1,
-0.01086105, 0.4023108, -0.1649857, 0, 1, 1, 1,
-0.009210695, 1.715592, 0.2221999, 0, 0.9921569, 1, 1,
-0.003374513, 2.476463, 0.8082761, 0, 0.9882353, 1, 1,
-0.002762675, 0.7523172, 1.519726, 0, 0.9803922, 1, 1,
-0.002652623, 0.6267166, 1.193858, 0, 0.9764706, 1, 1,
-2.889345e-05, 1.0485, 0.02308042, 0, 0.9686275, 1, 1,
0.003942321, -2.000324, 3.417193, 0, 0.9647059, 1, 1,
0.006996178, 1.899257, 2.339609, 0, 0.9568627, 1, 1,
0.008259824, -1.160275, 3.417011, 0, 0.9529412, 1, 1,
0.01266533, -0.6691476, 3.217672, 0, 0.945098, 1, 1,
0.02150557, 0.9205927, 0.9963913, 0, 0.9411765, 1, 1,
0.03642956, -2.082181, 2.233529, 0, 0.9333333, 1, 1,
0.03783456, 1.549468, 1.900511, 0, 0.9294118, 1, 1,
0.0400901, 0.4534428, 0.5163495, 0, 0.9215686, 1, 1,
0.05003889, 0.8872694, 0.4125631, 0, 0.9176471, 1, 1,
0.05098123, -0.7241744, 2.807315, 0, 0.9098039, 1, 1,
0.05250215, 1.384298, 0.779157, 0, 0.9058824, 1, 1,
0.05252745, 1.332428, 0.9878805, 0, 0.8980392, 1, 1,
0.05708311, 0.495023, -0.3480366, 0, 0.8901961, 1, 1,
0.0584402, -0.9397371, 3.736382, 0, 0.8862745, 1, 1,
0.05878031, -0.3533815, 2.580355, 0, 0.8784314, 1, 1,
0.0596508, -1.655345, 5.167329, 0, 0.8745098, 1, 1,
0.05982213, -0.6521716, 2.316982, 0, 0.8666667, 1, 1,
0.06226326, 1.33083, 0.3153535, 0, 0.8627451, 1, 1,
0.0633217, 0.4015354, -1.523605, 0, 0.854902, 1, 1,
0.06407832, 1.12976, 0.4500284, 0, 0.8509804, 1, 1,
0.06478509, 0.4650509, 0.5845351, 0, 0.8431373, 1, 1,
0.06820025, -0.525352, 2.650802, 0, 0.8392157, 1, 1,
0.07133193, 0.3540009, -1.884284, 0, 0.8313726, 1, 1,
0.07149535, -0.1194255, 5.026911, 0, 0.827451, 1, 1,
0.07689209, 0.3850746, 0.03137178, 0, 0.8196079, 1, 1,
0.07694768, -2.046629, 2.312607, 0, 0.8156863, 1, 1,
0.07760987, -0.854695, 4.183583, 0, 0.8078431, 1, 1,
0.08080751, 0.2986343, -0.4293466, 0, 0.8039216, 1, 1,
0.08536617, -0.8692586, 1.853002, 0, 0.7960784, 1, 1,
0.08783878, 0.8315551, -0.3311905, 0, 0.7882353, 1, 1,
0.08794211, 0.1234782, 0.8297259, 0, 0.7843137, 1, 1,
0.09216253, -0.7197935, 3.100824, 0, 0.7764706, 1, 1,
0.09335153, -1.117583, 3.882179, 0, 0.772549, 1, 1,
0.09378242, -0.1094141, 2.682457, 0, 0.7647059, 1, 1,
0.09746397, 2.167767, -0.732743, 0, 0.7607843, 1, 1,
0.09992754, -0.8089393, 3.221791, 0, 0.7529412, 1, 1,
0.1004326, -0.1042058, 2.585474, 0, 0.7490196, 1, 1,
0.1019794, -0.4354066, 1.395996, 0, 0.7411765, 1, 1,
0.1047869, -0.06385957, 1.752266, 0, 0.7372549, 1, 1,
0.1055916, 0.5554705, -0.328281, 0, 0.7294118, 1, 1,
0.1074674, 1.033539, -0.8425203, 0, 0.7254902, 1, 1,
0.1089507, -1.132455, 3.583696, 0, 0.7176471, 1, 1,
0.111259, -1.268024, 4.910484, 0, 0.7137255, 1, 1,
0.1149305, -0.8091326, 2.572906, 0, 0.7058824, 1, 1,
0.1149516, 0.4889641, -1.327501, 0, 0.6980392, 1, 1,
0.1152476, -1.85787, 2.582497, 0, 0.6941177, 1, 1,
0.1180948, -0.1211774, 1.066446, 0, 0.6862745, 1, 1,
0.1187249, 0.7691386, 0.6805108, 0, 0.682353, 1, 1,
0.1214944, 0.3826263, 0.448533, 0, 0.6745098, 1, 1,
0.1215872, 0.1238388, 0.3639616, 0, 0.6705883, 1, 1,
0.1295584, 1.600256, 0.5930631, 0, 0.6627451, 1, 1,
0.1315731, 0.694966, -1.009041, 0, 0.6588235, 1, 1,
0.1357958, -0.08010697, 3.823819, 0, 0.6509804, 1, 1,
0.1373959, 0.7138647, 2.148984, 0, 0.6470588, 1, 1,
0.14193, -0.5796266, 2.733147, 0, 0.6392157, 1, 1,
0.1434484, 2.288775, -0.4646642, 0, 0.6352941, 1, 1,
0.146265, 0.4025213, 2.051498, 0, 0.627451, 1, 1,
0.1518696, 1.039372, -0.7789357, 0, 0.6235294, 1, 1,
0.1523312, -0.9904399, 4.523417, 0, 0.6156863, 1, 1,
0.1530481, 0.1439703, 0.4319044, 0, 0.6117647, 1, 1,
0.1544608, 0.07118659, 1.40114, 0, 0.6039216, 1, 1,
0.1586017, -0.1440652, 3.835141, 0, 0.5960785, 1, 1,
0.1596111, 0.4349778, 0.7484954, 0, 0.5921569, 1, 1,
0.160287, 0.09270713, -0.5268118, 0, 0.5843138, 1, 1,
0.1614032, -1.476502, 2.344981, 0, 0.5803922, 1, 1,
0.1618575, -0.525566, 2.337901, 0, 0.572549, 1, 1,
0.164279, -1.727313, 3.27223, 0, 0.5686275, 1, 1,
0.1728966, 0.02294691, 2.510088, 0, 0.5607843, 1, 1,
0.173931, 0.600638, -0.4876459, 0, 0.5568628, 1, 1,
0.1759793, 2.1828, 1.508079, 0, 0.5490196, 1, 1,
0.1792377, -0.3538622, 2.426342, 0, 0.5450981, 1, 1,
0.1817368, 1.539922, 0.4449936, 0, 0.5372549, 1, 1,
0.1846671, 1.714078, 0.1536411, 0, 0.5333334, 1, 1,
0.1873758, -1.595453, 0.8452729, 0, 0.5254902, 1, 1,
0.1916052, -1.214441, 2.961293, 0, 0.5215687, 1, 1,
0.1916755, -0.2378883, 1.614308, 0, 0.5137255, 1, 1,
0.1944826, -0.2990733, 3.842685, 0, 0.509804, 1, 1,
0.1955673, 1.351646, -0.7774035, 0, 0.5019608, 1, 1,
0.1961773, 1.617026, -2.068848, 0, 0.4941176, 1, 1,
0.1975524, -2.568849, 3.150951, 0, 0.4901961, 1, 1,
0.2019565, -0.06887964, 1.685078, 0, 0.4823529, 1, 1,
0.2020966, 0.3509566, 0.2308628, 0, 0.4784314, 1, 1,
0.202352, -0.8229389, 2.633395, 0, 0.4705882, 1, 1,
0.2060921, 2.989614, 0.2356055, 0, 0.4666667, 1, 1,
0.2086582, 1.098496, 0.533849, 0, 0.4588235, 1, 1,
0.2091651, 0.7681423, -1.983772, 0, 0.454902, 1, 1,
0.2097153, -0.6495084, 2.433486, 0, 0.4470588, 1, 1,
0.2118903, 0.5343409, 0.8594492, 0, 0.4431373, 1, 1,
0.2134162, -0.1506077, 2.748136, 0, 0.4352941, 1, 1,
0.2145367, -0.8425624, 2.021948, 0, 0.4313726, 1, 1,
0.21496, 0.2577248, 0.4257023, 0, 0.4235294, 1, 1,
0.2152084, 1.294558, 0.6323299, 0, 0.4196078, 1, 1,
0.2155134, -0.3561587, 1.1824, 0, 0.4117647, 1, 1,
0.216125, -1.247533, 2.928632, 0, 0.4078431, 1, 1,
0.217227, -0.05021663, 1.236273, 0, 0.4, 1, 1,
0.2173727, 0.956162, -0.5232773, 0, 0.3921569, 1, 1,
0.2237896, 1.358761, 1.286599, 0, 0.3882353, 1, 1,
0.2255637, -0.1894048, 2.906131, 0, 0.3803922, 1, 1,
0.2267007, -0.2962679, 2.346264, 0, 0.3764706, 1, 1,
0.2271764, 0.4142254, -0.3889143, 0, 0.3686275, 1, 1,
0.2276041, -0.5540181, 1.508994, 0, 0.3647059, 1, 1,
0.2289094, -1.192731, 1.920369, 0, 0.3568628, 1, 1,
0.2369289, 0.9792707, 0.1876852, 0, 0.3529412, 1, 1,
0.2380094, 1.328677, -0.2496582, 0, 0.345098, 1, 1,
0.239881, -1.858826, 2.833395, 0, 0.3411765, 1, 1,
0.2404086, -0.03320529, 1.020146, 0, 0.3333333, 1, 1,
0.2422163, -0.09909593, 1.915532, 0, 0.3294118, 1, 1,
0.2444327, 0.4839018, -0.4332567, 0, 0.3215686, 1, 1,
0.2451925, -0.8952679, 3.293576, 0, 0.3176471, 1, 1,
0.2475742, 2.004814, -0.4039583, 0, 0.3098039, 1, 1,
0.2513573, 1.280037, 1.272044, 0, 0.3058824, 1, 1,
0.2514398, -0.1088907, 2.043242, 0, 0.2980392, 1, 1,
0.2515465, 0.9540346, 2.574925, 0, 0.2901961, 1, 1,
0.2564912, -0.4836557, 3.680565, 0, 0.2862745, 1, 1,
0.2646384, -1.127038, 1.998318, 0, 0.2784314, 1, 1,
0.2674558, 0.4872617, 1.709234, 0, 0.2745098, 1, 1,
0.2677021, 0.8671733, -1.530436, 0, 0.2666667, 1, 1,
0.2729305, -1.556425, 4.944692, 0, 0.2627451, 1, 1,
0.2739433, -0.8409242, 4.649355, 0, 0.254902, 1, 1,
0.27573, 0.4905877, 1.04592, 0, 0.2509804, 1, 1,
0.2774215, 2.290477, -0.8990769, 0, 0.2431373, 1, 1,
0.2785996, -1.457532, 2.041347, 0, 0.2392157, 1, 1,
0.2791442, 0.1639322, 3.316202, 0, 0.2313726, 1, 1,
0.2803012, 0.5053862, -0.3044206, 0, 0.227451, 1, 1,
0.284521, 0.2001024, -0.3284992, 0, 0.2196078, 1, 1,
0.286927, 0.6437334, 2.160495, 0, 0.2156863, 1, 1,
0.2877507, -0.2445713, 3.70164, 0, 0.2078431, 1, 1,
0.2884575, 1.463308, -0.7370775, 0, 0.2039216, 1, 1,
0.2893082, 2.293864, 0.5012413, 0, 0.1960784, 1, 1,
0.2960933, 0.2361103, 1.931218, 0, 0.1882353, 1, 1,
0.2976952, -0.05064343, 0.9603359, 0, 0.1843137, 1, 1,
0.2998612, 1.005105, -3.047816, 0, 0.1764706, 1, 1,
0.3089656, 0.8182108, 1.52139, 0, 0.172549, 1, 1,
0.3121689, -0.8914583, 0.04360645, 0, 0.1647059, 1, 1,
0.3127556, -1.202922, 1.62718, 0, 0.1607843, 1, 1,
0.3144814, 1.316349, 1.407587, 0, 0.1529412, 1, 1,
0.3168799, 0.1089858, 2.060869, 0, 0.1490196, 1, 1,
0.3203228, -0.6370909, 3.127944, 0, 0.1411765, 1, 1,
0.3281163, -2.381169, 2.426851, 0, 0.1372549, 1, 1,
0.3295572, 0.2361761, 3.080486, 0, 0.1294118, 1, 1,
0.3298789, 0.1087251, 2.40496, 0, 0.1254902, 1, 1,
0.3298897, -0.09833756, 1.09703, 0, 0.1176471, 1, 1,
0.3325299, 1.118458, 1.972506, 0, 0.1137255, 1, 1,
0.3348094, 1.897164, -0.3176194, 0, 0.1058824, 1, 1,
0.3359393, 0.5154135, 0.4170798, 0, 0.09803922, 1, 1,
0.3393377, -0.205072, 4.382677, 0, 0.09411765, 1, 1,
0.3411513, -1.176888, 2.918305, 0, 0.08627451, 1, 1,
0.3421005, -1.298049, 3.150034, 0, 0.08235294, 1, 1,
0.344528, 2.108491, -1.182464, 0, 0.07450981, 1, 1,
0.3463586, 0.3978097, 1.45744, 0, 0.07058824, 1, 1,
0.3463872, -0.2545979, 3.178171, 0, 0.0627451, 1, 1,
0.3494698, -0.2865741, 2.838593, 0, 0.05882353, 1, 1,
0.3553572, -1.427278, 2.492521, 0, 0.05098039, 1, 1,
0.3570908, 0.9661967, -0.3111894, 0, 0.04705882, 1, 1,
0.3625851, 0.3476331, -0.2972557, 0, 0.03921569, 1, 1,
0.3720019, -1.11022, 3.231774, 0, 0.03529412, 1, 1,
0.3753741, -0.05745821, 1.262538, 0, 0.02745098, 1, 1,
0.3775534, 0.05793722, 0.89481, 0, 0.02352941, 1, 1,
0.3850458, 1.194362, 1.535217, 0, 0.01568628, 1, 1,
0.3871356, -0.4711914, 2.053218, 0, 0.01176471, 1, 1,
0.3899604, -0.05140091, 0.6359628, 0, 0.003921569, 1, 1,
0.3921709, -1.126767, 1.892613, 0.003921569, 0, 1, 1,
0.3938495, -1.064717, 2.380343, 0.007843138, 0, 1, 1,
0.3981752, -0.193004, 0.4294089, 0.01568628, 0, 1, 1,
0.3991964, 1.21053, -0.03794468, 0.01960784, 0, 1, 1,
0.4011642, -0.365907, 3.611408, 0.02745098, 0, 1, 1,
0.4019682, 1.009544, 1.538147, 0.03137255, 0, 1, 1,
0.4045396, 2.568161, -0.4477033, 0.03921569, 0, 1, 1,
0.4053772, 1.73428, 2.59623, 0.04313726, 0, 1, 1,
0.4080402, 0.8639909, 2.753078, 0.05098039, 0, 1, 1,
0.4086542, -1.611235, 3.038219, 0.05490196, 0, 1, 1,
0.4091439, -0.4916585, 2.312593, 0.0627451, 0, 1, 1,
0.4099387, -1.686397, 4.062551, 0.06666667, 0, 1, 1,
0.4111716, 0.5507473, -0.5347518, 0.07450981, 0, 1, 1,
0.4116124, -0.9649298, 1.32395, 0.07843138, 0, 1, 1,
0.4116976, -0.555877, 2.429053, 0.08627451, 0, 1, 1,
0.4133572, -0.1804013, 2.162843, 0.09019608, 0, 1, 1,
0.4157553, -1.537968, 2.586299, 0.09803922, 0, 1, 1,
0.4197327, -0.6821717, 2.338953, 0.1058824, 0, 1, 1,
0.4236051, -1.028685, 3.453137, 0.1098039, 0, 1, 1,
0.4248906, 0.5273339, -0.2920758, 0.1176471, 0, 1, 1,
0.4286605, 2.078147, 1.137072, 0.1215686, 0, 1, 1,
0.4324752, 1.379237, 1.326725, 0.1294118, 0, 1, 1,
0.4328934, 1.016349, 0.8999251, 0.1333333, 0, 1, 1,
0.4352697, -0.5370154, 2.166678, 0.1411765, 0, 1, 1,
0.4429341, 0.03219806, 0.8658702, 0.145098, 0, 1, 1,
0.4445696, -0.07547975, 1.095843, 0.1529412, 0, 1, 1,
0.4464092, 0.02392082, 0.4922977, 0.1568628, 0, 1, 1,
0.4464165, -1.209149, 3.699619, 0.1647059, 0, 1, 1,
0.4467607, -0.08288316, 1.156635, 0.1686275, 0, 1, 1,
0.4487933, -0.7721655, 2.462952, 0.1764706, 0, 1, 1,
0.449141, -1.208696, 1.856785, 0.1803922, 0, 1, 1,
0.4496081, 0.2601446, 0.4969288, 0.1882353, 0, 1, 1,
0.4600261, -1.850116, 3.517595, 0.1921569, 0, 1, 1,
0.4624751, 0.3177332, 2.174481, 0.2, 0, 1, 1,
0.4648461, -0.01422489, -0.6647499, 0.2078431, 0, 1, 1,
0.4652458, -0.3327837, 2.198932, 0.2117647, 0, 1, 1,
0.4761001, -0.4642475, 1.585446, 0.2196078, 0, 1, 1,
0.4886473, -0.500469, 1.674816, 0.2235294, 0, 1, 1,
0.4911369, -1.487946, 0.8894429, 0.2313726, 0, 1, 1,
0.4924417, -0.888002, 2.022251, 0.2352941, 0, 1, 1,
0.4924764, -0.01151019, 1.394844, 0.2431373, 0, 1, 1,
0.4926227, 0.2744529, 2.245568, 0.2470588, 0, 1, 1,
0.4959972, 0.04919357, 2.567935, 0.254902, 0, 1, 1,
0.5013233, 0.5819555, 1.582752, 0.2588235, 0, 1, 1,
0.5052514, 0.1234246, 0.8435535, 0.2666667, 0, 1, 1,
0.5093057, -0.4414283, 2.121421, 0.2705882, 0, 1, 1,
0.5118684, 0.7156547, 1.524254, 0.2784314, 0, 1, 1,
0.5121471, -0.2835619, 4.514475, 0.282353, 0, 1, 1,
0.512405, 1.372198, 0.5819208, 0.2901961, 0, 1, 1,
0.5134227, -0.1750042, -1.616108, 0.2941177, 0, 1, 1,
0.5209098, 1.333197, -0.5087033, 0.3019608, 0, 1, 1,
0.526983, -0.304377, -1.081236, 0.3098039, 0, 1, 1,
0.5278797, 0.3675179, 0.9001041, 0.3137255, 0, 1, 1,
0.5279763, 0.1164014, 1.409381, 0.3215686, 0, 1, 1,
0.5297742, -1.520498, 3.722838, 0.3254902, 0, 1, 1,
0.5361291, -1.26497, 3.679567, 0.3333333, 0, 1, 1,
0.5364096, -1.998577, 1.229385, 0.3372549, 0, 1, 1,
0.5383034, 0.08556654, 2.182427, 0.345098, 0, 1, 1,
0.5405093, 0.7633635, 1.18662, 0.3490196, 0, 1, 1,
0.5483073, 0.9991522, -0.9626257, 0.3568628, 0, 1, 1,
0.5483685, -0.05616724, 1.213904, 0.3607843, 0, 1, 1,
0.5524573, 1.524941, 1.434707, 0.3686275, 0, 1, 1,
0.5540363, 0.2163727, 0.4228988, 0.372549, 0, 1, 1,
0.5575348, 0.02784999, 2.322514, 0.3803922, 0, 1, 1,
0.5640053, 0.04499019, 0.8528658, 0.3843137, 0, 1, 1,
0.5644452, -0.2279109, 1.015872, 0.3921569, 0, 1, 1,
0.5653207, -1.380224, 2.300727, 0.3960784, 0, 1, 1,
0.5671554, 0.4151243, 2.538744, 0.4039216, 0, 1, 1,
0.5698606, 0.6552014, 1.657508, 0.4117647, 0, 1, 1,
0.5740108, -0.4673187, 2.950465, 0.4156863, 0, 1, 1,
0.5751969, -0.5074766, 1.284666, 0.4235294, 0, 1, 1,
0.5789497, 0.3395728, 0.5179114, 0.427451, 0, 1, 1,
0.5824975, -1.60191, 1.464643, 0.4352941, 0, 1, 1,
0.5865507, 1.423519, -0.9105656, 0.4392157, 0, 1, 1,
0.5892616, -1.070971, 1.614673, 0.4470588, 0, 1, 1,
0.5955133, -1.204936, 4.418696, 0.4509804, 0, 1, 1,
0.5964172, 0.1613779, 1.347612, 0.4588235, 0, 1, 1,
0.5971794, 1.47481, 0.5624524, 0.4627451, 0, 1, 1,
0.5982681, -1.492431, 4.154349, 0.4705882, 0, 1, 1,
0.5995128, 0.9688516, 0.2681454, 0.4745098, 0, 1, 1,
0.6042161, 0.3994581, -0.08417138, 0.4823529, 0, 1, 1,
0.604463, -0.752268, 2.213668, 0.4862745, 0, 1, 1,
0.6119025, -0.2220983, 1.403629, 0.4941176, 0, 1, 1,
0.6120303, -0.9467849, 2.287204, 0.5019608, 0, 1, 1,
0.6120603, -2.756981, 2.225478, 0.5058824, 0, 1, 1,
0.6185965, 0.172951, 1.087634, 0.5137255, 0, 1, 1,
0.620949, 0.6340483, -0.2160737, 0.5176471, 0, 1, 1,
0.6253763, -0.2603299, 2.632671, 0.5254902, 0, 1, 1,
0.6260381, -1.253045, 2.763316, 0.5294118, 0, 1, 1,
0.6311566, -1.660408, 2.999079, 0.5372549, 0, 1, 1,
0.6364894, 0.3731433, 1.351672, 0.5411765, 0, 1, 1,
0.6378243, 0.482772, -0.1486918, 0.5490196, 0, 1, 1,
0.6386206, -0.3485948, -0.5574998, 0.5529412, 0, 1, 1,
0.6490505, -2.601578, 2.245203, 0.5607843, 0, 1, 1,
0.6503918, 0.5322267, 0.4161547, 0.5647059, 0, 1, 1,
0.654856, -0.400448, 0.6612749, 0.572549, 0, 1, 1,
0.6562439, 2.218106, -1.231315, 0.5764706, 0, 1, 1,
0.6574914, 0.9325261, 0.9647099, 0.5843138, 0, 1, 1,
0.6586398, 1.349341, 0.2494923, 0.5882353, 0, 1, 1,
0.6599954, -0.3961845, 3.109331, 0.5960785, 0, 1, 1,
0.6636581, -0.2027484, 1.392902, 0.6039216, 0, 1, 1,
0.6639518, -1.2032, 1.83798, 0.6078432, 0, 1, 1,
0.6664183, 0.4564308, 1.238922, 0.6156863, 0, 1, 1,
0.6704064, -0.4091653, 1.793301, 0.6196079, 0, 1, 1,
0.6842124, 0.5487077, 2.292334, 0.627451, 0, 1, 1,
0.6856654, -0.3507247, 0.9403245, 0.6313726, 0, 1, 1,
0.6903974, -0.2488291, 4.171846, 0.6392157, 0, 1, 1,
0.6972983, 0.8564116, 0.9136118, 0.6431373, 0, 1, 1,
0.6991375, 0.222427, 0.2106487, 0.6509804, 0, 1, 1,
0.699724, 0.2822163, 0.2927546, 0.654902, 0, 1, 1,
0.7023326, 0.1296293, 1.024798, 0.6627451, 0, 1, 1,
0.7026687, 0.214127, 0.2737286, 0.6666667, 0, 1, 1,
0.7098798, 1.18617, 1.738437, 0.6745098, 0, 1, 1,
0.7139161, 0.2688919, 0.8182096, 0.6784314, 0, 1, 1,
0.7141491, 0.274997, 0.6904593, 0.6862745, 0, 1, 1,
0.7176969, 0.2656326, 1.840885, 0.6901961, 0, 1, 1,
0.725383, -0.8214775, 3.853221, 0.6980392, 0, 1, 1,
0.7262021, -0.3821601, 2.038028, 0.7058824, 0, 1, 1,
0.727185, 1.22842, 0.5224523, 0.7098039, 0, 1, 1,
0.7286206, -0.7358121, 2.114925, 0.7176471, 0, 1, 1,
0.7298374, -2.080616, 2.462283, 0.7215686, 0, 1, 1,
0.7309711, 1.765692, -1.807715, 0.7294118, 0, 1, 1,
0.7316219, -0.6440537, 1.629738, 0.7333333, 0, 1, 1,
0.7316645, -1.286108, 1.114841, 0.7411765, 0, 1, 1,
0.7328285, -0.3074403, 3.311978, 0.7450981, 0, 1, 1,
0.7337803, -0.5592713, 2.651839, 0.7529412, 0, 1, 1,
0.734102, 0.09561433, 2.199216, 0.7568628, 0, 1, 1,
0.7400117, 1.383653, 0.9733815, 0.7647059, 0, 1, 1,
0.7493733, -1.165388, 3.283035, 0.7686275, 0, 1, 1,
0.7525215, 0.5016407, 1.006256, 0.7764706, 0, 1, 1,
0.759942, -0.9392852, 3.521993, 0.7803922, 0, 1, 1,
0.7665334, 1.232021, 0.4596346, 0.7882353, 0, 1, 1,
0.7676384, 0.7968147, 2.312444, 0.7921569, 0, 1, 1,
0.7716883, 1.918293, 1.659159, 0.8, 0, 1, 1,
0.7761108, 0.2794529, 0.5102358, 0.8078431, 0, 1, 1,
0.7822558, 1.090065, 0.5828593, 0.8117647, 0, 1, 1,
0.7841479, -1.401745, 3.121569, 0.8196079, 0, 1, 1,
0.7918544, -0.2846392, 0.8719316, 0.8235294, 0, 1, 1,
0.8018779, 0.3788589, -0.129434, 0.8313726, 0, 1, 1,
0.8091882, -0.1874379, 2.161274, 0.8352941, 0, 1, 1,
0.8132446, -1.330985, 3.434486, 0.8431373, 0, 1, 1,
0.8150834, -1.237854, 3.076985, 0.8470588, 0, 1, 1,
0.8177783, 1.504917, 1.38634, 0.854902, 0, 1, 1,
0.8178067, 0.1274151, 1.798036, 0.8588235, 0, 1, 1,
0.8196822, 0.3114728, 0.9977211, 0.8666667, 0, 1, 1,
0.8372441, 2.283628, -0.1857419, 0.8705882, 0, 1, 1,
0.8466436, 0.4954702, 1.919281, 0.8784314, 0, 1, 1,
0.8526232, -1.990853, 1.962249, 0.8823529, 0, 1, 1,
0.8577211, 2.148958, 0.141675, 0.8901961, 0, 1, 1,
0.8619097, -0.5198658, 2.513504, 0.8941177, 0, 1, 1,
0.8650749, 0.4036817, -0.1770376, 0.9019608, 0, 1, 1,
0.8688193, 1.783453, 1.732138, 0.9098039, 0, 1, 1,
0.880604, -1.677219, 2.747416, 0.9137255, 0, 1, 1,
0.8855537, -0.4858287, 2.804595, 0.9215686, 0, 1, 1,
0.9065556, -1.134241, 4.138505, 0.9254902, 0, 1, 1,
0.9076066, 0.03585946, 2.91714, 0.9333333, 0, 1, 1,
0.9113562, -1.27955, 2.397089, 0.9372549, 0, 1, 1,
0.9172557, -2.63916, 2.794757, 0.945098, 0, 1, 1,
0.9194871, -1.033517, 3.602431, 0.9490196, 0, 1, 1,
0.9214242, 0.474138, 0.2123461, 0.9568627, 0, 1, 1,
0.9285488, 0.2568056, 0.1690933, 0.9607843, 0, 1, 1,
0.9296332, 0.03147815, 0.2217924, 0.9686275, 0, 1, 1,
0.9414644, -0.5705266, 1.793498, 0.972549, 0, 1, 1,
0.9428665, 0.9709459, 0.3386756, 0.9803922, 0, 1, 1,
0.9447391, 1.165606, -1.773485, 0.9843137, 0, 1, 1,
0.9480987, -0.7458156, 3.399131, 0.9921569, 0, 1, 1,
0.9555305, 0.116525, 0.06889839, 0.9960784, 0, 1, 1,
0.9591445, 0.898249, 1.501577, 1, 0, 0.9960784, 1,
0.9597537, -0.2894883, 1.951861, 1, 0, 0.9882353, 1,
0.9601044, 0.2660353, 2.389051, 1, 0, 0.9843137, 1,
0.9619721, -0.3956763, 0.9644325, 1, 0, 0.9764706, 1,
0.9642349, -0.5702858, 2.140309, 1, 0, 0.972549, 1,
0.9651476, -0.3043967, 1.543578, 1, 0, 0.9647059, 1,
0.9681311, -0.2066381, 2.334152, 1, 0, 0.9607843, 1,
0.9691489, 1.736038, 0.5723831, 1, 0, 0.9529412, 1,
0.9862575, 0.5720991, 0.6128759, 1, 0, 0.9490196, 1,
0.9920709, -0.9844866, 4.24148, 1, 0, 0.9411765, 1,
0.9945841, 0.8607712, 1.481077, 1, 0, 0.9372549, 1,
0.9961811, -0.09211263, 0.06179368, 1, 0, 0.9294118, 1,
0.9971961, 0.6010476, 0.8942834, 1, 0, 0.9254902, 1,
0.9973801, 1.218395, 1.555647, 1, 0, 0.9176471, 1,
0.9977468, 0.0004798232, 1.907661, 1, 0, 0.9137255, 1,
0.9989156, 0.2491521, 0.7324322, 1, 0, 0.9058824, 1,
1.009772, -0.4913709, 1.928833, 1, 0, 0.9019608, 1,
1.013934, 1.191584, 0.04394979, 1, 0, 0.8941177, 1,
1.014209, 0.5179533, 2.158262, 1, 0, 0.8862745, 1,
1.016285, 0.5168205, 0.6468048, 1, 0, 0.8823529, 1,
1.017714, 1.339577, 0.9110622, 1, 0, 0.8745098, 1,
1.044235, 1.006167, 2.120752, 1, 0, 0.8705882, 1,
1.046579, 0.7113324, 0.5777486, 1, 0, 0.8627451, 1,
1.046834, 0.6360289, 2.00157, 1, 0, 0.8588235, 1,
1.047979, 0.5937327, 1.591293, 1, 0, 0.8509804, 1,
1.068435, -1.045056, 3.258412, 1, 0, 0.8470588, 1,
1.0839, 0.136305, 2.610226, 1, 0, 0.8392157, 1,
1.087371, -0.4260787, 3.547096, 1, 0, 0.8352941, 1,
1.093348, 1.242067, 2.366798, 1, 0, 0.827451, 1,
1.094894, -0.05423066, 1.323648, 1, 0, 0.8235294, 1,
1.095855, 0.7165641, 0.1973447, 1, 0, 0.8156863, 1,
1.096649, -0.94137, 1.93426, 1, 0, 0.8117647, 1,
1.097252, -1.027877, 1.499528, 1, 0, 0.8039216, 1,
1.097762, -1.271971, 2.032318, 1, 0, 0.7960784, 1,
1.111509, 0.1946203, 1.013247, 1, 0, 0.7921569, 1,
1.114444, -1.485734, 2.380243, 1, 0, 0.7843137, 1,
1.125291, 0.3154283, 1.538445, 1, 0, 0.7803922, 1,
1.131377, -0.6876444, 3.618643, 1, 0, 0.772549, 1,
1.138212, -0.4259426, 1.227609, 1, 0, 0.7686275, 1,
1.138398, -0.6299173, 1.594494, 1, 0, 0.7607843, 1,
1.156808, 0.6027158, 0.7187873, 1, 0, 0.7568628, 1,
1.159846, -0.112812, 2.131232, 1, 0, 0.7490196, 1,
1.166024, -1.218727, 1.481906, 1, 0, 0.7450981, 1,
1.169834, -0.6799425, 1.887648, 1, 0, 0.7372549, 1,
1.178419, -0.704717, 0.6365479, 1, 0, 0.7333333, 1,
1.186624, -0.4324448, 1.841057, 1, 0, 0.7254902, 1,
1.190388, 0.4740081, 2.501342, 1, 0, 0.7215686, 1,
1.197446, -1.801185, 0.3745596, 1, 0, 0.7137255, 1,
1.203492, -0.6354126, 2.997357, 1, 0, 0.7098039, 1,
1.206105, -0.9681987, 2.121088, 1, 0, 0.7019608, 1,
1.210757, -0.4411681, 1.604244, 1, 0, 0.6941177, 1,
1.211415, 0.9715669, 1.788052, 1, 0, 0.6901961, 1,
1.215429, -0.9867312, 2.461423, 1, 0, 0.682353, 1,
1.219609, -0.1970679, -0.9222319, 1, 0, 0.6784314, 1,
1.219865, -1.1052, 4.008026, 1, 0, 0.6705883, 1,
1.228478, -0.5524917, 1.597375, 1, 0, 0.6666667, 1,
1.230452, -0.1043789, 1.607168, 1, 0, 0.6588235, 1,
1.244447, 0.3866921, 2.27844, 1, 0, 0.654902, 1,
1.253878, 1.633579, -0.3508651, 1, 0, 0.6470588, 1,
1.254859, -0.05425959, 1.43237, 1, 0, 0.6431373, 1,
1.268623, -2.034245, 3.351362, 1, 0, 0.6352941, 1,
1.28659, -0.7276827, 3.113943, 1, 0, 0.6313726, 1,
1.301938, -2.02444, 3.371007, 1, 0, 0.6235294, 1,
1.320895, -0.3129846, 1.069164, 1, 0, 0.6196079, 1,
1.324645, 0.2185297, 2.168701, 1, 0, 0.6117647, 1,
1.328025, -1.199069, 2.553762, 1, 0, 0.6078432, 1,
1.330302, 1.453517, 2.827944, 1, 0, 0.6, 1,
1.332067, 1.433664, 2.377908, 1, 0, 0.5921569, 1,
1.332565, 0.6332635, 1.36624, 1, 0, 0.5882353, 1,
1.341402, -1.781109, 2.763948, 1, 0, 0.5803922, 1,
1.367943, -1.056491, 2.673021, 1, 0, 0.5764706, 1,
1.369899, 0.4156893, 1.427058, 1, 0, 0.5686275, 1,
1.373914, 0.1096442, 2.045504, 1, 0, 0.5647059, 1,
1.375588, -0.568008, -0.1825555, 1, 0, 0.5568628, 1,
1.388949, 2.077995, 0.05026628, 1, 0, 0.5529412, 1,
1.389198, -0.5002431, 2.193538, 1, 0, 0.5450981, 1,
1.393626, 1.372042, 0.1138469, 1, 0, 0.5411765, 1,
1.397824, -0.1809373, 3.475504, 1, 0, 0.5333334, 1,
1.404948, -0.1747387, 0.8207574, 1, 0, 0.5294118, 1,
1.405348, -0.4713246, 1.584965, 1, 0, 0.5215687, 1,
1.409365, 0.5772122, 1.418343, 1, 0, 0.5176471, 1,
1.414971, -1.130566, 3.281161, 1, 0, 0.509804, 1,
1.419861, -0.7157599, 3.226801, 1, 0, 0.5058824, 1,
1.420702, -0.4810601, 3.332534, 1, 0, 0.4980392, 1,
1.428162, -0.8259962, -0.6021603, 1, 0, 0.4901961, 1,
1.445345, -0.1633096, 3.498114, 1, 0, 0.4862745, 1,
1.451755, 1.349757, 1.182665, 1, 0, 0.4784314, 1,
1.46011, 0.6075867, 2.692806, 1, 0, 0.4745098, 1,
1.463878, -0.1528662, 3.926968, 1, 0, 0.4666667, 1,
1.46415, 1.899196, -0.09109529, 1, 0, 0.4627451, 1,
1.469544, -0.7648762, 1.303812, 1, 0, 0.454902, 1,
1.469649, -0.8265635, 3.662872, 1, 0, 0.4509804, 1,
1.484166, 0.2549056, 3.292416, 1, 0, 0.4431373, 1,
1.488966, -0.5595469, 2.409849, 1, 0, 0.4392157, 1,
1.511701, 0.1179464, 0.6555737, 1, 0, 0.4313726, 1,
1.516896, 0.8492698, 1.510155, 1, 0, 0.427451, 1,
1.520344, -1.796779, 2.641281, 1, 0, 0.4196078, 1,
1.523778, 0.1686741, 2.088621, 1, 0, 0.4156863, 1,
1.535177, -0.08938795, 0.9750206, 1, 0, 0.4078431, 1,
1.538077, 0.287037, 0.8697149, 1, 0, 0.4039216, 1,
1.552924, -0.1485345, 0.5732888, 1, 0, 0.3960784, 1,
1.553763, -0.5745843, 0.8086841, 1, 0, 0.3882353, 1,
1.559535, 0.3677268, 2.259267, 1, 0, 0.3843137, 1,
1.565399, 1.263924, 1.11149, 1, 0, 0.3764706, 1,
1.571218, 1.041453, 0.383584, 1, 0, 0.372549, 1,
1.579164, 0.4616383, 1.467339, 1, 0, 0.3647059, 1,
1.591783, 0.9503219, 1.814955, 1, 0, 0.3607843, 1,
1.605678, 0.6523308, 0.3137856, 1, 0, 0.3529412, 1,
1.617307, 0.6257088, -0.03392984, 1, 0, 0.3490196, 1,
1.61949, -0.9832996, 3.961729, 1, 0, 0.3411765, 1,
1.631575, -0.7496932, 1.70936, 1, 0, 0.3372549, 1,
1.634635, 0.3474908, 0.1738343, 1, 0, 0.3294118, 1,
1.642685, 0.05751949, 0.866603, 1, 0, 0.3254902, 1,
1.656191, -0.8657251, 3.087806, 1, 0, 0.3176471, 1,
1.656397, 0.6001851, 2.04578, 1, 0, 0.3137255, 1,
1.66037, -1.94493, 2.639393, 1, 0, 0.3058824, 1,
1.676009, 0.4703905, 1.882289, 1, 0, 0.2980392, 1,
1.67968, -1.783544, 3.822957, 1, 0, 0.2941177, 1,
1.695168, 0.5323037, 0.2117662, 1, 0, 0.2862745, 1,
1.708607, 1.314249, 1.517219, 1, 0, 0.282353, 1,
1.711537, -2.618465, 4.517611, 1, 0, 0.2745098, 1,
1.713363, 0.5663828, -0.07328576, 1, 0, 0.2705882, 1,
1.716589, 0.4447678, 0.9296649, 1, 0, 0.2627451, 1,
1.74272, -0.2851926, 2.586948, 1, 0, 0.2588235, 1,
1.757972, 0.8653108, 0.2776672, 1, 0, 0.2509804, 1,
1.766869, -0.5091283, 1.163016, 1, 0, 0.2470588, 1,
1.776573, 0.001957739, 2.237563, 1, 0, 0.2392157, 1,
1.786067, 0.9770514, 0.4769133, 1, 0, 0.2352941, 1,
1.794848, 0.5455588, 0.3861259, 1, 0, 0.227451, 1,
1.801588, -0.6500719, 1.317203, 1, 0, 0.2235294, 1,
1.804963, 0.5688965, 1.087493, 1, 0, 0.2156863, 1,
1.810056, -0.9313471, 3.277188, 1, 0, 0.2117647, 1,
1.844868, -0.8675194, 2.166516, 1, 0, 0.2039216, 1,
1.860353, -0.3545599, 1.055766, 1, 0, 0.1960784, 1,
1.873698, -0.7765584, -0.4983737, 1, 0, 0.1921569, 1,
1.881213, 0.6593387, 2.416044, 1, 0, 0.1843137, 1,
1.890145, -1.507511, 2.622162, 1, 0, 0.1803922, 1,
1.919962, -1.888878, 3.124765, 1, 0, 0.172549, 1,
1.921225, -2.153291, 3.020152, 1, 0, 0.1686275, 1,
1.926844, -0.7758501, 2.389047, 1, 0, 0.1607843, 1,
1.932001, -0.835187, 3.913246, 1, 0, 0.1568628, 1,
1.949811, -0.1601046, 0.9273072, 1, 0, 0.1490196, 1,
1.981165, 0.5743319, 2.729043, 1, 0, 0.145098, 1,
1.990251, -0.429331, 0.8506076, 1, 0, 0.1372549, 1,
1.997676, 0.3066437, 0.9722405, 1, 0, 0.1333333, 1,
2.007703, 1.116509, 0.2712687, 1, 0, 0.1254902, 1,
2.040197, -1.841317, 3.637063, 1, 0, 0.1215686, 1,
2.063919, -1.45332, 3.221442, 1, 0, 0.1137255, 1,
2.074443, 0.390467, 1.934278, 1, 0, 0.1098039, 1,
2.086741, -1.282722, 3.537372, 1, 0, 0.1019608, 1,
2.096367, -1.587944, 1.590033, 1, 0, 0.09411765, 1,
2.15103, 0.006861645, 1.906015, 1, 0, 0.09019608, 1,
2.19753, 1.475423, 3.007325, 1, 0, 0.08235294, 1,
2.208018, -1.386392, 2.900067, 1, 0, 0.07843138, 1,
2.360419, 0.8286433, 0.4583482, 1, 0, 0.07058824, 1,
2.407813, 0.5665053, 1.444539, 1, 0, 0.06666667, 1,
2.415642, 0.7183895, -0.3286964, 1, 0, 0.05882353, 1,
2.435545, -0.3755534, 1.58475, 1, 0, 0.05490196, 1,
2.436656, -0.5208432, 2.625018, 1, 0, 0.04705882, 1,
2.470795, -1.017227, 2.687718, 1, 0, 0.04313726, 1,
2.50937, 0.4987303, 1.050913, 1, 0, 0.03529412, 1,
2.54127, 1.565632, 1.125316, 1, 0, 0.03137255, 1,
2.65936, 0.7618524, 1.547421, 1, 0, 0.02352941, 1,
2.821135, 0.07341806, 2.220869, 1, 0, 0.01960784, 1,
2.887844, -0.3037733, 2.219455, 1, 0, 0.01176471, 1,
3.020599, 0.0721694, 2.586583, 1, 0, 0.007843138, 1
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
-0.3781462, -3.734078, -7.673207, 0, -0.5, 0.5, 0.5,
-0.3781462, -3.734078, -7.673207, 1, -0.5, 0.5, 0.5,
-0.3781462, -3.734078, -7.673207, 1, 1.5, 0.5, 0.5,
-0.3781462, -3.734078, -7.673207, 0, 1.5, 0.5, 0.5
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
-4.929066, 0.115013, -7.673207, 0, -0.5, 0.5, 0.5,
-4.929066, 0.115013, -7.673207, 1, -0.5, 0.5, 0.5,
-4.929066, 0.115013, -7.673207, 1, 1.5, 0.5, 0.5,
-4.929066, 0.115013, -7.673207, 0, 1.5, 0.5, 0.5
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
-4.929066, -3.734078, -0.3224258, 0, -0.5, 0.5, 0.5,
-4.929066, -3.734078, -0.3224258, 1, -0.5, 0.5, 0.5,
-4.929066, -3.734078, -0.3224258, 1, 1.5, 0.5, 0.5,
-4.929066, -3.734078, -0.3224258, 0, 1.5, 0.5, 0.5
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
-3, -2.845827, -5.976873,
3, -2.845827, -5.976873,
-3, -2.845827, -5.976873,
-3, -2.993869, -6.259595,
-2, -2.845827, -5.976873,
-2, -2.993869, -6.259595,
-1, -2.845827, -5.976873,
-1, -2.993869, -6.259595,
0, -2.845827, -5.976873,
0, -2.993869, -6.259595,
1, -2.845827, -5.976873,
1, -2.993869, -6.259595,
2, -2.845827, -5.976873,
2, -2.993869, -6.259595,
3, -2.845827, -5.976873,
3, -2.993869, -6.259595
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
-3, -3.289953, -6.82504, 0, -0.5, 0.5, 0.5,
-3, -3.289953, -6.82504, 1, -0.5, 0.5, 0.5,
-3, -3.289953, -6.82504, 1, 1.5, 0.5, 0.5,
-3, -3.289953, -6.82504, 0, 1.5, 0.5, 0.5,
-2, -3.289953, -6.82504, 0, -0.5, 0.5, 0.5,
-2, -3.289953, -6.82504, 1, -0.5, 0.5, 0.5,
-2, -3.289953, -6.82504, 1, 1.5, 0.5, 0.5,
-2, -3.289953, -6.82504, 0, 1.5, 0.5, 0.5,
-1, -3.289953, -6.82504, 0, -0.5, 0.5, 0.5,
-1, -3.289953, -6.82504, 1, -0.5, 0.5, 0.5,
-1, -3.289953, -6.82504, 1, 1.5, 0.5, 0.5,
-1, -3.289953, -6.82504, 0, 1.5, 0.5, 0.5,
0, -3.289953, -6.82504, 0, -0.5, 0.5, 0.5,
0, -3.289953, -6.82504, 1, -0.5, 0.5, 0.5,
0, -3.289953, -6.82504, 1, 1.5, 0.5, 0.5,
0, -3.289953, -6.82504, 0, 1.5, 0.5, 0.5,
1, -3.289953, -6.82504, 0, -0.5, 0.5, 0.5,
1, -3.289953, -6.82504, 1, -0.5, 0.5, 0.5,
1, -3.289953, -6.82504, 1, 1.5, 0.5, 0.5,
1, -3.289953, -6.82504, 0, 1.5, 0.5, 0.5,
2, -3.289953, -6.82504, 0, -0.5, 0.5, 0.5,
2, -3.289953, -6.82504, 1, -0.5, 0.5, 0.5,
2, -3.289953, -6.82504, 1, 1.5, 0.5, 0.5,
2, -3.289953, -6.82504, 0, 1.5, 0.5, 0.5,
3, -3.289953, -6.82504, 0, -0.5, 0.5, 0.5,
3, -3.289953, -6.82504, 1, -0.5, 0.5, 0.5,
3, -3.289953, -6.82504, 1, 1.5, 0.5, 0.5,
3, -3.289953, -6.82504, 0, 1.5, 0.5, 0.5
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
-3.878854, -2, -5.976873,
-3.878854, 2, -5.976873,
-3.878854, -2, -5.976873,
-4.053889, -2, -6.259595,
-3.878854, -1, -5.976873,
-4.053889, -1, -6.259595,
-3.878854, 0, -5.976873,
-4.053889, 0, -6.259595,
-3.878854, 1, -5.976873,
-4.053889, 1, -6.259595,
-3.878854, 2, -5.976873,
-4.053889, 2, -6.259595
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
-4.40396, -2, -6.82504, 0, -0.5, 0.5, 0.5,
-4.40396, -2, -6.82504, 1, -0.5, 0.5, 0.5,
-4.40396, -2, -6.82504, 1, 1.5, 0.5, 0.5,
-4.40396, -2, -6.82504, 0, 1.5, 0.5, 0.5,
-4.40396, -1, -6.82504, 0, -0.5, 0.5, 0.5,
-4.40396, -1, -6.82504, 1, -0.5, 0.5, 0.5,
-4.40396, -1, -6.82504, 1, 1.5, 0.5, 0.5,
-4.40396, -1, -6.82504, 0, 1.5, 0.5, 0.5,
-4.40396, 0, -6.82504, 0, -0.5, 0.5, 0.5,
-4.40396, 0, -6.82504, 1, -0.5, 0.5, 0.5,
-4.40396, 0, -6.82504, 1, 1.5, 0.5, 0.5,
-4.40396, 0, -6.82504, 0, 1.5, 0.5, 0.5,
-4.40396, 1, -6.82504, 0, -0.5, 0.5, 0.5,
-4.40396, 1, -6.82504, 1, -0.5, 0.5, 0.5,
-4.40396, 1, -6.82504, 1, 1.5, 0.5, 0.5,
-4.40396, 1, -6.82504, 0, 1.5, 0.5, 0.5,
-4.40396, 2, -6.82504, 0, -0.5, 0.5, 0.5,
-4.40396, 2, -6.82504, 1, -0.5, 0.5, 0.5,
-4.40396, 2, -6.82504, 1, 1.5, 0.5, 0.5,
-4.40396, 2, -6.82504, 0, 1.5, 0.5, 0.5
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
-3.878854, -2.845827, -4,
-3.878854, -2.845827, 4,
-3.878854, -2.845827, -4,
-4.053889, -2.993869, -4,
-3.878854, -2.845827, -2,
-4.053889, -2.993869, -2,
-3.878854, -2.845827, 0,
-4.053889, -2.993869, 0,
-3.878854, -2.845827, 2,
-4.053889, -2.993869, 2,
-3.878854, -2.845827, 4,
-4.053889, -2.993869, 4
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
-4.40396, -3.289953, -4, 0, -0.5, 0.5, 0.5,
-4.40396, -3.289953, -4, 1, -0.5, 0.5, 0.5,
-4.40396, -3.289953, -4, 1, 1.5, 0.5, 0.5,
-4.40396, -3.289953, -4, 0, 1.5, 0.5, 0.5,
-4.40396, -3.289953, -2, 0, -0.5, 0.5, 0.5,
-4.40396, -3.289953, -2, 1, -0.5, 0.5, 0.5,
-4.40396, -3.289953, -2, 1, 1.5, 0.5, 0.5,
-4.40396, -3.289953, -2, 0, 1.5, 0.5, 0.5,
-4.40396, -3.289953, 0, 0, -0.5, 0.5, 0.5,
-4.40396, -3.289953, 0, 1, -0.5, 0.5, 0.5,
-4.40396, -3.289953, 0, 1, 1.5, 0.5, 0.5,
-4.40396, -3.289953, 0, 0, 1.5, 0.5, 0.5,
-4.40396, -3.289953, 2, 0, -0.5, 0.5, 0.5,
-4.40396, -3.289953, 2, 1, -0.5, 0.5, 0.5,
-4.40396, -3.289953, 2, 1, 1.5, 0.5, 0.5,
-4.40396, -3.289953, 2, 0, 1.5, 0.5, 0.5,
-4.40396, -3.289953, 4, 0, -0.5, 0.5, 0.5,
-4.40396, -3.289953, 4, 1, -0.5, 0.5, 0.5,
-4.40396, -3.289953, 4, 1, 1.5, 0.5, 0.5,
-4.40396, -3.289953, 4, 0, 1.5, 0.5, 0.5
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
-3.878854, -2.845827, -5.976873,
-3.878854, 3.075853, -5.976873,
-3.878854, -2.845827, 5.332022,
-3.878854, 3.075853, 5.332022,
-3.878854, -2.845827, -5.976873,
-3.878854, -2.845827, 5.332022,
-3.878854, 3.075853, -5.976873,
-3.878854, 3.075853, 5.332022,
-3.878854, -2.845827, -5.976873,
3.122561, -2.845827, -5.976873,
-3.878854, -2.845827, 5.332022,
3.122561, -2.845827, 5.332022,
-3.878854, 3.075853, -5.976873,
3.122561, 3.075853, -5.976873,
-3.878854, 3.075853, 5.332022,
3.122561, 3.075853, 5.332022,
3.122561, -2.845827, -5.976873,
3.122561, 3.075853, -5.976873,
3.122561, -2.845827, 5.332022,
3.122561, 3.075853, 5.332022,
3.122561, -2.845827, -5.976873,
3.122561, -2.845827, 5.332022,
3.122561, 3.075853, -5.976873,
3.122561, 3.075853, 5.332022
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
var radius = 7.774457;
var distance = 34.58943;
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
mvMatrix.translate( 0.3781462, -0.115013, 0.3224258 );
mvMatrix.scale( 1.200599, 1.419512, 0.7432994 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.58943);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
naproanilide<-read.table("naproanilide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-naproanilide$V2
```

```
## Error in eval(expr, envir, enclos): object 'naproanilide' not found
```

```r
y<-naproanilide$V3
```

```
## Error in eval(expr, envir, enclos): object 'naproanilide' not found
```

```r
z<-naproanilide$V4
```

```
## Error in eval(expr, envir, enclos): object 'naproanilide' not found
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
-3.776891, 0.2275722, -2.210728, 0, 0, 1, 1, 1,
-3.015026, 0.03130525, -0.7115147, 1, 0, 0, 1, 1,
-2.900823, 0.4400208, 0.04657611, 1, 0, 0, 1, 1,
-2.893717, 0.344878, -0.0303219, 1, 0, 0, 1, 1,
-2.773845, 0.0006871714, -3.227481, 1, 0, 0, 1, 1,
-2.411175, 0.5936511, -0.1700393, 1, 0, 0, 1, 1,
-2.407705, -1.020457, -2.26253, 0, 0, 0, 1, 1,
-2.285745, 1.32535, -1.769977, 0, 0, 0, 1, 1,
-2.282767, -1.423853, -3.094557, 0, 0, 0, 1, 1,
-2.268512, -0.3028568, -2.415896, 0, 0, 0, 1, 1,
-2.232285, 1.20607, -2.958173, 0, 0, 0, 1, 1,
-2.230649, 1.66197, -3.830236, 0, 0, 0, 1, 1,
-2.21627, 0.00582249, -2.524401, 0, 0, 0, 1, 1,
-2.139422, -0.8452247, -0.7539949, 1, 1, 1, 1, 1,
-2.103361, -0.2112977, -1.150379, 1, 1, 1, 1, 1,
-2.078506, 1.403683, -0.242682, 1, 1, 1, 1, 1,
-2.073836, 1.902909, -0.6108741, 1, 1, 1, 1, 1,
-2.049195, 0.6991182, -1.535695, 1, 1, 1, 1, 1,
-2.040581, -0.8243824, -1.327849, 1, 1, 1, 1, 1,
-2.013946, 0.6649363, 0.2439627, 1, 1, 1, 1, 1,
-1.909712, -0.7331171, -1.832587, 1, 1, 1, 1, 1,
-1.86559, -0.4793952, -0.6829477, 1, 1, 1, 1, 1,
-1.864441, 1.133194, -0.5586424, 1, 1, 1, 1, 1,
-1.861738, -2.432654, -2.012413, 1, 1, 1, 1, 1,
-1.850108, -1.716852, -2.948457, 1, 1, 1, 1, 1,
-1.847903, -0.9516861, -2.860561, 1, 1, 1, 1, 1,
-1.841672, -0.08184572, -0.70619, 1, 1, 1, 1, 1,
-1.831696, 1.461654, 0.8424084, 1, 1, 1, 1, 1,
-1.763723, 1.847541, 0.5228427, 0, 0, 1, 1, 1,
-1.738674, 0.1379852, -1.629575, 1, 0, 0, 1, 1,
-1.731972, -0.006098727, -3.317471, 1, 0, 0, 1, 1,
-1.706575, 1.526834, 0.4167944, 1, 0, 0, 1, 1,
-1.702901, 0.539817, -1.143234, 1, 0, 0, 1, 1,
-1.696254, -1.822792, -2.952821, 1, 0, 0, 1, 1,
-1.69283, 0.09476448, -2.047052, 0, 0, 0, 1, 1,
-1.680188, -1.208768, -1.649982, 0, 0, 0, 1, 1,
-1.676042, -0.6725909, -3.431001, 0, 0, 0, 1, 1,
-1.661147, -0.3157938, -1.539399, 0, 0, 0, 1, 1,
-1.65085, -0.7970292, -0.7562106, 0, 0, 0, 1, 1,
-1.648061, -0.6947224, -0.4691712, 0, 0, 0, 1, 1,
-1.645361, -0.05218906, -2.012917, 0, 0, 0, 1, 1,
-1.641474, 0.8343894, -1.770113, 1, 1, 1, 1, 1,
-1.635346, -0.8659495, -0.8537343, 1, 1, 1, 1, 1,
-1.631367, 0.6469375, -1.558868, 1, 1, 1, 1, 1,
-1.629058, -0.6144087, -3.169531, 1, 1, 1, 1, 1,
-1.617812, -0.9780428, -1.013777, 1, 1, 1, 1, 1,
-1.614985, 1.032451, -2.444831, 1, 1, 1, 1, 1,
-1.61027, -0.8627926, 0.2314985, 1, 1, 1, 1, 1,
-1.607281, 0.5306584, -0.4897446, 1, 1, 1, 1, 1,
-1.602389, 0.3117661, -1.552624, 1, 1, 1, 1, 1,
-1.594558, 1.973268, -0.2059939, 1, 1, 1, 1, 1,
-1.594056, 0.9899591, -1.736833, 1, 1, 1, 1, 1,
-1.580188, 0.6424189, -1.209203, 1, 1, 1, 1, 1,
-1.574418, -0.9673064, -1.551123, 1, 1, 1, 1, 1,
-1.572403, 1.112146, 0.7232274, 1, 1, 1, 1, 1,
-1.570098, 0.4815446, -2.823212, 1, 1, 1, 1, 1,
-1.569254, 0.03143499, 0.1592802, 0, 0, 1, 1, 1,
-1.568122, 0.4290741, -0.557289, 1, 0, 0, 1, 1,
-1.566451, 0.6127741, 0.2577594, 1, 0, 0, 1, 1,
-1.564186, 0.4595447, 0.2282326, 1, 0, 0, 1, 1,
-1.560008, 0.07754554, -0.3486658, 1, 0, 0, 1, 1,
-1.553327, 1.072394, 0.3984307, 1, 0, 0, 1, 1,
-1.547035, -0.09622681, -1.460407, 0, 0, 0, 1, 1,
-1.538186, -1.265597, -2.755501, 0, 0, 0, 1, 1,
-1.537116, 0.6264884, -1.988954, 0, 0, 0, 1, 1,
-1.530239, 0.6265243, -2.807688, 0, 0, 0, 1, 1,
-1.503091, 0.9382452, -1.086145, 0, 0, 0, 1, 1,
-1.493479, 0.2390167, -1.276245, 0, 0, 0, 1, 1,
-1.485661, -0.3158218, -2.598379, 0, 0, 0, 1, 1,
-1.474349, 0.2194581, -0.6904016, 1, 1, 1, 1, 1,
-1.463964, -0.6833063, -2.464995, 1, 1, 1, 1, 1,
-1.452599, -0.1376727, -0.9443931, 1, 1, 1, 1, 1,
-1.448742, -0.9439642, -1.075691, 1, 1, 1, 1, 1,
-1.422556, 0.5150135, -2.0753, 1, 1, 1, 1, 1,
-1.401622, 0.003372717, -2.712416, 1, 1, 1, 1, 1,
-1.395843, -0.6607905, -1.542253, 1, 1, 1, 1, 1,
-1.391841, 0.1459689, -0.7837856, 1, 1, 1, 1, 1,
-1.390496, 1.226865, -1.470219, 1, 1, 1, 1, 1,
-1.382044, -1.034919, -1.045277, 1, 1, 1, 1, 1,
-1.376173, 0.9712363, -0.1267094, 1, 1, 1, 1, 1,
-1.371881, -0.6208702, -2.363345, 1, 1, 1, 1, 1,
-1.369074, -1.610369, -1.244417, 1, 1, 1, 1, 1,
-1.353422, -0.7519605, -2.903572, 1, 1, 1, 1, 1,
-1.330944, 0.04737669, -2.59523, 1, 1, 1, 1, 1,
-1.326293, -0.3097781, -2.114362, 0, 0, 1, 1, 1,
-1.322685, 0.6215279, -0.5574063, 1, 0, 0, 1, 1,
-1.306836, -0.8449175, -2.943989, 1, 0, 0, 1, 1,
-1.306794, -0.8354449, -0.9796582, 1, 0, 0, 1, 1,
-1.303762, -0.5137622, -0.5341352, 1, 0, 0, 1, 1,
-1.297486, -1.097847, -3.39298, 1, 0, 0, 1, 1,
-1.296919, -0.3369798, -1.124226, 0, 0, 0, 1, 1,
-1.295525, -0.2647823, -1.091787, 0, 0, 0, 1, 1,
-1.289938, -1.490316, -4.306819, 0, 0, 0, 1, 1,
-1.289575, -0.5682299, -1.491582, 0, 0, 0, 1, 1,
-1.275973, 0.8932252, -0.5657951, 0, 0, 0, 1, 1,
-1.271217, -1.068328, -2.471851, 0, 0, 0, 1, 1,
-1.270157, -0.5136175, -3.014582, 0, 0, 0, 1, 1,
-1.267107, -0.293814, -0.4128682, 1, 1, 1, 1, 1,
-1.258192, -0.8102493, -0.2583049, 1, 1, 1, 1, 1,
-1.257668, 0.4269758, -1.412893, 1, 1, 1, 1, 1,
-1.25278, 0.05782099, -1.48773, 1, 1, 1, 1, 1,
-1.252569, 1.303449, -0.1255458, 1, 1, 1, 1, 1,
-1.249301, -1.179138, -1.051573, 1, 1, 1, 1, 1,
-1.247839, -0.1740286, -1.085681, 1, 1, 1, 1, 1,
-1.244661, -1.711832, -3.095414, 1, 1, 1, 1, 1,
-1.244465, 1.303514, -1.017527, 1, 1, 1, 1, 1,
-1.242256, -0.1432117, -1.457227, 1, 1, 1, 1, 1,
-1.231932, 0.5994489, -2.654573, 1, 1, 1, 1, 1,
-1.22832, -0.5436803, -0.9243806, 1, 1, 1, 1, 1,
-1.21428, 0.6689483, 0.01557358, 1, 1, 1, 1, 1,
-1.213227, 0.6830458, -0.5650268, 1, 1, 1, 1, 1,
-1.206702, 0.4283401, -1.843646, 1, 1, 1, 1, 1,
-1.201843, 1.639741, -1.835312, 0, 0, 1, 1, 1,
-1.197377, -0.7003928, -3.687643, 1, 0, 0, 1, 1,
-1.193415, 0.3136852, -1.2809, 1, 0, 0, 1, 1,
-1.191389, -0.5839129, -2.033094, 1, 0, 0, 1, 1,
-1.189159, 1.748237, -0.1926423, 1, 0, 0, 1, 1,
-1.188393, 1.348238, -1.561611, 1, 0, 0, 1, 1,
-1.180647, 0.9040733, -1.312865, 0, 0, 0, 1, 1,
-1.178788, 1.195032, -0.3702675, 0, 0, 0, 1, 1,
-1.176287, -1.28846, -2.416049, 0, 0, 0, 1, 1,
-1.175985, -0.925924, -3.358923, 0, 0, 0, 1, 1,
-1.174469, 0.7721727, -1.991411, 0, 0, 0, 1, 1,
-1.17381, -0.4058954, -1.963802, 0, 0, 0, 1, 1,
-1.164733, -1.408322, 0.2565419, 0, 0, 0, 1, 1,
-1.161652, -0.751761, -2.681026, 1, 1, 1, 1, 1,
-1.157768, 0.3030806, -2.62337, 1, 1, 1, 1, 1,
-1.156407, 0.6393995, -0.6896169, 1, 1, 1, 1, 1,
-1.145454, 2.103899, -0.195491, 1, 1, 1, 1, 1,
-1.144029, 0.1697172, 0.2051736, 1, 1, 1, 1, 1,
-1.143933, 0.5961367, -1.294638, 1, 1, 1, 1, 1,
-1.143034, -0.6746649, -0.4146756, 1, 1, 1, 1, 1,
-1.14125, -0.09492154, -1.17704, 1, 1, 1, 1, 1,
-1.13922, -2.188105, -1.561728, 1, 1, 1, 1, 1,
-1.137826, -0.0836412, -1.586278, 1, 1, 1, 1, 1,
-1.130067, -0.274673, -1.570996, 1, 1, 1, 1, 1,
-1.128742, -0.3296429, -3.367071, 1, 1, 1, 1, 1,
-1.128374, 1.008049, -1.065325, 1, 1, 1, 1, 1,
-1.127555, -0.9319023, -2.617101, 1, 1, 1, 1, 1,
-1.123116, 1.779356, -2.054888, 1, 1, 1, 1, 1,
-1.116647, -0.4884489, -1.409778, 0, 0, 1, 1, 1,
-1.106729, 0.3267285, 0.3363974, 1, 0, 0, 1, 1,
-1.099031, 0.7321079, 0.2725953, 1, 0, 0, 1, 1,
-1.097999, -0.1529016, -2.121722, 1, 0, 0, 1, 1,
-1.09767, -0.4724703, -2.59595, 1, 0, 0, 1, 1,
-1.096845, -1.74633, -3.408141, 1, 0, 0, 1, 1,
-1.087491, 1.63492, 0.6356026, 0, 0, 0, 1, 1,
-1.08508, -1.038226, -2.45831, 0, 0, 0, 1, 1,
-1.077607, 2.582469, -1.862602, 0, 0, 0, 1, 1,
-1.055239, -0.4573972, -2.944111, 0, 0, 0, 1, 1,
-1.033309, -1.717779, -3.096508, 0, 0, 0, 1, 1,
-1.031611, -0.2202061, -1.541407, 0, 0, 0, 1, 1,
-1.027518, 0.09610023, -1.792702, 0, 0, 0, 1, 1,
-1.016132, 0.3136146, -1.173427, 1, 1, 1, 1, 1,
-1.014253, -2.759588, -3.635138, 1, 1, 1, 1, 1,
-1.008241, -0.7683811, -1.670122, 1, 1, 1, 1, 1,
-1.001803, -0.7264702, -3.405742, 1, 1, 1, 1, 1,
-0.9983209, -0.6282357, -1.937656, 1, 1, 1, 1, 1,
-0.9927634, -2.362756, -1.783256, 1, 1, 1, 1, 1,
-0.9923589, -1.207628, -2.340925, 1, 1, 1, 1, 1,
-0.988208, 0.579459, -1.651597, 1, 1, 1, 1, 1,
-0.9843574, 1.156899, -0.9447519, 1, 1, 1, 1, 1,
-0.9779686, 0.3245027, -1.053948, 1, 1, 1, 1, 1,
-0.9776105, -1.615782, -2.762427, 1, 1, 1, 1, 1,
-0.9774159, 1.188814, -0.3418486, 1, 1, 1, 1, 1,
-0.9761454, 0.8936751, -1.853018, 1, 1, 1, 1, 1,
-0.9696277, -1.099186, -2.526733, 1, 1, 1, 1, 1,
-0.9659992, -2.389739, -2.801652, 1, 1, 1, 1, 1,
-0.9658165, -0.2735689, -0.9923162, 0, 0, 1, 1, 1,
-0.9656337, -0.8851396, -2.207849, 1, 0, 0, 1, 1,
-0.965528, -0.8069179, -1.93015, 1, 0, 0, 1, 1,
-0.9647684, 0.6275049, -2.370422, 1, 0, 0, 1, 1,
-0.9625385, -0.703443, -3.521064, 1, 0, 0, 1, 1,
-0.9611791, 0.2332416, -0.00397348, 1, 0, 0, 1, 1,
-0.9611515, -1.555579, -1.628511, 0, 0, 0, 1, 1,
-0.9501132, 0.5083483, -1.447927, 0, 0, 0, 1, 1,
-0.9500305, 0.8401705, -1.345589, 0, 0, 0, 1, 1,
-0.9470987, -0.01849111, -0.9306413, 0, 0, 0, 1, 1,
-0.9469385, 1.232383, -0.398838, 0, 0, 0, 1, 1,
-0.9468619, 0.6712443, -2.614492, 0, 0, 0, 1, 1,
-0.9446936, -0.2648229, -2.254599, 0, 0, 0, 1, 1,
-0.9431668, 0.5311959, -0.203996, 1, 1, 1, 1, 1,
-0.9424208, -0.3318141, -1.862484, 1, 1, 1, 1, 1,
-0.9367148, 0.6659191, 0.06472962, 1, 1, 1, 1, 1,
-0.9327193, -0.03387395, -1.258044, 1, 1, 1, 1, 1,
-0.9283862, -1.376643, -3.311067, 1, 1, 1, 1, 1,
-0.9274137, 0.5477588, -0.7193892, 1, 1, 1, 1, 1,
-0.9232337, 0.5250578, -1.145537, 1, 1, 1, 1, 1,
-0.9230753, -1.817048, -1.837501, 1, 1, 1, 1, 1,
-0.9197914, -0.7180106, -3.90764, 1, 1, 1, 1, 1,
-0.91774, 0.6359721, 0.4086422, 1, 1, 1, 1, 1,
-0.9156757, 0.7725759, -1.586992, 1, 1, 1, 1, 1,
-0.9155927, -0.4565996, -4.123307, 1, 1, 1, 1, 1,
-0.9145826, -0.2849131, -2.968983, 1, 1, 1, 1, 1,
-0.9083079, 0.1628629, -1.526498, 1, 1, 1, 1, 1,
-0.9064882, -1.513103, -2.317746, 1, 1, 1, 1, 1,
-0.9019188, -1.261161, -4.704974, 0, 0, 1, 1, 1,
-0.9007808, -0.7571642, -2.13619, 1, 0, 0, 1, 1,
-0.9005548, 1.637002, -1.241078, 1, 0, 0, 1, 1,
-0.8910843, -0.3781375, -0.1857234, 1, 0, 0, 1, 1,
-0.8860373, 0.458901, 0.09159682, 1, 0, 0, 1, 1,
-0.8854321, -0.5594518, -1.253659, 1, 0, 0, 1, 1,
-0.8832237, -0.4870682, -2.07774, 0, 0, 0, 1, 1,
-0.8802753, -1.652456, -3.475965, 0, 0, 0, 1, 1,
-0.8770953, -1.318475, -2.99227, 0, 0, 0, 1, 1,
-0.8764659, 0.1805052, -1.645426, 0, 0, 0, 1, 1,
-0.8764449, -0.5471146, -1.835957, 0, 0, 0, 1, 1,
-0.870797, -0.9936588, -2.143239, 0, 0, 0, 1, 1,
-0.8635634, 0.7333611, -0.02549233, 0, 0, 0, 1, 1,
-0.8635495, -1.060821, -2.429159, 1, 1, 1, 1, 1,
-0.8621345, 0.3243081, -0.7162618, 1, 1, 1, 1, 1,
-0.8572475, -0.364121, -3.317607, 1, 1, 1, 1, 1,
-0.8567184, -0.6505916, -2.350184, 1, 1, 1, 1, 1,
-0.8557491, 0.8917301, -2.308034, 1, 1, 1, 1, 1,
-0.8476685, -0.4399583, -1.039015, 1, 1, 1, 1, 1,
-0.8455966, -0.6879869, -4.453987, 1, 1, 1, 1, 1,
-0.8402446, 0.9110263, -0.06590346, 1, 1, 1, 1, 1,
-0.8369153, 0.03612484, -1.471432, 1, 1, 1, 1, 1,
-0.8368532, 0.07591589, 0.01427083, 1, 1, 1, 1, 1,
-0.8323196, 1.127083, -0.7987322, 1, 1, 1, 1, 1,
-0.8293789, -0.2600729, -1.539779, 1, 1, 1, 1, 1,
-0.8268427, -0.2142433, -1.297282, 1, 1, 1, 1, 1,
-0.8259897, 0.8270307, -0.1327876, 1, 1, 1, 1, 1,
-0.8240671, 0.1831144, -1.086753, 1, 1, 1, 1, 1,
-0.8207026, 0.9273238, -1.238211, 0, 0, 1, 1, 1,
-0.8154712, -0.4826032, -2.437164, 1, 0, 0, 1, 1,
-0.8137945, -0.188603, -1.288595, 1, 0, 0, 1, 1,
-0.8109593, 0.1870538, -2.052899, 1, 0, 0, 1, 1,
-0.800447, 0.7543703, -1.132727, 1, 0, 0, 1, 1,
-0.7876008, -1.629274, -1.777147, 1, 0, 0, 1, 1,
-0.7715212, -0.166196, -2.606702, 0, 0, 0, 1, 1,
-0.7694817, 0.5468838, -0.5856928, 0, 0, 0, 1, 1,
-0.7694103, -1.234383, -0.9866581, 0, 0, 0, 1, 1,
-0.7665902, -1.351495, -4.352637, 0, 0, 0, 1, 1,
-0.7607227, -0.3790002, -2.215108, 0, 0, 0, 1, 1,
-0.7589965, -0.2186246, -1.293038, 0, 0, 0, 1, 1,
-0.7543504, -0.6307348, -2.611655, 0, 0, 0, 1, 1,
-0.752878, -1.453391, -2.934213, 1, 1, 1, 1, 1,
-0.7414419, 0.7362797, -0.2477602, 1, 1, 1, 1, 1,
-0.7377785, -0.2294459, -2.227473, 1, 1, 1, 1, 1,
-0.7364622, -0.4864116, -2.058024, 1, 1, 1, 1, 1,
-0.7356652, -0.5017984, -2.187449, 1, 1, 1, 1, 1,
-0.7326253, 0.7155258, -2.070157, 1, 1, 1, 1, 1,
-0.729222, -0.3750832, -3.535431, 1, 1, 1, 1, 1,
-0.7287896, 0.5475274, -1.510198, 1, 1, 1, 1, 1,
-0.7272231, 0.08235383, -1.316072, 1, 1, 1, 1, 1,
-0.7095083, 2.41431, -0.5627908, 1, 1, 1, 1, 1,
-0.7089675, -0.04077106, -1.704796, 1, 1, 1, 1, 1,
-0.6974427, 0.9512246, -1.224838, 1, 1, 1, 1, 1,
-0.6930529, -0.418076, -2.791914, 1, 1, 1, 1, 1,
-0.6912268, -0.3287203, -0.7474615, 1, 1, 1, 1, 1,
-0.6893235, -0.600209, -0.3380928, 1, 1, 1, 1, 1,
-0.6858118, 0.5127916, -1.64136, 0, 0, 1, 1, 1,
-0.6828305, 0.5609429, -0.3370698, 1, 0, 0, 1, 1,
-0.676006, -0.06920981, -2.773525, 1, 0, 0, 1, 1,
-0.6741813, 0.2015574, -0.08733682, 1, 0, 0, 1, 1,
-0.672273, -0.4424648, -2.550147, 1, 0, 0, 1, 1,
-0.6657807, 0.3679146, -1.588322, 1, 0, 0, 1, 1,
-0.6639516, 0.755092, -1.448848, 0, 0, 0, 1, 1,
-0.6632032, -2.434616, -3.762575, 0, 0, 0, 1, 1,
-0.6549599, 0.09166376, 0.09435315, 0, 0, 0, 1, 1,
-0.6536054, 0.5537367, -1.034007, 0, 0, 0, 1, 1,
-0.6532301, 0.4822472, -1.097363, 0, 0, 0, 1, 1,
-0.6503193, -1.928335, -3.994735, 0, 0, 0, 1, 1,
-0.6492113, -0.8770108, -1.756965, 0, 0, 0, 1, 1,
-0.6415004, -0.2607429, -2.290554, 1, 1, 1, 1, 1,
-0.6379483, -0.2098315, -1.302087, 1, 1, 1, 1, 1,
-0.6343608, -1.138204, -2.375701, 1, 1, 1, 1, 1,
-0.6332335, 0.2313296, -1.617999, 1, 1, 1, 1, 1,
-0.6329371, 1.267933, -0.1877947, 1, 1, 1, 1, 1,
-0.6275541, -0.9140105, -2.119817, 1, 1, 1, 1, 1,
-0.625586, 0.4843712, -0.8070227, 1, 1, 1, 1, 1,
-0.6197159, -0.4557612, -2.002126, 1, 1, 1, 1, 1,
-0.6136329, -0.4285005, -1.276265, 1, 1, 1, 1, 1,
-0.6132504, -0.4880138, -2.086551, 1, 1, 1, 1, 1,
-0.6094226, -0.5415591, -2.526976, 1, 1, 1, 1, 1,
-0.604363, -0.3416405, -2.673995, 1, 1, 1, 1, 1,
-0.6031438, -0.2188201, -2.239504, 1, 1, 1, 1, 1,
-0.6008182, 0.03177725, -1.219341, 1, 1, 1, 1, 1,
-0.5975612, 0.5807087, -1.948207, 1, 1, 1, 1, 1,
-0.5963531, 0.1498963, -1.939453, 0, 0, 1, 1, 1,
-0.5948876, 1.989057, 0.4717382, 1, 0, 0, 1, 1,
-0.5937462, 1.189164, -1.609403, 1, 0, 0, 1, 1,
-0.5908074, 1.542977, -1.037009, 1, 0, 0, 1, 1,
-0.5895041, -1.88176, -3.006786, 1, 0, 0, 1, 1,
-0.5889972, -1.470654, -3.75104, 1, 0, 0, 1, 1,
-0.5861642, 1.178733, 0.1321344, 0, 0, 0, 1, 1,
-0.585027, 2.200784, -0.08533042, 0, 0, 0, 1, 1,
-0.5838774, -1.107838, -1.544203, 0, 0, 0, 1, 1,
-0.5830415, 1.733046, 0.2481895, 0, 0, 0, 1, 1,
-0.5817157, 0.2467359, -3.696966, 0, 0, 0, 1, 1,
-0.5766177, 0.07389536, -2.873188, 0, 0, 0, 1, 1,
-0.5761322, -1.106807, -1.453437, 0, 0, 0, 1, 1,
-0.5755827, 1.581185, 0.1398248, 1, 1, 1, 1, 1,
-0.572075, 0.01634448, 0.5935183, 1, 1, 1, 1, 1,
-0.5718512, -0.8272204, -1.95186, 1, 1, 1, 1, 1,
-0.5653726, 0.233625, -1.602969, 1, 1, 1, 1, 1,
-0.5642704, 0.4033083, -0.726424, 1, 1, 1, 1, 1,
-0.5628353, -1.574033, -2.321554, 1, 1, 1, 1, 1,
-0.5569693, 0.486744, -1.886551, 1, 1, 1, 1, 1,
-0.5561482, 0.5418984, -0.1343584, 1, 1, 1, 1, 1,
-0.5502519, 1.061876, -0.8860916, 1, 1, 1, 1, 1,
-0.5447975, -0.2112276, -0.8126662, 1, 1, 1, 1, 1,
-0.543874, 0.3656873, -1.958717, 1, 1, 1, 1, 1,
-0.5433203, 0.4835994, -1.404225, 1, 1, 1, 1, 1,
-0.5423734, 0.6897411, 0.1983197, 1, 1, 1, 1, 1,
-0.5421159, 0.5283042, -0.5691198, 1, 1, 1, 1, 1,
-0.5380878, -0.3589788, -2.034188, 1, 1, 1, 1, 1,
-0.5365642, 1.097886, -0.5226675, 0, 0, 1, 1, 1,
-0.5343031, 1.022973, 0.5933089, 1, 0, 0, 1, 1,
-0.5342745, 1.177484, 0.2094695, 1, 0, 0, 1, 1,
-0.5335406, 0.8860832, -0.2039586, 1, 0, 0, 1, 1,
-0.5328255, -1.589639, -1.946974, 1, 0, 0, 1, 1,
-0.525875, 0.4360922, -0.08731616, 1, 0, 0, 1, 1,
-0.5122259, -0.0177406, -1.628744, 0, 0, 0, 1, 1,
-0.5102505, 0.4323793, -1.686143, 0, 0, 0, 1, 1,
-0.5098618, -0.6130775, -0.5432321, 0, 0, 0, 1, 1,
-0.5046233, -0.2928975, 0.07277211, 0, 0, 0, 1, 1,
-0.4999124, 0.504572, -0.9131796, 0, 0, 0, 1, 1,
-0.495115, -0.5032741, -3.255909, 0, 0, 0, 1, 1,
-0.49501, -1.126351, -2.448318, 0, 0, 0, 1, 1,
-0.4942969, 0.02380611, -2.562602, 1, 1, 1, 1, 1,
-0.4919321, 0.9302139, -0.1191545, 1, 1, 1, 1, 1,
-0.4909735, 0.2662294, -1.45919, 1, 1, 1, 1, 1,
-0.4863008, -0.9423127, -2.080519, 1, 1, 1, 1, 1,
-0.4861922, 0.4272807, -2.949533, 1, 1, 1, 1, 1,
-0.4781852, -0.513442, -1.630241, 1, 1, 1, 1, 1,
-0.4774306, -0.0563221, -1.406061, 1, 1, 1, 1, 1,
-0.4772558, 2.029245, 1.111942, 1, 1, 1, 1, 1,
-0.4742759, -1.565868, -3.98672, 1, 1, 1, 1, 1,
-0.4721636, 0.1650744, -3.137858, 1, 1, 1, 1, 1,
-0.4714301, 1.341315, -0.3051585, 1, 1, 1, 1, 1,
-0.4573093, 0.9769098, -0.2771212, 1, 1, 1, 1, 1,
-0.452249, 0.9746991, -1.112543, 1, 1, 1, 1, 1,
-0.4352023, 0.3187212, -2.878503, 1, 1, 1, 1, 1,
-0.4314953, -0.1499676, -1.163899, 1, 1, 1, 1, 1,
-0.4313564, 0.2330896, -0.2703559, 0, 0, 1, 1, 1,
-0.4294274, -1.390048, -2.17331, 1, 0, 0, 1, 1,
-0.4208367, -0.1646039, 0.7724509, 1, 0, 0, 1, 1,
-0.4207999, 1.013287, -0.8756391, 1, 0, 0, 1, 1,
-0.41942, 1.250346, 1.128086, 1, 0, 0, 1, 1,
-0.4188853, 0.4842161, 0.12905, 1, 0, 0, 1, 1,
-0.4181687, 0.6671414, -0.8394536, 0, 0, 0, 1, 1,
-0.4171096, -0.8090901, -3.17861, 0, 0, 0, 1, 1,
-0.4164558, -1.077605, -3.829924, 0, 0, 0, 1, 1,
-0.410917, -0.247311, -1.047609, 0, 0, 0, 1, 1,
-0.4050782, 2.547977, 0.06709898, 0, 0, 0, 1, 1,
-0.4027594, -0.01859248, -1.586395, 0, 0, 0, 1, 1,
-0.4014143, 0.6243126, -0.1259281, 0, 0, 0, 1, 1,
-0.3969667, -0.8044096, -1.195746, 1, 1, 1, 1, 1,
-0.3943524, -0.1047059, -2.18781, 1, 1, 1, 1, 1,
-0.3896671, 1.258656, -0.1042796, 1, 1, 1, 1, 1,
-0.3868341, -0.6565306, -2.843774, 1, 1, 1, 1, 1,
-0.3848602, -0.5067715, -2.948073, 1, 1, 1, 1, 1,
-0.384509, 0.3822113, -1.359405, 1, 1, 1, 1, 1,
-0.3831053, 1.158645, 2.442667, 1, 1, 1, 1, 1,
-0.3830084, 0.8130326, -1.114121, 1, 1, 1, 1, 1,
-0.3828456, 0.9677968, -0.4249543, 1, 1, 1, 1, 1,
-0.3757555, 0.976617, -1.726781, 1, 1, 1, 1, 1,
-0.3743237, -0.6804236, -1.437343, 1, 1, 1, 1, 1,
-0.3733394, -2.247251, -5.812181, 1, 1, 1, 1, 1,
-0.3714151, 1.478677, 0.214551, 1, 1, 1, 1, 1,
-0.3682674, -0.02634366, -2.349997, 1, 1, 1, 1, 1,
-0.3631886, 1.115585, -1.680285, 1, 1, 1, 1, 1,
-0.3625312, -2.255343, -3.894964, 0, 0, 1, 1, 1,
-0.3569025, 0.2676187, 0.4401555, 1, 0, 0, 1, 1,
-0.3561916, -0.1210278, -2.154517, 1, 0, 0, 1, 1,
-0.3555147, -0.5618371, -2.580807, 1, 0, 0, 1, 1,
-0.3515578, -1.339459, -1.805827, 1, 0, 0, 1, 1,
-0.3476804, -1.165227, -2.533972, 1, 0, 0, 1, 1,
-0.345736, 0.2800564, -0.06581785, 0, 0, 0, 1, 1,
-0.3422298, 1.638326, 0.331745, 0, 0, 0, 1, 1,
-0.3404357, 0.6913093, 0.5068417, 0, 0, 0, 1, 1,
-0.3345088, -1.063837, -2.067323, 0, 0, 0, 1, 1,
-0.3331492, -0.3201519, -4.042734, 0, 0, 0, 1, 1,
-0.3275399, 0.8834592, -0.0539559, 0, 0, 0, 1, 1,
-0.3239236, 0.2263276, -1.084177, 0, 0, 0, 1, 1,
-0.3230869, -0.668048, -1.969758, 1, 1, 1, 1, 1,
-0.3218679, -1.625295, -2.445611, 1, 1, 1, 1, 1,
-0.3138298, 0.4052893, -0.9469957, 1, 1, 1, 1, 1,
-0.3134558, -0.1133145, -1.929856, 1, 1, 1, 1, 1,
-0.3098905, -1.446508, -2.825968, 1, 1, 1, 1, 1,
-0.3085781, -0.3824736, -3.69898, 1, 1, 1, 1, 1,
-0.3038978, 0.08075712, 0.336237, 1, 1, 1, 1, 1,
-0.3026415, -0.9026778, -2.986062, 1, 1, 1, 1, 1,
-0.3017652, 0.4427937, 0.5030006, 1, 1, 1, 1, 1,
-0.3002484, -1.408111, -5.464502, 1, 1, 1, 1, 1,
-0.2936054, 0.03412471, -2.100174, 1, 1, 1, 1, 1,
-0.2925443, -0.4493896, -2.776844, 1, 1, 1, 1, 1,
-0.2919271, 1.293876, 1.32865, 1, 1, 1, 1, 1,
-0.2877249, -0.8278089, -2.036146, 1, 1, 1, 1, 1,
-0.2853955, -0.675885, -1.586442, 1, 1, 1, 1, 1,
-0.2797931, 2.057417, -0.735344, 0, 0, 1, 1, 1,
-0.2791612, -0.6122943, -4.181351, 1, 0, 0, 1, 1,
-0.2780421, 0.5636522, -1.408843, 1, 0, 0, 1, 1,
-0.2768339, -0.6990452, -2.885547, 1, 0, 0, 1, 1,
-0.2756583, 0.5376078, 0.4010572, 1, 0, 0, 1, 1,
-0.274899, 0.7516264, -1.04593, 1, 0, 0, 1, 1,
-0.2722099, -0.121553, -1.464406, 0, 0, 0, 1, 1,
-0.2668881, 0.6182562, -1.553624, 0, 0, 0, 1, 1,
-0.2649427, -0.4435292, -4.349639, 0, 0, 0, 1, 1,
-0.2644296, 2.918599, -1.672972, 0, 0, 0, 1, 1,
-0.2629178, 0.8548536, -0.895296, 0, 0, 0, 1, 1,
-0.2620099, -1.399505, -2.774081, 0, 0, 0, 1, 1,
-0.2610965, 0.1472084, -0.001439035, 0, 0, 0, 1, 1,
-0.2493218, -0.07184099, -1.099622, 1, 1, 1, 1, 1,
-0.248515, 1.728993, -0.2601185, 1, 1, 1, 1, 1,
-0.2448866, -0.4093895, -2.147571, 1, 1, 1, 1, 1,
-0.2445557, -0.5577644, -1.418394, 1, 1, 1, 1, 1,
-0.2441646, 1.297336, 0.5096549, 1, 1, 1, 1, 1,
-0.2425598, 0.9903451, -2.648638, 1, 1, 1, 1, 1,
-0.2404514, 0.6176632, 0.2832567, 1, 1, 1, 1, 1,
-0.2374977, -0.8275496, -2.506505, 1, 1, 1, 1, 1,
-0.2360821, -1.589962, -4.131297, 1, 1, 1, 1, 1,
-0.2279477, 0.6029502, -2.267925, 1, 1, 1, 1, 1,
-0.226636, -1.709361, -2.275896, 1, 1, 1, 1, 1,
-0.2198639, -0.5278014, -3.212614, 1, 1, 1, 1, 1,
-0.2188352, -1.283361, -0.1750934, 1, 1, 1, 1, 1,
-0.2181537, 1.850181, 0.3562837, 1, 1, 1, 1, 1,
-0.2170751, -0.8113324, -2.236166, 1, 1, 1, 1, 1,
-0.2169088, -0.6486709, -2.64493, 0, 0, 1, 1, 1,
-0.2154355, 1.353385, -0.3825591, 1, 0, 0, 1, 1,
-0.2138515, 1.280754, 0.0102547, 1, 0, 0, 1, 1,
-0.2130378, 1.318406, 0.6876133, 1, 0, 0, 1, 1,
-0.2084094, 0.02318568, -0.5824358, 1, 0, 0, 1, 1,
-0.1981638, 0.6273217, 1.503024, 1, 0, 0, 1, 1,
-0.1971439, -1.489784, -3.498538, 0, 0, 0, 1, 1,
-0.1967436, 1.033935, -0.3510384, 0, 0, 0, 1, 1,
-0.1964539, -0.270048, -2.576849, 0, 0, 0, 1, 1,
-0.1938962, -0.09305953, -0.4484914, 0, 0, 0, 1, 1,
-0.1917162, 1.952231, 0.8698685, 0, 0, 0, 1, 1,
-0.1909162, 0.1201319, 1.218993, 0, 0, 0, 1, 1,
-0.1887364, 0.2027048, -0.313011, 0, 0, 0, 1, 1,
-0.1843879, 0.4042059, -0.09640469, 1, 1, 1, 1, 1,
-0.1790859, 1.497322, -1.13715, 1, 1, 1, 1, 1,
-0.1771359, 0.4998874, 0.288472, 1, 1, 1, 1, 1,
-0.173778, 0.04266634, 0.2056473, 1, 1, 1, 1, 1,
-0.1729264, -2.326685, -3.91526, 1, 1, 1, 1, 1,
-0.1708759, 0.05775858, -1.966304, 1, 1, 1, 1, 1,
-0.1679138, -0.1237021, -1.690054, 1, 1, 1, 1, 1,
-0.155148, 0.1371992, -3.171122, 1, 1, 1, 1, 1,
-0.1540035, 1.368688, 0.6568986, 1, 1, 1, 1, 1,
-0.1526121, -0.1490724, -3.723042, 1, 1, 1, 1, 1,
-0.1486199, 0.3362419, 0.214413, 1, 1, 1, 1, 1,
-0.1478329, -1.09628, -2.233777, 1, 1, 1, 1, 1,
-0.1476449, -1.33302, -2.668195, 1, 1, 1, 1, 1,
-0.1459196, -1.515593, -4.473368, 1, 1, 1, 1, 1,
-0.1457535, -1.079692, -3.41514, 1, 1, 1, 1, 1,
-0.1424738, 1.014053, 0.7876295, 0, 0, 1, 1, 1,
-0.141526, -0.05865778, -1.57204, 1, 0, 0, 1, 1,
-0.1393097, 0.1369175, -1.270969, 1, 0, 0, 1, 1,
-0.1380444, 0.09583173, -1.691011, 1, 0, 0, 1, 1,
-0.137922, -0.4732398, -3.956647, 1, 0, 0, 1, 1,
-0.1346454, -0.7194139, -2.684191, 1, 0, 0, 1, 1,
-0.1323878, 1.746867, 0.3430383, 0, 0, 0, 1, 1,
-0.1253234, -0.7426063, -3.030865, 0, 0, 0, 1, 1,
-0.1169582, -0.9389961, -3.325113, 0, 0, 0, 1, 1,
-0.1147487, -1.098212, 0.1006715, 0, 0, 0, 1, 1,
-0.1116898, 1.774261, 1.035346, 0, 0, 0, 1, 1,
-0.1107732, 0.6458852, -1.579475, 0, 0, 0, 1, 1,
-0.1037201, -0.7267066, -2.072668, 0, 0, 0, 1, 1,
-0.1017383, -0.01233998, -0.4033128, 1, 1, 1, 1, 1,
-0.09983864, -0.5229094, -3.31677, 1, 1, 1, 1, 1,
-0.09908388, -1.84193, -5.171721, 1, 1, 1, 1, 1,
-0.09835507, -0.05700916, -2.173647, 1, 1, 1, 1, 1,
-0.09765005, -0.7020382, -3.883827, 1, 1, 1, 1, 1,
-0.09711138, -0.1399163, -2.715142, 1, 1, 1, 1, 1,
-0.09682323, -0.92785, -3.828528, 1, 1, 1, 1, 1,
-0.09268987, -1.622315, -3.90642, 1, 1, 1, 1, 1,
-0.08934488, -0.3059866, -3.930737, 1, 1, 1, 1, 1,
-0.08782419, -0.1315206, -2.726301, 1, 1, 1, 1, 1,
-0.08442596, 0.2819647, -0.792064, 1, 1, 1, 1, 1,
-0.0836691, 0.2406016, 0.5149292, 1, 1, 1, 1, 1,
-0.07805452, -0.7215179, -2.705404, 1, 1, 1, 1, 1,
-0.0730954, 1.27395, -0.5110682, 1, 1, 1, 1, 1,
-0.07219994, 0.03666211, -1.961467, 1, 1, 1, 1, 1,
-0.07176767, -1.104207, -3.075582, 0, 0, 1, 1, 1,
-0.06976804, 0.6795613, 1.657111, 1, 0, 0, 1, 1,
-0.06923611, 0.1683961, 0.6531543, 1, 0, 0, 1, 1,
-0.06600208, -1.257061, -2.715698, 1, 0, 0, 1, 1,
-0.06075627, -1.253004, -2.347758, 1, 0, 0, 1, 1,
-0.05951323, 0.1801114, -0.1822122, 1, 0, 0, 1, 1,
-0.05821289, -0.9998225, -3.479234, 0, 0, 0, 1, 1,
-0.05536574, -0.1993402, -4.026, 0, 0, 0, 1, 1,
-0.05366569, 0.9529648, -1.933002, 0, 0, 0, 1, 1,
-0.05224842, -0.5110381, -2.055509, 0, 0, 0, 1, 1,
-0.04988975, 1.02982, 0.7076475, 0, 0, 0, 1, 1,
-0.0396142, -0.4027099, -4.637562, 0, 0, 0, 1, 1,
-0.03631599, -0.9867892, -3.164335, 0, 0, 0, 1, 1,
-0.02828864, 1.666888, -0.2630178, 1, 1, 1, 1, 1,
-0.02827502, 0.5019467, 0.594138, 1, 1, 1, 1, 1,
-0.02699579, -1.924523, -2.652766, 1, 1, 1, 1, 1,
-0.0248517, -0.9869808, -4.28536, 1, 1, 1, 1, 1,
-0.02480058, -0.3651628, -4.428794, 1, 1, 1, 1, 1,
-0.02422907, -0.07322761, -3.946363, 1, 1, 1, 1, 1,
-0.01907775, 1.921895, 1.647766, 1, 1, 1, 1, 1,
-0.01742129, -1.385139, -4.088489, 1, 1, 1, 1, 1,
-0.01696661, 0.5583424, 0.8980213, 1, 1, 1, 1, 1,
-0.01687602, -0.4243896, -2.793239, 1, 1, 1, 1, 1,
-0.01345434, 1.304263, 0.8987934, 1, 1, 1, 1, 1,
-0.01086105, 0.4023108, -0.1649857, 1, 1, 1, 1, 1,
-0.009210695, 1.715592, 0.2221999, 1, 1, 1, 1, 1,
-0.003374513, 2.476463, 0.8082761, 1, 1, 1, 1, 1,
-0.002762675, 0.7523172, 1.519726, 1, 1, 1, 1, 1,
-0.002652623, 0.6267166, 1.193858, 0, 0, 1, 1, 1,
-2.889345e-05, 1.0485, 0.02308042, 1, 0, 0, 1, 1,
0.003942321, -2.000324, 3.417193, 1, 0, 0, 1, 1,
0.006996178, 1.899257, 2.339609, 1, 0, 0, 1, 1,
0.008259824, -1.160275, 3.417011, 1, 0, 0, 1, 1,
0.01266533, -0.6691476, 3.217672, 1, 0, 0, 1, 1,
0.02150557, 0.9205927, 0.9963913, 0, 0, 0, 1, 1,
0.03642956, -2.082181, 2.233529, 0, 0, 0, 1, 1,
0.03783456, 1.549468, 1.900511, 0, 0, 0, 1, 1,
0.0400901, 0.4534428, 0.5163495, 0, 0, 0, 1, 1,
0.05003889, 0.8872694, 0.4125631, 0, 0, 0, 1, 1,
0.05098123, -0.7241744, 2.807315, 0, 0, 0, 1, 1,
0.05250215, 1.384298, 0.779157, 0, 0, 0, 1, 1,
0.05252745, 1.332428, 0.9878805, 1, 1, 1, 1, 1,
0.05708311, 0.495023, -0.3480366, 1, 1, 1, 1, 1,
0.0584402, -0.9397371, 3.736382, 1, 1, 1, 1, 1,
0.05878031, -0.3533815, 2.580355, 1, 1, 1, 1, 1,
0.0596508, -1.655345, 5.167329, 1, 1, 1, 1, 1,
0.05982213, -0.6521716, 2.316982, 1, 1, 1, 1, 1,
0.06226326, 1.33083, 0.3153535, 1, 1, 1, 1, 1,
0.0633217, 0.4015354, -1.523605, 1, 1, 1, 1, 1,
0.06407832, 1.12976, 0.4500284, 1, 1, 1, 1, 1,
0.06478509, 0.4650509, 0.5845351, 1, 1, 1, 1, 1,
0.06820025, -0.525352, 2.650802, 1, 1, 1, 1, 1,
0.07133193, 0.3540009, -1.884284, 1, 1, 1, 1, 1,
0.07149535, -0.1194255, 5.026911, 1, 1, 1, 1, 1,
0.07689209, 0.3850746, 0.03137178, 1, 1, 1, 1, 1,
0.07694768, -2.046629, 2.312607, 1, 1, 1, 1, 1,
0.07760987, -0.854695, 4.183583, 0, 0, 1, 1, 1,
0.08080751, 0.2986343, -0.4293466, 1, 0, 0, 1, 1,
0.08536617, -0.8692586, 1.853002, 1, 0, 0, 1, 1,
0.08783878, 0.8315551, -0.3311905, 1, 0, 0, 1, 1,
0.08794211, 0.1234782, 0.8297259, 1, 0, 0, 1, 1,
0.09216253, -0.7197935, 3.100824, 1, 0, 0, 1, 1,
0.09335153, -1.117583, 3.882179, 0, 0, 0, 1, 1,
0.09378242, -0.1094141, 2.682457, 0, 0, 0, 1, 1,
0.09746397, 2.167767, -0.732743, 0, 0, 0, 1, 1,
0.09992754, -0.8089393, 3.221791, 0, 0, 0, 1, 1,
0.1004326, -0.1042058, 2.585474, 0, 0, 0, 1, 1,
0.1019794, -0.4354066, 1.395996, 0, 0, 0, 1, 1,
0.1047869, -0.06385957, 1.752266, 0, 0, 0, 1, 1,
0.1055916, 0.5554705, -0.328281, 1, 1, 1, 1, 1,
0.1074674, 1.033539, -0.8425203, 1, 1, 1, 1, 1,
0.1089507, -1.132455, 3.583696, 1, 1, 1, 1, 1,
0.111259, -1.268024, 4.910484, 1, 1, 1, 1, 1,
0.1149305, -0.8091326, 2.572906, 1, 1, 1, 1, 1,
0.1149516, 0.4889641, -1.327501, 1, 1, 1, 1, 1,
0.1152476, -1.85787, 2.582497, 1, 1, 1, 1, 1,
0.1180948, -0.1211774, 1.066446, 1, 1, 1, 1, 1,
0.1187249, 0.7691386, 0.6805108, 1, 1, 1, 1, 1,
0.1214944, 0.3826263, 0.448533, 1, 1, 1, 1, 1,
0.1215872, 0.1238388, 0.3639616, 1, 1, 1, 1, 1,
0.1295584, 1.600256, 0.5930631, 1, 1, 1, 1, 1,
0.1315731, 0.694966, -1.009041, 1, 1, 1, 1, 1,
0.1357958, -0.08010697, 3.823819, 1, 1, 1, 1, 1,
0.1373959, 0.7138647, 2.148984, 1, 1, 1, 1, 1,
0.14193, -0.5796266, 2.733147, 0, 0, 1, 1, 1,
0.1434484, 2.288775, -0.4646642, 1, 0, 0, 1, 1,
0.146265, 0.4025213, 2.051498, 1, 0, 0, 1, 1,
0.1518696, 1.039372, -0.7789357, 1, 0, 0, 1, 1,
0.1523312, -0.9904399, 4.523417, 1, 0, 0, 1, 1,
0.1530481, 0.1439703, 0.4319044, 1, 0, 0, 1, 1,
0.1544608, 0.07118659, 1.40114, 0, 0, 0, 1, 1,
0.1586017, -0.1440652, 3.835141, 0, 0, 0, 1, 1,
0.1596111, 0.4349778, 0.7484954, 0, 0, 0, 1, 1,
0.160287, 0.09270713, -0.5268118, 0, 0, 0, 1, 1,
0.1614032, -1.476502, 2.344981, 0, 0, 0, 1, 1,
0.1618575, -0.525566, 2.337901, 0, 0, 0, 1, 1,
0.164279, -1.727313, 3.27223, 0, 0, 0, 1, 1,
0.1728966, 0.02294691, 2.510088, 1, 1, 1, 1, 1,
0.173931, 0.600638, -0.4876459, 1, 1, 1, 1, 1,
0.1759793, 2.1828, 1.508079, 1, 1, 1, 1, 1,
0.1792377, -0.3538622, 2.426342, 1, 1, 1, 1, 1,
0.1817368, 1.539922, 0.4449936, 1, 1, 1, 1, 1,
0.1846671, 1.714078, 0.1536411, 1, 1, 1, 1, 1,
0.1873758, -1.595453, 0.8452729, 1, 1, 1, 1, 1,
0.1916052, -1.214441, 2.961293, 1, 1, 1, 1, 1,
0.1916755, -0.2378883, 1.614308, 1, 1, 1, 1, 1,
0.1944826, -0.2990733, 3.842685, 1, 1, 1, 1, 1,
0.1955673, 1.351646, -0.7774035, 1, 1, 1, 1, 1,
0.1961773, 1.617026, -2.068848, 1, 1, 1, 1, 1,
0.1975524, -2.568849, 3.150951, 1, 1, 1, 1, 1,
0.2019565, -0.06887964, 1.685078, 1, 1, 1, 1, 1,
0.2020966, 0.3509566, 0.2308628, 1, 1, 1, 1, 1,
0.202352, -0.8229389, 2.633395, 0, 0, 1, 1, 1,
0.2060921, 2.989614, 0.2356055, 1, 0, 0, 1, 1,
0.2086582, 1.098496, 0.533849, 1, 0, 0, 1, 1,
0.2091651, 0.7681423, -1.983772, 1, 0, 0, 1, 1,
0.2097153, -0.6495084, 2.433486, 1, 0, 0, 1, 1,
0.2118903, 0.5343409, 0.8594492, 1, 0, 0, 1, 1,
0.2134162, -0.1506077, 2.748136, 0, 0, 0, 1, 1,
0.2145367, -0.8425624, 2.021948, 0, 0, 0, 1, 1,
0.21496, 0.2577248, 0.4257023, 0, 0, 0, 1, 1,
0.2152084, 1.294558, 0.6323299, 0, 0, 0, 1, 1,
0.2155134, -0.3561587, 1.1824, 0, 0, 0, 1, 1,
0.216125, -1.247533, 2.928632, 0, 0, 0, 1, 1,
0.217227, -0.05021663, 1.236273, 0, 0, 0, 1, 1,
0.2173727, 0.956162, -0.5232773, 1, 1, 1, 1, 1,
0.2237896, 1.358761, 1.286599, 1, 1, 1, 1, 1,
0.2255637, -0.1894048, 2.906131, 1, 1, 1, 1, 1,
0.2267007, -0.2962679, 2.346264, 1, 1, 1, 1, 1,
0.2271764, 0.4142254, -0.3889143, 1, 1, 1, 1, 1,
0.2276041, -0.5540181, 1.508994, 1, 1, 1, 1, 1,
0.2289094, -1.192731, 1.920369, 1, 1, 1, 1, 1,
0.2369289, 0.9792707, 0.1876852, 1, 1, 1, 1, 1,
0.2380094, 1.328677, -0.2496582, 1, 1, 1, 1, 1,
0.239881, -1.858826, 2.833395, 1, 1, 1, 1, 1,
0.2404086, -0.03320529, 1.020146, 1, 1, 1, 1, 1,
0.2422163, -0.09909593, 1.915532, 1, 1, 1, 1, 1,
0.2444327, 0.4839018, -0.4332567, 1, 1, 1, 1, 1,
0.2451925, -0.8952679, 3.293576, 1, 1, 1, 1, 1,
0.2475742, 2.004814, -0.4039583, 1, 1, 1, 1, 1,
0.2513573, 1.280037, 1.272044, 0, 0, 1, 1, 1,
0.2514398, -0.1088907, 2.043242, 1, 0, 0, 1, 1,
0.2515465, 0.9540346, 2.574925, 1, 0, 0, 1, 1,
0.2564912, -0.4836557, 3.680565, 1, 0, 0, 1, 1,
0.2646384, -1.127038, 1.998318, 1, 0, 0, 1, 1,
0.2674558, 0.4872617, 1.709234, 1, 0, 0, 1, 1,
0.2677021, 0.8671733, -1.530436, 0, 0, 0, 1, 1,
0.2729305, -1.556425, 4.944692, 0, 0, 0, 1, 1,
0.2739433, -0.8409242, 4.649355, 0, 0, 0, 1, 1,
0.27573, 0.4905877, 1.04592, 0, 0, 0, 1, 1,
0.2774215, 2.290477, -0.8990769, 0, 0, 0, 1, 1,
0.2785996, -1.457532, 2.041347, 0, 0, 0, 1, 1,
0.2791442, 0.1639322, 3.316202, 0, 0, 0, 1, 1,
0.2803012, 0.5053862, -0.3044206, 1, 1, 1, 1, 1,
0.284521, 0.2001024, -0.3284992, 1, 1, 1, 1, 1,
0.286927, 0.6437334, 2.160495, 1, 1, 1, 1, 1,
0.2877507, -0.2445713, 3.70164, 1, 1, 1, 1, 1,
0.2884575, 1.463308, -0.7370775, 1, 1, 1, 1, 1,
0.2893082, 2.293864, 0.5012413, 1, 1, 1, 1, 1,
0.2960933, 0.2361103, 1.931218, 1, 1, 1, 1, 1,
0.2976952, -0.05064343, 0.9603359, 1, 1, 1, 1, 1,
0.2998612, 1.005105, -3.047816, 1, 1, 1, 1, 1,
0.3089656, 0.8182108, 1.52139, 1, 1, 1, 1, 1,
0.3121689, -0.8914583, 0.04360645, 1, 1, 1, 1, 1,
0.3127556, -1.202922, 1.62718, 1, 1, 1, 1, 1,
0.3144814, 1.316349, 1.407587, 1, 1, 1, 1, 1,
0.3168799, 0.1089858, 2.060869, 1, 1, 1, 1, 1,
0.3203228, -0.6370909, 3.127944, 1, 1, 1, 1, 1,
0.3281163, -2.381169, 2.426851, 0, 0, 1, 1, 1,
0.3295572, 0.2361761, 3.080486, 1, 0, 0, 1, 1,
0.3298789, 0.1087251, 2.40496, 1, 0, 0, 1, 1,
0.3298897, -0.09833756, 1.09703, 1, 0, 0, 1, 1,
0.3325299, 1.118458, 1.972506, 1, 0, 0, 1, 1,
0.3348094, 1.897164, -0.3176194, 1, 0, 0, 1, 1,
0.3359393, 0.5154135, 0.4170798, 0, 0, 0, 1, 1,
0.3393377, -0.205072, 4.382677, 0, 0, 0, 1, 1,
0.3411513, -1.176888, 2.918305, 0, 0, 0, 1, 1,
0.3421005, -1.298049, 3.150034, 0, 0, 0, 1, 1,
0.344528, 2.108491, -1.182464, 0, 0, 0, 1, 1,
0.3463586, 0.3978097, 1.45744, 0, 0, 0, 1, 1,
0.3463872, -0.2545979, 3.178171, 0, 0, 0, 1, 1,
0.3494698, -0.2865741, 2.838593, 1, 1, 1, 1, 1,
0.3553572, -1.427278, 2.492521, 1, 1, 1, 1, 1,
0.3570908, 0.9661967, -0.3111894, 1, 1, 1, 1, 1,
0.3625851, 0.3476331, -0.2972557, 1, 1, 1, 1, 1,
0.3720019, -1.11022, 3.231774, 1, 1, 1, 1, 1,
0.3753741, -0.05745821, 1.262538, 1, 1, 1, 1, 1,
0.3775534, 0.05793722, 0.89481, 1, 1, 1, 1, 1,
0.3850458, 1.194362, 1.535217, 1, 1, 1, 1, 1,
0.3871356, -0.4711914, 2.053218, 1, 1, 1, 1, 1,
0.3899604, -0.05140091, 0.6359628, 1, 1, 1, 1, 1,
0.3921709, -1.126767, 1.892613, 1, 1, 1, 1, 1,
0.3938495, -1.064717, 2.380343, 1, 1, 1, 1, 1,
0.3981752, -0.193004, 0.4294089, 1, 1, 1, 1, 1,
0.3991964, 1.21053, -0.03794468, 1, 1, 1, 1, 1,
0.4011642, -0.365907, 3.611408, 1, 1, 1, 1, 1,
0.4019682, 1.009544, 1.538147, 0, 0, 1, 1, 1,
0.4045396, 2.568161, -0.4477033, 1, 0, 0, 1, 1,
0.4053772, 1.73428, 2.59623, 1, 0, 0, 1, 1,
0.4080402, 0.8639909, 2.753078, 1, 0, 0, 1, 1,
0.4086542, -1.611235, 3.038219, 1, 0, 0, 1, 1,
0.4091439, -0.4916585, 2.312593, 1, 0, 0, 1, 1,
0.4099387, -1.686397, 4.062551, 0, 0, 0, 1, 1,
0.4111716, 0.5507473, -0.5347518, 0, 0, 0, 1, 1,
0.4116124, -0.9649298, 1.32395, 0, 0, 0, 1, 1,
0.4116976, -0.555877, 2.429053, 0, 0, 0, 1, 1,
0.4133572, -0.1804013, 2.162843, 0, 0, 0, 1, 1,
0.4157553, -1.537968, 2.586299, 0, 0, 0, 1, 1,
0.4197327, -0.6821717, 2.338953, 0, 0, 0, 1, 1,
0.4236051, -1.028685, 3.453137, 1, 1, 1, 1, 1,
0.4248906, 0.5273339, -0.2920758, 1, 1, 1, 1, 1,
0.4286605, 2.078147, 1.137072, 1, 1, 1, 1, 1,
0.4324752, 1.379237, 1.326725, 1, 1, 1, 1, 1,
0.4328934, 1.016349, 0.8999251, 1, 1, 1, 1, 1,
0.4352697, -0.5370154, 2.166678, 1, 1, 1, 1, 1,
0.4429341, 0.03219806, 0.8658702, 1, 1, 1, 1, 1,
0.4445696, -0.07547975, 1.095843, 1, 1, 1, 1, 1,
0.4464092, 0.02392082, 0.4922977, 1, 1, 1, 1, 1,
0.4464165, -1.209149, 3.699619, 1, 1, 1, 1, 1,
0.4467607, -0.08288316, 1.156635, 1, 1, 1, 1, 1,
0.4487933, -0.7721655, 2.462952, 1, 1, 1, 1, 1,
0.449141, -1.208696, 1.856785, 1, 1, 1, 1, 1,
0.4496081, 0.2601446, 0.4969288, 1, 1, 1, 1, 1,
0.4600261, -1.850116, 3.517595, 1, 1, 1, 1, 1,
0.4624751, 0.3177332, 2.174481, 0, 0, 1, 1, 1,
0.4648461, -0.01422489, -0.6647499, 1, 0, 0, 1, 1,
0.4652458, -0.3327837, 2.198932, 1, 0, 0, 1, 1,
0.4761001, -0.4642475, 1.585446, 1, 0, 0, 1, 1,
0.4886473, -0.500469, 1.674816, 1, 0, 0, 1, 1,
0.4911369, -1.487946, 0.8894429, 1, 0, 0, 1, 1,
0.4924417, -0.888002, 2.022251, 0, 0, 0, 1, 1,
0.4924764, -0.01151019, 1.394844, 0, 0, 0, 1, 1,
0.4926227, 0.2744529, 2.245568, 0, 0, 0, 1, 1,
0.4959972, 0.04919357, 2.567935, 0, 0, 0, 1, 1,
0.5013233, 0.5819555, 1.582752, 0, 0, 0, 1, 1,
0.5052514, 0.1234246, 0.8435535, 0, 0, 0, 1, 1,
0.5093057, -0.4414283, 2.121421, 0, 0, 0, 1, 1,
0.5118684, 0.7156547, 1.524254, 1, 1, 1, 1, 1,
0.5121471, -0.2835619, 4.514475, 1, 1, 1, 1, 1,
0.512405, 1.372198, 0.5819208, 1, 1, 1, 1, 1,
0.5134227, -0.1750042, -1.616108, 1, 1, 1, 1, 1,
0.5209098, 1.333197, -0.5087033, 1, 1, 1, 1, 1,
0.526983, -0.304377, -1.081236, 1, 1, 1, 1, 1,
0.5278797, 0.3675179, 0.9001041, 1, 1, 1, 1, 1,
0.5279763, 0.1164014, 1.409381, 1, 1, 1, 1, 1,
0.5297742, -1.520498, 3.722838, 1, 1, 1, 1, 1,
0.5361291, -1.26497, 3.679567, 1, 1, 1, 1, 1,
0.5364096, -1.998577, 1.229385, 1, 1, 1, 1, 1,
0.5383034, 0.08556654, 2.182427, 1, 1, 1, 1, 1,
0.5405093, 0.7633635, 1.18662, 1, 1, 1, 1, 1,
0.5483073, 0.9991522, -0.9626257, 1, 1, 1, 1, 1,
0.5483685, -0.05616724, 1.213904, 1, 1, 1, 1, 1,
0.5524573, 1.524941, 1.434707, 0, 0, 1, 1, 1,
0.5540363, 0.2163727, 0.4228988, 1, 0, 0, 1, 1,
0.5575348, 0.02784999, 2.322514, 1, 0, 0, 1, 1,
0.5640053, 0.04499019, 0.8528658, 1, 0, 0, 1, 1,
0.5644452, -0.2279109, 1.015872, 1, 0, 0, 1, 1,
0.5653207, -1.380224, 2.300727, 1, 0, 0, 1, 1,
0.5671554, 0.4151243, 2.538744, 0, 0, 0, 1, 1,
0.5698606, 0.6552014, 1.657508, 0, 0, 0, 1, 1,
0.5740108, -0.4673187, 2.950465, 0, 0, 0, 1, 1,
0.5751969, -0.5074766, 1.284666, 0, 0, 0, 1, 1,
0.5789497, 0.3395728, 0.5179114, 0, 0, 0, 1, 1,
0.5824975, -1.60191, 1.464643, 0, 0, 0, 1, 1,
0.5865507, 1.423519, -0.9105656, 0, 0, 0, 1, 1,
0.5892616, -1.070971, 1.614673, 1, 1, 1, 1, 1,
0.5955133, -1.204936, 4.418696, 1, 1, 1, 1, 1,
0.5964172, 0.1613779, 1.347612, 1, 1, 1, 1, 1,
0.5971794, 1.47481, 0.5624524, 1, 1, 1, 1, 1,
0.5982681, -1.492431, 4.154349, 1, 1, 1, 1, 1,
0.5995128, 0.9688516, 0.2681454, 1, 1, 1, 1, 1,
0.6042161, 0.3994581, -0.08417138, 1, 1, 1, 1, 1,
0.604463, -0.752268, 2.213668, 1, 1, 1, 1, 1,
0.6119025, -0.2220983, 1.403629, 1, 1, 1, 1, 1,
0.6120303, -0.9467849, 2.287204, 1, 1, 1, 1, 1,
0.6120603, -2.756981, 2.225478, 1, 1, 1, 1, 1,
0.6185965, 0.172951, 1.087634, 1, 1, 1, 1, 1,
0.620949, 0.6340483, -0.2160737, 1, 1, 1, 1, 1,
0.6253763, -0.2603299, 2.632671, 1, 1, 1, 1, 1,
0.6260381, -1.253045, 2.763316, 1, 1, 1, 1, 1,
0.6311566, -1.660408, 2.999079, 0, 0, 1, 1, 1,
0.6364894, 0.3731433, 1.351672, 1, 0, 0, 1, 1,
0.6378243, 0.482772, -0.1486918, 1, 0, 0, 1, 1,
0.6386206, -0.3485948, -0.5574998, 1, 0, 0, 1, 1,
0.6490505, -2.601578, 2.245203, 1, 0, 0, 1, 1,
0.6503918, 0.5322267, 0.4161547, 1, 0, 0, 1, 1,
0.654856, -0.400448, 0.6612749, 0, 0, 0, 1, 1,
0.6562439, 2.218106, -1.231315, 0, 0, 0, 1, 1,
0.6574914, 0.9325261, 0.9647099, 0, 0, 0, 1, 1,
0.6586398, 1.349341, 0.2494923, 0, 0, 0, 1, 1,
0.6599954, -0.3961845, 3.109331, 0, 0, 0, 1, 1,
0.6636581, -0.2027484, 1.392902, 0, 0, 0, 1, 1,
0.6639518, -1.2032, 1.83798, 0, 0, 0, 1, 1,
0.6664183, 0.4564308, 1.238922, 1, 1, 1, 1, 1,
0.6704064, -0.4091653, 1.793301, 1, 1, 1, 1, 1,
0.6842124, 0.5487077, 2.292334, 1, 1, 1, 1, 1,
0.6856654, -0.3507247, 0.9403245, 1, 1, 1, 1, 1,
0.6903974, -0.2488291, 4.171846, 1, 1, 1, 1, 1,
0.6972983, 0.8564116, 0.9136118, 1, 1, 1, 1, 1,
0.6991375, 0.222427, 0.2106487, 1, 1, 1, 1, 1,
0.699724, 0.2822163, 0.2927546, 1, 1, 1, 1, 1,
0.7023326, 0.1296293, 1.024798, 1, 1, 1, 1, 1,
0.7026687, 0.214127, 0.2737286, 1, 1, 1, 1, 1,
0.7098798, 1.18617, 1.738437, 1, 1, 1, 1, 1,
0.7139161, 0.2688919, 0.8182096, 1, 1, 1, 1, 1,
0.7141491, 0.274997, 0.6904593, 1, 1, 1, 1, 1,
0.7176969, 0.2656326, 1.840885, 1, 1, 1, 1, 1,
0.725383, -0.8214775, 3.853221, 1, 1, 1, 1, 1,
0.7262021, -0.3821601, 2.038028, 0, 0, 1, 1, 1,
0.727185, 1.22842, 0.5224523, 1, 0, 0, 1, 1,
0.7286206, -0.7358121, 2.114925, 1, 0, 0, 1, 1,
0.7298374, -2.080616, 2.462283, 1, 0, 0, 1, 1,
0.7309711, 1.765692, -1.807715, 1, 0, 0, 1, 1,
0.7316219, -0.6440537, 1.629738, 1, 0, 0, 1, 1,
0.7316645, -1.286108, 1.114841, 0, 0, 0, 1, 1,
0.7328285, -0.3074403, 3.311978, 0, 0, 0, 1, 1,
0.7337803, -0.5592713, 2.651839, 0, 0, 0, 1, 1,
0.734102, 0.09561433, 2.199216, 0, 0, 0, 1, 1,
0.7400117, 1.383653, 0.9733815, 0, 0, 0, 1, 1,
0.7493733, -1.165388, 3.283035, 0, 0, 0, 1, 1,
0.7525215, 0.5016407, 1.006256, 0, 0, 0, 1, 1,
0.759942, -0.9392852, 3.521993, 1, 1, 1, 1, 1,
0.7665334, 1.232021, 0.4596346, 1, 1, 1, 1, 1,
0.7676384, 0.7968147, 2.312444, 1, 1, 1, 1, 1,
0.7716883, 1.918293, 1.659159, 1, 1, 1, 1, 1,
0.7761108, 0.2794529, 0.5102358, 1, 1, 1, 1, 1,
0.7822558, 1.090065, 0.5828593, 1, 1, 1, 1, 1,
0.7841479, -1.401745, 3.121569, 1, 1, 1, 1, 1,
0.7918544, -0.2846392, 0.8719316, 1, 1, 1, 1, 1,
0.8018779, 0.3788589, -0.129434, 1, 1, 1, 1, 1,
0.8091882, -0.1874379, 2.161274, 1, 1, 1, 1, 1,
0.8132446, -1.330985, 3.434486, 1, 1, 1, 1, 1,
0.8150834, -1.237854, 3.076985, 1, 1, 1, 1, 1,
0.8177783, 1.504917, 1.38634, 1, 1, 1, 1, 1,
0.8178067, 0.1274151, 1.798036, 1, 1, 1, 1, 1,
0.8196822, 0.3114728, 0.9977211, 1, 1, 1, 1, 1,
0.8372441, 2.283628, -0.1857419, 0, 0, 1, 1, 1,
0.8466436, 0.4954702, 1.919281, 1, 0, 0, 1, 1,
0.8526232, -1.990853, 1.962249, 1, 0, 0, 1, 1,
0.8577211, 2.148958, 0.141675, 1, 0, 0, 1, 1,
0.8619097, -0.5198658, 2.513504, 1, 0, 0, 1, 1,
0.8650749, 0.4036817, -0.1770376, 1, 0, 0, 1, 1,
0.8688193, 1.783453, 1.732138, 0, 0, 0, 1, 1,
0.880604, -1.677219, 2.747416, 0, 0, 0, 1, 1,
0.8855537, -0.4858287, 2.804595, 0, 0, 0, 1, 1,
0.9065556, -1.134241, 4.138505, 0, 0, 0, 1, 1,
0.9076066, 0.03585946, 2.91714, 0, 0, 0, 1, 1,
0.9113562, -1.27955, 2.397089, 0, 0, 0, 1, 1,
0.9172557, -2.63916, 2.794757, 0, 0, 0, 1, 1,
0.9194871, -1.033517, 3.602431, 1, 1, 1, 1, 1,
0.9214242, 0.474138, 0.2123461, 1, 1, 1, 1, 1,
0.9285488, 0.2568056, 0.1690933, 1, 1, 1, 1, 1,
0.9296332, 0.03147815, 0.2217924, 1, 1, 1, 1, 1,
0.9414644, -0.5705266, 1.793498, 1, 1, 1, 1, 1,
0.9428665, 0.9709459, 0.3386756, 1, 1, 1, 1, 1,
0.9447391, 1.165606, -1.773485, 1, 1, 1, 1, 1,
0.9480987, -0.7458156, 3.399131, 1, 1, 1, 1, 1,
0.9555305, 0.116525, 0.06889839, 1, 1, 1, 1, 1,
0.9591445, 0.898249, 1.501577, 1, 1, 1, 1, 1,
0.9597537, -0.2894883, 1.951861, 1, 1, 1, 1, 1,
0.9601044, 0.2660353, 2.389051, 1, 1, 1, 1, 1,
0.9619721, -0.3956763, 0.9644325, 1, 1, 1, 1, 1,
0.9642349, -0.5702858, 2.140309, 1, 1, 1, 1, 1,
0.9651476, -0.3043967, 1.543578, 1, 1, 1, 1, 1,
0.9681311, -0.2066381, 2.334152, 0, 0, 1, 1, 1,
0.9691489, 1.736038, 0.5723831, 1, 0, 0, 1, 1,
0.9862575, 0.5720991, 0.6128759, 1, 0, 0, 1, 1,
0.9920709, -0.9844866, 4.24148, 1, 0, 0, 1, 1,
0.9945841, 0.8607712, 1.481077, 1, 0, 0, 1, 1,
0.9961811, -0.09211263, 0.06179368, 1, 0, 0, 1, 1,
0.9971961, 0.6010476, 0.8942834, 0, 0, 0, 1, 1,
0.9973801, 1.218395, 1.555647, 0, 0, 0, 1, 1,
0.9977468, 0.0004798232, 1.907661, 0, 0, 0, 1, 1,
0.9989156, 0.2491521, 0.7324322, 0, 0, 0, 1, 1,
1.009772, -0.4913709, 1.928833, 0, 0, 0, 1, 1,
1.013934, 1.191584, 0.04394979, 0, 0, 0, 1, 1,
1.014209, 0.5179533, 2.158262, 0, 0, 0, 1, 1,
1.016285, 0.5168205, 0.6468048, 1, 1, 1, 1, 1,
1.017714, 1.339577, 0.9110622, 1, 1, 1, 1, 1,
1.044235, 1.006167, 2.120752, 1, 1, 1, 1, 1,
1.046579, 0.7113324, 0.5777486, 1, 1, 1, 1, 1,
1.046834, 0.6360289, 2.00157, 1, 1, 1, 1, 1,
1.047979, 0.5937327, 1.591293, 1, 1, 1, 1, 1,
1.068435, -1.045056, 3.258412, 1, 1, 1, 1, 1,
1.0839, 0.136305, 2.610226, 1, 1, 1, 1, 1,
1.087371, -0.4260787, 3.547096, 1, 1, 1, 1, 1,
1.093348, 1.242067, 2.366798, 1, 1, 1, 1, 1,
1.094894, -0.05423066, 1.323648, 1, 1, 1, 1, 1,
1.095855, 0.7165641, 0.1973447, 1, 1, 1, 1, 1,
1.096649, -0.94137, 1.93426, 1, 1, 1, 1, 1,
1.097252, -1.027877, 1.499528, 1, 1, 1, 1, 1,
1.097762, -1.271971, 2.032318, 1, 1, 1, 1, 1,
1.111509, 0.1946203, 1.013247, 0, 0, 1, 1, 1,
1.114444, -1.485734, 2.380243, 1, 0, 0, 1, 1,
1.125291, 0.3154283, 1.538445, 1, 0, 0, 1, 1,
1.131377, -0.6876444, 3.618643, 1, 0, 0, 1, 1,
1.138212, -0.4259426, 1.227609, 1, 0, 0, 1, 1,
1.138398, -0.6299173, 1.594494, 1, 0, 0, 1, 1,
1.156808, 0.6027158, 0.7187873, 0, 0, 0, 1, 1,
1.159846, -0.112812, 2.131232, 0, 0, 0, 1, 1,
1.166024, -1.218727, 1.481906, 0, 0, 0, 1, 1,
1.169834, -0.6799425, 1.887648, 0, 0, 0, 1, 1,
1.178419, -0.704717, 0.6365479, 0, 0, 0, 1, 1,
1.186624, -0.4324448, 1.841057, 0, 0, 0, 1, 1,
1.190388, 0.4740081, 2.501342, 0, 0, 0, 1, 1,
1.197446, -1.801185, 0.3745596, 1, 1, 1, 1, 1,
1.203492, -0.6354126, 2.997357, 1, 1, 1, 1, 1,
1.206105, -0.9681987, 2.121088, 1, 1, 1, 1, 1,
1.210757, -0.4411681, 1.604244, 1, 1, 1, 1, 1,
1.211415, 0.9715669, 1.788052, 1, 1, 1, 1, 1,
1.215429, -0.9867312, 2.461423, 1, 1, 1, 1, 1,
1.219609, -0.1970679, -0.9222319, 1, 1, 1, 1, 1,
1.219865, -1.1052, 4.008026, 1, 1, 1, 1, 1,
1.228478, -0.5524917, 1.597375, 1, 1, 1, 1, 1,
1.230452, -0.1043789, 1.607168, 1, 1, 1, 1, 1,
1.244447, 0.3866921, 2.27844, 1, 1, 1, 1, 1,
1.253878, 1.633579, -0.3508651, 1, 1, 1, 1, 1,
1.254859, -0.05425959, 1.43237, 1, 1, 1, 1, 1,
1.268623, -2.034245, 3.351362, 1, 1, 1, 1, 1,
1.28659, -0.7276827, 3.113943, 1, 1, 1, 1, 1,
1.301938, -2.02444, 3.371007, 0, 0, 1, 1, 1,
1.320895, -0.3129846, 1.069164, 1, 0, 0, 1, 1,
1.324645, 0.2185297, 2.168701, 1, 0, 0, 1, 1,
1.328025, -1.199069, 2.553762, 1, 0, 0, 1, 1,
1.330302, 1.453517, 2.827944, 1, 0, 0, 1, 1,
1.332067, 1.433664, 2.377908, 1, 0, 0, 1, 1,
1.332565, 0.6332635, 1.36624, 0, 0, 0, 1, 1,
1.341402, -1.781109, 2.763948, 0, 0, 0, 1, 1,
1.367943, -1.056491, 2.673021, 0, 0, 0, 1, 1,
1.369899, 0.4156893, 1.427058, 0, 0, 0, 1, 1,
1.373914, 0.1096442, 2.045504, 0, 0, 0, 1, 1,
1.375588, -0.568008, -0.1825555, 0, 0, 0, 1, 1,
1.388949, 2.077995, 0.05026628, 0, 0, 0, 1, 1,
1.389198, -0.5002431, 2.193538, 1, 1, 1, 1, 1,
1.393626, 1.372042, 0.1138469, 1, 1, 1, 1, 1,
1.397824, -0.1809373, 3.475504, 1, 1, 1, 1, 1,
1.404948, -0.1747387, 0.8207574, 1, 1, 1, 1, 1,
1.405348, -0.4713246, 1.584965, 1, 1, 1, 1, 1,
1.409365, 0.5772122, 1.418343, 1, 1, 1, 1, 1,
1.414971, -1.130566, 3.281161, 1, 1, 1, 1, 1,
1.419861, -0.7157599, 3.226801, 1, 1, 1, 1, 1,
1.420702, -0.4810601, 3.332534, 1, 1, 1, 1, 1,
1.428162, -0.8259962, -0.6021603, 1, 1, 1, 1, 1,
1.445345, -0.1633096, 3.498114, 1, 1, 1, 1, 1,
1.451755, 1.349757, 1.182665, 1, 1, 1, 1, 1,
1.46011, 0.6075867, 2.692806, 1, 1, 1, 1, 1,
1.463878, -0.1528662, 3.926968, 1, 1, 1, 1, 1,
1.46415, 1.899196, -0.09109529, 1, 1, 1, 1, 1,
1.469544, -0.7648762, 1.303812, 0, 0, 1, 1, 1,
1.469649, -0.8265635, 3.662872, 1, 0, 0, 1, 1,
1.484166, 0.2549056, 3.292416, 1, 0, 0, 1, 1,
1.488966, -0.5595469, 2.409849, 1, 0, 0, 1, 1,
1.511701, 0.1179464, 0.6555737, 1, 0, 0, 1, 1,
1.516896, 0.8492698, 1.510155, 1, 0, 0, 1, 1,
1.520344, -1.796779, 2.641281, 0, 0, 0, 1, 1,
1.523778, 0.1686741, 2.088621, 0, 0, 0, 1, 1,
1.535177, -0.08938795, 0.9750206, 0, 0, 0, 1, 1,
1.538077, 0.287037, 0.8697149, 0, 0, 0, 1, 1,
1.552924, -0.1485345, 0.5732888, 0, 0, 0, 1, 1,
1.553763, -0.5745843, 0.8086841, 0, 0, 0, 1, 1,
1.559535, 0.3677268, 2.259267, 0, 0, 0, 1, 1,
1.565399, 1.263924, 1.11149, 1, 1, 1, 1, 1,
1.571218, 1.041453, 0.383584, 1, 1, 1, 1, 1,
1.579164, 0.4616383, 1.467339, 1, 1, 1, 1, 1,
1.591783, 0.9503219, 1.814955, 1, 1, 1, 1, 1,
1.605678, 0.6523308, 0.3137856, 1, 1, 1, 1, 1,
1.617307, 0.6257088, -0.03392984, 1, 1, 1, 1, 1,
1.61949, -0.9832996, 3.961729, 1, 1, 1, 1, 1,
1.631575, -0.7496932, 1.70936, 1, 1, 1, 1, 1,
1.634635, 0.3474908, 0.1738343, 1, 1, 1, 1, 1,
1.642685, 0.05751949, 0.866603, 1, 1, 1, 1, 1,
1.656191, -0.8657251, 3.087806, 1, 1, 1, 1, 1,
1.656397, 0.6001851, 2.04578, 1, 1, 1, 1, 1,
1.66037, -1.94493, 2.639393, 1, 1, 1, 1, 1,
1.676009, 0.4703905, 1.882289, 1, 1, 1, 1, 1,
1.67968, -1.783544, 3.822957, 1, 1, 1, 1, 1,
1.695168, 0.5323037, 0.2117662, 0, 0, 1, 1, 1,
1.708607, 1.314249, 1.517219, 1, 0, 0, 1, 1,
1.711537, -2.618465, 4.517611, 1, 0, 0, 1, 1,
1.713363, 0.5663828, -0.07328576, 1, 0, 0, 1, 1,
1.716589, 0.4447678, 0.9296649, 1, 0, 0, 1, 1,
1.74272, -0.2851926, 2.586948, 1, 0, 0, 1, 1,
1.757972, 0.8653108, 0.2776672, 0, 0, 0, 1, 1,
1.766869, -0.5091283, 1.163016, 0, 0, 0, 1, 1,
1.776573, 0.001957739, 2.237563, 0, 0, 0, 1, 1,
1.786067, 0.9770514, 0.4769133, 0, 0, 0, 1, 1,
1.794848, 0.5455588, 0.3861259, 0, 0, 0, 1, 1,
1.801588, -0.6500719, 1.317203, 0, 0, 0, 1, 1,
1.804963, 0.5688965, 1.087493, 0, 0, 0, 1, 1,
1.810056, -0.9313471, 3.277188, 1, 1, 1, 1, 1,
1.844868, -0.8675194, 2.166516, 1, 1, 1, 1, 1,
1.860353, -0.3545599, 1.055766, 1, 1, 1, 1, 1,
1.873698, -0.7765584, -0.4983737, 1, 1, 1, 1, 1,
1.881213, 0.6593387, 2.416044, 1, 1, 1, 1, 1,
1.890145, -1.507511, 2.622162, 1, 1, 1, 1, 1,
1.919962, -1.888878, 3.124765, 1, 1, 1, 1, 1,
1.921225, -2.153291, 3.020152, 1, 1, 1, 1, 1,
1.926844, -0.7758501, 2.389047, 1, 1, 1, 1, 1,
1.932001, -0.835187, 3.913246, 1, 1, 1, 1, 1,
1.949811, -0.1601046, 0.9273072, 1, 1, 1, 1, 1,
1.981165, 0.5743319, 2.729043, 1, 1, 1, 1, 1,
1.990251, -0.429331, 0.8506076, 1, 1, 1, 1, 1,
1.997676, 0.3066437, 0.9722405, 1, 1, 1, 1, 1,
2.007703, 1.116509, 0.2712687, 1, 1, 1, 1, 1,
2.040197, -1.841317, 3.637063, 0, 0, 1, 1, 1,
2.063919, -1.45332, 3.221442, 1, 0, 0, 1, 1,
2.074443, 0.390467, 1.934278, 1, 0, 0, 1, 1,
2.086741, -1.282722, 3.537372, 1, 0, 0, 1, 1,
2.096367, -1.587944, 1.590033, 1, 0, 0, 1, 1,
2.15103, 0.006861645, 1.906015, 1, 0, 0, 1, 1,
2.19753, 1.475423, 3.007325, 0, 0, 0, 1, 1,
2.208018, -1.386392, 2.900067, 0, 0, 0, 1, 1,
2.360419, 0.8286433, 0.4583482, 0, 0, 0, 1, 1,
2.407813, 0.5665053, 1.444539, 0, 0, 0, 1, 1,
2.415642, 0.7183895, -0.3286964, 0, 0, 0, 1, 1,
2.435545, -0.3755534, 1.58475, 0, 0, 0, 1, 1,
2.436656, -0.5208432, 2.625018, 0, 0, 0, 1, 1,
2.470795, -1.017227, 2.687718, 1, 1, 1, 1, 1,
2.50937, 0.4987303, 1.050913, 1, 1, 1, 1, 1,
2.54127, 1.565632, 1.125316, 1, 1, 1, 1, 1,
2.65936, 0.7618524, 1.547421, 1, 1, 1, 1, 1,
2.821135, 0.07341806, 2.220869, 1, 1, 1, 1, 1,
2.887844, -0.3037733, 2.219455, 1, 1, 1, 1, 1,
3.020599, 0.0721694, 2.586583, 1, 1, 1, 1, 1
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
var radius = 9.619713;
var distance = 33.78883;
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
mvMatrix.translate( 0.3781462, -0.115013, 0.3224258 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.78883);
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