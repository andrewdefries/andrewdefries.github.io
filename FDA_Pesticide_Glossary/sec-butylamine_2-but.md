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
-3.790194, 1.001223, -1.361766, 1, 0, 0, 1,
-3.694051, 1.443224, 1.064398, 1, 0.007843138, 0, 1,
-3.238466, -1.279593, -3.16415, 1, 0.01176471, 0, 1,
-3.039544, -0.4886103, -1.196749, 1, 0.01960784, 0, 1,
-2.720985, 1.020687, -0.4213123, 1, 0.02352941, 0, 1,
-2.665503, -0.1840145, -1.337098, 1, 0.03137255, 0, 1,
-2.591267, -0.1541061, -2.283251, 1, 0.03529412, 0, 1,
-2.491447, 0.8354934, -0.9435713, 1, 0.04313726, 0, 1,
-2.343703, -0.6244943, -1.537156, 1, 0.04705882, 0, 1,
-2.320957, -1.039841, -2.524832, 1, 0.05490196, 0, 1,
-2.30968, 1.765059, -1.555168, 1, 0.05882353, 0, 1,
-2.289108, -1.689032, -3.085671, 1, 0.06666667, 0, 1,
-2.277458, -0.7424955, -1.000866, 1, 0.07058824, 0, 1,
-2.267569, 0.3476944, -0.6650213, 1, 0.07843138, 0, 1,
-2.181359, -0.8580341, -1.854741, 1, 0.08235294, 0, 1,
-2.15117, 0.03426471, -0.414425, 1, 0.09019608, 0, 1,
-2.145226, 0.3956831, -1.904962, 1, 0.09411765, 0, 1,
-2.109319, 0.09884746, -1.163848, 1, 0.1019608, 0, 1,
-2.108399, -1.394625, -3.375848, 1, 0.1098039, 0, 1,
-2.09832, -1.261345, -1.99558, 1, 0.1137255, 0, 1,
-2.062377, 1.006517, -1.219185, 1, 0.1215686, 0, 1,
-2.052631, 1.377759, -1.899769, 1, 0.1254902, 0, 1,
-2.050505, 0.3791455, -0.6116972, 1, 0.1333333, 0, 1,
-2.049226, -0.4647722, -0.6216593, 1, 0.1372549, 0, 1,
-2.019189, 1.317458, -1.96624, 1, 0.145098, 0, 1,
-2.019027, 0.6555857, -0.3326859, 1, 0.1490196, 0, 1,
-2.016248, -0.5179656, -1.268962, 1, 0.1568628, 0, 1,
-2.014056, -0.3686429, -1.734302, 1, 0.1607843, 0, 1,
-2.002165, 2.889298, -0.3220872, 1, 0.1686275, 0, 1,
-1.98146, -0.8146467, -2.473262, 1, 0.172549, 0, 1,
-1.964896, -0.7548141, -1.464277, 1, 0.1803922, 0, 1,
-1.948706, 0.7570107, -1.299746, 1, 0.1843137, 0, 1,
-1.930217, 0.4284824, -0.5857692, 1, 0.1921569, 0, 1,
-1.917049, 0.1509955, -1.929524, 1, 0.1960784, 0, 1,
-1.916248, -0.06210899, -1.484111, 1, 0.2039216, 0, 1,
-1.884168, -1.062628, -3.272332, 1, 0.2117647, 0, 1,
-1.834299, 1.176622, 0.1550129, 1, 0.2156863, 0, 1,
-1.810778, 0.7470399, -1.282934, 1, 0.2235294, 0, 1,
-1.805519, 0.4599148, -1.702904, 1, 0.227451, 0, 1,
-1.785901, 0.9839119, -2.216443, 1, 0.2352941, 0, 1,
-1.778445, -0.4338516, -1.892575, 1, 0.2392157, 0, 1,
-1.77672, 0.4923879, 0.06172441, 1, 0.2470588, 0, 1,
-1.760808, 0.4984143, -1.493386, 1, 0.2509804, 0, 1,
-1.743446, 0.3007028, 0.4903829, 1, 0.2588235, 0, 1,
-1.738981, 0.2702465, -2.189212, 1, 0.2627451, 0, 1,
-1.72441, 1.040787, -1.824656, 1, 0.2705882, 0, 1,
-1.717357, 0.7132052, -2.314926, 1, 0.2745098, 0, 1,
-1.697785, 1.872648, -2.490144, 1, 0.282353, 0, 1,
-1.690304, -0.1432339, -2.916276, 1, 0.2862745, 0, 1,
-1.686655, 1.88666, -1.488249, 1, 0.2941177, 0, 1,
-1.671783, -0.4357968, -1.578467, 1, 0.3019608, 0, 1,
-1.670499, 1.882677, -0.804621, 1, 0.3058824, 0, 1,
-1.669729, 0.2867241, -1.881118, 1, 0.3137255, 0, 1,
-1.660844, 0.3125479, -2.376196, 1, 0.3176471, 0, 1,
-1.658539, 0.1482629, -3.788568, 1, 0.3254902, 0, 1,
-1.656183, -0.2261937, -2.581045, 1, 0.3294118, 0, 1,
-1.616082, -0.3795842, -0.3245506, 1, 0.3372549, 0, 1,
-1.615613, -0.5106856, -0.8932028, 1, 0.3411765, 0, 1,
-1.612577, -1.298103, -3.933355, 1, 0.3490196, 0, 1,
-1.611301, 0.3226242, -0.2399147, 1, 0.3529412, 0, 1,
-1.608968, 1.068944, -0.7406501, 1, 0.3607843, 0, 1,
-1.601135, 0.6522947, -2.569854, 1, 0.3647059, 0, 1,
-1.576365, 1.791363, 0.2285603, 1, 0.372549, 0, 1,
-1.576274, -0.2007933, -0.118618, 1, 0.3764706, 0, 1,
-1.564111, 0.3873906, -1.505206, 1, 0.3843137, 0, 1,
-1.554217, -0.04162022, -1.527492, 1, 0.3882353, 0, 1,
-1.553125, 0.1317717, -2.41441, 1, 0.3960784, 0, 1,
-1.548202, 0.4449823, -0.9080738, 1, 0.4039216, 0, 1,
-1.541178, 0.2043241, -0.8260319, 1, 0.4078431, 0, 1,
-1.540233, -0.3668512, 0.5829052, 1, 0.4156863, 0, 1,
-1.536831, 0.1043225, -0.9865409, 1, 0.4196078, 0, 1,
-1.52776, 0.6946179, -1.595596, 1, 0.427451, 0, 1,
-1.5188, -0.401033, -1.993672, 1, 0.4313726, 0, 1,
-1.500839, 0.3012393, -1.395228, 1, 0.4392157, 0, 1,
-1.498302, 1.347815, -1.666452, 1, 0.4431373, 0, 1,
-1.492462, -0.5767482, -0.8323984, 1, 0.4509804, 0, 1,
-1.483214, 1.610527, -1.418872, 1, 0.454902, 0, 1,
-1.482056, -1.271728, -1.783802, 1, 0.4627451, 0, 1,
-1.482038, 0.420205, -2.065284, 1, 0.4666667, 0, 1,
-1.479938, -0.4119666, -1.629705, 1, 0.4745098, 0, 1,
-1.466508, -0.3061872, -2.431182, 1, 0.4784314, 0, 1,
-1.463315, -0.4390479, -3.849012, 1, 0.4862745, 0, 1,
-1.458134, 0.0185645, 0.4589243, 1, 0.4901961, 0, 1,
-1.439549, 0.3787629, -1.467145, 1, 0.4980392, 0, 1,
-1.438044, -0.8273987, -4.016501, 1, 0.5058824, 0, 1,
-1.435699, -0.3490634, -2.277843, 1, 0.509804, 0, 1,
-1.43507, 1.135249, 0.06470571, 1, 0.5176471, 0, 1,
-1.430252, 0.3396759, -2.521916, 1, 0.5215687, 0, 1,
-1.420168, -2.143516, -2.269208, 1, 0.5294118, 0, 1,
-1.419811, -0.501828, -1.361068, 1, 0.5333334, 0, 1,
-1.416326, 0.6631636, -2.249887, 1, 0.5411765, 0, 1,
-1.4127, -0.5417389, -0.7931737, 1, 0.5450981, 0, 1,
-1.406146, -1.502259, -3.523767, 1, 0.5529412, 0, 1,
-1.405481, 1.223281, 0.4662068, 1, 0.5568628, 0, 1,
-1.399733, 1.306454, 1.906582, 1, 0.5647059, 0, 1,
-1.398731, 0.5434845, -1.412534, 1, 0.5686275, 0, 1,
-1.381942, -0.7942748, -3.996169, 1, 0.5764706, 0, 1,
-1.378878, 1.538826, -0.3586558, 1, 0.5803922, 0, 1,
-1.373304, 1.612066, -1.680248, 1, 0.5882353, 0, 1,
-1.362689, -0.114153, -1.518998, 1, 0.5921569, 0, 1,
-1.360759, -1.744788, -2.263552, 1, 0.6, 0, 1,
-1.360727, 1.365433, 0.2616937, 1, 0.6078432, 0, 1,
-1.357504, -0.7762473, -0.2659713, 1, 0.6117647, 0, 1,
-1.348935, 0.006048298, -1.138043, 1, 0.6196079, 0, 1,
-1.346509, 0.7158099, -0.4878683, 1, 0.6235294, 0, 1,
-1.345191, 1.282035, -0.7020813, 1, 0.6313726, 0, 1,
-1.343766, -0.09216173, 0.1238243, 1, 0.6352941, 0, 1,
-1.338481, 0.2949361, -2.87924, 1, 0.6431373, 0, 1,
-1.337787, -0.4259362, -0.3825217, 1, 0.6470588, 0, 1,
-1.335423, 0.0719087, -1.436183, 1, 0.654902, 0, 1,
-1.334662, 0.1698656, -2.171772, 1, 0.6588235, 0, 1,
-1.326562, 0.5516987, -1.589053, 1, 0.6666667, 0, 1,
-1.316305, 0.2045696, -1.984268, 1, 0.6705883, 0, 1,
-1.31443, 0.4681016, -2.003604, 1, 0.6784314, 0, 1,
-1.300954, -0.07677563, -1.239259, 1, 0.682353, 0, 1,
-1.297371, 0.3717257, 0.01653271, 1, 0.6901961, 0, 1,
-1.290104, 1.283205, -0.4559565, 1, 0.6941177, 0, 1,
-1.286781, 0.8269837, -2.145023, 1, 0.7019608, 0, 1,
-1.280606, 0.668287, 1.245771, 1, 0.7098039, 0, 1,
-1.27866, -0.6261173, -2.505974, 1, 0.7137255, 0, 1,
-1.27656, -0.1329827, -0.3358454, 1, 0.7215686, 0, 1,
-1.273843, -0.7657725, -1.662312, 1, 0.7254902, 0, 1,
-1.256397, -1.467644, -2.628563, 1, 0.7333333, 0, 1,
-1.249588, -0.6806503, -3.397699, 1, 0.7372549, 0, 1,
-1.241774, -2.16236, -0.8752593, 1, 0.7450981, 0, 1,
-1.237744, -0.1455599, -0.04005081, 1, 0.7490196, 0, 1,
-1.235907, -0.1961668, -1.668587, 1, 0.7568628, 0, 1,
-1.23495, -1.598666, -4.285153, 1, 0.7607843, 0, 1,
-1.234364, 1.010751, 0.209686, 1, 0.7686275, 0, 1,
-1.227974, -2.263085, -3.767895, 1, 0.772549, 0, 1,
-1.221058, 0.04849894, 0.777694, 1, 0.7803922, 0, 1,
-1.214828, -1.067161, -3.255948, 1, 0.7843137, 0, 1,
-1.212482, 0.7225159, -1.049371, 1, 0.7921569, 0, 1,
-1.210179, 1.268553, -1.165477, 1, 0.7960784, 0, 1,
-1.188204, 0.3368377, -1.460408, 1, 0.8039216, 0, 1,
-1.179105, 0.07628212, 0.726653, 1, 0.8117647, 0, 1,
-1.175104, 1.924907, -0.1500629, 1, 0.8156863, 0, 1,
-1.172477, -0.1528453, -3.99912, 1, 0.8235294, 0, 1,
-1.172452, -0.7533157, -1.69101, 1, 0.827451, 0, 1,
-1.16068, 0.1960789, -2.277022, 1, 0.8352941, 0, 1,
-1.157915, 2.186436, -0.5616979, 1, 0.8392157, 0, 1,
-1.156581, -1.836403, -1.759082, 1, 0.8470588, 0, 1,
-1.156522, 0.7546292, -1.451769, 1, 0.8509804, 0, 1,
-1.156005, -1.346624, -2.113776, 1, 0.8588235, 0, 1,
-1.155197, -1.305257, -3.112997, 1, 0.8627451, 0, 1,
-1.148678, -0.9926494, -2.617115, 1, 0.8705882, 0, 1,
-1.142365, 0.1479145, -2.362381, 1, 0.8745098, 0, 1,
-1.13825, 0.4071302, -1.172438, 1, 0.8823529, 0, 1,
-1.134805, 0.5596504, 0.0575881, 1, 0.8862745, 0, 1,
-1.127892, -0.1588653, -2.76877, 1, 0.8941177, 0, 1,
-1.121313, -0.7152624, -1.471354, 1, 0.8980392, 0, 1,
-1.109119, -0.6970422, -1.382903, 1, 0.9058824, 0, 1,
-1.108728, -0.6305808, -3.270089, 1, 0.9137255, 0, 1,
-1.098983, 0.4421132, -0.1160692, 1, 0.9176471, 0, 1,
-1.095918, -0.402919, -1.911379, 1, 0.9254902, 0, 1,
-1.089267, -1.391332, -2.450331, 1, 0.9294118, 0, 1,
-1.087752, 1.345976, -0.8159661, 1, 0.9372549, 0, 1,
-1.086849, -0.6001849, -2.221601, 1, 0.9411765, 0, 1,
-1.086677, -0.5187266, -3.997512, 1, 0.9490196, 0, 1,
-1.086668, 0.2822378, -1.082712, 1, 0.9529412, 0, 1,
-1.08444, -0.2946393, -2.53883, 1, 0.9607843, 0, 1,
-1.081041, 0.347711, -0.02594572, 1, 0.9647059, 0, 1,
-1.075453, 0.3978161, -1.514861, 1, 0.972549, 0, 1,
-1.070255, 0.5324653, -2.764036, 1, 0.9764706, 0, 1,
-1.06524, 0.2360542, -0.1264748, 1, 0.9843137, 0, 1,
-1.065028, 1.247534, -1.885154, 1, 0.9882353, 0, 1,
-1.063015, 0.9016864, -1.120562, 1, 0.9960784, 0, 1,
-1.060341, 0.5865698, -0.145381, 0.9960784, 1, 0, 1,
-1.059202, 1.519949, -0.9860502, 0.9921569, 1, 0, 1,
-1.053866, -0.5205904, -1.121408, 0.9843137, 1, 0, 1,
-1.047403, 1.015867, -1.311971, 0.9803922, 1, 0, 1,
-1.044673, 0.1951899, -0.07668426, 0.972549, 1, 0, 1,
-1.044638, -0.4368164, -0.6845422, 0.9686275, 1, 0, 1,
-1.039396, 0.3052386, -1.605696, 0.9607843, 1, 0, 1,
-1.036859, 0.3045045, 1.044703, 0.9568627, 1, 0, 1,
-1.026646, 0.412477, -0.8200426, 0.9490196, 1, 0, 1,
-1.022825, 0.4242007, -1.442848, 0.945098, 1, 0, 1,
-1.014574, 0.6875594, 0.3328983, 0.9372549, 1, 0, 1,
-1.013614, -0.2114988, -2.732821, 0.9333333, 1, 0, 1,
-1.012777, -0.2966921, -1.133651, 0.9254902, 1, 0, 1,
-1.008327, 1.033419, 1.284324, 0.9215686, 1, 0, 1,
-1.005988, -1.293059, -1.578183, 0.9137255, 1, 0, 1,
-1.003999, 1.625985, -1.140395, 0.9098039, 1, 0, 1,
-0.9978699, -0.4289236, -2.181967, 0.9019608, 1, 0, 1,
-0.9916556, 1.423667, 1.434487, 0.8941177, 1, 0, 1,
-0.9844888, 1.57543, -1.943178, 0.8901961, 1, 0, 1,
-0.9820754, 0.08793791, -1.186377, 0.8823529, 1, 0, 1,
-0.9798552, 0.6739581, -2.007711, 0.8784314, 1, 0, 1,
-0.977307, -1.694778, -3.256366, 0.8705882, 1, 0, 1,
-0.9765846, -0.9824172, -2.682349, 0.8666667, 1, 0, 1,
-0.9764299, 0.9082859, -1.585843, 0.8588235, 1, 0, 1,
-0.9745025, -0.2166283, -1.770406, 0.854902, 1, 0, 1,
-0.9742749, 0.1332487, 0.2009755, 0.8470588, 1, 0, 1,
-0.9736007, 0.3204632, -1.25165, 0.8431373, 1, 0, 1,
-0.9728859, -0.6472048, -3.344897, 0.8352941, 1, 0, 1,
-0.9722561, 0.2840165, -1.414415, 0.8313726, 1, 0, 1,
-0.9708549, -0.5784662, -2.621299, 0.8235294, 1, 0, 1,
-0.9581229, 0.5442375, 0.5255963, 0.8196079, 1, 0, 1,
-0.9560862, 0.5172229, -0.6457391, 0.8117647, 1, 0, 1,
-0.9540639, -0.1454372, -2.087816, 0.8078431, 1, 0, 1,
-0.9497691, -0.3442092, -1.987323, 0.8, 1, 0, 1,
-0.9491786, -0.9373881, -3.677028, 0.7921569, 1, 0, 1,
-0.9328414, 0.7834393, -3.23057, 0.7882353, 1, 0, 1,
-0.913846, 1.523098, -1.876856, 0.7803922, 1, 0, 1,
-0.912016, -0.5604113, -1.627178, 0.7764706, 1, 0, 1,
-0.9097089, 0.3139056, -1.614323, 0.7686275, 1, 0, 1,
-0.9081017, -0.5917355, -1.681591, 0.7647059, 1, 0, 1,
-0.9080043, 0.6882474, -0.7625275, 0.7568628, 1, 0, 1,
-0.9032279, 0.5543448, -0.6502487, 0.7529412, 1, 0, 1,
-0.899535, 0.4651163, -0.3280246, 0.7450981, 1, 0, 1,
-0.8965733, -0.07725508, -1.595883, 0.7411765, 1, 0, 1,
-0.8720231, -0.3935282, -1.996796, 0.7333333, 1, 0, 1,
-0.8705212, -0.2495953, -1.880025, 0.7294118, 1, 0, 1,
-0.869556, 0.4324091, -0.6378827, 0.7215686, 1, 0, 1,
-0.868789, -0.6096989, -0.02745757, 0.7176471, 1, 0, 1,
-0.8493255, 0.9380804, -0.3043152, 0.7098039, 1, 0, 1,
-0.8475077, -0.394255, -2.603018, 0.7058824, 1, 0, 1,
-0.8465233, 0.04782316, -1.84764, 0.6980392, 1, 0, 1,
-0.8362128, 1.2678, 0.1147028, 0.6901961, 1, 0, 1,
-0.8320045, 1.85189, 0.7524062, 0.6862745, 1, 0, 1,
-0.8282161, 1.587519, 0.6456569, 0.6784314, 1, 0, 1,
-0.8232517, -0.2833884, -1.778283, 0.6745098, 1, 0, 1,
-0.8216972, -0.1324315, -3.17633, 0.6666667, 1, 0, 1,
-0.8194018, 1.196378, -0.669513, 0.6627451, 1, 0, 1,
-0.8048207, 0.08423535, -1.966709, 0.654902, 1, 0, 1,
-0.7994525, -0.496031, -0.560488, 0.6509804, 1, 0, 1,
-0.7978508, -0.7418038, -2.35083, 0.6431373, 1, 0, 1,
-0.7919339, -0.3883012, -1.004463, 0.6392157, 1, 0, 1,
-0.7917806, 0.3421897, -1.120924, 0.6313726, 1, 0, 1,
-0.7841095, 0.8935882, 0.291375, 0.627451, 1, 0, 1,
-0.771564, -1.222226, -2.143381, 0.6196079, 1, 0, 1,
-0.7600318, -1.239954, -3.414502, 0.6156863, 1, 0, 1,
-0.7586316, 0.3276056, -3.490603, 0.6078432, 1, 0, 1,
-0.7511581, -2.364113, -3.627405, 0.6039216, 1, 0, 1,
-0.7483618, -0.8458911, -2.656942, 0.5960785, 1, 0, 1,
-0.7433313, -1.091737, -1.872745, 0.5882353, 1, 0, 1,
-0.7429998, 1.51276, 1.044368, 0.5843138, 1, 0, 1,
-0.7365013, 0.03976237, -1.500592, 0.5764706, 1, 0, 1,
-0.7360811, 0.1668272, -1.662489, 0.572549, 1, 0, 1,
-0.7292347, -1.107302, -4.410627, 0.5647059, 1, 0, 1,
-0.7265645, 0.4171662, -2.095958, 0.5607843, 1, 0, 1,
-0.725849, -1.338184, -2.355383, 0.5529412, 1, 0, 1,
-0.723407, 0.1100892, -1.708191, 0.5490196, 1, 0, 1,
-0.7202683, 0.2418461, -1.566288, 0.5411765, 1, 0, 1,
-0.7170105, 0.2014636, -2.159216, 0.5372549, 1, 0, 1,
-0.7138744, -1.239778, -1.263831, 0.5294118, 1, 0, 1,
-0.7119201, -0.2245223, -3.604509, 0.5254902, 1, 0, 1,
-0.7083286, -0.6899068, -3.745086, 0.5176471, 1, 0, 1,
-0.7062786, -0.1282426, -3.058211, 0.5137255, 1, 0, 1,
-0.705844, -0.17638, -1.380912, 0.5058824, 1, 0, 1,
-0.7058013, -0.8445292, -2.583106, 0.5019608, 1, 0, 1,
-0.7010195, -0.1959468, -0.4080256, 0.4941176, 1, 0, 1,
-0.6932808, 0.3328922, -1.029607, 0.4862745, 1, 0, 1,
-0.6897299, 0.9250907, 0.1965618, 0.4823529, 1, 0, 1,
-0.6855572, 0.9682016, -0.3376676, 0.4745098, 1, 0, 1,
-0.6831082, -0.6721851, -2.25476, 0.4705882, 1, 0, 1,
-0.6778262, -2.281831, -0.8196837, 0.4627451, 1, 0, 1,
-0.6756528, -0.9197659, -1.551418, 0.4588235, 1, 0, 1,
-0.6672347, 1.9737, 1.072131, 0.4509804, 1, 0, 1,
-0.6589629, 0.944639, -0.380385, 0.4470588, 1, 0, 1,
-0.658723, 0.7951474, -1.215559, 0.4392157, 1, 0, 1,
-0.657676, -0.0456675, -1.003861, 0.4352941, 1, 0, 1,
-0.6509739, -1.073979, -0.6485255, 0.427451, 1, 0, 1,
-0.6492587, -0.7314118, -2.020288, 0.4235294, 1, 0, 1,
-0.6484206, 0.7822471, -1.594468, 0.4156863, 1, 0, 1,
-0.6411627, -1.566751, -3.600504, 0.4117647, 1, 0, 1,
-0.6389262, -2.04583, -1.954342, 0.4039216, 1, 0, 1,
-0.6389058, -0.9411734, -2.232882, 0.3960784, 1, 0, 1,
-0.6245441, -0.2286878, -2.611259, 0.3921569, 1, 0, 1,
-0.6236634, -0.04234987, -0.8820425, 0.3843137, 1, 0, 1,
-0.6226776, -0.451819, -2.005335, 0.3803922, 1, 0, 1,
-0.620527, 1.172333, 0.1868953, 0.372549, 1, 0, 1,
-0.6189092, -1.256794, -1.622896, 0.3686275, 1, 0, 1,
-0.6186668, 0.4497605, 1.294614, 0.3607843, 1, 0, 1,
-0.618243, -0.6530923, -1.97254, 0.3568628, 1, 0, 1,
-0.6146227, -0.9279777, -3.574491, 0.3490196, 1, 0, 1,
-0.614043, -1.99171, -2.259793, 0.345098, 1, 0, 1,
-0.6065128, 0.02603711, -0.8223658, 0.3372549, 1, 0, 1,
-0.600958, 0.9225247, 0.08812954, 0.3333333, 1, 0, 1,
-0.5986804, -0.354741, -0.1172325, 0.3254902, 1, 0, 1,
-0.598402, 0.663386, -0.4037277, 0.3215686, 1, 0, 1,
-0.5945527, -0.8513439, -2.025831, 0.3137255, 1, 0, 1,
-0.5945416, -0.04569116, 0.9253089, 0.3098039, 1, 0, 1,
-0.5907454, -0.4831598, -3.217464, 0.3019608, 1, 0, 1,
-0.586386, 1.62269, 0.7525808, 0.2941177, 1, 0, 1,
-0.5839324, -0.4235236, -0.06501815, 0.2901961, 1, 0, 1,
-0.5821603, -1.89542, -2.245806, 0.282353, 1, 0, 1,
-0.5815693, -1.240709, -3.390199, 0.2784314, 1, 0, 1,
-0.5785161, -0.4605539, -0.5892605, 0.2705882, 1, 0, 1,
-0.5782819, -0.5801255, -1.16952, 0.2666667, 1, 0, 1,
-0.573563, 0.8690374, 0.6837569, 0.2588235, 1, 0, 1,
-0.5726376, 1.051228, -0.1470645, 0.254902, 1, 0, 1,
-0.5692943, -0.6241649, -2.414449, 0.2470588, 1, 0, 1,
-0.5690399, 0.06965221, -2.132532, 0.2431373, 1, 0, 1,
-0.5676984, 2.645199, -1.465312, 0.2352941, 1, 0, 1,
-0.5667174, -0.128531, -2.980047, 0.2313726, 1, 0, 1,
-0.557048, -0.5678904, -5.10626, 0.2235294, 1, 0, 1,
-0.5497525, -0.05219247, -3.032866, 0.2196078, 1, 0, 1,
-0.5485575, -0.2165368, -1.73184, 0.2117647, 1, 0, 1,
-0.5447868, 1.155549, -1.270196, 0.2078431, 1, 0, 1,
-0.5439063, 1.962473, -1.691236, 0.2, 1, 0, 1,
-0.5409638, -0.2599805, -2.147007, 0.1921569, 1, 0, 1,
-0.5395185, -0.7657372, -1.448898, 0.1882353, 1, 0, 1,
-0.5394205, 0.03979844, -2.155065, 0.1803922, 1, 0, 1,
-0.5352895, 0.1655672, -1.968482, 0.1764706, 1, 0, 1,
-0.5329616, 2.247245, -2.265135, 0.1686275, 1, 0, 1,
-0.5327528, 0.1482832, -0.9417854, 0.1647059, 1, 0, 1,
-0.5318, 0.01548, -0.03166934, 0.1568628, 1, 0, 1,
-0.5308294, -0.3441293, -2.666511, 0.1529412, 1, 0, 1,
-0.5292084, -0.03217328, -1.225497, 0.145098, 1, 0, 1,
-0.5230035, 0.7285864, -0.7843184, 0.1411765, 1, 0, 1,
-0.5206667, -0.01580267, -0.6282798, 0.1333333, 1, 0, 1,
-0.5187414, 0.8145068, -1.689149, 0.1294118, 1, 0, 1,
-0.5186371, -0.4897378, -2.684733, 0.1215686, 1, 0, 1,
-0.5183459, 0.9947035, -1.161359, 0.1176471, 1, 0, 1,
-0.5179688, 1.72884, -1.388436, 0.1098039, 1, 0, 1,
-0.5174928, -0.346425, -3.552161, 0.1058824, 1, 0, 1,
-0.5151421, -1.279336, -3.563576, 0.09803922, 1, 0, 1,
-0.5146474, -0.5819064, -1.163624, 0.09019608, 1, 0, 1,
-0.5106422, 1.100818, 0.2125725, 0.08627451, 1, 0, 1,
-0.5085186, 0.2967591, -2.006978, 0.07843138, 1, 0, 1,
-0.507636, -0.4923347, -0.730368, 0.07450981, 1, 0, 1,
-0.5051178, 0.3430614, -1.450238, 0.06666667, 1, 0, 1,
-0.4978679, 1.903654, -0.3793078, 0.0627451, 1, 0, 1,
-0.4972806, 0.9850705, 1.527414, 0.05490196, 1, 0, 1,
-0.4963834, 0.001701082, -1.627227, 0.05098039, 1, 0, 1,
-0.4949245, 1.364092, -1.542295, 0.04313726, 1, 0, 1,
-0.4903827, -0.3069471, -2.894263, 0.03921569, 1, 0, 1,
-0.4867397, -1.46791, -4.433428, 0.03137255, 1, 0, 1,
-0.4836145, 1.007815, 0.6901872, 0.02745098, 1, 0, 1,
-0.48306, -0.4398183, -2.66609, 0.01960784, 1, 0, 1,
-0.4821908, 0.04509465, -2.006726, 0.01568628, 1, 0, 1,
-0.4821615, 1.658586, -0.2362089, 0.007843138, 1, 0, 1,
-0.4802336, -0.9138213, -2.832054, 0.003921569, 1, 0, 1,
-0.4735411, 1.338211, -0.8739374, 0, 1, 0.003921569, 1,
-0.4599623, 1.605817, -2.395858, 0, 1, 0.01176471, 1,
-0.4594069, -0.8753748, -1.619514, 0, 1, 0.01568628, 1,
-0.4472391, -0.3852272, -2.052227, 0, 1, 0.02352941, 1,
-0.446734, 0.2553411, -0.6729533, 0, 1, 0.02745098, 1,
-0.4450239, -0.7337812, -2.406616, 0, 1, 0.03529412, 1,
-0.4444195, 0.2108372, -0.6402268, 0, 1, 0.03921569, 1,
-0.4439341, 0.6266338, 0.06445191, 0, 1, 0.04705882, 1,
-0.4416733, 0.5834232, -0.5864348, 0, 1, 0.05098039, 1,
-0.4398148, -0.1843157, -2.028503, 0, 1, 0.05882353, 1,
-0.4369663, 1.199719, -0.6295981, 0, 1, 0.0627451, 1,
-0.4344105, -1.27763, -1.60094, 0, 1, 0.07058824, 1,
-0.4342975, 0.7440323, -2.344758, 0, 1, 0.07450981, 1,
-0.4340479, -0.1866908, -3.165892, 0, 1, 0.08235294, 1,
-0.4336472, -0.8999428, -1.973002, 0, 1, 0.08627451, 1,
-0.4314301, 0.07406366, -3.606625, 0, 1, 0.09411765, 1,
-0.4304387, 0.3510728, -1.888118, 0, 1, 0.1019608, 1,
-0.4280367, 1.151692, -0.5670635, 0, 1, 0.1058824, 1,
-0.4237694, 0.09336367, -1.477909, 0, 1, 0.1137255, 1,
-0.417362, -1.032125, -3.044293, 0, 1, 0.1176471, 1,
-0.4110183, -0.3588002, -2.653184, 0, 1, 0.1254902, 1,
-0.4097497, 0.5840451, -0.8371915, 0, 1, 0.1294118, 1,
-0.4083896, -1.403161, -3.562356, 0, 1, 0.1372549, 1,
-0.4020892, 0.4542691, -1.977392, 0, 1, 0.1411765, 1,
-0.4013414, -1.85368, -3.232208, 0, 1, 0.1490196, 1,
-0.3989232, -0.2910136, -3.035236, 0, 1, 0.1529412, 1,
-0.3946767, 1.351168, -1.968743, 0, 1, 0.1607843, 1,
-0.3916922, 1.190895, 0.7387175, 0, 1, 0.1647059, 1,
-0.3776298, -0.7100647, -2.037457, 0, 1, 0.172549, 1,
-0.3726369, 0.5640894, -1.316994, 0, 1, 0.1764706, 1,
-0.3680934, 1.021138, -0.5981185, 0, 1, 0.1843137, 1,
-0.3677974, -0.2034756, -1.432591, 0, 1, 0.1882353, 1,
-0.3662346, -0.8688811, -2.853448, 0, 1, 0.1960784, 1,
-0.3649358, -0.3565613, -2.941662, 0, 1, 0.2039216, 1,
-0.3615743, -0.02979575, -2.807066, 0, 1, 0.2078431, 1,
-0.3604897, 1.825558, 0.4810345, 0, 1, 0.2156863, 1,
-0.360448, -0.4895736, -1.908874, 0, 1, 0.2196078, 1,
-0.3465644, -0.5402655, -2.047339, 0, 1, 0.227451, 1,
-0.3413512, -2.385668, -4.466366, 0, 1, 0.2313726, 1,
-0.3379226, -0.03003081, -0.6049029, 0, 1, 0.2392157, 1,
-0.3343275, 0.2157453, -1.197457, 0, 1, 0.2431373, 1,
-0.331026, 1.716167, -0.3669698, 0, 1, 0.2509804, 1,
-0.3285689, 1.91027, 1.68895, 0, 1, 0.254902, 1,
-0.327955, 1.615891, 0.1021541, 0, 1, 0.2627451, 1,
-0.3255564, -0.2465861, -2.273292, 0, 1, 0.2666667, 1,
-0.3239217, 0.2328165, -2.24079, 0, 1, 0.2745098, 1,
-0.3222089, -0.04250202, -1.5307, 0, 1, 0.2784314, 1,
-0.3203719, 0.6341588, -1.298585, 0, 1, 0.2862745, 1,
-0.3172157, 0.4404497, -0.1683473, 0, 1, 0.2901961, 1,
-0.3113042, -0.7904505, -1.357612, 0, 1, 0.2980392, 1,
-0.3102887, -1.056576, -1.630777, 0, 1, 0.3058824, 1,
-0.3100358, 0.02006878, -2.546087, 0, 1, 0.3098039, 1,
-0.3076787, 0.3318716, -0.6546371, 0, 1, 0.3176471, 1,
-0.3076176, -0.3700692, -3.041453, 0, 1, 0.3215686, 1,
-0.3067743, -0.4229767, -1.100539, 0, 1, 0.3294118, 1,
-0.3049212, -2.354916, -3.01422, 0, 1, 0.3333333, 1,
-0.302505, -0.04708252, -1.158995, 0, 1, 0.3411765, 1,
-0.3011388, -1.371176, -2.189021, 0, 1, 0.345098, 1,
-0.2933787, -0.06125876, -1.940933, 0, 1, 0.3529412, 1,
-0.2887273, 0.9251661, 1.436442, 0, 1, 0.3568628, 1,
-0.285118, -1.393381, -2.460511, 0, 1, 0.3647059, 1,
-0.283646, -1.395547, -3.416325, 0, 1, 0.3686275, 1,
-0.2824307, 0.8292521, 0.8785082, 0, 1, 0.3764706, 1,
-0.2789496, 1.506088, -0.5381606, 0, 1, 0.3803922, 1,
-0.2774137, 0.9229831, 0.005720144, 0, 1, 0.3882353, 1,
-0.2763598, -1.072428, -2.385901, 0, 1, 0.3921569, 1,
-0.2652293, 1.4385, -0.2631223, 0, 1, 0.4, 1,
-0.2650149, 1.645732, 0.8254604, 0, 1, 0.4078431, 1,
-0.2647703, -0.1533284, -2.50206, 0, 1, 0.4117647, 1,
-0.2620793, -0.7063214, -3.179476, 0, 1, 0.4196078, 1,
-0.2612459, 0.5448773, -0.6467875, 0, 1, 0.4235294, 1,
-0.2588264, 0.06887151, -2.156297, 0, 1, 0.4313726, 1,
-0.2583822, -2.151594, -4.910702, 0, 1, 0.4352941, 1,
-0.2565538, 0.4650136, 0.444602, 0, 1, 0.4431373, 1,
-0.2551902, 0.8546178, 0.8212357, 0, 1, 0.4470588, 1,
-0.2546957, 0.6174105, -1.560412, 0, 1, 0.454902, 1,
-0.2513728, -0.3505337, -1.893884, 0, 1, 0.4588235, 1,
-0.2491232, 0.3465139, -1.184353, 0, 1, 0.4666667, 1,
-0.2481805, 0.5223024, -1.610722, 0, 1, 0.4705882, 1,
-0.2465825, 0.07452361, -0.5687925, 0, 1, 0.4784314, 1,
-0.2465227, -1.249267, -0.3515364, 0, 1, 0.4823529, 1,
-0.2427568, 1.309277, -0.4371084, 0, 1, 0.4901961, 1,
-0.242605, -0.5368384, -3.236974, 0, 1, 0.4941176, 1,
-0.241446, -0.6798067, -2.306789, 0, 1, 0.5019608, 1,
-0.2374963, 0.6966491, 1.45325, 0, 1, 0.509804, 1,
-0.2314284, -0.2663944, -3.743692, 0, 1, 0.5137255, 1,
-0.2287944, 0.7613408, -0.877775, 0, 1, 0.5215687, 1,
-0.2262442, -0.5789235, -1.395772, 0, 1, 0.5254902, 1,
-0.2190402, 0.07801025, 0.7932289, 0, 1, 0.5333334, 1,
-0.2171044, -0.6548847, -0.3569364, 0, 1, 0.5372549, 1,
-0.2135436, -0.4865394, -1.994622, 0, 1, 0.5450981, 1,
-0.209699, 0.3031377, -0.4307039, 0, 1, 0.5490196, 1,
-0.2079517, -0.5005825, -0.3912006, 0, 1, 0.5568628, 1,
-0.1940224, -1.15866, -2.885489, 0, 1, 0.5607843, 1,
-0.1899865, 0.5673741, -0.3414113, 0, 1, 0.5686275, 1,
-0.187988, -0.9308257, -3.192684, 0, 1, 0.572549, 1,
-0.1879566, 1.26359, 0.1028957, 0, 1, 0.5803922, 1,
-0.1870421, 0.3989166, -0.5252514, 0, 1, 0.5843138, 1,
-0.1846557, 0.8172951, -0.4077109, 0, 1, 0.5921569, 1,
-0.1845067, 0.2680641, -1.08275, 0, 1, 0.5960785, 1,
-0.1776599, -0.1310438, -1.548912, 0, 1, 0.6039216, 1,
-0.1661721, -0.0842923, -4.803462, 0, 1, 0.6117647, 1,
-0.164439, 0.2090953, -1.148463, 0, 1, 0.6156863, 1,
-0.1583115, -1.501605, -3.302231, 0, 1, 0.6235294, 1,
-0.1552671, -0.2996334, -2.300312, 0, 1, 0.627451, 1,
-0.1542142, 0.6354815, 0.6594459, 0, 1, 0.6352941, 1,
-0.1517877, 0.3638628, -0.7518142, 0, 1, 0.6392157, 1,
-0.1484471, -0.01748286, -1.217395, 0, 1, 0.6470588, 1,
-0.1483118, -0.06599058, -1.831477, 0, 1, 0.6509804, 1,
-0.1433553, 0.182152, -1.887475, 0, 1, 0.6588235, 1,
-0.1429249, -0.3368866, -3.646428, 0, 1, 0.6627451, 1,
-0.1403079, -0.1540705, -1.732241, 0, 1, 0.6705883, 1,
-0.1330238, 0.6302713, 0.5982699, 0, 1, 0.6745098, 1,
-0.1305733, 0.2065015, -0.255188, 0, 1, 0.682353, 1,
-0.1288387, -1.310487, -3.036582, 0, 1, 0.6862745, 1,
-0.1277416, 0.4599766, -1.089239, 0, 1, 0.6941177, 1,
-0.1259652, -0.6901709, -4.76597, 0, 1, 0.7019608, 1,
-0.1217191, -1.473606, -2.493273, 0, 1, 0.7058824, 1,
-0.1195414, 0.9775976, -0.00591031, 0, 1, 0.7137255, 1,
-0.1191117, 0.08625591, -1.624466, 0, 1, 0.7176471, 1,
-0.1183528, 0.378401, -0.2738408, 0, 1, 0.7254902, 1,
-0.1151272, -0.2735664, -1.903401, 0, 1, 0.7294118, 1,
-0.1118871, -1.513754, -1.855993, 0, 1, 0.7372549, 1,
-0.1070652, -0.4069849, -3.773372, 0, 1, 0.7411765, 1,
-0.1003787, -0.928867, -2.597233, 0, 1, 0.7490196, 1,
-0.09957842, 0.04218305, 0.770561, 0, 1, 0.7529412, 1,
-0.09924021, -0.579109, -2.622841, 0, 1, 0.7607843, 1,
-0.09703643, 1.064973, 0.7627827, 0, 1, 0.7647059, 1,
-0.09518905, -2.253718, -2.442783, 0, 1, 0.772549, 1,
-0.09437028, -1.773625, -1.596067, 0, 1, 0.7764706, 1,
-0.09428012, 2.643141, 0.3597929, 0, 1, 0.7843137, 1,
-0.08784518, -0.2680508, -3.710389, 0, 1, 0.7882353, 1,
-0.08506746, 0.02332244, -1.975046, 0, 1, 0.7960784, 1,
-0.08356868, 0.4319916, -0.5088239, 0, 1, 0.8039216, 1,
-0.08335793, 1.152775, -0.4702213, 0, 1, 0.8078431, 1,
-0.08052973, -2.524786, -2.511623, 0, 1, 0.8156863, 1,
-0.07970487, 1.817338, -0.5444473, 0, 1, 0.8196079, 1,
-0.07365891, -1.668589, -3.274276, 0, 1, 0.827451, 1,
-0.06766615, 1.033891, -1.66992, 0, 1, 0.8313726, 1,
-0.06503607, 0.03483301, 0.2230447, 0, 1, 0.8392157, 1,
-0.06247807, 1.278977, -0.01349195, 0, 1, 0.8431373, 1,
-0.06172686, 0.2037879, 0.6720399, 0, 1, 0.8509804, 1,
-0.05867165, 1.319234, -1.214976, 0, 1, 0.854902, 1,
-0.05865961, 1.381135, -1.108802, 0, 1, 0.8627451, 1,
-0.05526403, 0.2618998, -0.0177997, 0, 1, 0.8666667, 1,
-0.05473322, -0.711573, -2.029293, 0, 1, 0.8745098, 1,
-0.05391713, -0.1728632, -3.232395, 0, 1, 0.8784314, 1,
-0.05231813, 0.2271996, -0.5771133, 0, 1, 0.8862745, 1,
-0.04988635, 0.7209039, 1.258647, 0, 1, 0.8901961, 1,
-0.04982491, -0.9014655, -4.157602, 0, 1, 0.8980392, 1,
-0.04621603, -0.8609483, -2.860816, 0, 1, 0.9058824, 1,
-0.04077947, -0.5186498, -1.547699, 0, 1, 0.9098039, 1,
-0.03567837, -0.5526912, -3.846607, 0, 1, 0.9176471, 1,
-0.03189895, 0.1093408, 0.05323987, 0, 1, 0.9215686, 1,
-0.03120347, 0.6097038, -1.186324, 0, 1, 0.9294118, 1,
-0.03094814, -1.309482, -2.197883, 0, 1, 0.9333333, 1,
-0.03039834, 0.5512317, -1.103209, 0, 1, 0.9411765, 1,
-0.02815379, 0.5422395, -2.502041, 0, 1, 0.945098, 1,
-0.02129011, -1.925153, -1.073834, 0, 1, 0.9529412, 1,
-0.02103058, -0.3706502, -3.5587, 0, 1, 0.9568627, 1,
-0.02051596, -0.5445254, -4.302755, 0, 1, 0.9647059, 1,
-0.01839473, 1.219584, -0.9884348, 0, 1, 0.9686275, 1,
-0.01130496, -2.529093, -4.035133, 0, 1, 0.9764706, 1,
-0.00220164, -0.4867949, -5.052862, 0, 1, 0.9803922, 1,
-0.0004459534, -1.052991, -4.704398, 0, 1, 0.9882353, 1,
0.007949176, -1.325289, 1.859691, 0, 1, 0.9921569, 1,
0.01180844, -0.08789637, 2.139757, 0, 1, 1, 1,
0.01280815, -0.01035562, 1.299512, 0, 0.9921569, 1, 1,
0.02124442, 0.01295139, 0.8917119, 0, 0.9882353, 1, 1,
0.02568608, -0.03055311, 2.162792, 0, 0.9803922, 1, 1,
0.02645386, -0.1096201, 2.100418, 0, 0.9764706, 1, 1,
0.03341959, -0.5684559, 2.925016, 0, 0.9686275, 1, 1,
0.04333055, -0.7985579, 2.476759, 0, 0.9647059, 1, 1,
0.0442699, 2.018544, 0.5934113, 0, 0.9568627, 1, 1,
0.04480438, 0.5068588, 0.06436229, 0, 0.9529412, 1, 1,
0.04696375, 1.670387, -1.011054, 0, 0.945098, 1, 1,
0.04743544, 0.9178998, -1.294247, 0, 0.9411765, 1, 1,
0.04820072, -0.8206265, 0.8212836, 0, 0.9333333, 1, 1,
0.05894195, 0.485248, 0.8879226, 0, 0.9294118, 1, 1,
0.06987204, 0.1284188, -1.434082, 0, 0.9215686, 1, 1,
0.07102783, -0.3261472, 2.193721, 0, 0.9176471, 1, 1,
0.07123003, 1.127193, -0.05656012, 0, 0.9098039, 1, 1,
0.0748329, -0.9323009, 4.378385, 0, 0.9058824, 1, 1,
0.07492816, 1.057271, -1.210022, 0, 0.8980392, 1, 1,
0.07665297, 0.4302334, -1.734915, 0, 0.8901961, 1, 1,
0.08080151, 0.6494756, -0.8855934, 0, 0.8862745, 1, 1,
0.08152913, 1.33335, -1.382188, 0, 0.8784314, 1, 1,
0.0836525, -0.8870596, 2.196486, 0, 0.8745098, 1, 1,
0.08709595, -1.837594, 3.690475, 0, 0.8666667, 1, 1,
0.09361697, -0.9093006, 3.657881, 0, 0.8627451, 1, 1,
0.09550517, 0.1770984, 2.184712, 0, 0.854902, 1, 1,
0.09627851, 0.9950153, 0.5171351, 0, 0.8509804, 1, 1,
0.1038151, 0.2246766, 1.434002, 0, 0.8431373, 1, 1,
0.1098432, -0.3153166, 0.4906599, 0, 0.8392157, 1, 1,
0.1106945, -1.505653, 3.5438, 0, 0.8313726, 1, 1,
0.1125388, 0.124525, 0.9349076, 0, 0.827451, 1, 1,
0.1136824, -1.148459, 4.506557, 0, 0.8196079, 1, 1,
0.1167879, -0.225226, 2.96813, 0, 0.8156863, 1, 1,
0.1191766, -0.5311729, 4.182613, 0, 0.8078431, 1, 1,
0.1208387, 0.04184178, -0.04774418, 0, 0.8039216, 1, 1,
0.1209084, 0.4263978, -0.7622849, 0, 0.7960784, 1, 1,
0.1213559, 0.5480103, 0.7797066, 0, 0.7882353, 1, 1,
0.1216109, -0.1115928, 1.408344, 0, 0.7843137, 1, 1,
0.1226671, -0.3291967, 2.050442, 0, 0.7764706, 1, 1,
0.125564, -1.112465, 3.420066, 0, 0.772549, 1, 1,
0.1277774, -0.2334147, 3.397367, 0, 0.7647059, 1, 1,
0.1314882, 0.7279153, -1.183794, 0, 0.7607843, 1, 1,
0.1327772, 0.3844936, 0.805665, 0, 0.7529412, 1, 1,
0.1346842, -0.9438513, 2.060239, 0, 0.7490196, 1, 1,
0.1369499, -0.6154411, 3.261737, 0, 0.7411765, 1, 1,
0.1384289, -0.9211597, 5.379765, 0, 0.7372549, 1, 1,
0.1388069, -1.038282, 2.232234, 0, 0.7294118, 1, 1,
0.1412288, -1.123952, 3.059679, 0, 0.7254902, 1, 1,
0.1422073, -1.078759, 2.647092, 0, 0.7176471, 1, 1,
0.1433336, 0.8761216, 0.1806681, 0, 0.7137255, 1, 1,
0.1436886, 0.9749259, 0.07745712, 0, 0.7058824, 1, 1,
0.1463568, 2.591581, 0.3006668, 0, 0.6980392, 1, 1,
0.1490085, -0.1656857, 2.070587, 0, 0.6941177, 1, 1,
0.1553398, 1.757892, -0.4834038, 0, 0.6862745, 1, 1,
0.155626, -0.2383302, 0.4943703, 0, 0.682353, 1, 1,
0.1556996, 0.6151326, 0.4397823, 0, 0.6745098, 1, 1,
0.1574368, 0.9338083, 0.06062835, 0, 0.6705883, 1, 1,
0.1582007, 0.4989863, -0.4784764, 0, 0.6627451, 1, 1,
0.1634812, -1.392637, 4.913271, 0, 0.6588235, 1, 1,
0.1640327, 1.125639, -0.1817521, 0, 0.6509804, 1, 1,
0.1740516, 0.07364701, -0.1708331, 0, 0.6470588, 1, 1,
0.1748329, 0.5867429, -0.47327, 0, 0.6392157, 1, 1,
0.1772409, 0.741196, 2.212205, 0, 0.6352941, 1, 1,
0.1788705, 0.1110899, -0.2682786, 0, 0.627451, 1, 1,
0.1818251, -1.434146, 3.348694, 0, 0.6235294, 1, 1,
0.1878175, 0.7786386, -1.040915, 0, 0.6156863, 1, 1,
0.188523, 0.3133589, 0.8255999, 0, 0.6117647, 1, 1,
0.1888696, 0.2377997, 1.082556, 0, 0.6039216, 1, 1,
0.1896911, 1.540682, 1.66237, 0, 0.5960785, 1, 1,
0.1905815, -2.081482, 2.359516, 0, 0.5921569, 1, 1,
0.1909354, -0.5603229, 0.5909661, 0, 0.5843138, 1, 1,
0.1949113, -0.5312667, 2.68007, 0, 0.5803922, 1, 1,
0.198184, 0.4580998, 0.3560957, 0, 0.572549, 1, 1,
0.2013435, -0.1248487, 2.058772, 0, 0.5686275, 1, 1,
0.2019287, 0.162118, 0.5540029, 0, 0.5607843, 1, 1,
0.2029088, -0.4794036, 3.268796, 0, 0.5568628, 1, 1,
0.2068338, 2.087925, -0.2502871, 0, 0.5490196, 1, 1,
0.2082057, -1.252661, 0.4524844, 0, 0.5450981, 1, 1,
0.210795, -0.3910533, 5.568802, 0, 0.5372549, 1, 1,
0.2159548, 0.5828876, -0.5798394, 0, 0.5333334, 1, 1,
0.2193676, 1.091702, 0.04266762, 0, 0.5254902, 1, 1,
0.2210664, 1.339788, -1.057226, 0, 0.5215687, 1, 1,
0.2279198, -1.507189, 1.850022, 0, 0.5137255, 1, 1,
0.2292034, 1.49474, 0.1657838, 0, 0.509804, 1, 1,
0.2302701, 0.3785514, -0.3220175, 0, 0.5019608, 1, 1,
0.2383935, 1.118828, 0.9796295, 0, 0.4941176, 1, 1,
0.2405188, 0.5035989, 2.516177, 0, 0.4901961, 1, 1,
0.2525119, -1.060165, 2.468528, 0, 0.4823529, 1, 1,
0.2536776, 0.6883805, 1.083151, 0, 0.4784314, 1, 1,
0.2557546, 0.8574312, -0.01514786, 0, 0.4705882, 1, 1,
0.2579707, -0.6342495, 4.404567, 0, 0.4666667, 1, 1,
0.257973, -0.7848401, 3.657477, 0, 0.4588235, 1, 1,
0.2640234, -2.672233, 1.594816, 0, 0.454902, 1, 1,
0.2657991, 0.4336717, -0.3131817, 0, 0.4470588, 1, 1,
0.2746418, -1.729287, 3.797417, 0, 0.4431373, 1, 1,
0.2787969, 0.4001063, 1.501303, 0, 0.4352941, 1, 1,
0.2794512, 1.607726, 0.2169859, 0, 0.4313726, 1, 1,
0.2800122, -0.2044842, 1.682011, 0, 0.4235294, 1, 1,
0.2810905, 0.5482939, 0.3356048, 0, 0.4196078, 1, 1,
0.2821854, -0.8446125, 2.488266, 0, 0.4117647, 1, 1,
0.2847522, -0.8107517, 3.397027, 0, 0.4078431, 1, 1,
0.2890862, 1.30491, 0.09594319, 0, 0.4, 1, 1,
0.2895766, 1.967397, 0.1460592, 0, 0.3921569, 1, 1,
0.2902595, 1.265184, -1.758488, 0, 0.3882353, 1, 1,
0.2917622, -0.6409263, 2.987627, 0, 0.3803922, 1, 1,
0.2929495, -0.3929035, 1.852759, 0, 0.3764706, 1, 1,
0.2945296, 0.2601417, 1.805631, 0, 0.3686275, 1, 1,
0.2982171, 0.08791073, 0.8952652, 0, 0.3647059, 1, 1,
0.2991113, 0.8058301, 0.3114381, 0, 0.3568628, 1, 1,
0.3009, 0.2993837, 1.76618, 0, 0.3529412, 1, 1,
0.3020614, 0.860321, 0.4934149, 0, 0.345098, 1, 1,
0.3064259, 2.087286, 0.7273952, 0, 0.3411765, 1, 1,
0.3083819, 1.305424, -0.9310216, 0, 0.3333333, 1, 1,
0.3095852, 0.1860576, 1.531749, 0, 0.3294118, 1, 1,
0.3182997, -0.5464357, 2.663085, 0, 0.3215686, 1, 1,
0.3271996, 0.3765208, -1.195268, 0, 0.3176471, 1, 1,
0.3333839, -1.350546, 5.047233, 0, 0.3098039, 1, 1,
0.3356875, 0.2434217, 2.049968, 0, 0.3058824, 1, 1,
0.3375404, 0.8696933, 0.09466183, 0, 0.2980392, 1, 1,
0.3397508, -1.862676, 1.156617, 0, 0.2901961, 1, 1,
0.3423717, 0.5352483, 0.4868743, 0, 0.2862745, 1, 1,
0.3487113, -0.9359198, 1.694089, 0, 0.2784314, 1, 1,
0.358646, -1.181749, 3.807166, 0, 0.2745098, 1, 1,
0.3596436, -0.2600511, 2.599606, 0, 0.2666667, 1, 1,
0.3603674, -0.5023233, 2.374304, 0, 0.2627451, 1, 1,
0.3633188, -0.2145539, 2.563446, 0, 0.254902, 1, 1,
0.3633715, 1.151284, -0.5087439, 0, 0.2509804, 1, 1,
0.3638259, 0.09780194, 2.119508, 0, 0.2431373, 1, 1,
0.3642607, 1.528125, -1.625111, 0, 0.2392157, 1, 1,
0.3671476, 0.8441057, 1.087545, 0, 0.2313726, 1, 1,
0.3693039, 1.152093, -0.04433832, 0, 0.227451, 1, 1,
0.3696527, -0.5420126, 2.430811, 0, 0.2196078, 1, 1,
0.3697365, 0.2902528, 2.686663, 0, 0.2156863, 1, 1,
0.3753996, 1.561737, -0.6827567, 0, 0.2078431, 1, 1,
0.3775732, -1.922236, 4.017896, 0, 0.2039216, 1, 1,
0.3787951, 0.09528609, 1.021845, 0, 0.1960784, 1, 1,
0.3812792, 0.7563403, 0.6000336, 0, 0.1882353, 1, 1,
0.3822001, 0.8406866, -1.340363, 0, 0.1843137, 1, 1,
0.3858927, -0.2594676, 1.494826, 0, 0.1764706, 1, 1,
0.3864131, 1.355214, -0.7601574, 0, 0.172549, 1, 1,
0.3916786, -0.3849542, 3.25915, 0, 0.1647059, 1, 1,
0.3968372, -0.9486134, 2.525676, 0, 0.1607843, 1, 1,
0.3997605, -0.8421247, 1.795491, 0, 0.1529412, 1, 1,
0.4036839, 0.6959503, 0.0333766, 0, 0.1490196, 1, 1,
0.4058924, -1.517453, 2.183257, 0, 0.1411765, 1, 1,
0.4082375, 1.095939, 0.02037172, 0, 0.1372549, 1, 1,
0.4106554, 0.3516684, -1.551171, 0, 0.1294118, 1, 1,
0.4125121, -0.2463564, -0.05689699, 0, 0.1254902, 1, 1,
0.4157169, 1.377641, -0.3667791, 0, 0.1176471, 1, 1,
0.4193457, -2.350932, 3.972977, 0, 0.1137255, 1, 1,
0.420786, 0.8291826, 2.060528, 0, 0.1058824, 1, 1,
0.4236769, 0.3365539, 1.963042, 0, 0.09803922, 1, 1,
0.4237611, -0.08079387, 1.852676, 0, 0.09411765, 1, 1,
0.4239918, -0.03149947, 0.7198455, 0, 0.08627451, 1, 1,
0.4249753, 1.615309, 1.233883, 0, 0.08235294, 1, 1,
0.4256217, 0.2723145, 1.251761, 0, 0.07450981, 1, 1,
0.4256729, -0.3370523, 2.21524, 0, 0.07058824, 1, 1,
0.4296614, 1.998122, 0.6302289, 0, 0.0627451, 1, 1,
0.4298322, -0.5918283, 2.386339, 0, 0.05882353, 1, 1,
0.4370238, -0.3636266, 2.486092, 0, 0.05098039, 1, 1,
0.4372283, 0.2673886, 2.778444, 0, 0.04705882, 1, 1,
0.447092, -1.221495, 3.455091, 0, 0.03921569, 1, 1,
0.4477602, -0.1868212, 2.396218, 0, 0.03529412, 1, 1,
0.4514396, 0.9286575, 0.1879781, 0, 0.02745098, 1, 1,
0.4514821, -1.224137, 0.7075701, 0, 0.02352941, 1, 1,
0.4518079, -0.2368472, 1.103516, 0, 0.01568628, 1, 1,
0.4554021, 1.273047, -2.328555, 0, 0.01176471, 1, 1,
0.4559012, -1.453719, 1.221223, 0, 0.003921569, 1, 1,
0.4568211, -0.4874429, 5.070168, 0.003921569, 0, 1, 1,
0.4609916, 0.4662346, 0.3059124, 0.007843138, 0, 1, 1,
0.4681609, 0.2464077, -0.32653, 0.01568628, 0, 1, 1,
0.4696492, -0.2604772, 3.500105, 0.01960784, 0, 1, 1,
0.476788, 0.8107542, 1.269346, 0.02745098, 0, 1, 1,
0.4799202, 0.872667, 1.231537, 0.03137255, 0, 1, 1,
0.480086, -0.6708909, 1.927049, 0.03921569, 0, 1, 1,
0.4803811, 0.8601305, 1.28118, 0.04313726, 0, 1, 1,
0.4824364, -0.5027426, 2.98126, 0.05098039, 0, 1, 1,
0.4877186, -1.281473, 2.071502, 0.05490196, 0, 1, 1,
0.4880837, 0.9625887, 2.171092, 0.0627451, 0, 1, 1,
0.493174, -0.771969, 1.912895, 0.06666667, 0, 1, 1,
0.4944679, 1.891691, -0.8087164, 0.07450981, 0, 1, 1,
0.4982636, 1.297549, 0.01443405, 0.07843138, 0, 1, 1,
0.5109087, 0.4938575, 0.4657544, 0.08627451, 0, 1, 1,
0.5119302, 1.19154, -0.1371447, 0.09019608, 0, 1, 1,
0.5155756, 0.07384887, 2.459065, 0.09803922, 0, 1, 1,
0.5172692, 0.2356509, 1.442563, 0.1058824, 0, 1, 1,
0.5242696, -0.7846844, 1.259629, 0.1098039, 0, 1, 1,
0.5286514, -0.8608706, 2.868362, 0.1176471, 0, 1, 1,
0.5301101, 0.2022923, -0.3346807, 0.1215686, 0, 1, 1,
0.534346, 0.4394984, 0.8557217, 0.1294118, 0, 1, 1,
0.5347356, -0.1129012, 2.815218, 0.1333333, 0, 1, 1,
0.5365842, -0.6956743, 2.283733, 0.1411765, 0, 1, 1,
0.5373829, -0.6633562, 3.613759, 0.145098, 0, 1, 1,
0.5393528, -0.09948784, -0.447597, 0.1529412, 0, 1, 1,
0.5420433, -0.3601652, 3.915726, 0.1568628, 0, 1, 1,
0.5501126, -0.3902735, 2.091963, 0.1647059, 0, 1, 1,
0.5503402, -1.061856, 2.257342, 0.1686275, 0, 1, 1,
0.55184, 1.388867, 1.746741, 0.1764706, 0, 1, 1,
0.5570418, -1.190989, 3.139327, 0.1803922, 0, 1, 1,
0.5580878, -0.8359867, 0.00189088, 0.1882353, 0, 1, 1,
0.5639677, -1.639967, 1.702383, 0.1921569, 0, 1, 1,
0.5647225, 0.896417, 0.9833686, 0.2, 0, 1, 1,
0.5689008, 0.7070457, 1.848169, 0.2078431, 0, 1, 1,
0.5713331, -1.062142, 2.558918, 0.2117647, 0, 1, 1,
0.5719891, 0.4873724, 1.010707, 0.2196078, 0, 1, 1,
0.5748205, 0.1172758, 3.400346, 0.2235294, 0, 1, 1,
0.5756696, 0.3601375, 2.460707, 0.2313726, 0, 1, 1,
0.5789641, 0.116263, 1.176317, 0.2352941, 0, 1, 1,
0.5800385, 0.8635517, 0.912746, 0.2431373, 0, 1, 1,
0.580135, 1.115053, 1.638752, 0.2470588, 0, 1, 1,
0.5833197, 0.0895239, 1.431694, 0.254902, 0, 1, 1,
0.5879946, -1.107762, 3.358663, 0.2588235, 0, 1, 1,
0.588984, 0.01045711, 1.87729, 0.2666667, 0, 1, 1,
0.5906515, -0.148514, 2.062564, 0.2705882, 0, 1, 1,
0.5918827, 0.03432227, 2.574844, 0.2784314, 0, 1, 1,
0.6005911, -0.5716955, 2.856982, 0.282353, 0, 1, 1,
0.60638, 0.1495429, 1.32787, 0.2901961, 0, 1, 1,
0.6224883, 0.7257724, 1.43529, 0.2941177, 0, 1, 1,
0.6243711, 0.3827289, -0.2750957, 0.3019608, 0, 1, 1,
0.6270884, 0.6924078, 1.059074, 0.3098039, 0, 1, 1,
0.6337126, 0.4530138, 0.8565633, 0.3137255, 0, 1, 1,
0.6378149, 0.537051, 0.7298305, 0.3215686, 0, 1, 1,
0.6384709, 0.4514046, 0.9257941, 0.3254902, 0, 1, 1,
0.6499817, -0.8004548, 2.968546, 0.3333333, 0, 1, 1,
0.6515557, -0.2793571, 2.074477, 0.3372549, 0, 1, 1,
0.6572604, 0.1720676, 0.8879513, 0.345098, 0, 1, 1,
0.6590233, -0.5659035, 1.168763, 0.3490196, 0, 1, 1,
0.6623715, -2.344181, 3.426321, 0.3568628, 0, 1, 1,
0.6642336, 1.035937, 0.2590637, 0.3607843, 0, 1, 1,
0.6683975, 0.2346778, -0.9864327, 0.3686275, 0, 1, 1,
0.6693762, -0.2123779, 0.7739986, 0.372549, 0, 1, 1,
0.6736274, -2.475966, 1.475488, 0.3803922, 0, 1, 1,
0.6774843, -2.167493, 3.114323, 0.3843137, 0, 1, 1,
0.6786681, -0.1879498, -0.4559614, 0.3921569, 0, 1, 1,
0.6820925, 0.4397186, 1.499313, 0.3960784, 0, 1, 1,
0.6841025, 1.792752, -0.4488466, 0.4039216, 0, 1, 1,
0.6854035, -0.2596142, 1.221897, 0.4117647, 0, 1, 1,
0.6860486, 1.205307, 1.776593, 0.4156863, 0, 1, 1,
0.6868674, -0.3852107, 1.965403, 0.4235294, 0, 1, 1,
0.6877783, -0.5799633, 1.010453, 0.427451, 0, 1, 1,
0.6878514, 0.09778589, 1.039327, 0.4352941, 0, 1, 1,
0.6905482, 0.5043619, -0.5262091, 0.4392157, 0, 1, 1,
0.692216, 0.2046186, 0.08312327, 0.4470588, 0, 1, 1,
0.6926419, 1.971323, 0.5242326, 0.4509804, 0, 1, 1,
0.6940562, 0.6912564, 0.4804692, 0.4588235, 0, 1, 1,
0.6947892, 0.07591474, 2.386053, 0.4627451, 0, 1, 1,
0.69556, -0.480199, 3.744435, 0.4705882, 0, 1, 1,
0.7025092, -0.4343866, 0.4461122, 0.4745098, 0, 1, 1,
0.7040112, -0.8535094, 2.490333, 0.4823529, 0, 1, 1,
0.7040818, 0.4926093, -0.5256116, 0.4862745, 0, 1, 1,
0.7054281, 0.7582827, 1.428837, 0.4941176, 0, 1, 1,
0.7117842, -0.6809847, 2.355776, 0.5019608, 0, 1, 1,
0.7150345, 1.411487, -0.1753121, 0.5058824, 0, 1, 1,
0.7169089, 0.7420253, 3.433643, 0.5137255, 0, 1, 1,
0.723184, 0.07522876, 0.5085599, 0.5176471, 0, 1, 1,
0.7288962, 1.098648, 0.1513062, 0.5254902, 0, 1, 1,
0.7291817, 0.9525694, 0.1747441, 0.5294118, 0, 1, 1,
0.7325277, -1.281883, 1.833504, 0.5372549, 0, 1, 1,
0.7325756, -0.4409744, 2.77307, 0.5411765, 0, 1, 1,
0.7356731, 0.2208739, -0.7251793, 0.5490196, 0, 1, 1,
0.7374628, -1.33321, 1.778157, 0.5529412, 0, 1, 1,
0.7527748, -0.1252816, 2.469519, 0.5607843, 0, 1, 1,
0.7529185, 2.351491, 1.457923, 0.5647059, 0, 1, 1,
0.753274, -1.746735, 3.244284, 0.572549, 0, 1, 1,
0.7551913, -1.428986, 3.13528, 0.5764706, 0, 1, 1,
0.7570151, 1.034557, 0.4818601, 0.5843138, 0, 1, 1,
0.7579432, -2.041914, 4.414522, 0.5882353, 0, 1, 1,
0.7583833, -0.1094805, 3.062071, 0.5960785, 0, 1, 1,
0.7618269, 1.341229, -1.508164, 0.6039216, 0, 1, 1,
0.7629147, -0.2383915, 2.90178, 0.6078432, 0, 1, 1,
0.7632722, 0.1211947, 0.8873723, 0.6156863, 0, 1, 1,
0.7645283, -1.052187, 2.874226, 0.6196079, 0, 1, 1,
0.765844, -0.6521512, 2.048199, 0.627451, 0, 1, 1,
0.7681416, 1.78464, 2.755501, 0.6313726, 0, 1, 1,
0.773042, 1.530937, 0.5001861, 0.6392157, 0, 1, 1,
0.777999, 0.1995224, 0.9495959, 0.6431373, 0, 1, 1,
0.7798926, -0.5059895, 3.128301, 0.6509804, 0, 1, 1,
0.784245, 0.4441926, 2.043906, 0.654902, 0, 1, 1,
0.7895084, -0.4867025, 1.799, 0.6627451, 0, 1, 1,
0.7924914, 0.3687638, 1.331377, 0.6666667, 0, 1, 1,
0.7948934, -0.6069657, 1.510435, 0.6745098, 0, 1, 1,
0.7949102, 0.571142, 0.1320322, 0.6784314, 0, 1, 1,
0.7950983, -0.04786868, 0.3726722, 0.6862745, 0, 1, 1,
0.8017136, 0.4785547, 0.8452939, 0.6901961, 0, 1, 1,
0.8045489, -1.808315, 3.235921, 0.6980392, 0, 1, 1,
0.8078975, 0.3878779, -0.05325649, 0.7058824, 0, 1, 1,
0.8090105, -0.7454411, 2.120816, 0.7098039, 0, 1, 1,
0.8184921, -0.1918068, 0.2283079, 0.7176471, 0, 1, 1,
0.8203261, -1.226836, 1.618436, 0.7215686, 0, 1, 1,
0.8221713, -0.3714012, 1.865487, 0.7294118, 0, 1, 1,
0.8229021, 0.08314667, 1.420631, 0.7333333, 0, 1, 1,
0.8251997, -0.2315888, 0.1156893, 0.7411765, 0, 1, 1,
0.8269457, -0.5014117, 1.109964, 0.7450981, 0, 1, 1,
0.8271841, 1.786644, 0.4306856, 0.7529412, 0, 1, 1,
0.828837, 1.628019, -0.1028286, 0.7568628, 0, 1, 1,
0.8349769, -0.162244, 0.9947743, 0.7647059, 0, 1, 1,
0.8370107, -0.05407476, 1.06177, 0.7686275, 0, 1, 1,
0.8375449, 0.2294468, 0.7169938, 0.7764706, 0, 1, 1,
0.8387518, 1.21007, 1.867578, 0.7803922, 0, 1, 1,
0.8389379, 0.5230221, -0.9297791, 0.7882353, 0, 1, 1,
0.8405126, -1.09364, 1.028358, 0.7921569, 0, 1, 1,
0.8451685, -0.7898669, 3.283052, 0.8, 0, 1, 1,
0.8489487, 0.4654303, 0.3109088, 0.8078431, 0, 1, 1,
0.8522392, -0.6258397, 2.014479, 0.8117647, 0, 1, 1,
0.8590101, 0.669109, -0.09765107, 0.8196079, 0, 1, 1,
0.8646004, 0.06224981, 3.143817, 0.8235294, 0, 1, 1,
0.8665559, 0.7272896, 3.209368, 0.8313726, 0, 1, 1,
0.8694087, -0.4658819, 2.590096, 0.8352941, 0, 1, 1,
0.8703157, 2.061856, 0.4954284, 0.8431373, 0, 1, 1,
0.8821467, 0.1521167, 0.8894446, 0.8470588, 0, 1, 1,
0.8862658, 0.2380069, 3.524743, 0.854902, 0, 1, 1,
0.8869277, -1.665115, 1.294015, 0.8588235, 0, 1, 1,
0.8939086, -0.7243599, 2.715924, 0.8666667, 0, 1, 1,
0.895736, 0.05068282, 1.29314, 0.8705882, 0, 1, 1,
0.9162788, -0.8162184, 3.37658, 0.8784314, 0, 1, 1,
0.9177856, -0.01251434, 2.103079, 0.8823529, 0, 1, 1,
0.9229938, -1.104869, 2.220864, 0.8901961, 0, 1, 1,
0.9244202, 0.002934247, 1.553185, 0.8941177, 0, 1, 1,
0.9248354, 1.496189, 0.01730585, 0.9019608, 0, 1, 1,
0.9282957, 0.3649451, 0.6348891, 0.9098039, 0, 1, 1,
0.9316503, -0.2087331, 1.033848, 0.9137255, 0, 1, 1,
0.9333175, 0.5784338, 0.2787224, 0.9215686, 0, 1, 1,
0.935456, 0.09809249, 1.008445, 0.9254902, 0, 1, 1,
0.9436361, -1.849107, 3.707543, 0.9333333, 0, 1, 1,
0.9462769, -0.4201544, 1.635193, 0.9372549, 0, 1, 1,
0.9489986, 1.240654, 0.3751703, 0.945098, 0, 1, 1,
0.9493544, -1.570762, 2.722573, 0.9490196, 0, 1, 1,
0.9611174, -0.972536, 1.67974, 0.9568627, 0, 1, 1,
0.9654548, 1.050987, 1.474383, 0.9607843, 0, 1, 1,
0.972801, 0.5493233, -0.6952648, 0.9686275, 0, 1, 1,
0.9730093, -0.5876539, 3.503855, 0.972549, 0, 1, 1,
0.9761109, -0.1050976, 1.620718, 0.9803922, 0, 1, 1,
0.9774891, 0.3883081, 1.616273, 0.9843137, 0, 1, 1,
0.9774934, -1.128322, 4.359599, 0.9921569, 0, 1, 1,
0.9794973, -1.941097, 0.9198453, 0.9960784, 0, 1, 1,
0.981268, -1.597024, 2.771721, 1, 0, 0.9960784, 1,
0.9946048, 0.2535416, -0.8898331, 1, 0, 0.9882353, 1,
0.9958647, 0.5874644, 1.213717, 1, 0, 0.9843137, 1,
1.005982, 0.4984127, 2.741806, 1, 0, 0.9764706, 1,
1.00622, -0.3148216, 2.512625, 1, 0, 0.972549, 1,
1.015453, 0.3562773, 2.475851, 1, 0, 0.9647059, 1,
1.016477, 1.01126, 0.006436036, 1, 0, 0.9607843, 1,
1.018122, -0.2200158, 1.607219, 1, 0, 0.9529412, 1,
1.020057, 0.5343729, 2.521938, 1, 0, 0.9490196, 1,
1.021023, -0.03144482, 1.448695, 1, 0, 0.9411765, 1,
1.022677, -1.047167, 2.972064, 1, 0, 0.9372549, 1,
1.02813, -0.532213, 2.402561, 1, 0, 0.9294118, 1,
1.028163, 0.08966325, 1.693737, 1, 0, 0.9254902, 1,
1.032786, -1.176944, 2.869145, 1, 0, 0.9176471, 1,
1.033062, 0.09364583, 1.304177, 1, 0, 0.9137255, 1,
1.039469, -0.3409341, 1.915081, 1, 0, 0.9058824, 1,
1.044963, 0.7081914, 1.60052, 1, 0, 0.9019608, 1,
1.059471, 0.9745473, 0.9625563, 1, 0, 0.8941177, 1,
1.05982, -0.350245, 0.6669718, 1, 0, 0.8862745, 1,
1.068283, -0.1061036, 1.846771, 1, 0, 0.8823529, 1,
1.071881, 1.319023, 0.9155884, 1, 0, 0.8745098, 1,
1.072508, 1.923779, 0.8776824, 1, 0, 0.8705882, 1,
1.076086, -1.161882, 2.824626, 1, 0, 0.8627451, 1,
1.078541, 0.7302485, 0.8239277, 1, 0, 0.8588235, 1,
1.08087, -0.1106717, -0.05856827, 1, 0, 0.8509804, 1,
1.086188, 1.131054, -0.1673868, 1, 0, 0.8470588, 1,
1.091892, -0.03130915, 2.257144, 1, 0, 0.8392157, 1,
1.092646, 0.297863, 1.285842, 1, 0, 0.8352941, 1,
1.094787, -0.6258438, 2.516604, 1, 0, 0.827451, 1,
1.100828, -0.7022473, 2.4338, 1, 0, 0.8235294, 1,
1.103052, 0.2821596, 0.3436864, 1, 0, 0.8156863, 1,
1.103275, 0.1843285, 1.786023, 1, 0, 0.8117647, 1,
1.104054, -0.3928623, 0.5970686, 1, 0, 0.8039216, 1,
1.108356, 1.010142, 1.671319, 1, 0, 0.7960784, 1,
1.114866, 1.576092, -0.1046101, 1, 0, 0.7921569, 1,
1.116844, 2.140016, 1.076539, 1, 0, 0.7843137, 1,
1.12367, 0.3439546, 2.447411, 1, 0, 0.7803922, 1,
1.126635, 0.07030942, 0.8129687, 1, 0, 0.772549, 1,
1.129661, -1.758586, 4.06352, 1, 0, 0.7686275, 1,
1.134927, -1.279528, 1.938985, 1, 0, 0.7607843, 1,
1.135979, -1.248032, 3.844053, 1, 0, 0.7568628, 1,
1.15134, -1.062483, 1.729353, 1, 0, 0.7490196, 1,
1.152955, 0.5925711, 0.5133179, 1, 0, 0.7450981, 1,
1.154832, -0.9142535, 1.77669, 1, 0, 0.7372549, 1,
1.156922, -1.672026, 3.130119, 1, 0, 0.7333333, 1,
1.161727, -0.9448653, 1.397657, 1, 0, 0.7254902, 1,
1.173795, -0.7133187, 3.808284, 1, 0, 0.7215686, 1,
1.174654, -0.9277655, 2.121911, 1, 0, 0.7137255, 1,
1.176865, -0.9186816, 2.641815, 1, 0, 0.7098039, 1,
1.177448, -0.1313617, 2.427261, 1, 0, 0.7019608, 1,
1.177823, 0.8592125, 0.8952892, 1, 0, 0.6941177, 1,
1.180405, 1.624823, 2.822309, 1, 0, 0.6901961, 1,
1.182114, 1.47825, 2.127156, 1, 0, 0.682353, 1,
1.18891, 1.188313, 1.117463, 1, 0, 0.6784314, 1,
1.191761, -2.634984, 2.463209, 1, 0, 0.6705883, 1,
1.19354, 0.3775669, 1.323722, 1, 0, 0.6666667, 1,
1.196054, 2.072357, -0.5301387, 1, 0, 0.6588235, 1,
1.217218, 0.6171354, -0.3976922, 1, 0, 0.654902, 1,
1.217891, -0.493948, 1.901196, 1, 0, 0.6470588, 1,
1.223907, -0.3818268, 1.004703, 1, 0, 0.6431373, 1,
1.230647, 0.1011634, 2.572167, 1, 0, 0.6352941, 1,
1.247658, 1.719039, 1.376133, 1, 0, 0.6313726, 1,
1.258171, -0.2719881, 1.131539, 1, 0, 0.6235294, 1,
1.259999, 0.1490022, 1.951032, 1, 0, 0.6196079, 1,
1.265492, 1.043011, 2.7616, 1, 0, 0.6117647, 1,
1.266306, -0.1862795, 0.7603714, 1, 0, 0.6078432, 1,
1.26695, 1.61182, -0.2870165, 1, 0, 0.6, 1,
1.285856, -1.337877, 2.771135, 1, 0, 0.5921569, 1,
1.292118, -0.5506738, 1.101436, 1, 0, 0.5882353, 1,
1.302251, 0.8992158, 0.2481572, 1, 0, 0.5803922, 1,
1.306452, 0.05116836, 1.785673, 1, 0, 0.5764706, 1,
1.309466, -2.171229, 3.05219, 1, 0, 0.5686275, 1,
1.31429, 0.2780231, 1.397588, 1, 0, 0.5647059, 1,
1.315967, -0.5000204, 2.271885, 1, 0, 0.5568628, 1,
1.316937, -1.832583, 2.526027, 1, 0, 0.5529412, 1,
1.326853, 1.99956, 0.3948179, 1, 0, 0.5450981, 1,
1.326856, -0.08187151, 2.550833, 1, 0, 0.5411765, 1,
1.345418, -0.3339391, -0.5069817, 1, 0, 0.5333334, 1,
1.351797, 0.05028271, 2.64538, 1, 0, 0.5294118, 1,
1.360116, -0.1965835, 2.523166, 1, 0, 0.5215687, 1,
1.37199, 1.838956, 1.254667, 1, 0, 0.5176471, 1,
1.373134, -1.275747, 2.646071, 1, 0, 0.509804, 1,
1.381105, -0.150322, 1.762544, 1, 0, 0.5058824, 1,
1.396962, -0.8235787, 2.02697, 1, 0, 0.4980392, 1,
1.409659, -1.227153, 3.048851, 1, 0, 0.4901961, 1,
1.445585, -0.647768, 1.92782, 1, 0, 0.4862745, 1,
1.447096, -0.150123, 1.978405, 1, 0, 0.4784314, 1,
1.458418, 0.1614704, 2.782577, 1, 0, 0.4745098, 1,
1.464478, -0.1475047, 1.459644, 1, 0, 0.4666667, 1,
1.466076, 0.03587979, 1.284382, 1, 0, 0.4627451, 1,
1.469736, -0.05771445, 2.273885, 1, 0, 0.454902, 1,
1.485363, -1.274042, 3.070238, 1, 0, 0.4509804, 1,
1.497063, 0.314822, 1.684027, 1, 0, 0.4431373, 1,
1.500491, -1.218096, 1.980374, 1, 0, 0.4392157, 1,
1.501184, -0.4816076, 3.470593, 1, 0, 0.4313726, 1,
1.501914, 0.8042875, 1.497516, 1, 0, 0.427451, 1,
1.505399, 0.174859, -0.716217, 1, 0, 0.4196078, 1,
1.530828, -1.33525, 2.884006, 1, 0, 0.4156863, 1,
1.536518, 0.008141638, 2.049791, 1, 0, 0.4078431, 1,
1.542418, 0.4189133, 1.013676, 1, 0, 0.4039216, 1,
1.564397, 0.7115386, 1.247794, 1, 0, 0.3960784, 1,
1.571942, -0.8962668, 2.230023, 1, 0, 0.3882353, 1,
1.573226, 0.6805922, 1.086928, 1, 0, 0.3843137, 1,
1.584436, -0.4544527, 0.5718565, 1, 0, 0.3764706, 1,
1.596509, 0.03855628, 1.668685, 1, 0, 0.372549, 1,
1.608578, 2.643421, 0.3205901, 1, 0, 0.3647059, 1,
1.611893, -1.441433, 2.472043, 1, 0, 0.3607843, 1,
1.615728, 0.2652829, 2.856739, 1, 0, 0.3529412, 1,
1.624991, 0.1796633, 1.957888, 1, 0, 0.3490196, 1,
1.652149, 0.9308296, 0.6201615, 1, 0, 0.3411765, 1,
1.660169, 1.596891, -0.01548188, 1, 0, 0.3372549, 1,
1.661016, -0.872124, 3.135888, 1, 0, 0.3294118, 1,
1.661502, 1.276901, 2.049302, 1, 0, 0.3254902, 1,
1.675368, 2.266234, 0.4233837, 1, 0, 0.3176471, 1,
1.694329, 0.9689831, 0.9688147, 1, 0, 0.3137255, 1,
1.694896, -0.06126119, 0.9112033, 1, 0, 0.3058824, 1,
1.698363, -0.1739136, 1.376025, 1, 0, 0.2980392, 1,
1.70352, 0.7387884, -0.1163283, 1, 0, 0.2941177, 1,
1.708425, -0.1438791, 1.753456, 1, 0, 0.2862745, 1,
1.711003, -0.8990109, 3.132575, 1, 0, 0.282353, 1,
1.71174, -1.293185, 2.870113, 1, 0, 0.2745098, 1,
1.734888, -0.1771973, 0.912168, 1, 0, 0.2705882, 1,
1.745428, 0.3797847, 1.193407, 1, 0, 0.2627451, 1,
1.75727, -1.085697, 3.515604, 1, 0, 0.2588235, 1,
1.768354, -0.5130094, 2.817151, 1, 0, 0.2509804, 1,
1.768533, -0.9799888, 0.8484116, 1, 0, 0.2470588, 1,
1.784216, -0.4265129, 2.191479, 1, 0, 0.2392157, 1,
1.790064, 0.2422237, 2.443102, 1, 0, 0.2352941, 1,
1.790585, 0.4836418, 1.429107, 1, 0, 0.227451, 1,
1.795257, -0.8597664, 1.029956, 1, 0, 0.2235294, 1,
1.836409, 0.665953, 1.436706, 1, 0, 0.2156863, 1,
1.858098, 0.228329, 1.763793, 1, 0, 0.2117647, 1,
1.863546, -0.2807168, 2.552112, 1, 0, 0.2039216, 1,
1.873662, 0.9520171, 0.6911563, 1, 0, 0.1960784, 1,
1.875693, 0.1037464, 2.516523, 1, 0, 0.1921569, 1,
1.876272, 1.100504, 1.329374, 1, 0, 0.1843137, 1,
1.892103, 2.213898, -0.3080352, 1, 0, 0.1803922, 1,
1.905851, -0.04097618, 2.129175, 1, 0, 0.172549, 1,
1.922831, 0.1611446, 0.5311525, 1, 0, 0.1686275, 1,
1.926731, 0.4015232, 1.236785, 1, 0, 0.1607843, 1,
1.947764, 0.2584257, 2.459186, 1, 0, 0.1568628, 1,
1.948045, -1.25001, 0.9666485, 1, 0, 0.1490196, 1,
2.010274, 1.279553, 1.742346, 1, 0, 0.145098, 1,
2.016542, -0.6558336, 0.4067666, 1, 0, 0.1372549, 1,
2.024349, 0.9266783, 0.4783571, 1, 0, 0.1333333, 1,
2.026037, 0.168252, 1.960114, 1, 0, 0.1254902, 1,
2.0537, 0.1629151, -0.05144339, 1, 0, 0.1215686, 1,
2.056961, -0.8945245, 0.3192618, 1, 0, 0.1137255, 1,
2.060965, 1.41879, 3.472298, 1, 0, 0.1098039, 1,
2.097032, -0.8838243, 2.236628, 1, 0, 0.1019608, 1,
2.104639, -0.07552902, 1.615649, 1, 0, 0.09411765, 1,
2.110555, 1.54597, 0.3940852, 1, 0, 0.09019608, 1,
2.175412, -2.148036, 1.203119, 1, 0, 0.08235294, 1,
2.17945, 2.465914, 0.7004806, 1, 0, 0.07843138, 1,
2.192598, 0.7610003, 1.498955, 1, 0, 0.07058824, 1,
2.288008, -1.582579, 0.7958272, 1, 0, 0.06666667, 1,
2.401375, 2.168981, 2.648338, 1, 0, 0.05882353, 1,
2.427519, 1.009873, 0.6807162, 1, 0, 0.05490196, 1,
2.538404, -0.2922594, 1.638298, 1, 0, 0.04705882, 1,
2.544118, -0.1008402, 1.920706, 1, 0, 0.04313726, 1,
2.567425, -0.04833141, 2.05774, 1, 0, 0.03529412, 1,
2.576349, 2.325615e-05, 0.7289635, 1, 0, 0.03137255, 1,
2.591489, 0.779956, 2.367981, 1, 0, 0.02352941, 1,
2.795919, 0.04731156, 2.38041, 1, 0, 0.01960784, 1,
2.886267, -0.6439129, 1.799134, 1, 0, 0.01176471, 1,
3.000025, -0.390338, 3.896301, 1, 0, 0.007843138, 1
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
-0.3950844, -3.614912, -6.915683, 0, -0.5, 0.5, 0.5,
-0.3950844, -3.614912, -6.915683, 1, -0.5, 0.5, 0.5,
-0.3950844, -3.614912, -6.915683, 1, 1.5, 0.5, 0.5,
-0.3950844, -3.614912, -6.915683, 0, 1.5, 0.5, 0.5
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
-4.941136, 0.1085324, -6.915683, 0, -0.5, 0.5, 0.5,
-4.941136, 0.1085324, -6.915683, 1, -0.5, 0.5, 0.5,
-4.941136, 0.1085324, -6.915683, 1, 1.5, 0.5, 0.5,
-4.941136, 0.1085324, -6.915683, 0, 1.5, 0.5, 0.5
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
-4.941136, -3.614912, 0.2312713, 0, -0.5, 0.5, 0.5,
-4.941136, -3.614912, 0.2312713, 1, -0.5, 0.5, 0.5,
-4.941136, -3.614912, 0.2312713, 1, 1.5, 0.5, 0.5,
-4.941136, -3.614912, 0.2312713, 0, 1.5, 0.5, 0.5
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
-3, -2.755656, -5.266386,
3, -2.755656, -5.266386,
-3, -2.755656, -5.266386,
-3, -2.898865, -5.541269,
-2, -2.755656, -5.266386,
-2, -2.898865, -5.541269,
-1, -2.755656, -5.266386,
-1, -2.898865, -5.541269,
0, -2.755656, -5.266386,
0, -2.898865, -5.541269,
1, -2.755656, -5.266386,
1, -2.898865, -5.541269,
2, -2.755656, -5.266386,
2, -2.898865, -5.541269,
3, -2.755656, -5.266386,
3, -2.898865, -5.541269
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
-3, -3.185284, -6.091034, 0, -0.5, 0.5, 0.5,
-3, -3.185284, -6.091034, 1, -0.5, 0.5, 0.5,
-3, -3.185284, -6.091034, 1, 1.5, 0.5, 0.5,
-3, -3.185284, -6.091034, 0, 1.5, 0.5, 0.5,
-2, -3.185284, -6.091034, 0, -0.5, 0.5, 0.5,
-2, -3.185284, -6.091034, 1, -0.5, 0.5, 0.5,
-2, -3.185284, -6.091034, 1, 1.5, 0.5, 0.5,
-2, -3.185284, -6.091034, 0, 1.5, 0.5, 0.5,
-1, -3.185284, -6.091034, 0, -0.5, 0.5, 0.5,
-1, -3.185284, -6.091034, 1, -0.5, 0.5, 0.5,
-1, -3.185284, -6.091034, 1, 1.5, 0.5, 0.5,
-1, -3.185284, -6.091034, 0, 1.5, 0.5, 0.5,
0, -3.185284, -6.091034, 0, -0.5, 0.5, 0.5,
0, -3.185284, -6.091034, 1, -0.5, 0.5, 0.5,
0, -3.185284, -6.091034, 1, 1.5, 0.5, 0.5,
0, -3.185284, -6.091034, 0, 1.5, 0.5, 0.5,
1, -3.185284, -6.091034, 0, -0.5, 0.5, 0.5,
1, -3.185284, -6.091034, 1, -0.5, 0.5, 0.5,
1, -3.185284, -6.091034, 1, 1.5, 0.5, 0.5,
1, -3.185284, -6.091034, 0, 1.5, 0.5, 0.5,
2, -3.185284, -6.091034, 0, -0.5, 0.5, 0.5,
2, -3.185284, -6.091034, 1, -0.5, 0.5, 0.5,
2, -3.185284, -6.091034, 1, 1.5, 0.5, 0.5,
2, -3.185284, -6.091034, 0, 1.5, 0.5, 0.5,
3, -3.185284, -6.091034, 0, -0.5, 0.5, 0.5,
3, -3.185284, -6.091034, 1, -0.5, 0.5, 0.5,
3, -3.185284, -6.091034, 1, 1.5, 0.5, 0.5,
3, -3.185284, -6.091034, 0, 1.5, 0.5, 0.5
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
-3.892047, -2, -5.266386,
-3.892047, 2, -5.266386,
-3.892047, -2, -5.266386,
-4.066895, -2, -5.541269,
-3.892047, -1, -5.266386,
-4.066895, -1, -5.541269,
-3.892047, 0, -5.266386,
-4.066895, 0, -5.541269,
-3.892047, 1, -5.266386,
-4.066895, 1, -5.541269,
-3.892047, 2, -5.266386,
-4.066895, 2, -5.541269
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
-4.416592, -2, -6.091034, 0, -0.5, 0.5, 0.5,
-4.416592, -2, -6.091034, 1, -0.5, 0.5, 0.5,
-4.416592, -2, -6.091034, 1, 1.5, 0.5, 0.5,
-4.416592, -2, -6.091034, 0, 1.5, 0.5, 0.5,
-4.416592, -1, -6.091034, 0, -0.5, 0.5, 0.5,
-4.416592, -1, -6.091034, 1, -0.5, 0.5, 0.5,
-4.416592, -1, -6.091034, 1, 1.5, 0.5, 0.5,
-4.416592, -1, -6.091034, 0, 1.5, 0.5, 0.5,
-4.416592, 0, -6.091034, 0, -0.5, 0.5, 0.5,
-4.416592, 0, -6.091034, 1, -0.5, 0.5, 0.5,
-4.416592, 0, -6.091034, 1, 1.5, 0.5, 0.5,
-4.416592, 0, -6.091034, 0, 1.5, 0.5, 0.5,
-4.416592, 1, -6.091034, 0, -0.5, 0.5, 0.5,
-4.416592, 1, -6.091034, 1, -0.5, 0.5, 0.5,
-4.416592, 1, -6.091034, 1, 1.5, 0.5, 0.5,
-4.416592, 1, -6.091034, 0, 1.5, 0.5, 0.5,
-4.416592, 2, -6.091034, 0, -0.5, 0.5, 0.5,
-4.416592, 2, -6.091034, 1, -0.5, 0.5, 0.5,
-4.416592, 2, -6.091034, 1, 1.5, 0.5, 0.5,
-4.416592, 2, -6.091034, 0, 1.5, 0.5, 0.5
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
-3.892047, -2.755656, -4,
-3.892047, -2.755656, 4,
-3.892047, -2.755656, -4,
-4.066895, -2.898865, -4,
-3.892047, -2.755656, -2,
-4.066895, -2.898865, -2,
-3.892047, -2.755656, 0,
-4.066895, -2.898865, 0,
-3.892047, -2.755656, 2,
-4.066895, -2.898865, 2,
-3.892047, -2.755656, 4,
-4.066895, -2.898865, 4
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
-4.416592, -3.185284, -4, 0, -0.5, 0.5, 0.5,
-4.416592, -3.185284, -4, 1, -0.5, 0.5, 0.5,
-4.416592, -3.185284, -4, 1, 1.5, 0.5, 0.5,
-4.416592, -3.185284, -4, 0, 1.5, 0.5, 0.5,
-4.416592, -3.185284, -2, 0, -0.5, 0.5, 0.5,
-4.416592, -3.185284, -2, 1, -0.5, 0.5, 0.5,
-4.416592, -3.185284, -2, 1, 1.5, 0.5, 0.5,
-4.416592, -3.185284, -2, 0, 1.5, 0.5, 0.5,
-4.416592, -3.185284, 0, 0, -0.5, 0.5, 0.5,
-4.416592, -3.185284, 0, 1, -0.5, 0.5, 0.5,
-4.416592, -3.185284, 0, 1, 1.5, 0.5, 0.5,
-4.416592, -3.185284, 0, 0, 1.5, 0.5, 0.5,
-4.416592, -3.185284, 2, 0, -0.5, 0.5, 0.5,
-4.416592, -3.185284, 2, 1, -0.5, 0.5, 0.5,
-4.416592, -3.185284, 2, 1, 1.5, 0.5, 0.5,
-4.416592, -3.185284, 2, 0, 1.5, 0.5, 0.5,
-4.416592, -3.185284, 4, 0, -0.5, 0.5, 0.5,
-4.416592, -3.185284, 4, 1, -0.5, 0.5, 0.5,
-4.416592, -3.185284, 4, 1, 1.5, 0.5, 0.5,
-4.416592, -3.185284, 4, 0, 1.5, 0.5, 0.5
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
-3.892047, -2.755656, -5.266386,
-3.892047, 2.972721, -5.266386,
-3.892047, -2.755656, 5.728928,
-3.892047, 2.972721, 5.728928,
-3.892047, -2.755656, -5.266386,
-3.892047, -2.755656, 5.728928,
-3.892047, 2.972721, -5.266386,
-3.892047, 2.972721, 5.728928,
-3.892047, -2.755656, -5.266386,
3.101878, -2.755656, -5.266386,
-3.892047, -2.755656, 5.728928,
3.101878, -2.755656, 5.728928,
-3.892047, 2.972721, -5.266386,
3.101878, 2.972721, -5.266386,
-3.892047, 2.972721, 5.728928,
3.101878, 2.972721, 5.728928,
3.101878, -2.755656, -5.266386,
3.101878, 2.972721, -5.266386,
3.101878, -2.755656, 5.728928,
3.101878, 2.972721, 5.728928,
3.101878, -2.755656, -5.266386,
3.101878, -2.755656, 5.728928,
3.101878, 2.972721, -5.266386,
3.101878, 2.972721, 5.728928
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
var radius = 7.601045;
var distance = 33.81791;
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
mvMatrix.translate( 0.3950844, -0.1085324, -0.2312713 );
mvMatrix.scale( 1.175077, 1.434682, 0.7474455 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.81791);
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
sec-butylamine_2-but<-read.table("sec-butylamine_2-but.xyz")
```

```
## Error in read.table("sec-butylamine_2-but.xyz"): no lines available in input
```

```r
x<-sec-butylamine_2-but$V2
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
```

```r
y<-sec-butylamine_2-but$V3
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
```

```r
z<-sec-butylamine_2-but$V4
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
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
-3.790194, 1.001223, -1.361766, 0, 0, 1, 1, 1,
-3.694051, 1.443224, 1.064398, 1, 0, 0, 1, 1,
-3.238466, -1.279593, -3.16415, 1, 0, 0, 1, 1,
-3.039544, -0.4886103, -1.196749, 1, 0, 0, 1, 1,
-2.720985, 1.020687, -0.4213123, 1, 0, 0, 1, 1,
-2.665503, -0.1840145, -1.337098, 1, 0, 0, 1, 1,
-2.591267, -0.1541061, -2.283251, 0, 0, 0, 1, 1,
-2.491447, 0.8354934, -0.9435713, 0, 0, 0, 1, 1,
-2.343703, -0.6244943, -1.537156, 0, 0, 0, 1, 1,
-2.320957, -1.039841, -2.524832, 0, 0, 0, 1, 1,
-2.30968, 1.765059, -1.555168, 0, 0, 0, 1, 1,
-2.289108, -1.689032, -3.085671, 0, 0, 0, 1, 1,
-2.277458, -0.7424955, -1.000866, 0, 0, 0, 1, 1,
-2.267569, 0.3476944, -0.6650213, 1, 1, 1, 1, 1,
-2.181359, -0.8580341, -1.854741, 1, 1, 1, 1, 1,
-2.15117, 0.03426471, -0.414425, 1, 1, 1, 1, 1,
-2.145226, 0.3956831, -1.904962, 1, 1, 1, 1, 1,
-2.109319, 0.09884746, -1.163848, 1, 1, 1, 1, 1,
-2.108399, -1.394625, -3.375848, 1, 1, 1, 1, 1,
-2.09832, -1.261345, -1.99558, 1, 1, 1, 1, 1,
-2.062377, 1.006517, -1.219185, 1, 1, 1, 1, 1,
-2.052631, 1.377759, -1.899769, 1, 1, 1, 1, 1,
-2.050505, 0.3791455, -0.6116972, 1, 1, 1, 1, 1,
-2.049226, -0.4647722, -0.6216593, 1, 1, 1, 1, 1,
-2.019189, 1.317458, -1.96624, 1, 1, 1, 1, 1,
-2.019027, 0.6555857, -0.3326859, 1, 1, 1, 1, 1,
-2.016248, -0.5179656, -1.268962, 1, 1, 1, 1, 1,
-2.014056, -0.3686429, -1.734302, 1, 1, 1, 1, 1,
-2.002165, 2.889298, -0.3220872, 0, 0, 1, 1, 1,
-1.98146, -0.8146467, -2.473262, 1, 0, 0, 1, 1,
-1.964896, -0.7548141, -1.464277, 1, 0, 0, 1, 1,
-1.948706, 0.7570107, -1.299746, 1, 0, 0, 1, 1,
-1.930217, 0.4284824, -0.5857692, 1, 0, 0, 1, 1,
-1.917049, 0.1509955, -1.929524, 1, 0, 0, 1, 1,
-1.916248, -0.06210899, -1.484111, 0, 0, 0, 1, 1,
-1.884168, -1.062628, -3.272332, 0, 0, 0, 1, 1,
-1.834299, 1.176622, 0.1550129, 0, 0, 0, 1, 1,
-1.810778, 0.7470399, -1.282934, 0, 0, 0, 1, 1,
-1.805519, 0.4599148, -1.702904, 0, 0, 0, 1, 1,
-1.785901, 0.9839119, -2.216443, 0, 0, 0, 1, 1,
-1.778445, -0.4338516, -1.892575, 0, 0, 0, 1, 1,
-1.77672, 0.4923879, 0.06172441, 1, 1, 1, 1, 1,
-1.760808, 0.4984143, -1.493386, 1, 1, 1, 1, 1,
-1.743446, 0.3007028, 0.4903829, 1, 1, 1, 1, 1,
-1.738981, 0.2702465, -2.189212, 1, 1, 1, 1, 1,
-1.72441, 1.040787, -1.824656, 1, 1, 1, 1, 1,
-1.717357, 0.7132052, -2.314926, 1, 1, 1, 1, 1,
-1.697785, 1.872648, -2.490144, 1, 1, 1, 1, 1,
-1.690304, -0.1432339, -2.916276, 1, 1, 1, 1, 1,
-1.686655, 1.88666, -1.488249, 1, 1, 1, 1, 1,
-1.671783, -0.4357968, -1.578467, 1, 1, 1, 1, 1,
-1.670499, 1.882677, -0.804621, 1, 1, 1, 1, 1,
-1.669729, 0.2867241, -1.881118, 1, 1, 1, 1, 1,
-1.660844, 0.3125479, -2.376196, 1, 1, 1, 1, 1,
-1.658539, 0.1482629, -3.788568, 1, 1, 1, 1, 1,
-1.656183, -0.2261937, -2.581045, 1, 1, 1, 1, 1,
-1.616082, -0.3795842, -0.3245506, 0, 0, 1, 1, 1,
-1.615613, -0.5106856, -0.8932028, 1, 0, 0, 1, 1,
-1.612577, -1.298103, -3.933355, 1, 0, 0, 1, 1,
-1.611301, 0.3226242, -0.2399147, 1, 0, 0, 1, 1,
-1.608968, 1.068944, -0.7406501, 1, 0, 0, 1, 1,
-1.601135, 0.6522947, -2.569854, 1, 0, 0, 1, 1,
-1.576365, 1.791363, 0.2285603, 0, 0, 0, 1, 1,
-1.576274, -0.2007933, -0.118618, 0, 0, 0, 1, 1,
-1.564111, 0.3873906, -1.505206, 0, 0, 0, 1, 1,
-1.554217, -0.04162022, -1.527492, 0, 0, 0, 1, 1,
-1.553125, 0.1317717, -2.41441, 0, 0, 0, 1, 1,
-1.548202, 0.4449823, -0.9080738, 0, 0, 0, 1, 1,
-1.541178, 0.2043241, -0.8260319, 0, 0, 0, 1, 1,
-1.540233, -0.3668512, 0.5829052, 1, 1, 1, 1, 1,
-1.536831, 0.1043225, -0.9865409, 1, 1, 1, 1, 1,
-1.52776, 0.6946179, -1.595596, 1, 1, 1, 1, 1,
-1.5188, -0.401033, -1.993672, 1, 1, 1, 1, 1,
-1.500839, 0.3012393, -1.395228, 1, 1, 1, 1, 1,
-1.498302, 1.347815, -1.666452, 1, 1, 1, 1, 1,
-1.492462, -0.5767482, -0.8323984, 1, 1, 1, 1, 1,
-1.483214, 1.610527, -1.418872, 1, 1, 1, 1, 1,
-1.482056, -1.271728, -1.783802, 1, 1, 1, 1, 1,
-1.482038, 0.420205, -2.065284, 1, 1, 1, 1, 1,
-1.479938, -0.4119666, -1.629705, 1, 1, 1, 1, 1,
-1.466508, -0.3061872, -2.431182, 1, 1, 1, 1, 1,
-1.463315, -0.4390479, -3.849012, 1, 1, 1, 1, 1,
-1.458134, 0.0185645, 0.4589243, 1, 1, 1, 1, 1,
-1.439549, 0.3787629, -1.467145, 1, 1, 1, 1, 1,
-1.438044, -0.8273987, -4.016501, 0, 0, 1, 1, 1,
-1.435699, -0.3490634, -2.277843, 1, 0, 0, 1, 1,
-1.43507, 1.135249, 0.06470571, 1, 0, 0, 1, 1,
-1.430252, 0.3396759, -2.521916, 1, 0, 0, 1, 1,
-1.420168, -2.143516, -2.269208, 1, 0, 0, 1, 1,
-1.419811, -0.501828, -1.361068, 1, 0, 0, 1, 1,
-1.416326, 0.6631636, -2.249887, 0, 0, 0, 1, 1,
-1.4127, -0.5417389, -0.7931737, 0, 0, 0, 1, 1,
-1.406146, -1.502259, -3.523767, 0, 0, 0, 1, 1,
-1.405481, 1.223281, 0.4662068, 0, 0, 0, 1, 1,
-1.399733, 1.306454, 1.906582, 0, 0, 0, 1, 1,
-1.398731, 0.5434845, -1.412534, 0, 0, 0, 1, 1,
-1.381942, -0.7942748, -3.996169, 0, 0, 0, 1, 1,
-1.378878, 1.538826, -0.3586558, 1, 1, 1, 1, 1,
-1.373304, 1.612066, -1.680248, 1, 1, 1, 1, 1,
-1.362689, -0.114153, -1.518998, 1, 1, 1, 1, 1,
-1.360759, -1.744788, -2.263552, 1, 1, 1, 1, 1,
-1.360727, 1.365433, 0.2616937, 1, 1, 1, 1, 1,
-1.357504, -0.7762473, -0.2659713, 1, 1, 1, 1, 1,
-1.348935, 0.006048298, -1.138043, 1, 1, 1, 1, 1,
-1.346509, 0.7158099, -0.4878683, 1, 1, 1, 1, 1,
-1.345191, 1.282035, -0.7020813, 1, 1, 1, 1, 1,
-1.343766, -0.09216173, 0.1238243, 1, 1, 1, 1, 1,
-1.338481, 0.2949361, -2.87924, 1, 1, 1, 1, 1,
-1.337787, -0.4259362, -0.3825217, 1, 1, 1, 1, 1,
-1.335423, 0.0719087, -1.436183, 1, 1, 1, 1, 1,
-1.334662, 0.1698656, -2.171772, 1, 1, 1, 1, 1,
-1.326562, 0.5516987, -1.589053, 1, 1, 1, 1, 1,
-1.316305, 0.2045696, -1.984268, 0, 0, 1, 1, 1,
-1.31443, 0.4681016, -2.003604, 1, 0, 0, 1, 1,
-1.300954, -0.07677563, -1.239259, 1, 0, 0, 1, 1,
-1.297371, 0.3717257, 0.01653271, 1, 0, 0, 1, 1,
-1.290104, 1.283205, -0.4559565, 1, 0, 0, 1, 1,
-1.286781, 0.8269837, -2.145023, 1, 0, 0, 1, 1,
-1.280606, 0.668287, 1.245771, 0, 0, 0, 1, 1,
-1.27866, -0.6261173, -2.505974, 0, 0, 0, 1, 1,
-1.27656, -0.1329827, -0.3358454, 0, 0, 0, 1, 1,
-1.273843, -0.7657725, -1.662312, 0, 0, 0, 1, 1,
-1.256397, -1.467644, -2.628563, 0, 0, 0, 1, 1,
-1.249588, -0.6806503, -3.397699, 0, 0, 0, 1, 1,
-1.241774, -2.16236, -0.8752593, 0, 0, 0, 1, 1,
-1.237744, -0.1455599, -0.04005081, 1, 1, 1, 1, 1,
-1.235907, -0.1961668, -1.668587, 1, 1, 1, 1, 1,
-1.23495, -1.598666, -4.285153, 1, 1, 1, 1, 1,
-1.234364, 1.010751, 0.209686, 1, 1, 1, 1, 1,
-1.227974, -2.263085, -3.767895, 1, 1, 1, 1, 1,
-1.221058, 0.04849894, 0.777694, 1, 1, 1, 1, 1,
-1.214828, -1.067161, -3.255948, 1, 1, 1, 1, 1,
-1.212482, 0.7225159, -1.049371, 1, 1, 1, 1, 1,
-1.210179, 1.268553, -1.165477, 1, 1, 1, 1, 1,
-1.188204, 0.3368377, -1.460408, 1, 1, 1, 1, 1,
-1.179105, 0.07628212, 0.726653, 1, 1, 1, 1, 1,
-1.175104, 1.924907, -0.1500629, 1, 1, 1, 1, 1,
-1.172477, -0.1528453, -3.99912, 1, 1, 1, 1, 1,
-1.172452, -0.7533157, -1.69101, 1, 1, 1, 1, 1,
-1.16068, 0.1960789, -2.277022, 1, 1, 1, 1, 1,
-1.157915, 2.186436, -0.5616979, 0, 0, 1, 1, 1,
-1.156581, -1.836403, -1.759082, 1, 0, 0, 1, 1,
-1.156522, 0.7546292, -1.451769, 1, 0, 0, 1, 1,
-1.156005, -1.346624, -2.113776, 1, 0, 0, 1, 1,
-1.155197, -1.305257, -3.112997, 1, 0, 0, 1, 1,
-1.148678, -0.9926494, -2.617115, 1, 0, 0, 1, 1,
-1.142365, 0.1479145, -2.362381, 0, 0, 0, 1, 1,
-1.13825, 0.4071302, -1.172438, 0, 0, 0, 1, 1,
-1.134805, 0.5596504, 0.0575881, 0, 0, 0, 1, 1,
-1.127892, -0.1588653, -2.76877, 0, 0, 0, 1, 1,
-1.121313, -0.7152624, -1.471354, 0, 0, 0, 1, 1,
-1.109119, -0.6970422, -1.382903, 0, 0, 0, 1, 1,
-1.108728, -0.6305808, -3.270089, 0, 0, 0, 1, 1,
-1.098983, 0.4421132, -0.1160692, 1, 1, 1, 1, 1,
-1.095918, -0.402919, -1.911379, 1, 1, 1, 1, 1,
-1.089267, -1.391332, -2.450331, 1, 1, 1, 1, 1,
-1.087752, 1.345976, -0.8159661, 1, 1, 1, 1, 1,
-1.086849, -0.6001849, -2.221601, 1, 1, 1, 1, 1,
-1.086677, -0.5187266, -3.997512, 1, 1, 1, 1, 1,
-1.086668, 0.2822378, -1.082712, 1, 1, 1, 1, 1,
-1.08444, -0.2946393, -2.53883, 1, 1, 1, 1, 1,
-1.081041, 0.347711, -0.02594572, 1, 1, 1, 1, 1,
-1.075453, 0.3978161, -1.514861, 1, 1, 1, 1, 1,
-1.070255, 0.5324653, -2.764036, 1, 1, 1, 1, 1,
-1.06524, 0.2360542, -0.1264748, 1, 1, 1, 1, 1,
-1.065028, 1.247534, -1.885154, 1, 1, 1, 1, 1,
-1.063015, 0.9016864, -1.120562, 1, 1, 1, 1, 1,
-1.060341, 0.5865698, -0.145381, 1, 1, 1, 1, 1,
-1.059202, 1.519949, -0.9860502, 0, 0, 1, 1, 1,
-1.053866, -0.5205904, -1.121408, 1, 0, 0, 1, 1,
-1.047403, 1.015867, -1.311971, 1, 0, 0, 1, 1,
-1.044673, 0.1951899, -0.07668426, 1, 0, 0, 1, 1,
-1.044638, -0.4368164, -0.6845422, 1, 0, 0, 1, 1,
-1.039396, 0.3052386, -1.605696, 1, 0, 0, 1, 1,
-1.036859, 0.3045045, 1.044703, 0, 0, 0, 1, 1,
-1.026646, 0.412477, -0.8200426, 0, 0, 0, 1, 1,
-1.022825, 0.4242007, -1.442848, 0, 0, 0, 1, 1,
-1.014574, 0.6875594, 0.3328983, 0, 0, 0, 1, 1,
-1.013614, -0.2114988, -2.732821, 0, 0, 0, 1, 1,
-1.012777, -0.2966921, -1.133651, 0, 0, 0, 1, 1,
-1.008327, 1.033419, 1.284324, 0, 0, 0, 1, 1,
-1.005988, -1.293059, -1.578183, 1, 1, 1, 1, 1,
-1.003999, 1.625985, -1.140395, 1, 1, 1, 1, 1,
-0.9978699, -0.4289236, -2.181967, 1, 1, 1, 1, 1,
-0.9916556, 1.423667, 1.434487, 1, 1, 1, 1, 1,
-0.9844888, 1.57543, -1.943178, 1, 1, 1, 1, 1,
-0.9820754, 0.08793791, -1.186377, 1, 1, 1, 1, 1,
-0.9798552, 0.6739581, -2.007711, 1, 1, 1, 1, 1,
-0.977307, -1.694778, -3.256366, 1, 1, 1, 1, 1,
-0.9765846, -0.9824172, -2.682349, 1, 1, 1, 1, 1,
-0.9764299, 0.9082859, -1.585843, 1, 1, 1, 1, 1,
-0.9745025, -0.2166283, -1.770406, 1, 1, 1, 1, 1,
-0.9742749, 0.1332487, 0.2009755, 1, 1, 1, 1, 1,
-0.9736007, 0.3204632, -1.25165, 1, 1, 1, 1, 1,
-0.9728859, -0.6472048, -3.344897, 1, 1, 1, 1, 1,
-0.9722561, 0.2840165, -1.414415, 1, 1, 1, 1, 1,
-0.9708549, -0.5784662, -2.621299, 0, 0, 1, 1, 1,
-0.9581229, 0.5442375, 0.5255963, 1, 0, 0, 1, 1,
-0.9560862, 0.5172229, -0.6457391, 1, 0, 0, 1, 1,
-0.9540639, -0.1454372, -2.087816, 1, 0, 0, 1, 1,
-0.9497691, -0.3442092, -1.987323, 1, 0, 0, 1, 1,
-0.9491786, -0.9373881, -3.677028, 1, 0, 0, 1, 1,
-0.9328414, 0.7834393, -3.23057, 0, 0, 0, 1, 1,
-0.913846, 1.523098, -1.876856, 0, 0, 0, 1, 1,
-0.912016, -0.5604113, -1.627178, 0, 0, 0, 1, 1,
-0.9097089, 0.3139056, -1.614323, 0, 0, 0, 1, 1,
-0.9081017, -0.5917355, -1.681591, 0, 0, 0, 1, 1,
-0.9080043, 0.6882474, -0.7625275, 0, 0, 0, 1, 1,
-0.9032279, 0.5543448, -0.6502487, 0, 0, 0, 1, 1,
-0.899535, 0.4651163, -0.3280246, 1, 1, 1, 1, 1,
-0.8965733, -0.07725508, -1.595883, 1, 1, 1, 1, 1,
-0.8720231, -0.3935282, -1.996796, 1, 1, 1, 1, 1,
-0.8705212, -0.2495953, -1.880025, 1, 1, 1, 1, 1,
-0.869556, 0.4324091, -0.6378827, 1, 1, 1, 1, 1,
-0.868789, -0.6096989, -0.02745757, 1, 1, 1, 1, 1,
-0.8493255, 0.9380804, -0.3043152, 1, 1, 1, 1, 1,
-0.8475077, -0.394255, -2.603018, 1, 1, 1, 1, 1,
-0.8465233, 0.04782316, -1.84764, 1, 1, 1, 1, 1,
-0.8362128, 1.2678, 0.1147028, 1, 1, 1, 1, 1,
-0.8320045, 1.85189, 0.7524062, 1, 1, 1, 1, 1,
-0.8282161, 1.587519, 0.6456569, 1, 1, 1, 1, 1,
-0.8232517, -0.2833884, -1.778283, 1, 1, 1, 1, 1,
-0.8216972, -0.1324315, -3.17633, 1, 1, 1, 1, 1,
-0.8194018, 1.196378, -0.669513, 1, 1, 1, 1, 1,
-0.8048207, 0.08423535, -1.966709, 0, 0, 1, 1, 1,
-0.7994525, -0.496031, -0.560488, 1, 0, 0, 1, 1,
-0.7978508, -0.7418038, -2.35083, 1, 0, 0, 1, 1,
-0.7919339, -0.3883012, -1.004463, 1, 0, 0, 1, 1,
-0.7917806, 0.3421897, -1.120924, 1, 0, 0, 1, 1,
-0.7841095, 0.8935882, 0.291375, 1, 0, 0, 1, 1,
-0.771564, -1.222226, -2.143381, 0, 0, 0, 1, 1,
-0.7600318, -1.239954, -3.414502, 0, 0, 0, 1, 1,
-0.7586316, 0.3276056, -3.490603, 0, 0, 0, 1, 1,
-0.7511581, -2.364113, -3.627405, 0, 0, 0, 1, 1,
-0.7483618, -0.8458911, -2.656942, 0, 0, 0, 1, 1,
-0.7433313, -1.091737, -1.872745, 0, 0, 0, 1, 1,
-0.7429998, 1.51276, 1.044368, 0, 0, 0, 1, 1,
-0.7365013, 0.03976237, -1.500592, 1, 1, 1, 1, 1,
-0.7360811, 0.1668272, -1.662489, 1, 1, 1, 1, 1,
-0.7292347, -1.107302, -4.410627, 1, 1, 1, 1, 1,
-0.7265645, 0.4171662, -2.095958, 1, 1, 1, 1, 1,
-0.725849, -1.338184, -2.355383, 1, 1, 1, 1, 1,
-0.723407, 0.1100892, -1.708191, 1, 1, 1, 1, 1,
-0.7202683, 0.2418461, -1.566288, 1, 1, 1, 1, 1,
-0.7170105, 0.2014636, -2.159216, 1, 1, 1, 1, 1,
-0.7138744, -1.239778, -1.263831, 1, 1, 1, 1, 1,
-0.7119201, -0.2245223, -3.604509, 1, 1, 1, 1, 1,
-0.7083286, -0.6899068, -3.745086, 1, 1, 1, 1, 1,
-0.7062786, -0.1282426, -3.058211, 1, 1, 1, 1, 1,
-0.705844, -0.17638, -1.380912, 1, 1, 1, 1, 1,
-0.7058013, -0.8445292, -2.583106, 1, 1, 1, 1, 1,
-0.7010195, -0.1959468, -0.4080256, 1, 1, 1, 1, 1,
-0.6932808, 0.3328922, -1.029607, 0, 0, 1, 1, 1,
-0.6897299, 0.9250907, 0.1965618, 1, 0, 0, 1, 1,
-0.6855572, 0.9682016, -0.3376676, 1, 0, 0, 1, 1,
-0.6831082, -0.6721851, -2.25476, 1, 0, 0, 1, 1,
-0.6778262, -2.281831, -0.8196837, 1, 0, 0, 1, 1,
-0.6756528, -0.9197659, -1.551418, 1, 0, 0, 1, 1,
-0.6672347, 1.9737, 1.072131, 0, 0, 0, 1, 1,
-0.6589629, 0.944639, -0.380385, 0, 0, 0, 1, 1,
-0.658723, 0.7951474, -1.215559, 0, 0, 0, 1, 1,
-0.657676, -0.0456675, -1.003861, 0, 0, 0, 1, 1,
-0.6509739, -1.073979, -0.6485255, 0, 0, 0, 1, 1,
-0.6492587, -0.7314118, -2.020288, 0, 0, 0, 1, 1,
-0.6484206, 0.7822471, -1.594468, 0, 0, 0, 1, 1,
-0.6411627, -1.566751, -3.600504, 1, 1, 1, 1, 1,
-0.6389262, -2.04583, -1.954342, 1, 1, 1, 1, 1,
-0.6389058, -0.9411734, -2.232882, 1, 1, 1, 1, 1,
-0.6245441, -0.2286878, -2.611259, 1, 1, 1, 1, 1,
-0.6236634, -0.04234987, -0.8820425, 1, 1, 1, 1, 1,
-0.6226776, -0.451819, -2.005335, 1, 1, 1, 1, 1,
-0.620527, 1.172333, 0.1868953, 1, 1, 1, 1, 1,
-0.6189092, -1.256794, -1.622896, 1, 1, 1, 1, 1,
-0.6186668, 0.4497605, 1.294614, 1, 1, 1, 1, 1,
-0.618243, -0.6530923, -1.97254, 1, 1, 1, 1, 1,
-0.6146227, -0.9279777, -3.574491, 1, 1, 1, 1, 1,
-0.614043, -1.99171, -2.259793, 1, 1, 1, 1, 1,
-0.6065128, 0.02603711, -0.8223658, 1, 1, 1, 1, 1,
-0.600958, 0.9225247, 0.08812954, 1, 1, 1, 1, 1,
-0.5986804, -0.354741, -0.1172325, 1, 1, 1, 1, 1,
-0.598402, 0.663386, -0.4037277, 0, 0, 1, 1, 1,
-0.5945527, -0.8513439, -2.025831, 1, 0, 0, 1, 1,
-0.5945416, -0.04569116, 0.9253089, 1, 0, 0, 1, 1,
-0.5907454, -0.4831598, -3.217464, 1, 0, 0, 1, 1,
-0.586386, 1.62269, 0.7525808, 1, 0, 0, 1, 1,
-0.5839324, -0.4235236, -0.06501815, 1, 0, 0, 1, 1,
-0.5821603, -1.89542, -2.245806, 0, 0, 0, 1, 1,
-0.5815693, -1.240709, -3.390199, 0, 0, 0, 1, 1,
-0.5785161, -0.4605539, -0.5892605, 0, 0, 0, 1, 1,
-0.5782819, -0.5801255, -1.16952, 0, 0, 0, 1, 1,
-0.573563, 0.8690374, 0.6837569, 0, 0, 0, 1, 1,
-0.5726376, 1.051228, -0.1470645, 0, 0, 0, 1, 1,
-0.5692943, -0.6241649, -2.414449, 0, 0, 0, 1, 1,
-0.5690399, 0.06965221, -2.132532, 1, 1, 1, 1, 1,
-0.5676984, 2.645199, -1.465312, 1, 1, 1, 1, 1,
-0.5667174, -0.128531, -2.980047, 1, 1, 1, 1, 1,
-0.557048, -0.5678904, -5.10626, 1, 1, 1, 1, 1,
-0.5497525, -0.05219247, -3.032866, 1, 1, 1, 1, 1,
-0.5485575, -0.2165368, -1.73184, 1, 1, 1, 1, 1,
-0.5447868, 1.155549, -1.270196, 1, 1, 1, 1, 1,
-0.5439063, 1.962473, -1.691236, 1, 1, 1, 1, 1,
-0.5409638, -0.2599805, -2.147007, 1, 1, 1, 1, 1,
-0.5395185, -0.7657372, -1.448898, 1, 1, 1, 1, 1,
-0.5394205, 0.03979844, -2.155065, 1, 1, 1, 1, 1,
-0.5352895, 0.1655672, -1.968482, 1, 1, 1, 1, 1,
-0.5329616, 2.247245, -2.265135, 1, 1, 1, 1, 1,
-0.5327528, 0.1482832, -0.9417854, 1, 1, 1, 1, 1,
-0.5318, 0.01548, -0.03166934, 1, 1, 1, 1, 1,
-0.5308294, -0.3441293, -2.666511, 0, 0, 1, 1, 1,
-0.5292084, -0.03217328, -1.225497, 1, 0, 0, 1, 1,
-0.5230035, 0.7285864, -0.7843184, 1, 0, 0, 1, 1,
-0.5206667, -0.01580267, -0.6282798, 1, 0, 0, 1, 1,
-0.5187414, 0.8145068, -1.689149, 1, 0, 0, 1, 1,
-0.5186371, -0.4897378, -2.684733, 1, 0, 0, 1, 1,
-0.5183459, 0.9947035, -1.161359, 0, 0, 0, 1, 1,
-0.5179688, 1.72884, -1.388436, 0, 0, 0, 1, 1,
-0.5174928, -0.346425, -3.552161, 0, 0, 0, 1, 1,
-0.5151421, -1.279336, -3.563576, 0, 0, 0, 1, 1,
-0.5146474, -0.5819064, -1.163624, 0, 0, 0, 1, 1,
-0.5106422, 1.100818, 0.2125725, 0, 0, 0, 1, 1,
-0.5085186, 0.2967591, -2.006978, 0, 0, 0, 1, 1,
-0.507636, -0.4923347, -0.730368, 1, 1, 1, 1, 1,
-0.5051178, 0.3430614, -1.450238, 1, 1, 1, 1, 1,
-0.4978679, 1.903654, -0.3793078, 1, 1, 1, 1, 1,
-0.4972806, 0.9850705, 1.527414, 1, 1, 1, 1, 1,
-0.4963834, 0.001701082, -1.627227, 1, 1, 1, 1, 1,
-0.4949245, 1.364092, -1.542295, 1, 1, 1, 1, 1,
-0.4903827, -0.3069471, -2.894263, 1, 1, 1, 1, 1,
-0.4867397, -1.46791, -4.433428, 1, 1, 1, 1, 1,
-0.4836145, 1.007815, 0.6901872, 1, 1, 1, 1, 1,
-0.48306, -0.4398183, -2.66609, 1, 1, 1, 1, 1,
-0.4821908, 0.04509465, -2.006726, 1, 1, 1, 1, 1,
-0.4821615, 1.658586, -0.2362089, 1, 1, 1, 1, 1,
-0.4802336, -0.9138213, -2.832054, 1, 1, 1, 1, 1,
-0.4735411, 1.338211, -0.8739374, 1, 1, 1, 1, 1,
-0.4599623, 1.605817, -2.395858, 1, 1, 1, 1, 1,
-0.4594069, -0.8753748, -1.619514, 0, 0, 1, 1, 1,
-0.4472391, -0.3852272, -2.052227, 1, 0, 0, 1, 1,
-0.446734, 0.2553411, -0.6729533, 1, 0, 0, 1, 1,
-0.4450239, -0.7337812, -2.406616, 1, 0, 0, 1, 1,
-0.4444195, 0.2108372, -0.6402268, 1, 0, 0, 1, 1,
-0.4439341, 0.6266338, 0.06445191, 1, 0, 0, 1, 1,
-0.4416733, 0.5834232, -0.5864348, 0, 0, 0, 1, 1,
-0.4398148, -0.1843157, -2.028503, 0, 0, 0, 1, 1,
-0.4369663, 1.199719, -0.6295981, 0, 0, 0, 1, 1,
-0.4344105, -1.27763, -1.60094, 0, 0, 0, 1, 1,
-0.4342975, 0.7440323, -2.344758, 0, 0, 0, 1, 1,
-0.4340479, -0.1866908, -3.165892, 0, 0, 0, 1, 1,
-0.4336472, -0.8999428, -1.973002, 0, 0, 0, 1, 1,
-0.4314301, 0.07406366, -3.606625, 1, 1, 1, 1, 1,
-0.4304387, 0.3510728, -1.888118, 1, 1, 1, 1, 1,
-0.4280367, 1.151692, -0.5670635, 1, 1, 1, 1, 1,
-0.4237694, 0.09336367, -1.477909, 1, 1, 1, 1, 1,
-0.417362, -1.032125, -3.044293, 1, 1, 1, 1, 1,
-0.4110183, -0.3588002, -2.653184, 1, 1, 1, 1, 1,
-0.4097497, 0.5840451, -0.8371915, 1, 1, 1, 1, 1,
-0.4083896, -1.403161, -3.562356, 1, 1, 1, 1, 1,
-0.4020892, 0.4542691, -1.977392, 1, 1, 1, 1, 1,
-0.4013414, -1.85368, -3.232208, 1, 1, 1, 1, 1,
-0.3989232, -0.2910136, -3.035236, 1, 1, 1, 1, 1,
-0.3946767, 1.351168, -1.968743, 1, 1, 1, 1, 1,
-0.3916922, 1.190895, 0.7387175, 1, 1, 1, 1, 1,
-0.3776298, -0.7100647, -2.037457, 1, 1, 1, 1, 1,
-0.3726369, 0.5640894, -1.316994, 1, 1, 1, 1, 1,
-0.3680934, 1.021138, -0.5981185, 0, 0, 1, 1, 1,
-0.3677974, -0.2034756, -1.432591, 1, 0, 0, 1, 1,
-0.3662346, -0.8688811, -2.853448, 1, 0, 0, 1, 1,
-0.3649358, -0.3565613, -2.941662, 1, 0, 0, 1, 1,
-0.3615743, -0.02979575, -2.807066, 1, 0, 0, 1, 1,
-0.3604897, 1.825558, 0.4810345, 1, 0, 0, 1, 1,
-0.360448, -0.4895736, -1.908874, 0, 0, 0, 1, 1,
-0.3465644, -0.5402655, -2.047339, 0, 0, 0, 1, 1,
-0.3413512, -2.385668, -4.466366, 0, 0, 0, 1, 1,
-0.3379226, -0.03003081, -0.6049029, 0, 0, 0, 1, 1,
-0.3343275, 0.2157453, -1.197457, 0, 0, 0, 1, 1,
-0.331026, 1.716167, -0.3669698, 0, 0, 0, 1, 1,
-0.3285689, 1.91027, 1.68895, 0, 0, 0, 1, 1,
-0.327955, 1.615891, 0.1021541, 1, 1, 1, 1, 1,
-0.3255564, -0.2465861, -2.273292, 1, 1, 1, 1, 1,
-0.3239217, 0.2328165, -2.24079, 1, 1, 1, 1, 1,
-0.3222089, -0.04250202, -1.5307, 1, 1, 1, 1, 1,
-0.3203719, 0.6341588, -1.298585, 1, 1, 1, 1, 1,
-0.3172157, 0.4404497, -0.1683473, 1, 1, 1, 1, 1,
-0.3113042, -0.7904505, -1.357612, 1, 1, 1, 1, 1,
-0.3102887, -1.056576, -1.630777, 1, 1, 1, 1, 1,
-0.3100358, 0.02006878, -2.546087, 1, 1, 1, 1, 1,
-0.3076787, 0.3318716, -0.6546371, 1, 1, 1, 1, 1,
-0.3076176, -0.3700692, -3.041453, 1, 1, 1, 1, 1,
-0.3067743, -0.4229767, -1.100539, 1, 1, 1, 1, 1,
-0.3049212, -2.354916, -3.01422, 1, 1, 1, 1, 1,
-0.302505, -0.04708252, -1.158995, 1, 1, 1, 1, 1,
-0.3011388, -1.371176, -2.189021, 1, 1, 1, 1, 1,
-0.2933787, -0.06125876, -1.940933, 0, 0, 1, 1, 1,
-0.2887273, 0.9251661, 1.436442, 1, 0, 0, 1, 1,
-0.285118, -1.393381, -2.460511, 1, 0, 0, 1, 1,
-0.283646, -1.395547, -3.416325, 1, 0, 0, 1, 1,
-0.2824307, 0.8292521, 0.8785082, 1, 0, 0, 1, 1,
-0.2789496, 1.506088, -0.5381606, 1, 0, 0, 1, 1,
-0.2774137, 0.9229831, 0.005720144, 0, 0, 0, 1, 1,
-0.2763598, -1.072428, -2.385901, 0, 0, 0, 1, 1,
-0.2652293, 1.4385, -0.2631223, 0, 0, 0, 1, 1,
-0.2650149, 1.645732, 0.8254604, 0, 0, 0, 1, 1,
-0.2647703, -0.1533284, -2.50206, 0, 0, 0, 1, 1,
-0.2620793, -0.7063214, -3.179476, 0, 0, 0, 1, 1,
-0.2612459, 0.5448773, -0.6467875, 0, 0, 0, 1, 1,
-0.2588264, 0.06887151, -2.156297, 1, 1, 1, 1, 1,
-0.2583822, -2.151594, -4.910702, 1, 1, 1, 1, 1,
-0.2565538, 0.4650136, 0.444602, 1, 1, 1, 1, 1,
-0.2551902, 0.8546178, 0.8212357, 1, 1, 1, 1, 1,
-0.2546957, 0.6174105, -1.560412, 1, 1, 1, 1, 1,
-0.2513728, -0.3505337, -1.893884, 1, 1, 1, 1, 1,
-0.2491232, 0.3465139, -1.184353, 1, 1, 1, 1, 1,
-0.2481805, 0.5223024, -1.610722, 1, 1, 1, 1, 1,
-0.2465825, 0.07452361, -0.5687925, 1, 1, 1, 1, 1,
-0.2465227, -1.249267, -0.3515364, 1, 1, 1, 1, 1,
-0.2427568, 1.309277, -0.4371084, 1, 1, 1, 1, 1,
-0.242605, -0.5368384, -3.236974, 1, 1, 1, 1, 1,
-0.241446, -0.6798067, -2.306789, 1, 1, 1, 1, 1,
-0.2374963, 0.6966491, 1.45325, 1, 1, 1, 1, 1,
-0.2314284, -0.2663944, -3.743692, 1, 1, 1, 1, 1,
-0.2287944, 0.7613408, -0.877775, 0, 0, 1, 1, 1,
-0.2262442, -0.5789235, -1.395772, 1, 0, 0, 1, 1,
-0.2190402, 0.07801025, 0.7932289, 1, 0, 0, 1, 1,
-0.2171044, -0.6548847, -0.3569364, 1, 0, 0, 1, 1,
-0.2135436, -0.4865394, -1.994622, 1, 0, 0, 1, 1,
-0.209699, 0.3031377, -0.4307039, 1, 0, 0, 1, 1,
-0.2079517, -0.5005825, -0.3912006, 0, 0, 0, 1, 1,
-0.1940224, -1.15866, -2.885489, 0, 0, 0, 1, 1,
-0.1899865, 0.5673741, -0.3414113, 0, 0, 0, 1, 1,
-0.187988, -0.9308257, -3.192684, 0, 0, 0, 1, 1,
-0.1879566, 1.26359, 0.1028957, 0, 0, 0, 1, 1,
-0.1870421, 0.3989166, -0.5252514, 0, 0, 0, 1, 1,
-0.1846557, 0.8172951, -0.4077109, 0, 0, 0, 1, 1,
-0.1845067, 0.2680641, -1.08275, 1, 1, 1, 1, 1,
-0.1776599, -0.1310438, -1.548912, 1, 1, 1, 1, 1,
-0.1661721, -0.0842923, -4.803462, 1, 1, 1, 1, 1,
-0.164439, 0.2090953, -1.148463, 1, 1, 1, 1, 1,
-0.1583115, -1.501605, -3.302231, 1, 1, 1, 1, 1,
-0.1552671, -0.2996334, -2.300312, 1, 1, 1, 1, 1,
-0.1542142, 0.6354815, 0.6594459, 1, 1, 1, 1, 1,
-0.1517877, 0.3638628, -0.7518142, 1, 1, 1, 1, 1,
-0.1484471, -0.01748286, -1.217395, 1, 1, 1, 1, 1,
-0.1483118, -0.06599058, -1.831477, 1, 1, 1, 1, 1,
-0.1433553, 0.182152, -1.887475, 1, 1, 1, 1, 1,
-0.1429249, -0.3368866, -3.646428, 1, 1, 1, 1, 1,
-0.1403079, -0.1540705, -1.732241, 1, 1, 1, 1, 1,
-0.1330238, 0.6302713, 0.5982699, 1, 1, 1, 1, 1,
-0.1305733, 0.2065015, -0.255188, 1, 1, 1, 1, 1,
-0.1288387, -1.310487, -3.036582, 0, 0, 1, 1, 1,
-0.1277416, 0.4599766, -1.089239, 1, 0, 0, 1, 1,
-0.1259652, -0.6901709, -4.76597, 1, 0, 0, 1, 1,
-0.1217191, -1.473606, -2.493273, 1, 0, 0, 1, 1,
-0.1195414, 0.9775976, -0.00591031, 1, 0, 0, 1, 1,
-0.1191117, 0.08625591, -1.624466, 1, 0, 0, 1, 1,
-0.1183528, 0.378401, -0.2738408, 0, 0, 0, 1, 1,
-0.1151272, -0.2735664, -1.903401, 0, 0, 0, 1, 1,
-0.1118871, -1.513754, -1.855993, 0, 0, 0, 1, 1,
-0.1070652, -0.4069849, -3.773372, 0, 0, 0, 1, 1,
-0.1003787, -0.928867, -2.597233, 0, 0, 0, 1, 1,
-0.09957842, 0.04218305, 0.770561, 0, 0, 0, 1, 1,
-0.09924021, -0.579109, -2.622841, 0, 0, 0, 1, 1,
-0.09703643, 1.064973, 0.7627827, 1, 1, 1, 1, 1,
-0.09518905, -2.253718, -2.442783, 1, 1, 1, 1, 1,
-0.09437028, -1.773625, -1.596067, 1, 1, 1, 1, 1,
-0.09428012, 2.643141, 0.3597929, 1, 1, 1, 1, 1,
-0.08784518, -0.2680508, -3.710389, 1, 1, 1, 1, 1,
-0.08506746, 0.02332244, -1.975046, 1, 1, 1, 1, 1,
-0.08356868, 0.4319916, -0.5088239, 1, 1, 1, 1, 1,
-0.08335793, 1.152775, -0.4702213, 1, 1, 1, 1, 1,
-0.08052973, -2.524786, -2.511623, 1, 1, 1, 1, 1,
-0.07970487, 1.817338, -0.5444473, 1, 1, 1, 1, 1,
-0.07365891, -1.668589, -3.274276, 1, 1, 1, 1, 1,
-0.06766615, 1.033891, -1.66992, 1, 1, 1, 1, 1,
-0.06503607, 0.03483301, 0.2230447, 1, 1, 1, 1, 1,
-0.06247807, 1.278977, -0.01349195, 1, 1, 1, 1, 1,
-0.06172686, 0.2037879, 0.6720399, 1, 1, 1, 1, 1,
-0.05867165, 1.319234, -1.214976, 0, 0, 1, 1, 1,
-0.05865961, 1.381135, -1.108802, 1, 0, 0, 1, 1,
-0.05526403, 0.2618998, -0.0177997, 1, 0, 0, 1, 1,
-0.05473322, -0.711573, -2.029293, 1, 0, 0, 1, 1,
-0.05391713, -0.1728632, -3.232395, 1, 0, 0, 1, 1,
-0.05231813, 0.2271996, -0.5771133, 1, 0, 0, 1, 1,
-0.04988635, 0.7209039, 1.258647, 0, 0, 0, 1, 1,
-0.04982491, -0.9014655, -4.157602, 0, 0, 0, 1, 1,
-0.04621603, -0.8609483, -2.860816, 0, 0, 0, 1, 1,
-0.04077947, -0.5186498, -1.547699, 0, 0, 0, 1, 1,
-0.03567837, -0.5526912, -3.846607, 0, 0, 0, 1, 1,
-0.03189895, 0.1093408, 0.05323987, 0, 0, 0, 1, 1,
-0.03120347, 0.6097038, -1.186324, 0, 0, 0, 1, 1,
-0.03094814, -1.309482, -2.197883, 1, 1, 1, 1, 1,
-0.03039834, 0.5512317, -1.103209, 1, 1, 1, 1, 1,
-0.02815379, 0.5422395, -2.502041, 1, 1, 1, 1, 1,
-0.02129011, -1.925153, -1.073834, 1, 1, 1, 1, 1,
-0.02103058, -0.3706502, -3.5587, 1, 1, 1, 1, 1,
-0.02051596, -0.5445254, -4.302755, 1, 1, 1, 1, 1,
-0.01839473, 1.219584, -0.9884348, 1, 1, 1, 1, 1,
-0.01130496, -2.529093, -4.035133, 1, 1, 1, 1, 1,
-0.00220164, -0.4867949, -5.052862, 1, 1, 1, 1, 1,
-0.0004459534, -1.052991, -4.704398, 1, 1, 1, 1, 1,
0.007949176, -1.325289, 1.859691, 1, 1, 1, 1, 1,
0.01180844, -0.08789637, 2.139757, 1, 1, 1, 1, 1,
0.01280815, -0.01035562, 1.299512, 1, 1, 1, 1, 1,
0.02124442, 0.01295139, 0.8917119, 1, 1, 1, 1, 1,
0.02568608, -0.03055311, 2.162792, 1, 1, 1, 1, 1,
0.02645386, -0.1096201, 2.100418, 0, 0, 1, 1, 1,
0.03341959, -0.5684559, 2.925016, 1, 0, 0, 1, 1,
0.04333055, -0.7985579, 2.476759, 1, 0, 0, 1, 1,
0.0442699, 2.018544, 0.5934113, 1, 0, 0, 1, 1,
0.04480438, 0.5068588, 0.06436229, 1, 0, 0, 1, 1,
0.04696375, 1.670387, -1.011054, 1, 0, 0, 1, 1,
0.04743544, 0.9178998, -1.294247, 0, 0, 0, 1, 1,
0.04820072, -0.8206265, 0.8212836, 0, 0, 0, 1, 1,
0.05894195, 0.485248, 0.8879226, 0, 0, 0, 1, 1,
0.06987204, 0.1284188, -1.434082, 0, 0, 0, 1, 1,
0.07102783, -0.3261472, 2.193721, 0, 0, 0, 1, 1,
0.07123003, 1.127193, -0.05656012, 0, 0, 0, 1, 1,
0.0748329, -0.9323009, 4.378385, 0, 0, 0, 1, 1,
0.07492816, 1.057271, -1.210022, 1, 1, 1, 1, 1,
0.07665297, 0.4302334, -1.734915, 1, 1, 1, 1, 1,
0.08080151, 0.6494756, -0.8855934, 1, 1, 1, 1, 1,
0.08152913, 1.33335, -1.382188, 1, 1, 1, 1, 1,
0.0836525, -0.8870596, 2.196486, 1, 1, 1, 1, 1,
0.08709595, -1.837594, 3.690475, 1, 1, 1, 1, 1,
0.09361697, -0.9093006, 3.657881, 1, 1, 1, 1, 1,
0.09550517, 0.1770984, 2.184712, 1, 1, 1, 1, 1,
0.09627851, 0.9950153, 0.5171351, 1, 1, 1, 1, 1,
0.1038151, 0.2246766, 1.434002, 1, 1, 1, 1, 1,
0.1098432, -0.3153166, 0.4906599, 1, 1, 1, 1, 1,
0.1106945, -1.505653, 3.5438, 1, 1, 1, 1, 1,
0.1125388, 0.124525, 0.9349076, 1, 1, 1, 1, 1,
0.1136824, -1.148459, 4.506557, 1, 1, 1, 1, 1,
0.1167879, -0.225226, 2.96813, 1, 1, 1, 1, 1,
0.1191766, -0.5311729, 4.182613, 0, 0, 1, 1, 1,
0.1208387, 0.04184178, -0.04774418, 1, 0, 0, 1, 1,
0.1209084, 0.4263978, -0.7622849, 1, 0, 0, 1, 1,
0.1213559, 0.5480103, 0.7797066, 1, 0, 0, 1, 1,
0.1216109, -0.1115928, 1.408344, 1, 0, 0, 1, 1,
0.1226671, -0.3291967, 2.050442, 1, 0, 0, 1, 1,
0.125564, -1.112465, 3.420066, 0, 0, 0, 1, 1,
0.1277774, -0.2334147, 3.397367, 0, 0, 0, 1, 1,
0.1314882, 0.7279153, -1.183794, 0, 0, 0, 1, 1,
0.1327772, 0.3844936, 0.805665, 0, 0, 0, 1, 1,
0.1346842, -0.9438513, 2.060239, 0, 0, 0, 1, 1,
0.1369499, -0.6154411, 3.261737, 0, 0, 0, 1, 1,
0.1384289, -0.9211597, 5.379765, 0, 0, 0, 1, 1,
0.1388069, -1.038282, 2.232234, 1, 1, 1, 1, 1,
0.1412288, -1.123952, 3.059679, 1, 1, 1, 1, 1,
0.1422073, -1.078759, 2.647092, 1, 1, 1, 1, 1,
0.1433336, 0.8761216, 0.1806681, 1, 1, 1, 1, 1,
0.1436886, 0.9749259, 0.07745712, 1, 1, 1, 1, 1,
0.1463568, 2.591581, 0.3006668, 1, 1, 1, 1, 1,
0.1490085, -0.1656857, 2.070587, 1, 1, 1, 1, 1,
0.1553398, 1.757892, -0.4834038, 1, 1, 1, 1, 1,
0.155626, -0.2383302, 0.4943703, 1, 1, 1, 1, 1,
0.1556996, 0.6151326, 0.4397823, 1, 1, 1, 1, 1,
0.1574368, 0.9338083, 0.06062835, 1, 1, 1, 1, 1,
0.1582007, 0.4989863, -0.4784764, 1, 1, 1, 1, 1,
0.1634812, -1.392637, 4.913271, 1, 1, 1, 1, 1,
0.1640327, 1.125639, -0.1817521, 1, 1, 1, 1, 1,
0.1740516, 0.07364701, -0.1708331, 1, 1, 1, 1, 1,
0.1748329, 0.5867429, -0.47327, 0, 0, 1, 1, 1,
0.1772409, 0.741196, 2.212205, 1, 0, 0, 1, 1,
0.1788705, 0.1110899, -0.2682786, 1, 0, 0, 1, 1,
0.1818251, -1.434146, 3.348694, 1, 0, 0, 1, 1,
0.1878175, 0.7786386, -1.040915, 1, 0, 0, 1, 1,
0.188523, 0.3133589, 0.8255999, 1, 0, 0, 1, 1,
0.1888696, 0.2377997, 1.082556, 0, 0, 0, 1, 1,
0.1896911, 1.540682, 1.66237, 0, 0, 0, 1, 1,
0.1905815, -2.081482, 2.359516, 0, 0, 0, 1, 1,
0.1909354, -0.5603229, 0.5909661, 0, 0, 0, 1, 1,
0.1949113, -0.5312667, 2.68007, 0, 0, 0, 1, 1,
0.198184, 0.4580998, 0.3560957, 0, 0, 0, 1, 1,
0.2013435, -0.1248487, 2.058772, 0, 0, 0, 1, 1,
0.2019287, 0.162118, 0.5540029, 1, 1, 1, 1, 1,
0.2029088, -0.4794036, 3.268796, 1, 1, 1, 1, 1,
0.2068338, 2.087925, -0.2502871, 1, 1, 1, 1, 1,
0.2082057, -1.252661, 0.4524844, 1, 1, 1, 1, 1,
0.210795, -0.3910533, 5.568802, 1, 1, 1, 1, 1,
0.2159548, 0.5828876, -0.5798394, 1, 1, 1, 1, 1,
0.2193676, 1.091702, 0.04266762, 1, 1, 1, 1, 1,
0.2210664, 1.339788, -1.057226, 1, 1, 1, 1, 1,
0.2279198, -1.507189, 1.850022, 1, 1, 1, 1, 1,
0.2292034, 1.49474, 0.1657838, 1, 1, 1, 1, 1,
0.2302701, 0.3785514, -0.3220175, 1, 1, 1, 1, 1,
0.2383935, 1.118828, 0.9796295, 1, 1, 1, 1, 1,
0.2405188, 0.5035989, 2.516177, 1, 1, 1, 1, 1,
0.2525119, -1.060165, 2.468528, 1, 1, 1, 1, 1,
0.2536776, 0.6883805, 1.083151, 1, 1, 1, 1, 1,
0.2557546, 0.8574312, -0.01514786, 0, 0, 1, 1, 1,
0.2579707, -0.6342495, 4.404567, 1, 0, 0, 1, 1,
0.257973, -0.7848401, 3.657477, 1, 0, 0, 1, 1,
0.2640234, -2.672233, 1.594816, 1, 0, 0, 1, 1,
0.2657991, 0.4336717, -0.3131817, 1, 0, 0, 1, 1,
0.2746418, -1.729287, 3.797417, 1, 0, 0, 1, 1,
0.2787969, 0.4001063, 1.501303, 0, 0, 0, 1, 1,
0.2794512, 1.607726, 0.2169859, 0, 0, 0, 1, 1,
0.2800122, -0.2044842, 1.682011, 0, 0, 0, 1, 1,
0.2810905, 0.5482939, 0.3356048, 0, 0, 0, 1, 1,
0.2821854, -0.8446125, 2.488266, 0, 0, 0, 1, 1,
0.2847522, -0.8107517, 3.397027, 0, 0, 0, 1, 1,
0.2890862, 1.30491, 0.09594319, 0, 0, 0, 1, 1,
0.2895766, 1.967397, 0.1460592, 1, 1, 1, 1, 1,
0.2902595, 1.265184, -1.758488, 1, 1, 1, 1, 1,
0.2917622, -0.6409263, 2.987627, 1, 1, 1, 1, 1,
0.2929495, -0.3929035, 1.852759, 1, 1, 1, 1, 1,
0.2945296, 0.2601417, 1.805631, 1, 1, 1, 1, 1,
0.2982171, 0.08791073, 0.8952652, 1, 1, 1, 1, 1,
0.2991113, 0.8058301, 0.3114381, 1, 1, 1, 1, 1,
0.3009, 0.2993837, 1.76618, 1, 1, 1, 1, 1,
0.3020614, 0.860321, 0.4934149, 1, 1, 1, 1, 1,
0.3064259, 2.087286, 0.7273952, 1, 1, 1, 1, 1,
0.3083819, 1.305424, -0.9310216, 1, 1, 1, 1, 1,
0.3095852, 0.1860576, 1.531749, 1, 1, 1, 1, 1,
0.3182997, -0.5464357, 2.663085, 1, 1, 1, 1, 1,
0.3271996, 0.3765208, -1.195268, 1, 1, 1, 1, 1,
0.3333839, -1.350546, 5.047233, 1, 1, 1, 1, 1,
0.3356875, 0.2434217, 2.049968, 0, 0, 1, 1, 1,
0.3375404, 0.8696933, 0.09466183, 1, 0, 0, 1, 1,
0.3397508, -1.862676, 1.156617, 1, 0, 0, 1, 1,
0.3423717, 0.5352483, 0.4868743, 1, 0, 0, 1, 1,
0.3487113, -0.9359198, 1.694089, 1, 0, 0, 1, 1,
0.358646, -1.181749, 3.807166, 1, 0, 0, 1, 1,
0.3596436, -0.2600511, 2.599606, 0, 0, 0, 1, 1,
0.3603674, -0.5023233, 2.374304, 0, 0, 0, 1, 1,
0.3633188, -0.2145539, 2.563446, 0, 0, 0, 1, 1,
0.3633715, 1.151284, -0.5087439, 0, 0, 0, 1, 1,
0.3638259, 0.09780194, 2.119508, 0, 0, 0, 1, 1,
0.3642607, 1.528125, -1.625111, 0, 0, 0, 1, 1,
0.3671476, 0.8441057, 1.087545, 0, 0, 0, 1, 1,
0.3693039, 1.152093, -0.04433832, 1, 1, 1, 1, 1,
0.3696527, -0.5420126, 2.430811, 1, 1, 1, 1, 1,
0.3697365, 0.2902528, 2.686663, 1, 1, 1, 1, 1,
0.3753996, 1.561737, -0.6827567, 1, 1, 1, 1, 1,
0.3775732, -1.922236, 4.017896, 1, 1, 1, 1, 1,
0.3787951, 0.09528609, 1.021845, 1, 1, 1, 1, 1,
0.3812792, 0.7563403, 0.6000336, 1, 1, 1, 1, 1,
0.3822001, 0.8406866, -1.340363, 1, 1, 1, 1, 1,
0.3858927, -0.2594676, 1.494826, 1, 1, 1, 1, 1,
0.3864131, 1.355214, -0.7601574, 1, 1, 1, 1, 1,
0.3916786, -0.3849542, 3.25915, 1, 1, 1, 1, 1,
0.3968372, -0.9486134, 2.525676, 1, 1, 1, 1, 1,
0.3997605, -0.8421247, 1.795491, 1, 1, 1, 1, 1,
0.4036839, 0.6959503, 0.0333766, 1, 1, 1, 1, 1,
0.4058924, -1.517453, 2.183257, 1, 1, 1, 1, 1,
0.4082375, 1.095939, 0.02037172, 0, 0, 1, 1, 1,
0.4106554, 0.3516684, -1.551171, 1, 0, 0, 1, 1,
0.4125121, -0.2463564, -0.05689699, 1, 0, 0, 1, 1,
0.4157169, 1.377641, -0.3667791, 1, 0, 0, 1, 1,
0.4193457, -2.350932, 3.972977, 1, 0, 0, 1, 1,
0.420786, 0.8291826, 2.060528, 1, 0, 0, 1, 1,
0.4236769, 0.3365539, 1.963042, 0, 0, 0, 1, 1,
0.4237611, -0.08079387, 1.852676, 0, 0, 0, 1, 1,
0.4239918, -0.03149947, 0.7198455, 0, 0, 0, 1, 1,
0.4249753, 1.615309, 1.233883, 0, 0, 0, 1, 1,
0.4256217, 0.2723145, 1.251761, 0, 0, 0, 1, 1,
0.4256729, -0.3370523, 2.21524, 0, 0, 0, 1, 1,
0.4296614, 1.998122, 0.6302289, 0, 0, 0, 1, 1,
0.4298322, -0.5918283, 2.386339, 1, 1, 1, 1, 1,
0.4370238, -0.3636266, 2.486092, 1, 1, 1, 1, 1,
0.4372283, 0.2673886, 2.778444, 1, 1, 1, 1, 1,
0.447092, -1.221495, 3.455091, 1, 1, 1, 1, 1,
0.4477602, -0.1868212, 2.396218, 1, 1, 1, 1, 1,
0.4514396, 0.9286575, 0.1879781, 1, 1, 1, 1, 1,
0.4514821, -1.224137, 0.7075701, 1, 1, 1, 1, 1,
0.4518079, -0.2368472, 1.103516, 1, 1, 1, 1, 1,
0.4554021, 1.273047, -2.328555, 1, 1, 1, 1, 1,
0.4559012, -1.453719, 1.221223, 1, 1, 1, 1, 1,
0.4568211, -0.4874429, 5.070168, 1, 1, 1, 1, 1,
0.4609916, 0.4662346, 0.3059124, 1, 1, 1, 1, 1,
0.4681609, 0.2464077, -0.32653, 1, 1, 1, 1, 1,
0.4696492, -0.2604772, 3.500105, 1, 1, 1, 1, 1,
0.476788, 0.8107542, 1.269346, 1, 1, 1, 1, 1,
0.4799202, 0.872667, 1.231537, 0, 0, 1, 1, 1,
0.480086, -0.6708909, 1.927049, 1, 0, 0, 1, 1,
0.4803811, 0.8601305, 1.28118, 1, 0, 0, 1, 1,
0.4824364, -0.5027426, 2.98126, 1, 0, 0, 1, 1,
0.4877186, -1.281473, 2.071502, 1, 0, 0, 1, 1,
0.4880837, 0.9625887, 2.171092, 1, 0, 0, 1, 1,
0.493174, -0.771969, 1.912895, 0, 0, 0, 1, 1,
0.4944679, 1.891691, -0.8087164, 0, 0, 0, 1, 1,
0.4982636, 1.297549, 0.01443405, 0, 0, 0, 1, 1,
0.5109087, 0.4938575, 0.4657544, 0, 0, 0, 1, 1,
0.5119302, 1.19154, -0.1371447, 0, 0, 0, 1, 1,
0.5155756, 0.07384887, 2.459065, 0, 0, 0, 1, 1,
0.5172692, 0.2356509, 1.442563, 0, 0, 0, 1, 1,
0.5242696, -0.7846844, 1.259629, 1, 1, 1, 1, 1,
0.5286514, -0.8608706, 2.868362, 1, 1, 1, 1, 1,
0.5301101, 0.2022923, -0.3346807, 1, 1, 1, 1, 1,
0.534346, 0.4394984, 0.8557217, 1, 1, 1, 1, 1,
0.5347356, -0.1129012, 2.815218, 1, 1, 1, 1, 1,
0.5365842, -0.6956743, 2.283733, 1, 1, 1, 1, 1,
0.5373829, -0.6633562, 3.613759, 1, 1, 1, 1, 1,
0.5393528, -0.09948784, -0.447597, 1, 1, 1, 1, 1,
0.5420433, -0.3601652, 3.915726, 1, 1, 1, 1, 1,
0.5501126, -0.3902735, 2.091963, 1, 1, 1, 1, 1,
0.5503402, -1.061856, 2.257342, 1, 1, 1, 1, 1,
0.55184, 1.388867, 1.746741, 1, 1, 1, 1, 1,
0.5570418, -1.190989, 3.139327, 1, 1, 1, 1, 1,
0.5580878, -0.8359867, 0.00189088, 1, 1, 1, 1, 1,
0.5639677, -1.639967, 1.702383, 1, 1, 1, 1, 1,
0.5647225, 0.896417, 0.9833686, 0, 0, 1, 1, 1,
0.5689008, 0.7070457, 1.848169, 1, 0, 0, 1, 1,
0.5713331, -1.062142, 2.558918, 1, 0, 0, 1, 1,
0.5719891, 0.4873724, 1.010707, 1, 0, 0, 1, 1,
0.5748205, 0.1172758, 3.400346, 1, 0, 0, 1, 1,
0.5756696, 0.3601375, 2.460707, 1, 0, 0, 1, 1,
0.5789641, 0.116263, 1.176317, 0, 0, 0, 1, 1,
0.5800385, 0.8635517, 0.912746, 0, 0, 0, 1, 1,
0.580135, 1.115053, 1.638752, 0, 0, 0, 1, 1,
0.5833197, 0.0895239, 1.431694, 0, 0, 0, 1, 1,
0.5879946, -1.107762, 3.358663, 0, 0, 0, 1, 1,
0.588984, 0.01045711, 1.87729, 0, 0, 0, 1, 1,
0.5906515, -0.148514, 2.062564, 0, 0, 0, 1, 1,
0.5918827, 0.03432227, 2.574844, 1, 1, 1, 1, 1,
0.6005911, -0.5716955, 2.856982, 1, 1, 1, 1, 1,
0.60638, 0.1495429, 1.32787, 1, 1, 1, 1, 1,
0.6224883, 0.7257724, 1.43529, 1, 1, 1, 1, 1,
0.6243711, 0.3827289, -0.2750957, 1, 1, 1, 1, 1,
0.6270884, 0.6924078, 1.059074, 1, 1, 1, 1, 1,
0.6337126, 0.4530138, 0.8565633, 1, 1, 1, 1, 1,
0.6378149, 0.537051, 0.7298305, 1, 1, 1, 1, 1,
0.6384709, 0.4514046, 0.9257941, 1, 1, 1, 1, 1,
0.6499817, -0.8004548, 2.968546, 1, 1, 1, 1, 1,
0.6515557, -0.2793571, 2.074477, 1, 1, 1, 1, 1,
0.6572604, 0.1720676, 0.8879513, 1, 1, 1, 1, 1,
0.6590233, -0.5659035, 1.168763, 1, 1, 1, 1, 1,
0.6623715, -2.344181, 3.426321, 1, 1, 1, 1, 1,
0.6642336, 1.035937, 0.2590637, 1, 1, 1, 1, 1,
0.6683975, 0.2346778, -0.9864327, 0, 0, 1, 1, 1,
0.6693762, -0.2123779, 0.7739986, 1, 0, 0, 1, 1,
0.6736274, -2.475966, 1.475488, 1, 0, 0, 1, 1,
0.6774843, -2.167493, 3.114323, 1, 0, 0, 1, 1,
0.6786681, -0.1879498, -0.4559614, 1, 0, 0, 1, 1,
0.6820925, 0.4397186, 1.499313, 1, 0, 0, 1, 1,
0.6841025, 1.792752, -0.4488466, 0, 0, 0, 1, 1,
0.6854035, -0.2596142, 1.221897, 0, 0, 0, 1, 1,
0.6860486, 1.205307, 1.776593, 0, 0, 0, 1, 1,
0.6868674, -0.3852107, 1.965403, 0, 0, 0, 1, 1,
0.6877783, -0.5799633, 1.010453, 0, 0, 0, 1, 1,
0.6878514, 0.09778589, 1.039327, 0, 0, 0, 1, 1,
0.6905482, 0.5043619, -0.5262091, 0, 0, 0, 1, 1,
0.692216, 0.2046186, 0.08312327, 1, 1, 1, 1, 1,
0.6926419, 1.971323, 0.5242326, 1, 1, 1, 1, 1,
0.6940562, 0.6912564, 0.4804692, 1, 1, 1, 1, 1,
0.6947892, 0.07591474, 2.386053, 1, 1, 1, 1, 1,
0.69556, -0.480199, 3.744435, 1, 1, 1, 1, 1,
0.7025092, -0.4343866, 0.4461122, 1, 1, 1, 1, 1,
0.7040112, -0.8535094, 2.490333, 1, 1, 1, 1, 1,
0.7040818, 0.4926093, -0.5256116, 1, 1, 1, 1, 1,
0.7054281, 0.7582827, 1.428837, 1, 1, 1, 1, 1,
0.7117842, -0.6809847, 2.355776, 1, 1, 1, 1, 1,
0.7150345, 1.411487, -0.1753121, 1, 1, 1, 1, 1,
0.7169089, 0.7420253, 3.433643, 1, 1, 1, 1, 1,
0.723184, 0.07522876, 0.5085599, 1, 1, 1, 1, 1,
0.7288962, 1.098648, 0.1513062, 1, 1, 1, 1, 1,
0.7291817, 0.9525694, 0.1747441, 1, 1, 1, 1, 1,
0.7325277, -1.281883, 1.833504, 0, 0, 1, 1, 1,
0.7325756, -0.4409744, 2.77307, 1, 0, 0, 1, 1,
0.7356731, 0.2208739, -0.7251793, 1, 0, 0, 1, 1,
0.7374628, -1.33321, 1.778157, 1, 0, 0, 1, 1,
0.7527748, -0.1252816, 2.469519, 1, 0, 0, 1, 1,
0.7529185, 2.351491, 1.457923, 1, 0, 0, 1, 1,
0.753274, -1.746735, 3.244284, 0, 0, 0, 1, 1,
0.7551913, -1.428986, 3.13528, 0, 0, 0, 1, 1,
0.7570151, 1.034557, 0.4818601, 0, 0, 0, 1, 1,
0.7579432, -2.041914, 4.414522, 0, 0, 0, 1, 1,
0.7583833, -0.1094805, 3.062071, 0, 0, 0, 1, 1,
0.7618269, 1.341229, -1.508164, 0, 0, 0, 1, 1,
0.7629147, -0.2383915, 2.90178, 0, 0, 0, 1, 1,
0.7632722, 0.1211947, 0.8873723, 1, 1, 1, 1, 1,
0.7645283, -1.052187, 2.874226, 1, 1, 1, 1, 1,
0.765844, -0.6521512, 2.048199, 1, 1, 1, 1, 1,
0.7681416, 1.78464, 2.755501, 1, 1, 1, 1, 1,
0.773042, 1.530937, 0.5001861, 1, 1, 1, 1, 1,
0.777999, 0.1995224, 0.9495959, 1, 1, 1, 1, 1,
0.7798926, -0.5059895, 3.128301, 1, 1, 1, 1, 1,
0.784245, 0.4441926, 2.043906, 1, 1, 1, 1, 1,
0.7895084, -0.4867025, 1.799, 1, 1, 1, 1, 1,
0.7924914, 0.3687638, 1.331377, 1, 1, 1, 1, 1,
0.7948934, -0.6069657, 1.510435, 1, 1, 1, 1, 1,
0.7949102, 0.571142, 0.1320322, 1, 1, 1, 1, 1,
0.7950983, -0.04786868, 0.3726722, 1, 1, 1, 1, 1,
0.8017136, 0.4785547, 0.8452939, 1, 1, 1, 1, 1,
0.8045489, -1.808315, 3.235921, 1, 1, 1, 1, 1,
0.8078975, 0.3878779, -0.05325649, 0, 0, 1, 1, 1,
0.8090105, -0.7454411, 2.120816, 1, 0, 0, 1, 1,
0.8184921, -0.1918068, 0.2283079, 1, 0, 0, 1, 1,
0.8203261, -1.226836, 1.618436, 1, 0, 0, 1, 1,
0.8221713, -0.3714012, 1.865487, 1, 0, 0, 1, 1,
0.8229021, 0.08314667, 1.420631, 1, 0, 0, 1, 1,
0.8251997, -0.2315888, 0.1156893, 0, 0, 0, 1, 1,
0.8269457, -0.5014117, 1.109964, 0, 0, 0, 1, 1,
0.8271841, 1.786644, 0.4306856, 0, 0, 0, 1, 1,
0.828837, 1.628019, -0.1028286, 0, 0, 0, 1, 1,
0.8349769, -0.162244, 0.9947743, 0, 0, 0, 1, 1,
0.8370107, -0.05407476, 1.06177, 0, 0, 0, 1, 1,
0.8375449, 0.2294468, 0.7169938, 0, 0, 0, 1, 1,
0.8387518, 1.21007, 1.867578, 1, 1, 1, 1, 1,
0.8389379, 0.5230221, -0.9297791, 1, 1, 1, 1, 1,
0.8405126, -1.09364, 1.028358, 1, 1, 1, 1, 1,
0.8451685, -0.7898669, 3.283052, 1, 1, 1, 1, 1,
0.8489487, 0.4654303, 0.3109088, 1, 1, 1, 1, 1,
0.8522392, -0.6258397, 2.014479, 1, 1, 1, 1, 1,
0.8590101, 0.669109, -0.09765107, 1, 1, 1, 1, 1,
0.8646004, 0.06224981, 3.143817, 1, 1, 1, 1, 1,
0.8665559, 0.7272896, 3.209368, 1, 1, 1, 1, 1,
0.8694087, -0.4658819, 2.590096, 1, 1, 1, 1, 1,
0.8703157, 2.061856, 0.4954284, 1, 1, 1, 1, 1,
0.8821467, 0.1521167, 0.8894446, 1, 1, 1, 1, 1,
0.8862658, 0.2380069, 3.524743, 1, 1, 1, 1, 1,
0.8869277, -1.665115, 1.294015, 1, 1, 1, 1, 1,
0.8939086, -0.7243599, 2.715924, 1, 1, 1, 1, 1,
0.895736, 0.05068282, 1.29314, 0, 0, 1, 1, 1,
0.9162788, -0.8162184, 3.37658, 1, 0, 0, 1, 1,
0.9177856, -0.01251434, 2.103079, 1, 0, 0, 1, 1,
0.9229938, -1.104869, 2.220864, 1, 0, 0, 1, 1,
0.9244202, 0.002934247, 1.553185, 1, 0, 0, 1, 1,
0.9248354, 1.496189, 0.01730585, 1, 0, 0, 1, 1,
0.9282957, 0.3649451, 0.6348891, 0, 0, 0, 1, 1,
0.9316503, -0.2087331, 1.033848, 0, 0, 0, 1, 1,
0.9333175, 0.5784338, 0.2787224, 0, 0, 0, 1, 1,
0.935456, 0.09809249, 1.008445, 0, 0, 0, 1, 1,
0.9436361, -1.849107, 3.707543, 0, 0, 0, 1, 1,
0.9462769, -0.4201544, 1.635193, 0, 0, 0, 1, 1,
0.9489986, 1.240654, 0.3751703, 0, 0, 0, 1, 1,
0.9493544, -1.570762, 2.722573, 1, 1, 1, 1, 1,
0.9611174, -0.972536, 1.67974, 1, 1, 1, 1, 1,
0.9654548, 1.050987, 1.474383, 1, 1, 1, 1, 1,
0.972801, 0.5493233, -0.6952648, 1, 1, 1, 1, 1,
0.9730093, -0.5876539, 3.503855, 1, 1, 1, 1, 1,
0.9761109, -0.1050976, 1.620718, 1, 1, 1, 1, 1,
0.9774891, 0.3883081, 1.616273, 1, 1, 1, 1, 1,
0.9774934, -1.128322, 4.359599, 1, 1, 1, 1, 1,
0.9794973, -1.941097, 0.9198453, 1, 1, 1, 1, 1,
0.981268, -1.597024, 2.771721, 1, 1, 1, 1, 1,
0.9946048, 0.2535416, -0.8898331, 1, 1, 1, 1, 1,
0.9958647, 0.5874644, 1.213717, 1, 1, 1, 1, 1,
1.005982, 0.4984127, 2.741806, 1, 1, 1, 1, 1,
1.00622, -0.3148216, 2.512625, 1, 1, 1, 1, 1,
1.015453, 0.3562773, 2.475851, 1, 1, 1, 1, 1,
1.016477, 1.01126, 0.006436036, 0, 0, 1, 1, 1,
1.018122, -0.2200158, 1.607219, 1, 0, 0, 1, 1,
1.020057, 0.5343729, 2.521938, 1, 0, 0, 1, 1,
1.021023, -0.03144482, 1.448695, 1, 0, 0, 1, 1,
1.022677, -1.047167, 2.972064, 1, 0, 0, 1, 1,
1.02813, -0.532213, 2.402561, 1, 0, 0, 1, 1,
1.028163, 0.08966325, 1.693737, 0, 0, 0, 1, 1,
1.032786, -1.176944, 2.869145, 0, 0, 0, 1, 1,
1.033062, 0.09364583, 1.304177, 0, 0, 0, 1, 1,
1.039469, -0.3409341, 1.915081, 0, 0, 0, 1, 1,
1.044963, 0.7081914, 1.60052, 0, 0, 0, 1, 1,
1.059471, 0.9745473, 0.9625563, 0, 0, 0, 1, 1,
1.05982, -0.350245, 0.6669718, 0, 0, 0, 1, 1,
1.068283, -0.1061036, 1.846771, 1, 1, 1, 1, 1,
1.071881, 1.319023, 0.9155884, 1, 1, 1, 1, 1,
1.072508, 1.923779, 0.8776824, 1, 1, 1, 1, 1,
1.076086, -1.161882, 2.824626, 1, 1, 1, 1, 1,
1.078541, 0.7302485, 0.8239277, 1, 1, 1, 1, 1,
1.08087, -0.1106717, -0.05856827, 1, 1, 1, 1, 1,
1.086188, 1.131054, -0.1673868, 1, 1, 1, 1, 1,
1.091892, -0.03130915, 2.257144, 1, 1, 1, 1, 1,
1.092646, 0.297863, 1.285842, 1, 1, 1, 1, 1,
1.094787, -0.6258438, 2.516604, 1, 1, 1, 1, 1,
1.100828, -0.7022473, 2.4338, 1, 1, 1, 1, 1,
1.103052, 0.2821596, 0.3436864, 1, 1, 1, 1, 1,
1.103275, 0.1843285, 1.786023, 1, 1, 1, 1, 1,
1.104054, -0.3928623, 0.5970686, 1, 1, 1, 1, 1,
1.108356, 1.010142, 1.671319, 1, 1, 1, 1, 1,
1.114866, 1.576092, -0.1046101, 0, 0, 1, 1, 1,
1.116844, 2.140016, 1.076539, 1, 0, 0, 1, 1,
1.12367, 0.3439546, 2.447411, 1, 0, 0, 1, 1,
1.126635, 0.07030942, 0.8129687, 1, 0, 0, 1, 1,
1.129661, -1.758586, 4.06352, 1, 0, 0, 1, 1,
1.134927, -1.279528, 1.938985, 1, 0, 0, 1, 1,
1.135979, -1.248032, 3.844053, 0, 0, 0, 1, 1,
1.15134, -1.062483, 1.729353, 0, 0, 0, 1, 1,
1.152955, 0.5925711, 0.5133179, 0, 0, 0, 1, 1,
1.154832, -0.9142535, 1.77669, 0, 0, 0, 1, 1,
1.156922, -1.672026, 3.130119, 0, 0, 0, 1, 1,
1.161727, -0.9448653, 1.397657, 0, 0, 0, 1, 1,
1.173795, -0.7133187, 3.808284, 0, 0, 0, 1, 1,
1.174654, -0.9277655, 2.121911, 1, 1, 1, 1, 1,
1.176865, -0.9186816, 2.641815, 1, 1, 1, 1, 1,
1.177448, -0.1313617, 2.427261, 1, 1, 1, 1, 1,
1.177823, 0.8592125, 0.8952892, 1, 1, 1, 1, 1,
1.180405, 1.624823, 2.822309, 1, 1, 1, 1, 1,
1.182114, 1.47825, 2.127156, 1, 1, 1, 1, 1,
1.18891, 1.188313, 1.117463, 1, 1, 1, 1, 1,
1.191761, -2.634984, 2.463209, 1, 1, 1, 1, 1,
1.19354, 0.3775669, 1.323722, 1, 1, 1, 1, 1,
1.196054, 2.072357, -0.5301387, 1, 1, 1, 1, 1,
1.217218, 0.6171354, -0.3976922, 1, 1, 1, 1, 1,
1.217891, -0.493948, 1.901196, 1, 1, 1, 1, 1,
1.223907, -0.3818268, 1.004703, 1, 1, 1, 1, 1,
1.230647, 0.1011634, 2.572167, 1, 1, 1, 1, 1,
1.247658, 1.719039, 1.376133, 1, 1, 1, 1, 1,
1.258171, -0.2719881, 1.131539, 0, 0, 1, 1, 1,
1.259999, 0.1490022, 1.951032, 1, 0, 0, 1, 1,
1.265492, 1.043011, 2.7616, 1, 0, 0, 1, 1,
1.266306, -0.1862795, 0.7603714, 1, 0, 0, 1, 1,
1.26695, 1.61182, -0.2870165, 1, 0, 0, 1, 1,
1.285856, -1.337877, 2.771135, 1, 0, 0, 1, 1,
1.292118, -0.5506738, 1.101436, 0, 0, 0, 1, 1,
1.302251, 0.8992158, 0.2481572, 0, 0, 0, 1, 1,
1.306452, 0.05116836, 1.785673, 0, 0, 0, 1, 1,
1.309466, -2.171229, 3.05219, 0, 0, 0, 1, 1,
1.31429, 0.2780231, 1.397588, 0, 0, 0, 1, 1,
1.315967, -0.5000204, 2.271885, 0, 0, 0, 1, 1,
1.316937, -1.832583, 2.526027, 0, 0, 0, 1, 1,
1.326853, 1.99956, 0.3948179, 1, 1, 1, 1, 1,
1.326856, -0.08187151, 2.550833, 1, 1, 1, 1, 1,
1.345418, -0.3339391, -0.5069817, 1, 1, 1, 1, 1,
1.351797, 0.05028271, 2.64538, 1, 1, 1, 1, 1,
1.360116, -0.1965835, 2.523166, 1, 1, 1, 1, 1,
1.37199, 1.838956, 1.254667, 1, 1, 1, 1, 1,
1.373134, -1.275747, 2.646071, 1, 1, 1, 1, 1,
1.381105, -0.150322, 1.762544, 1, 1, 1, 1, 1,
1.396962, -0.8235787, 2.02697, 1, 1, 1, 1, 1,
1.409659, -1.227153, 3.048851, 1, 1, 1, 1, 1,
1.445585, -0.647768, 1.92782, 1, 1, 1, 1, 1,
1.447096, -0.150123, 1.978405, 1, 1, 1, 1, 1,
1.458418, 0.1614704, 2.782577, 1, 1, 1, 1, 1,
1.464478, -0.1475047, 1.459644, 1, 1, 1, 1, 1,
1.466076, 0.03587979, 1.284382, 1, 1, 1, 1, 1,
1.469736, -0.05771445, 2.273885, 0, 0, 1, 1, 1,
1.485363, -1.274042, 3.070238, 1, 0, 0, 1, 1,
1.497063, 0.314822, 1.684027, 1, 0, 0, 1, 1,
1.500491, -1.218096, 1.980374, 1, 0, 0, 1, 1,
1.501184, -0.4816076, 3.470593, 1, 0, 0, 1, 1,
1.501914, 0.8042875, 1.497516, 1, 0, 0, 1, 1,
1.505399, 0.174859, -0.716217, 0, 0, 0, 1, 1,
1.530828, -1.33525, 2.884006, 0, 0, 0, 1, 1,
1.536518, 0.008141638, 2.049791, 0, 0, 0, 1, 1,
1.542418, 0.4189133, 1.013676, 0, 0, 0, 1, 1,
1.564397, 0.7115386, 1.247794, 0, 0, 0, 1, 1,
1.571942, -0.8962668, 2.230023, 0, 0, 0, 1, 1,
1.573226, 0.6805922, 1.086928, 0, 0, 0, 1, 1,
1.584436, -0.4544527, 0.5718565, 1, 1, 1, 1, 1,
1.596509, 0.03855628, 1.668685, 1, 1, 1, 1, 1,
1.608578, 2.643421, 0.3205901, 1, 1, 1, 1, 1,
1.611893, -1.441433, 2.472043, 1, 1, 1, 1, 1,
1.615728, 0.2652829, 2.856739, 1, 1, 1, 1, 1,
1.624991, 0.1796633, 1.957888, 1, 1, 1, 1, 1,
1.652149, 0.9308296, 0.6201615, 1, 1, 1, 1, 1,
1.660169, 1.596891, -0.01548188, 1, 1, 1, 1, 1,
1.661016, -0.872124, 3.135888, 1, 1, 1, 1, 1,
1.661502, 1.276901, 2.049302, 1, 1, 1, 1, 1,
1.675368, 2.266234, 0.4233837, 1, 1, 1, 1, 1,
1.694329, 0.9689831, 0.9688147, 1, 1, 1, 1, 1,
1.694896, -0.06126119, 0.9112033, 1, 1, 1, 1, 1,
1.698363, -0.1739136, 1.376025, 1, 1, 1, 1, 1,
1.70352, 0.7387884, -0.1163283, 1, 1, 1, 1, 1,
1.708425, -0.1438791, 1.753456, 0, 0, 1, 1, 1,
1.711003, -0.8990109, 3.132575, 1, 0, 0, 1, 1,
1.71174, -1.293185, 2.870113, 1, 0, 0, 1, 1,
1.734888, -0.1771973, 0.912168, 1, 0, 0, 1, 1,
1.745428, 0.3797847, 1.193407, 1, 0, 0, 1, 1,
1.75727, -1.085697, 3.515604, 1, 0, 0, 1, 1,
1.768354, -0.5130094, 2.817151, 0, 0, 0, 1, 1,
1.768533, -0.9799888, 0.8484116, 0, 0, 0, 1, 1,
1.784216, -0.4265129, 2.191479, 0, 0, 0, 1, 1,
1.790064, 0.2422237, 2.443102, 0, 0, 0, 1, 1,
1.790585, 0.4836418, 1.429107, 0, 0, 0, 1, 1,
1.795257, -0.8597664, 1.029956, 0, 0, 0, 1, 1,
1.836409, 0.665953, 1.436706, 0, 0, 0, 1, 1,
1.858098, 0.228329, 1.763793, 1, 1, 1, 1, 1,
1.863546, -0.2807168, 2.552112, 1, 1, 1, 1, 1,
1.873662, 0.9520171, 0.6911563, 1, 1, 1, 1, 1,
1.875693, 0.1037464, 2.516523, 1, 1, 1, 1, 1,
1.876272, 1.100504, 1.329374, 1, 1, 1, 1, 1,
1.892103, 2.213898, -0.3080352, 1, 1, 1, 1, 1,
1.905851, -0.04097618, 2.129175, 1, 1, 1, 1, 1,
1.922831, 0.1611446, 0.5311525, 1, 1, 1, 1, 1,
1.926731, 0.4015232, 1.236785, 1, 1, 1, 1, 1,
1.947764, 0.2584257, 2.459186, 1, 1, 1, 1, 1,
1.948045, -1.25001, 0.9666485, 1, 1, 1, 1, 1,
2.010274, 1.279553, 1.742346, 1, 1, 1, 1, 1,
2.016542, -0.6558336, 0.4067666, 1, 1, 1, 1, 1,
2.024349, 0.9266783, 0.4783571, 1, 1, 1, 1, 1,
2.026037, 0.168252, 1.960114, 1, 1, 1, 1, 1,
2.0537, 0.1629151, -0.05144339, 0, 0, 1, 1, 1,
2.056961, -0.8945245, 0.3192618, 1, 0, 0, 1, 1,
2.060965, 1.41879, 3.472298, 1, 0, 0, 1, 1,
2.097032, -0.8838243, 2.236628, 1, 0, 0, 1, 1,
2.104639, -0.07552902, 1.615649, 1, 0, 0, 1, 1,
2.110555, 1.54597, 0.3940852, 1, 0, 0, 1, 1,
2.175412, -2.148036, 1.203119, 0, 0, 0, 1, 1,
2.17945, 2.465914, 0.7004806, 0, 0, 0, 1, 1,
2.192598, 0.7610003, 1.498955, 0, 0, 0, 1, 1,
2.288008, -1.582579, 0.7958272, 0, 0, 0, 1, 1,
2.401375, 2.168981, 2.648338, 0, 0, 0, 1, 1,
2.427519, 1.009873, 0.6807162, 0, 0, 0, 1, 1,
2.538404, -0.2922594, 1.638298, 0, 0, 0, 1, 1,
2.544118, -0.1008402, 1.920706, 1, 1, 1, 1, 1,
2.567425, -0.04833141, 2.05774, 1, 1, 1, 1, 1,
2.576349, 2.325615e-05, 0.7289635, 1, 1, 1, 1, 1,
2.591489, 0.779956, 2.367981, 1, 1, 1, 1, 1,
2.795919, 0.04731156, 2.38041, 1, 1, 1, 1, 1,
2.886267, -0.6439129, 1.799134, 1, 1, 1, 1, 1,
3.000025, -0.390338, 3.896301, 1, 1, 1, 1, 1
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
var radius = 9.448191;
var distance = 33.18637;
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
mvMatrix.translate( 0.3950844, -0.1085324, -0.2312713 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.18637);
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
