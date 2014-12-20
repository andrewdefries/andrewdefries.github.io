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
-3.331528, -2.239078, -1.015068, 1, 0, 0, 1,
-3.223819, 0.5446246, -2.423227, 1, 0.007843138, 0, 1,
-2.610223, -1.761962, -2.355902, 1, 0.01176471, 0, 1,
-2.594276, -0.4864714, -1.872864, 1, 0.01960784, 0, 1,
-2.531772, 2.286408, -0.5713219, 1, 0.02352941, 0, 1,
-2.40228, -1.630965, -2.559511, 1, 0.03137255, 0, 1,
-2.391265, 0.8692396, 0.2300908, 1, 0.03529412, 0, 1,
-2.339763, 0.1718597, -3.903341, 1, 0.04313726, 0, 1,
-2.318402, 0.459345, -0.4253884, 1, 0.04705882, 0, 1,
-2.300156, 0.2613692, -0.5822545, 1, 0.05490196, 0, 1,
-2.243691, 1.326778, -1.038327, 1, 0.05882353, 0, 1,
-2.240367, 0.4032247, 0.3712484, 1, 0.06666667, 0, 1,
-2.236341, -0.7571703, -2.51729, 1, 0.07058824, 0, 1,
-2.23497, 1.131984, -1.598669, 1, 0.07843138, 0, 1,
-2.176156, -0.8821604, -1.308058, 1, 0.08235294, 0, 1,
-2.175009, 0.5508125, -2.348678, 1, 0.09019608, 0, 1,
-2.14684, 0.9641244, 1.204248, 1, 0.09411765, 0, 1,
-2.124336, 0.177222, -1.52033, 1, 0.1019608, 0, 1,
-2.103348, 1.635202, -0.5110233, 1, 0.1098039, 0, 1,
-2.088664, 0.1249059, 0.5435759, 1, 0.1137255, 0, 1,
-2.075964, -0.2834341, 0.1276496, 1, 0.1215686, 0, 1,
-2.062112, 1.05916, -0.0374188, 1, 0.1254902, 0, 1,
-2.048545, -1.18895, -2.314352, 1, 0.1333333, 0, 1,
-2.043549, -0.9063658, -2.862495, 1, 0.1372549, 0, 1,
-2.027299, 1.083636, -2.451213, 1, 0.145098, 0, 1,
-2.025081, 0.3358121, -0.9972495, 1, 0.1490196, 0, 1,
-2.002567, -0.04614701, -1.831506, 1, 0.1568628, 0, 1,
-1.976695, -0.1838154, 0.5349348, 1, 0.1607843, 0, 1,
-1.971715, -1.138991, -2.157875, 1, 0.1686275, 0, 1,
-1.954665, 0.1868938, -2.944373, 1, 0.172549, 0, 1,
-1.948148, 1.354203, -1.892261, 1, 0.1803922, 0, 1,
-1.933918, 0.9276237, -0.6653976, 1, 0.1843137, 0, 1,
-1.912976, 0.7581424, -0.658237, 1, 0.1921569, 0, 1,
-1.896793, 0.7223867, -0.9152238, 1, 0.1960784, 0, 1,
-1.893629, 0.8355685, -0.8078758, 1, 0.2039216, 0, 1,
-1.88559, 1.839964, -1.023606, 1, 0.2117647, 0, 1,
-1.850892, -0.1163031, -1.535685, 1, 0.2156863, 0, 1,
-1.831309, -1.019325, -2.632174, 1, 0.2235294, 0, 1,
-1.824072, -0.1198451, -1.746744, 1, 0.227451, 0, 1,
-1.818219, -0.1714401, -0.3284061, 1, 0.2352941, 0, 1,
-1.812297, -0.3090701, -0.8910115, 1, 0.2392157, 0, 1,
-1.795666, -0.7880942, -2.383654, 1, 0.2470588, 0, 1,
-1.790023, -0.3442321, -2.160226, 1, 0.2509804, 0, 1,
-1.781282, -2.357418, -1.989473, 1, 0.2588235, 0, 1,
-1.779667, -0.399776, -3.06549, 1, 0.2627451, 0, 1,
-1.774179, -1.586965, -2.20652, 1, 0.2705882, 0, 1,
-1.773964, 1.527166, 1.085588, 1, 0.2745098, 0, 1,
-1.768098, 0.5644128, -1.34909, 1, 0.282353, 0, 1,
-1.76738, 0.1367428, -0.7725883, 1, 0.2862745, 0, 1,
-1.752123, 1.783937, -1.048992, 1, 0.2941177, 0, 1,
-1.743229, -0.08581874, 0.6326239, 1, 0.3019608, 0, 1,
-1.733998, -0.6730033, -4.645095, 1, 0.3058824, 0, 1,
-1.733581, 0.26019, -0.6816601, 1, 0.3137255, 0, 1,
-1.724804, -0.5491902, -1.782608, 1, 0.3176471, 0, 1,
-1.717947, 0.818167, -1.673576, 1, 0.3254902, 0, 1,
-1.680996, 1.352063, -0.467159, 1, 0.3294118, 0, 1,
-1.664033, -1.565669, -3.265543, 1, 0.3372549, 0, 1,
-1.643296, -0.275015, -0.9561679, 1, 0.3411765, 0, 1,
-1.636568, 0.2782919, -0.0705907, 1, 0.3490196, 0, 1,
-1.635676, -0.326136, -3.165233, 1, 0.3529412, 0, 1,
-1.625597, -0.0468189, -0.8616435, 1, 0.3607843, 0, 1,
-1.618054, 2.057736, -2.1924, 1, 0.3647059, 0, 1,
-1.615724, 1.288724, -0.9038271, 1, 0.372549, 0, 1,
-1.60989, 0.5788789, -2.178261, 1, 0.3764706, 0, 1,
-1.598989, 0.6024724, -1.885385, 1, 0.3843137, 0, 1,
-1.585703, -0.1072254, -1.733143, 1, 0.3882353, 0, 1,
-1.572574, -0.5407667, -1.112775, 1, 0.3960784, 0, 1,
-1.569772, -0.3005843, -2.047539, 1, 0.4039216, 0, 1,
-1.556583, -1.270396, -1.410412, 1, 0.4078431, 0, 1,
-1.553766, -0.6128657, -2.722726, 1, 0.4156863, 0, 1,
-1.550604, 1.225275, -3.334008, 1, 0.4196078, 0, 1,
-1.542654, -0.1670257, -1.873282, 1, 0.427451, 0, 1,
-1.529702, -0.6295689, -2.755038, 1, 0.4313726, 0, 1,
-1.515125, -1.164452, -2.518018, 1, 0.4392157, 0, 1,
-1.478671, -0.1610344, -0.6761811, 1, 0.4431373, 0, 1,
-1.477822, -1.433945, -1.659365, 1, 0.4509804, 0, 1,
-1.475603, 0.01119806, -1.861028, 1, 0.454902, 0, 1,
-1.473709, -1.03789, -1.691849, 1, 0.4627451, 0, 1,
-1.436324, -1.238443, -1.66832, 1, 0.4666667, 0, 1,
-1.431237, -1.6982, -0.9599079, 1, 0.4745098, 0, 1,
-1.412947, 0.2135294, -0.7585056, 1, 0.4784314, 0, 1,
-1.411724, 0.06922372, 0.5647921, 1, 0.4862745, 0, 1,
-1.404827, -2.117335, -2.370622, 1, 0.4901961, 0, 1,
-1.396663, 0.9466082, 1.251726, 1, 0.4980392, 0, 1,
-1.39147, -0.853561, -2.179017, 1, 0.5058824, 0, 1,
-1.386072, 0.5118295, -2.095452, 1, 0.509804, 0, 1,
-1.385167, -0.6218133, -1.740329, 1, 0.5176471, 0, 1,
-1.383588, 1.924428, 0.7004739, 1, 0.5215687, 0, 1,
-1.372096, -0.7199102, -1.079481, 1, 0.5294118, 0, 1,
-1.364237, 0.9952884, -1.73716, 1, 0.5333334, 0, 1,
-1.361527, 1.207469, -0.3332542, 1, 0.5411765, 0, 1,
-1.356886, 0.3398463, -1.150451, 1, 0.5450981, 0, 1,
-1.35269, -1.202095, -3.25857, 1, 0.5529412, 0, 1,
-1.350581, 1.99345, -1.729151, 1, 0.5568628, 0, 1,
-1.348622, 0.7612349, -0.03062879, 1, 0.5647059, 0, 1,
-1.346675, -0.7652133, -2.053104, 1, 0.5686275, 0, 1,
-1.344612, -1.95722, -4.23516, 1, 0.5764706, 0, 1,
-1.340604, -1.441671, -2.475186, 1, 0.5803922, 0, 1,
-1.332146, 0.8826394, -1.593047, 1, 0.5882353, 0, 1,
-1.325959, -0.9279512, -1.666997, 1, 0.5921569, 0, 1,
-1.325298, 1.379073, -0.3422853, 1, 0.6, 0, 1,
-1.318882, -1.233609, -3.355655, 1, 0.6078432, 0, 1,
-1.317805, 0.8776453, -0.6924108, 1, 0.6117647, 0, 1,
-1.317061, -0.2246377, -1.996343, 1, 0.6196079, 0, 1,
-1.313119, -0.8264602, -0.7995327, 1, 0.6235294, 0, 1,
-1.311787, -0.5771243, -0.5597622, 1, 0.6313726, 0, 1,
-1.308107, 0.4907606, -0.7367589, 1, 0.6352941, 0, 1,
-1.300228, -0.3495994, -1.894328, 1, 0.6431373, 0, 1,
-1.29392, 0.1314568, -0.824065, 1, 0.6470588, 0, 1,
-1.281341, -2.151516, -2.109472, 1, 0.654902, 0, 1,
-1.273932, 0.8766738, -2.355117, 1, 0.6588235, 0, 1,
-1.272521, 0.476329, -1.55767, 1, 0.6666667, 0, 1,
-1.271378, 1.022744, 1.009748, 1, 0.6705883, 0, 1,
-1.263734, -0.5467142, -2.729973, 1, 0.6784314, 0, 1,
-1.260961, -0.8651334, -2.277726, 1, 0.682353, 0, 1,
-1.260879, 0.4003438, -0.2709607, 1, 0.6901961, 0, 1,
-1.257044, 0.8571437, -0.2487724, 1, 0.6941177, 0, 1,
-1.253228, 0.3068162, -0.3590174, 1, 0.7019608, 0, 1,
-1.241823, -0.3828296, 0.2548819, 1, 0.7098039, 0, 1,
-1.236869, -0.1845694, -3.60463, 1, 0.7137255, 0, 1,
-1.23479, -1.649306, -3.818074, 1, 0.7215686, 0, 1,
-1.227342, 0.8425546, -1.444597, 1, 0.7254902, 0, 1,
-1.226737, -0.8574385, -1.706521, 1, 0.7333333, 0, 1,
-1.224648, 0.2761695, 1.472778, 1, 0.7372549, 0, 1,
-1.22324, -1.44657, -2.878828, 1, 0.7450981, 0, 1,
-1.217071, -0.5929478, -1.105769, 1, 0.7490196, 0, 1,
-1.21195, -0.2615629, -0.5371889, 1, 0.7568628, 0, 1,
-1.199836, 0.8643485, -0.7454359, 1, 0.7607843, 0, 1,
-1.19008, 0.9725219, -1.834828, 1, 0.7686275, 0, 1,
-1.185941, 0.4726676, -0.5548291, 1, 0.772549, 0, 1,
-1.178483, 0.9835915, -0.8000226, 1, 0.7803922, 0, 1,
-1.178393, 1.228839, 0.3128879, 1, 0.7843137, 0, 1,
-1.173637, -0.2370207, -2.198225, 1, 0.7921569, 0, 1,
-1.156792, 0.08248067, -1.907669, 1, 0.7960784, 0, 1,
-1.152394, -0.3404139, -0.9424047, 1, 0.8039216, 0, 1,
-1.151088, -1.363277, -2.862519, 1, 0.8117647, 0, 1,
-1.149213, -1.033884, -2.220184, 1, 0.8156863, 0, 1,
-1.149045, -0.2043059, -1.177217, 1, 0.8235294, 0, 1,
-1.143478, 0.9452372, -1.250944, 1, 0.827451, 0, 1,
-1.13413, -0.24171, -1.052058, 1, 0.8352941, 0, 1,
-1.125692, -1.106395, -1.86191, 1, 0.8392157, 0, 1,
-1.112702, -0.08311237, -2.052447, 1, 0.8470588, 0, 1,
-1.094862, -0.7077464, -2.577121, 1, 0.8509804, 0, 1,
-1.091616, 0.1367457, -2.887841, 1, 0.8588235, 0, 1,
-1.09128, 0.6316002, -0.860755, 1, 0.8627451, 0, 1,
-1.086239, 1.193889, -1.658668, 1, 0.8705882, 0, 1,
-1.078256, -0.9011579, -3.837304, 1, 0.8745098, 0, 1,
-1.072381, -0.4971245, -2.318872, 1, 0.8823529, 0, 1,
-1.069975, -0.2782902, -2.38913, 1, 0.8862745, 0, 1,
-1.066312, -0.04169042, -3.087696, 1, 0.8941177, 0, 1,
-1.065055, -0.8736222, -2.445211, 1, 0.8980392, 0, 1,
-1.064442, -0.6372938, -3.966671, 1, 0.9058824, 0, 1,
-1.057945, -0.3253478, -2.767825, 1, 0.9137255, 0, 1,
-1.053907, -0.156211, -1.637992, 1, 0.9176471, 0, 1,
-1.051698, 0.4275409, -2.674354, 1, 0.9254902, 0, 1,
-1.051639, 0.2080295, 1.000972, 1, 0.9294118, 0, 1,
-1.049039, -1.495875, -1.335259, 1, 0.9372549, 0, 1,
-1.033424, -0.1744512, -1.001463, 1, 0.9411765, 0, 1,
-1.03327, 0.4034966, -2.476393, 1, 0.9490196, 0, 1,
-1.031605, -0.1166642, -1.931669, 1, 0.9529412, 0, 1,
-1.026338, 0.6327135, -2.774549, 1, 0.9607843, 0, 1,
-1.017364, -0.3209089, -2.087226, 1, 0.9647059, 0, 1,
-1.011939, -1.532473, -2.913926, 1, 0.972549, 0, 1,
-0.9914235, 0.9922097, 0.04777337, 1, 0.9764706, 0, 1,
-0.9872485, 1.038445, 1.985269, 1, 0.9843137, 0, 1,
-0.9868639, 0.1243593, -1.931784, 1, 0.9882353, 0, 1,
-0.9868615, 0.6098233, -1.219271, 1, 0.9960784, 0, 1,
-0.9867172, 2.038015, -1.262485, 0.9960784, 1, 0, 1,
-0.9725211, 0.3588409, -0.4080496, 0.9921569, 1, 0, 1,
-0.9718974, -0.6970717, -2.596972, 0.9843137, 1, 0, 1,
-0.9633576, 0.1741377, -1.331218, 0.9803922, 1, 0, 1,
-0.9606843, 1.118173, -0.7412103, 0.972549, 1, 0, 1,
-0.9551239, 0.9284565, -1.24345, 0.9686275, 1, 0, 1,
-0.950784, -0.2585135, -0.7179689, 0.9607843, 1, 0, 1,
-0.9490649, -0.717081, 0.1314943, 0.9568627, 1, 0, 1,
-0.9466782, 0.8020779, -0.9571822, 0.9490196, 1, 0, 1,
-0.9456592, -0.9933015, -1.841515, 0.945098, 1, 0, 1,
-0.9454703, 0.8326113, 2.027647, 0.9372549, 1, 0, 1,
-0.9412093, -1.109819, -1.40998, 0.9333333, 1, 0, 1,
-0.9351799, -0.6941917, -2.174496, 0.9254902, 1, 0, 1,
-0.9295547, 0.1687143, -1.432217, 0.9215686, 1, 0, 1,
-0.9286512, -0.1304324, -1.79775, 0.9137255, 1, 0, 1,
-0.9241371, -0.7118163, -3.020984, 0.9098039, 1, 0, 1,
-0.9206187, -0.2479372, -2.005092, 0.9019608, 1, 0, 1,
-0.9075951, 0.0645048, -0.6498064, 0.8941177, 1, 0, 1,
-0.9057185, -0.4107968, -3.330581, 0.8901961, 1, 0, 1,
-0.9050647, -0.6885987, -1.204214, 0.8823529, 1, 0, 1,
-0.9043328, -0.1119858, -0.8842236, 0.8784314, 1, 0, 1,
-0.902629, 0.7687404, 0.3700652, 0.8705882, 1, 0, 1,
-0.9003838, 0.9891195, -1.346783, 0.8666667, 1, 0, 1,
-0.8980674, -0.09203599, -2.079832, 0.8588235, 1, 0, 1,
-0.8974643, 0.3200099, -2.586663, 0.854902, 1, 0, 1,
-0.8954805, -0.0225766, -0.8741692, 0.8470588, 1, 0, 1,
-0.8782834, -0.7051282, -3.33757, 0.8431373, 1, 0, 1,
-0.872959, -0.0790445, -3.253346, 0.8352941, 1, 0, 1,
-0.8716012, 0.7582793, -0.09982718, 0.8313726, 1, 0, 1,
-0.8670858, 1.251125, 0.3748446, 0.8235294, 1, 0, 1,
-0.8661678, 0.2847943, -3.064956, 0.8196079, 1, 0, 1,
-0.8645975, 0.287849, -2.539961, 0.8117647, 1, 0, 1,
-0.8639546, -1.354639, -3.655367, 0.8078431, 1, 0, 1,
-0.8639512, 0.1252501, -2.151007, 0.8, 1, 0, 1,
-0.858829, -0.8705353, -1.416625, 0.7921569, 1, 0, 1,
-0.8529885, -1.016309, -4.089855, 0.7882353, 1, 0, 1,
-0.8471726, -1.256849, -2.537322, 0.7803922, 1, 0, 1,
-0.8413743, 0.6587822, -2.244174, 0.7764706, 1, 0, 1,
-0.838868, -1.605314, -2.550256, 0.7686275, 1, 0, 1,
-0.8353435, -0.7242747, -2.938711, 0.7647059, 1, 0, 1,
-0.8277538, -0.6939802, -2.350334, 0.7568628, 1, 0, 1,
-0.8263357, -0.8436114, -2.66849, 0.7529412, 1, 0, 1,
-0.8246246, -0.008809187, -1.931647, 0.7450981, 1, 0, 1,
-0.8236204, 0.3260243, 0.3873106, 0.7411765, 1, 0, 1,
-0.8226668, -1.651006, -2.974348, 0.7333333, 1, 0, 1,
-0.8214886, 1.500072, 0.1560729, 0.7294118, 1, 0, 1,
-0.8211461, -0.4366736, -1.849966, 0.7215686, 1, 0, 1,
-0.8186616, 0.2879739, -2.65743, 0.7176471, 1, 0, 1,
-0.8132271, 0.8261512, 0.1586939, 0.7098039, 1, 0, 1,
-0.8128453, 1.172317, -1.862509, 0.7058824, 1, 0, 1,
-0.8127488, -0.2847486, -2.140545, 0.6980392, 1, 0, 1,
-0.8072249, 0.4043264, -0.8211492, 0.6901961, 1, 0, 1,
-0.803517, -0.1386202, -2.292494, 0.6862745, 1, 0, 1,
-0.8013986, 1.857997, 0.5690248, 0.6784314, 1, 0, 1,
-0.8004023, -2.515233, -2.378121, 0.6745098, 1, 0, 1,
-0.8002005, -1.302197, -2.659344, 0.6666667, 1, 0, 1,
-0.799896, 1.890228, -0.1010676, 0.6627451, 1, 0, 1,
-0.7947965, -0.3656227, -1.968845, 0.654902, 1, 0, 1,
-0.792384, 0.4822729, -1.158267, 0.6509804, 1, 0, 1,
-0.7916015, 0.7619734, -1.054258, 0.6431373, 1, 0, 1,
-0.7887229, -0.4592363, -2.327294, 0.6392157, 1, 0, 1,
-0.7867127, 0.7893918, -2.374512, 0.6313726, 1, 0, 1,
-0.7840234, 1.570527, -1.179939, 0.627451, 1, 0, 1,
-0.7756141, -0.8013447, -2.309291, 0.6196079, 1, 0, 1,
-0.7614505, -0.5226845, -2.229553, 0.6156863, 1, 0, 1,
-0.7605771, -0.02341251, -1.249209, 0.6078432, 1, 0, 1,
-0.7562416, -1.119924, -2.858582, 0.6039216, 1, 0, 1,
-0.7551081, 1.393523, -1.762262, 0.5960785, 1, 0, 1,
-0.7542835, 0.5129771, -0.2511679, 0.5882353, 1, 0, 1,
-0.7532734, -1.72878, -4.066246, 0.5843138, 1, 0, 1,
-0.7492686, 1.155121, -0.01398467, 0.5764706, 1, 0, 1,
-0.748949, 0.1635467, -1.927165, 0.572549, 1, 0, 1,
-0.7465395, -0.02865167, -0.6165869, 0.5647059, 1, 0, 1,
-0.7453688, -1.047115, -3.285445, 0.5607843, 1, 0, 1,
-0.7424112, 0.4918829, -1.457047, 0.5529412, 1, 0, 1,
-0.7424054, 0.3109668, -2.03133, 0.5490196, 1, 0, 1,
-0.7407048, -0.04180371, -2.681509, 0.5411765, 1, 0, 1,
-0.7381955, -0.4390823, -2.40245, 0.5372549, 1, 0, 1,
-0.7324829, 0.1786103, -1.654873, 0.5294118, 1, 0, 1,
-0.7318452, -1.381276, -3.978906, 0.5254902, 1, 0, 1,
-0.7314679, 1.402689, -0.1561664, 0.5176471, 1, 0, 1,
-0.7294955, 0.2096991, 0.4839522, 0.5137255, 1, 0, 1,
-0.7264959, 0.6280865, -0.1476545, 0.5058824, 1, 0, 1,
-0.7133713, 0.1207441, -1.484068, 0.5019608, 1, 0, 1,
-0.7063667, -1.113915, -1.856578, 0.4941176, 1, 0, 1,
-0.7057656, 1.308315, -1.830363, 0.4862745, 1, 0, 1,
-0.7010194, -0.01038425, -3.489444, 0.4823529, 1, 0, 1,
-0.6992083, -0.8728639, -2.427307, 0.4745098, 1, 0, 1,
-0.6948759, 1.549754, 0.2167949, 0.4705882, 1, 0, 1,
-0.692332, 0.168203, -2.423513, 0.4627451, 1, 0, 1,
-0.6908848, -1.22564, -2.366634, 0.4588235, 1, 0, 1,
-0.6836517, 0.2596858, -0.3862969, 0.4509804, 1, 0, 1,
-0.6827759, -0.6330871, -2.226162, 0.4470588, 1, 0, 1,
-0.6816079, 0.2180561, -1.939949, 0.4392157, 1, 0, 1,
-0.6760613, 0.457538, -2.348711, 0.4352941, 1, 0, 1,
-0.6714262, -0.1216955, -2.492457, 0.427451, 1, 0, 1,
-0.6709012, 0.00937523, -0.6188498, 0.4235294, 1, 0, 1,
-0.6705556, -1.005176, -0.1503133, 0.4156863, 1, 0, 1,
-0.6699718, -0.7410049, -1.184741, 0.4117647, 1, 0, 1,
-0.6643588, 0.8596261, -0.05753079, 0.4039216, 1, 0, 1,
-0.6642037, 0.537383, -0.4198054, 0.3960784, 1, 0, 1,
-0.6641095, 0.7653807, -0.8632864, 0.3921569, 1, 0, 1,
-0.6564123, 0.3713395, -2.171731, 0.3843137, 1, 0, 1,
-0.6563832, -0.296969, -1.065246, 0.3803922, 1, 0, 1,
-0.6540974, -2.332272, -3.271117, 0.372549, 1, 0, 1,
-0.6525812, 0.476405, -0.1901148, 0.3686275, 1, 0, 1,
-0.6497961, 0.1227801, -0.4352145, 0.3607843, 1, 0, 1,
-0.6458938, -0.6889142, -1.453599, 0.3568628, 1, 0, 1,
-0.6458448, 0.2865554, -0.7457227, 0.3490196, 1, 0, 1,
-0.6448618, 0.9562074, -0.232279, 0.345098, 1, 0, 1,
-0.6447173, 1.798118, -2.32549, 0.3372549, 1, 0, 1,
-0.643038, -0.2194621, -2.321532, 0.3333333, 1, 0, 1,
-0.6429729, -1.62356, -1.286512, 0.3254902, 1, 0, 1,
-0.6419066, -2.1893, -2.445114, 0.3215686, 1, 0, 1,
-0.6378391, -0.1699587, -1.555473, 0.3137255, 1, 0, 1,
-0.6340616, 0.452293, 0.7855158, 0.3098039, 1, 0, 1,
-0.6327199, -0.0797718, -0.9043496, 0.3019608, 1, 0, 1,
-0.6315216, -1.313655, -3.628574, 0.2941177, 1, 0, 1,
-0.6301191, -0.04584219, -3.633884, 0.2901961, 1, 0, 1,
-0.6284264, 1.051208, -1.288713, 0.282353, 1, 0, 1,
-0.6282026, 0.08212593, -1.182608, 0.2784314, 1, 0, 1,
-0.6258378, -0.5099778, -1.422119, 0.2705882, 1, 0, 1,
-0.6236649, -0.1639513, -2.51347, 0.2666667, 1, 0, 1,
-0.6143017, 0.645187, 0.1352421, 0.2588235, 1, 0, 1,
-0.6103712, 0.6537375, -1.69198, 0.254902, 1, 0, 1,
-0.6022369, -0.5698414, -3.294793, 0.2470588, 1, 0, 1,
-0.6014955, 0.581664, -0.2663538, 0.2431373, 1, 0, 1,
-0.5970759, -0.9505757, -5.277244, 0.2352941, 1, 0, 1,
-0.5919104, -0.2222419, -2.36693, 0.2313726, 1, 0, 1,
-0.590983, -0.1594103, -1.989039, 0.2235294, 1, 0, 1,
-0.5871849, 0.01116699, -0.1062557, 0.2196078, 1, 0, 1,
-0.5870165, -0.4369358, -1.420977, 0.2117647, 1, 0, 1,
-0.5859838, -0.8430026, -3.542746, 0.2078431, 1, 0, 1,
-0.5839248, 0.705574, -1.547673, 0.2, 1, 0, 1,
-0.5811791, -0.7698286, -1.312087, 0.1921569, 1, 0, 1,
-0.5781139, 1.045635, -1.642685, 0.1882353, 1, 0, 1,
-0.5773469, 0.1159561, -0.3175294, 0.1803922, 1, 0, 1,
-0.5744607, -0.2067344, -2.061077, 0.1764706, 1, 0, 1,
-0.5718232, 0.6985539, -2.34394, 0.1686275, 1, 0, 1,
-0.5709175, -1.442901, -3.794178, 0.1647059, 1, 0, 1,
-0.5705218, -1.01183, -2.034518, 0.1568628, 1, 0, 1,
-0.5696851, 1.406747, 0.8761338, 0.1529412, 1, 0, 1,
-0.5682524, 0.5234953, 0.9940923, 0.145098, 1, 0, 1,
-0.5657625, -0.8840454, -3.070263, 0.1411765, 1, 0, 1,
-0.5637406, 1.415788, 0.6740319, 0.1333333, 1, 0, 1,
-0.5605915, 0.4385936, -1.890082, 0.1294118, 1, 0, 1,
-0.5552323, 1.189308, 0.738079, 0.1215686, 1, 0, 1,
-0.5549944, -0.4548485, -2.728501, 0.1176471, 1, 0, 1,
-0.5522276, -0.4281527, -3.202218, 0.1098039, 1, 0, 1,
-0.5450438, -0.7801481, -3.250424, 0.1058824, 1, 0, 1,
-0.5445625, 1.153409, -1.095598, 0.09803922, 1, 0, 1,
-0.5433668, 0.2745127, -0.8342129, 0.09019608, 1, 0, 1,
-0.5378008, 0.550368, -1.641938, 0.08627451, 1, 0, 1,
-0.5362129, 1.116905, -0.7324122, 0.07843138, 1, 0, 1,
-0.5324244, 1.076452, 1.142059, 0.07450981, 1, 0, 1,
-0.5247853, 0.6357331, 0.2656519, 0.06666667, 1, 0, 1,
-0.5237686, -0.1964209, -3.789042, 0.0627451, 1, 0, 1,
-0.5205569, 1.769648, 0.8079097, 0.05490196, 1, 0, 1,
-0.5200934, -0.4053219, -1.724297, 0.05098039, 1, 0, 1,
-0.5154732, 1.203212, 0.4296065, 0.04313726, 1, 0, 1,
-0.5072094, 0.2232082, -1.214049, 0.03921569, 1, 0, 1,
-0.5066796, -1.447297, -2.174488, 0.03137255, 1, 0, 1,
-0.5030118, -0.3891262, -3.513064, 0.02745098, 1, 0, 1,
-0.4939247, 0.7715585, -0.8698137, 0.01960784, 1, 0, 1,
-0.4860069, -0.1584253, 0.5091846, 0.01568628, 1, 0, 1,
-0.4827596, -0.3039667, -1.657276, 0.007843138, 1, 0, 1,
-0.4796594, 0.8575332, -0.2851748, 0.003921569, 1, 0, 1,
-0.4779171, 0.2928105, -1.673044, 0, 1, 0.003921569, 1,
-0.4720668, 2.081833, 0.06562664, 0, 1, 0.01176471, 1,
-0.4717306, 0.004204244, -0.07083269, 0, 1, 0.01568628, 1,
-0.4710844, 0.5399312, -0.7977316, 0, 1, 0.02352941, 1,
-0.4707864, -1.024577, -3.792456, 0, 1, 0.02745098, 1,
-0.4703383, 0.4049112, 0.1728581, 0, 1, 0.03529412, 1,
-0.4634728, 0.1109378, -1.59723, 0, 1, 0.03921569, 1,
-0.4578223, 0.2275235, -0.04049256, 0, 1, 0.04705882, 1,
-0.4575283, 0.7221884, -2.197156, 0, 1, 0.05098039, 1,
-0.451072, 0.1093611, -0.09737992, 0, 1, 0.05882353, 1,
-0.4506765, -0.8682359, -3.588967, 0, 1, 0.0627451, 1,
-0.4500017, -0.4481719, -1.637181, 0, 1, 0.07058824, 1,
-0.4493961, 0.2795514, -0.7288305, 0, 1, 0.07450981, 1,
-0.4488929, -0.5189083, -3.852857, 0, 1, 0.08235294, 1,
-0.4442051, -0.4317693, -0.5822887, 0, 1, 0.08627451, 1,
-0.4398894, -0.714119, -3.368391, 0, 1, 0.09411765, 1,
-0.4396213, -1.970436, -5.201341, 0, 1, 0.1019608, 1,
-0.436193, -0.008412484, -1.716302, 0, 1, 0.1058824, 1,
-0.4336557, 0.9203294, 1.150429, 0, 1, 0.1137255, 1,
-0.4310708, -0.001855982, -2.550952, 0, 1, 0.1176471, 1,
-0.4295695, 1.407704, 0.176921, 0, 1, 0.1254902, 1,
-0.4283964, -0.2249023, -3.389838, 0, 1, 0.1294118, 1,
-0.4274936, 0.333011, -0.2366499, 0, 1, 0.1372549, 1,
-0.4263632, 0.1332323, 0.05344654, 0, 1, 0.1411765, 1,
-0.4241802, 0.7601873, -1.278134, 0, 1, 0.1490196, 1,
-0.4181982, 0.3522982, -1.320677, 0, 1, 0.1529412, 1,
-0.4164096, 1.019588, -0.005619549, 0, 1, 0.1607843, 1,
-0.4143552, 0.1394638, -1.908578, 0, 1, 0.1647059, 1,
-0.4120702, -0.882487, -2.524744, 0, 1, 0.172549, 1,
-0.4117827, 0.07659352, -1.665343, 0, 1, 0.1764706, 1,
-0.4114787, 0.2502157, -2.607183, 0, 1, 0.1843137, 1,
-0.4096316, 1.359258, -1.593133, 0, 1, 0.1882353, 1,
-0.4080809, -2.372225, -4.253374, 0, 1, 0.1960784, 1,
-0.4037981, -0.1450915, -2.558446, 0, 1, 0.2039216, 1,
-0.3978098, -2.117518, -3.945372, 0, 1, 0.2078431, 1,
-0.393007, -0.6674525, -3.17555, 0, 1, 0.2156863, 1,
-0.3928822, 0.1562535, -1.520559, 0, 1, 0.2196078, 1,
-0.3828011, 0.7361345, -0.5953653, 0, 1, 0.227451, 1,
-0.3747795, -0.2948593, -3.866315, 0, 1, 0.2313726, 1,
-0.3734301, 0.4953841, -0.006632625, 0, 1, 0.2392157, 1,
-0.3728273, -1.859761, -4.248785, 0, 1, 0.2431373, 1,
-0.3705096, 0.5219496, 0.6823907, 0, 1, 0.2509804, 1,
-0.3676188, -1.274438, -1.565631, 0, 1, 0.254902, 1,
-0.360557, 0.1356744, -3.099526, 0, 1, 0.2627451, 1,
-0.3569799, -1.286018, -3.105196, 0, 1, 0.2666667, 1,
-0.3487059, -0.8115439, -2.596483, 0, 1, 0.2745098, 1,
-0.3427094, 2.023104, 0.2354423, 0, 1, 0.2784314, 1,
-0.3388973, -3.182878, -1.264227, 0, 1, 0.2862745, 1,
-0.333263, 0.2898534, -1.121746, 0, 1, 0.2901961, 1,
-0.3314624, -0.159757, -2.993456, 0, 1, 0.2980392, 1,
-0.331155, -1.253037, -1.766078, 0, 1, 0.3058824, 1,
-0.3297897, 0.7622676, -1.263608, 0, 1, 0.3098039, 1,
-0.32908, 0.6084286, -0.4546307, 0, 1, 0.3176471, 1,
-0.3281599, -0.5498566, -4.003149, 0, 1, 0.3215686, 1,
-0.3274776, -0.3585946, -3.669212, 0, 1, 0.3294118, 1,
-0.3253535, 0.2170452, -1.5436, 0, 1, 0.3333333, 1,
-0.3222876, 0.5843377, 0.2429958, 0, 1, 0.3411765, 1,
-0.311226, -0.4502816, -0.906934, 0, 1, 0.345098, 1,
-0.3049917, -0.5150997, -3.095831, 0, 1, 0.3529412, 1,
-0.3015403, -0.7653769, -2.164624, 0, 1, 0.3568628, 1,
-0.300763, 0.357815, -2.737476, 0, 1, 0.3647059, 1,
-0.3002266, -0.1074742, -2.924405, 0, 1, 0.3686275, 1,
-0.2981222, 0.7132464, -0.4852043, 0, 1, 0.3764706, 1,
-0.2913167, 0.6522706, -1.171789, 0, 1, 0.3803922, 1,
-0.2910503, -0.08714254, -1.322747, 0, 1, 0.3882353, 1,
-0.2899301, -0.2176676, -0.948038, 0, 1, 0.3921569, 1,
-0.2894033, 0.7030632, 0.3236768, 0, 1, 0.4, 1,
-0.2877407, 1.685345, -1.259568, 0, 1, 0.4078431, 1,
-0.2827697, 0.3117336, -0.07420254, 0, 1, 0.4117647, 1,
-0.2784515, -0.1064762, -2.269021, 0, 1, 0.4196078, 1,
-0.2749505, 0.7910654, -0.7961208, 0, 1, 0.4235294, 1,
-0.274221, 0.3637817, -1.177426, 0, 1, 0.4313726, 1,
-0.2727959, 0.5112854, -1.768755, 0, 1, 0.4352941, 1,
-0.2673481, 1.090039, -0.4878269, 0, 1, 0.4431373, 1,
-0.2671954, 1.533162, -0.2814219, 0, 1, 0.4470588, 1,
-0.2671531, 2.197426, -0.7581652, 0, 1, 0.454902, 1,
-0.263261, -0.6081674, -3.127169, 0, 1, 0.4588235, 1,
-0.2621295, 0.3021829, -1.281917, 0, 1, 0.4666667, 1,
-0.2599527, -3.416798, -3.166427, 0, 1, 0.4705882, 1,
-0.2492001, -0.07295633, -1.461517, 0, 1, 0.4784314, 1,
-0.2431099, 1.590379, -0.9844351, 0, 1, 0.4823529, 1,
-0.2421447, -0.952094, -1.02859, 0, 1, 0.4901961, 1,
-0.2380002, -0.3107029, -3.283756, 0, 1, 0.4941176, 1,
-0.2362473, -0.2257663, -2.540109, 0, 1, 0.5019608, 1,
-0.2337306, -0.8431342, -2.842455, 0, 1, 0.509804, 1,
-0.2297847, -0.04568684, 0.07009933, 0, 1, 0.5137255, 1,
-0.2269276, 0.3853563, -0.1172978, 0, 1, 0.5215687, 1,
-0.2241743, 0.2099479, -1.897041, 0, 1, 0.5254902, 1,
-0.2225357, 0.6648991, 1.007081, 0, 1, 0.5333334, 1,
-0.2218803, -0.5953807, -1.249637, 0, 1, 0.5372549, 1,
-0.2190347, -0.1626241, -2.433546, 0, 1, 0.5450981, 1,
-0.2183145, -0.01259733, -0.8727387, 0, 1, 0.5490196, 1,
-0.2173898, -0.1140989, -3.768456, 0, 1, 0.5568628, 1,
-0.2133997, -1.090016, -3.460902, 0, 1, 0.5607843, 1,
-0.2091394, -0.7137408, -2.538976, 0, 1, 0.5686275, 1,
-0.2071481, -0.6474764, -3.041185, 0, 1, 0.572549, 1,
-0.2062988, -0.8275203, -2.960523, 0, 1, 0.5803922, 1,
-0.2037133, -0.3570434, -2.551846, 0, 1, 0.5843138, 1,
-0.2019747, -1.759553, -2.266268, 0, 1, 0.5921569, 1,
-0.2007583, 1.041147, -0.8198316, 0, 1, 0.5960785, 1,
-0.2001968, 0.7590371, 0.5958596, 0, 1, 0.6039216, 1,
-0.1912204, -0.1351054, -2.449275, 0, 1, 0.6117647, 1,
-0.1891733, 1.037878, 0.4501455, 0, 1, 0.6156863, 1,
-0.1837078, 0.7416151, -0.4450357, 0, 1, 0.6235294, 1,
-0.1795735, -0.2722055, -2.618608, 0, 1, 0.627451, 1,
-0.1794789, 1.274588, 0.9327962, 0, 1, 0.6352941, 1,
-0.1767318, -1.922668, -2.109119, 0, 1, 0.6392157, 1,
-0.1755921, -0.4681933, -2.732805, 0, 1, 0.6470588, 1,
-0.1755403, -1.256725, -1.50339, 0, 1, 0.6509804, 1,
-0.1755361, -1.359587, -2.825256, 0, 1, 0.6588235, 1,
-0.1741729, -1.40182, -2.927402, 0, 1, 0.6627451, 1,
-0.1638242, -0.6737244, -1.167664, 0, 1, 0.6705883, 1,
-0.1601073, 2.016844, -0.5352607, 0, 1, 0.6745098, 1,
-0.1595865, -0.2015294, -4.356662, 0, 1, 0.682353, 1,
-0.1584763, 0.9968823, -0.5935405, 0, 1, 0.6862745, 1,
-0.1568678, -1.03656, -3.288432, 0, 1, 0.6941177, 1,
-0.1509992, 1.393364, 0.6101618, 0, 1, 0.7019608, 1,
-0.1474709, -1.474705, -2.324931, 0, 1, 0.7058824, 1,
-0.1447843, -0.4377995, -1.005779, 0, 1, 0.7137255, 1,
-0.1442921, 0.7687531, -1.770545, 0, 1, 0.7176471, 1,
-0.1437448, -0.3825518, -3.619351, 0, 1, 0.7254902, 1,
-0.1422621, -1.857462, -3.051668, 0, 1, 0.7294118, 1,
-0.1388421, 0.3951493, -2.667473, 0, 1, 0.7372549, 1,
-0.1300232, -1.358789, -4.307767, 0, 1, 0.7411765, 1,
-0.1232291, -1.279772, -1.629543, 0, 1, 0.7490196, 1,
-0.1207723, -1.665036, -2.612765, 0, 1, 0.7529412, 1,
-0.1199203, -0.445204, -1.592604, 0, 1, 0.7607843, 1,
-0.1195754, 1.151801, 1.052945, 0, 1, 0.7647059, 1,
-0.1191252, 1.555501, 0.7824439, 0, 1, 0.772549, 1,
-0.1170211, 0.818374, -0.3810433, 0, 1, 0.7764706, 1,
-0.1127155, 0.7613318, 0.6730563, 0, 1, 0.7843137, 1,
-0.1120494, -0.9134125, -3.322108, 0, 1, 0.7882353, 1,
-0.1097807, -0.0418196, -2.50477, 0, 1, 0.7960784, 1,
-0.1081197, -0.8242568, -4.024215, 0, 1, 0.8039216, 1,
-0.1040928, 0.9481691, -0.244604, 0, 1, 0.8078431, 1,
-0.09933778, 1.238233, 0.9942106, 0, 1, 0.8156863, 1,
-0.0990401, 0.296712, 2.911698, 0, 1, 0.8196079, 1,
-0.09895866, 1.17859, -0.5837482, 0, 1, 0.827451, 1,
-0.09187302, 0.3038268, -0.664176, 0, 1, 0.8313726, 1,
-0.09149981, 0.8571182, -0.5141228, 0, 1, 0.8392157, 1,
-0.09084801, -1.078235, -2.718869, 0, 1, 0.8431373, 1,
-0.09075881, -1.327191, -3.932892, 0, 1, 0.8509804, 1,
-0.08928006, -2.061164, -2.206045, 0, 1, 0.854902, 1,
-0.08709759, 0.3347012, 0.0427179, 0, 1, 0.8627451, 1,
-0.08706304, 0.08580783, -1.516912, 0, 1, 0.8666667, 1,
-0.08585977, 1.25939, -2.00671, 0, 1, 0.8745098, 1,
-0.08452139, -1.004464, -4.770853, 0, 1, 0.8784314, 1,
-0.08132512, 0.07097705, -1.918145, 0, 1, 0.8862745, 1,
-0.08062443, -0.7549294, -3.124383, 0, 1, 0.8901961, 1,
-0.07712565, -0.0614871, -2.74703, 0, 1, 0.8980392, 1,
-0.06619386, 0.6263524, 0.9866681, 0, 1, 0.9058824, 1,
-0.06474974, 0.8885826, -1.068611, 0, 1, 0.9098039, 1,
-0.06128073, 0.827289, 0.7870837, 0, 1, 0.9176471, 1,
-0.06108484, 0.353438, 1.624791, 0, 1, 0.9215686, 1,
-0.04988774, 0.2369835, 1.765551, 0, 1, 0.9294118, 1,
-0.04844948, 1.170963, -0.02910927, 0, 1, 0.9333333, 1,
-0.04756411, -0.5519708, -3.484164, 0, 1, 0.9411765, 1,
-0.04387178, -0.3228223, -2.860654, 0, 1, 0.945098, 1,
-0.04187606, 1.036885, -1.108981, 0, 1, 0.9529412, 1,
-0.03885125, -1.30746, -2.223337, 0, 1, 0.9568627, 1,
-0.03617041, 0.7171919, -0.8609259, 0, 1, 0.9647059, 1,
-0.03532456, 1.129646, -0.7262518, 0, 1, 0.9686275, 1,
-0.03083345, 0.06566994, -1.025241, 0, 1, 0.9764706, 1,
-0.02872162, -0.7970107, -4.147836, 0, 1, 0.9803922, 1,
-0.02725587, -1.305462, -4.537409, 0, 1, 0.9882353, 1,
-0.02633147, 1.539556, 0.4780997, 0, 1, 0.9921569, 1,
-0.02627612, 0.7092218, -0.226109, 0, 1, 1, 1,
-0.0250922, 0.05787609, -0.8811733, 0, 0.9921569, 1, 1,
-0.02306277, 0.2872916, 0.9833559, 0, 0.9882353, 1, 1,
-0.01967883, -0.9663139, -2.89818, 0, 0.9803922, 1, 1,
-0.01960881, -1.091483, -4.082203, 0, 0.9764706, 1, 1,
-0.01586411, -0.5626027, -2.950927, 0, 0.9686275, 1, 1,
-0.01402084, 0.7183672, -0.6337554, 0, 0.9647059, 1, 1,
-0.008933957, -1.565499, -1.958586, 0, 0.9568627, 1, 1,
-0.008015865, 0.5517038, 0.6437957, 0, 0.9529412, 1, 1,
0.0003319941, 0.8179149, -0.9146983, 0, 0.945098, 1, 1,
0.00249312, 0.2014616, -0.0556047, 0, 0.9411765, 1, 1,
0.002652396, 2.046437, 0.3317428, 0, 0.9333333, 1, 1,
0.002938734, 2.578656, -0.5001711, 0, 0.9294118, 1, 1,
0.005020082, 0.1459746, 0.5641639, 0, 0.9215686, 1, 1,
0.006900792, 0.118973, 0.5738797, 0, 0.9176471, 1, 1,
0.007129592, -0.7259387, 2.8881, 0, 0.9098039, 1, 1,
0.01073964, -0.5595528, 3.417953, 0, 0.9058824, 1, 1,
0.01525706, 2.088684, -1.163414, 0, 0.8980392, 1, 1,
0.01632385, -0.8371641, 2.979855, 0, 0.8901961, 1, 1,
0.01819705, 0.7199182, 1.863455, 0, 0.8862745, 1, 1,
0.02051166, 0.1645105, 1.284215, 0, 0.8784314, 1, 1,
0.02329895, -1.008832, 3.065054, 0, 0.8745098, 1, 1,
0.02381717, 1.105275, -0.7322807, 0, 0.8666667, 1, 1,
0.0253567, -0.6561623, 3.688967, 0, 0.8627451, 1, 1,
0.02575463, -1.366117, 2.838936, 0, 0.854902, 1, 1,
0.03063554, -0.5902429, 3.528627, 0, 0.8509804, 1, 1,
0.03140753, 0.6599883, -0.9394342, 0, 0.8431373, 1, 1,
0.03358293, 0.8863194, -0.3035691, 0, 0.8392157, 1, 1,
0.03607958, 0.8535802, -0.544013, 0, 0.8313726, 1, 1,
0.03705767, -0.7609855, 3.785021, 0, 0.827451, 1, 1,
0.04184991, -1.503621, 2.518617, 0, 0.8196079, 1, 1,
0.04303439, -1.309983, 2.875373, 0, 0.8156863, 1, 1,
0.04427278, 0.1622847, 2.319194, 0, 0.8078431, 1, 1,
0.04553816, -0.1011358, 2.048778, 0, 0.8039216, 1, 1,
0.05510796, 0.2265601, 0.3456985, 0, 0.7960784, 1, 1,
0.05665736, -1.555199, 3.050458, 0, 0.7882353, 1, 1,
0.06114145, -1.988119, 2.117473, 0, 0.7843137, 1, 1,
0.0624812, -0.7837216, 4.462965, 0, 0.7764706, 1, 1,
0.06264722, -0.3674045, 1.111431, 0, 0.772549, 1, 1,
0.06463936, -0.513081, 3.171247, 0, 0.7647059, 1, 1,
0.06670873, 0.3781911, 0.7861798, 0, 0.7607843, 1, 1,
0.068824, 0.6051543, 1.030559, 0, 0.7529412, 1, 1,
0.07161073, 0.4519507, 1.723004, 0, 0.7490196, 1, 1,
0.07388267, 0.4579191, 0.1393796, 0, 0.7411765, 1, 1,
0.07715606, -0.8486873, 0.7083792, 0, 0.7372549, 1, 1,
0.08139642, 1.10514, -0.2343827, 0, 0.7294118, 1, 1,
0.08706097, 1.715077, -0.01376716, 0, 0.7254902, 1, 1,
0.08870699, -0.1901632, 2.703584, 0, 0.7176471, 1, 1,
0.09040354, 0.5039383, 1.337817, 0, 0.7137255, 1, 1,
0.09080108, -1.089135, 1.939091, 0, 0.7058824, 1, 1,
0.09264159, 1.566591, 0.01379768, 0, 0.6980392, 1, 1,
0.1046223, -0.08310629, 1.641138, 0, 0.6941177, 1, 1,
0.1069041, 0.03971724, 1.109096, 0, 0.6862745, 1, 1,
0.1078569, 0.5663907, -0.3678757, 0, 0.682353, 1, 1,
0.1144754, -1.215192, 4.192459, 0, 0.6745098, 1, 1,
0.1163973, 2.256648, -0.8692284, 0, 0.6705883, 1, 1,
0.1178433, 0.3793683, 1.19802, 0, 0.6627451, 1, 1,
0.1184631, -0.003926078, 2.749159, 0, 0.6588235, 1, 1,
0.1213239, -0.9130102, 3.704941, 0, 0.6509804, 1, 1,
0.1228843, -1.393716, 5.218648, 0, 0.6470588, 1, 1,
0.1249851, -0.3180225, 2.931099, 0, 0.6392157, 1, 1,
0.1313377, -0.03954772, 0.7425829, 0, 0.6352941, 1, 1,
0.1323556, 1.984084, -0.7474948, 0, 0.627451, 1, 1,
0.1359829, 0.9971884, 0.9211491, 0, 0.6235294, 1, 1,
0.1373284, 0.4452994, -0.8465567, 0, 0.6156863, 1, 1,
0.1389844, 1.953088, -1.82908, 0, 0.6117647, 1, 1,
0.1398129, -1.610668, 2.546719, 0, 0.6039216, 1, 1,
0.1421742, 0.9008346, -0.6939753, 0, 0.5960785, 1, 1,
0.1505915, -1.355348, 2.127218, 0, 0.5921569, 1, 1,
0.1537907, 0.930719, 1.484681, 0, 0.5843138, 1, 1,
0.1580615, 0.7073238, 0.445759, 0, 0.5803922, 1, 1,
0.162353, -1.553733, 1.233756, 0, 0.572549, 1, 1,
0.1636326, -0.2400256, 4.77745, 0, 0.5686275, 1, 1,
0.1717912, -0.2246278, 1.439934, 0, 0.5607843, 1, 1,
0.1721971, 0.05473638, 0.6695082, 0, 0.5568628, 1, 1,
0.1763027, -0.3005047, 2.500072, 0, 0.5490196, 1, 1,
0.1779723, 1.024834, -0.1783335, 0, 0.5450981, 1, 1,
0.1782217, -0.2686508, 2.214923, 0, 0.5372549, 1, 1,
0.1800687, -1.115032, 2.668857, 0, 0.5333334, 1, 1,
0.190481, 3.000895, 1.608684, 0, 0.5254902, 1, 1,
0.19326, -0.5477045, 3.77087, 0, 0.5215687, 1, 1,
0.1985925, -1.1236, 1.551003, 0, 0.5137255, 1, 1,
0.2068349, 0.5490947, 0.8490884, 0, 0.509804, 1, 1,
0.2140157, -0.08922976, 2.244052, 0, 0.5019608, 1, 1,
0.2157888, -2.223168, 3.546039, 0, 0.4941176, 1, 1,
0.2192388, 0.2494624, 0.6784909, 0, 0.4901961, 1, 1,
0.2197534, 0.4723174, 0.874484, 0, 0.4823529, 1, 1,
0.2224625, 0.4092762, 0.5633323, 0, 0.4784314, 1, 1,
0.2306153, -0.01092264, 3.008166, 0, 0.4705882, 1, 1,
0.2378915, 0.4144364, -0.2465996, 0, 0.4666667, 1, 1,
0.2391137, 0.1629224, 2.083393, 0, 0.4588235, 1, 1,
0.2407712, 1.261356, -0.1593097, 0, 0.454902, 1, 1,
0.24142, 0.8262361, 0.7236185, 0, 0.4470588, 1, 1,
0.2417496, 0.2409019, 0.05078239, 0, 0.4431373, 1, 1,
0.2453549, -0.6746572, 3.45646, 0, 0.4352941, 1, 1,
0.2481693, -1.737315, 2.391829, 0, 0.4313726, 1, 1,
0.2494612, 0.6901819, 1.273176, 0, 0.4235294, 1, 1,
0.249822, -0.2506899, 3.071153, 0, 0.4196078, 1, 1,
0.2531752, -0.556623, 3.761825, 0, 0.4117647, 1, 1,
0.2538437, 0.1328684, 1.564636, 0, 0.4078431, 1, 1,
0.2559281, -0.7590496, 3.424433, 0, 0.4, 1, 1,
0.2602264, 0.4092081, 1.37923, 0, 0.3921569, 1, 1,
0.26329, -1.508703, 3.255008, 0, 0.3882353, 1, 1,
0.2663288, 0.2573292, 0.2569319, 0, 0.3803922, 1, 1,
0.2700932, 2.572496, 1.561409, 0, 0.3764706, 1, 1,
0.272381, 0.5334097, 1.586535, 0, 0.3686275, 1, 1,
0.2767685, 0.2613675, 1.174895, 0, 0.3647059, 1, 1,
0.2871598, 0.07695601, 0.261088, 0, 0.3568628, 1, 1,
0.2881639, -0.7186444, 3.791359, 0, 0.3529412, 1, 1,
0.28861, 0.09780264, 0.7090369, 0, 0.345098, 1, 1,
0.2914684, 1.984549, -0.4357447, 0, 0.3411765, 1, 1,
0.2956025, 2.585283, 0.6140679, 0, 0.3333333, 1, 1,
0.3004845, 0.181564, 2.98431, 0, 0.3294118, 1, 1,
0.3103284, -1.063048, 4.003051, 0, 0.3215686, 1, 1,
0.3126591, 1.837794, 0.5319125, 0, 0.3176471, 1, 1,
0.3138706, 0.5329056, -0.5311013, 0, 0.3098039, 1, 1,
0.3212583, 0.8010574, 1.248072, 0, 0.3058824, 1, 1,
0.3213547, 0.9706805, -1.756776, 0, 0.2980392, 1, 1,
0.3220582, -0.8912064, 3.107165, 0, 0.2901961, 1, 1,
0.3249586, -0.2054111, 3.969058, 0, 0.2862745, 1, 1,
0.3256984, -0.06446336, 2.657125, 0, 0.2784314, 1, 1,
0.3291031, -1.11074, 1.92658, 0, 0.2745098, 1, 1,
0.3382969, 0.140999, 0.7138422, 0, 0.2666667, 1, 1,
0.3393216, -0.608834, 3.362637, 0, 0.2627451, 1, 1,
0.3403397, 1.083498, 0.4342219, 0, 0.254902, 1, 1,
0.3404905, -0.110964, 3.012044, 0, 0.2509804, 1, 1,
0.3433609, -1.033952, 3.593, 0, 0.2431373, 1, 1,
0.3491594, 0.6518496, 1.423681, 0, 0.2392157, 1, 1,
0.353145, -0.4093979, 2.032844, 0, 0.2313726, 1, 1,
0.353344, 0.6066059, -0.3266767, 0, 0.227451, 1, 1,
0.3554548, 0.646568, 0.7811057, 0, 0.2196078, 1, 1,
0.3568461, -1.617598, 2.721708, 0, 0.2156863, 1, 1,
0.3578166, -1.52804, 4.841093, 0, 0.2078431, 1, 1,
0.3625209, -0.09941325, 2.631841, 0, 0.2039216, 1, 1,
0.3630674, 0.6805126, 1.043943, 0, 0.1960784, 1, 1,
0.3637946, 0.1904261, 1.775867, 0, 0.1882353, 1, 1,
0.3734804, -0.3099279, 3.221469, 0, 0.1843137, 1, 1,
0.3760153, 0.6594954, 0.1370182, 0, 0.1764706, 1, 1,
0.3805394, -0.828124, 2.660547, 0, 0.172549, 1, 1,
0.3826151, -0.400518, 3.057087, 0, 0.1647059, 1, 1,
0.387179, 0.2754276, -0.71579, 0, 0.1607843, 1, 1,
0.3878469, -0.1759551, 1.443225, 0, 0.1529412, 1, 1,
0.3931146, 1.418893, -0.6670665, 0, 0.1490196, 1, 1,
0.3936926, 1.789228, -1.15059, 0, 0.1411765, 1, 1,
0.3989387, 0.6000948, 0.1342699, 0, 0.1372549, 1, 1,
0.4062625, -0.126912, 2.359991, 0, 0.1294118, 1, 1,
0.4064275, -0.5615357, 1.998749, 0, 0.1254902, 1, 1,
0.4085073, -0.08314466, 2.342581, 0, 0.1176471, 1, 1,
0.4154229, 0.06687743, 0.5645944, 0, 0.1137255, 1, 1,
0.4169447, 0.375216, 2.654764, 0, 0.1058824, 1, 1,
0.4179041, -0.8738669, 2.774137, 0, 0.09803922, 1, 1,
0.4202239, 1.047946, -0.3056459, 0, 0.09411765, 1, 1,
0.4211752, 1.448509, -1.332319, 0, 0.08627451, 1, 1,
0.4241737, -0.815913, 3.80844, 0, 0.08235294, 1, 1,
0.4291949, 0.273446, 1.551095, 0, 0.07450981, 1, 1,
0.4323262, 0.2432724, 0.8869998, 0, 0.07058824, 1, 1,
0.4327559, -1.268867, 2.986226, 0, 0.0627451, 1, 1,
0.4341783, 0.1608186, -0.271787, 0, 0.05882353, 1, 1,
0.4379663, -1.676237, 1.324063, 0, 0.05098039, 1, 1,
0.4420311, -0.5935631, 3.843404, 0, 0.04705882, 1, 1,
0.4461592, -0.8247055, 2.941603, 0, 0.03921569, 1, 1,
0.4489116, 0.8048989, 0.3803368, 0, 0.03529412, 1, 1,
0.4514534, 1.895572, 2.080775, 0, 0.02745098, 1, 1,
0.4526318, 2.292944, -0.3317902, 0, 0.02352941, 1, 1,
0.4571829, 0.1613616, -0.5083356, 0, 0.01568628, 1, 1,
0.459933, 0.5322326, 0.8952029, 0, 0.01176471, 1, 1,
0.4616529, 0.9632407, 0.8314015, 0, 0.003921569, 1, 1,
0.4619395, -0.004848748, 0.4859385, 0.003921569, 0, 1, 1,
0.4632104, -0.2780189, 1.97594, 0.007843138, 0, 1, 1,
0.4663301, 0.5399688, 0.08665198, 0.01568628, 0, 1, 1,
0.4680189, -0.8277826, 3.345767, 0.01960784, 0, 1, 1,
0.4682724, 0.2245561, 0.928961, 0.02745098, 0, 1, 1,
0.4729674, -0.9612758, 1.947166, 0.03137255, 0, 1, 1,
0.4749098, -0.1908719, 3.3541, 0.03921569, 0, 1, 1,
0.4759809, 0.6531861, 0.2410909, 0.04313726, 0, 1, 1,
0.4775565, -0.5730137, 1.069865, 0.05098039, 0, 1, 1,
0.4784358, 0.4990036, -0.5785085, 0.05490196, 0, 1, 1,
0.4807006, 0.318966, 1.087151, 0.0627451, 0, 1, 1,
0.4844346, 1.26585, 0.3120478, 0.06666667, 0, 1, 1,
0.4860635, 0.596262, 1.523141, 0.07450981, 0, 1, 1,
0.4869023, 1.035766, 1.747193, 0.07843138, 0, 1, 1,
0.4970647, 0.6529596, 0.7798969, 0.08627451, 0, 1, 1,
0.4977699, -1.525755, 1.931372, 0.09019608, 0, 1, 1,
0.4981627, -3.252421, 5.16293, 0.09803922, 0, 1, 1,
0.5022421, 1.21148, 2.399223, 0.1058824, 0, 1, 1,
0.5110281, 0.6761162, 1.172655, 0.1098039, 0, 1, 1,
0.5125241, 0.4315287, 0.9921985, 0.1176471, 0, 1, 1,
0.5155843, 0.0963944, 0.7092929, 0.1215686, 0, 1, 1,
0.516699, 0.269597, 2.267411, 0.1294118, 0, 1, 1,
0.5188952, -0.4664567, 3.939163, 0.1333333, 0, 1, 1,
0.5200503, -0.02664281, 2.294233, 0.1411765, 0, 1, 1,
0.5257874, 0.5137078, 0.425967, 0.145098, 0, 1, 1,
0.5267723, -1.130709, 2.155051, 0.1529412, 0, 1, 1,
0.5269353, -0.09987541, 0.7847148, 0.1568628, 0, 1, 1,
0.5313893, -0.03430323, 1.047472, 0.1647059, 0, 1, 1,
0.5314746, -0.5302414, 3.253909, 0.1686275, 0, 1, 1,
0.5354173, 0.1334886, 2.10998, 0.1764706, 0, 1, 1,
0.5387495, 0.2095174, 1.40962, 0.1803922, 0, 1, 1,
0.5415916, 1.029259, 0.6571742, 0.1882353, 0, 1, 1,
0.5437559, 0.3441532, 2.837968, 0.1921569, 0, 1, 1,
0.5471442, 0.7389621, 2.031484, 0.2, 0, 1, 1,
0.5599876, 0.1203922, 0.3864564, 0.2078431, 0, 1, 1,
0.5609454, -0.0910756, 2.790154, 0.2117647, 0, 1, 1,
0.5613865, -0.2187348, 2.46474, 0.2196078, 0, 1, 1,
0.566749, -2.543433, 3.733457, 0.2235294, 0, 1, 1,
0.5670424, -0.7564933, 2.482858, 0.2313726, 0, 1, 1,
0.5677527, -0.694876, 1.621592, 0.2352941, 0, 1, 1,
0.567912, 0.3531924, 1.473471, 0.2431373, 0, 1, 1,
0.5694329, -0.8914784, 3.023486, 0.2470588, 0, 1, 1,
0.5706449, 0.3083656, 0.0264707, 0.254902, 0, 1, 1,
0.5712257, 0.4119179, 0.9470834, 0.2588235, 0, 1, 1,
0.5773338, 0.07524853, 1.238657, 0.2666667, 0, 1, 1,
0.5939289, 0.0558467, 0.9772713, 0.2705882, 0, 1, 1,
0.5942478, -0.3935602, 2.514774, 0.2784314, 0, 1, 1,
0.5945618, 0.03223005, 2.855414, 0.282353, 0, 1, 1,
0.5950296, -0.332584, 0.275592, 0.2901961, 0, 1, 1,
0.6005602, 0.3733187, 0.01151343, 0.2941177, 0, 1, 1,
0.6050562, -0.1786348, 0.02832816, 0.3019608, 0, 1, 1,
0.6079616, 0.121508, 2.158127, 0.3098039, 0, 1, 1,
0.6086388, -0.227855, 1.211671, 0.3137255, 0, 1, 1,
0.610466, 0.7392213, -0.532173, 0.3215686, 0, 1, 1,
0.6187552, 1.25448, 2.280587, 0.3254902, 0, 1, 1,
0.6211603, -0.6260182, 2.980415, 0.3333333, 0, 1, 1,
0.6219006, -0.6616837, 1.20634, 0.3372549, 0, 1, 1,
0.6225008, 0.6660156, 1.211714, 0.345098, 0, 1, 1,
0.6258659, -1.351092, 3.487046, 0.3490196, 0, 1, 1,
0.6276684, 0.8278927, 1.374974, 0.3568628, 0, 1, 1,
0.6288497, -0.8187299, 2.260366, 0.3607843, 0, 1, 1,
0.6299414, 0.7279912, -0.4973956, 0.3686275, 0, 1, 1,
0.6428891, 0.7340798, 0.4781855, 0.372549, 0, 1, 1,
0.6571717, -0.9661968, 1.984711, 0.3803922, 0, 1, 1,
0.6590086, -0.5258124, 0.9439526, 0.3843137, 0, 1, 1,
0.6628201, -1.191406, 3.376983, 0.3921569, 0, 1, 1,
0.6642423, 1.174582, 0.2229327, 0.3960784, 0, 1, 1,
0.6651813, -0.2886186, 2.261488, 0.4039216, 0, 1, 1,
0.6659085, 0.4482109, -0.7849995, 0.4117647, 0, 1, 1,
0.6661615, 0.3267286, -0.5702949, 0.4156863, 0, 1, 1,
0.6668785, 0.6992391, 0.4189686, 0.4235294, 0, 1, 1,
0.6690996, -0.2134812, 2.802011, 0.427451, 0, 1, 1,
0.669678, 0.2121858, 1.986024, 0.4352941, 0, 1, 1,
0.6711648, 0.1299284, 0.4133798, 0.4392157, 0, 1, 1,
0.6734079, 0.6008657, 2.701045, 0.4470588, 0, 1, 1,
0.6820995, -0.7045954, 1.207994, 0.4509804, 0, 1, 1,
0.6823626, -0.9153124, 1.592728, 0.4588235, 0, 1, 1,
0.6860253, -0.278986, 1.973497, 0.4627451, 0, 1, 1,
0.6881669, -0.1991269, 2.573578, 0.4705882, 0, 1, 1,
0.7080647, -0.9431672, 1.197825, 0.4745098, 0, 1, 1,
0.7102178, 0.4811326, 0.7765012, 0.4823529, 0, 1, 1,
0.7103092, -0.3320761, 1.926741, 0.4862745, 0, 1, 1,
0.7146705, 1.035102, 1.247176, 0.4941176, 0, 1, 1,
0.7242419, -0.73643, 2.705198, 0.5019608, 0, 1, 1,
0.7249801, -1.329678, 3.442399, 0.5058824, 0, 1, 1,
0.7280614, -0.679995, 1.910916, 0.5137255, 0, 1, 1,
0.7290636, -0.05887006, 2.582769, 0.5176471, 0, 1, 1,
0.7295417, 0.7052169, 1.041284, 0.5254902, 0, 1, 1,
0.7310899, -0.902643, 3.262, 0.5294118, 0, 1, 1,
0.7325051, -0.758039, 2.065476, 0.5372549, 0, 1, 1,
0.7360876, -0.6868085, 3.566386, 0.5411765, 0, 1, 1,
0.7370721, -0.3345842, 1.887669, 0.5490196, 0, 1, 1,
0.7397157, 0.1491037, -0.9775031, 0.5529412, 0, 1, 1,
0.7425737, -0.8455601, 2.96394, 0.5607843, 0, 1, 1,
0.7441575, -0.2039859, 2.093728, 0.5647059, 0, 1, 1,
0.744792, 0.9219334, 1.264841, 0.572549, 0, 1, 1,
0.7509998, 0.6374598, 2.190832, 0.5764706, 0, 1, 1,
0.7557473, -0.3040239, 2.51424, 0.5843138, 0, 1, 1,
0.7635783, 0.7551421, -0.7168384, 0.5882353, 0, 1, 1,
0.7640491, 0.6507815, 0.1598113, 0.5960785, 0, 1, 1,
0.768522, 0.5519806, -0.5562819, 0.6039216, 0, 1, 1,
0.770395, -0.4851516, 1.247209, 0.6078432, 0, 1, 1,
0.7711343, -0.05301258, 1.522391, 0.6156863, 0, 1, 1,
0.7724907, -1.421855, 2.965489, 0.6196079, 0, 1, 1,
0.7752088, -0.4747063, 1.960754, 0.627451, 0, 1, 1,
0.7878333, 1.378451, 0.3479567, 0.6313726, 0, 1, 1,
0.7951796, 0.432924, 1.263176, 0.6392157, 0, 1, 1,
0.7952137, 0.7428904, 0.8480798, 0.6431373, 0, 1, 1,
0.7983134, 0.0898177, 2.212063, 0.6509804, 0, 1, 1,
0.8050529, 0.7602235, 0.7682923, 0.654902, 0, 1, 1,
0.8073995, 0.4243352, 0.5179383, 0.6627451, 0, 1, 1,
0.8148821, 0.3077713, 0.773625, 0.6666667, 0, 1, 1,
0.8168554, -0.138563, 2.668877, 0.6745098, 0, 1, 1,
0.8222358, -1.189002, 2.729784, 0.6784314, 0, 1, 1,
0.8402014, -0.3000105, -0.8987455, 0.6862745, 0, 1, 1,
0.8423997, -0.9861133, 1.013134, 0.6901961, 0, 1, 1,
0.8460968, -2.040558, 1.458189, 0.6980392, 0, 1, 1,
0.8463595, -0.207536, 2.615255, 0.7058824, 0, 1, 1,
0.847465, 2.164883, -0.4010736, 0.7098039, 0, 1, 1,
0.8489211, -0.6288939, 0.996215, 0.7176471, 0, 1, 1,
0.852921, 1.741441, -0.456578, 0.7215686, 0, 1, 1,
0.8555797, 1.062155, -0.4807013, 0.7294118, 0, 1, 1,
0.8560084, -0.5614624, 3.072534, 0.7333333, 0, 1, 1,
0.860689, -1.323598, 2.712567, 0.7411765, 0, 1, 1,
0.8611621, -0.2133735, 2.005315, 0.7450981, 0, 1, 1,
0.8627387, -0.03138081, 2.466233, 0.7529412, 0, 1, 1,
0.8669091, 0.1484734, 4.195631, 0.7568628, 0, 1, 1,
0.8695629, 1.325648, 2.115776, 0.7647059, 0, 1, 1,
0.8706336, 0.5304807, 0.08978905, 0.7686275, 0, 1, 1,
0.8804714, 0.03579049, 1.965225, 0.7764706, 0, 1, 1,
0.8832883, 1.007737, -1.463304, 0.7803922, 0, 1, 1,
0.8860563, -0.1538054, 3.437322, 0.7882353, 0, 1, 1,
0.8863923, 0.9625199, 1.528104, 0.7921569, 0, 1, 1,
0.8892125, 1.855703, -1.534777, 0.8, 0, 1, 1,
0.8901154, 1.516791, 2.271421, 0.8078431, 0, 1, 1,
0.8996225, -1.154758, 2.555645, 0.8117647, 0, 1, 1,
0.9078285, -0.4318144, 2.141382, 0.8196079, 0, 1, 1,
0.908796, -0.07800055, 3.017176, 0.8235294, 0, 1, 1,
0.9094114, -0.430363, 1.797911, 0.8313726, 0, 1, 1,
0.9130893, 0.3051687, 1.154126, 0.8352941, 0, 1, 1,
0.9162242, -0.8580136, 4.785145, 0.8431373, 0, 1, 1,
0.9197281, 0.1760151, 1.459563, 0.8470588, 0, 1, 1,
0.9273455, 0.6623441, 1.766988, 0.854902, 0, 1, 1,
0.9327229, 0.01339693, -0.4780534, 0.8588235, 0, 1, 1,
0.936968, -0.6831439, 1.558944, 0.8666667, 0, 1, 1,
0.9413183, 1.406637, -0.7557501, 0.8705882, 0, 1, 1,
0.9481173, 0.1735413, -0.07710095, 0.8784314, 0, 1, 1,
0.9572027, -1.391307, 4.550231, 0.8823529, 0, 1, 1,
0.9617625, -1.423199, 3.291656, 0.8901961, 0, 1, 1,
0.9671262, -1.897102, 2.465218, 0.8941177, 0, 1, 1,
0.9673081, 0.2491979, 1.302472, 0.9019608, 0, 1, 1,
0.9702435, -0.5852455, 2.829571, 0.9098039, 0, 1, 1,
0.973887, -0.04727478, 2.860753, 0.9137255, 0, 1, 1,
0.9817947, 0.2852381, 2.684813, 0.9215686, 0, 1, 1,
1.001172, 0.902326, 2.379552, 0.9254902, 0, 1, 1,
1.002064, 0.2465863, 0.6894138, 0.9333333, 0, 1, 1,
1.00333, 0.5127011, -0.1679575, 0.9372549, 0, 1, 1,
1.00393, 1.510914, -0.6714041, 0.945098, 0, 1, 1,
1.011844, -0.130457, 1.711573, 0.9490196, 0, 1, 1,
1.017251, 0.4428863, 1.330458, 0.9568627, 0, 1, 1,
1.020439, 0.4911759, -0.05316087, 0.9607843, 0, 1, 1,
1.021205, 0.1108288, 0.1064984, 0.9686275, 0, 1, 1,
1.022785, 1.941978, 0.1729546, 0.972549, 0, 1, 1,
1.039243, 0.2805888, 1.210416, 0.9803922, 0, 1, 1,
1.048305, -1.125653, 2.412805, 0.9843137, 0, 1, 1,
1.049551, -0.7277545, 4.000706, 0.9921569, 0, 1, 1,
1.051415, 0.3026631, 0.7598792, 0.9960784, 0, 1, 1,
1.053707, -1.679065, 2.163474, 1, 0, 0.9960784, 1,
1.056796, 0.8884737, 0.1613328, 1, 0, 0.9882353, 1,
1.060486, -0.09169444, -0.03532472, 1, 0, 0.9843137, 1,
1.068077, 0.463729, -0.262476, 1, 0, 0.9764706, 1,
1.068551, 1.391936, 1.804504, 1, 0, 0.972549, 1,
1.069163, 0.1752061, 1.280148, 1, 0, 0.9647059, 1,
1.069826, 1.444187, 0.4217767, 1, 0, 0.9607843, 1,
1.072045, -0.02057005, 2.144413, 1, 0, 0.9529412, 1,
1.073179, 0.1859979, 0.4885304, 1, 0, 0.9490196, 1,
1.074028, 0.534148, 2.131532, 1, 0, 0.9411765, 1,
1.083823, 0.8373298, 0.2331903, 1, 0, 0.9372549, 1,
1.086164, 0.1211779, 0.3720159, 1, 0, 0.9294118, 1,
1.086861, -0.1622801, 1.141723, 1, 0, 0.9254902, 1,
1.100888, -0.8640993, 3.435831, 1, 0, 0.9176471, 1,
1.103926, 0.7336968, 1.743253, 1, 0, 0.9137255, 1,
1.110853, 0.03469571, 0.1405151, 1, 0, 0.9058824, 1,
1.115325, -1.669853, 2.051718, 1, 0, 0.9019608, 1,
1.126071, 0.1049287, -0.2259351, 1, 0, 0.8941177, 1,
1.126768, -0.4298976, 3.074536, 1, 0, 0.8862745, 1,
1.128397, 0.3033994, 1.251715, 1, 0, 0.8823529, 1,
1.129609, 1.014556, 0.7456309, 1, 0, 0.8745098, 1,
1.130526, 0.4299818, 0.6234908, 1, 0, 0.8705882, 1,
1.13254, -0.1302665, 2.695762, 1, 0, 0.8627451, 1,
1.135506, -0.4267335, 1.391944, 1, 0, 0.8588235, 1,
1.150054, -0.4234215, 3.209383, 1, 0, 0.8509804, 1,
1.155332, -0.02316975, 0.9313084, 1, 0, 0.8470588, 1,
1.155381, 1.735082, 1.391792, 1, 0, 0.8392157, 1,
1.165083, -0.801632, 1.856733, 1, 0, 0.8352941, 1,
1.168337, 0.9340327, 1.554976, 1, 0, 0.827451, 1,
1.17317, -0.5663551, 0.8256658, 1, 0, 0.8235294, 1,
1.181484, 0.1518211, 1.160693, 1, 0, 0.8156863, 1,
1.182301, 0.07956478, 0.0401979, 1, 0, 0.8117647, 1,
1.182605, 0.1809945, 1.248542, 1, 0, 0.8039216, 1,
1.185663, 0.7274246, 0.1668582, 1, 0, 0.7960784, 1,
1.190634, 0.4009534, 1.018521, 1, 0, 0.7921569, 1,
1.191249, 0.487549, -0.1499395, 1, 0, 0.7843137, 1,
1.191348, 0.4194931, 0.2885756, 1, 0, 0.7803922, 1,
1.202521, -0.2477734, 1.132963, 1, 0, 0.772549, 1,
1.203573, -1.313467, 4.489106, 1, 0, 0.7686275, 1,
1.221928, -0.1256665, 1.329899, 1, 0, 0.7607843, 1,
1.224655, 0.897593, 0.9999759, 1, 0, 0.7568628, 1,
1.229564, -2.233938, 2.660437, 1, 0, 0.7490196, 1,
1.232357, -0.5539522, 3.448214, 1, 0, 0.7450981, 1,
1.257383, 1.185641, -0.5738425, 1, 0, 0.7372549, 1,
1.257457, -0.1535877, 3.110496, 1, 0, 0.7333333, 1,
1.270883, -1.451541, 2.560335, 1, 0, 0.7254902, 1,
1.271052, 1.061672, 0.9596781, 1, 0, 0.7215686, 1,
1.271061, 0.5949043, 1.401047, 1, 0, 0.7137255, 1,
1.288172, 0.2912377, 1.050523, 1, 0, 0.7098039, 1,
1.29864, -0.3401532, 0.5063631, 1, 0, 0.7019608, 1,
1.30762, -0.5362948, 1.85024, 1, 0, 0.6941177, 1,
1.313157, 0.7542834, 0.1967456, 1, 0, 0.6901961, 1,
1.316105, -0.9766003, 2.074792, 1, 0, 0.682353, 1,
1.320019, -0.1292649, 1.541253, 1, 0, 0.6784314, 1,
1.326943, -0.276246, 2.456218, 1, 0, 0.6705883, 1,
1.336513, 0.502925, -1.655161, 1, 0, 0.6666667, 1,
1.348238, 1.196035, 2.572768, 1, 0, 0.6588235, 1,
1.348376, -0.1587113, 1.451133, 1, 0, 0.654902, 1,
1.350628, -0.5982156, 2.21822, 1, 0, 0.6470588, 1,
1.35203, 2.061409, 0.3435201, 1, 0, 0.6431373, 1,
1.357512, -0.2701582, 3.600066, 1, 0, 0.6352941, 1,
1.367415, 0.6647057, 1.74775, 1, 0, 0.6313726, 1,
1.370685, 0.9384891, -0.3561054, 1, 0, 0.6235294, 1,
1.371179, 0.5538256, 1.824885, 1, 0, 0.6196079, 1,
1.380365, -0.3138537, 0.4145303, 1, 0, 0.6117647, 1,
1.386233, -1.241783, 0.1137543, 1, 0, 0.6078432, 1,
1.393469, 0.690827, 1.103932, 1, 0, 0.6, 1,
1.409835, 0.5393392, 1.487492, 1, 0, 0.5921569, 1,
1.413599, -0.3049169, 2.130466, 1, 0, 0.5882353, 1,
1.425018, 2.013341, 2.367131, 1, 0, 0.5803922, 1,
1.425587, 0.541238, 2.239419, 1, 0, 0.5764706, 1,
1.430438, 0.8073611, 1.662025, 1, 0, 0.5686275, 1,
1.436103, -0.430873, 2.353156, 1, 0, 0.5647059, 1,
1.436244, 1.19072, 1.03932, 1, 0, 0.5568628, 1,
1.440352, 0.353335, -0.0486653, 1, 0, 0.5529412, 1,
1.442017, -1.55576, 2.4611, 1, 0, 0.5450981, 1,
1.453931, -0.1685271, 2.713914, 1, 0, 0.5411765, 1,
1.467265, -0.8123467, 1.504812, 1, 0, 0.5333334, 1,
1.477069, -0.5159294, 1.604661, 1, 0, 0.5294118, 1,
1.485095, 0.7086493, 2.364353, 1, 0, 0.5215687, 1,
1.486475, -0.005774125, 2.067491, 1, 0, 0.5176471, 1,
1.495777, -0.9456215, 0.8489203, 1, 0, 0.509804, 1,
1.496541, -2.074396, 2.244155, 1, 0, 0.5058824, 1,
1.502023, -0.2338313, 1.364496, 1, 0, 0.4980392, 1,
1.50524, -0.9393777, 2.307184, 1, 0, 0.4901961, 1,
1.514748, 0.819249, 2.360655, 1, 0, 0.4862745, 1,
1.516955, 0.4023455, 0.7227291, 1, 0, 0.4784314, 1,
1.529504, 1.17555, -0.382628, 1, 0, 0.4745098, 1,
1.533722, 0.916943, -0.5338798, 1, 0, 0.4666667, 1,
1.544385, 0.8319034, -1.139631, 1, 0, 0.4627451, 1,
1.546978, -0.4620956, 1.293569, 1, 0, 0.454902, 1,
1.569758, -1.946014, 2.632146, 1, 0, 0.4509804, 1,
1.570307, -0.7197369, 2.957121, 1, 0, 0.4431373, 1,
1.583559, -0.3979098, 2.611901, 1, 0, 0.4392157, 1,
1.591281, -0.25165, 2.977165, 1, 0, 0.4313726, 1,
1.60469, 1.226662, 1.251534, 1, 0, 0.427451, 1,
1.606585, -1.34283, 1.56209, 1, 0, 0.4196078, 1,
1.612441, 0.02564135, 1.504964, 1, 0, 0.4156863, 1,
1.612996, -0.3357372, 2.332477, 1, 0, 0.4078431, 1,
1.618918, 0.9618185, 1.41248, 1, 0, 0.4039216, 1,
1.620309, -0.5945793, 2.782775, 1, 0, 0.3960784, 1,
1.63056, -1.095788, 1.755965, 1, 0, 0.3882353, 1,
1.633268, -0.7362478, 2.198416, 1, 0, 0.3843137, 1,
1.634616, -2.0464, 0.8368273, 1, 0, 0.3764706, 1,
1.63592, -0.6451945, 2.371624, 1, 0, 0.372549, 1,
1.650444, 1.304211, 2.149025, 1, 0, 0.3647059, 1,
1.65352, 0.04352378, 1.549548, 1, 0, 0.3607843, 1,
1.65981, 0.57088, 1.25878, 1, 0, 0.3529412, 1,
1.682879, -0.3029605, 1.44053, 1, 0, 0.3490196, 1,
1.687115, 2.280278, 1.092313, 1, 0, 0.3411765, 1,
1.703902, 0.008754449, 1.37142, 1, 0, 0.3372549, 1,
1.704886, -1.040201, 1.685961, 1, 0, 0.3294118, 1,
1.713937, 0.3864022, 1.491452, 1, 0, 0.3254902, 1,
1.718375, -0.4092193, 2.401964, 1, 0, 0.3176471, 1,
1.72759, -0.4046747, 3.458326, 1, 0, 0.3137255, 1,
1.730681, -1.33979, 3.191211, 1, 0, 0.3058824, 1,
1.73325, 0.408605, 1.575849, 1, 0, 0.2980392, 1,
1.733536, -1.599658, 1.989406, 1, 0, 0.2941177, 1,
1.736851, 0.08632228, 2.251067, 1, 0, 0.2862745, 1,
1.772477, -0.139206, 2.366972, 1, 0, 0.282353, 1,
1.773165, 0.182422, 1.642551, 1, 0, 0.2745098, 1,
1.821123, -0.71797, 1.814145, 1, 0, 0.2705882, 1,
1.823427, -2.110018, 3.511678, 1, 0, 0.2627451, 1,
1.835794, 0.416647, 0.1176914, 1, 0, 0.2588235, 1,
1.845572, 0.6181709, 1.08538, 1, 0, 0.2509804, 1,
1.876104, -2.300962, 2.276396, 1, 0, 0.2470588, 1,
1.879784, -0.8822893, 1.269043, 1, 0, 0.2392157, 1,
1.879945, -1.239663, 1.676976, 1, 0, 0.2352941, 1,
1.899221, 0.8833658, 2.071386, 1, 0, 0.227451, 1,
1.93294, -0.1937246, 1.201149, 1, 0, 0.2235294, 1,
1.95922, -0.2932638, -0.5688267, 1, 0, 0.2156863, 1,
1.966894, 0.3471781, 1.218454, 1, 0, 0.2117647, 1,
1.985063, -0.2811672, 2.284296, 1, 0, 0.2039216, 1,
1.997846, 0.160706, 3.090996, 1, 0, 0.1960784, 1,
2.012151, 0.8279752, 0.3862423, 1, 0, 0.1921569, 1,
2.018838, -0.913064, 4.332214, 1, 0, 0.1843137, 1,
2.028346, -0.6107627, 1.55487, 1, 0, 0.1803922, 1,
2.034145, -0.9047262, 2.060132, 1, 0, 0.172549, 1,
2.038623, -0.1674094, 1.813937, 1, 0, 0.1686275, 1,
2.052707, 1.437261, 3.045376, 1, 0, 0.1607843, 1,
2.078112, -0.2758466, 1.232537, 1, 0, 0.1568628, 1,
2.089557, -0.2927535, 1.295786, 1, 0, 0.1490196, 1,
2.093467, 0.05647048, 3.072777, 1, 0, 0.145098, 1,
2.1038, 0.2930752, 0.900539, 1, 0, 0.1372549, 1,
2.140788, -0.09697292, 1.989217, 1, 0, 0.1333333, 1,
2.14786, -1.097302, 0.4215686, 1, 0, 0.1254902, 1,
2.148916, 1.364948, 0.3432769, 1, 0, 0.1215686, 1,
2.172709, 0.5526533, 1.073795, 1, 0, 0.1137255, 1,
2.181457, 2.451704, 0.3297698, 1, 0, 0.1098039, 1,
2.256448, -1.526264, 0.8857303, 1, 0, 0.1019608, 1,
2.288415, -0.207791, 0.8885728, 1, 0, 0.09411765, 1,
2.37925, 0.8658046, 0.278905, 1, 0, 0.09019608, 1,
2.380566, -0.7243047, 1.553379, 1, 0, 0.08235294, 1,
2.392251, 1.744975, 1.166189, 1, 0, 0.07843138, 1,
2.419445, -0.5226588, 2.038718, 1, 0, 0.07058824, 1,
2.480601, 0.8979958, 0.9582512, 1, 0, 0.06666667, 1,
2.493707, 0.6088007, 1.675123, 1, 0, 0.05882353, 1,
2.501807, -0.6112297, 1.297264, 1, 0, 0.05490196, 1,
2.664485, 1.157886, 0.0191139, 1, 0, 0.04705882, 1,
2.698441, 0.1365537, 1.949213, 1, 0, 0.04313726, 1,
2.742477, 0.44498, 0.8019702, 1, 0, 0.03529412, 1,
2.748424, 1.17227, 1.328252, 1, 0, 0.03137255, 1,
2.8488, -0.9815753, 0.02675358, 1, 0, 0.02352941, 1,
2.949607, 1.93868, 1.871029, 1, 0, 0.01960784, 1,
3.071776, -0.2752449, 1.896397, 1, 0, 0.01176471, 1,
3.82933, -0.8875617, 0.5125244, 1, 0, 0.007843138, 1
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
0.248901, -4.504597, -7.056297, 0, -0.5, 0.5, 0.5,
0.248901, -4.504597, -7.056297, 1, -0.5, 0.5, 0.5,
0.248901, -4.504597, -7.056297, 1, 1.5, 0.5, 0.5,
0.248901, -4.504597, -7.056297, 0, 1.5, 0.5, 0.5
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
-4.545294, -0.2079517, -7.056297, 0, -0.5, 0.5, 0.5,
-4.545294, -0.2079517, -7.056297, 1, -0.5, 0.5, 0.5,
-4.545294, -0.2079517, -7.056297, 1, 1.5, 0.5, 0.5,
-4.545294, -0.2079517, -7.056297, 0, 1.5, 0.5, 0.5
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
-4.545294, -4.504597, -0.02929759, 0, -0.5, 0.5, 0.5,
-4.545294, -4.504597, -0.02929759, 1, -0.5, 0.5, 0.5,
-4.545294, -4.504597, -0.02929759, 1, 1.5, 0.5, 0.5,
-4.545294, -4.504597, -0.02929759, 0, 1.5, 0.5, 0.5
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
-2, -3.513063, -5.434682,
2, -3.513063, -5.434682,
-2, -3.513063, -5.434682,
-2, -3.678319, -5.704951,
0, -3.513063, -5.434682,
0, -3.678319, -5.704951,
2, -3.513063, -5.434682,
2, -3.678319, -5.704951
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
"0",
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
-2, -4.00883, -6.24549, 0, -0.5, 0.5, 0.5,
-2, -4.00883, -6.24549, 1, -0.5, 0.5, 0.5,
-2, -4.00883, -6.24549, 1, 1.5, 0.5, 0.5,
-2, -4.00883, -6.24549, 0, 1.5, 0.5, 0.5,
0, -4.00883, -6.24549, 0, -0.5, 0.5, 0.5,
0, -4.00883, -6.24549, 1, -0.5, 0.5, 0.5,
0, -4.00883, -6.24549, 1, 1.5, 0.5, 0.5,
0, -4.00883, -6.24549, 0, 1.5, 0.5, 0.5,
2, -4.00883, -6.24549, 0, -0.5, 0.5, 0.5,
2, -4.00883, -6.24549, 1, -0.5, 0.5, 0.5,
2, -4.00883, -6.24549, 1, 1.5, 0.5, 0.5,
2, -4.00883, -6.24549, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.438941, -3, -5.434682,
-3.438941, 3, -5.434682,
-3.438941, -3, -5.434682,
-3.623333, -3, -5.704951,
-3.438941, -2, -5.434682,
-3.623333, -2, -5.704951,
-3.438941, -1, -5.434682,
-3.623333, -1, -5.704951,
-3.438941, 0, -5.434682,
-3.623333, 0, -5.704951,
-3.438941, 1, -5.434682,
-3.623333, 1, -5.704951,
-3.438941, 2, -5.434682,
-3.623333, 2, -5.704951,
-3.438941, 3, -5.434682,
-3.623333, 3, -5.704951
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
-3.992117, -3, -6.24549, 0, -0.5, 0.5, 0.5,
-3.992117, -3, -6.24549, 1, -0.5, 0.5, 0.5,
-3.992117, -3, -6.24549, 1, 1.5, 0.5, 0.5,
-3.992117, -3, -6.24549, 0, 1.5, 0.5, 0.5,
-3.992117, -2, -6.24549, 0, -0.5, 0.5, 0.5,
-3.992117, -2, -6.24549, 1, -0.5, 0.5, 0.5,
-3.992117, -2, -6.24549, 1, 1.5, 0.5, 0.5,
-3.992117, -2, -6.24549, 0, 1.5, 0.5, 0.5,
-3.992117, -1, -6.24549, 0, -0.5, 0.5, 0.5,
-3.992117, -1, -6.24549, 1, -0.5, 0.5, 0.5,
-3.992117, -1, -6.24549, 1, 1.5, 0.5, 0.5,
-3.992117, -1, -6.24549, 0, 1.5, 0.5, 0.5,
-3.992117, 0, -6.24549, 0, -0.5, 0.5, 0.5,
-3.992117, 0, -6.24549, 1, -0.5, 0.5, 0.5,
-3.992117, 0, -6.24549, 1, 1.5, 0.5, 0.5,
-3.992117, 0, -6.24549, 0, 1.5, 0.5, 0.5,
-3.992117, 1, -6.24549, 0, -0.5, 0.5, 0.5,
-3.992117, 1, -6.24549, 1, -0.5, 0.5, 0.5,
-3.992117, 1, -6.24549, 1, 1.5, 0.5, 0.5,
-3.992117, 1, -6.24549, 0, 1.5, 0.5, 0.5,
-3.992117, 2, -6.24549, 0, -0.5, 0.5, 0.5,
-3.992117, 2, -6.24549, 1, -0.5, 0.5, 0.5,
-3.992117, 2, -6.24549, 1, 1.5, 0.5, 0.5,
-3.992117, 2, -6.24549, 0, 1.5, 0.5, 0.5,
-3.992117, 3, -6.24549, 0, -0.5, 0.5, 0.5,
-3.992117, 3, -6.24549, 1, -0.5, 0.5, 0.5,
-3.992117, 3, -6.24549, 1, 1.5, 0.5, 0.5,
-3.992117, 3, -6.24549, 0, 1.5, 0.5, 0.5
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
-3.438941, -3.513063, -4,
-3.438941, -3.513063, 4,
-3.438941, -3.513063, -4,
-3.623333, -3.678319, -4,
-3.438941, -3.513063, -2,
-3.623333, -3.678319, -2,
-3.438941, -3.513063, 0,
-3.623333, -3.678319, 0,
-3.438941, -3.513063, 2,
-3.623333, -3.678319, 2,
-3.438941, -3.513063, 4,
-3.623333, -3.678319, 4
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
-3.992117, -4.00883, -4, 0, -0.5, 0.5, 0.5,
-3.992117, -4.00883, -4, 1, -0.5, 0.5, 0.5,
-3.992117, -4.00883, -4, 1, 1.5, 0.5, 0.5,
-3.992117, -4.00883, -4, 0, 1.5, 0.5, 0.5,
-3.992117, -4.00883, -2, 0, -0.5, 0.5, 0.5,
-3.992117, -4.00883, -2, 1, -0.5, 0.5, 0.5,
-3.992117, -4.00883, -2, 1, 1.5, 0.5, 0.5,
-3.992117, -4.00883, -2, 0, 1.5, 0.5, 0.5,
-3.992117, -4.00883, 0, 0, -0.5, 0.5, 0.5,
-3.992117, -4.00883, 0, 1, -0.5, 0.5, 0.5,
-3.992117, -4.00883, 0, 1, 1.5, 0.5, 0.5,
-3.992117, -4.00883, 0, 0, 1.5, 0.5, 0.5,
-3.992117, -4.00883, 2, 0, -0.5, 0.5, 0.5,
-3.992117, -4.00883, 2, 1, -0.5, 0.5, 0.5,
-3.992117, -4.00883, 2, 1, 1.5, 0.5, 0.5,
-3.992117, -4.00883, 2, 0, 1.5, 0.5, 0.5,
-3.992117, -4.00883, 4, 0, -0.5, 0.5, 0.5,
-3.992117, -4.00883, 4, 1, -0.5, 0.5, 0.5,
-3.992117, -4.00883, 4, 1, 1.5, 0.5, 0.5,
-3.992117, -4.00883, 4, 0, 1.5, 0.5, 0.5
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
-3.438941, -3.513063, -5.434682,
-3.438941, 3.09716, -5.434682,
-3.438941, -3.513063, 5.376087,
-3.438941, 3.09716, 5.376087,
-3.438941, -3.513063, -5.434682,
-3.438941, -3.513063, 5.376087,
-3.438941, 3.09716, -5.434682,
-3.438941, 3.09716, 5.376087,
-3.438941, -3.513063, -5.434682,
3.936743, -3.513063, -5.434682,
-3.438941, -3.513063, 5.376087,
3.936743, -3.513063, 5.376087,
-3.438941, 3.09716, -5.434682,
3.936743, 3.09716, -5.434682,
-3.438941, 3.09716, 5.376087,
3.936743, 3.09716, 5.376087,
3.936743, -3.513063, -5.434682,
3.936743, 3.09716, -5.434682,
3.936743, -3.513063, 5.376087,
3.936743, 3.09716, 5.376087,
3.936743, -3.513063, -5.434682,
3.936743, -3.513063, 5.376087,
3.936743, 3.09716, -5.434682,
3.936743, 3.09716, 5.376087
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
var radius = 7.829119;
var distance = 34.83263;
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
mvMatrix.translate( -0.248901, 0.2079517, 0.02929759 );
mvMatrix.scale( 1.14769, 1.280592, 0.7830152 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.83263);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
sodium_azide<-read.table("sodium_azide.xyz")
```

```
## Error in read.table("sodium_azide.xyz"): no lines available in input
```

```r
x<-sodium_azide$V2
```

```
## Error in eval(expr, envir, enclos): object 'sodium_azide' not found
```

```r
y<-sodium_azide$V3
```

```
## Error in eval(expr, envir, enclos): object 'sodium_azide' not found
```

```r
z<-sodium_azide$V4
```

```
## Error in eval(expr, envir, enclos): object 'sodium_azide' not found
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
-3.331528, -2.239078, -1.015068, 0, 0, 1, 1, 1,
-3.223819, 0.5446246, -2.423227, 1, 0, 0, 1, 1,
-2.610223, -1.761962, -2.355902, 1, 0, 0, 1, 1,
-2.594276, -0.4864714, -1.872864, 1, 0, 0, 1, 1,
-2.531772, 2.286408, -0.5713219, 1, 0, 0, 1, 1,
-2.40228, -1.630965, -2.559511, 1, 0, 0, 1, 1,
-2.391265, 0.8692396, 0.2300908, 0, 0, 0, 1, 1,
-2.339763, 0.1718597, -3.903341, 0, 0, 0, 1, 1,
-2.318402, 0.459345, -0.4253884, 0, 0, 0, 1, 1,
-2.300156, 0.2613692, -0.5822545, 0, 0, 0, 1, 1,
-2.243691, 1.326778, -1.038327, 0, 0, 0, 1, 1,
-2.240367, 0.4032247, 0.3712484, 0, 0, 0, 1, 1,
-2.236341, -0.7571703, -2.51729, 0, 0, 0, 1, 1,
-2.23497, 1.131984, -1.598669, 1, 1, 1, 1, 1,
-2.176156, -0.8821604, -1.308058, 1, 1, 1, 1, 1,
-2.175009, 0.5508125, -2.348678, 1, 1, 1, 1, 1,
-2.14684, 0.9641244, 1.204248, 1, 1, 1, 1, 1,
-2.124336, 0.177222, -1.52033, 1, 1, 1, 1, 1,
-2.103348, 1.635202, -0.5110233, 1, 1, 1, 1, 1,
-2.088664, 0.1249059, 0.5435759, 1, 1, 1, 1, 1,
-2.075964, -0.2834341, 0.1276496, 1, 1, 1, 1, 1,
-2.062112, 1.05916, -0.0374188, 1, 1, 1, 1, 1,
-2.048545, -1.18895, -2.314352, 1, 1, 1, 1, 1,
-2.043549, -0.9063658, -2.862495, 1, 1, 1, 1, 1,
-2.027299, 1.083636, -2.451213, 1, 1, 1, 1, 1,
-2.025081, 0.3358121, -0.9972495, 1, 1, 1, 1, 1,
-2.002567, -0.04614701, -1.831506, 1, 1, 1, 1, 1,
-1.976695, -0.1838154, 0.5349348, 1, 1, 1, 1, 1,
-1.971715, -1.138991, -2.157875, 0, 0, 1, 1, 1,
-1.954665, 0.1868938, -2.944373, 1, 0, 0, 1, 1,
-1.948148, 1.354203, -1.892261, 1, 0, 0, 1, 1,
-1.933918, 0.9276237, -0.6653976, 1, 0, 0, 1, 1,
-1.912976, 0.7581424, -0.658237, 1, 0, 0, 1, 1,
-1.896793, 0.7223867, -0.9152238, 1, 0, 0, 1, 1,
-1.893629, 0.8355685, -0.8078758, 0, 0, 0, 1, 1,
-1.88559, 1.839964, -1.023606, 0, 0, 0, 1, 1,
-1.850892, -0.1163031, -1.535685, 0, 0, 0, 1, 1,
-1.831309, -1.019325, -2.632174, 0, 0, 0, 1, 1,
-1.824072, -0.1198451, -1.746744, 0, 0, 0, 1, 1,
-1.818219, -0.1714401, -0.3284061, 0, 0, 0, 1, 1,
-1.812297, -0.3090701, -0.8910115, 0, 0, 0, 1, 1,
-1.795666, -0.7880942, -2.383654, 1, 1, 1, 1, 1,
-1.790023, -0.3442321, -2.160226, 1, 1, 1, 1, 1,
-1.781282, -2.357418, -1.989473, 1, 1, 1, 1, 1,
-1.779667, -0.399776, -3.06549, 1, 1, 1, 1, 1,
-1.774179, -1.586965, -2.20652, 1, 1, 1, 1, 1,
-1.773964, 1.527166, 1.085588, 1, 1, 1, 1, 1,
-1.768098, 0.5644128, -1.34909, 1, 1, 1, 1, 1,
-1.76738, 0.1367428, -0.7725883, 1, 1, 1, 1, 1,
-1.752123, 1.783937, -1.048992, 1, 1, 1, 1, 1,
-1.743229, -0.08581874, 0.6326239, 1, 1, 1, 1, 1,
-1.733998, -0.6730033, -4.645095, 1, 1, 1, 1, 1,
-1.733581, 0.26019, -0.6816601, 1, 1, 1, 1, 1,
-1.724804, -0.5491902, -1.782608, 1, 1, 1, 1, 1,
-1.717947, 0.818167, -1.673576, 1, 1, 1, 1, 1,
-1.680996, 1.352063, -0.467159, 1, 1, 1, 1, 1,
-1.664033, -1.565669, -3.265543, 0, 0, 1, 1, 1,
-1.643296, -0.275015, -0.9561679, 1, 0, 0, 1, 1,
-1.636568, 0.2782919, -0.0705907, 1, 0, 0, 1, 1,
-1.635676, -0.326136, -3.165233, 1, 0, 0, 1, 1,
-1.625597, -0.0468189, -0.8616435, 1, 0, 0, 1, 1,
-1.618054, 2.057736, -2.1924, 1, 0, 0, 1, 1,
-1.615724, 1.288724, -0.9038271, 0, 0, 0, 1, 1,
-1.60989, 0.5788789, -2.178261, 0, 0, 0, 1, 1,
-1.598989, 0.6024724, -1.885385, 0, 0, 0, 1, 1,
-1.585703, -0.1072254, -1.733143, 0, 0, 0, 1, 1,
-1.572574, -0.5407667, -1.112775, 0, 0, 0, 1, 1,
-1.569772, -0.3005843, -2.047539, 0, 0, 0, 1, 1,
-1.556583, -1.270396, -1.410412, 0, 0, 0, 1, 1,
-1.553766, -0.6128657, -2.722726, 1, 1, 1, 1, 1,
-1.550604, 1.225275, -3.334008, 1, 1, 1, 1, 1,
-1.542654, -0.1670257, -1.873282, 1, 1, 1, 1, 1,
-1.529702, -0.6295689, -2.755038, 1, 1, 1, 1, 1,
-1.515125, -1.164452, -2.518018, 1, 1, 1, 1, 1,
-1.478671, -0.1610344, -0.6761811, 1, 1, 1, 1, 1,
-1.477822, -1.433945, -1.659365, 1, 1, 1, 1, 1,
-1.475603, 0.01119806, -1.861028, 1, 1, 1, 1, 1,
-1.473709, -1.03789, -1.691849, 1, 1, 1, 1, 1,
-1.436324, -1.238443, -1.66832, 1, 1, 1, 1, 1,
-1.431237, -1.6982, -0.9599079, 1, 1, 1, 1, 1,
-1.412947, 0.2135294, -0.7585056, 1, 1, 1, 1, 1,
-1.411724, 0.06922372, 0.5647921, 1, 1, 1, 1, 1,
-1.404827, -2.117335, -2.370622, 1, 1, 1, 1, 1,
-1.396663, 0.9466082, 1.251726, 1, 1, 1, 1, 1,
-1.39147, -0.853561, -2.179017, 0, 0, 1, 1, 1,
-1.386072, 0.5118295, -2.095452, 1, 0, 0, 1, 1,
-1.385167, -0.6218133, -1.740329, 1, 0, 0, 1, 1,
-1.383588, 1.924428, 0.7004739, 1, 0, 0, 1, 1,
-1.372096, -0.7199102, -1.079481, 1, 0, 0, 1, 1,
-1.364237, 0.9952884, -1.73716, 1, 0, 0, 1, 1,
-1.361527, 1.207469, -0.3332542, 0, 0, 0, 1, 1,
-1.356886, 0.3398463, -1.150451, 0, 0, 0, 1, 1,
-1.35269, -1.202095, -3.25857, 0, 0, 0, 1, 1,
-1.350581, 1.99345, -1.729151, 0, 0, 0, 1, 1,
-1.348622, 0.7612349, -0.03062879, 0, 0, 0, 1, 1,
-1.346675, -0.7652133, -2.053104, 0, 0, 0, 1, 1,
-1.344612, -1.95722, -4.23516, 0, 0, 0, 1, 1,
-1.340604, -1.441671, -2.475186, 1, 1, 1, 1, 1,
-1.332146, 0.8826394, -1.593047, 1, 1, 1, 1, 1,
-1.325959, -0.9279512, -1.666997, 1, 1, 1, 1, 1,
-1.325298, 1.379073, -0.3422853, 1, 1, 1, 1, 1,
-1.318882, -1.233609, -3.355655, 1, 1, 1, 1, 1,
-1.317805, 0.8776453, -0.6924108, 1, 1, 1, 1, 1,
-1.317061, -0.2246377, -1.996343, 1, 1, 1, 1, 1,
-1.313119, -0.8264602, -0.7995327, 1, 1, 1, 1, 1,
-1.311787, -0.5771243, -0.5597622, 1, 1, 1, 1, 1,
-1.308107, 0.4907606, -0.7367589, 1, 1, 1, 1, 1,
-1.300228, -0.3495994, -1.894328, 1, 1, 1, 1, 1,
-1.29392, 0.1314568, -0.824065, 1, 1, 1, 1, 1,
-1.281341, -2.151516, -2.109472, 1, 1, 1, 1, 1,
-1.273932, 0.8766738, -2.355117, 1, 1, 1, 1, 1,
-1.272521, 0.476329, -1.55767, 1, 1, 1, 1, 1,
-1.271378, 1.022744, 1.009748, 0, 0, 1, 1, 1,
-1.263734, -0.5467142, -2.729973, 1, 0, 0, 1, 1,
-1.260961, -0.8651334, -2.277726, 1, 0, 0, 1, 1,
-1.260879, 0.4003438, -0.2709607, 1, 0, 0, 1, 1,
-1.257044, 0.8571437, -0.2487724, 1, 0, 0, 1, 1,
-1.253228, 0.3068162, -0.3590174, 1, 0, 0, 1, 1,
-1.241823, -0.3828296, 0.2548819, 0, 0, 0, 1, 1,
-1.236869, -0.1845694, -3.60463, 0, 0, 0, 1, 1,
-1.23479, -1.649306, -3.818074, 0, 0, 0, 1, 1,
-1.227342, 0.8425546, -1.444597, 0, 0, 0, 1, 1,
-1.226737, -0.8574385, -1.706521, 0, 0, 0, 1, 1,
-1.224648, 0.2761695, 1.472778, 0, 0, 0, 1, 1,
-1.22324, -1.44657, -2.878828, 0, 0, 0, 1, 1,
-1.217071, -0.5929478, -1.105769, 1, 1, 1, 1, 1,
-1.21195, -0.2615629, -0.5371889, 1, 1, 1, 1, 1,
-1.199836, 0.8643485, -0.7454359, 1, 1, 1, 1, 1,
-1.19008, 0.9725219, -1.834828, 1, 1, 1, 1, 1,
-1.185941, 0.4726676, -0.5548291, 1, 1, 1, 1, 1,
-1.178483, 0.9835915, -0.8000226, 1, 1, 1, 1, 1,
-1.178393, 1.228839, 0.3128879, 1, 1, 1, 1, 1,
-1.173637, -0.2370207, -2.198225, 1, 1, 1, 1, 1,
-1.156792, 0.08248067, -1.907669, 1, 1, 1, 1, 1,
-1.152394, -0.3404139, -0.9424047, 1, 1, 1, 1, 1,
-1.151088, -1.363277, -2.862519, 1, 1, 1, 1, 1,
-1.149213, -1.033884, -2.220184, 1, 1, 1, 1, 1,
-1.149045, -0.2043059, -1.177217, 1, 1, 1, 1, 1,
-1.143478, 0.9452372, -1.250944, 1, 1, 1, 1, 1,
-1.13413, -0.24171, -1.052058, 1, 1, 1, 1, 1,
-1.125692, -1.106395, -1.86191, 0, 0, 1, 1, 1,
-1.112702, -0.08311237, -2.052447, 1, 0, 0, 1, 1,
-1.094862, -0.7077464, -2.577121, 1, 0, 0, 1, 1,
-1.091616, 0.1367457, -2.887841, 1, 0, 0, 1, 1,
-1.09128, 0.6316002, -0.860755, 1, 0, 0, 1, 1,
-1.086239, 1.193889, -1.658668, 1, 0, 0, 1, 1,
-1.078256, -0.9011579, -3.837304, 0, 0, 0, 1, 1,
-1.072381, -0.4971245, -2.318872, 0, 0, 0, 1, 1,
-1.069975, -0.2782902, -2.38913, 0, 0, 0, 1, 1,
-1.066312, -0.04169042, -3.087696, 0, 0, 0, 1, 1,
-1.065055, -0.8736222, -2.445211, 0, 0, 0, 1, 1,
-1.064442, -0.6372938, -3.966671, 0, 0, 0, 1, 1,
-1.057945, -0.3253478, -2.767825, 0, 0, 0, 1, 1,
-1.053907, -0.156211, -1.637992, 1, 1, 1, 1, 1,
-1.051698, 0.4275409, -2.674354, 1, 1, 1, 1, 1,
-1.051639, 0.2080295, 1.000972, 1, 1, 1, 1, 1,
-1.049039, -1.495875, -1.335259, 1, 1, 1, 1, 1,
-1.033424, -0.1744512, -1.001463, 1, 1, 1, 1, 1,
-1.03327, 0.4034966, -2.476393, 1, 1, 1, 1, 1,
-1.031605, -0.1166642, -1.931669, 1, 1, 1, 1, 1,
-1.026338, 0.6327135, -2.774549, 1, 1, 1, 1, 1,
-1.017364, -0.3209089, -2.087226, 1, 1, 1, 1, 1,
-1.011939, -1.532473, -2.913926, 1, 1, 1, 1, 1,
-0.9914235, 0.9922097, 0.04777337, 1, 1, 1, 1, 1,
-0.9872485, 1.038445, 1.985269, 1, 1, 1, 1, 1,
-0.9868639, 0.1243593, -1.931784, 1, 1, 1, 1, 1,
-0.9868615, 0.6098233, -1.219271, 1, 1, 1, 1, 1,
-0.9867172, 2.038015, -1.262485, 1, 1, 1, 1, 1,
-0.9725211, 0.3588409, -0.4080496, 0, 0, 1, 1, 1,
-0.9718974, -0.6970717, -2.596972, 1, 0, 0, 1, 1,
-0.9633576, 0.1741377, -1.331218, 1, 0, 0, 1, 1,
-0.9606843, 1.118173, -0.7412103, 1, 0, 0, 1, 1,
-0.9551239, 0.9284565, -1.24345, 1, 0, 0, 1, 1,
-0.950784, -0.2585135, -0.7179689, 1, 0, 0, 1, 1,
-0.9490649, -0.717081, 0.1314943, 0, 0, 0, 1, 1,
-0.9466782, 0.8020779, -0.9571822, 0, 0, 0, 1, 1,
-0.9456592, -0.9933015, -1.841515, 0, 0, 0, 1, 1,
-0.9454703, 0.8326113, 2.027647, 0, 0, 0, 1, 1,
-0.9412093, -1.109819, -1.40998, 0, 0, 0, 1, 1,
-0.9351799, -0.6941917, -2.174496, 0, 0, 0, 1, 1,
-0.9295547, 0.1687143, -1.432217, 0, 0, 0, 1, 1,
-0.9286512, -0.1304324, -1.79775, 1, 1, 1, 1, 1,
-0.9241371, -0.7118163, -3.020984, 1, 1, 1, 1, 1,
-0.9206187, -0.2479372, -2.005092, 1, 1, 1, 1, 1,
-0.9075951, 0.0645048, -0.6498064, 1, 1, 1, 1, 1,
-0.9057185, -0.4107968, -3.330581, 1, 1, 1, 1, 1,
-0.9050647, -0.6885987, -1.204214, 1, 1, 1, 1, 1,
-0.9043328, -0.1119858, -0.8842236, 1, 1, 1, 1, 1,
-0.902629, 0.7687404, 0.3700652, 1, 1, 1, 1, 1,
-0.9003838, 0.9891195, -1.346783, 1, 1, 1, 1, 1,
-0.8980674, -0.09203599, -2.079832, 1, 1, 1, 1, 1,
-0.8974643, 0.3200099, -2.586663, 1, 1, 1, 1, 1,
-0.8954805, -0.0225766, -0.8741692, 1, 1, 1, 1, 1,
-0.8782834, -0.7051282, -3.33757, 1, 1, 1, 1, 1,
-0.872959, -0.0790445, -3.253346, 1, 1, 1, 1, 1,
-0.8716012, 0.7582793, -0.09982718, 1, 1, 1, 1, 1,
-0.8670858, 1.251125, 0.3748446, 0, 0, 1, 1, 1,
-0.8661678, 0.2847943, -3.064956, 1, 0, 0, 1, 1,
-0.8645975, 0.287849, -2.539961, 1, 0, 0, 1, 1,
-0.8639546, -1.354639, -3.655367, 1, 0, 0, 1, 1,
-0.8639512, 0.1252501, -2.151007, 1, 0, 0, 1, 1,
-0.858829, -0.8705353, -1.416625, 1, 0, 0, 1, 1,
-0.8529885, -1.016309, -4.089855, 0, 0, 0, 1, 1,
-0.8471726, -1.256849, -2.537322, 0, 0, 0, 1, 1,
-0.8413743, 0.6587822, -2.244174, 0, 0, 0, 1, 1,
-0.838868, -1.605314, -2.550256, 0, 0, 0, 1, 1,
-0.8353435, -0.7242747, -2.938711, 0, 0, 0, 1, 1,
-0.8277538, -0.6939802, -2.350334, 0, 0, 0, 1, 1,
-0.8263357, -0.8436114, -2.66849, 0, 0, 0, 1, 1,
-0.8246246, -0.008809187, -1.931647, 1, 1, 1, 1, 1,
-0.8236204, 0.3260243, 0.3873106, 1, 1, 1, 1, 1,
-0.8226668, -1.651006, -2.974348, 1, 1, 1, 1, 1,
-0.8214886, 1.500072, 0.1560729, 1, 1, 1, 1, 1,
-0.8211461, -0.4366736, -1.849966, 1, 1, 1, 1, 1,
-0.8186616, 0.2879739, -2.65743, 1, 1, 1, 1, 1,
-0.8132271, 0.8261512, 0.1586939, 1, 1, 1, 1, 1,
-0.8128453, 1.172317, -1.862509, 1, 1, 1, 1, 1,
-0.8127488, -0.2847486, -2.140545, 1, 1, 1, 1, 1,
-0.8072249, 0.4043264, -0.8211492, 1, 1, 1, 1, 1,
-0.803517, -0.1386202, -2.292494, 1, 1, 1, 1, 1,
-0.8013986, 1.857997, 0.5690248, 1, 1, 1, 1, 1,
-0.8004023, -2.515233, -2.378121, 1, 1, 1, 1, 1,
-0.8002005, -1.302197, -2.659344, 1, 1, 1, 1, 1,
-0.799896, 1.890228, -0.1010676, 1, 1, 1, 1, 1,
-0.7947965, -0.3656227, -1.968845, 0, 0, 1, 1, 1,
-0.792384, 0.4822729, -1.158267, 1, 0, 0, 1, 1,
-0.7916015, 0.7619734, -1.054258, 1, 0, 0, 1, 1,
-0.7887229, -0.4592363, -2.327294, 1, 0, 0, 1, 1,
-0.7867127, 0.7893918, -2.374512, 1, 0, 0, 1, 1,
-0.7840234, 1.570527, -1.179939, 1, 0, 0, 1, 1,
-0.7756141, -0.8013447, -2.309291, 0, 0, 0, 1, 1,
-0.7614505, -0.5226845, -2.229553, 0, 0, 0, 1, 1,
-0.7605771, -0.02341251, -1.249209, 0, 0, 0, 1, 1,
-0.7562416, -1.119924, -2.858582, 0, 0, 0, 1, 1,
-0.7551081, 1.393523, -1.762262, 0, 0, 0, 1, 1,
-0.7542835, 0.5129771, -0.2511679, 0, 0, 0, 1, 1,
-0.7532734, -1.72878, -4.066246, 0, 0, 0, 1, 1,
-0.7492686, 1.155121, -0.01398467, 1, 1, 1, 1, 1,
-0.748949, 0.1635467, -1.927165, 1, 1, 1, 1, 1,
-0.7465395, -0.02865167, -0.6165869, 1, 1, 1, 1, 1,
-0.7453688, -1.047115, -3.285445, 1, 1, 1, 1, 1,
-0.7424112, 0.4918829, -1.457047, 1, 1, 1, 1, 1,
-0.7424054, 0.3109668, -2.03133, 1, 1, 1, 1, 1,
-0.7407048, -0.04180371, -2.681509, 1, 1, 1, 1, 1,
-0.7381955, -0.4390823, -2.40245, 1, 1, 1, 1, 1,
-0.7324829, 0.1786103, -1.654873, 1, 1, 1, 1, 1,
-0.7318452, -1.381276, -3.978906, 1, 1, 1, 1, 1,
-0.7314679, 1.402689, -0.1561664, 1, 1, 1, 1, 1,
-0.7294955, 0.2096991, 0.4839522, 1, 1, 1, 1, 1,
-0.7264959, 0.6280865, -0.1476545, 1, 1, 1, 1, 1,
-0.7133713, 0.1207441, -1.484068, 1, 1, 1, 1, 1,
-0.7063667, -1.113915, -1.856578, 1, 1, 1, 1, 1,
-0.7057656, 1.308315, -1.830363, 0, 0, 1, 1, 1,
-0.7010194, -0.01038425, -3.489444, 1, 0, 0, 1, 1,
-0.6992083, -0.8728639, -2.427307, 1, 0, 0, 1, 1,
-0.6948759, 1.549754, 0.2167949, 1, 0, 0, 1, 1,
-0.692332, 0.168203, -2.423513, 1, 0, 0, 1, 1,
-0.6908848, -1.22564, -2.366634, 1, 0, 0, 1, 1,
-0.6836517, 0.2596858, -0.3862969, 0, 0, 0, 1, 1,
-0.6827759, -0.6330871, -2.226162, 0, 0, 0, 1, 1,
-0.6816079, 0.2180561, -1.939949, 0, 0, 0, 1, 1,
-0.6760613, 0.457538, -2.348711, 0, 0, 0, 1, 1,
-0.6714262, -0.1216955, -2.492457, 0, 0, 0, 1, 1,
-0.6709012, 0.00937523, -0.6188498, 0, 0, 0, 1, 1,
-0.6705556, -1.005176, -0.1503133, 0, 0, 0, 1, 1,
-0.6699718, -0.7410049, -1.184741, 1, 1, 1, 1, 1,
-0.6643588, 0.8596261, -0.05753079, 1, 1, 1, 1, 1,
-0.6642037, 0.537383, -0.4198054, 1, 1, 1, 1, 1,
-0.6641095, 0.7653807, -0.8632864, 1, 1, 1, 1, 1,
-0.6564123, 0.3713395, -2.171731, 1, 1, 1, 1, 1,
-0.6563832, -0.296969, -1.065246, 1, 1, 1, 1, 1,
-0.6540974, -2.332272, -3.271117, 1, 1, 1, 1, 1,
-0.6525812, 0.476405, -0.1901148, 1, 1, 1, 1, 1,
-0.6497961, 0.1227801, -0.4352145, 1, 1, 1, 1, 1,
-0.6458938, -0.6889142, -1.453599, 1, 1, 1, 1, 1,
-0.6458448, 0.2865554, -0.7457227, 1, 1, 1, 1, 1,
-0.6448618, 0.9562074, -0.232279, 1, 1, 1, 1, 1,
-0.6447173, 1.798118, -2.32549, 1, 1, 1, 1, 1,
-0.643038, -0.2194621, -2.321532, 1, 1, 1, 1, 1,
-0.6429729, -1.62356, -1.286512, 1, 1, 1, 1, 1,
-0.6419066, -2.1893, -2.445114, 0, 0, 1, 1, 1,
-0.6378391, -0.1699587, -1.555473, 1, 0, 0, 1, 1,
-0.6340616, 0.452293, 0.7855158, 1, 0, 0, 1, 1,
-0.6327199, -0.0797718, -0.9043496, 1, 0, 0, 1, 1,
-0.6315216, -1.313655, -3.628574, 1, 0, 0, 1, 1,
-0.6301191, -0.04584219, -3.633884, 1, 0, 0, 1, 1,
-0.6284264, 1.051208, -1.288713, 0, 0, 0, 1, 1,
-0.6282026, 0.08212593, -1.182608, 0, 0, 0, 1, 1,
-0.6258378, -0.5099778, -1.422119, 0, 0, 0, 1, 1,
-0.6236649, -0.1639513, -2.51347, 0, 0, 0, 1, 1,
-0.6143017, 0.645187, 0.1352421, 0, 0, 0, 1, 1,
-0.6103712, 0.6537375, -1.69198, 0, 0, 0, 1, 1,
-0.6022369, -0.5698414, -3.294793, 0, 0, 0, 1, 1,
-0.6014955, 0.581664, -0.2663538, 1, 1, 1, 1, 1,
-0.5970759, -0.9505757, -5.277244, 1, 1, 1, 1, 1,
-0.5919104, -0.2222419, -2.36693, 1, 1, 1, 1, 1,
-0.590983, -0.1594103, -1.989039, 1, 1, 1, 1, 1,
-0.5871849, 0.01116699, -0.1062557, 1, 1, 1, 1, 1,
-0.5870165, -0.4369358, -1.420977, 1, 1, 1, 1, 1,
-0.5859838, -0.8430026, -3.542746, 1, 1, 1, 1, 1,
-0.5839248, 0.705574, -1.547673, 1, 1, 1, 1, 1,
-0.5811791, -0.7698286, -1.312087, 1, 1, 1, 1, 1,
-0.5781139, 1.045635, -1.642685, 1, 1, 1, 1, 1,
-0.5773469, 0.1159561, -0.3175294, 1, 1, 1, 1, 1,
-0.5744607, -0.2067344, -2.061077, 1, 1, 1, 1, 1,
-0.5718232, 0.6985539, -2.34394, 1, 1, 1, 1, 1,
-0.5709175, -1.442901, -3.794178, 1, 1, 1, 1, 1,
-0.5705218, -1.01183, -2.034518, 1, 1, 1, 1, 1,
-0.5696851, 1.406747, 0.8761338, 0, 0, 1, 1, 1,
-0.5682524, 0.5234953, 0.9940923, 1, 0, 0, 1, 1,
-0.5657625, -0.8840454, -3.070263, 1, 0, 0, 1, 1,
-0.5637406, 1.415788, 0.6740319, 1, 0, 0, 1, 1,
-0.5605915, 0.4385936, -1.890082, 1, 0, 0, 1, 1,
-0.5552323, 1.189308, 0.738079, 1, 0, 0, 1, 1,
-0.5549944, -0.4548485, -2.728501, 0, 0, 0, 1, 1,
-0.5522276, -0.4281527, -3.202218, 0, 0, 0, 1, 1,
-0.5450438, -0.7801481, -3.250424, 0, 0, 0, 1, 1,
-0.5445625, 1.153409, -1.095598, 0, 0, 0, 1, 1,
-0.5433668, 0.2745127, -0.8342129, 0, 0, 0, 1, 1,
-0.5378008, 0.550368, -1.641938, 0, 0, 0, 1, 1,
-0.5362129, 1.116905, -0.7324122, 0, 0, 0, 1, 1,
-0.5324244, 1.076452, 1.142059, 1, 1, 1, 1, 1,
-0.5247853, 0.6357331, 0.2656519, 1, 1, 1, 1, 1,
-0.5237686, -0.1964209, -3.789042, 1, 1, 1, 1, 1,
-0.5205569, 1.769648, 0.8079097, 1, 1, 1, 1, 1,
-0.5200934, -0.4053219, -1.724297, 1, 1, 1, 1, 1,
-0.5154732, 1.203212, 0.4296065, 1, 1, 1, 1, 1,
-0.5072094, 0.2232082, -1.214049, 1, 1, 1, 1, 1,
-0.5066796, -1.447297, -2.174488, 1, 1, 1, 1, 1,
-0.5030118, -0.3891262, -3.513064, 1, 1, 1, 1, 1,
-0.4939247, 0.7715585, -0.8698137, 1, 1, 1, 1, 1,
-0.4860069, -0.1584253, 0.5091846, 1, 1, 1, 1, 1,
-0.4827596, -0.3039667, -1.657276, 1, 1, 1, 1, 1,
-0.4796594, 0.8575332, -0.2851748, 1, 1, 1, 1, 1,
-0.4779171, 0.2928105, -1.673044, 1, 1, 1, 1, 1,
-0.4720668, 2.081833, 0.06562664, 1, 1, 1, 1, 1,
-0.4717306, 0.004204244, -0.07083269, 0, 0, 1, 1, 1,
-0.4710844, 0.5399312, -0.7977316, 1, 0, 0, 1, 1,
-0.4707864, -1.024577, -3.792456, 1, 0, 0, 1, 1,
-0.4703383, 0.4049112, 0.1728581, 1, 0, 0, 1, 1,
-0.4634728, 0.1109378, -1.59723, 1, 0, 0, 1, 1,
-0.4578223, 0.2275235, -0.04049256, 1, 0, 0, 1, 1,
-0.4575283, 0.7221884, -2.197156, 0, 0, 0, 1, 1,
-0.451072, 0.1093611, -0.09737992, 0, 0, 0, 1, 1,
-0.4506765, -0.8682359, -3.588967, 0, 0, 0, 1, 1,
-0.4500017, -0.4481719, -1.637181, 0, 0, 0, 1, 1,
-0.4493961, 0.2795514, -0.7288305, 0, 0, 0, 1, 1,
-0.4488929, -0.5189083, -3.852857, 0, 0, 0, 1, 1,
-0.4442051, -0.4317693, -0.5822887, 0, 0, 0, 1, 1,
-0.4398894, -0.714119, -3.368391, 1, 1, 1, 1, 1,
-0.4396213, -1.970436, -5.201341, 1, 1, 1, 1, 1,
-0.436193, -0.008412484, -1.716302, 1, 1, 1, 1, 1,
-0.4336557, 0.9203294, 1.150429, 1, 1, 1, 1, 1,
-0.4310708, -0.001855982, -2.550952, 1, 1, 1, 1, 1,
-0.4295695, 1.407704, 0.176921, 1, 1, 1, 1, 1,
-0.4283964, -0.2249023, -3.389838, 1, 1, 1, 1, 1,
-0.4274936, 0.333011, -0.2366499, 1, 1, 1, 1, 1,
-0.4263632, 0.1332323, 0.05344654, 1, 1, 1, 1, 1,
-0.4241802, 0.7601873, -1.278134, 1, 1, 1, 1, 1,
-0.4181982, 0.3522982, -1.320677, 1, 1, 1, 1, 1,
-0.4164096, 1.019588, -0.005619549, 1, 1, 1, 1, 1,
-0.4143552, 0.1394638, -1.908578, 1, 1, 1, 1, 1,
-0.4120702, -0.882487, -2.524744, 1, 1, 1, 1, 1,
-0.4117827, 0.07659352, -1.665343, 1, 1, 1, 1, 1,
-0.4114787, 0.2502157, -2.607183, 0, 0, 1, 1, 1,
-0.4096316, 1.359258, -1.593133, 1, 0, 0, 1, 1,
-0.4080809, -2.372225, -4.253374, 1, 0, 0, 1, 1,
-0.4037981, -0.1450915, -2.558446, 1, 0, 0, 1, 1,
-0.3978098, -2.117518, -3.945372, 1, 0, 0, 1, 1,
-0.393007, -0.6674525, -3.17555, 1, 0, 0, 1, 1,
-0.3928822, 0.1562535, -1.520559, 0, 0, 0, 1, 1,
-0.3828011, 0.7361345, -0.5953653, 0, 0, 0, 1, 1,
-0.3747795, -0.2948593, -3.866315, 0, 0, 0, 1, 1,
-0.3734301, 0.4953841, -0.006632625, 0, 0, 0, 1, 1,
-0.3728273, -1.859761, -4.248785, 0, 0, 0, 1, 1,
-0.3705096, 0.5219496, 0.6823907, 0, 0, 0, 1, 1,
-0.3676188, -1.274438, -1.565631, 0, 0, 0, 1, 1,
-0.360557, 0.1356744, -3.099526, 1, 1, 1, 1, 1,
-0.3569799, -1.286018, -3.105196, 1, 1, 1, 1, 1,
-0.3487059, -0.8115439, -2.596483, 1, 1, 1, 1, 1,
-0.3427094, 2.023104, 0.2354423, 1, 1, 1, 1, 1,
-0.3388973, -3.182878, -1.264227, 1, 1, 1, 1, 1,
-0.333263, 0.2898534, -1.121746, 1, 1, 1, 1, 1,
-0.3314624, -0.159757, -2.993456, 1, 1, 1, 1, 1,
-0.331155, -1.253037, -1.766078, 1, 1, 1, 1, 1,
-0.3297897, 0.7622676, -1.263608, 1, 1, 1, 1, 1,
-0.32908, 0.6084286, -0.4546307, 1, 1, 1, 1, 1,
-0.3281599, -0.5498566, -4.003149, 1, 1, 1, 1, 1,
-0.3274776, -0.3585946, -3.669212, 1, 1, 1, 1, 1,
-0.3253535, 0.2170452, -1.5436, 1, 1, 1, 1, 1,
-0.3222876, 0.5843377, 0.2429958, 1, 1, 1, 1, 1,
-0.311226, -0.4502816, -0.906934, 1, 1, 1, 1, 1,
-0.3049917, -0.5150997, -3.095831, 0, 0, 1, 1, 1,
-0.3015403, -0.7653769, -2.164624, 1, 0, 0, 1, 1,
-0.300763, 0.357815, -2.737476, 1, 0, 0, 1, 1,
-0.3002266, -0.1074742, -2.924405, 1, 0, 0, 1, 1,
-0.2981222, 0.7132464, -0.4852043, 1, 0, 0, 1, 1,
-0.2913167, 0.6522706, -1.171789, 1, 0, 0, 1, 1,
-0.2910503, -0.08714254, -1.322747, 0, 0, 0, 1, 1,
-0.2899301, -0.2176676, -0.948038, 0, 0, 0, 1, 1,
-0.2894033, 0.7030632, 0.3236768, 0, 0, 0, 1, 1,
-0.2877407, 1.685345, -1.259568, 0, 0, 0, 1, 1,
-0.2827697, 0.3117336, -0.07420254, 0, 0, 0, 1, 1,
-0.2784515, -0.1064762, -2.269021, 0, 0, 0, 1, 1,
-0.2749505, 0.7910654, -0.7961208, 0, 0, 0, 1, 1,
-0.274221, 0.3637817, -1.177426, 1, 1, 1, 1, 1,
-0.2727959, 0.5112854, -1.768755, 1, 1, 1, 1, 1,
-0.2673481, 1.090039, -0.4878269, 1, 1, 1, 1, 1,
-0.2671954, 1.533162, -0.2814219, 1, 1, 1, 1, 1,
-0.2671531, 2.197426, -0.7581652, 1, 1, 1, 1, 1,
-0.263261, -0.6081674, -3.127169, 1, 1, 1, 1, 1,
-0.2621295, 0.3021829, -1.281917, 1, 1, 1, 1, 1,
-0.2599527, -3.416798, -3.166427, 1, 1, 1, 1, 1,
-0.2492001, -0.07295633, -1.461517, 1, 1, 1, 1, 1,
-0.2431099, 1.590379, -0.9844351, 1, 1, 1, 1, 1,
-0.2421447, -0.952094, -1.02859, 1, 1, 1, 1, 1,
-0.2380002, -0.3107029, -3.283756, 1, 1, 1, 1, 1,
-0.2362473, -0.2257663, -2.540109, 1, 1, 1, 1, 1,
-0.2337306, -0.8431342, -2.842455, 1, 1, 1, 1, 1,
-0.2297847, -0.04568684, 0.07009933, 1, 1, 1, 1, 1,
-0.2269276, 0.3853563, -0.1172978, 0, 0, 1, 1, 1,
-0.2241743, 0.2099479, -1.897041, 1, 0, 0, 1, 1,
-0.2225357, 0.6648991, 1.007081, 1, 0, 0, 1, 1,
-0.2218803, -0.5953807, -1.249637, 1, 0, 0, 1, 1,
-0.2190347, -0.1626241, -2.433546, 1, 0, 0, 1, 1,
-0.2183145, -0.01259733, -0.8727387, 1, 0, 0, 1, 1,
-0.2173898, -0.1140989, -3.768456, 0, 0, 0, 1, 1,
-0.2133997, -1.090016, -3.460902, 0, 0, 0, 1, 1,
-0.2091394, -0.7137408, -2.538976, 0, 0, 0, 1, 1,
-0.2071481, -0.6474764, -3.041185, 0, 0, 0, 1, 1,
-0.2062988, -0.8275203, -2.960523, 0, 0, 0, 1, 1,
-0.2037133, -0.3570434, -2.551846, 0, 0, 0, 1, 1,
-0.2019747, -1.759553, -2.266268, 0, 0, 0, 1, 1,
-0.2007583, 1.041147, -0.8198316, 1, 1, 1, 1, 1,
-0.2001968, 0.7590371, 0.5958596, 1, 1, 1, 1, 1,
-0.1912204, -0.1351054, -2.449275, 1, 1, 1, 1, 1,
-0.1891733, 1.037878, 0.4501455, 1, 1, 1, 1, 1,
-0.1837078, 0.7416151, -0.4450357, 1, 1, 1, 1, 1,
-0.1795735, -0.2722055, -2.618608, 1, 1, 1, 1, 1,
-0.1794789, 1.274588, 0.9327962, 1, 1, 1, 1, 1,
-0.1767318, -1.922668, -2.109119, 1, 1, 1, 1, 1,
-0.1755921, -0.4681933, -2.732805, 1, 1, 1, 1, 1,
-0.1755403, -1.256725, -1.50339, 1, 1, 1, 1, 1,
-0.1755361, -1.359587, -2.825256, 1, 1, 1, 1, 1,
-0.1741729, -1.40182, -2.927402, 1, 1, 1, 1, 1,
-0.1638242, -0.6737244, -1.167664, 1, 1, 1, 1, 1,
-0.1601073, 2.016844, -0.5352607, 1, 1, 1, 1, 1,
-0.1595865, -0.2015294, -4.356662, 1, 1, 1, 1, 1,
-0.1584763, 0.9968823, -0.5935405, 0, 0, 1, 1, 1,
-0.1568678, -1.03656, -3.288432, 1, 0, 0, 1, 1,
-0.1509992, 1.393364, 0.6101618, 1, 0, 0, 1, 1,
-0.1474709, -1.474705, -2.324931, 1, 0, 0, 1, 1,
-0.1447843, -0.4377995, -1.005779, 1, 0, 0, 1, 1,
-0.1442921, 0.7687531, -1.770545, 1, 0, 0, 1, 1,
-0.1437448, -0.3825518, -3.619351, 0, 0, 0, 1, 1,
-0.1422621, -1.857462, -3.051668, 0, 0, 0, 1, 1,
-0.1388421, 0.3951493, -2.667473, 0, 0, 0, 1, 1,
-0.1300232, -1.358789, -4.307767, 0, 0, 0, 1, 1,
-0.1232291, -1.279772, -1.629543, 0, 0, 0, 1, 1,
-0.1207723, -1.665036, -2.612765, 0, 0, 0, 1, 1,
-0.1199203, -0.445204, -1.592604, 0, 0, 0, 1, 1,
-0.1195754, 1.151801, 1.052945, 1, 1, 1, 1, 1,
-0.1191252, 1.555501, 0.7824439, 1, 1, 1, 1, 1,
-0.1170211, 0.818374, -0.3810433, 1, 1, 1, 1, 1,
-0.1127155, 0.7613318, 0.6730563, 1, 1, 1, 1, 1,
-0.1120494, -0.9134125, -3.322108, 1, 1, 1, 1, 1,
-0.1097807, -0.0418196, -2.50477, 1, 1, 1, 1, 1,
-0.1081197, -0.8242568, -4.024215, 1, 1, 1, 1, 1,
-0.1040928, 0.9481691, -0.244604, 1, 1, 1, 1, 1,
-0.09933778, 1.238233, 0.9942106, 1, 1, 1, 1, 1,
-0.0990401, 0.296712, 2.911698, 1, 1, 1, 1, 1,
-0.09895866, 1.17859, -0.5837482, 1, 1, 1, 1, 1,
-0.09187302, 0.3038268, -0.664176, 1, 1, 1, 1, 1,
-0.09149981, 0.8571182, -0.5141228, 1, 1, 1, 1, 1,
-0.09084801, -1.078235, -2.718869, 1, 1, 1, 1, 1,
-0.09075881, -1.327191, -3.932892, 1, 1, 1, 1, 1,
-0.08928006, -2.061164, -2.206045, 0, 0, 1, 1, 1,
-0.08709759, 0.3347012, 0.0427179, 1, 0, 0, 1, 1,
-0.08706304, 0.08580783, -1.516912, 1, 0, 0, 1, 1,
-0.08585977, 1.25939, -2.00671, 1, 0, 0, 1, 1,
-0.08452139, -1.004464, -4.770853, 1, 0, 0, 1, 1,
-0.08132512, 0.07097705, -1.918145, 1, 0, 0, 1, 1,
-0.08062443, -0.7549294, -3.124383, 0, 0, 0, 1, 1,
-0.07712565, -0.0614871, -2.74703, 0, 0, 0, 1, 1,
-0.06619386, 0.6263524, 0.9866681, 0, 0, 0, 1, 1,
-0.06474974, 0.8885826, -1.068611, 0, 0, 0, 1, 1,
-0.06128073, 0.827289, 0.7870837, 0, 0, 0, 1, 1,
-0.06108484, 0.353438, 1.624791, 0, 0, 0, 1, 1,
-0.04988774, 0.2369835, 1.765551, 0, 0, 0, 1, 1,
-0.04844948, 1.170963, -0.02910927, 1, 1, 1, 1, 1,
-0.04756411, -0.5519708, -3.484164, 1, 1, 1, 1, 1,
-0.04387178, -0.3228223, -2.860654, 1, 1, 1, 1, 1,
-0.04187606, 1.036885, -1.108981, 1, 1, 1, 1, 1,
-0.03885125, -1.30746, -2.223337, 1, 1, 1, 1, 1,
-0.03617041, 0.7171919, -0.8609259, 1, 1, 1, 1, 1,
-0.03532456, 1.129646, -0.7262518, 1, 1, 1, 1, 1,
-0.03083345, 0.06566994, -1.025241, 1, 1, 1, 1, 1,
-0.02872162, -0.7970107, -4.147836, 1, 1, 1, 1, 1,
-0.02725587, -1.305462, -4.537409, 1, 1, 1, 1, 1,
-0.02633147, 1.539556, 0.4780997, 1, 1, 1, 1, 1,
-0.02627612, 0.7092218, -0.226109, 1, 1, 1, 1, 1,
-0.0250922, 0.05787609, -0.8811733, 1, 1, 1, 1, 1,
-0.02306277, 0.2872916, 0.9833559, 1, 1, 1, 1, 1,
-0.01967883, -0.9663139, -2.89818, 1, 1, 1, 1, 1,
-0.01960881, -1.091483, -4.082203, 0, 0, 1, 1, 1,
-0.01586411, -0.5626027, -2.950927, 1, 0, 0, 1, 1,
-0.01402084, 0.7183672, -0.6337554, 1, 0, 0, 1, 1,
-0.008933957, -1.565499, -1.958586, 1, 0, 0, 1, 1,
-0.008015865, 0.5517038, 0.6437957, 1, 0, 0, 1, 1,
0.0003319941, 0.8179149, -0.9146983, 1, 0, 0, 1, 1,
0.00249312, 0.2014616, -0.0556047, 0, 0, 0, 1, 1,
0.002652396, 2.046437, 0.3317428, 0, 0, 0, 1, 1,
0.002938734, 2.578656, -0.5001711, 0, 0, 0, 1, 1,
0.005020082, 0.1459746, 0.5641639, 0, 0, 0, 1, 1,
0.006900792, 0.118973, 0.5738797, 0, 0, 0, 1, 1,
0.007129592, -0.7259387, 2.8881, 0, 0, 0, 1, 1,
0.01073964, -0.5595528, 3.417953, 0, 0, 0, 1, 1,
0.01525706, 2.088684, -1.163414, 1, 1, 1, 1, 1,
0.01632385, -0.8371641, 2.979855, 1, 1, 1, 1, 1,
0.01819705, 0.7199182, 1.863455, 1, 1, 1, 1, 1,
0.02051166, 0.1645105, 1.284215, 1, 1, 1, 1, 1,
0.02329895, -1.008832, 3.065054, 1, 1, 1, 1, 1,
0.02381717, 1.105275, -0.7322807, 1, 1, 1, 1, 1,
0.0253567, -0.6561623, 3.688967, 1, 1, 1, 1, 1,
0.02575463, -1.366117, 2.838936, 1, 1, 1, 1, 1,
0.03063554, -0.5902429, 3.528627, 1, 1, 1, 1, 1,
0.03140753, 0.6599883, -0.9394342, 1, 1, 1, 1, 1,
0.03358293, 0.8863194, -0.3035691, 1, 1, 1, 1, 1,
0.03607958, 0.8535802, -0.544013, 1, 1, 1, 1, 1,
0.03705767, -0.7609855, 3.785021, 1, 1, 1, 1, 1,
0.04184991, -1.503621, 2.518617, 1, 1, 1, 1, 1,
0.04303439, -1.309983, 2.875373, 1, 1, 1, 1, 1,
0.04427278, 0.1622847, 2.319194, 0, 0, 1, 1, 1,
0.04553816, -0.1011358, 2.048778, 1, 0, 0, 1, 1,
0.05510796, 0.2265601, 0.3456985, 1, 0, 0, 1, 1,
0.05665736, -1.555199, 3.050458, 1, 0, 0, 1, 1,
0.06114145, -1.988119, 2.117473, 1, 0, 0, 1, 1,
0.0624812, -0.7837216, 4.462965, 1, 0, 0, 1, 1,
0.06264722, -0.3674045, 1.111431, 0, 0, 0, 1, 1,
0.06463936, -0.513081, 3.171247, 0, 0, 0, 1, 1,
0.06670873, 0.3781911, 0.7861798, 0, 0, 0, 1, 1,
0.068824, 0.6051543, 1.030559, 0, 0, 0, 1, 1,
0.07161073, 0.4519507, 1.723004, 0, 0, 0, 1, 1,
0.07388267, 0.4579191, 0.1393796, 0, 0, 0, 1, 1,
0.07715606, -0.8486873, 0.7083792, 0, 0, 0, 1, 1,
0.08139642, 1.10514, -0.2343827, 1, 1, 1, 1, 1,
0.08706097, 1.715077, -0.01376716, 1, 1, 1, 1, 1,
0.08870699, -0.1901632, 2.703584, 1, 1, 1, 1, 1,
0.09040354, 0.5039383, 1.337817, 1, 1, 1, 1, 1,
0.09080108, -1.089135, 1.939091, 1, 1, 1, 1, 1,
0.09264159, 1.566591, 0.01379768, 1, 1, 1, 1, 1,
0.1046223, -0.08310629, 1.641138, 1, 1, 1, 1, 1,
0.1069041, 0.03971724, 1.109096, 1, 1, 1, 1, 1,
0.1078569, 0.5663907, -0.3678757, 1, 1, 1, 1, 1,
0.1144754, -1.215192, 4.192459, 1, 1, 1, 1, 1,
0.1163973, 2.256648, -0.8692284, 1, 1, 1, 1, 1,
0.1178433, 0.3793683, 1.19802, 1, 1, 1, 1, 1,
0.1184631, -0.003926078, 2.749159, 1, 1, 1, 1, 1,
0.1213239, -0.9130102, 3.704941, 1, 1, 1, 1, 1,
0.1228843, -1.393716, 5.218648, 1, 1, 1, 1, 1,
0.1249851, -0.3180225, 2.931099, 0, 0, 1, 1, 1,
0.1313377, -0.03954772, 0.7425829, 1, 0, 0, 1, 1,
0.1323556, 1.984084, -0.7474948, 1, 0, 0, 1, 1,
0.1359829, 0.9971884, 0.9211491, 1, 0, 0, 1, 1,
0.1373284, 0.4452994, -0.8465567, 1, 0, 0, 1, 1,
0.1389844, 1.953088, -1.82908, 1, 0, 0, 1, 1,
0.1398129, -1.610668, 2.546719, 0, 0, 0, 1, 1,
0.1421742, 0.9008346, -0.6939753, 0, 0, 0, 1, 1,
0.1505915, -1.355348, 2.127218, 0, 0, 0, 1, 1,
0.1537907, 0.930719, 1.484681, 0, 0, 0, 1, 1,
0.1580615, 0.7073238, 0.445759, 0, 0, 0, 1, 1,
0.162353, -1.553733, 1.233756, 0, 0, 0, 1, 1,
0.1636326, -0.2400256, 4.77745, 0, 0, 0, 1, 1,
0.1717912, -0.2246278, 1.439934, 1, 1, 1, 1, 1,
0.1721971, 0.05473638, 0.6695082, 1, 1, 1, 1, 1,
0.1763027, -0.3005047, 2.500072, 1, 1, 1, 1, 1,
0.1779723, 1.024834, -0.1783335, 1, 1, 1, 1, 1,
0.1782217, -0.2686508, 2.214923, 1, 1, 1, 1, 1,
0.1800687, -1.115032, 2.668857, 1, 1, 1, 1, 1,
0.190481, 3.000895, 1.608684, 1, 1, 1, 1, 1,
0.19326, -0.5477045, 3.77087, 1, 1, 1, 1, 1,
0.1985925, -1.1236, 1.551003, 1, 1, 1, 1, 1,
0.2068349, 0.5490947, 0.8490884, 1, 1, 1, 1, 1,
0.2140157, -0.08922976, 2.244052, 1, 1, 1, 1, 1,
0.2157888, -2.223168, 3.546039, 1, 1, 1, 1, 1,
0.2192388, 0.2494624, 0.6784909, 1, 1, 1, 1, 1,
0.2197534, 0.4723174, 0.874484, 1, 1, 1, 1, 1,
0.2224625, 0.4092762, 0.5633323, 1, 1, 1, 1, 1,
0.2306153, -0.01092264, 3.008166, 0, 0, 1, 1, 1,
0.2378915, 0.4144364, -0.2465996, 1, 0, 0, 1, 1,
0.2391137, 0.1629224, 2.083393, 1, 0, 0, 1, 1,
0.2407712, 1.261356, -0.1593097, 1, 0, 0, 1, 1,
0.24142, 0.8262361, 0.7236185, 1, 0, 0, 1, 1,
0.2417496, 0.2409019, 0.05078239, 1, 0, 0, 1, 1,
0.2453549, -0.6746572, 3.45646, 0, 0, 0, 1, 1,
0.2481693, -1.737315, 2.391829, 0, 0, 0, 1, 1,
0.2494612, 0.6901819, 1.273176, 0, 0, 0, 1, 1,
0.249822, -0.2506899, 3.071153, 0, 0, 0, 1, 1,
0.2531752, -0.556623, 3.761825, 0, 0, 0, 1, 1,
0.2538437, 0.1328684, 1.564636, 0, 0, 0, 1, 1,
0.2559281, -0.7590496, 3.424433, 0, 0, 0, 1, 1,
0.2602264, 0.4092081, 1.37923, 1, 1, 1, 1, 1,
0.26329, -1.508703, 3.255008, 1, 1, 1, 1, 1,
0.2663288, 0.2573292, 0.2569319, 1, 1, 1, 1, 1,
0.2700932, 2.572496, 1.561409, 1, 1, 1, 1, 1,
0.272381, 0.5334097, 1.586535, 1, 1, 1, 1, 1,
0.2767685, 0.2613675, 1.174895, 1, 1, 1, 1, 1,
0.2871598, 0.07695601, 0.261088, 1, 1, 1, 1, 1,
0.2881639, -0.7186444, 3.791359, 1, 1, 1, 1, 1,
0.28861, 0.09780264, 0.7090369, 1, 1, 1, 1, 1,
0.2914684, 1.984549, -0.4357447, 1, 1, 1, 1, 1,
0.2956025, 2.585283, 0.6140679, 1, 1, 1, 1, 1,
0.3004845, 0.181564, 2.98431, 1, 1, 1, 1, 1,
0.3103284, -1.063048, 4.003051, 1, 1, 1, 1, 1,
0.3126591, 1.837794, 0.5319125, 1, 1, 1, 1, 1,
0.3138706, 0.5329056, -0.5311013, 1, 1, 1, 1, 1,
0.3212583, 0.8010574, 1.248072, 0, 0, 1, 1, 1,
0.3213547, 0.9706805, -1.756776, 1, 0, 0, 1, 1,
0.3220582, -0.8912064, 3.107165, 1, 0, 0, 1, 1,
0.3249586, -0.2054111, 3.969058, 1, 0, 0, 1, 1,
0.3256984, -0.06446336, 2.657125, 1, 0, 0, 1, 1,
0.3291031, -1.11074, 1.92658, 1, 0, 0, 1, 1,
0.3382969, 0.140999, 0.7138422, 0, 0, 0, 1, 1,
0.3393216, -0.608834, 3.362637, 0, 0, 0, 1, 1,
0.3403397, 1.083498, 0.4342219, 0, 0, 0, 1, 1,
0.3404905, -0.110964, 3.012044, 0, 0, 0, 1, 1,
0.3433609, -1.033952, 3.593, 0, 0, 0, 1, 1,
0.3491594, 0.6518496, 1.423681, 0, 0, 0, 1, 1,
0.353145, -0.4093979, 2.032844, 0, 0, 0, 1, 1,
0.353344, 0.6066059, -0.3266767, 1, 1, 1, 1, 1,
0.3554548, 0.646568, 0.7811057, 1, 1, 1, 1, 1,
0.3568461, -1.617598, 2.721708, 1, 1, 1, 1, 1,
0.3578166, -1.52804, 4.841093, 1, 1, 1, 1, 1,
0.3625209, -0.09941325, 2.631841, 1, 1, 1, 1, 1,
0.3630674, 0.6805126, 1.043943, 1, 1, 1, 1, 1,
0.3637946, 0.1904261, 1.775867, 1, 1, 1, 1, 1,
0.3734804, -0.3099279, 3.221469, 1, 1, 1, 1, 1,
0.3760153, 0.6594954, 0.1370182, 1, 1, 1, 1, 1,
0.3805394, -0.828124, 2.660547, 1, 1, 1, 1, 1,
0.3826151, -0.400518, 3.057087, 1, 1, 1, 1, 1,
0.387179, 0.2754276, -0.71579, 1, 1, 1, 1, 1,
0.3878469, -0.1759551, 1.443225, 1, 1, 1, 1, 1,
0.3931146, 1.418893, -0.6670665, 1, 1, 1, 1, 1,
0.3936926, 1.789228, -1.15059, 1, 1, 1, 1, 1,
0.3989387, 0.6000948, 0.1342699, 0, 0, 1, 1, 1,
0.4062625, -0.126912, 2.359991, 1, 0, 0, 1, 1,
0.4064275, -0.5615357, 1.998749, 1, 0, 0, 1, 1,
0.4085073, -0.08314466, 2.342581, 1, 0, 0, 1, 1,
0.4154229, 0.06687743, 0.5645944, 1, 0, 0, 1, 1,
0.4169447, 0.375216, 2.654764, 1, 0, 0, 1, 1,
0.4179041, -0.8738669, 2.774137, 0, 0, 0, 1, 1,
0.4202239, 1.047946, -0.3056459, 0, 0, 0, 1, 1,
0.4211752, 1.448509, -1.332319, 0, 0, 0, 1, 1,
0.4241737, -0.815913, 3.80844, 0, 0, 0, 1, 1,
0.4291949, 0.273446, 1.551095, 0, 0, 0, 1, 1,
0.4323262, 0.2432724, 0.8869998, 0, 0, 0, 1, 1,
0.4327559, -1.268867, 2.986226, 0, 0, 0, 1, 1,
0.4341783, 0.1608186, -0.271787, 1, 1, 1, 1, 1,
0.4379663, -1.676237, 1.324063, 1, 1, 1, 1, 1,
0.4420311, -0.5935631, 3.843404, 1, 1, 1, 1, 1,
0.4461592, -0.8247055, 2.941603, 1, 1, 1, 1, 1,
0.4489116, 0.8048989, 0.3803368, 1, 1, 1, 1, 1,
0.4514534, 1.895572, 2.080775, 1, 1, 1, 1, 1,
0.4526318, 2.292944, -0.3317902, 1, 1, 1, 1, 1,
0.4571829, 0.1613616, -0.5083356, 1, 1, 1, 1, 1,
0.459933, 0.5322326, 0.8952029, 1, 1, 1, 1, 1,
0.4616529, 0.9632407, 0.8314015, 1, 1, 1, 1, 1,
0.4619395, -0.004848748, 0.4859385, 1, 1, 1, 1, 1,
0.4632104, -0.2780189, 1.97594, 1, 1, 1, 1, 1,
0.4663301, 0.5399688, 0.08665198, 1, 1, 1, 1, 1,
0.4680189, -0.8277826, 3.345767, 1, 1, 1, 1, 1,
0.4682724, 0.2245561, 0.928961, 1, 1, 1, 1, 1,
0.4729674, -0.9612758, 1.947166, 0, 0, 1, 1, 1,
0.4749098, -0.1908719, 3.3541, 1, 0, 0, 1, 1,
0.4759809, 0.6531861, 0.2410909, 1, 0, 0, 1, 1,
0.4775565, -0.5730137, 1.069865, 1, 0, 0, 1, 1,
0.4784358, 0.4990036, -0.5785085, 1, 0, 0, 1, 1,
0.4807006, 0.318966, 1.087151, 1, 0, 0, 1, 1,
0.4844346, 1.26585, 0.3120478, 0, 0, 0, 1, 1,
0.4860635, 0.596262, 1.523141, 0, 0, 0, 1, 1,
0.4869023, 1.035766, 1.747193, 0, 0, 0, 1, 1,
0.4970647, 0.6529596, 0.7798969, 0, 0, 0, 1, 1,
0.4977699, -1.525755, 1.931372, 0, 0, 0, 1, 1,
0.4981627, -3.252421, 5.16293, 0, 0, 0, 1, 1,
0.5022421, 1.21148, 2.399223, 0, 0, 0, 1, 1,
0.5110281, 0.6761162, 1.172655, 1, 1, 1, 1, 1,
0.5125241, 0.4315287, 0.9921985, 1, 1, 1, 1, 1,
0.5155843, 0.0963944, 0.7092929, 1, 1, 1, 1, 1,
0.516699, 0.269597, 2.267411, 1, 1, 1, 1, 1,
0.5188952, -0.4664567, 3.939163, 1, 1, 1, 1, 1,
0.5200503, -0.02664281, 2.294233, 1, 1, 1, 1, 1,
0.5257874, 0.5137078, 0.425967, 1, 1, 1, 1, 1,
0.5267723, -1.130709, 2.155051, 1, 1, 1, 1, 1,
0.5269353, -0.09987541, 0.7847148, 1, 1, 1, 1, 1,
0.5313893, -0.03430323, 1.047472, 1, 1, 1, 1, 1,
0.5314746, -0.5302414, 3.253909, 1, 1, 1, 1, 1,
0.5354173, 0.1334886, 2.10998, 1, 1, 1, 1, 1,
0.5387495, 0.2095174, 1.40962, 1, 1, 1, 1, 1,
0.5415916, 1.029259, 0.6571742, 1, 1, 1, 1, 1,
0.5437559, 0.3441532, 2.837968, 1, 1, 1, 1, 1,
0.5471442, 0.7389621, 2.031484, 0, 0, 1, 1, 1,
0.5599876, 0.1203922, 0.3864564, 1, 0, 0, 1, 1,
0.5609454, -0.0910756, 2.790154, 1, 0, 0, 1, 1,
0.5613865, -0.2187348, 2.46474, 1, 0, 0, 1, 1,
0.566749, -2.543433, 3.733457, 1, 0, 0, 1, 1,
0.5670424, -0.7564933, 2.482858, 1, 0, 0, 1, 1,
0.5677527, -0.694876, 1.621592, 0, 0, 0, 1, 1,
0.567912, 0.3531924, 1.473471, 0, 0, 0, 1, 1,
0.5694329, -0.8914784, 3.023486, 0, 0, 0, 1, 1,
0.5706449, 0.3083656, 0.0264707, 0, 0, 0, 1, 1,
0.5712257, 0.4119179, 0.9470834, 0, 0, 0, 1, 1,
0.5773338, 0.07524853, 1.238657, 0, 0, 0, 1, 1,
0.5939289, 0.0558467, 0.9772713, 0, 0, 0, 1, 1,
0.5942478, -0.3935602, 2.514774, 1, 1, 1, 1, 1,
0.5945618, 0.03223005, 2.855414, 1, 1, 1, 1, 1,
0.5950296, -0.332584, 0.275592, 1, 1, 1, 1, 1,
0.6005602, 0.3733187, 0.01151343, 1, 1, 1, 1, 1,
0.6050562, -0.1786348, 0.02832816, 1, 1, 1, 1, 1,
0.6079616, 0.121508, 2.158127, 1, 1, 1, 1, 1,
0.6086388, -0.227855, 1.211671, 1, 1, 1, 1, 1,
0.610466, 0.7392213, -0.532173, 1, 1, 1, 1, 1,
0.6187552, 1.25448, 2.280587, 1, 1, 1, 1, 1,
0.6211603, -0.6260182, 2.980415, 1, 1, 1, 1, 1,
0.6219006, -0.6616837, 1.20634, 1, 1, 1, 1, 1,
0.6225008, 0.6660156, 1.211714, 1, 1, 1, 1, 1,
0.6258659, -1.351092, 3.487046, 1, 1, 1, 1, 1,
0.6276684, 0.8278927, 1.374974, 1, 1, 1, 1, 1,
0.6288497, -0.8187299, 2.260366, 1, 1, 1, 1, 1,
0.6299414, 0.7279912, -0.4973956, 0, 0, 1, 1, 1,
0.6428891, 0.7340798, 0.4781855, 1, 0, 0, 1, 1,
0.6571717, -0.9661968, 1.984711, 1, 0, 0, 1, 1,
0.6590086, -0.5258124, 0.9439526, 1, 0, 0, 1, 1,
0.6628201, -1.191406, 3.376983, 1, 0, 0, 1, 1,
0.6642423, 1.174582, 0.2229327, 1, 0, 0, 1, 1,
0.6651813, -0.2886186, 2.261488, 0, 0, 0, 1, 1,
0.6659085, 0.4482109, -0.7849995, 0, 0, 0, 1, 1,
0.6661615, 0.3267286, -0.5702949, 0, 0, 0, 1, 1,
0.6668785, 0.6992391, 0.4189686, 0, 0, 0, 1, 1,
0.6690996, -0.2134812, 2.802011, 0, 0, 0, 1, 1,
0.669678, 0.2121858, 1.986024, 0, 0, 0, 1, 1,
0.6711648, 0.1299284, 0.4133798, 0, 0, 0, 1, 1,
0.6734079, 0.6008657, 2.701045, 1, 1, 1, 1, 1,
0.6820995, -0.7045954, 1.207994, 1, 1, 1, 1, 1,
0.6823626, -0.9153124, 1.592728, 1, 1, 1, 1, 1,
0.6860253, -0.278986, 1.973497, 1, 1, 1, 1, 1,
0.6881669, -0.1991269, 2.573578, 1, 1, 1, 1, 1,
0.7080647, -0.9431672, 1.197825, 1, 1, 1, 1, 1,
0.7102178, 0.4811326, 0.7765012, 1, 1, 1, 1, 1,
0.7103092, -0.3320761, 1.926741, 1, 1, 1, 1, 1,
0.7146705, 1.035102, 1.247176, 1, 1, 1, 1, 1,
0.7242419, -0.73643, 2.705198, 1, 1, 1, 1, 1,
0.7249801, -1.329678, 3.442399, 1, 1, 1, 1, 1,
0.7280614, -0.679995, 1.910916, 1, 1, 1, 1, 1,
0.7290636, -0.05887006, 2.582769, 1, 1, 1, 1, 1,
0.7295417, 0.7052169, 1.041284, 1, 1, 1, 1, 1,
0.7310899, -0.902643, 3.262, 1, 1, 1, 1, 1,
0.7325051, -0.758039, 2.065476, 0, 0, 1, 1, 1,
0.7360876, -0.6868085, 3.566386, 1, 0, 0, 1, 1,
0.7370721, -0.3345842, 1.887669, 1, 0, 0, 1, 1,
0.7397157, 0.1491037, -0.9775031, 1, 0, 0, 1, 1,
0.7425737, -0.8455601, 2.96394, 1, 0, 0, 1, 1,
0.7441575, -0.2039859, 2.093728, 1, 0, 0, 1, 1,
0.744792, 0.9219334, 1.264841, 0, 0, 0, 1, 1,
0.7509998, 0.6374598, 2.190832, 0, 0, 0, 1, 1,
0.7557473, -0.3040239, 2.51424, 0, 0, 0, 1, 1,
0.7635783, 0.7551421, -0.7168384, 0, 0, 0, 1, 1,
0.7640491, 0.6507815, 0.1598113, 0, 0, 0, 1, 1,
0.768522, 0.5519806, -0.5562819, 0, 0, 0, 1, 1,
0.770395, -0.4851516, 1.247209, 0, 0, 0, 1, 1,
0.7711343, -0.05301258, 1.522391, 1, 1, 1, 1, 1,
0.7724907, -1.421855, 2.965489, 1, 1, 1, 1, 1,
0.7752088, -0.4747063, 1.960754, 1, 1, 1, 1, 1,
0.7878333, 1.378451, 0.3479567, 1, 1, 1, 1, 1,
0.7951796, 0.432924, 1.263176, 1, 1, 1, 1, 1,
0.7952137, 0.7428904, 0.8480798, 1, 1, 1, 1, 1,
0.7983134, 0.0898177, 2.212063, 1, 1, 1, 1, 1,
0.8050529, 0.7602235, 0.7682923, 1, 1, 1, 1, 1,
0.8073995, 0.4243352, 0.5179383, 1, 1, 1, 1, 1,
0.8148821, 0.3077713, 0.773625, 1, 1, 1, 1, 1,
0.8168554, -0.138563, 2.668877, 1, 1, 1, 1, 1,
0.8222358, -1.189002, 2.729784, 1, 1, 1, 1, 1,
0.8402014, -0.3000105, -0.8987455, 1, 1, 1, 1, 1,
0.8423997, -0.9861133, 1.013134, 1, 1, 1, 1, 1,
0.8460968, -2.040558, 1.458189, 1, 1, 1, 1, 1,
0.8463595, -0.207536, 2.615255, 0, 0, 1, 1, 1,
0.847465, 2.164883, -0.4010736, 1, 0, 0, 1, 1,
0.8489211, -0.6288939, 0.996215, 1, 0, 0, 1, 1,
0.852921, 1.741441, -0.456578, 1, 0, 0, 1, 1,
0.8555797, 1.062155, -0.4807013, 1, 0, 0, 1, 1,
0.8560084, -0.5614624, 3.072534, 1, 0, 0, 1, 1,
0.860689, -1.323598, 2.712567, 0, 0, 0, 1, 1,
0.8611621, -0.2133735, 2.005315, 0, 0, 0, 1, 1,
0.8627387, -0.03138081, 2.466233, 0, 0, 0, 1, 1,
0.8669091, 0.1484734, 4.195631, 0, 0, 0, 1, 1,
0.8695629, 1.325648, 2.115776, 0, 0, 0, 1, 1,
0.8706336, 0.5304807, 0.08978905, 0, 0, 0, 1, 1,
0.8804714, 0.03579049, 1.965225, 0, 0, 0, 1, 1,
0.8832883, 1.007737, -1.463304, 1, 1, 1, 1, 1,
0.8860563, -0.1538054, 3.437322, 1, 1, 1, 1, 1,
0.8863923, 0.9625199, 1.528104, 1, 1, 1, 1, 1,
0.8892125, 1.855703, -1.534777, 1, 1, 1, 1, 1,
0.8901154, 1.516791, 2.271421, 1, 1, 1, 1, 1,
0.8996225, -1.154758, 2.555645, 1, 1, 1, 1, 1,
0.9078285, -0.4318144, 2.141382, 1, 1, 1, 1, 1,
0.908796, -0.07800055, 3.017176, 1, 1, 1, 1, 1,
0.9094114, -0.430363, 1.797911, 1, 1, 1, 1, 1,
0.9130893, 0.3051687, 1.154126, 1, 1, 1, 1, 1,
0.9162242, -0.8580136, 4.785145, 1, 1, 1, 1, 1,
0.9197281, 0.1760151, 1.459563, 1, 1, 1, 1, 1,
0.9273455, 0.6623441, 1.766988, 1, 1, 1, 1, 1,
0.9327229, 0.01339693, -0.4780534, 1, 1, 1, 1, 1,
0.936968, -0.6831439, 1.558944, 1, 1, 1, 1, 1,
0.9413183, 1.406637, -0.7557501, 0, 0, 1, 1, 1,
0.9481173, 0.1735413, -0.07710095, 1, 0, 0, 1, 1,
0.9572027, -1.391307, 4.550231, 1, 0, 0, 1, 1,
0.9617625, -1.423199, 3.291656, 1, 0, 0, 1, 1,
0.9671262, -1.897102, 2.465218, 1, 0, 0, 1, 1,
0.9673081, 0.2491979, 1.302472, 1, 0, 0, 1, 1,
0.9702435, -0.5852455, 2.829571, 0, 0, 0, 1, 1,
0.973887, -0.04727478, 2.860753, 0, 0, 0, 1, 1,
0.9817947, 0.2852381, 2.684813, 0, 0, 0, 1, 1,
1.001172, 0.902326, 2.379552, 0, 0, 0, 1, 1,
1.002064, 0.2465863, 0.6894138, 0, 0, 0, 1, 1,
1.00333, 0.5127011, -0.1679575, 0, 0, 0, 1, 1,
1.00393, 1.510914, -0.6714041, 0, 0, 0, 1, 1,
1.011844, -0.130457, 1.711573, 1, 1, 1, 1, 1,
1.017251, 0.4428863, 1.330458, 1, 1, 1, 1, 1,
1.020439, 0.4911759, -0.05316087, 1, 1, 1, 1, 1,
1.021205, 0.1108288, 0.1064984, 1, 1, 1, 1, 1,
1.022785, 1.941978, 0.1729546, 1, 1, 1, 1, 1,
1.039243, 0.2805888, 1.210416, 1, 1, 1, 1, 1,
1.048305, -1.125653, 2.412805, 1, 1, 1, 1, 1,
1.049551, -0.7277545, 4.000706, 1, 1, 1, 1, 1,
1.051415, 0.3026631, 0.7598792, 1, 1, 1, 1, 1,
1.053707, -1.679065, 2.163474, 1, 1, 1, 1, 1,
1.056796, 0.8884737, 0.1613328, 1, 1, 1, 1, 1,
1.060486, -0.09169444, -0.03532472, 1, 1, 1, 1, 1,
1.068077, 0.463729, -0.262476, 1, 1, 1, 1, 1,
1.068551, 1.391936, 1.804504, 1, 1, 1, 1, 1,
1.069163, 0.1752061, 1.280148, 1, 1, 1, 1, 1,
1.069826, 1.444187, 0.4217767, 0, 0, 1, 1, 1,
1.072045, -0.02057005, 2.144413, 1, 0, 0, 1, 1,
1.073179, 0.1859979, 0.4885304, 1, 0, 0, 1, 1,
1.074028, 0.534148, 2.131532, 1, 0, 0, 1, 1,
1.083823, 0.8373298, 0.2331903, 1, 0, 0, 1, 1,
1.086164, 0.1211779, 0.3720159, 1, 0, 0, 1, 1,
1.086861, -0.1622801, 1.141723, 0, 0, 0, 1, 1,
1.100888, -0.8640993, 3.435831, 0, 0, 0, 1, 1,
1.103926, 0.7336968, 1.743253, 0, 0, 0, 1, 1,
1.110853, 0.03469571, 0.1405151, 0, 0, 0, 1, 1,
1.115325, -1.669853, 2.051718, 0, 0, 0, 1, 1,
1.126071, 0.1049287, -0.2259351, 0, 0, 0, 1, 1,
1.126768, -0.4298976, 3.074536, 0, 0, 0, 1, 1,
1.128397, 0.3033994, 1.251715, 1, 1, 1, 1, 1,
1.129609, 1.014556, 0.7456309, 1, 1, 1, 1, 1,
1.130526, 0.4299818, 0.6234908, 1, 1, 1, 1, 1,
1.13254, -0.1302665, 2.695762, 1, 1, 1, 1, 1,
1.135506, -0.4267335, 1.391944, 1, 1, 1, 1, 1,
1.150054, -0.4234215, 3.209383, 1, 1, 1, 1, 1,
1.155332, -0.02316975, 0.9313084, 1, 1, 1, 1, 1,
1.155381, 1.735082, 1.391792, 1, 1, 1, 1, 1,
1.165083, -0.801632, 1.856733, 1, 1, 1, 1, 1,
1.168337, 0.9340327, 1.554976, 1, 1, 1, 1, 1,
1.17317, -0.5663551, 0.8256658, 1, 1, 1, 1, 1,
1.181484, 0.1518211, 1.160693, 1, 1, 1, 1, 1,
1.182301, 0.07956478, 0.0401979, 1, 1, 1, 1, 1,
1.182605, 0.1809945, 1.248542, 1, 1, 1, 1, 1,
1.185663, 0.7274246, 0.1668582, 1, 1, 1, 1, 1,
1.190634, 0.4009534, 1.018521, 0, 0, 1, 1, 1,
1.191249, 0.487549, -0.1499395, 1, 0, 0, 1, 1,
1.191348, 0.4194931, 0.2885756, 1, 0, 0, 1, 1,
1.202521, -0.2477734, 1.132963, 1, 0, 0, 1, 1,
1.203573, -1.313467, 4.489106, 1, 0, 0, 1, 1,
1.221928, -0.1256665, 1.329899, 1, 0, 0, 1, 1,
1.224655, 0.897593, 0.9999759, 0, 0, 0, 1, 1,
1.229564, -2.233938, 2.660437, 0, 0, 0, 1, 1,
1.232357, -0.5539522, 3.448214, 0, 0, 0, 1, 1,
1.257383, 1.185641, -0.5738425, 0, 0, 0, 1, 1,
1.257457, -0.1535877, 3.110496, 0, 0, 0, 1, 1,
1.270883, -1.451541, 2.560335, 0, 0, 0, 1, 1,
1.271052, 1.061672, 0.9596781, 0, 0, 0, 1, 1,
1.271061, 0.5949043, 1.401047, 1, 1, 1, 1, 1,
1.288172, 0.2912377, 1.050523, 1, 1, 1, 1, 1,
1.29864, -0.3401532, 0.5063631, 1, 1, 1, 1, 1,
1.30762, -0.5362948, 1.85024, 1, 1, 1, 1, 1,
1.313157, 0.7542834, 0.1967456, 1, 1, 1, 1, 1,
1.316105, -0.9766003, 2.074792, 1, 1, 1, 1, 1,
1.320019, -0.1292649, 1.541253, 1, 1, 1, 1, 1,
1.326943, -0.276246, 2.456218, 1, 1, 1, 1, 1,
1.336513, 0.502925, -1.655161, 1, 1, 1, 1, 1,
1.348238, 1.196035, 2.572768, 1, 1, 1, 1, 1,
1.348376, -0.1587113, 1.451133, 1, 1, 1, 1, 1,
1.350628, -0.5982156, 2.21822, 1, 1, 1, 1, 1,
1.35203, 2.061409, 0.3435201, 1, 1, 1, 1, 1,
1.357512, -0.2701582, 3.600066, 1, 1, 1, 1, 1,
1.367415, 0.6647057, 1.74775, 1, 1, 1, 1, 1,
1.370685, 0.9384891, -0.3561054, 0, 0, 1, 1, 1,
1.371179, 0.5538256, 1.824885, 1, 0, 0, 1, 1,
1.380365, -0.3138537, 0.4145303, 1, 0, 0, 1, 1,
1.386233, -1.241783, 0.1137543, 1, 0, 0, 1, 1,
1.393469, 0.690827, 1.103932, 1, 0, 0, 1, 1,
1.409835, 0.5393392, 1.487492, 1, 0, 0, 1, 1,
1.413599, -0.3049169, 2.130466, 0, 0, 0, 1, 1,
1.425018, 2.013341, 2.367131, 0, 0, 0, 1, 1,
1.425587, 0.541238, 2.239419, 0, 0, 0, 1, 1,
1.430438, 0.8073611, 1.662025, 0, 0, 0, 1, 1,
1.436103, -0.430873, 2.353156, 0, 0, 0, 1, 1,
1.436244, 1.19072, 1.03932, 0, 0, 0, 1, 1,
1.440352, 0.353335, -0.0486653, 0, 0, 0, 1, 1,
1.442017, -1.55576, 2.4611, 1, 1, 1, 1, 1,
1.453931, -0.1685271, 2.713914, 1, 1, 1, 1, 1,
1.467265, -0.8123467, 1.504812, 1, 1, 1, 1, 1,
1.477069, -0.5159294, 1.604661, 1, 1, 1, 1, 1,
1.485095, 0.7086493, 2.364353, 1, 1, 1, 1, 1,
1.486475, -0.005774125, 2.067491, 1, 1, 1, 1, 1,
1.495777, -0.9456215, 0.8489203, 1, 1, 1, 1, 1,
1.496541, -2.074396, 2.244155, 1, 1, 1, 1, 1,
1.502023, -0.2338313, 1.364496, 1, 1, 1, 1, 1,
1.50524, -0.9393777, 2.307184, 1, 1, 1, 1, 1,
1.514748, 0.819249, 2.360655, 1, 1, 1, 1, 1,
1.516955, 0.4023455, 0.7227291, 1, 1, 1, 1, 1,
1.529504, 1.17555, -0.382628, 1, 1, 1, 1, 1,
1.533722, 0.916943, -0.5338798, 1, 1, 1, 1, 1,
1.544385, 0.8319034, -1.139631, 1, 1, 1, 1, 1,
1.546978, -0.4620956, 1.293569, 0, 0, 1, 1, 1,
1.569758, -1.946014, 2.632146, 1, 0, 0, 1, 1,
1.570307, -0.7197369, 2.957121, 1, 0, 0, 1, 1,
1.583559, -0.3979098, 2.611901, 1, 0, 0, 1, 1,
1.591281, -0.25165, 2.977165, 1, 0, 0, 1, 1,
1.60469, 1.226662, 1.251534, 1, 0, 0, 1, 1,
1.606585, -1.34283, 1.56209, 0, 0, 0, 1, 1,
1.612441, 0.02564135, 1.504964, 0, 0, 0, 1, 1,
1.612996, -0.3357372, 2.332477, 0, 0, 0, 1, 1,
1.618918, 0.9618185, 1.41248, 0, 0, 0, 1, 1,
1.620309, -0.5945793, 2.782775, 0, 0, 0, 1, 1,
1.63056, -1.095788, 1.755965, 0, 0, 0, 1, 1,
1.633268, -0.7362478, 2.198416, 0, 0, 0, 1, 1,
1.634616, -2.0464, 0.8368273, 1, 1, 1, 1, 1,
1.63592, -0.6451945, 2.371624, 1, 1, 1, 1, 1,
1.650444, 1.304211, 2.149025, 1, 1, 1, 1, 1,
1.65352, 0.04352378, 1.549548, 1, 1, 1, 1, 1,
1.65981, 0.57088, 1.25878, 1, 1, 1, 1, 1,
1.682879, -0.3029605, 1.44053, 1, 1, 1, 1, 1,
1.687115, 2.280278, 1.092313, 1, 1, 1, 1, 1,
1.703902, 0.008754449, 1.37142, 1, 1, 1, 1, 1,
1.704886, -1.040201, 1.685961, 1, 1, 1, 1, 1,
1.713937, 0.3864022, 1.491452, 1, 1, 1, 1, 1,
1.718375, -0.4092193, 2.401964, 1, 1, 1, 1, 1,
1.72759, -0.4046747, 3.458326, 1, 1, 1, 1, 1,
1.730681, -1.33979, 3.191211, 1, 1, 1, 1, 1,
1.73325, 0.408605, 1.575849, 1, 1, 1, 1, 1,
1.733536, -1.599658, 1.989406, 1, 1, 1, 1, 1,
1.736851, 0.08632228, 2.251067, 0, 0, 1, 1, 1,
1.772477, -0.139206, 2.366972, 1, 0, 0, 1, 1,
1.773165, 0.182422, 1.642551, 1, 0, 0, 1, 1,
1.821123, -0.71797, 1.814145, 1, 0, 0, 1, 1,
1.823427, -2.110018, 3.511678, 1, 0, 0, 1, 1,
1.835794, 0.416647, 0.1176914, 1, 0, 0, 1, 1,
1.845572, 0.6181709, 1.08538, 0, 0, 0, 1, 1,
1.876104, -2.300962, 2.276396, 0, 0, 0, 1, 1,
1.879784, -0.8822893, 1.269043, 0, 0, 0, 1, 1,
1.879945, -1.239663, 1.676976, 0, 0, 0, 1, 1,
1.899221, 0.8833658, 2.071386, 0, 0, 0, 1, 1,
1.93294, -0.1937246, 1.201149, 0, 0, 0, 1, 1,
1.95922, -0.2932638, -0.5688267, 0, 0, 0, 1, 1,
1.966894, 0.3471781, 1.218454, 1, 1, 1, 1, 1,
1.985063, -0.2811672, 2.284296, 1, 1, 1, 1, 1,
1.997846, 0.160706, 3.090996, 1, 1, 1, 1, 1,
2.012151, 0.8279752, 0.3862423, 1, 1, 1, 1, 1,
2.018838, -0.913064, 4.332214, 1, 1, 1, 1, 1,
2.028346, -0.6107627, 1.55487, 1, 1, 1, 1, 1,
2.034145, -0.9047262, 2.060132, 1, 1, 1, 1, 1,
2.038623, -0.1674094, 1.813937, 1, 1, 1, 1, 1,
2.052707, 1.437261, 3.045376, 1, 1, 1, 1, 1,
2.078112, -0.2758466, 1.232537, 1, 1, 1, 1, 1,
2.089557, -0.2927535, 1.295786, 1, 1, 1, 1, 1,
2.093467, 0.05647048, 3.072777, 1, 1, 1, 1, 1,
2.1038, 0.2930752, 0.900539, 1, 1, 1, 1, 1,
2.140788, -0.09697292, 1.989217, 1, 1, 1, 1, 1,
2.14786, -1.097302, 0.4215686, 1, 1, 1, 1, 1,
2.148916, 1.364948, 0.3432769, 0, 0, 1, 1, 1,
2.172709, 0.5526533, 1.073795, 1, 0, 0, 1, 1,
2.181457, 2.451704, 0.3297698, 1, 0, 0, 1, 1,
2.256448, -1.526264, 0.8857303, 1, 0, 0, 1, 1,
2.288415, -0.207791, 0.8885728, 1, 0, 0, 1, 1,
2.37925, 0.8658046, 0.278905, 1, 0, 0, 1, 1,
2.380566, -0.7243047, 1.553379, 0, 0, 0, 1, 1,
2.392251, 1.744975, 1.166189, 0, 0, 0, 1, 1,
2.419445, -0.5226588, 2.038718, 0, 0, 0, 1, 1,
2.480601, 0.8979958, 0.9582512, 0, 0, 0, 1, 1,
2.493707, 0.6088007, 1.675123, 0, 0, 0, 1, 1,
2.501807, -0.6112297, 1.297264, 0, 0, 0, 1, 1,
2.664485, 1.157886, 0.0191139, 0, 0, 0, 1, 1,
2.698441, 0.1365537, 1.949213, 1, 1, 1, 1, 1,
2.742477, 0.44498, 0.8019702, 1, 1, 1, 1, 1,
2.748424, 1.17227, 1.328252, 1, 1, 1, 1, 1,
2.8488, -0.9815753, 0.02675358, 1, 1, 1, 1, 1,
2.949607, 1.93868, 1.871029, 1, 1, 1, 1, 1,
3.071776, -0.2752449, 1.896397, 1, 1, 1, 1, 1,
3.82933, -0.8875617, 0.5125244, 1, 1, 1, 1, 1
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
var radius = 9.698205;
var distance = 34.06453;
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
mvMatrix.translate( -0.2489011, 0.2079515, 0.02929759 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.06453);
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
