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
-3.122443, -0.344719, -1.131685, 1, 0, 0, 1,
-2.860757, 0.1553683, 1.52457, 1, 0.007843138, 0, 1,
-2.786016, -1.143064, -1.941234, 1, 0.01176471, 0, 1,
-2.656898, 2.600831, -1.696046, 1, 0.01960784, 0, 1,
-2.656872, -0.5676104, 0.6183904, 1, 0.02352941, 0, 1,
-2.648752, -0.1770133, -1.183593, 1, 0.03137255, 0, 1,
-2.629725, 2.225744, -1.573304, 1, 0.03529412, 0, 1,
-2.500029, 0.5798233, -0.6758255, 1, 0.04313726, 0, 1,
-2.476056, -0.1853365, -1.46892, 1, 0.04705882, 0, 1,
-2.454232, -1.47721, -1.465823, 1, 0.05490196, 0, 1,
-2.437814, -0.7573603, -1.828052, 1, 0.05882353, 0, 1,
-2.422863, -0.3023511, -0.5372218, 1, 0.06666667, 0, 1,
-2.419978, 0.610392, -1.452854, 1, 0.07058824, 0, 1,
-2.419474, -0.6194876, -2.255166, 1, 0.07843138, 0, 1,
-2.169101, -1.122696, -4.107577, 1, 0.08235294, 0, 1,
-2.145082, -0.5923919, -2.212987, 1, 0.09019608, 0, 1,
-2.110742, 1.143835, -0.7838899, 1, 0.09411765, 0, 1,
-2.101541, -0.4321997, -1.120427, 1, 0.1019608, 0, 1,
-2.095788, 1.76631, -0.362464, 1, 0.1098039, 0, 1,
-2.092933, -0.6350884, -1.60031, 1, 0.1137255, 0, 1,
-2.081505, 0.6279348, -1.642472, 1, 0.1215686, 0, 1,
-2.062095, 0.1635848, -0.894008, 1, 0.1254902, 0, 1,
-2.048649, 1.176017, -1.110485, 1, 0.1333333, 0, 1,
-2.031567, -0.05006101, -1.663317, 1, 0.1372549, 0, 1,
-2.010607, 0.3394172, -0.3007534, 1, 0.145098, 0, 1,
-2.006057, -1.185741, -1.790512, 1, 0.1490196, 0, 1,
-1.996678, -0.5511719, -0.720151, 1, 0.1568628, 0, 1,
-1.981332, -0.3470401, -1.744171, 1, 0.1607843, 0, 1,
-1.978647, -1.126344, -3.296705, 1, 0.1686275, 0, 1,
-1.971955, -0.7349749, -2.19342, 1, 0.172549, 0, 1,
-1.953069, -0.5350901, -1.9879, 1, 0.1803922, 0, 1,
-1.935378, 0.3695591, -0.9807848, 1, 0.1843137, 0, 1,
-1.933532, 0.8569506, -0.297446, 1, 0.1921569, 0, 1,
-1.930696, 1.250667, 0.3855375, 1, 0.1960784, 0, 1,
-1.904658, -0.8332223, -3.047827, 1, 0.2039216, 0, 1,
-1.90153, -0.3524763, -2.031616, 1, 0.2117647, 0, 1,
-1.85828, -0.3227905, -2.045043, 1, 0.2156863, 0, 1,
-1.858055, 0.07306282, -0.5206696, 1, 0.2235294, 0, 1,
-1.852738, 1.360641, -0.7245043, 1, 0.227451, 0, 1,
-1.84238, 0.7123743, -1.030351, 1, 0.2352941, 0, 1,
-1.801821, 0.09144464, -1.702658, 1, 0.2392157, 0, 1,
-1.79951, -0.6627447, -0.8612845, 1, 0.2470588, 0, 1,
-1.78046, 1.637383, -0.7911233, 1, 0.2509804, 0, 1,
-1.77638, -1.350291, -1.717579, 1, 0.2588235, 0, 1,
-1.736393, 0.4268997, -0.2673568, 1, 0.2627451, 0, 1,
-1.723374, 1.489825, 0.3647048, 1, 0.2705882, 0, 1,
-1.718882, 0.1176625, -0.6454292, 1, 0.2745098, 0, 1,
-1.716571, 0.2227219, -1.275984, 1, 0.282353, 0, 1,
-1.708951, -0.826546, -1.122118, 1, 0.2862745, 0, 1,
-1.69965, -0.7578534, -0.5537987, 1, 0.2941177, 0, 1,
-1.697428, 0.05926853, -2.796851, 1, 0.3019608, 0, 1,
-1.683298, 2.09929, -0.9087447, 1, 0.3058824, 0, 1,
-1.639827, 1.253652, -1.817729, 1, 0.3137255, 0, 1,
-1.61006, 0.1602444, -2.652689, 1, 0.3176471, 0, 1,
-1.60476, 1.034952, -1.590287, 1, 0.3254902, 0, 1,
-1.597355, -0.5140975, -1.273919, 1, 0.3294118, 0, 1,
-1.595022, -0.1528075, -1.468826, 1, 0.3372549, 0, 1,
-1.591933, -0.6348881, -3.08654, 1, 0.3411765, 0, 1,
-1.585646, 1.621886, -0.4694194, 1, 0.3490196, 0, 1,
-1.571373, 0.2422389, -1.651592, 1, 0.3529412, 0, 1,
-1.562985, 0.4548352, -0.9190769, 1, 0.3607843, 0, 1,
-1.560112, 0.710453, 0.8544316, 1, 0.3647059, 0, 1,
-1.551781, -0.9928583, -2.235808, 1, 0.372549, 0, 1,
-1.544783, -0.211525, -1.780806, 1, 0.3764706, 0, 1,
-1.543745, -0.09177786, -1.056457, 1, 0.3843137, 0, 1,
-1.540597, -0.1947782, -0.5673335, 1, 0.3882353, 0, 1,
-1.536549, 0.4424307, 0.5329002, 1, 0.3960784, 0, 1,
-1.527448, 2.355493, 0.2657065, 1, 0.4039216, 0, 1,
-1.527192, 1.839793, -1.871863, 1, 0.4078431, 0, 1,
-1.525375, -0.07906319, -0.8610398, 1, 0.4156863, 0, 1,
-1.51135, 0.5996925, -1.684203, 1, 0.4196078, 0, 1,
-1.510713, -0.5281463, -0.4206032, 1, 0.427451, 0, 1,
-1.498468, 1.085808, -0.8565447, 1, 0.4313726, 0, 1,
-1.495115, -1.209143, -1.171457, 1, 0.4392157, 0, 1,
-1.490909, -0.03124326, -1.159709, 1, 0.4431373, 0, 1,
-1.489727, 0.2502161, -0.86024, 1, 0.4509804, 0, 1,
-1.477335, -0.9120079, -3.514437, 1, 0.454902, 0, 1,
-1.473237, 0.5696758, -2.01321, 1, 0.4627451, 0, 1,
-1.46559, -0.07018045, 0.2609973, 1, 0.4666667, 0, 1,
-1.46296, -2.257337, -3.166819, 1, 0.4745098, 0, 1,
-1.444409, -0.7538014, -1.48733, 1, 0.4784314, 0, 1,
-1.44115, 0.485306, -1.054376, 1, 0.4862745, 0, 1,
-1.441076, 0.8984727, 0.6243829, 1, 0.4901961, 0, 1,
-1.44102, -1.421822, -1.830847, 1, 0.4980392, 0, 1,
-1.415297, -1.168693, -2.624633, 1, 0.5058824, 0, 1,
-1.412174, -0.4589109, -1.997252, 1, 0.509804, 0, 1,
-1.410413, 0.9817502, -1.716695, 1, 0.5176471, 0, 1,
-1.402641, -1.229034, -2.577754, 1, 0.5215687, 0, 1,
-1.402353, -0.6509352, -1.095277, 1, 0.5294118, 0, 1,
-1.397885, -0.8486973, -1.199474, 1, 0.5333334, 0, 1,
-1.390323, -1.320325, -2.649054, 1, 0.5411765, 0, 1,
-1.390114, 0.0830562, -0.9310188, 1, 0.5450981, 0, 1,
-1.37709, -0.411239, -1.852456, 1, 0.5529412, 0, 1,
-1.376958, 0.6018654, -1.785532, 1, 0.5568628, 0, 1,
-1.376708, -0.5801055, -3.840617, 1, 0.5647059, 0, 1,
-1.369818, 0.09393475, 0.2812238, 1, 0.5686275, 0, 1,
-1.366798, 1.055567, -1.280017, 1, 0.5764706, 0, 1,
-1.366275, -0.9625313, 0.4095792, 1, 0.5803922, 0, 1,
-1.357223, -1.905637, -2.998497, 1, 0.5882353, 0, 1,
-1.356024, -2.004548, -1.552956, 1, 0.5921569, 0, 1,
-1.353088, 1.255565, -1.946836, 1, 0.6, 0, 1,
-1.327973, -0.1045576, -0.806412, 1, 0.6078432, 0, 1,
-1.312479, 1.277718, -3.042909, 1, 0.6117647, 0, 1,
-1.300844, -0.4938619, -1.701713, 1, 0.6196079, 0, 1,
-1.29783, -0.3210302, -2.104864, 1, 0.6235294, 0, 1,
-1.297092, -0.765721, -1.527698, 1, 0.6313726, 0, 1,
-1.293733, 1.10509, -2.528699, 1, 0.6352941, 0, 1,
-1.291987, -0.4056168, -3.203755, 1, 0.6431373, 0, 1,
-1.291748, 1.050276, -1.918227, 1, 0.6470588, 0, 1,
-1.282608, -0.2915975, -0.7549768, 1, 0.654902, 0, 1,
-1.263349, 0.426404, -0.9799232, 1, 0.6588235, 0, 1,
-1.257798, -1.001014, -1.678924, 1, 0.6666667, 0, 1,
-1.251694, 1.913833, 0.2423644, 1, 0.6705883, 0, 1,
-1.251178, -1.008865, -1.153666, 1, 0.6784314, 0, 1,
-1.243384, 0.3547772, -1.367922, 1, 0.682353, 0, 1,
-1.236184, -0.3993132, -2.112602, 1, 0.6901961, 0, 1,
-1.21568, 1.086117, -1.770648, 1, 0.6941177, 0, 1,
-1.213017, 0.1321678, -2.258901, 1, 0.7019608, 0, 1,
-1.186681, 1.381749, -1.711086, 1, 0.7098039, 0, 1,
-1.181106, 0.2907844, -2.445884, 1, 0.7137255, 0, 1,
-1.176806, -1.235767, -2.853403, 1, 0.7215686, 0, 1,
-1.168487, -0.8308339, -1.64975, 1, 0.7254902, 0, 1,
-1.167757, 0.9555193, -1.571944, 1, 0.7333333, 0, 1,
-1.161452, -0.3918412, -1.301037, 1, 0.7372549, 0, 1,
-1.157118, 1.401975, -1.684112, 1, 0.7450981, 0, 1,
-1.155205, -0.8332993, -2.695113, 1, 0.7490196, 0, 1,
-1.153899, -0.5821618, -1.770152, 1, 0.7568628, 0, 1,
-1.151933, 0.05357167, -2.91939, 1, 0.7607843, 0, 1,
-1.15087, 0.2318065, -0.127046, 1, 0.7686275, 0, 1,
-1.149343, 1.540303, 0.2990054, 1, 0.772549, 0, 1,
-1.14798, -1.08315, -1.66426, 1, 0.7803922, 0, 1,
-1.134361, -1.432272, -3.225547, 1, 0.7843137, 0, 1,
-1.132766, -0.7183902, -1.438786, 1, 0.7921569, 0, 1,
-1.128059, -1.650704, -3.095554, 1, 0.7960784, 0, 1,
-1.123149, 0.6578354, -1.414606, 1, 0.8039216, 0, 1,
-1.118894, 1.069758, 0.06612358, 1, 0.8117647, 0, 1,
-1.118414, -0.01742813, -3.582284, 1, 0.8156863, 0, 1,
-1.115946, -0.3205985, -2.646581, 1, 0.8235294, 0, 1,
-1.115406, -0.9080182, -2.434022, 1, 0.827451, 0, 1,
-1.112688, -0.3297977, -2.944958, 1, 0.8352941, 0, 1,
-1.112245, -0.6166288, -1.863352, 1, 0.8392157, 0, 1,
-1.111404, -0.1370612, -1.756652, 1, 0.8470588, 0, 1,
-1.084736, 0.1677374, -1.98865, 1, 0.8509804, 0, 1,
-1.080142, -0.1283456, -3.025032, 1, 0.8588235, 0, 1,
-1.077441, -0.2627281, -2.394014, 1, 0.8627451, 0, 1,
-1.067677, 0.2463962, -1.344879, 1, 0.8705882, 0, 1,
-1.06686, 0.4915994, 0.08449859, 1, 0.8745098, 0, 1,
-1.062416, -0.6671978, -1.680799, 1, 0.8823529, 0, 1,
-1.059085, 0.7453549, -1.723552, 1, 0.8862745, 0, 1,
-1.054118, 2.328592, -1.273788, 1, 0.8941177, 0, 1,
-1.049874, 0.9985331, -2.686316, 1, 0.8980392, 0, 1,
-1.043696, 1.382279, -1.244812, 1, 0.9058824, 0, 1,
-1.043672, -1.378541, -3.804465, 1, 0.9137255, 0, 1,
-1.032971, -1.260727, -4.460219, 1, 0.9176471, 0, 1,
-1.031886, 1.81617, 0.7123618, 1, 0.9254902, 0, 1,
-1.021362, -1.054654, 0.1961802, 1, 0.9294118, 0, 1,
-1.02038, -0.2386099, -2.795048, 1, 0.9372549, 0, 1,
-1.015895, 0.2751169, -3.577092, 1, 0.9411765, 0, 1,
-1.012991, 1.299029, 0.8128801, 1, 0.9490196, 0, 1,
-1.012696, -0.03296583, -3.410493, 1, 0.9529412, 0, 1,
-1.008371, 0.3152629, -0.1350227, 1, 0.9607843, 0, 1,
-1.007113, 0.3502831, -0.0287366, 1, 0.9647059, 0, 1,
-0.9989533, 0.6155329, -0.7777174, 1, 0.972549, 0, 1,
-0.9974593, -0.9752833, -1.741834, 1, 0.9764706, 0, 1,
-0.996924, -0.6389554, -1.9591, 1, 0.9843137, 0, 1,
-0.9962559, 0.9567558, -1.447864, 1, 0.9882353, 0, 1,
-0.9902105, 0.9469156, -0.5880234, 1, 0.9960784, 0, 1,
-0.9846565, -2.59115, -2.165502, 0.9960784, 1, 0, 1,
-0.9829766, 0.4175766, -1.74221, 0.9921569, 1, 0, 1,
-0.9778847, 0.8528007, 0.378875, 0.9843137, 1, 0, 1,
-0.9735089, -0.4887789, -3.260462, 0.9803922, 1, 0, 1,
-0.9653102, 0.5681169, -1.885384, 0.972549, 1, 0, 1,
-0.9631771, -0.6703969, -2.153449, 0.9686275, 1, 0, 1,
-0.9625582, 0.4562162, 0.8001462, 0.9607843, 1, 0, 1,
-0.9618769, 0.4777179, -0.5611588, 0.9568627, 1, 0, 1,
-0.9568433, -0.810815, -2.560019, 0.9490196, 1, 0, 1,
-0.955981, 0.3754299, -0.9008991, 0.945098, 1, 0, 1,
-0.955291, -0.4111296, -2.884417, 0.9372549, 1, 0, 1,
-0.9527125, -1.23691, -3.284222, 0.9333333, 1, 0, 1,
-0.9459084, 0.9147319, -0.2365422, 0.9254902, 1, 0, 1,
-0.9458196, -1.061911, -3.457025, 0.9215686, 1, 0, 1,
-0.9399502, -0.3962649, -1.96087, 0.9137255, 1, 0, 1,
-0.9374464, 1.956418, -1.372256, 0.9098039, 1, 0, 1,
-0.9356582, 0.2597771, -0.722912, 0.9019608, 1, 0, 1,
-0.9308079, -1.010093, -1.427909, 0.8941177, 1, 0, 1,
-0.9302281, -1.029352, -2.08842, 0.8901961, 1, 0, 1,
-0.929566, 0.4322926, -1.770068, 0.8823529, 1, 0, 1,
-0.9288207, 0.9250444, -1.522911, 0.8784314, 1, 0, 1,
-0.9147429, -0.01991134, -2.931127, 0.8705882, 1, 0, 1,
-0.9128057, 1.663118, -0.2704484, 0.8666667, 1, 0, 1,
-0.9124038, 0.0398303, -2.778748, 0.8588235, 1, 0, 1,
-0.9068763, -0.470468, -1.011986, 0.854902, 1, 0, 1,
-0.9061571, 0.3813347, -0.491096, 0.8470588, 1, 0, 1,
-0.9049859, 1.116114, 0.02735089, 0.8431373, 1, 0, 1,
-0.9037003, -0.08780956, -0.4226327, 0.8352941, 1, 0, 1,
-0.8899153, -0.897787, -1.075729, 0.8313726, 1, 0, 1,
-0.8783016, 1.875417, 0.5857395, 0.8235294, 1, 0, 1,
-0.8731715, -0.4840487, -0.8973241, 0.8196079, 1, 0, 1,
-0.863566, 1.61123, 0.7849998, 0.8117647, 1, 0, 1,
-0.8635451, 0.7347411, -0.4588553, 0.8078431, 1, 0, 1,
-0.8621902, 0.706793, -0.3277273, 0.8, 1, 0, 1,
-0.8607849, 0.0588752, -2.445889, 0.7921569, 1, 0, 1,
-0.8604124, -1.105636, -3.309038, 0.7882353, 1, 0, 1,
-0.8601313, -1.016326, -2.985275, 0.7803922, 1, 0, 1,
-0.8594172, -0.2303248, 0.03744363, 0.7764706, 1, 0, 1,
-0.8558241, 0.634624, -2.333138, 0.7686275, 1, 0, 1,
-0.8411066, -1.141597, -2.231665, 0.7647059, 1, 0, 1,
-0.8335834, 0.1724743, -1.126879, 0.7568628, 1, 0, 1,
-0.8300502, -1.461334, -3.37075, 0.7529412, 1, 0, 1,
-0.8284355, 0.5725979, -1.93672, 0.7450981, 1, 0, 1,
-0.8081649, 0.3276948, -1.824682, 0.7411765, 1, 0, 1,
-0.7963603, 0.5266718, -1.150806, 0.7333333, 1, 0, 1,
-0.7959803, 0.7407147, -0.003436737, 0.7294118, 1, 0, 1,
-0.794868, 1.108218, -0.4141429, 0.7215686, 1, 0, 1,
-0.7936877, -0.2412898, -1.296806, 0.7176471, 1, 0, 1,
-0.793219, 0.1005178, -2.627186, 0.7098039, 1, 0, 1,
-0.7911306, -1.05291, -4.457011, 0.7058824, 1, 0, 1,
-0.7861801, 0.5574334, -0.6587319, 0.6980392, 1, 0, 1,
-0.7848678, 0.01992137, -2.634605, 0.6901961, 1, 0, 1,
-0.782027, -2.819928, -1.886358, 0.6862745, 1, 0, 1,
-0.7782886, 0.5044196, 1.615964, 0.6784314, 1, 0, 1,
-0.7746651, 0.4287847, -0.1078667, 0.6745098, 1, 0, 1,
-0.7740634, 0.4598593, -0.9947046, 0.6666667, 1, 0, 1,
-0.7694904, -0.2130503, -1.129004, 0.6627451, 1, 0, 1,
-0.7637668, 0.611222, 0.4842471, 0.654902, 1, 0, 1,
-0.762465, -0.1950096, -0.8423087, 0.6509804, 1, 0, 1,
-0.7610239, 1.182514, -0.4517161, 0.6431373, 1, 0, 1,
-0.7541922, 0.1561867, -2.541729, 0.6392157, 1, 0, 1,
-0.7517596, -0.3820898, -1.362135, 0.6313726, 1, 0, 1,
-0.7506045, 0.2776147, -2.167313, 0.627451, 1, 0, 1,
-0.750401, -0.4669078, -1.829935, 0.6196079, 1, 0, 1,
-0.747372, 0.2242246, -0.02708879, 0.6156863, 1, 0, 1,
-0.7465272, -0.2071015, -1.9061, 0.6078432, 1, 0, 1,
-0.741549, -1.079269, -1.739862, 0.6039216, 1, 0, 1,
-0.7336627, 0.2660478, -0.708128, 0.5960785, 1, 0, 1,
-0.7251557, 0.3540929, -2.438634, 0.5882353, 1, 0, 1,
-0.7180762, -1.202952, -2.127758, 0.5843138, 1, 0, 1,
-0.7121923, -0.0697762, -1.742782, 0.5764706, 1, 0, 1,
-0.7110611, -1.529822, -1.937959, 0.572549, 1, 0, 1,
-0.7110326, 1.319466, -2.235758, 0.5647059, 1, 0, 1,
-0.7014446, -0.4831975, -1.216735, 0.5607843, 1, 0, 1,
-0.6941347, -0.2270038, -0.7770401, 0.5529412, 1, 0, 1,
-0.6937729, -0.8576834, -2.502334, 0.5490196, 1, 0, 1,
-0.6887869, 1.108757, -1.151201, 0.5411765, 1, 0, 1,
-0.6866248, 0.4942649, -1.405828, 0.5372549, 1, 0, 1,
-0.6849453, -0.2678691, -0.9252053, 0.5294118, 1, 0, 1,
-0.6766182, 1.381101, -0.4351987, 0.5254902, 1, 0, 1,
-0.6762193, 1.129124, -0.7748492, 0.5176471, 1, 0, 1,
-0.664091, 0.8124985, -1.118015, 0.5137255, 1, 0, 1,
-0.6640591, 0.2041191, -2.271699, 0.5058824, 1, 0, 1,
-0.6637849, 0.5388409, -0.7478644, 0.5019608, 1, 0, 1,
-0.6594877, 0.4506774, -1.250209, 0.4941176, 1, 0, 1,
-0.6590419, -0.2473574, -2.743627, 0.4862745, 1, 0, 1,
-0.6581891, -0.7641956, -2.343895, 0.4823529, 1, 0, 1,
-0.6529199, 0.04679153, -2.976784, 0.4745098, 1, 0, 1,
-0.6527144, -1.067229, -3.635422, 0.4705882, 1, 0, 1,
-0.6520101, 1.163398, -0.03596652, 0.4627451, 1, 0, 1,
-0.6518836, 0.7067148, -0.7276789, 0.4588235, 1, 0, 1,
-0.6508272, 0.2117119, -3.084567, 0.4509804, 1, 0, 1,
-0.6496668, -0.4521542, -1.387388, 0.4470588, 1, 0, 1,
-0.6482048, -0.3512131, -0.7984449, 0.4392157, 1, 0, 1,
-0.6479644, 0.7087208, -1.176296, 0.4352941, 1, 0, 1,
-0.644459, -1.303676, -1.809022, 0.427451, 1, 0, 1,
-0.6398041, -1.08365, -1.860702, 0.4235294, 1, 0, 1,
-0.6318266, 0.7753742, -1.48405, 0.4156863, 1, 0, 1,
-0.6306335, -0.9321843, -3.693651, 0.4117647, 1, 0, 1,
-0.6288353, 0.2043894, -2.790347, 0.4039216, 1, 0, 1,
-0.6265975, -0.6125295, -3.59238, 0.3960784, 1, 0, 1,
-0.6243328, 0.8953268, 0.1498615, 0.3921569, 1, 0, 1,
-0.6209334, 0.4033689, 0.02412345, 0.3843137, 1, 0, 1,
-0.6200113, -0.9809468, -1.734443, 0.3803922, 1, 0, 1,
-0.6189159, 0.8271575, -0.09325816, 0.372549, 1, 0, 1,
-0.6149771, 0.001019167, -2.103223, 0.3686275, 1, 0, 1,
-0.6099089, -2.019457, -0.8423984, 0.3607843, 1, 0, 1,
-0.606767, 0.7735472, -2.262498, 0.3568628, 1, 0, 1,
-0.606674, -0.3353075, -2.877918, 0.3490196, 1, 0, 1,
-0.606473, -0.4550892, -1.503227, 0.345098, 1, 0, 1,
-0.5925205, -1.676009, -2.230432, 0.3372549, 1, 0, 1,
-0.5911693, -0.04438956, 0.3900178, 0.3333333, 1, 0, 1,
-0.5907027, -0.7378054, -1.659366, 0.3254902, 1, 0, 1,
-0.5905129, 0.7355144, -0.6336424, 0.3215686, 1, 0, 1,
-0.5904506, 0.9718413, -1.631763, 0.3137255, 1, 0, 1,
-0.5899894, -0.8350153, -3.496637, 0.3098039, 1, 0, 1,
-0.5889563, 0.5546932, -1.770711, 0.3019608, 1, 0, 1,
-0.5864778, 0.1693922, -2.28746, 0.2941177, 1, 0, 1,
-0.5732852, 2.286003, 0.4883324, 0.2901961, 1, 0, 1,
-0.571928, 0.1477136, -0.07726707, 0.282353, 1, 0, 1,
-0.5579272, 0.5090925, -0.31968, 0.2784314, 1, 0, 1,
-0.5549951, 1.322508, -2.038066, 0.2705882, 1, 0, 1,
-0.5504633, -0.417557, -1.213447, 0.2666667, 1, 0, 1,
-0.5478367, -1.011715, -2.855241, 0.2588235, 1, 0, 1,
-0.5398101, 0.30365, -0.006282371, 0.254902, 1, 0, 1,
-0.5393947, -0.5383633, -3.592597, 0.2470588, 1, 0, 1,
-0.5386435, 1.32359, 0.8364738, 0.2431373, 1, 0, 1,
-0.5373147, -1.374581, -0.8078101, 0.2352941, 1, 0, 1,
-0.537088, 1.329484, -1.100638, 0.2313726, 1, 0, 1,
-0.5332455, -1.471383, -1.754391, 0.2235294, 1, 0, 1,
-0.532884, 0.1226201, -0.3283053, 0.2196078, 1, 0, 1,
-0.5301868, -0.765417, -0.691027, 0.2117647, 1, 0, 1,
-0.5283214, -1.740277, -4.518186, 0.2078431, 1, 0, 1,
-0.5275008, -1.830544, -3.24906, 0.2, 1, 0, 1,
-0.5268334, 1.183038, -0.2390829, 0.1921569, 1, 0, 1,
-0.5252751, -0.4205653, -1.877517, 0.1882353, 1, 0, 1,
-0.5200185, 0.3944164, -1.994025, 0.1803922, 1, 0, 1,
-0.5179976, 0.6473171, -2.422316, 0.1764706, 1, 0, 1,
-0.5174675, 0.2367209, -1.297191, 0.1686275, 1, 0, 1,
-0.5161825, -0.3540967, -1.04896, 0.1647059, 1, 0, 1,
-0.5145733, 0.07923689, -1.925652, 0.1568628, 1, 0, 1,
-0.5136438, 2.492219, -0.3552698, 0.1529412, 1, 0, 1,
-0.510503, -1.026272, -1.889673, 0.145098, 1, 0, 1,
-0.5104336, -0.4591253, -1.473727, 0.1411765, 1, 0, 1,
-0.5088331, -0.8160738, -1.267488, 0.1333333, 1, 0, 1,
-0.5033386, 0.3996656, -3.353504, 0.1294118, 1, 0, 1,
-0.5021709, 0.2512049, 0.353196, 0.1215686, 1, 0, 1,
-0.5013602, 0.1788994, -1.904724, 0.1176471, 1, 0, 1,
-0.4811068, -1.183571, -2.485561, 0.1098039, 1, 0, 1,
-0.4796346, 0.7877184, -1.103829, 0.1058824, 1, 0, 1,
-0.4772561, 0.2534519, 0.3354832, 0.09803922, 1, 0, 1,
-0.4771458, 0.5390798, -0.006912086, 0.09019608, 1, 0, 1,
-0.4648418, -0.1329444, -0.6406815, 0.08627451, 1, 0, 1,
-0.463834, -0.4321478, -4.051817, 0.07843138, 1, 0, 1,
-0.4612448, 1.456458, -1.754634, 0.07450981, 1, 0, 1,
-0.4610984, -0.09388103, -2.66725, 0.06666667, 1, 0, 1,
-0.4552413, -0.1135998, -3.060744, 0.0627451, 1, 0, 1,
-0.4543089, -0.5037, -2.638012, 0.05490196, 1, 0, 1,
-0.4520953, -0.3870374, -1.629217, 0.05098039, 1, 0, 1,
-0.4506681, 0.3056084, -2.602756, 0.04313726, 1, 0, 1,
-0.446082, -0.8026525, -2.901681, 0.03921569, 1, 0, 1,
-0.442368, -1.139498, -3.24255, 0.03137255, 1, 0, 1,
-0.4371412, 0.4162725, 0.5208619, 0.02745098, 1, 0, 1,
-0.4293117, -0.8286831, -1.934081, 0.01960784, 1, 0, 1,
-0.4235602, -0.6976883, -3.132292, 0.01568628, 1, 0, 1,
-0.4222482, -0.5446873, -0.9001464, 0.007843138, 1, 0, 1,
-0.4208874, -1.371753, -2.533235, 0.003921569, 1, 0, 1,
-0.4201215, 0.547618, -0.8280469, 0, 1, 0.003921569, 1,
-0.4198885, 0.299332, -1.155409, 0, 1, 0.01176471, 1,
-0.4194708, 0.4315277, -1.3984, 0, 1, 0.01568628, 1,
-0.4081693, -1.052061, -1.698735, 0, 1, 0.02352941, 1,
-0.4073884, 1.049003, -2.030366, 0, 1, 0.02745098, 1,
-0.4032059, 0.4312979, -0.3001533, 0, 1, 0.03529412, 1,
-0.3965687, 1.262414, -2.405382, 0, 1, 0.03921569, 1,
-0.3927617, -2.197805, -3.925275, 0, 1, 0.04705882, 1,
-0.3923256, 0.1584711, -0.6384799, 0, 1, 0.05098039, 1,
-0.3891479, -0.7092669, -3.001048, 0, 1, 0.05882353, 1,
-0.3837057, -0.627954, -2.715198, 0, 1, 0.0627451, 1,
-0.3793312, 1.213594, -0.4775974, 0, 1, 0.07058824, 1,
-0.3776374, -0.725472, -2.675943, 0, 1, 0.07450981, 1,
-0.3774262, 0.3661612, 0.08564182, 0, 1, 0.08235294, 1,
-0.3713558, 0.7916778, 0.1479131, 0, 1, 0.08627451, 1,
-0.3687966, 0.8239378, 0.7027067, 0, 1, 0.09411765, 1,
-0.3686539, 0.723604, -2.159688, 0, 1, 0.1019608, 1,
-0.3669933, 0.402622, -0.3458126, 0, 1, 0.1058824, 1,
-0.3656006, -0.4683341, -2.245101, 0, 1, 0.1137255, 1,
-0.364732, -2.274552, -0.9718375, 0, 1, 0.1176471, 1,
-0.3636029, 0.2691493, -1.749747, 0, 1, 0.1254902, 1,
-0.3634895, 0.01696259, -1.830296, 0, 1, 0.1294118, 1,
-0.3623289, -0.04522954, -2.265301, 0, 1, 0.1372549, 1,
-0.3610835, -1.764117, -4.205904, 0, 1, 0.1411765, 1,
-0.3587903, 0.3934849, -0.6900635, 0, 1, 0.1490196, 1,
-0.358069, 0.4496526, -0.5564676, 0, 1, 0.1529412, 1,
-0.3568712, 0.06284134, -2.518995, 0, 1, 0.1607843, 1,
-0.356046, 2.489727, -0.2666582, 0, 1, 0.1647059, 1,
-0.3546434, -0.56969, -2.177215, 0, 1, 0.172549, 1,
-0.3503121, -2.025315, -3.415191, 0, 1, 0.1764706, 1,
-0.3455773, -1.245219, -3.085675, 0, 1, 0.1843137, 1,
-0.3370696, 0.693805, -2.309067, 0, 1, 0.1882353, 1,
-0.3298399, 0.1350309, 0.04987102, 0, 1, 0.1960784, 1,
-0.3279611, 0.5625809, -1.171946, 0, 1, 0.2039216, 1,
-0.3258007, -0.303152, -3.055503, 0, 1, 0.2078431, 1,
-0.3234301, -0.09865671, -2.230524, 0, 1, 0.2156863, 1,
-0.3231149, 0.2646607, -0.5896512, 0, 1, 0.2196078, 1,
-0.3219175, 0.004649657, -1.121094, 0, 1, 0.227451, 1,
-0.3178911, 0.4910735, -1.086057, 0, 1, 0.2313726, 1,
-0.3152961, -0.2710244, -1.604027, 0, 1, 0.2392157, 1,
-0.3137001, 0.1698885, -3.555783, 0, 1, 0.2431373, 1,
-0.3128029, -0.1742553, -3.422913, 0, 1, 0.2509804, 1,
-0.3126484, 0.8620403, -1.468286, 0, 1, 0.254902, 1,
-0.3126443, -0.6860983, -0.4066341, 0, 1, 0.2627451, 1,
-0.3125523, -0.8481983, -0.1677776, 0, 1, 0.2666667, 1,
-0.304272, -0.960447, -2.362154, 0, 1, 0.2745098, 1,
-0.301641, -0.1390015, -2.241374, 0, 1, 0.2784314, 1,
-0.3011814, 2.359007, -1.128253, 0, 1, 0.2862745, 1,
-0.2963135, 0.9458256, 0.5527388, 0, 1, 0.2901961, 1,
-0.2950681, 0.04566847, -2.570774, 0, 1, 0.2980392, 1,
-0.287979, -0.5710555, -2.464591, 0, 1, 0.3058824, 1,
-0.2819332, 0.1025508, -1.094882, 0, 1, 0.3098039, 1,
-0.2785169, -0.5496365, -2.303316, 0, 1, 0.3176471, 1,
-0.2778606, -0.01288917, -2.53905, 0, 1, 0.3215686, 1,
-0.2761394, 0.4608728, -0.2927034, 0, 1, 0.3294118, 1,
-0.2753199, 0.4827273, 0.5877322, 0, 1, 0.3333333, 1,
-0.2745639, 0.9013414, -0.3198903, 0, 1, 0.3411765, 1,
-0.2733802, 1.425921, -1.343015, 0, 1, 0.345098, 1,
-0.2725106, -0.9249819, -2.063662, 0, 1, 0.3529412, 1,
-0.2704376, -0.9744443, -1.018973, 0, 1, 0.3568628, 1,
-0.2693261, -0.8159136, -2.399201, 0, 1, 0.3647059, 1,
-0.2676934, 0.5306073, -0.164997, 0, 1, 0.3686275, 1,
-0.2673553, 1.404124, 1.906454, 0, 1, 0.3764706, 1,
-0.2617437, 0.2295164, -0.7536289, 0, 1, 0.3803922, 1,
-0.2606634, 0.6479379, 0.9767507, 0, 1, 0.3882353, 1,
-0.2579283, -0.3816578, -2.436599, 0, 1, 0.3921569, 1,
-0.2573572, 0.5872157, -1.944483, 0, 1, 0.4, 1,
-0.2494947, -1.856281, -3.209474, 0, 1, 0.4078431, 1,
-0.2484898, 0.8873084, -0.8750179, 0, 1, 0.4117647, 1,
-0.2475968, -0.3274953, -2.813422, 0, 1, 0.4196078, 1,
-0.2474654, 0.4244103, -0.4541906, 0, 1, 0.4235294, 1,
-0.2454655, 0.4068786, -0.5377872, 0, 1, 0.4313726, 1,
-0.2451222, 0.2564511, -1.289332, 0, 1, 0.4352941, 1,
-0.2408943, 0.6341889, -1.468325, 0, 1, 0.4431373, 1,
-0.2395181, -0.284262, -3.444906, 0, 1, 0.4470588, 1,
-0.2348326, 0.379738, 0.251011, 0, 1, 0.454902, 1,
-0.234798, -0.4650108, -2.805933, 0, 1, 0.4588235, 1,
-0.2345938, -0.901018, -2.746709, 0, 1, 0.4666667, 1,
-0.2324303, -0.4421179, -2.248497, 0, 1, 0.4705882, 1,
-0.2172986, 0.2583597, -0.9241419, 0, 1, 0.4784314, 1,
-0.2141733, -2.492961, -3.476682, 0, 1, 0.4823529, 1,
-0.2134082, 1.928212, -0.1808088, 0, 1, 0.4901961, 1,
-0.2130481, 0.6862693, -1.002823, 0, 1, 0.4941176, 1,
-0.210599, -0.6476704, -1.594464, 0, 1, 0.5019608, 1,
-0.2052311, -2.574492, -4.136757, 0, 1, 0.509804, 1,
-0.2043343, -0.9233521, -3.623295, 0, 1, 0.5137255, 1,
-0.2036726, -0.6455963, -3.896811, 0, 1, 0.5215687, 1,
-0.2017573, -0.8980417, -2.056167, 0, 1, 0.5254902, 1,
-0.1984889, 0.365482, -0.9633166, 0, 1, 0.5333334, 1,
-0.1982227, 1.182443, -1.244071, 0, 1, 0.5372549, 1,
-0.1973798, 2.041573, 0.3245158, 0, 1, 0.5450981, 1,
-0.1970763, 0.6116233, 1.094684, 0, 1, 0.5490196, 1,
-0.1961313, -0.9879678, -3.595894, 0, 1, 0.5568628, 1,
-0.1957591, 1.261178, -2.446661, 0, 1, 0.5607843, 1,
-0.1945606, 0.2961836, -0.6367877, 0, 1, 0.5686275, 1,
-0.1932674, -0.134648, -2.003074, 0, 1, 0.572549, 1,
-0.1777584, 1.603271, -1.307989, 0, 1, 0.5803922, 1,
-0.1774764, -1.030588, -4.374149, 0, 1, 0.5843138, 1,
-0.173496, -0.9605183, -4.187847, 0, 1, 0.5921569, 1,
-0.1652462, 0.1466005, -0.9540361, 0, 1, 0.5960785, 1,
-0.1605387, 0.8401914, -0.004145032, 0, 1, 0.6039216, 1,
-0.1573535, 0.1501832, 0.7011755, 0, 1, 0.6117647, 1,
-0.1554112, -1.494299, -2.562212, 0, 1, 0.6156863, 1,
-0.1540836, 0.8543487, 0.9857852, 0, 1, 0.6235294, 1,
-0.1488135, 1.381244, -0.5033959, 0, 1, 0.627451, 1,
-0.1440064, 0.665782, -0.4333865, 0, 1, 0.6352941, 1,
-0.1409982, -1.596449, -1.554909, 0, 1, 0.6392157, 1,
-0.1403432, -0.4201558, -2.807014, 0, 1, 0.6470588, 1,
-0.1396343, -0.6999743, -0.6924673, 0, 1, 0.6509804, 1,
-0.1389428, -0.5280753, -2.850405, 0, 1, 0.6588235, 1,
-0.1301355, 0.1440325, -1.041755, 0, 1, 0.6627451, 1,
-0.1262108, -0.857857, -3.09436, 0, 1, 0.6705883, 1,
-0.1223303, -0.3499292, -3.54595, 0, 1, 0.6745098, 1,
-0.1216792, 2.001525, 1.948768, 0, 1, 0.682353, 1,
-0.1208269, -0.2183066, -4.579043, 0, 1, 0.6862745, 1,
-0.1193334, -0.343451, -2.475114, 0, 1, 0.6941177, 1,
-0.118746, -2.085625, -4.308716, 0, 1, 0.7019608, 1,
-0.1062228, 0.2639315, -0.8072705, 0, 1, 0.7058824, 1,
-0.1060173, -1.234365, -2.993415, 0, 1, 0.7137255, 1,
-0.1054305, -0.05513392, -0.8306876, 0, 1, 0.7176471, 1,
-0.1033492, 0.01570596, 1.109228, 0, 1, 0.7254902, 1,
-0.09631759, 0.2615539, -2.265979, 0, 1, 0.7294118, 1,
-0.0963065, 0.5246322, 0.3573253, 0, 1, 0.7372549, 1,
-0.09323202, 0.03951323, 0.5887703, 0, 1, 0.7411765, 1,
-0.08897406, -0.2780255, -3.954592, 0, 1, 0.7490196, 1,
-0.08863971, 0.2887986, -0.6405166, 0, 1, 0.7529412, 1,
-0.08804706, 0.03991961, -1.047465, 0, 1, 0.7607843, 1,
-0.08724528, 1.58893, 0.4203872, 0, 1, 0.7647059, 1,
-0.08693976, -0.5230238, -2.802706, 0, 1, 0.772549, 1,
-0.08668859, 0.6040903, -1.937508, 0, 1, 0.7764706, 1,
-0.07974775, -0.8627375, -3.724097, 0, 1, 0.7843137, 1,
-0.07740699, -0.8573577, -3.515417, 0, 1, 0.7882353, 1,
-0.07695109, -0.2258565, -1.4538, 0, 1, 0.7960784, 1,
-0.07527546, 0.5061128, 0.6743708, 0, 1, 0.8039216, 1,
-0.07388173, -1.310132, -2.236022, 0, 1, 0.8078431, 1,
-0.07337997, 3.000315, -0.4497674, 0, 1, 0.8156863, 1,
-0.06993504, -1.092002, -4.555172, 0, 1, 0.8196079, 1,
-0.06313893, -0.5893732, -1.479628, 0, 1, 0.827451, 1,
-0.06207778, -0.4384879, -4.057391, 0, 1, 0.8313726, 1,
-0.05990174, 0.6562919, -0.7407775, 0, 1, 0.8392157, 1,
-0.0586682, 1.677963, -1.015458, 0, 1, 0.8431373, 1,
-0.05854957, -0.9466208, -4.172207, 0, 1, 0.8509804, 1,
-0.05783595, -0.8629587, -4.239541, 0, 1, 0.854902, 1,
-0.05366108, 0.6283072, -1.091419, 0, 1, 0.8627451, 1,
-0.05230551, -1.919429, -3.027257, 0, 1, 0.8666667, 1,
-0.05019428, -0.4861249, -2.858879, 0, 1, 0.8745098, 1,
-0.04381827, -2.356151, -2.408709, 0, 1, 0.8784314, 1,
-0.04010159, -1.57979, -2.656139, 0, 1, 0.8862745, 1,
-0.03087284, 1.066338, 0.2713076, 0, 1, 0.8901961, 1,
-0.02849951, 0.8640067, -0.1418146, 0, 1, 0.8980392, 1,
-0.02414209, 1.003863, 0.2687438, 0, 1, 0.9058824, 1,
-0.02085724, -1.393901, -3.547105, 0, 1, 0.9098039, 1,
-0.01428129, -1.530449, -3.538303, 0, 1, 0.9176471, 1,
-0.0135763, -1.531786, -3.00257, 0, 1, 0.9215686, 1,
-0.01312265, 1.235362, -0.5197132, 0, 1, 0.9294118, 1,
-0.005139039, 0.407592, 1.419599, 0, 1, 0.9333333, 1,
-0.004857232, -0.5522429, -4.177566, 0, 1, 0.9411765, 1,
-0.003528761, 1.43365, 0.1763368, 0, 1, 0.945098, 1,
-0.002881916, -1.150147, -3.479985, 0, 1, 0.9529412, 1,
-0.002619324, 0.6863744, -0.785937, 0, 1, 0.9568627, 1,
-0.002455244, 0.4705102, -0.9628597, 0, 1, 0.9647059, 1,
-0.001539953, -0.111969, -2.166842, 0, 1, 0.9686275, 1,
0.002911153, 1.249258, -1.235972, 0, 1, 0.9764706, 1,
0.003022801, -0.8831919, 3.574161, 0, 1, 0.9803922, 1,
0.003515332, -0.3657035, 1.701286, 0, 1, 0.9882353, 1,
0.004221212, -1.420548, 2.628917, 0, 1, 0.9921569, 1,
0.006239538, -1.117257, 2.808981, 0, 1, 1, 1,
0.007653063, -0.6689644, 3.431381, 0, 0.9921569, 1, 1,
0.01087095, 0.6292353, 0.3197916, 0, 0.9882353, 1, 1,
0.02008135, -1.631552, 1.083847, 0, 0.9803922, 1, 1,
0.02733543, 0.3689849, -1.141637, 0, 0.9764706, 1, 1,
0.0379227, 1.934065, 0.6620073, 0, 0.9686275, 1, 1,
0.03947543, 0.5590428, -0.8751204, 0, 0.9647059, 1, 1,
0.04115394, -0.1563304, 2.278205, 0, 0.9568627, 1, 1,
0.04497578, -1.123998, 2.460274, 0, 0.9529412, 1, 1,
0.04792808, -0.8492575, 3.878564, 0, 0.945098, 1, 1,
0.04829621, 0.4369063, 0.1446012, 0, 0.9411765, 1, 1,
0.04919146, -1.289187, 3.712863, 0, 0.9333333, 1, 1,
0.05130762, -0.988373, 3.228128, 0, 0.9294118, 1, 1,
0.05139055, -1.121703, 2.512702, 0, 0.9215686, 1, 1,
0.05211276, -0.6873432, 2.677186, 0, 0.9176471, 1, 1,
0.05736606, 0.3345461, 1.322021, 0, 0.9098039, 1, 1,
0.05961775, 0.02075595, 2.995549, 0, 0.9058824, 1, 1,
0.06212909, 0.2301489, -0.3709415, 0, 0.8980392, 1, 1,
0.06360694, 0.5834339, 0.8359098, 0, 0.8901961, 1, 1,
0.06399275, -1.477787, 3.434786, 0, 0.8862745, 1, 1,
0.06680414, 0.8521891, 1.543127, 0, 0.8784314, 1, 1,
0.06961742, -0.03917885, 1.095263, 0, 0.8745098, 1, 1,
0.07343313, 0.7941867, 0.03120058, 0, 0.8666667, 1, 1,
0.07408068, -0.03941538, 1.805949, 0, 0.8627451, 1, 1,
0.08074587, 0.6540377, 0.2591317, 0, 0.854902, 1, 1,
0.08540295, 0.6348834, -0.5125628, 0, 0.8509804, 1, 1,
0.08556312, -0.1216621, 3.32576, 0, 0.8431373, 1, 1,
0.08950768, -0.8301876, 3.589955, 0, 0.8392157, 1, 1,
0.09007236, -0.03266582, 0.9931859, 0, 0.8313726, 1, 1,
0.09145249, 0.8161688, 0.2812324, 0, 0.827451, 1, 1,
0.09181499, 1.554861, -1.992373, 0, 0.8196079, 1, 1,
0.09618876, 0.1150853, 0.9039105, 0, 0.8156863, 1, 1,
0.09713452, -0.8106831, 2.034014, 0, 0.8078431, 1, 1,
0.099245, 0.6502662, -1.024465, 0, 0.8039216, 1, 1,
0.1030588, 0.8966821, -0.07338468, 0, 0.7960784, 1, 1,
0.1032142, -0.5826413, 2.826483, 0, 0.7882353, 1, 1,
0.1040976, -0.4845658, 2.348031, 0, 0.7843137, 1, 1,
0.1042724, -1.08747, 2.955177, 0, 0.7764706, 1, 1,
0.105291, -2.798575, 4.194761, 0, 0.772549, 1, 1,
0.1074088, -0.08359757, 1.996904, 0, 0.7647059, 1, 1,
0.115438, -0.6823912, 1.673628, 0, 0.7607843, 1, 1,
0.1179258, -1.244261, 2.434402, 0, 0.7529412, 1, 1,
0.1180436, -0.2522232, 0.8530339, 0, 0.7490196, 1, 1,
0.1255701, 1.69655, 2.53341, 0, 0.7411765, 1, 1,
0.1281757, -2.251817, 4.068971, 0, 0.7372549, 1, 1,
0.1285869, 1.253705, -0.427788, 0, 0.7294118, 1, 1,
0.1324817, -0.2944268, 3.713289, 0, 0.7254902, 1, 1,
0.1345064, -0.2492436, 2.128826, 0, 0.7176471, 1, 1,
0.1349905, -2.099734, 1.207868, 0, 0.7137255, 1, 1,
0.1360655, 0.8571836, -0.8901361, 0, 0.7058824, 1, 1,
0.136198, 1.263261, -1.215621, 0, 0.6980392, 1, 1,
0.1368652, -0.05585787, 0.3763571, 0, 0.6941177, 1, 1,
0.1373401, -0.4284598, 2.535043, 0, 0.6862745, 1, 1,
0.1384488, -1.797214, 1.433763, 0, 0.682353, 1, 1,
0.1392798, -0.8529497, 3.12536, 0, 0.6745098, 1, 1,
0.1445076, 0.8221832, 0.7367675, 0, 0.6705883, 1, 1,
0.1493204, 0.4760728, 0.4451606, 0, 0.6627451, 1, 1,
0.1531526, 1.36913, 0.9474307, 0, 0.6588235, 1, 1,
0.1532021, 1.863657, -0.7468871, 0, 0.6509804, 1, 1,
0.1544856, -0.0118045, 3.160478, 0, 0.6470588, 1, 1,
0.1555808, 0.744764, -0.1757187, 0, 0.6392157, 1, 1,
0.1560707, -0.8406734, 1.375287, 0, 0.6352941, 1, 1,
0.1590793, -0.1442546, 1.947126, 0, 0.627451, 1, 1,
0.1620772, -1.479338, 2.782493, 0, 0.6235294, 1, 1,
0.1639956, -1.022459, 4.035945, 0, 0.6156863, 1, 1,
0.17449, 0.8864071, -1.650308, 0, 0.6117647, 1, 1,
0.1766159, 0.03349769, 1.746146, 0, 0.6039216, 1, 1,
0.1769992, -0.4868846, 1.62744, 0, 0.5960785, 1, 1,
0.1779253, 0.9891402, -0.2190023, 0, 0.5921569, 1, 1,
0.1781384, 1.615586, 1.655007, 0, 0.5843138, 1, 1,
0.1799293, 0.2298219, 0.3315862, 0, 0.5803922, 1, 1,
0.1810934, -0.7979562, 1.336907, 0, 0.572549, 1, 1,
0.1886409, 0.7817974, 0.2368952, 0, 0.5686275, 1, 1,
0.1912288, -0.1706655, 1.294857, 0, 0.5607843, 1, 1,
0.1932158, -1.799154, 2.868353, 0, 0.5568628, 1, 1,
0.1963526, 1.065675, -1.148383, 0, 0.5490196, 1, 1,
0.198517, 0.1459653, 1.536784, 0, 0.5450981, 1, 1,
0.1992533, 0.6072957, 1.037873, 0, 0.5372549, 1, 1,
0.1998944, -0.08817565, 1.404722, 0, 0.5333334, 1, 1,
0.2021107, 1.214715, 1.746836, 0, 0.5254902, 1, 1,
0.2038155, 0.487563, 1.545724, 0, 0.5215687, 1, 1,
0.2069772, 1.644821, 0.3155232, 0, 0.5137255, 1, 1,
0.2168635, -0.5213326, 2.393829, 0, 0.509804, 1, 1,
0.2178521, 0.843446, 0.11018, 0, 0.5019608, 1, 1,
0.2202918, -0.2549181, 1.988652, 0, 0.4941176, 1, 1,
0.2290944, 1.541875, 0.7136203, 0, 0.4901961, 1, 1,
0.2295264, 0.6048871, 1.289454, 0, 0.4823529, 1, 1,
0.2417641, -1.955073, 2.080009, 0, 0.4784314, 1, 1,
0.2471549, 1.712849, -0.017426, 0, 0.4705882, 1, 1,
0.2484198, -0.622449, 3.111391, 0, 0.4666667, 1, 1,
0.2503385, 0.3556191, 0.4130628, 0, 0.4588235, 1, 1,
0.2549856, 1.611122, 1.374477, 0, 0.454902, 1, 1,
0.2608723, -0.6939216, 1.665808, 0, 0.4470588, 1, 1,
0.2612977, -0.8147669, 4.14875, 0, 0.4431373, 1, 1,
0.2676917, -0.2218523, 1.504688, 0, 0.4352941, 1, 1,
0.2692567, 1.473126, -0.01527448, 0, 0.4313726, 1, 1,
0.2711281, 0.6448646, -0.2300751, 0, 0.4235294, 1, 1,
0.2713124, 0.08867323, 2.154695, 0, 0.4196078, 1, 1,
0.2724109, -0.6031132, 4.789566, 0, 0.4117647, 1, 1,
0.2752553, -0.6440968, 1.473072, 0, 0.4078431, 1, 1,
0.2801237, -1.523055, 1.413521, 0, 0.4, 1, 1,
0.2828048, 0.3657663, -1.294976, 0, 0.3921569, 1, 1,
0.2831175, -0.5164408, 2.543083, 0, 0.3882353, 1, 1,
0.2870896, -0.123198, 0.5578544, 0, 0.3803922, 1, 1,
0.2883812, -1.51222, 3.105389, 0, 0.3764706, 1, 1,
0.2884561, 0.4577612, 0.5104007, 0, 0.3686275, 1, 1,
0.2886672, -2.111352, 5.876872, 0, 0.3647059, 1, 1,
0.2907587, -1.012762, 3.1925, 0, 0.3568628, 1, 1,
0.2954289, 0.5392911, -0.243918, 0, 0.3529412, 1, 1,
0.2959187, -0.9099364, 2.177499, 0, 0.345098, 1, 1,
0.296004, -0.0389682, 2.840866, 0, 0.3411765, 1, 1,
0.2997115, 0.8053192, 0.5047909, 0, 0.3333333, 1, 1,
0.3000796, 0.9916344, -1.264571, 0, 0.3294118, 1, 1,
0.3033578, 1.818072, -0.1206281, 0, 0.3215686, 1, 1,
0.3062893, 0.6870055, -1.304883, 0, 0.3176471, 1, 1,
0.306317, 0.08349141, 0.964346, 0, 0.3098039, 1, 1,
0.3087115, -0.1731445, 3.022406, 0, 0.3058824, 1, 1,
0.3118001, 0.9514968, -0.3809652, 0, 0.2980392, 1, 1,
0.3135667, -0.4352486, 0.8144041, 0, 0.2901961, 1, 1,
0.3146397, -0.2118382, 2.306655, 0, 0.2862745, 1, 1,
0.3163607, -0.8108026, 3.079577, 0, 0.2784314, 1, 1,
0.3181693, -2.309863, 4.334724, 0, 0.2745098, 1, 1,
0.3224183, -0.3866335, 2.805009, 0, 0.2666667, 1, 1,
0.3269773, 0.2123367, -0.08586183, 0, 0.2627451, 1, 1,
0.3288811, -0.4417151, 1.739361, 0, 0.254902, 1, 1,
0.3309368, 0.08614536, 0.07027013, 0, 0.2509804, 1, 1,
0.331144, -1.442901, 3.159146, 0, 0.2431373, 1, 1,
0.3334497, -1.532602, 1.432196, 0, 0.2392157, 1, 1,
0.3337494, -0.9404129, 3.978161, 0, 0.2313726, 1, 1,
0.3349333, 0.134273, 0.1351925, 0, 0.227451, 1, 1,
0.3362445, -0.3581521, 3.702712, 0, 0.2196078, 1, 1,
0.3377326, 0.5061049, 0.6607478, 0, 0.2156863, 1, 1,
0.3535607, 1.210838, 1.618263, 0, 0.2078431, 1, 1,
0.3677744, -1.410047, 3.711087, 0, 0.2039216, 1, 1,
0.3703757, 1.041021, 0.1389902, 0, 0.1960784, 1, 1,
0.3731556, 1.505457, 1.413588, 0, 0.1882353, 1, 1,
0.3736171, -0.189557, 1.700562, 0, 0.1843137, 1, 1,
0.3764763, -0.08145047, 1.703834, 0, 0.1764706, 1, 1,
0.3804517, 1.364586, 0.7297139, 0, 0.172549, 1, 1,
0.3886943, -0.8511589, 4.004826, 0, 0.1647059, 1, 1,
0.3890793, 0.6212279, -1.010047, 0, 0.1607843, 1, 1,
0.3898287, -2.514465, 2.80723, 0, 0.1529412, 1, 1,
0.3970115, 2.576197, -1.015452, 0, 0.1490196, 1, 1,
0.3972256, -0.3632483, 2.418552, 0, 0.1411765, 1, 1,
0.3982998, -0.8056747, 3.504891, 0, 0.1372549, 1, 1,
0.3994433, -0.8411563, 1.344132, 0, 0.1294118, 1, 1,
0.4014066, -0.3016595, 1.479882, 0, 0.1254902, 1, 1,
0.4098899, 0.3523361, 1.858086, 0, 0.1176471, 1, 1,
0.4101413, 0.5504015, 0.585835, 0, 0.1137255, 1, 1,
0.4117473, -1.810981, 2.134904, 0, 0.1058824, 1, 1,
0.4121844, 0.8808831, 0.7016191, 0, 0.09803922, 1, 1,
0.4183475, -0.08744987, 1.119573, 0, 0.09411765, 1, 1,
0.4229909, -0.5633829, 1.270839, 0, 0.08627451, 1, 1,
0.4253514, -2.17346, 3.454105, 0, 0.08235294, 1, 1,
0.4358009, -3.049539, 1.669806, 0, 0.07450981, 1, 1,
0.4365962, 0.1805959, 1.307077, 0, 0.07058824, 1, 1,
0.436831, -0.407649, 3.008431, 0, 0.0627451, 1, 1,
0.4388377, -2.17529, 4.035563, 0, 0.05882353, 1, 1,
0.4419152, -0.7499325, 2.007877, 0, 0.05098039, 1, 1,
0.4429203, 0.117735, 1.671057, 0, 0.04705882, 1, 1,
0.4469011, 0.2806145, 0.1818948, 0, 0.03921569, 1, 1,
0.4516494, -0.8053877, 1.520407, 0, 0.03529412, 1, 1,
0.4546323, 1.047611, 0.5638469, 0, 0.02745098, 1, 1,
0.4572343, 0.6858849, 1.435994, 0, 0.02352941, 1, 1,
0.4591542, 0.2694867, 0.9281307, 0, 0.01568628, 1, 1,
0.4624604, -1.199038, 2.140238, 0, 0.01176471, 1, 1,
0.4703537, -1.137166, 2.703564, 0, 0.003921569, 1, 1,
0.4717177, 1.000504, -0.4017504, 0.003921569, 0, 1, 1,
0.4726968, 0.5832344, 0.1190732, 0.007843138, 0, 1, 1,
0.4773916, -0.8526084, 1.542354, 0.01568628, 0, 1, 1,
0.4797925, -1.525713, 2.646269, 0.01960784, 0, 1, 1,
0.482572, -0.1233459, 1.397787, 0.02745098, 0, 1, 1,
0.4828761, -1.025258, 1.703595, 0.03137255, 0, 1, 1,
0.4846662, 0.1530299, 2.239647, 0.03921569, 0, 1, 1,
0.4866842, 0.1870369, 1.41898, 0.04313726, 0, 1, 1,
0.4874638, -0.6651483, 2.931584, 0.05098039, 0, 1, 1,
0.4927784, 2.884998, 1.030641, 0.05490196, 0, 1, 1,
0.5004023, -1.549883, 3.725054, 0.0627451, 0, 1, 1,
0.5101345, 0.6219923, -2.220103, 0.06666667, 0, 1, 1,
0.5116562, -1.006216, 1.435629, 0.07450981, 0, 1, 1,
0.513567, 0.2008597, 0.9462191, 0.07843138, 0, 1, 1,
0.5159684, -0.082022, 2.34304, 0.08627451, 0, 1, 1,
0.5234866, 0.2355897, 1.967211, 0.09019608, 0, 1, 1,
0.5237038, -0.29788, 2.477188, 0.09803922, 0, 1, 1,
0.5242312, 0.2360078, 0.1843014, 0.1058824, 0, 1, 1,
0.533375, 1.199971, 1.921196, 0.1098039, 0, 1, 1,
0.5343683, 1.289311, 0.4736106, 0.1176471, 0, 1, 1,
0.5412456, -0.8862857, 3.417013, 0.1215686, 0, 1, 1,
0.541272, -1.446763, 3.058073, 0.1294118, 0, 1, 1,
0.5426734, 0.7682608, 1.031491, 0.1333333, 0, 1, 1,
0.5432713, -0.1455852, 3.216087, 0.1411765, 0, 1, 1,
0.5450397, 1.090606, -0.221925, 0.145098, 0, 1, 1,
0.5457781, -0.7790403, 2.600852, 0.1529412, 0, 1, 1,
0.5491248, -0.7016208, 2.840801, 0.1568628, 0, 1, 1,
0.5521701, 0.560146, 1.189614, 0.1647059, 0, 1, 1,
0.5627561, 1.179909, -0.136851, 0.1686275, 0, 1, 1,
0.5691875, 0.1952405, 1.428418, 0.1764706, 0, 1, 1,
0.5710443, -1.414702, 1.956609, 0.1803922, 0, 1, 1,
0.5715089, 0.6326611, 1.780832, 0.1882353, 0, 1, 1,
0.5781331, -0.6467426, 0.7627252, 0.1921569, 0, 1, 1,
0.5822555, 0.3563845, 1.284342, 0.2, 0, 1, 1,
0.5857458, -1.871487, 2.675282, 0.2078431, 0, 1, 1,
0.5895975, -2.07641, 2.487419, 0.2117647, 0, 1, 1,
0.5901265, 1.545778, -0.04313283, 0.2196078, 0, 1, 1,
0.5902689, 0.077269, 0.6209756, 0.2235294, 0, 1, 1,
0.5908082, 0.9343836, 0.6007661, 0.2313726, 0, 1, 1,
0.5974116, -0.006847159, 2.702694, 0.2352941, 0, 1, 1,
0.5981619, 1.414818, -1.165663, 0.2431373, 0, 1, 1,
0.5989559, 0.8651873, 1.507439, 0.2470588, 0, 1, 1,
0.5992931, 1.476122, -0.7779145, 0.254902, 0, 1, 1,
0.6049429, -0.2818836, 1.614426, 0.2588235, 0, 1, 1,
0.6073853, 0.2440331, 0.9230626, 0.2666667, 0, 1, 1,
0.6076574, 0.1290074, 1.303542, 0.2705882, 0, 1, 1,
0.6133831, -1.142045, 3.94658, 0.2784314, 0, 1, 1,
0.6161243, -0.2906293, 1.278997, 0.282353, 0, 1, 1,
0.6224155, -0.5350701, 3.260116, 0.2901961, 0, 1, 1,
0.6242534, 0.1985862, 1.694901, 0.2941177, 0, 1, 1,
0.6265008, -0.7493392, 3.071068, 0.3019608, 0, 1, 1,
0.6317554, 0.1825766, 2.373839, 0.3098039, 0, 1, 1,
0.6351252, 0.302977, 0.1217609, 0.3137255, 0, 1, 1,
0.6352388, 0.1850717, -0.1058915, 0.3215686, 0, 1, 1,
0.6372433, -0.2581344, 1.112381, 0.3254902, 0, 1, 1,
0.6375864, 0.3060886, 0.1526838, 0.3333333, 0, 1, 1,
0.6411492, -0.6476266, 1.983383, 0.3372549, 0, 1, 1,
0.6484643, -1.435523, 2.444593, 0.345098, 0, 1, 1,
0.6489127, -1.054705, 1.760308, 0.3490196, 0, 1, 1,
0.6492884, -0.5129181, 2.094674, 0.3568628, 0, 1, 1,
0.6549056, -0.8030387, 2.945587, 0.3607843, 0, 1, 1,
0.6564676, 0.9245382, 1.420144, 0.3686275, 0, 1, 1,
0.657101, 0.4546207, 0.4009454, 0.372549, 0, 1, 1,
0.6658022, 1.663859, 2.086055, 0.3803922, 0, 1, 1,
0.672256, 0.4753217, 0.4937044, 0.3843137, 0, 1, 1,
0.6742032, -1.44631, 3.504935, 0.3921569, 0, 1, 1,
0.6757626, 0.3991591, 0.6637979, 0.3960784, 0, 1, 1,
0.6772483, -0.4405328, 2.965618, 0.4039216, 0, 1, 1,
0.6786956, 0.109702, -0.454091, 0.4117647, 0, 1, 1,
0.6796376, -0.7887487, 3.23048, 0.4156863, 0, 1, 1,
0.6839296, 2.241786, -0.4089955, 0.4235294, 0, 1, 1,
0.6860116, -1.405308, -0.3086739, 0.427451, 0, 1, 1,
0.688754, 0.7422401, -0.585807, 0.4352941, 0, 1, 1,
0.6898446, 0.6981903, -0.7573299, 0.4392157, 0, 1, 1,
0.6909952, -1.257971, 3.893357, 0.4470588, 0, 1, 1,
0.6929561, -0.6150845, 1.765819, 0.4509804, 0, 1, 1,
0.6963678, -0.116731, 1.602661, 0.4588235, 0, 1, 1,
0.6981072, 1.23483, 1.199317, 0.4627451, 0, 1, 1,
0.6993256, -0.5379457, 1.888344, 0.4705882, 0, 1, 1,
0.7036135, -1.191505, 3.052784, 0.4745098, 0, 1, 1,
0.7085161, 0.3143139, -0.04582261, 0.4823529, 0, 1, 1,
0.7154257, -0.3061733, 2.845796, 0.4862745, 0, 1, 1,
0.7174261, -0.1886778, 3.893257, 0.4941176, 0, 1, 1,
0.7210651, -0.6209257, 2.949219, 0.5019608, 0, 1, 1,
0.7214795, -1.133692, 1.862487, 0.5058824, 0, 1, 1,
0.7227547, 0.6116894, 1.379075, 0.5137255, 0, 1, 1,
0.7273223, 0.2977598, 1.916584, 0.5176471, 0, 1, 1,
0.7277699, 0.5181437, -0.1554532, 0.5254902, 0, 1, 1,
0.734571, -0.3877136, 3.486028, 0.5294118, 0, 1, 1,
0.7437066, -0.4662817, 1.428977, 0.5372549, 0, 1, 1,
0.7519985, -0.3150622, 2.772021, 0.5411765, 0, 1, 1,
0.7587438, -1.629811, 3.242517, 0.5490196, 0, 1, 1,
0.7652798, -1.975138, 2.985751, 0.5529412, 0, 1, 1,
0.767884, -1.612576, 3.006588, 0.5607843, 0, 1, 1,
0.7710437, -0.3046758, 2.023576, 0.5647059, 0, 1, 1,
0.7722442, -0.8550203, 1.370036, 0.572549, 0, 1, 1,
0.7729908, -0.5974903, 2.457492, 0.5764706, 0, 1, 1,
0.780125, 0.5836557, 1.114916, 0.5843138, 0, 1, 1,
0.7832289, 0.06533786, -0.8154528, 0.5882353, 0, 1, 1,
0.7833697, -1.271037, 3.661581, 0.5960785, 0, 1, 1,
0.784736, -0.6263435, 1.785619, 0.6039216, 0, 1, 1,
0.7874509, -1.129236, 2.736909, 0.6078432, 0, 1, 1,
0.7882244, -0.8379715, 2.636718, 0.6156863, 0, 1, 1,
0.7971379, -0.5070179, 0.8871176, 0.6196079, 0, 1, 1,
0.7999617, -0.1355396, 1.775999, 0.627451, 0, 1, 1,
0.8002084, 0.02309467, 0.9254416, 0.6313726, 0, 1, 1,
0.806336, -0.4202249, 2.853907, 0.6392157, 0, 1, 1,
0.808297, -0.40181, 3.205408, 0.6431373, 0, 1, 1,
0.8095033, 1.94742, 2.62526, 0.6509804, 0, 1, 1,
0.8149632, 0.3058774, 0.8479432, 0.654902, 0, 1, 1,
0.8170531, -0.8866455, 2.548254, 0.6627451, 0, 1, 1,
0.8185701, 0.8726855, 0.2950614, 0.6666667, 0, 1, 1,
0.8240459, -0.3835036, 3.143277, 0.6745098, 0, 1, 1,
0.8256704, -1.031373, 4.440068, 0.6784314, 0, 1, 1,
0.8260298, 0.5008222, 1.22723, 0.6862745, 0, 1, 1,
0.8273772, 0.04583304, 2.167391, 0.6901961, 0, 1, 1,
0.8280835, 0.6330494, 2.900446, 0.6980392, 0, 1, 1,
0.8294186, -1.347776, 2.42868, 0.7058824, 0, 1, 1,
0.8349735, -0.2208683, 1.596571, 0.7098039, 0, 1, 1,
0.8369323, 0.5283903, 2.53977, 0.7176471, 0, 1, 1,
0.8409617, -1.441753, 1.797035, 0.7215686, 0, 1, 1,
0.8440844, -1.476716, 2.513841, 0.7294118, 0, 1, 1,
0.8475265, -0.9579388, 4.345491, 0.7333333, 0, 1, 1,
0.8497989, 0.8631269, 0.3235281, 0.7411765, 0, 1, 1,
0.8532868, -1.072489, 1.764966, 0.7450981, 0, 1, 1,
0.855151, 0.6228694, 0.193227, 0.7529412, 0, 1, 1,
0.8553253, 0.3368256, -0.3466076, 0.7568628, 0, 1, 1,
0.8574815, -0.4398007, 2.844625, 0.7647059, 0, 1, 1,
0.8589447, 0.3648958, -0.883854, 0.7686275, 0, 1, 1,
0.8617522, -0.3560412, 2.996687, 0.7764706, 0, 1, 1,
0.8625816, 0.06833625, 0.7637298, 0.7803922, 0, 1, 1,
0.863924, 0.8549861, 0.6854171, 0.7882353, 0, 1, 1,
0.8644069, -0.09262317, 2.799833, 0.7921569, 0, 1, 1,
0.8647728, -0.7987658, 0.6470087, 0.8, 0, 1, 1,
0.8709378, 0.7024141, 2.307048, 0.8078431, 0, 1, 1,
0.8731031, 1.598338, 0.5962093, 0.8117647, 0, 1, 1,
0.8798779, 0.6174031, 1.647822, 0.8196079, 0, 1, 1,
0.8825148, -1.36134, -0.1998275, 0.8235294, 0, 1, 1,
0.8853737, -1.155097, 3.050392, 0.8313726, 0, 1, 1,
0.8879602, -1.282118, 1.789756, 0.8352941, 0, 1, 1,
0.8897175, 0.6209091, 0.7130784, 0.8431373, 0, 1, 1,
0.8963807, 1.967865, -1.008538, 0.8470588, 0, 1, 1,
0.9017397, -1.31481, 2.348756, 0.854902, 0, 1, 1,
0.9018717, 0.3161588, 0.5004008, 0.8588235, 0, 1, 1,
0.9055996, 0.3581646, 1.757278, 0.8666667, 0, 1, 1,
0.905769, -0.5462418, 3.480573, 0.8705882, 0, 1, 1,
0.907241, 0.02230175, 2.179335, 0.8784314, 0, 1, 1,
0.9081534, -0.2066984, -0.5087014, 0.8823529, 0, 1, 1,
0.9158437, -1.082261, 2.528888, 0.8901961, 0, 1, 1,
0.916124, -0.9374484, 2.305524, 0.8941177, 0, 1, 1,
0.9194314, -0.9057335, 3.717259, 0.9019608, 0, 1, 1,
0.9222005, 0.3469386, -0.8555735, 0.9098039, 0, 1, 1,
0.9368275, -0.3043422, 2.907887, 0.9137255, 0, 1, 1,
0.9386923, 1.543487, 0.866806, 0.9215686, 0, 1, 1,
0.9395654, 0.7774554, 1.486131, 0.9254902, 0, 1, 1,
0.9517458, -0.7944414, 3.77469, 0.9333333, 0, 1, 1,
0.9531516, -1.550789, 3.894454, 0.9372549, 0, 1, 1,
0.9532827, -0.2132252, 3.152645, 0.945098, 0, 1, 1,
0.9546196, 0.434158, 0.9348474, 0.9490196, 0, 1, 1,
0.9557764, 0.5323251, 2.228512, 0.9568627, 0, 1, 1,
0.9597243, -0.8868171, 3.967913, 0.9607843, 0, 1, 1,
0.9657138, -1.043274, 1.568235, 0.9686275, 0, 1, 1,
0.9770952, 0.7975517, 2.022569, 0.972549, 0, 1, 1,
0.9858868, -0.9140559, 3.166543, 0.9803922, 0, 1, 1,
0.9896204, -1.116307, 2.281171, 0.9843137, 0, 1, 1,
0.996882, 1.817827, -0.03316846, 0.9921569, 0, 1, 1,
1.003335, -1.103435, 1.741563, 0.9960784, 0, 1, 1,
1.007495, 0.6215855, 1.873362, 1, 0, 0.9960784, 1,
1.014104, 0.5960905, 0.1609072, 1, 0, 0.9882353, 1,
1.01437, 0.7137803, 1.386461, 1, 0, 0.9843137, 1,
1.015347, -0.4840454, 0.6315501, 1, 0, 0.9764706, 1,
1.018059, 0.7481852, -0.7696254, 1, 0, 0.972549, 1,
1.018937, 0.07736142, 4.352895, 1, 0, 0.9647059, 1,
1.024911, 0.2743852, 1.190148, 1, 0, 0.9607843, 1,
1.02686, -0.3156928, 2.664055, 1, 0, 0.9529412, 1,
1.031688, -0.370087, 1.713601, 1, 0, 0.9490196, 1,
1.035038, -0.5466808, 1.845315, 1, 0, 0.9411765, 1,
1.039951, 1.188196, 1.855413, 1, 0, 0.9372549, 1,
1.04302, -0.6057089, 2.991482, 1, 0, 0.9294118, 1,
1.049207, 0.5225948, 3.059226, 1, 0, 0.9254902, 1,
1.051298, 0.183027, 0.988273, 1, 0, 0.9176471, 1,
1.066395, -0.2080958, 1.415341, 1, 0, 0.9137255, 1,
1.066918, -0.5023293, 4.025716, 1, 0, 0.9058824, 1,
1.072692, 0.4870593, 0.8462557, 1, 0, 0.9019608, 1,
1.075378, -1.186671, 4.067743, 1, 0, 0.8941177, 1,
1.077886, 0.04265748, 0.9539658, 1, 0, 0.8862745, 1,
1.086783, 0.6593927, 1.44723, 1, 0, 0.8823529, 1,
1.089143, 0.6981282, 0.5700352, 1, 0, 0.8745098, 1,
1.094401, -0.1543745, 0.9833443, 1, 0, 0.8705882, 1,
1.099074, -0.09153307, 2.539648, 1, 0, 0.8627451, 1,
1.11288, 0.3277729, 1.258461, 1, 0, 0.8588235, 1,
1.114342, -1.414376, 2.186657, 1, 0, 0.8509804, 1,
1.118031, -0.5943174, 1.067508, 1, 0, 0.8470588, 1,
1.118923, -1.164652, 1.045144, 1, 0, 0.8392157, 1,
1.120989, 0.1159745, 1.356096, 1, 0, 0.8352941, 1,
1.126189, -0.2192977, 3.618958, 1, 0, 0.827451, 1,
1.134247, -0.1917806, 1.66666, 1, 0, 0.8235294, 1,
1.135771, -0.3853663, 1.551046, 1, 0, 0.8156863, 1,
1.137358, 0.3695049, 1.773755, 1, 0, 0.8117647, 1,
1.139098, 0.7440143, 1.759636, 1, 0, 0.8039216, 1,
1.149722, 0.2241959, 1.101363, 1, 0, 0.7960784, 1,
1.15182, 1.162162, 1.636421, 1, 0, 0.7921569, 1,
1.1532, 0.2883233, 1.339989, 1, 0, 0.7843137, 1,
1.15546, 0.3904732, 1.499189, 1, 0, 0.7803922, 1,
1.164636, 0.01208246, -0.4287545, 1, 0, 0.772549, 1,
1.168486, 0.05475624, 0.9012256, 1, 0, 0.7686275, 1,
1.17342, -1.14616, 1.250464, 1, 0, 0.7607843, 1,
1.17733, -0.4866959, 2.696074, 1, 0, 0.7568628, 1,
1.180905, 0.1848902, 2.588, 1, 0, 0.7490196, 1,
1.182523, -2.772437, 2.416502, 1, 0, 0.7450981, 1,
1.197341, 0.09034424, 2.243973, 1, 0, 0.7372549, 1,
1.202979, -0.7665448, 1.936352, 1, 0, 0.7333333, 1,
1.20349, 0.7117473, 0.2422767, 1, 0, 0.7254902, 1,
1.203631, -0.3936033, 2.025478, 1, 0, 0.7215686, 1,
1.205683, -0.9279816, 1.851383, 1, 0, 0.7137255, 1,
1.213286, -0.01791939, 0.9820496, 1, 0, 0.7098039, 1,
1.21771, -0.8979928, 1.285695, 1, 0, 0.7019608, 1,
1.230813, 0.1049018, 1.261573, 1, 0, 0.6941177, 1,
1.24325, -0.04631824, -0.1400656, 1, 0, 0.6901961, 1,
1.250612, 1.40178, -0.2087454, 1, 0, 0.682353, 1,
1.25088, 0.9917423, -0.2087892, 1, 0, 0.6784314, 1,
1.255195, 0.1233909, 0.7168702, 1, 0, 0.6705883, 1,
1.261045, 2.284989, 0.7041782, 1, 0, 0.6666667, 1,
1.269358, 0.01375127, 1.518613, 1, 0, 0.6588235, 1,
1.273323, 0.4608663, 1.424268, 1, 0, 0.654902, 1,
1.278925, -0.5171292, 2.099772, 1, 0, 0.6470588, 1,
1.287981, -1.028182, 1.021722, 1, 0, 0.6431373, 1,
1.288221, -1.297874, 1.76027, 1, 0, 0.6352941, 1,
1.290841, 0.01369992, 3.736063, 1, 0, 0.6313726, 1,
1.294756, -0.6171042, 1.650884, 1, 0, 0.6235294, 1,
1.30256, 0.1235609, 1.566917, 1, 0, 0.6196079, 1,
1.307259, -1.304817, 1.328674, 1, 0, 0.6117647, 1,
1.3089, -0.2981409, 2.13129, 1, 0, 0.6078432, 1,
1.31042, 0.1921327, 1.471442, 1, 0, 0.6, 1,
1.316262, -0.3549656, 2.46041, 1, 0, 0.5921569, 1,
1.338773, 1.34224, -0.03005885, 1, 0, 0.5882353, 1,
1.339028, 0.4048305, 2.303143, 1, 0, 0.5803922, 1,
1.340079, 0.6216467, 2.099396, 1, 0, 0.5764706, 1,
1.342478, 1.729738, 0.9094259, 1, 0, 0.5686275, 1,
1.346531, -0.9524895, 0.7369519, 1, 0, 0.5647059, 1,
1.350648, -0.4114653, 0.4767931, 1, 0, 0.5568628, 1,
1.351132, 0.6445023, 1.105409, 1, 0, 0.5529412, 1,
1.366621, 0.5095166, 0.07120115, 1, 0, 0.5450981, 1,
1.377488, 0.08637968, 1.048921, 1, 0, 0.5411765, 1,
1.380962, -1.64626, 3.005184, 1, 0, 0.5333334, 1,
1.382407, 0.955222, 1.775529, 1, 0, 0.5294118, 1,
1.382591, -1.047323, 2.625793, 1, 0, 0.5215687, 1,
1.383555, -0.6695364, 1.311909, 1, 0, 0.5176471, 1,
1.386071, 0.9159698, 1.833088, 1, 0, 0.509804, 1,
1.390507, 0.3038275, 1.15403, 1, 0, 0.5058824, 1,
1.391111, -0.3997298, 2.101466, 1, 0, 0.4980392, 1,
1.397495, 0.2853537, 1.501188, 1, 0, 0.4901961, 1,
1.410604, 0.0311142, 1.536011, 1, 0, 0.4862745, 1,
1.415887, -0.7845758, 4.507293, 1, 0, 0.4784314, 1,
1.448582, 0.6469339, 0.6879941, 1, 0, 0.4745098, 1,
1.449952, -0.4663737, 1.212615, 1, 0, 0.4666667, 1,
1.454175, 2.286764, 0.6148346, 1, 0, 0.4627451, 1,
1.461044, 0.05787854, 2.380685, 1, 0, 0.454902, 1,
1.476639, -0.6280757, 2.203201, 1, 0, 0.4509804, 1,
1.47759, 0.307299, -0.4716086, 1, 0, 0.4431373, 1,
1.495593, 0.5025224, 2.721636, 1, 0, 0.4392157, 1,
1.495642, -0.4767641, 2.301312, 1, 0, 0.4313726, 1,
1.496005, 0.2642586, -0.3545112, 1, 0, 0.427451, 1,
1.499833, -0.3677328, 2.445508, 1, 0, 0.4196078, 1,
1.50833, -0.6645213, 1.601303, 1, 0, 0.4156863, 1,
1.509477, -1.41886, 2.25129, 1, 0, 0.4078431, 1,
1.516186, 0.05249792, 1.864929, 1, 0, 0.4039216, 1,
1.525094, 1.535922, 0.1680055, 1, 0, 0.3960784, 1,
1.536176, -0.8975043, 2.295574, 1, 0, 0.3882353, 1,
1.549868, -0.1309888, 1.128217, 1, 0, 0.3843137, 1,
1.552343, -0.6142899, 1.840238, 1, 0, 0.3764706, 1,
1.561647, 0.3942385, 2.145128, 1, 0, 0.372549, 1,
1.56922, -1.574062, 2.506056, 1, 0, 0.3647059, 1,
1.574287, 1.947021, 0.1197033, 1, 0, 0.3607843, 1,
1.580442, -1.588791, 1.906028, 1, 0, 0.3529412, 1,
1.589199, -0.7179376, 2.095386, 1, 0, 0.3490196, 1,
1.592816, -0.3330458, 1.506438, 1, 0, 0.3411765, 1,
1.595047, -1.308007, 2.51833, 1, 0, 0.3372549, 1,
1.598782, 0.09693348, -0.07380313, 1, 0, 0.3294118, 1,
1.618497, -0.610349, 3.482958, 1, 0, 0.3254902, 1,
1.648321, -0.5766557, 2.30665, 1, 0, 0.3176471, 1,
1.656125, 1.34967, 1.214754, 1, 0, 0.3137255, 1,
1.659917, 1.385552, -0.00439962, 1, 0, 0.3058824, 1,
1.689322, 2.051739, -1.560415, 1, 0, 0.2980392, 1,
1.740728, -0.02614823, 4.696771, 1, 0, 0.2941177, 1,
1.752308, 1.03847, 1.406326, 1, 0, 0.2862745, 1,
1.800664, 1.566054, 1.108341, 1, 0, 0.282353, 1,
1.805998, -0.7094843, 1.500566, 1, 0, 0.2745098, 1,
1.816749, 0.05776913, 1.453045, 1, 0, 0.2705882, 1,
1.817157, -1.143343, 3.099736, 1, 0, 0.2627451, 1,
1.819534, -0.3642358, 1.999463, 1, 0, 0.2588235, 1,
1.82041, 1.481785, -0.07675771, 1, 0, 0.2509804, 1,
1.832466, -1.818181, 3.057024, 1, 0, 0.2470588, 1,
1.841353, 0.7942296, 0.8835873, 1, 0, 0.2392157, 1,
1.841681, -1.512916, 2.871231, 1, 0, 0.2352941, 1,
1.884978, 0.535381, 0.5515669, 1, 0, 0.227451, 1,
1.88587, -0.3461921, 2.44342, 1, 0, 0.2235294, 1,
1.888713, 0.8752899, 2.279342, 1, 0, 0.2156863, 1,
1.947626, 1.511633, 1.574257, 1, 0, 0.2117647, 1,
1.955933, -0.9969165, 1.903362, 1, 0, 0.2039216, 1,
1.959283, 1.27361, 2.462793, 1, 0, 0.1960784, 1,
1.960552, -1.273763, 0.6643904, 1, 0, 0.1921569, 1,
1.976315, 1.670524, 1.844964, 1, 0, 0.1843137, 1,
1.986154, -0.3983705, 3.095903, 1, 0, 0.1803922, 1,
1.996847, 0.8305963, 0.5460808, 1, 0, 0.172549, 1,
2.017823, -1.055749, 3.218509, 1, 0, 0.1686275, 1,
2.042159, 0.9104488, 1.768463, 1, 0, 0.1607843, 1,
2.064239, -1.245392, 1.634719, 1, 0, 0.1568628, 1,
2.070331, -1.900215, 4.106062, 1, 0, 0.1490196, 1,
2.08989, 0.02139046, 0.7811847, 1, 0, 0.145098, 1,
2.090139, 0.6135653, 1.881508, 1, 0, 0.1372549, 1,
2.149547, -1.499183, 1.48371, 1, 0, 0.1333333, 1,
2.1568, -0.7956222, 1.415141, 1, 0, 0.1254902, 1,
2.156919, -0.6066567, 0.6088654, 1, 0, 0.1215686, 1,
2.16299, -0.7674914, 2.762464, 1, 0, 0.1137255, 1,
2.176172, -0.1315127, 3.466194, 1, 0, 0.1098039, 1,
2.183072, 1.279302, 0.6813801, 1, 0, 0.1019608, 1,
2.270318, -0.0397043, 5.028179, 1, 0, 0.09411765, 1,
2.286059, 0.004094369, 2.512918, 1, 0, 0.09019608, 1,
2.317293, 0.6780561, 1.885549, 1, 0, 0.08235294, 1,
2.32122, -0.9814807, 1.723185, 1, 0, 0.07843138, 1,
2.323354, 0.07970117, 3.064719, 1, 0, 0.07058824, 1,
2.334302, -2.047786, 2.756042, 1, 0, 0.06666667, 1,
2.382041, -1.915967, 1.236711, 1, 0, 0.05882353, 1,
2.417895, 0.6363727, -1.159276, 1, 0, 0.05490196, 1,
2.49199, -0.04372977, 1.000338, 1, 0, 0.04705882, 1,
2.57937, 0.6710382, 0.5770761, 1, 0, 0.04313726, 1,
2.64418, -1.706126, 1.837339, 1, 0, 0.03529412, 1,
2.651514, 0.1644289, 0.2741428, 1, 0, 0.03137255, 1,
2.709707, 1.797877, 0.6995804, 1, 0, 0.02352941, 1,
3.005721, -0.9865277, 1.720986, 1, 0, 0.01960784, 1,
3.252371, 1.21012, 0.851882, 1, 0, 0.01176471, 1,
3.273489, -0.4252517, 2.163103, 1, 0, 0.007843138, 1
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
0.07552326, -4.074989, -6.35132, 0, -0.5, 0.5, 0.5,
0.07552326, -4.074989, -6.35132, 1, -0.5, 0.5, 0.5,
0.07552326, -4.074989, -6.35132, 1, 1.5, 0.5, 0.5,
0.07552326, -4.074989, -6.35132, 0, 1.5, 0.5, 0.5
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
-4.206553, -0.02461219, -6.35132, 0, -0.5, 0.5, 0.5,
-4.206553, -0.02461219, -6.35132, 1, -0.5, 0.5, 0.5,
-4.206553, -0.02461219, -6.35132, 1, 1.5, 0.5, 0.5,
-4.206553, -0.02461219, -6.35132, 0, 1.5, 0.5, 0.5
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
-4.206553, -4.074989, 0.6489146, 0, -0.5, 0.5, 0.5,
-4.206553, -4.074989, 0.6489146, 1, -0.5, 0.5, 0.5,
-4.206553, -4.074989, 0.6489146, 1, 1.5, 0.5, 0.5,
-4.206553, -4.074989, 0.6489146, 0, 1.5, 0.5, 0.5
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
-3, -3.140287, -4.735882,
3, -3.140287, -4.735882,
-3, -3.140287, -4.735882,
-3, -3.296071, -5.005121,
-2, -3.140287, -4.735882,
-2, -3.296071, -5.005121,
-1, -3.140287, -4.735882,
-1, -3.296071, -5.005121,
0, -3.140287, -4.735882,
0, -3.296071, -5.005121,
1, -3.140287, -4.735882,
1, -3.296071, -5.005121,
2, -3.140287, -4.735882,
2, -3.296071, -5.005121,
3, -3.140287, -4.735882,
3, -3.296071, -5.005121
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
-3, -3.607638, -5.543601, 0, -0.5, 0.5, 0.5,
-3, -3.607638, -5.543601, 1, -0.5, 0.5, 0.5,
-3, -3.607638, -5.543601, 1, 1.5, 0.5, 0.5,
-3, -3.607638, -5.543601, 0, 1.5, 0.5, 0.5,
-2, -3.607638, -5.543601, 0, -0.5, 0.5, 0.5,
-2, -3.607638, -5.543601, 1, -0.5, 0.5, 0.5,
-2, -3.607638, -5.543601, 1, 1.5, 0.5, 0.5,
-2, -3.607638, -5.543601, 0, 1.5, 0.5, 0.5,
-1, -3.607638, -5.543601, 0, -0.5, 0.5, 0.5,
-1, -3.607638, -5.543601, 1, -0.5, 0.5, 0.5,
-1, -3.607638, -5.543601, 1, 1.5, 0.5, 0.5,
-1, -3.607638, -5.543601, 0, 1.5, 0.5, 0.5,
0, -3.607638, -5.543601, 0, -0.5, 0.5, 0.5,
0, -3.607638, -5.543601, 1, -0.5, 0.5, 0.5,
0, -3.607638, -5.543601, 1, 1.5, 0.5, 0.5,
0, -3.607638, -5.543601, 0, 1.5, 0.5, 0.5,
1, -3.607638, -5.543601, 0, -0.5, 0.5, 0.5,
1, -3.607638, -5.543601, 1, -0.5, 0.5, 0.5,
1, -3.607638, -5.543601, 1, 1.5, 0.5, 0.5,
1, -3.607638, -5.543601, 0, 1.5, 0.5, 0.5,
2, -3.607638, -5.543601, 0, -0.5, 0.5, 0.5,
2, -3.607638, -5.543601, 1, -0.5, 0.5, 0.5,
2, -3.607638, -5.543601, 1, 1.5, 0.5, 0.5,
2, -3.607638, -5.543601, 0, 1.5, 0.5, 0.5,
3, -3.607638, -5.543601, 0, -0.5, 0.5, 0.5,
3, -3.607638, -5.543601, 1, -0.5, 0.5, 0.5,
3, -3.607638, -5.543601, 1, 1.5, 0.5, 0.5,
3, -3.607638, -5.543601, 0, 1.5, 0.5, 0.5
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
-3.218382, -3, -4.735882,
-3.218382, 3, -4.735882,
-3.218382, -3, -4.735882,
-3.383077, -3, -5.005121,
-3.218382, -2, -4.735882,
-3.383077, -2, -5.005121,
-3.218382, -1, -4.735882,
-3.383077, -1, -5.005121,
-3.218382, 0, -4.735882,
-3.383077, 0, -5.005121,
-3.218382, 1, -4.735882,
-3.383077, 1, -5.005121,
-3.218382, 2, -4.735882,
-3.383077, 2, -5.005121,
-3.218382, 3, -4.735882,
-3.383077, 3, -5.005121
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
-3.712468, -3, -5.543601, 0, -0.5, 0.5, 0.5,
-3.712468, -3, -5.543601, 1, -0.5, 0.5, 0.5,
-3.712468, -3, -5.543601, 1, 1.5, 0.5, 0.5,
-3.712468, -3, -5.543601, 0, 1.5, 0.5, 0.5,
-3.712468, -2, -5.543601, 0, -0.5, 0.5, 0.5,
-3.712468, -2, -5.543601, 1, -0.5, 0.5, 0.5,
-3.712468, -2, -5.543601, 1, 1.5, 0.5, 0.5,
-3.712468, -2, -5.543601, 0, 1.5, 0.5, 0.5,
-3.712468, -1, -5.543601, 0, -0.5, 0.5, 0.5,
-3.712468, -1, -5.543601, 1, -0.5, 0.5, 0.5,
-3.712468, -1, -5.543601, 1, 1.5, 0.5, 0.5,
-3.712468, -1, -5.543601, 0, 1.5, 0.5, 0.5,
-3.712468, 0, -5.543601, 0, -0.5, 0.5, 0.5,
-3.712468, 0, -5.543601, 1, -0.5, 0.5, 0.5,
-3.712468, 0, -5.543601, 1, 1.5, 0.5, 0.5,
-3.712468, 0, -5.543601, 0, 1.5, 0.5, 0.5,
-3.712468, 1, -5.543601, 0, -0.5, 0.5, 0.5,
-3.712468, 1, -5.543601, 1, -0.5, 0.5, 0.5,
-3.712468, 1, -5.543601, 1, 1.5, 0.5, 0.5,
-3.712468, 1, -5.543601, 0, 1.5, 0.5, 0.5,
-3.712468, 2, -5.543601, 0, -0.5, 0.5, 0.5,
-3.712468, 2, -5.543601, 1, -0.5, 0.5, 0.5,
-3.712468, 2, -5.543601, 1, 1.5, 0.5, 0.5,
-3.712468, 2, -5.543601, 0, 1.5, 0.5, 0.5,
-3.712468, 3, -5.543601, 0, -0.5, 0.5, 0.5,
-3.712468, 3, -5.543601, 1, -0.5, 0.5, 0.5,
-3.712468, 3, -5.543601, 1, 1.5, 0.5, 0.5,
-3.712468, 3, -5.543601, 0, 1.5, 0.5, 0.5
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
-3.218382, -3.140287, -4,
-3.218382, -3.140287, 4,
-3.218382, -3.140287, -4,
-3.383077, -3.296071, -4,
-3.218382, -3.140287, -2,
-3.383077, -3.296071, -2,
-3.218382, -3.140287, 0,
-3.383077, -3.296071, 0,
-3.218382, -3.140287, 2,
-3.383077, -3.296071, 2,
-3.218382, -3.140287, 4,
-3.383077, -3.296071, 4
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
-3.712468, -3.607638, -4, 0, -0.5, 0.5, 0.5,
-3.712468, -3.607638, -4, 1, -0.5, 0.5, 0.5,
-3.712468, -3.607638, -4, 1, 1.5, 0.5, 0.5,
-3.712468, -3.607638, -4, 0, 1.5, 0.5, 0.5,
-3.712468, -3.607638, -2, 0, -0.5, 0.5, 0.5,
-3.712468, -3.607638, -2, 1, -0.5, 0.5, 0.5,
-3.712468, -3.607638, -2, 1, 1.5, 0.5, 0.5,
-3.712468, -3.607638, -2, 0, 1.5, 0.5, 0.5,
-3.712468, -3.607638, 0, 0, -0.5, 0.5, 0.5,
-3.712468, -3.607638, 0, 1, -0.5, 0.5, 0.5,
-3.712468, -3.607638, 0, 1, 1.5, 0.5, 0.5,
-3.712468, -3.607638, 0, 0, 1.5, 0.5, 0.5,
-3.712468, -3.607638, 2, 0, -0.5, 0.5, 0.5,
-3.712468, -3.607638, 2, 1, -0.5, 0.5, 0.5,
-3.712468, -3.607638, 2, 1, 1.5, 0.5, 0.5,
-3.712468, -3.607638, 2, 0, 1.5, 0.5, 0.5,
-3.712468, -3.607638, 4, 0, -0.5, 0.5, 0.5,
-3.712468, -3.607638, 4, 1, -0.5, 0.5, 0.5,
-3.712468, -3.607638, 4, 1, 1.5, 0.5, 0.5,
-3.712468, -3.607638, 4, 0, 1.5, 0.5, 0.5
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
-3.218382, -3.140287, -4.735882,
-3.218382, 3.091063, -4.735882,
-3.218382, -3.140287, 6.033711,
-3.218382, 3.091063, 6.033711,
-3.218382, -3.140287, -4.735882,
-3.218382, -3.140287, 6.033711,
-3.218382, 3.091063, -4.735882,
-3.218382, 3.091063, 6.033711,
-3.218382, -3.140287, -4.735882,
3.369428, -3.140287, -4.735882,
-3.218382, -3.140287, 6.033711,
3.369428, -3.140287, 6.033711,
-3.218382, 3.091063, -4.735882,
3.369428, 3.091063, -4.735882,
-3.218382, 3.091063, 6.033711,
3.369428, 3.091063, 6.033711,
3.369428, -3.140287, -4.735882,
3.369428, 3.091063, -4.735882,
3.369428, -3.140287, 6.033711,
3.369428, 3.091063, 6.033711,
3.369428, -3.140287, -4.735882,
3.369428, -3.140287, 6.033711,
3.369428, 3.091063, -4.735882,
3.369428, 3.091063, 6.033711
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
var radius = 7.517815;
var distance = 33.44761;
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
mvMatrix.translate( -0.07552326, 0.02461219, -0.6489146 );
mvMatrix.scale( 1.233856, 1.304438, 0.7547554 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.44761);
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
phenisopham<-read.table("phenisopham.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phenisopham$V2
```

```
## Error in eval(expr, envir, enclos): object 'phenisopham' not found
```

```r
y<-phenisopham$V3
```

```
## Error in eval(expr, envir, enclos): object 'phenisopham' not found
```

```r
z<-phenisopham$V4
```

```
## Error in eval(expr, envir, enclos): object 'phenisopham' not found
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
-3.122443, -0.344719, -1.131685, 0, 0, 1, 1, 1,
-2.860757, 0.1553683, 1.52457, 1, 0, 0, 1, 1,
-2.786016, -1.143064, -1.941234, 1, 0, 0, 1, 1,
-2.656898, 2.600831, -1.696046, 1, 0, 0, 1, 1,
-2.656872, -0.5676104, 0.6183904, 1, 0, 0, 1, 1,
-2.648752, -0.1770133, -1.183593, 1, 0, 0, 1, 1,
-2.629725, 2.225744, -1.573304, 0, 0, 0, 1, 1,
-2.500029, 0.5798233, -0.6758255, 0, 0, 0, 1, 1,
-2.476056, -0.1853365, -1.46892, 0, 0, 0, 1, 1,
-2.454232, -1.47721, -1.465823, 0, 0, 0, 1, 1,
-2.437814, -0.7573603, -1.828052, 0, 0, 0, 1, 1,
-2.422863, -0.3023511, -0.5372218, 0, 0, 0, 1, 1,
-2.419978, 0.610392, -1.452854, 0, 0, 0, 1, 1,
-2.419474, -0.6194876, -2.255166, 1, 1, 1, 1, 1,
-2.169101, -1.122696, -4.107577, 1, 1, 1, 1, 1,
-2.145082, -0.5923919, -2.212987, 1, 1, 1, 1, 1,
-2.110742, 1.143835, -0.7838899, 1, 1, 1, 1, 1,
-2.101541, -0.4321997, -1.120427, 1, 1, 1, 1, 1,
-2.095788, 1.76631, -0.362464, 1, 1, 1, 1, 1,
-2.092933, -0.6350884, -1.60031, 1, 1, 1, 1, 1,
-2.081505, 0.6279348, -1.642472, 1, 1, 1, 1, 1,
-2.062095, 0.1635848, -0.894008, 1, 1, 1, 1, 1,
-2.048649, 1.176017, -1.110485, 1, 1, 1, 1, 1,
-2.031567, -0.05006101, -1.663317, 1, 1, 1, 1, 1,
-2.010607, 0.3394172, -0.3007534, 1, 1, 1, 1, 1,
-2.006057, -1.185741, -1.790512, 1, 1, 1, 1, 1,
-1.996678, -0.5511719, -0.720151, 1, 1, 1, 1, 1,
-1.981332, -0.3470401, -1.744171, 1, 1, 1, 1, 1,
-1.978647, -1.126344, -3.296705, 0, 0, 1, 1, 1,
-1.971955, -0.7349749, -2.19342, 1, 0, 0, 1, 1,
-1.953069, -0.5350901, -1.9879, 1, 0, 0, 1, 1,
-1.935378, 0.3695591, -0.9807848, 1, 0, 0, 1, 1,
-1.933532, 0.8569506, -0.297446, 1, 0, 0, 1, 1,
-1.930696, 1.250667, 0.3855375, 1, 0, 0, 1, 1,
-1.904658, -0.8332223, -3.047827, 0, 0, 0, 1, 1,
-1.90153, -0.3524763, -2.031616, 0, 0, 0, 1, 1,
-1.85828, -0.3227905, -2.045043, 0, 0, 0, 1, 1,
-1.858055, 0.07306282, -0.5206696, 0, 0, 0, 1, 1,
-1.852738, 1.360641, -0.7245043, 0, 0, 0, 1, 1,
-1.84238, 0.7123743, -1.030351, 0, 0, 0, 1, 1,
-1.801821, 0.09144464, -1.702658, 0, 0, 0, 1, 1,
-1.79951, -0.6627447, -0.8612845, 1, 1, 1, 1, 1,
-1.78046, 1.637383, -0.7911233, 1, 1, 1, 1, 1,
-1.77638, -1.350291, -1.717579, 1, 1, 1, 1, 1,
-1.736393, 0.4268997, -0.2673568, 1, 1, 1, 1, 1,
-1.723374, 1.489825, 0.3647048, 1, 1, 1, 1, 1,
-1.718882, 0.1176625, -0.6454292, 1, 1, 1, 1, 1,
-1.716571, 0.2227219, -1.275984, 1, 1, 1, 1, 1,
-1.708951, -0.826546, -1.122118, 1, 1, 1, 1, 1,
-1.69965, -0.7578534, -0.5537987, 1, 1, 1, 1, 1,
-1.697428, 0.05926853, -2.796851, 1, 1, 1, 1, 1,
-1.683298, 2.09929, -0.9087447, 1, 1, 1, 1, 1,
-1.639827, 1.253652, -1.817729, 1, 1, 1, 1, 1,
-1.61006, 0.1602444, -2.652689, 1, 1, 1, 1, 1,
-1.60476, 1.034952, -1.590287, 1, 1, 1, 1, 1,
-1.597355, -0.5140975, -1.273919, 1, 1, 1, 1, 1,
-1.595022, -0.1528075, -1.468826, 0, 0, 1, 1, 1,
-1.591933, -0.6348881, -3.08654, 1, 0, 0, 1, 1,
-1.585646, 1.621886, -0.4694194, 1, 0, 0, 1, 1,
-1.571373, 0.2422389, -1.651592, 1, 0, 0, 1, 1,
-1.562985, 0.4548352, -0.9190769, 1, 0, 0, 1, 1,
-1.560112, 0.710453, 0.8544316, 1, 0, 0, 1, 1,
-1.551781, -0.9928583, -2.235808, 0, 0, 0, 1, 1,
-1.544783, -0.211525, -1.780806, 0, 0, 0, 1, 1,
-1.543745, -0.09177786, -1.056457, 0, 0, 0, 1, 1,
-1.540597, -0.1947782, -0.5673335, 0, 0, 0, 1, 1,
-1.536549, 0.4424307, 0.5329002, 0, 0, 0, 1, 1,
-1.527448, 2.355493, 0.2657065, 0, 0, 0, 1, 1,
-1.527192, 1.839793, -1.871863, 0, 0, 0, 1, 1,
-1.525375, -0.07906319, -0.8610398, 1, 1, 1, 1, 1,
-1.51135, 0.5996925, -1.684203, 1, 1, 1, 1, 1,
-1.510713, -0.5281463, -0.4206032, 1, 1, 1, 1, 1,
-1.498468, 1.085808, -0.8565447, 1, 1, 1, 1, 1,
-1.495115, -1.209143, -1.171457, 1, 1, 1, 1, 1,
-1.490909, -0.03124326, -1.159709, 1, 1, 1, 1, 1,
-1.489727, 0.2502161, -0.86024, 1, 1, 1, 1, 1,
-1.477335, -0.9120079, -3.514437, 1, 1, 1, 1, 1,
-1.473237, 0.5696758, -2.01321, 1, 1, 1, 1, 1,
-1.46559, -0.07018045, 0.2609973, 1, 1, 1, 1, 1,
-1.46296, -2.257337, -3.166819, 1, 1, 1, 1, 1,
-1.444409, -0.7538014, -1.48733, 1, 1, 1, 1, 1,
-1.44115, 0.485306, -1.054376, 1, 1, 1, 1, 1,
-1.441076, 0.8984727, 0.6243829, 1, 1, 1, 1, 1,
-1.44102, -1.421822, -1.830847, 1, 1, 1, 1, 1,
-1.415297, -1.168693, -2.624633, 0, 0, 1, 1, 1,
-1.412174, -0.4589109, -1.997252, 1, 0, 0, 1, 1,
-1.410413, 0.9817502, -1.716695, 1, 0, 0, 1, 1,
-1.402641, -1.229034, -2.577754, 1, 0, 0, 1, 1,
-1.402353, -0.6509352, -1.095277, 1, 0, 0, 1, 1,
-1.397885, -0.8486973, -1.199474, 1, 0, 0, 1, 1,
-1.390323, -1.320325, -2.649054, 0, 0, 0, 1, 1,
-1.390114, 0.0830562, -0.9310188, 0, 0, 0, 1, 1,
-1.37709, -0.411239, -1.852456, 0, 0, 0, 1, 1,
-1.376958, 0.6018654, -1.785532, 0, 0, 0, 1, 1,
-1.376708, -0.5801055, -3.840617, 0, 0, 0, 1, 1,
-1.369818, 0.09393475, 0.2812238, 0, 0, 0, 1, 1,
-1.366798, 1.055567, -1.280017, 0, 0, 0, 1, 1,
-1.366275, -0.9625313, 0.4095792, 1, 1, 1, 1, 1,
-1.357223, -1.905637, -2.998497, 1, 1, 1, 1, 1,
-1.356024, -2.004548, -1.552956, 1, 1, 1, 1, 1,
-1.353088, 1.255565, -1.946836, 1, 1, 1, 1, 1,
-1.327973, -0.1045576, -0.806412, 1, 1, 1, 1, 1,
-1.312479, 1.277718, -3.042909, 1, 1, 1, 1, 1,
-1.300844, -0.4938619, -1.701713, 1, 1, 1, 1, 1,
-1.29783, -0.3210302, -2.104864, 1, 1, 1, 1, 1,
-1.297092, -0.765721, -1.527698, 1, 1, 1, 1, 1,
-1.293733, 1.10509, -2.528699, 1, 1, 1, 1, 1,
-1.291987, -0.4056168, -3.203755, 1, 1, 1, 1, 1,
-1.291748, 1.050276, -1.918227, 1, 1, 1, 1, 1,
-1.282608, -0.2915975, -0.7549768, 1, 1, 1, 1, 1,
-1.263349, 0.426404, -0.9799232, 1, 1, 1, 1, 1,
-1.257798, -1.001014, -1.678924, 1, 1, 1, 1, 1,
-1.251694, 1.913833, 0.2423644, 0, 0, 1, 1, 1,
-1.251178, -1.008865, -1.153666, 1, 0, 0, 1, 1,
-1.243384, 0.3547772, -1.367922, 1, 0, 0, 1, 1,
-1.236184, -0.3993132, -2.112602, 1, 0, 0, 1, 1,
-1.21568, 1.086117, -1.770648, 1, 0, 0, 1, 1,
-1.213017, 0.1321678, -2.258901, 1, 0, 0, 1, 1,
-1.186681, 1.381749, -1.711086, 0, 0, 0, 1, 1,
-1.181106, 0.2907844, -2.445884, 0, 0, 0, 1, 1,
-1.176806, -1.235767, -2.853403, 0, 0, 0, 1, 1,
-1.168487, -0.8308339, -1.64975, 0, 0, 0, 1, 1,
-1.167757, 0.9555193, -1.571944, 0, 0, 0, 1, 1,
-1.161452, -0.3918412, -1.301037, 0, 0, 0, 1, 1,
-1.157118, 1.401975, -1.684112, 0, 0, 0, 1, 1,
-1.155205, -0.8332993, -2.695113, 1, 1, 1, 1, 1,
-1.153899, -0.5821618, -1.770152, 1, 1, 1, 1, 1,
-1.151933, 0.05357167, -2.91939, 1, 1, 1, 1, 1,
-1.15087, 0.2318065, -0.127046, 1, 1, 1, 1, 1,
-1.149343, 1.540303, 0.2990054, 1, 1, 1, 1, 1,
-1.14798, -1.08315, -1.66426, 1, 1, 1, 1, 1,
-1.134361, -1.432272, -3.225547, 1, 1, 1, 1, 1,
-1.132766, -0.7183902, -1.438786, 1, 1, 1, 1, 1,
-1.128059, -1.650704, -3.095554, 1, 1, 1, 1, 1,
-1.123149, 0.6578354, -1.414606, 1, 1, 1, 1, 1,
-1.118894, 1.069758, 0.06612358, 1, 1, 1, 1, 1,
-1.118414, -0.01742813, -3.582284, 1, 1, 1, 1, 1,
-1.115946, -0.3205985, -2.646581, 1, 1, 1, 1, 1,
-1.115406, -0.9080182, -2.434022, 1, 1, 1, 1, 1,
-1.112688, -0.3297977, -2.944958, 1, 1, 1, 1, 1,
-1.112245, -0.6166288, -1.863352, 0, 0, 1, 1, 1,
-1.111404, -0.1370612, -1.756652, 1, 0, 0, 1, 1,
-1.084736, 0.1677374, -1.98865, 1, 0, 0, 1, 1,
-1.080142, -0.1283456, -3.025032, 1, 0, 0, 1, 1,
-1.077441, -0.2627281, -2.394014, 1, 0, 0, 1, 1,
-1.067677, 0.2463962, -1.344879, 1, 0, 0, 1, 1,
-1.06686, 0.4915994, 0.08449859, 0, 0, 0, 1, 1,
-1.062416, -0.6671978, -1.680799, 0, 0, 0, 1, 1,
-1.059085, 0.7453549, -1.723552, 0, 0, 0, 1, 1,
-1.054118, 2.328592, -1.273788, 0, 0, 0, 1, 1,
-1.049874, 0.9985331, -2.686316, 0, 0, 0, 1, 1,
-1.043696, 1.382279, -1.244812, 0, 0, 0, 1, 1,
-1.043672, -1.378541, -3.804465, 0, 0, 0, 1, 1,
-1.032971, -1.260727, -4.460219, 1, 1, 1, 1, 1,
-1.031886, 1.81617, 0.7123618, 1, 1, 1, 1, 1,
-1.021362, -1.054654, 0.1961802, 1, 1, 1, 1, 1,
-1.02038, -0.2386099, -2.795048, 1, 1, 1, 1, 1,
-1.015895, 0.2751169, -3.577092, 1, 1, 1, 1, 1,
-1.012991, 1.299029, 0.8128801, 1, 1, 1, 1, 1,
-1.012696, -0.03296583, -3.410493, 1, 1, 1, 1, 1,
-1.008371, 0.3152629, -0.1350227, 1, 1, 1, 1, 1,
-1.007113, 0.3502831, -0.0287366, 1, 1, 1, 1, 1,
-0.9989533, 0.6155329, -0.7777174, 1, 1, 1, 1, 1,
-0.9974593, -0.9752833, -1.741834, 1, 1, 1, 1, 1,
-0.996924, -0.6389554, -1.9591, 1, 1, 1, 1, 1,
-0.9962559, 0.9567558, -1.447864, 1, 1, 1, 1, 1,
-0.9902105, 0.9469156, -0.5880234, 1, 1, 1, 1, 1,
-0.9846565, -2.59115, -2.165502, 1, 1, 1, 1, 1,
-0.9829766, 0.4175766, -1.74221, 0, 0, 1, 1, 1,
-0.9778847, 0.8528007, 0.378875, 1, 0, 0, 1, 1,
-0.9735089, -0.4887789, -3.260462, 1, 0, 0, 1, 1,
-0.9653102, 0.5681169, -1.885384, 1, 0, 0, 1, 1,
-0.9631771, -0.6703969, -2.153449, 1, 0, 0, 1, 1,
-0.9625582, 0.4562162, 0.8001462, 1, 0, 0, 1, 1,
-0.9618769, 0.4777179, -0.5611588, 0, 0, 0, 1, 1,
-0.9568433, -0.810815, -2.560019, 0, 0, 0, 1, 1,
-0.955981, 0.3754299, -0.9008991, 0, 0, 0, 1, 1,
-0.955291, -0.4111296, -2.884417, 0, 0, 0, 1, 1,
-0.9527125, -1.23691, -3.284222, 0, 0, 0, 1, 1,
-0.9459084, 0.9147319, -0.2365422, 0, 0, 0, 1, 1,
-0.9458196, -1.061911, -3.457025, 0, 0, 0, 1, 1,
-0.9399502, -0.3962649, -1.96087, 1, 1, 1, 1, 1,
-0.9374464, 1.956418, -1.372256, 1, 1, 1, 1, 1,
-0.9356582, 0.2597771, -0.722912, 1, 1, 1, 1, 1,
-0.9308079, -1.010093, -1.427909, 1, 1, 1, 1, 1,
-0.9302281, -1.029352, -2.08842, 1, 1, 1, 1, 1,
-0.929566, 0.4322926, -1.770068, 1, 1, 1, 1, 1,
-0.9288207, 0.9250444, -1.522911, 1, 1, 1, 1, 1,
-0.9147429, -0.01991134, -2.931127, 1, 1, 1, 1, 1,
-0.9128057, 1.663118, -0.2704484, 1, 1, 1, 1, 1,
-0.9124038, 0.0398303, -2.778748, 1, 1, 1, 1, 1,
-0.9068763, -0.470468, -1.011986, 1, 1, 1, 1, 1,
-0.9061571, 0.3813347, -0.491096, 1, 1, 1, 1, 1,
-0.9049859, 1.116114, 0.02735089, 1, 1, 1, 1, 1,
-0.9037003, -0.08780956, -0.4226327, 1, 1, 1, 1, 1,
-0.8899153, -0.897787, -1.075729, 1, 1, 1, 1, 1,
-0.8783016, 1.875417, 0.5857395, 0, 0, 1, 1, 1,
-0.8731715, -0.4840487, -0.8973241, 1, 0, 0, 1, 1,
-0.863566, 1.61123, 0.7849998, 1, 0, 0, 1, 1,
-0.8635451, 0.7347411, -0.4588553, 1, 0, 0, 1, 1,
-0.8621902, 0.706793, -0.3277273, 1, 0, 0, 1, 1,
-0.8607849, 0.0588752, -2.445889, 1, 0, 0, 1, 1,
-0.8604124, -1.105636, -3.309038, 0, 0, 0, 1, 1,
-0.8601313, -1.016326, -2.985275, 0, 0, 0, 1, 1,
-0.8594172, -0.2303248, 0.03744363, 0, 0, 0, 1, 1,
-0.8558241, 0.634624, -2.333138, 0, 0, 0, 1, 1,
-0.8411066, -1.141597, -2.231665, 0, 0, 0, 1, 1,
-0.8335834, 0.1724743, -1.126879, 0, 0, 0, 1, 1,
-0.8300502, -1.461334, -3.37075, 0, 0, 0, 1, 1,
-0.8284355, 0.5725979, -1.93672, 1, 1, 1, 1, 1,
-0.8081649, 0.3276948, -1.824682, 1, 1, 1, 1, 1,
-0.7963603, 0.5266718, -1.150806, 1, 1, 1, 1, 1,
-0.7959803, 0.7407147, -0.003436737, 1, 1, 1, 1, 1,
-0.794868, 1.108218, -0.4141429, 1, 1, 1, 1, 1,
-0.7936877, -0.2412898, -1.296806, 1, 1, 1, 1, 1,
-0.793219, 0.1005178, -2.627186, 1, 1, 1, 1, 1,
-0.7911306, -1.05291, -4.457011, 1, 1, 1, 1, 1,
-0.7861801, 0.5574334, -0.6587319, 1, 1, 1, 1, 1,
-0.7848678, 0.01992137, -2.634605, 1, 1, 1, 1, 1,
-0.782027, -2.819928, -1.886358, 1, 1, 1, 1, 1,
-0.7782886, 0.5044196, 1.615964, 1, 1, 1, 1, 1,
-0.7746651, 0.4287847, -0.1078667, 1, 1, 1, 1, 1,
-0.7740634, 0.4598593, -0.9947046, 1, 1, 1, 1, 1,
-0.7694904, -0.2130503, -1.129004, 1, 1, 1, 1, 1,
-0.7637668, 0.611222, 0.4842471, 0, 0, 1, 1, 1,
-0.762465, -0.1950096, -0.8423087, 1, 0, 0, 1, 1,
-0.7610239, 1.182514, -0.4517161, 1, 0, 0, 1, 1,
-0.7541922, 0.1561867, -2.541729, 1, 0, 0, 1, 1,
-0.7517596, -0.3820898, -1.362135, 1, 0, 0, 1, 1,
-0.7506045, 0.2776147, -2.167313, 1, 0, 0, 1, 1,
-0.750401, -0.4669078, -1.829935, 0, 0, 0, 1, 1,
-0.747372, 0.2242246, -0.02708879, 0, 0, 0, 1, 1,
-0.7465272, -0.2071015, -1.9061, 0, 0, 0, 1, 1,
-0.741549, -1.079269, -1.739862, 0, 0, 0, 1, 1,
-0.7336627, 0.2660478, -0.708128, 0, 0, 0, 1, 1,
-0.7251557, 0.3540929, -2.438634, 0, 0, 0, 1, 1,
-0.7180762, -1.202952, -2.127758, 0, 0, 0, 1, 1,
-0.7121923, -0.0697762, -1.742782, 1, 1, 1, 1, 1,
-0.7110611, -1.529822, -1.937959, 1, 1, 1, 1, 1,
-0.7110326, 1.319466, -2.235758, 1, 1, 1, 1, 1,
-0.7014446, -0.4831975, -1.216735, 1, 1, 1, 1, 1,
-0.6941347, -0.2270038, -0.7770401, 1, 1, 1, 1, 1,
-0.6937729, -0.8576834, -2.502334, 1, 1, 1, 1, 1,
-0.6887869, 1.108757, -1.151201, 1, 1, 1, 1, 1,
-0.6866248, 0.4942649, -1.405828, 1, 1, 1, 1, 1,
-0.6849453, -0.2678691, -0.9252053, 1, 1, 1, 1, 1,
-0.6766182, 1.381101, -0.4351987, 1, 1, 1, 1, 1,
-0.6762193, 1.129124, -0.7748492, 1, 1, 1, 1, 1,
-0.664091, 0.8124985, -1.118015, 1, 1, 1, 1, 1,
-0.6640591, 0.2041191, -2.271699, 1, 1, 1, 1, 1,
-0.6637849, 0.5388409, -0.7478644, 1, 1, 1, 1, 1,
-0.6594877, 0.4506774, -1.250209, 1, 1, 1, 1, 1,
-0.6590419, -0.2473574, -2.743627, 0, 0, 1, 1, 1,
-0.6581891, -0.7641956, -2.343895, 1, 0, 0, 1, 1,
-0.6529199, 0.04679153, -2.976784, 1, 0, 0, 1, 1,
-0.6527144, -1.067229, -3.635422, 1, 0, 0, 1, 1,
-0.6520101, 1.163398, -0.03596652, 1, 0, 0, 1, 1,
-0.6518836, 0.7067148, -0.7276789, 1, 0, 0, 1, 1,
-0.6508272, 0.2117119, -3.084567, 0, 0, 0, 1, 1,
-0.6496668, -0.4521542, -1.387388, 0, 0, 0, 1, 1,
-0.6482048, -0.3512131, -0.7984449, 0, 0, 0, 1, 1,
-0.6479644, 0.7087208, -1.176296, 0, 0, 0, 1, 1,
-0.644459, -1.303676, -1.809022, 0, 0, 0, 1, 1,
-0.6398041, -1.08365, -1.860702, 0, 0, 0, 1, 1,
-0.6318266, 0.7753742, -1.48405, 0, 0, 0, 1, 1,
-0.6306335, -0.9321843, -3.693651, 1, 1, 1, 1, 1,
-0.6288353, 0.2043894, -2.790347, 1, 1, 1, 1, 1,
-0.6265975, -0.6125295, -3.59238, 1, 1, 1, 1, 1,
-0.6243328, 0.8953268, 0.1498615, 1, 1, 1, 1, 1,
-0.6209334, 0.4033689, 0.02412345, 1, 1, 1, 1, 1,
-0.6200113, -0.9809468, -1.734443, 1, 1, 1, 1, 1,
-0.6189159, 0.8271575, -0.09325816, 1, 1, 1, 1, 1,
-0.6149771, 0.001019167, -2.103223, 1, 1, 1, 1, 1,
-0.6099089, -2.019457, -0.8423984, 1, 1, 1, 1, 1,
-0.606767, 0.7735472, -2.262498, 1, 1, 1, 1, 1,
-0.606674, -0.3353075, -2.877918, 1, 1, 1, 1, 1,
-0.606473, -0.4550892, -1.503227, 1, 1, 1, 1, 1,
-0.5925205, -1.676009, -2.230432, 1, 1, 1, 1, 1,
-0.5911693, -0.04438956, 0.3900178, 1, 1, 1, 1, 1,
-0.5907027, -0.7378054, -1.659366, 1, 1, 1, 1, 1,
-0.5905129, 0.7355144, -0.6336424, 0, 0, 1, 1, 1,
-0.5904506, 0.9718413, -1.631763, 1, 0, 0, 1, 1,
-0.5899894, -0.8350153, -3.496637, 1, 0, 0, 1, 1,
-0.5889563, 0.5546932, -1.770711, 1, 0, 0, 1, 1,
-0.5864778, 0.1693922, -2.28746, 1, 0, 0, 1, 1,
-0.5732852, 2.286003, 0.4883324, 1, 0, 0, 1, 1,
-0.571928, 0.1477136, -0.07726707, 0, 0, 0, 1, 1,
-0.5579272, 0.5090925, -0.31968, 0, 0, 0, 1, 1,
-0.5549951, 1.322508, -2.038066, 0, 0, 0, 1, 1,
-0.5504633, -0.417557, -1.213447, 0, 0, 0, 1, 1,
-0.5478367, -1.011715, -2.855241, 0, 0, 0, 1, 1,
-0.5398101, 0.30365, -0.006282371, 0, 0, 0, 1, 1,
-0.5393947, -0.5383633, -3.592597, 0, 0, 0, 1, 1,
-0.5386435, 1.32359, 0.8364738, 1, 1, 1, 1, 1,
-0.5373147, -1.374581, -0.8078101, 1, 1, 1, 1, 1,
-0.537088, 1.329484, -1.100638, 1, 1, 1, 1, 1,
-0.5332455, -1.471383, -1.754391, 1, 1, 1, 1, 1,
-0.532884, 0.1226201, -0.3283053, 1, 1, 1, 1, 1,
-0.5301868, -0.765417, -0.691027, 1, 1, 1, 1, 1,
-0.5283214, -1.740277, -4.518186, 1, 1, 1, 1, 1,
-0.5275008, -1.830544, -3.24906, 1, 1, 1, 1, 1,
-0.5268334, 1.183038, -0.2390829, 1, 1, 1, 1, 1,
-0.5252751, -0.4205653, -1.877517, 1, 1, 1, 1, 1,
-0.5200185, 0.3944164, -1.994025, 1, 1, 1, 1, 1,
-0.5179976, 0.6473171, -2.422316, 1, 1, 1, 1, 1,
-0.5174675, 0.2367209, -1.297191, 1, 1, 1, 1, 1,
-0.5161825, -0.3540967, -1.04896, 1, 1, 1, 1, 1,
-0.5145733, 0.07923689, -1.925652, 1, 1, 1, 1, 1,
-0.5136438, 2.492219, -0.3552698, 0, 0, 1, 1, 1,
-0.510503, -1.026272, -1.889673, 1, 0, 0, 1, 1,
-0.5104336, -0.4591253, -1.473727, 1, 0, 0, 1, 1,
-0.5088331, -0.8160738, -1.267488, 1, 0, 0, 1, 1,
-0.5033386, 0.3996656, -3.353504, 1, 0, 0, 1, 1,
-0.5021709, 0.2512049, 0.353196, 1, 0, 0, 1, 1,
-0.5013602, 0.1788994, -1.904724, 0, 0, 0, 1, 1,
-0.4811068, -1.183571, -2.485561, 0, 0, 0, 1, 1,
-0.4796346, 0.7877184, -1.103829, 0, 0, 0, 1, 1,
-0.4772561, 0.2534519, 0.3354832, 0, 0, 0, 1, 1,
-0.4771458, 0.5390798, -0.006912086, 0, 0, 0, 1, 1,
-0.4648418, -0.1329444, -0.6406815, 0, 0, 0, 1, 1,
-0.463834, -0.4321478, -4.051817, 0, 0, 0, 1, 1,
-0.4612448, 1.456458, -1.754634, 1, 1, 1, 1, 1,
-0.4610984, -0.09388103, -2.66725, 1, 1, 1, 1, 1,
-0.4552413, -0.1135998, -3.060744, 1, 1, 1, 1, 1,
-0.4543089, -0.5037, -2.638012, 1, 1, 1, 1, 1,
-0.4520953, -0.3870374, -1.629217, 1, 1, 1, 1, 1,
-0.4506681, 0.3056084, -2.602756, 1, 1, 1, 1, 1,
-0.446082, -0.8026525, -2.901681, 1, 1, 1, 1, 1,
-0.442368, -1.139498, -3.24255, 1, 1, 1, 1, 1,
-0.4371412, 0.4162725, 0.5208619, 1, 1, 1, 1, 1,
-0.4293117, -0.8286831, -1.934081, 1, 1, 1, 1, 1,
-0.4235602, -0.6976883, -3.132292, 1, 1, 1, 1, 1,
-0.4222482, -0.5446873, -0.9001464, 1, 1, 1, 1, 1,
-0.4208874, -1.371753, -2.533235, 1, 1, 1, 1, 1,
-0.4201215, 0.547618, -0.8280469, 1, 1, 1, 1, 1,
-0.4198885, 0.299332, -1.155409, 1, 1, 1, 1, 1,
-0.4194708, 0.4315277, -1.3984, 0, 0, 1, 1, 1,
-0.4081693, -1.052061, -1.698735, 1, 0, 0, 1, 1,
-0.4073884, 1.049003, -2.030366, 1, 0, 0, 1, 1,
-0.4032059, 0.4312979, -0.3001533, 1, 0, 0, 1, 1,
-0.3965687, 1.262414, -2.405382, 1, 0, 0, 1, 1,
-0.3927617, -2.197805, -3.925275, 1, 0, 0, 1, 1,
-0.3923256, 0.1584711, -0.6384799, 0, 0, 0, 1, 1,
-0.3891479, -0.7092669, -3.001048, 0, 0, 0, 1, 1,
-0.3837057, -0.627954, -2.715198, 0, 0, 0, 1, 1,
-0.3793312, 1.213594, -0.4775974, 0, 0, 0, 1, 1,
-0.3776374, -0.725472, -2.675943, 0, 0, 0, 1, 1,
-0.3774262, 0.3661612, 0.08564182, 0, 0, 0, 1, 1,
-0.3713558, 0.7916778, 0.1479131, 0, 0, 0, 1, 1,
-0.3687966, 0.8239378, 0.7027067, 1, 1, 1, 1, 1,
-0.3686539, 0.723604, -2.159688, 1, 1, 1, 1, 1,
-0.3669933, 0.402622, -0.3458126, 1, 1, 1, 1, 1,
-0.3656006, -0.4683341, -2.245101, 1, 1, 1, 1, 1,
-0.364732, -2.274552, -0.9718375, 1, 1, 1, 1, 1,
-0.3636029, 0.2691493, -1.749747, 1, 1, 1, 1, 1,
-0.3634895, 0.01696259, -1.830296, 1, 1, 1, 1, 1,
-0.3623289, -0.04522954, -2.265301, 1, 1, 1, 1, 1,
-0.3610835, -1.764117, -4.205904, 1, 1, 1, 1, 1,
-0.3587903, 0.3934849, -0.6900635, 1, 1, 1, 1, 1,
-0.358069, 0.4496526, -0.5564676, 1, 1, 1, 1, 1,
-0.3568712, 0.06284134, -2.518995, 1, 1, 1, 1, 1,
-0.356046, 2.489727, -0.2666582, 1, 1, 1, 1, 1,
-0.3546434, -0.56969, -2.177215, 1, 1, 1, 1, 1,
-0.3503121, -2.025315, -3.415191, 1, 1, 1, 1, 1,
-0.3455773, -1.245219, -3.085675, 0, 0, 1, 1, 1,
-0.3370696, 0.693805, -2.309067, 1, 0, 0, 1, 1,
-0.3298399, 0.1350309, 0.04987102, 1, 0, 0, 1, 1,
-0.3279611, 0.5625809, -1.171946, 1, 0, 0, 1, 1,
-0.3258007, -0.303152, -3.055503, 1, 0, 0, 1, 1,
-0.3234301, -0.09865671, -2.230524, 1, 0, 0, 1, 1,
-0.3231149, 0.2646607, -0.5896512, 0, 0, 0, 1, 1,
-0.3219175, 0.004649657, -1.121094, 0, 0, 0, 1, 1,
-0.3178911, 0.4910735, -1.086057, 0, 0, 0, 1, 1,
-0.3152961, -0.2710244, -1.604027, 0, 0, 0, 1, 1,
-0.3137001, 0.1698885, -3.555783, 0, 0, 0, 1, 1,
-0.3128029, -0.1742553, -3.422913, 0, 0, 0, 1, 1,
-0.3126484, 0.8620403, -1.468286, 0, 0, 0, 1, 1,
-0.3126443, -0.6860983, -0.4066341, 1, 1, 1, 1, 1,
-0.3125523, -0.8481983, -0.1677776, 1, 1, 1, 1, 1,
-0.304272, -0.960447, -2.362154, 1, 1, 1, 1, 1,
-0.301641, -0.1390015, -2.241374, 1, 1, 1, 1, 1,
-0.3011814, 2.359007, -1.128253, 1, 1, 1, 1, 1,
-0.2963135, 0.9458256, 0.5527388, 1, 1, 1, 1, 1,
-0.2950681, 0.04566847, -2.570774, 1, 1, 1, 1, 1,
-0.287979, -0.5710555, -2.464591, 1, 1, 1, 1, 1,
-0.2819332, 0.1025508, -1.094882, 1, 1, 1, 1, 1,
-0.2785169, -0.5496365, -2.303316, 1, 1, 1, 1, 1,
-0.2778606, -0.01288917, -2.53905, 1, 1, 1, 1, 1,
-0.2761394, 0.4608728, -0.2927034, 1, 1, 1, 1, 1,
-0.2753199, 0.4827273, 0.5877322, 1, 1, 1, 1, 1,
-0.2745639, 0.9013414, -0.3198903, 1, 1, 1, 1, 1,
-0.2733802, 1.425921, -1.343015, 1, 1, 1, 1, 1,
-0.2725106, -0.9249819, -2.063662, 0, 0, 1, 1, 1,
-0.2704376, -0.9744443, -1.018973, 1, 0, 0, 1, 1,
-0.2693261, -0.8159136, -2.399201, 1, 0, 0, 1, 1,
-0.2676934, 0.5306073, -0.164997, 1, 0, 0, 1, 1,
-0.2673553, 1.404124, 1.906454, 1, 0, 0, 1, 1,
-0.2617437, 0.2295164, -0.7536289, 1, 0, 0, 1, 1,
-0.2606634, 0.6479379, 0.9767507, 0, 0, 0, 1, 1,
-0.2579283, -0.3816578, -2.436599, 0, 0, 0, 1, 1,
-0.2573572, 0.5872157, -1.944483, 0, 0, 0, 1, 1,
-0.2494947, -1.856281, -3.209474, 0, 0, 0, 1, 1,
-0.2484898, 0.8873084, -0.8750179, 0, 0, 0, 1, 1,
-0.2475968, -0.3274953, -2.813422, 0, 0, 0, 1, 1,
-0.2474654, 0.4244103, -0.4541906, 0, 0, 0, 1, 1,
-0.2454655, 0.4068786, -0.5377872, 1, 1, 1, 1, 1,
-0.2451222, 0.2564511, -1.289332, 1, 1, 1, 1, 1,
-0.2408943, 0.6341889, -1.468325, 1, 1, 1, 1, 1,
-0.2395181, -0.284262, -3.444906, 1, 1, 1, 1, 1,
-0.2348326, 0.379738, 0.251011, 1, 1, 1, 1, 1,
-0.234798, -0.4650108, -2.805933, 1, 1, 1, 1, 1,
-0.2345938, -0.901018, -2.746709, 1, 1, 1, 1, 1,
-0.2324303, -0.4421179, -2.248497, 1, 1, 1, 1, 1,
-0.2172986, 0.2583597, -0.9241419, 1, 1, 1, 1, 1,
-0.2141733, -2.492961, -3.476682, 1, 1, 1, 1, 1,
-0.2134082, 1.928212, -0.1808088, 1, 1, 1, 1, 1,
-0.2130481, 0.6862693, -1.002823, 1, 1, 1, 1, 1,
-0.210599, -0.6476704, -1.594464, 1, 1, 1, 1, 1,
-0.2052311, -2.574492, -4.136757, 1, 1, 1, 1, 1,
-0.2043343, -0.9233521, -3.623295, 1, 1, 1, 1, 1,
-0.2036726, -0.6455963, -3.896811, 0, 0, 1, 1, 1,
-0.2017573, -0.8980417, -2.056167, 1, 0, 0, 1, 1,
-0.1984889, 0.365482, -0.9633166, 1, 0, 0, 1, 1,
-0.1982227, 1.182443, -1.244071, 1, 0, 0, 1, 1,
-0.1973798, 2.041573, 0.3245158, 1, 0, 0, 1, 1,
-0.1970763, 0.6116233, 1.094684, 1, 0, 0, 1, 1,
-0.1961313, -0.9879678, -3.595894, 0, 0, 0, 1, 1,
-0.1957591, 1.261178, -2.446661, 0, 0, 0, 1, 1,
-0.1945606, 0.2961836, -0.6367877, 0, 0, 0, 1, 1,
-0.1932674, -0.134648, -2.003074, 0, 0, 0, 1, 1,
-0.1777584, 1.603271, -1.307989, 0, 0, 0, 1, 1,
-0.1774764, -1.030588, -4.374149, 0, 0, 0, 1, 1,
-0.173496, -0.9605183, -4.187847, 0, 0, 0, 1, 1,
-0.1652462, 0.1466005, -0.9540361, 1, 1, 1, 1, 1,
-0.1605387, 0.8401914, -0.004145032, 1, 1, 1, 1, 1,
-0.1573535, 0.1501832, 0.7011755, 1, 1, 1, 1, 1,
-0.1554112, -1.494299, -2.562212, 1, 1, 1, 1, 1,
-0.1540836, 0.8543487, 0.9857852, 1, 1, 1, 1, 1,
-0.1488135, 1.381244, -0.5033959, 1, 1, 1, 1, 1,
-0.1440064, 0.665782, -0.4333865, 1, 1, 1, 1, 1,
-0.1409982, -1.596449, -1.554909, 1, 1, 1, 1, 1,
-0.1403432, -0.4201558, -2.807014, 1, 1, 1, 1, 1,
-0.1396343, -0.6999743, -0.6924673, 1, 1, 1, 1, 1,
-0.1389428, -0.5280753, -2.850405, 1, 1, 1, 1, 1,
-0.1301355, 0.1440325, -1.041755, 1, 1, 1, 1, 1,
-0.1262108, -0.857857, -3.09436, 1, 1, 1, 1, 1,
-0.1223303, -0.3499292, -3.54595, 1, 1, 1, 1, 1,
-0.1216792, 2.001525, 1.948768, 1, 1, 1, 1, 1,
-0.1208269, -0.2183066, -4.579043, 0, 0, 1, 1, 1,
-0.1193334, -0.343451, -2.475114, 1, 0, 0, 1, 1,
-0.118746, -2.085625, -4.308716, 1, 0, 0, 1, 1,
-0.1062228, 0.2639315, -0.8072705, 1, 0, 0, 1, 1,
-0.1060173, -1.234365, -2.993415, 1, 0, 0, 1, 1,
-0.1054305, -0.05513392, -0.8306876, 1, 0, 0, 1, 1,
-0.1033492, 0.01570596, 1.109228, 0, 0, 0, 1, 1,
-0.09631759, 0.2615539, -2.265979, 0, 0, 0, 1, 1,
-0.0963065, 0.5246322, 0.3573253, 0, 0, 0, 1, 1,
-0.09323202, 0.03951323, 0.5887703, 0, 0, 0, 1, 1,
-0.08897406, -0.2780255, -3.954592, 0, 0, 0, 1, 1,
-0.08863971, 0.2887986, -0.6405166, 0, 0, 0, 1, 1,
-0.08804706, 0.03991961, -1.047465, 0, 0, 0, 1, 1,
-0.08724528, 1.58893, 0.4203872, 1, 1, 1, 1, 1,
-0.08693976, -0.5230238, -2.802706, 1, 1, 1, 1, 1,
-0.08668859, 0.6040903, -1.937508, 1, 1, 1, 1, 1,
-0.07974775, -0.8627375, -3.724097, 1, 1, 1, 1, 1,
-0.07740699, -0.8573577, -3.515417, 1, 1, 1, 1, 1,
-0.07695109, -0.2258565, -1.4538, 1, 1, 1, 1, 1,
-0.07527546, 0.5061128, 0.6743708, 1, 1, 1, 1, 1,
-0.07388173, -1.310132, -2.236022, 1, 1, 1, 1, 1,
-0.07337997, 3.000315, -0.4497674, 1, 1, 1, 1, 1,
-0.06993504, -1.092002, -4.555172, 1, 1, 1, 1, 1,
-0.06313893, -0.5893732, -1.479628, 1, 1, 1, 1, 1,
-0.06207778, -0.4384879, -4.057391, 1, 1, 1, 1, 1,
-0.05990174, 0.6562919, -0.7407775, 1, 1, 1, 1, 1,
-0.0586682, 1.677963, -1.015458, 1, 1, 1, 1, 1,
-0.05854957, -0.9466208, -4.172207, 1, 1, 1, 1, 1,
-0.05783595, -0.8629587, -4.239541, 0, 0, 1, 1, 1,
-0.05366108, 0.6283072, -1.091419, 1, 0, 0, 1, 1,
-0.05230551, -1.919429, -3.027257, 1, 0, 0, 1, 1,
-0.05019428, -0.4861249, -2.858879, 1, 0, 0, 1, 1,
-0.04381827, -2.356151, -2.408709, 1, 0, 0, 1, 1,
-0.04010159, -1.57979, -2.656139, 1, 0, 0, 1, 1,
-0.03087284, 1.066338, 0.2713076, 0, 0, 0, 1, 1,
-0.02849951, 0.8640067, -0.1418146, 0, 0, 0, 1, 1,
-0.02414209, 1.003863, 0.2687438, 0, 0, 0, 1, 1,
-0.02085724, -1.393901, -3.547105, 0, 0, 0, 1, 1,
-0.01428129, -1.530449, -3.538303, 0, 0, 0, 1, 1,
-0.0135763, -1.531786, -3.00257, 0, 0, 0, 1, 1,
-0.01312265, 1.235362, -0.5197132, 0, 0, 0, 1, 1,
-0.005139039, 0.407592, 1.419599, 1, 1, 1, 1, 1,
-0.004857232, -0.5522429, -4.177566, 1, 1, 1, 1, 1,
-0.003528761, 1.43365, 0.1763368, 1, 1, 1, 1, 1,
-0.002881916, -1.150147, -3.479985, 1, 1, 1, 1, 1,
-0.002619324, 0.6863744, -0.785937, 1, 1, 1, 1, 1,
-0.002455244, 0.4705102, -0.9628597, 1, 1, 1, 1, 1,
-0.001539953, -0.111969, -2.166842, 1, 1, 1, 1, 1,
0.002911153, 1.249258, -1.235972, 1, 1, 1, 1, 1,
0.003022801, -0.8831919, 3.574161, 1, 1, 1, 1, 1,
0.003515332, -0.3657035, 1.701286, 1, 1, 1, 1, 1,
0.004221212, -1.420548, 2.628917, 1, 1, 1, 1, 1,
0.006239538, -1.117257, 2.808981, 1, 1, 1, 1, 1,
0.007653063, -0.6689644, 3.431381, 1, 1, 1, 1, 1,
0.01087095, 0.6292353, 0.3197916, 1, 1, 1, 1, 1,
0.02008135, -1.631552, 1.083847, 1, 1, 1, 1, 1,
0.02733543, 0.3689849, -1.141637, 0, 0, 1, 1, 1,
0.0379227, 1.934065, 0.6620073, 1, 0, 0, 1, 1,
0.03947543, 0.5590428, -0.8751204, 1, 0, 0, 1, 1,
0.04115394, -0.1563304, 2.278205, 1, 0, 0, 1, 1,
0.04497578, -1.123998, 2.460274, 1, 0, 0, 1, 1,
0.04792808, -0.8492575, 3.878564, 1, 0, 0, 1, 1,
0.04829621, 0.4369063, 0.1446012, 0, 0, 0, 1, 1,
0.04919146, -1.289187, 3.712863, 0, 0, 0, 1, 1,
0.05130762, -0.988373, 3.228128, 0, 0, 0, 1, 1,
0.05139055, -1.121703, 2.512702, 0, 0, 0, 1, 1,
0.05211276, -0.6873432, 2.677186, 0, 0, 0, 1, 1,
0.05736606, 0.3345461, 1.322021, 0, 0, 0, 1, 1,
0.05961775, 0.02075595, 2.995549, 0, 0, 0, 1, 1,
0.06212909, 0.2301489, -0.3709415, 1, 1, 1, 1, 1,
0.06360694, 0.5834339, 0.8359098, 1, 1, 1, 1, 1,
0.06399275, -1.477787, 3.434786, 1, 1, 1, 1, 1,
0.06680414, 0.8521891, 1.543127, 1, 1, 1, 1, 1,
0.06961742, -0.03917885, 1.095263, 1, 1, 1, 1, 1,
0.07343313, 0.7941867, 0.03120058, 1, 1, 1, 1, 1,
0.07408068, -0.03941538, 1.805949, 1, 1, 1, 1, 1,
0.08074587, 0.6540377, 0.2591317, 1, 1, 1, 1, 1,
0.08540295, 0.6348834, -0.5125628, 1, 1, 1, 1, 1,
0.08556312, -0.1216621, 3.32576, 1, 1, 1, 1, 1,
0.08950768, -0.8301876, 3.589955, 1, 1, 1, 1, 1,
0.09007236, -0.03266582, 0.9931859, 1, 1, 1, 1, 1,
0.09145249, 0.8161688, 0.2812324, 1, 1, 1, 1, 1,
0.09181499, 1.554861, -1.992373, 1, 1, 1, 1, 1,
0.09618876, 0.1150853, 0.9039105, 1, 1, 1, 1, 1,
0.09713452, -0.8106831, 2.034014, 0, 0, 1, 1, 1,
0.099245, 0.6502662, -1.024465, 1, 0, 0, 1, 1,
0.1030588, 0.8966821, -0.07338468, 1, 0, 0, 1, 1,
0.1032142, -0.5826413, 2.826483, 1, 0, 0, 1, 1,
0.1040976, -0.4845658, 2.348031, 1, 0, 0, 1, 1,
0.1042724, -1.08747, 2.955177, 1, 0, 0, 1, 1,
0.105291, -2.798575, 4.194761, 0, 0, 0, 1, 1,
0.1074088, -0.08359757, 1.996904, 0, 0, 0, 1, 1,
0.115438, -0.6823912, 1.673628, 0, 0, 0, 1, 1,
0.1179258, -1.244261, 2.434402, 0, 0, 0, 1, 1,
0.1180436, -0.2522232, 0.8530339, 0, 0, 0, 1, 1,
0.1255701, 1.69655, 2.53341, 0, 0, 0, 1, 1,
0.1281757, -2.251817, 4.068971, 0, 0, 0, 1, 1,
0.1285869, 1.253705, -0.427788, 1, 1, 1, 1, 1,
0.1324817, -0.2944268, 3.713289, 1, 1, 1, 1, 1,
0.1345064, -0.2492436, 2.128826, 1, 1, 1, 1, 1,
0.1349905, -2.099734, 1.207868, 1, 1, 1, 1, 1,
0.1360655, 0.8571836, -0.8901361, 1, 1, 1, 1, 1,
0.136198, 1.263261, -1.215621, 1, 1, 1, 1, 1,
0.1368652, -0.05585787, 0.3763571, 1, 1, 1, 1, 1,
0.1373401, -0.4284598, 2.535043, 1, 1, 1, 1, 1,
0.1384488, -1.797214, 1.433763, 1, 1, 1, 1, 1,
0.1392798, -0.8529497, 3.12536, 1, 1, 1, 1, 1,
0.1445076, 0.8221832, 0.7367675, 1, 1, 1, 1, 1,
0.1493204, 0.4760728, 0.4451606, 1, 1, 1, 1, 1,
0.1531526, 1.36913, 0.9474307, 1, 1, 1, 1, 1,
0.1532021, 1.863657, -0.7468871, 1, 1, 1, 1, 1,
0.1544856, -0.0118045, 3.160478, 1, 1, 1, 1, 1,
0.1555808, 0.744764, -0.1757187, 0, 0, 1, 1, 1,
0.1560707, -0.8406734, 1.375287, 1, 0, 0, 1, 1,
0.1590793, -0.1442546, 1.947126, 1, 0, 0, 1, 1,
0.1620772, -1.479338, 2.782493, 1, 0, 0, 1, 1,
0.1639956, -1.022459, 4.035945, 1, 0, 0, 1, 1,
0.17449, 0.8864071, -1.650308, 1, 0, 0, 1, 1,
0.1766159, 0.03349769, 1.746146, 0, 0, 0, 1, 1,
0.1769992, -0.4868846, 1.62744, 0, 0, 0, 1, 1,
0.1779253, 0.9891402, -0.2190023, 0, 0, 0, 1, 1,
0.1781384, 1.615586, 1.655007, 0, 0, 0, 1, 1,
0.1799293, 0.2298219, 0.3315862, 0, 0, 0, 1, 1,
0.1810934, -0.7979562, 1.336907, 0, 0, 0, 1, 1,
0.1886409, 0.7817974, 0.2368952, 0, 0, 0, 1, 1,
0.1912288, -0.1706655, 1.294857, 1, 1, 1, 1, 1,
0.1932158, -1.799154, 2.868353, 1, 1, 1, 1, 1,
0.1963526, 1.065675, -1.148383, 1, 1, 1, 1, 1,
0.198517, 0.1459653, 1.536784, 1, 1, 1, 1, 1,
0.1992533, 0.6072957, 1.037873, 1, 1, 1, 1, 1,
0.1998944, -0.08817565, 1.404722, 1, 1, 1, 1, 1,
0.2021107, 1.214715, 1.746836, 1, 1, 1, 1, 1,
0.2038155, 0.487563, 1.545724, 1, 1, 1, 1, 1,
0.2069772, 1.644821, 0.3155232, 1, 1, 1, 1, 1,
0.2168635, -0.5213326, 2.393829, 1, 1, 1, 1, 1,
0.2178521, 0.843446, 0.11018, 1, 1, 1, 1, 1,
0.2202918, -0.2549181, 1.988652, 1, 1, 1, 1, 1,
0.2290944, 1.541875, 0.7136203, 1, 1, 1, 1, 1,
0.2295264, 0.6048871, 1.289454, 1, 1, 1, 1, 1,
0.2417641, -1.955073, 2.080009, 1, 1, 1, 1, 1,
0.2471549, 1.712849, -0.017426, 0, 0, 1, 1, 1,
0.2484198, -0.622449, 3.111391, 1, 0, 0, 1, 1,
0.2503385, 0.3556191, 0.4130628, 1, 0, 0, 1, 1,
0.2549856, 1.611122, 1.374477, 1, 0, 0, 1, 1,
0.2608723, -0.6939216, 1.665808, 1, 0, 0, 1, 1,
0.2612977, -0.8147669, 4.14875, 1, 0, 0, 1, 1,
0.2676917, -0.2218523, 1.504688, 0, 0, 0, 1, 1,
0.2692567, 1.473126, -0.01527448, 0, 0, 0, 1, 1,
0.2711281, 0.6448646, -0.2300751, 0, 0, 0, 1, 1,
0.2713124, 0.08867323, 2.154695, 0, 0, 0, 1, 1,
0.2724109, -0.6031132, 4.789566, 0, 0, 0, 1, 1,
0.2752553, -0.6440968, 1.473072, 0, 0, 0, 1, 1,
0.2801237, -1.523055, 1.413521, 0, 0, 0, 1, 1,
0.2828048, 0.3657663, -1.294976, 1, 1, 1, 1, 1,
0.2831175, -0.5164408, 2.543083, 1, 1, 1, 1, 1,
0.2870896, -0.123198, 0.5578544, 1, 1, 1, 1, 1,
0.2883812, -1.51222, 3.105389, 1, 1, 1, 1, 1,
0.2884561, 0.4577612, 0.5104007, 1, 1, 1, 1, 1,
0.2886672, -2.111352, 5.876872, 1, 1, 1, 1, 1,
0.2907587, -1.012762, 3.1925, 1, 1, 1, 1, 1,
0.2954289, 0.5392911, -0.243918, 1, 1, 1, 1, 1,
0.2959187, -0.9099364, 2.177499, 1, 1, 1, 1, 1,
0.296004, -0.0389682, 2.840866, 1, 1, 1, 1, 1,
0.2997115, 0.8053192, 0.5047909, 1, 1, 1, 1, 1,
0.3000796, 0.9916344, -1.264571, 1, 1, 1, 1, 1,
0.3033578, 1.818072, -0.1206281, 1, 1, 1, 1, 1,
0.3062893, 0.6870055, -1.304883, 1, 1, 1, 1, 1,
0.306317, 0.08349141, 0.964346, 1, 1, 1, 1, 1,
0.3087115, -0.1731445, 3.022406, 0, 0, 1, 1, 1,
0.3118001, 0.9514968, -0.3809652, 1, 0, 0, 1, 1,
0.3135667, -0.4352486, 0.8144041, 1, 0, 0, 1, 1,
0.3146397, -0.2118382, 2.306655, 1, 0, 0, 1, 1,
0.3163607, -0.8108026, 3.079577, 1, 0, 0, 1, 1,
0.3181693, -2.309863, 4.334724, 1, 0, 0, 1, 1,
0.3224183, -0.3866335, 2.805009, 0, 0, 0, 1, 1,
0.3269773, 0.2123367, -0.08586183, 0, 0, 0, 1, 1,
0.3288811, -0.4417151, 1.739361, 0, 0, 0, 1, 1,
0.3309368, 0.08614536, 0.07027013, 0, 0, 0, 1, 1,
0.331144, -1.442901, 3.159146, 0, 0, 0, 1, 1,
0.3334497, -1.532602, 1.432196, 0, 0, 0, 1, 1,
0.3337494, -0.9404129, 3.978161, 0, 0, 0, 1, 1,
0.3349333, 0.134273, 0.1351925, 1, 1, 1, 1, 1,
0.3362445, -0.3581521, 3.702712, 1, 1, 1, 1, 1,
0.3377326, 0.5061049, 0.6607478, 1, 1, 1, 1, 1,
0.3535607, 1.210838, 1.618263, 1, 1, 1, 1, 1,
0.3677744, -1.410047, 3.711087, 1, 1, 1, 1, 1,
0.3703757, 1.041021, 0.1389902, 1, 1, 1, 1, 1,
0.3731556, 1.505457, 1.413588, 1, 1, 1, 1, 1,
0.3736171, -0.189557, 1.700562, 1, 1, 1, 1, 1,
0.3764763, -0.08145047, 1.703834, 1, 1, 1, 1, 1,
0.3804517, 1.364586, 0.7297139, 1, 1, 1, 1, 1,
0.3886943, -0.8511589, 4.004826, 1, 1, 1, 1, 1,
0.3890793, 0.6212279, -1.010047, 1, 1, 1, 1, 1,
0.3898287, -2.514465, 2.80723, 1, 1, 1, 1, 1,
0.3970115, 2.576197, -1.015452, 1, 1, 1, 1, 1,
0.3972256, -0.3632483, 2.418552, 1, 1, 1, 1, 1,
0.3982998, -0.8056747, 3.504891, 0, 0, 1, 1, 1,
0.3994433, -0.8411563, 1.344132, 1, 0, 0, 1, 1,
0.4014066, -0.3016595, 1.479882, 1, 0, 0, 1, 1,
0.4098899, 0.3523361, 1.858086, 1, 0, 0, 1, 1,
0.4101413, 0.5504015, 0.585835, 1, 0, 0, 1, 1,
0.4117473, -1.810981, 2.134904, 1, 0, 0, 1, 1,
0.4121844, 0.8808831, 0.7016191, 0, 0, 0, 1, 1,
0.4183475, -0.08744987, 1.119573, 0, 0, 0, 1, 1,
0.4229909, -0.5633829, 1.270839, 0, 0, 0, 1, 1,
0.4253514, -2.17346, 3.454105, 0, 0, 0, 1, 1,
0.4358009, -3.049539, 1.669806, 0, 0, 0, 1, 1,
0.4365962, 0.1805959, 1.307077, 0, 0, 0, 1, 1,
0.436831, -0.407649, 3.008431, 0, 0, 0, 1, 1,
0.4388377, -2.17529, 4.035563, 1, 1, 1, 1, 1,
0.4419152, -0.7499325, 2.007877, 1, 1, 1, 1, 1,
0.4429203, 0.117735, 1.671057, 1, 1, 1, 1, 1,
0.4469011, 0.2806145, 0.1818948, 1, 1, 1, 1, 1,
0.4516494, -0.8053877, 1.520407, 1, 1, 1, 1, 1,
0.4546323, 1.047611, 0.5638469, 1, 1, 1, 1, 1,
0.4572343, 0.6858849, 1.435994, 1, 1, 1, 1, 1,
0.4591542, 0.2694867, 0.9281307, 1, 1, 1, 1, 1,
0.4624604, -1.199038, 2.140238, 1, 1, 1, 1, 1,
0.4703537, -1.137166, 2.703564, 1, 1, 1, 1, 1,
0.4717177, 1.000504, -0.4017504, 1, 1, 1, 1, 1,
0.4726968, 0.5832344, 0.1190732, 1, 1, 1, 1, 1,
0.4773916, -0.8526084, 1.542354, 1, 1, 1, 1, 1,
0.4797925, -1.525713, 2.646269, 1, 1, 1, 1, 1,
0.482572, -0.1233459, 1.397787, 1, 1, 1, 1, 1,
0.4828761, -1.025258, 1.703595, 0, 0, 1, 1, 1,
0.4846662, 0.1530299, 2.239647, 1, 0, 0, 1, 1,
0.4866842, 0.1870369, 1.41898, 1, 0, 0, 1, 1,
0.4874638, -0.6651483, 2.931584, 1, 0, 0, 1, 1,
0.4927784, 2.884998, 1.030641, 1, 0, 0, 1, 1,
0.5004023, -1.549883, 3.725054, 1, 0, 0, 1, 1,
0.5101345, 0.6219923, -2.220103, 0, 0, 0, 1, 1,
0.5116562, -1.006216, 1.435629, 0, 0, 0, 1, 1,
0.513567, 0.2008597, 0.9462191, 0, 0, 0, 1, 1,
0.5159684, -0.082022, 2.34304, 0, 0, 0, 1, 1,
0.5234866, 0.2355897, 1.967211, 0, 0, 0, 1, 1,
0.5237038, -0.29788, 2.477188, 0, 0, 0, 1, 1,
0.5242312, 0.2360078, 0.1843014, 0, 0, 0, 1, 1,
0.533375, 1.199971, 1.921196, 1, 1, 1, 1, 1,
0.5343683, 1.289311, 0.4736106, 1, 1, 1, 1, 1,
0.5412456, -0.8862857, 3.417013, 1, 1, 1, 1, 1,
0.541272, -1.446763, 3.058073, 1, 1, 1, 1, 1,
0.5426734, 0.7682608, 1.031491, 1, 1, 1, 1, 1,
0.5432713, -0.1455852, 3.216087, 1, 1, 1, 1, 1,
0.5450397, 1.090606, -0.221925, 1, 1, 1, 1, 1,
0.5457781, -0.7790403, 2.600852, 1, 1, 1, 1, 1,
0.5491248, -0.7016208, 2.840801, 1, 1, 1, 1, 1,
0.5521701, 0.560146, 1.189614, 1, 1, 1, 1, 1,
0.5627561, 1.179909, -0.136851, 1, 1, 1, 1, 1,
0.5691875, 0.1952405, 1.428418, 1, 1, 1, 1, 1,
0.5710443, -1.414702, 1.956609, 1, 1, 1, 1, 1,
0.5715089, 0.6326611, 1.780832, 1, 1, 1, 1, 1,
0.5781331, -0.6467426, 0.7627252, 1, 1, 1, 1, 1,
0.5822555, 0.3563845, 1.284342, 0, 0, 1, 1, 1,
0.5857458, -1.871487, 2.675282, 1, 0, 0, 1, 1,
0.5895975, -2.07641, 2.487419, 1, 0, 0, 1, 1,
0.5901265, 1.545778, -0.04313283, 1, 0, 0, 1, 1,
0.5902689, 0.077269, 0.6209756, 1, 0, 0, 1, 1,
0.5908082, 0.9343836, 0.6007661, 1, 0, 0, 1, 1,
0.5974116, -0.006847159, 2.702694, 0, 0, 0, 1, 1,
0.5981619, 1.414818, -1.165663, 0, 0, 0, 1, 1,
0.5989559, 0.8651873, 1.507439, 0, 0, 0, 1, 1,
0.5992931, 1.476122, -0.7779145, 0, 0, 0, 1, 1,
0.6049429, -0.2818836, 1.614426, 0, 0, 0, 1, 1,
0.6073853, 0.2440331, 0.9230626, 0, 0, 0, 1, 1,
0.6076574, 0.1290074, 1.303542, 0, 0, 0, 1, 1,
0.6133831, -1.142045, 3.94658, 1, 1, 1, 1, 1,
0.6161243, -0.2906293, 1.278997, 1, 1, 1, 1, 1,
0.6224155, -0.5350701, 3.260116, 1, 1, 1, 1, 1,
0.6242534, 0.1985862, 1.694901, 1, 1, 1, 1, 1,
0.6265008, -0.7493392, 3.071068, 1, 1, 1, 1, 1,
0.6317554, 0.1825766, 2.373839, 1, 1, 1, 1, 1,
0.6351252, 0.302977, 0.1217609, 1, 1, 1, 1, 1,
0.6352388, 0.1850717, -0.1058915, 1, 1, 1, 1, 1,
0.6372433, -0.2581344, 1.112381, 1, 1, 1, 1, 1,
0.6375864, 0.3060886, 0.1526838, 1, 1, 1, 1, 1,
0.6411492, -0.6476266, 1.983383, 1, 1, 1, 1, 1,
0.6484643, -1.435523, 2.444593, 1, 1, 1, 1, 1,
0.6489127, -1.054705, 1.760308, 1, 1, 1, 1, 1,
0.6492884, -0.5129181, 2.094674, 1, 1, 1, 1, 1,
0.6549056, -0.8030387, 2.945587, 1, 1, 1, 1, 1,
0.6564676, 0.9245382, 1.420144, 0, 0, 1, 1, 1,
0.657101, 0.4546207, 0.4009454, 1, 0, 0, 1, 1,
0.6658022, 1.663859, 2.086055, 1, 0, 0, 1, 1,
0.672256, 0.4753217, 0.4937044, 1, 0, 0, 1, 1,
0.6742032, -1.44631, 3.504935, 1, 0, 0, 1, 1,
0.6757626, 0.3991591, 0.6637979, 1, 0, 0, 1, 1,
0.6772483, -0.4405328, 2.965618, 0, 0, 0, 1, 1,
0.6786956, 0.109702, -0.454091, 0, 0, 0, 1, 1,
0.6796376, -0.7887487, 3.23048, 0, 0, 0, 1, 1,
0.6839296, 2.241786, -0.4089955, 0, 0, 0, 1, 1,
0.6860116, -1.405308, -0.3086739, 0, 0, 0, 1, 1,
0.688754, 0.7422401, -0.585807, 0, 0, 0, 1, 1,
0.6898446, 0.6981903, -0.7573299, 0, 0, 0, 1, 1,
0.6909952, -1.257971, 3.893357, 1, 1, 1, 1, 1,
0.6929561, -0.6150845, 1.765819, 1, 1, 1, 1, 1,
0.6963678, -0.116731, 1.602661, 1, 1, 1, 1, 1,
0.6981072, 1.23483, 1.199317, 1, 1, 1, 1, 1,
0.6993256, -0.5379457, 1.888344, 1, 1, 1, 1, 1,
0.7036135, -1.191505, 3.052784, 1, 1, 1, 1, 1,
0.7085161, 0.3143139, -0.04582261, 1, 1, 1, 1, 1,
0.7154257, -0.3061733, 2.845796, 1, 1, 1, 1, 1,
0.7174261, -0.1886778, 3.893257, 1, 1, 1, 1, 1,
0.7210651, -0.6209257, 2.949219, 1, 1, 1, 1, 1,
0.7214795, -1.133692, 1.862487, 1, 1, 1, 1, 1,
0.7227547, 0.6116894, 1.379075, 1, 1, 1, 1, 1,
0.7273223, 0.2977598, 1.916584, 1, 1, 1, 1, 1,
0.7277699, 0.5181437, -0.1554532, 1, 1, 1, 1, 1,
0.734571, -0.3877136, 3.486028, 1, 1, 1, 1, 1,
0.7437066, -0.4662817, 1.428977, 0, 0, 1, 1, 1,
0.7519985, -0.3150622, 2.772021, 1, 0, 0, 1, 1,
0.7587438, -1.629811, 3.242517, 1, 0, 0, 1, 1,
0.7652798, -1.975138, 2.985751, 1, 0, 0, 1, 1,
0.767884, -1.612576, 3.006588, 1, 0, 0, 1, 1,
0.7710437, -0.3046758, 2.023576, 1, 0, 0, 1, 1,
0.7722442, -0.8550203, 1.370036, 0, 0, 0, 1, 1,
0.7729908, -0.5974903, 2.457492, 0, 0, 0, 1, 1,
0.780125, 0.5836557, 1.114916, 0, 0, 0, 1, 1,
0.7832289, 0.06533786, -0.8154528, 0, 0, 0, 1, 1,
0.7833697, -1.271037, 3.661581, 0, 0, 0, 1, 1,
0.784736, -0.6263435, 1.785619, 0, 0, 0, 1, 1,
0.7874509, -1.129236, 2.736909, 0, 0, 0, 1, 1,
0.7882244, -0.8379715, 2.636718, 1, 1, 1, 1, 1,
0.7971379, -0.5070179, 0.8871176, 1, 1, 1, 1, 1,
0.7999617, -0.1355396, 1.775999, 1, 1, 1, 1, 1,
0.8002084, 0.02309467, 0.9254416, 1, 1, 1, 1, 1,
0.806336, -0.4202249, 2.853907, 1, 1, 1, 1, 1,
0.808297, -0.40181, 3.205408, 1, 1, 1, 1, 1,
0.8095033, 1.94742, 2.62526, 1, 1, 1, 1, 1,
0.8149632, 0.3058774, 0.8479432, 1, 1, 1, 1, 1,
0.8170531, -0.8866455, 2.548254, 1, 1, 1, 1, 1,
0.8185701, 0.8726855, 0.2950614, 1, 1, 1, 1, 1,
0.8240459, -0.3835036, 3.143277, 1, 1, 1, 1, 1,
0.8256704, -1.031373, 4.440068, 1, 1, 1, 1, 1,
0.8260298, 0.5008222, 1.22723, 1, 1, 1, 1, 1,
0.8273772, 0.04583304, 2.167391, 1, 1, 1, 1, 1,
0.8280835, 0.6330494, 2.900446, 1, 1, 1, 1, 1,
0.8294186, -1.347776, 2.42868, 0, 0, 1, 1, 1,
0.8349735, -0.2208683, 1.596571, 1, 0, 0, 1, 1,
0.8369323, 0.5283903, 2.53977, 1, 0, 0, 1, 1,
0.8409617, -1.441753, 1.797035, 1, 0, 0, 1, 1,
0.8440844, -1.476716, 2.513841, 1, 0, 0, 1, 1,
0.8475265, -0.9579388, 4.345491, 1, 0, 0, 1, 1,
0.8497989, 0.8631269, 0.3235281, 0, 0, 0, 1, 1,
0.8532868, -1.072489, 1.764966, 0, 0, 0, 1, 1,
0.855151, 0.6228694, 0.193227, 0, 0, 0, 1, 1,
0.8553253, 0.3368256, -0.3466076, 0, 0, 0, 1, 1,
0.8574815, -0.4398007, 2.844625, 0, 0, 0, 1, 1,
0.8589447, 0.3648958, -0.883854, 0, 0, 0, 1, 1,
0.8617522, -0.3560412, 2.996687, 0, 0, 0, 1, 1,
0.8625816, 0.06833625, 0.7637298, 1, 1, 1, 1, 1,
0.863924, 0.8549861, 0.6854171, 1, 1, 1, 1, 1,
0.8644069, -0.09262317, 2.799833, 1, 1, 1, 1, 1,
0.8647728, -0.7987658, 0.6470087, 1, 1, 1, 1, 1,
0.8709378, 0.7024141, 2.307048, 1, 1, 1, 1, 1,
0.8731031, 1.598338, 0.5962093, 1, 1, 1, 1, 1,
0.8798779, 0.6174031, 1.647822, 1, 1, 1, 1, 1,
0.8825148, -1.36134, -0.1998275, 1, 1, 1, 1, 1,
0.8853737, -1.155097, 3.050392, 1, 1, 1, 1, 1,
0.8879602, -1.282118, 1.789756, 1, 1, 1, 1, 1,
0.8897175, 0.6209091, 0.7130784, 1, 1, 1, 1, 1,
0.8963807, 1.967865, -1.008538, 1, 1, 1, 1, 1,
0.9017397, -1.31481, 2.348756, 1, 1, 1, 1, 1,
0.9018717, 0.3161588, 0.5004008, 1, 1, 1, 1, 1,
0.9055996, 0.3581646, 1.757278, 1, 1, 1, 1, 1,
0.905769, -0.5462418, 3.480573, 0, 0, 1, 1, 1,
0.907241, 0.02230175, 2.179335, 1, 0, 0, 1, 1,
0.9081534, -0.2066984, -0.5087014, 1, 0, 0, 1, 1,
0.9158437, -1.082261, 2.528888, 1, 0, 0, 1, 1,
0.916124, -0.9374484, 2.305524, 1, 0, 0, 1, 1,
0.9194314, -0.9057335, 3.717259, 1, 0, 0, 1, 1,
0.9222005, 0.3469386, -0.8555735, 0, 0, 0, 1, 1,
0.9368275, -0.3043422, 2.907887, 0, 0, 0, 1, 1,
0.9386923, 1.543487, 0.866806, 0, 0, 0, 1, 1,
0.9395654, 0.7774554, 1.486131, 0, 0, 0, 1, 1,
0.9517458, -0.7944414, 3.77469, 0, 0, 0, 1, 1,
0.9531516, -1.550789, 3.894454, 0, 0, 0, 1, 1,
0.9532827, -0.2132252, 3.152645, 0, 0, 0, 1, 1,
0.9546196, 0.434158, 0.9348474, 1, 1, 1, 1, 1,
0.9557764, 0.5323251, 2.228512, 1, 1, 1, 1, 1,
0.9597243, -0.8868171, 3.967913, 1, 1, 1, 1, 1,
0.9657138, -1.043274, 1.568235, 1, 1, 1, 1, 1,
0.9770952, 0.7975517, 2.022569, 1, 1, 1, 1, 1,
0.9858868, -0.9140559, 3.166543, 1, 1, 1, 1, 1,
0.9896204, -1.116307, 2.281171, 1, 1, 1, 1, 1,
0.996882, 1.817827, -0.03316846, 1, 1, 1, 1, 1,
1.003335, -1.103435, 1.741563, 1, 1, 1, 1, 1,
1.007495, 0.6215855, 1.873362, 1, 1, 1, 1, 1,
1.014104, 0.5960905, 0.1609072, 1, 1, 1, 1, 1,
1.01437, 0.7137803, 1.386461, 1, 1, 1, 1, 1,
1.015347, -0.4840454, 0.6315501, 1, 1, 1, 1, 1,
1.018059, 0.7481852, -0.7696254, 1, 1, 1, 1, 1,
1.018937, 0.07736142, 4.352895, 1, 1, 1, 1, 1,
1.024911, 0.2743852, 1.190148, 0, 0, 1, 1, 1,
1.02686, -0.3156928, 2.664055, 1, 0, 0, 1, 1,
1.031688, -0.370087, 1.713601, 1, 0, 0, 1, 1,
1.035038, -0.5466808, 1.845315, 1, 0, 0, 1, 1,
1.039951, 1.188196, 1.855413, 1, 0, 0, 1, 1,
1.04302, -0.6057089, 2.991482, 1, 0, 0, 1, 1,
1.049207, 0.5225948, 3.059226, 0, 0, 0, 1, 1,
1.051298, 0.183027, 0.988273, 0, 0, 0, 1, 1,
1.066395, -0.2080958, 1.415341, 0, 0, 0, 1, 1,
1.066918, -0.5023293, 4.025716, 0, 0, 0, 1, 1,
1.072692, 0.4870593, 0.8462557, 0, 0, 0, 1, 1,
1.075378, -1.186671, 4.067743, 0, 0, 0, 1, 1,
1.077886, 0.04265748, 0.9539658, 0, 0, 0, 1, 1,
1.086783, 0.6593927, 1.44723, 1, 1, 1, 1, 1,
1.089143, 0.6981282, 0.5700352, 1, 1, 1, 1, 1,
1.094401, -0.1543745, 0.9833443, 1, 1, 1, 1, 1,
1.099074, -0.09153307, 2.539648, 1, 1, 1, 1, 1,
1.11288, 0.3277729, 1.258461, 1, 1, 1, 1, 1,
1.114342, -1.414376, 2.186657, 1, 1, 1, 1, 1,
1.118031, -0.5943174, 1.067508, 1, 1, 1, 1, 1,
1.118923, -1.164652, 1.045144, 1, 1, 1, 1, 1,
1.120989, 0.1159745, 1.356096, 1, 1, 1, 1, 1,
1.126189, -0.2192977, 3.618958, 1, 1, 1, 1, 1,
1.134247, -0.1917806, 1.66666, 1, 1, 1, 1, 1,
1.135771, -0.3853663, 1.551046, 1, 1, 1, 1, 1,
1.137358, 0.3695049, 1.773755, 1, 1, 1, 1, 1,
1.139098, 0.7440143, 1.759636, 1, 1, 1, 1, 1,
1.149722, 0.2241959, 1.101363, 1, 1, 1, 1, 1,
1.15182, 1.162162, 1.636421, 0, 0, 1, 1, 1,
1.1532, 0.2883233, 1.339989, 1, 0, 0, 1, 1,
1.15546, 0.3904732, 1.499189, 1, 0, 0, 1, 1,
1.164636, 0.01208246, -0.4287545, 1, 0, 0, 1, 1,
1.168486, 0.05475624, 0.9012256, 1, 0, 0, 1, 1,
1.17342, -1.14616, 1.250464, 1, 0, 0, 1, 1,
1.17733, -0.4866959, 2.696074, 0, 0, 0, 1, 1,
1.180905, 0.1848902, 2.588, 0, 0, 0, 1, 1,
1.182523, -2.772437, 2.416502, 0, 0, 0, 1, 1,
1.197341, 0.09034424, 2.243973, 0, 0, 0, 1, 1,
1.202979, -0.7665448, 1.936352, 0, 0, 0, 1, 1,
1.20349, 0.7117473, 0.2422767, 0, 0, 0, 1, 1,
1.203631, -0.3936033, 2.025478, 0, 0, 0, 1, 1,
1.205683, -0.9279816, 1.851383, 1, 1, 1, 1, 1,
1.213286, -0.01791939, 0.9820496, 1, 1, 1, 1, 1,
1.21771, -0.8979928, 1.285695, 1, 1, 1, 1, 1,
1.230813, 0.1049018, 1.261573, 1, 1, 1, 1, 1,
1.24325, -0.04631824, -0.1400656, 1, 1, 1, 1, 1,
1.250612, 1.40178, -0.2087454, 1, 1, 1, 1, 1,
1.25088, 0.9917423, -0.2087892, 1, 1, 1, 1, 1,
1.255195, 0.1233909, 0.7168702, 1, 1, 1, 1, 1,
1.261045, 2.284989, 0.7041782, 1, 1, 1, 1, 1,
1.269358, 0.01375127, 1.518613, 1, 1, 1, 1, 1,
1.273323, 0.4608663, 1.424268, 1, 1, 1, 1, 1,
1.278925, -0.5171292, 2.099772, 1, 1, 1, 1, 1,
1.287981, -1.028182, 1.021722, 1, 1, 1, 1, 1,
1.288221, -1.297874, 1.76027, 1, 1, 1, 1, 1,
1.290841, 0.01369992, 3.736063, 1, 1, 1, 1, 1,
1.294756, -0.6171042, 1.650884, 0, 0, 1, 1, 1,
1.30256, 0.1235609, 1.566917, 1, 0, 0, 1, 1,
1.307259, -1.304817, 1.328674, 1, 0, 0, 1, 1,
1.3089, -0.2981409, 2.13129, 1, 0, 0, 1, 1,
1.31042, 0.1921327, 1.471442, 1, 0, 0, 1, 1,
1.316262, -0.3549656, 2.46041, 1, 0, 0, 1, 1,
1.338773, 1.34224, -0.03005885, 0, 0, 0, 1, 1,
1.339028, 0.4048305, 2.303143, 0, 0, 0, 1, 1,
1.340079, 0.6216467, 2.099396, 0, 0, 0, 1, 1,
1.342478, 1.729738, 0.9094259, 0, 0, 0, 1, 1,
1.346531, -0.9524895, 0.7369519, 0, 0, 0, 1, 1,
1.350648, -0.4114653, 0.4767931, 0, 0, 0, 1, 1,
1.351132, 0.6445023, 1.105409, 0, 0, 0, 1, 1,
1.366621, 0.5095166, 0.07120115, 1, 1, 1, 1, 1,
1.377488, 0.08637968, 1.048921, 1, 1, 1, 1, 1,
1.380962, -1.64626, 3.005184, 1, 1, 1, 1, 1,
1.382407, 0.955222, 1.775529, 1, 1, 1, 1, 1,
1.382591, -1.047323, 2.625793, 1, 1, 1, 1, 1,
1.383555, -0.6695364, 1.311909, 1, 1, 1, 1, 1,
1.386071, 0.9159698, 1.833088, 1, 1, 1, 1, 1,
1.390507, 0.3038275, 1.15403, 1, 1, 1, 1, 1,
1.391111, -0.3997298, 2.101466, 1, 1, 1, 1, 1,
1.397495, 0.2853537, 1.501188, 1, 1, 1, 1, 1,
1.410604, 0.0311142, 1.536011, 1, 1, 1, 1, 1,
1.415887, -0.7845758, 4.507293, 1, 1, 1, 1, 1,
1.448582, 0.6469339, 0.6879941, 1, 1, 1, 1, 1,
1.449952, -0.4663737, 1.212615, 1, 1, 1, 1, 1,
1.454175, 2.286764, 0.6148346, 1, 1, 1, 1, 1,
1.461044, 0.05787854, 2.380685, 0, 0, 1, 1, 1,
1.476639, -0.6280757, 2.203201, 1, 0, 0, 1, 1,
1.47759, 0.307299, -0.4716086, 1, 0, 0, 1, 1,
1.495593, 0.5025224, 2.721636, 1, 0, 0, 1, 1,
1.495642, -0.4767641, 2.301312, 1, 0, 0, 1, 1,
1.496005, 0.2642586, -0.3545112, 1, 0, 0, 1, 1,
1.499833, -0.3677328, 2.445508, 0, 0, 0, 1, 1,
1.50833, -0.6645213, 1.601303, 0, 0, 0, 1, 1,
1.509477, -1.41886, 2.25129, 0, 0, 0, 1, 1,
1.516186, 0.05249792, 1.864929, 0, 0, 0, 1, 1,
1.525094, 1.535922, 0.1680055, 0, 0, 0, 1, 1,
1.536176, -0.8975043, 2.295574, 0, 0, 0, 1, 1,
1.549868, -0.1309888, 1.128217, 0, 0, 0, 1, 1,
1.552343, -0.6142899, 1.840238, 1, 1, 1, 1, 1,
1.561647, 0.3942385, 2.145128, 1, 1, 1, 1, 1,
1.56922, -1.574062, 2.506056, 1, 1, 1, 1, 1,
1.574287, 1.947021, 0.1197033, 1, 1, 1, 1, 1,
1.580442, -1.588791, 1.906028, 1, 1, 1, 1, 1,
1.589199, -0.7179376, 2.095386, 1, 1, 1, 1, 1,
1.592816, -0.3330458, 1.506438, 1, 1, 1, 1, 1,
1.595047, -1.308007, 2.51833, 1, 1, 1, 1, 1,
1.598782, 0.09693348, -0.07380313, 1, 1, 1, 1, 1,
1.618497, -0.610349, 3.482958, 1, 1, 1, 1, 1,
1.648321, -0.5766557, 2.30665, 1, 1, 1, 1, 1,
1.656125, 1.34967, 1.214754, 1, 1, 1, 1, 1,
1.659917, 1.385552, -0.00439962, 1, 1, 1, 1, 1,
1.689322, 2.051739, -1.560415, 1, 1, 1, 1, 1,
1.740728, -0.02614823, 4.696771, 1, 1, 1, 1, 1,
1.752308, 1.03847, 1.406326, 0, 0, 1, 1, 1,
1.800664, 1.566054, 1.108341, 1, 0, 0, 1, 1,
1.805998, -0.7094843, 1.500566, 1, 0, 0, 1, 1,
1.816749, 0.05776913, 1.453045, 1, 0, 0, 1, 1,
1.817157, -1.143343, 3.099736, 1, 0, 0, 1, 1,
1.819534, -0.3642358, 1.999463, 1, 0, 0, 1, 1,
1.82041, 1.481785, -0.07675771, 0, 0, 0, 1, 1,
1.832466, -1.818181, 3.057024, 0, 0, 0, 1, 1,
1.841353, 0.7942296, 0.8835873, 0, 0, 0, 1, 1,
1.841681, -1.512916, 2.871231, 0, 0, 0, 1, 1,
1.884978, 0.535381, 0.5515669, 0, 0, 0, 1, 1,
1.88587, -0.3461921, 2.44342, 0, 0, 0, 1, 1,
1.888713, 0.8752899, 2.279342, 0, 0, 0, 1, 1,
1.947626, 1.511633, 1.574257, 1, 1, 1, 1, 1,
1.955933, -0.9969165, 1.903362, 1, 1, 1, 1, 1,
1.959283, 1.27361, 2.462793, 1, 1, 1, 1, 1,
1.960552, -1.273763, 0.6643904, 1, 1, 1, 1, 1,
1.976315, 1.670524, 1.844964, 1, 1, 1, 1, 1,
1.986154, -0.3983705, 3.095903, 1, 1, 1, 1, 1,
1.996847, 0.8305963, 0.5460808, 1, 1, 1, 1, 1,
2.017823, -1.055749, 3.218509, 1, 1, 1, 1, 1,
2.042159, 0.9104488, 1.768463, 1, 1, 1, 1, 1,
2.064239, -1.245392, 1.634719, 1, 1, 1, 1, 1,
2.070331, -1.900215, 4.106062, 1, 1, 1, 1, 1,
2.08989, 0.02139046, 0.7811847, 1, 1, 1, 1, 1,
2.090139, 0.6135653, 1.881508, 1, 1, 1, 1, 1,
2.149547, -1.499183, 1.48371, 1, 1, 1, 1, 1,
2.1568, -0.7956222, 1.415141, 1, 1, 1, 1, 1,
2.156919, -0.6066567, 0.6088654, 0, 0, 1, 1, 1,
2.16299, -0.7674914, 2.762464, 1, 0, 0, 1, 1,
2.176172, -0.1315127, 3.466194, 1, 0, 0, 1, 1,
2.183072, 1.279302, 0.6813801, 1, 0, 0, 1, 1,
2.270318, -0.0397043, 5.028179, 1, 0, 0, 1, 1,
2.286059, 0.004094369, 2.512918, 1, 0, 0, 1, 1,
2.317293, 0.6780561, 1.885549, 0, 0, 0, 1, 1,
2.32122, -0.9814807, 1.723185, 0, 0, 0, 1, 1,
2.323354, 0.07970117, 3.064719, 0, 0, 0, 1, 1,
2.334302, -2.047786, 2.756042, 0, 0, 0, 1, 1,
2.382041, -1.915967, 1.236711, 0, 0, 0, 1, 1,
2.417895, 0.6363727, -1.159276, 0, 0, 0, 1, 1,
2.49199, -0.04372977, 1.000338, 0, 0, 0, 1, 1,
2.57937, 0.6710382, 0.5770761, 1, 1, 1, 1, 1,
2.64418, -1.706126, 1.837339, 1, 1, 1, 1, 1,
2.651514, 0.1644289, 0.2741428, 1, 1, 1, 1, 1,
2.709707, 1.797877, 0.6995804, 1, 1, 1, 1, 1,
3.005721, -0.9865277, 1.720986, 1, 1, 1, 1, 1,
3.252371, 1.21012, 0.851882, 1, 1, 1, 1, 1,
3.273489, -0.4252517, 2.163103, 1, 1, 1, 1, 1
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
var radius = 9.373292;
var distance = 32.92329;
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
mvMatrix.translate( -0.07552314, 0.02461219, -0.6489146 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.92329);
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