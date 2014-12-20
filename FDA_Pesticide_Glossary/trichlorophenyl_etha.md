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
-2.924755, -0.555009, -3.094809, 1, 0, 0, 1,
-2.767169, -0.9143522, -1.187681, 1, 0.007843138, 0, 1,
-2.720321, -0.4689416, -1.3792, 1, 0.01176471, 0, 1,
-2.615323, 0.4880672, 0.6441247, 1, 0.01960784, 0, 1,
-2.59125, -0.3052572, -2.887306, 1, 0.02352941, 0, 1,
-2.55879, 0.04334845, -0.6660588, 1, 0.03137255, 0, 1,
-2.556734, -1.177184, -1.75382, 1, 0.03529412, 0, 1,
-2.436672, -0.03006095, -1.266255, 1, 0.04313726, 0, 1,
-2.248536, -0.2533507, -0.5894296, 1, 0.04705882, 0, 1,
-2.245893, -1.140727, -1.176383, 1, 0.05490196, 0, 1,
-2.244601, -1.818999, -2.893272, 1, 0.05882353, 0, 1,
-2.123482, 0.8529662, -0.9746487, 1, 0.06666667, 0, 1,
-2.118084, 0.6427971, 0.7836536, 1, 0.07058824, 0, 1,
-2.085944, -0.5188879, -1.084127, 1, 0.07843138, 0, 1,
-2.084579, -0.8640128, -1.987991, 1, 0.08235294, 0, 1,
-2.027254, 2.434834, -1.492555, 1, 0.09019608, 0, 1,
-2.001905, -0.08130564, -0.3389391, 1, 0.09411765, 0, 1,
-1.990634, 0.3995261, -2.965981, 1, 0.1019608, 0, 1,
-1.985153, -1.231971, -2.492474, 1, 0.1098039, 0, 1,
-1.980026, -0.3896348, -3.006729, 1, 0.1137255, 0, 1,
-1.938903, -0.08808258, -3.761156, 1, 0.1215686, 0, 1,
-1.920251, 0.9812863, -2.839913, 1, 0.1254902, 0, 1,
-1.918575, 0.0106137, -0.7392922, 1, 0.1333333, 0, 1,
-1.91743, -0.2550868, -1.559677, 1, 0.1372549, 0, 1,
-1.905682, -1.058276, -1.639441, 1, 0.145098, 0, 1,
-1.877989, 0.9543145, 0.3829249, 1, 0.1490196, 0, 1,
-1.874168, 0.1837222, -2.112847, 1, 0.1568628, 0, 1,
-1.869838, -0.09909721, -1.301008, 1, 0.1607843, 0, 1,
-1.838486, 0.9806072, -0.9320951, 1, 0.1686275, 0, 1,
-1.818098, 0.1099666, -1.721478, 1, 0.172549, 0, 1,
-1.807481, -1.549462, -3.82747, 1, 0.1803922, 0, 1,
-1.801728, -0.08199281, -1.103383, 1, 0.1843137, 0, 1,
-1.792729, 0.09250715, -2.973544, 1, 0.1921569, 0, 1,
-1.768923, -0.9921023, -1.567623, 1, 0.1960784, 0, 1,
-1.765181, -0.2286775, -1.570081, 1, 0.2039216, 0, 1,
-1.755052, 0.8699574, -1.48457, 1, 0.2117647, 0, 1,
-1.735112, 2.226537, 0.7124758, 1, 0.2156863, 0, 1,
-1.718111, 0.5863973, -2.473667, 1, 0.2235294, 0, 1,
-1.644249, 0.12578, -0.5671643, 1, 0.227451, 0, 1,
-1.632313, -0.7063736, 0.1545091, 1, 0.2352941, 0, 1,
-1.62139, 0.07130215, -1.828751, 1, 0.2392157, 0, 1,
-1.608839, 0.4752603, 0.08468661, 1, 0.2470588, 0, 1,
-1.606297, -1.693754, -1.597502, 1, 0.2509804, 0, 1,
-1.602946, 0.9509138, 0.01557517, 1, 0.2588235, 0, 1,
-1.598633, -0.2477379, -0.377752, 1, 0.2627451, 0, 1,
-1.5973, 0.2728295, -1.617227, 1, 0.2705882, 0, 1,
-1.596141, -1.641337, -3.638708, 1, 0.2745098, 0, 1,
-1.57764, -0.0784329, 0.4995027, 1, 0.282353, 0, 1,
-1.576999, -0.4204359, -0.5244746, 1, 0.2862745, 0, 1,
-1.574595, 2.935474, 0.6083519, 1, 0.2941177, 0, 1,
-1.5714, -2.343011, -1.139327, 1, 0.3019608, 0, 1,
-1.569143, -0.008034526, -2.477733, 1, 0.3058824, 0, 1,
-1.564094, 1.473252, -0.584402, 1, 0.3137255, 0, 1,
-1.537969, -0.6750224, -1.48079, 1, 0.3176471, 0, 1,
-1.526695, 0.2182917, -0.5618439, 1, 0.3254902, 0, 1,
-1.524128, -0.4759501, -3.784536, 1, 0.3294118, 0, 1,
-1.522776, 0.5680942, -0.6429732, 1, 0.3372549, 0, 1,
-1.517634, -0.152607, -0.2880818, 1, 0.3411765, 0, 1,
-1.494316, 0.3702607, -1.1294, 1, 0.3490196, 0, 1,
-1.493284, 0.01252638, -2.685559, 1, 0.3529412, 0, 1,
-1.490916, -0.2115425, -0.2725403, 1, 0.3607843, 0, 1,
-1.490257, -0.003373579, 1.210382, 1, 0.3647059, 0, 1,
-1.477705, -0.2398142, -1.308998, 1, 0.372549, 0, 1,
-1.464549, -1.251059, -0.9634005, 1, 0.3764706, 0, 1,
-1.461185, -0.3083825, -0.8190235, 1, 0.3843137, 0, 1,
-1.449919, -1.284625, -2.801223, 1, 0.3882353, 0, 1,
-1.432162, -1.601347, -0.9979759, 1, 0.3960784, 0, 1,
-1.432068, -0.2076052, -1.824734, 1, 0.4039216, 0, 1,
-1.425833, -0.0007438856, -0.4864659, 1, 0.4078431, 0, 1,
-1.422744, -2.536814, -2.236581, 1, 0.4156863, 0, 1,
-1.416121, -1.362443, -1.356651, 1, 0.4196078, 0, 1,
-1.413079, 0.5717577, -1.045054, 1, 0.427451, 0, 1,
-1.411465, -0.09688858, -1.321649, 1, 0.4313726, 0, 1,
-1.399982, -0.3781428, -1.462206, 1, 0.4392157, 0, 1,
-1.395272, 1.01707, -1.248949, 1, 0.4431373, 0, 1,
-1.380092, 0.7184038, 0.3683306, 1, 0.4509804, 0, 1,
-1.375105, -0.5258769, -2.141839, 1, 0.454902, 0, 1,
-1.373834, -1.608444, -3.013551, 1, 0.4627451, 0, 1,
-1.373568, 0.2503633, -1.091906, 1, 0.4666667, 0, 1,
-1.360116, 0.8713295, -0.6151839, 1, 0.4745098, 0, 1,
-1.359079, -0.05942051, -2.110999, 1, 0.4784314, 0, 1,
-1.349898, -1.285972, -2.724374, 1, 0.4862745, 0, 1,
-1.347117, 1.224611, -0.7957637, 1, 0.4901961, 0, 1,
-1.342022, -0.9055389, -2.669972, 1, 0.4980392, 0, 1,
-1.326891, 0.2426177, -1.553986, 1, 0.5058824, 0, 1,
-1.326041, -1.278584, -2.558032, 1, 0.509804, 0, 1,
-1.317745, -0.050143, -1.389514, 1, 0.5176471, 0, 1,
-1.298689, -1.033414, -3.062366, 1, 0.5215687, 0, 1,
-1.297946, -1.07574, -3.43991, 1, 0.5294118, 0, 1,
-1.294531, -1.868391, -3.799599, 1, 0.5333334, 0, 1,
-1.293402, 2.425171, -0.1146519, 1, 0.5411765, 0, 1,
-1.285867, -0.001000942, -1.289, 1, 0.5450981, 0, 1,
-1.272495, -0.4169241, -1.492487, 1, 0.5529412, 0, 1,
-1.270425, 1.111915, 1.402827, 1, 0.5568628, 0, 1,
-1.263327, 0.1149318, -2.184027, 1, 0.5647059, 0, 1,
-1.261619, -0.3178365, -0.837028, 1, 0.5686275, 0, 1,
-1.260694, -0.7491353, -3.09117, 1, 0.5764706, 0, 1,
-1.259661, 0.05847246, -1.536284, 1, 0.5803922, 0, 1,
-1.254402, 1.317776, 1.15301, 1, 0.5882353, 0, 1,
-1.246694, 2.178729, -2.475436, 1, 0.5921569, 0, 1,
-1.244043, -0.2425467, -0.04408778, 1, 0.6, 0, 1,
-1.237707, 1.780673, -2.47477, 1, 0.6078432, 0, 1,
-1.23019, -0.5328704, -1.24654, 1, 0.6117647, 0, 1,
-1.229328, 0.9432151, -0.6029826, 1, 0.6196079, 0, 1,
-1.225831, 0.7138121, -2.089927, 1, 0.6235294, 0, 1,
-1.225504, 2.357018, 0.5457723, 1, 0.6313726, 0, 1,
-1.21043, 0.4698242, -1.461686, 1, 0.6352941, 0, 1,
-1.208889, -1.283511, -2.339719, 1, 0.6431373, 0, 1,
-1.193211, -0.5376721, -0.9664509, 1, 0.6470588, 0, 1,
-1.191629, -0.9180278, -3.109442, 1, 0.654902, 0, 1,
-1.190107, -0.02480401, -1.1115, 1, 0.6588235, 0, 1,
-1.188121, 0.392318, 0.26824, 1, 0.6666667, 0, 1,
-1.188069, 0.7507417, -0.6606816, 1, 0.6705883, 0, 1,
-1.187678, -0.09658306, -0.5203386, 1, 0.6784314, 0, 1,
-1.183411, -1.713515, -2.321437, 1, 0.682353, 0, 1,
-1.183094, -0.3907104, -1.214801, 1, 0.6901961, 0, 1,
-1.182575, -1.432996, -2.731949, 1, 0.6941177, 0, 1,
-1.180367, 0.6286377, -1.550313, 1, 0.7019608, 0, 1,
-1.172144, 0.1007023, -1.275445, 1, 0.7098039, 0, 1,
-1.169527, 0.5342008, -1.774973, 1, 0.7137255, 0, 1,
-1.166358, 0.08421429, -0.3095314, 1, 0.7215686, 0, 1,
-1.166112, -0.3644971, -1.018299, 1, 0.7254902, 0, 1,
-1.163228, -1.533751, -1.936477, 1, 0.7333333, 0, 1,
-1.158621, 1.503158, -0.2943826, 1, 0.7372549, 0, 1,
-1.150841, -0.7020825, -3.426588, 1, 0.7450981, 0, 1,
-1.150681, 1.332371, -1.763963, 1, 0.7490196, 0, 1,
-1.141629, -0.4941596, -1.348047, 1, 0.7568628, 0, 1,
-1.128622, 0.4779254, -2.788631, 1, 0.7607843, 0, 1,
-1.128247, -1.181125, -2.576162, 1, 0.7686275, 0, 1,
-1.121769, 1.600867, -0.1380821, 1, 0.772549, 0, 1,
-1.116193, -1.091819, -1.940001, 1, 0.7803922, 0, 1,
-1.11487, -1.124578, -1.734421, 1, 0.7843137, 0, 1,
-1.112236, 2.225494, -1.530821, 1, 0.7921569, 0, 1,
-1.111678, 0.6258168, -0.3475394, 1, 0.7960784, 0, 1,
-1.105219, -0.8448336, -2.341671, 1, 0.8039216, 0, 1,
-1.102468, -0.8268966, -2.015159, 1, 0.8117647, 0, 1,
-1.09423, 0.503179, -1.434212, 1, 0.8156863, 0, 1,
-1.09045, 0.9917099, -0.5543967, 1, 0.8235294, 0, 1,
-1.086852, -1.448893, -0.6370146, 1, 0.827451, 0, 1,
-1.079642, 0.8761224, 0.01708646, 1, 0.8352941, 0, 1,
-1.079125, -1.017651, -3.068818, 1, 0.8392157, 0, 1,
-1.06938, 0.05227482, -1.605366, 1, 0.8470588, 0, 1,
-1.063474, -1.499264, -2.266531, 1, 0.8509804, 0, 1,
-1.062433, -0.4741133, -3.020928, 1, 0.8588235, 0, 1,
-1.0455, -1.286511, -2.222392, 1, 0.8627451, 0, 1,
-1.045043, -1.20512, -3.774451, 1, 0.8705882, 0, 1,
-1.044208, 0.2101903, -0.6421456, 1, 0.8745098, 0, 1,
-1.042713, -1.24889, -2.399691, 1, 0.8823529, 0, 1,
-1.041535, -0.7533927, -2.67383, 1, 0.8862745, 0, 1,
-1.031636, 1.244883, 0.6157783, 1, 0.8941177, 0, 1,
-1.029464, -1.164814, -2.840349, 1, 0.8980392, 0, 1,
-1.028772, 1.616543, -0.6353958, 1, 0.9058824, 0, 1,
-1.02757, -1.522985, -3.454868, 1, 0.9137255, 0, 1,
-1.022983, -1.196582, -1.50374, 1, 0.9176471, 0, 1,
-1.022552, 1.082375, -1.718968, 1, 0.9254902, 0, 1,
-1.022399, 0.4979673, -1.456108, 1, 0.9294118, 0, 1,
-1.019344, -0.3933616, -1.031849, 1, 0.9372549, 0, 1,
-1.017789, 0.6876974, 1.331637, 1, 0.9411765, 0, 1,
-1.01525, 0.7641604, -1.396523, 1, 0.9490196, 0, 1,
-1.0149, 1.732662, -0.4743834, 1, 0.9529412, 0, 1,
-1.010003, 0.301974, -1.554047, 1, 0.9607843, 0, 1,
-1.004603, 0.1641185, -2.857276, 1, 0.9647059, 0, 1,
-1.001312, -0.06544008, -2.682832, 1, 0.972549, 0, 1,
-1.001062, 0.4646159, -2.507822, 1, 0.9764706, 0, 1,
-0.995146, 0.5084144, -0.5534505, 1, 0.9843137, 0, 1,
-0.9937666, 0.6467131, -0.7658867, 1, 0.9882353, 0, 1,
-0.99234, 0.4146669, -3.407845, 1, 0.9960784, 0, 1,
-0.9880499, 0.678878, -1.841821, 0.9960784, 1, 0, 1,
-0.9849185, -0.05315641, -2.039033, 0.9921569, 1, 0, 1,
-0.9747329, -0.1556536, -1.853168, 0.9843137, 1, 0, 1,
-0.9712421, 0.3034975, -1.193759, 0.9803922, 1, 0, 1,
-0.9707415, 1.214024, 1.318533, 0.972549, 1, 0, 1,
-0.9649367, 0.5380973, -0.5620397, 0.9686275, 1, 0, 1,
-0.9642652, -0.4782747, -3.384839, 0.9607843, 1, 0, 1,
-0.9399983, 0.05299191, -1.822649, 0.9568627, 1, 0, 1,
-0.9376535, -0.4466755, -2.406549, 0.9490196, 1, 0, 1,
-0.9363121, -0.3369568, -0.7253129, 0.945098, 1, 0, 1,
-0.9339063, -0.2361917, -2.593811, 0.9372549, 1, 0, 1,
-0.9329216, 1.517241, -2.101328, 0.9333333, 1, 0, 1,
-0.9307641, -0.7703333, -2.16415, 0.9254902, 1, 0, 1,
-0.9298455, 0.4439496, -1.24268, 0.9215686, 1, 0, 1,
-0.9294461, -0.2119417, -0.3845484, 0.9137255, 1, 0, 1,
-0.9242824, 0.7481724, -1.066858, 0.9098039, 1, 0, 1,
-0.9231027, -0.03014225, -1.262061, 0.9019608, 1, 0, 1,
-0.9223631, 1.666968, -0.7802064, 0.8941177, 1, 0, 1,
-0.9194196, 1.059041, -2.434038, 0.8901961, 1, 0, 1,
-0.8871704, -1.023031, -4.034037, 0.8823529, 1, 0, 1,
-0.8822212, 1.225077, -0.5304458, 0.8784314, 1, 0, 1,
-0.8793392, -0.4626265, -0.7435455, 0.8705882, 1, 0, 1,
-0.8762266, 1.569669, 0.00707871, 0.8666667, 1, 0, 1,
-0.8653041, 0.3942043, -1.378638, 0.8588235, 1, 0, 1,
-0.8641654, 1.490083, 0.1355136, 0.854902, 1, 0, 1,
-0.8618793, 0.3865998, -2.168808, 0.8470588, 1, 0, 1,
-0.8575765, -0.9709532, -1.841271, 0.8431373, 1, 0, 1,
-0.8563234, 0.3323413, -1.488575, 0.8352941, 1, 0, 1,
-0.8537674, -0.8159148, -0.6351792, 0.8313726, 1, 0, 1,
-0.8457517, 0.2782204, -1.347772, 0.8235294, 1, 0, 1,
-0.8439804, 1.078931, -0.09562583, 0.8196079, 1, 0, 1,
-0.8385872, 0.3496045, 0.5955899, 0.8117647, 1, 0, 1,
-0.8360398, -1.383236, -0.3952257, 0.8078431, 1, 0, 1,
-0.8297728, 1.119149, -0.1474285, 0.8, 1, 0, 1,
-0.8228391, 1.710703, 0.6257191, 0.7921569, 1, 0, 1,
-0.8226899, -0.9670714, -1.864381, 0.7882353, 1, 0, 1,
-0.8207403, -0.1429273, -1.40659, 0.7803922, 1, 0, 1,
-0.8199109, -0.3392843, -2.022318, 0.7764706, 1, 0, 1,
-0.7920142, 0.1454539, 0.2418702, 0.7686275, 1, 0, 1,
-0.7887254, 1.247836, 0.4939305, 0.7647059, 1, 0, 1,
-0.7885251, -0.8897277, -1.761917, 0.7568628, 1, 0, 1,
-0.7680438, -0.5421243, -1.976984, 0.7529412, 1, 0, 1,
-0.756432, 1.221659, 0.444821, 0.7450981, 1, 0, 1,
-0.7483707, 0.397984, -3.304426, 0.7411765, 1, 0, 1,
-0.7416286, 0.05644746, -0.6759416, 0.7333333, 1, 0, 1,
-0.741224, 2.213418, -0.7237939, 0.7294118, 1, 0, 1,
-0.738051, -0.3321602, -2.209533, 0.7215686, 1, 0, 1,
-0.7374842, -1.231099, -3.131573, 0.7176471, 1, 0, 1,
-0.7318339, -0.2863351, -1.642778, 0.7098039, 1, 0, 1,
-0.7271695, -0.06898711, -2.103147, 0.7058824, 1, 0, 1,
-0.7226858, -1.065721, -1.639551, 0.6980392, 1, 0, 1,
-0.7191423, 0.2929795, -1.52579, 0.6901961, 1, 0, 1,
-0.7172665, -0.1663035, -2.971934, 0.6862745, 1, 0, 1,
-0.7145174, -2.148325, -2.220618, 0.6784314, 1, 0, 1,
-0.7102361, 0.4693992, -2.244012, 0.6745098, 1, 0, 1,
-0.7095736, 0.5588265, -2.644911, 0.6666667, 1, 0, 1,
-0.70885, 1.752125, -0.03172493, 0.6627451, 1, 0, 1,
-0.7055219, 0.1111599, -3.216497, 0.654902, 1, 0, 1,
-0.7011556, 0.1133436, -2.950004, 0.6509804, 1, 0, 1,
-0.7010545, -0.7515708, -3.822357, 0.6431373, 1, 0, 1,
-0.6945243, 2.959877, -0.3787902, 0.6392157, 1, 0, 1,
-0.6882476, 0.02665156, -2.074616, 0.6313726, 1, 0, 1,
-0.6859646, -0.2902014, -2.219345, 0.627451, 1, 0, 1,
-0.6763769, 0.7026502, -1.862401, 0.6196079, 1, 0, 1,
-0.6762738, -1.510467, -1.79862, 0.6156863, 1, 0, 1,
-0.6731213, 1.455702, -0.2697917, 0.6078432, 1, 0, 1,
-0.6677397, -1.771095, -2.989947, 0.6039216, 1, 0, 1,
-0.6666256, 2.395322, -0.9553407, 0.5960785, 1, 0, 1,
-0.6612672, 0.805952, 0.2193262, 0.5882353, 1, 0, 1,
-0.6595234, 0.1733056, -0.8042048, 0.5843138, 1, 0, 1,
-0.6475509, -0.3197948, -2.501772, 0.5764706, 1, 0, 1,
-0.647536, 0.1643638, -1.06826, 0.572549, 1, 0, 1,
-0.6454164, 1.993599, 0.2102017, 0.5647059, 1, 0, 1,
-0.6410455, 0.001044635, -2.595198, 0.5607843, 1, 0, 1,
-0.6404245, 0.6856502, -0.7377507, 0.5529412, 1, 0, 1,
-0.630286, -0.644049, -0.1257748, 0.5490196, 1, 0, 1,
-0.6293741, 0.1737747, -1.374443, 0.5411765, 1, 0, 1,
-0.6262106, -1.441658, -4.328398, 0.5372549, 1, 0, 1,
-0.6250033, 0.5283616, -1.354489, 0.5294118, 1, 0, 1,
-0.6241383, -2.914398, -2.065366, 0.5254902, 1, 0, 1,
-0.622314, 0.1533709, -0.3529647, 0.5176471, 1, 0, 1,
-0.6195766, -0.6005391, -0.1199554, 0.5137255, 1, 0, 1,
-0.6151587, -0.06020901, -2.659567, 0.5058824, 1, 0, 1,
-0.6074334, -1.431177, -3.402114, 0.5019608, 1, 0, 1,
-0.6044765, 0.2810395, -0.7815716, 0.4941176, 1, 0, 1,
-0.6019132, 0.542433, -2.444602, 0.4862745, 1, 0, 1,
-0.6007213, 0.5242884, -0.9607811, 0.4823529, 1, 0, 1,
-0.5965116, 1.72949, 0.1510384, 0.4745098, 1, 0, 1,
-0.5913399, 1.068664, -3.558909, 0.4705882, 1, 0, 1,
-0.5910794, -1.734812, -3.083469, 0.4627451, 1, 0, 1,
-0.5895275, -0.1849579, -2.684225, 0.4588235, 1, 0, 1,
-0.5882044, -1.935562, -2.825361, 0.4509804, 1, 0, 1,
-0.5866535, 0.4911276, 0.5760722, 0.4470588, 1, 0, 1,
-0.5863138, -1.670818, -3.131311, 0.4392157, 1, 0, 1,
-0.5772254, -2.38544, -2.63897, 0.4352941, 1, 0, 1,
-0.5653435, 0.7446314, -1.874968, 0.427451, 1, 0, 1,
-0.563114, 0.8892807, -1.254683, 0.4235294, 1, 0, 1,
-0.5610879, 0.741895, 0.3490958, 0.4156863, 1, 0, 1,
-0.5609858, 1.159344, -0.05519935, 0.4117647, 1, 0, 1,
-0.5477197, 0.7415358, -1.223861, 0.4039216, 1, 0, 1,
-0.5460436, 1.152223, 0.2724057, 0.3960784, 1, 0, 1,
-0.5435496, 0.6611024, -2.582236, 0.3921569, 1, 0, 1,
-0.5387704, 0.191687, -1.527584, 0.3843137, 1, 0, 1,
-0.538388, -0.1732133, -2.7663, 0.3803922, 1, 0, 1,
-0.5380331, 2.387412, 0.3736722, 0.372549, 1, 0, 1,
-0.5293429, 0.8066404, 1.313585, 0.3686275, 1, 0, 1,
-0.529034, 1.141668, -0.7616455, 0.3607843, 1, 0, 1,
-0.5278125, -0.216706, -2.134336, 0.3568628, 1, 0, 1,
-0.5201315, 1.175716, -2.340234, 0.3490196, 1, 0, 1,
-0.5182001, 0.270873, 0.90833, 0.345098, 1, 0, 1,
-0.5151265, -0.9137658, -3.65557, 0.3372549, 1, 0, 1,
-0.5142635, 0.1054945, -2.408702, 0.3333333, 1, 0, 1,
-0.5124058, 1.845006, 0.5150046, 0.3254902, 1, 0, 1,
-0.5100844, 1.759982, 0.5217247, 0.3215686, 1, 0, 1,
-0.5080609, -0.1096542, -1.270274, 0.3137255, 1, 0, 1,
-0.5026401, 1.217477, 0.1768775, 0.3098039, 1, 0, 1,
-0.501538, 0.4194202, -2.527575, 0.3019608, 1, 0, 1,
-0.4995779, -1.394214, -3.100433, 0.2941177, 1, 0, 1,
-0.4993869, -1.36447, -2.078848, 0.2901961, 1, 0, 1,
-0.4984361, 0.6981824, -1.331076, 0.282353, 1, 0, 1,
-0.4977437, 0.5927576, -0.4827102, 0.2784314, 1, 0, 1,
-0.4948224, 0.1084775, -0.4774936, 0.2705882, 1, 0, 1,
-0.4908779, 0.3723575, -2.868808, 0.2666667, 1, 0, 1,
-0.4850242, -0.904967, -5.581265, 0.2588235, 1, 0, 1,
-0.4849932, -0.4750684, -2.532209, 0.254902, 1, 0, 1,
-0.4848129, 0.6538055, -0.8858852, 0.2470588, 1, 0, 1,
-0.4843639, 0.5308442, -0.9590147, 0.2431373, 1, 0, 1,
-0.4842957, 0.9166457, -0.4477483, 0.2352941, 1, 0, 1,
-0.477393, 1.57771, 0.4498376, 0.2313726, 1, 0, 1,
-0.4758619, 1.237318, -1.832632, 0.2235294, 1, 0, 1,
-0.4709123, 1.145534, -1.636959, 0.2196078, 1, 0, 1,
-0.4701535, 1.411707, -0.5770758, 0.2117647, 1, 0, 1,
-0.4679032, -2.010518, -3.971848, 0.2078431, 1, 0, 1,
-0.4678291, -0.4586268, -1.713637, 0.2, 1, 0, 1,
-0.4663967, 0.8921383, -1.035854, 0.1921569, 1, 0, 1,
-0.4652742, 0.9556134, -1.813895, 0.1882353, 1, 0, 1,
-0.4630325, 0.3419215, -1.090821, 0.1803922, 1, 0, 1,
-0.4621494, -0.7030458, -2.908806, 0.1764706, 1, 0, 1,
-0.4616567, 0.489992, -0.2895277, 0.1686275, 1, 0, 1,
-0.4584717, 2.051989, 0.8873249, 0.1647059, 1, 0, 1,
-0.4578905, -0.1510076, -2.012589, 0.1568628, 1, 0, 1,
-0.4552132, -2.192981, -2.582546, 0.1529412, 1, 0, 1,
-0.4501882, 0.9899127, -1.327659, 0.145098, 1, 0, 1,
-0.446932, 1.045722, -1.298087, 0.1411765, 1, 0, 1,
-0.4468612, -0.7190458, -2.558816, 0.1333333, 1, 0, 1,
-0.4457567, -0.1920711, -3.443387, 0.1294118, 1, 0, 1,
-0.4322895, -1.124092, -4.048681, 0.1215686, 1, 0, 1,
-0.4318963, 0.02649741, 0.2412305, 0.1176471, 1, 0, 1,
-0.4290944, -2.67486, -3.853378, 0.1098039, 1, 0, 1,
-0.428692, 0.6210019, -2.168476, 0.1058824, 1, 0, 1,
-0.419041, 0.6212345, -0.7553066, 0.09803922, 1, 0, 1,
-0.4176049, -0.9411354, 0.9513015, 0.09019608, 1, 0, 1,
-0.4140867, -0.4806932, -1.515726, 0.08627451, 1, 0, 1,
-0.4106949, -0.5884215, -1.472454, 0.07843138, 1, 0, 1,
-0.4079439, 1.055435, -1.003657, 0.07450981, 1, 0, 1,
-0.4039648, 0.3468584, -0.03677363, 0.06666667, 1, 0, 1,
-0.4035386, 0.2496157, -1.667285, 0.0627451, 1, 0, 1,
-0.4032291, 2.449063, -0.009599307, 0.05490196, 1, 0, 1,
-0.4021457, -1.48592, -3.773339, 0.05098039, 1, 0, 1,
-0.4011225, 1.120102, -0.4795136, 0.04313726, 1, 0, 1,
-0.3941658, 1.595874, -0.9682575, 0.03921569, 1, 0, 1,
-0.3815666, 0.5117359, -0.4593858, 0.03137255, 1, 0, 1,
-0.3796038, -0.1456336, -0.7475398, 0.02745098, 1, 0, 1,
-0.3785837, -1.664997, -3.801422, 0.01960784, 1, 0, 1,
-0.3773302, 0.2162795, -2.037732, 0.01568628, 1, 0, 1,
-0.3720436, -1.400616, -3.281555, 0.007843138, 1, 0, 1,
-0.3696913, -1.17415, -3.85906, 0.003921569, 1, 0, 1,
-0.3658616, 0.7276456, -0.5073767, 0, 1, 0.003921569, 1,
-0.3640401, 0.7751771, -1.103911, 0, 1, 0.01176471, 1,
-0.3624628, -1.892246, -3.132575, 0, 1, 0.01568628, 1,
-0.3593996, -0.6012732, -4.533231, 0, 1, 0.02352941, 1,
-0.3571309, -0.03295628, -2.435691, 0, 1, 0.02745098, 1,
-0.3535008, 0.365214, -1.180389, 0, 1, 0.03529412, 1,
-0.3469216, -0.06932762, -2.057978, 0, 1, 0.03921569, 1,
-0.3466224, 0.5544053, -0.4766102, 0, 1, 0.04705882, 1,
-0.3453872, 1.236682, 0.3008691, 0, 1, 0.05098039, 1,
-0.3381643, 2.002959, -0.3048698, 0, 1, 0.05882353, 1,
-0.3319441, -0.7916316, -1.394851, 0, 1, 0.0627451, 1,
-0.3315023, 0.1774692, -1.862213, 0, 1, 0.07058824, 1,
-0.3281595, 0.6538212, 1.700075, 0, 1, 0.07450981, 1,
-0.3174771, 0.5246681, -0.9532336, 0, 1, 0.08235294, 1,
-0.3174181, 0.3225617, -0.7553785, 0, 1, 0.08627451, 1,
-0.3171043, 0.2274662, -0.05903914, 0, 1, 0.09411765, 1,
-0.3167129, -0.7880493, -2.083672, 0, 1, 0.1019608, 1,
-0.3136554, 0.718185, 0.7582933, 0, 1, 0.1058824, 1,
-0.3097304, 1.661113, 0.6414124, 0, 1, 0.1137255, 1,
-0.3084336, 0.4861348, -2.656626, 0, 1, 0.1176471, 1,
-0.3047517, 0.374887, -0.3288434, 0, 1, 0.1254902, 1,
-0.3017386, -0.7086173, -3.373633, 0, 1, 0.1294118, 1,
-0.3004932, 0.3461298, 0.539817, 0, 1, 0.1372549, 1,
-0.3004621, -2.245071, -3.647862, 0, 1, 0.1411765, 1,
-0.299226, 0.9663681, 0.6988961, 0, 1, 0.1490196, 1,
-0.2945577, -0.156167, -0.8454507, 0, 1, 0.1529412, 1,
-0.2938994, 0.5911872, 2.195285, 0, 1, 0.1607843, 1,
-0.2918078, -0.3136771, -1.202495, 0, 1, 0.1647059, 1,
-0.2917729, 1.295255, -1.583689, 0, 1, 0.172549, 1,
-0.2916451, -1.258292, -4.221895, 0, 1, 0.1764706, 1,
-0.287804, 1.436323, 0.0848406, 0, 1, 0.1843137, 1,
-0.285122, -0.1267003, -0.04144161, 0, 1, 0.1882353, 1,
-0.2768991, 0.9988452, -0.4819088, 0, 1, 0.1960784, 1,
-0.275798, 1.72205, 0.8440783, 0, 1, 0.2039216, 1,
-0.2727315, 1.176975, -0.5539237, 0, 1, 0.2078431, 1,
-0.2720141, 1.618218, -1.30246, 0, 1, 0.2156863, 1,
-0.2664191, 0.1776568, -0.02875619, 0, 1, 0.2196078, 1,
-0.2642579, -0.06492393, 1.365402, 0, 1, 0.227451, 1,
-0.2638529, 1.002012, 0.372784, 0, 1, 0.2313726, 1,
-0.2617927, 0.4544637, -1.632181, 0, 1, 0.2392157, 1,
-0.2563262, -1.418501, -3.706201, 0, 1, 0.2431373, 1,
-0.2560576, -0.4976805, -2.817771, 0, 1, 0.2509804, 1,
-0.2540296, -1.540151, -3.831871, 0, 1, 0.254902, 1,
-0.2531417, -2.333745, -5.65222, 0, 1, 0.2627451, 1,
-0.2521065, -0.9446669, -0.4974822, 0, 1, 0.2666667, 1,
-0.2386049, -1.519375, -2.758222, 0, 1, 0.2745098, 1,
-0.2377045, 0.205934, 0.4373346, 0, 1, 0.2784314, 1,
-0.2340783, 0.1780245, -2.180349, 0, 1, 0.2862745, 1,
-0.2335673, 2.264912, 0.2229417, 0, 1, 0.2901961, 1,
-0.2306572, 0.1753531, -1.957329, 0, 1, 0.2980392, 1,
-0.2220245, -0.1755495, -2.155441, 0, 1, 0.3058824, 1,
-0.2160179, -0.535265, -2.989424, 0, 1, 0.3098039, 1,
-0.2150954, -0.3673109, -2.534745, 0, 1, 0.3176471, 1,
-0.2137596, -1.154967, -4.101045, 0, 1, 0.3215686, 1,
-0.2106822, 1.752128, -0.114108, 0, 1, 0.3294118, 1,
-0.2082208, 0.1016813, 0.7413187, 0, 1, 0.3333333, 1,
-0.2074913, 0.1126325, 0.01844614, 0, 1, 0.3411765, 1,
-0.2073165, 0.397411, -0.908555, 0, 1, 0.345098, 1,
-0.205653, -0.01177526, -2.734931, 0, 1, 0.3529412, 1,
-0.2008149, 0.6126539, -1.326552, 0, 1, 0.3568628, 1,
-0.1989312, 0.002678483, -0.1682352, 0, 1, 0.3647059, 1,
-0.1949438, 0.8826006, -0.2049373, 0, 1, 0.3686275, 1,
-0.1867034, 0.6342931, -1.471492, 0, 1, 0.3764706, 1,
-0.1860635, 0.06576698, -0.3994374, 0, 1, 0.3803922, 1,
-0.1844604, 1.256795, -0.5756276, 0, 1, 0.3882353, 1,
-0.1820403, 1.293858, -1.850211, 0, 1, 0.3921569, 1,
-0.1819282, 2.0285, -0.7862404, 0, 1, 0.4, 1,
-0.1816958, 0.2922641, -0.4097331, 0, 1, 0.4078431, 1,
-0.17996, 0.6926207, 0.2075465, 0, 1, 0.4117647, 1,
-0.1729898, -0.6760257, -0.4539953, 0, 1, 0.4196078, 1,
-0.1701519, -0.496327, -3.9132, 0, 1, 0.4235294, 1,
-0.1685173, 1.54988, 0.3495515, 0, 1, 0.4313726, 1,
-0.1652372, -1.836485, -2.947387, 0, 1, 0.4352941, 1,
-0.1624562, 0.7101508, 2.142444, 0, 1, 0.4431373, 1,
-0.1624207, -0.2187014, -1.544113, 0, 1, 0.4470588, 1,
-0.1602076, -1.885699, -3.699482, 0, 1, 0.454902, 1,
-0.1537296, 2.113707, -1.196335, 0, 1, 0.4588235, 1,
-0.1473334, -0.882811, -3.507369, 0, 1, 0.4666667, 1,
-0.1468442, -1.560387, -1.771626, 0, 1, 0.4705882, 1,
-0.1424865, -1.983703, -1.872715, 0, 1, 0.4784314, 1,
-0.1396812, 1.378071, 0.3354193, 0, 1, 0.4823529, 1,
-0.1390147, -0.5428512, -0.5903849, 0, 1, 0.4901961, 1,
-0.1376147, -0.8564063, -2.570904, 0, 1, 0.4941176, 1,
-0.1353006, -0.3765684, -2.0235, 0, 1, 0.5019608, 1,
-0.1308115, -0.002951608, -0.5949456, 0, 1, 0.509804, 1,
-0.1306954, -0.7533991, -4.62025, 0, 1, 0.5137255, 1,
-0.1279279, -1.053328, -2.404161, 0, 1, 0.5215687, 1,
-0.1226544, -1.219905, -4.836502, 0, 1, 0.5254902, 1,
-0.1170256, -0.7401053, -4.36238, 0, 1, 0.5333334, 1,
-0.1152145, 1.122524, -0.117545, 0, 1, 0.5372549, 1,
-0.1114104, -0.6151954, -2.019454, 0, 1, 0.5450981, 1,
-0.1029193, -0.0008258073, -1.622772, 0, 1, 0.5490196, 1,
-0.0971792, -3.208732, -3.704462, 0, 1, 0.5568628, 1,
-0.09445994, -0.1173154, -3.473642, 0, 1, 0.5607843, 1,
-0.09376387, 0.2791196, 0.5990836, 0, 1, 0.5686275, 1,
-0.09214262, 0.2008797, 0.04731585, 0, 1, 0.572549, 1,
-0.08688316, 0.3195349, -0.8679959, 0, 1, 0.5803922, 1,
-0.08650832, 1.227435, -1.099818, 0, 1, 0.5843138, 1,
-0.08302364, 0.1007207, 1.508594, 0, 1, 0.5921569, 1,
-0.08157177, -2.517763, -5.098122, 0, 1, 0.5960785, 1,
-0.07938921, 0.2321268, -2.739912, 0, 1, 0.6039216, 1,
-0.07793924, 1.647067, -1.191004, 0, 1, 0.6117647, 1,
-0.07786965, 0.4655135, 0.3852045, 0, 1, 0.6156863, 1,
-0.07704654, 0.9270325, 0.8213019, 0, 1, 0.6235294, 1,
-0.07547399, -1.84805, -2.8463, 0, 1, 0.627451, 1,
-0.07254649, -0.6217509, -2.930327, 0, 1, 0.6352941, 1,
-0.06978332, -0.6447425, -2.565357, 0, 1, 0.6392157, 1,
-0.05952084, 0.2038521, 0.3839158, 0, 1, 0.6470588, 1,
-0.05621989, 1.069697, 0.7240436, 0, 1, 0.6509804, 1,
-0.05435354, -0.6481546, -3.292918, 0, 1, 0.6588235, 1,
-0.05168375, 0.7129582, -0.9430032, 0, 1, 0.6627451, 1,
-0.0511205, 0.2475111, -0.6923512, 0, 1, 0.6705883, 1,
-0.05053699, -1.208841, -3.243118, 0, 1, 0.6745098, 1,
-0.04706738, 0.1531818, -1.288719, 0, 1, 0.682353, 1,
-0.04501166, 0.2976546, -0.2134519, 0, 1, 0.6862745, 1,
-0.04463978, 1.361161, -0.0708046, 0, 1, 0.6941177, 1,
-0.04299906, 1.396334, 0.376669, 0, 1, 0.7019608, 1,
-0.04060873, -1.01437, -4.137659, 0, 1, 0.7058824, 1,
-0.03890735, -1.482408, -3.837496, 0, 1, 0.7137255, 1,
-0.02821676, 2.105506, -0.2496754, 0, 1, 0.7176471, 1,
-0.02807165, -0.8657582, -4.564768, 0, 1, 0.7254902, 1,
-0.02413279, 1.714258, 1.125914, 0, 1, 0.7294118, 1,
-0.02216336, 0.7400221, 0.3043252, 0, 1, 0.7372549, 1,
-0.02048319, -0.7391988, -2.597959, 0, 1, 0.7411765, 1,
-0.01100505, 0.4140476, -0.3917088, 0, 1, 0.7490196, 1,
-0.003375415, -0.4319695, -3.132759, 0, 1, 0.7529412, 1,
-0.002399213, 1.652377, -0.3262275, 0, 1, 0.7607843, 1,
0.0008559912, -0.8759396, 3.141077, 0, 1, 0.7647059, 1,
0.003468105, 1.450608, -1.125787, 0, 1, 0.772549, 1,
0.004466689, -0.6903157, 2.150806, 0, 1, 0.7764706, 1,
0.01048607, -1.285926, 2.835006, 0, 1, 0.7843137, 1,
0.01327494, -0.7638057, 2.524366, 0, 1, 0.7882353, 1,
0.01802141, -0.7154437, 2.725739, 0, 1, 0.7960784, 1,
0.02179044, -1.217898, 3.92998, 0, 1, 0.8039216, 1,
0.02257591, 0.5539097, -1.233348, 0, 1, 0.8078431, 1,
0.02420448, 0.5526791, -1.704364, 0, 1, 0.8156863, 1,
0.02903458, 0.229992, -0.08747217, 0, 1, 0.8196079, 1,
0.03586926, -1.350506, 3.391088, 0, 1, 0.827451, 1,
0.03768709, 1.167348, -0.3564399, 0, 1, 0.8313726, 1,
0.03891271, -0.879042, 4.387719, 0, 1, 0.8392157, 1,
0.04467907, -0.3573476, 2.659745, 0, 1, 0.8431373, 1,
0.04985854, -0.5255005, 3.448417, 0, 1, 0.8509804, 1,
0.05118478, 0.008931926, 2.388876, 0, 1, 0.854902, 1,
0.05510136, 0.8716337, -0.1715235, 0, 1, 0.8627451, 1,
0.05943175, -0.2789089, 3.965345, 0, 1, 0.8666667, 1,
0.06421924, -0.09113389, 3.193905, 0, 1, 0.8745098, 1,
0.06515712, -1.542318, 1.103794, 0, 1, 0.8784314, 1,
0.06571406, 2.181615, -0.4136487, 0, 1, 0.8862745, 1,
0.06923018, -1.014831, 3.413122, 0, 1, 0.8901961, 1,
0.07144523, 0.5631121, -0.4548847, 0, 1, 0.8980392, 1,
0.07182877, 0.2334748, 0.822861, 0, 1, 0.9058824, 1,
0.07391951, -0.008724966, 0.9183949, 0, 1, 0.9098039, 1,
0.07615859, -1.119524, 4.377069, 0, 1, 0.9176471, 1,
0.0770719, -1.130855, 2.120923, 0, 1, 0.9215686, 1,
0.07841413, 0.5261578, 1.89046, 0, 1, 0.9294118, 1,
0.08119988, -0.7589337, 2.45611, 0, 1, 0.9333333, 1,
0.08212741, 1.545106, -0.5915276, 0, 1, 0.9411765, 1,
0.08266582, -1.46682, 3.672634, 0, 1, 0.945098, 1,
0.0835363, 0.1461615, 1.369667, 0, 1, 0.9529412, 1,
0.08593494, -1.305777, 3.933367, 0, 1, 0.9568627, 1,
0.08686782, -0.668672, 3.859009, 0, 1, 0.9647059, 1,
0.08754511, -0.8938884, 4.605221, 0, 1, 0.9686275, 1,
0.09275953, 0.1674812, 1.368521, 0, 1, 0.9764706, 1,
0.101459, -1.318665, 3.53407, 0, 1, 0.9803922, 1,
0.1020744, 0.8371139, -1.630761, 0, 1, 0.9882353, 1,
0.1025003, -1.780647, 3.400965, 0, 1, 0.9921569, 1,
0.10413, 1.056405, 1.149201, 0, 1, 1, 1,
0.1057738, 0.4264495, 0.28629, 0, 0.9921569, 1, 1,
0.1106953, -1.541089, 2.411036, 0, 0.9882353, 1, 1,
0.1114237, -0.1081695, 0.873767, 0, 0.9803922, 1, 1,
0.1136327, 0.3230971, 0.1028606, 0, 0.9764706, 1, 1,
0.1136342, -0.3681759, 3.764974, 0, 0.9686275, 1, 1,
0.115271, 0.03244792, 0.5804915, 0, 0.9647059, 1, 1,
0.1159383, -0.3249319, 3.983808, 0, 0.9568627, 1, 1,
0.1167019, -0.2643769, 2.826674, 0, 0.9529412, 1, 1,
0.1170779, -1.137368, 3.491899, 0, 0.945098, 1, 1,
0.1211554, -1.025713, 3.730512, 0, 0.9411765, 1, 1,
0.1280461, 0.7200049, 0.4047435, 0, 0.9333333, 1, 1,
0.1291487, 0.4378445, 1.07614, 0, 0.9294118, 1, 1,
0.1324495, -1.063833, 2.752115, 0, 0.9215686, 1, 1,
0.1328228, 0.5104038, -0.3750686, 0, 0.9176471, 1, 1,
0.1332311, 0.1375968, 1.05424, 0, 0.9098039, 1, 1,
0.1427002, 0.01457441, 1.132659, 0, 0.9058824, 1, 1,
0.1436415, 0.4948407, 1.631256, 0, 0.8980392, 1, 1,
0.1474695, -1.534763, 3.584162, 0, 0.8901961, 1, 1,
0.1475908, -0.1584372, 2.158546, 0, 0.8862745, 1, 1,
0.1515559, 0.5393642, 1.782613, 0, 0.8784314, 1, 1,
0.1557024, 0.8286641, 0.8464817, 0, 0.8745098, 1, 1,
0.1598741, -1.049736, 2.502206, 0, 0.8666667, 1, 1,
0.1646181, -0.04753173, 1.34676, 0, 0.8627451, 1, 1,
0.1727995, -0.2499863, 3.040822, 0, 0.854902, 1, 1,
0.1745394, 1.330466, -1.26894, 0, 0.8509804, 1, 1,
0.1746495, 1.451642, -0.3032553, 0, 0.8431373, 1, 1,
0.1759523, 0.9473752, -0.2905433, 0, 0.8392157, 1, 1,
0.1760699, 0.9320897, -0.04439239, 0, 0.8313726, 1, 1,
0.1798168, -0.1259613, 0.6362523, 0, 0.827451, 1, 1,
0.1823284, 1.283846, -0.06757653, 0, 0.8196079, 1, 1,
0.1826791, -1.290047, 2.827399, 0, 0.8156863, 1, 1,
0.1880596, 0.1274063, 0.4704946, 0, 0.8078431, 1, 1,
0.1888454, -1.586263, 2.551331, 0, 0.8039216, 1, 1,
0.1910528, -1.160495, 3.321662, 0, 0.7960784, 1, 1,
0.1921751, 0.8494679, 0.063038, 0, 0.7882353, 1, 1,
0.1941789, 0.4555719, 1.521091, 0, 0.7843137, 1, 1,
0.2001511, 0.2911112, 0.446971, 0, 0.7764706, 1, 1,
0.2019206, -0.2471776, 2.697018, 0, 0.772549, 1, 1,
0.2024296, 0.9267231, 1.963394, 0, 0.7647059, 1, 1,
0.2060022, 0.6620873, -0.3023546, 0, 0.7607843, 1, 1,
0.2060474, -1.316814, 3.177614, 0, 0.7529412, 1, 1,
0.2104806, -0.3393034, 3.356492, 0, 0.7490196, 1, 1,
0.21282, 0.6413467, 0.1869022, 0, 0.7411765, 1, 1,
0.2156467, -0.83019, 1.741592, 0, 0.7372549, 1, 1,
0.2310664, -0.02190048, 0.9810086, 0, 0.7294118, 1, 1,
0.2326713, 0.1466129, -0.2672493, 0, 0.7254902, 1, 1,
0.2361351, 1.369956, 0.7427942, 0, 0.7176471, 1, 1,
0.2365211, -0.8038622, 3.901056, 0, 0.7137255, 1, 1,
0.2384081, 1.805943, -0.6182689, 0, 0.7058824, 1, 1,
0.2400948, -0.1346944, 1.618833, 0, 0.6980392, 1, 1,
0.2409314, -1.72464, 2.387974, 0, 0.6941177, 1, 1,
0.2527725, -1.092592, 2.529676, 0, 0.6862745, 1, 1,
0.2535232, -0.2630482, 2.35134, 0, 0.682353, 1, 1,
0.2550303, 0.6786855, 1.123405, 0, 0.6745098, 1, 1,
0.2554241, -1.78824, 3.419712, 0, 0.6705883, 1, 1,
0.256118, -0.03000033, 1.454595, 0, 0.6627451, 1, 1,
0.2603205, 0.2063797, 0.9885559, 0, 0.6588235, 1, 1,
0.2611915, -0.9194508, 3.436746, 0, 0.6509804, 1, 1,
0.2642095, -2.408243, 3.141988, 0, 0.6470588, 1, 1,
0.2671414, -0.8323179, 1.110231, 0, 0.6392157, 1, 1,
0.2674848, 0.5191149, 0.476434, 0, 0.6352941, 1, 1,
0.2707937, -0.6398529, 1.831138, 0, 0.627451, 1, 1,
0.2720957, 0.6646044, 2.101496, 0, 0.6235294, 1, 1,
0.2727547, -1.13583, 5.443635, 0, 0.6156863, 1, 1,
0.2731165, 0.7345923, -0.1235826, 0, 0.6117647, 1, 1,
0.2745891, -0.5541391, 3.581138, 0, 0.6039216, 1, 1,
0.2746957, 1.081561, -0.8989809, 0, 0.5960785, 1, 1,
0.2786852, 0.1179614, 1.663916, 0, 0.5921569, 1, 1,
0.2799431, 0.4016803, 0.2600259, 0, 0.5843138, 1, 1,
0.2809422, -0.0368457, 2.28473, 0, 0.5803922, 1, 1,
0.2852404, 0.3593521, 0.3195114, 0, 0.572549, 1, 1,
0.2853445, 1.155645, -0.371598, 0, 0.5686275, 1, 1,
0.2853779, 0.9506042, 0.09970922, 0, 0.5607843, 1, 1,
0.285509, 0.03398003, 1.335666, 0, 0.5568628, 1, 1,
0.2864936, 0.8287904, 0.6282737, 0, 0.5490196, 1, 1,
0.2936097, -2.337471, 2.982582, 0, 0.5450981, 1, 1,
0.2943067, -0.1602077, 0.1393781, 0, 0.5372549, 1, 1,
0.2960213, 0.08026379, 1.662067, 0, 0.5333334, 1, 1,
0.3009267, -0.4168894, 1.334819, 0, 0.5254902, 1, 1,
0.3082168, 1.240943, 0.354758, 0, 0.5215687, 1, 1,
0.3098726, -0.6940439, 1.803594, 0, 0.5137255, 1, 1,
0.3104947, -0.06326602, 0.5818333, 0, 0.509804, 1, 1,
0.3143089, 2.184158, 1.535475, 0, 0.5019608, 1, 1,
0.3170742, 2.057767, 0.6469012, 0, 0.4941176, 1, 1,
0.3193196, -0.04023343, 2.028915, 0, 0.4901961, 1, 1,
0.3203469, 1.351282, -0.8940815, 0, 0.4823529, 1, 1,
0.3216243, -0.8755216, 4.062167, 0, 0.4784314, 1, 1,
0.3254308, 0.3767059, -0.5739625, 0, 0.4705882, 1, 1,
0.3292512, 0.3737394, 0.5406061, 0, 0.4666667, 1, 1,
0.3308893, -0.4535866, 2.704411, 0, 0.4588235, 1, 1,
0.3312588, -0.6231399, 3.843438, 0, 0.454902, 1, 1,
0.3350996, 0.8526112, 0.3629982, 0, 0.4470588, 1, 1,
0.336563, 0.08093073, 1.166894, 0, 0.4431373, 1, 1,
0.3486468, 0.1725762, 0.5540978, 0, 0.4352941, 1, 1,
0.3510123, -0.369221, 3.848678, 0, 0.4313726, 1, 1,
0.3511892, -1.251305, 2.226663, 0, 0.4235294, 1, 1,
0.3516121, -0.2567033, 1.445527, 0, 0.4196078, 1, 1,
0.3534591, -0.713949, 2.629879, 0, 0.4117647, 1, 1,
0.3548925, -0.8639842, 3.708966, 0, 0.4078431, 1, 1,
0.3586941, 0.2792749, 0.6741872, 0, 0.4, 1, 1,
0.3614159, -1.235606, 3.114635, 0, 0.3921569, 1, 1,
0.3619707, -0.6834397, 1.682488, 0, 0.3882353, 1, 1,
0.3630454, 0.3695141, 3.509886, 0, 0.3803922, 1, 1,
0.3632759, 0.6657436, 1.323516, 0, 0.3764706, 1, 1,
0.3635287, 0.5784301, 2.888772, 0, 0.3686275, 1, 1,
0.3638653, -0.8617493, 1.962593, 0, 0.3647059, 1, 1,
0.3640113, 0.3259194, -0.5900261, 0, 0.3568628, 1, 1,
0.36575, -0.1734694, 1.229599, 0, 0.3529412, 1, 1,
0.371694, 1.350891, 1.488351, 0, 0.345098, 1, 1,
0.3749052, -0.3649798, 2.860216, 0, 0.3411765, 1, 1,
0.3770503, 0.3161485, 0.2345457, 0, 0.3333333, 1, 1,
0.3783869, -0.5021397, 4.382382, 0, 0.3294118, 1, 1,
0.3828959, -0.3122447, 0.5086112, 0, 0.3215686, 1, 1,
0.389337, -0.009398554, 0.2555046, 0, 0.3176471, 1, 1,
0.3920244, 0.2508394, 1.116885, 0, 0.3098039, 1, 1,
0.3935452, -0.1394405, 1.655166, 0, 0.3058824, 1, 1,
0.3953868, -0.06004588, 0.3901914, 0, 0.2980392, 1, 1,
0.395584, -0.8123691, 0.7283689, 0, 0.2901961, 1, 1,
0.3990217, -0.534036, 3.025036, 0, 0.2862745, 1, 1,
0.3999378, -1.311773, 2.094891, 0, 0.2784314, 1, 1,
0.4095213, 0.6357839, 1.623341, 0, 0.2745098, 1, 1,
0.4133783, 0.5602621, -1.688387, 0, 0.2666667, 1, 1,
0.4140128, -1.669457, 3.221568, 0, 0.2627451, 1, 1,
0.4201778, 0.3357508, 1.511735, 0, 0.254902, 1, 1,
0.422901, 0.3069681, 0.7001433, 0, 0.2509804, 1, 1,
0.4242256, -1.558481, 2.363029, 0, 0.2431373, 1, 1,
0.4247057, -1.410035, 2.382792, 0, 0.2392157, 1, 1,
0.4259879, 0.9145053, 0.3314193, 0, 0.2313726, 1, 1,
0.4283527, 0.2652588, 2.100978, 0, 0.227451, 1, 1,
0.4307104, -0.9338474, 3.426465, 0, 0.2196078, 1, 1,
0.4346831, 0.08749083, 1.564395, 0, 0.2156863, 1, 1,
0.4403366, 1.350234, -0.2053801, 0, 0.2078431, 1, 1,
0.4463805, 1.691635, -1.703888, 0, 0.2039216, 1, 1,
0.4496408, 0.9199693, -1.243766, 0, 0.1960784, 1, 1,
0.4510442, 0.05695625, 1.630872, 0, 0.1882353, 1, 1,
0.4545448, 1.216833, -0.6693252, 0, 0.1843137, 1, 1,
0.4605687, -1.093214, 3.667942, 0, 0.1764706, 1, 1,
0.4605962, -0.8729565, 3.07577, 0, 0.172549, 1, 1,
0.4624949, 2.593947, 2.150187, 0, 0.1647059, 1, 1,
0.4646325, -1.878658, 4.572258, 0, 0.1607843, 1, 1,
0.4663499, 1.433338, 0.3346089, 0, 0.1529412, 1, 1,
0.4691236, 0.9290389, 2.703758, 0, 0.1490196, 1, 1,
0.4713206, 0.5654684, 0.5516759, 0, 0.1411765, 1, 1,
0.4775729, 1.277022, 1.032967, 0, 0.1372549, 1, 1,
0.4832268, 2.02966, -0.594224, 0, 0.1294118, 1, 1,
0.4843595, 0.2609288, 1.649399, 0, 0.1254902, 1, 1,
0.4871028, 0.4479672, 1.327801, 0, 0.1176471, 1, 1,
0.4890226, 0.6096766, 0.3717734, 0, 0.1137255, 1, 1,
0.489259, -1.276962, 2.915687, 0, 0.1058824, 1, 1,
0.4957347, 0.8829601, -0.06464695, 0, 0.09803922, 1, 1,
0.4973627, 0.6449035, 1.461047, 0, 0.09411765, 1, 1,
0.4974426, -1.024606, 3.79577, 0, 0.08627451, 1, 1,
0.4983918, -0.3257078, 1.985694, 0, 0.08235294, 1, 1,
0.5000976, -1.907495, 2.037975, 0, 0.07450981, 1, 1,
0.5019547, 0.7727252, 0.847473, 0, 0.07058824, 1, 1,
0.5054991, 1.171584, 1.303225, 0, 0.0627451, 1, 1,
0.5127402, -1.155433, 3.311918, 0, 0.05882353, 1, 1,
0.5128838, 0.6228098, 1.487737, 0, 0.05098039, 1, 1,
0.5157455, 1.462465, 1.248213, 0, 0.04705882, 1, 1,
0.5166773, -1.441823, 2.285775, 0, 0.03921569, 1, 1,
0.522971, -0.9271033, 1.381976, 0, 0.03529412, 1, 1,
0.5232394, -0.5489259, 2.181618, 0, 0.02745098, 1, 1,
0.5253154, -1.211091, 1.84419, 0, 0.02352941, 1, 1,
0.526844, -0.4499729, 1.567427, 0, 0.01568628, 1, 1,
0.5324638, 1.363925, 2.07548, 0, 0.01176471, 1, 1,
0.5398608, 0.05495564, 2.096884, 0, 0.003921569, 1, 1,
0.5408465, 1.480404, 1.567543, 0.003921569, 0, 1, 1,
0.542699, -0.2212164, 1.834558, 0.007843138, 0, 1, 1,
0.5435512, -0.7148682, 3.163236, 0.01568628, 0, 1, 1,
0.5519648, 1.813534, 2.449469, 0.01960784, 0, 1, 1,
0.5521786, -0.4685394, 3.076357, 0.02745098, 0, 1, 1,
0.5552583, -0.4894027, 3.860757, 0.03137255, 0, 1, 1,
0.5558788, -0.8294917, 1.563749, 0.03921569, 0, 1, 1,
0.5576862, 0.2537954, 3.610594, 0.04313726, 0, 1, 1,
0.5622235, -0.3034561, 0.7596707, 0.05098039, 0, 1, 1,
0.5638102, 0.288863, 1.61206, 0.05490196, 0, 1, 1,
0.5649663, -0.9064385, 3.027505, 0.0627451, 0, 1, 1,
0.569315, -0.7338813, 3.297949, 0.06666667, 0, 1, 1,
0.5703079, -0.4640947, 2.307909, 0.07450981, 0, 1, 1,
0.5710017, -0.5487629, 2.298618, 0.07843138, 0, 1, 1,
0.5729774, -0.7056749, 0.7551284, 0.08627451, 0, 1, 1,
0.5808862, 0.8909909, 0.8178958, 0.09019608, 0, 1, 1,
0.5823156, -1.911693, 1.706892, 0.09803922, 0, 1, 1,
0.5840616, 0.02284843, 2.949064, 0.1058824, 0, 1, 1,
0.5860751, 0.7698181, 0.9191132, 0.1098039, 0, 1, 1,
0.5869556, -0.9594688, 3.287416, 0.1176471, 0, 1, 1,
0.590307, 1.324666, 1.642891, 0.1215686, 0, 1, 1,
0.5926, -0.943018, 1.641374, 0.1294118, 0, 1, 1,
0.5927973, -1.350619, 1.096104, 0.1333333, 0, 1, 1,
0.595737, 0.2103542, 1.020866, 0.1411765, 0, 1, 1,
0.5987702, 0.7200657, -0.9568049, 0.145098, 0, 1, 1,
0.5991135, 1.124271, 1.04155, 0.1529412, 0, 1, 1,
0.6010382, 0.4404351, -0.07523812, 0.1568628, 0, 1, 1,
0.6027951, 0.2870587, 1.885327, 0.1647059, 0, 1, 1,
0.6031587, 0.06927352, -0.1218716, 0.1686275, 0, 1, 1,
0.603601, -1.760444, 3.906089, 0.1764706, 0, 1, 1,
0.6065358, 0.587588, -0.2355175, 0.1803922, 0, 1, 1,
0.6070818, -0.2441709, 2.349642, 0.1882353, 0, 1, 1,
0.6070868, 0.1073773, 1.448589, 0.1921569, 0, 1, 1,
0.6101736, -1.048833, 3.647127, 0.2, 0, 1, 1,
0.6242274, 1.77133, -0.0769556, 0.2078431, 0, 1, 1,
0.6267565, 1.011351, 0.5063839, 0.2117647, 0, 1, 1,
0.6276286, -2.268121, 2.049688, 0.2196078, 0, 1, 1,
0.6300001, -1.573743, 3.331251, 0.2235294, 0, 1, 1,
0.6325334, -0.6103623, 0.8262815, 0.2313726, 0, 1, 1,
0.6328809, 0.8791496, 1.258915, 0.2352941, 0, 1, 1,
0.6362314, -0.6433651, 2.253359, 0.2431373, 0, 1, 1,
0.6409938, -1.032678, 2.224445, 0.2470588, 0, 1, 1,
0.6518349, 0.2911874, 1.172752, 0.254902, 0, 1, 1,
0.6522427, 1.192724, 0.3976052, 0.2588235, 0, 1, 1,
0.652286, -0.4741465, 3.187118, 0.2666667, 0, 1, 1,
0.6524036, -0.6743585, 0.981485, 0.2705882, 0, 1, 1,
0.6534854, 0.5230891, 1.005763, 0.2784314, 0, 1, 1,
0.6536515, 2.225236, 0.9760769, 0.282353, 0, 1, 1,
0.6559101, -0.5390469, 1.698244, 0.2901961, 0, 1, 1,
0.6567479, -0.2063531, 2.883425, 0.2941177, 0, 1, 1,
0.6615344, 1.637291, 0.06567949, 0.3019608, 0, 1, 1,
0.6618281, 0.9531139, 0.06728247, 0.3098039, 0, 1, 1,
0.6629052, 1.573714, -1.17701, 0.3137255, 0, 1, 1,
0.6685522, 0.3135165, -1.276932, 0.3215686, 0, 1, 1,
0.6689789, -1.91864, 0.9626215, 0.3254902, 0, 1, 1,
0.6711065, 0.08431523, 1.489684, 0.3333333, 0, 1, 1,
0.6720741, 2.719849, 0.7578518, 0.3372549, 0, 1, 1,
0.672649, 0.6365259, 0.2492059, 0.345098, 0, 1, 1,
0.673219, 0.84593, 0.6971848, 0.3490196, 0, 1, 1,
0.6737641, 0.7557627, -0.3691862, 0.3568628, 0, 1, 1,
0.6751198, -0.4039373, 3.249165, 0.3607843, 0, 1, 1,
0.6762168, -0.1900922, 0.7916535, 0.3686275, 0, 1, 1,
0.6799535, 0.5336991, 0.04093695, 0.372549, 0, 1, 1,
0.6831997, 2.078578, -0.5969414, 0.3803922, 0, 1, 1,
0.6834071, 1.160331, 0.2793562, 0.3843137, 0, 1, 1,
0.6881704, -0.02554795, 2.078092, 0.3921569, 0, 1, 1,
0.6913118, -1.328342, 4.04336, 0.3960784, 0, 1, 1,
0.6941761, 0.4856071, 1.286611, 0.4039216, 0, 1, 1,
0.6941832, -0.5280115, 1.284865, 0.4117647, 0, 1, 1,
0.697322, -0.9398825, 0.6525993, 0.4156863, 0, 1, 1,
0.6995379, 0.7525899, 1.171762, 0.4235294, 0, 1, 1,
0.7008787, -0.02239901, 3.040726, 0.427451, 0, 1, 1,
0.7033547, 0.6124346, 0.4399426, 0.4352941, 0, 1, 1,
0.7139755, -0.4619563, 4.325778, 0.4392157, 0, 1, 1,
0.7155933, -1.209145, 3.232454, 0.4470588, 0, 1, 1,
0.7157301, 0.02492451, -0.5133749, 0.4509804, 0, 1, 1,
0.7165825, 0.6441554, 1.454056, 0.4588235, 0, 1, 1,
0.7202586, 0.210111, 1.335323, 0.4627451, 0, 1, 1,
0.7217996, -1.179683, 2.019999, 0.4705882, 0, 1, 1,
0.7247153, 0.1933682, -0.4944467, 0.4745098, 0, 1, 1,
0.7255227, -0.1479844, 4.447426, 0.4823529, 0, 1, 1,
0.7306065, 0.9033499, 0.8231651, 0.4862745, 0, 1, 1,
0.7392023, -1.153948, 1.495851, 0.4941176, 0, 1, 1,
0.7414578, 2.489986, 0.2675808, 0.5019608, 0, 1, 1,
0.7434989, -1.405852, 2.704845, 0.5058824, 0, 1, 1,
0.7461522, 0.04925888, 1.942615, 0.5137255, 0, 1, 1,
0.7463524, 1.690919, -0.4001399, 0.5176471, 0, 1, 1,
0.7575844, -0.1781055, 1.273844, 0.5254902, 0, 1, 1,
0.7653103, 0.3352176, 1.737756, 0.5294118, 0, 1, 1,
0.7655187, -0.8592851, 1.694587, 0.5372549, 0, 1, 1,
0.7741721, -0.1894432, 2.670074, 0.5411765, 0, 1, 1,
0.7840639, 0.4619305, -0.2853541, 0.5490196, 0, 1, 1,
0.7854395, 0.9461466, 1.375655, 0.5529412, 0, 1, 1,
0.7904687, -0.1379748, 2.317571, 0.5607843, 0, 1, 1,
0.795358, 0.201115, 0.8406271, 0.5647059, 0, 1, 1,
0.805061, 1.584583, -0.7236848, 0.572549, 0, 1, 1,
0.8085402, 1.503427, 0.9221976, 0.5764706, 0, 1, 1,
0.8110456, 0.1209631, -0.2339996, 0.5843138, 0, 1, 1,
0.8113891, 2.540472, -1.135888, 0.5882353, 0, 1, 1,
0.8121409, -0.4462208, 2.085639, 0.5960785, 0, 1, 1,
0.8132537, 0.8111734, 1.916777, 0.6039216, 0, 1, 1,
0.8161214, -1.073432, 1.61936, 0.6078432, 0, 1, 1,
0.8168529, 0.8203126, 3.9679, 0.6156863, 0, 1, 1,
0.8185193, 1.203547, -0.2858135, 0.6196079, 0, 1, 1,
0.8241436, 0.1033394, 1.138503, 0.627451, 0, 1, 1,
0.8273371, 0.4748864, 0.3415325, 0.6313726, 0, 1, 1,
0.8275629, -0.9732707, 2.39229, 0.6392157, 0, 1, 1,
0.8331603, -0.1627924, 0.8473471, 0.6431373, 0, 1, 1,
0.8377281, -1.474339, 2.710285, 0.6509804, 0, 1, 1,
0.8382671, -0.2747068, 1.171309, 0.654902, 0, 1, 1,
0.839852, 0.7926484, 1.400674, 0.6627451, 0, 1, 1,
0.8449107, -0.01589868, 1.431438, 0.6666667, 0, 1, 1,
0.8515764, 0.2484978, 3.065866, 0.6745098, 0, 1, 1,
0.8586918, 0.5471223, 0.4222786, 0.6784314, 0, 1, 1,
0.8642814, -0.402473, 2.471468, 0.6862745, 0, 1, 1,
0.8725831, 0.8900762, 2.791493, 0.6901961, 0, 1, 1,
0.875222, -0.1254324, 1.986851, 0.6980392, 0, 1, 1,
0.88415, -0.5919341, 2.283045, 0.7058824, 0, 1, 1,
0.8852344, 0.1676736, 0.3846004, 0.7098039, 0, 1, 1,
0.8926929, -0.9485871, 2.4995, 0.7176471, 0, 1, 1,
0.8958803, 0.520993, 0.9729766, 0.7215686, 0, 1, 1,
0.8979361, -0.4115412, 0.809544, 0.7294118, 0, 1, 1,
0.9016017, -0.609202, 1.302413, 0.7333333, 0, 1, 1,
0.9025507, -1.440547, 2.923663, 0.7411765, 0, 1, 1,
0.9042841, 0.4937227, 2.095332, 0.7450981, 0, 1, 1,
0.9102596, 0.07850082, 0.5997993, 0.7529412, 0, 1, 1,
0.9222339, 2.180317, 0.2476088, 0.7568628, 0, 1, 1,
0.9227925, 0.5079279, 2.398389, 0.7647059, 0, 1, 1,
0.9254832, 0.3510195, -0.7144449, 0.7686275, 0, 1, 1,
0.9296718, -0.236616, 2.280016, 0.7764706, 0, 1, 1,
0.9307685, 0.1407656, 0.1364625, 0.7803922, 0, 1, 1,
0.9361526, 0.9341102, 0.4928316, 0.7882353, 0, 1, 1,
0.9386953, 0.0764168, 1.199833, 0.7921569, 0, 1, 1,
0.9476508, -0.2812225, 1.560288, 0.8, 0, 1, 1,
0.9493924, -1.874656, 2.995291, 0.8078431, 0, 1, 1,
0.9514284, 0.7776656, 1.866268, 0.8117647, 0, 1, 1,
0.9525378, -1.204876, 2.219058, 0.8196079, 0, 1, 1,
0.9644114, -0.1251766, 2.322384, 0.8235294, 0, 1, 1,
0.9645888, -0.5915222, 3.600479, 0.8313726, 0, 1, 1,
0.9647825, 1.071367, 2.51911, 0.8352941, 0, 1, 1,
0.9666765, -1.269246, 1.649272, 0.8431373, 0, 1, 1,
0.9683883, -1.085171, 1.756441, 0.8470588, 0, 1, 1,
0.9692943, -0.5466341, 1.273124, 0.854902, 0, 1, 1,
0.9723461, 0.3516044, 1.463781, 0.8588235, 0, 1, 1,
0.9750173, -0.3570146, 0.8661983, 0.8666667, 0, 1, 1,
0.9768931, 0.6019875, 1.178791, 0.8705882, 0, 1, 1,
0.977717, -0.787688, 3.512189, 0.8784314, 0, 1, 1,
0.9846882, 1.537212, 1.27405, 0.8823529, 0, 1, 1,
0.9847424, -0.1322884, 1.916982, 0.8901961, 0, 1, 1,
0.9878629, 0.3219316, 0.50204, 0.8941177, 0, 1, 1,
1.000489, -1.362111, 1.596513, 0.9019608, 0, 1, 1,
1.015903, 0.223484, 0.6069671, 0.9098039, 0, 1, 1,
1.01863, 0.08539721, 0.4369286, 0.9137255, 0, 1, 1,
1.025777, 0.0266081, 1.629412, 0.9215686, 0, 1, 1,
1.032685, -1.401759, 0.2287486, 0.9254902, 0, 1, 1,
1.03641, 1.700475, 0.780052, 0.9333333, 0, 1, 1,
1.037121, 1.172431, 2.386621, 0.9372549, 0, 1, 1,
1.040997, 1.410404, 0.8569468, 0.945098, 0, 1, 1,
1.04767, -0.2628422, 2.980922, 0.9490196, 0, 1, 1,
1.047678, 0.0001846358, 2.330457, 0.9568627, 0, 1, 1,
1.049234, -0.34009, 0.9432145, 0.9607843, 0, 1, 1,
1.05891, -0.9154447, 3.58158, 0.9686275, 0, 1, 1,
1.066748, 1.739501, 1.112201, 0.972549, 0, 1, 1,
1.069104, 1.239378, 0.8808773, 0.9803922, 0, 1, 1,
1.070286, 0.5331442, 1.089088, 0.9843137, 0, 1, 1,
1.081044, 0.9228818, 3.237369, 0.9921569, 0, 1, 1,
1.081981, 1.010495, -0.6486301, 0.9960784, 0, 1, 1,
1.08908, -1.826812, 2.672919, 1, 0, 0.9960784, 1,
1.093806, 0.7628335, 0.8125445, 1, 0, 0.9882353, 1,
1.100587, 0.258927, 1.833982, 1, 0, 0.9843137, 1,
1.101233, -0.7886456, 0.1258773, 1, 0, 0.9764706, 1,
1.111814, -0.329168, 2.479431, 1, 0, 0.972549, 1,
1.112573, 0.3909521, 1.065888, 1, 0, 0.9647059, 1,
1.113734, -1.199965, 4.192042, 1, 0, 0.9607843, 1,
1.118742, -1.097591, 3.149944, 1, 0, 0.9529412, 1,
1.122172, 1.06953, 1.162352, 1, 0, 0.9490196, 1,
1.124818, -0.0688212, 3.175772, 1, 0, 0.9411765, 1,
1.129422, 0.6836762, 0.3840405, 1, 0, 0.9372549, 1,
1.129532, 0.3316984, 0.7442327, 1, 0, 0.9294118, 1,
1.132017, -0.6582172, 2.174629, 1, 0, 0.9254902, 1,
1.145348, -2.099931, 2.185442, 1, 0, 0.9176471, 1,
1.148628, 0.3810582, 0.9485489, 1, 0, 0.9137255, 1,
1.152238, 1.616177, 0.4855003, 1, 0, 0.9058824, 1,
1.152921, 0.0820066, 1.151563, 1, 0, 0.9019608, 1,
1.156908, 0.4088379, 0.295583, 1, 0, 0.8941177, 1,
1.162211, 0.09485587, 1.981277, 1, 0, 0.8862745, 1,
1.165341, 1.099289, 3.259549, 1, 0, 0.8823529, 1,
1.17453, -0.2559421, 0.8756974, 1, 0, 0.8745098, 1,
1.177539, 0.5170727, 1.752721, 1, 0, 0.8705882, 1,
1.177928, -0.3456651, 0.7896763, 1, 0, 0.8627451, 1,
1.178842, -1.188879, 3.274471, 1, 0, 0.8588235, 1,
1.183368, -0.1424658, 1.832772, 1, 0, 0.8509804, 1,
1.188641, -0.4364964, 2.319715, 1, 0, 0.8470588, 1,
1.193755, 0.1114424, -0.03845518, 1, 0, 0.8392157, 1,
1.200664, 1.428787, 0.1353726, 1, 0, 0.8352941, 1,
1.201241, -1.483056, 1.323267, 1, 0, 0.827451, 1,
1.202632, 1.100741, 1.918121, 1, 0, 0.8235294, 1,
1.206286, -0.01194413, 1.586455, 1, 0, 0.8156863, 1,
1.209352, 1.134015, -0.6588902, 1, 0, 0.8117647, 1,
1.210675, -1.029316, 1.591385, 1, 0, 0.8039216, 1,
1.211116, -0.0252092, 0.8824431, 1, 0, 0.7960784, 1,
1.22474, -1.789715, 1.82307, 1, 0, 0.7921569, 1,
1.225114, -0.6683926, 1.978154, 1, 0, 0.7843137, 1,
1.229542, -0.1215138, 1.555597, 1, 0, 0.7803922, 1,
1.231769, 0.6816862, 2.455111, 1, 0, 0.772549, 1,
1.234383, -0.4187734, 3.200937, 1, 0, 0.7686275, 1,
1.235409, -0.4391581, 1.896463, 1, 0, 0.7607843, 1,
1.237054, 1.71656, 0.9781218, 1, 0, 0.7568628, 1,
1.237199, 0.5315479, 1.604454, 1, 0, 0.7490196, 1,
1.243226, -0.7309253, 4.129086, 1, 0, 0.7450981, 1,
1.246031, -1.720226, 1.756365, 1, 0, 0.7372549, 1,
1.248835, -1.961314, 1.942895, 1, 0, 0.7333333, 1,
1.262629, -0.6971146, 5.453102, 1, 0, 0.7254902, 1,
1.271888, 0.1058032, 0.6737773, 1, 0, 0.7215686, 1,
1.277099, 0.7052207, 2.422602, 1, 0, 0.7137255, 1,
1.289356, -1.33149, 2.40582, 1, 0, 0.7098039, 1,
1.294276, 0.5313462, 3.111616, 1, 0, 0.7019608, 1,
1.294357, -0.91126, 1.715414, 1, 0, 0.6941177, 1,
1.294414, 0.6793132, 2.276615, 1, 0, 0.6901961, 1,
1.297133, -0.8704147, 0.985664, 1, 0, 0.682353, 1,
1.299799, -0.1528631, 2.012891, 1, 0, 0.6784314, 1,
1.302017, 1.066504, 1.691766, 1, 0, 0.6705883, 1,
1.303622, -1.553727, 2.826182, 1, 0, 0.6666667, 1,
1.309968, 0.2334766, 2.319436, 1, 0, 0.6588235, 1,
1.31689, -0.3923468, 0.2103309, 1, 0, 0.654902, 1,
1.321658, 0.8292205, 0.6650903, 1, 0, 0.6470588, 1,
1.322302, -0.324368, 5.170387, 1, 0, 0.6431373, 1,
1.323615, -0.183231, 3.522308, 1, 0, 0.6352941, 1,
1.324159, -0.1171642, -0.3019325, 1, 0, 0.6313726, 1,
1.326556, 0.9101918, 0.323124, 1, 0, 0.6235294, 1,
1.334109, -1.437149, 2.78428, 1, 0, 0.6196079, 1,
1.341637, -0.9227978, 2.3539, 1, 0, 0.6117647, 1,
1.349647, -0.1616027, 0.5208428, 1, 0, 0.6078432, 1,
1.353705, 1.331792, 0.8829269, 1, 0, 0.6, 1,
1.35513, 0.9928414, 1.586829, 1, 0, 0.5921569, 1,
1.363359, -0.9264088, 3.713141, 1, 0, 0.5882353, 1,
1.364564, 1.622226, 1.754055, 1, 0, 0.5803922, 1,
1.377167, -0.3436114, 1.776595, 1, 0, 0.5764706, 1,
1.389583, 0.3790504, 1.82102, 1, 0, 0.5686275, 1,
1.398757, 0.2643315, 0.9203571, 1, 0, 0.5647059, 1,
1.404895, 1.694974, 1.068054, 1, 0, 0.5568628, 1,
1.413567, -1.214653, 1.167068, 1, 0, 0.5529412, 1,
1.419171, -0.3199751, 0.8122817, 1, 0, 0.5450981, 1,
1.422055, -0.1754846, 1.903011, 1, 0, 0.5411765, 1,
1.429022, -0.7467678, 3.507787, 1, 0, 0.5333334, 1,
1.437448, 0.8911548, 0.9553971, 1, 0, 0.5294118, 1,
1.438182, 0.09152547, -0.2495022, 1, 0, 0.5215687, 1,
1.440417, -0.3492003, 2.864288, 1, 0, 0.5176471, 1,
1.453576, 1.242451, 1.963632, 1, 0, 0.509804, 1,
1.456102, 2.212231, 0.2972338, 1, 0, 0.5058824, 1,
1.461071, 0.7465617, -0.02470187, 1, 0, 0.4980392, 1,
1.477381, 0.9917396, 1.15408, 1, 0, 0.4901961, 1,
1.479327, -1.333986, 2.018195, 1, 0, 0.4862745, 1,
1.479735, -0.3733833, 1.094358, 1, 0, 0.4784314, 1,
1.486635, -1.228395, 2.49072, 1, 0, 0.4745098, 1,
1.487949, 0.2948936, 2.307351, 1, 0, 0.4666667, 1,
1.491359, 0.2933124, 1.816698, 1, 0, 0.4627451, 1,
1.495578, 0.891083, 2.053225, 1, 0, 0.454902, 1,
1.496812, -0.1698551, 1.891793, 1, 0, 0.4509804, 1,
1.507982, -0.3112382, 2.960322, 1, 0, 0.4431373, 1,
1.510657, 0.2409926, 2.30209, 1, 0, 0.4392157, 1,
1.511894, -1.057006, 2.224119, 1, 0, 0.4313726, 1,
1.51396, -0.4994573, 1.967304, 1, 0, 0.427451, 1,
1.537918, 0.559227, 1.358258, 1, 0, 0.4196078, 1,
1.54211, 0.9618389, 2.946461, 1, 0, 0.4156863, 1,
1.542792, -1.104907, 2.143225, 1, 0, 0.4078431, 1,
1.54894, 0.5676486, 1.04781, 1, 0, 0.4039216, 1,
1.572123, 0.7692959, 1.658762, 1, 0, 0.3960784, 1,
1.579749, -0.961247, 2.903455, 1, 0, 0.3882353, 1,
1.583054, -1.398547, 2.67197, 1, 0, 0.3843137, 1,
1.586474, 0.2322639, 1.693581, 1, 0, 0.3764706, 1,
1.597086, -1.19635, 2.424628, 1, 0, 0.372549, 1,
1.597193, -0.8550232, 2.924046, 1, 0, 0.3647059, 1,
1.598906, -0.570627, 1.155482, 1, 0, 0.3607843, 1,
1.605973, -0.9260619, 1.594631, 1, 0, 0.3529412, 1,
1.612218, -0.4538677, 4.008658, 1, 0, 0.3490196, 1,
1.620282, -0.9224263, 2.431607, 1, 0, 0.3411765, 1,
1.633536, 0.9895797, 1.805439, 1, 0, 0.3372549, 1,
1.660039, -0.8695779, 0.8177753, 1, 0, 0.3294118, 1,
1.675617, 0.5175514, 0.9416634, 1, 0, 0.3254902, 1,
1.695283, -1.21252, 4.094173, 1, 0, 0.3176471, 1,
1.701669, -1.155448, 2.270342, 1, 0, 0.3137255, 1,
1.723343, -0.6081415, 0.8329073, 1, 0, 0.3058824, 1,
1.730231, -0.2595412, 1.237531, 1, 0, 0.2980392, 1,
1.738555, 0.8244238, 1.513569, 1, 0, 0.2941177, 1,
1.754478, 1.336149, 3.631047, 1, 0, 0.2862745, 1,
1.766166, -0.06026939, 1.480843, 1, 0, 0.282353, 1,
1.829883, -1.495575, 1.835276, 1, 0, 0.2745098, 1,
1.83312, -0.9846076, 1.397205, 1, 0, 0.2705882, 1,
1.849844, -1.482908, 1.841839, 1, 0, 0.2627451, 1,
1.866203, 0.2500422, 1.477193, 1, 0, 0.2588235, 1,
1.870069, 2.704536, 0.2318312, 1, 0, 0.2509804, 1,
1.878892, -1.213927, 2.475248, 1, 0, 0.2470588, 1,
1.879505, -0.01719216, 3.009986, 1, 0, 0.2392157, 1,
1.886214, 1.33661, 1.255659, 1, 0, 0.2352941, 1,
1.893286, -0.4081226, 1.892165, 1, 0, 0.227451, 1,
1.894761, -1.308729, 1.518843, 1, 0, 0.2235294, 1,
1.897726, 0.5175492, 1.518532, 1, 0, 0.2156863, 1,
1.929292, -0.9197409, 1.559269, 1, 0, 0.2117647, 1,
1.931919, 0.4308465, 0.8725896, 1, 0, 0.2039216, 1,
1.944343, 0.8111326, -0.2609467, 1, 0, 0.1960784, 1,
1.95208, 2.056026, 0.8920258, 1, 0, 0.1921569, 1,
1.975984, -0.2042865, -0.3531723, 1, 0, 0.1843137, 1,
1.992482, -0.3368222, 1.15105, 1, 0, 0.1803922, 1,
2.009846, 0.7803284, -0.1293775, 1, 0, 0.172549, 1,
2.034123, -1.172634, 2.468813, 1, 0, 0.1686275, 1,
2.050301, 0.6040447, 0.03861149, 1, 0, 0.1607843, 1,
2.050564, -0.9307163, 2.505435, 1, 0, 0.1568628, 1,
2.060884, -0.2163909, 0.624065, 1, 0, 0.1490196, 1,
2.060954, 1.053648, 0.7042859, 1, 0, 0.145098, 1,
2.082248, 0.3703218, 1.146805, 1, 0, 0.1372549, 1,
2.143756, -1.271136, 2.220256, 1, 0, 0.1333333, 1,
2.227242, 0.5426819, -0.6003029, 1, 0, 0.1254902, 1,
2.241575, 2.000588, 0.4033622, 1, 0, 0.1215686, 1,
2.247188, -1.00707, 2.095989, 1, 0, 0.1137255, 1,
2.256226, -0.1311098, 2.27434, 1, 0, 0.1098039, 1,
2.281416, -1.735751, 1.749177, 1, 0, 0.1019608, 1,
2.318749, 0.6739196, 0.8188038, 1, 0, 0.09411765, 1,
2.33049, -1.440729, 1.391616, 1, 0, 0.09019608, 1,
2.334758, -0.3313194, 0.8378911, 1, 0, 0.08235294, 1,
2.357286, 2.177446, 1.023821, 1, 0, 0.07843138, 1,
2.434908, -0.02427836, 0.06277605, 1, 0, 0.07058824, 1,
2.441677, -0.8871984, 1.170335, 1, 0, 0.06666667, 1,
2.455364, -1.036363, 2.013191, 1, 0, 0.05882353, 1,
2.459956, -0.6912231, 1.090728, 1, 0, 0.05490196, 1,
2.496148, -0.02193338, 2.266378, 1, 0, 0.04705882, 1,
2.527174, -0.07367191, 1.687614, 1, 0, 0.04313726, 1,
2.584612, -0.4825318, 1.513298, 1, 0, 0.03529412, 1,
2.591753, -0.2435997, 1.768904, 1, 0, 0.03137255, 1,
2.675193, -0.1591612, 1.468413, 1, 0, 0.02352941, 1,
2.748654, -0.731832, 0.8415627, 1, 0, 0.01960784, 1,
3.151415, -0.966042, 2.866925, 1, 0, 0.01176471, 1,
3.289919, 0.36335, 2.48513, 1, 0, 0.007843138, 1
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
0.182582, -4.254312, -7.534572, 0, -0.5, 0.5, 0.5,
0.182582, -4.254312, -7.534572, 1, -0.5, 0.5, 0.5,
0.182582, -4.254312, -7.534572, 1, 1.5, 0.5, 0.5,
0.182582, -4.254312, -7.534572, 0, 1.5, 0.5, 0.5
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
-3.978143, -0.1244276, -7.534572, 0, -0.5, 0.5, 0.5,
-3.978143, -0.1244276, -7.534572, 1, -0.5, 0.5, 0.5,
-3.978143, -0.1244276, -7.534572, 1, 1.5, 0.5, 0.5,
-3.978143, -0.1244276, -7.534572, 0, 1.5, 0.5, 0.5
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
-3.978143, -4.254312, -0.09955931, 0, -0.5, 0.5, 0.5,
-3.978143, -4.254312, -0.09955931, 1, -0.5, 0.5, 0.5,
-3.978143, -4.254312, -0.09955931, 1, 1.5, 0.5, 0.5,
-3.978143, -4.254312, -0.09955931, 0, 1.5, 0.5, 0.5
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
-2, -3.301261, -5.8188,
3, -3.301261, -5.8188,
-2, -3.301261, -5.8188,
-2, -3.460103, -6.104762,
-1, -3.301261, -5.8188,
-1, -3.460103, -6.104762,
0, -3.301261, -5.8188,
0, -3.460103, -6.104762,
1, -3.301261, -5.8188,
1, -3.460103, -6.104762,
2, -3.301261, -5.8188,
2, -3.460103, -6.104762,
3, -3.301261, -5.8188,
3, -3.460103, -6.104762
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
-2, -3.777786, -6.676686, 0, -0.5, 0.5, 0.5,
-2, -3.777786, -6.676686, 1, -0.5, 0.5, 0.5,
-2, -3.777786, -6.676686, 1, 1.5, 0.5, 0.5,
-2, -3.777786, -6.676686, 0, 1.5, 0.5, 0.5,
-1, -3.777786, -6.676686, 0, -0.5, 0.5, 0.5,
-1, -3.777786, -6.676686, 1, -0.5, 0.5, 0.5,
-1, -3.777786, -6.676686, 1, 1.5, 0.5, 0.5,
-1, -3.777786, -6.676686, 0, 1.5, 0.5, 0.5,
0, -3.777786, -6.676686, 0, -0.5, 0.5, 0.5,
0, -3.777786, -6.676686, 1, -0.5, 0.5, 0.5,
0, -3.777786, -6.676686, 1, 1.5, 0.5, 0.5,
0, -3.777786, -6.676686, 0, 1.5, 0.5, 0.5,
1, -3.777786, -6.676686, 0, -0.5, 0.5, 0.5,
1, -3.777786, -6.676686, 1, -0.5, 0.5, 0.5,
1, -3.777786, -6.676686, 1, 1.5, 0.5, 0.5,
1, -3.777786, -6.676686, 0, 1.5, 0.5, 0.5,
2, -3.777786, -6.676686, 0, -0.5, 0.5, 0.5,
2, -3.777786, -6.676686, 1, -0.5, 0.5, 0.5,
2, -3.777786, -6.676686, 1, 1.5, 0.5, 0.5,
2, -3.777786, -6.676686, 0, 1.5, 0.5, 0.5,
3, -3.777786, -6.676686, 0, -0.5, 0.5, 0.5,
3, -3.777786, -6.676686, 1, -0.5, 0.5, 0.5,
3, -3.777786, -6.676686, 1, 1.5, 0.5, 0.5,
3, -3.777786, -6.676686, 0, 1.5, 0.5, 0.5
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
-3.017976, -3, -5.8188,
-3.017976, 2, -5.8188,
-3.017976, -3, -5.8188,
-3.178003, -3, -6.104762,
-3.017976, -2, -5.8188,
-3.178003, -2, -6.104762,
-3.017976, -1, -5.8188,
-3.178003, -1, -6.104762,
-3.017976, 0, -5.8188,
-3.178003, 0, -6.104762,
-3.017976, 1, -5.8188,
-3.178003, 1, -6.104762,
-3.017976, 2, -5.8188,
-3.178003, 2, -6.104762
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
-3.498059, -3, -6.676686, 0, -0.5, 0.5, 0.5,
-3.498059, -3, -6.676686, 1, -0.5, 0.5, 0.5,
-3.498059, -3, -6.676686, 1, 1.5, 0.5, 0.5,
-3.498059, -3, -6.676686, 0, 1.5, 0.5, 0.5,
-3.498059, -2, -6.676686, 0, -0.5, 0.5, 0.5,
-3.498059, -2, -6.676686, 1, -0.5, 0.5, 0.5,
-3.498059, -2, -6.676686, 1, 1.5, 0.5, 0.5,
-3.498059, -2, -6.676686, 0, 1.5, 0.5, 0.5,
-3.498059, -1, -6.676686, 0, -0.5, 0.5, 0.5,
-3.498059, -1, -6.676686, 1, -0.5, 0.5, 0.5,
-3.498059, -1, -6.676686, 1, 1.5, 0.5, 0.5,
-3.498059, -1, -6.676686, 0, 1.5, 0.5, 0.5,
-3.498059, 0, -6.676686, 0, -0.5, 0.5, 0.5,
-3.498059, 0, -6.676686, 1, -0.5, 0.5, 0.5,
-3.498059, 0, -6.676686, 1, 1.5, 0.5, 0.5,
-3.498059, 0, -6.676686, 0, 1.5, 0.5, 0.5,
-3.498059, 1, -6.676686, 0, -0.5, 0.5, 0.5,
-3.498059, 1, -6.676686, 1, -0.5, 0.5, 0.5,
-3.498059, 1, -6.676686, 1, 1.5, 0.5, 0.5,
-3.498059, 1, -6.676686, 0, 1.5, 0.5, 0.5,
-3.498059, 2, -6.676686, 0, -0.5, 0.5, 0.5,
-3.498059, 2, -6.676686, 1, -0.5, 0.5, 0.5,
-3.498059, 2, -6.676686, 1, 1.5, 0.5, 0.5,
-3.498059, 2, -6.676686, 0, 1.5, 0.5, 0.5
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
-3.017976, -3.301261, -4,
-3.017976, -3.301261, 4,
-3.017976, -3.301261, -4,
-3.178003, -3.460103, -4,
-3.017976, -3.301261, -2,
-3.178003, -3.460103, -2,
-3.017976, -3.301261, 0,
-3.178003, -3.460103, 0,
-3.017976, -3.301261, 2,
-3.178003, -3.460103, 2,
-3.017976, -3.301261, 4,
-3.178003, -3.460103, 4
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
-3.498059, -3.777786, -4, 0, -0.5, 0.5, 0.5,
-3.498059, -3.777786, -4, 1, -0.5, 0.5, 0.5,
-3.498059, -3.777786, -4, 1, 1.5, 0.5, 0.5,
-3.498059, -3.777786, -4, 0, 1.5, 0.5, 0.5,
-3.498059, -3.777786, -2, 0, -0.5, 0.5, 0.5,
-3.498059, -3.777786, -2, 1, -0.5, 0.5, 0.5,
-3.498059, -3.777786, -2, 1, 1.5, 0.5, 0.5,
-3.498059, -3.777786, -2, 0, 1.5, 0.5, 0.5,
-3.498059, -3.777786, 0, 0, -0.5, 0.5, 0.5,
-3.498059, -3.777786, 0, 1, -0.5, 0.5, 0.5,
-3.498059, -3.777786, 0, 1, 1.5, 0.5, 0.5,
-3.498059, -3.777786, 0, 0, 1.5, 0.5, 0.5,
-3.498059, -3.777786, 2, 0, -0.5, 0.5, 0.5,
-3.498059, -3.777786, 2, 1, -0.5, 0.5, 0.5,
-3.498059, -3.777786, 2, 1, 1.5, 0.5, 0.5,
-3.498059, -3.777786, 2, 0, 1.5, 0.5, 0.5,
-3.498059, -3.777786, 4, 0, -0.5, 0.5, 0.5,
-3.498059, -3.777786, 4, 1, -0.5, 0.5, 0.5,
-3.498059, -3.777786, 4, 1, 1.5, 0.5, 0.5,
-3.498059, -3.777786, 4, 0, 1.5, 0.5, 0.5
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
-3.017976, -3.301261, -5.8188,
-3.017976, 3.052406, -5.8188,
-3.017976, -3.301261, 5.619681,
-3.017976, 3.052406, 5.619681,
-3.017976, -3.301261, -5.8188,
-3.017976, -3.301261, 5.619681,
-3.017976, 3.052406, -5.8188,
-3.017976, 3.052406, 5.619681,
-3.017976, -3.301261, -5.8188,
3.38314, -3.301261, -5.8188,
-3.017976, -3.301261, 5.619681,
3.38314, -3.301261, 5.619681,
-3.017976, 3.052406, -5.8188,
3.38314, 3.052406, -5.8188,
-3.017976, 3.052406, 5.619681,
3.38314, 3.052406, 5.619681,
3.38314, -3.301261, -5.8188,
3.38314, 3.052406, -5.8188,
3.38314, -3.301261, 5.619681,
3.38314, 3.052406, 5.619681,
3.38314, -3.301261, -5.8188,
3.38314, -3.301261, 5.619681,
3.38314, 3.052406, -5.8188,
3.38314, 3.052406, 5.619681
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
var radius = 7.778215;
var distance = 34.60616;
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
mvMatrix.translate( -0.182582, 0.1244276, 0.09955931 );
mvMatrix.scale( 1.313827, 1.323638, 0.7352338 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.60616);
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
trichlorophenyl_etha<-read.table("trichlorophenyl_etha.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-trichlorophenyl_etha$V2
```

```
## Error in eval(expr, envir, enclos): object 'trichlorophenyl_etha' not found
```

```r
y<-trichlorophenyl_etha$V3
```

```
## Error in eval(expr, envir, enclos): object 'trichlorophenyl_etha' not found
```

```r
z<-trichlorophenyl_etha$V4
```

```
## Error in eval(expr, envir, enclos): object 'trichlorophenyl_etha' not found
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
-2.924755, -0.555009, -3.094809, 0, 0, 1, 1, 1,
-2.767169, -0.9143522, -1.187681, 1, 0, 0, 1, 1,
-2.720321, -0.4689416, -1.3792, 1, 0, 0, 1, 1,
-2.615323, 0.4880672, 0.6441247, 1, 0, 0, 1, 1,
-2.59125, -0.3052572, -2.887306, 1, 0, 0, 1, 1,
-2.55879, 0.04334845, -0.6660588, 1, 0, 0, 1, 1,
-2.556734, -1.177184, -1.75382, 0, 0, 0, 1, 1,
-2.436672, -0.03006095, -1.266255, 0, 0, 0, 1, 1,
-2.248536, -0.2533507, -0.5894296, 0, 0, 0, 1, 1,
-2.245893, -1.140727, -1.176383, 0, 0, 0, 1, 1,
-2.244601, -1.818999, -2.893272, 0, 0, 0, 1, 1,
-2.123482, 0.8529662, -0.9746487, 0, 0, 0, 1, 1,
-2.118084, 0.6427971, 0.7836536, 0, 0, 0, 1, 1,
-2.085944, -0.5188879, -1.084127, 1, 1, 1, 1, 1,
-2.084579, -0.8640128, -1.987991, 1, 1, 1, 1, 1,
-2.027254, 2.434834, -1.492555, 1, 1, 1, 1, 1,
-2.001905, -0.08130564, -0.3389391, 1, 1, 1, 1, 1,
-1.990634, 0.3995261, -2.965981, 1, 1, 1, 1, 1,
-1.985153, -1.231971, -2.492474, 1, 1, 1, 1, 1,
-1.980026, -0.3896348, -3.006729, 1, 1, 1, 1, 1,
-1.938903, -0.08808258, -3.761156, 1, 1, 1, 1, 1,
-1.920251, 0.9812863, -2.839913, 1, 1, 1, 1, 1,
-1.918575, 0.0106137, -0.7392922, 1, 1, 1, 1, 1,
-1.91743, -0.2550868, -1.559677, 1, 1, 1, 1, 1,
-1.905682, -1.058276, -1.639441, 1, 1, 1, 1, 1,
-1.877989, 0.9543145, 0.3829249, 1, 1, 1, 1, 1,
-1.874168, 0.1837222, -2.112847, 1, 1, 1, 1, 1,
-1.869838, -0.09909721, -1.301008, 1, 1, 1, 1, 1,
-1.838486, 0.9806072, -0.9320951, 0, 0, 1, 1, 1,
-1.818098, 0.1099666, -1.721478, 1, 0, 0, 1, 1,
-1.807481, -1.549462, -3.82747, 1, 0, 0, 1, 1,
-1.801728, -0.08199281, -1.103383, 1, 0, 0, 1, 1,
-1.792729, 0.09250715, -2.973544, 1, 0, 0, 1, 1,
-1.768923, -0.9921023, -1.567623, 1, 0, 0, 1, 1,
-1.765181, -0.2286775, -1.570081, 0, 0, 0, 1, 1,
-1.755052, 0.8699574, -1.48457, 0, 0, 0, 1, 1,
-1.735112, 2.226537, 0.7124758, 0, 0, 0, 1, 1,
-1.718111, 0.5863973, -2.473667, 0, 0, 0, 1, 1,
-1.644249, 0.12578, -0.5671643, 0, 0, 0, 1, 1,
-1.632313, -0.7063736, 0.1545091, 0, 0, 0, 1, 1,
-1.62139, 0.07130215, -1.828751, 0, 0, 0, 1, 1,
-1.608839, 0.4752603, 0.08468661, 1, 1, 1, 1, 1,
-1.606297, -1.693754, -1.597502, 1, 1, 1, 1, 1,
-1.602946, 0.9509138, 0.01557517, 1, 1, 1, 1, 1,
-1.598633, -0.2477379, -0.377752, 1, 1, 1, 1, 1,
-1.5973, 0.2728295, -1.617227, 1, 1, 1, 1, 1,
-1.596141, -1.641337, -3.638708, 1, 1, 1, 1, 1,
-1.57764, -0.0784329, 0.4995027, 1, 1, 1, 1, 1,
-1.576999, -0.4204359, -0.5244746, 1, 1, 1, 1, 1,
-1.574595, 2.935474, 0.6083519, 1, 1, 1, 1, 1,
-1.5714, -2.343011, -1.139327, 1, 1, 1, 1, 1,
-1.569143, -0.008034526, -2.477733, 1, 1, 1, 1, 1,
-1.564094, 1.473252, -0.584402, 1, 1, 1, 1, 1,
-1.537969, -0.6750224, -1.48079, 1, 1, 1, 1, 1,
-1.526695, 0.2182917, -0.5618439, 1, 1, 1, 1, 1,
-1.524128, -0.4759501, -3.784536, 1, 1, 1, 1, 1,
-1.522776, 0.5680942, -0.6429732, 0, 0, 1, 1, 1,
-1.517634, -0.152607, -0.2880818, 1, 0, 0, 1, 1,
-1.494316, 0.3702607, -1.1294, 1, 0, 0, 1, 1,
-1.493284, 0.01252638, -2.685559, 1, 0, 0, 1, 1,
-1.490916, -0.2115425, -0.2725403, 1, 0, 0, 1, 1,
-1.490257, -0.003373579, 1.210382, 1, 0, 0, 1, 1,
-1.477705, -0.2398142, -1.308998, 0, 0, 0, 1, 1,
-1.464549, -1.251059, -0.9634005, 0, 0, 0, 1, 1,
-1.461185, -0.3083825, -0.8190235, 0, 0, 0, 1, 1,
-1.449919, -1.284625, -2.801223, 0, 0, 0, 1, 1,
-1.432162, -1.601347, -0.9979759, 0, 0, 0, 1, 1,
-1.432068, -0.2076052, -1.824734, 0, 0, 0, 1, 1,
-1.425833, -0.0007438856, -0.4864659, 0, 0, 0, 1, 1,
-1.422744, -2.536814, -2.236581, 1, 1, 1, 1, 1,
-1.416121, -1.362443, -1.356651, 1, 1, 1, 1, 1,
-1.413079, 0.5717577, -1.045054, 1, 1, 1, 1, 1,
-1.411465, -0.09688858, -1.321649, 1, 1, 1, 1, 1,
-1.399982, -0.3781428, -1.462206, 1, 1, 1, 1, 1,
-1.395272, 1.01707, -1.248949, 1, 1, 1, 1, 1,
-1.380092, 0.7184038, 0.3683306, 1, 1, 1, 1, 1,
-1.375105, -0.5258769, -2.141839, 1, 1, 1, 1, 1,
-1.373834, -1.608444, -3.013551, 1, 1, 1, 1, 1,
-1.373568, 0.2503633, -1.091906, 1, 1, 1, 1, 1,
-1.360116, 0.8713295, -0.6151839, 1, 1, 1, 1, 1,
-1.359079, -0.05942051, -2.110999, 1, 1, 1, 1, 1,
-1.349898, -1.285972, -2.724374, 1, 1, 1, 1, 1,
-1.347117, 1.224611, -0.7957637, 1, 1, 1, 1, 1,
-1.342022, -0.9055389, -2.669972, 1, 1, 1, 1, 1,
-1.326891, 0.2426177, -1.553986, 0, 0, 1, 1, 1,
-1.326041, -1.278584, -2.558032, 1, 0, 0, 1, 1,
-1.317745, -0.050143, -1.389514, 1, 0, 0, 1, 1,
-1.298689, -1.033414, -3.062366, 1, 0, 0, 1, 1,
-1.297946, -1.07574, -3.43991, 1, 0, 0, 1, 1,
-1.294531, -1.868391, -3.799599, 1, 0, 0, 1, 1,
-1.293402, 2.425171, -0.1146519, 0, 0, 0, 1, 1,
-1.285867, -0.001000942, -1.289, 0, 0, 0, 1, 1,
-1.272495, -0.4169241, -1.492487, 0, 0, 0, 1, 1,
-1.270425, 1.111915, 1.402827, 0, 0, 0, 1, 1,
-1.263327, 0.1149318, -2.184027, 0, 0, 0, 1, 1,
-1.261619, -0.3178365, -0.837028, 0, 0, 0, 1, 1,
-1.260694, -0.7491353, -3.09117, 0, 0, 0, 1, 1,
-1.259661, 0.05847246, -1.536284, 1, 1, 1, 1, 1,
-1.254402, 1.317776, 1.15301, 1, 1, 1, 1, 1,
-1.246694, 2.178729, -2.475436, 1, 1, 1, 1, 1,
-1.244043, -0.2425467, -0.04408778, 1, 1, 1, 1, 1,
-1.237707, 1.780673, -2.47477, 1, 1, 1, 1, 1,
-1.23019, -0.5328704, -1.24654, 1, 1, 1, 1, 1,
-1.229328, 0.9432151, -0.6029826, 1, 1, 1, 1, 1,
-1.225831, 0.7138121, -2.089927, 1, 1, 1, 1, 1,
-1.225504, 2.357018, 0.5457723, 1, 1, 1, 1, 1,
-1.21043, 0.4698242, -1.461686, 1, 1, 1, 1, 1,
-1.208889, -1.283511, -2.339719, 1, 1, 1, 1, 1,
-1.193211, -0.5376721, -0.9664509, 1, 1, 1, 1, 1,
-1.191629, -0.9180278, -3.109442, 1, 1, 1, 1, 1,
-1.190107, -0.02480401, -1.1115, 1, 1, 1, 1, 1,
-1.188121, 0.392318, 0.26824, 1, 1, 1, 1, 1,
-1.188069, 0.7507417, -0.6606816, 0, 0, 1, 1, 1,
-1.187678, -0.09658306, -0.5203386, 1, 0, 0, 1, 1,
-1.183411, -1.713515, -2.321437, 1, 0, 0, 1, 1,
-1.183094, -0.3907104, -1.214801, 1, 0, 0, 1, 1,
-1.182575, -1.432996, -2.731949, 1, 0, 0, 1, 1,
-1.180367, 0.6286377, -1.550313, 1, 0, 0, 1, 1,
-1.172144, 0.1007023, -1.275445, 0, 0, 0, 1, 1,
-1.169527, 0.5342008, -1.774973, 0, 0, 0, 1, 1,
-1.166358, 0.08421429, -0.3095314, 0, 0, 0, 1, 1,
-1.166112, -0.3644971, -1.018299, 0, 0, 0, 1, 1,
-1.163228, -1.533751, -1.936477, 0, 0, 0, 1, 1,
-1.158621, 1.503158, -0.2943826, 0, 0, 0, 1, 1,
-1.150841, -0.7020825, -3.426588, 0, 0, 0, 1, 1,
-1.150681, 1.332371, -1.763963, 1, 1, 1, 1, 1,
-1.141629, -0.4941596, -1.348047, 1, 1, 1, 1, 1,
-1.128622, 0.4779254, -2.788631, 1, 1, 1, 1, 1,
-1.128247, -1.181125, -2.576162, 1, 1, 1, 1, 1,
-1.121769, 1.600867, -0.1380821, 1, 1, 1, 1, 1,
-1.116193, -1.091819, -1.940001, 1, 1, 1, 1, 1,
-1.11487, -1.124578, -1.734421, 1, 1, 1, 1, 1,
-1.112236, 2.225494, -1.530821, 1, 1, 1, 1, 1,
-1.111678, 0.6258168, -0.3475394, 1, 1, 1, 1, 1,
-1.105219, -0.8448336, -2.341671, 1, 1, 1, 1, 1,
-1.102468, -0.8268966, -2.015159, 1, 1, 1, 1, 1,
-1.09423, 0.503179, -1.434212, 1, 1, 1, 1, 1,
-1.09045, 0.9917099, -0.5543967, 1, 1, 1, 1, 1,
-1.086852, -1.448893, -0.6370146, 1, 1, 1, 1, 1,
-1.079642, 0.8761224, 0.01708646, 1, 1, 1, 1, 1,
-1.079125, -1.017651, -3.068818, 0, 0, 1, 1, 1,
-1.06938, 0.05227482, -1.605366, 1, 0, 0, 1, 1,
-1.063474, -1.499264, -2.266531, 1, 0, 0, 1, 1,
-1.062433, -0.4741133, -3.020928, 1, 0, 0, 1, 1,
-1.0455, -1.286511, -2.222392, 1, 0, 0, 1, 1,
-1.045043, -1.20512, -3.774451, 1, 0, 0, 1, 1,
-1.044208, 0.2101903, -0.6421456, 0, 0, 0, 1, 1,
-1.042713, -1.24889, -2.399691, 0, 0, 0, 1, 1,
-1.041535, -0.7533927, -2.67383, 0, 0, 0, 1, 1,
-1.031636, 1.244883, 0.6157783, 0, 0, 0, 1, 1,
-1.029464, -1.164814, -2.840349, 0, 0, 0, 1, 1,
-1.028772, 1.616543, -0.6353958, 0, 0, 0, 1, 1,
-1.02757, -1.522985, -3.454868, 0, 0, 0, 1, 1,
-1.022983, -1.196582, -1.50374, 1, 1, 1, 1, 1,
-1.022552, 1.082375, -1.718968, 1, 1, 1, 1, 1,
-1.022399, 0.4979673, -1.456108, 1, 1, 1, 1, 1,
-1.019344, -0.3933616, -1.031849, 1, 1, 1, 1, 1,
-1.017789, 0.6876974, 1.331637, 1, 1, 1, 1, 1,
-1.01525, 0.7641604, -1.396523, 1, 1, 1, 1, 1,
-1.0149, 1.732662, -0.4743834, 1, 1, 1, 1, 1,
-1.010003, 0.301974, -1.554047, 1, 1, 1, 1, 1,
-1.004603, 0.1641185, -2.857276, 1, 1, 1, 1, 1,
-1.001312, -0.06544008, -2.682832, 1, 1, 1, 1, 1,
-1.001062, 0.4646159, -2.507822, 1, 1, 1, 1, 1,
-0.995146, 0.5084144, -0.5534505, 1, 1, 1, 1, 1,
-0.9937666, 0.6467131, -0.7658867, 1, 1, 1, 1, 1,
-0.99234, 0.4146669, -3.407845, 1, 1, 1, 1, 1,
-0.9880499, 0.678878, -1.841821, 1, 1, 1, 1, 1,
-0.9849185, -0.05315641, -2.039033, 0, 0, 1, 1, 1,
-0.9747329, -0.1556536, -1.853168, 1, 0, 0, 1, 1,
-0.9712421, 0.3034975, -1.193759, 1, 0, 0, 1, 1,
-0.9707415, 1.214024, 1.318533, 1, 0, 0, 1, 1,
-0.9649367, 0.5380973, -0.5620397, 1, 0, 0, 1, 1,
-0.9642652, -0.4782747, -3.384839, 1, 0, 0, 1, 1,
-0.9399983, 0.05299191, -1.822649, 0, 0, 0, 1, 1,
-0.9376535, -0.4466755, -2.406549, 0, 0, 0, 1, 1,
-0.9363121, -0.3369568, -0.7253129, 0, 0, 0, 1, 1,
-0.9339063, -0.2361917, -2.593811, 0, 0, 0, 1, 1,
-0.9329216, 1.517241, -2.101328, 0, 0, 0, 1, 1,
-0.9307641, -0.7703333, -2.16415, 0, 0, 0, 1, 1,
-0.9298455, 0.4439496, -1.24268, 0, 0, 0, 1, 1,
-0.9294461, -0.2119417, -0.3845484, 1, 1, 1, 1, 1,
-0.9242824, 0.7481724, -1.066858, 1, 1, 1, 1, 1,
-0.9231027, -0.03014225, -1.262061, 1, 1, 1, 1, 1,
-0.9223631, 1.666968, -0.7802064, 1, 1, 1, 1, 1,
-0.9194196, 1.059041, -2.434038, 1, 1, 1, 1, 1,
-0.8871704, -1.023031, -4.034037, 1, 1, 1, 1, 1,
-0.8822212, 1.225077, -0.5304458, 1, 1, 1, 1, 1,
-0.8793392, -0.4626265, -0.7435455, 1, 1, 1, 1, 1,
-0.8762266, 1.569669, 0.00707871, 1, 1, 1, 1, 1,
-0.8653041, 0.3942043, -1.378638, 1, 1, 1, 1, 1,
-0.8641654, 1.490083, 0.1355136, 1, 1, 1, 1, 1,
-0.8618793, 0.3865998, -2.168808, 1, 1, 1, 1, 1,
-0.8575765, -0.9709532, -1.841271, 1, 1, 1, 1, 1,
-0.8563234, 0.3323413, -1.488575, 1, 1, 1, 1, 1,
-0.8537674, -0.8159148, -0.6351792, 1, 1, 1, 1, 1,
-0.8457517, 0.2782204, -1.347772, 0, 0, 1, 1, 1,
-0.8439804, 1.078931, -0.09562583, 1, 0, 0, 1, 1,
-0.8385872, 0.3496045, 0.5955899, 1, 0, 0, 1, 1,
-0.8360398, -1.383236, -0.3952257, 1, 0, 0, 1, 1,
-0.8297728, 1.119149, -0.1474285, 1, 0, 0, 1, 1,
-0.8228391, 1.710703, 0.6257191, 1, 0, 0, 1, 1,
-0.8226899, -0.9670714, -1.864381, 0, 0, 0, 1, 1,
-0.8207403, -0.1429273, -1.40659, 0, 0, 0, 1, 1,
-0.8199109, -0.3392843, -2.022318, 0, 0, 0, 1, 1,
-0.7920142, 0.1454539, 0.2418702, 0, 0, 0, 1, 1,
-0.7887254, 1.247836, 0.4939305, 0, 0, 0, 1, 1,
-0.7885251, -0.8897277, -1.761917, 0, 0, 0, 1, 1,
-0.7680438, -0.5421243, -1.976984, 0, 0, 0, 1, 1,
-0.756432, 1.221659, 0.444821, 1, 1, 1, 1, 1,
-0.7483707, 0.397984, -3.304426, 1, 1, 1, 1, 1,
-0.7416286, 0.05644746, -0.6759416, 1, 1, 1, 1, 1,
-0.741224, 2.213418, -0.7237939, 1, 1, 1, 1, 1,
-0.738051, -0.3321602, -2.209533, 1, 1, 1, 1, 1,
-0.7374842, -1.231099, -3.131573, 1, 1, 1, 1, 1,
-0.7318339, -0.2863351, -1.642778, 1, 1, 1, 1, 1,
-0.7271695, -0.06898711, -2.103147, 1, 1, 1, 1, 1,
-0.7226858, -1.065721, -1.639551, 1, 1, 1, 1, 1,
-0.7191423, 0.2929795, -1.52579, 1, 1, 1, 1, 1,
-0.7172665, -0.1663035, -2.971934, 1, 1, 1, 1, 1,
-0.7145174, -2.148325, -2.220618, 1, 1, 1, 1, 1,
-0.7102361, 0.4693992, -2.244012, 1, 1, 1, 1, 1,
-0.7095736, 0.5588265, -2.644911, 1, 1, 1, 1, 1,
-0.70885, 1.752125, -0.03172493, 1, 1, 1, 1, 1,
-0.7055219, 0.1111599, -3.216497, 0, 0, 1, 1, 1,
-0.7011556, 0.1133436, -2.950004, 1, 0, 0, 1, 1,
-0.7010545, -0.7515708, -3.822357, 1, 0, 0, 1, 1,
-0.6945243, 2.959877, -0.3787902, 1, 0, 0, 1, 1,
-0.6882476, 0.02665156, -2.074616, 1, 0, 0, 1, 1,
-0.6859646, -0.2902014, -2.219345, 1, 0, 0, 1, 1,
-0.6763769, 0.7026502, -1.862401, 0, 0, 0, 1, 1,
-0.6762738, -1.510467, -1.79862, 0, 0, 0, 1, 1,
-0.6731213, 1.455702, -0.2697917, 0, 0, 0, 1, 1,
-0.6677397, -1.771095, -2.989947, 0, 0, 0, 1, 1,
-0.6666256, 2.395322, -0.9553407, 0, 0, 0, 1, 1,
-0.6612672, 0.805952, 0.2193262, 0, 0, 0, 1, 1,
-0.6595234, 0.1733056, -0.8042048, 0, 0, 0, 1, 1,
-0.6475509, -0.3197948, -2.501772, 1, 1, 1, 1, 1,
-0.647536, 0.1643638, -1.06826, 1, 1, 1, 1, 1,
-0.6454164, 1.993599, 0.2102017, 1, 1, 1, 1, 1,
-0.6410455, 0.001044635, -2.595198, 1, 1, 1, 1, 1,
-0.6404245, 0.6856502, -0.7377507, 1, 1, 1, 1, 1,
-0.630286, -0.644049, -0.1257748, 1, 1, 1, 1, 1,
-0.6293741, 0.1737747, -1.374443, 1, 1, 1, 1, 1,
-0.6262106, -1.441658, -4.328398, 1, 1, 1, 1, 1,
-0.6250033, 0.5283616, -1.354489, 1, 1, 1, 1, 1,
-0.6241383, -2.914398, -2.065366, 1, 1, 1, 1, 1,
-0.622314, 0.1533709, -0.3529647, 1, 1, 1, 1, 1,
-0.6195766, -0.6005391, -0.1199554, 1, 1, 1, 1, 1,
-0.6151587, -0.06020901, -2.659567, 1, 1, 1, 1, 1,
-0.6074334, -1.431177, -3.402114, 1, 1, 1, 1, 1,
-0.6044765, 0.2810395, -0.7815716, 1, 1, 1, 1, 1,
-0.6019132, 0.542433, -2.444602, 0, 0, 1, 1, 1,
-0.6007213, 0.5242884, -0.9607811, 1, 0, 0, 1, 1,
-0.5965116, 1.72949, 0.1510384, 1, 0, 0, 1, 1,
-0.5913399, 1.068664, -3.558909, 1, 0, 0, 1, 1,
-0.5910794, -1.734812, -3.083469, 1, 0, 0, 1, 1,
-0.5895275, -0.1849579, -2.684225, 1, 0, 0, 1, 1,
-0.5882044, -1.935562, -2.825361, 0, 0, 0, 1, 1,
-0.5866535, 0.4911276, 0.5760722, 0, 0, 0, 1, 1,
-0.5863138, -1.670818, -3.131311, 0, 0, 0, 1, 1,
-0.5772254, -2.38544, -2.63897, 0, 0, 0, 1, 1,
-0.5653435, 0.7446314, -1.874968, 0, 0, 0, 1, 1,
-0.563114, 0.8892807, -1.254683, 0, 0, 0, 1, 1,
-0.5610879, 0.741895, 0.3490958, 0, 0, 0, 1, 1,
-0.5609858, 1.159344, -0.05519935, 1, 1, 1, 1, 1,
-0.5477197, 0.7415358, -1.223861, 1, 1, 1, 1, 1,
-0.5460436, 1.152223, 0.2724057, 1, 1, 1, 1, 1,
-0.5435496, 0.6611024, -2.582236, 1, 1, 1, 1, 1,
-0.5387704, 0.191687, -1.527584, 1, 1, 1, 1, 1,
-0.538388, -0.1732133, -2.7663, 1, 1, 1, 1, 1,
-0.5380331, 2.387412, 0.3736722, 1, 1, 1, 1, 1,
-0.5293429, 0.8066404, 1.313585, 1, 1, 1, 1, 1,
-0.529034, 1.141668, -0.7616455, 1, 1, 1, 1, 1,
-0.5278125, -0.216706, -2.134336, 1, 1, 1, 1, 1,
-0.5201315, 1.175716, -2.340234, 1, 1, 1, 1, 1,
-0.5182001, 0.270873, 0.90833, 1, 1, 1, 1, 1,
-0.5151265, -0.9137658, -3.65557, 1, 1, 1, 1, 1,
-0.5142635, 0.1054945, -2.408702, 1, 1, 1, 1, 1,
-0.5124058, 1.845006, 0.5150046, 1, 1, 1, 1, 1,
-0.5100844, 1.759982, 0.5217247, 0, 0, 1, 1, 1,
-0.5080609, -0.1096542, -1.270274, 1, 0, 0, 1, 1,
-0.5026401, 1.217477, 0.1768775, 1, 0, 0, 1, 1,
-0.501538, 0.4194202, -2.527575, 1, 0, 0, 1, 1,
-0.4995779, -1.394214, -3.100433, 1, 0, 0, 1, 1,
-0.4993869, -1.36447, -2.078848, 1, 0, 0, 1, 1,
-0.4984361, 0.6981824, -1.331076, 0, 0, 0, 1, 1,
-0.4977437, 0.5927576, -0.4827102, 0, 0, 0, 1, 1,
-0.4948224, 0.1084775, -0.4774936, 0, 0, 0, 1, 1,
-0.4908779, 0.3723575, -2.868808, 0, 0, 0, 1, 1,
-0.4850242, -0.904967, -5.581265, 0, 0, 0, 1, 1,
-0.4849932, -0.4750684, -2.532209, 0, 0, 0, 1, 1,
-0.4848129, 0.6538055, -0.8858852, 0, 0, 0, 1, 1,
-0.4843639, 0.5308442, -0.9590147, 1, 1, 1, 1, 1,
-0.4842957, 0.9166457, -0.4477483, 1, 1, 1, 1, 1,
-0.477393, 1.57771, 0.4498376, 1, 1, 1, 1, 1,
-0.4758619, 1.237318, -1.832632, 1, 1, 1, 1, 1,
-0.4709123, 1.145534, -1.636959, 1, 1, 1, 1, 1,
-0.4701535, 1.411707, -0.5770758, 1, 1, 1, 1, 1,
-0.4679032, -2.010518, -3.971848, 1, 1, 1, 1, 1,
-0.4678291, -0.4586268, -1.713637, 1, 1, 1, 1, 1,
-0.4663967, 0.8921383, -1.035854, 1, 1, 1, 1, 1,
-0.4652742, 0.9556134, -1.813895, 1, 1, 1, 1, 1,
-0.4630325, 0.3419215, -1.090821, 1, 1, 1, 1, 1,
-0.4621494, -0.7030458, -2.908806, 1, 1, 1, 1, 1,
-0.4616567, 0.489992, -0.2895277, 1, 1, 1, 1, 1,
-0.4584717, 2.051989, 0.8873249, 1, 1, 1, 1, 1,
-0.4578905, -0.1510076, -2.012589, 1, 1, 1, 1, 1,
-0.4552132, -2.192981, -2.582546, 0, 0, 1, 1, 1,
-0.4501882, 0.9899127, -1.327659, 1, 0, 0, 1, 1,
-0.446932, 1.045722, -1.298087, 1, 0, 0, 1, 1,
-0.4468612, -0.7190458, -2.558816, 1, 0, 0, 1, 1,
-0.4457567, -0.1920711, -3.443387, 1, 0, 0, 1, 1,
-0.4322895, -1.124092, -4.048681, 1, 0, 0, 1, 1,
-0.4318963, 0.02649741, 0.2412305, 0, 0, 0, 1, 1,
-0.4290944, -2.67486, -3.853378, 0, 0, 0, 1, 1,
-0.428692, 0.6210019, -2.168476, 0, 0, 0, 1, 1,
-0.419041, 0.6212345, -0.7553066, 0, 0, 0, 1, 1,
-0.4176049, -0.9411354, 0.9513015, 0, 0, 0, 1, 1,
-0.4140867, -0.4806932, -1.515726, 0, 0, 0, 1, 1,
-0.4106949, -0.5884215, -1.472454, 0, 0, 0, 1, 1,
-0.4079439, 1.055435, -1.003657, 1, 1, 1, 1, 1,
-0.4039648, 0.3468584, -0.03677363, 1, 1, 1, 1, 1,
-0.4035386, 0.2496157, -1.667285, 1, 1, 1, 1, 1,
-0.4032291, 2.449063, -0.009599307, 1, 1, 1, 1, 1,
-0.4021457, -1.48592, -3.773339, 1, 1, 1, 1, 1,
-0.4011225, 1.120102, -0.4795136, 1, 1, 1, 1, 1,
-0.3941658, 1.595874, -0.9682575, 1, 1, 1, 1, 1,
-0.3815666, 0.5117359, -0.4593858, 1, 1, 1, 1, 1,
-0.3796038, -0.1456336, -0.7475398, 1, 1, 1, 1, 1,
-0.3785837, -1.664997, -3.801422, 1, 1, 1, 1, 1,
-0.3773302, 0.2162795, -2.037732, 1, 1, 1, 1, 1,
-0.3720436, -1.400616, -3.281555, 1, 1, 1, 1, 1,
-0.3696913, -1.17415, -3.85906, 1, 1, 1, 1, 1,
-0.3658616, 0.7276456, -0.5073767, 1, 1, 1, 1, 1,
-0.3640401, 0.7751771, -1.103911, 1, 1, 1, 1, 1,
-0.3624628, -1.892246, -3.132575, 0, 0, 1, 1, 1,
-0.3593996, -0.6012732, -4.533231, 1, 0, 0, 1, 1,
-0.3571309, -0.03295628, -2.435691, 1, 0, 0, 1, 1,
-0.3535008, 0.365214, -1.180389, 1, 0, 0, 1, 1,
-0.3469216, -0.06932762, -2.057978, 1, 0, 0, 1, 1,
-0.3466224, 0.5544053, -0.4766102, 1, 0, 0, 1, 1,
-0.3453872, 1.236682, 0.3008691, 0, 0, 0, 1, 1,
-0.3381643, 2.002959, -0.3048698, 0, 0, 0, 1, 1,
-0.3319441, -0.7916316, -1.394851, 0, 0, 0, 1, 1,
-0.3315023, 0.1774692, -1.862213, 0, 0, 0, 1, 1,
-0.3281595, 0.6538212, 1.700075, 0, 0, 0, 1, 1,
-0.3174771, 0.5246681, -0.9532336, 0, 0, 0, 1, 1,
-0.3174181, 0.3225617, -0.7553785, 0, 0, 0, 1, 1,
-0.3171043, 0.2274662, -0.05903914, 1, 1, 1, 1, 1,
-0.3167129, -0.7880493, -2.083672, 1, 1, 1, 1, 1,
-0.3136554, 0.718185, 0.7582933, 1, 1, 1, 1, 1,
-0.3097304, 1.661113, 0.6414124, 1, 1, 1, 1, 1,
-0.3084336, 0.4861348, -2.656626, 1, 1, 1, 1, 1,
-0.3047517, 0.374887, -0.3288434, 1, 1, 1, 1, 1,
-0.3017386, -0.7086173, -3.373633, 1, 1, 1, 1, 1,
-0.3004932, 0.3461298, 0.539817, 1, 1, 1, 1, 1,
-0.3004621, -2.245071, -3.647862, 1, 1, 1, 1, 1,
-0.299226, 0.9663681, 0.6988961, 1, 1, 1, 1, 1,
-0.2945577, -0.156167, -0.8454507, 1, 1, 1, 1, 1,
-0.2938994, 0.5911872, 2.195285, 1, 1, 1, 1, 1,
-0.2918078, -0.3136771, -1.202495, 1, 1, 1, 1, 1,
-0.2917729, 1.295255, -1.583689, 1, 1, 1, 1, 1,
-0.2916451, -1.258292, -4.221895, 1, 1, 1, 1, 1,
-0.287804, 1.436323, 0.0848406, 0, 0, 1, 1, 1,
-0.285122, -0.1267003, -0.04144161, 1, 0, 0, 1, 1,
-0.2768991, 0.9988452, -0.4819088, 1, 0, 0, 1, 1,
-0.275798, 1.72205, 0.8440783, 1, 0, 0, 1, 1,
-0.2727315, 1.176975, -0.5539237, 1, 0, 0, 1, 1,
-0.2720141, 1.618218, -1.30246, 1, 0, 0, 1, 1,
-0.2664191, 0.1776568, -0.02875619, 0, 0, 0, 1, 1,
-0.2642579, -0.06492393, 1.365402, 0, 0, 0, 1, 1,
-0.2638529, 1.002012, 0.372784, 0, 0, 0, 1, 1,
-0.2617927, 0.4544637, -1.632181, 0, 0, 0, 1, 1,
-0.2563262, -1.418501, -3.706201, 0, 0, 0, 1, 1,
-0.2560576, -0.4976805, -2.817771, 0, 0, 0, 1, 1,
-0.2540296, -1.540151, -3.831871, 0, 0, 0, 1, 1,
-0.2531417, -2.333745, -5.65222, 1, 1, 1, 1, 1,
-0.2521065, -0.9446669, -0.4974822, 1, 1, 1, 1, 1,
-0.2386049, -1.519375, -2.758222, 1, 1, 1, 1, 1,
-0.2377045, 0.205934, 0.4373346, 1, 1, 1, 1, 1,
-0.2340783, 0.1780245, -2.180349, 1, 1, 1, 1, 1,
-0.2335673, 2.264912, 0.2229417, 1, 1, 1, 1, 1,
-0.2306572, 0.1753531, -1.957329, 1, 1, 1, 1, 1,
-0.2220245, -0.1755495, -2.155441, 1, 1, 1, 1, 1,
-0.2160179, -0.535265, -2.989424, 1, 1, 1, 1, 1,
-0.2150954, -0.3673109, -2.534745, 1, 1, 1, 1, 1,
-0.2137596, -1.154967, -4.101045, 1, 1, 1, 1, 1,
-0.2106822, 1.752128, -0.114108, 1, 1, 1, 1, 1,
-0.2082208, 0.1016813, 0.7413187, 1, 1, 1, 1, 1,
-0.2074913, 0.1126325, 0.01844614, 1, 1, 1, 1, 1,
-0.2073165, 0.397411, -0.908555, 1, 1, 1, 1, 1,
-0.205653, -0.01177526, -2.734931, 0, 0, 1, 1, 1,
-0.2008149, 0.6126539, -1.326552, 1, 0, 0, 1, 1,
-0.1989312, 0.002678483, -0.1682352, 1, 0, 0, 1, 1,
-0.1949438, 0.8826006, -0.2049373, 1, 0, 0, 1, 1,
-0.1867034, 0.6342931, -1.471492, 1, 0, 0, 1, 1,
-0.1860635, 0.06576698, -0.3994374, 1, 0, 0, 1, 1,
-0.1844604, 1.256795, -0.5756276, 0, 0, 0, 1, 1,
-0.1820403, 1.293858, -1.850211, 0, 0, 0, 1, 1,
-0.1819282, 2.0285, -0.7862404, 0, 0, 0, 1, 1,
-0.1816958, 0.2922641, -0.4097331, 0, 0, 0, 1, 1,
-0.17996, 0.6926207, 0.2075465, 0, 0, 0, 1, 1,
-0.1729898, -0.6760257, -0.4539953, 0, 0, 0, 1, 1,
-0.1701519, -0.496327, -3.9132, 0, 0, 0, 1, 1,
-0.1685173, 1.54988, 0.3495515, 1, 1, 1, 1, 1,
-0.1652372, -1.836485, -2.947387, 1, 1, 1, 1, 1,
-0.1624562, 0.7101508, 2.142444, 1, 1, 1, 1, 1,
-0.1624207, -0.2187014, -1.544113, 1, 1, 1, 1, 1,
-0.1602076, -1.885699, -3.699482, 1, 1, 1, 1, 1,
-0.1537296, 2.113707, -1.196335, 1, 1, 1, 1, 1,
-0.1473334, -0.882811, -3.507369, 1, 1, 1, 1, 1,
-0.1468442, -1.560387, -1.771626, 1, 1, 1, 1, 1,
-0.1424865, -1.983703, -1.872715, 1, 1, 1, 1, 1,
-0.1396812, 1.378071, 0.3354193, 1, 1, 1, 1, 1,
-0.1390147, -0.5428512, -0.5903849, 1, 1, 1, 1, 1,
-0.1376147, -0.8564063, -2.570904, 1, 1, 1, 1, 1,
-0.1353006, -0.3765684, -2.0235, 1, 1, 1, 1, 1,
-0.1308115, -0.002951608, -0.5949456, 1, 1, 1, 1, 1,
-0.1306954, -0.7533991, -4.62025, 1, 1, 1, 1, 1,
-0.1279279, -1.053328, -2.404161, 0, 0, 1, 1, 1,
-0.1226544, -1.219905, -4.836502, 1, 0, 0, 1, 1,
-0.1170256, -0.7401053, -4.36238, 1, 0, 0, 1, 1,
-0.1152145, 1.122524, -0.117545, 1, 0, 0, 1, 1,
-0.1114104, -0.6151954, -2.019454, 1, 0, 0, 1, 1,
-0.1029193, -0.0008258073, -1.622772, 1, 0, 0, 1, 1,
-0.0971792, -3.208732, -3.704462, 0, 0, 0, 1, 1,
-0.09445994, -0.1173154, -3.473642, 0, 0, 0, 1, 1,
-0.09376387, 0.2791196, 0.5990836, 0, 0, 0, 1, 1,
-0.09214262, 0.2008797, 0.04731585, 0, 0, 0, 1, 1,
-0.08688316, 0.3195349, -0.8679959, 0, 0, 0, 1, 1,
-0.08650832, 1.227435, -1.099818, 0, 0, 0, 1, 1,
-0.08302364, 0.1007207, 1.508594, 0, 0, 0, 1, 1,
-0.08157177, -2.517763, -5.098122, 1, 1, 1, 1, 1,
-0.07938921, 0.2321268, -2.739912, 1, 1, 1, 1, 1,
-0.07793924, 1.647067, -1.191004, 1, 1, 1, 1, 1,
-0.07786965, 0.4655135, 0.3852045, 1, 1, 1, 1, 1,
-0.07704654, 0.9270325, 0.8213019, 1, 1, 1, 1, 1,
-0.07547399, -1.84805, -2.8463, 1, 1, 1, 1, 1,
-0.07254649, -0.6217509, -2.930327, 1, 1, 1, 1, 1,
-0.06978332, -0.6447425, -2.565357, 1, 1, 1, 1, 1,
-0.05952084, 0.2038521, 0.3839158, 1, 1, 1, 1, 1,
-0.05621989, 1.069697, 0.7240436, 1, 1, 1, 1, 1,
-0.05435354, -0.6481546, -3.292918, 1, 1, 1, 1, 1,
-0.05168375, 0.7129582, -0.9430032, 1, 1, 1, 1, 1,
-0.0511205, 0.2475111, -0.6923512, 1, 1, 1, 1, 1,
-0.05053699, -1.208841, -3.243118, 1, 1, 1, 1, 1,
-0.04706738, 0.1531818, -1.288719, 1, 1, 1, 1, 1,
-0.04501166, 0.2976546, -0.2134519, 0, 0, 1, 1, 1,
-0.04463978, 1.361161, -0.0708046, 1, 0, 0, 1, 1,
-0.04299906, 1.396334, 0.376669, 1, 0, 0, 1, 1,
-0.04060873, -1.01437, -4.137659, 1, 0, 0, 1, 1,
-0.03890735, -1.482408, -3.837496, 1, 0, 0, 1, 1,
-0.02821676, 2.105506, -0.2496754, 1, 0, 0, 1, 1,
-0.02807165, -0.8657582, -4.564768, 0, 0, 0, 1, 1,
-0.02413279, 1.714258, 1.125914, 0, 0, 0, 1, 1,
-0.02216336, 0.7400221, 0.3043252, 0, 0, 0, 1, 1,
-0.02048319, -0.7391988, -2.597959, 0, 0, 0, 1, 1,
-0.01100505, 0.4140476, -0.3917088, 0, 0, 0, 1, 1,
-0.003375415, -0.4319695, -3.132759, 0, 0, 0, 1, 1,
-0.002399213, 1.652377, -0.3262275, 0, 0, 0, 1, 1,
0.0008559912, -0.8759396, 3.141077, 1, 1, 1, 1, 1,
0.003468105, 1.450608, -1.125787, 1, 1, 1, 1, 1,
0.004466689, -0.6903157, 2.150806, 1, 1, 1, 1, 1,
0.01048607, -1.285926, 2.835006, 1, 1, 1, 1, 1,
0.01327494, -0.7638057, 2.524366, 1, 1, 1, 1, 1,
0.01802141, -0.7154437, 2.725739, 1, 1, 1, 1, 1,
0.02179044, -1.217898, 3.92998, 1, 1, 1, 1, 1,
0.02257591, 0.5539097, -1.233348, 1, 1, 1, 1, 1,
0.02420448, 0.5526791, -1.704364, 1, 1, 1, 1, 1,
0.02903458, 0.229992, -0.08747217, 1, 1, 1, 1, 1,
0.03586926, -1.350506, 3.391088, 1, 1, 1, 1, 1,
0.03768709, 1.167348, -0.3564399, 1, 1, 1, 1, 1,
0.03891271, -0.879042, 4.387719, 1, 1, 1, 1, 1,
0.04467907, -0.3573476, 2.659745, 1, 1, 1, 1, 1,
0.04985854, -0.5255005, 3.448417, 1, 1, 1, 1, 1,
0.05118478, 0.008931926, 2.388876, 0, 0, 1, 1, 1,
0.05510136, 0.8716337, -0.1715235, 1, 0, 0, 1, 1,
0.05943175, -0.2789089, 3.965345, 1, 0, 0, 1, 1,
0.06421924, -0.09113389, 3.193905, 1, 0, 0, 1, 1,
0.06515712, -1.542318, 1.103794, 1, 0, 0, 1, 1,
0.06571406, 2.181615, -0.4136487, 1, 0, 0, 1, 1,
0.06923018, -1.014831, 3.413122, 0, 0, 0, 1, 1,
0.07144523, 0.5631121, -0.4548847, 0, 0, 0, 1, 1,
0.07182877, 0.2334748, 0.822861, 0, 0, 0, 1, 1,
0.07391951, -0.008724966, 0.9183949, 0, 0, 0, 1, 1,
0.07615859, -1.119524, 4.377069, 0, 0, 0, 1, 1,
0.0770719, -1.130855, 2.120923, 0, 0, 0, 1, 1,
0.07841413, 0.5261578, 1.89046, 0, 0, 0, 1, 1,
0.08119988, -0.7589337, 2.45611, 1, 1, 1, 1, 1,
0.08212741, 1.545106, -0.5915276, 1, 1, 1, 1, 1,
0.08266582, -1.46682, 3.672634, 1, 1, 1, 1, 1,
0.0835363, 0.1461615, 1.369667, 1, 1, 1, 1, 1,
0.08593494, -1.305777, 3.933367, 1, 1, 1, 1, 1,
0.08686782, -0.668672, 3.859009, 1, 1, 1, 1, 1,
0.08754511, -0.8938884, 4.605221, 1, 1, 1, 1, 1,
0.09275953, 0.1674812, 1.368521, 1, 1, 1, 1, 1,
0.101459, -1.318665, 3.53407, 1, 1, 1, 1, 1,
0.1020744, 0.8371139, -1.630761, 1, 1, 1, 1, 1,
0.1025003, -1.780647, 3.400965, 1, 1, 1, 1, 1,
0.10413, 1.056405, 1.149201, 1, 1, 1, 1, 1,
0.1057738, 0.4264495, 0.28629, 1, 1, 1, 1, 1,
0.1106953, -1.541089, 2.411036, 1, 1, 1, 1, 1,
0.1114237, -0.1081695, 0.873767, 1, 1, 1, 1, 1,
0.1136327, 0.3230971, 0.1028606, 0, 0, 1, 1, 1,
0.1136342, -0.3681759, 3.764974, 1, 0, 0, 1, 1,
0.115271, 0.03244792, 0.5804915, 1, 0, 0, 1, 1,
0.1159383, -0.3249319, 3.983808, 1, 0, 0, 1, 1,
0.1167019, -0.2643769, 2.826674, 1, 0, 0, 1, 1,
0.1170779, -1.137368, 3.491899, 1, 0, 0, 1, 1,
0.1211554, -1.025713, 3.730512, 0, 0, 0, 1, 1,
0.1280461, 0.7200049, 0.4047435, 0, 0, 0, 1, 1,
0.1291487, 0.4378445, 1.07614, 0, 0, 0, 1, 1,
0.1324495, -1.063833, 2.752115, 0, 0, 0, 1, 1,
0.1328228, 0.5104038, -0.3750686, 0, 0, 0, 1, 1,
0.1332311, 0.1375968, 1.05424, 0, 0, 0, 1, 1,
0.1427002, 0.01457441, 1.132659, 0, 0, 0, 1, 1,
0.1436415, 0.4948407, 1.631256, 1, 1, 1, 1, 1,
0.1474695, -1.534763, 3.584162, 1, 1, 1, 1, 1,
0.1475908, -0.1584372, 2.158546, 1, 1, 1, 1, 1,
0.1515559, 0.5393642, 1.782613, 1, 1, 1, 1, 1,
0.1557024, 0.8286641, 0.8464817, 1, 1, 1, 1, 1,
0.1598741, -1.049736, 2.502206, 1, 1, 1, 1, 1,
0.1646181, -0.04753173, 1.34676, 1, 1, 1, 1, 1,
0.1727995, -0.2499863, 3.040822, 1, 1, 1, 1, 1,
0.1745394, 1.330466, -1.26894, 1, 1, 1, 1, 1,
0.1746495, 1.451642, -0.3032553, 1, 1, 1, 1, 1,
0.1759523, 0.9473752, -0.2905433, 1, 1, 1, 1, 1,
0.1760699, 0.9320897, -0.04439239, 1, 1, 1, 1, 1,
0.1798168, -0.1259613, 0.6362523, 1, 1, 1, 1, 1,
0.1823284, 1.283846, -0.06757653, 1, 1, 1, 1, 1,
0.1826791, -1.290047, 2.827399, 1, 1, 1, 1, 1,
0.1880596, 0.1274063, 0.4704946, 0, 0, 1, 1, 1,
0.1888454, -1.586263, 2.551331, 1, 0, 0, 1, 1,
0.1910528, -1.160495, 3.321662, 1, 0, 0, 1, 1,
0.1921751, 0.8494679, 0.063038, 1, 0, 0, 1, 1,
0.1941789, 0.4555719, 1.521091, 1, 0, 0, 1, 1,
0.2001511, 0.2911112, 0.446971, 1, 0, 0, 1, 1,
0.2019206, -0.2471776, 2.697018, 0, 0, 0, 1, 1,
0.2024296, 0.9267231, 1.963394, 0, 0, 0, 1, 1,
0.2060022, 0.6620873, -0.3023546, 0, 0, 0, 1, 1,
0.2060474, -1.316814, 3.177614, 0, 0, 0, 1, 1,
0.2104806, -0.3393034, 3.356492, 0, 0, 0, 1, 1,
0.21282, 0.6413467, 0.1869022, 0, 0, 0, 1, 1,
0.2156467, -0.83019, 1.741592, 0, 0, 0, 1, 1,
0.2310664, -0.02190048, 0.9810086, 1, 1, 1, 1, 1,
0.2326713, 0.1466129, -0.2672493, 1, 1, 1, 1, 1,
0.2361351, 1.369956, 0.7427942, 1, 1, 1, 1, 1,
0.2365211, -0.8038622, 3.901056, 1, 1, 1, 1, 1,
0.2384081, 1.805943, -0.6182689, 1, 1, 1, 1, 1,
0.2400948, -0.1346944, 1.618833, 1, 1, 1, 1, 1,
0.2409314, -1.72464, 2.387974, 1, 1, 1, 1, 1,
0.2527725, -1.092592, 2.529676, 1, 1, 1, 1, 1,
0.2535232, -0.2630482, 2.35134, 1, 1, 1, 1, 1,
0.2550303, 0.6786855, 1.123405, 1, 1, 1, 1, 1,
0.2554241, -1.78824, 3.419712, 1, 1, 1, 1, 1,
0.256118, -0.03000033, 1.454595, 1, 1, 1, 1, 1,
0.2603205, 0.2063797, 0.9885559, 1, 1, 1, 1, 1,
0.2611915, -0.9194508, 3.436746, 1, 1, 1, 1, 1,
0.2642095, -2.408243, 3.141988, 1, 1, 1, 1, 1,
0.2671414, -0.8323179, 1.110231, 0, 0, 1, 1, 1,
0.2674848, 0.5191149, 0.476434, 1, 0, 0, 1, 1,
0.2707937, -0.6398529, 1.831138, 1, 0, 0, 1, 1,
0.2720957, 0.6646044, 2.101496, 1, 0, 0, 1, 1,
0.2727547, -1.13583, 5.443635, 1, 0, 0, 1, 1,
0.2731165, 0.7345923, -0.1235826, 1, 0, 0, 1, 1,
0.2745891, -0.5541391, 3.581138, 0, 0, 0, 1, 1,
0.2746957, 1.081561, -0.8989809, 0, 0, 0, 1, 1,
0.2786852, 0.1179614, 1.663916, 0, 0, 0, 1, 1,
0.2799431, 0.4016803, 0.2600259, 0, 0, 0, 1, 1,
0.2809422, -0.0368457, 2.28473, 0, 0, 0, 1, 1,
0.2852404, 0.3593521, 0.3195114, 0, 0, 0, 1, 1,
0.2853445, 1.155645, -0.371598, 0, 0, 0, 1, 1,
0.2853779, 0.9506042, 0.09970922, 1, 1, 1, 1, 1,
0.285509, 0.03398003, 1.335666, 1, 1, 1, 1, 1,
0.2864936, 0.8287904, 0.6282737, 1, 1, 1, 1, 1,
0.2936097, -2.337471, 2.982582, 1, 1, 1, 1, 1,
0.2943067, -0.1602077, 0.1393781, 1, 1, 1, 1, 1,
0.2960213, 0.08026379, 1.662067, 1, 1, 1, 1, 1,
0.3009267, -0.4168894, 1.334819, 1, 1, 1, 1, 1,
0.3082168, 1.240943, 0.354758, 1, 1, 1, 1, 1,
0.3098726, -0.6940439, 1.803594, 1, 1, 1, 1, 1,
0.3104947, -0.06326602, 0.5818333, 1, 1, 1, 1, 1,
0.3143089, 2.184158, 1.535475, 1, 1, 1, 1, 1,
0.3170742, 2.057767, 0.6469012, 1, 1, 1, 1, 1,
0.3193196, -0.04023343, 2.028915, 1, 1, 1, 1, 1,
0.3203469, 1.351282, -0.8940815, 1, 1, 1, 1, 1,
0.3216243, -0.8755216, 4.062167, 1, 1, 1, 1, 1,
0.3254308, 0.3767059, -0.5739625, 0, 0, 1, 1, 1,
0.3292512, 0.3737394, 0.5406061, 1, 0, 0, 1, 1,
0.3308893, -0.4535866, 2.704411, 1, 0, 0, 1, 1,
0.3312588, -0.6231399, 3.843438, 1, 0, 0, 1, 1,
0.3350996, 0.8526112, 0.3629982, 1, 0, 0, 1, 1,
0.336563, 0.08093073, 1.166894, 1, 0, 0, 1, 1,
0.3486468, 0.1725762, 0.5540978, 0, 0, 0, 1, 1,
0.3510123, -0.369221, 3.848678, 0, 0, 0, 1, 1,
0.3511892, -1.251305, 2.226663, 0, 0, 0, 1, 1,
0.3516121, -0.2567033, 1.445527, 0, 0, 0, 1, 1,
0.3534591, -0.713949, 2.629879, 0, 0, 0, 1, 1,
0.3548925, -0.8639842, 3.708966, 0, 0, 0, 1, 1,
0.3586941, 0.2792749, 0.6741872, 0, 0, 0, 1, 1,
0.3614159, -1.235606, 3.114635, 1, 1, 1, 1, 1,
0.3619707, -0.6834397, 1.682488, 1, 1, 1, 1, 1,
0.3630454, 0.3695141, 3.509886, 1, 1, 1, 1, 1,
0.3632759, 0.6657436, 1.323516, 1, 1, 1, 1, 1,
0.3635287, 0.5784301, 2.888772, 1, 1, 1, 1, 1,
0.3638653, -0.8617493, 1.962593, 1, 1, 1, 1, 1,
0.3640113, 0.3259194, -0.5900261, 1, 1, 1, 1, 1,
0.36575, -0.1734694, 1.229599, 1, 1, 1, 1, 1,
0.371694, 1.350891, 1.488351, 1, 1, 1, 1, 1,
0.3749052, -0.3649798, 2.860216, 1, 1, 1, 1, 1,
0.3770503, 0.3161485, 0.2345457, 1, 1, 1, 1, 1,
0.3783869, -0.5021397, 4.382382, 1, 1, 1, 1, 1,
0.3828959, -0.3122447, 0.5086112, 1, 1, 1, 1, 1,
0.389337, -0.009398554, 0.2555046, 1, 1, 1, 1, 1,
0.3920244, 0.2508394, 1.116885, 1, 1, 1, 1, 1,
0.3935452, -0.1394405, 1.655166, 0, 0, 1, 1, 1,
0.3953868, -0.06004588, 0.3901914, 1, 0, 0, 1, 1,
0.395584, -0.8123691, 0.7283689, 1, 0, 0, 1, 1,
0.3990217, -0.534036, 3.025036, 1, 0, 0, 1, 1,
0.3999378, -1.311773, 2.094891, 1, 0, 0, 1, 1,
0.4095213, 0.6357839, 1.623341, 1, 0, 0, 1, 1,
0.4133783, 0.5602621, -1.688387, 0, 0, 0, 1, 1,
0.4140128, -1.669457, 3.221568, 0, 0, 0, 1, 1,
0.4201778, 0.3357508, 1.511735, 0, 0, 0, 1, 1,
0.422901, 0.3069681, 0.7001433, 0, 0, 0, 1, 1,
0.4242256, -1.558481, 2.363029, 0, 0, 0, 1, 1,
0.4247057, -1.410035, 2.382792, 0, 0, 0, 1, 1,
0.4259879, 0.9145053, 0.3314193, 0, 0, 0, 1, 1,
0.4283527, 0.2652588, 2.100978, 1, 1, 1, 1, 1,
0.4307104, -0.9338474, 3.426465, 1, 1, 1, 1, 1,
0.4346831, 0.08749083, 1.564395, 1, 1, 1, 1, 1,
0.4403366, 1.350234, -0.2053801, 1, 1, 1, 1, 1,
0.4463805, 1.691635, -1.703888, 1, 1, 1, 1, 1,
0.4496408, 0.9199693, -1.243766, 1, 1, 1, 1, 1,
0.4510442, 0.05695625, 1.630872, 1, 1, 1, 1, 1,
0.4545448, 1.216833, -0.6693252, 1, 1, 1, 1, 1,
0.4605687, -1.093214, 3.667942, 1, 1, 1, 1, 1,
0.4605962, -0.8729565, 3.07577, 1, 1, 1, 1, 1,
0.4624949, 2.593947, 2.150187, 1, 1, 1, 1, 1,
0.4646325, -1.878658, 4.572258, 1, 1, 1, 1, 1,
0.4663499, 1.433338, 0.3346089, 1, 1, 1, 1, 1,
0.4691236, 0.9290389, 2.703758, 1, 1, 1, 1, 1,
0.4713206, 0.5654684, 0.5516759, 1, 1, 1, 1, 1,
0.4775729, 1.277022, 1.032967, 0, 0, 1, 1, 1,
0.4832268, 2.02966, -0.594224, 1, 0, 0, 1, 1,
0.4843595, 0.2609288, 1.649399, 1, 0, 0, 1, 1,
0.4871028, 0.4479672, 1.327801, 1, 0, 0, 1, 1,
0.4890226, 0.6096766, 0.3717734, 1, 0, 0, 1, 1,
0.489259, -1.276962, 2.915687, 1, 0, 0, 1, 1,
0.4957347, 0.8829601, -0.06464695, 0, 0, 0, 1, 1,
0.4973627, 0.6449035, 1.461047, 0, 0, 0, 1, 1,
0.4974426, -1.024606, 3.79577, 0, 0, 0, 1, 1,
0.4983918, -0.3257078, 1.985694, 0, 0, 0, 1, 1,
0.5000976, -1.907495, 2.037975, 0, 0, 0, 1, 1,
0.5019547, 0.7727252, 0.847473, 0, 0, 0, 1, 1,
0.5054991, 1.171584, 1.303225, 0, 0, 0, 1, 1,
0.5127402, -1.155433, 3.311918, 1, 1, 1, 1, 1,
0.5128838, 0.6228098, 1.487737, 1, 1, 1, 1, 1,
0.5157455, 1.462465, 1.248213, 1, 1, 1, 1, 1,
0.5166773, -1.441823, 2.285775, 1, 1, 1, 1, 1,
0.522971, -0.9271033, 1.381976, 1, 1, 1, 1, 1,
0.5232394, -0.5489259, 2.181618, 1, 1, 1, 1, 1,
0.5253154, -1.211091, 1.84419, 1, 1, 1, 1, 1,
0.526844, -0.4499729, 1.567427, 1, 1, 1, 1, 1,
0.5324638, 1.363925, 2.07548, 1, 1, 1, 1, 1,
0.5398608, 0.05495564, 2.096884, 1, 1, 1, 1, 1,
0.5408465, 1.480404, 1.567543, 1, 1, 1, 1, 1,
0.542699, -0.2212164, 1.834558, 1, 1, 1, 1, 1,
0.5435512, -0.7148682, 3.163236, 1, 1, 1, 1, 1,
0.5519648, 1.813534, 2.449469, 1, 1, 1, 1, 1,
0.5521786, -0.4685394, 3.076357, 1, 1, 1, 1, 1,
0.5552583, -0.4894027, 3.860757, 0, 0, 1, 1, 1,
0.5558788, -0.8294917, 1.563749, 1, 0, 0, 1, 1,
0.5576862, 0.2537954, 3.610594, 1, 0, 0, 1, 1,
0.5622235, -0.3034561, 0.7596707, 1, 0, 0, 1, 1,
0.5638102, 0.288863, 1.61206, 1, 0, 0, 1, 1,
0.5649663, -0.9064385, 3.027505, 1, 0, 0, 1, 1,
0.569315, -0.7338813, 3.297949, 0, 0, 0, 1, 1,
0.5703079, -0.4640947, 2.307909, 0, 0, 0, 1, 1,
0.5710017, -0.5487629, 2.298618, 0, 0, 0, 1, 1,
0.5729774, -0.7056749, 0.7551284, 0, 0, 0, 1, 1,
0.5808862, 0.8909909, 0.8178958, 0, 0, 0, 1, 1,
0.5823156, -1.911693, 1.706892, 0, 0, 0, 1, 1,
0.5840616, 0.02284843, 2.949064, 0, 0, 0, 1, 1,
0.5860751, 0.7698181, 0.9191132, 1, 1, 1, 1, 1,
0.5869556, -0.9594688, 3.287416, 1, 1, 1, 1, 1,
0.590307, 1.324666, 1.642891, 1, 1, 1, 1, 1,
0.5926, -0.943018, 1.641374, 1, 1, 1, 1, 1,
0.5927973, -1.350619, 1.096104, 1, 1, 1, 1, 1,
0.595737, 0.2103542, 1.020866, 1, 1, 1, 1, 1,
0.5987702, 0.7200657, -0.9568049, 1, 1, 1, 1, 1,
0.5991135, 1.124271, 1.04155, 1, 1, 1, 1, 1,
0.6010382, 0.4404351, -0.07523812, 1, 1, 1, 1, 1,
0.6027951, 0.2870587, 1.885327, 1, 1, 1, 1, 1,
0.6031587, 0.06927352, -0.1218716, 1, 1, 1, 1, 1,
0.603601, -1.760444, 3.906089, 1, 1, 1, 1, 1,
0.6065358, 0.587588, -0.2355175, 1, 1, 1, 1, 1,
0.6070818, -0.2441709, 2.349642, 1, 1, 1, 1, 1,
0.6070868, 0.1073773, 1.448589, 1, 1, 1, 1, 1,
0.6101736, -1.048833, 3.647127, 0, 0, 1, 1, 1,
0.6242274, 1.77133, -0.0769556, 1, 0, 0, 1, 1,
0.6267565, 1.011351, 0.5063839, 1, 0, 0, 1, 1,
0.6276286, -2.268121, 2.049688, 1, 0, 0, 1, 1,
0.6300001, -1.573743, 3.331251, 1, 0, 0, 1, 1,
0.6325334, -0.6103623, 0.8262815, 1, 0, 0, 1, 1,
0.6328809, 0.8791496, 1.258915, 0, 0, 0, 1, 1,
0.6362314, -0.6433651, 2.253359, 0, 0, 0, 1, 1,
0.6409938, -1.032678, 2.224445, 0, 0, 0, 1, 1,
0.6518349, 0.2911874, 1.172752, 0, 0, 0, 1, 1,
0.6522427, 1.192724, 0.3976052, 0, 0, 0, 1, 1,
0.652286, -0.4741465, 3.187118, 0, 0, 0, 1, 1,
0.6524036, -0.6743585, 0.981485, 0, 0, 0, 1, 1,
0.6534854, 0.5230891, 1.005763, 1, 1, 1, 1, 1,
0.6536515, 2.225236, 0.9760769, 1, 1, 1, 1, 1,
0.6559101, -0.5390469, 1.698244, 1, 1, 1, 1, 1,
0.6567479, -0.2063531, 2.883425, 1, 1, 1, 1, 1,
0.6615344, 1.637291, 0.06567949, 1, 1, 1, 1, 1,
0.6618281, 0.9531139, 0.06728247, 1, 1, 1, 1, 1,
0.6629052, 1.573714, -1.17701, 1, 1, 1, 1, 1,
0.6685522, 0.3135165, -1.276932, 1, 1, 1, 1, 1,
0.6689789, -1.91864, 0.9626215, 1, 1, 1, 1, 1,
0.6711065, 0.08431523, 1.489684, 1, 1, 1, 1, 1,
0.6720741, 2.719849, 0.7578518, 1, 1, 1, 1, 1,
0.672649, 0.6365259, 0.2492059, 1, 1, 1, 1, 1,
0.673219, 0.84593, 0.6971848, 1, 1, 1, 1, 1,
0.6737641, 0.7557627, -0.3691862, 1, 1, 1, 1, 1,
0.6751198, -0.4039373, 3.249165, 1, 1, 1, 1, 1,
0.6762168, -0.1900922, 0.7916535, 0, 0, 1, 1, 1,
0.6799535, 0.5336991, 0.04093695, 1, 0, 0, 1, 1,
0.6831997, 2.078578, -0.5969414, 1, 0, 0, 1, 1,
0.6834071, 1.160331, 0.2793562, 1, 0, 0, 1, 1,
0.6881704, -0.02554795, 2.078092, 1, 0, 0, 1, 1,
0.6913118, -1.328342, 4.04336, 1, 0, 0, 1, 1,
0.6941761, 0.4856071, 1.286611, 0, 0, 0, 1, 1,
0.6941832, -0.5280115, 1.284865, 0, 0, 0, 1, 1,
0.697322, -0.9398825, 0.6525993, 0, 0, 0, 1, 1,
0.6995379, 0.7525899, 1.171762, 0, 0, 0, 1, 1,
0.7008787, -0.02239901, 3.040726, 0, 0, 0, 1, 1,
0.7033547, 0.6124346, 0.4399426, 0, 0, 0, 1, 1,
0.7139755, -0.4619563, 4.325778, 0, 0, 0, 1, 1,
0.7155933, -1.209145, 3.232454, 1, 1, 1, 1, 1,
0.7157301, 0.02492451, -0.5133749, 1, 1, 1, 1, 1,
0.7165825, 0.6441554, 1.454056, 1, 1, 1, 1, 1,
0.7202586, 0.210111, 1.335323, 1, 1, 1, 1, 1,
0.7217996, -1.179683, 2.019999, 1, 1, 1, 1, 1,
0.7247153, 0.1933682, -0.4944467, 1, 1, 1, 1, 1,
0.7255227, -0.1479844, 4.447426, 1, 1, 1, 1, 1,
0.7306065, 0.9033499, 0.8231651, 1, 1, 1, 1, 1,
0.7392023, -1.153948, 1.495851, 1, 1, 1, 1, 1,
0.7414578, 2.489986, 0.2675808, 1, 1, 1, 1, 1,
0.7434989, -1.405852, 2.704845, 1, 1, 1, 1, 1,
0.7461522, 0.04925888, 1.942615, 1, 1, 1, 1, 1,
0.7463524, 1.690919, -0.4001399, 1, 1, 1, 1, 1,
0.7575844, -0.1781055, 1.273844, 1, 1, 1, 1, 1,
0.7653103, 0.3352176, 1.737756, 1, 1, 1, 1, 1,
0.7655187, -0.8592851, 1.694587, 0, 0, 1, 1, 1,
0.7741721, -0.1894432, 2.670074, 1, 0, 0, 1, 1,
0.7840639, 0.4619305, -0.2853541, 1, 0, 0, 1, 1,
0.7854395, 0.9461466, 1.375655, 1, 0, 0, 1, 1,
0.7904687, -0.1379748, 2.317571, 1, 0, 0, 1, 1,
0.795358, 0.201115, 0.8406271, 1, 0, 0, 1, 1,
0.805061, 1.584583, -0.7236848, 0, 0, 0, 1, 1,
0.8085402, 1.503427, 0.9221976, 0, 0, 0, 1, 1,
0.8110456, 0.1209631, -0.2339996, 0, 0, 0, 1, 1,
0.8113891, 2.540472, -1.135888, 0, 0, 0, 1, 1,
0.8121409, -0.4462208, 2.085639, 0, 0, 0, 1, 1,
0.8132537, 0.8111734, 1.916777, 0, 0, 0, 1, 1,
0.8161214, -1.073432, 1.61936, 0, 0, 0, 1, 1,
0.8168529, 0.8203126, 3.9679, 1, 1, 1, 1, 1,
0.8185193, 1.203547, -0.2858135, 1, 1, 1, 1, 1,
0.8241436, 0.1033394, 1.138503, 1, 1, 1, 1, 1,
0.8273371, 0.4748864, 0.3415325, 1, 1, 1, 1, 1,
0.8275629, -0.9732707, 2.39229, 1, 1, 1, 1, 1,
0.8331603, -0.1627924, 0.8473471, 1, 1, 1, 1, 1,
0.8377281, -1.474339, 2.710285, 1, 1, 1, 1, 1,
0.8382671, -0.2747068, 1.171309, 1, 1, 1, 1, 1,
0.839852, 0.7926484, 1.400674, 1, 1, 1, 1, 1,
0.8449107, -0.01589868, 1.431438, 1, 1, 1, 1, 1,
0.8515764, 0.2484978, 3.065866, 1, 1, 1, 1, 1,
0.8586918, 0.5471223, 0.4222786, 1, 1, 1, 1, 1,
0.8642814, -0.402473, 2.471468, 1, 1, 1, 1, 1,
0.8725831, 0.8900762, 2.791493, 1, 1, 1, 1, 1,
0.875222, -0.1254324, 1.986851, 1, 1, 1, 1, 1,
0.88415, -0.5919341, 2.283045, 0, 0, 1, 1, 1,
0.8852344, 0.1676736, 0.3846004, 1, 0, 0, 1, 1,
0.8926929, -0.9485871, 2.4995, 1, 0, 0, 1, 1,
0.8958803, 0.520993, 0.9729766, 1, 0, 0, 1, 1,
0.8979361, -0.4115412, 0.809544, 1, 0, 0, 1, 1,
0.9016017, -0.609202, 1.302413, 1, 0, 0, 1, 1,
0.9025507, -1.440547, 2.923663, 0, 0, 0, 1, 1,
0.9042841, 0.4937227, 2.095332, 0, 0, 0, 1, 1,
0.9102596, 0.07850082, 0.5997993, 0, 0, 0, 1, 1,
0.9222339, 2.180317, 0.2476088, 0, 0, 0, 1, 1,
0.9227925, 0.5079279, 2.398389, 0, 0, 0, 1, 1,
0.9254832, 0.3510195, -0.7144449, 0, 0, 0, 1, 1,
0.9296718, -0.236616, 2.280016, 0, 0, 0, 1, 1,
0.9307685, 0.1407656, 0.1364625, 1, 1, 1, 1, 1,
0.9361526, 0.9341102, 0.4928316, 1, 1, 1, 1, 1,
0.9386953, 0.0764168, 1.199833, 1, 1, 1, 1, 1,
0.9476508, -0.2812225, 1.560288, 1, 1, 1, 1, 1,
0.9493924, -1.874656, 2.995291, 1, 1, 1, 1, 1,
0.9514284, 0.7776656, 1.866268, 1, 1, 1, 1, 1,
0.9525378, -1.204876, 2.219058, 1, 1, 1, 1, 1,
0.9644114, -0.1251766, 2.322384, 1, 1, 1, 1, 1,
0.9645888, -0.5915222, 3.600479, 1, 1, 1, 1, 1,
0.9647825, 1.071367, 2.51911, 1, 1, 1, 1, 1,
0.9666765, -1.269246, 1.649272, 1, 1, 1, 1, 1,
0.9683883, -1.085171, 1.756441, 1, 1, 1, 1, 1,
0.9692943, -0.5466341, 1.273124, 1, 1, 1, 1, 1,
0.9723461, 0.3516044, 1.463781, 1, 1, 1, 1, 1,
0.9750173, -0.3570146, 0.8661983, 1, 1, 1, 1, 1,
0.9768931, 0.6019875, 1.178791, 0, 0, 1, 1, 1,
0.977717, -0.787688, 3.512189, 1, 0, 0, 1, 1,
0.9846882, 1.537212, 1.27405, 1, 0, 0, 1, 1,
0.9847424, -0.1322884, 1.916982, 1, 0, 0, 1, 1,
0.9878629, 0.3219316, 0.50204, 1, 0, 0, 1, 1,
1.000489, -1.362111, 1.596513, 1, 0, 0, 1, 1,
1.015903, 0.223484, 0.6069671, 0, 0, 0, 1, 1,
1.01863, 0.08539721, 0.4369286, 0, 0, 0, 1, 1,
1.025777, 0.0266081, 1.629412, 0, 0, 0, 1, 1,
1.032685, -1.401759, 0.2287486, 0, 0, 0, 1, 1,
1.03641, 1.700475, 0.780052, 0, 0, 0, 1, 1,
1.037121, 1.172431, 2.386621, 0, 0, 0, 1, 1,
1.040997, 1.410404, 0.8569468, 0, 0, 0, 1, 1,
1.04767, -0.2628422, 2.980922, 1, 1, 1, 1, 1,
1.047678, 0.0001846358, 2.330457, 1, 1, 1, 1, 1,
1.049234, -0.34009, 0.9432145, 1, 1, 1, 1, 1,
1.05891, -0.9154447, 3.58158, 1, 1, 1, 1, 1,
1.066748, 1.739501, 1.112201, 1, 1, 1, 1, 1,
1.069104, 1.239378, 0.8808773, 1, 1, 1, 1, 1,
1.070286, 0.5331442, 1.089088, 1, 1, 1, 1, 1,
1.081044, 0.9228818, 3.237369, 1, 1, 1, 1, 1,
1.081981, 1.010495, -0.6486301, 1, 1, 1, 1, 1,
1.08908, -1.826812, 2.672919, 1, 1, 1, 1, 1,
1.093806, 0.7628335, 0.8125445, 1, 1, 1, 1, 1,
1.100587, 0.258927, 1.833982, 1, 1, 1, 1, 1,
1.101233, -0.7886456, 0.1258773, 1, 1, 1, 1, 1,
1.111814, -0.329168, 2.479431, 1, 1, 1, 1, 1,
1.112573, 0.3909521, 1.065888, 1, 1, 1, 1, 1,
1.113734, -1.199965, 4.192042, 0, 0, 1, 1, 1,
1.118742, -1.097591, 3.149944, 1, 0, 0, 1, 1,
1.122172, 1.06953, 1.162352, 1, 0, 0, 1, 1,
1.124818, -0.0688212, 3.175772, 1, 0, 0, 1, 1,
1.129422, 0.6836762, 0.3840405, 1, 0, 0, 1, 1,
1.129532, 0.3316984, 0.7442327, 1, 0, 0, 1, 1,
1.132017, -0.6582172, 2.174629, 0, 0, 0, 1, 1,
1.145348, -2.099931, 2.185442, 0, 0, 0, 1, 1,
1.148628, 0.3810582, 0.9485489, 0, 0, 0, 1, 1,
1.152238, 1.616177, 0.4855003, 0, 0, 0, 1, 1,
1.152921, 0.0820066, 1.151563, 0, 0, 0, 1, 1,
1.156908, 0.4088379, 0.295583, 0, 0, 0, 1, 1,
1.162211, 0.09485587, 1.981277, 0, 0, 0, 1, 1,
1.165341, 1.099289, 3.259549, 1, 1, 1, 1, 1,
1.17453, -0.2559421, 0.8756974, 1, 1, 1, 1, 1,
1.177539, 0.5170727, 1.752721, 1, 1, 1, 1, 1,
1.177928, -0.3456651, 0.7896763, 1, 1, 1, 1, 1,
1.178842, -1.188879, 3.274471, 1, 1, 1, 1, 1,
1.183368, -0.1424658, 1.832772, 1, 1, 1, 1, 1,
1.188641, -0.4364964, 2.319715, 1, 1, 1, 1, 1,
1.193755, 0.1114424, -0.03845518, 1, 1, 1, 1, 1,
1.200664, 1.428787, 0.1353726, 1, 1, 1, 1, 1,
1.201241, -1.483056, 1.323267, 1, 1, 1, 1, 1,
1.202632, 1.100741, 1.918121, 1, 1, 1, 1, 1,
1.206286, -0.01194413, 1.586455, 1, 1, 1, 1, 1,
1.209352, 1.134015, -0.6588902, 1, 1, 1, 1, 1,
1.210675, -1.029316, 1.591385, 1, 1, 1, 1, 1,
1.211116, -0.0252092, 0.8824431, 1, 1, 1, 1, 1,
1.22474, -1.789715, 1.82307, 0, 0, 1, 1, 1,
1.225114, -0.6683926, 1.978154, 1, 0, 0, 1, 1,
1.229542, -0.1215138, 1.555597, 1, 0, 0, 1, 1,
1.231769, 0.6816862, 2.455111, 1, 0, 0, 1, 1,
1.234383, -0.4187734, 3.200937, 1, 0, 0, 1, 1,
1.235409, -0.4391581, 1.896463, 1, 0, 0, 1, 1,
1.237054, 1.71656, 0.9781218, 0, 0, 0, 1, 1,
1.237199, 0.5315479, 1.604454, 0, 0, 0, 1, 1,
1.243226, -0.7309253, 4.129086, 0, 0, 0, 1, 1,
1.246031, -1.720226, 1.756365, 0, 0, 0, 1, 1,
1.248835, -1.961314, 1.942895, 0, 0, 0, 1, 1,
1.262629, -0.6971146, 5.453102, 0, 0, 0, 1, 1,
1.271888, 0.1058032, 0.6737773, 0, 0, 0, 1, 1,
1.277099, 0.7052207, 2.422602, 1, 1, 1, 1, 1,
1.289356, -1.33149, 2.40582, 1, 1, 1, 1, 1,
1.294276, 0.5313462, 3.111616, 1, 1, 1, 1, 1,
1.294357, -0.91126, 1.715414, 1, 1, 1, 1, 1,
1.294414, 0.6793132, 2.276615, 1, 1, 1, 1, 1,
1.297133, -0.8704147, 0.985664, 1, 1, 1, 1, 1,
1.299799, -0.1528631, 2.012891, 1, 1, 1, 1, 1,
1.302017, 1.066504, 1.691766, 1, 1, 1, 1, 1,
1.303622, -1.553727, 2.826182, 1, 1, 1, 1, 1,
1.309968, 0.2334766, 2.319436, 1, 1, 1, 1, 1,
1.31689, -0.3923468, 0.2103309, 1, 1, 1, 1, 1,
1.321658, 0.8292205, 0.6650903, 1, 1, 1, 1, 1,
1.322302, -0.324368, 5.170387, 1, 1, 1, 1, 1,
1.323615, -0.183231, 3.522308, 1, 1, 1, 1, 1,
1.324159, -0.1171642, -0.3019325, 1, 1, 1, 1, 1,
1.326556, 0.9101918, 0.323124, 0, 0, 1, 1, 1,
1.334109, -1.437149, 2.78428, 1, 0, 0, 1, 1,
1.341637, -0.9227978, 2.3539, 1, 0, 0, 1, 1,
1.349647, -0.1616027, 0.5208428, 1, 0, 0, 1, 1,
1.353705, 1.331792, 0.8829269, 1, 0, 0, 1, 1,
1.35513, 0.9928414, 1.586829, 1, 0, 0, 1, 1,
1.363359, -0.9264088, 3.713141, 0, 0, 0, 1, 1,
1.364564, 1.622226, 1.754055, 0, 0, 0, 1, 1,
1.377167, -0.3436114, 1.776595, 0, 0, 0, 1, 1,
1.389583, 0.3790504, 1.82102, 0, 0, 0, 1, 1,
1.398757, 0.2643315, 0.9203571, 0, 0, 0, 1, 1,
1.404895, 1.694974, 1.068054, 0, 0, 0, 1, 1,
1.413567, -1.214653, 1.167068, 0, 0, 0, 1, 1,
1.419171, -0.3199751, 0.8122817, 1, 1, 1, 1, 1,
1.422055, -0.1754846, 1.903011, 1, 1, 1, 1, 1,
1.429022, -0.7467678, 3.507787, 1, 1, 1, 1, 1,
1.437448, 0.8911548, 0.9553971, 1, 1, 1, 1, 1,
1.438182, 0.09152547, -0.2495022, 1, 1, 1, 1, 1,
1.440417, -0.3492003, 2.864288, 1, 1, 1, 1, 1,
1.453576, 1.242451, 1.963632, 1, 1, 1, 1, 1,
1.456102, 2.212231, 0.2972338, 1, 1, 1, 1, 1,
1.461071, 0.7465617, -0.02470187, 1, 1, 1, 1, 1,
1.477381, 0.9917396, 1.15408, 1, 1, 1, 1, 1,
1.479327, -1.333986, 2.018195, 1, 1, 1, 1, 1,
1.479735, -0.3733833, 1.094358, 1, 1, 1, 1, 1,
1.486635, -1.228395, 2.49072, 1, 1, 1, 1, 1,
1.487949, 0.2948936, 2.307351, 1, 1, 1, 1, 1,
1.491359, 0.2933124, 1.816698, 1, 1, 1, 1, 1,
1.495578, 0.891083, 2.053225, 0, 0, 1, 1, 1,
1.496812, -0.1698551, 1.891793, 1, 0, 0, 1, 1,
1.507982, -0.3112382, 2.960322, 1, 0, 0, 1, 1,
1.510657, 0.2409926, 2.30209, 1, 0, 0, 1, 1,
1.511894, -1.057006, 2.224119, 1, 0, 0, 1, 1,
1.51396, -0.4994573, 1.967304, 1, 0, 0, 1, 1,
1.537918, 0.559227, 1.358258, 0, 0, 0, 1, 1,
1.54211, 0.9618389, 2.946461, 0, 0, 0, 1, 1,
1.542792, -1.104907, 2.143225, 0, 0, 0, 1, 1,
1.54894, 0.5676486, 1.04781, 0, 0, 0, 1, 1,
1.572123, 0.7692959, 1.658762, 0, 0, 0, 1, 1,
1.579749, -0.961247, 2.903455, 0, 0, 0, 1, 1,
1.583054, -1.398547, 2.67197, 0, 0, 0, 1, 1,
1.586474, 0.2322639, 1.693581, 1, 1, 1, 1, 1,
1.597086, -1.19635, 2.424628, 1, 1, 1, 1, 1,
1.597193, -0.8550232, 2.924046, 1, 1, 1, 1, 1,
1.598906, -0.570627, 1.155482, 1, 1, 1, 1, 1,
1.605973, -0.9260619, 1.594631, 1, 1, 1, 1, 1,
1.612218, -0.4538677, 4.008658, 1, 1, 1, 1, 1,
1.620282, -0.9224263, 2.431607, 1, 1, 1, 1, 1,
1.633536, 0.9895797, 1.805439, 1, 1, 1, 1, 1,
1.660039, -0.8695779, 0.8177753, 1, 1, 1, 1, 1,
1.675617, 0.5175514, 0.9416634, 1, 1, 1, 1, 1,
1.695283, -1.21252, 4.094173, 1, 1, 1, 1, 1,
1.701669, -1.155448, 2.270342, 1, 1, 1, 1, 1,
1.723343, -0.6081415, 0.8329073, 1, 1, 1, 1, 1,
1.730231, -0.2595412, 1.237531, 1, 1, 1, 1, 1,
1.738555, 0.8244238, 1.513569, 1, 1, 1, 1, 1,
1.754478, 1.336149, 3.631047, 0, 0, 1, 1, 1,
1.766166, -0.06026939, 1.480843, 1, 0, 0, 1, 1,
1.829883, -1.495575, 1.835276, 1, 0, 0, 1, 1,
1.83312, -0.9846076, 1.397205, 1, 0, 0, 1, 1,
1.849844, -1.482908, 1.841839, 1, 0, 0, 1, 1,
1.866203, 0.2500422, 1.477193, 1, 0, 0, 1, 1,
1.870069, 2.704536, 0.2318312, 0, 0, 0, 1, 1,
1.878892, -1.213927, 2.475248, 0, 0, 0, 1, 1,
1.879505, -0.01719216, 3.009986, 0, 0, 0, 1, 1,
1.886214, 1.33661, 1.255659, 0, 0, 0, 1, 1,
1.893286, -0.4081226, 1.892165, 0, 0, 0, 1, 1,
1.894761, -1.308729, 1.518843, 0, 0, 0, 1, 1,
1.897726, 0.5175492, 1.518532, 0, 0, 0, 1, 1,
1.929292, -0.9197409, 1.559269, 1, 1, 1, 1, 1,
1.931919, 0.4308465, 0.8725896, 1, 1, 1, 1, 1,
1.944343, 0.8111326, -0.2609467, 1, 1, 1, 1, 1,
1.95208, 2.056026, 0.8920258, 1, 1, 1, 1, 1,
1.975984, -0.2042865, -0.3531723, 1, 1, 1, 1, 1,
1.992482, -0.3368222, 1.15105, 1, 1, 1, 1, 1,
2.009846, 0.7803284, -0.1293775, 1, 1, 1, 1, 1,
2.034123, -1.172634, 2.468813, 1, 1, 1, 1, 1,
2.050301, 0.6040447, 0.03861149, 1, 1, 1, 1, 1,
2.050564, -0.9307163, 2.505435, 1, 1, 1, 1, 1,
2.060884, -0.2163909, 0.624065, 1, 1, 1, 1, 1,
2.060954, 1.053648, 0.7042859, 1, 1, 1, 1, 1,
2.082248, 0.3703218, 1.146805, 1, 1, 1, 1, 1,
2.143756, -1.271136, 2.220256, 1, 1, 1, 1, 1,
2.227242, 0.5426819, -0.6003029, 1, 1, 1, 1, 1,
2.241575, 2.000588, 0.4033622, 0, 0, 1, 1, 1,
2.247188, -1.00707, 2.095989, 1, 0, 0, 1, 1,
2.256226, -0.1311098, 2.27434, 1, 0, 0, 1, 1,
2.281416, -1.735751, 1.749177, 1, 0, 0, 1, 1,
2.318749, 0.6739196, 0.8188038, 1, 0, 0, 1, 1,
2.33049, -1.440729, 1.391616, 1, 0, 0, 1, 1,
2.334758, -0.3313194, 0.8378911, 0, 0, 0, 1, 1,
2.357286, 2.177446, 1.023821, 0, 0, 0, 1, 1,
2.434908, -0.02427836, 0.06277605, 0, 0, 0, 1, 1,
2.441677, -0.8871984, 1.170335, 0, 0, 0, 1, 1,
2.455364, -1.036363, 2.013191, 0, 0, 0, 1, 1,
2.459956, -0.6912231, 1.090728, 0, 0, 0, 1, 1,
2.496148, -0.02193338, 2.266378, 0, 0, 0, 1, 1,
2.527174, -0.07367191, 1.687614, 1, 1, 1, 1, 1,
2.584612, -0.4825318, 1.513298, 1, 1, 1, 1, 1,
2.591753, -0.2435997, 1.768904, 1, 1, 1, 1, 1,
2.675193, -0.1591612, 1.468413, 1, 1, 1, 1, 1,
2.748654, -0.731832, 0.8415627, 1, 1, 1, 1, 1,
3.151415, -0.966042, 2.866925, 1, 1, 1, 1, 1,
3.289919, 0.36335, 2.48513, 1, 1, 1, 1, 1
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
var radius = 9.620387;
var distance = 33.7912;
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
mvMatrix.translate( -0.182582, 0.1244277, 0.09955931 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.7912);
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
