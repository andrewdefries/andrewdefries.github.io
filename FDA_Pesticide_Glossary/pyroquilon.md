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
-3.432179, 1.199176, -1.585767, 1, 0, 0, 1,
-3.387946, 0.2239132, -1.703285, 1, 0.007843138, 0, 1,
-3.107088, 0.6578427, -0.01612044, 1, 0.01176471, 0, 1,
-2.969213, -0.9117041, -1.313396, 1, 0.01960784, 0, 1,
-2.641346, 1.083058, -0.6077983, 1, 0.02352941, 0, 1,
-2.539123, -0.7756774, -2.077583, 1, 0.03137255, 0, 1,
-2.511315, 0.7529055, -0.09155151, 1, 0.03529412, 0, 1,
-2.498493, -0.7163769, -1.103262, 1, 0.04313726, 0, 1,
-2.470393, -0.04565134, -0.5256515, 1, 0.04705882, 0, 1,
-2.467941, -1.429469, -3.411432, 1, 0.05490196, 0, 1,
-2.423699, -2.06642, -3.854384, 1, 0.05882353, 0, 1,
-2.353374, 1.338115, 1.315216, 1, 0.06666667, 0, 1,
-2.322001, -1.915428, -0.9263543, 1, 0.07058824, 0, 1,
-2.313569, 0.9371213, -0.02414615, 1, 0.07843138, 0, 1,
-2.190838, -0.9763645, -2.198061, 1, 0.08235294, 0, 1,
-2.119029, 0.527498, -0.4953206, 1, 0.09019608, 0, 1,
-2.097505, 0.06111292, -1.883264, 1, 0.09411765, 0, 1,
-2.076473, -2.111745, -2.127774, 1, 0.1019608, 0, 1,
-2.07205, 1.513471, -1.669016, 1, 0.1098039, 0, 1,
-2.064748, 0.2391947, 0.01411404, 1, 0.1137255, 0, 1,
-2.056311, -0.6922516, -0.8938178, 1, 0.1215686, 0, 1,
-2.044891, 0.6591417, -0.7831278, 1, 0.1254902, 0, 1,
-2.022393, 0.1937065, -1.108178, 1, 0.1333333, 0, 1,
-1.957783, -1.239023, -0.6376126, 1, 0.1372549, 0, 1,
-1.940772, -0.1790184, -2.121478, 1, 0.145098, 0, 1,
-1.913782, 1.493267, 0.08194581, 1, 0.1490196, 0, 1,
-1.909375, 0.2057815, -0.05051711, 1, 0.1568628, 0, 1,
-1.899734, -1.109984, -2.02183, 1, 0.1607843, 0, 1,
-1.888423, -0.6049632, -0.9693276, 1, 0.1686275, 0, 1,
-1.88777, -0.08206291, -2.473509, 1, 0.172549, 0, 1,
-1.873428, -0.9245317, -1.240983, 1, 0.1803922, 0, 1,
-1.856337, -1.230969, -2.936849, 1, 0.1843137, 0, 1,
-1.855073, 0.8594625, -1.562063, 1, 0.1921569, 0, 1,
-1.834335, 0.5786076, -2.717333, 1, 0.1960784, 0, 1,
-1.821035, 0.1022079, -2.972781, 1, 0.2039216, 0, 1,
-1.800849, -1.723631, -2.196912, 1, 0.2117647, 0, 1,
-1.78732, 0.05816907, -1.859634, 1, 0.2156863, 0, 1,
-1.781972, 0.7691969, 0.2843391, 1, 0.2235294, 0, 1,
-1.779344, 0.2187281, -1.387268, 1, 0.227451, 0, 1,
-1.767156, -0.8847378, -1.252592, 1, 0.2352941, 0, 1,
-1.740399, -0.3791054, -2.475415, 1, 0.2392157, 0, 1,
-1.730617, -1.168332, -3.216012, 1, 0.2470588, 0, 1,
-1.729594, -0.03725188, -1.354915, 1, 0.2509804, 0, 1,
-1.716623, -1.227631, -1.883076, 1, 0.2588235, 0, 1,
-1.71543, -0.911384, -1.714694, 1, 0.2627451, 0, 1,
-1.7042, -1.024064, -0.312772, 1, 0.2705882, 0, 1,
-1.696133, -0.7170247, -1.083266, 1, 0.2745098, 0, 1,
-1.6859, 0.1357315, -3.217475, 1, 0.282353, 0, 1,
-1.685111, 0.007048223, -1.795363, 1, 0.2862745, 0, 1,
-1.6808, -1.004337, -0.9266899, 1, 0.2941177, 0, 1,
-1.679447, 2.394379, -0.6636434, 1, 0.3019608, 0, 1,
-1.670788, 0.1275027, -0.9134407, 1, 0.3058824, 0, 1,
-1.664722, 1.555001, -2.114592, 1, 0.3137255, 0, 1,
-1.6584, -0.0299168, -3.149643, 1, 0.3176471, 0, 1,
-1.648836, 0.370502, -1.507644, 1, 0.3254902, 0, 1,
-1.642103, 0.430283, -2.110093, 1, 0.3294118, 0, 1,
-1.632706, 1.697045, -1.302776, 1, 0.3372549, 0, 1,
-1.618219, -0.07075065, -4.55342, 1, 0.3411765, 0, 1,
-1.613139, -0.6060937, -0.542763, 1, 0.3490196, 0, 1,
-1.60586, 0.3332476, -2.886867, 1, 0.3529412, 0, 1,
-1.603796, -1.184473, -1.306917, 1, 0.3607843, 0, 1,
-1.576304, 1.009433, -0.8053976, 1, 0.3647059, 0, 1,
-1.566265, 1.240411, -0.7956079, 1, 0.372549, 0, 1,
-1.557254, -0.5526342, -1.872809, 1, 0.3764706, 0, 1,
-1.550475, 0.558554, 0.8614249, 1, 0.3843137, 0, 1,
-1.547361, 2.094997, -0.4812215, 1, 0.3882353, 0, 1,
-1.53404, 0.2578248, -0.1313432, 1, 0.3960784, 0, 1,
-1.530011, -0.7920587, -4.014129, 1, 0.4039216, 0, 1,
-1.529438, -1.184565, -0.2353596, 1, 0.4078431, 0, 1,
-1.525639, 1.733164, -0.4572702, 1, 0.4156863, 0, 1,
-1.522413, 0.6607178, -2.553623, 1, 0.4196078, 0, 1,
-1.520931, -0.01670049, 0.5506818, 1, 0.427451, 0, 1,
-1.515323, -1.305784, -1.756134, 1, 0.4313726, 0, 1,
-1.510607, -0.03121637, -0.6658502, 1, 0.4392157, 0, 1,
-1.509397, -0.7664023, -1.659076, 1, 0.4431373, 0, 1,
-1.493468, 1.158515, -3.137668, 1, 0.4509804, 0, 1,
-1.479056, 1.363026, -1.599567, 1, 0.454902, 0, 1,
-1.463158, -0.007793657, -1.375981, 1, 0.4627451, 0, 1,
-1.450477, -0.5915444, -1.675008, 1, 0.4666667, 0, 1,
-1.433053, 0.9896641, -1.334317, 1, 0.4745098, 0, 1,
-1.424605, -0.1083199, -0.9700835, 1, 0.4784314, 0, 1,
-1.419017, -0.3420226, -3.026562, 1, 0.4862745, 0, 1,
-1.418708, 1.161122, -0.3637026, 1, 0.4901961, 0, 1,
-1.414568, 0.114249, -1.769192, 1, 0.4980392, 0, 1,
-1.40681, -0.8974915, -1.032104, 1, 0.5058824, 0, 1,
-1.401882, -0.1091883, -1.967115, 1, 0.509804, 0, 1,
-1.398738, -1.084861, -3.077732, 1, 0.5176471, 0, 1,
-1.392632, 0.3578297, -2.626933, 1, 0.5215687, 0, 1,
-1.381863, -1.689269, -2.228953, 1, 0.5294118, 0, 1,
-1.371368, 1.859216, -1.427814, 1, 0.5333334, 0, 1,
-1.364856, -0.3327703, -2.944338, 1, 0.5411765, 0, 1,
-1.363752, -0.6089377, -1.789883, 1, 0.5450981, 0, 1,
-1.362668, -0.6454728, -2.623943, 1, 0.5529412, 0, 1,
-1.359274, 2.189079, 1.462135, 1, 0.5568628, 0, 1,
-1.358128, -0.2936228, -2.309736, 1, 0.5647059, 0, 1,
-1.340024, 0.909502, -2.314122, 1, 0.5686275, 0, 1,
-1.335279, 0.2195072, -3.16004, 1, 0.5764706, 0, 1,
-1.331897, -0.8515675, -2.302016, 1, 0.5803922, 0, 1,
-1.331838, 0.4180454, 0.167762, 1, 0.5882353, 0, 1,
-1.296442, 0.1938867, 0.8848738, 1, 0.5921569, 0, 1,
-1.276211, 0.3149167, -1.572308, 1, 0.6, 0, 1,
-1.26675, 0.5503339, 0.2772737, 1, 0.6078432, 0, 1,
-1.264387, 0.7436659, -2.050615, 1, 0.6117647, 0, 1,
-1.259902, 0.4204954, -1.458234, 1, 0.6196079, 0, 1,
-1.256594, 1.596859, -0.03734294, 1, 0.6235294, 0, 1,
-1.25458, -0.5226021, -2.825639, 1, 0.6313726, 0, 1,
-1.220737, 0.4905201, -1.101458, 1, 0.6352941, 0, 1,
-1.218655, -0.02620382, -2.655802, 1, 0.6431373, 0, 1,
-1.213366, 0.6969329, -1.329941, 1, 0.6470588, 0, 1,
-1.210694, 0.9177943, -1.032998, 1, 0.654902, 0, 1,
-1.202948, -0.4121026, -2.58944, 1, 0.6588235, 0, 1,
-1.197822, -0.0295252, -3.812652, 1, 0.6666667, 0, 1,
-1.195891, 0.06114504, -1.118124, 1, 0.6705883, 0, 1,
-1.181091, -0.8727384, -2.799451, 1, 0.6784314, 0, 1,
-1.16934, 0.1608643, -1.193161, 1, 0.682353, 0, 1,
-1.161433, 0.88453, 2.004863, 1, 0.6901961, 0, 1,
-1.157282, -0.8362316, -2.383819, 1, 0.6941177, 0, 1,
-1.154508, -0.03090937, -2.869683, 1, 0.7019608, 0, 1,
-1.129352, -0.964956, -3.646291, 1, 0.7098039, 0, 1,
-1.127339, -0.2113746, -1.411265, 1, 0.7137255, 0, 1,
-1.117974, 2.108442, -1.443762, 1, 0.7215686, 0, 1,
-1.114017, 0.2366177, -0.3507976, 1, 0.7254902, 0, 1,
-1.111069, 0.3122665, -1.007144, 1, 0.7333333, 0, 1,
-1.10997, 0.7936467, -0.3958864, 1, 0.7372549, 0, 1,
-1.109481, 1.841033, 0.1863426, 1, 0.7450981, 0, 1,
-1.109213, 0.9605578, -0.1600492, 1, 0.7490196, 0, 1,
-1.107303, -1.419475, -0.9055704, 1, 0.7568628, 0, 1,
-1.106217, -0.604194, -3.222587, 1, 0.7607843, 0, 1,
-1.102722, 0.2480299, -1.27265, 1, 0.7686275, 0, 1,
-1.096558, -0.3019487, -2.966265, 1, 0.772549, 0, 1,
-1.095409, -0.5439048, 0.07333019, 1, 0.7803922, 0, 1,
-1.089575, -1.18259, -2.766378, 1, 0.7843137, 0, 1,
-1.080101, -0.02171618, -1.731978, 1, 0.7921569, 0, 1,
-1.076409, -0.4682074, -1.120652, 1, 0.7960784, 0, 1,
-1.071599, 0.2855527, -1.274706, 1, 0.8039216, 0, 1,
-1.06755, 1.191568, -1.217421, 1, 0.8117647, 0, 1,
-1.064375, -0.2438868, -2.121539, 1, 0.8156863, 0, 1,
-1.062636, 1.693494, 0.1102113, 1, 0.8235294, 0, 1,
-1.052955, -0.9582543, -3.409059, 1, 0.827451, 0, 1,
-1.047795, -0.3879346, -2.831718, 1, 0.8352941, 0, 1,
-1.042365, 0.3570623, -0.575294, 1, 0.8392157, 0, 1,
-1.035487, 0.04990682, -1.198156, 1, 0.8470588, 0, 1,
-1.033715, -0.009323273, -1.952595, 1, 0.8509804, 0, 1,
-1.030794, 0.4356849, -2.086465, 1, 0.8588235, 0, 1,
-1.029548, 1.758895, -0.7639317, 1, 0.8627451, 0, 1,
-1.027015, 0.2473021, 0.03510538, 1, 0.8705882, 0, 1,
-1.020221, 0.6253639, -2.349089, 1, 0.8745098, 0, 1,
-0.999767, -0.9483817, -2.053912, 1, 0.8823529, 0, 1,
-0.992111, 0.402042, -2.148878, 1, 0.8862745, 0, 1,
-0.9877241, 0.5877167, 0.2230692, 1, 0.8941177, 0, 1,
-0.9812192, 0.273787, -0.8178695, 1, 0.8980392, 0, 1,
-0.9763165, 0.04508317, -1.82894, 1, 0.9058824, 0, 1,
-0.9748544, 0.8205757, -1.260781, 1, 0.9137255, 0, 1,
-0.9746838, -0.04382043, -2.484913, 1, 0.9176471, 0, 1,
-0.9740139, -0.04516196, -0.7129411, 1, 0.9254902, 0, 1,
-0.9717999, 0.2788042, -2.218841, 1, 0.9294118, 0, 1,
-0.9510826, 0.2855195, -1.736222, 1, 0.9372549, 0, 1,
-0.9270062, -1.175501, -3.556049, 1, 0.9411765, 0, 1,
-0.9240386, 0.3226283, -1.986874, 1, 0.9490196, 0, 1,
-0.9186938, -0.7047247, -4.266257, 1, 0.9529412, 0, 1,
-0.9166206, 0.02561107, -3.469913, 1, 0.9607843, 0, 1,
-0.9085019, 1.25395, -0.7763032, 1, 0.9647059, 0, 1,
-0.8977324, 0.5707119, -2.352132, 1, 0.972549, 0, 1,
-0.8954821, 0.4115454, -2.230228, 1, 0.9764706, 0, 1,
-0.8942661, 0.9579322, -1.023101, 1, 0.9843137, 0, 1,
-0.8930914, -0.8424271, -0.6338661, 1, 0.9882353, 0, 1,
-0.8902429, 1.808417, -0.324728, 1, 0.9960784, 0, 1,
-0.8877171, 1.408074, -0.7635782, 0.9960784, 1, 0, 1,
-0.8872418, 0.08201628, -2.052944, 0.9921569, 1, 0, 1,
-0.8854853, -1.551792, -1.543347, 0.9843137, 1, 0, 1,
-0.8824031, -0.08257581, -1.207499, 0.9803922, 1, 0, 1,
-0.8799952, 1.603618, -1.254432, 0.972549, 1, 0, 1,
-0.8752318, 1.140938, -0.3776085, 0.9686275, 1, 0, 1,
-0.8725371, 1.056903, -3.10462, 0.9607843, 1, 0, 1,
-0.86669, 0.9048446, -1.653333, 0.9568627, 1, 0, 1,
-0.8639587, -1.473477, -2.244614, 0.9490196, 1, 0, 1,
-0.863184, -0.4984665, -3.419353, 0.945098, 1, 0, 1,
-0.8617901, -0.3882068, -3.551426, 0.9372549, 1, 0, 1,
-0.8616416, -0.4689918, -1.461053, 0.9333333, 1, 0, 1,
-0.8576226, -0.4011934, -0.3832233, 0.9254902, 1, 0, 1,
-0.856677, 2.50545, -0.1632118, 0.9215686, 1, 0, 1,
-0.8540154, -0.2590429, -2.212817, 0.9137255, 1, 0, 1,
-0.8521502, 0.3371705, -1.491543, 0.9098039, 1, 0, 1,
-0.8490658, -0.1155634, -2.019729, 0.9019608, 1, 0, 1,
-0.8460186, -1.032194, -2.766919, 0.8941177, 1, 0, 1,
-0.8450521, -0.4922658, -1.379434, 0.8901961, 1, 0, 1,
-0.8436286, -0.5782506, -2.688643, 0.8823529, 1, 0, 1,
-0.8432347, -1.383336, -3.512689, 0.8784314, 1, 0, 1,
-0.8431422, 0.9506188, -1.086915, 0.8705882, 1, 0, 1,
-0.835654, -0.577317, -2.64986, 0.8666667, 1, 0, 1,
-0.8331619, 0.1749344, -1.245812, 0.8588235, 1, 0, 1,
-0.8228292, 0.6536155, -0.8740059, 0.854902, 1, 0, 1,
-0.8151463, -0.5800762, -2.269146, 0.8470588, 1, 0, 1,
-0.8119004, -0.09188361, -2.626129, 0.8431373, 1, 0, 1,
-0.8106053, -0.6071985, -2.691379, 0.8352941, 1, 0, 1,
-0.8062398, -0.7294587, -4.934251, 0.8313726, 1, 0, 1,
-0.8054636, -2.127908, -2.675785, 0.8235294, 1, 0, 1,
-0.8029516, -0.244715, -2.07695, 0.8196079, 1, 0, 1,
-0.8028975, -0.2594585, 0.07693153, 0.8117647, 1, 0, 1,
-0.7986169, 0.6315822, -0.4888439, 0.8078431, 1, 0, 1,
-0.793542, 0.5328285, -2.76833, 0.8, 1, 0, 1,
-0.7931575, 0.1289747, -1.436681, 0.7921569, 1, 0, 1,
-0.792972, 0.535768, -1.377024, 0.7882353, 1, 0, 1,
-0.7927877, 1.951147, -0.6852362, 0.7803922, 1, 0, 1,
-0.7874358, -1.393989, -1.92502, 0.7764706, 1, 0, 1,
-0.7780007, 1.278657, -0.9864074, 0.7686275, 1, 0, 1,
-0.7739105, -0.4920121, -2.185006, 0.7647059, 1, 0, 1,
-0.7710607, 1.634708, -0.9201697, 0.7568628, 1, 0, 1,
-0.770865, 0.3526926, -2.978305, 0.7529412, 1, 0, 1,
-0.7695311, 1.164315, -1.150694, 0.7450981, 1, 0, 1,
-0.7654808, 0.4995719, -1.752697, 0.7411765, 1, 0, 1,
-0.7585282, -0.04492122, -1.365492, 0.7333333, 1, 0, 1,
-0.7570773, 1.340056, 1.533335, 0.7294118, 1, 0, 1,
-0.7553937, 0.4508387, -1.035638, 0.7215686, 1, 0, 1,
-0.7510274, -0.8004549, -2.700177, 0.7176471, 1, 0, 1,
-0.7494147, 1.748734, -0.07437985, 0.7098039, 1, 0, 1,
-0.7437297, -0.1289002, -1.7418, 0.7058824, 1, 0, 1,
-0.7390006, -2.225843, -3.785833, 0.6980392, 1, 0, 1,
-0.7389891, 0.934968, -0.5162765, 0.6901961, 1, 0, 1,
-0.7389841, -1.250872, 0.2896018, 0.6862745, 1, 0, 1,
-0.7326691, 1.278444, -0.2455059, 0.6784314, 1, 0, 1,
-0.7311937, 2.297102, -0.05799784, 0.6745098, 1, 0, 1,
-0.715598, 0.9106359, -0.7515077, 0.6666667, 1, 0, 1,
-0.7116851, 0.02723204, -1.817794, 0.6627451, 1, 0, 1,
-0.710646, -0.2306841, -2.298263, 0.654902, 1, 0, 1,
-0.710305, -0.257781, -2.700885, 0.6509804, 1, 0, 1,
-0.7060482, 1.104372, -0.4114788, 0.6431373, 1, 0, 1,
-0.7048547, 2.101822, -0.5172427, 0.6392157, 1, 0, 1,
-0.7034587, -0.9256144, -3.743021, 0.6313726, 1, 0, 1,
-0.7030431, 0.1964853, -1.39033, 0.627451, 1, 0, 1,
-0.6944545, 0.06471483, -0.2913403, 0.6196079, 1, 0, 1,
-0.6868117, 1.231501, 0.3078307, 0.6156863, 1, 0, 1,
-0.685797, -0.3504513, -1.09717, 0.6078432, 1, 0, 1,
-0.6819144, 1.884105, 1.712905, 0.6039216, 1, 0, 1,
-0.6717595, -0.9038687, -3.813371, 0.5960785, 1, 0, 1,
-0.6647214, -0.8208328, -1.89387, 0.5882353, 1, 0, 1,
-0.6626849, -0.4968269, -2.207501, 0.5843138, 1, 0, 1,
-0.656947, -1.128983, -3.169182, 0.5764706, 1, 0, 1,
-0.6542256, -0.119146, -1.533688, 0.572549, 1, 0, 1,
-0.6504927, 0.723875, 1.062727, 0.5647059, 1, 0, 1,
-0.6477169, 1.332032, -1.736086, 0.5607843, 1, 0, 1,
-0.6466826, 1.349774, -0.866895, 0.5529412, 1, 0, 1,
-0.6444467, 1.292391, 0.7060093, 0.5490196, 1, 0, 1,
-0.6415256, 0.3649921, -2.529753, 0.5411765, 1, 0, 1,
-0.6406894, -0.07519194, -1.759588, 0.5372549, 1, 0, 1,
-0.6327348, 0.2397348, -1.37703, 0.5294118, 1, 0, 1,
-0.6287777, -0.6856669, -2.098528, 0.5254902, 1, 0, 1,
-0.623171, 0.3540971, -0.2088011, 0.5176471, 1, 0, 1,
-0.6213067, -0.6501471, -3.02217, 0.5137255, 1, 0, 1,
-0.6207344, -0.3610083, -2.449286, 0.5058824, 1, 0, 1,
-0.6142573, 2.162936, 1.276486, 0.5019608, 1, 0, 1,
-0.6136539, -0.01310669, -1.89304, 0.4941176, 1, 0, 1,
-0.6122715, 1.383253, -2.786427, 0.4862745, 1, 0, 1,
-0.6111777, 0.4052461, -0.7909472, 0.4823529, 1, 0, 1,
-0.6074247, -0.9863319, -3.694539, 0.4745098, 1, 0, 1,
-0.6013948, 1.714136, -0.1786797, 0.4705882, 1, 0, 1,
-0.5982417, 0.3119441, -2.374668, 0.4627451, 1, 0, 1,
-0.5948446, 0.8648539, 0.9954491, 0.4588235, 1, 0, 1,
-0.5926401, 0.6329892, 0.2679374, 0.4509804, 1, 0, 1,
-0.5900671, 1.422435, -0.9197806, 0.4470588, 1, 0, 1,
-0.5898886, -0.8923072, -3.827967, 0.4392157, 1, 0, 1,
-0.589727, 0.1909546, -0.5433778, 0.4352941, 1, 0, 1,
-0.5879174, 0.8450533, 0.4701067, 0.427451, 1, 0, 1,
-0.5858614, 1.325993, 0.2542239, 0.4235294, 1, 0, 1,
-0.5856242, -1.260883, -2.000103, 0.4156863, 1, 0, 1,
-0.5842212, 0.06122304, -1.233295, 0.4117647, 1, 0, 1,
-0.5799417, -0.7918264, -2.689639, 0.4039216, 1, 0, 1,
-0.5742978, 0.6977225, 0.7968322, 0.3960784, 1, 0, 1,
-0.5738451, 0.8127339, 0.869478, 0.3921569, 1, 0, 1,
-0.5711145, -0.8858972, -1.827991, 0.3843137, 1, 0, 1,
-0.5708182, 1.55335, -0.5389339, 0.3803922, 1, 0, 1,
-0.5705352, 0.2986605, -1.025626, 0.372549, 1, 0, 1,
-0.5666346, -1.070174, -3.178044, 0.3686275, 1, 0, 1,
-0.5648788, 0.6051305, -1.064414, 0.3607843, 1, 0, 1,
-0.5603891, 0.7523237, 0.4203363, 0.3568628, 1, 0, 1,
-0.5599853, 0.6508605, -1.177377, 0.3490196, 1, 0, 1,
-0.5585911, -0.4891223, -2.458853, 0.345098, 1, 0, 1,
-0.5568873, -0.01508027, -1.525056, 0.3372549, 1, 0, 1,
-0.5548015, -0.9589826, -3.240885, 0.3333333, 1, 0, 1,
-0.5545326, 0.7678744, -0.157721, 0.3254902, 1, 0, 1,
-0.5538275, -1.16571, -2.21859, 0.3215686, 1, 0, 1,
-0.548305, -0.9030921, -2.741771, 0.3137255, 1, 0, 1,
-0.5423964, 0.1605309, -0.6162422, 0.3098039, 1, 0, 1,
-0.5372665, -1.148036, -2.505604, 0.3019608, 1, 0, 1,
-0.5310183, -1.567899, -2.93524, 0.2941177, 1, 0, 1,
-0.5295509, -0.1171501, -1.266216, 0.2901961, 1, 0, 1,
-0.5275231, 0.4202723, 0.2002105, 0.282353, 1, 0, 1,
-0.5274594, 1.237698, 1.369161, 0.2784314, 1, 0, 1,
-0.5252464, -2.642143, -2.024166, 0.2705882, 1, 0, 1,
-0.5248963, -1.356177, -2.909668, 0.2666667, 1, 0, 1,
-0.5238694, -0.6870512, -4.37686, 0.2588235, 1, 0, 1,
-0.5213389, 0.7199022, 1.005015, 0.254902, 1, 0, 1,
-0.5163953, -0.5273477, -3.446312, 0.2470588, 1, 0, 1,
-0.515037, -1.695815, -1.638522, 0.2431373, 1, 0, 1,
-0.5150011, -0.08066356, -1.999986, 0.2352941, 1, 0, 1,
-0.513848, -2.132268, -2.741305, 0.2313726, 1, 0, 1,
-0.5131362, 1.492354, -1.129595, 0.2235294, 1, 0, 1,
-0.5087381, -0.7087048, -2.690703, 0.2196078, 1, 0, 1,
-0.5075462, 0.08330821, -0.7470234, 0.2117647, 1, 0, 1,
-0.5042558, -2.006804, -4.157805, 0.2078431, 1, 0, 1,
-0.4957182, 0.5731331, 0.8276678, 0.2, 1, 0, 1,
-0.4901681, 0.4297203, -1.603208, 0.1921569, 1, 0, 1,
-0.4844617, -2.489051, -3.439858, 0.1882353, 1, 0, 1,
-0.4813056, -1.559679, -3.677603, 0.1803922, 1, 0, 1,
-0.4738229, 0.04534092, -1.564729, 0.1764706, 1, 0, 1,
-0.4692462, 0.6206086, -0.1076025, 0.1686275, 1, 0, 1,
-0.4635566, -0.4660105, -1.251494, 0.1647059, 1, 0, 1,
-0.4591022, 0.5014018, -0.2064741, 0.1568628, 1, 0, 1,
-0.4588702, 0.7074571, -1.927135, 0.1529412, 1, 0, 1,
-0.4509572, 1.167127, -0.4769219, 0.145098, 1, 0, 1,
-0.4500217, 1.381861, -1.064223, 0.1411765, 1, 0, 1,
-0.4487532, 0.5569101, 0.8429148, 0.1333333, 1, 0, 1,
-0.4450988, 0.4604475, 1.802838, 0.1294118, 1, 0, 1,
-0.4434118, -0.7011116, -3.32154, 0.1215686, 1, 0, 1,
-0.4394889, -1.693324, -1.77884, 0.1176471, 1, 0, 1,
-0.4390686, 0.2323775, 0.4785352, 0.1098039, 1, 0, 1,
-0.4381474, 0.3092795, -0.3262848, 0.1058824, 1, 0, 1,
-0.4371185, 0.313098, -0.5970788, 0.09803922, 1, 0, 1,
-0.4364664, -1.316586, -1.688715, 0.09019608, 1, 0, 1,
-0.4303363, -1.397706, -3.948976, 0.08627451, 1, 0, 1,
-0.4262459, -0.2217057, -1.924105, 0.07843138, 1, 0, 1,
-0.4238251, 1.049199, -0.5544748, 0.07450981, 1, 0, 1,
-0.4207326, 0.4951584, -1.018072, 0.06666667, 1, 0, 1,
-0.4157194, 0.1089575, 0.1020971, 0.0627451, 1, 0, 1,
-0.4138704, 0.2350807, -0.3060913, 0.05490196, 1, 0, 1,
-0.4089748, 1.702393, -0.4819714, 0.05098039, 1, 0, 1,
-0.4089356, 1.167657, 0.813459, 0.04313726, 1, 0, 1,
-0.4087422, 1.094616, -1.440206, 0.03921569, 1, 0, 1,
-0.4049852, -1.484855, -3.399584, 0.03137255, 1, 0, 1,
-0.4038845, 1.83214, -1.880969, 0.02745098, 1, 0, 1,
-0.3991185, 0.03378722, 1.106978, 0.01960784, 1, 0, 1,
-0.3918077, 0.2324373, -0.71478, 0.01568628, 1, 0, 1,
-0.3840248, 0.2644608, 1.316465, 0.007843138, 1, 0, 1,
-0.3771465, -0.1499798, -2.82828, 0.003921569, 1, 0, 1,
-0.3732716, -0.6092412, -2.79819, 0, 1, 0.003921569, 1,
-0.3697255, 0.9182014, -0.8212606, 0, 1, 0.01176471, 1,
-0.3695211, 0.1180687, -1.921152, 0, 1, 0.01568628, 1,
-0.3685715, -1.215666, -1.845667, 0, 1, 0.02352941, 1,
-0.3672982, 0.6867521, -0.6310704, 0, 1, 0.02745098, 1,
-0.3668454, 1.051385, -0.547168, 0, 1, 0.03529412, 1,
-0.3645639, -2.076093, -4.146161, 0, 1, 0.03921569, 1,
-0.3642251, -0.9477195, -1.757935, 0, 1, 0.04705882, 1,
-0.3641694, -1.14552, -3.008802, 0, 1, 0.05098039, 1,
-0.3629225, 1.196923, 0.6898611, 0, 1, 0.05882353, 1,
-0.3604031, -1.090747, -4.426187, 0, 1, 0.0627451, 1,
-0.360035, -0.7134064, -3.08532, 0, 1, 0.07058824, 1,
-0.3593803, -1.29558, -1.944857, 0, 1, 0.07450981, 1,
-0.3569629, -1.3097, -1.866507, 0, 1, 0.08235294, 1,
-0.3518339, 0.7395993, -1.104373, 0, 1, 0.08627451, 1,
-0.3513342, 1.631168, 1.706848, 0, 1, 0.09411765, 1,
-0.3512535, -0.6025306, -3.417085, 0, 1, 0.1019608, 1,
-0.3503674, 0.02425957, 0.3726389, 0, 1, 0.1058824, 1,
-0.3455393, 0.1794014, -1.965487, 0, 1, 0.1137255, 1,
-0.3438202, 0.7655565, -0.7859918, 0, 1, 0.1176471, 1,
-0.3418964, -0.008838277, -2.332914, 0, 1, 0.1254902, 1,
-0.3397981, -0.1416475, -0.6726074, 0, 1, 0.1294118, 1,
-0.3396828, -0.8023139, -2.316912, 0, 1, 0.1372549, 1,
-0.3392383, -1.382831, -2.786998, 0, 1, 0.1411765, 1,
-0.3392356, 0.9030429, -0.443641, 0, 1, 0.1490196, 1,
-0.3343775, -1.685716, -1.691692, 0, 1, 0.1529412, 1,
-0.3297186, 0.653044, -2.037155, 0, 1, 0.1607843, 1,
-0.3264951, -1.53497, -1.814651, 0, 1, 0.1647059, 1,
-0.3263164, -1.242633, -4.191185, 0, 1, 0.172549, 1,
-0.3243268, -0.0876938, -2.128983, 0, 1, 0.1764706, 1,
-0.3121839, -1.353469, -4.258519, 0, 1, 0.1843137, 1,
-0.3058976, 1.010469, -0.3674349, 0, 1, 0.1882353, 1,
-0.305466, 1.174, 0.3614541, 0, 1, 0.1960784, 1,
-0.3021997, 0.1411037, -0.932014, 0, 1, 0.2039216, 1,
-0.3007505, -0.2512912, -3.238795, 0, 1, 0.2078431, 1,
-0.300417, 1.156798, -0.1115814, 0, 1, 0.2156863, 1,
-0.2944016, 2.676976, -0.05994783, 0, 1, 0.2196078, 1,
-0.2875533, -1.354702, -2.050943, 0, 1, 0.227451, 1,
-0.2842812, 0.5520917, -0.4490158, 0, 1, 0.2313726, 1,
-0.2754515, 0.8559895, 0.3440454, 0, 1, 0.2392157, 1,
-0.2657541, -0.2515281, -0.8102651, 0, 1, 0.2431373, 1,
-0.2614979, 0.1309223, 0.4210364, 0, 1, 0.2509804, 1,
-0.2605977, 1.11766, -0.8788912, 0, 1, 0.254902, 1,
-0.2585377, -0.1729343, -2.617704, 0, 1, 0.2627451, 1,
-0.2556605, 0.1832035, -1.05442, 0, 1, 0.2666667, 1,
-0.2554932, 1.981513, -1.400991, 0, 1, 0.2745098, 1,
-0.2518588, -0.910178, -3.832488, 0, 1, 0.2784314, 1,
-0.2470843, -1.173737, -2.516541, 0, 1, 0.2862745, 1,
-0.2468817, 1.330973, -1.005249, 0, 1, 0.2901961, 1,
-0.2466431, -0.6406895, -2.429137, 0, 1, 0.2980392, 1,
-0.2447753, 1.297521, 0.2374571, 0, 1, 0.3058824, 1,
-0.2430042, -2.496758, -3.574236, 0, 1, 0.3098039, 1,
-0.2429882, 0.5531881, -0.08336591, 0, 1, 0.3176471, 1,
-0.2429547, -0.3338263, -1.661475, 0, 1, 0.3215686, 1,
-0.2404296, 1.025922, -0.07672852, 0, 1, 0.3294118, 1,
-0.2402122, -0.6565669, -3.575629, 0, 1, 0.3333333, 1,
-0.2389564, 0.2000167, -1.418441, 0, 1, 0.3411765, 1,
-0.2333989, -0.4865196, -3.748046, 0, 1, 0.345098, 1,
-0.2287065, -0.3751262, -1.046135, 0, 1, 0.3529412, 1,
-0.2285252, 0.5136303, 0.256114, 0, 1, 0.3568628, 1,
-0.2283087, -0.4764093, -3.642702, 0, 1, 0.3647059, 1,
-0.2235789, 1.062743, -0.1639221, 0, 1, 0.3686275, 1,
-0.2190076, 0.2044822, -0.6234437, 0, 1, 0.3764706, 1,
-0.2143314, -1.492729, -4.055133, 0, 1, 0.3803922, 1,
-0.2108356, -0.3950412, -3.297435, 0, 1, 0.3882353, 1,
-0.2103949, -0.6872041, -2.191188, 0, 1, 0.3921569, 1,
-0.2089595, -0.5914256, -4.139053, 0, 1, 0.4, 1,
-0.1978649, 0.1624334, -2.955651, 0, 1, 0.4078431, 1,
-0.1966089, -0.5270168, -3.395386, 0, 1, 0.4117647, 1,
-0.196343, -0.788098, -3.109478, 0, 1, 0.4196078, 1,
-0.1956404, 1.198621, -1.006791, 0, 1, 0.4235294, 1,
-0.1935801, -1.477744, -3.371718, 0, 1, 0.4313726, 1,
-0.1929619, 0.2947881, 0.3485445, 0, 1, 0.4352941, 1,
-0.1845794, -1.016748, -2.508655, 0, 1, 0.4431373, 1,
-0.1842006, -0.279117, -1.435859, 0, 1, 0.4470588, 1,
-0.1824873, -0.5413051, -1.427005, 0, 1, 0.454902, 1,
-0.1823114, 0.3600256, -1.150584, 0, 1, 0.4588235, 1,
-0.1776489, -0.633232, -1.396736, 0, 1, 0.4666667, 1,
-0.1760338, -0.2676472, -2.680242, 0, 1, 0.4705882, 1,
-0.1758412, -0.4284728, -0.7998752, 0, 1, 0.4784314, 1,
-0.1756453, -1.303878, -3.499234, 0, 1, 0.4823529, 1,
-0.1749868, 0.7817025, -0.7434264, 0, 1, 0.4901961, 1,
-0.1735629, 0.1875056, -0.5009214, 0, 1, 0.4941176, 1,
-0.1710851, -1.811658, -2.521681, 0, 1, 0.5019608, 1,
-0.1704244, -0.8119482, -1.151736, 0, 1, 0.509804, 1,
-0.1688922, -2.096495, -1.438096, 0, 1, 0.5137255, 1,
-0.1684391, -0.06597947, -3.052809, 0, 1, 0.5215687, 1,
-0.1663846, -0.4708197, -4.298163, 0, 1, 0.5254902, 1,
-0.1645107, 1.871882, -0.9575791, 0, 1, 0.5333334, 1,
-0.1572972, -0.689889, -4.456189, 0, 1, 0.5372549, 1,
-0.1536191, -0.1793502, -3.235827, 0, 1, 0.5450981, 1,
-0.1526016, 1.198577, -0.6424262, 0, 1, 0.5490196, 1,
-0.1477702, 1.949779, 2.504333, 0, 1, 0.5568628, 1,
-0.1367098, 1.413981, -1.154627, 0, 1, 0.5607843, 1,
-0.1362212, -0.1454092, -1.773611, 0, 1, 0.5686275, 1,
-0.1355146, 0.7336189, -1.097195, 0, 1, 0.572549, 1,
-0.1333654, 0.2131015, -1.434026, 0, 1, 0.5803922, 1,
-0.1321787, -1.06582, -1.427105, 0, 1, 0.5843138, 1,
-0.1293612, 1.08262, -0.3300411, 0, 1, 0.5921569, 1,
-0.1264028, -0.1046381, -2.101153, 0, 1, 0.5960785, 1,
-0.1254666, 0.1477354, -1.244309, 0, 1, 0.6039216, 1,
-0.1247438, 1.985641, 0.1040786, 0, 1, 0.6117647, 1,
-0.1214661, -0.7146357, -4.387243, 0, 1, 0.6156863, 1,
-0.1209255, -0.2790396, -3.208664, 0, 1, 0.6235294, 1,
-0.1198129, 1.526748, -0.1555386, 0, 1, 0.627451, 1,
-0.1191021, 0.1243895, -0.5560732, 0, 1, 0.6352941, 1,
-0.1160832, -0.0986276, -3.287907, 0, 1, 0.6392157, 1,
-0.1143375, -1.238487, -1.681017, 0, 1, 0.6470588, 1,
-0.113556, -0.01090713, -3.039265, 0, 1, 0.6509804, 1,
-0.112401, 0.3764334, -0.4582999, 0, 1, 0.6588235, 1,
-0.111705, 0.4475637, -0.5077943, 0, 1, 0.6627451, 1,
-0.1087501, -0.4972726, -2.313763, 0, 1, 0.6705883, 1,
-0.1062568, -0.3670736, -1.594039, 0, 1, 0.6745098, 1,
-0.1053095, 1.01188, 0.005245889, 0, 1, 0.682353, 1,
-0.1038472, -0.7127726, -3.436082, 0, 1, 0.6862745, 1,
-0.1033385, -1.036322, -2.742329, 0, 1, 0.6941177, 1,
-0.1026921, -0.759325, -4.846317, 0, 1, 0.7019608, 1,
-0.1024224, -0.144935, -1.872306, 0, 1, 0.7058824, 1,
-0.09314795, 0.6532096, -0.5416253, 0, 1, 0.7137255, 1,
-0.09233096, -1.739596, -1.939904, 0, 1, 0.7176471, 1,
-0.08986153, 1.399669, -0.7423917, 0, 1, 0.7254902, 1,
-0.08809287, 0.4042101, -0.7107284, 0, 1, 0.7294118, 1,
-0.08657163, -0.6868086, -0.6623443, 0, 1, 0.7372549, 1,
-0.08578177, -0.6980056, -3.720323, 0, 1, 0.7411765, 1,
-0.08371003, -0.301855, -3.401731, 0, 1, 0.7490196, 1,
-0.07750118, -1.11287, -0.6647265, 0, 1, 0.7529412, 1,
-0.07634921, -1.824291, -3.971141, 0, 1, 0.7607843, 1,
-0.07616386, -1.488418, -3.32335, 0, 1, 0.7647059, 1,
-0.0738758, 0.3656054, 1.625283, 0, 1, 0.772549, 1,
-0.07243735, -1.062526, -1.945013, 0, 1, 0.7764706, 1,
-0.07016635, 0.2175926, 0.2308193, 0, 1, 0.7843137, 1,
-0.06726269, 0.2638338, 0.9217819, 0, 1, 0.7882353, 1,
-0.0604027, -0.8320187, -3.106992, 0, 1, 0.7960784, 1,
-0.05927346, -0.01338539, -2.756726, 0, 1, 0.8039216, 1,
-0.05428686, -0.8407977, -4.294534, 0, 1, 0.8078431, 1,
-0.0519366, 1.039744, -0.397023, 0, 1, 0.8156863, 1,
-0.05092502, 0.5306364, -0.04480115, 0, 1, 0.8196079, 1,
-0.0502867, 0.9420852, -0.03428702, 0, 1, 0.827451, 1,
-0.05007346, -2.029032, -3.526382, 0, 1, 0.8313726, 1,
-0.04925863, -0.3764285, -2.501049, 0, 1, 0.8392157, 1,
-0.04392327, 0.8709074, -1.033717, 0, 1, 0.8431373, 1,
-0.04319809, 0.5739737, -0.1417101, 0, 1, 0.8509804, 1,
-0.04015492, -1.923284, -0.6152837, 0, 1, 0.854902, 1,
-0.03899198, -0.3544392, -5.083523, 0, 1, 0.8627451, 1,
-0.03811755, 0.2627161, -0.8959246, 0, 1, 0.8666667, 1,
-0.03209907, 0.08160905, 0.04774123, 0, 1, 0.8745098, 1,
-0.03155, -0.9251365, -2.476023, 0, 1, 0.8784314, 1,
-0.02420614, -1.49881, -3.164804, 0, 1, 0.8862745, 1,
-0.02306115, -0.4694959, -1.933416, 0, 1, 0.8901961, 1,
-0.01842606, 1.565926, -0.826543, 0, 1, 0.8980392, 1,
-0.01766589, -0.7638536, -1.172399, 0, 1, 0.9058824, 1,
-0.0170538, 0.6797315, -0.07314631, 0, 1, 0.9098039, 1,
-0.01204445, -0.195813, -2.525499, 0, 1, 0.9176471, 1,
-0.007751203, 0.4638895, 0.9036514, 0, 1, 0.9215686, 1,
-0.00560673, 0.4101585, -1.320571, 0, 1, 0.9294118, 1,
-0.001904075, 0.6643625, 0.6523802, 0, 1, 0.9333333, 1,
0.0001162565, -0.01742505, 5.248248, 0, 1, 0.9411765, 1,
0.001719846, -0.7880779, 1.845819, 0, 1, 0.945098, 1,
0.003175295, -0.445014, 2.792036, 0, 1, 0.9529412, 1,
0.01039432, 0.09374548, 1.012636, 0, 1, 0.9568627, 1,
0.01277138, -0.6291643, 2.326848, 0, 1, 0.9647059, 1,
0.01625266, 0.3579898, -1.956427, 0, 1, 0.9686275, 1,
0.0169726, 1.692034, 0.2445255, 0, 1, 0.9764706, 1,
0.02625442, 0.6444947, 0.9033117, 0, 1, 0.9803922, 1,
0.03207464, -0.07789978, 4.278493, 0, 1, 0.9882353, 1,
0.0335571, -0.2482696, 3.419168, 0, 1, 0.9921569, 1,
0.03520099, -0.3733109, 1.815395, 0, 1, 1, 1,
0.03579355, -0.9129454, 3.322865, 0, 0.9921569, 1, 1,
0.0378232, -0.6418903, 3.481135, 0, 0.9882353, 1, 1,
0.0387932, 0.2221438, -0.03638709, 0, 0.9803922, 1, 1,
0.0428849, 0.6307939, 1.710068, 0, 0.9764706, 1, 1,
0.05078482, 0.7275875, 0.9703218, 0, 0.9686275, 1, 1,
0.05522475, 0.7159289, 0.6983572, 0, 0.9647059, 1, 1,
0.05739912, 0.4248199, -0.9908996, 0, 0.9568627, 1, 1,
0.05778751, 0.222112, -1.061577, 0, 0.9529412, 1, 1,
0.06644227, -1.250719, 2.387235, 0, 0.945098, 1, 1,
0.06757428, 1.023153, 0.577679, 0, 0.9411765, 1, 1,
0.07302292, -0.1757525, 2.376623, 0, 0.9333333, 1, 1,
0.07346066, 1.286475, -0.6561536, 0, 0.9294118, 1, 1,
0.07661236, 1.277767, 1.045383, 0, 0.9215686, 1, 1,
0.07989312, -1.017442, 2.2201, 0, 0.9176471, 1, 1,
0.08036543, -0.7093881, 2.067277, 0, 0.9098039, 1, 1,
0.08190186, 1.418032, 0.280364, 0, 0.9058824, 1, 1,
0.08344184, 0.06281943, 0.7289404, 0, 0.8980392, 1, 1,
0.08464945, -1.993053, 4.044116, 0, 0.8901961, 1, 1,
0.09535237, 1.629278, -1.22161, 0, 0.8862745, 1, 1,
0.09676301, 0.8145602, 0.8406205, 0, 0.8784314, 1, 1,
0.09917744, -1.262139, 2.462671, 0, 0.8745098, 1, 1,
0.1012844, -0.862841, 2.810072, 0, 0.8666667, 1, 1,
0.1062964, 0.2813331, 0.6486189, 0, 0.8627451, 1, 1,
0.1081275, 0.7753741, 0.3254275, 0, 0.854902, 1, 1,
0.1092516, 0.930744, 0.7715021, 0, 0.8509804, 1, 1,
0.1096862, -1.712191, 0.9644244, 0, 0.8431373, 1, 1,
0.1106722, -1.468846, 3.571246, 0, 0.8392157, 1, 1,
0.1130924, -1.553336, 3.470839, 0, 0.8313726, 1, 1,
0.1132084, -0.4993747, 2.665841, 0, 0.827451, 1, 1,
0.1147238, -1.586988, 4.102719, 0, 0.8196079, 1, 1,
0.1218292, -0.119207, 4.949169, 0, 0.8156863, 1, 1,
0.1240752, 0.2218216, 0.6995621, 0, 0.8078431, 1, 1,
0.1252686, -1.967028, 1.722295, 0, 0.8039216, 1, 1,
0.1254594, -1.53081, 2.87938, 0, 0.7960784, 1, 1,
0.1275122, -0.1981816, 1.400957, 0, 0.7882353, 1, 1,
0.1331904, -1.024964, 3.100996, 0, 0.7843137, 1, 1,
0.1392955, -0.7102036, 2.621919, 0, 0.7764706, 1, 1,
0.1396305, 1.688086, -0.7246746, 0, 0.772549, 1, 1,
0.1422312, 0.1708146, 2.425911, 0, 0.7647059, 1, 1,
0.1445135, -0.4751172, 2.106203, 0, 0.7607843, 1, 1,
0.1476207, -0.5796148, 2.428021, 0, 0.7529412, 1, 1,
0.1527706, -0.3591262, 3.101949, 0, 0.7490196, 1, 1,
0.1536095, -1.602401, 2.502307, 0, 0.7411765, 1, 1,
0.1543745, -0.7231967, 4.359053, 0, 0.7372549, 1, 1,
0.1576683, -1.013023, 2.464158, 0, 0.7294118, 1, 1,
0.1601184, 0.3574185, 1.957722, 0, 0.7254902, 1, 1,
0.1612173, 0.2012949, -0.5863576, 0, 0.7176471, 1, 1,
0.1637397, 3.499713, 2.577931, 0, 0.7137255, 1, 1,
0.1706428, 0.3553299, 0.303382, 0, 0.7058824, 1, 1,
0.1707449, -1.247001, 1.387105, 0, 0.6980392, 1, 1,
0.1731786, -1.352496, 1.358461, 0, 0.6941177, 1, 1,
0.1837576, -0.5557608, 2.027735, 0, 0.6862745, 1, 1,
0.1876267, -0.5353575, 4.717491, 0, 0.682353, 1, 1,
0.1883713, -0.1279551, 3.292398, 0, 0.6745098, 1, 1,
0.1915016, -0.5511013, 1.995153, 0, 0.6705883, 1, 1,
0.1974965, 0.9853632, 1.712355, 0, 0.6627451, 1, 1,
0.1982272, -1.037427, 2.667145, 0, 0.6588235, 1, 1,
0.1986696, 1.184651, -0.6987606, 0, 0.6509804, 1, 1,
0.1991135, -1.233448, 2.756236, 0, 0.6470588, 1, 1,
0.1994866, 2.398552, -0.5794897, 0, 0.6392157, 1, 1,
0.206275, 0.4656937, 0.9777483, 0, 0.6352941, 1, 1,
0.2093816, -0.2464207, 3.610985, 0, 0.627451, 1, 1,
0.2099017, -1.01922, 2.55128, 0, 0.6235294, 1, 1,
0.2163557, -0.7918824, 3.094382, 0, 0.6156863, 1, 1,
0.2181976, -1.57125, 2.844426, 0, 0.6117647, 1, 1,
0.218224, 1.976488, 0.5452069, 0, 0.6039216, 1, 1,
0.2183458, 1.519478, 1.421544, 0, 0.5960785, 1, 1,
0.2185817, 0.6129065, 1.118247, 0, 0.5921569, 1, 1,
0.2236826, 1.982018, 0.234219, 0, 0.5843138, 1, 1,
0.224487, -0.5328285, 2.247805, 0, 0.5803922, 1, 1,
0.2245686, 0.6590542, -0.2732527, 0, 0.572549, 1, 1,
0.2269056, -0.8990483, 2.615632, 0, 0.5686275, 1, 1,
0.2288938, -0.1339351, 1.287508, 0, 0.5607843, 1, 1,
0.2308549, -0.2609074, 2.270787, 0, 0.5568628, 1, 1,
0.2337689, -0.388898, 2.587424, 0, 0.5490196, 1, 1,
0.2343085, 0.6381938, 0.1653474, 0, 0.5450981, 1, 1,
0.2352062, 0.5700844, 1.613827, 0, 0.5372549, 1, 1,
0.2355348, -0.9358361, 1.827538, 0, 0.5333334, 1, 1,
0.2412158, 1.972303, 0.6656815, 0, 0.5254902, 1, 1,
0.2491156, -0.01079041, 2.291093, 0, 0.5215687, 1, 1,
0.2495802, -1.80769, 2.554476, 0, 0.5137255, 1, 1,
0.2522246, 0.7344742, -1.021458, 0, 0.509804, 1, 1,
0.2523858, -0.2396862, 1.892916, 0, 0.5019608, 1, 1,
0.2551412, 2.445855, -0.7428038, 0, 0.4941176, 1, 1,
0.2557111, 0.8298786, 1.213848, 0, 0.4901961, 1, 1,
0.2563081, 0.6766956, 1.56814, 0, 0.4823529, 1, 1,
0.2602555, 0.7014356, -0.03969272, 0, 0.4784314, 1, 1,
0.2608113, 0.4429138, 0.3276908, 0, 0.4705882, 1, 1,
0.2649516, -1.030735, 2.517239, 0, 0.4666667, 1, 1,
0.2651722, -0.1554318, 1.582291, 0, 0.4588235, 1, 1,
0.2679955, 1.34101, -0.1387431, 0, 0.454902, 1, 1,
0.2687771, 0.04391176, 1.337228, 0, 0.4470588, 1, 1,
0.2697961, 1.145851, 0.342033, 0, 0.4431373, 1, 1,
0.2710571, -1.338243, 2.271264, 0, 0.4352941, 1, 1,
0.2772352, 3.084056, -2.691429, 0, 0.4313726, 1, 1,
0.2829067, 2.186122, 0.3060545, 0, 0.4235294, 1, 1,
0.2893415, -0.2060465, 1.07328, 0, 0.4196078, 1, 1,
0.2948538, 2.047752, 0.4859486, 0, 0.4117647, 1, 1,
0.2960923, 0.6964894, -1.097666, 0, 0.4078431, 1, 1,
0.2994437, -0.7739742, 2.633974, 0, 0.4, 1, 1,
0.2997259, 0.9393695, -0.4541176, 0, 0.3921569, 1, 1,
0.3032514, 0.8327362, 1.14269, 0, 0.3882353, 1, 1,
0.3079171, -0.5132862, 1.854866, 0, 0.3803922, 1, 1,
0.308382, 0.7793812, 2.598455, 0, 0.3764706, 1, 1,
0.3085446, -1.394351, 2.677451, 0, 0.3686275, 1, 1,
0.3114245, -0.5185056, 2.982551, 0, 0.3647059, 1, 1,
0.3145972, -0.248705, 2.773766, 0, 0.3568628, 1, 1,
0.3199748, 0.1268968, 1.099308, 0, 0.3529412, 1, 1,
0.3205406, 1.05848, 1.116946, 0, 0.345098, 1, 1,
0.3239692, -0.9263582, 1.194789, 0, 0.3411765, 1, 1,
0.32704, 1.095394, 1.478165, 0, 0.3333333, 1, 1,
0.3279993, -0.03927321, 1.639046, 0, 0.3294118, 1, 1,
0.3341388, 0.7493075, -0.6424884, 0, 0.3215686, 1, 1,
0.3382669, -0.5722554, 3.896575, 0, 0.3176471, 1, 1,
0.3391013, -2.537581, 3.276869, 0, 0.3098039, 1, 1,
0.3398408, -1.457818, 1.940162, 0, 0.3058824, 1, 1,
0.3408131, -0.3467674, 2.676711, 0, 0.2980392, 1, 1,
0.341098, -0.5944341, 2.495082, 0, 0.2901961, 1, 1,
0.3570496, 0.3527123, 0.06425788, 0, 0.2862745, 1, 1,
0.3574148, -0.06885576, 1.978289, 0, 0.2784314, 1, 1,
0.358085, 0.7340764, 0.9654768, 0, 0.2745098, 1, 1,
0.362157, 0.928448, -0.4671709, 0, 0.2666667, 1, 1,
0.3655953, 1.770402, -0.3711881, 0, 0.2627451, 1, 1,
0.3699941, 0.02154956, 0.7473909, 0, 0.254902, 1, 1,
0.3721652, -1.023581, 4.382032, 0, 0.2509804, 1, 1,
0.375179, -0.06944183, 4.406524, 0, 0.2431373, 1, 1,
0.3775326, 0.7290911, -0.573691, 0, 0.2392157, 1, 1,
0.3811803, 0.1891197, 2.248985, 0, 0.2313726, 1, 1,
0.3817328, 1.130694, 0.9822443, 0, 0.227451, 1, 1,
0.3861176, 0.3341825, 1.545165, 0, 0.2196078, 1, 1,
0.4005513, -1.070895, 3.791304, 0, 0.2156863, 1, 1,
0.4066254, 0.8938088, 1.060089, 0, 0.2078431, 1, 1,
0.4071597, 1.453612, 0.6311266, 0, 0.2039216, 1, 1,
0.4079774, 0.6373228, 2.038686, 0, 0.1960784, 1, 1,
0.4093419, -1.685762, 1.156272, 0, 0.1882353, 1, 1,
0.4201204, 1.418669, -0.6940116, 0, 0.1843137, 1, 1,
0.4230789, -0.1100357, -0.05046393, 0, 0.1764706, 1, 1,
0.4271024, 0.4550681, 3.430527, 0, 0.172549, 1, 1,
0.4287193, -0.2561967, 0.3482188, 0, 0.1647059, 1, 1,
0.4309161, -0.2458525, 1.551088, 0, 0.1607843, 1, 1,
0.4309743, -0.257944, 2.174958, 0, 0.1529412, 1, 1,
0.4320049, 0.6955801, 0.06889855, 0, 0.1490196, 1, 1,
0.4337109, -0.6031526, 1.127611, 0, 0.1411765, 1, 1,
0.4367576, 1.253135, 0.1588945, 0, 0.1372549, 1, 1,
0.4445512, -0.6444396, 1.193346, 0, 0.1294118, 1, 1,
0.445824, -0.9124213, 5.140582, 0, 0.1254902, 1, 1,
0.4458298, -0.452956, 2.338464, 0, 0.1176471, 1, 1,
0.4503477, -0.2755566, 3.091288, 0, 0.1137255, 1, 1,
0.4507584, 1.704502, 1.791517, 0, 0.1058824, 1, 1,
0.4520559, -1.534619, 2.67786, 0, 0.09803922, 1, 1,
0.4537108, -0.4642174, 2.964984, 0, 0.09411765, 1, 1,
0.4557357, 1.448482, 1.118626, 0, 0.08627451, 1, 1,
0.4621992, -1.266662, 2.283531, 0, 0.08235294, 1, 1,
0.4625232, -1.448065, 2.278452, 0, 0.07450981, 1, 1,
0.4675587, 1.1206, 0.03876428, 0, 0.07058824, 1, 1,
0.4693264, 0.9627325, 1.798667, 0, 0.0627451, 1, 1,
0.4709891, -1.515024, 3.933572, 0, 0.05882353, 1, 1,
0.4732124, -0.3826856, 2.232831, 0, 0.05098039, 1, 1,
0.4745156, 1.169518, -0.7616509, 0, 0.04705882, 1, 1,
0.4774741, 1.481633, 0.371744, 0, 0.03921569, 1, 1,
0.479239, 0.1253523, -0.2900167, 0, 0.03529412, 1, 1,
0.4808051, 0.8050029, 1.157391, 0, 0.02745098, 1, 1,
0.4813066, 0.620635, -0.06957629, 0, 0.02352941, 1, 1,
0.4817562, -0.2254086, 1.712607, 0, 0.01568628, 1, 1,
0.4831934, -0.01749593, 1.876483, 0, 0.01176471, 1, 1,
0.4843946, -0.4714375, 1.949563, 0, 0.003921569, 1, 1,
0.4849252, -2.151523, 2.627211, 0.003921569, 0, 1, 1,
0.4870252, 0.2948511, -0.8293324, 0.007843138, 0, 1, 1,
0.4871483, -0.9589923, 3.669226, 0.01568628, 0, 1, 1,
0.4886184, -0.02608396, 0.8188375, 0.01960784, 0, 1, 1,
0.4892997, 0.6032865, 0.1528425, 0.02745098, 0, 1, 1,
0.4929402, 1.036909, 0.4971643, 0.03137255, 0, 1, 1,
0.4955474, -0.17569, 1.900583, 0.03921569, 0, 1, 1,
0.5009481, 0.2011312, 1.542271, 0.04313726, 0, 1, 1,
0.5025419, -1.958559, 3.205858, 0.05098039, 0, 1, 1,
0.5038784, 1.218955, 1.321041, 0.05490196, 0, 1, 1,
0.506402, -0.442093, 1.356621, 0.0627451, 0, 1, 1,
0.5110001, -0.5892041, 3.658525, 0.06666667, 0, 1, 1,
0.5115075, -0.9761487, 2.937778, 0.07450981, 0, 1, 1,
0.5189993, -1.50121, 3.482089, 0.07843138, 0, 1, 1,
0.5211655, 1.055273, 0.3070597, 0.08627451, 0, 1, 1,
0.5226644, 0.9768173, -0.1641405, 0.09019608, 0, 1, 1,
0.5226874, 0.9917536, 0.2987764, 0.09803922, 0, 1, 1,
0.5237756, -1.798794, 2.895105, 0.1058824, 0, 1, 1,
0.5244405, -0.5985538, 1.820038, 0.1098039, 0, 1, 1,
0.5266852, 0.5295867, 1.133826, 0.1176471, 0, 1, 1,
0.5289434, 0.4295109, -0.2989513, 0.1215686, 0, 1, 1,
0.530071, 0.4125103, -0.5720212, 0.1294118, 0, 1, 1,
0.5312373, -1.25718, 2.318956, 0.1333333, 0, 1, 1,
0.5312724, 0.7572235, -0.7406241, 0.1411765, 0, 1, 1,
0.5340427, -0.7895675, 2.911211, 0.145098, 0, 1, 1,
0.5351722, -1.081183, 3.062716, 0.1529412, 0, 1, 1,
0.5402692, 0.890614, -0.624229, 0.1568628, 0, 1, 1,
0.5465737, -0.4855243, 3.114733, 0.1647059, 0, 1, 1,
0.5483624, -1.243022, 3.106816, 0.1686275, 0, 1, 1,
0.5500067, 1.14236, -0.1474432, 0.1764706, 0, 1, 1,
0.5540255, 1.208441, -0.08529055, 0.1803922, 0, 1, 1,
0.5559822, 1.128229, 1.144483, 0.1882353, 0, 1, 1,
0.5585011, -1.250344, 1.633428, 0.1921569, 0, 1, 1,
0.5620582, 0.04630183, 2.452174, 0.2, 0, 1, 1,
0.5633116, 0.627325, 1.437065, 0.2078431, 0, 1, 1,
0.5640522, 0.6391687, -1.926138, 0.2117647, 0, 1, 1,
0.5640877, -0.3144555, 1.419453, 0.2196078, 0, 1, 1,
0.5674987, -0.9270521, 2.448998, 0.2235294, 0, 1, 1,
0.5730382, -0.1652759, 1.7774, 0.2313726, 0, 1, 1,
0.5761464, -0.7519268, 3.312724, 0.2352941, 0, 1, 1,
0.57772, -0.5539618, 2.459907, 0.2431373, 0, 1, 1,
0.578288, 0.6850142, 1.214768, 0.2470588, 0, 1, 1,
0.5858163, 0.4644445, -0.6846982, 0.254902, 0, 1, 1,
0.5870857, 0.1421097, 2.476168, 0.2588235, 0, 1, 1,
0.5914614, 1.092079, 1.140561, 0.2666667, 0, 1, 1,
0.5917882, 0.685254, 0.5817281, 0.2705882, 0, 1, 1,
0.5962058, 0.286801, 0.6981758, 0.2784314, 0, 1, 1,
0.6026549, -0.6874959, 1.750714, 0.282353, 0, 1, 1,
0.6052663, -0.4666758, 2.154941, 0.2901961, 0, 1, 1,
0.6063218, -0.7776646, 3.054376, 0.2941177, 0, 1, 1,
0.6065579, -1.80725, 1.579861, 0.3019608, 0, 1, 1,
0.6085197, -0.9289781, 3.165259, 0.3098039, 0, 1, 1,
0.6109233, -0.3000754, 1.183749, 0.3137255, 0, 1, 1,
0.6117135, 0.0468012, 1.692473, 0.3215686, 0, 1, 1,
0.6194518, -1.249249, 2.184459, 0.3254902, 0, 1, 1,
0.6197116, -0.4689353, 2.13236, 0.3333333, 0, 1, 1,
0.6233176, 0.2024998, 1.303687, 0.3372549, 0, 1, 1,
0.6240984, -0.4377841, 3.052752, 0.345098, 0, 1, 1,
0.6287844, 1.231665, -0.2928937, 0.3490196, 0, 1, 1,
0.6293831, 1.224435, -1.057729, 0.3568628, 0, 1, 1,
0.6333204, -1.531037, 2.579414, 0.3607843, 0, 1, 1,
0.6421589, -1.040769, 0.9919513, 0.3686275, 0, 1, 1,
0.6429714, 0.8917019, 0.3728141, 0.372549, 0, 1, 1,
0.6494991, 0.02556855, 2.112808, 0.3803922, 0, 1, 1,
0.6538398, -0.8430454, 1.438178, 0.3843137, 0, 1, 1,
0.656033, 0.4387867, 0.001843804, 0.3921569, 0, 1, 1,
0.6576023, 0.6564708, 1.254968, 0.3960784, 0, 1, 1,
0.6658279, -2.068191, 2.504203, 0.4039216, 0, 1, 1,
0.6792243, -0.2983936, 0.8135218, 0.4117647, 0, 1, 1,
0.6819817, -0.5237007, 1.74969, 0.4156863, 0, 1, 1,
0.6845235, 1.062732, -0.09766597, 0.4235294, 0, 1, 1,
0.684905, -0.3833332, 2.089121, 0.427451, 0, 1, 1,
0.6851388, 1.419999, -0.3909797, 0.4352941, 0, 1, 1,
0.6855198, -0.5782661, 1.403713, 0.4392157, 0, 1, 1,
0.6946744, 1.190588, 0.6534677, 0.4470588, 0, 1, 1,
0.7038165, 0.1145882, 0.9279437, 0.4509804, 0, 1, 1,
0.70419, 1.16014, 0.6187817, 0.4588235, 0, 1, 1,
0.7067425, -1.472235, 1.917575, 0.4627451, 0, 1, 1,
0.711839, 0.2111406, 1.699229, 0.4705882, 0, 1, 1,
0.7155569, 0.2188369, 3.402991, 0.4745098, 0, 1, 1,
0.7307972, 0.8485761, 2.066234, 0.4823529, 0, 1, 1,
0.731407, 0.5264068, 0.06558987, 0.4862745, 0, 1, 1,
0.7347742, -1.324315, 2.492218, 0.4941176, 0, 1, 1,
0.7354987, 0.1372716, 1.336071, 0.5019608, 0, 1, 1,
0.7393113, 1.5886, 0.3332814, 0.5058824, 0, 1, 1,
0.7399852, -1.042975, 2.038901, 0.5137255, 0, 1, 1,
0.7399977, 0.08916046, 1.894772, 0.5176471, 0, 1, 1,
0.7422103, 1.092383, 2.324047, 0.5254902, 0, 1, 1,
0.7528482, -0.6196385, 1.323855, 0.5294118, 0, 1, 1,
0.7562715, 0.09818661, 1.98201, 0.5372549, 0, 1, 1,
0.7579204, -0.7563095, 0.6161796, 0.5411765, 0, 1, 1,
0.758246, 1.096726, 1.08403, 0.5490196, 0, 1, 1,
0.7622995, -0.02856012, 2.423727, 0.5529412, 0, 1, 1,
0.7628244, 0.2315679, 0.419046, 0.5607843, 0, 1, 1,
0.764724, -1.663249, 1.876786, 0.5647059, 0, 1, 1,
0.7665879, 0.2613021, -0.07004134, 0.572549, 0, 1, 1,
0.7712181, -0.5225134, 3.187955, 0.5764706, 0, 1, 1,
0.7774571, 1.010703, 1.471904, 0.5843138, 0, 1, 1,
0.7795496, 0.01709499, 0.8180137, 0.5882353, 0, 1, 1,
0.7826414, 0.6420532, 1.618233, 0.5960785, 0, 1, 1,
0.7830359, -1.140048, 3.248921, 0.6039216, 0, 1, 1,
0.783209, -0.3400977, 0.3178145, 0.6078432, 0, 1, 1,
0.7850342, -1.51251, 4.102317, 0.6156863, 0, 1, 1,
0.7859187, -0.01164908, 0.6035553, 0.6196079, 0, 1, 1,
0.7881839, -1.045386, 0.9835404, 0.627451, 0, 1, 1,
0.7889206, -0.8250305, 2.603342, 0.6313726, 0, 1, 1,
0.789703, -0.1554285, 1.467396, 0.6392157, 0, 1, 1,
0.7902356, -1.559624, 2.330349, 0.6431373, 0, 1, 1,
0.7946337, 0.3329751, 1.970541, 0.6509804, 0, 1, 1,
0.7956256, -0.6534734, 1.386711, 0.654902, 0, 1, 1,
0.8026984, -0.2745219, -0.2806353, 0.6627451, 0, 1, 1,
0.8081611, -0.3253821, 0.8525281, 0.6666667, 0, 1, 1,
0.8169139, 0.5712118, 1.227632, 0.6745098, 0, 1, 1,
0.8187187, -1.174846, 3.932575, 0.6784314, 0, 1, 1,
0.8201979, -0.3449322, 1.397741, 0.6862745, 0, 1, 1,
0.8265476, -1.358074, 2.828943, 0.6901961, 0, 1, 1,
0.8273256, -1.269544, 2.571633, 0.6980392, 0, 1, 1,
0.8287596, -0.007756683, 1.82344, 0.7058824, 0, 1, 1,
0.8333465, 1.385184, -0.8917764, 0.7098039, 0, 1, 1,
0.8386833, 0.6458619, 0.03732002, 0.7176471, 0, 1, 1,
0.8391038, 1.076007, 0.7030523, 0.7215686, 0, 1, 1,
0.8409178, 0.6469628, 0.4476363, 0.7294118, 0, 1, 1,
0.8468871, 0.3773164, 0.2394624, 0.7333333, 0, 1, 1,
0.8479923, 0.794935, 2.048595, 0.7411765, 0, 1, 1,
0.853066, -1.46991, 3.481432, 0.7450981, 0, 1, 1,
0.8543997, -1.758039, 2.381866, 0.7529412, 0, 1, 1,
0.8552253, 0.1338913, 1.79476, 0.7568628, 0, 1, 1,
0.8595749, -1.629782, 4.138751, 0.7647059, 0, 1, 1,
0.8629869, 0.1255054, 0.7927027, 0.7686275, 0, 1, 1,
0.8668693, 0.8820487, 0.2064579, 0.7764706, 0, 1, 1,
0.8684757, 0.7319055, 1.875113, 0.7803922, 0, 1, 1,
0.8699552, -0.9343557, 2.271692, 0.7882353, 0, 1, 1,
0.8737543, -0.4027427, 3.215021, 0.7921569, 0, 1, 1,
0.8815485, -1.646491, 2.934896, 0.8, 0, 1, 1,
0.8949234, 0.4843538, 1.285812, 0.8078431, 0, 1, 1,
0.8977606, -1.346216, 3.36624, 0.8117647, 0, 1, 1,
0.9045665, 1.094128, 2.008106, 0.8196079, 0, 1, 1,
0.9057311, -0.5255066, 3.913583, 0.8235294, 0, 1, 1,
0.9063388, 0.01706144, 0.06758447, 0.8313726, 0, 1, 1,
0.9097198, 0.8891471, -0.01203116, 0.8352941, 0, 1, 1,
0.9097791, 1.440311, 1.049303, 0.8431373, 0, 1, 1,
0.9189489, -0.5672245, 2.921758, 0.8470588, 0, 1, 1,
0.9208243, 0.3568065, 1.222788, 0.854902, 0, 1, 1,
0.9225836, -2.48155, 2.153939, 0.8588235, 0, 1, 1,
0.9235111, -1.216891, 3.732352, 0.8666667, 0, 1, 1,
0.9287707, 0.4987289, 1.719891, 0.8705882, 0, 1, 1,
0.9289896, -1.944685, 2.319203, 0.8784314, 0, 1, 1,
0.9296739, -0.366279, 1.67342, 0.8823529, 0, 1, 1,
0.9304628, -1.241767, 1.178405, 0.8901961, 0, 1, 1,
0.9347175, 1.666557, 1.351573, 0.8941177, 0, 1, 1,
0.9449241, -1.02056, 2.246936, 0.9019608, 0, 1, 1,
0.9482514, 0.8889058, -0.3185054, 0.9098039, 0, 1, 1,
0.9518264, -1.032949, 2.123553, 0.9137255, 0, 1, 1,
0.9524686, 0.563975, 0.1907939, 0.9215686, 0, 1, 1,
0.9549669, -0.6567491, 3.163157, 0.9254902, 0, 1, 1,
0.960391, -0.7116169, 2.84171, 0.9333333, 0, 1, 1,
0.9606351, -0.0241905, 0.9402047, 0.9372549, 0, 1, 1,
0.9658143, 1.114742, -0.5159242, 0.945098, 0, 1, 1,
0.9693173, -0.8025882, 0.9927357, 0.9490196, 0, 1, 1,
0.9693448, -0.7225908, 1.812868, 0.9568627, 0, 1, 1,
0.9717872, -0.05594651, 0.8564738, 0.9607843, 0, 1, 1,
0.9718491, 0.9138541, 0.7287605, 0.9686275, 0, 1, 1,
0.9721256, 1.44668, 1.761582, 0.972549, 0, 1, 1,
0.9734634, 1.707726, 0.3641797, 0.9803922, 0, 1, 1,
0.9754027, -1.218314, 2.804404, 0.9843137, 0, 1, 1,
0.9775968, 0.8733206, -0.3953933, 0.9921569, 0, 1, 1,
0.9776676, -0.948689, 2.898808, 0.9960784, 0, 1, 1,
0.9886566, -1.094834, 3.134005, 1, 0, 0.9960784, 1,
0.9919187, -1.309919, 2.875394, 1, 0, 0.9882353, 1,
0.9945038, 1.153491, 0.3893435, 1, 0, 0.9843137, 1,
0.9986152, 1.154838, 0.4169359, 1, 0, 0.9764706, 1,
1.00172, -2.569708, 3.510463, 1, 0, 0.972549, 1,
1.009098, 1.720878, 1.288113, 1, 0, 0.9647059, 1,
1.017576, -1.222779, 3.432496, 1, 0, 0.9607843, 1,
1.020838, 0.1000633, 2.377612, 1, 0, 0.9529412, 1,
1.021866, -0.7797195, 0.8472285, 1, 0, 0.9490196, 1,
1.024889, -0.4143271, 1.804001, 1, 0, 0.9411765, 1,
1.026886, 0.07762247, 1.244382, 1, 0, 0.9372549, 1,
1.032352, -0.9785628, 1.141849, 1, 0, 0.9294118, 1,
1.036859, 0.4517574, -0.09194831, 1, 0, 0.9254902, 1,
1.038867, -1.028552, 4.89042, 1, 0, 0.9176471, 1,
1.046585, 1.080861, 1.744373, 1, 0, 0.9137255, 1,
1.048442, 1.07233, -0.1541419, 1, 0, 0.9058824, 1,
1.048538, 0.7177001, 3.698586, 1, 0, 0.9019608, 1,
1.050468, 0.7913235, 1.52696, 1, 0, 0.8941177, 1,
1.053296, -0.1028157, 1.02214, 1, 0, 0.8862745, 1,
1.053331, 0.8339795, 1.820797, 1, 0, 0.8823529, 1,
1.057504, -0.1005315, 2.513016, 1, 0, 0.8745098, 1,
1.064663, -1.12531, 3.557751, 1, 0, 0.8705882, 1,
1.068464, 0.6219463, 1.391222, 1, 0, 0.8627451, 1,
1.07489, -0.9485099, 2.877914, 1, 0, 0.8588235, 1,
1.08255, -0.7133287, 1.684151, 1, 0, 0.8509804, 1,
1.082883, -0.07665968, -0.5748188, 1, 0, 0.8470588, 1,
1.083796, 0.08575832, 0.1195164, 1, 0, 0.8392157, 1,
1.084689, -0.244979, 1.039206, 1, 0, 0.8352941, 1,
1.099937, -0.1487693, 1.572553, 1, 0, 0.827451, 1,
1.103245, -0.8577119, 4.462297, 1, 0, 0.8235294, 1,
1.104178, 0.1145766, 3.317959, 1, 0, 0.8156863, 1,
1.107158, 0.4366137, 0.9405434, 1, 0, 0.8117647, 1,
1.109405, 0.2725819, 3.222756, 1, 0, 0.8039216, 1,
1.113855, 0.6087902, 1.466956, 1, 0, 0.7960784, 1,
1.119578, 0.634002, 2.9432, 1, 0, 0.7921569, 1,
1.125068, 0.6652079, 1.322878, 1, 0, 0.7843137, 1,
1.136491, -0.4083667, 1.031251, 1, 0, 0.7803922, 1,
1.137774, 1.316695, 2.143511, 1, 0, 0.772549, 1,
1.141822, -0.4642342, 3.291401, 1, 0, 0.7686275, 1,
1.152151, -0.8849289, 1.986753, 1, 0, 0.7607843, 1,
1.154926, 0.7083626, 0.8021268, 1, 0, 0.7568628, 1,
1.157661, -0.04779356, 1.624038, 1, 0, 0.7490196, 1,
1.168021, -0.3590701, 2.09666, 1, 0, 0.7450981, 1,
1.170141, -0.2919289, 1.155416, 1, 0, 0.7372549, 1,
1.170296, -1.235548, 0.62563, 1, 0, 0.7333333, 1,
1.175277, 0.5016107, 0.5773975, 1, 0, 0.7254902, 1,
1.177091, -0.7662988, 1.491673, 1, 0, 0.7215686, 1,
1.180942, 0.1057464, 1.918322, 1, 0, 0.7137255, 1,
1.183753, -0.2201166, 1.15849, 1, 0, 0.7098039, 1,
1.191067, 0.8752452, 0.8676319, 1, 0, 0.7019608, 1,
1.195582, 1.11817, -0.3108642, 1, 0, 0.6941177, 1,
1.203992, -1.671066, 2.170149, 1, 0, 0.6901961, 1,
1.205459, 0.05565399, 0.5759894, 1, 0, 0.682353, 1,
1.210962, -0.6371386, 2.675354, 1, 0, 0.6784314, 1,
1.21167, 0.1731975, 1.755098, 1, 0, 0.6705883, 1,
1.213175, -1.019614, 2.372114, 1, 0, 0.6666667, 1,
1.215832, 0.2731818, 1.080246, 1, 0, 0.6588235, 1,
1.217737, 0.03515239, 3.757267, 1, 0, 0.654902, 1,
1.220023, 0.6683652, 0.5625682, 1, 0, 0.6470588, 1,
1.238219, -2.409231, 2.150491, 1, 0, 0.6431373, 1,
1.241428, -1.384505, 1.550653, 1, 0, 0.6352941, 1,
1.241744, -0.6964431, 1.195899, 1, 0, 0.6313726, 1,
1.244357, 0.4927661, 1.230859, 1, 0, 0.6235294, 1,
1.245729, -2.24696, 3.402841, 1, 0, 0.6196079, 1,
1.251159, -0.5204561, 1.668915, 1, 0, 0.6117647, 1,
1.270477, 0.7434736, 1.42704, 1, 0, 0.6078432, 1,
1.289889, 1.310145, 2.494548, 1, 0, 0.6, 1,
1.290315, 0.3165495, 2.229374, 1, 0, 0.5921569, 1,
1.291733, -1.229898, 3.156001, 1, 0, 0.5882353, 1,
1.294646, 0.7181635, 1.589594, 1, 0, 0.5803922, 1,
1.298563, -0.412073, 2.010761, 1, 0, 0.5764706, 1,
1.323793, -0.04298947, 2.084724, 1, 0, 0.5686275, 1,
1.327487, 1.385661, 1.00183, 1, 0, 0.5647059, 1,
1.337324, 0.3718684, 0.4415989, 1, 0, 0.5568628, 1,
1.34305, 0.8396137, 1.091239, 1, 0, 0.5529412, 1,
1.34879, 0.06342282, 1.716186, 1, 0, 0.5450981, 1,
1.358316, -0.147255, 2.877125, 1, 0, 0.5411765, 1,
1.365468, 1.227921, 1.53458, 1, 0, 0.5333334, 1,
1.370471, 0.7402205, 0.7659176, 1, 0, 0.5294118, 1,
1.376045, 0.7625144, 1.401508, 1, 0, 0.5215687, 1,
1.387748, -0.07594663, 2.12763, 1, 0, 0.5176471, 1,
1.395897, 0.5551447, -0.5373672, 1, 0, 0.509804, 1,
1.411218, -0.236468, 0.7738591, 1, 0, 0.5058824, 1,
1.415575, -0.009522441, 1.585588, 1, 0, 0.4980392, 1,
1.416259, 0.7123628, 1.557451, 1, 0, 0.4901961, 1,
1.422107, 1.832487, 1.387802, 1, 0, 0.4862745, 1,
1.435426, 0.2597714, 2.593802, 1, 0, 0.4784314, 1,
1.442732, -0.06257051, 1.350079, 1, 0, 0.4745098, 1,
1.447851, -1.013835, 1.794164, 1, 0, 0.4666667, 1,
1.447965, -0.06457639, 0.3240959, 1, 0, 0.4627451, 1,
1.46604, 0.3550791, 1.823159, 1, 0, 0.454902, 1,
1.473052, -1.745955, 0.7856488, 1, 0, 0.4509804, 1,
1.474469, 0.6282296, 0.9165978, 1, 0, 0.4431373, 1,
1.474519, -0.9517285, -0.1654292, 1, 0, 0.4392157, 1,
1.482775, 0.9146361, 1.887051, 1, 0, 0.4313726, 1,
1.487215, -0.8862776, 3.3675, 1, 0, 0.427451, 1,
1.492858, 0.1171232, 3.317556, 1, 0, 0.4196078, 1,
1.493198, -0.46024, 1.136866, 1, 0, 0.4156863, 1,
1.493598, 1.579079, 1.283143, 1, 0, 0.4078431, 1,
1.497518, 0.459263, 1.530914, 1, 0, 0.4039216, 1,
1.498964, -1.286522, 1.674246, 1, 0, 0.3960784, 1,
1.502341, -0.8099083, 1.855473, 1, 0, 0.3882353, 1,
1.505245, -0.3620405, -0.2897026, 1, 0, 0.3843137, 1,
1.513356, 0.6870526, 1.145202, 1, 0, 0.3764706, 1,
1.524232, -1.407474, 2.707339, 1, 0, 0.372549, 1,
1.544165, 0.04493197, 1.399684, 1, 0, 0.3647059, 1,
1.54525, 0.8271673, -0.1316353, 1, 0, 0.3607843, 1,
1.546589, -0.44497, 2.110312, 1, 0, 0.3529412, 1,
1.556569, -0.8196086, 1.234674, 1, 0, 0.3490196, 1,
1.580983, -0.5432104, 1.968203, 1, 0, 0.3411765, 1,
1.587245, -0.7661375, 1.409103, 1, 0, 0.3372549, 1,
1.588485, 0.9684714, -0.1731417, 1, 0, 0.3294118, 1,
1.591497, -0.7686017, 2.499055, 1, 0, 0.3254902, 1,
1.626032, 1.202291, -0.8088854, 1, 0, 0.3176471, 1,
1.63428, 1.104809, -0.9681599, 1, 0, 0.3137255, 1,
1.650596, 0.7276101, 0.9946702, 1, 0, 0.3058824, 1,
1.652582, -1.662275, 1.758088, 1, 0, 0.2980392, 1,
1.659379, 0.7380242, 0.7226218, 1, 0, 0.2941177, 1,
1.663705, 2.866114, 1.750929, 1, 0, 0.2862745, 1,
1.678713, -0.02414463, 1.063646, 1, 0, 0.282353, 1,
1.678766, -0.9012047, 3.478209, 1, 0, 0.2745098, 1,
1.683895, 1.209505, 0.8320755, 1, 0, 0.2705882, 1,
1.691846, 0.4136871, 0.925664, 1, 0, 0.2627451, 1,
1.696585, 0.1208117, 2.014856, 1, 0, 0.2588235, 1,
1.705726, 0.1475966, 3.312868, 1, 0, 0.2509804, 1,
1.71433, -0.8569817, 2.810519, 1, 0, 0.2470588, 1,
1.717742, -0.3806577, 2.470577, 1, 0, 0.2392157, 1,
1.722294, -0.9498547, 1.502416, 1, 0, 0.2352941, 1,
1.747161, 0.2692167, 1.726178, 1, 0, 0.227451, 1,
1.749073, 0.5650699, 1.601903, 1, 0, 0.2235294, 1,
1.770441, 0.244208, 0.5602829, 1, 0, 0.2156863, 1,
1.78188, 1.387339, 0.84781, 1, 0, 0.2117647, 1,
1.78538, -0.3208025, 1.23171, 1, 0, 0.2039216, 1,
1.786988, -1.129891, 2.560113, 1, 0, 0.1960784, 1,
1.791164, -0.3603683, 1.802204, 1, 0, 0.1921569, 1,
1.813859, -0.05499333, 1.675907, 1, 0, 0.1843137, 1,
1.813919, -0.4662378, 2.203229, 1, 0, 0.1803922, 1,
1.821078, -1.273211, 3.010101, 1, 0, 0.172549, 1,
1.8268, 0.8553612, 1.808233, 1, 0, 0.1686275, 1,
1.862486, 1.222836, -0.2741733, 1, 0, 0.1607843, 1,
1.882415, 0.5895159, -0.1229675, 1, 0, 0.1568628, 1,
1.899374, 1.50892, 0.6238372, 1, 0, 0.1490196, 1,
1.906239, 0.1881727, 1.461498, 1, 0, 0.145098, 1,
1.908293, -0.8750688, 3.208824, 1, 0, 0.1372549, 1,
1.926344, 0.1417698, 3.017933, 1, 0, 0.1333333, 1,
1.933395, 0.8799917, 1.601043, 1, 0, 0.1254902, 1,
1.934148, 0.3880219, 3.168786, 1, 0, 0.1215686, 1,
1.963173, -1.295563, 2.145181, 1, 0, 0.1137255, 1,
1.974966, -0.07744206, 1.471233, 1, 0, 0.1098039, 1,
1.984322, 2.799418, 1.046999, 1, 0, 0.1019608, 1,
1.996144, 0.2390079, 1.449666, 1, 0, 0.09411765, 1,
2.013191, -0.5226867, 1.673712, 1, 0, 0.09019608, 1,
2.014567, 0.2564476, 3.020083, 1, 0, 0.08235294, 1,
2.033031, -0.375723, 2.905135, 1, 0, 0.07843138, 1,
2.039593, 1.049178, 1.291335, 1, 0, 0.07058824, 1,
2.058619, -1.092652, 1.478122, 1, 0, 0.06666667, 1,
2.075574, 0.8488364, 3.07301, 1, 0, 0.05882353, 1,
2.082269, -0.1286859, 1.318853, 1, 0, 0.05490196, 1,
2.130079, -1.063678, 1.199754, 1, 0, 0.04705882, 1,
2.209376, 0.6622598, 0.2519582, 1, 0, 0.04313726, 1,
2.237203, 0.5651287, 2.334505, 1, 0, 0.03529412, 1,
2.402512, -0.1250648, 2.223172, 1, 0, 0.03137255, 1,
2.41005, 1.435124, 0.7591949, 1, 0, 0.02352941, 1,
2.497414, 0.8916543, 1.163348, 1, 0, 0.01960784, 1,
2.627892, 0.5530152, 1.445199, 1, 0, 0.01176471, 1,
2.94796, -1.254574, 0.9426707, 1, 0, 0.007843138, 1
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
-0.2421095, -3.683187, -6.834758, 0, -0.5, 0.5, 0.5,
-0.2421095, -3.683187, -6.834758, 1, -0.5, 0.5, 0.5,
-0.2421095, -3.683187, -6.834758, 1, 1.5, 0.5, 0.5,
-0.2421095, -3.683187, -6.834758, 0, 1.5, 0.5, 0.5
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
-4.513613, 0.4287854, -6.834758, 0, -0.5, 0.5, 0.5,
-4.513613, 0.4287854, -6.834758, 1, -0.5, 0.5, 0.5,
-4.513613, 0.4287854, -6.834758, 1, 1.5, 0.5, 0.5,
-4.513613, 0.4287854, -6.834758, 0, 1.5, 0.5, 0.5
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
-4.513613, -3.683187, 0.08236265, 0, -0.5, 0.5, 0.5,
-4.513613, -3.683187, 0.08236265, 1, -0.5, 0.5, 0.5,
-4.513613, -3.683187, 0.08236265, 1, 1.5, 0.5, 0.5,
-4.513613, -3.683187, 0.08236265, 0, 1.5, 0.5, 0.5
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
-3, -2.73427, -5.238499,
2, -2.73427, -5.238499,
-3, -2.73427, -5.238499,
-3, -2.892423, -5.504542,
-2, -2.73427, -5.238499,
-2, -2.892423, -5.504542,
-1, -2.73427, -5.238499,
-1, -2.892423, -5.504542,
0, -2.73427, -5.238499,
0, -2.892423, -5.504542,
1, -2.73427, -5.238499,
1, -2.892423, -5.504542,
2, -2.73427, -5.238499,
2, -2.892423, -5.504542
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
-3, -3.208729, -6.036629, 0, -0.5, 0.5, 0.5,
-3, -3.208729, -6.036629, 1, -0.5, 0.5, 0.5,
-3, -3.208729, -6.036629, 1, 1.5, 0.5, 0.5,
-3, -3.208729, -6.036629, 0, 1.5, 0.5, 0.5,
-2, -3.208729, -6.036629, 0, -0.5, 0.5, 0.5,
-2, -3.208729, -6.036629, 1, -0.5, 0.5, 0.5,
-2, -3.208729, -6.036629, 1, 1.5, 0.5, 0.5,
-2, -3.208729, -6.036629, 0, 1.5, 0.5, 0.5,
-1, -3.208729, -6.036629, 0, -0.5, 0.5, 0.5,
-1, -3.208729, -6.036629, 1, -0.5, 0.5, 0.5,
-1, -3.208729, -6.036629, 1, 1.5, 0.5, 0.5,
-1, -3.208729, -6.036629, 0, 1.5, 0.5, 0.5,
0, -3.208729, -6.036629, 0, -0.5, 0.5, 0.5,
0, -3.208729, -6.036629, 1, -0.5, 0.5, 0.5,
0, -3.208729, -6.036629, 1, 1.5, 0.5, 0.5,
0, -3.208729, -6.036629, 0, 1.5, 0.5, 0.5,
1, -3.208729, -6.036629, 0, -0.5, 0.5, 0.5,
1, -3.208729, -6.036629, 1, -0.5, 0.5, 0.5,
1, -3.208729, -6.036629, 1, 1.5, 0.5, 0.5,
1, -3.208729, -6.036629, 0, 1.5, 0.5, 0.5,
2, -3.208729, -6.036629, 0, -0.5, 0.5, 0.5,
2, -3.208729, -6.036629, 1, -0.5, 0.5, 0.5,
2, -3.208729, -6.036629, 1, 1.5, 0.5, 0.5,
2, -3.208729, -6.036629, 0, 1.5, 0.5, 0.5
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
-3.527881, -2, -5.238499,
-3.527881, 3, -5.238499,
-3.527881, -2, -5.238499,
-3.69217, -2, -5.504542,
-3.527881, -1, -5.238499,
-3.69217, -1, -5.504542,
-3.527881, 0, -5.238499,
-3.69217, 0, -5.504542,
-3.527881, 1, -5.238499,
-3.69217, 1, -5.504542,
-3.527881, 2, -5.238499,
-3.69217, 2, -5.504542,
-3.527881, 3, -5.238499,
-3.69217, 3, -5.504542
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
-4.020747, -2, -6.036629, 0, -0.5, 0.5, 0.5,
-4.020747, -2, -6.036629, 1, -0.5, 0.5, 0.5,
-4.020747, -2, -6.036629, 1, 1.5, 0.5, 0.5,
-4.020747, -2, -6.036629, 0, 1.5, 0.5, 0.5,
-4.020747, -1, -6.036629, 0, -0.5, 0.5, 0.5,
-4.020747, -1, -6.036629, 1, -0.5, 0.5, 0.5,
-4.020747, -1, -6.036629, 1, 1.5, 0.5, 0.5,
-4.020747, -1, -6.036629, 0, 1.5, 0.5, 0.5,
-4.020747, 0, -6.036629, 0, -0.5, 0.5, 0.5,
-4.020747, 0, -6.036629, 1, -0.5, 0.5, 0.5,
-4.020747, 0, -6.036629, 1, 1.5, 0.5, 0.5,
-4.020747, 0, -6.036629, 0, 1.5, 0.5, 0.5,
-4.020747, 1, -6.036629, 0, -0.5, 0.5, 0.5,
-4.020747, 1, -6.036629, 1, -0.5, 0.5, 0.5,
-4.020747, 1, -6.036629, 1, 1.5, 0.5, 0.5,
-4.020747, 1, -6.036629, 0, 1.5, 0.5, 0.5,
-4.020747, 2, -6.036629, 0, -0.5, 0.5, 0.5,
-4.020747, 2, -6.036629, 1, -0.5, 0.5, 0.5,
-4.020747, 2, -6.036629, 1, 1.5, 0.5, 0.5,
-4.020747, 2, -6.036629, 0, 1.5, 0.5, 0.5,
-4.020747, 3, -6.036629, 0, -0.5, 0.5, 0.5,
-4.020747, 3, -6.036629, 1, -0.5, 0.5, 0.5,
-4.020747, 3, -6.036629, 1, 1.5, 0.5, 0.5,
-4.020747, 3, -6.036629, 0, 1.5, 0.5, 0.5
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
-3.527881, -2.73427, -4,
-3.527881, -2.73427, 4,
-3.527881, -2.73427, -4,
-3.69217, -2.892423, -4,
-3.527881, -2.73427, -2,
-3.69217, -2.892423, -2,
-3.527881, -2.73427, 0,
-3.69217, -2.892423, 0,
-3.527881, -2.73427, 2,
-3.69217, -2.892423, 2,
-3.527881, -2.73427, 4,
-3.69217, -2.892423, 4
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
-4.020747, -3.208729, -4, 0, -0.5, 0.5, 0.5,
-4.020747, -3.208729, -4, 1, -0.5, 0.5, 0.5,
-4.020747, -3.208729, -4, 1, 1.5, 0.5, 0.5,
-4.020747, -3.208729, -4, 0, 1.5, 0.5, 0.5,
-4.020747, -3.208729, -2, 0, -0.5, 0.5, 0.5,
-4.020747, -3.208729, -2, 1, -0.5, 0.5, 0.5,
-4.020747, -3.208729, -2, 1, 1.5, 0.5, 0.5,
-4.020747, -3.208729, -2, 0, 1.5, 0.5, 0.5,
-4.020747, -3.208729, 0, 0, -0.5, 0.5, 0.5,
-4.020747, -3.208729, 0, 1, -0.5, 0.5, 0.5,
-4.020747, -3.208729, 0, 1, 1.5, 0.5, 0.5,
-4.020747, -3.208729, 0, 0, 1.5, 0.5, 0.5,
-4.020747, -3.208729, 2, 0, -0.5, 0.5, 0.5,
-4.020747, -3.208729, 2, 1, -0.5, 0.5, 0.5,
-4.020747, -3.208729, 2, 1, 1.5, 0.5, 0.5,
-4.020747, -3.208729, 2, 0, 1.5, 0.5, 0.5,
-4.020747, -3.208729, 4, 0, -0.5, 0.5, 0.5,
-4.020747, -3.208729, 4, 1, -0.5, 0.5, 0.5,
-4.020747, -3.208729, 4, 1, 1.5, 0.5, 0.5,
-4.020747, -3.208729, 4, 0, 1.5, 0.5, 0.5
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
-3.527881, -2.73427, -5.238499,
-3.527881, 3.591841, -5.238499,
-3.527881, -2.73427, 5.403224,
-3.527881, 3.591841, 5.403224,
-3.527881, -2.73427, -5.238499,
-3.527881, -2.73427, 5.403224,
-3.527881, 3.591841, -5.238499,
-3.527881, 3.591841, 5.403224,
-3.527881, -2.73427, -5.238499,
3.043662, -2.73427, -5.238499,
-3.527881, -2.73427, 5.403224,
3.043662, -2.73427, 5.403224,
-3.527881, 3.591841, -5.238499,
3.043662, 3.591841, -5.238499,
-3.527881, 3.591841, 5.403224,
3.043662, 3.591841, 5.403224,
3.043662, -2.73427, -5.238499,
3.043662, 3.591841, -5.238499,
3.043662, -2.73427, 5.403224,
3.043662, 3.591841, 5.403224,
3.043662, -2.73427, -5.238499,
3.043662, -2.73427, 5.403224,
3.043662, 3.591841, -5.238499,
3.043662, 3.591841, 5.403224
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
var radius = 7.484327;
var distance = 33.29862;
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
mvMatrix.translate( 0.2421095, -0.4287854, -0.08236265 );
mvMatrix.scale( 1.2314, 1.279175, 0.760422 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.29862);
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
pyroquilon<-read.table("pyroquilon.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyroquilon$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyroquilon' not found
```

```r
y<-pyroquilon$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyroquilon' not found
```

```r
z<-pyroquilon$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyroquilon' not found
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
-3.432179, 1.199176, -1.585767, 0, 0, 1, 1, 1,
-3.387946, 0.2239132, -1.703285, 1, 0, 0, 1, 1,
-3.107088, 0.6578427, -0.01612044, 1, 0, 0, 1, 1,
-2.969213, -0.9117041, -1.313396, 1, 0, 0, 1, 1,
-2.641346, 1.083058, -0.6077983, 1, 0, 0, 1, 1,
-2.539123, -0.7756774, -2.077583, 1, 0, 0, 1, 1,
-2.511315, 0.7529055, -0.09155151, 0, 0, 0, 1, 1,
-2.498493, -0.7163769, -1.103262, 0, 0, 0, 1, 1,
-2.470393, -0.04565134, -0.5256515, 0, 0, 0, 1, 1,
-2.467941, -1.429469, -3.411432, 0, 0, 0, 1, 1,
-2.423699, -2.06642, -3.854384, 0, 0, 0, 1, 1,
-2.353374, 1.338115, 1.315216, 0, 0, 0, 1, 1,
-2.322001, -1.915428, -0.9263543, 0, 0, 0, 1, 1,
-2.313569, 0.9371213, -0.02414615, 1, 1, 1, 1, 1,
-2.190838, -0.9763645, -2.198061, 1, 1, 1, 1, 1,
-2.119029, 0.527498, -0.4953206, 1, 1, 1, 1, 1,
-2.097505, 0.06111292, -1.883264, 1, 1, 1, 1, 1,
-2.076473, -2.111745, -2.127774, 1, 1, 1, 1, 1,
-2.07205, 1.513471, -1.669016, 1, 1, 1, 1, 1,
-2.064748, 0.2391947, 0.01411404, 1, 1, 1, 1, 1,
-2.056311, -0.6922516, -0.8938178, 1, 1, 1, 1, 1,
-2.044891, 0.6591417, -0.7831278, 1, 1, 1, 1, 1,
-2.022393, 0.1937065, -1.108178, 1, 1, 1, 1, 1,
-1.957783, -1.239023, -0.6376126, 1, 1, 1, 1, 1,
-1.940772, -0.1790184, -2.121478, 1, 1, 1, 1, 1,
-1.913782, 1.493267, 0.08194581, 1, 1, 1, 1, 1,
-1.909375, 0.2057815, -0.05051711, 1, 1, 1, 1, 1,
-1.899734, -1.109984, -2.02183, 1, 1, 1, 1, 1,
-1.888423, -0.6049632, -0.9693276, 0, 0, 1, 1, 1,
-1.88777, -0.08206291, -2.473509, 1, 0, 0, 1, 1,
-1.873428, -0.9245317, -1.240983, 1, 0, 0, 1, 1,
-1.856337, -1.230969, -2.936849, 1, 0, 0, 1, 1,
-1.855073, 0.8594625, -1.562063, 1, 0, 0, 1, 1,
-1.834335, 0.5786076, -2.717333, 1, 0, 0, 1, 1,
-1.821035, 0.1022079, -2.972781, 0, 0, 0, 1, 1,
-1.800849, -1.723631, -2.196912, 0, 0, 0, 1, 1,
-1.78732, 0.05816907, -1.859634, 0, 0, 0, 1, 1,
-1.781972, 0.7691969, 0.2843391, 0, 0, 0, 1, 1,
-1.779344, 0.2187281, -1.387268, 0, 0, 0, 1, 1,
-1.767156, -0.8847378, -1.252592, 0, 0, 0, 1, 1,
-1.740399, -0.3791054, -2.475415, 0, 0, 0, 1, 1,
-1.730617, -1.168332, -3.216012, 1, 1, 1, 1, 1,
-1.729594, -0.03725188, -1.354915, 1, 1, 1, 1, 1,
-1.716623, -1.227631, -1.883076, 1, 1, 1, 1, 1,
-1.71543, -0.911384, -1.714694, 1, 1, 1, 1, 1,
-1.7042, -1.024064, -0.312772, 1, 1, 1, 1, 1,
-1.696133, -0.7170247, -1.083266, 1, 1, 1, 1, 1,
-1.6859, 0.1357315, -3.217475, 1, 1, 1, 1, 1,
-1.685111, 0.007048223, -1.795363, 1, 1, 1, 1, 1,
-1.6808, -1.004337, -0.9266899, 1, 1, 1, 1, 1,
-1.679447, 2.394379, -0.6636434, 1, 1, 1, 1, 1,
-1.670788, 0.1275027, -0.9134407, 1, 1, 1, 1, 1,
-1.664722, 1.555001, -2.114592, 1, 1, 1, 1, 1,
-1.6584, -0.0299168, -3.149643, 1, 1, 1, 1, 1,
-1.648836, 0.370502, -1.507644, 1, 1, 1, 1, 1,
-1.642103, 0.430283, -2.110093, 1, 1, 1, 1, 1,
-1.632706, 1.697045, -1.302776, 0, 0, 1, 1, 1,
-1.618219, -0.07075065, -4.55342, 1, 0, 0, 1, 1,
-1.613139, -0.6060937, -0.542763, 1, 0, 0, 1, 1,
-1.60586, 0.3332476, -2.886867, 1, 0, 0, 1, 1,
-1.603796, -1.184473, -1.306917, 1, 0, 0, 1, 1,
-1.576304, 1.009433, -0.8053976, 1, 0, 0, 1, 1,
-1.566265, 1.240411, -0.7956079, 0, 0, 0, 1, 1,
-1.557254, -0.5526342, -1.872809, 0, 0, 0, 1, 1,
-1.550475, 0.558554, 0.8614249, 0, 0, 0, 1, 1,
-1.547361, 2.094997, -0.4812215, 0, 0, 0, 1, 1,
-1.53404, 0.2578248, -0.1313432, 0, 0, 0, 1, 1,
-1.530011, -0.7920587, -4.014129, 0, 0, 0, 1, 1,
-1.529438, -1.184565, -0.2353596, 0, 0, 0, 1, 1,
-1.525639, 1.733164, -0.4572702, 1, 1, 1, 1, 1,
-1.522413, 0.6607178, -2.553623, 1, 1, 1, 1, 1,
-1.520931, -0.01670049, 0.5506818, 1, 1, 1, 1, 1,
-1.515323, -1.305784, -1.756134, 1, 1, 1, 1, 1,
-1.510607, -0.03121637, -0.6658502, 1, 1, 1, 1, 1,
-1.509397, -0.7664023, -1.659076, 1, 1, 1, 1, 1,
-1.493468, 1.158515, -3.137668, 1, 1, 1, 1, 1,
-1.479056, 1.363026, -1.599567, 1, 1, 1, 1, 1,
-1.463158, -0.007793657, -1.375981, 1, 1, 1, 1, 1,
-1.450477, -0.5915444, -1.675008, 1, 1, 1, 1, 1,
-1.433053, 0.9896641, -1.334317, 1, 1, 1, 1, 1,
-1.424605, -0.1083199, -0.9700835, 1, 1, 1, 1, 1,
-1.419017, -0.3420226, -3.026562, 1, 1, 1, 1, 1,
-1.418708, 1.161122, -0.3637026, 1, 1, 1, 1, 1,
-1.414568, 0.114249, -1.769192, 1, 1, 1, 1, 1,
-1.40681, -0.8974915, -1.032104, 0, 0, 1, 1, 1,
-1.401882, -0.1091883, -1.967115, 1, 0, 0, 1, 1,
-1.398738, -1.084861, -3.077732, 1, 0, 0, 1, 1,
-1.392632, 0.3578297, -2.626933, 1, 0, 0, 1, 1,
-1.381863, -1.689269, -2.228953, 1, 0, 0, 1, 1,
-1.371368, 1.859216, -1.427814, 1, 0, 0, 1, 1,
-1.364856, -0.3327703, -2.944338, 0, 0, 0, 1, 1,
-1.363752, -0.6089377, -1.789883, 0, 0, 0, 1, 1,
-1.362668, -0.6454728, -2.623943, 0, 0, 0, 1, 1,
-1.359274, 2.189079, 1.462135, 0, 0, 0, 1, 1,
-1.358128, -0.2936228, -2.309736, 0, 0, 0, 1, 1,
-1.340024, 0.909502, -2.314122, 0, 0, 0, 1, 1,
-1.335279, 0.2195072, -3.16004, 0, 0, 0, 1, 1,
-1.331897, -0.8515675, -2.302016, 1, 1, 1, 1, 1,
-1.331838, 0.4180454, 0.167762, 1, 1, 1, 1, 1,
-1.296442, 0.1938867, 0.8848738, 1, 1, 1, 1, 1,
-1.276211, 0.3149167, -1.572308, 1, 1, 1, 1, 1,
-1.26675, 0.5503339, 0.2772737, 1, 1, 1, 1, 1,
-1.264387, 0.7436659, -2.050615, 1, 1, 1, 1, 1,
-1.259902, 0.4204954, -1.458234, 1, 1, 1, 1, 1,
-1.256594, 1.596859, -0.03734294, 1, 1, 1, 1, 1,
-1.25458, -0.5226021, -2.825639, 1, 1, 1, 1, 1,
-1.220737, 0.4905201, -1.101458, 1, 1, 1, 1, 1,
-1.218655, -0.02620382, -2.655802, 1, 1, 1, 1, 1,
-1.213366, 0.6969329, -1.329941, 1, 1, 1, 1, 1,
-1.210694, 0.9177943, -1.032998, 1, 1, 1, 1, 1,
-1.202948, -0.4121026, -2.58944, 1, 1, 1, 1, 1,
-1.197822, -0.0295252, -3.812652, 1, 1, 1, 1, 1,
-1.195891, 0.06114504, -1.118124, 0, 0, 1, 1, 1,
-1.181091, -0.8727384, -2.799451, 1, 0, 0, 1, 1,
-1.16934, 0.1608643, -1.193161, 1, 0, 0, 1, 1,
-1.161433, 0.88453, 2.004863, 1, 0, 0, 1, 1,
-1.157282, -0.8362316, -2.383819, 1, 0, 0, 1, 1,
-1.154508, -0.03090937, -2.869683, 1, 0, 0, 1, 1,
-1.129352, -0.964956, -3.646291, 0, 0, 0, 1, 1,
-1.127339, -0.2113746, -1.411265, 0, 0, 0, 1, 1,
-1.117974, 2.108442, -1.443762, 0, 0, 0, 1, 1,
-1.114017, 0.2366177, -0.3507976, 0, 0, 0, 1, 1,
-1.111069, 0.3122665, -1.007144, 0, 0, 0, 1, 1,
-1.10997, 0.7936467, -0.3958864, 0, 0, 0, 1, 1,
-1.109481, 1.841033, 0.1863426, 0, 0, 0, 1, 1,
-1.109213, 0.9605578, -0.1600492, 1, 1, 1, 1, 1,
-1.107303, -1.419475, -0.9055704, 1, 1, 1, 1, 1,
-1.106217, -0.604194, -3.222587, 1, 1, 1, 1, 1,
-1.102722, 0.2480299, -1.27265, 1, 1, 1, 1, 1,
-1.096558, -0.3019487, -2.966265, 1, 1, 1, 1, 1,
-1.095409, -0.5439048, 0.07333019, 1, 1, 1, 1, 1,
-1.089575, -1.18259, -2.766378, 1, 1, 1, 1, 1,
-1.080101, -0.02171618, -1.731978, 1, 1, 1, 1, 1,
-1.076409, -0.4682074, -1.120652, 1, 1, 1, 1, 1,
-1.071599, 0.2855527, -1.274706, 1, 1, 1, 1, 1,
-1.06755, 1.191568, -1.217421, 1, 1, 1, 1, 1,
-1.064375, -0.2438868, -2.121539, 1, 1, 1, 1, 1,
-1.062636, 1.693494, 0.1102113, 1, 1, 1, 1, 1,
-1.052955, -0.9582543, -3.409059, 1, 1, 1, 1, 1,
-1.047795, -0.3879346, -2.831718, 1, 1, 1, 1, 1,
-1.042365, 0.3570623, -0.575294, 0, 0, 1, 1, 1,
-1.035487, 0.04990682, -1.198156, 1, 0, 0, 1, 1,
-1.033715, -0.009323273, -1.952595, 1, 0, 0, 1, 1,
-1.030794, 0.4356849, -2.086465, 1, 0, 0, 1, 1,
-1.029548, 1.758895, -0.7639317, 1, 0, 0, 1, 1,
-1.027015, 0.2473021, 0.03510538, 1, 0, 0, 1, 1,
-1.020221, 0.6253639, -2.349089, 0, 0, 0, 1, 1,
-0.999767, -0.9483817, -2.053912, 0, 0, 0, 1, 1,
-0.992111, 0.402042, -2.148878, 0, 0, 0, 1, 1,
-0.9877241, 0.5877167, 0.2230692, 0, 0, 0, 1, 1,
-0.9812192, 0.273787, -0.8178695, 0, 0, 0, 1, 1,
-0.9763165, 0.04508317, -1.82894, 0, 0, 0, 1, 1,
-0.9748544, 0.8205757, -1.260781, 0, 0, 0, 1, 1,
-0.9746838, -0.04382043, -2.484913, 1, 1, 1, 1, 1,
-0.9740139, -0.04516196, -0.7129411, 1, 1, 1, 1, 1,
-0.9717999, 0.2788042, -2.218841, 1, 1, 1, 1, 1,
-0.9510826, 0.2855195, -1.736222, 1, 1, 1, 1, 1,
-0.9270062, -1.175501, -3.556049, 1, 1, 1, 1, 1,
-0.9240386, 0.3226283, -1.986874, 1, 1, 1, 1, 1,
-0.9186938, -0.7047247, -4.266257, 1, 1, 1, 1, 1,
-0.9166206, 0.02561107, -3.469913, 1, 1, 1, 1, 1,
-0.9085019, 1.25395, -0.7763032, 1, 1, 1, 1, 1,
-0.8977324, 0.5707119, -2.352132, 1, 1, 1, 1, 1,
-0.8954821, 0.4115454, -2.230228, 1, 1, 1, 1, 1,
-0.8942661, 0.9579322, -1.023101, 1, 1, 1, 1, 1,
-0.8930914, -0.8424271, -0.6338661, 1, 1, 1, 1, 1,
-0.8902429, 1.808417, -0.324728, 1, 1, 1, 1, 1,
-0.8877171, 1.408074, -0.7635782, 1, 1, 1, 1, 1,
-0.8872418, 0.08201628, -2.052944, 0, 0, 1, 1, 1,
-0.8854853, -1.551792, -1.543347, 1, 0, 0, 1, 1,
-0.8824031, -0.08257581, -1.207499, 1, 0, 0, 1, 1,
-0.8799952, 1.603618, -1.254432, 1, 0, 0, 1, 1,
-0.8752318, 1.140938, -0.3776085, 1, 0, 0, 1, 1,
-0.8725371, 1.056903, -3.10462, 1, 0, 0, 1, 1,
-0.86669, 0.9048446, -1.653333, 0, 0, 0, 1, 1,
-0.8639587, -1.473477, -2.244614, 0, 0, 0, 1, 1,
-0.863184, -0.4984665, -3.419353, 0, 0, 0, 1, 1,
-0.8617901, -0.3882068, -3.551426, 0, 0, 0, 1, 1,
-0.8616416, -0.4689918, -1.461053, 0, 0, 0, 1, 1,
-0.8576226, -0.4011934, -0.3832233, 0, 0, 0, 1, 1,
-0.856677, 2.50545, -0.1632118, 0, 0, 0, 1, 1,
-0.8540154, -0.2590429, -2.212817, 1, 1, 1, 1, 1,
-0.8521502, 0.3371705, -1.491543, 1, 1, 1, 1, 1,
-0.8490658, -0.1155634, -2.019729, 1, 1, 1, 1, 1,
-0.8460186, -1.032194, -2.766919, 1, 1, 1, 1, 1,
-0.8450521, -0.4922658, -1.379434, 1, 1, 1, 1, 1,
-0.8436286, -0.5782506, -2.688643, 1, 1, 1, 1, 1,
-0.8432347, -1.383336, -3.512689, 1, 1, 1, 1, 1,
-0.8431422, 0.9506188, -1.086915, 1, 1, 1, 1, 1,
-0.835654, -0.577317, -2.64986, 1, 1, 1, 1, 1,
-0.8331619, 0.1749344, -1.245812, 1, 1, 1, 1, 1,
-0.8228292, 0.6536155, -0.8740059, 1, 1, 1, 1, 1,
-0.8151463, -0.5800762, -2.269146, 1, 1, 1, 1, 1,
-0.8119004, -0.09188361, -2.626129, 1, 1, 1, 1, 1,
-0.8106053, -0.6071985, -2.691379, 1, 1, 1, 1, 1,
-0.8062398, -0.7294587, -4.934251, 1, 1, 1, 1, 1,
-0.8054636, -2.127908, -2.675785, 0, 0, 1, 1, 1,
-0.8029516, -0.244715, -2.07695, 1, 0, 0, 1, 1,
-0.8028975, -0.2594585, 0.07693153, 1, 0, 0, 1, 1,
-0.7986169, 0.6315822, -0.4888439, 1, 0, 0, 1, 1,
-0.793542, 0.5328285, -2.76833, 1, 0, 0, 1, 1,
-0.7931575, 0.1289747, -1.436681, 1, 0, 0, 1, 1,
-0.792972, 0.535768, -1.377024, 0, 0, 0, 1, 1,
-0.7927877, 1.951147, -0.6852362, 0, 0, 0, 1, 1,
-0.7874358, -1.393989, -1.92502, 0, 0, 0, 1, 1,
-0.7780007, 1.278657, -0.9864074, 0, 0, 0, 1, 1,
-0.7739105, -0.4920121, -2.185006, 0, 0, 0, 1, 1,
-0.7710607, 1.634708, -0.9201697, 0, 0, 0, 1, 1,
-0.770865, 0.3526926, -2.978305, 0, 0, 0, 1, 1,
-0.7695311, 1.164315, -1.150694, 1, 1, 1, 1, 1,
-0.7654808, 0.4995719, -1.752697, 1, 1, 1, 1, 1,
-0.7585282, -0.04492122, -1.365492, 1, 1, 1, 1, 1,
-0.7570773, 1.340056, 1.533335, 1, 1, 1, 1, 1,
-0.7553937, 0.4508387, -1.035638, 1, 1, 1, 1, 1,
-0.7510274, -0.8004549, -2.700177, 1, 1, 1, 1, 1,
-0.7494147, 1.748734, -0.07437985, 1, 1, 1, 1, 1,
-0.7437297, -0.1289002, -1.7418, 1, 1, 1, 1, 1,
-0.7390006, -2.225843, -3.785833, 1, 1, 1, 1, 1,
-0.7389891, 0.934968, -0.5162765, 1, 1, 1, 1, 1,
-0.7389841, -1.250872, 0.2896018, 1, 1, 1, 1, 1,
-0.7326691, 1.278444, -0.2455059, 1, 1, 1, 1, 1,
-0.7311937, 2.297102, -0.05799784, 1, 1, 1, 1, 1,
-0.715598, 0.9106359, -0.7515077, 1, 1, 1, 1, 1,
-0.7116851, 0.02723204, -1.817794, 1, 1, 1, 1, 1,
-0.710646, -0.2306841, -2.298263, 0, 0, 1, 1, 1,
-0.710305, -0.257781, -2.700885, 1, 0, 0, 1, 1,
-0.7060482, 1.104372, -0.4114788, 1, 0, 0, 1, 1,
-0.7048547, 2.101822, -0.5172427, 1, 0, 0, 1, 1,
-0.7034587, -0.9256144, -3.743021, 1, 0, 0, 1, 1,
-0.7030431, 0.1964853, -1.39033, 1, 0, 0, 1, 1,
-0.6944545, 0.06471483, -0.2913403, 0, 0, 0, 1, 1,
-0.6868117, 1.231501, 0.3078307, 0, 0, 0, 1, 1,
-0.685797, -0.3504513, -1.09717, 0, 0, 0, 1, 1,
-0.6819144, 1.884105, 1.712905, 0, 0, 0, 1, 1,
-0.6717595, -0.9038687, -3.813371, 0, 0, 0, 1, 1,
-0.6647214, -0.8208328, -1.89387, 0, 0, 0, 1, 1,
-0.6626849, -0.4968269, -2.207501, 0, 0, 0, 1, 1,
-0.656947, -1.128983, -3.169182, 1, 1, 1, 1, 1,
-0.6542256, -0.119146, -1.533688, 1, 1, 1, 1, 1,
-0.6504927, 0.723875, 1.062727, 1, 1, 1, 1, 1,
-0.6477169, 1.332032, -1.736086, 1, 1, 1, 1, 1,
-0.6466826, 1.349774, -0.866895, 1, 1, 1, 1, 1,
-0.6444467, 1.292391, 0.7060093, 1, 1, 1, 1, 1,
-0.6415256, 0.3649921, -2.529753, 1, 1, 1, 1, 1,
-0.6406894, -0.07519194, -1.759588, 1, 1, 1, 1, 1,
-0.6327348, 0.2397348, -1.37703, 1, 1, 1, 1, 1,
-0.6287777, -0.6856669, -2.098528, 1, 1, 1, 1, 1,
-0.623171, 0.3540971, -0.2088011, 1, 1, 1, 1, 1,
-0.6213067, -0.6501471, -3.02217, 1, 1, 1, 1, 1,
-0.6207344, -0.3610083, -2.449286, 1, 1, 1, 1, 1,
-0.6142573, 2.162936, 1.276486, 1, 1, 1, 1, 1,
-0.6136539, -0.01310669, -1.89304, 1, 1, 1, 1, 1,
-0.6122715, 1.383253, -2.786427, 0, 0, 1, 1, 1,
-0.6111777, 0.4052461, -0.7909472, 1, 0, 0, 1, 1,
-0.6074247, -0.9863319, -3.694539, 1, 0, 0, 1, 1,
-0.6013948, 1.714136, -0.1786797, 1, 0, 0, 1, 1,
-0.5982417, 0.3119441, -2.374668, 1, 0, 0, 1, 1,
-0.5948446, 0.8648539, 0.9954491, 1, 0, 0, 1, 1,
-0.5926401, 0.6329892, 0.2679374, 0, 0, 0, 1, 1,
-0.5900671, 1.422435, -0.9197806, 0, 0, 0, 1, 1,
-0.5898886, -0.8923072, -3.827967, 0, 0, 0, 1, 1,
-0.589727, 0.1909546, -0.5433778, 0, 0, 0, 1, 1,
-0.5879174, 0.8450533, 0.4701067, 0, 0, 0, 1, 1,
-0.5858614, 1.325993, 0.2542239, 0, 0, 0, 1, 1,
-0.5856242, -1.260883, -2.000103, 0, 0, 0, 1, 1,
-0.5842212, 0.06122304, -1.233295, 1, 1, 1, 1, 1,
-0.5799417, -0.7918264, -2.689639, 1, 1, 1, 1, 1,
-0.5742978, 0.6977225, 0.7968322, 1, 1, 1, 1, 1,
-0.5738451, 0.8127339, 0.869478, 1, 1, 1, 1, 1,
-0.5711145, -0.8858972, -1.827991, 1, 1, 1, 1, 1,
-0.5708182, 1.55335, -0.5389339, 1, 1, 1, 1, 1,
-0.5705352, 0.2986605, -1.025626, 1, 1, 1, 1, 1,
-0.5666346, -1.070174, -3.178044, 1, 1, 1, 1, 1,
-0.5648788, 0.6051305, -1.064414, 1, 1, 1, 1, 1,
-0.5603891, 0.7523237, 0.4203363, 1, 1, 1, 1, 1,
-0.5599853, 0.6508605, -1.177377, 1, 1, 1, 1, 1,
-0.5585911, -0.4891223, -2.458853, 1, 1, 1, 1, 1,
-0.5568873, -0.01508027, -1.525056, 1, 1, 1, 1, 1,
-0.5548015, -0.9589826, -3.240885, 1, 1, 1, 1, 1,
-0.5545326, 0.7678744, -0.157721, 1, 1, 1, 1, 1,
-0.5538275, -1.16571, -2.21859, 0, 0, 1, 1, 1,
-0.548305, -0.9030921, -2.741771, 1, 0, 0, 1, 1,
-0.5423964, 0.1605309, -0.6162422, 1, 0, 0, 1, 1,
-0.5372665, -1.148036, -2.505604, 1, 0, 0, 1, 1,
-0.5310183, -1.567899, -2.93524, 1, 0, 0, 1, 1,
-0.5295509, -0.1171501, -1.266216, 1, 0, 0, 1, 1,
-0.5275231, 0.4202723, 0.2002105, 0, 0, 0, 1, 1,
-0.5274594, 1.237698, 1.369161, 0, 0, 0, 1, 1,
-0.5252464, -2.642143, -2.024166, 0, 0, 0, 1, 1,
-0.5248963, -1.356177, -2.909668, 0, 0, 0, 1, 1,
-0.5238694, -0.6870512, -4.37686, 0, 0, 0, 1, 1,
-0.5213389, 0.7199022, 1.005015, 0, 0, 0, 1, 1,
-0.5163953, -0.5273477, -3.446312, 0, 0, 0, 1, 1,
-0.515037, -1.695815, -1.638522, 1, 1, 1, 1, 1,
-0.5150011, -0.08066356, -1.999986, 1, 1, 1, 1, 1,
-0.513848, -2.132268, -2.741305, 1, 1, 1, 1, 1,
-0.5131362, 1.492354, -1.129595, 1, 1, 1, 1, 1,
-0.5087381, -0.7087048, -2.690703, 1, 1, 1, 1, 1,
-0.5075462, 0.08330821, -0.7470234, 1, 1, 1, 1, 1,
-0.5042558, -2.006804, -4.157805, 1, 1, 1, 1, 1,
-0.4957182, 0.5731331, 0.8276678, 1, 1, 1, 1, 1,
-0.4901681, 0.4297203, -1.603208, 1, 1, 1, 1, 1,
-0.4844617, -2.489051, -3.439858, 1, 1, 1, 1, 1,
-0.4813056, -1.559679, -3.677603, 1, 1, 1, 1, 1,
-0.4738229, 0.04534092, -1.564729, 1, 1, 1, 1, 1,
-0.4692462, 0.6206086, -0.1076025, 1, 1, 1, 1, 1,
-0.4635566, -0.4660105, -1.251494, 1, 1, 1, 1, 1,
-0.4591022, 0.5014018, -0.2064741, 1, 1, 1, 1, 1,
-0.4588702, 0.7074571, -1.927135, 0, 0, 1, 1, 1,
-0.4509572, 1.167127, -0.4769219, 1, 0, 0, 1, 1,
-0.4500217, 1.381861, -1.064223, 1, 0, 0, 1, 1,
-0.4487532, 0.5569101, 0.8429148, 1, 0, 0, 1, 1,
-0.4450988, 0.4604475, 1.802838, 1, 0, 0, 1, 1,
-0.4434118, -0.7011116, -3.32154, 1, 0, 0, 1, 1,
-0.4394889, -1.693324, -1.77884, 0, 0, 0, 1, 1,
-0.4390686, 0.2323775, 0.4785352, 0, 0, 0, 1, 1,
-0.4381474, 0.3092795, -0.3262848, 0, 0, 0, 1, 1,
-0.4371185, 0.313098, -0.5970788, 0, 0, 0, 1, 1,
-0.4364664, -1.316586, -1.688715, 0, 0, 0, 1, 1,
-0.4303363, -1.397706, -3.948976, 0, 0, 0, 1, 1,
-0.4262459, -0.2217057, -1.924105, 0, 0, 0, 1, 1,
-0.4238251, 1.049199, -0.5544748, 1, 1, 1, 1, 1,
-0.4207326, 0.4951584, -1.018072, 1, 1, 1, 1, 1,
-0.4157194, 0.1089575, 0.1020971, 1, 1, 1, 1, 1,
-0.4138704, 0.2350807, -0.3060913, 1, 1, 1, 1, 1,
-0.4089748, 1.702393, -0.4819714, 1, 1, 1, 1, 1,
-0.4089356, 1.167657, 0.813459, 1, 1, 1, 1, 1,
-0.4087422, 1.094616, -1.440206, 1, 1, 1, 1, 1,
-0.4049852, -1.484855, -3.399584, 1, 1, 1, 1, 1,
-0.4038845, 1.83214, -1.880969, 1, 1, 1, 1, 1,
-0.3991185, 0.03378722, 1.106978, 1, 1, 1, 1, 1,
-0.3918077, 0.2324373, -0.71478, 1, 1, 1, 1, 1,
-0.3840248, 0.2644608, 1.316465, 1, 1, 1, 1, 1,
-0.3771465, -0.1499798, -2.82828, 1, 1, 1, 1, 1,
-0.3732716, -0.6092412, -2.79819, 1, 1, 1, 1, 1,
-0.3697255, 0.9182014, -0.8212606, 1, 1, 1, 1, 1,
-0.3695211, 0.1180687, -1.921152, 0, 0, 1, 1, 1,
-0.3685715, -1.215666, -1.845667, 1, 0, 0, 1, 1,
-0.3672982, 0.6867521, -0.6310704, 1, 0, 0, 1, 1,
-0.3668454, 1.051385, -0.547168, 1, 0, 0, 1, 1,
-0.3645639, -2.076093, -4.146161, 1, 0, 0, 1, 1,
-0.3642251, -0.9477195, -1.757935, 1, 0, 0, 1, 1,
-0.3641694, -1.14552, -3.008802, 0, 0, 0, 1, 1,
-0.3629225, 1.196923, 0.6898611, 0, 0, 0, 1, 1,
-0.3604031, -1.090747, -4.426187, 0, 0, 0, 1, 1,
-0.360035, -0.7134064, -3.08532, 0, 0, 0, 1, 1,
-0.3593803, -1.29558, -1.944857, 0, 0, 0, 1, 1,
-0.3569629, -1.3097, -1.866507, 0, 0, 0, 1, 1,
-0.3518339, 0.7395993, -1.104373, 0, 0, 0, 1, 1,
-0.3513342, 1.631168, 1.706848, 1, 1, 1, 1, 1,
-0.3512535, -0.6025306, -3.417085, 1, 1, 1, 1, 1,
-0.3503674, 0.02425957, 0.3726389, 1, 1, 1, 1, 1,
-0.3455393, 0.1794014, -1.965487, 1, 1, 1, 1, 1,
-0.3438202, 0.7655565, -0.7859918, 1, 1, 1, 1, 1,
-0.3418964, -0.008838277, -2.332914, 1, 1, 1, 1, 1,
-0.3397981, -0.1416475, -0.6726074, 1, 1, 1, 1, 1,
-0.3396828, -0.8023139, -2.316912, 1, 1, 1, 1, 1,
-0.3392383, -1.382831, -2.786998, 1, 1, 1, 1, 1,
-0.3392356, 0.9030429, -0.443641, 1, 1, 1, 1, 1,
-0.3343775, -1.685716, -1.691692, 1, 1, 1, 1, 1,
-0.3297186, 0.653044, -2.037155, 1, 1, 1, 1, 1,
-0.3264951, -1.53497, -1.814651, 1, 1, 1, 1, 1,
-0.3263164, -1.242633, -4.191185, 1, 1, 1, 1, 1,
-0.3243268, -0.0876938, -2.128983, 1, 1, 1, 1, 1,
-0.3121839, -1.353469, -4.258519, 0, 0, 1, 1, 1,
-0.3058976, 1.010469, -0.3674349, 1, 0, 0, 1, 1,
-0.305466, 1.174, 0.3614541, 1, 0, 0, 1, 1,
-0.3021997, 0.1411037, -0.932014, 1, 0, 0, 1, 1,
-0.3007505, -0.2512912, -3.238795, 1, 0, 0, 1, 1,
-0.300417, 1.156798, -0.1115814, 1, 0, 0, 1, 1,
-0.2944016, 2.676976, -0.05994783, 0, 0, 0, 1, 1,
-0.2875533, -1.354702, -2.050943, 0, 0, 0, 1, 1,
-0.2842812, 0.5520917, -0.4490158, 0, 0, 0, 1, 1,
-0.2754515, 0.8559895, 0.3440454, 0, 0, 0, 1, 1,
-0.2657541, -0.2515281, -0.8102651, 0, 0, 0, 1, 1,
-0.2614979, 0.1309223, 0.4210364, 0, 0, 0, 1, 1,
-0.2605977, 1.11766, -0.8788912, 0, 0, 0, 1, 1,
-0.2585377, -0.1729343, -2.617704, 1, 1, 1, 1, 1,
-0.2556605, 0.1832035, -1.05442, 1, 1, 1, 1, 1,
-0.2554932, 1.981513, -1.400991, 1, 1, 1, 1, 1,
-0.2518588, -0.910178, -3.832488, 1, 1, 1, 1, 1,
-0.2470843, -1.173737, -2.516541, 1, 1, 1, 1, 1,
-0.2468817, 1.330973, -1.005249, 1, 1, 1, 1, 1,
-0.2466431, -0.6406895, -2.429137, 1, 1, 1, 1, 1,
-0.2447753, 1.297521, 0.2374571, 1, 1, 1, 1, 1,
-0.2430042, -2.496758, -3.574236, 1, 1, 1, 1, 1,
-0.2429882, 0.5531881, -0.08336591, 1, 1, 1, 1, 1,
-0.2429547, -0.3338263, -1.661475, 1, 1, 1, 1, 1,
-0.2404296, 1.025922, -0.07672852, 1, 1, 1, 1, 1,
-0.2402122, -0.6565669, -3.575629, 1, 1, 1, 1, 1,
-0.2389564, 0.2000167, -1.418441, 1, 1, 1, 1, 1,
-0.2333989, -0.4865196, -3.748046, 1, 1, 1, 1, 1,
-0.2287065, -0.3751262, -1.046135, 0, 0, 1, 1, 1,
-0.2285252, 0.5136303, 0.256114, 1, 0, 0, 1, 1,
-0.2283087, -0.4764093, -3.642702, 1, 0, 0, 1, 1,
-0.2235789, 1.062743, -0.1639221, 1, 0, 0, 1, 1,
-0.2190076, 0.2044822, -0.6234437, 1, 0, 0, 1, 1,
-0.2143314, -1.492729, -4.055133, 1, 0, 0, 1, 1,
-0.2108356, -0.3950412, -3.297435, 0, 0, 0, 1, 1,
-0.2103949, -0.6872041, -2.191188, 0, 0, 0, 1, 1,
-0.2089595, -0.5914256, -4.139053, 0, 0, 0, 1, 1,
-0.1978649, 0.1624334, -2.955651, 0, 0, 0, 1, 1,
-0.1966089, -0.5270168, -3.395386, 0, 0, 0, 1, 1,
-0.196343, -0.788098, -3.109478, 0, 0, 0, 1, 1,
-0.1956404, 1.198621, -1.006791, 0, 0, 0, 1, 1,
-0.1935801, -1.477744, -3.371718, 1, 1, 1, 1, 1,
-0.1929619, 0.2947881, 0.3485445, 1, 1, 1, 1, 1,
-0.1845794, -1.016748, -2.508655, 1, 1, 1, 1, 1,
-0.1842006, -0.279117, -1.435859, 1, 1, 1, 1, 1,
-0.1824873, -0.5413051, -1.427005, 1, 1, 1, 1, 1,
-0.1823114, 0.3600256, -1.150584, 1, 1, 1, 1, 1,
-0.1776489, -0.633232, -1.396736, 1, 1, 1, 1, 1,
-0.1760338, -0.2676472, -2.680242, 1, 1, 1, 1, 1,
-0.1758412, -0.4284728, -0.7998752, 1, 1, 1, 1, 1,
-0.1756453, -1.303878, -3.499234, 1, 1, 1, 1, 1,
-0.1749868, 0.7817025, -0.7434264, 1, 1, 1, 1, 1,
-0.1735629, 0.1875056, -0.5009214, 1, 1, 1, 1, 1,
-0.1710851, -1.811658, -2.521681, 1, 1, 1, 1, 1,
-0.1704244, -0.8119482, -1.151736, 1, 1, 1, 1, 1,
-0.1688922, -2.096495, -1.438096, 1, 1, 1, 1, 1,
-0.1684391, -0.06597947, -3.052809, 0, 0, 1, 1, 1,
-0.1663846, -0.4708197, -4.298163, 1, 0, 0, 1, 1,
-0.1645107, 1.871882, -0.9575791, 1, 0, 0, 1, 1,
-0.1572972, -0.689889, -4.456189, 1, 0, 0, 1, 1,
-0.1536191, -0.1793502, -3.235827, 1, 0, 0, 1, 1,
-0.1526016, 1.198577, -0.6424262, 1, 0, 0, 1, 1,
-0.1477702, 1.949779, 2.504333, 0, 0, 0, 1, 1,
-0.1367098, 1.413981, -1.154627, 0, 0, 0, 1, 1,
-0.1362212, -0.1454092, -1.773611, 0, 0, 0, 1, 1,
-0.1355146, 0.7336189, -1.097195, 0, 0, 0, 1, 1,
-0.1333654, 0.2131015, -1.434026, 0, 0, 0, 1, 1,
-0.1321787, -1.06582, -1.427105, 0, 0, 0, 1, 1,
-0.1293612, 1.08262, -0.3300411, 0, 0, 0, 1, 1,
-0.1264028, -0.1046381, -2.101153, 1, 1, 1, 1, 1,
-0.1254666, 0.1477354, -1.244309, 1, 1, 1, 1, 1,
-0.1247438, 1.985641, 0.1040786, 1, 1, 1, 1, 1,
-0.1214661, -0.7146357, -4.387243, 1, 1, 1, 1, 1,
-0.1209255, -0.2790396, -3.208664, 1, 1, 1, 1, 1,
-0.1198129, 1.526748, -0.1555386, 1, 1, 1, 1, 1,
-0.1191021, 0.1243895, -0.5560732, 1, 1, 1, 1, 1,
-0.1160832, -0.0986276, -3.287907, 1, 1, 1, 1, 1,
-0.1143375, -1.238487, -1.681017, 1, 1, 1, 1, 1,
-0.113556, -0.01090713, -3.039265, 1, 1, 1, 1, 1,
-0.112401, 0.3764334, -0.4582999, 1, 1, 1, 1, 1,
-0.111705, 0.4475637, -0.5077943, 1, 1, 1, 1, 1,
-0.1087501, -0.4972726, -2.313763, 1, 1, 1, 1, 1,
-0.1062568, -0.3670736, -1.594039, 1, 1, 1, 1, 1,
-0.1053095, 1.01188, 0.005245889, 1, 1, 1, 1, 1,
-0.1038472, -0.7127726, -3.436082, 0, 0, 1, 1, 1,
-0.1033385, -1.036322, -2.742329, 1, 0, 0, 1, 1,
-0.1026921, -0.759325, -4.846317, 1, 0, 0, 1, 1,
-0.1024224, -0.144935, -1.872306, 1, 0, 0, 1, 1,
-0.09314795, 0.6532096, -0.5416253, 1, 0, 0, 1, 1,
-0.09233096, -1.739596, -1.939904, 1, 0, 0, 1, 1,
-0.08986153, 1.399669, -0.7423917, 0, 0, 0, 1, 1,
-0.08809287, 0.4042101, -0.7107284, 0, 0, 0, 1, 1,
-0.08657163, -0.6868086, -0.6623443, 0, 0, 0, 1, 1,
-0.08578177, -0.6980056, -3.720323, 0, 0, 0, 1, 1,
-0.08371003, -0.301855, -3.401731, 0, 0, 0, 1, 1,
-0.07750118, -1.11287, -0.6647265, 0, 0, 0, 1, 1,
-0.07634921, -1.824291, -3.971141, 0, 0, 0, 1, 1,
-0.07616386, -1.488418, -3.32335, 1, 1, 1, 1, 1,
-0.0738758, 0.3656054, 1.625283, 1, 1, 1, 1, 1,
-0.07243735, -1.062526, -1.945013, 1, 1, 1, 1, 1,
-0.07016635, 0.2175926, 0.2308193, 1, 1, 1, 1, 1,
-0.06726269, 0.2638338, 0.9217819, 1, 1, 1, 1, 1,
-0.0604027, -0.8320187, -3.106992, 1, 1, 1, 1, 1,
-0.05927346, -0.01338539, -2.756726, 1, 1, 1, 1, 1,
-0.05428686, -0.8407977, -4.294534, 1, 1, 1, 1, 1,
-0.0519366, 1.039744, -0.397023, 1, 1, 1, 1, 1,
-0.05092502, 0.5306364, -0.04480115, 1, 1, 1, 1, 1,
-0.0502867, 0.9420852, -0.03428702, 1, 1, 1, 1, 1,
-0.05007346, -2.029032, -3.526382, 1, 1, 1, 1, 1,
-0.04925863, -0.3764285, -2.501049, 1, 1, 1, 1, 1,
-0.04392327, 0.8709074, -1.033717, 1, 1, 1, 1, 1,
-0.04319809, 0.5739737, -0.1417101, 1, 1, 1, 1, 1,
-0.04015492, -1.923284, -0.6152837, 0, 0, 1, 1, 1,
-0.03899198, -0.3544392, -5.083523, 1, 0, 0, 1, 1,
-0.03811755, 0.2627161, -0.8959246, 1, 0, 0, 1, 1,
-0.03209907, 0.08160905, 0.04774123, 1, 0, 0, 1, 1,
-0.03155, -0.9251365, -2.476023, 1, 0, 0, 1, 1,
-0.02420614, -1.49881, -3.164804, 1, 0, 0, 1, 1,
-0.02306115, -0.4694959, -1.933416, 0, 0, 0, 1, 1,
-0.01842606, 1.565926, -0.826543, 0, 0, 0, 1, 1,
-0.01766589, -0.7638536, -1.172399, 0, 0, 0, 1, 1,
-0.0170538, 0.6797315, -0.07314631, 0, 0, 0, 1, 1,
-0.01204445, -0.195813, -2.525499, 0, 0, 0, 1, 1,
-0.007751203, 0.4638895, 0.9036514, 0, 0, 0, 1, 1,
-0.00560673, 0.4101585, -1.320571, 0, 0, 0, 1, 1,
-0.001904075, 0.6643625, 0.6523802, 1, 1, 1, 1, 1,
0.0001162565, -0.01742505, 5.248248, 1, 1, 1, 1, 1,
0.001719846, -0.7880779, 1.845819, 1, 1, 1, 1, 1,
0.003175295, -0.445014, 2.792036, 1, 1, 1, 1, 1,
0.01039432, 0.09374548, 1.012636, 1, 1, 1, 1, 1,
0.01277138, -0.6291643, 2.326848, 1, 1, 1, 1, 1,
0.01625266, 0.3579898, -1.956427, 1, 1, 1, 1, 1,
0.0169726, 1.692034, 0.2445255, 1, 1, 1, 1, 1,
0.02625442, 0.6444947, 0.9033117, 1, 1, 1, 1, 1,
0.03207464, -0.07789978, 4.278493, 1, 1, 1, 1, 1,
0.0335571, -0.2482696, 3.419168, 1, 1, 1, 1, 1,
0.03520099, -0.3733109, 1.815395, 1, 1, 1, 1, 1,
0.03579355, -0.9129454, 3.322865, 1, 1, 1, 1, 1,
0.0378232, -0.6418903, 3.481135, 1, 1, 1, 1, 1,
0.0387932, 0.2221438, -0.03638709, 1, 1, 1, 1, 1,
0.0428849, 0.6307939, 1.710068, 0, 0, 1, 1, 1,
0.05078482, 0.7275875, 0.9703218, 1, 0, 0, 1, 1,
0.05522475, 0.7159289, 0.6983572, 1, 0, 0, 1, 1,
0.05739912, 0.4248199, -0.9908996, 1, 0, 0, 1, 1,
0.05778751, 0.222112, -1.061577, 1, 0, 0, 1, 1,
0.06644227, -1.250719, 2.387235, 1, 0, 0, 1, 1,
0.06757428, 1.023153, 0.577679, 0, 0, 0, 1, 1,
0.07302292, -0.1757525, 2.376623, 0, 0, 0, 1, 1,
0.07346066, 1.286475, -0.6561536, 0, 0, 0, 1, 1,
0.07661236, 1.277767, 1.045383, 0, 0, 0, 1, 1,
0.07989312, -1.017442, 2.2201, 0, 0, 0, 1, 1,
0.08036543, -0.7093881, 2.067277, 0, 0, 0, 1, 1,
0.08190186, 1.418032, 0.280364, 0, 0, 0, 1, 1,
0.08344184, 0.06281943, 0.7289404, 1, 1, 1, 1, 1,
0.08464945, -1.993053, 4.044116, 1, 1, 1, 1, 1,
0.09535237, 1.629278, -1.22161, 1, 1, 1, 1, 1,
0.09676301, 0.8145602, 0.8406205, 1, 1, 1, 1, 1,
0.09917744, -1.262139, 2.462671, 1, 1, 1, 1, 1,
0.1012844, -0.862841, 2.810072, 1, 1, 1, 1, 1,
0.1062964, 0.2813331, 0.6486189, 1, 1, 1, 1, 1,
0.1081275, 0.7753741, 0.3254275, 1, 1, 1, 1, 1,
0.1092516, 0.930744, 0.7715021, 1, 1, 1, 1, 1,
0.1096862, -1.712191, 0.9644244, 1, 1, 1, 1, 1,
0.1106722, -1.468846, 3.571246, 1, 1, 1, 1, 1,
0.1130924, -1.553336, 3.470839, 1, 1, 1, 1, 1,
0.1132084, -0.4993747, 2.665841, 1, 1, 1, 1, 1,
0.1147238, -1.586988, 4.102719, 1, 1, 1, 1, 1,
0.1218292, -0.119207, 4.949169, 1, 1, 1, 1, 1,
0.1240752, 0.2218216, 0.6995621, 0, 0, 1, 1, 1,
0.1252686, -1.967028, 1.722295, 1, 0, 0, 1, 1,
0.1254594, -1.53081, 2.87938, 1, 0, 0, 1, 1,
0.1275122, -0.1981816, 1.400957, 1, 0, 0, 1, 1,
0.1331904, -1.024964, 3.100996, 1, 0, 0, 1, 1,
0.1392955, -0.7102036, 2.621919, 1, 0, 0, 1, 1,
0.1396305, 1.688086, -0.7246746, 0, 0, 0, 1, 1,
0.1422312, 0.1708146, 2.425911, 0, 0, 0, 1, 1,
0.1445135, -0.4751172, 2.106203, 0, 0, 0, 1, 1,
0.1476207, -0.5796148, 2.428021, 0, 0, 0, 1, 1,
0.1527706, -0.3591262, 3.101949, 0, 0, 0, 1, 1,
0.1536095, -1.602401, 2.502307, 0, 0, 0, 1, 1,
0.1543745, -0.7231967, 4.359053, 0, 0, 0, 1, 1,
0.1576683, -1.013023, 2.464158, 1, 1, 1, 1, 1,
0.1601184, 0.3574185, 1.957722, 1, 1, 1, 1, 1,
0.1612173, 0.2012949, -0.5863576, 1, 1, 1, 1, 1,
0.1637397, 3.499713, 2.577931, 1, 1, 1, 1, 1,
0.1706428, 0.3553299, 0.303382, 1, 1, 1, 1, 1,
0.1707449, -1.247001, 1.387105, 1, 1, 1, 1, 1,
0.1731786, -1.352496, 1.358461, 1, 1, 1, 1, 1,
0.1837576, -0.5557608, 2.027735, 1, 1, 1, 1, 1,
0.1876267, -0.5353575, 4.717491, 1, 1, 1, 1, 1,
0.1883713, -0.1279551, 3.292398, 1, 1, 1, 1, 1,
0.1915016, -0.5511013, 1.995153, 1, 1, 1, 1, 1,
0.1974965, 0.9853632, 1.712355, 1, 1, 1, 1, 1,
0.1982272, -1.037427, 2.667145, 1, 1, 1, 1, 1,
0.1986696, 1.184651, -0.6987606, 1, 1, 1, 1, 1,
0.1991135, -1.233448, 2.756236, 1, 1, 1, 1, 1,
0.1994866, 2.398552, -0.5794897, 0, 0, 1, 1, 1,
0.206275, 0.4656937, 0.9777483, 1, 0, 0, 1, 1,
0.2093816, -0.2464207, 3.610985, 1, 0, 0, 1, 1,
0.2099017, -1.01922, 2.55128, 1, 0, 0, 1, 1,
0.2163557, -0.7918824, 3.094382, 1, 0, 0, 1, 1,
0.2181976, -1.57125, 2.844426, 1, 0, 0, 1, 1,
0.218224, 1.976488, 0.5452069, 0, 0, 0, 1, 1,
0.2183458, 1.519478, 1.421544, 0, 0, 0, 1, 1,
0.2185817, 0.6129065, 1.118247, 0, 0, 0, 1, 1,
0.2236826, 1.982018, 0.234219, 0, 0, 0, 1, 1,
0.224487, -0.5328285, 2.247805, 0, 0, 0, 1, 1,
0.2245686, 0.6590542, -0.2732527, 0, 0, 0, 1, 1,
0.2269056, -0.8990483, 2.615632, 0, 0, 0, 1, 1,
0.2288938, -0.1339351, 1.287508, 1, 1, 1, 1, 1,
0.2308549, -0.2609074, 2.270787, 1, 1, 1, 1, 1,
0.2337689, -0.388898, 2.587424, 1, 1, 1, 1, 1,
0.2343085, 0.6381938, 0.1653474, 1, 1, 1, 1, 1,
0.2352062, 0.5700844, 1.613827, 1, 1, 1, 1, 1,
0.2355348, -0.9358361, 1.827538, 1, 1, 1, 1, 1,
0.2412158, 1.972303, 0.6656815, 1, 1, 1, 1, 1,
0.2491156, -0.01079041, 2.291093, 1, 1, 1, 1, 1,
0.2495802, -1.80769, 2.554476, 1, 1, 1, 1, 1,
0.2522246, 0.7344742, -1.021458, 1, 1, 1, 1, 1,
0.2523858, -0.2396862, 1.892916, 1, 1, 1, 1, 1,
0.2551412, 2.445855, -0.7428038, 1, 1, 1, 1, 1,
0.2557111, 0.8298786, 1.213848, 1, 1, 1, 1, 1,
0.2563081, 0.6766956, 1.56814, 1, 1, 1, 1, 1,
0.2602555, 0.7014356, -0.03969272, 1, 1, 1, 1, 1,
0.2608113, 0.4429138, 0.3276908, 0, 0, 1, 1, 1,
0.2649516, -1.030735, 2.517239, 1, 0, 0, 1, 1,
0.2651722, -0.1554318, 1.582291, 1, 0, 0, 1, 1,
0.2679955, 1.34101, -0.1387431, 1, 0, 0, 1, 1,
0.2687771, 0.04391176, 1.337228, 1, 0, 0, 1, 1,
0.2697961, 1.145851, 0.342033, 1, 0, 0, 1, 1,
0.2710571, -1.338243, 2.271264, 0, 0, 0, 1, 1,
0.2772352, 3.084056, -2.691429, 0, 0, 0, 1, 1,
0.2829067, 2.186122, 0.3060545, 0, 0, 0, 1, 1,
0.2893415, -0.2060465, 1.07328, 0, 0, 0, 1, 1,
0.2948538, 2.047752, 0.4859486, 0, 0, 0, 1, 1,
0.2960923, 0.6964894, -1.097666, 0, 0, 0, 1, 1,
0.2994437, -0.7739742, 2.633974, 0, 0, 0, 1, 1,
0.2997259, 0.9393695, -0.4541176, 1, 1, 1, 1, 1,
0.3032514, 0.8327362, 1.14269, 1, 1, 1, 1, 1,
0.3079171, -0.5132862, 1.854866, 1, 1, 1, 1, 1,
0.308382, 0.7793812, 2.598455, 1, 1, 1, 1, 1,
0.3085446, -1.394351, 2.677451, 1, 1, 1, 1, 1,
0.3114245, -0.5185056, 2.982551, 1, 1, 1, 1, 1,
0.3145972, -0.248705, 2.773766, 1, 1, 1, 1, 1,
0.3199748, 0.1268968, 1.099308, 1, 1, 1, 1, 1,
0.3205406, 1.05848, 1.116946, 1, 1, 1, 1, 1,
0.3239692, -0.9263582, 1.194789, 1, 1, 1, 1, 1,
0.32704, 1.095394, 1.478165, 1, 1, 1, 1, 1,
0.3279993, -0.03927321, 1.639046, 1, 1, 1, 1, 1,
0.3341388, 0.7493075, -0.6424884, 1, 1, 1, 1, 1,
0.3382669, -0.5722554, 3.896575, 1, 1, 1, 1, 1,
0.3391013, -2.537581, 3.276869, 1, 1, 1, 1, 1,
0.3398408, -1.457818, 1.940162, 0, 0, 1, 1, 1,
0.3408131, -0.3467674, 2.676711, 1, 0, 0, 1, 1,
0.341098, -0.5944341, 2.495082, 1, 0, 0, 1, 1,
0.3570496, 0.3527123, 0.06425788, 1, 0, 0, 1, 1,
0.3574148, -0.06885576, 1.978289, 1, 0, 0, 1, 1,
0.358085, 0.7340764, 0.9654768, 1, 0, 0, 1, 1,
0.362157, 0.928448, -0.4671709, 0, 0, 0, 1, 1,
0.3655953, 1.770402, -0.3711881, 0, 0, 0, 1, 1,
0.3699941, 0.02154956, 0.7473909, 0, 0, 0, 1, 1,
0.3721652, -1.023581, 4.382032, 0, 0, 0, 1, 1,
0.375179, -0.06944183, 4.406524, 0, 0, 0, 1, 1,
0.3775326, 0.7290911, -0.573691, 0, 0, 0, 1, 1,
0.3811803, 0.1891197, 2.248985, 0, 0, 0, 1, 1,
0.3817328, 1.130694, 0.9822443, 1, 1, 1, 1, 1,
0.3861176, 0.3341825, 1.545165, 1, 1, 1, 1, 1,
0.4005513, -1.070895, 3.791304, 1, 1, 1, 1, 1,
0.4066254, 0.8938088, 1.060089, 1, 1, 1, 1, 1,
0.4071597, 1.453612, 0.6311266, 1, 1, 1, 1, 1,
0.4079774, 0.6373228, 2.038686, 1, 1, 1, 1, 1,
0.4093419, -1.685762, 1.156272, 1, 1, 1, 1, 1,
0.4201204, 1.418669, -0.6940116, 1, 1, 1, 1, 1,
0.4230789, -0.1100357, -0.05046393, 1, 1, 1, 1, 1,
0.4271024, 0.4550681, 3.430527, 1, 1, 1, 1, 1,
0.4287193, -0.2561967, 0.3482188, 1, 1, 1, 1, 1,
0.4309161, -0.2458525, 1.551088, 1, 1, 1, 1, 1,
0.4309743, -0.257944, 2.174958, 1, 1, 1, 1, 1,
0.4320049, 0.6955801, 0.06889855, 1, 1, 1, 1, 1,
0.4337109, -0.6031526, 1.127611, 1, 1, 1, 1, 1,
0.4367576, 1.253135, 0.1588945, 0, 0, 1, 1, 1,
0.4445512, -0.6444396, 1.193346, 1, 0, 0, 1, 1,
0.445824, -0.9124213, 5.140582, 1, 0, 0, 1, 1,
0.4458298, -0.452956, 2.338464, 1, 0, 0, 1, 1,
0.4503477, -0.2755566, 3.091288, 1, 0, 0, 1, 1,
0.4507584, 1.704502, 1.791517, 1, 0, 0, 1, 1,
0.4520559, -1.534619, 2.67786, 0, 0, 0, 1, 1,
0.4537108, -0.4642174, 2.964984, 0, 0, 0, 1, 1,
0.4557357, 1.448482, 1.118626, 0, 0, 0, 1, 1,
0.4621992, -1.266662, 2.283531, 0, 0, 0, 1, 1,
0.4625232, -1.448065, 2.278452, 0, 0, 0, 1, 1,
0.4675587, 1.1206, 0.03876428, 0, 0, 0, 1, 1,
0.4693264, 0.9627325, 1.798667, 0, 0, 0, 1, 1,
0.4709891, -1.515024, 3.933572, 1, 1, 1, 1, 1,
0.4732124, -0.3826856, 2.232831, 1, 1, 1, 1, 1,
0.4745156, 1.169518, -0.7616509, 1, 1, 1, 1, 1,
0.4774741, 1.481633, 0.371744, 1, 1, 1, 1, 1,
0.479239, 0.1253523, -0.2900167, 1, 1, 1, 1, 1,
0.4808051, 0.8050029, 1.157391, 1, 1, 1, 1, 1,
0.4813066, 0.620635, -0.06957629, 1, 1, 1, 1, 1,
0.4817562, -0.2254086, 1.712607, 1, 1, 1, 1, 1,
0.4831934, -0.01749593, 1.876483, 1, 1, 1, 1, 1,
0.4843946, -0.4714375, 1.949563, 1, 1, 1, 1, 1,
0.4849252, -2.151523, 2.627211, 1, 1, 1, 1, 1,
0.4870252, 0.2948511, -0.8293324, 1, 1, 1, 1, 1,
0.4871483, -0.9589923, 3.669226, 1, 1, 1, 1, 1,
0.4886184, -0.02608396, 0.8188375, 1, 1, 1, 1, 1,
0.4892997, 0.6032865, 0.1528425, 1, 1, 1, 1, 1,
0.4929402, 1.036909, 0.4971643, 0, 0, 1, 1, 1,
0.4955474, -0.17569, 1.900583, 1, 0, 0, 1, 1,
0.5009481, 0.2011312, 1.542271, 1, 0, 0, 1, 1,
0.5025419, -1.958559, 3.205858, 1, 0, 0, 1, 1,
0.5038784, 1.218955, 1.321041, 1, 0, 0, 1, 1,
0.506402, -0.442093, 1.356621, 1, 0, 0, 1, 1,
0.5110001, -0.5892041, 3.658525, 0, 0, 0, 1, 1,
0.5115075, -0.9761487, 2.937778, 0, 0, 0, 1, 1,
0.5189993, -1.50121, 3.482089, 0, 0, 0, 1, 1,
0.5211655, 1.055273, 0.3070597, 0, 0, 0, 1, 1,
0.5226644, 0.9768173, -0.1641405, 0, 0, 0, 1, 1,
0.5226874, 0.9917536, 0.2987764, 0, 0, 0, 1, 1,
0.5237756, -1.798794, 2.895105, 0, 0, 0, 1, 1,
0.5244405, -0.5985538, 1.820038, 1, 1, 1, 1, 1,
0.5266852, 0.5295867, 1.133826, 1, 1, 1, 1, 1,
0.5289434, 0.4295109, -0.2989513, 1, 1, 1, 1, 1,
0.530071, 0.4125103, -0.5720212, 1, 1, 1, 1, 1,
0.5312373, -1.25718, 2.318956, 1, 1, 1, 1, 1,
0.5312724, 0.7572235, -0.7406241, 1, 1, 1, 1, 1,
0.5340427, -0.7895675, 2.911211, 1, 1, 1, 1, 1,
0.5351722, -1.081183, 3.062716, 1, 1, 1, 1, 1,
0.5402692, 0.890614, -0.624229, 1, 1, 1, 1, 1,
0.5465737, -0.4855243, 3.114733, 1, 1, 1, 1, 1,
0.5483624, -1.243022, 3.106816, 1, 1, 1, 1, 1,
0.5500067, 1.14236, -0.1474432, 1, 1, 1, 1, 1,
0.5540255, 1.208441, -0.08529055, 1, 1, 1, 1, 1,
0.5559822, 1.128229, 1.144483, 1, 1, 1, 1, 1,
0.5585011, -1.250344, 1.633428, 1, 1, 1, 1, 1,
0.5620582, 0.04630183, 2.452174, 0, 0, 1, 1, 1,
0.5633116, 0.627325, 1.437065, 1, 0, 0, 1, 1,
0.5640522, 0.6391687, -1.926138, 1, 0, 0, 1, 1,
0.5640877, -0.3144555, 1.419453, 1, 0, 0, 1, 1,
0.5674987, -0.9270521, 2.448998, 1, 0, 0, 1, 1,
0.5730382, -0.1652759, 1.7774, 1, 0, 0, 1, 1,
0.5761464, -0.7519268, 3.312724, 0, 0, 0, 1, 1,
0.57772, -0.5539618, 2.459907, 0, 0, 0, 1, 1,
0.578288, 0.6850142, 1.214768, 0, 0, 0, 1, 1,
0.5858163, 0.4644445, -0.6846982, 0, 0, 0, 1, 1,
0.5870857, 0.1421097, 2.476168, 0, 0, 0, 1, 1,
0.5914614, 1.092079, 1.140561, 0, 0, 0, 1, 1,
0.5917882, 0.685254, 0.5817281, 0, 0, 0, 1, 1,
0.5962058, 0.286801, 0.6981758, 1, 1, 1, 1, 1,
0.6026549, -0.6874959, 1.750714, 1, 1, 1, 1, 1,
0.6052663, -0.4666758, 2.154941, 1, 1, 1, 1, 1,
0.6063218, -0.7776646, 3.054376, 1, 1, 1, 1, 1,
0.6065579, -1.80725, 1.579861, 1, 1, 1, 1, 1,
0.6085197, -0.9289781, 3.165259, 1, 1, 1, 1, 1,
0.6109233, -0.3000754, 1.183749, 1, 1, 1, 1, 1,
0.6117135, 0.0468012, 1.692473, 1, 1, 1, 1, 1,
0.6194518, -1.249249, 2.184459, 1, 1, 1, 1, 1,
0.6197116, -0.4689353, 2.13236, 1, 1, 1, 1, 1,
0.6233176, 0.2024998, 1.303687, 1, 1, 1, 1, 1,
0.6240984, -0.4377841, 3.052752, 1, 1, 1, 1, 1,
0.6287844, 1.231665, -0.2928937, 1, 1, 1, 1, 1,
0.6293831, 1.224435, -1.057729, 1, 1, 1, 1, 1,
0.6333204, -1.531037, 2.579414, 1, 1, 1, 1, 1,
0.6421589, -1.040769, 0.9919513, 0, 0, 1, 1, 1,
0.6429714, 0.8917019, 0.3728141, 1, 0, 0, 1, 1,
0.6494991, 0.02556855, 2.112808, 1, 0, 0, 1, 1,
0.6538398, -0.8430454, 1.438178, 1, 0, 0, 1, 1,
0.656033, 0.4387867, 0.001843804, 1, 0, 0, 1, 1,
0.6576023, 0.6564708, 1.254968, 1, 0, 0, 1, 1,
0.6658279, -2.068191, 2.504203, 0, 0, 0, 1, 1,
0.6792243, -0.2983936, 0.8135218, 0, 0, 0, 1, 1,
0.6819817, -0.5237007, 1.74969, 0, 0, 0, 1, 1,
0.6845235, 1.062732, -0.09766597, 0, 0, 0, 1, 1,
0.684905, -0.3833332, 2.089121, 0, 0, 0, 1, 1,
0.6851388, 1.419999, -0.3909797, 0, 0, 0, 1, 1,
0.6855198, -0.5782661, 1.403713, 0, 0, 0, 1, 1,
0.6946744, 1.190588, 0.6534677, 1, 1, 1, 1, 1,
0.7038165, 0.1145882, 0.9279437, 1, 1, 1, 1, 1,
0.70419, 1.16014, 0.6187817, 1, 1, 1, 1, 1,
0.7067425, -1.472235, 1.917575, 1, 1, 1, 1, 1,
0.711839, 0.2111406, 1.699229, 1, 1, 1, 1, 1,
0.7155569, 0.2188369, 3.402991, 1, 1, 1, 1, 1,
0.7307972, 0.8485761, 2.066234, 1, 1, 1, 1, 1,
0.731407, 0.5264068, 0.06558987, 1, 1, 1, 1, 1,
0.7347742, -1.324315, 2.492218, 1, 1, 1, 1, 1,
0.7354987, 0.1372716, 1.336071, 1, 1, 1, 1, 1,
0.7393113, 1.5886, 0.3332814, 1, 1, 1, 1, 1,
0.7399852, -1.042975, 2.038901, 1, 1, 1, 1, 1,
0.7399977, 0.08916046, 1.894772, 1, 1, 1, 1, 1,
0.7422103, 1.092383, 2.324047, 1, 1, 1, 1, 1,
0.7528482, -0.6196385, 1.323855, 1, 1, 1, 1, 1,
0.7562715, 0.09818661, 1.98201, 0, 0, 1, 1, 1,
0.7579204, -0.7563095, 0.6161796, 1, 0, 0, 1, 1,
0.758246, 1.096726, 1.08403, 1, 0, 0, 1, 1,
0.7622995, -0.02856012, 2.423727, 1, 0, 0, 1, 1,
0.7628244, 0.2315679, 0.419046, 1, 0, 0, 1, 1,
0.764724, -1.663249, 1.876786, 1, 0, 0, 1, 1,
0.7665879, 0.2613021, -0.07004134, 0, 0, 0, 1, 1,
0.7712181, -0.5225134, 3.187955, 0, 0, 0, 1, 1,
0.7774571, 1.010703, 1.471904, 0, 0, 0, 1, 1,
0.7795496, 0.01709499, 0.8180137, 0, 0, 0, 1, 1,
0.7826414, 0.6420532, 1.618233, 0, 0, 0, 1, 1,
0.7830359, -1.140048, 3.248921, 0, 0, 0, 1, 1,
0.783209, -0.3400977, 0.3178145, 0, 0, 0, 1, 1,
0.7850342, -1.51251, 4.102317, 1, 1, 1, 1, 1,
0.7859187, -0.01164908, 0.6035553, 1, 1, 1, 1, 1,
0.7881839, -1.045386, 0.9835404, 1, 1, 1, 1, 1,
0.7889206, -0.8250305, 2.603342, 1, 1, 1, 1, 1,
0.789703, -0.1554285, 1.467396, 1, 1, 1, 1, 1,
0.7902356, -1.559624, 2.330349, 1, 1, 1, 1, 1,
0.7946337, 0.3329751, 1.970541, 1, 1, 1, 1, 1,
0.7956256, -0.6534734, 1.386711, 1, 1, 1, 1, 1,
0.8026984, -0.2745219, -0.2806353, 1, 1, 1, 1, 1,
0.8081611, -0.3253821, 0.8525281, 1, 1, 1, 1, 1,
0.8169139, 0.5712118, 1.227632, 1, 1, 1, 1, 1,
0.8187187, -1.174846, 3.932575, 1, 1, 1, 1, 1,
0.8201979, -0.3449322, 1.397741, 1, 1, 1, 1, 1,
0.8265476, -1.358074, 2.828943, 1, 1, 1, 1, 1,
0.8273256, -1.269544, 2.571633, 1, 1, 1, 1, 1,
0.8287596, -0.007756683, 1.82344, 0, 0, 1, 1, 1,
0.8333465, 1.385184, -0.8917764, 1, 0, 0, 1, 1,
0.8386833, 0.6458619, 0.03732002, 1, 0, 0, 1, 1,
0.8391038, 1.076007, 0.7030523, 1, 0, 0, 1, 1,
0.8409178, 0.6469628, 0.4476363, 1, 0, 0, 1, 1,
0.8468871, 0.3773164, 0.2394624, 1, 0, 0, 1, 1,
0.8479923, 0.794935, 2.048595, 0, 0, 0, 1, 1,
0.853066, -1.46991, 3.481432, 0, 0, 0, 1, 1,
0.8543997, -1.758039, 2.381866, 0, 0, 0, 1, 1,
0.8552253, 0.1338913, 1.79476, 0, 0, 0, 1, 1,
0.8595749, -1.629782, 4.138751, 0, 0, 0, 1, 1,
0.8629869, 0.1255054, 0.7927027, 0, 0, 0, 1, 1,
0.8668693, 0.8820487, 0.2064579, 0, 0, 0, 1, 1,
0.8684757, 0.7319055, 1.875113, 1, 1, 1, 1, 1,
0.8699552, -0.9343557, 2.271692, 1, 1, 1, 1, 1,
0.8737543, -0.4027427, 3.215021, 1, 1, 1, 1, 1,
0.8815485, -1.646491, 2.934896, 1, 1, 1, 1, 1,
0.8949234, 0.4843538, 1.285812, 1, 1, 1, 1, 1,
0.8977606, -1.346216, 3.36624, 1, 1, 1, 1, 1,
0.9045665, 1.094128, 2.008106, 1, 1, 1, 1, 1,
0.9057311, -0.5255066, 3.913583, 1, 1, 1, 1, 1,
0.9063388, 0.01706144, 0.06758447, 1, 1, 1, 1, 1,
0.9097198, 0.8891471, -0.01203116, 1, 1, 1, 1, 1,
0.9097791, 1.440311, 1.049303, 1, 1, 1, 1, 1,
0.9189489, -0.5672245, 2.921758, 1, 1, 1, 1, 1,
0.9208243, 0.3568065, 1.222788, 1, 1, 1, 1, 1,
0.9225836, -2.48155, 2.153939, 1, 1, 1, 1, 1,
0.9235111, -1.216891, 3.732352, 1, 1, 1, 1, 1,
0.9287707, 0.4987289, 1.719891, 0, 0, 1, 1, 1,
0.9289896, -1.944685, 2.319203, 1, 0, 0, 1, 1,
0.9296739, -0.366279, 1.67342, 1, 0, 0, 1, 1,
0.9304628, -1.241767, 1.178405, 1, 0, 0, 1, 1,
0.9347175, 1.666557, 1.351573, 1, 0, 0, 1, 1,
0.9449241, -1.02056, 2.246936, 1, 0, 0, 1, 1,
0.9482514, 0.8889058, -0.3185054, 0, 0, 0, 1, 1,
0.9518264, -1.032949, 2.123553, 0, 0, 0, 1, 1,
0.9524686, 0.563975, 0.1907939, 0, 0, 0, 1, 1,
0.9549669, -0.6567491, 3.163157, 0, 0, 0, 1, 1,
0.960391, -0.7116169, 2.84171, 0, 0, 0, 1, 1,
0.9606351, -0.0241905, 0.9402047, 0, 0, 0, 1, 1,
0.9658143, 1.114742, -0.5159242, 0, 0, 0, 1, 1,
0.9693173, -0.8025882, 0.9927357, 1, 1, 1, 1, 1,
0.9693448, -0.7225908, 1.812868, 1, 1, 1, 1, 1,
0.9717872, -0.05594651, 0.8564738, 1, 1, 1, 1, 1,
0.9718491, 0.9138541, 0.7287605, 1, 1, 1, 1, 1,
0.9721256, 1.44668, 1.761582, 1, 1, 1, 1, 1,
0.9734634, 1.707726, 0.3641797, 1, 1, 1, 1, 1,
0.9754027, -1.218314, 2.804404, 1, 1, 1, 1, 1,
0.9775968, 0.8733206, -0.3953933, 1, 1, 1, 1, 1,
0.9776676, -0.948689, 2.898808, 1, 1, 1, 1, 1,
0.9886566, -1.094834, 3.134005, 1, 1, 1, 1, 1,
0.9919187, -1.309919, 2.875394, 1, 1, 1, 1, 1,
0.9945038, 1.153491, 0.3893435, 1, 1, 1, 1, 1,
0.9986152, 1.154838, 0.4169359, 1, 1, 1, 1, 1,
1.00172, -2.569708, 3.510463, 1, 1, 1, 1, 1,
1.009098, 1.720878, 1.288113, 1, 1, 1, 1, 1,
1.017576, -1.222779, 3.432496, 0, 0, 1, 1, 1,
1.020838, 0.1000633, 2.377612, 1, 0, 0, 1, 1,
1.021866, -0.7797195, 0.8472285, 1, 0, 0, 1, 1,
1.024889, -0.4143271, 1.804001, 1, 0, 0, 1, 1,
1.026886, 0.07762247, 1.244382, 1, 0, 0, 1, 1,
1.032352, -0.9785628, 1.141849, 1, 0, 0, 1, 1,
1.036859, 0.4517574, -0.09194831, 0, 0, 0, 1, 1,
1.038867, -1.028552, 4.89042, 0, 0, 0, 1, 1,
1.046585, 1.080861, 1.744373, 0, 0, 0, 1, 1,
1.048442, 1.07233, -0.1541419, 0, 0, 0, 1, 1,
1.048538, 0.7177001, 3.698586, 0, 0, 0, 1, 1,
1.050468, 0.7913235, 1.52696, 0, 0, 0, 1, 1,
1.053296, -0.1028157, 1.02214, 0, 0, 0, 1, 1,
1.053331, 0.8339795, 1.820797, 1, 1, 1, 1, 1,
1.057504, -0.1005315, 2.513016, 1, 1, 1, 1, 1,
1.064663, -1.12531, 3.557751, 1, 1, 1, 1, 1,
1.068464, 0.6219463, 1.391222, 1, 1, 1, 1, 1,
1.07489, -0.9485099, 2.877914, 1, 1, 1, 1, 1,
1.08255, -0.7133287, 1.684151, 1, 1, 1, 1, 1,
1.082883, -0.07665968, -0.5748188, 1, 1, 1, 1, 1,
1.083796, 0.08575832, 0.1195164, 1, 1, 1, 1, 1,
1.084689, -0.244979, 1.039206, 1, 1, 1, 1, 1,
1.099937, -0.1487693, 1.572553, 1, 1, 1, 1, 1,
1.103245, -0.8577119, 4.462297, 1, 1, 1, 1, 1,
1.104178, 0.1145766, 3.317959, 1, 1, 1, 1, 1,
1.107158, 0.4366137, 0.9405434, 1, 1, 1, 1, 1,
1.109405, 0.2725819, 3.222756, 1, 1, 1, 1, 1,
1.113855, 0.6087902, 1.466956, 1, 1, 1, 1, 1,
1.119578, 0.634002, 2.9432, 0, 0, 1, 1, 1,
1.125068, 0.6652079, 1.322878, 1, 0, 0, 1, 1,
1.136491, -0.4083667, 1.031251, 1, 0, 0, 1, 1,
1.137774, 1.316695, 2.143511, 1, 0, 0, 1, 1,
1.141822, -0.4642342, 3.291401, 1, 0, 0, 1, 1,
1.152151, -0.8849289, 1.986753, 1, 0, 0, 1, 1,
1.154926, 0.7083626, 0.8021268, 0, 0, 0, 1, 1,
1.157661, -0.04779356, 1.624038, 0, 0, 0, 1, 1,
1.168021, -0.3590701, 2.09666, 0, 0, 0, 1, 1,
1.170141, -0.2919289, 1.155416, 0, 0, 0, 1, 1,
1.170296, -1.235548, 0.62563, 0, 0, 0, 1, 1,
1.175277, 0.5016107, 0.5773975, 0, 0, 0, 1, 1,
1.177091, -0.7662988, 1.491673, 0, 0, 0, 1, 1,
1.180942, 0.1057464, 1.918322, 1, 1, 1, 1, 1,
1.183753, -0.2201166, 1.15849, 1, 1, 1, 1, 1,
1.191067, 0.8752452, 0.8676319, 1, 1, 1, 1, 1,
1.195582, 1.11817, -0.3108642, 1, 1, 1, 1, 1,
1.203992, -1.671066, 2.170149, 1, 1, 1, 1, 1,
1.205459, 0.05565399, 0.5759894, 1, 1, 1, 1, 1,
1.210962, -0.6371386, 2.675354, 1, 1, 1, 1, 1,
1.21167, 0.1731975, 1.755098, 1, 1, 1, 1, 1,
1.213175, -1.019614, 2.372114, 1, 1, 1, 1, 1,
1.215832, 0.2731818, 1.080246, 1, 1, 1, 1, 1,
1.217737, 0.03515239, 3.757267, 1, 1, 1, 1, 1,
1.220023, 0.6683652, 0.5625682, 1, 1, 1, 1, 1,
1.238219, -2.409231, 2.150491, 1, 1, 1, 1, 1,
1.241428, -1.384505, 1.550653, 1, 1, 1, 1, 1,
1.241744, -0.6964431, 1.195899, 1, 1, 1, 1, 1,
1.244357, 0.4927661, 1.230859, 0, 0, 1, 1, 1,
1.245729, -2.24696, 3.402841, 1, 0, 0, 1, 1,
1.251159, -0.5204561, 1.668915, 1, 0, 0, 1, 1,
1.270477, 0.7434736, 1.42704, 1, 0, 0, 1, 1,
1.289889, 1.310145, 2.494548, 1, 0, 0, 1, 1,
1.290315, 0.3165495, 2.229374, 1, 0, 0, 1, 1,
1.291733, -1.229898, 3.156001, 0, 0, 0, 1, 1,
1.294646, 0.7181635, 1.589594, 0, 0, 0, 1, 1,
1.298563, -0.412073, 2.010761, 0, 0, 0, 1, 1,
1.323793, -0.04298947, 2.084724, 0, 0, 0, 1, 1,
1.327487, 1.385661, 1.00183, 0, 0, 0, 1, 1,
1.337324, 0.3718684, 0.4415989, 0, 0, 0, 1, 1,
1.34305, 0.8396137, 1.091239, 0, 0, 0, 1, 1,
1.34879, 0.06342282, 1.716186, 1, 1, 1, 1, 1,
1.358316, -0.147255, 2.877125, 1, 1, 1, 1, 1,
1.365468, 1.227921, 1.53458, 1, 1, 1, 1, 1,
1.370471, 0.7402205, 0.7659176, 1, 1, 1, 1, 1,
1.376045, 0.7625144, 1.401508, 1, 1, 1, 1, 1,
1.387748, -0.07594663, 2.12763, 1, 1, 1, 1, 1,
1.395897, 0.5551447, -0.5373672, 1, 1, 1, 1, 1,
1.411218, -0.236468, 0.7738591, 1, 1, 1, 1, 1,
1.415575, -0.009522441, 1.585588, 1, 1, 1, 1, 1,
1.416259, 0.7123628, 1.557451, 1, 1, 1, 1, 1,
1.422107, 1.832487, 1.387802, 1, 1, 1, 1, 1,
1.435426, 0.2597714, 2.593802, 1, 1, 1, 1, 1,
1.442732, -0.06257051, 1.350079, 1, 1, 1, 1, 1,
1.447851, -1.013835, 1.794164, 1, 1, 1, 1, 1,
1.447965, -0.06457639, 0.3240959, 1, 1, 1, 1, 1,
1.46604, 0.3550791, 1.823159, 0, 0, 1, 1, 1,
1.473052, -1.745955, 0.7856488, 1, 0, 0, 1, 1,
1.474469, 0.6282296, 0.9165978, 1, 0, 0, 1, 1,
1.474519, -0.9517285, -0.1654292, 1, 0, 0, 1, 1,
1.482775, 0.9146361, 1.887051, 1, 0, 0, 1, 1,
1.487215, -0.8862776, 3.3675, 1, 0, 0, 1, 1,
1.492858, 0.1171232, 3.317556, 0, 0, 0, 1, 1,
1.493198, -0.46024, 1.136866, 0, 0, 0, 1, 1,
1.493598, 1.579079, 1.283143, 0, 0, 0, 1, 1,
1.497518, 0.459263, 1.530914, 0, 0, 0, 1, 1,
1.498964, -1.286522, 1.674246, 0, 0, 0, 1, 1,
1.502341, -0.8099083, 1.855473, 0, 0, 0, 1, 1,
1.505245, -0.3620405, -0.2897026, 0, 0, 0, 1, 1,
1.513356, 0.6870526, 1.145202, 1, 1, 1, 1, 1,
1.524232, -1.407474, 2.707339, 1, 1, 1, 1, 1,
1.544165, 0.04493197, 1.399684, 1, 1, 1, 1, 1,
1.54525, 0.8271673, -0.1316353, 1, 1, 1, 1, 1,
1.546589, -0.44497, 2.110312, 1, 1, 1, 1, 1,
1.556569, -0.8196086, 1.234674, 1, 1, 1, 1, 1,
1.580983, -0.5432104, 1.968203, 1, 1, 1, 1, 1,
1.587245, -0.7661375, 1.409103, 1, 1, 1, 1, 1,
1.588485, 0.9684714, -0.1731417, 1, 1, 1, 1, 1,
1.591497, -0.7686017, 2.499055, 1, 1, 1, 1, 1,
1.626032, 1.202291, -0.8088854, 1, 1, 1, 1, 1,
1.63428, 1.104809, -0.9681599, 1, 1, 1, 1, 1,
1.650596, 0.7276101, 0.9946702, 1, 1, 1, 1, 1,
1.652582, -1.662275, 1.758088, 1, 1, 1, 1, 1,
1.659379, 0.7380242, 0.7226218, 1, 1, 1, 1, 1,
1.663705, 2.866114, 1.750929, 0, 0, 1, 1, 1,
1.678713, -0.02414463, 1.063646, 1, 0, 0, 1, 1,
1.678766, -0.9012047, 3.478209, 1, 0, 0, 1, 1,
1.683895, 1.209505, 0.8320755, 1, 0, 0, 1, 1,
1.691846, 0.4136871, 0.925664, 1, 0, 0, 1, 1,
1.696585, 0.1208117, 2.014856, 1, 0, 0, 1, 1,
1.705726, 0.1475966, 3.312868, 0, 0, 0, 1, 1,
1.71433, -0.8569817, 2.810519, 0, 0, 0, 1, 1,
1.717742, -0.3806577, 2.470577, 0, 0, 0, 1, 1,
1.722294, -0.9498547, 1.502416, 0, 0, 0, 1, 1,
1.747161, 0.2692167, 1.726178, 0, 0, 0, 1, 1,
1.749073, 0.5650699, 1.601903, 0, 0, 0, 1, 1,
1.770441, 0.244208, 0.5602829, 0, 0, 0, 1, 1,
1.78188, 1.387339, 0.84781, 1, 1, 1, 1, 1,
1.78538, -0.3208025, 1.23171, 1, 1, 1, 1, 1,
1.786988, -1.129891, 2.560113, 1, 1, 1, 1, 1,
1.791164, -0.3603683, 1.802204, 1, 1, 1, 1, 1,
1.813859, -0.05499333, 1.675907, 1, 1, 1, 1, 1,
1.813919, -0.4662378, 2.203229, 1, 1, 1, 1, 1,
1.821078, -1.273211, 3.010101, 1, 1, 1, 1, 1,
1.8268, 0.8553612, 1.808233, 1, 1, 1, 1, 1,
1.862486, 1.222836, -0.2741733, 1, 1, 1, 1, 1,
1.882415, 0.5895159, -0.1229675, 1, 1, 1, 1, 1,
1.899374, 1.50892, 0.6238372, 1, 1, 1, 1, 1,
1.906239, 0.1881727, 1.461498, 1, 1, 1, 1, 1,
1.908293, -0.8750688, 3.208824, 1, 1, 1, 1, 1,
1.926344, 0.1417698, 3.017933, 1, 1, 1, 1, 1,
1.933395, 0.8799917, 1.601043, 1, 1, 1, 1, 1,
1.934148, 0.3880219, 3.168786, 0, 0, 1, 1, 1,
1.963173, -1.295563, 2.145181, 1, 0, 0, 1, 1,
1.974966, -0.07744206, 1.471233, 1, 0, 0, 1, 1,
1.984322, 2.799418, 1.046999, 1, 0, 0, 1, 1,
1.996144, 0.2390079, 1.449666, 1, 0, 0, 1, 1,
2.013191, -0.5226867, 1.673712, 1, 0, 0, 1, 1,
2.014567, 0.2564476, 3.020083, 0, 0, 0, 1, 1,
2.033031, -0.375723, 2.905135, 0, 0, 0, 1, 1,
2.039593, 1.049178, 1.291335, 0, 0, 0, 1, 1,
2.058619, -1.092652, 1.478122, 0, 0, 0, 1, 1,
2.075574, 0.8488364, 3.07301, 0, 0, 0, 1, 1,
2.082269, -0.1286859, 1.318853, 0, 0, 0, 1, 1,
2.130079, -1.063678, 1.199754, 0, 0, 0, 1, 1,
2.209376, 0.6622598, 0.2519582, 1, 1, 1, 1, 1,
2.237203, 0.5651287, 2.334505, 1, 1, 1, 1, 1,
2.402512, -0.1250648, 2.223172, 1, 1, 1, 1, 1,
2.41005, 1.435124, 0.7591949, 1, 1, 1, 1, 1,
2.497414, 0.8916543, 1.163348, 1, 1, 1, 1, 1,
2.627892, 0.5530152, 1.445199, 1, 1, 1, 1, 1,
2.94796, -1.254574, 0.9426707, 1, 1, 1, 1, 1
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
var radius = 9.343351;
var distance = 32.81812;
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
mvMatrix.translate( 0.2421097, -0.4287854, -0.08236265 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.81812);
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
