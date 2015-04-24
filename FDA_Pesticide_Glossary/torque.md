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
-2.822515, -1.339782, -1.441528, 1, 0, 0, 1,
-2.794096, 2.527384, -1.645495, 1, 0.007843138, 0, 1,
-2.544909, -1.227849, -2.208365, 1, 0.01176471, 0, 1,
-2.51455, 0.8662359, -0.2525872, 1, 0.01960784, 0, 1,
-2.491064, -1.880761, -4.180278, 1, 0.02352941, 0, 1,
-2.461511, 0.005057482, -1.301186, 1, 0.03137255, 0, 1,
-2.396137, -0.2286777, -1.089668, 1, 0.03529412, 0, 1,
-2.381972, 0.6040141, -2.86913, 1, 0.04313726, 0, 1,
-2.381372, -1.021197, -2.406247, 1, 0.04705882, 0, 1,
-2.379313, -0.136625, -1.7886, 1, 0.05490196, 0, 1,
-2.32098, -1.387651, -2.736187, 1, 0.05882353, 0, 1,
-2.223813, 0.1516582, -1.18545, 1, 0.06666667, 0, 1,
-2.22143, 0.4709516, -0.2534384, 1, 0.07058824, 0, 1,
-2.180333, -1.323119, -1.963712, 1, 0.07843138, 0, 1,
-2.124112, 0.4929667, -2.770838, 1, 0.08235294, 0, 1,
-2.067727, 0.6166571, -0.6907986, 1, 0.09019608, 0, 1,
-2.060107, 1.028072, -0.8335946, 1, 0.09411765, 0, 1,
-2.051838, -0.5189779, -2.618329, 1, 0.1019608, 0, 1,
-2.041749, 1.422356, -2.635123, 1, 0.1098039, 0, 1,
-2.039063, 1.507393, -2.911046, 1, 0.1137255, 0, 1,
-2.035275, -1.21885, -2.853119, 1, 0.1215686, 0, 1,
-2.023834, -0.1942356, -0.8778358, 1, 0.1254902, 0, 1,
-2.014535, 1.563074, -2.537985, 1, 0.1333333, 0, 1,
-1.99712, 0.009697657, -1.201033, 1, 0.1372549, 0, 1,
-1.970848, 0.710117, -1.601216, 1, 0.145098, 0, 1,
-1.968613, 0.1131432, -3.360096, 1, 0.1490196, 0, 1,
-1.931631, -1.592579, -1.951897, 1, 0.1568628, 0, 1,
-1.913477, -1.384619, -2.488284, 1, 0.1607843, 0, 1,
-1.853889, -0.5312004, -3.359977, 1, 0.1686275, 0, 1,
-1.837523, 0.3049939, -3.265937, 1, 0.172549, 0, 1,
-1.829115, -0.2336424, -2.115619, 1, 0.1803922, 0, 1,
-1.796947, -1.383626, -1.242166, 1, 0.1843137, 0, 1,
-1.790375, -1.630962, -3.813912, 1, 0.1921569, 0, 1,
-1.787219, -0.5431029, -2.760291, 1, 0.1960784, 0, 1,
-1.781073, -0.1446224, -1.646707, 1, 0.2039216, 0, 1,
-1.778137, -0.04404404, -1.912841, 1, 0.2117647, 0, 1,
-1.760045, 0.7944557, -0.2804917, 1, 0.2156863, 0, 1,
-1.754377, -0.267293, -1.417959, 1, 0.2235294, 0, 1,
-1.748281, 1.292597, -2.013018, 1, 0.227451, 0, 1,
-1.725044, -1.024756, -1.889629, 1, 0.2352941, 0, 1,
-1.717077, 0.5385513, -1.145706, 1, 0.2392157, 0, 1,
-1.715513, -1.388745, -1.325987, 1, 0.2470588, 0, 1,
-1.713607, -0.3802623, -1.313605, 1, 0.2509804, 0, 1,
-1.710143, -1.894257, -5.625008, 1, 0.2588235, 0, 1,
-1.695139, -0.1905128, -3.162989, 1, 0.2627451, 0, 1,
-1.67633, -0.2187561, -2.81759, 1, 0.2705882, 0, 1,
-1.675581, -0.8005076, -1.317596, 1, 0.2745098, 0, 1,
-1.670909, -1.02089, -1.7496, 1, 0.282353, 0, 1,
-1.669191, -1.339205, -2.029273, 1, 0.2862745, 0, 1,
-1.668228, -0.4310485, -2.882142, 1, 0.2941177, 0, 1,
-1.665534, 0.2715453, -1.026476, 1, 0.3019608, 0, 1,
-1.665306, -0.4905617, -1.435322, 1, 0.3058824, 0, 1,
-1.66453, -0.4692377, -1.858497, 1, 0.3137255, 0, 1,
-1.639656, 0.2708568, -2.167036, 1, 0.3176471, 0, 1,
-1.600996, -0.1625421, -4.306347, 1, 0.3254902, 0, 1,
-1.588859, -0.3688163, -1.733589, 1, 0.3294118, 0, 1,
-1.585043, -0.3602972, -2.219029, 1, 0.3372549, 0, 1,
-1.580484, 0.1843129, -0.224558, 1, 0.3411765, 0, 1,
-1.570033, -0.6353808, -3.040975, 1, 0.3490196, 0, 1,
-1.54521, -0.1042736, -0.3293177, 1, 0.3529412, 0, 1,
-1.533794, 0.3499513, -0.3260449, 1, 0.3607843, 0, 1,
-1.517325, -0.7188171, -2.280181, 1, 0.3647059, 0, 1,
-1.508789, -0.1836622, -0.8488648, 1, 0.372549, 0, 1,
-1.507762, 0.03464302, 0.4835152, 1, 0.3764706, 0, 1,
-1.498537, -0.8497544, -1.860155, 1, 0.3843137, 0, 1,
-1.498237, 0.1253172, -1.391445, 1, 0.3882353, 0, 1,
-1.482919, 0.7521425, 0.3093245, 1, 0.3960784, 0, 1,
-1.478346, 2.134816, -0.5198123, 1, 0.4039216, 0, 1,
-1.467652, 0.5929877, -1.124224, 1, 0.4078431, 0, 1,
-1.46368, -1.631528, -1.520059, 1, 0.4156863, 0, 1,
-1.459237, -2.102297, -2.585165, 1, 0.4196078, 0, 1,
-1.455627, -0.6656235, -2.365705, 1, 0.427451, 0, 1,
-1.452057, 0.8814266, -1.687975, 1, 0.4313726, 0, 1,
-1.434609, -1.649847, -2.90919, 1, 0.4392157, 0, 1,
-1.434135, 0.8422629, -1.273588, 1, 0.4431373, 0, 1,
-1.42837, 0.8600395, -2.50906, 1, 0.4509804, 0, 1,
-1.420134, 1.661027, -0.7236732, 1, 0.454902, 0, 1,
-1.417405, -0.7391446, -2.748899, 1, 0.4627451, 0, 1,
-1.403211, -0.6451154, -1.065173, 1, 0.4666667, 0, 1,
-1.400378, 0.01919852, -0.5969115, 1, 0.4745098, 0, 1,
-1.381455, -0.4846053, -1.538743, 1, 0.4784314, 0, 1,
-1.37782, -0.1946502, -2.574852, 1, 0.4862745, 0, 1,
-1.374519, 2.603081, -0.4339342, 1, 0.4901961, 0, 1,
-1.369229, 1.156697, -0.4712228, 1, 0.4980392, 0, 1,
-1.368727, -0.05536291, -1.470206, 1, 0.5058824, 0, 1,
-1.363325, 0.3228267, -0.9576908, 1, 0.509804, 0, 1,
-1.358003, 1.04797, -0.2653212, 1, 0.5176471, 0, 1,
-1.357716, 1.029085, 0.6573133, 1, 0.5215687, 0, 1,
-1.354688, -0.4924645, -2.223439, 1, 0.5294118, 0, 1,
-1.352338, 1.48511, -1.053861, 1, 0.5333334, 0, 1,
-1.351992, -2.324719, -1.585634, 1, 0.5411765, 0, 1,
-1.327477, -0.3937055, -2.11373, 1, 0.5450981, 0, 1,
-1.326984, -0.4091797, -3.121537, 1, 0.5529412, 0, 1,
-1.320037, 0.09475647, -0.3876054, 1, 0.5568628, 0, 1,
-1.31785, 0.3251197, -1.057546, 1, 0.5647059, 0, 1,
-1.317742, 1.406868, -0.4856538, 1, 0.5686275, 0, 1,
-1.311458, 1.459104, 0.4481208, 1, 0.5764706, 0, 1,
-1.292165, 0.7978564, 0.3674212, 1, 0.5803922, 0, 1,
-1.281882, 0.3031624, 0.297809, 1, 0.5882353, 0, 1,
-1.27673, 0.5419585, 0.5683696, 1, 0.5921569, 0, 1,
-1.270679, 0.949742, -1.972813, 1, 0.6, 0, 1,
-1.265664, 0.5944887, -1.659803, 1, 0.6078432, 0, 1,
-1.226487, -0.4538417, -1.559306, 1, 0.6117647, 0, 1,
-1.223267, -0.5240716, -1.960824, 1, 0.6196079, 0, 1,
-1.215011, 0.4309674, -1.183734, 1, 0.6235294, 0, 1,
-1.209935, 1.960355, -1.26477, 1, 0.6313726, 0, 1,
-1.208659, 1.041589, -0.9981681, 1, 0.6352941, 0, 1,
-1.205022, 0.6218974, -1.55213, 1, 0.6431373, 0, 1,
-1.197092, 0.1168827, -1.737731, 1, 0.6470588, 0, 1,
-1.188474, -1.166172, -2.560279, 1, 0.654902, 0, 1,
-1.180116, 0.2492833, -0.6522762, 1, 0.6588235, 0, 1,
-1.175079, 0.01190933, -0.905098, 1, 0.6666667, 0, 1,
-1.168249, 0.1773992, -1.493282, 1, 0.6705883, 0, 1,
-1.165593, 0.3500057, -1.013912, 1, 0.6784314, 0, 1,
-1.152579, -0.2462693, -4.00117, 1, 0.682353, 0, 1,
-1.14923, 0.3596114, -1.581721, 1, 0.6901961, 0, 1,
-1.149059, 0.4074995, -0.6886144, 1, 0.6941177, 0, 1,
-1.14318, 0.1354354, -0.6275439, 1, 0.7019608, 0, 1,
-1.140096, 0.3752845, -1.494115, 1, 0.7098039, 0, 1,
-1.138296, -0.1560204, -2.09495, 1, 0.7137255, 0, 1,
-1.134418, -0.0174772, -2.925477, 1, 0.7215686, 0, 1,
-1.132735, 1.558856, 0.1857503, 1, 0.7254902, 0, 1,
-1.131257, 0.9320474, -0.6614341, 1, 0.7333333, 0, 1,
-1.121292, 0.9842003, -1.294622, 1, 0.7372549, 0, 1,
-1.117398, -1.028575, -4.023449, 1, 0.7450981, 0, 1,
-1.107335, 0.7781991, -0.7892517, 1, 0.7490196, 0, 1,
-1.102921, 0.8693303, -0.2771201, 1, 0.7568628, 0, 1,
-1.096712, -0.6652477, -3.778356, 1, 0.7607843, 0, 1,
-1.094768, 0.8209986, 0.03576731, 1, 0.7686275, 0, 1,
-1.090952, 0.377472, -0.1294169, 1, 0.772549, 0, 1,
-1.089419, 0.9926011, -2.459783, 1, 0.7803922, 0, 1,
-1.088591, -0.001523816, -1.972434, 1, 0.7843137, 0, 1,
-1.06984, -1.084731, -2.353834, 1, 0.7921569, 0, 1,
-1.069233, 1.745806, -0.09839951, 1, 0.7960784, 0, 1,
-1.067231, 0.535501, -1.568182, 1, 0.8039216, 0, 1,
-1.058739, -3.028636, -2.089436, 1, 0.8117647, 0, 1,
-1.057477, -0.8951166, -0.9894784, 1, 0.8156863, 0, 1,
-1.053187, 1.233133, 0.2611977, 1, 0.8235294, 0, 1,
-1.05174, 1.112509, 0.1637164, 1, 0.827451, 0, 1,
-1.050359, 2.577994, 0.2694641, 1, 0.8352941, 0, 1,
-1.041418, -0.6833532, -4.231619, 1, 0.8392157, 0, 1,
-1.038669, 1.184131, 0.01795281, 1, 0.8470588, 0, 1,
-1.034388, -0.1796106, -0.5148106, 1, 0.8509804, 0, 1,
-1.034189, 0.3676502, 0.1920501, 1, 0.8588235, 0, 1,
-1.020615, -0.4969202, -3.694009, 1, 0.8627451, 0, 1,
-1.013046, 0.3229885, -3.158679, 1, 0.8705882, 0, 1,
-1.012494, 0.1580845, -2.229746, 1, 0.8745098, 0, 1,
-1.011029, 0.05097124, -0.4990027, 1, 0.8823529, 0, 1,
-1.008102, -0.6433561, -3.410918, 1, 0.8862745, 0, 1,
-1.004939, -0.3502746, -3.69442, 1, 0.8941177, 0, 1,
-1.002434, -0.02412411, -1.684017, 1, 0.8980392, 0, 1,
-0.9948115, 0.7233669, -1.546799, 1, 0.9058824, 0, 1,
-0.9936937, 0.4895217, -1.118833, 1, 0.9137255, 0, 1,
-0.9833415, 2.230561, -1.419412, 1, 0.9176471, 0, 1,
-0.9812449, -0.02536657, -3.292799, 1, 0.9254902, 0, 1,
-0.9798358, -0.7280968, -2.356797, 1, 0.9294118, 0, 1,
-0.9787463, 1.066096, -2.232805, 1, 0.9372549, 0, 1,
-0.9769561, 2.202236, -0.4796319, 1, 0.9411765, 0, 1,
-0.974575, -0.3079583, -1.142734, 1, 0.9490196, 0, 1,
-0.9692236, 1.095289, 0.03279537, 1, 0.9529412, 0, 1,
-0.9654478, 2.538496, -0.4044375, 1, 0.9607843, 0, 1,
-0.9620532, -0.9262032, -3.392186, 1, 0.9647059, 0, 1,
-0.9616343, 1.746458, -0.4613791, 1, 0.972549, 0, 1,
-0.9598143, -2.476933, -1.251002, 1, 0.9764706, 0, 1,
-0.9558437, 1.668285, -1.801661, 1, 0.9843137, 0, 1,
-0.9508191, 0.6749476, -0.4788004, 1, 0.9882353, 0, 1,
-0.9494066, 0.02439481, -1.684467, 1, 0.9960784, 0, 1,
-0.9493676, -1.079502, -1.512608, 0.9960784, 1, 0, 1,
-0.9469631, 0.9559109, -2.423451, 0.9921569, 1, 0, 1,
-0.9454833, -0.7666568, -3.420413, 0.9843137, 1, 0, 1,
-0.9434569, -1.95463, -1.593307, 0.9803922, 1, 0, 1,
-0.9337765, 0.9719473, -0.008773712, 0.972549, 1, 0, 1,
-0.9327909, 1.752568, 0.7537159, 0.9686275, 1, 0, 1,
-0.9253739, 0.6444198, -2.874799, 0.9607843, 1, 0, 1,
-0.9235891, 1.083338, -0.7527512, 0.9568627, 1, 0, 1,
-0.9167603, -0.191958, -1.85181, 0.9490196, 1, 0, 1,
-0.8971032, -0.54871, -1.309502, 0.945098, 1, 0, 1,
-0.8941693, -1.134752, -3.965827, 0.9372549, 1, 0, 1,
-0.8805383, 0.4907892, -2.264886, 0.9333333, 1, 0, 1,
-0.8796822, -0.6100893, -1.848861, 0.9254902, 1, 0, 1,
-0.8772366, 0.382939, -1.432077, 0.9215686, 1, 0, 1,
-0.8766109, 0.8659641, -1.045879, 0.9137255, 1, 0, 1,
-0.8759508, 0.6069191, -1.431276, 0.9098039, 1, 0, 1,
-0.8714384, -0.3446285, -2.903332, 0.9019608, 1, 0, 1,
-0.8708202, 0.4420867, -0.9160743, 0.8941177, 1, 0, 1,
-0.8706456, -2.243923, -3.558945, 0.8901961, 1, 0, 1,
-0.8647198, 0.2231828, -0.9496543, 0.8823529, 1, 0, 1,
-0.8549113, 1.130744, -0.6903811, 0.8784314, 1, 0, 1,
-0.8542188, -0.03731772, -1.073153, 0.8705882, 1, 0, 1,
-0.8509499, -1.614561, -1.060859, 0.8666667, 1, 0, 1,
-0.8490639, 0.8894886, -0.5546532, 0.8588235, 1, 0, 1,
-0.8424089, 1.529848, 1.055339, 0.854902, 1, 0, 1,
-0.8417922, 0.8830604, -0.8980532, 0.8470588, 1, 0, 1,
-0.8394338, -0.4331056, -1.577598, 0.8431373, 1, 0, 1,
-0.839403, 0.001529874, -2.315256, 0.8352941, 1, 0, 1,
-0.8386995, -0.3326418, -1.793496, 0.8313726, 1, 0, 1,
-0.8341506, 0.6312675, -1.336532, 0.8235294, 1, 0, 1,
-0.8326985, 0.2810218, -2.380539, 0.8196079, 1, 0, 1,
-0.8281121, 0.6332291, 0.01662012, 0.8117647, 1, 0, 1,
-0.8185291, -1.599656, -2.545589, 0.8078431, 1, 0, 1,
-0.8169382, 0.6017933, -0.6950039, 0.8, 1, 0, 1,
-0.8101587, 0.02684591, -2.366236, 0.7921569, 1, 0, 1,
-0.8050175, -0.04653913, -1.292169, 0.7882353, 1, 0, 1,
-0.8034957, 0.02160934, -1.532966, 0.7803922, 1, 0, 1,
-0.7922508, -0.8213713, -2.333171, 0.7764706, 1, 0, 1,
-0.7895362, 0.2688442, -0.3726406, 0.7686275, 1, 0, 1,
-0.785322, 1.682912, -0.8552484, 0.7647059, 1, 0, 1,
-0.7837328, -0.7272072, -1.42489, 0.7568628, 1, 0, 1,
-0.7798201, -0.1745297, -2.130853, 0.7529412, 1, 0, 1,
-0.7792056, 0.8007374, 0.23463, 0.7450981, 1, 0, 1,
-0.7771385, 0.3769042, -0.7539791, 0.7411765, 1, 0, 1,
-0.7631327, 0.1992079, -2.585629, 0.7333333, 1, 0, 1,
-0.7513388, 0.6504917, -3.162219, 0.7294118, 1, 0, 1,
-0.7499814, 1.000666, -1.63889, 0.7215686, 1, 0, 1,
-0.7464909, 0.9175965, -0.8689974, 0.7176471, 1, 0, 1,
-0.7453869, -0.02610282, -2.689374, 0.7098039, 1, 0, 1,
-0.7403467, -0.5141408, -0.9883748, 0.7058824, 1, 0, 1,
-0.7402325, -1.338324, -0.8477805, 0.6980392, 1, 0, 1,
-0.7400069, -2.537694, -2.563166, 0.6901961, 1, 0, 1,
-0.7323461, -1.100796, -2.053431, 0.6862745, 1, 0, 1,
-0.7270826, 0.6120052, -1.435538, 0.6784314, 1, 0, 1,
-0.7240148, -2.690384, -4.495188, 0.6745098, 1, 0, 1,
-0.7239507, 0.2592466, 0.592129, 0.6666667, 1, 0, 1,
-0.70784, 0.5721398, -0.9804077, 0.6627451, 1, 0, 1,
-0.7046191, 0.6370996, 0.4844391, 0.654902, 1, 0, 1,
-0.7045498, -0.3253399, -2.191752, 0.6509804, 1, 0, 1,
-0.7039827, 0.4844979, 0.3880632, 0.6431373, 1, 0, 1,
-0.7032045, -1.8312, -3.367501, 0.6392157, 1, 0, 1,
-0.7017223, 2.156216, -1.840252, 0.6313726, 1, 0, 1,
-0.7015718, -0.5109334, -3.374543, 0.627451, 1, 0, 1,
-0.6936361, 0.742015, -2.034835, 0.6196079, 1, 0, 1,
-0.6931628, -1.681283, -2.348943, 0.6156863, 1, 0, 1,
-0.6917551, -0.03558455, -1.668556, 0.6078432, 1, 0, 1,
-0.6909224, -2.107673, -4.200708, 0.6039216, 1, 0, 1,
-0.6855645, -0.0418169, -1.383335, 0.5960785, 1, 0, 1,
-0.6841833, 1.798157, 0.06083371, 0.5882353, 1, 0, 1,
-0.6839623, 0.1958311, 0.00406884, 0.5843138, 1, 0, 1,
-0.6815294, -0.4468424, -2.193647, 0.5764706, 1, 0, 1,
-0.6799233, -1.973946, -2.907884, 0.572549, 1, 0, 1,
-0.67555, 0.6896191, -1.231243, 0.5647059, 1, 0, 1,
-0.6716603, 0.6078751, -1.556266, 0.5607843, 1, 0, 1,
-0.6648262, 0.08083382, -0.7595382, 0.5529412, 1, 0, 1,
-0.6619928, 0.1053177, -0.6981853, 0.5490196, 1, 0, 1,
-0.6583444, -1.587508, -2.380074, 0.5411765, 1, 0, 1,
-0.6465915, 0.1284063, -1.444289, 0.5372549, 1, 0, 1,
-0.6381777, 1.367273, -1.28108, 0.5294118, 1, 0, 1,
-0.6359186, -2.818355, -2.680876, 0.5254902, 1, 0, 1,
-0.6299808, -0.2118024, -0.4683189, 0.5176471, 1, 0, 1,
-0.6284555, 0.5238988, -1.061469, 0.5137255, 1, 0, 1,
-0.6266461, 1.638269, -0.9719233, 0.5058824, 1, 0, 1,
-0.6233766, 0.5095844, -2.23299, 0.5019608, 1, 0, 1,
-0.6184163, 0.2405422, -3.026283, 0.4941176, 1, 0, 1,
-0.6174485, 0.579816, 0.5480213, 0.4862745, 1, 0, 1,
-0.6157963, 0.8632292, 1.069772, 0.4823529, 1, 0, 1,
-0.6142723, -1.640202, -1.609643, 0.4745098, 1, 0, 1,
-0.6129966, -0.8515072, -2.74276, 0.4705882, 1, 0, 1,
-0.6127896, 0.1379102, 0.03720681, 0.4627451, 1, 0, 1,
-0.6116215, 1.933823, 0.02042966, 0.4588235, 1, 0, 1,
-0.6061931, -0.5065871, -1.659255, 0.4509804, 1, 0, 1,
-0.6061041, 1.929533, 0.4018382, 0.4470588, 1, 0, 1,
-0.6041915, -0.01823748, -1.837661, 0.4392157, 1, 0, 1,
-0.5998131, -1.626119, -1.910681, 0.4352941, 1, 0, 1,
-0.5823054, -0.5194994, -1.874126, 0.427451, 1, 0, 1,
-0.5744395, -0.262209, -0.6249087, 0.4235294, 1, 0, 1,
-0.565731, 0.479251, -1.584714, 0.4156863, 1, 0, 1,
-0.563149, 1.111725, -0.9847426, 0.4117647, 1, 0, 1,
-0.5623776, 0.6017218, -0.2049994, 0.4039216, 1, 0, 1,
-0.5571154, 1.245627, -0.3643799, 0.3960784, 1, 0, 1,
-0.5563774, -1.107206, -3.701013, 0.3921569, 1, 0, 1,
-0.5547951, 0.7190915, 0.204101, 0.3843137, 1, 0, 1,
-0.5496685, -1.905819, -1.167278, 0.3803922, 1, 0, 1,
-0.5453343, -1.074101, -2.900316, 0.372549, 1, 0, 1,
-0.5445778, -1.460665, -4.819623, 0.3686275, 1, 0, 1,
-0.5370316, -1.065802, -1.90122, 0.3607843, 1, 0, 1,
-0.5368379, 1.957376, -0.4086888, 0.3568628, 1, 0, 1,
-0.5362096, 0.417715, -0.8664806, 0.3490196, 1, 0, 1,
-0.5355713, 0.7519326, -1.2205, 0.345098, 1, 0, 1,
-0.5302177, 0.2929904, -0.7773607, 0.3372549, 1, 0, 1,
-0.5289248, 0.3871195, 0.6081985, 0.3333333, 1, 0, 1,
-0.5239536, -1.084632, -2.910945, 0.3254902, 1, 0, 1,
-0.5223286, 0.6364449, 0.8596141, 0.3215686, 1, 0, 1,
-0.5197859, -0.09315045, -2.469064, 0.3137255, 1, 0, 1,
-0.5156056, 0.2322919, -0.8488032, 0.3098039, 1, 0, 1,
-0.5133655, -0.1186108, -1.094321, 0.3019608, 1, 0, 1,
-0.5122714, 0.7223235, -0.9602308, 0.2941177, 1, 0, 1,
-0.5097155, 0.03354575, -3.558542, 0.2901961, 1, 0, 1,
-0.5070854, -1.282275, -2.23398, 0.282353, 1, 0, 1,
-0.5000944, 0.5286168, -0.06506492, 0.2784314, 1, 0, 1,
-0.4984802, -0.1410342, -1.180887, 0.2705882, 1, 0, 1,
-0.4983768, 1.255622, 0.2141632, 0.2666667, 1, 0, 1,
-0.493871, 1.549765, 0.2348217, 0.2588235, 1, 0, 1,
-0.4920164, -0.6167077, -3.28983, 0.254902, 1, 0, 1,
-0.4881238, -0.7275025, -1.556122, 0.2470588, 1, 0, 1,
-0.4863039, 0.4322882, 0.3006188, 0.2431373, 1, 0, 1,
-0.4857435, 0.7181211, -2.621838, 0.2352941, 1, 0, 1,
-0.4843664, -0.5017179, -1.999993, 0.2313726, 1, 0, 1,
-0.4830412, 0.01062336, -2.446495, 0.2235294, 1, 0, 1,
-0.4820722, 0.5880085, 1.835761, 0.2196078, 1, 0, 1,
-0.4679791, 1.008312, -1.881339, 0.2117647, 1, 0, 1,
-0.4653073, 0.5736024, -0.6946896, 0.2078431, 1, 0, 1,
-0.4634483, -0.2694395, -2.560236, 0.2, 1, 0, 1,
-0.4534422, -0.01571947, -0.5507354, 0.1921569, 1, 0, 1,
-0.4510874, 1.862666, -1.100003, 0.1882353, 1, 0, 1,
-0.4495889, -3.371844, -1.086278, 0.1803922, 1, 0, 1,
-0.4488674, 1.012621, -2.113209, 0.1764706, 1, 0, 1,
-0.4480228, -2.567218, -2.012183, 0.1686275, 1, 0, 1,
-0.4473209, -0.272662, -1.422878, 0.1647059, 1, 0, 1,
-0.4458204, -1.177522, -2.823483, 0.1568628, 1, 0, 1,
-0.4429792, 0.6242989, -0.660892, 0.1529412, 1, 0, 1,
-0.4421903, 2.1356, -0.4287379, 0.145098, 1, 0, 1,
-0.4347939, 0.9560405, -0.8288083, 0.1411765, 1, 0, 1,
-0.4277686, 0.2743687, -1.921129, 0.1333333, 1, 0, 1,
-0.4267376, -0.4933131, -2.459418, 0.1294118, 1, 0, 1,
-0.4263425, -0.830024, -3.018478, 0.1215686, 1, 0, 1,
-0.4256214, 1.387205, -1.114019, 0.1176471, 1, 0, 1,
-0.4214948, 0.3642934, -1.270905, 0.1098039, 1, 0, 1,
-0.4207709, 1.073283, -0.7167195, 0.1058824, 1, 0, 1,
-0.4194855, -1.232322, -2.71609, 0.09803922, 1, 0, 1,
-0.4157897, 1.522134, -1.91283, 0.09019608, 1, 0, 1,
-0.4155578, 1.009987, -0.1828016, 0.08627451, 1, 0, 1,
-0.4153025, -1.452312, -2.184301, 0.07843138, 1, 0, 1,
-0.4146575, 0.3638056, -1.340766, 0.07450981, 1, 0, 1,
-0.413565, 0.9701381, -0.2889343, 0.06666667, 1, 0, 1,
-0.4115252, 0.06375286, -3.729926, 0.0627451, 1, 0, 1,
-0.4113136, -0.1072322, -0.764695, 0.05490196, 1, 0, 1,
-0.4106959, 0.3178878, -1.239042, 0.05098039, 1, 0, 1,
-0.4092679, -0.6666908, -1.474348, 0.04313726, 1, 0, 1,
-0.4091498, 0.2662661, -1.23056, 0.03921569, 1, 0, 1,
-0.3999533, 0.2209765, -1.730652, 0.03137255, 1, 0, 1,
-0.3900118, -0.1224317, -2.212636, 0.02745098, 1, 0, 1,
-0.3876285, 0.8254954, -0.5469203, 0.01960784, 1, 0, 1,
-0.3801705, 0.03972725, -1.1083, 0.01568628, 1, 0, 1,
-0.3796627, 0.3688271, -0.9182952, 0.007843138, 1, 0, 1,
-0.3727525, -0.925399, -1.222093, 0.003921569, 1, 0, 1,
-0.3724737, 0.274079, -1.706849, 0, 1, 0.003921569, 1,
-0.371808, -0.3898591, -2.329577, 0, 1, 0.01176471, 1,
-0.3673069, 1.675402, -0.8166409, 0, 1, 0.01568628, 1,
-0.3669936, 0.3570226, -0.1574945, 0, 1, 0.02352941, 1,
-0.3640709, -0.631167, -3.055253, 0, 1, 0.02745098, 1,
-0.3489576, -1.714218, -1.375874, 0, 1, 0.03529412, 1,
-0.3483948, 1.132331, 0.4085331, 0, 1, 0.03921569, 1,
-0.3462313, 0.04887215, -0.697222, 0, 1, 0.04705882, 1,
-0.3460443, 0.3009864, -0.8754286, 0, 1, 0.05098039, 1,
-0.3445369, -0.1677775, -3.175794, 0, 1, 0.05882353, 1,
-0.3370995, 1.356143, -1.070962, 0, 1, 0.0627451, 1,
-0.3355725, 0.05183077, -1.983838, 0, 1, 0.07058824, 1,
-0.3323473, -0.806378, -3.843565, 0, 1, 0.07450981, 1,
-0.3316442, -1.164802, -2.733868, 0, 1, 0.08235294, 1,
-0.3298178, 0.4563502, 0.3630573, 0, 1, 0.08627451, 1,
-0.3297777, -0.3522955, -1.565761, 0, 1, 0.09411765, 1,
-0.3285918, -0.2719165, -2.180976, 0, 1, 0.1019608, 1,
-0.3180645, -2.095675, -2.77108, 0, 1, 0.1058824, 1,
-0.3163854, -0.3865375, -1.631769, 0, 1, 0.1137255, 1,
-0.3163631, 1.512498, 1.211605, 0, 1, 0.1176471, 1,
-0.3155695, -0.9513903, -1.92431, 0, 1, 0.1254902, 1,
-0.3143548, 0.3453799, 0.2197364, 0, 1, 0.1294118, 1,
-0.3129203, -1.242864, -1.639438, 0, 1, 0.1372549, 1,
-0.3109286, -0.2856879, -2.428432, 0, 1, 0.1411765, 1,
-0.3053819, -0.1518818, 1.272742, 0, 1, 0.1490196, 1,
-0.3041292, -1.417314, -3.905431, 0, 1, 0.1529412, 1,
-0.3029058, 2.625001, -0.8004396, 0, 1, 0.1607843, 1,
-0.3003193, -0.957092, -2.017186, 0, 1, 0.1647059, 1,
-0.2992012, 1.55691, 0.9242103, 0, 1, 0.172549, 1,
-0.2975807, -0.852869, -3.14911, 0, 1, 0.1764706, 1,
-0.2961825, 0.46725, -1.339784, 0, 1, 0.1843137, 1,
-0.2960205, -0.7628186, -3.544316, 0, 1, 0.1882353, 1,
-0.2946852, 1.721239, -1.991997, 0, 1, 0.1960784, 1,
-0.2925659, 1.274599, 0.9783155, 0, 1, 0.2039216, 1,
-0.2921483, -1.484376, -3.611569, 0, 1, 0.2078431, 1,
-0.2919734, -0.6290558, -2.40714, 0, 1, 0.2156863, 1,
-0.2909913, 0.7535167, -0.2512299, 0, 1, 0.2196078, 1,
-0.2908247, -0.1087413, -2.446075, 0, 1, 0.227451, 1,
-0.2900332, 1.227474, -0.7484637, 0, 1, 0.2313726, 1,
-0.2896061, -1.840896, -4.459687, 0, 1, 0.2392157, 1,
-0.2851143, -0.8671215, -4.101228, 0, 1, 0.2431373, 1,
-0.283052, -0.2341233, -2.293462, 0, 1, 0.2509804, 1,
-0.2783078, 0.5063114, -1.257705, 0, 1, 0.254902, 1,
-0.2782665, -0.3425724, -1.085316, 0, 1, 0.2627451, 1,
-0.2782347, 0.6477253, 0.5507001, 0, 1, 0.2666667, 1,
-0.2755921, -0.3838536, -2.415229, 0, 1, 0.2745098, 1,
-0.2723977, 1.071931, 0.01959329, 0, 1, 0.2784314, 1,
-0.2684453, -0.403799, -3.340694, 0, 1, 0.2862745, 1,
-0.2671955, -1.290802, -4.845905, 0, 1, 0.2901961, 1,
-0.2647217, 0.7179849, -0.5366922, 0, 1, 0.2980392, 1,
-0.2622119, 0.406558, 0.4139476, 0, 1, 0.3058824, 1,
-0.2615481, 0.01164536, -2.152306, 0, 1, 0.3098039, 1,
-0.259675, -2.950557, -2.769105, 0, 1, 0.3176471, 1,
-0.2590647, 1.054035, -1.407142, 0, 1, 0.3215686, 1,
-0.2519689, 1.713647, -1.532819, 0, 1, 0.3294118, 1,
-0.2491486, -2.513401, -3.213004, 0, 1, 0.3333333, 1,
-0.2462516, -1.107482, -2.520672, 0, 1, 0.3411765, 1,
-0.2413183, 0.1285618, -1.766635, 0, 1, 0.345098, 1,
-0.24041, -2.216563, -1.846093, 0, 1, 0.3529412, 1,
-0.2386675, -0.8813416, -1.631423, 0, 1, 0.3568628, 1,
-0.2374505, -0.01676042, -0.9253964, 0, 1, 0.3647059, 1,
-0.2368081, -1.166002, -4.457698, 0, 1, 0.3686275, 1,
-0.2323451, -0.2673519, -2.377374, 0, 1, 0.3764706, 1,
-0.2291074, 0.6662515, 0.1801742, 0, 1, 0.3803922, 1,
-0.2284992, 1.278619, -2.233933, 0, 1, 0.3882353, 1,
-0.2230678, 2.223268, 0.8847181, 0, 1, 0.3921569, 1,
-0.2162429, -0.5306846, -2.394505, 0, 1, 0.4, 1,
-0.2151307, -1.015394, -3.300182, 0, 1, 0.4078431, 1,
-0.2134441, -0.06116472, -3.743374, 0, 1, 0.4117647, 1,
-0.2080577, 0.1162909, -1.557601, 0, 1, 0.4196078, 1,
-0.2059912, -1.534154, -4.831146, 0, 1, 0.4235294, 1,
-0.205636, -0.5046744, -2.381697, 0, 1, 0.4313726, 1,
-0.1994466, 1.429086, -0.6824391, 0, 1, 0.4352941, 1,
-0.1992423, 2.373956, -0.05755671, 0, 1, 0.4431373, 1,
-0.194334, -0.07202519, -1.552329, 0, 1, 0.4470588, 1,
-0.1939124, 1.525274, 0.7828046, 0, 1, 0.454902, 1,
-0.1923313, -0.5036444, -2.872379, 0, 1, 0.4588235, 1,
-0.1920696, 0.3131159, -0.099214, 0, 1, 0.4666667, 1,
-0.1918563, 0.7754984, 0.9155085, 0, 1, 0.4705882, 1,
-0.184248, 1.35145, -0.3411244, 0, 1, 0.4784314, 1,
-0.1754354, -1.402092, -3.637525, 0, 1, 0.4823529, 1,
-0.1715429, -1.121775, -2.993794, 0, 1, 0.4901961, 1,
-0.1675828, -0.4048696, -2.398632, 0, 1, 0.4941176, 1,
-0.1661266, -0.01798117, -0.1667668, 0, 1, 0.5019608, 1,
-0.1578754, -2.127693, -1.979206, 0, 1, 0.509804, 1,
-0.1577393, -0.06034866, -2.728024, 0, 1, 0.5137255, 1,
-0.1545074, -0.7554975, -1.817287, 0, 1, 0.5215687, 1,
-0.1510162, 0.02725157, -2.725917, 0, 1, 0.5254902, 1,
-0.1407326, -0.1127359, -1.569262, 0, 1, 0.5333334, 1,
-0.1404202, -1.084379, -3.277868, 0, 1, 0.5372549, 1,
-0.1393565, 0.3573069, -0.5911514, 0, 1, 0.5450981, 1,
-0.1379335, 0.7886572, -1.8656, 0, 1, 0.5490196, 1,
-0.1340108, 0.2542488, -0.6487243, 0, 1, 0.5568628, 1,
-0.1322501, 0.4990649, -1.279289, 0, 1, 0.5607843, 1,
-0.1321744, -0.7074711, -0.9039968, 0, 1, 0.5686275, 1,
-0.1277084, 0.1526156, -1.332383, 0, 1, 0.572549, 1,
-0.1268874, 0.2873355, -0.4974952, 0, 1, 0.5803922, 1,
-0.1266803, -0.6264128, -2.597946, 0, 1, 0.5843138, 1,
-0.1182711, 0.4646461, 1.614253, 0, 1, 0.5921569, 1,
-0.1123632, -0.8810734, -1.617668, 0, 1, 0.5960785, 1,
-0.1067636, -0.1904176, -0.4175021, 0, 1, 0.6039216, 1,
-0.1027653, 1.306338, 0.6324063, 0, 1, 0.6117647, 1,
-0.09049968, 0.6408533, -1.419665, 0, 1, 0.6156863, 1,
-0.0884222, 0.9937766, 2.341449, 0, 1, 0.6235294, 1,
-0.08789402, -0.7110198, -3.419532, 0, 1, 0.627451, 1,
-0.08396073, 0.03929162, -1.278647, 0, 1, 0.6352941, 1,
-0.07825419, -1.429235, -1.010986, 0, 1, 0.6392157, 1,
-0.07164852, 0.7834931, -1.169766, 0, 1, 0.6470588, 1,
-0.06971629, -1.124063, -4.722928, 0, 1, 0.6509804, 1,
-0.06953157, -0.7176907, -4.927924, 0, 1, 0.6588235, 1,
-0.06799666, -1.622919, -1.081767, 0, 1, 0.6627451, 1,
-0.06342848, 0.5089382, -1.319017, 0, 1, 0.6705883, 1,
-0.05938469, 0.6285418, 0.9894316, 0, 1, 0.6745098, 1,
-0.05654411, -0.1393979, -4.016969, 0, 1, 0.682353, 1,
-0.05170696, 0.0787091, -0.4156919, 0, 1, 0.6862745, 1,
-0.05162773, 0.278223, 0.02984966, 0, 1, 0.6941177, 1,
-0.04431742, -0.9309291, -3.143647, 0, 1, 0.7019608, 1,
-0.04430593, 0.418525, -0.1229812, 0, 1, 0.7058824, 1,
-0.04389263, -0.9170977, -3.520867, 0, 1, 0.7137255, 1,
-0.03729833, -1.124682, -1.871588, 0, 1, 0.7176471, 1,
-0.03664572, -0.09352645, -3.331077, 0, 1, 0.7254902, 1,
-0.03517987, -0.8859659, -1.942822, 0, 1, 0.7294118, 1,
-0.03181611, -0.8225952, -2.323942, 0, 1, 0.7372549, 1,
-0.0284877, 0.3226806, -2.539835, 0, 1, 0.7411765, 1,
-0.02497296, -0.4929044, -4.623169, 0, 1, 0.7490196, 1,
-0.02146542, -0.7596838, -3.572654, 0, 1, 0.7529412, 1,
-0.01896835, -1.136171, -3.300043, 0, 1, 0.7607843, 1,
-0.01799494, -1.491876, -3.717403, 0, 1, 0.7647059, 1,
-0.01762431, 0.442176, 0.2172446, 0, 1, 0.772549, 1,
-0.01662478, 2.097019, -0.4658961, 0, 1, 0.7764706, 1,
-0.01647892, 0.624438, -0.3203268, 0, 1, 0.7843137, 1,
-0.016352, -0.4306415, -1.832535, 0, 1, 0.7882353, 1,
-0.01600075, 2.051486, 0.8758965, 0, 1, 0.7960784, 1,
-0.01430318, 0.9794022, 0.4972476, 0, 1, 0.8039216, 1,
-0.01396491, -1.226343, -3.947915, 0, 1, 0.8078431, 1,
-0.01393142, 1.841385, 0.3137628, 0, 1, 0.8156863, 1,
-0.0132088, 2.13325, -0.9992841, 0, 1, 0.8196079, 1,
-0.00893709, 1.082461, 1.184232, 0, 1, 0.827451, 1,
-0.004909336, -0.02288325, -3.412786, 0, 1, 0.8313726, 1,
-0.004780222, 0.3859449, -1.573208, 0, 1, 0.8392157, 1,
-0.00475475, -0.8030256, -2.771355, 0, 1, 0.8431373, 1,
-0.001085474, 0.6877708, 0.09535684, 0, 1, 0.8509804, 1,
-0.0002895624, -0.03805017, -1.84688, 0, 1, 0.854902, 1,
-0.0002704773, -0.4238757, -1.928207, 0, 1, 0.8627451, 1,
0.0009848862, -1.765047, 5.596595, 0, 1, 0.8666667, 1,
0.002150899, 1.988402, -1.89923, 0, 1, 0.8745098, 1,
0.002391283, -1.216073, 2.342602, 0, 1, 0.8784314, 1,
0.002580756, 0.07377765, 0.3665692, 0, 1, 0.8862745, 1,
0.01387942, 0.3854178, 0.6179192, 0, 1, 0.8901961, 1,
0.01552853, -1.030664, 3.276026, 0, 1, 0.8980392, 1,
0.01743161, 0.4223371, 1.003161, 0, 1, 0.9058824, 1,
0.02102013, 0.4690376, -1.012002, 0, 1, 0.9098039, 1,
0.02177905, 1.321295, 2.057623, 0, 1, 0.9176471, 1,
0.02245932, -0.4671496, 1.712986, 0, 1, 0.9215686, 1,
0.02348736, -0.1715427, 1.680265, 0, 1, 0.9294118, 1,
0.02592254, -0.09909792, 2.189113, 0, 1, 0.9333333, 1,
0.02636863, 1.92407, 0.9853675, 0, 1, 0.9411765, 1,
0.02652686, 1.093492, 2.094854, 0, 1, 0.945098, 1,
0.02794666, 0.8746073, -0.167593, 0, 1, 0.9529412, 1,
0.02796552, 1.124539, -1.220024, 0, 1, 0.9568627, 1,
0.02798997, 0.07741225, -0.8370059, 0, 1, 0.9647059, 1,
0.03453358, 1.152804, 0.4037246, 0, 1, 0.9686275, 1,
0.03588061, 0.1273186, 0.03788023, 0, 1, 0.9764706, 1,
0.03810132, 0.3923685, -0.2218845, 0, 1, 0.9803922, 1,
0.03813224, 0.7143648, -0.3497656, 0, 1, 0.9882353, 1,
0.03869091, 0.199921, -0.7143886, 0, 1, 0.9921569, 1,
0.04138636, 1.908585, -1.261899, 0, 1, 1, 1,
0.04229668, 0.5893633, -1.579881, 0, 0.9921569, 1, 1,
0.04644159, 0.2083081, 1.200716, 0, 0.9882353, 1, 1,
0.04849856, 0.8569425, -1.088042, 0, 0.9803922, 1, 1,
0.0485691, -1.665596, 2.818299, 0, 0.9764706, 1, 1,
0.04970485, -0.8961418, 2.896022, 0, 0.9686275, 1, 1,
0.05220254, -1.371129, 1.456167, 0, 0.9647059, 1, 1,
0.05601269, 1.432868, 0.9649555, 0, 0.9568627, 1, 1,
0.05624293, 0.501663, 0.8237542, 0, 0.9529412, 1, 1,
0.05662806, 1.089779, 0.5361186, 0, 0.945098, 1, 1,
0.05793181, 0.06339229, 1.275497, 0, 0.9411765, 1, 1,
0.05876314, -0.07838224, 4.231257, 0, 0.9333333, 1, 1,
0.05883346, 0.6907077, -0.09291812, 0, 0.9294118, 1, 1,
0.05989431, -0.9533451, 4.344202, 0, 0.9215686, 1, 1,
0.06021702, -0.4675873, 3.782677, 0, 0.9176471, 1, 1,
0.06277352, 0.8200143, -1.154786, 0, 0.9098039, 1, 1,
0.0641505, -2.173493, 1.779849, 0, 0.9058824, 1, 1,
0.06876613, 1.016842, 0.5827535, 0, 0.8980392, 1, 1,
0.07090192, 1.263583, 1.159331, 0, 0.8901961, 1, 1,
0.07275583, 0.02977057, 0.4824754, 0, 0.8862745, 1, 1,
0.07550847, 0.7736955, 1.065027, 0, 0.8784314, 1, 1,
0.08459815, 0.3419656, 2.98551, 0, 0.8745098, 1, 1,
0.08566848, 0.4708716, 1.571729, 0, 0.8666667, 1, 1,
0.08636928, 0.03379162, 1.958622, 0, 0.8627451, 1, 1,
0.09042253, -0.1476998, 4.933023, 0, 0.854902, 1, 1,
0.09070072, -2.222096, 3.425433, 0, 0.8509804, 1, 1,
0.09375037, -1.25316, 4.91001, 0, 0.8431373, 1, 1,
0.09572323, 0.07639056, 1.719261, 0, 0.8392157, 1, 1,
0.09622782, -1.184252, 3.281845, 0, 0.8313726, 1, 1,
0.09896631, 1.186857, 0.7159165, 0, 0.827451, 1, 1,
0.09896884, 1.118645, 0.5105499, 0, 0.8196079, 1, 1,
0.1023802, 1.678446, -0.6606321, 0, 0.8156863, 1, 1,
0.1074019, -1.350168, 1.330767, 0, 0.8078431, 1, 1,
0.1129381, -1.956057, 2.380068, 0, 0.8039216, 1, 1,
0.1143949, -0.9422222, 4.048867, 0, 0.7960784, 1, 1,
0.1151225, -0.2513805, 4.301412, 0, 0.7882353, 1, 1,
0.1245832, -0.3129901, 1.096623, 0, 0.7843137, 1, 1,
0.1269172, 0.9298476, -0.6504841, 0, 0.7764706, 1, 1,
0.1295176, 0.2899939, 0.46035, 0, 0.772549, 1, 1,
0.1344979, -0.7825207, 3.075344, 0, 0.7647059, 1, 1,
0.1362066, 1.376689, 1.624458, 0, 0.7607843, 1, 1,
0.1388967, -0.5858448, 3.240035, 0, 0.7529412, 1, 1,
0.1395529, -0.6411469, 3.834383, 0, 0.7490196, 1, 1,
0.1401796, -0.3368278, 4.787473, 0, 0.7411765, 1, 1,
0.1417408, 1.20598, -0.3012206, 0, 0.7372549, 1, 1,
0.1423031, -1.788585, 2.95895, 0, 0.7294118, 1, 1,
0.1444584, -0.5941798, 1.807361, 0, 0.7254902, 1, 1,
0.1605968, -1.868679, 3.247692, 0, 0.7176471, 1, 1,
0.1667918, 1.04948, 0.3297876, 0, 0.7137255, 1, 1,
0.1669747, -0.2307608, 4.313942, 0, 0.7058824, 1, 1,
0.1676409, 0.817697, -2.441639, 0, 0.6980392, 1, 1,
0.1693112, 1.275483, 0.9354609, 0, 0.6941177, 1, 1,
0.1815217, -1.004158, 2.516216, 0, 0.6862745, 1, 1,
0.1818348, -1.319756, 3.090986, 0, 0.682353, 1, 1,
0.1818491, -0.3982927, 3.038181, 0, 0.6745098, 1, 1,
0.1818885, 1.024453, 1.213694, 0, 0.6705883, 1, 1,
0.1885441, 0.2987721, 0.7554252, 0, 0.6627451, 1, 1,
0.1905046, 1.381922, 0.2283189, 0, 0.6588235, 1, 1,
0.1983579, 0.2958485, 1.105078, 0, 0.6509804, 1, 1,
0.206089, 1.88318, -0.9576007, 0, 0.6470588, 1, 1,
0.2071459, -0.2442153, 0.7101576, 0, 0.6392157, 1, 1,
0.2079428, 0.7187828, -0.5329807, 0, 0.6352941, 1, 1,
0.2083444, -0.2038743, 5.323704, 0, 0.627451, 1, 1,
0.2084747, 0.7841688, -0.863734, 0, 0.6235294, 1, 1,
0.2091739, -0.2457329, 2.922322, 0, 0.6156863, 1, 1,
0.2139482, 0.9301233, 0.2537047, 0, 0.6117647, 1, 1,
0.2159384, -1.056816, 3.196576, 0, 0.6039216, 1, 1,
0.2173498, -0.2036551, 1.717892, 0, 0.5960785, 1, 1,
0.2189836, 0.0944343, 1.050409, 0, 0.5921569, 1, 1,
0.2195555, 1.227991, -0.3976607, 0, 0.5843138, 1, 1,
0.2259133, 0.7610016, 0.3970882, 0, 0.5803922, 1, 1,
0.2365372, 0.2116241, 1.46395, 0, 0.572549, 1, 1,
0.2451297, 0.9465077, -0.4484082, 0, 0.5686275, 1, 1,
0.246035, 0.7987602, -1.405856, 0, 0.5607843, 1, 1,
0.2489889, 1.216689, 0.3259172, 0, 0.5568628, 1, 1,
0.2490829, 1.021715, -1.627159, 0, 0.5490196, 1, 1,
0.2508238, -1.279095, 3.649688, 0, 0.5450981, 1, 1,
0.2526096, 0.668409, 0.3011859, 0, 0.5372549, 1, 1,
0.253537, -0.2795655, 2.080712, 0, 0.5333334, 1, 1,
0.2544732, 0.6066775, -0.06884694, 0, 0.5254902, 1, 1,
0.2586816, 1.098163, 1.168261, 0, 0.5215687, 1, 1,
0.2608515, -1.087618, 3.942871, 0, 0.5137255, 1, 1,
0.2633059, 0.351046, 0.3008554, 0, 0.509804, 1, 1,
0.2647232, -0.1591574, 0.5822025, 0, 0.5019608, 1, 1,
0.2726001, 1.534563, 0.6103712, 0, 0.4941176, 1, 1,
0.2761523, -0.5782292, 1.093038, 0, 0.4901961, 1, 1,
0.2782674, 0.6291134, -0.8656197, 0, 0.4823529, 1, 1,
0.2792149, -0.8297327, 2.815228, 0, 0.4784314, 1, 1,
0.2838715, 0.6328646, 0.7192205, 0, 0.4705882, 1, 1,
0.2842515, 2.09919, -1.459531, 0, 0.4666667, 1, 1,
0.2877205, -0.9801206, 1.002547, 0, 0.4588235, 1, 1,
0.2882782, -0.2702953, 3.0296, 0, 0.454902, 1, 1,
0.2886846, 0.214285, 0.5582061, 0, 0.4470588, 1, 1,
0.2899491, 2.910041, -0.2641158, 0, 0.4431373, 1, 1,
0.2902493, -1.087316, 2.920748, 0, 0.4352941, 1, 1,
0.2934144, 0.1979333, 2.702712, 0, 0.4313726, 1, 1,
0.296093, 0.03928757, 1.167491, 0, 0.4235294, 1, 1,
0.2961972, -1.193736, 4.052249, 0, 0.4196078, 1, 1,
0.2964187, -1.584248, 2.674727, 0, 0.4117647, 1, 1,
0.3031216, 0.7365683, 0.1589118, 0, 0.4078431, 1, 1,
0.3039848, -0.1787416, 1.767493, 0, 0.4, 1, 1,
0.3075371, -0.137554, 2.273919, 0, 0.3921569, 1, 1,
0.3108993, -0.2023091, 1.880929, 0, 0.3882353, 1, 1,
0.3119667, -1.8668, 4.375711, 0, 0.3803922, 1, 1,
0.3163871, 0.5873719, 0.0674931, 0, 0.3764706, 1, 1,
0.3164641, 0.5405853, 0.7437878, 0, 0.3686275, 1, 1,
0.3173892, -2.230513, 4.27313, 0, 0.3647059, 1, 1,
0.3204555, -0.02043478, 1.628349, 0, 0.3568628, 1, 1,
0.3220797, -0.610868, 2.939492, 0, 0.3529412, 1, 1,
0.3240306, -1.934134, 2.162646, 0, 0.345098, 1, 1,
0.3242157, 0.6212566, 0.4003029, 0, 0.3411765, 1, 1,
0.3302634, -0.5305573, 1.694352, 0, 0.3333333, 1, 1,
0.3304403, 0.5965902, 0.8635951, 0, 0.3294118, 1, 1,
0.3324482, 1.640108, -0.3202685, 0, 0.3215686, 1, 1,
0.3337403, 0.1592428, 0.2381722, 0, 0.3176471, 1, 1,
0.3365474, -2.143566, 1.86617, 0, 0.3098039, 1, 1,
0.3378019, -0.1408707, 2.999256, 0, 0.3058824, 1, 1,
0.3400175, -1.34293, 4.15293, 0, 0.2980392, 1, 1,
0.3438202, 0.6518446, 0.5562786, 0, 0.2901961, 1, 1,
0.3448344, -0.01094137, 1.132229, 0, 0.2862745, 1, 1,
0.3449483, 0.4920046, 2.507262, 0, 0.2784314, 1, 1,
0.346285, -0.04601477, 3.158541, 0, 0.2745098, 1, 1,
0.3476512, -0.4622119, 2.46264, 0, 0.2666667, 1, 1,
0.3490374, 0.351162, 1.346037, 0, 0.2627451, 1, 1,
0.3523094, -1.545918, 4.545385, 0, 0.254902, 1, 1,
0.3581421, -0.6496309, 2.476237, 0, 0.2509804, 1, 1,
0.359893, 0.3208218, 2.178092, 0, 0.2431373, 1, 1,
0.366975, -0.8127928, 2.87062, 0, 0.2392157, 1, 1,
0.3683338, 1.619052, 0.06283519, 0, 0.2313726, 1, 1,
0.3692268, -0.8082319, 2.421685, 0, 0.227451, 1, 1,
0.3750472, -1.352245, 3.820721, 0, 0.2196078, 1, 1,
0.376266, 0.6281285, -0.05497942, 0, 0.2156863, 1, 1,
0.3782936, -0.5008909, 2.062182, 0, 0.2078431, 1, 1,
0.3800483, 0.05822825, 1.052888, 0, 0.2039216, 1, 1,
0.380252, 0.7476274, 0.4977564, 0, 0.1960784, 1, 1,
0.3816518, 0.9900035, -0.1138832, 0, 0.1882353, 1, 1,
0.3843279, -0.945444, 3.51939, 0, 0.1843137, 1, 1,
0.3871262, 0.6378775, -0.7418185, 0, 0.1764706, 1, 1,
0.3917969, -1.318794, 3.423316, 0, 0.172549, 1, 1,
0.3927112, -0.8865482, 2.532194, 0, 0.1647059, 1, 1,
0.3931595, 0.3836441, 0.8780717, 0, 0.1607843, 1, 1,
0.3960634, -0.3567567, 2.955917, 0, 0.1529412, 1, 1,
0.4034876, -0.03129027, 1.551425, 0, 0.1490196, 1, 1,
0.4087405, 0.9073912, -0.5014622, 0, 0.1411765, 1, 1,
0.4123579, 2.308065, 0.2923189, 0, 0.1372549, 1, 1,
0.4157051, 0.0559425, 0.3311331, 0, 0.1294118, 1, 1,
0.4198132, 0.3669717, 0.6908404, 0, 0.1254902, 1, 1,
0.4203028, -0.5397226, 2.563603, 0, 0.1176471, 1, 1,
0.4205362, -0.3191957, 3.622007, 0, 0.1137255, 1, 1,
0.4230767, 1.50907, 1.196777, 0, 0.1058824, 1, 1,
0.4267544, -0.9758366, 2.574993, 0, 0.09803922, 1, 1,
0.4289759, 0.7291754, -0.7848315, 0, 0.09411765, 1, 1,
0.4332451, 0.4102374, 0.8254355, 0, 0.08627451, 1, 1,
0.433525, 1.10704, 0.8236049, 0, 0.08235294, 1, 1,
0.434576, -1.583747, 2.580716, 0, 0.07450981, 1, 1,
0.4399875, 0.003768107, 2.404124, 0, 0.07058824, 1, 1,
0.4432918, -0.4896615, 2.457768, 0, 0.0627451, 1, 1,
0.4441121, -0.262832, 3.164292, 0, 0.05882353, 1, 1,
0.4489502, 0.9491827, -0.1793408, 0, 0.05098039, 1, 1,
0.4524764, -0.1955863, 1.549253, 0, 0.04705882, 1, 1,
0.4524808, -0.03138668, 1.96402, 0, 0.03921569, 1, 1,
0.4528735, -1.39053, 2.257069, 0, 0.03529412, 1, 1,
0.453908, 0.5306274, -0.02171703, 0, 0.02745098, 1, 1,
0.4562549, -1.026549, 1.66537, 0, 0.02352941, 1, 1,
0.4566848, -0.3520778, 2.525082, 0, 0.01568628, 1, 1,
0.4650239, 0.5988614, 0.7259331, 0, 0.01176471, 1, 1,
0.4659002, -0.1335349, 2.18803, 0, 0.003921569, 1, 1,
0.4683311, -0.5421252, 3.904327, 0.003921569, 0, 1, 1,
0.469641, -1.329758, 2.820522, 0.007843138, 0, 1, 1,
0.4701129, 1.459886, 1.096082, 0.01568628, 0, 1, 1,
0.4769625, -1.444942, 2.159795, 0.01960784, 0, 1, 1,
0.4799472, 0.02646299, 1.859707, 0.02745098, 0, 1, 1,
0.4827818, -1.527676, 3.460417, 0.03137255, 0, 1, 1,
0.4828988, 1.081222, -1.383272, 0.03921569, 0, 1, 1,
0.4851814, -0.02503463, 3.221117, 0.04313726, 0, 1, 1,
0.493622, 0.2845005, 1.549791, 0.05098039, 0, 1, 1,
0.494134, -0.4658377, 2.680877, 0.05490196, 0, 1, 1,
0.5007249, -1.341072, 2.745646, 0.0627451, 0, 1, 1,
0.5016112, 0.3939236, -1.177791, 0.06666667, 0, 1, 1,
0.5117806, 0.6273541, 1.497001, 0.07450981, 0, 1, 1,
0.5161411, 0.6717786, 1.235014, 0.07843138, 0, 1, 1,
0.5168754, 0.2068569, 1.74681, 0.08627451, 0, 1, 1,
0.5239779, 0.4804469, 0.5939713, 0.09019608, 0, 1, 1,
0.5282887, -0.3090756, 0.8594681, 0.09803922, 0, 1, 1,
0.5299959, 1.351034, 0.6534791, 0.1058824, 0, 1, 1,
0.5309448, -0.8422356, 4.309645, 0.1098039, 0, 1, 1,
0.5317823, 1.693981, 1.435491, 0.1176471, 0, 1, 1,
0.5329887, -0.6163519, 1.554318, 0.1215686, 0, 1, 1,
0.5364673, 0.1840562, 2.186287, 0.1294118, 0, 1, 1,
0.539503, 1.681637, -0.7003522, 0.1333333, 0, 1, 1,
0.543961, 0.2632285, -0.5858944, 0.1411765, 0, 1, 1,
0.5503165, -0.6459997, 1.908093, 0.145098, 0, 1, 1,
0.5504826, 0.2165761, 3.589111, 0.1529412, 0, 1, 1,
0.5542098, -0.6616218, 3.813511, 0.1568628, 0, 1, 1,
0.5587321, -0.4399109, 1.230244, 0.1647059, 0, 1, 1,
0.5591848, 1.303179, 0.7686682, 0.1686275, 0, 1, 1,
0.5598592, 0.8766798, 1.942451, 0.1764706, 0, 1, 1,
0.5659635, 0.1153781, 0.5946413, 0.1803922, 0, 1, 1,
0.5677155, -1.248039, 3.916922, 0.1882353, 0, 1, 1,
0.571408, -1.611216, 3.13884, 0.1921569, 0, 1, 1,
0.57527, 0.1026384, 1.211701, 0.2, 0, 1, 1,
0.575618, -0.1520279, 2.789948, 0.2078431, 0, 1, 1,
0.5763823, 0.554369, 2.17428, 0.2117647, 0, 1, 1,
0.5767485, -0.1357062, 1.816021, 0.2196078, 0, 1, 1,
0.5839691, -0.3410957, 0.9788804, 0.2235294, 0, 1, 1,
0.5852374, 0.8491322, 2.590561, 0.2313726, 0, 1, 1,
0.5931813, 1.240914, 0.3284377, 0.2352941, 0, 1, 1,
0.5934426, -0.4787841, -1.1701, 0.2431373, 0, 1, 1,
0.5951784, 0.2414259, 1.159751, 0.2470588, 0, 1, 1,
0.5952297, 0.3514895, 1.498977, 0.254902, 0, 1, 1,
0.5959962, -0.02525916, 1.3119, 0.2588235, 0, 1, 1,
0.596424, 0.5909583, 1.228292, 0.2666667, 0, 1, 1,
0.5993106, 1.641936, 2.194953, 0.2705882, 0, 1, 1,
0.6011178, 0.8602946, -0.3452597, 0.2784314, 0, 1, 1,
0.6045547, -0.2028659, 1.354529, 0.282353, 0, 1, 1,
0.6073543, -1.283871, 2.165574, 0.2901961, 0, 1, 1,
0.6091256, -1.246472, 3.188558, 0.2941177, 0, 1, 1,
0.6103855, -0.4625145, 2.994929, 0.3019608, 0, 1, 1,
0.6154301, 0.5944933, -0.05928259, 0.3098039, 0, 1, 1,
0.6209105, -0.8248482, 3.150425, 0.3137255, 0, 1, 1,
0.6284805, 0.1275317, 1.183149, 0.3215686, 0, 1, 1,
0.6352984, -0.3186156, 1.455788, 0.3254902, 0, 1, 1,
0.6378489, 1.493302, 0.3352828, 0.3333333, 0, 1, 1,
0.6438873, -0.6332866, 0.9700242, 0.3372549, 0, 1, 1,
0.6458336, 0.2034291, 1.084394, 0.345098, 0, 1, 1,
0.6548356, 0.8431706, -0.4532763, 0.3490196, 0, 1, 1,
0.6561331, 0.03477579, 0.4820209, 0.3568628, 0, 1, 1,
0.6573714, -1.316434, 1.582436, 0.3607843, 0, 1, 1,
0.6710917, 0.2825441, -0.7190336, 0.3686275, 0, 1, 1,
0.6717767, -0.0007882278, 2.1313, 0.372549, 0, 1, 1,
0.6884819, -1.301075, 0.9673883, 0.3803922, 0, 1, 1,
0.6899963, 1.093435, 2.115444, 0.3843137, 0, 1, 1,
0.6916885, -1.049792, 3.309189, 0.3921569, 0, 1, 1,
0.6925314, -0.06908325, 2.119094, 0.3960784, 0, 1, 1,
0.6933529, 0.2802805, -0.8261659, 0.4039216, 0, 1, 1,
0.6944778, -1.098579, 2.434161, 0.4117647, 0, 1, 1,
0.6950147, 0.2987206, 3.328907, 0.4156863, 0, 1, 1,
0.7007316, 1.372156, -0.1150912, 0.4235294, 0, 1, 1,
0.7115746, -0.8318884, 2.080103, 0.427451, 0, 1, 1,
0.7117512, -0.5747145, 2.409013, 0.4352941, 0, 1, 1,
0.7132983, -0.6780497, 1.666054, 0.4392157, 0, 1, 1,
0.7181493, 1.389504, -1.739214, 0.4470588, 0, 1, 1,
0.7184814, 2.098623, 0.2253067, 0.4509804, 0, 1, 1,
0.7264763, -0.4425334, 2.132875, 0.4588235, 0, 1, 1,
0.7269063, 1.717491, 0.7922645, 0.4627451, 0, 1, 1,
0.7394276, 1.795577, 0.2079336, 0.4705882, 0, 1, 1,
0.7458418, 1.387473, 0.6758914, 0.4745098, 0, 1, 1,
0.7459881, -0.2768564, 2.94439, 0.4823529, 0, 1, 1,
0.7514008, 0.8685614, 2.001037, 0.4862745, 0, 1, 1,
0.7549845, -0.6953705, 0.6268349, 0.4941176, 0, 1, 1,
0.757386, 0.1528508, 1.158278, 0.5019608, 0, 1, 1,
0.7581525, 0.5953636, -0.7124391, 0.5058824, 0, 1, 1,
0.7581941, -1.838525, 3.055423, 0.5137255, 0, 1, 1,
0.7600389, 0.9408033, 0.5348422, 0.5176471, 0, 1, 1,
0.764421, -0.530364, 3.962342, 0.5254902, 0, 1, 1,
0.770574, -0.3440902, 1.081544, 0.5294118, 0, 1, 1,
0.7730798, 1.820586, 3.210221, 0.5372549, 0, 1, 1,
0.7737147, 0.2061444, 0.5266477, 0.5411765, 0, 1, 1,
0.7749513, -0.1499322, 0.6017023, 0.5490196, 0, 1, 1,
0.7753333, 1.860556, -1.24743, 0.5529412, 0, 1, 1,
0.7767916, 0.07376169, 0.9640313, 0.5607843, 0, 1, 1,
0.7773836, 1.317597, -0.1368384, 0.5647059, 0, 1, 1,
0.7783721, -1.568262, 2.318174, 0.572549, 0, 1, 1,
0.7823087, 1.041257, 0.3569695, 0.5764706, 0, 1, 1,
0.7842609, 2.397671, -0.9572881, 0.5843138, 0, 1, 1,
0.7847674, -1.463848, 1.940554, 0.5882353, 0, 1, 1,
0.7855551, 1.065036, 2.744006, 0.5960785, 0, 1, 1,
0.7917822, 0.5121671, 2.239799, 0.6039216, 0, 1, 1,
0.7954515, 0.830936, 0.1501164, 0.6078432, 0, 1, 1,
0.7955667, 1.124901, -0.03425189, 0.6156863, 0, 1, 1,
0.8000799, 1.451478, -0.1042668, 0.6196079, 0, 1, 1,
0.8025001, 0.5275862, 2.544291, 0.627451, 0, 1, 1,
0.8072433, -1.095423, 2.698316, 0.6313726, 0, 1, 1,
0.8092902, -0.01771736, 0.3249407, 0.6392157, 0, 1, 1,
0.8181881, -1.437611, 1.620895, 0.6431373, 0, 1, 1,
0.8184627, 0.9897218, 0.5781861, 0.6509804, 0, 1, 1,
0.8187376, -0.8148106, 3.981185, 0.654902, 0, 1, 1,
0.8191256, -1.31207, 1.553593, 0.6627451, 0, 1, 1,
0.8235238, -0.02286897, 1.755653, 0.6666667, 0, 1, 1,
0.8252019, -2.050229, 3.392707, 0.6745098, 0, 1, 1,
0.8369377, 0.8449369, -1.197827, 0.6784314, 0, 1, 1,
0.8389184, 0.1305266, 3.193333, 0.6862745, 0, 1, 1,
0.8450546, -0.7274544, 2.823467, 0.6901961, 0, 1, 1,
0.8475714, 0.267726, 1.536513, 0.6980392, 0, 1, 1,
0.8513569, 1.363333, 1.857992, 0.7058824, 0, 1, 1,
0.8533514, 0.8566183, 0.839083, 0.7098039, 0, 1, 1,
0.8576012, -0.3385144, 0.4617502, 0.7176471, 0, 1, 1,
0.8610051, 0.3688343, 0.147491, 0.7215686, 0, 1, 1,
0.8640389, -0.1066044, 0.1858363, 0.7294118, 0, 1, 1,
0.8661912, -0.3725286, 3.460877, 0.7333333, 0, 1, 1,
0.8738242, 1.203963, -0.2388021, 0.7411765, 0, 1, 1,
0.8767157, 0.6603444, 1.229438, 0.7450981, 0, 1, 1,
0.8771043, 0.5343226, 1.854505, 0.7529412, 0, 1, 1,
0.8777376, -0.6628647, 1.960967, 0.7568628, 0, 1, 1,
0.8781479, -0.828207, 2.117575, 0.7647059, 0, 1, 1,
0.8791262, -0.5562867, 1.309853, 0.7686275, 0, 1, 1,
0.8823838, -0.4054462, 1.425467, 0.7764706, 0, 1, 1,
0.8906039, 0.5065157, 0.06093742, 0.7803922, 0, 1, 1,
0.8948145, 0.9661214, 0.4196841, 0.7882353, 0, 1, 1,
0.9011596, 1.051845, 1.729032, 0.7921569, 0, 1, 1,
0.9058365, -0.8670604, 3.82422, 0.8, 0, 1, 1,
0.9144961, 1.538915, 1.115163, 0.8078431, 0, 1, 1,
0.9173293, -1.110482, 4.298182, 0.8117647, 0, 1, 1,
0.9225712, -0.0982149, 1.850543, 0.8196079, 0, 1, 1,
0.9256548, -0.1490745, 2.821861, 0.8235294, 0, 1, 1,
0.9303837, 0.1099837, 0.5471666, 0.8313726, 0, 1, 1,
0.9381661, 0.1099606, 2.848084, 0.8352941, 0, 1, 1,
0.94445, -0.7234505, 0.5304047, 0.8431373, 0, 1, 1,
0.9447459, 0.1461087, 3.562366, 0.8470588, 0, 1, 1,
0.9455745, -0.3759504, 2.744996, 0.854902, 0, 1, 1,
0.9485836, 0.6531209, 2.687979, 0.8588235, 0, 1, 1,
0.951609, -1.955493, 2.486059, 0.8666667, 0, 1, 1,
0.9518492, 0.01880617, 0.6745051, 0.8705882, 0, 1, 1,
0.9542467, 0.07792877, 1.941092, 0.8784314, 0, 1, 1,
0.9705213, 0.5137269, 3.098919, 0.8823529, 0, 1, 1,
0.9714808, 0.2834474, 1.926537, 0.8901961, 0, 1, 1,
0.9737975, 1.16205, 0.09918541, 0.8941177, 0, 1, 1,
0.978562, 0.7475979, 0.9702113, 0.9019608, 0, 1, 1,
0.9797476, -0.1133282, 2.718014, 0.9098039, 0, 1, 1,
0.9802993, -1.800104, 3.22534, 0.9137255, 0, 1, 1,
0.9807046, -1.59089, 2.94199, 0.9215686, 0, 1, 1,
0.98211, 0.986294, 1.368688, 0.9254902, 0, 1, 1,
0.9825343, 0.3388696, 0.8279312, 0.9333333, 0, 1, 1,
0.9907658, 1.333512, 0.8272524, 0.9372549, 0, 1, 1,
0.9917601, 0.8709614, -0.1116068, 0.945098, 0, 1, 1,
0.996761, -0.05356602, -0.3025553, 0.9490196, 0, 1, 1,
0.9984942, 1.558184, 0.4175869, 0.9568627, 0, 1, 1,
1.006483, 0.6191024, 1.214675, 0.9607843, 0, 1, 1,
1.008727, -0.5470681, 1.785561, 0.9686275, 0, 1, 1,
1.009123, -0.753213, 1.651893, 0.972549, 0, 1, 1,
1.009359, -0.01696775, 1.86773, 0.9803922, 0, 1, 1,
1.01141, -2.144449, 3.172468, 0.9843137, 0, 1, 1,
1.013503, 0.6243609, 1.800507, 0.9921569, 0, 1, 1,
1.015644, 1.237313, 0.8415242, 0.9960784, 0, 1, 1,
1.018768, 0.9522726, 0.6303348, 1, 0, 0.9960784, 1,
1.020174, 0.4951569, 0.5818173, 1, 0, 0.9882353, 1,
1.02201, 0.6857959, 1.327914, 1, 0, 0.9843137, 1,
1.022679, -1.013974, 1.461207, 1, 0, 0.9764706, 1,
1.025342, 1.150492, -0.5426316, 1, 0, 0.972549, 1,
1.028062, -0.6247538, 1.527051, 1, 0, 0.9647059, 1,
1.029656, -0.9107647, 1.385574, 1, 0, 0.9607843, 1,
1.038653, 0.6220934, 1.127914, 1, 0, 0.9529412, 1,
1.041031, -0.382991, 1.945254, 1, 0, 0.9490196, 1,
1.041114, 0.8103898, 1.032663, 1, 0, 0.9411765, 1,
1.054408, -1.405378, 1.648468, 1, 0, 0.9372549, 1,
1.059305, -2.266826, 4.097672, 1, 0, 0.9294118, 1,
1.062043, -0.1125648, 0.6754482, 1, 0, 0.9254902, 1,
1.063336, -0.09856724, 1.540089, 1, 0, 0.9176471, 1,
1.063606, -0.8136895, 2.88899, 1, 0, 0.9137255, 1,
1.070127, -0.08486225, 1.625076, 1, 0, 0.9058824, 1,
1.07288, 0.8333362, 0.4196381, 1, 0, 0.9019608, 1,
1.073486, -0.4137409, 2.522354, 1, 0, 0.8941177, 1,
1.077322, -1.968371, 2.583088, 1, 0, 0.8862745, 1,
1.080448, -0.5375169, 0.7988621, 1, 0, 0.8823529, 1,
1.082211, 1.110784, 0.1994351, 1, 0, 0.8745098, 1,
1.083714, -0.3099878, 2.082043, 1, 0, 0.8705882, 1,
1.087395, 0.6239586, 1.913037, 1, 0, 0.8627451, 1,
1.093732, -2.365668, 1.02849, 1, 0, 0.8588235, 1,
1.095497, 0.4033149, 1.449938, 1, 0, 0.8509804, 1,
1.10676, -1.796816, 1.839453, 1, 0, 0.8470588, 1,
1.133856, 2.58641, 1.422831, 1, 0, 0.8392157, 1,
1.142602, 0.3970762, 0.9025922, 1, 0, 0.8352941, 1,
1.147794, 0.5798572, 1.012569, 1, 0, 0.827451, 1,
1.151622, 0.7372892, 1.024082, 1, 0, 0.8235294, 1,
1.154127, -0.1371558, 1.901368, 1, 0, 0.8156863, 1,
1.1559, -0.01308504, 0.2923498, 1, 0, 0.8117647, 1,
1.169745, -0.1348873, 1.260365, 1, 0, 0.8039216, 1,
1.169841, 0.3314032, 2.959422, 1, 0, 0.7960784, 1,
1.173338, 0.06430754, 1.120282, 1, 0, 0.7921569, 1,
1.174411, 0.9085373, 0.7087689, 1, 0, 0.7843137, 1,
1.182927, -0.1617959, 2.249583, 1, 0, 0.7803922, 1,
1.185082, 0.8537501, -0.191284, 1, 0, 0.772549, 1,
1.191482, -0.7525106, 2.126232, 1, 0, 0.7686275, 1,
1.192606, -0.03253475, 0.04179648, 1, 0, 0.7607843, 1,
1.196726, 0.2394575, -0.2619036, 1, 0, 0.7568628, 1,
1.198636, 0.08125407, -0.8648924, 1, 0, 0.7490196, 1,
1.202467, -0.2571379, 1.257551, 1, 0, 0.7450981, 1,
1.203981, 0.326134, 2.058946, 1, 0, 0.7372549, 1,
1.204755, 0.005266609, 1.017209, 1, 0, 0.7333333, 1,
1.213172, 0.01162967, 1.731637, 1, 0, 0.7254902, 1,
1.214493, 1.458039, 0.3085828, 1, 0, 0.7215686, 1,
1.216326, -0.5254579, 1.444584, 1, 0, 0.7137255, 1,
1.231703, -0.4741081, 0.05756776, 1, 0, 0.7098039, 1,
1.232498, -0.2685105, 0.1798815, 1, 0, 0.7019608, 1,
1.237505, -0.9294786, 2.904133, 1, 0, 0.6941177, 1,
1.240065, 1.529876, -0.1760957, 1, 0, 0.6901961, 1,
1.242833, -0.7332885, 2.563746, 1, 0, 0.682353, 1,
1.244805, 0.5381655, -0.1290188, 1, 0, 0.6784314, 1,
1.246476, 0.6378161, 2.005286, 1, 0, 0.6705883, 1,
1.249957, -1.618137, 4.27958, 1, 0, 0.6666667, 1,
1.253634, 0.6965706, 1.378019, 1, 0, 0.6588235, 1,
1.253806, -1.158504, 2.176337, 1, 0, 0.654902, 1,
1.262888, 0.6827492, 2.144513, 1, 0, 0.6470588, 1,
1.264994, -0.4558337, 2.459886, 1, 0, 0.6431373, 1,
1.268337, 0.8575547, 1.09252, 1, 0, 0.6352941, 1,
1.269283, -2.483438, 3.869183, 1, 0, 0.6313726, 1,
1.273614, -0.6737773, 3.037983, 1, 0, 0.6235294, 1,
1.279412, 0.4899359, 1.347111, 1, 0, 0.6196079, 1,
1.282307, 0.4515966, 0.6336138, 1, 0, 0.6117647, 1,
1.284621, -1.125729, -0.3012203, 1, 0, 0.6078432, 1,
1.292618, 1.182073, 1.815326, 1, 0, 0.6, 1,
1.296487, -2.06828, 2.822017, 1, 0, 0.5921569, 1,
1.305177, -1.621063, 2.084341, 1, 0, 0.5882353, 1,
1.305696, 0.6484271, 0.6858159, 1, 0, 0.5803922, 1,
1.31237, 0.1891009, 0.4609693, 1, 0, 0.5764706, 1,
1.321642, 0.4403368, -0.1577642, 1, 0, 0.5686275, 1,
1.331163, 0.7160575, 2.458522, 1, 0, 0.5647059, 1,
1.331257, 0.9197555, 1.74099, 1, 0, 0.5568628, 1,
1.335298, 0.3237155, 1.477682, 1, 0, 0.5529412, 1,
1.34142, 1.301249, 0.2761526, 1, 0, 0.5450981, 1,
1.345664, -0.68312, 0.1642568, 1, 0, 0.5411765, 1,
1.34667, -0.8950881, 1.447526, 1, 0, 0.5333334, 1,
1.355637, -0.1844022, 0.7882256, 1, 0, 0.5294118, 1,
1.378546, -0.1311218, 1.624057, 1, 0, 0.5215687, 1,
1.381637, -0.8788089, 2.691928, 1, 0, 0.5176471, 1,
1.381787, -1.057372, 1.29121, 1, 0, 0.509804, 1,
1.392402, 0.8118266, 1.503355, 1, 0, 0.5058824, 1,
1.400245, -2.575228, 1.495587, 1, 0, 0.4980392, 1,
1.403199, -1.025136, 1.672658, 1, 0, 0.4901961, 1,
1.405391, 1.224019, 1.259328, 1, 0, 0.4862745, 1,
1.408141, -0.8259138, -0.6722003, 1, 0, 0.4784314, 1,
1.438455, 0.607359, 2.529014, 1, 0, 0.4745098, 1,
1.445846, -0.3266196, 3.717689, 1, 0, 0.4666667, 1,
1.457911, 1.497551, 2.013612, 1, 0, 0.4627451, 1,
1.479068, 0.7651816, 2.49336, 1, 0, 0.454902, 1,
1.479079, 0.093913, 0.5550874, 1, 0, 0.4509804, 1,
1.481834, 0.08935876, 0.8525503, 1, 0, 0.4431373, 1,
1.494868, -1.172848, 4.146562, 1, 0, 0.4392157, 1,
1.497157, 0.7858103, 0.1165186, 1, 0, 0.4313726, 1,
1.51063, 0.380295, -0.3513148, 1, 0, 0.427451, 1,
1.512004, -0.1099248, 0.2487165, 1, 0, 0.4196078, 1,
1.51453, -0.3664246, 1.294063, 1, 0, 0.4156863, 1,
1.518141, -1.211526, 3.497268, 1, 0, 0.4078431, 1,
1.524342, -0.6793584, 2.385889, 1, 0, 0.4039216, 1,
1.530886, 0.9075763, 2.317792, 1, 0, 0.3960784, 1,
1.533698, 1.372866, -0.05226323, 1, 0, 0.3882353, 1,
1.548618, 0.9856029, 2.412332, 1, 0, 0.3843137, 1,
1.564475, 0.970161, -0.4681541, 1, 0, 0.3764706, 1,
1.5758, 0.8387327, 2.205495, 1, 0, 0.372549, 1,
1.579706, -0.07999795, 0.7387027, 1, 0, 0.3647059, 1,
1.612517, 0.2906565, 2.271643, 1, 0, 0.3607843, 1,
1.615042, 0.5420896, 2.001277, 1, 0, 0.3529412, 1,
1.627905, -0.254864, 1.164331, 1, 0, 0.3490196, 1,
1.628544, 1.115024, 1.459854, 1, 0, 0.3411765, 1,
1.653044, -0.3468477, 2.22435, 1, 0, 0.3372549, 1,
1.654023, -0.3371704, 0.6219764, 1, 0, 0.3294118, 1,
1.655717, -1.734316, 1.991677, 1, 0, 0.3254902, 1,
1.655852, -2.076456, 1.161585, 1, 0, 0.3176471, 1,
1.679473, 0.5815274, 1.028896, 1, 0, 0.3137255, 1,
1.680759, -0.04961467, 1.30601, 1, 0, 0.3058824, 1,
1.686427, 1.36909, 0.2339174, 1, 0, 0.2980392, 1,
1.690826, 0.1951111, -0.3630634, 1, 0, 0.2941177, 1,
1.701518, 1.174772, 1.147055, 1, 0, 0.2862745, 1,
1.708585, -0.8761293, 0.7134767, 1, 0, 0.282353, 1,
1.724731, -0.9244691, 1.591093, 1, 0, 0.2745098, 1,
1.728657, -0.5795265, 2.137577, 1, 0, 0.2705882, 1,
1.740511, -1.652521, 1.594865, 1, 0, 0.2627451, 1,
1.750214, 0.9742125, 1.954854, 1, 0, 0.2588235, 1,
1.757384, -2.222048, 2.53968, 1, 0, 0.2509804, 1,
1.768522, -1.733996, 3.70418, 1, 0, 0.2470588, 1,
1.793472, -0.9046392, 3.168205, 1, 0, 0.2392157, 1,
1.798267, -0.6024817, 3.21958, 1, 0, 0.2352941, 1,
1.812208, -0.3044224, 2.424241, 1, 0, 0.227451, 1,
1.828962, -1.074048, 1.176961, 1, 0, 0.2235294, 1,
1.83403, 1.06583, 0.9752012, 1, 0, 0.2156863, 1,
1.835027, 0.3656925, 1.248864, 1, 0, 0.2117647, 1,
1.844805, 1.235898, 0.6372989, 1, 0, 0.2039216, 1,
1.853631, 1.379097, 1.096812, 1, 0, 0.1960784, 1,
1.854524, -0.4579151, 1.137735, 1, 0, 0.1921569, 1,
1.857772, -1.763268, 1.448969, 1, 0, 0.1843137, 1,
1.872239, 0.7082974, 2.677469, 1, 0, 0.1803922, 1,
1.891218, -1.573702, 2.868328, 1, 0, 0.172549, 1,
1.896372, 0.01687268, 2.44875, 1, 0, 0.1686275, 1,
1.917288, -0.5687761, 1.029282, 1, 0, 0.1607843, 1,
1.972075, 0.9315257, 0.8567424, 1, 0, 0.1568628, 1,
1.987422, -1.638082, 1.996727, 1, 0, 0.1490196, 1,
2.031529, -0.7678497, 1.145417, 1, 0, 0.145098, 1,
2.051524, -0.48908, 2.350185, 1, 0, 0.1372549, 1,
2.059335, 0.326851, 0.1625349, 1, 0, 0.1333333, 1,
2.075979, -0.3372023, 3.395046, 1, 0, 0.1254902, 1,
2.088731, -0.3332422, 1.400377, 1, 0, 0.1215686, 1,
2.094451, 0.6540556, 2.088107, 1, 0, 0.1137255, 1,
2.113359, -0.7696511, 1.281271, 1, 0, 0.1098039, 1,
2.145649, -1.691176, 1.084257, 1, 0, 0.1019608, 1,
2.149593, -0.4452353, 1.736409, 1, 0, 0.09411765, 1,
2.1522, 1.434427, 0.4520174, 1, 0, 0.09019608, 1,
2.188024, -1.149999, 1.718684, 1, 0, 0.08235294, 1,
2.293349, 1.035329, 2.752236, 1, 0, 0.07843138, 1,
2.333784, -0.2938556, 2.270165, 1, 0, 0.07058824, 1,
2.358843, 0.1561861, 0.4544013, 1, 0, 0.06666667, 1,
2.378347, -1.004671, 1.809822, 1, 0, 0.05882353, 1,
2.435931, -0.8341908, 1.358451, 1, 0, 0.05490196, 1,
2.447913, 0.9459005, 1.966001, 1, 0, 0.04705882, 1,
2.619062, -0.1693528, -0.8673329, 1, 0, 0.04313726, 1,
2.654412, 0.3763586, 1.500093, 1, 0, 0.03529412, 1,
2.702306, 2.08346, 0.456277, 1, 0, 0.03137255, 1,
2.724186, -1.23647, 1.896741, 1, 0, 0.02352941, 1,
2.821496, -0.5703548, 1.213979, 1, 0, 0.01960784, 1,
2.899385, 0.3056262, 1.199231, 1, 0, 0.01176471, 1,
2.9738, -0.5678592, 0.4611266, 1, 0, 0.007843138, 1
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
0.07564247, -4.436624, -7.52707, 0, -0.5, 0.5, 0.5,
0.07564247, -4.436624, -7.52707, 1, -0.5, 0.5, 0.5,
0.07564247, -4.436624, -7.52707, 1, 1.5, 0.5, 0.5,
0.07564247, -4.436624, -7.52707, 0, 1.5, 0.5, 0.5
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
-3.80499, -0.2309015, -7.52707, 0, -0.5, 0.5, 0.5,
-3.80499, -0.2309015, -7.52707, 1, -0.5, 0.5, 0.5,
-3.80499, -0.2309015, -7.52707, 1, 1.5, 0.5, 0.5,
-3.80499, -0.2309015, -7.52707, 0, 1.5, 0.5, 0.5
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
-3.80499, -4.436624, -0.01420665, 0, -0.5, 0.5, 0.5,
-3.80499, -4.436624, -0.01420665, 1, -0.5, 0.5, 0.5,
-3.80499, -4.436624, -0.01420665, 1, 1.5, 0.5, 0.5,
-3.80499, -4.436624, -0.01420665, 0, 1.5, 0.5, 0.5
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
-2, -3.466072, -5.793332,
2, -3.466072, -5.793332,
-2, -3.466072, -5.793332,
-2, -3.627831, -6.082288,
-1, -3.466072, -5.793332,
-1, -3.627831, -6.082288,
0, -3.466072, -5.793332,
0, -3.627831, -6.082288,
1, -3.466072, -5.793332,
1, -3.627831, -6.082288,
2, -3.466072, -5.793332,
2, -3.627831, -6.082288
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
-2, -3.951348, -6.660201, 0, -0.5, 0.5, 0.5,
-2, -3.951348, -6.660201, 1, -0.5, 0.5, 0.5,
-2, -3.951348, -6.660201, 1, 1.5, 0.5, 0.5,
-2, -3.951348, -6.660201, 0, 1.5, 0.5, 0.5,
-1, -3.951348, -6.660201, 0, -0.5, 0.5, 0.5,
-1, -3.951348, -6.660201, 1, -0.5, 0.5, 0.5,
-1, -3.951348, -6.660201, 1, 1.5, 0.5, 0.5,
-1, -3.951348, -6.660201, 0, 1.5, 0.5, 0.5,
0, -3.951348, -6.660201, 0, -0.5, 0.5, 0.5,
0, -3.951348, -6.660201, 1, -0.5, 0.5, 0.5,
0, -3.951348, -6.660201, 1, 1.5, 0.5, 0.5,
0, -3.951348, -6.660201, 0, 1.5, 0.5, 0.5,
1, -3.951348, -6.660201, 0, -0.5, 0.5, 0.5,
1, -3.951348, -6.660201, 1, -0.5, 0.5, 0.5,
1, -3.951348, -6.660201, 1, 1.5, 0.5, 0.5,
1, -3.951348, -6.660201, 0, 1.5, 0.5, 0.5,
2, -3.951348, -6.660201, 0, -0.5, 0.5, 0.5,
2, -3.951348, -6.660201, 1, -0.5, 0.5, 0.5,
2, -3.951348, -6.660201, 1, 1.5, 0.5, 0.5,
2, -3.951348, -6.660201, 0, 1.5, 0.5, 0.5
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
-2.90946, -3, -5.793332,
-2.90946, 2, -5.793332,
-2.90946, -3, -5.793332,
-3.058715, -3, -6.082288,
-2.90946, -2, -5.793332,
-3.058715, -2, -6.082288,
-2.90946, -1, -5.793332,
-3.058715, -1, -6.082288,
-2.90946, 0, -5.793332,
-3.058715, 0, -6.082288,
-2.90946, 1, -5.793332,
-3.058715, 1, -6.082288,
-2.90946, 2, -5.793332,
-3.058715, 2, -6.082288
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
-3.357225, -3, -6.660201, 0, -0.5, 0.5, 0.5,
-3.357225, -3, -6.660201, 1, -0.5, 0.5, 0.5,
-3.357225, -3, -6.660201, 1, 1.5, 0.5, 0.5,
-3.357225, -3, -6.660201, 0, 1.5, 0.5, 0.5,
-3.357225, -2, -6.660201, 0, -0.5, 0.5, 0.5,
-3.357225, -2, -6.660201, 1, -0.5, 0.5, 0.5,
-3.357225, -2, -6.660201, 1, 1.5, 0.5, 0.5,
-3.357225, -2, -6.660201, 0, 1.5, 0.5, 0.5,
-3.357225, -1, -6.660201, 0, -0.5, 0.5, 0.5,
-3.357225, -1, -6.660201, 1, -0.5, 0.5, 0.5,
-3.357225, -1, -6.660201, 1, 1.5, 0.5, 0.5,
-3.357225, -1, -6.660201, 0, 1.5, 0.5, 0.5,
-3.357225, 0, -6.660201, 0, -0.5, 0.5, 0.5,
-3.357225, 0, -6.660201, 1, -0.5, 0.5, 0.5,
-3.357225, 0, -6.660201, 1, 1.5, 0.5, 0.5,
-3.357225, 0, -6.660201, 0, 1.5, 0.5, 0.5,
-3.357225, 1, -6.660201, 0, -0.5, 0.5, 0.5,
-3.357225, 1, -6.660201, 1, -0.5, 0.5, 0.5,
-3.357225, 1, -6.660201, 1, 1.5, 0.5, 0.5,
-3.357225, 1, -6.660201, 0, 1.5, 0.5, 0.5,
-3.357225, 2, -6.660201, 0, -0.5, 0.5, 0.5,
-3.357225, 2, -6.660201, 1, -0.5, 0.5, 0.5,
-3.357225, 2, -6.660201, 1, 1.5, 0.5, 0.5,
-3.357225, 2, -6.660201, 0, 1.5, 0.5, 0.5
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
-2.90946, -3.466072, -4,
-2.90946, -3.466072, 4,
-2.90946, -3.466072, -4,
-3.058715, -3.627831, -4,
-2.90946, -3.466072, -2,
-3.058715, -3.627831, -2,
-2.90946, -3.466072, 0,
-3.058715, -3.627831, 0,
-2.90946, -3.466072, 2,
-3.058715, -3.627831, 2,
-2.90946, -3.466072, 4,
-3.058715, -3.627831, 4
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
-3.357225, -3.951348, -4, 0, -0.5, 0.5, 0.5,
-3.357225, -3.951348, -4, 1, -0.5, 0.5, 0.5,
-3.357225, -3.951348, -4, 1, 1.5, 0.5, 0.5,
-3.357225, -3.951348, -4, 0, 1.5, 0.5, 0.5,
-3.357225, -3.951348, -2, 0, -0.5, 0.5, 0.5,
-3.357225, -3.951348, -2, 1, -0.5, 0.5, 0.5,
-3.357225, -3.951348, -2, 1, 1.5, 0.5, 0.5,
-3.357225, -3.951348, -2, 0, 1.5, 0.5, 0.5,
-3.357225, -3.951348, 0, 0, -0.5, 0.5, 0.5,
-3.357225, -3.951348, 0, 1, -0.5, 0.5, 0.5,
-3.357225, -3.951348, 0, 1, 1.5, 0.5, 0.5,
-3.357225, -3.951348, 0, 0, 1.5, 0.5, 0.5,
-3.357225, -3.951348, 2, 0, -0.5, 0.5, 0.5,
-3.357225, -3.951348, 2, 1, -0.5, 0.5, 0.5,
-3.357225, -3.951348, 2, 1, 1.5, 0.5, 0.5,
-3.357225, -3.951348, 2, 0, 1.5, 0.5, 0.5,
-3.357225, -3.951348, 4, 0, -0.5, 0.5, 0.5,
-3.357225, -3.951348, 4, 1, -0.5, 0.5, 0.5,
-3.357225, -3.951348, 4, 1, 1.5, 0.5, 0.5,
-3.357225, -3.951348, 4, 0, 1.5, 0.5, 0.5
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
-2.90946, -3.466072, -5.793332,
-2.90946, 3.004269, -5.793332,
-2.90946, -3.466072, 5.764919,
-2.90946, 3.004269, 5.764919,
-2.90946, -3.466072, -5.793332,
-2.90946, -3.466072, 5.764919,
-2.90946, 3.004269, -5.793332,
-2.90946, 3.004269, 5.764919,
-2.90946, -3.466072, -5.793332,
3.060745, -3.466072, -5.793332,
-2.90946, -3.466072, 5.764919,
3.060745, -3.466072, 5.764919,
-2.90946, 3.004269, -5.793332,
3.060745, 3.004269, -5.793332,
-2.90946, 3.004269, 5.764919,
3.060745, 3.004269, 5.764919,
3.060745, -3.466072, -5.793332,
3.060745, 3.004269, -5.793332,
3.060745, -3.466072, 5.764919,
3.060745, 3.004269, 5.764919,
3.060745, -3.466072, -5.793332,
3.060745, -3.466072, 5.764919,
3.060745, 3.004269, -5.793332,
3.060745, 3.004269, 5.764919
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
var radius = 7.758387;
var distance = 34.51794;
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
mvMatrix.translate( -0.07564247, 0.2309015, 0.01420665 );
mvMatrix.scale( 1.405064, 1.296457, 0.7257603 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.51794);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
torque<-read.table("torque.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-torque$V2
```

```
## Error in eval(expr, envir, enclos): object 'torque' not found
```

```r
y<-torque$V3
```

```
## Error in eval(expr, envir, enclos): object 'torque' not found
```

```r
z<-torque$V4
```

```
## Error in eval(expr, envir, enclos): object 'torque' not found
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
-2.822515, -1.339782, -1.441528, 0, 0, 1, 1, 1,
-2.794096, 2.527384, -1.645495, 1, 0, 0, 1, 1,
-2.544909, -1.227849, -2.208365, 1, 0, 0, 1, 1,
-2.51455, 0.8662359, -0.2525872, 1, 0, 0, 1, 1,
-2.491064, -1.880761, -4.180278, 1, 0, 0, 1, 1,
-2.461511, 0.005057482, -1.301186, 1, 0, 0, 1, 1,
-2.396137, -0.2286777, -1.089668, 0, 0, 0, 1, 1,
-2.381972, 0.6040141, -2.86913, 0, 0, 0, 1, 1,
-2.381372, -1.021197, -2.406247, 0, 0, 0, 1, 1,
-2.379313, -0.136625, -1.7886, 0, 0, 0, 1, 1,
-2.32098, -1.387651, -2.736187, 0, 0, 0, 1, 1,
-2.223813, 0.1516582, -1.18545, 0, 0, 0, 1, 1,
-2.22143, 0.4709516, -0.2534384, 0, 0, 0, 1, 1,
-2.180333, -1.323119, -1.963712, 1, 1, 1, 1, 1,
-2.124112, 0.4929667, -2.770838, 1, 1, 1, 1, 1,
-2.067727, 0.6166571, -0.6907986, 1, 1, 1, 1, 1,
-2.060107, 1.028072, -0.8335946, 1, 1, 1, 1, 1,
-2.051838, -0.5189779, -2.618329, 1, 1, 1, 1, 1,
-2.041749, 1.422356, -2.635123, 1, 1, 1, 1, 1,
-2.039063, 1.507393, -2.911046, 1, 1, 1, 1, 1,
-2.035275, -1.21885, -2.853119, 1, 1, 1, 1, 1,
-2.023834, -0.1942356, -0.8778358, 1, 1, 1, 1, 1,
-2.014535, 1.563074, -2.537985, 1, 1, 1, 1, 1,
-1.99712, 0.009697657, -1.201033, 1, 1, 1, 1, 1,
-1.970848, 0.710117, -1.601216, 1, 1, 1, 1, 1,
-1.968613, 0.1131432, -3.360096, 1, 1, 1, 1, 1,
-1.931631, -1.592579, -1.951897, 1, 1, 1, 1, 1,
-1.913477, -1.384619, -2.488284, 1, 1, 1, 1, 1,
-1.853889, -0.5312004, -3.359977, 0, 0, 1, 1, 1,
-1.837523, 0.3049939, -3.265937, 1, 0, 0, 1, 1,
-1.829115, -0.2336424, -2.115619, 1, 0, 0, 1, 1,
-1.796947, -1.383626, -1.242166, 1, 0, 0, 1, 1,
-1.790375, -1.630962, -3.813912, 1, 0, 0, 1, 1,
-1.787219, -0.5431029, -2.760291, 1, 0, 0, 1, 1,
-1.781073, -0.1446224, -1.646707, 0, 0, 0, 1, 1,
-1.778137, -0.04404404, -1.912841, 0, 0, 0, 1, 1,
-1.760045, 0.7944557, -0.2804917, 0, 0, 0, 1, 1,
-1.754377, -0.267293, -1.417959, 0, 0, 0, 1, 1,
-1.748281, 1.292597, -2.013018, 0, 0, 0, 1, 1,
-1.725044, -1.024756, -1.889629, 0, 0, 0, 1, 1,
-1.717077, 0.5385513, -1.145706, 0, 0, 0, 1, 1,
-1.715513, -1.388745, -1.325987, 1, 1, 1, 1, 1,
-1.713607, -0.3802623, -1.313605, 1, 1, 1, 1, 1,
-1.710143, -1.894257, -5.625008, 1, 1, 1, 1, 1,
-1.695139, -0.1905128, -3.162989, 1, 1, 1, 1, 1,
-1.67633, -0.2187561, -2.81759, 1, 1, 1, 1, 1,
-1.675581, -0.8005076, -1.317596, 1, 1, 1, 1, 1,
-1.670909, -1.02089, -1.7496, 1, 1, 1, 1, 1,
-1.669191, -1.339205, -2.029273, 1, 1, 1, 1, 1,
-1.668228, -0.4310485, -2.882142, 1, 1, 1, 1, 1,
-1.665534, 0.2715453, -1.026476, 1, 1, 1, 1, 1,
-1.665306, -0.4905617, -1.435322, 1, 1, 1, 1, 1,
-1.66453, -0.4692377, -1.858497, 1, 1, 1, 1, 1,
-1.639656, 0.2708568, -2.167036, 1, 1, 1, 1, 1,
-1.600996, -0.1625421, -4.306347, 1, 1, 1, 1, 1,
-1.588859, -0.3688163, -1.733589, 1, 1, 1, 1, 1,
-1.585043, -0.3602972, -2.219029, 0, 0, 1, 1, 1,
-1.580484, 0.1843129, -0.224558, 1, 0, 0, 1, 1,
-1.570033, -0.6353808, -3.040975, 1, 0, 0, 1, 1,
-1.54521, -0.1042736, -0.3293177, 1, 0, 0, 1, 1,
-1.533794, 0.3499513, -0.3260449, 1, 0, 0, 1, 1,
-1.517325, -0.7188171, -2.280181, 1, 0, 0, 1, 1,
-1.508789, -0.1836622, -0.8488648, 0, 0, 0, 1, 1,
-1.507762, 0.03464302, 0.4835152, 0, 0, 0, 1, 1,
-1.498537, -0.8497544, -1.860155, 0, 0, 0, 1, 1,
-1.498237, 0.1253172, -1.391445, 0, 0, 0, 1, 1,
-1.482919, 0.7521425, 0.3093245, 0, 0, 0, 1, 1,
-1.478346, 2.134816, -0.5198123, 0, 0, 0, 1, 1,
-1.467652, 0.5929877, -1.124224, 0, 0, 0, 1, 1,
-1.46368, -1.631528, -1.520059, 1, 1, 1, 1, 1,
-1.459237, -2.102297, -2.585165, 1, 1, 1, 1, 1,
-1.455627, -0.6656235, -2.365705, 1, 1, 1, 1, 1,
-1.452057, 0.8814266, -1.687975, 1, 1, 1, 1, 1,
-1.434609, -1.649847, -2.90919, 1, 1, 1, 1, 1,
-1.434135, 0.8422629, -1.273588, 1, 1, 1, 1, 1,
-1.42837, 0.8600395, -2.50906, 1, 1, 1, 1, 1,
-1.420134, 1.661027, -0.7236732, 1, 1, 1, 1, 1,
-1.417405, -0.7391446, -2.748899, 1, 1, 1, 1, 1,
-1.403211, -0.6451154, -1.065173, 1, 1, 1, 1, 1,
-1.400378, 0.01919852, -0.5969115, 1, 1, 1, 1, 1,
-1.381455, -0.4846053, -1.538743, 1, 1, 1, 1, 1,
-1.37782, -0.1946502, -2.574852, 1, 1, 1, 1, 1,
-1.374519, 2.603081, -0.4339342, 1, 1, 1, 1, 1,
-1.369229, 1.156697, -0.4712228, 1, 1, 1, 1, 1,
-1.368727, -0.05536291, -1.470206, 0, 0, 1, 1, 1,
-1.363325, 0.3228267, -0.9576908, 1, 0, 0, 1, 1,
-1.358003, 1.04797, -0.2653212, 1, 0, 0, 1, 1,
-1.357716, 1.029085, 0.6573133, 1, 0, 0, 1, 1,
-1.354688, -0.4924645, -2.223439, 1, 0, 0, 1, 1,
-1.352338, 1.48511, -1.053861, 1, 0, 0, 1, 1,
-1.351992, -2.324719, -1.585634, 0, 0, 0, 1, 1,
-1.327477, -0.3937055, -2.11373, 0, 0, 0, 1, 1,
-1.326984, -0.4091797, -3.121537, 0, 0, 0, 1, 1,
-1.320037, 0.09475647, -0.3876054, 0, 0, 0, 1, 1,
-1.31785, 0.3251197, -1.057546, 0, 0, 0, 1, 1,
-1.317742, 1.406868, -0.4856538, 0, 0, 0, 1, 1,
-1.311458, 1.459104, 0.4481208, 0, 0, 0, 1, 1,
-1.292165, 0.7978564, 0.3674212, 1, 1, 1, 1, 1,
-1.281882, 0.3031624, 0.297809, 1, 1, 1, 1, 1,
-1.27673, 0.5419585, 0.5683696, 1, 1, 1, 1, 1,
-1.270679, 0.949742, -1.972813, 1, 1, 1, 1, 1,
-1.265664, 0.5944887, -1.659803, 1, 1, 1, 1, 1,
-1.226487, -0.4538417, -1.559306, 1, 1, 1, 1, 1,
-1.223267, -0.5240716, -1.960824, 1, 1, 1, 1, 1,
-1.215011, 0.4309674, -1.183734, 1, 1, 1, 1, 1,
-1.209935, 1.960355, -1.26477, 1, 1, 1, 1, 1,
-1.208659, 1.041589, -0.9981681, 1, 1, 1, 1, 1,
-1.205022, 0.6218974, -1.55213, 1, 1, 1, 1, 1,
-1.197092, 0.1168827, -1.737731, 1, 1, 1, 1, 1,
-1.188474, -1.166172, -2.560279, 1, 1, 1, 1, 1,
-1.180116, 0.2492833, -0.6522762, 1, 1, 1, 1, 1,
-1.175079, 0.01190933, -0.905098, 1, 1, 1, 1, 1,
-1.168249, 0.1773992, -1.493282, 0, 0, 1, 1, 1,
-1.165593, 0.3500057, -1.013912, 1, 0, 0, 1, 1,
-1.152579, -0.2462693, -4.00117, 1, 0, 0, 1, 1,
-1.14923, 0.3596114, -1.581721, 1, 0, 0, 1, 1,
-1.149059, 0.4074995, -0.6886144, 1, 0, 0, 1, 1,
-1.14318, 0.1354354, -0.6275439, 1, 0, 0, 1, 1,
-1.140096, 0.3752845, -1.494115, 0, 0, 0, 1, 1,
-1.138296, -0.1560204, -2.09495, 0, 0, 0, 1, 1,
-1.134418, -0.0174772, -2.925477, 0, 0, 0, 1, 1,
-1.132735, 1.558856, 0.1857503, 0, 0, 0, 1, 1,
-1.131257, 0.9320474, -0.6614341, 0, 0, 0, 1, 1,
-1.121292, 0.9842003, -1.294622, 0, 0, 0, 1, 1,
-1.117398, -1.028575, -4.023449, 0, 0, 0, 1, 1,
-1.107335, 0.7781991, -0.7892517, 1, 1, 1, 1, 1,
-1.102921, 0.8693303, -0.2771201, 1, 1, 1, 1, 1,
-1.096712, -0.6652477, -3.778356, 1, 1, 1, 1, 1,
-1.094768, 0.8209986, 0.03576731, 1, 1, 1, 1, 1,
-1.090952, 0.377472, -0.1294169, 1, 1, 1, 1, 1,
-1.089419, 0.9926011, -2.459783, 1, 1, 1, 1, 1,
-1.088591, -0.001523816, -1.972434, 1, 1, 1, 1, 1,
-1.06984, -1.084731, -2.353834, 1, 1, 1, 1, 1,
-1.069233, 1.745806, -0.09839951, 1, 1, 1, 1, 1,
-1.067231, 0.535501, -1.568182, 1, 1, 1, 1, 1,
-1.058739, -3.028636, -2.089436, 1, 1, 1, 1, 1,
-1.057477, -0.8951166, -0.9894784, 1, 1, 1, 1, 1,
-1.053187, 1.233133, 0.2611977, 1, 1, 1, 1, 1,
-1.05174, 1.112509, 0.1637164, 1, 1, 1, 1, 1,
-1.050359, 2.577994, 0.2694641, 1, 1, 1, 1, 1,
-1.041418, -0.6833532, -4.231619, 0, 0, 1, 1, 1,
-1.038669, 1.184131, 0.01795281, 1, 0, 0, 1, 1,
-1.034388, -0.1796106, -0.5148106, 1, 0, 0, 1, 1,
-1.034189, 0.3676502, 0.1920501, 1, 0, 0, 1, 1,
-1.020615, -0.4969202, -3.694009, 1, 0, 0, 1, 1,
-1.013046, 0.3229885, -3.158679, 1, 0, 0, 1, 1,
-1.012494, 0.1580845, -2.229746, 0, 0, 0, 1, 1,
-1.011029, 0.05097124, -0.4990027, 0, 0, 0, 1, 1,
-1.008102, -0.6433561, -3.410918, 0, 0, 0, 1, 1,
-1.004939, -0.3502746, -3.69442, 0, 0, 0, 1, 1,
-1.002434, -0.02412411, -1.684017, 0, 0, 0, 1, 1,
-0.9948115, 0.7233669, -1.546799, 0, 0, 0, 1, 1,
-0.9936937, 0.4895217, -1.118833, 0, 0, 0, 1, 1,
-0.9833415, 2.230561, -1.419412, 1, 1, 1, 1, 1,
-0.9812449, -0.02536657, -3.292799, 1, 1, 1, 1, 1,
-0.9798358, -0.7280968, -2.356797, 1, 1, 1, 1, 1,
-0.9787463, 1.066096, -2.232805, 1, 1, 1, 1, 1,
-0.9769561, 2.202236, -0.4796319, 1, 1, 1, 1, 1,
-0.974575, -0.3079583, -1.142734, 1, 1, 1, 1, 1,
-0.9692236, 1.095289, 0.03279537, 1, 1, 1, 1, 1,
-0.9654478, 2.538496, -0.4044375, 1, 1, 1, 1, 1,
-0.9620532, -0.9262032, -3.392186, 1, 1, 1, 1, 1,
-0.9616343, 1.746458, -0.4613791, 1, 1, 1, 1, 1,
-0.9598143, -2.476933, -1.251002, 1, 1, 1, 1, 1,
-0.9558437, 1.668285, -1.801661, 1, 1, 1, 1, 1,
-0.9508191, 0.6749476, -0.4788004, 1, 1, 1, 1, 1,
-0.9494066, 0.02439481, -1.684467, 1, 1, 1, 1, 1,
-0.9493676, -1.079502, -1.512608, 1, 1, 1, 1, 1,
-0.9469631, 0.9559109, -2.423451, 0, 0, 1, 1, 1,
-0.9454833, -0.7666568, -3.420413, 1, 0, 0, 1, 1,
-0.9434569, -1.95463, -1.593307, 1, 0, 0, 1, 1,
-0.9337765, 0.9719473, -0.008773712, 1, 0, 0, 1, 1,
-0.9327909, 1.752568, 0.7537159, 1, 0, 0, 1, 1,
-0.9253739, 0.6444198, -2.874799, 1, 0, 0, 1, 1,
-0.9235891, 1.083338, -0.7527512, 0, 0, 0, 1, 1,
-0.9167603, -0.191958, -1.85181, 0, 0, 0, 1, 1,
-0.8971032, -0.54871, -1.309502, 0, 0, 0, 1, 1,
-0.8941693, -1.134752, -3.965827, 0, 0, 0, 1, 1,
-0.8805383, 0.4907892, -2.264886, 0, 0, 0, 1, 1,
-0.8796822, -0.6100893, -1.848861, 0, 0, 0, 1, 1,
-0.8772366, 0.382939, -1.432077, 0, 0, 0, 1, 1,
-0.8766109, 0.8659641, -1.045879, 1, 1, 1, 1, 1,
-0.8759508, 0.6069191, -1.431276, 1, 1, 1, 1, 1,
-0.8714384, -0.3446285, -2.903332, 1, 1, 1, 1, 1,
-0.8708202, 0.4420867, -0.9160743, 1, 1, 1, 1, 1,
-0.8706456, -2.243923, -3.558945, 1, 1, 1, 1, 1,
-0.8647198, 0.2231828, -0.9496543, 1, 1, 1, 1, 1,
-0.8549113, 1.130744, -0.6903811, 1, 1, 1, 1, 1,
-0.8542188, -0.03731772, -1.073153, 1, 1, 1, 1, 1,
-0.8509499, -1.614561, -1.060859, 1, 1, 1, 1, 1,
-0.8490639, 0.8894886, -0.5546532, 1, 1, 1, 1, 1,
-0.8424089, 1.529848, 1.055339, 1, 1, 1, 1, 1,
-0.8417922, 0.8830604, -0.8980532, 1, 1, 1, 1, 1,
-0.8394338, -0.4331056, -1.577598, 1, 1, 1, 1, 1,
-0.839403, 0.001529874, -2.315256, 1, 1, 1, 1, 1,
-0.8386995, -0.3326418, -1.793496, 1, 1, 1, 1, 1,
-0.8341506, 0.6312675, -1.336532, 0, 0, 1, 1, 1,
-0.8326985, 0.2810218, -2.380539, 1, 0, 0, 1, 1,
-0.8281121, 0.6332291, 0.01662012, 1, 0, 0, 1, 1,
-0.8185291, -1.599656, -2.545589, 1, 0, 0, 1, 1,
-0.8169382, 0.6017933, -0.6950039, 1, 0, 0, 1, 1,
-0.8101587, 0.02684591, -2.366236, 1, 0, 0, 1, 1,
-0.8050175, -0.04653913, -1.292169, 0, 0, 0, 1, 1,
-0.8034957, 0.02160934, -1.532966, 0, 0, 0, 1, 1,
-0.7922508, -0.8213713, -2.333171, 0, 0, 0, 1, 1,
-0.7895362, 0.2688442, -0.3726406, 0, 0, 0, 1, 1,
-0.785322, 1.682912, -0.8552484, 0, 0, 0, 1, 1,
-0.7837328, -0.7272072, -1.42489, 0, 0, 0, 1, 1,
-0.7798201, -0.1745297, -2.130853, 0, 0, 0, 1, 1,
-0.7792056, 0.8007374, 0.23463, 1, 1, 1, 1, 1,
-0.7771385, 0.3769042, -0.7539791, 1, 1, 1, 1, 1,
-0.7631327, 0.1992079, -2.585629, 1, 1, 1, 1, 1,
-0.7513388, 0.6504917, -3.162219, 1, 1, 1, 1, 1,
-0.7499814, 1.000666, -1.63889, 1, 1, 1, 1, 1,
-0.7464909, 0.9175965, -0.8689974, 1, 1, 1, 1, 1,
-0.7453869, -0.02610282, -2.689374, 1, 1, 1, 1, 1,
-0.7403467, -0.5141408, -0.9883748, 1, 1, 1, 1, 1,
-0.7402325, -1.338324, -0.8477805, 1, 1, 1, 1, 1,
-0.7400069, -2.537694, -2.563166, 1, 1, 1, 1, 1,
-0.7323461, -1.100796, -2.053431, 1, 1, 1, 1, 1,
-0.7270826, 0.6120052, -1.435538, 1, 1, 1, 1, 1,
-0.7240148, -2.690384, -4.495188, 1, 1, 1, 1, 1,
-0.7239507, 0.2592466, 0.592129, 1, 1, 1, 1, 1,
-0.70784, 0.5721398, -0.9804077, 1, 1, 1, 1, 1,
-0.7046191, 0.6370996, 0.4844391, 0, 0, 1, 1, 1,
-0.7045498, -0.3253399, -2.191752, 1, 0, 0, 1, 1,
-0.7039827, 0.4844979, 0.3880632, 1, 0, 0, 1, 1,
-0.7032045, -1.8312, -3.367501, 1, 0, 0, 1, 1,
-0.7017223, 2.156216, -1.840252, 1, 0, 0, 1, 1,
-0.7015718, -0.5109334, -3.374543, 1, 0, 0, 1, 1,
-0.6936361, 0.742015, -2.034835, 0, 0, 0, 1, 1,
-0.6931628, -1.681283, -2.348943, 0, 0, 0, 1, 1,
-0.6917551, -0.03558455, -1.668556, 0, 0, 0, 1, 1,
-0.6909224, -2.107673, -4.200708, 0, 0, 0, 1, 1,
-0.6855645, -0.0418169, -1.383335, 0, 0, 0, 1, 1,
-0.6841833, 1.798157, 0.06083371, 0, 0, 0, 1, 1,
-0.6839623, 0.1958311, 0.00406884, 0, 0, 0, 1, 1,
-0.6815294, -0.4468424, -2.193647, 1, 1, 1, 1, 1,
-0.6799233, -1.973946, -2.907884, 1, 1, 1, 1, 1,
-0.67555, 0.6896191, -1.231243, 1, 1, 1, 1, 1,
-0.6716603, 0.6078751, -1.556266, 1, 1, 1, 1, 1,
-0.6648262, 0.08083382, -0.7595382, 1, 1, 1, 1, 1,
-0.6619928, 0.1053177, -0.6981853, 1, 1, 1, 1, 1,
-0.6583444, -1.587508, -2.380074, 1, 1, 1, 1, 1,
-0.6465915, 0.1284063, -1.444289, 1, 1, 1, 1, 1,
-0.6381777, 1.367273, -1.28108, 1, 1, 1, 1, 1,
-0.6359186, -2.818355, -2.680876, 1, 1, 1, 1, 1,
-0.6299808, -0.2118024, -0.4683189, 1, 1, 1, 1, 1,
-0.6284555, 0.5238988, -1.061469, 1, 1, 1, 1, 1,
-0.6266461, 1.638269, -0.9719233, 1, 1, 1, 1, 1,
-0.6233766, 0.5095844, -2.23299, 1, 1, 1, 1, 1,
-0.6184163, 0.2405422, -3.026283, 1, 1, 1, 1, 1,
-0.6174485, 0.579816, 0.5480213, 0, 0, 1, 1, 1,
-0.6157963, 0.8632292, 1.069772, 1, 0, 0, 1, 1,
-0.6142723, -1.640202, -1.609643, 1, 0, 0, 1, 1,
-0.6129966, -0.8515072, -2.74276, 1, 0, 0, 1, 1,
-0.6127896, 0.1379102, 0.03720681, 1, 0, 0, 1, 1,
-0.6116215, 1.933823, 0.02042966, 1, 0, 0, 1, 1,
-0.6061931, -0.5065871, -1.659255, 0, 0, 0, 1, 1,
-0.6061041, 1.929533, 0.4018382, 0, 0, 0, 1, 1,
-0.6041915, -0.01823748, -1.837661, 0, 0, 0, 1, 1,
-0.5998131, -1.626119, -1.910681, 0, 0, 0, 1, 1,
-0.5823054, -0.5194994, -1.874126, 0, 0, 0, 1, 1,
-0.5744395, -0.262209, -0.6249087, 0, 0, 0, 1, 1,
-0.565731, 0.479251, -1.584714, 0, 0, 0, 1, 1,
-0.563149, 1.111725, -0.9847426, 1, 1, 1, 1, 1,
-0.5623776, 0.6017218, -0.2049994, 1, 1, 1, 1, 1,
-0.5571154, 1.245627, -0.3643799, 1, 1, 1, 1, 1,
-0.5563774, -1.107206, -3.701013, 1, 1, 1, 1, 1,
-0.5547951, 0.7190915, 0.204101, 1, 1, 1, 1, 1,
-0.5496685, -1.905819, -1.167278, 1, 1, 1, 1, 1,
-0.5453343, -1.074101, -2.900316, 1, 1, 1, 1, 1,
-0.5445778, -1.460665, -4.819623, 1, 1, 1, 1, 1,
-0.5370316, -1.065802, -1.90122, 1, 1, 1, 1, 1,
-0.5368379, 1.957376, -0.4086888, 1, 1, 1, 1, 1,
-0.5362096, 0.417715, -0.8664806, 1, 1, 1, 1, 1,
-0.5355713, 0.7519326, -1.2205, 1, 1, 1, 1, 1,
-0.5302177, 0.2929904, -0.7773607, 1, 1, 1, 1, 1,
-0.5289248, 0.3871195, 0.6081985, 1, 1, 1, 1, 1,
-0.5239536, -1.084632, -2.910945, 1, 1, 1, 1, 1,
-0.5223286, 0.6364449, 0.8596141, 0, 0, 1, 1, 1,
-0.5197859, -0.09315045, -2.469064, 1, 0, 0, 1, 1,
-0.5156056, 0.2322919, -0.8488032, 1, 0, 0, 1, 1,
-0.5133655, -0.1186108, -1.094321, 1, 0, 0, 1, 1,
-0.5122714, 0.7223235, -0.9602308, 1, 0, 0, 1, 1,
-0.5097155, 0.03354575, -3.558542, 1, 0, 0, 1, 1,
-0.5070854, -1.282275, -2.23398, 0, 0, 0, 1, 1,
-0.5000944, 0.5286168, -0.06506492, 0, 0, 0, 1, 1,
-0.4984802, -0.1410342, -1.180887, 0, 0, 0, 1, 1,
-0.4983768, 1.255622, 0.2141632, 0, 0, 0, 1, 1,
-0.493871, 1.549765, 0.2348217, 0, 0, 0, 1, 1,
-0.4920164, -0.6167077, -3.28983, 0, 0, 0, 1, 1,
-0.4881238, -0.7275025, -1.556122, 0, 0, 0, 1, 1,
-0.4863039, 0.4322882, 0.3006188, 1, 1, 1, 1, 1,
-0.4857435, 0.7181211, -2.621838, 1, 1, 1, 1, 1,
-0.4843664, -0.5017179, -1.999993, 1, 1, 1, 1, 1,
-0.4830412, 0.01062336, -2.446495, 1, 1, 1, 1, 1,
-0.4820722, 0.5880085, 1.835761, 1, 1, 1, 1, 1,
-0.4679791, 1.008312, -1.881339, 1, 1, 1, 1, 1,
-0.4653073, 0.5736024, -0.6946896, 1, 1, 1, 1, 1,
-0.4634483, -0.2694395, -2.560236, 1, 1, 1, 1, 1,
-0.4534422, -0.01571947, -0.5507354, 1, 1, 1, 1, 1,
-0.4510874, 1.862666, -1.100003, 1, 1, 1, 1, 1,
-0.4495889, -3.371844, -1.086278, 1, 1, 1, 1, 1,
-0.4488674, 1.012621, -2.113209, 1, 1, 1, 1, 1,
-0.4480228, -2.567218, -2.012183, 1, 1, 1, 1, 1,
-0.4473209, -0.272662, -1.422878, 1, 1, 1, 1, 1,
-0.4458204, -1.177522, -2.823483, 1, 1, 1, 1, 1,
-0.4429792, 0.6242989, -0.660892, 0, 0, 1, 1, 1,
-0.4421903, 2.1356, -0.4287379, 1, 0, 0, 1, 1,
-0.4347939, 0.9560405, -0.8288083, 1, 0, 0, 1, 1,
-0.4277686, 0.2743687, -1.921129, 1, 0, 0, 1, 1,
-0.4267376, -0.4933131, -2.459418, 1, 0, 0, 1, 1,
-0.4263425, -0.830024, -3.018478, 1, 0, 0, 1, 1,
-0.4256214, 1.387205, -1.114019, 0, 0, 0, 1, 1,
-0.4214948, 0.3642934, -1.270905, 0, 0, 0, 1, 1,
-0.4207709, 1.073283, -0.7167195, 0, 0, 0, 1, 1,
-0.4194855, -1.232322, -2.71609, 0, 0, 0, 1, 1,
-0.4157897, 1.522134, -1.91283, 0, 0, 0, 1, 1,
-0.4155578, 1.009987, -0.1828016, 0, 0, 0, 1, 1,
-0.4153025, -1.452312, -2.184301, 0, 0, 0, 1, 1,
-0.4146575, 0.3638056, -1.340766, 1, 1, 1, 1, 1,
-0.413565, 0.9701381, -0.2889343, 1, 1, 1, 1, 1,
-0.4115252, 0.06375286, -3.729926, 1, 1, 1, 1, 1,
-0.4113136, -0.1072322, -0.764695, 1, 1, 1, 1, 1,
-0.4106959, 0.3178878, -1.239042, 1, 1, 1, 1, 1,
-0.4092679, -0.6666908, -1.474348, 1, 1, 1, 1, 1,
-0.4091498, 0.2662661, -1.23056, 1, 1, 1, 1, 1,
-0.3999533, 0.2209765, -1.730652, 1, 1, 1, 1, 1,
-0.3900118, -0.1224317, -2.212636, 1, 1, 1, 1, 1,
-0.3876285, 0.8254954, -0.5469203, 1, 1, 1, 1, 1,
-0.3801705, 0.03972725, -1.1083, 1, 1, 1, 1, 1,
-0.3796627, 0.3688271, -0.9182952, 1, 1, 1, 1, 1,
-0.3727525, -0.925399, -1.222093, 1, 1, 1, 1, 1,
-0.3724737, 0.274079, -1.706849, 1, 1, 1, 1, 1,
-0.371808, -0.3898591, -2.329577, 1, 1, 1, 1, 1,
-0.3673069, 1.675402, -0.8166409, 0, 0, 1, 1, 1,
-0.3669936, 0.3570226, -0.1574945, 1, 0, 0, 1, 1,
-0.3640709, -0.631167, -3.055253, 1, 0, 0, 1, 1,
-0.3489576, -1.714218, -1.375874, 1, 0, 0, 1, 1,
-0.3483948, 1.132331, 0.4085331, 1, 0, 0, 1, 1,
-0.3462313, 0.04887215, -0.697222, 1, 0, 0, 1, 1,
-0.3460443, 0.3009864, -0.8754286, 0, 0, 0, 1, 1,
-0.3445369, -0.1677775, -3.175794, 0, 0, 0, 1, 1,
-0.3370995, 1.356143, -1.070962, 0, 0, 0, 1, 1,
-0.3355725, 0.05183077, -1.983838, 0, 0, 0, 1, 1,
-0.3323473, -0.806378, -3.843565, 0, 0, 0, 1, 1,
-0.3316442, -1.164802, -2.733868, 0, 0, 0, 1, 1,
-0.3298178, 0.4563502, 0.3630573, 0, 0, 0, 1, 1,
-0.3297777, -0.3522955, -1.565761, 1, 1, 1, 1, 1,
-0.3285918, -0.2719165, -2.180976, 1, 1, 1, 1, 1,
-0.3180645, -2.095675, -2.77108, 1, 1, 1, 1, 1,
-0.3163854, -0.3865375, -1.631769, 1, 1, 1, 1, 1,
-0.3163631, 1.512498, 1.211605, 1, 1, 1, 1, 1,
-0.3155695, -0.9513903, -1.92431, 1, 1, 1, 1, 1,
-0.3143548, 0.3453799, 0.2197364, 1, 1, 1, 1, 1,
-0.3129203, -1.242864, -1.639438, 1, 1, 1, 1, 1,
-0.3109286, -0.2856879, -2.428432, 1, 1, 1, 1, 1,
-0.3053819, -0.1518818, 1.272742, 1, 1, 1, 1, 1,
-0.3041292, -1.417314, -3.905431, 1, 1, 1, 1, 1,
-0.3029058, 2.625001, -0.8004396, 1, 1, 1, 1, 1,
-0.3003193, -0.957092, -2.017186, 1, 1, 1, 1, 1,
-0.2992012, 1.55691, 0.9242103, 1, 1, 1, 1, 1,
-0.2975807, -0.852869, -3.14911, 1, 1, 1, 1, 1,
-0.2961825, 0.46725, -1.339784, 0, 0, 1, 1, 1,
-0.2960205, -0.7628186, -3.544316, 1, 0, 0, 1, 1,
-0.2946852, 1.721239, -1.991997, 1, 0, 0, 1, 1,
-0.2925659, 1.274599, 0.9783155, 1, 0, 0, 1, 1,
-0.2921483, -1.484376, -3.611569, 1, 0, 0, 1, 1,
-0.2919734, -0.6290558, -2.40714, 1, 0, 0, 1, 1,
-0.2909913, 0.7535167, -0.2512299, 0, 0, 0, 1, 1,
-0.2908247, -0.1087413, -2.446075, 0, 0, 0, 1, 1,
-0.2900332, 1.227474, -0.7484637, 0, 0, 0, 1, 1,
-0.2896061, -1.840896, -4.459687, 0, 0, 0, 1, 1,
-0.2851143, -0.8671215, -4.101228, 0, 0, 0, 1, 1,
-0.283052, -0.2341233, -2.293462, 0, 0, 0, 1, 1,
-0.2783078, 0.5063114, -1.257705, 0, 0, 0, 1, 1,
-0.2782665, -0.3425724, -1.085316, 1, 1, 1, 1, 1,
-0.2782347, 0.6477253, 0.5507001, 1, 1, 1, 1, 1,
-0.2755921, -0.3838536, -2.415229, 1, 1, 1, 1, 1,
-0.2723977, 1.071931, 0.01959329, 1, 1, 1, 1, 1,
-0.2684453, -0.403799, -3.340694, 1, 1, 1, 1, 1,
-0.2671955, -1.290802, -4.845905, 1, 1, 1, 1, 1,
-0.2647217, 0.7179849, -0.5366922, 1, 1, 1, 1, 1,
-0.2622119, 0.406558, 0.4139476, 1, 1, 1, 1, 1,
-0.2615481, 0.01164536, -2.152306, 1, 1, 1, 1, 1,
-0.259675, -2.950557, -2.769105, 1, 1, 1, 1, 1,
-0.2590647, 1.054035, -1.407142, 1, 1, 1, 1, 1,
-0.2519689, 1.713647, -1.532819, 1, 1, 1, 1, 1,
-0.2491486, -2.513401, -3.213004, 1, 1, 1, 1, 1,
-0.2462516, -1.107482, -2.520672, 1, 1, 1, 1, 1,
-0.2413183, 0.1285618, -1.766635, 1, 1, 1, 1, 1,
-0.24041, -2.216563, -1.846093, 0, 0, 1, 1, 1,
-0.2386675, -0.8813416, -1.631423, 1, 0, 0, 1, 1,
-0.2374505, -0.01676042, -0.9253964, 1, 0, 0, 1, 1,
-0.2368081, -1.166002, -4.457698, 1, 0, 0, 1, 1,
-0.2323451, -0.2673519, -2.377374, 1, 0, 0, 1, 1,
-0.2291074, 0.6662515, 0.1801742, 1, 0, 0, 1, 1,
-0.2284992, 1.278619, -2.233933, 0, 0, 0, 1, 1,
-0.2230678, 2.223268, 0.8847181, 0, 0, 0, 1, 1,
-0.2162429, -0.5306846, -2.394505, 0, 0, 0, 1, 1,
-0.2151307, -1.015394, -3.300182, 0, 0, 0, 1, 1,
-0.2134441, -0.06116472, -3.743374, 0, 0, 0, 1, 1,
-0.2080577, 0.1162909, -1.557601, 0, 0, 0, 1, 1,
-0.2059912, -1.534154, -4.831146, 0, 0, 0, 1, 1,
-0.205636, -0.5046744, -2.381697, 1, 1, 1, 1, 1,
-0.1994466, 1.429086, -0.6824391, 1, 1, 1, 1, 1,
-0.1992423, 2.373956, -0.05755671, 1, 1, 1, 1, 1,
-0.194334, -0.07202519, -1.552329, 1, 1, 1, 1, 1,
-0.1939124, 1.525274, 0.7828046, 1, 1, 1, 1, 1,
-0.1923313, -0.5036444, -2.872379, 1, 1, 1, 1, 1,
-0.1920696, 0.3131159, -0.099214, 1, 1, 1, 1, 1,
-0.1918563, 0.7754984, 0.9155085, 1, 1, 1, 1, 1,
-0.184248, 1.35145, -0.3411244, 1, 1, 1, 1, 1,
-0.1754354, -1.402092, -3.637525, 1, 1, 1, 1, 1,
-0.1715429, -1.121775, -2.993794, 1, 1, 1, 1, 1,
-0.1675828, -0.4048696, -2.398632, 1, 1, 1, 1, 1,
-0.1661266, -0.01798117, -0.1667668, 1, 1, 1, 1, 1,
-0.1578754, -2.127693, -1.979206, 1, 1, 1, 1, 1,
-0.1577393, -0.06034866, -2.728024, 1, 1, 1, 1, 1,
-0.1545074, -0.7554975, -1.817287, 0, 0, 1, 1, 1,
-0.1510162, 0.02725157, -2.725917, 1, 0, 0, 1, 1,
-0.1407326, -0.1127359, -1.569262, 1, 0, 0, 1, 1,
-0.1404202, -1.084379, -3.277868, 1, 0, 0, 1, 1,
-0.1393565, 0.3573069, -0.5911514, 1, 0, 0, 1, 1,
-0.1379335, 0.7886572, -1.8656, 1, 0, 0, 1, 1,
-0.1340108, 0.2542488, -0.6487243, 0, 0, 0, 1, 1,
-0.1322501, 0.4990649, -1.279289, 0, 0, 0, 1, 1,
-0.1321744, -0.7074711, -0.9039968, 0, 0, 0, 1, 1,
-0.1277084, 0.1526156, -1.332383, 0, 0, 0, 1, 1,
-0.1268874, 0.2873355, -0.4974952, 0, 0, 0, 1, 1,
-0.1266803, -0.6264128, -2.597946, 0, 0, 0, 1, 1,
-0.1182711, 0.4646461, 1.614253, 0, 0, 0, 1, 1,
-0.1123632, -0.8810734, -1.617668, 1, 1, 1, 1, 1,
-0.1067636, -0.1904176, -0.4175021, 1, 1, 1, 1, 1,
-0.1027653, 1.306338, 0.6324063, 1, 1, 1, 1, 1,
-0.09049968, 0.6408533, -1.419665, 1, 1, 1, 1, 1,
-0.0884222, 0.9937766, 2.341449, 1, 1, 1, 1, 1,
-0.08789402, -0.7110198, -3.419532, 1, 1, 1, 1, 1,
-0.08396073, 0.03929162, -1.278647, 1, 1, 1, 1, 1,
-0.07825419, -1.429235, -1.010986, 1, 1, 1, 1, 1,
-0.07164852, 0.7834931, -1.169766, 1, 1, 1, 1, 1,
-0.06971629, -1.124063, -4.722928, 1, 1, 1, 1, 1,
-0.06953157, -0.7176907, -4.927924, 1, 1, 1, 1, 1,
-0.06799666, -1.622919, -1.081767, 1, 1, 1, 1, 1,
-0.06342848, 0.5089382, -1.319017, 1, 1, 1, 1, 1,
-0.05938469, 0.6285418, 0.9894316, 1, 1, 1, 1, 1,
-0.05654411, -0.1393979, -4.016969, 1, 1, 1, 1, 1,
-0.05170696, 0.0787091, -0.4156919, 0, 0, 1, 1, 1,
-0.05162773, 0.278223, 0.02984966, 1, 0, 0, 1, 1,
-0.04431742, -0.9309291, -3.143647, 1, 0, 0, 1, 1,
-0.04430593, 0.418525, -0.1229812, 1, 0, 0, 1, 1,
-0.04389263, -0.9170977, -3.520867, 1, 0, 0, 1, 1,
-0.03729833, -1.124682, -1.871588, 1, 0, 0, 1, 1,
-0.03664572, -0.09352645, -3.331077, 0, 0, 0, 1, 1,
-0.03517987, -0.8859659, -1.942822, 0, 0, 0, 1, 1,
-0.03181611, -0.8225952, -2.323942, 0, 0, 0, 1, 1,
-0.0284877, 0.3226806, -2.539835, 0, 0, 0, 1, 1,
-0.02497296, -0.4929044, -4.623169, 0, 0, 0, 1, 1,
-0.02146542, -0.7596838, -3.572654, 0, 0, 0, 1, 1,
-0.01896835, -1.136171, -3.300043, 0, 0, 0, 1, 1,
-0.01799494, -1.491876, -3.717403, 1, 1, 1, 1, 1,
-0.01762431, 0.442176, 0.2172446, 1, 1, 1, 1, 1,
-0.01662478, 2.097019, -0.4658961, 1, 1, 1, 1, 1,
-0.01647892, 0.624438, -0.3203268, 1, 1, 1, 1, 1,
-0.016352, -0.4306415, -1.832535, 1, 1, 1, 1, 1,
-0.01600075, 2.051486, 0.8758965, 1, 1, 1, 1, 1,
-0.01430318, 0.9794022, 0.4972476, 1, 1, 1, 1, 1,
-0.01396491, -1.226343, -3.947915, 1, 1, 1, 1, 1,
-0.01393142, 1.841385, 0.3137628, 1, 1, 1, 1, 1,
-0.0132088, 2.13325, -0.9992841, 1, 1, 1, 1, 1,
-0.00893709, 1.082461, 1.184232, 1, 1, 1, 1, 1,
-0.004909336, -0.02288325, -3.412786, 1, 1, 1, 1, 1,
-0.004780222, 0.3859449, -1.573208, 1, 1, 1, 1, 1,
-0.00475475, -0.8030256, -2.771355, 1, 1, 1, 1, 1,
-0.001085474, 0.6877708, 0.09535684, 1, 1, 1, 1, 1,
-0.0002895624, -0.03805017, -1.84688, 0, 0, 1, 1, 1,
-0.0002704773, -0.4238757, -1.928207, 1, 0, 0, 1, 1,
0.0009848862, -1.765047, 5.596595, 1, 0, 0, 1, 1,
0.002150899, 1.988402, -1.89923, 1, 0, 0, 1, 1,
0.002391283, -1.216073, 2.342602, 1, 0, 0, 1, 1,
0.002580756, 0.07377765, 0.3665692, 1, 0, 0, 1, 1,
0.01387942, 0.3854178, 0.6179192, 0, 0, 0, 1, 1,
0.01552853, -1.030664, 3.276026, 0, 0, 0, 1, 1,
0.01743161, 0.4223371, 1.003161, 0, 0, 0, 1, 1,
0.02102013, 0.4690376, -1.012002, 0, 0, 0, 1, 1,
0.02177905, 1.321295, 2.057623, 0, 0, 0, 1, 1,
0.02245932, -0.4671496, 1.712986, 0, 0, 0, 1, 1,
0.02348736, -0.1715427, 1.680265, 0, 0, 0, 1, 1,
0.02592254, -0.09909792, 2.189113, 1, 1, 1, 1, 1,
0.02636863, 1.92407, 0.9853675, 1, 1, 1, 1, 1,
0.02652686, 1.093492, 2.094854, 1, 1, 1, 1, 1,
0.02794666, 0.8746073, -0.167593, 1, 1, 1, 1, 1,
0.02796552, 1.124539, -1.220024, 1, 1, 1, 1, 1,
0.02798997, 0.07741225, -0.8370059, 1, 1, 1, 1, 1,
0.03453358, 1.152804, 0.4037246, 1, 1, 1, 1, 1,
0.03588061, 0.1273186, 0.03788023, 1, 1, 1, 1, 1,
0.03810132, 0.3923685, -0.2218845, 1, 1, 1, 1, 1,
0.03813224, 0.7143648, -0.3497656, 1, 1, 1, 1, 1,
0.03869091, 0.199921, -0.7143886, 1, 1, 1, 1, 1,
0.04138636, 1.908585, -1.261899, 1, 1, 1, 1, 1,
0.04229668, 0.5893633, -1.579881, 1, 1, 1, 1, 1,
0.04644159, 0.2083081, 1.200716, 1, 1, 1, 1, 1,
0.04849856, 0.8569425, -1.088042, 1, 1, 1, 1, 1,
0.0485691, -1.665596, 2.818299, 0, 0, 1, 1, 1,
0.04970485, -0.8961418, 2.896022, 1, 0, 0, 1, 1,
0.05220254, -1.371129, 1.456167, 1, 0, 0, 1, 1,
0.05601269, 1.432868, 0.9649555, 1, 0, 0, 1, 1,
0.05624293, 0.501663, 0.8237542, 1, 0, 0, 1, 1,
0.05662806, 1.089779, 0.5361186, 1, 0, 0, 1, 1,
0.05793181, 0.06339229, 1.275497, 0, 0, 0, 1, 1,
0.05876314, -0.07838224, 4.231257, 0, 0, 0, 1, 1,
0.05883346, 0.6907077, -0.09291812, 0, 0, 0, 1, 1,
0.05989431, -0.9533451, 4.344202, 0, 0, 0, 1, 1,
0.06021702, -0.4675873, 3.782677, 0, 0, 0, 1, 1,
0.06277352, 0.8200143, -1.154786, 0, 0, 0, 1, 1,
0.0641505, -2.173493, 1.779849, 0, 0, 0, 1, 1,
0.06876613, 1.016842, 0.5827535, 1, 1, 1, 1, 1,
0.07090192, 1.263583, 1.159331, 1, 1, 1, 1, 1,
0.07275583, 0.02977057, 0.4824754, 1, 1, 1, 1, 1,
0.07550847, 0.7736955, 1.065027, 1, 1, 1, 1, 1,
0.08459815, 0.3419656, 2.98551, 1, 1, 1, 1, 1,
0.08566848, 0.4708716, 1.571729, 1, 1, 1, 1, 1,
0.08636928, 0.03379162, 1.958622, 1, 1, 1, 1, 1,
0.09042253, -0.1476998, 4.933023, 1, 1, 1, 1, 1,
0.09070072, -2.222096, 3.425433, 1, 1, 1, 1, 1,
0.09375037, -1.25316, 4.91001, 1, 1, 1, 1, 1,
0.09572323, 0.07639056, 1.719261, 1, 1, 1, 1, 1,
0.09622782, -1.184252, 3.281845, 1, 1, 1, 1, 1,
0.09896631, 1.186857, 0.7159165, 1, 1, 1, 1, 1,
0.09896884, 1.118645, 0.5105499, 1, 1, 1, 1, 1,
0.1023802, 1.678446, -0.6606321, 1, 1, 1, 1, 1,
0.1074019, -1.350168, 1.330767, 0, 0, 1, 1, 1,
0.1129381, -1.956057, 2.380068, 1, 0, 0, 1, 1,
0.1143949, -0.9422222, 4.048867, 1, 0, 0, 1, 1,
0.1151225, -0.2513805, 4.301412, 1, 0, 0, 1, 1,
0.1245832, -0.3129901, 1.096623, 1, 0, 0, 1, 1,
0.1269172, 0.9298476, -0.6504841, 1, 0, 0, 1, 1,
0.1295176, 0.2899939, 0.46035, 0, 0, 0, 1, 1,
0.1344979, -0.7825207, 3.075344, 0, 0, 0, 1, 1,
0.1362066, 1.376689, 1.624458, 0, 0, 0, 1, 1,
0.1388967, -0.5858448, 3.240035, 0, 0, 0, 1, 1,
0.1395529, -0.6411469, 3.834383, 0, 0, 0, 1, 1,
0.1401796, -0.3368278, 4.787473, 0, 0, 0, 1, 1,
0.1417408, 1.20598, -0.3012206, 0, 0, 0, 1, 1,
0.1423031, -1.788585, 2.95895, 1, 1, 1, 1, 1,
0.1444584, -0.5941798, 1.807361, 1, 1, 1, 1, 1,
0.1605968, -1.868679, 3.247692, 1, 1, 1, 1, 1,
0.1667918, 1.04948, 0.3297876, 1, 1, 1, 1, 1,
0.1669747, -0.2307608, 4.313942, 1, 1, 1, 1, 1,
0.1676409, 0.817697, -2.441639, 1, 1, 1, 1, 1,
0.1693112, 1.275483, 0.9354609, 1, 1, 1, 1, 1,
0.1815217, -1.004158, 2.516216, 1, 1, 1, 1, 1,
0.1818348, -1.319756, 3.090986, 1, 1, 1, 1, 1,
0.1818491, -0.3982927, 3.038181, 1, 1, 1, 1, 1,
0.1818885, 1.024453, 1.213694, 1, 1, 1, 1, 1,
0.1885441, 0.2987721, 0.7554252, 1, 1, 1, 1, 1,
0.1905046, 1.381922, 0.2283189, 1, 1, 1, 1, 1,
0.1983579, 0.2958485, 1.105078, 1, 1, 1, 1, 1,
0.206089, 1.88318, -0.9576007, 1, 1, 1, 1, 1,
0.2071459, -0.2442153, 0.7101576, 0, 0, 1, 1, 1,
0.2079428, 0.7187828, -0.5329807, 1, 0, 0, 1, 1,
0.2083444, -0.2038743, 5.323704, 1, 0, 0, 1, 1,
0.2084747, 0.7841688, -0.863734, 1, 0, 0, 1, 1,
0.2091739, -0.2457329, 2.922322, 1, 0, 0, 1, 1,
0.2139482, 0.9301233, 0.2537047, 1, 0, 0, 1, 1,
0.2159384, -1.056816, 3.196576, 0, 0, 0, 1, 1,
0.2173498, -0.2036551, 1.717892, 0, 0, 0, 1, 1,
0.2189836, 0.0944343, 1.050409, 0, 0, 0, 1, 1,
0.2195555, 1.227991, -0.3976607, 0, 0, 0, 1, 1,
0.2259133, 0.7610016, 0.3970882, 0, 0, 0, 1, 1,
0.2365372, 0.2116241, 1.46395, 0, 0, 0, 1, 1,
0.2451297, 0.9465077, -0.4484082, 0, 0, 0, 1, 1,
0.246035, 0.7987602, -1.405856, 1, 1, 1, 1, 1,
0.2489889, 1.216689, 0.3259172, 1, 1, 1, 1, 1,
0.2490829, 1.021715, -1.627159, 1, 1, 1, 1, 1,
0.2508238, -1.279095, 3.649688, 1, 1, 1, 1, 1,
0.2526096, 0.668409, 0.3011859, 1, 1, 1, 1, 1,
0.253537, -0.2795655, 2.080712, 1, 1, 1, 1, 1,
0.2544732, 0.6066775, -0.06884694, 1, 1, 1, 1, 1,
0.2586816, 1.098163, 1.168261, 1, 1, 1, 1, 1,
0.2608515, -1.087618, 3.942871, 1, 1, 1, 1, 1,
0.2633059, 0.351046, 0.3008554, 1, 1, 1, 1, 1,
0.2647232, -0.1591574, 0.5822025, 1, 1, 1, 1, 1,
0.2726001, 1.534563, 0.6103712, 1, 1, 1, 1, 1,
0.2761523, -0.5782292, 1.093038, 1, 1, 1, 1, 1,
0.2782674, 0.6291134, -0.8656197, 1, 1, 1, 1, 1,
0.2792149, -0.8297327, 2.815228, 1, 1, 1, 1, 1,
0.2838715, 0.6328646, 0.7192205, 0, 0, 1, 1, 1,
0.2842515, 2.09919, -1.459531, 1, 0, 0, 1, 1,
0.2877205, -0.9801206, 1.002547, 1, 0, 0, 1, 1,
0.2882782, -0.2702953, 3.0296, 1, 0, 0, 1, 1,
0.2886846, 0.214285, 0.5582061, 1, 0, 0, 1, 1,
0.2899491, 2.910041, -0.2641158, 1, 0, 0, 1, 1,
0.2902493, -1.087316, 2.920748, 0, 0, 0, 1, 1,
0.2934144, 0.1979333, 2.702712, 0, 0, 0, 1, 1,
0.296093, 0.03928757, 1.167491, 0, 0, 0, 1, 1,
0.2961972, -1.193736, 4.052249, 0, 0, 0, 1, 1,
0.2964187, -1.584248, 2.674727, 0, 0, 0, 1, 1,
0.3031216, 0.7365683, 0.1589118, 0, 0, 0, 1, 1,
0.3039848, -0.1787416, 1.767493, 0, 0, 0, 1, 1,
0.3075371, -0.137554, 2.273919, 1, 1, 1, 1, 1,
0.3108993, -0.2023091, 1.880929, 1, 1, 1, 1, 1,
0.3119667, -1.8668, 4.375711, 1, 1, 1, 1, 1,
0.3163871, 0.5873719, 0.0674931, 1, 1, 1, 1, 1,
0.3164641, 0.5405853, 0.7437878, 1, 1, 1, 1, 1,
0.3173892, -2.230513, 4.27313, 1, 1, 1, 1, 1,
0.3204555, -0.02043478, 1.628349, 1, 1, 1, 1, 1,
0.3220797, -0.610868, 2.939492, 1, 1, 1, 1, 1,
0.3240306, -1.934134, 2.162646, 1, 1, 1, 1, 1,
0.3242157, 0.6212566, 0.4003029, 1, 1, 1, 1, 1,
0.3302634, -0.5305573, 1.694352, 1, 1, 1, 1, 1,
0.3304403, 0.5965902, 0.8635951, 1, 1, 1, 1, 1,
0.3324482, 1.640108, -0.3202685, 1, 1, 1, 1, 1,
0.3337403, 0.1592428, 0.2381722, 1, 1, 1, 1, 1,
0.3365474, -2.143566, 1.86617, 1, 1, 1, 1, 1,
0.3378019, -0.1408707, 2.999256, 0, 0, 1, 1, 1,
0.3400175, -1.34293, 4.15293, 1, 0, 0, 1, 1,
0.3438202, 0.6518446, 0.5562786, 1, 0, 0, 1, 1,
0.3448344, -0.01094137, 1.132229, 1, 0, 0, 1, 1,
0.3449483, 0.4920046, 2.507262, 1, 0, 0, 1, 1,
0.346285, -0.04601477, 3.158541, 1, 0, 0, 1, 1,
0.3476512, -0.4622119, 2.46264, 0, 0, 0, 1, 1,
0.3490374, 0.351162, 1.346037, 0, 0, 0, 1, 1,
0.3523094, -1.545918, 4.545385, 0, 0, 0, 1, 1,
0.3581421, -0.6496309, 2.476237, 0, 0, 0, 1, 1,
0.359893, 0.3208218, 2.178092, 0, 0, 0, 1, 1,
0.366975, -0.8127928, 2.87062, 0, 0, 0, 1, 1,
0.3683338, 1.619052, 0.06283519, 0, 0, 0, 1, 1,
0.3692268, -0.8082319, 2.421685, 1, 1, 1, 1, 1,
0.3750472, -1.352245, 3.820721, 1, 1, 1, 1, 1,
0.376266, 0.6281285, -0.05497942, 1, 1, 1, 1, 1,
0.3782936, -0.5008909, 2.062182, 1, 1, 1, 1, 1,
0.3800483, 0.05822825, 1.052888, 1, 1, 1, 1, 1,
0.380252, 0.7476274, 0.4977564, 1, 1, 1, 1, 1,
0.3816518, 0.9900035, -0.1138832, 1, 1, 1, 1, 1,
0.3843279, -0.945444, 3.51939, 1, 1, 1, 1, 1,
0.3871262, 0.6378775, -0.7418185, 1, 1, 1, 1, 1,
0.3917969, -1.318794, 3.423316, 1, 1, 1, 1, 1,
0.3927112, -0.8865482, 2.532194, 1, 1, 1, 1, 1,
0.3931595, 0.3836441, 0.8780717, 1, 1, 1, 1, 1,
0.3960634, -0.3567567, 2.955917, 1, 1, 1, 1, 1,
0.4034876, -0.03129027, 1.551425, 1, 1, 1, 1, 1,
0.4087405, 0.9073912, -0.5014622, 1, 1, 1, 1, 1,
0.4123579, 2.308065, 0.2923189, 0, 0, 1, 1, 1,
0.4157051, 0.0559425, 0.3311331, 1, 0, 0, 1, 1,
0.4198132, 0.3669717, 0.6908404, 1, 0, 0, 1, 1,
0.4203028, -0.5397226, 2.563603, 1, 0, 0, 1, 1,
0.4205362, -0.3191957, 3.622007, 1, 0, 0, 1, 1,
0.4230767, 1.50907, 1.196777, 1, 0, 0, 1, 1,
0.4267544, -0.9758366, 2.574993, 0, 0, 0, 1, 1,
0.4289759, 0.7291754, -0.7848315, 0, 0, 0, 1, 1,
0.4332451, 0.4102374, 0.8254355, 0, 0, 0, 1, 1,
0.433525, 1.10704, 0.8236049, 0, 0, 0, 1, 1,
0.434576, -1.583747, 2.580716, 0, 0, 0, 1, 1,
0.4399875, 0.003768107, 2.404124, 0, 0, 0, 1, 1,
0.4432918, -0.4896615, 2.457768, 0, 0, 0, 1, 1,
0.4441121, -0.262832, 3.164292, 1, 1, 1, 1, 1,
0.4489502, 0.9491827, -0.1793408, 1, 1, 1, 1, 1,
0.4524764, -0.1955863, 1.549253, 1, 1, 1, 1, 1,
0.4524808, -0.03138668, 1.96402, 1, 1, 1, 1, 1,
0.4528735, -1.39053, 2.257069, 1, 1, 1, 1, 1,
0.453908, 0.5306274, -0.02171703, 1, 1, 1, 1, 1,
0.4562549, -1.026549, 1.66537, 1, 1, 1, 1, 1,
0.4566848, -0.3520778, 2.525082, 1, 1, 1, 1, 1,
0.4650239, 0.5988614, 0.7259331, 1, 1, 1, 1, 1,
0.4659002, -0.1335349, 2.18803, 1, 1, 1, 1, 1,
0.4683311, -0.5421252, 3.904327, 1, 1, 1, 1, 1,
0.469641, -1.329758, 2.820522, 1, 1, 1, 1, 1,
0.4701129, 1.459886, 1.096082, 1, 1, 1, 1, 1,
0.4769625, -1.444942, 2.159795, 1, 1, 1, 1, 1,
0.4799472, 0.02646299, 1.859707, 1, 1, 1, 1, 1,
0.4827818, -1.527676, 3.460417, 0, 0, 1, 1, 1,
0.4828988, 1.081222, -1.383272, 1, 0, 0, 1, 1,
0.4851814, -0.02503463, 3.221117, 1, 0, 0, 1, 1,
0.493622, 0.2845005, 1.549791, 1, 0, 0, 1, 1,
0.494134, -0.4658377, 2.680877, 1, 0, 0, 1, 1,
0.5007249, -1.341072, 2.745646, 1, 0, 0, 1, 1,
0.5016112, 0.3939236, -1.177791, 0, 0, 0, 1, 1,
0.5117806, 0.6273541, 1.497001, 0, 0, 0, 1, 1,
0.5161411, 0.6717786, 1.235014, 0, 0, 0, 1, 1,
0.5168754, 0.2068569, 1.74681, 0, 0, 0, 1, 1,
0.5239779, 0.4804469, 0.5939713, 0, 0, 0, 1, 1,
0.5282887, -0.3090756, 0.8594681, 0, 0, 0, 1, 1,
0.5299959, 1.351034, 0.6534791, 0, 0, 0, 1, 1,
0.5309448, -0.8422356, 4.309645, 1, 1, 1, 1, 1,
0.5317823, 1.693981, 1.435491, 1, 1, 1, 1, 1,
0.5329887, -0.6163519, 1.554318, 1, 1, 1, 1, 1,
0.5364673, 0.1840562, 2.186287, 1, 1, 1, 1, 1,
0.539503, 1.681637, -0.7003522, 1, 1, 1, 1, 1,
0.543961, 0.2632285, -0.5858944, 1, 1, 1, 1, 1,
0.5503165, -0.6459997, 1.908093, 1, 1, 1, 1, 1,
0.5504826, 0.2165761, 3.589111, 1, 1, 1, 1, 1,
0.5542098, -0.6616218, 3.813511, 1, 1, 1, 1, 1,
0.5587321, -0.4399109, 1.230244, 1, 1, 1, 1, 1,
0.5591848, 1.303179, 0.7686682, 1, 1, 1, 1, 1,
0.5598592, 0.8766798, 1.942451, 1, 1, 1, 1, 1,
0.5659635, 0.1153781, 0.5946413, 1, 1, 1, 1, 1,
0.5677155, -1.248039, 3.916922, 1, 1, 1, 1, 1,
0.571408, -1.611216, 3.13884, 1, 1, 1, 1, 1,
0.57527, 0.1026384, 1.211701, 0, 0, 1, 1, 1,
0.575618, -0.1520279, 2.789948, 1, 0, 0, 1, 1,
0.5763823, 0.554369, 2.17428, 1, 0, 0, 1, 1,
0.5767485, -0.1357062, 1.816021, 1, 0, 0, 1, 1,
0.5839691, -0.3410957, 0.9788804, 1, 0, 0, 1, 1,
0.5852374, 0.8491322, 2.590561, 1, 0, 0, 1, 1,
0.5931813, 1.240914, 0.3284377, 0, 0, 0, 1, 1,
0.5934426, -0.4787841, -1.1701, 0, 0, 0, 1, 1,
0.5951784, 0.2414259, 1.159751, 0, 0, 0, 1, 1,
0.5952297, 0.3514895, 1.498977, 0, 0, 0, 1, 1,
0.5959962, -0.02525916, 1.3119, 0, 0, 0, 1, 1,
0.596424, 0.5909583, 1.228292, 0, 0, 0, 1, 1,
0.5993106, 1.641936, 2.194953, 0, 0, 0, 1, 1,
0.6011178, 0.8602946, -0.3452597, 1, 1, 1, 1, 1,
0.6045547, -0.2028659, 1.354529, 1, 1, 1, 1, 1,
0.6073543, -1.283871, 2.165574, 1, 1, 1, 1, 1,
0.6091256, -1.246472, 3.188558, 1, 1, 1, 1, 1,
0.6103855, -0.4625145, 2.994929, 1, 1, 1, 1, 1,
0.6154301, 0.5944933, -0.05928259, 1, 1, 1, 1, 1,
0.6209105, -0.8248482, 3.150425, 1, 1, 1, 1, 1,
0.6284805, 0.1275317, 1.183149, 1, 1, 1, 1, 1,
0.6352984, -0.3186156, 1.455788, 1, 1, 1, 1, 1,
0.6378489, 1.493302, 0.3352828, 1, 1, 1, 1, 1,
0.6438873, -0.6332866, 0.9700242, 1, 1, 1, 1, 1,
0.6458336, 0.2034291, 1.084394, 1, 1, 1, 1, 1,
0.6548356, 0.8431706, -0.4532763, 1, 1, 1, 1, 1,
0.6561331, 0.03477579, 0.4820209, 1, 1, 1, 1, 1,
0.6573714, -1.316434, 1.582436, 1, 1, 1, 1, 1,
0.6710917, 0.2825441, -0.7190336, 0, 0, 1, 1, 1,
0.6717767, -0.0007882278, 2.1313, 1, 0, 0, 1, 1,
0.6884819, -1.301075, 0.9673883, 1, 0, 0, 1, 1,
0.6899963, 1.093435, 2.115444, 1, 0, 0, 1, 1,
0.6916885, -1.049792, 3.309189, 1, 0, 0, 1, 1,
0.6925314, -0.06908325, 2.119094, 1, 0, 0, 1, 1,
0.6933529, 0.2802805, -0.8261659, 0, 0, 0, 1, 1,
0.6944778, -1.098579, 2.434161, 0, 0, 0, 1, 1,
0.6950147, 0.2987206, 3.328907, 0, 0, 0, 1, 1,
0.7007316, 1.372156, -0.1150912, 0, 0, 0, 1, 1,
0.7115746, -0.8318884, 2.080103, 0, 0, 0, 1, 1,
0.7117512, -0.5747145, 2.409013, 0, 0, 0, 1, 1,
0.7132983, -0.6780497, 1.666054, 0, 0, 0, 1, 1,
0.7181493, 1.389504, -1.739214, 1, 1, 1, 1, 1,
0.7184814, 2.098623, 0.2253067, 1, 1, 1, 1, 1,
0.7264763, -0.4425334, 2.132875, 1, 1, 1, 1, 1,
0.7269063, 1.717491, 0.7922645, 1, 1, 1, 1, 1,
0.7394276, 1.795577, 0.2079336, 1, 1, 1, 1, 1,
0.7458418, 1.387473, 0.6758914, 1, 1, 1, 1, 1,
0.7459881, -0.2768564, 2.94439, 1, 1, 1, 1, 1,
0.7514008, 0.8685614, 2.001037, 1, 1, 1, 1, 1,
0.7549845, -0.6953705, 0.6268349, 1, 1, 1, 1, 1,
0.757386, 0.1528508, 1.158278, 1, 1, 1, 1, 1,
0.7581525, 0.5953636, -0.7124391, 1, 1, 1, 1, 1,
0.7581941, -1.838525, 3.055423, 1, 1, 1, 1, 1,
0.7600389, 0.9408033, 0.5348422, 1, 1, 1, 1, 1,
0.764421, -0.530364, 3.962342, 1, 1, 1, 1, 1,
0.770574, -0.3440902, 1.081544, 1, 1, 1, 1, 1,
0.7730798, 1.820586, 3.210221, 0, 0, 1, 1, 1,
0.7737147, 0.2061444, 0.5266477, 1, 0, 0, 1, 1,
0.7749513, -0.1499322, 0.6017023, 1, 0, 0, 1, 1,
0.7753333, 1.860556, -1.24743, 1, 0, 0, 1, 1,
0.7767916, 0.07376169, 0.9640313, 1, 0, 0, 1, 1,
0.7773836, 1.317597, -0.1368384, 1, 0, 0, 1, 1,
0.7783721, -1.568262, 2.318174, 0, 0, 0, 1, 1,
0.7823087, 1.041257, 0.3569695, 0, 0, 0, 1, 1,
0.7842609, 2.397671, -0.9572881, 0, 0, 0, 1, 1,
0.7847674, -1.463848, 1.940554, 0, 0, 0, 1, 1,
0.7855551, 1.065036, 2.744006, 0, 0, 0, 1, 1,
0.7917822, 0.5121671, 2.239799, 0, 0, 0, 1, 1,
0.7954515, 0.830936, 0.1501164, 0, 0, 0, 1, 1,
0.7955667, 1.124901, -0.03425189, 1, 1, 1, 1, 1,
0.8000799, 1.451478, -0.1042668, 1, 1, 1, 1, 1,
0.8025001, 0.5275862, 2.544291, 1, 1, 1, 1, 1,
0.8072433, -1.095423, 2.698316, 1, 1, 1, 1, 1,
0.8092902, -0.01771736, 0.3249407, 1, 1, 1, 1, 1,
0.8181881, -1.437611, 1.620895, 1, 1, 1, 1, 1,
0.8184627, 0.9897218, 0.5781861, 1, 1, 1, 1, 1,
0.8187376, -0.8148106, 3.981185, 1, 1, 1, 1, 1,
0.8191256, -1.31207, 1.553593, 1, 1, 1, 1, 1,
0.8235238, -0.02286897, 1.755653, 1, 1, 1, 1, 1,
0.8252019, -2.050229, 3.392707, 1, 1, 1, 1, 1,
0.8369377, 0.8449369, -1.197827, 1, 1, 1, 1, 1,
0.8389184, 0.1305266, 3.193333, 1, 1, 1, 1, 1,
0.8450546, -0.7274544, 2.823467, 1, 1, 1, 1, 1,
0.8475714, 0.267726, 1.536513, 1, 1, 1, 1, 1,
0.8513569, 1.363333, 1.857992, 0, 0, 1, 1, 1,
0.8533514, 0.8566183, 0.839083, 1, 0, 0, 1, 1,
0.8576012, -0.3385144, 0.4617502, 1, 0, 0, 1, 1,
0.8610051, 0.3688343, 0.147491, 1, 0, 0, 1, 1,
0.8640389, -0.1066044, 0.1858363, 1, 0, 0, 1, 1,
0.8661912, -0.3725286, 3.460877, 1, 0, 0, 1, 1,
0.8738242, 1.203963, -0.2388021, 0, 0, 0, 1, 1,
0.8767157, 0.6603444, 1.229438, 0, 0, 0, 1, 1,
0.8771043, 0.5343226, 1.854505, 0, 0, 0, 1, 1,
0.8777376, -0.6628647, 1.960967, 0, 0, 0, 1, 1,
0.8781479, -0.828207, 2.117575, 0, 0, 0, 1, 1,
0.8791262, -0.5562867, 1.309853, 0, 0, 0, 1, 1,
0.8823838, -0.4054462, 1.425467, 0, 0, 0, 1, 1,
0.8906039, 0.5065157, 0.06093742, 1, 1, 1, 1, 1,
0.8948145, 0.9661214, 0.4196841, 1, 1, 1, 1, 1,
0.9011596, 1.051845, 1.729032, 1, 1, 1, 1, 1,
0.9058365, -0.8670604, 3.82422, 1, 1, 1, 1, 1,
0.9144961, 1.538915, 1.115163, 1, 1, 1, 1, 1,
0.9173293, -1.110482, 4.298182, 1, 1, 1, 1, 1,
0.9225712, -0.0982149, 1.850543, 1, 1, 1, 1, 1,
0.9256548, -0.1490745, 2.821861, 1, 1, 1, 1, 1,
0.9303837, 0.1099837, 0.5471666, 1, 1, 1, 1, 1,
0.9381661, 0.1099606, 2.848084, 1, 1, 1, 1, 1,
0.94445, -0.7234505, 0.5304047, 1, 1, 1, 1, 1,
0.9447459, 0.1461087, 3.562366, 1, 1, 1, 1, 1,
0.9455745, -0.3759504, 2.744996, 1, 1, 1, 1, 1,
0.9485836, 0.6531209, 2.687979, 1, 1, 1, 1, 1,
0.951609, -1.955493, 2.486059, 1, 1, 1, 1, 1,
0.9518492, 0.01880617, 0.6745051, 0, 0, 1, 1, 1,
0.9542467, 0.07792877, 1.941092, 1, 0, 0, 1, 1,
0.9705213, 0.5137269, 3.098919, 1, 0, 0, 1, 1,
0.9714808, 0.2834474, 1.926537, 1, 0, 0, 1, 1,
0.9737975, 1.16205, 0.09918541, 1, 0, 0, 1, 1,
0.978562, 0.7475979, 0.9702113, 1, 0, 0, 1, 1,
0.9797476, -0.1133282, 2.718014, 0, 0, 0, 1, 1,
0.9802993, -1.800104, 3.22534, 0, 0, 0, 1, 1,
0.9807046, -1.59089, 2.94199, 0, 0, 0, 1, 1,
0.98211, 0.986294, 1.368688, 0, 0, 0, 1, 1,
0.9825343, 0.3388696, 0.8279312, 0, 0, 0, 1, 1,
0.9907658, 1.333512, 0.8272524, 0, 0, 0, 1, 1,
0.9917601, 0.8709614, -0.1116068, 0, 0, 0, 1, 1,
0.996761, -0.05356602, -0.3025553, 1, 1, 1, 1, 1,
0.9984942, 1.558184, 0.4175869, 1, 1, 1, 1, 1,
1.006483, 0.6191024, 1.214675, 1, 1, 1, 1, 1,
1.008727, -0.5470681, 1.785561, 1, 1, 1, 1, 1,
1.009123, -0.753213, 1.651893, 1, 1, 1, 1, 1,
1.009359, -0.01696775, 1.86773, 1, 1, 1, 1, 1,
1.01141, -2.144449, 3.172468, 1, 1, 1, 1, 1,
1.013503, 0.6243609, 1.800507, 1, 1, 1, 1, 1,
1.015644, 1.237313, 0.8415242, 1, 1, 1, 1, 1,
1.018768, 0.9522726, 0.6303348, 1, 1, 1, 1, 1,
1.020174, 0.4951569, 0.5818173, 1, 1, 1, 1, 1,
1.02201, 0.6857959, 1.327914, 1, 1, 1, 1, 1,
1.022679, -1.013974, 1.461207, 1, 1, 1, 1, 1,
1.025342, 1.150492, -0.5426316, 1, 1, 1, 1, 1,
1.028062, -0.6247538, 1.527051, 1, 1, 1, 1, 1,
1.029656, -0.9107647, 1.385574, 0, 0, 1, 1, 1,
1.038653, 0.6220934, 1.127914, 1, 0, 0, 1, 1,
1.041031, -0.382991, 1.945254, 1, 0, 0, 1, 1,
1.041114, 0.8103898, 1.032663, 1, 0, 0, 1, 1,
1.054408, -1.405378, 1.648468, 1, 0, 0, 1, 1,
1.059305, -2.266826, 4.097672, 1, 0, 0, 1, 1,
1.062043, -0.1125648, 0.6754482, 0, 0, 0, 1, 1,
1.063336, -0.09856724, 1.540089, 0, 0, 0, 1, 1,
1.063606, -0.8136895, 2.88899, 0, 0, 0, 1, 1,
1.070127, -0.08486225, 1.625076, 0, 0, 0, 1, 1,
1.07288, 0.8333362, 0.4196381, 0, 0, 0, 1, 1,
1.073486, -0.4137409, 2.522354, 0, 0, 0, 1, 1,
1.077322, -1.968371, 2.583088, 0, 0, 0, 1, 1,
1.080448, -0.5375169, 0.7988621, 1, 1, 1, 1, 1,
1.082211, 1.110784, 0.1994351, 1, 1, 1, 1, 1,
1.083714, -0.3099878, 2.082043, 1, 1, 1, 1, 1,
1.087395, 0.6239586, 1.913037, 1, 1, 1, 1, 1,
1.093732, -2.365668, 1.02849, 1, 1, 1, 1, 1,
1.095497, 0.4033149, 1.449938, 1, 1, 1, 1, 1,
1.10676, -1.796816, 1.839453, 1, 1, 1, 1, 1,
1.133856, 2.58641, 1.422831, 1, 1, 1, 1, 1,
1.142602, 0.3970762, 0.9025922, 1, 1, 1, 1, 1,
1.147794, 0.5798572, 1.012569, 1, 1, 1, 1, 1,
1.151622, 0.7372892, 1.024082, 1, 1, 1, 1, 1,
1.154127, -0.1371558, 1.901368, 1, 1, 1, 1, 1,
1.1559, -0.01308504, 0.2923498, 1, 1, 1, 1, 1,
1.169745, -0.1348873, 1.260365, 1, 1, 1, 1, 1,
1.169841, 0.3314032, 2.959422, 1, 1, 1, 1, 1,
1.173338, 0.06430754, 1.120282, 0, 0, 1, 1, 1,
1.174411, 0.9085373, 0.7087689, 1, 0, 0, 1, 1,
1.182927, -0.1617959, 2.249583, 1, 0, 0, 1, 1,
1.185082, 0.8537501, -0.191284, 1, 0, 0, 1, 1,
1.191482, -0.7525106, 2.126232, 1, 0, 0, 1, 1,
1.192606, -0.03253475, 0.04179648, 1, 0, 0, 1, 1,
1.196726, 0.2394575, -0.2619036, 0, 0, 0, 1, 1,
1.198636, 0.08125407, -0.8648924, 0, 0, 0, 1, 1,
1.202467, -0.2571379, 1.257551, 0, 0, 0, 1, 1,
1.203981, 0.326134, 2.058946, 0, 0, 0, 1, 1,
1.204755, 0.005266609, 1.017209, 0, 0, 0, 1, 1,
1.213172, 0.01162967, 1.731637, 0, 0, 0, 1, 1,
1.214493, 1.458039, 0.3085828, 0, 0, 0, 1, 1,
1.216326, -0.5254579, 1.444584, 1, 1, 1, 1, 1,
1.231703, -0.4741081, 0.05756776, 1, 1, 1, 1, 1,
1.232498, -0.2685105, 0.1798815, 1, 1, 1, 1, 1,
1.237505, -0.9294786, 2.904133, 1, 1, 1, 1, 1,
1.240065, 1.529876, -0.1760957, 1, 1, 1, 1, 1,
1.242833, -0.7332885, 2.563746, 1, 1, 1, 1, 1,
1.244805, 0.5381655, -0.1290188, 1, 1, 1, 1, 1,
1.246476, 0.6378161, 2.005286, 1, 1, 1, 1, 1,
1.249957, -1.618137, 4.27958, 1, 1, 1, 1, 1,
1.253634, 0.6965706, 1.378019, 1, 1, 1, 1, 1,
1.253806, -1.158504, 2.176337, 1, 1, 1, 1, 1,
1.262888, 0.6827492, 2.144513, 1, 1, 1, 1, 1,
1.264994, -0.4558337, 2.459886, 1, 1, 1, 1, 1,
1.268337, 0.8575547, 1.09252, 1, 1, 1, 1, 1,
1.269283, -2.483438, 3.869183, 1, 1, 1, 1, 1,
1.273614, -0.6737773, 3.037983, 0, 0, 1, 1, 1,
1.279412, 0.4899359, 1.347111, 1, 0, 0, 1, 1,
1.282307, 0.4515966, 0.6336138, 1, 0, 0, 1, 1,
1.284621, -1.125729, -0.3012203, 1, 0, 0, 1, 1,
1.292618, 1.182073, 1.815326, 1, 0, 0, 1, 1,
1.296487, -2.06828, 2.822017, 1, 0, 0, 1, 1,
1.305177, -1.621063, 2.084341, 0, 0, 0, 1, 1,
1.305696, 0.6484271, 0.6858159, 0, 0, 0, 1, 1,
1.31237, 0.1891009, 0.4609693, 0, 0, 0, 1, 1,
1.321642, 0.4403368, -0.1577642, 0, 0, 0, 1, 1,
1.331163, 0.7160575, 2.458522, 0, 0, 0, 1, 1,
1.331257, 0.9197555, 1.74099, 0, 0, 0, 1, 1,
1.335298, 0.3237155, 1.477682, 0, 0, 0, 1, 1,
1.34142, 1.301249, 0.2761526, 1, 1, 1, 1, 1,
1.345664, -0.68312, 0.1642568, 1, 1, 1, 1, 1,
1.34667, -0.8950881, 1.447526, 1, 1, 1, 1, 1,
1.355637, -0.1844022, 0.7882256, 1, 1, 1, 1, 1,
1.378546, -0.1311218, 1.624057, 1, 1, 1, 1, 1,
1.381637, -0.8788089, 2.691928, 1, 1, 1, 1, 1,
1.381787, -1.057372, 1.29121, 1, 1, 1, 1, 1,
1.392402, 0.8118266, 1.503355, 1, 1, 1, 1, 1,
1.400245, -2.575228, 1.495587, 1, 1, 1, 1, 1,
1.403199, -1.025136, 1.672658, 1, 1, 1, 1, 1,
1.405391, 1.224019, 1.259328, 1, 1, 1, 1, 1,
1.408141, -0.8259138, -0.6722003, 1, 1, 1, 1, 1,
1.438455, 0.607359, 2.529014, 1, 1, 1, 1, 1,
1.445846, -0.3266196, 3.717689, 1, 1, 1, 1, 1,
1.457911, 1.497551, 2.013612, 1, 1, 1, 1, 1,
1.479068, 0.7651816, 2.49336, 0, 0, 1, 1, 1,
1.479079, 0.093913, 0.5550874, 1, 0, 0, 1, 1,
1.481834, 0.08935876, 0.8525503, 1, 0, 0, 1, 1,
1.494868, -1.172848, 4.146562, 1, 0, 0, 1, 1,
1.497157, 0.7858103, 0.1165186, 1, 0, 0, 1, 1,
1.51063, 0.380295, -0.3513148, 1, 0, 0, 1, 1,
1.512004, -0.1099248, 0.2487165, 0, 0, 0, 1, 1,
1.51453, -0.3664246, 1.294063, 0, 0, 0, 1, 1,
1.518141, -1.211526, 3.497268, 0, 0, 0, 1, 1,
1.524342, -0.6793584, 2.385889, 0, 0, 0, 1, 1,
1.530886, 0.9075763, 2.317792, 0, 0, 0, 1, 1,
1.533698, 1.372866, -0.05226323, 0, 0, 0, 1, 1,
1.548618, 0.9856029, 2.412332, 0, 0, 0, 1, 1,
1.564475, 0.970161, -0.4681541, 1, 1, 1, 1, 1,
1.5758, 0.8387327, 2.205495, 1, 1, 1, 1, 1,
1.579706, -0.07999795, 0.7387027, 1, 1, 1, 1, 1,
1.612517, 0.2906565, 2.271643, 1, 1, 1, 1, 1,
1.615042, 0.5420896, 2.001277, 1, 1, 1, 1, 1,
1.627905, -0.254864, 1.164331, 1, 1, 1, 1, 1,
1.628544, 1.115024, 1.459854, 1, 1, 1, 1, 1,
1.653044, -0.3468477, 2.22435, 1, 1, 1, 1, 1,
1.654023, -0.3371704, 0.6219764, 1, 1, 1, 1, 1,
1.655717, -1.734316, 1.991677, 1, 1, 1, 1, 1,
1.655852, -2.076456, 1.161585, 1, 1, 1, 1, 1,
1.679473, 0.5815274, 1.028896, 1, 1, 1, 1, 1,
1.680759, -0.04961467, 1.30601, 1, 1, 1, 1, 1,
1.686427, 1.36909, 0.2339174, 1, 1, 1, 1, 1,
1.690826, 0.1951111, -0.3630634, 1, 1, 1, 1, 1,
1.701518, 1.174772, 1.147055, 0, 0, 1, 1, 1,
1.708585, -0.8761293, 0.7134767, 1, 0, 0, 1, 1,
1.724731, -0.9244691, 1.591093, 1, 0, 0, 1, 1,
1.728657, -0.5795265, 2.137577, 1, 0, 0, 1, 1,
1.740511, -1.652521, 1.594865, 1, 0, 0, 1, 1,
1.750214, 0.9742125, 1.954854, 1, 0, 0, 1, 1,
1.757384, -2.222048, 2.53968, 0, 0, 0, 1, 1,
1.768522, -1.733996, 3.70418, 0, 0, 0, 1, 1,
1.793472, -0.9046392, 3.168205, 0, 0, 0, 1, 1,
1.798267, -0.6024817, 3.21958, 0, 0, 0, 1, 1,
1.812208, -0.3044224, 2.424241, 0, 0, 0, 1, 1,
1.828962, -1.074048, 1.176961, 0, 0, 0, 1, 1,
1.83403, 1.06583, 0.9752012, 0, 0, 0, 1, 1,
1.835027, 0.3656925, 1.248864, 1, 1, 1, 1, 1,
1.844805, 1.235898, 0.6372989, 1, 1, 1, 1, 1,
1.853631, 1.379097, 1.096812, 1, 1, 1, 1, 1,
1.854524, -0.4579151, 1.137735, 1, 1, 1, 1, 1,
1.857772, -1.763268, 1.448969, 1, 1, 1, 1, 1,
1.872239, 0.7082974, 2.677469, 1, 1, 1, 1, 1,
1.891218, -1.573702, 2.868328, 1, 1, 1, 1, 1,
1.896372, 0.01687268, 2.44875, 1, 1, 1, 1, 1,
1.917288, -0.5687761, 1.029282, 1, 1, 1, 1, 1,
1.972075, 0.9315257, 0.8567424, 1, 1, 1, 1, 1,
1.987422, -1.638082, 1.996727, 1, 1, 1, 1, 1,
2.031529, -0.7678497, 1.145417, 1, 1, 1, 1, 1,
2.051524, -0.48908, 2.350185, 1, 1, 1, 1, 1,
2.059335, 0.326851, 0.1625349, 1, 1, 1, 1, 1,
2.075979, -0.3372023, 3.395046, 1, 1, 1, 1, 1,
2.088731, -0.3332422, 1.400377, 0, 0, 1, 1, 1,
2.094451, 0.6540556, 2.088107, 1, 0, 0, 1, 1,
2.113359, -0.7696511, 1.281271, 1, 0, 0, 1, 1,
2.145649, -1.691176, 1.084257, 1, 0, 0, 1, 1,
2.149593, -0.4452353, 1.736409, 1, 0, 0, 1, 1,
2.1522, 1.434427, 0.4520174, 1, 0, 0, 1, 1,
2.188024, -1.149999, 1.718684, 0, 0, 0, 1, 1,
2.293349, 1.035329, 2.752236, 0, 0, 0, 1, 1,
2.333784, -0.2938556, 2.270165, 0, 0, 0, 1, 1,
2.358843, 0.1561861, 0.4544013, 0, 0, 0, 1, 1,
2.378347, -1.004671, 1.809822, 0, 0, 0, 1, 1,
2.435931, -0.8341908, 1.358451, 0, 0, 0, 1, 1,
2.447913, 0.9459005, 1.966001, 0, 0, 0, 1, 1,
2.619062, -0.1693528, -0.8673329, 1, 1, 1, 1, 1,
2.654412, 0.3763586, 1.500093, 1, 1, 1, 1, 1,
2.702306, 2.08346, 0.456277, 1, 1, 1, 1, 1,
2.724186, -1.23647, 1.896741, 1, 1, 1, 1, 1,
2.821496, -0.5703548, 1.213979, 1, 1, 1, 1, 1,
2.899385, 0.3056262, 1.199231, 1, 1, 1, 1, 1,
2.9738, -0.5678592, 0.4611266, 1, 1, 1, 1, 1
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
var radius = 9.592462;
var distance = 33.69312;
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
mvMatrix.translate( -0.07564247, 0.2309016, 0.01420665 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.69312);
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