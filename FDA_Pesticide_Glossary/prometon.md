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
-3.52319, 1.304324, -2.233989, 1, 0, 0, 1,
-2.767959, -0.6776223, 0.304209, 1, 0.007843138, 0, 1,
-2.752455, -0.3817923, -3.252103, 1, 0.01176471, 0, 1,
-2.625752, 0.2493848, -1.598269, 1, 0.01960784, 0, 1,
-2.45895, 0.1521078, -3.403753, 1, 0.02352941, 0, 1,
-2.325373, 1.554224, -1.312419, 1, 0.03137255, 0, 1,
-2.307774, -0.03155489, -2.072134, 1, 0.03529412, 0, 1,
-2.266475, -1.599217, -1.519907, 1, 0.04313726, 0, 1,
-2.261377, 0.09627735, -1.86613, 1, 0.04705882, 0, 1,
-2.25727, -0.07743162, -1.349031, 1, 0.05490196, 0, 1,
-2.200629, 0.4905201, -1.076086, 1, 0.05882353, 0, 1,
-2.166804, 1.950379, -0.294085, 1, 0.06666667, 0, 1,
-2.161086, -0.07810569, -1.302586, 1, 0.07058824, 0, 1,
-2.152416, -0.08275282, -1.850727, 1, 0.07843138, 0, 1,
-2.106936, -1.190021, -1.076177, 1, 0.08235294, 0, 1,
-2.086323, 0.1070978, 0.6086503, 1, 0.09019608, 0, 1,
-2.08604, 1.801262, -0.6369717, 1, 0.09411765, 0, 1,
-2.016114, -0.2574825, -1.430372, 1, 0.1019608, 0, 1,
-2.000278, -0.6131246, -2.69725, 1, 0.1098039, 0, 1,
-1.980544, 0.3986305, -0.8506288, 1, 0.1137255, 0, 1,
-1.973213, 0.668433, 0.3817987, 1, 0.1215686, 0, 1,
-1.958196, -1.844043, -2.689961, 1, 0.1254902, 0, 1,
-1.91631, -1.080229, 0.9243215, 1, 0.1333333, 0, 1,
-1.913265, -0.4062031, -0.7908649, 1, 0.1372549, 0, 1,
-1.907123, 0.6666948, -1.989559, 1, 0.145098, 0, 1,
-1.841047, 1.417983, -0.6117119, 1, 0.1490196, 0, 1,
-1.814493, -0.6938871, -0.1820277, 1, 0.1568628, 0, 1,
-1.792362, 2.387903, -0.7184462, 1, 0.1607843, 0, 1,
-1.785898, 0.9373026, -1.480541, 1, 0.1686275, 0, 1,
-1.780287, 1.009188, -0.5627804, 1, 0.172549, 0, 1,
-1.737195, -0.02531475, -1.805092, 1, 0.1803922, 0, 1,
-1.722179, -0.9647822, -2.907541, 1, 0.1843137, 0, 1,
-1.681747, 0.942306, -1.52639, 1, 0.1921569, 0, 1,
-1.679725, -1.143471, -1.28453, 1, 0.1960784, 0, 1,
-1.641454, 0.09917374, -1.089764, 1, 0.2039216, 0, 1,
-1.63882, -1.16892, -1.556888, 1, 0.2117647, 0, 1,
-1.637983, 0.7596682, 0.07438314, 1, 0.2156863, 0, 1,
-1.615612, 1.315511, 0.3428091, 1, 0.2235294, 0, 1,
-1.610747, 0.1553214, -0.1500253, 1, 0.227451, 0, 1,
-1.610595, 0.0661464, -0.1526902, 1, 0.2352941, 0, 1,
-1.608433, -0.08157484, -1.384555, 1, 0.2392157, 0, 1,
-1.596133, 0.3319336, -3.028118, 1, 0.2470588, 0, 1,
-1.587326, -1.877881, -0.756065, 1, 0.2509804, 0, 1,
-1.58011, 1.00884, -0.5656204, 1, 0.2588235, 0, 1,
-1.575683, -0.09249696, -2.432967, 1, 0.2627451, 0, 1,
-1.574467, -1.115374, -3.911476, 1, 0.2705882, 0, 1,
-1.553804, 1.964166, -0.7529924, 1, 0.2745098, 0, 1,
-1.55246, -0.08679125, 0.1461436, 1, 0.282353, 0, 1,
-1.548975, 2.03032, -1.719989, 1, 0.2862745, 0, 1,
-1.546822, -0.8153725, -1.139393, 1, 0.2941177, 0, 1,
-1.533467, 0.3519529, -0.9962249, 1, 0.3019608, 0, 1,
-1.522557, 0.2298017, -1.643006, 1, 0.3058824, 0, 1,
-1.511619, 0.3247824, -1.739005, 1, 0.3137255, 0, 1,
-1.51022, 0.3339248, 0.06627151, 1, 0.3176471, 0, 1,
-1.508442, 1.375875, -0.9884543, 1, 0.3254902, 0, 1,
-1.50702, -0.5535493, -2.566793, 1, 0.3294118, 0, 1,
-1.495926, -0.8269193, -2.359693, 1, 0.3372549, 0, 1,
-1.493608, 2.100782, -0.9313952, 1, 0.3411765, 0, 1,
-1.473922, 0.7459304, -0.9051007, 1, 0.3490196, 0, 1,
-1.453638, -1.087194, -1.94942, 1, 0.3529412, 0, 1,
-1.443757, -0.3066478, -1.507935, 1, 0.3607843, 0, 1,
-1.442756, 1.632864, -1.449401, 1, 0.3647059, 0, 1,
-1.442492, 2.011287, -1.409, 1, 0.372549, 0, 1,
-1.434811, -1.223995, -1.564772, 1, 0.3764706, 0, 1,
-1.427948, 0.6829278, -0.5884362, 1, 0.3843137, 0, 1,
-1.427022, 0.189419, -1.130466, 1, 0.3882353, 0, 1,
-1.425954, 0.237836, -0.2430644, 1, 0.3960784, 0, 1,
-1.422552, -2.634427, -3.252653, 1, 0.4039216, 0, 1,
-1.414492, -1.27346, -3.926895, 1, 0.4078431, 0, 1,
-1.411724, -0.5317106, -1.26053, 1, 0.4156863, 0, 1,
-1.409866, -0.6287047, -2.892157, 1, 0.4196078, 0, 1,
-1.40812, 0.9947283, -0.9817753, 1, 0.427451, 0, 1,
-1.405868, 0.5454225, -3.575673, 1, 0.4313726, 0, 1,
-1.405273, 1.10699, -1.624179, 1, 0.4392157, 0, 1,
-1.402257, -0.1905612, -2.326513, 1, 0.4431373, 0, 1,
-1.401254, -1.127826, -1.376736, 1, 0.4509804, 0, 1,
-1.395925, -0.2318069, -2.150927, 1, 0.454902, 0, 1,
-1.392035, -0.9098845, -1.204219, 1, 0.4627451, 0, 1,
-1.383178, -0.1133176, -3.903696, 1, 0.4666667, 0, 1,
-1.374163, -0.2304282, -2.449358, 1, 0.4745098, 0, 1,
-1.37007, 0.8929143, -0.2516303, 1, 0.4784314, 0, 1,
-1.353997, -2.437654, -2.704161, 1, 0.4862745, 0, 1,
-1.353644, 1.035372, -1.071818, 1, 0.4901961, 0, 1,
-1.351416, -0.4031595, -0.6091437, 1, 0.4980392, 0, 1,
-1.350423, -0.1526349, -1.750271, 1, 0.5058824, 0, 1,
-1.346783, -1.026603, -2.661165, 1, 0.509804, 0, 1,
-1.337459, 0.4165193, -2.687512, 1, 0.5176471, 0, 1,
-1.331602, -1.224304, -1.812662, 1, 0.5215687, 0, 1,
-1.330907, -0.2807005, -3.231376, 1, 0.5294118, 0, 1,
-1.328656, 0.8855914, -1.24999, 1, 0.5333334, 0, 1,
-1.328598, 0.06950541, -0.1897513, 1, 0.5411765, 0, 1,
-1.327681, -0.5459836, -1.824164, 1, 0.5450981, 0, 1,
-1.310616, 0.06996287, -0.5418286, 1, 0.5529412, 0, 1,
-1.30886, 0.7342021, -0.8412117, 1, 0.5568628, 0, 1,
-1.300272, -2.551435, -1.332621, 1, 0.5647059, 0, 1,
-1.299566, -0.9413047, -4.256342, 1, 0.5686275, 0, 1,
-1.279198, 1.884269, -0.6255294, 1, 0.5764706, 0, 1,
-1.274817, -0.3286322, -1.882071, 1, 0.5803922, 0, 1,
-1.270977, 0.04336341, -1.393188, 1, 0.5882353, 0, 1,
-1.268707, 1.256871, -1.941147, 1, 0.5921569, 0, 1,
-1.248033, 0.646616, -2.140619, 1, 0.6, 0, 1,
-1.24762, 1.024286, -0.7043677, 1, 0.6078432, 0, 1,
-1.239361, 1.065476, -1.114272, 1, 0.6117647, 0, 1,
-1.239143, -0.6473309, -1.095793, 1, 0.6196079, 0, 1,
-1.2379, -0.7766621, -0.9915822, 1, 0.6235294, 0, 1,
-1.23649, 0.723704, -0.1942134, 1, 0.6313726, 0, 1,
-1.229043, 0.6562856, -1.799943, 1, 0.6352941, 0, 1,
-1.223657, -0.1699933, -0.7865501, 1, 0.6431373, 0, 1,
-1.220504, 0.8253803, -1.706087, 1, 0.6470588, 0, 1,
-1.218015, -2.189556, -2.259367, 1, 0.654902, 0, 1,
-1.215391, -1.13113, -2.743879, 1, 0.6588235, 0, 1,
-1.21093, 0.2746609, -1.895736, 1, 0.6666667, 0, 1,
-1.199545, 0.1888552, -2.184668, 1, 0.6705883, 0, 1,
-1.199528, -0.6927241, -2.31566, 1, 0.6784314, 0, 1,
-1.198959, 0.2745548, -1.643064, 1, 0.682353, 0, 1,
-1.194842, 0.3958319, -2.349071, 1, 0.6901961, 0, 1,
-1.189841, 0.8928772, -1.177085, 1, 0.6941177, 0, 1,
-1.189711, -1.325284, -1.655625, 1, 0.7019608, 0, 1,
-1.188694, -0.5424013, -1.587649, 1, 0.7098039, 0, 1,
-1.173845, -0.5419857, -2.730577, 1, 0.7137255, 0, 1,
-1.169385, -2.042097, -3.453953, 1, 0.7215686, 0, 1,
-1.159864, 1.138988, -1.436633, 1, 0.7254902, 0, 1,
-1.156187, -1.258463, -2.874484, 1, 0.7333333, 0, 1,
-1.155302, -1.426577, -2.413375, 1, 0.7372549, 0, 1,
-1.151827, 1.627385, -1.143985, 1, 0.7450981, 0, 1,
-1.139759, 0.01643011, 0.6294225, 1, 0.7490196, 0, 1,
-1.135304, -1.273506, -1.784688, 1, 0.7568628, 0, 1,
-1.130785, 0.3999192, 0.2952203, 1, 0.7607843, 0, 1,
-1.124097, 0.1671702, -0.9763238, 1, 0.7686275, 0, 1,
-1.11971, -2.004604, -3.244197, 1, 0.772549, 0, 1,
-1.111769, 0.4238307, -0.3505693, 1, 0.7803922, 0, 1,
-1.111078, 0.6777146, -2.684791, 1, 0.7843137, 0, 1,
-1.110781, 0.0570901, -0.785912, 1, 0.7921569, 0, 1,
-1.103365, 0.9708597, -0.05695968, 1, 0.7960784, 0, 1,
-1.100578, -2.288819, 0.0113849, 1, 0.8039216, 0, 1,
-1.097927, -0.04313162, -2.797768, 1, 0.8117647, 0, 1,
-1.096474, -0.3384413, -2.157423, 1, 0.8156863, 0, 1,
-1.094506, -0.8885071, -2.676224, 1, 0.8235294, 0, 1,
-1.082588, -0.9002676, -2.055794, 1, 0.827451, 0, 1,
-1.079748, -0.3951177, -0.8138598, 1, 0.8352941, 0, 1,
-1.078563, -0.2851864, -1.219128, 1, 0.8392157, 0, 1,
-1.052401, -0.9879385, 0.01358812, 1, 0.8470588, 0, 1,
-1.052137, 2.121214, 1.009876, 1, 0.8509804, 0, 1,
-1.051019, 0.4800389, -0.8854518, 1, 0.8588235, 0, 1,
-1.049039, -1.469814, -1.460464, 1, 0.8627451, 0, 1,
-1.042688, 0.1102955, -0.3744121, 1, 0.8705882, 0, 1,
-1.04111, -1.734302, -1.291156, 1, 0.8745098, 0, 1,
-1.03628, -0.1453552, -2.869392, 1, 0.8823529, 0, 1,
-1.031348, 1.162037, -0.5699776, 1, 0.8862745, 0, 1,
-1.03065, 1.119463, -0.940672, 1, 0.8941177, 0, 1,
-1.028908, -0.3258421, -0.5002388, 1, 0.8980392, 0, 1,
-1.009665, 0.5426471, -1.720953, 1, 0.9058824, 0, 1,
-1.00721, -0.05500375, -3.710984, 1, 0.9137255, 0, 1,
-1.005609, -1.043698, -2.948779, 1, 0.9176471, 0, 1,
-1.000191, 0.9591593, -1.804812, 1, 0.9254902, 0, 1,
-0.9945633, 0.9081135, -2.243228, 1, 0.9294118, 0, 1,
-0.9870775, 1.314725, 0.6420548, 1, 0.9372549, 0, 1,
-0.985643, -0.285531, -2.7671, 1, 0.9411765, 0, 1,
-0.9823799, 0.3178981, -2.969104, 1, 0.9490196, 0, 1,
-0.9718897, 0.5671468, -1.242693, 1, 0.9529412, 0, 1,
-0.9713014, 0.7487446, -1.180717, 1, 0.9607843, 0, 1,
-0.9682443, -0.9550193, -3.188134, 1, 0.9647059, 0, 1,
-0.963751, 1.401348, -1.899736, 1, 0.972549, 0, 1,
-0.9569697, -0.4463494, -2.184498, 1, 0.9764706, 0, 1,
-0.9549888, -0.5348299, -0.6050271, 1, 0.9843137, 0, 1,
-0.9545257, -1.008038, -3.065012, 1, 0.9882353, 0, 1,
-0.9385334, 0.2345313, -2.089125, 1, 0.9960784, 0, 1,
-0.9373922, 0.9290631, -1.387943, 0.9960784, 1, 0, 1,
-0.9369813, 0.5852756, -1.830196, 0.9921569, 1, 0, 1,
-0.9362967, -1.168366, -0.5792094, 0.9843137, 1, 0, 1,
-0.9348583, -1.229873, -2.479573, 0.9803922, 1, 0, 1,
-0.9255575, 1.24182, -1.898273, 0.972549, 1, 0, 1,
-0.9020642, 1.099781, -1.083719, 0.9686275, 1, 0, 1,
-0.9015162, -0.9920375, -4.292798, 0.9607843, 1, 0, 1,
-0.8978927, 2.407851, -0.6633992, 0.9568627, 1, 0, 1,
-0.8879333, 0.4844831, -0.7270156, 0.9490196, 1, 0, 1,
-0.8862587, -0.1240338, -0.3464745, 0.945098, 1, 0, 1,
-0.8762025, 0.8830054, -1.473199, 0.9372549, 1, 0, 1,
-0.8611487, -1.581525, -2.577755, 0.9333333, 1, 0, 1,
-0.8549011, 1.009752, 0.4091654, 0.9254902, 1, 0, 1,
-0.8447571, -1.136353, -2.460414, 0.9215686, 1, 0, 1,
-0.8433574, -2.388698, -3.750952, 0.9137255, 1, 0, 1,
-0.83209, 0.4085137, -0.9891031, 0.9098039, 1, 0, 1,
-0.8298093, 1.598559, -1.03253, 0.9019608, 1, 0, 1,
-0.8195466, 1.134507, -1.239545, 0.8941177, 1, 0, 1,
-0.8143657, 0.3283981, -1.319001, 0.8901961, 1, 0, 1,
-0.8128276, -1.037824, -2.895565, 0.8823529, 1, 0, 1,
-0.809731, 1.144665, -0.07922567, 0.8784314, 1, 0, 1,
-0.8004285, -0.830746, -2.509119, 0.8705882, 1, 0, 1,
-0.7932937, -0.8680878, -2.659467, 0.8666667, 1, 0, 1,
-0.7893203, 0.5324004, -2.342091, 0.8588235, 1, 0, 1,
-0.7839986, 1.452499, 0.3933128, 0.854902, 1, 0, 1,
-0.7733539, 1.156285, -2.207455, 0.8470588, 1, 0, 1,
-0.7727103, -1.640201, -1.786752, 0.8431373, 1, 0, 1,
-0.7681348, 1.169632, -0.6304187, 0.8352941, 1, 0, 1,
-0.7665937, -0.7256169, -1.218753, 0.8313726, 1, 0, 1,
-0.7649668, 0.3976714, -0.4873067, 0.8235294, 1, 0, 1,
-0.758276, -1.038945, -3.182728, 0.8196079, 1, 0, 1,
-0.7582601, -0.1571731, -4.269969, 0.8117647, 1, 0, 1,
-0.7579549, -0.8716831, -1.88062, 0.8078431, 1, 0, 1,
-0.7578548, 0.9444206, -0.8680897, 0.8, 1, 0, 1,
-0.7576454, -1.358802, -1.017328, 0.7921569, 1, 0, 1,
-0.757592, -0.2046321, -1.550151, 0.7882353, 1, 0, 1,
-0.7565641, -0.273389, -0.8949311, 0.7803922, 1, 0, 1,
-0.7530484, 0.9799935, 0.7293376, 0.7764706, 1, 0, 1,
-0.7387849, 0.3971038, 0.1235096, 0.7686275, 1, 0, 1,
-0.7382133, 0.4082681, -0.9946456, 0.7647059, 1, 0, 1,
-0.7377534, 1.573932, -0.08777684, 0.7568628, 1, 0, 1,
-0.7347854, -0.195174, -1.04037, 0.7529412, 1, 0, 1,
-0.7306207, -1.221041, -4.87291, 0.7450981, 1, 0, 1,
-0.7258098, 1.166914, -1.419481, 0.7411765, 1, 0, 1,
-0.7247685, 0.6040448, -0.5796415, 0.7333333, 1, 0, 1,
-0.7212324, 0.9417741, 0.2389157, 0.7294118, 1, 0, 1,
-0.718951, 0.05861983, -2.077343, 0.7215686, 1, 0, 1,
-0.7175834, -0.4021289, -2.551996, 0.7176471, 1, 0, 1,
-0.7157651, 0.9350719, 0.3464522, 0.7098039, 1, 0, 1,
-0.7135208, -1.50048, -3.623423, 0.7058824, 1, 0, 1,
-0.7118406, 1.305856, -0.2170616, 0.6980392, 1, 0, 1,
-0.7080791, 0.6763834, 0.02213027, 0.6901961, 1, 0, 1,
-0.7037275, 0.9459165, -1.678389, 0.6862745, 1, 0, 1,
-0.7008373, 0.3862547, -3.554294, 0.6784314, 1, 0, 1,
-0.7000717, -0.5219022, -2.122865, 0.6745098, 1, 0, 1,
-0.6994969, 1.423048, -0.7594827, 0.6666667, 1, 0, 1,
-0.6953141, 2.103417, 0.7520785, 0.6627451, 1, 0, 1,
-0.6948907, 1.040329, -1.430787, 0.654902, 1, 0, 1,
-0.6939363, -0.8461056, -1.967189, 0.6509804, 1, 0, 1,
-0.6871381, -2.282781, -4.375975, 0.6431373, 1, 0, 1,
-0.6833273, -1.105172, -2.567918, 0.6392157, 1, 0, 1,
-0.681059, -0.4638807, -3.111937, 0.6313726, 1, 0, 1,
-0.6804295, 1.215554, -1.011371, 0.627451, 1, 0, 1,
-0.6697776, 0.1047404, 0.02644264, 0.6196079, 1, 0, 1,
-0.6695905, -1.063126, -1.690078, 0.6156863, 1, 0, 1,
-0.6669406, 0.4852363, -1.890222, 0.6078432, 1, 0, 1,
-0.6658484, 1.035333, -2.01859, 0.6039216, 1, 0, 1,
-0.6635271, -0.3859641, -3.91765, 0.5960785, 1, 0, 1,
-0.6635085, 0.5863905, 0.02861507, 0.5882353, 1, 0, 1,
-0.6628314, -0.5817816, -2.014985, 0.5843138, 1, 0, 1,
-0.653931, -0.08780384, -2.088255, 0.5764706, 1, 0, 1,
-0.6495546, 1.124321, -0.4187321, 0.572549, 1, 0, 1,
-0.6458206, -0.3992611, -2.103338, 0.5647059, 1, 0, 1,
-0.6411284, -0.9219136, -3.471132, 0.5607843, 1, 0, 1,
-0.6387877, 1.651803, -0.0738657, 0.5529412, 1, 0, 1,
-0.6366072, -0.5165195, -2.702978, 0.5490196, 1, 0, 1,
-0.6330847, 1.137929, 0.5808692, 0.5411765, 1, 0, 1,
-0.6307201, 0.5098081, -1.884074, 0.5372549, 1, 0, 1,
-0.6304973, -0.2003838, -0.121071, 0.5294118, 1, 0, 1,
-0.6281199, -0.4088128, -1.930661, 0.5254902, 1, 0, 1,
-0.627253, 1.090344, -0.2553561, 0.5176471, 1, 0, 1,
-0.6262624, 1.443578, -0.9250674, 0.5137255, 1, 0, 1,
-0.6155017, -0.550501, -2.531772, 0.5058824, 1, 0, 1,
-0.6127031, 0.62034, -3.65905, 0.5019608, 1, 0, 1,
-0.6083505, 0.4905458, -1.008198, 0.4941176, 1, 0, 1,
-0.6081829, 0.1137749, -2.448742, 0.4862745, 1, 0, 1,
-0.6053213, -2.138953, -1.925244, 0.4823529, 1, 0, 1,
-0.6032038, 0.5679527, -1.568836, 0.4745098, 1, 0, 1,
-0.5976918, 0.08335557, -0.5285213, 0.4705882, 1, 0, 1,
-0.5926328, 0.4361521, 0.2290101, 0.4627451, 1, 0, 1,
-0.5879512, 0.6748549, 0.4190938, 0.4588235, 1, 0, 1,
-0.581442, 1.381519, -0.2513583, 0.4509804, 1, 0, 1,
-0.5748062, 0.3198531, -1.729337, 0.4470588, 1, 0, 1,
-0.5731485, -1.843838, -2.173244, 0.4392157, 1, 0, 1,
-0.5700067, 0.3510257, -0.7965429, 0.4352941, 1, 0, 1,
-0.5683281, -2.716045, -2.274613, 0.427451, 1, 0, 1,
-0.5673828, -0.9903766, -2.400366, 0.4235294, 1, 0, 1,
-0.5654495, -1.160152, -1.260989, 0.4156863, 1, 0, 1,
-0.5653508, -0.9137554, -2.261831, 0.4117647, 1, 0, 1,
-0.5578781, 0.6223151, 0.01379896, 0.4039216, 1, 0, 1,
-0.554337, -0.3544687, -3.397846, 0.3960784, 1, 0, 1,
-0.5505232, -0.8722488, -3.348484, 0.3921569, 1, 0, 1,
-0.5407666, 0.8914469, 0.7615715, 0.3843137, 1, 0, 1,
-0.5407147, -0.6436453, -3.51056, 0.3803922, 1, 0, 1,
-0.5404436, 0.1599246, -2.432153, 0.372549, 1, 0, 1,
-0.5394047, -1.153173, -3.492559, 0.3686275, 1, 0, 1,
-0.53258, 0.9782971, -0.7045446, 0.3607843, 1, 0, 1,
-0.5298991, 1.345191, 2.021212, 0.3568628, 1, 0, 1,
-0.5276181, 1.510276, -0.01152975, 0.3490196, 1, 0, 1,
-0.5252668, 0.2164776, -1.74469, 0.345098, 1, 0, 1,
-0.5248925, 0.6542534, -1.63564, 0.3372549, 1, 0, 1,
-0.5205348, -0.4421688, -4.031388, 0.3333333, 1, 0, 1,
-0.5189416, -0.5097808, -3.72772, 0.3254902, 1, 0, 1,
-0.5188664, -0.9735801, -2.304991, 0.3215686, 1, 0, 1,
-0.5171985, 0.7159492, 0.02901321, 0.3137255, 1, 0, 1,
-0.5158154, -0.6754509, -2.529686, 0.3098039, 1, 0, 1,
-0.5157422, -0.4658493, -1.638481, 0.3019608, 1, 0, 1,
-0.5124694, 0.2174178, 1.194859, 0.2941177, 1, 0, 1,
-0.5116057, 0.4996565, -1.396646, 0.2901961, 1, 0, 1,
-0.5045394, -0.3971146, -3.902491, 0.282353, 1, 0, 1,
-0.5044978, 1.561884, -0.8301199, 0.2784314, 1, 0, 1,
-0.5044022, 0.1343918, -2.571149, 0.2705882, 1, 0, 1,
-0.5041048, 0.2080607, -0.3246309, 0.2666667, 1, 0, 1,
-0.5035612, 0.5578414, -0.7422882, 0.2588235, 1, 0, 1,
-0.499746, 0.7094429, -1.061219, 0.254902, 1, 0, 1,
-0.4997002, 0.4173303, -0.3597487, 0.2470588, 1, 0, 1,
-0.4980099, 0.8652104, -0.9971108, 0.2431373, 1, 0, 1,
-0.4974156, -0.5749661, -0.6426715, 0.2352941, 1, 0, 1,
-0.4956122, 0.1705554, -1.731199, 0.2313726, 1, 0, 1,
-0.495391, 1.436045, -1.446244, 0.2235294, 1, 0, 1,
-0.4879389, 0.2146241, -2.244889, 0.2196078, 1, 0, 1,
-0.4864004, -1.071047, -3.386303, 0.2117647, 1, 0, 1,
-0.4846756, -1.228854, -1.204231, 0.2078431, 1, 0, 1,
-0.4789833, -0.5582563, -2.831499, 0.2, 1, 0, 1,
-0.478642, 0.3179252, -2.757235, 0.1921569, 1, 0, 1,
-0.4768218, 0.6446214, 0.9083849, 0.1882353, 1, 0, 1,
-0.4768096, -0.9537406, -1.240189, 0.1803922, 1, 0, 1,
-0.4754089, -0.4742153, -2.077272, 0.1764706, 1, 0, 1,
-0.4729863, -0.2994969, -2.622104, 0.1686275, 1, 0, 1,
-0.4723537, 0.4529434, -1.083884, 0.1647059, 1, 0, 1,
-0.4707108, -0.3444589, -4.516535, 0.1568628, 1, 0, 1,
-0.4662063, -0.2436284, -1.739278, 0.1529412, 1, 0, 1,
-0.4650423, -1.908902, -3.507424, 0.145098, 1, 0, 1,
-0.4635698, -1.046126, -2.480223, 0.1411765, 1, 0, 1,
-0.4608646, -0.7960357, -2.818667, 0.1333333, 1, 0, 1,
-0.4583978, -0.4920667, -2.547819, 0.1294118, 1, 0, 1,
-0.4581159, -1.258853, -1.855506, 0.1215686, 1, 0, 1,
-0.4501391, 1.428149, -0.04795867, 0.1176471, 1, 0, 1,
-0.4487311, -0.8693434, -2.082834, 0.1098039, 1, 0, 1,
-0.4437838, 0.0488508, -1.739681, 0.1058824, 1, 0, 1,
-0.4413264, -0.5107878, -2.99335, 0.09803922, 1, 0, 1,
-0.4394618, -0.6483036, -3.370567, 0.09019608, 1, 0, 1,
-0.4386916, -1.092785, -4.503552, 0.08627451, 1, 0, 1,
-0.4384366, 0.7854621, -1.481296, 0.07843138, 1, 0, 1,
-0.4375638, -0.1365061, -2.448116, 0.07450981, 1, 0, 1,
-0.4363879, -0.003402997, -1.666837, 0.06666667, 1, 0, 1,
-0.4300515, 0.6183706, -1.313869, 0.0627451, 1, 0, 1,
-0.4270772, 0.9889829, -0.8212009, 0.05490196, 1, 0, 1,
-0.4195028, -0.1881936, -0.4438026, 0.05098039, 1, 0, 1,
-0.4189046, -0.4601595, -2.656828, 0.04313726, 1, 0, 1,
-0.4150639, -1.798963, -1.153067, 0.03921569, 1, 0, 1,
-0.4136133, 1.406144, 1.228679, 0.03137255, 1, 0, 1,
-0.4136028, 0.6495447, -0.2069493, 0.02745098, 1, 0, 1,
-0.4124283, -1.115872, -3.574068, 0.01960784, 1, 0, 1,
-0.4093948, 0.89353, 2.133021, 0.01568628, 1, 0, 1,
-0.4088515, -0.7396889, -3.348562, 0.007843138, 1, 0, 1,
-0.4087555, 0.7102169, -0.03081509, 0.003921569, 1, 0, 1,
-0.4086201, -0.08441956, 0.2328009, 0, 1, 0.003921569, 1,
-0.4056893, 0.3103652, -1.008733, 0, 1, 0.01176471, 1,
-0.4039546, -1.435559, -1.699225, 0, 1, 0.01568628, 1,
-0.4006265, 0.08438381, 0.9660211, 0, 1, 0.02352941, 1,
-0.3998628, 0.5143839, -0.02968512, 0, 1, 0.02745098, 1,
-0.3986202, 0.5331934, -2.756642, 0, 1, 0.03529412, 1,
-0.3971339, 0.5647873, -0.7008185, 0, 1, 0.03921569, 1,
-0.395413, 1.59663, 0.9906183, 0, 1, 0.04705882, 1,
-0.3916559, 0.4470581, -0.3941474, 0, 1, 0.05098039, 1,
-0.3888922, 1.591994, -1.007225, 0, 1, 0.05882353, 1,
-0.3877907, 0.973399, -0.8304222, 0, 1, 0.0627451, 1,
-0.385675, 0.3318844, -0.04425417, 0, 1, 0.07058824, 1,
-0.3848668, -1.581577, -3.854863, 0, 1, 0.07450981, 1,
-0.3846508, 0.7104899, -0.1062825, 0, 1, 0.08235294, 1,
-0.3832895, 0.0642856, -1.536242, 0, 1, 0.08627451, 1,
-0.3779373, -0.1729823, -2.088168, 0, 1, 0.09411765, 1,
-0.3734563, 0.479513, -1.517637, 0, 1, 0.1019608, 1,
-0.3730422, 0.02689471, -0.857255, 0, 1, 0.1058824, 1,
-0.3702497, -0.8890245, -1.341877, 0, 1, 0.1137255, 1,
-0.369185, -0.06801672, -0.002402052, 0, 1, 0.1176471, 1,
-0.3644126, 0.1535334, -0.0657228, 0, 1, 0.1254902, 1,
-0.3635735, 1.044611, 0.1701766, 0, 1, 0.1294118, 1,
-0.3614273, 1.198691, 0.7378775, 0, 1, 0.1372549, 1,
-0.3597417, 0.4333512, -0.3409232, 0, 1, 0.1411765, 1,
-0.3588593, -1.388029, -2.140157, 0, 1, 0.1490196, 1,
-0.3569425, -0.3081351, -2.086636, 0, 1, 0.1529412, 1,
-0.3555692, 1.17122, 0.3491168, 0, 1, 0.1607843, 1,
-0.3510038, -2.019011, -4.216418, 0, 1, 0.1647059, 1,
-0.3504346, -2.095315, -2.97012, 0, 1, 0.172549, 1,
-0.3503171, 1.13509, 0.9027092, 0, 1, 0.1764706, 1,
-0.350136, 0.352523, 0.07987858, 0, 1, 0.1843137, 1,
-0.3500659, 0.001509807, -0.8604875, 0, 1, 0.1882353, 1,
-0.3492182, -0.174978, -3.037852, 0, 1, 0.1960784, 1,
-0.346555, 0.2050059, -0.3506606, 0, 1, 0.2039216, 1,
-0.3458502, -1.23768, -5.106362, 0, 1, 0.2078431, 1,
-0.3456379, -0.8815889, -2.77185, 0, 1, 0.2156863, 1,
-0.3443563, -0.2183643, -2.191046, 0, 1, 0.2196078, 1,
-0.342232, 1.280146, -0.2038381, 0, 1, 0.227451, 1,
-0.338092, -0.2310443, -1.496306, 0, 1, 0.2313726, 1,
-0.3366162, 1.621332, -0.03959979, 0, 1, 0.2392157, 1,
-0.3322914, 0.2704969, -0.1506578, 0, 1, 0.2431373, 1,
-0.3289605, -2.070731, -4.119183, 0, 1, 0.2509804, 1,
-0.3273493, 0.7129965, -1.026094, 0, 1, 0.254902, 1,
-0.3258195, -0.4360617, -0.7018765, 0, 1, 0.2627451, 1,
-0.320365, 0.1091452, -2.122184, 0, 1, 0.2666667, 1,
-0.3170753, 0.6936607, -0.3907248, 0, 1, 0.2745098, 1,
-0.3154066, -0.4615999, -2.051006, 0, 1, 0.2784314, 1,
-0.3139017, -1.045522, -1.899624, 0, 1, 0.2862745, 1,
-0.3075611, -0.4424102, -1.512565, 0, 1, 0.2901961, 1,
-0.3045583, -1.443904, -2.957054, 0, 1, 0.2980392, 1,
-0.3033172, -1.924004, -2.197819, 0, 1, 0.3058824, 1,
-0.2908705, 0.01771968, -1.49961, 0, 1, 0.3098039, 1,
-0.2852129, -0.4518596, -1.743173, 0, 1, 0.3176471, 1,
-0.2851013, -1.961423, -2.328737, 0, 1, 0.3215686, 1,
-0.2833239, -0.7027097, -4.616793, 0, 1, 0.3294118, 1,
-0.2732334, -0.3625128, -0.5166716, 0, 1, 0.3333333, 1,
-0.2729256, 0.4222963, 0.1137788, 0, 1, 0.3411765, 1,
-0.272646, -0.2629195, -2.76094, 0, 1, 0.345098, 1,
-0.2689039, 0.5488511, 0.2881627, 0, 1, 0.3529412, 1,
-0.2662412, 0.7972315, 1.115242, 0, 1, 0.3568628, 1,
-0.2645384, 0.5830205, -0.9553022, 0, 1, 0.3647059, 1,
-0.264185, 0.6067957, -1.02823, 0, 1, 0.3686275, 1,
-0.2639618, -0.9472114, -3.109304, 0, 1, 0.3764706, 1,
-0.2612662, -1.205857, -2.01201, 0, 1, 0.3803922, 1,
-0.2565572, 0.3735258, -0.6748565, 0, 1, 0.3882353, 1,
-0.2450919, -0.30319, -2.413191, 0, 1, 0.3921569, 1,
-0.244997, -0.7171232, -1.041794, 0, 1, 0.4, 1,
-0.2445398, 0.9804314, 0.7869189, 0, 1, 0.4078431, 1,
-0.2390818, -0.5966088, -1.096685, 0, 1, 0.4117647, 1,
-0.2382172, 0.1914845, -0.7319055, 0, 1, 0.4196078, 1,
-0.2371211, -0.5240664, -1.944006, 0, 1, 0.4235294, 1,
-0.2353015, 0.5158169, 0.04074576, 0, 1, 0.4313726, 1,
-0.2350555, 0.2613511, -0.1823144, 0, 1, 0.4352941, 1,
-0.2349441, -1.628085, -3.019577, 0, 1, 0.4431373, 1,
-0.2349058, -0.3446531, -2.411728, 0, 1, 0.4470588, 1,
-0.2320278, -0.7219383, -3.677449, 0, 1, 0.454902, 1,
-0.2294344, -0.6746854, 0.1121601, 0, 1, 0.4588235, 1,
-0.2292862, 0.7407558, -1.902828, 0, 1, 0.4666667, 1,
-0.2272164, -0.3683906, -3.158467, 0, 1, 0.4705882, 1,
-0.2258245, 0.3785091, -1.984261, 0, 1, 0.4784314, 1,
-0.2242134, -0.7423092, -1.182405, 0, 1, 0.4823529, 1,
-0.2230574, -0.4463015, -2.500574, 0, 1, 0.4901961, 1,
-0.2191022, 0.8347672, -3.171429, 0, 1, 0.4941176, 1,
-0.2175482, -0.6123556, 0.2038323, 0, 1, 0.5019608, 1,
-0.2172672, 0.2227525, -1.960846, 0, 1, 0.509804, 1,
-0.2171255, 1.435436, -2.440219, 0, 1, 0.5137255, 1,
-0.2158515, -0.6243724, -2.525094, 0, 1, 0.5215687, 1,
-0.2138026, 0.6421923, -1.780864, 0, 1, 0.5254902, 1,
-0.2102217, 0.7506196, -0.1484701, 0, 1, 0.5333334, 1,
-0.2094341, -0.231384, -1.485855, 0, 1, 0.5372549, 1,
-0.2071165, -2.630661, -2.78626, 0, 1, 0.5450981, 1,
-0.2067584, 0.7545686, 0.5020181, 0, 1, 0.5490196, 1,
-0.2025403, -1.27702, -4.552148, 0, 1, 0.5568628, 1,
-0.1975735, -0.6121339, -4.104689, 0, 1, 0.5607843, 1,
-0.1950744, 0.9324226, 0.7448961, 0, 1, 0.5686275, 1,
-0.1934809, 1.288331, -1.901233, 0, 1, 0.572549, 1,
-0.1922003, 0.008353904, -2.700044, 0, 1, 0.5803922, 1,
-0.1910034, -0.1616855, -2.930211, 0, 1, 0.5843138, 1,
-0.188324, -0.271698, -2.130628, 0, 1, 0.5921569, 1,
-0.1877702, 0.9349, -1.36221, 0, 1, 0.5960785, 1,
-0.1824031, 0.7401161, -0.05047242, 0, 1, 0.6039216, 1,
-0.1818364, -0.4589247, -1.998869, 0, 1, 0.6117647, 1,
-0.1720499, 1.185436, -0.4205546, 0, 1, 0.6156863, 1,
-0.1678433, -0.3792636, -0.3616404, 0, 1, 0.6235294, 1,
-0.1676086, -0.7800393, -2.933081, 0, 1, 0.627451, 1,
-0.1653471, -1.749631, -3.047884, 0, 1, 0.6352941, 1,
-0.1622019, -1.275702, -4.439985, 0, 1, 0.6392157, 1,
-0.161665, -3.109336, -3.597216, 0, 1, 0.6470588, 1,
-0.1602387, -0.5560248, -1.276379, 0, 1, 0.6509804, 1,
-0.1576665, -0.9724491, -4.098216, 0, 1, 0.6588235, 1,
-0.155342, -1.022233, -2.457874, 0, 1, 0.6627451, 1,
-0.1547122, 0.5531208, 0.4978044, 0, 1, 0.6705883, 1,
-0.1537653, 0.222268, 0.1729201, 0, 1, 0.6745098, 1,
-0.1512576, -2.147373, -3.199981, 0, 1, 0.682353, 1,
-0.1482102, -0.3300441, -2.952894, 0, 1, 0.6862745, 1,
-0.1467108, -1.631631, -3.67902, 0, 1, 0.6941177, 1,
-0.1465949, -0.5156868, -2.465936, 0, 1, 0.7019608, 1,
-0.1457748, -1.192353, -3.160236, 0, 1, 0.7058824, 1,
-0.1432598, -0.5114055, -2.012944, 0, 1, 0.7137255, 1,
-0.1406516, 1.85944, -0.6231001, 0, 1, 0.7176471, 1,
-0.1380929, 0.8261316, -0.1467516, 0, 1, 0.7254902, 1,
-0.137924, 1.573208, 1.968805, 0, 1, 0.7294118, 1,
-0.1350614, 1.901605, -0.8185806, 0, 1, 0.7372549, 1,
-0.1347546, 0.6151761, -0.6936023, 0, 1, 0.7411765, 1,
-0.1302956, 0.7122176, 1.489254, 0, 1, 0.7490196, 1,
-0.1272523, -0.2316785, -2.928339, 0, 1, 0.7529412, 1,
-0.1267169, -0.5035918, -1.314738, 0, 1, 0.7607843, 1,
-0.1248119, -0.9102882, -2.266762, 0, 1, 0.7647059, 1,
-0.1235346, -0.8178617, -3.167658, 0, 1, 0.772549, 1,
-0.1213142, -0.4387377, -2.89328, 0, 1, 0.7764706, 1,
-0.1207602, -0.03392314, -3.601924, 0, 1, 0.7843137, 1,
-0.120293, 0.1007893, -0.7170466, 0, 1, 0.7882353, 1,
-0.1178257, -0.2760868, -3.154307, 0, 1, 0.7960784, 1,
-0.1172758, -2.243743, -3.778151, 0, 1, 0.8039216, 1,
-0.1161123, 0.9120469, -1.332699, 0, 1, 0.8078431, 1,
-0.1070118, 1.822568, -0.05164176, 0, 1, 0.8156863, 1,
-0.1047566, -0.8853768, -4.602768, 0, 1, 0.8196079, 1,
-0.1013008, 0.8506777, -1.355169, 0, 1, 0.827451, 1,
-0.09414947, -0.02263124, -3.192777, 0, 1, 0.8313726, 1,
-0.08969391, -0.4370907, -2.132385, 0, 1, 0.8392157, 1,
-0.08819599, 0.3052243, -1.782418, 0, 1, 0.8431373, 1,
-0.08661538, -0.1424629, -2.665397, 0, 1, 0.8509804, 1,
-0.08094532, -0.4426351, -1.270639, 0, 1, 0.854902, 1,
-0.07652035, 1.967208, -0.7722729, 0, 1, 0.8627451, 1,
-0.07369822, -0.581602, -2.903258, 0, 1, 0.8666667, 1,
-0.06733764, -0.9516549, -3.831181, 0, 1, 0.8745098, 1,
-0.06352367, 1.217802, 0.4057076, 0, 1, 0.8784314, 1,
-0.0519803, 1.318802, -0.383765, 0, 1, 0.8862745, 1,
-0.05049555, 2.132784, -0.003811338, 0, 1, 0.8901961, 1,
-0.04891428, -0.1239185, -2.771695, 0, 1, 0.8980392, 1,
-0.04890854, -1.264849, -2.558245, 0, 1, 0.9058824, 1,
-0.0484235, 0.2320122, -0.1549682, 0, 1, 0.9098039, 1,
-0.042249, 1.209174, -1.123448, 0, 1, 0.9176471, 1,
-0.03406268, -0.1415342, -2.605456, 0, 1, 0.9215686, 1,
-0.03345728, 0.7808363, 0.3243243, 0, 1, 0.9294118, 1,
-0.02790177, -1.020517, -3.098968, 0, 1, 0.9333333, 1,
-0.02512802, -1.399652, -3.025099, 0, 1, 0.9411765, 1,
-0.0235191, -1.106248, -3.075853, 0, 1, 0.945098, 1,
-0.02058654, -0.9409589, -3.758439, 0, 1, 0.9529412, 1,
-0.01932662, 1.345399, -0.8990178, 0, 1, 0.9568627, 1,
-0.01837343, 0.9623994, 0.8260983, 0, 1, 0.9647059, 1,
-0.01705804, -0.7892758, -4.967057, 0, 1, 0.9686275, 1,
-0.01653409, 0.01297042, -0.9951624, 0, 1, 0.9764706, 1,
-0.01587078, -1.989913, -2.753408, 0, 1, 0.9803922, 1,
-0.01422943, 1.570771, -1.438574, 0, 1, 0.9882353, 1,
-0.01285523, -1.571615, -3.84552, 0, 1, 0.9921569, 1,
-0.00710388, 1.906632, 2.081475, 0, 1, 1, 1,
-0.005889251, -1.291185, -3.086702, 0, 0.9921569, 1, 1,
-0.00247718, -0.1768567, -2.456216, 0, 0.9882353, 1, 1,
-0.002305099, -0.5691642, -2.993119, 0, 0.9803922, 1, 1,
-0.001088362, -1.680405, -3.547178, 0, 0.9764706, 1, 1,
0.0009403027, -0.3886257, 1.89174, 0, 0.9686275, 1, 1,
0.002723643, -0.8783446, 1.94137, 0, 0.9647059, 1, 1,
0.005883386, -0.03824842, 2.940068, 0, 0.9568627, 1, 1,
0.02646998, 0.3244847, 1.398944, 0, 0.9529412, 1, 1,
0.02887001, 0.2521082, 0.235287, 0, 0.945098, 1, 1,
0.02987461, 0.6853595, -0.3203067, 0, 0.9411765, 1, 1,
0.03235674, 1.491829, 0.125498, 0, 0.9333333, 1, 1,
0.0386088, -1.618269, 3.610373, 0, 0.9294118, 1, 1,
0.04395854, 2.005247, -2.355042, 0, 0.9215686, 1, 1,
0.04768791, -0.09215701, 3.163744, 0, 0.9176471, 1, 1,
0.0479758, -0.8272388, 3.081345, 0, 0.9098039, 1, 1,
0.05013948, -0.09446051, 2.889038, 0, 0.9058824, 1, 1,
0.05099268, 0.4388455, -0.1747292, 0, 0.8980392, 1, 1,
0.05377437, -1.406619, 1.706782, 0, 0.8901961, 1, 1,
0.05643049, -0.735202, 1.628016, 0, 0.8862745, 1, 1,
0.05659349, 0.2192334, -0.8262196, 0, 0.8784314, 1, 1,
0.06533347, 0.976815, -0.6610533, 0, 0.8745098, 1, 1,
0.06797606, -1.404989, 1.624291, 0, 0.8666667, 1, 1,
0.06879158, 0.2753149, -0.2934, 0, 0.8627451, 1, 1,
0.07166871, -0.7995725, 3.557001, 0, 0.854902, 1, 1,
0.0719445, 0.6621192, 0.1736619, 0, 0.8509804, 1, 1,
0.07295691, 0.5057214, 0.7488498, 0, 0.8431373, 1, 1,
0.07856478, -0.2194655, 3.84095, 0, 0.8392157, 1, 1,
0.08199219, 2.268421, 0.1664046, 0, 0.8313726, 1, 1,
0.08336951, -0.9337172, 2.122113, 0, 0.827451, 1, 1,
0.09714199, 0.254294, -0.5030702, 0, 0.8196079, 1, 1,
0.09821627, -0.4845, 1.291951, 0, 0.8156863, 1, 1,
0.09931962, 0.5761001, 1.235439, 0, 0.8078431, 1, 1,
0.1009626, -0.4481132, 1.825237, 0, 0.8039216, 1, 1,
0.1063279, -0.3448659, 3.667709, 0, 0.7960784, 1, 1,
0.1100581, 0.7458037, -0.5012279, 0, 0.7882353, 1, 1,
0.1226238, 0.925687, 0.3484209, 0, 0.7843137, 1, 1,
0.1284046, 0.4593489, 1.440463, 0, 0.7764706, 1, 1,
0.1294304, 0.02186495, -0.56216, 0, 0.772549, 1, 1,
0.1302537, 0.4990374, 0.8522553, 0, 0.7647059, 1, 1,
0.1311747, 0.0615515, -1.708434, 0, 0.7607843, 1, 1,
0.135527, -0.04479694, 0.4540446, 0, 0.7529412, 1, 1,
0.1361348, 0.3495968, 0.5827071, 0, 0.7490196, 1, 1,
0.1381047, 0.08758325, 2.555494, 0, 0.7411765, 1, 1,
0.1460436, 1.071642, 0.4300787, 0, 0.7372549, 1, 1,
0.1477597, 0.3586232, 1.037041, 0, 0.7294118, 1, 1,
0.1483038, 0.7184733, 0.07519152, 0, 0.7254902, 1, 1,
0.1487272, -1.445537, 3.491791, 0, 0.7176471, 1, 1,
0.15266, -1.753223, 3.624471, 0, 0.7137255, 1, 1,
0.1584871, 1.670298, 0.6774665, 0, 0.7058824, 1, 1,
0.1598032, -0.699522, 2.721625, 0, 0.6980392, 1, 1,
0.1600122, -0.2396392, 1.976995, 0, 0.6941177, 1, 1,
0.1644166, -0.6523805, 3.64624, 0, 0.6862745, 1, 1,
0.1652843, -1.829964, 3.129335, 0, 0.682353, 1, 1,
0.1653724, -0.5121115, 3.668424, 0, 0.6745098, 1, 1,
0.1675696, -0.6592126, 2.019351, 0, 0.6705883, 1, 1,
0.1692731, -0.2180008, 1.895515, 0, 0.6627451, 1, 1,
0.1694077, 0.4392394, 0.8154616, 0, 0.6588235, 1, 1,
0.1747615, 1.069537, 0.3698248, 0, 0.6509804, 1, 1,
0.1771606, 0.4230036, 1.02227, 0, 0.6470588, 1, 1,
0.1830367, -1.847207, 2.51857, 0, 0.6392157, 1, 1,
0.1846805, 0.2683623, -1.433103, 0, 0.6352941, 1, 1,
0.1877255, 0.2528339, -0.5767193, 0, 0.627451, 1, 1,
0.1929538, -0.5793617, 2.158032, 0, 0.6235294, 1, 1,
0.1966282, -1.554011, 2.555825, 0, 0.6156863, 1, 1,
0.1970346, 0.1946356, 0.3547959, 0, 0.6117647, 1, 1,
0.1974442, 0.09371354, 1.190428, 0, 0.6039216, 1, 1,
0.2005062, 0.8660011, 1.860092, 0, 0.5960785, 1, 1,
0.2016418, 0.7943026, 1.996881, 0, 0.5921569, 1, 1,
0.20382, -0.2740354, 1.072596, 0, 0.5843138, 1, 1,
0.2047093, -0.8564742, 2.172459, 0, 0.5803922, 1, 1,
0.2153018, -1.269944, 4.262734, 0, 0.572549, 1, 1,
0.2182651, 1.023455, -1.640515, 0, 0.5686275, 1, 1,
0.2207821, 0.6821671, 0.190966, 0, 0.5607843, 1, 1,
0.2286553, 1.129761, 0.7116525, 0, 0.5568628, 1, 1,
0.2292955, 0.7243206, -0.2613208, 0, 0.5490196, 1, 1,
0.2317352, 0.3222102, 1.758482, 0, 0.5450981, 1, 1,
0.2341205, -0.1865552, 2.505914, 0, 0.5372549, 1, 1,
0.2380509, 0.984721, 0.2437609, 0, 0.5333334, 1, 1,
0.243708, -1.832838, 4.288204, 0, 0.5254902, 1, 1,
0.2476447, -0.1495046, 2.1684, 0, 0.5215687, 1, 1,
0.2480421, 0.9557519, 1.152886, 0, 0.5137255, 1, 1,
0.2487198, -0.7431417, 3.423199, 0, 0.509804, 1, 1,
0.2489027, -1.635278, 2.561433, 0, 0.5019608, 1, 1,
0.2503614, 1.94944, -0.3163859, 0, 0.4941176, 1, 1,
0.2518187, -0.5634826, 1.034941, 0, 0.4901961, 1, 1,
0.2536859, 1.735926, -0.2478105, 0, 0.4823529, 1, 1,
0.2649921, -0.7533303, 1.773532, 0, 0.4784314, 1, 1,
0.271239, -0.4865518, 1.449851, 0, 0.4705882, 1, 1,
0.2720288, -2.277011, 2.319144, 0, 0.4666667, 1, 1,
0.274123, 1.091032, 0.3046779, 0, 0.4588235, 1, 1,
0.2761048, 0.3731251, 0.3347075, 0, 0.454902, 1, 1,
0.2824803, -1.308908, 3.122977, 0, 0.4470588, 1, 1,
0.2920177, -2.610731, 2.77844, 0, 0.4431373, 1, 1,
0.2974193, -0.8392802, 2.890909, 0, 0.4352941, 1, 1,
0.2995022, -0.08920092, 1.746745, 0, 0.4313726, 1, 1,
0.3033685, 1.818354, 0.7015638, 0, 0.4235294, 1, 1,
0.3061903, -1.200905, 2.702707, 0, 0.4196078, 1, 1,
0.3096456, 0.68604, 1.461911, 0, 0.4117647, 1, 1,
0.3106245, 1.144878, -0.7699086, 0, 0.4078431, 1, 1,
0.3127985, -0.1461726, 1.823648, 0, 0.4, 1, 1,
0.3151402, -1.378551, 2.37661, 0, 0.3921569, 1, 1,
0.3152034, -0.3152668, 2.619795, 0, 0.3882353, 1, 1,
0.3154657, 0.002276892, 1.516047, 0, 0.3803922, 1, 1,
0.3295861, 0.262555, 1.574756, 0, 0.3764706, 1, 1,
0.3323272, 0.0743852, 1.199012, 0, 0.3686275, 1, 1,
0.3440789, 1.313648, 0.3861299, 0, 0.3647059, 1, 1,
0.3453028, 1.725457, 0.5109878, 0, 0.3568628, 1, 1,
0.3461429, -0.2791078, 2.878609, 0, 0.3529412, 1, 1,
0.3465597, 0.5255547, -0.1891773, 0, 0.345098, 1, 1,
0.3466602, -1.040093, 2.373063, 0, 0.3411765, 1, 1,
0.3507653, 0.2588151, 1.281184, 0, 0.3333333, 1, 1,
0.3522575, -0.903119, 2.450375, 0, 0.3294118, 1, 1,
0.3574066, -1.712955, 1.978058, 0, 0.3215686, 1, 1,
0.3607011, 0.4891577, 0.8020679, 0, 0.3176471, 1, 1,
0.3607221, -1.940323, 3.673317, 0, 0.3098039, 1, 1,
0.3623792, 0.04131255, 1.996011, 0, 0.3058824, 1, 1,
0.3633103, -2.436799, 3.865583, 0, 0.2980392, 1, 1,
0.3671395, 0.002989275, 1.253744, 0, 0.2901961, 1, 1,
0.3689668, -0.8061916, 3.094534, 0, 0.2862745, 1, 1,
0.3805203, -1.561305, 0.991854, 0, 0.2784314, 1, 1,
0.383489, -0.05559875, 1.238574, 0, 0.2745098, 1, 1,
0.384041, -1.128414, 3.233892, 0, 0.2666667, 1, 1,
0.3865494, -0.136445, 1.993543, 0, 0.2627451, 1, 1,
0.3903161, -1.243554, 4.027166, 0, 0.254902, 1, 1,
0.3913297, -0.7912549, 3.953681, 0, 0.2509804, 1, 1,
0.3981121, -0.2810075, 2.81411, 0, 0.2431373, 1, 1,
0.3992085, -0.9553232, 1.699511, 0, 0.2392157, 1, 1,
0.4048159, -0.2332394, 3.000601, 0, 0.2313726, 1, 1,
0.4067926, 0.5735624, -0.2951676, 0, 0.227451, 1, 1,
0.4143789, -1.420701, 5.401147, 0, 0.2196078, 1, 1,
0.4166878, 0.08289296, 0.6836347, 0, 0.2156863, 1, 1,
0.4189143, 0.1214894, 2.200694, 0, 0.2078431, 1, 1,
0.4195924, 1.81937, 0.9041794, 0, 0.2039216, 1, 1,
0.4235372, -1.777161, 3.016946, 0, 0.1960784, 1, 1,
0.4242033, 2.597543, 1.396194, 0, 0.1882353, 1, 1,
0.4267229, -1.345186, 4.11364, 0, 0.1843137, 1, 1,
0.4276929, -1.702172, 2.193204, 0, 0.1764706, 1, 1,
0.431925, -0.4248535, 1.938427, 0, 0.172549, 1, 1,
0.4346031, -0.3300264, 2.599114, 0, 0.1647059, 1, 1,
0.4350668, -0.05478657, 0.7651725, 0, 0.1607843, 1, 1,
0.4372298, 0.1574151, 1.469408, 0, 0.1529412, 1, 1,
0.4373892, -1.031481, 3.274983, 0, 0.1490196, 1, 1,
0.4373927, -1.555153, 2.799585, 0, 0.1411765, 1, 1,
0.4403986, -0.5482848, 1.992112, 0, 0.1372549, 1, 1,
0.4406103, -0.5748671, 1.581243, 0, 0.1294118, 1, 1,
0.4478191, -1.010294, 4.350116, 0, 0.1254902, 1, 1,
0.4479693, -0.2333699, 2.186149, 0, 0.1176471, 1, 1,
0.4493897, 0.02912851, 1.188667, 0, 0.1137255, 1, 1,
0.4508171, -0.6896617, 2.588149, 0, 0.1058824, 1, 1,
0.4536687, -0.1954573, 0.4136615, 0, 0.09803922, 1, 1,
0.4557017, -1.803273, 2.720807, 0, 0.09411765, 1, 1,
0.4572723, -0.1679433, 2.915061, 0, 0.08627451, 1, 1,
0.4627797, -0.1337572, 2.959311, 0, 0.08235294, 1, 1,
0.4643333, 0.6115198, 0.09039123, 0, 0.07450981, 1, 1,
0.4664305, 0.364402, -0.6595752, 0, 0.07058824, 1, 1,
0.4698174, -0.3641436, 3.281021, 0, 0.0627451, 1, 1,
0.4703231, -1.771237, 2.751583, 0, 0.05882353, 1, 1,
0.4816354, -0.3740266, 1.176263, 0, 0.05098039, 1, 1,
0.4836298, -0.7516022, 3.670265, 0, 0.04705882, 1, 1,
0.4839937, -0.8812853, 2.650962, 0, 0.03921569, 1, 1,
0.4873967, 0.7333844, -0.7221557, 0, 0.03529412, 1, 1,
0.4877381, 0.008067122, 1.593216, 0, 0.02745098, 1, 1,
0.488679, -0.1717223, 2.023063, 0, 0.02352941, 1, 1,
0.4911969, 2.163631, 1.751124, 0, 0.01568628, 1, 1,
0.4952474, -2.307973, 2.7652, 0, 0.01176471, 1, 1,
0.4968306, -0.7727005, 4.160562, 0, 0.003921569, 1, 1,
0.4996057, -0.8640046, 2.050731, 0.003921569, 0, 1, 1,
0.5029178, -1.451079, 1.980467, 0.007843138, 0, 1, 1,
0.5210387, -0.01029875, 2.057862, 0.01568628, 0, 1, 1,
0.5228825, -0.3613897, 3.564039, 0.01960784, 0, 1, 1,
0.5334767, -0.5806305, 2.863616, 0.02745098, 0, 1, 1,
0.5413723, -0.2111459, 2.127483, 0.03137255, 0, 1, 1,
0.546221, -1.675464, 3.302244, 0.03921569, 0, 1, 1,
0.5485224, -0.3249872, 2.339984, 0.04313726, 0, 1, 1,
0.5493661, 1.099636, 1.121671, 0.05098039, 0, 1, 1,
0.5518208, -1.56691, 2.876324, 0.05490196, 0, 1, 1,
0.5526855, 0.8784101, 1.237381, 0.0627451, 0, 1, 1,
0.553026, -1.810137, 4.671545, 0.06666667, 0, 1, 1,
0.5556467, 1.122894, -0.5583718, 0.07450981, 0, 1, 1,
0.5561092, -0.2442895, 3.413462, 0.07843138, 0, 1, 1,
0.5636534, -2.358688, 1.681372, 0.08627451, 0, 1, 1,
0.5660938, -0.8025762, 2.452734, 0.09019608, 0, 1, 1,
0.56646, 0.8755606, 1.825589, 0.09803922, 0, 1, 1,
0.5669587, -0.1166206, 2.035609, 0.1058824, 0, 1, 1,
0.5675868, 1.23936, 1.654486, 0.1098039, 0, 1, 1,
0.567768, -0.7953021, 2.199992, 0.1176471, 0, 1, 1,
0.5686554, 1.041444, 1.87639, 0.1215686, 0, 1, 1,
0.5702522, 0.001978794, -0.9081205, 0.1294118, 0, 1, 1,
0.5707664, -0.02230455, 0.6048022, 0.1333333, 0, 1, 1,
0.575312, -0.6059022, 2.627033, 0.1411765, 0, 1, 1,
0.5778767, -1.285227, 1.637946, 0.145098, 0, 1, 1,
0.5815811, -0.453774, 0.6822113, 0.1529412, 0, 1, 1,
0.5880594, 0.9037631, 0.1957134, 0.1568628, 0, 1, 1,
0.5883632, -0.1423796, 1.545631, 0.1647059, 0, 1, 1,
0.5970536, -0.2136295, 4.542788, 0.1686275, 0, 1, 1,
0.59806, -0.5955453, 2.687167, 0.1764706, 0, 1, 1,
0.5986072, -1.643784, 2.219215, 0.1803922, 0, 1, 1,
0.5994607, -2.404749, 3.354626, 0.1882353, 0, 1, 1,
0.6004156, 1.200741, 1.639847, 0.1921569, 0, 1, 1,
0.6045399, -0.7878285, 2.679915, 0.2, 0, 1, 1,
0.6067774, -0.7598195, 2.385097, 0.2078431, 0, 1, 1,
0.6068045, 2.215675, -1.281427, 0.2117647, 0, 1, 1,
0.6101696, 0.6580604, 2.495122, 0.2196078, 0, 1, 1,
0.6137705, 1.210471, 0.6203175, 0.2235294, 0, 1, 1,
0.6163099, 1.5851, 0.2551387, 0.2313726, 0, 1, 1,
0.6193393, -0.23319, 1.894258, 0.2352941, 0, 1, 1,
0.6230309, -0.06187163, 0.707017, 0.2431373, 0, 1, 1,
0.6275567, 0.2259833, 0.541997, 0.2470588, 0, 1, 1,
0.6296555, -0.3709995, 0.1989578, 0.254902, 0, 1, 1,
0.631651, 0.2198338, -0.5879341, 0.2588235, 0, 1, 1,
0.6317091, 0.403822, 0.02089169, 0.2666667, 0, 1, 1,
0.6358168, -0.7190316, 3.222581, 0.2705882, 0, 1, 1,
0.6364705, 0.7226514, 1.339221, 0.2784314, 0, 1, 1,
0.6365646, -0.04718442, 0.5800863, 0.282353, 0, 1, 1,
0.6384465, -0.7567743, 0.8021644, 0.2901961, 0, 1, 1,
0.6412496, -0.3535744, 2.321753, 0.2941177, 0, 1, 1,
0.6497254, 0.01652191, 2.907049, 0.3019608, 0, 1, 1,
0.6514642, 1.422729, 0.6964253, 0.3098039, 0, 1, 1,
0.6526648, -0.688439, -0.03012279, 0.3137255, 0, 1, 1,
0.6613143, -1.635547, 2.847299, 0.3215686, 0, 1, 1,
0.6614819, 1.448338, 1.370473, 0.3254902, 0, 1, 1,
0.6629676, 0.08586962, 0.7978791, 0.3333333, 0, 1, 1,
0.6632859, 0.1050892, 1.561729, 0.3372549, 0, 1, 1,
0.6633457, -1.646283, 2.183457, 0.345098, 0, 1, 1,
0.6652604, -0.9582582, 2.584948, 0.3490196, 0, 1, 1,
0.6704119, -1.366072, 3.74496, 0.3568628, 0, 1, 1,
0.6704312, 0.4153397, 0.5098816, 0.3607843, 0, 1, 1,
0.6787473, 0.333532, 0.001728098, 0.3686275, 0, 1, 1,
0.680465, -1.180201, 3.079148, 0.372549, 0, 1, 1,
0.6813358, 0.07315123, 0.01994688, 0.3803922, 0, 1, 1,
0.6833146, 0.7353803, 0.2508518, 0.3843137, 0, 1, 1,
0.6843697, -2.321702, 1.130277, 0.3921569, 0, 1, 1,
0.6849846, 1.06645, 1.622439, 0.3960784, 0, 1, 1,
0.6987736, -0.1839692, 0.5646783, 0.4039216, 0, 1, 1,
0.6991196, -0.1289531, 1.994979, 0.4117647, 0, 1, 1,
0.7001302, 0.5775536, 1.272683, 0.4156863, 0, 1, 1,
0.705187, -0.02011353, 2.627191, 0.4235294, 0, 1, 1,
0.7109858, -0.1377723, 2.196998, 0.427451, 0, 1, 1,
0.7139009, -0.6926761, 1.574028, 0.4352941, 0, 1, 1,
0.7153904, -0.1456515, 1.702261, 0.4392157, 0, 1, 1,
0.7167959, -0.6736954, 1.95435, 0.4470588, 0, 1, 1,
0.720529, 0.6830333, 1.381479, 0.4509804, 0, 1, 1,
0.7258974, -1.244956, 1.941377, 0.4588235, 0, 1, 1,
0.7364506, 3.150798, -0.1387627, 0.4627451, 0, 1, 1,
0.7393019, 0.9024961, 1.794807, 0.4705882, 0, 1, 1,
0.7427866, -0.7987558, 1.722863, 0.4745098, 0, 1, 1,
0.7437915, -1.322751, 3.487241, 0.4823529, 0, 1, 1,
0.7498062, 0.1029582, 3.069928, 0.4862745, 0, 1, 1,
0.7526553, -1.130136, 1.852087, 0.4941176, 0, 1, 1,
0.755504, 0.8422871, 2.097877, 0.5019608, 0, 1, 1,
0.7564327, 0.8707541, 0.4866473, 0.5058824, 0, 1, 1,
0.7630614, 0.244407, 1.475713, 0.5137255, 0, 1, 1,
0.7640309, -1.348643, 3.154814, 0.5176471, 0, 1, 1,
0.7682927, 0.7126753, -0.2757053, 0.5254902, 0, 1, 1,
0.7695754, -0.1438117, 2.792526, 0.5294118, 0, 1, 1,
0.7718793, -0.07144485, 1.776627, 0.5372549, 0, 1, 1,
0.7772155, -0.9111542, 2.270266, 0.5411765, 0, 1, 1,
0.7833142, -1.025079, 2.212279, 0.5490196, 0, 1, 1,
0.7842972, -0.3176621, 0.97678, 0.5529412, 0, 1, 1,
0.7849533, 1.276137, 1.020343, 0.5607843, 0, 1, 1,
0.7894846, 0.3664239, -0.9047868, 0.5647059, 0, 1, 1,
0.7895752, 0.5593094, 1.157364, 0.572549, 0, 1, 1,
0.7917154, 0.09183241, 0.7127266, 0.5764706, 0, 1, 1,
0.79336, -1.297102, 2.674762, 0.5843138, 0, 1, 1,
0.794248, 0.7281294, 1.210198, 0.5882353, 0, 1, 1,
0.800705, -0.3899051, 3.432356, 0.5960785, 0, 1, 1,
0.8024763, 0.2849769, 2.26037, 0.6039216, 0, 1, 1,
0.8061136, 1.418919, -0.6405405, 0.6078432, 0, 1, 1,
0.8066602, 0.7133651, 1.248454, 0.6156863, 0, 1, 1,
0.8067662, -0.7811483, 2.745136, 0.6196079, 0, 1, 1,
0.8082206, -0.8127676, 2.941529, 0.627451, 0, 1, 1,
0.8115359, -0.04506986, 0.8968056, 0.6313726, 0, 1, 1,
0.8128195, -0.2407427, 3.032108, 0.6392157, 0, 1, 1,
0.8137552, -2.330077, 4.585706, 0.6431373, 0, 1, 1,
0.8169154, 0.2379569, 0.8154426, 0.6509804, 0, 1, 1,
0.8193769, -2.546708, 1.403591, 0.654902, 0, 1, 1,
0.8217469, 1.155339, 1.53375, 0.6627451, 0, 1, 1,
0.8292521, 1.555302, 1.333083, 0.6666667, 0, 1, 1,
0.8355185, 0.01903234, 1.246432, 0.6745098, 0, 1, 1,
0.8368104, -0.5525586, 2.001053, 0.6784314, 0, 1, 1,
0.838163, -0.03301354, 3.646076, 0.6862745, 0, 1, 1,
0.8444873, 1.235581, 1.597829, 0.6901961, 0, 1, 1,
0.8466405, 0.7500107, 0.6603502, 0.6980392, 0, 1, 1,
0.8482191, -0.5304946, 4.68162, 0.7058824, 0, 1, 1,
0.8521668, 1.254864, 0.8579957, 0.7098039, 0, 1, 1,
0.8532419, -0.3909892, 1.783626, 0.7176471, 0, 1, 1,
0.8542733, 2.156871, 2.587457, 0.7215686, 0, 1, 1,
0.8548098, -1.376233, 0.9753492, 0.7294118, 0, 1, 1,
0.8614153, 0.4507121, -0.8127699, 0.7333333, 0, 1, 1,
0.8667889, 0.9101419, 2.62904, 0.7411765, 0, 1, 1,
0.8687043, -1.149543, 1.149421, 0.7450981, 0, 1, 1,
0.8698916, 1.546279, 2.322053, 0.7529412, 0, 1, 1,
0.8728691, 1.244692, 1.30797, 0.7568628, 0, 1, 1,
0.8769203, 0.4873407, 0.1076277, 0.7647059, 0, 1, 1,
0.8783283, 1.601057, 0.8998675, 0.7686275, 0, 1, 1,
0.8806809, 0.01397171, 0.4273839, 0.7764706, 0, 1, 1,
0.8980892, 0.3453788, 0.8721277, 0.7803922, 0, 1, 1,
0.9081755, -0.0978893, -0.587019, 0.7882353, 0, 1, 1,
0.9099579, -1.288254, 2.470798, 0.7921569, 0, 1, 1,
0.9116632, -1.277253, 1.93253, 0.8, 0, 1, 1,
0.9137268, -1.560591, 0.3838796, 0.8078431, 0, 1, 1,
0.9169584, -0.5789785, 2.511307, 0.8117647, 0, 1, 1,
0.9185416, -1.917715, 2.154559, 0.8196079, 0, 1, 1,
0.9186772, 0.048643, 1.485261, 0.8235294, 0, 1, 1,
0.924621, 0.7320983, 2.634712, 0.8313726, 0, 1, 1,
0.9332652, 0.3746116, 0.5016665, 0.8352941, 0, 1, 1,
0.9349823, 0.4976986, 1.458862, 0.8431373, 0, 1, 1,
0.9559596, -0.3593342, 0.8612481, 0.8470588, 0, 1, 1,
0.9583806, -0.1459487, 3.428117, 0.854902, 0, 1, 1,
0.9593573, 0.1143503, 3.091465, 0.8588235, 0, 1, 1,
0.9671578, 0.6265737, 0.5674406, 0.8666667, 0, 1, 1,
0.9731576, 2.222204, -0.6307161, 0.8705882, 0, 1, 1,
0.98039, 0.7531361, 1.037571, 0.8784314, 0, 1, 1,
0.9806961, -0.2624496, 0.2082096, 0.8823529, 0, 1, 1,
0.996016, -0.8424312, 3.03089, 0.8901961, 0, 1, 1,
0.9968709, 1.934928, 0.2877967, 0.8941177, 0, 1, 1,
0.9974741, 0.3054493, 3.043175, 0.9019608, 0, 1, 1,
0.9981257, 1.706673, 1.36709, 0.9098039, 0, 1, 1,
0.9998235, -0.07376484, 1.933899, 0.9137255, 0, 1, 1,
1.000438, -0.7130318, 5.771056, 0.9215686, 0, 1, 1,
1.007683, -0.5396675, 1.568573, 0.9254902, 0, 1, 1,
1.020148, -2.325377, 2.302705, 0.9333333, 0, 1, 1,
1.031151, -1.040813, 3.502349, 0.9372549, 0, 1, 1,
1.037608, -1.305941, 1.96338, 0.945098, 0, 1, 1,
1.037859, 0.9142971, 1.437391, 0.9490196, 0, 1, 1,
1.049508, 0.03518251, 1.822966, 0.9568627, 0, 1, 1,
1.055276, -0.8971864, 2.481625, 0.9607843, 0, 1, 1,
1.057374, 0.5953605, -0.05011144, 0.9686275, 0, 1, 1,
1.057916, 0.1925723, 1.170599, 0.972549, 0, 1, 1,
1.06671, -1.038428, 0.3023413, 0.9803922, 0, 1, 1,
1.069907, 0.281485, 2.226384, 0.9843137, 0, 1, 1,
1.07157, -0.07538918, 2.363477, 0.9921569, 0, 1, 1,
1.075154, -0.1715598, 0.8680101, 0.9960784, 0, 1, 1,
1.082168, -0.5736796, 2.447308, 1, 0, 0.9960784, 1,
1.084388, 1.253582, 0.3783637, 1, 0, 0.9882353, 1,
1.103431, 0.5283712, 0.4230244, 1, 0, 0.9843137, 1,
1.105511, 0.255655, 0.611682, 1, 0, 0.9764706, 1,
1.105871, 1.020893, 0.7214456, 1, 0, 0.972549, 1,
1.109988, 0.3148575, -0.004387596, 1, 0, 0.9647059, 1,
1.112217, 1.234289, -0.5467101, 1, 0, 0.9607843, 1,
1.113187, 0.1735814, 2.459887, 1, 0, 0.9529412, 1,
1.117358, 0.6608006, 1.613814, 1, 0, 0.9490196, 1,
1.11799, -0.7928958, 1.894511, 1, 0, 0.9411765, 1,
1.119668, 0.4763179, 2.000158, 1, 0, 0.9372549, 1,
1.124105, 0.4699288, 0.6258327, 1, 0, 0.9294118, 1,
1.125182, -0.6309277, 1.8998, 1, 0, 0.9254902, 1,
1.127976, 0.1417623, 1.476154, 1, 0, 0.9176471, 1,
1.131244, -2.976514, 2.127654, 1, 0, 0.9137255, 1,
1.135613, -0.1505988, 1.051156, 1, 0, 0.9058824, 1,
1.149762, 0.344747, 0.5024087, 1, 0, 0.9019608, 1,
1.152983, -1.300883, 2.255742, 1, 0, 0.8941177, 1,
1.154209, -0.4864339, 0.7766376, 1, 0, 0.8862745, 1,
1.161993, 1.588851, 0.0004307151, 1, 0, 0.8823529, 1,
1.164899, 1.489455, 0.7417525, 1, 0, 0.8745098, 1,
1.17152, -0.5467224, 2.022128, 1, 0, 0.8705882, 1,
1.185187, 1.91235, -0.1595404, 1, 0, 0.8627451, 1,
1.187876, -0.3321096, 1.178159, 1, 0, 0.8588235, 1,
1.189237, 0.1415884, 2.396749, 1, 0, 0.8509804, 1,
1.193004, -1.203465, 1.251763, 1, 0, 0.8470588, 1,
1.195616, -1.136983, 2.723987, 1, 0, 0.8392157, 1,
1.199068, 2.424446, 0.7718093, 1, 0, 0.8352941, 1,
1.20376, -0.5954269, 2.330963, 1, 0, 0.827451, 1,
1.210877, 1.919378, 0.3422723, 1, 0, 0.8235294, 1,
1.216375, 0.6830037, 1.30806, 1, 0, 0.8156863, 1,
1.226594, 0.9685154, 2.358896, 1, 0, 0.8117647, 1,
1.226727, 1.109152, -0.4235573, 1, 0, 0.8039216, 1,
1.228011, 0.4544123, -0.327397, 1, 0, 0.7960784, 1,
1.228754, -1.566541, 3.189464, 1, 0, 0.7921569, 1,
1.241016, 0.5675623, 0.08286647, 1, 0, 0.7843137, 1,
1.248367, 0.4920447, 1.091732, 1, 0, 0.7803922, 1,
1.252161, -0.6414297, 0.7829592, 1, 0, 0.772549, 1,
1.256634, 0.5393654, 0.3859874, 1, 0, 0.7686275, 1,
1.258188, -0.1209788, 2.279493, 1, 0, 0.7607843, 1,
1.268137, -0.9040176, 3.814047, 1, 0, 0.7568628, 1,
1.270257, -1.291975, 2.610168, 1, 0, 0.7490196, 1,
1.274336, 1.261303, -0.0251514, 1, 0, 0.7450981, 1,
1.277794, 1.397935, 1.138268, 1, 0, 0.7372549, 1,
1.295123, -1.04976, 2.016231, 1, 0, 0.7333333, 1,
1.298236, -0.7722397, 1.589909, 1, 0, 0.7254902, 1,
1.314844, -1.792857, 2.596423, 1, 0, 0.7215686, 1,
1.320581, 0.3514445, 0.5314572, 1, 0, 0.7137255, 1,
1.331787, 0.5385777, -0.4155155, 1, 0, 0.7098039, 1,
1.335208, 0.2445718, 0.6446596, 1, 0, 0.7019608, 1,
1.341076, -2.535831, -0.1154201, 1, 0, 0.6941177, 1,
1.341829, 0.5433087, 1.462276, 1, 0, 0.6901961, 1,
1.349678, -0.1923318, 0.3934788, 1, 0, 0.682353, 1,
1.350598, 0.6887697, 0.596691, 1, 0, 0.6784314, 1,
1.354419, 0.7136807, 2.512333, 1, 0, 0.6705883, 1,
1.355159, 1.682528, 0.06969824, 1, 0, 0.6666667, 1,
1.360131, 0.7985879, 0.562807, 1, 0, 0.6588235, 1,
1.366472, 0.7334018, 0.4675109, 1, 0, 0.654902, 1,
1.372189, -1.508053, 2.672547, 1, 0, 0.6470588, 1,
1.375691, 0.3297082, 2.551028, 1, 0, 0.6431373, 1,
1.378224, -0.1645889, -0.3447298, 1, 0, 0.6352941, 1,
1.382512, -0.5681049, 1.677143, 1, 0, 0.6313726, 1,
1.383143, -1.407204, 1.115642, 1, 0, 0.6235294, 1,
1.38317, -2.002023, 2.475539, 1, 0, 0.6196079, 1,
1.384129, 0.9586793, 2.881706, 1, 0, 0.6117647, 1,
1.389994, 0.7202847, 1.061774, 1, 0, 0.6078432, 1,
1.390979, -0.2849128, 3.097646, 1, 0, 0.6, 1,
1.394404, 1.312001, 1.839163, 1, 0, 0.5921569, 1,
1.396599, -1.275678, 2.800455, 1, 0, 0.5882353, 1,
1.400726, -0.3362797, 2.523247, 1, 0, 0.5803922, 1,
1.407934, 0.4589826, -0.006808229, 1, 0, 0.5764706, 1,
1.408322, -0.4684511, 2.134978, 1, 0, 0.5686275, 1,
1.424315, 1.747729, 0.9021369, 1, 0, 0.5647059, 1,
1.429029, -0.8178166, 2.249647, 1, 0, 0.5568628, 1,
1.440779, -0.7573414, 1.068892, 1, 0, 0.5529412, 1,
1.442594, -0.24836, 2.924866, 1, 0, 0.5450981, 1,
1.453373, -0.4780552, 3.119264, 1, 0, 0.5411765, 1,
1.456521, 0.03771849, 3.751179, 1, 0, 0.5333334, 1,
1.46467, -0.2283646, 2.420225, 1, 0, 0.5294118, 1,
1.469849, 1.25438, 1.342332, 1, 0, 0.5215687, 1,
1.491279, 0.9694749, 1.989953, 1, 0, 0.5176471, 1,
1.498104, -0.4056788, 1.221259, 1, 0, 0.509804, 1,
1.501713, -1.273892, 3.482666, 1, 0, 0.5058824, 1,
1.502045, 0.6831452, -0.1460438, 1, 0, 0.4980392, 1,
1.519576, 0.5038831, 2.171311, 1, 0, 0.4901961, 1,
1.521933, -1.110257, 3.228419, 1, 0, 0.4862745, 1,
1.523205, 0.334347, 1.669579, 1, 0, 0.4784314, 1,
1.53419, 1.065078, 0.8790635, 1, 0, 0.4745098, 1,
1.541514, -0.8742477, 4.252131, 1, 0, 0.4666667, 1,
1.546647, 0.4209586, 1.197607, 1, 0, 0.4627451, 1,
1.547295, 0.9025558, 0.9892195, 1, 0, 0.454902, 1,
1.548103, 0.2273405, 2.001721, 1, 0, 0.4509804, 1,
1.551579, -0.9358905, 2.696461, 1, 0, 0.4431373, 1,
1.556459, 0.4342244, 0.8641372, 1, 0, 0.4392157, 1,
1.582011, 0.2517585, -0.6648852, 1, 0, 0.4313726, 1,
1.585396, -0.6644346, 2.381374, 1, 0, 0.427451, 1,
1.585423, -1.797278, 2.329245, 1, 0, 0.4196078, 1,
1.596666, -0.2228875, 2.236558, 1, 0, 0.4156863, 1,
1.605471, 0.1626998, 2.668443, 1, 0, 0.4078431, 1,
1.631373, 0.5947815, 2.055808, 1, 0, 0.4039216, 1,
1.639089, 1.725032, 1.789157, 1, 0, 0.3960784, 1,
1.653403, 0.9058551, -0.6289181, 1, 0, 0.3882353, 1,
1.65578, -0.5524696, 1.381238, 1, 0, 0.3843137, 1,
1.656312, 0.4672741, 1.891843, 1, 0, 0.3764706, 1,
1.656912, -1.780273, 2.324108, 1, 0, 0.372549, 1,
1.659258, -0.1290988, 1.779499, 1, 0, 0.3647059, 1,
1.677913, 0.8083213, 1.381558, 1, 0, 0.3607843, 1,
1.70564, 0.8676822, 1.42045, 1, 0, 0.3529412, 1,
1.717136, -0.9444109, 2.229673, 1, 0, 0.3490196, 1,
1.73149, 0.1254356, 2.212959, 1, 0, 0.3411765, 1,
1.732391, 0.6000629, 1.384392, 1, 0, 0.3372549, 1,
1.737875, 0.4871944, 0.8491799, 1, 0, 0.3294118, 1,
1.742638, 1.516375, -0.7677731, 1, 0, 0.3254902, 1,
1.752243, 1.327666, 0.268707, 1, 0, 0.3176471, 1,
1.766827, -0.9837463, 2.235551, 1, 0, 0.3137255, 1,
1.769294, -1.333731, 3.431466, 1, 0, 0.3058824, 1,
1.798909, -1.652126, 1.004404, 1, 0, 0.2980392, 1,
1.805553, 0.001754994, 1.286748, 1, 0, 0.2941177, 1,
1.80919, 1.589757, 0.2026268, 1, 0, 0.2862745, 1,
1.814676, 2.828332, -1.983637, 1, 0, 0.282353, 1,
1.819655, 0.1874176, 1.21387, 1, 0, 0.2745098, 1,
1.832295, -0.2466771, 2.581378, 1, 0, 0.2705882, 1,
1.886354, -0.2125739, 3.032824, 1, 0, 0.2627451, 1,
1.894481, 0.2036303, -0.00766377, 1, 0, 0.2588235, 1,
1.8948, 0.2539846, 1.774401, 1, 0, 0.2509804, 1,
1.912954, -2.450433, 2.035939, 1, 0, 0.2470588, 1,
1.925903, 0.9025738, -1.120111, 1, 0, 0.2392157, 1,
1.931435, 0.3088935, 1.289972, 1, 0, 0.2352941, 1,
1.93855, -0.1308624, 0.2369937, 1, 0, 0.227451, 1,
1.939572, -0.8184467, 2.299069, 1, 0, 0.2235294, 1,
1.950181, -0.4575405, 2.802876, 1, 0, 0.2156863, 1,
1.952898, -0.04463667, 2.372777, 1, 0, 0.2117647, 1,
1.958616, -1.468773, 1.049908, 1, 0, 0.2039216, 1,
1.967014, -0.06670117, 2.062376, 1, 0, 0.1960784, 1,
1.973441, -0.85761, 2.026493, 1, 0, 0.1921569, 1,
1.973767, -0.4437525, 1.586288, 1, 0, 0.1843137, 1,
1.97422, 1.080469, 0.9312322, 1, 0, 0.1803922, 1,
1.977087, -0.7746298, 2.383072, 1, 0, 0.172549, 1,
1.988633, -0.7513345, 1.285813, 1, 0, 0.1686275, 1,
2.016483, 0.05764611, -0.4654396, 1, 0, 0.1607843, 1,
2.025639, -0.1223097, 3.257781, 1, 0, 0.1568628, 1,
2.037963, 0.6115528, 0.8627868, 1, 0, 0.1490196, 1,
2.050758, -0.8725273, 1.871485, 1, 0, 0.145098, 1,
2.055189, -1.085571, 1.513942, 1, 0, 0.1372549, 1,
2.079098, 0.1615406, 1.879218, 1, 0, 0.1333333, 1,
2.089845, -1.694811, 2.144299, 1, 0, 0.1254902, 1,
2.132088, 0.7842956, 1.14215, 1, 0, 0.1215686, 1,
2.137466, -0.5882252, 2.795942, 1, 0, 0.1137255, 1,
2.21038, 0.3411379, 2.613687, 1, 0, 0.1098039, 1,
2.236965, 0.9480131, 1.338336, 1, 0, 0.1019608, 1,
2.240435, 1.261951, 1.935831, 1, 0, 0.09411765, 1,
2.259265, -0.3809924, 3.991142, 1, 0, 0.09019608, 1,
2.274427, 0.2106571, 0.8682637, 1, 0, 0.08235294, 1,
2.286982, 1.41842, 1.335852, 1, 0, 0.07843138, 1,
2.352813, 0.886031, 1.264985, 1, 0, 0.07058824, 1,
2.354328, -0.8305522, 2.707493, 1, 0, 0.06666667, 1,
2.452866, -0.1687703, 1.570388, 1, 0, 0.05882353, 1,
2.474648, -2.38099, 2.047465, 1, 0, 0.05490196, 1,
2.506756, -0.5646433, 0.578907, 1, 0, 0.04705882, 1,
2.51984, -1.745154, 4.217013, 1, 0, 0.04313726, 1,
2.629687, -0.4954282, 1.280563, 1, 0, 0.03529412, 1,
2.770182, -0.4009799, 2.433451, 1, 0, 0.03137255, 1,
2.862574, 1.069924, 2.421898, 1, 0, 0.02352941, 1,
3.066287, -0.6470146, 1.955533, 1, 0, 0.01960784, 1,
3.344222, -0.444847, 1.293424, 1, 0, 0.01176471, 1,
3.402251, -1.13459, 2.173563, 1, 0, 0.007843138, 1
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
-0.06046963, -4.170428, -6.950085, 0, -0.5, 0.5, 0.5,
-0.06046963, -4.170428, -6.950085, 1, -0.5, 0.5, 0.5,
-0.06046963, -4.170428, -6.950085, 1, 1.5, 0.5, 0.5,
-0.06046963, -4.170428, -6.950085, 0, 1.5, 0.5, 0.5
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
-4.697053, 0.02073097, -6.950085, 0, -0.5, 0.5, 0.5,
-4.697053, 0.02073097, -6.950085, 1, -0.5, 0.5, 0.5,
-4.697053, 0.02073097, -6.950085, 1, 1.5, 0.5, 0.5,
-4.697053, 0.02073097, -6.950085, 0, 1.5, 0.5, 0.5
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
-4.697053, -4.170428, 0.3323467, 0, -0.5, 0.5, 0.5,
-4.697053, -4.170428, 0.3323467, 1, -0.5, 0.5, 0.5,
-4.697053, -4.170428, 0.3323467, 1, 1.5, 0.5, 0.5,
-4.697053, -4.170428, 0.3323467, 0, 1.5, 0.5, 0.5
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
-3, -3.203238, -5.269524,
3, -3.203238, -5.269524,
-3, -3.203238, -5.269524,
-3, -3.364436, -5.549617,
-2, -3.203238, -5.269524,
-2, -3.364436, -5.549617,
-1, -3.203238, -5.269524,
-1, -3.364436, -5.549617,
0, -3.203238, -5.269524,
0, -3.364436, -5.549617,
1, -3.203238, -5.269524,
1, -3.364436, -5.549617,
2, -3.203238, -5.269524,
2, -3.364436, -5.549617,
3, -3.203238, -5.269524,
3, -3.364436, -5.549617
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
-3, -3.686833, -6.109804, 0, -0.5, 0.5, 0.5,
-3, -3.686833, -6.109804, 1, -0.5, 0.5, 0.5,
-3, -3.686833, -6.109804, 1, 1.5, 0.5, 0.5,
-3, -3.686833, -6.109804, 0, 1.5, 0.5, 0.5,
-2, -3.686833, -6.109804, 0, -0.5, 0.5, 0.5,
-2, -3.686833, -6.109804, 1, -0.5, 0.5, 0.5,
-2, -3.686833, -6.109804, 1, 1.5, 0.5, 0.5,
-2, -3.686833, -6.109804, 0, 1.5, 0.5, 0.5,
-1, -3.686833, -6.109804, 0, -0.5, 0.5, 0.5,
-1, -3.686833, -6.109804, 1, -0.5, 0.5, 0.5,
-1, -3.686833, -6.109804, 1, 1.5, 0.5, 0.5,
-1, -3.686833, -6.109804, 0, 1.5, 0.5, 0.5,
0, -3.686833, -6.109804, 0, -0.5, 0.5, 0.5,
0, -3.686833, -6.109804, 1, -0.5, 0.5, 0.5,
0, -3.686833, -6.109804, 1, 1.5, 0.5, 0.5,
0, -3.686833, -6.109804, 0, 1.5, 0.5, 0.5,
1, -3.686833, -6.109804, 0, -0.5, 0.5, 0.5,
1, -3.686833, -6.109804, 1, -0.5, 0.5, 0.5,
1, -3.686833, -6.109804, 1, 1.5, 0.5, 0.5,
1, -3.686833, -6.109804, 0, 1.5, 0.5, 0.5,
2, -3.686833, -6.109804, 0, -0.5, 0.5, 0.5,
2, -3.686833, -6.109804, 1, -0.5, 0.5, 0.5,
2, -3.686833, -6.109804, 1, 1.5, 0.5, 0.5,
2, -3.686833, -6.109804, 0, 1.5, 0.5, 0.5,
3, -3.686833, -6.109804, 0, -0.5, 0.5, 0.5,
3, -3.686833, -6.109804, 1, -0.5, 0.5, 0.5,
3, -3.686833, -6.109804, 1, 1.5, 0.5, 0.5,
3, -3.686833, -6.109804, 0, 1.5, 0.5, 0.5
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
-3.627072, -3, -5.269524,
-3.627072, 3, -5.269524,
-3.627072, -3, -5.269524,
-3.805402, -3, -5.549617,
-3.627072, -2, -5.269524,
-3.805402, -2, -5.549617,
-3.627072, -1, -5.269524,
-3.805402, -1, -5.549617,
-3.627072, 0, -5.269524,
-3.805402, 0, -5.549617,
-3.627072, 1, -5.269524,
-3.805402, 1, -5.549617,
-3.627072, 2, -5.269524,
-3.805402, 2, -5.549617,
-3.627072, 3, -5.269524,
-3.805402, 3, -5.549617
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
-4.162063, -3, -6.109804, 0, -0.5, 0.5, 0.5,
-4.162063, -3, -6.109804, 1, -0.5, 0.5, 0.5,
-4.162063, -3, -6.109804, 1, 1.5, 0.5, 0.5,
-4.162063, -3, -6.109804, 0, 1.5, 0.5, 0.5,
-4.162063, -2, -6.109804, 0, -0.5, 0.5, 0.5,
-4.162063, -2, -6.109804, 1, -0.5, 0.5, 0.5,
-4.162063, -2, -6.109804, 1, 1.5, 0.5, 0.5,
-4.162063, -2, -6.109804, 0, 1.5, 0.5, 0.5,
-4.162063, -1, -6.109804, 0, -0.5, 0.5, 0.5,
-4.162063, -1, -6.109804, 1, -0.5, 0.5, 0.5,
-4.162063, -1, -6.109804, 1, 1.5, 0.5, 0.5,
-4.162063, -1, -6.109804, 0, 1.5, 0.5, 0.5,
-4.162063, 0, -6.109804, 0, -0.5, 0.5, 0.5,
-4.162063, 0, -6.109804, 1, -0.5, 0.5, 0.5,
-4.162063, 0, -6.109804, 1, 1.5, 0.5, 0.5,
-4.162063, 0, -6.109804, 0, 1.5, 0.5, 0.5,
-4.162063, 1, -6.109804, 0, -0.5, 0.5, 0.5,
-4.162063, 1, -6.109804, 1, -0.5, 0.5, 0.5,
-4.162063, 1, -6.109804, 1, 1.5, 0.5, 0.5,
-4.162063, 1, -6.109804, 0, 1.5, 0.5, 0.5,
-4.162063, 2, -6.109804, 0, -0.5, 0.5, 0.5,
-4.162063, 2, -6.109804, 1, -0.5, 0.5, 0.5,
-4.162063, 2, -6.109804, 1, 1.5, 0.5, 0.5,
-4.162063, 2, -6.109804, 0, 1.5, 0.5, 0.5,
-4.162063, 3, -6.109804, 0, -0.5, 0.5, 0.5,
-4.162063, 3, -6.109804, 1, -0.5, 0.5, 0.5,
-4.162063, 3, -6.109804, 1, 1.5, 0.5, 0.5,
-4.162063, 3, -6.109804, 0, 1.5, 0.5, 0.5
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
-3.627072, -3.203238, -4,
-3.627072, -3.203238, 4,
-3.627072, -3.203238, -4,
-3.805402, -3.364436, -4,
-3.627072, -3.203238, -2,
-3.805402, -3.364436, -2,
-3.627072, -3.203238, 0,
-3.805402, -3.364436, 0,
-3.627072, -3.203238, 2,
-3.805402, -3.364436, 2,
-3.627072, -3.203238, 4,
-3.805402, -3.364436, 4
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
-4.162063, -3.686833, -4, 0, -0.5, 0.5, 0.5,
-4.162063, -3.686833, -4, 1, -0.5, 0.5, 0.5,
-4.162063, -3.686833, -4, 1, 1.5, 0.5, 0.5,
-4.162063, -3.686833, -4, 0, 1.5, 0.5, 0.5,
-4.162063, -3.686833, -2, 0, -0.5, 0.5, 0.5,
-4.162063, -3.686833, -2, 1, -0.5, 0.5, 0.5,
-4.162063, -3.686833, -2, 1, 1.5, 0.5, 0.5,
-4.162063, -3.686833, -2, 0, 1.5, 0.5, 0.5,
-4.162063, -3.686833, 0, 0, -0.5, 0.5, 0.5,
-4.162063, -3.686833, 0, 1, -0.5, 0.5, 0.5,
-4.162063, -3.686833, 0, 1, 1.5, 0.5, 0.5,
-4.162063, -3.686833, 0, 0, 1.5, 0.5, 0.5,
-4.162063, -3.686833, 2, 0, -0.5, 0.5, 0.5,
-4.162063, -3.686833, 2, 1, -0.5, 0.5, 0.5,
-4.162063, -3.686833, 2, 1, 1.5, 0.5, 0.5,
-4.162063, -3.686833, 2, 0, 1.5, 0.5, 0.5,
-4.162063, -3.686833, 4, 0, -0.5, 0.5, 0.5,
-4.162063, -3.686833, 4, 1, -0.5, 0.5, 0.5,
-4.162063, -3.686833, 4, 1, 1.5, 0.5, 0.5,
-4.162063, -3.686833, 4, 0, 1.5, 0.5, 0.5
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
-3.627072, -3.203238, -5.269524,
-3.627072, 3.2447, -5.269524,
-3.627072, -3.203238, 5.934217,
-3.627072, 3.2447, 5.934217,
-3.627072, -3.203238, -5.269524,
-3.627072, -3.203238, 5.934217,
-3.627072, 3.2447, -5.269524,
-3.627072, 3.2447, 5.934217,
-3.627072, -3.203238, -5.269524,
3.506133, -3.203238, -5.269524,
-3.627072, -3.203238, 5.934217,
3.506133, -3.203238, 5.934217,
-3.627072, 3.2447, -5.269524,
3.506133, 3.2447, -5.269524,
-3.627072, 3.2447, 5.934217,
3.506133, 3.2447, 5.934217,
3.506133, -3.203238, -5.269524,
3.506133, 3.2447, -5.269524,
3.506133, -3.203238, 5.934217,
3.506133, 3.2447, 5.934217,
3.506133, -3.203238, -5.269524,
3.506133, -3.203238, 5.934217,
3.506133, 3.2447, -5.269524,
3.506133, 3.2447, 5.934217
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
var radius = 7.883809;
var distance = 35.07596;
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
mvMatrix.translate( 0.06046963, -0.02073097, -0.3323467 );
mvMatrix.scale( 1.194993, 1.321993, 0.7608288 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.07596);
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
prometon<-read.table("prometon.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-prometon$V2
```

```
## Error in eval(expr, envir, enclos): object 'prometon' not found
```

```r
y<-prometon$V3
```

```
## Error in eval(expr, envir, enclos): object 'prometon' not found
```

```r
z<-prometon$V4
```

```
## Error in eval(expr, envir, enclos): object 'prometon' not found
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
-3.52319, 1.304324, -2.233989, 0, 0, 1, 1, 1,
-2.767959, -0.6776223, 0.304209, 1, 0, 0, 1, 1,
-2.752455, -0.3817923, -3.252103, 1, 0, 0, 1, 1,
-2.625752, 0.2493848, -1.598269, 1, 0, 0, 1, 1,
-2.45895, 0.1521078, -3.403753, 1, 0, 0, 1, 1,
-2.325373, 1.554224, -1.312419, 1, 0, 0, 1, 1,
-2.307774, -0.03155489, -2.072134, 0, 0, 0, 1, 1,
-2.266475, -1.599217, -1.519907, 0, 0, 0, 1, 1,
-2.261377, 0.09627735, -1.86613, 0, 0, 0, 1, 1,
-2.25727, -0.07743162, -1.349031, 0, 0, 0, 1, 1,
-2.200629, 0.4905201, -1.076086, 0, 0, 0, 1, 1,
-2.166804, 1.950379, -0.294085, 0, 0, 0, 1, 1,
-2.161086, -0.07810569, -1.302586, 0, 0, 0, 1, 1,
-2.152416, -0.08275282, -1.850727, 1, 1, 1, 1, 1,
-2.106936, -1.190021, -1.076177, 1, 1, 1, 1, 1,
-2.086323, 0.1070978, 0.6086503, 1, 1, 1, 1, 1,
-2.08604, 1.801262, -0.6369717, 1, 1, 1, 1, 1,
-2.016114, -0.2574825, -1.430372, 1, 1, 1, 1, 1,
-2.000278, -0.6131246, -2.69725, 1, 1, 1, 1, 1,
-1.980544, 0.3986305, -0.8506288, 1, 1, 1, 1, 1,
-1.973213, 0.668433, 0.3817987, 1, 1, 1, 1, 1,
-1.958196, -1.844043, -2.689961, 1, 1, 1, 1, 1,
-1.91631, -1.080229, 0.9243215, 1, 1, 1, 1, 1,
-1.913265, -0.4062031, -0.7908649, 1, 1, 1, 1, 1,
-1.907123, 0.6666948, -1.989559, 1, 1, 1, 1, 1,
-1.841047, 1.417983, -0.6117119, 1, 1, 1, 1, 1,
-1.814493, -0.6938871, -0.1820277, 1, 1, 1, 1, 1,
-1.792362, 2.387903, -0.7184462, 1, 1, 1, 1, 1,
-1.785898, 0.9373026, -1.480541, 0, 0, 1, 1, 1,
-1.780287, 1.009188, -0.5627804, 1, 0, 0, 1, 1,
-1.737195, -0.02531475, -1.805092, 1, 0, 0, 1, 1,
-1.722179, -0.9647822, -2.907541, 1, 0, 0, 1, 1,
-1.681747, 0.942306, -1.52639, 1, 0, 0, 1, 1,
-1.679725, -1.143471, -1.28453, 1, 0, 0, 1, 1,
-1.641454, 0.09917374, -1.089764, 0, 0, 0, 1, 1,
-1.63882, -1.16892, -1.556888, 0, 0, 0, 1, 1,
-1.637983, 0.7596682, 0.07438314, 0, 0, 0, 1, 1,
-1.615612, 1.315511, 0.3428091, 0, 0, 0, 1, 1,
-1.610747, 0.1553214, -0.1500253, 0, 0, 0, 1, 1,
-1.610595, 0.0661464, -0.1526902, 0, 0, 0, 1, 1,
-1.608433, -0.08157484, -1.384555, 0, 0, 0, 1, 1,
-1.596133, 0.3319336, -3.028118, 1, 1, 1, 1, 1,
-1.587326, -1.877881, -0.756065, 1, 1, 1, 1, 1,
-1.58011, 1.00884, -0.5656204, 1, 1, 1, 1, 1,
-1.575683, -0.09249696, -2.432967, 1, 1, 1, 1, 1,
-1.574467, -1.115374, -3.911476, 1, 1, 1, 1, 1,
-1.553804, 1.964166, -0.7529924, 1, 1, 1, 1, 1,
-1.55246, -0.08679125, 0.1461436, 1, 1, 1, 1, 1,
-1.548975, 2.03032, -1.719989, 1, 1, 1, 1, 1,
-1.546822, -0.8153725, -1.139393, 1, 1, 1, 1, 1,
-1.533467, 0.3519529, -0.9962249, 1, 1, 1, 1, 1,
-1.522557, 0.2298017, -1.643006, 1, 1, 1, 1, 1,
-1.511619, 0.3247824, -1.739005, 1, 1, 1, 1, 1,
-1.51022, 0.3339248, 0.06627151, 1, 1, 1, 1, 1,
-1.508442, 1.375875, -0.9884543, 1, 1, 1, 1, 1,
-1.50702, -0.5535493, -2.566793, 1, 1, 1, 1, 1,
-1.495926, -0.8269193, -2.359693, 0, 0, 1, 1, 1,
-1.493608, 2.100782, -0.9313952, 1, 0, 0, 1, 1,
-1.473922, 0.7459304, -0.9051007, 1, 0, 0, 1, 1,
-1.453638, -1.087194, -1.94942, 1, 0, 0, 1, 1,
-1.443757, -0.3066478, -1.507935, 1, 0, 0, 1, 1,
-1.442756, 1.632864, -1.449401, 1, 0, 0, 1, 1,
-1.442492, 2.011287, -1.409, 0, 0, 0, 1, 1,
-1.434811, -1.223995, -1.564772, 0, 0, 0, 1, 1,
-1.427948, 0.6829278, -0.5884362, 0, 0, 0, 1, 1,
-1.427022, 0.189419, -1.130466, 0, 0, 0, 1, 1,
-1.425954, 0.237836, -0.2430644, 0, 0, 0, 1, 1,
-1.422552, -2.634427, -3.252653, 0, 0, 0, 1, 1,
-1.414492, -1.27346, -3.926895, 0, 0, 0, 1, 1,
-1.411724, -0.5317106, -1.26053, 1, 1, 1, 1, 1,
-1.409866, -0.6287047, -2.892157, 1, 1, 1, 1, 1,
-1.40812, 0.9947283, -0.9817753, 1, 1, 1, 1, 1,
-1.405868, 0.5454225, -3.575673, 1, 1, 1, 1, 1,
-1.405273, 1.10699, -1.624179, 1, 1, 1, 1, 1,
-1.402257, -0.1905612, -2.326513, 1, 1, 1, 1, 1,
-1.401254, -1.127826, -1.376736, 1, 1, 1, 1, 1,
-1.395925, -0.2318069, -2.150927, 1, 1, 1, 1, 1,
-1.392035, -0.9098845, -1.204219, 1, 1, 1, 1, 1,
-1.383178, -0.1133176, -3.903696, 1, 1, 1, 1, 1,
-1.374163, -0.2304282, -2.449358, 1, 1, 1, 1, 1,
-1.37007, 0.8929143, -0.2516303, 1, 1, 1, 1, 1,
-1.353997, -2.437654, -2.704161, 1, 1, 1, 1, 1,
-1.353644, 1.035372, -1.071818, 1, 1, 1, 1, 1,
-1.351416, -0.4031595, -0.6091437, 1, 1, 1, 1, 1,
-1.350423, -0.1526349, -1.750271, 0, 0, 1, 1, 1,
-1.346783, -1.026603, -2.661165, 1, 0, 0, 1, 1,
-1.337459, 0.4165193, -2.687512, 1, 0, 0, 1, 1,
-1.331602, -1.224304, -1.812662, 1, 0, 0, 1, 1,
-1.330907, -0.2807005, -3.231376, 1, 0, 0, 1, 1,
-1.328656, 0.8855914, -1.24999, 1, 0, 0, 1, 1,
-1.328598, 0.06950541, -0.1897513, 0, 0, 0, 1, 1,
-1.327681, -0.5459836, -1.824164, 0, 0, 0, 1, 1,
-1.310616, 0.06996287, -0.5418286, 0, 0, 0, 1, 1,
-1.30886, 0.7342021, -0.8412117, 0, 0, 0, 1, 1,
-1.300272, -2.551435, -1.332621, 0, 0, 0, 1, 1,
-1.299566, -0.9413047, -4.256342, 0, 0, 0, 1, 1,
-1.279198, 1.884269, -0.6255294, 0, 0, 0, 1, 1,
-1.274817, -0.3286322, -1.882071, 1, 1, 1, 1, 1,
-1.270977, 0.04336341, -1.393188, 1, 1, 1, 1, 1,
-1.268707, 1.256871, -1.941147, 1, 1, 1, 1, 1,
-1.248033, 0.646616, -2.140619, 1, 1, 1, 1, 1,
-1.24762, 1.024286, -0.7043677, 1, 1, 1, 1, 1,
-1.239361, 1.065476, -1.114272, 1, 1, 1, 1, 1,
-1.239143, -0.6473309, -1.095793, 1, 1, 1, 1, 1,
-1.2379, -0.7766621, -0.9915822, 1, 1, 1, 1, 1,
-1.23649, 0.723704, -0.1942134, 1, 1, 1, 1, 1,
-1.229043, 0.6562856, -1.799943, 1, 1, 1, 1, 1,
-1.223657, -0.1699933, -0.7865501, 1, 1, 1, 1, 1,
-1.220504, 0.8253803, -1.706087, 1, 1, 1, 1, 1,
-1.218015, -2.189556, -2.259367, 1, 1, 1, 1, 1,
-1.215391, -1.13113, -2.743879, 1, 1, 1, 1, 1,
-1.21093, 0.2746609, -1.895736, 1, 1, 1, 1, 1,
-1.199545, 0.1888552, -2.184668, 0, 0, 1, 1, 1,
-1.199528, -0.6927241, -2.31566, 1, 0, 0, 1, 1,
-1.198959, 0.2745548, -1.643064, 1, 0, 0, 1, 1,
-1.194842, 0.3958319, -2.349071, 1, 0, 0, 1, 1,
-1.189841, 0.8928772, -1.177085, 1, 0, 0, 1, 1,
-1.189711, -1.325284, -1.655625, 1, 0, 0, 1, 1,
-1.188694, -0.5424013, -1.587649, 0, 0, 0, 1, 1,
-1.173845, -0.5419857, -2.730577, 0, 0, 0, 1, 1,
-1.169385, -2.042097, -3.453953, 0, 0, 0, 1, 1,
-1.159864, 1.138988, -1.436633, 0, 0, 0, 1, 1,
-1.156187, -1.258463, -2.874484, 0, 0, 0, 1, 1,
-1.155302, -1.426577, -2.413375, 0, 0, 0, 1, 1,
-1.151827, 1.627385, -1.143985, 0, 0, 0, 1, 1,
-1.139759, 0.01643011, 0.6294225, 1, 1, 1, 1, 1,
-1.135304, -1.273506, -1.784688, 1, 1, 1, 1, 1,
-1.130785, 0.3999192, 0.2952203, 1, 1, 1, 1, 1,
-1.124097, 0.1671702, -0.9763238, 1, 1, 1, 1, 1,
-1.11971, -2.004604, -3.244197, 1, 1, 1, 1, 1,
-1.111769, 0.4238307, -0.3505693, 1, 1, 1, 1, 1,
-1.111078, 0.6777146, -2.684791, 1, 1, 1, 1, 1,
-1.110781, 0.0570901, -0.785912, 1, 1, 1, 1, 1,
-1.103365, 0.9708597, -0.05695968, 1, 1, 1, 1, 1,
-1.100578, -2.288819, 0.0113849, 1, 1, 1, 1, 1,
-1.097927, -0.04313162, -2.797768, 1, 1, 1, 1, 1,
-1.096474, -0.3384413, -2.157423, 1, 1, 1, 1, 1,
-1.094506, -0.8885071, -2.676224, 1, 1, 1, 1, 1,
-1.082588, -0.9002676, -2.055794, 1, 1, 1, 1, 1,
-1.079748, -0.3951177, -0.8138598, 1, 1, 1, 1, 1,
-1.078563, -0.2851864, -1.219128, 0, 0, 1, 1, 1,
-1.052401, -0.9879385, 0.01358812, 1, 0, 0, 1, 1,
-1.052137, 2.121214, 1.009876, 1, 0, 0, 1, 1,
-1.051019, 0.4800389, -0.8854518, 1, 0, 0, 1, 1,
-1.049039, -1.469814, -1.460464, 1, 0, 0, 1, 1,
-1.042688, 0.1102955, -0.3744121, 1, 0, 0, 1, 1,
-1.04111, -1.734302, -1.291156, 0, 0, 0, 1, 1,
-1.03628, -0.1453552, -2.869392, 0, 0, 0, 1, 1,
-1.031348, 1.162037, -0.5699776, 0, 0, 0, 1, 1,
-1.03065, 1.119463, -0.940672, 0, 0, 0, 1, 1,
-1.028908, -0.3258421, -0.5002388, 0, 0, 0, 1, 1,
-1.009665, 0.5426471, -1.720953, 0, 0, 0, 1, 1,
-1.00721, -0.05500375, -3.710984, 0, 0, 0, 1, 1,
-1.005609, -1.043698, -2.948779, 1, 1, 1, 1, 1,
-1.000191, 0.9591593, -1.804812, 1, 1, 1, 1, 1,
-0.9945633, 0.9081135, -2.243228, 1, 1, 1, 1, 1,
-0.9870775, 1.314725, 0.6420548, 1, 1, 1, 1, 1,
-0.985643, -0.285531, -2.7671, 1, 1, 1, 1, 1,
-0.9823799, 0.3178981, -2.969104, 1, 1, 1, 1, 1,
-0.9718897, 0.5671468, -1.242693, 1, 1, 1, 1, 1,
-0.9713014, 0.7487446, -1.180717, 1, 1, 1, 1, 1,
-0.9682443, -0.9550193, -3.188134, 1, 1, 1, 1, 1,
-0.963751, 1.401348, -1.899736, 1, 1, 1, 1, 1,
-0.9569697, -0.4463494, -2.184498, 1, 1, 1, 1, 1,
-0.9549888, -0.5348299, -0.6050271, 1, 1, 1, 1, 1,
-0.9545257, -1.008038, -3.065012, 1, 1, 1, 1, 1,
-0.9385334, 0.2345313, -2.089125, 1, 1, 1, 1, 1,
-0.9373922, 0.9290631, -1.387943, 1, 1, 1, 1, 1,
-0.9369813, 0.5852756, -1.830196, 0, 0, 1, 1, 1,
-0.9362967, -1.168366, -0.5792094, 1, 0, 0, 1, 1,
-0.9348583, -1.229873, -2.479573, 1, 0, 0, 1, 1,
-0.9255575, 1.24182, -1.898273, 1, 0, 0, 1, 1,
-0.9020642, 1.099781, -1.083719, 1, 0, 0, 1, 1,
-0.9015162, -0.9920375, -4.292798, 1, 0, 0, 1, 1,
-0.8978927, 2.407851, -0.6633992, 0, 0, 0, 1, 1,
-0.8879333, 0.4844831, -0.7270156, 0, 0, 0, 1, 1,
-0.8862587, -0.1240338, -0.3464745, 0, 0, 0, 1, 1,
-0.8762025, 0.8830054, -1.473199, 0, 0, 0, 1, 1,
-0.8611487, -1.581525, -2.577755, 0, 0, 0, 1, 1,
-0.8549011, 1.009752, 0.4091654, 0, 0, 0, 1, 1,
-0.8447571, -1.136353, -2.460414, 0, 0, 0, 1, 1,
-0.8433574, -2.388698, -3.750952, 1, 1, 1, 1, 1,
-0.83209, 0.4085137, -0.9891031, 1, 1, 1, 1, 1,
-0.8298093, 1.598559, -1.03253, 1, 1, 1, 1, 1,
-0.8195466, 1.134507, -1.239545, 1, 1, 1, 1, 1,
-0.8143657, 0.3283981, -1.319001, 1, 1, 1, 1, 1,
-0.8128276, -1.037824, -2.895565, 1, 1, 1, 1, 1,
-0.809731, 1.144665, -0.07922567, 1, 1, 1, 1, 1,
-0.8004285, -0.830746, -2.509119, 1, 1, 1, 1, 1,
-0.7932937, -0.8680878, -2.659467, 1, 1, 1, 1, 1,
-0.7893203, 0.5324004, -2.342091, 1, 1, 1, 1, 1,
-0.7839986, 1.452499, 0.3933128, 1, 1, 1, 1, 1,
-0.7733539, 1.156285, -2.207455, 1, 1, 1, 1, 1,
-0.7727103, -1.640201, -1.786752, 1, 1, 1, 1, 1,
-0.7681348, 1.169632, -0.6304187, 1, 1, 1, 1, 1,
-0.7665937, -0.7256169, -1.218753, 1, 1, 1, 1, 1,
-0.7649668, 0.3976714, -0.4873067, 0, 0, 1, 1, 1,
-0.758276, -1.038945, -3.182728, 1, 0, 0, 1, 1,
-0.7582601, -0.1571731, -4.269969, 1, 0, 0, 1, 1,
-0.7579549, -0.8716831, -1.88062, 1, 0, 0, 1, 1,
-0.7578548, 0.9444206, -0.8680897, 1, 0, 0, 1, 1,
-0.7576454, -1.358802, -1.017328, 1, 0, 0, 1, 1,
-0.757592, -0.2046321, -1.550151, 0, 0, 0, 1, 1,
-0.7565641, -0.273389, -0.8949311, 0, 0, 0, 1, 1,
-0.7530484, 0.9799935, 0.7293376, 0, 0, 0, 1, 1,
-0.7387849, 0.3971038, 0.1235096, 0, 0, 0, 1, 1,
-0.7382133, 0.4082681, -0.9946456, 0, 0, 0, 1, 1,
-0.7377534, 1.573932, -0.08777684, 0, 0, 0, 1, 1,
-0.7347854, -0.195174, -1.04037, 0, 0, 0, 1, 1,
-0.7306207, -1.221041, -4.87291, 1, 1, 1, 1, 1,
-0.7258098, 1.166914, -1.419481, 1, 1, 1, 1, 1,
-0.7247685, 0.6040448, -0.5796415, 1, 1, 1, 1, 1,
-0.7212324, 0.9417741, 0.2389157, 1, 1, 1, 1, 1,
-0.718951, 0.05861983, -2.077343, 1, 1, 1, 1, 1,
-0.7175834, -0.4021289, -2.551996, 1, 1, 1, 1, 1,
-0.7157651, 0.9350719, 0.3464522, 1, 1, 1, 1, 1,
-0.7135208, -1.50048, -3.623423, 1, 1, 1, 1, 1,
-0.7118406, 1.305856, -0.2170616, 1, 1, 1, 1, 1,
-0.7080791, 0.6763834, 0.02213027, 1, 1, 1, 1, 1,
-0.7037275, 0.9459165, -1.678389, 1, 1, 1, 1, 1,
-0.7008373, 0.3862547, -3.554294, 1, 1, 1, 1, 1,
-0.7000717, -0.5219022, -2.122865, 1, 1, 1, 1, 1,
-0.6994969, 1.423048, -0.7594827, 1, 1, 1, 1, 1,
-0.6953141, 2.103417, 0.7520785, 1, 1, 1, 1, 1,
-0.6948907, 1.040329, -1.430787, 0, 0, 1, 1, 1,
-0.6939363, -0.8461056, -1.967189, 1, 0, 0, 1, 1,
-0.6871381, -2.282781, -4.375975, 1, 0, 0, 1, 1,
-0.6833273, -1.105172, -2.567918, 1, 0, 0, 1, 1,
-0.681059, -0.4638807, -3.111937, 1, 0, 0, 1, 1,
-0.6804295, 1.215554, -1.011371, 1, 0, 0, 1, 1,
-0.6697776, 0.1047404, 0.02644264, 0, 0, 0, 1, 1,
-0.6695905, -1.063126, -1.690078, 0, 0, 0, 1, 1,
-0.6669406, 0.4852363, -1.890222, 0, 0, 0, 1, 1,
-0.6658484, 1.035333, -2.01859, 0, 0, 0, 1, 1,
-0.6635271, -0.3859641, -3.91765, 0, 0, 0, 1, 1,
-0.6635085, 0.5863905, 0.02861507, 0, 0, 0, 1, 1,
-0.6628314, -0.5817816, -2.014985, 0, 0, 0, 1, 1,
-0.653931, -0.08780384, -2.088255, 1, 1, 1, 1, 1,
-0.6495546, 1.124321, -0.4187321, 1, 1, 1, 1, 1,
-0.6458206, -0.3992611, -2.103338, 1, 1, 1, 1, 1,
-0.6411284, -0.9219136, -3.471132, 1, 1, 1, 1, 1,
-0.6387877, 1.651803, -0.0738657, 1, 1, 1, 1, 1,
-0.6366072, -0.5165195, -2.702978, 1, 1, 1, 1, 1,
-0.6330847, 1.137929, 0.5808692, 1, 1, 1, 1, 1,
-0.6307201, 0.5098081, -1.884074, 1, 1, 1, 1, 1,
-0.6304973, -0.2003838, -0.121071, 1, 1, 1, 1, 1,
-0.6281199, -0.4088128, -1.930661, 1, 1, 1, 1, 1,
-0.627253, 1.090344, -0.2553561, 1, 1, 1, 1, 1,
-0.6262624, 1.443578, -0.9250674, 1, 1, 1, 1, 1,
-0.6155017, -0.550501, -2.531772, 1, 1, 1, 1, 1,
-0.6127031, 0.62034, -3.65905, 1, 1, 1, 1, 1,
-0.6083505, 0.4905458, -1.008198, 1, 1, 1, 1, 1,
-0.6081829, 0.1137749, -2.448742, 0, 0, 1, 1, 1,
-0.6053213, -2.138953, -1.925244, 1, 0, 0, 1, 1,
-0.6032038, 0.5679527, -1.568836, 1, 0, 0, 1, 1,
-0.5976918, 0.08335557, -0.5285213, 1, 0, 0, 1, 1,
-0.5926328, 0.4361521, 0.2290101, 1, 0, 0, 1, 1,
-0.5879512, 0.6748549, 0.4190938, 1, 0, 0, 1, 1,
-0.581442, 1.381519, -0.2513583, 0, 0, 0, 1, 1,
-0.5748062, 0.3198531, -1.729337, 0, 0, 0, 1, 1,
-0.5731485, -1.843838, -2.173244, 0, 0, 0, 1, 1,
-0.5700067, 0.3510257, -0.7965429, 0, 0, 0, 1, 1,
-0.5683281, -2.716045, -2.274613, 0, 0, 0, 1, 1,
-0.5673828, -0.9903766, -2.400366, 0, 0, 0, 1, 1,
-0.5654495, -1.160152, -1.260989, 0, 0, 0, 1, 1,
-0.5653508, -0.9137554, -2.261831, 1, 1, 1, 1, 1,
-0.5578781, 0.6223151, 0.01379896, 1, 1, 1, 1, 1,
-0.554337, -0.3544687, -3.397846, 1, 1, 1, 1, 1,
-0.5505232, -0.8722488, -3.348484, 1, 1, 1, 1, 1,
-0.5407666, 0.8914469, 0.7615715, 1, 1, 1, 1, 1,
-0.5407147, -0.6436453, -3.51056, 1, 1, 1, 1, 1,
-0.5404436, 0.1599246, -2.432153, 1, 1, 1, 1, 1,
-0.5394047, -1.153173, -3.492559, 1, 1, 1, 1, 1,
-0.53258, 0.9782971, -0.7045446, 1, 1, 1, 1, 1,
-0.5298991, 1.345191, 2.021212, 1, 1, 1, 1, 1,
-0.5276181, 1.510276, -0.01152975, 1, 1, 1, 1, 1,
-0.5252668, 0.2164776, -1.74469, 1, 1, 1, 1, 1,
-0.5248925, 0.6542534, -1.63564, 1, 1, 1, 1, 1,
-0.5205348, -0.4421688, -4.031388, 1, 1, 1, 1, 1,
-0.5189416, -0.5097808, -3.72772, 1, 1, 1, 1, 1,
-0.5188664, -0.9735801, -2.304991, 0, 0, 1, 1, 1,
-0.5171985, 0.7159492, 0.02901321, 1, 0, 0, 1, 1,
-0.5158154, -0.6754509, -2.529686, 1, 0, 0, 1, 1,
-0.5157422, -0.4658493, -1.638481, 1, 0, 0, 1, 1,
-0.5124694, 0.2174178, 1.194859, 1, 0, 0, 1, 1,
-0.5116057, 0.4996565, -1.396646, 1, 0, 0, 1, 1,
-0.5045394, -0.3971146, -3.902491, 0, 0, 0, 1, 1,
-0.5044978, 1.561884, -0.8301199, 0, 0, 0, 1, 1,
-0.5044022, 0.1343918, -2.571149, 0, 0, 0, 1, 1,
-0.5041048, 0.2080607, -0.3246309, 0, 0, 0, 1, 1,
-0.5035612, 0.5578414, -0.7422882, 0, 0, 0, 1, 1,
-0.499746, 0.7094429, -1.061219, 0, 0, 0, 1, 1,
-0.4997002, 0.4173303, -0.3597487, 0, 0, 0, 1, 1,
-0.4980099, 0.8652104, -0.9971108, 1, 1, 1, 1, 1,
-0.4974156, -0.5749661, -0.6426715, 1, 1, 1, 1, 1,
-0.4956122, 0.1705554, -1.731199, 1, 1, 1, 1, 1,
-0.495391, 1.436045, -1.446244, 1, 1, 1, 1, 1,
-0.4879389, 0.2146241, -2.244889, 1, 1, 1, 1, 1,
-0.4864004, -1.071047, -3.386303, 1, 1, 1, 1, 1,
-0.4846756, -1.228854, -1.204231, 1, 1, 1, 1, 1,
-0.4789833, -0.5582563, -2.831499, 1, 1, 1, 1, 1,
-0.478642, 0.3179252, -2.757235, 1, 1, 1, 1, 1,
-0.4768218, 0.6446214, 0.9083849, 1, 1, 1, 1, 1,
-0.4768096, -0.9537406, -1.240189, 1, 1, 1, 1, 1,
-0.4754089, -0.4742153, -2.077272, 1, 1, 1, 1, 1,
-0.4729863, -0.2994969, -2.622104, 1, 1, 1, 1, 1,
-0.4723537, 0.4529434, -1.083884, 1, 1, 1, 1, 1,
-0.4707108, -0.3444589, -4.516535, 1, 1, 1, 1, 1,
-0.4662063, -0.2436284, -1.739278, 0, 0, 1, 1, 1,
-0.4650423, -1.908902, -3.507424, 1, 0, 0, 1, 1,
-0.4635698, -1.046126, -2.480223, 1, 0, 0, 1, 1,
-0.4608646, -0.7960357, -2.818667, 1, 0, 0, 1, 1,
-0.4583978, -0.4920667, -2.547819, 1, 0, 0, 1, 1,
-0.4581159, -1.258853, -1.855506, 1, 0, 0, 1, 1,
-0.4501391, 1.428149, -0.04795867, 0, 0, 0, 1, 1,
-0.4487311, -0.8693434, -2.082834, 0, 0, 0, 1, 1,
-0.4437838, 0.0488508, -1.739681, 0, 0, 0, 1, 1,
-0.4413264, -0.5107878, -2.99335, 0, 0, 0, 1, 1,
-0.4394618, -0.6483036, -3.370567, 0, 0, 0, 1, 1,
-0.4386916, -1.092785, -4.503552, 0, 0, 0, 1, 1,
-0.4384366, 0.7854621, -1.481296, 0, 0, 0, 1, 1,
-0.4375638, -0.1365061, -2.448116, 1, 1, 1, 1, 1,
-0.4363879, -0.003402997, -1.666837, 1, 1, 1, 1, 1,
-0.4300515, 0.6183706, -1.313869, 1, 1, 1, 1, 1,
-0.4270772, 0.9889829, -0.8212009, 1, 1, 1, 1, 1,
-0.4195028, -0.1881936, -0.4438026, 1, 1, 1, 1, 1,
-0.4189046, -0.4601595, -2.656828, 1, 1, 1, 1, 1,
-0.4150639, -1.798963, -1.153067, 1, 1, 1, 1, 1,
-0.4136133, 1.406144, 1.228679, 1, 1, 1, 1, 1,
-0.4136028, 0.6495447, -0.2069493, 1, 1, 1, 1, 1,
-0.4124283, -1.115872, -3.574068, 1, 1, 1, 1, 1,
-0.4093948, 0.89353, 2.133021, 1, 1, 1, 1, 1,
-0.4088515, -0.7396889, -3.348562, 1, 1, 1, 1, 1,
-0.4087555, 0.7102169, -0.03081509, 1, 1, 1, 1, 1,
-0.4086201, -0.08441956, 0.2328009, 1, 1, 1, 1, 1,
-0.4056893, 0.3103652, -1.008733, 1, 1, 1, 1, 1,
-0.4039546, -1.435559, -1.699225, 0, 0, 1, 1, 1,
-0.4006265, 0.08438381, 0.9660211, 1, 0, 0, 1, 1,
-0.3998628, 0.5143839, -0.02968512, 1, 0, 0, 1, 1,
-0.3986202, 0.5331934, -2.756642, 1, 0, 0, 1, 1,
-0.3971339, 0.5647873, -0.7008185, 1, 0, 0, 1, 1,
-0.395413, 1.59663, 0.9906183, 1, 0, 0, 1, 1,
-0.3916559, 0.4470581, -0.3941474, 0, 0, 0, 1, 1,
-0.3888922, 1.591994, -1.007225, 0, 0, 0, 1, 1,
-0.3877907, 0.973399, -0.8304222, 0, 0, 0, 1, 1,
-0.385675, 0.3318844, -0.04425417, 0, 0, 0, 1, 1,
-0.3848668, -1.581577, -3.854863, 0, 0, 0, 1, 1,
-0.3846508, 0.7104899, -0.1062825, 0, 0, 0, 1, 1,
-0.3832895, 0.0642856, -1.536242, 0, 0, 0, 1, 1,
-0.3779373, -0.1729823, -2.088168, 1, 1, 1, 1, 1,
-0.3734563, 0.479513, -1.517637, 1, 1, 1, 1, 1,
-0.3730422, 0.02689471, -0.857255, 1, 1, 1, 1, 1,
-0.3702497, -0.8890245, -1.341877, 1, 1, 1, 1, 1,
-0.369185, -0.06801672, -0.002402052, 1, 1, 1, 1, 1,
-0.3644126, 0.1535334, -0.0657228, 1, 1, 1, 1, 1,
-0.3635735, 1.044611, 0.1701766, 1, 1, 1, 1, 1,
-0.3614273, 1.198691, 0.7378775, 1, 1, 1, 1, 1,
-0.3597417, 0.4333512, -0.3409232, 1, 1, 1, 1, 1,
-0.3588593, -1.388029, -2.140157, 1, 1, 1, 1, 1,
-0.3569425, -0.3081351, -2.086636, 1, 1, 1, 1, 1,
-0.3555692, 1.17122, 0.3491168, 1, 1, 1, 1, 1,
-0.3510038, -2.019011, -4.216418, 1, 1, 1, 1, 1,
-0.3504346, -2.095315, -2.97012, 1, 1, 1, 1, 1,
-0.3503171, 1.13509, 0.9027092, 1, 1, 1, 1, 1,
-0.350136, 0.352523, 0.07987858, 0, 0, 1, 1, 1,
-0.3500659, 0.001509807, -0.8604875, 1, 0, 0, 1, 1,
-0.3492182, -0.174978, -3.037852, 1, 0, 0, 1, 1,
-0.346555, 0.2050059, -0.3506606, 1, 0, 0, 1, 1,
-0.3458502, -1.23768, -5.106362, 1, 0, 0, 1, 1,
-0.3456379, -0.8815889, -2.77185, 1, 0, 0, 1, 1,
-0.3443563, -0.2183643, -2.191046, 0, 0, 0, 1, 1,
-0.342232, 1.280146, -0.2038381, 0, 0, 0, 1, 1,
-0.338092, -0.2310443, -1.496306, 0, 0, 0, 1, 1,
-0.3366162, 1.621332, -0.03959979, 0, 0, 0, 1, 1,
-0.3322914, 0.2704969, -0.1506578, 0, 0, 0, 1, 1,
-0.3289605, -2.070731, -4.119183, 0, 0, 0, 1, 1,
-0.3273493, 0.7129965, -1.026094, 0, 0, 0, 1, 1,
-0.3258195, -0.4360617, -0.7018765, 1, 1, 1, 1, 1,
-0.320365, 0.1091452, -2.122184, 1, 1, 1, 1, 1,
-0.3170753, 0.6936607, -0.3907248, 1, 1, 1, 1, 1,
-0.3154066, -0.4615999, -2.051006, 1, 1, 1, 1, 1,
-0.3139017, -1.045522, -1.899624, 1, 1, 1, 1, 1,
-0.3075611, -0.4424102, -1.512565, 1, 1, 1, 1, 1,
-0.3045583, -1.443904, -2.957054, 1, 1, 1, 1, 1,
-0.3033172, -1.924004, -2.197819, 1, 1, 1, 1, 1,
-0.2908705, 0.01771968, -1.49961, 1, 1, 1, 1, 1,
-0.2852129, -0.4518596, -1.743173, 1, 1, 1, 1, 1,
-0.2851013, -1.961423, -2.328737, 1, 1, 1, 1, 1,
-0.2833239, -0.7027097, -4.616793, 1, 1, 1, 1, 1,
-0.2732334, -0.3625128, -0.5166716, 1, 1, 1, 1, 1,
-0.2729256, 0.4222963, 0.1137788, 1, 1, 1, 1, 1,
-0.272646, -0.2629195, -2.76094, 1, 1, 1, 1, 1,
-0.2689039, 0.5488511, 0.2881627, 0, 0, 1, 1, 1,
-0.2662412, 0.7972315, 1.115242, 1, 0, 0, 1, 1,
-0.2645384, 0.5830205, -0.9553022, 1, 0, 0, 1, 1,
-0.264185, 0.6067957, -1.02823, 1, 0, 0, 1, 1,
-0.2639618, -0.9472114, -3.109304, 1, 0, 0, 1, 1,
-0.2612662, -1.205857, -2.01201, 1, 0, 0, 1, 1,
-0.2565572, 0.3735258, -0.6748565, 0, 0, 0, 1, 1,
-0.2450919, -0.30319, -2.413191, 0, 0, 0, 1, 1,
-0.244997, -0.7171232, -1.041794, 0, 0, 0, 1, 1,
-0.2445398, 0.9804314, 0.7869189, 0, 0, 0, 1, 1,
-0.2390818, -0.5966088, -1.096685, 0, 0, 0, 1, 1,
-0.2382172, 0.1914845, -0.7319055, 0, 0, 0, 1, 1,
-0.2371211, -0.5240664, -1.944006, 0, 0, 0, 1, 1,
-0.2353015, 0.5158169, 0.04074576, 1, 1, 1, 1, 1,
-0.2350555, 0.2613511, -0.1823144, 1, 1, 1, 1, 1,
-0.2349441, -1.628085, -3.019577, 1, 1, 1, 1, 1,
-0.2349058, -0.3446531, -2.411728, 1, 1, 1, 1, 1,
-0.2320278, -0.7219383, -3.677449, 1, 1, 1, 1, 1,
-0.2294344, -0.6746854, 0.1121601, 1, 1, 1, 1, 1,
-0.2292862, 0.7407558, -1.902828, 1, 1, 1, 1, 1,
-0.2272164, -0.3683906, -3.158467, 1, 1, 1, 1, 1,
-0.2258245, 0.3785091, -1.984261, 1, 1, 1, 1, 1,
-0.2242134, -0.7423092, -1.182405, 1, 1, 1, 1, 1,
-0.2230574, -0.4463015, -2.500574, 1, 1, 1, 1, 1,
-0.2191022, 0.8347672, -3.171429, 1, 1, 1, 1, 1,
-0.2175482, -0.6123556, 0.2038323, 1, 1, 1, 1, 1,
-0.2172672, 0.2227525, -1.960846, 1, 1, 1, 1, 1,
-0.2171255, 1.435436, -2.440219, 1, 1, 1, 1, 1,
-0.2158515, -0.6243724, -2.525094, 0, 0, 1, 1, 1,
-0.2138026, 0.6421923, -1.780864, 1, 0, 0, 1, 1,
-0.2102217, 0.7506196, -0.1484701, 1, 0, 0, 1, 1,
-0.2094341, -0.231384, -1.485855, 1, 0, 0, 1, 1,
-0.2071165, -2.630661, -2.78626, 1, 0, 0, 1, 1,
-0.2067584, 0.7545686, 0.5020181, 1, 0, 0, 1, 1,
-0.2025403, -1.27702, -4.552148, 0, 0, 0, 1, 1,
-0.1975735, -0.6121339, -4.104689, 0, 0, 0, 1, 1,
-0.1950744, 0.9324226, 0.7448961, 0, 0, 0, 1, 1,
-0.1934809, 1.288331, -1.901233, 0, 0, 0, 1, 1,
-0.1922003, 0.008353904, -2.700044, 0, 0, 0, 1, 1,
-0.1910034, -0.1616855, -2.930211, 0, 0, 0, 1, 1,
-0.188324, -0.271698, -2.130628, 0, 0, 0, 1, 1,
-0.1877702, 0.9349, -1.36221, 1, 1, 1, 1, 1,
-0.1824031, 0.7401161, -0.05047242, 1, 1, 1, 1, 1,
-0.1818364, -0.4589247, -1.998869, 1, 1, 1, 1, 1,
-0.1720499, 1.185436, -0.4205546, 1, 1, 1, 1, 1,
-0.1678433, -0.3792636, -0.3616404, 1, 1, 1, 1, 1,
-0.1676086, -0.7800393, -2.933081, 1, 1, 1, 1, 1,
-0.1653471, -1.749631, -3.047884, 1, 1, 1, 1, 1,
-0.1622019, -1.275702, -4.439985, 1, 1, 1, 1, 1,
-0.161665, -3.109336, -3.597216, 1, 1, 1, 1, 1,
-0.1602387, -0.5560248, -1.276379, 1, 1, 1, 1, 1,
-0.1576665, -0.9724491, -4.098216, 1, 1, 1, 1, 1,
-0.155342, -1.022233, -2.457874, 1, 1, 1, 1, 1,
-0.1547122, 0.5531208, 0.4978044, 1, 1, 1, 1, 1,
-0.1537653, 0.222268, 0.1729201, 1, 1, 1, 1, 1,
-0.1512576, -2.147373, -3.199981, 1, 1, 1, 1, 1,
-0.1482102, -0.3300441, -2.952894, 0, 0, 1, 1, 1,
-0.1467108, -1.631631, -3.67902, 1, 0, 0, 1, 1,
-0.1465949, -0.5156868, -2.465936, 1, 0, 0, 1, 1,
-0.1457748, -1.192353, -3.160236, 1, 0, 0, 1, 1,
-0.1432598, -0.5114055, -2.012944, 1, 0, 0, 1, 1,
-0.1406516, 1.85944, -0.6231001, 1, 0, 0, 1, 1,
-0.1380929, 0.8261316, -0.1467516, 0, 0, 0, 1, 1,
-0.137924, 1.573208, 1.968805, 0, 0, 0, 1, 1,
-0.1350614, 1.901605, -0.8185806, 0, 0, 0, 1, 1,
-0.1347546, 0.6151761, -0.6936023, 0, 0, 0, 1, 1,
-0.1302956, 0.7122176, 1.489254, 0, 0, 0, 1, 1,
-0.1272523, -0.2316785, -2.928339, 0, 0, 0, 1, 1,
-0.1267169, -0.5035918, -1.314738, 0, 0, 0, 1, 1,
-0.1248119, -0.9102882, -2.266762, 1, 1, 1, 1, 1,
-0.1235346, -0.8178617, -3.167658, 1, 1, 1, 1, 1,
-0.1213142, -0.4387377, -2.89328, 1, 1, 1, 1, 1,
-0.1207602, -0.03392314, -3.601924, 1, 1, 1, 1, 1,
-0.120293, 0.1007893, -0.7170466, 1, 1, 1, 1, 1,
-0.1178257, -0.2760868, -3.154307, 1, 1, 1, 1, 1,
-0.1172758, -2.243743, -3.778151, 1, 1, 1, 1, 1,
-0.1161123, 0.9120469, -1.332699, 1, 1, 1, 1, 1,
-0.1070118, 1.822568, -0.05164176, 1, 1, 1, 1, 1,
-0.1047566, -0.8853768, -4.602768, 1, 1, 1, 1, 1,
-0.1013008, 0.8506777, -1.355169, 1, 1, 1, 1, 1,
-0.09414947, -0.02263124, -3.192777, 1, 1, 1, 1, 1,
-0.08969391, -0.4370907, -2.132385, 1, 1, 1, 1, 1,
-0.08819599, 0.3052243, -1.782418, 1, 1, 1, 1, 1,
-0.08661538, -0.1424629, -2.665397, 1, 1, 1, 1, 1,
-0.08094532, -0.4426351, -1.270639, 0, 0, 1, 1, 1,
-0.07652035, 1.967208, -0.7722729, 1, 0, 0, 1, 1,
-0.07369822, -0.581602, -2.903258, 1, 0, 0, 1, 1,
-0.06733764, -0.9516549, -3.831181, 1, 0, 0, 1, 1,
-0.06352367, 1.217802, 0.4057076, 1, 0, 0, 1, 1,
-0.0519803, 1.318802, -0.383765, 1, 0, 0, 1, 1,
-0.05049555, 2.132784, -0.003811338, 0, 0, 0, 1, 1,
-0.04891428, -0.1239185, -2.771695, 0, 0, 0, 1, 1,
-0.04890854, -1.264849, -2.558245, 0, 0, 0, 1, 1,
-0.0484235, 0.2320122, -0.1549682, 0, 0, 0, 1, 1,
-0.042249, 1.209174, -1.123448, 0, 0, 0, 1, 1,
-0.03406268, -0.1415342, -2.605456, 0, 0, 0, 1, 1,
-0.03345728, 0.7808363, 0.3243243, 0, 0, 0, 1, 1,
-0.02790177, -1.020517, -3.098968, 1, 1, 1, 1, 1,
-0.02512802, -1.399652, -3.025099, 1, 1, 1, 1, 1,
-0.0235191, -1.106248, -3.075853, 1, 1, 1, 1, 1,
-0.02058654, -0.9409589, -3.758439, 1, 1, 1, 1, 1,
-0.01932662, 1.345399, -0.8990178, 1, 1, 1, 1, 1,
-0.01837343, 0.9623994, 0.8260983, 1, 1, 1, 1, 1,
-0.01705804, -0.7892758, -4.967057, 1, 1, 1, 1, 1,
-0.01653409, 0.01297042, -0.9951624, 1, 1, 1, 1, 1,
-0.01587078, -1.989913, -2.753408, 1, 1, 1, 1, 1,
-0.01422943, 1.570771, -1.438574, 1, 1, 1, 1, 1,
-0.01285523, -1.571615, -3.84552, 1, 1, 1, 1, 1,
-0.00710388, 1.906632, 2.081475, 1, 1, 1, 1, 1,
-0.005889251, -1.291185, -3.086702, 1, 1, 1, 1, 1,
-0.00247718, -0.1768567, -2.456216, 1, 1, 1, 1, 1,
-0.002305099, -0.5691642, -2.993119, 1, 1, 1, 1, 1,
-0.001088362, -1.680405, -3.547178, 0, 0, 1, 1, 1,
0.0009403027, -0.3886257, 1.89174, 1, 0, 0, 1, 1,
0.002723643, -0.8783446, 1.94137, 1, 0, 0, 1, 1,
0.005883386, -0.03824842, 2.940068, 1, 0, 0, 1, 1,
0.02646998, 0.3244847, 1.398944, 1, 0, 0, 1, 1,
0.02887001, 0.2521082, 0.235287, 1, 0, 0, 1, 1,
0.02987461, 0.6853595, -0.3203067, 0, 0, 0, 1, 1,
0.03235674, 1.491829, 0.125498, 0, 0, 0, 1, 1,
0.0386088, -1.618269, 3.610373, 0, 0, 0, 1, 1,
0.04395854, 2.005247, -2.355042, 0, 0, 0, 1, 1,
0.04768791, -0.09215701, 3.163744, 0, 0, 0, 1, 1,
0.0479758, -0.8272388, 3.081345, 0, 0, 0, 1, 1,
0.05013948, -0.09446051, 2.889038, 0, 0, 0, 1, 1,
0.05099268, 0.4388455, -0.1747292, 1, 1, 1, 1, 1,
0.05377437, -1.406619, 1.706782, 1, 1, 1, 1, 1,
0.05643049, -0.735202, 1.628016, 1, 1, 1, 1, 1,
0.05659349, 0.2192334, -0.8262196, 1, 1, 1, 1, 1,
0.06533347, 0.976815, -0.6610533, 1, 1, 1, 1, 1,
0.06797606, -1.404989, 1.624291, 1, 1, 1, 1, 1,
0.06879158, 0.2753149, -0.2934, 1, 1, 1, 1, 1,
0.07166871, -0.7995725, 3.557001, 1, 1, 1, 1, 1,
0.0719445, 0.6621192, 0.1736619, 1, 1, 1, 1, 1,
0.07295691, 0.5057214, 0.7488498, 1, 1, 1, 1, 1,
0.07856478, -0.2194655, 3.84095, 1, 1, 1, 1, 1,
0.08199219, 2.268421, 0.1664046, 1, 1, 1, 1, 1,
0.08336951, -0.9337172, 2.122113, 1, 1, 1, 1, 1,
0.09714199, 0.254294, -0.5030702, 1, 1, 1, 1, 1,
0.09821627, -0.4845, 1.291951, 1, 1, 1, 1, 1,
0.09931962, 0.5761001, 1.235439, 0, 0, 1, 1, 1,
0.1009626, -0.4481132, 1.825237, 1, 0, 0, 1, 1,
0.1063279, -0.3448659, 3.667709, 1, 0, 0, 1, 1,
0.1100581, 0.7458037, -0.5012279, 1, 0, 0, 1, 1,
0.1226238, 0.925687, 0.3484209, 1, 0, 0, 1, 1,
0.1284046, 0.4593489, 1.440463, 1, 0, 0, 1, 1,
0.1294304, 0.02186495, -0.56216, 0, 0, 0, 1, 1,
0.1302537, 0.4990374, 0.8522553, 0, 0, 0, 1, 1,
0.1311747, 0.0615515, -1.708434, 0, 0, 0, 1, 1,
0.135527, -0.04479694, 0.4540446, 0, 0, 0, 1, 1,
0.1361348, 0.3495968, 0.5827071, 0, 0, 0, 1, 1,
0.1381047, 0.08758325, 2.555494, 0, 0, 0, 1, 1,
0.1460436, 1.071642, 0.4300787, 0, 0, 0, 1, 1,
0.1477597, 0.3586232, 1.037041, 1, 1, 1, 1, 1,
0.1483038, 0.7184733, 0.07519152, 1, 1, 1, 1, 1,
0.1487272, -1.445537, 3.491791, 1, 1, 1, 1, 1,
0.15266, -1.753223, 3.624471, 1, 1, 1, 1, 1,
0.1584871, 1.670298, 0.6774665, 1, 1, 1, 1, 1,
0.1598032, -0.699522, 2.721625, 1, 1, 1, 1, 1,
0.1600122, -0.2396392, 1.976995, 1, 1, 1, 1, 1,
0.1644166, -0.6523805, 3.64624, 1, 1, 1, 1, 1,
0.1652843, -1.829964, 3.129335, 1, 1, 1, 1, 1,
0.1653724, -0.5121115, 3.668424, 1, 1, 1, 1, 1,
0.1675696, -0.6592126, 2.019351, 1, 1, 1, 1, 1,
0.1692731, -0.2180008, 1.895515, 1, 1, 1, 1, 1,
0.1694077, 0.4392394, 0.8154616, 1, 1, 1, 1, 1,
0.1747615, 1.069537, 0.3698248, 1, 1, 1, 1, 1,
0.1771606, 0.4230036, 1.02227, 1, 1, 1, 1, 1,
0.1830367, -1.847207, 2.51857, 0, 0, 1, 1, 1,
0.1846805, 0.2683623, -1.433103, 1, 0, 0, 1, 1,
0.1877255, 0.2528339, -0.5767193, 1, 0, 0, 1, 1,
0.1929538, -0.5793617, 2.158032, 1, 0, 0, 1, 1,
0.1966282, -1.554011, 2.555825, 1, 0, 0, 1, 1,
0.1970346, 0.1946356, 0.3547959, 1, 0, 0, 1, 1,
0.1974442, 0.09371354, 1.190428, 0, 0, 0, 1, 1,
0.2005062, 0.8660011, 1.860092, 0, 0, 0, 1, 1,
0.2016418, 0.7943026, 1.996881, 0, 0, 0, 1, 1,
0.20382, -0.2740354, 1.072596, 0, 0, 0, 1, 1,
0.2047093, -0.8564742, 2.172459, 0, 0, 0, 1, 1,
0.2153018, -1.269944, 4.262734, 0, 0, 0, 1, 1,
0.2182651, 1.023455, -1.640515, 0, 0, 0, 1, 1,
0.2207821, 0.6821671, 0.190966, 1, 1, 1, 1, 1,
0.2286553, 1.129761, 0.7116525, 1, 1, 1, 1, 1,
0.2292955, 0.7243206, -0.2613208, 1, 1, 1, 1, 1,
0.2317352, 0.3222102, 1.758482, 1, 1, 1, 1, 1,
0.2341205, -0.1865552, 2.505914, 1, 1, 1, 1, 1,
0.2380509, 0.984721, 0.2437609, 1, 1, 1, 1, 1,
0.243708, -1.832838, 4.288204, 1, 1, 1, 1, 1,
0.2476447, -0.1495046, 2.1684, 1, 1, 1, 1, 1,
0.2480421, 0.9557519, 1.152886, 1, 1, 1, 1, 1,
0.2487198, -0.7431417, 3.423199, 1, 1, 1, 1, 1,
0.2489027, -1.635278, 2.561433, 1, 1, 1, 1, 1,
0.2503614, 1.94944, -0.3163859, 1, 1, 1, 1, 1,
0.2518187, -0.5634826, 1.034941, 1, 1, 1, 1, 1,
0.2536859, 1.735926, -0.2478105, 1, 1, 1, 1, 1,
0.2649921, -0.7533303, 1.773532, 1, 1, 1, 1, 1,
0.271239, -0.4865518, 1.449851, 0, 0, 1, 1, 1,
0.2720288, -2.277011, 2.319144, 1, 0, 0, 1, 1,
0.274123, 1.091032, 0.3046779, 1, 0, 0, 1, 1,
0.2761048, 0.3731251, 0.3347075, 1, 0, 0, 1, 1,
0.2824803, -1.308908, 3.122977, 1, 0, 0, 1, 1,
0.2920177, -2.610731, 2.77844, 1, 0, 0, 1, 1,
0.2974193, -0.8392802, 2.890909, 0, 0, 0, 1, 1,
0.2995022, -0.08920092, 1.746745, 0, 0, 0, 1, 1,
0.3033685, 1.818354, 0.7015638, 0, 0, 0, 1, 1,
0.3061903, -1.200905, 2.702707, 0, 0, 0, 1, 1,
0.3096456, 0.68604, 1.461911, 0, 0, 0, 1, 1,
0.3106245, 1.144878, -0.7699086, 0, 0, 0, 1, 1,
0.3127985, -0.1461726, 1.823648, 0, 0, 0, 1, 1,
0.3151402, -1.378551, 2.37661, 1, 1, 1, 1, 1,
0.3152034, -0.3152668, 2.619795, 1, 1, 1, 1, 1,
0.3154657, 0.002276892, 1.516047, 1, 1, 1, 1, 1,
0.3295861, 0.262555, 1.574756, 1, 1, 1, 1, 1,
0.3323272, 0.0743852, 1.199012, 1, 1, 1, 1, 1,
0.3440789, 1.313648, 0.3861299, 1, 1, 1, 1, 1,
0.3453028, 1.725457, 0.5109878, 1, 1, 1, 1, 1,
0.3461429, -0.2791078, 2.878609, 1, 1, 1, 1, 1,
0.3465597, 0.5255547, -0.1891773, 1, 1, 1, 1, 1,
0.3466602, -1.040093, 2.373063, 1, 1, 1, 1, 1,
0.3507653, 0.2588151, 1.281184, 1, 1, 1, 1, 1,
0.3522575, -0.903119, 2.450375, 1, 1, 1, 1, 1,
0.3574066, -1.712955, 1.978058, 1, 1, 1, 1, 1,
0.3607011, 0.4891577, 0.8020679, 1, 1, 1, 1, 1,
0.3607221, -1.940323, 3.673317, 1, 1, 1, 1, 1,
0.3623792, 0.04131255, 1.996011, 0, 0, 1, 1, 1,
0.3633103, -2.436799, 3.865583, 1, 0, 0, 1, 1,
0.3671395, 0.002989275, 1.253744, 1, 0, 0, 1, 1,
0.3689668, -0.8061916, 3.094534, 1, 0, 0, 1, 1,
0.3805203, -1.561305, 0.991854, 1, 0, 0, 1, 1,
0.383489, -0.05559875, 1.238574, 1, 0, 0, 1, 1,
0.384041, -1.128414, 3.233892, 0, 0, 0, 1, 1,
0.3865494, -0.136445, 1.993543, 0, 0, 0, 1, 1,
0.3903161, -1.243554, 4.027166, 0, 0, 0, 1, 1,
0.3913297, -0.7912549, 3.953681, 0, 0, 0, 1, 1,
0.3981121, -0.2810075, 2.81411, 0, 0, 0, 1, 1,
0.3992085, -0.9553232, 1.699511, 0, 0, 0, 1, 1,
0.4048159, -0.2332394, 3.000601, 0, 0, 0, 1, 1,
0.4067926, 0.5735624, -0.2951676, 1, 1, 1, 1, 1,
0.4143789, -1.420701, 5.401147, 1, 1, 1, 1, 1,
0.4166878, 0.08289296, 0.6836347, 1, 1, 1, 1, 1,
0.4189143, 0.1214894, 2.200694, 1, 1, 1, 1, 1,
0.4195924, 1.81937, 0.9041794, 1, 1, 1, 1, 1,
0.4235372, -1.777161, 3.016946, 1, 1, 1, 1, 1,
0.4242033, 2.597543, 1.396194, 1, 1, 1, 1, 1,
0.4267229, -1.345186, 4.11364, 1, 1, 1, 1, 1,
0.4276929, -1.702172, 2.193204, 1, 1, 1, 1, 1,
0.431925, -0.4248535, 1.938427, 1, 1, 1, 1, 1,
0.4346031, -0.3300264, 2.599114, 1, 1, 1, 1, 1,
0.4350668, -0.05478657, 0.7651725, 1, 1, 1, 1, 1,
0.4372298, 0.1574151, 1.469408, 1, 1, 1, 1, 1,
0.4373892, -1.031481, 3.274983, 1, 1, 1, 1, 1,
0.4373927, -1.555153, 2.799585, 1, 1, 1, 1, 1,
0.4403986, -0.5482848, 1.992112, 0, 0, 1, 1, 1,
0.4406103, -0.5748671, 1.581243, 1, 0, 0, 1, 1,
0.4478191, -1.010294, 4.350116, 1, 0, 0, 1, 1,
0.4479693, -0.2333699, 2.186149, 1, 0, 0, 1, 1,
0.4493897, 0.02912851, 1.188667, 1, 0, 0, 1, 1,
0.4508171, -0.6896617, 2.588149, 1, 0, 0, 1, 1,
0.4536687, -0.1954573, 0.4136615, 0, 0, 0, 1, 1,
0.4557017, -1.803273, 2.720807, 0, 0, 0, 1, 1,
0.4572723, -0.1679433, 2.915061, 0, 0, 0, 1, 1,
0.4627797, -0.1337572, 2.959311, 0, 0, 0, 1, 1,
0.4643333, 0.6115198, 0.09039123, 0, 0, 0, 1, 1,
0.4664305, 0.364402, -0.6595752, 0, 0, 0, 1, 1,
0.4698174, -0.3641436, 3.281021, 0, 0, 0, 1, 1,
0.4703231, -1.771237, 2.751583, 1, 1, 1, 1, 1,
0.4816354, -0.3740266, 1.176263, 1, 1, 1, 1, 1,
0.4836298, -0.7516022, 3.670265, 1, 1, 1, 1, 1,
0.4839937, -0.8812853, 2.650962, 1, 1, 1, 1, 1,
0.4873967, 0.7333844, -0.7221557, 1, 1, 1, 1, 1,
0.4877381, 0.008067122, 1.593216, 1, 1, 1, 1, 1,
0.488679, -0.1717223, 2.023063, 1, 1, 1, 1, 1,
0.4911969, 2.163631, 1.751124, 1, 1, 1, 1, 1,
0.4952474, -2.307973, 2.7652, 1, 1, 1, 1, 1,
0.4968306, -0.7727005, 4.160562, 1, 1, 1, 1, 1,
0.4996057, -0.8640046, 2.050731, 1, 1, 1, 1, 1,
0.5029178, -1.451079, 1.980467, 1, 1, 1, 1, 1,
0.5210387, -0.01029875, 2.057862, 1, 1, 1, 1, 1,
0.5228825, -0.3613897, 3.564039, 1, 1, 1, 1, 1,
0.5334767, -0.5806305, 2.863616, 1, 1, 1, 1, 1,
0.5413723, -0.2111459, 2.127483, 0, 0, 1, 1, 1,
0.546221, -1.675464, 3.302244, 1, 0, 0, 1, 1,
0.5485224, -0.3249872, 2.339984, 1, 0, 0, 1, 1,
0.5493661, 1.099636, 1.121671, 1, 0, 0, 1, 1,
0.5518208, -1.56691, 2.876324, 1, 0, 0, 1, 1,
0.5526855, 0.8784101, 1.237381, 1, 0, 0, 1, 1,
0.553026, -1.810137, 4.671545, 0, 0, 0, 1, 1,
0.5556467, 1.122894, -0.5583718, 0, 0, 0, 1, 1,
0.5561092, -0.2442895, 3.413462, 0, 0, 0, 1, 1,
0.5636534, -2.358688, 1.681372, 0, 0, 0, 1, 1,
0.5660938, -0.8025762, 2.452734, 0, 0, 0, 1, 1,
0.56646, 0.8755606, 1.825589, 0, 0, 0, 1, 1,
0.5669587, -0.1166206, 2.035609, 0, 0, 0, 1, 1,
0.5675868, 1.23936, 1.654486, 1, 1, 1, 1, 1,
0.567768, -0.7953021, 2.199992, 1, 1, 1, 1, 1,
0.5686554, 1.041444, 1.87639, 1, 1, 1, 1, 1,
0.5702522, 0.001978794, -0.9081205, 1, 1, 1, 1, 1,
0.5707664, -0.02230455, 0.6048022, 1, 1, 1, 1, 1,
0.575312, -0.6059022, 2.627033, 1, 1, 1, 1, 1,
0.5778767, -1.285227, 1.637946, 1, 1, 1, 1, 1,
0.5815811, -0.453774, 0.6822113, 1, 1, 1, 1, 1,
0.5880594, 0.9037631, 0.1957134, 1, 1, 1, 1, 1,
0.5883632, -0.1423796, 1.545631, 1, 1, 1, 1, 1,
0.5970536, -0.2136295, 4.542788, 1, 1, 1, 1, 1,
0.59806, -0.5955453, 2.687167, 1, 1, 1, 1, 1,
0.5986072, -1.643784, 2.219215, 1, 1, 1, 1, 1,
0.5994607, -2.404749, 3.354626, 1, 1, 1, 1, 1,
0.6004156, 1.200741, 1.639847, 1, 1, 1, 1, 1,
0.6045399, -0.7878285, 2.679915, 0, 0, 1, 1, 1,
0.6067774, -0.7598195, 2.385097, 1, 0, 0, 1, 1,
0.6068045, 2.215675, -1.281427, 1, 0, 0, 1, 1,
0.6101696, 0.6580604, 2.495122, 1, 0, 0, 1, 1,
0.6137705, 1.210471, 0.6203175, 1, 0, 0, 1, 1,
0.6163099, 1.5851, 0.2551387, 1, 0, 0, 1, 1,
0.6193393, -0.23319, 1.894258, 0, 0, 0, 1, 1,
0.6230309, -0.06187163, 0.707017, 0, 0, 0, 1, 1,
0.6275567, 0.2259833, 0.541997, 0, 0, 0, 1, 1,
0.6296555, -0.3709995, 0.1989578, 0, 0, 0, 1, 1,
0.631651, 0.2198338, -0.5879341, 0, 0, 0, 1, 1,
0.6317091, 0.403822, 0.02089169, 0, 0, 0, 1, 1,
0.6358168, -0.7190316, 3.222581, 0, 0, 0, 1, 1,
0.6364705, 0.7226514, 1.339221, 1, 1, 1, 1, 1,
0.6365646, -0.04718442, 0.5800863, 1, 1, 1, 1, 1,
0.6384465, -0.7567743, 0.8021644, 1, 1, 1, 1, 1,
0.6412496, -0.3535744, 2.321753, 1, 1, 1, 1, 1,
0.6497254, 0.01652191, 2.907049, 1, 1, 1, 1, 1,
0.6514642, 1.422729, 0.6964253, 1, 1, 1, 1, 1,
0.6526648, -0.688439, -0.03012279, 1, 1, 1, 1, 1,
0.6613143, -1.635547, 2.847299, 1, 1, 1, 1, 1,
0.6614819, 1.448338, 1.370473, 1, 1, 1, 1, 1,
0.6629676, 0.08586962, 0.7978791, 1, 1, 1, 1, 1,
0.6632859, 0.1050892, 1.561729, 1, 1, 1, 1, 1,
0.6633457, -1.646283, 2.183457, 1, 1, 1, 1, 1,
0.6652604, -0.9582582, 2.584948, 1, 1, 1, 1, 1,
0.6704119, -1.366072, 3.74496, 1, 1, 1, 1, 1,
0.6704312, 0.4153397, 0.5098816, 1, 1, 1, 1, 1,
0.6787473, 0.333532, 0.001728098, 0, 0, 1, 1, 1,
0.680465, -1.180201, 3.079148, 1, 0, 0, 1, 1,
0.6813358, 0.07315123, 0.01994688, 1, 0, 0, 1, 1,
0.6833146, 0.7353803, 0.2508518, 1, 0, 0, 1, 1,
0.6843697, -2.321702, 1.130277, 1, 0, 0, 1, 1,
0.6849846, 1.06645, 1.622439, 1, 0, 0, 1, 1,
0.6987736, -0.1839692, 0.5646783, 0, 0, 0, 1, 1,
0.6991196, -0.1289531, 1.994979, 0, 0, 0, 1, 1,
0.7001302, 0.5775536, 1.272683, 0, 0, 0, 1, 1,
0.705187, -0.02011353, 2.627191, 0, 0, 0, 1, 1,
0.7109858, -0.1377723, 2.196998, 0, 0, 0, 1, 1,
0.7139009, -0.6926761, 1.574028, 0, 0, 0, 1, 1,
0.7153904, -0.1456515, 1.702261, 0, 0, 0, 1, 1,
0.7167959, -0.6736954, 1.95435, 1, 1, 1, 1, 1,
0.720529, 0.6830333, 1.381479, 1, 1, 1, 1, 1,
0.7258974, -1.244956, 1.941377, 1, 1, 1, 1, 1,
0.7364506, 3.150798, -0.1387627, 1, 1, 1, 1, 1,
0.7393019, 0.9024961, 1.794807, 1, 1, 1, 1, 1,
0.7427866, -0.7987558, 1.722863, 1, 1, 1, 1, 1,
0.7437915, -1.322751, 3.487241, 1, 1, 1, 1, 1,
0.7498062, 0.1029582, 3.069928, 1, 1, 1, 1, 1,
0.7526553, -1.130136, 1.852087, 1, 1, 1, 1, 1,
0.755504, 0.8422871, 2.097877, 1, 1, 1, 1, 1,
0.7564327, 0.8707541, 0.4866473, 1, 1, 1, 1, 1,
0.7630614, 0.244407, 1.475713, 1, 1, 1, 1, 1,
0.7640309, -1.348643, 3.154814, 1, 1, 1, 1, 1,
0.7682927, 0.7126753, -0.2757053, 1, 1, 1, 1, 1,
0.7695754, -0.1438117, 2.792526, 1, 1, 1, 1, 1,
0.7718793, -0.07144485, 1.776627, 0, 0, 1, 1, 1,
0.7772155, -0.9111542, 2.270266, 1, 0, 0, 1, 1,
0.7833142, -1.025079, 2.212279, 1, 0, 0, 1, 1,
0.7842972, -0.3176621, 0.97678, 1, 0, 0, 1, 1,
0.7849533, 1.276137, 1.020343, 1, 0, 0, 1, 1,
0.7894846, 0.3664239, -0.9047868, 1, 0, 0, 1, 1,
0.7895752, 0.5593094, 1.157364, 0, 0, 0, 1, 1,
0.7917154, 0.09183241, 0.7127266, 0, 0, 0, 1, 1,
0.79336, -1.297102, 2.674762, 0, 0, 0, 1, 1,
0.794248, 0.7281294, 1.210198, 0, 0, 0, 1, 1,
0.800705, -0.3899051, 3.432356, 0, 0, 0, 1, 1,
0.8024763, 0.2849769, 2.26037, 0, 0, 0, 1, 1,
0.8061136, 1.418919, -0.6405405, 0, 0, 0, 1, 1,
0.8066602, 0.7133651, 1.248454, 1, 1, 1, 1, 1,
0.8067662, -0.7811483, 2.745136, 1, 1, 1, 1, 1,
0.8082206, -0.8127676, 2.941529, 1, 1, 1, 1, 1,
0.8115359, -0.04506986, 0.8968056, 1, 1, 1, 1, 1,
0.8128195, -0.2407427, 3.032108, 1, 1, 1, 1, 1,
0.8137552, -2.330077, 4.585706, 1, 1, 1, 1, 1,
0.8169154, 0.2379569, 0.8154426, 1, 1, 1, 1, 1,
0.8193769, -2.546708, 1.403591, 1, 1, 1, 1, 1,
0.8217469, 1.155339, 1.53375, 1, 1, 1, 1, 1,
0.8292521, 1.555302, 1.333083, 1, 1, 1, 1, 1,
0.8355185, 0.01903234, 1.246432, 1, 1, 1, 1, 1,
0.8368104, -0.5525586, 2.001053, 1, 1, 1, 1, 1,
0.838163, -0.03301354, 3.646076, 1, 1, 1, 1, 1,
0.8444873, 1.235581, 1.597829, 1, 1, 1, 1, 1,
0.8466405, 0.7500107, 0.6603502, 1, 1, 1, 1, 1,
0.8482191, -0.5304946, 4.68162, 0, 0, 1, 1, 1,
0.8521668, 1.254864, 0.8579957, 1, 0, 0, 1, 1,
0.8532419, -0.3909892, 1.783626, 1, 0, 0, 1, 1,
0.8542733, 2.156871, 2.587457, 1, 0, 0, 1, 1,
0.8548098, -1.376233, 0.9753492, 1, 0, 0, 1, 1,
0.8614153, 0.4507121, -0.8127699, 1, 0, 0, 1, 1,
0.8667889, 0.9101419, 2.62904, 0, 0, 0, 1, 1,
0.8687043, -1.149543, 1.149421, 0, 0, 0, 1, 1,
0.8698916, 1.546279, 2.322053, 0, 0, 0, 1, 1,
0.8728691, 1.244692, 1.30797, 0, 0, 0, 1, 1,
0.8769203, 0.4873407, 0.1076277, 0, 0, 0, 1, 1,
0.8783283, 1.601057, 0.8998675, 0, 0, 0, 1, 1,
0.8806809, 0.01397171, 0.4273839, 0, 0, 0, 1, 1,
0.8980892, 0.3453788, 0.8721277, 1, 1, 1, 1, 1,
0.9081755, -0.0978893, -0.587019, 1, 1, 1, 1, 1,
0.9099579, -1.288254, 2.470798, 1, 1, 1, 1, 1,
0.9116632, -1.277253, 1.93253, 1, 1, 1, 1, 1,
0.9137268, -1.560591, 0.3838796, 1, 1, 1, 1, 1,
0.9169584, -0.5789785, 2.511307, 1, 1, 1, 1, 1,
0.9185416, -1.917715, 2.154559, 1, 1, 1, 1, 1,
0.9186772, 0.048643, 1.485261, 1, 1, 1, 1, 1,
0.924621, 0.7320983, 2.634712, 1, 1, 1, 1, 1,
0.9332652, 0.3746116, 0.5016665, 1, 1, 1, 1, 1,
0.9349823, 0.4976986, 1.458862, 1, 1, 1, 1, 1,
0.9559596, -0.3593342, 0.8612481, 1, 1, 1, 1, 1,
0.9583806, -0.1459487, 3.428117, 1, 1, 1, 1, 1,
0.9593573, 0.1143503, 3.091465, 1, 1, 1, 1, 1,
0.9671578, 0.6265737, 0.5674406, 1, 1, 1, 1, 1,
0.9731576, 2.222204, -0.6307161, 0, 0, 1, 1, 1,
0.98039, 0.7531361, 1.037571, 1, 0, 0, 1, 1,
0.9806961, -0.2624496, 0.2082096, 1, 0, 0, 1, 1,
0.996016, -0.8424312, 3.03089, 1, 0, 0, 1, 1,
0.9968709, 1.934928, 0.2877967, 1, 0, 0, 1, 1,
0.9974741, 0.3054493, 3.043175, 1, 0, 0, 1, 1,
0.9981257, 1.706673, 1.36709, 0, 0, 0, 1, 1,
0.9998235, -0.07376484, 1.933899, 0, 0, 0, 1, 1,
1.000438, -0.7130318, 5.771056, 0, 0, 0, 1, 1,
1.007683, -0.5396675, 1.568573, 0, 0, 0, 1, 1,
1.020148, -2.325377, 2.302705, 0, 0, 0, 1, 1,
1.031151, -1.040813, 3.502349, 0, 0, 0, 1, 1,
1.037608, -1.305941, 1.96338, 0, 0, 0, 1, 1,
1.037859, 0.9142971, 1.437391, 1, 1, 1, 1, 1,
1.049508, 0.03518251, 1.822966, 1, 1, 1, 1, 1,
1.055276, -0.8971864, 2.481625, 1, 1, 1, 1, 1,
1.057374, 0.5953605, -0.05011144, 1, 1, 1, 1, 1,
1.057916, 0.1925723, 1.170599, 1, 1, 1, 1, 1,
1.06671, -1.038428, 0.3023413, 1, 1, 1, 1, 1,
1.069907, 0.281485, 2.226384, 1, 1, 1, 1, 1,
1.07157, -0.07538918, 2.363477, 1, 1, 1, 1, 1,
1.075154, -0.1715598, 0.8680101, 1, 1, 1, 1, 1,
1.082168, -0.5736796, 2.447308, 1, 1, 1, 1, 1,
1.084388, 1.253582, 0.3783637, 1, 1, 1, 1, 1,
1.103431, 0.5283712, 0.4230244, 1, 1, 1, 1, 1,
1.105511, 0.255655, 0.611682, 1, 1, 1, 1, 1,
1.105871, 1.020893, 0.7214456, 1, 1, 1, 1, 1,
1.109988, 0.3148575, -0.004387596, 1, 1, 1, 1, 1,
1.112217, 1.234289, -0.5467101, 0, 0, 1, 1, 1,
1.113187, 0.1735814, 2.459887, 1, 0, 0, 1, 1,
1.117358, 0.6608006, 1.613814, 1, 0, 0, 1, 1,
1.11799, -0.7928958, 1.894511, 1, 0, 0, 1, 1,
1.119668, 0.4763179, 2.000158, 1, 0, 0, 1, 1,
1.124105, 0.4699288, 0.6258327, 1, 0, 0, 1, 1,
1.125182, -0.6309277, 1.8998, 0, 0, 0, 1, 1,
1.127976, 0.1417623, 1.476154, 0, 0, 0, 1, 1,
1.131244, -2.976514, 2.127654, 0, 0, 0, 1, 1,
1.135613, -0.1505988, 1.051156, 0, 0, 0, 1, 1,
1.149762, 0.344747, 0.5024087, 0, 0, 0, 1, 1,
1.152983, -1.300883, 2.255742, 0, 0, 0, 1, 1,
1.154209, -0.4864339, 0.7766376, 0, 0, 0, 1, 1,
1.161993, 1.588851, 0.0004307151, 1, 1, 1, 1, 1,
1.164899, 1.489455, 0.7417525, 1, 1, 1, 1, 1,
1.17152, -0.5467224, 2.022128, 1, 1, 1, 1, 1,
1.185187, 1.91235, -0.1595404, 1, 1, 1, 1, 1,
1.187876, -0.3321096, 1.178159, 1, 1, 1, 1, 1,
1.189237, 0.1415884, 2.396749, 1, 1, 1, 1, 1,
1.193004, -1.203465, 1.251763, 1, 1, 1, 1, 1,
1.195616, -1.136983, 2.723987, 1, 1, 1, 1, 1,
1.199068, 2.424446, 0.7718093, 1, 1, 1, 1, 1,
1.20376, -0.5954269, 2.330963, 1, 1, 1, 1, 1,
1.210877, 1.919378, 0.3422723, 1, 1, 1, 1, 1,
1.216375, 0.6830037, 1.30806, 1, 1, 1, 1, 1,
1.226594, 0.9685154, 2.358896, 1, 1, 1, 1, 1,
1.226727, 1.109152, -0.4235573, 1, 1, 1, 1, 1,
1.228011, 0.4544123, -0.327397, 1, 1, 1, 1, 1,
1.228754, -1.566541, 3.189464, 0, 0, 1, 1, 1,
1.241016, 0.5675623, 0.08286647, 1, 0, 0, 1, 1,
1.248367, 0.4920447, 1.091732, 1, 0, 0, 1, 1,
1.252161, -0.6414297, 0.7829592, 1, 0, 0, 1, 1,
1.256634, 0.5393654, 0.3859874, 1, 0, 0, 1, 1,
1.258188, -0.1209788, 2.279493, 1, 0, 0, 1, 1,
1.268137, -0.9040176, 3.814047, 0, 0, 0, 1, 1,
1.270257, -1.291975, 2.610168, 0, 0, 0, 1, 1,
1.274336, 1.261303, -0.0251514, 0, 0, 0, 1, 1,
1.277794, 1.397935, 1.138268, 0, 0, 0, 1, 1,
1.295123, -1.04976, 2.016231, 0, 0, 0, 1, 1,
1.298236, -0.7722397, 1.589909, 0, 0, 0, 1, 1,
1.314844, -1.792857, 2.596423, 0, 0, 0, 1, 1,
1.320581, 0.3514445, 0.5314572, 1, 1, 1, 1, 1,
1.331787, 0.5385777, -0.4155155, 1, 1, 1, 1, 1,
1.335208, 0.2445718, 0.6446596, 1, 1, 1, 1, 1,
1.341076, -2.535831, -0.1154201, 1, 1, 1, 1, 1,
1.341829, 0.5433087, 1.462276, 1, 1, 1, 1, 1,
1.349678, -0.1923318, 0.3934788, 1, 1, 1, 1, 1,
1.350598, 0.6887697, 0.596691, 1, 1, 1, 1, 1,
1.354419, 0.7136807, 2.512333, 1, 1, 1, 1, 1,
1.355159, 1.682528, 0.06969824, 1, 1, 1, 1, 1,
1.360131, 0.7985879, 0.562807, 1, 1, 1, 1, 1,
1.366472, 0.7334018, 0.4675109, 1, 1, 1, 1, 1,
1.372189, -1.508053, 2.672547, 1, 1, 1, 1, 1,
1.375691, 0.3297082, 2.551028, 1, 1, 1, 1, 1,
1.378224, -0.1645889, -0.3447298, 1, 1, 1, 1, 1,
1.382512, -0.5681049, 1.677143, 1, 1, 1, 1, 1,
1.383143, -1.407204, 1.115642, 0, 0, 1, 1, 1,
1.38317, -2.002023, 2.475539, 1, 0, 0, 1, 1,
1.384129, 0.9586793, 2.881706, 1, 0, 0, 1, 1,
1.389994, 0.7202847, 1.061774, 1, 0, 0, 1, 1,
1.390979, -0.2849128, 3.097646, 1, 0, 0, 1, 1,
1.394404, 1.312001, 1.839163, 1, 0, 0, 1, 1,
1.396599, -1.275678, 2.800455, 0, 0, 0, 1, 1,
1.400726, -0.3362797, 2.523247, 0, 0, 0, 1, 1,
1.407934, 0.4589826, -0.006808229, 0, 0, 0, 1, 1,
1.408322, -0.4684511, 2.134978, 0, 0, 0, 1, 1,
1.424315, 1.747729, 0.9021369, 0, 0, 0, 1, 1,
1.429029, -0.8178166, 2.249647, 0, 0, 0, 1, 1,
1.440779, -0.7573414, 1.068892, 0, 0, 0, 1, 1,
1.442594, -0.24836, 2.924866, 1, 1, 1, 1, 1,
1.453373, -0.4780552, 3.119264, 1, 1, 1, 1, 1,
1.456521, 0.03771849, 3.751179, 1, 1, 1, 1, 1,
1.46467, -0.2283646, 2.420225, 1, 1, 1, 1, 1,
1.469849, 1.25438, 1.342332, 1, 1, 1, 1, 1,
1.491279, 0.9694749, 1.989953, 1, 1, 1, 1, 1,
1.498104, -0.4056788, 1.221259, 1, 1, 1, 1, 1,
1.501713, -1.273892, 3.482666, 1, 1, 1, 1, 1,
1.502045, 0.6831452, -0.1460438, 1, 1, 1, 1, 1,
1.519576, 0.5038831, 2.171311, 1, 1, 1, 1, 1,
1.521933, -1.110257, 3.228419, 1, 1, 1, 1, 1,
1.523205, 0.334347, 1.669579, 1, 1, 1, 1, 1,
1.53419, 1.065078, 0.8790635, 1, 1, 1, 1, 1,
1.541514, -0.8742477, 4.252131, 1, 1, 1, 1, 1,
1.546647, 0.4209586, 1.197607, 1, 1, 1, 1, 1,
1.547295, 0.9025558, 0.9892195, 0, 0, 1, 1, 1,
1.548103, 0.2273405, 2.001721, 1, 0, 0, 1, 1,
1.551579, -0.9358905, 2.696461, 1, 0, 0, 1, 1,
1.556459, 0.4342244, 0.8641372, 1, 0, 0, 1, 1,
1.582011, 0.2517585, -0.6648852, 1, 0, 0, 1, 1,
1.585396, -0.6644346, 2.381374, 1, 0, 0, 1, 1,
1.585423, -1.797278, 2.329245, 0, 0, 0, 1, 1,
1.596666, -0.2228875, 2.236558, 0, 0, 0, 1, 1,
1.605471, 0.1626998, 2.668443, 0, 0, 0, 1, 1,
1.631373, 0.5947815, 2.055808, 0, 0, 0, 1, 1,
1.639089, 1.725032, 1.789157, 0, 0, 0, 1, 1,
1.653403, 0.9058551, -0.6289181, 0, 0, 0, 1, 1,
1.65578, -0.5524696, 1.381238, 0, 0, 0, 1, 1,
1.656312, 0.4672741, 1.891843, 1, 1, 1, 1, 1,
1.656912, -1.780273, 2.324108, 1, 1, 1, 1, 1,
1.659258, -0.1290988, 1.779499, 1, 1, 1, 1, 1,
1.677913, 0.8083213, 1.381558, 1, 1, 1, 1, 1,
1.70564, 0.8676822, 1.42045, 1, 1, 1, 1, 1,
1.717136, -0.9444109, 2.229673, 1, 1, 1, 1, 1,
1.73149, 0.1254356, 2.212959, 1, 1, 1, 1, 1,
1.732391, 0.6000629, 1.384392, 1, 1, 1, 1, 1,
1.737875, 0.4871944, 0.8491799, 1, 1, 1, 1, 1,
1.742638, 1.516375, -0.7677731, 1, 1, 1, 1, 1,
1.752243, 1.327666, 0.268707, 1, 1, 1, 1, 1,
1.766827, -0.9837463, 2.235551, 1, 1, 1, 1, 1,
1.769294, -1.333731, 3.431466, 1, 1, 1, 1, 1,
1.798909, -1.652126, 1.004404, 1, 1, 1, 1, 1,
1.805553, 0.001754994, 1.286748, 1, 1, 1, 1, 1,
1.80919, 1.589757, 0.2026268, 0, 0, 1, 1, 1,
1.814676, 2.828332, -1.983637, 1, 0, 0, 1, 1,
1.819655, 0.1874176, 1.21387, 1, 0, 0, 1, 1,
1.832295, -0.2466771, 2.581378, 1, 0, 0, 1, 1,
1.886354, -0.2125739, 3.032824, 1, 0, 0, 1, 1,
1.894481, 0.2036303, -0.00766377, 1, 0, 0, 1, 1,
1.8948, 0.2539846, 1.774401, 0, 0, 0, 1, 1,
1.912954, -2.450433, 2.035939, 0, 0, 0, 1, 1,
1.925903, 0.9025738, -1.120111, 0, 0, 0, 1, 1,
1.931435, 0.3088935, 1.289972, 0, 0, 0, 1, 1,
1.93855, -0.1308624, 0.2369937, 0, 0, 0, 1, 1,
1.939572, -0.8184467, 2.299069, 0, 0, 0, 1, 1,
1.950181, -0.4575405, 2.802876, 0, 0, 0, 1, 1,
1.952898, -0.04463667, 2.372777, 1, 1, 1, 1, 1,
1.958616, -1.468773, 1.049908, 1, 1, 1, 1, 1,
1.967014, -0.06670117, 2.062376, 1, 1, 1, 1, 1,
1.973441, -0.85761, 2.026493, 1, 1, 1, 1, 1,
1.973767, -0.4437525, 1.586288, 1, 1, 1, 1, 1,
1.97422, 1.080469, 0.9312322, 1, 1, 1, 1, 1,
1.977087, -0.7746298, 2.383072, 1, 1, 1, 1, 1,
1.988633, -0.7513345, 1.285813, 1, 1, 1, 1, 1,
2.016483, 0.05764611, -0.4654396, 1, 1, 1, 1, 1,
2.025639, -0.1223097, 3.257781, 1, 1, 1, 1, 1,
2.037963, 0.6115528, 0.8627868, 1, 1, 1, 1, 1,
2.050758, -0.8725273, 1.871485, 1, 1, 1, 1, 1,
2.055189, -1.085571, 1.513942, 1, 1, 1, 1, 1,
2.079098, 0.1615406, 1.879218, 1, 1, 1, 1, 1,
2.089845, -1.694811, 2.144299, 1, 1, 1, 1, 1,
2.132088, 0.7842956, 1.14215, 0, 0, 1, 1, 1,
2.137466, -0.5882252, 2.795942, 1, 0, 0, 1, 1,
2.21038, 0.3411379, 2.613687, 1, 0, 0, 1, 1,
2.236965, 0.9480131, 1.338336, 1, 0, 0, 1, 1,
2.240435, 1.261951, 1.935831, 1, 0, 0, 1, 1,
2.259265, -0.3809924, 3.991142, 1, 0, 0, 1, 1,
2.274427, 0.2106571, 0.8682637, 0, 0, 0, 1, 1,
2.286982, 1.41842, 1.335852, 0, 0, 0, 1, 1,
2.352813, 0.886031, 1.264985, 0, 0, 0, 1, 1,
2.354328, -0.8305522, 2.707493, 0, 0, 0, 1, 1,
2.452866, -0.1687703, 1.570388, 0, 0, 0, 1, 1,
2.474648, -2.38099, 2.047465, 0, 0, 0, 1, 1,
2.506756, -0.5646433, 0.578907, 0, 0, 0, 1, 1,
2.51984, -1.745154, 4.217013, 1, 1, 1, 1, 1,
2.629687, -0.4954282, 1.280563, 1, 1, 1, 1, 1,
2.770182, -0.4009799, 2.433451, 1, 1, 1, 1, 1,
2.862574, 1.069924, 2.421898, 1, 1, 1, 1, 1,
3.066287, -0.6470146, 1.955533, 1, 1, 1, 1, 1,
3.344222, -0.444847, 1.293424, 1, 1, 1, 1, 1,
3.402251, -1.13459, 2.173563, 1, 1, 1, 1, 1
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
var radius = 9.741697;
var distance = 34.2173;
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
mvMatrix.translate( 0.06046963, -0.02073097, -0.3323467 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.2173);
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
