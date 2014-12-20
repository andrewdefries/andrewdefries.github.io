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
-3.301013, 0.7028531, -2.633667, 1, 0, 0, 1,
-2.92122, 0.2898951, -0.4800827, 1, 0.007843138, 0, 1,
-2.476482, -0.6437476, -1.396744, 1, 0.01176471, 0, 1,
-2.456455, 1.041817, -0.5106298, 1, 0.01960784, 0, 1,
-2.417415, -0.2309807, -3.796005, 1, 0.02352941, 0, 1,
-2.337196, 1.155968, -2.738009, 1, 0.03137255, 0, 1,
-2.32984, -0.5246702, -1.324022, 1, 0.03529412, 0, 1,
-2.322881, -0.3737183, -1.640165, 1, 0.04313726, 0, 1,
-2.277171, 1.230076, -0.4146234, 1, 0.04705882, 0, 1,
-2.235907, 0.5814618, -1.478058, 1, 0.05490196, 0, 1,
-2.230026, 0.5974817, 0.3508992, 1, 0.05882353, 0, 1,
-2.192816, -0.9045174, -2.475851, 1, 0.06666667, 0, 1,
-2.159525, -0.3679097, -1.586661, 1, 0.07058824, 0, 1,
-2.133283, -0.8098886, -4.121952, 1, 0.07843138, 0, 1,
-2.125126, -0.4421991, -0.8335419, 1, 0.08235294, 0, 1,
-2.089365, 0.1184249, -1.194611, 1, 0.09019608, 0, 1,
-2.088253, -0.7774373, -1.888945, 1, 0.09411765, 0, 1,
-2.040534, -0.5711504, -2.019464, 1, 0.1019608, 0, 1,
-2.036563, 0.02764126, -0.7095405, 1, 0.1098039, 0, 1,
-2.029139, -0.8180517, -1.273501, 1, 0.1137255, 0, 1,
-2.014936, -0.674169, -2.874955, 1, 0.1215686, 0, 1,
-1.995407, -0.6462479, -2.166373, 1, 0.1254902, 0, 1,
-1.994664, 1.052193, 0.2371078, 1, 0.1333333, 0, 1,
-1.957294, -0.3377851, -0.7240351, 1, 0.1372549, 0, 1,
-1.956038, 0.4083491, -1.420244, 1, 0.145098, 0, 1,
-1.947234, 0.912777, 0.7805737, 1, 0.1490196, 0, 1,
-1.923713, 0.7766144, -1.355294, 1, 0.1568628, 0, 1,
-1.921511, 2.019661, -2.927986, 1, 0.1607843, 0, 1,
-1.887926, -0.6917217, -0.8418086, 1, 0.1686275, 0, 1,
-1.842214, 1.32291, -0.08686139, 1, 0.172549, 0, 1,
-1.839605, 0.9036615, -2.898625, 1, 0.1803922, 0, 1,
-1.822144, 0.8475994, -1.169646, 1, 0.1843137, 0, 1,
-1.787032, 0.05817362, -1.02783, 1, 0.1921569, 0, 1,
-1.757305, -1.173935, -2.349756, 1, 0.1960784, 0, 1,
-1.736216, -1.269943, -2.496937, 1, 0.2039216, 0, 1,
-1.721017, 0.7836014, -0.9693033, 1, 0.2117647, 0, 1,
-1.719295, 0.8103057, -1.100666, 1, 0.2156863, 0, 1,
-1.71458, 0.08498802, -1.66361, 1, 0.2235294, 0, 1,
-1.711602, 0.491394, -0.2913686, 1, 0.227451, 0, 1,
-1.700722, 0.7437833, 0.07444269, 1, 0.2352941, 0, 1,
-1.694594, -1.615661, -2.454082, 1, 0.2392157, 0, 1,
-1.669093, 1.418875, -3.322473, 1, 0.2470588, 0, 1,
-1.664118, -1.042645, -1.587631, 1, 0.2509804, 0, 1,
-1.663696, 0.3946474, -0.9205819, 1, 0.2588235, 0, 1,
-1.655504, 0.8160691, -1.680619, 1, 0.2627451, 0, 1,
-1.619155, 1.080057, 0.4684965, 1, 0.2705882, 0, 1,
-1.615036, 0.06397165, -1.456199, 1, 0.2745098, 0, 1,
-1.611771, 1.17347, -1.994814, 1, 0.282353, 0, 1,
-1.545034, 0.8885943, -2.203267, 1, 0.2862745, 0, 1,
-1.543375, -0.4098156, -2.549997, 1, 0.2941177, 0, 1,
-1.529529, 1.381208, -1.888047, 1, 0.3019608, 0, 1,
-1.524545, -0.1134837, -2.078664, 1, 0.3058824, 0, 1,
-1.501829, 1.161885, -0.6794997, 1, 0.3137255, 0, 1,
-1.473641, -0.3979038, -1.325127, 1, 0.3176471, 0, 1,
-1.460217, 1.690029, -2.444891, 1, 0.3254902, 0, 1,
-1.445521, -0.2411786, -1.923305, 1, 0.3294118, 0, 1,
-1.44126, 0.2390728, -1.225229, 1, 0.3372549, 0, 1,
-1.407633, 0.5918953, -1.542886, 1, 0.3411765, 0, 1,
-1.403931, 0.2896644, -2.098897, 1, 0.3490196, 0, 1,
-1.382716, 0.7120751, -1.448521, 1, 0.3529412, 0, 1,
-1.380614, -0.3567215, -0.8413167, 1, 0.3607843, 0, 1,
-1.380219, -0.9376184, -2.341326, 1, 0.3647059, 0, 1,
-1.373777, 1.006665, -1.834316, 1, 0.372549, 0, 1,
-1.37321, -0.1712848, 0.01444957, 1, 0.3764706, 0, 1,
-1.352894, 1.452675, -2.008877, 1, 0.3843137, 0, 1,
-1.352225, -0.4410329, -1.48303, 1, 0.3882353, 0, 1,
-1.345897, -0.4155895, -2.016531, 1, 0.3960784, 0, 1,
-1.345805, -1.964292, -0.9684016, 1, 0.4039216, 0, 1,
-1.338064, -1.9229, -1.630004, 1, 0.4078431, 0, 1,
-1.336971, -0.9282551, -3.483225, 1, 0.4156863, 0, 1,
-1.331694, -0.7778539, -2.088271, 1, 0.4196078, 0, 1,
-1.323242, 0.1585338, -0.346735, 1, 0.427451, 0, 1,
-1.320053, -0.4858862, -1.419402, 1, 0.4313726, 0, 1,
-1.314684, -0.8145657, -1.814892, 1, 0.4392157, 0, 1,
-1.305386, -0.9065346, -2.36796, 1, 0.4431373, 0, 1,
-1.296289, 1.299717, -2.046429, 1, 0.4509804, 0, 1,
-1.292556, -0.9773871, -1.904479, 1, 0.454902, 0, 1,
-1.290722, -0.3304316, 1.085389, 1, 0.4627451, 0, 1,
-1.287026, 0.4177473, -0.2690859, 1, 0.4666667, 0, 1,
-1.2863, 0.4854762, -0.583495, 1, 0.4745098, 0, 1,
-1.282279, -1.742083, -3.583391, 1, 0.4784314, 0, 1,
-1.279876, -0.7290343, -3.47427, 1, 0.4862745, 0, 1,
-1.277046, 0.2033405, -3.524841, 1, 0.4901961, 0, 1,
-1.273302, 1.358414, 0.1069405, 1, 0.4980392, 0, 1,
-1.267111, 0.3703559, 0.08790521, 1, 0.5058824, 0, 1,
-1.265113, 0.1038315, -2.276778, 1, 0.509804, 0, 1,
-1.263363, 0.7084339, 0.009860657, 1, 0.5176471, 0, 1,
-1.262584, 0.3354272, -1.739183, 1, 0.5215687, 0, 1,
-1.245929, -1.835605, -2.106649, 1, 0.5294118, 0, 1,
-1.237939, 1.568418, -0.8091174, 1, 0.5333334, 0, 1,
-1.225001, 1.349767, -0.6663461, 1, 0.5411765, 0, 1,
-1.22421, 2.71697, 1.305999, 1, 0.5450981, 0, 1,
-1.223577, 1.271604, -1.017262, 1, 0.5529412, 0, 1,
-1.221165, 1.431879, -1.345392, 1, 0.5568628, 0, 1,
-1.21031, -2.00198, -2.666162, 1, 0.5647059, 0, 1,
-1.201018, -1.173883, -1.79924, 1, 0.5686275, 0, 1,
-1.200981, -0.6333236, -0.6957052, 1, 0.5764706, 0, 1,
-1.194894, -0.734192, -2.440849, 1, 0.5803922, 0, 1,
-1.190065, 1.416385, -0.4202056, 1, 0.5882353, 0, 1,
-1.183732, -0.8933617, -3.597904, 1, 0.5921569, 0, 1,
-1.183335, -1.033959, -1.211451, 1, 0.6, 0, 1,
-1.183151, 0.1403333, -2.139201, 1, 0.6078432, 0, 1,
-1.175328, -1.666491, -2.485904, 1, 0.6117647, 0, 1,
-1.173113, -0.4954768, -2.032974, 1, 0.6196079, 0, 1,
-1.172015, -0.6467368, 0.2534185, 1, 0.6235294, 0, 1,
-1.164724, 0.4976799, 1.325441, 1, 0.6313726, 0, 1,
-1.163159, 1.88954, -1.440602, 1, 0.6352941, 0, 1,
-1.151345, 0.3205188, -1.417144, 1, 0.6431373, 0, 1,
-1.136668, 0.2599374, -2.031734, 1, 0.6470588, 0, 1,
-1.136498, -0.02429022, -1.734266, 1, 0.654902, 0, 1,
-1.135431, -0.6500248, -1.699882, 1, 0.6588235, 0, 1,
-1.121374, 1.744009, -0.2293267, 1, 0.6666667, 0, 1,
-1.120947, -0.8468674, -2.922295, 1, 0.6705883, 0, 1,
-1.114531, -1.51623, -0.02915061, 1, 0.6784314, 0, 1,
-1.113215, 0.4616453, -1.504004, 1, 0.682353, 0, 1,
-1.106339, 0.6588345, -0.06247612, 1, 0.6901961, 0, 1,
-1.104376, -0.3536376, -2.490536, 1, 0.6941177, 0, 1,
-1.101957, 0.9263881, 0.2168956, 1, 0.7019608, 0, 1,
-1.09259, -0.936402, -1.577967, 1, 0.7098039, 0, 1,
-1.079833, -3.019435, -2.552229, 1, 0.7137255, 0, 1,
-1.073905, 1.633053, -2.088962, 1, 0.7215686, 0, 1,
-1.071645, 2.228059, 0.9165879, 1, 0.7254902, 0, 1,
-1.063782, 1.398202, 1.004959, 1, 0.7333333, 0, 1,
-1.063575, 1.702239, -0.3384191, 1, 0.7372549, 0, 1,
-1.061032, 0.1981038, 0.2066461, 1, 0.7450981, 0, 1,
-1.056264, -0.5393206, -1.684878, 1, 0.7490196, 0, 1,
-1.055399, 1.108511, -0.6473219, 1, 0.7568628, 0, 1,
-1.046724, 0.2514226, -1.274241, 1, 0.7607843, 0, 1,
-1.038612, 0.8783982, -0.0256183, 1, 0.7686275, 0, 1,
-1.020827, 2.39041, 0.2841451, 1, 0.772549, 0, 1,
-1.019868, 1.185988, 0.9973843, 1, 0.7803922, 0, 1,
-1.019639, -0.4706396, -2.268956, 1, 0.7843137, 0, 1,
-1.017745, 0.489296, -0.9321065, 1, 0.7921569, 0, 1,
-1.016623, -1.874831, -3.076789, 1, 0.7960784, 0, 1,
-1.016071, 0.3916714, 0.4934289, 1, 0.8039216, 0, 1,
-1.012766, -1.607191, -3.424838, 1, 0.8117647, 0, 1,
-1.007615, -1.196985, -4.136629, 1, 0.8156863, 0, 1,
-1.007506, -0.8450143, -0.5881437, 1, 0.8235294, 0, 1,
-1.004095, -0.06947795, -2.174299, 1, 0.827451, 0, 1,
-0.9992766, 0.04840421, -2.470967, 1, 0.8352941, 0, 1,
-0.9963663, -1.000333, -1.055011, 1, 0.8392157, 0, 1,
-0.9957786, -0.5558376, -1.771802, 1, 0.8470588, 0, 1,
-0.9947585, 0.7346073, -1.27405, 1, 0.8509804, 0, 1,
-0.9918298, -0.6011451, -3.607521, 1, 0.8588235, 0, 1,
-0.986218, 1.898475, 0.6425215, 1, 0.8627451, 0, 1,
-0.9829018, -0.3598731, -1.922738, 1, 0.8705882, 0, 1,
-0.9773502, -0.1505307, -1.718964, 1, 0.8745098, 0, 1,
-0.9768552, -0.8351512, -1.879868, 1, 0.8823529, 0, 1,
-0.9702677, -0.3531931, -3.768391, 1, 0.8862745, 0, 1,
-0.9638489, -1.149555, -1.447624, 1, 0.8941177, 0, 1,
-0.9635754, -0.9309897, -2.581697, 1, 0.8980392, 0, 1,
-0.9635584, -1.107727, -3.694295, 1, 0.9058824, 0, 1,
-0.9618663, 0.5708826, -2.316286, 1, 0.9137255, 0, 1,
-0.9540086, 0.7241018, -0.9345018, 1, 0.9176471, 0, 1,
-0.9473636, -0.6757016, -2.029382, 1, 0.9254902, 0, 1,
-0.9427643, 0.2169293, -2.52986, 1, 0.9294118, 0, 1,
-0.939213, -1.793759, -2.823595, 1, 0.9372549, 0, 1,
-0.9348335, 0.08796932, -1.456099, 1, 0.9411765, 0, 1,
-0.9339131, -0.3783207, -2.737221, 1, 0.9490196, 0, 1,
-0.9338741, 1.630802, -0.1009737, 1, 0.9529412, 0, 1,
-0.9300737, 0.6163687, -1.387092, 1, 0.9607843, 0, 1,
-0.9299954, -1.154592, -2.224015, 1, 0.9647059, 0, 1,
-0.9257385, 0.5425614, -2.759266, 1, 0.972549, 0, 1,
-0.9238489, -0.7910714, -1.814619, 1, 0.9764706, 0, 1,
-0.9203106, -0.7290642, -2.873384, 1, 0.9843137, 0, 1,
-0.9174043, -0.9185914, -1.305135, 1, 0.9882353, 0, 1,
-0.9167037, -1.080371, -3.217388, 1, 0.9960784, 0, 1,
-0.9137878, 0.903069, -0.6595287, 0.9960784, 1, 0, 1,
-0.9134433, -2.390676, -3.825218, 0.9921569, 1, 0, 1,
-0.9084775, 0.7726213, 0.2383795, 0.9843137, 1, 0, 1,
-0.9048943, -0.5891265, -1.1496, 0.9803922, 1, 0, 1,
-0.9047455, 0.06909002, -1.996804, 0.972549, 1, 0, 1,
-0.9043574, 1.418086, -1.103566, 0.9686275, 1, 0, 1,
-0.9014156, 0.6013917, -1.230359, 0.9607843, 1, 0, 1,
-0.8959292, -1.206331, -0.8231957, 0.9568627, 1, 0, 1,
-0.8941146, 0.2562992, -0.855355, 0.9490196, 1, 0, 1,
-0.8908151, -0.2958614, -1.648662, 0.945098, 1, 0, 1,
-0.884181, 1.446731, 0.4414005, 0.9372549, 1, 0, 1,
-0.8782433, -1.483481, -3.058676, 0.9333333, 1, 0, 1,
-0.8681387, 0.1543281, -2.414747, 0.9254902, 1, 0, 1,
-0.8646999, 1.156016, -1.625164, 0.9215686, 1, 0, 1,
-0.8568023, 1.206108, -2.193496, 0.9137255, 1, 0, 1,
-0.8558146, -1.026299, -3.329518, 0.9098039, 1, 0, 1,
-0.8473784, 0.4042163, -1.860278, 0.9019608, 1, 0, 1,
-0.8450739, 0.5901911, -1.21284, 0.8941177, 1, 0, 1,
-0.8410006, -0.1860003, -1.729949, 0.8901961, 1, 0, 1,
-0.8380429, -1.519059, -2.999042, 0.8823529, 1, 0, 1,
-0.837068, 0.1867028, -1.095314, 0.8784314, 1, 0, 1,
-0.8368663, 0.493545, -0.7029067, 0.8705882, 1, 0, 1,
-0.835954, -1.066973, -1.90865, 0.8666667, 1, 0, 1,
-0.8344086, 0.8347971, -0.4131252, 0.8588235, 1, 0, 1,
-0.8216543, -1.538404, -2.78271, 0.854902, 1, 0, 1,
-0.8213461, -1.530424, -3.274238, 0.8470588, 1, 0, 1,
-0.8185093, 0.1784082, -1.907055, 0.8431373, 1, 0, 1,
-0.8174951, -0.001551246, -1.538909, 0.8352941, 1, 0, 1,
-0.8151275, -0.4921456, -3.083409, 0.8313726, 1, 0, 1,
-0.813782, -0.4140984, -3.33715, 0.8235294, 1, 0, 1,
-0.8105884, -0.4169358, -2.222146, 0.8196079, 1, 0, 1,
-0.8098922, 0.6518843, 1.784544, 0.8117647, 1, 0, 1,
-0.8098186, -0.08436545, -2.105952, 0.8078431, 1, 0, 1,
-0.8023123, -0.3229694, -1.32557, 0.8, 1, 0, 1,
-0.801209, -0.02479199, -2.744663, 0.7921569, 1, 0, 1,
-0.7978023, 1.161756, 0.6488647, 0.7882353, 1, 0, 1,
-0.7956398, 1.497701, -1.265671, 0.7803922, 1, 0, 1,
-0.7907397, -1.429652, -3.567582, 0.7764706, 1, 0, 1,
-0.7903146, -1.089659, -2.46193, 0.7686275, 1, 0, 1,
-0.7784419, -0.5835814, -0.6003554, 0.7647059, 1, 0, 1,
-0.7770266, 0.1943328, -1.426853, 0.7568628, 1, 0, 1,
-0.7759006, 1.02161, -0.04348215, 0.7529412, 1, 0, 1,
-0.775658, -0.3655435, -3.125104, 0.7450981, 1, 0, 1,
-0.7747082, 0.4997679, -1.012122, 0.7411765, 1, 0, 1,
-0.7714566, -0.3353623, -0.7059532, 0.7333333, 1, 0, 1,
-0.7714544, -0.8664228, -2.540253, 0.7294118, 1, 0, 1,
-0.7713063, -0.07865819, -2.064849, 0.7215686, 1, 0, 1,
-0.7699689, -0.1366028, -2.117584, 0.7176471, 1, 0, 1,
-0.7574779, -0.07778362, -2.206181, 0.7098039, 1, 0, 1,
-0.75678, -0.3013008, -1.353892, 0.7058824, 1, 0, 1,
-0.7509248, -0.6831739, -3.317034, 0.6980392, 1, 0, 1,
-0.7497919, 0.115486, -2.992784, 0.6901961, 1, 0, 1,
-0.7445745, -0.2319316, -2.796242, 0.6862745, 1, 0, 1,
-0.7414979, -2.847035, -1.957574, 0.6784314, 1, 0, 1,
-0.7409522, -1.005584, -2.217267, 0.6745098, 1, 0, 1,
-0.7400768, -1.739669, -2.475634, 0.6666667, 1, 0, 1,
-0.7367617, 0.7712401, -0.5635304, 0.6627451, 1, 0, 1,
-0.724403, 1.752901, -1.478926, 0.654902, 1, 0, 1,
-0.7199636, 2.106849, 0.8516858, 0.6509804, 1, 0, 1,
-0.7079689, 0.2735018, -1.071626, 0.6431373, 1, 0, 1,
-0.7058505, 1.001125, -2.373679, 0.6392157, 1, 0, 1,
-0.7052181, -2.246233, -2.548103, 0.6313726, 1, 0, 1,
-0.6987176, 0.7440396, -3.133989, 0.627451, 1, 0, 1,
-0.6980544, -0.09857299, -3.381015, 0.6196079, 1, 0, 1,
-0.6924544, 0.3138856, -0.3585337, 0.6156863, 1, 0, 1,
-0.688009, 0.8038521, 0.002795477, 0.6078432, 1, 0, 1,
-0.6789019, 0.6389153, -0.4165083, 0.6039216, 1, 0, 1,
-0.6757807, 1.249095, -0.4314928, 0.5960785, 1, 0, 1,
-0.6722612, 0.2796817, 0.1758647, 0.5882353, 1, 0, 1,
-0.6705315, -0.7501556, -2.608801, 0.5843138, 1, 0, 1,
-0.6625648, -0.02423456, -1.891019, 0.5764706, 1, 0, 1,
-0.6515588, 1.211754, -1.89839, 0.572549, 1, 0, 1,
-0.6510143, -1.580428, -3.307985, 0.5647059, 1, 0, 1,
-0.6506895, 0.7351988, -1.941037, 0.5607843, 1, 0, 1,
-0.648987, 0.6561095, 0.1842198, 0.5529412, 1, 0, 1,
-0.646544, 1.15893, -0.5372382, 0.5490196, 1, 0, 1,
-0.6451933, 1.691899, -1.554282, 0.5411765, 1, 0, 1,
-0.6405342, 0.381661, -2.255973, 0.5372549, 1, 0, 1,
-0.6378411, 0.6737456, -0.04823793, 0.5294118, 1, 0, 1,
-0.6340549, -0.4437345, -2.161554, 0.5254902, 1, 0, 1,
-0.6335774, -1.037096, -3.739748, 0.5176471, 1, 0, 1,
-0.6284755, -0.9729634, -3.027896, 0.5137255, 1, 0, 1,
-0.6260815, -0.8836983, -3.865253, 0.5058824, 1, 0, 1,
-0.6251436, 0.8762751, 1.273739, 0.5019608, 1, 0, 1,
-0.6211171, -0.2180652, -1.851721, 0.4941176, 1, 0, 1,
-0.6187766, 0.521813, 0.05752709, 0.4862745, 1, 0, 1,
-0.6154372, 1.710958, -0.466348, 0.4823529, 1, 0, 1,
-0.6143858, -0.5415231, -2.949915, 0.4745098, 1, 0, 1,
-0.6113151, 1.957511, -1.174673, 0.4705882, 1, 0, 1,
-0.6100112, 0.1266064, -1.461266, 0.4627451, 1, 0, 1,
-0.6007095, 0.8454614, -1.318021, 0.4588235, 1, 0, 1,
-0.5977957, -0.9275967, -1.536745, 0.4509804, 1, 0, 1,
-0.597755, 1.090526, -0.6504181, 0.4470588, 1, 0, 1,
-0.5973234, -2.064586, -3.662995, 0.4392157, 1, 0, 1,
-0.5967211, 1.53716, -0.6164299, 0.4352941, 1, 0, 1,
-0.5948554, -1.145034, -2.811581, 0.427451, 1, 0, 1,
-0.5889603, 1.03871, -2.525139, 0.4235294, 1, 0, 1,
-0.5873734, 1.051358, 1.176494, 0.4156863, 1, 0, 1,
-0.5784944, -0.03550461, -1.707722, 0.4117647, 1, 0, 1,
-0.5738404, -0.3462976, -2.658716, 0.4039216, 1, 0, 1,
-0.5726531, -0.7516958, -1.923179, 0.3960784, 1, 0, 1,
-0.5706818, 0.7034962, -1.401057, 0.3921569, 1, 0, 1,
-0.5701693, -0.544679, 1.50043, 0.3843137, 1, 0, 1,
-0.5701487, 0.8062122, -0.9398957, 0.3803922, 1, 0, 1,
-0.5679806, 0.8075797, -2.230773, 0.372549, 1, 0, 1,
-0.5608308, -0.04330925, -0.8853145, 0.3686275, 1, 0, 1,
-0.5605705, -2.559737, -1.918533, 0.3607843, 1, 0, 1,
-0.56054, -1.125619, -2.763196, 0.3568628, 1, 0, 1,
-0.5569113, 0.1941482, -1.829042, 0.3490196, 1, 0, 1,
-0.5491752, 0.3508253, -0.264316, 0.345098, 1, 0, 1,
-0.5491461, -0.9894112, -2.132858, 0.3372549, 1, 0, 1,
-0.545242, 1.105626, -0.2019171, 0.3333333, 1, 0, 1,
-0.5390164, 0.8243392, -0.7083587, 0.3254902, 1, 0, 1,
-0.537779, 0.4382851, -0.8393978, 0.3215686, 1, 0, 1,
-0.5369156, 0.1585901, -2.301097, 0.3137255, 1, 0, 1,
-0.5333183, 0.1388713, -2.114924, 0.3098039, 1, 0, 1,
-0.5324401, 1.243988, 0.303377, 0.3019608, 1, 0, 1,
-0.5304053, -0.752234, -1.461078, 0.2941177, 1, 0, 1,
-0.5286902, 0.7817236, -2.134447, 0.2901961, 1, 0, 1,
-0.5259039, -0.4445485, -3.188956, 0.282353, 1, 0, 1,
-0.5238069, 0.1486262, -1.052892, 0.2784314, 1, 0, 1,
-0.5227169, 0.4416096, 0.1793884, 0.2705882, 1, 0, 1,
-0.5207178, -0.7254234, -3.004591, 0.2666667, 1, 0, 1,
-0.5188029, -0.2220292, -0.6198877, 0.2588235, 1, 0, 1,
-0.5183644, -0.8199929, -3.363914, 0.254902, 1, 0, 1,
-0.5173173, -0.5599571, -3.607896, 0.2470588, 1, 0, 1,
-0.4987591, -2.254966, -2.599906, 0.2431373, 1, 0, 1,
-0.498758, -0.2713732, -3.554343, 0.2352941, 1, 0, 1,
-0.4981337, -0.01061413, 1.065938, 0.2313726, 1, 0, 1,
-0.4970939, -0.7524949, -2.359309, 0.2235294, 1, 0, 1,
-0.4938354, -1.53113, -0.03691113, 0.2196078, 1, 0, 1,
-0.4869071, -0.5065452, -3.798166, 0.2117647, 1, 0, 1,
-0.4857145, 0.8650978, -1.93732, 0.2078431, 1, 0, 1,
-0.4799987, -1.001184, -2.112262, 0.2, 1, 0, 1,
-0.4779564, 1.092252, -1.13727, 0.1921569, 1, 0, 1,
-0.4763921, 0.08189758, -1.55172, 0.1882353, 1, 0, 1,
-0.4758208, 1.019665, -0.9262762, 0.1803922, 1, 0, 1,
-0.4756857, -0.5257474, -1.453759, 0.1764706, 1, 0, 1,
-0.4718854, 1.991841, 0.5808519, 0.1686275, 1, 0, 1,
-0.4705232, 0.0480729, -1.872949, 0.1647059, 1, 0, 1,
-0.4693609, 0.08311999, -2.20907, 0.1568628, 1, 0, 1,
-0.4689071, 0.4118276, -2.428791, 0.1529412, 1, 0, 1,
-0.4671476, 1.37008, -0.8752828, 0.145098, 1, 0, 1,
-0.4669758, -0.6267865, -3.639452, 0.1411765, 1, 0, 1,
-0.4647219, -0.2978429, -1.810098, 0.1333333, 1, 0, 1,
-0.4638687, 0.213844, -0.8731997, 0.1294118, 1, 0, 1,
-0.4614446, -2.775202, -2.903394, 0.1215686, 1, 0, 1,
-0.4577022, -1.589586, -1.902775, 0.1176471, 1, 0, 1,
-0.4571765, -0.8710095, -1.182095, 0.1098039, 1, 0, 1,
-0.4533852, 1.638139, -0.3049293, 0.1058824, 1, 0, 1,
-0.4523896, -0.5142084, -2.176296, 0.09803922, 1, 0, 1,
-0.4505168, 1.061362, -0.2159047, 0.09019608, 1, 0, 1,
-0.4496317, 0.3884773, -0.8478512, 0.08627451, 1, 0, 1,
-0.4448155, -1.26494, -3.931778, 0.07843138, 1, 0, 1,
-0.4447905, -0.5478437, -3.996955, 0.07450981, 1, 0, 1,
-0.443664, 0.4494075, 1.117542, 0.06666667, 1, 0, 1,
-0.4375931, 0.8119947, 0.4228966, 0.0627451, 1, 0, 1,
-0.4338809, 0.4618412, 0.5556812, 0.05490196, 1, 0, 1,
-0.4270113, -0.3831293, -3.051677, 0.05098039, 1, 0, 1,
-0.4264275, 0.3342929, 0.4620796, 0.04313726, 1, 0, 1,
-0.425173, -0.6425673, -1.812116, 0.03921569, 1, 0, 1,
-0.4237466, -0.6326238, -1.889037, 0.03137255, 1, 0, 1,
-0.4210788, -0.9736434, -2.325439, 0.02745098, 1, 0, 1,
-0.4181443, -0.1935247, -2.061436, 0.01960784, 1, 0, 1,
-0.4149657, -0.6738169, -1.251774, 0.01568628, 1, 0, 1,
-0.4149407, -0.2926279, -2.605518, 0.007843138, 1, 0, 1,
-0.4119572, 1.22847, -0.1958827, 0.003921569, 1, 0, 1,
-0.4092616, 0.1368082, -1.217356, 0, 1, 0.003921569, 1,
-0.4085021, -0.2976847, -2.949303, 0, 1, 0.01176471, 1,
-0.4065907, 0.06101641, -1.424312, 0, 1, 0.01568628, 1,
-0.4020832, -0.134639, -2.398846, 0, 1, 0.02352941, 1,
-0.3986667, -1.084588, -1.81269, 0, 1, 0.02745098, 1,
-0.3951138, 0.01040651, -1.96787, 0, 1, 0.03529412, 1,
-0.3916155, -0.1976694, -0.4008613, 0, 1, 0.03921569, 1,
-0.3812205, -0.7520896, -3.763486, 0, 1, 0.04705882, 1,
-0.3791652, 0.3158991, -1.33259, 0, 1, 0.05098039, 1,
-0.3778014, -0.08864445, -1.954655, 0, 1, 0.05882353, 1,
-0.3776617, 0.4916436, 0.4262917, 0, 1, 0.0627451, 1,
-0.3765043, 0.249005, -1.879698, 0, 1, 0.07058824, 1,
-0.3725585, -2.307853, -3.677639, 0, 1, 0.07450981, 1,
-0.3722428, -0.5280837, -3.519206, 0, 1, 0.08235294, 1,
-0.3711088, 0.1965012, -2.594956, 0, 1, 0.08627451, 1,
-0.3668355, 0.4207373, -1.779985, 0, 1, 0.09411765, 1,
-0.3651485, 0.3145405, -1.39918, 0, 1, 0.1019608, 1,
-0.3637904, -1.071267, -1.646377, 0, 1, 0.1058824, 1,
-0.3615617, -0.7297658, -3.344004, 0, 1, 0.1137255, 1,
-0.3539573, -0.2183287, -0.2933535, 0, 1, 0.1176471, 1,
-0.3522252, -0.8367085, -2.312827, 0, 1, 0.1254902, 1,
-0.3501506, 0.1671921, -1.572533, 0, 1, 0.1294118, 1,
-0.3497642, -0.5317153, -4.063506, 0, 1, 0.1372549, 1,
-0.3468995, 1.203505, -0.5348053, 0, 1, 0.1411765, 1,
-0.3448622, 1.796972, 0.2032787, 0, 1, 0.1490196, 1,
-0.3420444, -1.239139, -2.452292, 0, 1, 0.1529412, 1,
-0.3416269, -1.065627, -2.58361, 0, 1, 0.1607843, 1,
-0.3414111, 1.595224, -0.7491233, 0, 1, 0.1647059, 1,
-0.3397391, -0.2208437, -2.509208, 0, 1, 0.172549, 1,
-0.3371775, 0.5221927, -0.7731433, 0, 1, 0.1764706, 1,
-0.3351838, -1.411401, -4.918097, 0, 1, 0.1843137, 1,
-0.332126, -0.7484832, -1.878664, 0, 1, 0.1882353, 1,
-0.318957, 0.07913911, -3.375748, 0, 1, 0.1960784, 1,
-0.3131833, -0.6114661, -2.472787, 0, 1, 0.2039216, 1,
-0.3105744, -0.4597725, -2.098392, 0, 1, 0.2078431, 1,
-0.3073628, 0.4611342, -0.4464401, 0, 1, 0.2156863, 1,
-0.3069576, 0.3404111, -0.3260313, 0, 1, 0.2196078, 1,
-0.3040187, 0.03882764, -2.739938, 0, 1, 0.227451, 1,
-0.3020079, -0.3146069, -2.228332, 0, 1, 0.2313726, 1,
-0.3013139, 0.5218894, -2.093458, 0, 1, 0.2392157, 1,
-0.3012172, -0.6736152, -1.553561, 0, 1, 0.2431373, 1,
-0.2957339, 1.302504, 0.3814312, 0, 1, 0.2509804, 1,
-0.2945076, 1.721005, 0.7606547, 0, 1, 0.254902, 1,
-0.2905104, 0.9849039, -1.73777, 0, 1, 0.2627451, 1,
-0.287966, 0.2017722, 0.02709459, 0, 1, 0.2666667, 1,
-0.2879166, -0.9002711, -2.976786, 0, 1, 0.2745098, 1,
-0.2847276, -0.111335, -3.223004, 0, 1, 0.2784314, 1,
-0.2841055, -0.5787915, -3.639802, 0, 1, 0.2862745, 1,
-0.2840558, -0.7849918, -2.980152, 0, 1, 0.2901961, 1,
-0.2795154, 0.8872094, -0.4494279, 0, 1, 0.2980392, 1,
-0.2771142, -0.4365894, -3.348055, 0, 1, 0.3058824, 1,
-0.2769992, 0.9083016, -1.12749, 0, 1, 0.3098039, 1,
-0.2738624, 0.2690285, -0.283369, 0, 1, 0.3176471, 1,
-0.2724021, -0.7644263, -2.279946, 0, 1, 0.3215686, 1,
-0.2617957, -0.6842021, -3.057925, 0, 1, 0.3294118, 1,
-0.26096, -1.382194, -1.962327, 0, 1, 0.3333333, 1,
-0.251892, 1.226126, -0.9947385, 0, 1, 0.3411765, 1,
-0.2518448, -0.3300705, -2.512046, 0, 1, 0.345098, 1,
-0.2479328, 0.2940756, -1.67258, 0, 1, 0.3529412, 1,
-0.2448693, -1.573949, -3.238321, 0, 1, 0.3568628, 1,
-0.2441349, 0.04566129, -1.136009, 0, 1, 0.3647059, 1,
-0.241734, 0.6882468, 0.9022668, 0, 1, 0.3686275, 1,
-0.2340581, 0.04881868, -2.381896, 0, 1, 0.3764706, 1,
-0.2318014, 1.332577, -0.3842396, 0, 1, 0.3803922, 1,
-0.2303951, 0.7430611, 0.4736643, 0, 1, 0.3882353, 1,
-0.2282801, 1.291108, -0.5271503, 0, 1, 0.3921569, 1,
-0.2269994, 0.9664129, 1.512199, 0, 1, 0.4, 1,
-0.2192569, -0.3839085, -2.78769, 0, 1, 0.4078431, 1,
-0.2186906, -0.5407932, -4.162079, 0, 1, 0.4117647, 1,
-0.2176554, 0.9276817, -0.1131568, 0, 1, 0.4196078, 1,
-0.217337, 1.239372, -0.5809541, 0, 1, 0.4235294, 1,
-0.2165334, -0.5816841, -1.077528, 0, 1, 0.4313726, 1,
-0.2067764, -1.227969, -2.051805, 0, 1, 0.4352941, 1,
-0.2016742, 0.4956662, 1.275427, 0, 1, 0.4431373, 1,
-0.2010658, -0.4064248, -1.801858, 0, 1, 0.4470588, 1,
-0.2008846, 0.03667875, -2.771263, 0, 1, 0.454902, 1,
-0.197342, 0.14519, -0.5162268, 0, 1, 0.4588235, 1,
-0.1941063, 1.17293, 0.2679991, 0, 1, 0.4666667, 1,
-0.1938666, 0.6739622, -1.59904, 0, 1, 0.4705882, 1,
-0.1903874, 0.8547918, 0.2465064, 0, 1, 0.4784314, 1,
-0.1893965, 0.5744952, -0.9367529, 0, 1, 0.4823529, 1,
-0.1888046, -0.6429351, -2.968902, 0, 1, 0.4901961, 1,
-0.1840075, -2.527797, -3.383878, 0, 1, 0.4941176, 1,
-0.1829026, 0.58313, -0.1031477, 0, 1, 0.5019608, 1,
-0.1753722, -0.716195, -3.521844, 0, 1, 0.509804, 1,
-0.1724618, -1.504306, -5.839875, 0, 1, 0.5137255, 1,
-0.1695755, 1.086584, 0.2756082, 0, 1, 0.5215687, 1,
-0.1689663, 1.543075, -0.3157303, 0, 1, 0.5254902, 1,
-0.168426, -0.426382, -2.201361, 0, 1, 0.5333334, 1,
-0.1640491, 0.8146935, -0.3238874, 0, 1, 0.5372549, 1,
-0.1612402, 0.3559734, 1.467974, 0, 1, 0.5450981, 1,
-0.1603947, -0.01247429, -2.255338, 0, 1, 0.5490196, 1,
-0.1579007, 1.707685, -0.5441664, 0, 1, 0.5568628, 1,
-0.1543966, 1.500455, -1.396673, 0, 1, 0.5607843, 1,
-0.1542911, -1.467794, -3.151568, 0, 1, 0.5686275, 1,
-0.1526291, -0.5398537, -2.407188, 0, 1, 0.572549, 1,
-0.1507618, -1.827761, -1.64072, 0, 1, 0.5803922, 1,
-0.146918, -0.6059716, -2.231134, 0, 1, 0.5843138, 1,
-0.1458759, 1.357142, -0.647588, 0, 1, 0.5921569, 1,
-0.1443212, -1.616168, -3.184944, 0, 1, 0.5960785, 1,
-0.1418669, 0.4464191, -1.971932, 0, 1, 0.6039216, 1,
-0.1386215, 0.3050382, 0.09179047, 0, 1, 0.6117647, 1,
-0.1382525, 0.1042264, -0.01725655, 0, 1, 0.6156863, 1,
-0.1282529, 1.006837, 1.994472, 0, 1, 0.6235294, 1,
-0.1227906, 0.1396491, -0.7581241, 0, 1, 0.627451, 1,
-0.1212404, 0.3032677, 0.9856324, 0, 1, 0.6352941, 1,
-0.1204578, -1.075429, -1.962628, 0, 1, 0.6392157, 1,
-0.1157807, 0.7505447, -2.51991, 0, 1, 0.6470588, 1,
-0.1147681, -0.1965585, -1.925543, 0, 1, 0.6509804, 1,
-0.1139501, 1.621276, -0.9283364, 0, 1, 0.6588235, 1,
-0.1129868, 1.47558, 1.330634, 0, 1, 0.6627451, 1,
-0.110501, -1.403219, -2.137152, 0, 1, 0.6705883, 1,
-0.1023218, -1.241886, -3.480638, 0, 1, 0.6745098, 1,
-0.1022969, -1.701185, -1.114185, 0, 1, 0.682353, 1,
-0.09752729, -0.1870251, -2.653196, 0, 1, 0.6862745, 1,
-0.09740979, -1.011393, -3.535564, 0, 1, 0.6941177, 1,
-0.09451906, -0.208072, -1.552211, 0, 1, 0.7019608, 1,
-0.09394643, 2.051645, -0.09313733, 0, 1, 0.7058824, 1,
-0.09277415, -0.5220777, -2.606502, 0, 1, 0.7137255, 1,
-0.09251125, 0.4832537, -0.7777351, 0, 1, 0.7176471, 1,
-0.09139857, 0.0529028, -0.4648152, 0, 1, 0.7254902, 1,
-0.09127896, -0.6365582, -3.729497, 0, 1, 0.7294118, 1,
-0.09125151, -0.5078275, -2.925093, 0, 1, 0.7372549, 1,
-0.08964537, 0.6431754, -0.5792876, 0, 1, 0.7411765, 1,
-0.08826869, 0.8754145, -0.4199653, 0, 1, 0.7490196, 1,
-0.08527982, 0.1129048, -1.622126, 0, 1, 0.7529412, 1,
-0.0762672, 1.350769, 0.4654019, 0, 1, 0.7607843, 1,
-0.07251886, -0.5090936, -3.726305, 0, 1, 0.7647059, 1,
-0.07125949, 0.6915919, -0.4147439, 0, 1, 0.772549, 1,
-0.0674032, -0.2522483, -3.603026, 0, 1, 0.7764706, 1,
-0.06729709, -0.3166909, -0.6775937, 0, 1, 0.7843137, 1,
-0.06561017, -1.249925, -3.52376, 0, 1, 0.7882353, 1,
-0.06550712, -0.7677318, -3.338863, 0, 1, 0.7960784, 1,
-0.05861885, 0.3456232, 0.05570275, 0, 1, 0.8039216, 1,
-0.0562617, -0.3940413, -1.973503, 0, 1, 0.8078431, 1,
-0.0557588, -0.5349898, -2.350832, 0, 1, 0.8156863, 1,
-0.05349392, -0.3772018, -1.587176, 0, 1, 0.8196079, 1,
-0.04850782, 0.08009916, 0.2080517, 0, 1, 0.827451, 1,
-0.04775278, -0.09675171, -1.683254, 0, 1, 0.8313726, 1,
-0.04611945, 0.5370339, -0.5264621, 0, 1, 0.8392157, 1,
-0.04367643, 0.827098, 1.285932, 0, 1, 0.8431373, 1,
-0.04359597, -1.031704, -3.046024, 0, 1, 0.8509804, 1,
-0.04160114, 0.2346352, -0.9557496, 0, 1, 0.854902, 1,
-0.03913444, 0.3969348, -0.6258563, 0, 1, 0.8627451, 1,
-0.03777995, 1.076177, -1.182445, 0, 1, 0.8666667, 1,
-0.03766014, 0.7031441, 0.8855364, 0, 1, 0.8745098, 1,
-0.03608561, 0.07202213, -0.284131, 0, 1, 0.8784314, 1,
-0.02818718, -0.9802597, -2.979011, 0, 1, 0.8862745, 1,
-0.02757729, 0.1104624, -1.017489, 0, 1, 0.8901961, 1,
-0.02351984, 1.136539, 0.8757818, 0, 1, 0.8980392, 1,
-0.01933141, 1.281598, 0.4870112, 0, 1, 0.9058824, 1,
-0.0187228, -0.3279551, -2.141955, 0, 1, 0.9098039, 1,
-0.01705035, 0.4078898, 1.057101, 0, 1, 0.9176471, 1,
-0.01637347, -0.6911764, -2.972029, 0, 1, 0.9215686, 1,
-0.01559309, -2.183566, -3.351243, 0, 1, 0.9294118, 1,
-0.01307623, -0.3232896, -2.919408, 0, 1, 0.9333333, 1,
-0.009516036, 0.03807274, 0.6833043, 0, 1, 0.9411765, 1,
-0.009107747, 0.3334554, -0.8378956, 0, 1, 0.945098, 1,
-0.007546474, 0.3725141, 0.63998, 0, 1, 0.9529412, 1,
-0.005647955, -1.220451, -3.048917, 0, 1, 0.9568627, 1,
-0.003066986, 1.32191, -0.1744303, 0, 1, 0.9647059, 1,
-0.001421735, -0.1987915, -3.167207, 0, 1, 0.9686275, 1,
-0.000847112, 0.5952047, -1.858911, 0, 1, 0.9764706, 1,
-0.0003824283, 0.6082472, 0.536819, 0, 1, 0.9803922, 1,
0.002414587, -0.8108931, 3.588129, 0, 1, 0.9882353, 1,
0.003222195, 0.04543906, 0.9910092, 0, 1, 0.9921569, 1,
0.006651911, 0.5439807, -0.5823489, 0, 1, 1, 1,
0.00769316, 1.6906, -2.873668, 0, 0.9921569, 1, 1,
0.0120442, 0.868545, -0.4452907, 0, 0.9882353, 1, 1,
0.01757476, 0.3634064, 0.3794001, 0, 0.9803922, 1, 1,
0.02145397, -1.221899, 2.587056, 0, 0.9764706, 1, 1,
0.02165903, 1.624539, -0.09543402, 0, 0.9686275, 1, 1,
0.02350307, 0.632189, 0.3604829, 0, 0.9647059, 1, 1,
0.02380229, 0.5491387, 1.568117, 0, 0.9568627, 1, 1,
0.02409738, -0.629051, 3.007092, 0, 0.9529412, 1, 1,
0.02419336, 0.03351996, 2.121433, 0, 0.945098, 1, 1,
0.02787204, -0.9293825, 3.485725, 0, 0.9411765, 1, 1,
0.03105539, -0.4425521, 1.626747, 0, 0.9333333, 1, 1,
0.03312181, -1.600761, 2.182446, 0, 0.9294118, 1, 1,
0.03622641, -0.3860421, 1.839222, 0, 0.9215686, 1, 1,
0.03780331, 1.10243, 0.07184672, 0, 0.9176471, 1, 1,
0.03979794, -0.402062, 3.972085, 0, 0.9098039, 1, 1,
0.0484243, -1.004916, 3.613674, 0, 0.9058824, 1, 1,
0.04942039, -0.5411217, 1.245107, 0, 0.8980392, 1, 1,
0.05105776, -2.439339, 3.740787, 0, 0.8901961, 1, 1,
0.05182323, -0.7163072, 5.589151, 0, 0.8862745, 1, 1,
0.05233286, -1.644525, 2.188658, 0, 0.8784314, 1, 1,
0.06273939, 0.6594548, 1.059647, 0, 0.8745098, 1, 1,
0.06455053, -0.6995341, 4.705292, 0, 0.8666667, 1, 1,
0.0647094, 0.0317812, 0.4503951, 0, 0.8627451, 1, 1,
0.06771003, 0.704189, 1.003043, 0, 0.854902, 1, 1,
0.06859435, -0.4366001, 2.673495, 0, 0.8509804, 1, 1,
0.07180063, -0.2230677, 1.028492, 0, 0.8431373, 1, 1,
0.07274403, 0.3794236, 0.7402461, 0, 0.8392157, 1, 1,
0.07672352, 0.814538, 0.4490188, 0, 0.8313726, 1, 1,
0.08153673, -0.5053261, 2.811064, 0, 0.827451, 1, 1,
0.08440294, 0.9010069, -1.065138, 0, 0.8196079, 1, 1,
0.086065, 0.08082756, -0.01208124, 0, 0.8156863, 1, 1,
0.09000462, -0.1987498, 3.886485, 0, 0.8078431, 1, 1,
0.09025884, -1.424299, 2.476951, 0, 0.8039216, 1, 1,
0.09305663, 0.3541299, 0.08512918, 0, 0.7960784, 1, 1,
0.09716659, -1.924883, 2.230772, 0, 0.7882353, 1, 1,
0.09737919, -2.463212, 3.042339, 0, 0.7843137, 1, 1,
0.09930338, 1.502334, 0.8301196, 0, 0.7764706, 1, 1,
0.09966689, 1.25818, -1.182822, 0, 0.772549, 1, 1,
0.1033145, -1.843535, 3.482256, 0, 0.7647059, 1, 1,
0.1059692, 1.139734, -0.3372074, 0, 0.7607843, 1, 1,
0.1060198, 0.4333819, -0.08050117, 0, 0.7529412, 1, 1,
0.1090442, -0.5911727, 3.656067, 0, 0.7490196, 1, 1,
0.1092883, -1.876824, 2.216251, 0, 0.7411765, 1, 1,
0.1126067, 0.5929033, -0.3151214, 0, 0.7372549, 1, 1,
0.1146915, -0.3896627, 2.707297, 0, 0.7294118, 1, 1,
0.1197704, 0.2321968, 1.373008, 0, 0.7254902, 1, 1,
0.12203, 0.8810948, -1.67436, 0, 0.7176471, 1, 1,
0.1229244, -0.118534, 1.079482, 0, 0.7137255, 1, 1,
0.1230388, 0.2005932, -1.208636, 0, 0.7058824, 1, 1,
0.128777, 0.393243, 0.538712, 0, 0.6980392, 1, 1,
0.1349656, -0.03349596, 1.416075, 0, 0.6941177, 1, 1,
0.1365513, 1.956355, 0.3074225, 0, 0.6862745, 1, 1,
0.1376185, -0.06386676, 0.5185794, 0, 0.682353, 1, 1,
0.1428739, 0.05851119, 0.3433297, 0, 0.6745098, 1, 1,
0.1430814, -1.525754, 3.076921, 0, 0.6705883, 1, 1,
0.143639, -0.8638662, 2.214522, 0, 0.6627451, 1, 1,
0.1479515, 0.2642964, 0.6090046, 0, 0.6588235, 1, 1,
0.1480642, -0.5320789, 3.567534, 0, 0.6509804, 1, 1,
0.1518282, 1.407168, 0.8362116, 0, 0.6470588, 1, 1,
0.1609006, -1.774106, 1.878448, 0, 0.6392157, 1, 1,
0.1670924, 0.388264, -0.5791667, 0, 0.6352941, 1, 1,
0.1689092, -0.06367882, 1.536977, 0, 0.627451, 1, 1,
0.1740342, 0.4093254, 0.3441342, 0, 0.6235294, 1, 1,
0.1768443, -0.339548, 1.905657, 0, 0.6156863, 1, 1,
0.1803437, 0.3245784, 0.47484, 0, 0.6117647, 1, 1,
0.1826315, -0.6319479, 2.376197, 0, 0.6039216, 1, 1,
0.1833992, 0.6067826, -0.2216437, 0, 0.5960785, 1, 1,
0.1856754, 0.9432735, 0.9807241, 0, 0.5921569, 1, 1,
0.1875996, -0.8803073, 2.934486, 0, 0.5843138, 1, 1,
0.1887848, 0.8144535, 0.3184338, 0, 0.5803922, 1, 1,
0.1901522, 0.6139296, 0.5810987, 0, 0.572549, 1, 1,
0.1911785, 1.977564, -0.2218688, 0, 0.5686275, 1, 1,
0.1916446, -0.1503337, 1.708288, 0, 0.5607843, 1, 1,
0.1930053, 0.8729309, 1.522498, 0, 0.5568628, 1, 1,
0.1972317, 0.1714599, -0.3927324, 0, 0.5490196, 1, 1,
0.1998104, 0.7256028, 2.128587, 0, 0.5450981, 1, 1,
0.20397, 0.327008, -0.01729546, 0, 0.5372549, 1, 1,
0.2074895, 0.06294639, -0.374335, 0, 0.5333334, 1, 1,
0.211773, 0.6656265, 2.302492, 0, 0.5254902, 1, 1,
0.2128445, 2.225619, -0.9000765, 0, 0.5215687, 1, 1,
0.2133298, 0.6235645, 0.6674032, 0, 0.5137255, 1, 1,
0.2147393, -0.1672828, 2.188125, 0, 0.509804, 1, 1,
0.2186581, -1.70502, 5.447848, 0, 0.5019608, 1, 1,
0.2191296, -0.3402825, 2.203421, 0, 0.4941176, 1, 1,
0.2273885, 0.4008205, 1.413217, 0, 0.4901961, 1, 1,
0.2318556, -0.5722165, 2.519735, 0, 0.4823529, 1, 1,
0.2363038, -0.9798044, 2.097926, 0, 0.4784314, 1, 1,
0.2408786, -1.253343, 2.789904, 0, 0.4705882, 1, 1,
0.2420404, -0.8585575, 3.790166, 0, 0.4666667, 1, 1,
0.2456442, -1.831303, 4.275777, 0, 0.4588235, 1, 1,
0.2502618, -0.01486311, 3.155659, 0, 0.454902, 1, 1,
0.2504846, 0.4166465, -0.01411558, 0, 0.4470588, 1, 1,
0.2563868, -1.754183, 4.476832, 0, 0.4431373, 1, 1,
0.2575465, -0.7286914, 3.331538, 0, 0.4352941, 1, 1,
0.2579334, -0.05707979, 3.866529, 0, 0.4313726, 1, 1,
0.2606193, 0.5610381, -0.527088, 0, 0.4235294, 1, 1,
0.2634632, 0.2497172, -0.9751499, 0, 0.4196078, 1, 1,
0.2648051, 0.4501361, 1.43497, 0, 0.4117647, 1, 1,
0.2701523, -1.128902, 3.815075, 0, 0.4078431, 1, 1,
0.2724842, -0.6412367, 1.997067, 0, 0.4, 1, 1,
0.2730281, -0.7733652, 2.522009, 0, 0.3921569, 1, 1,
0.2732377, 1.278647, 0.4511654, 0, 0.3882353, 1, 1,
0.275916, -0.8458461, 2.854372, 0, 0.3803922, 1, 1,
0.2761773, -1.233021, 2.509693, 0, 0.3764706, 1, 1,
0.2774824, 0.2866873, 2.448549, 0, 0.3686275, 1, 1,
0.2806606, -0.8820556, 0.9681053, 0, 0.3647059, 1, 1,
0.2830972, -0.8388687, 2.104853, 0, 0.3568628, 1, 1,
0.2838395, 0.8245024, 0.04130468, 0, 0.3529412, 1, 1,
0.2850932, -0.2731688, 1.415717, 0, 0.345098, 1, 1,
0.286736, 0.1060789, 0.955366, 0, 0.3411765, 1, 1,
0.2913398, 1.890173, 0.8450431, 0, 0.3333333, 1, 1,
0.2951036, -1.096103, 2.409229, 0, 0.3294118, 1, 1,
0.2975403, 1.100961, -0.3178612, 0, 0.3215686, 1, 1,
0.2976092, -0.9592321, 2.878316, 0, 0.3176471, 1, 1,
0.2998203, 1.171989, -0.0494189, 0, 0.3098039, 1, 1,
0.306544, -0.3696881, 1.928819, 0, 0.3058824, 1, 1,
0.3078421, 0.4115821, 0.2521158, 0, 0.2980392, 1, 1,
0.3080952, 0.3048864, 1.125776, 0, 0.2901961, 1, 1,
0.3085723, 1.226715, 0.5728885, 0, 0.2862745, 1, 1,
0.3101062, -1.167442, 2.602676, 0, 0.2784314, 1, 1,
0.3116498, 0.6132191, -0.6207317, 0, 0.2745098, 1, 1,
0.3145308, 2.068845, 1.755242, 0, 0.2666667, 1, 1,
0.3224417, 1.577837, -0.8149086, 0, 0.2627451, 1, 1,
0.3289981, 0.8263845, 0.0437006, 0, 0.254902, 1, 1,
0.333602, -0.375757, 3.422266, 0, 0.2509804, 1, 1,
0.3337898, -0.981146, 4.863894, 0, 0.2431373, 1, 1,
0.3340859, 1.42841, -0.6274297, 0, 0.2392157, 1, 1,
0.3344285, 0.006874518, 1.281978, 0, 0.2313726, 1, 1,
0.3347135, -0.07775619, 1.043451, 0, 0.227451, 1, 1,
0.336867, -0.9612992, 1.528967, 0, 0.2196078, 1, 1,
0.3374582, 1.055174, 0.2571585, 0, 0.2156863, 1, 1,
0.3392796, 1.721364, 0.3603559, 0, 0.2078431, 1, 1,
0.3412164, -0.3715869, 3.550967, 0, 0.2039216, 1, 1,
0.342894, 0.04424617, 0.7939116, 0, 0.1960784, 1, 1,
0.3429359, -1.064585, 3.509933, 0, 0.1882353, 1, 1,
0.3449149, -0.5767961, 4.28091, 0, 0.1843137, 1, 1,
0.3451088, 0.06819195, 1.309067, 0, 0.1764706, 1, 1,
0.3452035, 0.1938714, 1.37593, 0, 0.172549, 1, 1,
0.345932, 0.7165213, 0.5361443, 0, 0.1647059, 1, 1,
0.3491014, 0.4608599, 0.6635687, 0, 0.1607843, 1, 1,
0.3526163, 2.006942, -0.2033342, 0, 0.1529412, 1, 1,
0.3546681, -0.1737268, 0.8125414, 0, 0.1490196, 1, 1,
0.3590287, 0.7467615, -0.3699616, 0, 0.1411765, 1, 1,
0.3615886, -1.315157, 2.618656, 0, 0.1372549, 1, 1,
0.3658966, 0.5117503, 0.5515757, 0, 0.1294118, 1, 1,
0.3711548, -0.8661299, 4.535389, 0, 0.1254902, 1, 1,
0.3714062, -0.2891053, 2.613559, 0, 0.1176471, 1, 1,
0.380959, 0.3643168, 0.3185269, 0, 0.1137255, 1, 1,
0.3845249, -0.8766884, 2.667987, 0, 0.1058824, 1, 1,
0.3849351, 1.241776, -3.023134, 0, 0.09803922, 1, 1,
0.3887019, -0.2771844, 1.591937, 0, 0.09411765, 1, 1,
0.390433, -2.440959, 1.896528, 0, 0.08627451, 1, 1,
0.3937014, 1.959854, -0.39595, 0, 0.08235294, 1, 1,
0.3941553, -2.503344, 3.465772, 0, 0.07450981, 1, 1,
0.4054212, -0.4838119, 1.038821, 0, 0.07058824, 1, 1,
0.4085084, -0.3953536, 1.644739, 0, 0.0627451, 1, 1,
0.4114108, -0.3650846, 1.039826, 0, 0.05882353, 1, 1,
0.4115607, -0.7696733, 3.813813, 0, 0.05098039, 1, 1,
0.4126973, -0.7101679, 3.357959, 0, 0.04705882, 1, 1,
0.4149042, 0.1273462, 0.6524996, 0, 0.03921569, 1, 1,
0.4157523, 0.3570467, 1.324281, 0, 0.03529412, 1, 1,
0.4167714, -1.348537, 3.186074, 0, 0.02745098, 1, 1,
0.4210149, 0.226649, 0.9674543, 0, 0.02352941, 1, 1,
0.4213995, -0.06448887, 1.417516, 0, 0.01568628, 1, 1,
0.4214654, 0.1667056, 3.248338, 0, 0.01176471, 1, 1,
0.4231525, -1.131414, 2.955744, 0, 0.003921569, 1, 1,
0.4312949, -0.6372511, 2.022326, 0.003921569, 0, 1, 1,
0.4319785, 0.5506089, 0.7261297, 0.007843138, 0, 1, 1,
0.437493, -0.4329869, 3.10508, 0.01568628, 0, 1, 1,
0.4383271, -0.1688836, 0.4852017, 0.01960784, 0, 1, 1,
0.4397497, -0.1986682, -0.009952478, 0.02745098, 0, 1, 1,
0.4418326, -0.3905394, 4.132537, 0.03137255, 0, 1, 1,
0.4430153, -0.821253, 2.782708, 0.03921569, 0, 1, 1,
0.4442864, 0.7214434, 1.132325, 0.04313726, 0, 1, 1,
0.4484334, 0.8043782, -1.982658, 0.05098039, 0, 1, 1,
0.4492218, -0.713838, 2.484477, 0.05490196, 0, 1, 1,
0.4516475, -0.8007113, 2.109603, 0.0627451, 0, 1, 1,
0.4517327, -1.626458, 3.616495, 0.06666667, 0, 1, 1,
0.4520362, -0.8501832, 1.419358, 0.07450981, 0, 1, 1,
0.4605864, 0.8141738, -0.6381275, 0.07843138, 0, 1, 1,
0.4631312, 1.057529, -0.2634366, 0.08627451, 0, 1, 1,
0.4646383, 0.5728527, 0.5939205, 0.09019608, 0, 1, 1,
0.4707871, 0.8223479, -1.335052, 0.09803922, 0, 1, 1,
0.4724948, -1.340934, 2.02407, 0.1058824, 0, 1, 1,
0.4776192, 1.058696, 0.3089418, 0.1098039, 0, 1, 1,
0.4809176, 0.4892189, 0.697243, 0.1176471, 0, 1, 1,
0.4863151, 0.2369736, 1.012835, 0.1215686, 0, 1, 1,
0.4882801, 0.848232, 1.626504, 0.1294118, 0, 1, 1,
0.4905936, 0.9569659, 0.02948547, 0.1333333, 0, 1, 1,
0.4914515, -1.451152, 3.614799, 0.1411765, 0, 1, 1,
0.4915841, -0.7175916, 3.249606, 0.145098, 0, 1, 1,
0.4952132, -0.05322376, 3.265222, 0.1529412, 0, 1, 1,
0.501076, 0.3511865, 0.3857897, 0.1568628, 0, 1, 1,
0.50177, -2.242299, 4.004606, 0.1647059, 0, 1, 1,
0.5027604, -0.1933548, 2.349536, 0.1686275, 0, 1, 1,
0.5033455, 0.3715625, 1.102717, 0.1764706, 0, 1, 1,
0.5054739, -1.23509, 2.688401, 0.1803922, 0, 1, 1,
0.5078325, -0.3464419, 2.292117, 0.1882353, 0, 1, 1,
0.5130106, -0.761086, 1.738979, 0.1921569, 0, 1, 1,
0.5134127, 0.4849084, 1.838682, 0.2, 0, 1, 1,
0.5146645, 0.1923643, -0.4065675, 0.2078431, 0, 1, 1,
0.5147672, 0.5897231, 1.568214, 0.2117647, 0, 1, 1,
0.5202568, 0.2387616, 1.821804, 0.2196078, 0, 1, 1,
0.5209519, 0.666096, 0.3946076, 0.2235294, 0, 1, 1,
0.527363, -1.549288, 2.934362, 0.2313726, 0, 1, 1,
0.5321385, -1.550184, 3.541265, 0.2352941, 0, 1, 1,
0.5500296, -0.1471029, 0.2856159, 0.2431373, 0, 1, 1,
0.5530052, 0.2544819, 0.7709068, 0.2470588, 0, 1, 1,
0.5693982, 0.5374278, 1.093831, 0.254902, 0, 1, 1,
0.5705659, -0.5111803, 1.7194, 0.2588235, 0, 1, 1,
0.5709932, -0.248179, 2.630258, 0.2666667, 0, 1, 1,
0.5727422, 1.078471, -0.7767168, 0.2705882, 0, 1, 1,
0.5753065, -1.249266, 4.193982, 0.2784314, 0, 1, 1,
0.5788256, -1.053212, 1.903867, 0.282353, 0, 1, 1,
0.5807235, 1.075328, 1.901447, 0.2901961, 0, 1, 1,
0.5816709, 0.2634644, -0.6695828, 0.2941177, 0, 1, 1,
0.5860214, -0.03085621, 1.537496, 0.3019608, 0, 1, 1,
0.5886173, -1.52867, 2.007147, 0.3098039, 0, 1, 1,
0.5893236, -0.5200301, 0.4586909, 0.3137255, 0, 1, 1,
0.5934738, 0.6673648, 0.01760204, 0.3215686, 0, 1, 1,
0.5946983, -0.7778701, 1.166698, 0.3254902, 0, 1, 1,
0.5997783, -0.5357315, 3.017447, 0.3333333, 0, 1, 1,
0.6000718, -0.2810363, 2.015254, 0.3372549, 0, 1, 1,
0.6027984, 0.2634267, 0.9094245, 0.345098, 0, 1, 1,
0.6069297, -0.7327181, 1.496046, 0.3490196, 0, 1, 1,
0.614155, -1.657945, 3.037761, 0.3568628, 0, 1, 1,
0.6163688, -1.359438, 0.5085766, 0.3607843, 0, 1, 1,
0.617635, -1.390027, 1.211751, 0.3686275, 0, 1, 1,
0.6190556, -0.1756092, 2.78149, 0.372549, 0, 1, 1,
0.623813, -1.440267, 2.318948, 0.3803922, 0, 1, 1,
0.6263758, -3.163129, 2.100004, 0.3843137, 0, 1, 1,
0.6278213, 0.4017702, 1.427035, 0.3921569, 0, 1, 1,
0.6319463, 0.01662327, 2.122307, 0.3960784, 0, 1, 1,
0.6323503, -0.07552774, 1.091598, 0.4039216, 0, 1, 1,
0.6387979, -0.8168815, 3.537466, 0.4117647, 0, 1, 1,
0.6474446, -0.3996982, 2.879633, 0.4156863, 0, 1, 1,
0.6490837, 0.8304476, -0.6486031, 0.4235294, 0, 1, 1,
0.6515187, -0.3579241, 3.568104, 0.427451, 0, 1, 1,
0.6555151, 0.226966, 1.179269, 0.4352941, 0, 1, 1,
0.6589245, -0.05332386, 0.6244191, 0.4392157, 0, 1, 1,
0.6602151, 0.8302246, 2.073336, 0.4470588, 0, 1, 1,
0.6604195, -0.303798, 0.9171262, 0.4509804, 0, 1, 1,
0.6632466, -0.497384, 1.474462, 0.4588235, 0, 1, 1,
0.665926, 0.03526552, 0.6767765, 0.4627451, 0, 1, 1,
0.6660129, 0.6752885, 1.208089, 0.4705882, 0, 1, 1,
0.6668191, -0.7734883, 2.197357, 0.4745098, 0, 1, 1,
0.6676718, 0.4701585, 0.741769, 0.4823529, 0, 1, 1,
0.6681721, -0.4783099, 1.352714, 0.4862745, 0, 1, 1,
0.669098, 0.3959447, 0.6314114, 0.4941176, 0, 1, 1,
0.6696694, -0.3555827, 3.145337, 0.5019608, 0, 1, 1,
0.6748716, -0.4339575, 0.9730876, 0.5058824, 0, 1, 1,
0.6783161, -0.009515402, 0.2542683, 0.5137255, 0, 1, 1,
0.6828554, 0.6765183, 0.7845754, 0.5176471, 0, 1, 1,
0.6841146, 2.067958, -1.397069, 0.5254902, 0, 1, 1,
0.6841493, 0.3635858, -0.6705861, 0.5294118, 0, 1, 1,
0.6927615, -0.482368, 2.094431, 0.5372549, 0, 1, 1,
0.6963786, 0.3226423, 0.2093291, 0.5411765, 0, 1, 1,
0.6968185, -0.9130784, 1.065501, 0.5490196, 0, 1, 1,
0.6978611, -0.03600558, 0.5237281, 0.5529412, 0, 1, 1,
0.6983734, -1.257879, 3.39875, 0.5607843, 0, 1, 1,
0.7017823, -1.519658, 3.43486, 0.5647059, 0, 1, 1,
0.7060581, -0.1630466, 1.937141, 0.572549, 0, 1, 1,
0.7082457, 1.73251, -0.9594169, 0.5764706, 0, 1, 1,
0.711042, -0.01234279, 2.42562, 0.5843138, 0, 1, 1,
0.711151, 1.753746, 0.3737429, 0.5882353, 0, 1, 1,
0.7166941, 1.023944, 2.965933, 0.5960785, 0, 1, 1,
0.7229656, -0.6007409, 1.06218, 0.6039216, 0, 1, 1,
0.7241949, -0.3153204, 3.088738, 0.6078432, 0, 1, 1,
0.7267455, -0.2878758, 0.9532223, 0.6156863, 0, 1, 1,
0.7291406, 1.10816, -0.009242944, 0.6196079, 0, 1, 1,
0.7302895, -0.5149029, 0.5421871, 0.627451, 0, 1, 1,
0.7316609, 0.4866359, 2.087493, 0.6313726, 0, 1, 1,
0.7351733, 0.02426477, 2.124654, 0.6392157, 0, 1, 1,
0.7370878, -0.2921674, 1.477268, 0.6431373, 0, 1, 1,
0.7392921, -1.689936, 2.650723, 0.6509804, 0, 1, 1,
0.7420892, 0.6876773, 0.5511687, 0.654902, 0, 1, 1,
0.7435502, 1.100166, 0.5782356, 0.6627451, 0, 1, 1,
0.7494052, 1.176982, -2.191473, 0.6666667, 0, 1, 1,
0.7578177, 1.026718, 1.034374, 0.6745098, 0, 1, 1,
0.7588859, -0.226054, 1.482862, 0.6784314, 0, 1, 1,
0.7612494, -0.6460487, 1.429312, 0.6862745, 0, 1, 1,
0.7615262, -0.3809297, 2.2074, 0.6901961, 0, 1, 1,
0.7617903, 0.01601818, -0.286434, 0.6980392, 0, 1, 1,
0.7626811, 0.450672, 1.832674, 0.7058824, 0, 1, 1,
0.7632926, -0.009725785, 2.09586, 0.7098039, 0, 1, 1,
0.7681962, -1.640404, 1.42808, 0.7176471, 0, 1, 1,
0.7731533, -0.5176364, 1.978422, 0.7215686, 0, 1, 1,
0.7799996, -2.322996, 3.27968, 0.7294118, 0, 1, 1,
0.7852827, 0.01141207, 1.378383, 0.7333333, 0, 1, 1,
0.7857783, -0.04521407, 0.1110512, 0.7411765, 0, 1, 1,
0.7865371, -0.5068848, 2.156644, 0.7450981, 0, 1, 1,
0.8010744, 0.2177593, 0.2757735, 0.7529412, 0, 1, 1,
0.8162448, -0.4542597, 2.732725, 0.7568628, 0, 1, 1,
0.8164501, -0.1123586, 2.249805, 0.7647059, 0, 1, 1,
0.8183641, -1.65559, 3.782059, 0.7686275, 0, 1, 1,
0.8192613, -0.15109, 2.969758, 0.7764706, 0, 1, 1,
0.8206409, -0.156731, 2.485466, 0.7803922, 0, 1, 1,
0.8250046, -1.751326, 2.985254, 0.7882353, 0, 1, 1,
0.8296563, -0.4725277, 0.7377685, 0.7921569, 0, 1, 1,
0.8319476, 0.4722128, 1.638314, 0.8, 0, 1, 1,
0.8326256, 0.5216173, 1.870556, 0.8078431, 0, 1, 1,
0.8345117, -0.4621536, 1.518699, 0.8117647, 0, 1, 1,
0.8375623, 0.5111926, 1.333616, 0.8196079, 0, 1, 1,
0.839292, 0.1294851, 0.5438168, 0.8235294, 0, 1, 1,
0.8439397, 0.8357461, 0.9351524, 0.8313726, 0, 1, 1,
0.8466288, 0.2980836, 1.911318, 0.8352941, 0, 1, 1,
0.8467316, 2.484416, 0.6402874, 0.8431373, 0, 1, 1,
0.8480145, 0.4693123, 0.6804431, 0.8470588, 0, 1, 1,
0.8495702, 1.575227, -0.7539157, 0.854902, 0, 1, 1,
0.8510551, 2.563807, -0.8644129, 0.8588235, 0, 1, 1,
0.8520809, -0.5127759, 2.886381, 0.8666667, 0, 1, 1,
0.8529593, 2.808862, 0.8542082, 0.8705882, 0, 1, 1,
0.8548625, 1.238382, -0.6158664, 0.8784314, 0, 1, 1,
0.8578281, -0.5999327, 2.133198, 0.8823529, 0, 1, 1,
0.8578748, 0.5475512, 0.9441305, 0.8901961, 0, 1, 1,
0.8828534, 0.2449663, 2.149835, 0.8941177, 0, 1, 1,
0.8831157, 0.04017105, 1.822916, 0.9019608, 0, 1, 1,
0.8846495, 0.07532094, 1.798271, 0.9098039, 0, 1, 1,
0.8891817, -0.2363892, 2.202977, 0.9137255, 0, 1, 1,
0.89491, -0.06435926, 2.147328, 0.9215686, 0, 1, 1,
0.9050497, 0.2835962, 0.3994519, 0.9254902, 0, 1, 1,
0.9050607, 0.790897, 0.3599789, 0.9333333, 0, 1, 1,
0.9074659, 0.8851781, 2.521169, 0.9372549, 0, 1, 1,
0.9110737, 0.3613263, -0.04325563, 0.945098, 0, 1, 1,
0.9140559, 1.565096, 1.715361, 0.9490196, 0, 1, 1,
0.9269476, -0.474198, 3.685689, 0.9568627, 0, 1, 1,
0.9403882, -0.2106552, 1.338644, 0.9607843, 0, 1, 1,
0.9424633, -1.553811, 2.16767, 0.9686275, 0, 1, 1,
0.9442333, 2.436711, -0.2824086, 0.972549, 0, 1, 1,
0.9514297, 0.5224274, 0.7517282, 0.9803922, 0, 1, 1,
0.9590999, 1.027998, 0.4431942, 0.9843137, 0, 1, 1,
0.9615069, -1.841961, 4.754104, 0.9921569, 0, 1, 1,
0.9635533, -0.3944113, 3.379435, 0.9960784, 0, 1, 1,
0.9742896, 0.4420919, 1.552219, 1, 0, 0.9960784, 1,
0.9764989, -0.6683837, 3.037252, 1, 0, 0.9882353, 1,
0.9796534, -0.1148187, 2.547385, 1, 0, 0.9843137, 1,
0.980336, -0.4849797, 3.178031, 1, 0, 0.9764706, 1,
0.9864243, -0.06574365, 1.714785, 1, 0, 0.972549, 1,
0.9939067, -1.267962, 1.503795, 1, 0, 0.9647059, 1,
0.9958857, 0.7594125, 0.003173357, 1, 0, 0.9607843, 1,
0.9969046, 1.292619, 1.03755, 1, 0, 0.9529412, 1,
1.00428, -2.145493, 3.130934, 1, 0, 0.9490196, 1,
1.004777, -0.258164, 2.79964, 1, 0, 0.9411765, 1,
1.019476, -0.7718028, 3.323821, 1, 0, 0.9372549, 1,
1.020949, -0.005867708, 1.782046, 1, 0, 0.9294118, 1,
1.029223, 0.2202851, 0.004489316, 1, 0, 0.9254902, 1,
1.032041, -0.6579602, 2.29173, 1, 0, 0.9176471, 1,
1.039548, 1.143033, 1.979104, 1, 0, 0.9137255, 1,
1.039887, 1.194327, -0.7885754, 1, 0, 0.9058824, 1,
1.042231, -0.3388048, 2.712176, 1, 0, 0.9019608, 1,
1.04291, -0.207248, 0.03600827, 1, 0, 0.8941177, 1,
1.043482, -0.8924556, 2.495845, 1, 0, 0.8862745, 1,
1.047644, 0.1259463, 2.059378, 1, 0, 0.8823529, 1,
1.0531, 0.9871147, 0.7764934, 1, 0, 0.8745098, 1,
1.053849, -0.3315344, 4.052867, 1, 0, 0.8705882, 1,
1.057172, 0.8920424, -0.5319917, 1, 0, 0.8627451, 1,
1.058937, -0.2395246, 2.479031, 1, 0, 0.8588235, 1,
1.05979, 0.159795, 1.797043, 1, 0, 0.8509804, 1,
1.062336, 1.366101, 0.00041851, 1, 0, 0.8470588, 1,
1.062986, -1.436556, 2.654276, 1, 0, 0.8392157, 1,
1.067482, 0.8050027, 0.04165475, 1, 0, 0.8352941, 1,
1.067914, -0.3112979, 2.228575, 1, 0, 0.827451, 1,
1.08326, -1.131562, 1.32876, 1, 0, 0.8235294, 1,
1.08478, -2.249458, 2.859825, 1, 0, 0.8156863, 1,
1.088061, 0.07187241, 1.728902, 1, 0, 0.8117647, 1,
1.099934, 0.07952008, 0.1555876, 1, 0, 0.8039216, 1,
1.101777, -0.8591535, 0.4206733, 1, 0, 0.7960784, 1,
1.102449, -0.4287798, 2.284121, 1, 0, 0.7921569, 1,
1.104898, 1.175471, 1.520967, 1, 0, 0.7843137, 1,
1.109202, 0.2924918, 3.24376, 1, 0, 0.7803922, 1,
1.115347, 1.111774, 2.26663, 1, 0, 0.772549, 1,
1.116354, 1.023911, 0.5804282, 1, 0, 0.7686275, 1,
1.131766, -0.5498582, 0.8820127, 1, 0, 0.7607843, 1,
1.135845, 0.4318887, 1.277868, 1, 0, 0.7568628, 1,
1.137062, 0.2328397, 2.014239, 1, 0, 0.7490196, 1,
1.137973, 0.08412834, 3.208175, 1, 0, 0.7450981, 1,
1.142707, 1.909059, -1.059605, 1, 0, 0.7372549, 1,
1.14286, 0.4026684, 0.5055771, 1, 0, 0.7333333, 1,
1.144727, 0.1034675, 0.7017393, 1, 0, 0.7254902, 1,
1.154703, 0.5547478, 1.098299, 1, 0, 0.7215686, 1,
1.158477, -2.933057, 2.030862, 1, 0, 0.7137255, 1,
1.16499, 2.679134, -1.085037, 1, 0, 0.7098039, 1,
1.175565, 1.039706, 1.851636, 1, 0, 0.7019608, 1,
1.178732, 0.441859, 1.397547, 1, 0, 0.6941177, 1,
1.184572, -0.1887833, 2.433951, 1, 0, 0.6901961, 1,
1.18726, -0.3873793, 3.121292, 1, 0, 0.682353, 1,
1.197213, -0.2925393, 2.327143, 1, 0, 0.6784314, 1,
1.201882, -2.042001, 2.243896, 1, 0, 0.6705883, 1,
1.202676, -0.174347, 0.6903879, 1, 0, 0.6666667, 1,
1.202999, -1.77943, 1.13313, 1, 0, 0.6588235, 1,
1.207528, -2.375992, 3.349189, 1, 0, 0.654902, 1,
1.21265, -0.2476103, 2.165396, 1, 0, 0.6470588, 1,
1.224909, 0.5977356, 1.329545, 1, 0, 0.6431373, 1,
1.22766, 2.342782, 3.390634, 1, 0, 0.6352941, 1,
1.230037, 0.8502476, 1.153733, 1, 0, 0.6313726, 1,
1.230155, -0.5897931, -0.3931955, 1, 0, 0.6235294, 1,
1.231633, 0.8639874, 1.314558, 1, 0, 0.6196079, 1,
1.244106, 2.113081, 0.4669297, 1, 0, 0.6117647, 1,
1.245179, -0.903581, 1.252817, 1, 0, 0.6078432, 1,
1.254313, 1.892006, -0.833913, 1, 0, 0.6, 1,
1.269832, 1.896914, -1.329015, 1, 0, 0.5921569, 1,
1.270425, -1.182719, 2.094594, 1, 0, 0.5882353, 1,
1.271122, -2.133373, 2.535294, 1, 0, 0.5803922, 1,
1.273366, -0.2583143, 3.150879, 1, 0, 0.5764706, 1,
1.279886, -1.511878, 1.715123, 1, 0, 0.5686275, 1,
1.287041, -1.20943, 1.043497, 1, 0, 0.5647059, 1,
1.287571, 0.6693191, 1.561658, 1, 0, 0.5568628, 1,
1.301923, -0.5012341, 3.32659, 1, 0, 0.5529412, 1,
1.312537, 1.477571, -0.5276236, 1, 0, 0.5450981, 1,
1.312726, 1.113921, 0.1219564, 1, 0, 0.5411765, 1,
1.313885, 1.054659, 1.119712, 1, 0, 0.5333334, 1,
1.323371, 0.1901994, 3.030529, 1, 0, 0.5294118, 1,
1.330032, 1.53612, 1.46706, 1, 0, 0.5215687, 1,
1.337204, -0.1298151, 0.4314257, 1, 0, 0.5176471, 1,
1.341422, -0.5937153, 1.039553, 1, 0, 0.509804, 1,
1.361315, 1.313478, 1.569817, 1, 0, 0.5058824, 1,
1.365957, -0.989167, 1.502187, 1, 0, 0.4980392, 1,
1.375807, -1.666501, 3.178261, 1, 0, 0.4901961, 1,
1.396371, -1.166754, 1.738021, 1, 0, 0.4862745, 1,
1.410659, 0.6539719, 0.117825, 1, 0, 0.4784314, 1,
1.411452, -0.1169154, 3.195695, 1, 0, 0.4745098, 1,
1.415181, 1.228719, 3.233219, 1, 0, 0.4666667, 1,
1.419265, -0.6559579, 1.935672, 1, 0, 0.4627451, 1,
1.422014, -0.3289177, 2.117057, 1, 0, 0.454902, 1,
1.442725, -0.3827875, 1.340271, 1, 0, 0.4509804, 1,
1.457616, -0.7463161, 0.4882075, 1, 0, 0.4431373, 1,
1.459018, 0.7562805, 2.796717, 1, 0, 0.4392157, 1,
1.461053, -1.141184, 0.9658434, 1, 0, 0.4313726, 1,
1.464735, 0.2512389, 0.5271605, 1, 0, 0.427451, 1,
1.464936, 0.2540683, 1.262614, 1, 0, 0.4196078, 1,
1.466315, -1.043504, 1.328783, 1, 0, 0.4156863, 1,
1.479527, -0.4123979, 0.5932289, 1, 0, 0.4078431, 1,
1.486938, 1.66397, -0.02459319, 1, 0, 0.4039216, 1,
1.487526, 0.07813419, 1.75842, 1, 0, 0.3960784, 1,
1.497276, 0.4999591, 1.320842, 1, 0, 0.3882353, 1,
1.51131, -0.1708947, 2.761794, 1, 0, 0.3843137, 1,
1.524123, -1.029957, 2.541479, 1, 0, 0.3764706, 1,
1.531614, 0.6531955, 1.359733, 1, 0, 0.372549, 1,
1.53791, -1.204478, 2.400745, 1, 0, 0.3647059, 1,
1.538078, 0.9300134, 0.1917207, 1, 0, 0.3607843, 1,
1.546675, -0.8095238, 2.267461, 1, 0, 0.3529412, 1,
1.572066, -0.4330717, 4.103351, 1, 0, 0.3490196, 1,
1.583287, 1.059833, 0.8745319, 1, 0, 0.3411765, 1,
1.595541, 0.2249438, 0.8933409, 1, 0, 0.3372549, 1,
1.599923, -0.9757258, 1.806968, 1, 0, 0.3294118, 1,
1.612453, -0.8651022, 2.543774, 1, 0, 0.3254902, 1,
1.616454, -0.6523772, 2.47041, 1, 0, 0.3176471, 1,
1.619703, -0.7980871, 1.820979, 1, 0, 0.3137255, 1,
1.633856, -1.312295, 1.32494, 1, 0, 0.3058824, 1,
1.635269, 0.08895224, -0.1082312, 1, 0, 0.2980392, 1,
1.642091, 1.304185, 0.149831, 1, 0, 0.2941177, 1,
1.646661, -0.5006945, 0.8599832, 1, 0, 0.2862745, 1,
1.648344, -1.16912, -0.7139683, 1, 0, 0.282353, 1,
1.655663, 0.7717271, 1.802698, 1, 0, 0.2745098, 1,
1.662795, 1.471289, 0.6705094, 1, 0, 0.2705882, 1,
1.662869, -0.9784683, 1.795774, 1, 0, 0.2627451, 1,
1.664019, 1.662566, 1.360735, 1, 0, 0.2588235, 1,
1.668104, 0.7557563, 0.7543287, 1, 0, 0.2509804, 1,
1.680441, -0.649001, 1.693595, 1, 0, 0.2470588, 1,
1.700233, -1.008468, 4.22224, 1, 0, 0.2392157, 1,
1.714442, 0.1087029, -0.1436812, 1, 0, 0.2352941, 1,
1.741235, 0.312467, 1.229313, 1, 0, 0.227451, 1,
1.772127, -1.311134, 1.88052, 1, 0, 0.2235294, 1,
1.780842, 0.859138, 0.4357145, 1, 0, 0.2156863, 1,
1.805194, -0.2484702, 2.100725, 1, 0, 0.2117647, 1,
1.810498, 1.651661, 0.538506, 1, 0, 0.2039216, 1,
1.822486, -2.313136, 3.444233, 1, 0, 0.1960784, 1,
1.845551, -0.6797124, -0.04543189, 1, 0, 0.1921569, 1,
1.858874, 0.04752544, 1.049325, 1, 0, 0.1843137, 1,
1.86941, -0.2259632, 2.913584, 1, 0, 0.1803922, 1,
1.90318, 1.520094, 0.9101648, 1, 0, 0.172549, 1,
1.905969, 1.356004, 3.069078, 1, 0, 0.1686275, 1,
1.907756, -1.976091, 3.464305, 1, 0, 0.1607843, 1,
1.914128, 1.406333, 0.1786387, 1, 0, 0.1568628, 1,
1.943198, 0.6667381, 0.8539101, 1, 0, 0.1490196, 1,
1.977641, -0.9479441, 2.663016, 1, 0, 0.145098, 1,
1.9914, 0.3321134, 3.199903, 1, 0, 0.1372549, 1,
1.995291, 0.2759302, -0.4613421, 1, 0, 0.1333333, 1,
2.012976, 0.08257663, 1.613177, 1, 0, 0.1254902, 1,
2.021569, 0.4346545, 0.7781672, 1, 0, 0.1215686, 1,
2.044497, 0.1900682, 2.108111, 1, 0, 0.1137255, 1,
2.050829, -0.9542534, 1.311852, 1, 0, 0.1098039, 1,
2.064532, 2.245457, 0.9948416, 1, 0, 0.1019608, 1,
2.066724, 0.6428028, 2.839481, 1, 0, 0.09411765, 1,
2.083365, 0.8393044, 1.676358, 1, 0, 0.09019608, 1,
2.104479, 2.447992, 0.6857731, 1, 0, 0.08235294, 1,
2.104641, -0.04471483, 2.638784, 1, 0, 0.07843138, 1,
2.16339, -1.912453, 4.616499, 1, 0, 0.07058824, 1,
2.211108, -1.613985, 2.273823, 1, 0, 0.06666667, 1,
2.218051, -0.1034798, 1.985933, 1, 0, 0.05882353, 1,
2.236179, -2.407449, 2.930924, 1, 0, 0.05490196, 1,
2.264372, -0.469548, 3.195004, 1, 0, 0.04705882, 1,
2.284075, -0.2514906, 2.035784, 1, 0, 0.04313726, 1,
2.286544, 0.06005014, 4.02926, 1, 0, 0.03529412, 1,
2.336414, 2.346612, 0.2968317, 1, 0, 0.03137255, 1,
2.340363, -0.5941446, 0.8147951, 1, 0, 0.02352941, 1,
2.473886, 1.486786, -0.5939531, 1, 0, 0.01960784, 1,
2.691257, -1.251342, 3.078048, 1, 0, 0.01176471, 1,
2.730964, 0.08169929, 2.888002, 1, 0, 0.007843138, 1
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
-0.2850248, -4.175381, -7.777095, 0, -0.5, 0.5, 0.5,
-0.2850248, -4.175381, -7.777095, 1, -0.5, 0.5, 0.5,
-0.2850248, -4.175381, -7.777095, 1, 1.5, 0.5, 0.5,
-0.2850248, -4.175381, -7.777095, 0, 1.5, 0.5, 0.5
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
-4.323434, -0.1771333, -7.777095, 0, -0.5, 0.5, 0.5,
-4.323434, -0.1771333, -7.777095, 1, -0.5, 0.5, 0.5,
-4.323434, -0.1771333, -7.777095, 1, 1.5, 0.5, 0.5,
-4.323434, -0.1771333, -7.777095, 0, 1.5, 0.5, 0.5
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
-4.323434, -4.175381, -0.1253619, 0, -0.5, 0.5, 0.5,
-4.323434, -4.175381, -0.1253619, 1, -0.5, 0.5, 0.5,
-4.323434, -4.175381, -0.1253619, 1, 1.5, 0.5, 0.5,
-4.323434, -4.175381, -0.1253619, 0, 1.5, 0.5, 0.5
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
-3, -3.252709, -6.011311,
2, -3.252709, -6.011311,
-3, -3.252709, -6.011311,
-3, -3.406487, -6.305608,
-2, -3.252709, -6.011311,
-2, -3.406487, -6.305608,
-1, -3.252709, -6.011311,
-1, -3.406487, -6.305608,
0, -3.252709, -6.011311,
0, -3.406487, -6.305608,
1, -3.252709, -6.011311,
1, -3.406487, -6.305608,
2, -3.252709, -6.011311,
2, -3.406487, -6.305608
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
-3, -3.714045, -6.894203, 0, -0.5, 0.5, 0.5,
-3, -3.714045, -6.894203, 1, -0.5, 0.5, 0.5,
-3, -3.714045, -6.894203, 1, 1.5, 0.5, 0.5,
-3, -3.714045, -6.894203, 0, 1.5, 0.5, 0.5,
-2, -3.714045, -6.894203, 0, -0.5, 0.5, 0.5,
-2, -3.714045, -6.894203, 1, -0.5, 0.5, 0.5,
-2, -3.714045, -6.894203, 1, 1.5, 0.5, 0.5,
-2, -3.714045, -6.894203, 0, 1.5, 0.5, 0.5,
-1, -3.714045, -6.894203, 0, -0.5, 0.5, 0.5,
-1, -3.714045, -6.894203, 1, -0.5, 0.5, 0.5,
-1, -3.714045, -6.894203, 1, 1.5, 0.5, 0.5,
-1, -3.714045, -6.894203, 0, 1.5, 0.5, 0.5,
0, -3.714045, -6.894203, 0, -0.5, 0.5, 0.5,
0, -3.714045, -6.894203, 1, -0.5, 0.5, 0.5,
0, -3.714045, -6.894203, 1, 1.5, 0.5, 0.5,
0, -3.714045, -6.894203, 0, 1.5, 0.5, 0.5,
1, -3.714045, -6.894203, 0, -0.5, 0.5, 0.5,
1, -3.714045, -6.894203, 1, -0.5, 0.5, 0.5,
1, -3.714045, -6.894203, 1, 1.5, 0.5, 0.5,
1, -3.714045, -6.894203, 0, 1.5, 0.5, 0.5,
2, -3.714045, -6.894203, 0, -0.5, 0.5, 0.5,
2, -3.714045, -6.894203, 1, -0.5, 0.5, 0.5,
2, -3.714045, -6.894203, 1, 1.5, 0.5, 0.5,
2, -3.714045, -6.894203, 0, 1.5, 0.5, 0.5
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
-3.391493, -3, -6.011311,
-3.391493, 2, -6.011311,
-3.391493, -3, -6.011311,
-3.546817, -3, -6.305608,
-3.391493, -2, -6.011311,
-3.546817, -2, -6.305608,
-3.391493, -1, -6.011311,
-3.546817, -1, -6.305608,
-3.391493, 0, -6.011311,
-3.546817, 0, -6.305608,
-3.391493, 1, -6.011311,
-3.546817, 1, -6.305608,
-3.391493, 2, -6.011311,
-3.546817, 2, -6.305608
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
-3.857463, -3, -6.894203, 0, -0.5, 0.5, 0.5,
-3.857463, -3, -6.894203, 1, -0.5, 0.5, 0.5,
-3.857463, -3, -6.894203, 1, 1.5, 0.5, 0.5,
-3.857463, -3, -6.894203, 0, 1.5, 0.5, 0.5,
-3.857463, -2, -6.894203, 0, -0.5, 0.5, 0.5,
-3.857463, -2, -6.894203, 1, -0.5, 0.5, 0.5,
-3.857463, -2, -6.894203, 1, 1.5, 0.5, 0.5,
-3.857463, -2, -6.894203, 0, 1.5, 0.5, 0.5,
-3.857463, -1, -6.894203, 0, -0.5, 0.5, 0.5,
-3.857463, -1, -6.894203, 1, -0.5, 0.5, 0.5,
-3.857463, -1, -6.894203, 1, 1.5, 0.5, 0.5,
-3.857463, -1, -6.894203, 0, 1.5, 0.5, 0.5,
-3.857463, 0, -6.894203, 0, -0.5, 0.5, 0.5,
-3.857463, 0, -6.894203, 1, -0.5, 0.5, 0.5,
-3.857463, 0, -6.894203, 1, 1.5, 0.5, 0.5,
-3.857463, 0, -6.894203, 0, 1.5, 0.5, 0.5,
-3.857463, 1, -6.894203, 0, -0.5, 0.5, 0.5,
-3.857463, 1, -6.894203, 1, -0.5, 0.5, 0.5,
-3.857463, 1, -6.894203, 1, 1.5, 0.5, 0.5,
-3.857463, 1, -6.894203, 0, 1.5, 0.5, 0.5,
-3.857463, 2, -6.894203, 0, -0.5, 0.5, 0.5,
-3.857463, 2, -6.894203, 1, -0.5, 0.5, 0.5,
-3.857463, 2, -6.894203, 1, 1.5, 0.5, 0.5,
-3.857463, 2, -6.894203, 0, 1.5, 0.5, 0.5
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
-3.391493, -3.252709, -4,
-3.391493, -3.252709, 4,
-3.391493, -3.252709, -4,
-3.546817, -3.406487, -4,
-3.391493, -3.252709, -2,
-3.546817, -3.406487, -2,
-3.391493, -3.252709, 0,
-3.546817, -3.406487, 0,
-3.391493, -3.252709, 2,
-3.546817, -3.406487, 2,
-3.391493, -3.252709, 4,
-3.546817, -3.406487, 4
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
-3.857463, -3.714045, -4, 0, -0.5, 0.5, 0.5,
-3.857463, -3.714045, -4, 1, -0.5, 0.5, 0.5,
-3.857463, -3.714045, -4, 1, 1.5, 0.5, 0.5,
-3.857463, -3.714045, -4, 0, 1.5, 0.5, 0.5,
-3.857463, -3.714045, -2, 0, -0.5, 0.5, 0.5,
-3.857463, -3.714045, -2, 1, -0.5, 0.5, 0.5,
-3.857463, -3.714045, -2, 1, 1.5, 0.5, 0.5,
-3.857463, -3.714045, -2, 0, 1.5, 0.5, 0.5,
-3.857463, -3.714045, 0, 0, -0.5, 0.5, 0.5,
-3.857463, -3.714045, 0, 1, -0.5, 0.5, 0.5,
-3.857463, -3.714045, 0, 1, 1.5, 0.5, 0.5,
-3.857463, -3.714045, 0, 0, 1.5, 0.5, 0.5,
-3.857463, -3.714045, 2, 0, -0.5, 0.5, 0.5,
-3.857463, -3.714045, 2, 1, -0.5, 0.5, 0.5,
-3.857463, -3.714045, 2, 1, 1.5, 0.5, 0.5,
-3.857463, -3.714045, 2, 0, 1.5, 0.5, 0.5,
-3.857463, -3.714045, 4, 0, -0.5, 0.5, 0.5,
-3.857463, -3.714045, 4, 1, -0.5, 0.5, 0.5,
-3.857463, -3.714045, 4, 1, 1.5, 0.5, 0.5,
-3.857463, -3.714045, 4, 0, 1.5, 0.5, 0.5
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
-3.391493, -3.252709, -6.011311,
-3.391493, 2.898442, -6.011311,
-3.391493, -3.252709, 5.760587,
-3.391493, 2.898442, 5.760587,
-3.391493, -3.252709, -6.011311,
-3.391493, -3.252709, 5.760587,
-3.391493, 2.898442, -6.011311,
-3.391493, 2.898442, 5.760587,
-3.391493, -3.252709, -6.011311,
2.821444, -3.252709, -6.011311,
-3.391493, -3.252709, 5.760587,
2.821444, -3.252709, 5.760587,
-3.391493, 2.898442, -6.011311,
2.821444, 2.898442, -6.011311,
-3.391493, 2.898442, 5.760587,
2.821444, 2.898442, 5.760587,
2.821444, -3.252709, -6.011311,
2.821444, 2.898442, -6.011311,
2.821444, -3.252709, 5.760587,
2.821444, 2.898442, 5.760587,
2.821444, -3.252709, -6.011311,
2.821444, -3.252709, 5.760587,
2.821444, 2.898442, -6.011311,
2.821444, 2.898442, 5.760587
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
var radius = 7.829962;
var distance = 34.83638;
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
mvMatrix.translate( 0.2850248, 0.1771333, 0.1253619 );
mvMatrix.scale( 1.362626, 1.376313, 0.7191626 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.83638);
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
thifluzamide<-read.table("thifluzamide.xyz")
```

```
## Error in read.table("thifluzamide.xyz"): no lines available in input
```

```r
x<-thifluzamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'thifluzamide' not found
```

```r
y<-thifluzamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'thifluzamide' not found
```

```r
z<-thifluzamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'thifluzamide' not found
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
-3.301013, 0.7028531, -2.633667, 0, 0, 1, 1, 1,
-2.92122, 0.2898951, -0.4800827, 1, 0, 0, 1, 1,
-2.476482, -0.6437476, -1.396744, 1, 0, 0, 1, 1,
-2.456455, 1.041817, -0.5106298, 1, 0, 0, 1, 1,
-2.417415, -0.2309807, -3.796005, 1, 0, 0, 1, 1,
-2.337196, 1.155968, -2.738009, 1, 0, 0, 1, 1,
-2.32984, -0.5246702, -1.324022, 0, 0, 0, 1, 1,
-2.322881, -0.3737183, -1.640165, 0, 0, 0, 1, 1,
-2.277171, 1.230076, -0.4146234, 0, 0, 0, 1, 1,
-2.235907, 0.5814618, -1.478058, 0, 0, 0, 1, 1,
-2.230026, 0.5974817, 0.3508992, 0, 0, 0, 1, 1,
-2.192816, -0.9045174, -2.475851, 0, 0, 0, 1, 1,
-2.159525, -0.3679097, -1.586661, 0, 0, 0, 1, 1,
-2.133283, -0.8098886, -4.121952, 1, 1, 1, 1, 1,
-2.125126, -0.4421991, -0.8335419, 1, 1, 1, 1, 1,
-2.089365, 0.1184249, -1.194611, 1, 1, 1, 1, 1,
-2.088253, -0.7774373, -1.888945, 1, 1, 1, 1, 1,
-2.040534, -0.5711504, -2.019464, 1, 1, 1, 1, 1,
-2.036563, 0.02764126, -0.7095405, 1, 1, 1, 1, 1,
-2.029139, -0.8180517, -1.273501, 1, 1, 1, 1, 1,
-2.014936, -0.674169, -2.874955, 1, 1, 1, 1, 1,
-1.995407, -0.6462479, -2.166373, 1, 1, 1, 1, 1,
-1.994664, 1.052193, 0.2371078, 1, 1, 1, 1, 1,
-1.957294, -0.3377851, -0.7240351, 1, 1, 1, 1, 1,
-1.956038, 0.4083491, -1.420244, 1, 1, 1, 1, 1,
-1.947234, 0.912777, 0.7805737, 1, 1, 1, 1, 1,
-1.923713, 0.7766144, -1.355294, 1, 1, 1, 1, 1,
-1.921511, 2.019661, -2.927986, 1, 1, 1, 1, 1,
-1.887926, -0.6917217, -0.8418086, 0, 0, 1, 1, 1,
-1.842214, 1.32291, -0.08686139, 1, 0, 0, 1, 1,
-1.839605, 0.9036615, -2.898625, 1, 0, 0, 1, 1,
-1.822144, 0.8475994, -1.169646, 1, 0, 0, 1, 1,
-1.787032, 0.05817362, -1.02783, 1, 0, 0, 1, 1,
-1.757305, -1.173935, -2.349756, 1, 0, 0, 1, 1,
-1.736216, -1.269943, -2.496937, 0, 0, 0, 1, 1,
-1.721017, 0.7836014, -0.9693033, 0, 0, 0, 1, 1,
-1.719295, 0.8103057, -1.100666, 0, 0, 0, 1, 1,
-1.71458, 0.08498802, -1.66361, 0, 0, 0, 1, 1,
-1.711602, 0.491394, -0.2913686, 0, 0, 0, 1, 1,
-1.700722, 0.7437833, 0.07444269, 0, 0, 0, 1, 1,
-1.694594, -1.615661, -2.454082, 0, 0, 0, 1, 1,
-1.669093, 1.418875, -3.322473, 1, 1, 1, 1, 1,
-1.664118, -1.042645, -1.587631, 1, 1, 1, 1, 1,
-1.663696, 0.3946474, -0.9205819, 1, 1, 1, 1, 1,
-1.655504, 0.8160691, -1.680619, 1, 1, 1, 1, 1,
-1.619155, 1.080057, 0.4684965, 1, 1, 1, 1, 1,
-1.615036, 0.06397165, -1.456199, 1, 1, 1, 1, 1,
-1.611771, 1.17347, -1.994814, 1, 1, 1, 1, 1,
-1.545034, 0.8885943, -2.203267, 1, 1, 1, 1, 1,
-1.543375, -0.4098156, -2.549997, 1, 1, 1, 1, 1,
-1.529529, 1.381208, -1.888047, 1, 1, 1, 1, 1,
-1.524545, -0.1134837, -2.078664, 1, 1, 1, 1, 1,
-1.501829, 1.161885, -0.6794997, 1, 1, 1, 1, 1,
-1.473641, -0.3979038, -1.325127, 1, 1, 1, 1, 1,
-1.460217, 1.690029, -2.444891, 1, 1, 1, 1, 1,
-1.445521, -0.2411786, -1.923305, 1, 1, 1, 1, 1,
-1.44126, 0.2390728, -1.225229, 0, 0, 1, 1, 1,
-1.407633, 0.5918953, -1.542886, 1, 0, 0, 1, 1,
-1.403931, 0.2896644, -2.098897, 1, 0, 0, 1, 1,
-1.382716, 0.7120751, -1.448521, 1, 0, 0, 1, 1,
-1.380614, -0.3567215, -0.8413167, 1, 0, 0, 1, 1,
-1.380219, -0.9376184, -2.341326, 1, 0, 0, 1, 1,
-1.373777, 1.006665, -1.834316, 0, 0, 0, 1, 1,
-1.37321, -0.1712848, 0.01444957, 0, 0, 0, 1, 1,
-1.352894, 1.452675, -2.008877, 0, 0, 0, 1, 1,
-1.352225, -0.4410329, -1.48303, 0, 0, 0, 1, 1,
-1.345897, -0.4155895, -2.016531, 0, 0, 0, 1, 1,
-1.345805, -1.964292, -0.9684016, 0, 0, 0, 1, 1,
-1.338064, -1.9229, -1.630004, 0, 0, 0, 1, 1,
-1.336971, -0.9282551, -3.483225, 1, 1, 1, 1, 1,
-1.331694, -0.7778539, -2.088271, 1, 1, 1, 1, 1,
-1.323242, 0.1585338, -0.346735, 1, 1, 1, 1, 1,
-1.320053, -0.4858862, -1.419402, 1, 1, 1, 1, 1,
-1.314684, -0.8145657, -1.814892, 1, 1, 1, 1, 1,
-1.305386, -0.9065346, -2.36796, 1, 1, 1, 1, 1,
-1.296289, 1.299717, -2.046429, 1, 1, 1, 1, 1,
-1.292556, -0.9773871, -1.904479, 1, 1, 1, 1, 1,
-1.290722, -0.3304316, 1.085389, 1, 1, 1, 1, 1,
-1.287026, 0.4177473, -0.2690859, 1, 1, 1, 1, 1,
-1.2863, 0.4854762, -0.583495, 1, 1, 1, 1, 1,
-1.282279, -1.742083, -3.583391, 1, 1, 1, 1, 1,
-1.279876, -0.7290343, -3.47427, 1, 1, 1, 1, 1,
-1.277046, 0.2033405, -3.524841, 1, 1, 1, 1, 1,
-1.273302, 1.358414, 0.1069405, 1, 1, 1, 1, 1,
-1.267111, 0.3703559, 0.08790521, 0, 0, 1, 1, 1,
-1.265113, 0.1038315, -2.276778, 1, 0, 0, 1, 1,
-1.263363, 0.7084339, 0.009860657, 1, 0, 0, 1, 1,
-1.262584, 0.3354272, -1.739183, 1, 0, 0, 1, 1,
-1.245929, -1.835605, -2.106649, 1, 0, 0, 1, 1,
-1.237939, 1.568418, -0.8091174, 1, 0, 0, 1, 1,
-1.225001, 1.349767, -0.6663461, 0, 0, 0, 1, 1,
-1.22421, 2.71697, 1.305999, 0, 0, 0, 1, 1,
-1.223577, 1.271604, -1.017262, 0, 0, 0, 1, 1,
-1.221165, 1.431879, -1.345392, 0, 0, 0, 1, 1,
-1.21031, -2.00198, -2.666162, 0, 0, 0, 1, 1,
-1.201018, -1.173883, -1.79924, 0, 0, 0, 1, 1,
-1.200981, -0.6333236, -0.6957052, 0, 0, 0, 1, 1,
-1.194894, -0.734192, -2.440849, 1, 1, 1, 1, 1,
-1.190065, 1.416385, -0.4202056, 1, 1, 1, 1, 1,
-1.183732, -0.8933617, -3.597904, 1, 1, 1, 1, 1,
-1.183335, -1.033959, -1.211451, 1, 1, 1, 1, 1,
-1.183151, 0.1403333, -2.139201, 1, 1, 1, 1, 1,
-1.175328, -1.666491, -2.485904, 1, 1, 1, 1, 1,
-1.173113, -0.4954768, -2.032974, 1, 1, 1, 1, 1,
-1.172015, -0.6467368, 0.2534185, 1, 1, 1, 1, 1,
-1.164724, 0.4976799, 1.325441, 1, 1, 1, 1, 1,
-1.163159, 1.88954, -1.440602, 1, 1, 1, 1, 1,
-1.151345, 0.3205188, -1.417144, 1, 1, 1, 1, 1,
-1.136668, 0.2599374, -2.031734, 1, 1, 1, 1, 1,
-1.136498, -0.02429022, -1.734266, 1, 1, 1, 1, 1,
-1.135431, -0.6500248, -1.699882, 1, 1, 1, 1, 1,
-1.121374, 1.744009, -0.2293267, 1, 1, 1, 1, 1,
-1.120947, -0.8468674, -2.922295, 0, 0, 1, 1, 1,
-1.114531, -1.51623, -0.02915061, 1, 0, 0, 1, 1,
-1.113215, 0.4616453, -1.504004, 1, 0, 0, 1, 1,
-1.106339, 0.6588345, -0.06247612, 1, 0, 0, 1, 1,
-1.104376, -0.3536376, -2.490536, 1, 0, 0, 1, 1,
-1.101957, 0.9263881, 0.2168956, 1, 0, 0, 1, 1,
-1.09259, -0.936402, -1.577967, 0, 0, 0, 1, 1,
-1.079833, -3.019435, -2.552229, 0, 0, 0, 1, 1,
-1.073905, 1.633053, -2.088962, 0, 0, 0, 1, 1,
-1.071645, 2.228059, 0.9165879, 0, 0, 0, 1, 1,
-1.063782, 1.398202, 1.004959, 0, 0, 0, 1, 1,
-1.063575, 1.702239, -0.3384191, 0, 0, 0, 1, 1,
-1.061032, 0.1981038, 0.2066461, 0, 0, 0, 1, 1,
-1.056264, -0.5393206, -1.684878, 1, 1, 1, 1, 1,
-1.055399, 1.108511, -0.6473219, 1, 1, 1, 1, 1,
-1.046724, 0.2514226, -1.274241, 1, 1, 1, 1, 1,
-1.038612, 0.8783982, -0.0256183, 1, 1, 1, 1, 1,
-1.020827, 2.39041, 0.2841451, 1, 1, 1, 1, 1,
-1.019868, 1.185988, 0.9973843, 1, 1, 1, 1, 1,
-1.019639, -0.4706396, -2.268956, 1, 1, 1, 1, 1,
-1.017745, 0.489296, -0.9321065, 1, 1, 1, 1, 1,
-1.016623, -1.874831, -3.076789, 1, 1, 1, 1, 1,
-1.016071, 0.3916714, 0.4934289, 1, 1, 1, 1, 1,
-1.012766, -1.607191, -3.424838, 1, 1, 1, 1, 1,
-1.007615, -1.196985, -4.136629, 1, 1, 1, 1, 1,
-1.007506, -0.8450143, -0.5881437, 1, 1, 1, 1, 1,
-1.004095, -0.06947795, -2.174299, 1, 1, 1, 1, 1,
-0.9992766, 0.04840421, -2.470967, 1, 1, 1, 1, 1,
-0.9963663, -1.000333, -1.055011, 0, 0, 1, 1, 1,
-0.9957786, -0.5558376, -1.771802, 1, 0, 0, 1, 1,
-0.9947585, 0.7346073, -1.27405, 1, 0, 0, 1, 1,
-0.9918298, -0.6011451, -3.607521, 1, 0, 0, 1, 1,
-0.986218, 1.898475, 0.6425215, 1, 0, 0, 1, 1,
-0.9829018, -0.3598731, -1.922738, 1, 0, 0, 1, 1,
-0.9773502, -0.1505307, -1.718964, 0, 0, 0, 1, 1,
-0.9768552, -0.8351512, -1.879868, 0, 0, 0, 1, 1,
-0.9702677, -0.3531931, -3.768391, 0, 0, 0, 1, 1,
-0.9638489, -1.149555, -1.447624, 0, 0, 0, 1, 1,
-0.9635754, -0.9309897, -2.581697, 0, 0, 0, 1, 1,
-0.9635584, -1.107727, -3.694295, 0, 0, 0, 1, 1,
-0.9618663, 0.5708826, -2.316286, 0, 0, 0, 1, 1,
-0.9540086, 0.7241018, -0.9345018, 1, 1, 1, 1, 1,
-0.9473636, -0.6757016, -2.029382, 1, 1, 1, 1, 1,
-0.9427643, 0.2169293, -2.52986, 1, 1, 1, 1, 1,
-0.939213, -1.793759, -2.823595, 1, 1, 1, 1, 1,
-0.9348335, 0.08796932, -1.456099, 1, 1, 1, 1, 1,
-0.9339131, -0.3783207, -2.737221, 1, 1, 1, 1, 1,
-0.9338741, 1.630802, -0.1009737, 1, 1, 1, 1, 1,
-0.9300737, 0.6163687, -1.387092, 1, 1, 1, 1, 1,
-0.9299954, -1.154592, -2.224015, 1, 1, 1, 1, 1,
-0.9257385, 0.5425614, -2.759266, 1, 1, 1, 1, 1,
-0.9238489, -0.7910714, -1.814619, 1, 1, 1, 1, 1,
-0.9203106, -0.7290642, -2.873384, 1, 1, 1, 1, 1,
-0.9174043, -0.9185914, -1.305135, 1, 1, 1, 1, 1,
-0.9167037, -1.080371, -3.217388, 1, 1, 1, 1, 1,
-0.9137878, 0.903069, -0.6595287, 1, 1, 1, 1, 1,
-0.9134433, -2.390676, -3.825218, 0, 0, 1, 1, 1,
-0.9084775, 0.7726213, 0.2383795, 1, 0, 0, 1, 1,
-0.9048943, -0.5891265, -1.1496, 1, 0, 0, 1, 1,
-0.9047455, 0.06909002, -1.996804, 1, 0, 0, 1, 1,
-0.9043574, 1.418086, -1.103566, 1, 0, 0, 1, 1,
-0.9014156, 0.6013917, -1.230359, 1, 0, 0, 1, 1,
-0.8959292, -1.206331, -0.8231957, 0, 0, 0, 1, 1,
-0.8941146, 0.2562992, -0.855355, 0, 0, 0, 1, 1,
-0.8908151, -0.2958614, -1.648662, 0, 0, 0, 1, 1,
-0.884181, 1.446731, 0.4414005, 0, 0, 0, 1, 1,
-0.8782433, -1.483481, -3.058676, 0, 0, 0, 1, 1,
-0.8681387, 0.1543281, -2.414747, 0, 0, 0, 1, 1,
-0.8646999, 1.156016, -1.625164, 0, 0, 0, 1, 1,
-0.8568023, 1.206108, -2.193496, 1, 1, 1, 1, 1,
-0.8558146, -1.026299, -3.329518, 1, 1, 1, 1, 1,
-0.8473784, 0.4042163, -1.860278, 1, 1, 1, 1, 1,
-0.8450739, 0.5901911, -1.21284, 1, 1, 1, 1, 1,
-0.8410006, -0.1860003, -1.729949, 1, 1, 1, 1, 1,
-0.8380429, -1.519059, -2.999042, 1, 1, 1, 1, 1,
-0.837068, 0.1867028, -1.095314, 1, 1, 1, 1, 1,
-0.8368663, 0.493545, -0.7029067, 1, 1, 1, 1, 1,
-0.835954, -1.066973, -1.90865, 1, 1, 1, 1, 1,
-0.8344086, 0.8347971, -0.4131252, 1, 1, 1, 1, 1,
-0.8216543, -1.538404, -2.78271, 1, 1, 1, 1, 1,
-0.8213461, -1.530424, -3.274238, 1, 1, 1, 1, 1,
-0.8185093, 0.1784082, -1.907055, 1, 1, 1, 1, 1,
-0.8174951, -0.001551246, -1.538909, 1, 1, 1, 1, 1,
-0.8151275, -0.4921456, -3.083409, 1, 1, 1, 1, 1,
-0.813782, -0.4140984, -3.33715, 0, 0, 1, 1, 1,
-0.8105884, -0.4169358, -2.222146, 1, 0, 0, 1, 1,
-0.8098922, 0.6518843, 1.784544, 1, 0, 0, 1, 1,
-0.8098186, -0.08436545, -2.105952, 1, 0, 0, 1, 1,
-0.8023123, -0.3229694, -1.32557, 1, 0, 0, 1, 1,
-0.801209, -0.02479199, -2.744663, 1, 0, 0, 1, 1,
-0.7978023, 1.161756, 0.6488647, 0, 0, 0, 1, 1,
-0.7956398, 1.497701, -1.265671, 0, 0, 0, 1, 1,
-0.7907397, -1.429652, -3.567582, 0, 0, 0, 1, 1,
-0.7903146, -1.089659, -2.46193, 0, 0, 0, 1, 1,
-0.7784419, -0.5835814, -0.6003554, 0, 0, 0, 1, 1,
-0.7770266, 0.1943328, -1.426853, 0, 0, 0, 1, 1,
-0.7759006, 1.02161, -0.04348215, 0, 0, 0, 1, 1,
-0.775658, -0.3655435, -3.125104, 1, 1, 1, 1, 1,
-0.7747082, 0.4997679, -1.012122, 1, 1, 1, 1, 1,
-0.7714566, -0.3353623, -0.7059532, 1, 1, 1, 1, 1,
-0.7714544, -0.8664228, -2.540253, 1, 1, 1, 1, 1,
-0.7713063, -0.07865819, -2.064849, 1, 1, 1, 1, 1,
-0.7699689, -0.1366028, -2.117584, 1, 1, 1, 1, 1,
-0.7574779, -0.07778362, -2.206181, 1, 1, 1, 1, 1,
-0.75678, -0.3013008, -1.353892, 1, 1, 1, 1, 1,
-0.7509248, -0.6831739, -3.317034, 1, 1, 1, 1, 1,
-0.7497919, 0.115486, -2.992784, 1, 1, 1, 1, 1,
-0.7445745, -0.2319316, -2.796242, 1, 1, 1, 1, 1,
-0.7414979, -2.847035, -1.957574, 1, 1, 1, 1, 1,
-0.7409522, -1.005584, -2.217267, 1, 1, 1, 1, 1,
-0.7400768, -1.739669, -2.475634, 1, 1, 1, 1, 1,
-0.7367617, 0.7712401, -0.5635304, 1, 1, 1, 1, 1,
-0.724403, 1.752901, -1.478926, 0, 0, 1, 1, 1,
-0.7199636, 2.106849, 0.8516858, 1, 0, 0, 1, 1,
-0.7079689, 0.2735018, -1.071626, 1, 0, 0, 1, 1,
-0.7058505, 1.001125, -2.373679, 1, 0, 0, 1, 1,
-0.7052181, -2.246233, -2.548103, 1, 0, 0, 1, 1,
-0.6987176, 0.7440396, -3.133989, 1, 0, 0, 1, 1,
-0.6980544, -0.09857299, -3.381015, 0, 0, 0, 1, 1,
-0.6924544, 0.3138856, -0.3585337, 0, 0, 0, 1, 1,
-0.688009, 0.8038521, 0.002795477, 0, 0, 0, 1, 1,
-0.6789019, 0.6389153, -0.4165083, 0, 0, 0, 1, 1,
-0.6757807, 1.249095, -0.4314928, 0, 0, 0, 1, 1,
-0.6722612, 0.2796817, 0.1758647, 0, 0, 0, 1, 1,
-0.6705315, -0.7501556, -2.608801, 0, 0, 0, 1, 1,
-0.6625648, -0.02423456, -1.891019, 1, 1, 1, 1, 1,
-0.6515588, 1.211754, -1.89839, 1, 1, 1, 1, 1,
-0.6510143, -1.580428, -3.307985, 1, 1, 1, 1, 1,
-0.6506895, 0.7351988, -1.941037, 1, 1, 1, 1, 1,
-0.648987, 0.6561095, 0.1842198, 1, 1, 1, 1, 1,
-0.646544, 1.15893, -0.5372382, 1, 1, 1, 1, 1,
-0.6451933, 1.691899, -1.554282, 1, 1, 1, 1, 1,
-0.6405342, 0.381661, -2.255973, 1, 1, 1, 1, 1,
-0.6378411, 0.6737456, -0.04823793, 1, 1, 1, 1, 1,
-0.6340549, -0.4437345, -2.161554, 1, 1, 1, 1, 1,
-0.6335774, -1.037096, -3.739748, 1, 1, 1, 1, 1,
-0.6284755, -0.9729634, -3.027896, 1, 1, 1, 1, 1,
-0.6260815, -0.8836983, -3.865253, 1, 1, 1, 1, 1,
-0.6251436, 0.8762751, 1.273739, 1, 1, 1, 1, 1,
-0.6211171, -0.2180652, -1.851721, 1, 1, 1, 1, 1,
-0.6187766, 0.521813, 0.05752709, 0, 0, 1, 1, 1,
-0.6154372, 1.710958, -0.466348, 1, 0, 0, 1, 1,
-0.6143858, -0.5415231, -2.949915, 1, 0, 0, 1, 1,
-0.6113151, 1.957511, -1.174673, 1, 0, 0, 1, 1,
-0.6100112, 0.1266064, -1.461266, 1, 0, 0, 1, 1,
-0.6007095, 0.8454614, -1.318021, 1, 0, 0, 1, 1,
-0.5977957, -0.9275967, -1.536745, 0, 0, 0, 1, 1,
-0.597755, 1.090526, -0.6504181, 0, 0, 0, 1, 1,
-0.5973234, -2.064586, -3.662995, 0, 0, 0, 1, 1,
-0.5967211, 1.53716, -0.6164299, 0, 0, 0, 1, 1,
-0.5948554, -1.145034, -2.811581, 0, 0, 0, 1, 1,
-0.5889603, 1.03871, -2.525139, 0, 0, 0, 1, 1,
-0.5873734, 1.051358, 1.176494, 0, 0, 0, 1, 1,
-0.5784944, -0.03550461, -1.707722, 1, 1, 1, 1, 1,
-0.5738404, -0.3462976, -2.658716, 1, 1, 1, 1, 1,
-0.5726531, -0.7516958, -1.923179, 1, 1, 1, 1, 1,
-0.5706818, 0.7034962, -1.401057, 1, 1, 1, 1, 1,
-0.5701693, -0.544679, 1.50043, 1, 1, 1, 1, 1,
-0.5701487, 0.8062122, -0.9398957, 1, 1, 1, 1, 1,
-0.5679806, 0.8075797, -2.230773, 1, 1, 1, 1, 1,
-0.5608308, -0.04330925, -0.8853145, 1, 1, 1, 1, 1,
-0.5605705, -2.559737, -1.918533, 1, 1, 1, 1, 1,
-0.56054, -1.125619, -2.763196, 1, 1, 1, 1, 1,
-0.5569113, 0.1941482, -1.829042, 1, 1, 1, 1, 1,
-0.5491752, 0.3508253, -0.264316, 1, 1, 1, 1, 1,
-0.5491461, -0.9894112, -2.132858, 1, 1, 1, 1, 1,
-0.545242, 1.105626, -0.2019171, 1, 1, 1, 1, 1,
-0.5390164, 0.8243392, -0.7083587, 1, 1, 1, 1, 1,
-0.537779, 0.4382851, -0.8393978, 0, 0, 1, 1, 1,
-0.5369156, 0.1585901, -2.301097, 1, 0, 0, 1, 1,
-0.5333183, 0.1388713, -2.114924, 1, 0, 0, 1, 1,
-0.5324401, 1.243988, 0.303377, 1, 0, 0, 1, 1,
-0.5304053, -0.752234, -1.461078, 1, 0, 0, 1, 1,
-0.5286902, 0.7817236, -2.134447, 1, 0, 0, 1, 1,
-0.5259039, -0.4445485, -3.188956, 0, 0, 0, 1, 1,
-0.5238069, 0.1486262, -1.052892, 0, 0, 0, 1, 1,
-0.5227169, 0.4416096, 0.1793884, 0, 0, 0, 1, 1,
-0.5207178, -0.7254234, -3.004591, 0, 0, 0, 1, 1,
-0.5188029, -0.2220292, -0.6198877, 0, 0, 0, 1, 1,
-0.5183644, -0.8199929, -3.363914, 0, 0, 0, 1, 1,
-0.5173173, -0.5599571, -3.607896, 0, 0, 0, 1, 1,
-0.4987591, -2.254966, -2.599906, 1, 1, 1, 1, 1,
-0.498758, -0.2713732, -3.554343, 1, 1, 1, 1, 1,
-0.4981337, -0.01061413, 1.065938, 1, 1, 1, 1, 1,
-0.4970939, -0.7524949, -2.359309, 1, 1, 1, 1, 1,
-0.4938354, -1.53113, -0.03691113, 1, 1, 1, 1, 1,
-0.4869071, -0.5065452, -3.798166, 1, 1, 1, 1, 1,
-0.4857145, 0.8650978, -1.93732, 1, 1, 1, 1, 1,
-0.4799987, -1.001184, -2.112262, 1, 1, 1, 1, 1,
-0.4779564, 1.092252, -1.13727, 1, 1, 1, 1, 1,
-0.4763921, 0.08189758, -1.55172, 1, 1, 1, 1, 1,
-0.4758208, 1.019665, -0.9262762, 1, 1, 1, 1, 1,
-0.4756857, -0.5257474, -1.453759, 1, 1, 1, 1, 1,
-0.4718854, 1.991841, 0.5808519, 1, 1, 1, 1, 1,
-0.4705232, 0.0480729, -1.872949, 1, 1, 1, 1, 1,
-0.4693609, 0.08311999, -2.20907, 1, 1, 1, 1, 1,
-0.4689071, 0.4118276, -2.428791, 0, 0, 1, 1, 1,
-0.4671476, 1.37008, -0.8752828, 1, 0, 0, 1, 1,
-0.4669758, -0.6267865, -3.639452, 1, 0, 0, 1, 1,
-0.4647219, -0.2978429, -1.810098, 1, 0, 0, 1, 1,
-0.4638687, 0.213844, -0.8731997, 1, 0, 0, 1, 1,
-0.4614446, -2.775202, -2.903394, 1, 0, 0, 1, 1,
-0.4577022, -1.589586, -1.902775, 0, 0, 0, 1, 1,
-0.4571765, -0.8710095, -1.182095, 0, 0, 0, 1, 1,
-0.4533852, 1.638139, -0.3049293, 0, 0, 0, 1, 1,
-0.4523896, -0.5142084, -2.176296, 0, 0, 0, 1, 1,
-0.4505168, 1.061362, -0.2159047, 0, 0, 0, 1, 1,
-0.4496317, 0.3884773, -0.8478512, 0, 0, 0, 1, 1,
-0.4448155, -1.26494, -3.931778, 0, 0, 0, 1, 1,
-0.4447905, -0.5478437, -3.996955, 1, 1, 1, 1, 1,
-0.443664, 0.4494075, 1.117542, 1, 1, 1, 1, 1,
-0.4375931, 0.8119947, 0.4228966, 1, 1, 1, 1, 1,
-0.4338809, 0.4618412, 0.5556812, 1, 1, 1, 1, 1,
-0.4270113, -0.3831293, -3.051677, 1, 1, 1, 1, 1,
-0.4264275, 0.3342929, 0.4620796, 1, 1, 1, 1, 1,
-0.425173, -0.6425673, -1.812116, 1, 1, 1, 1, 1,
-0.4237466, -0.6326238, -1.889037, 1, 1, 1, 1, 1,
-0.4210788, -0.9736434, -2.325439, 1, 1, 1, 1, 1,
-0.4181443, -0.1935247, -2.061436, 1, 1, 1, 1, 1,
-0.4149657, -0.6738169, -1.251774, 1, 1, 1, 1, 1,
-0.4149407, -0.2926279, -2.605518, 1, 1, 1, 1, 1,
-0.4119572, 1.22847, -0.1958827, 1, 1, 1, 1, 1,
-0.4092616, 0.1368082, -1.217356, 1, 1, 1, 1, 1,
-0.4085021, -0.2976847, -2.949303, 1, 1, 1, 1, 1,
-0.4065907, 0.06101641, -1.424312, 0, 0, 1, 1, 1,
-0.4020832, -0.134639, -2.398846, 1, 0, 0, 1, 1,
-0.3986667, -1.084588, -1.81269, 1, 0, 0, 1, 1,
-0.3951138, 0.01040651, -1.96787, 1, 0, 0, 1, 1,
-0.3916155, -0.1976694, -0.4008613, 1, 0, 0, 1, 1,
-0.3812205, -0.7520896, -3.763486, 1, 0, 0, 1, 1,
-0.3791652, 0.3158991, -1.33259, 0, 0, 0, 1, 1,
-0.3778014, -0.08864445, -1.954655, 0, 0, 0, 1, 1,
-0.3776617, 0.4916436, 0.4262917, 0, 0, 0, 1, 1,
-0.3765043, 0.249005, -1.879698, 0, 0, 0, 1, 1,
-0.3725585, -2.307853, -3.677639, 0, 0, 0, 1, 1,
-0.3722428, -0.5280837, -3.519206, 0, 0, 0, 1, 1,
-0.3711088, 0.1965012, -2.594956, 0, 0, 0, 1, 1,
-0.3668355, 0.4207373, -1.779985, 1, 1, 1, 1, 1,
-0.3651485, 0.3145405, -1.39918, 1, 1, 1, 1, 1,
-0.3637904, -1.071267, -1.646377, 1, 1, 1, 1, 1,
-0.3615617, -0.7297658, -3.344004, 1, 1, 1, 1, 1,
-0.3539573, -0.2183287, -0.2933535, 1, 1, 1, 1, 1,
-0.3522252, -0.8367085, -2.312827, 1, 1, 1, 1, 1,
-0.3501506, 0.1671921, -1.572533, 1, 1, 1, 1, 1,
-0.3497642, -0.5317153, -4.063506, 1, 1, 1, 1, 1,
-0.3468995, 1.203505, -0.5348053, 1, 1, 1, 1, 1,
-0.3448622, 1.796972, 0.2032787, 1, 1, 1, 1, 1,
-0.3420444, -1.239139, -2.452292, 1, 1, 1, 1, 1,
-0.3416269, -1.065627, -2.58361, 1, 1, 1, 1, 1,
-0.3414111, 1.595224, -0.7491233, 1, 1, 1, 1, 1,
-0.3397391, -0.2208437, -2.509208, 1, 1, 1, 1, 1,
-0.3371775, 0.5221927, -0.7731433, 1, 1, 1, 1, 1,
-0.3351838, -1.411401, -4.918097, 0, 0, 1, 1, 1,
-0.332126, -0.7484832, -1.878664, 1, 0, 0, 1, 1,
-0.318957, 0.07913911, -3.375748, 1, 0, 0, 1, 1,
-0.3131833, -0.6114661, -2.472787, 1, 0, 0, 1, 1,
-0.3105744, -0.4597725, -2.098392, 1, 0, 0, 1, 1,
-0.3073628, 0.4611342, -0.4464401, 1, 0, 0, 1, 1,
-0.3069576, 0.3404111, -0.3260313, 0, 0, 0, 1, 1,
-0.3040187, 0.03882764, -2.739938, 0, 0, 0, 1, 1,
-0.3020079, -0.3146069, -2.228332, 0, 0, 0, 1, 1,
-0.3013139, 0.5218894, -2.093458, 0, 0, 0, 1, 1,
-0.3012172, -0.6736152, -1.553561, 0, 0, 0, 1, 1,
-0.2957339, 1.302504, 0.3814312, 0, 0, 0, 1, 1,
-0.2945076, 1.721005, 0.7606547, 0, 0, 0, 1, 1,
-0.2905104, 0.9849039, -1.73777, 1, 1, 1, 1, 1,
-0.287966, 0.2017722, 0.02709459, 1, 1, 1, 1, 1,
-0.2879166, -0.9002711, -2.976786, 1, 1, 1, 1, 1,
-0.2847276, -0.111335, -3.223004, 1, 1, 1, 1, 1,
-0.2841055, -0.5787915, -3.639802, 1, 1, 1, 1, 1,
-0.2840558, -0.7849918, -2.980152, 1, 1, 1, 1, 1,
-0.2795154, 0.8872094, -0.4494279, 1, 1, 1, 1, 1,
-0.2771142, -0.4365894, -3.348055, 1, 1, 1, 1, 1,
-0.2769992, 0.9083016, -1.12749, 1, 1, 1, 1, 1,
-0.2738624, 0.2690285, -0.283369, 1, 1, 1, 1, 1,
-0.2724021, -0.7644263, -2.279946, 1, 1, 1, 1, 1,
-0.2617957, -0.6842021, -3.057925, 1, 1, 1, 1, 1,
-0.26096, -1.382194, -1.962327, 1, 1, 1, 1, 1,
-0.251892, 1.226126, -0.9947385, 1, 1, 1, 1, 1,
-0.2518448, -0.3300705, -2.512046, 1, 1, 1, 1, 1,
-0.2479328, 0.2940756, -1.67258, 0, 0, 1, 1, 1,
-0.2448693, -1.573949, -3.238321, 1, 0, 0, 1, 1,
-0.2441349, 0.04566129, -1.136009, 1, 0, 0, 1, 1,
-0.241734, 0.6882468, 0.9022668, 1, 0, 0, 1, 1,
-0.2340581, 0.04881868, -2.381896, 1, 0, 0, 1, 1,
-0.2318014, 1.332577, -0.3842396, 1, 0, 0, 1, 1,
-0.2303951, 0.7430611, 0.4736643, 0, 0, 0, 1, 1,
-0.2282801, 1.291108, -0.5271503, 0, 0, 0, 1, 1,
-0.2269994, 0.9664129, 1.512199, 0, 0, 0, 1, 1,
-0.2192569, -0.3839085, -2.78769, 0, 0, 0, 1, 1,
-0.2186906, -0.5407932, -4.162079, 0, 0, 0, 1, 1,
-0.2176554, 0.9276817, -0.1131568, 0, 0, 0, 1, 1,
-0.217337, 1.239372, -0.5809541, 0, 0, 0, 1, 1,
-0.2165334, -0.5816841, -1.077528, 1, 1, 1, 1, 1,
-0.2067764, -1.227969, -2.051805, 1, 1, 1, 1, 1,
-0.2016742, 0.4956662, 1.275427, 1, 1, 1, 1, 1,
-0.2010658, -0.4064248, -1.801858, 1, 1, 1, 1, 1,
-0.2008846, 0.03667875, -2.771263, 1, 1, 1, 1, 1,
-0.197342, 0.14519, -0.5162268, 1, 1, 1, 1, 1,
-0.1941063, 1.17293, 0.2679991, 1, 1, 1, 1, 1,
-0.1938666, 0.6739622, -1.59904, 1, 1, 1, 1, 1,
-0.1903874, 0.8547918, 0.2465064, 1, 1, 1, 1, 1,
-0.1893965, 0.5744952, -0.9367529, 1, 1, 1, 1, 1,
-0.1888046, -0.6429351, -2.968902, 1, 1, 1, 1, 1,
-0.1840075, -2.527797, -3.383878, 1, 1, 1, 1, 1,
-0.1829026, 0.58313, -0.1031477, 1, 1, 1, 1, 1,
-0.1753722, -0.716195, -3.521844, 1, 1, 1, 1, 1,
-0.1724618, -1.504306, -5.839875, 1, 1, 1, 1, 1,
-0.1695755, 1.086584, 0.2756082, 0, 0, 1, 1, 1,
-0.1689663, 1.543075, -0.3157303, 1, 0, 0, 1, 1,
-0.168426, -0.426382, -2.201361, 1, 0, 0, 1, 1,
-0.1640491, 0.8146935, -0.3238874, 1, 0, 0, 1, 1,
-0.1612402, 0.3559734, 1.467974, 1, 0, 0, 1, 1,
-0.1603947, -0.01247429, -2.255338, 1, 0, 0, 1, 1,
-0.1579007, 1.707685, -0.5441664, 0, 0, 0, 1, 1,
-0.1543966, 1.500455, -1.396673, 0, 0, 0, 1, 1,
-0.1542911, -1.467794, -3.151568, 0, 0, 0, 1, 1,
-0.1526291, -0.5398537, -2.407188, 0, 0, 0, 1, 1,
-0.1507618, -1.827761, -1.64072, 0, 0, 0, 1, 1,
-0.146918, -0.6059716, -2.231134, 0, 0, 0, 1, 1,
-0.1458759, 1.357142, -0.647588, 0, 0, 0, 1, 1,
-0.1443212, -1.616168, -3.184944, 1, 1, 1, 1, 1,
-0.1418669, 0.4464191, -1.971932, 1, 1, 1, 1, 1,
-0.1386215, 0.3050382, 0.09179047, 1, 1, 1, 1, 1,
-0.1382525, 0.1042264, -0.01725655, 1, 1, 1, 1, 1,
-0.1282529, 1.006837, 1.994472, 1, 1, 1, 1, 1,
-0.1227906, 0.1396491, -0.7581241, 1, 1, 1, 1, 1,
-0.1212404, 0.3032677, 0.9856324, 1, 1, 1, 1, 1,
-0.1204578, -1.075429, -1.962628, 1, 1, 1, 1, 1,
-0.1157807, 0.7505447, -2.51991, 1, 1, 1, 1, 1,
-0.1147681, -0.1965585, -1.925543, 1, 1, 1, 1, 1,
-0.1139501, 1.621276, -0.9283364, 1, 1, 1, 1, 1,
-0.1129868, 1.47558, 1.330634, 1, 1, 1, 1, 1,
-0.110501, -1.403219, -2.137152, 1, 1, 1, 1, 1,
-0.1023218, -1.241886, -3.480638, 1, 1, 1, 1, 1,
-0.1022969, -1.701185, -1.114185, 1, 1, 1, 1, 1,
-0.09752729, -0.1870251, -2.653196, 0, 0, 1, 1, 1,
-0.09740979, -1.011393, -3.535564, 1, 0, 0, 1, 1,
-0.09451906, -0.208072, -1.552211, 1, 0, 0, 1, 1,
-0.09394643, 2.051645, -0.09313733, 1, 0, 0, 1, 1,
-0.09277415, -0.5220777, -2.606502, 1, 0, 0, 1, 1,
-0.09251125, 0.4832537, -0.7777351, 1, 0, 0, 1, 1,
-0.09139857, 0.0529028, -0.4648152, 0, 0, 0, 1, 1,
-0.09127896, -0.6365582, -3.729497, 0, 0, 0, 1, 1,
-0.09125151, -0.5078275, -2.925093, 0, 0, 0, 1, 1,
-0.08964537, 0.6431754, -0.5792876, 0, 0, 0, 1, 1,
-0.08826869, 0.8754145, -0.4199653, 0, 0, 0, 1, 1,
-0.08527982, 0.1129048, -1.622126, 0, 0, 0, 1, 1,
-0.0762672, 1.350769, 0.4654019, 0, 0, 0, 1, 1,
-0.07251886, -0.5090936, -3.726305, 1, 1, 1, 1, 1,
-0.07125949, 0.6915919, -0.4147439, 1, 1, 1, 1, 1,
-0.0674032, -0.2522483, -3.603026, 1, 1, 1, 1, 1,
-0.06729709, -0.3166909, -0.6775937, 1, 1, 1, 1, 1,
-0.06561017, -1.249925, -3.52376, 1, 1, 1, 1, 1,
-0.06550712, -0.7677318, -3.338863, 1, 1, 1, 1, 1,
-0.05861885, 0.3456232, 0.05570275, 1, 1, 1, 1, 1,
-0.0562617, -0.3940413, -1.973503, 1, 1, 1, 1, 1,
-0.0557588, -0.5349898, -2.350832, 1, 1, 1, 1, 1,
-0.05349392, -0.3772018, -1.587176, 1, 1, 1, 1, 1,
-0.04850782, 0.08009916, 0.2080517, 1, 1, 1, 1, 1,
-0.04775278, -0.09675171, -1.683254, 1, 1, 1, 1, 1,
-0.04611945, 0.5370339, -0.5264621, 1, 1, 1, 1, 1,
-0.04367643, 0.827098, 1.285932, 1, 1, 1, 1, 1,
-0.04359597, -1.031704, -3.046024, 1, 1, 1, 1, 1,
-0.04160114, 0.2346352, -0.9557496, 0, 0, 1, 1, 1,
-0.03913444, 0.3969348, -0.6258563, 1, 0, 0, 1, 1,
-0.03777995, 1.076177, -1.182445, 1, 0, 0, 1, 1,
-0.03766014, 0.7031441, 0.8855364, 1, 0, 0, 1, 1,
-0.03608561, 0.07202213, -0.284131, 1, 0, 0, 1, 1,
-0.02818718, -0.9802597, -2.979011, 1, 0, 0, 1, 1,
-0.02757729, 0.1104624, -1.017489, 0, 0, 0, 1, 1,
-0.02351984, 1.136539, 0.8757818, 0, 0, 0, 1, 1,
-0.01933141, 1.281598, 0.4870112, 0, 0, 0, 1, 1,
-0.0187228, -0.3279551, -2.141955, 0, 0, 0, 1, 1,
-0.01705035, 0.4078898, 1.057101, 0, 0, 0, 1, 1,
-0.01637347, -0.6911764, -2.972029, 0, 0, 0, 1, 1,
-0.01559309, -2.183566, -3.351243, 0, 0, 0, 1, 1,
-0.01307623, -0.3232896, -2.919408, 1, 1, 1, 1, 1,
-0.009516036, 0.03807274, 0.6833043, 1, 1, 1, 1, 1,
-0.009107747, 0.3334554, -0.8378956, 1, 1, 1, 1, 1,
-0.007546474, 0.3725141, 0.63998, 1, 1, 1, 1, 1,
-0.005647955, -1.220451, -3.048917, 1, 1, 1, 1, 1,
-0.003066986, 1.32191, -0.1744303, 1, 1, 1, 1, 1,
-0.001421735, -0.1987915, -3.167207, 1, 1, 1, 1, 1,
-0.000847112, 0.5952047, -1.858911, 1, 1, 1, 1, 1,
-0.0003824283, 0.6082472, 0.536819, 1, 1, 1, 1, 1,
0.002414587, -0.8108931, 3.588129, 1, 1, 1, 1, 1,
0.003222195, 0.04543906, 0.9910092, 1, 1, 1, 1, 1,
0.006651911, 0.5439807, -0.5823489, 1, 1, 1, 1, 1,
0.00769316, 1.6906, -2.873668, 1, 1, 1, 1, 1,
0.0120442, 0.868545, -0.4452907, 1, 1, 1, 1, 1,
0.01757476, 0.3634064, 0.3794001, 1, 1, 1, 1, 1,
0.02145397, -1.221899, 2.587056, 0, 0, 1, 1, 1,
0.02165903, 1.624539, -0.09543402, 1, 0, 0, 1, 1,
0.02350307, 0.632189, 0.3604829, 1, 0, 0, 1, 1,
0.02380229, 0.5491387, 1.568117, 1, 0, 0, 1, 1,
0.02409738, -0.629051, 3.007092, 1, 0, 0, 1, 1,
0.02419336, 0.03351996, 2.121433, 1, 0, 0, 1, 1,
0.02787204, -0.9293825, 3.485725, 0, 0, 0, 1, 1,
0.03105539, -0.4425521, 1.626747, 0, 0, 0, 1, 1,
0.03312181, -1.600761, 2.182446, 0, 0, 0, 1, 1,
0.03622641, -0.3860421, 1.839222, 0, 0, 0, 1, 1,
0.03780331, 1.10243, 0.07184672, 0, 0, 0, 1, 1,
0.03979794, -0.402062, 3.972085, 0, 0, 0, 1, 1,
0.0484243, -1.004916, 3.613674, 0, 0, 0, 1, 1,
0.04942039, -0.5411217, 1.245107, 1, 1, 1, 1, 1,
0.05105776, -2.439339, 3.740787, 1, 1, 1, 1, 1,
0.05182323, -0.7163072, 5.589151, 1, 1, 1, 1, 1,
0.05233286, -1.644525, 2.188658, 1, 1, 1, 1, 1,
0.06273939, 0.6594548, 1.059647, 1, 1, 1, 1, 1,
0.06455053, -0.6995341, 4.705292, 1, 1, 1, 1, 1,
0.0647094, 0.0317812, 0.4503951, 1, 1, 1, 1, 1,
0.06771003, 0.704189, 1.003043, 1, 1, 1, 1, 1,
0.06859435, -0.4366001, 2.673495, 1, 1, 1, 1, 1,
0.07180063, -0.2230677, 1.028492, 1, 1, 1, 1, 1,
0.07274403, 0.3794236, 0.7402461, 1, 1, 1, 1, 1,
0.07672352, 0.814538, 0.4490188, 1, 1, 1, 1, 1,
0.08153673, -0.5053261, 2.811064, 1, 1, 1, 1, 1,
0.08440294, 0.9010069, -1.065138, 1, 1, 1, 1, 1,
0.086065, 0.08082756, -0.01208124, 1, 1, 1, 1, 1,
0.09000462, -0.1987498, 3.886485, 0, 0, 1, 1, 1,
0.09025884, -1.424299, 2.476951, 1, 0, 0, 1, 1,
0.09305663, 0.3541299, 0.08512918, 1, 0, 0, 1, 1,
0.09716659, -1.924883, 2.230772, 1, 0, 0, 1, 1,
0.09737919, -2.463212, 3.042339, 1, 0, 0, 1, 1,
0.09930338, 1.502334, 0.8301196, 1, 0, 0, 1, 1,
0.09966689, 1.25818, -1.182822, 0, 0, 0, 1, 1,
0.1033145, -1.843535, 3.482256, 0, 0, 0, 1, 1,
0.1059692, 1.139734, -0.3372074, 0, 0, 0, 1, 1,
0.1060198, 0.4333819, -0.08050117, 0, 0, 0, 1, 1,
0.1090442, -0.5911727, 3.656067, 0, 0, 0, 1, 1,
0.1092883, -1.876824, 2.216251, 0, 0, 0, 1, 1,
0.1126067, 0.5929033, -0.3151214, 0, 0, 0, 1, 1,
0.1146915, -0.3896627, 2.707297, 1, 1, 1, 1, 1,
0.1197704, 0.2321968, 1.373008, 1, 1, 1, 1, 1,
0.12203, 0.8810948, -1.67436, 1, 1, 1, 1, 1,
0.1229244, -0.118534, 1.079482, 1, 1, 1, 1, 1,
0.1230388, 0.2005932, -1.208636, 1, 1, 1, 1, 1,
0.128777, 0.393243, 0.538712, 1, 1, 1, 1, 1,
0.1349656, -0.03349596, 1.416075, 1, 1, 1, 1, 1,
0.1365513, 1.956355, 0.3074225, 1, 1, 1, 1, 1,
0.1376185, -0.06386676, 0.5185794, 1, 1, 1, 1, 1,
0.1428739, 0.05851119, 0.3433297, 1, 1, 1, 1, 1,
0.1430814, -1.525754, 3.076921, 1, 1, 1, 1, 1,
0.143639, -0.8638662, 2.214522, 1, 1, 1, 1, 1,
0.1479515, 0.2642964, 0.6090046, 1, 1, 1, 1, 1,
0.1480642, -0.5320789, 3.567534, 1, 1, 1, 1, 1,
0.1518282, 1.407168, 0.8362116, 1, 1, 1, 1, 1,
0.1609006, -1.774106, 1.878448, 0, 0, 1, 1, 1,
0.1670924, 0.388264, -0.5791667, 1, 0, 0, 1, 1,
0.1689092, -0.06367882, 1.536977, 1, 0, 0, 1, 1,
0.1740342, 0.4093254, 0.3441342, 1, 0, 0, 1, 1,
0.1768443, -0.339548, 1.905657, 1, 0, 0, 1, 1,
0.1803437, 0.3245784, 0.47484, 1, 0, 0, 1, 1,
0.1826315, -0.6319479, 2.376197, 0, 0, 0, 1, 1,
0.1833992, 0.6067826, -0.2216437, 0, 0, 0, 1, 1,
0.1856754, 0.9432735, 0.9807241, 0, 0, 0, 1, 1,
0.1875996, -0.8803073, 2.934486, 0, 0, 0, 1, 1,
0.1887848, 0.8144535, 0.3184338, 0, 0, 0, 1, 1,
0.1901522, 0.6139296, 0.5810987, 0, 0, 0, 1, 1,
0.1911785, 1.977564, -0.2218688, 0, 0, 0, 1, 1,
0.1916446, -0.1503337, 1.708288, 1, 1, 1, 1, 1,
0.1930053, 0.8729309, 1.522498, 1, 1, 1, 1, 1,
0.1972317, 0.1714599, -0.3927324, 1, 1, 1, 1, 1,
0.1998104, 0.7256028, 2.128587, 1, 1, 1, 1, 1,
0.20397, 0.327008, -0.01729546, 1, 1, 1, 1, 1,
0.2074895, 0.06294639, -0.374335, 1, 1, 1, 1, 1,
0.211773, 0.6656265, 2.302492, 1, 1, 1, 1, 1,
0.2128445, 2.225619, -0.9000765, 1, 1, 1, 1, 1,
0.2133298, 0.6235645, 0.6674032, 1, 1, 1, 1, 1,
0.2147393, -0.1672828, 2.188125, 1, 1, 1, 1, 1,
0.2186581, -1.70502, 5.447848, 1, 1, 1, 1, 1,
0.2191296, -0.3402825, 2.203421, 1, 1, 1, 1, 1,
0.2273885, 0.4008205, 1.413217, 1, 1, 1, 1, 1,
0.2318556, -0.5722165, 2.519735, 1, 1, 1, 1, 1,
0.2363038, -0.9798044, 2.097926, 1, 1, 1, 1, 1,
0.2408786, -1.253343, 2.789904, 0, 0, 1, 1, 1,
0.2420404, -0.8585575, 3.790166, 1, 0, 0, 1, 1,
0.2456442, -1.831303, 4.275777, 1, 0, 0, 1, 1,
0.2502618, -0.01486311, 3.155659, 1, 0, 0, 1, 1,
0.2504846, 0.4166465, -0.01411558, 1, 0, 0, 1, 1,
0.2563868, -1.754183, 4.476832, 1, 0, 0, 1, 1,
0.2575465, -0.7286914, 3.331538, 0, 0, 0, 1, 1,
0.2579334, -0.05707979, 3.866529, 0, 0, 0, 1, 1,
0.2606193, 0.5610381, -0.527088, 0, 0, 0, 1, 1,
0.2634632, 0.2497172, -0.9751499, 0, 0, 0, 1, 1,
0.2648051, 0.4501361, 1.43497, 0, 0, 0, 1, 1,
0.2701523, -1.128902, 3.815075, 0, 0, 0, 1, 1,
0.2724842, -0.6412367, 1.997067, 0, 0, 0, 1, 1,
0.2730281, -0.7733652, 2.522009, 1, 1, 1, 1, 1,
0.2732377, 1.278647, 0.4511654, 1, 1, 1, 1, 1,
0.275916, -0.8458461, 2.854372, 1, 1, 1, 1, 1,
0.2761773, -1.233021, 2.509693, 1, 1, 1, 1, 1,
0.2774824, 0.2866873, 2.448549, 1, 1, 1, 1, 1,
0.2806606, -0.8820556, 0.9681053, 1, 1, 1, 1, 1,
0.2830972, -0.8388687, 2.104853, 1, 1, 1, 1, 1,
0.2838395, 0.8245024, 0.04130468, 1, 1, 1, 1, 1,
0.2850932, -0.2731688, 1.415717, 1, 1, 1, 1, 1,
0.286736, 0.1060789, 0.955366, 1, 1, 1, 1, 1,
0.2913398, 1.890173, 0.8450431, 1, 1, 1, 1, 1,
0.2951036, -1.096103, 2.409229, 1, 1, 1, 1, 1,
0.2975403, 1.100961, -0.3178612, 1, 1, 1, 1, 1,
0.2976092, -0.9592321, 2.878316, 1, 1, 1, 1, 1,
0.2998203, 1.171989, -0.0494189, 1, 1, 1, 1, 1,
0.306544, -0.3696881, 1.928819, 0, 0, 1, 1, 1,
0.3078421, 0.4115821, 0.2521158, 1, 0, 0, 1, 1,
0.3080952, 0.3048864, 1.125776, 1, 0, 0, 1, 1,
0.3085723, 1.226715, 0.5728885, 1, 0, 0, 1, 1,
0.3101062, -1.167442, 2.602676, 1, 0, 0, 1, 1,
0.3116498, 0.6132191, -0.6207317, 1, 0, 0, 1, 1,
0.3145308, 2.068845, 1.755242, 0, 0, 0, 1, 1,
0.3224417, 1.577837, -0.8149086, 0, 0, 0, 1, 1,
0.3289981, 0.8263845, 0.0437006, 0, 0, 0, 1, 1,
0.333602, -0.375757, 3.422266, 0, 0, 0, 1, 1,
0.3337898, -0.981146, 4.863894, 0, 0, 0, 1, 1,
0.3340859, 1.42841, -0.6274297, 0, 0, 0, 1, 1,
0.3344285, 0.006874518, 1.281978, 0, 0, 0, 1, 1,
0.3347135, -0.07775619, 1.043451, 1, 1, 1, 1, 1,
0.336867, -0.9612992, 1.528967, 1, 1, 1, 1, 1,
0.3374582, 1.055174, 0.2571585, 1, 1, 1, 1, 1,
0.3392796, 1.721364, 0.3603559, 1, 1, 1, 1, 1,
0.3412164, -0.3715869, 3.550967, 1, 1, 1, 1, 1,
0.342894, 0.04424617, 0.7939116, 1, 1, 1, 1, 1,
0.3429359, -1.064585, 3.509933, 1, 1, 1, 1, 1,
0.3449149, -0.5767961, 4.28091, 1, 1, 1, 1, 1,
0.3451088, 0.06819195, 1.309067, 1, 1, 1, 1, 1,
0.3452035, 0.1938714, 1.37593, 1, 1, 1, 1, 1,
0.345932, 0.7165213, 0.5361443, 1, 1, 1, 1, 1,
0.3491014, 0.4608599, 0.6635687, 1, 1, 1, 1, 1,
0.3526163, 2.006942, -0.2033342, 1, 1, 1, 1, 1,
0.3546681, -0.1737268, 0.8125414, 1, 1, 1, 1, 1,
0.3590287, 0.7467615, -0.3699616, 1, 1, 1, 1, 1,
0.3615886, -1.315157, 2.618656, 0, 0, 1, 1, 1,
0.3658966, 0.5117503, 0.5515757, 1, 0, 0, 1, 1,
0.3711548, -0.8661299, 4.535389, 1, 0, 0, 1, 1,
0.3714062, -0.2891053, 2.613559, 1, 0, 0, 1, 1,
0.380959, 0.3643168, 0.3185269, 1, 0, 0, 1, 1,
0.3845249, -0.8766884, 2.667987, 1, 0, 0, 1, 1,
0.3849351, 1.241776, -3.023134, 0, 0, 0, 1, 1,
0.3887019, -0.2771844, 1.591937, 0, 0, 0, 1, 1,
0.390433, -2.440959, 1.896528, 0, 0, 0, 1, 1,
0.3937014, 1.959854, -0.39595, 0, 0, 0, 1, 1,
0.3941553, -2.503344, 3.465772, 0, 0, 0, 1, 1,
0.4054212, -0.4838119, 1.038821, 0, 0, 0, 1, 1,
0.4085084, -0.3953536, 1.644739, 0, 0, 0, 1, 1,
0.4114108, -0.3650846, 1.039826, 1, 1, 1, 1, 1,
0.4115607, -0.7696733, 3.813813, 1, 1, 1, 1, 1,
0.4126973, -0.7101679, 3.357959, 1, 1, 1, 1, 1,
0.4149042, 0.1273462, 0.6524996, 1, 1, 1, 1, 1,
0.4157523, 0.3570467, 1.324281, 1, 1, 1, 1, 1,
0.4167714, -1.348537, 3.186074, 1, 1, 1, 1, 1,
0.4210149, 0.226649, 0.9674543, 1, 1, 1, 1, 1,
0.4213995, -0.06448887, 1.417516, 1, 1, 1, 1, 1,
0.4214654, 0.1667056, 3.248338, 1, 1, 1, 1, 1,
0.4231525, -1.131414, 2.955744, 1, 1, 1, 1, 1,
0.4312949, -0.6372511, 2.022326, 1, 1, 1, 1, 1,
0.4319785, 0.5506089, 0.7261297, 1, 1, 1, 1, 1,
0.437493, -0.4329869, 3.10508, 1, 1, 1, 1, 1,
0.4383271, -0.1688836, 0.4852017, 1, 1, 1, 1, 1,
0.4397497, -0.1986682, -0.009952478, 1, 1, 1, 1, 1,
0.4418326, -0.3905394, 4.132537, 0, 0, 1, 1, 1,
0.4430153, -0.821253, 2.782708, 1, 0, 0, 1, 1,
0.4442864, 0.7214434, 1.132325, 1, 0, 0, 1, 1,
0.4484334, 0.8043782, -1.982658, 1, 0, 0, 1, 1,
0.4492218, -0.713838, 2.484477, 1, 0, 0, 1, 1,
0.4516475, -0.8007113, 2.109603, 1, 0, 0, 1, 1,
0.4517327, -1.626458, 3.616495, 0, 0, 0, 1, 1,
0.4520362, -0.8501832, 1.419358, 0, 0, 0, 1, 1,
0.4605864, 0.8141738, -0.6381275, 0, 0, 0, 1, 1,
0.4631312, 1.057529, -0.2634366, 0, 0, 0, 1, 1,
0.4646383, 0.5728527, 0.5939205, 0, 0, 0, 1, 1,
0.4707871, 0.8223479, -1.335052, 0, 0, 0, 1, 1,
0.4724948, -1.340934, 2.02407, 0, 0, 0, 1, 1,
0.4776192, 1.058696, 0.3089418, 1, 1, 1, 1, 1,
0.4809176, 0.4892189, 0.697243, 1, 1, 1, 1, 1,
0.4863151, 0.2369736, 1.012835, 1, 1, 1, 1, 1,
0.4882801, 0.848232, 1.626504, 1, 1, 1, 1, 1,
0.4905936, 0.9569659, 0.02948547, 1, 1, 1, 1, 1,
0.4914515, -1.451152, 3.614799, 1, 1, 1, 1, 1,
0.4915841, -0.7175916, 3.249606, 1, 1, 1, 1, 1,
0.4952132, -0.05322376, 3.265222, 1, 1, 1, 1, 1,
0.501076, 0.3511865, 0.3857897, 1, 1, 1, 1, 1,
0.50177, -2.242299, 4.004606, 1, 1, 1, 1, 1,
0.5027604, -0.1933548, 2.349536, 1, 1, 1, 1, 1,
0.5033455, 0.3715625, 1.102717, 1, 1, 1, 1, 1,
0.5054739, -1.23509, 2.688401, 1, 1, 1, 1, 1,
0.5078325, -0.3464419, 2.292117, 1, 1, 1, 1, 1,
0.5130106, -0.761086, 1.738979, 1, 1, 1, 1, 1,
0.5134127, 0.4849084, 1.838682, 0, 0, 1, 1, 1,
0.5146645, 0.1923643, -0.4065675, 1, 0, 0, 1, 1,
0.5147672, 0.5897231, 1.568214, 1, 0, 0, 1, 1,
0.5202568, 0.2387616, 1.821804, 1, 0, 0, 1, 1,
0.5209519, 0.666096, 0.3946076, 1, 0, 0, 1, 1,
0.527363, -1.549288, 2.934362, 1, 0, 0, 1, 1,
0.5321385, -1.550184, 3.541265, 0, 0, 0, 1, 1,
0.5500296, -0.1471029, 0.2856159, 0, 0, 0, 1, 1,
0.5530052, 0.2544819, 0.7709068, 0, 0, 0, 1, 1,
0.5693982, 0.5374278, 1.093831, 0, 0, 0, 1, 1,
0.5705659, -0.5111803, 1.7194, 0, 0, 0, 1, 1,
0.5709932, -0.248179, 2.630258, 0, 0, 0, 1, 1,
0.5727422, 1.078471, -0.7767168, 0, 0, 0, 1, 1,
0.5753065, -1.249266, 4.193982, 1, 1, 1, 1, 1,
0.5788256, -1.053212, 1.903867, 1, 1, 1, 1, 1,
0.5807235, 1.075328, 1.901447, 1, 1, 1, 1, 1,
0.5816709, 0.2634644, -0.6695828, 1, 1, 1, 1, 1,
0.5860214, -0.03085621, 1.537496, 1, 1, 1, 1, 1,
0.5886173, -1.52867, 2.007147, 1, 1, 1, 1, 1,
0.5893236, -0.5200301, 0.4586909, 1, 1, 1, 1, 1,
0.5934738, 0.6673648, 0.01760204, 1, 1, 1, 1, 1,
0.5946983, -0.7778701, 1.166698, 1, 1, 1, 1, 1,
0.5997783, -0.5357315, 3.017447, 1, 1, 1, 1, 1,
0.6000718, -0.2810363, 2.015254, 1, 1, 1, 1, 1,
0.6027984, 0.2634267, 0.9094245, 1, 1, 1, 1, 1,
0.6069297, -0.7327181, 1.496046, 1, 1, 1, 1, 1,
0.614155, -1.657945, 3.037761, 1, 1, 1, 1, 1,
0.6163688, -1.359438, 0.5085766, 1, 1, 1, 1, 1,
0.617635, -1.390027, 1.211751, 0, 0, 1, 1, 1,
0.6190556, -0.1756092, 2.78149, 1, 0, 0, 1, 1,
0.623813, -1.440267, 2.318948, 1, 0, 0, 1, 1,
0.6263758, -3.163129, 2.100004, 1, 0, 0, 1, 1,
0.6278213, 0.4017702, 1.427035, 1, 0, 0, 1, 1,
0.6319463, 0.01662327, 2.122307, 1, 0, 0, 1, 1,
0.6323503, -0.07552774, 1.091598, 0, 0, 0, 1, 1,
0.6387979, -0.8168815, 3.537466, 0, 0, 0, 1, 1,
0.6474446, -0.3996982, 2.879633, 0, 0, 0, 1, 1,
0.6490837, 0.8304476, -0.6486031, 0, 0, 0, 1, 1,
0.6515187, -0.3579241, 3.568104, 0, 0, 0, 1, 1,
0.6555151, 0.226966, 1.179269, 0, 0, 0, 1, 1,
0.6589245, -0.05332386, 0.6244191, 0, 0, 0, 1, 1,
0.6602151, 0.8302246, 2.073336, 1, 1, 1, 1, 1,
0.6604195, -0.303798, 0.9171262, 1, 1, 1, 1, 1,
0.6632466, -0.497384, 1.474462, 1, 1, 1, 1, 1,
0.665926, 0.03526552, 0.6767765, 1, 1, 1, 1, 1,
0.6660129, 0.6752885, 1.208089, 1, 1, 1, 1, 1,
0.6668191, -0.7734883, 2.197357, 1, 1, 1, 1, 1,
0.6676718, 0.4701585, 0.741769, 1, 1, 1, 1, 1,
0.6681721, -0.4783099, 1.352714, 1, 1, 1, 1, 1,
0.669098, 0.3959447, 0.6314114, 1, 1, 1, 1, 1,
0.6696694, -0.3555827, 3.145337, 1, 1, 1, 1, 1,
0.6748716, -0.4339575, 0.9730876, 1, 1, 1, 1, 1,
0.6783161, -0.009515402, 0.2542683, 1, 1, 1, 1, 1,
0.6828554, 0.6765183, 0.7845754, 1, 1, 1, 1, 1,
0.6841146, 2.067958, -1.397069, 1, 1, 1, 1, 1,
0.6841493, 0.3635858, -0.6705861, 1, 1, 1, 1, 1,
0.6927615, -0.482368, 2.094431, 0, 0, 1, 1, 1,
0.6963786, 0.3226423, 0.2093291, 1, 0, 0, 1, 1,
0.6968185, -0.9130784, 1.065501, 1, 0, 0, 1, 1,
0.6978611, -0.03600558, 0.5237281, 1, 0, 0, 1, 1,
0.6983734, -1.257879, 3.39875, 1, 0, 0, 1, 1,
0.7017823, -1.519658, 3.43486, 1, 0, 0, 1, 1,
0.7060581, -0.1630466, 1.937141, 0, 0, 0, 1, 1,
0.7082457, 1.73251, -0.9594169, 0, 0, 0, 1, 1,
0.711042, -0.01234279, 2.42562, 0, 0, 0, 1, 1,
0.711151, 1.753746, 0.3737429, 0, 0, 0, 1, 1,
0.7166941, 1.023944, 2.965933, 0, 0, 0, 1, 1,
0.7229656, -0.6007409, 1.06218, 0, 0, 0, 1, 1,
0.7241949, -0.3153204, 3.088738, 0, 0, 0, 1, 1,
0.7267455, -0.2878758, 0.9532223, 1, 1, 1, 1, 1,
0.7291406, 1.10816, -0.009242944, 1, 1, 1, 1, 1,
0.7302895, -0.5149029, 0.5421871, 1, 1, 1, 1, 1,
0.7316609, 0.4866359, 2.087493, 1, 1, 1, 1, 1,
0.7351733, 0.02426477, 2.124654, 1, 1, 1, 1, 1,
0.7370878, -0.2921674, 1.477268, 1, 1, 1, 1, 1,
0.7392921, -1.689936, 2.650723, 1, 1, 1, 1, 1,
0.7420892, 0.6876773, 0.5511687, 1, 1, 1, 1, 1,
0.7435502, 1.100166, 0.5782356, 1, 1, 1, 1, 1,
0.7494052, 1.176982, -2.191473, 1, 1, 1, 1, 1,
0.7578177, 1.026718, 1.034374, 1, 1, 1, 1, 1,
0.7588859, -0.226054, 1.482862, 1, 1, 1, 1, 1,
0.7612494, -0.6460487, 1.429312, 1, 1, 1, 1, 1,
0.7615262, -0.3809297, 2.2074, 1, 1, 1, 1, 1,
0.7617903, 0.01601818, -0.286434, 1, 1, 1, 1, 1,
0.7626811, 0.450672, 1.832674, 0, 0, 1, 1, 1,
0.7632926, -0.009725785, 2.09586, 1, 0, 0, 1, 1,
0.7681962, -1.640404, 1.42808, 1, 0, 0, 1, 1,
0.7731533, -0.5176364, 1.978422, 1, 0, 0, 1, 1,
0.7799996, -2.322996, 3.27968, 1, 0, 0, 1, 1,
0.7852827, 0.01141207, 1.378383, 1, 0, 0, 1, 1,
0.7857783, -0.04521407, 0.1110512, 0, 0, 0, 1, 1,
0.7865371, -0.5068848, 2.156644, 0, 0, 0, 1, 1,
0.8010744, 0.2177593, 0.2757735, 0, 0, 0, 1, 1,
0.8162448, -0.4542597, 2.732725, 0, 0, 0, 1, 1,
0.8164501, -0.1123586, 2.249805, 0, 0, 0, 1, 1,
0.8183641, -1.65559, 3.782059, 0, 0, 0, 1, 1,
0.8192613, -0.15109, 2.969758, 0, 0, 0, 1, 1,
0.8206409, -0.156731, 2.485466, 1, 1, 1, 1, 1,
0.8250046, -1.751326, 2.985254, 1, 1, 1, 1, 1,
0.8296563, -0.4725277, 0.7377685, 1, 1, 1, 1, 1,
0.8319476, 0.4722128, 1.638314, 1, 1, 1, 1, 1,
0.8326256, 0.5216173, 1.870556, 1, 1, 1, 1, 1,
0.8345117, -0.4621536, 1.518699, 1, 1, 1, 1, 1,
0.8375623, 0.5111926, 1.333616, 1, 1, 1, 1, 1,
0.839292, 0.1294851, 0.5438168, 1, 1, 1, 1, 1,
0.8439397, 0.8357461, 0.9351524, 1, 1, 1, 1, 1,
0.8466288, 0.2980836, 1.911318, 1, 1, 1, 1, 1,
0.8467316, 2.484416, 0.6402874, 1, 1, 1, 1, 1,
0.8480145, 0.4693123, 0.6804431, 1, 1, 1, 1, 1,
0.8495702, 1.575227, -0.7539157, 1, 1, 1, 1, 1,
0.8510551, 2.563807, -0.8644129, 1, 1, 1, 1, 1,
0.8520809, -0.5127759, 2.886381, 1, 1, 1, 1, 1,
0.8529593, 2.808862, 0.8542082, 0, 0, 1, 1, 1,
0.8548625, 1.238382, -0.6158664, 1, 0, 0, 1, 1,
0.8578281, -0.5999327, 2.133198, 1, 0, 0, 1, 1,
0.8578748, 0.5475512, 0.9441305, 1, 0, 0, 1, 1,
0.8828534, 0.2449663, 2.149835, 1, 0, 0, 1, 1,
0.8831157, 0.04017105, 1.822916, 1, 0, 0, 1, 1,
0.8846495, 0.07532094, 1.798271, 0, 0, 0, 1, 1,
0.8891817, -0.2363892, 2.202977, 0, 0, 0, 1, 1,
0.89491, -0.06435926, 2.147328, 0, 0, 0, 1, 1,
0.9050497, 0.2835962, 0.3994519, 0, 0, 0, 1, 1,
0.9050607, 0.790897, 0.3599789, 0, 0, 0, 1, 1,
0.9074659, 0.8851781, 2.521169, 0, 0, 0, 1, 1,
0.9110737, 0.3613263, -0.04325563, 0, 0, 0, 1, 1,
0.9140559, 1.565096, 1.715361, 1, 1, 1, 1, 1,
0.9269476, -0.474198, 3.685689, 1, 1, 1, 1, 1,
0.9403882, -0.2106552, 1.338644, 1, 1, 1, 1, 1,
0.9424633, -1.553811, 2.16767, 1, 1, 1, 1, 1,
0.9442333, 2.436711, -0.2824086, 1, 1, 1, 1, 1,
0.9514297, 0.5224274, 0.7517282, 1, 1, 1, 1, 1,
0.9590999, 1.027998, 0.4431942, 1, 1, 1, 1, 1,
0.9615069, -1.841961, 4.754104, 1, 1, 1, 1, 1,
0.9635533, -0.3944113, 3.379435, 1, 1, 1, 1, 1,
0.9742896, 0.4420919, 1.552219, 1, 1, 1, 1, 1,
0.9764989, -0.6683837, 3.037252, 1, 1, 1, 1, 1,
0.9796534, -0.1148187, 2.547385, 1, 1, 1, 1, 1,
0.980336, -0.4849797, 3.178031, 1, 1, 1, 1, 1,
0.9864243, -0.06574365, 1.714785, 1, 1, 1, 1, 1,
0.9939067, -1.267962, 1.503795, 1, 1, 1, 1, 1,
0.9958857, 0.7594125, 0.003173357, 0, 0, 1, 1, 1,
0.9969046, 1.292619, 1.03755, 1, 0, 0, 1, 1,
1.00428, -2.145493, 3.130934, 1, 0, 0, 1, 1,
1.004777, -0.258164, 2.79964, 1, 0, 0, 1, 1,
1.019476, -0.7718028, 3.323821, 1, 0, 0, 1, 1,
1.020949, -0.005867708, 1.782046, 1, 0, 0, 1, 1,
1.029223, 0.2202851, 0.004489316, 0, 0, 0, 1, 1,
1.032041, -0.6579602, 2.29173, 0, 0, 0, 1, 1,
1.039548, 1.143033, 1.979104, 0, 0, 0, 1, 1,
1.039887, 1.194327, -0.7885754, 0, 0, 0, 1, 1,
1.042231, -0.3388048, 2.712176, 0, 0, 0, 1, 1,
1.04291, -0.207248, 0.03600827, 0, 0, 0, 1, 1,
1.043482, -0.8924556, 2.495845, 0, 0, 0, 1, 1,
1.047644, 0.1259463, 2.059378, 1, 1, 1, 1, 1,
1.0531, 0.9871147, 0.7764934, 1, 1, 1, 1, 1,
1.053849, -0.3315344, 4.052867, 1, 1, 1, 1, 1,
1.057172, 0.8920424, -0.5319917, 1, 1, 1, 1, 1,
1.058937, -0.2395246, 2.479031, 1, 1, 1, 1, 1,
1.05979, 0.159795, 1.797043, 1, 1, 1, 1, 1,
1.062336, 1.366101, 0.00041851, 1, 1, 1, 1, 1,
1.062986, -1.436556, 2.654276, 1, 1, 1, 1, 1,
1.067482, 0.8050027, 0.04165475, 1, 1, 1, 1, 1,
1.067914, -0.3112979, 2.228575, 1, 1, 1, 1, 1,
1.08326, -1.131562, 1.32876, 1, 1, 1, 1, 1,
1.08478, -2.249458, 2.859825, 1, 1, 1, 1, 1,
1.088061, 0.07187241, 1.728902, 1, 1, 1, 1, 1,
1.099934, 0.07952008, 0.1555876, 1, 1, 1, 1, 1,
1.101777, -0.8591535, 0.4206733, 1, 1, 1, 1, 1,
1.102449, -0.4287798, 2.284121, 0, 0, 1, 1, 1,
1.104898, 1.175471, 1.520967, 1, 0, 0, 1, 1,
1.109202, 0.2924918, 3.24376, 1, 0, 0, 1, 1,
1.115347, 1.111774, 2.26663, 1, 0, 0, 1, 1,
1.116354, 1.023911, 0.5804282, 1, 0, 0, 1, 1,
1.131766, -0.5498582, 0.8820127, 1, 0, 0, 1, 1,
1.135845, 0.4318887, 1.277868, 0, 0, 0, 1, 1,
1.137062, 0.2328397, 2.014239, 0, 0, 0, 1, 1,
1.137973, 0.08412834, 3.208175, 0, 0, 0, 1, 1,
1.142707, 1.909059, -1.059605, 0, 0, 0, 1, 1,
1.14286, 0.4026684, 0.5055771, 0, 0, 0, 1, 1,
1.144727, 0.1034675, 0.7017393, 0, 0, 0, 1, 1,
1.154703, 0.5547478, 1.098299, 0, 0, 0, 1, 1,
1.158477, -2.933057, 2.030862, 1, 1, 1, 1, 1,
1.16499, 2.679134, -1.085037, 1, 1, 1, 1, 1,
1.175565, 1.039706, 1.851636, 1, 1, 1, 1, 1,
1.178732, 0.441859, 1.397547, 1, 1, 1, 1, 1,
1.184572, -0.1887833, 2.433951, 1, 1, 1, 1, 1,
1.18726, -0.3873793, 3.121292, 1, 1, 1, 1, 1,
1.197213, -0.2925393, 2.327143, 1, 1, 1, 1, 1,
1.201882, -2.042001, 2.243896, 1, 1, 1, 1, 1,
1.202676, -0.174347, 0.6903879, 1, 1, 1, 1, 1,
1.202999, -1.77943, 1.13313, 1, 1, 1, 1, 1,
1.207528, -2.375992, 3.349189, 1, 1, 1, 1, 1,
1.21265, -0.2476103, 2.165396, 1, 1, 1, 1, 1,
1.224909, 0.5977356, 1.329545, 1, 1, 1, 1, 1,
1.22766, 2.342782, 3.390634, 1, 1, 1, 1, 1,
1.230037, 0.8502476, 1.153733, 1, 1, 1, 1, 1,
1.230155, -0.5897931, -0.3931955, 0, 0, 1, 1, 1,
1.231633, 0.8639874, 1.314558, 1, 0, 0, 1, 1,
1.244106, 2.113081, 0.4669297, 1, 0, 0, 1, 1,
1.245179, -0.903581, 1.252817, 1, 0, 0, 1, 1,
1.254313, 1.892006, -0.833913, 1, 0, 0, 1, 1,
1.269832, 1.896914, -1.329015, 1, 0, 0, 1, 1,
1.270425, -1.182719, 2.094594, 0, 0, 0, 1, 1,
1.271122, -2.133373, 2.535294, 0, 0, 0, 1, 1,
1.273366, -0.2583143, 3.150879, 0, 0, 0, 1, 1,
1.279886, -1.511878, 1.715123, 0, 0, 0, 1, 1,
1.287041, -1.20943, 1.043497, 0, 0, 0, 1, 1,
1.287571, 0.6693191, 1.561658, 0, 0, 0, 1, 1,
1.301923, -0.5012341, 3.32659, 0, 0, 0, 1, 1,
1.312537, 1.477571, -0.5276236, 1, 1, 1, 1, 1,
1.312726, 1.113921, 0.1219564, 1, 1, 1, 1, 1,
1.313885, 1.054659, 1.119712, 1, 1, 1, 1, 1,
1.323371, 0.1901994, 3.030529, 1, 1, 1, 1, 1,
1.330032, 1.53612, 1.46706, 1, 1, 1, 1, 1,
1.337204, -0.1298151, 0.4314257, 1, 1, 1, 1, 1,
1.341422, -0.5937153, 1.039553, 1, 1, 1, 1, 1,
1.361315, 1.313478, 1.569817, 1, 1, 1, 1, 1,
1.365957, -0.989167, 1.502187, 1, 1, 1, 1, 1,
1.375807, -1.666501, 3.178261, 1, 1, 1, 1, 1,
1.396371, -1.166754, 1.738021, 1, 1, 1, 1, 1,
1.410659, 0.6539719, 0.117825, 1, 1, 1, 1, 1,
1.411452, -0.1169154, 3.195695, 1, 1, 1, 1, 1,
1.415181, 1.228719, 3.233219, 1, 1, 1, 1, 1,
1.419265, -0.6559579, 1.935672, 1, 1, 1, 1, 1,
1.422014, -0.3289177, 2.117057, 0, 0, 1, 1, 1,
1.442725, -0.3827875, 1.340271, 1, 0, 0, 1, 1,
1.457616, -0.7463161, 0.4882075, 1, 0, 0, 1, 1,
1.459018, 0.7562805, 2.796717, 1, 0, 0, 1, 1,
1.461053, -1.141184, 0.9658434, 1, 0, 0, 1, 1,
1.464735, 0.2512389, 0.5271605, 1, 0, 0, 1, 1,
1.464936, 0.2540683, 1.262614, 0, 0, 0, 1, 1,
1.466315, -1.043504, 1.328783, 0, 0, 0, 1, 1,
1.479527, -0.4123979, 0.5932289, 0, 0, 0, 1, 1,
1.486938, 1.66397, -0.02459319, 0, 0, 0, 1, 1,
1.487526, 0.07813419, 1.75842, 0, 0, 0, 1, 1,
1.497276, 0.4999591, 1.320842, 0, 0, 0, 1, 1,
1.51131, -0.1708947, 2.761794, 0, 0, 0, 1, 1,
1.524123, -1.029957, 2.541479, 1, 1, 1, 1, 1,
1.531614, 0.6531955, 1.359733, 1, 1, 1, 1, 1,
1.53791, -1.204478, 2.400745, 1, 1, 1, 1, 1,
1.538078, 0.9300134, 0.1917207, 1, 1, 1, 1, 1,
1.546675, -0.8095238, 2.267461, 1, 1, 1, 1, 1,
1.572066, -0.4330717, 4.103351, 1, 1, 1, 1, 1,
1.583287, 1.059833, 0.8745319, 1, 1, 1, 1, 1,
1.595541, 0.2249438, 0.8933409, 1, 1, 1, 1, 1,
1.599923, -0.9757258, 1.806968, 1, 1, 1, 1, 1,
1.612453, -0.8651022, 2.543774, 1, 1, 1, 1, 1,
1.616454, -0.6523772, 2.47041, 1, 1, 1, 1, 1,
1.619703, -0.7980871, 1.820979, 1, 1, 1, 1, 1,
1.633856, -1.312295, 1.32494, 1, 1, 1, 1, 1,
1.635269, 0.08895224, -0.1082312, 1, 1, 1, 1, 1,
1.642091, 1.304185, 0.149831, 1, 1, 1, 1, 1,
1.646661, -0.5006945, 0.8599832, 0, 0, 1, 1, 1,
1.648344, -1.16912, -0.7139683, 1, 0, 0, 1, 1,
1.655663, 0.7717271, 1.802698, 1, 0, 0, 1, 1,
1.662795, 1.471289, 0.6705094, 1, 0, 0, 1, 1,
1.662869, -0.9784683, 1.795774, 1, 0, 0, 1, 1,
1.664019, 1.662566, 1.360735, 1, 0, 0, 1, 1,
1.668104, 0.7557563, 0.7543287, 0, 0, 0, 1, 1,
1.680441, -0.649001, 1.693595, 0, 0, 0, 1, 1,
1.700233, -1.008468, 4.22224, 0, 0, 0, 1, 1,
1.714442, 0.1087029, -0.1436812, 0, 0, 0, 1, 1,
1.741235, 0.312467, 1.229313, 0, 0, 0, 1, 1,
1.772127, -1.311134, 1.88052, 0, 0, 0, 1, 1,
1.780842, 0.859138, 0.4357145, 0, 0, 0, 1, 1,
1.805194, -0.2484702, 2.100725, 1, 1, 1, 1, 1,
1.810498, 1.651661, 0.538506, 1, 1, 1, 1, 1,
1.822486, -2.313136, 3.444233, 1, 1, 1, 1, 1,
1.845551, -0.6797124, -0.04543189, 1, 1, 1, 1, 1,
1.858874, 0.04752544, 1.049325, 1, 1, 1, 1, 1,
1.86941, -0.2259632, 2.913584, 1, 1, 1, 1, 1,
1.90318, 1.520094, 0.9101648, 1, 1, 1, 1, 1,
1.905969, 1.356004, 3.069078, 1, 1, 1, 1, 1,
1.907756, -1.976091, 3.464305, 1, 1, 1, 1, 1,
1.914128, 1.406333, 0.1786387, 1, 1, 1, 1, 1,
1.943198, 0.6667381, 0.8539101, 1, 1, 1, 1, 1,
1.977641, -0.9479441, 2.663016, 1, 1, 1, 1, 1,
1.9914, 0.3321134, 3.199903, 1, 1, 1, 1, 1,
1.995291, 0.2759302, -0.4613421, 1, 1, 1, 1, 1,
2.012976, 0.08257663, 1.613177, 1, 1, 1, 1, 1,
2.021569, 0.4346545, 0.7781672, 0, 0, 1, 1, 1,
2.044497, 0.1900682, 2.108111, 1, 0, 0, 1, 1,
2.050829, -0.9542534, 1.311852, 1, 0, 0, 1, 1,
2.064532, 2.245457, 0.9948416, 1, 0, 0, 1, 1,
2.066724, 0.6428028, 2.839481, 1, 0, 0, 1, 1,
2.083365, 0.8393044, 1.676358, 1, 0, 0, 1, 1,
2.104479, 2.447992, 0.6857731, 0, 0, 0, 1, 1,
2.104641, -0.04471483, 2.638784, 0, 0, 0, 1, 1,
2.16339, -1.912453, 4.616499, 0, 0, 0, 1, 1,
2.211108, -1.613985, 2.273823, 0, 0, 0, 1, 1,
2.218051, -0.1034798, 1.985933, 0, 0, 0, 1, 1,
2.236179, -2.407449, 2.930924, 0, 0, 0, 1, 1,
2.264372, -0.469548, 3.195004, 0, 0, 0, 1, 1,
2.284075, -0.2514906, 2.035784, 1, 1, 1, 1, 1,
2.286544, 0.06005014, 4.02926, 1, 1, 1, 1, 1,
2.336414, 2.346612, 0.2968317, 1, 1, 1, 1, 1,
2.340363, -0.5941446, 0.8147951, 1, 1, 1, 1, 1,
2.473886, 1.486786, -0.5939531, 1, 1, 1, 1, 1,
2.691257, -1.251342, 3.078048, 1, 1, 1, 1, 1,
2.730964, 0.08169929, 2.888002, 1, 1, 1, 1, 1
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
var radius = 9.65879;
var distance = 33.92609;
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
mvMatrix.translate( 0.2850248, 0.1771333, 0.1253619 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.92609);
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
