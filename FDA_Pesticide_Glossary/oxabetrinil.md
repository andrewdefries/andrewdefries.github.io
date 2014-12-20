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
-3.387387, -0.848353, -2.866552, 1, 0, 0, 1,
-3.225607, 0.6551772, -1.040555, 1, 0.007843138, 0, 1,
-3.199176, -0.9368385, -0.3526387, 1, 0.01176471, 0, 1,
-2.860377, 0.4791674, -3.205499, 1, 0.01960784, 0, 1,
-2.768414, 0.794735, -2.292627, 1, 0.02352941, 0, 1,
-2.612993, 2.054227, -0.890645, 1, 0.03137255, 0, 1,
-2.525347, 1.513872, -0.8593193, 1, 0.03529412, 0, 1,
-2.495306, 1.546518, 0.865707, 1, 0.04313726, 0, 1,
-2.483933, 1.657051, -1.984036, 1, 0.04705882, 0, 1,
-2.458545, 0.3221964, -1.289382, 1, 0.05490196, 0, 1,
-2.450475, -0.4576192, -1.957501, 1, 0.05882353, 0, 1,
-2.43027, -0.3966134, -2.046058, 1, 0.06666667, 0, 1,
-2.429673, -1.157854, -0.4921473, 1, 0.07058824, 0, 1,
-2.34811, 0.8178988, -2.186487, 1, 0.07843138, 0, 1,
-2.337463, -1.31645, -2.347229, 1, 0.08235294, 0, 1,
-2.301833, 0.2820118, -1.724596, 1, 0.09019608, 0, 1,
-2.196262, 0.5117323, -1.06124, 1, 0.09411765, 0, 1,
-2.183846, 1.393126, 0.2134453, 1, 0.1019608, 0, 1,
-2.172565, 0.1944079, -1.589712, 1, 0.1098039, 0, 1,
-2.10771, 0.7685844, -1.283818, 1, 0.1137255, 0, 1,
-2.088289, -2.071695, -1.518816, 1, 0.1215686, 0, 1,
-1.980224, 0.1817425, -2.167438, 1, 0.1254902, 0, 1,
-1.979725, 0.2324479, 0.09343763, 1, 0.1333333, 0, 1,
-1.974206, 1.808858, -0.7152209, 1, 0.1372549, 0, 1,
-1.973028, -1.458866, -2.612304, 1, 0.145098, 0, 1,
-1.972754, -0.2894399, -1.106178, 1, 0.1490196, 0, 1,
-1.961527, -0.6255174, -2.616918, 1, 0.1568628, 0, 1,
-1.956659, 0.6726978, -0.2497312, 1, 0.1607843, 0, 1,
-1.935036, 0.4724185, 0.9662, 1, 0.1686275, 0, 1,
-1.924562, 0.00154027, -2.584985, 1, 0.172549, 0, 1,
-1.917873, 0.6028089, -0.428583, 1, 0.1803922, 0, 1,
-1.892565, -0.9281714, -2.955185, 1, 0.1843137, 0, 1,
-1.890884, -3.977825, -2.570437, 1, 0.1921569, 0, 1,
-1.88599, -0.03830143, -1.647041, 1, 0.1960784, 0, 1,
-1.876726, 0.8660243, -0.6205341, 1, 0.2039216, 0, 1,
-1.874841, -1.449754, -3.094442, 1, 0.2117647, 0, 1,
-1.869109, 0.0499339, -0.8930002, 1, 0.2156863, 0, 1,
-1.861793, 0.005984111, -3.39145, 1, 0.2235294, 0, 1,
-1.856322, 0.609594, -0.7868193, 1, 0.227451, 0, 1,
-1.844085, -1.215551, -3.506271, 1, 0.2352941, 0, 1,
-1.820709, -1.532986, -2.218437, 1, 0.2392157, 0, 1,
-1.820105, -0.3467252, -3.078237, 1, 0.2470588, 0, 1,
-1.810422, 0.4214042, -1.507779, 1, 0.2509804, 0, 1,
-1.8053, -0.4829229, -1.241958, 1, 0.2588235, 0, 1,
-1.80461, 0.4071686, -1.628608, 1, 0.2627451, 0, 1,
-1.799866, -1.95811, -2.330267, 1, 0.2705882, 0, 1,
-1.762979, -0.7146063, -1.696428, 1, 0.2745098, 0, 1,
-1.751369, 0.3382244, -2.043843, 1, 0.282353, 0, 1,
-1.731856, 1.322056, -1.950057, 1, 0.2862745, 0, 1,
-1.731576, -0.6255547, -0.8988728, 1, 0.2941177, 0, 1,
-1.725745, -0.2168292, -2.426423, 1, 0.3019608, 0, 1,
-1.693361, 0.6322313, -1.398413, 1, 0.3058824, 0, 1,
-1.692678, 0.7050413, -2.151798, 1, 0.3137255, 0, 1,
-1.689623, -0.3475813, -2.428293, 1, 0.3176471, 0, 1,
-1.681763, 0.4629207, -1.884182, 1, 0.3254902, 0, 1,
-1.668346, -0.3463682, -1.246027, 1, 0.3294118, 0, 1,
-1.665868, -0.7631952, -1.610116, 1, 0.3372549, 0, 1,
-1.650935, -0.1609868, -3.456516, 1, 0.3411765, 0, 1,
-1.646436, -0.1992354, -1.664837, 1, 0.3490196, 0, 1,
-1.640541, -2.418409, -2.715832, 1, 0.3529412, 0, 1,
-1.604993, 0.6784604, -1.402795, 1, 0.3607843, 0, 1,
-1.595029, 1.088247, -0.8346689, 1, 0.3647059, 0, 1,
-1.580635, 0.1791703, -0.4323488, 1, 0.372549, 0, 1,
-1.573504, -0.7815225, -2.922202, 1, 0.3764706, 0, 1,
-1.568976, 0.5043473, 1.136018, 1, 0.3843137, 0, 1,
-1.568379, -0.5852802, -0.9855692, 1, 0.3882353, 0, 1,
-1.567728, 1.228208, -1.501815, 1, 0.3960784, 0, 1,
-1.564812, 1.474765, -1.34645, 1, 0.4039216, 0, 1,
-1.559015, 1.220494, -1.443152, 1, 0.4078431, 0, 1,
-1.546327, 0.3561898, -2.035297, 1, 0.4156863, 0, 1,
-1.540044, 0.7378162, -1.786942, 1, 0.4196078, 0, 1,
-1.536125, -0.6075205, -3.050831, 1, 0.427451, 0, 1,
-1.532599, -1.384691, -4.480264, 1, 0.4313726, 0, 1,
-1.530479, 0.7878059, -1.427252, 1, 0.4392157, 0, 1,
-1.519325, -1.282246, -2.139654, 1, 0.4431373, 0, 1,
-1.51223, -0.2393349, -1.514095, 1, 0.4509804, 0, 1,
-1.508795, 1.792646, -2.216126, 1, 0.454902, 0, 1,
-1.500831, -0.01875795, -1.894486, 1, 0.4627451, 0, 1,
-1.492023, 1.701742, 0.5489063, 1, 0.4666667, 0, 1,
-1.485469, -1.174614, -1.573586, 1, 0.4745098, 0, 1,
-1.483097, -0.7943836, -4.279784, 1, 0.4784314, 0, 1,
-1.469563, 0.2671679, -0.1832581, 1, 0.4862745, 0, 1,
-1.468462, -1.612685, -0.3623778, 1, 0.4901961, 0, 1,
-1.465501, -0.5596214, -0.9349198, 1, 0.4980392, 0, 1,
-1.453098, -2.028943, -2.461842, 1, 0.5058824, 0, 1,
-1.448028, 0.06902404, -2.705566, 1, 0.509804, 0, 1,
-1.436447, 1.144763, -1.056359, 1, 0.5176471, 0, 1,
-1.433322, -0.6505358, -2.631257, 1, 0.5215687, 0, 1,
-1.408231, 0.8803042, -1.252382, 1, 0.5294118, 0, 1,
-1.400524, 1.39234, -3.14896, 1, 0.5333334, 0, 1,
-1.39705, -2.162371, -1.839551, 1, 0.5411765, 0, 1,
-1.396122, 0.3103532, -2.778269, 1, 0.5450981, 0, 1,
-1.393623, 2.108519, -0.5961953, 1, 0.5529412, 0, 1,
-1.387041, 0.8717946, -0.23558, 1, 0.5568628, 0, 1,
-1.385768, 1.519864, -2.109567, 1, 0.5647059, 0, 1,
-1.384052, 0.9910879, -2.141776, 1, 0.5686275, 0, 1,
-1.370271, -1.227237, -1.981551, 1, 0.5764706, 0, 1,
-1.356438, 0.4274221, -1.595152, 1, 0.5803922, 0, 1,
-1.347284, -1.117383, -2.71989, 1, 0.5882353, 0, 1,
-1.346347, -1.780111, -1.765264, 1, 0.5921569, 0, 1,
-1.341736, 0.8605676, -3.054949, 1, 0.6, 0, 1,
-1.334679, -0.2605615, -3.090518, 1, 0.6078432, 0, 1,
-1.328344, 0.8739185, -2.082998, 1, 0.6117647, 0, 1,
-1.326946, -0.1862825, -2.939563, 1, 0.6196079, 0, 1,
-1.316214, 0.2120944, -0.5161737, 1, 0.6235294, 0, 1,
-1.315728, -0.9535624, -2.381975, 1, 0.6313726, 0, 1,
-1.305858, 3.329115, 2.207049, 1, 0.6352941, 0, 1,
-1.296198, -0.3453358, -2.812281, 1, 0.6431373, 0, 1,
-1.279762, 1.096663, 0.6203306, 1, 0.6470588, 0, 1,
-1.279532, -1.460113, -3.032833, 1, 0.654902, 0, 1,
-1.273877, -0.8935724, -1.445497, 1, 0.6588235, 0, 1,
-1.265369, -0.4541555, -2.502181, 1, 0.6666667, 0, 1,
-1.261583, 1.380439, -0.2027137, 1, 0.6705883, 0, 1,
-1.258864, 0.02787538, -3.292603, 1, 0.6784314, 0, 1,
-1.256288, 1.138803, -0.2250396, 1, 0.682353, 0, 1,
-1.251353, -1.351583, -3.59181, 1, 0.6901961, 0, 1,
-1.244683, 1.898162, 0.3147537, 1, 0.6941177, 0, 1,
-1.244651, 0.2911907, -1.571277, 1, 0.7019608, 0, 1,
-1.242724, -0.03799275, -0.2190084, 1, 0.7098039, 0, 1,
-1.240777, -0.3880114, -2.414147, 1, 0.7137255, 0, 1,
-1.235102, -1.441164, -2.400778, 1, 0.7215686, 0, 1,
-1.206765, 4.021019, -1.755625, 1, 0.7254902, 0, 1,
-1.203734, 0.1219215, -1.378158, 1, 0.7333333, 0, 1,
-1.202776, 0.3433409, -1.014287, 1, 0.7372549, 0, 1,
-1.198242, -2.276878, -3.264236, 1, 0.7450981, 0, 1,
-1.19656, 1.379446, -2.074759, 1, 0.7490196, 0, 1,
-1.195639, -0.9993463, -3.290868, 1, 0.7568628, 0, 1,
-1.195318, 1.013072, -1.898588, 1, 0.7607843, 0, 1,
-1.194158, -0.416831, -1.953098, 1, 0.7686275, 0, 1,
-1.192559, 2.315857, -0.4402923, 1, 0.772549, 0, 1,
-1.185, 2.289407, 0.3051728, 1, 0.7803922, 0, 1,
-1.184126, 1.245336, 0.4666978, 1, 0.7843137, 0, 1,
-1.181714, -0.3677259, -1.388712, 1, 0.7921569, 0, 1,
-1.17567, -0.1193796, -2.36469, 1, 0.7960784, 0, 1,
-1.169738, -1.137521, -4.701494, 1, 0.8039216, 0, 1,
-1.163316, 1.396402, -1.112545, 1, 0.8117647, 0, 1,
-1.155819, 1.167836, 0.9557132, 1, 0.8156863, 0, 1,
-1.152327, 0.935957, -1.289532, 1, 0.8235294, 0, 1,
-1.147135, -0.2233316, -0.1834135, 1, 0.827451, 0, 1,
-1.143606, -0.08176421, -3.431347, 1, 0.8352941, 0, 1,
-1.140247, 0.1643165, -2.320643, 1, 0.8392157, 0, 1,
-1.136564, -1.854543, -4.262947, 1, 0.8470588, 0, 1,
-1.129045, -0.9516134, -1.864035, 1, 0.8509804, 0, 1,
-1.120988, 2.244646, -2.590544, 1, 0.8588235, 0, 1,
-1.120692, -0.6535401, -1.662042, 1, 0.8627451, 0, 1,
-1.118315, -0.9191663, -3.240243, 1, 0.8705882, 0, 1,
-1.116014, -0.1155426, -1.2079, 1, 0.8745098, 0, 1,
-1.111654, 1.30219, -1.782295, 1, 0.8823529, 0, 1,
-1.104357, 0.04547162, -1.643007, 1, 0.8862745, 0, 1,
-1.102787, 0.3205683, -2.90938, 1, 0.8941177, 0, 1,
-1.101921, -0.4742969, -1.851828, 1, 0.8980392, 0, 1,
-1.099259, -1.173011, -2.34386, 1, 0.9058824, 0, 1,
-1.097028, 0.8360767, -0.4519328, 1, 0.9137255, 0, 1,
-1.090908, 0.4978989, 0.07472258, 1, 0.9176471, 0, 1,
-1.080284, 0.9543051, -0.6552554, 1, 0.9254902, 0, 1,
-1.071888, 1.289619, 0.899738, 1, 0.9294118, 0, 1,
-1.070875, 0.6963125, -2.546403, 1, 0.9372549, 0, 1,
-1.069074, -0.8423735, -1.282056, 1, 0.9411765, 0, 1,
-1.06199, -0.1576544, -3.100695, 1, 0.9490196, 0, 1,
-1.061872, 0.4896249, -1.348172, 1, 0.9529412, 0, 1,
-1.058582, 1.248245, -0.163719, 1, 0.9607843, 0, 1,
-1.056132, 0.7800392, 0.1986538, 1, 0.9647059, 0, 1,
-1.039292, -0.1299347, -1.335261, 1, 0.972549, 0, 1,
-1.039182, 0.5848867, -1.332547, 1, 0.9764706, 0, 1,
-1.024789, 0.4397196, 0.2131054, 1, 0.9843137, 0, 1,
-1.007106, 1.171202, -1.653111, 1, 0.9882353, 0, 1,
-1.001957, 0.9864875, -0.7069991, 1, 0.9960784, 0, 1,
-1.00013, 2.302241, -1.277858, 0.9960784, 1, 0, 1,
-0.9980771, 1.606902, 0.2309927, 0.9921569, 1, 0, 1,
-0.9945932, -1.593827, -3.684785, 0.9843137, 1, 0, 1,
-0.9870567, 0.2810076, -2.542951, 0.9803922, 1, 0, 1,
-0.9780245, 0.6370757, 0.2510131, 0.972549, 1, 0, 1,
-0.9706478, 1.223542, 0.6955169, 0.9686275, 1, 0, 1,
-0.9654737, 1.423996, 1.132394, 0.9607843, 1, 0, 1,
-0.963818, 2.238249, -0.4684673, 0.9568627, 1, 0, 1,
-0.9602797, 1.090212, -2.794148, 0.9490196, 1, 0, 1,
-0.9557931, -0.7841684, -3.446602, 0.945098, 1, 0, 1,
-0.9545938, 1.189935, -1.553694, 0.9372549, 1, 0, 1,
-0.941016, 0.2190224, -2.455226, 0.9333333, 1, 0, 1,
-0.9286362, 0.4605219, -1.284399, 0.9254902, 1, 0, 1,
-0.9285385, 0.7969115, -0.1404141, 0.9215686, 1, 0, 1,
-0.9278582, 2.545851, -1.219391, 0.9137255, 1, 0, 1,
-0.9243688, -0.05766713, -0.8352164, 0.9098039, 1, 0, 1,
-0.9222462, 0.4194003, -0.9419809, 0.9019608, 1, 0, 1,
-0.9025949, -0.1978467, -2.458799, 0.8941177, 1, 0, 1,
-0.9018583, 0.843355, -1.489767, 0.8901961, 1, 0, 1,
-0.897163, -0.8154991, -0.3647522, 0.8823529, 1, 0, 1,
-0.8930015, -0.1414004, -1.903026, 0.8784314, 1, 0, 1,
-0.89216, 0.4907255, -0.6179713, 0.8705882, 1, 0, 1,
-0.8915946, 1.195322, -0.4717161, 0.8666667, 1, 0, 1,
-0.8868619, -0.4871495, -2.901351, 0.8588235, 1, 0, 1,
-0.8864334, 1.259126, -0.9085749, 0.854902, 1, 0, 1,
-0.8834826, -0.1357689, -1.925866, 0.8470588, 1, 0, 1,
-0.8642609, -0.5905578, 0.05670364, 0.8431373, 1, 0, 1,
-0.8642103, -0.2941766, -3.493355, 0.8352941, 1, 0, 1,
-0.8622556, -0.4471943, -1.969268, 0.8313726, 1, 0, 1,
-0.8549801, 0.1234187, -1.507365, 0.8235294, 1, 0, 1,
-0.8356493, -0.3441818, -2.589676, 0.8196079, 1, 0, 1,
-0.8182366, 1.234218, -1.12064, 0.8117647, 1, 0, 1,
-0.8083745, -1.321942, -0.9890187, 0.8078431, 1, 0, 1,
-0.8050582, 2.7223, 0.7376336, 0.8, 1, 0, 1,
-0.8023259, -0.8050596, -2.918156, 0.7921569, 1, 0, 1,
-0.8020138, -1.130804, -1.982432, 0.7882353, 1, 0, 1,
-0.7906399, -0.4521834, -2.855878, 0.7803922, 1, 0, 1,
-0.7859442, 2.59458, -1.072764, 0.7764706, 1, 0, 1,
-0.785389, 1.878027, 1.007187, 0.7686275, 1, 0, 1,
-0.7852759, -0.8649336, -2.092191, 0.7647059, 1, 0, 1,
-0.7825685, -0.7479682, -1.422437, 0.7568628, 1, 0, 1,
-0.7824637, -1.025103, -4.79692, 0.7529412, 1, 0, 1,
-0.7818936, 0.5213622, -1.697114, 0.7450981, 1, 0, 1,
-0.7814831, -1.007938, -2.128274, 0.7411765, 1, 0, 1,
-0.7792935, 0.2697612, -1.455732, 0.7333333, 1, 0, 1,
-0.7734038, -1.119942, -2.258132, 0.7294118, 1, 0, 1,
-0.7681646, -1.522732, -3.071507, 0.7215686, 1, 0, 1,
-0.7648598, -0.1969247, -1.01948, 0.7176471, 1, 0, 1,
-0.7638541, -0.1899705, 0.3256241, 0.7098039, 1, 0, 1,
-0.7591877, -0.6172519, -2.115589, 0.7058824, 1, 0, 1,
-0.7541518, -1.31117, -2.918565, 0.6980392, 1, 0, 1,
-0.7521867, 0.6524374, -0.02748357, 0.6901961, 1, 0, 1,
-0.7493365, -0.1750095, -0.9047058, 0.6862745, 1, 0, 1,
-0.7449937, -0.2904483, -0.4765778, 0.6784314, 1, 0, 1,
-0.7443883, -1.122694, -4.017773, 0.6745098, 1, 0, 1,
-0.742193, -1.173541, -4.490764, 0.6666667, 1, 0, 1,
-0.7404385, 1.262407, -0.4679466, 0.6627451, 1, 0, 1,
-0.7391156, 0.5542028, -0.5645271, 0.654902, 1, 0, 1,
-0.7383037, 0.7176837, -0.5653731, 0.6509804, 1, 0, 1,
-0.7378013, -0.143807, -3.172395, 0.6431373, 1, 0, 1,
-0.7329972, 1.182682, 0.005983943, 0.6392157, 1, 0, 1,
-0.7322153, -0.1617326, -1.570611, 0.6313726, 1, 0, 1,
-0.7321604, -0.7127219, -1.632494, 0.627451, 1, 0, 1,
-0.7275853, -0.9815379, -2.117611, 0.6196079, 1, 0, 1,
-0.7223729, 0.8795136, -0.8604422, 0.6156863, 1, 0, 1,
-0.7202184, -0.1297419, -1.967464, 0.6078432, 1, 0, 1,
-0.7199878, 0.7556139, 1.058214, 0.6039216, 1, 0, 1,
-0.7164865, 0.8155653, -1.525788, 0.5960785, 1, 0, 1,
-0.7125089, -1.789819, -2.79557, 0.5882353, 1, 0, 1,
-0.7077157, -0.396677, -1.853259, 0.5843138, 1, 0, 1,
-0.6984863, -2.022615, -2.416113, 0.5764706, 1, 0, 1,
-0.6937228, -1.527373, -3.076866, 0.572549, 1, 0, 1,
-0.6730807, 0.8625517, 0.7323879, 0.5647059, 1, 0, 1,
-0.6663155, -0.8963693, -4.351974, 0.5607843, 1, 0, 1,
-0.6627649, 0.983824, -0.7471989, 0.5529412, 1, 0, 1,
-0.6627277, -0.2346471, -1.155083, 0.5490196, 1, 0, 1,
-0.6607348, -0.956645, -2.917695, 0.5411765, 1, 0, 1,
-0.6591582, 0.6986494, -1.483674, 0.5372549, 1, 0, 1,
-0.6572269, -1.138712, -3.105199, 0.5294118, 1, 0, 1,
-0.6520682, 0.1600072, -1.034746, 0.5254902, 1, 0, 1,
-0.6483408, -1.284982, -3.210056, 0.5176471, 1, 0, 1,
-0.6463821, -1.098788, -1.96133, 0.5137255, 1, 0, 1,
-0.6447909, -0.4289246, -1.906645, 0.5058824, 1, 0, 1,
-0.6437719, 0.7060673, 0.5951005, 0.5019608, 1, 0, 1,
-0.6427025, -1.259439, -2.358635, 0.4941176, 1, 0, 1,
-0.6409307, 0.3355117, -1.236958, 0.4862745, 1, 0, 1,
-0.6373544, 0.4680048, -1.497879, 0.4823529, 1, 0, 1,
-0.6312394, -0.4679874, -1.681497, 0.4745098, 1, 0, 1,
-0.6293059, -0.05694713, -1.643576, 0.4705882, 1, 0, 1,
-0.6244897, -1.367484, -1.589231, 0.4627451, 1, 0, 1,
-0.6185143, 0.2178199, -2.112499, 0.4588235, 1, 0, 1,
-0.6160561, -0.2080703, -1.705056, 0.4509804, 1, 0, 1,
-0.6135504, -0.07077517, -2.002721, 0.4470588, 1, 0, 1,
-0.6105285, -0.8677024, -2.895134, 0.4392157, 1, 0, 1,
-0.6092919, 0.9675314, -2.174325, 0.4352941, 1, 0, 1,
-0.603381, 1.28723, 0.4690227, 0.427451, 1, 0, 1,
-0.5975053, -0.5258325, -1.72071, 0.4235294, 1, 0, 1,
-0.5961607, 1.259842, -0.7496386, 0.4156863, 1, 0, 1,
-0.5949211, -0.8897817, -2.983455, 0.4117647, 1, 0, 1,
-0.5886185, -0.8010759, -3.884878, 0.4039216, 1, 0, 1,
-0.5879804, 0.2257563, -0.5649788, 0.3960784, 1, 0, 1,
-0.5844276, 0.140071, -0.797911, 0.3921569, 1, 0, 1,
-0.5799354, 0.02285439, -0.2124077, 0.3843137, 1, 0, 1,
-0.5798851, -0.2316475, -1.252112, 0.3803922, 1, 0, 1,
-0.5784075, -0.7013876, -3.555355, 0.372549, 1, 0, 1,
-0.576134, 0.3180157, -4.123892, 0.3686275, 1, 0, 1,
-0.5741613, 1.151305, 0.4230372, 0.3607843, 1, 0, 1,
-0.5735942, 0.2327854, -3.269002, 0.3568628, 1, 0, 1,
-0.5725908, 0.2728515, -1.482543, 0.3490196, 1, 0, 1,
-0.5678428, -1.894713, -2.537974, 0.345098, 1, 0, 1,
-0.5653198, 0.8471163, 0.1636784, 0.3372549, 1, 0, 1,
-0.5652898, -1.454619, -2.964637, 0.3333333, 1, 0, 1,
-0.5638185, -2.142546, -3.501385, 0.3254902, 1, 0, 1,
-0.5607597, -0.1035311, -3.823476, 0.3215686, 1, 0, 1,
-0.5573055, 0.2674319, -0.3729678, 0.3137255, 1, 0, 1,
-0.5539923, 1.617912, -0.627528, 0.3098039, 1, 0, 1,
-0.5532055, -0.9455558, -2.417036, 0.3019608, 1, 0, 1,
-0.5502762, -0.2264124, -1.910033, 0.2941177, 1, 0, 1,
-0.5501581, 2.668675, 2.00409, 0.2901961, 1, 0, 1,
-0.5490197, -0.4558613, -1.398968, 0.282353, 1, 0, 1,
-0.5466527, 2.024137, -0.775517, 0.2784314, 1, 0, 1,
-0.5455319, 0.738919, 0.01684806, 0.2705882, 1, 0, 1,
-0.5426068, 0.2517501, -1.650608, 0.2666667, 1, 0, 1,
-0.5381534, 0.1922409, -1.491314, 0.2588235, 1, 0, 1,
-0.5368294, -0.8842317, -1.936132, 0.254902, 1, 0, 1,
-0.5355937, 0.05077577, -2.030174, 0.2470588, 1, 0, 1,
-0.5278235, -1.460915, -1.420516, 0.2431373, 1, 0, 1,
-0.525696, 0.4050324, -0.09373089, 0.2352941, 1, 0, 1,
-0.5236191, -1.392139, -3.577001, 0.2313726, 1, 0, 1,
-0.5230563, 0.03880037, -1.317324, 0.2235294, 1, 0, 1,
-0.5224036, 0.4078825, -0.593856, 0.2196078, 1, 0, 1,
-0.5213637, 0.8678294, 0.2867561, 0.2117647, 1, 0, 1,
-0.5192676, 1.101063, -1.506066, 0.2078431, 1, 0, 1,
-0.5184696, 0.3204528, -1.431194, 0.2, 1, 0, 1,
-0.5184588, 0.06729356, -1.328273, 0.1921569, 1, 0, 1,
-0.5169932, -0.4161987, -2.914647, 0.1882353, 1, 0, 1,
-0.5157164, -1.47184, -2.209667, 0.1803922, 1, 0, 1,
-0.5153311, -0.5163801, -2.28831, 0.1764706, 1, 0, 1,
-0.5152482, 0.4447666, -0.2897357, 0.1686275, 1, 0, 1,
-0.5151051, -0.8872914, -3.479214, 0.1647059, 1, 0, 1,
-0.5130531, 1.871309, -0.384506, 0.1568628, 1, 0, 1,
-0.5129122, 0.7263036, -1.578454, 0.1529412, 1, 0, 1,
-0.5088198, 0.2147881, -0.4191467, 0.145098, 1, 0, 1,
-0.5055873, 1.128624, 0.5353345, 0.1411765, 1, 0, 1,
-0.5050685, 0.5863537, -0.3551899, 0.1333333, 1, 0, 1,
-0.5043451, -0.7654693, -3.911289, 0.1294118, 1, 0, 1,
-0.50356, -0.9805621, -3.449153, 0.1215686, 1, 0, 1,
-0.5000806, 0.1325289, -0.5778899, 0.1176471, 1, 0, 1,
-0.4995223, 0.2703013, -1.180761, 0.1098039, 1, 0, 1,
-0.4968104, 2.130585, -0.1917717, 0.1058824, 1, 0, 1,
-0.4965854, 0.303731, -2.15782, 0.09803922, 1, 0, 1,
-0.4956438, -0.4313712, -3.568276, 0.09019608, 1, 0, 1,
-0.4929576, 0.5716866, -1.260532, 0.08627451, 1, 0, 1,
-0.4802765, 0.9991134, -0.03454206, 0.07843138, 1, 0, 1,
-0.4719153, 0.3262476, -1.333097, 0.07450981, 1, 0, 1,
-0.4706073, 0.09614121, -1.461509, 0.06666667, 1, 0, 1,
-0.4680492, 1.034814, 0.2620846, 0.0627451, 1, 0, 1,
-0.4676196, -0.3708359, -3.180487, 0.05490196, 1, 0, 1,
-0.4667853, -2.050563, -2.560758, 0.05098039, 1, 0, 1,
-0.4625295, -1.339056, -2.625962, 0.04313726, 1, 0, 1,
-0.4586985, -0.04392691, -1.855458, 0.03921569, 1, 0, 1,
-0.4526724, 1.24231, 0.2008601, 0.03137255, 1, 0, 1,
-0.4521931, 0.06126113, 0.3297423, 0.02745098, 1, 0, 1,
-0.4467156, -0.6671027, -2.809039, 0.01960784, 1, 0, 1,
-0.4429349, -1.264973, -2.425485, 0.01568628, 1, 0, 1,
-0.4348931, 0.986757, -2.349805, 0.007843138, 1, 0, 1,
-0.4323262, 0.1544505, -1.774566, 0.003921569, 1, 0, 1,
-0.4289962, 2.051636, -0.1996731, 0, 1, 0.003921569, 1,
-0.4217159, 0.7132198, -1.475061, 0, 1, 0.01176471, 1,
-0.4188384, 0.3940691, -0.5413901, 0, 1, 0.01568628, 1,
-0.41802, 1.755376, 0.6905358, 0, 1, 0.02352941, 1,
-0.4162259, 0.7653419, -1.071519, 0, 1, 0.02745098, 1,
-0.4153115, 0.2444776, -1.787767, 0, 1, 0.03529412, 1,
-0.4140258, 0.5841462, 0.08019254, 0, 1, 0.03921569, 1,
-0.4082164, -1.122673, -3.072826, 0, 1, 0.04705882, 1,
-0.4017881, -1.632379, -2.276798, 0, 1, 0.05098039, 1,
-0.3980143, -0.02758246, -2.859063, 0, 1, 0.05882353, 1,
-0.39062, 0.2994367, -1.421806, 0, 1, 0.0627451, 1,
-0.3868863, -0.7753692, -3.111346, 0, 1, 0.07058824, 1,
-0.3853925, -0.3936827, -2.885978, 0, 1, 0.07450981, 1,
-0.3814877, -2.161076, -3.588079, 0, 1, 0.08235294, 1,
-0.3806023, -0.7927158, -4.072734, 0, 1, 0.08627451, 1,
-0.3801103, 0.3356102, -2.226469, 0, 1, 0.09411765, 1,
-0.3778694, 0.782333, -0.8962964, 0, 1, 0.1019608, 1,
-0.376796, 0.7398603, 1.245521, 0, 1, 0.1058824, 1,
-0.3711711, -0.8932466, -3.726579, 0, 1, 0.1137255, 1,
-0.3700173, 1.378099, -0.9893238, 0, 1, 0.1176471, 1,
-0.3663014, -1.285111, -2.339378, 0, 1, 0.1254902, 1,
-0.3657023, -0.4867963, -5.137112, 0, 1, 0.1294118, 1,
-0.3649569, 0.634465, 1.101753, 0, 1, 0.1372549, 1,
-0.3572542, -0.408838, -1.358855, 0, 1, 0.1411765, 1,
-0.3553979, 0.165327, -0.5930438, 0, 1, 0.1490196, 1,
-0.3537998, -2.015862, -4.748182, 0, 1, 0.1529412, 1,
-0.3402134, 0.04579232, -1.48641, 0, 1, 0.1607843, 1,
-0.3389071, 1.306996, -0.1001171, 0, 1, 0.1647059, 1,
-0.3361914, 0.964104, -0.6654202, 0, 1, 0.172549, 1,
-0.3359671, -0.820833, -3.921224, 0, 1, 0.1764706, 1,
-0.3340807, -0.5170915, -1.736746, 0, 1, 0.1843137, 1,
-0.3340786, 0.01448178, -0.7999511, 0, 1, 0.1882353, 1,
-0.3327117, 0.2096285, 0.3019893, 0, 1, 0.1960784, 1,
-0.3284367, -1.635225, -2.954739, 0, 1, 0.2039216, 1,
-0.3269479, 1.269047, 0.2999268, 0, 1, 0.2078431, 1,
-0.3269439, 0.7074075, -0.4150201, 0, 1, 0.2156863, 1,
-0.3266158, 0.2075205, -0.5094526, 0, 1, 0.2196078, 1,
-0.3218192, 0.7258441, 0.2124533, 0, 1, 0.227451, 1,
-0.3207384, -0.2270242, -1.110316, 0, 1, 0.2313726, 1,
-0.3177263, 0.3609326, -0.7083084, 0, 1, 0.2392157, 1,
-0.3116238, 0.6583826, -0.05670185, 0, 1, 0.2431373, 1,
-0.3092894, 1.786693, 0.7437569, 0, 1, 0.2509804, 1,
-0.3081001, 0.2540138, -1.088986, 0, 1, 0.254902, 1,
-0.3073465, 1.15001, 1.249054, 0, 1, 0.2627451, 1,
-0.3064838, 1.310386, -0.3971529, 0, 1, 0.2666667, 1,
-0.3061758, 0.204614, 0.3344046, 0, 1, 0.2745098, 1,
-0.3061272, 0.6316409, -0.6430505, 0, 1, 0.2784314, 1,
-0.3050654, 1.19881, 0.5494883, 0, 1, 0.2862745, 1,
-0.300762, 1.158603, -0.4241194, 0, 1, 0.2901961, 1,
-0.2994731, -0.7639527, -4.886509, 0, 1, 0.2980392, 1,
-0.2973789, -0.05799682, -1.697626, 0, 1, 0.3058824, 1,
-0.2945317, 1.526726, -2.58262, 0, 1, 0.3098039, 1,
-0.2886548, -0.3832375, -3.815425, 0, 1, 0.3176471, 1,
-0.2863582, 0.7482257, -1.696657, 0, 1, 0.3215686, 1,
-0.2857832, 0.6635713, -0.4650366, 0, 1, 0.3294118, 1,
-0.28242, 0.1512737, -2.764917, 0, 1, 0.3333333, 1,
-0.282347, -1.449645, -1.521108, 0, 1, 0.3411765, 1,
-0.2766855, 1.423721, -0.6377537, 0, 1, 0.345098, 1,
-0.2742418, -0.2381511, -3.470707, 0, 1, 0.3529412, 1,
-0.2736573, 0.3517278, -1.683195, 0, 1, 0.3568628, 1,
-0.2708337, -0.4391696, -3.666108, 0, 1, 0.3647059, 1,
-0.2683534, 0.2672847, -1.404893, 0, 1, 0.3686275, 1,
-0.2674348, -0.2583749, -3.146718, 0, 1, 0.3764706, 1,
-0.2635274, 0.3859464, -2.226503, 0, 1, 0.3803922, 1,
-0.2606992, -1.199394, -3.504557, 0, 1, 0.3882353, 1,
-0.2581534, 0.01969638, 0.3233852, 0, 1, 0.3921569, 1,
-0.2563977, 1.662096, 0.6060439, 0, 1, 0.4, 1,
-0.2562424, -1.193484, -1.971325, 0, 1, 0.4078431, 1,
-0.2551435, 0.01163069, -3.501425, 0, 1, 0.4117647, 1,
-0.2549288, -1.394691, -2.906518, 0, 1, 0.4196078, 1,
-0.2537621, 1.849794, -0.9436359, 0, 1, 0.4235294, 1,
-0.2534875, 0.3171676, 0.1140705, 0, 1, 0.4313726, 1,
-0.252382, -0.3956503, -2.059081, 0, 1, 0.4352941, 1,
-0.2519185, 1.445581, -0.1933197, 0, 1, 0.4431373, 1,
-0.2517652, 0.3169525, -0.6920488, 0, 1, 0.4470588, 1,
-0.2510209, 2.219707, -1.934784, 0, 1, 0.454902, 1,
-0.2472364, -0.8288601, -2.597544, 0, 1, 0.4588235, 1,
-0.2444497, 1.772441, -2.02443, 0, 1, 0.4666667, 1,
-0.2393962, 0.9441287, -1.012743, 0, 1, 0.4705882, 1,
-0.2383704, -0.05873726, -2.242601, 0, 1, 0.4784314, 1,
-0.2383672, -0.1206403, -0.8424375, 0, 1, 0.4823529, 1,
-0.2361637, 0.9719768, 0.3911501, 0, 1, 0.4901961, 1,
-0.2359076, -0.8349669, -3.003097, 0, 1, 0.4941176, 1,
-0.2331513, -0.4871541, -4.290632, 0, 1, 0.5019608, 1,
-0.2302007, 0.1233905, -1.802783, 0, 1, 0.509804, 1,
-0.2279558, 0.06899799, -0.4855808, 0, 1, 0.5137255, 1,
-0.2271373, 0.2426674, 1.853972, 0, 1, 0.5215687, 1,
-0.2260024, -0.7406917, -3.921225, 0, 1, 0.5254902, 1,
-0.2197122, 0.3433431, -1.335007, 0, 1, 0.5333334, 1,
-0.2170334, -1.925608, -3.482196, 0, 1, 0.5372549, 1,
-0.2165628, 0.4925728, 0.2949008, 0, 1, 0.5450981, 1,
-0.2152158, -1.747147, -4.99352, 0, 1, 0.5490196, 1,
-0.2145542, -0.6657807, -2.746365, 0, 1, 0.5568628, 1,
-0.2144907, 0.4635934, -0.8709301, 0, 1, 0.5607843, 1,
-0.2114174, -0.3719171, -1.975315, 0, 1, 0.5686275, 1,
-0.2111497, -0.282575, -2.678882, 0, 1, 0.572549, 1,
-0.2101777, 0.2698556, 0.2658131, 0, 1, 0.5803922, 1,
-0.2060323, -1.543877, -4.08823, 0, 1, 0.5843138, 1,
-0.2054881, -0.6982659, -3.127472, 0, 1, 0.5921569, 1,
-0.2052961, -0.5413454, -2.327556, 0, 1, 0.5960785, 1,
-0.2021718, 0.6046636, -0.06640191, 0, 1, 0.6039216, 1,
-0.2008455, -1.425016, -2.816897, 0, 1, 0.6117647, 1,
-0.2001386, 0.05954266, -2.398741, 0, 1, 0.6156863, 1,
-0.1986059, -1.107499, -3.954756, 0, 1, 0.6235294, 1,
-0.1954774, 2.448887, 1.341001, 0, 1, 0.627451, 1,
-0.194859, -1.106837, -4.476005, 0, 1, 0.6352941, 1,
-0.1925112, -0.2869597, -3.059506, 0, 1, 0.6392157, 1,
-0.1911682, 0.351696, 0.7303981, 0, 1, 0.6470588, 1,
-0.1880337, -0.4027117, -1.430021, 0, 1, 0.6509804, 1,
-0.1879972, -0.2199609, 0.7498, 0, 1, 0.6588235, 1,
-0.184582, 0.7145822, 1.058452, 0, 1, 0.6627451, 1,
-0.1791523, -1.980251, -1.670657, 0, 1, 0.6705883, 1,
-0.1773123, -0.7281563, -2.552987, 0, 1, 0.6745098, 1,
-0.1730159, 1.397812, -2.399103, 0, 1, 0.682353, 1,
-0.1714725, -0.382207, -1.865691, 0, 1, 0.6862745, 1,
-0.1620095, 0.8531008, -1.340524, 0, 1, 0.6941177, 1,
-0.1616329, -0.5050157, -3.155929, 0, 1, 0.7019608, 1,
-0.1611762, -0.8309433, -1.898367, 0, 1, 0.7058824, 1,
-0.1567403, 1.602834, 0.1016258, 0, 1, 0.7137255, 1,
-0.1520723, -0.1531566, -3.160691, 0, 1, 0.7176471, 1,
-0.1487944, -0.05484202, -0.9683455, 0, 1, 0.7254902, 1,
-0.1458181, 0.06395047, -0.6723263, 0, 1, 0.7294118, 1,
-0.1455013, 0.000361072, -0.9809881, 0, 1, 0.7372549, 1,
-0.144166, -1.426327, -2.959805, 0, 1, 0.7411765, 1,
-0.1355615, -0.5434338, -2.570749, 0, 1, 0.7490196, 1,
-0.1330675, -0.1125702, -3.093253, 0, 1, 0.7529412, 1,
-0.1327629, -0.507093, -1.865696, 0, 1, 0.7607843, 1,
-0.1235993, -1.256349, -2.099669, 0, 1, 0.7647059, 1,
-0.1231749, 1.536182, -0.8946599, 0, 1, 0.772549, 1,
-0.1215218, 1.063767, 0.6190997, 0, 1, 0.7764706, 1,
-0.1200663, 0.08398181, -0.2737904, 0, 1, 0.7843137, 1,
-0.1188506, 0.9552861, -0.4420954, 0, 1, 0.7882353, 1,
-0.1145815, 0.6100721, 0.1269853, 0, 1, 0.7960784, 1,
-0.1143009, -0.8018584, -0.997897, 0, 1, 0.8039216, 1,
-0.1098972, 1.491637, -0.0616647, 0, 1, 0.8078431, 1,
-0.1097947, -0.1292342, -4.504579, 0, 1, 0.8156863, 1,
-0.1094452, 1.115462, 0.4478997, 0, 1, 0.8196079, 1,
-0.1045262, 0.5419379, 1.268763, 0, 1, 0.827451, 1,
-0.104488, -1.184172, -2.025611, 0, 1, 0.8313726, 1,
-0.1037335, 0.2074257, -0.9458061, 0, 1, 0.8392157, 1,
-0.1008871, -0.9392004, -3.899395, 0, 1, 0.8431373, 1,
-0.09800936, -1.076197, -2.146061, 0, 1, 0.8509804, 1,
-0.09553341, -0.184991, -2.006523, 0, 1, 0.854902, 1,
-0.08949175, -0.5658852, -3.784415, 0, 1, 0.8627451, 1,
-0.08927768, 0.2575685, -0.362715, 0, 1, 0.8666667, 1,
-0.08912122, -1.340907, -4.430312, 0, 1, 0.8745098, 1,
-0.08900972, -1.640138, -3.10582, 0, 1, 0.8784314, 1,
-0.08878671, -0.6991832, -2.805218, 0, 1, 0.8862745, 1,
-0.08810081, 0.06421121, -0.3183858, 0, 1, 0.8901961, 1,
-0.08737709, 0.9516349, 1.889601, 0, 1, 0.8980392, 1,
-0.08600295, 0.5104889, 0.1667987, 0, 1, 0.9058824, 1,
-0.08526207, -0.3609628, -3.417552, 0, 1, 0.9098039, 1,
-0.0832094, -0.1388835, -2.110409, 0, 1, 0.9176471, 1,
-0.08299766, -0.2349108, -1.355069, 0, 1, 0.9215686, 1,
-0.07970077, -0.1127896, -0.6811089, 0, 1, 0.9294118, 1,
-0.0795847, 0.349556, -1.589875, 0, 1, 0.9333333, 1,
-0.07865393, -0.2075577, -2.199485, 0, 1, 0.9411765, 1,
-0.07792176, 0.1573874, -0.1610529, 0, 1, 0.945098, 1,
-0.07635204, -1.179232, -3.93904, 0, 1, 0.9529412, 1,
-0.07287729, -1.704778, -1.870155, 0, 1, 0.9568627, 1,
-0.07185422, 0.1709312, 0.8699664, 0, 1, 0.9647059, 1,
-0.06947312, 0.2293321, 0.07899135, 0, 1, 0.9686275, 1,
-0.06932689, 1.988421, 0.08352913, 0, 1, 0.9764706, 1,
-0.06618622, 0.8261406, 1.260085, 0, 1, 0.9803922, 1,
-0.06272274, 0.1147641, -0.6003925, 0, 1, 0.9882353, 1,
-0.06093055, 1.608503, -0.8374023, 0, 1, 0.9921569, 1,
-0.05778879, -0.8155607, -3.220975, 0, 1, 1, 1,
-0.05645576, -1.283688, -1.654369, 0, 0.9921569, 1, 1,
-0.05485089, -0.8116121, -2.531292, 0, 0.9882353, 1, 1,
-0.05219842, -0.1847456, -1.880579, 0, 0.9803922, 1, 1,
-0.05162178, -0.466624, -3.139778, 0, 0.9764706, 1, 1,
-0.0499226, 0.2637595, -2.40606, 0, 0.9686275, 1, 1,
-0.04926159, 0.3004614, -0.2479686, 0, 0.9647059, 1, 1,
-0.04062334, 2.217746, -0.5151056, 0, 0.9568627, 1, 1,
-0.03757045, -0.7953199, -4.813286, 0, 0.9529412, 1, 1,
-0.03402738, 0.5084043, -0.9327642, 0, 0.945098, 1, 1,
-0.03334272, 0.5142609, -1.853636, 0, 0.9411765, 1, 1,
-0.032882, -0.2491912, -3.3056, 0, 0.9333333, 1, 1,
-0.02689137, 1.161633, -0.1696015, 0, 0.9294118, 1, 1,
-0.02508175, -1.436055, -2.995988, 0, 0.9215686, 1, 1,
-0.02280266, -1.853066, -3.589303, 0, 0.9176471, 1, 1,
-0.02158688, -1.968976, -2.478289, 0, 0.9098039, 1, 1,
-0.01332823, 0.595723, 0.9531804, 0, 0.9058824, 1, 1,
-0.01323992, 1.56575, -0.934192, 0, 0.8980392, 1, 1,
-0.01190639, 1.085237, 1.4293, 0, 0.8901961, 1, 1,
-0.01166582, 1.339158, 0.4697899, 0, 0.8862745, 1, 1,
-0.01101985, -0.4797511, -3.712929, 0, 0.8784314, 1, 1,
-0.009687332, 0.6861308, -0.5510827, 0, 0.8745098, 1, 1,
-0.007635341, -0.5461349, -2.848938, 0, 0.8666667, 1, 1,
-0.003553035, 0.1634258, 1.441123, 0, 0.8627451, 1, 1,
-0.0003567743, 2.53956, -1.761022, 0, 0.854902, 1, 1,
0.0005736166, 0.2077837, 0.98208, 0, 0.8509804, 1, 1,
0.0009112803, -1.085565, 2.859705, 0, 0.8431373, 1, 1,
0.001678826, -0.2823695, 4.332941, 0, 0.8392157, 1, 1,
0.008036174, -0.9355218, 4.166651, 0, 0.8313726, 1, 1,
0.008885805, -0.3027709, 5.03449, 0, 0.827451, 1, 1,
0.009181858, -1.659278, 3.960568, 0, 0.8196079, 1, 1,
0.01043225, -1.672838, 4.276238, 0, 0.8156863, 1, 1,
0.01118408, 0.965938, 2.518474, 0, 0.8078431, 1, 1,
0.01129097, 0.07840844, -0.9317837, 0, 0.8039216, 1, 1,
0.01227404, 1.62679, -0.1398242, 0, 0.7960784, 1, 1,
0.01300654, -1.295916, 1.066237, 0, 0.7882353, 1, 1,
0.01847423, 0.7647895, 1.170904, 0, 0.7843137, 1, 1,
0.01946762, -0.3250999, 0.7340291, 0, 0.7764706, 1, 1,
0.0209171, -1.921989, 2.249365, 0, 0.772549, 1, 1,
0.02156813, 0.3579642, -0.1376977, 0, 0.7647059, 1, 1,
0.02412335, 0.04063112, -0.2115251, 0, 0.7607843, 1, 1,
0.02471286, 1.468562, 0.5804195, 0, 0.7529412, 1, 1,
0.02531089, -0.638227, 4.611978, 0, 0.7490196, 1, 1,
0.02842143, -0.5779685, 4.741608, 0, 0.7411765, 1, 1,
0.03214252, 0.9263495, 0.741065, 0, 0.7372549, 1, 1,
0.03338506, 0.5611287, -1.380705, 0, 0.7294118, 1, 1,
0.0336308, -0.4604171, 1.319729, 0, 0.7254902, 1, 1,
0.03701559, -1.020004, 3.370771, 0, 0.7176471, 1, 1,
0.03705964, 2.053228, 2.476579, 0, 0.7137255, 1, 1,
0.0395187, -0.6577294, 2.985918, 0, 0.7058824, 1, 1,
0.04126862, 0.5847143, 0.04522895, 0, 0.6980392, 1, 1,
0.04237473, 0.6743984, -0.4987096, 0, 0.6941177, 1, 1,
0.04254802, 0.8936458, -0.444752, 0, 0.6862745, 1, 1,
0.04274907, 1.031839, 1.933788, 0, 0.682353, 1, 1,
0.04374323, 0.02568348, -0.1695097, 0, 0.6745098, 1, 1,
0.04408499, -1.062803, 2.768089, 0, 0.6705883, 1, 1,
0.04573969, 0.8495049, -1.254581, 0, 0.6627451, 1, 1,
0.04628027, -0.8534441, 1.91342, 0, 0.6588235, 1, 1,
0.0522143, -0.4568471, 2.60104, 0, 0.6509804, 1, 1,
0.0572128, 1.020809, -0.4036837, 0, 0.6470588, 1, 1,
0.05774958, -1.629068, 2.052987, 0, 0.6392157, 1, 1,
0.0618874, 0.4387759, 1.213764, 0, 0.6352941, 1, 1,
0.06286059, 0.1300628, 0.8698827, 0, 0.627451, 1, 1,
0.06537524, -1.805537, 4.93443, 0, 0.6235294, 1, 1,
0.06654438, -0.649492, 2.42238, 0, 0.6156863, 1, 1,
0.06932907, 0.766287, -0.8458036, 0, 0.6117647, 1, 1,
0.06993391, 2.336756, 1.390685, 0, 0.6039216, 1, 1,
0.07878626, -0.1874681, 4.450304, 0, 0.5960785, 1, 1,
0.07978794, -0.1035096, 4.701366, 0, 0.5921569, 1, 1,
0.08293669, -0.6003485, 2.402939, 0, 0.5843138, 1, 1,
0.09005306, 0.7883894, 1.643678, 0, 0.5803922, 1, 1,
0.09239285, 0.7003911, -0.3955431, 0, 0.572549, 1, 1,
0.09274, -1.321996, 2.124289, 0, 0.5686275, 1, 1,
0.09307878, 1.325411, -1.091135, 0, 0.5607843, 1, 1,
0.09308546, -2.582632, 1.978142, 0, 0.5568628, 1, 1,
0.1006107, 0.5963562, 1.098468, 0, 0.5490196, 1, 1,
0.1024317, -1.172034, 3.174869, 0, 0.5450981, 1, 1,
0.1041347, 1.908312, 1.163433, 0, 0.5372549, 1, 1,
0.1044628, 0.302774, -1.285489, 0, 0.5333334, 1, 1,
0.1051924, 1.924128, -0.7493457, 0, 0.5254902, 1, 1,
0.1244503, -0.1746723, 1.746909, 0, 0.5215687, 1, 1,
0.1295101, -1.254815, 3.852588, 0, 0.5137255, 1, 1,
0.1305148, -0.6634815, 3.177904, 0, 0.509804, 1, 1,
0.131177, -0.3631785, 2.545912, 0, 0.5019608, 1, 1,
0.1384782, 1.504866, 1.043463, 0, 0.4941176, 1, 1,
0.1398993, -0.6600348, 2.823056, 0, 0.4901961, 1, 1,
0.1446322, 0.5048488, -0.5080894, 0, 0.4823529, 1, 1,
0.145394, 1.401097, 2.28456, 0, 0.4784314, 1, 1,
0.1493082, 0.7455625, 1.978438, 0, 0.4705882, 1, 1,
0.1499446, -1.845146, 2.931876, 0, 0.4666667, 1, 1,
0.1546822, -1.083136, 3.180747, 0, 0.4588235, 1, 1,
0.1554786, 0.7461201, -0.8230496, 0, 0.454902, 1, 1,
0.1560185, -1.993638, 3.798761, 0, 0.4470588, 1, 1,
0.1572167, -0.6229895, 2.781058, 0, 0.4431373, 1, 1,
0.1628768, -0.1211566, 1.851704, 0, 0.4352941, 1, 1,
0.1635975, 0.1342079, 0.3750986, 0, 0.4313726, 1, 1,
0.1657065, -0.1241926, 2.907398, 0, 0.4235294, 1, 1,
0.1676014, 0.6386977, 1.564298, 0, 0.4196078, 1, 1,
0.1676487, 0.7803589, 0.08321409, 0, 0.4117647, 1, 1,
0.169751, 0.8989245, -0.4001926, 0, 0.4078431, 1, 1,
0.1742633, -1.051694, 1.787092, 0, 0.4, 1, 1,
0.1778501, -2.179121, 5.186757, 0, 0.3921569, 1, 1,
0.1787434, 0.8950559, 1.19251, 0, 0.3882353, 1, 1,
0.1789691, 0.7530771, 0.9280785, 0, 0.3803922, 1, 1,
0.1794897, 0.66357, 1.447438, 0, 0.3764706, 1, 1,
0.1796865, -0.08755912, 1.924903, 0, 0.3686275, 1, 1,
0.1831602, 1.164536, 1.014024, 0, 0.3647059, 1, 1,
0.1848281, 0.944418, -0.38074, 0, 0.3568628, 1, 1,
0.1861434, -0.4229992, 3.169345, 0, 0.3529412, 1, 1,
0.1870773, -0.4342426, 2.823619, 0, 0.345098, 1, 1,
0.1893768, -0.233329, 3.659897, 0, 0.3411765, 1, 1,
0.1923906, -0.6890394, 3.459142, 0, 0.3333333, 1, 1,
0.194196, 1.147733, 0.5639902, 0, 0.3294118, 1, 1,
0.1953838, 0.1729096, 0.4458052, 0, 0.3215686, 1, 1,
0.196216, 1.088644, -0.5872577, 0, 0.3176471, 1, 1,
0.1984955, -2.28434, 2.886209, 0, 0.3098039, 1, 1,
0.2043097, -1.419117, 1.968144, 0, 0.3058824, 1, 1,
0.2046817, -1.621285, 3.546116, 0, 0.2980392, 1, 1,
0.2075364, -0.6560333, 4.318367, 0, 0.2901961, 1, 1,
0.2101171, -0.42496, 1.939574, 0, 0.2862745, 1, 1,
0.2110217, 0.1533701, 1.623487, 0, 0.2784314, 1, 1,
0.2111665, 0.6861484, -0.8996809, 0, 0.2745098, 1, 1,
0.2113675, 1.397031, -1.543014, 0, 0.2666667, 1, 1,
0.2120766, 0.1581381, 1.956723, 0, 0.2627451, 1, 1,
0.2127775, -0.7443761, 4.510146, 0, 0.254902, 1, 1,
0.2128145, -0.04612346, 2.867827, 0, 0.2509804, 1, 1,
0.2130391, -0.06113098, 2.844308, 0, 0.2431373, 1, 1,
0.2202171, -1.528522, 1.343382, 0, 0.2392157, 1, 1,
0.2212665, 2.453702, 0.1087824, 0, 0.2313726, 1, 1,
0.2223568, 0.6066535, 0.281001, 0, 0.227451, 1, 1,
0.2245619, 0.1854235, 0.6449379, 0, 0.2196078, 1, 1,
0.2254625, 0.4078294, 1.11916, 0, 0.2156863, 1, 1,
0.2287042, 0.279079, 0.9144392, 0, 0.2078431, 1, 1,
0.2291052, -0.8251173, 2.346822, 0, 0.2039216, 1, 1,
0.2309105, 0.240232, -0.05096446, 0, 0.1960784, 1, 1,
0.2310093, -1.447468, 1.301613, 0, 0.1882353, 1, 1,
0.2318504, -1.296126, 2.736105, 0, 0.1843137, 1, 1,
0.2363228, 1.732543, 0.6919752, 0, 0.1764706, 1, 1,
0.2368465, -0.5370356, 2.200717, 0, 0.172549, 1, 1,
0.2393044, 0.1625454, 1.370845, 0, 0.1647059, 1, 1,
0.2407106, 1.259417, -0.385651, 0, 0.1607843, 1, 1,
0.2424439, -0.8446448, 2.600465, 0, 0.1529412, 1, 1,
0.2482762, -2.046351, 3.24212, 0, 0.1490196, 1, 1,
0.2541267, 2.293588, 1.64723, 0, 0.1411765, 1, 1,
0.2647343, 0.5364954, 0.2023483, 0, 0.1372549, 1, 1,
0.2655223, 0.4719668, -1.206451, 0, 0.1294118, 1, 1,
0.283377, -0.6112986, 2.348107, 0, 0.1254902, 1, 1,
0.284019, -0.9652824, 2.419924, 0, 0.1176471, 1, 1,
0.2856311, -0.5615825, 2.706617, 0, 0.1137255, 1, 1,
0.287192, 1.160889, -1.321913, 0, 0.1058824, 1, 1,
0.2890275, -0.09614098, 3.329615, 0, 0.09803922, 1, 1,
0.2894551, -1.034314, 1.140941, 0, 0.09411765, 1, 1,
0.2919193, 0.660347, -0.4645367, 0, 0.08627451, 1, 1,
0.2993506, -0.4137115, 1.586268, 0, 0.08235294, 1, 1,
0.302555, -0.27797, 3.379478, 0, 0.07450981, 1, 1,
0.3038595, 0.2064376, 3.043236, 0, 0.07058824, 1, 1,
0.3043637, 0.5794896, 0.7336236, 0, 0.0627451, 1, 1,
0.3076849, -1.249036, 3.824209, 0, 0.05882353, 1, 1,
0.3108316, 0.2687574, 0.9263179, 0, 0.05098039, 1, 1,
0.3116697, 0.0005852781, 2.09792, 0, 0.04705882, 1, 1,
0.3130097, 1.289229, -1.903186, 0, 0.03921569, 1, 1,
0.3135946, 0.6831571, 0.576229, 0, 0.03529412, 1, 1,
0.3143149, 0.6865049, 2.405293, 0, 0.02745098, 1, 1,
0.3155705, 0.3096988, 0.6651178, 0, 0.02352941, 1, 1,
0.3201134, -0.6127911, 3.067243, 0, 0.01568628, 1, 1,
0.323038, 0.1322052, 1.604902, 0, 0.01176471, 1, 1,
0.3313744, 0.9088512, 0.5856411, 0, 0.003921569, 1, 1,
0.3333792, -0.05276511, 3.248089, 0.003921569, 0, 1, 1,
0.3358234, -1.778061, 2.999152, 0.007843138, 0, 1, 1,
0.3360766, -0.01108289, 1.31035, 0.01568628, 0, 1, 1,
0.3413071, -0.9524027, 2.046865, 0.01960784, 0, 1, 1,
0.3420167, 1.060087, 0.5468967, 0.02745098, 0, 1, 1,
0.3461282, 0.3638231, 0.2884414, 0.03137255, 0, 1, 1,
0.348213, 0.8729743, 0.6195015, 0.03921569, 0, 1, 1,
0.3545333, 0.2245394, 0.5582896, 0.04313726, 0, 1, 1,
0.3552553, 1.743458, 0.481292, 0.05098039, 0, 1, 1,
0.3557446, 0.4126476, 2.383305, 0.05490196, 0, 1, 1,
0.3558452, -1.756106, 2.071418, 0.0627451, 0, 1, 1,
0.3559462, -0.1362815, 2.235632, 0.06666667, 0, 1, 1,
0.3560722, -0.7849897, 3.986761, 0.07450981, 0, 1, 1,
0.3733177, 0.1491125, 0.9246687, 0.07843138, 0, 1, 1,
0.3781973, 1.168034, 1.00614, 0.08627451, 0, 1, 1,
0.3782746, -0.4114828, 2.667667, 0.09019608, 0, 1, 1,
0.3828343, -0.5423632, 1.835549, 0.09803922, 0, 1, 1,
0.3886874, 0.4409882, -0.5255342, 0.1058824, 0, 1, 1,
0.3911555, 1.262316, -0.2008763, 0.1098039, 0, 1, 1,
0.3929855, -1.586276, 2.899191, 0.1176471, 0, 1, 1,
0.3980682, 0.09729976, 1.467357, 0.1215686, 0, 1, 1,
0.4013676, -0.6517147, 3.240527, 0.1294118, 0, 1, 1,
0.4043419, -1.013097, 2.935615, 0.1333333, 0, 1, 1,
0.4050107, 0.9930816, 0.7127327, 0.1411765, 0, 1, 1,
0.4069143, -0.04364474, 3.02987, 0.145098, 0, 1, 1,
0.4071393, -0.407771, 0.8636157, 0.1529412, 0, 1, 1,
0.4130207, -0.03162079, 0.5925114, 0.1568628, 0, 1, 1,
0.4139437, -0.3676479, 0.8264262, 0.1647059, 0, 1, 1,
0.4143065, -0.3526216, 3.558799, 0.1686275, 0, 1, 1,
0.4180978, 0.103163, 0.1050109, 0.1764706, 0, 1, 1,
0.4249904, 0.1573359, 0.7110073, 0.1803922, 0, 1, 1,
0.4258075, -0.03525522, 0.7592999, 0.1882353, 0, 1, 1,
0.4275102, 0.6124698, 0.3448443, 0.1921569, 0, 1, 1,
0.430004, -0.7743266, 1.775078, 0.2, 0, 1, 1,
0.4312377, -0.0908778, 2.365365, 0.2078431, 0, 1, 1,
0.4341373, 0.3219398, 1.901247, 0.2117647, 0, 1, 1,
0.4359495, 0.9836937, 0.3067177, 0.2196078, 0, 1, 1,
0.4367156, -0.6380625, 2.474256, 0.2235294, 0, 1, 1,
0.445634, 0.1866475, 0.2806788, 0.2313726, 0, 1, 1,
0.4475986, 0.6037389, 0.9249043, 0.2352941, 0, 1, 1,
0.4484638, 0.9656701, 2.036548, 0.2431373, 0, 1, 1,
0.450276, -0.8550732, 3.581295, 0.2470588, 0, 1, 1,
0.4517446, -0.7172819, 1.113247, 0.254902, 0, 1, 1,
0.4523519, 0.3635868, 0.9377055, 0.2588235, 0, 1, 1,
0.4524881, -1.018577, 3.923181, 0.2666667, 0, 1, 1,
0.4533786, -2.093735, 2.993145, 0.2705882, 0, 1, 1,
0.4536543, -1.056045, 2.465462, 0.2784314, 0, 1, 1,
0.4541981, 1.505718, -1.856255, 0.282353, 0, 1, 1,
0.4547916, -0.1877916, 0.7763832, 0.2901961, 0, 1, 1,
0.457224, -1.163734, 1.604562, 0.2941177, 0, 1, 1,
0.4593628, 0.3454304, -0.3369294, 0.3019608, 0, 1, 1,
0.4607721, -0.6681964, 1.925983, 0.3098039, 0, 1, 1,
0.4628959, 1.380063, 2.675078, 0.3137255, 0, 1, 1,
0.4629791, -0.8948551, 4.175345, 0.3215686, 0, 1, 1,
0.4647842, -0.5280387, 1.16329, 0.3254902, 0, 1, 1,
0.465099, -0.2910267, 3.590562, 0.3333333, 0, 1, 1,
0.4658219, -1.266569, 2.672041, 0.3372549, 0, 1, 1,
0.4659937, -0.5167535, 4.020166, 0.345098, 0, 1, 1,
0.4684644, -1.799802, 2.137526, 0.3490196, 0, 1, 1,
0.4759637, -1.015638, 3.907573, 0.3568628, 0, 1, 1,
0.4852002, -0.6734861, 0.1579199, 0.3607843, 0, 1, 1,
0.4861479, -1.888988, 2.704621, 0.3686275, 0, 1, 1,
0.4974507, 0.5178564, 1.503268, 0.372549, 0, 1, 1,
0.4984751, -0.2632517, 1.198848, 0.3803922, 0, 1, 1,
0.4993922, -1.162744, 2.369125, 0.3843137, 0, 1, 1,
0.4996638, 0.6683629, -1.586824, 0.3921569, 0, 1, 1,
0.5002235, 1.924293, 0.1675561, 0.3960784, 0, 1, 1,
0.5072196, -0.02493729, 2.74704, 0.4039216, 0, 1, 1,
0.5120354, 1.289882, 0.2796576, 0.4117647, 0, 1, 1,
0.5214813, -0.2099597, 2.169273, 0.4156863, 0, 1, 1,
0.5286676, 0.3867502, 1.307774, 0.4235294, 0, 1, 1,
0.5332194, -1.38126, 3.642134, 0.427451, 0, 1, 1,
0.5396942, -1.05703, 1.910059, 0.4352941, 0, 1, 1,
0.55345, -0.4188768, 2.222459, 0.4392157, 0, 1, 1,
0.5580761, 0.8814011, -0.6397403, 0.4470588, 0, 1, 1,
0.5630187, 0.3746189, 0.2803704, 0.4509804, 0, 1, 1,
0.5658011, 0.4727528, 0.3940148, 0.4588235, 0, 1, 1,
0.5762364, -0.4406469, 1.394022, 0.4627451, 0, 1, 1,
0.5765334, -1.153352, 2.056874, 0.4705882, 0, 1, 1,
0.5877893, -0.08161564, 0.3185446, 0.4745098, 0, 1, 1,
0.595762, -0.2207028, 1.344976, 0.4823529, 0, 1, 1,
0.5983413, -0.9818859, 1.704056, 0.4862745, 0, 1, 1,
0.5987794, 1.598439, -0.4237619, 0.4941176, 0, 1, 1,
0.6021114, -0.02277127, 1.830788, 0.5019608, 0, 1, 1,
0.6043483, -0.1445353, 0.4334069, 0.5058824, 0, 1, 1,
0.6055288, 0.6561348, -0.04485181, 0.5137255, 0, 1, 1,
0.6090417, 1.214344, 2.113896, 0.5176471, 0, 1, 1,
0.6101523, 0.5458614, 4.28757, 0.5254902, 0, 1, 1,
0.6145522, 0.6682678, -0.5603532, 0.5294118, 0, 1, 1,
0.6148942, -1.331128, 3.891473, 0.5372549, 0, 1, 1,
0.6156518, -0.773378, 2.064517, 0.5411765, 0, 1, 1,
0.6166804, 0.7243181, -0.07409172, 0.5490196, 0, 1, 1,
0.6261753, -0.4485255, 2.346123, 0.5529412, 0, 1, 1,
0.6306252, 0.5315337, 1.603602, 0.5607843, 0, 1, 1,
0.6313003, 1.036106, 0.8623227, 0.5647059, 0, 1, 1,
0.6328958, -0.735485, 4.898814, 0.572549, 0, 1, 1,
0.6341676, -0.3271088, 1.64991, 0.5764706, 0, 1, 1,
0.6352443, 2.003072, -0.692888, 0.5843138, 0, 1, 1,
0.6362473, 0.5607022, 1.614541, 0.5882353, 0, 1, 1,
0.640045, 0.1315809, 0.6907808, 0.5960785, 0, 1, 1,
0.6417974, -2.481048, 2.085128, 0.6039216, 0, 1, 1,
0.646724, -1.683955, 3.071999, 0.6078432, 0, 1, 1,
0.6492215, 1.189631, 3.398709, 0.6156863, 0, 1, 1,
0.6492812, -0.9614177, 3.196177, 0.6196079, 0, 1, 1,
0.6545002, 1.95772, 0.6932615, 0.627451, 0, 1, 1,
0.6579003, 0.09345543, 1.28847, 0.6313726, 0, 1, 1,
0.6602699, -0.5501796, 2.609744, 0.6392157, 0, 1, 1,
0.6664388, -0.7876333, 2.557278, 0.6431373, 0, 1, 1,
0.6694013, 0.9743605, 0.5096489, 0.6509804, 0, 1, 1,
0.6720346, -0.4703224, 1.999964, 0.654902, 0, 1, 1,
0.6790771, 0.6899673, -0.2387767, 0.6627451, 0, 1, 1,
0.6851336, 2.676111, 0.2901623, 0.6666667, 0, 1, 1,
0.6938353, -1.574022, 2.770121, 0.6745098, 0, 1, 1,
0.7031334, -0.1678877, 1.554986, 0.6784314, 0, 1, 1,
0.7043296, -0.2619689, 1.280259, 0.6862745, 0, 1, 1,
0.7053064, 1.32311, -0.2699248, 0.6901961, 0, 1, 1,
0.7068408, -0.05985151, 3.28542, 0.6980392, 0, 1, 1,
0.7073126, -1.864691, 2.322512, 0.7058824, 0, 1, 1,
0.7081891, 0.06316426, 0.9533933, 0.7098039, 0, 1, 1,
0.7097952, -0.2147088, 4.431057, 0.7176471, 0, 1, 1,
0.7129761, -1.206049, 2.329411, 0.7215686, 0, 1, 1,
0.7132033, -0.2555443, 3.065037, 0.7294118, 0, 1, 1,
0.7133552, 1.666782, 0.8255348, 0.7333333, 0, 1, 1,
0.7155796, 0.276459, 2.34711, 0.7411765, 0, 1, 1,
0.7194476, 0.2715905, 0.2927716, 0.7450981, 0, 1, 1,
0.7205592, -0.9971421, 1.590105, 0.7529412, 0, 1, 1,
0.7209842, -0.5230538, 2.41292, 0.7568628, 0, 1, 1,
0.7225834, 1.604257, 1.129136, 0.7647059, 0, 1, 1,
0.7242427, -0.7975215, 2.312288, 0.7686275, 0, 1, 1,
0.7257603, 0.8500945, 0.2194443, 0.7764706, 0, 1, 1,
0.7262844, -0.2673186, 3.056046, 0.7803922, 0, 1, 1,
0.7292159, 0.2491584, 1.481081, 0.7882353, 0, 1, 1,
0.7368125, -1.513624, 2.955989, 0.7921569, 0, 1, 1,
0.7391997, -0.7680568, 1.963954, 0.8, 0, 1, 1,
0.7397653, -1.013474, 2.528293, 0.8078431, 0, 1, 1,
0.7417325, -0.3818612, 4.399546, 0.8117647, 0, 1, 1,
0.7444831, -1.787789, 2.77582, 0.8196079, 0, 1, 1,
0.7451218, -2.246984, 3.609179, 0.8235294, 0, 1, 1,
0.7528846, 0.4215474, 2.348531, 0.8313726, 0, 1, 1,
0.7536503, 1.128672, 0.4951034, 0.8352941, 0, 1, 1,
0.7540087, -0.3043609, 1.974989, 0.8431373, 0, 1, 1,
0.7575164, -0.1651335, 1.956189, 0.8470588, 0, 1, 1,
0.7589474, -1.219179, 1.960189, 0.854902, 0, 1, 1,
0.7674987, -0.9220712, 2.3076, 0.8588235, 0, 1, 1,
0.7695513, -0.1827398, 0.7658597, 0.8666667, 0, 1, 1,
0.7752501, -0.9051206, 2.029119, 0.8705882, 0, 1, 1,
0.7752951, 1.972035, -0.1603406, 0.8784314, 0, 1, 1,
0.7828162, -0.4560778, 0.3793613, 0.8823529, 0, 1, 1,
0.7871631, -0.1278594, 2.095562, 0.8901961, 0, 1, 1,
0.7923081, -0.6616186, 0.8994796, 0.8941177, 0, 1, 1,
0.7994663, -0.6673115, 2.457438, 0.9019608, 0, 1, 1,
0.7999244, -0.7599949, 3.159113, 0.9098039, 0, 1, 1,
0.8000976, 1.687194, 1.295596, 0.9137255, 0, 1, 1,
0.8010071, 0.3905159, 1.195623, 0.9215686, 0, 1, 1,
0.8082727, 1.981381, -2.455439, 0.9254902, 0, 1, 1,
0.8092221, -0.180617, 2.071912, 0.9333333, 0, 1, 1,
0.8174066, 1.571012, 0.3082662, 0.9372549, 0, 1, 1,
0.8190285, 0.8249835, 1.253695, 0.945098, 0, 1, 1,
0.8267608, -0.3386008, 2.855618, 0.9490196, 0, 1, 1,
0.8316395, -2.010239, 3.498366, 0.9568627, 0, 1, 1,
0.8357419, 0.9686139, 3.634543, 0.9607843, 0, 1, 1,
0.8365424, -0.1203127, 1.919187, 0.9686275, 0, 1, 1,
0.8394451, 0.7035263, 0.9816938, 0.972549, 0, 1, 1,
0.8432118, -0.8965329, 3.400111, 0.9803922, 0, 1, 1,
0.8443905, 1.477971, -2.106946, 0.9843137, 0, 1, 1,
0.8483965, -0.005468758, 3.428944, 0.9921569, 0, 1, 1,
0.8583137, 0.6302226, -0.2943813, 0.9960784, 0, 1, 1,
0.8626954, -0.6311271, 1.681752, 1, 0, 0.9960784, 1,
0.8726576, -0.1008847, 0.2202624, 1, 0, 0.9882353, 1,
0.8763593, 0.6575354, 0.7564335, 1, 0, 0.9843137, 1,
0.8769393, 1.190078, 1.571119, 1, 0, 0.9764706, 1,
0.8797238, -0.8610552, 1.615599, 1, 0, 0.972549, 1,
0.8954991, 0.3851021, 0.2125647, 1, 0, 0.9647059, 1,
0.8963451, 0.2153848, 0.6713035, 1, 0, 0.9607843, 1,
0.8984197, 0.3117897, -0.4979677, 1, 0, 0.9529412, 1,
0.8990445, -0.3738549, 3.419862, 1, 0, 0.9490196, 1,
0.8994359, -0.5210374, 2.121475, 1, 0, 0.9411765, 1,
0.9055767, 1.070848, -0.7864093, 1, 0, 0.9372549, 1,
0.9062017, 2.349767, 0.1124425, 1, 0, 0.9294118, 1,
0.9232587, -1.785394, 3.592755, 1, 0, 0.9254902, 1,
0.9242338, 0.8885547, 0.88765, 1, 0, 0.9176471, 1,
0.9261706, -0.445585, 1.816446, 1, 0, 0.9137255, 1,
0.9274116, -0.5389115, 2.52871, 1, 0, 0.9058824, 1,
0.9288222, 0.5816159, 0.3933257, 1, 0, 0.9019608, 1,
0.9303672, -0.3151094, 0.4059181, 1, 0, 0.8941177, 1,
0.9307039, -0.926116, 2.0429, 1, 0, 0.8862745, 1,
0.9312565, 0.1161911, 1.835431, 1, 0, 0.8823529, 1,
0.9318888, -1.423074, 3.958409, 1, 0, 0.8745098, 1,
0.9338028, 0.2475311, -0.4717181, 1, 0, 0.8705882, 1,
0.9421614, 0.5169909, 0.2365922, 1, 0, 0.8627451, 1,
0.9447444, -0.5144761, 2.951124, 1, 0, 0.8588235, 1,
0.9448867, 0.4039119, 0.3343552, 1, 0, 0.8509804, 1,
0.9458351, -0.3872529, 3.013704, 1, 0, 0.8470588, 1,
0.9474767, 1.448379, -0.775975, 1, 0, 0.8392157, 1,
0.9669985, 0.7207081, 0.5162442, 1, 0, 0.8352941, 1,
0.9786522, 0.6123538, 0.934823, 1, 0, 0.827451, 1,
0.9804627, 2.301698, -0.7891982, 1, 0, 0.8235294, 1,
0.9818889, -0.4196268, 2.967592, 1, 0, 0.8156863, 1,
0.9938043, 0.4247921, 1.376527, 1, 0, 0.8117647, 1,
0.9976032, 0.08590589, 0.2967751, 1, 0, 0.8039216, 1,
0.9994903, 1.192758, 0.4811011, 1, 0, 0.7960784, 1,
1.000593, 1.036356, 1.108372, 1, 0, 0.7921569, 1,
1.000694, 1.203069, 0.1245821, 1, 0, 0.7843137, 1,
1.003851, 0.8494763, 1.72012, 1, 0, 0.7803922, 1,
1.010188, -1.163638, 2.624878, 1, 0, 0.772549, 1,
1.016089, -0.9243245, 2.231431, 1, 0, 0.7686275, 1,
1.020964, -1.764709, 2.155666, 1, 0, 0.7607843, 1,
1.021171, 0.7871785, 0.03426064, 1, 0, 0.7568628, 1,
1.026433, -1.567708, 3.508602, 1, 0, 0.7490196, 1,
1.034548, 0.6942844, -1.072332, 1, 0, 0.7450981, 1,
1.03509, 0.1513235, 2.195023, 1, 0, 0.7372549, 1,
1.042019, -0.8323132, 1.093226, 1, 0, 0.7333333, 1,
1.042437, 2.219158, -0.8268644, 1, 0, 0.7254902, 1,
1.054007, -0.5142101, 0.5417285, 1, 0, 0.7215686, 1,
1.064438, -0.7458092, 1.996916, 1, 0, 0.7137255, 1,
1.07058, -1.208226, 1.282028, 1, 0, 0.7098039, 1,
1.07812, 0.2785198, 1.385037, 1, 0, 0.7019608, 1,
1.085532, 0.4555628, 0.8194036, 1, 0, 0.6941177, 1,
1.092962, -0.4736848, 2.490028, 1, 0, 0.6901961, 1,
1.093282, -0.7439476, 3.230078, 1, 0, 0.682353, 1,
1.095721, -0.01506125, 2.545924, 1, 0, 0.6784314, 1,
1.105753, -1.103179, 3.53207, 1, 0, 0.6705883, 1,
1.106995, -0.5679859, 0.455206, 1, 0, 0.6666667, 1,
1.113036, 0.3911555, 0.8299976, 1, 0, 0.6588235, 1,
1.113851, -1.467672, 1.495495, 1, 0, 0.654902, 1,
1.126364, 0.4300549, 0.1995458, 1, 0, 0.6470588, 1,
1.129634, -0.07508405, 1.158641, 1, 0, 0.6431373, 1,
1.142406, 0.6432487, 3.077566, 1, 0, 0.6352941, 1,
1.14608, -0.7099639, 1.364776, 1, 0, 0.6313726, 1,
1.146915, -1.285218, -0.1819136, 1, 0, 0.6235294, 1,
1.148769, -0.05978866, 1.388947, 1, 0, 0.6196079, 1,
1.172081, 0.677631, 0.673041, 1, 0, 0.6117647, 1,
1.179266, 0.4223248, 3.799653, 1, 0, 0.6078432, 1,
1.182167, -0.3195605, 1.714045, 1, 0, 0.6, 1,
1.18737, 0.9428077, -0.1473809, 1, 0, 0.5921569, 1,
1.190259, -0.3700101, 0.5106509, 1, 0, 0.5882353, 1,
1.191953, 1.880149, 0.6529578, 1, 0, 0.5803922, 1,
1.198358, 0.9806706, 1.279695, 1, 0, 0.5764706, 1,
1.201674, 1.021303, 0.8891597, 1, 0, 0.5686275, 1,
1.211585, -0.4298068, 3.32147, 1, 0, 0.5647059, 1,
1.21483, -1.534939, 2.922353, 1, 0, 0.5568628, 1,
1.233347, 0.7255585, 0.3361037, 1, 0, 0.5529412, 1,
1.237157, -0.03448803, 2.030205, 1, 0, 0.5450981, 1,
1.239172, 0.3164378, 0.3820735, 1, 0, 0.5411765, 1,
1.254024, 1.457736, 2.283262, 1, 0, 0.5333334, 1,
1.258535, 0.8932562, 1.617176, 1, 0, 0.5294118, 1,
1.262857, 1.500688, -0.06515723, 1, 0, 0.5215687, 1,
1.268228, -0.374899, 1.474211, 1, 0, 0.5176471, 1,
1.269517, 1.526583, 0.7505821, 1, 0, 0.509804, 1,
1.269608, 0.7621329, -0.8872007, 1, 0, 0.5058824, 1,
1.270956, -0.7860892, 1.929533, 1, 0, 0.4980392, 1,
1.272938, 1.178882, 1.685222, 1, 0, 0.4901961, 1,
1.27804, -0.1437483, 0.7595686, 1, 0, 0.4862745, 1,
1.288405, -0.01633119, 1.976061, 1, 0, 0.4784314, 1,
1.297362, -0.0426084, 0.5213994, 1, 0, 0.4745098, 1,
1.306646, -1.210258, 2.822065, 1, 0, 0.4666667, 1,
1.310022, -1.337557, 2.122636, 1, 0, 0.4627451, 1,
1.328124, 0.1976606, 0.6060126, 1, 0, 0.454902, 1,
1.328782, 1.107347, 0.5747685, 1, 0, 0.4509804, 1,
1.334374, -2.05062, 3.501922, 1, 0, 0.4431373, 1,
1.343065, -0.7897429, 3.145281, 1, 0, 0.4392157, 1,
1.346587, -0.1997673, -0.3979659, 1, 0, 0.4313726, 1,
1.347673, -0.5294442, 0.4566249, 1, 0, 0.427451, 1,
1.377085, 0.1152271, 1.761872, 1, 0, 0.4196078, 1,
1.381898, -0.2948701, 1.720902, 1, 0, 0.4156863, 1,
1.399035, -0.09073884, 0.6035984, 1, 0, 0.4078431, 1,
1.399058, 0.7607406, -0.4964123, 1, 0, 0.4039216, 1,
1.403948, 0.05668335, 1.035197, 1, 0, 0.3960784, 1,
1.415896, 0.2197823, 2.308409, 1, 0, 0.3882353, 1,
1.42163, 0.06235696, -1.010424, 1, 0, 0.3843137, 1,
1.425789, 1.186614, 2.679283, 1, 0, 0.3764706, 1,
1.434802, -0.1279454, 1.945318, 1, 0, 0.372549, 1,
1.44781, 1.339035, -0.1877868, 1, 0, 0.3647059, 1,
1.453086, -1.753079, 2.762972, 1, 0, 0.3607843, 1,
1.457265, -0.5725841, 1.464678, 1, 0, 0.3529412, 1,
1.458552, -2.390949, 4.459313, 1, 0, 0.3490196, 1,
1.475966, -0.6851259, 3.689695, 1, 0, 0.3411765, 1,
1.480564, 0.6392584, 0.960496, 1, 0, 0.3372549, 1,
1.482317, 0.278935, 0.7071908, 1, 0, 0.3294118, 1,
1.50166, -1.5859, 2.072961, 1, 0, 0.3254902, 1,
1.50492, 2.218656, 0.07765939, 1, 0, 0.3176471, 1,
1.516018, -0.003859953, 1.694978, 1, 0, 0.3137255, 1,
1.533815, 0.7785239, 1.27276, 1, 0, 0.3058824, 1,
1.536842, -1.487577, 3.009591, 1, 0, 0.2980392, 1,
1.539831, 2.637323, 0.9397004, 1, 0, 0.2941177, 1,
1.559483, 0.2865411, 0.6581795, 1, 0, 0.2862745, 1,
1.57132, 0.1469751, 2.140431, 1, 0, 0.282353, 1,
1.576755, 0.4289816, 0.9115367, 1, 0, 0.2745098, 1,
1.583833, 0.05309767, 2.498068, 1, 0, 0.2705882, 1,
1.596635, 0.5911071, -0.1912772, 1, 0, 0.2627451, 1,
1.60151, -1.26378, 2.433824, 1, 0, 0.2588235, 1,
1.623614, -1.168316, 1.653307, 1, 0, 0.2509804, 1,
1.633752, -0.1897911, 2.42867, 1, 0, 0.2470588, 1,
1.643372, -0.9358602, 1.482298, 1, 0, 0.2392157, 1,
1.651334, -0.6482294, 1.240989, 1, 0, 0.2352941, 1,
1.676755, -1.034082, 3.408302, 1, 0, 0.227451, 1,
1.677785, 0.513549, 1.381037, 1, 0, 0.2235294, 1,
1.689566, -0.7008253, 1.646318, 1, 0, 0.2156863, 1,
1.734253, 1.505655, 0.3925266, 1, 0, 0.2117647, 1,
1.745429, 1.156568, 0.9272711, 1, 0, 0.2039216, 1,
1.745932, 0.2981844, 2.339803, 1, 0, 0.1960784, 1,
1.746993, 1.954268, 0.3885997, 1, 0, 0.1921569, 1,
1.75667, 0.854536, 0.7735727, 1, 0, 0.1843137, 1,
1.816457, 0.5342897, 1.532366, 1, 0, 0.1803922, 1,
1.825959, -0.95411, 2.3702, 1, 0, 0.172549, 1,
1.860279, -0.388819, 2.917576, 1, 0, 0.1686275, 1,
1.874115, -0.04328901, 1.90804, 1, 0, 0.1607843, 1,
1.879364, -0.9691252, 1.392678, 1, 0, 0.1568628, 1,
2.034503, -1.027291, 1.806137, 1, 0, 0.1490196, 1,
2.045765, -0.8157575, 2.485678, 1, 0, 0.145098, 1,
2.054227, -2.033741, 2.163069, 1, 0, 0.1372549, 1,
2.093768, -1.535514, 2.856415, 1, 0, 0.1333333, 1,
2.098843, 0.5910326, 0.645136, 1, 0, 0.1254902, 1,
2.103463, -0.4093944, 3.614633, 1, 0, 0.1215686, 1,
2.140203, -0.2082165, 1.681584, 1, 0, 0.1137255, 1,
2.142988, -0.9841215, 2.339639, 1, 0, 0.1098039, 1,
2.147534, 0.9202043, 0.8102702, 1, 0, 0.1019608, 1,
2.200392, 0.4182713, -0.2094118, 1, 0, 0.09411765, 1,
2.261995, -0.1104529, 2.545941, 1, 0, 0.09019608, 1,
2.263636, 0.3547802, 2.053469, 1, 0, 0.08235294, 1,
2.273091, 1.75989, 1.225456, 1, 0, 0.07843138, 1,
2.280695, 0.8369075, 2.614808, 1, 0, 0.07058824, 1,
2.297596, -0.05091539, 0.3082602, 1, 0, 0.06666667, 1,
2.320667, -1.556808, 3.373447, 1, 0, 0.05882353, 1,
2.326707, -0.245293, 3.524375, 1, 0, 0.05490196, 1,
2.331535, 0.3367516, 3.327842, 1, 0, 0.04705882, 1,
2.34032, -0.9196126, 1.508796, 1, 0, 0.04313726, 1,
2.39956, 0.8459443, 3.324134, 1, 0, 0.03529412, 1,
2.506647, 0.04294107, 0.8780658, 1, 0, 0.03137255, 1,
2.573689, 0.99326, -0.02979805, 1, 0, 0.02352941, 1,
2.629975, 0.007911025, 0.7762787, 1, 0, 0.01960784, 1,
2.778314, -0.2376093, 3.403374, 1, 0, 0.01176471, 1,
2.973126, 0.4147053, 1.098341, 1, 0, 0.007843138, 1
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
-0.2071304, -5.333629, -6.887008, 0, -0.5, 0.5, 0.5,
-0.2071304, -5.333629, -6.887008, 1, -0.5, 0.5, 0.5,
-0.2071304, -5.333629, -6.887008, 1, 1.5, 0.5, 0.5,
-0.2071304, -5.333629, -6.887008, 0, 1.5, 0.5, 0.5
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
-4.465494, 0.02159691, -6.887008, 0, -0.5, 0.5, 0.5,
-4.465494, 0.02159691, -6.887008, 1, -0.5, 0.5, 0.5,
-4.465494, 0.02159691, -6.887008, 1, 1.5, 0.5, 0.5,
-4.465494, 0.02159691, -6.887008, 0, 1.5, 0.5, 0.5
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
-4.465494, -5.333629, 0.02482224, 0, -0.5, 0.5, 0.5,
-4.465494, -5.333629, 0.02482224, 1, -0.5, 0.5, 0.5,
-4.465494, -5.333629, 0.02482224, 1, 1.5, 0.5, 0.5,
-4.465494, -5.333629, 0.02482224, 0, 1.5, 0.5, 0.5
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
-3, -4.097808, -5.29197,
2, -4.097808, -5.29197,
-3, -4.097808, -5.29197,
-3, -4.303778, -5.55781,
-2, -4.097808, -5.29197,
-2, -4.303778, -5.55781,
-1, -4.097808, -5.29197,
-1, -4.303778, -5.55781,
0, -4.097808, -5.29197,
0, -4.303778, -5.55781,
1, -4.097808, -5.29197,
1, -4.303778, -5.55781,
2, -4.097808, -5.29197,
2, -4.303778, -5.55781
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
-3, -4.715719, -6.089489, 0, -0.5, 0.5, 0.5,
-3, -4.715719, -6.089489, 1, -0.5, 0.5, 0.5,
-3, -4.715719, -6.089489, 1, 1.5, 0.5, 0.5,
-3, -4.715719, -6.089489, 0, 1.5, 0.5, 0.5,
-2, -4.715719, -6.089489, 0, -0.5, 0.5, 0.5,
-2, -4.715719, -6.089489, 1, -0.5, 0.5, 0.5,
-2, -4.715719, -6.089489, 1, 1.5, 0.5, 0.5,
-2, -4.715719, -6.089489, 0, 1.5, 0.5, 0.5,
-1, -4.715719, -6.089489, 0, -0.5, 0.5, 0.5,
-1, -4.715719, -6.089489, 1, -0.5, 0.5, 0.5,
-1, -4.715719, -6.089489, 1, 1.5, 0.5, 0.5,
-1, -4.715719, -6.089489, 0, 1.5, 0.5, 0.5,
0, -4.715719, -6.089489, 0, -0.5, 0.5, 0.5,
0, -4.715719, -6.089489, 1, -0.5, 0.5, 0.5,
0, -4.715719, -6.089489, 1, 1.5, 0.5, 0.5,
0, -4.715719, -6.089489, 0, 1.5, 0.5, 0.5,
1, -4.715719, -6.089489, 0, -0.5, 0.5, 0.5,
1, -4.715719, -6.089489, 1, -0.5, 0.5, 0.5,
1, -4.715719, -6.089489, 1, 1.5, 0.5, 0.5,
1, -4.715719, -6.089489, 0, 1.5, 0.5, 0.5,
2, -4.715719, -6.089489, 0, -0.5, 0.5, 0.5,
2, -4.715719, -6.089489, 1, -0.5, 0.5, 0.5,
2, -4.715719, -6.089489, 1, 1.5, 0.5, 0.5,
2, -4.715719, -6.089489, 0, 1.5, 0.5, 0.5
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
-3.482795, -2, -5.29197,
-3.482795, 4, -5.29197,
-3.482795, -2, -5.29197,
-3.646578, -2, -5.55781,
-3.482795, 0, -5.29197,
-3.646578, 0, -5.55781,
-3.482795, 2, -5.29197,
-3.646578, 2, -5.55781,
-3.482795, 4, -5.29197,
-3.646578, 4, -5.55781
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
"2",
"4"
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
-3.974145, -2, -6.089489, 0, -0.5, 0.5, 0.5,
-3.974145, -2, -6.089489, 1, -0.5, 0.5, 0.5,
-3.974145, -2, -6.089489, 1, 1.5, 0.5, 0.5,
-3.974145, -2, -6.089489, 0, 1.5, 0.5, 0.5,
-3.974145, 0, -6.089489, 0, -0.5, 0.5, 0.5,
-3.974145, 0, -6.089489, 1, -0.5, 0.5, 0.5,
-3.974145, 0, -6.089489, 1, 1.5, 0.5, 0.5,
-3.974145, 0, -6.089489, 0, 1.5, 0.5, 0.5,
-3.974145, 2, -6.089489, 0, -0.5, 0.5, 0.5,
-3.974145, 2, -6.089489, 1, -0.5, 0.5, 0.5,
-3.974145, 2, -6.089489, 1, 1.5, 0.5, 0.5,
-3.974145, 2, -6.089489, 0, 1.5, 0.5, 0.5,
-3.974145, 4, -6.089489, 0, -0.5, 0.5, 0.5,
-3.974145, 4, -6.089489, 1, -0.5, 0.5, 0.5,
-3.974145, 4, -6.089489, 1, 1.5, 0.5, 0.5,
-3.974145, 4, -6.089489, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.482795, -4.097808, -4,
-3.482795, -4.097808, 4,
-3.482795, -4.097808, -4,
-3.646578, -4.303778, -4,
-3.482795, -4.097808, -2,
-3.646578, -4.303778, -2,
-3.482795, -4.097808, 0,
-3.646578, -4.303778, 0,
-3.482795, -4.097808, 2,
-3.646578, -4.303778, 2,
-3.482795, -4.097808, 4,
-3.646578, -4.303778, 4
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
-3.974145, -4.715719, -4, 0, -0.5, 0.5, 0.5,
-3.974145, -4.715719, -4, 1, -0.5, 0.5, 0.5,
-3.974145, -4.715719, -4, 1, 1.5, 0.5, 0.5,
-3.974145, -4.715719, -4, 0, 1.5, 0.5, 0.5,
-3.974145, -4.715719, -2, 0, -0.5, 0.5, 0.5,
-3.974145, -4.715719, -2, 1, -0.5, 0.5, 0.5,
-3.974145, -4.715719, -2, 1, 1.5, 0.5, 0.5,
-3.974145, -4.715719, -2, 0, 1.5, 0.5, 0.5,
-3.974145, -4.715719, 0, 0, -0.5, 0.5, 0.5,
-3.974145, -4.715719, 0, 1, -0.5, 0.5, 0.5,
-3.974145, -4.715719, 0, 1, 1.5, 0.5, 0.5,
-3.974145, -4.715719, 0, 0, 1.5, 0.5, 0.5,
-3.974145, -4.715719, 2, 0, -0.5, 0.5, 0.5,
-3.974145, -4.715719, 2, 1, -0.5, 0.5, 0.5,
-3.974145, -4.715719, 2, 1, 1.5, 0.5, 0.5,
-3.974145, -4.715719, 2, 0, 1.5, 0.5, 0.5,
-3.974145, -4.715719, 4, 0, -0.5, 0.5, 0.5,
-3.974145, -4.715719, 4, 1, -0.5, 0.5, 0.5,
-3.974145, -4.715719, 4, 1, 1.5, 0.5, 0.5,
-3.974145, -4.715719, 4, 0, 1.5, 0.5, 0.5
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
-3.482795, -4.097808, -5.29197,
-3.482795, 4.141002, -5.29197,
-3.482795, -4.097808, 5.341615,
-3.482795, 4.141002, 5.341615,
-3.482795, -4.097808, -5.29197,
-3.482795, -4.097808, 5.341615,
-3.482795, 4.141002, -5.29197,
-3.482795, 4.141002, 5.341615,
-3.482795, -4.097808, -5.29197,
3.068534, -4.097808, -5.29197,
-3.482795, -4.097808, 5.341615,
3.068534, -4.097808, 5.341615,
-3.482795, 4.141002, -5.29197,
3.068534, 4.141002, -5.29197,
-3.482795, 4.141002, 5.341615,
3.068534, 4.141002, 5.341615,
3.068534, -4.097808, -5.29197,
3.068534, 4.141002, -5.29197,
3.068534, -4.097808, 5.341615,
3.068534, 4.141002, 5.341615,
3.068534, -4.097808, -5.29197,
3.068534, -4.097808, 5.341615,
3.068534, 4.141002, -5.29197,
3.068534, 4.141002, 5.341615
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
var radius = 7.989588;
var distance = 35.54658;
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
mvMatrix.translate( 0.2071304, -0.02159691, -0.02482224 );
mvMatrix.scale( 1.318587, 1.048513, 0.8123789 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.54658);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
oxabetrinil<-read.table("oxabetrinil.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-oxabetrinil$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxabetrinil' not found
```

```r
y<-oxabetrinil$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxabetrinil' not found
```

```r
z<-oxabetrinil$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxabetrinil' not found
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
-3.387387, -0.848353, -2.866552, 0, 0, 1, 1, 1,
-3.225607, 0.6551772, -1.040555, 1, 0, 0, 1, 1,
-3.199176, -0.9368385, -0.3526387, 1, 0, 0, 1, 1,
-2.860377, 0.4791674, -3.205499, 1, 0, 0, 1, 1,
-2.768414, 0.794735, -2.292627, 1, 0, 0, 1, 1,
-2.612993, 2.054227, -0.890645, 1, 0, 0, 1, 1,
-2.525347, 1.513872, -0.8593193, 0, 0, 0, 1, 1,
-2.495306, 1.546518, 0.865707, 0, 0, 0, 1, 1,
-2.483933, 1.657051, -1.984036, 0, 0, 0, 1, 1,
-2.458545, 0.3221964, -1.289382, 0, 0, 0, 1, 1,
-2.450475, -0.4576192, -1.957501, 0, 0, 0, 1, 1,
-2.43027, -0.3966134, -2.046058, 0, 0, 0, 1, 1,
-2.429673, -1.157854, -0.4921473, 0, 0, 0, 1, 1,
-2.34811, 0.8178988, -2.186487, 1, 1, 1, 1, 1,
-2.337463, -1.31645, -2.347229, 1, 1, 1, 1, 1,
-2.301833, 0.2820118, -1.724596, 1, 1, 1, 1, 1,
-2.196262, 0.5117323, -1.06124, 1, 1, 1, 1, 1,
-2.183846, 1.393126, 0.2134453, 1, 1, 1, 1, 1,
-2.172565, 0.1944079, -1.589712, 1, 1, 1, 1, 1,
-2.10771, 0.7685844, -1.283818, 1, 1, 1, 1, 1,
-2.088289, -2.071695, -1.518816, 1, 1, 1, 1, 1,
-1.980224, 0.1817425, -2.167438, 1, 1, 1, 1, 1,
-1.979725, 0.2324479, 0.09343763, 1, 1, 1, 1, 1,
-1.974206, 1.808858, -0.7152209, 1, 1, 1, 1, 1,
-1.973028, -1.458866, -2.612304, 1, 1, 1, 1, 1,
-1.972754, -0.2894399, -1.106178, 1, 1, 1, 1, 1,
-1.961527, -0.6255174, -2.616918, 1, 1, 1, 1, 1,
-1.956659, 0.6726978, -0.2497312, 1, 1, 1, 1, 1,
-1.935036, 0.4724185, 0.9662, 0, 0, 1, 1, 1,
-1.924562, 0.00154027, -2.584985, 1, 0, 0, 1, 1,
-1.917873, 0.6028089, -0.428583, 1, 0, 0, 1, 1,
-1.892565, -0.9281714, -2.955185, 1, 0, 0, 1, 1,
-1.890884, -3.977825, -2.570437, 1, 0, 0, 1, 1,
-1.88599, -0.03830143, -1.647041, 1, 0, 0, 1, 1,
-1.876726, 0.8660243, -0.6205341, 0, 0, 0, 1, 1,
-1.874841, -1.449754, -3.094442, 0, 0, 0, 1, 1,
-1.869109, 0.0499339, -0.8930002, 0, 0, 0, 1, 1,
-1.861793, 0.005984111, -3.39145, 0, 0, 0, 1, 1,
-1.856322, 0.609594, -0.7868193, 0, 0, 0, 1, 1,
-1.844085, -1.215551, -3.506271, 0, 0, 0, 1, 1,
-1.820709, -1.532986, -2.218437, 0, 0, 0, 1, 1,
-1.820105, -0.3467252, -3.078237, 1, 1, 1, 1, 1,
-1.810422, 0.4214042, -1.507779, 1, 1, 1, 1, 1,
-1.8053, -0.4829229, -1.241958, 1, 1, 1, 1, 1,
-1.80461, 0.4071686, -1.628608, 1, 1, 1, 1, 1,
-1.799866, -1.95811, -2.330267, 1, 1, 1, 1, 1,
-1.762979, -0.7146063, -1.696428, 1, 1, 1, 1, 1,
-1.751369, 0.3382244, -2.043843, 1, 1, 1, 1, 1,
-1.731856, 1.322056, -1.950057, 1, 1, 1, 1, 1,
-1.731576, -0.6255547, -0.8988728, 1, 1, 1, 1, 1,
-1.725745, -0.2168292, -2.426423, 1, 1, 1, 1, 1,
-1.693361, 0.6322313, -1.398413, 1, 1, 1, 1, 1,
-1.692678, 0.7050413, -2.151798, 1, 1, 1, 1, 1,
-1.689623, -0.3475813, -2.428293, 1, 1, 1, 1, 1,
-1.681763, 0.4629207, -1.884182, 1, 1, 1, 1, 1,
-1.668346, -0.3463682, -1.246027, 1, 1, 1, 1, 1,
-1.665868, -0.7631952, -1.610116, 0, 0, 1, 1, 1,
-1.650935, -0.1609868, -3.456516, 1, 0, 0, 1, 1,
-1.646436, -0.1992354, -1.664837, 1, 0, 0, 1, 1,
-1.640541, -2.418409, -2.715832, 1, 0, 0, 1, 1,
-1.604993, 0.6784604, -1.402795, 1, 0, 0, 1, 1,
-1.595029, 1.088247, -0.8346689, 1, 0, 0, 1, 1,
-1.580635, 0.1791703, -0.4323488, 0, 0, 0, 1, 1,
-1.573504, -0.7815225, -2.922202, 0, 0, 0, 1, 1,
-1.568976, 0.5043473, 1.136018, 0, 0, 0, 1, 1,
-1.568379, -0.5852802, -0.9855692, 0, 0, 0, 1, 1,
-1.567728, 1.228208, -1.501815, 0, 0, 0, 1, 1,
-1.564812, 1.474765, -1.34645, 0, 0, 0, 1, 1,
-1.559015, 1.220494, -1.443152, 0, 0, 0, 1, 1,
-1.546327, 0.3561898, -2.035297, 1, 1, 1, 1, 1,
-1.540044, 0.7378162, -1.786942, 1, 1, 1, 1, 1,
-1.536125, -0.6075205, -3.050831, 1, 1, 1, 1, 1,
-1.532599, -1.384691, -4.480264, 1, 1, 1, 1, 1,
-1.530479, 0.7878059, -1.427252, 1, 1, 1, 1, 1,
-1.519325, -1.282246, -2.139654, 1, 1, 1, 1, 1,
-1.51223, -0.2393349, -1.514095, 1, 1, 1, 1, 1,
-1.508795, 1.792646, -2.216126, 1, 1, 1, 1, 1,
-1.500831, -0.01875795, -1.894486, 1, 1, 1, 1, 1,
-1.492023, 1.701742, 0.5489063, 1, 1, 1, 1, 1,
-1.485469, -1.174614, -1.573586, 1, 1, 1, 1, 1,
-1.483097, -0.7943836, -4.279784, 1, 1, 1, 1, 1,
-1.469563, 0.2671679, -0.1832581, 1, 1, 1, 1, 1,
-1.468462, -1.612685, -0.3623778, 1, 1, 1, 1, 1,
-1.465501, -0.5596214, -0.9349198, 1, 1, 1, 1, 1,
-1.453098, -2.028943, -2.461842, 0, 0, 1, 1, 1,
-1.448028, 0.06902404, -2.705566, 1, 0, 0, 1, 1,
-1.436447, 1.144763, -1.056359, 1, 0, 0, 1, 1,
-1.433322, -0.6505358, -2.631257, 1, 0, 0, 1, 1,
-1.408231, 0.8803042, -1.252382, 1, 0, 0, 1, 1,
-1.400524, 1.39234, -3.14896, 1, 0, 0, 1, 1,
-1.39705, -2.162371, -1.839551, 0, 0, 0, 1, 1,
-1.396122, 0.3103532, -2.778269, 0, 0, 0, 1, 1,
-1.393623, 2.108519, -0.5961953, 0, 0, 0, 1, 1,
-1.387041, 0.8717946, -0.23558, 0, 0, 0, 1, 1,
-1.385768, 1.519864, -2.109567, 0, 0, 0, 1, 1,
-1.384052, 0.9910879, -2.141776, 0, 0, 0, 1, 1,
-1.370271, -1.227237, -1.981551, 0, 0, 0, 1, 1,
-1.356438, 0.4274221, -1.595152, 1, 1, 1, 1, 1,
-1.347284, -1.117383, -2.71989, 1, 1, 1, 1, 1,
-1.346347, -1.780111, -1.765264, 1, 1, 1, 1, 1,
-1.341736, 0.8605676, -3.054949, 1, 1, 1, 1, 1,
-1.334679, -0.2605615, -3.090518, 1, 1, 1, 1, 1,
-1.328344, 0.8739185, -2.082998, 1, 1, 1, 1, 1,
-1.326946, -0.1862825, -2.939563, 1, 1, 1, 1, 1,
-1.316214, 0.2120944, -0.5161737, 1, 1, 1, 1, 1,
-1.315728, -0.9535624, -2.381975, 1, 1, 1, 1, 1,
-1.305858, 3.329115, 2.207049, 1, 1, 1, 1, 1,
-1.296198, -0.3453358, -2.812281, 1, 1, 1, 1, 1,
-1.279762, 1.096663, 0.6203306, 1, 1, 1, 1, 1,
-1.279532, -1.460113, -3.032833, 1, 1, 1, 1, 1,
-1.273877, -0.8935724, -1.445497, 1, 1, 1, 1, 1,
-1.265369, -0.4541555, -2.502181, 1, 1, 1, 1, 1,
-1.261583, 1.380439, -0.2027137, 0, 0, 1, 1, 1,
-1.258864, 0.02787538, -3.292603, 1, 0, 0, 1, 1,
-1.256288, 1.138803, -0.2250396, 1, 0, 0, 1, 1,
-1.251353, -1.351583, -3.59181, 1, 0, 0, 1, 1,
-1.244683, 1.898162, 0.3147537, 1, 0, 0, 1, 1,
-1.244651, 0.2911907, -1.571277, 1, 0, 0, 1, 1,
-1.242724, -0.03799275, -0.2190084, 0, 0, 0, 1, 1,
-1.240777, -0.3880114, -2.414147, 0, 0, 0, 1, 1,
-1.235102, -1.441164, -2.400778, 0, 0, 0, 1, 1,
-1.206765, 4.021019, -1.755625, 0, 0, 0, 1, 1,
-1.203734, 0.1219215, -1.378158, 0, 0, 0, 1, 1,
-1.202776, 0.3433409, -1.014287, 0, 0, 0, 1, 1,
-1.198242, -2.276878, -3.264236, 0, 0, 0, 1, 1,
-1.19656, 1.379446, -2.074759, 1, 1, 1, 1, 1,
-1.195639, -0.9993463, -3.290868, 1, 1, 1, 1, 1,
-1.195318, 1.013072, -1.898588, 1, 1, 1, 1, 1,
-1.194158, -0.416831, -1.953098, 1, 1, 1, 1, 1,
-1.192559, 2.315857, -0.4402923, 1, 1, 1, 1, 1,
-1.185, 2.289407, 0.3051728, 1, 1, 1, 1, 1,
-1.184126, 1.245336, 0.4666978, 1, 1, 1, 1, 1,
-1.181714, -0.3677259, -1.388712, 1, 1, 1, 1, 1,
-1.17567, -0.1193796, -2.36469, 1, 1, 1, 1, 1,
-1.169738, -1.137521, -4.701494, 1, 1, 1, 1, 1,
-1.163316, 1.396402, -1.112545, 1, 1, 1, 1, 1,
-1.155819, 1.167836, 0.9557132, 1, 1, 1, 1, 1,
-1.152327, 0.935957, -1.289532, 1, 1, 1, 1, 1,
-1.147135, -0.2233316, -0.1834135, 1, 1, 1, 1, 1,
-1.143606, -0.08176421, -3.431347, 1, 1, 1, 1, 1,
-1.140247, 0.1643165, -2.320643, 0, 0, 1, 1, 1,
-1.136564, -1.854543, -4.262947, 1, 0, 0, 1, 1,
-1.129045, -0.9516134, -1.864035, 1, 0, 0, 1, 1,
-1.120988, 2.244646, -2.590544, 1, 0, 0, 1, 1,
-1.120692, -0.6535401, -1.662042, 1, 0, 0, 1, 1,
-1.118315, -0.9191663, -3.240243, 1, 0, 0, 1, 1,
-1.116014, -0.1155426, -1.2079, 0, 0, 0, 1, 1,
-1.111654, 1.30219, -1.782295, 0, 0, 0, 1, 1,
-1.104357, 0.04547162, -1.643007, 0, 0, 0, 1, 1,
-1.102787, 0.3205683, -2.90938, 0, 0, 0, 1, 1,
-1.101921, -0.4742969, -1.851828, 0, 0, 0, 1, 1,
-1.099259, -1.173011, -2.34386, 0, 0, 0, 1, 1,
-1.097028, 0.8360767, -0.4519328, 0, 0, 0, 1, 1,
-1.090908, 0.4978989, 0.07472258, 1, 1, 1, 1, 1,
-1.080284, 0.9543051, -0.6552554, 1, 1, 1, 1, 1,
-1.071888, 1.289619, 0.899738, 1, 1, 1, 1, 1,
-1.070875, 0.6963125, -2.546403, 1, 1, 1, 1, 1,
-1.069074, -0.8423735, -1.282056, 1, 1, 1, 1, 1,
-1.06199, -0.1576544, -3.100695, 1, 1, 1, 1, 1,
-1.061872, 0.4896249, -1.348172, 1, 1, 1, 1, 1,
-1.058582, 1.248245, -0.163719, 1, 1, 1, 1, 1,
-1.056132, 0.7800392, 0.1986538, 1, 1, 1, 1, 1,
-1.039292, -0.1299347, -1.335261, 1, 1, 1, 1, 1,
-1.039182, 0.5848867, -1.332547, 1, 1, 1, 1, 1,
-1.024789, 0.4397196, 0.2131054, 1, 1, 1, 1, 1,
-1.007106, 1.171202, -1.653111, 1, 1, 1, 1, 1,
-1.001957, 0.9864875, -0.7069991, 1, 1, 1, 1, 1,
-1.00013, 2.302241, -1.277858, 1, 1, 1, 1, 1,
-0.9980771, 1.606902, 0.2309927, 0, 0, 1, 1, 1,
-0.9945932, -1.593827, -3.684785, 1, 0, 0, 1, 1,
-0.9870567, 0.2810076, -2.542951, 1, 0, 0, 1, 1,
-0.9780245, 0.6370757, 0.2510131, 1, 0, 0, 1, 1,
-0.9706478, 1.223542, 0.6955169, 1, 0, 0, 1, 1,
-0.9654737, 1.423996, 1.132394, 1, 0, 0, 1, 1,
-0.963818, 2.238249, -0.4684673, 0, 0, 0, 1, 1,
-0.9602797, 1.090212, -2.794148, 0, 0, 0, 1, 1,
-0.9557931, -0.7841684, -3.446602, 0, 0, 0, 1, 1,
-0.9545938, 1.189935, -1.553694, 0, 0, 0, 1, 1,
-0.941016, 0.2190224, -2.455226, 0, 0, 0, 1, 1,
-0.9286362, 0.4605219, -1.284399, 0, 0, 0, 1, 1,
-0.9285385, 0.7969115, -0.1404141, 0, 0, 0, 1, 1,
-0.9278582, 2.545851, -1.219391, 1, 1, 1, 1, 1,
-0.9243688, -0.05766713, -0.8352164, 1, 1, 1, 1, 1,
-0.9222462, 0.4194003, -0.9419809, 1, 1, 1, 1, 1,
-0.9025949, -0.1978467, -2.458799, 1, 1, 1, 1, 1,
-0.9018583, 0.843355, -1.489767, 1, 1, 1, 1, 1,
-0.897163, -0.8154991, -0.3647522, 1, 1, 1, 1, 1,
-0.8930015, -0.1414004, -1.903026, 1, 1, 1, 1, 1,
-0.89216, 0.4907255, -0.6179713, 1, 1, 1, 1, 1,
-0.8915946, 1.195322, -0.4717161, 1, 1, 1, 1, 1,
-0.8868619, -0.4871495, -2.901351, 1, 1, 1, 1, 1,
-0.8864334, 1.259126, -0.9085749, 1, 1, 1, 1, 1,
-0.8834826, -0.1357689, -1.925866, 1, 1, 1, 1, 1,
-0.8642609, -0.5905578, 0.05670364, 1, 1, 1, 1, 1,
-0.8642103, -0.2941766, -3.493355, 1, 1, 1, 1, 1,
-0.8622556, -0.4471943, -1.969268, 1, 1, 1, 1, 1,
-0.8549801, 0.1234187, -1.507365, 0, 0, 1, 1, 1,
-0.8356493, -0.3441818, -2.589676, 1, 0, 0, 1, 1,
-0.8182366, 1.234218, -1.12064, 1, 0, 0, 1, 1,
-0.8083745, -1.321942, -0.9890187, 1, 0, 0, 1, 1,
-0.8050582, 2.7223, 0.7376336, 1, 0, 0, 1, 1,
-0.8023259, -0.8050596, -2.918156, 1, 0, 0, 1, 1,
-0.8020138, -1.130804, -1.982432, 0, 0, 0, 1, 1,
-0.7906399, -0.4521834, -2.855878, 0, 0, 0, 1, 1,
-0.7859442, 2.59458, -1.072764, 0, 0, 0, 1, 1,
-0.785389, 1.878027, 1.007187, 0, 0, 0, 1, 1,
-0.7852759, -0.8649336, -2.092191, 0, 0, 0, 1, 1,
-0.7825685, -0.7479682, -1.422437, 0, 0, 0, 1, 1,
-0.7824637, -1.025103, -4.79692, 0, 0, 0, 1, 1,
-0.7818936, 0.5213622, -1.697114, 1, 1, 1, 1, 1,
-0.7814831, -1.007938, -2.128274, 1, 1, 1, 1, 1,
-0.7792935, 0.2697612, -1.455732, 1, 1, 1, 1, 1,
-0.7734038, -1.119942, -2.258132, 1, 1, 1, 1, 1,
-0.7681646, -1.522732, -3.071507, 1, 1, 1, 1, 1,
-0.7648598, -0.1969247, -1.01948, 1, 1, 1, 1, 1,
-0.7638541, -0.1899705, 0.3256241, 1, 1, 1, 1, 1,
-0.7591877, -0.6172519, -2.115589, 1, 1, 1, 1, 1,
-0.7541518, -1.31117, -2.918565, 1, 1, 1, 1, 1,
-0.7521867, 0.6524374, -0.02748357, 1, 1, 1, 1, 1,
-0.7493365, -0.1750095, -0.9047058, 1, 1, 1, 1, 1,
-0.7449937, -0.2904483, -0.4765778, 1, 1, 1, 1, 1,
-0.7443883, -1.122694, -4.017773, 1, 1, 1, 1, 1,
-0.742193, -1.173541, -4.490764, 1, 1, 1, 1, 1,
-0.7404385, 1.262407, -0.4679466, 1, 1, 1, 1, 1,
-0.7391156, 0.5542028, -0.5645271, 0, 0, 1, 1, 1,
-0.7383037, 0.7176837, -0.5653731, 1, 0, 0, 1, 1,
-0.7378013, -0.143807, -3.172395, 1, 0, 0, 1, 1,
-0.7329972, 1.182682, 0.005983943, 1, 0, 0, 1, 1,
-0.7322153, -0.1617326, -1.570611, 1, 0, 0, 1, 1,
-0.7321604, -0.7127219, -1.632494, 1, 0, 0, 1, 1,
-0.7275853, -0.9815379, -2.117611, 0, 0, 0, 1, 1,
-0.7223729, 0.8795136, -0.8604422, 0, 0, 0, 1, 1,
-0.7202184, -0.1297419, -1.967464, 0, 0, 0, 1, 1,
-0.7199878, 0.7556139, 1.058214, 0, 0, 0, 1, 1,
-0.7164865, 0.8155653, -1.525788, 0, 0, 0, 1, 1,
-0.7125089, -1.789819, -2.79557, 0, 0, 0, 1, 1,
-0.7077157, -0.396677, -1.853259, 0, 0, 0, 1, 1,
-0.6984863, -2.022615, -2.416113, 1, 1, 1, 1, 1,
-0.6937228, -1.527373, -3.076866, 1, 1, 1, 1, 1,
-0.6730807, 0.8625517, 0.7323879, 1, 1, 1, 1, 1,
-0.6663155, -0.8963693, -4.351974, 1, 1, 1, 1, 1,
-0.6627649, 0.983824, -0.7471989, 1, 1, 1, 1, 1,
-0.6627277, -0.2346471, -1.155083, 1, 1, 1, 1, 1,
-0.6607348, -0.956645, -2.917695, 1, 1, 1, 1, 1,
-0.6591582, 0.6986494, -1.483674, 1, 1, 1, 1, 1,
-0.6572269, -1.138712, -3.105199, 1, 1, 1, 1, 1,
-0.6520682, 0.1600072, -1.034746, 1, 1, 1, 1, 1,
-0.6483408, -1.284982, -3.210056, 1, 1, 1, 1, 1,
-0.6463821, -1.098788, -1.96133, 1, 1, 1, 1, 1,
-0.6447909, -0.4289246, -1.906645, 1, 1, 1, 1, 1,
-0.6437719, 0.7060673, 0.5951005, 1, 1, 1, 1, 1,
-0.6427025, -1.259439, -2.358635, 1, 1, 1, 1, 1,
-0.6409307, 0.3355117, -1.236958, 0, 0, 1, 1, 1,
-0.6373544, 0.4680048, -1.497879, 1, 0, 0, 1, 1,
-0.6312394, -0.4679874, -1.681497, 1, 0, 0, 1, 1,
-0.6293059, -0.05694713, -1.643576, 1, 0, 0, 1, 1,
-0.6244897, -1.367484, -1.589231, 1, 0, 0, 1, 1,
-0.6185143, 0.2178199, -2.112499, 1, 0, 0, 1, 1,
-0.6160561, -0.2080703, -1.705056, 0, 0, 0, 1, 1,
-0.6135504, -0.07077517, -2.002721, 0, 0, 0, 1, 1,
-0.6105285, -0.8677024, -2.895134, 0, 0, 0, 1, 1,
-0.6092919, 0.9675314, -2.174325, 0, 0, 0, 1, 1,
-0.603381, 1.28723, 0.4690227, 0, 0, 0, 1, 1,
-0.5975053, -0.5258325, -1.72071, 0, 0, 0, 1, 1,
-0.5961607, 1.259842, -0.7496386, 0, 0, 0, 1, 1,
-0.5949211, -0.8897817, -2.983455, 1, 1, 1, 1, 1,
-0.5886185, -0.8010759, -3.884878, 1, 1, 1, 1, 1,
-0.5879804, 0.2257563, -0.5649788, 1, 1, 1, 1, 1,
-0.5844276, 0.140071, -0.797911, 1, 1, 1, 1, 1,
-0.5799354, 0.02285439, -0.2124077, 1, 1, 1, 1, 1,
-0.5798851, -0.2316475, -1.252112, 1, 1, 1, 1, 1,
-0.5784075, -0.7013876, -3.555355, 1, 1, 1, 1, 1,
-0.576134, 0.3180157, -4.123892, 1, 1, 1, 1, 1,
-0.5741613, 1.151305, 0.4230372, 1, 1, 1, 1, 1,
-0.5735942, 0.2327854, -3.269002, 1, 1, 1, 1, 1,
-0.5725908, 0.2728515, -1.482543, 1, 1, 1, 1, 1,
-0.5678428, -1.894713, -2.537974, 1, 1, 1, 1, 1,
-0.5653198, 0.8471163, 0.1636784, 1, 1, 1, 1, 1,
-0.5652898, -1.454619, -2.964637, 1, 1, 1, 1, 1,
-0.5638185, -2.142546, -3.501385, 1, 1, 1, 1, 1,
-0.5607597, -0.1035311, -3.823476, 0, 0, 1, 1, 1,
-0.5573055, 0.2674319, -0.3729678, 1, 0, 0, 1, 1,
-0.5539923, 1.617912, -0.627528, 1, 0, 0, 1, 1,
-0.5532055, -0.9455558, -2.417036, 1, 0, 0, 1, 1,
-0.5502762, -0.2264124, -1.910033, 1, 0, 0, 1, 1,
-0.5501581, 2.668675, 2.00409, 1, 0, 0, 1, 1,
-0.5490197, -0.4558613, -1.398968, 0, 0, 0, 1, 1,
-0.5466527, 2.024137, -0.775517, 0, 0, 0, 1, 1,
-0.5455319, 0.738919, 0.01684806, 0, 0, 0, 1, 1,
-0.5426068, 0.2517501, -1.650608, 0, 0, 0, 1, 1,
-0.5381534, 0.1922409, -1.491314, 0, 0, 0, 1, 1,
-0.5368294, -0.8842317, -1.936132, 0, 0, 0, 1, 1,
-0.5355937, 0.05077577, -2.030174, 0, 0, 0, 1, 1,
-0.5278235, -1.460915, -1.420516, 1, 1, 1, 1, 1,
-0.525696, 0.4050324, -0.09373089, 1, 1, 1, 1, 1,
-0.5236191, -1.392139, -3.577001, 1, 1, 1, 1, 1,
-0.5230563, 0.03880037, -1.317324, 1, 1, 1, 1, 1,
-0.5224036, 0.4078825, -0.593856, 1, 1, 1, 1, 1,
-0.5213637, 0.8678294, 0.2867561, 1, 1, 1, 1, 1,
-0.5192676, 1.101063, -1.506066, 1, 1, 1, 1, 1,
-0.5184696, 0.3204528, -1.431194, 1, 1, 1, 1, 1,
-0.5184588, 0.06729356, -1.328273, 1, 1, 1, 1, 1,
-0.5169932, -0.4161987, -2.914647, 1, 1, 1, 1, 1,
-0.5157164, -1.47184, -2.209667, 1, 1, 1, 1, 1,
-0.5153311, -0.5163801, -2.28831, 1, 1, 1, 1, 1,
-0.5152482, 0.4447666, -0.2897357, 1, 1, 1, 1, 1,
-0.5151051, -0.8872914, -3.479214, 1, 1, 1, 1, 1,
-0.5130531, 1.871309, -0.384506, 1, 1, 1, 1, 1,
-0.5129122, 0.7263036, -1.578454, 0, 0, 1, 1, 1,
-0.5088198, 0.2147881, -0.4191467, 1, 0, 0, 1, 1,
-0.5055873, 1.128624, 0.5353345, 1, 0, 0, 1, 1,
-0.5050685, 0.5863537, -0.3551899, 1, 0, 0, 1, 1,
-0.5043451, -0.7654693, -3.911289, 1, 0, 0, 1, 1,
-0.50356, -0.9805621, -3.449153, 1, 0, 0, 1, 1,
-0.5000806, 0.1325289, -0.5778899, 0, 0, 0, 1, 1,
-0.4995223, 0.2703013, -1.180761, 0, 0, 0, 1, 1,
-0.4968104, 2.130585, -0.1917717, 0, 0, 0, 1, 1,
-0.4965854, 0.303731, -2.15782, 0, 0, 0, 1, 1,
-0.4956438, -0.4313712, -3.568276, 0, 0, 0, 1, 1,
-0.4929576, 0.5716866, -1.260532, 0, 0, 0, 1, 1,
-0.4802765, 0.9991134, -0.03454206, 0, 0, 0, 1, 1,
-0.4719153, 0.3262476, -1.333097, 1, 1, 1, 1, 1,
-0.4706073, 0.09614121, -1.461509, 1, 1, 1, 1, 1,
-0.4680492, 1.034814, 0.2620846, 1, 1, 1, 1, 1,
-0.4676196, -0.3708359, -3.180487, 1, 1, 1, 1, 1,
-0.4667853, -2.050563, -2.560758, 1, 1, 1, 1, 1,
-0.4625295, -1.339056, -2.625962, 1, 1, 1, 1, 1,
-0.4586985, -0.04392691, -1.855458, 1, 1, 1, 1, 1,
-0.4526724, 1.24231, 0.2008601, 1, 1, 1, 1, 1,
-0.4521931, 0.06126113, 0.3297423, 1, 1, 1, 1, 1,
-0.4467156, -0.6671027, -2.809039, 1, 1, 1, 1, 1,
-0.4429349, -1.264973, -2.425485, 1, 1, 1, 1, 1,
-0.4348931, 0.986757, -2.349805, 1, 1, 1, 1, 1,
-0.4323262, 0.1544505, -1.774566, 1, 1, 1, 1, 1,
-0.4289962, 2.051636, -0.1996731, 1, 1, 1, 1, 1,
-0.4217159, 0.7132198, -1.475061, 1, 1, 1, 1, 1,
-0.4188384, 0.3940691, -0.5413901, 0, 0, 1, 1, 1,
-0.41802, 1.755376, 0.6905358, 1, 0, 0, 1, 1,
-0.4162259, 0.7653419, -1.071519, 1, 0, 0, 1, 1,
-0.4153115, 0.2444776, -1.787767, 1, 0, 0, 1, 1,
-0.4140258, 0.5841462, 0.08019254, 1, 0, 0, 1, 1,
-0.4082164, -1.122673, -3.072826, 1, 0, 0, 1, 1,
-0.4017881, -1.632379, -2.276798, 0, 0, 0, 1, 1,
-0.3980143, -0.02758246, -2.859063, 0, 0, 0, 1, 1,
-0.39062, 0.2994367, -1.421806, 0, 0, 0, 1, 1,
-0.3868863, -0.7753692, -3.111346, 0, 0, 0, 1, 1,
-0.3853925, -0.3936827, -2.885978, 0, 0, 0, 1, 1,
-0.3814877, -2.161076, -3.588079, 0, 0, 0, 1, 1,
-0.3806023, -0.7927158, -4.072734, 0, 0, 0, 1, 1,
-0.3801103, 0.3356102, -2.226469, 1, 1, 1, 1, 1,
-0.3778694, 0.782333, -0.8962964, 1, 1, 1, 1, 1,
-0.376796, 0.7398603, 1.245521, 1, 1, 1, 1, 1,
-0.3711711, -0.8932466, -3.726579, 1, 1, 1, 1, 1,
-0.3700173, 1.378099, -0.9893238, 1, 1, 1, 1, 1,
-0.3663014, -1.285111, -2.339378, 1, 1, 1, 1, 1,
-0.3657023, -0.4867963, -5.137112, 1, 1, 1, 1, 1,
-0.3649569, 0.634465, 1.101753, 1, 1, 1, 1, 1,
-0.3572542, -0.408838, -1.358855, 1, 1, 1, 1, 1,
-0.3553979, 0.165327, -0.5930438, 1, 1, 1, 1, 1,
-0.3537998, -2.015862, -4.748182, 1, 1, 1, 1, 1,
-0.3402134, 0.04579232, -1.48641, 1, 1, 1, 1, 1,
-0.3389071, 1.306996, -0.1001171, 1, 1, 1, 1, 1,
-0.3361914, 0.964104, -0.6654202, 1, 1, 1, 1, 1,
-0.3359671, -0.820833, -3.921224, 1, 1, 1, 1, 1,
-0.3340807, -0.5170915, -1.736746, 0, 0, 1, 1, 1,
-0.3340786, 0.01448178, -0.7999511, 1, 0, 0, 1, 1,
-0.3327117, 0.2096285, 0.3019893, 1, 0, 0, 1, 1,
-0.3284367, -1.635225, -2.954739, 1, 0, 0, 1, 1,
-0.3269479, 1.269047, 0.2999268, 1, 0, 0, 1, 1,
-0.3269439, 0.7074075, -0.4150201, 1, 0, 0, 1, 1,
-0.3266158, 0.2075205, -0.5094526, 0, 0, 0, 1, 1,
-0.3218192, 0.7258441, 0.2124533, 0, 0, 0, 1, 1,
-0.3207384, -0.2270242, -1.110316, 0, 0, 0, 1, 1,
-0.3177263, 0.3609326, -0.7083084, 0, 0, 0, 1, 1,
-0.3116238, 0.6583826, -0.05670185, 0, 0, 0, 1, 1,
-0.3092894, 1.786693, 0.7437569, 0, 0, 0, 1, 1,
-0.3081001, 0.2540138, -1.088986, 0, 0, 0, 1, 1,
-0.3073465, 1.15001, 1.249054, 1, 1, 1, 1, 1,
-0.3064838, 1.310386, -0.3971529, 1, 1, 1, 1, 1,
-0.3061758, 0.204614, 0.3344046, 1, 1, 1, 1, 1,
-0.3061272, 0.6316409, -0.6430505, 1, 1, 1, 1, 1,
-0.3050654, 1.19881, 0.5494883, 1, 1, 1, 1, 1,
-0.300762, 1.158603, -0.4241194, 1, 1, 1, 1, 1,
-0.2994731, -0.7639527, -4.886509, 1, 1, 1, 1, 1,
-0.2973789, -0.05799682, -1.697626, 1, 1, 1, 1, 1,
-0.2945317, 1.526726, -2.58262, 1, 1, 1, 1, 1,
-0.2886548, -0.3832375, -3.815425, 1, 1, 1, 1, 1,
-0.2863582, 0.7482257, -1.696657, 1, 1, 1, 1, 1,
-0.2857832, 0.6635713, -0.4650366, 1, 1, 1, 1, 1,
-0.28242, 0.1512737, -2.764917, 1, 1, 1, 1, 1,
-0.282347, -1.449645, -1.521108, 1, 1, 1, 1, 1,
-0.2766855, 1.423721, -0.6377537, 1, 1, 1, 1, 1,
-0.2742418, -0.2381511, -3.470707, 0, 0, 1, 1, 1,
-0.2736573, 0.3517278, -1.683195, 1, 0, 0, 1, 1,
-0.2708337, -0.4391696, -3.666108, 1, 0, 0, 1, 1,
-0.2683534, 0.2672847, -1.404893, 1, 0, 0, 1, 1,
-0.2674348, -0.2583749, -3.146718, 1, 0, 0, 1, 1,
-0.2635274, 0.3859464, -2.226503, 1, 0, 0, 1, 1,
-0.2606992, -1.199394, -3.504557, 0, 0, 0, 1, 1,
-0.2581534, 0.01969638, 0.3233852, 0, 0, 0, 1, 1,
-0.2563977, 1.662096, 0.6060439, 0, 0, 0, 1, 1,
-0.2562424, -1.193484, -1.971325, 0, 0, 0, 1, 1,
-0.2551435, 0.01163069, -3.501425, 0, 0, 0, 1, 1,
-0.2549288, -1.394691, -2.906518, 0, 0, 0, 1, 1,
-0.2537621, 1.849794, -0.9436359, 0, 0, 0, 1, 1,
-0.2534875, 0.3171676, 0.1140705, 1, 1, 1, 1, 1,
-0.252382, -0.3956503, -2.059081, 1, 1, 1, 1, 1,
-0.2519185, 1.445581, -0.1933197, 1, 1, 1, 1, 1,
-0.2517652, 0.3169525, -0.6920488, 1, 1, 1, 1, 1,
-0.2510209, 2.219707, -1.934784, 1, 1, 1, 1, 1,
-0.2472364, -0.8288601, -2.597544, 1, 1, 1, 1, 1,
-0.2444497, 1.772441, -2.02443, 1, 1, 1, 1, 1,
-0.2393962, 0.9441287, -1.012743, 1, 1, 1, 1, 1,
-0.2383704, -0.05873726, -2.242601, 1, 1, 1, 1, 1,
-0.2383672, -0.1206403, -0.8424375, 1, 1, 1, 1, 1,
-0.2361637, 0.9719768, 0.3911501, 1, 1, 1, 1, 1,
-0.2359076, -0.8349669, -3.003097, 1, 1, 1, 1, 1,
-0.2331513, -0.4871541, -4.290632, 1, 1, 1, 1, 1,
-0.2302007, 0.1233905, -1.802783, 1, 1, 1, 1, 1,
-0.2279558, 0.06899799, -0.4855808, 1, 1, 1, 1, 1,
-0.2271373, 0.2426674, 1.853972, 0, 0, 1, 1, 1,
-0.2260024, -0.7406917, -3.921225, 1, 0, 0, 1, 1,
-0.2197122, 0.3433431, -1.335007, 1, 0, 0, 1, 1,
-0.2170334, -1.925608, -3.482196, 1, 0, 0, 1, 1,
-0.2165628, 0.4925728, 0.2949008, 1, 0, 0, 1, 1,
-0.2152158, -1.747147, -4.99352, 1, 0, 0, 1, 1,
-0.2145542, -0.6657807, -2.746365, 0, 0, 0, 1, 1,
-0.2144907, 0.4635934, -0.8709301, 0, 0, 0, 1, 1,
-0.2114174, -0.3719171, -1.975315, 0, 0, 0, 1, 1,
-0.2111497, -0.282575, -2.678882, 0, 0, 0, 1, 1,
-0.2101777, 0.2698556, 0.2658131, 0, 0, 0, 1, 1,
-0.2060323, -1.543877, -4.08823, 0, 0, 0, 1, 1,
-0.2054881, -0.6982659, -3.127472, 0, 0, 0, 1, 1,
-0.2052961, -0.5413454, -2.327556, 1, 1, 1, 1, 1,
-0.2021718, 0.6046636, -0.06640191, 1, 1, 1, 1, 1,
-0.2008455, -1.425016, -2.816897, 1, 1, 1, 1, 1,
-0.2001386, 0.05954266, -2.398741, 1, 1, 1, 1, 1,
-0.1986059, -1.107499, -3.954756, 1, 1, 1, 1, 1,
-0.1954774, 2.448887, 1.341001, 1, 1, 1, 1, 1,
-0.194859, -1.106837, -4.476005, 1, 1, 1, 1, 1,
-0.1925112, -0.2869597, -3.059506, 1, 1, 1, 1, 1,
-0.1911682, 0.351696, 0.7303981, 1, 1, 1, 1, 1,
-0.1880337, -0.4027117, -1.430021, 1, 1, 1, 1, 1,
-0.1879972, -0.2199609, 0.7498, 1, 1, 1, 1, 1,
-0.184582, 0.7145822, 1.058452, 1, 1, 1, 1, 1,
-0.1791523, -1.980251, -1.670657, 1, 1, 1, 1, 1,
-0.1773123, -0.7281563, -2.552987, 1, 1, 1, 1, 1,
-0.1730159, 1.397812, -2.399103, 1, 1, 1, 1, 1,
-0.1714725, -0.382207, -1.865691, 0, 0, 1, 1, 1,
-0.1620095, 0.8531008, -1.340524, 1, 0, 0, 1, 1,
-0.1616329, -0.5050157, -3.155929, 1, 0, 0, 1, 1,
-0.1611762, -0.8309433, -1.898367, 1, 0, 0, 1, 1,
-0.1567403, 1.602834, 0.1016258, 1, 0, 0, 1, 1,
-0.1520723, -0.1531566, -3.160691, 1, 0, 0, 1, 1,
-0.1487944, -0.05484202, -0.9683455, 0, 0, 0, 1, 1,
-0.1458181, 0.06395047, -0.6723263, 0, 0, 0, 1, 1,
-0.1455013, 0.000361072, -0.9809881, 0, 0, 0, 1, 1,
-0.144166, -1.426327, -2.959805, 0, 0, 0, 1, 1,
-0.1355615, -0.5434338, -2.570749, 0, 0, 0, 1, 1,
-0.1330675, -0.1125702, -3.093253, 0, 0, 0, 1, 1,
-0.1327629, -0.507093, -1.865696, 0, 0, 0, 1, 1,
-0.1235993, -1.256349, -2.099669, 1, 1, 1, 1, 1,
-0.1231749, 1.536182, -0.8946599, 1, 1, 1, 1, 1,
-0.1215218, 1.063767, 0.6190997, 1, 1, 1, 1, 1,
-0.1200663, 0.08398181, -0.2737904, 1, 1, 1, 1, 1,
-0.1188506, 0.9552861, -0.4420954, 1, 1, 1, 1, 1,
-0.1145815, 0.6100721, 0.1269853, 1, 1, 1, 1, 1,
-0.1143009, -0.8018584, -0.997897, 1, 1, 1, 1, 1,
-0.1098972, 1.491637, -0.0616647, 1, 1, 1, 1, 1,
-0.1097947, -0.1292342, -4.504579, 1, 1, 1, 1, 1,
-0.1094452, 1.115462, 0.4478997, 1, 1, 1, 1, 1,
-0.1045262, 0.5419379, 1.268763, 1, 1, 1, 1, 1,
-0.104488, -1.184172, -2.025611, 1, 1, 1, 1, 1,
-0.1037335, 0.2074257, -0.9458061, 1, 1, 1, 1, 1,
-0.1008871, -0.9392004, -3.899395, 1, 1, 1, 1, 1,
-0.09800936, -1.076197, -2.146061, 1, 1, 1, 1, 1,
-0.09553341, -0.184991, -2.006523, 0, 0, 1, 1, 1,
-0.08949175, -0.5658852, -3.784415, 1, 0, 0, 1, 1,
-0.08927768, 0.2575685, -0.362715, 1, 0, 0, 1, 1,
-0.08912122, -1.340907, -4.430312, 1, 0, 0, 1, 1,
-0.08900972, -1.640138, -3.10582, 1, 0, 0, 1, 1,
-0.08878671, -0.6991832, -2.805218, 1, 0, 0, 1, 1,
-0.08810081, 0.06421121, -0.3183858, 0, 0, 0, 1, 1,
-0.08737709, 0.9516349, 1.889601, 0, 0, 0, 1, 1,
-0.08600295, 0.5104889, 0.1667987, 0, 0, 0, 1, 1,
-0.08526207, -0.3609628, -3.417552, 0, 0, 0, 1, 1,
-0.0832094, -0.1388835, -2.110409, 0, 0, 0, 1, 1,
-0.08299766, -0.2349108, -1.355069, 0, 0, 0, 1, 1,
-0.07970077, -0.1127896, -0.6811089, 0, 0, 0, 1, 1,
-0.0795847, 0.349556, -1.589875, 1, 1, 1, 1, 1,
-0.07865393, -0.2075577, -2.199485, 1, 1, 1, 1, 1,
-0.07792176, 0.1573874, -0.1610529, 1, 1, 1, 1, 1,
-0.07635204, -1.179232, -3.93904, 1, 1, 1, 1, 1,
-0.07287729, -1.704778, -1.870155, 1, 1, 1, 1, 1,
-0.07185422, 0.1709312, 0.8699664, 1, 1, 1, 1, 1,
-0.06947312, 0.2293321, 0.07899135, 1, 1, 1, 1, 1,
-0.06932689, 1.988421, 0.08352913, 1, 1, 1, 1, 1,
-0.06618622, 0.8261406, 1.260085, 1, 1, 1, 1, 1,
-0.06272274, 0.1147641, -0.6003925, 1, 1, 1, 1, 1,
-0.06093055, 1.608503, -0.8374023, 1, 1, 1, 1, 1,
-0.05778879, -0.8155607, -3.220975, 1, 1, 1, 1, 1,
-0.05645576, -1.283688, -1.654369, 1, 1, 1, 1, 1,
-0.05485089, -0.8116121, -2.531292, 1, 1, 1, 1, 1,
-0.05219842, -0.1847456, -1.880579, 1, 1, 1, 1, 1,
-0.05162178, -0.466624, -3.139778, 0, 0, 1, 1, 1,
-0.0499226, 0.2637595, -2.40606, 1, 0, 0, 1, 1,
-0.04926159, 0.3004614, -0.2479686, 1, 0, 0, 1, 1,
-0.04062334, 2.217746, -0.5151056, 1, 0, 0, 1, 1,
-0.03757045, -0.7953199, -4.813286, 1, 0, 0, 1, 1,
-0.03402738, 0.5084043, -0.9327642, 1, 0, 0, 1, 1,
-0.03334272, 0.5142609, -1.853636, 0, 0, 0, 1, 1,
-0.032882, -0.2491912, -3.3056, 0, 0, 0, 1, 1,
-0.02689137, 1.161633, -0.1696015, 0, 0, 0, 1, 1,
-0.02508175, -1.436055, -2.995988, 0, 0, 0, 1, 1,
-0.02280266, -1.853066, -3.589303, 0, 0, 0, 1, 1,
-0.02158688, -1.968976, -2.478289, 0, 0, 0, 1, 1,
-0.01332823, 0.595723, 0.9531804, 0, 0, 0, 1, 1,
-0.01323992, 1.56575, -0.934192, 1, 1, 1, 1, 1,
-0.01190639, 1.085237, 1.4293, 1, 1, 1, 1, 1,
-0.01166582, 1.339158, 0.4697899, 1, 1, 1, 1, 1,
-0.01101985, -0.4797511, -3.712929, 1, 1, 1, 1, 1,
-0.009687332, 0.6861308, -0.5510827, 1, 1, 1, 1, 1,
-0.007635341, -0.5461349, -2.848938, 1, 1, 1, 1, 1,
-0.003553035, 0.1634258, 1.441123, 1, 1, 1, 1, 1,
-0.0003567743, 2.53956, -1.761022, 1, 1, 1, 1, 1,
0.0005736166, 0.2077837, 0.98208, 1, 1, 1, 1, 1,
0.0009112803, -1.085565, 2.859705, 1, 1, 1, 1, 1,
0.001678826, -0.2823695, 4.332941, 1, 1, 1, 1, 1,
0.008036174, -0.9355218, 4.166651, 1, 1, 1, 1, 1,
0.008885805, -0.3027709, 5.03449, 1, 1, 1, 1, 1,
0.009181858, -1.659278, 3.960568, 1, 1, 1, 1, 1,
0.01043225, -1.672838, 4.276238, 1, 1, 1, 1, 1,
0.01118408, 0.965938, 2.518474, 0, 0, 1, 1, 1,
0.01129097, 0.07840844, -0.9317837, 1, 0, 0, 1, 1,
0.01227404, 1.62679, -0.1398242, 1, 0, 0, 1, 1,
0.01300654, -1.295916, 1.066237, 1, 0, 0, 1, 1,
0.01847423, 0.7647895, 1.170904, 1, 0, 0, 1, 1,
0.01946762, -0.3250999, 0.7340291, 1, 0, 0, 1, 1,
0.0209171, -1.921989, 2.249365, 0, 0, 0, 1, 1,
0.02156813, 0.3579642, -0.1376977, 0, 0, 0, 1, 1,
0.02412335, 0.04063112, -0.2115251, 0, 0, 0, 1, 1,
0.02471286, 1.468562, 0.5804195, 0, 0, 0, 1, 1,
0.02531089, -0.638227, 4.611978, 0, 0, 0, 1, 1,
0.02842143, -0.5779685, 4.741608, 0, 0, 0, 1, 1,
0.03214252, 0.9263495, 0.741065, 0, 0, 0, 1, 1,
0.03338506, 0.5611287, -1.380705, 1, 1, 1, 1, 1,
0.0336308, -0.4604171, 1.319729, 1, 1, 1, 1, 1,
0.03701559, -1.020004, 3.370771, 1, 1, 1, 1, 1,
0.03705964, 2.053228, 2.476579, 1, 1, 1, 1, 1,
0.0395187, -0.6577294, 2.985918, 1, 1, 1, 1, 1,
0.04126862, 0.5847143, 0.04522895, 1, 1, 1, 1, 1,
0.04237473, 0.6743984, -0.4987096, 1, 1, 1, 1, 1,
0.04254802, 0.8936458, -0.444752, 1, 1, 1, 1, 1,
0.04274907, 1.031839, 1.933788, 1, 1, 1, 1, 1,
0.04374323, 0.02568348, -0.1695097, 1, 1, 1, 1, 1,
0.04408499, -1.062803, 2.768089, 1, 1, 1, 1, 1,
0.04573969, 0.8495049, -1.254581, 1, 1, 1, 1, 1,
0.04628027, -0.8534441, 1.91342, 1, 1, 1, 1, 1,
0.0522143, -0.4568471, 2.60104, 1, 1, 1, 1, 1,
0.0572128, 1.020809, -0.4036837, 1, 1, 1, 1, 1,
0.05774958, -1.629068, 2.052987, 0, 0, 1, 1, 1,
0.0618874, 0.4387759, 1.213764, 1, 0, 0, 1, 1,
0.06286059, 0.1300628, 0.8698827, 1, 0, 0, 1, 1,
0.06537524, -1.805537, 4.93443, 1, 0, 0, 1, 1,
0.06654438, -0.649492, 2.42238, 1, 0, 0, 1, 1,
0.06932907, 0.766287, -0.8458036, 1, 0, 0, 1, 1,
0.06993391, 2.336756, 1.390685, 0, 0, 0, 1, 1,
0.07878626, -0.1874681, 4.450304, 0, 0, 0, 1, 1,
0.07978794, -0.1035096, 4.701366, 0, 0, 0, 1, 1,
0.08293669, -0.6003485, 2.402939, 0, 0, 0, 1, 1,
0.09005306, 0.7883894, 1.643678, 0, 0, 0, 1, 1,
0.09239285, 0.7003911, -0.3955431, 0, 0, 0, 1, 1,
0.09274, -1.321996, 2.124289, 0, 0, 0, 1, 1,
0.09307878, 1.325411, -1.091135, 1, 1, 1, 1, 1,
0.09308546, -2.582632, 1.978142, 1, 1, 1, 1, 1,
0.1006107, 0.5963562, 1.098468, 1, 1, 1, 1, 1,
0.1024317, -1.172034, 3.174869, 1, 1, 1, 1, 1,
0.1041347, 1.908312, 1.163433, 1, 1, 1, 1, 1,
0.1044628, 0.302774, -1.285489, 1, 1, 1, 1, 1,
0.1051924, 1.924128, -0.7493457, 1, 1, 1, 1, 1,
0.1244503, -0.1746723, 1.746909, 1, 1, 1, 1, 1,
0.1295101, -1.254815, 3.852588, 1, 1, 1, 1, 1,
0.1305148, -0.6634815, 3.177904, 1, 1, 1, 1, 1,
0.131177, -0.3631785, 2.545912, 1, 1, 1, 1, 1,
0.1384782, 1.504866, 1.043463, 1, 1, 1, 1, 1,
0.1398993, -0.6600348, 2.823056, 1, 1, 1, 1, 1,
0.1446322, 0.5048488, -0.5080894, 1, 1, 1, 1, 1,
0.145394, 1.401097, 2.28456, 1, 1, 1, 1, 1,
0.1493082, 0.7455625, 1.978438, 0, 0, 1, 1, 1,
0.1499446, -1.845146, 2.931876, 1, 0, 0, 1, 1,
0.1546822, -1.083136, 3.180747, 1, 0, 0, 1, 1,
0.1554786, 0.7461201, -0.8230496, 1, 0, 0, 1, 1,
0.1560185, -1.993638, 3.798761, 1, 0, 0, 1, 1,
0.1572167, -0.6229895, 2.781058, 1, 0, 0, 1, 1,
0.1628768, -0.1211566, 1.851704, 0, 0, 0, 1, 1,
0.1635975, 0.1342079, 0.3750986, 0, 0, 0, 1, 1,
0.1657065, -0.1241926, 2.907398, 0, 0, 0, 1, 1,
0.1676014, 0.6386977, 1.564298, 0, 0, 0, 1, 1,
0.1676487, 0.7803589, 0.08321409, 0, 0, 0, 1, 1,
0.169751, 0.8989245, -0.4001926, 0, 0, 0, 1, 1,
0.1742633, -1.051694, 1.787092, 0, 0, 0, 1, 1,
0.1778501, -2.179121, 5.186757, 1, 1, 1, 1, 1,
0.1787434, 0.8950559, 1.19251, 1, 1, 1, 1, 1,
0.1789691, 0.7530771, 0.9280785, 1, 1, 1, 1, 1,
0.1794897, 0.66357, 1.447438, 1, 1, 1, 1, 1,
0.1796865, -0.08755912, 1.924903, 1, 1, 1, 1, 1,
0.1831602, 1.164536, 1.014024, 1, 1, 1, 1, 1,
0.1848281, 0.944418, -0.38074, 1, 1, 1, 1, 1,
0.1861434, -0.4229992, 3.169345, 1, 1, 1, 1, 1,
0.1870773, -0.4342426, 2.823619, 1, 1, 1, 1, 1,
0.1893768, -0.233329, 3.659897, 1, 1, 1, 1, 1,
0.1923906, -0.6890394, 3.459142, 1, 1, 1, 1, 1,
0.194196, 1.147733, 0.5639902, 1, 1, 1, 1, 1,
0.1953838, 0.1729096, 0.4458052, 1, 1, 1, 1, 1,
0.196216, 1.088644, -0.5872577, 1, 1, 1, 1, 1,
0.1984955, -2.28434, 2.886209, 1, 1, 1, 1, 1,
0.2043097, -1.419117, 1.968144, 0, 0, 1, 1, 1,
0.2046817, -1.621285, 3.546116, 1, 0, 0, 1, 1,
0.2075364, -0.6560333, 4.318367, 1, 0, 0, 1, 1,
0.2101171, -0.42496, 1.939574, 1, 0, 0, 1, 1,
0.2110217, 0.1533701, 1.623487, 1, 0, 0, 1, 1,
0.2111665, 0.6861484, -0.8996809, 1, 0, 0, 1, 1,
0.2113675, 1.397031, -1.543014, 0, 0, 0, 1, 1,
0.2120766, 0.1581381, 1.956723, 0, 0, 0, 1, 1,
0.2127775, -0.7443761, 4.510146, 0, 0, 0, 1, 1,
0.2128145, -0.04612346, 2.867827, 0, 0, 0, 1, 1,
0.2130391, -0.06113098, 2.844308, 0, 0, 0, 1, 1,
0.2202171, -1.528522, 1.343382, 0, 0, 0, 1, 1,
0.2212665, 2.453702, 0.1087824, 0, 0, 0, 1, 1,
0.2223568, 0.6066535, 0.281001, 1, 1, 1, 1, 1,
0.2245619, 0.1854235, 0.6449379, 1, 1, 1, 1, 1,
0.2254625, 0.4078294, 1.11916, 1, 1, 1, 1, 1,
0.2287042, 0.279079, 0.9144392, 1, 1, 1, 1, 1,
0.2291052, -0.8251173, 2.346822, 1, 1, 1, 1, 1,
0.2309105, 0.240232, -0.05096446, 1, 1, 1, 1, 1,
0.2310093, -1.447468, 1.301613, 1, 1, 1, 1, 1,
0.2318504, -1.296126, 2.736105, 1, 1, 1, 1, 1,
0.2363228, 1.732543, 0.6919752, 1, 1, 1, 1, 1,
0.2368465, -0.5370356, 2.200717, 1, 1, 1, 1, 1,
0.2393044, 0.1625454, 1.370845, 1, 1, 1, 1, 1,
0.2407106, 1.259417, -0.385651, 1, 1, 1, 1, 1,
0.2424439, -0.8446448, 2.600465, 1, 1, 1, 1, 1,
0.2482762, -2.046351, 3.24212, 1, 1, 1, 1, 1,
0.2541267, 2.293588, 1.64723, 1, 1, 1, 1, 1,
0.2647343, 0.5364954, 0.2023483, 0, 0, 1, 1, 1,
0.2655223, 0.4719668, -1.206451, 1, 0, 0, 1, 1,
0.283377, -0.6112986, 2.348107, 1, 0, 0, 1, 1,
0.284019, -0.9652824, 2.419924, 1, 0, 0, 1, 1,
0.2856311, -0.5615825, 2.706617, 1, 0, 0, 1, 1,
0.287192, 1.160889, -1.321913, 1, 0, 0, 1, 1,
0.2890275, -0.09614098, 3.329615, 0, 0, 0, 1, 1,
0.2894551, -1.034314, 1.140941, 0, 0, 0, 1, 1,
0.2919193, 0.660347, -0.4645367, 0, 0, 0, 1, 1,
0.2993506, -0.4137115, 1.586268, 0, 0, 0, 1, 1,
0.302555, -0.27797, 3.379478, 0, 0, 0, 1, 1,
0.3038595, 0.2064376, 3.043236, 0, 0, 0, 1, 1,
0.3043637, 0.5794896, 0.7336236, 0, 0, 0, 1, 1,
0.3076849, -1.249036, 3.824209, 1, 1, 1, 1, 1,
0.3108316, 0.2687574, 0.9263179, 1, 1, 1, 1, 1,
0.3116697, 0.0005852781, 2.09792, 1, 1, 1, 1, 1,
0.3130097, 1.289229, -1.903186, 1, 1, 1, 1, 1,
0.3135946, 0.6831571, 0.576229, 1, 1, 1, 1, 1,
0.3143149, 0.6865049, 2.405293, 1, 1, 1, 1, 1,
0.3155705, 0.3096988, 0.6651178, 1, 1, 1, 1, 1,
0.3201134, -0.6127911, 3.067243, 1, 1, 1, 1, 1,
0.323038, 0.1322052, 1.604902, 1, 1, 1, 1, 1,
0.3313744, 0.9088512, 0.5856411, 1, 1, 1, 1, 1,
0.3333792, -0.05276511, 3.248089, 1, 1, 1, 1, 1,
0.3358234, -1.778061, 2.999152, 1, 1, 1, 1, 1,
0.3360766, -0.01108289, 1.31035, 1, 1, 1, 1, 1,
0.3413071, -0.9524027, 2.046865, 1, 1, 1, 1, 1,
0.3420167, 1.060087, 0.5468967, 1, 1, 1, 1, 1,
0.3461282, 0.3638231, 0.2884414, 0, 0, 1, 1, 1,
0.348213, 0.8729743, 0.6195015, 1, 0, 0, 1, 1,
0.3545333, 0.2245394, 0.5582896, 1, 0, 0, 1, 1,
0.3552553, 1.743458, 0.481292, 1, 0, 0, 1, 1,
0.3557446, 0.4126476, 2.383305, 1, 0, 0, 1, 1,
0.3558452, -1.756106, 2.071418, 1, 0, 0, 1, 1,
0.3559462, -0.1362815, 2.235632, 0, 0, 0, 1, 1,
0.3560722, -0.7849897, 3.986761, 0, 0, 0, 1, 1,
0.3733177, 0.1491125, 0.9246687, 0, 0, 0, 1, 1,
0.3781973, 1.168034, 1.00614, 0, 0, 0, 1, 1,
0.3782746, -0.4114828, 2.667667, 0, 0, 0, 1, 1,
0.3828343, -0.5423632, 1.835549, 0, 0, 0, 1, 1,
0.3886874, 0.4409882, -0.5255342, 0, 0, 0, 1, 1,
0.3911555, 1.262316, -0.2008763, 1, 1, 1, 1, 1,
0.3929855, -1.586276, 2.899191, 1, 1, 1, 1, 1,
0.3980682, 0.09729976, 1.467357, 1, 1, 1, 1, 1,
0.4013676, -0.6517147, 3.240527, 1, 1, 1, 1, 1,
0.4043419, -1.013097, 2.935615, 1, 1, 1, 1, 1,
0.4050107, 0.9930816, 0.7127327, 1, 1, 1, 1, 1,
0.4069143, -0.04364474, 3.02987, 1, 1, 1, 1, 1,
0.4071393, -0.407771, 0.8636157, 1, 1, 1, 1, 1,
0.4130207, -0.03162079, 0.5925114, 1, 1, 1, 1, 1,
0.4139437, -0.3676479, 0.8264262, 1, 1, 1, 1, 1,
0.4143065, -0.3526216, 3.558799, 1, 1, 1, 1, 1,
0.4180978, 0.103163, 0.1050109, 1, 1, 1, 1, 1,
0.4249904, 0.1573359, 0.7110073, 1, 1, 1, 1, 1,
0.4258075, -0.03525522, 0.7592999, 1, 1, 1, 1, 1,
0.4275102, 0.6124698, 0.3448443, 1, 1, 1, 1, 1,
0.430004, -0.7743266, 1.775078, 0, 0, 1, 1, 1,
0.4312377, -0.0908778, 2.365365, 1, 0, 0, 1, 1,
0.4341373, 0.3219398, 1.901247, 1, 0, 0, 1, 1,
0.4359495, 0.9836937, 0.3067177, 1, 0, 0, 1, 1,
0.4367156, -0.6380625, 2.474256, 1, 0, 0, 1, 1,
0.445634, 0.1866475, 0.2806788, 1, 0, 0, 1, 1,
0.4475986, 0.6037389, 0.9249043, 0, 0, 0, 1, 1,
0.4484638, 0.9656701, 2.036548, 0, 0, 0, 1, 1,
0.450276, -0.8550732, 3.581295, 0, 0, 0, 1, 1,
0.4517446, -0.7172819, 1.113247, 0, 0, 0, 1, 1,
0.4523519, 0.3635868, 0.9377055, 0, 0, 0, 1, 1,
0.4524881, -1.018577, 3.923181, 0, 0, 0, 1, 1,
0.4533786, -2.093735, 2.993145, 0, 0, 0, 1, 1,
0.4536543, -1.056045, 2.465462, 1, 1, 1, 1, 1,
0.4541981, 1.505718, -1.856255, 1, 1, 1, 1, 1,
0.4547916, -0.1877916, 0.7763832, 1, 1, 1, 1, 1,
0.457224, -1.163734, 1.604562, 1, 1, 1, 1, 1,
0.4593628, 0.3454304, -0.3369294, 1, 1, 1, 1, 1,
0.4607721, -0.6681964, 1.925983, 1, 1, 1, 1, 1,
0.4628959, 1.380063, 2.675078, 1, 1, 1, 1, 1,
0.4629791, -0.8948551, 4.175345, 1, 1, 1, 1, 1,
0.4647842, -0.5280387, 1.16329, 1, 1, 1, 1, 1,
0.465099, -0.2910267, 3.590562, 1, 1, 1, 1, 1,
0.4658219, -1.266569, 2.672041, 1, 1, 1, 1, 1,
0.4659937, -0.5167535, 4.020166, 1, 1, 1, 1, 1,
0.4684644, -1.799802, 2.137526, 1, 1, 1, 1, 1,
0.4759637, -1.015638, 3.907573, 1, 1, 1, 1, 1,
0.4852002, -0.6734861, 0.1579199, 1, 1, 1, 1, 1,
0.4861479, -1.888988, 2.704621, 0, 0, 1, 1, 1,
0.4974507, 0.5178564, 1.503268, 1, 0, 0, 1, 1,
0.4984751, -0.2632517, 1.198848, 1, 0, 0, 1, 1,
0.4993922, -1.162744, 2.369125, 1, 0, 0, 1, 1,
0.4996638, 0.6683629, -1.586824, 1, 0, 0, 1, 1,
0.5002235, 1.924293, 0.1675561, 1, 0, 0, 1, 1,
0.5072196, -0.02493729, 2.74704, 0, 0, 0, 1, 1,
0.5120354, 1.289882, 0.2796576, 0, 0, 0, 1, 1,
0.5214813, -0.2099597, 2.169273, 0, 0, 0, 1, 1,
0.5286676, 0.3867502, 1.307774, 0, 0, 0, 1, 1,
0.5332194, -1.38126, 3.642134, 0, 0, 0, 1, 1,
0.5396942, -1.05703, 1.910059, 0, 0, 0, 1, 1,
0.55345, -0.4188768, 2.222459, 0, 0, 0, 1, 1,
0.5580761, 0.8814011, -0.6397403, 1, 1, 1, 1, 1,
0.5630187, 0.3746189, 0.2803704, 1, 1, 1, 1, 1,
0.5658011, 0.4727528, 0.3940148, 1, 1, 1, 1, 1,
0.5762364, -0.4406469, 1.394022, 1, 1, 1, 1, 1,
0.5765334, -1.153352, 2.056874, 1, 1, 1, 1, 1,
0.5877893, -0.08161564, 0.3185446, 1, 1, 1, 1, 1,
0.595762, -0.2207028, 1.344976, 1, 1, 1, 1, 1,
0.5983413, -0.9818859, 1.704056, 1, 1, 1, 1, 1,
0.5987794, 1.598439, -0.4237619, 1, 1, 1, 1, 1,
0.6021114, -0.02277127, 1.830788, 1, 1, 1, 1, 1,
0.6043483, -0.1445353, 0.4334069, 1, 1, 1, 1, 1,
0.6055288, 0.6561348, -0.04485181, 1, 1, 1, 1, 1,
0.6090417, 1.214344, 2.113896, 1, 1, 1, 1, 1,
0.6101523, 0.5458614, 4.28757, 1, 1, 1, 1, 1,
0.6145522, 0.6682678, -0.5603532, 1, 1, 1, 1, 1,
0.6148942, -1.331128, 3.891473, 0, 0, 1, 1, 1,
0.6156518, -0.773378, 2.064517, 1, 0, 0, 1, 1,
0.6166804, 0.7243181, -0.07409172, 1, 0, 0, 1, 1,
0.6261753, -0.4485255, 2.346123, 1, 0, 0, 1, 1,
0.6306252, 0.5315337, 1.603602, 1, 0, 0, 1, 1,
0.6313003, 1.036106, 0.8623227, 1, 0, 0, 1, 1,
0.6328958, -0.735485, 4.898814, 0, 0, 0, 1, 1,
0.6341676, -0.3271088, 1.64991, 0, 0, 0, 1, 1,
0.6352443, 2.003072, -0.692888, 0, 0, 0, 1, 1,
0.6362473, 0.5607022, 1.614541, 0, 0, 0, 1, 1,
0.640045, 0.1315809, 0.6907808, 0, 0, 0, 1, 1,
0.6417974, -2.481048, 2.085128, 0, 0, 0, 1, 1,
0.646724, -1.683955, 3.071999, 0, 0, 0, 1, 1,
0.6492215, 1.189631, 3.398709, 1, 1, 1, 1, 1,
0.6492812, -0.9614177, 3.196177, 1, 1, 1, 1, 1,
0.6545002, 1.95772, 0.6932615, 1, 1, 1, 1, 1,
0.6579003, 0.09345543, 1.28847, 1, 1, 1, 1, 1,
0.6602699, -0.5501796, 2.609744, 1, 1, 1, 1, 1,
0.6664388, -0.7876333, 2.557278, 1, 1, 1, 1, 1,
0.6694013, 0.9743605, 0.5096489, 1, 1, 1, 1, 1,
0.6720346, -0.4703224, 1.999964, 1, 1, 1, 1, 1,
0.6790771, 0.6899673, -0.2387767, 1, 1, 1, 1, 1,
0.6851336, 2.676111, 0.2901623, 1, 1, 1, 1, 1,
0.6938353, -1.574022, 2.770121, 1, 1, 1, 1, 1,
0.7031334, -0.1678877, 1.554986, 1, 1, 1, 1, 1,
0.7043296, -0.2619689, 1.280259, 1, 1, 1, 1, 1,
0.7053064, 1.32311, -0.2699248, 1, 1, 1, 1, 1,
0.7068408, -0.05985151, 3.28542, 1, 1, 1, 1, 1,
0.7073126, -1.864691, 2.322512, 0, 0, 1, 1, 1,
0.7081891, 0.06316426, 0.9533933, 1, 0, 0, 1, 1,
0.7097952, -0.2147088, 4.431057, 1, 0, 0, 1, 1,
0.7129761, -1.206049, 2.329411, 1, 0, 0, 1, 1,
0.7132033, -0.2555443, 3.065037, 1, 0, 0, 1, 1,
0.7133552, 1.666782, 0.8255348, 1, 0, 0, 1, 1,
0.7155796, 0.276459, 2.34711, 0, 0, 0, 1, 1,
0.7194476, 0.2715905, 0.2927716, 0, 0, 0, 1, 1,
0.7205592, -0.9971421, 1.590105, 0, 0, 0, 1, 1,
0.7209842, -0.5230538, 2.41292, 0, 0, 0, 1, 1,
0.7225834, 1.604257, 1.129136, 0, 0, 0, 1, 1,
0.7242427, -0.7975215, 2.312288, 0, 0, 0, 1, 1,
0.7257603, 0.8500945, 0.2194443, 0, 0, 0, 1, 1,
0.7262844, -0.2673186, 3.056046, 1, 1, 1, 1, 1,
0.7292159, 0.2491584, 1.481081, 1, 1, 1, 1, 1,
0.7368125, -1.513624, 2.955989, 1, 1, 1, 1, 1,
0.7391997, -0.7680568, 1.963954, 1, 1, 1, 1, 1,
0.7397653, -1.013474, 2.528293, 1, 1, 1, 1, 1,
0.7417325, -0.3818612, 4.399546, 1, 1, 1, 1, 1,
0.7444831, -1.787789, 2.77582, 1, 1, 1, 1, 1,
0.7451218, -2.246984, 3.609179, 1, 1, 1, 1, 1,
0.7528846, 0.4215474, 2.348531, 1, 1, 1, 1, 1,
0.7536503, 1.128672, 0.4951034, 1, 1, 1, 1, 1,
0.7540087, -0.3043609, 1.974989, 1, 1, 1, 1, 1,
0.7575164, -0.1651335, 1.956189, 1, 1, 1, 1, 1,
0.7589474, -1.219179, 1.960189, 1, 1, 1, 1, 1,
0.7674987, -0.9220712, 2.3076, 1, 1, 1, 1, 1,
0.7695513, -0.1827398, 0.7658597, 1, 1, 1, 1, 1,
0.7752501, -0.9051206, 2.029119, 0, 0, 1, 1, 1,
0.7752951, 1.972035, -0.1603406, 1, 0, 0, 1, 1,
0.7828162, -0.4560778, 0.3793613, 1, 0, 0, 1, 1,
0.7871631, -0.1278594, 2.095562, 1, 0, 0, 1, 1,
0.7923081, -0.6616186, 0.8994796, 1, 0, 0, 1, 1,
0.7994663, -0.6673115, 2.457438, 1, 0, 0, 1, 1,
0.7999244, -0.7599949, 3.159113, 0, 0, 0, 1, 1,
0.8000976, 1.687194, 1.295596, 0, 0, 0, 1, 1,
0.8010071, 0.3905159, 1.195623, 0, 0, 0, 1, 1,
0.8082727, 1.981381, -2.455439, 0, 0, 0, 1, 1,
0.8092221, -0.180617, 2.071912, 0, 0, 0, 1, 1,
0.8174066, 1.571012, 0.3082662, 0, 0, 0, 1, 1,
0.8190285, 0.8249835, 1.253695, 0, 0, 0, 1, 1,
0.8267608, -0.3386008, 2.855618, 1, 1, 1, 1, 1,
0.8316395, -2.010239, 3.498366, 1, 1, 1, 1, 1,
0.8357419, 0.9686139, 3.634543, 1, 1, 1, 1, 1,
0.8365424, -0.1203127, 1.919187, 1, 1, 1, 1, 1,
0.8394451, 0.7035263, 0.9816938, 1, 1, 1, 1, 1,
0.8432118, -0.8965329, 3.400111, 1, 1, 1, 1, 1,
0.8443905, 1.477971, -2.106946, 1, 1, 1, 1, 1,
0.8483965, -0.005468758, 3.428944, 1, 1, 1, 1, 1,
0.8583137, 0.6302226, -0.2943813, 1, 1, 1, 1, 1,
0.8626954, -0.6311271, 1.681752, 1, 1, 1, 1, 1,
0.8726576, -0.1008847, 0.2202624, 1, 1, 1, 1, 1,
0.8763593, 0.6575354, 0.7564335, 1, 1, 1, 1, 1,
0.8769393, 1.190078, 1.571119, 1, 1, 1, 1, 1,
0.8797238, -0.8610552, 1.615599, 1, 1, 1, 1, 1,
0.8954991, 0.3851021, 0.2125647, 1, 1, 1, 1, 1,
0.8963451, 0.2153848, 0.6713035, 0, 0, 1, 1, 1,
0.8984197, 0.3117897, -0.4979677, 1, 0, 0, 1, 1,
0.8990445, -0.3738549, 3.419862, 1, 0, 0, 1, 1,
0.8994359, -0.5210374, 2.121475, 1, 0, 0, 1, 1,
0.9055767, 1.070848, -0.7864093, 1, 0, 0, 1, 1,
0.9062017, 2.349767, 0.1124425, 1, 0, 0, 1, 1,
0.9232587, -1.785394, 3.592755, 0, 0, 0, 1, 1,
0.9242338, 0.8885547, 0.88765, 0, 0, 0, 1, 1,
0.9261706, -0.445585, 1.816446, 0, 0, 0, 1, 1,
0.9274116, -0.5389115, 2.52871, 0, 0, 0, 1, 1,
0.9288222, 0.5816159, 0.3933257, 0, 0, 0, 1, 1,
0.9303672, -0.3151094, 0.4059181, 0, 0, 0, 1, 1,
0.9307039, -0.926116, 2.0429, 0, 0, 0, 1, 1,
0.9312565, 0.1161911, 1.835431, 1, 1, 1, 1, 1,
0.9318888, -1.423074, 3.958409, 1, 1, 1, 1, 1,
0.9338028, 0.2475311, -0.4717181, 1, 1, 1, 1, 1,
0.9421614, 0.5169909, 0.2365922, 1, 1, 1, 1, 1,
0.9447444, -0.5144761, 2.951124, 1, 1, 1, 1, 1,
0.9448867, 0.4039119, 0.3343552, 1, 1, 1, 1, 1,
0.9458351, -0.3872529, 3.013704, 1, 1, 1, 1, 1,
0.9474767, 1.448379, -0.775975, 1, 1, 1, 1, 1,
0.9669985, 0.7207081, 0.5162442, 1, 1, 1, 1, 1,
0.9786522, 0.6123538, 0.934823, 1, 1, 1, 1, 1,
0.9804627, 2.301698, -0.7891982, 1, 1, 1, 1, 1,
0.9818889, -0.4196268, 2.967592, 1, 1, 1, 1, 1,
0.9938043, 0.4247921, 1.376527, 1, 1, 1, 1, 1,
0.9976032, 0.08590589, 0.2967751, 1, 1, 1, 1, 1,
0.9994903, 1.192758, 0.4811011, 1, 1, 1, 1, 1,
1.000593, 1.036356, 1.108372, 0, 0, 1, 1, 1,
1.000694, 1.203069, 0.1245821, 1, 0, 0, 1, 1,
1.003851, 0.8494763, 1.72012, 1, 0, 0, 1, 1,
1.010188, -1.163638, 2.624878, 1, 0, 0, 1, 1,
1.016089, -0.9243245, 2.231431, 1, 0, 0, 1, 1,
1.020964, -1.764709, 2.155666, 1, 0, 0, 1, 1,
1.021171, 0.7871785, 0.03426064, 0, 0, 0, 1, 1,
1.026433, -1.567708, 3.508602, 0, 0, 0, 1, 1,
1.034548, 0.6942844, -1.072332, 0, 0, 0, 1, 1,
1.03509, 0.1513235, 2.195023, 0, 0, 0, 1, 1,
1.042019, -0.8323132, 1.093226, 0, 0, 0, 1, 1,
1.042437, 2.219158, -0.8268644, 0, 0, 0, 1, 1,
1.054007, -0.5142101, 0.5417285, 0, 0, 0, 1, 1,
1.064438, -0.7458092, 1.996916, 1, 1, 1, 1, 1,
1.07058, -1.208226, 1.282028, 1, 1, 1, 1, 1,
1.07812, 0.2785198, 1.385037, 1, 1, 1, 1, 1,
1.085532, 0.4555628, 0.8194036, 1, 1, 1, 1, 1,
1.092962, -0.4736848, 2.490028, 1, 1, 1, 1, 1,
1.093282, -0.7439476, 3.230078, 1, 1, 1, 1, 1,
1.095721, -0.01506125, 2.545924, 1, 1, 1, 1, 1,
1.105753, -1.103179, 3.53207, 1, 1, 1, 1, 1,
1.106995, -0.5679859, 0.455206, 1, 1, 1, 1, 1,
1.113036, 0.3911555, 0.8299976, 1, 1, 1, 1, 1,
1.113851, -1.467672, 1.495495, 1, 1, 1, 1, 1,
1.126364, 0.4300549, 0.1995458, 1, 1, 1, 1, 1,
1.129634, -0.07508405, 1.158641, 1, 1, 1, 1, 1,
1.142406, 0.6432487, 3.077566, 1, 1, 1, 1, 1,
1.14608, -0.7099639, 1.364776, 1, 1, 1, 1, 1,
1.146915, -1.285218, -0.1819136, 0, 0, 1, 1, 1,
1.148769, -0.05978866, 1.388947, 1, 0, 0, 1, 1,
1.172081, 0.677631, 0.673041, 1, 0, 0, 1, 1,
1.179266, 0.4223248, 3.799653, 1, 0, 0, 1, 1,
1.182167, -0.3195605, 1.714045, 1, 0, 0, 1, 1,
1.18737, 0.9428077, -0.1473809, 1, 0, 0, 1, 1,
1.190259, -0.3700101, 0.5106509, 0, 0, 0, 1, 1,
1.191953, 1.880149, 0.6529578, 0, 0, 0, 1, 1,
1.198358, 0.9806706, 1.279695, 0, 0, 0, 1, 1,
1.201674, 1.021303, 0.8891597, 0, 0, 0, 1, 1,
1.211585, -0.4298068, 3.32147, 0, 0, 0, 1, 1,
1.21483, -1.534939, 2.922353, 0, 0, 0, 1, 1,
1.233347, 0.7255585, 0.3361037, 0, 0, 0, 1, 1,
1.237157, -0.03448803, 2.030205, 1, 1, 1, 1, 1,
1.239172, 0.3164378, 0.3820735, 1, 1, 1, 1, 1,
1.254024, 1.457736, 2.283262, 1, 1, 1, 1, 1,
1.258535, 0.8932562, 1.617176, 1, 1, 1, 1, 1,
1.262857, 1.500688, -0.06515723, 1, 1, 1, 1, 1,
1.268228, -0.374899, 1.474211, 1, 1, 1, 1, 1,
1.269517, 1.526583, 0.7505821, 1, 1, 1, 1, 1,
1.269608, 0.7621329, -0.8872007, 1, 1, 1, 1, 1,
1.270956, -0.7860892, 1.929533, 1, 1, 1, 1, 1,
1.272938, 1.178882, 1.685222, 1, 1, 1, 1, 1,
1.27804, -0.1437483, 0.7595686, 1, 1, 1, 1, 1,
1.288405, -0.01633119, 1.976061, 1, 1, 1, 1, 1,
1.297362, -0.0426084, 0.5213994, 1, 1, 1, 1, 1,
1.306646, -1.210258, 2.822065, 1, 1, 1, 1, 1,
1.310022, -1.337557, 2.122636, 1, 1, 1, 1, 1,
1.328124, 0.1976606, 0.6060126, 0, 0, 1, 1, 1,
1.328782, 1.107347, 0.5747685, 1, 0, 0, 1, 1,
1.334374, -2.05062, 3.501922, 1, 0, 0, 1, 1,
1.343065, -0.7897429, 3.145281, 1, 0, 0, 1, 1,
1.346587, -0.1997673, -0.3979659, 1, 0, 0, 1, 1,
1.347673, -0.5294442, 0.4566249, 1, 0, 0, 1, 1,
1.377085, 0.1152271, 1.761872, 0, 0, 0, 1, 1,
1.381898, -0.2948701, 1.720902, 0, 0, 0, 1, 1,
1.399035, -0.09073884, 0.6035984, 0, 0, 0, 1, 1,
1.399058, 0.7607406, -0.4964123, 0, 0, 0, 1, 1,
1.403948, 0.05668335, 1.035197, 0, 0, 0, 1, 1,
1.415896, 0.2197823, 2.308409, 0, 0, 0, 1, 1,
1.42163, 0.06235696, -1.010424, 0, 0, 0, 1, 1,
1.425789, 1.186614, 2.679283, 1, 1, 1, 1, 1,
1.434802, -0.1279454, 1.945318, 1, 1, 1, 1, 1,
1.44781, 1.339035, -0.1877868, 1, 1, 1, 1, 1,
1.453086, -1.753079, 2.762972, 1, 1, 1, 1, 1,
1.457265, -0.5725841, 1.464678, 1, 1, 1, 1, 1,
1.458552, -2.390949, 4.459313, 1, 1, 1, 1, 1,
1.475966, -0.6851259, 3.689695, 1, 1, 1, 1, 1,
1.480564, 0.6392584, 0.960496, 1, 1, 1, 1, 1,
1.482317, 0.278935, 0.7071908, 1, 1, 1, 1, 1,
1.50166, -1.5859, 2.072961, 1, 1, 1, 1, 1,
1.50492, 2.218656, 0.07765939, 1, 1, 1, 1, 1,
1.516018, -0.003859953, 1.694978, 1, 1, 1, 1, 1,
1.533815, 0.7785239, 1.27276, 1, 1, 1, 1, 1,
1.536842, -1.487577, 3.009591, 1, 1, 1, 1, 1,
1.539831, 2.637323, 0.9397004, 1, 1, 1, 1, 1,
1.559483, 0.2865411, 0.6581795, 0, 0, 1, 1, 1,
1.57132, 0.1469751, 2.140431, 1, 0, 0, 1, 1,
1.576755, 0.4289816, 0.9115367, 1, 0, 0, 1, 1,
1.583833, 0.05309767, 2.498068, 1, 0, 0, 1, 1,
1.596635, 0.5911071, -0.1912772, 1, 0, 0, 1, 1,
1.60151, -1.26378, 2.433824, 1, 0, 0, 1, 1,
1.623614, -1.168316, 1.653307, 0, 0, 0, 1, 1,
1.633752, -0.1897911, 2.42867, 0, 0, 0, 1, 1,
1.643372, -0.9358602, 1.482298, 0, 0, 0, 1, 1,
1.651334, -0.6482294, 1.240989, 0, 0, 0, 1, 1,
1.676755, -1.034082, 3.408302, 0, 0, 0, 1, 1,
1.677785, 0.513549, 1.381037, 0, 0, 0, 1, 1,
1.689566, -0.7008253, 1.646318, 0, 0, 0, 1, 1,
1.734253, 1.505655, 0.3925266, 1, 1, 1, 1, 1,
1.745429, 1.156568, 0.9272711, 1, 1, 1, 1, 1,
1.745932, 0.2981844, 2.339803, 1, 1, 1, 1, 1,
1.746993, 1.954268, 0.3885997, 1, 1, 1, 1, 1,
1.75667, 0.854536, 0.7735727, 1, 1, 1, 1, 1,
1.816457, 0.5342897, 1.532366, 1, 1, 1, 1, 1,
1.825959, -0.95411, 2.3702, 1, 1, 1, 1, 1,
1.860279, -0.388819, 2.917576, 1, 1, 1, 1, 1,
1.874115, -0.04328901, 1.90804, 1, 1, 1, 1, 1,
1.879364, -0.9691252, 1.392678, 1, 1, 1, 1, 1,
2.034503, -1.027291, 1.806137, 1, 1, 1, 1, 1,
2.045765, -0.8157575, 2.485678, 1, 1, 1, 1, 1,
2.054227, -2.033741, 2.163069, 1, 1, 1, 1, 1,
2.093768, -1.535514, 2.856415, 1, 1, 1, 1, 1,
2.098843, 0.5910326, 0.645136, 1, 1, 1, 1, 1,
2.103463, -0.4093944, 3.614633, 0, 0, 1, 1, 1,
2.140203, -0.2082165, 1.681584, 1, 0, 0, 1, 1,
2.142988, -0.9841215, 2.339639, 1, 0, 0, 1, 1,
2.147534, 0.9202043, 0.8102702, 1, 0, 0, 1, 1,
2.200392, 0.4182713, -0.2094118, 1, 0, 0, 1, 1,
2.261995, -0.1104529, 2.545941, 1, 0, 0, 1, 1,
2.263636, 0.3547802, 2.053469, 0, 0, 0, 1, 1,
2.273091, 1.75989, 1.225456, 0, 0, 0, 1, 1,
2.280695, 0.8369075, 2.614808, 0, 0, 0, 1, 1,
2.297596, -0.05091539, 0.3082602, 0, 0, 0, 1, 1,
2.320667, -1.556808, 3.373447, 0, 0, 0, 1, 1,
2.326707, -0.245293, 3.524375, 0, 0, 0, 1, 1,
2.331535, 0.3367516, 3.327842, 0, 0, 0, 1, 1,
2.34032, -0.9196126, 1.508796, 1, 1, 1, 1, 1,
2.39956, 0.8459443, 3.324134, 1, 1, 1, 1, 1,
2.506647, 0.04294107, 0.8780658, 1, 1, 1, 1, 1,
2.573689, 0.99326, -0.02979805, 1, 1, 1, 1, 1,
2.629975, 0.007911025, 0.7762787, 1, 1, 1, 1, 1,
2.778314, -0.2376093, 3.403374, 1, 1, 1, 1, 1,
2.973126, 0.4147053, 1.098341, 1, 1, 1, 1, 1
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
var radius = 9.865608;
var distance = 34.65253;
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
mvMatrix.translate( 0.2071304, -0.02159691, -0.02482224 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.65253);
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
