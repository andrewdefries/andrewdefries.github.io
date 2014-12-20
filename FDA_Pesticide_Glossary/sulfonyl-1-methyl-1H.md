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
-2.979491, 0.2823505, -1.411176, 1, 0, 0, 1,
-2.942991, -1.026034, -0.925246, 1, 0.007843138, 0, 1,
-2.942929, -0.5565668, -2.933084, 1, 0.01176471, 0, 1,
-2.821097, 0.105925, -0.7496482, 1, 0.01960784, 0, 1,
-2.729288, 0.2052551, -1.154266, 1, 0.02352941, 0, 1,
-2.650661, -0.112173, -1.414194, 1, 0.03137255, 0, 1,
-2.488884, 2.190899, -1.112133, 1, 0.03529412, 0, 1,
-2.410163, 0.08217549, -1.206717, 1, 0.04313726, 0, 1,
-2.330845, -0.7686855, -3.622549, 1, 0.04705882, 0, 1,
-2.292872, 0.6806134, -2.274932, 1, 0.05490196, 0, 1,
-2.25102, 0.9365194, 0.285944, 1, 0.05882353, 0, 1,
-2.219176, -1.268591, -3.95714, 1, 0.06666667, 0, 1,
-2.186023, -1.382405, -3.370729, 1, 0.07058824, 0, 1,
-2.174711, 1.173366, -1.655623, 1, 0.07843138, 0, 1,
-2.142161, 1.852449, -0.9709204, 1, 0.08235294, 0, 1,
-2.117614, 1.309157, -0.7305794, 1, 0.09019608, 0, 1,
-2.115205, 1.607467, -1.335174, 1, 0.09411765, 0, 1,
-2.038093, -0.2560715, -1.049063, 1, 0.1019608, 0, 1,
-2.013903, 1.69413, 0.05282793, 1, 0.1098039, 0, 1,
-2.004866, -0.6626046, -2.082497, 1, 0.1137255, 0, 1,
-1.985639, 0.03165626, -1.803669, 1, 0.1215686, 0, 1,
-1.98539, -0.4856786, -0.5209411, 1, 0.1254902, 0, 1,
-1.94633, 1.186591, -1.32062, 1, 0.1333333, 0, 1,
-1.937527, 0.6638168, -0.6269507, 1, 0.1372549, 0, 1,
-1.92774, 2.108235, -0.8603405, 1, 0.145098, 0, 1,
-1.927382, 0.3449396, -1.860995, 1, 0.1490196, 0, 1,
-1.916089, 0.3915527, -2.388621, 1, 0.1568628, 0, 1,
-1.9097, -0.189963, -1.495318, 1, 0.1607843, 0, 1,
-1.89992, 0.9732842, -1.952075, 1, 0.1686275, 0, 1,
-1.899498, -0.2136712, -0.07147579, 1, 0.172549, 0, 1,
-1.896406, 0.9180282, 0.2946618, 1, 0.1803922, 0, 1,
-1.875444, -0.6764665, -2.470416, 1, 0.1843137, 0, 1,
-1.852573, 1.194458, -1.147292, 1, 0.1921569, 0, 1,
-1.851756, 1.111242, -1.440926, 1, 0.1960784, 0, 1,
-1.833976, -0.2536474, -2.327312, 1, 0.2039216, 0, 1,
-1.819005, 0.5159183, -2.283105, 1, 0.2117647, 0, 1,
-1.812407, -0.5846556, -1.044969, 1, 0.2156863, 0, 1,
-1.79468, -0.5387065, -1.769764, 1, 0.2235294, 0, 1,
-1.7841, 0.957324, -2.598675, 1, 0.227451, 0, 1,
-1.754162, -0.699063, -0.1535496, 1, 0.2352941, 0, 1,
-1.732562, -1.541028, -1.46827, 1, 0.2392157, 0, 1,
-1.728254, -0.03088198, -0.6029708, 1, 0.2470588, 0, 1,
-1.693985, 1.254241, 0.2342272, 1, 0.2509804, 0, 1,
-1.684415, -0.8929174, -1.767303, 1, 0.2588235, 0, 1,
-1.660713, 0.2552106, -1.739967, 1, 0.2627451, 0, 1,
-1.644018, 0.9050599, -0.5111331, 1, 0.2705882, 0, 1,
-1.64358, -0.4551901, -1.580073, 1, 0.2745098, 0, 1,
-1.642842, 1.442206, 0.03767691, 1, 0.282353, 0, 1,
-1.632213, 0.8530719, -0.2362467, 1, 0.2862745, 0, 1,
-1.630891, -0.1562389, -2.567538, 1, 0.2941177, 0, 1,
-1.61526, 1.347803, -0.6460527, 1, 0.3019608, 0, 1,
-1.613957, 1.837218, -1.043391, 1, 0.3058824, 0, 1,
-1.589978, 0.001655231, -0.7011427, 1, 0.3137255, 0, 1,
-1.588882, 0.8892292, -1.480699, 1, 0.3176471, 0, 1,
-1.58638, -0.1664208, -2.722081, 1, 0.3254902, 0, 1,
-1.575285, -1.72656, -1.664458, 1, 0.3294118, 0, 1,
-1.571783, 1.603854, -1.037841, 1, 0.3372549, 0, 1,
-1.569701, 1.098716, -0.5642118, 1, 0.3411765, 0, 1,
-1.55986, -0.1970307, -2.219715, 1, 0.3490196, 0, 1,
-1.559374, 1.046951, -1.606995, 1, 0.3529412, 0, 1,
-1.559139, -1.038543, -2.096583, 1, 0.3607843, 0, 1,
-1.547585, 0.1051574, 0.6168939, 1, 0.3647059, 0, 1,
-1.543957, -0.2736733, -2.65497, 1, 0.372549, 0, 1,
-1.543314, 1.326338, -2.190794, 1, 0.3764706, 0, 1,
-1.542375, -1.013608, -1.681837, 1, 0.3843137, 0, 1,
-1.541947, 0.09556114, -1.693737, 1, 0.3882353, 0, 1,
-1.533876, 1.501441, -0.7376058, 1, 0.3960784, 0, 1,
-1.530665, 1.450232, -0.7918252, 1, 0.4039216, 0, 1,
-1.52949, 1.804779, -1.264518, 1, 0.4078431, 0, 1,
-1.527565, -0.576707, -1.474516, 1, 0.4156863, 0, 1,
-1.525562, -1.409395, -0.2874036, 1, 0.4196078, 0, 1,
-1.512513, 0.2699419, -2.240056, 1, 0.427451, 0, 1,
-1.483651, -0.5275612, -0.05324501, 1, 0.4313726, 0, 1,
-1.482129, -2.424726, -3.057335, 1, 0.4392157, 0, 1,
-1.477434, 1.775467, -0.9397148, 1, 0.4431373, 0, 1,
-1.46642, 0.5110504, -1.813556, 1, 0.4509804, 0, 1,
-1.460585, -0.1070867, -2.963245, 1, 0.454902, 0, 1,
-1.45189, 0.161202, -3.317526, 1, 0.4627451, 0, 1,
-1.451302, -0.8588881, -2.86413, 1, 0.4666667, 0, 1,
-1.44058, -0.4766826, -1.568731, 1, 0.4745098, 0, 1,
-1.432091, 0.1170381, -2.447141, 1, 0.4784314, 0, 1,
-1.429441, 0.9541648, 1.086403, 1, 0.4862745, 0, 1,
-1.417533, -0.4860813, -0.8162038, 1, 0.4901961, 0, 1,
-1.412582, 0.7970908, -1.001003, 1, 0.4980392, 0, 1,
-1.408349, 0.3340873, -2.190091, 1, 0.5058824, 0, 1,
-1.406343, 0.1809196, -2.797462, 1, 0.509804, 0, 1,
-1.400964, 0.3581479, -2.678526, 1, 0.5176471, 0, 1,
-1.399439, -0.3681825, -1.906121, 1, 0.5215687, 0, 1,
-1.391595, -1.115134, -2.414672, 1, 0.5294118, 0, 1,
-1.390696, 0.2743628, -1.899931, 1, 0.5333334, 0, 1,
-1.387935, 1.275471, -2.741382, 1, 0.5411765, 0, 1,
-1.383747, -1.236274, -4.254708, 1, 0.5450981, 0, 1,
-1.379114, 0.4893731, -2.298184, 1, 0.5529412, 0, 1,
-1.373529, -1.644625, -3.458821, 1, 0.5568628, 0, 1,
-1.36658, 1.83076, 0.0425823, 1, 0.5647059, 0, 1,
-1.364916, -0.01338694, -2.017732, 1, 0.5686275, 0, 1,
-1.360692, -0.5813504, -2.184584, 1, 0.5764706, 0, 1,
-1.359189, 0.6993819, -2.134461, 1, 0.5803922, 0, 1,
-1.357521, 1.374724, -0.5252196, 1, 0.5882353, 0, 1,
-1.356899, 0.1138353, 0.9506733, 1, 0.5921569, 0, 1,
-1.349825, 1.368282, -1.496362, 1, 0.6, 0, 1,
-1.325817, 1.16915, 0.1745468, 1, 0.6078432, 0, 1,
-1.323272, -1.226926, -2.382333, 1, 0.6117647, 0, 1,
-1.31437, 2.320257, -1.10413, 1, 0.6196079, 0, 1,
-1.30613, 1.042222, -0.3795684, 1, 0.6235294, 0, 1,
-1.305388, 0.9140266, -1.402738, 1, 0.6313726, 0, 1,
-1.303006, -1.104437, -2.649002, 1, 0.6352941, 0, 1,
-1.284955, -1.662661, -3.511991, 1, 0.6431373, 0, 1,
-1.276619, -0.7212527, -0.9857144, 1, 0.6470588, 0, 1,
-1.273824, 1.088251, -1.96878, 1, 0.654902, 0, 1,
-1.273724, 0.4384792, -2.350723, 1, 0.6588235, 0, 1,
-1.27039, 0.5117202, -0.2880557, 1, 0.6666667, 0, 1,
-1.26984, 0.26818, -0.3294623, 1, 0.6705883, 0, 1,
-1.249691, 0.4090641, -0.33349, 1, 0.6784314, 0, 1,
-1.244904, -1.132383, -3.007016, 1, 0.682353, 0, 1,
-1.244863, 1.469421, -1.058228, 1, 0.6901961, 0, 1,
-1.243478, -1.27861, -1.524171, 1, 0.6941177, 0, 1,
-1.23886, -1.329522, -4.406576, 1, 0.7019608, 0, 1,
-1.237904, 0.8859131, -1.258909, 1, 0.7098039, 0, 1,
-1.219786, 1.970626, 0.6803843, 1, 0.7137255, 0, 1,
-1.207867, -0.581681, -3.119802, 1, 0.7215686, 0, 1,
-1.201843, -0.2026272, -0.7782328, 1, 0.7254902, 0, 1,
-1.201726, 0.5357999, -0.3167039, 1, 0.7333333, 0, 1,
-1.198988, -0.4563715, -1.008888, 1, 0.7372549, 0, 1,
-1.198445, 0.7510034, -1.068463, 1, 0.7450981, 0, 1,
-1.186674, 0.361537, 0.6361698, 1, 0.7490196, 0, 1,
-1.185588, -2.215394, -2.284198, 1, 0.7568628, 0, 1,
-1.16942, -0.1929993, -4.423908, 1, 0.7607843, 0, 1,
-1.166588, 0.9440992, -0.2592392, 1, 0.7686275, 0, 1,
-1.163606, 0.1404669, -0.8148897, 1, 0.772549, 0, 1,
-1.158269, 0.3134881, -1.509538, 1, 0.7803922, 0, 1,
-1.154527, -0.2790126, -1.185892, 1, 0.7843137, 0, 1,
-1.154476, -0.1990246, -0.3885338, 1, 0.7921569, 0, 1,
-1.152166, -1.768137, -3.752148, 1, 0.7960784, 0, 1,
-1.149994, 0.01085613, -0.2421179, 1, 0.8039216, 0, 1,
-1.142195, 0.4763203, -1.719505, 1, 0.8117647, 0, 1,
-1.140206, 0.5616972, 1.402762, 1, 0.8156863, 0, 1,
-1.132845, 1.631453, -0.540529, 1, 0.8235294, 0, 1,
-1.128741, 0.5033888, 1.744768, 1, 0.827451, 0, 1,
-1.117189, 1.807926, -0.9574899, 1, 0.8352941, 0, 1,
-1.10888, -0.2203471, -0.4336335, 1, 0.8392157, 0, 1,
-1.108178, 1.114931, 1.254309, 1, 0.8470588, 0, 1,
-1.098141, 2.381327, -1.076732, 1, 0.8509804, 0, 1,
-1.097941, -0.6322877, -3.244147, 1, 0.8588235, 0, 1,
-1.096705, 0.563356, 0.6326499, 1, 0.8627451, 0, 1,
-1.095951, 1.577407, -1.10795, 1, 0.8705882, 0, 1,
-1.093099, 0.3723834, -1.84104, 1, 0.8745098, 0, 1,
-1.086673, -1.10198, -3.460269, 1, 0.8823529, 0, 1,
-1.083351, 0.1633478, -1.712935, 1, 0.8862745, 0, 1,
-1.083349, -0.1118231, -1.018702, 1, 0.8941177, 0, 1,
-1.082567, 0.2844795, -0.9453259, 1, 0.8980392, 0, 1,
-1.080629, -0.02094097, -1.428023, 1, 0.9058824, 0, 1,
-1.078066, -0.9797333, -2.850146, 1, 0.9137255, 0, 1,
-1.066929, -0.4136621, -1.170866, 1, 0.9176471, 0, 1,
-1.065282, -1.006182, -3.344814, 1, 0.9254902, 0, 1,
-1.063544, 0.2892626, -2.186403, 1, 0.9294118, 0, 1,
-1.059816, -1.59628, -2.128477, 1, 0.9372549, 0, 1,
-1.059184, 0.008018157, -0.5966519, 1, 0.9411765, 0, 1,
-1.051968, 0.3257201, -1.000172, 1, 0.9490196, 0, 1,
-1.04953, -0.2494867, -2.939874, 1, 0.9529412, 0, 1,
-1.049204, -0.3329003, -2.968389, 1, 0.9607843, 0, 1,
-1.041009, -0.8268908, -2.542785, 1, 0.9647059, 0, 1,
-1.040587, 1.092955, -1.672185, 1, 0.972549, 0, 1,
-1.039721, 0.7841318, -0.1422759, 1, 0.9764706, 0, 1,
-1.038189, 1.273939, -2.279521, 1, 0.9843137, 0, 1,
-1.037209, 1.236784, -0.02339994, 1, 0.9882353, 0, 1,
-1.035486, 0.2649203, -1.857249, 1, 0.9960784, 0, 1,
-1.025966, 0.1891375, -0.5208712, 0.9960784, 1, 0, 1,
-0.994312, 0.6931704, -0.9102797, 0.9921569, 1, 0, 1,
-0.9891396, -2.528644, -3.105995, 0.9843137, 1, 0, 1,
-0.9756374, 0.7932202, -2.947871, 0.9803922, 1, 0, 1,
-0.9679912, -0.1325296, -2.042625, 0.972549, 1, 0, 1,
-0.9592185, 1.66149, -1.39926, 0.9686275, 1, 0, 1,
-0.9589765, 1.910847, -0.7143862, 0.9607843, 1, 0, 1,
-0.9574977, -0.292463, -2.152072, 0.9568627, 1, 0, 1,
-0.95738, -2.459536, -2.681243, 0.9490196, 1, 0, 1,
-0.9560365, -0.9550029, -4.107337, 0.945098, 1, 0, 1,
-0.9524692, 0.3151923, -1.550337, 0.9372549, 1, 0, 1,
-0.9320616, -0.1340483, 0.2245739, 0.9333333, 1, 0, 1,
-0.9317182, -0.01747314, -0.9727945, 0.9254902, 1, 0, 1,
-0.9247001, -2.385274, -2.725496, 0.9215686, 1, 0, 1,
-0.9204043, -0.3918405, 0.1014567, 0.9137255, 1, 0, 1,
-0.9139572, 0.3433776, -0.7970026, 0.9098039, 1, 0, 1,
-0.9089799, 0.6491161, 0.2146055, 0.9019608, 1, 0, 1,
-0.9071383, 0.8474282, -1.04805, 0.8941177, 1, 0, 1,
-0.8952946, -0.5373706, -0.9232339, 0.8901961, 1, 0, 1,
-0.8933609, 0.01904031, -2.4948, 0.8823529, 1, 0, 1,
-0.8931819, -0.760016, -1.146951, 0.8784314, 1, 0, 1,
-0.8909426, 0.001668363, -2.260895, 0.8705882, 1, 0, 1,
-0.8771992, 0.2156403, -0.3696771, 0.8666667, 1, 0, 1,
-0.8756144, -0.5275003, -1.551368, 0.8588235, 1, 0, 1,
-0.8709937, -2.062169, -1.986077, 0.854902, 1, 0, 1,
-0.8668371, -1.081122, -4.683821, 0.8470588, 1, 0, 1,
-0.8505617, 0.6354345, -0.6684431, 0.8431373, 1, 0, 1,
-0.8470778, -0.5356506, -2.880724, 0.8352941, 1, 0, 1,
-0.8468815, 1.477784, -1.073396, 0.8313726, 1, 0, 1,
-0.8432988, 1.397631, 1.396198, 0.8235294, 1, 0, 1,
-0.8418068, 0.1390409, -1.580524, 0.8196079, 1, 0, 1,
-0.8373883, -1.320487, -3.699249, 0.8117647, 1, 0, 1,
-0.8350445, 0.3855804, 0.1217399, 0.8078431, 1, 0, 1,
-0.8328837, -0.3111244, -2.374269, 0.8, 1, 0, 1,
-0.8313878, -0.6744455, -2.685598, 0.7921569, 1, 0, 1,
-0.8313543, -0.08124346, -2.072738, 0.7882353, 1, 0, 1,
-0.8269857, 0.09693474, -1.45833, 0.7803922, 1, 0, 1,
-0.8259804, -0.3123068, -1.479481, 0.7764706, 1, 0, 1,
-0.8235842, -0.2200582, -0.6348295, 0.7686275, 1, 0, 1,
-0.823526, -1.379161, -3.576597, 0.7647059, 1, 0, 1,
-0.8234949, 2.535648, -2.075539, 0.7568628, 1, 0, 1,
-0.8232945, -0.6316, -2.383254, 0.7529412, 1, 0, 1,
-0.8203372, -0.9390525, -2.976103, 0.7450981, 1, 0, 1,
-0.8178935, 0.1202675, -3.7349, 0.7411765, 1, 0, 1,
-0.8160113, 0.34294, -2.008504, 0.7333333, 1, 0, 1,
-0.8151348, 0.1897119, -0.2387635, 0.7294118, 1, 0, 1,
-0.8125069, 0.2530554, -1.831382, 0.7215686, 1, 0, 1,
-0.8114026, 0.1182927, -2.294829, 0.7176471, 1, 0, 1,
-0.8058231, 1.624321, -0.9665053, 0.7098039, 1, 0, 1,
-0.8054298, 1.278808, 0.2291142, 0.7058824, 1, 0, 1,
-0.8041496, 0.3796763, -0.78737, 0.6980392, 1, 0, 1,
-0.8027009, 0.783689, -2.226471, 0.6901961, 1, 0, 1,
-0.799171, -2.046701, -2.718451, 0.6862745, 1, 0, 1,
-0.7894635, 0.04410714, -1.39618, 0.6784314, 1, 0, 1,
-0.7894294, -0.2631615, -1.108333, 0.6745098, 1, 0, 1,
-0.7849718, -1.434661, -4.087768, 0.6666667, 1, 0, 1,
-0.7843939, 0.2997062, -1.367329, 0.6627451, 1, 0, 1,
-0.7834709, -0.1829713, -2.432365, 0.654902, 1, 0, 1,
-0.782529, -0.7524562, -0.5802694, 0.6509804, 1, 0, 1,
-0.7730383, 0.6062817, -1.451658, 0.6431373, 1, 0, 1,
-0.7682469, -0.1279857, -0.2260267, 0.6392157, 1, 0, 1,
-0.7662021, 0.4715037, -0.5765919, 0.6313726, 1, 0, 1,
-0.7624204, 0.08074085, -1.252942, 0.627451, 1, 0, 1,
-0.7619824, -0.1081249, -3.315692, 0.6196079, 1, 0, 1,
-0.7610772, 0.8009189, -0.8600893, 0.6156863, 1, 0, 1,
-0.7609954, 1.700829, 0.2467682, 0.6078432, 1, 0, 1,
-0.7601677, -0.2142152, -2.184142, 0.6039216, 1, 0, 1,
-0.7599981, 1.707443, -0.8371391, 0.5960785, 1, 0, 1,
-0.7584444, 0.726319, 1.03233, 0.5882353, 1, 0, 1,
-0.7493781, 1.263651, 0.4626163, 0.5843138, 1, 0, 1,
-0.7442874, 1.235081, -0.1745098, 0.5764706, 1, 0, 1,
-0.7442249, -0.6556457, -3.751777, 0.572549, 1, 0, 1,
-0.7432848, 1.690586, 0.1169023, 0.5647059, 1, 0, 1,
-0.7413753, 1.344443, 2.565316, 0.5607843, 1, 0, 1,
-0.7384624, -1.775151, -3.356923, 0.5529412, 1, 0, 1,
-0.734454, -0.6281645, -2.570204, 0.5490196, 1, 0, 1,
-0.7341629, -0.8120635, -2.13079, 0.5411765, 1, 0, 1,
-0.7327085, 0.4910573, -2.420602, 0.5372549, 1, 0, 1,
-0.7227809, 0.3519542, -0.05448768, 0.5294118, 1, 0, 1,
-0.7185564, 0.1327497, -2.220039, 0.5254902, 1, 0, 1,
-0.7125261, 0.003465505, 0.2529842, 0.5176471, 1, 0, 1,
-0.7101372, 0.317118, -2.33425, 0.5137255, 1, 0, 1,
-0.7060207, 0.2749772, -1.873836, 0.5058824, 1, 0, 1,
-0.7043272, -0.7251257, -3.533156, 0.5019608, 1, 0, 1,
-0.7017782, -0.6672917, -2.984468, 0.4941176, 1, 0, 1,
-0.7010543, -2.273286, -3.840752, 0.4862745, 1, 0, 1,
-0.7008869, 1.931068, -0.1700842, 0.4823529, 1, 0, 1,
-0.6970454, -0.2661827, 0.06277402, 0.4745098, 1, 0, 1,
-0.6938658, 1.067875, -0.540715, 0.4705882, 1, 0, 1,
-0.6920261, 1.271622, 0.6146501, 0.4627451, 1, 0, 1,
-0.6909389, 0.8840715, -0.1686837, 0.4588235, 1, 0, 1,
-0.6844884, 0.8475206, -0.4327599, 0.4509804, 1, 0, 1,
-0.6825411, -1.124115, -1.78985, 0.4470588, 1, 0, 1,
-0.6748767, -0.6852106, -2.471231, 0.4392157, 1, 0, 1,
-0.6697683, 0.7945414, -0.1945127, 0.4352941, 1, 0, 1,
-0.6678808, -1.958002, -2.67724, 0.427451, 1, 0, 1,
-0.6664059, -0.3444884, -2.321853, 0.4235294, 1, 0, 1,
-0.665842, -1.274531, -2.486202, 0.4156863, 1, 0, 1,
-0.6614536, 0.0757651, -2.301332, 0.4117647, 1, 0, 1,
-0.6537743, 0.6778338, -0.04426369, 0.4039216, 1, 0, 1,
-0.6469372, 0.1046453, -0.8200988, 0.3960784, 1, 0, 1,
-0.6365432, 0.9422415, -1.518075, 0.3921569, 1, 0, 1,
-0.6361346, -0.9571543, -4.246009, 0.3843137, 1, 0, 1,
-0.6358992, 1.174081, -1.771572, 0.3803922, 1, 0, 1,
-0.6358297, -0.9197571, -0.3032398, 0.372549, 1, 0, 1,
-0.6342617, -1.094346, -2.02125, 0.3686275, 1, 0, 1,
-0.6267851, 0.07571045, -0.9558752, 0.3607843, 1, 0, 1,
-0.6259908, -0.5324164, -3.225427, 0.3568628, 1, 0, 1,
-0.6259642, -0.6217032, -1.801299, 0.3490196, 1, 0, 1,
-0.6237752, 0.2480356, -2.205365, 0.345098, 1, 0, 1,
-0.6228791, 2.013243, -0.8959758, 0.3372549, 1, 0, 1,
-0.6222383, -0.1331334, -1.611554, 0.3333333, 1, 0, 1,
-0.6189265, -0.9867346, -3.630487, 0.3254902, 1, 0, 1,
-0.6158302, 0.09569895, -1.879242, 0.3215686, 1, 0, 1,
-0.6148049, 2.748127, -0.008064436, 0.3137255, 1, 0, 1,
-0.6132747, 0.01479656, -0.3142874, 0.3098039, 1, 0, 1,
-0.6039768, -0.02898699, -2.005908, 0.3019608, 1, 0, 1,
-0.5992063, -0.8770666, -4.112579, 0.2941177, 1, 0, 1,
-0.5988212, 0.7345433, -1.528084, 0.2901961, 1, 0, 1,
-0.5925525, -0.3447982, -1.634097, 0.282353, 1, 0, 1,
-0.5884656, 0.1805873, -3.245618, 0.2784314, 1, 0, 1,
-0.587124, 0.7260566, 0.07534452, 0.2705882, 1, 0, 1,
-0.5838808, -0.4590164, -4.605206, 0.2666667, 1, 0, 1,
-0.5805091, 0.6905571, -2.467652, 0.2588235, 1, 0, 1,
-0.5804393, -1.358459, -3.079277, 0.254902, 1, 0, 1,
-0.58021, -1.300042, -2.991338, 0.2470588, 1, 0, 1,
-0.5782083, 0.2458989, 0.2773866, 0.2431373, 1, 0, 1,
-0.5626286, -1.286272, -2.480664, 0.2352941, 1, 0, 1,
-0.5600095, -0.07048517, -2.024113, 0.2313726, 1, 0, 1,
-0.5577748, 0.8036107, -2.001863, 0.2235294, 1, 0, 1,
-0.5529948, -0.416825, -1.578939, 0.2196078, 1, 0, 1,
-0.5494431, 0.5214445, 0.4076583, 0.2117647, 1, 0, 1,
-0.5483175, 0.4062098, -2.520401, 0.2078431, 1, 0, 1,
-0.5387018, 0.1175567, -1.04164, 0.2, 1, 0, 1,
-0.5336674, -0.9725866, -3.022089, 0.1921569, 1, 0, 1,
-0.5247692, -1.314258, -3.269739, 0.1882353, 1, 0, 1,
-0.5187867, 0.64382, -2.829406, 0.1803922, 1, 0, 1,
-0.5173765, 0.8023309, -1.560675, 0.1764706, 1, 0, 1,
-0.5169566, 0.4685506, -0.6415433, 0.1686275, 1, 0, 1,
-0.5160773, -1.537038, -3.47378, 0.1647059, 1, 0, 1,
-0.5155203, 0.3302996, 0.1318783, 0.1568628, 1, 0, 1,
-0.5148667, -0.2993367, -2.973387, 0.1529412, 1, 0, 1,
-0.5144413, -0.4392808, -1.427654, 0.145098, 1, 0, 1,
-0.4979424, -0.02668848, -2.736528, 0.1411765, 1, 0, 1,
-0.4965972, 2.07422, -0.6584112, 0.1333333, 1, 0, 1,
-0.4932067, -0.1289686, -2.57583, 0.1294118, 1, 0, 1,
-0.4928001, -1.056503, -2.88698, 0.1215686, 1, 0, 1,
-0.4880173, 1.350707, 1.087881, 0.1176471, 1, 0, 1,
-0.4877141, -1.320967, -3.556463, 0.1098039, 1, 0, 1,
-0.4845754, -0.5121376, -2.215, 0.1058824, 1, 0, 1,
-0.4810773, -1.805098, -5.119751, 0.09803922, 1, 0, 1,
-0.4800896, 0.5987418, -1.074737, 0.09019608, 1, 0, 1,
-0.470966, -0.8452613, -3.347868, 0.08627451, 1, 0, 1,
-0.4695021, 0.2934239, -1.32842, 0.07843138, 1, 0, 1,
-0.4654074, -0.4199668, -1.978136, 0.07450981, 1, 0, 1,
-0.4621379, -1.207536, -2.935058, 0.06666667, 1, 0, 1,
-0.4603111, 0.2694018, -1.872314, 0.0627451, 1, 0, 1,
-0.4564433, 0.5110376, 1.487914, 0.05490196, 1, 0, 1,
-0.4466683, -0.0448214, -2.348035, 0.05098039, 1, 0, 1,
-0.4441665, 0.1282461, -1.144765, 0.04313726, 1, 0, 1,
-0.4432297, -0.5430246, -2.944417, 0.03921569, 1, 0, 1,
-0.4420199, -0.6208147, -0.830159, 0.03137255, 1, 0, 1,
-0.4414276, -2.294829, -2.959532, 0.02745098, 1, 0, 1,
-0.4381168, -0.5091773, -1.283571, 0.01960784, 1, 0, 1,
-0.4348882, 0.348208, -0.5216669, 0.01568628, 1, 0, 1,
-0.4295402, 1.475332, 0.09185386, 0.007843138, 1, 0, 1,
-0.4264914, 1.488747, 0.2862321, 0.003921569, 1, 0, 1,
-0.4253616, -0.8312749, -3.493957, 0, 1, 0.003921569, 1,
-0.4247419, -1.372086, -2.474359, 0, 1, 0.01176471, 1,
-0.423008, -0.005165017, -2.195801, 0, 1, 0.01568628, 1,
-0.4172777, -1.1595, -2.626573, 0, 1, 0.02352941, 1,
-0.4164515, 0.07963192, 0.3659409, 0, 1, 0.02745098, 1,
-0.4116949, 0.7092428, -0.5605099, 0, 1, 0.03529412, 1,
-0.4071804, 0.03410483, -1.102312, 0, 1, 0.03921569, 1,
-0.4063793, -0.1137943, -3.039534, 0, 1, 0.04705882, 1,
-0.4062179, 0.7793752, -1.265381, 0, 1, 0.05098039, 1,
-0.4014009, -2.338873, -1.881349, 0, 1, 0.05882353, 1,
-0.3988604, 0.571093, -1.335892, 0, 1, 0.0627451, 1,
-0.3948157, -1.111569, -2.947812, 0, 1, 0.07058824, 1,
-0.394147, -1.254683, -2.861645, 0, 1, 0.07450981, 1,
-0.393668, -0.8818083, -3.313243, 0, 1, 0.08235294, 1,
-0.3890541, -0.3658174, -2.887062, 0, 1, 0.08627451, 1,
-0.3834383, 0.6916397, -0.3968703, 0, 1, 0.09411765, 1,
-0.3811381, 2.596131, -0.8198581, 0, 1, 0.1019608, 1,
-0.3801272, 2.210682, 0.8692009, 0, 1, 0.1058824, 1,
-0.3775747, 0.8141885, -1.839468, 0, 1, 0.1137255, 1,
-0.3733781, -0.9363178, -2.284562, 0, 1, 0.1176471, 1,
-0.3657396, -0.8131445, -3.899547, 0, 1, 0.1254902, 1,
-0.3634361, 1.419401, -0.2836823, 0, 1, 0.1294118, 1,
-0.3615022, -0.4291567, -0.06991684, 0, 1, 0.1372549, 1,
-0.3579952, -1.300681, -2.706383, 0, 1, 0.1411765, 1,
-0.3551511, -0.354562, -2.001469, 0, 1, 0.1490196, 1,
-0.3539268, 0.6095919, -0.9347174, 0, 1, 0.1529412, 1,
-0.3527583, -0.2582388, -3.608163, 0, 1, 0.1607843, 1,
-0.348998, -0.6608526, -2.91573, 0, 1, 0.1647059, 1,
-0.3468709, 0.98469, 1.27684, 0, 1, 0.172549, 1,
-0.3467102, 1.650935, -0.2690666, 0, 1, 0.1764706, 1,
-0.3457081, 1.198253, 0.5579015, 0, 1, 0.1843137, 1,
-0.3437314, 1.218093, -0.423936, 0, 1, 0.1882353, 1,
-0.3415569, 1.075612, 0.05677435, 0, 1, 0.1960784, 1,
-0.3378747, -1.483653, -2.466259, 0, 1, 0.2039216, 1,
-0.3284571, -0.6516513, -2.343842, 0, 1, 0.2078431, 1,
-0.3263423, -0.5979468, -1.495604, 0, 1, 0.2156863, 1,
-0.3263257, 0.2891516, -0.6941532, 0, 1, 0.2196078, 1,
-0.3232297, 0.05912729, -1.086465, 0, 1, 0.227451, 1,
-0.3201156, -0.4888924, -3.123775, 0, 1, 0.2313726, 1,
-0.3200646, 0.3399833, 0.1362547, 0, 1, 0.2392157, 1,
-0.3190705, 0.3847905, -1.123237, 0, 1, 0.2431373, 1,
-0.3184783, 0.5179727, 0.8101547, 0, 1, 0.2509804, 1,
-0.3165888, 1.692215, -0.514874, 0, 1, 0.254902, 1,
-0.3154335, -0.4998549, -1.689435, 0, 1, 0.2627451, 1,
-0.3145092, 0.4892243, -1.745448, 0, 1, 0.2666667, 1,
-0.3138605, -1.231467, -2.799288, 0, 1, 0.2745098, 1,
-0.3106334, -1.029073, -1.65762, 0, 1, 0.2784314, 1,
-0.309821, -0.8214525, -3.630577, 0, 1, 0.2862745, 1,
-0.3055737, -1.387492, -3.243994, 0, 1, 0.2901961, 1,
-0.3055572, 0.1947583, -2.052936, 0, 1, 0.2980392, 1,
-0.3041019, -0.7158003, -2.477621, 0, 1, 0.3058824, 1,
-0.3010989, -1.98661, -2.165816, 0, 1, 0.3098039, 1,
-0.2977284, -0.7052436, -1.584741, 0, 1, 0.3176471, 1,
-0.2960977, -1.744814, -2.438395, 0, 1, 0.3215686, 1,
-0.2947805, -1.021608, -2.923245, 0, 1, 0.3294118, 1,
-0.2894962, 0.5829912, -0.8673941, 0, 1, 0.3333333, 1,
-0.2893899, 1.261332, -0.7948835, 0, 1, 0.3411765, 1,
-0.2891022, 0.6047466, -1.00701, 0, 1, 0.345098, 1,
-0.2868607, 0.7921076, -0.3267271, 0, 1, 0.3529412, 1,
-0.2859603, -0.2903037, -3.0675, 0, 1, 0.3568628, 1,
-0.2851159, 1.075352, -0.151502, 0, 1, 0.3647059, 1,
-0.2835787, -0.0932961, -1.252181, 0, 1, 0.3686275, 1,
-0.2819772, -1.263503, -2.433764, 0, 1, 0.3764706, 1,
-0.2795123, 0.2805922, -0.3838118, 0, 1, 0.3803922, 1,
-0.2765919, -1.385504, -2.629968, 0, 1, 0.3882353, 1,
-0.2756927, 2.468153, -2.415254, 0, 1, 0.3921569, 1,
-0.2672088, 2.07912, 0.7258837, 0, 1, 0.4, 1,
-0.2656918, 0.9835311, 1.378855, 0, 1, 0.4078431, 1,
-0.2630922, -0.899608, -2.873535, 0, 1, 0.4117647, 1,
-0.2618375, 0.5003067, 0.4995298, 0, 1, 0.4196078, 1,
-0.2563338, -2.460378, -3.776184, 0, 1, 0.4235294, 1,
-0.2551332, -0.4055392, -2.760048, 0, 1, 0.4313726, 1,
-0.2536041, -0.0004937534, -0.4472328, 0, 1, 0.4352941, 1,
-0.252309, -1.372328, -2.654454, 0, 1, 0.4431373, 1,
-0.2515946, -0.0445916, -4.615183, 0, 1, 0.4470588, 1,
-0.2491337, -0.7810626, -2.38144, 0, 1, 0.454902, 1,
-0.2478856, 0.2396974, 0.4433968, 0, 1, 0.4588235, 1,
-0.2468742, 2.005498, 0.8364242, 0, 1, 0.4666667, 1,
-0.2386885, -0.976843, -2.529644, 0, 1, 0.4705882, 1,
-0.2361074, 0.4281647, -0.2903618, 0, 1, 0.4784314, 1,
-0.2344143, -0.9274515, -2.627632, 0, 1, 0.4823529, 1,
-0.2332416, -0.4176063, -1.205171, 0, 1, 0.4901961, 1,
-0.2321906, 0.49589, -0.6694753, 0, 1, 0.4941176, 1,
-0.2279388, -0.3276981, -1.536895, 0, 1, 0.5019608, 1,
-0.2261658, -0.765857, -2.525288, 0, 1, 0.509804, 1,
-0.2211469, -1.60838, -4.603755, 0, 1, 0.5137255, 1,
-0.2211411, 0.9787716, -1.443876, 0, 1, 0.5215687, 1,
-0.2203296, 1.213183, -0.5385208, 0, 1, 0.5254902, 1,
-0.2171888, -0.01101861, -1.158788, 0, 1, 0.5333334, 1,
-0.2164014, 1.070572, -1.464954, 0, 1, 0.5372549, 1,
-0.2092174, -2.232942, -2.476968, 0, 1, 0.5450981, 1,
-0.2086289, 1.246371, -1.699541, 0, 1, 0.5490196, 1,
-0.2081149, -1.357973, -2.996164, 0, 1, 0.5568628, 1,
-0.2031092, 1.581343, 0.5657769, 0, 1, 0.5607843, 1,
-0.2001861, -0.8284271, -3.838144, 0, 1, 0.5686275, 1,
-0.198709, 1.271949, -0.4695085, 0, 1, 0.572549, 1,
-0.190035, -1.169215, -2.629274, 0, 1, 0.5803922, 1,
-0.1881093, -0.1152402, -2.025317, 0, 1, 0.5843138, 1,
-0.1821607, 0.6947225, 0.7291018, 0, 1, 0.5921569, 1,
-0.1802064, 0.2858762, -1.931319, 0, 1, 0.5960785, 1,
-0.1781661, 1.384302, -0.3885258, 0, 1, 0.6039216, 1,
-0.1776546, -1.119622, -4.220157, 0, 1, 0.6117647, 1,
-0.1745847, -0.6982119, -2.2927, 0, 1, 0.6156863, 1,
-0.1645589, 0.7814102, -0.8574817, 0, 1, 0.6235294, 1,
-0.163003, -0.329205, -1.695177, 0, 1, 0.627451, 1,
-0.1616356, 0.5095726, -1.790351, 0, 1, 0.6352941, 1,
-0.1615637, -0.3649588, -3.033219, 0, 1, 0.6392157, 1,
-0.1596216, 2.008497, 0.03561061, 0, 1, 0.6470588, 1,
-0.1572085, 2.38782, -0.5398825, 0, 1, 0.6509804, 1,
-0.1547623, 0.5016295, 0.5613413, 0, 1, 0.6588235, 1,
-0.1544669, -0.3256889, -3.515256, 0, 1, 0.6627451, 1,
-0.149583, 0.6181661, -0.3695425, 0, 1, 0.6705883, 1,
-0.1495131, 0.316959, -0.9920894, 0, 1, 0.6745098, 1,
-0.1455065, -0.1863389, -3.97578, 0, 1, 0.682353, 1,
-0.1422399, 1.745275, 0.388972, 0, 1, 0.6862745, 1,
-0.1419504, -1.300803, -3.647631, 0, 1, 0.6941177, 1,
-0.1401201, -0.5591865, -3.493857, 0, 1, 0.7019608, 1,
-0.1356421, -0.2940778, -2.775205, 0, 1, 0.7058824, 1,
-0.1314467, 0.5284008, 0.7693323, 0, 1, 0.7137255, 1,
-0.1274777, 0.4808258, -0.4512753, 0, 1, 0.7176471, 1,
-0.1187018, -0.4980471, -2.966377, 0, 1, 0.7254902, 1,
-0.1178215, 0.4806598, 0.1949535, 0, 1, 0.7294118, 1,
-0.1173356, -0.6922295, -4.600331, 0, 1, 0.7372549, 1,
-0.1162633, 1.397854, 0.6401469, 0, 1, 0.7411765, 1,
-0.1152688, 0.2281189, -0.3884524, 0, 1, 0.7490196, 1,
-0.1134242, 0.2857731, 0.7551569, 0, 1, 0.7529412, 1,
-0.1030628, -1.306423, -2.874378, 0, 1, 0.7607843, 1,
-0.1024353, 0.8311734, 1.817348, 0, 1, 0.7647059, 1,
-0.1012295, -1.152652, -3.448087, 0, 1, 0.772549, 1,
-0.1009247, 1.253597, -2.602524, 0, 1, 0.7764706, 1,
-0.09935026, 0.005768101, -1.950984, 0, 1, 0.7843137, 1,
-0.09504369, -0.8412108, -2.973138, 0, 1, 0.7882353, 1,
-0.0920023, -0.1128126, -3.118047, 0, 1, 0.7960784, 1,
-0.08784365, -0.904654, -3.625943, 0, 1, 0.8039216, 1,
-0.08721641, 0.2789381, 0.2457548, 0, 1, 0.8078431, 1,
-0.08498557, -0.5087231, -1.771979, 0, 1, 0.8156863, 1,
-0.07639134, -0.6813428, -1.391541, 0, 1, 0.8196079, 1,
-0.0653788, 0.4679683, -0.4630333, 0, 1, 0.827451, 1,
-0.06485769, 0.03356924, -0.9280115, 0, 1, 0.8313726, 1,
-0.06096657, 0.6961481, -1.835601, 0, 1, 0.8392157, 1,
-0.05746769, -0.5367037, -1.913454, 0, 1, 0.8431373, 1,
-0.05419747, -0.09960943, 0.4037191, 0, 1, 0.8509804, 1,
-0.0523366, -1.313097, -2.860355, 0, 1, 0.854902, 1,
-0.05231103, -0.5647902, -4.314801, 0, 1, 0.8627451, 1,
-0.04556846, -1.556937, -3.24025, 0, 1, 0.8666667, 1,
-0.04522409, -0.4411071, -3.00338, 0, 1, 0.8745098, 1,
-0.0448688, -1.282509, -2.919923, 0, 1, 0.8784314, 1,
-0.04336283, 1.484586, 1.492737, 0, 1, 0.8862745, 1,
-0.04113946, -1.039753, -5.152436, 0, 1, 0.8901961, 1,
-0.04039622, -0.5116507, -3.456657, 0, 1, 0.8980392, 1,
-0.03696122, -0.2189866, -1.460898, 0, 1, 0.9058824, 1,
-0.0354876, 1.577872, -0.4475198, 0, 1, 0.9098039, 1,
-0.03266213, -0.2312941, -3.299664, 0, 1, 0.9176471, 1,
-0.02623313, 0.5337112, -0.3282591, 0, 1, 0.9215686, 1,
-0.02028704, -0.1791364, -4.215635, 0, 1, 0.9294118, 1,
-0.01639125, -1.169261, -2.271335, 0, 1, 0.9333333, 1,
-0.01522509, 1.129077, -1.800927, 0, 1, 0.9411765, 1,
-0.0138972, 0.5771464, 0.2759416, 0, 1, 0.945098, 1,
-0.01301226, -0.4119104, -2.125585, 0, 1, 0.9529412, 1,
-0.01227093, 0.6251168, 0.2783985, 0, 1, 0.9568627, 1,
-0.0112985, -0.09343953, -3.577648, 0, 1, 0.9647059, 1,
-0.009113872, -1.327091, -4.728443, 0, 1, 0.9686275, 1,
-0.008125951, 1.188488, 0.0759161, 0, 1, 0.9764706, 1,
-0.004663756, 0.4194154, 2.447836, 0, 1, 0.9803922, 1,
-0.001461424, -1.0869, -2.062526, 0, 1, 0.9882353, 1,
0.0009211178, -0.03162314, 1.498309, 0, 1, 0.9921569, 1,
0.00440836, 1.602224, 0.01743549, 0, 1, 1, 1,
0.01071517, -1.157886, 2.899686, 0, 0.9921569, 1, 1,
0.01108159, -0.4295447, 2.683824, 0, 0.9882353, 1, 1,
0.01307352, 0.8769723, 1.208338, 0, 0.9803922, 1, 1,
0.01379969, -2.068114, 2.762492, 0, 0.9764706, 1, 1,
0.02700803, -0.8048484, 1.38496, 0, 0.9686275, 1, 1,
0.02715327, 1.072098, 0.9263253, 0, 0.9647059, 1, 1,
0.02721608, -0.2343094, 5.826333, 0, 0.9568627, 1, 1,
0.03134893, -0.8571466, 3.793758, 0, 0.9529412, 1, 1,
0.03475418, -0.3730884, 4.653332, 0, 0.945098, 1, 1,
0.03639119, 0.5221624, -1.128773, 0, 0.9411765, 1, 1,
0.03701951, 0.5744892, 0.02918455, 0, 0.9333333, 1, 1,
0.04000441, -1.549563, 3.164407, 0, 0.9294118, 1, 1,
0.04134594, -0.1722036, 2.389364, 0, 0.9215686, 1, 1,
0.04175613, -0.8983391, 3.430454, 0, 0.9176471, 1, 1,
0.04834995, 1.318828, -1.380336, 0, 0.9098039, 1, 1,
0.05662416, 0.5961985, 0.01406061, 0, 0.9058824, 1, 1,
0.05694481, -0.6865514, 2.106854, 0, 0.8980392, 1, 1,
0.05760156, -0.8339483, 3.75016, 0, 0.8901961, 1, 1,
0.06040464, -0.4543342, 2.873137, 0, 0.8862745, 1, 1,
0.06149011, 0.2751249, -0.04936634, 0, 0.8784314, 1, 1,
0.06671356, 0.976041, 1.729291, 0, 0.8745098, 1, 1,
0.06757615, 0.2357347, 0.9010727, 0, 0.8666667, 1, 1,
0.06890991, 0.8849881, -1.589372, 0, 0.8627451, 1, 1,
0.0705948, 0.7733014, 1.100878, 0, 0.854902, 1, 1,
0.07639501, 0.625025, 1.174997, 0, 0.8509804, 1, 1,
0.07696863, -0.4970794, 2.807108, 0, 0.8431373, 1, 1,
0.08010592, 0.8966855, 0.3714658, 0, 0.8392157, 1, 1,
0.08108525, 0.6468273, 0.4201878, 0, 0.8313726, 1, 1,
0.083791, -1.449559, 4.526801, 0, 0.827451, 1, 1,
0.08677393, -0.8443003, 4.025332, 0, 0.8196079, 1, 1,
0.08701776, 0.1868965, 0.7797849, 0, 0.8156863, 1, 1,
0.08884082, 0.1918603, 0.7093199, 0, 0.8078431, 1, 1,
0.08955884, 1.589325, 0.2205971, 0, 0.8039216, 1, 1,
0.09147137, 1.351726, -0.297014, 0, 0.7960784, 1, 1,
0.09723486, 1.048678, -0.4519832, 0, 0.7882353, 1, 1,
0.09743983, -0.2040384, 3.009447, 0, 0.7843137, 1, 1,
0.09820047, -0.5057378, 2.981314, 0, 0.7764706, 1, 1,
0.1042479, -0.5606874, 3.28057, 0, 0.772549, 1, 1,
0.1126695, -0.551451, 2.496974, 0, 0.7647059, 1, 1,
0.1164418, 3.399595, -0.515031, 0, 0.7607843, 1, 1,
0.1227843, 0.0592795, 1.834246, 0, 0.7529412, 1, 1,
0.1252014, -0.8561769, 2.368495, 0, 0.7490196, 1, 1,
0.1265166, 0.5385749, 1.351106, 0, 0.7411765, 1, 1,
0.1269608, -1.196983, 2.525381, 0, 0.7372549, 1, 1,
0.127629, -0.2725428, 3.23814, 0, 0.7294118, 1, 1,
0.128573, -0.9185879, 1.408359, 0, 0.7254902, 1, 1,
0.131026, -0.1203987, 3.351838, 0, 0.7176471, 1, 1,
0.1323001, 0.3505281, -0.6159487, 0, 0.7137255, 1, 1,
0.1363171, 1.147409, 1.503689, 0, 0.7058824, 1, 1,
0.1375863, -0.05697727, 3.06276, 0, 0.6980392, 1, 1,
0.1388853, -0.3996451, 2.284183, 0, 0.6941177, 1, 1,
0.141454, -0.04916234, 0.9010046, 0, 0.6862745, 1, 1,
0.1422434, -0.1623252, 3.136445, 0, 0.682353, 1, 1,
0.1469603, -0.6079085, 2.306941, 0, 0.6745098, 1, 1,
0.1492248, -0.5847728, 1.905717, 0, 0.6705883, 1, 1,
0.1501298, 0.5055404, 1.395106, 0, 0.6627451, 1, 1,
0.1542905, 0.3891353, -0.2329651, 0, 0.6588235, 1, 1,
0.1588802, 0.2794501, 0.9543219, 0, 0.6509804, 1, 1,
0.1602348, 0.04430936, 0.7637443, 0, 0.6470588, 1, 1,
0.1623325, 1.591204, -0.439247, 0, 0.6392157, 1, 1,
0.1628195, 0.9751063, -1.133606, 0, 0.6352941, 1, 1,
0.1648801, -0.8411663, 2.204992, 0, 0.627451, 1, 1,
0.1743577, 0.356526, 0.4924137, 0, 0.6235294, 1, 1,
0.1772196, -0.9121282, 3.752328, 0, 0.6156863, 1, 1,
0.1785989, -0.4436623, 2.142407, 0, 0.6117647, 1, 1,
0.1793429, 0.7713376, -0.3380312, 0, 0.6039216, 1, 1,
0.1837695, 0.5202006, -0.2743021, 0, 0.5960785, 1, 1,
0.1849369, -0.3648466, 3.218462, 0, 0.5921569, 1, 1,
0.1864303, 0.1823008, -0.2651215, 0, 0.5843138, 1, 1,
0.1871271, -0.8532282, 3.273951, 0, 0.5803922, 1, 1,
0.1897299, -1.049212, 2.305169, 0, 0.572549, 1, 1,
0.1899788, -1.215096, 3.390899, 0, 0.5686275, 1, 1,
0.1917079, 0.4358824, -0.3103223, 0, 0.5607843, 1, 1,
0.1918798, -0.4307512, 2.432004, 0, 0.5568628, 1, 1,
0.1941511, -0.7015724, 2.870391, 0, 0.5490196, 1, 1,
0.201275, 0.6401238, -1.843804, 0, 0.5450981, 1, 1,
0.2041917, 1.449565, 2.878373, 0, 0.5372549, 1, 1,
0.2101978, 0.9731581, -0.6070126, 0, 0.5333334, 1, 1,
0.2109049, -0.8951272, 1.693313, 0, 0.5254902, 1, 1,
0.2115352, 1.028471, -0.05432646, 0, 0.5215687, 1, 1,
0.2149536, 0.2203033, 1.104571, 0, 0.5137255, 1, 1,
0.2201074, 0.3484093, 1.114331, 0, 0.509804, 1, 1,
0.22505, -0.6125824, 4.816562, 0, 0.5019608, 1, 1,
0.2256069, -1.048329, 1.412863, 0, 0.4941176, 1, 1,
0.226751, 0.8265207, 0.3340181, 0, 0.4901961, 1, 1,
0.227045, -1.370093, 3.978002, 0, 0.4823529, 1, 1,
0.230811, -1.447714, 4.31446, 0, 0.4784314, 1, 1,
0.2308187, -0.3924298, 2.680386, 0, 0.4705882, 1, 1,
0.2387739, 0.6745671, -0.3723808, 0, 0.4666667, 1, 1,
0.2408727, -0.1514676, 2.80556, 0, 0.4588235, 1, 1,
0.2434898, 0.7922748, -1.663396, 0, 0.454902, 1, 1,
0.2452157, -0.9637538, 3.048046, 0, 0.4470588, 1, 1,
0.245817, -1.015819, 4.006577, 0, 0.4431373, 1, 1,
0.248129, -0.612833, 2.192863, 0, 0.4352941, 1, 1,
0.2543901, 0.4717367, 0.793643, 0, 0.4313726, 1, 1,
0.256003, 0.9053348, 1.468564, 0, 0.4235294, 1, 1,
0.2565207, -0.7762089, 3.958545, 0, 0.4196078, 1, 1,
0.2576777, 0.1602623, 2.368806, 0, 0.4117647, 1, 1,
0.259845, -0.04768941, 1.744052, 0, 0.4078431, 1, 1,
0.2610123, 0.08083394, 2.795753, 0, 0.4, 1, 1,
0.2646208, 0.7498958, -0.434889, 0, 0.3921569, 1, 1,
0.2664866, -0.1695338, 3.408236, 0, 0.3882353, 1, 1,
0.2725222, -0.2405878, 1.892058, 0, 0.3803922, 1, 1,
0.2768065, -1.510421, 2.722453, 0, 0.3764706, 1, 1,
0.2800591, -0.5322461, 2.713116, 0, 0.3686275, 1, 1,
0.2801297, 0.1874714, -0.4749082, 0, 0.3647059, 1, 1,
0.2856025, -0.3816543, 1.483338, 0, 0.3568628, 1, 1,
0.2860704, 2.37078, -0.4756532, 0, 0.3529412, 1, 1,
0.2883507, -0.2703584, 3.665794, 0, 0.345098, 1, 1,
0.2885646, 1.659202, 2.479604, 0, 0.3411765, 1, 1,
0.2925968, -1.92831, 2.296327, 0, 0.3333333, 1, 1,
0.2952274, -0.3479095, 4.773113, 0, 0.3294118, 1, 1,
0.2993706, 0.2235601, 2.017999, 0, 0.3215686, 1, 1,
0.3023553, -0.7790776, 3.785483, 0, 0.3176471, 1, 1,
0.3108877, -1.273813, 1.426213, 0, 0.3098039, 1, 1,
0.3142288, 0.8681877, 0.397951, 0, 0.3058824, 1, 1,
0.3180832, 1.337854, 0.3940149, 0, 0.2980392, 1, 1,
0.3186068, -0.2212528, 1.681783, 0, 0.2901961, 1, 1,
0.3198486, 0.6402771, 0.6321511, 0, 0.2862745, 1, 1,
0.3255777, 1.254184, 0.9251284, 0, 0.2784314, 1, 1,
0.3273732, 0.08074611, 0.1216545, 0, 0.2745098, 1, 1,
0.3332378, -0.256492, 1.858867, 0, 0.2666667, 1, 1,
0.3386457, 0.7882346, 0.2636209, 0, 0.2627451, 1, 1,
0.342672, 1.175486, 0.01655396, 0, 0.254902, 1, 1,
0.3514326, -0.06574066, 1.387436, 0, 0.2509804, 1, 1,
0.3601542, 2.320099, 1.42284, 0, 0.2431373, 1, 1,
0.3758924, 0.8071849, 0.6093967, 0, 0.2392157, 1, 1,
0.3765116, 0.5547922, 0.8036752, 0, 0.2313726, 1, 1,
0.3766591, 1.633226, -0.6079883, 0, 0.227451, 1, 1,
0.3789772, 1.303751, -0.03766083, 0, 0.2196078, 1, 1,
0.3840205, -0.3600784, 0.9533721, 0, 0.2156863, 1, 1,
0.3884866, 1.334214, 1.828156, 0, 0.2078431, 1, 1,
0.3956815, -0.5255598, 3.659473, 0, 0.2039216, 1, 1,
0.3998983, -0.2454446, 3.399712, 0, 0.1960784, 1, 1,
0.4029402, -1.062108, 3.95187, 0, 0.1882353, 1, 1,
0.4031964, -0.2283833, 1.98107, 0, 0.1843137, 1, 1,
0.4042544, -0.2357831, 1.92236, 0, 0.1764706, 1, 1,
0.4112998, -0.2725517, 1.259691, 0, 0.172549, 1, 1,
0.4145598, -0.02053521, 0.7782128, 0, 0.1647059, 1, 1,
0.4163729, -2.125494, 1.690215, 0, 0.1607843, 1, 1,
0.4198058, 1.00034, 1.438706, 0, 0.1529412, 1, 1,
0.4262798, -1.517107, 4.33418, 0, 0.1490196, 1, 1,
0.4283219, -0.8045844, 0.8584832, 0, 0.1411765, 1, 1,
0.4319349, 1.412893, -0.3273956, 0, 0.1372549, 1, 1,
0.4319842, 0.6749205, -0.3884337, 0, 0.1294118, 1, 1,
0.4331354, -0.8492343, 3.748058, 0, 0.1254902, 1, 1,
0.4343257, -0.5024142, 1.700791, 0, 0.1176471, 1, 1,
0.4346293, 0.2636556, 1.908728, 0, 0.1137255, 1, 1,
0.4353923, -1.438849, 2.227421, 0, 0.1058824, 1, 1,
0.4394616, -1.376588, 5.248465, 0, 0.09803922, 1, 1,
0.4400225, 0.3406788, 1.475649, 0, 0.09411765, 1, 1,
0.4415003, 1.468021, 0.03211287, 0, 0.08627451, 1, 1,
0.444289, -0.3375292, 3.662818, 0, 0.08235294, 1, 1,
0.4450326, -0.9520156, 1.127362, 0, 0.07450981, 1, 1,
0.4476238, 0.6971584, 0.4413596, 0, 0.07058824, 1, 1,
0.4477662, -1.406085, 1.966323, 0, 0.0627451, 1, 1,
0.450872, -1.088081, 1.685166, 0, 0.05882353, 1, 1,
0.4549792, 1.185685, 1.098325, 0, 0.05098039, 1, 1,
0.4550435, 0.5974463, -0.4222471, 0, 0.04705882, 1, 1,
0.4563898, 0.2193364, 0.6519074, 0, 0.03921569, 1, 1,
0.473653, 0.5802209, 1.142525, 0, 0.03529412, 1, 1,
0.4788012, -0.8288342, 3.669983, 0, 0.02745098, 1, 1,
0.479321, 0.308212, 1.002055, 0, 0.02352941, 1, 1,
0.4800538, -0.07026962, 1.691057, 0, 0.01568628, 1, 1,
0.4809873, -0.0008761369, 1.198105, 0, 0.01176471, 1, 1,
0.4827263, 2.034435, 0.3774386, 0, 0.003921569, 1, 1,
0.4861622, 0.6674976, -0.7317718, 0.003921569, 0, 1, 1,
0.4888593, -0.8347077, 2.469985, 0.007843138, 0, 1, 1,
0.4924048, 0.9025791, -0.5591858, 0.01568628, 0, 1, 1,
0.494275, -2.267969, 3.311614, 0.01960784, 0, 1, 1,
0.4982899, 0.7956976, 1.174667, 0.02745098, 0, 1, 1,
0.4998378, -0.136312, 1.609178, 0.03137255, 0, 1, 1,
0.5012289, -0.2374274, 3.582154, 0.03921569, 0, 1, 1,
0.5026937, 0.0487954, 0.5464222, 0.04313726, 0, 1, 1,
0.5081209, 1.290398, 2.434216, 0.05098039, 0, 1, 1,
0.5106837, 0.3332488, 2.095563, 0.05490196, 0, 1, 1,
0.5109724, -0.2527797, 3.605223, 0.0627451, 0, 1, 1,
0.5200713, -1.070258, 1.595873, 0.06666667, 0, 1, 1,
0.5224447, -1.100456, 2.217665, 0.07450981, 0, 1, 1,
0.5235066, -0.7081278, 3.89028, 0.07843138, 0, 1, 1,
0.5257608, -2.200589, 3.563679, 0.08627451, 0, 1, 1,
0.5276851, 0.38838, 0.8189026, 0.09019608, 0, 1, 1,
0.5317628, -1.481088, 4.441391, 0.09803922, 0, 1, 1,
0.5319178, 1.630016, 1.213465, 0.1058824, 0, 1, 1,
0.53229, -0.263252, 1.419753, 0.1098039, 0, 1, 1,
0.541239, -0.6424049, 2.395794, 0.1176471, 0, 1, 1,
0.5418538, 1.538725, -0.4147583, 0.1215686, 0, 1, 1,
0.5472673, 1.809841, -0.6705378, 0.1294118, 0, 1, 1,
0.5487018, 0.3630372, 0.8940685, 0.1333333, 0, 1, 1,
0.5509252, -1.620512, 4.18404, 0.1411765, 0, 1, 1,
0.5570515, 1.473171, -0.5332344, 0.145098, 0, 1, 1,
0.5587913, 1.405441, -0.1893985, 0.1529412, 0, 1, 1,
0.5608759, -0.5504568, 1.377165, 0.1568628, 0, 1, 1,
0.561155, 1.007212, 0.5182554, 0.1647059, 0, 1, 1,
0.5627955, -0.8007389, 1.681185, 0.1686275, 0, 1, 1,
0.5663283, -0.2683523, 1.440308, 0.1764706, 0, 1, 1,
0.5675788, -1.569993, 4.504612, 0.1803922, 0, 1, 1,
0.570318, -1.512266, 4.127406, 0.1882353, 0, 1, 1,
0.5704436, 1.800901, 1.545592, 0.1921569, 0, 1, 1,
0.5780255, -0.2500443, 3.769352, 0.2, 0, 1, 1,
0.5853515, 0.2427375, 1.244449, 0.2078431, 0, 1, 1,
0.5858573, -1.383097, 1.108783, 0.2117647, 0, 1, 1,
0.5864279, -0.1560264, 3.420021, 0.2196078, 0, 1, 1,
0.5909671, -0.2544771, 1.366947, 0.2235294, 0, 1, 1,
0.5956862, -1.005516, 3.429264, 0.2313726, 0, 1, 1,
0.6017522, -0.9498156, 2.92977, 0.2352941, 0, 1, 1,
0.6022181, -0.5537442, 1.773785, 0.2431373, 0, 1, 1,
0.6051567, 0.03668122, -0.2415233, 0.2470588, 0, 1, 1,
0.6063012, 0.4556112, 0.8684597, 0.254902, 0, 1, 1,
0.606816, -1.65638, 1.3179, 0.2588235, 0, 1, 1,
0.6077545, 0.300907, 1.073299, 0.2666667, 0, 1, 1,
0.6088688, -0.4954133, 1.839082, 0.2705882, 0, 1, 1,
0.6109461, -0.6610528, 2.04201, 0.2784314, 0, 1, 1,
0.6111013, 0.1751778, 1.030308, 0.282353, 0, 1, 1,
0.6174116, -1.433565, 4.253634, 0.2901961, 0, 1, 1,
0.6190457, -0.1269265, 1.788426, 0.2941177, 0, 1, 1,
0.6257527, -1.051972, 3.414431, 0.3019608, 0, 1, 1,
0.6291861, -1.123547, 1.561901, 0.3098039, 0, 1, 1,
0.6307535, -0.02796699, 1.527799, 0.3137255, 0, 1, 1,
0.6332256, -1.370395, 4.783043, 0.3215686, 0, 1, 1,
0.6390304, -0.1436808, 1.526048, 0.3254902, 0, 1, 1,
0.6429787, 0.6386487, 0.8079953, 0.3333333, 0, 1, 1,
0.6431723, -2.023733, 1.101911, 0.3372549, 0, 1, 1,
0.6469234, -0.004315358, 2.685072, 0.345098, 0, 1, 1,
0.649582, -0.4796386, 2.415663, 0.3490196, 0, 1, 1,
0.6562275, -0.3447796, 3.134966, 0.3568628, 0, 1, 1,
0.6587112, 1.377765, 1.027865, 0.3607843, 0, 1, 1,
0.6619751, -2.061254, 3.697375, 0.3686275, 0, 1, 1,
0.6629606, 0.3935291, 1.825228, 0.372549, 0, 1, 1,
0.6644185, -0.07084502, 2.440885, 0.3803922, 0, 1, 1,
0.6645729, -0.1948785, 3.22198, 0.3843137, 0, 1, 1,
0.6658613, 0.08770557, 0.8797668, 0.3921569, 0, 1, 1,
0.6677099, 1.341822, -0.5494249, 0.3960784, 0, 1, 1,
0.6703029, -0.5833268, 0.07299694, 0.4039216, 0, 1, 1,
0.6708121, -0.9031108, 2.804261, 0.4117647, 0, 1, 1,
0.6726713, -0.4501179, 2.330854, 0.4156863, 0, 1, 1,
0.6738787, 0.9697114, 0.3108407, 0.4235294, 0, 1, 1,
0.6837928, 0.723046, 3.354759, 0.427451, 0, 1, 1,
0.6858878, -0.6516712, 1.066376, 0.4352941, 0, 1, 1,
0.688216, -0.06393643, 1.874437, 0.4392157, 0, 1, 1,
0.6897431, 0.2365111, 1.481325, 0.4470588, 0, 1, 1,
0.6914815, 0.1002684, 1.240066, 0.4509804, 0, 1, 1,
0.7022461, -0.9960132, 2.7307, 0.4588235, 0, 1, 1,
0.7042186, -0.04098242, 1.702136, 0.4627451, 0, 1, 1,
0.7043134, -0.02904423, 1.369369, 0.4705882, 0, 1, 1,
0.7095615, -1.174851, 2.007188, 0.4745098, 0, 1, 1,
0.7164311, 1.347721, 1.403372, 0.4823529, 0, 1, 1,
0.7180354, -0.997738, 3.639323, 0.4862745, 0, 1, 1,
0.7181256, -0.8414688, 1.849412, 0.4941176, 0, 1, 1,
0.7191739, -0.7744417, 1.072821, 0.5019608, 0, 1, 1,
0.7199083, -0.09059304, 1.512076, 0.5058824, 0, 1, 1,
0.7213919, 0.8552753, -0.4923848, 0.5137255, 0, 1, 1,
0.7251523, -0.5748226, 2.308656, 0.5176471, 0, 1, 1,
0.7255852, 0.2604365, 2.796292, 0.5254902, 0, 1, 1,
0.7281469, -1.398256, 4.903975, 0.5294118, 0, 1, 1,
0.7319646, 0.657872, 2.1868, 0.5372549, 0, 1, 1,
0.7346348, 0.3018032, 1.061422, 0.5411765, 0, 1, 1,
0.7349534, 2.032279, 1.858137, 0.5490196, 0, 1, 1,
0.7450148, -1.480659, 2.955234, 0.5529412, 0, 1, 1,
0.7509378, 1.5368, 0.6286888, 0.5607843, 0, 1, 1,
0.7528113, -2.582143, 3.300472, 0.5647059, 0, 1, 1,
0.7576041, -2.085114, 1.384505, 0.572549, 0, 1, 1,
0.7578685, -0.7508779, 1.866839, 0.5764706, 0, 1, 1,
0.7581605, -0.546273, 2.328918, 0.5843138, 0, 1, 1,
0.762234, 0.6690953, -1.66124, 0.5882353, 0, 1, 1,
0.7627109, -0.8610238, 3.599532, 0.5960785, 0, 1, 1,
0.7648959, -0.6524149, 1.874441, 0.6039216, 0, 1, 1,
0.7691953, -0.2679831, 1.550303, 0.6078432, 0, 1, 1,
0.7704448, -1.018774, 4.73573, 0.6156863, 0, 1, 1,
0.7733549, 0.4205033, 1.572636, 0.6196079, 0, 1, 1,
0.7764966, -0.8926298, 1.826871, 0.627451, 0, 1, 1,
0.7765901, 0.1944736, 2.255455, 0.6313726, 0, 1, 1,
0.779139, 0.02004316, 0.2052923, 0.6392157, 0, 1, 1,
0.7816266, 0.2936483, 2.535923, 0.6431373, 0, 1, 1,
0.782021, 0.9184835, 3.403294, 0.6509804, 0, 1, 1,
0.7831021, -0.2963453, 1.120806, 0.654902, 0, 1, 1,
0.7854362, -0.8577069, 3.168164, 0.6627451, 0, 1, 1,
0.7902408, -0.4761141, 3.4882, 0.6666667, 0, 1, 1,
0.7915201, 0.8366284, 0.2847471, 0.6745098, 0, 1, 1,
0.8056999, -0.2582761, 2.564181, 0.6784314, 0, 1, 1,
0.808384, -0.2804939, 3.383896, 0.6862745, 0, 1, 1,
0.8111622, 1.469973, 1.586414, 0.6901961, 0, 1, 1,
0.8159221, 0.4009277, 3.128649, 0.6980392, 0, 1, 1,
0.8222595, 1.492704, -1.193725, 0.7058824, 0, 1, 1,
0.8226894, 0.5518354, 1.258735, 0.7098039, 0, 1, 1,
0.8247827, -0.3066273, 2.04952, 0.7176471, 0, 1, 1,
0.8263647, 2.186773, -0.07387131, 0.7215686, 0, 1, 1,
0.8310257, -0.6199725, 0.5158648, 0.7294118, 0, 1, 1,
0.84396, 1.39577, 2.125621, 0.7333333, 0, 1, 1,
0.8441354, 0.8739318, -1.041599, 0.7411765, 0, 1, 1,
0.8493418, 0.4710376, 0.8138487, 0.7450981, 0, 1, 1,
0.8494098, -0.444728, 1.328108, 0.7529412, 0, 1, 1,
0.8526751, -0.4980124, 1.879411, 0.7568628, 0, 1, 1,
0.8548508, -0.6240959, 0.6172258, 0.7647059, 0, 1, 1,
0.8568076, -0.5829666, 1.916388, 0.7686275, 0, 1, 1,
0.8592077, 0.222842, 1.110066, 0.7764706, 0, 1, 1,
0.8593215, -1.085765, 2.645603, 0.7803922, 0, 1, 1,
0.8602257, -0.4918689, 2.301356, 0.7882353, 0, 1, 1,
0.860311, -0.8450705, 2.59063, 0.7921569, 0, 1, 1,
0.8698469, 0.3608491, -0.9454945, 0.8, 0, 1, 1,
0.8710738, 0.2483432, 1.281438, 0.8078431, 0, 1, 1,
0.8716552, 0.3652771, 0.896422, 0.8117647, 0, 1, 1,
0.8723337, -0.6580626, 4.041122, 0.8196079, 0, 1, 1,
0.8771756, 0.1242554, 2.693248, 0.8235294, 0, 1, 1,
0.8772136, -0.7172127, 2.294092, 0.8313726, 0, 1, 1,
0.8780353, -0.6473557, 2.630755, 0.8352941, 0, 1, 1,
0.8827292, 0.08310162, 2.199635, 0.8431373, 0, 1, 1,
0.8923437, -1.493558, 2.288293, 0.8470588, 0, 1, 1,
0.8929878, 0.43407, 0.8366024, 0.854902, 0, 1, 1,
0.8993476, 1.277841, 1.943677, 0.8588235, 0, 1, 1,
0.903456, -1.21163, 1.939372, 0.8666667, 0, 1, 1,
0.9051999, -0.7557794, 2.531112, 0.8705882, 0, 1, 1,
0.909463, 0.1231824, 1.447949, 0.8784314, 0, 1, 1,
0.9116185, -0.4087225, 1.923931, 0.8823529, 0, 1, 1,
0.9256965, 0.9336088, -0.1711078, 0.8901961, 0, 1, 1,
0.9303474, 0.6757917, 2.919307, 0.8941177, 0, 1, 1,
0.9317945, -0.1780168, 1.563208, 0.9019608, 0, 1, 1,
0.937783, 0.009478061, 1.271571, 0.9098039, 0, 1, 1,
0.938746, -0.8561742, 2.29354, 0.9137255, 0, 1, 1,
0.9411739, 1.43317, 0.1959493, 0.9215686, 0, 1, 1,
0.9429606, -1.876916, 1.78923, 0.9254902, 0, 1, 1,
0.9451582, 1.459732, 0.7176249, 0.9333333, 0, 1, 1,
0.9474892, 0.09915096, 1.378264, 0.9372549, 0, 1, 1,
0.9594625, 1.280388, 0.03239421, 0.945098, 0, 1, 1,
0.9596193, -1.272073, 4.007254, 0.9490196, 0, 1, 1,
0.9616877, -0.8884969, 1.153388, 0.9568627, 0, 1, 1,
0.9617631, 0.2856565, 1.953638, 0.9607843, 0, 1, 1,
0.9631572, 0.8251253, -0.2546333, 0.9686275, 0, 1, 1,
0.9668592, 0.0621506, 1.731232, 0.972549, 0, 1, 1,
0.9677525, -1.132448, 2.361456, 0.9803922, 0, 1, 1,
0.9735187, -1.142441, 2.122294, 0.9843137, 0, 1, 1,
0.9822045, -1.120217, 3.169682, 0.9921569, 0, 1, 1,
0.9898055, -0.2312307, 2.540069, 0.9960784, 0, 1, 1,
0.9973704, -0.1405047, 0.1014213, 1, 0, 0.9960784, 1,
1.011045, 0.8601615, 1.066643, 1, 0, 0.9882353, 1,
1.011585, -1.010215, 1.2326, 1, 0, 0.9843137, 1,
1.018466, -1.060948, 0.8413439, 1, 0, 0.9764706, 1,
1.021913, -0.5755674, 0.6927479, 1, 0, 0.972549, 1,
1.025516, 0.8509262, 2.087517, 1, 0, 0.9647059, 1,
1.025814, 1.582937, -0.4363954, 1, 0, 0.9607843, 1,
1.026691, -0.7343132, 1.413119, 1, 0, 0.9529412, 1,
1.03421, -0.07615644, 1.640508, 1, 0, 0.9490196, 1,
1.035083, 0.7084893, 2.10412, 1, 0, 0.9411765, 1,
1.043873, -0.1191587, 0.8163493, 1, 0, 0.9372549, 1,
1.049872, -0.263277, 2.440814, 1, 0, 0.9294118, 1,
1.052034, -1.176673, 3.794739, 1, 0, 0.9254902, 1,
1.054082, -0.7865015, 1.882244, 1, 0, 0.9176471, 1,
1.054083, 0.0897415, 1.626419, 1, 0, 0.9137255, 1,
1.07305, -0.1470543, 1.628841, 1, 0, 0.9058824, 1,
1.076329, -1.054912, 1.354982, 1, 0, 0.9019608, 1,
1.079207, -1.198172, 1.326157, 1, 0, 0.8941177, 1,
1.080245, 1.206245, 2.157145, 1, 0, 0.8862745, 1,
1.081715, 0.5129753, 1.163168, 1, 0, 0.8823529, 1,
1.082378, -1.36769, 1.734897, 1, 0, 0.8745098, 1,
1.084216, 0.06593022, 1.3882, 1, 0, 0.8705882, 1,
1.091243, -0.3873706, 2.339817, 1, 0, 0.8627451, 1,
1.091629, -1.536972, 1.717782, 1, 0, 0.8588235, 1,
1.093933, -0.07802674, 0.4989778, 1, 0, 0.8509804, 1,
1.101655, 0.4557256, 0.9816849, 1, 0, 0.8470588, 1,
1.103607, 1.252474, 0.7760332, 1, 0, 0.8392157, 1,
1.11105, -1.182535, 2.352836, 1, 0, 0.8352941, 1,
1.113501, -0.6567503, 2.644071, 1, 0, 0.827451, 1,
1.121546, -0.6906365, 2.722607, 1, 0, 0.8235294, 1,
1.123003, -0.02164652, 1.242649, 1, 0, 0.8156863, 1,
1.124362, -1.2028, 0.7863811, 1, 0, 0.8117647, 1,
1.128535, -0.9682419, 1.957016, 1, 0, 0.8039216, 1,
1.129516, 0.5943928, 1.932996, 1, 0, 0.7960784, 1,
1.132212, -0.9693421, 1.972549, 1, 0, 0.7921569, 1,
1.1574, 1.3411, 0.06971198, 1, 0, 0.7843137, 1,
1.15763, -0.3737571, 1.546474, 1, 0, 0.7803922, 1,
1.163934, 0.0311349, -0.2945105, 1, 0, 0.772549, 1,
1.167092, 1.605555, -1.055029, 1, 0, 0.7686275, 1,
1.177013, -0.1501982, 2.021065, 1, 0, 0.7607843, 1,
1.178292, 0.6187689, 1.348233, 1, 0, 0.7568628, 1,
1.179842, 0.530655, 1.053618, 1, 0, 0.7490196, 1,
1.181876, 1.187911, 0.3520905, 1, 0, 0.7450981, 1,
1.182013, 1.454479, -1.100478, 1, 0, 0.7372549, 1,
1.182754, -0.03724219, 0.9659384, 1, 0, 0.7333333, 1,
1.184151, -0.3371835, 2.839819, 1, 0, 0.7254902, 1,
1.189487, -0.430431, 2.243176, 1, 0, 0.7215686, 1,
1.195795, 0.8727856, -1.542541, 1, 0, 0.7137255, 1,
1.198797, -2.372463, 1.223933, 1, 0, 0.7098039, 1,
1.204209, -0.1713742, 0.2302626, 1, 0, 0.7019608, 1,
1.209638, -0.5453215, 2.500815, 1, 0, 0.6941177, 1,
1.223046, -1.077887, 0.9747018, 1, 0, 0.6901961, 1,
1.235342, 0.2063958, 1.479316, 1, 0, 0.682353, 1,
1.237462, 0.02638697, 1.368047, 1, 0, 0.6784314, 1,
1.243104, 0.2620785, -0.7380484, 1, 0, 0.6705883, 1,
1.245969, -0.07439765, 0.7346575, 1, 0, 0.6666667, 1,
1.247517, -1.454873, 3.174285, 1, 0, 0.6588235, 1,
1.258284, -0.3960011, 0.9081817, 1, 0, 0.654902, 1,
1.259096, -0.4435042, 0.7612533, 1, 0, 0.6470588, 1,
1.259238, 0.9690459, 2.358675, 1, 0, 0.6431373, 1,
1.267995, -0.1409447, 1.991091, 1, 0, 0.6352941, 1,
1.273717, -1.370908, 1.994296, 1, 0, 0.6313726, 1,
1.282865, -0.2745192, 1.702542, 1, 0, 0.6235294, 1,
1.284219, -0.4546001, 3.1204, 1, 0, 0.6196079, 1,
1.311388, -1.779457, 1.919664, 1, 0, 0.6117647, 1,
1.321473, -0.04495333, 1.786106, 1, 0, 0.6078432, 1,
1.322797, 2.65115, 0.5334916, 1, 0, 0.6, 1,
1.328044, 0.5721493, 1.257208, 1, 0, 0.5921569, 1,
1.349427, 1.37941, 0.5473384, 1, 0, 0.5882353, 1,
1.359157, -0.3282598, 1.890482, 1, 0, 0.5803922, 1,
1.362274, 0.2925837, 0.3659254, 1, 0, 0.5764706, 1,
1.375847, -1.110608, 0.4522101, 1, 0, 0.5686275, 1,
1.377768, -0.3447627, 0.9013542, 1, 0, 0.5647059, 1,
1.381299, -1.542544, 1.803754, 1, 0, 0.5568628, 1,
1.388365, 0.6038502, -1.208665, 1, 0, 0.5529412, 1,
1.399516, -1.30244, 1.434467, 1, 0, 0.5450981, 1,
1.404564, -0.09844901, 0.298, 1, 0, 0.5411765, 1,
1.415405, 0.2363884, 1.669076, 1, 0, 0.5333334, 1,
1.418635, -0.2446473, 0.9120049, 1, 0, 0.5294118, 1,
1.42726, -0.732883, 0.2769172, 1, 0, 0.5215687, 1,
1.428968, -0.1246279, 2.58118, 1, 0, 0.5176471, 1,
1.442147, 0.6894112, 2.478966, 1, 0, 0.509804, 1,
1.449339, -1.874583, 2.616972, 1, 0, 0.5058824, 1,
1.459851, 1.162899, 1.287063, 1, 0, 0.4980392, 1,
1.459876, -0.8070772, 1.840956, 1, 0, 0.4901961, 1,
1.474438, -0.1965586, 3.074734, 1, 0, 0.4862745, 1,
1.478258, 0.4638047, 0.2885719, 1, 0, 0.4784314, 1,
1.493703, 1.061518, 1.56149, 1, 0, 0.4745098, 1,
1.498322, -0.1452028, 2.528602, 1, 0, 0.4666667, 1,
1.500054, -0.2724378, 0.6999859, 1, 0, 0.4627451, 1,
1.510368, -0.3987912, 0.573287, 1, 0, 0.454902, 1,
1.515622, -2.212378, 1.477384, 1, 0, 0.4509804, 1,
1.51598, -0.0418683, 1.027505, 1, 0, 0.4431373, 1,
1.537549, -0.1158335, 1.92562, 1, 0, 0.4392157, 1,
1.543508, -0.9764342, 4.359359, 1, 0, 0.4313726, 1,
1.545425, -0.1269253, 0.8506185, 1, 0, 0.427451, 1,
1.552029, 0.7821867, 0.5178443, 1, 0, 0.4196078, 1,
1.554041, -1.324065, 0.8555714, 1, 0, 0.4156863, 1,
1.55593, -0.502287, 0.4263633, 1, 0, 0.4078431, 1,
1.566238, -0.629982, 1.5906, 1, 0, 0.4039216, 1,
1.574814, 0.3883597, 1.240829, 1, 0, 0.3960784, 1,
1.577781, -0.4678434, 1.425658, 1, 0, 0.3882353, 1,
1.579555, -0.1376138, 2.123688, 1, 0, 0.3843137, 1,
1.584612, 0.7306138, 1.98697, 1, 0, 0.3764706, 1,
1.586715, -0.3796837, 3.161428, 1, 0, 0.372549, 1,
1.595615, 0.6358058, 1.2988, 1, 0, 0.3647059, 1,
1.608096, 1.094024, 0.579285, 1, 0, 0.3607843, 1,
1.611833, 2.096951, 1.958508, 1, 0, 0.3529412, 1,
1.615419, 0.3413599, 2.540225, 1, 0, 0.3490196, 1,
1.618276, 0.3102562, 2.062613, 1, 0, 0.3411765, 1,
1.622249, 1.269701, -0.8594354, 1, 0, 0.3372549, 1,
1.623636, -0.6470342, 3.193528, 1, 0, 0.3294118, 1,
1.627202, 1.988633, -0.5873252, 1, 0, 0.3254902, 1,
1.639799, -1.032465, 1.778929, 1, 0, 0.3176471, 1,
1.64808, -1.23713, 2.345335, 1, 0, 0.3137255, 1,
1.660694, -1.056167, 2.546164, 1, 0, 0.3058824, 1,
1.665902, 0.466331, 2.673955, 1, 0, 0.2980392, 1,
1.667614, -1.037114, 1.694101, 1, 0, 0.2941177, 1,
1.687811, -1.446309, 3.095022, 1, 0, 0.2862745, 1,
1.710589, -0.9377046, 3.493891, 1, 0, 0.282353, 1,
1.734267, 0.8842266, 2.374183, 1, 0, 0.2745098, 1,
1.754485, -0.8070823, 2.950312, 1, 0, 0.2705882, 1,
1.763314, -2.26753, 2.409126, 1, 0, 0.2627451, 1,
1.770322, 1.026321, 2.322393, 1, 0, 0.2588235, 1,
1.780531, 0.2745779, 1.59726, 1, 0, 0.2509804, 1,
1.782252, 0.5286908, 1.63828, 1, 0, 0.2470588, 1,
1.803378, -0.04038531, 2.591901, 1, 0, 0.2392157, 1,
1.803396, 0.3603255, 1.990939, 1, 0, 0.2352941, 1,
1.803629, -1.193547, 1.865612, 1, 0, 0.227451, 1,
1.811303, 0.2758891, 1.85347, 1, 0, 0.2235294, 1,
1.821761, -0.6213607, 1.132272, 1, 0, 0.2156863, 1,
1.82275, -0.3737321, 1.055978, 1, 0, 0.2117647, 1,
1.822814, -0.5150346, 2.02069, 1, 0, 0.2039216, 1,
1.856187, -0.5075695, 1.947313, 1, 0, 0.1960784, 1,
1.878609, 0.1669725, 2.214626, 1, 0, 0.1921569, 1,
1.884727, -0.09667066, 0.6693134, 1, 0, 0.1843137, 1,
1.885284, 0.3666084, 2.860972, 1, 0, 0.1803922, 1,
1.899527, 0.5976998, 0.5116345, 1, 0, 0.172549, 1,
1.938412, 0.274506, 2.238999, 1, 0, 0.1686275, 1,
1.954097, 0.3137602, 2.595701, 1, 0, 0.1607843, 1,
1.956146, 1.627259, 0.4391907, 1, 0, 0.1568628, 1,
1.960457, 0.1622439, 2.294493, 1, 0, 0.1490196, 1,
1.998351, 0.6495008, 1.058496, 1, 0, 0.145098, 1,
2.002897, 0.2221649, 1.19678, 1, 0, 0.1372549, 1,
2.010319, 0.1255755, 0.05885662, 1, 0, 0.1333333, 1,
2.040318, -0.2154274, 1.463891, 1, 0, 0.1254902, 1,
2.047742, 0.1111106, 3.869903, 1, 0, 0.1215686, 1,
2.057565, 0.1366463, 1.815125, 1, 0, 0.1137255, 1,
2.064444, 0.2383005, 1.058247, 1, 0, 0.1098039, 1,
2.075294, -0.8132376, 1.521369, 1, 0, 0.1019608, 1,
2.076303, -0.9222836, 2.057901, 1, 0, 0.09411765, 1,
2.076946, -0.8897312, 1.07872, 1, 0, 0.09019608, 1,
2.083994, 0.6657487, 1.153467, 1, 0, 0.08235294, 1,
2.098171, -0.4678229, 1.858458, 1, 0, 0.07843138, 1,
2.165896, -0.6101136, 1.781477, 1, 0, 0.07058824, 1,
2.227758, 1.27465, 0.6734611, 1, 0, 0.06666667, 1,
2.249949, -1.483413, 1.952663, 1, 0, 0.05882353, 1,
2.334724, 1.396756, 0.006496908, 1, 0, 0.05490196, 1,
2.369041, 0.1755469, 2.058963, 1, 0, 0.04705882, 1,
2.381319, -1.099884, 2.676117, 1, 0, 0.04313726, 1,
2.398782, -0.0135658, 0.639811, 1, 0, 0.03529412, 1,
2.40349, 0.02544729, 1.481444, 1, 0, 0.03137255, 1,
2.412721, -0.9137335, 1.408437, 1, 0, 0.02352941, 1,
2.575163, -0.9711307, 1.680482, 1, 0, 0.01960784, 1,
2.677379, -1.641352, 0.7896439, 1, 0, 0.01176471, 1,
3.116734, -1.101363, 1.709595, 1, 0, 0.007843138, 1
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
0.06862128, -3.596048, -7.013338, 0, -0.5, 0.5, 0.5,
0.06862128, -3.596048, -7.013338, 1, -0.5, 0.5, 0.5,
0.06862128, -3.596048, -7.013338, 1, 1.5, 0.5, 0.5,
0.06862128, -3.596048, -7.013338, 0, 1.5, 0.5, 0.5
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
-4.012801, 0.408726, -7.013338, 0, -0.5, 0.5, 0.5,
-4.012801, 0.408726, -7.013338, 1, -0.5, 0.5, 0.5,
-4.012801, 0.408726, -7.013338, 1, 1.5, 0.5, 0.5,
-4.012801, 0.408726, -7.013338, 0, 1.5, 0.5, 0.5
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
-4.012801, -3.596048, 0.3369484, 0, -0.5, 0.5, 0.5,
-4.012801, -3.596048, 0.3369484, 1, -0.5, 0.5, 0.5,
-4.012801, -3.596048, 0.3369484, 1, 1.5, 0.5, 0.5,
-4.012801, -3.596048, 0.3369484, 0, 1.5, 0.5, 0.5
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
-2, -2.671869, -5.317118,
3, -2.671869, -5.317118,
-2, -2.671869, -5.317118,
-2, -2.825899, -5.599821,
-1, -2.671869, -5.317118,
-1, -2.825899, -5.599821,
0, -2.671869, -5.317118,
0, -2.825899, -5.599821,
1, -2.671869, -5.317118,
1, -2.825899, -5.599821,
2, -2.671869, -5.317118,
2, -2.825899, -5.599821,
3, -2.671869, -5.317118,
3, -2.825899, -5.599821
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
-2, -3.133959, -6.165228, 0, -0.5, 0.5, 0.5,
-2, -3.133959, -6.165228, 1, -0.5, 0.5, 0.5,
-2, -3.133959, -6.165228, 1, 1.5, 0.5, 0.5,
-2, -3.133959, -6.165228, 0, 1.5, 0.5, 0.5,
-1, -3.133959, -6.165228, 0, -0.5, 0.5, 0.5,
-1, -3.133959, -6.165228, 1, -0.5, 0.5, 0.5,
-1, -3.133959, -6.165228, 1, 1.5, 0.5, 0.5,
-1, -3.133959, -6.165228, 0, 1.5, 0.5, 0.5,
0, -3.133959, -6.165228, 0, -0.5, 0.5, 0.5,
0, -3.133959, -6.165228, 1, -0.5, 0.5, 0.5,
0, -3.133959, -6.165228, 1, 1.5, 0.5, 0.5,
0, -3.133959, -6.165228, 0, 1.5, 0.5, 0.5,
1, -3.133959, -6.165228, 0, -0.5, 0.5, 0.5,
1, -3.133959, -6.165228, 1, -0.5, 0.5, 0.5,
1, -3.133959, -6.165228, 1, 1.5, 0.5, 0.5,
1, -3.133959, -6.165228, 0, 1.5, 0.5, 0.5,
2, -3.133959, -6.165228, 0, -0.5, 0.5, 0.5,
2, -3.133959, -6.165228, 1, -0.5, 0.5, 0.5,
2, -3.133959, -6.165228, 1, 1.5, 0.5, 0.5,
2, -3.133959, -6.165228, 0, 1.5, 0.5, 0.5,
3, -3.133959, -6.165228, 0, -0.5, 0.5, 0.5,
3, -3.133959, -6.165228, 1, -0.5, 0.5, 0.5,
3, -3.133959, -6.165228, 1, 1.5, 0.5, 0.5,
3, -3.133959, -6.165228, 0, 1.5, 0.5, 0.5
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
-3.070934, -2, -5.317118,
-3.070934, 3, -5.317118,
-3.070934, -2, -5.317118,
-3.227912, -2, -5.599821,
-3.070934, -1, -5.317118,
-3.227912, -1, -5.599821,
-3.070934, 0, -5.317118,
-3.227912, 0, -5.599821,
-3.070934, 1, -5.317118,
-3.227912, 1, -5.599821,
-3.070934, 2, -5.317118,
-3.227912, 2, -5.599821,
-3.070934, 3, -5.317118,
-3.227912, 3, -5.599821
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
-3.541868, -2, -6.165228, 0, -0.5, 0.5, 0.5,
-3.541868, -2, -6.165228, 1, -0.5, 0.5, 0.5,
-3.541868, -2, -6.165228, 1, 1.5, 0.5, 0.5,
-3.541868, -2, -6.165228, 0, 1.5, 0.5, 0.5,
-3.541868, -1, -6.165228, 0, -0.5, 0.5, 0.5,
-3.541868, -1, -6.165228, 1, -0.5, 0.5, 0.5,
-3.541868, -1, -6.165228, 1, 1.5, 0.5, 0.5,
-3.541868, -1, -6.165228, 0, 1.5, 0.5, 0.5,
-3.541868, 0, -6.165228, 0, -0.5, 0.5, 0.5,
-3.541868, 0, -6.165228, 1, -0.5, 0.5, 0.5,
-3.541868, 0, -6.165228, 1, 1.5, 0.5, 0.5,
-3.541868, 0, -6.165228, 0, 1.5, 0.5, 0.5,
-3.541868, 1, -6.165228, 0, -0.5, 0.5, 0.5,
-3.541868, 1, -6.165228, 1, -0.5, 0.5, 0.5,
-3.541868, 1, -6.165228, 1, 1.5, 0.5, 0.5,
-3.541868, 1, -6.165228, 0, 1.5, 0.5, 0.5,
-3.541868, 2, -6.165228, 0, -0.5, 0.5, 0.5,
-3.541868, 2, -6.165228, 1, -0.5, 0.5, 0.5,
-3.541868, 2, -6.165228, 1, 1.5, 0.5, 0.5,
-3.541868, 2, -6.165228, 0, 1.5, 0.5, 0.5,
-3.541868, 3, -6.165228, 0, -0.5, 0.5, 0.5,
-3.541868, 3, -6.165228, 1, -0.5, 0.5, 0.5,
-3.541868, 3, -6.165228, 1, 1.5, 0.5, 0.5,
-3.541868, 3, -6.165228, 0, 1.5, 0.5, 0.5
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
-3.070934, -2.671869, -4,
-3.070934, -2.671869, 4,
-3.070934, -2.671869, -4,
-3.227912, -2.825899, -4,
-3.070934, -2.671869, -2,
-3.227912, -2.825899, -2,
-3.070934, -2.671869, 0,
-3.227912, -2.825899, 0,
-3.070934, -2.671869, 2,
-3.227912, -2.825899, 2,
-3.070934, -2.671869, 4,
-3.227912, -2.825899, 4
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
-3.541868, -3.133959, -4, 0, -0.5, 0.5, 0.5,
-3.541868, -3.133959, -4, 1, -0.5, 0.5, 0.5,
-3.541868, -3.133959, -4, 1, 1.5, 0.5, 0.5,
-3.541868, -3.133959, -4, 0, 1.5, 0.5, 0.5,
-3.541868, -3.133959, -2, 0, -0.5, 0.5, 0.5,
-3.541868, -3.133959, -2, 1, -0.5, 0.5, 0.5,
-3.541868, -3.133959, -2, 1, 1.5, 0.5, 0.5,
-3.541868, -3.133959, -2, 0, 1.5, 0.5, 0.5,
-3.541868, -3.133959, 0, 0, -0.5, 0.5, 0.5,
-3.541868, -3.133959, 0, 1, -0.5, 0.5, 0.5,
-3.541868, -3.133959, 0, 1, 1.5, 0.5, 0.5,
-3.541868, -3.133959, 0, 0, 1.5, 0.5, 0.5,
-3.541868, -3.133959, 2, 0, -0.5, 0.5, 0.5,
-3.541868, -3.133959, 2, 1, -0.5, 0.5, 0.5,
-3.541868, -3.133959, 2, 1, 1.5, 0.5, 0.5,
-3.541868, -3.133959, 2, 0, 1.5, 0.5, 0.5,
-3.541868, -3.133959, 4, 0, -0.5, 0.5, 0.5,
-3.541868, -3.133959, 4, 1, -0.5, 0.5, 0.5,
-3.541868, -3.133959, 4, 1, 1.5, 0.5, 0.5,
-3.541868, -3.133959, 4, 0, 1.5, 0.5, 0.5
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
-3.070934, -2.671869, -5.317118,
-3.070934, 3.489321, -5.317118,
-3.070934, -2.671869, 5.991014,
-3.070934, 3.489321, 5.991014,
-3.070934, -2.671869, -5.317118,
-3.070934, -2.671869, 5.991014,
-3.070934, 3.489321, -5.317118,
-3.070934, 3.489321, 5.991014,
-3.070934, -2.671869, -5.317118,
3.208177, -2.671869, -5.317118,
-3.070934, -2.671869, 5.991014,
3.208177, -2.671869, 5.991014,
-3.070934, 3.489321, -5.317118,
3.208177, 3.489321, -5.317118,
-3.070934, 3.489321, 5.991014,
3.208177, 3.489321, 5.991014,
3.208177, -2.671869, -5.317118,
3.208177, 3.489321, -5.317118,
3.208177, -2.671869, 5.991014,
3.208177, 3.489321, 5.991014,
3.208177, -2.671869, -5.317118,
3.208177, -2.671869, 5.991014,
3.208177, 3.489321, -5.317118,
3.208177, 3.489321, 5.991014
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
var radius = 7.650311;
var distance = 34.03709;
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
mvMatrix.translate( -0.06862128, -0.408726, -0.3369484 );
mvMatrix.scale( 1.317331, 1.342543, 0.7314794 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.03709);
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


