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
-3.177081, -0.710412, -0.4687732, 1, 0, 0, 1,
-2.711224, 0.2839706, -2.763811, 1, 0.007843138, 0, 1,
-2.651713, 2.591982, -1.760833, 1, 0.01176471, 0, 1,
-2.42996, -1.03908, -1.953613, 1, 0.01960784, 0, 1,
-2.404155, -0.07287444, -0.9038988, 1, 0.02352941, 0, 1,
-2.370711, -0.1940249, -2.748364, 1, 0.03137255, 0, 1,
-2.356595, -0.3270601, -2.553534, 1, 0.03529412, 0, 1,
-2.336952, -2.476615, -3.134152, 1, 0.04313726, 0, 1,
-2.148139, 0.04862382, -0.3921698, 1, 0.04705882, 0, 1,
-2.125408, 0.7116709, -1.80931, 1, 0.05490196, 0, 1,
-2.091785, -0.07077413, -2.949416, 1, 0.05882353, 0, 1,
-2.084166, 0.6461308, -0.6609645, 1, 0.06666667, 0, 1,
-2.058948, 0.9381196, -0.668076, 1, 0.07058824, 0, 1,
-2.031528, 0.2086807, -2.433962, 1, 0.07843138, 0, 1,
-2.021736, -0.7679447, -1.528648, 1, 0.08235294, 0, 1,
-2.002926, -1.804054, -2.47677, 1, 0.09019608, 0, 1,
-1.999326, 0.7249975, -0.08623851, 1, 0.09411765, 0, 1,
-1.998448, -0.6406822, -1.999486, 1, 0.1019608, 0, 1,
-1.995427, 0.1111047, -0.5759931, 1, 0.1098039, 0, 1,
-1.987243, 0.8680175, -2.006013, 1, 0.1137255, 0, 1,
-1.976841, -0.1357623, -1.078501, 1, 0.1215686, 0, 1,
-1.974887, 0.1215478, -1.669232, 1, 0.1254902, 0, 1,
-1.946118, -2.503013, -1.09554, 1, 0.1333333, 0, 1,
-1.936025, 0.6522848, -0.6821049, 1, 0.1372549, 0, 1,
-1.872485, -0.2268003, -0.174109, 1, 0.145098, 0, 1,
-1.867865, -0.3678941, -2.887878, 1, 0.1490196, 0, 1,
-1.849639, -0.3607844, -2.121016, 1, 0.1568628, 0, 1,
-1.836457, 0.4684656, -0.9177201, 1, 0.1607843, 0, 1,
-1.822541, -0.8540819, -2.843415, 1, 0.1686275, 0, 1,
-1.804899, 1.17368, -0.06224817, 1, 0.172549, 0, 1,
-1.802261, 1.372142, 0.2863699, 1, 0.1803922, 0, 1,
-1.800463, 0.5967923, -0.6515941, 1, 0.1843137, 0, 1,
-1.795778, -2.260759, 0.003827937, 1, 0.1921569, 0, 1,
-1.766417, 0.8144743, 0.319164, 1, 0.1960784, 0, 1,
-1.759777, 0.1858094, -1.438594, 1, 0.2039216, 0, 1,
-1.720796, -0.1830876, -2.744971, 1, 0.2117647, 0, 1,
-1.720047, 0.6410704, -1.498224, 1, 0.2156863, 0, 1,
-1.717603, -1.541085, -1.593012, 1, 0.2235294, 0, 1,
-1.713436, -0.1630278, -0.9593036, 1, 0.227451, 0, 1,
-1.711313, -1.333977, -2.525894, 1, 0.2352941, 0, 1,
-1.694317, -0.6994626, -2.589331, 1, 0.2392157, 0, 1,
-1.687419, -1.568755, -2.261481, 1, 0.2470588, 0, 1,
-1.685024, -0.190536, -2.047105, 1, 0.2509804, 0, 1,
-1.667186, 1.644799, -0.1462293, 1, 0.2588235, 0, 1,
-1.650695, -0.06450519, -2.320378, 1, 0.2627451, 0, 1,
-1.638176, 0.8942615, 0.01382388, 1, 0.2705882, 0, 1,
-1.622247, -0.9899818, -0.8503773, 1, 0.2745098, 0, 1,
-1.584622, -0.04531579, -1.359426, 1, 0.282353, 0, 1,
-1.581079, -0.4306355, 0.00307784, 1, 0.2862745, 0, 1,
-1.577156, -0.8751805, -1.505235, 1, 0.2941177, 0, 1,
-1.571246, -1.864716, -3.144918, 1, 0.3019608, 0, 1,
-1.565074, -1.539976, -1.170624, 1, 0.3058824, 0, 1,
-1.556409, -0.1248419, -2.624405, 1, 0.3137255, 0, 1,
-1.546913, 1.177607, 0.2655872, 1, 0.3176471, 0, 1,
-1.539549, 0.9081138, -2.049212, 1, 0.3254902, 0, 1,
-1.534303, 0.3009229, -0.6449189, 1, 0.3294118, 0, 1,
-1.52998, -0.5484445, -0.80134, 1, 0.3372549, 0, 1,
-1.528556, 1.594689, -3.217429, 1, 0.3411765, 0, 1,
-1.519081, -0.1967926, -2.664158, 1, 0.3490196, 0, 1,
-1.516608, 0.3280215, -1.860405, 1, 0.3529412, 0, 1,
-1.514325, -0.1042998, -2.548676, 1, 0.3607843, 0, 1,
-1.509809, 0.5293217, -1.671638, 1, 0.3647059, 0, 1,
-1.504664, 0.7481129, -1.992443, 1, 0.372549, 0, 1,
-1.494129, -0.5718752, -1.527955, 1, 0.3764706, 0, 1,
-1.47516, -0.02183034, -2.599903, 1, 0.3843137, 0, 1,
-1.473097, -0.4897354, -0.6428947, 1, 0.3882353, 0, 1,
-1.457652, -0.3122548, -2.368616, 1, 0.3960784, 0, 1,
-1.451918, -0.07500036, -2.894198, 1, 0.4039216, 0, 1,
-1.43322, 0.07959316, -0.9498054, 1, 0.4078431, 0, 1,
-1.428311, 2.746589, -0.4916307, 1, 0.4156863, 0, 1,
-1.409258, 0.1999948, -2.936741, 1, 0.4196078, 0, 1,
-1.407844, 1.957973, -0.9517097, 1, 0.427451, 0, 1,
-1.386667, -1.298863, -1.292983, 1, 0.4313726, 0, 1,
-1.367141, -0.2787755, -2.081893, 1, 0.4392157, 0, 1,
-1.365908, 0.4493574, -2.258967, 1, 0.4431373, 0, 1,
-1.36451, 0.8062074, 0.3791867, 1, 0.4509804, 0, 1,
-1.360774, -0.6372252, -1.300779, 1, 0.454902, 0, 1,
-1.360556, -1.770088, -2.089218, 1, 0.4627451, 0, 1,
-1.355453, -0.1572594, -3.004223, 1, 0.4666667, 0, 1,
-1.352665, 0.3711973, -1.222505, 1, 0.4745098, 0, 1,
-1.352435, -0.4090733, -2.103076, 1, 0.4784314, 0, 1,
-1.345849, -0.4098579, -2.14278, 1, 0.4862745, 0, 1,
-1.340376, 0.1724998, -3.485428, 1, 0.4901961, 0, 1,
-1.316794, -0.8050829, -2.098469, 1, 0.4980392, 0, 1,
-1.313862, 0.9536171, -1.136164, 1, 0.5058824, 0, 1,
-1.311214, -0.5893924, -1.656506, 1, 0.509804, 0, 1,
-1.308685, 0.2752893, -2.965559, 1, 0.5176471, 0, 1,
-1.308211, -0.05565445, -0.2539893, 1, 0.5215687, 0, 1,
-1.30691, 0.5182094, -1.993195, 1, 0.5294118, 0, 1,
-1.305161, 1.506855, -0.4243769, 1, 0.5333334, 0, 1,
-1.303611, -0.1434068, 0.411851, 1, 0.5411765, 0, 1,
-1.302197, -0.6725437, -3.326159, 1, 0.5450981, 0, 1,
-1.292966, 2.041892, -2.511189, 1, 0.5529412, 0, 1,
-1.286417, 0.1145236, -1.881065, 1, 0.5568628, 0, 1,
-1.282164, -0.5053846, -2.763235, 1, 0.5647059, 0, 1,
-1.274222, 0.6773484, -1.041793, 1, 0.5686275, 0, 1,
-1.269062, 0.2430495, -1.706915, 1, 0.5764706, 0, 1,
-1.263963, 0.9840508, -1.414885, 1, 0.5803922, 0, 1,
-1.256373, 0.1450572, -0.604278, 1, 0.5882353, 0, 1,
-1.255651, 0.2354578, -1.883391, 1, 0.5921569, 0, 1,
-1.251857, -0.9669269, -2.794216, 1, 0.6, 0, 1,
-1.235093, 0.3767979, -2.607822, 1, 0.6078432, 0, 1,
-1.231464, -0.4891003, -0.6863327, 1, 0.6117647, 0, 1,
-1.224019, -0.368798, -2.366185, 1, 0.6196079, 0, 1,
-1.223148, 0.6288806, -1.428279, 1, 0.6235294, 0, 1,
-1.221017, -0.1328681, -0.1332941, 1, 0.6313726, 0, 1,
-1.220157, -0.2304026, -3.162608, 1, 0.6352941, 0, 1,
-1.212724, -1.316539, -0.6181043, 1, 0.6431373, 0, 1,
-1.2126, -2.048837, -3.534849, 1, 0.6470588, 0, 1,
-1.191606, -0.5057735, -4.106183, 1, 0.654902, 0, 1,
-1.184895, 0.6269773, -1.874396, 1, 0.6588235, 0, 1,
-1.182516, 1.081137, -1.002146, 1, 0.6666667, 0, 1,
-1.180529, -0.29263, -0.8088859, 1, 0.6705883, 0, 1,
-1.178615, -0.762242, -0.616842, 1, 0.6784314, 0, 1,
-1.155401, -0.5192261, -1.290529, 1, 0.682353, 0, 1,
-1.154801, -0.1973995, -1.670694, 1, 0.6901961, 0, 1,
-1.146677, 1.135527, -0.6603423, 1, 0.6941177, 0, 1,
-1.146093, -1.148975, -3.297393, 1, 0.7019608, 0, 1,
-1.144437, -0.1892621, -2.150923, 1, 0.7098039, 0, 1,
-1.143553, -0.8413584, -1.821375, 1, 0.7137255, 0, 1,
-1.143458, 0.3577724, -0.04602147, 1, 0.7215686, 0, 1,
-1.142977, 1.143085, -1.231632, 1, 0.7254902, 0, 1,
-1.131141, 0.7845056, -0.8038567, 1, 0.7333333, 0, 1,
-1.123173, -0.4029846, -2.526056, 1, 0.7372549, 0, 1,
-1.119391, 0.2787437, -1.68806, 1, 0.7450981, 0, 1,
-1.118746, 0.212925, -1.91992, 1, 0.7490196, 0, 1,
-1.113162, -1.035441, -1.384384, 1, 0.7568628, 0, 1,
-1.112323, -0.4015474, -1.330079, 1, 0.7607843, 0, 1,
-1.110695, -1.020206, -2.424531, 1, 0.7686275, 0, 1,
-1.108761, -0.3419951, -1.803365, 1, 0.772549, 0, 1,
-1.105516, 0.361246, -2.73554, 1, 0.7803922, 0, 1,
-1.104893, -0.7022521, -0.5944144, 1, 0.7843137, 0, 1,
-1.098201, 1.228997, 2.310277, 1, 0.7921569, 0, 1,
-1.076767, 1.665377, 0.5294983, 1, 0.7960784, 0, 1,
-1.074863, -0.5494832, -1.055966, 1, 0.8039216, 0, 1,
-1.069169, -0.8547115, -0.03356067, 1, 0.8117647, 0, 1,
-1.063871, 0.8069518, -0.9333456, 1, 0.8156863, 0, 1,
-1.06111, 1.266955, -1.125255, 1, 0.8235294, 0, 1,
-1.059495, 0.5980566, 0.3212337, 1, 0.827451, 0, 1,
-1.029512, -0.4174792, -3.854284, 1, 0.8352941, 0, 1,
-1.028545, 0.3039953, 0.4813337, 1, 0.8392157, 0, 1,
-1.02741, -0.026859, -2.086646, 1, 0.8470588, 0, 1,
-1.020146, 0.01211976, -3.275244, 1, 0.8509804, 0, 1,
-1.017755, -1.664718, -2.12374, 1, 0.8588235, 0, 1,
-1.013338, 0.8737805, -0.1322197, 1, 0.8627451, 0, 1,
-1.013247, 1.326434, 0.8814839, 1, 0.8705882, 0, 1,
-1.010877, -0.8960809, -2.126727, 1, 0.8745098, 0, 1,
-1.005547, 1.140072, -1.155254, 1, 0.8823529, 0, 1,
-1.000524, -1.250028, -3.328767, 1, 0.8862745, 0, 1,
-0.9898996, -0.6743454, -3.471174, 1, 0.8941177, 0, 1,
-0.9893894, 1.145662, -0.8510838, 1, 0.8980392, 0, 1,
-0.9868963, -0.9141743, -2.079581, 1, 0.9058824, 0, 1,
-0.9863791, -0.7277575, -1.73812, 1, 0.9137255, 0, 1,
-0.9684816, 0.7758821, -0.8667275, 1, 0.9176471, 0, 1,
-0.9684578, 0.3032785, -1.719916, 1, 0.9254902, 0, 1,
-0.9628469, -0.493997, -2.586118, 1, 0.9294118, 0, 1,
-0.9553558, 0.9142448, -1.611875, 1, 0.9372549, 0, 1,
-0.9405872, 0.3687584, -0.3471771, 1, 0.9411765, 0, 1,
-0.9400917, 0.5143446, -0.9470018, 1, 0.9490196, 0, 1,
-0.9385743, -2.247287, -3.835749, 1, 0.9529412, 0, 1,
-0.9327879, 0.2454611, 0.02092021, 1, 0.9607843, 0, 1,
-0.9316881, -1.089659, -5.050048, 1, 0.9647059, 0, 1,
-0.9312358, 0.04072582, -1.725425, 1, 0.972549, 0, 1,
-0.927091, -1.116366, -2.204731, 1, 0.9764706, 0, 1,
-0.9227655, -0.9954326, -3.366097, 1, 0.9843137, 0, 1,
-0.9187372, 0.4709398, -1.483293, 1, 0.9882353, 0, 1,
-0.9122314, 0.4238134, -0.6388382, 1, 0.9960784, 0, 1,
-0.9100007, -1.05406, -3.523514, 0.9960784, 1, 0, 1,
-0.9078591, -1.668041, -2.154595, 0.9921569, 1, 0, 1,
-0.9075497, 0.3427832, 0.3962064, 0.9843137, 1, 0, 1,
-0.9072443, -1.332882, -3.023577, 0.9803922, 1, 0, 1,
-0.8992885, 0.6414706, -1.180669, 0.972549, 1, 0, 1,
-0.8953522, 0.871409, -2.977038, 0.9686275, 1, 0, 1,
-0.8918146, -1.465712, -2.201648, 0.9607843, 1, 0, 1,
-0.8911505, -1.802309, -2.92979, 0.9568627, 1, 0, 1,
-0.8857855, -0.5694064, -1.072574, 0.9490196, 1, 0, 1,
-0.8822289, -0.1179867, -2.240749, 0.945098, 1, 0, 1,
-0.8784923, 0.1832217, -0.2199473, 0.9372549, 1, 0, 1,
-0.8759706, 0.6530549, -2.670768, 0.9333333, 1, 0, 1,
-0.8707058, 0.2078892, -1.278023, 0.9254902, 1, 0, 1,
-0.8687886, -0.2806405, -2.574452, 0.9215686, 1, 0, 1,
-0.8668495, -0.2110079, -3.149799, 0.9137255, 1, 0, 1,
-0.8667076, -1.145071, -3.316394, 0.9098039, 1, 0, 1,
-0.8657502, -1.497772, -4.727154, 0.9019608, 1, 0, 1,
-0.8651267, -1.808972, -3.801043, 0.8941177, 1, 0, 1,
-0.8595079, 0.4972152, -1.934782, 0.8901961, 1, 0, 1,
-0.8500651, 1.061779, 0.006872717, 0.8823529, 1, 0, 1,
-0.8494914, 2.020548, -0.1180817, 0.8784314, 1, 0, 1,
-0.8445965, 0.8512471, -1.708013, 0.8705882, 1, 0, 1,
-0.8432447, -0.5833213, -1.979512, 0.8666667, 1, 0, 1,
-0.8429676, -0.6600493, -1.74254, 0.8588235, 1, 0, 1,
-0.8421022, -0.9907011, -1.86699, 0.854902, 1, 0, 1,
-0.8364984, -0.2815652, -3.382896, 0.8470588, 1, 0, 1,
-0.832572, -1.8108, -2.284764, 0.8431373, 1, 0, 1,
-0.8272113, -0.0276597, -2.769147, 0.8352941, 1, 0, 1,
-0.8217085, -0.07040984, -1.272452, 0.8313726, 1, 0, 1,
-0.8214598, 0.4687139, -0.7539091, 0.8235294, 1, 0, 1,
-0.8161568, -0.135125, -2.529875, 0.8196079, 1, 0, 1,
-0.8145107, -1.166413, -1.033265, 0.8117647, 1, 0, 1,
-0.8117075, 0.04354905, 1.048506, 0.8078431, 1, 0, 1,
-0.8098053, 0.5118294, -0.3736081, 0.8, 1, 0, 1,
-0.8086185, 1.843179, -0.7802123, 0.7921569, 1, 0, 1,
-0.8025772, -1.03763, -3.36944, 0.7882353, 1, 0, 1,
-0.802084, -0.8388801, -2.52072, 0.7803922, 1, 0, 1,
-0.796531, 0.8662641, 1.650983, 0.7764706, 1, 0, 1,
-0.7941636, -0.4147429, -1.387, 0.7686275, 1, 0, 1,
-0.7872811, 0.001406235, -1.264724, 0.7647059, 1, 0, 1,
-0.7797288, -1.220976, -1.601233, 0.7568628, 1, 0, 1,
-0.7764644, 1.132079, -1.461683, 0.7529412, 1, 0, 1,
-0.7756039, -0.1432406, -2.009624, 0.7450981, 1, 0, 1,
-0.7643151, 0.06885925, -1.919607, 0.7411765, 1, 0, 1,
-0.7612216, 2.179362, -1.197573, 0.7333333, 1, 0, 1,
-0.7604132, 0.1280055, -0.2413698, 0.7294118, 1, 0, 1,
-0.756283, 0.03857778, -2.250832, 0.7215686, 1, 0, 1,
-0.7468112, -0.08335162, 0.1084435, 0.7176471, 1, 0, 1,
-0.743333, 1.307305, -0.2143771, 0.7098039, 1, 0, 1,
-0.7427546, -1.220106, -1.616234, 0.7058824, 1, 0, 1,
-0.7406638, -0.4505805, -2.934544, 0.6980392, 1, 0, 1,
-0.7403761, 0.01961265, -2.20524, 0.6901961, 1, 0, 1,
-0.736047, 0.2923055, -1.447044, 0.6862745, 1, 0, 1,
-0.7329841, 0.8407416, -0.9181293, 0.6784314, 1, 0, 1,
-0.7294396, 0.136838, -2.4887, 0.6745098, 1, 0, 1,
-0.7218106, 0.4475023, -0.7253988, 0.6666667, 1, 0, 1,
-0.717441, 0.7741463, -0.08383451, 0.6627451, 1, 0, 1,
-0.7157608, -0.3058453, -1.67784, 0.654902, 1, 0, 1,
-0.7144494, -1.053181, -3.271317, 0.6509804, 1, 0, 1,
-0.7095942, 0.3301522, -1.762115, 0.6431373, 1, 0, 1,
-0.7094743, -1.352768, -1.53875, 0.6392157, 1, 0, 1,
-0.7082233, -0.4218642, -1.157384, 0.6313726, 1, 0, 1,
-0.704258, 0.5539948, -1.150884, 0.627451, 1, 0, 1,
-0.7041381, 1.667393, 1.166737, 0.6196079, 1, 0, 1,
-0.6986306, 0.7839379, -0.6531808, 0.6156863, 1, 0, 1,
-0.6960899, 1.213419, -0.2043311, 0.6078432, 1, 0, 1,
-0.6914852, 0.2029579, -2.510512, 0.6039216, 1, 0, 1,
-0.6868379, 0.712275, 0.1966624, 0.5960785, 1, 0, 1,
-0.6858243, 0.9050257, -2.64237, 0.5882353, 1, 0, 1,
-0.6829191, 0.8116828, 1.91829, 0.5843138, 1, 0, 1,
-0.6789731, -1.3714, -1.677414, 0.5764706, 1, 0, 1,
-0.6765522, 0.7103236, -1.334556, 0.572549, 1, 0, 1,
-0.6750595, -0.7253946, 0.6468698, 0.5647059, 1, 0, 1,
-0.6742581, 0.6458646, -0.5793712, 0.5607843, 1, 0, 1,
-0.6738165, 0.3500655, -0.6872309, 0.5529412, 1, 0, 1,
-0.6677603, -0.3399154, -3.137579, 0.5490196, 1, 0, 1,
-0.6669609, 1.687753, -0.236588, 0.5411765, 1, 0, 1,
-0.6657162, 0.2701578, -2.928519, 0.5372549, 1, 0, 1,
-0.6636422, -0.7715288, -3.000815, 0.5294118, 1, 0, 1,
-0.6579488, 0.2332271, 0.9441305, 0.5254902, 1, 0, 1,
-0.6463383, -0.5420904, -3.92872, 0.5176471, 1, 0, 1,
-0.6412509, -1.021755, -3.053219, 0.5137255, 1, 0, 1,
-0.6405419, 0.01134865, -1.568412, 0.5058824, 1, 0, 1,
-0.6398911, 0.03080482, -0.8615222, 0.5019608, 1, 0, 1,
-0.6378755, -0.388331, -1.969963, 0.4941176, 1, 0, 1,
-0.6350173, -0.7742965, -2.572153, 0.4862745, 1, 0, 1,
-0.634696, -2.680727, -0.8102116, 0.4823529, 1, 0, 1,
-0.6305257, 0.365543, -0.2252474, 0.4745098, 1, 0, 1,
-0.6234794, 1.583203, -1.571014, 0.4705882, 1, 0, 1,
-0.620046, -0.263327, -3.983391, 0.4627451, 1, 0, 1,
-0.6174614, -1.157118, -2.158468, 0.4588235, 1, 0, 1,
-0.6161755, 1.139392, -0.0326735, 0.4509804, 1, 0, 1,
-0.6151004, 1.456133, 0.4762833, 0.4470588, 1, 0, 1,
-0.6104332, 1.110315, 0.2835588, 0.4392157, 1, 0, 1,
-0.6021832, -0.2797204, -3.434475, 0.4352941, 1, 0, 1,
-0.5926174, 0.5763009, 0.6976552, 0.427451, 1, 0, 1,
-0.58968, -0.5801028, -2.442629, 0.4235294, 1, 0, 1,
-0.5873922, 0.4968737, -1.474756, 0.4156863, 1, 0, 1,
-0.5867996, -2.20412, -2.25644, 0.4117647, 1, 0, 1,
-0.5760095, -0.08544324, -4.73204, 0.4039216, 1, 0, 1,
-0.5723478, 1.220792, -0.4474348, 0.3960784, 1, 0, 1,
-0.5718358, -1.404107, -4.723857, 0.3921569, 1, 0, 1,
-0.5708464, -0.3304341, -2.377283, 0.3843137, 1, 0, 1,
-0.5706849, 1.230134, -0.3422635, 0.3803922, 1, 0, 1,
-0.5688823, -0.3638867, -2.746792, 0.372549, 1, 0, 1,
-0.5677657, 0.3394299, -0.4616593, 0.3686275, 1, 0, 1,
-0.566344, 0.4740713, -0.7911516, 0.3607843, 1, 0, 1,
-0.5645811, -1.014007, -1.958917, 0.3568628, 1, 0, 1,
-0.5643286, -0.4640298, -2.801771, 0.3490196, 1, 0, 1,
-0.5626276, 1.012675, -1.782468, 0.345098, 1, 0, 1,
-0.5601212, 0.4081162, -1.346074, 0.3372549, 1, 0, 1,
-0.5594745, -0.4912253, -2.620301, 0.3333333, 1, 0, 1,
-0.5483167, 0.7821046, -1.603789, 0.3254902, 1, 0, 1,
-0.5467443, 1.740752, 0.2354876, 0.3215686, 1, 0, 1,
-0.5330632, -1.083185, -4.142191, 0.3137255, 1, 0, 1,
-0.5327869, 0.2897678, -1.016255, 0.3098039, 1, 0, 1,
-0.5325198, 1.676445, -0.7574282, 0.3019608, 1, 0, 1,
-0.5271867, 0.9196277, -0.11665, 0.2941177, 1, 0, 1,
-0.5202825, 0.1083597, -1.215427, 0.2901961, 1, 0, 1,
-0.5202179, -0.3631331, -1.900624, 0.282353, 1, 0, 1,
-0.5191383, 0.1858563, -1.47219, 0.2784314, 1, 0, 1,
-0.5122741, -0.1717264, -3.597176, 0.2705882, 1, 0, 1,
-0.5083431, 0.183392, -2.167802, 0.2666667, 1, 0, 1,
-0.5062744, 2.223346, 0.03864006, 0.2588235, 1, 0, 1,
-0.5012267, -1.789092, -2.28307, 0.254902, 1, 0, 1,
-0.499106, -0.6440011, -1.774348, 0.2470588, 1, 0, 1,
-0.4956291, 3.50766, -0.03486903, 0.2431373, 1, 0, 1,
-0.4916423, -0.7767927, -4.30915, 0.2352941, 1, 0, 1,
-0.4835417, 1.205722, -0.8641607, 0.2313726, 1, 0, 1,
-0.4835338, 0.09671468, -0.42289, 0.2235294, 1, 0, 1,
-0.4816624, -0.5634377, -1.200501, 0.2196078, 1, 0, 1,
-0.4814474, -0.6274759, -2.514088, 0.2117647, 1, 0, 1,
-0.4805629, -1.389133, -3.744248, 0.2078431, 1, 0, 1,
-0.4795265, 0.6724227, 0.7649539, 0.2, 1, 0, 1,
-0.4780488, 0.2361955, -3.146525, 0.1921569, 1, 0, 1,
-0.4738778, -1.826782, -2.055358, 0.1882353, 1, 0, 1,
-0.472351, 1.232841, -0.9949763, 0.1803922, 1, 0, 1,
-0.4722332, -1.870135, -2.73208, 0.1764706, 1, 0, 1,
-0.4701811, -0.3712216, -1.22917, 0.1686275, 1, 0, 1,
-0.4656199, -0.3533685, -2.884514, 0.1647059, 1, 0, 1,
-0.4599899, 1.654378, -0.5111061, 0.1568628, 1, 0, 1,
-0.457376, 1.409272, 0.2629441, 0.1529412, 1, 0, 1,
-0.454306, 0.8306127, 1.646235, 0.145098, 1, 0, 1,
-0.4540349, 0.3668625, -0.2098737, 0.1411765, 1, 0, 1,
-0.4539916, -0.1167886, -0.9263585, 0.1333333, 1, 0, 1,
-0.4457477, -1.398648, -2.947153, 0.1294118, 1, 0, 1,
-0.4454396, -1.000336, -2.999205, 0.1215686, 1, 0, 1,
-0.4446213, -0.418692, -2.302907, 0.1176471, 1, 0, 1,
-0.4430292, -0.8739306, -2.687484, 0.1098039, 1, 0, 1,
-0.4428462, -0.1912813, -2.145633, 0.1058824, 1, 0, 1,
-0.442455, 0.988042, -1.909086, 0.09803922, 1, 0, 1,
-0.4354813, -0.1197396, -0.7670791, 0.09019608, 1, 0, 1,
-0.4350677, -1.027966, -4.552498, 0.08627451, 1, 0, 1,
-0.4279117, 0.6848003, 0.35653, 0.07843138, 1, 0, 1,
-0.4274638, 0.04731238, -0.3348045, 0.07450981, 1, 0, 1,
-0.4244309, -0.1029199, -3.228817, 0.06666667, 1, 0, 1,
-0.4177068, -0.5809208, -2.79655, 0.0627451, 1, 0, 1,
-0.4144338, -1.5752, -2.153524, 0.05490196, 1, 0, 1,
-0.4143382, 0.8814521, -0.7976252, 0.05098039, 1, 0, 1,
-0.4127191, 0.8858298, -1.260316, 0.04313726, 1, 0, 1,
-0.4093789, 0.7783217, 0.2036256, 0.03921569, 1, 0, 1,
-0.4066339, 0.3874151, -0.5450501, 0.03137255, 1, 0, 1,
-0.4059308, -0.3317058, -3.235516, 0.02745098, 1, 0, 1,
-0.4037391, -0.9526544, -2.324156, 0.01960784, 1, 0, 1,
-0.4010183, -1.447543, -2.856737, 0.01568628, 1, 0, 1,
-0.4010048, 0.5149522, -0.7156751, 0.007843138, 1, 0, 1,
-0.395898, 0.4776489, -2.083805, 0.003921569, 1, 0, 1,
-0.3947567, -0.526031, -2.042939, 0, 1, 0.003921569, 1,
-0.3939071, -0.6668797, -2.106225, 0, 1, 0.01176471, 1,
-0.3933952, 0.0009709509, -1.896998, 0, 1, 0.01568628, 1,
-0.3922526, 1.663778, -1.232473, 0, 1, 0.02352941, 1,
-0.3914476, 0.6290255, 1.355563, 0, 1, 0.02745098, 1,
-0.3853376, 0.9378267, 2.08334, 0, 1, 0.03529412, 1,
-0.3824187, -1.300994, -3.437632, 0, 1, 0.03921569, 1,
-0.381736, 0.3327268, -1.193668, 0, 1, 0.04705882, 1,
-0.3803655, 0.00672294, -1.249057, 0, 1, 0.05098039, 1,
-0.3792483, 0.4168886, -2.299658, 0, 1, 0.05882353, 1,
-0.371784, 1.189926, 0.5841637, 0, 1, 0.0627451, 1,
-0.3637418, -0.05542202, 0.3679258, 0, 1, 0.07058824, 1,
-0.3619812, 1.119782, -0.1442551, 0, 1, 0.07450981, 1,
-0.3606927, 0.3255783, -0.5265439, 0, 1, 0.08235294, 1,
-0.3590871, -1.9435, -2.158261, 0, 1, 0.08627451, 1,
-0.3575019, -0.2549735, -1.681136, 0, 1, 0.09411765, 1,
-0.3573316, -1.407296, -2.773227, 0, 1, 0.1019608, 1,
-0.3462845, -0.75309, -2.207855, 0, 1, 0.1058824, 1,
-0.337274, 1.441452, -1.403722, 0, 1, 0.1137255, 1,
-0.333434, 0.9547645, -0.6676645, 0, 1, 0.1176471, 1,
-0.3286301, -0.2393534, -3.19032, 0, 1, 0.1254902, 1,
-0.3246602, 0.9353079, -2.341075, 0, 1, 0.1294118, 1,
-0.3167954, 0.846706, -0.9804396, 0, 1, 0.1372549, 1,
-0.3152851, -1.104491, -2.489625, 0, 1, 0.1411765, 1,
-0.3147131, 0.9461632, -1.712007, 0, 1, 0.1490196, 1,
-0.312399, 2.867019, -0.1777345, 0, 1, 0.1529412, 1,
-0.3122965, -0.601186, -3.249694, 0, 1, 0.1607843, 1,
-0.311647, -0.9315279, -1.512017, 0, 1, 0.1647059, 1,
-0.3115743, 0.5813566, -0.6858005, 0, 1, 0.172549, 1,
-0.3112248, -0.4074167, -2.40598, 0, 1, 0.1764706, 1,
-0.3083798, -0.7604062, -2.779917, 0, 1, 0.1843137, 1,
-0.3076773, -0.2809124, -2.879935, 0, 1, 0.1882353, 1,
-0.3060445, -1.324467, -2.428436, 0, 1, 0.1960784, 1,
-0.3055379, -1.866403, -2.21738, 0, 1, 0.2039216, 1,
-0.3041521, -1.627576, -2.015339, 0, 1, 0.2078431, 1,
-0.3031422, -0.5198182, -1.507483, 0, 1, 0.2156863, 1,
-0.2983655, -0.8848507, -3.23104, 0, 1, 0.2196078, 1,
-0.29709, -0.1636559, -1.493348, 0, 1, 0.227451, 1,
-0.296995, 0.9208927, -0.550119, 0, 1, 0.2313726, 1,
-0.2963005, -0.2454997, -1.451164, 0, 1, 0.2392157, 1,
-0.2927423, 0.7308383, -3.286184, 0, 1, 0.2431373, 1,
-0.2918901, 1.068601, -4.264149, 0, 1, 0.2509804, 1,
-0.2918514, -0.1814286, 0.2142873, 0, 1, 0.254902, 1,
-0.2917694, 3.482457, -0.0571392, 0, 1, 0.2627451, 1,
-0.2875725, -0.9575953, -1.71374, 0, 1, 0.2666667, 1,
-0.2835508, -0.4655191, -3.604075, 0, 1, 0.2745098, 1,
-0.2821141, -0.3134531, -1.988074, 0, 1, 0.2784314, 1,
-0.281705, 0.9155937, -0.9986359, 0, 1, 0.2862745, 1,
-0.2783903, -1.403955, -3.022292, 0, 1, 0.2901961, 1,
-0.2740087, 1.232718, 1.235594, 0, 1, 0.2980392, 1,
-0.2732066, -0.7815298, -4.180882, 0, 1, 0.3058824, 1,
-0.2719548, -0.8644428, -3.405993, 0, 1, 0.3098039, 1,
-0.2677724, -0.7351173, -3.29318, 0, 1, 0.3176471, 1,
-0.267405, -0.5277031, -2.401209, 0, 1, 0.3215686, 1,
-0.2651094, -1.157551, -3.032189, 0, 1, 0.3294118, 1,
-0.2590595, 0.1883899, -1.681774, 0, 1, 0.3333333, 1,
-0.2571975, 0.7598476, 0.4750586, 0, 1, 0.3411765, 1,
-0.2560759, -0.9216276, -3.62264, 0, 1, 0.345098, 1,
-0.2538074, 2.188751, 1.781712, 0, 1, 0.3529412, 1,
-0.2470871, -0.2648032, -2.283526, 0, 1, 0.3568628, 1,
-0.2348092, -0.06426762, -3.090868, 0, 1, 0.3647059, 1,
-0.2327591, 0.2851192, 0.6316345, 0, 1, 0.3686275, 1,
-0.2316035, -0.9955431, -3.371472, 0, 1, 0.3764706, 1,
-0.2304881, -0.3326994, -2.725026, 0, 1, 0.3803922, 1,
-0.2298063, -0.1868484, -0.806242, 0, 1, 0.3882353, 1,
-0.2263492, -0.6766031, -1.122418, 0, 1, 0.3921569, 1,
-0.2205104, 0.6150684, -0.9027363, 0, 1, 0.4, 1,
-0.2197338, -0.3925633, -2.465141, 0, 1, 0.4078431, 1,
-0.2194103, -1.077523, -1.999386, 0, 1, 0.4117647, 1,
-0.2153636, -0.6642717, -2.365576, 0, 1, 0.4196078, 1,
-0.2149372, 1.163418, 0.4258583, 0, 1, 0.4235294, 1,
-0.2109367, 1.454681, -0.3105515, 0, 1, 0.4313726, 1,
-0.2103137, 0.4030508, -0.5542256, 0, 1, 0.4352941, 1,
-0.2102866, -1.108873, -0.7277215, 0, 1, 0.4431373, 1,
-0.2101078, -0.54969, -3.126779, 0, 1, 0.4470588, 1,
-0.2070725, 0.9614456, -0.202723, 0, 1, 0.454902, 1,
-0.2032933, 0.5689515, 0.5297554, 0, 1, 0.4588235, 1,
-0.1992998, 0.09225824, -2.934308, 0, 1, 0.4666667, 1,
-0.1992602, -1.284819, -3.585285, 0, 1, 0.4705882, 1,
-0.1983351, 0.7363684, 1.524815, 0, 1, 0.4784314, 1,
-0.1941868, 0.08063783, -1.261441, 0, 1, 0.4823529, 1,
-0.1789894, 0.2283727, -0.2939185, 0, 1, 0.4901961, 1,
-0.175339, -0.6685902, -3.359582, 0, 1, 0.4941176, 1,
-0.1707163, -0.726006, -2.219994, 0, 1, 0.5019608, 1,
-0.1668509, -1.702741, -2.818072, 0, 1, 0.509804, 1,
-0.1617324, 0.128165, -2.030351, 0, 1, 0.5137255, 1,
-0.1616834, -1.292143, -2.423199, 0, 1, 0.5215687, 1,
-0.1608019, -0.5748029, -2.412442, 0, 1, 0.5254902, 1,
-0.1596597, 0.2114244, -2.971543, 0, 1, 0.5333334, 1,
-0.1580975, 0.3576972, 2.170297, 0, 1, 0.5372549, 1,
-0.1561294, 0.5976122, -0.5411029, 0, 1, 0.5450981, 1,
-0.1551387, 0.1719883, -0.2712775, 0, 1, 0.5490196, 1,
-0.1545449, -0.956518, -0.9316224, 0, 1, 0.5568628, 1,
-0.1534773, 3.011591, -1.685777, 0, 1, 0.5607843, 1,
-0.1530225, -1.002538, -3.368142, 0, 1, 0.5686275, 1,
-0.151478, 0.4892328, 0.03689826, 0, 1, 0.572549, 1,
-0.1463994, 0.2590747, -1.653653, 0, 1, 0.5803922, 1,
-0.1433207, 0.9766784, 1.136059, 0, 1, 0.5843138, 1,
-0.1416037, 3.314773, 1.133001, 0, 1, 0.5921569, 1,
-0.1404814, -0.2065116, -1.491717, 0, 1, 0.5960785, 1,
-0.1282576, 0.3303882, -0.4450178, 0, 1, 0.6039216, 1,
-0.1245558, 0.3682424, -0.2293815, 0, 1, 0.6117647, 1,
-0.1209917, -0.98097, -4.070019, 0, 1, 0.6156863, 1,
-0.1188132, -0.6714971, -2.142142, 0, 1, 0.6235294, 1,
-0.1173779, 0.2837644, -0.4916829, 0, 1, 0.627451, 1,
-0.1169724, 0.582502, 0.2222277, 0, 1, 0.6352941, 1,
-0.1139895, 0.9491186, 0.7013342, 0, 1, 0.6392157, 1,
-0.113768, 0.5142668, 0.2790475, 0, 1, 0.6470588, 1,
-0.1065581, 0.7409453, 0.9720775, 0, 1, 0.6509804, 1,
-0.1065544, 0.3525539, -0.445539, 0, 1, 0.6588235, 1,
-0.1054134, 1.416264, -0.2344294, 0, 1, 0.6627451, 1,
-0.104435, -0.08659419, -1.297728, 0, 1, 0.6705883, 1,
-0.1028878, 0.1768283, -0.4407856, 0, 1, 0.6745098, 1,
-0.1025704, -0.2444697, -1.951875, 0, 1, 0.682353, 1,
-0.09969056, 0.9105728, -0.9153548, 0, 1, 0.6862745, 1,
-0.0923759, -0.1566842, -1.471946, 0, 1, 0.6941177, 1,
-0.09216814, -1.324098, -2.405707, 0, 1, 0.7019608, 1,
-0.08752383, 0.9853464, -0.5203806, 0, 1, 0.7058824, 1,
-0.08576774, -1.107459, -3.274313, 0, 1, 0.7137255, 1,
-0.08541811, -0.93199, -3.696618, 0, 1, 0.7176471, 1,
-0.08476402, -1.169651, -3.796867, 0, 1, 0.7254902, 1,
-0.082063, 0.001699237, -0.9979862, 0, 1, 0.7294118, 1,
-0.08036291, -0.8512679, -3.271917, 0, 1, 0.7372549, 1,
-0.07548527, -0.9841619, -0.01220275, 0, 1, 0.7411765, 1,
-0.07540572, 1.644192, 0.2447793, 0, 1, 0.7490196, 1,
-0.07181975, -1.088354, -3.591059, 0, 1, 0.7529412, 1,
-0.06534173, -0.2201269, -2.378457, 0, 1, 0.7607843, 1,
-0.06218541, 1.054296, -0.6585222, 0, 1, 0.7647059, 1,
-0.05122188, -0.4129168, -6.337335, 0, 1, 0.772549, 1,
-0.04978774, -0.5228602, -4.284692, 0, 1, 0.7764706, 1,
-0.04408689, 1.42147, 0.2377852, 0, 1, 0.7843137, 1,
-0.03556853, 1.182698, 0.5893463, 0, 1, 0.7882353, 1,
-0.0334061, -0.484783, -1.536135, 0, 1, 0.7960784, 1,
-0.03209336, -1.898577, -0.8964623, 0, 1, 0.8039216, 1,
-0.03195285, -0.9989607, -2.641321, 0, 1, 0.8078431, 1,
-0.02827384, -0.6504111, -2.226171, 0, 1, 0.8156863, 1,
-0.02769534, 0.7786656, 1.647676, 0, 1, 0.8196079, 1,
-0.02646783, -0.2374598, -3.414267, 0, 1, 0.827451, 1,
-0.02476555, -0.1382018, -3.090802, 0, 1, 0.8313726, 1,
-0.02349013, 0.5567537, -0.9367455, 0, 1, 0.8392157, 1,
-0.02328221, 1.02358, -0.6351103, 0, 1, 0.8431373, 1,
-0.01866722, -0.7900063, -2.459796, 0, 1, 0.8509804, 1,
-0.01692874, 1.355865, 0.4789819, 0, 1, 0.854902, 1,
-0.01602449, -0.06507584, -3.664233, 0, 1, 0.8627451, 1,
-0.01406161, -0.8599588, -1.56474, 0, 1, 0.8666667, 1,
-0.01400881, 0.3753149, 1.205214, 0, 1, 0.8745098, 1,
-0.01058612, 1.053447, -0.2258473, 0, 1, 0.8784314, 1,
-0.009881367, -0.9985376, -1.436996, 0, 1, 0.8862745, 1,
-0.008648437, -0.6910995, -5.309906, 0, 1, 0.8901961, 1,
-0.008411554, -0.4504199, -3.088537, 0, 1, 0.8980392, 1,
-0.007248641, -1.730516, -3.358741, 0, 1, 0.9058824, 1,
-0.001203641, 0.5603316, 0.5151803, 0, 1, 0.9098039, 1,
0.003083207, 0.7431145, 0.05769278, 0, 1, 0.9176471, 1,
0.003823638, 2.132235, 0.8349957, 0, 1, 0.9215686, 1,
0.007420931, 1.298942, 0.08432399, 0, 1, 0.9294118, 1,
0.007954726, -1.773156, 1.007735, 0, 1, 0.9333333, 1,
0.009682916, 0.3480182, -1.141562, 0, 1, 0.9411765, 1,
0.01325546, -0.3770784, 1.83618, 0, 1, 0.945098, 1,
0.0136846, 0.7981726, 0.1035237, 0, 1, 0.9529412, 1,
0.01590362, -0.1076916, 3.348403, 0, 1, 0.9568627, 1,
0.01636939, -1.040303, 3.027063, 0, 1, 0.9647059, 1,
0.01689524, 0.3239381, 1.291698, 0, 1, 0.9686275, 1,
0.0183434, -1.231355, 2.935461, 0, 1, 0.9764706, 1,
0.01886628, -0.5841064, 2.524103, 0, 1, 0.9803922, 1,
0.02067239, -0.9036379, 2.462535, 0, 1, 0.9882353, 1,
0.02410645, -0.5293766, 4.34257, 0, 1, 0.9921569, 1,
0.02441633, 1.042992, 0.4925494, 0, 1, 1, 1,
0.026574, -0.1855208, 3.571434, 0, 0.9921569, 1, 1,
0.02719545, 2.148146, -0.5318592, 0, 0.9882353, 1, 1,
0.02899835, 0.40218, 1.067343, 0, 0.9803922, 1, 1,
0.0337896, 0.7766212, -1.018893, 0, 0.9764706, 1, 1,
0.03551908, 1.487825, 1.465842, 0, 0.9686275, 1, 1,
0.03617157, 1.07952, 1.48198, 0, 0.9647059, 1, 1,
0.03744301, -0.9596238, 2.865154, 0, 0.9568627, 1, 1,
0.03795892, -0.536345, 3.457675, 0, 0.9529412, 1, 1,
0.03820258, 1.165601, -0.371804, 0, 0.945098, 1, 1,
0.03832865, -0.4917116, 2.53296, 0, 0.9411765, 1, 1,
0.03885506, 0.9564913, 1.265942, 0, 0.9333333, 1, 1,
0.03963226, 0.9617279, 0.6134699, 0, 0.9294118, 1, 1,
0.04348009, 0.5029468, 0.9573582, 0, 0.9215686, 1, 1,
0.04403904, -1.703218, 3.724087, 0, 0.9176471, 1, 1,
0.04734288, -0.5464233, 4.988688, 0, 0.9098039, 1, 1,
0.04886693, -1.6026, 2.032198, 0, 0.9058824, 1, 1,
0.05216772, 0.2240651, 0.5407141, 0, 0.8980392, 1, 1,
0.05386175, 0.864369, 0.4836461, 0, 0.8901961, 1, 1,
0.05477316, 0.9654963, 2.055102, 0, 0.8862745, 1, 1,
0.05616214, -0.9269748, 2.077648, 0, 0.8784314, 1, 1,
0.05917248, 0.1377942, -0.4497513, 0, 0.8745098, 1, 1,
0.06117854, 1.064942, -1.49849, 0, 0.8666667, 1, 1,
0.06574149, 0.1941042, -1.532984, 0, 0.8627451, 1, 1,
0.07020211, -0.7081341, 3.60156, 0, 0.854902, 1, 1,
0.07041429, -1.466547, 4.263085, 0, 0.8509804, 1, 1,
0.07067086, 0.3066557, 1.585896, 0, 0.8431373, 1, 1,
0.07199836, -1.031563, 5.243136, 0, 0.8392157, 1, 1,
0.07384227, 0.8990058, 0.3002936, 0, 0.8313726, 1, 1,
0.07792527, 1.044738, 0.623838, 0, 0.827451, 1, 1,
0.07827798, -0.2350459, 4.39445, 0, 0.8196079, 1, 1,
0.0785256, 0.04478011, 2.343263, 0, 0.8156863, 1, 1,
0.08409855, 0.8071236, -0.5747101, 0, 0.8078431, 1, 1,
0.08448438, 1.085684, -0.4589629, 0, 0.8039216, 1, 1,
0.08449338, 1.140616, -1.11556, 0, 0.7960784, 1, 1,
0.09174992, 0.0823223, 2.555632, 0, 0.7882353, 1, 1,
0.09497258, -0.5838032, 4.052338, 0, 0.7843137, 1, 1,
0.09604523, 0.3781897, -0.6593931, 0, 0.7764706, 1, 1,
0.09750798, -0.8576219, 2.918287, 0, 0.772549, 1, 1,
0.09823482, -0.2054796, 2.371217, 0, 0.7647059, 1, 1,
0.09829662, 0.6501766, -0.8341661, 0, 0.7607843, 1, 1,
0.100342, 1.34593, -0.286308, 0, 0.7529412, 1, 1,
0.1036269, -1.119814, 3.819106, 0, 0.7490196, 1, 1,
0.1038356, 1.081936, 0.03674152, 0, 0.7411765, 1, 1,
0.1081999, -0.4219462, 2.272991, 0, 0.7372549, 1, 1,
0.108967, 0.2641143, 0.2963943, 0, 0.7294118, 1, 1,
0.1129603, -0.5311832, 4.12319, 0, 0.7254902, 1, 1,
0.1154794, 0.1010483, 1.155596, 0, 0.7176471, 1, 1,
0.1166051, -1.61041, 3.108701, 0, 0.7137255, 1, 1,
0.1169457, 0.7625988, -0.1735242, 0, 0.7058824, 1, 1,
0.1173597, -0.2229268, 1.77612, 0, 0.6980392, 1, 1,
0.1186634, -0.3122613, 3.264143, 0, 0.6941177, 1, 1,
0.1194893, -0.1984609, 1.107626, 0, 0.6862745, 1, 1,
0.1216697, -0.1189766, 2.250692, 0, 0.682353, 1, 1,
0.1217248, -1.64687, 2.215596, 0, 0.6745098, 1, 1,
0.1243437, 1.295578, 1.017917, 0, 0.6705883, 1, 1,
0.1301069, -0.00564148, 1.871759, 0, 0.6627451, 1, 1,
0.131256, 0.06575868, 2.406919, 0, 0.6588235, 1, 1,
0.1319011, -1.10253, 2.714594, 0, 0.6509804, 1, 1,
0.1330496, 0.1395825, -0.424414, 0, 0.6470588, 1, 1,
0.1370289, 2.841946, -1.283737, 0, 0.6392157, 1, 1,
0.1374527, -0.7310662, 3.312834, 0, 0.6352941, 1, 1,
0.1405108, 0.02023051, 2.245736, 0, 0.627451, 1, 1,
0.1412941, -0.1889511, 3.250546, 0, 0.6235294, 1, 1,
0.1425233, -0.652916, 1.918639, 0, 0.6156863, 1, 1,
0.151309, 0.703309, 2.770217, 0, 0.6117647, 1, 1,
0.160339, -0.7027032, 1.943382, 0, 0.6039216, 1, 1,
0.1634863, 1.115189, -0.1609427, 0, 0.5960785, 1, 1,
0.1634928, -0.3934553, 3.606133, 0, 0.5921569, 1, 1,
0.165083, 2.255057, -0.672507, 0, 0.5843138, 1, 1,
0.1710744, 1.119681, 0.0950485, 0, 0.5803922, 1, 1,
0.1714509, -0.3681729, 3.540474, 0, 0.572549, 1, 1,
0.177272, 0.6987213, -0.4556661, 0, 0.5686275, 1, 1,
0.1790993, -0.6658985, 4.483442, 0, 0.5607843, 1, 1,
0.1807221, 2.472255, 0.6871747, 0, 0.5568628, 1, 1,
0.1819632, 0.5599058, 2.138177, 0, 0.5490196, 1, 1,
0.1838913, -0.7209716, 1.662252, 0, 0.5450981, 1, 1,
0.1846516, -0.05386676, 2.462637, 0, 0.5372549, 1, 1,
0.1851722, -1.724845, 4.457721, 0, 0.5333334, 1, 1,
0.1902651, 0.6703508, 0.4241359, 0, 0.5254902, 1, 1,
0.1904944, -1.312778, 2.374757, 0, 0.5215687, 1, 1,
0.1987653, -0.3819275, 3.447076, 0, 0.5137255, 1, 1,
0.1999177, -0.4174366, 2.460459, 0, 0.509804, 1, 1,
0.1999694, -0.2577025, 1.316256, 0, 0.5019608, 1, 1,
0.2007981, -0.4767332, 3.068872, 0, 0.4941176, 1, 1,
0.2016323, -0.3064814, 1.831872, 0, 0.4901961, 1, 1,
0.21257, -2.755564, 3.485982, 0, 0.4823529, 1, 1,
0.213364, -0.480379, 1.746686, 0, 0.4784314, 1, 1,
0.213915, 0.3368472, -0.9815775, 0, 0.4705882, 1, 1,
0.2157807, -0.9106491, 3.539484, 0, 0.4666667, 1, 1,
0.2233026, 0.4820933, -0.5907107, 0, 0.4588235, 1, 1,
0.2262654, 1.763478, -0.1891829, 0, 0.454902, 1, 1,
0.237029, 0.8164799, -0.0989771, 0, 0.4470588, 1, 1,
0.2426859, 2.106726, -0.1388251, 0, 0.4431373, 1, 1,
0.2475472, 1.130076, 0.2875703, 0, 0.4352941, 1, 1,
0.2490723, -0.1970389, 1.474037, 0, 0.4313726, 1, 1,
0.2515838, -1.801312, 3.596036, 0, 0.4235294, 1, 1,
0.2553639, -1.746644, 3.345788, 0, 0.4196078, 1, 1,
0.2565767, -1.591076, 3.231897, 0, 0.4117647, 1, 1,
0.2598283, 0.1470463, 0.8647918, 0, 0.4078431, 1, 1,
0.2600513, 0.009971255, 1.632813, 0, 0.4, 1, 1,
0.2629674, 1.199245, -0.2170701, 0, 0.3921569, 1, 1,
0.267106, -1.045113, 3.678604, 0, 0.3882353, 1, 1,
0.2701826, -0.006947421, 2.043552, 0, 0.3803922, 1, 1,
0.274111, -1.125383, 2.811995, 0, 0.3764706, 1, 1,
0.2775111, -0.285592, 3.401798, 0, 0.3686275, 1, 1,
0.2789308, -0.4036227, 4.430022, 0, 0.3647059, 1, 1,
0.2873617, -0.2141185, 2.684192, 0, 0.3568628, 1, 1,
0.2900878, 0.3312688, 1.591433, 0, 0.3529412, 1, 1,
0.2901551, 0.9184435, 1.074095, 0, 0.345098, 1, 1,
0.290265, -0.2845884, 5.467456, 0, 0.3411765, 1, 1,
0.2905715, 1.404661, 0.4353426, 0, 0.3333333, 1, 1,
0.2907288, -2.274493, 3.334965, 0, 0.3294118, 1, 1,
0.2914661, 0.5920699, -1.032023, 0, 0.3215686, 1, 1,
0.2922766, -1.038947, 3.007015, 0, 0.3176471, 1, 1,
0.293645, -0.5229861, 4.03535, 0, 0.3098039, 1, 1,
0.2949609, -0.7171416, 2.552258, 0, 0.3058824, 1, 1,
0.2957313, 1.765613, -0.3977614, 0, 0.2980392, 1, 1,
0.2972901, 0.397287, 1.558481, 0, 0.2901961, 1, 1,
0.2976399, 0.673179, 1.070488, 0, 0.2862745, 1, 1,
0.3006123, -0.8748741, 5.528407, 0, 0.2784314, 1, 1,
0.3006266, 1.222416, -0.7703965, 0, 0.2745098, 1, 1,
0.3025967, 0.2755671, 1.340653, 0, 0.2666667, 1, 1,
0.3030284, -0.9940712, 1.48852, 0, 0.2627451, 1, 1,
0.307533, 1.288605, -0.2426329, 0, 0.254902, 1, 1,
0.3102728, 0.9283767, 2.208512, 0, 0.2509804, 1, 1,
0.3126442, -0.4226427, 4.02544, 0, 0.2431373, 1, 1,
0.3132267, -0.84172, 2.041799, 0, 0.2392157, 1, 1,
0.320683, 1.404343, -0.9328552, 0, 0.2313726, 1, 1,
0.3228365, 1.294833, 0.646001, 0, 0.227451, 1, 1,
0.3231317, 1.314021, 0.6841171, 0, 0.2196078, 1, 1,
0.3239462, -0.6024193, 3.618244, 0, 0.2156863, 1, 1,
0.3252291, -2.200495, 3.122405, 0, 0.2078431, 1, 1,
0.3317497, 0.8464818, 1.712791, 0, 0.2039216, 1, 1,
0.3327127, 2.204357, 0.2210368, 0, 0.1960784, 1, 1,
0.3344333, -0.1323563, 1.625511, 0, 0.1882353, 1, 1,
0.3374487, -0.07867387, 1.106088, 0, 0.1843137, 1, 1,
0.3391582, -0.6302485, 1.831916, 0, 0.1764706, 1, 1,
0.3430421, -0.7007403, 3.331209, 0, 0.172549, 1, 1,
0.3462106, 2.646927, -0.09594865, 0, 0.1647059, 1, 1,
0.3475332, -1.987115, 4.296329, 0, 0.1607843, 1, 1,
0.348214, 0.5963728, 2.034965, 0, 0.1529412, 1, 1,
0.3494319, -2.273638, 3.368517, 0, 0.1490196, 1, 1,
0.3514598, -1.142448, 2.304394, 0, 0.1411765, 1, 1,
0.3539376, -0.3887958, 3.355242, 0, 0.1372549, 1, 1,
0.3572945, -0.1858919, 2.792707, 0, 0.1294118, 1, 1,
0.3594764, 0.9110076, 0.1315077, 0, 0.1254902, 1, 1,
0.3597162, 0.1556684, -0.4184379, 0, 0.1176471, 1, 1,
0.3615463, -1.046865, 0.656152, 0, 0.1137255, 1, 1,
0.3648412, -0.5003171, 1.468182, 0, 0.1058824, 1, 1,
0.3658728, -0.822668, 2.911753, 0, 0.09803922, 1, 1,
0.3710879, 0.4121362, -0.02386651, 0, 0.09411765, 1, 1,
0.3721433, 0.2624377, 1.070369, 0, 0.08627451, 1, 1,
0.3751197, 1.415941, -1.087261, 0, 0.08235294, 1, 1,
0.3756631, -0.6708966, 3.426002, 0, 0.07450981, 1, 1,
0.376966, 0.043382, 0.436804, 0, 0.07058824, 1, 1,
0.3783762, -0.8602476, 2.947573, 0, 0.0627451, 1, 1,
0.3794589, 0.6771107, -1.808345, 0, 0.05882353, 1, 1,
0.3799892, 0.2056104, 0.3021826, 0, 0.05098039, 1, 1,
0.3815213, 0.5734963, 0.3476346, 0, 0.04705882, 1, 1,
0.3825532, -0.2258752, 2.924655, 0, 0.03921569, 1, 1,
0.3835675, -0.9540766, 4.067996, 0, 0.03529412, 1, 1,
0.3847219, -0.6859402, 3.31038, 0, 0.02745098, 1, 1,
0.3864931, 0.9413248, 0.816677, 0, 0.02352941, 1, 1,
0.3870786, -0.4511334, 3.990174, 0, 0.01568628, 1, 1,
0.3880514, 0.2854757, -0.402206, 0, 0.01176471, 1, 1,
0.3934672, 0.7214256, 1.349852, 0, 0.003921569, 1, 1,
0.3973238, -0.6988704, 2.07232, 0.003921569, 0, 1, 1,
0.3975565, 0.8966053, -0.2676648, 0.007843138, 0, 1, 1,
0.4022828, -0.6831912, 4.472042, 0.01568628, 0, 1, 1,
0.4027479, -1.286048, 1.822298, 0.01960784, 0, 1, 1,
0.4032303, -2.083698, 3.849501, 0.02745098, 0, 1, 1,
0.4042996, -1.054275, 2.04556, 0.03137255, 0, 1, 1,
0.4130925, 1.098516, 1.667325, 0.03921569, 0, 1, 1,
0.4187221, -0.6179336, 2.07352, 0.04313726, 0, 1, 1,
0.4231373, -0.2762098, 2.673906, 0.05098039, 0, 1, 1,
0.4298281, 0.2534316, -0.6533262, 0.05490196, 0, 1, 1,
0.4323467, -0.759232, 3.319776, 0.0627451, 0, 1, 1,
0.4333054, -0.1891073, 1.190518, 0.06666667, 0, 1, 1,
0.4350416, -0.6883733, 3.643835, 0.07450981, 0, 1, 1,
0.4365688, 0.1782776, 1.775294, 0.07843138, 0, 1, 1,
0.4385935, 0.3897451, 3.254839, 0.08627451, 0, 1, 1,
0.4420207, 0.02896768, 1.639066, 0.09019608, 0, 1, 1,
0.4471722, 0.439803, 0.2093283, 0.09803922, 0, 1, 1,
0.4486334, -0.4978661, 2.876012, 0.1058824, 0, 1, 1,
0.4492691, -1.236114, 2.146024, 0.1098039, 0, 1, 1,
0.4587419, -0.696234, 2.754311, 0.1176471, 0, 1, 1,
0.4661874, 1.06314, -0.6244411, 0.1215686, 0, 1, 1,
0.4680511, -1.85439, 2.713399, 0.1294118, 0, 1, 1,
0.4693238, -1.115245, 2.495487, 0.1333333, 0, 1, 1,
0.4718008, 0.4109202, -0.1161966, 0.1411765, 0, 1, 1,
0.4738562, -0.5911474, 2.243982, 0.145098, 0, 1, 1,
0.4751724, -0.00564089, 2.375342, 0.1529412, 0, 1, 1,
0.4752628, 0.2754657, 0.6070604, 0.1568628, 0, 1, 1,
0.4784117, 0.8220896, 1.121745, 0.1647059, 0, 1, 1,
0.4792809, 0.5774712, 1.970784, 0.1686275, 0, 1, 1,
0.4811585, -0.799167, 2.289442, 0.1764706, 0, 1, 1,
0.4837667, -0.9743084, 2.578605, 0.1803922, 0, 1, 1,
0.4939696, -1.265917, 2.380215, 0.1882353, 0, 1, 1,
0.5004581, -1.486782, 4.145025, 0.1921569, 0, 1, 1,
0.5027232, -1.403613, 3.584171, 0.2, 0, 1, 1,
0.5043465, 1.366584, 0.9412786, 0.2078431, 0, 1, 1,
0.5053077, 0.1199038, 0.2280353, 0.2117647, 0, 1, 1,
0.5059964, 0.2632997, 1.434604, 0.2196078, 0, 1, 1,
0.5078524, 0.7154318, 0.9084566, 0.2235294, 0, 1, 1,
0.5088536, 0.37502, 1.056015, 0.2313726, 0, 1, 1,
0.5109891, 1.769159, -1.902932, 0.2352941, 0, 1, 1,
0.5130355, 0.7734495, 0.05586903, 0.2431373, 0, 1, 1,
0.5172442, 1.138241, 1.041592, 0.2470588, 0, 1, 1,
0.517961, -0.3036085, 2.416361, 0.254902, 0, 1, 1,
0.5201958, 0.204262, 1.647602, 0.2588235, 0, 1, 1,
0.5229235, 0.8499692, 0.02397591, 0.2666667, 0, 1, 1,
0.5229425, -0.8352145, 1.534215, 0.2705882, 0, 1, 1,
0.524168, -1.36801, 2.355348, 0.2784314, 0, 1, 1,
0.5264265, -1.965496, 2.759864, 0.282353, 0, 1, 1,
0.5316314, -1.143532, 4.341519, 0.2901961, 0, 1, 1,
0.53841, -0.7614296, 1.374771, 0.2941177, 0, 1, 1,
0.5406736, -0.07558632, 0.4331947, 0.3019608, 0, 1, 1,
0.5437884, -1.590832, 3.559876, 0.3098039, 0, 1, 1,
0.5447401, -0.2389657, 2.619316, 0.3137255, 0, 1, 1,
0.5553311, -0.02497417, 1.15655, 0.3215686, 0, 1, 1,
0.5558443, -2.07133, 1.605953, 0.3254902, 0, 1, 1,
0.5636377, 0.5282325, 0.8786536, 0.3333333, 0, 1, 1,
0.5652401, -0.4189422, 2.012703, 0.3372549, 0, 1, 1,
0.5676732, -1.448374, 3.267835, 0.345098, 0, 1, 1,
0.581524, -0.3040958, 2.61059, 0.3490196, 0, 1, 1,
0.5855154, -1.800299, 1.844372, 0.3568628, 0, 1, 1,
0.5860567, -1.878239, 2.925797, 0.3607843, 0, 1, 1,
0.5863862, -0.7252111, 3.115311, 0.3686275, 0, 1, 1,
0.5864092, -1.324753, 3.315921, 0.372549, 0, 1, 1,
0.5944037, 0.1503571, 0.094952, 0.3803922, 0, 1, 1,
0.5980967, -0.351909, 2.85942, 0.3843137, 0, 1, 1,
0.5999758, -1.610862, 2.392319, 0.3921569, 0, 1, 1,
0.6026482, 0.03529788, 3.163752, 0.3960784, 0, 1, 1,
0.6034972, 1.826536, 0.9840186, 0.4039216, 0, 1, 1,
0.605458, -2.620732, 2.690744, 0.4117647, 0, 1, 1,
0.6149732, -1.607902, 3.087302, 0.4156863, 0, 1, 1,
0.6151204, 1.000178, -0.4268315, 0.4235294, 0, 1, 1,
0.6227693, -0.005985657, 1.900504, 0.427451, 0, 1, 1,
0.6276342, 0.3704076, -1.604667, 0.4352941, 0, 1, 1,
0.6309112, 1.062558, 0.07996546, 0.4392157, 0, 1, 1,
0.6316329, -1.031123, 1.559183, 0.4470588, 0, 1, 1,
0.6383, -1.515089, 0.941793, 0.4509804, 0, 1, 1,
0.641224, -0.08849831, 2.736836, 0.4588235, 0, 1, 1,
0.6484949, 2.213474, -0.4959963, 0.4627451, 0, 1, 1,
0.6506681, -1.121035, 0.8140293, 0.4705882, 0, 1, 1,
0.6510838, -0.1857925, 1.351977, 0.4745098, 0, 1, 1,
0.6511202, -1.080716, 2.748456, 0.4823529, 0, 1, 1,
0.6533014, -0.3741169, 2.633619, 0.4862745, 0, 1, 1,
0.6558591, 0.9154492, 0.354143, 0.4941176, 0, 1, 1,
0.6592547, 1.748425, -1.05696, 0.5019608, 0, 1, 1,
0.6592613, 0.5799196, 2.468503, 0.5058824, 0, 1, 1,
0.667602, -0.9692634, 2.625574, 0.5137255, 0, 1, 1,
0.6678849, -0.3902085, 2.651799, 0.5176471, 0, 1, 1,
0.669197, 1.372377, 1.94814, 0.5254902, 0, 1, 1,
0.677356, 0.303868, 1.336642, 0.5294118, 0, 1, 1,
0.6779, -0.4457105, 2.498584, 0.5372549, 0, 1, 1,
0.6794709, 0.117573, 0.4660752, 0.5411765, 0, 1, 1,
0.6840543, -0.9681455, 2.605372, 0.5490196, 0, 1, 1,
0.6917682, 1.766924, 0.3226629, 0.5529412, 0, 1, 1,
0.6920349, -2.123486, 2.768502, 0.5607843, 0, 1, 1,
0.6925713, -0.08722983, 1.899322, 0.5647059, 0, 1, 1,
0.6928786, -0.2908135, 1.316563, 0.572549, 0, 1, 1,
0.6952219, 0.4281467, -0.2122485, 0.5764706, 0, 1, 1,
0.695241, 1.238925, 2.002145, 0.5843138, 0, 1, 1,
0.6960073, -0.1164813, 1.943812, 0.5882353, 0, 1, 1,
0.6963058, 0.04893039, 1.810917, 0.5960785, 0, 1, 1,
0.6967981, -0.1881745, 1.3397, 0.6039216, 0, 1, 1,
0.7009008, -0.3342934, 1.296436, 0.6078432, 0, 1, 1,
0.7052143, 1.711876, -1.094551, 0.6156863, 0, 1, 1,
0.7058343, 0.7932559, 1.989088, 0.6196079, 0, 1, 1,
0.7068775, -0.2472219, 3.458693, 0.627451, 0, 1, 1,
0.7070211, -1.862194, 4.734068, 0.6313726, 0, 1, 1,
0.7075069, 0.06013835, 1.271348, 0.6392157, 0, 1, 1,
0.7102921, -1.583617, 0.6449939, 0.6431373, 0, 1, 1,
0.715792, 1.690982, 0.3007775, 0.6509804, 0, 1, 1,
0.7192618, -1.749986, 2.815747, 0.654902, 0, 1, 1,
0.7218757, 1.749889, 1.486401, 0.6627451, 0, 1, 1,
0.7243847, -0.07087606, 1.136253, 0.6666667, 0, 1, 1,
0.7273281, -0.2275126, 1.465698, 0.6745098, 0, 1, 1,
0.7282244, -1.080638, 2.95304, 0.6784314, 0, 1, 1,
0.7293805, -0.2462621, 0.8440286, 0.6862745, 0, 1, 1,
0.7298008, 0.7199962, 2.374221, 0.6901961, 0, 1, 1,
0.7302746, 0.9637951, -0.2989371, 0.6980392, 0, 1, 1,
0.7414942, -1.20774, 3.757907, 0.7058824, 0, 1, 1,
0.7423902, 0.8521613, 0.5121051, 0.7098039, 0, 1, 1,
0.7429233, 1.09181, 2.283161, 0.7176471, 0, 1, 1,
0.744844, -1.876418, 3.77103, 0.7215686, 0, 1, 1,
0.7452039, 1.370592, 0.1829513, 0.7294118, 0, 1, 1,
0.747088, -0.144761, 0.5302011, 0.7333333, 0, 1, 1,
0.7477547, -0.8698257, 2.642548, 0.7411765, 0, 1, 1,
0.7512705, -1.331621, 1.530336, 0.7450981, 0, 1, 1,
0.7513772, 0.9001704, -1.699045, 0.7529412, 0, 1, 1,
0.7527838, 0.3070412, 0.8512941, 0.7568628, 0, 1, 1,
0.7557722, -0.1301681, 1.49236, 0.7647059, 0, 1, 1,
0.7589127, -1.320458, 4.837832, 0.7686275, 0, 1, 1,
0.7598898, -0.008067906, 0.1033574, 0.7764706, 0, 1, 1,
0.7600871, -0.06382536, 0.7116764, 0.7803922, 0, 1, 1,
0.7606136, 0.322803, 1.681409, 0.7882353, 0, 1, 1,
0.7624929, 1.943741, 0.3236255, 0.7921569, 0, 1, 1,
0.7666476, -1.42797, 1.177692, 0.8, 0, 1, 1,
0.7766544, -0.3918665, 2.729598, 0.8078431, 0, 1, 1,
0.7824941, -0.6323484, 1.733324, 0.8117647, 0, 1, 1,
0.7843451, -1.05757, 1.546185, 0.8196079, 0, 1, 1,
0.8013613, 0.2471005, 0.6859049, 0.8235294, 0, 1, 1,
0.8101771, -0.1865556, 2.001182, 0.8313726, 0, 1, 1,
0.8104172, -0.04976054, 1.187994, 0.8352941, 0, 1, 1,
0.8135374, 0.5018133, 1.034715, 0.8431373, 0, 1, 1,
0.8211602, -0.3640871, 1.973053, 0.8470588, 0, 1, 1,
0.8323461, 0.521888, 0.6181632, 0.854902, 0, 1, 1,
0.8430309, 0.3524092, 1.545636, 0.8588235, 0, 1, 1,
0.8464513, 0.5786324, 1.42282, 0.8666667, 0, 1, 1,
0.856837, -0.2196461, 3.320674, 0.8705882, 0, 1, 1,
0.863427, 0.4079952, 0.5783255, 0.8784314, 0, 1, 1,
0.8644681, -0.653495, 2.955504, 0.8823529, 0, 1, 1,
0.8656919, -0.2230092, 0.9877319, 0.8901961, 0, 1, 1,
0.8667904, 1.091439, 0.2685693, 0.8941177, 0, 1, 1,
0.8692856, -0.3120069, 3.830721, 0.9019608, 0, 1, 1,
0.8695326, -2.198052, 3.351437, 0.9098039, 0, 1, 1,
0.8755457, -2.099195, 2.556496, 0.9137255, 0, 1, 1,
0.8767812, 1.03188, 0.6147238, 0.9215686, 0, 1, 1,
0.878971, 0.5403569, 1.6103, 0.9254902, 0, 1, 1,
0.8800259, -1.53087, 1.09513, 0.9333333, 0, 1, 1,
0.8802427, 0.4758533, 1.20568, 0.9372549, 0, 1, 1,
0.8825226, 0.9033429, 2.115581, 0.945098, 0, 1, 1,
0.8850955, -2.061157, 3.221411, 0.9490196, 0, 1, 1,
0.8924487, -1.082247, 0.5294026, 0.9568627, 0, 1, 1,
0.8925428, 0.692057, 1.405162, 0.9607843, 0, 1, 1,
0.8942249, 1.560301, -0.4178371, 0.9686275, 0, 1, 1,
0.8949101, 0.4393, 0.997116, 0.972549, 0, 1, 1,
0.8954024, 0.6534518, 3.246422, 0.9803922, 0, 1, 1,
0.901944, 1.586199, 0.2742346, 0.9843137, 0, 1, 1,
0.9036177, 0.1038728, 0.2762896, 0.9921569, 0, 1, 1,
0.9211245, 0.936659, -0.07334822, 0.9960784, 0, 1, 1,
0.9223229, 0.4435924, 0.1309507, 1, 0, 0.9960784, 1,
0.922827, 0.5228945, 0.7566293, 1, 0, 0.9882353, 1,
0.9270757, -0.6795371, 2.508924, 1, 0, 0.9843137, 1,
0.9477754, -0.3987626, 0.6930571, 1, 0, 0.9764706, 1,
0.9515569, -0.327835, -0.202513, 1, 0, 0.972549, 1,
0.9527844, 0.5448959, 0.6855358, 1, 0, 0.9647059, 1,
0.9538739, 1.088148, 0.3487501, 1, 0, 0.9607843, 1,
0.9544289, 1.025512, 1.275112, 1, 0, 0.9529412, 1,
0.9581881, -0.16805, 1.183486, 1, 0, 0.9490196, 1,
0.9651308, 1.268167, -0.2410371, 1, 0, 0.9411765, 1,
0.9702936, -1.536233, 2.561449, 1, 0, 0.9372549, 1,
0.9777818, 0.4457649, 1.860915, 1, 0, 0.9294118, 1,
0.9802063, -0.8469479, 1.386038, 1, 0, 0.9254902, 1,
0.9907781, -0.3592176, 3.65509, 1, 0, 0.9176471, 1,
0.9939331, -1.327188, 3.061596, 1, 0, 0.9137255, 1,
0.9961613, -0.1136453, 3.007304, 1, 0, 0.9058824, 1,
1.019781, -1.509539, 3.422679, 1, 0, 0.9019608, 1,
1.022563, -0.2177639, 2.872382, 1, 0, 0.8941177, 1,
1.030703, -0.05981647, 0.8923975, 1, 0, 0.8862745, 1,
1.03257, 0.6795691, 0.4752604, 1, 0, 0.8823529, 1,
1.032949, -2.240542, 3.190804, 1, 0, 0.8745098, 1,
1.033741, -0.384792, 1.14662, 1, 0, 0.8705882, 1,
1.038474, -0.1870804, 2.564246, 1, 0, 0.8627451, 1,
1.040532, -0.4590211, 3.011194, 1, 0, 0.8588235, 1,
1.045554, 2.702729, -0.8028551, 1, 0, 0.8509804, 1,
1.061258, -1.810935, 2.490917, 1, 0, 0.8470588, 1,
1.063933, -1.452443, 0.4746169, 1, 0, 0.8392157, 1,
1.069028, -1.95035, 1.605716, 1, 0, 0.8352941, 1,
1.076975, -1.523954, 3.867524, 1, 0, 0.827451, 1,
1.077009, -0.2809618, 0.8257973, 1, 0, 0.8235294, 1,
1.078979, 0.2002679, 1.146967, 1, 0, 0.8156863, 1,
1.085056, -0.4389631, 2.737014, 1, 0, 0.8117647, 1,
1.088091, 0.5102798, -0.3848318, 1, 0, 0.8039216, 1,
1.088973, 0.2822, 1.312645, 1, 0, 0.7960784, 1,
1.093098, 0.5849676, 1.271823, 1, 0, 0.7921569, 1,
1.100256, -0.6372738, 2.171748, 1, 0, 0.7843137, 1,
1.103769, -0.3720527, 2.737152, 1, 0, 0.7803922, 1,
1.11836, 0.07628109, 1.468968, 1, 0, 0.772549, 1,
1.130437, -0.1567952, 1.960259, 1, 0, 0.7686275, 1,
1.131217, 0.6274925, 0.8727267, 1, 0, 0.7607843, 1,
1.139646, 0.704004, 1.058298, 1, 0, 0.7568628, 1,
1.14311, 0.2370796, 0.7903568, 1, 0, 0.7490196, 1,
1.143891, 0.4596327, 3.14791, 1, 0, 0.7450981, 1,
1.14447, -0.004165069, 3.837388, 1, 0, 0.7372549, 1,
1.148636, -0.3695473, 1.927889, 1, 0, 0.7333333, 1,
1.154929, -1.19149, 2.245643, 1, 0, 0.7254902, 1,
1.159635, -1.170977, 1.690068, 1, 0, 0.7215686, 1,
1.197598, -1.539418, 2.780495, 1, 0, 0.7137255, 1,
1.199916, 1.640982, -0.7998693, 1, 0, 0.7098039, 1,
1.20242, -1.882004, 2.668791, 1, 0, 0.7019608, 1,
1.204259, -1.387584, 3.669458, 1, 0, 0.6941177, 1,
1.209017, -0.6434228, 1.395178, 1, 0, 0.6901961, 1,
1.217769, -0.4070787, 2.141107, 1, 0, 0.682353, 1,
1.226148, 0.6905423, 0.6703359, 1, 0, 0.6784314, 1,
1.249833, 0.3744128, 1.163636, 1, 0, 0.6705883, 1,
1.249896, -0.1895097, 1.600905, 1, 0, 0.6666667, 1,
1.250889, -0.596852, 1.420575, 1, 0, 0.6588235, 1,
1.260959, -0.5370867, 0.956906, 1, 0, 0.654902, 1,
1.262161, -1.425514, 4.649587, 1, 0, 0.6470588, 1,
1.26789, 0.219158, 1.539895, 1, 0, 0.6431373, 1,
1.273066, 0.5219629, 0.2492801, 1, 0, 0.6352941, 1,
1.274586, -1.489658, 3.103666, 1, 0, 0.6313726, 1,
1.281314, -1.299173, 2.080322, 1, 0, 0.6235294, 1,
1.284307, -1.163039, 3.020708, 1, 0, 0.6196079, 1,
1.301485, 0.8864269, 2.546611, 1, 0, 0.6117647, 1,
1.303162, 0.08829556, 1.046427, 1, 0, 0.6078432, 1,
1.303587, -1.521954, 1.899767, 1, 0, 0.6, 1,
1.306533, -0.3486986, 2.618015, 1, 0, 0.5921569, 1,
1.309727, -1.055397, 2.461616, 1, 0, 0.5882353, 1,
1.311896, -1.55425, 0.4852692, 1, 0, 0.5803922, 1,
1.314591, -1.028382, 0.4495919, 1, 0, 0.5764706, 1,
1.314832, -0.3927569, 1.864579, 1, 0, 0.5686275, 1,
1.323036, 2.258579, 1.281861, 1, 0, 0.5647059, 1,
1.324292, 1.149063, -0.06967169, 1, 0, 0.5568628, 1,
1.32795, -0.6880103, 1.796496, 1, 0, 0.5529412, 1,
1.354311, 0.1305022, 0.4238131, 1, 0, 0.5450981, 1,
1.354729, -0.7116473, 1.320635, 1, 0, 0.5411765, 1,
1.361963, -0.6855112, 1.019722, 1, 0, 0.5333334, 1,
1.370066, 1.698666, 2.61586, 1, 0, 0.5294118, 1,
1.372161, 0.7948378, 0.8079587, 1, 0, 0.5215687, 1,
1.376966, -0.5925368, 1.449306, 1, 0, 0.5176471, 1,
1.380991, 0.5315574, 1.6281, 1, 0, 0.509804, 1,
1.392452, -1.116545, 0.8272256, 1, 0, 0.5058824, 1,
1.393601, -1.087331, 1.465073, 1, 0, 0.4980392, 1,
1.394383, -1.312935, 2.049104, 1, 0, 0.4901961, 1,
1.39902, -0.7212005, 1.774782, 1, 0, 0.4862745, 1,
1.406765, -0.3101082, 1.239511, 1, 0, 0.4784314, 1,
1.422051, 1.401405, 0.4432913, 1, 0, 0.4745098, 1,
1.429403, -0.4250926, 0.9413173, 1, 0, 0.4666667, 1,
1.435117, -0.209111, 1.091122, 1, 0, 0.4627451, 1,
1.436824, 0.5801954, 0.9394109, 1, 0, 0.454902, 1,
1.446457, 1.475179, 3.165055, 1, 0, 0.4509804, 1,
1.45614, -2.057173, 3.895571, 1, 0, 0.4431373, 1,
1.461923, -0.3725214, 2.631986, 1, 0, 0.4392157, 1,
1.480369, 0.490075, 0.04356373, 1, 0, 0.4313726, 1,
1.491487, -1.984547, 1.986245, 1, 0, 0.427451, 1,
1.499273, -0.1412223, 2.700082, 1, 0, 0.4196078, 1,
1.520933, 1.028551, 3.147802, 1, 0, 0.4156863, 1,
1.521716, -2.127753, 0.7102231, 1, 0, 0.4078431, 1,
1.539476, -2.664708, 2.929238, 1, 0, 0.4039216, 1,
1.546777, 0.611399, -0.8267611, 1, 0, 0.3960784, 1,
1.548362, 0.5323245, -1.048371, 1, 0, 0.3882353, 1,
1.548463, -0.8637097, 1.753163, 1, 0, 0.3843137, 1,
1.549295, 1.946649, 0.1108118, 1, 0, 0.3764706, 1,
1.550833, -0.4541942, 0.5649971, 1, 0, 0.372549, 1,
1.588615, 0.8293038, 1.858532, 1, 0, 0.3647059, 1,
1.592937, 0.7312794, 2.828512, 1, 0, 0.3607843, 1,
1.595278, -0.8266571, 3.16562, 1, 0, 0.3529412, 1,
1.598111, 1.926141, 1.09063, 1, 0, 0.3490196, 1,
1.612315, 1.104293, 1.717488, 1, 0, 0.3411765, 1,
1.613734, 0.2893453, 0.1685561, 1, 0, 0.3372549, 1,
1.618801, -0.4260742, 2.724433, 1, 0, 0.3294118, 1,
1.61923, 0.1476602, 1.99814, 1, 0, 0.3254902, 1,
1.620372, 1.433107, 1.114676, 1, 0, 0.3176471, 1,
1.627466, 0.4868617, 1.218545, 1, 0, 0.3137255, 1,
1.658112, 0.4776799, 0.4089871, 1, 0, 0.3058824, 1,
1.668391, -2.298743, 1.631068, 1, 0, 0.2980392, 1,
1.674859, -0.08990896, 1.047074, 1, 0, 0.2941177, 1,
1.685713, -0.9244998, 2.933427, 1, 0, 0.2862745, 1,
1.718807, -0.3335043, 2.073843, 1, 0, 0.282353, 1,
1.721433, 1.023155, 2.192373, 1, 0, 0.2745098, 1,
1.728725, 0.8153439, 1.399983, 1, 0, 0.2705882, 1,
1.735905, -0.4315286, 1.499335, 1, 0, 0.2627451, 1,
1.745643, 0.2045787, 0.5865417, 1, 0, 0.2588235, 1,
1.748752, 1.544804, -0.9932416, 1, 0, 0.2509804, 1,
1.751747, 0.2421012, 1.108873, 1, 0, 0.2470588, 1,
1.768171, 0.0416895, 1.010935, 1, 0, 0.2392157, 1,
1.773893, -0.3645161, 0.2586707, 1, 0, 0.2352941, 1,
1.778925, -0.4545809, 1.385177, 1, 0, 0.227451, 1,
1.796893, -1.079718, 1.719383, 1, 0, 0.2235294, 1,
1.802275, -0.9574932, 2.196484, 1, 0, 0.2156863, 1,
1.815091, 0.1742103, 4.01222, 1, 0, 0.2117647, 1,
1.850383, -1.559707, 3.322367, 1, 0, 0.2039216, 1,
1.855688, -0.2022513, 1.974411, 1, 0, 0.1960784, 1,
1.865003, -1.740323, 2.493059, 1, 0, 0.1921569, 1,
1.866917, 1.123064, -0.438157, 1, 0, 0.1843137, 1,
1.891565, -1.133848, 1.353019, 1, 0, 0.1803922, 1,
1.893278, -0.7237257, 1.250081, 1, 0, 0.172549, 1,
1.91297, 0.4920168, 2.084503, 1, 0, 0.1686275, 1,
1.94418, -1.171727, 1.351847, 1, 0, 0.1607843, 1,
2.030771, 0.06908645, 2.078804, 1, 0, 0.1568628, 1,
2.031447, 0.8934649, 1.503501, 1, 0, 0.1490196, 1,
2.032576, -0.6467814, 3.305564, 1, 0, 0.145098, 1,
2.042419, -1.328314, 3.004303, 1, 0, 0.1372549, 1,
2.110358, 0.6080149, 0.654143, 1, 0, 0.1333333, 1,
2.11778, 0.2043594, 2.228919, 1, 0, 0.1254902, 1,
2.132758, 1.021376, 2.062791, 1, 0, 0.1215686, 1,
2.136693, -0.1457437, 0.03160472, 1, 0, 0.1137255, 1,
2.143773, -0.2439569, 1.474671, 1, 0, 0.1098039, 1,
2.16861, 0.9501801, 1.58099, 1, 0, 0.1019608, 1,
2.178797, -1.953595, 0.8953568, 1, 0, 0.09411765, 1,
2.21234, 0.3782074, -0.4029834, 1, 0, 0.09019608, 1,
2.297576, 0.4019109, 3.078752, 1, 0, 0.08235294, 1,
2.306393, 0.5255615, 0.001475149, 1, 0, 0.07843138, 1,
2.307337, 0.7590544, 1.485914, 1, 0, 0.07058824, 1,
2.356392, 1.025028, -0.2524014, 1, 0, 0.06666667, 1,
2.430672, 0.8326007, 0.9710574, 1, 0, 0.05882353, 1,
2.431984, 1.501707, 2.651981, 1, 0, 0.05490196, 1,
2.444666, 0.7281015, 2.148445, 1, 0, 0.04705882, 1,
2.493993, -0.6314662, 0.2321453, 1, 0, 0.04313726, 1,
2.589286, 0.6823589, 2.57186, 1, 0, 0.03529412, 1,
2.628207, 0.4459634, 0.8149236, 1, 0, 0.03137255, 1,
2.657435, -0.4111212, 1.677768, 1, 0, 0.02352941, 1,
2.672816, 1.039069, 1.392362, 1, 0, 0.01960784, 1,
2.90342, 1.740863, 1.27781, 1, 0, 0.01176471, 1,
3.044815, 0.2250168, 1.293215, 1, 0, 0.007843138, 1
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
-0.06613302, -3.81718, -8.348578, 0, -0.5, 0.5, 0.5,
-0.06613302, -3.81718, -8.348578, 1, -0.5, 0.5, 0.5,
-0.06613302, -3.81718, -8.348578, 1, 1.5, 0.5, 0.5,
-0.06613302, -3.81718, -8.348578, 0, 1.5, 0.5, 0.5
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
-4.231693, 0.376048, -8.348578, 0, -0.5, 0.5, 0.5,
-4.231693, 0.376048, -8.348578, 1, -0.5, 0.5, 0.5,
-4.231693, 0.376048, -8.348578, 1, 1.5, 0.5, 0.5,
-4.231693, 0.376048, -8.348578, 0, 1.5, 0.5, 0.5
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
-4.231693, -3.81718, -0.404464, 0, -0.5, 0.5, 0.5,
-4.231693, -3.81718, -0.404464, 1, -0.5, 0.5, 0.5,
-4.231693, -3.81718, -0.404464, 1, 1.5, 0.5, 0.5,
-4.231693, -3.81718, -0.404464, 0, 1.5, 0.5, 0.5
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
-3, -2.849512, -6.515321,
3, -2.849512, -6.515321,
-3, -2.849512, -6.515321,
-3, -3.01079, -6.820864,
-2, -2.849512, -6.515321,
-2, -3.01079, -6.820864,
-1, -2.849512, -6.515321,
-1, -3.01079, -6.820864,
0, -2.849512, -6.515321,
0, -3.01079, -6.820864,
1, -2.849512, -6.515321,
1, -3.01079, -6.820864,
2, -2.849512, -6.515321,
2, -3.01079, -6.820864,
3, -2.849512, -6.515321,
3, -3.01079, -6.820864
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
-3, -3.333346, -7.43195, 0, -0.5, 0.5, 0.5,
-3, -3.333346, -7.43195, 1, -0.5, 0.5, 0.5,
-3, -3.333346, -7.43195, 1, 1.5, 0.5, 0.5,
-3, -3.333346, -7.43195, 0, 1.5, 0.5, 0.5,
-2, -3.333346, -7.43195, 0, -0.5, 0.5, 0.5,
-2, -3.333346, -7.43195, 1, -0.5, 0.5, 0.5,
-2, -3.333346, -7.43195, 1, 1.5, 0.5, 0.5,
-2, -3.333346, -7.43195, 0, 1.5, 0.5, 0.5,
-1, -3.333346, -7.43195, 0, -0.5, 0.5, 0.5,
-1, -3.333346, -7.43195, 1, -0.5, 0.5, 0.5,
-1, -3.333346, -7.43195, 1, 1.5, 0.5, 0.5,
-1, -3.333346, -7.43195, 0, 1.5, 0.5, 0.5,
0, -3.333346, -7.43195, 0, -0.5, 0.5, 0.5,
0, -3.333346, -7.43195, 1, -0.5, 0.5, 0.5,
0, -3.333346, -7.43195, 1, 1.5, 0.5, 0.5,
0, -3.333346, -7.43195, 0, 1.5, 0.5, 0.5,
1, -3.333346, -7.43195, 0, -0.5, 0.5, 0.5,
1, -3.333346, -7.43195, 1, -0.5, 0.5, 0.5,
1, -3.333346, -7.43195, 1, 1.5, 0.5, 0.5,
1, -3.333346, -7.43195, 0, 1.5, 0.5, 0.5,
2, -3.333346, -7.43195, 0, -0.5, 0.5, 0.5,
2, -3.333346, -7.43195, 1, -0.5, 0.5, 0.5,
2, -3.333346, -7.43195, 1, 1.5, 0.5, 0.5,
2, -3.333346, -7.43195, 0, 1.5, 0.5, 0.5,
3, -3.333346, -7.43195, 0, -0.5, 0.5, 0.5,
3, -3.333346, -7.43195, 1, -0.5, 0.5, 0.5,
3, -3.333346, -7.43195, 1, 1.5, 0.5, 0.5,
3, -3.333346, -7.43195, 0, 1.5, 0.5, 0.5
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
-3.27041, -2, -6.515321,
-3.27041, 3, -6.515321,
-3.27041, -2, -6.515321,
-3.430624, -2, -6.820864,
-3.27041, -1, -6.515321,
-3.430624, -1, -6.820864,
-3.27041, 0, -6.515321,
-3.430624, 0, -6.820864,
-3.27041, 1, -6.515321,
-3.430624, 1, -6.820864,
-3.27041, 2, -6.515321,
-3.430624, 2, -6.820864,
-3.27041, 3, -6.515321,
-3.430624, 3, -6.820864
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
-3.751051, -2, -7.43195, 0, -0.5, 0.5, 0.5,
-3.751051, -2, -7.43195, 1, -0.5, 0.5, 0.5,
-3.751051, -2, -7.43195, 1, 1.5, 0.5, 0.5,
-3.751051, -2, -7.43195, 0, 1.5, 0.5, 0.5,
-3.751051, -1, -7.43195, 0, -0.5, 0.5, 0.5,
-3.751051, -1, -7.43195, 1, -0.5, 0.5, 0.5,
-3.751051, -1, -7.43195, 1, 1.5, 0.5, 0.5,
-3.751051, -1, -7.43195, 0, 1.5, 0.5, 0.5,
-3.751051, 0, -7.43195, 0, -0.5, 0.5, 0.5,
-3.751051, 0, -7.43195, 1, -0.5, 0.5, 0.5,
-3.751051, 0, -7.43195, 1, 1.5, 0.5, 0.5,
-3.751051, 0, -7.43195, 0, 1.5, 0.5, 0.5,
-3.751051, 1, -7.43195, 0, -0.5, 0.5, 0.5,
-3.751051, 1, -7.43195, 1, -0.5, 0.5, 0.5,
-3.751051, 1, -7.43195, 1, 1.5, 0.5, 0.5,
-3.751051, 1, -7.43195, 0, 1.5, 0.5, 0.5,
-3.751051, 2, -7.43195, 0, -0.5, 0.5, 0.5,
-3.751051, 2, -7.43195, 1, -0.5, 0.5, 0.5,
-3.751051, 2, -7.43195, 1, 1.5, 0.5, 0.5,
-3.751051, 2, -7.43195, 0, 1.5, 0.5, 0.5,
-3.751051, 3, -7.43195, 0, -0.5, 0.5, 0.5,
-3.751051, 3, -7.43195, 1, -0.5, 0.5, 0.5,
-3.751051, 3, -7.43195, 1, 1.5, 0.5, 0.5,
-3.751051, 3, -7.43195, 0, 1.5, 0.5, 0.5
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
-3.27041, -2.849512, -6,
-3.27041, -2.849512, 4,
-3.27041, -2.849512, -6,
-3.430624, -3.01079, -6,
-3.27041, -2.849512, -4,
-3.430624, -3.01079, -4,
-3.27041, -2.849512, -2,
-3.430624, -3.01079, -2,
-3.27041, -2.849512, 0,
-3.430624, -3.01079, 0,
-3.27041, -2.849512, 2,
-3.430624, -3.01079, 2,
-3.27041, -2.849512, 4,
-3.430624, -3.01079, 4
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
-3.751051, -3.333346, -6, 0, -0.5, 0.5, 0.5,
-3.751051, -3.333346, -6, 1, -0.5, 0.5, 0.5,
-3.751051, -3.333346, -6, 1, 1.5, 0.5, 0.5,
-3.751051, -3.333346, -6, 0, 1.5, 0.5, 0.5,
-3.751051, -3.333346, -4, 0, -0.5, 0.5, 0.5,
-3.751051, -3.333346, -4, 1, -0.5, 0.5, 0.5,
-3.751051, -3.333346, -4, 1, 1.5, 0.5, 0.5,
-3.751051, -3.333346, -4, 0, 1.5, 0.5, 0.5,
-3.751051, -3.333346, -2, 0, -0.5, 0.5, 0.5,
-3.751051, -3.333346, -2, 1, -0.5, 0.5, 0.5,
-3.751051, -3.333346, -2, 1, 1.5, 0.5, 0.5,
-3.751051, -3.333346, -2, 0, 1.5, 0.5, 0.5,
-3.751051, -3.333346, 0, 0, -0.5, 0.5, 0.5,
-3.751051, -3.333346, 0, 1, -0.5, 0.5, 0.5,
-3.751051, -3.333346, 0, 1, 1.5, 0.5, 0.5,
-3.751051, -3.333346, 0, 0, 1.5, 0.5, 0.5,
-3.751051, -3.333346, 2, 0, -0.5, 0.5, 0.5,
-3.751051, -3.333346, 2, 1, -0.5, 0.5, 0.5,
-3.751051, -3.333346, 2, 1, 1.5, 0.5, 0.5,
-3.751051, -3.333346, 2, 0, 1.5, 0.5, 0.5,
-3.751051, -3.333346, 4, 0, -0.5, 0.5, 0.5,
-3.751051, -3.333346, 4, 1, -0.5, 0.5, 0.5,
-3.751051, -3.333346, 4, 1, 1.5, 0.5, 0.5,
-3.751051, -3.333346, 4, 0, 1.5, 0.5, 0.5
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
-3.27041, -2.849512, -6.515321,
-3.27041, 3.601608, -6.515321,
-3.27041, -2.849512, 5.706393,
-3.27041, 3.601608, 5.706393,
-3.27041, -2.849512, -6.515321,
-3.27041, -2.849512, 5.706393,
-3.27041, 3.601608, -6.515321,
-3.27041, 3.601608, 5.706393,
-3.27041, -2.849512, -6.515321,
3.138144, -2.849512, -6.515321,
-3.27041, -2.849512, 5.706393,
3.138144, -2.849512, 5.706393,
-3.27041, 3.601608, -6.515321,
3.138144, 3.601608, -6.515321,
-3.27041, 3.601608, 5.706393,
3.138144, 3.601608, 5.706393,
3.138144, -2.849512, -6.515321,
3.138144, 3.601608, -6.515321,
3.138144, -2.849512, 5.706393,
3.138144, 3.601608, 5.706393,
3.138144, -2.849512, -6.515321,
3.138144, -2.849512, 5.706393,
3.138144, 3.601608, -6.515321,
3.138144, 3.601608, 5.706393
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
var radius = 8.134346;
var distance = 36.19062;
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
mvMatrix.translate( 0.06613302, -0.376048, 0.404464 );
mvMatrix.scale( 1.372387, 1.363331, 0.719622 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.19062);
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
tetradifon<-read.table("tetradifon.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tetradifon$V2
```

```
## Error in eval(expr, envir, enclos): object 'tetradifon' not found
```

```r
y<-tetradifon$V3
```

```
## Error in eval(expr, envir, enclos): object 'tetradifon' not found
```

```r
z<-tetradifon$V4
```

```
## Error in eval(expr, envir, enclos): object 'tetradifon' not found
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
-3.177081, -0.710412, -0.4687732, 0, 0, 1, 1, 1,
-2.711224, 0.2839706, -2.763811, 1, 0, 0, 1, 1,
-2.651713, 2.591982, -1.760833, 1, 0, 0, 1, 1,
-2.42996, -1.03908, -1.953613, 1, 0, 0, 1, 1,
-2.404155, -0.07287444, -0.9038988, 1, 0, 0, 1, 1,
-2.370711, -0.1940249, -2.748364, 1, 0, 0, 1, 1,
-2.356595, -0.3270601, -2.553534, 0, 0, 0, 1, 1,
-2.336952, -2.476615, -3.134152, 0, 0, 0, 1, 1,
-2.148139, 0.04862382, -0.3921698, 0, 0, 0, 1, 1,
-2.125408, 0.7116709, -1.80931, 0, 0, 0, 1, 1,
-2.091785, -0.07077413, -2.949416, 0, 0, 0, 1, 1,
-2.084166, 0.6461308, -0.6609645, 0, 0, 0, 1, 1,
-2.058948, 0.9381196, -0.668076, 0, 0, 0, 1, 1,
-2.031528, 0.2086807, -2.433962, 1, 1, 1, 1, 1,
-2.021736, -0.7679447, -1.528648, 1, 1, 1, 1, 1,
-2.002926, -1.804054, -2.47677, 1, 1, 1, 1, 1,
-1.999326, 0.7249975, -0.08623851, 1, 1, 1, 1, 1,
-1.998448, -0.6406822, -1.999486, 1, 1, 1, 1, 1,
-1.995427, 0.1111047, -0.5759931, 1, 1, 1, 1, 1,
-1.987243, 0.8680175, -2.006013, 1, 1, 1, 1, 1,
-1.976841, -0.1357623, -1.078501, 1, 1, 1, 1, 1,
-1.974887, 0.1215478, -1.669232, 1, 1, 1, 1, 1,
-1.946118, -2.503013, -1.09554, 1, 1, 1, 1, 1,
-1.936025, 0.6522848, -0.6821049, 1, 1, 1, 1, 1,
-1.872485, -0.2268003, -0.174109, 1, 1, 1, 1, 1,
-1.867865, -0.3678941, -2.887878, 1, 1, 1, 1, 1,
-1.849639, -0.3607844, -2.121016, 1, 1, 1, 1, 1,
-1.836457, 0.4684656, -0.9177201, 1, 1, 1, 1, 1,
-1.822541, -0.8540819, -2.843415, 0, 0, 1, 1, 1,
-1.804899, 1.17368, -0.06224817, 1, 0, 0, 1, 1,
-1.802261, 1.372142, 0.2863699, 1, 0, 0, 1, 1,
-1.800463, 0.5967923, -0.6515941, 1, 0, 0, 1, 1,
-1.795778, -2.260759, 0.003827937, 1, 0, 0, 1, 1,
-1.766417, 0.8144743, 0.319164, 1, 0, 0, 1, 1,
-1.759777, 0.1858094, -1.438594, 0, 0, 0, 1, 1,
-1.720796, -0.1830876, -2.744971, 0, 0, 0, 1, 1,
-1.720047, 0.6410704, -1.498224, 0, 0, 0, 1, 1,
-1.717603, -1.541085, -1.593012, 0, 0, 0, 1, 1,
-1.713436, -0.1630278, -0.9593036, 0, 0, 0, 1, 1,
-1.711313, -1.333977, -2.525894, 0, 0, 0, 1, 1,
-1.694317, -0.6994626, -2.589331, 0, 0, 0, 1, 1,
-1.687419, -1.568755, -2.261481, 1, 1, 1, 1, 1,
-1.685024, -0.190536, -2.047105, 1, 1, 1, 1, 1,
-1.667186, 1.644799, -0.1462293, 1, 1, 1, 1, 1,
-1.650695, -0.06450519, -2.320378, 1, 1, 1, 1, 1,
-1.638176, 0.8942615, 0.01382388, 1, 1, 1, 1, 1,
-1.622247, -0.9899818, -0.8503773, 1, 1, 1, 1, 1,
-1.584622, -0.04531579, -1.359426, 1, 1, 1, 1, 1,
-1.581079, -0.4306355, 0.00307784, 1, 1, 1, 1, 1,
-1.577156, -0.8751805, -1.505235, 1, 1, 1, 1, 1,
-1.571246, -1.864716, -3.144918, 1, 1, 1, 1, 1,
-1.565074, -1.539976, -1.170624, 1, 1, 1, 1, 1,
-1.556409, -0.1248419, -2.624405, 1, 1, 1, 1, 1,
-1.546913, 1.177607, 0.2655872, 1, 1, 1, 1, 1,
-1.539549, 0.9081138, -2.049212, 1, 1, 1, 1, 1,
-1.534303, 0.3009229, -0.6449189, 1, 1, 1, 1, 1,
-1.52998, -0.5484445, -0.80134, 0, 0, 1, 1, 1,
-1.528556, 1.594689, -3.217429, 1, 0, 0, 1, 1,
-1.519081, -0.1967926, -2.664158, 1, 0, 0, 1, 1,
-1.516608, 0.3280215, -1.860405, 1, 0, 0, 1, 1,
-1.514325, -0.1042998, -2.548676, 1, 0, 0, 1, 1,
-1.509809, 0.5293217, -1.671638, 1, 0, 0, 1, 1,
-1.504664, 0.7481129, -1.992443, 0, 0, 0, 1, 1,
-1.494129, -0.5718752, -1.527955, 0, 0, 0, 1, 1,
-1.47516, -0.02183034, -2.599903, 0, 0, 0, 1, 1,
-1.473097, -0.4897354, -0.6428947, 0, 0, 0, 1, 1,
-1.457652, -0.3122548, -2.368616, 0, 0, 0, 1, 1,
-1.451918, -0.07500036, -2.894198, 0, 0, 0, 1, 1,
-1.43322, 0.07959316, -0.9498054, 0, 0, 0, 1, 1,
-1.428311, 2.746589, -0.4916307, 1, 1, 1, 1, 1,
-1.409258, 0.1999948, -2.936741, 1, 1, 1, 1, 1,
-1.407844, 1.957973, -0.9517097, 1, 1, 1, 1, 1,
-1.386667, -1.298863, -1.292983, 1, 1, 1, 1, 1,
-1.367141, -0.2787755, -2.081893, 1, 1, 1, 1, 1,
-1.365908, 0.4493574, -2.258967, 1, 1, 1, 1, 1,
-1.36451, 0.8062074, 0.3791867, 1, 1, 1, 1, 1,
-1.360774, -0.6372252, -1.300779, 1, 1, 1, 1, 1,
-1.360556, -1.770088, -2.089218, 1, 1, 1, 1, 1,
-1.355453, -0.1572594, -3.004223, 1, 1, 1, 1, 1,
-1.352665, 0.3711973, -1.222505, 1, 1, 1, 1, 1,
-1.352435, -0.4090733, -2.103076, 1, 1, 1, 1, 1,
-1.345849, -0.4098579, -2.14278, 1, 1, 1, 1, 1,
-1.340376, 0.1724998, -3.485428, 1, 1, 1, 1, 1,
-1.316794, -0.8050829, -2.098469, 1, 1, 1, 1, 1,
-1.313862, 0.9536171, -1.136164, 0, 0, 1, 1, 1,
-1.311214, -0.5893924, -1.656506, 1, 0, 0, 1, 1,
-1.308685, 0.2752893, -2.965559, 1, 0, 0, 1, 1,
-1.308211, -0.05565445, -0.2539893, 1, 0, 0, 1, 1,
-1.30691, 0.5182094, -1.993195, 1, 0, 0, 1, 1,
-1.305161, 1.506855, -0.4243769, 1, 0, 0, 1, 1,
-1.303611, -0.1434068, 0.411851, 0, 0, 0, 1, 1,
-1.302197, -0.6725437, -3.326159, 0, 0, 0, 1, 1,
-1.292966, 2.041892, -2.511189, 0, 0, 0, 1, 1,
-1.286417, 0.1145236, -1.881065, 0, 0, 0, 1, 1,
-1.282164, -0.5053846, -2.763235, 0, 0, 0, 1, 1,
-1.274222, 0.6773484, -1.041793, 0, 0, 0, 1, 1,
-1.269062, 0.2430495, -1.706915, 0, 0, 0, 1, 1,
-1.263963, 0.9840508, -1.414885, 1, 1, 1, 1, 1,
-1.256373, 0.1450572, -0.604278, 1, 1, 1, 1, 1,
-1.255651, 0.2354578, -1.883391, 1, 1, 1, 1, 1,
-1.251857, -0.9669269, -2.794216, 1, 1, 1, 1, 1,
-1.235093, 0.3767979, -2.607822, 1, 1, 1, 1, 1,
-1.231464, -0.4891003, -0.6863327, 1, 1, 1, 1, 1,
-1.224019, -0.368798, -2.366185, 1, 1, 1, 1, 1,
-1.223148, 0.6288806, -1.428279, 1, 1, 1, 1, 1,
-1.221017, -0.1328681, -0.1332941, 1, 1, 1, 1, 1,
-1.220157, -0.2304026, -3.162608, 1, 1, 1, 1, 1,
-1.212724, -1.316539, -0.6181043, 1, 1, 1, 1, 1,
-1.2126, -2.048837, -3.534849, 1, 1, 1, 1, 1,
-1.191606, -0.5057735, -4.106183, 1, 1, 1, 1, 1,
-1.184895, 0.6269773, -1.874396, 1, 1, 1, 1, 1,
-1.182516, 1.081137, -1.002146, 1, 1, 1, 1, 1,
-1.180529, -0.29263, -0.8088859, 0, 0, 1, 1, 1,
-1.178615, -0.762242, -0.616842, 1, 0, 0, 1, 1,
-1.155401, -0.5192261, -1.290529, 1, 0, 0, 1, 1,
-1.154801, -0.1973995, -1.670694, 1, 0, 0, 1, 1,
-1.146677, 1.135527, -0.6603423, 1, 0, 0, 1, 1,
-1.146093, -1.148975, -3.297393, 1, 0, 0, 1, 1,
-1.144437, -0.1892621, -2.150923, 0, 0, 0, 1, 1,
-1.143553, -0.8413584, -1.821375, 0, 0, 0, 1, 1,
-1.143458, 0.3577724, -0.04602147, 0, 0, 0, 1, 1,
-1.142977, 1.143085, -1.231632, 0, 0, 0, 1, 1,
-1.131141, 0.7845056, -0.8038567, 0, 0, 0, 1, 1,
-1.123173, -0.4029846, -2.526056, 0, 0, 0, 1, 1,
-1.119391, 0.2787437, -1.68806, 0, 0, 0, 1, 1,
-1.118746, 0.212925, -1.91992, 1, 1, 1, 1, 1,
-1.113162, -1.035441, -1.384384, 1, 1, 1, 1, 1,
-1.112323, -0.4015474, -1.330079, 1, 1, 1, 1, 1,
-1.110695, -1.020206, -2.424531, 1, 1, 1, 1, 1,
-1.108761, -0.3419951, -1.803365, 1, 1, 1, 1, 1,
-1.105516, 0.361246, -2.73554, 1, 1, 1, 1, 1,
-1.104893, -0.7022521, -0.5944144, 1, 1, 1, 1, 1,
-1.098201, 1.228997, 2.310277, 1, 1, 1, 1, 1,
-1.076767, 1.665377, 0.5294983, 1, 1, 1, 1, 1,
-1.074863, -0.5494832, -1.055966, 1, 1, 1, 1, 1,
-1.069169, -0.8547115, -0.03356067, 1, 1, 1, 1, 1,
-1.063871, 0.8069518, -0.9333456, 1, 1, 1, 1, 1,
-1.06111, 1.266955, -1.125255, 1, 1, 1, 1, 1,
-1.059495, 0.5980566, 0.3212337, 1, 1, 1, 1, 1,
-1.029512, -0.4174792, -3.854284, 1, 1, 1, 1, 1,
-1.028545, 0.3039953, 0.4813337, 0, 0, 1, 1, 1,
-1.02741, -0.026859, -2.086646, 1, 0, 0, 1, 1,
-1.020146, 0.01211976, -3.275244, 1, 0, 0, 1, 1,
-1.017755, -1.664718, -2.12374, 1, 0, 0, 1, 1,
-1.013338, 0.8737805, -0.1322197, 1, 0, 0, 1, 1,
-1.013247, 1.326434, 0.8814839, 1, 0, 0, 1, 1,
-1.010877, -0.8960809, -2.126727, 0, 0, 0, 1, 1,
-1.005547, 1.140072, -1.155254, 0, 0, 0, 1, 1,
-1.000524, -1.250028, -3.328767, 0, 0, 0, 1, 1,
-0.9898996, -0.6743454, -3.471174, 0, 0, 0, 1, 1,
-0.9893894, 1.145662, -0.8510838, 0, 0, 0, 1, 1,
-0.9868963, -0.9141743, -2.079581, 0, 0, 0, 1, 1,
-0.9863791, -0.7277575, -1.73812, 0, 0, 0, 1, 1,
-0.9684816, 0.7758821, -0.8667275, 1, 1, 1, 1, 1,
-0.9684578, 0.3032785, -1.719916, 1, 1, 1, 1, 1,
-0.9628469, -0.493997, -2.586118, 1, 1, 1, 1, 1,
-0.9553558, 0.9142448, -1.611875, 1, 1, 1, 1, 1,
-0.9405872, 0.3687584, -0.3471771, 1, 1, 1, 1, 1,
-0.9400917, 0.5143446, -0.9470018, 1, 1, 1, 1, 1,
-0.9385743, -2.247287, -3.835749, 1, 1, 1, 1, 1,
-0.9327879, 0.2454611, 0.02092021, 1, 1, 1, 1, 1,
-0.9316881, -1.089659, -5.050048, 1, 1, 1, 1, 1,
-0.9312358, 0.04072582, -1.725425, 1, 1, 1, 1, 1,
-0.927091, -1.116366, -2.204731, 1, 1, 1, 1, 1,
-0.9227655, -0.9954326, -3.366097, 1, 1, 1, 1, 1,
-0.9187372, 0.4709398, -1.483293, 1, 1, 1, 1, 1,
-0.9122314, 0.4238134, -0.6388382, 1, 1, 1, 1, 1,
-0.9100007, -1.05406, -3.523514, 1, 1, 1, 1, 1,
-0.9078591, -1.668041, -2.154595, 0, 0, 1, 1, 1,
-0.9075497, 0.3427832, 0.3962064, 1, 0, 0, 1, 1,
-0.9072443, -1.332882, -3.023577, 1, 0, 0, 1, 1,
-0.8992885, 0.6414706, -1.180669, 1, 0, 0, 1, 1,
-0.8953522, 0.871409, -2.977038, 1, 0, 0, 1, 1,
-0.8918146, -1.465712, -2.201648, 1, 0, 0, 1, 1,
-0.8911505, -1.802309, -2.92979, 0, 0, 0, 1, 1,
-0.8857855, -0.5694064, -1.072574, 0, 0, 0, 1, 1,
-0.8822289, -0.1179867, -2.240749, 0, 0, 0, 1, 1,
-0.8784923, 0.1832217, -0.2199473, 0, 0, 0, 1, 1,
-0.8759706, 0.6530549, -2.670768, 0, 0, 0, 1, 1,
-0.8707058, 0.2078892, -1.278023, 0, 0, 0, 1, 1,
-0.8687886, -0.2806405, -2.574452, 0, 0, 0, 1, 1,
-0.8668495, -0.2110079, -3.149799, 1, 1, 1, 1, 1,
-0.8667076, -1.145071, -3.316394, 1, 1, 1, 1, 1,
-0.8657502, -1.497772, -4.727154, 1, 1, 1, 1, 1,
-0.8651267, -1.808972, -3.801043, 1, 1, 1, 1, 1,
-0.8595079, 0.4972152, -1.934782, 1, 1, 1, 1, 1,
-0.8500651, 1.061779, 0.006872717, 1, 1, 1, 1, 1,
-0.8494914, 2.020548, -0.1180817, 1, 1, 1, 1, 1,
-0.8445965, 0.8512471, -1.708013, 1, 1, 1, 1, 1,
-0.8432447, -0.5833213, -1.979512, 1, 1, 1, 1, 1,
-0.8429676, -0.6600493, -1.74254, 1, 1, 1, 1, 1,
-0.8421022, -0.9907011, -1.86699, 1, 1, 1, 1, 1,
-0.8364984, -0.2815652, -3.382896, 1, 1, 1, 1, 1,
-0.832572, -1.8108, -2.284764, 1, 1, 1, 1, 1,
-0.8272113, -0.0276597, -2.769147, 1, 1, 1, 1, 1,
-0.8217085, -0.07040984, -1.272452, 1, 1, 1, 1, 1,
-0.8214598, 0.4687139, -0.7539091, 0, 0, 1, 1, 1,
-0.8161568, -0.135125, -2.529875, 1, 0, 0, 1, 1,
-0.8145107, -1.166413, -1.033265, 1, 0, 0, 1, 1,
-0.8117075, 0.04354905, 1.048506, 1, 0, 0, 1, 1,
-0.8098053, 0.5118294, -0.3736081, 1, 0, 0, 1, 1,
-0.8086185, 1.843179, -0.7802123, 1, 0, 0, 1, 1,
-0.8025772, -1.03763, -3.36944, 0, 0, 0, 1, 1,
-0.802084, -0.8388801, -2.52072, 0, 0, 0, 1, 1,
-0.796531, 0.8662641, 1.650983, 0, 0, 0, 1, 1,
-0.7941636, -0.4147429, -1.387, 0, 0, 0, 1, 1,
-0.7872811, 0.001406235, -1.264724, 0, 0, 0, 1, 1,
-0.7797288, -1.220976, -1.601233, 0, 0, 0, 1, 1,
-0.7764644, 1.132079, -1.461683, 0, 0, 0, 1, 1,
-0.7756039, -0.1432406, -2.009624, 1, 1, 1, 1, 1,
-0.7643151, 0.06885925, -1.919607, 1, 1, 1, 1, 1,
-0.7612216, 2.179362, -1.197573, 1, 1, 1, 1, 1,
-0.7604132, 0.1280055, -0.2413698, 1, 1, 1, 1, 1,
-0.756283, 0.03857778, -2.250832, 1, 1, 1, 1, 1,
-0.7468112, -0.08335162, 0.1084435, 1, 1, 1, 1, 1,
-0.743333, 1.307305, -0.2143771, 1, 1, 1, 1, 1,
-0.7427546, -1.220106, -1.616234, 1, 1, 1, 1, 1,
-0.7406638, -0.4505805, -2.934544, 1, 1, 1, 1, 1,
-0.7403761, 0.01961265, -2.20524, 1, 1, 1, 1, 1,
-0.736047, 0.2923055, -1.447044, 1, 1, 1, 1, 1,
-0.7329841, 0.8407416, -0.9181293, 1, 1, 1, 1, 1,
-0.7294396, 0.136838, -2.4887, 1, 1, 1, 1, 1,
-0.7218106, 0.4475023, -0.7253988, 1, 1, 1, 1, 1,
-0.717441, 0.7741463, -0.08383451, 1, 1, 1, 1, 1,
-0.7157608, -0.3058453, -1.67784, 0, 0, 1, 1, 1,
-0.7144494, -1.053181, -3.271317, 1, 0, 0, 1, 1,
-0.7095942, 0.3301522, -1.762115, 1, 0, 0, 1, 1,
-0.7094743, -1.352768, -1.53875, 1, 0, 0, 1, 1,
-0.7082233, -0.4218642, -1.157384, 1, 0, 0, 1, 1,
-0.704258, 0.5539948, -1.150884, 1, 0, 0, 1, 1,
-0.7041381, 1.667393, 1.166737, 0, 0, 0, 1, 1,
-0.6986306, 0.7839379, -0.6531808, 0, 0, 0, 1, 1,
-0.6960899, 1.213419, -0.2043311, 0, 0, 0, 1, 1,
-0.6914852, 0.2029579, -2.510512, 0, 0, 0, 1, 1,
-0.6868379, 0.712275, 0.1966624, 0, 0, 0, 1, 1,
-0.6858243, 0.9050257, -2.64237, 0, 0, 0, 1, 1,
-0.6829191, 0.8116828, 1.91829, 0, 0, 0, 1, 1,
-0.6789731, -1.3714, -1.677414, 1, 1, 1, 1, 1,
-0.6765522, 0.7103236, -1.334556, 1, 1, 1, 1, 1,
-0.6750595, -0.7253946, 0.6468698, 1, 1, 1, 1, 1,
-0.6742581, 0.6458646, -0.5793712, 1, 1, 1, 1, 1,
-0.6738165, 0.3500655, -0.6872309, 1, 1, 1, 1, 1,
-0.6677603, -0.3399154, -3.137579, 1, 1, 1, 1, 1,
-0.6669609, 1.687753, -0.236588, 1, 1, 1, 1, 1,
-0.6657162, 0.2701578, -2.928519, 1, 1, 1, 1, 1,
-0.6636422, -0.7715288, -3.000815, 1, 1, 1, 1, 1,
-0.6579488, 0.2332271, 0.9441305, 1, 1, 1, 1, 1,
-0.6463383, -0.5420904, -3.92872, 1, 1, 1, 1, 1,
-0.6412509, -1.021755, -3.053219, 1, 1, 1, 1, 1,
-0.6405419, 0.01134865, -1.568412, 1, 1, 1, 1, 1,
-0.6398911, 0.03080482, -0.8615222, 1, 1, 1, 1, 1,
-0.6378755, -0.388331, -1.969963, 1, 1, 1, 1, 1,
-0.6350173, -0.7742965, -2.572153, 0, 0, 1, 1, 1,
-0.634696, -2.680727, -0.8102116, 1, 0, 0, 1, 1,
-0.6305257, 0.365543, -0.2252474, 1, 0, 0, 1, 1,
-0.6234794, 1.583203, -1.571014, 1, 0, 0, 1, 1,
-0.620046, -0.263327, -3.983391, 1, 0, 0, 1, 1,
-0.6174614, -1.157118, -2.158468, 1, 0, 0, 1, 1,
-0.6161755, 1.139392, -0.0326735, 0, 0, 0, 1, 1,
-0.6151004, 1.456133, 0.4762833, 0, 0, 0, 1, 1,
-0.6104332, 1.110315, 0.2835588, 0, 0, 0, 1, 1,
-0.6021832, -0.2797204, -3.434475, 0, 0, 0, 1, 1,
-0.5926174, 0.5763009, 0.6976552, 0, 0, 0, 1, 1,
-0.58968, -0.5801028, -2.442629, 0, 0, 0, 1, 1,
-0.5873922, 0.4968737, -1.474756, 0, 0, 0, 1, 1,
-0.5867996, -2.20412, -2.25644, 1, 1, 1, 1, 1,
-0.5760095, -0.08544324, -4.73204, 1, 1, 1, 1, 1,
-0.5723478, 1.220792, -0.4474348, 1, 1, 1, 1, 1,
-0.5718358, -1.404107, -4.723857, 1, 1, 1, 1, 1,
-0.5708464, -0.3304341, -2.377283, 1, 1, 1, 1, 1,
-0.5706849, 1.230134, -0.3422635, 1, 1, 1, 1, 1,
-0.5688823, -0.3638867, -2.746792, 1, 1, 1, 1, 1,
-0.5677657, 0.3394299, -0.4616593, 1, 1, 1, 1, 1,
-0.566344, 0.4740713, -0.7911516, 1, 1, 1, 1, 1,
-0.5645811, -1.014007, -1.958917, 1, 1, 1, 1, 1,
-0.5643286, -0.4640298, -2.801771, 1, 1, 1, 1, 1,
-0.5626276, 1.012675, -1.782468, 1, 1, 1, 1, 1,
-0.5601212, 0.4081162, -1.346074, 1, 1, 1, 1, 1,
-0.5594745, -0.4912253, -2.620301, 1, 1, 1, 1, 1,
-0.5483167, 0.7821046, -1.603789, 1, 1, 1, 1, 1,
-0.5467443, 1.740752, 0.2354876, 0, 0, 1, 1, 1,
-0.5330632, -1.083185, -4.142191, 1, 0, 0, 1, 1,
-0.5327869, 0.2897678, -1.016255, 1, 0, 0, 1, 1,
-0.5325198, 1.676445, -0.7574282, 1, 0, 0, 1, 1,
-0.5271867, 0.9196277, -0.11665, 1, 0, 0, 1, 1,
-0.5202825, 0.1083597, -1.215427, 1, 0, 0, 1, 1,
-0.5202179, -0.3631331, -1.900624, 0, 0, 0, 1, 1,
-0.5191383, 0.1858563, -1.47219, 0, 0, 0, 1, 1,
-0.5122741, -0.1717264, -3.597176, 0, 0, 0, 1, 1,
-0.5083431, 0.183392, -2.167802, 0, 0, 0, 1, 1,
-0.5062744, 2.223346, 0.03864006, 0, 0, 0, 1, 1,
-0.5012267, -1.789092, -2.28307, 0, 0, 0, 1, 1,
-0.499106, -0.6440011, -1.774348, 0, 0, 0, 1, 1,
-0.4956291, 3.50766, -0.03486903, 1, 1, 1, 1, 1,
-0.4916423, -0.7767927, -4.30915, 1, 1, 1, 1, 1,
-0.4835417, 1.205722, -0.8641607, 1, 1, 1, 1, 1,
-0.4835338, 0.09671468, -0.42289, 1, 1, 1, 1, 1,
-0.4816624, -0.5634377, -1.200501, 1, 1, 1, 1, 1,
-0.4814474, -0.6274759, -2.514088, 1, 1, 1, 1, 1,
-0.4805629, -1.389133, -3.744248, 1, 1, 1, 1, 1,
-0.4795265, 0.6724227, 0.7649539, 1, 1, 1, 1, 1,
-0.4780488, 0.2361955, -3.146525, 1, 1, 1, 1, 1,
-0.4738778, -1.826782, -2.055358, 1, 1, 1, 1, 1,
-0.472351, 1.232841, -0.9949763, 1, 1, 1, 1, 1,
-0.4722332, -1.870135, -2.73208, 1, 1, 1, 1, 1,
-0.4701811, -0.3712216, -1.22917, 1, 1, 1, 1, 1,
-0.4656199, -0.3533685, -2.884514, 1, 1, 1, 1, 1,
-0.4599899, 1.654378, -0.5111061, 1, 1, 1, 1, 1,
-0.457376, 1.409272, 0.2629441, 0, 0, 1, 1, 1,
-0.454306, 0.8306127, 1.646235, 1, 0, 0, 1, 1,
-0.4540349, 0.3668625, -0.2098737, 1, 0, 0, 1, 1,
-0.4539916, -0.1167886, -0.9263585, 1, 0, 0, 1, 1,
-0.4457477, -1.398648, -2.947153, 1, 0, 0, 1, 1,
-0.4454396, -1.000336, -2.999205, 1, 0, 0, 1, 1,
-0.4446213, -0.418692, -2.302907, 0, 0, 0, 1, 1,
-0.4430292, -0.8739306, -2.687484, 0, 0, 0, 1, 1,
-0.4428462, -0.1912813, -2.145633, 0, 0, 0, 1, 1,
-0.442455, 0.988042, -1.909086, 0, 0, 0, 1, 1,
-0.4354813, -0.1197396, -0.7670791, 0, 0, 0, 1, 1,
-0.4350677, -1.027966, -4.552498, 0, 0, 0, 1, 1,
-0.4279117, 0.6848003, 0.35653, 0, 0, 0, 1, 1,
-0.4274638, 0.04731238, -0.3348045, 1, 1, 1, 1, 1,
-0.4244309, -0.1029199, -3.228817, 1, 1, 1, 1, 1,
-0.4177068, -0.5809208, -2.79655, 1, 1, 1, 1, 1,
-0.4144338, -1.5752, -2.153524, 1, 1, 1, 1, 1,
-0.4143382, 0.8814521, -0.7976252, 1, 1, 1, 1, 1,
-0.4127191, 0.8858298, -1.260316, 1, 1, 1, 1, 1,
-0.4093789, 0.7783217, 0.2036256, 1, 1, 1, 1, 1,
-0.4066339, 0.3874151, -0.5450501, 1, 1, 1, 1, 1,
-0.4059308, -0.3317058, -3.235516, 1, 1, 1, 1, 1,
-0.4037391, -0.9526544, -2.324156, 1, 1, 1, 1, 1,
-0.4010183, -1.447543, -2.856737, 1, 1, 1, 1, 1,
-0.4010048, 0.5149522, -0.7156751, 1, 1, 1, 1, 1,
-0.395898, 0.4776489, -2.083805, 1, 1, 1, 1, 1,
-0.3947567, -0.526031, -2.042939, 1, 1, 1, 1, 1,
-0.3939071, -0.6668797, -2.106225, 1, 1, 1, 1, 1,
-0.3933952, 0.0009709509, -1.896998, 0, 0, 1, 1, 1,
-0.3922526, 1.663778, -1.232473, 1, 0, 0, 1, 1,
-0.3914476, 0.6290255, 1.355563, 1, 0, 0, 1, 1,
-0.3853376, 0.9378267, 2.08334, 1, 0, 0, 1, 1,
-0.3824187, -1.300994, -3.437632, 1, 0, 0, 1, 1,
-0.381736, 0.3327268, -1.193668, 1, 0, 0, 1, 1,
-0.3803655, 0.00672294, -1.249057, 0, 0, 0, 1, 1,
-0.3792483, 0.4168886, -2.299658, 0, 0, 0, 1, 1,
-0.371784, 1.189926, 0.5841637, 0, 0, 0, 1, 1,
-0.3637418, -0.05542202, 0.3679258, 0, 0, 0, 1, 1,
-0.3619812, 1.119782, -0.1442551, 0, 0, 0, 1, 1,
-0.3606927, 0.3255783, -0.5265439, 0, 0, 0, 1, 1,
-0.3590871, -1.9435, -2.158261, 0, 0, 0, 1, 1,
-0.3575019, -0.2549735, -1.681136, 1, 1, 1, 1, 1,
-0.3573316, -1.407296, -2.773227, 1, 1, 1, 1, 1,
-0.3462845, -0.75309, -2.207855, 1, 1, 1, 1, 1,
-0.337274, 1.441452, -1.403722, 1, 1, 1, 1, 1,
-0.333434, 0.9547645, -0.6676645, 1, 1, 1, 1, 1,
-0.3286301, -0.2393534, -3.19032, 1, 1, 1, 1, 1,
-0.3246602, 0.9353079, -2.341075, 1, 1, 1, 1, 1,
-0.3167954, 0.846706, -0.9804396, 1, 1, 1, 1, 1,
-0.3152851, -1.104491, -2.489625, 1, 1, 1, 1, 1,
-0.3147131, 0.9461632, -1.712007, 1, 1, 1, 1, 1,
-0.312399, 2.867019, -0.1777345, 1, 1, 1, 1, 1,
-0.3122965, -0.601186, -3.249694, 1, 1, 1, 1, 1,
-0.311647, -0.9315279, -1.512017, 1, 1, 1, 1, 1,
-0.3115743, 0.5813566, -0.6858005, 1, 1, 1, 1, 1,
-0.3112248, -0.4074167, -2.40598, 1, 1, 1, 1, 1,
-0.3083798, -0.7604062, -2.779917, 0, 0, 1, 1, 1,
-0.3076773, -0.2809124, -2.879935, 1, 0, 0, 1, 1,
-0.3060445, -1.324467, -2.428436, 1, 0, 0, 1, 1,
-0.3055379, -1.866403, -2.21738, 1, 0, 0, 1, 1,
-0.3041521, -1.627576, -2.015339, 1, 0, 0, 1, 1,
-0.3031422, -0.5198182, -1.507483, 1, 0, 0, 1, 1,
-0.2983655, -0.8848507, -3.23104, 0, 0, 0, 1, 1,
-0.29709, -0.1636559, -1.493348, 0, 0, 0, 1, 1,
-0.296995, 0.9208927, -0.550119, 0, 0, 0, 1, 1,
-0.2963005, -0.2454997, -1.451164, 0, 0, 0, 1, 1,
-0.2927423, 0.7308383, -3.286184, 0, 0, 0, 1, 1,
-0.2918901, 1.068601, -4.264149, 0, 0, 0, 1, 1,
-0.2918514, -0.1814286, 0.2142873, 0, 0, 0, 1, 1,
-0.2917694, 3.482457, -0.0571392, 1, 1, 1, 1, 1,
-0.2875725, -0.9575953, -1.71374, 1, 1, 1, 1, 1,
-0.2835508, -0.4655191, -3.604075, 1, 1, 1, 1, 1,
-0.2821141, -0.3134531, -1.988074, 1, 1, 1, 1, 1,
-0.281705, 0.9155937, -0.9986359, 1, 1, 1, 1, 1,
-0.2783903, -1.403955, -3.022292, 1, 1, 1, 1, 1,
-0.2740087, 1.232718, 1.235594, 1, 1, 1, 1, 1,
-0.2732066, -0.7815298, -4.180882, 1, 1, 1, 1, 1,
-0.2719548, -0.8644428, -3.405993, 1, 1, 1, 1, 1,
-0.2677724, -0.7351173, -3.29318, 1, 1, 1, 1, 1,
-0.267405, -0.5277031, -2.401209, 1, 1, 1, 1, 1,
-0.2651094, -1.157551, -3.032189, 1, 1, 1, 1, 1,
-0.2590595, 0.1883899, -1.681774, 1, 1, 1, 1, 1,
-0.2571975, 0.7598476, 0.4750586, 1, 1, 1, 1, 1,
-0.2560759, -0.9216276, -3.62264, 1, 1, 1, 1, 1,
-0.2538074, 2.188751, 1.781712, 0, 0, 1, 1, 1,
-0.2470871, -0.2648032, -2.283526, 1, 0, 0, 1, 1,
-0.2348092, -0.06426762, -3.090868, 1, 0, 0, 1, 1,
-0.2327591, 0.2851192, 0.6316345, 1, 0, 0, 1, 1,
-0.2316035, -0.9955431, -3.371472, 1, 0, 0, 1, 1,
-0.2304881, -0.3326994, -2.725026, 1, 0, 0, 1, 1,
-0.2298063, -0.1868484, -0.806242, 0, 0, 0, 1, 1,
-0.2263492, -0.6766031, -1.122418, 0, 0, 0, 1, 1,
-0.2205104, 0.6150684, -0.9027363, 0, 0, 0, 1, 1,
-0.2197338, -0.3925633, -2.465141, 0, 0, 0, 1, 1,
-0.2194103, -1.077523, -1.999386, 0, 0, 0, 1, 1,
-0.2153636, -0.6642717, -2.365576, 0, 0, 0, 1, 1,
-0.2149372, 1.163418, 0.4258583, 0, 0, 0, 1, 1,
-0.2109367, 1.454681, -0.3105515, 1, 1, 1, 1, 1,
-0.2103137, 0.4030508, -0.5542256, 1, 1, 1, 1, 1,
-0.2102866, -1.108873, -0.7277215, 1, 1, 1, 1, 1,
-0.2101078, -0.54969, -3.126779, 1, 1, 1, 1, 1,
-0.2070725, 0.9614456, -0.202723, 1, 1, 1, 1, 1,
-0.2032933, 0.5689515, 0.5297554, 1, 1, 1, 1, 1,
-0.1992998, 0.09225824, -2.934308, 1, 1, 1, 1, 1,
-0.1992602, -1.284819, -3.585285, 1, 1, 1, 1, 1,
-0.1983351, 0.7363684, 1.524815, 1, 1, 1, 1, 1,
-0.1941868, 0.08063783, -1.261441, 1, 1, 1, 1, 1,
-0.1789894, 0.2283727, -0.2939185, 1, 1, 1, 1, 1,
-0.175339, -0.6685902, -3.359582, 1, 1, 1, 1, 1,
-0.1707163, -0.726006, -2.219994, 1, 1, 1, 1, 1,
-0.1668509, -1.702741, -2.818072, 1, 1, 1, 1, 1,
-0.1617324, 0.128165, -2.030351, 1, 1, 1, 1, 1,
-0.1616834, -1.292143, -2.423199, 0, 0, 1, 1, 1,
-0.1608019, -0.5748029, -2.412442, 1, 0, 0, 1, 1,
-0.1596597, 0.2114244, -2.971543, 1, 0, 0, 1, 1,
-0.1580975, 0.3576972, 2.170297, 1, 0, 0, 1, 1,
-0.1561294, 0.5976122, -0.5411029, 1, 0, 0, 1, 1,
-0.1551387, 0.1719883, -0.2712775, 1, 0, 0, 1, 1,
-0.1545449, -0.956518, -0.9316224, 0, 0, 0, 1, 1,
-0.1534773, 3.011591, -1.685777, 0, 0, 0, 1, 1,
-0.1530225, -1.002538, -3.368142, 0, 0, 0, 1, 1,
-0.151478, 0.4892328, 0.03689826, 0, 0, 0, 1, 1,
-0.1463994, 0.2590747, -1.653653, 0, 0, 0, 1, 1,
-0.1433207, 0.9766784, 1.136059, 0, 0, 0, 1, 1,
-0.1416037, 3.314773, 1.133001, 0, 0, 0, 1, 1,
-0.1404814, -0.2065116, -1.491717, 1, 1, 1, 1, 1,
-0.1282576, 0.3303882, -0.4450178, 1, 1, 1, 1, 1,
-0.1245558, 0.3682424, -0.2293815, 1, 1, 1, 1, 1,
-0.1209917, -0.98097, -4.070019, 1, 1, 1, 1, 1,
-0.1188132, -0.6714971, -2.142142, 1, 1, 1, 1, 1,
-0.1173779, 0.2837644, -0.4916829, 1, 1, 1, 1, 1,
-0.1169724, 0.582502, 0.2222277, 1, 1, 1, 1, 1,
-0.1139895, 0.9491186, 0.7013342, 1, 1, 1, 1, 1,
-0.113768, 0.5142668, 0.2790475, 1, 1, 1, 1, 1,
-0.1065581, 0.7409453, 0.9720775, 1, 1, 1, 1, 1,
-0.1065544, 0.3525539, -0.445539, 1, 1, 1, 1, 1,
-0.1054134, 1.416264, -0.2344294, 1, 1, 1, 1, 1,
-0.104435, -0.08659419, -1.297728, 1, 1, 1, 1, 1,
-0.1028878, 0.1768283, -0.4407856, 1, 1, 1, 1, 1,
-0.1025704, -0.2444697, -1.951875, 1, 1, 1, 1, 1,
-0.09969056, 0.9105728, -0.9153548, 0, 0, 1, 1, 1,
-0.0923759, -0.1566842, -1.471946, 1, 0, 0, 1, 1,
-0.09216814, -1.324098, -2.405707, 1, 0, 0, 1, 1,
-0.08752383, 0.9853464, -0.5203806, 1, 0, 0, 1, 1,
-0.08576774, -1.107459, -3.274313, 1, 0, 0, 1, 1,
-0.08541811, -0.93199, -3.696618, 1, 0, 0, 1, 1,
-0.08476402, -1.169651, -3.796867, 0, 0, 0, 1, 1,
-0.082063, 0.001699237, -0.9979862, 0, 0, 0, 1, 1,
-0.08036291, -0.8512679, -3.271917, 0, 0, 0, 1, 1,
-0.07548527, -0.9841619, -0.01220275, 0, 0, 0, 1, 1,
-0.07540572, 1.644192, 0.2447793, 0, 0, 0, 1, 1,
-0.07181975, -1.088354, -3.591059, 0, 0, 0, 1, 1,
-0.06534173, -0.2201269, -2.378457, 0, 0, 0, 1, 1,
-0.06218541, 1.054296, -0.6585222, 1, 1, 1, 1, 1,
-0.05122188, -0.4129168, -6.337335, 1, 1, 1, 1, 1,
-0.04978774, -0.5228602, -4.284692, 1, 1, 1, 1, 1,
-0.04408689, 1.42147, 0.2377852, 1, 1, 1, 1, 1,
-0.03556853, 1.182698, 0.5893463, 1, 1, 1, 1, 1,
-0.0334061, -0.484783, -1.536135, 1, 1, 1, 1, 1,
-0.03209336, -1.898577, -0.8964623, 1, 1, 1, 1, 1,
-0.03195285, -0.9989607, -2.641321, 1, 1, 1, 1, 1,
-0.02827384, -0.6504111, -2.226171, 1, 1, 1, 1, 1,
-0.02769534, 0.7786656, 1.647676, 1, 1, 1, 1, 1,
-0.02646783, -0.2374598, -3.414267, 1, 1, 1, 1, 1,
-0.02476555, -0.1382018, -3.090802, 1, 1, 1, 1, 1,
-0.02349013, 0.5567537, -0.9367455, 1, 1, 1, 1, 1,
-0.02328221, 1.02358, -0.6351103, 1, 1, 1, 1, 1,
-0.01866722, -0.7900063, -2.459796, 1, 1, 1, 1, 1,
-0.01692874, 1.355865, 0.4789819, 0, 0, 1, 1, 1,
-0.01602449, -0.06507584, -3.664233, 1, 0, 0, 1, 1,
-0.01406161, -0.8599588, -1.56474, 1, 0, 0, 1, 1,
-0.01400881, 0.3753149, 1.205214, 1, 0, 0, 1, 1,
-0.01058612, 1.053447, -0.2258473, 1, 0, 0, 1, 1,
-0.009881367, -0.9985376, -1.436996, 1, 0, 0, 1, 1,
-0.008648437, -0.6910995, -5.309906, 0, 0, 0, 1, 1,
-0.008411554, -0.4504199, -3.088537, 0, 0, 0, 1, 1,
-0.007248641, -1.730516, -3.358741, 0, 0, 0, 1, 1,
-0.001203641, 0.5603316, 0.5151803, 0, 0, 0, 1, 1,
0.003083207, 0.7431145, 0.05769278, 0, 0, 0, 1, 1,
0.003823638, 2.132235, 0.8349957, 0, 0, 0, 1, 1,
0.007420931, 1.298942, 0.08432399, 0, 0, 0, 1, 1,
0.007954726, -1.773156, 1.007735, 1, 1, 1, 1, 1,
0.009682916, 0.3480182, -1.141562, 1, 1, 1, 1, 1,
0.01325546, -0.3770784, 1.83618, 1, 1, 1, 1, 1,
0.0136846, 0.7981726, 0.1035237, 1, 1, 1, 1, 1,
0.01590362, -0.1076916, 3.348403, 1, 1, 1, 1, 1,
0.01636939, -1.040303, 3.027063, 1, 1, 1, 1, 1,
0.01689524, 0.3239381, 1.291698, 1, 1, 1, 1, 1,
0.0183434, -1.231355, 2.935461, 1, 1, 1, 1, 1,
0.01886628, -0.5841064, 2.524103, 1, 1, 1, 1, 1,
0.02067239, -0.9036379, 2.462535, 1, 1, 1, 1, 1,
0.02410645, -0.5293766, 4.34257, 1, 1, 1, 1, 1,
0.02441633, 1.042992, 0.4925494, 1, 1, 1, 1, 1,
0.026574, -0.1855208, 3.571434, 1, 1, 1, 1, 1,
0.02719545, 2.148146, -0.5318592, 1, 1, 1, 1, 1,
0.02899835, 0.40218, 1.067343, 1, 1, 1, 1, 1,
0.0337896, 0.7766212, -1.018893, 0, 0, 1, 1, 1,
0.03551908, 1.487825, 1.465842, 1, 0, 0, 1, 1,
0.03617157, 1.07952, 1.48198, 1, 0, 0, 1, 1,
0.03744301, -0.9596238, 2.865154, 1, 0, 0, 1, 1,
0.03795892, -0.536345, 3.457675, 1, 0, 0, 1, 1,
0.03820258, 1.165601, -0.371804, 1, 0, 0, 1, 1,
0.03832865, -0.4917116, 2.53296, 0, 0, 0, 1, 1,
0.03885506, 0.9564913, 1.265942, 0, 0, 0, 1, 1,
0.03963226, 0.9617279, 0.6134699, 0, 0, 0, 1, 1,
0.04348009, 0.5029468, 0.9573582, 0, 0, 0, 1, 1,
0.04403904, -1.703218, 3.724087, 0, 0, 0, 1, 1,
0.04734288, -0.5464233, 4.988688, 0, 0, 0, 1, 1,
0.04886693, -1.6026, 2.032198, 0, 0, 0, 1, 1,
0.05216772, 0.2240651, 0.5407141, 1, 1, 1, 1, 1,
0.05386175, 0.864369, 0.4836461, 1, 1, 1, 1, 1,
0.05477316, 0.9654963, 2.055102, 1, 1, 1, 1, 1,
0.05616214, -0.9269748, 2.077648, 1, 1, 1, 1, 1,
0.05917248, 0.1377942, -0.4497513, 1, 1, 1, 1, 1,
0.06117854, 1.064942, -1.49849, 1, 1, 1, 1, 1,
0.06574149, 0.1941042, -1.532984, 1, 1, 1, 1, 1,
0.07020211, -0.7081341, 3.60156, 1, 1, 1, 1, 1,
0.07041429, -1.466547, 4.263085, 1, 1, 1, 1, 1,
0.07067086, 0.3066557, 1.585896, 1, 1, 1, 1, 1,
0.07199836, -1.031563, 5.243136, 1, 1, 1, 1, 1,
0.07384227, 0.8990058, 0.3002936, 1, 1, 1, 1, 1,
0.07792527, 1.044738, 0.623838, 1, 1, 1, 1, 1,
0.07827798, -0.2350459, 4.39445, 1, 1, 1, 1, 1,
0.0785256, 0.04478011, 2.343263, 1, 1, 1, 1, 1,
0.08409855, 0.8071236, -0.5747101, 0, 0, 1, 1, 1,
0.08448438, 1.085684, -0.4589629, 1, 0, 0, 1, 1,
0.08449338, 1.140616, -1.11556, 1, 0, 0, 1, 1,
0.09174992, 0.0823223, 2.555632, 1, 0, 0, 1, 1,
0.09497258, -0.5838032, 4.052338, 1, 0, 0, 1, 1,
0.09604523, 0.3781897, -0.6593931, 1, 0, 0, 1, 1,
0.09750798, -0.8576219, 2.918287, 0, 0, 0, 1, 1,
0.09823482, -0.2054796, 2.371217, 0, 0, 0, 1, 1,
0.09829662, 0.6501766, -0.8341661, 0, 0, 0, 1, 1,
0.100342, 1.34593, -0.286308, 0, 0, 0, 1, 1,
0.1036269, -1.119814, 3.819106, 0, 0, 0, 1, 1,
0.1038356, 1.081936, 0.03674152, 0, 0, 0, 1, 1,
0.1081999, -0.4219462, 2.272991, 0, 0, 0, 1, 1,
0.108967, 0.2641143, 0.2963943, 1, 1, 1, 1, 1,
0.1129603, -0.5311832, 4.12319, 1, 1, 1, 1, 1,
0.1154794, 0.1010483, 1.155596, 1, 1, 1, 1, 1,
0.1166051, -1.61041, 3.108701, 1, 1, 1, 1, 1,
0.1169457, 0.7625988, -0.1735242, 1, 1, 1, 1, 1,
0.1173597, -0.2229268, 1.77612, 1, 1, 1, 1, 1,
0.1186634, -0.3122613, 3.264143, 1, 1, 1, 1, 1,
0.1194893, -0.1984609, 1.107626, 1, 1, 1, 1, 1,
0.1216697, -0.1189766, 2.250692, 1, 1, 1, 1, 1,
0.1217248, -1.64687, 2.215596, 1, 1, 1, 1, 1,
0.1243437, 1.295578, 1.017917, 1, 1, 1, 1, 1,
0.1301069, -0.00564148, 1.871759, 1, 1, 1, 1, 1,
0.131256, 0.06575868, 2.406919, 1, 1, 1, 1, 1,
0.1319011, -1.10253, 2.714594, 1, 1, 1, 1, 1,
0.1330496, 0.1395825, -0.424414, 1, 1, 1, 1, 1,
0.1370289, 2.841946, -1.283737, 0, 0, 1, 1, 1,
0.1374527, -0.7310662, 3.312834, 1, 0, 0, 1, 1,
0.1405108, 0.02023051, 2.245736, 1, 0, 0, 1, 1,
0.1412941, -0.1889511, 3.250546, 1, 0, 0, 1, 1,
0.1425233, -0.652916, 1.918639, 1, 0, 0, 1, 1,
0.151309, 0.703309, 2.770217, 1, 0, 0, 1, 1,
0.160339, -0.7027032, 1.943382, 0, 0, 0, 1, 1,
0.1634863, 1.115189, -0.1609427, 0, 0, 0, 1, 1,
0.1634928, -0.3934553, 3.606133, 0, 0, 0, 1, 1,
0.165083, 2.255057, -0.672507, 0, 0, 0, 1, 1,
0.1710744, 1.119681, 0.0950485, 0, 0, 0, 1, 1,
0.1714509, -0.3681729, 3.540474, 0, 0, 0, 1, 1,
0.177272, 0.6987213, -0.4556661, 0, 0, 0, 1, 1,
0.1790993, -0.6658985, 4.483442, 1, 1, 1, 1, 1,
0.1807221, 2.472255, 0.6871747, 1, 1, 1, 1, 1,
0.1819632, 0.5599058, 2.138177, 1, 1, 1, 1, 1,
0.1838913, -0.7209716, 1.662252, 1, 1, 1, 1, 1,
0.1846516, -0.05386676, 2.462637, 1, 1, 1, 1, 1,
0.1851722, -1.724845, 4.457721, 1, 1, 1, 1, 1,
0.1902651, 0.6703508, 0.4241359, 1, 1, 1, 1, 1,
0.1904944, -1.312778, 2.374757, 1, 1, 1, 1, 1,
0.1987653, -0.3819275, 3.447076, 1, 1, 1, 1, 1,
0.1999177, -0.4174366, 2.460459, 1, 1, 1, 1, 1,
0.1999694, -0.2577025, 1.316256, 1, 1, 1, 1, 1,
0.2007981, -0.4767332, 3.068872, 1, 1, 1, 1, 1,
0.2016323, -0.3064814, 1.831872, 1, 1, 1, 1, 1,
0.21257, -2.755564, 3.485982, 1, 1, 1, 1, 1,
0.213364, -0.480379, 1.746686, 1, 1, 1, 1, 1,
0.213915, 0.3368472, -0.9815775, 0, 0, 1, 1, 1,
0.2157807, -0.9106491, 3.539484, 1, 0, 0, 1, 1,
0.2233026, 0.4820933, -0.5907107, 1, 0, 0, 1, 1,
0.2262654, 1.763478, -0.1891829, 1, 0, 0, 1, 1,
0.237029, 0.8164799, -0.0989771, 1, 0, 0, 1, 1,
0.2426859, 2.106726, -0.1388251, 1, 0, 0, 1, 1,
0.2475472, 1.130076, 0.2875703, 0, 0, 0, 1, 1,
0.2490723, -0.1970389, 1.474037, 0, 0, 0, 1, 1,
0.2515838, -1.801312, 3.596036, 0, 0, 0, 1, 1,
0.2553639, -1.746644, 3.345788, 0, 0, 0, 1, 1,
0.2565767, -1.591076, 3.231897, 0, 0, 0, 1, 1,
0.2598283, 0.1470463, 0.8647918, 0, 0, 0, 1, 1,
0.2600513, 0.009971255, 1.632813, 0, 0, 0, 1, 1,
0.2629674, 1.199245, -0.2170701, 1, 1, 1, 1, 1,
0.267106, -1.045113, 3.678604, 1, 1, 1, 1, 1,
0.2701826, -0.006947421, 2.043552, 1, 1, 1, 1, 1,
0.274111, -1.125383, 2.811995, 1, 1, 1, 1, 1,
0.2775111, -0.285592, 3.401798, 1, 1, 1, 1, 1,
0.2789308, -0.4036227, 4.430022, 1, 1, 1, 1, 1,
0.2873617, -0.2141185, 2.684192, 1, 1, 1, 1, 1,
0.2900878, 0.3312688, 1.591433, 1, 1, 1, 1, 1,
0.2901551, 0.9184435, 1.074095, 1, 1, 1, 1, 1,
0.290265, -0.2845884, 5.467456, 1, 1, 1, 1, 1,
0.2905715, 1.404661, 0.4353426, 1, 1, 1, 1, 1,
0.2907288, -2.274493, 3.334965, 1, 1, 1, 1, 1,
0.2914661, 0.5920699, -1.032023, 1, 1, 1, 1, 1,
0.2922766, -1.038947, 3.007015, 1, 1, 1, 1, 1,
0.293645, -0.5229861, 4.03535, 1, 1, 1, 1, 1,
0.2949609, -0.7171416, 2.552258, 0, 0, 1, 1, 1,
0.2957313, 1.765613, -0.3977614, 1, 0, 0, 1, 1,
0.2972901, 0.397287, 1.558481, 1, 0, 0, 1, 1,
0.2976399, 0.673179, 1.070488, 1, 0, 0, 1, 1,
0.3006123, -0.8748741, 5.528407, 1, 0, 0, 1, 1,
0.3006266, 1.222416, -0.7703965, 1, 0, 0, 1, 1,
0.3025967, 0.2755671, 1.340653, 0, 0, 0, 1, 1,
0.3030284, -0.9940712, 1.48852, 0, 0, 0, 1, 1,
0.307533, 1.288605, -0.2426329, 0, 0, 0, 1, 1,
0.3102728, 0.9283767, 2.208512, 0, 0, 0, 1, 1,
0.3126442, -0.4226427, 4.02544, 0, 0, 0, 1, 1,
0.3132267, -0.84172, 2.041799, 0, 0, 0, 1, 1,
0.320683, 1.404343, -0.9328552, 0, 0, 0, 1, 1,
0.3228365, 1.294833, 0.646001, 1, 1, 1, 1, 1,
0.3231317, 1.314021, 0.6841171, 1, 1, 1, 1, 1,
0.3239462, -0.6024193, 3.618244, 1, 1, 1, 1, 1,
0.3252291, -2.200495, 3.122405, 1, 1, 1, 1, 1,
0.3317497, 0.8464818, 1.712791, 1, 1, 1, 1, 1,
0.3327127, 2.204357, 0.2210368, 1, 1, 1, 1, 1,
0.3344333, -0.1323563, 1.625511, 1, 1, 1, 1, 1,
0.3374487, -0.07867387, 1.106088, 1, 1, 1, 1, 1,
0.3391582, -0.6302485, 1.831916, 1, 1, 1, 1, 1,
0.3430421, -0.7007403, 3.331209, 1, 1, 1, 1, 1,
0.3462106, 2.646927, -0.09594865, 1, 1, 1, 1, 1,
0.3475332, -1.987115, 4.296329, 1, 1, 1, 1, 1,
0.348214, 0.5963728, 2.034965, 1, 1, 1, 1, 1,
0.3494319, -2.273638, 3.368517, 1, 1, 1, 1, 1,
0.3514598, -1.142448, 2.304394, 1, 1, 1, 1, 1,
0.3539376, -0.3887958, 3.355242, 0, 0, 1, 1, 1,
0.3572945, -0.1858919, 2.792707, 1, 0, 0, 1, 1,
0.3594764, 0.9110076, 0.1315077, 1, 0, 0, 1, 1,
0.3597162, 0.1556684, -0.4184379, 1, 0, 0, 1, 1,
0.3615463, -1.046865, 0.656152, 1, 0, 0, 1, 1,
0.3648412, -0.5003171, 1.468182, 1, 0, 0, 1, 1,
0.3658728, -0.822668, 2.911753, 0, 0, 0, 1, 1,
0.3710879, 0.4121362, -0.02386651, 0, 0, 0, 1, 1,
0.3721433, 0.2624377, 1.070369, 0, 0, 0, 1, 1,
0.3751197, 1.415941, -1.087261, 0, 0, 0, 1, 1,
0.3756631, -0.6708966, 3.426002, 0, 0, 0, 1, 1,
0.376966, 0.043382, 0.436804, 0, 0, 0, 1, 1,
0.3783762, -0.8602476, 2.947573, 0, 0, 0, 1, 1,
0.3794589, 0.6771107, -1.808345, 1, 1, 1, 1, 1,
0.3799892, 0.2056104, 0.3021826, 1, 1, 1, 1, 1,
0.3815213, 0.5734963, 0.3476346, 1, 1, 1, 1, 1,
0.3825532, -0.2258752, 2.924655, 1, 1, 1, 1, 1,
0.3835675, -0.9540766, 4.067996, 1, 1, 1, 1, 1,
0.3847219, -0.6859402, 3.31038, 1, 1, 1, 1, 1,
0.3864931, 0.9413248, 0.816677, 1, 1, 1, 1, 1,
0.3870786, -0.4511334, 3.990174, 1, 1, 1, 1, 1,
0.3880514, 0.2854757, -0.402206, 1, 1, 1, 1, 1,
0.3934672, 0.7214256, 1.349852, 1, 1, 1, 1, 1,
0.3973238, -0.6988704, 2.07232, 1, 1, 1, 1, 1,
0.3975565, 0.8966053, -0.2676648, 1, 1, 1, 1, 1,
0.4022828, -0.6831912, 4.472042, 1, 1, 1, 1, 1,
0.4027479, -1.286048, 1.822298, 1, 1, 1, 1, 1,
0.4032303, -2.083698, 3.849501, 1, 1, 1, 1, 1,
0.4042996, -1.054275, 2.04556, 0, 0, 1, 1, 1,
0.4130925, 1.098516, 1.667325, 1, 0, 0, 1, 1,
0.4187221, -0.6179336, 2.07352, 1, 0, 0, 1, 1,
0.4231373, -0.2762098, 2.673906, 1, 0, 0, 1, 1,
0.4298281, 0.2534316, -0.6533262, 1, 0, 0, 1, 1,
0.4323467, -0.759232, 3.319776, 1, 0, 0, 1, 1,
0.4333054, -0.1891073, 1.190518, 0, 0, 0, 1, 1,
0.4350416, -0.6883733, 3.643835, 0, 0, 0, 1, 1,
0.4365688, 0.1782776, 1.775294, 0, 0, 0, 1, 1,
0.4385935, 0.3897451, 3.254839, 0, 0, 0, 1, 1,
0.4420207, 0.02896768, 1.639066, 0, 0, 0, 1, 1,
0.4471722, 0.439803, 0.2093283, 0, 0, 0, 1, 1,
0.4486334, -0.4978661, 2.876012, 0, 0, 0, 1, 1,
0.4492691, -1.236114, 2.146024, 1, 1, 1, 1, 1,
0.4587419, -0.696234, 2.754311, 1, 1, 1, 1, 1,
0.4661874, 1.06314, -0.6244411, 1, 1, 1, 1, 1,
0.4680511, -1.85439, 2.713399, 1, 1, 1, 1, 1,
0.4693238, -1.115245, 2.495487, 1, 1, 1, 1, 1,
0.4718008, 0.4109202, -0.1161966, 1, 1, 1, 1, 1,
0.4738562, -0.5911474, 2.243982, 1, 1, 1, 1, 1,
0.4751724, -0.00564089, 2.375342, 1, 1, 1, 1, 1,
0.4752628, 0.2754657, 0.6070604, 1, 1, 1, 1, 1,
0.4784117, 0.8220896, 1.121745, 1, 1, 1, 1, 1,
0.4792809, 0.5774712, 1.970784, 1, 1, 1, 1, 1,
0.4811585, -0.799167, 2.289442, 1, 1, 1, 1, 1,
0.4837667, -0.9743084, 2.578605, 1, 1, 1, 1, 1,
0.4939696, -1.265917, 2.380215, 1, 1, 1, 1, 1,
0.5004581, -1.486782, 4.145025, 1, 1, 1, 1, 1,
0.5027232, -1.403613, 3.584171, 0, 0, 1, 1, 1,
0.5043465, 1.366584, 0.9412786, 1, 0, 0, 1, 1,
0.5053077, 0.1199038, 0.2280353, 1, 0, 0, 1, 1,
0.5059964, 0.2632997, 1.434604, 1, 0, 0, 1, 1,
0.5078524, 0.7154318, 0.9084566, 1, 0, 0, 1, 1,
0.5088536, 0.37502, 1.056015, 1, 0, 0, 1, 1,
0.5109891, 1.769159, -1.902932, 0, 0, 0, 1, 1,
0.5130355, 0.7734495, 0.05586903, 0, 0, 0, 1, 1,
0.5172442, 1.138241, 1.041592, 0, 0, 0, 1, 1,
0.517961, -0.3036085, 2.416361, 0, 0, 0, 1, 1,
0.5201958, 0.204262, 1.647602, 0, 0, 0, 1, 1,
0.5229235, 0.8499692, 0.02397591, 0, 0, 0, 1, 1,
0.5229425, -0.8352145, 1.534215, 0, 0, 0, 1, 1,
0.524168, -1.36801, 2.355348, 1, 1, 1, 1, 1,
0.5264265, -1.965496, 2.759864, 1, 1, 1, 1, 1,
0.5316314, -1.143532, 4.341519, 1, 1, 1, 1, 1,
0.53841, -0.7614296, 1.374771, 1, 1, 1, 1, 1,
0.5406736, -0.07558632, 0.4331947, 1, 1, 1, 1, 1,
0.5437884, -1.590832, 3.559876, 1, 1, 1, 1, 1,
0.5447401, -0.2389657, 2.619316, 1, 1, 1, 1, 1,
0.5553311, -0.02497417, 1.15655, 1, 1, 1, 1, 1,
0.5558443, -2.07133, 1.605953, 1, 1, 1, 1, 1,
0.5636377, 0.5282325, 0.8786536, 1, 1, 1, 1, 1,
0.5652401, -0.4189422, 2.012703, 1, 1, 1, 1, 1,
0.5676732, -1.448374, 3.267835, 1, 1, 1, 1, 1,
0.581524, -0.3040958, 2.61059, 1, 1, 1, 1, 1,
0.5855154, -1.800299, 1.844372, 1, 1, 1, 1, 1,
0.5860567, -1.878239, 2.925797, 1, 1, 1, 1, 1,
0.5863862, -0.7252111, 3.115311, 0, 0, 1, 1, 1,
0.5864092, -1.324753, 3.315921, 1, 0, 0, 1, 1,
0.5944037, 0.1503571, 0.094952, 1, 0, 0, 1, 1,
0.5980967, -0.351909, 2.85942, 1, 0, 0, 1, 1,
0.5999758, -1.610862, 2.392319, 1, 0, 0, 1, 1,
0.6026482, 0.03529788, 3.163752, 1, 0, 0, 1, 1,
0.6034972, 1.826536, 0.9840186, 0, 0, 0, 1, 1,
0.605458, -2.620732, 2.690744, 0, 0, 0, 1, 1,
0.6149732, -1.607902, 3.087302, 0, 0, 0, 1, 1,
0.6151204, 1.000178, -0.4268315, 0, 0, 0, 1, 1,
0.6227693, -0.005985657, 1.900504, 0, 0, 0, 1, 1,
0.6276342, 0.3704076, -1.604667, 0, 0, 0, 1, 1,
0.6309112, 1.062558, 0.07996546, 0, 0, 0, 1, 1,
0.6316329, -1.031123, 1.559183, 1, 1, 1, 1, 1,
0.6383, -1.515089, 0.941793, 1, 1, 1, 1, 1,
0.641224, -0.08849831, 2.736836, 1, 1, 1, 1, 1,
0.6484949, 2.213474, -0.4959963, 1, 1, 1, 1, 1,
0.6506681, -1.121035, 0.8140293, 1, 1, 1, 1, 1,
0.6510838, -0.1857925, 1.351977, 1, 1, 1, 1, 1,
0.6511202, -1.080716, 2.748456, 1, 1, 1, 1, 1,
0.6533014, -0.3741169, 2.633619, 1, 1, 1, 1, 1,
0.6558591, 0.9154492, 0.354143, 1, 1, 1, 1, 1,
0.6592547, 1.748425, -1.05696, 1, 1, 1, 1, 1,
0.6592613, 0.5799196, 2.468503, 1, 1, 1, 1, 1,
0.667602, -0.9692634, 2.625574, 1, 1, 1, 1, 1,
0.6678849, -0.3902085, 2.651799, 1, 1, 1, 1, 1,
0.669197, 1.372377, 1.94814, 1, 1, 1, 1, 1,
0.677356, 0.303868, 1.336642, 1, 1, 1, 1, 1,
0.6779, -0.4457105, 2.498584, 0, 0, 1, 1, 1,
0.6794709, 0.117573, 0.4660752, 1, 0, 0, 1, 1,
0.6840543, -0.9681455, 2.605372, 1, 0, 0, 1, 1,
0.6917682, 1.766924, 0.3226629, 1, 0, 0, 1, 1,
0.6920349, -2.123486, 2.768502, 1, 0, 0, 1, 1,
0.6925713, -0.08722983, 1.899322, 1, 0, 0, 1, 1,
0.6928786, -0.2908135, 1.316563, 0, 0, 0, 1, 1,
0.6952219, 0.4281467, -0.2122485, 0, 0, 0, 1, 1,
0.695241, 1.238925, 2.002145, 0, 0, 0, 1, 1,
0.6960073, -0.1164813, 1.943812, 0, 0, 0, 1, 1,
0.6963058, 0.04893039, 1.810917, 0, 0, 0, 1, 1,
0.6967981, -0.1881745, 1.3397, 0, 0, 0, 1, 1,
0.7009008, -0.3342934, 1.296436, 0, 0, 0, 1, 1,
0.7052143, 1.711876, -1.094551, 1, 1, 1, 1, 1,
0.7058343, 0.7932559, 1.989088, 1, 1, 1, 1, 1,
0.7068775, -0.2472219, 3.458693, 1, 1, 1, 1, 1,
0.7070211, -1.862194, 4.734068, 1, 1, 1, 1, 1,
0.7075069, 0.06013835, 1.271348, 1, 1, 1, 1, 1,
0.7102921, -1.583617, 0.6449939, 1, 1, 1, 1, 1,
0.715792, 1.690982, 0.3007775, 1, 1, 1, 1, 1,
0.7192618, -1.749986, 2.815747, 1, 1, 1, 1, 1,
0.7218757, 1.749889, 1.486401, 1, 1, 1, 1, 1,
0.7243847, -0.07087606, 1.136253, 1, 1, 1, 1, 1,
0.7273281, -0.2275126, 1.465698, 1, 1, 1, 1, 1,
0.7282244, -1.080638, 2.95304, 1, 1, 1, 1, 1,
0.7293805, -0.2462621, 0.8440286, 1, 1, 1, 1, 1,
0.7298008, 0.7199962, 2.374221, 1, 1, 1, 1, 1,
0.7302746, 0.9637951, -0.2989371, 1, 1, 1, 1, 1,
0.7414942, -1.20774, 3.757907, 0, 0, 1, 1, 1,
0.7423902, 0.8521613, 0.5121051, 1, 0, 0, 1, 1,
0.7429233, 1.09181, 2.283161, 1, 0, 0, 1, 1,
0.744844, -1.876418, 3.77103, 1, 0, 0, 1, 1,
0.7452039, 1.370592, 0.1829513, 1, 0, 0, 1, 1,
0.747088, -0.144761, 0.5302011, 1, 0, 0, 1, 1,
0.7477547, -0.8698257, 2.642548, 0, 0, 0, 1, 1,
0.7512705, -1.331621, 1.530336, 0, 0, 0, 1, 1,
0.7513772, 0.9001704, -1.699045, 0, 0, 0, 1, 1,
0.7527838, 0.3070412, 0.8512941, 0, 0, 0, 1, 1,
0.7557722, -0.1301681, 1.49236, 0, 0, 0, 1, 1,
0.7589127, -1.320458, 4.837832, 0, 0, 0, 1, 1,
0.7598898, -0.008067906, 0.1033574, 0, 0, 0, 1, 1,
0.7600871, -0.06382536, 0.7116764, 1, 1, 1, 1, 1,
0.7606136, 0.322803, 1.681409, 1, 1, 1, 1, 1,
0.7624929, 1.943741, 0.3236255, 1, 1, 1, 1, 1,
0.7666476, -1.42797, 1.177692, 1, 1, 1, 1, 1,
0.7766544, -0.3918665, 2.729598, 1, 1, 1, 1, 1,
0.7824941, -0.6323484, 1.733324, 1, 1, 1, 1, 1,
0.7843451, -1.05757, 1.546185, 1, 1, 1, 1, 1,
0.8013613, 0.2471005, 0.6859049, 1, 1, 1, 1, 1,
0.8101771, -0.1865556, 2.001182, 1, 1, 1, 1, 1,
0.8104172, -0.04976054, 1.187994, 1, 1, 1, 1, 1,
0.8135374, 0.5018133, 1.034715, 1, 1, 1, 1, 1,
0.8211602, -0.3640871, 1.973053, 1, 1, 1, 1, 1,
0.8323461, 0.521888, 0.6181632, 1, 1, 1, 1, 1,
0.8430309, 0.3524092, 1.545636, 1, 1, 1, 1, 1,
0.8464513, 0.5786324, 1.42282, 1, 1, 1, 1, 1,
0.856837, -0.2196461, 3.320674, 0, 0, 1, 1, 1,
0.863427, 0.4079952, 0.5783255, 1, 0, 0, 1, 1,
0.8644681, -0.653495, 2.955504, 1, 0, 0, 1, 1,
0.8656919, -0.2230092, 0.9877319, 1, 0, 0, 1, 1,
0.8667904, 1.091439, 0.2685693, 1, 0, 0, 1, 1,
0.8692856, -0.3120069, 3.830721, 1, 0, 0, 1, 1,
0.8695326, -2.198052, 3.351437, 0, 0, 0, 1, 1,
0.8755457, -2.099195, 2.556496, 0, 0, 0, 1, 1,
0.8767812, 1.03188, 0.6147238, 0, 0, 0, 1, 1,
0.878971, 0.5403569, 1.6103, 0, 0, 0, 1, 1,
0.8800259, -1.53087, 1.09513, 0, 0, 0, 1, 1,
0.8802427, 0.4758533, 1.20568, 0, 0, 0, 1, 1,
0.8825226, 0.9033429, 2.115581, 0, 0, 0, 1, 1,
0.8850955, -2.061157, 3.221411, 1, 1, 1, 1, 1,
0.8924487, -1.082247, 0.5294026, 1, 1, 1, 1, 1,
0.8925428, 0.692057, 1.405162, 1, 1, 1, 1, 1,
0.8942249, 1.560301, -0.4178371, 1, 1, 1, 1, 1,
0.8949101, 0.4393, 0.997116, 1, 1, 1, 1, 1,
0.8954024, 0.6534518, 3.246422, 1, 1, 1, 1, 1,
0.901944, 1.586199, 0.2742346, 1, 1, 1, 1, 1,
0.9036177, 0.1038728, 0.2762896, 1, 1, 1, 1, 1,
0.9211245, 0.936659, -0.07334822, 1, 1, 1, 1, 1,
0.9223229, 0.4435924, 0.1309507, 1, 1, 1, 1, 1,
0.922827, 0.5228945, 0.7566293, 1, 1, 1, 1, 1,
0.9270757, -0.6795371, 2.508924, 1, 1, 1, 1, 1,
0.9477754, -0.3987626, 0.6930571, 1, 1, 1, 1, 1,
0.9515569, -0.327835, -0.202513, 1, 1, 1, 1, 1,
0.9527844, 0.5448959, 0.6855358, 1, 1, 1, 1, 1,
0.9538739, 1.088148, 0.3487501, 0, 0, 1, 1, 1,
0.9544289, 1.025512, 1.275112, 1, 0, 0, 1, 1,
0.9581881, -0.16805, 1.183486, 1, 0, 0, 1, 1,
0.9651308, 1.268167, -0.2410371, 1, 0, 0, 1, 1,
0.9702936, -1.536233, 2.561449, 1, 0, 0, 1, 1,
0.9777818, 0.4457649, 1.860915, 1, 0, 0, 1, 1,
0.9802063, -0.8469479, 1.386038, 0, 0, 0, 1, 1,
0.9907781, -0.3592176, 3.65509, 0, 0, 0, 1, 1,
0.9939331, -1.327188, 3.061596, 0, 0, 0, 1, 1,
0.9961613, -0.1136453, 3.007304, 0, 0, 0, 1, 1,
1.019781, -1.509539, 3.422679, 0, 0, 0, 1, 1,
1.022563, -0.2177639, 2.872382, 0, 0, 0, 1, 1,
1.030703, -0.05981647, 0.8923975, 0, 0, 0, 1, 1,
1.03257, 0.6795691, 0.4752604, 1, 1, 1, 1, 1,
1.032949, -2.240542, 3.190804, 1, 1, 1, 1, 1,
1.033741, -0.384792, 1.14662, 1, 1, 1, 1, 1,
1.038474, -0.1870804, 2.564246, 1, 1, 1, 1, 1,
1.040532, -0.4590211, 3.011194, 1, 1, 1, 1, 1,
1.045554, 2.702729, -0.8028551, 1, 1, 1, 1, 1,
1.061258, -1.810935, 2.490917, 1, 1, 1, 1, 1,
1.063933, -1.452443, 0.4746169, 1, 1, 1, 1, 1,
1.069028, -1.95035, 1.605716, 1, 1, 1, 1, 1,
1.076975, -1.523954, 3.867524, 1, 1, 1, 1, 1,
1.077009, -0.2809618, 0.8257973, 1, 1, 1, 1, 1,
1.078979, 0.2002679, 1.146967, 1, 1, 1, 1, 1,
1.085056, -0.4389631, 2.737014, 1, 1, 1, 1, 1,
1.088091, 0.5102798, -0.3848318, 1, 1, 1, 1, 1,
1.088973, 0.2822, 1.312645, 1, 1, 1, 1, 1,
1.093098, 0.5849676, 1.271823, 0, 0, 1, 1, 1,
1.100256, -0.6372738, 2.171748, 1, 0, 0, 1, 1,
1.103769, -0.3720527, 2.737152, 1, 0, 0, 1, 1,
1.11836, 0.07628109, 1.468968, 1, 0, 0, 1, 1,
1.130437, -0.1567952, 1.960259, 1, 0, 0, 1, 1,
1.131217, 0.6274925, 0.8727267, 1, 0, 0, 1, 1,
1.139646, 0.704004, 1.058298, 0, 0, 0, 1, 1,
1.14311, 0.2370796, 0.7903568, 0, 0, 0, 1, 1,
1.143891, 0.4596327, 3.14791, 0, 0, 0, 1, 1,
1.14447, -0.004165069, 3.837388, 0, 0, 0, 1, 1,
1.148636, -0.3695473, 1.927889, 0, 0, 0, 1, 1,
1.154929, -1.19149, 2.245643, 0, 0, 0, 1, 1,
1.159635, -1.170977, 1.690068, 0, 0, 0, 1, 1,
1.197598, -1.539418, 2.780495, 1, 1, 1, 1, 1,
1.199916, 1.640982, -0.7998693, 1, 1, 1, 1, 1,
1.20242, -1.882004, 2.668791, 1, 1, 1, 1, 1,
1.204259, -1.387584, 3.669458, 1, 1, 1, 1, 1,
1.209017, -0.6434228, 1.395178, 1, 1, 1, 1, 1,
1.217769, -0.4070787, 2.141107, 1, 1, 1, 1, 1,
1.226148, 0.6905423, 0.6703359, 1, 1, 1, 1, 1,
1.249833, 0.3744128, 1.163636, 1, 1, 1, 1, 1,
1.249896, -0.1895097, 1.600905, 1, 1, 1, 1, 1,
1.250889, -0.596852, 1.420575, 1, 1, 1, 1, 1,
1.260959, -0.5370867, 0.956906, 1, 1, 1, 1, 1,
1.262161, -1.425514, 4.649587, 1, 1, 1, 1, 1,
1.26789, 0.219158, 1.539895, 1, 1, 1, 1, 1,
1.273066, 0.5219629, 0.2492801, 1, 1, 1, 1, 1,
1.274586, -1.489658, 3.103666, 1, 1, 1, 1, 1,
1.281314, -1.299173, 2.080322, 0, 0, 1, 1, 1,
1.284307, -1.163039, 3.020708, 1, 0, 0, 1, 1,
1.301485, 0.8864269, 2.546611, 1, 0, 0, 1, 1,
1.303162, 0.08829556, 1.046427, 1, 0, 0, 1, 1,
1.303587, -1.521954, 1.899767, 1, 0, 0, 1, 1,
1.306533, -0.3486986, 2.618015, 1, 0, 0, 1, 1,
1.309727, -1.055397, 2.461616, 0, 0, 0, 1, 1,
1.311896, -1.55425, 0.4852692, 0, 0, 0, 1, 1,
1.314591, -1.028382, 0.4495919, 0, 0, 0, 1, 1,
1.314832, -0.3927569, 1.864579, 0, 0, 0, 1, 1,
1.323036, 2.258579, 1.281861, 0, 0, 0, 1, 1,
1.324292, 1.149063, -0.06967169, 0, 0, 0, 1, 1,
1.32795, -0.6880103, 1.796496, 0, 0, 0, 1, 1,
1.354311, 0.1305022, 0.4238131, 1, 1, 1, 1, 1,
1.354729, -0.7116473, 1.320635, 1, 1, 1, 1, 1,
1.361963, -0.6855112, 1.019722, 1, 1, 1, 1, 1,
1.370066, 1.698666, 2.61586, 1, 1, 1, 1, 1,
1.372161, 0.7948378, 0.8079587, 1, 1, 1, 1, 1,
1.376966, -0.5925368, 1.449306, 1, 1, 1, 1, 1,
1.380991, 0.5315574, 1.6281, 1, 1, 1, 1, 1,
1.392452, -1.116545, 0.8272256, 1, 1, 1, 1, 1,
1.393601, -1.087331, 1.465073, 1, 1, 1, 1, 1,
1.394383, -1.312935, 2.049104, 1, 1, 1, 1, 1,
1.39902, -0.7212005, 1.774782, 1, 1, 1, 1, 1,
1.406765, -0.3101082, 1.239511, 1, 1, 1, 1, 1,
1.422051, 1.401405, 0.4432913, 1, 1, 1, 1, 1,
1.429403, -0.4250926, 0.9413173, 1, 1, 1, 1, 1,
1.435117, -0.209111, 1.091122, 1, 1, 1, 1, 1,
1.436824, 0.5801954, 0.9394109, 0, 0, 1, 1, 1,
1.446457, 1.475179, 3.165055, 1, 0, 0, 1, 1,
1.45614, -2.057173, 3.895571, 1, 0, 0, 1, 1,
1.461923, -0.3725214, 2.631986, 1, 0, 0, 1, 1,
1.480369, 0.490075, 0.04356373, 1, 0, 0, 1, 1,
1.491487, -1.984547, 1.986245, 1, 0, 0, 1, 1,
1.499273, -0.1412223, 2.700082, 0, 0, 0, 1, 1,
1.520933, 1.028551, 3.147802, 0, 0, 0, 1, 1,
1.521716, -2.127753, 0.7102231, 0, 0, 0, 1, 1,
1.539476, -2.664708, 2.929238, 0, 0, 0, 1, 1,
1.546777, 0.611399, -0.8267611, 0, 0, 0, 1, 1,
1.548362, 0.5323245, -1.048371, 0, 0, 0, 1, 1,
1.548463, -0.8637097, 1.753163, 0, 0, 0, 1, 1,
1.549295, 1.946649, 0.1108118, 1, 1, 1, 1, 1,
1.550833, -0.4541942, 0.5649971, 1, 1, 1, 1, 1,
1.588615, 0.8293038, 1.858532, 1, 1, 1, 1, 1,
1.592937, 0.7312794, 2.828512, 1, 1, 1, 1, 1,
1.595278, -0.8266571, 3.16562, 1, 1, 1, 1, 1,
1.598111, 1.926141, 1.09063, 1, 1, 1, 1, 1,
1.612315, 1.104293, 1.717488, 1, 1, 1, 1, 1,
1.613734, 0.2893453, 0.1685561, 1, 1, 1, 1, 1,
1.618801, -0.4260742, 2.724433, 1, 1, 1, 1, 1,
1.61923, 0.1476602, 1.99814, 1, 1, 1, 1, 1,
1.620372, 1.433107, 1.114676, 1, 1, 1, 1, 1,
1.627466, 0.4868617, 1.218545, 1, 1, 1, 1, 1,
1.658112, 0.4776799, 0.4089871, 1, 1, 1, 1, 1,
1.668391, -2.298743, 1.631068, 1, 1, 1, 1, 1,
1.674859, -0.08990896, 1.047074, 1, 1, 1, 1, 1,
1.685713, -0.9244998, 2.933427, 0, 0, 1, 1, 1,
1.718807, -0.3335043, 2.073843, 1, 0, 0, 1, 1,
1.721433, 1.023155, 2.192373, 1, 0, 0, 1, 1,
1.728725, 0.8153439, 1.399983, 1, 0, 0, 1, 1,
1.735905, -0.4315286, 1.499335, 1, 0, 0, 1, 1,
1.745643, 0.2045787, 0.5865417, 1, 0, 0, 1, 1,
1.748752, 1.544804, -0.9932416, 0, 0, 0, 1, 1,
1.751747, 0.2421012, 1.108873, 0, 0, 0, 1, 1,
1.768171, 0.0416895, 1.010935, 0, 0, 0, 1, 1,
1.773893, -0.3645161, 0.2586707, 0, 0, 0, 1, 1,
1.778925, -0.4545809, 1.385177, 0, 0, 0, 1, 1,
1.796893, -1.079718, 1.719383, 0, 0, 0, 1, 1,
1.802275, -0.9574932, 2.196484, 0, 0, 0, 1, 1,
1.815091, 0.1742103, 4.01222, 1, 1, 1, 1, 1,
1.850383, -1.559707, 3.322367, 1, 1, 1, 1, 1,
1.855688, -0.2022513, 1.974411, 1, 1, 1, 1, 1,
1.865003, -1.740323, 2.493059, 1, 1, 1, 1, 1,
1.866917, 1.123064, -0.438157, 1, 1, 1, 1, 1,
1.891565, -1.133848, 1.353019, 1, 1, 1, 1, 1,
1.893278, -0.7237257, 1.250081, 1, 1, 1, 1, 1,
1.91297, 0.4920168, 2.084503, 1, 1, 1, 1, 1,
1.94418, -1.171727, 1.351847, 1, 1, 1, 1, 1,
2.030771, 0.06908645, 2.078804, 1, 1, 1, 1, 1,
2.031447, 0.8934649, 1.503501, 1, 1, 1, 1, 1,
2.032576, -0.6467814, 3.305564, 1, 1, 1, 1, 1,
2.042419, -1.328314, 3.004303, 1, 1, 1, 1, 1,
2.110358, 0.6080149, 0.654143, 1, 1, 1, 1, 1,
2.11778, 0.2043594, 2.228919, 1, 1, 1, 1, 1,
2.132758, 1.021376, 2.062791, 0, 0, 1, 1, 1,
2.136693, -0.1457437, 0.03160472, 1, 0, 0, 1, 1,
2.143773, -0.2439569, 1.474671, 1, 0, 0, 1, 1,
2.16861, 0.9501801, 1.58099, 1, 0, 0, 1, 1,
2.178797, -1.953595, 0.8953568, 1, 0, 0, 1, 1,
2.21234, 0.3782074, -0.4029834, 1, 0, 0, 1, 1,
2.297576, 0.4019109, 3.078752, 0, 0, 0, 1, 1,
2.306393, 0.5255615, 0.001475149, 0, 0, 0, 1, 1,
2.307337, 0.7590544, 1.485914, 0, 0, 0, 1, 1,
2.356392, 1.025028, -0.2524014, 0, 0, 0, 1, 1,
2.430672, 0.8326007, 0.9710574, 0, 0, 0, 1, 1,
2.431984, 1.501707, 2.651981, 0, 0, 0, 1, 1,
2.444666, 0.7281015, 2.148445, 0, 0, 0, 1, 1,
2.493993, -0.6314662, 0.2321453, 1, 1, 1, 1, 1,
2.589286, 0.6823589, 2.57186, 1, 1, 1, 1, 1,
2.628207, 0.4459634, 0.8149236, 1, 1, 1, 1, 1,
2.657435, -0.4111212, 1.677768, 1, 1, 1, 1, 1,
2.672816, 1.039069, 1.392362, 1, 1, 1, 1, 1,
2.90342, 1.740863, 1.27781, 1, 1, 1, 1, 1,
3.044815, 0.2250168, 1.293215, 1, 1, 1, 1, 1
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
var radius = 9.963038;
var distance = 34.99474;
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
mvMatrix.translate( 0.06613302, -0.3760481, 0.404464 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.99474);
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