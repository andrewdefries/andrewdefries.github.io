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
-3.197823, -0.8475559, -2.527487, 1, 0, 0, 1,
-2.864287, -0.3832675, -2.65684, 1, 0.007843138, 0, 1,
-2.685309, -0.818081, -2.571004, 1, 0.01176471, 0, 1,
-2.629182, 2.104665, -1.724963, 1, 0.01960784, 0, 1,
-2.582936, 0.158186, -1.676535, 1, 0.02352941, 0, 1,
-2.55902, 0.2005118, -1.734371, 1, 0.03137255, 0, 1,
-2.532095, 0.6509658, -2.761411, 1, 0.03529412, 0, 1,
-2.423902, 1.12156, -3.570839, 1, 0.04313726, 0, 1,
-2.41203, 0.6133793, -2.854116, 1, 0.04705882, 0, 1,
-2.316084, 0.3252872, -1.567638, 1, 0.05490196, 0, 1,
-2.275477, 0.01876956, -0.8462319, 1, 0.05882353, 0, 1,
-2.24806, 0.9681796, -1.324688, 1, 0.06666667, 0, 1,
-2.242403, 0.1142597, -0.09727754, 1, 0.07058824, 0, 1,
-2.232762, -1.300718, -3.016506, 1, 0.07843138, 0, 1,
-2.191103, -0.2952697, -1.211158, 1, 0.08235294, 0, 1,
-2.172875, 1.042933, -0.6873232, 1, 0.09019608, 0, 1,
-2.152388, -1.523622, -3.151311, 1, 0.09411765, 0, 1,
-2.14145, -0.5591805, -0.5123321, 1, 0.1019608, 0, 1,
-2.134755, -0.3636667, -0.5847484, 1, 0.1098039, 0, 1,
-2.1049, -1.038858, -1.696893, 1, 0.1137255, 0, 1,
-2.104521, 0.06654052, -1.309762, 1, 0.1215686, 0, 1,
-2.085281, -0.5117731, -1.149313, 1, 0.1254902, 0, 1,
-2.083101, 0.01270624, -2.08854, 1, 0.1333333, 0, 1,
-2.05076, -0.3116014, -2.160207, 1, 0.1372549, 0, 1,
-2.034262, 0.4443936, -1.376775, 1, 0.145098, 0, 1,
-2.017704, -0.4705063, -1.666161, 1, 0.1490196, 0, 1,
-1.968545, 0.3460132, 0.619691, 1, 0.1568628, 0, 1,
-1.960318, -0.2061253, 1.018973, 1, 0.1607843, 0, 1,
-1.956538, -1.526406, -2.048101, 1, 0.1686275, 0, 1,
-1.940702, -0.1075743, -2.664089, 1, 0.172549, 0, 1,
-1.934665, -0.8979749, -3.92579, 1, 0.1803922, 0, 1,
-1.927541, -2.759641, -3.482351, 1, 0.1843137, 0, 1,
-1.923776, -0.5000374, -1.521164, 1, 0.1921569, 0, 1,
-1.900377, -0.1249363, -1.880641, 1, 0.1960784, 0, 1,
-1.879486, -0.7135453, -1.030298, 1, 0.2039216, 0, 1,
-1.859766, 0.006824444, -3.001319, 1, 0.2117647, 0, 1,
-1.856792, 0.1656519, -2.450363, 1, 0.2156863, 0, 1,
-1.855207, 0.4737844, 1.733996, 1, 0.2235294, 0, 1,
-1.836729, 1.142179, -0.526445, 1, 0.227451, 0, 1,
-1.836543, 0.06044343, -1.167235, 1, 0.2352941, 0, 1,
-1.821925, -0.1615236, -1.482258, 1, 0.2392157, 0, 1,
-1.811574, 1.365292, -0.01630706, 1, 0.2470588, 0, 1,
-1.806566, 0.04391965, -2.453327, 1, 0.2509804, 0, 1,
-1.793399, 1.78727, -1.487375, 1, 0.2588235, 0, 1,
-1.778827, -1.969519, -2.841657, 1, 0.2627451, 0, 1,
-1.760602, 0.5932664, -1.646531, 1, 0.2705882, 0, 1,
-1.752503, 0.5954667, -0.9640523, 1, 0.2745098, 0, 1,
-1.751686, -0.1270403, -2.064046, 1, 0.282353, 0, 1,
-1.703336, 0.2077685, -2.321974, 1, 0.2862745, 0, 1,
-1.684972, 0.3537199, -0.6465939, 1, 0.2941177, 0, 1,
-1.664163, -0.6707678, -0.5715742, 1, 0.3019608, 0, 1,
-1.631411, 0.8251158, -0.4810086, 1, 0.3058824, 0, 1,
-1.620524, -0.2979398, -2.179244, 1, 0.3137255, 0, 1,
-1.610496, -0.2528226, -2.604212, 1, 0.3176471, 0, 1,
-1.603669, -0.8703988, -2.187793, 1, 0.3254902, 0, 1,
-1.589264, -0.1877181, -1.127124, 1, 0.3294118, 0, 1,
-1.580559, -0.1693834, -0.6824345, 1, 0.3372549, 0, 1,
-1.55976, -0.1699238, -2.064507, 1, 0.3411765, 0, 1,
-1.556785, 1.495645, 0.05070797, 1, 0.3490196, 0, 1,
-1.55542, 0.2197859, -0.2671851, 1, 0.3529412, 0, 1,
-1.543847, 1.315768, -1.114779, 1, 0.3607843, 0, 1,
-1.53558, 0.498283, -1.150237, 1, 0.3647059, 0, 1,
-1.533832, -0.9863753, -2.973717, 1, 0.372549, 0, 1,
-1.52137, 0.9477683, -1.910309, 1, 0.3764706, 0, 1,
-1.518116, 0.3861388, -1.987052, 1, 0.3843137, 0, 1,
-1.512937, -1.062024, -3.375636, 1, 0.3882353, 0, 1,
-1.49726, -0.8897088, -2.413888, 1, 0.3960784, 0, 1,
-1.493784, -1.102611, -1.450163, 1, 0.4039216, 0, 1,
-1.484263, -0.9629668, -2.996699, 1, 0.4078431, 0, 1,
-1.47604, 0.2634973, -2.450579, 1, 0.4156863, 0, 1,
-1.472702, -1.013236, -2.850412, 1, 0.4196078, 0, 1,
-1.470338, 0.02711798, -1.72313, 1, 0.427451, 0, 1,
-1.447586, 0.9043298, -0.1139991, 1, 0.4313726, 0, 1,
-1.438661, 0.4773501, -1.163219, 1, 0.4392157, 0, 1,
-1.436155, -0.6382728, -2.434952, 1, 0.4431373, 0, 1,
-1.435671, -0.4696971, -2.411455, 1, 0.4509804, 0, 1,
-1.435541, -1.186483, -2.923135, 1, 0.454902, 0, 1,
-1.41676, -0.4989647, -2.123979, 1, 0.4627451, 0, 1,
-1.404214, 0.3632009, -1.26994, 1, 0.4666667, 0, 1,
-1.396669, -0.8850917, -1.247723, 1, 0.4745098, 0, 1,
-1.383878, -0.3871768, -2.939686, 1, 0.4784314, 0, 1,
-1.367228, -1.387615, -2.773274, 1, 0.4862745, 0, 1,
-1.365924, -0.5797204, -2.558276, 1, 0.4901961, 0, 1,
-1.351393, -0.9539186, -3.479805, 1, 0.4980392, 0, 1,
-1.34213, 0.4531153, -0.8023082, 1, 0.5058824, 0, 1,
-1.340393, 0.1804707, -1.143365, 1, 0.509804, 0, 1,
-1.34016, 0.3547425, -2.248241, 1, 0.5176471, 0, 1,
-1.331742, 1.026048, -0.2081943, 1, 0.5215687, 0, 1,
-1.328092, 1.226138, 0.07480036, 1, 0.5294118, 0, 1,
-1.307377, 0.7581029, 1.296584, 1, 0.5333334, 0, 1,
-1.284273, -1.271497, -1.950314, 1, 0.5411765, 0, 1,
-1.279543, -0.6010492, -1.587281, 1, 0.5450981, 0, 1,
-1.278838, -0.3710189, -2.434808, 1, 0.5529412, 0, 1,
-1.275254, -0.8084601, -2.256977, 1, 0.5568628, 0, 1,
-1.272257, -0.02467461, -1.192749, 1, 0.5647059, 0, 1,
-1.266986, -1.074908, -1.905735, 1, 0.5686275, 0, 1,
-1.23666, 0.2388161, -1.646801, 1, 0.5764706, 0, 1,
-1.236568, 0.7055436, -0.2195629, 1, 0.5803922, 0, 1,
-1.233983, -0.6731061, -0.9801341, 1, 0.5882353, 0, 1,
-1.23307, 1.015988, -0.5794767, 1, 0.5921569, 0, 1,
-1.229079, -0.2389612, -0.2897487, 1, 0.6, 0, 1,
-1.212302, -0.7225204, -2.441406, 1, 0.6078432, 0, 1,
-1.207979, -0.4204196, -2.95005, 1, 0.6117647, 0, 1,
-1.207244, -1.310397, -2.294205, 1, 0.6196079, 0, 1,
-1.20034, -0.4316273, 0.08424448, 1, 0.6235294, 0, 1,
-1.183407, -0.2349691, 0.06868344, 1, 0.6313726, 0, 1,
-1.17403, 0.2114384, -1.784851, 1, 0.6352941, 0, 1,
-1.172549, 0.2682687, -1.462344, 1, 0.6431373, 0, 1,
-1.169566, 0.9678399, -1.402319, 1, 0.6470588, 0, 1,
-1.164192, -1.878305, -3.287937, 1, 0.654902, 0, 1,
-1.158762, 1.034951, -1.707488, 1, 0.6588235, 0, 1,
-1.150396, -0.8903853, -3.183078, 1, 0.6666667, 0, 1,
-1.147752, -1.943855, -2.604513, 1, 0.6705883, 0, 1,
-1.146288, 0.2891742, -2.003501, 1, 0.6784314, 0, 1,
-1.138173, -0.6627963, -0.2167252, 1, 0.682353, 0, 1,
-1.13645, -0.4201789, -0.1586749, 1, 0.6901961, 0, 1,
-1.134403, -2.347306, -2.179061, 1, 0.6941177, 0, 1,
-1.132297, -0.6118838, -1.344005, 1, 0.7019608, 0, 1,
-1.126709, 1.244084, -0.278699, 1, 0.7098039, 0, 1,
-1.123365, 0.134777, -1.814016, 1, 0.7137255, 0, 1,
-1.11962, -0.06624799, -1.62495, 1, 0.7215686, 0, 1,
-1.119616, 0.975857, -1.948379, 1, 0.7254902, 0, 1,
-1.118713, -1.062813, -3.213046, 1, 0.7333333, 0, 1,
-1.112731, 0.6636875, -1.773214, 1, 0.7372549, 0, 1,
-1.110989, -0.5627303, -1.292334, 1, 0.7450981, 0, 1,
-1.110295, -1.119768, -2.028658, 1, 0.7490196, 0, 1,
-1.110161, -0.2325134, -0.7360036, 1, 0.7568628, 0, 1,
-1.109053, 0.7972112, -0.01741621, 1, 0.7607843, 0, 1,
-1.10522, 0.7477671, -1.417033, 1, 0.7686275, 0, 1,
-1.10267, 1.187714, 0.02468318, 1, 0.772549, 0, 1,
-1.102394, -0.4839315, -3.057093, 1, 0.7803922, 0, 1,
-1.099443, -0.4975641, -2.910547, 1, 0.7843137, 0, 1,
-1.0986, -0.5626361, -2.525421, 1, 0.7921569, 0, 1,
-1.091871, 0.9534338, -0.1443781, 1, 0.7960784, 0, 1,
-1.090285, -1.417442, -3.452725, 1, 0.8039216, 0, 1,
-1.084166, 0.431728, 0.5660163, 1, 0.8117647, 0, 1,
-1.070708, -0.1732332, -3.099602, 1, 0.8156863, 0, 1,
-1.062344, 0.3976464, -0.5788831, 1, 0.8235294, 0, 1,
-1.062033, 0.6408136, -0.8995862, 1, 0.827451, 0, 1,
-1.061229, 0.1475531, -1.53838, 1, 0.8352941, 0, 1,
-1.0556, 0.2481451, -1.625556, 1, 0.8392157, 0, 1,
-1.032968, 1.51769, 0.05936915, 1, 0.8470588, 0, 1,
-1.025797, 0.1230888, -0.1400232, 1, 0.8509804, 0, 1,
-1.023418, -0.2194887, -1.235069, 1, 0.8588235, 0, 1,
-1.021655, -0.3764143, -2.711297, 1, 0.8627451, 0, 1,
-1.01782, -0.000322422, -2.623459, 1, 0.8705882, 0, 1,
-0.9997628, -1.04796, -1.459678, 1, 0.8745098, 0, 1,
-0.9947758, -0.4105967, -3.180811, 1, 0.8823529, 0, 1,
-0.9945197, 0.7727104, -2.901436, 1, 0.8862745, 0, 1,
-0.99191, 0.4976121, -1.015952, 1, 0.8941177, 0, 1,
-0.9878336, -0.7281491, -3.130203, 1, 0.8980392, 0, 1,
-0.9859214, 1.048482, 0.3288322, 1, 0.9058824, 0, 1,
-0.982009, -0.1774492, -1.441935, 1, 0.9137255, 0, 1,
-0.9779018, -0.695605, -2.839741, 1, 0.9176471, 0, 1,
-0.9778616, 2.083632, 1.198339, 1, 0.9254902, 0, 1,
-0.9769946, 1.709054, -0.4754068, 1, 0.9294118, 0, 1,
-0.9734478, -0.9740119, -2.335329, 1, 0.9372549, 0, 1,
-0.9727933, 0.2047666, -1.231275, 1, 0.9411765, 0, 1,
-0.961526, 1.760228, 0.2988049, 1, 0.9490196, 0, 1,
-0.9579935, -0.1445484, -0.5401006, 1, 0.9529412, 0, 1,
-0.9556982, 1.888001, -0.8727649, 1, 0.9607843, 0, 1,
-0.9470387, 0.1109673, -0.0479592, 1, 0.9647059, 0, 1,
-0.9469244, -0.4987736, -1.870097, 1, 0.972549, 0, 1,
-0.9465257, 0.7607806, -2.297609, 1, 0.9764706, 0, 1,
-0.9440744, -0.6671741, -3.262089, 1, 0.9843137, 0, 1,
-0.9434419, -0.4059853, -2.781142, 1, 0.9882353, 0, 1,
-0.9374285, -0.451305, -2.220843, 1, 0.9960784, 0, 1,
-0.9372988, -0.1165466, -3.454336, 0.9960784, 1, 0, 1,
-0.9363949, 0.8182296, -0.2505874, 0.9921569, 1, 0, 1,
-0.9361426, 1.474489, -0.5998018, 0.9843137, 1, 0, 1,
-0.9323676, -0.2897417, -4.915389, 0.9803922, 1, 0, 1,
-0.9292202, 0.3370505, 0.1975396, 0.972549, 1, 0, 1,
-0.9200975, 0.0187708, -1.619251, 0.9686275, 1, 0, 1,
-0.9199151, -0.2288545, -3.072443, 0.9607843, 1, 0, 1,
-0.9072922, -1.205576, -2.229524, 0.9568627, 1, 0, 1,
-0.9072477, 0.4007053, -0.4953029, 0.9490196, 1, 0, 1,
-0.9062385, 0.3393008, 0.5699409, 0.945098, 1, 0, 1,
-0.9047912, 1.470062, -1.686864, 0.9372549, 1, 0, 1,
-0.9045504, 0.0319741, -1.866566, 0.9333333, 1, 0, 1,
-0.9006947, -0.3124039, -2.898016, 0.9254902, 1, 0, 1,
-0.8988162, 0.671822, -0.2850498, 0.9215686, 1, 0, 1,
-0.8901171, 1.085554, 0.5906628, 0.9137255, 1, 0, 1,
-0.8887144, -1.14665, -2.247968, 0.9098039, 1, 0, 1,
-0.887534, 0.3627462, -2.139324, 0.9019608, 1, 0, 1,
-0.8827953, 0.6032591, 1.165922, 0.8941177, 1, 0, 1,
-0.8826914, 0.2131678, 0.5466514, 0.8901961, 1, 0, 1,
-0.8793083, 0.3189506, -0.8882922, 0.8823529, 1, 0, 1,
-0.8758126, 1.016773, -1.317627, 0.8784314, 1, 0, 1,
-0.8742933, 1.172936, 0.1988438, 0.8705882, 1, 0, 1,
-0.8697022, -0.2120753, -1.909305, 0.8666667, 1, 0, 1,
-0.8693962, -0.330756, -1.999222, 0.8588235, 1, 0, 1,
-0.8639436, 1.50973, 1.324391, 0.854902, 1, 0, 1,
-0.8616592, -1.13446, -2.287404, 0.8470588, 1, 0, 1,
-0.8614587, -0.2702449, -1.758169, 0.8431373, 1, 0, 1,
-0.8566492, 0.08838464, -2.520724, 0.8352941, 1, 0, 1,
-0.8551801, -0.9095455, -3.272678, 0.8313726, 1, 0, 1,
-0.8545147, -1.196178, -2.68078, 0.8235294, 1, 0, 1,
-0.8487713, 0.1020905, 0.8569965, 0.8196079, 1, 0, 1,
-0.8473335, -0.8789877, -2.844421, 0.8117647, 1, 0, 1,
-0.84461, 0.2454177, -0.4502687, 0.8078431, 1, 0, 1,
-0.8404428, 1.049026, -0.6870838, 0.8, 1, 0, 1,
-0.825749, -0.7858183, -2.653319, 0.7921569, 1, 0, 1,
-0.8256589, 0.5676367, 0.03690944, 0.7882353, 1, 0, 1,
-0.8251126, 1.024304, -0.6650032, 0.7803922, 1, 0, 1,
-0.8245307, -3.036016, -3.531099, 0.7764706, 1, 0, 1,
-0.8224829, 0.339567, -2.053921, 0.7686275, 1, 0, 1,
-0.8147657, -0.6291849, -3.032187, 0.7647059, 1, 0, 1,
-0.8116845, -0.9238164, -2.025993, 0.7568628, 1, 0, 1,
-0.8053846, -0.6130378, -2.260627, 0.7529412, 1, 0, 1,
-0.8052163, -2.204093, -2.200038, 0.7450981, 1, 0, 1,
-0.8042117, -0.80202, -2.286037, 0.7411765, 1, 0, 1,
-0.8009103, 0.05104446, -2.397781, 0.7333333, 1, 0, 1,
-0.800775, -0.8292907, -2.140023, 0.7294118, 1, 0, 1,
-0.8003546, -0.1763602, -2.829373, 0.7215686, 1, 0, 1,
-0.7899036, 1.880603, -0.06376521, 0.7176471, 1, 0, 1,
-0.7888854, 0.4690796, -1.23206, 0.7098039, 1, 0, 1,
-0.785938, 1.49156, -1.734576, 0.7058824, 1, 0, 1,
-0.785144, -1.084691, -1.361498, 0.6980392, 1, 0, 1,
-0.782488, -1.245602, -3.093012, 0.6901961, 1, 0, 1,
-0.7796338, -0.4179296, -2.044237, 0.6862745, 1, 0, 1,
-0.7788556, 0.2381262, -3.470545, 0.6784314, 1, 0, 1,
-0.7768465, -0.2553107, -2.57105, 0.6745098, 1, 0, 1,
-0.7765827, -0.8650792, -4.194003, 0.6666667, 1, 0, 1,
-0.7750713, 0.5979081, 0.760895, 0.6627451, 1, 0, 1,
-0.7709985, 1.030036, -0.08341777, 0.654902, 1, 0, 1,
-0.7707226, 0.9124292, -2.89477, 0.6509804, 1, 0, 1,
-0.7707164, -1.6198, -2.588797, 0.6431373, 1, 0, 1,
-0.7702098, 0.8565314, 0.6090857, 0.6392157, 1, 0, 1,
-0.7693978, -1.539354, -1.612339, 0.6313726, 1, 0, 1,
-0.7605444, -0.248774, -2.64643, 0.627451, 1, 0, 1,
-0.7588562, 0.78576, -0.5566787, 0.6196079, 1, 0, 1,
-0.7532325, 0.5068167, 0.3902564, 0.6156863, 1, 0, 1,
-0.7488651, 0.3459435, 0.6675847, 0.6078432, 1, 0, 1,
-0.7461646, 0.102027, 0.2616278, 0.6039216, 1, 0, 1,
-0.7440076, -0.3625541, -4.432506, 0.5960785, 1, 0, 1,
-0.7394212, -0.5132497, -1.431658, 0.5882353, 1, 0, 1,
-0.7334508, 0.9807502, 0.7421573, 0.5843138, 1, 0, 1,
-0.7298998, 0.2757502, -2.548662, 0.5764706, 1, 0, 1,
-0.7260388, -0.4381166, -2.604839, 0.572549, 1, 0, 1,
-0.7240282, 0.8716748, -0.6771057, 0.5647059, 1, 0, 1,
-0.7182603, 1.126466, -0.8534673, 0.5607843, 1, 0, 1,
-0.7179599, -0.2449829, -3.440413, 0.5529412, 1, 0, 1,
-0.7165401, -0.8442972, -2.164391, 0.5490196, 1, 0, 1,
-0.7163004, -0.2138754, -1.176002, 0.5411765, 1, 0, 1,
-0.7154841, -0.151228, -0.9298409, 0.5372549, 1, 0, 1,
-0.6978709, -1.677423, -1.626486, 0.5294118, 1, 0, 1,
-0.6939512, -0.5673274, -1.960414, 0.5254902, 1, 0, 1,
-0.6938192, 0.3466673, 0.3972446, 0.5176471, 1, 0, 1,
-0.6903821, -1.05744, -1.289901, 0.5137255, 1, 0, 1,
-0.6864595, -0.3344522, -0.8341491, 0.5058824, 1, 0, 1,
-0.6838665, -1.367076, -3.450651, 0.5019608, 1, 0, 1,
-0.6834571, -0.2157447, -1.107504, 0.4941176, 1, 0, 1,
-0.6806195, 0.1021218, 1.438879, 0.4862745, 1, 0, 1,
-0.6797934, 0.04470842, -1.934027, 0.4823529, 1, 0, 1,
-0.6787326, 1.025543, -4.147003, 0.4745098, 1, 0, 1,
-0.6706338, -0.1386216, -1.585279, 0.4705882, 1, 0, 1,
-0.6658897, 0.5532463, -0.426641, 0.4627451, 1, 0, 1,
-0.664439, -0.8321362, -2.45592, 0.4588235, 1, 0, 1,
-0.6510068, -1.001278, -2.727715, 0.4509804, 1, 0, 1,
-0.6474687, 1.147868, -2.369841, 0.4470588, 1, 0, 1,
-0.646181, -0.03581417, -1.369979, 0.4392157, 1, 0, 1,
-0.6441186, -0.9124548, -1.963619, 0.4352941, 1, 0, 1,
-0.6423558, 1.092106, 0.5413323, 0.427451, 1, 0, 1,
-0.6391016, -0.239436, -2.626824, 0.4235294, 1, 0, 1,
-0.6375112, 0.8003736, -0.2139763, 0.4156863, 1, 0, 1,
-0.6360505, -0.5516291, -3.71529, 0.4117647, 1, 0, 1,
-0.6325538, 0.4185807, -2.087343, 0.4039216, 1, 0, 1,
-0.6202855, -0.2648638, -0.8581406, 0.3960784, 1, 0, 1,
-0.6090351, -0.1801228, -1.724838, 0.3921569, 1, 0, 1,
-0.6079133, -0.2769908, -3.838752, 0.3843137, 1, 0, 1,
-0.6070491, -0.1751, -4.377795, 0.3803922, 1, 0, 1,
-0.6048598, 0.2175242, -0.4361232, 0.372549, 1, 0, 1,
-0.6043931, 0.01524531, -0.8093582, 0.3686275, 1, 0, 1,
-0.604155, 0.5911649, -1.584946, 0.3607843, 1, 0, 1,
-0.602993, 0.4233898, -1.787855, 0.3568628, 1, 0, 1,
-0.5978673, -0.2148128, -1.888662, 0.3490196, 1, 0, 1,
-0.5907425, -0.5388097, -3.13275, 0.345098, 1, 0, 1,
-0.5905858, 0.03393117, -0.5771078, 0.3372549, 1, 0, 1,
-0.5849975, -0.3158311, -0.774905, 0.3333333, 1, 0, 1,
-0.5798438, 0.9622214, -0.14545, 0.3254902, 1, 0, 1,
-0.5744769, 0.02623842, -0.8537856, 0.3215686, 1, 0, 1,
-0.5701487, 0.5780499, -1.415171, 0.3137255, 1, 0, 1,
-0.5644577, 0.511973, -0.8196826, 0.3098039, 1, 0, 1,
-0.5632443, 0.1970641, -0.6159281, 0.3019608, 1, 0, 1,
-0.5601111, 0.05564835, -2.461216, 0.2941177, 1, 0, 1,
-0.5596451, 0.7689348, 0.2864079, 0.2901961, 1, 0, 1,
-0.5594348, 0.8350945, -0.1323875, 0.282353, 1, 0, 1,
-0.5587165, 2.219877, -0.2810274, 0.2784314, 1, 0, 1,
-0.5575581, 0.7073852, -1.266322, 0.2705882, 1, 0, 1,
-0.5561126, -1.481524, -2.799491, 0.2666667, 1, 0, 1,
-0.5511504, -0.009393174, -3.281091, 0.2588235, 1, 0, 1,
-0.5475111, 0.251638, -0.7999665, 0.254902, 1, 0, 1,
-0.5410916, -1.107317, -2.206114, 0.2470588, 1, 0, 1,
-0.5390159, 2.330081, 0.6454108, 0.2431373, 1, 0, 1,
-0.5333177, -0.06454971, -1.316272, 0.2352941, 1, 0, 1,
-0.5332236, -2.036165, -2.453708, 0.2313726, 1, 0, 1,
-0.5322909, -0.6376259, -2.574801, 0.2235294, 1, 0, 1,
-0.529771, 0.8792903, -0.2145663, 0.2196078, 1, 0, 1,
-0.5277658, -0.5738022, -3.410949, 0.2117647, 1, 0, 1,
-0.5256045, 0.3940879, -1.562135, 0.2078431, 1, 0, 1,
-0.522631, -0.07339278, -3.552658, 0.2, 1, 0, 1,
-0.5180641, 1.971871, -1.093905, 0.1921569, 1, 0, 1,
-0.5078791, -0.2249938, -3.249449, 0.1882353, 1, 0, 1,
-0.5071838, 0.963579, -1.197627, 0.1803922, 1, 0, 1,
-0.5041285, -0.8803976, -3.168182, 0.1764706, 1, 0, 1,
-0.5001857, 0.2141831, -0.7382383, 0.1686275, 1, 0, 1,
-0.4990304, -0.1738353, -2.550802, 0.1647059, 1, 0, 1,
-0.4959395, -0.2908435, -2.488945, 0.1568628, 1, 0, 1,
-0.4922561, -0.1914054, -0.9044442, 0.1529412, 1, 0, 1,
-0.4921724, -1.021669, -1.99702, 0.145098, 1, 0, 1,
-0.4896101, 0.3979022, -0.3576736, 0.1411765, 1, 0, 1,
-0.4860949, 1.482838, -1.147109, 0.1333333, 1, 0, 1,
-0.4853267, 0.4132918, -1.401442, 0.1294118, 1, 0, 1,
-0.4785402, 3.239063, -1.699083, 0.1215686, 1, 0, 1,
-0.4769968, 2.722162, -0.8908682, 0.1176471, 1, 0, 1,
-0.4653975, 0.1195468, -2.201396, 0.1098039, 1, 0, 1,
-0.4614793, -0.786172, -1.001474, 0.1058824, 1, 0, 1,
-0.4606633, -0.5378564, -2.136755, 0.09803922, 1, 0, 1,
-0.4603653, -0.6713845, -2.721535, 0.09019608, 1, 0, 1,
-0.4553852, 0.4623683, -1.449509, 0.08627451, 1, 0, 1,
-0.4533226, -0.2219705, -3.300471, 0.07843138, 1, 0, 1,
-0.4523225, -1.050017, -2.597712, 0.07450981, 1, 0, 1,
-0.4440005, -0.07648209, -1.333043, 0.06666667, 1, 0, 1,
-0.4387588, 0.2658116, -0.9557609, 0.0627451, 1, 0, 1,
-0.4381795, 0.6116132, -0.02030696, 0.05490196, 1, 0, 1,
-0.4369946, -0.2107114, -1.999778, 0.05098039, 1, 0, 1,
-0.4354689, -0.7275186, -0.5314106, 0.04313726, 1, 0, 1,
-0.4345239, 0.692591, -0.8004649, 0.03921569, 1, 0, 1,
-0.4332669, -0.1072571, -2.05071, 0.03137255, 1, 0, 1,
-0.432953, 0.5376565, -0.5784401, 0.02745098, 1, 0, 1,
-0.4326344, -1.118893, -2.139611, 0.01960784, 1, 0, 1,
-0.4274469, 0.4755954, -0.839402, 0.01568628, 1, 0, 1,
-0.4243907, -0.5749618, -3.646379, 0.007843138, 1, 0, 1,
-0.4230927, 0.7981199, -0.1493198, 0.003921569, 1, 0, 1,
-0.4183488, -0.3137422, -1.188488, 0, 1, 0.003921569, 1,
-0.4118682, -0.03946439, -1.333357, 0, 1, 0.01176471, 1,
-0.4066162, -1.334731, -4.118616, 0, 1, 0.01568628, 1,
-0.4034735, 0.6425493, 0.3641981, 0, 1, 0.02352941, 1,
-0.3948315, 0.08925495, -0.8941057, 0, 1, 0.02745098, 1,
-0.3923557, -1.020163, -5.589459, 0, 1, 0.03529412, 1,
-0.3890253, -0.03290782, -0.7521489, 0, 1, 0.03921569, 1,
-0.3849475, -0.3216629, -1.810823, 0, 1, 0.04705882, 1,
-0.3807389, 0.0311033, -0.5053668, 0, 1, 0.05098039, 1,
-0.3786495, 0.4363154, 0.3515759, 0, 1, 0.05882353, 1,
-0.3764433, -0.5489175, -3.301363, 0, 1, 0.0627451, 1,
-0.3751469, 1.521092, 0.556522, 0, 1, 0.07058824, 1,
-0.3743173, 0.01331679, -1.362369, 0, 1, 0.07450981, 1,
-0.3719483, 0.4818119, 0.1731235, 0, 1, 0.08235294, 1,
-0.3713349, 0.02207738, -1.131802, 0, 1, 0.08627451, 1,
-0.3690479, -1.356054, -4.380084, 0, 1, 0.09411765, 1,
-0.3676016, -0.2345152, -3.242917, 0, 1, 0.1019608, 1,
-0.3620951, -1.263246, -1.862129, 0, 1, 0.1058824, 1,
-0.3591266, -1.12809, -2.821316, 0, 1, 0.1137255, 1,
-0.3588778, 0.320951, -1.361952, 0, 1, 0.1176471, 1,
-0.3588514, -0.7403913, -3.090961, 0, 1, 0.1254902, 1,
-0.3586036, 1.395799, 0.1397015, 0, 1, 0.1294118, 1,
-0.3547358, 0.2944742, -1.315174, 0, 1, 0.1372549, 1,
-0.3476673, 0.873741, -1.487583, 0, 1, 0.1411765, 1,
-0.3451054, 0.6390491, -1.326603, 0, 1, 0.1490196, 1,
-0.3419618, 1.115265, -0.8544865, 0, 1, 0.1529412, 1,
-0.3411663, -0.8814447, -1.834137, 0, 1, 0.1607843, 1,
-0.3378403, -1.040669, -3.172517, 0, 1, 0.1647059, 1,
-0.3377383, -0.3168091, -3.835161, 0, 1, 0.172549, 1,
-0.3353803, 0.1067983, -1.493804, 0, 1, 0.1764706, 1,
-0.3274063, -1.057125, -6.280384, 0, 1, 0.1843137, 1,
-0.3268245, 0.642617, 0.9036096, 0, 1, 0.1882353, 1,
-0.3267552, -0.6741759, -3.113037, 0, 1, 0.1960784, 1,
-0.3261156, -1.845208, -1.970124, 0, 1, 0.2039216, 1,
-0.3189253, -0.09525605, -1.927822, 0, 1, 0.2078431, 1,
-0.3141826, -0.1448636, -1.651113, 0, 1, 0.2156863, 1,
-0.3099743, -0.2395417, -2.656079, 0, 1, 0.2196078, 1,
-0.3075546, -0.7761347, -3.122348, 0, 1, 0.227451, 1,
-0.3040655, -0.5907527, 0.05001662, 0, 1, 0.2313726, 1,
-0.3038068, -1.312493, -2.324852, 0, 1, 0.2392157, 1,
-0.3004717, 0.04680169, -2.815681, 0, 1, 0.2431373, 1,
-0.3001151, 1.55517, 0.4682733, 0, 1, 0.2509804, 1,
-0.2944584, 1.237355, 0.1323718, 0, 1, 0.254902, 1,
-0.292664, 0.17116, -2.63887, 0, 1, 0.2627451, 1,
-0.2903045, -0.1278049, -0.5576906, 0, 1, 0.2666667, 1,
-0.2896699, 0.2327422, 0.6627453, 0, 1, 0.2745098, 1,
-0.2889152, 1.354241, -1.946815, 0, 1, 0.2784314, 1,
-0.2882338, -0.3810821, -2.442915, 0, 1, 0.2862745, 1,
-0.2820893, -0.598739, -2.403819, 0, 1, 0.2901961, 1,
-0.2772825, 0.4569144, -0.3502084, 0, 1, 0.2980392, 1,
-0.2767537, -0.1920731, -2.951331, 0, 1, 0.3058824, 1,
-0.2752744, 1.317776, -1.705944, 0, 1, 0.3098039, 1,
-0.2718034, 0.3335778, -1.693556, 0, 1, 0.3176471, 1,
-0.2713255, 0.3119896, -0.3352018, 0, 1, 0.3215686, 1,
-0.2699431, -0.6060476, -2.183393, 0, 1, 0.3294118, 1,
-0.2682976, 0.8464594, -0.4528818, 0, 1, 0.3333333, 1,
-0.2551414, 0.5889492, -0.4183767, 0, 1, 0.3411765, 1,
-0.254158, -0.1601116, -3.288017, 0, 1, 0.345098, 1,
-0.2480751, -1.920891, -5.662631, 0, 1, 0.3529412, 1,
-0.2480683, 0.05658089, -3.01427, 0, 1, 0.3568628, 1,
-0.2447505, 0.04904523, -0.5077917, 0, 1, 0.3647059, 1,
-0.2444434, 0.5204794, -0.6360917, 0, 1, 0.3686275, 1,
-0.2420586, -1.134714, -2.825027, 0, 1, 0.3764706, 1,
-0.2419096, 1.220273, -1.986498, 0, 1, 0.3803922, 1,
-0.2400198, -0.1038487, -1.84051, 0, 1, 0.3882353, 1,
-0.23686, 0.5735835, 0.8701542, 0, 1, 0.3921569, 1,
-0.2351728, -2.481699, -4.124959, 0, 1, 0.4, 1,
-0.2281557, -0.2600213, -2.274595, 0, 1, 0.4078431, 1,
-0.226305, 0.2660738, -1.060434, 0, 1, 0.4117647, 1,
-0.2230218, 0.8380556, 0.2977945, 0, 1, 0.4196078, 1,
-0.2213197, 1.555755, 0.1213256, 0, 1, 0.4235294, 1,
-0.2133851, 0.5874918, -2.121766, 0, 1, 0.4313726, 1,
-0.2126997, -1.018322, -2.680119, 0, 1, 0.4352941, 1,
-0.211625, 0.7413426, -0.5259659, 0, 1, 0.4431373, 1,
-0.2109558, -1.060718, -1.521969, 0, 1, 0.4470588, 1,
-0.2109197, -1.539818, -3.237898, 0, 1, 0.454902, 1,
-0.2099898, 1.767649, -1.016451, 0, 1, 0.4588235, 1,
-0.2090327, -1.244064, -4.736917, 0, 1, 0.4666667, 1,
-0.2059699, -1.518416, -4.045022, 0, 1, 0.4705882, 1,
-0.1921424, -0.057925, -2.447162, 0, 1, 0.4784314, 1,
-0.1835626, -0.5879027, -1.969911, 0, 1, 0.4823529, 1,
-0.178266, -1.388258, -4.003554, 0, 1, 0.4901961, 1,
-0.1748775, -0.213029, -1.931011, 0, 1, 0.4941176, 1,
-0.1746456, 1.351619, 0.4324547, 0, 1, 0.5019608, 1,
-0.1687642, 2.270886, -0.2644395, 0, 1, 0.509804, 1,
-0.1685969, 0.3582557, -0.6515738, 0, 1, 0.5137255, 1,
-0.1676164, -0.8384079, -4.184645, 0, 1, 0.5215687, 1,
-0.1651737, -1.298796, -2.592006, 0, 1, 0.5254902, 1,
-0.1620175, 0.3977707, -0.5693142, 0, 1, 0.5333334, 1,
-0.1569714, 0.3867818, -0.8503369, 0, 1, 0.5372549, 1,
-0.1531785, 2.022683, 0.7152173, 0, 1, 0.5450981, 1,
-0.1510721, -1.089939, -3.455035, 0, 1, 0.5490196, 1,
-0.1480991, 0.7554501, 0.932959, 0, 1, 0.5568628, 1,
-0.1448921, 0.7031214, -0.02639492, 0, 1, 0.5607843, 1,
-0.1405224, 0.3705234, 0.9480896, 0, 1, 0.5686275, 1,
-0.1403224, -1.482031, -2.94515, 0, 1, 0.572549, 1,
-0.1379035, -0.4502276, -2.016924, 0, 1, 0.5803922, 1,
-0.1369201, 0.1728964, -2.122098, 0, 1, 0.5843138, 1,
-0.1338127, 0.7656994, -1.514712, 0, 1, 0.5921569, 1,
-0.1325929, -0.8015985, -2.802371, 0, 1, 0.5960785, 1,
-0.1321788, -1.151778, -1.77756, 0, 1, 0.6039216, 1,
-0.1319088, 0.8054649, 0.5740508, 0, 1, 0.6117647, 1,
-0.1306465, 0.9558108, -0.3519771, 0, 1, 0.6156863, 1,
-0.1297681, -0.937506, -2.730357, 0, 1, 0.6235294, 1,
-0.1283227, 0.961931, -1.871944, 0, 1, 0.627451, 1,
-0.1260288, -0.3343725, -3.917701, 0, 1, 0.6352941, 1,
-0.1207935, 1.401414, 1.053344, 0, 1, 0.6392157, 1,
-0.1185359, -0.959804, -6.010103, 0, 1, 0.6470588, 1,
-0.115547, 1.341235, -2.778469, 0, 1, 0.6509804, 1,
-0.113723, -1.021901, -4.36804, 0, 1, 0.6588235, 1,
-0.1122614, -0.5358213, -0.905279, 0, 1, 0.6627451, 1,
-0.1096496, 0.5246916, -0.01093808, 0, 1, 0.6705883, 1,
-0.1090397, -1.094118, -2.373849, 0, 1, 0.6745098, 1,
-0.1078392, 0.1912657, -2.370909, 0, 1, 0.682353, 1,
-0.1072631, 0.3473233, -1.079854, 0, 1, 0.6862745, 1,
-0.1069332, 0.4885805, -1.261809, 0, 1, 0.6941177, 1,
-0.1058007, 0.04909642, -2.030013, 0, 1, 0.7019608, 1,
-0.1045818, -0.6214465, -3.266542, 0, 1, 0.7058824, 1,
-0.1029854, -0.08901998, -2.829489, 0, 1, 0.7137255, 1,
-0.1011549, 0.177541, 1.640238, 0, 1, 0.7176471, 1,
-0.09893576, 2.471803, -0.2306084, 0, 1, 0.7254902, 1,
-0.09790724, -2.183025, -2.517292, 0, 1, 0.7294118, 1,
-0.09654203, 0.8723345, -1.204646, 0, 1, 0.7372549, 1,
-0.09287409, -1.348354, -3.898629, 0, 1, 0.7411765, 1,
-0.09275679, 0.6653638, 1.008442, 0, 1, 0.7490196, 1,
-0.08809239, -0.3759553, -1.649634, 0, 1, 0.7529412, 1,
-0.08760673, -0.4104003, -2.981803, 0, 1, 0.7607843, 1,
-0.08418327, 0.1620725, -2.638418, 0, 1, 0.7647059, 1,
-0.08012479, -0.3544979, -2.954958, 0, 1, 0.772549, 1,
-0.0798496, -0.06716766, -3.427634, 0, 1, 0.7764706, 1,
-0.07781135, -0.09272392, -3.195523, 0, 1, 0.7843137, 1,
-0.07505639, 0.4453698, 0.3263013, 0, 1, 0.7882353, 1,
-0.06661008, -0.5939018, -3.13891, 0, 1, 0.7960784, 1,
-0.06036713, -1.040826, -1.59986, 0, 1, 0.8039216, 1,
-0.05963203, 0.3344724, -0.4622044, 0, 1, 0.8078431, 1,
-0.0588394, -0.2739124, -2.491813, 0, 1, 0.8156863, 1,
-0.05213936, -0.960326, -3.523909, 0, 1, 0.8196079, 1,
-0.05106501, -0.7104098, -3.591706, 0, 1, 0.827451, 1,
-0.04693053, 1.451265, -0.7432107, 0, 1, 0.8313726, 1,
-0.04668181, -0.5664667, -2.501727, 0, 1, 0.8392157, 1,
-0.04647174, 0.4015733, 2.414303, 0, 1, 0.8431373, 1,
-0.04352299, -1.379075, -3.402636, 0, 1, 0.8509804, 1,
-0.03903648, -1.611677, -6.005442, 0, 1, 0.854902, 1,
-0.03110904, -1.553715, -3.028746, 0, 1, 0.8627451, 1,
-0.02995609, -1.401188, -1.052538, 0, 1, 0.8666667, 1,
-0.02986794, 0.6853198, 0.9132772, 0, 1, 0.8745098, 1,
-0.02952004, -0.5360424, -2.267889, 0, 1, 0.8784314, 1,
-0.02851294, 0.770584, -0.3260112, 0, 1, 0.8862745, 1,
-0.0282909, -0.5315769, -3.609295, 0, 1, 0.8901961, 1,
-0.0257639, 1.023222, -2.564256, 0, 1, 0.8980392, 1,
-0.02302563, 1.146333, 0.477828, 0, 1, 0.9058824, 1,
-0.0222676, 0.6077669, -1.088735, 0, 1, 0.9098039, 1,
-0.0207732, 1.2842, -0.2824824, 0, 1, 0.9176471, 1,
-0.02018455, 0.8575633, 0.3131205, 0, 1, 0.9215686, 1,
-0.01660091, -0.08891849, -3.012314, 0, 1, 0.9294118, 1,
-0.00951393, -0.9264927, -3.325491, 0, 1, 0.9333333, 1,
-0.009018388, 0.6680344, 0.1214374, 0, 1, 0.9411765, 1,
-0.007002209, 0.7714956, -2.243628, 0, 1, 0.945098, 1,
-0.005540259, 1.001731, -0.1656582, 0, 1, 0.9529412, 1,
-0.005352959, 1.250833, -0.9197094, 0, 1, 0.9568627, 1,
-0.003209917, 0.2244476, 0.9983422, 0, 1, 0.9647059, 1,
-0.00263642, -0.4308993, -3.736239, 0, 1, 0.9686275, 1,
0.002807335, 1.364138, 0.5526934, 0, 1, 0.9764706, 1,
0.003590491, 0.9651534, -0.5269591, 0, 1, 0.9803922, 1,
0.008187286, 1.488469, -0.1822402, 0, 1, 0.9882353, 1,
0.008261671, -0.07858948, 1.951667, 0, 1, 0.9921569, 1,
0.01981063, -0.09586437, 1.436044, 0, 1, 1, 1,
0.02052395, -0.4753494, 3.567587, 0, 0.9921569, 1, 1,
0.02188832, -1.472348, 2.660495, 0, 0.9882353, 1, 1,
0.02596667, -0.9856295, 3.340754, 0, 0.9803922, 1, 1,
0.0271315, 0.8449608, -0.1284919, 0, 0.9764706, 1, 1,
0.02971382, -0.5370982, 3.36059, 0, 0.9686275, 1, 1,
0.03278444, 0.6926622, 1.226184, 0, 0.9647059, 1, 1,
0.03633226, 2.984124, -0.6097806, 0, 0.9568627, 1, 1,
0.03634013, -0.4121943, 3.631187, 0, 0.9529412, 1, 1,
0.03680457, -1.21295, 2.772793, 0, 0.945098, 1, 1,
0.03833651, -0.634479, 2.872354, 0, 0.9411765, 1, 1,
0.03897466, -0.8552753, 3.149015, 0, 0.9333333, 1, 1,
0.04076341, -0.4982066, 2.207088, 0, 0.9294118, 1, 1,
0.04337185, 1.357766, -0.1240423, 0, 0.9215686, 1, 1,
0.04391211, -0.2270759, 2.760665, 0, 0.9176471, 1, 1,
0.04884867, -0.5011375, 2.445166, 0, 0.9098039, 1, 1,
0.04991123, -0.8780767, 2.203422, 0, 0.9058824, 1, 1,
0.05181117, -2.037007, 1.814272, 0, 0.8980392, 1, 1,
0.05361137, 0.3035636, -1.006387, 0, 0.8901961, 1, 1,
0.05386676, 0.1647041, -0.7314237, 0, 0.8862745, 1, 1,
0.05475926, -0.3753048, 4.44776, 0, 0.8784314, 1, 1,
0.05648015, 0.3580544, 1.390097, 0, 0.8745098, 1, 1,
0.05810418, 0.9528402, -0.01850612, 0, 0.8666667, 1, 1,
0.0604711, 0.8792019, -0.1038769, 0, 0.8627451, 1, 1,
0.06571531, -0.2317892, 3.209995, 0, 0.854902, 1, 1,
0.06717401, -0.7324496, 2.089844, 0, 0.8509804, 1, 1,
0.06737739, -0.4987631, 3.446207, 0, 0.8431373, 1, 1,
0.07374617, 1.594321, -0.9220928, 0, 0.8392157, 1, 1,
0.075475, 2.000541, 1.846379, 0, 0.8313726, 1, 1,
0.07595842, 0.9977779, -1.957702, 0, 0.827451, 1, 1,
0.07712267, 0.439322, -0.3675762, 0, 0.8196079, 1, 1,
0.07805514, 0.1287605, 0.8169006, 0, 0.8156863, 1, 1,
0.07913147, -1.659922, 4.515135, 0, 0.8078431, 1, 1,
0.07997251, -0.9048904, 2.502398, 0, 0.8039216, 1, 1,
0.08035538, 0.5585541, 0.5689266, 0, 0.7960784, 1, 1,
0.08094197, -0.2478808, 3.546352, 0, 0.7882353, 1, 1,
0.08257336, -0.2339064, 3.466464, 0, 0.7843137, 1, 1,
0.08277381, -0.7078694, 2.911415, 0, 0.7764706, 1, 1,
0.08492703, -0.7284483, 3.887374, 0, 0.772549, 1, 1,
0.08766557, 0.04105502, 0.3259715, 0, 0.7647059, 1, 1,
0.0917095, 0.4798948, 1.138393, 0, 0.7607843, 1, 1,
0.09184796, -0.05195991, 2.076928, 0, 0.7529412, 1, 1,
0.09310959, 0.5953218, 0.7420126, 0, 0.7490196, 1, 1,
0.09575313, -0.2048515, 1.841344, 0, 0.7411765, 1, 1,
0.096151, 1.35969, 0.1905849, 0, 0.7372549, 1, 1,
0.0961803, -0.9972061, 1.795438, 0, 0.7294118, 1, 1,
0.1009548, 1.147018, 0.58139, 0, 0.7254902, 1, 1,
0.1032819, 0.6757453, -0.421818, 0, 0.7176471, 1, 1,
0.1036417, 0.1970073, 0.7868057, 0, 0.7137255, 1, 1,
0.1037194, 0.9563367, -0.9010912, 0, 0.7058824, 1, 1,
0.1064001, -1.746788, 2.632631, 0, 0.6980392, 1, 1,
0.1073017, 0.9108606, 1.264431, 0, 0.6941177, 1, 1,
0.1088285, -0.1756228, 2.843029, 0, 0.6862745, 1, 1,
0.1089238, -0.216727, 4.115115, 0, 0.682353, 1, 1,
0.1105809, 0.03960124, -0.01983781, 0, 0.6745098, 1, 1,
0.1107362, 0.6990336, -1.49365, 0, 0.6705883, 1, 1,
0.1133899, -0.09406157, 1.298581, 0, 0.6627451, 1, 1,
0.1203492, -1.324574, 4.422395, 0, 0.6588235, 1, 1,
0.1204478, 0.469732, 1.465428, 0, 0.6509804, 1, 1,
0.1229736, -0.8986161, 2.926857, 0, 0.6470588, 1, 1,
0.1332017, -1.641186, 3.780031, 0, 0.6392157, 1, 1,
0.1341883, -0.337844, 2.346711, 0, 0.6352941, 1, 1,
0.1342002, -0.4232914, 1.284362, 0, 0.627451, 1, 1,
0.1389787, 1.194749, 1.009809, 0, 0.6235294, 1, 1,
0.139093, 0.2013245, -1.261396, 0, 0.6156863, 1, 1,
0.1394353, 1.176286, -0.9219899, 0, 0.6117647, 1, 1,
0.1399442, -0.1866299, 1.459467, 0, 0.6039216, 1, 1,
0.1424747, 0.1939538, 2.472921, 0, 0.5960785, 1, 1,
0.1447957, 0.07289849, 1.404893, 0, 0.5921569, 1, 1,
0.1486284, 1.457759, 0.8804386, 0, 0.5843138, 1, 1,
0.1523738, -0.1877979, 2.880818, 0, 0.5803922, 1, 1,
0.1540216, 1.385234, -0.2224775, 0, 0.572549, 1, 1,
0.1572922, -0.4731714, 2.330699, 0, 0.5686275, 1, 1,
0.1573789, -0.4013537, 4.271018, 0, 0.5607843, 1, 1,
0.1588452, 0.7437056, 0.2217719, 0, 0.5568628, 1, 1,
0.1619119, 0.9489035, 1.918708, 0, 0.5490196, 1, 1,
0.1619254, -0.1744016, 3.410516, 0, 0.5450981, 1, 1,
0.1643163, 0.2821732, 1.027423, 0, 0.5372549, 1, 1,
0.1675576, 0.7257213, -0.1938119, 0, 0.5333334, 1, 1,
0.1683969, -0.1085828, 1.450302, 0, 0.5254902, 1, 1,
0.1716987, 1.757522, -0.2323903, 0, 0.5215687, 1, 1,
0.1774933, -1.194793, 0.7951171, 0, 0.5137255, 1, 1,
0.1786682, -0.9904538, 3.252722, 0, 0.509804, 1, 1,
0.180159, -1.004734, 1.860844, 0, 0.5019608, 1, 1,
0.1801936, -1.362357, 3.812043, 0, 0.4941176, 1, 1,
0.1828471, -0.7202769, 2.589551, 0, 0.4901961, 1, 1,
0.1846999, -0.4498858, 1.889551, 0, 0.4823529, 1, 1,
0.1934689, 0.08827411, 0.09246442, 0, 0.4784314, 1, 1,
0.1940265, -0.6668438, 3.732423, 0, 0.4705882, 1, 1,
0.1955279, -1.902279, 1.459384, 0, 0.4666667, 1, 1,
0.197763, 2.322575, 0.4589944, 0, 0.4588235, 1, 1,
0.1999758, -0.4852099, 2.886128, 0, 0.454902, 1, 1,
0.2129709, 2.640979, 1.348454, 0, 0.4470588, 1, 1,
0.2134397, -0.7081279, 2.852509, 0, 0.4431373, 1, 1,
0.214252, -0.5210004, 2.272738, 0, 0.4352941, 1, 1,
0.2203524, 0.385399, 1.520987, 0, 0.4313726, 1, 1,
0.2204355, 0.5457001, -1.31451, 0, 0.4235294, 1, 1,
0.225001, -0.5547977, 1.874919, 0, 0.4196078, 1, 1,
0.2266968, 0.5083196, 0.2481617, 0, 0.4117647, 1, 1,
0.2293763, 0.2610154, 0.08672062, 0, 0.4078431, 1, 1,
0.2393981, -0.2134526, 1.93021, 0, 0.4, 1, 1,
0.2505812, -1.241457, 4.115661, 0, 0.3921569, 1, 1,
0.2526255, 0.8576618, -1.110478, 0, 0.3882353, 1, 1,
0.2552364, 1.815308, -0.5319299, 0, 0.3803922, 1, 1,
0.255263, 0.3869848, 0.5487155, 0, 0.3764706, 1, 1,
0.2560874, 0.7331886, -0.5957353, 0, 0.3686275, 1, 1,
0.2687602, 2.430814, -1.120421, 0, 0.3647059, 1, 1,
0.2721531, 1.590127, -0.005365231, 0, 0.3568628, 1, 1,
0.273742, -0.7333584, 3.3742, 0, 0.3529412, 1, 1,
0.2792182, -1.810732, 5.03784, 0, 0.345098, 1, 1,
0.2814722, -0.04502188, 1.663307, 0, 0.3411765, 1, 1,
0.2828473, 0.3070192, -1.081457, 0, 0.3333333, 1, 1,
0.2829171, -1.781241, 2.837378, 0, 0.3294118, 1, 1,
0.2903478, 2.686265, 1.231552, 0, 0.3215686, 1, 1,
0.2920708, -0.3988481, 1.719296, 0, 0.3176471, 1, 1,
0.2938301, 0.2272821, -0.162236, 0, 0.3098039, 1, 1,
0.298352, 1.704595, 0.7556232, 0, 0.3058824, 1, 1,
0.2987341, 0.1979164, -0.9555112, 0, 0.2980392, 1, 1,
0.3003783, 0.6694462, 1.842985, 0, 0.2901961, 1, 1,
0.3015721, -0.04439077, 1.348198, 0, 0.2862745, 1, 1,
0.3017781, 1.403128, 0.1211799, 0, 0.2784314, 1, 1,
0.3020524, -0.0954986, 1.251087, 0, 0.2745098, 1, 1,
0.3029408, -2.431489, 2.180677, 0, 0.2666667, 1, 1,
0.3059721, -1.381447, 2.678786, 0, 0.2627451, 1, 1,
0.3072211, -1.343671, 3.152863, 0, 0.254902, 1, 1,
0.3073089, -0.4575716, 3.341765, 0, 0.2509804, 1, 1,
0.3153062, -0.6283142, 2.596641, 0, 0.2431373, 1, 1,
0.31755, 0.2259952, -0.8178177, 0, 0.2392157, 1, 1,
0.322891, 2.766613, -1.196901, 0, 0.2313726, 1, 1,
0.3259758, -1.341864, 2.064079, 0, 0.227451, 1, 1,
0.3264212, 0.6133113, -1.315262, 0, 0.2196078, 1, 1,
0.3295793, 0.9856154, 0.1760354, 0, 0.2156863, 1, 1,
0.3299316, 0.4728269, 1.469588, 0, 0.2078431, 1, 1,
0.3340307, -0.09364159, 3.472178, 0, 0.2039216, 1, 1,
0.3424193, 1.184079, 0.1913565, 0, 0.1960784, 1, 1,
0.3430287, -0.03989986, 1.982216, 0, 0.1882353, 1, 1,
0.3452038, -0.5490572, 3.563836, 0, 0.1843137, 1, 1,
0.347758, 2.159389, 0.1394769, 0, 0.1764706, 1, 1,
0.3503551, 1.494573, 0.1912686, 0, 0.172549, 1, 1,
0.3528826, 0.1394903, 0.6516806, 0, 0.1647059, 1, 1,
0.3577772, -0.6962169, 2.157242, 0, 0.1607843, 1, 1,
0.3611049, -1.613486, 3.537218, 0, 0.1529412, 1, 1,
0.3642864, 1.36339, 1.691764, 0, 0.1490196, 1, 1,
0.364589, 0.06323839, 1.586803, 0, 0.1411765, 1, 1,
0.3696905, -1.190875, 3.436298, 0, 0.1372549, 1, 1,
0.3784381, 1.73873, 0.6168433, 0, 0.1294118, 1, 1,
0.3800085, -1.564487, 2.930102, 0, 0.1254902, 1, 1,
0.3814495, -0.4552251, 2.625748, 0, 0.1176471, 1, 1,
0.3839636, 1.517028, 1.885619, 0, 0.1137255, 1, 1,
0.384713, -0.731589, 4.205845, 0, 0.1058824, 1, 1,
0.3859615, -2.815051, 3.685305, 0, 0.09803922, 1, 1,
0.3863066, 1.657331, 1.731108, 0, 0.09411765, 1, 1,
0.387419, 0.3071365, 1.559087, 0, 0.08627451, 1, 1,
0.3910503, -0.7447518, 4.300333, 0, 0.08235294, 1, 1,
0.3914071, 0.2298467, 2.578908, 0, 0.07450981, 1, 1,
0.391467, 1.53645, 1.71114, 0, 0.07058824, 1, 1,
0.3923682, -0.4463165, 1.957767, 0, 0.0627451, 1, 1,
0.393313, -1.389779, 2.384863, 0, 0.05882353, 1, 1,
0.3976305, 1.50782, 0.607172, 0, 0.05098039, 1, 1,
0.3986458, 1.135235, -0.07707287, 0, 0.04705882, 1, 1,
0.3991624, -0.187741, 0.4660839, 0, 0.03921569, 1, 1,
0.3991807, -0.8296338, 5.478781, 0, 0.03529412, 1, 1,
0.403169, -0.5762204, 4.527743, 0, 0.02745098, 1, 1,
0.4077103, 0.5707722, 1.100603, 0, 0.02352941, 1, 1,
0.4106081, 1.120545, 1.100501, 0, 0.01568628, 1, 1,
0.4156346, 2.199442, -0.1520132, 0, 0.01176471, 1, 1,
0.4177792, -0.1278117, 2.162825, 0, 0.003921569, 1, 1,
0.4215273, -0.6142524, 3.706522, 0.003921569, 0, 1, 1,
0.4216741, -0.6140677, 1.365608, 0.007843138, 0, 1, 1,
0.4300713, 1.548741, -0.02070238, 0.01568628, 0, 1, 1,
0.4346663, 0.6460386, -1.777951, 0.01960784, 0, 1, 1,
0.4359533, 0.5159147, 0.02286441, 0.02745098, 0, 1, 1,
0.4405352, -0.6285767, 1.917729, 0.03137255, 0, 1, 1,
0.4406084, 0.5283133, 1.328426, 0.03921569, 0, 1, 1,
0.4429218, -0.132454, 1.342289, 0.04313726, 0, 1, 1,
0.4481874, -0.3470283, 1.772298, 0.05098039, 0, 1, 1,
0.4509676, -1.508757, 1.762165, 0.05490196, 0, 1, 1,
0.4561458, -0.9391116, 2.29471, 0.0627451, 0, 1, 1,
0.4586085, -1.159436, 3.402104, 0.06666667, 0, 1, 1,
0.4589961, 0.1994975, 2.851316, 0.07450981, 0, 1, 1,
0.4620469, -0.9598855, 2.369725, 0.07843138, 0, 1, 1,
0.4625613, 0.5833566, 0.9978637, 0.08627451, 0, 1, 1,
0.4656997, 1.443014, -1.507212, 0.09019608, 0, 1, 1,
0.4673057, -0.2538799, 0.6321738, 0.09803922, 0, 1, 1,
0.4673977, 1.356061, 0.7852491, 0.1058824, 0, 1, 1,
0.4721714, -0.8776778, 2.818494, 0.1098039, 0, 1, 1,
0.4739883, -1.107629, 2.675153, 0.1176471, 0, 1, 1,
0.4760029, -0.2580944, -0.6360713, 0.1215686, 0, 1, 1,
0.4775732, 1.39454, -0.08894425, 0.1294118, 0, 1, 1,
0.4785381, 0.9171619, -0.3972416, 0.1333333, 0, 1, 1,
0.4838841, -0.988121, 3.589237, 0.1411765, 0, 1, 1,
0.4870023, 2.13319, -0.8876056, 0.145098, 0, 1, 1,
0.4936014, -1.050169, 2.638996, 0.1529412, 0, 1, 1,
0.4936858, 1.022212, 0.3019325, 0.1568628, 0, 1, 1,
0.4973071, -0.02577784, 0.6370918, 0.1647059, 0, 1, 1,
0.4976232, -0.07938318, 0.3682829, 0.1686275, 0, 1, 1,
0.4994192, -1.144512, 2.679626, 0.1764706, 0, 1, 1,
0.5036773, 1.677384, -0.6924548, 0.1803922, 0, 1, 1,
0.5050797, -1.238216, 3.047298, 0.1882353, 0, 1, 1,
0.5051677, -1.677265, 2.514457, 0.1921569, 0, 1, 1,
0.5064662, 0.541138, 1.11857, 0.2, 0, 1, 1,
0.5071636, -1.526253, 1.384563, 0.2078431, 0, 1, 1,
0.5080872, 1.160301, -0.02386216, 0.2117647, 0, 1, 1,
0.5137995, -1.01575, 1.589855, 0.2196078, 0, 1, 1,
0.5149536, -0.2714259, 4.591928, 0.2235294, 0, 1, 1,
0.5151315, -0.7105633, 3.411926, 0.2313726, 0, 1, 1,
0.5160912, 0.5249586, 0.4268858, 0.2352941, 0, 1, 1,
0.5177301, -1.400543, 3.999673, 0.2431373, 0, 1, 1,
0.5247676, 0.7489693, 1.557959, 0.2470588, 0, 1, 1,
0.5250763, 0.6433277, 1.644511, 0.254902, 0, 1, 1,
0.5271743, -0.3274051, 3.255804, 0.2588235, 0, 1, 1,
0.5279105, 0.2737341, 1.585238, 0.2666667, 0, 1, 1,
0.5303872, -0.4960541, 1.198971, 0.2705882, 0, 1, 1,
0.5306376, -1.315409, 2.387338, 0.2784314, 0, 1, 1,
0.5433102, -0.8072795, 2.239597, 0.282353, 0, 1, 1,
0.5464338, -0.8030803, 4.258374, 0.2901961, 0, 1, 1,
0.5497091, -0.9852307, 1.462751, 0.2941177, 0, 1, 1,
0.5502342, 0.4682924, 0.09624828, 0.3019608, 0, 1, 1,
0.5521117, 1.240171, -0.1027074, 0.3098039, 0, 1, 1,
0.5565891, -1.105025, 3.052896, 0.3137255, 0, 1, 1,
0.556825, 1.75503, 0.5060899, 0.3215686, 0, 1, 1,
0.5570269, -1.7212, 2.241746, 0.3254902, 0, 1, 1,
0.5604934, -0.9140385, 1.430548, 0.3333333, 0, 1, 1,
0.5679471, 0.3091145, 1.233345, 0.3372549, 0, 1, 1,
0.5693475, -0.1444155, 3.559899, 0.345098, 0, 1, 1,
0.5697733, -0.2931032, 1.771438, 0.3490196, 0, 1, 1,
0.5732078, 0.2753153, 1.556202, 0.3568628, 0, 1, 1,
0.5735899, 0.7352589, 0.7297361, 0.3607843, 0, 1, 1,
0.5785633, 0.2235341, 1.763317, 0.3686275, 0, 1, 1,
0.5880877, 0.5990834, -0.5444065, 0.372549, 0, 1, 1,
0.5888555, -0.2278068, 2.138825, 0.3803922, 0, 1, 1,
0.5899867, 1.399223, -0.4126991, 0.3843137, 0, 1, 1,
0.6064336, -2.288741, 2.579427, 0.3921569, 0, 1, 1,
0.6076316, 0.9974078, 0.3409561, 0.3960784, 0, 1, 1,
0.612907, -0.7011644, 1.321537, 0.4039216, 0, 1, 1,
0.6154605, -1.305067, 1.525033, 0.4117647, 0, 1, 1,
0.6155173, -0.1198347, 2.303248, 0.4156863, 0, 1, 1,
0.6192196, 0.4845211, 0.9370881, 0.4235294, 0, 1, 1,
0.6201385, -1.789825, 3.24782, 0.427451, 0, 1, 1,
0.6250297, -1.116055, 2.015182, 0.4352941, 0, 1, 1,
0.6254494, -0.6251245, 2.371126, 0.4392157, 0, 1, 1,
0.6267712, -1.440291, 1.347884, 0.4470588, 0, 1, 1,
0.6268125, 0.9909152, 0.8842955, 0.4509804, 0, 1, 1,
0.62955, 1.13028, -0.5955639, 0.4588235, 0, 1, 1,
0.6420828, 1.941005, 0.02239045, 0.4627451, 0, 1, 1,
0.6432789, -0.08941097, 0.7009324, 0.4705882, 0, 1, 1,
0.6433708, 0.7634997, 1.596961, 0.4745098, 0, 1, 1,
0.6460617, 1.599122, 0.6187013, 0.4823529, 0, 1, 1,
0.6482405, -1.800607, 3.184389, 0.4862745, 0, 1, 1,
0.6492495, 0.1230633, 2.207026, 0.4941176, 0, 1, 1,
0.6507814, -0.9060373, 1.625825, 0.5019608, 0, 1, 1,
0.6523061, 0.8066338, 1.413072, 0.5058824, 0, 1, 1,
0.6615487, 2.809361, 0.3938935, 0.5137255, 0, 1, 1,
0.6618422, -0.005202473, 1.861082, 0.5176471, 0, 1, 1,
0.6626508, -1.745392, 4.587811, 0.5254902, 0, 1, 1,
0.6634603, -0.3456039, -0.6666416, 0.5294118, 0, 1, 1,
0.663478, 0.06955817, 0.7183719, 0.5372549, 0, 1, 1,
0.6640976, -0.6302603, 3.259925, 0.5411765, 0, 1, 1,
0.6696644, -0.3235445, 3.045069, 0.5490196, 0, 1, 1,
0.6745644, -0.2035715, 1.910208, 0.5529412, 0, 1, 1,
0.6757197, 0.3776185, 1.117301, 0.5607843, 0, 1, 1,
0.6771865, 0.8401867, 1.006343, 0.5647059, 0, 1, 1,
0.680109, 0.1170737, 1.322345, 0.572549, 0, 1, 1,
0.6947159, 1.246662, 0.4308359, 0.5764706, 0, 1, 1,
0.6950402, 0.8972653, -0.1040028, 0.5843138, 0, 1, 1,
0.6972369, 1.00056, 2.152799, 0.5882353, 0, 1, 1,
0.7097675, 0.5846941, 2.350038, 0.5960785, 0, 1, 1,
0.7119476, 0.4804818, -0.8372263, 0.6039216, 0, 1, 1,
0.7127285, 0.2127637, 0.9050807, 0.6078432, 0, 1, 1,
0.7138692, -1.000364, 1.810355, 0.6156863, 0, 1, 1,
0.7165999, 0.8707619, 0.692699, 0.6196079, 0, 1, 1,
0.7251116, -0.7231439, 2.125127, 0.627451, 0, 1, 1,
0.7287356, 1.359851, 0.3152263, 0.6313726, 0, 1, 1,
0.7307569, -0.2440396, 1.202317, 0.6392157, 0, 1, 1,
0.7347556, 1.21315, 0.9075233, 0.6431373, 0, 1, 1,
0.7424533, -1.189942, 3.526242, 0.6509804, 0, 1, 1,
0.7501613, -0.4916235, 2.600569, 0.654902, 0, 1, 1,
0.7513227, 0.8789659, 1.328384, 0.6627451, 0, 1, 1,
0.7527358, 0.4097616, 0.8886418, 0.6666667, 0, 1, 1,
0.7531203, -2.032508, 1.759547, 0.6745098, 0, 1, 1,
0.7548807, -0.03793492, 2.246338, 0.6784314, 0, 1, 1,
0.7558634, -1.056828, 3.649712, 0.6862745, 0, 1, 1,
0.7605441, -1.105907, 3.851786, 0.6901961, 0, 1, 1,
0.761485, -0.8068675, 2.464198, 0.6980392, 0, 1, 1,
0.7628152, 0.4439951, 2.104768, 0.7058824, 0, 1, 1,
0.7630103, -0.7256162, 2.277172, 0.7098039, 0, 1, 1,
0.7658041, 1.181863, 0.5250285, 0.7176471, 0, 1, 1,
0.7707415, 0.2345471, 1.511334, 0.7215686, 0, 1, 1,
0.7711326, -1.190738, 1.99693, 0.7294118, 0, 1, 1,
0.7718755, 0.9024957, 0.3734404, 0.7333333, 0, 1, 1,
0.7760479, 0.4466767, -0.4550012, 0.7411765, 0, 1, 1,
0.7821513, 0.879201, -0.257683, 0.7450981, 0, 1, 1,
0.7958639, 0.2657736, 0.7330826, 0.7529412, 0, 1, 1,
0.7963254, -0.6693149, 2.976903, 0.7568628, 0, 1, 1,
0.7975113, 0.4170077, 2.433122, 0.7647059, 0, 1, 1,
0.7998461, -0.9659481, 4.548108, 0.7686275, 0, 1, 1,
0.8071779, 1.216544, 1.037935, 0.7764706, 0, 1, 1,
0.8089321, 1.255797, 0.3957392, 0.7803922, 0, 1, 1,
0.8098329, -0.6725985, 3.389118, 0.7882353, 0, 1, 1,
0.8235193, 1.531365, 0.577787, 0.7921569, 0, 1, 1,
0.8242583, 1.527552, 0.6857839, 0.8, 0, 1, 1,
0.829248, 0.7760627, -0.553058, 0.8078431, 0, 1, 1,
0.8316696, 0.7405056, 1.065826, 0.8117647, 0, 1, 1,
0.8418524, 0.3264104, -0.1050522, 0.8196079, 0, 1, 1,
0.8419578, -0.5087507, 1.961414, 0.8235294, 0, 1, 1,
0.8441085, 0.536909, 1.599114, 0.8313726, 0, 1, 1,
0.8448701, -1.962042, 4.176862, 0.8352941, 0, 1, 1,
0.8465686, -1.370405, 2.780441, 0.8431373, 0, 1, 1,
0.8529416, -2.409693, 2.434331, 0.8470588, 0, 1, 1,
0.8566117, -0.8411395, 2.674077, 0.854902, 0, 1, 1,
0.8651345, 0.4340932, 2.028399, 0.8588235, 0, 1, 1,
0.8657611, 0.4924494, -0.3647225, 0.8666667, 0, 1, 1,
0.8702313, -2.832373, 1.835048, 0.8705882, 0, 1, 1,
0.8720694, -0.06669894, 0.1088872, 0.8784314, 0, 1, 1,
0.8752384, 0.8060173, 1.437466, 0.8823529, 0, 1, 1,
0.8783925, -0.7262949, 2.314821, 0.8901961, 0, 1, 1,
0.8814667, -0.9729163, 1.007826, 0.8941177, 0, 1, 1,
0.8819178, -1.67395, 2.197153, 0.9019608, 0, 1, 1,
0.881951, -0.5197687, 1.315606, 0.9098039, 0, 1, 1,
0.8925018, -1.875884, 1.023094, 0.9137255, 0, 1, 1,
0.8941413, -2.422712, 4.368639, 0.9215686, 0, 1, 1,
0.8984738, -0.5741045, 1.454068, 0.9254902, 0, 1, 1,
0.9148797, 0.5736089, -0.05906576, 0.9333333, 0, 1, 1,
0.9179347, 2.302678, -0.2043627, 0.9372549, 0, 1, 1,
0.9185007, -0.7126581, 0.5528913, 0.945098, 0, 1, 1,
0.9219292, -0.7495694, 3.787781, 0.9490196, 0, 1, 1,
0.9244106, 0.439638, 2.152128, 0.9568627, 0, 1, 1,
0.9253347, 0.9627916, 1.813012, 0.9607843, 0, 1, 1,
0.9272922, 1.030723, 2.100475, 0.9686275, 0, 1, 1,
0.9274901, -1.329184, 0.800209, 0.972549, 0, 1, 1,
0.9352149, -0.06869251, 3.207919, 0.9803922, 0, 1, 1,
0.9392664, -1.000796, 3.246889, 0.9843137, 0, 1, 1,
0.9413306, -0.09627698, 1.263717, 0.9921569, 0, 1, 1,
0.9434503, 2.622799, 2.622315, 0.9960784, 0, 1, 1,
0.9438519, 1.206121, 0.4886729, 1, 0, 0.9960784, 1,
0.9448089, 1.07739, -0.7804561, 1, 0, 0.9882353, 1,
0.9457535, 0.8256046, 2.98802, 1, 0, 0.9843137, 1,
0.9507359, -1.735582, 2.897336, 1, 0, 0.9764706, 1,
0.9511582, 0.6627412, 0.5726096, 1, 0, 0.972549, 1,
0.9527678, -1.680421, 2.379287, 1, 0, 0.9647059, 1,
0.955419, 1.231972, -0.3965135, 1, 0, 0.9607843, 1,
0.956041, 0.4858091, -0.5350075, 1, 0, 0.9529412, 1,
0.9579251, 2.020555, 0.9976197, 1, 0, 0.9490196, 1,
0.9581978, -0.3413711, 2.896059, 1, 0, 0.9411765, 1,
0.9627143, 0.6541297, 0.6844921, 1, 0, 0.9372549, 1,
0.9689656, 0.0227408, 1.626119, 1, 0, 0.9294118, 1,
0.9710104, 1.007705, 2.919133, 1, 0, 0.9254902, 1,
0.9805819, 0.526975, 1.327569, 1, 0, 0.9176471, 1,
0.9868779, -0.9286972, 2.332294, 1, 0, 0.9137255, 1,
0.9874493, 1.235599, 1.771011, 1, 0, 0.9058824, 1,
0.9964934, 1.472352, 0.6183184, 1, 0, 0.9019608, 1,
0.9997358, 0.1372165, 0.2469912, 1, 0, 0.8941177, 1,
1.009256, -0.6394669, 3.060183, 1, 0, 0.8862745, 1,
1.012158, -0.2893844, 1.407633, 1, 0, 0.8823529, 1,
1.01718, 1.360374, 1.173787, 1, 0, 0.8745098, 1,
1.021278, 0.2812241, 0.4627703, 1, 0, 0.8705882, 1,
1.025185, 0.2638122, 1.506097, 1, 0, 0.8627451, 1,
1.02785, -0.2229134, 1.748816, 1, 0, 0.8588235, 1,
1.045703, 1.108742, -0.7395604, 1, 0, 0.8509804, 1,
1.046502, -0.7674983, 4.245669, 1, 0, 0.8470588, 1,
1.049996, -0.1694386, 0.3619285, 1, 0, 0.8392157, 1,
1.061676, -0.5474744, 1.96015, 1, 0, 0.8352941, 1,
1.063503, -0.05106382, 0.835656, 1, 0, 0.827451, 1,
1.064514, 0.3524277, -0.05611558, 1, 0, 0.8235294, 1,
1.065156, -1.23608, 2.834249, 1, 0, 0.8156863, 1,
1.072366, -0.4412327, 3.079544, 1, 0, 0.8117647, 1,
1.075574, -0.9017312, 3.400346, 1, 0, 0.8039216, 1,
1.09142, 0.4281367, 1.155029, 1, 0, 0.7960784, 1,
1.105835, -0.3690296, 3.2814, 1, 0, 0.7921569, 1,
1.107173, -0.6715856, 2.254208, 1, 0, 0.7843137, 1,
1.11595, 0.1947026, 0.7828839, 1, 0, 0.7803922, 1,
1.116794, 0.1310772, 1.797333, 1, 0, 0.772549, 1,
1.122958, 1.098305, 0.8957757, 1, 0, 0.7686275, 1,
1.12376, 0.5623652, 0.241846, 1, 0, 0.7607843, 1,
1.130246, -0.2431267, 1.774717, 1, 0, 0.7568628, 1,
1.135775, 0.7152438, -0.6558531, 1, 0, 0.7490196, 1,
1.136997, 1.433181, -0.09213912, 1, 0, 0.7450981, 1,
1.138377, 0.4942671, 2.653342, 1, 0, 0.7372549, 1,
1.145286, -0.06190371, 2.543294, 1, 0, 0.7333333, 1,
1.154024, -0.4689045, 3.342812, 1, 0, 0.7254902, 1,
1.159011, -0.4730008, 2.157928, 1, 0, 0.7215686, 1,
1.166251, 0.9617876, 0.356704, 1, 0, 0.7137255, 1,
1.17089, 1.043534, 1.606733, 1, 0, 0.7098039, 1,
1.171237, 1.054684, 0.3222491, 1, 0, 0.7019608, 1,
1.187151, 1.926448, -0.07826724, 1, 0, 0.6941177, 1,
1.18937, 0.7051737, 1.399651, 1, 0, 0.6901961, 1,
1.202543, 1.434827, 0.6822946, 1, 0, 0.682353, 1,
1.203006, 0.9474388, 1.222505, 1, 0, 0.6784314, 1,
1.213426, -0.1562816, 1.574237, 1, 0, 0.6705883, 1,
1.214736, 0.170262, -0.5265233, 1, 0, 0.6666667, 1,
1.217444, 2.679838, 0.894443, 1, 0, 0.6588235, 1,
1.221161, -0.6452152, 2.255397, 1, 0, 0.654902, 1,
1.239803, -0.3647021, 0.2345411, 1, 0, 0.6470588, 1,
1.252878, -0.9902821, 1.473052, 1, 0, 0.6431373, 1,
1.254149, -0.6268206, 2.794119, 1, 0, 0.6352941, 1,
1.261043, -1.555515, 4.910195, 1, 0, 0.6313726, 1,
1.261236, 0.00300261, 1.153872, 1, 0, 0.6235294, 1,
1.263257, -0.2482567, 1.120124, 1, 0, 0.6196079, 1,
1.270155, -0.3800808, 3.876883, 1, 0, 0.6117647, 1,
1.271885, 1.349955, 1.801207, 1, 0, 0.6078432, 1,
1.275601, 0.09265957, 0.6628371, 1, 0, 0.6, 1,
1.282959, 0.1442738, 3.079778, 1, 0, 0.5921569, 1,
1.283143, -1.053934, 3.230856, 1, 0, 0.5882353, 1,
1.283467, -0.1793715, 0.8885508, 1, 0, 0.5803922, 1,
1.285504, -1.799163, 2.393885, 1, 0, 0.5764706, 1,
1.290504, -0.8303447, 3.968523, 1, 0, 0.5686275, 1,
1.294305, -1.496739, 1.487406, 1, 0, 0.5647059, 1,
1.295778, -0.5080588, 0.9101379, 1, 0, 0.5568628, 1,
1.297431, 0.5832061, 0.4559564, 1, 0, 0.5529412, 1,
1.29836, -0.5384719, 2.109095, 1, 0, 0.5450981, 1,
1.303483, 1.518402, 0.2186686, 1, 0, 0.5411765, 1,
1.308811, -2.683066, 2.476277, 1, 0, 0.5333334, 1,
1.322181, -0.01368473, 2.000212, 1, 0, 0.5294118, 1,
1.323199, -1.379625, 2.792786, 1, 0, 0.5215687, 1,
1.340336, 0.7314762, 2.711668, 1, 0, 0.5176471, 1,
1.34127, -2.181, 1.202851, 1, 0, 0.509804, 1,
1.363258, -1.459785, 5.118869, 1, 0, 0.5058824, 1,
1.379108, 0.5206482, -0.6641746, 1, 0, 0.4980392, 1,
1.379574, 0.6444248, 0.2582479, 1, 0, 0.4901961, 1,
1.433041, -1.69981, 4.085016, 1, 0, 0.4862745, 1,
1.439478, 0.5013306, 1.786627, 1, 0, 0.4784314, 1,
1.441302, -1.362198, 2.968501, 1, 0, 0.4745098, 1,
1.442315, 0.6689995, 1.35576, 1, 0, 0.4666667, 1,
1.447524, 0.6099332, 1.261399, 1, 0, 0.4627451, 1,
1.460871, -0.019564, 2.739223, 1, 0, 0.454902, 1,
1.462676, 0.4465701, -0.8223145, 1, 0, 0.4509804, 1,
1.465344, -0.8491428, 1.662577, 1, 0, 0.4431373, 1,
1.467591, -0.9089706, 2.375633, 1, 0, 0.4392157, 1,
1.467756, 0.4674819, -0.3431153, 1, 0, 0.4313726, 1,
1.475375, -2.671129, 2.860503, 1, 0, 0.427451, 1,
1.476962, 1.266157, 0.248177, 1, 0, 0.4196078, 1,
1.47734, -0.2847065, 2.594563, 1, 0, 0.4156863, 1,
1.480725, 0.9031415, 1.505074, 1, 0, 0.4078431, 1,
1.507922, -0.2670413, -0.363176, 1, 0, 0.4039216, 1,
1.515509, 0.7905133, 0.5373375, 1, 0, 0.3960784, 1,
1.532284, -1.013011, 1.63278, 1, 0, 0.3882353, 1,
1.542579, 0.4819003, 1.41725, 1, 0, 0.3843137, 1,
1.550188, -0.9513191, 2.92507, 1, 0, 0.3764706, 1,
1.573094, 0.9075641, 1.217254, 1, 0, 0.372549, 1,
1.577598, 0.9067212, 0.3847335, 1, 0, 0.3647059, 1,
1.585369, -0.6900029, 0.9152165, 1, 0, 0.3607843, 1,
1.590802, -0.8103385, 0.5334949, 1, 0, 0.3529412, 1,
1.606518, 2.289564, -0.1114216, 1, 0, 0.3490196, 1,
1.624991, 1.169728, 2.30317, 1, 0, 0.3411765, 1,
1.659628, -1.268409, 1.901052, 1, 0, 0.3372549, 1,
1.677918, -0.8579896, 2.878539, 1, 0, 0.3294118, 1,
1.681896, 0.3195338, 1.166021, 1, 0, 0.3254902, 1,
1.689416, -0.5764831, 1.512092, 1, 0, 0.3176471, 1,
1.702155, 1.423533, 1.447034, 1, 0, 0.3137255, 1,
1.707542, -1.471754, 1.903818, 1, 0, 0.3058824, 1,
1.714835, 0.01102768, 0.8361419, 1, 0, 0.2980392, 1,
1.719361, -0.8711708, 0.490401, 1, 0, 0.2941177, 1,
1.728693, 0.6998164, 1.731697, 1, 0, 0.2862745, 1,
1.730616, -0.9534028, 1.494238, 1, 0, 0.282353, 1,
1.739164, 1.874825, -0.08528922, 1, 0, 0.2745098, 1,
1.740589, 0.1800392, 1.555859, 1, 0, 0.2705882, 1,
1.760725, 1.912481, 1.813072, 1, 0, 0.2627451, 1,
1.76995, 0.6164885, 1.050842, 1, 0, 0.2588235, 1,
1.777729, 0.0552734, 2.546148, 1, 0, 0.2509804, 1,
1.804652, -0.537138, 1.774583, 1, 0, 0.2470588, 1,
1.805762, 0.3304559, 2.380449, 1, 0, 0.2392157, 1,
1.806531, 0.7361079, 0.3772428, 1, 0, 0.2352941, 1,
1.813214, -0.04654983, 0.851615, 1, 0, 0.227451, 1,
1.826916, -0.4536399, 3.397327, 1, 0, 0.2235294, 1,
1.836959, 0.3683798, 0.5832921, 1, 0, 0.2156863, 1,
1.845804, 0.1619384, 3.254195, 1, 0, 0.2117647, 1,
1.878145, 1.47948, 1.227103, 1, 0, 0.2039216, 1,
1.906098, -0.8172698, 1.063249, 1, 0, 0.1960784, 1,
1.922478, 1.034964, 0.7628444, 1, 0, 0.1921569, 1,
1.958283, 0.1131261, 2.730255, 1, 0, 0.1843137, 1,
1.965636, -0.5692455, 0.3619108, 1, 0, 0.1803922, 1,
1.974289, -1.540833, 1.458323, 1, 0, 0.172549, 1,
1.976355, 0.7457789, 2.842812, 1, 0, 0.1686275, 1,
1.978965, 0.3900788, 1.601492, 1, 0, 0.1607843, 1,
1.980112, -1.216523, 3.980326, 1, 0, 0.1568628, 1,
1.98625, 0.1722653, 0.4431112, 1, 0, 0.1490196, 1,
1.987913, 0.7077656, 2.974289, 1, 0, 0.145098, 1,
2.020513, -0.05576761, 0.4695947, 1, 0, 0.1372549, 1,
2.057867, 0.9987949, 0.4682815, 1, 0, 0.1333333, 1,
2.079457, -0.5074627, 1.890898, 1, 0, 0.1254902, 1,
2.084189, -0.01263563, 1.526737, 1, 0, 0.1215686, 1,
2.103767, 1.091236, 1.223361, 1, 0, 0.1137255, 1,
2.150594, 0.9838008, 0.5703292, 1, 0, 0.1098039, 1,
2.158956, -0.7665878, 1.857238, 1, 0, 0.1019608, 1,
2.185075, -0.9655492, 1.302666, 1, 0, 0.09411765, 1,
2.239404, -1.177821, -1.01648, 1, 0, 0.09019608, 1,
2.245978, -1.734463, 2.008173, 1, 0, 0.08235294, 1,
2.252522, -1.660689, 2.022717, 1, 0, 0.07843138, 1,
2.253748, -0.1719709, 3.019855, 1, 0, 0.07058824, 1,
2.253926, 0.2329281, 0.892271, 1, 0, 0.06666667, 1,
2.291895, 2.438001, 0.9817871, 1, 0, 0.05882353, 1,
2.427585, -1.584451, 1.515519, 1, 0, 0.05490196, 1,
2.533641, 0.9877133, 1.142479, 1, 0, 0.04705882, 1,
2.619541, -1.136242, 1.66127, 1, 0, 0.04313726, 1,
2.809067, -0.009305865, 1.168892, 1, 0, 0.03529412, 1,
2.884291, 0.9388413, 1.141263, 1, 0, 0.03137255, 1,
3.091831, -0.06382272, -0.4571732, 1, 0, 0.02352941, 1,
3.170964, -0.3251841, 3.435937, 1, 0, 0.01960784, 1,
3.250362, -0.3428023, 2.552505, 1, 0, 0.01176471, 1,
3.39197, 0.4656861, 0.6980549, 1, 0, 0.007843138, 1
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
0.09707344, -4.099641, -8.273561, 0, -0.5, 0.5, 0.5,
0.09707344, -4.099641, -8.273561, 1, -0.5, 0.5, 0.5,
0.09707344, -4.099641, -8.273561, 1, 1.5, 0.5, 0.5,
0.09707344, -4.099641, -8.273561, 0, 1.5, 0.5, 0.5
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
-4.314793, 0.1015235, -8.273561, 0, -0.5, 0.5, 0.5,
-4.314793, 0.1015235, -8.273561, 1, -0.5, 0.5, 0.5,
-4.314793, 0.1015235, -8.273561, 1, 1.5, 0.5, 0.5,
-4.314793, 0.1015235, -8.273561, 0, 1.5, 0.5, 0.5
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
-4.314793, -4.099641, -0.4008014, 0, -0.5, 0.5, 0.5,
-4.314793, -4.099641, -0.4008014, 1, -0.5, 0.5, 0.5,
-4.314793, -4.099641, -0.4008014, 1, 1.5, 0.5, 0.5,
-4.314793, -4.099641, -0.4008014, 0, 1.5, 0.5, 0.5
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
-3, -3.130142, -6.456771,
3, -3.130142, -6.456771,
-3, -3.130142, -6.456771,
-3, -3.291725, -6.75957,
-2, -3.130142, -6.456771,
-2, -3.291725, -6.75957,
-1, -3.130142, -6.456771,
-1, -3.291725, -6.75957,
0, -3.130142, -6.456771,
0, -3.291725, -6.75957,
1, -3.130142, -6.456771,
1, -3.291725, -6.75957,
2, -3.130142, -6.456771,
2, -3.291725, -6.75957,
3, -3.130142, -6.456771,
3, -3.291725, -6.75957
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
-3, -3.614892, -7.365167, 0, -0.5, 0.5, 0.5,
-3, -3.614892, -7.365167, 1, -0.5, 0.5, 0.5,
-3, -3.614892, -7.365167, 1, 1.5, 0.5, 0.5,
-3, -3.614892, -7.365167, 0, 1.5, 0.5, 0.5,
-2, -3.614892, -7.365167, 0, -0.5, 0.5, 0.5,
-2, -3.614892, -7.365167, 1, -0.5, 0.5, 0.5,
-2, -3.614892, -7.365167, 1, 1.5, 0.5, 0.5,
-2, -3.614892, -7.365167, 0, 1.5, 0.5, 0.5,
-1, -3.614892, -7.365167, 0, -0.5, 0.5, 0.5,
-1, -3.614892, -7.365167, 1, -0.5, 0.5, 0.5,
-1, -3.614892, -7.365167, 1, 1.5, 0.5, 0.5,
-1, -3.614892, -7.365167, 0, 1.5, 0.5, 0.5,
0, -3.614892, -7.365167, 0, -0.5, 0.5, 0.5,
0, -3.614892, -7.365167, 1, -0.5, 0.5, 0.5,
0, -3.614892, -7.365167, 1, 1.5, 0.5, 0.5,
0, -3.614892, -7.365167, 0, 1.5, 0.5, 0.5,
1, -3.614892, -7.365167, 0, -0.5, 0.5, 0.5,
1, -3.614892, -7.365167, 1, -0.5, 0.5, 0.5,
1, -3.614892, -7.365167, 1, 1.5, 0.5, 0.5,
1, -3.614892, -7.365167, 0, 1.5, 0.5, 0.5,
2, -3.614892, -7.365167, 0, -0.5, 0.5, 0.5,
2, -3.614892, -7.365167, 1, -0.5, 0.5, 0.5,
2, -3.614892, -7.365167, 1, 1.5, 0.5, 0.5,
2, -3.614892, -7.365167, 0, 1.5, 0.5, 0.5,
3, -3.614892, -7.365167, 0, -0.5, 0.5, 0.5,
3, -3.614892, -7.365167, 1, -0.5, 0.5, 0.5,
3, -3.614892, -7.365167, 1, 1.5, 0.5, 0.5,
3, -3.614892, -7.365167, 0, 1.5, 0.5, 0.5
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
-3.29667, -3, -6.456771,
-3.29667, 3, -6.456771,
-3.29667, -3, -6.456771,
-3.466357, -3, -6.75957,
-3.29667, -2, -6.456771,
-3.466357, -2, -6.75957,
-3.29667, -1, -6.456771,
-3.466357, -1, -6.75957,
-3.29667, 0, -6.456771,
-3.466357, 0, -6.75957,
-3.29667, 1, -6.456771,
-3.466357, 1, -6.75957,
-3.29667, 2, -6.456771,
-3.466357, 2, -6.75957,
-3.29667, 3, -6.456771,
-3.466357, 3, -6.75957
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
-3.805732, -3, -7.365167, 0, -0.5, 0.5, 0.5,
-3.805732, -3, -7.365167, 1, -0.5, 0.5, 0.5,
-3.805732, -3, -7.365167, 1, 1.5, 0.5, 0.5,
-3.805732, -3, -7.365167, 0, 1.5, 0.5, 0.5,
-3.805732, -2, -7.365167, 0, -0.5, 0.5, 0.5,
-3.805732, -2, -7.365167, 1, -0.5, 0.5, 0.5,
-3.805732, -2, -7.365167, 1, 1.5, 0.5, 0.5,
-3.805732, -2, -7.365167, 0, 1.5, 0.5, 0.5,
-3.805732, -1, -7.365167, 0, -0.5, 0.5, 0.5,
-3.805732, -1, -7.365167, 1, -0.5, 0.5, 0.5,
-3.805732, -1, -7.365167, 1, 1.5, 0.5, 0.5,
-3.805732, -1, -7.365167, 0, 1.5, 0.5, 0.5,
-3.805732, 0, -7.365167, 0, -0.5, 0.5, 0.5,
-3.805732, 0, -7.365167, 1, -0.5, 0.5, 0.5,
-3.805732, 0, -7.365167, 1, 1.5, 0.5, 0.5,
-3.805732, 0, -7.365167, 0, 1.5, 0.5, 0.5,
-3.805732, 1, -7.365167, 0, -0.5, 0.5, 0.5,
-3.805732, 1, -7.365167, 1, -0.5, 0.5, 0.5,
-3.805732, 1, -7.365167, 1, 1.5, 0.5, 0.5,
-3.805732, 1, -7.365167, 0, 1.5, 0.5, 0.5,
-3.805732, 2, -7.365167, 0, -0.5, 0.5, 0.5,
-3.805732, 2, -7.365167, 1, -0.5, 0.5, 0.5,
-3.805732, 2, -7.365167, 1, 1.5, 0.5, 0.5,
-3.805732, 2, -7.365167, 0, 1.5, 0.5, 0.5,
-3.805732, 3, -7.365167, 0, -0.5, 0.5, 0.5,
-3.805732, 3, -7.365167, 1, -0.5, 0.5, 0.5,
-3.805732, 3, -7.365167, 1, 1.5, 0.5, 0.5,
-3.805732, 3, -7.365167, 0, 1.5, 0.5, 0.5
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
-3.29667, -3.130142, -6,
-3.29667, -3.130142, 4,
-3.29667, -3.130142, -6,
-3.466357, -3.291725, -6,
-3.29667, -3.130142, -4,
-3.466357, -3.291725, -4,
-3.29667, -3.130142, -2,
-3.466357, -3.291725, -2,
-3.29667, -3.130142, 0,
-3.466357, -3.291725, 0,
-3.29667, -3.130142, 2,
-3.466357, -3.291725, 2,
-3.29667, -3.130142, 4,
-3.466357, -3.291725, 4
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
-3.805732, -3.614892, -6, 0, -0.5, 0.5, 0.5,
-3.805732, -3.614892, -6, 1, -0.5, 0.5, 0.5,
-3.805732, -3.614892, -6, 1, 1.5, 0.5, 0.5,
-3.805732, -3.614892, -6, 0, 1.5, 0.5, 0.5,
-3.805732, -3.614892, -4, 0, -0.5, 0.5, 0.5,
-3.805732, -3.614892, -4, 1, -0.5, 0.5, 0.5,
-3.805732, -3.614892, -4, 1, 1.5, 0.5, 0.5,
-3.805732, -3.614892, -4, 0, 1.5, 0.5, 0.5,
-3.805732, -3.614892, -2, 0, -0.5, 0.5, 0.5,
-3.805732, -3.614892, -2, 1, -0.5, 0.5, 0.5,
-3.805732, -3.614892, -2, 1, 1.5, 0.5, 0.5,
-3.805732, -3.614892, -2, 0, 1.5, 0.5, 0.5,
-3.805732, -3.614892, 0, 0, -0.5, 0.5, 0.5,
-3.805732, -3.614892, 0, 1, -0.5, 0.5, 0.5,
-3.805732, -3.614892, 0, 1, 1.5, 0.5, 0.5,
-3.805732, -3.614892, 0, 0, 1.5, 0.5, 0.5,
-3.805732, -3.614892, 2, 0, -0.5, 0.5, 0.5,
-3.805732, -3.614892, 2, 1, -0.5, 0.5, 0.5,
-3.805732, -3.614892, 2, 1, 1.5, 0.5, 0.5,
-3.805732, -3.614892, 2, 0, 1.5, 0.5, 0.5,
-3.805732, -3.614892, 4, 0, -0.5, 0.5, 0.5,
-3.805732, -3.614892, 4, 1, -0.5, 0.5, 0.5,
-3.805732, -3.614892, 4, 1, 1.5, 0.5, 0.5,
-3.805732, -3.614892, 4, 0, 1.5, 0.5, 0.5
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
-3.29667, -3.130142, -6.456771,
-3.29667, 3.333189, -6.456771,
-3.29667, -3.130142, 5.655168,
-3.29667, 3.333189, 5.655168,
-3.29667, -3.130142, -6.456771,
-3.29667, -3.130142, 5.655168,
-3.29667, 3.333189, -6.456771,
-3.29667, 3.333189, 5.655168,
-3.29667, -3.130142, -6.456771,
3.490817, -3.130142, -6.456771,
-3.29667, -3.130142, 5.655168,
3.490817, -3.130142, 5.655168,
-3.29667, 3.333189, -6.456771,
3.490817, 3.333189, -6.456771,
-3.29667, 3.333189, 5.655168,
3.490817, 3.333189, 5.655168,
3.490817, -3.130142, -6.456771,
3.490817, 3.333189, -6.456771,
3.490817, -3.130142, 5.655168,
3.490817, 3.333189, 5.655168,
3.490817, -3.130142, -6.456771,
3.490817, -3.130142, 5.655168,
3.490817, 3.333189, -6.456771,
3.490817, 3.333189, 5.655168
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
var radius = 8.177816;
var distance = 36.38403;
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
mvMatrix.translate( -0.09707344, -0.1015235, 0.4008014 );
mvMatrix.scale( 1.302693, 1.368028, 0.7300248 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.38403);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
picolinate_potassium<-read.table("picolinate_potassium.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-picolinate_potassium$V2
```

```
## Error in eval(expr, envir, enclos): object 'picolinate_potassium' not found
```

```r
y<-picolinate_potassium$V3
```

```
## Error in eval(expr, envir, enclos): object 'picolinate_potassium' not found
```

```r
z<-picolinate_potassium$V4
```

```
## Error in eval(expr, envir, enclos): object 'picolinate_potassium' not found
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
-3.197823, -0.8475559, -2.527487, 0, 0, 1, 1, 1,
-2.864287, -0.3832675, -2.65684, 1, 0, 0, 1, 1,
-2.685309, -0.818081, -2.571004, 1, 0, 0, 1, 1,
-2.629182, 2.104665, -1.724963, 1, 0, 0, 1, 1,
-2.582936, 0.158186, -1.676535, 1, 0, 0, 1, 1,
-2.55902, 0.2005118, -1.734371, 1, 0, 0, 1, 1,
-2.532095, 0.6509658, -2.761411, 0, 0, 0, 1, 1,
-2.423902, 1.12156, -3.570839, 0, 0, 0, 1, 1,
-2.41203, 0.6133793, -2.854116, 0, 0, 0, 1, 1,
-2.316084, 0.3252872, -1.567638, 0, 0, 0, 1, 1,
-2.275477, 0.01876956, -0.8462319, 0, 0, 0, 1, 1,
-2.24806, 0.9681796, -1.324688, 0, 0, 0, 1, 1,
-2.242403, 0.1142597, -0.09727754, 0, 0, 0, 1, 1,
-2.232762, -1.300718, -3.016506, 1, 1, 1, 1, 1,
-2.191103, -0.2952697, -1.211158, 1, 1, 1, 1, 1,
-2.172875, 1.042933, -0.6873232, 1, 1, 1, 1, 1,
-2.152388, -1.523622, -3.151311, 1, 1, 1, 1, 1,
-2.14145, -0.5591805, -0.5123321, 1, 1, 1, 1, 1,
-2.134755, -0.3636667, -0.5847484, 1, 1, 1, 1, 1,
-2.1049, -1.038858, -1.696893, 1, 1, 1, 1, 1,
-2.104521, 0.06654052, -1.309762, 1, 1, 1, 1, 1,
-2.085281, -0.5117731, -1.149313, 1, 1, 1, 1, 1,
-2.083101, 0.01270624, -2.08854, 1, 1, 1, 1, 1,
-2.05076, -0.3116014, -2.160207, 1, 1, 1, 1, 1,
-2.034262, 0.4443936, -1.376775, 1, 1, 1, 1, 1,
-2.017704, -0.4705063, -1.666161, 1, 1, 1, 1, 1,
-1.968545, 0.3460132, 0.619691, 1, 1, 1, 1, 1,
-1.960318, -0.2061253, 1.018973, 1, 1, 1, 1, 1,
-1.956538, -1.526406, -2.048101, 0, 0, 1, 1, 1,
-1.940702, -0.1075743, -2.664089, 1, 0, 0, 1, 1,
-1.934665, -0.8979749, -3.92579, 1, 0, 0, 1, 1,
-1.927541, -2.759641, -3.482351, 1, 0, 0, 1, 1,
-1.923776, -0.5000374, -1.521164, 1, 0, 0, 1, 1,
-1.900377, -0.1249363, -1.880641, 1, 0, 0, 1, 1,
-1.879486, -0.7135453, -1.030298, 0, 0, 0, 1, 1,
-1.859766, 0.006824444, -3.001319, 0, 0, 0, 1, 1,
-1.856792, 0.1656519, -2.450363, 0, 0, 0, 1, 1,
-1.855207, 0.4737844, 1.733996, 0, 0, 0, 1, 1,
-1.836729, 1.142179, -0.526445, 0, 0, 0, 1, 1,
-1.836543, 0.06044343, -1.167235, 0, 0, 0, 1, 1,
-1.821925, -0.1615236, -1.482258, 0, 0, 0, 1, 1,
-1.811574, 1.365292, -0.01630706, 1, 1, 1, 1, 1,
-1.806566, 0.04391965, -2.453327, 1, 1, 1, 1, 1,
-1.793399, 1.78727, -1.487375, 1, 1, 1, 1, 1,
-1.778827, -1.969519, -2.841657, 1, 1, 1, 1, 1,
-1.760602, 0.5932664, -1.646531, 1, 1, 1, 1, 1,
-1.752503, 0.5954667, -0.9640523, 1, 1, 1, 1, 1,
-1.751686, -0.1270403, -2.064046, 1, 1, 1, 1, 1,
-1.703336, 0.2077685, -2.321974, 1, 1, 1, 1, 1,
-1.684972, 0.3537199, -0.6465939, 1, 1, 1, 1, 1,
-1.664163, -0.6707678, -0.5715742, 1, 1, 1, 1, 1,
-1.631411, 0.8251158, -0.4810086, 1, 1, 1, 1, 1,
-1.620524, -0.2979398, -2.179244, 1, 1, 1, 1, 1,
-1.610496, -0.2528226, -2.604212, 1, 1, 1, 1, 1,
-1.603669, -0.8703988, -2.187793, 1, 1, 1, 1, 1,
-1.589264, -0.1877181, -1.127124, 1, 1, 1, 1, 1,
-1.580559, -0.1693834, -0.6824345, 0, 0, 1, 1, 1,
-1.55976, -0.1699238, -2.064507, 1, 0, 0, 1, 1,
-1.556785, 1.495645, 0.05070797, 1, 0, 0, 1, 1,
-1.55542, 0.2197859, -0.2671851, 1, 0, 0, 1, 1,
-1.543847, 1.315768, -1.114779, 1, 0, 0, 1, 1,
-1.53558, 0.498283, -1.150237, 1, 0, 0, 1, 1,
-1.533832, -0.9863753, -2.973717, 0, 0, 0, 1, 1,
-1.52137, 0.9477683, -1.910309, 0, 0, 0, 1, 1,
-1.518116, 0.3861388, -1.987052, 0, 0, 0, 1, 1,
-1.512937, -1.062024, -3.375636, 0, 0, 0, 1, 1,
-1.49726, -0.8897088, -2.413888, 0, 0, 0, 1, 1,
-1.493784, -1.102611, -1.450163, 0, 0, 0, 1, 1,
-1.484263, -0.9629668, -2.996699, 0, 0, 0, 1, 1,
-1.47604, 0.2634973, -2.450579, 1, 1, 1, 1, 1,
-1.472702, -1.013236, -2.850412, 1, 1, 1, 1, 1,
-1.470338, 0.02711798, -1.72313, 1, 1, 1, 1, 1,
-1.447586, 0.9043298, -0.1139991, 1, 1, 1, 1, 1,
-1.438661, 0.4773501, -1.163219, 1, 1, 1, 1, 1,
-1.436155, -0.6382728, -2.434952, 1, 1, 1, 1, 1,
-1.435671, -0.4696971, -2.411455, 1, 1, 1, 1, 1,
-1.435541, -1.186483, -2.923135, 1, 1, 1, 1, 1,
-1.41676, -0.4989647, -2.123979, 1, 1, 1, 1, 1,
-1.404214, 0.3632009, -1.26994, 1, 1, 1, 1, 1,
-1.396669, -0.8850917, -1.247723, 1, 1, 1, 1, 1,
-1.383878, -0.3871768, -2.939686, 1, 1, 1, 1, 1,
-1.367228, -1.387615, -2.773274, 1, 1, 1, 1, 1,
-1.365924, -0.5797204, -2.558276, 1, 1, 1, 1, 1,
-1.351393, -0.9539186, -3.479805, 1, 1, 1, 1, 1,
-1.34213, 0.4531153, -0.8023082, 0, 0, 1, 1, 1,
-1.340393, 0.1804707, -1.143365, 1, 0, 0, 1, 1,
-1.34016, 0.3547425, -2.248241, 1, 0, 0, 1, 1,
-1.331742, 1.026048, -0.2081943, 1, 0, 0, 1, 1,
-1.328092, 1.226138, 0.07480036, 1, 0, 0, 1, 1,
-1.307377, 0.7581029, 1.296584, 1, 0, 0, 1, 1,
-1.284273, -1.271497, -1.950314, 0, 0, 0, 1, 1,
-1.279543, -0.6010492, -1.587281, 0, 0, 0, 1, 1,
-1.278838, -0.3710189, -2.434808, 0, 0, 0, 1, 1,
-1.275254, -0.8084601, -2.256977, 0, 0, 0, 1, 1,
-1.272257, -0.02467461, -1.192749, 0, 0, 0, 1, 1,
-1.266986, -1.074908, -1.905735, 0, 0, 0, 1, 1,
-1.23666, 0.2388161, -1.646801, 0, 0, 0, 1, 1,
-1.236568, 0.7055436, -0.2195629, 1, 1, 1, 1, 1,
-1.233983, -0.6731061, -0.9801341, 1, 1, 1, 1, 1,
-1.23307, 1.015988, -0.5794767, 1, 1, 1, 1, 1,
-1.229079, -0.2389612, -0.2897487, 1, 1, 1, 1, 1,
-1.212302, -0.7225204, -2.441406, 1, 1, 1, 1, 1,
-1.207979, -0.4204196, -2.95005, 1, 1, 1, 1, 1,
-1.207244, -1.310397, -2.294205, 1, 1, 1, 1, 1,
-1.20034, -0.4316273, 0.08424448, 1, 1, 1, 1, 1,
-1.183407, -0.2349691, 0.06868344, 1, 1, 1, 1, 1,
-1.17403, 0.2114384, -1.784851, 1, 1, 1, 1, 1,
-1.172549, 0.2682687, -1.462344, 1, 1, 1, 1, 1,
-1.169566, 0.9678399, -1.402319, 1, 1, 1, 1, 1,
-1.164192, -1.878305, -3.287937, 1, 1, 1, 1, 1,
-1.158762, 1.034951, -1.707488, 1, 1, 1, 1, 1,
-1.150396, -0.8903853, -3.183078, 1, 1, 1, 1, 1,
-1.147752, -1.943855, -2.604513, 0, 0, 1, 1, 1,
-1.146288, 0.2891742, -2.003501, 1, 0, 0, 1, 1,
-1.138173, -0.6627963, -0.2167252, 1, 0, 0, 1, 1,
-1.13645, -0.4201789, -0.1586749, 1, 0, 0, 1, 1,
-1.134403, -2.347306, -2.179061, 1, 0, 0, 1, 1,
-1.132297, -0.6118838, -1.344005, 1, 0, 0, 1, 1,
-1.126709, 1.244084, -0.278699, 0, 0, 0, 1, 1,
-1.123365, 0.134777, -1.814016, 0, 0, 0, 1, 1,
-1.11962, -0.06624799, -1.62495, 0, 0, 0, 1, 1,
-1.119616, 0.975857, -1.948379, 0, 0, 0, 1, 1,
-1.118713, -1.062813, -3.213046, 0, 0, 0, 1, 1,
-1.112731, 0.6636875, -1.773214, 0, 0, 0, 1, 1,
-1.110989, -0.5627303, -1.292334, 0, 0, 0, 1, 1,
-1.110295, -1.119768, -2.028658, 1, 1, 1, 1, 1,
-1.110161, -0.2325134, -0.7360036, 1, 1, 1, 1, 1,
-1.109053, 0.7972112, -0.01741621, 1, 1, 1, 1, 1,
-1.10522, 0.7477671, -1.417033, 1, 1, 1, 1, 1,
-1.10267, 1.187714, 0.02468318, 1, 1, 1, 1, 1,
-1.102394, -0.4839315, -3.057093, 1, 1, 1, 1, 1,
-1.099443, -0.4975641, -2.910547, 1, 1, 1, 1, 1,
-1.0986, -0.5626361, -2.525421, 1, 1, 1, 1, 1,
-1.091871, 0.9534338, -0.1443781, 1, 1, 1, 1, 1,
-1.090285, -1.417442, -3.452725, 1, 1, 1, 1, 1,
-1.084166, 0.431728, 0.5660163, 1, 1, 1, 1, 1,
-1.070708, -0.1732332, -3.099602, 1, 1, 1, 1, 1,
-1.062344, 0.3976464, -0.5788831, 1, 1, 1, 1, 1,
-1.062033, 0.6408136, -0.8995862, 1, 1, 1, 1, 1,
-1.061229, 0.1475531, -1.53838, 1, 1, 1, 1, 1,
-1.0556, 0.2481451, -1.625556, 0, 0, 1, 1, 1,
-1.032968, 1.51769, 0.05936915, 1, 0, 0, 1, 1,
-1.025797, 0.1230888, -0.1400232, 1, 0, 0, 1, 1,
-1.023418, -0.2194887, -1.235069, 1, 0, 0, 1, 1,
-1.021655, -0.3764143, -2.711297, 1, 0, 0, 1, 1,
-1.01782, -0.000322422, -2.623459, 1, 0, 0, 1, 1,
-0.9997628, -1.04796, -1.459678, 0, 0, 0, 1, 1,
-0.9947758, -0.4105967, -3.180811, 0, 0, 0, 1, 1,
-0.9945197, 0.7727104, -2.901436, 0, 0, 0, 1, 1,
-0.99191, 0.4976121, -1.015952, 0, 0, 0, 1, 1,
-0.9878336, -0.7281491, -3.130203, 0, 0, 0, 1, 1,
-0.9859214, 1.048482, 0.3288322, 0, 0, 0, 1, 1,
-0.982009, -0.1774492, -1.441935, 0, 0, 0, 1, 1,
-0.9779018, -0.695605, -2.839741, 1, 1, 1, 1, 1,
-0.9778616, 2.083632, 1.198339, 1, 1, 1, 1, 1,
-0.9769946, 1.709054, -0.4754068, 1, 1, 1, 1, 1,
-0.9734478, -0.9740119, -2.335329, 1, 1, 1, 1, 1,
-0.9727933, 0.2047666, -1.231275, 1, 1, 1, 1, 1,
-0.961526, 1.760228, 0.2988049, 1, 1, 1, 1, 1,
-0.9579935, -0.1445484, -0.5401006, 1, 1, 1, 1, 1,
-0.9556982, 1.888001, -0.8727649, 1, 1, 1, 1, 1,
-0.9470387, 0.1109673, -0.0479592, 1, 1, 1, 1, 1,
-0.9469244, -0.4987736, -1.870097, 1, 1, 1, 1, 1,
-0.9465257, 0.7607806, -2.297609, 1, 1, 1, 1, 1,
-0.9440744, -0.6671741, -3.262089, 1, 1, 1, 1, 1,
-0.9434419, -0.4059853, -2.781142, 1, 1, 1, 1, 1,
-0.9374285, -0.451305, -2.220843, 1, 1, 1, 1, 1,
-0.9372988, -0.1165466, -3.454336, 1, 1, 1, 1, 1,
-0.9363949, 0.8182296, -0.2505874, 0, 0, 1, 1, 1,
-0.9361426, 1.474489, -0.5998018, 1, 0, 0, 1, 1,
-0.9323676, -0.2897417, -4.915389, 1, 0, 0, 1, 1,
-0.9292202, 0.3370505, 0.1975396, 1, 0, 0, 1, 1,
-0.9200975, 0.0187708, -1.619251, 1, 0, 0, 1, 1,
-0.9199151, -0.2288545, -3.072443, 1, 0, 0, 1, 1,
-0.9072922, -1.205576, -2.229524, 0, 0, 0, 1, 1,
-0.9072477, 0.4007053, -0.4953029, 0, 0, 0, 1, 1,
-0.9062385, 0.3393008, 0.5699409, 0, 0, 0, 1, 1,
-0.9047912, 1.470062, -1.686864, 0, 0, 0, 1, 1,
-0.9045504, 0.0319741, -1.866566, 0, 0, 0, 1, 1,
-0.9006947, -0.3124039, -2.898016, 0, 0, 0, 1, 1,
-0.8988162, 0.671822, -0.2850498, 0, 0, 0, 1, 1,
-0.8901171, 1.085554, 0.5906628, 1, 1, 1, 1, 1,
-0.8887144, -1.14665, -2.247968, 1, 1, 1, 1, 1,
-0.887534, 0.3627462, -2.139324, 1, 1, 1, 1, 1,
-0.8827953, 0.6032591, 1.165922, 1, 1, 1, 1, 1,
-0.8826914, 0.2131678, 0.5466514, 1, 1, 1, 1, 1,
-0.8793083, 0.3189506, -0.8882922, 1, 1, 1, 1, 1,
-0.8758126, 1.016773, -1.317627, 1, 1, 1, 1, 1,
-0.8742933, 1.172936, 0.1988438, 1, 1, 1, 1, 1,
-0.8697022, -0.2120753, -1.909305, 1, 1, 1, 1, 1,
-0.8693962, -0.330756, -1.999222, 1, 1, 1, 1, 1,
-0.8639436, 1.50973, 1.324391, 1, 1, 1, 1, 1,
-0.8616592, -1.13446, -2.287404, 1, 1, 1, 1, 1,
-0.8614587, -0.2702449, -1.758169, 1, 1, 1, 1, 1,
-0.8566492, 0.08838464, -2.520724, 1, 1, 1, 1, 1,
-0.8551801, -0.9095455, -3.272678, 1, 1, 1, 1, 1,
-0.8545147, -1.196178, -2.68078, 0, 0, 1, 1, 1,
-0.8487713, 0.1020905, 0.8569965, 1, 0, 0, 1, 1,
-0.8473335, -0.8789877, -2.844421, 1, 0, 0, 1, 1,
-0.84461, 0.2454177, -0.4502687, 1, 0, 0, 1, 1,
-0.8404428, 1.049026, -0.6870838, 1, 0, 0, 1, 1,
-0.825749, -0.7858183, -2.653319, 1, 0, 0, 1, 1,
-0.8256589, 0.5676367, 0.03690944, 0, 0, 0, 1, 1,
-0.8251126, 1.024304, -0.6650032, 0, 0, 0, 1, 1,
-0.8245307, -3.036016, -3.531099, 0, 0, 0, 1, 1,
-0.8224829, 0.339567, -2.053921, 0, 0, 0, 1, 1,
-0.8147657, -0.6291849, -3.032187, 0, 0, 0, 1, 1,
-0.8116845, -0.9238164, -2.025993, 0, 0, 0, 1, 1,
-0.8053846, -0.6130378, -2.260627, 0, 0, 0, 1, 1,
-0.8052163, -2.204093, -2.200038, 1, 1, 1, 1, 1,
-0.8042117, -0.80202, -2.286037, 1, 1, 1, 1, 1,
-0.8009103, 0.05104446, -2.397781, 1, 1, 1, 1, 1,
-0.800775, -0.8292907, -2.140023, 1, 1, 1, 1, 1,
-0.8003546, -0.1763602, -2.829373, 1, 1, 1, 1, 1,
-0.7899036, 1.880603, -0.06376521, 1, 1, 1, 1, 1,
-0.7888854, 0.4690796, -1.23206, 1, 1, 1, 1, 1,
-0.785938, 1.49156, -1.734576, 1, 1, 1, 1, 1,
-0.785144, -1.084691, -1.361498, 1, 1, 1, 1, 1,
-0.782488, -1.245602, -3.093012, 1, 1, 1, 1, 1,
-0.7796338, -0.4179296, -2.044237, 1, 1, 1, 1, 1,
-0.7788556, 0.2381262, -3.470545, 1, 1, 1, 1, 1,
-0.7768465, -0.2553107, -2.57105, 1, 1, 1, 1, 1,
-0.7765827, -0.8650792, -4.194003, 1, 1, 1, 1, 1,
-0.7750713, 0.5979081, 0.760895, 1, 1, 1, 1, 1,
-0.7709985, 1.030036, -0.08341777, 0, 0, 1, 1, 1,
-0.7707226, 0.9124292, -2.89477, 1, 0, 0, 1, 1,
-0.7707164, -1.6198, -2.588797, 1, 0, 0, 1, 1,
-0.7702098, 0.8565314, 0.6090857, 1, 0, 0, 1, 1,
-0.7693978, -1.539354, -1.612339, 1, 0, 0, 1, 1,
-0.7605444, -0.248774, -2.64643, 1, 0, 0, 1, 1,
-0.7588562, 0.78576, -0.5566787, 0, 0, 0, 1, 1,
-0.7532325, 0.5068167, 0.3902564, 0, 0, 0, 1, 1,
-0.7488651, 0.3459435, 0.6675847, 0, 0, 0, 1, 1,
-0.7461646, 0.102027, 0.2616278, 0, 0, 0, 1, 1,
-0.7440076, -0.3625541, -4.432506, 0, 0, 0, 1, 1,
-0.7394212, -0.5132497, -1.431658, 0, 0, 0, 1, 1,
-0.7334508, 0.9807502, 0.7421573, 0, 0, 0, 1, 1,
-0.7298998, 0.2757502, -2.548662, 1, 1, 1, 1, 1,
-0.7260388, -0.4381166, -2.604839, 1, 1, 1, 1, 1,
-0.7240282, 0.8716748, -0.6771057, 1, 1, 1, 1, 1,
-0.7182603, 1.126466, -0.8534673, 1, 1, 1, 1, 1,
-0.7179599, -0.2449829, -3.440413, 1, 1, 1, 1, 1,
-0.7165401, -0.8442972, -2.164391, 1, 1, 1, 1, 1,
-0.7163004, -0.2138754, -1.176002, 1, 1, 1, 1, 1,
-0.7154841, -0.151228, -0.9298409, 1, 1, 1, 1, 1,
-0.6978709, -1.677423, -1.626486, 1, 1, 1, 1, 1,
-0.6939512, -0.5673274, -1.960414, 1, 1, 1, 1, 1,
-0.6938192, 0.3466673, 0.3972446, 1, 1, 1, 1, 1,
-0.6903821, -1.05744, -1.289901, 1, 1, 1, 1, 1,
-0.6864595, -0.3344522, -0.8341491, 1, 1, 1, 1, 1,
-0.6838665, -1.367076, -3.450651, 1, 1, 1, 1, 1,
-0.6834571, -0.2157447, -1.107504, 1, 1, 1, 1, 1,
-0.6806195, 0.1021218, 1.438879, 0, 0, 1, 1, 1,
-0.6797934, 0.04470842, -1.934027, 1, 0, 0, 1, 1,
-0.6787326, 1.025543, -4.147003, 1, 0, 0, 1, 1,
-0.6706338, -0.1386216, -1.585279, 1, 0, 0, 1, 1,
-0.6658897, 0.5532463, -0.426641, 1, 0, 0, 1, 1,
-0.664439, -0.8321362, -2.45592, 1, 0, 0, 1, 1,
-0.6510068, -1.001278, -2.727715, 0, 0, 0, 1, 1,
-0.6474687, 1.147868, -2.369841, 0, 0, 0, 1, 1,
-0.646181, -0.03581417, -1.369979, 0, 0, 0, 1, 1,
-0.6441186, -0.9124548, -1.963619, 0, 0, 0, 1, 1,
-0.6423558, 1.092106, 0.5413323, 0, 0, 0, 1, 1,
-0.6391016, -0.239436, -2.626824, 0, 0, 0, 1, 1,
-0.6375112, 0.8003736, -0.2139763, 0, 0, 0, 1, 1,
-0.6360505, -0.5516291, -3.71529, 1, 1, 1, 1, 1,
-0.6325538, 0.4185807, -2.087343, 1, 1, 1, 1, 1,
-0.6202855, -0.2648638, -0.8581406, 1, 1, 1, 1, 1,
-0.6090351, -0.1801228, -1.724838, 1, 1, 1, 1, 1,
-0.6079133, -0.2769908, -3.838752, 1, 1, 1, 1, 1,
-0.6070491, -0.1751, -4.377795, 1, 1, 1, 1, 1,
-0.6048598, 0.2175242, -0.4361232, 1, 1, 1, 1, 1,
-0.6043931, 0.01524531, -0.8093582, 1, 1, 1, 1, 1,
-0.604155, 0.5911649, -1.584946, 1, 1, 1, 1, 1,
-0.602993, 0.4233898, -1.787855, 1, 1, 1, 1, 1,
-0.5978673, -0.2148128, -1.888662, 1, 1, 1, 1, 1,
-0.5907425, -0.5388097, -3.13275, 1, 1, 1, 1, 1,
-0.5905858, 0.03393117, -0.5771078, 1, 1, 1, 1, 1,
-0.5849975, -0.3158311, -0.774905, 1, 1, 1, 1, 1,
-0.5798438, 0.9622214, -0.14545, 1, 1, 1, 1, 1,
-0.5744769, 0.02623842, -0.8537856, 0, 0, 1, 1, 1,
-0.5701487, 0.5780499, -1.415171, 1, 0, 0, 1, 1,
-0.5644577, 0.511973, -0.8196826, 1, 0, 0, 1, 1,
-0.5632443, 0.1970641, -0.6159281, 1, 0, 0, 1, 1,
-0.5601111, 0.05564835, -2.461216, 1, 0, 0, 1, 1,
-0.5596451, 0.7689348, 0.2864079, 1, 0, 0, 1, 1,
-0.5594348, 0.8350945, -0.1323875, 0, 0, 0, 1, 1,
-0.5587165, 2.219877, -0.2810274, 0, 0, 0, 1, 1,
-0.5575581, 0.7073852, -1.266322, 0, 0, 0, 1, 1,
-0.5561126, -1.481524, -2.799491, 0, 0, 0, 1, 1,
-0.5511504, -0.009393174, -3.281091, 0, 0, 0, 1, 1,
-0.5475111, 0.251638, -0.7999665, 0, 0, 0, 1, 1,
-0.5410916, -1.107317, -2.206114, 0, 0, 0, 1, 1,
-0.5390159, 2.330081, 0.6454108, 1, 1, 1, 1, 1,
-0.5333177, -0.06454971, -1.316272, 1, 1, 1, 1, 1,
-0.5332236, -2.036165, -2.453708, 1, 1, 1, 1, 1,
-0.5322909, -0.6376259, -2.574801, 1, 1, 1, 1, 1,
-0.529771, 0.8792903, -0.2145663, 1, 1, 1, 1, 1,
-0.5277658, -0.5738022, -3.410949, 1, 1, 1, 1, 1,
-0.5256045, 0.3940879, -1.562135, 1, 1, 1, 1, 1,
-0.522631, -0.07339278, -3.552658, 1, 1, 1, 1, 1,
-0.5180641, 1.971871, -1.093905, 1, 1, 1, 1, 1,
-0.5078791, -0.2249938, -3.249449, 1, 1, 1, 1, 1,
-0.5071838, 0.963579, -1.197627, 1, 1, 1, 1, 1,
-0.5041285, -0.8803976, -3.168182, 1, 1, 1, 1, 1,
-0.5001857, 0.2141831, -0.7382383, 1, 1, 1, 1, 1,
-0.4990304, -0.1738353, -2.550802, 1, 1, 1, 1, 1,
-0.4959395, -0.2908435, -2.488945, 1, 1, 1, 1, 1,
-0.4922561, -0.1914054, -0.9044442, 0, 0, 1, 1, 1,
-0.4921724, -1.021669, -1.99702, 1, 0, 0, 1, 1,
-0.4896101, 0.3979022, -0.3576736, 1, 0, 0, 1, 1,
-0.4860949, 1.482838, -1.147109, 1, 0, 0, 1, 1,
-0.4853267, 0.4132918, -1.401442, 1, 0, 0, 1, 1,
-0.4785402, 3.239063, -1.699083, 1, 0, 0, 1, 1,
-0.4769968, 2.722162, -0.8908682, 0, 0, 0, 1, 1,
-0.4653975, 0.1195468, -2.201396, 0, 0, 0, 1, 1,
-0.4614793, -0.786172, -1.001474, 0, 0, 0, 1, 1,
-0.4606633, -0.5378564, -2.136755, 0, 0, 0, 1, 1,
-0.4603653, -0.6713845, -2.721535, 0, 0, 0, 1, 1,
-0.4553852, 0.4623683, -1.449509, 0, 0, 0, 1, 1,
-0.4533226, -0.2219705, -3.300471, 0, 0, 0, 1, 1,
-0.4523225, -1.050017, -2.597712, 1, 1, 1, 1, 1,
-0.4440005, -0.07648209, -1.333043, 1, 1, 1, 1, 1,
-0.4387588, 0.2658116, -0.9557609, 1, 1, 1, 1, 1,
-0.4381795, 0.6116132, -0.02030696, 1, 1, 1, 1, 1,
-0.4369946, -0.2107114, -1.999778, 1, 1, 1, 1, 1,
-0.4354689, -0.7275186, -0.5314106, 1, 1, 1, 1, 1,
-0.4345239, 0.692591, -0.8004649, 1, 1, 1, 1, 1,
-0.4332669, -0.1072571, -2.05071, 1, 1, 1, 1, 1,
-0.432953, 0.5376565, -0.5784401, 1, 1, 1, 1, 1,
-0.4326344, -1.118893, -2.139611, 1, 1, 1, 1, 1,
-0.4274469, 0.4755954, -0.839402, 1, 1, 1, 1, 1,
-0.4243907, -0.5749618, -3.646379, 1, 1, 1, 1, 1,
-0.4230927, 0.7981199, -0.1493198, 1, 1, 1, 1, 1,
-0.4183488, -0.3137422, -1.188488, 1, 1, 1, 1, 1,
-0.4118682, -0.03946439, -1.333357, 1, 1, 1, 1, 1,
-0.4066162, -1.334731, -4.118616, 0, 0, 1, 1, 1,
-0.4034735, 0.6425493, 0.3641981, 1, 0, 0, 1, 1,
-0.3948315, 0.08925495, -0.8941057, 1, 0, 0, 1, 1,
-0.3923557, -1.020163, -5.589459, 1, 0, 0, 1, 1,
-0.3890253, -0.03290782, -0.7521489, 1, 0, 0, 1, 1,
-0.3849475, -0.3216629, -1.810823, 1, 0, 0, 1, 1,
-0.3807389, 0.0311033, -0.5053668, 0, 0, 0, 1, 1,
-0.3786495, 0.4363154, 0.3515759, 0, 0, 0, 1, 1,
-0.3764433, -0.5489175, -3.301363, 0, 0, 0, 1, 1,
-0.3751469, 1.521092, 0.556522, 0, 0, 0, 1, 1,
-0.3743173, 0.01331679, -1.362369, 0, 0, 0, 1, 1,
-0.3719483, 0.4818119, 0.1731235, 0, 0, 0, 1, 1,
-0.3713349, 0.02207738, -1.131802, 0, 0, 0, 1, 1,
-0.3690479, -1.356054, -4.380084, 1, 1, 1, 1, 1,
-0.3676016, -0.2345152, -3.242917, 1, 1, 1, 1, 1,
-0.3620951, -1.263246, -1.862129, 1, 1, 1, 1, 1,
-0.3591266, -1.12809, -2.821316, 1, 1, 1, 1, 1,
-0.3588778, 0.320951, -1.361952, 1, 1, 1, 1, 1,
-0.3588514, -0.7403913, -3.090961, 1, 1, 1, 1, 1,
-0.3586036, 1.395799, 0.1397015, 1, 1, 1, 1, 1,
-0.3547358, 0.2944742, -1.315174, 1, 1, 1, 1, 1,
-0.3476673, 0.873741, -1.487583, 1, 1, 1, 1, 1,
-0.3451054, 0.6390491, -1.326603, 1, 1, 1, 1, 1,
-0.3419618, 1.115265, -0.8544865, 1, 1, 1, 1, 1,
-0.3411663, -0.8814447, -1.834137, 1, 1, 1, 1, 1,
-0.3378403, -1.040669, -3.172517, 1, 1, 1, 1, 1,
-0.3377383, -0.3168091, -3.835161, 1, 1, 1, 1, 1,
-0.3353803, 0.1067983, -1.493804, 1, 1, 1, 1, 1,
-0.3274063, -1.057125, -6.280384, 0, 0, 1, 1, 1,
-0.3268245, 0.642617, 0.9036096, 1, 0, 0, 1, 1,
-0.3267552, -0.6741759, -3.113037, 1, 0, 0, 1, 1,
-0.3261156, -1.845208, -1.970124, 1, 0, 0, 1, 1,
-0.3189253, -0.09525605, -1.927822, 1, 0, 0, 1, 1,
-0.3141826, -0.1448636, -1.651113, 1, 0, 0, 1, 1,
-0.3099743, -0.2395417, -2.656079, 0, 0, 0, 1, 1,
-0.3075546, -0.7761347, -3.122348, 0, 0, 0, 1, 1,
-0.3040655, -0.5907527, 0.05001662, 0, 0, 0, 1, 1,
-0.3038068, -1.312493, -2.324852, 0, 0, 0, 1, 1,
-0.3004717, 0.04680169, -2.815681, 0, 0, 0, 1, 1,
-0.3001151, 1.55517, 0.4682733, 0, 0, 0, 1, 1,
-0.2944584, 1.237355, 0.1323718, 0, 0, 0, 1, 1,
-0.292664, 0.17116, -2.63887, 1, 1, 1, 1, 1,
-0.2903045, -0.1278049, -0.5576906, 1, 1, 1, 1, 1,
-0.2896699, 0.2327422, 0.6627453, 1, 1, 1, 1, 1,
-0.2889152, 1.354241, -1.946815, 1, 1, 1, 1, 1,
-0.2882338, -0.3810821, -2.442915, 1, 1, 1, 1, 1,
-0.2820893, -0.598739, -2.403819, 1, 1, 1, 1, 1,
-0.2772825, 0.4569144, -0.3502084, 1, 1, 1, 1, 1,
-0.2767537, -0.1920731, -2.951331, 1, 1, 1, 1, 1,
-0.2752744, 1.317776, -1.705944, 1, 1, 1, 1, 1,
-0.2718034, 0.3335778, -1.693556, 1, 1, 1, 1, 1,
-0.2713255, 0.3119896, -0.3352018, 1, 1, 1, 1, 1,
-0.2699431, -0.6060476, -2.183393, 1, 1, 1, 1, 1,
-0.2682976, 0.8464594, -0.4528818, 1, 1, 1, 1, 1,
-0.2551414, 0.5889492, -0.4183767, 1, 1, 1, 1, 1,
-0.254158, -0.1601116, -3.288017, 1, 1, 1, 1, 1,
-0.2480751, -1.920891, -5.662631, 0, 0, 1, 1, 1,
-0.2480683, 0.05658089, -3.01427, 1, 0, 0, 1, 1,
-0.2447505, 0.04904523, -0.5077917, 1, 0, 0, 1, 1,
-0.2444434, 0.5204794, -0.6360917, 1, 0, 0, 1, 1,
-0.2420586, -1.134714, -2.825027, 1, 0, 0, 1, 1,
-0.2419096, 1.220273, -1.986498, 1, 0, 0, 1, 1,
-0.2400198, -0.1038487, -1.84051, 0, 0, 0, 1, 1,
-0.23686, 0.5735835, 0.8701542, 0, 0, 0, 1, 1,
-0.2351728, -2.481699, -4.124959, 0, 0, 0, 1, 1,
-0.2281557, -0.2600213, -2.274595, 0, 0, 0, 1, 1,
-0.226305, 0.2660738, -1.060434, 0, 0, 0, 1, 1,
-0.2230218, 0.8380556, 0.2977945, 0, 0, 0, 1, 1,
-0.2213197, 1.555755, 0.1213256, 0, 0, 0, 1, 1,
-0.2133851, 0.5874918, -2.121766, 1, 1, 1, 1, 1,
-0.2126997, -1.018322, -2.680119, 1, 1, 1, 1, 1,
-0.211625, 0.7413426, -0.5259659, 1, 1, 1, 1, 1,
-0.2109558, -1.060718, -1.521969, 1, 1, 1, 1, 1,
-0.2109197, -1.539818, -3.237898, 1, 1, 1, 1, 1,
-0.2099898, 1.767649, -1.016451, 1, 1, 1, 1, 1,
-0.2090327, -1.244064, -4.736917, 1, 1, 1, 1, 1,
-0.2059699, -1.518416, -4.045022, 1, 1, 1, 1, 1,
-0.1921424, -0.057925, -2.447162, 1, 1, 1, 1, 1,
-0.1835626, -0.5879027, -1.969911, 1, 1, 1, 1, 1,
-0.178266, -1.388258, -4.003554, 1, 1, 1, 1, 1,
-0.1748775, -0.213029, -1.931011, 1, 1, 1, 1, 1,
-0.1746456, 1.351619, 0.4324547, 1, 1, 1, 1, 1,
-0.1687642, 2.270886, -0.2644395, 1, 1, 1, 1, 1,
-0.1685969, 0.3582557, -0.6515738, 1, 1, 1, 1, 1,
-0.1676164, -0.8384079, -4.184645, 0, 0, 1, 1, 1,
-0.1651737, -1.298796, -2.592006, 1, 0, 0, 1, 1,
-0.1620175, 0.3977707, -0.5693142, 1, 0, 0, 1, 1,
-0.1569714, 0.3867818, -0.8503369, 1, 0, 0, 1, 1,
-0.1531785, 2.022683, 0.7152173, 1, 0, 0, 1, 1,
-0.1510721, -1.089939, -3.455035, 1, 0, 0, 1, 1,
-0.1480991, 0.7554501, 0.932959, 0, 0, 0, 1, 1,
-0.1448921, 0.7031214, -0.02639492, 0, 0, 0, 1, 1,
-0.1405224, 0.3705234, 0.9480896, 0, 0, 0, 1, 1,
-0.1403224, -1.482031, -2.94515, 0, 0, 0, 1, 1,
-0.1379035, -0.4502276, -2.016924, 0, 0, 0, 1, 1,
-0.1369201, 0.1728964, -2.122098, 0, 0, 0, 1, 1,
-0.1338127, 0.7656994, -1.514712, 0, 0, 0, 1, 1,
-0.1325929, -0.8015985, -2.802371, 1, 1, 1, 1, 1,
-0.1321788, -1.151778, -1.77756, 1, 1, 1, 1, 1,
-0.1319088, 0.8054649, 0.5740508, 1, 1, 1, 1, 1,
-0.1306465, 0.9558108, -0.3519771, 1, 1, 1, 1, 1,
-0.1297681, -0.937506, -2.730357, 1, 1, 1, 1, 1,
-0.1283227, 0.961931, -1.871944, 1, 1, 1, 1, 1,
-0.1260288, -0.3343725, -3.917701, 1, 1, 1, 1, 1,
-0.1207935, 1.401414, 1.053344, 1, 1, 1, 1, 1,
-0.1185359, -0.959804, -6.010103, 1, 1, 1, 1, 1,
-0.115547, 1.341235, -2.778469, 1, 1, 1, 1, 1,
-0.113723, -1.021901, -4.36804, 1, 1, 1, 1, 1,
-0.1122614, -0.5358213, -0.905279, 1, 1, 1, 1, 1,
-0.1096496, 0.5246916, -0.01093808, 1, 1, 1, 1, 1,
-0.1090397, -1.094118, -2.373849, 1, 1, 1, 1, 1,
-0.1078392, 0.1912657, -2.370909, 1, 1, 1, 1, 1,
-0.1072631, 0.3473233, -1.079854, 0, 0, 1, 1, 1,
-0.1069332, 0.4885805, -1.261809, 1, 0, 0, 1, 1,
-0.1058007, 0.04909642, -2.030013, 1, 0, 0, 1, 1,
-0.1045818, -0.6214465, -3.266542, 1, 0, 0, 1, 1,
-0.1029854, -0.08901998, -2.829489, 1, 0, 0, 1, 1,
-0.1011549, 0.177541, 1.640238, 1, 0, 0, 1, 1,
-0.09893576, 2.471803, -0.2306084, 0, 0, 0, 1, 1,
-0.09790724, -2.183025, -2.517292, 0, 0, 0, 1, 1,
-0.09654203, 0.8723345, -1.204646, 0, 0, 0, 1, 1,
-0.09287409, -1.348354, -3.898629, 0, 0, 0, 1, 1,
-0.09275679, 0.6653638, 1.008442, 0, 0, 0, 1, 1,
-0.08809239, -0.3759553, -1.649634, 0, 0, 0, 1, 1,
-0.08760673, -0.4104003, -2.981803, 0, 0, 0, 1, 1,
-0.08418327, 0.1620725, -2.638418, 1, 1, 1, 1, 1,
-0.08012479, -0.3544979, -2.954958, 1, 1, 1, 1, 1,
-0.0798496, -0.06716766, -3.427634, 1, 1, 1, 1, 1,
-0.07781135, -0.09272392, -3.195523, 1, 1, 1, 1, 1,
-0.07505639, 0.4453698, 0.3263013, 1, 1, 1, 1, 1,
-0.06661008, -0.5939018, -3.13891, 1, 1, 1, 1, 1,
-0.06036713, -1.040826, -1.59986, 1, 1, 1, 1, 1,
-0.05963203, 0.3344724, -0.4622044, 1, 1, 1, 1, 1,
-0.0588394, -0.2739124, -2.491813, 1, 1, 1, 1, 1,
-0.05213936, -0.960326, -3.523909, 1, 1, 1, 1, 1,
-0.05106501, -0.7104098, -3.591706, 1, 1, 1, 1, 1,
-0.04693053, 1.451265, -0.7432107, 1, 1, 1, 1, 1,
-0.04668181, -0.5664667, -2.501727, 1, 1, 1, 1, 1,
-0.04647174, 0.4015733, 2.414303, 1, 1, 1, 1, 1,
-0.04352299, -1.379075, -3.402636, 1, 1, 1, 1, 1,
-0.03903648, -1.611677, -6.005442, 0, 0, 1, 1, 1,
-0.03110904, -1.553715, -3.028746, 1, 0, 0, 1, 1,
-0.02995609, -1.401188, -1.052538, 1, 0, 0, 1, 1,
-0.02986794, 0.6853198, 0.9132772, 1, 0, 0, 1, 1,
-0.02952004, -0.5360424, -2.267889, 1, 0, 0, 1, 1,
-0.02851294, 0.770584, -0.3260112, 1, 0, 0, 1, 1,
-0.0282909, -0.5315769, -3.609295, 0, 0, 0, 1, 1,
-0.0257639, 1.023222, -2.564256, 0, 0, 0, 1, 1,
-0.02302563, 1.146333, 0.477828, 0, 0, 0, 1, 1,
-0.0222676, 0.6077669, -1.088735, 0, 0, 0, 1, 1,
-0.0207732, 1.2842, -0.2824824, 0, 0, 0, 1, 1,
-0.02018455, 0.8575633, 0.3131205, 0, 0, 0, 1, 1,
-0.01660091, -0.08891849, -3.012314, 0, 0, 0, 1, 1,
-0.00951393, -0.9264927, -3.325491, 1, 1, 1, 1, 1,
-0.009018388, 0.6680344, 0.1214374, 1, 1, 1, 1, 1,
-0.007002209, 0.7714956, -2.243628, 1, 1, 1, 1, 1,
-0.005540259, 1.001731, -0.1656582, 1, 1, 1, 1, 1,
-0.005352959, 1.250833, -0.9197094, 1, 1, 1, 1, 1,
-0.003209917, 0.2244476, 0.9983422, 1, 1, 1, 1, 1,
-0.00263642, -0.4308993, -3.736239, 1, 1, 1, 1, 1,
0.002807335, 1.364138, 0.5526934, 1, 1, 1, 1, 1,
0.003590491, 0.9651534, -0.5269591, 1, 1, 1, 1, 1,
0.008187286, 1.488469, -0.1822402, 1, 1, 1, 1, 1,
0.008261671, -0.07858948, 1.951667, 1, 1, 1, 1, 1,
0.01981063, -0.09586437, 1.436044, 1, 1, 1, 1, 1,
0.02052395, -0.4753494, 3.567587, 1, 1, 1, 1, 1,
0.02188832, -1.472348, 2.660495, 1, 1, 1, 1, 1,
0.02596667, -0.9856295, 3.340754, 1, 1, 1, 1, 1,
0.0271315, 0.8449608, -0.1284919, 0, 0, 1, 1, 1,
0.02971382, -0.5370982, 3.36059, 1, 0, 0, 1, 1,
0.03278444, 0.6926622, 1.226184, 1, 0, 0, 1, 1,
0.03633226, 2.984124, -0.6097806, 1, 0, 0, 1, 1,
0.03634013, -0.4121943, 3.631187, 1, 0, 0, 1, 1,
0.03680457, -1.21295, 2.772793, 1, 0, 0, 1, 1,
0.03833651, -0.634479, 2.872354, 0, 0, 0, 1, 1,
0.03897466, -0.8552753, 3.149015, 0, 0, 0, 1, 1,
0.04076341, -0.4982066, 2.207088, 0, 0, 0, 1, 1,
0.04337185, 1.357766, -0.1240423, 0, 0, 0, 1, 1,
0.04391211, -0.2270759, 2.760665, 0, 0, 0, 1, 1,
0.04884867, -0.5011375, 2.445166, 0, 0, 0, 1, 1,
0.04991123, -0.8780767, 2.203422, 0, 0, 0, 1, 1,
0.05181117, -2.037007, 1.814272, 1, 1, 1, 1, 1,
0.05361137, 0.3035636, -1.006387, 1, 1, 1, 1, 1,
0.05386676, 0.1647041, -0.7314237, 1, 1, 1, 1, 1,
0.05475926, -0.3753048, 4.44776, 1, 1, 1, 1, 1,
0.05648015, 0.3580544, 1.390097, 1, 1, 1, 1, 1,
0.05810418, 0.9528402, -0.01850612, 1, 1, 1, 1, 1,
0.0604711, 0.8792019, -0.1038769, 1, 1, 1, 1, 1,
0.06571531, -0.2317892, 3.209995, 1, 1, 1, 1, 1,
0.06717401, -0.7324496, 2.089844, 1, 1, 1, 1, 1,
0.06737739, -0.4987631, 3.446207, 1, 1, 1, 1, 1,
0.07374617, 1.594321, -0.9220928, 1, 1, 1, 1, 1,
0.075475, 2.000541, 1.846379, 1, 1, 1, 1, 1,
0.07595842, 0.9977779, -1.957702, 1, 1, 1, 1, 1,
0.07712267, 0.439322, -0.3675762, 1, 1, 1, 1, 1,
0.07805514, 0.1287605, 0.8169006, 1, 1, 1, 1, 1,
0.07913147, -1.659922, 4.515135, 0, 0, 1, 1, 1,
0.07997251, -0.9048904, 2.502398, 1, 0, 0, 1, 1,
0.08035538, 0.5585541, 0.5689266, 1, 0, 0, 1, 1,
0.08094197, -0.2478808, 3.546352, 1, 0, 0, 1, 1,
0.08257336, -0.2339064, 3.466464, 1, 0, 0, 1, 1,
0.08277381, -0.7078694, 2.911415, 1, 0, 0, 1, 1,
0.08492703, -0.7284483, 3.887374, 0, 0, 0, 1, 1,
0.08766557, 0.04105502, 0.3259715, 0, 0, 0, 1, 1,
0.0917095, 0.4798948, 1.138393, 0, 0, 0, 1, 1,
0.09184796, -0.05195991, 2.076928, 0, 0, 0, 1, 1,
0.09310959, 0.5953218, 0.7420126, 0, 0, 0, 1, 1,
0.09575313, -0.2048515, 1.841344, 0, 0, 0, 1, 1,
0.096151, 1.35969, 0.1905849, 0, 0, 0, 1, 1,
0.0961803, -0.9972061, 1.795438, 1, 1, 1, 1, 1,
0.1009548, 1.147018, 0.58139, 1, 1, 1, 1, 1,
0.1032819, 0.6757453, -0.421818, 1, 1, 1, 1, 1,
0.1036417, 0.1970073, 0.7868057, 1, 1, 1, 1, 1,
0.1037194, 0.9563367, -0.9010912, 1, 1, 1, 1, 1,
0.1064001, -1.746788, 2.632631, 1, 1, 1, 1, 1,
0.1073017, 0.9108606, 1.264431, 1, 1, 1, 1, 1,
0.1088285, -0.1756228, 2.843029, 1, 1, 1, 1, 1,
0.1089238, -0.216727, 4.115115, 1, 1, 1, 1, 1,
0.1105809, 0.03960124, -0.01983781, 1, 1, 1, 1, 1,
0.1107362, 0.6990336, -1.49365, 1, 1, 1, 1, 1,
0.1133899, -0.09406157, 1.298581, 1, 1, 1, 1, 1,
0.1203492, -1.324574, 4.422395, 1, 1, 1, 1, 1,
0.1204478, 0.469732, 1.465428, 1, 1, 1, 1, 1,
0.1229736, -0.8986161, 2.926857, 1, 1, 1, 1, 1,
0.1332017, -1.641186, 3.780031, 0, 0, 1, 1, 1,
0.1341883, -0.337844, 2.346711, 1, 0, 0, 1, 1,
0.1342002, -0.4232914, 1.284362, 1, 0, 0, 1, 1,
0.1389787, 1.194749, 1.009809, 1, 0, 0, 1, 1,
0.139093, 0.2013245, -1.261396, 1, 0, 0, 1, 1,
0.1394353, 1.176286, -0.9219899, 1, 0, 0, 1, 1,
0.1399442, -0.1866299, 1.459467, 0, 0, 0, 1, 1,
0.1424747, 0.1939538, 2.472921, 0, 0, 0, 1, 1,
0.1447957, 0.07289849, 1.404893, 0, 0, 0, 1, 1,
0.1486284, 1.457759, 0.8804386, 0, 0, 0, 1, 1,
0.1523738, -0.1877979, 2.880818, 0, 0, 0, 1, 1,
0.1540216, 1.385234, -0.2224775, 0, 0, 0, 1, 1,
0.1572922, -0.4731714, 2.330699, 0, 0, 0, 1, 1,
0.1573789, -0.4013537, 4.271018, 1, 1, 1, 1, 1,
0.1588452, 0.7437056, 0.2217719, 1, 1, 1, 1, 1,
0.1619119, 0.9489035, 1.918708, 1, 1, 1, 1, 1,
0.1619254, -0.1744016, 3.410516, 1, 1, 1, 1, 1,
0.1643163, 0.2821732, 1.027423, 1, 1, 1, 1, 1,
0.1675576, 0.7257213, -0.1938119, 1, 1, 1, 1, 1,
0.1683969, -0.1085828, 1.450302, 1, 1, 1, 1, 1,
0.1716987, 1.757522, -0.2323903, 1, 1, 1, 1, 1,
0.1774933, -1.194793, 0.7951171, 1, 1, 1, 1, 1,
0.1786682, -0.9904538, 3.252722, 1, 1, 1, 1, 1,
0.180159, -1.004734, 1.860844, 1, 1, 1, 1, 1,
0.1801936, -1.362357, 3.812043, 1, 1, 1, 1, 1,
0.1828471, -0.7202769, 2.589551, 1, 1, 1, 1, 1,
0.1846999, -0.4498858, 1.889551, 1, 1, 1, 1, 1,
0.1934689, 0.08827411, 0.09246442, 1, 1, 1, 1, 1,
0.1940265, -0.6668438, 3.732423, 0, 0, 1, 1, 1,
0.1955279, -1.902279, 1.459384, 1, 0, 0, 1, 1,
0.197763, 2.322575, 0.4589944, 1, 0, 0, 1, 1,
0.1999758, -0.4852099, 2.886128, 1, 0, 0, 1, 1,
0.2129709, 2.640979, 1.348454, 1, 0, 0, 1, 1,
0.2134397, -0.7081279, 2.852509, 1, 0, 0, 1, 1,
0.214252, -0.5210004, 2.272738, 0, 0, 0, 1, 1,
0.2203524, 0.385399, 1.520987, 0, 0, 0, 1, 1,
0.2204355, 0.5457001, -1.31451, 0, 0, 0, 1, 1,
0.225001, -0.5547977, 1.874919, 0, 0, 0, 1, 1,
0.2266968, 0.5083196, 0.2481617, 0, 0, 0, 1, 1,
0.2293763, 0.2610154, 0.08672062, 0, 0, 0, 1, 1,
0.2393981, -0.2134526, 1.93021, 0, 0, 0, 1, 1,
0.2505812, -1.241457, 4.115661, 1, 1, 1, 1, 1,
0.2526255, 0.8576618, -1.110478, 1, 1, 1, 1, 1,
0.2552364, 1.815308, -0.5319299, 1, 1, 1, 1, 1,
0.255263, 0.3869848, 0.5487155, 1, 1, 1, 1, 1,
0.2560874, 0.7331886, -0.5957353, 1, 1, 1, 1, 1,
0.2687602, 2.430814, -1.120421, 1, 1, 1, 1, 1,
0.2721531, 1.590127, -0.005365231, 1, 1, 1, 1, 1,
0.273742, -0.7333584, 3.3742, 1, 1, 1, 1, 1,
0.2792182, -1.810732, 5.03784, 1, 1, 1, 1, 1,
0.2814722, -0.04502188, 1.663307, 1, 1, 1, 1, 1,
0.2828473, 0.3070192, -1.081457, 1, 1, 1, 1, 1,
0.2829171, -1.781241, 2.837378, 1, 1, 1, 1, 1,
0.2903478, 2.686265, 1.231552, 1, 1, 1, 1, 1,
0.2920708, -0.3988481, 1.719296, 1, 1, 1, 1, 1,
0.2938301, 0.2272821, -0.162236, 1, 1, 1, 1, 1,
0.298352, 1.704595, 0.7556232, 0, 0, 1, 1, 1,
0.2987341, 0.1979164, -0.9555112, 1, 0, 0, 1, 1,
0.3003783, 0.6694462, 1.842985, 1, 0, 0, 1, 1,
0.3015721, -0.04439077, 1.348198, 1, 0, 0, 1, 1,
0.3017781, 1.403128, 0.1211799, 1, 0, 0, 1, 1,
0.3020524, -0.0954986, 1.251087, 1, 0, 0, 1, 1,
0.3029408, -2.431489, 2.180677, 0, 0, 0, 1, 1,
0.3059721, -1.381447, 2.678786, 0, 0, 0, 1, 1,
0.3072211, -1.343671, 3.152863, 0, 0, 0, 1, 1,
0.3073089, -0.4575716, 3.341765, 0, 0, 0, 1, 1,
0.3153062, -0.6283142, 2.596641, 0, 0, 0, 1, 1,
0.31755, 0.2259952, -0.8178177, 0, 0, 0, 1, 1,
0.322891, 2.766613, -1.196901, 0, 0, 0, 1, 1,
0.3259758, -1.341864, 2.064079, 1, 1, 1, 1, 1,
0.3264212, 0.6133113, -1.315262, 1, 1, 1, 1, 1,
0.3295793, 0.9856154, 0.1760354, 1, 1, 1, 1, 1,
0.3299316, 0.4728269, 1.469588, 1, 1, 1, 1, 1,
0.3340307, -0.09364159, 3.472178, 1, 1, 1, 1, 1,
0.3424193, 1.184079, 0.1913565, 1, 1, 1, 1, 1,
0.3430287, -0.03989986, 1.982216, 1, 1, 1, 1, 1,
0.3452038, -0.5490572, 3.563836, 1, 1, 1, 1, 1,
0.347758, 2.159389, 0.1394769, 1, 1, 1, 1, 1,
0.3503551, 1.494573, 0.1912686, 1, 1, 1, 1, 1,
0.3528826, 0.1394903, 0.6516806, 1, 1, 1, 1, 1,
0.3577772, -0.6962169, 2.157242, 1, 1, 1, 1, 1,
0.3611049, -1.613486, 3.537218, 1, 1, 1, 1, 1,
0.3642864, 1.36339, 1.691764, 1, 1, 1, 1, 1,
0.364589, 0.06323839, 1.586803, 1, 1, 1, 1, 1,
0.3696905, -1.190875, 3.436298, 0, 0, 1, 1, 1,
0.3784381, 1.73873, 0.6168433, 1, 0, 0, 1, 1,
0.3800085, -1.564487, 2.930102, 1, 0, 0, 1, 1,
0.3814495, -0.4552251, 2.625748, 1, 0, 0, 1, 1,
0.3839636, 1.517028, 1.885619, 1, 0, 0, 1, 1,
0.384713, -0.731589, 4.205845, 1, 0, 0, 1, 1,
0.3859615, -2.815051, 3.685305, 0, 0, 0, 1, 1,
0.3863066, 1.657331, 1.731108, 0, 0, 0, 1, 1,
0.387419, 0.3071365, 1.559087, 0, 0, 0, 1, 1,
0.3910503, -0.7447518, 4.300333, 0, 0, 0, 1, 1,
0.3914071, 0.2298467, 2.578908, 0, 0, 0, 1, 1,
0.391467, 1.53645, 1.71114, 0, 0, 0, 1, 1,
0.3923682, -0.4463165, 1.957767, 0, 0, 0, 1, 1,
0.393313, -1.389779, 2.384863, 1, 1, 1, 1, 1,
0.3976305, 1.50782, 0.607172, 1, 1, 1, 1, 1,
0.3986458, 1.135235, -0.07707287, 1, 1, 1, 1, 1,
0.3991624, -0.187741, 0.4660839, 1, 1, 1, 1, 1,
0.3991807, -0.8296338, 5.478781, 1, 1, 1, 1, 1,
0.403169, -0.5762204, 4.527743, 1, 1, 1, 1, 1,
0.4077103, 0.5707722, 1.100603, 1, 1, 1, 1, 1,
0.4106081, 1.120545, 1.100501, 1, 1, 1, 1, 1,
0.4156346, 2.199442, -0.1520132, 1, 1, 1, 1, 1,
0.4177792, -0.1278117, 2.162825, 1, 1, 1, 1, 1,
0.4215273, -0.6142524, 3.706522, 1, 1, 1, 1, 1,
0.4216741, -0.6140677, 1.365608, 1, 1, 1, 1, 1,
0.4300713, 1.548741, -0.02070238, 1, 1, 1, 1, 1,
0.4346663, 0.6460386, -1.777951, 1, 1, 1, 1, 1,
0.4359533, 0.5159147, 0.02286441, 1, 1, 1, 1, 1,
0.4405352, -0.6285767, 1.917729, 0, 0, 1, 1, 1,
0.4406084, 0.5283133, 1.328426, 1, 0, 0, 1, 1,
0.4429218, -0.132454, 1.342289, 1, 0, 0, 1, 1,
0.4481874, -0.3470283, 1.772298, 1, 0, 0, 1, 1,
0.4509676, -1.508757, 1.762165, 1, 0, 0, 1, 1,
0.4561458, -0.9391116, 2.29471, 1, 0, 0, 1, 1,
0.4586085, -1.159436, 3.402104, 0, 0, 0, 1, 1,
0.4589961, 0.1994975, 2.851316, 0, 0, 0, 1, 1,
0.4620469, -0.9598855, 2.369725, 0, 0, 0, 1, 1,
0.4625613, 0.5833566, 0.9978637, 0, 0, 0, 1, 1,
0.4656997, 1.443014, -1.507212, 0, 0, 0, 1, 1,
0.4673057, -0.2538799, 0.6321738, 0, 0, 0, 1, 1,
0.4673977, 1.356061, 0.7852491, 0, 0, 0, 1, 1,
0.4721714, -0.8776778, 2.818494, 1, 1, 1, 1, 1,
0.4739883, -1.107629, 2.675153, 1, 1, 1, 1, 1,
0.4760029, -0.2580944, -0.6360713, 1, 1, 1, 1, 1,
0.4775732, 1.39454, -0.08894425, 1, 1, 1, 1, 1,
0.4785381, 0.9171619, -0.3972416, 1, 1, 1, 1, 1,
0.4838841, -0.988121, 3.589237, 1, 1, 1, 1, 1,
0.4870023, 2.13319, -0.8876056, 1, 1, 1, 1, 1,
0.4936014, -1.050169, 2.638996, 1, 1, 1, 1, 1,
0.4936858, 1.022212, 0.3019325, 1, 1, 1, 1, 1,
0.4973071, -0.02577784, 0.6370918, 1, 1, 1, 1, 1,
0.4976232, -0.07938318, 0.3682829, 1, 1, 1, 1, 1,
0.4994192, -1.144512, 2.679626, 1, 1, 1, 1, 1,
0.5036773, 1.677384, -0.6924548, 1, 1, 1, 1, 1,
0.5050797, -1.238216, 3.047298, 1, 1, 1, 1, 1,
0.5051677, -1.677265, 2.514457, 1, 1, 1, 1, 1,
0.5064662, 0.541138, 1.11857, 0, 0, 1, 1, 1,
0.5071636, -1.526253, 1.384563, 1, 0, 0, 1, 1,
0.5080872, 1.160301, -0.02386216, 1, 0, 0, 1, 1,
0.5137995, -1.01575, 1.589855, 1, 0, 0, 1, 1,
0.5149536, -0.2714259, 4.591928, 1, 0, 0, 1, 1,
0.5151315, -0.7105633, 3.411926, 1, 0, 0, 1, 1,
0.5160912, 0.5249586, 0.4268858, 0, 0, 0, 1, 1,
0.5177301, -1.400543, 3.999673, 0, 0, 0, 1, 1,
0.5247676, 0.7489693, 1.557959, 0, 0, 0, 1, 1,
0.5250763, 0.6433277, 1.644511, 0, 0, 0, 1, 1,
0.5271743, -0.3274051, 3.255804, 0, 0, 0, 1, 1,
0.5279105, 0.2737341, 1.585238, 0, 0, 0, 1, 1,
0.5303872, -0.4960541, 1.198971, 0, 0, 0, 1, 1,
0.5306376, -1.315409, 2.387338, 1, 1, 1, 1, 1,
0.5433102, -0.8072795, 2.239597, 1, 1, 1, 1, 1,
0.5464338, -0.8030803, 4.258374, 1, 1, 1, 1, 1,
0.5497091, -0.9852307, 1.462751, 1, 1, 1, 1, 1,
0.5502342, 0.4682924, 0.09624828, 1, 1, 1, 1, 1,
0.5521117, 1.240171, -0.1027074, 1, 1, 1, 1, 1,
0.5565891, -1.105025, 3.052896, 1, 1, 1, 1, 1,
0.556825, 1.75503, 0.5060899, 1, 1, 1, 1, 1,
0.5570269, -1.7212, 2.241746, 1, 1, 1, 1, 1,
0.5604934, -0.9140385, 1.430548, 1, 1, 1, 1, 1,
0.5679471, 0.3091145, 1.233345, 1, 1, 1, 1, 1,
0.5693475, -0.1444155, 3.559899, 1, 1, 1, 1, 1,
0.5697733, -0.2931032, 1.771438, 1, 1, 1, 1, 1,
0.5732078, 0.2753153, 1.556202, 1, 1, 1, 1, 1,
0.5735899, 0.7352589, 0.7297361, 1, 1, 1, 1, 1,
0.5785633, 0.2235341, 1.763317, 0, 0, 1, 1, 1,
0.5880877, 0.5990834, -0.5444065, 1, 0, 0, 1, 1,
0.5888555, -0.2278068, 2.138825, 1, 0, 0, 1, 1,
0.5899867, 1.399223, -0.4126991, 1, 0, 0, 1, 1,
0.6064336, -2.288741, 2.579427, 1, 0, 0, 1, 1,
0.6076316, 0.9974078, 0.3409561, 1, 0, 0, 1, 1,
0.612907, -0.7011644, 1.321537, 0, 0, 0, 1, 1,
0.6154605, -1.305067, 1.525033, 0, 0, 0, 1, 1,
0.6155173, -0.1198347, 2.303248, 0, 0, 0, 1, 1,
0.6192196, 0.4845211, 0.9370881, 0, 0, 0, 1, 1,
0.6201385, -1.789825, 3.24782, 0, 0, 0, 1, 1,
0.6250297, -1.116055, 2.015182, 0, 0, 0, 1, 1,
0.6254494, -0.6251245, 2.371126, 0, 0, 0, 1, 1,
0.6267712, -1.440291, 1.347884, 1, 1, 1, 1, 1,
0.6268125, 0.9909152, 0.8842955, 1, 1, 1, 1, 1,
0.62955, 1.13028, -0.5955639, 1, 1, 1, 1, 1,
0.6420828, 1.941005, 0.02239045, 1, 1, 1, 1, 1,
0.6432789, -0.08941097, 0.7009324, 1, 1, 1, 1, 1,
0.6433708, 0.7634997, 1.596961, 1, 1, 1, 1, 1,
0.6460617, 1.599122, 0.6187013, 1, 1, 1, 1, 1,
0.6482405, -1.800607, 3.184389, 1, 1, 1, 1, 1,
0.6492495, 0.1230633, 2.207026, 1, 1, 1, 1, 1,
0.6507814, -0.9060373, 1.625825, 1, 1, 1, 1, 1,
0.6523061, 0.8066338, 1.413072, 1, 1, 1, 1, 1,
0.6615487, 2.809361, 0.3938935, 1, 1, 1, 1, 1,
0.6618422, -0.005202473, 1.861082, 1, 1, 1, 1, 1,
0.6626508, -1.745392, 4.587811, 1, 1, 1, 1, 1,
0.6634603, -0.3456039, -0.6666416, 1, 1, 1, 1, 1,
0.663478, 0.06955817, 0.7183719, 0, 0, 1, 1, 1,
0.6640976, -0.6302603, 3.259925, 1, 0, 0, 1, 1,
0.6696644, -0.3235445, 3.045069, 1, 0, 0, 1, 1,
0.6745644, -0.2035715, 1.910208, 1, 0, 0, 1, 1,
0.6757197, 0.3776185, 1.117301, 1, 0, 0, 1, 1,
0.6771865, 0.8401867, 1.006343, 1, 0, 0, 1, 1,
0.680109, 0.1170737, 1.322345, 0, 0, 0, 1, 1,
0.6947159, 1.246662, 0.4308359, 0, 0, 0, 1, 1,
0.6950402, 0.8972653, -0.1040028, 0, 0, 0, 1, 1,
0.6972369, 1.00056, 2.152799, 0, 0, 0, 1, 1,
0.7097675, 0.5846941, 2.350038, 0, 0, 0, 1, 1,
0.7119476, 0.4804818, -0.8372263, 0, 0, 0, 1, 1,
0.7127285, 0.2127637, 0.9050807, 0, 0, 0, 1, 1,
0.7138692, -1.000364, 1.810355, 1, 1, 1, 1, 1,
0.7165999, 0.8707619, 0.692699, 1, 1, 1, 1, 1,
0.7251116, -0.7231439, 2.125127, 1, 1, 1, 1, 1,
0.7287356, 1.359851, 0.3152263, 1, 1, 1, 1, 1,
0.7307569, -0.2440396, 1.202317, 1, 1, 1, 1, 1,
0.7347556, 1.21315, 0.9075233, 1, 1, 1, 1, 1,
0.7424533, -1.189942, 3.526242, 1, 1, 1, 1, 1,
0.7501613, -0.4916235, 2.600569, 1, 1, 1, 1, 1,
0.7513227, 0.8789659, 1.328384, 1, 1, 1, 1, 1,
0.7527358, 0.4097616, 0.8886418, 1, 1, 1, 1, 1,
0.7531203, -2.032508, 1.759547, 1, 1, 1, 1, 1,
0.7548807, -0.03793492, 2.246338, 1, 1, 1, 1, 1,
0.7558634, -1.056828, 3.649712, 1, 1, 1, 1, 1,
0.7605441, -1.105907, 3.851786, 1, 1, 1, 1, 1,
0.761485, -0.8068675, 2.464198, 1, 1, 1, 1, 1,
0.7628152, 0.4439951, 2.104768, 0, 0, 1, 1, 1,
0.7630103, -0.7256162, 2.277172, 1, 0, 0, 1, 1,
0.7658041, 1.181863, 0.5250285, 1, 0, 0, 1, 1,
0.7707415, 0.2345471, 1.511334, 1, 0, 0, 1, 1,
0.7711326, -1.190738, 1.99693, 1, 0, 0, 1, 1,
0.7718755, 0.9024957, 0.3734404, 1, 0, 0, 1, 1,
0.7760479, 0.4466767, -0.4550012, 0, 0, 0, 1, 1,
0.7821513, 0.879201, -0.257683, 0, 0, 0, 1, 1,
0.7958639, 0.2657736, 0.7330826, 0, 0, 0, 1, 1,
0.7963254, -0.6693149, 2.976903, 0, 0, 0, 1, 1,
0.7975113, 0.4170077, 2.433122, 0, 0, 0, 1, 1,
0.7998461, -0.9659481, 4.548108, 0, 0, 0, 1, 1,
0.8071779, 1.216544, 1.037935, 0, 0, 0, 1, 1,
0.8089321, 1.255797, 0.3957392, 1, 1, 1, 1, 1,
0.8098329, -0.6725985, 3.389118, 1, 1, 1, 1, 1,
0.8235193, 1.531365, 0.577787, 1, 1, 1, 1, 1,
0.8242583, 1.527552, 0.6857839, 1, 1, 1, 1, 1,
0.829248, 0.7760627, -0.553058, 1, 1, 1, 1, 1,
0.8316696, 0.7405056, 1.065826, 1, 1, 1, 1, 1,
0.8418524, 0.3264104, -0.1050522, 1, 1, 1, 1, 1,
0.8419578, -0.5087507, 1.961414, 1, 1, 1, 1, 1,
0.8441085, 0.536909, 1.599114, 1, 1, 1, 1, 1,
0.8448701, -1.962042, 4.176862, 1, 1, 1, 1, 1,
0.8465686, -1.370405, 2.780441, 1, 1, 1, 1, 1,
0.8529416, -2.409693, 2.434331, 1, 1, 1, 1, 1,
0.8566117, -0.8411395, 2.674077, 1, 1, 1, 1, 1,
0.8651345, 0.4340932, 2.028399, 1, 1, 1, 1, 1,
0.8657611, 0.4924494, -0.3647225, 1, 1, 1, 1, 1,
0.8702313, -2.832373, 1.835048, 0, 0, 1, 1, 1,
0.8720694, -0.06669894, 0.1088872, 1, 0, 0, 1, 1,
0.8752384, 0.8060173, 1.437466, 1, 0, 0, 1, 1,
0.8783925, -0.7262949, 2.314821, 1, 0, 0, 1, 1,
0.8814667, -0.9729163, 1.007826, 1, 0, 0, 1, 1,
0.8819178, -1.67395, 2.197153, 1, 0, 0, 1, 1,
0.881951, -0.5197687, 1.315606, 0, 0, 0, 1, 1,
0.8925018, -1.875884, 1.023094, 0, 0, 0, 1, 1,
0.8941413, -2.422712, 4.368639, 0, 0, 0, 1, 1,
0.8984738, -0.5741045, 1.454068, 0, 0, 0, 1, 1,
0.9148797, 0.5736089, -0.05906576, 0, 0, 0, 1, 1,
0.9179347, 2.302678, -0.2043627, 0, 0, 0, 1, 1,
0.9185007, -0.7126581, 0.5528913, 0, 0, 0, 1, 1,
0.9219292, -0.7495694, 3.787781, 1, 1, 1, 1, 1,
0.9244106, 0.439638, 2.152128, 1, 1, 1, 1, 1,
0.9253347, 0.9627916, 1.813012, 1, 1, 1, 1, 1,
0.9272922, 1.030723, 2.100475, 1, 1, 1, 1, 1,
0.9274901, -1.329184, 0.800209, 1, 1, 1, 1, 1,
0.9352149, -0.06869251, 3.207919, 1, 1, 1, 1, 1,
0.9392664, -1.000796, 3.246889, 1, 1, 1, 1, 1,
0.9413306, -0.09627698, 1.263717, 1, 1, 1, 1, 1,
0.9434503, 2.622799, 2.622315, 1, 1, 1, 1, 1,
0.9438519, 1.206121, 0.4886729, 1, 1, 1, 1, 1,
0.9448089, 1.07739, -0.7804561, 1, 1, 1, 1, 1,
0.9457535, 0.8256046, 2.98802, 1, 1, 1, 1, 1,
0.9507359, -1.735582, 2.897336, 1, 1, 1, 1, 1,
0.9511582, 0.6627412, 0.5726096, 1, 1, 1, 1, 1,
0.9527678, -1.680421, 2.379287, 1, 1, 1, 1, 1,
0.955419, 1.231972, -0.3965135, 0, 0, 1, 1, 1,
0.956041, 0.4858091, -0.5350075, 1, 0, 0, 1, 1,
0.9579251, 2.020555, 0.9976197, 1, 0, 0, 1, 1,
0.9581978, -0.3413711, 2.896059, 1, 0, 0, 1, 1,
0.9627143, 0.6541297, 0.6844921, 1, 0, 0, 1, 1,
0.9689656, 0.0227408, 1.626119, 1, 0, 0, 1, 1,
0.9710104, 1.007705, 2.919133, 0, 0, 0, 1, 1,
0.9805819, 0.526975, 1.327569, 0, 0, 0, 1, 1,
0.9868779, -0.9286972, 2.332294, 0, 0, 0, 1, 1,
0.9874493, 1.235599, 1.771011, 0, 0, 0, 1, 1,
0.9964934, 1.472352, 0.6183184, 0, 0, 0, 1, 1,
0.9997358, 0.1372165, 0.2469912, 0, 0, 0, 1, 1,
1.009256, -0.6394669, 3.060183, 0, 0, 0, 1, 1,
1.012158, -0.2893844, 1.407633, 1, 1, 1, 1, 1,
1.01718, 1.360374, 1.173787, 1, 1, 1, 1, 1,
1.021278, 0.2812241, 0.4627703, 1, 1, 1, 1, 1,
1.025185, 0.2638122, 1.506097, 1, 1, 1, 1, 1,
1.02785, -0.2229134, 1.748816, 1, 1, 1, 1, 1,
1.045703, 1.108742, -0.7395604, 1, 1, 1, 1, 1,
1.046502, -0.7674983, 4.245669, 1, 1, 1, 1, 1,
1.049996, -0.1694386, 0.3619285, 1, 1, 1, 1, 1,
1.061676, -0.5474744, 1.96015, 1, 1, 1, 1, 1,
1.063503, -0.05106382, 0.835656, 1, 1, 1, 1, 1,
1.064514, 0.3524277, -0.05611558, 1, 1, 1, 1, 1,
1.065156, -1.23608, 2.834249, 1, 1, 1, 1, 1,
1.072366, -0.4412327, 3.079544, 1, 1, 1, 1, 1,
1.075574, -0.9017312, 3.400346, 1, 1, 1, 1, 1,
1.09142, 0.4281367, 1.155029, 1, 1, 1, 1, 1,
1.105835, -0.3690296, 3.2814, 0, 0, 1, 1, 1,
1.107173, -0.6715856, 2.254208, 1, 0, 0, 1, 1,
1.11595, 0.1947026, 0.7828839, 1, 0, 0, 1, 1,
1.116794, 0.1310772, 1.797333, 1, 0, 0, 1, 1,
1.122958, 1.098305, 0.8957757, 1, 0, 0, 1, 1,
1.12376, 0.5623652, 0.241846, 1, 0, 0, 1, 1,
1.130246, -0.2431267, 1.774717, 0, 0, 0, 1, 1,
1.135775, 0.7152438, -0.6558531, 0, 0, 0, 1, 1,
1.136997, 1.433181, -0.09213912, 0, 0, 0, 1, 1,
1.138377, 0.4942671, 2.653342, 0, 0, 0, 1, 1,
1.145286, -0.06190371, 2.543294, 0, 0, 0, 1, 1,
1.154024, -0.4689045, 3.342812, 0, 0, 0, 1, 1,
1.159011, -0.4730008, 2.157928, 0, 0, 0, 1, 1,
1.166251, 0.9617876, 0.356704, 1, 1, 1, 1, 1,
1.17089, 1.043534, 1.606733, 1, 1, 1, 1, 1,
1.171237, 1.054684, 0.3222491, 1, 1, 1, 1, 1,
1.187151, 1.926448, -0.07826724, 1, 1, 1, 1, 1,
1.18937, 0.7051737, 1.399651, 1, 1, 1, 1, 1,
1.202543, 1.434827, 0.6822946, 1, 1, 1, 1, 1,
1.203006, 0.9474388, 1.222505, 1, 1, 1, 1, 1,
1.213426, -0.1562816, 1.574237, 1, 1, 1, 1, 1,
1.214736, 0.170262, -0.5265233, 1, 1, 1, 1, 1,
1.217444, 2.679838, 0.894443, 1, 1, 1, 1, 1,
1.221161, -0.6452152, 2.255397, 1, 1, 1, 1, 1,
1.239803, -0.3647021, 0.2345411, 1, 1, 1, 1, 1,
1.252878, -0.9902821, 1.473052, 1, 1, 1, 1, 1,
1.254149, -0.6268206, 2.794119, 1, 1, 1, 1, 1,
1.261043, -1.555515, 4.910195, 1, 1, 1, 1, 1,
1.261236, 0.00300261, 1.153872, 0, 0, 1, 1, 1,
1.263257, -0.2482567, 1.120124, 1, 0, 0, 1, 1,
1.270155, -0.3800808, 3.876883, 1, 0, 0, 1, 1,
1.271885, 1.349955, 1.801207, 1, 0, 0, 1, 1,
1.275601, 0.09265957, 0.6628371, 1, 0, 0, 1, 1,
1.282959, 0.1442738, 3.079778, 1, 0, 0, 1, 1,
1.283143, -1.053934, 3.230856, 0, 0, 0, 1, 1,
1.283467, -0.1793715, 0.8885508, 0, 0, 0, 1, 1,
1.285504, -1.799163, 2.393885, 0, 0, 0, 1, 1,
1.290504, -0.8303447, 3.968523, 0, 0, 0, 1, 1,
1.294305, -1.496739, 1.487406, 0, 0, 0, 1, 1,
1.295778, -0.5080588, 0.9101379, 0, 0, 0, 1, 1,
1.297431, 0.5832061, 0.4559564, 0, 0, 0, 1, 1,
1.29836, -0.5384719, 2.109095, 1, 1, 1, 1, 1,
1.303483, 1.518402, 0.2186686, 1, 1, 1, 1, 1,
1.308811, -2.683066, 2.476277, 1, 1, 1, 1, 1,
1.322181, -0.01368473, 2.000212, 1, 1, 1, 1, 1,
1.323199, -1.379625, 2.792786, 1, 1, 1, 1, 1,
1.340336, 0.7314762, 2.711668, 1, 1, 1, 1, 1,
1.34127, -2.181, 1.202851, 1, 1, 1, 1, 1,
1.363258, -1.459785, 5.118869, 1, 1, 1, 1, 1,
1.379108, 0.5206482, -0.6641746, 1, 1, 1, 1, 1,
1.379574, 0.6444248, 0.2582479, 1, 1, 1, 1, 1,
1.433041, -1.69981, 4.085016, 1, 1, 1, 1, 1,
1.439478, 0.5013306, 1.786627, 1, 1, 1, 1, 1,
1.441302, -1.362198, 2.968501, 1, 1, 1, 1, 1,
1.442315, 0.6689995, 1.35576, 1, 1, 1, 1, 1,
1.447524, 0.6099332, 1.261399, 1, 1, 1, 1, 1,
1.460871, -0.019564, 2.739223, 0, 0, 1, 1, 1,
1.462676, 0.4465701, -0.8223145, 1, 0, 0, 1, 1,
1.465344, -0.8491428, 1.662577, 1, 0, 0, 1, 1,
1.467591, -0.9089706, 2.375633, 1, 0, 0, 1, 1,
1.467756, 0.4674819, -0.3431153, 1, 0, 0, 1, 1,
1.475375, -2.671129, 2.860503, 1, 0, 0, 1, 1,
1.476962, 1.266157, 0.248177, 0, 0, 0, 1, 1,
1.47734, -0.2847065, 2.594563, 0, 0, 0, 1, 1,
1.480725, 0.9031415, 1.505074, 0, 0, 0, 1, 1,
1.507922, -0.2670413, -0.363176, 0, 0, 0, 1, 1,
1.515509, 0.7905133, 0.5373375, 0, 0, 0, 1, 1,
1.532284, -1.013011, 1.63278, 0, 0, 0, 1, 1,
1.542579, 0.4819003, 1.41725, 0, 0, 0, 1, 1,
1.550188, -0.9513191, 2.92507, 1, 1, 1, 1, 1,
1.573094, 0.9075641, 1.217254, 1, 1, 1, 1, 1,
1.577598, 0.9067212, 0.3847335, 1, 1, 1, 1, 1,
1.585369, -0.6900029, 0.9152165, 1, 1, 1, 1, 1,
1.590802, -0.8103385, 0.5334949, 1, 1, 1, 1, 1,
1.606518, 2.289564, -0.1114216, 1, 1, 1, 1, 1,
1.624991, 1.169728, 2.30317, 1, 1, 1, 1, 1,
1.659628, -1.268409, 1.901052, 1, 1, 1, 1, 1,
1.677918, -0.8579896, 2.878539, 1, 1, 1, 1, 1,
1.681896, 0.3195338, 1.166021, 1, 1, 1, 1, 1,
1.689416, -0.5764831, 1.512092, 1, 1, 1, 1, 1,
1.702155, 1.423533, 1.447034, 1, 1, 1, 1, 1,
1.707542, -1.471754, 1.903818, 1, 1, 1, 1, 1,
1.714835, 0.01102768, 0.8361419, 1, 1, 1, 1, 1,
1.719361, -0.8711708, 0.490401, 1, 1, 1, 1, 1,
1.728693, 0.6998164, 1.731697, 0, 0, 1, 1, 1,
1.730616, -0.9534028, 1.494238, 1, 0, 0, 1, 1,
1.739164, 1.874825, -0.08528922, 1, 0, 0, 1, 1,
1.740589, 0.1800392, 1.555859, 1, 0, 0, 1, 1,
1.760725, 1.912481, 1.813072, 1, 0, 0, 1, 1,
1.76995, 0.6164885, 1.050842, 1, 0, 0, 1, 1,
1.777729, 0.0552734, 2.546148, 0, 0, 0, 1, 1,
1.804652, -0.537138, 1.774583, 0, 0, 0, 1, 1,
1.805762, 0.3304559, 2.380449, 0, 0, 0, 1, 1,
1.806531, 0.7361079, 0.3772428, 0, 0, 0, 1, 1,
1.813214, -0.04654983, 0.851615, 0, 0, 0, 1, 1,
1.826916, -0.4536399, 3.397327, 0, 0, 0, 1, 1,
1.836959, 0.3683798, 0.5832921, 0, 0, 0, 1, 1,
1.845804, 0.1619384, 3.254195, 1, 1, 1, 1, 1,
1.878145, 1.47948, 1.227103, 1, 1, 1, 1, 1,
1.906098, -0.8172698, 1.063249, 1, 1, 1, 1, 1,
1.922478, 1.034964, 0.7628444, 1, 1, 1, 1, 1,
1.958283, 0.1131261, 2.730255, 1, 1, 1, 1, 1,
1.965636, -0.5692455, 0.3619108, 1, 1, 1, 1, 1,
1.974289, -1.540833, 1.458323, 1, 1, 1, 1, 1,
1.976355, 0.7457789, 2.842812, 1, 1, 1, 1, 1,
1.978965, 0.3900788, 1.601492, 1, 1, 1, 1, 1,
1.980112, -1.216523, 3.980326, 1, 1, 1, 1, 1,
1.98625, 0.1722653, 0.4431112, 1, 1, 1, 1, 1,
1.987913, 0.7077656, 2.974289, 1, 1, 1, 1, 1,
2.020513, -0.05576761, 0.4695947, 1, 1, 1, 1, 1,
2.057867, 0.9987949, 0.4682815, 1, 1, 1, 1, 1,
2.079457, -0.5074627, 1.890898, 1, 1, 1, 1, 1,
2.084189, -0.01263563, 1.526737, 0, 0, 1, 1, 1,
2.103767, 1.091236, 1.223361, 1, 0, 0, 1, 1,
2.150594, 0.9838008, 0.5703292, 1, 0, 0, 1, 1,
2.158956, -0.7665878, 1.857238, 1, 0, 0, 1, 1,
2.185075, -0.9655492, 1.302666, 1, 0, 0, 1, 1,
2.239404, -1.177821, -1.01648, 1, 0, 0, 1, 1,
2.245978, -1.734463, 2.008173, 0, 0, 0, 1, 1,
2.252522, -1.660689, 2.022717, 0, 0, 0, 1, 1,
2.253748, -0.1719709, 3.019855, 0, 0, 0, 1, 1,
2.253926, 0.2329281, 0.892271, 0, 0, 0, 1, 1,
2.291895, 2.438001, 0.9817871, 0, 0, 0, 1, 1,
2.427585, -1.584451, 1.515519, 0, 0, 0, 1, 1,
2.533641, 0.9877133, 1.142479, 0, 0, 0, 1, 1,
2.619541, -1.136242, 1.66127, 1, 1, 1, 1, 1,
2.809067, -0.009305865, 1.168892, 1, 1, 1, 1, 1,
2.884291, 0.9388413, 1.141263, 1, 1, 1, 1, 1,
3.091831, -0.06382272, -0.4571732, 1, 1, 1, 1, 1,
3.170964, -0.3251841, 3.435937, 1, 1, 1, 1, 1,
3.250362, -0.3428023, 2.552505, 1, 1, 1, 1, 1,
3.39197, 0.4656861, 0.6980549, 1, 1, 1, 1, 1
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
var radius = 10.01508;
var distance = 35.17753;
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
mvMatrix.translate( -0.09707332, -0.1015236, 0.4008014 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.17753);
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
