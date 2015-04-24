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
-3.053801, 0.2259986, -3.244652, 1, 0, 0, 1,
-2.898396, 1.907425, -0.3257447, 1, 0.007843138, 0, 1,
-2.825807, 2.159331, -1.143677, 1, 0.01176471, 0, 1,
-2.766846, 0.9488463, -2.489761, 1, 0.01960784, 0, 1,
-2.670093, 0.728076, -1.295562, 1, 0.02352941, 0, 1,
-2.651613, -0.3116303, -1.244025, 1, 0.03137255, 0, 1,
-2.521982, 0.007993204, -1.194525, 1, 0.03529412, 0, 1,
-2.441093, 1.723562, 1.381271, 1, 0.04313726, 0, 1,
-2.370462, -0.8177699, -1.03613, 1, 0.04705882, 0, 1,
-2.356932, -1.335239, -2.085237, 1, 0.05490196, 0, 1,
-2.330453, 0.8899841, -1.206602, 1, 0.05882353, 0, 1,
-2.31855, 0.1608123, -0.5358244, 1, 0.06666667, 0, 1,
-2.296228, 1.435324, -0.7986444, 1, 0.07058824, 0, 1,
-2.29051, 2.184228, -1.524345, 1, 0.07843138, 0, 1,
-2.289231, -0.9183955, -1.248834, 1, 0.08235294, 0, 1,
-2.273918, -2.103772, -2.649851, 1, 0.09019608, 0, 1,
-2.209259, 0.7307924, -0.3145483, 1, 0.09411765, 0, 1,
-2.202258, -0.7118792, -2.257429, 1, 0.1019608, 0, 1,
-2.199241, -1.094416, -2.772464, 1, 0.1098039, 0, 1,
-2.185205, 0.5242653, -1.362651, 1, 0.1137255, 0, 1,
-2.161899, -2.028248, -2.703461, 1, 0.1215686, 0, 1,
-2.153766, -0.8406861, -3.178968, 1, 0.1254902, 0, 1,
-2.13623, 0.729349, -2.202988, 1, 0.1333333, 0, 1,
-2.124553, -0.9139295, -2.160228, 1, 0.1372549, 0, 1,
-2.113407, -0.9426904, -2.509396, 1, 0.145098, 0, 1,
-2.053969, -1.123732, -1.686764, 1, 0.1490196, 0, 1,
-2.046114, -0.6410286, -1.56972, 1, 0.1568628, 0, 1,
-2.03424, 0.4927209, -0.2762774, 1, 0.1607843, 0, 1,
-2.010961, -1.735377, -2.473768, 1, 0.1686275, 0, 1,
-2.008658, 0.7327314, -2.375372, 1, 0.172549, 0, 1,
-2.008387, 1.225928, -1.419619, 1, 0.1803922, 0, 1,
-1.983191, -1.008757, -3.443362, 1, 0.1843137, 0, 1,
-1.93316, 0.3318734, -2.065419, 1, 0.1921569, 0, 1,
-1.902981, -0.2139179, -2.542175, 1, 0.1960784, 0, 1,
-1.902652, -0.3976089, -2.701735, 1, 0.2039216, 0, 1,
-1.900303, -0.8979383, -0.9634845, 1, 0.2117647, 0, 1,
-1.888762, 0.6853248, -0.9324753, 1, 0.2156863, 0, 1,
-1.888188, -0.314322, -2.052393, 1, 0.2235294, 0, 1,
-1.864739, -1.17919, -1.583525, 1, 0.227451, 0, 1,
-1.843745, -1.152865, -2.150087, 1, 0.2352941, 0, 1,
-1.834933, -0.962258, -2.401566, 1, 0.2392157, 0, 1,
-1.833463, 0.2588352, -0.9405549, 1, 0.2470588, 0, 1,
-1.830596, -0.8835439, -1.314794, 1, 0.2509804, 0, 1,
-1.807705, 0.6704121, -0.5964267, 1, 0.2588235, 0, 1,
-1.788775, 0.5669363, 1.085001, 1, 0.2627451, 0, 1,
-1.766568, 0.06991794, -1.027073, 1, 0.2705882, 0, 1,
-1.733809, -0.006376212, -1.498699, 1, 0.2745098, 0, 1,
-1.72723, 0.186194, 0.2078098, 1, 0.282353, 0, 1,
-1.722594, 0.02490628, -0.7231241, 1, 0.2862745, 0, 1,
-1.713154, 0.6011202, -0.6780044, 1, 0.2941177, 0, 1,
-1.711389, -0.1069873, -2.250595, 1, 0.3019608, 0, 1,
-1.698205, -0.08373332, 0.1369931, 1, 0.3058824, 0, 1,
-1.692115, -0.3833358, -3.106018, 1, 0.3137255, 0, 1,
-1.664254, -0.8368595, -2.681172, 1, 0.3176471, 0, 1,
-1.65191, 1.488459, -1.075705, 1, 0.3254902, 0, 1,
-1.628946, -0.6889615, -2.840598, 1, 0.3294118, 0, 1,
-1.621762, -0.8640255, -2.524822, 1, 0.3372549, 0, 1,
-1.612076, 0.2553194, -2.859076, 1, 0.3411765, 0, 1,
-1.589314, 1.381474, -1.515455, 1, 0.3490196, 0, 1,
-1.586365, 1.858362, -2.849052, 1, 0.3529412, 0, 1,
-1.581369, -0.7050729, -2.221891, 1, 0.3607843, 0, 1,
-1.572262, 0.2275317, -1.57579, 1, 0.3647059, 0, 1,
-1.563385, 1.021933, -2.036214, 1, 0.372549, 0, 1,
-1.559568, -2.186381, -3.981867, 1, 0.3764706, 0, 1,
-1.559173, -0.3119397, -1.843674, 1, 0.3843137, 0, 1,
-1.546302, -1.27472, -3.299757, 1, 0.3882353, 0, 1,
-1.543718, -2.750732, -2.941563, 1, 0.3960784, 0, 1,
-1.538908, -0.2137676, -2.456006, 1, 0.4039216, 0, 1,
-1.534733, 0.4093061, -3.674298, 1, 0.4078431, 0, 1,
-1.520804, 0.00737673, -2.505895, 1, 0.4156863, 0, 1,
-1.520431, 0.8575017, -1.609579, 1, 0.4196078, 0, 1,
-1.5143, 1.128437, -1.416151, 1, 0.427451, 0, 1,
-1.512907, 1.480061, -0.8788692, 1, 0.4313726, 0, 1,
-1.504866, 0.3885609, -0.9579713, 1, 0.4392157, 0, 1,
-1.496132, 0.4657322, -1.32307, 1, 0.4431373, 0, 1,
-1.485885, 0.5343118, -1.848682, 1, 0.4509804, 0, 1,
-1.482326, -0.7672232, -1.953674, 1, 0.454902, 0, 1,
-1.474794, -1.808751, -2.190344, 1, 0.4627451, 0, 1,
-1.469231, 0.2654038, -0.608488, 1, 0.4666667, 0, 1,
-1.467351, -1.364146, -2.897705, 1, 0.4745098, 0, 1,
-1.466569, -1.083332, -2.179662, 1, 0.4784314, 0, 1,
-1.465459, 0.6536075, -2.043764, 1, 0.4862745, 0, 1,
-1.462236, 1.181536, -0.9812564, 1, 0.4901961, 0, 1,
-1.450496, -0.1021256, -2.444577, 1, 0.4980392, 0, 1,
-1.437181, -1.378402, -2.669417, 1, 0.5058824, 0, 1,
-1.431373, -0.5556363, -3.949817, 1, 0.509804, 0, 1,
-1.431243, -0.6205352, -2.612209, 1, 0.5176471, 0, 1,
-1.423504, -2.103751, -1.294216, 1, 0.5215687, 0, 1,
-1.422341, -1.685756, -2.471102, 1, 0.5294118, 0, 1,
-1.416543, 1.791286, -2.171914, 1, 0.5333334, 0, 1,
-1.411314, -0.6322408, -1.408656, 1, 0.5411765, 0, 1,
-1.410587, 1.480895, -0.5125693, 1, 0.5450981, 0, 1,
-1.399374, -1.325763, -2.161951, 1, 0.5529412, 0, 1,
-1.379314, 0.1964442, -2.155701, 1, 0.5568628, 0, 1,
-1.377055, -2.334248, -1.688949, 1, 0.5647059, 0, 1,
-1.365745, 0.4970723, -0.3371701, 1, 0.5686275, 0, 1,
-1.342008, -1.534293, -0.6117681, 1, 0.5764706, 0, 1,
-1.337883, -1.382895, -1.976339, 1, 0.5803922, 0, 1,
-1.331244, 0.5655733, -1.888096, 1, 0.5882353, 0, 1,
-1.287217, 1.023876, -0.542755, 1, 0.5921569, 0, 1,
-1.285958, 0.8518257, -0.3367525, 1, 0.6, 0, 1,
-1.284444, 0.8963999, 1.165432, 1, 0.6078432, 0, 1,
-1.281702, -0.5506873, -0.1059839, 1, 0.6117647, 0, 1,
-1.28002, 0.4665314, -1.291209, 1, 0.6196079, 0, 1,
-1.279469, -0.5748425, -3.749032, 1, 0.6235294, 0, 1,
-1.26724, 0.05011515, -1.913896, 1, 0.6313726, 0, 1,
-1.266398, 0.7629656, -1.771918, 1, 0.6352941, 0, 1,
-1.262156, 0.8623748, -1.280568, 1, 0.6431373, 0, 1,
-1.254598, -0.1341052, -2.737588, 1, 0.6470588, 0, 1,
-1.252316, 0.7613229, -1.954605, 1, 0.654902, 0, 1,
-1.24803, 1.020949, -1.070029, 1, 0.6588235, 0, 1,
-1.238671, -1.037265, -2.79496, 1, 0.6666667, 0, 1,
-1.236864, -0.3305941, -2.650818, 1, 0.6705883, 0, 1,
-1.236339, -1.083682, -0.7495577, 1, 0.6784314, 0, 1,
-1.227822, -0.9717728, -1.832547, 1, 0.682353, 0, 1,
-1.226295, 0.2006415, -2.399788, 1, 0.6901961, 0, 1,
-1.22605, -0.06961063, -1.333566, 1, 0.6941177, 0, 1,
-1.224325, -1.232712, -1.06923, 1, 0.7019608, 0, 1,
-1.215896, 0.2633012, 0.424867, 1, 0.7098039, 0, 1,
-1.213382, -0.5029299, -0.9596789, 1, 0.7137255, 0, 1,
-1.200758, -2.120303, -2.420791, 1, 0.7215686, 0, 1,
-1.198806, -0.7524177, -1.966875, 1, 0.7254902, 0, 1,
-1.195292, -0.2612146, -2.356704, 1, 0.7333333, 0, 1,
-1.194499, -1.019058, -2.986882, 1, 0.7372549, 0, 1,
-1.194283, -0.8518072, -3.813019, 1, 0.7450981, 0, 1,
-1.193837, -1.311218, -2.804029, 1, 0.7490196, 0, 1,
-1.193654, 0.03480708, -0.424958, 1, 0.7568628, 0, 1,
-1.173956, 1.809533, 0.6210614, 1, 0.7607843, 0, 1,
-1.172632, 1.341914, -1.430301, 1, 0.7686275, 0, 1,
-1.164192, 0.008698512, -1.860476, 1, 0.772549, 0, 1,
-1.162012, 0.5633878, -2.619092, 1, 0.7803922, 0, 1,
-1.153188, 1.184018, -0.2107966, 1, 0.7843137, 0, 1,
-1.15194, -1.357257, -3.575493, 1, 0.7921569, 0, 1,
-1.143767, -0.6899026, -2.008637, 1, 0.7960784, 0, 1,
-1.136121, 1.70063, -0.7109608, 1, 0.8039216, 0, 1,
-1.131767, 0.2721779, -0.8575454, 1, 0.8117647, 0, 1,
-1.122704, 0.1172503, -1.221832, 1, 0.8156863, 0, 1,
-1.117149, 0.4339022, 0.6141245, 1, 0.8235294, 0, 1,
-1.116047, -0.2423452, -3.22349, 1, 0.827451, 0, 1,
-1.115774, -0.5506693, -0.7724856, 1, 0.8352941, 0, 1,
-1.113262, 0.9163092, 0.740257, 1, 0.8392157, 0, 1,
-1.11242, -0.493432, -1.422145, 1, 0.8470588, 0, 1,
-1.110464, 0.08681242, -2.086501, 1, 0.8509804, 0, 1,
-1.106128, -1.34976, -2.978889, 1, 0.8588235, 0, 1,
-1.101993, -0.3963374, -1.040772, 1, 0.8627451, 0, 1,
-1.092902, 0.7559948, -1.304995, 1, 0.8705882, 0, 1,
-1.091843, -0.6083204, -2.608784, 1, 0.8745098, 0, 1,
-1.090414, 1.735882, 1.23631, 1, 0.8823529, 0, 1,
-1.089317, 0.1233565, -1.27594, 1, 0.8862745, 0, 1,
-1.084872, 0.8946146, -1.317289, 1, 0.8941177, 0, 1,
-1.079057, 0.2040489, -2.452152, 1, 0.8980392, 0, 1,
-1.078468, 1.118953, -1.624608, 1, 0.9058824, 0, 1,
-1.078395, 1.447938, 0.3939034, 1, 0.9137255, 0, 1,
-1.068159, 0.5898355, -1.91919, 1, 0.9176471, 0, 1,
-1.058797, 1.833667, -1.921135, 1, 0.9254902, 0, 1,
-1.051631, 0.9449448, -1.583732, 1, 0.9294118, 0, 1,
-1.051583, 1.625487, -0.4977248, 1, 0.9372549, 0, 1,
-1.044536, 0.3117324, -1.393881, 1, 0.9411765, 0, 1,
-1.04266, 1.221176, -1.282647, 1, 0.9490196, 0, 1,
-1.041449, -0.3791108, -2.225954, 1, 0.9529412, 0, 1,
-1.034593, -0.745643, -0.2576426, 1, 0.9607843, 0, 1,
-1.028623, 0.147612, 0.05205413, 1, 0.9647059, 0, 1,
-1.020449, 0.409492, -1.63555, 1, 0.972549, 0, 1,
-1.010477, -0.5618809, -0.09776685, 1, 0.9764706, 0, 1,
-1.00814, 0.1899618, -1.299053, 1, 0.9843137, 0, 1,
-1.003655, 0.9787515, -2.093689, 1, 0.9882353, 0, 1,
-1.000486, -1.153143, -2.728253, 1, 0.9960784, 0, 1,
-0.9947824, -0.3822095, -3.343357, 0.9960784, 1, 0, 1,
-0.9924173, -0.1552065, -1.906041, 0.9921569, 1, 0, 1,
-0.9851621, 1.209921, -4.110611, 0.9843137, 1, 0, 1,
-0.9851205, 0.08663972, -1.385016, 0.9803922, 1, 0, 1,
-0.9832799, 0.3044347, -1.803496, 0.972549, 1, 0, 1,
-0.9782368, 1.715506, 0.09321503, 0.9686275, 1, 0, 1,
-0.9749193, -0.05918433, -2.066416, 0.9607843, 1, 0, 1,
-0.968826, 0.3843224, -0.8943149, 0.9568627, 1, 0, 1,
-0.9676855, -0.9372652, -2.16606, 0.9490196, 1, 0, 1,
-0.9633685, -0.2798513, -0.8740715, 0.945098, 1, 0, 1,
-0.9574006, -1.6309, -2.892101, 0.9372549, 1, 0, 1,
-0.9529303, -0.9252186, -4.224155, 0.9333333, 1, 0, 1,
-0.9519179, 0.2322751, -0.92619, 0.9254902, 1, 0, 1,
-0.9516881, -0.1044099, -1.981886, 0.9215686, 1, 0, 1,
-0.9507839, 1.22288, 1.51918, 0.9137255, 1, 0, 1,
-0.9481074, 0.03707616, -0.5048717, 0.9098039, 1, 0, 1,
-0.9453878, 1.20771, -1.541877, 0.9019608, 1, 0, 1,
-0.9448927, -0.1078135, -2.314696, 0.8941177, 1, 0, 1,
-0.9442374, 0.2765502, -1.768126, 0.8901961, 1, 0, 1,
-0.9428856, -0.6912231, -3.245383, 0.8823529, 1, 0, 1,
-0.9378684, -0.07297111, 1.124135, 0.8784314, 1, 0, 1,
-0.9363076, -0.3797979, -2.328373, 0.8705882, 1, 0, 1,
-0.9354597, -0.1654352, -0.3135025, 0.8666667, 1, 0, 1,
-0.9278541, -1.132417, -1.723209, 0.8588235, 1, 0, 1,
-0.9237641, 0.1860836, -0.5028169, 0.854902, 1, 0, 1,
-0.9224243, -0.05768834, -1.578571, 0.8470588, 1, 0, 1,
-0.9194893, -0.7955692, -2.878726, 0.8431373, 1, 0, 1,
-0.9184988, -0.1582578, -0.9109669, 0.8352941, 1, 0, 1,
-0.918192, -0.3939184, -0.3822644, 0.8313726, 1, 0, 1,
-0.918023, 0.3444412, 0.825982, 0.8235294, 1, 0, 1,
-0.9083077, 0.4023257, -1.397783, 0.8196079, 1, 0, 1,
-0.9057529, 0.2233502, -2.146927, 0.8117647, 1, 0, 1,
-0.9013939, 1.679513, -1.474862, 0.8078431, 1, 0, 1,
-0.9011168, 0.2042632, -0.9157662, 0.8, 1, 0, 1,
-0.8927647, 0.4263605, -0.1649433, 0.7921569, 1, 0, 1,
-0.8878327, -0.202953, -2.74551, 0.7882353, 1, 0, 1,
-0.8783483, -0.8716042, -1.967704, 0.7803922, 1, 0, 1,
-0.8713682, 0.1990637, -2.54902, 0.7764706, 1, 0, 1,
-0.870661, -1.934004, -3.23993, 0.7686275, 1, 0, 1,
-0.8687696, -1.993245, -2.826385, 0.7647059, 1, 0, 1,
-0.8559115, -0.5257424, -2.236045, 0.7568628, 1, 0, 1,
-0.8534546, 1.828542, 0.8387901, 0.7529412, 1, 0, 1,
-0.8523333, -0.2968388, -2.292282, 0.7450981, 1, 0, 1,
-0.8512504, 0.109869, -1.195804, 0.7411765, 1, 0, 1,
-0.8413618, -1.467416, -2.184792, 0.7333333, 1, 0, 1,
-0.8396562, 0.04574633, -2.820268, 0.7294118, 1, 0, 1,
-0.8375201, 1.582924, -1.410916, 0.7215686, 1, 0, 1,
-0.8312746, -2.113696, -3.500436, 0.7176471, 1, 0, 1,
-0.8302847, 0.3675179, -0.1312855, 0.7098039, 1, 0, 1,
-0.8284019, -0.4272185, -2.271039, 0.7058824, 1, 0, 1,
-0.8226165, -0.9929401, -2.916936, 0.6980392, 1, 0, 1,
-0.8216701, -0.5466123, -2.082629, 0.6901961, 1, 0, 1,
-0.8176593, -0.009282837, -2.920914, 0.6862745, 1, 0, 1,
-0.8161136, 0.04623909, 1.194413, 0.6784314, 1, 0, 1,
-0.8139197, -0.9156207, -2.67445, 0.6745098, 1, 0, 1,
-0.8032904, 0.09791635, -0.01998708, 0.6666667, 1, 0, 1,
-0.8029541, 1.671625, -1.695603, 0.6627451, 1, 0, 1,
-0.8019246, -0.7441176, -1.625134, 0.654902, 1, 0, 1,
-0.7978634, -0.0901271, -1.450129, 0.6509804, 1, 0, 1,
-0.7972752, 0.05261306, -1.127978, 0.6431373, 1, 0, 1,
-0.7964078, 0.4411391, -1.221033, 0.6392157, 1, 0, 1,
-0.7849166, -0.1724078, -2.850844, 0.6313726, 1, 0, 1,
-0.7828621, -0.2095772, -1.815602, 0.627451, 1, 0, 1,
-0.7812397, 0.3974911, -0.8911676, 0.6196079, 1, 0, 1,
-0.7768537, -1.634852, -3.764229, 0.6156863, 1, 0, 1,
-0.7765945, 0.9711349, -0.1919972, 0.6078432, 1, 0, 1,
-0.7740224, 0.1557246, -1.260072, 0.6039216, 1, 0, 1,
-0.7724213, 0.2274076, 0.1006686, 0.5960785, 1, 0, 1,
-0.7722828, -0.3649966, -4.062085, 0.5882353, 1, 0, 1,
-0.7708634, 1.349394, -1.273357, 0.5843138, 1, 0, 1,
-0.7686909, -0.7235552, -2.287061, 0.5764706, 1, 0, 1,
-0.7577277, -0.2022182, -0.1424161, 0.572549, 1, 0, 1,
-0.7563246, -0.3686713, -1.689393, 0.5647059, 1, 0, 1,
-0.7554033, 0.6324193, -0.3907111, 0.5607843, 1, 0, 1,
-0.7511392, 0.5210348, -2.391504, 0.5529412, 1, 0, 1,
-0.7466849, -0.5596091, -2.723236, 0.5490196, 1, 0, 1,
-0.7343497, -1.878844, -3.115285, 0.5411765, 1, 0, 1,
-0.7340828, 0.4912168, -1.724134, 0.5372549, 1, 0, 1,
-0.7307604, 1.634553, -1.322193, 0.5294118, 1, 0, 1,
-0.7283121, 0.7299055, -1.120908, 0.5254902, 1, 0, 1,
-0.7224764, 1.186045, -1.477133, 0.5176471, 1, 0, 1,
-0.7219275, -0.5838563, -2.966941, 0.5137255, 1, 0, 1,
-0.7216473, -1.096629, -3.705962, 0.5058824, 1, 0, 1,
-0.7211413, -1.926573, -2.045223, 0.5019608, 1, 0, 1,
-0.7210553, 0.3586837, -3.352958, 0.4941176, 1, 0, 1,
-0.7204802, -1.149137, -3.197835, 0.4862745, 1, 0, 1,
-0.709419, -1.000825, -3.437824, 0.4823529, 1, 0, 1,
-0.7091699, 1.40079, -0.8515394, 0.4745098, 1, 0, 1,
-0.7088389, -1.109116, -2.840947, 0.4705882, 1, 0, 1,
-0.7032972, 0.1099853, -2.153395, 0.4627451, 1, 0, 1,
-0.6959558, 0.5987417, -1.625983, 0.4588235, 1, 0, 1,
-0.6956202, 0.110385, -0.8263482, 0.4509804, 1, 0, 1,
-0.6947904, -0.9800369, -2.861552, 0.4470588, 1, 0, 1,
-0.6846321, 1.91986, -0.851324, 0.4392157, 1, 0, 1,
-0.6837866, 0.1628735, -2.866808, 0.4352941, 1, 0, 1,
-0.6777567, -0.7060852, -1.910378, 0.427451, 1, 0, 1,
-0.6772745, 1.641989, -1.908668, 0.4235294, 1, 0, 1,
-0.6726153, 0.2282472, -2.242069, 0.4156863, 1, 0, 1,
-0.6700664, 0.3591883, -1.419946, 0.4117647, 1, 0, 1,
-0.6696434, -0.9446571, -0.5343722, 0.4039216, 1, 0, 1,
-0.6684133, -0.5764688, -1.662691, 0.3960784, 1, 0, 1,
-0.6572332, 1.594777, 0.1599349, 0.3921569, 1, 0, 1,
-0.6525989, 0.2625481, 0.3896817, 0.3843137, 1, 0, 1,
-0.6497555, -1.742367, -3.919645, 0.3803922, 1, 0, 1,
-0.6442881, 0.5320616, -1.626497, 0.372549, 1, 0, 1,
-0.642655, 0.09168658, -0.9186707, 0.3686275, 1, 0, 1,
-0.6409044, 0.5948883, -0.1544586, 0.3607843, 1, 0, 1,
-0.622974, 0.3203617, -0.451928, 0.3568628, 1, 0, 1,
-0.6161916, -0.4681516, -2.006514, 0.3490196, 1, 0, 1,
-0.6152273, 0.9299755, -1.989116, 0.345098, 1, 0, 1,
-0.6134579, -0.9424318, -1.075962, 0.3372549, 1, 0, 1,
-0.6124557, -0.1590111, -2.697217, 0.3333333, 1, 0, 1,
-0.6099598, -0.3161381, -1.212423, 0.3254902, 1, 0, 1,
-0.6007804, -0.3172371, -1.814034, 0.3215686, 1, 0, 1,
-0.59693, -1.56037, -4.489488, 0.3137255, 1, 0, 1,
-0.594699, -0.04255948, -3.458038, 0.3098039, 1, 0, 1,
-0.591458, 0.3769388, -0.6132499, 0.3019608, 1, 0, 1,
-0.5913328, 0.1333054, -3.266154, 0.2941177, 1, 0, 1,
-0.5861136, 0.3782113, -2.585629, 0.2901961, 1, 0, 1,
-0.5838188, -1.348616, -0.9416391, 0.282353, 1, 0, 1,
-0.5824245, -2.648119, -1.647225, 0.2784314, 1, 0, 1,
-0.5761484, -0.9285365, -4.261016, 0.2705882, 1, 0, 1,
-0.5695198, -1.257405, -2.609818, 0.2666667, 1, 0, 1,
-0.5650531, 2.185591, 1.515117, 0.2588235, 1, 0, 1,
-0.5644941, 1.351183, -1.208594, 0.254902, 1, 0, 1,
-0.5598961, 0.6097969, -3.016541, 0.2470588, 1, 0, 1,
-0.5534455, -1.139119, -3.001166, 0.2431373, 1, 0, 1,
-0.5534333, 0.5007144, -0.606747, 0.2352941, 1, 0, 1,
-0.5524135, 0.7232512, -1.192261, 0.2313726, 1, 0, 1,
-0.541767, -0.3730511, -1.890128, 0.2235294, 1, 0, 1,
-0.5364682, 1.374735, -0.9127589, 0.2196078, 1, 0, 1,
-0.5316843, 0.350128, -0.822583, 0.2117647, 1, 0, 1,
-0.5263108, 0.09260307, -2.68698, 0.2078431, 1, 0, 1,
-0.5183513, -0.6230963, -1.985893, 0.2, 1, 0, 1,
-0.5151499, 0.05682967, -0.6558499, 0.1921569, 1, 0, 1,
-0.5108741, 1.567303, 0.4359828, 0.1882353, 1, 0, 1,
-0.5105148, -0.5447836, -3.68803, 0.1803922, 1, 0, 1,
-0.5091282, 0.3520424, -1.503657, 0.1764706, 1, 0, 1,
-0.504415, -0.1482766, -1.771115, 0.1686275, 1, 0, 1,
-0.5000536, 1.210374, -0.7400166, 0.1647059, 1, 0, 1,
-0.4995122, -0.1149482, -1.001526, 0.1568628, 1, 0, 1,
-0.499227, 0.1082789, -0.2448977, 0.1529412, 1, 0, 1,
-0.495339, 1.043982, -1.638629, 0.145098, 1, 0, 1,
-0.4907758, 2.242088, -0.7603868, 0.1411765, 1, 0, 1,
-0.489883, 0.615369, -0.5564542, 0.1333333, 1, 0, 1,
-0.4876923, 1.583617, 0.4279829, 0.1294118, 1, 0, 1,
-0.4865817, -0.1294102, -2.024576, 0.1215686, 1, 0, 1,
-0.4857964, -0.5147508, -0.7269079, 0.1176471, 1, 0, 1,
-0.4838172, 0.789618, -0.08245257, 0.1098039, 1, 0, 1,
-0.4832679, 0.524331, 0.16689, 0.1058824, 1, 0, 1,
-0.4831566, -0.8261626, -1.410974, 0.09803922, 1, 0, 1,
-0.4799722, 0.0491641, -2.538026, 0.09019608, 1, 0, 1,
-0.4782917, -0.3010603, -1.529801, 0.08627451, 1, 0, 1,
-0.4777492, 0.6509142, -2.638046, 0.07843138, 1, 0, 1,
-0.4768113, -0.2058797, -2.679526, 0.07450981, 1, 0, 1,
-0.473526, -0.9734597, -2.631945, 0.06666667, 1, 0, 1,
-0.4720981, -0.5430371, -1.32451, 0.0627451, 1, 0, 1,
-0.46698, -0.3273771, -1.152305, 0.05490196, 1, 0, 1,
-0.460261, -0.8592473, -1.316533, 0.05098039, 1, 0, 1,
-0.4509332, 0.4866453, -0.6393306, 0.04313726, 1, 0, 1,
-0.4498105, -1.664298, -2.619122, 0.03921569, 1, 0, 1,
-0.4472471, -2.051103, -2.655043, 0.03137255, 1, 0, 1,
-0.4410821, -0.1094349, -2.958645, 0.02745098, 1, 0, 1,
-0.4399419, 0.8987076, -0.9464009, 0.01960784, 1, 0, 1,
-0.4309129, -0.2021313, -0.08416724, 0.01568628, 1, 0, 1,
-0.4242307, 0.2168753, -2.013979, 0.007843138, 1, 0, 1,
-0.4238795, 0.6482811, 1.21925, 0.003921569, 1, 0, 1,
-0.4226492, 0.4689983, -0.1746912, 0, 1, 0.003921569, 1,
-0.4188327, 1.300551, 0.4251366, 0, 1, 0.01176471, 1,
-0.4170833, -2.192716, -3.27594, 0, 1, 0.01568628, 1,
-0.4159078, -1.275921, -3.528717, 0, 1, 0.02352941, 1,
-0.4143969, 0.8154472, -1.696677, 0, 1, 0.02745098, 1,
-0.4105923, 1.248724, 0.6121852, 0, 1, 0.03529412, 1,
-0.4098772, 0.02336197, -1.022681, 0, 1, 0.03921569, 1,
-0.4069912, 0.60089, 0.5049188, 0, 1, 0.04705882, 1,
-0.4051397, -0.3256712, -2.470736, 0, 1, 0.05098039, 1,
-0.405097, -0.06829695, -1.237158, 0, 1, 0.05882353, 1,
-0.4027139, 1.550431, 0.3922923, 0, 1, 0.0627451, 1,
-0.3958379, 0.3390426, -2.597754, 0, 1, 0.07058824, 1,
-0.3891405, 0.3844762, -0.5845084, 0, 1, 0.07450981, 1,
-0.3876877, -0.7927803, -2.2727, 0, 1, 0.08235294, 1,
-0.3732866, 0.267199, 1.286732, 0, 1, 0.08627451, 1,
-0.372442, 0.07154547, 0.9327247, 0, 1, 0.09411765, 1,
-0.3645717, -0.5114669, -4.043938, 0, 1, 0.1019608, 1,
-0.3620706, -1.826381, -4.221799, 0, 1, 0.1058824, 1,
-0.3605937, -0.3656526, -1.364325, 0, 1, 0.1137255, 1,
-0.3598783, -1.594636, -1.555452, 0, 1, 0.1176471, 1,
-0.3587889, 0.6998125, -2.891712, 0, 1, 0.1254902, 1,
-0.3514877, -0.3669696, -3.178343, 0, 1, 0.1294118, 1,
-0.3498643, 0.6385313, -2.300223, 0, 1, 0.1372549, 1,
-0.3445358, 0.5227849, -1.602371, 0, 1, 0.1411765, 1,
-0.3412668, 0.6326411, -0.583295, 0, 1, 0.1490196, 1,
-0.3376307, 1.072765, 0.7697123, 0, 1, 0.1529412, 1,
-0.3366247, 0.2200967, -0.5018173, 0, 1, 0.1607843, 1,
-0.3359937, -0.4384468, -1.083253, 0, 1, 0.1647059, 1,
-0.3296095, -0.590821, -2.376109, 0, 1, 0.172549, 1,
-0.3292384, -0.8030679, -4.296191, 0, 1, 0.1764706, 1,
-0.3244188, 0.7619094, 0.1352361, 0, 1, 0.1843137, 1,
-0.3232909, 0.4351581, -0.7687017, 0, 1, 0.1882353, 1,
-0.323228, -1.122192, -2.249966, 0, 1, 0.1960784, 1,
-0.3209409, 1.28135, -1.550445, 0, 1, 0.2039216, 1,
-0.3202333, -1.702568, -2.290282, 0, 1, 0.2078431, 1,
-0.3201468, 0.6988652, 0.4331425, 0, 1, 0.2156863, 1,
-0.3190922, -0.438906, -2.928333, 0, 1, 0.2196078, 1,
-0.3190493, 0.3661849, -1.101908, 0, 1, 0.227451, 1,
-0.3143992, -0.3534119, -3.917567, 0, 1, 0.2313726, 1,
-0.3069722, -0.215004, -2.29422, 0, 1, 0.2392157, 1,
-0.3038145, -0.03987278, -0.3866038, 0, 1, 0.2431373, 1,
-0.2972715, -1.276963, -3.123698, 0, 1, 0.2509804, 1,
-0.2972403, 0.1403774, -1.897708, 0, 1, 0.254902, 1,
-0.2932101, -0.7501327, -3.447872, 0, 1, 0.2627451, 1,
-0.2925273, -0.1145162, -3.164489, 0, 1, 0.2666667, 1,
-0.2909654, -1.113258, -2.035355, 0, 1, 0.2745098, 1,
-0.2898723, -1.35276, -2.352034, 0, 1, 0.2784314, 1,
-0.2879013, -0.8089451, -3.811862, 0, 1, 0.2862745, 1,
-0.2828213, 1.039578, 0.3096122, 0, 1, 0.2901961, 1,
-0.2817626, -0.6682932, -2.858732, 0, 1, 0.2980392, 1,
-0.2789967, 0.5024143, -0.07836955, 0, 1, 0.3058824, 1,
-0.2788697, 0.170278, 0.4990223, 0, 1, 0.3098039, 1,
-0.2654756, -0.2760451, -3.271011, 0, 1, 0.3176471, 1,
-0.2616702, 0.755541, -1.650394, 0, 1, 0.3215686, 1,
-0.260145, 0.6815703, 0.001781236, 0, 1, 0.3294118, 1,
-0.2597312, 0.1976101, -1.028892, 0, 1, 0.3333333, 1,
-0.2539711, -1.39177, -3.345989, 0, 1, 0.3411765, 1,
-0.251787, 0.321337, -0.3072019, 0, 1, 0.345098, 1,
-0.2457323, -1.469088, -3.46298, 0, 1, 0.3529412, 1,
-0.2434722, -0.4939721, -2.38565, 0, 1, 0.3568628, 1,
-0.2424887, 0.120745, -0.7068342, 0, 1, 0.3647059, 1,
-0.2389417, -0.7705396, -2.481553, 0, 1, 0.3686275, 1,
-0.2357344, -1.959117, -4.369822, 0, 1, 0.3764706, 1,
-0.2343096, -1.16318, -2.520249, 0, 1, 0.3803922, 1,
-0.2339681, 2.393227, 0.1616524, 0, 1, 0.3882353, 1,
-0.2316234, -0.08605731, -2.996377, 0, 1, 0.3921569, 1,
-0.2314332, 1.888227, -1.107436, 0, 1, 0.4, 1,
-0.2311177, 1.04828, 0.3757209, 0, 1, 0.4078431, 1,
-0.2258916, 1.410088, 0.3826345, 0, 1, 0.4117647, 1,
-0.2231797, -0.7393218, -2.581451, 0, 1, 0.4196078, 1,
-0.2208347, 0.9278563, -1.473781, 0, 1, 0.4235294, 1,
-0.214053, -0.001300149, -1.117618, 0, 1, 0.4313726, 1,
-0.2044513, 0.5396597, -0.9272982, 0, 1, 0.4352941, 1,
-0.2042209, -0.2068292, -1.170205, 0, 1, 0.4431373, 1,
-0.2029683, -0.1248499, -2.721316, 0, 1, 0.4470588, 1,
-0.19571, -0.4634132, -0.8719944, 0, 1, 0.454902, 1,
-0.1953238, 0.5496098, -1.128402, 0, 1, 0.4588235, 1,
-0.1932674, 0.2871022, -1.0603, 0, 1, 0.4666667, 1,
-0.1930809, 1.644844, -1.923404, 0, 1, 0.4705882, 1,
-0.1930725, 0.9759313, 0.9656238, 0, 1, 0.4784314, 1,
-0.191109, -0.4797053, -2.26369, 0, 1, 0.4823529, 1,
-0.1893495, -0.3999466, -2.407362, 0, 1, 0.4901961, 1,
-0.185635, -0.0007648649, 0.760024, 0, 1, 0.4941176, 1,
-0.1828863, 0.6294342, -1.172008, 0, 1, 0.5019608, 1,
-0.1775849, 2.626256, -0.2500334, 0, 1, 0.509804, 1,
-0.1763874, 0.1513031, 2.061765, 0, 1, 0.5137255, 1,
-0.1719992, 1.297476, -0.2774912, 0, 1, 0.5215687, 1,
-0.1706207, -0.02945798, -1.754727, 0, 1, 0.5254902, 1,
-0.1656162, 0.2217089, 0.1505488, 0, 1, 0.5333334, 1,
-0.1653663, 1.522557, -0.2284308, 0, 1, 0.5372549, 1,
-0.1639638, -0.2985592, -2.024364, 0, 1, 0.5450981, 1,
-0.1631883, -1.370579, -3.260879, 0, 1, 0.5490196, 1,
-0.1561055, 0.7466293, -0.776962, 0, 1, 0.5568628, 1,
-0.1557848, 0.1350671, -1.138495, 0, 1, 0.5607843, 1,
-0.1554049, -1.624273, -4.765592, 0, 1, 0.5686275, 1,
-0.1547268, 2.357485, 1.147053, 0, 1, 0.572549, 1,
-0.1504605, 0.9301831, 1.077657, 0, 1, 0.5803922, 1,
-0.1461446, 1.829537, -0.05513214, 0, 1, 0.5843138, 1,
-0.1444012, -0.04655203, -2.150016, 0, 1, 0.5921569, 1,
-0.1443327, 0.5809938, 0.6821563, 0, 1, 0.5960785, 1,
-0.1432068, -0.1582125, -1.435476, 0, 1, 0.6039216, 1,
-0.141382, -1.070249, -2.622645, 0, 1, 0.6117647, 1,
-0.141293, 1.404654, -0.2096562, 0, 1, 0.6156863, 1,
-0.1398794, -0.8855265, -3.685582, 0, 1, 0.6235294, 1,
-0.1379715, -0.4752351, -2.244238, 0, 1, 0.627451, 1,
-0.1342933, -0.01025914, 0.0227654, 0, 1, 0.6352941, 1,
-0.1327017, 0.1051237, -2.44382, 0, 1, 0.6392157, 1,
-0.1320858, -0.3078479, -2.113147, 0, 1, 0.6470588, 1,
-0.130981, -0.3140068, -2.492169, 0, 1, 0.6509804, 1,
-0.1287836, 1.128287, 0.02627627, 0, 1, 0.6588235, 1,
-0.1206075, 0.416508, 0.771512, 0, 1, 0.6627451, 1,
-0.1160674, -0.2345231, -4.122249, 0, 1, 0.6705883, 1,
-0.1140059, 0.977846, 0.4929606, 0, 1, 0.6745098, 1,
-0.1113643, 0.2117042, -0.4812617, 0, 1, 0.682353, 1,
-0.1111152, 1.084809, 0.7781538, 0, 1, 0.6862745, 1,
-0.1105607, 1.357837, 0.1626082, 0, 1, 0.6941177, 1,
-0.1054848, -1.474445, -1.89279, 0, 1, 0.7019608, 1,
-0.1052915, -1.108372, -3.812496, 0, 1, 0.7058824, 1,
-0.1013993, -0.1943757, -3.720826, 0, 1, 0.7137255, 1,
-0.09904909, -0.8820332, -3.336369, 0, 1, 0.7176471, 1,
-0.09749731, 1.223366, -0.07169364, 0, 1, 0.7254902, 1,
-0.09382418, 2.12903, 0.05078984, 0, 1, 0.7294118, 1,
-0.09379687, 0.7436364, -0.02915727, 0, 1, 0.7372549, 1,
-0.09351958, -1.880844, -4.055663, 0, 1, 0.7411765, 1,
-0.08793788, -0.2226822, -1.426334, 0, 1, 0.7490196, 1,
-0.08308336, 1.899885, -1.310729, 0, 1, 0.7529412, 1,
-0.08196525, -0.1234549, -2.451368, 0, 1, 0.7607843, 1,
-0.0783951, -0.5639439, -2.932145, 0, 1, 0.7647059, 1,
-0.07397499, -1.817138, -3.713548, 0, 1, 0.772549, 1,
-0.07276635, 0.01886443, -1.402479, 0, 1, 0.7764706, 1,
-0.07133091, -1.236143, -2.80909, 0, 1, 0.7843137, 1,
-0.06794073, -0.03615337, -1.696196, 0, 1, 0.7882353, 1,
-0.06761534, 0.5310695, 0.6082081, 0, 1, 0.7960784, 1,
-0.05968256, 0.3974429, 0.1731742, 0, 1, 0.8039216, 1,
-0.055229, 0.1004676, -1.446303, 0, 1, 0.8078431, 1,
-0.05455356, 1.921828, 0.2111026, 0, 1, 0.8156863, 1,
-0.05344791, -0.7128752, -1.929383, 0, 1, 0.8196079, 1,
-0.04939073, -0.7725253, -2.04573, 0, 1, 0.827451, 1,
-0.04761437, 2.647541, 0.08723996, 0, 1, 0.8313726, 1,
-0.04496901, -0.8822831, -2.400245, 0, 1, 0.8392157, 1,
-0.04157019, -0.1511949, -2.199993, 0, 1, 0.8431373, 1,
-0.04131897, -0.0310829, -1.553048, 0, 1, 0.8509804, 1,
-0.0395748, 3.270324, 0.4381554, 0, 1, 0.854902, 1,
-0.03672115, 1.255432, -0.4777724, 0, 1, 0.8627451, 1,
-0.03617106, -0.1942288, -1.961041, 0, 1, 0.8666667, 1,
-0.03172553, -0.9914, -3.85557, 0, 1, 0.8745098, 1,
-0.02933501, -1.523586, -2.35199, 0, 1, 0.8784314, 1,
-0.02799661, -0.007268426, -2.322711, 0, 1, 0.8862745, 1,
-0.02688516, 0.2539526, 1.218444, 0, 1, 0.8901961, 1,
-0.02421418, -0.4868617, -3.286767, 0, 1, 0.8980392, 1,
-0.02307588, -0.1338687, -3.027794, 0, 1, 0.9058824, 1,
-0.02145559, -0.9260294, -3.291935, 0, 1, 0.9098039, 1,
-0.01877851, -0.3612964, -4.016078, 0, 1, 0.9176471, 1,
-0.01756794, 0.4766814, -0.749974, 0, 1, 0.9215686, 1,
-0.01746052, 0.1604074, -0.08135661, 0, 1, 0.9294118, 1,
-0.01512958, -0.04488783, -2.849209, 0, 1, 0.9333333, 1,
-0.01504758, 0.09744881, -0.4419141, 0, 1, 0.9411765, 1,
-0.01048325, 0.4230658, 0.2050704, 0, 1, 0.945098, 1,
-0.009412585, -0.8763545, -5.436012, 0, 1, 0.9529412, 1,
-0.006288329, 0.5884498, -0.7919492, 0, 1, 0.9568627, 1,
-0.004715049, -1.762454, -4.072737, 0, 1, 0.9647059, 1,
0.000872927, 0.4304171, 1.417369, 0, 1, 0.9686275, 1,
0.007885029, -1.238837, 2.741108, 0, 1, 0.9764706, 1,
0.01241123, -2.068967, 3.503134, 0, 1, 0.9803922, 1,
0.01480599, -0.8224916, 3.611762, 0, 1, 0.9882353, 1,
0.01500989, -1.658081, 1.092462, 0, 1, 0.9921569, 1,
0.01695017, 0.6828476, 0.8494939, 0, 1, 1, 1,
0.01770831, 0.1938337, 0.4470667, 0, 0.9921569, 1, 1,
0.02395255, -0.6242388, 3.943288, 0, 0.9882353, 1, 1,
0.0250789, 0.1061767, 0.7995649, 0, 0.9803922, 1, 1,
0.02684709, -2.191278, 3.005981, 0, 0.9764706, 1, 1,
0.02923909, 2.361345, -0.3241853, 0, 0.9686275, 1, 1,
0.03100997, -1.014823, 3.732937, 0, 0.9647059, 1, 1,
0.03327007, 0.6902677, -0.2882846, 0, 0.9568627, 1, 1,
0.03340205, -0.09570604, 5.088762, 0, 0.9529412, 1, 1,
0.03341913, -0.6237823, 3.657636, 0, 0.945098, 1, 1,
0.03361977, -1.050695, 2.96659, 0, 0.9411765, 1, 1,
0.0363954, -0.4069586, 3.993415, 0, 0.9333333, 1, 1,
0.04236495, 1.875542, 0.2357723, 0, 0.9294118, 1, 1,
0.0433724, -1.668851, 2.322998, 0, 0.9215686, 1, 1,
0.04343018, 0.326645, -0.0007381382, 0, 0.9176471, 1, 1,
0.04381743, -0.5499829, 2.555193, 0, 0.9098039, 1, 1,
0.04547179, -1.517969, 1.289513, 0, 0.9058824, 1, 1,
0.04821275, -1.055377, 4.45465, 0, 0.8980392, 1, 1,
0.04859633, -1.009125, 3.198555, 0, 0.8901961, 1, 1,
0.05199668, 0.1047291, 0.1009322, 0, 0.8862745, 1, 1,
0.0521627, -0.02478904, 2.086393, 0, 0.8784314, 1, 1,
0.0586013, -0.7256865, 1.500874, 0, 0.8745098, 1, 1,
0.05997654, 0.5898573, 0.1182412, 0, 0.8666667, 1, 1,
0.06028543, -0.8486783, 3.388749, 0, 0.8627451, 1, 1,
0.06245155, -2.042008, 1.552453, 0, 0.854902, 1, 1,
0.06700501, -1.500911, 2.818196, 0, 0.8509804, 1, 1,
0.06844512, 0.1378786, 1.013467, 0, 0.8431373, 1, 1,
0.07028795, 0.9071532, 0.06407318, 0, 0.8392157, 1, 1,
0.07058242, -0.454457, 3.6453, 0, 0.8313726, 1, 1,
0.07154716, 1.307869, 0.08164991, 0, 0.827451, 1, 1,
0.07280184, 2.025498, -0.9266153, 0, 0.8196079, 1, 1,
0.07403522, 0.1699177, -0.6146707, 0, 0.8156863, 1, 1,
0.0754145, -0.7791944, 2.065813, 0, 0.8078431, 1, 1,
0.08091345, -0.1451094, 3.307933, 0, 0.8039216, 1, 1,
0.09549136, -0.08328979, 3.253102, 0, 0.7960784, 1, 1,
0.1040463, 0.3240102, 1.877518, 0, 0.7882353, 1, 1,
0.1040467, -0.00232163, 1.759563, 0, 0.7843137, 1, 1,
0.1043289, -1.377394, 3.415341, 0, 0.7764706, 1, 1,
0.1092607, -1.550943, 4.615068, 0, 0.772549, 1, 1,
0.1094647, 0.8808104, 0.6018528, 0, 0.7647059, 1, 1,
0.1097836, 0.3677905, -0.8861888, 0, 0.7607843, 1, 1,
0.1102237, -1.236074, 2.503659, 0, 0.7529412, 1, 1,
0.1109295, -0.9921255, 2.940023, 0, 0.7490196, 1, 1,
0.1113011, 0.5148933, -0.2527078, 0, 0.7411765, 1, 1,
0.1117842, 0.3504698, -0.1247087, 0, 0.7372549, 1, 1,
0.1154039, -0.6736075, 3.167333, 0, 0.7294118, 1, 1,
0.1191465, 0.3056963, 0.06819149, 0, 0.7254902, 1, 1,
0.1201824, -1.464697, 3.999361, 0, 0.7176471, 1, 1,
0.124821, -0.03379801, 0.3801009, 0, 0.7137255, 1, 1,
0.1271468, -0.7849533, 3.592209, 0, 0.7058824, 1, 1,
0.1286161, -0.02573125, 1.518131, 0, 0.6980392, 1, 1,
0.1305212, -0.9311197, 2.471205, 0, 0.6941177, 1, 1,
0.1317124, -0.07028527, 3.451795, 0, 0.6862745, 1, 1,
0.1317291, 1.966987, -0.248296, 0, 0.682353, 1, 1,
0.1321334, 0.6831633, 0.5084789, 0, 0.6745098, 1, 1,
0.1335069, 0.04653723, 1.354221, 0, 0.6705883, 1, 1,
0.1336226, 0.4276972, -0.4710467, 0, 0.6627451, 1, 1,
0.1353519, 1.314038, 1.533478, 0, 0.6588235, 1, 1,
0.1369858, -0.5258257, 3.335246, 0, 0.6509804, 1, 1,
0.1374082, 1.353421, -2.074907, 0, 0.6470588, 1, 1,
0.1421437, -0.0369375, 3.294993, 0, 0.6392157, 1, 1,
0.1441889, -0.1132855, 2.927557, 0, 0.6352941, 1, 1,
0.146557, 0.5515289, 0.7393516, 0, 0.627451, 1, 1,
0.1465786, 0.1734182, 1.287019, 0, 0.6235294, 1, 1,
0.1483105, 0.2552752, -0.1279366, 0, 0.6156863, 1, 1,
0.1527404, 1.514694, 0.9274902, 0, 0.6117647, 1, 1,
0.1684094, 1.808662, 1.612563, 0, 0.6039216, 1, 1,
0.1688737, 0.6248831, -0.3314666, 0, 0.5960785, 1, 1,
0.1705971, 0.6009449, -1.515187, 0, 0.5921569, 1, 1,
0.1742295, -1.086572, 2.407208, 0, 0.5843138, 1, 1,
0.182073, -0.642061, 2.351036, 0, 0.5803922, 1, 1,
0.1822643, -0.571417, 2.374605, 0, 0.572549, 1, 1,
0.1822951, 0.4293911, 2.28593, 0, 0.5686275, 1, 1,
0.1836135, 1.277741, -1.832987, 0, 0.5607843, 1, 1,
0.1870961, -0.4889568, 2.845823, 0, 0.5568628, 1, 1,
0.1899406, -0.04552338, 2.717375, 0, 0.5490196, 1, 1,
0.1907438, 0.1092512, 1.591441, 0, 0.5450981, 1, 1,
0.190964, 1.694526, -1.641093, 0, 0.5372549, 1, 1,
0.194352, 1.986042, 1.068154, 0, 0.5333334, 1, 1,
0.1945274, -1.202346, 4.53064, 0, 0.5254902, 1, 1,
0.1994576, 0.7244278, -1.394892, 0, 0.5215687, 1, 1,
0.2062181, 0.7849891, -0.7391273, 0, 0.5137255, 1, 1,
0.2069796, 1.582665, -0.1959118, 0, 0.509804, 1, 1,
0.2076775, 1.177997, -1.783648, 0, 0.5019608, 1, 1,
0.2142849, -1.649364, 1.060681, 0, 0.4941176, 1, 1,
0.2144601, 0.6158625, 0.543035, 0, 0.4901961, 1, 1,
0.2147726, 1.853358, 1.280285, 0, 0.4823529, 1, 1,
0.2163269, -0.02604275, 3.583525, 0, 0.4784314, 1, 1,
0.2184234, -0.2043103, 2.368597, 0, 0.4705882, 1, 1,
0.2184521, -2.775538, 2.607602, 0, 0.4666667, 1, 1,
0.2195473, 0.3435578, 0.3938522, 0, 0.4588235, 1, 1,
0.2239768, 1.563519, -1.939842, 0, 0.454902, 1, 1,
0.2327855, -0.7418811, 4.146106, 0, 0.4470588, 1, 1,
0.2350979, 0.1589014, -0.1911757, 0, 0.4431373, 1, 1,
0.2355727, -0.2824869, 1.242068, 0, 0.4352941, 1, 1,
0.236101, 0.92508, -0.7250176, 0, 0.4313726, 1, 1,
0.2395561, -0.2475249, 2.952399, 0, 0.4235294, 1, 1,
0.2414027, -1.219265, 1.283742, 0, 0.4196078, 1, 1,
0.2414804, -0.5802863, 2.325591, 0, 0.4117647, 1, 1,
0.2427843, -0.25221, 2.1668, 0, 0.4078431, 1, 1,
0.246693, 0.705052, -0.7574971, 0, 0.4, 1, 1,
0.2476433, 2.408305, -0.7055351, 0, 0.3921569, 1, 1,
0.2476609, -1.215567, 3.102665, 0, 0.3882353, 1, 1,
0.2552897, -1.487452, 3.829527, 0, 0.3803922, 1, 1,
0.2562464, 0.8457178, 0.66123, 0, 0.3764706, 1, 1,
0.2576164, -0.2643352, 2.447848, 0, 0.3686275, 1, 1,
0.264542, -0.3331275, 2.399546, 0, 0.3647059, 1, 1,
0.2649553, -1.113655, 2.289681, 0, 0.3568628, 1, 1,
0.2652271, -0.4782473, 3.21264, 0, 0.3529412, 1, 1,
0.2668477, -1.394488, 4.520414, 0, 0.345098, 1, 1,
0.2684623, 0.9078583, 1.590008, 0, 0.3411765, 1, 1,
0.2696838, 0.2461169, 1.785165, 0, 0.3333333, 1, 1,
0.2735579, -1.583361, 1.703865, 0, 0.3294118, 1, 1,
0.2758946, -1.346377, 3.104294, 0, 0.3215686, 1, 1,
0.2762897, 2.367166, -1.45119, 0, 0.3176471, 1, 1,
0.2785365, -1.441991, 4.382069, 0, 0.3098039, 1, 1,
0.2786328, 0.4246577, 0.5458986, 0, 0.3058824, 1, 1,
0.2794819, 1.050096, 1.119691, 0, 0.2980392, 1, 1,
0.2804969, 1.450369, -0.1228832, 0, 0.2901961, 1, 1,
0.2869355, 0.163501, 1.785829, 0, 0.2862745, 1, 1,
0.2912956, -1.124504, 3.90987, 0, 0.2784314, 1, 1,
0.293283, 1.133852, 1.202027, 0, 0.2745098, 1, 1,
0.2937935, 1.757238, -0.4789509, 0, 0.2666667, 1, 1,
0.2964052, -0.79298, 2.143939, 0, 0.2627451, 1, 1,
0.297549, -0.09945365, 2.285227, 0, 0.254902, 1, 1,
0.2980668, 1.339309, 0.1758319, 0, 0.2509804, 1, 1,
0.3020755, -0.946535, 3.208292, 0, 0.2431373, 1, 1,
0.304126, 1.08561, -0.5156291, 0, 0.2392157, 1, 1,
0.3064381, 1.386879, -0.9626608, 0, 0.2313726, 1, 1,
0.3087672, 0.1177184, 0.5583563, 0, 0.227451, 1, 1,
0.308935, 0.557401, 0.3955204, 0, 0.2196078, 1, 1,
0.3100922, 1.685688, 1.937115, 0, 0.2156863, 1, 1,
0.3106583, 0.3360586, 1.964944, 0, 0.2078431, 1, 1,
0.3161802, 0.6313999, 1.427677, 0, 0.2039216, 1, 1,
0.3178482, -0.01781863, 0.8778377, 0, 0.1960784, 1, 1,
0.3260732, 0.1643481, 2.11774, 0, 0.1882353, 1, 1,
0.3277221, -1.038445, 3.08175, 0, 0.1843137, 1, 1,
0.3282684, -2.766927, 3.992733, 0, 0.1764706, 1, 1,
0.3304251, 0.2985473, -0.8079864, 0, 0.172549, 1, 1,
0.3359331, 0.2193347, 1.024411, 0, 0.1647059, 1, 1,
0.3398196, -0.4493455, 0.7377496, 0, 0.1607843, 1, 1,
0.345037, -0.1532033, 2.474768, 0, 0.1529412, 1, 1,
0.3485781, -0.8358492, 2.898439, 0, 0.1490196, 1, 1,
0.3501025, -0.6279987, 4.049575, 0, 0.1411765, 1, 1,
0.3541461, -0.6749354, 0.7552456, 0, 0.1372549, 1, 1,
0.3550446, 0.554545, 1.594619, 0, 0.1294118, 1, 1,
0.358444, -0.2362391, 1.302733, 0, 0.1254902, 1, 1,
0.3596762, 0.138642, 0.8921488, 0, 0.1176471, 1, 1,
0.3614212, 0.1515712, 1.862637, 0, 0.1137255, 1, 1,
0.3640306, 1.608565, 0.0495869, 0, 0.1058824, 1, 1,
0.3645119, -0.8211588, 0.4709637, 0, 0.09803922, 1, 1,
0.369104, 0.2974092, 0.8453199, 0, 0.09411765, 1, 1,
0.3698904, -0.8568269, 1.800629, 0, 0.08627451, 1, 1,
0.3704696, -1.024157, 1.550781, 0, 0.08235294, 1, 1,
0.3719492, -1.476701, 0.9136236, 0, 0.07450981, 1, 1,
0.37473, -2.451997, 3.02311, 0, 0.07058824, 1, 1,
0.3756699, 1.369009, 0.6303933, 0, 0.0627451, 1, 1,
0.3773012, 0.1648383, 1.612503, 0, 0.05882353, 1, 1,
0.3773355, 0.9233983, 0.01850771, 0, 0.05098039, 1, 1,
0.3778581, 0.8615491, 0.2282514, 0, 0.04705882, 1, 1,
0.3798557, 0.02990291, 2.414627, 0, 0.03921569, 1, 1,
0.3847566, 0.7158528, 0.3101786, 0, 0.03529412, 1, 1,
0.3864896, -0.7535315, 2.850083, 0, 0.02745098, 1, 1,
0.3877014, 1.207006, -0.1520824, 0, 0.02352941, 1, 1,
0.3880506, -1.52396, 3.672825, 0, 0.01568628, 1, 1,
0.3887269, 0.06903198, 2.675772, 0, 0.01176471, 1, 1,
0.3914953, -0.530319, 2.820084, 0, 0.003921569, 1, 1,
0.3925453, -0.1364487, 2.846236, 0.003921569, 0, 1, 1,
0.3927124, -0.1722273, 1.763131, 0.007843138, 0, 1, 1,
0.395807, 1.017845, 0.1610749, 0.01568628, 0, 1, 1,
0.3998617, -0.9305624, 3.295507, 0.01960784, 0, 1, 1,
0.4003359, 0.1272322, 2.49139, 0.02745098, 0, 1, 1,
0.4035014, -1.450468, 2.979728, 0.03137255, 0, 1, 1,
0.4036507, 1.126674, -1.450593, 0.03921569, 0, 1, 1,
0.4078011, -1.750835, 2.378507, 0.04313726, 0, 1, 1,
0.4130423, -1.058181, 4.195393, 0.05098039, 0, 1, 1,
0.4153067, -0.9900634, 2.536308, 0.05490196, 0, 1, 1,
0.4175428, -0.936055, 2.283592, 0.0627451, 0, 1, 1,
0.4176084, -1.054191, 2.522999, 0.06666667, 0, 1, 1,
0.4226081, 1.316224, 0.9636964, 0.07450981, 0, 1, 1,
0.4239776, -0.5202764, 4.644573, 0.07843138, 0, 1, 1,
0.42523, -1.917678, 2.905904, 0.08627451, 0, 1, 1,
0.42557, 1.474546, -1.403877, 0.09019608, 0, 1, 1,
0.431953, 2.229587, -0.8737895, 0.09803922, 0, 1, 1,
0.4319681, 0.6018109, 1.447623, 0.1058824, 0, 1, 1,
0.4320156, -0.09146798, 3.031645, 0.1098039, 0, 1, 1,
0.4348335, -1.717109, 2.901988, 0.1176471, 0, 1, 1,
0.4402822, 0.4063067, 0.9692706, 0.1215686, 0, 1, 1,
0.4410999, -0.6004723, 3.272157, 0.1294118, 0, 1, 1,
0.4424039, -0.6979474, 1.271248, 0.1333333, 0, 1, 1,
0.4436711, 1.872576, -0.9630316, 0.1411765, 0, 1, 1,
0.4454656, 0.6308385, 2.328948, 0.145098, 0, 1, 1,
0.4473173, 1.142012, -0.3229811, 0.1529412, 0, 1, 1,
0.4488144, 0.1517653, 1.27212, 0.1568628, 0, 1, 1,
0.4558428, 0.5607008, 0.9193673, 0.1647059, 0, 1, 1,
0.4614016, -0.1378096, 1.772667, 0.1686275, 0, 1, 1,
0.4615769, 1.646812, 1.250747, 0.1764706, 0, 1, 1,
0.4623031, 0.7389986, -1.051075, 0.1803922, 0, 1, 1,
0.4623332, -0.2903484, 4.03677, 0.1882353, 0, 1, 1,
0.4623958, -1.537347, 2.868039, 0.1921569, 0, 1, 1,
0.4674653, -0.4980387, 3.993729, 0.2, 0, 1, 1,
0.4685717, 0.4147504, 0.7479062, 0.2078431, 0, 1, 1,
0.4689848, -0.5980329, 3.901093, 0.2117647, 0, 1, 1,
0.4701101, 0.8570266, 0.5002234, 0.2196078, 0, 1, 1,
0.4747517, 0.5240268, 1.978786, 0.2235294, 0, 1, 1,
0.4755962, 0.3242938, 0.2064425, 0.2313726, 0, 1, 1,
0.4764735, -0.9923182, 3.026214, 0.2352941, 0, 1, 1,
0.4807051, -0.0619255, 0.9274247, 0.2431373, 0, 1, 1,
0.4813424, -0.8480376, 2.844676, 0.2470588, 0, 1, 1,
0.4851478, 0.4753858, 0.9950559, 0.254902, 0, 1, 1,
0.4895681, -1.019831, 4.813287, 0.2588235, 0, 1, 1,
0.4934368, 1.622156, -0.2898889, 0.2666667, 0, 1, 1,
0.4980835, -0.4836088, 4.159908, 0.2705882, 0, 1, 1,
0.5000697, -0.9160503, 3.637562, 0.2784314, 0, 1, 1,
0.5024172, 1.461236, -1.246531, 0.282353, 0, 1, 1,
0.5068902, 1.217618, -0.6235285, 0.2901961, 0, 1, 1,
0.507264, 1.231835, -0.1935806, 0.2941177, 0, 1, 1,
0.5133256, -0.5826831, 3.118871, 0.3019608, 0, 1, 1,
0.5141106, 0.08115848, 1.355206, 0.3098039, 0, 1, 1,
0.5145042, -0.4641215, 1.816379, 0.3137255, 0, 1, 1,
0.5199553, -1.024534, 0.8927609, 0.3215686, 0, 1, 1,
0.5279036, -0.3351838, 0.8284908, 0.3254902, 0, 1, 1,
0.5279949, 0.3284739, 0.1159356, 0.3333333, 0, 1, 1,
0.5306089, -1.048916, 2.288899, 0.3372549, 0, 1, 1,
0.5332354, -0.9417, 3.227169, 0.345098, 0, 1, 1,
0.5342767, -1.250603, 4.187433, 0.3490196, 0, 1, 1,
0.536655, -1.161683, 2.579941, 0.3568628, 0, 1, 1,
0.5379257, -0.675234, 2.568182, 0.3607843, 0, 1, 1,
0.5382155, 1.153515, 1.511935, 0.3686275, 0, 1, 1,
0.5389972, -0.5099491, 3.715939, 0.372549, 0, 1, 1,
0.539377, 0.6526847, 2.396975, 0.3803922, 0, 1, 1,
0.5399631, -0.3910061, 2.42581, 0.3843137, 0, 1, 1,
0.5449631, 0.4268321, 1.554746, 0.3921569, 0, 1, 1,
0.5457979, 1.305569, -1.031222, 0.3960784, 0, 1, 1,
0.5514271, -0.1732651, 0.805648, 0.4039216, 0, 1, 1,
0.5559545, -0.3547041, 2.005394, 0.4117647, 0, 1, 1,
0.5606757, 0.7534692, 0.0907989, 0.4156863, 0, 1, 1,
0.5610431, 1.716901, -1.022552, 0.4235294, 0, 1, 1,
0.5683216, -0.7843703, 1.422531, 0.427451, 0, 1, 1,
0.5690742, 0.3713201, 0.003392354, 0.4352941, 0, 1, 1,
0.5760858, 0.6233792, 0.9921395, 0.4392157, 0, 1, 1,
0.5846235, 0.4530146, 2.162667, 0.4470588, 0, 1, 1,
0.586445, -0.7387996, 3.04461, 0.4509804, 0, 1, 1,
0.5921597, -1.187785, 4.153221, 0.4588235, 0, 1, 1,
0.6029636, -0.6689553, 1.352312, 0.4627451, 0, 1, 1,
0.6036513, 0.7830123, 0.7952145, 0.4705882, 0, 1, 1,
0.6041617, -1.461592, 2.259197, 0.4745098, 0, 1, 1,
0.6045833, 1.016528, 0.6805294, 0.4823529, 0, 1, 1,
0.6073249, -1.081966, 3.461621, 0.4862745, 0, 1, 1,
0.6133452, 0.7833173, 0.5462341, 0.4941176, 0, 1, 1,
0.6137622, -0.4891946, 2.157898, 0.5019608, 0, 1, 1,
0.6190829, 0.19415, 2.652155, 0.5058824, 0, 1, 1,
0.6192906, 0.1744884, 3.714982, 0.5137255, 0, 1, 1,
0.6207134, 0.9592147, -0.5076913, 0.5176471, 0, 1, 1,
0.6215676, -0.2379011, 1.789413, 0.5254902, 0, 1, 1,
0.6219031, 0.7151725, 1.123207, 0.5294118, 0, 1, 1,
0.6233212, -0.4971646, 0.954689, 0.5372549, 0, 1, 1,
0.6244168, -0.8947959, 2.900253, 0.5411765, 0, 1, 1,
0.6246011, 0.473307, 0.7627758, 0.5490196, 0, 1, 1,
0.6267676, 0.4102238, 2.056015, 0.5529412, 0, 1, 1,
0.6294014, -0.3619525, 1.428153, 0.5607843, 0, 1, 1,
0.6360929, 1.261162, -1.847641, 0.5647059, 0, 1, 1,
0.6395186, 0.3580927, 2.212817, 0.572549, 0, 1, 1,
0.6400441, 2.374764, 1.067175, 0.5764706, 0, 1, 1,
0.6426668, 0.9055353, 0.7271453, 0.5843138, 0, 1, 1,
0.644325, -0.1626143, 2.765158, 0.5882353, 0, 1, 1,
0.6476949, 1.845976, 0.5810244, 0.5960785, 0, 1, 1,
0.649178, -0.4484142, 3.757022, 0.6039216, 0, 1, 1,
0.6493662, -0.2444779, 1.651606, 0.6078432, 0, 1, 1,
0.653629, -2.199682, 2.659075, 0.6156863, 0, 1, 1,
0.6546302, -0.1988726, 3.050737, 0.6196079, 0, 1, 1,
0.6584903, -1.649234, 2.606439, 0.627451, 0, 1, 1,
0.6657498, -0.6473702, 2.341258, 0.6313726, 0, 1, 1,
0.672184, -0.6095124, 0.7568285, 0.6392157, 0, 1, 1,
0.6759484, -1.002879, 2.649423, 0.6431373, 0, 1, 1,
0.6795493, 1.068012, 0.6802301, 0.6509804, 0, 1, 1,
0.6800591, -0.4311761, 2.855469, 0.654902, 0, 1, 1,
0.6807356, 2.046452, 1.01253, 0.6627451, 0, 1, 1,
0.6819358, 2.171889, -0.2631842, 0.6666667, 0, 1, 1,
0.6824243, 0.2080805, 0.4468807, 0.6745098, 0, 1, 1,
0.6842382, -0.6794219, 3.216311, 0.6784314, 0, 1, 1,
0.6851613, -1.026206, 5.575927, 0.6862745, 0, 1, 1,
0.6856405, -0.184008, 2.002356, 0.6901961, 0, 1, 1,
0.6983229, 0.4337835, 2.200742, 0.6980392, 0, 1, 1,
0.7016198, 0.687718, 0.4604036, 0.7058824, 0, 1, 1,
0.7030078, 0.6649374, 1.407681, 0.7098039, 0, 1, 1,
0.7041836, 0.6806571, -0.8676301, 0.7176471, 0, 1, 1,
0.7064456, 1.513474, -0.1308237, 0.7215686, 0, 1, 1,
0.7102758, 0.9915566, 3.119492, 0.7294118, 0, 1, 1,
0.7107242, 0.5203345, 2.009693, 0.7333333, 0, 1, 1,
0.7122541, 0.382296, -0.0222907, 0.7411765, 0, 1, 1,
0.7127351, -0.8127794, 3.322931, 0.7450981, 0, 1, 1,
0.7149425, -0.1372641, 0.1919262, 0.7529412, 0, 1, 1,
0.7334126, 0.3809051, 1.501041, 0.7568628, 0, 1, 1,
0.7336757, -0.1865454, 2.266302, 0.7647059, 0, 1, 1,
0.7350871, -1.081972, 3.173912, 0.7686275, 0, 1, 1,
0.7354773, 0.2186121, -0.4919785, 0.7764706, 0, 1, 1,
0.74502, 0.8037977, -2.109574, 0.7803922, 0, 1, 1,
0.7465529, -0.2560747, 1.91651, 0.7882353, 0, 1, 1,
0.7548673, -0.05430775, 1.394756, 0.7921569, 0, 1, 1,
0.7574698, -0.4067296, 1.699638, 0.8, 0, 1, 1,
0.7662241, -0.233018, 2.897036, 0.8078431, 0, 1, 1,
0.7708766, -0.8892019, 1.850384, 0.8117647, 0, 1, 1,
0.7781373, 0.03355798, 1.10242, 0.8196079, 0, 1, 1,
0.7790052, -1.406508, 1.248439, 0.8235294, 0, 1, 1,
0.7852189, -0.3449779, 1.59545, 0.8313726, 0, 1, 1,
0.7883971, 0.5444274, 1.702245, 0.8352941, 0, 1, 1,
0.7928188, -0.3018419, 2.35217, 0.8431373, 0, 1, 1,
0.8110151, 0.06324574, 1.794856, 0.8470588, 0, 1, 1,
0.8121268, 0.7507441, -0.4220546, 0.854902, 0, 1, 1,
0.8129531, -1.54898, 2.293447, 0.8588235, 0, 1, 1,
0.8170275, 1.791308, 0.9889143, 0.8666667, 0, 1, 1,
0.8279842, -0.1040613, 1.117557, 0.8705882, 0, 1, 1,
0.8298327, 0.9374166, 0.3468029, 0.8784314, 0, 1, 1,
0.8319742, 0.3121479, 1.857662, 0.8823529, 0, 1, 1,
0.8403275, -0.4033564, 1.158367, 0.8901961, 0, 1, 1,
0.8408675, 1.276379, 1.929995, 0.8941177, 0, 1, 1,
0.842778, 0.2909939, 1.134471, 0.9019608, 0, 1, 1,
0.8474197, 0.8160705, 1.324431, 0.9098039, 0, 1, 1,
0.8476311, 0.5167307, 0.9193999, 0.9137255, 0, 1, 1,
0.8495116, 0.3543808, -0.4691988, 0.9215686, 0, 1, 1,
0.8505123, 1.37195, 0.1952537, 0.9254902, 0, 1, 1,
0.8525195, 0.9514281, 0.8973204, 0.9333333, 0, 1, 1,
0.864234, 0.7745864, 0.4898092, 0.9372549, 0, 1, 1,
0.8645431, -0.08153357, 0.9683704, 0.945098, 0, 1, 1,
0.864634, 0.6262101, 1.677393, 0.9490196, 0, 1, 1,
0.865768, 0.188102, 1.537532, 0.9568627, 0, 1, 1,
0.8676496, 1.463271, 1.192341, 0.9607843, 0, 1, 1,
0.8685775, 0.1635131, 2.098873, 0.9686275, 0, 1, 1,
0.8688477, -0.1652294, 0.04634796, 0.972549, 0, 1, 1,
0.8695552, 0.600799, 1.375688, 0.9803922, 0, 1, 1,
0.8773008, -0.0499735, 1.483595, 0.9843137, 0, 1, 1,
0.8790424, 1.179888, 0.2753704, 0.9921569, 0, 1, 1,
0.8793043, -0.02873142, 2.137882, 0.9960784, 0, 1, 1,
0.8828195, -0.4129453, 1.345381, 1, 0, 0.9960784, 1,
0.8875084, -1.080179, 1.598189, 1, 0, 0.9882353, 1,
0.8920816, 0.9772668, 2.395268, 1, 0, 0.9843137, 1,
0.8936493, -0.9742698, 1.714945, 1, 0, 0.9764706, 1,
0.8971835, 0.3204165, 1.229798, 1, 0, 0.972549, 1,
0.8985554, 0.2936096, 1.389664, 1, 0, 0.9647059, 1,
0.8985829, 2.155786, 0.7594058, 1, 0, 0.9607843, 1,
0.9015639, -0.06790678, 3.07714, 1, 0, 0.9529412, 1,
0.9028397, 0.08027693, 2.397303, 1, 0, 0.9490196, 1,
0.9046302, -0.6765199, 1.70938, 1, 0, 0.9411765, 1,
0.9049179, -1.121775, 0.8347858, 1, 0, 0.9372549, 1,
0.905939, -2.020145, 2.847532, 1, 0, 0.9294118, 1,
0.9091876, 1.251607, 0.150465, 1, 0, 0.9254902, 1,
0.9143276, -0.1990048, 0.692824, 1, 0, 0.9176471, 1,
0.9174976, 0.5684673, 1.410841, 1, 0, 0.9137255, 1,
0.9177583, -1.237876, 1.961372, 1, 0, 0.9058824, 1,
0.9283265, 1.392965, 1.437058, 1, 0, 0.9019608, 1,
0.9300506, -0.8684663, 3.216037, 1, 0, 0.8941177, 1,
0.9339269, -1.262068, 3.12852, 1, 0, 0.8862745, 1,
0.934183, -0.2725034, 1.174315, 1, 0, 0.8823529, 1,
0.935014, -0.7246775, 1.375323, 1, 0, 0.8745098, 1,
0.9357473, -0.4905158, 1.71336, 1, 0, 0.8705882, 1,
0.936875, 1.235476, 0.3915007, 1, 0, 0.8627451, 1,
0.9375629, -1.415102, 3.303961, 1, 0, 0.8588235, 1,
0.9454732, 0.6493361, 0.3556674, 1, 0, 0.8509804, 1,
0.9464622, -0.4590864, 1.736033, 1, 0, 0.8470588, 1,
0.9617969, -0.4346136, 2.972143, 1, 0, 0.8392157, 1,
0.9625632, -0.6729404, 2.505837, 1, 0, 0.8352941, 1,
0.968527, 0.4655242, 1.260729, 1, 0, 0.827451, 1,
0.9697206, 2.167761, 0.3606419, 1, 0, 0.8235294, 1,
0.9766459, 1.513732, -0.201641, 1, 0, 0.8156863, 1,
0.9781805, -1.249768, 0.653328, 1, 0, 0.8117647, 1,
0.9781953, -0.118232, 0.09311028, 1, 0, 0.8039216, 1,
0.991195, -1.838235, 1.923199, 1, 0, 0.7960784, 1,
0.9918613, 0.8239965, 2.035901, 1, 0, 0.7921569, 1,
0.9963935, -0.03401463, 1.320954, 1, 0, 0.7843137, 1,
0.9994641, -0.7507305, 2.470493, 1, 0, 0.7803922, 1,
1.000317, -2.245137, 3.973419, 1, 0, 0.772549, 1,
1.003044, -0.2535118, 2.836356, 1, 0, 0.7686275, 1,
1.012599, 0.2954439, 2.084977, 1, 0, 0.7607843, 1,
1.021969, 0.0758945, 1.937646, 1, 0, 0.7568628, 1,
1.023161, 0.2812567, 0.1663089, 1, 0, 0.7490196, 1,
1.031237, 0.3578223, 2.856931, 1, 0, 0.7450981, 1,
1.036192, 0.2233274, 0.9752951, 1, 0, 0.7372549, 1,
1.040211, -1.019849, 2.958787, 1, 0, 0.7333333, 1,
1.041894, 0.1930766, 1.643388, 1, 0, 0.7254902, 1,
1.041957, -0.1005341, 2.104206, 1, 0, 0.7215686, 1,
1.04428, 1.155756, 0.8495107, 1, 0, 0.7137255, 1,
1.052508, -0.1533199, 2.384573, 1, 0, 0.7098039, 1,
1.056592, 0.2193772, 0.3710887, 1, 0, 0.7019608, 1,
1.058629, -0.3565365, 0.8999764, 1, 0, 0.6941177, 1,
1.067986, 2.148744, 0.4692338, 1, 0, 0.6901961, 1,
1.070205, 1.291723, 0.914178, 1, 0, 0.682353, 1,
1.074827, 0.1418932, 1.26134, 1, 0, 0.6784314, 1,
1.091642, -0.389405, 1.139023, 1, 0, 0.6705883, 1,
1.103156, -1.272133, 3.292914, 1, 0, 0.6666667, 1,
1.10327, -1.810263, 1.523998, 1, 0, 0.6588235, 1,
1.115523, 1.048733, 0.1347548, 1, 0, 0.654902, 1,
1.130644, 0.3657054, 1.593535, 1, 0, 0.6470588, 1,
1.13786, 1.957322, 1.642415, 1, 0, 0.6431373, 1,
1.14188, 0.2672793, 1.813917, 1, 0, 0.6352941, 1,
1.142631, 0.2621748, 2.895101, 1, 0, 0.6313726, 1,
1.149899, 0.7179152, 2.018411, 1, 0, 0.6235294, 1,
1.159787, -0.1158248, 1.525449, 1, 0, 0.6196079, 1,
1.163694, 1.038096, 1.602595, 1, 0, 0.6117647, 1,
1.164151, 0.77963, -0.2156806, 1, 0, 0.6078432, 1,
1.200135, -1.193461, 2.549667, 1, 0, 0.6, 1,
1.203388, -0.3794585, -0.3877401, 1, 0, 0.5921569, 1,
1.206066, 1.506033, 1.791747, 1, 0, 0.5882353, 1,
1.210434, -0.1818138, 0.968658, 1, 0, 0.5803922, 1,
1.222783, -0.4502364, 2.804249, 1, 0, 0.5764706, 1,
1.238012, 0.07148383, 0.7873585, 1, 0, 0.5686275, 1,
1.238284, -0.1414354, 1.562869, 1, 0, 0.5647059, 1,
1.24487, -0.07340698, 1.576573, 1, 0, 0.5568628, 1,
1.255716, -2.356911, 3.005806, 1, 0, 0.5529412, 1,
1.262576, 2.078328, 0.4722545, 1, 0, 0.5450981, 1,
1.264076, -0.2471534, -0.6451918, 1, 0, 0.5411765, 1,
1.272708, 1.879206, 0.9898452, 1, 0, 0.5333334, 1,
1.291391, 0.253062, 0.9364229, 1, 0, 0.5294118, 1,
1.294775, -0.7293804, 0.9042634, 1, 0, 0.5215687, 1,
1.297502, 0.3238348, 2.230713, 1, 0, 0.5176471, 1,
1.299616, 1.772086, -0.1074218, 1, 0, 0.509804, 1,
1.316012, 0.5868489, 2.976383, 1, 0, 0.5058824, 1,
1.324539, -0.1672898, -0.3898664, 1, 0, 0.4980392, 1,
1.346667, 0.4900496, 0.5082829, 1, 0, 0.4901961, 1,
1.3519, -0.9405088, 2.780986, 1, 0, 0.4862745, 1,
1.365485, -0.3151374, 2.492944, 1, 0, 0.4784314, 1,
1.374372, -0.6414271, 1.960938, 1, 0, 0.4745098, 1,
1.37795, -0.6719889, 1.483133, 1, 0, 0.4666667, 1,
1.382699, -0.4585185, 2.043988, 1, 0, 0.4627451, 1,
1.394151, 0.09017675, 0.2814801, 1, 0, 0.454902, 1,
1.397104, -1.280946, 2.407212, 1, 0, 0.4509804, 1,
1.398706, 0.820312, 0.9871678, 1, 0, 0.4431373, 1,
1.406882, 0.5929427, 0.3729444, 1, 0, 0.4392157, 1,
1.407242, 0.01109104, 0.7677945, 1, 0, 0.4313726, 1,
1.409007, -0.265279, 1.798247, 1, 0, 0.427451, 1,
1.4177, -0.4221656, 1.305404, 1, 0, 0.4196078, 1,
1.444946, -1.033941, 2.767993, 1, 0, 0.4156863, 1,
1.457045, -0.8148044, 1.304812, 1, 0, 0.4078431, 1,
1.463056, 0.9364755, 0.9965739, 1, 0, 0.4039216, 1,
1.47234, -0.8130462, 3.048275, 1, 0, 0.3960784, 1,
1.492455, 0.4216713, 0.5905836, 1, 0, 0.3882353, 1,
1.500375, 0.3463382, 2.08955, 1, 0, 0.3843137, 1,
1.512871, 0.5476481, 0.07295866, 1, 0, 0.3764706, 1,
1.528177, 0.2278428, 0.6136214, 1, 0, 0.372549, 1,
1.546207, -0.654045, 0.04511267, 1, 0, 0.3647059, 1,
1.546934, -0.5535248, 2.011219, 1, 0, 0.3607843, 1,
1.547017, -0.150633, 0.802397, 1, 0, 0.3529412, 1,
1.551935, -0.7599286, 2.400444, 1, 0, 0.3490196, 1,
1.55246, -0.9076357, 1.718268, 1, 0, 0.3411765, 1,
1.593408, -0.3461215, 0.1055477, 1, 0, 0.3372549, 1,
1.600285, 0.6589226, 1.265509, 1, 0, 0.3294118, 1,
1.658314, -0.8818165, 0.8839034, 1, 0, 0.3254902, 1,
1.663821, -0.9695803, 1.568162, 1, 0, 0.3176471, 1,
1.669246, -0.3473153, 2.296694, 1, 0, 0.3137255, 1,
1.681161, 1.567035, 0.0827279, 1, 0, 0.3058824, 1,
1.68591, -0.8420137, 0.5048931, 1, 0, 0.2980392, 1,
1.687667, -0.181248, 1.177284, 1, 0, 0.2941177, 1,
1.743411, 0.3435236, 0.4910878, 1, 0, 0.2862745, 1,
1.747796, 0.9524725, 0.270026, 1, 0, 0.282353, 1,
1.754761, -0.8992953, 0.8074716, 1, 0, 0.2745098, 1,
1.761301, 0.005349508, 1.59399, 1, 0, 0.2705882, 1,
1.797628, 1.300231, 1.631322, 1, 0, 0.2627451, 1,
1.857434, 0.5258133, 0.6974512, 1, 0, 0.2588235, 1,
1.861604, 0.4395508, 2.066615, 1, 0, 0.2509804, 1,
1.871448, 0.7690517, -0.1454934, 1, 0, 0.2470588, 1,
1.883519, 0.01332365, 3.324084, 1, 0, 0.2392157, 1,
1.898194, -0.5359563, 1.118739, 1, 0, 0.2352941, 1,
1.906066, -0.4190838, 0.6768548, 1, 0, 0.227451, 1,
1.911441, -0.6616671, 1.918831, 1, 0, 0.2235294, 1,
1.922327, -0.4366743, 2.645222, 1, 0, 0.2156863, 1,
1.936414, -0.6478552, 1.343779, 1, 0, 0.2117647, 1,
1.965122, 1.624364, 0.8138805, 1, 0, 0.2039216, 1,
2.017718, -0.5719907, 1.800467, 1, 0, 0.1960784, 1,
2.038665, 0.3087912, 1.316709, 1, 0, 0.1921569, 1,
2.078515, 1.190053, -0.4545796, 1, 0, 0.1843137, 1,
2.084985, 0.02171857, 2.799186, 1, 0, 0.1803922, 1,
2.102089, 1.258656, 1.692291, 1, 0, 0.172549, 1,
2.118957, 1.514454, 0.5233784, 1, 0, 0.1686275, 1,
2.121797, -1.33458, 1.245649, 1, 0, 0.1607843, 1,
2.126594, -1.435989, 1.145854, 1, 0, 0.1568628, 1,
2.140748, -3.453327, 0.8046374, 1, 0, 0.1490196, 1,
2.141198, 0.056954, 0.8581897, 1, 0, 0.145098, 1,
2.15454, 0.8543644, 0.5098451, 1, 0, 0.1372549, 1,
2.164168, 1.338989, 1.089496, 1, 0, 0.1333333, 1,
2.165945, 0.3186386, 2.089233, 1, 0, 0.1254902, 1,
2.221141, -0.6945365, 2.928742, 1, 0, 0.1215686, 1,
2.247918, 1.354133, 2.75557, 1, 0, 0.1137255, 1,
2.25035, 0.3594465, 1.354574, 1, 0, 0.1098039, 1,
2.270284, 2.549713, 0.8208114, 1, 0, 0.1019608, 1,
2.280742, -0.7671913, 3.498303, 1, 0, 0.09411765, 1,
2.303132, 0.01966946, 0.2316293, 1, 0, 0.09019608, 1,
2.305721, -1.900003, 3.222077, 1, 0, 0.08235294, 1,
2.321184, 0.3411708, 0.6203278, 1, 0, 0.07843138, 1,
2.428452, 0.394614, 0.5894204, 1, 0, 0.07058824, 1,
2.538105, 0.6732702, 0.4149185, 1, 0, 0.06666667, 1,
2.617781, -1.322634, 2.607592, 1, 0, 0.05882353, 1,
2.626977, 0.4176961, 2.138503, 1, 0, 0.05490196, 1,
2.719268, 0.3684528, 0.858388, 1, 0, 0.04705882, 1,
2.74367, -0.1733822, 2.182601, 1, 0, 0.04313726, 1,
2.869162, 1.486533, 0.2802866, 1, 0, 0.03529412, 1,
2.891415, 1.034445, 2.077517, 1, 0, 0.03137255, 1,
2.901073, -1.545319, 4.61687, 1, 0, 0.02352941, 1,
3.020254, -0.3478357, 1.69973, 1, 0, 0.01960784, 1,
3.283895, 1.556895, 0.1065668, 1, 0, 0.01176471, 1,
3.398085, 1.95559, -0.6687225, 1, 0, 0.007843138, 1
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
0.1721419, -4.592986, -7.302536, 0, -0.5, 0.5, 0.5,
0.1721419, -4.592986, -7.302536, 1, -0.5, 0.5, 0.5,
0.1721419, -4.592986, -7.302536, 1, 1.5, 0.5, 0.5,
0.1721419, -4.592986, -7.302536, 0, 1.5, 0.5, 0.5
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
-4.147396, -0.09150136, -7.302536, 0, -0.5, 0.5, 0.5,
-4.147396, -0.09150136, -7.302536, 1, -0.5, 0.5, 0.5,
-4.147396, -0.09150136, -7.302536, 1, 1.5, 0.5, 0.5,
-4.147396, -0.09150136, -7.302536, 0, 1.5, 0.5, 0.5
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
-4.147396, -4.592986, 0.06995773, 0, -0.5, 0.5, 0.5,
-4.147396, -4.592986, 0.06995773, 1, -0.5, 0.5, 0.5,
-4.147396, -4.592986, 0.06995773, 1, 1.5, 0.5, 0.5,
-4.147396, -4.592986, 0.06995773, 0, 1.5, 0.5, 0.5
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
-3, -3.554182, -5.601191,
3, -3.554182, -5.601191,
-3, -3.554182, -5.601191,
-3, -3.727316, -5.884748,
-2, -3.554182, -5.601191,
-2, -3.727316, -5.884748,
-1, -3.554182, -5.601191,
-1, -3.727316, -5.884748,
0, -3.554182, -5.601191,
0, -3.727316, -5.884748,
1, -3.554182, -5.601191,
1, -3.727316, -5.884748,
2, -3.554182, -5.601191,
2, -3.727316, -5.884748,
3, -3.554182, -5.601191,
3, -3.727316, -5.884748
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
-3, -4.073584, -6.451863, 0, -0.5, 0.5, 0.5,
-3, -4.073584, -6.451863, 1, -0.5, 0.5, 0.5,
-3, -4.073584, -6.451863, 1, 1.5, 0.5, 0.5,
-3, -4.073584, -6.451863, 0, 1.5, 0.5, 0.5,
-2, -4.073584, -6.451863, 0, -0.5, 0.5, 0.5,
-2, -4.073584, -6.451863, 1, -0.5, 0.5, 0.5,
-2, -4.073584, -6.451863, 1, 1.5, 0.5, 0.5,
-2, -4.073584, -6.451863, 0, 1.5, 0.5, 0.5,
-1, -4.073584, -6.451863, 0, -0.5, 0.5, 0.5,
-1, -4.073584, -6.451863, 1, -0.5, 0.5, 0.5,
-1, -4.073584, -6.451863, 1, 1.5, 0.5, 0.5,
-1, -4.073584, -6.451863, 0, 1.5, 0.5, 0.5,
0, -4.073584, -6.451863, 0, -0.5, 0.5, 0.5,
0, -4.073584, -6.451863, 1, -0.5, 0.5, 0.5,
0, -4.073584, -6.451863, 1, 1.5, 0.5, 0.5,
0, -4.073584, -6.451863, 0, 1.5, 0.5, 0.5,
1, -4.073584, -6.451863, 0, -0.5, 0.5, 0.5,
1, -4.073584, -6.451863, 1, -0.5, 0.5, 0.5,
1, -4.073584, -6.451863, 1, 1.5, 0.5, 0.5,
1, -4.073584, -6.451863, 0, 1.5, 0.5, 0.5,
2, -4.073584, -6.451863, 0, -0.5, 0.5, 0.5,
2, -4.073584, -6.451863, 1, -0.5, 0.5, 0.5,
2, -4.073584, -6.451863, 1, 1.5, 0.5, 0.5,
2, -4.073584, -6.451863, 0, 1.5, 0.5, 0.5,
3, -4.073584, -6.451863, 0, -0.5, 0.5, 0.5,
3, -4.073584, -6.451863, 1, -0.5, 0.5, 0.5,
3, -4.073584, -6.451863, 1, 1.5, 0.5, 0.5,
3, -4.073584, -6.451863, 0, 1.5, 0.5, 0.5
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
-3.150579, -3, -5.601191,
-3.150579, 3, -5.601191,
-3.150579, -3, -5.601191,
-3.316715, -3, -5.884748,
-3.150579, -2, -5.601191,
-3.316715, -2, -5.884748,
-3.150579, -1, -5.601191,
-3.316715, -1, -5.884748,
-3.150579, 0, -5.601191,
-3.316715, 0, -5.884748,
-3.150579, 1, -5.601191,
-3.316715, 1, -5.884748,
-3.150579, 2, -5.601191,
-3.316715, 2, -5.884748,
-3.150579, 3, -5.601191,
-3.316715, 3, -5.884748
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
-3.648987, -3, -6.451863, 0, -0.5, 0.5, 0.5,
-3.648987, -3, -6.451863, 1, -0.5, 0.5, 0.5,
-3.648987, -3, -6.451863, 1, 1.5, 0.5, 0.5,
-3.648987, -3, -6.451863, 0, 1.5, 0.5, 0.5,
-3.648987, -2, -6.451863, 0, -0.5, 0.5, 0.5,
-3.648987, -2, -6.451863, 1, -0.5, 0.5, 0.5,
-3.648987, -2, -6.451863, 1, 1.5, 0.5, 0.5,
-3.648987, -2, -6.451863, 0, 1.5, 0.5, 0.5,
-3.648987, -1, -6.451863, 0, -0.5, 0.5, 0.5,
-3.648987, -1, -6.451863, 1, -0.5, 0.5, 0.5,
-3.648987, -1, -6.451863, 1, 1.5, 0.5, 0.5,
-3.648987, -1, -6.451863, 0, 1.5, 0.5, 0.5,
-3.648987, 0, -6.451863, 0, -0.5, 0.5, 0.5,
-3.648987, 0, -6.451863, 1, -0.5, 0.5, 0.5,
-3.648987, 0, -6.451863, 1, 1.5, 0.5, 0.5,
-3.648987, 0, -6.451863, 0, 1.5, 0.5, 0.5,
-3.648987, 1, -6.451863, 0, -0.5, 0.5, 0.5,
-3.648987, 1, -6.451863, 1, -0.5, 0.5, 0.5,
-3.648987, 1, -6.451863, 1, 1.5, 0.5, 0.5,
-3.648987, 1, -6.451863, 0, 1.5, 0.5, 0.5,
-3.648987, 2, -6.451863, 0, -0.5, 0.5, 0.5,
-3.648987, 2, -6.451863, 1, -0.5, 0.5, 0.5,
-3.648987, 2, -6.451863, 1, 1.5, 0.5, 0.5,
-3.648987, 2, -6.451863, 0, 1.5, 0.5, 0.5,
-3.648987, 3, -6.451863, 0, -0.5, 0.5, 0.5,
-3.648987, 3, -6.451863, 1, -0.5, 0.5, 0.5,
-3.648987, 3, -6.451863, 1, 1.5, 0.5, 0.5,
-3.648987, 3, -6.451863, 0, 1.5, 0.5, 0.5
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
-3.150579, -3.554182, -4,
-3.150579, -3.554182, 4,
-3.150579, -3.554182, -4,
-3.316715, -3.727316, -4,
-3.150579, -3.554182, -2,
-3.316715, -3.727316, -2,
-3.150579, -3.554182, 0,
-3.316715, -3.727316, 0,
-3.150579, -3.554182, 2,
-3.316715, -3.727316, 2,
-3.150579, -3.554182, 4,
-3.316715, -3.727316, 4
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
-3.648987, -4.073584, -4, 0, -0.5, 0.5, 0.5,
-3.648987, -4.073584, -4, 1, -0.5, 0.5, 0.5,
-3.648987, -4.073584, -4, 1, 1.5, 0.5, 0.5,
-3.648987, -4.073584, -4, 0, 1.5, 0.5, 0.5,
-3.648987, -4.073584, -2, 0, -0.5, 0.5, 0.5,
-3.648987, -4.073584, -2, 1, -0.5, 0.5, 0.5,
-3.648987, -4.073584, -2, 1, 1.5, 0.5, 0.5,
-3.648987, -4.073584, -2, 0, 1.5, 0.5, 0.5,
-3.648987, -4.073584, 0, 0, -0.5, 0.5, 0.5,
-3.648987, -4.073584, 0, 1, -0.5, 0.5, 0.5,
-3.648987, -4.073584, 0, 1, 1.5, 0.5, 0.5,
-3.648987, -4.073584, 0, 0, 1.5, 0.5, 0.5,
-3.648987, -4.073584, 2, 0, -0.5, 0.5, 0.5,
-3.648987, -4.073584, 2, 1, -0.5, 0.5, 0.5,
-3.648987, -4.073584, 2, 1, 1.5, 0.5, 0.5,
-3.648987, -4.073584, 2, 0, 1.5, 0.5, 0.5,
-3.648987, -4.073584, 4, 0, -0.5, 0.5, 0.5,
-3.648987, -4.073584, 4, 1, -0.5, 0.5, 0.5,
-3.648987, -4.073584, 4, 1, 1.5, 0.5, 0.5,
-3.648987, -4.073584, 4, 0, 1.5, 0.5, 0.5
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
-3.150579, -3.554182, -5.601191,
-3.150579, 3.371179, -5.601191,
-3.150579, -3.554182, 5.741107,
-3.150579, 3.371179, 5.741107,
-3.150579, -3.554182, -5.601191,
-3.150579, -3.554182, 5.741107,
-3.150579, 3.371179, -5.601191,
-3.150579, 3.371179, 5.741107,
-3.150579, -3.554182, -5.601191,
3.494863, -3.554182, -5.601191,
-3.150579, -3.554182, 5.741107,
3.494863, -3.554182, 5.741107,
-3.150579, 3.371179, -5.601191,
3.494863, 3.371179, -5.601191,
-3.150579, 3.371179, 5.741107,
3.494863, 3.371179, 5.741107,
3.494863, -3.554182, -5.601191,
3.494863, 3.371179, -5.601191,
3.494863, -3.554182, 5.741107,
3.494863, 3.371179, 5.741107,
3.494863, -3.554182, -5.601191,
3.494863, -3.554182, 5.741107,
3.494863, 3.371179, -5.601191,
3.494863, 3.371179, 5.741107
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
var radius = 7.934064;
var distance = 35.29955;
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
mvMatrix.translate( -0.1721419, 0.09150136, -0.06995773 );
mvMatrix.scale( 1.29088, 1.238703, 0.7563252 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.29955);
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
pyribenzoxim<-read.table("pyribenzoxim.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyribenzoxim$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyribenzoxim' not found
```

```r
y<-pyribenzoxim$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyribenzoxim' not found
```

```r
z<-pyribenzoxim$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyribenzoxim' not found
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
-3.053801, 0.2259986, -3.244652, 0, 0, 1, 1, 1,
-2.898396, 1.907425, -0.3257447, 1, 0, 0, 1, 1,
-2.825807, 2.159331, -1.143677, 1, 0, 0, 1, 1,
-2.766846, 0.9488463, -2.489761, 1, 0, 0, 1, 1,
-2.670093, 0.728076, -1.295562, 1, 0, 0, 1, 1,
-2.651613, -0.3116303, -1.244025, 1, 0, 0, 1, 1,
-2.521982, 0.007993204, -1.194525, 0, 0, 0, 1, 1,
-2.441093, 1.723562, 1.381271, 0, 0, 0, 1, 1,
-2.370462, -0.8177699, -1.03613, 0, 0, 0, 1, 1,
-2.356932, -1.335239, -2.085237, 0, 0, 0, 1, 1,
-2.330453, 0.8899841, -1.206602, 0, 0, 0, 1, 1,
-2.31855, 0.1608123, -0.5358244, 0, 0, 0, 1, 1,
-2.296228, 1.435324, -0.7986444, 0, 0, 0, 1, 1,
-2.29051, 2.184228, -1.524345, 1, 1, 1, 1, 1,
-2.289231, -0.9183955, -1.248834, 1, 1, 1, 1, 1,
-2.273918, -2.103772, -2.649851, 1, 1, 1, 1, 1,
-2.209259, 0.7307924, -0.3145483, 1, 1, 1, 1, 1,
-2.202258, -0.7118792, -2.257429, 1, 1, 1, 1, 1,
-2.199241, -1.094416, -2.772464, 1, 1, 1, 1, 1,
-2.185205, 0.5242653, -1.362651, 1, 1, 1, 1, 1,
-2.161899, -2.028248, -2.703461, 1, 1, 1, 1, 1,
-2.153766, -0.8406861, -3.178968, 1, 1, 1, 1, 1,
-2.13623, 0.729349, -2.202988, 1, 1, 1, 1, 1,
-2.124553, -0.9139295, -2.160228, 1, 1, 1, 1, 1,
-2.113407, -0.9426904, -2.509396, 1, 1, 1, 1, 1,
-2.053969, -1.123732, -1.686764, 1, 1, 1, 1, 1,
-2.046114, -0.6410286, -1.56972, 1, 1, 1, 1, 1,
-2.03424, 0.4927209, -0.2762774, 1, 1, 1, 1, 1,
-2.010961, -1.735377, -2.473768, 0, 0, 1, 1, 1,
-2.008658, 0.7327314, -2.375372, 1, 0, 0, 1, 1,
-2.008387, 1.225928, -1.419619, 1, 0, 0, 1, 1,
-1.983191, -1.008757, -3.443362, 1, 0, 0, 1, 1,
-1.93316, 0.3318734, -2.065419, 1, 0, 0, 1, 1,
-1.902981, -0.2139179, -2.542175, 1, 0, 0, 1, 1,
-1.902652, -0.3976089, -2.701735, 0, 0, 0, 1, 1,
-1.900303, -0.8979383, -0.9634845, 0, 0, 0, 1, 1,
-1.888762, 0.6853248, -0.9324753, 0, 0, 0, 1, 1,
-1.888188, -0.314322, -2.052393, 0, 0, 0, 1, 1,
-1.864739, -1.17919, -1.583525, 0, 0, 0, 1, 1,
-1.843745, -1.152865, -2.150087, 0, 0, 0, 1, 1,
-1.834933, -0.962258, -2.401566, 0, 0, 0, 1, 1,
-1.833463, 0.2588352, -0.9405549, 1, 1, 1, 1, 1,
-1.830596, -0.8835439, -1.314794, 1, 1, 1, 1, 1,
-1.807705, 0.6704121, -0.5964267, 1, 1, 1, 1, 1,
-1.788775, 0.5669363, 1.085001, 1, 1, 1, 1, 1,
-1.766568, 0.06991794, -1.027073, 1, 1, 1, 1, 1,
-1.733809, -0.006376212, -1.498699, 1, 1, 1, 1, 1,
-1.72723, 0.186194, 0.2078098, 1, 1, 1, 1, 1,
-1.722594, 0.02490628, -0.7231241, 1, 1, 1, 1, 1,
-1.713154, 0.6011202, -0.6780044, 1, 1, 1, 1, 1,
-1.711389, -0.1069873, -2.250595, 1, 1, 1, 1, 1,
-1.698205, -0.08373332, 0.1369931, 1, 1, 1, 1, 1,
-1.692115, -0.3833358, -3.106018, 1, 1, 1, 1, 1,
-1.664254, -0.8368595, -2.681172, 1, 1, 1, 1, 1,
-1.65191, 1.488459, -1.075705, 1, 1, 1, 1, 1,
-1.628946, -0.6889615, -2.840598, 1, 1, 1, 1, 1,
-1.621762, -0.8640255, -2.524822, 0, 0, 1, 1, 1,
-1.612076, 0.2553194, -2.859076, 1, 0, 0, 1, 1,
-1.589314, 1.381474, -1.515455, 1, 0, 0, 1, 1,
-1.586365, 1.858362, -2.849052, 1, 0, 0, 1, 1,
-1.581369, -0.7050729, -2.221891, 1, 0, 0, 1, 1,
-1.572262, 0.2275317, -1.57579, 1, 0, 0, 1, 1,
-1.563385, 1.021933, -2.036214, 0, 0, 0, 1, 1,
-1.559568, -2.186381, -3.981867, 0, 0, 0, 1, 1,
-1.559173, -0.3119397, -1.843674, 0, 0, 0, 1, 1,
-1.546302, -1.27472, -3.299757, 0, 0, 0, 1, 1,
-1.543718, -2.750732, -2.941563, 0, 0, 0, 1, 1,
-1.538908, -0.2137676, -2.456006, 0, 0, 0, 1, 1,
-1.534733, 0.4093061, -3.674298, 0, 0, 0, 1, 1,
-1.520804, 0.00737673, -2.505895, 1, 1, 1, 1, 1,
-1.520431, 0.8575017, -1.609579, 1, 1, 1, 1, 1,
-1.5143, 1.128437, -1.416151, 1, 1, 1, 1, 1,
-1.512907, 1.480061, -0.8788692, 1, 1, 1, 1, 1,
-1.504866, 0.3885609, -0.9579713, 1, 1, 1, 1, 1,
-1.496132, 0.4657322, -1.32307, 1, 1, 1, 1, 1,
-1.485885, 0.5343118, -1.848682, 1, 1, 1, 1, 1,
-1.482326, -0.7672232, -1.953674, 1, 1, 1, 1, 1,
-1.474794, -1.808751, -2.190344, 1, 1, 1, 1, 1,
-1.469231, 0.2654038, -0.608488, 1, 1, 1, 1, 1,
-1.467351, -1.364146, -2.897705, 1, 1, 1, 1, 1,
-1.466569, -1.083332, -2.179662, 1, 1, 1, 1, 1,
-1.465459, 0.6536075, -2.043764, 1, 1, 1, 1, 1,
-1.462236, 1.181536, -0.9812564, 1, 1, 1, 1, 1,
-1.450496, -0.1021256, -2.444577, 1, 1, 1, 1, 1,
-1.437181, -1.378402, -2.669417, 0, 0, 1, 1, 1,
-1.431373, -0.5556363, -3.949817, 1, 0, 0, 1, 1,
-1.431243, -0.6205352, -2.612209, 1, 0, 0, 1, 1,
-1.423504, -2.103751, -1.294216, 1, 0, 0, 1, 1,
-1.422341, -1.685756, -2.471102, 1, 0, 0, 1, 1,
-1.416543, 1.791286, -2.171914, 1, 0, 0, 1, 1,
-1.411314, -0.6322408, -1.408656, 0, 0, 0, 1, 1,
-1.410587, 1.480895, -0.5125693, 0, 0, 0, 1, 1,
-1.399374, -1.325763, -2.161951, 0, 0, 0, 1, 1,
-1.379314, 0.1964442, -2.155701, 0, 0, 0, 1, 1,
-1.377055, -2.334248, -1.688949, 0, 0, 0, 1, 1,
-1.365745, 0.4970723, -0.3371701, 0, 0, 0, 1, 1,
-1.342008, -1.534293, -0.6117681, 0, 0, 0, 1, 1,
-1.337883, -1.382895, -1.976339, 1, 1, 1, 1, 1,
-1.331244, 0.5655733, -1.888096, 1, 1, 1, 1, 1,
-1.287217, 1.023876, -0.542755, 1, 1, 1, 1, 1,
-1.285958, 0.8518257, -0.3367525, 1, 1, 1, 1, 1,
-1.284444, 0.8963999, 1.165432, 1, 1, 1, 1, 1,
-1.281702, -0.5506873, -0.1059839, 1, 1, 1, 1, 1,
-1.28002, 0.4665314, -1.291209, 1, 1, 1, 1, 1,
-1.279469, -0.5748425, -3.749032, 1, 1, 1, 1, 1,
-1.26724, 0.05011515, -1.913896, 1, 1, 1, 1, 1,
-1.266398, 0.7629656, -1.771918, 1, 1, 1, 1, 1,
-1.262156, 0.8623748, -1.280568, 1, 1, 1, 1, 1,
-1.254598, -0.1341052, -2.737588, 1, 1, 1, 1, 1,
-1.252316, 0.7613229, -1.954605, 1, 1, 1, 1, 1,
-1.24803, 1.020949, -1.070029, 1, 1, 1, 1, 1,
-1.238671, -1.037265, -2.79496, 1, 1, 1, 1, 1,
-1.236864, -0.3305941, -2.650818, 0, 0, 1, 1, 1,
-1.236339, -1.083682, -0.7495577, 1, 0, 0, 1, 1,
-1.227822, -0.9717728, -1.832547, 1, 0, 0, 1, 1,
-1.226295, 0.2006415, -2.399788, 1, 0, 0, 1, 1,
-1.22605, -0.06961063, -1.333566, 1, 0, 0, 1, 1,
-1.224325, -1.232712, -1.06923, 1, 0, 0, 1, 1,
-1.215896, 0.2633012, 0.424867, 0, 0, 0, 1, 1,
-1.213382, -0.5029299, -0.9596789, 0, 0, 0, 1, 1,
-1.200758, -2.120303, -2.420791, 0, 0, 0, 1, 1,
-1.198806, -0.7524177, -1.966875, 0, 0, 0, 1, 1,
-1.195292, -0.2612146, -2.356704, 0, 0, 0, 1, 1,
-1.194499, -1.019058, -2.986882, 0, 0, 0, 1, 1,
-1.194283, -0.8518072, -3.813019, 0, 0, 0, 1, 1,
-1.193837, -1.311218, -2.804029, 1, 1, 1, 1, 1,
-1.193654, 0.03480708, -0.424958, 1, 1, 1, 1, 1,
-1.173956, 1.809533, 0.6210614, 1, 1, 1, 1, 1,
-1.172632, 1.341914, -1.430301, 1, 1, 1, 1, 1,
-1.164192, 0.008698512, -1.860476, 1, 1, 1, 1, 1,
-1.162012, 0.5633878, -2.619092, 1, 1, 1, 1, 1,
-1.153188, 1.184018, -0.2107966, 1, 1, 1, 1, 1,
-1.15194, -1.357257, -3.575493, 1, 1, 1, 1, 1,
-1.143767, -0.6899026, -2.008637, 1, 1, 1, 1, 1,
-1.136121, 1.70063, -0.7109608, 1, 1, 1, 1, 1,
-1.131767, 0.2721779, -0.8575454, 1, 1, 1, 1, 1,
-1.122704, 0.1172503, -1.221832, 1, 1, 1, 1, 1,
-1.117149, 0.4339022, 0.6141245, 1, 1, 1, 1, 1,
-1.116047, -0.2423452, -3.22349, 1, 1, 1, 1, 1,
-1.115774, -0.5506693, -0.7724856, 1, 1, 1, 1, 1,
-1.113262, 0.9163092, 0.740257, 0, 0, 1, 1, 1,
-1.11242, -0.493432, -1.422145, 1, 0, 0, 1, 1,
-1.110464, 0.08681242, -2.086501, 1, 0, 0, 1, 1,
-1.106128, -1.34976, -2.978889, 1, 0, 0, 1, 1,
-1.101993, -0.3963374, -1.040772, 1, 0, 0, 1, 1,
-1.092902, 0.7559948, -1.304995, 1, 0, 0, 1, 1,
-1.091843, -0.6083204, -2.608784, 0, 0, 0, 1, 1,
-1.090414, 1.735882, 1.23631, 0, 0, 0, 1, 1,
-1.089317, 0.1233565, -1.27594, 0, 0, 0, 1, 1,
-1.084872, 0.8946146, -1.317289, 0, 0, 0, 1, 1,
-1.079057, 0.2040489, -2.452152, 0, 0, 0, 1, 1,
-1.078468, 1.118953, -1.624608, 0, 0, 0, 1, 1,
-1.078395, 1.447938, 0.3939034, 0, 0, 0, 1, 1,
-1.068159, 0.5898355, -1.91919, 1, 1, 1, 1, 1,
-1.058797, 1.833667, -1.921135, 1, 1, 1, 1, 1,
-1.051631, 0.9449448, -1.583732, 1, 1, 1, 1, 1,
-1.051583, 1.625487, -0.4977248, 1, 1, 1, 1, 1,
-1.044536, 0.3117324, -1.393881, 1, 1, 1, 1, 1,
-1.04266, 1.221176, -1.282647, 1, 1, 1, 1, 1,
-1.041449, -0.3791108, -2.225954, 1, 1, 1, 1, 1,
-1.034593, -0.745643, -0.2576426, 1, 1, 1, 1, 1,
-1.028623, 0.147612, 0.05205413, 1, 1, 1, 1, 1,
-1.020449, 0.409492, -1.63555, 1, 1, 1, 1, 1,
-1.010477, -0.5618809, -0.09776685, 1, 1, 1, 1, 1,
-1.00814, 0.1899618, -1.299053, 1, 1, 1, 1, 1,
-1.003655, 0.9787515, -2.093689, 1, 1, 1, 1, 1,
-1.000486, -1.153143, -2.728253, 1, 1, 1, 1, 1,
-0.9947824, -0.3822095, -3.343357, 1, 1, 1, 1, 1,
-0.9924173, -0.1552065, -1.906041, 0, 0, 1, 1, 1,
-0.9851621, 1.209921, -4.110611, 1, 0, 0, 1, 1,
-0.9851205, 0.08663972, -1.385016, 1, 0, 0, 1, 1,
-0.9832799, 0.3044347, -1.803496, 1, 0, 0, 1, 1,
-0.9782368, 1.715506, 0.09321503, 1, 0, 0, 1, 1,
-0.9749193, -0.05918433, -2.066416, 1, 0, 0, 1, 1,
-0.968826, 0.3843224, -0.8943149, 0, 0, 0, 1, 1,
-0.9676855, -0.9372652, -2.16606, 0, 0, 0, 1, 1,
-0.9633685, -0.2798513, -0.8740715, 0, 0, 0, 1, 1,
-0.9574006, -1.6309, -2.892101, 0, 0, 0, 1, 1,
-0.9529303, -0.9252186, -4.224155, 0, 0, 0, 1, 1,
-0.9519179, 0.2322751, -0.92619, 0, 0, 0, 1, 1,
-0.9516881, -0.1044099, -1.981886, 0, 0, 0, 1, 1,
-0.9507839, 1.22288, 1.51918, 1, 1, 1, 1, 1,
-0.9481074, 0.03707616, -0.5048717, 1, 1, 1, 1, 1,
-0.9453878, 1.20771, -1.541877, 1, 1, 1, 1, 1,
-0.9448927, -0.1078135, -2.314696, 1, 1, 1, 1, 1,
-0.9442374, 0.2765502, -1.768126, 1, 1, 1, 1, 1,
-0.9428856, -0.6912231, -3.245383, 1, 1, 1, 1, 1,
-0.9378684, -0.07297111, 1.124135, 1, 1, 1, 1, 1,
-0.9363076, -0.3797979, -2.328373, 1, 1, 1, 1, 1,
-0.9354597, -0.1654352, -0.3135025, 1, 1, 1, 1, 1,
-0.9278541, -1.132417, -1.723209, 1, 1, 1, 1, 1,
-0.9237641, 0.1860836, -0.5028169, 1, 1, 1, 1, 1,
-0.9224243, -0.05768834, -1.578571, 1, 1, 1, 1, 1,
-0.9194893, -0.7955692, -2.878726, 1, 1, 1, 1, 1,
-0.9184988, -0.1582578, -0.9109669, 1, 1, 1, 1, 1,
-0.918192, -0.3939184, -0.3822644, 1, 1, 1, 1, 1,
-0.918023, 0.3444412, 0.825982, 0, 0, 1, 1, 1,
-0.9083077, 0.4023257, -1.397783, 1, 0, 0, 1, 1,
-0.9057529, 0.2233502, -2.146927, 1, 0, 0, 1, 1,
-0.9013939, 1.679513, -1.474862, 1, 0, 0, 1, 1,
-0.9011168, 0.2042632, -0.9157662, 1, 0, 0, 1, 1,
-0.8927647, 0.4263605, -0.1649433, 1, 0, 0, 1, 1,
-0.8878327, -0.202953, -2.74551, 0, 0, 0, 1, 1,
-0.8783483, -0.8716042, -1.967704, 0, 0, 0, 1, 1,
-0.8713682, 0.1990637, -2.54902, 0, 0, 0, 1, 1,
-0.870661, -1.934004, -3.23993, 0, 0, 0, 1, 1,
-0.8687696, -1.993245, -2.826385, 0, 0, 0, 1, 1,
-0.8559115, -0.5257424, -2.236045, 0, 0, 0, 1, 1,
-0.8534546, 1.828542, 0.8387901, 0, 0, 0, 1, 1,
-0.8523333, -0.2968388, -2.292282, 1, 1, 1, 1, 1,
-0.8512504, 0.109869, -1.195804, 1, 1, 1, 1, 1,
-0.8413618, -1.467416, -2.184792, 1, 1, 1, 1, 1,
-0.8396562, 0.04574633, -2.820268, 1, 1, 1, 1, 1,
-0.8375201, 1.582924, -1.410916, 1, 1, 1, 1, 1,
-0.8312746, -2.113696, -3.500436, 1, 1, 1, 1, 1,
-0.8302847, 0.3675179, -0.1312855, 1, 1, 1, 1, 1,
-0.8284019, -0.4272185, -2.271039, 1, 1, 1, 1, 1,
-0.8226165, -0.9929401, -2.916936, 1, 1, 1, 1, 1,
-0.8216701, -0.5466123, -2.082629, 1, 1, 1, 1, 1,
-0.8176593, -0.009282837, -2.920914, 1, 1, 1, 1, 1,
-0.8161136, 0.04623909, 1.194413, 1, 1, 1, 1, 1,
-0.8139197, -0.9156207, -2.67445, 1, 1, 1, 1, 1,
-0.8032904, 0.09791635, -0.01998708, 1, 1, 1, 1, 1,
-0.8029541, 1.671625, -1.695603, 1, 1, 1, 1, 1,
-0.8019246, -0.7441176, -1.625134, 0, 0, 1, 1, 1,
-0.7978634, -0.0901271, -1.450129, 1, 0, 0, 1, 1,
-0.7972752, 0.05261306, -1.127978, 1, 0, 0, 1, 1,
-0.7964078, 0.4411391, -1.221033, 1, 0, 0, 1, 1,
-0.7849166, -0.1724078, -2.850844, 1, 0, 0, 1, 1,
-0.7828621, -0.2095772, -1.815602, 1, 0, 0, 1, 1,
-0.7812397, 0.3974911, -0.8911676, 0, 0, 0, 1, 1,
-0.7768537, -1.634852, -3.764229, 0, 0, 0, 1, 1,
-0.7765945, 0.9711349, -0.1919972, 0, 0, 0, 1, 1,
-0.7740224, 0.1557246, -1.260072, 0, 0, 0, 1, 1,
-0.7724213, 0.2274076, 0.1006686, 0, 0, 0, 1, 1,
-0.7722828, -0.3649966, -4.062085, 0, 0, 0, 1, 1,
-0.7708634, 1.349394, -1.273357, 0, 0, 0, 1, 1,
-0.7686909, -0.7235552, -2.287061, 1, 1, 1, 1, 1,
-0.7577277, -0.2022182, -0.1424161, 1, 1, 1, 1, 1,
-0.7563246, -0.3686713, -1.689393, 1, 1, 1, 1, 1,
-0.7554033, 0.6324193, -0.3907111, 1, 1, 1, 1, 1,
-0.7511392, 0.5210348, -2.391504, 1, 1, 1, 1, 1,
-0.7466849, -0.5596091, -2.723236, 1, 1, 1, 1, 1,
-0.7343497, -1.878844, -3.115285, 1, 1, 1, 1, 1,
-0.7340828, 0.4912168, -1.724134, 1, 1, 1, 1, 1,
-0.7307604, 1.634553, -1.322193, 1, 1, 1, 1, 1,
-0.7283121, 0.7299055, -1.120908, 1, 1, 1, 1, 1,
-0.7224764, 1.186045, -1.477133, 1, 1, 1, 1, 1,
-0.7219275, -0.5838563, -2.966941, 1, 1, 1, 1, 1,
-0.7216473, -1.096629, -3.705962, 1, 1, 1, 1, 1,
-0.7211413, -1.926573, -2.045223, 1, 1, 1, 1, 1,
-0.7210553, 0.3586837, -3.352958, 1, 1, 1, 1, 1,
-0.7204802, -1.149137, -3.197835, 0, 0, 1, 1, 1,
-0.709419, -1.000825, -3.437824, 1, 0, 0, 1, 1,
-0.7091699, 1.40079, -0.8515394, 1, 0, 0, 1, 1,
-0.7088389, -1.109116, -2.840947, 1, 0, 0, 1, 1,
-0.7032972, 0.1099853, -2.153395, 1, 0, 0, 1, 1,
-0.6959558, 0.5987417, -1.625983, 1, 0, 0, 1, 1,
-0.6956202, 0.110385, -0.8263482, 0, 0, 0, 1, 1,
-0.6947904, -0.9800369, -2.861552, 0, 0, 0, 1, 1,
-0.6846321, 1.91986, -0.851324, 0, 0, 0, 1, 1,
-0.6837866, 0.1628735, -2.866808, 0, 0, 0, 1, 1,
-0.6777567, -0.7060852, -1.910378, 0, 0, 0, 1, 1,
-0.6772745, 1.641989, -1.908668, 0, 0, 0, 1, 1,
-0.6726153, 0.2282472, -2.242069, 0, 0, 0, 1, 1,
-0.6700664, 0.3591883, -1.419946, 1, 1, 1, 1, 1,
-0.6696434, -0.9446571, -0.5343722, 1, 1, 1, 1, 1,
-0.6684133, -0.5764688, -1.662691, 1, 1, 1, 1, 1,
-0.6572332, 1.594777, 0.1599349, 1, 1, 1, 1, 1,
-0.6525989, 0.2625481, 0.3896817, 1, 1, 1, 1, 1,
-0.6497555, -1.742367, -3.919645, 1, 1, 1, 1, 1,
-0.6442881, 0.5320616, -1.626497, 1, 1, 1, 1, 1,
-0.642655, 0.09168658, -0.9186707, 1, 1, 1, 1, 1,
-0.6409044, 0.5948883, -0.1544586, 1, 1, 1, 1, 1,
-0.622974, 0.3203617, -0.451928, 1, 1, 1, 1, 1,
-0.6161916, -0.4681516, -2.006514, 1, 1, 1, 1, 1,
-0.6152273, 0.9299755, -1.989116, 1, 1, 1, 1, 1,
-0.6134579, -0.9424318, -1.075962, 1, 1, 1, 1, 1,
-0.6124557, -0.1590111, -2.697217, 1, 1, 1, 1, 1,
-0.6099598, -0.3161381, -1.212423, 1, 1, 1, 1, 1,
-0.6007804, -0.3172371, -1.814034, 0, 0, 1, 1, 1,
-0.59693, -1.56037, -4.489488, 1, 0, 0, 1, 1,
-0.594699, -0.04255948, -3.458038, 1, 0, 0, 1, 1,
-0.591458, 0.3769388, -0.6132499, 1, 0, 0, 1, 1,
-0.5913328, 0.1333054, -3.266154, 1, 0, 0, 1, 1,
-0.5861136, 0.3782113, -2.585629, 1, 0, 0, 1, 1,
-0.5838188, -1.348616, -0.9416391, 0, 0, 0, 1, 1,
-0.5824245, -2.648119, -1.647225, 0, 0, 0, 1, 1,
-0.5761484, -0.9285365, -4.261016, 0, 0, 0, 1, 1,
-0.5695198, -1.257405, -2.609818, 0, 0, 0, 1, 1,
-0.5650531, 2.185591, 1.515117, 0, 0, 0, 1, 1,
-0.5644941, 1.351183, -1.208594, 0, 0, 0, 1, 1,
-0.5598961, 0.6097969, -3.016541, 0, 0, 0, 1, 1,
-0.5534455, -1.139119, -3.001166, 1, 1, 1, 1, 1,
-0.5534333, 0.5007144, -0.606747, 1, 1, 1, 1, 1,
-0.5524135, 0.7232512, -1.192261, 1, 1, 1, 1, 1,
-0.541767, -0.3730511, -1.890128, 1, 1, 1, 1, 1,
-0.5364682, 1.374735, -0.9127589, 1, 1, 1, 1, 1,
-0.5316843, 0.350128, -0.822583, 1, 1, 1, 1, 1,
-0.5263108, 0.09260307, -2.68698, 1, 1, 1, 1, 1,
-0.5183513, -0.6230963, -1.985893, 1, 1, 1, 1, 1,
-0.5151499, 0.05682967, -0.6558499, 1, 1, 1, 1, 1,
-0.5108741, 1.567303, 0.4359828, 1, 1, 1, 1, 1,
-0.5105148, -0.5447836, -3.68803, 1, 1, 1, 1, 1,
-0.5091282, 0.3520424, -1.503657, 1, 1, 1, 1, 1,
-0.504415, -0.1482766, -1.771115, 1, 1, 1, 1, 1,
-0.5000536, 1.210374, -0.7400166, 1, 1, 1, 1, 1,
-0.4995122, -0.1149482, -1.001526, 1, 1, 1, 1, 1,
-0.499227, 0.1082789, -0.2448977, 0, 0, 1, 1, 1,
-0.495339, 1.043982, -1.638629, 1, 0, 0, 1, 1,
-0.4907758, 2.242088, -0.7603868, 1, 0, 0, 1, 1,
-0.489883, 0.615369, -0.5564542, 1, 0, 0, 1, 1,
-0.4876923, 1.583617, 0.4279829, 1, 0, 0, 1, 1,
-0.4865817, -0.1294102, -2.024576, 1, 0, 0, 1, 1,
-0.4857964, -0.5147508, -0.7269079, 0, 0, 0, 1, 1,
-0.4838172, 0.789618, -0.08245257, 0, 0, 0, 1, 1,
-0.4832679, 0.524331, 0.16689, 0, 0, 0, 1, 1,
-0.4831566, -0.8261626, -1.410974, 0, 0, 0, 1, 1,
-0.4799722, 0.0491641, -2.538026, 0, 0, 0, 1, 1,
-0.4782917, -0.3010603, -1.529801, 0, 0, 0, 1, 1,
-0.4777492, 0.6509142, -2.638046, 0, 0, 0, 1, 1,
-0.4768113, -0.2058797, -2.679526, 1, 1, 1, 1, 1,
-0.473526, -0.9734597, -2.631945, 1, 1, 1, 1, 1,
-0.4720981, -0.5430371, -1.32451, 1, 1, 1, 1, 1,
-0.46698, -0.3273771, -1.152305, 1, 1, 1, 1, 1,
-0.460261, -0.8592473, -1.316533, 1, 1, 1, 1, 1,
-0.4509332, 0.4866453, -0.6393306, 1, 1, 1, 1, 1,
-0.4498105, -1.664298, -2.619122, 1, 1, 1, 1, 1,
-0.4472471, -2.051103, -2.655043, 1, 1, 1, 1, 1,
-0.4410821, -0.1094349, -2.958645, 1, 1, 1, 1, 1,
-0.4399419, 0.8987076, -0.9464009, 1, 1, 1, 1, 1,
-0.4309129, -0.2021313, -0.08416724, 1, 1, 1, 1, 1,
-0.4242307, 0.2168753, -2.013979, 1, 1, 1, 1, 1,
-0.4238795, 0.6482811, 1.21925, 1, 1, 1, 1, 1,
-0.4226492, 0.4689983, -0.1746912, 1, 1, 1, 1, 1,
-0.4188327, 1.300551, 0.4251366, 1, 1, 1, 1, 1,
-0.4170833, -2.192716, -3.27594, 0, 0, 1, 1, 1,
-0.4159078, -1.275921, -3.528717, 1, 0, 0, 1, 1,
-0.4143969, 0.8154472, -1.696677, 1, 0, 0, 1, 1,
-0.4105923, 1.248724, 0.6121852, 1, 0, 0, 1, 1,
-0.4098772, 0.02336197, -1.022681, 1, 0, 0, 1, 1,
-0.4069912, 0.60089, 0.5049188, 1, 0, 0, 1, 1,
-0.4051397, -0.3256712, -2.470736, 0, 0, 0, 1, 1,
-0.405097, -0.06829695, -1.237158, 0, 0, 0, 1, 1,
-0.4027139, 1.550431, 0.3922923, 0, 0, 0, 1, 1,
-0.3958379, 0.3390426, -2.597754, 0, 0, 0, 1, 1,
-0.3891405, 0.3844762, -0.5845084, 0, 0, 0, 1, 1,
-0.3876877, -0.7927803, -2.2727, 0, 0, 0, 1, 1,
-0.3732866, 0.267199, 1.286732, 0, 0, 0, 1, 1,
-0.372442, 0.07154547, 0.9327247, 1, 1, 1, 1, 1,
-0.3645717, -0.5114669, -4.043938, 1, 1, 1, 1, 1,
-0.3620706, -1.826381, -4.221799, 1, 1, 1, 1, 1,
-0.3605937, -0.3656526, -1.364325, 1, 1, 1, 1, 1,
-0.3598783, -1.594636, -1.555452, 1, 1, 1, 1, 1,
-0.3587889, 0.6998125, -2.891712, 1, 1, 1, 1, 1,
-0.3514877, -0.3669696, -3.178343, 1, 1, 1, 1, 1,
-0.3498643, 0.6385313, -2.300223, 1, 1, 1, 1, 1,
-0.3445358, 0.5227849, -1.602371, 1, 1, 1, 1, 1,
-0.3412668, 0.6326411, -0.583295, 1, 1, 1, 1, 1,
-0.3376307, 1.072765, 0.7697123, 1, 1, 1, 1, 1,
-0.3366247, 0.2200967, -0.5018173, 1, 1, 1, 1, 1,
-0.3359937, -0.4384468, -1.083253, 1, 1, 1, 1, 1,
-0.3296095, -0.590821, -2.376109, 1, 1, 1, 1, 1,
-0.3292384, -0.8030679, -4.296191, 1, 1, 1, 1, 1,
-0.3244188, 0.7619094, 0.1352361, 0, 0, 1, 1, 1,
-0.3232909, 0.4351581, -0.7687017, 1, 0, 0, 1, 1,
-0.323228, -1.122192, -2.249966, 1, 0, 0, 1, 1,
-0.3209409, 1.28135, -1.550445, 1, 0, 0, 1, 1,
-0.3202333, -1.702568, -2.290282, 1, 0, 0, 1, 1,
-0.3201468, 0.6988652, 0.4331425, 1, 0, 0, 1, 1,
-0.3190922, -0.438906, -2.928333, 0, 0, 0, 1, 1,
-0.3190493, 0.3661849, -1.101908, 0, 0, 0, 1, 1,
-0.3143992, -0.3534119, -3.917567, 0, 0, 0, 1, 1,
-0.3069722, -0.215004, -2.29422, 0, 0, 0, 1, 1,
-0.3038145, -0.03987278, -0.3866038, 0, 0, 0, 1, 1,
-0.2972715, -1.276963, -3.123698, 0, 0, 0, 1, 1,
-0.2972403, 0.1403774, -1.897708, 0, 0, 0, 1, 1,
-0.2932101, -0.7501327, -3.447872, 1, 1, 1, 1, 1,
-0.2925273, -0.1145162, -3.164489, 1, 1, 1, 1, 1,
-0.2909654, -1.113258, -2.035355, 1, 1, 1, 1, 1,
-0.2898723, -1.35276, -2.352034, 1, 1, 1, 1, 1,
-0.2879013, -0.8089451, -3.811862, 1, 1, 1, 1, 1,
-0.2828213, 1.039578, 0.3096122, 1, 1, 1, 1, 1,
-0.2817626, -0.6682932, -2.858732, 1, 1, 1, 1, 1,
-0.2789967, 0.5024143, -0.07836955, 1, 1, 1, 1, 1,
-0.2788697, 0.170278, 0.4990223, 1, 1, 1, 1, 1,
-0.2654756, -0.2760451, -3.271011, 1, 1, 1, 1, 1,
-0.2616702, 0.755541, -1.650394, 1, 1, 1, 1, 1,
-0.260145, 0.6815703, 0.001781236, 1, 1, 1, 1, 1,
-0.2597312, 0.1976101, -1.028892, 1, 1, 1, 1, 1,
-0.2539711, -1.39177, -3.345989, 1, 1, 1, 1, 1,
-0.251787, 0.321337, -0.3072019, 1, 1, 1, 1, 1,
-0.2457323, -1.469088, -3.46298, 0, 0, 1, 1, 1,
-0.2434722, -0.4939721, -2.38565, 1, 0, 0, 1, 1,
-0.2424887, 0.120745, -0.7068342, 1, 0, 0, 1, 1,
-0.2389417, -0.7705396, -2.481553, 1, 0, 0, 1, 1,
-0.2357344, -1.959117, -4.369822, 1, 0, 0, 1, 1,
-0.2343096, -1.16318, -2.520249, 1, 0, 0, 1, 1,
-0.2339681, 2.393227, 0.1616524, 0, 0, 0, 1, 1,
-0.2316234, -0.08605731, -2.996377, 0, 0, 0, 1, 1,
-0.2314332, 1.888227, -1.107436, 0, 0, 0, 1, 1,
-0.2311177, 1.04828, 0.3757209, 0, 0, 0, 1, 1,
-0.2258916, 1.410088, 0.3826345, 0, 0, 0, 1, 1,
-0.2231797, -0.7393218, -2.581451, 0, 0, 0, 1, 1,
-0.2208347, 0.9278563, -1.473781, 0, 0, 0, 1, 1,
-0.214053, -0.001300149, -1.117618, 1, 1, 1, 1, 1,
-0.2044513, 0.5396597, -0.9272982, 1, 1, 1, 1, 1,
-0.2042209, -0.2068292, -1.170205, 1, 1, 1, 1, 1,
-0.2029683, -0.1248499, -2.721316, 1, 1, 1, 1, 1,
-0.19571, -0.4634132, -0.8719944, 1, 1, 1, 1, 1,
-0.1953238, 0.5496098, -1.128402, 1, 1, 1, 1, 1,
-0.1932674, 0.2871022, -1.0603, 1, 1, 1, 1, 1,
-0.1930809, 1.644844, -1.923404, 1, 1, 1, 1, 1,
-0.1930725, 0.9759313, 0.9656238, 1, 1, 1, 1, 1,
-0.191109, -0.4797053, -2.26369, 1, 1, 1, 1, 1,
-0.1893495, -0.3999466, -2.407362, 1, 1, 1, 1, 1,
-0.185635, -0.0007648649, 0.760024, 1, 1, 1, 1, 1,
-0.1828863, 0.6294342, -1.172008, 1, 1, 1, 1, 1,
-0.1775849, 2.626256, -0.2500334, 1, 1, 1, 1, 1,
-0.1763874, 0.1513031, 2.061765, 1, 1, 1, 1, 1,
-0.1719992, 1.297476, -0.2774912, 0, 0, 1, 1, 1,
-0.1706207, -0.02945798, -1.754727, 1, 0, 0, 1, 1,
-0.1656162, 0.2217089, 0.1505488, 1, 0, 0, 1, 1,
-0.1653663, 1.522557, -0.2284308, 1, 0, 0, 1, 1,
-0.1639638, -0.2985592, -2.024364, 1, 0, 0, 1, 1,
-0.1631883, -1.370579, -3.260879, 1, 0, 0, 1, 1,
-0.1561055, 0.7466293, -0.776962, 0, 0, 0, 1, 1,
-0.1557848, 0.1350671, -1.138495, 0, 0, 0, 1, 1,
-0.1554049, -1.624273, -4.765592, 0, 0, 0, 1, 1,
-0.1547268, 2.357485, 1.147053, 0, 0, 0, 1, 1,
-0.1504605, 0.9301831, 1.077657, 0, 0, 0, 1, 1,
-0.1461446, 1.829537, -0.05513214, 0, 0, 0, 1, 1,
-0.1444012, -0.04655203, -2.150016, 0, 0, 0, 1, 1,
-0.1443327, 0.5809938, 0.6821563, 1, 1, 1, 1, 1,
-0.1432068, -0.1582125, -1.435476, 1, 1, 1, 1, 1,
-0.141382, -1.070249, -2.622645, 1, 1, 1, 1, 1,
-0.141293, 1.404654, -0.2096562, 1, 1, 1, 1, 1,
-0.1398794, -0.8855265, -3.685582, 1, 1, 1, 1, 1,
-0.1379715, -0.4752351, -2.244238, 1, 1, 1, 1, 1,
-0.1342933, -0.01025914, 0.0227654, 1, 1, 1, 1, 1,
-0.1327017, 0.1051237, -2.44382, 1, 1, 1, 1, 1,
-0.1320858, -0.3078479, -2.113147, 1, 1, 1, 1, 1,
-0.130981, -0.3140068, -2.492169, 1, 1, 1, 1, 1,
-0.1287836, 1.128287, 0.02627627, 1, 1, 1, 1, 1,
-0.1206075, 0.416508, 0.771512, 1, 1, 1, 1, 1,
-0.1160674, -0.2345231, -4.122249, 1, 1, 1, 1, 1,
-0.1140059, 0.977846, 0.4929606, 1, 1, 1, 1, 1,
-0.1113643, 0.2117042, -0.4812617, 1, 1, 1, 1, 1,
-0.1111152, 1.084809, 0.7781538, 0, 0, 1, 1, 1,
-0.1105607, 1.357837, 0.1626082, 1, 0, 0, 1, 1,
-0.1054848, -1.474445, -1.89279, 1, 0, 0, 1, 1,
-0.1052915, -1.108372, -3.812496, 1, 0, 0, 1, 1,
-0.1013993, -0.1943757, -3.720826, 1, 0, 0, 1, 1,
-0.09904909, -0.8820332, -3.336369, 1, 0, 0, 1, 1,
-0.09749731, 1.223366, -0.07169364, 0, 0, 0, 1, 1,
-0.09382418, 2.12903, 0.05078984, 0, 0, 0, 1, 1,
-0.09379687, 0.7436364, -0.02915727, 0, 0, 0, 1, 1,
-0.09351958, -1.880844, -4.055663, 0, 0, 0, 1, 1,
-0.08793788, -0.2226822, -1.426334, 0, 0, 0, 1, 1,
-0.08308336, 1.899885, -1.310729, 0, 0, 0, 1, 1,
-0.08196525, -0.1234549, -2.451368, 0, 0, 0, 1, 1,
-0.0783951, -0.5639439, -2.932145, 1, 1, 1, 1, 1,
-0.07397499, -1.817138, -3.713548, 1, 1, 1, 1, 1,
-0.07276635, 0.01886443, -1.402479, 1, 1, 1, 1, 1,
-0.07133091, -1.236143, -2.80909, 1, 1, 1, 1, 1,
-0.06794073, -0.03615337, -1.696196, 1, 1, 1, 1, 1,
-0.06761534, 0.5310695, 0.6082081, 1, 1, 1, 1, 1,
-0.05968256, 0.3974429, 0.1731742, 1, 1, 1, 1, 1,
-0.055229, 0.1004676, -1.446303, 1, 1, 1, 1, 1,
-0.05455356, 1.921828, 0.2111026, 1, 1, 1, 1, 1,
-0.05344791, -0.7128752, -1.929383, 1, 1, 1, 1, 1,
-0.04939073, -0.7725253, -2.04573, 1, 1, 1, 1, 1,
-0.04761437, 2.647541, 0.08723996, 1, 1, 1, 1, 1,
-0.04496901, -0.8822831, -2.400245, 1, 1, 1, 1, 1,
-0.04157019, -0.1511949, -2.199993, 1, 1, 1, 1, 1,
-0.04131897, -0.0310829, -1.553048, 1, 1, 1, 1, 1,
-0.0395748, 3.270324, 0.4381554, 0, 0, 1, 1, 1,
-0.03672115, 1.255432, -0.4777724, 1, 0, 0, 1, 1,
-0.03617106, -0.1942288, -1.961041, 1, 0, 0, 1, 1,
-0.03172553, -0.9914, -3.85557, 1, 0, 0, 1, 1,
-0.02933501, -1.523586, -2.35199, 1, 0, 0, 1, 1,
-0.02799661, -0.007268426, -2.322711, 1, 0, 0, 1, 1,
-0.02688516, 0.2539526, 1.218444, 0, 0, 0, 1, 1,
-0.02421418, -0.4868617, -3.286767, 0, 0, 0, 1, 1,
-0.02307588, -0.1338687, -3.027794, 0, 0, 0, 1, 1,
-0.02145559, -0.9260294, -3.291935, 0, 0, 0, 1, 1,
-0.01877851, -0.3612964, -4.016078, 0, 0, 0, 1, 1,
-0.01756794, 0.4766814, -0.749974, 0, 0, 0, 1, 1,
-0.01746052, 0.1604074, -0.08135661, 0, 0, 0, 1, 1,
-0.01512958, -0.04488783, -2.849209, 1, 1, 1, 1, 1,
-0.01504758, 0.09744881, -0.4419141, 1, 1, 1, 1, 1,
-0.01048325, 0.4230658, 0.2050704, 1, 1, 1, 1, 1,
-0.009412585, -0.8763545, -5.436012, 1, 1, 1, 1, 1,
-0.006288329, 0.5884498, -0.7919492, 1, 1, 1, 1, 1,
-0.004715049, -1.762454, -4.072737, 1, 1, 1, 1, 1,
0.000872927, 0.4304171, 1.417369, 1, 1, 1, 1, 1,
0.007885029, -1.238837, 2.741108, 1, 1, 1, 1, 1,
0.01241123, -2.068967, 3.503134, 1, 1, 1, 1, 1,
0.01480599, -0.8224916, 3.611762, 1, 1, 1, 1, 1,
0.01500989, -1.658081, 1.092462, 1, 1, 1, 1, 1,
0.01695017, 0.6828476, 0.8494939, 1, 1, 1, 1, 1,
0.01770831, 0.1938337, 0.4470667, 1, 1, 1, 1, 1,
0.02395255, -0.6242388, 3.943288, 1, 1, 1, 1, 1,
0.0250789, 0.1061767, 0.7995649, 1, 1, 1, 1, 1,
0.02684709, -2.191278, 3.005981, 0, 0, 1, 1, 1,
0.02923909, 2.361345, -0.3241853, 1, 0, 0, 1, 1,
0.03100997, -1.014823, 3.732937, 1, 0, 0, 1, 1,
0.03327007, 0.6902677, -0.2882846, 1, 0, 0, 1, 1,
0.03340205, -0.09570604, 5.088762, 1, 0, 0, 1, 1,
0.03341913, -0.6237823, 3.657636, 1, 0, 0, 1, 1,
0.03361977, -1.050695, 2.96659, 0, 0, 0, 1, 1,
0.0363954, -0.4069586, 3.993415, 0, 0, 0, 1, 1,
0.04236495, 1.875542, 0.2357723, 0, 0, 0, 1, 1,
0.0433724, -1.668851, 2.322998, 0, 0, 0, 1, 1,
0.04343018, 0.326645, -0.0007381382, 0, 0, 0, 1, 1,
0.04381743, -0.5499829, 2.555193, 0, 0, 0, 1, 1,
0.04547179, -1.517969, 1.289513, 0, 0, 0, 1, 1,
0.04821275, -1.055377, 4.45465, 1, 1, 1, 1, 1,
0.04859633, -1.009125, 3.198555, 1, 1, 1, 1, 1,
0.05199668, 0.1047291, 0.1009322, 1, 1, 1, 1, 1,
0.0521627, -0.02478904, 2.086393, 1, 1, 1, 1, 1,
0.0586013, -0.7256865, 1.500874, 1, 1, 1, 1, 1,
0.05997654, 0.5898573, 0.1182412, 1, 1, 1, 1, 1,
0.06028543, -0.8486783, 3.388749, 1, 1, 1, 1, 1,
0.06245155, -2.042008, 1.552453, 1, 1, 1, 1, 1,
0.06700501, -1.500911, 2.818196, 1, 1, 1, 1, 1,
0.06844512, 0.1378786, 1.013467, 1, 1, 1, 1, 1,
0.07028795, 0.9071532, 0.06407318, 1, 1, 1, 1, 1,
0.07058242, -0.454457, 3.6453, 1, 1, 1, 1, 1,
0.07154716, 1.307869, 0.08164991, 1, 1, 1, 1, 1,
0.07280184, 2.025498, -0.9266153, 1, 1, 1, 1, 1,
0.07403522, 0.1699177, -0.6146707, 1, 1, 1, 1, 1,
0.0754145, -0.7791944, 2.065813, 0, 0, 1, 1, 1,
0.08091345, -0.1451094, 3.307933, 1, 0, 0, 1, 1,
0.09549136, -0.08328979, 3.253102, 1, 0, 0, 1, 1,
0.1040463, 0.3240102, 1.877518, 1, 0, 0, 1, 1,
0.1040467, -0.00232163, 1.759563, 1, 0, 0, 1, 1,
0.1043289, -1.377394, 3.415341, 1, 0, 0, 1, 1,
0.1092607, -1.550943, 4.615068, 0, 0, 0, 1, 1,
0.1094647, 0.8808104, 0.6018528, 0, 0, 0, 1, 1,
0.1097836, 0.3677905, -0.8861888, 0, 0, 0, 1, 1,
0.1102237, -1.236074, 2.503659, 0, 0, 0, 1, 1,
0.1109295, -0.9921255, 2.940023, 0, 0, 0, 1, 1,
0.1113011, 0.5148933, -0.2527078, 0, 0, 0, 1, 1,
0.1117842, 0.3504698, -0.1247087, 0, 0, 0, 1, 1,
0.1154039, -0.6736075, 3.167333, 1, 1, 1, 1, 1,
0.1191465, 0.3056963, 0.06819149, 1, 1, 1, 1, 1,
0.1201824, -1.464697, 3.999361, 1, 1, 1, 1, 1,
0.124821, -0.03379801, 0.3801009, 1, 1, 1, 1, 1,
0.1271468, -0.7849533, 3.592209, 1, 1, 1, 1, 1,
0.1286161, -0.02573125, 1.518131, 1, 1, 1, 1, 1,
0.1305212, -0.9311197, 2.471205, 1, 1, 1, 1, 1,
0.1317124, -0.07028527, 3.451795, 1, 1, 1, 1, 1,
0.1317291, 1.966987, -0.248296, 1, 1, 1, 1, 1,
0.1321334, 0.6831633, 0.5084789, 1, 1, 1, 1, 1,
0.1335069, 0.04653723, 1.354221, 1, 1, 1, 1, 1,
0.1336226, 0.4276972, -0.4710467, 1, 1, 1, 1, 1,
0.1353519, 1.314038, 1.533478, 1, 1, 1, 1, 1,
0.1369858, -0.5258257, 3.335246, 1, 1, 1, 1, 1,
0.1374082, 1.353421, -2.074907, 1, 1, 1, 1, 1,
0.1421437, -0.0369375, 3.294993, 0, 0, 1, 1, 1,
0.1441889, -0.1132855, 2.927557, 1, 0, 0, 1, 1,
0.146557, 0.5515289, 0.7393516, 1, 0, 0, 1, 1,
0.1465786, 0.1734182, 1.287019, 1, 0, 0, 1, 1,
0.1483105, 0.2552752, -0.1279366, 1, 0, 0, 1, 1,
0.1527404, 1.514694, 0.9274902, 1, 0, 0, 1, 1,
0.1684094, 1.808662, 1.612563, 0, 0, 0, 1, 1,
0.1688737, 0.6248831, -0.3314666, 0, 0, 0, 1, 1,
0.1705971, 0.6009449, -1.515187, 0, 0, 0, 1, 1,
0.1742295, -1.086572, 2.407208, 0, 0, 0, 1, 1,
0.182073, -0.642061, 2.351036, 0, 0, 0, 1, 1,
0.1822643, -0.571417, 2.374605, 0, 0, 0, 1, 1,
0.1822951, 0.4293911, 2.28593, 0, 0, 0, 1, 1,
0.1836135, 1.277741, -1.832987, 1, 1, 1, 1, 1,
0.1870961, -0.4889568, 2.845823, 1, 1, 1, 1, 1,
0.1899406, -0.04552338, 2.717375, 1, 1, 1, 1, 1,
0.1907438, 0.1092512, 1.591441, 1, 1, 1, 1, 1,
0.190964, 1.694526, -1.641093, 1, 1, 1, 1, 1,
0.194352, 1.986042, 1.068154, 1, 1, 1, 1, 1,
0.1945274, -1.202346, 4.53064, 1, 1, 1, 1, 1,
0.1994576, 0.7244278, -1.394892, 1, 1, 1, 1, 1,
0.2062181, 0.7849891, -0.7391273, 1, 1, 1, 1, 1,
0.2069796, 1.582665, -0.1959118, 1, 1, 1, 1, 1,
0.2076775, 1.177997, -1.783648, 1, 1, 1, 1, 1,
0.2142849, -1.649364, 1.060681, 1, 1, 1, 1, 1,
0.2144601, 0.6158625, 0.543035, 1, 1, 1, 1, 1,
0.2147726, 1.853358, 1.280285, 1, 1, 1, 1, 1,
0.2163269, -0.02604275, 3.583525, 1, 1, 1, 1, 1,
0.2184234, -0.2043103, 2.368597, 0, 0, 1, 1, 1,
0.2184521, -2.775538, 2.607602, 1, 0, 0, 1, 1,
0.2195473, 0.3435578, 0.3938522, 1, 0, 0, 1, 1,
0.2239768, 1.563519, -1.939842, 1, 0, 0, 1, 1,
0.2327855, -0.7418811, 4.146106, 1, 0, 0, 1, 1,
0.2350979, 0.1589014, -0.1911757, 1, 0, 0, 1, 1,
0.2355727, -0.2824869, 1.242068, 0, 0, 0, 1, 1,
0.236101, 0.92508, -0.7250176, 0, 0, 0, 1, 1,
0.2395561, -0.2475249, 2.952399, 0, 0, 0, 1, 1,
0.2414027, -1.219265, 1.283742, 0, 0, 0, 1, 1,
0.2414804, -0.5802863, 2.325591, 0, 0, 0, 1, 1,
0.2427843, -0.25221, 2.1668, 0, 0, 0, 1, 1,
0.246693, 0.705052, -0.7574971, 0, 0, 0, 1, 1,
0.2476433, 2.408305, -0.7055351, 1, 1, 1, 1, 1,
0.2476609, -1.215567, 3.102665, 1, 1, 1, 1, 1,
0.2552897, -1.487452, 3.829527, 1, 1, 1, 1, 1,
0.2562464, 0.8457178, 0.66123, 1, 1, 1, 1, 1,
0.2576164, -0.2643352, 2.447848, 1, 1, 1, 1, 1,
0.264542, -0.3331275, 2.399546, 1, 1, 1, 1, 1,
0.2649553, -1.113655, 2.289681, 1, 1, 1, 1, 1,
0.2652271, -0.4782473, 3.21264, 1, 1, 1, 1, 1,
0.2668477, -1.394488, 4.520414, 1, 1, 1, 1, 1,
0.2684623, 0.9078583, 1.590008, 1, 1, 1, 1, 1,
0.2696838, 0.2461169, 1.785165, 1, 1, 1, 1, 1,
0.2735579, -1.583361, 1.703865, 1, 1, 1, 1, 1,
0.2758946, -1.346377, 3.104294, 1, 1, 1, 1, 1,
0.2762897, 2.367166, -1.45119, 1, 1, 1, 1, 1,
0.2785365, -1.441991, 4.382069, 1, 1, 1, 1, 1,
0.2786328, 0.4246577, 0.5458986, 0, 0, 1, 1, 1,
0.2794819, 1.050096, 1.119691, 1, 0, 0, 1, 1,
0.2804969, 1.450369, -0.1228832, 1, 0, 0, 1, 1,
0.2869355, 0.163501, 1.785829, 1, 0, 0, 1, 1,
0.2912956, -1.124504, 3.90987, 1, 0, 0, 1, 1,
0.293283, 1.133852, 1.202027, 1, 0, 0, 1, 1,
0.2937935, 1.757238, -0.4789509, 0, 0, 0, 1, 1,
0.2964052, -0.79298, 2.143939, 0, 0, 0, 1, 1,
0.297549, -0.09945365, 2.285227, 0, 0, 0, 1, 1,
0.2980668, 1.339309, 0.1758319, 0, 0, 0, 1, 1,
0.3020755, -0.946535, 3.208292, 0, 0, 0, 1, 1,
0.304126, 1.08561, -0.5156291, 0, 0, 0, 1, 1,
0.3064381, 1.386879, -0.9626608, 0, 0, 0, 1, 1,
0.3087672, 0.1177184, 0.5583563, 1, 1, 1, 1, 1,
0.308935, 0.557401, 0.3955204, 1, 1, 1, 1, 1,
0.3100922, 1.685688, 1.937115, 1, 1, 1, 1, 1,
0.3106583, 0.3360586, 1.964944, 1, 1, 1, 1, 1,
0.3161802, 0.6313999, 1.427677, 1, 1, 1, 1, 1,
0.3178482, -0.01781863, 0.8778377, 1, 1, 1, 1, 1,
0.3260732, 0.1643481, 2.11774, 1, 1, 1, 1, 1,
0.3277221, -1.038445, 3.08175, 1, 1, 1, 1, 1,
0.3282684, -2.766927, 3.992733, 1, 1, 1, 1, 1,
0.3304251, 0.2985473, -0.8079864, 1, 1, 1, 1, 1,
0.3359331, 0.2193347, 1.024411, 1, 1, 1, 1, 1,
0.3398196, -0.4493455, 0.7377496, 1, 1, 1, 1, 1,
0.345037, -0.1532033, 2.474768, 1, 1, 1, 1, 1,
0.3485781, -0.8358492, 2.898439, 1, 1, 1, 1, 1,
0.3501025, -0.6279987, 4.049575, 1, 1, 1, 1, 1,
0.3541461, -0.6749354, 0.7552456, 0, 0, 1, 1, 1,
0.3550446, 0.554545, 1.594619, 1, 0, 0, 1, 1,
0.358444, -0.2362391, 1.302733, 1, 0, 0, 1, 1,
0.3596762, 0.138642, 0.8921488, 1, 0, 0, 1, 1,
0.3614212, 0.1515712, 1.862637, 1, 0, 0, 1, 1,
0.3640306, 1.608565, 0.0495869, 1, 0, 0, 1, 1,
0.3645119, -0.8211588, 0.4709637, 0, 0, 0, 1, 1,
0.369104, 0.2974092, 0.8453199, 0, 0, 0, 1, 1,
0.3698904, -0.8568269, 1.800629, 0, 0, 0, 1, 1,
0.3704696, -1.024157, 1.550781, 0, 0, 0, 1, 1,
0.3719492, -1.476701, 0.9136236, 0, 0, 0, 1, 1,
0.37473, -2.451997, 3.02311, 0, 0, 0, 1, 1,
0.3756699, 1.369009, 0.6303933, 0, 0, 0, 1, 1,
0.3773012, 0.1648383, 1.612503, 1, 1, 1, 1, 1,
0.3773355, 0.9233983, 0.01850771, 1, 1, 1, 1, 1,
0.3778581, 0.8615491, 0.2282514, 1, 1, 1, 1, 1,
0.3798557, 0.02990291, 2.414627, 1, 1, 1, 1, 1,
0.3847566, 0.7158528, 0.3101786, 1, 1, 1, 1, 1,
0.3864896, -0.7535315, 2.850083, 1, 1, 1, 1, 1,
0.3877014, 1.207006, -0.1520824, 1, 1, 1, 1, 1,
0.3880506, -1.52396, 3.672825, 1, 1, 1, 1, 1,
0.3887269, 0.06903198, 2.675772, 1, 1, 1, 1, 1,
0.3914953, -0.530319, 2.820084, 1, 1, 1, 1, 1,
0.3925453, -0.1364487, 2.846236, 1, 1, 1, 1, 1,
0.3927124, -0.1722273, 1.763131, 1, 1, 1, 1, 1,
0.395807, 1.017845, 0.1610749, 1, 1, 1, 1, 1,
0.3998617, -0.9305624, 3.295507, 1, 1, 1, 1, 1,
0.4003359, 0.1272322, 2.49139, 1, 1, 1, 1, 1,
0.4035014, -1.450468, 2.979728, 0, 0, 1, 1, 1,
0.4036507, 1.126674, -1.450593, 1, 0, 0, 1, 1,
0.4078011, -1.750835, 2.378507, 1, 0, 0, 1, 1,
0.4130423, -1.058181, 4.195393, 1, 0, 0, 1, 1,
0.4153067, -0.9900634, 2.536308, 1, 0, 0, 1, 1,
0.4175428, -0.936055, 2.283592, 1, 0, 0, 1, 1,
0.4176084, -1.054191, 2.522999, 0, 0, 0, 1, 1,
0.4226081, 1.316224, 0.9636964, 0, 0, 0, 1, 1,
0.4239776, -0.5202764, 4.644573, 0, 0, 0, 1, 1,
0.42523, -1.917678, 2.905904, 0, 0, 0, 1, 1,
0.42557, 1.474546, -1.403877, 0, 0, 0, 1, 1,
0.431953, 2.229587, -0.8737895, 0, 0, 0, 1, 1,
0.4319681, 0.6018109, 1.447623, 0, 0, 0, 1, 1,
0.4320156, -0.09146798, 3.031645, 1, 1, 1, 1, 1,
0.4348335, -1.717109, 2.901988, 1, 1, 1, 1, 1,
0.4402822, 0.4063067, 0.9692706, 1, 1, 1, 1, 1,
0.4410999, -0.6004723, 3.272157, 1, 1, 1, 1, 1,
0.4424039, -0.6979474, 1.271248, 1, 1, 1, 1, 1,
0.4436711, 1.872576, -0.9630316, 1, 1, 1, 1, 1,
0.4454656, 0.6308385, 2.328948, 1, 1, 1, 1, 1,
0.4473173, 1.142012, -0.3229811, 1, 1, 1, 1, 1,
0.4488144, 0.1517653, 1.27212, 1, 1, 1, 1, 1,
0.4558428, 0.5607008, 0.9193673, 1, 1, 1, 1, 1,
0.4614016, -0.1378096, 1.772667, 1, 1, 1, 1, 1,
0.4615769, 1.646812, 1.250747, 1, 1, 1, 1, 1,
0.4623031, 0.7389986, -1.051075, 1, 1, 1, 1, 1,
0.4623332, -0.2903484, 4.03677, 1, 1, 1, 1, 1,
0.4623958, -1.537347, 2.868039, 1, 1, 1, 1, 1,
0.4674653, -0.4980387, 3.993729, 0, 0, 1, 1, 1,
0.4685717, 0.4147504, 0.7479062, 1, 0, 0, 1, 1,
0.4689848, -0.5980329, 3.901093, 1, 0, 0, 1, 1,
0.4701101, 0.8570266, 0.5002234, 1, 0, 0, 1, 1,
0.4747517, 0.5240268, 1.978786, 1, 0, 0, 1, 1,
0.4755962, 0.3242938, 0.2064425, 1, 0, 0, 1, 1,
0.4764735, -0.9923182, 3.026214, 0, 0, 0, 1, 1,
0.4807051, -0.0619255, 0.9274247, 0, 0, 0, 1, 1,
0.4813424, -0.8480376, 2.844676, 0, 0, 0, 1, 1,
0.4851478, 0.4753858, 0.9950559, 0, 0, 0, 1, 1,
0.4895681, -1.019831, 4.813287, 0, 0, 0, 1, 1,
0.4934368, 1.622156, -0.2898889, 0, 0, 0, 1, 1,
0.4980835, -0.4836088, 4.159908, 0, 0, 0, 1, 1,
0.5000697, -0.9160503, 3.637562, 1, 1, 1, 1, 1,
0.5024172, 1.461236, -1.246531, 1, 1, 1, 1, 1,
0.5068902, 1.217618, -0.6235285, 1, 1, 1, 1, 1,
0.507264, 1.231835, -0.1935806, 1, 1, 1, 1, 1,
0.5133256, -0.5826831, 3.118871, 1, 1, 1, 1, 1,
0.5141106, 0.08115848, 1.355206, 1, 1, 1, 1, 1,
0.5145042, -0.4641215, 1.816379, 1, 1, 1, 1, 1,
0.5199553, -1.024534, 0.8927609, 1, 1, 1, 1, 1,
0.5279036, -0.3351838, 0.8284908, 1, 1, 1, 1, 1,
0.5279949, 0.3284739, 0.1159356, 1, 1, 1, 1, 1,
0.5306089, -1.048916, 2.288899, 1, 1, 1, 1, 1,
0.5332354, -0.9417, 3.227169, 1, 1, 1, 1, 1,
0.5342767, -1.250603, 4.187433, 1, 1, 1, 1, 1,
0.536655, -1.161683, 2.579941, 1, 1, 1, 1, 1,
0.5379257, -0.675234, 2.568182, 1, 1, 1, 1, 1,
0.5382155, 1.153515, 1.511935, 0, 0, 1, 1, 1,
0.5389972, -0.5099491, 3.715939, 1, 0, 0, 1, 1,
0.539377, 0.6526847, 2.396975, 1, 0, 0, 1, 1,
0.5399631, -0.3910061, 2.42581, 1, 0, 0, 1, 1,
0.5449631, 0.4268321, 1.554746, 1, 0, 0, 1, 1,
0.5457979, 1.305569, -1.031222, 1, 0, 0, 1, 1,
0.5514271, -0.1732651, 0.805648, 0, 0, 0, 1, 1,
0.5559545, -0.3547041, 2.005394, 0, 0, 0, 1, 1,
0.5606757, 0.7534692, 0.0907989, 0, 0, 0, 1, 1,
0.5610431, 1.716901, -1.022552, 0, 0, 0, 1, 1,
0.5683216, -0.7843703, 1.422531, 0, 0, 0, 1, 1,
0.5690742, 0.3713201, 0.003392354, 0, 0, 0, 1, 1,
0.5760858, 0.6233792, 0.9921395, 0, 0, 0, 1, 1,
0.5846235, 0.4530146, 2.162667, 1, 1, 1, 1, 1,
0.586445, -0.7387996, 3.04461, 1, 1, 1, 1, 1,
0.5921597, -1.187785, 4.153221, 1, 1, 1, 1, 1,
0.6029636, -0.6689553, 1.352312, 1, 1, 1, 1, 1,
0.6036513, 0.7830123, 0.7952145, 1, 1, 1, 1, 1,
0.6041617, -1.461592, 2.259197, 1, 1, 1, 1, 1,
0.6045833, 1.016528, 0.6805294, 1, 1, 1, 1, 1,
0.6073249, -1.081966, 3.461621, 1, 1, 1, 1, 1,
0.6133452, 0.7833173, 0.5462341, 1, 1, 1, 1, 1,
0.6137622, -0.4891946, 2.157898, 1, 1, 1, 1, 1,
0.6190829, 0.19415, 2.652155, 1, 1, 1, 1, 1,
0.6192906, 0.1744884, 3.714982, 1, 1, 1, 1, 1,
0.6207134, 0.9592147, -0.5076913, 1, 1, 1, 1, 1,
0.6215676, -0.2379011, 1.789413, 1, 1, 1, 1, 1,
0.6219031, 0.7151725, 1.123207, 1, 1, 1, 1, 1,
0.6233212, -0.4971646, 0.954689, 0, 0, 1, 1, 1,
0.6244168, -0.8947959, 2.900253, 1, 0, 0, 1, 1,
0.6246011, 0.473307, 0.7627758, 1, 0, 0, 1, 1,
0.6267676, 0.4102238, 2.056015, 1, 0, 0, 1, 1,
0.6294014, -0.3619525, 1.428153, 1, 0, 0, 1, 1,
0.6360929, 1.261162, -1.847641, 1, 0, 0, 1, 1,
0.6395186, 0.3580927, 2.212817, 0, 0, 0, 1, 1,
0.6400441, 2.374764, 1.067175, 0, 0, 0, 1, 1,
0.6426668, 0.9055353, 0.7271453, 0, 0, 0, 1, 1,
0.644325, -0.1626143, 2.765158, 0, 0, 0, 1, 1,
0.6476949, 1.845976, 0.5810244, 0, 0, 0, 1, 1,
0.649178, -0.4484142, 3.757022, 0, 0, 0, 1, 1,
0.6493662, -0.2444779, 1.651606, 0, 0, 0, 1, 1,
0.653629, -2.199682, 2.659075, 1, 1, 1, 1, 1,
0.6546302, -0.1988726, 3.050737, 1, 1, 1, 1, 1,
0.6584903, -1.649234, 2.606439, 1, 1, 1, 1, 1,
0.6657498, -0.6473702, 2.341258, 1, 1, 1, 1, 1,
0.672184, -0.6095124, 0.7568285, 1, 1, 1, 1, 1,
0.6759484, -1.002879, 2.649423, 1, 1, 1, 1, 1,
0.6795493, 1.068012, 0.6802301, 1, 1, 1, 1, 1,
0.6800591, -0.4311761, 2.855469, 1, 1, 1, 1, 1,
0.6807356, 2.046452, 1.01253, 1, 1, 1, 1, 1,
0.6819358, 2.171889, -0.2631842, 1, 1, 1, 1, 1,
0.6824243, 0.2080805, 0.4468807, 1, 1, 1, 1, 1,
0.6842382, -0.6794219, 3.216311, 1, 1, 1, 1, 1,
0.6851613, -1.026206, 5.575927, 1, 1, 1, 1, 1,
0.6856405, -0.184008, 2.002356, 1, 1, 1, 1, 1,
0.6983229, 0.4337835, 2.200742, 1, 1, 1, 1, 1,
0.7016198, 0.687718, 0.4604036, 0, 0, 1, 1, 1,
0.7030078, 0.6649374, 1.407681, 1, 0, 0, 1, 1,
0.7041836, 0.6806571, -0.8676301, 1, 0, 0, 1, 1,
0.7064456, 1.513474, -0.1308237, 1, 0, 0, 1, 1,
0.7102758, 0.9915566, 3.119492, 1, 0, 0, 1, 1,
0.7107242, 0.5203345, 2.009693, 1, 0, 0, 1, 1,
0.7122541, 0.382296, -0.0222907, 0, 0, 0, 1, 1,
0.7127351, -0.8127794, 3.322931, 0, 0, 0, 1, 1,
0.7149425, -0.1372641, 0.1919262, 0, 0, 0, 1, 1,
0.7334126, 0.3809051, 1.501041, 0, 0, 0, 1, 1,
0.7336757, -0.1865454, 2.266302, 0, 0, 0, 1, 1,
0.7350871, -1.081972, 3.173912, 0, 0, 0, 1, 1,
0.7354773, 0.2186121, -0.4919785, 0, 0, 0, 1, 1,
0.74502, 0.8037977, -2.109574, 1, 1, 1, 1, 1,
0.7465529, -0.2560747, 1.91651, 1, 1, 1, 1, 1,
0.7548673, -0.05430775, 1.394756, 1, 1, 1, 1, 1,
0.7574698, -0.4067296, 1.699638, 1, 1, 1, 1, 1,
0.7662241, -0.233018, 2.897036, 1, 1, 1, 1, 1,
0.7708766, -0.8892019, 1.850384, 1, 1, 1, 1, 1,
0.7781373, 0.03355798, 1.10242, 1, 1, 1, 1, 1,
0.7790052, -1.406508, 1.248439, 1, 1, 1, 1, 1,
0.7852189, -0.3449779, 1.59545, 1, 1, 1, 1, 1,
0.7883971, 0.5444274, 1.702245, 1, 1, 1, 1, 1,
0.7928188, -0.3018419, 2.35217, 1, 1, 1, 1, 1,
0.8110151, 0.06324574, 1.794856, 1, 1, 1, 1, 1,
0.8121268, 0.7507441, -0.4220546, 1, 1, 1, 1, 1,
0.8129531, -1.54898, 2.293447, 1, 1, 1, 1, 1,
0.8170275, 1.791308, 0.9889143, 1, 1, 1, 1, 1,
0.8279842, -0.1040613, 1.117557, 0, 0, 1, 1, 1,
0.8298327, 0.9374166, 0.3468029, 1, 0, 0, 1, 1,
0.8319742, 0.3121479, 1.857662, 1, 0, 0, 1, 1,
0.8403275, -0.4033564, 1.158367, 1, 0, 0, 1, 1,
0.8408675, 1.276379, 1.929995, 1, 0, 0, 1, 1,
0.842778, 0.2909939, 1.134471, 1, 0, 0, 1, 1,
0.8474197, 0.8160705, 1.324431, 0, 0, 0, 1, 1,
0.8476311, 0.5167307, 0.9193999, 0, 0, 0, 1, 1,
0.8495116, 0.3543808, -0.4691988, 0, 0, 0, 1, 1,
0.8505123, 1.37195, 0.1952537, 0, 0, 0, 1, 1,
0.8525195, 0.9514281, 0.8973204, 0, 0, 0, 1, 1,
0.864234, 0.7745864, 0.4898092, 0, 0, 0, 1, 1,
0.8645431, -0.08153357, 0.9683704, 0, 0, 0, 1, 1,
0.864634, 0.6262101, 1.677393, 1, 1, 1, 1, 1,
0.865768, 0.188102, 1.537532, 1, 1, 1, 1, 1,
0.8676496, 1.463271, 1.192341, 1, 1, 1, 1, 1,
0.8685775, 0.1635131, 2.098873, 1, 1, 1, 1, 1,
0.8688477, -0.1652294, 0.04634796, 1, 1, 1, 1, 1,
0.8695552, 0.600799, 1.375688, 1, 1, 1, 1, 1,
0.8773008, -0.0499735, 1.483595, 1, 1, 1, 1, 1,
0.8790424, 1.179888, 0.2753704, 1, 1, 1, 1, 1,
0.8793043, -0.02873142, 2.137882, 1, 1, 1, 1, 1,
0.8828195, -0.4129453, 1.345381, 1, 1, 1, 1, 1,
0.8875084, -1.080179, 1.598189, 1, 1, 1, 1, 1,
0.8920816, 0.9772668, 2.395268, 1, 1, 1, 1, 1,
0.8936493, -0.9742698, 1.714945, 1, 1, 1, 1, 1,
0.8971835, 0.3204165, 1.229798, 1, 1, 1, 1, 1,
0.8985554, 0.2936096, 1.389664, 1, 1, 1, 1, 1,
0.8985829, 2.155786, 0.7594058, 0, 0, 1, 1, 1,
0.9015639, -0.06790678, 3.07714, 1, 0, 0, 1, 1,
0.9028397, 0.08027693, 2.397303, 1, 0, 0, 1, 1,
0.9046302, -0.6765199, 1.70938, 1, 0, 0, 1, 1,
0.9049179, -1.121775, 0.8347858, 1, 0, 0, 1, 1,
0.905939, -2.020145, 2.847532, 1, 0, 0, 1, 1,
0.9091876, 1.251607, 0.150465, 0, 0, 0, 1, 1,
0.9143276, -0.1990048, 0.692824, 0, 0, 0, 1, 1,
0.9174976, 0.5684673, 1.410841, 0, 0, 0, 1, 1,
0.9177583, -1.237876, 1.961372, 0, 0, 0, 1, 1,
0.9283265, 1.392965, 1.437058, 0, 0, 0, 1, 1,
0.9300506, -0.8684663, 3.216037, 0, 0, 0, 1, 1,
0.9339269, -1.262068, 3.12852, 0, 0, 0, 1, 1,
0.934183, -0.2725034, 1.174315, 1, 1, 1, 1, 1,
0.935014, -0.7246775, 1.375323, 1, 1, 1, 1, 1,
0.9357473, -0.4905158, 1.71336, 1, 1, 1, 1, 1,
0.936875, 1.235476, 0.3915007, 1, 1, 1, 1, 1,
0.9375629, -1.415102, 3.303961, 1, 1, 1, 1, 1,
0.9454732, 0.6493361, 0.3556674, 1, 1, 1, 1, 1,
0.9464622, -0.4590864, 1.736033, 1, 1, 1, 1, 1,
0.9617969, -0.4346136, 2.972143, 1, 1, 1, 1, 1,
0.9625632, -0.6729404, 2.505837, 1, 1, 1, 1, 1,
0.968527, 0.4655242, 1.260729, 1, 1, 1, 1, 1,
0.9697206, 2.167761, 0.3606419, 1, 1, 1, 1, 1,
0.9766459, 1.513732, -0.201641, 1, 1, 1, 1, 1,
0.9781805, -1.249768, 0.653328, 1, 1, 1, 1, 1,
0.9781953, -0.118232, 0.09311028, 1, 1, 1, 1, 1,
0.991195, -1.838235, 1.923199, 1, 1, 1, 1, 1,
0.9918613, 0.8239965, 2.035901, 0, 0, 1, 1, 1,
0.9963935, -0.03401463, 1.320954, 1, 0, 0, 1, 1,
0.9994641, -0.7507305, 2.470493, 1, 0, 0, 1, 1,
1.000317, -2.245137, 3.973419, 1, 0, 0, 1, 1,
1.003044, -0.2535118, 2.836356, 1, 0, 0, 1, 1,
1.012599, 0.2954439, 2.084977, 1, 0, 0, 1, 1,
1.021969, 0.0758945, 1.937646, 0, 0, 0, 1, 1,
1.023161, 0.2812567, 0.1663089, 0, 0, 0, 1, 1,
1.031237, 0.3578223, 2.856931, 0, 0, 0, 1, 1,
1.036192, 0.2233274, 0.9752951, 0, 0, 0, 1, 1,
1.040211, -1.019849, 2.958787, 0, 0, 0, 1, 1,
1.041894, 0.1930766, 1.643388, 0, 0, 0, 1, 1,
1.041957, -0.1005341, 2.104206, 0, 0, 0, 1, 1,
1.04428, 1.155756, 0.8495107, 1, 1, 1, 1, 1,
1.052508, -0.1533199, 2.384573, 1, 1, 1, 1, 1,
1.056592, 0.2193772, 0.3710887, 1, 1, 1, 1, 1,
1.058629, -0.3565365, 0.8999764, 1, 1, 1, 1, 1,
1.067986, 2.148744, 0.4692338, 1, 1, 1, 1, 1,
1.070205, 1.291723, 0.914178, 1, 1, 1, 1, 1,
1.074827, 0.1418932, 1.26134, 1, 1, 1, 1, 1,
1.091642, -0.389405, 1.139023, 1, 1, 1, 1, 1,
1.103156, -1.272133, 3.292914, 1, 1, 1, 1, 1,
1.10327, -1.810263, 1.523998, 1, 1, 1, 1, 1,
1.115523, 1.048733, 0.1347548, 1, 1, 1, 1, 1,
1.130644, 0.3657054, 1.593535, 1, 1, 1, 1, 1,
1.13786, 1.957322, 1.642415, 1, 1, 1, 1, 1,
1.14188, 0.2672793, 1.813917, 1, 1, 1, 1, 1,
1.142631, 0.2621748, 2.895101, 1, 1, 1, 1, 1,
1.149899, 0.7179152, 2.018411, 0, 0, 1, 1, 1,
1.159787, -0.1158248, 1.525449, 1, 0, 0, 1, 1,
1.163694, 1.038096, 1.602595, 1, 0, 0, 1, 1,
1.164151, 0.77963, -0.2156806, 1, 0, 0, 1, 1,
1.200135, -1.193461, 2.549667, 1, 0, 0, 1, 1,
1.203388, -0.3794585, -0.3877401, 1, 0, 0, 1, 1,
1.206066, 1.506033, 1.791747, 0, 0, 0, 1, 1,
1.210434, -0.1818138, 0.968658, 0, 0, 0, 1, 1,
1.222783, -0.4502364, 2.804249, 0, 0, 0, 1, 1,
1.238012, 0.07148383, 0.7873585, 0, 0, 0, 1, 1,
1.238284, -0.1414354, 1.562869, 0, 0, 0, 1, 1,
1.24487, -0.07340698, 1.576573, 0, 0, 0, 1, 1,
1.255716, -2.356911, 3.005806, 0, 0, 0, 1, 1,
1.262576, 2.078328, 0.4722545, 1, 1, 1, 1, 1,
1.264076, -0.2471534, -0.6451918, 1, 1, 1, 1, 1,
1.272708, 1.879206, 0.9898452, 1, 1, 1, 1, 1,
1.291391, 0.253062, 0.9364229, 1, 1, 1, 1, 1,
1.294775, -0.7293804, 0.9042634, 1, 1, 1, 1, 1,
1.297502, 0.3238348, 2.230713, 1, 1, 1, 1, 1,
1.299616, 1.772086, -0.1074218, 1, 1, 1, 1, 1,
1.316012, 0.5868489, 2.976383, 1, 1, 1, 1, 1,
1.324539, -0.1672898, -0.3898664, 1, 1, 1, 1, 1,
1.346667, 0.4900496, 0.5082829, 1, 1, 1, 1, 1,
1.3519, -0.9405088, 2.780986, 1, 1, 1, 1, 1,
1.365485, -0.3151374, 2.492944, 1, 1, 1, 1, 1,
1.374372, -0.6414271, 1.960938, 1, 1, 1, 1, 1,
1.37795, -0.6719889, 1.483133, 1, 1, 1, 1, 1,
1.382699, -0.4585185, 2.043988, 1, 1, 1, 1, 1,
1.394151, 0.09017675, 0.2814801, 0, 0, 1, 1, 1,
1.397104, -1.280946, 2.407212, 1, 0, 0, 1, 1,
1.398706, 0.820312, 0.9871678, 1, 0, 0, 1, 1,
1.406882, 0.5929427, 0.3729444, 1, 0, 0, 1, 1,
1.407242, 0.01109104, 0.7677945, 1, 0, 0, 1, 1,
1.409007, -0.265279, 1.798247, 1, 0, 0, 1, 1,
1.4177, -0.4221656, 1.305404, 0, 0, 0, 1, 1,
1.444946, -1.033941, 2.767993, 0, 0, 0, 1, 1,
1.457045, -0.8148044, 1.304812, 0, 0, 0, 1, 1,
1.463056, 0.9364755, 0.9965739, 0, 0, 0, 1, 1,
1.47234, -0.8130462, 3.048275, 0, 0, 0, 1, 1,
1.492455, 0.4216713, 0.5905836, 0, 0, 0, 1, 1,
1.500375, 0.3463382, 2.08955, 0, 0, 0, 1, 1,
1.512871, 0.5476481, 0.07295866, 1, 1, 1, 1, 1,
1.528177, 0.2278428, 0.6136214, 1, 1, 1, 1, 1,
1.546207, -0.654045, 0.04511267, 1, 1, 1, 1, 1,
1.546934, -0.5535248, 2.011219, 1, 1, 1, 1, 1,
1.547017, -0.150633, 0.802397, 1, 1, 1, 1, 1,
1.551935, -0.7599286, 2.400444, 1, 1, 1, 1, 1,
1.55246, -0.9076357, 1.718268, 1, 1, 1, 1, 1,
1.593408, -0.3461215, 0.1055477, 1, 1, 1, 1, 1,
1.600285, 0.6589226, 1.265509, 1, 1, 1, 1, 1,
1.658314, -0.8818165, 0.8839034, 1, 1, 1, 1, 1,
1.663821, -0.9695803, 1.568162, 1, 1, 1, 1, 1,
1.669246, -0.3473153, 2.296694, 1, 1, 1, 1, 1,
1.681161, 1.567035, 0.0827279, 1, 1, 1, 1, 1,
1.68591, -0.8420137, 0.5048931, 1, 1, 1, 1, 1,
1.687667, -0.181248, 1.177284, 1, 1, 1, 1, 1,
1.743411, 0.3435236, 0.4910878, 0, 0, 1, 1, 1,
1.747796, 0.9524725, 0.270026, 1, 0, 0, 1, 1,
1.754761, -0.8992953, 0.8074716, 1, 0, 0, 1, 1,
1.761301, 0.005349508, 1.59399, 1, 0, 0, 1, 1,
1.797628, 1.300231, 1.631322, 1, 0, 0, 1, 1,
1.857434, 0.5258133, 0.6974512, 1, 0, 0, 1, 1,
1.861604, 0.4395508, 2.066615, 0, 0, 0, 1, 1,
1.871448, 0.7690517, -0.1454934, 0, 0, 0, 1, 1,
1.883519, 0.01332365, 3.324084, 0, 0, 0, 1, 1,
1.898194, -0.5359563, 1.118739, 0, 0, 0, 1, 1,
1.906066, -0.4190838, 0.6768548, 0, 0, 0, 1, 1,
1.911441, -0.6616671, 1.918831, 0, 0, 0, 1, 1,
1.922327, -0.4366743, 2.645222, 0, 0, 0, 1, 1,
1.936414, -0.6478552, 1.343779, 1, 1, 1, 1, 1,
1.965122, 1.624364, 0.8138805, 1, 1, 1, 1, 1,
2.017718, -0.5719907, 1.800467, 1, 1, 1, 1, 1,
2.038665, 0.3087912, 1.316709, 1, 1, 1, 1, 1,
2.078515, 1.190053, -0.4545796, 1, 1, 1, 1, 1,
2.084985, 0.02171857, 2.799186, 1, 1, 1, 1, 1,
2.102089, 1.258656, 1.692291, 1, 1, 1, 1, 1,
2.118957, 1.514454, 0.5233784, 1, 1, 1, 1, 1,
2.121797, -1.33458, 1.245649, 1, 1, 1, 1, 1,
2.126594, -1.435989, 1.145854, 1, 1, 1, 1, 1,
2.140748, -3.453327, 0.8046374, 1, 1, 1, 1, 1,
2.141198, 0.056954, 0.8581897, 1, 1, 1, 1, 1,
2.15454, 0.8543644, 0.5098451, 1, 1, 1, 1, 1,
2.164168, 1.338989, 1.089496, 1, 1, 1, 1, 1,
2.165945, 0.3186386, 2.089233, 1, 1, 1, 1, 1,
2.221141, -0.6945365, 2.928742, 0, 0, 1, 1, 1,
2.247918, 1.354133, 2.75557, 1, 0, 0, 1, 1,
2.25035, 0.3594465, 1.354574, 1, 0, 0, 1, 1,
2.270284, 2.549713, 0.8208114, 1, 0, 0, 1, 1,
2.280742, -0.7671913, 3.498303, 1, 0, 0, 1, 1,
2.303132, 0.01966946, 0.2316293, 1, 0, 0, 1, 1,
2.305721, -1.900003, 3.222077, 0, 0, 0, 1, 1,
2.321184, 0.3411708, 0.6203278, 0, 0, 0, 1, 1,
2.428452, 0.394614, 0.5894204, 0, 0, 0, 1, 1,
2.538105, 0.6732702, 0.4149185, 0, 0, 0, 1, 1,
2.617781, -1.322634, 2.607592, 0, 0, 0, 1, 1,
2.626977, 0.4176961, 2.138503, 0, 0, 0, 1, 1,
2.719268, 0.3684528, 0.858388, 0, 0, 0, 1, 1,
2.74367, -0.1733822, 2.182601, 1, 1, 1, 1, 1,
2.869162, 1.486533, 0.2802866, 1, 1, 1, 1, 1,
2.891415, 1.034445, 2.077517, 1, 1, 1, 1, 1,
2.901073, -1.545319, 4.61687, 1, 1, 1, 1, 1,
3.020254, -0.3478357, 1.69973, 1, 1, 1, 1, 1,
3.283895, 1.556895, 0.1065668, 1, 1, 1, 1, 1,
3.398085, 1.95559, -0.6687225, 1, 1, 1, 1, 1
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
var radius = 9.790108;
var distance = 34.38734;
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
mvMatrix.translate( -0.172142, 0.09150147, -0.06995773 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.38734);
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