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
-2.884855, -0.5236393, -2.868076, 1, 0, 0, 1,
-2.872067, -0.05463854, -3.163348, 1, 0.007843138, 0, 1,
-2.85064, 1.227706, -4.647127, 1, 0.01176471, 0, 1,
-2.820539, 0.887182, -2.569541, 1, 0.01960784, 0, 1,
-2.737144, 1.625217, -2.003004, 1, 0.02352941, 0, 1,
-2.683478, -1.123499, -1.38083, 1, 0.03137255, 0, 1,
-2.525232, 2.204826, -1.958945, 1, 0.03529412, 0, 1,
-2.40476, -0.5251375, -1.784786, 1, 0.04313726, 0, 1,
-2.40453, 0.5850912, -1.944694, 1, 0.04705882, 0, 1,
-2.360845, -1.102803, -2.983703, 1, 0.05490196, 0, 1,
-2.360005, -1.735495, -3.799489, 1, 0.05882353, 0, 1,
-2.332734, 0.5922092, -0.1153267, 1, 0.06666667, 0, 1,
-2.249146, 0.870872, 0.2655692, 1, 0.07058824, 0, 1,
-2.223346, 2.145939, -1.671673, 1, 0.07843138, 0, 1,
-2.155805, -0.03258776, -1.751929, 1, 0.08235294, 0, 1,
-2.106321, -0.8892047, -1.585575, 1, 0.09019608, 0, 1,
-2.105044, 0.6101391, -0.6345499, 1, 0.09411765, 0, 1,
-2.101383, -0.2403608, -2.669817, 1, 0.1019608, 0, 1,
-2.09115, -1.661404, -3.392436, 1, 0.1098039, 0, 1,
-2.080228, -1.014656, -2.742404, 1, 0.1137255, 0, 1,
-2.068704, 0.5823685, -0.3431861, 1, 0.1215686, 0, 1,
-2.057561, -0.4665093, -1.989552, 1, 0.1254902, 0, 1,
-2.031412, -0.1387687, -2.518037, 1, 0.1333333, 0, 1,
-2.01074, -0.2455148, -2.157525, 1, 0.1372549, 0, 1,
-1.999222, 0.835895, -1.466167, 1, 0.145098, 0, 1,
-1.975516, -1.250021, -0.7205414, 1, 0.1490196, 0, 1,
-1.967022, -0.09862505, -2.996827, 1, 0.1568628, 0, 1,
-1.943874, 0.3934921, -0.5863682, 1, 0.1607843, 0, 1,
-1.941568, -0.4070809, -2.415966, 1, 0.1686275, 0, 1,
-1.936582, 0.7008014, -0.636986, 1, 0.172549, 0, 1,
-1.936366, -0.9456124, -2.25609, 1, 0.1803922, 0, 1,
-1.900328, 0.2901608, -0.6722326, 1, 0.1843137, 0, 1,
-1.88186, -1.036614, -2.457302, 1, 0.1921569, 0, 1,
-1.871426, 1.046397, -1.836075, 1, 0.1960784, 0, 1,
-1.868259, 1.171389, -2.038142, 1, 0.2039216, 0, 1,
-1.865031, -0.3780226, -1.325067, 1, 0.2117647, 0, 1,
-1.859751, -2.09166, -2.406809, 1, 0.2156863, 0, 1,
-1.816069, 0.2260182, -0.6745439, 1, 0.2235294, 0, 1,
-1.813115, 2.329552, -1.402098, 1, 0.227451, 0, 1,
-1.806869, 0.03428117, -3.793824, 1, 0.2352941, 0, 1,
-1.805154, -2.204504, -0.6524512, 1, 0.2392157, 0, 1,
-1.800423, -0.8503948, -1.837005, 1, 0.2470588, 0, 1,
-1.793435, -2.555347, -1.49719, 1, 0.2509804, 0, 1,
-1.79232, -0.3955047, -1.347023, 1, 0.2588235, 0, 1,
-1.789817, -0.9602421, -0.7254018, 1, 0.2627451, 0, 1,
-1.775829, 0.05898533, -0.2597533, 1, 0.2705882, 0, 1,
-1.761268, -0.4773578, -2.71218, 1, 0.2745098, 0, 1,
-1.747519, -1.580896, -4.168243, 1, 0.282353, 0, 1,
-1.747136, 2.962272, -0.2693712, 1, 0.2862745, 0, 1,
-1.744415, 0.08238973, -1.570183, 1, 0.2941177, 0, 1,
-1.734325, -1.706089, -1.026562, 1, 0.3019608, 0, 1,
-1.732089, 1.739849, -0.4796766, 1, 0.3058824, 0, 1,
-1.728694, -1.371339, -1.254946, 1, 0.3137255, 0, 1,
-1.727574, 0.2342114, -1.182452, 1, 0.3176471, 0, 1,
-1.720427, 1.071234, -1.16631, 1, 0.3254902, 0, 1,
-1.717314, 2.201744, -0.4583128, 1, 0.3294118, 0, 1,
-1.704908, -0.4204205, -1.425595, 1, 0.3372549, 0, 1,
-1.703681, 0.1398934, -1.342703, 1, 0.3411765, 0, 1,
-1.702607, -0.9365376, -2.413755, 1, 0.3490196, 0, 1,
-1.680694, -2.172932, -0.3940718, 1, 0.3529412, 0, 1,
-1.675695, 1.315122, -1.286547, 1, 0.3607843, 0, 1,
-1.674765, 0.7384179, -3.156591, 1, 0.3647059, 0, 1,
-1.661931, 1.137871, -0.9699461, 1, 0.372549, 0, 1,
-1.651797, 1.227832, -1.038225, 1, 0.3764706, 0, 1,
-1.635668, -0.4897335, -0.9655656, 1, 0.3843137, 0, 1,
-1.628605, -0.6876583, -2.676679, 1, 0.3882353, 0, 1,
-1.628005, -1.154542, -2.987057, 1, 0.3960784, 0, 1,
-1.615874, -0.1047884, -0.6281937, 1, 0.4039216, 0, 1,
-1.60709, -1.680996, -3.353345, 1, 0.4078431, 0, 1,
-1.595022, 1.446836, -1.520658, 1, 0.4156863, 0, 1,
-1.585214, -0.4403511, -1.032871, 1, 0.4196078, 0, 1,
-1.584742, -0.3619367, -1.381603, 1, 0.427451, 0, 1,
-1.565583, -1.167704, -4.173703, 1, 0.4313726, 0, 1,
-1.564908, 1.011319, -2.302501, 1, 0.4392157, 0, 1,
-1.548769, -0.2799922, -1.47816, 1, 0.4431373, 0, 1,
-1.545882, 1.171174, -0.2743419, 1, 0.4509804, 0, 1,
-1.542043, 0.1328747, -2.112695, 1, 0.454902, 0, 1,
-1.523214, 0.2141067, -1.011628, 1, 0.4627451, 0, 1,
-1.504947, 0.8508636, -0.8190322, 1, 0.4666667, 0, 1,
-1.496261, -0.9884971, -2.857646, 1, 0.4745098, 0, 1,
-1.492079, -0.7009468, -1.940957, 1, 0.4784314, 0, 1,
-1.48939, 0.6715968, 0.8610172, 1, 0.4862745, 0, 1,
-1.480625, 1.194605, -1.37505, 1, 0.4901961, 0, 1,
-1.480157, 1.264951, -0.7737976, 1, 0.4980392, 0, 1,
-1.477946, -0.1393028, -3.398444, 1, 0.5058824, 0, 1,
-1.449731, -0.5346265, -1.256066, 1, 0.509804, 0, 1,
-1.441115, 1.093227, -0.2266215, 1, 0.5176471, 0, 1,
-1.416694, -0.4655049, -1.819597, 1, 0.5215687, 0, 1,
-1.398578, 1.083506, 2.293209, 1, 0.5294118, 0, 1,
-1.392128, 1.406235, -0.9316837, 1, 0.5333334, 0, 1,
-1.392075, 0.5872264, -1.46078, 1, 0.5411765, 0, 1,
-1.388894, -0.4480431, -0.8584661, 1, 0.5450981, 0, 1,
-1.386903, -0.2869236, -2.18698, 1, 0.5529412, 0, 1,
-1.37829, 0.379587, -1.520382, 1, 0.5568628, 0, 1,
-1.376323, -0.6492468, -3.397357, 1, 0.5647059, 0, 1,
-1.375589, 0.100319, -1.291488, 1, 0.5686275, 0, 1,
-1.375323, 0.1616552, -2.786088, 1, 0.5764706, 0, 1,
-1.374156, 0.2036671, 0.8098708, 1, 0.5803922, 0, 1,
-1.373531, 1.502515, -0.4346987, 1, 0.5882353, 0, 1,
-1.359624, 0.9159227, -1.634086, 1, 0.5921569, 0, 1,
-1.311768, 1.285118, -1.289032, 1, 0.6, 0, 1,
-1.308708, -0.2402191, -0.9651017, 1, 0.6078432, 0, 1,
-1.306516, -0.2259764, -3.19233, 1, 0.6117647, 0, 1,
-1.297938, -0.3232048, -2.916285, 1, 0.6196079, 0, 1,
-1.29597, -0.07650121, -2.512667, 1, 0.6235294, 0, 1,
-1.29568, -0.4622661, -3.323241, 1, 0.6313726, 0, 1,
-1.295171, -0.6171736, -3.713364, 1, 0.6352941, 0, 1,
-1.289337, 1.182418, -1.097901, 1, 0.6431373, 0, 1,
-1.272047, 0.1089104, -2.151638, 1, 0.6470588, 0, 1,
-1.265995, -1.647959, -2.359563, 1, 0.654902, 0, 1,
-1.264022, 1.194431, 0.3426394, 1, 0.6588235, 0, 1,
-1.251547, -0.304102, -1.991469, 1, 0.6666667, 0, 1,
-1.240837, 1.147558, -2.282553, 1, 0.6705883, 0, 1,
-1.237844, -0.3946208, -1.576057, 1, 0.6784314, 0, 1,
-1.236781, -1.174281, -1.467576, 1, 0.682353, 0, 1,
-1.236439, -0.4785868, -3.03995, 1, 0.6901961, 0, 1,
-1.235073, -0.6242189, -1.663703, 1, 0.6941177, 0, 1,
-1.234993, 0.1850666, -2.536384, 1, 0.7019608, 0, 1,
-1.224365, 1.274136, 1.370321, 1, 0.7098039, 0, 1,
-1.216542, -2.093076, -4.018267, 1, 0.7137255, 0, 1,
-1.214348, -0.8849733, -1.8095, 1, 0.7215686, 0, 1,
-1.214001, -0.7679414, -1.786162, 1, 0.7254902, 0, 1,
-1.208371, -0.8623848, -3.736988, 1, 0.7333333, 0, 1,
-1.181412, -0.71313, -1.989156, 1, 0.7372549, 0, 1,
-1.179899, 1.13217, -1.370122, 1, 0.7450981, 0, 1,
-1.177279, 1.860602, -1.54569, 1, 0.7490196, 0, 1,
-1.17481, 0.2076809, -2.246746, 1, 0.7568628, 0, 1,
-1.174329, 1.289273, -2.468955, 1, 0.7607843, 0, 1,
-1.168947, -0.9983385, -1.88083, 1, 0.7686275, 0, 1,
-1.166202, 0.7145436, -0.445494, 1, 0.772549, 0, 1,
-1.164688, -0.1912978, -0.3813259, 1, 0.7803922, 0, 1,
-1.162151, 0.492731, -1.539237, 1, 0.7843137, 0, 1,
-1.144046, -1.898562, -3.419196, 1, 0.7921569, 0, 1,
-1.139431, 0.5833718, -0.7796051, 1, 0.7960784, 0, 1,
-1.137483, -0.7082663, -1.3541, 1, 0.8039216, 0, 1,
-1.13665, 0.4463753, -0.1337296, 1, 0.8117647, 0, 1,
-1.128949, -0.6069331, -1.178127, 1, 0.8156863, 0, 1,
-1.127321, -1.787746, -4.100507, 1, 0.8235294, 0, 1,
-1.125674, -0.4747897, -1.079026, 1, 0.827451, 0, 1,
-1.125465, 1.363167, -1.979292, 1, 0.8352941, 0, 1,
-1.116475, -0.7805682, -2.892557, 1, 0.8392157, 0, 1,
-1.110108, 0.04086834, -1.026654, 1, 0.8470588, 0, 1,
-1.103684, 1.786652, -2.817564, 1, 0.8509804, 0, 1,
-1.098265, -1.123639, -2.812593, 1, 0.8588235, 0, 1,
-1.089643, -0.5497254, -2.605762, 1, 0.8627451, 0, 1,
-1.087866, -0.9872453, -2.658811, 1, 0.8705882, 0, 1,
-1.085421, 0.5293351, 1.160798, 1, 0.8745098, 0, 1,
-1.071869, -2.209445, -3.368843, 1, 0.8823529, 0, 1,
-1.059212, -0.08238053, -0.8587926, 1, 0.8862745, 0, 1,
-1.057908, 0.1831043, -0.68404, 1, 0.8941177, 0, 1,
-1.054167, 1.733699, 0.117662, 1, 0.8980392, 0, 1,
-1.052411, 0.4113439, -0.2732558, 1, 0.9058824, 0, 1,
-1.049439, 0.7082338, -1.201781, 1, 0.9137255, 0, 1,
-1.048184, 0.9413004, -0.07766099, 1, 0.9176471, 0, 1,
-1.045729, 1.944797, -0.7174025, 1, 0.9254902, 0, 1,
-1.043033, 0.3737698, 1.508561, 1, 0.9294118, 0, 1,
-1.041516, -1.113045, -3.48794, 1, 0.9372549, 0, 1,
-1.038944, 1.123224, -2.212, 1, 0.9411765, 0, 1,
-1.036798, 1.119517, -1.259647, 1, 0.9490196, 0, 1,
-1.029103, -0.6654674, 0.1432468, 1, 0.9529412, 0, 1,
-1.028729, -0.0246666, -0.100871, 1, 0.9607843, 0, 1,
-1.024126, -0.2808819, -2.115401, 1, 0.9647059, 0, 1,
-1.022718, 0.6571518, -1.441451, 1, 0.972549, 0, 1,
-1.018165, -1.509631, -2.724359, 1, 0.9764706, 0, 1,
-1.016467, 0.5017759, -0.01827638, 1, 0.9843137, 0, 1,
-1.013101, -1.387689, -2.397946, 1, 0.9882353, 0, 1,
-1.003246, 0.1127178, -1.82974, 1, 0.9960784, 0, 1,
-0.9911966, -1.818992, -1.419507, 0.9960784, 1, 0, 1,
-0.986695, 0.4854493, -0.1916606, 0.9921569, 1, 0, 1,
-0.9848701, 0.5507473, -1.691889, 0.9843137, 1, 0, 1,
-0.9723364, 0.2874933, -2.841454, 0.9803922, 1, 0, 1,
-0.9703542, 0.8193319, -2.051151, 0.972549, 1, 0, 1,
-0.9670618, 0.8458784, -0.06299473, 0.9686275, 1, 0, 1,
-0.9619398, -0.3412963, -1.032934, 0.9607843, 1, 0, 1,
-0.9448748, -0.4912398, -2.31761, 0.9568627, 1, 0, 1,
-0.9440675, -0.9200597, -0.4900516, 0.9490196, 1, 0, 1,
-0.9399403, 0.06932657, -1.483081, 0.945098, 1, 0, 1,
-0.9378918, 0.9862832, -1.259648, 0.9372549, 1, 0, 1,
-0.9354248, -1.481905, -3.727528, 0.9333333, 1, 0, 1,
-0.9294979, -0.5600768, -2.367316, 0.9254902, 1, 0, 1,
-0.9294376, 0.8247313, -0.3673476, 0.9215686, 1, 0, 1,
-0.9234669, -0.3199492, -1.349267, 0.9137255, 1, 0, 1,
-0.9232018, -1.849928, -1.687401, 0.9098039, 1, 0, 1,
-0.9228071, 0.3844081, -1.199679, 0.9019608, 1, 0, 1,
-0.9217837, 0.8768009, 0.1079855, 0.8941177, 1, 0, 1,
-0.9196796, 0.1073012, -0.8382781, 0.8901961, 1, 0, 1,
-0.9195976, -0.1443198, -2.514439, 0.8823529, 1, 0, 1,
-0.919545, 1.744598, 1.115354, 0.8784314, 1, 0, 1,
-0.9156591, -1.109487, -0.8399817, 0.8705882, 1, 0, 1,
-0.9145683, 0.2869811, -3.018714, 0.8666667, 1, 0, 1,
-0.9115912, -1.343521, -0.4793962, 0.8588235, 1, 0, 1,
-0.9074755, 0.2311224, -2.117738, 0.854902, 1, 0, 1,
-0.9017484, -0.3066128, -2.790345, 0.8470588, 1, 0, 1,
-0.900571, 0.4457261, -0.734821, 0.8431373, 1, 0, 1,
-0.8976485, -0.4826194, -1.671529, 0.8352941, 1, 0, 1,
-0.8974121, -1.571675, -2.615815, 0.8313726, 1, 0, 1,
-0.8868318, 0.30558, -1.396673, 0.8235294, 1, 0, 1,
-0.8823929, -1.00247, -4.959087, 0.8196079, 1, 0, 1,
-0.876981, 0.1582546, 0.005016602, 0.8117647, 1, 0, 1,
-0.8751727, 0.2218667, 0.4243008, 0.8078431, 1, 0, 1,
-0.8655277, 1.247398, -0.1584586, 0.8, 1, 0, 1,
-0.8641077, -0.2137046, 0.8498015, 0.7921569, 1, 0, 1,
-0.8638748, -0.9059258, -2.886394, 0.7882353, 1, 0, 1,
-0.8603212, 0.2070597, -1.807764, 0.7803922, 1, 0, 1,
-0.8603153, -1.908276, -2.04692, 0.7764706, 1, 0, 1,
-0.8602351, 0.808488, -0.5466424, 0.7686275, 1, 0, 1,
-0.8506721, 1.828005, 0.22036, 0.7647059, 1, 0, 1,
-0.8487172, -0.3575633, -1.673361, 0.7568628, 1, 0, 1,
-0.8460895, -0.5916525, -2.630862, 0.7529412, 1, 0, 1,
-0.843118, 0.258596, -1.984548, 0.7450981, 1, 0, 1,
-0.8378494, -0.8902384, -3.784598, 0.7411765, 1, 0, 1,
-0.8374149, 0.575985, -1.788868, 0.7333333, 1, 0, 1,
-0.8360924, 0.01372894, -2.045748, 0.7294118, 1, 0, 1,
-0.8333861, 1.3863, 0.8396144, 0.7215686, 1, 0, 1,
-0.8312826, 1.210014, 0.1683543, 0.7176471, 1, 0, 1,
-0.8300684, -0.2190663, -2.634989, 0.7098039, 1, 0, 1,
-0.8267793, 0.6902034, -0.2549724, 0.7058824, 1, 0, 1,
-0.8248518, 0.1505615, -2.044086, 0.6980392, 1, 0, 1,
-0.8241397, 3.439475, -0.4159647, 0.6901961, 1, 0, 1,
-0.8231379, -1.954735, -1.845955, 0.6862745, 1, 0, 1,
-0.8223957, -0.4351427, -1.589352, 0.6784314, 1, 0, 1,
-0.8145755, -1.540642, -2.140788, 0.6745098, 1, 0, 1,
-0.8143129, -0.6639776, -2.173406, 0.6666667, 1, 0, 1,
-0.8117121, 0.9366845, -1.918667, 0.6627451, 1, 0, 1,
-0.8074858, 1.84365, -0.9290286, 0.654902, 1, 0, 1,
-0.8056717, 0.8369826, -2.093303, 0.6509804, 1, 0, 1,
-0.8028636, -0.3968988, -0.5882261, 0.6431373, 1, 0, 1,
-0.7998598, -0.3586381, -3.083147, 0.6392157, 1, 0, 1,
-0.7982386, 1.686921, -2.031724, 0.6313726, 1, 0, 1,
-0.7944044, -0.5606713, -2.130538, 0.627451, 1, 0, 1,
-0.7927621, 0.8223264, -1.212214, 0.6196079, 1, 0, 1,
-0.7918347, 0.3196237, -0.9451148, 0.6156863, 1, 0, 1,
-0.79048, 1.480541, 0.5308614, 0.6078432, 1, 0, 1,
-0.7887014, -1.661025, -3.67289, 0.6039216, 1, 0, 1,
-0.7886589, -0.4424216, -0.9204208, 0.5960785, 1, 0, 1,
-0.7878479, 0.6860192, -0.8552723, 0.5882353, 1, 0, 1,
-0.7876935, 0.7779377, -0.7851104, 0.5843138, 1, 0, 1,
-0.7836786, 1.337402, -0.7519892, 0.5764706, 1, 0, 1,
-0.7793501, 0.531735, -0.5494601, 0.572549, 1, 0, 1,
-0.7535418, 0.3418996, -2.066723, 0.5647059, 1, 0, 1,
-0.7503824, 0.3584825, -2.367167, 0.5607843, 1, 0, 1,
-0.7489241, 0.9607145, 0.905793, 0.5529412, 1, 0, 1,
-0.7436002, -0.4880593, -1.317008, 0.5490196, 1, 0, 1,
-0.7433229, -0.7430983, -1.719184, 0.5411765, 1, 0, 1,
-0.7410404, -1.08408, -2.48125, 0.5372549, 1, 0, 1,
-0.7408384, 0.6423781, -1.418031, 0.5294118, 1, 0, 1,
-0.7367811, 0.3535175, -1.360773, 0.5254902, 1, 0, 1,
-0.7359574, -0.2810771, -3.852543, 0.5176471, 1, 0, 1,
-0.7281865, -0.3360119, -1.456129, 0.5137255, 1, 0, 1,
-0.727844, 1.154849, -0.606391, 0.5058824, 1, 0, 1,
-0.7274551, -0.6180195, -2.500712, 0.5019608, 1, 0, 1,
-0.7253699, -0.5847587, -2.095756, 0.4941176, 1, 0, 1,
-0.7217541, -1.04207, -2.234302, 0.4862745, 1, 0, 1,
-0.7194923, 1.148273, -1.726074, 0.4823529, 1, 0, 1,
-0.7171946, 0.3779886, -0.9138683, 0.4745098, 1, 0, 1,
-0.7157242, 1.114541, -0.7998008, 0.4705882, 1, 0, 1,
-0.7143152, 0.2372597, -0.5464588, 0.4627451, 1, 0, 1,
-0.7113314, 1.032375, -1.691594, 0.4588235, 1, 0, 1,
-0.7095133, -0.8903378, -2.883386, 0.4509804, 1, 0, 1,
-0.704442, -0.395418, -1.290816, 0.4470588, 1, 0, 1,
-0.6966984, 1.200286, -0.9279201, 0.4392157, 1, 0, 1,
-0.6908309, -0.3365872, -4.542341, 0.4352941, 1, 0, 1,
-0.6891882, 1.385276, -1.166247, 0.427451, 1, 0, 1,
-0.6890332, -0.3667379, -2.825387, 0.4235294, 1, 0, 1,
-0.6857039, 0.2139098, -2.615759, 0.4156863, 1, 0, 1,
-0.6814375, -0.7798002, -2.135724, 0.4117647, 1, 0, 1,
-0.6810652, 2.067029, -0.5526522, 0.4039216, 1, 0, 1,
-0.6784726, 1.307047, -1.573031, 0.3960784, 1, 0, 1,
-0.6775419, 2.048506, -0.6245165, 0.3921569, 1, 0, 1,
-0.6757786, 1.378494, -0.5118337, 0.3843137, 1, 0, 1,
-0.6716624, 1.129148, -3.456369, 0.3803922, 1, 0, 1,
-0.6667632, -2.770729, -1.99066, 0.372549, 1, 0, 1,
-0.6654682, -0.8712352, -3.29696, 0.3686275, 1, 0, 1,
-0.6639233, 0.3490005, -0.6671132, 0.3607843, 1, 0, 1,
-0.6637121, 1.262862, -1.47636, 0.3568628, 1, 0, 1,
-0.6635526, 1.401191, 0.843977, 0.3490196, 1, 0, 1,
-0.6606793, 0.6865671, 0.1221133, 0.345098, 1, 0, 1,
-0.6604507, 1.087655, -1.684043, 0.3372549, 1, 0, 1,
-0.6568475, 0.2110898, -1.381535, 0.3333333, 1, 0, 1,
-0.6556522, 0.1904019, -3.910941, 0.3254902, 1, 0, 1,
-0.6532164, 0.1003874, -1.190796, 0.3215686, 1, 0, 1,
-0.6522701, -0.3930977, -1.115273, 0.3137255, 1, 0, 1,
-0.650804, -0.5097474, -2.445535, 0.3098039, 1, 0, 1,
-0.6472462, -0.1507975, -3.874686, 0.3019608, 1, 0, 1,
-0.6403364, 0.6434337, 0.5662701, 0.2941177, 1, 0, 1,
-0.6379842, 0.1734613, -0.7179469, 0.2901961, 1, 0, 1,
-0.6329942, -0.8409858, -1.494387, 0.282353, 1, 0, 1,
-0.6323924, -0.6824694, -1.724417, 0.2784314, 1, 0, 1,
-0.6290652, -0.1951376, -2.446087, 0.2705882, 1, 0, 1,
-0.6284743, -0.8017054, -4.238551, 0.2666667, 1, 0, 1,
-0.626266, -1.032258, -3.702058, 0.2588235, 1, 0, 1,
-0.6249971, -0.2565013, -2.291843, 0.254902, 1, 0, 1,
-0.6197852, -0.3398143, -2.940286, 0.2470588, 1, 0, 1,
-0.6185892, 1.285002, -1.298114, 0.2431373, 1, 0, 1,
-0.6158608, -1.250573, -2.490471, 0.2352941, 1, 0, 1,
-0.6131488, 0.4546005, -0.6168073, 0.2313726, 1, 0, 1,
-0.6084193, 0.07785457, -0.4973126, 0.2235294, 1, 0, 1,
-0.6028162, 0.3470539, -0.5105276, 0.2196078, 1, 0, 1,
-0.5984214, 0.07617878, -3.43819, 0.2117647, 1, 0, 1,
-0.5961075, -0.9339833, -2.359359, 0.2078431, 1, 0, 1,
-0.5948927, -0.6555159, -2.685146, 0.2, 1, 0, 1,
-0.5943346, 0.7053283, -0.829708, 0.1921569, 1, 0, 1,
-0.5916509, 1.735141, -2.913602, 0.1882353, 1, 0, 1,
-0.5906125, -0.4061504, -0.4842117, 0.1803922, 1, 0, 1,
-0.5834551, 0.01438767, -2.522144, 0.1764706, 1, 0, 1,
-0.5783079, -0.04103029, -1.924438, 0.1686275, 1, 0, 1,
-0.5735219, 0.02873515, -1.675127, 0.1647059, 1, 0, 1,
-0.5729375, 2.272806, 2.205368, 0.1568628, 1, 0, 1,
-0.5721135, 1.02694, 1.043797, 0.1529412, 1, 0, 1,
-0.5689266, 0.2277591, -0.1210106, 0.145098, 1, 0, 1,
-0.5670416, 0.04246764, -2.914404, 0.1411765, 1, 0, 1,
-0.5657141, 2.651153, -0.5474358, 0.1333333, 1, 0, 1,
-0.5632384, 1.679205, 0.7475129, 0.1294118, 1, 0, 1,
-0.5602097, 0.8747164, 0.9702186, 0.1215686, 1, 0, 1,
-0.5583708, 0.151793, -0.5913521, 0.1176471, 1, 0, 1,
-0.556522, 0.3243885, -1.536513, 0.1098039, 1, 0, 1,
-0.5561696, -0.8191849, -2.975825, 0.1058824, 1, 0, 1,
-0.5549163, -0.1634571, -2.326809, 0.09803922, 1, 0, 1,
-0.5547006, -0.9250507, -2.741419, 0.09019608, 1, 0, 1,
-0.5546876, -0.9538469, -2.150342, 0.08627451, 1, 0, 1,
-0.5537762, 2.288727, -0.4844928, 0.07843138, 1, 0, 1,
-0.5517167, -0.151775, -1.6203, 0.07450981, 1, 0, 1,
-0.5512019, -0.0624853, -1.627001, 0.06666667, 1, 0, 1,
-0.5503369, 0.8111525, 0.7429779, 0.0627451, 1, 0, 1,
-0.5447552, 0.04991354, -1.376967, 0.05490196, 1, 0, 1,
-0.5428498, 1.364366, 0.9149672, 0.05098039, 1, 0, 1,
-0.5318027, 0.7503446, -0.6466582, 0.04313726, 1, 0, 1,
-0.529807, -0.6568484, -2.204331, 0.03921569, 1, 0, 1,
-0.5282657, -0.01052599, 0.1476617, 0.03137255, 1, 0, 1,
-0.5261187, -1.6471, -3.482181, 0.02745098, 1, 0, 1,
-0.5241147, 0.9283052, -0.3343367, 0.01960784, 1, 0, 1,
-0.5198597, -0.3922434, -2.544284, 0.01568628, 1, 0, 1,
-0.5190256, 0.3774658, -1.028821, 0.007843138, 1, 0, 1,
-0.5185641, -0.56436, -2.142576, 0.003921569, 1, 0, 1,
-0.517187, -0.8992006, -3.36252, 0, 1, 0.003921569, 1,
-0.5169709, -0.2463916, -2.009093, 0, 1, 0.01176471, 1,
-0.5160927, 0.3191322, -2.554827, 0, 1, 0.01568628, 1,
-0.5088188, 0.8150735, -1.208034, 0, 1, 0.02352941, 1,
-0.5082201, 2.168258, -0.151528, 0, 1, 0.02745098, 1,
-0.4995173, 0.2354507, 0.6099176, 0, 1, 0.03529412, 1,
-0.4925672, 0.4878308, -0.5315591, 0, 1, 0.03921569, 1,
-0.4912236, -0.1611123, -1.781552, 0, 1, 0.04705882, 1,
-0.4898136, 0.3602281, -1.983703, 0, 1, 0.05098039, 1,
-0.4842315, 0.3772772, -0.1868855, 0, 1, 0.05882353, 1,
-0.4833362, 0.3748507, 0.1342547, 0, 1, 0.0627451, 1,
-0.4796401, -0.2527423, -3.954195, 0, 1, 0.07058824, 1,
-0.4782032, -0.2140161, -0.5787041, 0, 1, 0.07450981, 1,
-0.4755858, 0.9228206, -1.615961, 0, 1, 0.08235294, 1,
-0.4731667, -0.5858153, -2.348492, 0, 1, 0.08627451, 1,
-0.4730831, -0.1156411, -2.304714, 0, 1, 0.09411765, 1,
-0.472028, 0.3384936, -1.341532, 0, 1, 0.1019608, 1,
-0.4708764, -1.157847, -2.99374, 0, 1, 0.1058824, 1,
-0.4700888, 1.375768, 0.8492908, 0, 1, 0.1137255, 1,
-0.4682779, -2.399722, -3.825374, 0, 1, 0.1176471, 1,
-0.4614438, 1.652364, 0.1012403, 0, 1, 0.1254902, 1,
-0.4578934, -0.06956564, -3.218378, 0, 1, 0.1294118, 1,
-0.4569203, 0.4522535, -0.7895444, 0, 1, 0.1372549, 1,
-0.4550619, -0.597178, -2.51149, 0, 1, 0.1411765, 1,
-0.453209, -0.9251203, -3.966104, 0, 1, 0.1490196, 1,
-0.4523277, 0.8139778, -0.8239267, 0, 1, 0.1529412, 1,
-0.449623, -0.4521826, -1.820201, 0, 1, 0.1607843, 1,
-0.4469514, -0.4013748, -2.437027, 0, 1, 0.1647059, 1,
-0.4466526, 0.8993814, -0.6348746, 0, 1, 0.172549, 1,
-0.4463006, -0.6601793, -3.361709, 0, 1, 0.1764706, 1,
-0.4421893, -0.5172633, -2.717478, 0, 1, 0.1843137, 1,
-0.4414431, 0.2580673, -0.5408216, 0, 1, 0.1882353, 1,
-0.4400737, 1.135523, -0.2853683, 0, 1, 0.1960784, 1,
-0.4311863, 2.433507, 0.2787942, 0, 1, 0.2039216, 1,
-0.4175849, -0.4123622, -1.637934, 0, 1, 0.2078431, 1,
-0.4168362, -0.9875989, -1.616505, 0, 1, 0.2156863, 1,
-0.410132, -2.593774, -3.301381, 0, 1, 0.2196078, 1,
-0.4096718, -0.2247068, -3.693004, 0, 1, 0.227451, 1,
-0.4033723, -0.7864463, -4.366546, 0, 1, 0.2313726, 1,
-0.40231, 1.813549, 0.5493863, 0, 1, 0.2392157, 1,
-0.3985498, 1.471593, -2.499535, 0, 1, 0.2431373, 1,
-0.3967166, -0.2221726, -0.8899183, 0, 1, 0.2509804, 1,
-0.3948835, 2.462155, 1.233159, 0, 1, 0.254902, 1,
-0.389764, 0.8878013, 0.311925, 0, 1, 0.2627451, 1,
-0.3857416, -2.35311, -2.967119, 0, 1, 0.2666667, 1,
-0.38535, 1.039558, -0.3094273, 0, 1, 0.2745098, 1,
-0.3837495, -0.3556108, -3.275154, 0, 1, 0.2784314, 1,
-0.3818046, -0.4939621, -2.794384, 0, 1, 0.2862745, 1,
-0.377633, -1.745121, -2.207558, 0, 1, 0.2901961, 1,
-0.3765522, -0.9403852, -2.299972, 0, 1, 0.2980392, 1,
-0.3705668, -1.702665, -3.693594, 0, 1, 0.3058824, 1,
-0.3674738, -0.9176055, -3.171964, 0, 1, 0.3098039, 1,
-0.3634078, -0.09343544, -0.9251022, 0, 1, 0.3176471, 1,
-0.363302, -0.2424409, -2.186074, 0, 1, 0.3215686, 1,
-0.3621193, 0.7813681, 0.2933976, 0, 1, 0.3294118, 1,
-0.3596057, 1.795646, 1.673203, 0, 1, 0.3333333, 1,
-0.3591467, 0.3594327, -0.6950752, 0, 1, 0.3411765, 1,
-0.3524694, -0.089365, -1.881332, 0, 1, 0.345098, 1,
-0.3474576, 0.3149001, -2.456066, 0, 1, 0.3529412, 1,
-0.3457865, -0.2234787, -2.173448, 0, 1, 0.3568628, 1,
-0.342641, -2.378759, -3.110111, 0, 1, 0.3647059, 1,
-0.3424028, 1.645128, -0.4302369, 0, 1, 0.3686275, 1,
-0.3393517, -1.493318, -2.88678, 0, 1, 0.3764706, 1,
-0.3359125, -1.332371, -3.447991, 0, 1, 0.3803922, 1,
-0.3356293, -1.083859, -1.113201, 0, 1, 0.3882353, 1,
-0.3353361, -1.027397, -1.730233, 0, 1, 0.3921569, 1,
-0.3341507, -0.1347836, -2.543976, 0, 1, 0.4, 1,
-0.3323418, -0.7679083, -2.53289, 0, 1, 0.4078431, 1,
-0.3311955, 0.424024, -0.8810969, 0, 1, 0.4117647, 1,
-0.3290773, 0.2540286, -0.1246484, 0, 1, 0.4196078, 1,
-0.3256944, 0.06785269, -1.728451, 0, 1, 0.4235294, 1,
-0.3217316, 0.6504232, -0.9567503, 0, 1, 0.4313726, 1,
-0.3127362, -0.8225791, -1.152307, 0, 1, 0.4352941, 1,
-0.3045677, -1.558114, -4.15492, 0, 1, 0.4431373, 1,
-0.3029152, 0.6363927, -0.4024246, 0, 1, 0.4470588, 1,
-0.3012954, -1.312261, -3.010416, 0, 1, 0.454902, 1,
-0.2990243, -0.2782269, -2.979239, 0, 1, 0.4588235, 1,
-0.2973563, 0.4554205, 0.01281211, 0, 1, 0.4666667, 1,
-0.2955828, 1.538421, 0.7601417, 0, 1, 0.4705882, 1,
-0.2946166, -1.501087, -3.597218, 0, 1, 0.4784314, 1,
-0.2941015, 0.1490549, -1.220359, 0, 1, 0.4823529, 1,
-0.2939287, -2.353132, -1.776491, 0, 1, 0.4901961, 1,
-0.2864266, -0.3333428, -4.365612, 0, 1, 0.4941176, 1,
-0.2843924, 1.402228, 0.2794473, 0, 1, 0.5019608, 1,
-0.2825109, -0.325417, -1.963725, 0, 1, 0.509804, 1,
-0.2791745, 0.08687797, 0.1950189, 0, 1, 0.5137255, 1,
-0.2782008, 1.052341, -1.187995, 0, 1, 0.5215687, 1,
-0.2773312, -2.042649, -1.712658, 0, 1, 0.5254902, 1,
-0.2761935, 1.841846, 0.4862217, 0, 1, 0.5333334, 1,
-0.2758809, -1.551751, -4.762704, 0, 1, 0.5372549, 1,
-0.2717194, -0.5319207, -2.581989, 0, 1, 0.5450981, 1,
-0.2701086, -0.95192, -1.979308, 0, 1, 0.5490196, 1,
-0.2645128, -0.1527059, -2.342127, 0, 1, 0.5568628, 1,
-0.2634529, 0.9776875, 1.704303, 0, 1, 0.5607843, 1,
-0.2488002, -0.5637975, -3.594676, 0, 1, 0.5686275, 1,
-0.2467385, 0.7120529, -0.8215249, 0, 1, 0.572549, 1,
-0.2450395, 1.378515, 0.4378845, 0, 1, 0.5803922, 1,
-0.244425, 1.137207, -0.632671, 0, 1, 0.5843138, 1,
-0.2429882, -0.3983591, -3.436721, 0, 1, 0.5921569, 1,
-0.2425118, 0.7884056, 0.138666, 0, 1, 0.5960785, 1,
-0.2411927, 2.143716, 0.7847487, 0, 1, 0.6039216, 1,
-0.235751, -1.904719, -3.953001, 0, 1, 0.6117647, 1,
-0.2342423, -0.870545, -0.8930411, 0, 1, 0.6156863, 1,
-0.2294042, -0.5552382, -2.411895, 0, 1, 0.6235294, 1,
-0.2276668, 0.2685363, -1.157316, 0, 1, 0.627451, 1,
-0.2264115, -1.387193, -3.947333, 0, 1, 0.6352941, 1,
-0.225867, -0.8994625, -2.614532, 0, 1, 0.6392157, 1,
-0.2252541, -0.1234907, -2.181128, 0, 1, 0.6470588, 1,
-0.2248035, -1.575311, -4.994091, 0, 1, 0.6509804, 1,
-0.2236587, 2.05813, -1.155788, 0, 1, 0.6588235, 1,
-0.2231618, -0.3447787, -1.547178, 0, 1, 0.6627451, 1,
-0.2190578, 0.857963, 0.7116605, 0, 1, 0.6705883, 1,
-0.218366, 0.6094802, -0.8657159, 0, 1, 0.6745098, 1,
-0.216262, 0.9706041, -0.9462381, 0, 1, 0.682353, 1,
-0.2128204, -1.050031, -2.366061, 0, 1, 0.6862745, 1,
-0.2076278, -1.147692, -2.422223, 0, 1, 0.6941177, 1,
-0.2065607, -2.69432, -2.977805, 0, 1, 0.7019608, 1,
-0.2064078, -0.994643, -3.580229, 0, 1, 0.7058824, 1,
-0.2028511, 1.394053, 0.7148708, 0, 1, 0.7137255, 1,
-0.2023056, -1.02535, -2.769202, 0, 1, 0.7176471, 1,
-0.2016242, 0.3700175, -2.09432, 0, 1, 0.7254902, 1,
-0.2010447, -0.7205819, -3.759903, 0, 1, 0.7294118, 1,
-0.198816, -0.03801187, -1.180114, 0, 1, 0.7372549, 1,
-0.1975089, -0.7149104, -2.111135, 0, 1, 0.7411765, 1,
-0.1862397, 0.414194, 0.3761543, 0, 1, 0.7490196, 1,
-0.1818855, 1.325683, 0.6724968, 0, 1, 0.7529412, 1,
-0.1803886, -0.1319866, -0.3089869, 0, 1, 0.7607843, 1,
-0.1795948, -0.261539, -2.253801, 0, 1, 0.7647059, 1,
-0.1726069, -1.064294, -3.015155, 0, 1, 0.772549, 1,
-0.1725585, -1.82695, -4.077846, 0, 1, 0.7764706, 1,
-0.1697677, -0.5310895, -1.662145, 0, 1, 0.7843137, 1,
-0.1686282, -0.9637607, -3.341395, 0, 1, 0.7882353, 1,
-0.1653334, 0.7348889, -0.1372428, 0, 1, 0.7960784, 1,
-0.1613945, 1.198458, -1.227819, 0, 1, 0.8039216, 1,
-0.1597197, -0.3064858, -3.339478, 0, 1, 0.8078431, 1,
-0.1460489, 0.3090454, 0.1393349, 0, 1, 0.8156863, 1,
-0.1459682, -0.9512144, -2.583092, 0, 1, 0.8196079, 1,
-0.1439454, 0.8408492, -0.3092324, 0, 1, 0.827451, 1,
-0.1419915, -0.7597393, -1.993124, 0, 1, 0.8313726, 1,
-0.1393319, -0.5582565, -2.741296, 0, 1, 0.8392157, 1,
-0.1375709, 0.05357337, -2.143806, 0, 1, 0.8431373, 1,
-0.1355935, 0.7194152, -1.756678, 0, 1, 0.8509804, 1,
-0.1337226, 0.9502644, -0.2798232, 0, 1, 0.854902, 1,
-0.1322826, 0.4900802, 1.006057, 0, 1, 0.8627451, 1,
-0.1289008, -0.2404799, -2.116769, 0, 1, 0.8666667, 1,
-0.122682, -1.254572, -3.416622, 0, 1, 0.8745098, 1,
-0.1223986, -1.974291, -3.385386, 0, 1, 0.8784314, 1,
-0.1187602, -0.6566131, -3.079447, 0, 1, 0.8862745, 1,
-0.1181899, -0.1131526, -1.389473, 0, 1, 0.8901961, 1,
-0.1173689, -0.09533043, -2.524879, 0, 1, 0.8980392, 1,
-0.1172458, 1.777595, -0.01429972, 0, 1, 0.9058824, 1,
-0.1165386, -0.5332997, -2.593328, 0, 1, 0.9098039, 1,
-0.113575, 1.146968, 0.6103484, 0, 1, 0.9176471, 1,
-0.1126897, 0.01484748, -1.434461, 0, 1, 0.9215686, 1,
-0.1114522, 1.520273, 2.054911, 0, 1, 0.9294118, 1,
-0.110608, 0.166721, 1.422173, 0, 1, 0.9333333, 1,
-0.1102829, 0.3324208, -0.06792733, 0, 1, 0.9411765, 1,
-0.108554, -0.3806042, -3.184404, 0, 1, 0.945098, 1,
-0.1035947, 0.1018694, -1.200009, 0, 1, 0.9529412, 1,
-0.1034267, 1.486281, 0.2675267, 0, 1, 0.9568627, 1,
-0.09952253, 1.5414, 0.5786678, 0, 1, 0.9647059, 1,
-0.09865537, 0.7029856, -0.9488831, 0, 1, 0.9686275, 1,
-0.0918493, 1.572887, 1.704673, 0, 1, 0.9764706, 1,
-0.09183004, -0.1008999, -2.147251, 0, 1, 0.9803922, 1,
-0.09180709, 0.6949316, -0.8502603, 0, 1, 0.9882353, 1,
-0.08700255, -0.02879926, -0.2359749, 0, 1, 0.9921569, 1,
-0.08434161, -0.1174951, -3.44423, 0, 1, 1, 1,
-0.08203387, -0.9075208, -4.121429, 0, 0.9921569, 1, 1,
-0.08041769, -0.707946, -3.233489, 0, 0.9882353, 1, 1,
-0.07944269, -0.4273781, -2.465289, 0, 0.9803922, 1, 1,
-0.07680835, -0.4933689, -2.619264, 0, 0.9764706, 1, 1,
-0.07591566, -1.611736, -3.469112, 0, 0.9686275, 1, 1,
-0.07493418, -1.681763, -3.65578, 0, 0.9647059, 1, 1,
-0.07144492, 0.5332202, -1.523183, 0, 0.9568627, 1, 1,
-0.06973961, -1.295296, -3.953614, 0, 0.9529412, 1, 1,
-0.06209928, 0.5761033, -1.937809, 0, 0.945098, 1, 1,
-0.06007766, 0.4188151, 0.5293767, 0, 0.9411765, 1, 1,
-0.05263665, -1.902308, -2.470809, 0, 0.9333333, 1, 1,
-0.04453954, 0.6705255, -0.8686698, 0, 0.9294118, 1, 1,
-0.04120952, 1.317897, -0.5028118, 0, 0.9215686, 1, 1,
-0.04020573, 0.1460512, 0.5419118, 0, 0.9176471, 1, 1,
-0.03919327, 0.1645903, -0.07732109, 0, 0.9098039, 1, 1,
-0.03720395, 0.1327179, 0.12655, 0, 0.9058824, 1, 1,
-0.03553034, -0.1380753, -3.119519, 0, 0.8980392, 1, 1,
-0.03488646, -0.7644064, -2.345725, 0, 0.8901961, 1, 1,
-0.03217622, -0.434367, -1.877537, 0, 0.8862745, 1, 1,
-0.02712406, 2.125993, 0.5700542, 0, 0.8784314, 1, 1,
-0.02349833, -0.4305481, -2.055685, 0, 0.8745098, 1, 1,
-0.02082251, -0.3117214, -1.872033, 0, 0.8666667, 1, 1,
-0.02067352, -1.251132, -3.209709, 0, 0.8627451, 1, 1,
-0.01789609, -1.785103, -4.999515, 0, 0.854902, 1, 1,
-0.01787119, -0.920313, -4.093513, 0, 0.8509804, 1, 1,
-0.01184596, -0.1306541, -4.845917, 0, 0.8431373, 1, 1,
-0.01104659, -0.006174499, -1.711773, 0, 0.8392157, 1, 1,
-0.009106133, 1.819885, 1.268385, 0, 0.8313726, 1, 1,
-0.007508508, -1.440328, -6.484157, 0, 0.827451, 1, 1,
-0.005307988, 0.7404381, -0.6480249, 0, 0.8196079, 1, 1,
-0.001640043, -0.01912981, -1.831669, 0, 0.8156863, 1, 1,
-0.00156152, -1.672926, -3.890822, 0, 0.8078431, 1, 1,
0.001053276, -1.813503, 2.648581, 0, 0.8039216, 1, 1,
0.004987061, -0.8787968, 3.184489, 0, 0.7960784, 1, 1,
0.01049297, -1.95034, 3.401757, 0, 0.7882353, 1, 1,
0.01467842, -1.532642, 2.944487, 0, 0.7843137, 1, 1,
0.02229435, -0.9293882, 2.716846, 0, 0.7764706, 1, 1,
0.02616322, -0.5186252, 2.999398, 0, 0.772549, 1, 1,
0.02736806, -0.3251125, 1.968071, 0, 0.7647059, 1, 1,
0.03944436, -0.03501443, 2.842189, 0, 0.7607843, 1, 1,
0.04656813, 0.5020633, 2.266639, 0, 0.7529412, 1, 1,
0.05002134, 0.5136803, 0.6872219, 0, 0.7490196, 1, 1,
0.05241612, 0.5274909, 0.1222233, 0, 0.7411765, 1, 1,
0.06269838, -0.5484439, 1.54946, 0, 0.7372549, 1, 1,
0.06800102, 0.038146, -0.7734455, 0, 0.7294118, 1, 1,
0.06904399, 0.2719364, -0.6202297, 0, 0.7254902, 1, 1,
0.07072312, -1.151335, 3.787432, 0, 0.7176471, 1, 1,
0.07221283, 0.6336042, -0.5380483, 0, 0.7137255, 1, 1,
0.07695014, 0.7763484, -0.4856557, 0, 0.7058824, 1, 1,
0.07817641, -2.372043, 3.7097, 0, 0.6980392, 1, 1,
0.08545952, -1.702343, 3.964104, 0, 0.6941177, 1, 1,
0.0862662, -0.4989401, 1.828492, 0, 0.6862745, 1, 1,
0.08757441, 1.405436, 2.096602, 0, 0.682353, 1, 1,
0.08762474, 0.9613999, -0.5022665, 0, 0.6745098, 1, 1,
0.08764249, 0.03338116, 2.344962, 0, 0.6705883, 1, 1,
0.08808643, 0.8516469, -1.561522, 0, 0.6627451, 1, 1,
0.08919357, 1.631365, 0.2865463, 0, 0.6588235, 1, 1,
0.09531306, 0.4403099, -0.2371894, 0, 0.6509804, 1, 1,
0.09614329, -0.5137469, 3.567112, 0, 0.6470588, 1, 1,
0.09763473, 0.528245, 0.426083, 0, 0.6392157, 1, 1,
0.09844609, 0.3989721, -0.4425384, 0, 0.6352941, 1, 1,
0.09845964, 0.9976388, -1.663957, 0, 0.627451, 1, 1,
0.1004759, -0.7677156, 2.002773, 0, 0.6235294, 1, 1,
0.1014752, 0.09869576, 0.2121373, 0, 0.6156863, 1, 1,
0.1053899, -0.8443509, 2.565007, 0, 0.6117647, 1, 1,
0.1079972, -1.756095, 2.69874, 0, 0.6039216, 1, 1,
0.1081527, -0.1885349, 3.184037, 0, 0.5960785, 1, 1,
0.1105185, 0.267969, -1.089084, 0, 0.5921569, 1, 1,
0.112222, -0.7725444, 3.453134, 0, 0.5843138, 1, 1,
0.1174839, 1.034762, -0.5202214, 0, 0.5803922, 1, 1,
0.1177124, -0.08790407, 4.523543, 0, 0.572549, 1, 1,
0.1240859, -0.7080947, 3.757284, 0, 0.5686275, 1, 1,
0.1309236, 0.9110257, 0.7521818, 0, 0.5607843, 1, 1,
0.133663, -0.5596887, 2.892038, 0, 0.5568628, 1, 1,
0.1339327, 0.9359019, -0.9383829, 0, 0.5490196, 1, 1,
0.1339421, -0.06008314, 3.834904, 0, 0.5450981, 1, 1,
0.1415619, -2.257922, 2.135646, 0, 0.5372549, 1, 1,
0.1423468, 0.3975968, 2.630914, 0, 0.5333334, 1, 1,
0.1428292, 1.085894, -0.1806202, 0, 0.5254902, 1, 1,
0.1431151, -1.576556, 2.153613, 0, 0.5215687, 1, 1,
0.1489103, -1.513507, 3.966424, 0, 0.5137255, 1, 1,
0.1506004, -0.6856424, 4.364454, 0, 0.509804, 1, 1,
0.1517082, -0.7591197, 4.685448, 0, 0.5019608, 1, 1,
0.1560222, -0.1158073, 1.238113, 0, 0.4941176, 1, 1,
0.1614036, -0.2677074, 1.612005, 0, 0.4901961, 1, 1,
0.1619908, 0.2050022, 0.4690669, 0, 0.4823529, 1, 1,
0.1635623, -1.343301, 2.677738, 0, 0.4784314, 1, 1,
0.1637272, -0.1141484, 2.569961, 0, 0.4705882, 1, 1,
0.1645941, 0.3725811, 0.2189972, 0, 0.4666667, 1, 1,
0.1658085, 0.8914455, 1.178278, 0, 0.4588235, 1, 1,
0.1771988, -0.7201978, 1.872689, 0, 0.454902, 1, 1,
0.1810012, 0.6337179, -0.5779523, 0, 0.4470588, 1, 1,
0.1867076, -1.472862, 1.999985, 0, 0.4431373, 1, 1,
0.1902717, 1.227224, 1.77732, 0, 0.4352941, 1, 1,
0.1942789, 0.2576647, -0.8918479, 0, 0.4313726, 1, 1,
0.1946397, -1.220268, 3.199211, 0, 0.4235294, 1, 1,
0.1972725, 1.153654, -1.217816, 0, 0.4196078, 1, 1,
0.2026197, 1.01474, -0.3802097, 0, 0.4117647, 1, 1,
0.2027331, -2.635513, 3.418906, 0, 0.4078431, 1, 1,
0.2039839, 1.331229, -0.2678377, 0, 0.4, 1, 1,
0.2044448, 1.303013, 0.005451835, 0, 0.3921569, 1, 1,
0.2075815, 0.0474817, 0.8995538, 0, 0.3882353, 1, 1,
0.207945, -1.649784, 3.723978, 0, 0.3803922, 1, 1,
0.2102364, 1.646577, 0.9731114, 0, 0.3764706, 1, 1,
0.2123331, 1.295333, 1.603807, 0, 0.3686275, 1, 1,
0.2217131, 1.033262, -1.133812, 0, 0.3647059, 1, 1,
0.226499, -1.519165, 3.6672, 0, 0.3568628, 1, 1,
0.2269263, -0.7438185, 4.523534, 0, 0.3529412, 1, 1,
0.2277918, 1.566731, 0.6851953, 0, 0.345098, 1, 1,
0.2284047, 0.1093653, 1.629327, 0, 0.3411765, 1, 1,
0.2312575, 1.107956, -0.3926045, 0, 0.3333333, 1, 1,
0.2338875, -0.1980606, 0.9185799, 0, 0.3294118, 1, 1,
0.2358807, -0.01341628, 1.197659, 0, 0.3215686, 1, 1,
0.2376903, 0.2367055, 1.364871, 0, 0.3176471, 1, 1,
0.2380863, -0.1248922, 3.105094, 0, 0.3098039, 1, 1,
0.2443512, -1.618158, 2.799603, 0, 0.3058824, 1, 1,
0.249436, -0.07802079, 2.609704, 0, 0.2980392, 1, 1,
0.2496581, 0.8092363, -0.778802, 0, 0.2901961, 1, 1,
0.2552204, -1.846938, 2.333611, 0, 0.2862745, 1, 1,
0.2561274, 1.201643, -1.71585, 0, 0.2784314, 1, 1,
0.2600326, 0.9145238, -0.07035737, 0, 0.2745098, 1, 1,
0.2658737, 0.430955, 0.04078588, 0, 0.2666667, 1, 1,
0.2700856, -1.332845, 2.632149, 0, 0.2627451, 1, 1,
0.2727828, -0.09111888, 1.541697, 0, 0.254902, 1, 1,
0.27736, -2.123592, 2.946558, 0, 0.2509804, 1, 1,
0.2797301, -0.7039228, 5.398458, 0, 0.2431373, 1, 1,
0.280728, 0.6087914, -0.9857153, 0, 0.2392157, 1, 1,
0.2876029, 0.8724833, -0.2819179, 0, 0.2313726, 1, 1,
0.289825, -0.4013291, 0.9147759, 0, 0.227451, 1, 1,
0.293638, 0.6923665, 2.572574, 0, 0.2196078, 1, 1,
0.2948593, 1.764678, -1.473342, 0, 0.2156863, 1, 1,
0.295857, 1.344319, -0.3417651, 0, 0.2078431, 1, 1,
0.2970202, -0.6626357, 3.324693, 0, 0.2039216, 1, 1,
0.3088622, 0.1544011, 1.008286, 0, 0.1960784, 1, 1,
0.3100561, 1.487241, -0.4715679, 0, 0.1882353, 1, 1,
0.3175002, 0.3573433, 0.3517221, 0, 0.1843137, 1, 1,
0.3186979, -0.2403959, 1.334744, 0, 0.1764706, 1, 1,
0.3188693, -0.1155496, 2.854479, 0, 0.172549, 1, 1,
0.3204511, -0.8290978, 4.934915, 0, 0.1647059, 1, 1,
0.3214042, 1.228133, 0.4379443, 0, 0.1607843, 1, 1,
0.3221888, -0.009493788, 1.738225, 0, 0.1529412, 1, 1,
0.3225272, -0.400667, 5.364085, 0, 0.1490196, 1, 1,
0.3238066, -0.330164, 2.919641, 0, 0.1411765, 1, 1,
0.3247572, 0.4090236, 0.3225793, 0, 0.1372549, 1, 1,
0.3262395, -0.7131681, 2.868048, 0, 0.1294118, 1, 1,
0.3302404, 0.4521072, 2.093632, 0, 0.1254902, 1, 1,
0.3351817, -0.8923011, 3.032963, 0, 0.1176471, 1, 1,
0.3353376, -0.3931741, 1.014349, 0, 0.1137255, 1, 1,
0.3358136, 0.6038552, 0.6376723, 0, 0.1058824, 1, 1,
0.3371392, 0.2346845, 1.572799, 0, 0.09803922, 1, 1,
0.3386326, 0.3327885, 0.5349257, 0, 0.09411765, 1, 1,
0.3393351, -0.0782788, 1.959814, 0, 0.08627451, 1, 1,
0.3457789, -0.2520352, 1.573201, 0, 0.08235294, 1, 1,
0.346167, -0.005865352, 0.5060923, 0, 0.07450981, 1, 1,
0.3486859, 0.8974568, -0.9306967, 0, 0.07058824, 1, 1,
0.3531076, 0.4585146, 1.761598, 0, 0.0627451, 1, 1,
0.3559568, -0.4752978, 1.94006, 0, 0.05882353, 1, 1,
0.3589781, -0.3074888, 0.1393496, 0, 0.05098039, 1, 1,
0.3589888, -2.200186, 3.075478, 0, 0.04705882, 1, 1,
0.3603254, -0.1280486, 0.2955903, 0, 0.03921569, 1, 1,
0.3620802, -0.1976747, 2.256141, 0, 0.03529412, 1, 1,
0.3622701, -0.06886791, 0.2907242, 0, 0.02745098, 1, 1,
0.3626011, -0.7312893, 3.397839, 0, 0.02352941, 1, 1,
0.3633322, 0.795445, -0.8968241, 0, 0.01568628, 1, 1,
0.3660229, 1.316335, 0.2159214, 0, 0.01176471, 1, 1,
0.3778091, 0.7826458, 0.6207015, 0, 0.003921569, 1, 1,
0.3823809, 1.053008, 0.748939, 0.003921569, 0, 1, 1,
0.3833964, 0.5348651, 2.144749, 0.007843138, 0, 1, 1,
0.3845338, 0.2733822, 0.1767705, 0.01568628, 0, 1, 1,
0.3860542, -2.236841, 2.141159, 0.01960784, 0, 1, 1,
0.3872207, 0.4559545, 2.176072, 0.02745098, 0, 1, 1,
0.3919743, 1.046603, 0.6431341, 0.03137255, 0, 1, 1,
0.3938627, 0.2785451, -0.2703033, 0.03921569, 0, 1, 1,
0.3945108, -0.2740315, 3.040435, 0.04313726, 0, 1, 1,
0.3964552, -2.107513, 3.917558, 0.05098039, 0, 1, 1,
0.3991281, 0.08941457, 1.706514, 0.05490196, 0, 1, 1,
0.4023952, -1.483892, 3.269818, 0.0627451, 0, 1, 1,
0.4042012, 0.5093024, 1.194318, 0.06666667, 0, 1, 1,
0.4071766, -0.996355, 2.444504, 0.07450981, 0, 1, 1,
0.4082319, -1.884962, 2.915571, 0.07843138, 0, 1, 1,
0.4146022, -1.2431, 2.842902, 0.08627451, 0, 1, 1,
0.4155622, 0.1659557, 1.935226, 0.09019608, 0, 1, 1,
0.4170873, -1.819777, 3.605783, 0.09803922, 0, 1, 1,
0.4223401, -0.7951939, 1.679454, 0.1058824, 0, 1, 1,
0.422971, -0.9410849, 2.72001, 0.1098039, 0, 1, 1,
0.4231825, -1.037471, 3.387477, 0.1176471, 0, 1, 1,
0.4249064, -0.3988375, 2.463341, 0.1215686, 0, 1, 1,
0.425486, -0.3604621, 2.404343, 0.1294118, 0, 1, 1,
0.4299661, -0.6822205, 1.783799, 0.1333333, 0, 1, 1,
0.4334225, 0.8834264, -0.2314323, 0.1411765, 0, 1, 1,
0.4412962, -0.5520632, 3.236954, 0.145098, 0, 1, 1,
0.4519224, -1.501662, 2.459828, 0.1529412, 0, 1, 1,
0.4520594, -0.6299109, 2.330345, 0.1568628, 0, 1, 1,
0.4588056, 1.527764, 0.7295011, 0.1647059, 0, 1, 1,
0.4624192, -0.2336021, 1.247411, 0.1686275, 0, 1, 1,
0.4681879, -0.4205678, 3.728689, 0.1764706, 0, 1, 1,
0.4704726, -0.9237892, 1.813986, 0.1803922, 0, 1, 1,
0.472961, 2.212981, 1.414688, 0.1882353, 0, 1, 1,
0.4761832, 1.247872, 2.960708, 0.1921569, 0, 1, 1,
0.4779803, -0.9153887, 1.80111, 0.2, 0, 1, 1,
0.4806297, -0.4646997, 2.705611, 0.2078431, 0, 1, 1,
0.4818099, 0.7824624, 0.7122054, 0.2117647, 0, 1, 1,
0.4827033, -1.03454, 1.781735, 0.2196078, 0, 1, 1,
0.4838991, 0.854457, 0.7493167, 0.2235294, 0, 1, 1,
0.4841417, 1.311744, -0.4862224, 0.2313726, 0, 1, 1,
0.4856299, 1.198751, 1.43773, 0.2352941, 0, 1, 1,
0.4858786, -1.047307, 3.829423, 0.2431373, 0, 1, 1,
0.4868172, 0.3313492, 1.152164, 0.2470588, 0, 1, 1,
0.4927252, -1.369612, 2.887685, 0.254902, 0, 1, 1,
0.4937316, -1.91099, 2.259077, 0.2588235, 0, 1, 1,
0.4960659, 1.801233, 2.182732, 0.2666667, 0, 1, 1,
0.496796, 0.1701843, 0.03748526, 0.2705882, 0, 1, 1,
0.4971194, 0.9105889, 0.9850122, 0.2784314, 0, 1, 1,
0.4975108, -0.1350321, 1.649423, 0.282353, 0, 1, 1,
0.5018328, 0.3762557, 0.03579795, 0.2901961, 0, 1, 1,
0.504557, -0.5376611, 2.495739, 0.2941177, 0, 1, 1,
0.5079105, 0.08841723, 2.193635, 0.3019608, 0, 1, 1,
0.5159283, -0.05742602, 1.014466, 0.3098039, 0, 1, 1,
0.5179389, 0.4144004, 0.7062757, 0.3137255, 0, 1, 1,
0.5195304, 0.1498635, 1.910555, 0.3215686, 0, 1, 1,
0.5202329, -0.7201952, 2.987519, 0.3254902, 0, 1, 1,
0.5216851, -0.5919102, 1.796105, 0.3333333, 0, 1, 1,
0.5235646, 0.6862305, -0.4818063, 0.3372549, 0, 1, 1,
0.523981, 0.3372371, -0.2266965, 0.345098, 0, 1, 1,
0.5291491, -2.41772, 3.458372, 0.3490196, 0, 1, 1,
0.5346488, -0.1306216, 0.6935482, 0.3568628, 0, 1, 1,
0.5405651, 2.631567, -0.8501672, 0.3607843, 0, 1, 1,
0.5542286, -0.851401, 4.044022, 0.3686275, 0, 1, 1,
0.5545247, -0.4674477, 0.9060383, 0.372549, 0, 1, 1,
0.5546347, -0.08376265, 1.565947, 0.3803922, 0, 1, 1,
0.559981, -0.416509, 2.349451, 0.3843137, 0, 1, 1,
0.5616964, 0.0963088, 0.5196115, 0.3921569, 0, 1, 1,
0.56704, 0.7085617, 2.433605, 0.3960784, 0, 1, 1,
0.5693418, 0.379994, 2.019562, 0.4039216, 0, 1, 1,
0.5719098, -0.007603441, 1.255455, 0.4117647, 0, 1, 1,
0.5752119, -0.3754445, 2.333877, 0.4156863, 0, 1, 1,
0.5761011, -0.7340552, 2.812314, 0.4235294, 0, 1, 1,
0.5764211, 1.09534, 0.8163425, 0.427451, 0, 1, 1,
0.5771737, 1.266411, 1.806434, 0.4352941, 0, 1, 1,
0.5811364, -0.8469922, 4.506297, 0.4392157, 0, 1, 1,
0.5827145, -0.2077885, 3.401232, 0.4470588, 0, 1, 1,
0.5843182, 0.3363902, 0.6818791, 0.4509804, 0, 1, 1,
0.5859149, -0.976822, 3.406355, 0.4588235, 0, 1, 1,
0.5895572, 0.6343313, 1.754719, 0.4627451, 0, 1, 1,
0.5895705, 0.718579, -0.6973886, 0.4705882, 0, 1, 1,
0.5906819, -0.8671964, 1.983039, 0.4745098, 0, 1, 1,
0.5931635, 0.4447154, 1.813905, 0.4823529, 0, 1, 1,
0.5960432, -0.43013, 4.129192, 0.4862745, 0, 1, 1,
0.6003392, -0.1962483, 1.794627, 0.4941176, 0, 1, 1,
0.6003934, 2.086749, -0.1206143, 0.5019608, 0, 1, 1,
0.6033866, 1.739713, -1.740494, 0.5058824, 0, 1, 1,
0.6039521, 1.572561, 0.3479956, 0.5137255, 0, 1, 1,
0.6053011, -0.1139663, 1.412205, 0.5176471, 0, 1, 1,
0.6099654, -0.5459217, 2.671134, 0.5254902, 0, 1, 1,
0.6110532, -1.007541, 1.505017, 0.5294118, 0, 1, 1,
0.6116259, -0.6583166, 2.084547, 0.5372549, 0, 1, 1,
0.6124114, -0.1039697, 1.225162, 0.5411765, 0, 1, 1,
0.6124669, -0.7438734, 3.66181, 0.5490196, 0, 1, 1,
0.6188147, 1.434515, -0.5033783, 0.5529412, 0, 1, 1,
0.6265988, 0.150061, 2.085415, 0.5607843, 0, 1, 1,
0.6286255, 1.524219, 0.6778256, 0.5647059, 0, 1, 1,
0.6287454, 0.2689392, 0.8872762, 0.572549, 0, 1, 1,
0.6289681, -1.255513, 4.247948, 0.5764706, 0, 1, 1,
0.6363614, 1.827406, -0.1578756, 0.5843138, 0, 1, 1,
0.6433274, -1.280444, 1.671536, 0.5882353, 0, 1, 1,
0.6444867, -1.050253, 1.695192, 0.5960785, 0, 1, 1,
0.6476687, 1.428054, 2.549892, 0.6039216, 0, 1, 1,
0.6606081, 0.263359, 2.347483, 0.6078432, 0, 1, 1,
0.6647585, -0.4693487, 1.289425, 0.6156863, 0, 1, 1,
0.6683816, -0.8275495, 4.111265, 0.6196079, 0, 1, 1,
0.6699117, -0.3748499, 1.522057, 0.627451, 0, 1, 1,
0.6715544, -0.07380795, 1.670581, 0.6313726, 0, 1, 1,
0.6738909, -0.6560761, 1.168733, 0.6392157, 0, 1, 1,
0.6763065, 0.5599103, 2.219794, 0.6431373, 0, 1, 1,
0.677865, -0.2961582, 1.065169, 0.6509804, 0, 1, 1,
0.6823405, -0.8728438, 3.317135, 0.654902, 0, 1, 1,
0.6919159, 0.9276136, 0.6633493, 0.6627451, 0, 1, 1,
0.6926169, 1.564768, 2.395728, 0.6666667, 0, 1, 1,
0.6929168, 0.7643604, 0.4980057, 0.6745098, 0, 1, 1,
0.6950177, -2.172693, 2.5933, 0.6784314, 0, 1, 1,
0.6974203, 1.477136, 0.7313787, 0.6862745, 0, 1, 1,
0.6997949, -0.8182144, 0.8378141, 0.6901961, 0, 1, 1,
0.7039921, -1.593363, 2.606562, 0.6980392, 0, 1, 1,
0.7072119, -0.05424207, 2.097667, 0.7058824, 0, 1, 1,
0.7078032, 0.995883, 0.8027032, 0.7098039, 0, 1, 1,
0.715446, 0.07801001, -0.3136842, 0.7176471, 0, 1, 1,
0.7156209, -1.516172, 1.813049, 0.7215686, 0, 1, 1,
0.7218018, -0.581278, 0.6203802, 0.7294118, 0, 1, 1,
0.725206, -0.3387657, 0.764376, 0.7333333, 0, 1, 1,
0.7281357, 0.8975566, 0.8943756, 0.7411765, 0, 1, 1,
0.7287305, 0.4577638, 0.252606, 0.7450981, 0, 1, 1,
0.7313085, -0.3520611, 0.923802, 0.7529412, 0, 1, 1,
0.739277, 0.04163541, -0.2207698, 0.7568628, 0, 1, 1,
0.7426298, -0.3242934, 0.7292399, 0.7647059, 0, 1, 1,
0.7465738, -0.2896252, 3.052924, 0.7686275, 0, 1, 1,
0.7478736, 0.04970061, 1.89924, 0.7764706, 0, 1, 1,
0.7562212, 0.5103982, 2.081935, 0.7803922, 0, 1, 1,
0.7596924, 0.7113087, 0.2992757, 0.7882353, 0, 1, 1,
0.7643034, 0.1318812, 1.676329, 0.7921569, 0, 1, 1,
0.7646046, 1.663474, 1.27472, 0.8, 0, 1, 1,
0.772716, 1.352413, 1.079002, 0.8078431, 0, 1, 1,
0.7794013, 0.3279374, 0.2350807, 0.8117647, 0, 1, 1,
0.7884026, 0.4073056, -0.2427572, 0.8196079, 0, 1, 1,
0.7890933, 0.3768292, 1.189763, 0.8235294, 0, 1, 1,
0.7901117, -0.1259791, 0.6220543, 0.8313726, 0, 1, 1,
0.8005525, 0.2999249, 1.296308, 0.8352941, 0, 1, 1,
0.8167971, -0.5213073, 1.097495, 0.8431373, 0, 1, 1,
0.8193464, -0.7221028, 3.134942, 0.8470588, 0, 1, 1,
0.8203378, 0.6133446, -0.3784487, 0.854902, 0, 1, 1,
0.8269411, 0.4792162, 0.3199594, 0.8588235, 0, 1, 1,
0.8298351, 0.3190965, 2.168351, 0.8666667, 0, 1, 1,
0.8304418, 0.1732859, 1.304411, 0.8705882, 0, 1, 1,
0.8429341, 2.41266, -0.7932938, 0.8784314, 0, 1, 1,
0.8482003, -2.579475, 2.172632, 0.8823529, 0, 1, 1,
0.8533637, -0.2315297, -0.6500082, 0.8901961, 0, 1, 1,
0.8572974, -1.436791, 2.504379, 0.8941177, 0, 1, 1,
0.8579229, -1.307619, 2.963037, 0.9019608, 0, 1, 1,
0.858032, -1.920247, 3.008834, 0.9098039, 0, 1, 1,
0.8603486, 1.026707, -0.966446, 0.9137255, 0, 1, 1,
0.8654318, 1.03092, -1.026498, 0.9215686, 0, 1, 1,
0.8677233, 0.5853085, 1.691922, 0.9254902, 0, 1, 1,
0.8685418, 1.028953, -0.3078866, 0.9333333, 0, 1, 1,
0.8707536, 1.548375, 2.193605, 0.9372549, 0, 1, 1,
0.8764694, 1.727832, 2.385162, 0.945098, 0, 1, 1,
0.8781758, -1.083381, 4.617498, 0.9490196, 0, 1, 1,
0.8821104, 0.9770596, 0.9208451, 0.9568627, 0, 1, 1,
0.8853223, -0.1553786, -0.6432692, 0.9607843, 0, 1, 1,
0.892753, 0.2765878, 3.079239, 0.9686275, 0, 1, 1,
0.8967935, -1.207501, 2.302225, 0.972549, 0, 1, 1,
0.8995531, 2.109138, -0.4933574, 0.9803922, 0, 1, 1,
0.9087195, -2.063552, 2.487534, 0.9843137, 0, 1, 1,
0.9150817, 1.259107, 0.9317339, 0.9921569, 0, 1, 1,
0.9168777, 0.1799963, 1.490073, 0.9960784, 0, 1, 1,
0.919351, -2.390936, 3.145558, 1, 0, 0.9960784, 1,
0.9279103, -0.8793936, 2.775367, 1, 0, 0.9882353, 1,
0.9342361, 1.255836, 1.150388, 1, 0, 0.9843137, 1,
0.9372382, -0.1313341, 0.7029635, 1, 0, 0.9764706, 1,
0.9390273, 1.44553, 1.69361, 1, 0, 0.972549, 1,
0.9598594, -0.2403432, 1.316113, 1, 0, 0.9647059, 1,
0.9670859, 0.1890196, 0.8539452, 1, 0, 0.9607843, 1,
0.9754003, -0.2026595, 2.563194, 1, 0, 0.9529412, 1,
0.9833594, -0.5212436, 1.888293, 1, 0, 0.9490196, 1,
0.9881659, -0.8609203, 2.189368, 1, 0, 0.9411765, 1,
0.9887856, -1.227005, 3.631928, 1, 0, 0.9372549, 1,
0.9897283, -0.4313458, 3.735122, 1, 0, 0.9294118, 1,
0.9951418, -1.803616, -0.5722162, 1, 0, 0.9254902, 1,
0.99747, -0.2061155, -0.9263703, 1, 0, 0.9176471, 1,
1.008371, 1.184115, 1.403324, 1, 0, 0.9137255, 1,
1.014771, -0.6240466, 3.309489, 1, 0, 0.9058824, 1,
1.0278, -1.064724, 2.116375, 1, 0, 0.9019608, 1,
1.027859, 0.2163897, -0.2095956, 1, 0, 0.8941177, 1,
1.030673, -1.389202, 2.337171, 1, 0, 0.8862745, 1,
1.031988, -1.826597, 2.525148, 1, 0, 0.8823529, 1,
1.037115, 0.2633118, 2.310912, 1, 0, 0.8745098, 1,
1.041968, 0.6385078, 0.6553752, 1, 0, 0.8705882, 1,
1.043068, 0.2963208, 2.365827, 1, 0, 0.8627451, 1,
1.043863, 0.4254093, 2.00688, 1, 0, 0.8588235, 1,
1.046837, -1.833728, 2.908608, 1, 0, 0.8509804, 1,
1.047999, -1.180216, 1.322251, 1, 0, 0.8470588, 1,
1.048899, -0.4221171, 1.212685, 1, 0, 0.8392157, 1,
1.057079, 0.04253676, 1.414033, 1, 0, 0.8352941, 1,
1.057607, 0.45908, 1.705208, 1, 0, 0.827451, 1,
1.061349, 1.273108, 2.279774, 1, 0, 0.8235294, 1,
1.061851, 0.3933367, 0.9689217, 1, 0, 0.8156863, 1,
1.065444, 0.8924862, 1.152382, 1, 0, 0.8117647, 1,
1.067744, -1.011807, 2.312356, 1, 0, 0.8039216, 1,
1.071756, 1.152597, 0.6846845, 1, 0, 0.7960784, 1,
1.077808, -0.876182, 0.4390825, 1, 0, 0.7921569, 1,
1.078199, 0.6806728, 2.505713, 1, 0, 0.7843137, 1,
1.078994, 0.4832223, -0.9112722, 1, 0, 0.7803922, 1,
1.079413, -0.1104005, 2.977743, 1, 0, 0.772549, 1,
1.081427, -0.0856465, 2.688939, 1, 0, 0.7686275, 1,
1.081779, 0.5473953, 2.007923, 1, 0, 0.7607843, 1,
1.085433, -0.9837655, 3.457044, 1, 0, 0.7568628, 1,
1.109382, 0.7864766, 0.2937922, 1, 0, 0.7490196, 1,
1.114045, 2.744733, 0.6486247, 1, 0, 0.7450981, 1,
1.120079, -1.289987, 2.802322, 1, 0, 0.7372549, 1,
1.132406, 0.9719381, 0.6641096, 1, 0, 0.7333333, 1,
1.138585, -0.8340669, 1.838808, 1, 0, 0.7254902, 1,
1.145517, 0.07952404, 0.6862308, 1, 0, 0.7215686, 1,
1.1488, -1.01308, 2.327016, 1, 0, 0.7137255, 1,
1.151789, -0.2728822, 0.6163689, 1, 0, 0.7098039, 1,
1.152287, 0.07052293, 1.041627, 1, 0, 0.7019608, 1,
1.154185, -0.3334856, 2.122768, 1, 0, 0.6941177, 1,
1.156378, 0.4653696, 1.408747, 1, 0, 0.6901961, 1,
1.162684, -1.008338, 0.7528039, 1, 0, 0.682353, 1,
1.169641, 1.009417, -0.08378697, 1, 0, 0.6784314, 1,
1.17855, 0.2567582, 1.385072, 1, 0, 0.6705883, 1,
1.188482, 0.8710099, 1.550522, 1, 0, 0.6666667, 1,
1.194851, -0.7799747, 2.109614, 1, 0, 0.6588235, 1,
1.2016, -0.6934, 2.851644, 1, 0, 0.654902, 1,
1.206946, 0.2376184, 0.9231131, 1, 0, 0.6470588, 1,
1.208196, -1.326399, 2.261816, 1, 0, 0.6431373, 1,
1.208405, 0.8437317, 1.469406, 1, 0, 0.6352941, 1,
1.214702, 0.1145395, 2.426329, 1, 0, 0.6313726, 1,
1.215465, -0.8396564, 1.760406, 1, 0, 0.6235294, 1,
1.216787, -2.483249, 1.818957, 1, 0, 0.6196079, 1,
1.224833, 1.476775, 0.3325267, 1, 0, 0.6117647, 1,
1.232806, 0.8723037, 3.557524, 1, 0, 0.6078432, 1,
1.235146, -0.6154447, 1.521262, 1, 0, 0.6, 1,
1.239163, -1.339946, 3.511986, 1, 0, 0.5921569, 1,
1.248931, -1.01091, 0.7946314, 1, 0, 0.5882353, 1,
1.249684, 0.04212903, -0.03244232, 1, 0, 0.5803922, 1,
1.253968, 0.2135268, 2.795658, 1, 0, 0.5764706, 1,
1.261171, -0.3823883, 2.4045, 1, 0, 0.5686275, 1,
1.262341, -0.5092433, 1.669333, 1, 0, 0.5647059, 1,
1.265052, 1.197702, 0.2145551, 1, 0, 0.5568628, 1,
1.266724, 1.390456, 0.0055732, 1, 0, 0.5529412, 1,
1.267271, -1.495297, 4.52927, 1, 0, 0.5450981, 1,
1.277729, 0.5562871, -0.4452854, 1, 0, 0.5411765, 1,
1.310155, 0.2719776, 2.903253, 1, 0, 0.5333334, 1,
1.310605, 0.5954477, 0.004804761, 1, 0, 0.5294118, 1,
1.312287, -0.1964159, 1.104923, 1, 0, 0.5215687, 1,
1.320107, 0.08858674, 3.121627, 1, 0, 0.5176471, 1,
1.32282, 0.8986326, 0.3123008, 1, 0, 0.509804, 1,
1.334372, -0.5686441, 0.9517254, 1, 0, 0.5058824, 1,
1.340825, -1.625249, 1.952867, 1, 0, 0.4980392, 1,
1.35702, 0.004753403, 2.678331, 1, 0, 0.4901961, 1,
1.359346, -0.5481537, 3.140954, 1, 0, 0.4862745, 1,
1.368576, 0.8308048, 0.5173322, 1, 0, 0.4784314, 1,
1.37429, 1.471509, -1.437956, 1, 0, 0.4745098, 1,
1.380534, 1.822378, -1.764704, 1, 0, 0.4666667, 1,
1.387176, 0.4622312, 2.075569, 1, 0, 0.4627451, 1,
1.388596, -0.3326231, 2.506637, 1, 0, 0.454902, 1,
1.405585, 0.1496068, 0.4877545, 1, 0, 0.4509804, 1,
1.405725, 0.2562527, 1.348593, 1, 0, 0.4431373, 1,
1.420976, -1.556226, 2.401983, 1, 0, 0.4392157, 1,
1.426997, -1.403913, 3.946295, 1, 0, 0.4313726, 1,
1.428369, -1.181949, 2.162267, 1, 0, 0.427451, 1,
1.430496, 0.1252638, 1.004908, 1, 0, 0.4196078, 1,
1.447903, -1.560249, 1.696307, 1, 0, 0.4156863, 1,
1.453135, 1.560725, 0.135069, 1, 0, 0.4078431, 1,
1.455185, -0.93312, 2.639781, 1, 0, 0.4039216, 1,
1.460912, -1.507201, 1.1227, 1, 0, 0.3960784, 1,
1.467933, -0.08038061, 2.877088, 1, 0, 0.3882353, 1,
1.489983, -0.09579565, 3.906142, 1, 0, 0.3843137, 1,
1.505122, 0.0852076, 0.6302269, 1, 0, 0.3764706, 1,
1.521206, -0.501621, 0.3844261, 1, 0, 0.372549, 1,
1.528082, 0.8781389, 1.684918, 1, 0, 0.3647059, 1,
1.542716, -0.7774547, 1.208508, 1, 0, 0.3607843, 1,
1.558176, -0.4994971, 3.701833, 1, 0, 0.3529412, 1,
1.558235, -0.6219129, 4.541136, 1, 0, 0.3490196, 1,
1.562755, 0.08761228, 1.342732, 1, 0, 0.3411765, 1,
1.567958, 0.1485022, 2.954089, 1, 0, 0.3372549, 1,
1.582843, -1.312617, 2.110731, 1, 0, 0.3294118, 1,
1.58806, 0.1257059, 0.06700597, 1, 0, 0.3254902, 1,
1.599324, 0.05202634, 3.14352, 1, 0, 0.3176471, 1,
1.605199, 0.329847, 1.2297, 1, 0, 0.3137255, 1,
1.611332, 0.1773671, 2.708632, 1, 0, 0.3058824, 1,
1.622858, -0.4291574, 2.180404, 1, 0, 0.2980392, 1,
1.627587, 0.01047846, 3.200433, 1, 0, 0.2941177, 1,
1.636342, -0.6753442, 2.210192, 1, 0, 0.2862745, 1,
1.636806, 0.3559203, 1.526813, 1, 0, 0.282353, 1,
1.661455, 0.6428826, 2.014563, 1, 0, 0.2745098, 1,
1.665833, -1.022874, 2.450116, 1, 0, 0.2705882, 1,
1.669323, -1.408247, 3.260339, 1, 0, 0.2627451, 1,
1.675193, -0.632816, 2.139759, 1, 0, 0.2588235, 1,
1.675355, 1.039819, 1.482255, 1, 0, 0.2509804, 1,
1.686481, 0.2291874, 0.9622964, 1, 0, 0.2470588, 1,
1.6885, -0.3035067, 2.169429, 1, 0, 0.2392157, 1,
1.692438, 1.428873, 1.488461, 1, 0, 0.2352941, 1,
1.694371, 0.7042496, 1.46591, 1, 0, 0.227451, 1,
1.742463, 0.8126568, 0.6530493, 1, 0, 0.2235294, 1,
1.743921, -0.6333637, 3.164217, 1, 0, 0.2156863, 1,
1.749106, -0.7731565, 1.438524, 1, 0, 0.2117647, 1,
1.779633, -0.1976312, 1.029719, 1, 0, 0.2039216, 1,
1.780202, -1.34707, 1.483813, 1, 0, 0.1960784, 1,
1.783739, 0.6256168, 1.395045, 1, 0, 0.1921569, 1,
1.784928, 1.281621, 0.2261954, 1, 0, 0.1843137, 1,
1.793015, -0.5251867, 2.102827, 1, 0, 0.1803922, 1,
1.795156, -1.825073, 2.825844, 1, 0, 0.172549, 1,
1.823773, 1.915804, 2.171243, 1, 0, 0.1686275, 1,
1.848274, -0.4823109, 2.403935, 1, 0, 0.1607843, 1,
1.869635, 1.278326, 0.6424713, 1, 0, 0.1568628, 1,
1.876181, 0.4053668, 2.501576, 1, 0, 0.1490196, 1,
1.889718, -0.09034417, 1.285529, 1, 0, 0.145098, 1,
1.896072, -0.5253856, 1.507899, 1, 0, 0.1372549, 1,
1.905441, -0.8243859, 2.44602, 1, 0, 0.1333333, 1,
1.910638, -0.2473479, 1.918165, 1, 0, 0.1254902, 1,
1.918088, 0.4313039, 0.7585536, 1, 0, 0.1215686, 1,
1.93948, -0.8491916, 3.395355, 1, 0, 0.1137255, 1,
1.994332, 1.772314, 1.422212, 1, 0, 0.1098039, 1,
2.041548, 1.29176, -0.1309066, 1, 0, 0.1019608, 1,
2.088782, -1.055061, 1.610752, 1, 0, 0.09411765, 1,
2.101888, -0.473487, -0.2869821, 1, 0, 0.09019608, 1,
2.212214, -1.044582, 3.117789, 1, 0, 0.08235294, 1,
2.248124, -0.1425973, 3.471705, 1, 0, 0.07843138, 1,
2.292933, -1.213726, 1.646666, 1, 0, 0.07058824, 1,
2.295055, -0.05233122, 2.873334, 1, 0, 0.06666667, 1,
2.300419, -0.3119919, 2.617399, 1, 0, 0.05882353, 1,
2.322431, -0.4629747, 2.118945, 1, 0, 0.05490196, 1,
2.342367, 0.5888284, 1.853893, 1, 0, 0.04705882, 1,
2.420433, -0.2411696, 0.5617885, 1, 0, 0.04313726, 1,
2.485775, 2.061755, 2.067714, 1, 0, 0.03529412, 1,
2.533118, 1.039259, -0.6100071, 1, 0, 0.03137255, 1,
2.558236, 2.237548, 2.406393, 1, 0, 0.02352941, 1,
2.567237, 0.4142162, 3.313885, 1, 0, 0.01960784, 1,
2.717908, -0.4147988, 1.097821, 1, 0, 0.01176471, 1,
3.79841, -0.8328019, 1.594115, 1, 0, 0.007843138, 1
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
0.4567775, -3.823359, -8.49826, 0, -0.5, 0.5, 0.5,
0.4567775, -3.823359, -8.49826, 1, -0.5, 0.5, 0.5,
0.4567775, -3.823359, -8.49826, 1, 1.5, 0.5, 0.5,
0.4567775, -3.823359, -8.49826, 0, 1.5, 0.5, 0.5
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
-4.017668, 0.3343729, -8.49826, 0, -0.5, 0.5, 0.5,
-4.017668, 0.3343729, -8.49826, 1, -0.5, 0.5, 0.5,
-4.017668, 0.3343729, -8.49826, 1, 1.5, 0.5, 0.5,
-4.017668, 0.3343729, -8.49826, 0, 1.5, 0.5, 0.5
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
-4.017668, -3.823359, -0.5428495, 0, -0.5, 0.5, 0.5,
-4.017668, -3.823359, -0.5428495, 1, -0.5, 0.5, 0.5,
-4.017668, -3.823359, -0.5428495, 1, 1.5, 0.5, 0.5,
-4.017668, -3.823359, -0.5428495, 0, 1.5, 0.5, 0.5
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
-2, -2.863882, -6.662396,
3, -2.863882, -6.662396,
-2, -2.863882, -6.662396,
-2, -3.023795, -6.968373,
-1, -2.863882, -6.662396,
-1, -3.023795, -6.968373,
0, -2.863882, -6.662396,
0, -3.023795, -6.968373,
1, -2.863882, -6.662396,
1, -3.023795, -6.968373,
2, -2.863882, -6.662396,
2, -3.023795, -6.968373,
3, -2.863882, -6.662396,
3, -3.023795, -6.968373
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
-2, -3.343621, -7.580328, 0, -0.5, 0.5, 0.5,
-2, -3.343621, -7.580328, 1, -0.5, 0.5, 0.5,
-2, -3.343621, -7.580328, 1, 1.5, 0.5, 0.5,
-2, -3.343621, -7.580328, 0, 1.5, 0.5, 0.5,
-1, -3.343621, -7.580328, 0, -0.5, 0.5, 0.5,
-1, -3.343621, -7.580328, 1, -0.5, 0.5, 0.5,
-1, -3.343621, -7.580328, 1, 1.5, 0.5, 0.5,
-1, -3.343621, -7.580328, 0, 1.5, 0.5, 0.5,
0, -3.343621, -7.580328, 0, -0.5, 0.5, 0.5,
0, -3.343621, -7.580328, 1, -0.5, 0.5, 0.5,
0, -3.343621, -7.580328, 1, 1.5, 0.5, 0.5,
0, -3.343621, -7.580328, 0, 1.5, 0.5, 0.5,
1, -3.343621, -7.580328, 0, -0.5, 0.5, 0.5,
1, -3.343621, -7.580328, 1, -0.5, 0.5, 0.5,
1, -3.343621, -7.580328, 1, 1.5, 0.5, 0.5,
1, -3.343621, -7.580328, 0, 1.5, 0.5, 0.5,
2, -3.343621, -7.580328, 0, -0.5, 0.5, 0.5,
2, -3.343621, -7.580328, 1, -0.5, 0.5, 0.5,
2, -3.343621, -7.580328, 1, 1.5, 0.5, 0.5,
2, -3.343621, -7.580328, 0, 1.5, 0.5, 0.5,
3, -3.343621, -7.580328, 0, -0.5, 0.5, 0.5,
3, -3.343621, -7.580328, 1, -0.5, 0.5, 0.5,
3, -3.343621, -7.580328, 1, 1.5, 0.5, 0.5,
3, -3.343621, -7.580328, 0, 1.5, 0.5, 0.5
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
-2.985104, -2, -6.662396,
-2.985104, 3, -6.662396,
-2.985104, -2, -6.662396,
-3.157198, -2, -6.968373,
-2.985104, -1, -6.662396,
-3.157198, -1, -6.968373,
-2.985104, 0, -6.662396,
-3.157198, 0, -6.968373,
-2.985104, 1, -6.662396,
-3.157198, 1, -6.968373,
-2.985104, 2, -6.662396,
-3.157198, 2, -6.968373,
-2.985104, 3, -6.662396,
-3.157198, 3, -6.968373
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
-3.501386, -2, -7.580328, 0, -0.5, 0.5, 0.5,
-3.501386, -2, -7.580328, 1, -0.5, 0.5, 0.5,
-3.501386, -2, -7.580328, 1, 1.5, 0.5, 0.5,
-3.501386, -2, -7.580328, 0, 1.5, 0.5, 0.5,
-3.501386, -1, -7.580328, 0, -0.5, 0.5, 0.5,
-3.501386, -1, -7.580328, 1, -0.5, 0.5, 0.5,
-3.501386, -1, -7.580328, 1, 1.5, 0.5, 0.5,
-3.501386, -1, -7.580328, 0, 1.5, 0.5, 0.5,
-3.501386, 0, -7.580328, 0, -0.5, 0.5, 0.5,
-3.501386, 0, -7.580328, 1, -0.5, 0.5, 0.5,
-3.501386, 0, -7.580328, 1, 1.5, 0.5, 0.5,
-3.501386, 0, -7.580328, 0, 1.5, 0.5, 0.5,
-3.501386, 1, -7.580328, 0, -0.5, 0.5, 0.5,
-3.501386, 1, -7.580328, 1, -0.5, 0.5, 0.5,
-3.501386, 1, -7.580328, 1, 1.5, 0.5, 0.5,
-3.501386, 1, -7.580328, 0, 1.5, 0.5, 0.5,
-3.501386, 2, -7.580328, 0, -0.5, 0.5, 0.5,
-3.501386, 2, -7.580328, 1, -0.5, 0.5, 0.5,
-3.501386, 2, -7.580328, 1, 1.5, 0.5, 0.5,
-3.501386, 2, -7.580328, 0, 1.5, 0.5, 0.5,
-3.501386, 3, -7.580328, 0, -0.5, 0.5, 0.5,
-3.501386, 3, -7.580328, 1, -0.5, 0.5, 0.5,
-3.501386, 3, -7.580328, 1, 1.5, 0.5, 0.5,
-3.501386, 3, -7.580328, 0, 1.5, 0.5, 0.5
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
-2.985104, -2.863882, -6,
-2.985104, -2.863882, 4,
-2.985104, -2.863882, -6,
-3.157198, -3.023795, -6,
-2.985104, -2.863882, -4,
-3.157198, -3.023795, -4,
-2.985104, -2.863882, -2,
-3.157198, -3.023795, -2,
-2.985104, -2.863882, 0,
-3.157198, -3.023795, 0,
-2.985104, -2.863882, 2,
-3.157198, -3.023795, 2,
-2.985104, -2.863882, 4,
-3.157198, -3.023795, 4
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
-3.501386, -3.343621, -6, 0, -0.5, 0.5, 0.5,
-3.501386, -3.343621, -6, 1, -0.5, 0.5, 0.5,
-3.501386, -3.343621, -6, 1, 1.5, 0.5, 0.5,
-3.501386, -3.343621, -6, 0, 1.5, 0.5, 0.5,
-3.501386, -3.343621, -4, 0, -0.5, 0.5, 0.5,
-3.501386, -3.343621, -4, 1, -0.5, 0.5, 0.5,
-3.501386, -3.343621, -4, 1, 1.5, 0.5, 0.5,
-3.501386, -3.343621, -4, 0, 1.5, 0.5, 0.5,
-3.501386, -3.343621, -2, 0, -0.5, 0.5, 0.5,
-3.501386, -3.343621, -2, 1, -0.5, 0.5, 0.5,
-3.501386, -3.343621, -2, 1, 1.5, 0.5, 0.5,
-3.501386, -3.343621, -2, 0, 1.5, 0.5, 0.5,
-3.501386, -3.343621, 0, 0, -0.5, 0.5, 0.5,
-3.501386, -3.343621, 0, 1, -0.5, 0.5, 0.5,
-3.501386, -3.343621, 0, 1, 1.5, 0.5, 0.5,
-3.501386, -3.343621, 0, 0, 1.5, 0.5, 0.5,
-3.501386, -3.343621, 2, 0, -0.5, 0.5, 0.5,
-3.501386, -3.343621, 2, 1, -0.5, 0.5, 0.5,
-3.501386, -3.343621, 2, 1, 1.5, 0.5, 0.5,
-3.501386, -3.343621, 2, 0, 1.5, 0.5, 0.5,
-3.501386, -3.343621, 4, 0, -0.5, 0.5, 0.5,
-3.501386, -3.343621, 4, 1, -0.5, 0.5, 0.5,
-3.501386, -3.343621, 4, 1, 1.5, 0.5, 0.5,
-3.501386, -3.343621, 4, 0, 1.5, 0.5, 0.5
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
-2.985104, -2.863882, -6.662396,
-2.985104, 3.532628, -6.662396,
-2.985104, -2.863882, 5.576697,
-2.985104, 3.532628, 5.576697,
-2.985104, -2.863882, -6.662396,
-2.985104, -2.863882, 5.576697,
-2.985104, 3.532628, -6.662396,
-2.985104, 3.532628, 5.576697,
-2.985104, -2.863882, -6.662396,
3.898659, -2.863882, -6.662396,
-2.985104, -2.863882, 5.576697,
3.898659, -2.863882, 5.576697,
-2.985104, 3.532628, -6.662396,
3.898659, 3.532628, -6.662396,
-2.985104, 3.532628, 5.576697,
3.898659, 3.532628, 5.576697,
3.898659, -2.863882, -6.662396,
3.898659, 3.532628, -6.662396,
3.898659, -2.863882, 5.576697,
3.898659, 3.532628, 5.576697,
3.898659, -2.863882, -6.662396,
3.898659, -2.863882, 5.576697,
3.898659, 3.532628, -6.662396,
3.898659, 3.532628, 5.576697
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
var radius = 8.239528;
var distance = 36.65859;
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
mvMatrix.translate( -0.4567775, -0.3343729, 0.5428495 );
mvMatrix.scale( 1.294167, 1.39275, 0.7278922 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.65859);
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
prosulfuron<-read.table("prosulfuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-prosulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'prosulfuron' not found
```

```r
y<-prosulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'prosulfuron' not found
```

```r
z<-prosulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'prosulfuron' not found
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
-2.884855, -0.5236393, -2.868076, 0, 0, 1, 1, 1,
-2.872067, -0.05463854, -3.163348, 1, 0, 0, 1, 1,
-2.85064, 1.227706, -4.647127, 1, 0, 0, 1, 1,
-2.820539, 0.887182, -2.569541, 1, 0, 0, 1, 1,
-2.737144, 1.625217, -2.003004, 1, 0, 0, 1, 1,
-2.683478, -1.123499, -1.38083, 1, 0, 0, 1, 1,
-2.525232, 2.204826, -1.958945, 0, 0, 0, 1, 1,
-2.40476, -0.5251375, -1.784786, 0, 0, 0, 1, 1,
-2.40453, 0.5850912, -1.944694, 0, 0, 0, 1, 1,
-2.360845, -1.102803, -2.983703, 0, 0, 0, 1, 1,
-2.360005, -1.735495, -3.799489, 0, 0, 0, 1, 1,
-2.332734, 0.5922092, -0.1153267, 0, 0, 0, 1, 1,
-2.249146, 0.870872, 0.2655692, 0, 0, 0, 1, 1,
-2.223346, 2.145939, -1.671673, 1, 1, 1, 1, 1,
-2.155805, -0.03258776, -1.751929, 1, 1, 1, 1, 1,
-2.106321, -0.8892047, -1.585575, 1, 1, 1, 1, 1,
-2.105044, 0.6101391, -0.6345499, 1, 1, 1, 1, 1,
-2.101383, -0.2403608, -2.669817, 1, 1, 1, 1, 1,
-2.09115, -1.661404, -3.392436, 1, 1, 1, 1, 1,
-2.080228, -1.014656, -2.742404, 1, 1, 1, 1, 1,
-2.068704, 0.5823685, -0.3431861, 1, 1, 1, 1, 1,
-2.057561, -0.4665093, -1.989552, 1, 1, 1, 1, 1,
-2.031412, -0.1387687, -2.518037, 1, 1, 1, 1, 1,
-2.01074, -0.2455148, -2.157525, 1, 1, 1, 1, 1,
-1.999222, 0.835895, -1.466167, 1, 1, 1, 1, 1,
-1.975516, -1.250021, -0.7205414, 1, 1, 1, 1, 1,
-1.967022, -0.09862505, -2.996827, 1, 1, 1, 1, 1,
-1.943874, 0.3934921, -0.5863682, 1, 1, 1, 1, 1,
-1.941568, -0.4070809, -2.415966, 0, 0, 1, 1, 1,
-1.936582, 0.7008014, -0.636986, 1, 0, 0, 1, 1,
-1.936366, -0.9456124, -2.25609, 1, 0, 0, 1, 1,
-1.900328, 0.2901608, -0.6722326, 1, 0, 0, 1, 1,
-1.88186, -1.036614, -2.457302, 1, 0, 0, 1, 1,
-1.871426, 1.046397, -1.836075, 1, 0, 0, 1, 1,
-1.868259, 1.171389, -2.038142, 0, 0, 0, 1, 1,
-1.865031, -0.3780226, -1.325067, 0, 0, 0, 1, 1,
-1.859751, -2.09166, -2.406809, 0, 0, 0, 1, 1,
-1.816069, 0.2260182, -0.6745439, 0, 0, 0, 1, 1,
-1.813115, 2.329552, -1.402098, 0, 0, 0, 1, 1,
-1.806869, 0.03428117, -3.793824, 0, 0, 0, 1, 1,
-1.805154, -2.204504, -0.6524512, 0, 0, 0, 1, 1,
-1.800423, -0.8503948, -1.837005, 1, 1, 1, 1, 1,
-1.793435, -2.555347, -1.49719, 1, 1, 1, 1, 1,
-1.79232, -0.3955047, -1.347023, 1, 1, 1, 1, 1,
-1.789817, -0.9602421, -0.7254018, 1, 1, 1, 1, 1,
-1.775829, 0.05898533, -0.2597533, 1, 1, 1, 1, 1,
-1.761268, -0.4773578, -2.71218, 1, 1, 1, 1, 1,
-1.747519, -1.580896, -4.168243, 1, 1, 1, 1, 1,
-1.747136, 2.962272, -0.2693712, 1, 1, 1, 1, 1,
-1.744415, 0.08238973, -1.570183, 1, 1, 1, 1, 1,
-1.734325, -1.706089, -1.026562, 1, 1, 1, 1, 1,
-1.732089, 1.739849, -0.4796766, 1, 1, 1, 1, 1,
-1.728694, -1.371339, -1.254946, 1, 1, 1, 1, 1,
-1.727574, 0.2342114, -1.182452, 1, 1, 1, 1, 1,
-1.720427, 1.071234, -1.16631, 1, 1, 1, 1, 1,
-1.717314, 2.201744, -0.4583128, 1, 1, 1, 1, 1,
-1.704908, -0.4204205, -1.425595, 0, 0, 1, 1, 1,
-1.703681, 0.1398934, -1.342703, 1, 0, 0, 1, 1,
-1.702607, -0.9365376, -2.413755, 1, 0, 0, 1, 1,
-1.680694, -2.172932, -0.3940718, 1, 0, 0, 1, 1,
-1.675695, 1.315122, -1.286547, 1, 0, 0, 1, 1,
-1.674765, 0.7384179, -3.156591, 1, 0, 0, 1, 1,
-1.661931, 1.137871, -0.9699461, 0, 0, 0, 1, 1,
-1.651797, 1.227832, -1.038225, 0, 0, 0, 1, 1,
-1.635668, -0.4897335, -0.9655656, 0, 0, 0, 1, 1,
-1.628605, -0.6876583, -2.676679, 0, 0, 0, 1, 1,
-1.628005, -1.154542, -2.987057, 0, 0, 0, 1, 1,
-1.615874, -0.1047884, -0.6281937, 0, 0, 0, 1, 1,
-1.60709, -1.680996, -3.353345, 0, 0, 0, 1, 1,
-1.595022, 1.446836, -1.520658, 1, 1, 1, 1, 1,
-1.585214, -0.4403511, -1.032871, 1, 1, 1, 1, 1,
-1.584742, -0.3619367, -1.381603, 1, 1, 1, 1, 1,
-1.565583, -1.167704, -4.173703, 1, 1, 1, 1, 1,
-1.564908, 1.011319, -2.302501, 1, 1, 1, 1, 1,
-1.548769, -0.2799922, -1.47816, 1, 1, 1, 1, 1,
-1.545882, 1.171174, -0.2743419, 1, 1, 1, 1, 1,
-1.542043, 0.1328747, -2.112695, 1, 1, 1, 1, 1,
-1.523214, 0.2141067, -1.011628, 1, 1, 1, 1, 1,
-1.504947, 0.8508636, -0.8190322, 1, 1, 1, 1, 1,
-1.496261, -0.9884971, -2.857646, 1, 1, 1, 1, 1,
-1.492079, -0.7009468, -1.940957, 1, 1, 1, 1, 1,
-1.48939, 0.6715968, 0.8610172, 1, 1, 1, 1, 1,
-1.480625, 1.194605, -1.37505, 1, 1, 1, 1, 1,
-1.480157, 1.264951, -0.7737976, 1, 1, 1, 1, 1,
-1.477946, -0.1393028, -3.398444, 0, 0, 1, 1, 1,
-1.449731, -0.5346265, -1.256066, 1, 0, 0, 1, 1,
-1.441115, 1.093227, -0.2266215, 1, 0, 0, 1, 1,
-1.416694, -0.4655049, -1.819597, 1, 0, 0, 1, 1,
-1.398578, 1.083506, 2.293209, 1, 0, 0, 1, 1,
-1.392128, 1.406235, -0.9316837, 1, 0, 0, 1, 1,
-1.392075, 0.5872264, -1.46078, 0, 0, 0, 1, 1,
-1.388894, -0.4480431, -0.8584661, 0, 0, 0, 1, 1,
-1.386903, -0.2869236, -2.18698, 0, 0, 0, 1, 1,
-1.37829, 0.379587, -1.520382, 0, 0, 0, 1, 1,
-1.376323, -0.6492468, -3.397357, 0, 0, 0, 1, 1,
-1.375589, 0.100319, -1.291488, 0, 0, 0, 1, 1,
-1.375323, 0.1616552, -2.786088, 0, 0, 0, 1, 1,
-1.374156, 0.2036671, 0.8098708, 1, 1, 1, 1, 1,
-1.373531, 1.502515, -0.4346987, 1, 1, 1, 1, 1,
-1.359624, 0.9159227, -1.634086, 1, 1, 1, 1, 1,
-1.311768, 1.285118, -1.289032, 1, 1, 1, 1, 1,
-1.308708, -0.2402191, -0.9651017, 1, 1, 1, 1, 1,
-1.306516, -0.2259764, -3.19233, 1, 1, 1, 1, 1,
-1.297938, -0.3232048, -2.916285, 1, 1, 1, 1, 1,
-1.29597, -0.07650121, -2.512667, 1, 1, 1, 1, 1,
-1.29568, -0.4622661, -3.323241, 1, 1, 1, 1, 1,
-1.295171, -0.6171736, -3.713364, 1, 1, 1, 1, 1,
-1.289337, 1.182418, -1.097901, 1, 1, 1, 1, 1,
-1.272047, 0.1089104, -2.151638, 1, 1, 1, 1, 1,
-1.265995, -1.647959, -2.359563, 1, 1, 1, 1, 1,
-1.264022, 1.194431, 0.3426394, 1, 1, 1, 1, 1,
-1.251547, -0.304102, -1.991469, 1, 1, 1, 1, 1,
-1.240837, 1.147558, -2.282553, 0, 0, 1, 1, 1,
-1.237844, -0.3946208, -1.576057, 1, 0, 0, 1, 1,
-1.236781, -1.174281, -1.467576, 1, 0, 0, 1, 1,
-1.236439, -0.4785868, -3.03995, 1, 0, 0, 1, 1,
-1.235073, -0.6242189, -1.663703, 1, 0, 0, 1, 1,
-1.234993, 0.1850666, -2.536384, 1, 0, 0, 1, 1,
-1.224365, 1.274136, 1.370321, 0, 0, 0, 1, 1,
-1.216542, -2.093076, -4.018267, 0, 0, 0, 1, 1,
-1.214348, -0.8849733, -1.8095, 0, 0, 0, 1, 1,
-1.214001, -0.7679414, -1.786162, 0, 0, 0, 1, 1,
-1.208371, -0.8623848, -3.736988, 0, 0, 0, 1, 1,
-1.181412, -0.71313, -1.989156, 0, 0, 0, 1, 1,
-1.179899, 1.13217, -1.370122, 0, 0, 0, 1, 1,
-1.177279, 1.860602, -1.54569, 1, 1, 1, 1, 1,
-1.17481, 0.2076809, -2.246746, 1, 1, 1, 1, 1,
-1.174329, 1.289273, -2.468955, 1, 1, 1, 1, 1,
-1.168947, -0.9983385, -1.88083, 1, 1, 1, 1, 1,
-1.166202, 0.7145436, -0.445494, 1, 1, 1, 1, 1,
-1.164688, -0.1912978, -0.3813259, 1, 1, 1, 1, 1,
-1.162151, 0.492731, -1.539237, 1, 1, 1, 1, 1,
-1.144046, -1.898562, -3.419196, 1, 1, 1, 1, 1,
-1.139431, 0.5833718, -0.7796051, 1, 1, 1, 1, 1,
-1.137483, -0.7082663, -1.3541, 1, 1, 1, 1, 1,
-1.13665, 0.4463753, -0.1337296, 1, 1, 1, 1, 1,
-1.128949, -0.6069331, -1.178127, 1, 1, 1, 1, 1,
-1.127321, -1.787746, -4.100507, 1, 1, 1, 1, 1,
-1.125674, -0.4747897, -1.079026, 1, 1, 1, 1, 1,
-1.125465, 1.363167, -1.979292, 1, 1, 1, 1, 1,
-1.116475, -0.7805682, -2.892557, 0, 0, 1, 1, 1,
-1.110108, 0.04086834, -1.026654, 1, 0, 0, 1, 1,
-1.103684, 1.786652, -2.817564, 1, 0, 0, 1, 1,
-1.098265, -1.123639, -2.812593, 1, 0, 0, 1, 1,
-1.089643, -0.5497254, -2.605762, 1, 0, 0, 1, 1,
-1.087866, -0.9872453, -2.658811, 1, 0, 0, 1, 1,
-1.085421, 0.5293351, 1.160798, 0, 0, 0, 1, 1,
-1.071869, -2.209445, -3.368843, 0, 0, 0, 1, 1,
-1.059212, -0.08238053, -0.8587926, 0, 0, 0, 1, 1,
-1.057908, 0.1831043, -0.68404, 0, 0, 0, 1, 1,
-1.054167, 1.733699, 0.117662, 0, 0, 0, 1, 1,
-1.052411, 0.4113439, -0.2732558, 0, 0, 0, 1, 1,
-1.049439, 0.7082338, -1.201781, 0, 0, 0, 1, 1,
-1.048184, 0.9413004, -0.07766099, 1, 1, 1, 1, 1,
-1.045729, 1.944797, -0.7174025, 1, 1, 1, 1, 1,
-1.043033, 0.3737698, 1.508561, 1, 1, 1, 1, 1,
-1.041516, -1.113045, -3.48794, 1, 1, 1, 1, 1,
-1.038944, 1.123224, -2.212, 1, 1, 1, 1, 1,
-1.036798, 1.119517, -1.259647, 1, 1, 1, 1, 1,
-1.029103, -0.6654674, 0.1432468, 1, 1, 1, 1, 1,
-1.028729, -0.0246666, -0.100871, 1, 1, 1, 1, 1,
-1.024126, -0.2808819, -2.115401, 1, 1, 1, 1, 1,
-1.022718, 0.6571518, -1.441451, 1, 1, 1, 1, 1,
-1.018165, -1.509631, -2.724359, 1, 1, 1, 1, 1,
-1.016467, 0.5017759, -0.01827638, 1, 1, 1, 1, 1,
-1.013101, -1.387689, -2.397946, 1, 1, 1, 1, 1,
-1.003246, 0.1127178, -1.82974, 1, 1, 1, 1, 1,
-0.9911966, -1.818992, -1.419507, 1, 1, 1, 1, 1,
-0.986695, 0.4854493, -0.1916606, 0, 0, 1, 1, 1,
-0.9848701, 0.5507473, -1.691889, 1, 0, 0, 1, 1,
-0.9723364, 0.2874933, -2.841454, 1, 0, 0, 1, 1,
-0.9703542, 0.8193319, -2.051151, 1, 0, 0, 1, 1,
-0.9670618, 0.8458784, -0.06299473, 1, 0, 0, 1, 1,
-0.9619398, -0.3412963, -1.032934, 1, 0, 0, 1, 1,
-0.9448748, -0.4912398, -2.31761, 0, 0, 0, 1, 1,
-0.9440675, -0.9200597, -0.4900516, 0, 0, 0, 1, 1,
-0.9399403, 0.06932657, -1.483081, 0, 0, 0, 1, 1,
-0.9378918, 0.9862832, -1.259648, 0, 0, 0, 1, 1,
-0.9354248, -1.481905, -3.727528, 0, 0, 0, 1, 1,
-0.9294979, -0.5600768, -2.367316, 0, 0, 0, 1, 1,
-0.9294376, 0.8247313, -0.3673476, 0, 0, 0, 1, 1,
-0.9234669, -0.3199492, -1.349267, 1, 1, 1, 1, 1,
-0.9232018, -1.849928, -1.687401, 1, 1, 1, 1, 1,
-0.9228071, 0.3844081, -1.199679, 1, 1, 1, 1, 1,
-0.9217837, 0.8768009, 0.1079855, 1, 1, 1, 1, 1,
-0.9196796, 0.1073012, -0.8382781, 1, 1, 1, 1, 1,
-0.9195976, -0.1443198, -2.514439, 1, 1, 1, 1, 1,
-0.919545, 1.744598, 1.115354, 1, 1, 1, 1, 1,
-0.9156591, -1.109487, -0.8399817, 1, 1, 1, 1, 1,
-0.9145683, 0.2869811, -3.018714, 1, 1, 1, 1, 1,
-0.9115912, -1.343521, -0.4793962, 1, 1, 1, 1, 1,
-0.9074755, 0.2311224, -2.117738, 1, 1, 1, 1, 1,
-0.9017484, -0.3066128, -2.790345, 1, 1, 1, 1, 1,
-0.900571, 0.4457261, -0.734821, 1, 1, 1, 1, 1,
-0.8976485, -0.4826194, -1.671529, 1, 1, 1, 1, 1,
-0.8974121, -1.571675, -2.615815, 1, 1, 1, 1, 1,
-0.8868318, 0.30558, -1.396673, 0, 0, 1, 1, 1,
-0.8823929, -1.00247, -4.959087, 1, 0, 0, 1, 1,
-0.876981, 0.1582546, 0.005016602, 1, 0, 0, 1, 1,
-0.8751727, 0.2218667, 0.4243008, 1, 0, 0, 1, 1,
-0.8655277, 1.247398, -0.1584586, 1, 0, 0, 1, 1,
-0.8641077, -0.2137046, 0.8498015, 1, 0, 0, 1, 1,
-0.8638748, -0.9059258, -2.886394, 0, 0, 0, 1, 1,
-0.8603212, 0.2070597, -1.807764, 0, 0, 0, 1, 1,
-0.8603153, -1.908276, -2.04692, 0, 0, 0, 1, 1,
-0.8602351, 0.808488, -0.5466424, 0, 0, 0, 1, 1,
-0.8506721, 1.828005, 0.22036, 0, 0, 0, 1, 1,
-0.8487172, -0.3575633, -1.673361, 0, 0, 0, 1, 1,
-0.8460895, -0.5916525, -2.630862, 0, 0, 0, 1, 1,
-0.843118, 0.258596, -1.984548, 1, 1, 1, 1, 1,
-0.8378494, -0.8902384, -3.784598, 1, 1, 1, 1, 1,
-0.8374149, 0.575985, -1.788868, 1, 1, 1, 1, 1,
-0.8360924, 0.01372894, -2.045748, 1, 1, 1, 1, 1,
-0.8333861, 1.3863, 0.8396144, 1, 1, 1, 1, 1,
-0.8312826, 1.210014, 0.1683543, 1, 1, 1, 1, 1,
-0.8300684, -0.2190663, -2.634989, 1, 1, 1, 1, 1,
-0.8267793, 0.6902034, -0.2549724, 1, 1, 1, 1, 1,
-0.8248518, 0.1505615, -2.044086, 1, 1, 1, 1, 1,
-0.8241397, 3.439475, -0.4159647, 1, 1, 1, 1, 1,
-0.8231379, -1.954735, -1.845955, 1, 1, 1, 1, 1,
-0.8223957, -0.4351427, -1.589352, 1, 1, 1, 1, 1,
-0.8145755, -1.540642, -2.140788, 1, 1, 1, 1, 1,
-0.8143129, -0.6639776, -2.173406, 1, 1, 1, 1, 1,
-0.8117121, 0.9366845, -1.918667, 1, 1, 1, 1, 1,
-0.8074858, 1.84365, -0.9290286, 0, 0, 1, 1, 1,
-0.8056717, 0.8369826, -2.093303, 1, 0, 0, 1, 1,
-0.8028636, -0.3968988, -0.5882261, 1, 0, 0, 1, 1,
-0.7998598, -0.3586381, -3.083147, 1, 0, 0, 1, 1,
-0.7982386, 1.686921, -2.031724, 1, 0, 0, 1, 1,
-0.7944044, -0.5606713, -2.130538, 1, 0, 0, 1, 1,
-0.7927621, 0.8223264, -1.212214, 0, 0, 0, 1, 1,
-0.7918347, 0.3196237, -0.9451148, 0, 0, 0, 1, 1,
-0.79048, 1.480541, 0.5308614, 0, 0, 0, 1, 1,
-0.7887014, -1.661025, -3.67289, 0, 0, 0, 1, 1,
-0.7886589, -0.4424216, -0.9204208, 0, 0, 0, 1, 1,
-0.7878479, 0.6860192, -0.8552723, 0, 0, 0, 1, 1,
-0.7876935, 0.7779377, -0.7851104, 0, 0, 0, 1, 1,
-0.7836786, 1.337402, -0.7519892, 1, 1, 1, 1, 1,
-0.7793501, 0.531735, -0.5494601, 1, 1, 1, 1, 1,
-0.7535418, 0.3418996, -2.066723, 1, 1, 1, 1, 1,
-0.7503824, 0.3584825, -2.367167, 1, 1, 1, 1, 1,
-0.7489241, 0.9607145, 0.905793, 1, 1, 1, 1, 1,
-0.7436002, -0.4880593, -1.317008, 1, 1, 1, 1, 1,
-0.7433229, -0.7430983, -1.719184, 1, 1, 1, 1, 1,
-0.7410404, -1.08408, -2.48125, 1, 1, 1, 1, 1,
-0.7408384, 0.6423781, -1.418031, 1, 1, 1, 1, 1,
-0.7367811, 0.3535175, -1.360773, 1, 1, 1, 1, 1,
-0.7359574, -0.2810771, -3.852543, 1, 1, 1, 1, 1,
-0.7281865, -0.3360119, -1.456129, 1, 1, 1, 1, 1,
-0.727844, 1.154849, -0.606391, 1, 1, 1, 1, 1,
-0.7274551, -0.6180195, -2.500712, 1, 1, 1, 1, 1,
-0.7253699, -0.5847587, -2.095756, 1, 1, 1, 1, 1,
-0.7217541, -1.04207, -2.234302, 0, 0, 1, 1, 1,
-0.7194923, 1.148273, -1.726074, 1, 0, 0, 1, 1,
-0.7171946, 0.3779886, -0.9138683, 1, 0, 0, 1, 1,
-0.7157242, 1.114541, -0.7998008, 1, 0, 0, 1, 1,
-0.7143152, 0.2372597, -0.5464588, 1, 0, 0, 1, 1,
-0.7113314, 1.032375, -1.691594, 1, 0, 0, 1, 1,
-0.7095133, -0.8903378, -2.883386, 0, 0, 0, 1, 1,
-0.704442, -0.395418, -1.290816, 0, 0, 0, 1, 1,
-0.6966984, 1.200286, -0.9279201, 0, 0, 0, 1, 1,
-0.6908309, -0.3365872, -4.542341, 0, 0, 0, 1, 1,
-0.6891882, 1.385276, -1.166247, 0, 0, 0, 1, 1,
-0.6890332, -0.3667379, -2.825387, 0, 0, 0, 1, 1,
-0.6857039, 0.2139098, -2.615759, 0, 0, 0, 1, 1,
-0.6814375, -0.7798002, -2.135724, 1, 1, 1, 1, 1,
-0.6810652, 2.067029, -0.5526522, 1, 1, 1, 1, 1,
-0.6784726, 1.307047, -1.573031, 1, 1, 1, 1, 1,
-0.6775419, 2.048506, -0.6245165, 1, 1, 1, 1, 1,
-0.6757786, 1.378494, -0.5118337, 1, 1, 1, 1, 1,
-0.6716624, 1.129148, -3.456369, 1, 1, 1, 1, 1,
-0.6667632, -2.770729, -1.99066, 1, 1, 1, 1, 1,
-0.6654682, -0.8712352, -3.29696, 1, 1, 1, 1, 1,
-0.6639233, 0.3490005, -0.6671132, 1, 1, 1, 1, 1,
-0.6637121, 1.262862, -1.47636, 1, 1, 1, 1, 1,
-0.6635526, 1.401191, 0.843977, 1, 1, 1, 1, 1,
-0.6606793, 0.6865671, 0.1221133, 1, 1, 1, 1, 1,
-0.6604507, 1.087655, -1.684043, 1, 1, 1, 1, 1,
-0.6568475, 0.2110898, -1.381535, 1, 1, 1, 1, 1,
-0.6556522, 0.1904019, -3.910941, 1, 1, 1, 1, 1,
-0.6532164, 0.1003874, -1.190796, 0, 0, 1, 1, 1,
-0.6522701, -0.3930977, -1.115273, 1, 0, 0, 1, 1,
-0.650804, -0.5097474, -2.445535, 1, 0, 0, 1, 1,
-0.6472462, -0.1507975, -3.874686, 1, 0, 0, 1, 1,
-0.6403364, 0.6434337, 0.5662701, 1, 0, 0, 1, 1,
-0.6379842, 0.1734613, -0.7179469, 1, 0, 0, 1, 1,
-0.6329942, -0.8409858, -1.494387, 0, 0, 0, 1, 1,
-0.6323924, -0.6824694, -1.724417, 0, 0, 0, 1, 1,
-0.6290652, -0.1951376, -2.446087, 0, 0, 0, 1, 1,
-0.6284743, -0.8017054, -4.238551, 0, 0, 0, 1, 1,
-0.626266, -1.032258, -3.702058, 0, 0, 0, 1, 1,
-0.6249971, -0.2565013, -2.291843, 0, 0, 0, 1, 1,
-0.6197852, -0.3398143, -2.940286, 0, 0, 0, 1, 1,
-0.6185892, 1.285002, -1.298114, 1, 1, 1, 1, 1,
-0.6158608, -1.250573, -2.490471, 1, 1, 1, 1, 1,
-0.6131488, 0.4546005, -0.6168073, 1, 1, 1, 1, 1,
-0.6084193, 0.07785457, -0.4973126, 1, 1, 1, 1, 1,
-0.6028162, 0.3470539, -0.5105276, 1, 1, 1, 1, 1,
-0.5984214, 0.07617878, -3.43819, 1, 1, 1, 1, 1,
-0.5961075, -0.9339833, -2.359359, 1, 1, 1, 1, 1,
-0.5948927, -0.6555159, -2.685146, 1, 1, 1, 1, 1,
-0.5943346, 0.7053283, -0.829708, 1, 1, 1, 1, 1,
-0.5916509, 1.735141, -2.913602, 1, 1, 1, 1, 1,
-0.5906125, -0.4061504, -0.4842117, 1, 1, 1, 1, 1,
-0.5834551, 0.01438767, -2.522144, 1, 1, 1, 1, 1,
-0.5783079, -0.04103029, -1.924438, 1, 1, 1, 1, 1,
-0.5735219, 0.02873515, -1.675127, 1, 1, 1, 1, 1,
-0.5729375, 2.272806, 2.205368, 1, 1, 1, 1, 1,
-0.5721135, 1.02694, 1.043797, 0, 0, 1, 1, 1,
-0.5689266, 0.2277591, -0.1210106, 1, 0, 0, 1, 1,
-0.5670416, 0.04246764, -2.914404, 1, 0, 0, 1, 1,
-0.5657141, 2.651153, -0.5474358, 1, 0, 0, 1, 1,
-0.5632384, 1.679205, 0.7475129, 1, 0, 0, 1, 1,
-0.5602097, 0.8747164, 0.9702186, 1, 0, 0, 1, 1,
-0.5583708, 0.151793, -0.5913521, 0, 0, 0, 1, 1,
-0.556522, 0.3243885, -1.536513, 0, 0, 0, 1, 1,
-0.5561696, -0.8191849, -2.975825, 0, 0, 0, 1, 1,
-0.5549163, -0.1634571, -2.326809, 0, 0, 0, 1, 1,
-0.5547006, -0.9250507, -2.741419, 0, 0, 0, 1, 1,
-0.5546876, -0.9538469, -2.150342, 0, 0, 0, 1, 1,
-0.5537762, 2.288727, -0.4844928, 0, 0, 0, 1, 1,
-0.5517167, -0.151775, -1.6203, 1, 1, 1, 1, 1,
-0.5512019, -0.0624853, -1.627001, 1, 1, 1, 1, 1,
-0.5503369, 0.8111525, 0.7429779, 1, 1, 1, 1, 1,
-0.5447552, 0.04991354, -1.376967, 1, 1, 1, 1, 1,
-0.5428498, 1.364366, 0.9149672, 1, 1, 1, 1, 1,
-0.5318027, 0.7503446, -0.6466582, 1, 1, 1, 1, 1,
-0.529807, -0.6568484, -2.204331, 1, 1, 1, 1, 1,
-0.5282657, -0.01052599, 0.1476617, 1, 1, 1, 1, 1,
-0.5261187, -1.6471, -3.482181, 1, 1, 1, 1, 1,
-0.5241147, 0.9283052, -0.3343367, 1, 1, 1, 1, 1,
-0.5198597, -0.3922434, -2.544284, 1, 1, 1, 1, 1,
-0.5190256, 0.3774658, -1.028821, 1, 1, 1, 1, 1,
-0.5185641, -0.56436, -2.142576, 1, 1, 1, 1, 1,
-0.517187, -0.8992006, -3.36252, 1, 1, 1, 1, 1,
-0.5169709, -0.2463916, -2.009093, 1, 1, 1, 1, 1,
-0.5160927, 0.3191322, -2.554827, 0, 0, 1, 1, 1,
-0.5088188, 0.8150735, -1.208034, 1, 0, 0, 1, 1,
-0.5082201, 2.168258, -0.151528, 1, 0, 0, 1, 1,
-0.4995173, 0.2354507, 0.6099176, 1, 0, 0, 1, 1,
-0.4925672, 0.4878308, -0.5315591, 1, 0, 0, 1, 1,
-0.4912236, -0.1611123, -1.781552, 1, 0, 0, 1, 1,
-0.4898136, 0.3602281, -1.983703, 0, 0, 0, 1, 1,
-0.4842315, 0.3772772, -0.1868855, 0, 0, 0, 1, 1,
-0.4833362, 0.3748507, 0.1342547, 0, 0, 0, 1, 1,
-0.4796401, -0.2527423, -3.954195, 0, 0, 0, 1, 1,
-0.4782032, -0.2140161, -0.5787041, 0, 0, 0, 1, 1,
-0.4755858, 0.9228206, -1.615961, 0, 0, 0, 1, 1,
-0.4731667, -0.5858153, -2.348492, 0, 0, 0, 1, 1,
-0.4730831, -0.1156411, -2.304714, 1, 1, 1, 1, 1,
-0.472028, 0.3384936, -1.341532, 1, 1, 1, 1, 1,
-0.4708764, -1.157847, -2.99374, 1, 1, 1, 1, 1,
-0.4700888, 1.375768, 0.8492908, 1, 1, 1, 1, 1,
-0.4682779, -2.399722, -3.825374, 1, 1, 1, 1, 1,
-0.4614438, 1.652364, 0.1012403, 1, 1, 1, 1, 1,
-0.4578934, -0.06956564, -3.218378, 1, 1, 1, 1, 1,
-0.4569203, 0.4522535, -0.7895444, 1, 1, 1, 1, 1,
-0.4550619, -0.597178, -2.51149, 1, 1, 1, 1, 1,
-0.453209, -0.9251203, -3.966104, 1, 1, 1, 1, 1,
-0.4523277, 0.8139778, -0.8239267, 1, 1, 1, 1, 1,
-0.449623, -0.4521826, -1.820201, 1, 1, 1, 1, 1,
-0.4469514, -0.4013748, -2.437027, 1, 1, 1, 1, 1,
-0.4466526, 0.8993814, -0.6348746, 1, 1, 1, 1, 1,
-0.4463006, -0.6601793, -3.361709, 1, 1, 1, 1, 1,
-0.4421893, -0.5172633, -2.717478, 0, 0, 1, 1, 1,
-0.4414431, 0.2580673, -0.5408216, 1, 0, 0, 1, 1,
-0.4400737, 1.135523, -0.2853683, 1, 0, 0, 1, 1,
-0.4311863, 2.433507, 0.2787942, 1, 0, 0, 1, 1,
-0.4175849, -0.4123622, -1.637934, 1, 0, 0, 1, 1,
-0.4168362, -0.9875989, -1.616505, 1, 0, 0, 1, 1,
-0.410132, -2.593774, -3.301381, 0, 0, 0, 1, 1,
-0.4096718, -0.2247068, -3.693004, 0, 0, 0, 1, 1,
-0.4033723, -0.7864463, -4.366546, 0, 0, 0, 1, 1,
-0.40231, 1.813549, 0.5493863, 0, 0, 0, 1, 1,
-0.3985498, 1.471593, -2.499535, 0, 0, 0, 1, 1,
-0.3967166, -0.2221726, -0.8899183, 0, 0, 0, 1, 1,
-0.3948835, 2.462155, 1.233159, 0, 0, 0, 1, 1,
-0.389764, 0.8878013, 0.311925, 1, 1, 1, 1, 1,
-0.3857416, -2.35311, -2.967119, 1, 1, 1, 1, 1,
-0.38535, 1.039558, -0.3094273, 1, 1, 1, 1, 1,
-0.3837495, -0.3556108, -3.275154, 1, 1, 1, 1, 1,
-0.3818046, -0.4939621, -2.794384, 1, 1, 1, 1, 1,
-0.377633, -1.745121, -2.207558, 1, 1, 1, 1, 1,
-0.3765522, -0.9403852, -2.299972, 1, 1, 1, 1, 1,
-0.3705668, -1.702665, -3.693594, 1, 1, 1, 1, 1,
-0.3674738, -0.9176055, -3.171964, 1, 1, 1, 1, 1,
-0.3634078, -0.09343544, -0.9251022, 1, 1, 1, 1, 1,
-0.363302, -0.2424409, -2.186074, 1, 1, 1, 1, 1,
-0.3621193, 0.7813681, 0.2933976, 1, 1, 1, 1, 1,
-0.3596057, 1.795646, 1.673203, 1, 1, 1, 1, 1,
-0.3591467, 0.3594327, -0.6950752, 1, 1, 1, 1, 1,
-0.3524694, -0.089365, -1.881332, 1, 1, 1, 1, 1,
-0.3474576, 0.3149001, -2.456066, 0, 0, 1, 1, 1,
-0.3457865, -0.2234787, -2.173448, 1, 0, 0, 1, 1,
-0.342641, -2.378759, -3.110111, 1, 0, 0, 1, 1,
-0.3424028, 1.645128, -0.4302369, 1, 0, 0, 1, 1,
-0.3393517, -1.493318, -2.88678, 1, 0, 0, 1, 1,
-0.3359125, -1.332371, -3.447991, 1, 0, 0, 1, 1,
-0.3356293, -1.083859, -1.113201, 0, 0, 0, 1, 1,
-0.3353361, -1.027397, -1.730233, 0, 0, 0, 1, 1,
-0.3341507, -0.1347836, -2.543976, 0, 0, 0, 1, 1,
-0.3323418, -0.7679083, -2.53289, 0, 0, 0, 1, 1,
-0.3311955, 0.424024, -0.8810969, 0, 0, 0, 1, 1,
-0.3290773, 0.2540286, -0.1246484, 0, 0, 0, 1, 1,
-0.3256944, 0.06785269, -1.728451, 0, 0, 0, 1, 1,
-0.3217316, 0.6504232, -0.9567503, 1, 1, 1, 1, 1,
-0.3127362, -0.8225791, -1.152307, 1, 1, 1, 1, 1,
-0.3045677, -1.558114, -4.15492, 1, 1, 1, 1, 1,
-0.3029152, 0.6363927, -0.4024246, 1, 1, 1, 1, 1,
-0.3012954, -1.312261, -3.010416, 1, 1, 1, 1, 1,
-0.2990243, -0.2782269, -2.979239, 1, 1, 1, 1, 1,
-0.2973563, 0.4554205, 0.01281211, 1, 1, 1, 1, 1,
-0.2955828, 1.538421, 0.7601417, 1, 1, 1, 1, 1,
-0.2946166, -1.501087, -3.597218, 1, 1, 1, 1, 1,
-0.2941015, 0.1490549, -1.220359, 1, 1, 1, 1, 1,
-0.2939287, -2.353132, -1.776491, 1, 1, 1, 1, 1,
-0.2864266, -0.3333428, -4.365612, 1, 1, 1, 1, 1,
-0.2843924, 1.402228, 0.2794473, 1, 1, 1, 1, 1,
-0.2825109, -0.325417, -1.963725, 1, 1, 1, 1, 1,
-0.2791745, 0.08687797, 0.1950189, 1, 1, 1, 1, 1,
-0.2782008, 1.052341, -1.187995, 0, 0, 1, 1, 1,
-0.2773312, -2.042649, -1.712658, 1, 0, 0, 1, 1,
-0.2761935, 1.841846, 0.4862217, 1, 0, 0, 1, 1,
-0.2758809, -1.551751, -4.762704, 1, 0, 0, 1, 1,
-0.2717194, -0.5319207, -2.581989, 1, 0, 0, 1, 1,
-0.2701086, -0.95192, -1.979308, 1, 0, 0, 1, 1,
-0.2645128, -0.1527059, -2.342127, 0, 0, 0, 1, 1,
-0.2634529, 0.9776875, 1.704303, 0, 0, 0, 1, 1,
-0.2488002, -0.5637975, -3.594676, 0, 0, 0, 1, 1,
-0.2467385, 0.7120529, -0.8215249, 0, 0, 0, 1, 1,
-0.2450395, 1.378515, 0.4378845, 0, 0, 0, 1, 1,
-0.244425, 1.137207, -0.632671, 0, 0, 0, 1, 1,
-0.2429882, -0.3983591, -3.436721, 0, 0, 0, 1, 1,
-0.2425118, 0.7884056, 0.138666, 1, 1, 1, 1, 1,
-0.2411927, 2.143716, 0.7847487, 1, 1, 1, 1, 1,
-0.235751, -1.904719, -3.953001, 1, 1, 1, 1, 1,
-0.2342423, -0.870545, -0.8930411, 1, 1, 1, 1, 1,
-0.2294042, -0.5552382, -2.411895, 1, 1, 1, 1, 1,
-0.2276668, 0.2685363, -1.157316, 1, 1, 1, 1, 1,
-0.2264115, -1.387193, -3.947333, 1, 1, 1, 1, 1,
-0.225867, -0.8994625, -2.614532, 1, 1, 1, 1, 1,
-0.2252541, -0.1234907, -2.181128, 1, 1, 1, 1, 1,
-0.2248035, -1.575311, -4.994091, 1, 1, 1, 1, 1,
-0.2236587, 2.05813, -1.155788, 1, 1, 1, 1, 1,
-0.2231618, -0.3447787, -1.547178, 1, 1, 1, 1, 1,
-0.2190578, 0.857963, 0.7116605, 1, 1, 1, 1, 1,
-0.218366, 0.6094802, -0.8657159, 1, 1, 1, 1, 1,
-0.216262, 0.9706041, -0.9462381, 1, 1, 1, 1, 1,
-0.2128204, -1.050031, -2.366061, 0, 0, 1, 1, 1,
-0.2076278, -1.147692, -2.422223, 1, 0, 0, 1, 1,
-0.2065607, -2.69432, -2.977805, 1, 0, 0, 1, 1,
-0.2064078, -0.994643, -3.580229, 1, 0, 0, 1, 1,
-0.2028511, 1.394053, 0.7148708, 1, 0, 0, 1, 1,
-0.2023056, -1.02535, -2.769202, 1, 0, 0, 1, 1,
-0.2016242, 0.3700175, -2.09432, 0, 0, 0, 1, 1,
-0.2010447, -0.7205819, -3.759903, 0, 0, 0, 1, 1,
-0.198816, -0.03801187, -1.180114, 0, 0, 0, 1, 1,
-0.1975089, -0.7149104, -2.111135, 0, 0, 0, 1, 1,
-0.1862397, 0.414194, 0.3761543, 0, 0, 0, 1, 1,
-0.1818855, 1.325683, 0.6724968, 0, 0, 0, 1, 1,
-0.1803886, -0.1319866, -0.3089869, 0, 0, 0, 1, 1,
-0.1795948, -0.261539, -2.253801, 1, 1, 1, 1, 1,
-0.1726069, -1.064294, -3.015155, 1, 1, 1, 1, 1,
-0.1725585, -1.82695, -4.077846, 1, 1, 1, 1, 1,
-0.1697677, -0.5310895, -1.662145, 1, 1, 1, 1, 1,
-0.1686282, -0.9637607, -3.341395, 1, 1, 1, 1, 1,
-0.1653334, 0.7348889, -0.1372428, 1, 1, 1, 1, 1,
-0.1613945, 1.198458, -1.227819, 1, 1, 1, 1, 1,
-0.1597197, -0.3064858, -3.339478, 1, 1, 1, 1, 1,
-0.1460489, 0.3090454, 0.1393349, 1, 1, 1, 1, 1,
-0.1459682, -0.9512144, -2.583092, 1, 1, 1, 1, 1,
-0.1439454, 0.8408492, -0.3092324, 1, 1, 1, 1, 1,
-0.1419915, -0.7597393, -1.993124, 1, 1, 1, 1, 1,
-0.1393319, -0.5582565, -2.741296, 1, 1, 1, 1, 1,
-0.1375709, 0.05357337, -2.143806, 1, 1, 1, 1, 1,
-0.1355935, 0.7194152, -1.756678, 1, 1, 1, 1, 1,
-0.1337226, 0.9502644, -0.2798232, 0, 0, 1, 1, 1,
-0.1322826, 0.4900802, 1.006057, 1, 0, 0, 1, 1,
-0.1289008, -0.2404799, -2.116769, 1, 0, 0, 1, 1,
-0.122682, -1.254572, -3.416622, 1, 0, 0, 1, 1,
-0.1223986, -1.974291, -3.385386, 1, 0, 0, 1, 1,
-0.1187602, -0.6566131, -3.079447, 1, 0, 0, 1, 1,
-0.1181899, -0.1131526, -1.389473, 0, 0, 0, 1, 1,
-0.1173689, -0.09533043, -2.524879, 0, 0, 0, 1, 1,
-0.1172458, 1.777595, -0.01429972, 0, 0, 0, 1, 1,
-0.1165386, -0.5332997, -2.593328, 0, 0, 0, 1, 1,
-0.113575, 1.146968, 0.6103484, 0, 0, 0, 1, 1,
-0.1126897, 0.01484748, -1.434461, 0, 0, 0, 1, 1,
-0.1114522, 1.520273, 2.054911, 0, 0, 0, 1, 1,
-0.110608, 0.166721, 1.422173, 1, 1, 1, 1, 1,
-0.1102829, 0.3324208, -0.06792733, 1, 1, 1, 1, 1,
-0.108554, -0.3806042, -3.184404, 1, 1, 1, 1, 1,
-0.1035947, 0.1018694, -1.200009, 1, 1, 1, 1, 1,
-0.1034267, 1.486281, 0.2675267, 1, 1, 1, 1, 1,
-0.09952253, 1.5414, 0.5786678, 1, 1, 1, 1, 1,
-0.09865537, 0.7029856, -0.9488831, 1, 1, 1, 1, 1,
-0.0918493, 1.572887, 1.704673, 1, 1, 1, 1, 1,
-0.09183004, -0.1008999, -2.147251, 1, 1, 1, 1, 1,
-0.09180709, 0.6949316, -0.8502603, 1, 1, 1, 1, 1,
-0.08700255, -0.02879926, -0.2359749, 1, 1, 1, 1, 1,
-0.08434161, -0.1174951, -3.44423, 1, 1, 1, 1, 1,
-0.08203387, -0.9075208, -4.121429, 1, 1, 1, 1, 1,
-0.08041769, -0.707946, -3.233489, 1, 1, 1, 1, 1,
-0.07944269, -0.4273781, -2.465289, 1, 1, 1, 1, 1,
-0.07680835, -0.4933689, -2.619264, 0, 0, 1, 1, 1,
-0.07591566, -1.611736, -3.469112, 1, 0, 0, 1, 1,
-0.07493418, -1.681763, -3.65578, 1, 0, 0, 1, 1,
-0.07144492, 0.5332202, -1.523183, 1, 0, 0, 1, 1,
-0.06973961, -1.295296, -3.953614, 1, 0, 0, 1, 1,
-0.06209928, 0.5761033, -1.937809, 1, 0, 0, 1, 1,
-0.06007766, 0.4188151, 0.5293767, 0, 0, 0, 1, 1,
-0.05263665, -1.902308, -2.470809, 0, 0, 0, 1, 1,
-0.04453954, 0.6705255, -0.8686698, 0, 0, 0, 1, 1,
-0.04120952, 1.317897, -0.5028118, 0, 0, 0, 1, 1,
-0.04020573, 0.1460512, 0.5419118, 0, 0, 0, 1, 1,
-0.03919327, 0.1645903, -0.07732109, 0, 0, 0, 1, 1,
-0.03720395, 0.1327179, 0.12655, 0, 0, 0, 1, 1,
-0.03553034, -0.1380753, -3.119519, 1, 1, 1, 1, 1,
-0.03488646, -0.7644064, -2.345725, 1, 1, 1, 1, 1,
-0.03217622, -0.434367, -1.877537, 1, 1, 1, 1, 1,
-0.02712406, 2.125993, 0.5700542, 1, 1, 1, 1, 1,
-0.02349833, -0.4305481, -2.055685, 1, 1, 1, 1, 1,
-0.02082251, -0.3117214, -1.872033, 1, 1, 1, 1, 1,
-0.02067352, -1.251132, -3.209709, 1, 1, 1, 1, 1,
-0.01789609, -1.785103, -4.999515, 1, 1, 1, 1, 1,
-0.01787119, -0.920313, -4.093513, 1, 1, 1, 1, 1,
-0.01184596, -0.1306541, -4.845917, 1, 1, 1, 1, 1,
-0.01104659, -0.006174499, -1.711773, 1, 1, 1, 1, 1,
-0.009106133, 1.819885, 1.268385, 1, 1, 1, 1, 1,
-0.007508508, -1.440328, -6.484157, 1, 1, 1, 1, 1,
-0.005307988, 0.7404381, -0.6480249, 1, 1, 1, 1, 1,
-0.001640043, -0.01912981, -1.831669, 1, 1, 1, 1, 1,
-0.00156152, -1.672926, -3.890822, 0, 0, 1, 1, 1,
0.001053276, -1.813503, 2.648581, 1, 0, 0, 1, 1,
0.004987061, -0.8787968, 3.184489, 1, 0, 0, 1, 1,
0.01049297, -1.95034, 3.401757, 1, 0, 0, 1, 1,
0.01467842, -1.532642, 2.944487, 1, 0, 0, 1, 1,
0.02229435, -0.9293882, 2.716846, 1, 0, 0, 1, 1,
0.02616322, -0.5186252, 2.999398, 0, 0, 0, 1, 1,
0.02736806, -0.3251125, 1.968071, 0, 0, 0, 1, 1,
0.03944436, -0.03501443, 2.842189, 0, 0, 0, 1, 1,
0.04656813, 0.5020633, 2.266639, 0, 0, 0, 1, 1,
0.05002134, 0.5136803, 0.6872219, 0, 0, 0, 1, 1,
0.05241612, 0.5274909, 0.1222233, 0, 0, 0, 1, 1,
0.06269838, -0.5484439, 1.54946, 0, 0, 0, 1, 1,
0.06800102, 0.038146, -0.7734455, 1, 1, 1, 1, 1,
0.06904399, 0.2719364, -0.6202297, 1, 1, 1, 1, 1,
0.07072312, -1.151335, 3.787432, 1, 1, 1, 1, 1,
0.07221283, 0.6336042, -0.5380483, 1, 1, 1, 1, 1,
0.07695014, 0.7763484, -0.4856557, 1, 1, 1, 1, 1,
0.07817641, -2.372043, 3.7097, 1, 1, 1, 1, 1,
0.08545952, -1.702343, 3.964104, 1, 1, 1, 1, 1,
0.0862662, -0.4989401, 1.828492, 1, 1, 1, 1, 1,
0.08757441, 1.405436, 2.096602, 1, 1, 1, 1, 1,
0.08762474, 0.9613999, -0.5022665, 1, 1, 1, 1, 1,
0.08764249, 0.03338116, 2.344962, 1, 1, 1, 1, 1,
0.08808643, 0.8516469, -1.561522, 1, 1, 1, 1, 1,
0.08919357, 1.631365, 0.2865463, 1, 1, 1, 1, 1,
0.09531306, 0.4403099, -0.2371894, 1, 1, 1, 1, 1,
0.09614329, -0.5137469, 3.567112, 1, 1, 1, 1, 1,
0.09763473, 0.528245, 0.426083, 0, 0, 1, 1, 1,
0.09844609, 0.3989721, -0.4425384, 1, 0, 0, 1, 1,
0.09845964, 0.9976388, -1.663957, 1, 0, 0, 1, 1,
0.1004759, -0.7677156, 2.002773, 1, 0, 0, 1, 1,
0.1014752, 0.09869576, 0.2121373, 1, 0, 0, 1, 1,
0.1053899, -0.8443509, 2.565007, 1, 0, 0, 1, 1,
0.1079972, -1.756095, 2.69874, 0, 0, 0, 1, 1,
0.1081527, -0.1885349, 3.184037, 0, 0, 0, 1, 1,
0.1105185, 0.267969, -1.089084, 0, 0, 0, 1, 1,
0.112222, -0.7725444, 3.453134, 0, 0, 0, 1, 1,
0.1174839, 1.034762, -0.5202214, 0, 0, 0, 1, 1,
0.1177124, -0.08790407, 4.523543, 0, 0, 0, 1, 1,
0.1240859, -0.7080947, 3.757284, 0, 0, 0, 1, 1,
0.1309236, 0.9110257, 0.7521818, 1, 1, 1, 1, 1,
0.133663, -0.5596887, 2.892038, 1, 1, 1, 1, 1,
0.1339327, 0.9359019, -0.9383829, 1, 1, 1, 1, 1,
0.1339421, -0.06008314, 3.834904, 1, 1, 1, 1, 1,
0.1415619, -2.257922, 2.135646, 1, 1, 1, 1, 1,
0.1423468, 0.3975968, 2.630914, 1, 1, 1, 1, 1,
0.1428292, 1.085894, -0.1806202, 1, 1, 1, 1, 1,
0.1431151, -1.576556, 2.153613, 1, 1, 1, 1, 1,
0.1489103, -1.513507, 3.966424, 1, 1, 1, 1, 1,
0.1506004, -0.6856424, 4.364454, 1, 1, 1, 1, 1,
0.1517082, -0.7591197, 4.685448, 1, 1, 1, 1, 1,
0.1560222, -0.1158073, 1.238113, 1, 1, 1, 1, 1,
0.1614036, -0.2677074, 1.612005, 1, 1, 1, 1, 1,
0.1619908, 0.2050022, 0.4690669, 1, 1, 1, 1, 1,
0.1635623, -1.343301, 2.677738, 1, 1, 1, 1, 1,
0.1637272, -0.1141484, 2.569961, 0, 0, 1, 1, 1,
0.1645941, 0.3725811, 0.2189972, 1, 0, 0, 1, 1,
0.1658085, 0.8914455, 1.178278, 1, 0, 0, 1, 1,
0.1771988, -0.7201978, 1.872689, 1, 0, 0, 1, 1,
0.1810012, 0.6337179, -0.5779523, 1, 0, 0, 1, 1,
0.1867076, -1.472862, 1.999985, 1, 0, 0, 1, 1,
0.1902717, 1.227224, 1.77732, 0, 0, 0, 1, 1,
0.1942789, 0.2576647, -0.8918479, 0, 0, 0, 1, 1,
0.1946397, -1.220268, 3.199211, 0, 0, 0, 1, 1,
0.1972725, 1.153654, -1.217816, 0, 0, 0, 1, 1,
0.2026197, 1.01474, -0.3802097, 0, 0, 0, 1, 1,
0.2027331, -2.635513, 3.418906, 0, 0, 0, 1, 1,
0.2039839, 1.331229, -0.2678377, 0, 0, 0, 1, 1,
0.2044448, 1.303013, 0.005451835, 1, 1, 1, 1, 1,
0.2075815, 0.0474817, 0.8995538, 1, 1, 1, 1, 1,
0.207945, -1.649784, 3.723978, 1, 1, 1, 1, 1,
0.2102364, 1.646577, 0.9731114, 1, 1, 1, 1, 1,
0.2123331, 1.295333, 1.603807, 1, 1, 1, 1, 1,
0.2217131, 1.033262, -1.133812, 1, 1, 1, 1, 1,
0.226499, -1.519165, 3.6672, 1, 1, 1, 1, 1,
0.2269263, -0.7438185, 4.523534, 1, 1, 1, 1, 1,
0.2277918, 1.566731, 0.6851953, 1, 1, 1, 1, 1,
0.2284047, 0.1093653, 1.629327, 1, 1, 1, 1, 1,
0.2312575, 1.107956, -0.3926045, 1, 1, 1, 1, 1,
0.2338875, -0.1980606, 0.9185799, 1, 1, 1, 1, 1,
0.2358807, -0.01341628, 1.197659, 1, 1, 1, 1, 1,
0.2376903, 0.2367055, 1.364871, 1, 1, 1, 1, 1,
0.2380863, -0.1248922, 3.105094, 1, 1, 1, 1, 1,
0.2443512, -1.618158, 2.799603, 0, 0, 1, 1, 1,
0.249436, -0.07802079, 2.609704, 1, 0, 0, 1, 1,
0.2496581, 0.8092363, -0.778802, 1, 0, 0, 1, 1,
0.2552204, -1.846938, 2.333611, 1, 0, 0, 1, 1,
0.2561274, 1.201643, -1.71585, 1, 0, 0, 1, 1,
0.2600326, 0.9145238, -0.07035737, 1, 0, 0, 1, 1,
0.2658737, 0.430955, 0.04078588, 0, 0, 0, 1, 1,
0.2700856, -1.332845, 2.632149, 0, 0, 0, 1, 1,
0.2727828, -0.09111888, 1.541697, 0, 0, 0, 1, 1,
0.27736, -2.123592, 2.946558, 0, 0, 0, 1, 1,
0.2797301, -0.7039228, 5.398458, 0, 0, 0, 1, 1,
0.280728, 0.6087914, -0.9857153, 0, 0, 0, 1, 1,
0.2876029, 0.8724833, -0.2819179, 0, 0, 0, 1, 1,
0.289825, -0.4013291, 0.9147759, 1, 1, 1, 1, 1,
0.293638, 0.6923665, 2.572574, 1, 1, 1, 1, 1,
0.2948593, 1.764678, -1.473342, 1, 1, 1, 1, 1,
0.295857, 1.344319, -0.3417651, 1, 1, 1, 1, 1,
0.2970202, -0.6626357, 3.324693, 1, 1, 1, 1, 1,
0.3088622, 0.1544011, 1.008286, 1, 1, 1, 1, 1,
0.3100561, 1.487241, -0.4715679, 1, 1, 1, 1, 1,
0.3175002, 0.3573433, 0.3517221, 1, 1, 1, 1, 1,
0.3186979, -0.2403959, 1.334744, 1, 1, 1, 1, 1,
0.3188693, -0.1155496, 2.854479, 1, 1, 1, 1, 1,
0.3204511, -0.8290978, 4.934915, 1, 1, 1, 1, 1,
0.3214042, 1.228133, 0.4379443, 1, 1, 1, 1, 1,
0.3221888, -0.009493788, 1.738225, 1, 1, 1, 1, 1,
0.3225272, -0.400667, 5.364085, 1, 1, 1, 1, 1,
0.3238066, -0.330164, 2.919641, 1, 1, 1, 1, 1,
0.3247572, 0.4090236, 0.3225793, 0, 0, 1, 1, 1,
0.3262395, -0.7131681, 2.868048, 1, 0, 0, 1, 1,
0.3302404, 0.4521072, 2.093632, 1, 0, 0, 1, 1,
0.3351817, -0.8923011, 3.032963, 1, 0, 0, 1, 1,
0.3353376, -0.3931741, 1.014349, 1, 0, 0, 1, 1,
0.3358136, 0.6038552, 0.6376723, 1, 0, 0, 1, 1,
0.3371392, 0.2346845, 1.572799, 0, 0, 0, 1, 1,
0.3386326, 0.3327885, 0.5349257, 0, 0, 0, 1, 1,
0.3393351, -0.0782788, 1.959814, 0, 0, 0, 1, 1,
0.3457789, -0.2520352, 1.573201, 0, 0, 0, 1, 1,
0.346167, -0.005865352, 0.5060923, 0, 0, 0, 1, 1,
0.3486859, 0.8974568, -0.9306967, 0, 0, 0, 1, 1,
0.3531076, 0.4585146, 1.761598, 0, 0, 0, 1, 1,
0.3559568, -0.4752978, 1.94006, 1, 1, 1, 1, 1,
0.3589781, -0.3074888, 0.1393496, 1, 1, 1, 1, 1,
0.3589888, -2.200186, 3.075478, 1, 1, 1, 1, 1,
0.3603254, -0.1280486, 0.2955903, 1, 1, 1, 1, 1,
0.3620802, -0.1976747, 2.256141, 1, 1, 1, 1, 1,
0.3622701, -0.06886791, 0.2907242, 1, 1, 1, 1, 1,
0.3626011, -0.7312893, 3.397839, 1, 1, 1, 1, 1,
0.3633322, 0.795445, -0.8968241, 1, 1, 1, 1, 1,
0.3660229, 1.316335, 0.2159214, 1, 1, 1, 1, 1,
0.3778091, 0.7826458, 0.6207015, 1, 1, 1, 1, 1,
0.3823809, 1.053008, 0.748939, 1, 1, 1, 1, 1,
0.3833964, 0.5348651, 2.144749, 1, 1, 1, 1, 1,
0.3845338, 0.2733822, 0.1767705, 1, 1, 1, 1, 1,
0.3860542, -2.236841, 2.141159, 1, 1, 1, 1, 1,
0.3872207, 0.4559545, 2.176072, 1, 1, 1, 1, 1,
0.3919743, 1.046603, 0.6431341, 0, 0, 1, 1, 1,
0.3938627, 0.2785451, -0.2703033, 1, 0, 0, 1, 1,
0.3945108, -0.2740315, 3.040435, 1, 0, 0, 1, 1,
0.3964552, -2.107513, 3.917558, 1, 0, 0, 1, 1,
0.3991281, 0.08941457, 1.706514, 1, 0, 0, 1, 1,
0.4023952, -1.483892, 3.269818, 1, 0, 0, 1, 1,
0.4042012, 0.5093024, 1.194318, 0, 0, 0, 1, 1,
0.4071766, -0.996355, 2.444504, 0, 0, 0, 1, 1,
0.4082319, -1.884962, 2.915571, 0, 0, 0, 1, 1,
0.4146022, -1.2431, 2.842902, 0, 0, 0, 1, 1,
0.4155622, 0.1659557, 1.935226, 0, 0, 0, 1, 1,
0.4170873, -1.819777, 3.605783, 0, 0, 0, 1, 1,
0.4223401, -0.7951939, 1.679454, 0, 0, 0, 1, 1,
0.422971, -0.9410849, 2.72001, 1, 1, 1, 1, 1,
0.4231825, -1.037471, 3.387477, 1, 1, 1, 1, 1,
0.4249064, -0.3988375, 2.463341, 1, 1, 1, 1, 1,
0.425486, -0.3604621, 2.404343, 1, 1, 1, 1, 1,
0.4299661, -0.6822205, 1.783799, 1, 1, 1, 1, 1,
0.4334225, 0.8834264, -0.2314323, 1, 1, 1, 1, 1,
0.4412962, -0.5520632, 3.236954, 1, 1, 1, 1, 1,
0.4519224, -1.501662, 2.459828, 1, 1, 1, 1, 1,
0.4520594, -0.6299109, 2.330345, 1, 1, 1, 1, 1,
0.4588056, 1.527764, 0.7295011, 1, 1, 1, 1, 1,
0.4624192, -0.2336021, 1.247411, 1, 1, 1, 1, 1,
0.4681879, -0.4205678, 3.728689, 1, 1, 1, 1, 1,
0.4704726, -0.9237892, 1.813986, 1, 1, 1, 1, 1,
0.472961, 2.212981, 1.414688, 1, 1, 1, 1, 1,
0.4761832, 1.247872, 2.960708, 1, 1, 1, 1, 1,
0.4779803, -0.9153887, 1.80111, 0, 0, 1, 1, 1,
0.4806297, -0.4646997, 2.705611, 1, 0, 0, 1, 1,
0.4818099, 0.7824624, 0.7122054, 1, 0, 0, 1, 1,
0.4827033, -1.03454, 1.781735, 1, 0, 0, 1, 1,
0.4838991, 0.854457, 0.7493167, 1, 0, 0, 1, 1,
0.4841417, 1.311744, -0.4862224, 1, 0, 0, 1, 1,
0.4856299, 1.198751, 1.43773, 0, 0, 0, 1, 1,
0.4858786, -1.047307, 3.829423, 0, 0, 0, 1, 1,
0.4868172, 0.3313492, 1.152164, 0, 0, 0, 1, 1,
0.4927252, -1.369612, 2.887685, 0, 0, 0, 1, 1,
0.4937316, -1.91099, 2.259077, 0, 0, 0, 1, 1,
0.4960659, 1.801233, 2.182732, 0, 0, 0, 1, 1,
0.496796, 0.1701843, 0.03748526, 0, 0, 0, 1, 1,
0.4971194, 0.9105889, 0.9850122, 1, 1, 1, 1, 1,
0.4975108, -0.1350321, 1.649423, 1, 1, 1, 1, 1,
0.5018328, 0.3762557, 0.03579795, 1, 1, 1, 1, 1,
0.504557, -0.5376611, 2.495739, 1, 1, 1, 1, 1,
0.5079105, 0.08841723, 2.193635, 1, 1, 1, 1, 1,
0.5159283, -0.05742602, 1.014466, 1, 1, 1, 1, 1,
0.5179389, 0.4144004, 0.7062757, 1, 1, 1, 1, 1,
0.5195304, 0.1498635, 1.910555, 1, 1, 1, 1, 1,
0.5202329, -0.7201952, 2.987519, 1, 1, 1, 1, 1,
0.5216851, -0.5919102, 1.796105, 1, 1, 1, 1, 1,
0.5235646, 0.6862305, -0.4818063, 1, 1, 1, 1, 1,
0.523981, 0.3372371, -0.2266965, 1, 1, 1, 1, 1,
0.5291491, -2.41772, 3.458372, 1, 1, 1, 1, 1,
0.5346488, -0.1306216, 0.6935482, 1, 1, 1, 1, 1,
0.5405651, 2.631567, -0.8501672, 1, 1, 1, 1, 1,
0.5542286, -0.851401, 4.044022, 0, 0, 1, 1, 1,
0.5545247, -0.4674477, 0.9060383, 1, 0, 0, 1, 1,
0.5546347, -0.08376265, 1.565947, 1, 0, 0, 1, 1,
0.559981, -0.416509, 2.349451, 1, 0, 0, 1, 1,
0.5616964, 0.0963088, 0.5196115, 1, 0, 0, 1, 1,
0.56704, 0.7085617, 2.433605, 1, 0, 0, 1, 1,
0.5693418, 0.379994, 2.019562, 0, 0, 0, 1, 1,
0.5719098, -0.007603441, 1.255455, 0, 0, 0, 1, 1,
0.5752119, -0.3754445, 2.333877, 0, 0, 0, 1, 1,
0.5761011, -0.7340552, 2.812314, 0, 0, 0, 1, 1,
0.5764211, 1.09534, 0.8163425, 0, 0, 0, 1, 1,
0.5771737, 1.266411, 1.806434, 0, 0, 0, 1, 1,
0.5811364, -0.8469922, 4.506297, 0, 0, 0, 1, 1,
0.5827145, -0.2077885, 3.401232, 1, 1, 1, 1, 1,
0.5843182, 0.3363902, 0.6818791, 1, 1, 1, 1, 1,
0.5859149, -0.976822, 3.406355, 1, 1, 1, 1, 1,
0.5895572, 0.6343313, 1.754719, 1, 1, 1, 1, 1,
0.5895705, 0.718579, -0.6973886, 1, 1, 1, 1, 1,
0.5906819, -0.8671964, 1.983039, 1, 1, 1, 1, 1,
0.5931635, 0.4447154, 1.813905, 1, 1, 1, 1, 1,
0.5960432, -0.43013, 4.129192, 1, 1, 1, 1, 1,
0.6003392, -0.1962483, 1.794627, 1, 1, 1, 1, 1,
0.6003934, 2.086749, -0.1206143, 1, 1, 1, 1, 1,
0.6033866, 1.739713, -1.740494, 1, 1, 1, 1, 1,
0.6039521, 1.572561, 0.3479956, 1, 1, 1, 1, 1,
0.6053011, -0.1139663, 1.412205, 1, 1, 1, 1, 1,
0.6099654, -0.5459217, 2.671134, 1, 1, 1, 1, 1,
0.6110532, -1.007541, 1.505017, 1, 1, 1, 1, 1,
0.6116259, -0.6583166, 2.084547, 0, 0, 1, 1, 1,
0.6124114, -0.1039697, 1.225162, 1, 0, 0, 1, 1,
0.6124669, -0.7438734, 3.66181, 1, 0, 0, 1, 1,
0.6188147, 1.434515, -0.5033783, 1, 0, 0, 1, 1,
0.6265988, 0.150061, 2.085415, 1, 0, 0, 1, 1,
0.6286255, 1.524219, 0.6778256, 1, 0, 0, 1, 1,
0.6287454, 0.2689392, 0.8872762, 0, 0, 0, 1, 1,
0.6289681, -1.255513, 4.247948, 0, 0, 0, 1, 1,
0.6363614, 1.827406, -0.1578756, 0, 0, 0, 1, 1,
0.6433274, -1.280444, 1.671536, 0, 0, 0, 1, 1,
0.6444867, -1.050253, 1.695192, 0, 0, 0, 1, 1,
0.6476687, 1.428054, 2.549892, 0, 0, 0, 1, 1,
0.6606081, 0.263359, 2.347483, 0, 0, 0, 1, 1,
0.6647585, -0.4693487, 1.289425, 1, 1, 1, 1, 1,
0.6683816, -0.8275495, 4.111265, 1, 1, 1, 1, 1,
0.6699117, -0.3748499, 1.522057, 1, 1, 1, 1, 1,
0.6715544, -0.07380795, 1.670581, 1, 1, 1, 1, 1,
0.6738909, -0.6560761, 1.168733, 1, 1, 1, 1, 1,
0.6763065, 0.5599103, 2.219794, 1, 1, 1, 1, 1,
0.677865, -0.2961582, 1.065169, 1, 1, 1, 1, 1,
0.6823405, -0.8728438, 3.317135, 1, 1, 1, 1, 1,
0.6919159, 0.9276136, 0.6633493, 1, 1, 1, 1, 1,
0.6926169, 1.564768, 2.395728, 1, 1, 1, 1, 1,
0.6929168, 0.7643604, 0.4980057, 1, 1, 1, 1, 1,
0.6950177, -2.172693, 2.5933, 1, 1, 1, 1, 1,
0.6974203, 1.477136, 0.7313787, 1, 1, 1, 1, 1,
0.6997949, -0.8182144, 0.8378141, 1, 1, 1, 1, 1,
0.7039921, -1.593363, 2.606562, 1, 1, 1, 1, 1,
0.7072119, -0.05424207, 2.097667, 0, 0, 1, 1, 1,
0.7078032, 0.995883, 0.8027032, 1, 0, 0, 1, 1,
0.715446, 0.07801001, -0.3136842, 1, 0, 0, 1, 1,
0.7156209, -1.516172, 1.813049, 1, 0, 0, 1, 1,
0.7218018, -0.581278, 0.6203802, 1, 0, 0, 1, 1,
0.725206, -0.3387657, 0.764376, 1, 0, 0, 1, 1,
0.7281357, 0.8975566, 0.8943756, 0, 0, 0, 1, 1,
0.7287305, 0.4577638, 0.252606, 0, 0, 0, 1, 1,
0.7313085, -0.3520611, 0.923802, 0, 0, 0, 1, 1,
0.739277, 0.04163541, -0.2207698, 0, 0, 0, 1, 1,
0.7426298, -0.3242934, 0.7292399, 0, 0, 0, 1, 1,
0.7465738, -0.2896252, 3.052924, 0, 0, 0, 1, 1,
0.7478736, 0.04970061, 1.89924, 0, 0, 0, 1, 1,
0.7562212, 0.5103982, 2.081935, 1, 1, 1, 1, 1,
0.7596924, 0.7113087, 0.2992757, 1, 1, 1, 1, 1,
0.7643034, 0.1318812, 1.676329, 1, 1, 1, 1, 1,
0.7646046, 1.663474, 1.27472, 1, 1, 1, 1, 1,
0.772716, 1.352413, 1.079002, 1, 1, 1, 1, 1,
0.7794013, 0.3279374, 0.2350807, 1, 1, 1, 1, 1,
0.7884026, 0.4073056, -0.2427572, 1, 1, 1, 1, 1,
0.7890933, 0.3768292, 1.189763, 1, 1, 1, 1, 1,
0.7901117, -0.1259791, 0.6220543, 1, 1, 1, 1, 1,
0.8005525, 0.2999249, 1.296308, 1, 1, 1, 1, 1,
0.8167971, -0.5213073, 1.097495, 1, 1, 1, 1, 1,
0.8193464, -0.7221028, 3.134942, 1, 1, 1, 1, 1,
0.8203378, 0.6133446, -0.3784487, 1, 1, 1, 1, 1,
0.8269411, 0.4792162, 0.3199594, 1, 1, 1, 1, 1,
0.8298351, 0.3190965, 2.168351, 1, 1, 1, 1, 1,
0.8304418, 0.1732859, 1.304411, 0, 0, 1, 1, 1,
0.8429341, 2.41266, -0.7932938, 1, 0, 0, 1, 1,
0.8482003, -2.579475, 2.172632, 1, 0, 0, 1, 1,
0.8533637, -0.2315297, -0.6500082, 1, 0, 0, 1, 1,
0.8572974, -1.436791, 2.504379, 1, 0, 0, 1, 1,
0.8579229, -1.307619, 2.963037, 1, 0, 0, 1, 1,
0.858032, -1.920247, 3.008834, 0, 0, 0, 1, 1,
0.8603486, 1.026707, -0.966446, 0, 0, 0, 1, 1,
0.8654318, 1.03092, -1.026498, 0, 0, 0, 1, 1,
0.8677233, 0.5853085, 1.691922, 0, 0, 0, 1, 1,
0.8685418, 1.028953, -0.3078866, 0, 0, 0, 1, 1,
0.8707536, 1.548375, 2.193605, 0, 0, 0, 1, 1,
0.8764694, 1.727832, 2.385162, 0, 0, 0, 1, 1,
0.8781758, -1.083381, 4.617498, 1, 1, 1, 1, 1,
0.8821104, 0.9770596, 0.9208451, 1, 1, 1, 1, 1,
0.8853223, -0.1553786, -0.6432692, 1, 1, 1, 1, 1,
0.892753, 0.2765878, 3.079239, 1, 1, 1, 1, 1,
0.8967935, -1.207501, 2.302225, 1, 1, 1, 1, 1,
0.8995531, 2.109138, -0.4933574, 1, 1, 1, 1, 1,
0.9087195, -2.063552, 2.487534, 1, 1, 1, 1, 1,
0.9150817, 1.259107, 0.9317339, 1, 1, 1, 1, 1,
0.9168777, 0.1799963, 1.490073, 1, 1, 1, 1, 1,
0.919351, -2.390936, 3.145558, 1, 1, 1, 1, 1,
0.9279103, -0.8793936, 2.775367, 1, 1, 1, 1, 1,
0.9342361, 1.255836, 1.150388, 1, 1, 1, 1, 1,
0.9372382, -0.1313341, 0.7029635, 1, 1, 1, 1, 1,
0.9390273, 1.44553, 1.69361, 1, 1, 1, 1, 1,
0.9598594, -0.2403432, 1.316113, 1, 1, 1, 1, 1,
0.9670859, 0.1890196, 0.8539452, 0, 0, 1, 1, 1,
0.9754003, -0.2026595, 2.563194, 1, 0, 0, 1, 1,
0.9833594, -0.5212436, 1.888293, 1, 0, 0, 1, 1,
0.9881659, -0.8609203, 2.189368, 1, 0, 0, 1, 1,
0.9887856, -1.227005, 3.631928, 1, 0, 0, 1, 1,
0.9897283, -0.4313458, 3.735122, 1, 0, 0, 1, 1,
0.9951418, -1.803616, -0.5722162, 0, 0, 0, 1, 1,
0.99747, -0.2061155, -0.9263703, 0, 0, 0, 1, 1,
1.008371, 1.184115, 1.403324, 0, 0, 0, 1, 1,
1.014771, -0.6240466, 3.309489, 0, 0, 0, 1, 1,
1.0278, -1.064724, 2.116375, 0, 0, 0, 1, 1,
1.027859, 0.2163897, -0.2095956, 0, 0, 0, 1, 1,
1.030673, -1.389202, 2.337171, 0, 0, 0, 1, 1,
1.031988, -1.826597, 2.525148, 1, 1, 1, 1, 1,
1.037115, 0.2633118, 2.310912, 1, 1, 1, 1, 1,
1.041968, 0.6385078, 0.6553752, 1, 1, 1, 1, 1,
1.043068, 0.2963208, 2.365827, 1, 1, 1, 1, 1,
1.043863, 0.4254093, 2.00688, 1, 1, 1, 1, 1,
1.046837, -1.833728, 2.908608, 1, 1, 1, 1, 1,
1.047999, -1.180216, 1.322251, 1, 1, 1, 1, 1,
1.048899, -0.4221171, 1.212685, 1, 1, 1, 1, 1,
1.057079, 0.04253676, 1.414033, 1, 1, 1, 1, 1,
1.057607, 0.45908, 1.705208, 1, 1, 1, 1, 1,
1.061349, 1.273108, 2.279774, 1, 1, 1, 1, 1,
1.061851, 0.3933367, 0.9689217, 1, 1, 1, 1, 1,
1.065444, 0.8924862, 1.152382, 1, 1, 1, 1, 1,
1.067744, -1.011807, 2.312356, 1, 1, 1, 1, 1,
1.071756, 1.152597, 0.6846845, 1, 1, 1, 1, 1,
1.077808, -0.876182, 0.4390825, 0, 0, 1, 1, 1,
1.078199, 0.6806728, 2.505713, 1, 0, 0, 1, 1,
1.078994, 0.4832223, -0.9112722, 1, 0, 0, 1, 1,
1.079413, -0.1104005, 2.977743, 1, 0, 0, 1, 1,
1.081427, -0.0856465, 2.688939, 1, 0, 0, 1, 1,
1.081779, 0.5473953, 2.007923, 1, 0, 0, 1, 1,
1.085433, -0.9837655, 3.457044, 0, 0, 0, 1, 1,
1.109382, 0.7864766, 0.2937922, 0, 0, 0, 1, 1,
1.114045, 2.744733, 0.6486247, 0, 0, 0, 1, 1,
1.120079, -1.289987, 2.802322, 0, 0, 0, 1, 1,
1.132406, 0.9719381, 0.6641096, 0, 0, 0, 1, 1,
1.138585, -0.8340669, 1.838808, 0, 0, 0, 1, 1,
1.145517, 0.07952404, 0.6862308, 0, 0, 0, 1, 1,
1.1488, -1.01308, 2.327016, 1, 1, 1, 1, 1,
1.151789, -0.2728822, 0.6163689, 1, 1, 1, 1, 1,
1.152287, 0.07052293, 1.041627, 1, 1, 1, 1, 1,
1.154185, -0.3334856, 2.122768, 1, 1, 1, 1, 1,
1.156378, 0.4653696, 1.408747, 1, 1, 1, 1, 1,
1.162684, -1.008338, 0.7528039, 1, 1, 1, 1, 1,
1.169641, 1.009417, -0.08378697, 1, 1, 1, 1, 1,
1.17855, 0.2567582, 1.385072, 1, 1, 1, 1, 1,
1.188482, 0.8710099, 1.550522, 1, 1, 1, 1, 1,
1.194851, -0.7799747, 2.109614, 1, 1, 1, 1, 1,
1.2016, -0.6934, 2.851644, 1, 1, 1, 1, 1,
1.206946, 0.2376184, 0.9231131, 1, 1, 1, 1, 1,
1.208196, -1.326399, 2.261816, 1, 1, 1, 1, 1,
1.208405, 0.8437317, 1.469406, 1, 1, 1, 1, 1,
1.214702, 0.1145395, 2.426329, 1, 1, 1, 1, 1,
1.215465, -0.8396564, 1.760406, 0, 0, 1, 1, 1,
1.216787, -2.483249, 1.818957, 1, 0, 0, 1, 1,
1.224833, 1.476775, 0.3325267, 1, 0, 0, 1, 1,
1.232806, 0.8723037, 3.557524, 1, 0, 0, 1, 1,
1.235146, -0.6154447, 1.521262, 1, 0, 0, 1, 1,
1.239163, -1.339946, 3.511986, 1, 0, 0, 1, 1,
1.248931, -1.01091, 0.7946314, 0, 0, 0, 1, 1,
1.249684, 0.04212903, -0.03244232, 0, 0, 0, 1, 1,
1.253968, 0.2135268, 2.795658, 0, 0, 0, 1, 1,
1.261171, -0.3823883, 2.4045, 0, 0, 0, 1, 1,
1.262341, -0.5092433, 1.669333, 0, 0, 0, 1, 1,
1.265052, 1.197702, 0.2145551, 0, 0, 0, 1, 1,
1.266724, 1.390456, 0.0055732, 0, 0, 0, 1, 1,
1.267271, -1.495297, 4.52927, 1, 1, 1, 1, 1,
1.277729, 0.5562871, -0.4452854, 1, 1, 1, 1, 1,
1.310155, 0.2719776, 2.903253, 1, 1, 1, 1, 1,
1.310605, 0.5954477, 0.004804761, 1, 1, 1, 1, 1,
1.312287, -0.1964159, 1.104923, 1, 1, 1, 1, 1,
1.320107, 0.08858674, 3.121627, 1, 1, 1, 1, 1,
1.32282, 0.8986326, 0.3123008, 1, 1, 1, 1, 1,
1.334372, -0.5686441, 0.9517254, 1, 1, 1, 1, 1,
1.340825, -1.625249, 1.952867, 1, 1, 1, 1, 1,
1.35702, 0.004753403, 2.678331, 1, 1, 1, 1, 1,
1.359346, -0.5481537, 3.140954, 1, 1, 1, 1, 1,
1.368576, 0.8308048, 0.5173322, 1, 1, 1, 1, 1,
1.37429, 1.471509, -1.437956, 1, 1, 1, 1, 1,
1.380534, 1.822378, -1.764704, 1, 1, 1, 1, 1,
1.387176, 0.4622312, 2.075569, 1, 1, 1, 1, 1,
1.388596, -0.3326231, 2.506637, 0, 0, 1, 1, 1,
1.405585, 0.1496068, 0.4877545, 1, 0, 0, 1, 1,
1.405725, 0.2562527, 1.348593, 1, 0, 0, 1, 1,
1.420976, -1.556226, 2.401983, 1, 0, 0, 1, 1,
1.426997, -1.403913, 3.946295, 1, 0, 0, 1, 1,
1.428369, -1.181949, 2.162267, 1, 0, 0, 1, 1,
1.430496, 0.1252638, 1.004908, 0, 0, 0, 1, 1,
1.447903, -1.560249, 1.696307, 0, 0, 0, 1, 1,
1.453135, 1.560725, 0.135069, 0, 0, 0, 1, 1,
1.455185, -0.93312, 2.639781, 0, 0, 0, 1, 1,
1.460912, -1.507201, 1.1227, 0, 0, 0, 1, 1,
1.467933, -0.08038061, 2.877088, 0, 0, 0, 1, 1,
1.489983, -0.09579565, 3.906142, 0, 0, 0, 1, 1,
1.505122, 0.0852076, 0.6302269, 1, 1, 1, 1, 1,
1.521206, -0.501621, 0.3844261, 1, 1, 1, 1, 1,
1.528082, 0.8781389, 1.684918, 1, 1, 1, 1, 1,
1.542716, -0.7774547, 1.208508, 1, 1, 1, 1, 1,
1.558176, -0.4994971, 3.701833, 1, 1, 1, 1, 1,
1.558235, -0.6219129, 4.541136, 1, 1, 1, 1, 1,
1.562755, 0.08761228, 1.342732, 1, 1, 1, 1, 1,
1.567958, 0.1485022, 2.954089, 1, 1, 1, 1, 1,
1.582843, -1.312617, 2.110731, 1, 1, 1, 1, 1,
1.58806, 0.1257059, 0.06700597, 1, 1, 1, 1, 1,
1.599324, 0.05202634, 3.14352, 1, 1, 1, 1, 1,
1.605199, 0.329847, 1.2297, 1, 1, 1, 1, 1,
1.611332, 0.1773671, 2.708632, 1, 1, 1, 1, 1,
1.622858, -0.4291574, 2.180404, 1, 1, 1, 1, 1,
1.627587, 0.01047846, 3.200433, 1, 1, 1, 1, 1,
1.636342, -0.6753442, 2.210192, 0, 0, 1, 1, 1,
1.636806, 0.3559203, 1.526813, 1, 0, 0, 1, 1,
1.661455, 0.6428826, 2.014563, 1, 0, 0, 1, 1,
1.665833, -1.022874, 2.450116, 1, 0, 0, 1, 1,
1.669323, -1.408247, 3.260339, 1, 0, 0, 1, 1,
1.675193, -0.632816, 2.139759, 1, 0, 0, 1, 1,
1.675355, 1.039819, 1.482255, 0, 0, 0, 1, 1,
1.686481, 0.2291874, 0.9622964, 0, 0, 0, 1, 1,
1.6885, -0.3035067, 2.169429, 0, 0, 0, 1, 1,
1.692438, 1.428873, 1.488461, 0, 0, 0, 1, 1,
1.694371, 0.7042496, 1.46591, 0, 0, 0, 1, 1,
1.742463, 0.8126568, 0.6530493, 0, 0, 0, 1, 1,
1.743921, -0.6333637, 3.164217, 0, 0, 0, 1, 1,
1.749106, -0.7731565, 1.438524, 1, 1, 1, 1, 1,
1.779633, -0.1976312, 1.029719, 1, 1, 1, 1, 1,
1.780202, -1.34707, 1.483813, 1, 1, 1, 1, 1,
1.783739, 0.6256168, 1.395045, 1, 1, 1, 1, 1,
1.784928, 1.281621, 0.2261954, 1, 1, 1, 1, 1,
1.793015, -0.5251867, 2.102827, 1, 1, 1, 1, 1,
1.795156, -1.825073, 2.825844, 1, 1, 1, 1, 1,
1.823773, 1.915804, 2.171243, 1, 1, 1, 1, 1,
1.848274, -0.4823109, 2.403935, 1, 1, 1, 1, 1,
1.869635, 1.278326, 0.6424713, 1, 1, 1, 1, 1,
1.876181, 0.4053668, 2.501576, 1, 1, 1, 1, 1,
1.889718, -0.09034417, 1.285529, 1, 1, 1, 1, 1,
1.896072, -0.5253856, 1.507899, 1, 1, 1, 1, 1,
1.905441, -0.8243859, 2.44602, 1, 1, 1, 1, 1,
1.910638, -0.2473479, 1.918165, 1, 1, 1, 1, 1,
1.918088, 0.4313039, 0.7585536, 0, 0, 1, 1, 1,
1.93948, -0.8491916, 3.395355, 1, 0, 0, 1, 1,
1.994332, 1.772314, 1.422212, 1, 0, 0, 1, 1,
2.041548, 1.29176, -0.1309066, 1, 0, 0, 1, 1,
2.088782, -1.055061, 1.610752, 1, 0, 0, 1, 1,
2.101888, -0.473487, -0.2869821, 1, 0, 0, 1, 1,
2.212214, -1.044582, 3.117789, 0, 0, 0, 1, 1,
2.248124, -0.1425973, 3.471705, 0, 0, 0, 1, 1,
2.292933, -1.213726, 1.646666, 0, 0, 0, 1, 1,
2.295055, -0.05233122, 2.873334, 0, 0, 0, 1, 1,
2.300419, -0.3119919, 2.617399, 0, 0, 0, 1, 1,
2.322431, -0.4629747, 2.118945, 0, 0, 0, 1, 1,
2.342367, 0.5888284, 1.853893, 0, 0, 0, 1, 1,
2.420433, -0.2411696, 0.5617885, 1, 1, 1, 1, 1,
2.485775, 2.061755, 2.067714, 1, 1, 1, 1, 1,
2.533118, 1.039259, -0.6100071, 1, 1, 1, 1, 1,
2.558236, 2.237548, 2.406393, 1, 1, 1, 1, 1,
2.567237, 0.4142162, 3.313885, 1, 1, 1, 1, 1,
2.717908, -0.4147988, 1.097821, 1, 1, 1, 1, 1,
3.79841, -0.8328019, 1.594115, 1, 1, 1, 1, 1
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
var radius = 10.07467;
var distance = 35.38683;
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
mvMatrix.translate( -0.4567773, -0.3343729, 0.5428495 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.38683);
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
