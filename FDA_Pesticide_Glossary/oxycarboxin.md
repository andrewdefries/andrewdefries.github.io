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
-3.274947, 2.476168, -1.324953, 1, 0, 0, 1,
-2.989453, -2.303524, 0.410007, 1, 0.007843138, 0, 1,
-2.981713, -0.04639899, -0.1678249, 1, 0.01176471, 0, 1,
-2.922827, -0.3884536, -1.954212, 1, 0.01960784, 0, 1,
-2.805401, -0.3563737, -2.163802, 1, 0.02352941, 0, 1,
-2.691734, -0.3119929, -0.3769147, 1, 0.03137255, 0, 1,
-2.570974, -1.050805, -0.8422837, 1, 0.03529412, 0, 1,
-2.535383, -1.446346, -2.80824, 1, 0.04313726, 0, 1,
-2.437277, 2.000799, -0.4587456, 1, 0.04705882, 0, 1,
-2.415254, 0.6009728, -0.311825, 1, 0.05490196, 0, 1,
-2.406451, 0.8780305, -0.02879763, 1, 0.05882353, 0, 1,
-2.394013, -0.3740661, -2.677811, 1, 0.06666667, 0, 1,
-2.388355, 0.9062077, -1.261384, 1, 0.07058824, 0, 1,
-2.35045, -0.4349995, -1.768613, 1, 0.07843138, 0, 1,
-2.345653, -0.8880493, -0.8181347, 1, 0.08235294, 0, 1,
-2.308184, 0.2730156, -2.971907, 1, 0.09019608, 0, 1,
-2.293573, 0.4592355, 1.126137, 1, 0.09411765, 0, 1,
-2.247846, 0.8672076, -2.052824, 1, 0.1019608, 0, 1,
-2.239214, 0.1332599, -0.111065, 1, 0.1098039, 0, 1,
-2.209932, 1.721022, -1.103917, 1, 0.1137255, 0, 1,
-2.06273, -1.774098, -3.179472, 1, 0.1215686, 0, 1,
-2.059104, -0.2037172, -2.850139, 1, 0.1254902, 0, 1,
-2.025204, -0.6294202, -2.090953, 1, 0.1333333, 0, 1,
-2.011738, 0.700153, -1.650919, 1, 0.1372549, 0, 1,
-1.968011, 2.540439, -2.426306, 1, 0.145098, 0, 1,
-1.961985, -0.841325, -2.259922, 1, 0.1490196, 0, 1,
-1.960345, -0.8558933, -3.165656, 1, 0.1568628, 0, 1,
-1.93876, -1.091593, -2.288118, 1, 0.1607843, 0, 1,
-1.93682, 0.3934427, -1.295305, 1, 0.1686275, 0, 1,
-1.936019, -0.4390185, -2.089611, 1, 0.172549, 0, 1,
-1.920582, 1.139591, -0.1888816, 1, 0.1803922, 0, 1,
-1.895047, -0.9198272, -1.641915, 1, 0.1843137, 0, 1,
-1.878122, 1.725922, -0.488547, 1, 0.1921569, 0, 1,
-1.860088, 1.044221, 0.6940915, 1, 0.1960784, 0, 1,
-1.833592, -1.362901, -2.113444, 1, 0.2039216, 0, 1,
-1.827113, -0.8209212, -2.692586, 1, 0.2117647, 0, 1,
-1.813158, 1.707669, -2.371529, 1, 0.2156863, 0, 1,
-1.80185, -0.8145075, -2.425181, 1, 0.2235294, 0, 1,
-1.753972, 0.7582521, -1.091737, 1, 0.227451, 0, 1,
-1.751987, -0.6753615, -3.504944, 1, 0.2352941, 0, 1,
-1.73869, 0.1245325, -3.133507, 1, 0.2392157, 0, 1,
-1.695632, 0.5285792, -0.8290358, 1, 0.2470588, 0, 1,
-1.676072, -0.109384, -2.611602, 1, 0.2509804, 0, 1,
-1.66204, 1.867652, -0.7955127, 1, 0.2588235, 0, 1,
-1.661022, 1.349977, -1.822362, 1, 0.2627451, 0, 1,
-1.658464, -1.497897, -2.661079, 1, 0.2705882, 0, 1,
-1.654372, 0.03058924, -0.01965464, 1, 0.2745098, 0, 1,
-1.65353, 0.5145952, 0.0106185, 1, 0.282353, 0, 1,
-1.62377, 0.5566127, -0.4666854, 1, 0.2862745, 0, 1,
-1.616175, 0.6077438, -2.94531, 1, 0.2941177, 0, 1,
-1.600256, 0.1930577, -1.118909, 1, 0.3019608, 0, 1,
-1.598341, 0.4831863, -2.3941, 1, 0.3058824, 0, 1,
-1.582282, 0.09081144, -0.5790433, 1, 0.3137255, 0, 1,
-1.573297, 0.04092974, -0.08875552, 1, 0.3176471, 0, 1,
-1.558755, -0.8659955, -2.846841, 1, 0.3254902, 0, 1,
-1.546822, 1.382865, 0.6146854, 1, 0.3294118, 0, 1,
-1.546776, 0.08936106, -1.024808, 1, 0.3372549, 0, 1,
-1.544672, -1.194106, -2.725703, 1, 0.3411765, 0, 1,
-1.544076, 0.3785976, -1.787072, 1, 0.3490196, 0, 1,
-1.535614, 1.300382, 0.12429, 1, 0.3529412, 0, 1,
-1.528619, -0.1857336, 0.1680201, 1, 0.3607843, 0, 1,
-1.517351, -1.790535, -1.192032, 1, 0.3647059, 0, 1,
-1.494502, 0.2135385, -2.65593, 1, 0.372549, 0, 1,
-1.490311, -0.343051, -2.180232, 1, 0.3764706, 0, 1,
-1.481329, -0.2174533, -2.291436, 1, 0.3843137, 0, 1,
-1.472836, 1.106316, 0.4559452, 1, 0.3882353, 0, 1,
-1.444552, 1.006007, -2.207274, 1, 0.3960784, 0, 1,
-1.43788, -0.07745843, -2.062173, 1, 0.4039216, 0, 1,
-1.422821, -1.281362, -4.055747, 1, 0.4078431, 0, 1,
-1.414803, -0.5462638, -1.257676, 1, 0.4156863, 0, 1,
-1.411726, -1.323097, -2.078499, 1, 0.4196078, 0, 1,
-1.41156, -1.062681, -1.758016, 1, 0.427451, 0, 1,
-1.409899, 0.6602793, -1.695286, 1, 0.4313726, 0, 1,
-1.405329, 1.519409, 0.1458237, 1, 0.4392157, 0, 1,
-1.397832, 0.05616632, -0.9462056, 1, 0.4431373, 0, 1,
-1.387536, 0.3472834, 0.5337688, 1, 0.4509804, 0, 1,
-1.381382, 0.2003194, -1.97995, 1, 0.454902, 0, 1,
-1.381027, 0.229303, -0.9068658, 1, 0.4627451, 0, 1,
-1.375526, -1.769279, -3.607217, 1, 0.4666667, 0, 1,
-1.370091, -0.51178, -1.792723, 1, 0.4745098, 0, 1,
-1.365448, -0.2939113, -1.953254, 1, 0.4784314, 0, 1,
-1.356772, 2.060091, -1.237751, 1, 0.4862745, 0, 1,
-1.353131, -0.1248523, -2.12768, 1, 0.4901961, 0, 1,
-1.347019, 0.1068783, 0.6718043, 1, 0.4980392, 0, 1,
-1.342092, 0.6417947, -1.503302, 1, 0.5058824, 0, 1,
-1.339233, 0.666842, -1.645523, 1, 0.509804, 0, 1,
-1.332178, 0.2496551, -1.9453, 1, 0.5176471, 0, 1,
-1.326684, -1.532852, -2.562556, 1, 0.5215687, 0, 1,
-1.325737, 0.5029702, -2.146348, 1, 0.5294118, 0, 1,
-1.325263, -1.244407, -3.513908, 1, 0.5333334, 0, 1,
-1.323301, 2.215466, -0.2810024, 1, 0.5411765, 0, 1,
-1.320703, -1.490646, -3.222178, 1, 0.5450981, 0, 1,
-1.317823, -0.5306924, -2.00163, 1, 0.5529412, 0, 1,
-1.311735, 0.8899073, -1.723494, 1, 0.5568628, 0, 1,
-1.304511, -1.835971, -2.398205, 1, 0.5647059, 0, 1,
-1.301158, -2.162409, -1.709726, 1, 0.5686275, 0, 1,
-1.29812, 1.937123, -0.2586199, 1, 0.5764706, 0, 1,
-1.294698, -0.5531036, -2.363951, 1, 0.5803922, 0, 1,
-1.294027, 0.8275245, -1.097662, 1, 0.5882353, 0, 1,
-1.292091, -0.114957, -1.977376, 1, 0.5921569, 0, 1,
-1.280692, 0.8605611, -1.270431, 1, 0.6, 0, 1,
-1.280302, -0.1191348, -1.778637, 1, 0.6078432, 0, 1,
-1.275813, 0.5001525, -1.261082, 1, 0.6117647, 0, 1,
-1.273204, 1.158401, -1.009506, 1, 0.6196079, 0, 1,
-1.267191, -0.3429291, -2.408669, 1, 0.6235294, 0, 1,
-1.267166, 0.02579559, -4.807483, 1, 0.6313726, 0, 1,
-1.266212, -0.3098467, -2.944322, 1, 0.6352941, 0, 1,
-1.261646, 0.6074933, -1.179462, 1, 0.6431373, 0, 1,
-1.260582, 0.7216524, -1.176629, 1, 0.6470588, 0, 1,
-1.257274, 0.4550192, 2.040459, 1, 0.654902, 0, 1,
-1.247019, -0.71047, 1.522526, 1, 0.6588235, 0, 1,
-1.245098, -0.5773639, -2.092094, 1, 0.6666667, 0, 1,
-1.241367, -1.722997, -2.207644, 1, 0.6705883, 0, 1,
-1.237302, 0.6573353, -1.726657, 1, 0.6784314, 0, 1,
-1.237127, -0.9338121, -2.65309, 1, 0.682353, 0, 1,
-1.229763, 0.7406881, -0.9312884, 1, 0.6901961, 0, 1,
-1.209141, -0.7079248, -2.660588, 1, 0.6941177, 0, 1,
-1.202579, 1.640221, -0.3590165, 1, 0.7019608, 0, 1,
-1.173935, -1.477126, -1.470852, 1, 0.7098039, 0, 1,
-1.169181, -0.7157119, -2.790736, 1, 0.7137255, 0, 1,
-1.167709, 1.609624, -0.2879805, 1, 0.7215686, 0, 1,
-1.165623, -0.4767881, -1.422551, 1, 0.7254902, 0, 1,
-1.162613, 1.527668, 0.6861205, 1, 0.7333333, 0, 1,
-1.141962, 0.7333805, -0.7981349, 1, 0.7372549, 0, 1,
-1.141095, -0.6630572, -0.4909514, 1, 0.7450981, 0, 1,
-1.131932, -0.3318157, -1.885399, 1, 0.7490196, 0, 1,
-1.130234, 2.293372, -0.1774614, 1, 0.7568628, 0, 1,
-1.128064, -0.3982859, -1.294425, 1, 0.7607843, 0, 1,
-1.111136, -1.018123, -1.717243, 1, 0.7686275, 0, 1,
-1.108214, 0.5099937, -0.9084774, 1, 0.772549, 0, 1,
-1.102161, 0.3155815, -3.421362, 1, 0.7803922, 0, 1,
-1.095354, -1.211883, -1.630316, 1, 0.7843137, 0, 1,
-1.091856, -0.4967297, -3.397531, 1, 0.7921569, 0, 1,
-1.08833, 0.9001456, -0.1957992, 1, 0.7960784, 0, 1,
-1.085024, 0.9290302, -0.9762635, 1, 0.8039216, 0, 1,
-1.074904, -0.2490105, -2.025662, 1, 0.8117647, 0, 1,
-1.072545, 0.5887214, -0.6283215, 1, 0.8156863, 0, 1,
-1.071093, -0.2466596, -2.374771, 1, 0.8235294, 0, 1,
-1.068077, 0.7632478, -1.61761, 1, 0.827451, 0, 1,
-1.064281, 1.826852, -2.758631, 1, 0.8352941, 0, 1,
-1.050838, -0.1026606, 0.931749, 1, 0.8392157, 0, 1,
-1.044898, 0.410245, -3.140458, 1, 0.8470588, 0, 1,
-1.044825, -0.4640943, -0.4692729, 1, 0.8509804, 0, 1,
-1.044498, 0.9143913, -2.828001, 1, 0.8588235, 0, 1,
-1.040993, 1.033611, -1.032693, 1, 0.8627451, 0, 1,
-1.039692, 0.08690807, -1.519378, 1, 0.8705882, 0, 1,
-1.030604, -0.2740948, -1.30735, 1, 0.8745098, 0, 1,
-1.028737, -0.1518499, -0.6427037, 1, 0.8823529, 0, 1,
-1.025554, -0.6833431, -1.473901, 1, 0.8862745, 0, 1,
-1.020079, -0.2007463, -2.797291, 1, 0.8941177, 0, 1,
-1.019575, 0.01136113, -0.3609042, 1, 0.8980392, 0, 1,
-1.01726, 0.9448943, 0.2865294, 1, 0.9058824, 0, 1,
-1.015319, 0.9945528, -0.8455309, 1, 0.9137255, 0, 1,
-1.014421, 0.5285704, 0.7905775, 1, 0.9176471, 0, 1,
-1.012439, -0.4880956, -1.882992, 1, 0.9254902, 0, 1,
-1.008809, -0.7736446, -2.465469, 1, 0.9294118, 0, 1,
-1.006485, 0.5820251, -1.257077, 1, 0.9372549, 0, 1,
-1.003375, -1.418186, -1.993949, 1, 0.9411765, 0, 1,
-0.9977496, 1.385429, 0.0837649, 1, 0.9490196, 0, 1,
-0.9944093, -0.2536898, -0.1571257, 1, 0.9529412, 0, 1,
-0.9869717, -0.9276229, -0.3318668, 1, 0.9607843, 0, 1,
-0.9832873, 1.222645, -3.207692, 1, 0.9647059, 0, 1,
-0.9763585, 2.480711, -0.6152355, 1, 0.972549, 0, 1,
-0.9725302, 2.527675, -1.394, 1, 0.9764706, 0, 1,
-0.9723344, -0.9456265, -2.14111, 1, 0.9843137, 0, 1,
-0.9645162, 0.01103814, 0.319549, 1, 0.9882353, 0, 1,
-0.9549047, 0.2028135, -1.727987, 1, 0.9960784, 0, 1,
-0.9547629, 0.6516511, 0.1689403, 0.9960784, 1, 0, 1,
-0.9471713, -0.5095962, -3.179735, 0.9921569, 1, 0, 1,
-0.9397718, 1.488412, -0.06556398, 0.9843137, 1, 0, 1,
-0.9320168, 0.1240099, -0.5876618, 0.9803922, 1, 0, 1,
-0.9318065, -0.8599622, -2.234061, 0.972549, 1, 0, 1,
-0.9301924, 0.2364489, -0.1749345, 0.9686275, 1, 0, 1,
-0.9285806, -1.428312, -2.595815, 0.9607843, 1, 0, 1,
-0.927738, 0.9355054, -1.696886, 0.9568627, 1, 0, 1,
-0.9162661, -2.163807, -2.816067, 0.9490196, 1, 0, 1,
-0.9136061, -0.2157642, -2.357099, 0.945098, 1, 0, 1,
-0.9124557, 0.5425041, -0.7829158, 0.9372549, 1, 0, 1,
-0.9043438, 1.29459, -2.022277, 0.9333333, 1, 0, 1,
-0.9014084, 0.236987, -1.928219, 0.9254902, 1, 0, 1,
-0.8946015, -0.6167321, -2.911518, 0.9215686, 1, 0, 1,
-0.8868707, -0.3480172, -1.232821, 0.9137255, 1, 0, 1,
-0.8866752, 1.67108, -0.7339917, 0.9098039, 1, 0, 1,
-0.8848771, 0.3894244, -0.9468192, 0.9019608, 1, 0, 1,
-0.8786635, 0.7512987, 0.4873964, 0.8941177, 1, 0, 1,
-0.8777357, -0.6237011, -3.064157, 0.8901961, 1, 0, 1,
-0.8744887, 1.680169, -0.8390372, 0.8823529, 1, 0, 1,
-0.8734925, -1.147418, -2.36553, 0.8784314, 1, 0, 1,
-0.8722548, 0.6226313, 0.1343996, 0.8705882, 1, 0, 1,
-0.8704671, -0.3721043, -0.4304103, 0.8666667, 1, 0, 1,
-0.8569795, 0.3592833, -0.7069318, 0.8588235, 1, 0, 1,
-0.8503284, 0.3560872, -1.439162, 0.854902, 1, 0, 1,
-0.8474784, -1.001965, -2.619638, 0.8470588, 1, 0, 1,
-0.843419, 1.357346, -0.2246542, 0.8431373, 1, 0, 1,
-0.8413457, 1.113129, -2.18609, 0.8352941, 1, 0, 1,
-0.839246, 0.04566117, -2.792963, 0.8313726, 1, 0, 1,
-0.8375102, 0.6150397, -1.612148, 0.8235294, 1, 0, 1,
-0.8302324, -1.884937, -2.967433, 0.8196079, 1, 0, 1,
-0.8301165, -0.9009351, -2.866624, 0.8117647, 1, 0, 1,
-0.8272327, 0.9533308, -0.6244593, 0.8078431, 1, 0, 1,
-0.8232287, 0.9120271, -1.290453, 0.8, 1, 0, 1,
-0.8189732, 0.5834588, -0.6065062, 0.7921569, 1, 0, 1,
-0.8177758, -0.8017362, -2.853031, 0.7882353, 1, 0, 1,
-0.816054, 1.746975, -0.7528934, 0.7803922, 1, 0, 1,
-0.8158855, -1.336111, -1.90737, 0.7764706, 1, 0, 1,
-0.8094206, -1.630872, -2.324617, 0.7686275, 1, 0, 1,
-0.8057379, 0.09660232, -1.698996, 0.7647059, 1, 0, 1,
-0.8040359, -1.953536, -2.227294, 0.7568628, 1, 0, 1,
-0.795999, -1.123698, -2.946716, 0.7529412, 1, 0, 1,
-0.7933989, -0.3976202, -1.095541, 0.7450981, 1, 0, 1,
-0.790665, 1.433566, -0.3828071, 0.7411765, 1, 0, 1,
-0.7901624, 0.4165993, -1.487903, 0.7333333, 1, 0, 1,
-0.7865402, -1.000663, -0.9011258, 0.7294118, 1, 0, 1,
-0.7784823, 0.9370335, 0.08201442, 0.7215686, 1, 0, 1,
-0.7773847, -1.026575, -2.474053, 0.7176471, 1, 0, 1,
-0.7766027, 0.9530763, 1.264419, 0.7098039, 1, 0, 1,
-0.76556, 0.3098208, -1.318811, 0.7058824, 1, 0, 1,
-0.7645778, 0.210351, -0.288039, 0.6980392, 1, 0, 1,
-0.7625976, -1.348622, -3.177374, 0.6901961, 1, 0, 1,
-0.7614037, -1.267264, -5.233981, 0.6862745, 1, 0, 1,
-0.758535, -0.320893, -1.556444, 0.6784314, 1, 0, 1,
-0.7479048, -0.0157807, -1.383303, 0.6745098, 1, 0, 1,
-0.7357624, 0.2086597, -1.252198, 0.6666667, 1, 0, 1,
-0.7348845, -0.2125053, -2.155296, 0.6627451, 1, 0, 1,
-0.7328871, -0.9349298, -1.463745, 0.654902, 1, 0, 1,
-0.7316248, 0.5015138, -1.471189, 0.6509804, 1, 0, 1,
-0.7307549, 0.7691748, -0.1363065, 0.6431373, 1, 0, 1,
-0.7290552, -1.669394, -1.095216, 0.6392157, 1, 0, 1,
-0.7273594, -1.198691, -4.088473, 0.6313726, 1, 0, 1,
-0.7259282, 1.289856, -1.937966, 0.627451, 1, 0, 1,
-0.7190137, -8.34045e-05, 0.9554852, 0.6196079, 1, 0, 1,
-0.7150155, -1.319026, -3.575146, 0.6156863, 1, 0, 1,
-0.7144316, 1.122575, 1.367772, 0.6078432, 1, 0, 1,
-0.7088675, 0.2634494, -0.286734, 0.6039216, 1, 0, 1,
-0.7072523, 0.6655902, 0.3307821, 0.5960785, 1, 0, 1,
-0.7041075, -0.2334698, -3.744818, 0.5882353, 1, 0, 1,
-0.699891, -1.370731, -2.158399, 0.5843138, 1, 0, 1,
-0.6994368, 0.3248253, -1.296219, 0.5764706, 1, 0, 1,
-0.6948171, -0.5461065, -2.605477, 0.572549, 1, 0, 1,
-0.6932209, 3.530555, -0.9827482, 0.5647059, 1, 0, 1,
-0.691975, 1.776131, 0.4953817, 0.5607843, 1, 0, 1,
-0.6904563, -0.8252798, -2.71286, 0.5529412, 1, 0, 1,
-0.6887388, -0.4163883, -1.907936, 0.5490196, 1, 0, 1,
-0.6822866, -0.8216189, -3.151236, 0.5411765, 1, 0, 1,
-0.6820043, -0.903973, -3.740826, 0.5372549, 1, 0, 1,
-0.6806411, 0.5079558, -0.6586961, 0.5294118, 1, 0, 1,
-0.6799101, -0.8944581, -1.861716, 0.5254902, 1, 0, 1,
-0.6771316, -1.109781, -3.985723, 0.5176471, 1, 0, 1,
-0.6731583, 1.139132, -0.2999249, 0.5137255, 1, 0, 1,
-0.6702091, -0.1762326, -1.148319, 0.5058824, 1, 0, 1,
-0.6650239, -0.09785353, -0.9962679, 0.5019608, 1, 0, 1,
-0.6626889, 0.6188482, -1.945442, 0.4941176, 1, 0, 1,
-0.6563031, -0.9782005, -3.17865, 0.4862745, 1, 0, 1,
-0.6532786, -1.050768, -2.039621, 0.4823529, 1, 0, 1,
-0.651275, -0.5705246, -1.942611, 0.4745098, 1, 0, 1,
-0.6502801, 0.1220079, -1.881603, 0.4705882, 1, 0, 1,
-0.6498171, 1.806193, 1.79334, 0.4627451, 1, 0, 1,
-0.6423037, 1.339259, -0.5692859, 0.4588235, 1, 0, 1,
-0.6366642, -0.8152912, -3.446206, 0.4509804, 1, 0, 1,
-0.6330308, 1.780811, -0.4322324, 0.4470588, 1, 0, 1,
-0.6245445, 0.9404116, -0.4237943, 0.4392157, 1, 0, 1,
-0.6243219, 0.3107574, -0.5719337, 0.4352941, 1, 0, 1,
-0.6215984, 0.7472646, -0.4101242, 0.427451, 1, 0, 1,
-0.618869, -0.5205221, -3.866905, 0.4235294, 1, 0, 1,
-0.6179959, 2.332701, 1.061747, 0.4156863, 1, 0, 1,
-0.6163953, -0.1473442, -1.180064, 0.4117647, 1, 0, 1,
-0.6111479, 0.2511708, -1.160038, 0.4039216, 1, 0, 1,
-0.6061447, 0.09032491, -0.8451603, 0.3960784, 1, 0, 1,
-0.6019337, 0.9886911, -1.359897, 0.3921569, 1, 0, 1,
-0.6019193, 0.3152971, -1.079888, 0.3843137, 1, 0, 1,
-0.59949, -0.356439, -2.957783, 0.3803922, 1, 0, 1,
-0.5982155, 0.04040618, -1.268088, 0.372549, 1, 0, 1,
-0.5981266, 0.2558525, -1.658924, 0.3686275, 1, 0, 1,
-0.5931392, -0.1775004, -2.658551, 0.3607843, 1, 0, 1,
-0.5911645, 2.179048, 0.0184476, 0.3568628, 1, 0, 1,
-0.583854, -0.7948915, -2.413348, 0.3490196, 1, 0, 1,
-0.5835451, -0.8043392, -3.44065, 0.345098, 1, 0, 1,
-0.5746874, 0.7389451, -0.7139201, 0.3372549, 1, 0, 1,
-0.573621, -0.5408708, -1.767306, 0.3333333, 1, 0, 1,
-0.5703518, 0.6822802, 0.1201103, 0.3254902, 1, 0, 1,
-0.566917, -0.6067939, -1.855394, 0.3215686, 1, 0, 1,
-0.5609804, -1.305035, -2.110547, 0.3137255, 1, 0, 1,
-0.5577084, 0.5570579, -1.117743, 0.3098039, 1, 0, 1,
-0.5434107, -1.538866, -4.625158, 0.3019608, 1, 0, 1,
-0.5391567, -0.8811443, -0.9001178, 0.2941177, 1, 0, 1,
-0.5385599, -0.5777297, -2.294805, 0.2901961, 1, 0, 1,
-0.535265, -1.655591, -2.011777, 0.282353, 1, 0, 1,
-0.5302845, 0.4898972, -1.732965, 0.2784314, 1, 0, 1,
-0.5299726, -2.450813, -2.320734, 0.2705882, 1, 0, 1,
-0.525229, 0.365858, -0.3758806, 0.2666667, 1, 0, 1,
-0.5247775, -1.214274, -4.085771, 0.2588235, 1, 0, 1,
-0.5237867, -2.356927, -3.026413, 0.254902, 1, 0, 1,
-0.5195485, -1.060538, -2.550286, 0.2470588, 1, 0, 1,
-0.5153719, 0.4377473, -2.442773, 0.2431373, 1, 0, 1,
-0.5146952, -0.7247202, -3.980452, 0.2352941, 1, 0, 1,
-0.5052346, -1.441125, -2.769045, 0.2313726, 1, 0, 1,
-0.4995242, -0.4081561, -2.637213, 0.2235294, 1, 0, 1,
-0.4978291, 0.01147331, -1.681369, 0.2196078, 1, 0, 1,
-0.4903267, 1.227171, -0.5580513, 0.2117647, 1, 0, 1,
-0.4893483, 1.455611, -0.9499102, 0.2078431, 1, 0, 1,
-0.4881462, 0.5681413, -1.344659, 0.2, 1, 0, 1,
-0.485234, -0.3950661, -2.167379, 0.1921569, 1, 0, 1,
-0.4820286, 0.5261674, -0.01473215, 0.1882353, 1, 0, 1,
-0.4749771, 0.4093699, -2.074561, 0.1803922, 1, 0, 1,
-0.4680235, -0.3339193, -1.716184, 0.1764706, 1, 0, 1,
-0.4675244, -0.8094563, -2.686019, 0.1686275, 1, 0, 1,
-0.4671283, 1.059744, 1.747072, 0.1647059, 1, 0, 1,
-0.4666625, 1.812191, 0.8739225, 0.1568628, 1, 0, 1,
-0.4584782, 1.438091, 0.8954844, 0.1529412, 1, 0, 1,
-0.4555617, 1.183767, -1.211501, 0.145098, 1, 0, 1,
-0.4553789, -0.464906, -4.063077, 0.1411765, 1, 0, 1,
-0.4549516, 1.201146, -0.6399246, 0.1333333, 1, 0, 1,
-0.4537672, 0.2043734, -1.166458, 0.1294118, 1, 0, 1,
-0.4496439, 0.5749467, 0.5523691, 0.1215686, 1, 0, 1,
-0.4471345, -1.125347, -4.031702, 0.1176471, 1, 0, 1,
-0.4464249, -1.044958, -3.075638, 0.1098039, 1, 0, 1,
-0.4455929, -0.7598466, -1.530176, 0.1058824, 1, 0, 1,
-0.4379453, 1.708112, -0.1305631, 0.09803922, 1, 0, 1,
-0.4284477, -0.09600624, -2.839397, 0.09019608, 1, 0, 1,
-0.4244155, -0.5389557, -2.673821, 0.08627451, 1, 0, 1,
-0.4231994, -1.856412, -2.335669, 0.07843138, 1, 0, 1,
-0.4212658, 1.110668, -0.6397644, 0.07450981, 1, 0, 1,
-0.4199123, 1.347228, 0.3996969, 0.06666667, 1, 0, 1,
-0.4191543, -1.060193, -2.553517, 0.0627451, 1, 0, 1,
-0.4175989, -0.6889021, -2.669006, 0.05490196, 1, 0, 1,
-0.4166821, 1.395324, 1.18111, 0.05098039, 1, 0, 1,
-0.4165874, -0.8971531, -2.315508, 0.04313726, 1, 0, 1,
-0.4137396, -0.1168789, -2.388305, 0.03921569, 1, 0, 1,
-0.4113395, 0.3909504, 0.2674423, 0.03137255, 1, 0, 1,
-0.4093426, 0.1900596, -2.815447, 0.02745098, 1, 0, 1,
-0.4035529, 0.5987712, 0.6050891, 0.01960784, 1, 0, 1,
-0.4013714, -0.7954354, -2.37148, 0.01568628, 1, 0, 1,
-0.3984288, -2.414405, -5.413215, 0.007843138, 1, 0, 1,
-0.3971308, 1.11993, 0.8218793, 0.003921569, 1, 0, 1,
-0.3892539, 0.2918039, 0.4319635, 0, 1, 0.003921569, 1,
-0.3867691, 1.898548, 0.2706561, 0, 1, 0.01176471, 1,
-0.3826008, 0.02135907, -0.9185859, 0, 1, 0.01568628, 1,
-0.376148, 0.1244744, -1.894415, 0, 1, 0.02352941, 1,
-0.3749276, 1.790752, 1.653279, 0, 1, 0.02745098, 1,
-0.373062, 0.07305127, -0.1705332, 0, 1, 0.03529412, 1,
-0.3654032, 1.155722, 1.533137, 0, 1, 0.03921569, 1,
-0.3628018, 0.1913295, -0.3221884, 0, 1, 0.04705882, 1,
-0.3613531, -0.3332471, -2.436349, 0, 1, 0.05098039, 1,
-0.3586014, -0.165724, -1.848243, 0, 1, 0.05882353, 1,
-0.3573991, -1.49445, -2.504628, 0, 1, 0.0627451, 1,
-0.3514209, -0.3810061, -2.780396, 0, 1, 0.07058824, 1,
-0.3398767, -0.1573052, -1.943225, 0, 1, 0.07450981, 1,
-0.3309185, -1.016947, -3.447162, 0, 1, 0.08235294, 1,
-0.3301634, -0.06021276, 0.1266909, 0, 1, 0.08627451, 1,
-0.3298166, 0.07144795, -1.801017, 0, 1, 0.09411765, 1,
-0.3288585, 0.3691345, -1.671055, 0, 1, 0.1019608, 1,
-0.3278841, -0.4384119, -1.589268, 0, 1, 0.1058824, 1,
-0.3236476, 0.3770196, -0.53345, 0, 1, 0.1137255, 1,
-0.3195443, 1.257489, -0.5257503, 0, 1, 0.1176471, 1,
-0.3170035, 0.6681631, -0.4779892, 0, 1, 0.1254902, 1,
-0.3162574, 1.339017, -1.030637, 0, 1, 0.1294118, 1,
-0.3162296, -0.9889914, -2.717144, 0, 1, 0.1372549, 1,
-0.3143011, -1.028314, -2.588164, 0, 1, 0.1411765, 1,
-0.3039045, -1.549307, -3.818983, 0, 1, 0.1490196, 1,
-0.3030716, 0.06513929, -0.6535245, 0, 1, 0.1529412, 1,
-0.3023167, 1.380982, -0.02657516, 0, 1, 0.1607843, 1,
-0.3016483, -0.8584363, -2.639822, 0, 1, 0.1647059, 1,
-0.3000058, 0.2371866, -0.1272216, 0, 1, 0.172549, 1,
-0.2878426, 0.7919933, -0.7399852, 0, 1, 0.1764706, 1,
-0.2875812, 0.4643961, 0.1420632, 0, 1, 0.1843137, 1,
-0.286987, 0.4888987, -1.924375, 0, 1, 0.1882353, 1,
-0.2849001, -0.02850302, -2.026889, 0, 1, 0.1960784, 1,
-0.283139, 0.12815, -1.790657, 0, 1, 0.2039216, 1,
-0.2714286, -0.03114233, -2.272542, 0, 1, 0.2078431, 1,
-0.2696213, 0.8035601, -0.587486, 0, 1, 0.2156863, 1,
-0.2680965, 0.4899194, -1.402042, 0, 1, 0.2196078, 1,
-0.2651764, -0.3597954, -3.960437, 0, 1, 0.227451, 1,
-0.2612057, -0.7263343, -3.033692, 0, 1, 0.2313726, 1,
-0.2597314, 0.1408757, 0.01335847, 0, 1, 0.2392157, 1,
-0.2584955, 0.4751313, -1.13064, 0, 1, 0.2431373, 1,
-0.2561683, -0.6424847, -0.3696333, 0, 1, 0.2509804, 1,
-0.2555298, 1.293543, -0.329088, 0, 1, 0.254902, 1,
-0.2491402, 1.043084, -0.01356538, 0, 1, 0.2627451, 1,
-0.2485148, 0.4045219, 0.06153625, 0, 1, 0.2666667, 1,
-0.2476359, 0.5906392, 0.8248152, 0, 1, 0.2745098, 1,
-0.2455605, 0.2168381, -1.585934, 0, 1, 0.2784314, 1,
-0.244784, 0.1818348, -1.6184, 0, 1, 0.2862745, 1,
-0.237262, -0.6324235, -1.669029, 0, 1, 0.2901961, 1,
-0.232228, -1.388265, -1.506626, 0, 1, 0.2980392, 1,
-0.2299222, -0.970307, -2.917765, 0, 1, 0.3058824, 1,
-0.2275582, 1.440786, 0.357483, 0, 1, 0.3098039, 1,
-0.2250586, 0.2348066, -1.429299, 0, 1, 0.3176471, 1,
-0.2234958, 1.344283, -0.8690811, 0, 1, 0.3215686, 1,
-0.221726, -0.2960888, -1.757799, 0, 1, 0.3294118, 1,
-0.2216695, 0.6248654, -1.040379, 0, 1, 0.3333333, 1,
-0.2207898, -0.8488815, -4.271862, 0, 1, 0.3411765, 1,
-0.2180307, -0.3751704, -1.578803, 0, 1, 0.345098, 1,
-0.2160283, -0.1995844, -2.985093, 0, 1, 0.3529412, 1,
-0.2137953, 0.713592, 1.330887, 0, 1, 0.3568628, 1,
-0.2118069, -0.6098319, -3.970607, 0, 1, 0.3647059, 1,
-0.2113174, -1.255502, -2.691175, 0, 1, 0.3686275, 1,
-0.2080741, -0.1772262, -1.665211, 0, 1, 0.3764706, 1,
-0.2072693, -0.2554825, -3.952104, 0, 1, 0.3803922, 1,
-0.1985457, -0.660245, -4.094719, 0, 1, 0.3882353, 1,
-0.1955059, -0.104737, -2.371725, 0, 1, 0.3921569, 1,
-0.1941727, -0.4024891, -4.431415, 0, 1, 0.4, 1,
-0.1917526, 1.206164, 0.1126405, 0, 1, 0.4078431, 1,
-0.1909381, 0.1778612, 0.4619133, 0, 1, 0.4117647, 1,
-0.1880045, 0.7558875, -1.735572, 0, 1, 0.4196078, 1,
-0.1851977, 1.752083, -0.3468575, 0, 1, 0.4235294, 1,
-0.1812392, 0.5544923, -0.7916747, 0, 1, 0.4313726, 1,
-0.1811262, 0.9316226, 1.58059, 0, 1, 0.4352941, 1,
-0.1751391, 0.009102339, -2.111313, 0, 1, 0.4431373, 1,
-0.174917, -0.9155574, -2.144078, 0, 1, 0.4470588, 1,
-0.1685042, -1.288519, -2.640471, 0, 1, 0.454902, 1,
-0.1647459, -1.602166, -3.960456, 0, 1, 0.4588235, 1,
-0.1614413, -1.925231, -3.877079, 0, 1, 0.4666667, 1,
-0.1611232, -0.9077948, -4.506557, 0, 1, 0.4705882, 1,
-0.1586451, 0.02098332, -0.6805372, 0, 1, 0.4784314, 1,
-0.1514019, -0.6988642, -2.175942, 0, 1, 0.4823529, 1,
-0.1498195, 1.602687, 0.8007356, 0, 1, 0.4901961, 1,
-0.1495699, 1.722639, 1.009615, 0, 1, 0.4941176, 1,
-0.1402051, -0.0878427, -0.01384574, 0, 1, 0.5019608, 1,
-0.1353769, -0.4251842, -1.766485, 0, 1, 0.509804, 1,
-0.1348799, 0.8478512, -1.346254, 0, 1, 0.5137255, 1,
-0.1345878, -0.1907838, -3.122344, 0, 1, 0.5215687, 1,
-0.133786, -1.317856, -2.70137, 0, 1, 0.5254902, 1,
-0.1292903, 1.789955, -0.3104149, 0, 1, 0.5333334, 1,
-0.1278703, 0.5574229, -1.653407, 0, 1, 0.5372549, 1,
-0.1268298, -0.8692126, -3.890594, 0, 1, 0.5450981, 1,
-0.1258107, 1.113098, -0.1071, 0, 1, 0.5490196, 1,
-0.1224342, 0.8460008, 0.1572168, 0, 1, 0.5568628, 1,
-0.1223591, 1.415592, 1.888837, 0, 1, 0.5607843, 1,
-0.1221302, -0.7501657, -1.819489, 0, 1, 0.5686275, 1,
-0.12042, -0.9070595, -3.289027, 0, 1, 0.572549, 1,
-0.1199863, -0.4740726, -4.294801, 0, 1, 0.5803922, 1,
-0.1195253, 0.2580001, 1.77775, 0, 1, 0.5843138, 1,
-0.1185134, -0.2975613, -3.543644, 0, 1, 0.5921569, 1,
-0.1184797, -1.566191, -5.443374, 0, 1, 0.5960785, 1,
-0.1172165, -0.7544187, -3.063017, 0, 1, 0.6039216, 1,
-0.1139886, -1.393203, -2.408318, 0, 1, 0.6117647, 1,
-0.1138408, 0.01378196, -2.050561, 0, 1, 0.6156863, 1,
-0.1096088, 1.460316, -0.2572637, 0, 1, 0.6235294, 1,
-0.1068062, -0.1849174, -1.373626, 0, 1, 0.627451, 1,
-0.09872232, 0.2264319, -1.267832, 0, 1, 0.6352941, 1,
-0.09717678, 0.6545761, 0.1810002, 0, 1, 0.6392157, 1,
-0.09527098, -0.6529313, -3.649907, 0, 1, 0.6470588, 1,
-0.09210391, -0.2760336, -3.939259, 0, 1, 0.6509804, 1,
-0.09117892, -1.241605, -2.127178, 0, 1, 0.6588235, 1,
-0.08776647, 0.1149585, -0.2611208, 0, 1, 0.6627451, 1,
-0.08660617, 0.4890578, 0.908911, 0, 1, 0.6705883, 1,
-0.08618899, 0.3365991, -1.911035, 0, 1, 0.6745098, 1,
-0.08544161, -1.259448, -1.954192, 0, 1, 0.682353, 1,
-0.08266768, 0.5120384, 0.4761024, 0, 1, 0.6862745, 1,
-0.07732711, 0.8999676, -0.1712365, 0, 1, 0.6941177, 1,
-0.07402144, 0.026703, -1.338915, 0, 1, 0.7019608, 1,
-0.07302006, 2.204734, 1.224261, 0, 1, 0.7058824, 1,
-0.07255431, -0.7422051, -2.080838, 0, 1, 0.7137255, 1,
-0.07056506, -1.795708, -4.341708, 0, 1, 0.7176471, 1,
-0.05417682, -1.25741, -3.989104, 0, 1, 0.7254902, 1,
-0.05413261, -0.103559, -4.414601, 0, 1, 0.7294118, 1,
-0.05159942, -0.2247064, -3.248537, 0, 1, 0.7372549, 1,
-0.05070263, -0.9432305, -1.594688, 0, 1, 0.7411765, 1,
-0.0489544, 0.3138624, 0.8120804, 0, 1, 0.7490196, 1,
-0.04882437, -1.709779, -1.269789, 0, 1, 0.7529412, 1,
-0.04879193, -0.5397071, -4.18635, 0, 1, 0.7607843, 1,
-0.04280024, 2.06297, -0.2704161, 0, 1, 0.7647059, 1,
-0.03904723, -0.433745, -3.302477, 0, 1, 0.772549, 1,
-0.03486911, 1.206001, -1.10808, 0, 1, 0.7764706, 1,
-0.03044078, 1.059864, 0.1678259, 0, 1, 0.7843137, 1,
-0.02711142, -0.5484626, -2.200226, 0, 1, 0.7882353, 1,
-0.02525301, 1.442372, 0.6879357, 0, 1, 0.7960784, 1,
-0.02390074, 2.012262, -1.824526, 0, 1, 0.8039216, 1,
-0.02319426, 0.5118176, 0.1683801, 0, 1, 0.8078431, 1,
-0.01683446, -1.053827, -4.669055, 0, 1, 0.8156863, 1,
-0.01494931, 0.8702385, -0.9791341, 0, 1, 0.8196079, 1,
-0.01355589, 0.9387658, 0.3953724, 0, 1, 0.827451, 1,
-0.01225029, 0.6554434, 0.002096595, 0, 1, 0.8313726, 1,
-0.01115787, 0.9473107, -1.06409, 0, 1, 0.8392157, 1,
-0.006778497, 2.066767, -0.5060795, 0, 1, 0.8431373, 1,
-0.002941482, 1.131842, -0.3377698, 0, 1, 0.8509804, 1,
0.001715387, -0.9491822, 4.586246, 0, 1, 0.854902, 1,
0.002012079, -0.7960546, 3.235739, 0, 1, 0.8627451, 1,
0.002792357, 0.5525253, 0.2046936, 0, 1, 0.8666667, 1,
0.005194243, -1.052983, 4.027541, 0, 1, 0.8745098, 1,
0.01124032, -0.6565832, 4.732451, 0, 1, 0.8784314, 1,
0.01198398, -0.5635887, 3.505338, 0, 1, 0.8862745, 1,
0.01345497, -0.4350776, 4.768037, 0, 1, 0.8901961, 1,
0.01609751, 1.203143, -0.7748764, 0, 1, 0.8980392, 1,
0.01927858, 0.7514305, -0.4457526, 0, 1, 0.9058824, 1,
0.02280529, 0.8173558, -1.1639, 0, 1, 0.9098039, 1,
0.02304667, -0.7123066, 3.856562, 0, 1, 0.9176471, 1,
0.03073673, 1.269926, 0.1112068, 0, 1, 0.9215686, 1,
0.03109424, -0.5012403, 1.334373, 0, 1, 0.9294118, 1,
0.03461269, -2.027778, 1.245741, 0, 1, 0.9333333, 1,
0.03974962, 0.05450596, -0.09761238, 0, 1, 0.9411765, 1,
0.04045496, 0.3088522, 0.9321092, 0, 1, 0.945098, 1,
0.04770107, 1.318029, -1.341135, 0, 1, 0.9529412, 1,
0.04784912, 0.7829976, -0.8528413, 0, 1, 0.9568627, 1,
0.05221402, 0.8548599, 0.6307677, 0, 1, 0.9647059, 1,
0.05359401, -0.7170055, 1.568896, 0, 1, 0.9686275, 1,
0.05608296, -1.272982, 2.822499, 0, 1, 0.9764706, 1,
0.0572257, -0.2224906, 3.33297, 0, 1, 0.9803922, 1,
0.06346777, 0.4615552, -0.07091452, 0, 1, 0.9882353, 1,
0.06533474, -0.07465554, 1.890233, 0, 1, 0.9921569, 1,
0.06752899, 0.2110329, -0.699571, 0, 1, 1, 1,
0.0704461, 0.1040011, 0.2369875, 0, 0.9921569, 1, 1,
0.07585947, -2.34799, 4.717924, 0, 0.9882353, 1, 1,
0.07847087, 2.382209, 0.4051155, 0, 0.9803922, 1, 1,
0.08953343, 0.252591, 1.580047, 0, 0.9764706, 1, 1,
0.08961181, -0.6683756, 4.089157, 0, 0.9686275, 1, 1,
0.0911744, 0.5369478, -0.60707, 0, 0.9647059, 1, 1,
0.09138329, -0.446831, 1.692255, 0, 0.9568627, 1, 1,
0.09362395, -0.6916528, 4.553108, 0, 0.9529412, 1, 1,
0.09509591, 0.8954436, 1.384525, 0, 0.945098, 1, 1,
0.09575043, -1.705433, 4.255351, 0, 0.9411765, 1, 1,
0.09630637, 0.8840861, 0.8929235, 0, 0.9333333, 1, 1,
0.09850817, -1.067581, 2.262153, 0, 0.9294118, 1, 1,
0.1066396, 0.99181, -0.878335, 0, 0.9215686, 1, 1,
0.1077884, -0.7464858, 2.748535, 0, 0.9176471, 1, 1,
0.1084433, -0.2442744, 2.330251, 0, 0.9098039, 1, 1,
0.1107225, -0.4138989, 2.840978, 0, 0.9058824, 1, 1,
0.1118071, -0.5035767, 4.094418, 0, 0.8980392, 1, 1,
0.1130066, -0.2010275, 2.513955, 0, 0.8901961, 1, 1,
0.1148392, 1.064445, 1.542006, 0, 0.8862745, 1, 1,
0.1156907, -0.210888, 0.7421005, 0, 0.8784314, 1, 1,
0.1166576, -0.4163716, 3.900477, 0, 0.8745098, 1, 1,
0.1217578, 1.062602, 0.8710145, 0, 0.8666667, 1, 1,
0.1247602, -0.4853688, 3.317895, 0, 0.8627451, 1, 1,
0.1253697, -0.8975635, 3.957696, 0, 0.854902, 1, 1,
0.1267398, 0.3715144, 0.8162713, 0, 0.8509804, 1, 1,
0.1276586, -0.141882, 1.485865, 0, 0.8431373, 1, 1,
0.1278612, -1.645437, 5.530988, 0, 0.8392157, 1, 1,
0.1286958, -0.9543495, 3.516313, 0, 0.8313726, 1, 1,
0.1293105, 0.06063796, 0.7947673, 0, 0.827451, 1, 1,
0.1303561, -0.01709111, 0.5137008, 0, 0.8196079, 1, 1,
0.1312249, 0.1674109, 0.4738216, 0, 0.8156863, 1, 1,
0.1354804, -2.153389, 2.253042, 0, 0.8078431, 1, 1,
0.1380295, -2.053422, 4.378515, 0, 0.8039216, 1, 1,
0.1411265, -0.1120416, 2.95386, 0, 0.7960784, 1, 1,
0.142622, 1.021191, 1.069847, 0, 0.7882353, 1, 1,
0.1470705, -0.3496195, 2.862684, 0, 0.7843137, 1, 1,
0.1512166, 0.3027121, 0.0177882, 0, 0.7764706, 1, 1,
0.1527687, -1.602607, 3.448078, 0, 0.772549, 1, 1,
0.1544039, -1.24996, 5.206743, 0, 0.7647059, 1, 1,
0.1618456, 0.2521494, -0.7391968, 0, 0.7607843, 1, 1,
0.1646127, 0.7561356, 0.2049365, 0, 0.7529412, 1, 1,
0.1657496, 0.1912893, 1.389126, 0, 0.7490196, 1, 1,
0.1696755, -1.012398, 2.56237, 0, 0.7411765, 1, 1,
0.173539, -1.479951, 2.666617, 0, 0.7372549, 1, 1,
0.1756559, 0.09075676, 0.9447104, 0, 0.7294118, 1, 1,
0.1763247, -0.6048679, 3.183811, 0, 0.7254902, 1, 1,
0.177348, -0.8563596, 2.187611, 0, 0.7176471, 1, 1,
0.1795301, 1.271159, -0.9494258, 0, 0.7137255, 1, 1,
0.1816021, 0.9846097, -1.37563, 0, 0.7058824, 1, 1,
0.181952, -0.240864, 3.769094, 0, 0.6980392, 1, 1,
0.1827904, -1.223325, 5.13087, 0, 0.6941177, 1, 1,
0.1834339, 1.517765, 1.285152, 0, 0.6862745, 1, 1,
0.1850942, -1.132967, 3.458673, 0, 0.682353, 1, 1,
0.1859322, 1.070929, 0.7001617, 0, 0.6745098, 1, 1,
0.1910891, 0.5852357, -0.2441557, 0, 0.6705883, 1, 1,
0.1936855, -0.07158387, 1.639109, 0, 0.6627451, 1, 1,
0.1956609, 1.048145, -0.7405487, 0, 0.6588235, 1, 1,
0.1983537, 0.4434599, -1.725893, 0, 0.6509804, 1, 1,
0.204617, -1.004096, 1.932977, 0, 0.6470588, 1, 1,
0.2069024, -2.18152, 3.327442, 0, 0.6392157, 1, 1,
0.2130746, -1.256665, 4.275257, 0, 0.6352941, 1, 1,
0.2131134, 0.09714027, 2.182891, 0, 0.627451, 1, 1,
0.2153127, 0.7750668, 0.08519768, 0, 0.6235294, 1, 1,
0.2163675, 0.5251296, -0.5386301, 0, 0.6156863, 1, 1,
0.2187102, -0.3604916, 1.102552, 0, 0.6117647, 1, 1,
0.2254938, 0.3595478, 0.5825086, 0, 0.6039216, 1, 1,
0.2290166, -0.6496059, 1.83437, 0, 0.5960785, 1, 1,
0.2297805, 0.8802914, -0.7959996, 0, 0.5921569, 1, 1,
0.2363858, 1.374656, 0.9651418, 0, 0.5843138, 1, 1,
0.2365156, -0.5654223, 4.483004, 0, 0.5803922, 1, 1,
0.2393646, -1.798985, 3.156458, 0, 0.572549, 1, 1,
0.2429745, -0.2885791, 0.2783797, 0, 0.5686275, 1, 1,
0.2431741, -1.235063, 3.380319, 0, 0.5607843, 1, 1,
0.243652, 0.2479984, 0.2196875, 0, 0.5568628, 1, 1,
0.2508224, 0.03768703, 1.406271, 0, 0.5490196, 1, 1,
0.2524216, 1.342678, 0.426355, 0, 0.5450981, 1, 1,
0.2542774, -0.203453, 2.851666, 0, 0.5372549, 1, 1,
0.2559272, -0.6837687, 0.04319505, 0, 0.5333334, 1, 1,
0.2571305, -0.6591946, 2.6463, 0, 0.5254902, 1, 1,
0.2641232, -0.8565848, 1.102295, 0, 0.5215687, 1, 1,
0.2650899, 1.422638, 2.877367, 0, 0.5137255, 1, 1,
0.2682412, 0.4384213, -1.276996, 0, 0.509804, 1, 1,
0.268436, 0.8599877, 1.676499, 0, 0.5019608, 1, 1,
0.2702898, -0.7019302, 2.678294, 0, 0.4941176, 1, 1,
0.2744412, -1.651703, 3.915912, 0, 0.4901961, 1, 1,
0.2745094, 0.3367903, 1.094529, 0, 0.4823529, 1, 1,
0.2788676, -1.168962, 3.025856, 0, 0.4784314, 1, 1,
0.2811421, 1.15541, 0.4521224, 0, 0.4705882, 1, 1,
0.2845993, -1.771146, 2.215979, 0, 0.4666667, 1, 1,
0.2882875, -0.2685015, 2.528114, 0, 0.4588235, 1, 1,
0.2885271, 1.064387, -3.081977, 0, 0.454902, 1, 1,
0.3074576, 1.246794, 0.7026177, 0, 0.4470588, 1, 1,
0.3080002, 0.3707814, 0.578531, 0, 0.4431373, 1, 1,
0.3093672, 2.892512, -0.753413, 0, 0.4352941, 1, 1,
0.3096705, 0.4719435, 1.239112, 0, 0.4313726, 1, 1,
0.3144309, -0.7899233, 2.224449, 0, 0.4235294, 1, 1,
0.3187398, 0.6125765, 2.306194, 0, 0.4196078, 1, 1,
0.3191567, -2.56561, 3.084676, 0, 0.4117647, 1, 1,
0.3203705, -0.04919536, 1.967749, 0, 0.4078431, 1, 1,
0.3208647, 1.479068, 1.267878, 0, 0.4, 1, 1,
0.3218094, 0.9767764, 0.6074764, 0, 0.3921569, 1, 1,
0.3240216, -0.7812378, 2.356307, 0, 0.3882353, 1, 1,
0.3246169, 1.036671, 3.097623, 0, 0.3803922, 1, 1,
0.3282675, 0.2031047, 1.974403, 0, 0.3764706, 1, 1,
0.3292255, 1.063673, -0.2401599, 0, 0.3686275, 1, 1,
0.3302599, 0.04727858, 2.902333, 0, 0.3647059, 1, 1,
0.3305174, 0.2297119, -0.1338914, 0, 0.3568628, 1, 1,
0.331365, -0.4732948, 1.445204, 0, 0.3529412, 1, 1,
0.3319082, 1.598273, -0.355361, 0, 0.345098, 1, 1,
0.3327238, 2.44629, -0.773454, 0, 0.3411765, 1, 1,
0.3339895, -1.831277, 4.383268, 0, 0.3333333, 1, 1,
0.3389751, 1.317989, 0.2054956, 0, 0.3294118, 1, 1,
0.3394789, 0.03127345, 0.8490389, 0, 0.3215686, 1, 1,
0.3419071, 0.2017804, 1.160994, 0, 0.3176471, 1, 1,
0.3429243, -0.9724435, 4.451271, 0, 0.3098039, 1, 1,
0.3430171, 1.200485, -1.478855, 0, 0.3058824, 1, 1,
0.3442135, 0.1239263, 0.4452848, 0, 0.2980392, 1, 1,
0.3442509, 2.609882, 0.2665505, 0, 0.2901961, 1, 1,
0.344413, 0.8248124, 0.2858821, 0, 0.2862745, 1, 1,
0.3453299, 1.455404, 0.2449607, 0, 0.2784314, 1, 1,
0.3586671, 0.9909331, 1.588165, 0, 0.2745098, 1, 1,
0.3593632, -2.399656, 3.672069, 0, 0.2666667, 1, 1,
0.3608678, -0.4658668, 4.24501, 0, 0.2627451, 1, 1,
0.3649686, 0.5387487, 0.5415279, 0, 0.254902, 1, 1,
0.3661288, -1.056826, 1.970976, 0, 0.2509804, 1, 1,
0.3714693, 0.2091822, 1.470923, 0, 0.2431373, 1, 1,
0.37453, 0.4003471, 0.2790672, 0, 0.2392157, 1, 1,
0.3776247, 1.717344, -0.1189869, 0, 0.2313726, 1, 1,
0.3780496, 1.41775, 0.5929159, 0, 0.227451, 1, 1,
0.3825511, -1.712428, 1.144438, 0, 0.2196078, 1, 1,
0.3884594, -1.073463, 2.605526, 0, 0.2156863, 1, 1,
0.3910424, -0.6047106, 3.275054, 0, 0.2078431, 1, 1,
0.3913104, 0.3318118, 0.2875805, 0, 0.2039216, 1, 1,
0.3966081, -0.1372294, 3.606387, 0, 0.1960784, 1, 1,
0.399131, -1.465985, 3.422241, 0, 0.1882353, 1, 1,
0.4062944, -0.8996366, 2.813515, 0, 0.1843137, 1, 1,
0.4093003, 0.4376295, 0.6190605, 0, 0.1764706, 1, 1,
0.4135649, 0.5572403, 1.244277, 0, 0.172549, 1, 1,
0.415154, 1.104468, 2.147018, 0, 0.1647059, 1, 1,
0.4171122, 0.7574753, -0.08345458, 0, 0.1607843, 1, 1,
0.4218975, 1.09145, 1.284652, 0, 0.1529412, 1, 1,
0.4219192, 1.899954, -0.1272821, 0, 0.1490196, 1, 1,
0.4247769, -0.6809995, 2.518457, 0, 0.1411765, 1, 1,
0.4260918, 0.2870796, 0.4426025, 0, 0.1372549, 1, 1,
0.4261765, 0.7565713, -0.7177692, 0, 0.1294118, 1, 1,
0.4275982, -0.4961027, 3.790376, 0, 0.1254902, 1, 1,
0.4277172, 1.528376, -0.05645441, 0, 0.1176471, 1, 1,
0.42834, 0.7535611, 0.3281286, 0, 0.1137255, 1, 1,
0.4285663, -0.5392671, 3.009284, 0, 0.1058824, 1, 1,
0.4294881, 0.3787813, 0.7550704, 0, 0.09803922, 1, 1,
0.4299262, -0.4464047, 3.198921, 0, 0.09411765, 1, 1,
0.4357243, -0.1984422, 2.37229, 0, 0.08627451, 1, 1,
0.4375433, 0.8334028, 0.5489904, 0, 0.08235294, 1, 1,
0.4428592, 0.1937536, 0.5136543, 0, 0.07450981, 1, 1,
0.4441905, 0.2596767, 2.10676, 0, 0.07058824, 1, 1,
0.4467101, -0.3074599, 3.410005, 0, 0.0627451, 1, 1,
0.4474332, -1.431877, 3.735337, 0, 0.05882353, 1, 1,
0.4498285, -0.8408622, 2.085497, 0, 0.05098039, 1, 1,
0.4569537, 0.359809, 1.408431, 0, 0.04705882, 1, 1,
0.4604881, -1.812788, 2.899571, 0, 0.03921569, 1, 1,
0.4611614, -0.7658933, 2.887559, 0, 0.03529412, 1, 1,
0.4619312, -1.471649, 4.006459, 0, 0.02745098, 1, 1,
0.4649493, 1.433886, -1.121566, 0, 0.02352941, 1, 1,
0.4683221, -0.2492761, 1.076889, 0, 0.01568628, 1, 1,
0.4697856, 0.06440448, 2.574197, 0, 0.01176471, 1, 1,
0.4713757, -1.333396, 1.147345, 0, 0.003921569, 1, 1,
0.4725412, 0.252429, 1.390649, 0.003921569, 0, 1, 1,
0.4735882, -0.0805074, 0.0244862, 0.007843138, 0, 1, 1,
0.4824398, -0.2647927, 1.350103, 0.01568628, 0, 1, 1,
0.4826016, -0.7434474, 1.658867, 0.01960784, 0, 1, 1,
0.4828106, -1.300015, 2.55489, 0.02745098, 0, 1, 1,
0.4832498, 0.3366293, 0.8014147, 0.03137255, 0, 1, 1,
0.4873526, -0.1265588, 2.004763, 0.03921569, 0, 1, 1,
0.4874938, 0.3824157, 1.548402, 0.04313726, 0, 1, 1,
0.4891912, -0.1339442, 1.328028, 0.05098039, 0, 1, 1,
0.4933151, -1.745984, 3.489654, 0.05490196, 0, 1, 1,
0.4956107, -1.072718, 3.528878, 0.0627451, 0, 1, 1,
0.4968795, 0.9555308, -0.2883241, 0.06666667, 0, 1, 1,
0.4981646, -1.525607, 2.820665, 0.07450981, 0, 1, 1,
0.4984808, -0.01463579, 2.163293, 0.07843138, 0, 1, 1,
0.5012116, 0.2401944, 2.101698, 0.08627451, 0, 1, 1,
0.5059813, 1.372183, 0.6441131, 0.09019608, 0, 1, 1,
0.5146372, -0.07535356, 1.60242, 0.09803922, 0, 1, 1,
0.5203208, -0.7978405, 2.106586, 0.1058824, 0, 1, 1,
0.5213248, -0.6069398, 1.577608, 0.1098039, 0, 1, 1,
0.5279301, 0.7269161, 1.339104, 0.1176471, 0, 1, 1,
0.5334454, -0.4510171, 1.056507, 0.1215686, 0, 1, 1,
0.5343094, -1.018157, 2.922296, 0.1294118, 0, 1, 1,
0.5348035, 0.7601636, 0.444307, 0.1333333, 0, 1, 1,
0.5397855, -1.422941, 3.796227, 0.1411765, 0, 1, 1,
0.540071, -0.251967, 2.317061, 0.145098, 0, 1, 1,
0.5438209, 1.445578, 1.231136, 0.1529412, 0, 1, 1,
0.5445047, 0.1314095, 0.4107191, 0.1568628, 0, 1, 1,
0.5447488, -0.4996364, 2.309962, 0.1647059, 0, 1, 1,
0.5471314, -1.521975, 4.670964, 0.1686275, 0, 1, 1,
0.5473931, -0.9828129, 1.911502, 0.1764706, 0, 1, 1,
0.5476722, -0.6695824, 2.733182, 0.1803922, 0, 1, 1,
0.5500232, -0.03810568, 0.9938828, 0.1882353, 0, 1, 1,
0.5513978, -0.6394589, 2.038371, 0.1921569, 0, 1, 1,
0.5569516, 0.3607242, 2.198696, 0.2, 0, 1, 1,
0.5576169, 1.010565, 1.452665, 0.2078431, 0, 1, 1,
0.5626453, 0.789748, 1.668804, 0.2117647, 0, 1, 1,
0.5655637, 0.8005084, 1.249684, 0.2196078, 0, 1, 1,
0.5659738, 1.130186, 0.9530475, 0.2235294, 0, 1, 1,
0.5665398, -0.1069164, 3.455447, 0.2313726, 0, 1, 1,
0.5671809, -0.079115, 0.41765, 0.2352941, 0, 1, 1,
0.5680349, -1.568569, 0.9602937, 0.2431373, 0, 1, 1,
0.5721308, 0.149149, 0.7229577, 0.2470588, 0, 1, 1,
0.5763949, 0.8013877, 1.274713, 0.254902, 0, 1, 1,
0.5806015, -1.743546, 1.730053, 0.2588235, 0, 1, 1,
0.5908771, -0.6746437, 3.43034, 0.2666667, 0, 1, 1,
0.5926292, 1.333439, -0.2849152, 0.2705882, 0, 1, 1,
0.5947337, 0.1956736, 1.11467, 0.2784314, 0, 1, 1,
0.5949294, 2.141956, 0.9424062, 0.282353, 0, 1, 1,
0.5966903, -1.534146, 2.258473, 0.2901961, 0, 1, 1,
0.597428, -0.5788051, 3.805165, 0.2941177, 0, 1, 1,
0.5990034, 1.109413, 0.445596, 0.3019608, 0, 1, 1,
0.6001191, 0.5657275, 1.880405, 0.3098039, 0, 1, 1,
0.6008415, -0.3680786, 2.4411, 0.3137255, 0, 1, 1,
0.603143, 0.3320437, 1.144411, 0.3215686, 0, 1, 1,
0.6064873, 1.443955, 0.09219571, 0.3254902, 0, 1, 1,
0.6146632, -1.018922, 3.466405, 0.3333333, 0, 1, 1,
0.6150256, 0.1150837, 1.565009, 0.3372549, 0, 1, 1,
0.6199253, -0.8715849, 2.800015, 0.345098, 0, 1, 1,
0.6208237, 1.874903, -0.3339674, 0.3490196, 0, 1, 1,
0.6240807, 0.4395337, 0.09687256, 0.3568628, 0, 1, 1,
0.6249124, -0.926168, 2.172498, 0.3607843, 0, 1, 1,
0.6319299, -0.2351651, 1.762528, 0.3686275, 0, 1, 1,
0.6330377, 1.162285, -0.380612, 0.372549, 0, 1, 1,
0.636218, 1.140215, 1.105742, 0.3803922, 0, 1, 1,
0.6383311, 0.1280069, 1.66042, 0.3843137, 0, 1, 1,
0.6460239, -0.5635364, 3.1769, 0.3921569, 0, 1, 1,
0.65043, 1.017462, 0.7458166, 0.3960784, 0, 1, 1,
0.6552484, 0.8610228, 1.654648, 0.4039216, 0, 1, 1,
0.6577262, -1.529999, 4.3912, 0.4117647, 0, 1, 1,
0.6594372, 0.6796924, 0.8209084, 0.4156863, 0, 1, 1,
0.6603056, 0.9285182, 0.4167721, 0.4235294, 0, 1, 1,
0.666935, -0.6307806, 1.801505, 0.427451, 0, 1, 1,
0.6684842, -0.3077789, 2.374712, 0.4352941, 0, 1, 1,
0.6769211, 0.4245952, 1.292341, 0.4392157, 0, 1, 1,
0.6776909, 0.5149765, 2.090905, 0.4470588, 0, 1, 1,
0.6795409, 0.6596855, 1.064644, 0.4509804, 0, 1, 1,
0.6921118, 0.3137314, 0.1141924, 0.4588235, 0, 1, 1,
0.6939962, -0.2357299, 0.953213, 0.4627451, 0, 1, 1,
0.6962027, -1.527006, 3.55224, 0.4705882, 0, 1, 1,
0.70047, -1.745272, 2.421559, 0.4745098, 0, 1, 1,
0.7011392, 0.337188, -0.106039, 0.4823529, 0, 1, 1,
0.7049248, 1.589239, 0.1711868, 0.4862745, 0, 1, 1,
0.7065283, -0.7928609, 1.632342, 0.4941176, 0, 1, 1,
0.7070146, -0.5962117, 1.805087, 0.5019608, 0, 1, 1,
0.7083191, -0.2825674, 1.635159, 0.5058824, 0, 1, 1,
0.7129563, 0.3616654, 0.9822665, 0.5137255, 0, 1, 1,
0.7222535, 2.040493, 1.791931, 0.5176471, 0, 1, 1,
0.7230852, -0.8397613, 1.138899, 0.5254902, 0, 1, 1,
0.7248852, 0.4579511, 1.614098, 0.5294118, 0, 1, 1,
0.7261177, -1.366964, 2.617139, 0.5372549, 0, 1, 1,
0.7278224, 1.574647, 2.007178, 0.5411765, 0, 1, 1,
0.7285469, -0.2882627, 1.450732, 0.5490196, 0, 1, 1,
0.7292474, -0.9176835, 2.45879, 0.5529412, 0, 1, 1,
0.7327046, 0.3737744, 1.908211, 0.5607843, 0, 1, 1,
0.7487936, 1.49306, 0.7459529, 0.5647059, 0, 1, 1,
0.7525852, -0.3892303, 2.809313, 0.572549, 0, 1, 1,
0.753552, -0.6663163, 1.883703, 0.5764706, 0, 1, 1,
0.75991, -0.3613189, 1.420474, 0.5843138, 0, 1, 1,
0.7617052, -0.8470572, 4.618576, 0.5882353, 0, 1, 1,
0.7654524, -1.124894, 3.067986, 0.5960785, 0, 1, 1,
0.7672883, -0.2433563, 1.626504, 0.6039216, 0, 1, 1,
0.7747557, 0.8324847, 1.553712, 0.6078432, 0, 1, 1,
0.7761484, 1.141185, 0.6241443, 0.6156863, 0, 1, 1,
0.7786166, -0.410081, 0.9758282, 0.6196079, 0, 1, 1,
0.7809943, -2.25487, 3.881357, 0.627451, 0, 1, 1,
0.7886488, 0.08532603, 2.071088, 0.6313726, 0, 1, 1,
0.7897264, -0.3358574, 3.909892, 0.6392157, 0, 1, 1,
0.7924755, -0.01859133, 2.616915, 0.6431373, 0, 1, 1,
0.7940717, -0.2134956, 1.493413, 0.6509804, 0, 1, 1,
0.7941968, 0.08828475, 0.5144836, 0.654902, 0, 1, 1,
0.8013685, 0.1060783, 0.5400502, 0.6627451, 0, 1, 1,
0.802117, 0.03260314, 1.921824, 0.6666667, 0, 1, 1,
0.8054374, -0.1107821, 2.089819, 0.6745098, 0, 1, 1,
0.8142475, -0.9626918, 2.550188, 0.6784314, 0, 1, 1,
0.8190254, -1.570454, 3.590827, 0.6862745, 0, 1, 1,
0.824666, -0.1322371, 1.818928, 0.6901961, 0, 1, 1,
0.8269983, 0.8392942, -0.345928, 0.6980392, 0, 1, 1,
0.8304157, -1.468464, 1.360509, 0.7058824, 0, 1, 1,
0.831024, -0.2816463, 2.131102, 0.7098039, 0, 1, 1,
0.8320419, 1.826983, -0.7923347, 0.7176471, 0, 1, 1,
0.8338024, -0.3473117, 0.4952033, 0.7215686, 0, 1, 1,
0.8351387, 0.5553659, -0.3735583, 0.7294118, 0, 1, 1,
0.8405024, -0.138006, 0.9770275, 0.7333333, 0, 1, 1,
0.8438239, 0.2958212, 1.487608, 0.7411765, 0, 1, 1,
0.845028, -1.092105, 4.364966, 0.7450981, 0, 1, 1,
0.8468598, 0.3325207, 1.322384, 0.7529412, 0, 1, 1,
0.8481132, 0.3048899, 2.247353, 0.7568628, 0, 1, 1,
0.8490074, -0.08023192, 0.9575862, 0.7647059, 0, 1, 1,
0.8505585, 0.3428297, -0.1748753, 0.7686275, 0, 1, 1,
0.8523605, 2.059176, -0.3882186, 0.7764706, 0, 1, 1,
0.8554248, 0.5351218, 1.50042, 0.7803922, 0, 1, 1,
0.8677449, -0.9926817, 1.51302, 0.7882353, 0, 1, 1,
0.8706884, -0.6690009, 1.038682, 0.7921569, 0, 1, 1,
0.8716161, 0.5186299, 1.742418, 0.8, 0, 1, 1,
0.8732653, 2.108767, -0.5328465, 0.8078431, 0, 1, 1,
0.8733645, 0.8072167, 0.3821881, 0.8117647, 0, 1, 1,
0.8736364, -0.01816908, 3.181793, 0.8196079, 0, 1, 1,
0.8760534, 0.8892519, 0.5394344, 0.8235294, 0, 1, 1,
0.8784015, -0.7513458, 2.041177, 0.8313726, 0, 1, 1,
0.8872305, -1.808605, 2.631303, 0.8352941, 0, 1, 1,
0.8914642, 0.6994687, 2.21663, 0.8431373, 0, 1, 1,
0.892042, 1.613652, 1.11847, 0.8470588, 0, 1, 1,
0.8973629, -1.5597, 2.862086, 0.854902, 0, 1, 1,
0.9005281, -0.3289501, 0.860116, 0.8588235, 0, 1, 1,
0.9029319, -0.04432171, 0.762717, 0.8666667, 0, 1, 1,
0.9063726, 0.03729621, 0.8158112, 0.8705882, 0, 1, 1,
0.9188974, 1.690837, -1.276512, 0.8784314, 0, 1, 1,
0.9199222, -1.206766, 4.453044, 0.8823529, 0, 1, 1,
0.9309921, -0.03792991, 0.9965454, 0.8901961, 0, 1, 1,
0.9311493, -0.1922758, 4.658123, 0.8941177, 0, 1, 1,
0.9340291, -0.01258696, 1.13519, 0.9019608, 0, 1, 1,
0.9374844, -1.785468, 1.799386, 0.9098039, 0, 1, 1,
0.9380001, 1.482582, 0.6225519, 0.9137255, 0, 1, 1,
0.943699, -0.4884106, 1.556453, 0.9215686, 0, 1, 1,
0.9438224, -0.8287711, 5.566559, 0.9254902, 0, 1, 1,
0.9461515, 0.177223, 2.955915, 0.9333333, 0, 1, 1,
0.9482529, 0.8498794, 2.220706, 0.9372549, 0, 1, 1,
0.9585307, 0.361206, 2.029941, 0.945098, 0, 1, 1,
0.9586346, -1.974923, 1.620616, 0.9490196, 0, 1, 1,
0.9604996, -1.03933, 2.28365, 0.9568627, 0, 1, 1,
0.9682784, -1.011029, 0.5953239, 0.9607843, 0, 1, 1,
0.9707627, 2.516184, 1.391741, 0.9686275, 0, 1, 1,
0.9744177, -0.08545592, 2.399707, 0.972549, 0, 1, 1,
0.9760839, 0.07721344, 3.028188, 0.9803922, 0, 1, 1,
0.9782788, -0.8356094, 2.434279, 0.9843137, 0, 1, 1,
0.9825065, -0.5918115, 3.967268, 0.9921569, 0, 1, 1,
0.9861135, 0.7088016, 1.557808, 0.9960784, 0, 1, 1,
0.9878926, 0.9254451, 0.3011658, 1, 0, 0.9960784, 1,
0.9943457, -0.6401498, 2.002433, 1, 0, 0.9882353, 1,
0.998107, -1.238526, 2.093087, 1, 0, 0.9843137, 1,
1.000859, 0.5367507, 0.1739125, 1, 0, 0.9764706, 1,
1.000883, -0.9322399, 3.718146, 1, 0, 0.972549, 1,
1.002666, -1.10929, 3.474861, 1, 0, 0.9647059, 1,
1.004125, 1.111758, -0.2851749, 1, 0, 0.9607843, 1,
1.004792, -0.2498701, 1.198069, 1, 0, 0.9529412, 1,
1.011004, 0.451516, 0.396606, 1, 0, 0.9490196, 1,
1.01393, 0.7921434, 1.358674, 1, 0, 0.9411765, 1,
1.020791, -0.324948, 2.286756, 1, 0, 0.9372549, 1,
1.035851, -0.02384642, 2.833746, 1, 0, 0.9294118, 1,
1.038751, -0.8392423, 3.212956, 1, 0, 0.9254902, 1,
1.044684, 1.570266, 0.2744496, 1, 0, 0.9176471, 1,
1.04501, -0.6747549, 0.3258266, 1, 0, 0.9137255, 1,
1.048848, 2.112048, 0.6201954, 1, 0, 0.9058824, 1,
1.049638, 0.5387785, 0.8390531, 1, 0, 0.9019608, 1,
1.054222, 0.3726897, 1.314138, 1, 0, 0.8941177, 1,
1.056143, 0.4339088, 1.089064, 1, 0, 0.8862745, 1,
1.05726, -0.7442117, 3.108764, 1, 0, 0.8823529, 1,
1.061384, -0.0215418, 0.6219319, 1, 0, 0.8745098, 1,
1.068242, 0.2648208, 0.5796877, 1, 0, 0.8705882, 1,
1.068798, 1.683277, 0.4721693, 1, 0, 0.8627451, 1,
1.075616, -1.288258, 2.689895, 1, 0, 0.8588235, 1,
1.079394, 1.264756, 0.518788, 1, 0, 0.8509804, 1,
1.082064, -0.5280909, 2.045425, 1, 0, 0.8470588, 1,
1.091892, 1.168651, 0.7820455, 1, 0, 0.8392157, 1,
1.09769, 0.6403758, 2.377415, 1, 0, 0.8352941, 1,
1.099549, 2.024045, 1.152586, 1, 0, 0.827451, 1,
1.108832, -1.506579, 1.952608, 1, 0, 0.8235294, 1,
1.110886, -1.222315, 2.840511, 1, 0, 0.8156863, 1,
1.113431, 1.349085, 1.737773, 1, 0, 0.8117647, 1,
1.11902, 2.202783, 1.424401, 1, 0, 0.8039216, 1,
1.123825, -0.424929, 2.599782, 1, 0, 0.7960784, 1,
1.125895, -0.1374324, 1.791573, 1, 0, 0.7921569, 1,
1.126059, 0.6933546, 0.08230877, 1, 0, 0.7843137, 1,
1.126467, 0.5244164, 3.010512, 1, 0, 0.7803922, 1,
1.136057, 2.097933, -1.128414, 1, 0, 0.772549, 1,
1.147489, -0.3302752, 4.100869, 1, 0, 0.7686275, 1,
1.151484, 0.3325062, 1.864057, 1, 0, 0.7607843, 1,
1.151619, -0.3441182, 0.4875679, 1, 0, 0.7568628, 1,
1.157431, 0.2477758, 2.212968, 1, 0, 0.7490196, 1,
1.159966, 0.5810704, 0.9918539, 1, 0, 0.7450981, 1,
1.162902, -0.4988241, 2.217563, 1, 0, 0.7372549, 1,
1.16349, -1.185054, 4.313118, 1, 0, 0.7333333, 1,
1.175384, 0.6956086, 0.565879, 1, 0, 0.7254902, 1,
1.179346, 0.8106025, 1.513448, 1, 0, 0.7215686, 1,
1.18452, -0.8992162, 1.672332, 1, 0, 0.7137255, 1,
1.185527, -0.4471208, 1.65532, 1, 0, 0.7098039, 1,
1.189356, -0.6387115, 1.49593, 1, 0, 0.7019608, 1,
1.196669, 0.7543324, -0.5034633, 1, 0, 0.6941177, 1,
1.199301, 1.015639, 0.501338, 1, 0, 0.6901961, 1,
1.213118, 1.016313, 1.41851, 1, 0, 0.682353, 1,
1.213825, -0.3701176, 1.132662, 1, 0, 0.6784314, 1,
1.214145, 0.6746898, 0.09544378, 1, 0, 0.6705883, 1,
1.223333, 1.14329, 0.5976619, 1, 0, 0.6666667, 1,
1.223464, 0.9858377, 1.135875, 1, 0, 0.6588235, 1,
1.224927, 0.9036482, 0.7454841, 1, 0, 0.654902, 1,
1.226505, -1.234729, 3.437062, 1, 0, 0.6470588, 1,
1.234224, -0.2103356, 1.663102, 1, 0, 0.6431373, 1,
1.241609, 0.2638355, 2.689737, 1, 0, 0.6352941, 1,
1.261993, -0.5324097, 2.226285, 1, 0, 0.6313726, 1,
1.263604, -0.5020368, 2.222619, 1, 0, 0.6235294, 1,
1.264998, 1.044471, -0.4776184, 1, 0, 0.6196079, 1,
1.276447, -0.8508672, 2.026787, 1, 0, 0.6117647, 1,
1.280884, -1.076541, 1.551052, 1, 0, 0.6078432, 1,
1.288393, -0.1487475, 3.85838, 1, 0, 0.6, 1,
1.295254, -0.5131295, 0.3595592, 1, 0, 0.5921569, 1,
1.298321, -0.4412641, 2.485911, 1, 0, 0.5882353, 1,
1.308535, -0.4830184, 2.983616, 1, 0, 0.5803922, 1,
1.323893, 1.245948, 0.3541273, 1, 0, 0.5764706, 1,
1.32691, -0.5295402, 2.233697, 1, 0, 0.5686275, 1,
1.33007, -1.352745, 3.761497, 1, 0, 0.5647059, 1,
1.346333, 0.2682492, 0.5108494, 1, 0, 0.5568628, 1,
1.355347, 1.956061, 0.8364361, 1, 0, 0.5529412, 1,
1.358046, -0.5779834, -0.2204403, 1, 0, 0.5450981, 1,
1.379283, 0.2176338, 2.164178, 1, 0, 0.5411765, 1,
1.381249, -0.5296673, 3.190092, 1, 0, 0.5333334, 1,
1.387672, 1.144797, -0.1456988, 1, 0, 0.5294118, 1,
1.401534, -1.067273, 1.219015, 1, 0, 0.5215687, 1,
1.40218, -0.7129962, 2.393835, 1, 0, 0.5176471, 1,
1.421365, -0.03913048, 1.574339, 1, 0, 0.509804, 1,
1.422483, 0.2018175, 0.6013761, 1, 0, 0.5058824, 1,
1.441599, -0.05343524, 1.062531, 1, 0, 0.4980392, 1,
1.449636, -0.8145185, 2.147187, 1, 0, 0.4901961, 1,
1.450383, 1.198667, 0.6164102, 1, 0, 0.4862745, 1,
1.471687, -0.8924862, 1.242072, 1, 0, 0.4784314, 1,
1.493223, -0.642242, 0.4718191, 1, 0, 0.4745098, 1,
1.49474, -0.6071768, -0.04780892, 1, 0, 0.4666667, 1,
1.508569, 0.7803507, 2.263007, 1, 0, 0.4627451, 1,
1.534023, 0.6484846, 1.672202, 1, 0, 0.454902, 1,
1.553643, -0.3821585, 0.6661944, 1, 0, 0.4509804, 1,
1.562723, -1.80757, 2.896124, 1, 0, 0.4431373, 1,
1.567731, 0.068932, 2.28782, 1, 0, 0.4392157, 1,
1.569185, -0.4720061, 3.303645, 1, 0, 0.4313726, 1,
1.573764, 1.78864, 0.9663181, 1, 0, 0.427451, 1,
1.578555, 1.287177, 0.9092305, 1, 0, 0.4196078, 1,
1.578807, -0.6664467, 1.178019, 1, 0, 0.4156863, 1,
1.582172, -0.5073647, 0.625962, 1, 0, 0.4078431, 1,
1.59926, 0.2061259, 2.797678, 1, 0, 0.4039216, 1,
1.607775, 0.7609084, 3.780396, 1, 0, 0.3960784, 1,
1.609645, -0.04108145, 2.789039, 1, 0, 0.3882353, 1,
1.64272, 0.6564425, 2.146394, 1, 0, 0.3843137, 1,
1.665208, 1.775045, 1.52733, 1, 0, 0.3764706, 1,
1.672165, 0.307526, 1.543244, 1, 0, 0.372549, 1,
1.674347, 1.423645, 2.05159, 1, 0, 0.3647059, 1,
1.690421, 0.4787119, 1.579532, 1, 0, 0.3607843, 1,
1.691797, -1.763117, 1.201343, 1, 0, 0.3529412, 1,
1.695779, -0.7077948, 2.679869, 1, 0, 0.3490196, 1,
1.704783, 0.06065342, 1.341921, 1, 0, 0.3411765, 1,
1.717001, 0.6383825, 3.251216, 1, 0, 0.3372549, 1,
1.734708, 0.9477203, 1.765078, 1, 0, 0.3294118, 1,
1.734865, 0.9678468, 0.3644455, 1, 0, 0.3254902, 1,
1.736526, 1.175717, 1.762891, 1, 0, 0.3176471, 1,
1.740017, -0.08233573, 1.10589, 1, 0, 0.3137255, 1,
1.741769, -0.356443, -0.3088906, 1, 0, 0.3058824, 1,
1.748834, -0.6237155, 3.767299, 1, 0, 0.2980392, 1,
1.768414, 0.1099522, 1.834832, 1, 0, 0.2941177, 1,
1.788329, -1.380966, 2.757313, 1, 0, 0.2862745, 1,
1.798565, -0.5864716, 1.502038, 1, 0, 0.282353, 1,
1.819298, -0.876317, 2.079172, 1, 0, 0.2745098, 1,
1.819741, 2.957847, -1.133184, 1, 0, 0.2705882, 1,
1.824152, 0.4863204, 0.5379396, 1, 0, 0.2627451, 1,
1.82435, -1.091943, 1.367765, 1, 0, 0.2588235, 1,
1.82734, 1.24683, 0.2289501, 1, 0, 0.2509804, 1,
1.828356, 0.00633495, 0.2881251, 1, 0, 0.2470588, 1,
1.828821, -0.3027853, 1.394907, 1, 0, 0.2392157, 1,
1.878605, 0.4029485, 2.411793, 1, 0, 0.2352941, 1,
1.888644, -0.6152551, 2.58843, 1, 0, 0.227451, 1,
1.896803, 0.328573, 1.223719, 1, 0, 0.2235294, 1,
1.904289, -1.619029, 1.139216, 1, 0, 0.2156863, 1,
1.909386, 0.7319462, 0.6972281, 1, 0, 0.2117647, 1,
1.9244, -0.3364992, 2.646481, 1, 0, 0.2039216, 1,
1.925891, -0.2087613, 2.288411, 1, 0, 0.1960784, 1,
1.93141, -0.7321381, 2.580025, 1, 0, 0.1921569, 1,
1.934489, 0.06278498, 1.685677, 1, 0, 0.1843137, 1,
1.939432, -0.7896472, 1.094599, 1, 0, 0.1803922, 1,
1.963623, -1.40688, 2.466847, 1, 0, 0.172549, 1,
2.003849, 1.621862, 4.707322, 1, 0, 0.1686275, 1,
2.008024, -0.6896004, 1.268828, 1, 0, 0.1607843, 1,
2.019534, 0.6843363, 0.5800869, 1, 0, 0.1568628, 1,
2.043681, 1.283687, -0.921092, 1, 0, 0.1490196, 1,
2.046433, 1.35216, 2.256122, 1, 0, 0.145098, 1,
2.08247, -0.4334128, 2.19169, 1, 0, 0.1372549, 1,
2.094212, -1.422471, 2.825968, 1, 0, 0.1333333, 1,
2.206139, 1.071472, 0.5172354, 1, 0, 0.1254902, 1,
2.21178, 1.385248, 0.8928491, 1, 0, 0.1215686, 1,
2.217324, -0.0597487, 2.011395, 1, 0, 0.1137255, 1,
2.247458, 1.518851, -0.5583868, 1, 0, 0.1098039, 1,
2.263408, -1.38361, 3.161065, 1, 0, 0.1019608, 1,
2.292006, -0.9022949, 1.803324, 1, 0, 0.09411765, 1,
2.310472, 0.3779483, 0.4052127, 1, 0, 0.09019608, 1,
2.379388, -0.4668267, 2.636635, 1, 0, 0.08235294, 1,
2.407257, -0.7694924, 3.614167, 1, 0, 0.07843138, 1,
2.434263, -0.7859666, 1.090193, 1, 0, 0.07058824, 1,
2.477375, 1.376218, 1.463158, 1, 0, 0.06666667, 1,
2.481218, -1.34085, 1.217344, 1, 0, 0.05882353, 1,
2.558339, -0.3528357, -1.10842, 1, 0, 0.05490196, 1,
2.584556, -0.4072319, 1.562152, 1, 0, 0.04705882, 1,
2.676822, -1.33817, 3.195635, 1, 0, 0.04313726, 1,
2.678758, -0.7267842, 1.785797, 1, 0, 0.03529412, 1,
2.679512, -0.06153434, 0.8455147, 1, 0, 0.03137255, 1,
2.902949, -0.6030661, 2.087135, 1, 0, 0.02352941, 1,
3.055663, -3.442201, 2.459458, 1, 0, 0.01960784, 1,
3.077464, 0.2403147, 0.7532157, 1, 0, 0.01176471, 1,
3.268879, -1.411527, 1.384302, 1, 0, 0.007843138, 1
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
-0.003034115, -4.624083, -7.309557, 0, -0.5, 0.5, 0.5,
-0.003034115, -4.624083, -7.309557, 1, -0.5, 0.5, 0.5,
-0.003034115, -4.624083, -7.309557, 1, 1.5, 0.5, 0.5,
-0.003034115, -4.624083, -7.309557, 0, 1.5, 0.5, 0.5
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
-4.384126, 0.0441767, -7.309557, 0, -0.5, 0.5, 0.5,
-4.384126, 0.0441767, -7.309557, 1, -0.5, 0.5, 0.5,
-4.384126, 0.0441767, -7.309557, 1, 1.5, 0.5, 0.5,
-4.384126, 0.0441767, -7.309557, 0, 1.5, 0.5, 0.5
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
-4.384126, -4.624083, 0.06159258, 0, -0.5, 0.5, 0.5,
-4.384126, -4.624083, 0.06159258, 1, -0.5, 0.5, 0.5,
-4.384126, -4.624083, 0.06159258, 1, 1.5, 0.5, 0.5,
-4.384126, -4.624083, 0.06159258, 0, 1.5, 0.5, 0.5
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
-3, -3.546793, -5.608523,
3, -3.546793, -5.608523,
-3, -3.546793, -5.608523,
-3, -3.726341, -5.892028,
-2, -3.546793, -5.608523,
-2, -3.726341, -5.892028,
-1, -3.546793, -5.608523,
-1, -3.726341, -5.892028,
0, -3.546793, -5.608523,
0, -3.726341, -5.892028,
1, -3.546793, -5.608523,
1, -3.726341, -5.892028,
2, -3.546793, -5.608523,
2, -3.726341, -5.892028,
3, -3.546793, -5.608523,
3, -3.726341, -5.892028
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
-3, -4.085438, -6.45904, 0, -0.5, 0.5, 0.5,
-3, -4.085438, -6.45904, 1, -0.5, 0.5, 0.5,
-3, -4.085438, -6.45904, 1, 1.5, 0.5, 0.5,
-3, -4.085438, -6.45904, 0, 1.5, 0.5, 0.5,
-2, -4.085438, -6.45904, 0, -0.5, 0.5, 0.5,
-2, -4.085438, -6.45904, 1, -0.5, 0.5, 0.5,
-2, -4.085438, -6.45904, 1, 1.5, 0.5, 0.5,
-2, -4.085438, -6.45904, 0, 1.5, 0.5, 0.5,
-1, -4.085438, -6.45904, 0, -0.5, 0.5, 0.5,
-1, -4.085438, -6.45904, 1, -0.5, 0.5, 0.5,
-1, -4.085438, -6.45904, 1, 1.5, 0.5, 0.5,
-1, -4.085438, -6.45904, 0, 1.5, 0.5, 0.5,
0, -4.085438, -6.45904, 0, -0.5, 0.5, 0.5,
0, -4.085438, -6.45904, 1, -0.5, 0.5, 0.5,
0, -4.085438, -6.45904, 1, 1.5, 0.5, 0.5,
0, -4.085438, -6.45904, 0, 1.5, 0.5, 0.5,
1, -4.085438, -6.45904, 0, -0.5, 0.5, 0.5,
1, -4.085438, -6.45904, 1, -0.5, 0.5, 0.5,
1, -4.085438, -6.45904, 1, 1.5, 0.5, 0.5,
1, -4.085438, -6.45904, 0, 1.5, 0.5, 0.5,
2, -4.085438, -6.45904, 0, -0.5, 0.5, 0.5,
2, -4.085438, -6.45904, 1, -0.5, 0.5, 0.5,
2, -4.085438, -6.45904, 1, 1.5, 0.5, 0.5,
2, -4.085438, -6.45904, 0, 1.5, 0.5, 0.5,
3, -4.085438, -6.45904, 0, -0.5, 0.5, 0.5,
3, -4.085438, -6.45904, 1, -0.5, 0.5, 0.5,
3, -4.085438, -6.45904, 1, 1.5, 0.5, 0.5,
3, -4.085438, -6.45904, 0, 1.5, 0.5, 0.5
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
-3.373105, -3, -5.608523,
-3.373105, 3, -5.608523,
-3.373105, -3, -5.608523,
-3.541608, -3, -5.892028,
-3.373105, -2, -5.608523,
-3.541608, -2, -5.892028,
-3.373105, -1, -5.608523,
-3.541608, -1, -5.892028,
-3.373105, 0, -5.608523,
-3.541608, 0, -5.892028,
-3.373105, 1, -5.608523,
-3.541608, 1, -5.892028,
-3.373105, 2, -5.608523,
-3.541608, 2, -5.892028,
-3.373105, 3, -5.608523,
-3.541608, 3, -5.892028
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
-3.878615, -3, -6.45904, 0, -0.5, 0.5, 0.5,
-3.878615, -3, -6.45904, 1, -0.5, 0.5, 0.5,
-3.878615, -3, -6.45904, 1, 1.5, 0.5, 0.5,
-3.878615, -3, -6.45904, 0, 1.5, 0.5, 0.5,
-3.878615, -2, -6.45904, 0, -0.5, 0.5, 0.5,
-3.878615, -2, -6.45904, 1, -0.5, 0.5, 0.5,
-3.878615, -2, -6.45904, 1, 1.5, 0.5, 0.5,
-3.878615, -2, -6.45904, 0, 1.5, 0.5, 0.5,
-3.878615, -1, -6.45904, 0, -0.5, 0.5, 0.5,
-3.878615, -1, -6.45904, 1, -0.5, 0.5, 0.5,
-3.878615, -1, -6.45904, 1, 1.5, 0.5, 0.5,
-3.878615, -1, -6.45904, 0, 1.5, 0.5, 0.5,
-3.878615, 0, -6.45904, 0, -0.5, 0.5, 0.5,
-3.878615, 0, -6.45904, 1, -0.5, 0.5, 0.5,
-3.878615, 0, -6.45904, 1, 1.5, 0.5, 0.5,
-3.878615, 0, -6.45904, 0, 1.5, 0.5, 0.5,
-3.878615, 1, -6.45904, 0, -0.5, 0.5, 0.5,
-3.878615, 1, -6.45904, 1, -0.5, 0.5, 0.5,
-3.878615, 1, -6.45904, 1, 1.5, 0.5, 0.5,
-3.878615, 1, -6.45904, 0, 1.5, 0.5, 0.5,
-3.878615, 2, -6.45904, 0, -0.5, 0.5, 0.5,
-3.878615, 2, -6.45904, 1, -0.5, 0.5, 0.5,
-3.878615, 2, -6.45904, 1, 1.5, 0.5, 0.5,
-3.878615, 2, -6.45904, 0, 1.5, 0.5, 0.5,
-3.878615, 3, -6.45904, 0, -0.5, 0.5, 0.5,
-3.878615, 3, -6.45904, 1, -0.5, 0.5, 0.5,
-3.878615, 3, -6.45904, 1, 1.5, 0.5, 0.5,
-3.878615, 3, -6.45904, 0, 1.5, 0.5, 0.5
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
-3.373105, -3.546793, -4,
-3.373105, -3.546793, 4,
-3.373105, -3.546793, -4,
-3.541608, -3.726341, -4,
-3.373105, -3.546793, -2,
-3.541608, -3.726341, -2,
-3.373105, -3.546793, 0,
-3.541608, -3.726341, 0,
-3.373105, -3.546793, 2,
-3.541608, -3.726341, 2,
-3.373105, -3.546793, 4,
-3.541608, -3.726341, 4
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
-3.878615, -4.085438, -4, 0, -0.5, 0.5, 0.5,
-3.878615, -4.085438, -4, 1, -0.5, 0.5, 0.5,
-3.878615, -4.085438, -4, 1, 1.5, 0.5, 0.5,
-3.878615, -4.085438, -4, 0, 1.5, 0.5, 0.5,
-3.878615, -4.085438, -2, 0, -0.5, 0.5, 0.5,
-3.878615, -4.085438, -2, 1, -0.5, 0.5, 0.5,
-3.878615, -4.085438, -2, 1, 1.5, 0.5, 0.5,
-3.878615, -4.085438, -2, 0, 1.5, 0.5, 0.5,
-3.878615, -4.085438, 0, 0, -0.5, 0.5, 0.5,
-3.878615, -4.085438, 0, 1, -0.5, 0.5, 0.5,
-3.878615, -4.085438, 0, 1, 1.5, 0.5, 0.5,
-3.878615, -4.085438, 0, 0, 1.5, 0.5, 0.5,
-3.878615, -4.085438, 2, 0, -0.5, 0.5, 0.5,
-3.878615, -4.085438, 2, 1, -0.5, 0.5, 0.5,
-3.878615, -4.085438, 2, 1, 1.5, 0.5, 0.5,
-3.878615, -4.085438, 2, 0, 1.5, 0.5, 0.5,
-3.878615, -4.085438, 4, 0, -0.5, 0.5, 0.5,
-3.878615, -4.085438, 4, 1, -0.5, 0.5, 0.5,
-3.878615, -4.085438, 4, 1, 1.5, 0.5, 0.5,
-3.878615, -4.085438, 4, 0, 1.5, 0.5, 0.5
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
-3.373105, -3.546793, -5.608523,
-3.373105, 3.635146, -5.608523,
-3.373105, -3.546793, 5.731708,
-3.373105, 3.635146, 5.731708,
-3.373105, -3.546793, -5.608523,
-3.373105, -3.546793, 5.731708,
-3.373105, 3.635146, -5.608523,
-3.373105, 3.635146, 5.731708,
-3.373105, -3.546793, -5.608523,
3.367037, -3.546793, -5.608523,
-3.373105, -3.546793, 5.731708,
3.367037, -3.546793, 5.731708,
-3.373105, 3.635146, -5.608523,
3.367037, 3.635146, -5.608523,
-3.373105, 3.635146, 5.731708,
3.367037, 3.635146, 5.731708,
3.367037, -3.546793, -5.608523,
3.367037, 3.635146, -5.608523,
3.367037, -3.546793, 5.731708,
3.367037, 3.635146, 5.731708,
3.367037, -3.546793, -5.608523,
3.367037, -3.546793, 5.731708,
3.367037, 3.635146, -5.608523,
3.367037, 3.635146, 5.731708
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
var radius = 8.020569;
var distance = 35.68442;
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
mvMatrix.translate( 0.003034115, -0.0441767, -0.06159258 );
mvMatrix.scale( 1.286619, 1.207473, 0.7647108 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.68442);
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
oxycarboxin<-read.table("oxycarboxin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-oxycarboxin$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxycarboxin' not found
```

```r
y<-oxycarboxin$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxycarboxin' not found
```

```r
z<-oxycarboxin$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxycarboxin' not found
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
-3.274947, 2.476168, -1.324953, 0, 0, 1, 1, 1,
-2.989453, -2.303524, 0.410007, 1, 0, 0, 1, 1,
-2.981713, -0.04639899, -0.1678249, 1, 0, 0, 1, 1,
-2.922827, -0.3884536, -1.954212, 1, 0, 0, 1, 1,
-2.805401, -0.3563737, -2.163802, 1, 0, 0, 1, 1,
-2.691734, -0.3119929, -0.3769147, 1, 0, 0, 1, 1,
-2.570974, -1.050805, -0.8422837, 0, 0, 0, 1, 1,
-2.535383, -1.446346, -2.80824, 0, 0, 0, 1, 1,
-2.437277, 2.000799, -0.4587456, 0, 0, 0, 1, 1,
-2.415254, 0.6009728, -0.311825, 0, 0, 0, 1, 1,
-2.406451, 0.8780305, -0.02879763, 0, 0, 0, 1, 1,
-2.394013, -0.3740661, -2.677811, 0, 0, 0, 1, 1,
-2.388355, 0.9062077, -1.261384, 0, 0, 0, 1, 1,
-2.35045, -0.4349995, -1.768613, 1, 1, 1, 1, 1,
-2.345653, -0.8880493, -0.8181347, 1, 1, 1, 1, 1,
-2.308184, 0.2730156, -2.971907, 1, 1, 1, 1, 1,
-2.293573, 0.4592355, 1.126137, 1, 1, 1, 1, 1,
-2.247846, 0.8672076, -2.052824, 1, 1, 1, 1, 1,
-2.239214, 0.1332599, -0.111065, 1, 1, 1, 1, 1,
-2.209932, 1.721022, -1.103917, 1, 1, 1, 1, 1,
-2.06273, -1.774098, -3.179472, 1, 1, 1, 1, 1,
-2.059104, -0.2037172, -2.850139, 1, 1, 1, 1, 1,
-2.025204, -0.6294202, -2.090953, 1, 1, 1, 1, 1,
-2.011738, 0.700153, -1.650919, 1, 1, 1, 1, 1,
-1.968011, 2.540439, -2.426306, 1, 1, 1, 1, 1,
-1.961985, -0.841325, -2.259922, 1, 1, 1, 1, 1,
-1.960345, -0.8558933, -3.165656, 1, 1, 1, 1, 1,
-1.93876, -1.091593, -2.288118, 1, 1, 1, 1, 1,
-1.93682, 0.3934427, -1.295305, 0, 0, 1, 1, 1,
-1.936019, -0.4390185, -2.089611, 1, 0, 0, 1, 1,
-1.920582, 1.139591, -0.1888816, 1, 0, 0, 1, 1,
-1.895047, -0.9198272, -1.641915, 1, 0, 0, 1, 1,
-1.878122, 1.725922, -0.488547, 1, 0, 0, 1, 1,
-1.860088, 1.044221, 0.6940915, 1, 0, 0, 1, 1,
-1.833592, -1.362901, -2.113444, 0, 0, 0, 1, 1,
-1.827113, -0.8209212, -2.692586, 0, 0, 0, 1, 1,
-1.813158, 1.707669, -2.371529, 0, 0, 0, 1, 1,
-1.80185, -0.8145075, -2.425181, 0, 0, 0, 1, 1,
-1.753972, 0.7582521, -1.091737, 0, 0, 0, 1, 1,
-1.751987, -0.6753615, -3.504944, 0, 0, 0, 1, 1,
-1.73869, 0.1245325, -3.133507, 0, 0, 0, 1, 1,
-1.695632, 0.5285792, -0.8290358, 1, 1, 1, 1, 1,
-1.676072, -0.109384, -2.611602, 1, 1, 1, 1, 1,
-1.66204, 1.867652, -0.7955127, 1, 1, 1, 1, 1,
-1.661022, 1.349977, -1.822362, 1, 1, 1, 1, 1,
-1.658464, -1.497897, -2.661079, 1, 1, 1, 1, 1,
-1.654372, 0.03058924, -0.01965464, 1, 1, 1, 1, 1,
-1.65353, 0.5145952, 0.0106185, 1, 1, 1, 1, 1,
-1.62377, 0.5566127, -0.4666854, 1, 1, 1, 1, 1,
-1.616175, 0.6077438, -2.94531, 1, 1, 1, 1, 1,
-1.600256, 0.1930577, -1.118909, 1, 1, 1, 1, 1,
-1.598341, 0.4831863, -2.3941, 1, 1, 1, 1, 1,
-1.582282, 0.09081144, -0.5790433, 1, 1, 1, 1, 1,
-1.573297, 0.04092974, -0.08875552, 1, 1, 1, 1, 1,
-1.558755, -0.8659955, -2.846841, 1, 1, 1, 1, 1,
-1.546822, 1.382865, 0.6146854, 1, 1, 1, 1, 1,
-1.546776, 0.08936106, -1.024808, 0, 0, 1, 1, 1,
-1.544672, -1.194106, -2.725703, 1, 0, 0, 1, 1,
-1.544076, 0.3785976, -1.787072, 1, 0, 0, 1, 1,
-1.535614, 1.300382, 0.12429, 1, 0, 0, 1, 1,
-1.528619, -0.1857336, 0.1680201, 1, 0, 0, 1, 1,
-1.517351, -1.790535, -1.192032, 1, 0, 0, 1, 1,
-1.494502, 0.2135385, -2.65593, 0, 0, 0, 1, 1,
-1.490311, -0.343051, -2.180232, 0, 0, 0, 1, 1,
-1.481329, -0.2174533, -2.291436, 0, 0, 0, 1, 1,
-1.472836, 1.106316, 0.4559452, 0, 0, 0, 1, 1,
-1.444552, 1.006007, -2.207274, 0, 0, 0, 1, 1,
-1.43788, -0.07745843, -2.062173, 0, 0, 0, 1, 1,
-1.422821, -1.281362, -4.055747, 0, 0, 0, 1, 1,
-1.414803, -0.5462638, -1.257676, 1, 1, 1, 1, 1,
-1.411726, -1.323097, -2.078499, 1, 1, 1, 1, 1,
-1.41156, -1.062681, -1.758016, 1, 1, 1, 1, 1,
-1.409899, 0.6602793, -1.695286, 1, 1, 1, 1, 1,
-1.405329, 1.519409, 0.1458237, 1, 1, 1, 1, 1,
-1.397832, 0.05616632, -0.9462056, 1, 1, 1, 1, 1,
-1.387536, 0.3472834, 0.5337688, 1, 1, 1, 1, 1,
-1.381382, 0.2003194, -1.97995, 1, 1, 1, 1, 1,
-1.381027, 0.229303, -0.9068658, 1, 1, 1, 1, 1,
-1.375526, -1.769279, -3.607217, 1, 1, 1, 1, 1,
-1.370091, -0.51178, -1.792723, 1, 1, 1, 1, 1,
-1.365448, -0.2939113, -1.953254, 1, 1, 1, 1, 1,
-1.356772, 2.060091, -1.237751, 1, 1, 1, 1, 1,
-1.353131, -0.1248523, -2.12768, 1, 1, 1, 1, 1,
-1.347019, 0.1068783, 0.6718043, 1, 1, 1, 1, 1,
-1.342092, 0.6417947, -1.503302, 0, 0, 1, 1, 1,
-1.339233, 0.666842, -1.645523, 1, 0, 0, 1, 1,
-1.332178, 0.2496551, -1.9453, 1, 0, 0, 1, 1,
-1.326684, -1.532852, -2.562556, 1, 0, 0, 1, 1,
-1.325737, 0.5029702, -2.146348, 1, 0, 0, 1, 1,
-1.325263, -1.244407, -3.513908, 1, 0, 0, 1, 1,
-1.323301, 2.215466, -0.2810024, 0, 0, 0, 1, 1,
-1.320703, -1.490646, -3.222178, 0, 0, 0, 1, 1,
-1.317823, -0.5306924, -2.00163, 0, 0, 0, 1, 1,
-1.311735, 0.8899073, -1.723494, 0, 0, 0, 1, 1,
-1.304511, -1.835971, -2.398205, 0, 0, 0, 1, 1,
-1.301158, -2.162409, -1.709726, 0, 0, 0, 1, 1,
-1.29812, 1.937123, -0.2586199, 0, 0, 0, 1, 1,
-1.294698, -0.5531036, -2.363951, 1, 1, 1, 1, 1,
-1.294027, 0.8275245, -1.097662, 1, 1, 1, 1, 1,
-1.292091, -0.114957, -1.977376, 1, 1, 1, 1, 1,
-1.280692, 0.8605611, -1.270431, 1, 1, 1, 1, 1,
-1.280302, -0.1191348, -1.778637, 1, 1, 1, 1, 1,
-1.275813, 0.5001525, -1.261082, 1, 1, 1, 1, 1,
-1.273204, 1.158401, -1.009506, 1, 1, 1, 1, 1,
-1.267191, -0.3429291, -2.408669, 1, 1, 1, 1, 1,
-1.267166, 0.02579559, -4.807483, 1, 1, 1, 1, 1,
-1.266212, -0.3098467, -2.944322, 1, 1, 1, 1, 1,
-1.261646, 0.6074933, -1.179462, 1, 1, 1, 1, 1,
-1.260582, 0.7216524, -1.176629, 1, 1, 1, 1, 1,
-1.257274, 0.4550192, 2.040459, 1, 1, 1, 1, 1,
-1.247019, -0.71047, 1.522526, 1, 1, 1, 1, 1,
-1.245098, -0.5773639, -2.092094, 1, 1, 1, 1, 1,
-1.241367, -1.722997, -2.207644, 0, 0, 1, 1, 1,
-1.237302, 0.6573353, -1.726657, 1, 0, 0, 1, 1,
-1.237127, -0.9338121, -2.65309, 1, 0, 0, 1, 1,
-1.229763, 0.7406881, -0.9312884, 1, 0, 0, 1, 1,
-1.209141, -0.7079248, -2.660588, 1, 0, 0, 1, 1,
-1.202579, 1.640221, -0.3590165, 1, 0, 0, 1, 1,
-1.173935, -1.477126, -1.470852, 0, 0, 0, 1, 1,
-1.169181, -0.7157119, -2.790736, 0, 0, 0, 1, 1,
-1.167709, 1.609624, -0.2879805, 0, 0, 0, 1, 1,
-1.165623, -0.4767881, -1.422551, 0, 0, 0, 1, 1,
-1.162613, 1.527668, 0.6861205, 0, 0, 0, 1, 1,
-1.141962, 0.7333805, -0.7981349, 0, 0, 0, 1, 1,
-1.141095, -0.6630572, -0.4909514, 0, 0, 0, 1, 1,
-1.131932, -0.3318157, -1.885399, 1, 1, 1, 1, 1,
-1.130234, 2.293372, -0.1774614, 1, 1, 1, 1, 1,
-1.128064, -0.3982859, -1.294425, 1, 1, 1, 1, 1,
-1.111136, -1.018123, -1.717243, 1, 1, 1, 1, 1,
-1.108214, 0.5099937, -0.9084774, 1, 1, 1, 1, 1,
-1.102161, 0.3155815, -3.421362, 1, 1, 1, 1, 1,
-1.095354, -1.211883, -1.630316, 1, 1, 1, 1, 1,
-1.091856, -0.4967297, -3.397531, 1, 1, 1, 1, 1,
-1.08833, 0.9001456, -0.1957992, 1, 1, 1, 1, 1,
-1.085024, 0.9290302, -0.9762635, 1, 1, 1, 1, 1,
-1.074904, -0.2490105, -2.025662, 1, 1, 1, 1, 1,
-1.072545, 0.5887214, -0.6283215, 1, 1, 1, 1, 1,
-1.071093, -0.2466596, -2.374771, 1, 1, 1, 1, 1,
-1.068077, 0.7632478, -1.61761, 1, 1, 1, 1, 1,
-1.064281, 1.826852, -2.758631, 1, 1, 1, 1, 1,
-1.050838, -0.1026606, 0.931749, 0, 0, 1, 1, 1,
-1.044898, 0.410245, -3.140458, 1, 0, 0, 1, 1,
-1.044825, -0.4640943, -0.4692729, 1, 0, 0, 1, 1,
-1.044498, 0.9143913, -2.828001, 1, 0, 0, 1, 1,
-1.040993, 1.033611, -1.032693, 1, 0, 0, 1, 1,
-1.039692, 0.08690807, -1.519378, 1, 0, 0, 1, 1,
-1.030604, -0.2740948, -1.30735, 0, 0, 0, 1, 1,
-1.028737, -0.1518499, -0.6427037, 0, 0, 0, 1, 1,
-1.025554, -0.6833431, -1.473901, 0, 0, 0, 1, 1,
-1.020079, -0.2007463, -2.797291, 0, 0, 0, 1, 1,
-1.019575, 0.01136113, -0.3609042, 0, 0, 0, 1, 1,
-1.01726, 0.9448943, 0.2865294, 0, 0, 0, 1, 1,
-1.015319, 0.9945528, -0.8455309, 0, 0, 0, 1, 1,
-1.014421, 0.5285704, 0.7905775, 1, 1, 1, 1, 1,
-1.012439, -0.4880956, -1.882992, 1, 1, 1, 1, 1,
-1.008809, -0.7736446, -2.465469, 1, 1, 1, 1, 1,
-1.006485, 0.5820251, -1.257077, 1, 1, 1, 1, 1,
-1.003375, -1.418186, -1.993949, 1, 1, 1, 1, 1,
-0.9977496, 1.385429, 0.0837649, 1, 1, 1, 1, 1,
-0.9944093, -0.2536898, -0.1571257, 1, 1, 1, 1, 1,
-0.9869717, -0.9276229, -0.3318668, 1, 1, 1, 1, 1,
-0.9832873, 1.222645, -3.207692, 1, 1, 1, 1, 1,
-0.9763585, 2.480711, -0.6152355, 1, 1, 1, 1, 1,
-0.9725302, 2.527675, -1.394, 1, 1, 1, 1, 1,
-0.9723344, -0.9456265, -2.14111, 1, 1, 1, 1, 1,
-0.9645162, 0.01103814, 0.319549, 1, 1, 1, 1, 1,
-0.9549047, 0.2028135, -1.727987, 1, 1, 1, 1, 1,
-0.9547629, 0.6516511, 0.1689403, 1, 1, 1, 1, 1,
-0.9471713, -0.5095962, -3.179735, 0, 0, 1, 1, 1,
-0.9397718, 1.488412, -0.06556398, 1, 0, 0, 1, 1,
-0.9320168, 0.1240099, -0.5876618, 1, 0, 0, 1, 1,
-0.9318065, -0.8599622, -2.234061, 1, 0, 0, 1, 1,
-0.9301924, 0.2364489, -0.1749345, 1, 0, 0, 1, 1,
-0.9285806, -1.428312, -2.595815, 1, 0, 0, 1, 1,
-0.927738, 0.9355054, -1.696886, 0, 0, 0, 1, 1,
-0.9162661, -2.163807, -2.816067, 0, 0, 0, 1, 1,
-0.9136061, -0.2157642, -2.357099, 0, 0, 0, 1, 1,
-0.9124557, 0.5425041, -0.7829158, 0, 0, 0, 1, 1,
-0.9043438, 1.29459, -2.022277, 0, 0, 0, 1, 1,
-0.9014084, 0.236987, -1.928219, 0, 0, 0, 1, 1,
-0.8946015, -0.6167321, -2.911518, 0, 0, 0, 1, 1,
-0.8868707, -0.3480172, -1.232821, 1, 1, 1, 1, 1,
-0.8866752, 1.67108, -0.7339917, 1, 1, 1, 1, 1,
-0.8848771, 0.3894244, -0.9468192, 1, 1, 1, 1, 1,
-0.8786635, 0.7512987, 0.4873964, 1, 1, 1, 1, 1,
-0.8777357, -0.6237011, -3.064157, 1, 1, 1, 1, 1,
-0.8744887, 1.680169, -0.8390372, 1, 1, 1, 1, 1,
-0.8734925, -1.147418, -2.36553, 1, 1, 1, 1, 1,
-0.8722548, 0.6226313, 0.1343996, 1, 1, 1, 1, 1,
-0.8704671, -0.3721043, -0.4304103, 1, 1, 1, 1, 1,
-0.8569795, 0.3592833, -0.7069318, 1, 1, 1, 1, 1,
-0.8503284, 0.3560872, -1.439162, 1, 1, 1, 1, 1,
-0.8474784, -1.001965, -2.619638, 1, 1, 1, 1, 1,
-0.843419, 1.357346, -0.2246542, 1, 1, 1, 1, 1,
-0.8413457, 1.113129, -2.18609, 1, 1, 1, 1, 1,
-0.839246, 0.04566117, -2.792963, 1, 1, 1, 1, 1,
-0.8375102, 0.6150397, -1.612148, 0, 0, 1, 1, 1,
-0.8302324, -1.884937, -2.967433, 1, 0, 0, 1, 1,
-0.8301165, -0.9009351, -2.866624, 1, 0, 0, 1, 1,
-0.8272327, 0.9533308, -0.6244593, 1, 0, 0, 1, 1,
-0.8232287, 0.9120271, -1.290453, 1, 0, 0, 1, 1,
-0.8189732, 0.5834588, -0.6065062, 1, 0, 0, 1, 1,
-0.8177758, -0.8017362, -2.853031, 0, 0, 0, 1, 1,
-0.816054, 1.746975, -0.7528934, 0, 0, 0, 1, 1,
-0.8158855, -1.336111, -1.90737, 0, 0, 0, 1, 1,
-0.8094206, -1.630872, -2.324617, 0, 0, 0, 1, 1,
-0.8057379, 0.09660232, -1.698996, 0, 0, 0, 1, 1,
-0.8040359, -1.953536, -2.227294, 0, 0, 0, 1, 1,
-0.795999, -1.123698, -2.946716, 0, 0, 0, 1, 1,
-0.7933989, -0.3976202, -1.095541, 1, 1, 1, 1, 1,
-0.790665, 1.433566, -0.3828071, 1, 1, 1, 1, 1,
-0.7901624, 0.4165993, -1.487903, 1, 1, 1, 1, 1,
-0.7865402, -1.000663, -0.9011258, 1, 1, 1, 1, 1,
-0.7784823, 0.9370335, 0.08201442, 1, 1, 1, 1, 1,
-0.7773847, -1.026575, -2.474053, 1, 1, 1, 1, 1,
-0.7766027, 0.9530763, 1.264419, 1, 1, 1, 1, 1,
-0.76556, 0.3098208, -1.318811, 1, 1, 1, 1, 1,
-0.7645778, 0.210351, -0.288039, 1, 1, 1, 1, 1,
-0.7625976, -1.348622, -3.177374, 1, 1, 1, 1, 1,
-0.7614037, -1.267264, -5.233981, 1, 1, 1, 1, 1,
-0.758535, -0.320893, -1.556444, 1, 1, 1, 1, 1,
-0.7479048, -0.0157807, -1.383303, 1, 1, 1, 1, 1,
-0.7357624, 0.2086597, -1.252198, 1, 1, 1, 1, 1,
-0.7348845, -0.2125053, -2.155296, 1, 1, 1, 1, 1,
-0.7328871, -0.9349298, -1.463745, 0, 0, 1, 1, 1,
-0.7316248, 0.5015138, -1.471189, 1, 0, 0, 1, 1,
-0.7307549, 0.7691748, -0.1363065, 1, 0, 0, 1, 1,
-0.7290552, -1.669394, -1.095216, 1, 0, 0, 1, 1,
-0.7273594, -1.198691, -4.088473, 1, 0, 0, 1, 1,
-0.7259282, 1.289856, -1.937966, 1, 0, 0, 1, 1,
-0.7190137, -8.34045e-05, 0.9554852, 0, 0, 0, 1, 1,
-0.7150155, -1.319026, -3.575146, 0, 0, 0, 1, 1,
-0.7144316, 1.122575, 1.367772, 0, 0, 0, 1, 1,
-0.7088675, 0.2634494, -0.286734, 0, 0, 0, 1, 1,
-0.7072523, 0.6655902, 0.3307821, 0, 0, 0, 1, 1,
-0.7041075, -0.2334698, -3.744818, 0, 0, 0, 1, 1,
-0.699891, -1.370731, -2.158399, 0, 0, 0, 1, 1,
-0.6994368, 0.3248253, -1.296219, 1, 1, 1, 1, 1,
-0.6948171, -0.5461065, -2.605477, 1, 1, 1, 1, 1,
-0.6932209, 3.530555, -0.9827482, 1, 1, 1, 1, 1,
-0.691975, 1.776131, 0.4953817, 1, 1, 1, 1, 1,
-0.6904563, -0.8252798, -2.71286, 1, 1, 1, 1, 1,
-0.6887388, -0.4163883, -1.907936, 1, 1, 1, 1, 1,
-0.6822866, -0.8216189, -3.151236, 1, 1, 1, 1, 1,
-0.6820043, -0.903973, -3.740826, 1, 1, 1, 1, 1,
-0.6806411, 0.5079558, -0.6586961, 1, 1, 1, 1, 1,
-0.6799101, -0.8944581, -1.861716, 1, 1, 1, 1, 1,
-0.6771316, -1.109781, -3.985723, 1, 1, 1, 1, 1,
-0.6731583, 1.139132, -0.2999249, 1, 1, 1, 1, 1,
-0.6702091, -0.1762326, -1.148319, 1, 1, 1, 1, 1,
-0.6650239, -0.09785353, -0.9962679, 1, 1, 1, 1, 1,
-0.6626889, 0.6188482, -1.945442, 1, 1, 1, 1, 1,
-0.6563031, -0.9782005, -3.17865, 0, 0, 1, 1, 1,
-0.6532786, -1.050768, -2.039621, 1, 0, 0, 1, 1,
-0.651275, -0.5705246, -1.942611, 1, 0, 0, 1, 1,
-0.6502801, 0.1220079, -1.881603, 1, 0, 0, 1, 1,
-0.6498171, 1.806193, 1.79334, 1, 0, 0, 1, 1,
-0.6423037, 1.339259, -0.5692859, 1, 0, 0, 1, 1,
-0.6366642, -0.8152912, -3.446206, 0, 0, 0, 1, 1,
-0.6330308, 1.780811, -0.4322324, 0, 0, 0, 1, 1,
-0.6245445, 0.9404116, -0.4237943, 0, 0, 0, 1, 1,
-0.6243219, 0.3107574, -0.5719337, 0, 0, 0, 1, 1,
-0.6215984, 0.7472646, -0.4101242, 0, 0, 0, 1, 1,
-0.618869, -0.5205221, -3.866905, 0, 0, 0, 1, 1,
-0.6179959, 2.332701, 1.061747, 0, 0, 0, 1, 1,
-0.6163953, -0.1473442, -1.180064, 1, 1, 1, 1, 1,
-0.6111479, 0.2511708, -1.160038, 1, 1, 1, 1, 1,
-0.6061447, 0.09032491, -0.8451603, 1, 1, 1, 1, 1,
-0.6019337, 0.9886911, -1.359897, 1, 1, 1, 1, 1,
-0.6019193, 0.3152971, -1.079888, 1, 1, 1, 1, 1,
-0.59949, -0.356439, -2.957783, 1, 1, 1, 1, 1,
-0.5982155, 0.04040618, -1.268088, 1, 1, 1, 1, 1,
-0.5981266, 0.2558525, -1.658924, 1, 1, 1, 1, 1,
-0.5931392, -0.1775004, -2.658551, 1, 1, 1, 1, 1,
-0.5911645, 2.179048, 0.0184476, 1, 1, 1, 1, 1,
-0.583854, -0.7948915, -2.413348, 1, 1, 1, 1, 1,
-0.5835451, -0.8043392, -3.44065, 1, 1, 1, 1, 1,
-0.5746874, 0.7389451, -0.7139201, 1, 1, 1, 1, 1,
-0.573621, -0.5408708, -1.767306, 1, 1, 1, 1, 1,
-0.5703518, 0.6822802, 0.1201103, 1, 1, 1, 1, 1,
-0.566917, -0.6067939, -1.855394, 0, 0, 1, 1, 1,
-0.5609804, -1.305035, -2.110547, 1, 0, 0, 1, 1,
-0.5577084, 0.5570579, -1.117743, 1, 0, 0, 1, 1,
-0.5434107, -1.538866, -4.625158, 1, 0, 0, 1, 1,
-0.5391567, -0.8811443, -0.9001178, 1, 0, 0, 1, 1,
-0.5385599, -0.5777297, -2.294805, 1, 0, 0, 1, 1,
-0.535265, -1.655591, -2.011777, 0, 0, 0, 1, 1,
-0.5302845, 0.4898972, -1.732965, 0, 0, 0, 1, 1,
-0.5299726, -2.450813, -2.320734, 0, 0, 0, 1, 1,
-0.525229, 0.365858, -0.3758806, 0, 0, 0, 1, 1,
-0.5247775, -1.214274, -4.085771, 0, 0, 0, 1, 1,
-0.5237867, -2.356927, -3.026413, 0, 0, 0, 1, 1,
-0.5195485, -1.060538, -2.550286, 0, 0, 0, 1, 1,
-0.5153719, 0.4377473, -2.442773, 1, 1, 1, 1, 1,
-0.5146952, -0.7247202, -3.980452, 1, 1, 1, 1, 1,
-0.5052346, -1.441125, -2.769045, 1, 1, 1, 1, 1,
-0.4995242, -0.4081561, -2.637213, 1, 1, 1, 1, 1,
-0.4978291, 0.01147331, -1.681369, 1, 1, 1, 1, 1,
-0.4903267, 1.227171, -0.5580513, 1, 1, 1, 1, 1,
-0.4893483, 1.455611, -0.9499102, 1, 1, 1, 1, 1,
-0.4881462, 0.5681413, -1.344659, 1, 1, 1, 1, 1,
-0.485234, -0.3950661, -2.167379, 1, 1, 1, 1, 1,
-0.4820286, 0.5261674, -0.01473215, 1, 1, 1, 1, 1,
-0.4749771, 0.4093699, -2.074561, 1, 1, 1, 1, 1,
-0.4680235, -0.3339193, -1.716184, 1, 1, 1, 1, 1,
-0.4675244, -0.8094563, -2.686019, 1, 1, 1, 1, 1,
-0.4671283, 1.059744, 1.747072, 1, 1, 1, 1, 1,
-0.4666625, 1.812191, 0.8739225, 1, 1, 1, 1, 1,
-0.4584782, 1.438091, 0.8954844, 0, 0, 1, 1, 1,
-0.4555617, 1.183767, -1.211501, 1, 0, 0, 1, 1,
-0.4553789, -0.464906, -4.063077, 1, 0, 0, 1, 1,
-0.4549516, 1.201146, -0.6399246, 1, 0, 0, 1, 1,
-0.4537672, 0.2043734, -1.166458, 1, 0, 0, 1, 1,
-0.4496439, 0.5749467, 0.5523691, 1, 0, 0, 1, 1,
-0.4471345, -1.125347, -4.031702, 0, 0, 0, 1, 1,
-0.4464249, -1.044958, -3.075638, 0, 0, 0, 1, 1,
-0.4455929, -0.7598466, -1.530176, 0, 0, 0, 1, 1,
-0.4379453, 1.708112, -0.1305631, 0, 0, 0, 1, 1,
-0.4284477, -0.09600624, -2.839397, 0, 0, 0, 1, 1,
-0.4244155, -0.5389557, -2.673821, 0, 0, 0, 1, 1,
-0.4231994, -1.856412, -2.335669, 0, 0, 0, 1, 1,
-0.4212658, 1.110668, -0.6397644, 1, 1, 1, 1, 1,
-0.4199123, 1.347228, 0.3996969, 1, 1, 1, 1, 1,
-0.4191543, -1.060193, -2.553517, 1, 1, 1, 1, 1,
-0.4175989, -0.6889021, -2.669006, 1, 1, 1, 1, 1,
-0.4166821, 1.395324, 1.18111, 1, 1, 1, 1, 1,
-0.4165874, -0.8971531, -2.315508, 1, 1, 1, 1, 1,
-0.4137396, -0.1168789, -2.388305, 1, 1, 1, 1, 1,
-0.4113395, 0.3909504, 0.2674423, 1, 1, 1, 1, 1,
-0.4093426, 0.1900596, -2.815447, 1, 1, 1, 1, 1,
-0.4035529, 0.5987712, 0.6050891, 1, 1, 1, 1, 1,
-0.4013714, -0.7954354, -2.37148, 1, 1, 1, 1, 1,
-0.3984288, -2.414405, -5.413215, 1, 1, 1, 1, 1,
-0.3971308, 1.11993, 0.8218793, 1, 1, 1, 1, 1,
-0.3892539, 0.2918039, 0.4319635, 1, 1, 1, 1, 1,
-0.3867691, 1.898548, 0.2706561, 1, 1, 1, 1, 1,
-0.3826008, 0.02135907, -0.9185859, 0, 0, 1, 1, 1,
-0.376148, 0.1244744, -1.894415, 1, 0, 0, 1, 1,
-0.3749276, 1.790752, 1.653279, 1, 0, 0, 1, 1,
-0.373062, 0.07305127, -0.1705332, 1, 0, 0, 1, 1,
-0.3654032, 1.155722, 1.533137, 1, 0, 0, 1, 1,
-0.3628018, 0.1913295, -0.3221884, 1, 0, 0, 1, 1,
-0.3613531, -0.3332471, -2.436349, 0, 0, 0, 1, 1,
-0.3586014, -0.165724, -1.848243, 0, 0, 0, 1, 1,
-0.3573991, -1.49445, -2.504628, 0, 0, 0, 1, 1,
-0.3514209, -0.3810061, -2.780396, 0, 0, 0, 1, 1,
-0.3398767, -0.1573052, -1.943225, 0, 0, 0, 1, 1,
-0.3309185, -1.016947, -3.447162, 0, 0, 0, 1, 1,
-0.3301634, -0.06021276, 0.1266909, 0, 0, 0, 1, 1,
-0.3298166, 0.07144795, -1.801017, 1, 1, 1, 1, 1,
-0.3288585, 0.3691345, -1.671055, 1, 1, 1, 1, 1,
-0.3278841, -0.4384119, -1.589268, 1, 1, 1, 1, 1,
-0.3236476, 0.3770196, -0.53345, 1, 1, 1, 1, 1,
-0.3195443, 1.257489, -0.5257503, 1, 1, 1, 1, 1,
-0.3170035, 0.6681631, -0.4779892, 1, 1, 1, 1, 1,
-0.3162574, 1.339017, -1.030637, 1, 1, 1, 1, 1,
-0.3162296, -0.9889914, -2.717144, 1, 1, 1, 1, 1,
-0.3143011, -1.028314, -2.588164, 1, 1, 1, 1, 1,
-0.3039045, -1.549307, -3.818983, 1, 1, 1, 1, 1,
-0.3030716, 0.06513929, -0.6535245, 1, 1, 1, 1, 1,
-0.3023167, 1.380982, -0.02657516, 1, 1, 1, 1, 1,
-0.3016483, -0.8584363, -2.639822, 1, 1, 1, 1, 1,
-0.3000058, 0.2371866, -0.1272216, 1, 1, 1, 1, 1,
-0.2878426, 0.7919933, -0.7399852, 1, 1, 1, 1, 1,
-0.2875812, 0.4643961, 0.1420632, 0, 0, 1, 1, 1,
-0.286987, 0.4888987, -1.924375, 1, 0, 0, 1, 1,
-0.2849001, -0.02850302, -2.026889, 1, 0, 0, 1, 1,
-0.283139, 0.12815, -1.790657, 1, 0, 0, 1, 1,
-0.2714286, -0.03114233, -2.272542, 1, 0, 0, 1, 1,
-0.2696213, 0.8035601, -0.587486, 1, 0, 0, 1, 1,
-0.2680965, 0.4899194, -1.402042, 0, 0, 0, 1, 1,
-0.2651764, -0.3597954, -3.960437, 0, 0, 0, 1, 1,
-0.2612057, -0.7263343, -3.033692, 0, 0, 0, 1, 1,
-0.2597314, 0.1408757, 0.01335847, 0, 0, 0, 1, 1,
-0.2584955, 0.4751313, -1.13064, 0, 0, 0, 1, 1,
-0.2561683, -0.6424847, -0.3696333, 0, 0, 0, 1, 1,
-0.2555298, 1.293543, -0.329088, 0, 0, 0, 1, 1,
-0.2491402, 1.043084, -0.01356538, 1, 1, 1, 1, 1,
-0.2485148, 0.4045219, 0.06153625, 1, 1, 1, 1, 1,
-0.2476359, 0.5906392, 0.8248152, 1, 1, 1, 1, 1,
-0.2455605, 0.2168381, -1.585934, 1, 1, 1, 1, 1,
-0.244784, 0.1818348, -1.6184, 1, 1, 1, 1, 1,
-0.237262, -0.6324235, -1.669029, 1, 1, 1, 1, 1,
-0.232228, -1.388265, -1.506626, 1, 1, 1, 1, 1,
-0.2299222, -0.970307, -2.917765, 1, 1, 1, 1, 1,
-0.2275582, 1.440786, 0.357483, 1, 1, 1, 1, 1,
-0.2250586, 0.2348066, -1.429299, 1, 1, 1, 1, 1,
-0.2234958, 1.344283, -0.8690811, 1, 1, 1, 1, 1,
-0.221726, -0.2960888, -1.757799, 1, 1, 1, 1, 1,
-0.2216695, 0.6248654, -1.040379, 1, 1, 1, 1, 1,
-0.2207898, -0.8488815, -4.271862, 1, 1, 1, 1, 1,
-0.2180307, -0.3751704, -1.578803, 1, 1, 1, 1, 1,
-0.2160283, -0.1995844, -2.985093, 0, 0, 1, 1, 1,
-0.2137953, 0.713592, 1.330887, 1, 0, 0, 1, 1,
-0.2118069, -0.6098319, -3.970607, 1, 0, 0, 1, 1,
-0.2113174, -1.255502, -2.691175, 1, 0, 0, 1, 1,
-0.2080741, -0.1772262, -1.665211, 1, 0, 0, 1, 1,
-0.2072693, -0.2554825, -3.952104, 1, 0, 0, 1, 1,
-0.1985457, -0.660245, -4.094719, 0, 0, 0, 1, 1,
-0.1955059, -0.104737, -2.371725, 0, 0, 0, 1, 1,
-0.1941727, -0.4024891, -4.431415, 0, 0, 0, 1, 1,
-0.1917526, 1.206164, 0.1126405, 0, 0, 0, 1, 1,
-0.1909381, 0.1778612, 0.4619133, 0, 0, 0, 1, 1,
-0.1880045, 0.7558875, -1.735572, 0, 0, 0, 1, 1,
-0.1851977, 1.752083, -0.3468575, 0, 0, 0, 1, 1,
-0.1812392, 0.5544923, -0.7916747, 1, 1, 1, 1, 1,
-0.1811262, 0.9316226, 1.58059, 1, 1, 1, 1, 1,
-0.1751391, 0.009102339, -2.111313, 1, 1, 1, 1, 1,
-0.174917, -0.9155574, -2.144078, 1, 1, 1, 1, 1,
-0.1685042, -1.288519, -2.640471, 1, 1, 1, 1, 1,
-0.1647459, -1.602166, -3.960456, 1, 1, 1, 1, 1,
-0.1614413, -1.925231, -3.877079, 1, 1, 1, 1, 1,
-0.1611232, -0.9077948, -4.506557, 1, 1, 1, 1, 1,
-0.1586451, 0.02098332, -0.6805372, 1, 1, 1, 1, 1,
-0.1514019, -0.6988642, -2.175942, 1, 1, 1, 1, 1,
-0.1498195, 1.602687, 0.8007356, 1, 1, 1, 1, 1,
-0.1495699, 1.722639, 1.009615, 1, 1, 1, 1, 1,
-0.1402051, -0.0878427, -0.01384574, 1, 1, 1, 1, 1,
-0.1353769, -0.4251842, -1.766485, 1, 1, 1, 1, 1,
-0.1348799, 0.8478512, -1.346254, 1, 1, 1, 1, 1,
-0.1345878, -0.1907838, -3.122344, 0, 0, 1, 1, 1,
-0.133786, -1.317856, -2.70137, 1, 0, 0, 1, 1,
-0.1292903, 1.789955, -0.3104149, 1, 0, 0, 1, 1,
-0.1278703, 0.5574229, -1.653407, 1, 0, 0, 1, 1,
-0.1268298, -0.8692126, -3.890594, 1, 0, 0, 1, 1,
-0.1258107, 1.113098, -0.1071, 1, 0, 0, 1, 1,
-0.1224342, 0.8460008, 0.1572168, 0, 0, 0, 1, 1,
-0.1223591, 1.415592, 1.888837, 0, 0, 0, 1, 1,
-0.1221302, -0.7501657, -1.819489, 0, 0, 0, 1, 1,
-0.12042, -0.9070595, -3.289027, 0, 0, 0, 1, 1,
-0.1199863, -0.4740726, -4.294801, 0, 0, 0, 1, 1,
-0.1195253, 0.2580001, 1.77775, 0, 0, 0, 1, 1,
-0.1185134, -0.2975613, -3.543644, 0, 0, 0, 1, 1,
-0.1184797, -1.566191, -5.443374, 1, 1, 1, 1, 1,
-0.1172165, -0.7544187, -3.063017, 1, 1, 1, 1, 1,
-0.1139886, -1.393203, -2.408318, 1, 1, 1, 1, 1,
-0.1138408, 0.01378196, -2.050561, 1, 1, 1, 1, 1,
-0.1096088, 1.460316, -0.2572637, 1, 1, 1, 1, 1,
-0.1068062, -0.1849174, -1.373626, 1, 1, 1, 1, 1,
-0.09872232, 0.2264319, -1.267832, 1, 1, 1, 1, 1,
-0.09717678, 0.6545761, 0.1810002, 1, 1, 1, 1, 1,
-0.09527098, -0.6529313, -3.649907, 1, 1, 1, 1, 1,
-0.09210391, -0.2760336, -3.939259, 1, 1, 1, 1, 1,
-0.09117892, -1.241605, -2.127178, 1, 1, 1, 1, 1,
-0.08776647, 0.1149585, -0.2611208, 1, 1, 1, 1, 1,
-0.08660617, 0.4890578, 0.908911, 1, 1, 1, 1, 1,
-0.08618899, 0.3365991, -1.911035, 1, 1, 1, 1, 1,
-0.08544161, -1.259448, -1.954192, 1, 1, 1, 1, 1,
-0.08266768, 0.5120384, 0.4761024, 0, 0, 1, 1, 1,
-0.07732711, 0.8999676, -0.1712365, 1, 0, 0, 1, 1,
-0.07402144, 0.026703, -1.338915, 1, 0, 0, 1, 1,
-0.07302006, 2.204734, 1.224261, 1, 0, 0, 1, 1,
-0.07255431, -0.7422051, -2.080838, 1, 0, 0, 1, 1,
-0.07056506, -1.795708, -4.341708, 1, 0, 0, 1, 1,
-0.05417682, -1.25741, -3.989104, 0, 0, 0, 1, 1,
-0.05413261, -0.103559, -4.414601, 0, 0, 0, 1, 1,
-0.05159942, -0.2247064, -3.248537, 0, 0, 0, 1, 1,
-0.05070263, -0.9432305, -1.594688, 0, 0, 0, 1, 1,
-0.0489544, 0.3138624, 0.8120804, 0, 0, 0, 1, 1,
-0.04882437, -1.709779, -1.269789, 0, 0, 0, 1, 1,
-0.04879193, -0.5397071, -4.18635, 0, 0, 0, 1, 1,
-0.04280024, 2.06297, -0.2704161, 1, 1, 1, 1, 1,
-0.03904723, -0.433745, -3.302477, 1, 1, 1, 1, 1,
-0.03486911, 1.206001, -1.10808, 1, 1, 1, 1, 1,
-0.03044078, 1.059864, 0.1678259, 1, 1, 1, 1, 1,
-0.02711142, -0.5484626, -2.200226, 1, 1, 1, 1, 1,
-0.02525301, 1.442372, 0.6879357, 1, 1, 1, 1, 1,
-0.02390074, 2.012262, -1.824526, 1, 1, 1, 1, 1,
-0.02319426, 0.5118176, 0.1683801, 1, 1, 1, 1, 1,
-0.01683446, -1.053827, -4.669055, 1, 1, 1, 1, 1,
-0.01494931, 0.8702385, -0.9791341, 1, 1, 1, 1, 1,
-0.01355589, 0.9387658, 0.3953724, 1, 1, 1, 1, 1,
-0.01225029, 0.6554434, 0.002096595, 1, 1, 1, 1, 1,
-0.01115787, 0.9473107, -1.06409, 1, 1, 1, 1, 1,
-0.006778497, 2.066767, -0.5060795, 1, 1, 1, 1, 1,
-0.002941482, 1.131842, -0.3377698, 1, 1, 1, 1, 1,
0.001715387, -0.9491822, 4.586246, 0, 0, 1, 1, 1,
0.002012079, -0.7960546, 3.235739, 1, 0, 0, 1, 1,
0.002792357, 0.5525253, 0.2046936, 1, 0, 0, 1, 1,
0.005194243, -1.052983, 4.027541, 1, 0, 0, 1, 1,
0.01124032, -0.6565832, 4.732451, 1, 0, 0, 1, 1,
0.01198398, -0.5635887, 3.505338, 1, 0, 0, 1, 1,
0.01345497, -0.4350776, 4.768037, 0, 0, 0, 1, 1,
0.01609751, 1.203143, -0.7748764, 0, 0, 0, 1, 1,
0.01927858, 0.7514305, -0.4457526, 0, 0, 0, 1, 1,
0.02280529, 0.8173558, -1.1639, 0, 0, 0, 1, 1,
0.02304667, -0.7123066, 3.856562, 0, 0, 0, 1, 1,
0.03073673, 1.269926, 0.1112068, 0, 0, 0, 1, 1,
0.03109424, -0.5012403, 1.334373, 0, 0, 0, 1, 1,
0.03461269, -2.027778, 1.245741, 1, 1, 1, 1, 1,
0.03974962, 0.05450596, -0.09761238, 1, 1, 1, 1, 1,
0.04045496, 0.3088522, 0.9321092, 1, 1, 1, 1, 1,
0.04770107, 1.318029, -1.341135, 1, 1, 1, 1, 1,
0.04784912, 0.7829976, -0.8528413, 1, 1, 1, 1, 1,
0.05221402, 0.8548599, 0.6307677, 1, 1, 1, 1, 1,
0.05359401, -0.7170055, 1.568896, 1, 1, 1, 1, 1,
0.05608296, -1.272982, 2.822499, 1, 1, 1, 1, 1,
0.0572257, -0.2224906, 3.33297, 1, 1, 1, 1, 1,
0.06346777, 0.4615552, -0.07091452, 1, 1, 1, 1, 1,
0.06533474, -0.07465554, 1.890233, 1, 1, 1, 1, 1,
0.06752899, 0.2110329, -0.699571, 1, 1, 1, 1, 1,
0.0704461, 0.1040011, 0.2369875, 1, 1, 1, 1, 1,
0.07585947, -2.34799, 4.717924, 1, 1, 1, 1, 1,
0.07847087, 2.382209, 0.4051155, 1, 1, 1, 1, 1,
0.08953343, 0.252591, 1.580047, 0, 0, 1, 1, 1,
0.08961181, -0.6683756, 4.089157, 1, 0, 0, 1, 1,
0.0911744, 0.5369478, -0.60707, 1, 0, 0, 1, 1,
0.09138329, -0.446831, 1.692255, 1, 0, 0, 1, 1,
0.09362395, -0.6916528, 4.553108, 1, 0, 0, 1, 1,
0.09509591, 0.8954436, 1.384525, 1, 0, 0, 1, 1,
0.09575043, -1.705433, 4.255351, 0, 0, 0, 1, 1,
0.09630637, 0.8840861, 0.8929235, 0, 0, 0, 1, 1,
0.09850817, -1.067581, 2.262153, 0, 0, 0, 1, 1,
0.1066396, 0.99181, -0.878335, 0, 0, 0, 1, 1,
0.1077884, -0.7464858, 2.748535, 0, 0, 0, 1, 1,
0.1084433, -0.2442744, 2.330251, 0, 0, 0, 1, 1,
0.1107225, -0.4138989, 2.840978, 0, 0, 0, 1, 1,
0.1118071, -0.5035767, 4.094418, 1, 1, 1, 1, 1,
0.1130066, -0.2010275, 2.513955, 1, 1, 1, 1, 1,
0.1148392, 1.064445, 1.542006, 1, 1, 1, 1, 1,
0.1156907, -0.210888, 0.7421005, 1, 1, 1, 1, 1,
0.1166576, -0.4163716, 3.900477, 1, 1, 1, 1, 1,
0.1217578, 1.062602, 0.8710145, 1, 1, 1, 1, 1,
0.1247602, -0.4853688, 3.317895, 1, 1, 1, 1, 1,
0.1253697, -0.8975635, 3.957696, 1, 1, 1, 1, 1,
0.1267398, 0.3715144, 0.8162713, 1, 1, 1, 1, 1,
0.1276586, -0.141882, 1.485865, 1, 1, 1, 1, 1,
0.1278612, -1.645437, 5.530988, 1, 1, 1, 1, 1,
0.1286958, -0.9543495, 3.516313, 1, 1, 1, 1, 1,
0.1293105, 0.06063796, 0.7947673, 1, 1, 1, 1, 1,
0.1303561, -0.01709111, 0.5137008, 1, 1, 1, 1, 1,
0.1312249, 0.1674109, 0.4738216, 1, 1, 1, 1, 1,
0.1354804, -2.153389, 2.253042, 0, 0, 1, 1, 1,
0.1380295, -2.053422, 4.378515, 1, 0, 0, 1, 1,
0.1411265, -0.1120416, 2.95386, 1, 0, 0, 1, 1,
0.142622, 1.021191, 1.069847, 1, 0, 0, 1, 1,
0.1470705, -0.3496195, 2.862684, 1, 0, 0, 1, 1,
0.1512166, 0.3027121, 0.0177882, 1, 0, 0, 1, 1,
0.1527687, -1.602607, 3.448078, 0, 0, 0, 1, 1,
0.1544039, -1.24996, 5.206743, 0, 0, 0, 1, 1,
0.1618456, 0.2521494, -0.7391968, 0, 0, 0, 1, 1,
0.1646127, 0.7561356, 0.2049365, 0, 0, 0, 1, 1,
0.1657496, 0.1912893, 1.389126, 0, 0, 0, 1, 1,
0.1696755, -1.012398, 2.56237, 0, 0, 0, 1, 1,
0.173539, -1.479951, 2.666617, 0, 0, 0, 1, 1,
0.1756559, 0.09075676, 0.9447104, 1, 1, 1, 1, 1,
0.1763247, -0.6048679, 3.183811, 1, 1, 1, 1, 1,
0.177348, -0.8563596, 2.187611, 1, 1, 1, 1, 1,
0.1795301, 1.271159, -0.9494258, 1, 1, 1, 1, 1,
0.1816021, 0.9846097, -1.37563, 1, 1, 1, 1, 1,
0.181952, -0.240864, 3.769094, 1, 1, 1, 1, 1,
0.1827904, -1.223325, 5.13087, 1, 1, 1, 1, 1,
0.1834339, 1.517765, 1.285152, 1, 1, 1, 1, 1,
0.1850942, -1.132967, 3.458673, 1, 1, 1, 1, 1,
0.1859322, 1.070929, 0.7001617, 1, 1, 1, 1, 1,
0.1910891, 0.5852357, -0.2441557, 1, 1, 1, 1, 1,
0.1936855, -0.07158387, 1.639109, 1, 1, 1, 1, 1,
0.1956609, 1.048145, -0.7405487, 1, 1, 1, 1, 1,
0.1983537, 0.4434599, -1.725893, 1, 1, 1, 1, 1,
0.204617, -1.004096, 1.932977, 1, 1, 1, 1, 1,
0.2069024, -2.18152, 3.327442, 0, 0, 1, 1, 1,
0.2130746, -1.256665, 4.275257, 1, 0, 0, 1, 1,
0.2131134, 0.09714027, 2.182891, 1, 0, 0, 1, 1,
0.2153127, 0.7750668, 0.08519768, 1, 0, 0, 1, 1,
0.2163675, 0.5251296, -0.5386301, 1, 0, 0, 1, 1,
0.2187102, -0.3604916, 1.102552, 1, 0, 0, 1, 1,
0.2254938, 0.3595478, 0.5825086, 0, 0, 0, 1, 1,
0.2290166, -0.6496059, 1.83437, 0, 0, 0, 1, 1,
0.2297805, 0.8802914, -0.7959996, 0, 0, 0, 1, 1,
0.2363858, 1.374656, 0.9651418, 0, 0, 0, 1, 1,
0.2365156, -0.5654223, 4.483004, 0, 0, 0, 1, 1,
0.2393646, -1.798985, 3.156458, 0, 0, 0, 1, 1,
0.2429745, -0.2885791, 0.2783797, 0, 0, 0, 1, 1,
0.2431741, -1.235063, 3.380319, 1, 1, 1, 1, 1,
0.243652, 0.2479984, 0.2196875, 1, 1, 1, 1, 1,
0.2508224, 0.03768703, 1.406271, 1, 1, 1, 1, 1,
0.2524216, 1.342678, 0.426355, 1, 1, 1, 1, 1,
0.2542774, -0.203453, 2.851666, 1, 1, 1, 1, 1,
0.2559272, -0.6837687, 0.04319505, 1, 1, 1, 1, 1,
0.2571305, -0.6591946, 2.6463, 1, 1, 1, 1, 1,
0.2641232, -0.8565848, 1.102295, 1, 1, 1, 1, 1,
0.2650899, 1.422638, 2.877367, 1, 1, 1, 1, 1,
0.2682412, 0.4384213, -1.276996, 1, 1, 1, 1, 1,
0.268436, 0.8599877, 1.676499, 1, 1, 1, 1, 1,
0.2702898, -0.7019302, 2.678294, 1, 1, 1, 1, 1,
0.2744412, -1.651703, 3.915912, 1, 1, 1, 1, 1,
0.2745094, 0.3367903, 1.094529, 1, 1, 1, 1, 1,
0.2788676, -1.168962, 3.025856, 1, 1, 1, 1, 1,
0.2811421, 1.15541, 0.4521224, 0, 0, 1, 1, 1,
0.2845993, -1.771146, 2.215979, 1, 0, 0, 1, 1,
0.2882875, -0.2685015, 2.528114, 1, 0, 0, 1, 1,
0.2885271, 1.064387, -3.081977, 1, 0, 0, 1, 1,
0.3074576, 1.246794, 0.7026177, 1, 0, 0, 1, 1,
0.3080002, 0.3707814, 0.578531, 1, 0, 0, 1, 1,
0.3093672, 2.892512, -0.753413, 0, 0, 0, 1, 1,
0.3096705, 0.4719435, 1.239112, 0, 0, 0, 1, 1,
0.3144309, -0.7899233, 2.224449, 0, 0, 0, 1, 1,
0.3187398, 0.6125765, 2.306194, 0, 0, 0, 1, 1,
0.3191567, -2.56561, 3.084676, 0, 0, 0, 1, 1,
0.3203705, -0.04919536, 1.967749, 0, 0, 0, 1, 1,
0.3208647, 1.479068, 1.267878, 0, 0, 0, 1, 1,
0.3218094, 0.9767764, 0.6074764, 1, 1, 1, 1, 1,
0.3240216, -0.7812378, 2.356307, 1, 1, 1, 1, 1,
0.3246169, 1.036671, 3.097623, 1, 1, 1, 1, 1,
0.3282675, 0.2031047, 1.974403, 1, 1, 1, 1, 1,
0.3292255, 1.063673, -0.2401599, 1, 1, 1, 1, 1,
0.3302599, 0.04727858, 2.902333, 1, 1, 1, 1, 1,
0.3305174, 0.2297119, -0.1338914, 1, 1, 1, 1, 1,
0.331365, -0.4732948, 1.445204, 1, 1, 1, 1, 1,
0.3319082, 1.598273, -0.355361, 1, 1, 1, 1, 1,
0.3327238, 2.44629, -0.773454, 1, 1, 1, 1, 1,
0.3339895, -1.831277, 4.383268, 1, 1, 1, 1, 1,
0.3389751, 1.317989, 0.2054956, 1, 1, 1, 1, 1,
0.3394789, 0.03127345, 0.8490389, 1, 1, 1, 1, 1,
0.3419071, 0.2017804, 1.160994, 1, 1, 1, 1, 1,
0.3429243, -0.9724435, 4.451271, 1, 1, 1, 1, 1,
0.3430171, 1.200485, -1.478855, 0, 0, 1, 1, 1,
0.3442135, 0.1239263, 0.4452848, 1, 0, 0, 1, 1,
0.3442509, 2.609882, 0.2665505, 1, 0, 0, 1, 1,
0.344413, 0.8248124, 0.2858821, 1, 0, 0, 1, 1,
0.3453299, 1.455404, 0.2449607, 1, 0, 0, 1, 1,
0.3586671, 0.9909331, 1.588165, 1, 0, 0, 1, 1,
0.3593632, -2.399656, 3.672069, 0, 0, 0, 1, 1,
0.3608678, -0.4658668, 4.24501, 0, 0, 0, 1, 1,
0.3649686, 0.5387487, 0.5415279, 0, 0, 0, 1, 1,
0.3661288, -1.056826, 1.970976, 0, 0, 0, 1, 1,
0.3714693, 0.2091822, 1.470923, 0, 0, 0, 1, 1,
0.37453, 0.4003471, 0.2790672, 0, 0, 0, 1, 1,
0.3776247, 1.717344, -0.1189869, 0, 0, 0, 1, 1,
0.3780496, 1.41775, 0.5929159, 1, 1, 1, 1, 1,
0.3825511, -1.712428, 1.144438, 1, 1, 1, 1, 1,
0.3884594, -1.073463, 2.605526, 1, 1, 1, 1, 1,
0.3910424, -0.6047106, 3.275054, 1, 1, 1, 1, 1,
0.3913104, 0.3318118, 0.2875805, 1, 1, 1, 1, 1,
0.3966081, -0.1372294, 3.606387, 1, 1, 1, 1, 1,
0.399131, -1.465985, 3.422241, 1, 1, 1, 1, 1,
0.4062944, -0.8996366, 2.813515, 1, 1, 1, 1, 1,
0.4093003, 0.4376295, 0.6190605, 1, 1, 1, 1, 1,
0.4135649, 0.5572403, 1.244277, 1, 1, 1, 1, 1,
0.415154, 1.104468, 2.147018, 1, 1, 1, 1, 1,
0.4171122, 0.7574753, -0.08345458, 1, 1, 1, 1, 1,
0.4218975, 1.09145, 1.284652, 1, 1, 1, 1, 1,
0.4219192, 1.899954, -0.1272821, 1, 1, 1, 1, 1,
0.4247769, -0.6809995, 2.518457, 1, 1, 1, 1, 1,
0.4260918, 0.2870796, 0.4426025, 0, 0, 1, 1, 1,
0.4261765, 0.7565713, -0.7177692, 1, 0, 0, 1, 1,
0.4275982, -0.4961027, 3.790376, 1, 0, 0, 1, 1,
0.4277172, 1.528376, -0.05645441, 1, 0, 0, 1, 1,
0.42834, 0.7535611, 0.3281286, 1, 0, 0, 1, 1,
0.4285663, -0.5392671, 3.009284, 1, 0, 0, 1, 1,
0.4294881, 0.3787813, 0.7550704, 0, 0, 0, 1, 1,
0.4299262, -0.4464047, 3.198921, 0, 0, 0, 1, 1,
0.4357243, -0.1984422, 2.37229, 0, 0, 0, 1, 1,
0.4375433, 0.8334028, 0.5489904, 0, 0, 0, 1, 1,
0.4428592, 0.1937536, 0.5136543, 0, 0, 0, 1, 1,
0.4441905, 0.2596767, 2.10676, 0, 0, 0, 1, 1,
0.4467101, -0.3074599, 3.410005, 0, 0, 0, 1, 1,
0.4474332, -1.431877, 3.735337, 1, 1, 1, 1, 1,
0.4498285, -0.8408622, 2.085497, 1, 1, 1, 1, 1,
0.4569537, 0.359809, 1.408431, 1, 1, 1, 1, 1,
0.4604881, -1.812788, 2.899571, 1, 1, 1, 1, 1,
0.4611614, -0.7658933, 2.887559, 1, 1, 1, 1, 1,
0.4619312, -1.471649, 4.006459, 1, 1, 1, 1, 1,
0.4649493, 1.433886, -1.121566, 1, 1, 1, 1, 1,
0.4683221, -0.2492761, 1.076889, 1, 1, 1, 1, 1,
0.4697856, 0.06440448, 2.574197, 1, 1, 1, 1, 1,
0.4713757, -1.333396, 1.147345, 1, 1, 1, 1, 1,
0.4725412, 0.252429, 1.390649, 1, 1, 1, 1, 1,
0.4735882, -0.0805074, 0.0244862, 1, 1, 1, 1, 1,
0.4824398, -0.2647927, 1.350103, 1, 1, 1, 1, 1,
0.4826016, -0.7434474, 1.658867, 1, 1, 1, 1, 1,
0.4828106, -1.300015, 2.55489, 1, 1, 1, 1, 1,
0.4832498, 0.3366293, 0.8014147, 0, 0, 1, 1, 1,
0.4873526, -0.1265588, 2.004763, 1, 0, 0, 1, 1,
0.4874938, 0.3824157, 1.548402, 1, 0, 0, 1, 1,
0.4891912, -0.1339442, 1.328028, 1, 0, 0, 1, 1,
0.4933151, -1.745984, 3.489654, 1, 0, 0, 1, 1,
0.4956107, -1.072718, 3.528878, 1, 0, 0, 1, 1,
0.4968795, 0.9555308, -0.2883241, 0, 0, 0, 1, 1,
0.4981646, -1.525607, 2.820665, 0, 0, 0, 1, 1,
0.4984808, -0.01463579, 2.163293, 0, 0, 0, 1, 1,
0.5012116, 0.2401944, 2.101698, 0, 0, 0, 1, 1,
0.5059813, 1.372183, 0.6441131, 0, 0, 0, 1, 1,
0.5146372, -0.07535356, 1.60242, 0, 0, 0, 1, 1,
0.5203208, -0.7978405, 2.106586, 0, 0, 0, 1, 1,
0.5213248, -0.6069398, 1.577608, 1, 1, 1, 1, 1,
0.5279301, 0.7269161, 1.339104, 1, 1, 1, 1, 1,
0.5334454, -0.4510171, 1.056507, 1, 1, 1, 1, 1,
0.5343094, -1.018157, 2.922296, 1, 1, 1, 1, 1,
0.5348035, 0.7601636, 0.444307, 1, 1, 1, 1, 1,
0.5397855, -1.422941, 3.796227, 1, 1, 1, 1, 1,
0.540071, -0.251967, 2.317061, 1, 1, 1, 1, 1,
0.5438209, 1.445578, 1.231136, 1, 1, 1, 1, 1,
0.5445047, 0.1314095, 0.4107191, 1, 1, 1, 1, 1,
0.5447488, -0.4996364, 2.309962, 1, 1, 1, 1, 1,
0.5471314, -1.521975, 4.670964, 1, 1, 1, 1, 1,
0.5473931, -0.9828129, 1.911502, 1, 1, 1, 1, 1,
0.5476722, -0.6695824, 2.733182, 1, 1, 1, 1, 1,
0.5500232, -0.03810568, 0.9938828, 1, 1, 1, 1, 1,
0.5513978, -0.6394589, 2.038371, 1, 1, 1, 1, 1,
0.5569516, 0.3607242, 2.198696, 0, 0, 1, 1, 1,
0.5576169, 1.010565, 1.452665, 1, 0, 0, 1, 1,
0.5626453, 0.789748, 1.668804, 1, 0, 0, 1, 1,
0.5655637, 0.8005084, 1.249684, 1, 0, 0, 1, 1,
0.5659738, 1.130186, 0.9530475, 1, 0, 0, 1, 1,
0.5665398, -0.1069164, 3.455447, 1, 0, 0, 1, 1,
0.5671809, -0.079115, 0.41765, 0, 0, 0, 1, 1,
0.5680349, -1.568569, 0.9602937, 0, 0, 0, 1, 1,
0.5721308, 0.149149, 0.7229577, 0, 0, 0, 1, 1,
0.5763949, 0.8013877, 1.274713, 0, 0, 0, 1, 1,
0.5806015, -1.743546, 1.730053, 0, 0, 0, 1, 1,
0.5908771, -0.6746437, 3.43034, 0, 0, 0, 1, 1,
0.5926292, 1.333439, -0.2849152, 0, 0, 0, 1, 1,
0.5947337, 0.1956736, 1.11467, 1, 1, 1, 1, 1,
0.5949294, 2.141956, 0.9424062, 1, 1, 1, 1, 1,
0.5966903, -1.534146, 2.258473, 1, 1, 1, 1, 1,
0.597428, -0.5788051, 3.805165, 1, 1, 1, 1, 1,
0.5990034, 1.109413, 0.445596, 1, 1, 1, 1, 1,
0.6001191, 0.5657275, 1.880405, 1, 1, 1, 1, 1,
0.6008415, -0.3680786, 2.4411, 1, 1, 1, 1, 1,
0.603143, 0.3320437, 1.144411, 1, 1, 1, 1, 1,
0.6064873, 1.443955, 0.09219571, 1, 1, 1, 1, 1,
0.6146632, -1.018922, 3.466405, 1, 1, 1, 1, 1,
0.6150256, 0.1150837, 1.565009, 1, 1, 1, 1, 1,
0.6199253, -0.8715849, 2.800015, 1, 1, 1, 1, 1,
0.6208237, 1.874903, -0.3339674, 1, 1, 1, 1, 1,
0.6240807, 0.4395337, 0.09687256, 1, 1, 1, 1, 1,
0.6249124, -0.926168, 2.172498, 1, 1, 1, 1, 1,
0.6319299, -0.2351651, 1.762528, 0, 0, 1, 1, 1,
0.6330377, 1.162285, -0.380612, 1, 0, 0, 1, 1,
0.636218, 1.140215, 1.105742, 1, 0, 0, 1, 1,
0.6383311, 0.1280069, 1.66042, 1, 0, 0, 1, 1,
0.6460239, -0.5635364, 3.1769, 1, 0, 0, 1, 1,
0.65043, 1.017462, 0.7458166, 1, 0, 0, 1, 1,
0.6552484, 0.8610228, 1.654648, 0, 0, 0, 1, 1,
0.6577262, -1.529999, 4.3912, 0, 0, 0, 1, 1,
0.6594372, 0.6796924, 0.8209084, 0, 0, 0, 1, 1,
0.6603056, 0.9285182, 0.4167721, 0, 0, 0, 1, 1,
0.666935, -0.6307806, 1.801505, 0, 0, 0, 1, 1,
0.6684842, -0.3077789, 2.374712, 0, 0, 0, 1, 1,
0.6769211, 0.4245952, 1.292341, 0, 0, 0, 1, 1,
0.6776909, 0.5149765, 2.090905, 1, 1, 1, 1, 1,
0.6795409, 0.6596855, 1.064644, 1, 1, 1, 1, 1,
0.6921118, 0.3137314, 0.1141924, 1, 1, 1, 1, 1,
0.6939962, -0.2357299, 0.953213, 1, 1, 1, 1, 1,
0.6962027, -1.527006, 3.55224, 1, 1, 1, 1, 1,
0.70047, -1.745272, 2.421559, 1, 1, 1, 1, 1,
0.7011392, 0.337188, -0.106039, 1, 1, 1, 1, 1,
0.7049248, 1.589239, 0.1711868, 1, 1, 1, 1, 1,
0.7065283, -0.7928609, 1.632342, 1, 1, 1, 1, 1,
0.7070146, -0.5962117, 1.805087, 1, 1, 1, 1, 1,
0.7083191, -0.2825674, 1.635159, 1, 1, 1, 1, 1,
0.7129563, 0.3616654, 0.9822665, 1, 1, 1, 1, 1,
0.7222535, 2.040493, 1.791931, 1, 1, 1, 1, 1,
0.7230852, -0.8397613, 1.138899, 1, 1, 1, 1, 1,
0.7248852, 0.4579511, 1.614098, 1, 1, 1, 1, 1,
0.7261177, -1.366964, 2.617139, 0, 0, 1, 1, 1,
0.7278224, 1.574647, 2.007178, 1, 0, 0, 1, 1,
0.7285469, -0.2882627, 1.450732, 1, 0, 0, 1, 1,
0.7292474, -0.9176835, 2.45879, 1, 0, 0, 1, 1,
0.7327046, 0.3737744, 1.908211, 1, 0, 0, 1, 1,
0.7487936, 1.49306, 0.7459529, 1, 0, 0, 1, 1,
0.7525852, -0.3892303, 2.809313, 0, 0, 0, 1, 1,
0.753552, -0.6663163, 1.883703, 0, 0, 0, 1, 1,
0.75991, -0.3613189, 1.420474, 0, 0, 0, 1, 1,
0.7617052, -0.8470572, 4.618576, 0, 0, 0, 1, 1,
0.7654524, -1.124894, 3.067986, 0, 0, 0, 1, 1,
0.7672883, -0.2433563, 1.626504, 0, 0, 0, 1, 1,
0.7747557, 0.8324847, 1.553712, 0, 0, 0, 1, 1,
0.7761484, 1.141185, 0.6241443, 1, 1, 1, 1, 1,
0.7786166, -0.410081, 0.9758282, 1, 1, 1, 1, 1,
0.7809943, -2.25487, 3.881357, 1, 1, 1, 1, 1,
0.7886488, 0.08532603, 2.071088, 1, 1, 1, 1, 1,
0.7897264, -0.3358574, 3.909892, 1, 1, 1, 1, 1,
0.7924755, -0.01859133, 2.616915, 1, 1, 1, 1, 1,
0.7940717, -0.2134956, 1.493413, 1, 1, 1, 1, 1,
0.7941968, 0.08828475, 0.5144836, 1, 1, 1, 1, 1,
0.8013685, 0.1060783, 0.5400502, 1, 1, 1, 1, 1,
0.802117, 0.03260314, 1.921824, 1, 1, 1, 1, 1,
0.8054374, -0.1107821, 2.089819, 1, 1, 1, 1, 1,
0.8142475, -0.9626918, 2.550188, 1, 1, 1, 1, 1,
0.8190254, -1.570454, 3.590827, 1, 1, 1, 1, 1,
0.824666, -0.1322371, 1.818928, 1, 1, 1, 1, 1,
0.8269983, 0.8392942, -0.345928, 1, 1, 1, 1, 1,
0.8304157, -1.468464, 1.360509, 0, 0, 1, 1, 1,
0.831024, -0.2816463, 2.131102, 1, 0, 0, 1, 1,
0.8320419, 1.826983, -0.7923347, 1, 0, 0, 1, 1,
0.8338024, -0.3473117, 0.4952033, 1, 0, 0, 1, 1,
0.8351387, 0.5553659, -0.3735583, 1, 0, 0, 1, 1,
0.8405024, -0.138006, 0.9770275, 1, 0, 0, 1, 1,
0.8438239, 0.2958212, 1.487608, 0, 0, 0, 1, 1,
0.845028, -1.092105, 4.364966, 0, 0, 0, 1, 1,
0.8468598, 0.3325207, 1.322384, 0, 0, 0, 1, 1,
0.8481132, 0.3048899, 2.247353, 0, 0, 0, 1, 1,
0.8490074, -0.08023192, 0.9575862, 0, 0, 0, 1, 1,
0.8505585, 0.3428297, -0.1748753, 0, 0, 0, 1, 1,
0.8523605, 2.059176, -0.3882186, 0, 0, 0, 1, 1,
0.8554248, 0.5351218, 1.50042, 1, 1, 1, 1, 1,
0.8677449, -0.9926817, 1.51302, 1, 1, 1, 1, 1,
0.8706884, -0.6690009, 1.038682, 1, 1, 1, 1, 1,
0.8716161, 0.5186299, 1.742418, 1, 1, 1, 1, 1,
0.8732653, 2.108767, -0.5328465, 1, 1, 1, 1, 1,
0.8733645, 0.8072167, 0.3821881, 1, 1, 1, 1, 1,
0.8736364, -0.01816908, 3.181793, 1, 1, 1, 1, 1,
0.8760534, 0.8892519, 0.5394344, 1, 1, 1, 1, 1,
0.8784015, -0.7513458, 2.041177, 1, 1, 1, 1, 1,
0.8872305, -1.808605, 2.631303, 1, 1, 1, 1, 1,
0.8914642, 0.6994687, 2.21663, 1, 1, 1, 1, 1,
0.892042, 1.613652, 1.11847, 1, 1, 1, 1, 1,
0.8973629, -1.5597, 2.862086, 1, 1, 1, 1, 1,
0.9005281, -0.3289501, 0.860116, 1, 1, 1, 1, 1,
0.9029319, -0.04432171, 0.762717, 1, 1, 1, 1, 1,
0.9063726, 0.03729621, 0.8158112, 0, 0, 1, 1, 1,
0.9188974, 1.690837, -1.276512, 1, 0, 0, 1, 1,
0.9199222, -1.206766, 4.453044, 1, 0, 0, 1, 1,
0.9309921, -0.03792991, 0.9965454, 1, 0, 0, 1, 1,
0.9311493, -0.1922758, 4.658123, 1, 0, 0, 1, 1,
0.9340291, -0.01258696, 1.13519, 1, 0, 0, 1, 1,
0.9374844, -1.785468, 1.799386, 0, 0, 0, 1, 1,
0.9380001, 1.482582, 0.6225519, 0, 0, 0, 1, 1,
0.943699, -0.4884106, 1.556453, 0, 0, 0, 1, 1,
0.9438224, -0.8287711, 5.566559, 0, 0, 0, 1, 1,
0.9461515, 0.177223, 2.955915, 0, 0, 0, 1, 1,
0.9482529, 0.8498794, 2.220706, 0, 0, 0, 1, 1,
0.9585307, 0.361206, 2.029941, 0, 0, 0, 1, 1,
0.9586346, -1.974923, 1.620616, 1, 1, 1, 1, 1,
0.9604996, -1.03933, 2.28365, 1, 1, 1, 1, 1,
0.9682784, -1.011029, 0.5953239, 1, 1, 1, 1, 1,
0.9707627, 2.516184, 1.391741, 1, 1, 1, 1, 1,
0.9744177, -0.08545592, 2.399707, 1, 1, 1, 1, 1,
0.9760839, 0.07721344, 3.028188, 1, 1, 1, 1, 1,
0.9782788, -0.8356094, 2.434279, 1, 1, 1, 1, 1,
0.9825065, -0.5918115, 3.967268, 1, 1, 1, 1, 1,
0.9861135, 0.7088016, 1.557808, 1, 1, 1, 1, 1,
0.9878926, 0.9254451, 0.3011658, 1, 1, 1, 1, 1,
0.9943457, -0.6401498, 2.002433, 1, 1, 1, 1, 1,
0.998107, -1.238526, 2.093087, 1, 1, 1, 1, 1,
1.000859, 0.5367507, 0.1739125, 1, 1, 1, 1, 1,
1.000883, -0.9322399, 3.718146, 1, 1, 1, 1, 1,
1.002666, -1.10929, 3.474861, 1, 1, 1, 1, 1,
1.004125, 1.111758, -0.2851749, 0, 0, 1, 1, 1,
1.004792, -0.2498701, 1.198069, 1, 0, 0, 1, 1,
1.011004, 0.451516, 0.396606, 1, 0, 0, 1, 1,
1.01393, 0.7921434, 1.358674, 1, 0, 0, 1, 1,
1.020791, -0.324948, 2.286756, 1, 0, 0, 1, 1,
1.035851, -0.02384642, 2.833746, 1, 0, 0, 1, 1,
1.038751, -0.8392423, 3.212956, 0, 0, 0, 1, 1,
1.044684, 1.570266, 0.2744496, 0, 0, 0, 1, 1,
1.04501, -0.6747549, 0.3258266, 0, 0, 0, 1, 1,
1.048848, 2.112048, 0.6201954, 0, 0, 0, 1, 1,
1.049638, 0.5387785, 0.8390531, 0, 0, 0, 1, 1,
1.054222, 0.3726897, 1.314138, 0, 0, 0, 1, 1,
1.056143, 0.4339088, 1.089064, 0, 0, 0, 1, 1,
1.05726, -0.7442117, 3.108764, 1, 1, 1, 1, 1,
1.061384, -0.0215418, 0.6219319, 1, 1, 1, 1, 1,
1.068242, 0.2648208, 0.5796877, 1, 1, 1, 1, 1,
1.068798, 1.683277, 0.4721693, 1, 1, 1, 1, 1,
1.075616, -1.288258, 2.689895, 1, 1, 1, 1, 1,
1.079394, 1.264756, 0.518788, 1, 1, 1, 1, 1,
1.082064, -0.5280909, 2.045425, 1, 1, 1, 1, 1,
1.091892, 1.168651, 0.7820455, 1, 1, 1, 1, 1,
1.09769, 0.6403758, 2.377415, 1, 1, 1, 1, 1,
1.099549, 2.024045, 1.152586, 1, 1, 1, 1, 1,
1.108832, -1.506579, 1.952608, 1, 1, 1, 1, 1,
1.110886, -1.222315, 2.840511, 1, 1, 1, 1, 1,
1.113431, 1.349085, 1.737773, 1, 1, 1, 1, 1,
1.11902, 2.202783, 1.424401, 1, 1, 1, 1, 1,
1.123825, -0.424929, 2.599782, 1, 1, 1, 1, 1,
1.125895, -0.1374324, 1.791573, 0, 0, 1, 1, 1,
1.126059, 0.6933546, 0.08230877, 1, 0, 0, 1, 1,
1.126467, 0.5244164, 3.010512, 1, 0, 0, 1, 1,
1.136057, 2.097933, -1.128414, 1, 0, 0, 1, 1,
1.147489, -0.3302752, 4.100869, 1, 0, 0, 1, 1,
1.151484, 0.3325062, 1.864057, 1, 0, 0, 1, 1,
1.151619, -0.3441182, 0.4875679, 0, 0, 0, 1, 1,
1.157431, 0.2477758, 2.212968, 0, 0, 0, 1, 1,
1.159966, 0.5810704, 0.9918539, 0, 0, 0, 1, 1,
1.162902, -0.4988241, 2.217563, 0, 0, 0, 1, 1,
1.16349, -1.185054, 4.313118, 0, 0, 0, 1, 1,
1.175384, 0.6956086, 0.565879, 0, 0, 0, 1, 1,
1.179346, 0.8106025, 1.513448, 0, 0, 0, 1, 1,
1.18452, -0.8992162, 1.672332, 1, 1, 1, 1, 1,
1.185527, -0.4471208, 1.65532, 1, 1, 1, 1, 1,
1.189356, -0.6387115, 1.49593, 1, 1, 1, 1, 1,
1.196669, 0.7543324, -0.5034633, 1, 1, 1, 1, 1,
1.199301, 1.015639, 0.501338, 1, 1, 1, 1, 1,
1.213118, 1.016313, 1.41851, 1, 1, 1, 1, 1,
1.213825, -0.3701176, 1.132662, 1, 1, 1, 1, 1,
1.214145, 0.6746898, 0.09544378, 1, 1, 1, 1, 1,
1.223333, 1.14329, 0.5976619, 1, 1, 1, 1, 1,
1.223464, 0.9858377, 1.135875, 1, 1, 1, 1, 1,
1.224927, 0.9036482, 0.7454841, 1, 1, 1, 1, 1,
1.226505, -1.234729, 3.437062, 1, 1, 1, 1, 1,
1.234224, -0.2103356, 1.663102, 1, 1, 1, 1, 1,
1.241609, 0.2638355, 2.689737, 1, 1, 1, 1, 1,
1.261993, -0.5324097, 2.226285, 1, 1, 1, 1, 1,
1.263604, -0.5020368, 2.222619, 0, 0, 1, 1, 1,
1.264998, 1.044471, -0.4776184, 1, 0, 0, 1, 1,
1.276447, -0.8508672, 2.026787, 1, 0, 0, 1, 1,
1.280884, -1.076541, 1.551052, 1, 0, 0, 1, 1,
1.288393, -0.1487475, 3.85838, 1, 0, 0, 1, 1,
1.295254, -0.5131295, 0.3595592, 1, 0, 0, 1, 1,
1.298321, -0.4412641, 2.485911, 0, 0, 0, 1, 1,
1.308535, -0.4830184, 2.983616, 0, 0, 0, 1, 1,
1.323893, 1.245948, 0.3541273, 0, 0, 0, 1, 1,
1.32691, -0.5295402, 2.233697, 0, 0, 0, 1, 1,
1.33007, -1.352745, 3.761497, 0, 0, 0, 1, 1,
1.346333, 0.2682492, 0.5108494, 0, 0, 0, 1, 1,
1.355347, 1.956061, 0.8364361, 0, 0, 0, 1, 1,
1.358046, -0.5779834, -0.2204403, 1, 1, 1, 1, 1,
1.379283, 0.2176338, 2.164178, 1, 1, 1, 1, 1,
1.381249, -0.5296673, 3.190092, 1, 1, 1, 1, 1,
1.387672, 1.144797, -0.1456988, 1, 1, 1, 1, 1,
1.401534, -1.067273, 1.219015, 1, 1, 1, 1, 1,
1.40218, -0.7129962, 2.393835, 1, 1, 1, 1, 1,
1.421365, -0.03913048, 1.574339, 1, 1, 1, 1, 1,
1.422483, 0.2018175, 0.6013761, 1, 1, 1, 1, 1,
1.441599, -0.05343524, 1.062531, 1, 1, 1, 1, 1,
1.449636, -0.8145185, 2.147187, 1, 1, 1, 1, 1,
1.450383, 1.198667, 0.6164102, 1, 1, 1, 1, 1,
1.471687, -0.8924862, 1.242072, 1, 1, 1, 1, 1,
1.493223, -0.642242, 0.4718191, 1, 1, 1, 1, 1,
1.49474, -0.6071768, -0.04780892, 1, 1, 1, 1, 1,
1.508569, 0.7803507, 2.263007, 1, 1, 1, 1, 1,
1.534023, 0.6484846, 1.672202, 0, 0, 1, 1, 1,
1.553643, -0.3821585, 0.6661944, 1, 0, 0, 1, 1,
1.562723, -1.80757, 2.896124, 1, 0, 0, 1, 1,
1.567731, 0.068932, 2.28782, 1, 0, 0, 1, 1,
1.569185, -0.4720061, 3.303645, 1, 0, 0, 1, 1,
1.573764, 1.78864, 0.9663181, 1, 0, 0, 1, 1,
1.578555, 1.287177, 0.9092305, 0, 0, 0, 1, 1,
1.578807, -0.6664467, 1.178019, 0, 0, 0, 1, 1,
1.582172, -0.5073647, 0.625962, 0, 0, 0, 1, 1,
1.59926, 0.2061259, 2.797678, 0, 0, 0, 1, 1,
1.607775, 0.7609084, 3.780396, 0, 0, 0, 1, 1,
1.609645, -0.04108145, 2.789039, 0, 0, 0, 1, 1,
1.64272, 0.6564425, 2.146394, 0, 0, 0, 1, 1,
1.665208, 1.775045, 1.52733, 1, 1, 1, 1, 1,
1.672165, 0.307526, 1.543244, 1, 1, 1, 1, 1,
1.674347, 1.423645, 2.05159, 1, 1, 1, 1, 1,
1.690421, 0.4787119, 1.579532, 1, 1, 1, 1, 1,
1.691797, -1.763117, 1.201343, 1, 1, 1, 1, 1,
1.695779, -0.7077948, 2.679869, 1, 1, 1, 1, 1,
1.704783, 0.06065342, 1.341921, 1, 1, 1, 1, 1,
1.717001, 0.6383825, 3.251216, 1, 1, 1, 1, 1,
1.734708, 0.9477203, 1.765078, 1, 1, 1, 1, 1,
1.734865, 0.9678468, 0.3644455, 1, 1, 1, 1, 1,
1.736526, 1.175717, 1.762891, 1, 1, 1, 1, 1,
1.740017, -0.08233573, 1.10589, 1, 1, 1, 1, 1,
1.741769, -0.356443, -0.3088906, 1, 1, 1, 1, 1,
1.748834, -0.6237155, 3.767299, 1, 1, 1, 1, 1,
1.768414, 0.1099522, 1.834832, 1, 1, 1, 1, 1,
1.788329, -1.380966, 2.757313, 0, 0, 1, 1, 1,
1.798565, -0.5864716, 1.502038, 1, 0, 0, 1, 1,
1.819298, -0.876317, 2.079172, 1, 0, 0, 1, 1,
1.819741, 2.957847, -1.133184, 1, 0, 0, 1, 1,
1.824152, 0.4863204, 0.5379396, 1, 0, 0, 1, 1,
1.82435, -1.091943, 1.367765, 1, 0, 0, 1, 1,
1.82734, 1.24683, 0.2289501, 0, 0, 0, 1, 1,
1.828356, 0.00633495, 0.2881251, 0, 0, 0, 1, 1,
1.828821, -0.3027853, 1.394907, 0, 0, 0, 1, 1,
1.878605, 0.4029485, 2.411793, 0, 0, 0, 1, 1,
1.888644, -0.6152551, 2.58843, 0, 0, 0, 1, 1,
1.896803, 0.328573, 1.223719, 0, 0, 0, 1, 1,
1.904289, -1.619029, 1.139216, 0, 0, 0, 1, 1,
1.909386, 0.7319462, 0.6972281, 1, 1, 1, 1, 1,
1.9244, -0.3364992, 2.646481, 1, 1, 1, 1, 1,
1.925891, -0.2087613, 2.288411, 1, 1, 1, 1, 1,
1.93141, -0.7321381, 2.580025, 1, 1, 1, 1, 1,
1.934489, 0.06278498, 1.685677, 1, 1, 1, 1, 1,
1.939432, -0.7896472, 1.094599, 1, 1, 1, 1, 1,
1.963623, -1.40688, 2.466847, 1, 1, 1, 1, 1,
2.003849, 1.621862, 4.707322, 1, 1, 1, 1, 1,
2.008024, -0.6896004, 1.268828, 1, 1, 1, 1, 1,
2.019534, 0.6843363, 0.5800869, 1, 1, 1, 1, 1,
2.043681, 1.283687, -0.921092, 1, 1, 1, 1, 1,
2.046433, 1.35216, 2.256122, 1, 1, 1, 1, 1,
2.08247, -0.4334128, 2.19169, 1, 1, 1, 1, 1,
2.094212, -1.422471, 2.825968, 1, 1, 1, 1, 1,
2.206139, 1.071472, 0.5172354, 1, 1, 1, 1, 1,
2.21178, 1.385248, 0.8928491, 0, 0, 1, 1, 1,
2.217324, -0.0597487, 2.011395, 1, 0, 0, 1, 1,
2.247458, 1.518851, -0.5583868, 1, 0, 0, 1, 1,
2.263408, -1.38361, 3.161065, 1, 0, 0, 1, 1,
2.292006, -0.9022949, 1.803324, 1, 0, 0, 1, 1,
2.310472, 0.3779483, 0.4052127, 1, 0, 0, 1, 1,
2.379388, -0.4668267, 2.636635, 0, 0, 0, 1, 1,
2.407257, -0.7694924, 3.614167, 0, 0, 0, 1, 1,
2.434263, -0.7859666, 1.090193, 0, 0, 0, 1, 1,
2.477375, 1.376218, 1.463158, 0, 0, 0, 1, 1,
2.481218, -1.34085, 1.217344, 0, 0, 0, 1, 1,
2.558339, -0.3528357, -1.10842, 0, 0, 0, 1, 1,
2.584556, -0.4072319, 1.562152, 0, 0, 0, 1, 1,
2.676822, -1.33817, 3.195635, 1, 1, 1, 1, 1,
2.678758, -0.7267842, 1.785797, 1, 1, 1, 1, 1,
2.679512, -0.06153434, 0.8455147, 1, 1, 1, 1, 1,
2.902949, -0.6030661, 2.087135, 1, 1, 1, 1, 1,
3.055663, -3.442201, 2.459458, 1, 1, 1, 1, 1,
3.077464, 0.2403147, 0.7532157, 1, 1, 1, 1, 1,
3.268879, -1.411527, 1.384302, 1, 1, 1, 1, 1
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
var radius = 9.881124;
var distance = 34.70703;
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
mvMatrix.translate( 0.003034115, -0.04417682, -0.06159258 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.70703);
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
