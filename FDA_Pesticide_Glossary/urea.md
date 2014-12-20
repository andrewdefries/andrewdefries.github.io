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
-3.9259, 1.000657, -1.846979, 1, 0, 0, 1,
-2.938686, 0.6585264, -1.984417, 1, 0.007843138, 0, 1,
-2.860619, -0.4819066, -0.9474314, 1, 0.01176471, 0, 1,
-2.808006, -0.6122974, -3.092153, 1, 0.01960784, 0, 1,
-2.672613, -1.727978, -3.457647, 1, 0.02352941, 0, 1,
-2.670434, 0.5369651, -0.6156425, 1, 0.03137255, 0, 1,
-2.65128, 2.544934, -1.074634, 1, 0.03529412, 0, 1,
-2.632395, -0.30775, -2.460171, 1, 0.04313726, 0, 1,
-2.541567, 1.537634, -0.6397331, 1, 0.04705882, 0, 1,
-2.484697, 0.08537744, -3.51295, 1, 0.05490196, 0, 1,
-2.483602, -1.822602, -1.974941, 1, 0.05882353, 0, 1,
-2.466109, 0.1711551, -0.6027038, 1, 0.06666667, 0, 1,
-2.430362, -0.05093778, -2.930275, 1, 0.07058824, 0, 1,
-2.417716, 0.4693086, -3.116799, 1, 0.07843138, 0, 1,
-2.415978, 1.626471, -0.6176634, 1, 0.08235294, 0, 1,
-2.409835, -0.4192649, -2.709846, 1, 0.09019608, 0, 1,
-2.32372, 0.5989162, -4.230232, 1, 0.09411765, 0, 1,
-2.291332, -0.9982478, -0.9847153, 1, 0.1019608, 0, 1,
-2.280864, -1.173014, -2.480711, 1, 0.1098039, 0, 1,
-2.222952, 0.5209872, -1.633969, 1, 0.1137255, 0, 1,
-2.114418, -0.2836831, -0.8438128, 1, 0.1215686, 0, 1,
-2.113565, 1.029568, -2.373455, 1, 0.1254902, 0, 1,
-2.081744, -1.186282, -4.628287, 1, 0.1333333, 0, 1,
-2.054799, -0.04969742, -1.614469, 1, 0.1372549, 0, 1,
-2.013109, -0.7436439, -0.6002065, 1, 0.145098, 0, 1,
-2.010598, 0.9573323, -1.411414, 1, 0.1490196, 0, 1,
-2.006213, 0.6410999, -1.8945, 1, 0.1568628, 0, 1,
-1.999286, 0.5013041, -2.230389, 1, 0.1607843, 0, 1,
-1.990718, 0.8483732, -1.535848, 1, 0.1686275, 0, 1,
-1.982302, -0.4900798, -1.109059, 1, 0.172549, 0, 1,
-1.957573, -0.4599202, -1.229562, 1, 0.1803922, 0, 1,
-1.946292, -0.4934021, -1.360734, 1, 0.1843137, 0, 1,
-1.918903, -1.256127, -1.838176, 1, 0.1921569, 0, 1,
-1.904294, -0.3746308, -3.409734, 1, 0.1960784, 0, 1,
-1.897338, 0.0148028, -1.405051, 1, 0.2039216, 0, 1,
-1.890714, -0.01235674, -2.876395, 1, 0.2117647, 0, 1,
-1.873784, -0.3543147, -1.322613, 1, 0.2156863, 0, 1,
-1.866271, -0.3243841, -1.187813, 1, 0.2235294, 0, 1,
-1.838982, 0.8870593, -0.7405558, 1, 0.227451, 0, 1,
-1.838978, 1.287529, -0.1094067, 1, 0.2352941, 0, 1,
-1.832922, -0.4746878, -1.017269, 1, 0.2392157, 0, 1,
-1.826212, 0.6813809, -0.9310389, 1, 0.2470588, 0, 1,
-1.818749, 0.1204126, -2.413531, 1, 0.2509804, 0, 1,
-1.804359, -0.5289353, -3.623538, 1, 0.2588235, 0, 1,
-1.801943, 0.07457125, -2.18882, 1, 0.2627451, 0, 1,
-1.73989, 0.2121507, -1.39353, 1, 0.2705882, 0, 1,
-1.724914, -0.2191668, -2.100258, 1, 0.2745098, 0, 1,
-1.710857, 1.585277, -0.6587921, 1, 0.282353, 0, 1,
-1.680835, 0.4247345, -0.9269485, 1, 0.2862745, 0, 1,
-1.676654, 0.9425654, 0.8283166, 1, 0.2941177, 0, 1,
-1.671877, 2.025457, 0.3221846, 1, 0.3019608, 0, 1,
-1.667893, -0.2190332, -1.783208, 1, 0.3058824, 0, 1,
-1.664376, -0.4451174, -2.321169, 1, 0.3137255, 0, 1,
-1.655663, 0.01802455, -0.9650595, 1, 0.3176471, 0, 1,
-1.654798, -0.437324, -2.403032, 1, 0.3254902, 0, 1,
-1.649137, 0.1390256, -1.681094, 1, 0.3294118, 0, 1,
-1.646551, 0.5014909, -0.1766692, 1, 0.3372549, 0, 1,
-1.640395, 2.303531, -0.4326859, 1, 0.3411765, 0, 1,
-1.625583, 0.9278968, -0.9254063, 1, 0.3490196, 0, 1,
-1.61088, 0.1303383, -3.547945, 1, 0.3529412, 0, 1,
-1.607048, -2.358691, -1.485411, 1, 0.3607843, 0, 1,
-1.606395, -0.05144479, -2.230003, 1, 0.3647059, 0, 1,
-1.602909, 0.8116981, -1.613273, 1, 0.372549, 0, 1,
-1.599874, -0.7717947, -1.480312, 1, 0.3764706, 0, 1,
-1.593515, 0.6816384, -1.701728, 1, 0.3843137, 0, 1,
-1.58814, -1.237425, -3.055106, 1, 0.3882353, 0, 1,
-1.584229, -0.9905004, -4.062009, 1, 0.3960784, 0, 1,
-1.572396, -0.7976471, -2.226594, 1, 0.4039216, 0, 1,
-1.565854, 0.2197776, 0.4082401, 1, 0.4078431, 0, 1,
-1.558148, -2.161678, -2.162627, 1, 0.4156863, 0, 1,
-1.545046, 1.164827, -1.567909, 1, 0.4196078, 0, 1,
-1.541782, -1.610185, -2.457963, 1, 0.427451, 0, 1,
-1.538529, 1.748015, -1.71836, 1, 0.4313726, 0, 1,
-1.535393, -0.5949374, -3.448944, 1, 0.4392157, 0, 1,
-1.528795, -0.02890507, -1.267233, 1, 0.4431373, 0, 1,
-1.528331, -0.8613913, -1.152615, 1, 0.4509804, 0, 1,
-1.520426, 0.3031673, -0.8640242, 1, 0.454902, 0, 1,
-1.515332, 1.029356, -1.373692, 1, 0.4627451, 0, 1,
-1.513484, 1.095581, 0.3571117, 1, 0.4666667, 0, 1,
-1.478484, -1.493252, -2.540205, 1, 0.4745098, 0, 1,
-1.478408, 0.2134635, -1.807047, 1, 0.4784314, 0, 1,
-1.473918, -0.4537332, -0.6708559, 1, 0.4862745, 0, 1,
-1.47009, -1.449618, -3.755429, 1, 0.4901961, 0, 1,
-1.456743, 0.447733, -2.264539, 1, 0.4980392, 0, 1,
-1.450576, 0.8206689, -0.8550819, 1, 0.5058824, 0, 1,
-1.436921, -0.7863699, -3.006466, 1, 0.509804, 0, 1,
-1.415366, -0.872909, -2.299984, 1, 0.5176471, 0, 1,
-1.397969, -1.15935, -1.74473, 1, 0.5215687, 0, 1,
-1.374958, 1.015301, 0.4549115, 1, 0.5294118, 0, 1,
-1.373881, -0.5632562, -2.264672, 1, 0.5333334, 0, 1,
-1.369207, 0.1737476, -0.4277687, 1, 0.5411765, 0, 1,
-1.368236, 1.232401, -0.3460275, 1, 0.5450981, 0, 1,
-1.366351, 0.9418622, -2.045516, 1, 0.5529412, 0, 1,
-1.360919, 0.1098562, -1.290998, 1, 0.5568628, 0, 1,
-1.35744, -0.07629508, -0.4121067, 1, 0.5647059, 0, 1,
-1.35648, 0.01313435, -1.552856, 1, 0.5686275, 0, 1,
-1.356415, 0.4371934, -0.03693558, 1, 0.5764706, 0, 1,
-1.348855, 0.3521484, -0.3978899, 1, 0.5803922, 0, 1,
-1.348614, 0.4754024, -0.6418509, 1, 0.5882353, 0, 1,
-1.345506, 0.09555832, -2.210144, 1, 0.5921569, 0, 1,
-1.340375, -0.7161509, -0.864763, 1, 0.6, 0, 1,
-1.335948, -1.114754, -3.88486, 1, 0.6078432, 0, 1,
-1.330626, -0.712912, -1.543043, 1, 0.6117647, 0, 1,
-1.328983, 0.2007268, -1.841409, 1, 0.6196079, 0, 1,
-1.318241, -0.2669335, -3.361858, 1, 0.6235294, 0, 1,
-1.302755, -2.379189, -2.889578, 1, 0.6313726, 0, 1,
-1.301984, 0.1728196, -2.579684, 1, 0.6352941, 0, 1,
-1.300959, -0.3588524, -1.466187, 1, 0.6431373, 0, 1,
-1.299336, -0.6486256, -3.004977, 1, 0.6470588, 0, 1,
-1.294912, -0.7847641, -3.210371, 1, 0.654902, 0, 1,
-1.276116, -0.5189245, -1.130713, 1, 0.6588235, 0, 1,
-1.267581, -0.7383655, -0.8417162, 1, 0.6666667, 0, 1,
-1.264265, 1.532092, -0.1714455, 1, 0.6705883, 0, 1,
-1.263774, -0.5871537, -1.918333, 1, 0.6784314, 0, 1,
-1.26272, -0.2844723, -0.4888106, 1, 0.682353, 0, 1,
-1.262174, -0.5624078, -2.621316, 1, 0.6901961, 0, 1,
-1.258939, -1.236344, -1.838334, 1, 0.6941177, 0, 1,
-1.252334, 0.8590505, -1.369221, 1, 0.7019608, 0, 1,
-1.250732, -0.9235626, -4.181206, 1, 0.7098039, 0, 1,
-1.248743, -0.4621297, -1.300012, 1, 0.7137255, 0, 1,
-1.247176, -0.3213632, -1.681387, 1, 0.7215686, 0, 1,
-1.239054, 3.081199, -1.182931, 1, 0.7254902, 0, 1,
-1.234932, 0.009362056, -1.931412, 1, 0.7333333, 0, 1,
-1.23256, -0.8111997, -3.163746, 1, 0.7372549, 0, 1,
-1.227659, 0.3738334, -2.102957, 1, 0.7450981, 0, 1,
-1.22353, 0.03381484, -0.5791888, 1, 0.7490196, 0, 1,
-1.218626, -0.8305629, -2.548085, 1, 0.7568628, 0, 1,
-1.215759, 0.2569118, -0.4971245, 1, 0.7607843, 0, 1,
-1.195095, -0.2289528, -1.075074, 1, 0.7686275, 0, 1,
-1.182185, -0.1899987, -2.761708, 1, 0.772549, 0, 1,
-1.165488, -0.4262288, -0.3576889, 1, 0.7803922, 0, 1,
-1.163054, 0.9971548, -0.5686991, 1, 0.7843137, 0, 1,
-1.161814, -0.1306048, -1.2166, 1, 0.7921569, 0, 1,
-1.156716, 0.8562968, -0.5276294, 1, 0.7960784, 0, 1,
-1.146942, 1.910686, -1.556822, 1, 0.8039216, 0, 1,
-1.145336, 1.104439, -0.6658829, 1, 0.8117647, 0, 1,
-1.129826, -0.136617, -2.377213, 1, 0.8156863, 0, 1,
-1.127163, -0.7257947, -1.322814, 1, 0.8235294, 0, 1,
-1.125311, 0.07274619, -3.785517, 1, 0.827451, 0, 1,
-1.112891, 0.5928572, -1.650972, 1, 0.8352941, 0, 1,
-1.112462, -0.6118752, -0.9608358, 1, 0.8392157, 0, 1,
-1.11242, 0.01371669, -0.5064839, 1, 0.8470588, 0, 1,
-1.109252, -0.4654143, -0.9528345, 1, 0.8509804, 0, 1,
-1.095541, 1.735151, -1.800005, 1, 0.8588235, 0, 1,
-1.091381, -1.174984, -2.274915, 1, 0.8627451, 0, 1,
-1.081823, 0.9244776, -1.26003, 1, 0.8705882, 0, 1,
-1.077543, 1.756195, 0.9380918, 1, 0.8745098, 0, 1,
-1.076334, 0.9025916, 0.5750784, 1, 0.8823529, 0, 1,
-1.072323, -0.2749999, 0.02004233, 1, 0.8862745, 0, 1,
-1.067455, -0.9273673, -1.769358, 1, 0.8941177, 0, 1,
-1.067163, 1.518306, -0.7409122, 1, 0.8980392, 0, 1,
-1.065615, -0.06932645, -2.52693, 1, 0.9058824, 0, 1,
-1.059653, -0.1547596, -3.409288, 1, 0.9137255, 0, 1,
-1.056393, 1.152456, -0.2536193, 1, 0.9176471, 0, 1,
-1.050732, 0.4093941, -3.414943, 1, 0.9254902, 0, 1,
-1.044905, 1.215699, 0.5529221, 1, 0.9294118, 0, 1,
-1.030574, 1.290483, 0.6254146, 1, 0.9372549, 0, 1,
-1.026639, -1.065514, -2.67183, 1, 0.9411765, 0, 1,
-1.023418, -0.1565374, -2.671006, 1, 0.9490196, 0, 1,
-1.019303, -1.772528, -1.983767, 1, 0.9529412, 0, 1,
-1.004869, -0.4351656, -1.703152, 1, 0.9607843, 0, 1,
-0.9995903, 1.245244, -1.050564, 1, 0.9647059, 0, 1,
-0.9932951, 1.23392, -1.18718, 1, 0.972549, 0, 1,
-0.9915232, -2.358979, -2.097085, 1, 0.9764706, 0, 1,
-0.9861336, -0.1751488, -0.8316341, 1, 0.9843137, 0, 1,
-0.9811319, -1.394183, -2.900639, 1, 0.9882353, 0, 1,
-0.9810261, -0.2900093, 0.08799677, 1, 0.9960784, 0, 1,
-0.9767689, 0.4097613, -1.236864, 0.9960784, 1, 0, 1,
-0.9707211, 0.5416311, -2.062563, 0.9921569, 1, 0, 1,
-0.9706578, -1.467475, -0.5558991, 0.9843137, 1, 0, 1,
-0.9703712, 1.889251, -0.8141719, 0.9803922, 1, 0, 1,
-0.968711, -0.3968961, -3.468934, 0.972549, 1, 0, 1,
-0.966502, 0.4109888, -2.534305, 0.9686275, 1, 0, 1,
-0.9653453, 0.4297969, -0.5327823, 0.9607843, 1, 0, 1,
-0.9629362, -1.516523, -3.502914, 0.9568627, 1, 0, 1,
-0.956336, -1.1395, -1.680412, 0.9490196, 1, 0, 1,
-0.9280905, 0.7753343, 0.1787978, 0.945098, 1, 0, 1,
-0.923725, 0.4446891, -1.894819, 0.9372549, 1, 0, 1,
-0.9231546, -2.870811, -2.318404, 0.9333333, 1, 0, 1,
-0.9180127, 0.09865355, -0.8101037, 0.9254902, 1, 0, 1,
-0.9126617, 0.5696631, -0.7563804, 0.9215686, 1, 0, 1,
-0.9029022, 1.414613, -0.2104293, 0.9137255, 1, 0, 1,
-0.9021711, -0.3469765, -2.103482, 0.9098039, 1, 0, 1,
-0.9006365, 0.4988168, 0.5686452, 0.9019608, 1, 0, 1,
-0.8929263, -0.4232312, -2.412394, 0.8941177, 1, 0, 1,
-0.8856432, -0.0458387, -2.816861, 0.8901961, 1, 0, 1,
-0.8614031, 0.1559398, -3.474596, 0.8823529, 1, 0, 1,
-0.8593951, -0.2874002, -0.2592108, 0.8784314, 1, 0, 1,
-0.8563154, 0.4808823, -1.338743, 0.8705882, 1, 0, 1,
-0.8521753, 0.1081475, -1.419567, 0.8666667, 1, 0, 1,
-0.8512435, -0.5428479, -1.206604, 0.8588235, 1, 0, 1,
-0.8458137, -0.4578237, -1.040378, 0.854902, 1, 0, 1,
-0.84275, 0.860278, -0.3942845, 0.8470588, 1, 0, 1,
-0.8420477, -0.5747939, -2.072999, 0.8431373, 1, 0, 1,
-0.8388394, -0.6656938, -3.018174, 0.8352941, 1, 0, 1,
-0.8351435, -0.6000361, -0.722378, 0.8313726, 1, 0, 1,
-0.8326304, 0.301191, -2.071599, 0.8235294, 1, 0, 1,
-0.8323153, -1.193211, -1.732673, 0.8196079, 1, 0, 1,
-0.8271807, 0.2238573, -0.8975798, 0.8117647, 1, 0, 1,
-0.8217663, 1.821803, -1.084335, 0.8078431, 1, 0, 1,
-0.8188614, -1.225035, -3.323225, 0.8, 1, 0, 1,
-0.8188263, -2.549031, -0.9837115, 0.7921569, 1, 0, 1,
-0.8170086, 0.4252058, -1.863646, 0.7882353, 1, 0, 1,
-0.816833, 1.270929, 0.5608932, 0.7803922, 1, 0, 1,
-0.8100755, -0.2819225, -3.070495, 0.7764706, 1, 0, 1,
-0.8079419, -2.391469, -3.601285, 0.7686275, 1, 0, 1,
-0.8070664, 0.9239451, -0.6040254, 0.7647059, 1, 0, 1,
-0.8017823, -0.7935902, -2.777967, 0.7568628, 1, 0, 1,
-0.8003759, 0.4599286, -1.766313, 0.7529412, 1, 0, 1,
-0.7959186, 1.115283, -2.859264, 0.7450981, 1, 0, 1,
-0.7950091, -2.115811, -1.039124, 0.7411765, 1, 0, 1,
-0.7890528, 1.702984, -1.510304, 0.7333333, 1, 0, 1,
-0.7853568, 0.1456719, -0.532871, 0.7294118, 1, 0, 1,
-0.7846397, -2.163845, -2.156958, 0.7215686, 1, 0, 1,
-0.7827323, 0.3184965, -0.1307319, 0.7176471, 1, 0, 1,
-0.7786931, 0.311622, -1.087189, 0.7098039, 1, 0, 1,
-0.777043, -0.2635455, -1.711172, 0.7058824, 1, 0, 1,
-0.7768552, 1.127875, -0.837816, 0.6980392, 1, 0, 1,
-0.7766224, -0.5560427, -3.236712, 0.6901961, 1, 0, 1,
-0.7756668, 0.5046266, -0.3890118, 0.6862745, 1, 0, 1,
-0.7714524, 1.744417, 0.4798416, 0.6784314, 1, 0, 1,
-0.7580543, -0.1462914, -2.340175, 0.6745098, 1, 0, 1,
-0.7569431, 0.7766983, -0.4787773, 0.6666667, 1, 0, 1,
-0.7568405, -0.2557873, -1.79346, 0.6627451, 1, 0, 1,
-0.7544023, -0.8014207, -1.105971, 0.654902, 1, 0, 1,
-0.7522507, -1.386819, -2.618561, 0.6509804, 1, 0, 1,
-0.7507424, -0.9655603, -3.602235, 0.6431373, 1, 0, 1,
-0.7448699, 0.1419294, 0.4537529, 0.6392157, 1, 0, 1,
-0.7438158, 0.2465955, -0.5972587, 0.6313726, 1, 0, 1,
-0.7410736, -0.3810633, -2.468889, 0.627451, 1, 0, 1,
-0.7382331, 0.5784748, -2.619708, 0.6196079, 1, 0, 1,
-0.7319703, 0.1141283, 0.2804185, 0.6156863, 1, 0, 1,
-0.7282375, -0.6886112, -2.003698, 0.6078432, 1, 0, 1,
-0.7276701, 0.08584067, -0.8681107, 0.6039216, 1, 0, 1,
-0.7235367, 0.1853207, -0.2762446, 0.5960785, 1, 0, 1,
-0.7224338, -0.1280614, -3.701736, 0.5882353, 1, 0, 1,
-0.7213473, -1.336444, -1.661373, 0.5843138, 1, 0, 1,
-0.7172818, -0.07950845, -0.5442606, 0.5764706, 1, 0, 1,
-0.7158768, 0.9562749, -0.7463, 0.572549, 1, 0, 1,
-0.7150156, 0.365984, -0.9866614, 0.5647059, 1, 0, 1,
-0.711143, 0.195969, -0.1228111, 0.5607843, 1, 0, 1,
-0.7007388, 0.005635911, -2.102422, 0.5529412, 1, 0, 1,
-0.695185, 0.1883312, -1.77786, 0.5490196, 1, 0, 1,
-0.6939227, -0.3844309, -2.723392, 0.5411765, 1, 0, 1,
-0.6880208, 1.141586, -1.268394, 0.5372549, 1, 0, 1,
-0.6874095, 0.6103972, -0.4043371, 0.5294118, 1, 0, 1,
-0.6829634, -0.4459498, -3.505389, 0.5254902, 1, 0, 1,
-0.6808294, 0.9027523, -0.6350679, 0.5176471, 1, 0, 1,
-0.6733929, 0.0517568, -2.263049, 0.5137255, 1, 0, 1,
-0.6732674, 1.39389, -2.217084, 0.5058824, 1, 0, 1,
-0.6634749, 0.3501192, 0.6779825, 0.5019608, 1, 0, 1,
-0.6585453, 2.802028, -1.068291, 0.4941176, 1, 0, 1,
-0.6527824, 0.8803061, 0.1033088, 0.4862745, 1, 0, 1,
-0.6512472, -0.08577578, -1.343474, 0.4823529, 1, 0, 1,
-0.6476833, -0.09835854, -4.105346, 0.4745098, 1, 0, 1,
-0.6404862, 1.121692, -0.7774702, 0.4705882, 1, 0, 1,
-0.638047, -1.486245, -3.664141, 0.4627451, 1, 0, 1,
-0.6316882, -1.813925, -1.148585, 0.4588235, 1, 0, 1,
-0.6310706, -0.9363063, -2.264754, 0.4509804, 1, 0, 1,
-0.6277199, -0.06881668, -3.223289, 0.4470588, 1, 0, 1,
-0.6245671, -0.09700047, -1.398791, 0.4392157, 1, 0, 1,
-0.6237484, -0.6788399, -3.705459, 0.4352941, 1, 0, 1,
-0.6186977, 0.2667966, -1.523754, 0.427451, 1, 0, 1,
-0.6186356, 0.2847551, -2.098556, 0.4235294, 1, 0, 1,
-0.6182728, 0.1821504, -0.6171157, 0.4156863, 1, 0, 1,
-0.6167455, -1.416182, -3.545957, 0.4117647, 1, 0, 1,
-0.6127412, -1.326719, -1.998266, 0.4039216, 1, 0, 1,
-0.6127089, 0.7403264, -0.7686382, 0.3960784, 1, 0, 1,
-0.6116818, -1.92773, -2.469347, 0.3921569, 1, 0, 1,
-0.6104713, -2.02628, -4.884213, 0.3843137, 1, 0, 1,
-0.6067076, -0.4346718, -0.2904778, 0.3803922, 1, 0, 1,
-0.6058763, -0.1284875, -2.516331, 0.372549, 1, 0, 1,
-0.6045687, -0.1922909, -1.998998, 0.3686275, 1, 0, 1,
-0.6014651, 1.212929, 0.8796642, 0.3607843, 1, 0, 1,
-0.5957643, 0.4757811, -1.328377, 0.3568628, 1, 0, 1,
-0.5950056, -0.8136625, -1.252721, 0.3490196, 1, 0, 1,
-0.5945342, 0.1761748, -1.143298, 0.345098, 1, 0, 1,
-0.5892475, 0.770848, -0.1747255, 0.3372549, 1, 0, 1,
-0.5827928, -0.4266527, 0.1456344, 0.3333333, 1, 0, 1,
-0.5778674, 0.02100085, -1.595844, 0.3254902, 1, 0, 1,
-0.5778589, 0.2155325, -2.42285, 0.3215686, 1, 0, 1,
-0.5758812, -0.8096316, -2.926005, 0.3137255, 1, 0, 1,
-0.5756835, -1.191244, -2.215763, 0.3098039, 1, 0, 1,
-0.5744447, -0.3409449, -3.807676, 0.3019608, 1, 0, 1,
-0.5717145, 0.01808369, -2.11884, 0.2941177, 1, 0, 1,
-0.5713795, -0.658349, -2.815967, 0.2901961, 1, 0, 1,
-0.5673566, -1.067618, -4.064445, 0.282353, 1, 0, 1,
-0.566447, -0.232841, -3.098061, 0.2784314, 1, 0, 1,
-0.5655702, 0.8754644, -0.1701464, 0.2705882, 1, 0, 1,
-0.5633118, -0.1680965, -3.939381, 0.2666667, 1, 0, 1,
-0.5602381, 0.07872519, -0.4042396, 0.2588235, 1, 0, 1,
-0.5544223, -0.6368619, -1.229216, 0.254902, 1, 0, 1,
-0.5531415, -0.3251663, -1.609274, 0.2470588, 1, 0, 1,
-0.5485445, -1.000957, -1.533729, 0.2431373, 1, 0, 1,
-0.5389431, 2.259353, -0.005196234, 0.2352941, 1, 0, 1,
-0.5387572, -0.539209, -3.064964, 0.2313726, 1, 0, 1,
-0.5363278, -0.02300181, -1.833794, 0.2235294, 1, 0, 1,
-0.5355282, 0.8710393, -2.972946, 0.2196078, 1, 0, 1,
-0.5313148, 0.9758993, -0.6545933, 0.2117647, 1, 0, 1,
-0.5311202, -0.05086084, -3.200595, 0.2078431, 1, 0, 1,
-0.5267306, 0.7679821, -0.9091909, 0.2, 1, 0, 1,
-0.5256706, 1.028097, -0.1392381, 0.1921569, 1, 0, 1,
-0.5211626, 1.626611, 0.3949668, 0.1882353, 1, 0, 1,
-0.5150107, 0.9039632, -0.9587341, 0.1803922, 1, 0, 1,
-0.5139782, -0.2146098, -2.377692, 0.1764706, 1, 0, 1,
-0.5121304, -0.2073842, -1.4495, 0.1686275, 1, 0, 1,
-0.511417, 0.3276896, -1.185945, 0.1647059, 1, 0, 1,
-0.5062028, 1.019125, -1.417553, 0.1568628, 1, 0, 1,
-0.4964842, -1.192058, -4.691826, 0.1529412, 1, 0, 1,
-0.4783652, 1.25037, 0.2667421, 0.145098, 1, 0, 1,
-0.4713862, -0.5993675, -3.797092, 0.1411765, 1, 0, 1,
-0.4694943, 0.7046511, -1.382236, 0.1333333, 1, 0, 1,
-0.4611331, -1.034552, -3.102921, 0.1294118, 1, 0, 1,
-0.457913, -0.1687256, -1.169464, 0.1215686, 1, 0, 1,
-0.454661, -0.424071, -1.841708, 0.1176471, 1, 0, 1,
-0.4516609, -0.2347608, -0.7272556, 0.1098039, 1, 0, 1,
-0.4484197, -1.255094, -3.090171, 0.1058824, 1, 0, 1,
-0.4333813, -0.3553302, -0.8671265, 0.09803922, 1, 0, 1,
-0.4324222, 0.8087714, -2.187066, 0.09019608, 1, 0, 1,
-0.4283261, 0.3888036, -1.014606, 0.08627451, 1, 0, 1,
-0.4273056, -1.064788, -2.004412, 0.07843138, 1, 0, 1,
-0.419934, -0.2041146, -1.083326, 0.07450981, 1, 0, 1,
-0.4174685, -0.9051697, -0.7565346, 0.06666667, 1, 0, 1,
-0.4166576, -0.5138745, -0.8749031, 0.0627451, 1, 0, 1,
-0.4158328, 1.332595, -0.422577, 0.05490196, 1, 0, 1,
-0.4130034, 0.3193168, 0.7763466, 0.05098039, 1, 0, 1,
-0.4124896, -0.0171922, 0.3559819, 0.04313726, 1, 0, 1,
-0.4117006, 0.8399909, -0.7614162, 0.03921569, 1, 0, 1,
-0.4084586, 2.332348, -0.2858355, 0.03137255, 1, 0, 1,
-0.4074842, -0.1857258, -1.13908, 0.02745098, 1, 0, 1,
-0.4052598, -0.4218039, -3.3027, 0.01960784, 1, 0, 1,
-0.4034525, -0.1004999, -1.47984, 0.01568628, 1, 0, 1,
-0.3969301, -0.3706613, -2.048717, 0.007843138, 1, 0, 1,
-0.3907901, -1.335245, -3.076308, 0.003921569, 1, 0, 1,
-0.3906839, -0.1346231, -1.987699, 0, 1, 0.003921569, 1,
-0.3885985, 0.7998351, -1.56058, 0, 1, 0.01176471, 1,
-0.3878036, -0.8516612, -1.851225, 0, 1, 0.01568628, 1,
-0.3873517, 0.3310364, -0.5592843, 0, 1, 0.02352941, 1,
-0.3833088, 0.7329051, 0.8368505, 0, 1, 0.02745098, 1,
-0.3793729, -0.19865, -2.983003, 0, 1, 0.03529412, 1,
-0.3778921, -1.45861, -3.44021, 0, 1, 0.03921569, 1,
-0.376779, -0.4010213, -1.85483, 0, 1, 0.04705882, 1,
-0.3726148, -0.4071536, -3.846603, 0, 1, 0.05098039, 1,
-0.3715661, 1.153438, -0.2728574, 0, 1, 0.05882353, 1,
-0.3708451, 1.137394, -0.4750172, 0, 1, 0.0627451, 1,
-0.3703527, 0.304189, -0.1950909, 0, 1, 0.07058824, 1,
-0.3652948, 0.6036556, -0.6274428, 0, 1, 0.07450981, 1,
-0.3642623, 0.9984299, -0.3909255, 0, 1, 0.08235294, 1,
-0.3540623, 0.2555874, -1.418459, 0, 1, 0.08627451, 1,
-0.3496614, 0.0448008, -0.4347042, 0, 1, 0.09411765, 1,
-0.3451254, -0.7093662, -2.694592, 0, 1, 0.1019608, 1,
-0.344613, -1.605258, -2.852793, 0, 1, 0.1058824, 1,
-0.3441029, 0.2064106, -0.9078124, 0, 1, 0.1137255, 1,
-0.3434476, 0.4388895, -0.7482749, 0, 1, 0.1176471, 1,
-0.3422156, 0.5843858, -0.7064745, 0, 1, 0.1254902, 1,
-0.3408744, 0.269309, -0.96751, 0, 1, 0.1294118, 1,
-0.3395742, 1.201013, -0.06042035, 0, 1, 0.1372549, 1,
-0.3374198, 1.065532, 1.379348, 0, 1, 0.1411765, 1,
-0.3365929, -0.05051666, -2.285074, 0, 1, 0.1490196, 1,
-0.3289661, -2.287344, -2.231284, 0, 1, 0.1529412, 1,
-0.3262967, -0.1119718, -0.1359791, 0, 1, 0.1607843, 1,
-0.3251098, 0.7528243, -1.008772, 0, 1, 0.1647059, 1,
-0.323381, 0.7258244, 0.5211062, 0, 1, 0.172549, 1,
-0.3197807, 0.2016557, -2.082766, 0, 1, 0.1764706, 1,
-0.3161682, -1.302236, -4.224821, 0, 1, 0.1843137, 1,
-0.3122848, -1.580949, -2.597602, 0, 1, 0.1882353, 1,
-0.306751, 0.6833799, -1.526138, 0, 1, 0.1960784, 1,
-0.3012464, 1.394739, 0.1524251, 0, 1, 0.2039216, 1,
-0.3008434, -0.3572953, -1.43747, 0, 1, 0.2078431, 1,
-0.2992374, -1.453607, -0.8001041, 0, 1, 0.2156863, 1,
-0.298755, 1.132364, 0.6953496, 0, 1, 0.2196078, 1,
-0.2954081, -1.762465, -2.919567, 0, 1, 0.227451, 1,
-0.2942531, -0.3943358, -1.901044, 0, 1, 0.2313726, 1,
-0.2924621, 0.2823378, -0.9389002, 0, 1, 0.2392157, 1,
-0.2910643, -0.09321196, -2.38411, 0, 1, 0.2431373, 1,
-0.2812676, 3.131649, -1.005058, 0, 1, 0.2509804, 1,
-0.2733722, 1.937287, -0.1268221, 0, 1, 0.254902, 1,
-0.272727, -0.8210204, -3.641201, 0, 1, 0.2627451, 1,
-0.2699138, -0.8895236, -2.191839, 0, 1, 0.2666667, 1,
-0.2681492, -0.1743192, -0.9361008, 0, 1, 0.2745098, 1,
-0.2674178, 1.010197, -1.316113, 0, 1, 0.2784314, 1,
-0.2595564, 1.297441, 0.1136662, 0, 1, 0.2862745, 1,
-0.2539733, 0.7509489, -0.6072487, 0, 1, 0.2901961, 1,
-0.2497277, 3.229381, 1.166775, 0, 1, 0.2980392, 1,
-0.2469717, -1.162657, -3.809986, 0, 1, 0.3058824, 1,
-0.2461842, 0.9430504, -0.6741833, 0, 1, 0.3098039, 1,
-0.2447409, -0.02367743, -1.714324, 0, 1, 0.3176471, 1,
-0.2430143, -0.6612806, -0.6018265, 0, 1, 0.3215686, 1,
-0.2423182, 0.5155366, -0.03301353, 0, 1, 0.3294118, 1,
-0.2374927, -0.6741354, -2.392509, 0, 1, 0.3333333, 1,
-0.2339676, -0.3139048, -0.8264439, 0, 1, 0.3411765, 1,
-0.2312389, 0.01746333, -2.243213, 0, 1, 0.345098, 1,
-0.227343, -1.398761, -2.50325, 0, 1, 0.3529412, 1,
-0.2255425, -0.01771064, -0.2983145, 0, 1, 0.3568628, 1,
-0.2243143, -1.178665, -4.045871, 0, 1, 0.3647059, 1,
-0.2235689, -1.51019, -4.71738, 0, 1, 0.3686275, 1,
-0.2219202, 1.093391, 0.5494263, 0, 1, 0.3764706, 1,
-0.2218089, 0.8454286, 0.2472441, 0, 1, 0.3803922, 1,
-0.2203545, -0.4219893, -1.781292, 0, 1, 0.3882353, 1,
-0.2164563, -0.01170137, -2.312338, 0, 1, 0.3921569, 1,
-0.2162776, -0.257832, -2.864689, 0, 1, 0.4, 1,
-0.2145935, 0.7476516, -0.9276125, 0, 1, 0.4078431, 1,
-0.2131212, 0.3150125, 0.6911966, 0, 1, 0.4117647, 1,
-0.2125663, -1.037061, -4.837681, 0, 1, 0.4196078, 1,
-0.2030936, -0.04976787, -3.270692, 0, 1, 0.4235294, 1,
-0.2018818, -0.2326132, -3.213315, 0, 1, 0.4313726, 1,
-0.2005972, 0.1303051, -0.3028366, 0, 1, 0.4352941, 1,
-0.1870096, -1.659546, -1.251398, 0, 1, 0.4431373, 1,
-0.1864337, 1.319165, 0.8440158, 0, 1, 0.4470588, 1,
-0.183189, 1.532301, -0.8806182, 0, 1, 0.454902, 1,
-0.1822703, 0.7062676, 0.3972811, 0, 1, 0.4588235, 1,
-0.1764354, 0.4235606, -1.305507, 0, 1, 0.4666667, 1,
-0.1760016, 1.544953, -0.6906446, 0, 1, 0.4705882, 1,
-0.1759792, -0.01694313, -1.728631, 0, 1, 0.4784314, 1,
-0.1734748, -1.033422, -2.160604, 0, 1, 0.4823529, 1,
-0.1698152, 1.285076, -0.3326644, 0, 1, 0.4901961, 1,
-0.1667705, 0.1005792, -0.4803112, 0, 1, 0.4941176, 1,
-0.1651234, 1.154344, -0.932354, 0, 1, 0.5019608, 1,
-0.1607005, -0.4295264, -2.341286, 0, 1, 0.509804, 1,
-0.1598416, -0.01754972, -0.2814705, 0, 1, 0.5137255, 1,
-0.158871, -1.307962, -2.865095, 0, 1, 0.5215687, 1,
-0.1583792, -0.2806416, -3.040936, 0, 1, 0.5254902, 1,
-0.153901, -1.230291, -3.097239, 0, 1, 0.5333334, 1,
-0.1523871, -0.7629737, -3.05003, 0, 1, 0.5372549, 1,
-0.1510451, -0.6685999, -0.9639334, 0, 1, 0.5450981, 1,
-0.1495086, -0.4252971, -1.837713, 0, 1, 0.5490196, 1,
-0.1492009, -1.354333, -1.71595, 0, 1, 0.5568628, 1,
-0.1474356, -1.07182, -3.161906, 0, 1, 0.5607843, 1,
-0.1442506, -1.731016, -4.161361, 0, 1, 0.5686275, 1,
-0.143608, 0.7882166, -1.649043, 0, 1, 0.572549, 1,
-0.142932, 0.8099136, -0.5367323, 0, 1, 0.5803922, 1,
-0.14125, 0.63564, -1.918252, 0, 1, 0.5843138, 1,
-0.1387616, -0.2255997, -1.969982, 0, 1, 0.5921569, 1,
-0.1350246, 0.8276502, 1.887818, 0, 1, 0.5960785, 1,
-0.1318292, 0.1655994, -0.1031091, 0, 1, 0.6039216, 1,
-0.1312203, -1.848309, -2.213422, 0, 1, 0.6117647, 1,
-0.129622, -0.3464693, -2.777244, 0, 1, 0.6156863, 1,
-0.1249999, -0.05117935, -2.22907, 0, 1, 0.6235294, 1,
-0.1249135, -0.6001198, -3.566118, 0, 1, 0.627451, 1,
-0.1234636, -1.49656, -2.769109, 0, 1, 0.6352941, 1,
-0.1211481, 0.2834771, -1.205187, 0, 1, 0.6392157, 1,
-0.1198083, -1.345154, -2.07315, 0, 1, 0.6470588, 1,
-0.1171635, 0.07082234, -0.922227, 0, 1, 0.6509804, 1,
-0.1151917, 0.03405899, -2.816422, 0, 1, 0.6588235, 1,
-0.1106393, 1.71114, -0.1560419, 0, 1, 0.6627451, 1,
-0.1095824, -0.5151073, -2.174377, 0, 1, 0.6705883, 1,
-0.1069146, -0.8659118, -3.039113, 0, 1, 0.6745098, 1,
-0.1052874, -1.702158, -4.203763, 0, 1, 0.682353, 1,
-0.1035957, 1.645215, 0.0003635879, 0, 1, 0.6862745, 1,
-0.1013399, 1.26301, -0.8640848, 0, 1, 0.6941177, 1,
-0.1006655, 1.919675, 0.7984385, 0, 1, 0.7019608, 1,
-0.100519, -1.323574, -4.759975, 0, 1, 0.7058824, 1,
-0.09794027, -1.423796, -1.460273, 0, 1, 0.7137255, 1,
-0.0969847, 0.3763053, -0.8507022, 0, 1, 0.7176471, 1,
-0.09694834, -0.3485644, -3.355967, 0, 1, 0.7254902, 1,
-0.09285492, 0.5759693, -0.2366283, 0, 1, 0.7294118, 1,
-0.09254993, 0.4556428, -0.2201682, 0, 1, 0.7372549, 1,
-0.08962337, -1.052131, -2.429609, 0, 1, 0.7411765, 1,
-0.08687209, 1.069412, -0.5116355, 0, 1, 0.7490196, 1,
-0.08650093, -1.150588, -2.585994, 0, 1, 0.7529412, 1,
-0.08566269, -0.3939698, -2.165593, 0, 1, 0.7607843, 1,
-0.08107368, -0.3984292, -2.288883, 0, 1, 0.7647059, 1,
-0.07155462, 1.077367, 1.386603, 0, 1, 0.772549, 1,
-0.06950407, 0.5333802, -0.7614352, 0, 1, 0.7764706, 1,
-0.06851801, -1.827783, -3.477069, 0, 1, 0.7843137, 1,
-0.06571779, 0.8683968, -0.5008965, 0, 1, 0.7882353, 1,
-0.0648733, 1.083651, -1.212587, 0, 1, 0.7960784, 1,
-0.06428988, 0.01759013, -0.8580039, 0, 1, 0.8039216, 1,
-0.06316983, -0.6924596, -2.671184, 0, 1, 0.8078431, 1,
-0.06161229, -1.09164, -3.262973, 0, 1, 0.8156863, 1,
-0.06004847, 0.3481984, -0.5125047, 0, 1, 0.8196079, 1,
-0.05966647, -0.3546098, -1.787657, 0, 1, 0.827451, 1,
-0.0577696, -0.9310716, -4.529022, 0, 1, 0.8313726, 1,
-0.05523666, 0.1287029, -0.984309, 0, 1, 0.8392157, 1,
-0.05245079, -0.243306, -2.803599, 0, 1, 0.8431373, 1,
-0.04860266, 0.6106619, -1.464963, 0, 1, 0.8509804, 1,
-0.04356354, -0.2535687, -1.762993, 0, 1, 0.854902, 1,
-0.04300175, -1.230388, -2.211982, 0, 1, 0.8627451, 1,
-0.03457609, -1.601758, -3.782753, 0, 1, 0.8666667, 1,
-0.03451455, 0.547721, 0.9775529, 0, 1, 0.8745098, 1,
-0.02476192, -0.3929779, -1.895367, 0, 1, 0.8784314, 1,
-0.02454234, 0.1853112, 0.5032235, 0, 1, 0.8862745, 1,
-0.02396787, -1.266451, -2.583978, 0, 1, 0.8901961, 1,
-0.02212035, -0.239671, -4.203325, 0, 1, 0.8980392, 1,
-0.02117203, 0.4233897, 0.6236195, 0, 1, 0.9058824, 1,
-0.02070588, -1.066102, -4.344365, 0, 1, 0.9098039, 1,
-0.01368475, -1.153342, -3.643557, 0, 1, 0.9176471, 1,
-0.01267822, -1.280661, -3.785972, 0, 1, 0.9215686, 1,
-0.007808216, 0.5623412, 0.4662862, 0, 1, 0.9294118, 1,
0.0007932425, 0.03178166, 0.7349761, 0, 1, 0.9333333, 1,
0.001810846, 0.1366937, -1.090877, 0, 1, 0.9411765, 1,
0.002947463, 0.4792628, -0.6618306, 0, 1, 0.945098, 1,
0.007052806, -0.8025486, 3.190649, 0, 1, 0.9529412, 1,
0.007186981, -0.6656789, 2.747753, 0, 1, 0.9568627, 1,
0.009772005, -0.2034629, 3.481802, 0, 1, 0.9647059, 1,
0.0117239, 0.9559367, 1.164445, 0, 1, 0.9686275, 1,
0.01333849, 0.85259, -0.7413641, 0, 1, 0.9764706, 1,
0.01754677, 1.090358, 0.188553, 0, 1, 0.9803922, 1,
0.02364069, -1.252901, 3.671768, 0, 1, 0.9882353, 1,
0.02376183, 0.1278596, -0.5649635, 0, 1, 0.9921569, 1,
0.02478796, 0.862987, 1.059372, 0, 1, 1, 1,
0.025034, -1.762114, 1.008355, 0, 0.9921569, 1, 1,
0.02564577, 0.0421233, 2.032407, 0, 0.9882353, 1, 1,
0.02651488, 1.236098, 0.619198, 0, 0.9803922, 1, 1,
0.0277925, 1.063312, -0.08087508, 0, 0.9764706, 1, 1,
0.02915412, 0.8489634, 0.1977274, 0, 0.9686275, 1, 1,
0.03498309, -1.888072, 2.397178, 0, 0.9647059, 1, 1,
0.03568489, -1.825143, 2.306183, 0, 0.9568627, 1, 1,
0.03639687, -1.438204, 4.382983, 0, 0.9529412, 1, 1,
0.03948554, -0.3152629, 3.092692, 0, 0.945098, 1, 1,
0.04069803, 0.3938498, 1.426121, 0, 0.9411765, 1, 1,
0.04105461, -1.247039, 3.077271, 0, 0.9333333, 1, 1,
0.04133892, -0.07783303, 4.166299, 0, 0.9294118, 1, 1,
0.04273501, 1.415846, -0.7237585, 0, 0.9215686, 1, 1,
0.04398141, 0.4207506, 0.1661409, 0, 0.9176471, 1, 1,
0.04414431, -1.413819, 4.763513, 0, 0.9098039, 1, 1,
0.04439728, 0.2914009, -0.383317, 0, 0.9058824, 1, 1,
0.04622554, 1.372235, -0.7511386, 0, 0.8980392, 1, 1,
0.04626269, -2.389508, 2.324286, 0, 0.8901961, 1, 1,
0.04784189, 0.2480053, 0.4357229, 0, 0.8862745, 1, 1,
0.04992188, 1.17548, -1.569822, 0, 0.8784314, 1, 1,
0.05308957, -0.641193, 4.03775, 0, 0.8745098, 1, 1,
0.05781503, -1.208259, 2.622413, 0, 0.8666667, 1, 1,
0.05823981, -1.616473, 3.031132, 0, 0.8627451, 1, 1,
0.06119112, 1.471636, 0.8509392, 0, 0.854902, 1, 1,
0.06500135, -0.9918818, 3.693259, 0, 0.8509804, 1, 1,
0.06527388, 1.806138, 0.9442312, 0, 0.8431373, 1, 1,
0.07811583, -1.038995, 1.422515, 0, 0.8392157, 1, 1,
0.07896723, 0.8449059, 0.5649453, 0, 0.8313726, 1, 1,
0.08441477, 0.6725156, -1.594932, 0, 0.827451, 1, 1,
0.08461402, -1.140958, 4.195587, 0, 0.8196079, 1, 1,
0.08597337, 1.636553, 0.9861334, 0, 0.8156863, 1, 1,
0.08902869, 0.466222, -0.4386398, 0, 0.8078431, 1, 1,
0.08927046, 0.01378857, 1.910107, 0, 0.8039216, 1, 1,
0.09236804, -0.8339737, 0.3560408, 0, 0.7960784, 1, 1,
0.09478459, -0.9438118, 3.635887, 0, 0.7882353, 1, 1,
0.1024909, -1.079417, 2.563276, 0, 0.7843137, 1, 1,
0.1064828, 0.6481453, -0.8494493, 0, 0.7764706, 1, 1,
0.1067763, 0.4818726, 0.6598727, 0, 0.772549, 1, 1,
0.1110225, -0.346254, 4.40406, 0, 0.7647059, 1, 1,
0.1120814, 2.353947, 0.6436706, 0, 0.7607843, 1, 1,
0.1178714, -0.6301014, 1.859976, 0, 0.7529412, 1, 1,
0.1183455, 2.067062, 0.06742583, 0, 0.7490196, 1, 1,
0.1191452, 1.383527, -0.4891256, 0, 0.7411765, 1, 1,
0.1196582, 1.267742, -1.824868, 0, 0.7372549, 1, 1,
0.1202507, 0.1007285, 0.1168451, 0, 0.7294118, 1, 1,
0.1223489, -0.04398645, 1.469875, 0, 0.7254902, 1, 1,
0.1231308, 0.1480107, 0.6410999, 0, 0.7176471, 1, 1,
0.1238094, -0.1920739, 3.728569, 0, 0.7137255, 1, 1,
0.1243897, 0.3124, 1.548741, 0, 0.7058824, 1, 1,
0.1253767, 0.3143, 2.003806, 0, 0.6980392, 1, 1,
0.1258851, -0.3403101, 1.516637, 0, 0.6941177, 1, 1,
0.1281367, -0.9547331, 2.423611, 0, 0.6862745, 1, 1,
0.1298318, 0.03940527, 1.594825, 0, 0.682353, 1, 1,
0.1298648, -0.5957782, 2.499096, 0, 0.6745098, 1, 1,
0.1309856, 0.5937079, 0.2958407, 0, 0.6705883, 1, 1,
0.1314291, 0.7040972, -0.5788063, 0, 0.6627451, 1, 1,
0.1328188, -1.197519, 5.227695, 0, 0.6588235, 1, 1,
0.1410016, -0.405207, 3.215572, 0, 0.6509804, 1, 1,
0.1413609, -0.1125113, 2.526794, 0, 0.6470588, 1, 1,
0.1414551, -1.67387, 3.153878, 0, 0.6392157, 1, 1,
0.143969, 0.196029, -0.9929704, 0, 0.6352941, 1, 1,
0.1499712, -0.7921781, 4.597166, 0, 0.627451, 1, 1,
0.1563996, -1.719795, 2.855269, 0, 0.6235294, 1, 1,
0.157712, -0.1924435, 1.678889, 0, 0.6156863, 1, 1,
0.1589121, -0.8884324, 3.363664, 0, 0.6117647, 1, 1,
0.1611124, 2.218826, -0.5138625, 0, 0.6039216, 1, 1,
0.1680606, -0.2858644, 2.413596, 0, 0.5960785, 1, 1,
0.1712754, 1.482918, -1.646523, 0, 0.5921569, 1, 1,
0.171601, 0.2540301, 1.111525, 0, 0.5843138, 1, 1,
0.1717863, -1.947972, 2.176735, 0, 0.5803922, 1, 1,
0.1722956, -1.185801, 1.837432, 0, 0.572549, 1, 1,
0.1781069, 0.1993173, 2.06114, 0, 0.5686275, 1, 1,
0.1781414, 1.260947, 0.1135567, 0, 0.5607843, 1, 1,
0.1783669, 0.6422564, 0.1710261, 0, 0.5568628, 1, 1,
0.1799119, -2.433731, 2.784703, 0, 0.5490196, 1, 1,
0.1805474, -2.303485, 3.806579, 0, 0.5450981, 1, 1,
0.1825708, 0.5111651, 1.00375, 0, 0.5372549, 1, 1,
0.183599, -1.825688, 4.846119, 0, 0.5333334, 1, 1,
0.1880584, 0.7140973, 0.7784145, 0, 0.5254902, 1, 1,
0.1883346, -2.570931, 1.352236, 0, 0.5215687, 1, 1,
0.1984985, -1.130588, 2.972648, 0, 0.5137255, 1, 1,
0.2071947, 0.4780616, 2.013436, 0, 0.509804, 1, 1,
0.2082118, -1.960007, 2.667385, 0, 0.5019608, 1, 1,
0.2092182, -0.8907092, 0.8392048, 0, 0.4941176, 1, 1,
0.2124069, 0.181451, 4.34001, 0, 0.4901961, 1, 1,
0.2161066, 1.155139, -2.256977, 0, 0.4823529, 1, 1,
0.2177719, 1.147518, 0.9544501, 0, 0.4784314, 1, 1,
0.22447, 1.619229, -0.1915117, 0, 0.4705882, 1, 1,
0.228201, 1.875652, -0.4121443, 0, 0.4666667, 1, 1,
0.2286894, 0.2850724, 0.05618779, 0, 0.4588235, 1, 1,
0.2293878, 0.6172133, 1.85544, 0, 0.454902, 1, 1,
0.2297481, -0.220584, 2.24649, 0, 0.4470588, 1, 1,
0.2365254, -3.337264, 3.514766, 0, 0.4431373, 1, 1,
0.2388396, -2.268603, 1.479231, 0, 0.4352941, 1, 1,
0.2389966, 0.6996692, 0.3443817, 0, 0.4313726, 1, 1,
0.2390518, 0.9808104, 1.298284, 0, 0.4235294, 1, 1,
0.2392371, 0.8797065, -0.60264, 0, 0.4196078, 1, 1,
0.2404863, -0.991699, 2.303113, 0, 0.4117647, 1, 1,
0.2420069, -1.289093, 3.36738, 0, 0.4078431, 1, 1,
0.2431162, 0.3550075, 0.8915393, 0, 0.4, 1, 1,
0.2437361, 1.13121, 0.1725999, 0, 0.3921569, 1, 1,
0.2460628, -1.808418, 3.694992, 0, 0.3882353, 1, 1,
0.2464467, -0.9910516, 2.04462, 0, 0.3803922, 1, 1,
0.2484055, 1.457471, 1.170645, 0, 0.3764706, 1, 1,
0.2489074, 0.1230069, 0.8709396, 0, 0.3686275, 1, 1,
0.2519807, 0.5310331, 1.531693, 0, 0.3647059, 1, 1,
0.265296, 0.8883616, 0.8967922, 0, 0.3568628, 1, 1,
0.2724643, -2.052183, 2.182468, 0, 0.3529412, 1, 1,
0.2759688, 1.235082, -1.046616, 0, 0.345098, 1, 1,
0.2765962, -0.7169362, 2.565459, 0, 0.3411765, 1, 1,
0.2768572, 0.9271339, -0.1956625, 0, 0.3333333, 1, 1,
0.2777273, -0.1626916, 0.4929405, 0, 0.3294118, 1, 1,
0.2796258, -0.05133506, 1.572735, 0, 0.3215686, 1, 1,
0.2829331, -0.6910918, 3.072361, 0, 0.3176471, 1, 1,
0.2900675, -0.4282082, 1.172842, 0, 0.3098039, 1, 1,
0.2906663, 0.8454565, -0.55034, 0, 0.3058824, 1, 1,
0.291751, 0.9329322, 0.1322717, 0, 0.2980392, 1, 1,
0.2942175, 0.2221119, 1.369943, 0, 0.2901961, 1, 1,
0.2958355, -0.6252415, 3.497605, 0, 0.2862745, 1, 1,
0.2998442, 1.424318, 1.68828, 0, 0.2784314, 1, 1,
0.3005328, 0.08861756, 2.523698, 0, 0.2745098, 1, 1,
0.3016086, -0.4704365, 2.349108, 0, 0.2666667, 1, 1,
0.3134606, -0.08248812, 1.00947, 0, 0.2627451, 1, 1,
0.3137976, 1.721403, -0.664916, 0, 0.254902, 1, 1,
0.3223504, 0.630031, 0.6318799, 0, 0.2509804, 1, 1,
0.3225349, -1.122523, 4.700658, 0, 0.2431373, 1, 1,
0.3229559, -0.8823869, 2.183699, 0, 0.2392157, 1, 1,
0.3233381, 0.8497246, 0.7596201, 0, 0.2313726, 1, 1,
0.3279109, -0.7231576, 4.936394, 0, 0.227451, 1, 1,
0.3290325, -0.1519187, 1.050886, 0, 0.2196078, 1, 1,
0.3334346, 0.7362106, -0.6989026, 0, 0.2156863, 1, 1,
0.3353355, -0.3092379, 1.557618, 0, 0.2078431, 1, 1,
0.3374594, 0.199029, 1.131012, 0, 0.2039216, 1, 1,
0.3452809, -0.4024273, 1.354227, 0, 0.1960784, 1, 1,
0.3470702, -1.517071, 3.683656, 0, 0.1882353, 1, 1,
0.3490474, -0.7038106, 2.703347, 0, 0.1843137, 1, 1,
0.3492864, -1.822559, 3.026694, 0, 0.1764706, 1, 1,
0.3499115, 0.6334284, -0.476165, 0, 0.172549, 1, 1,
0.3504941, -0.1573163, 3.708493, 0, 0.1647059, 1, 1,
0.353996, -0.5461929, 3.378843, 0, 0.1607843, 1, 1,
0.3546987, -1.125774, 2.570703, 0, 0.1529412, 1, 1,
0.3558027, 1.005197, 1.226323, 0, 0.1490196, 1, 1,
0.3559539, 0.1568343, -0.129107, 0, 0.1411765, 1, 1,
0.3576851, -0.8106982, 2.221364, 0, 0.1372549, 1, 1,
0.3585182, -0.3060001, 1.078118, 0, 0.1294118, 1, 1,
0.3612374, -1.247595, 2.154199, 0, 0.1254902, 1, 1,
0.362669, -0.2159683, 3.201418, 0, 0.1176471, 1, 1,
0.3642402, -2.559372, 2.766654, 0, 0.1137255, 1, 1,
0.3652295, -1.380237, 4.084118, 0, 0.1058824, 1, 1,
0.3677758, 0.3921717, 0.1864492, 0, 0.09803922, 1, 1,
0.3695325, 1.981908, 0.5051185, 0, 0.09411765, 1, 1,
0.370035, 0.6291252, 0.8995011, 0, 0.08627451, 1, 1,
0.3735448, 0.4129833, 1.320362, 0, 0.08235294, 1, 1,
0.3742864, -2.554785, 2.944935, 0, 0.07450981, 1, 1,
0.3747623, -0.408089, 2.680674, 0, 0.07058824, 1, 1,
0.375626, 0.08741234, 0.8658059, 0, 0.0627451, 1, 1,
0.3776754, 1.31058, -0.5321484, 0, 0.05882353, 1, 1,
0.3801192, 1.594297, 1.174792, 0, 0.05098039, 1, 1,
0.3812991, 0.2344242, -0.3060275, 0, 0.04705882, 1, 1,
0.3861628, -0.494019, 2.059318, 0, 0.03921569, 1, 1,
0.3923537, 0.598601, 0.4339959, 0, 0.03529412, 1, 1,
0.3938647, -0.9282891, 2.328499, 0, 0.02745098, 1, 1,
0.3954408, 0.2203809, 0.04071231, 0, 0.02352941, 1, 1,
0.3958937, -0.6327454, 2.236061, 0, 0.01568628, 1, 1,
0.3965935, 0.2449723, 3.037302, 0, 0.01176471, 1, 1,
0.4022631, 0.4497704, 0.7689, 0, 0.003921569, 1, 1,
0.4081896, -0.6109709, 2.592025, 0.003921569, 0, 1, 1,
0.409479, 0.6690682, 2.368734, 0.007843138, 0, 1, 1,
0.4097778, -0.1138375, 2.979719, 0.01568628, 0, 1, 1,
0.4102288, -1.918818, 2.422711, 0.01960784, 0, 1, 1,
0.4118336, 0.01243945, 0.4334429, 0.02745098, 0, 1, 1,
0.4145559, 0.189614, 0.6207254, 0.03137255, 0, 1, 1,
0.414826, -0.01529243, 2.153497, 0.03921569, 0, 1, 1,
0.4209631, -0.5836299, 1.778152, 0.04313726, 0, 1, 1,
0.4256193, -0.07219015, 2.704654, 0.05098039, 0, 1, 1,
0.4272827, 0.2722726, 0.9841523, 0.05490196, 0, 1, 1,
0.4286871, -0.7946125, 1.839174, 0.0627451, 0, 1, 1,
0.4312109, 2.013339, 2.067436, 0.06666667, 0, 1, 1,
0.4317788, 0.6846554, 0.06748158, 0.07450981, 0, 1, 1,
0.4319136, 0.2995664, 0.002686232, 0.07843138, 0, 1, 1,
0.4319164, 2.297042, -0.6476678, 0.08627451, 0, 1, 1,
0.4394305, -0.325936, 2.309522, 0.09019608, 0, 1, 1,
0.439469, -0.145891, 1.957933, 0.09803922, 0, 1, 1,
0.4460258, 1.202633, 0.6841966, 0.1058824, 0, 1, 1,
0.4462077, 1.665023, -0.1201189, 0.1098039, 0, 1, 1,
0.4498764, -0.8362925, 3.815994, 0.1176471, 0, 1, 1,
0.4505081, -0.1031826, 1.240874, 0.1215686, 0, 1, 1,
0.4581539, 0.1518879, 2.362864, 0.1294118, 0, 1, 1,
0.4602759, -1.355295, 1.148659, 0.1333333, 0, 1, 1,
0.4604796, 0.05796449, 2.111366, 0.1411765, 0, 1, 1,
0.4636698, 1.342555, -0.3735377, 0.145098, 0, 1, 1,
0.4774905, -0.3169942, 0.7908933, 0.1529412, 0, 1, 1,
0.4836557, 0.2329309, 2.804922, 0.1568628, 0, 1, 1,
0.4850467, -0.1040272, 1.178653, 0.1647059, 0, 1, 1,
0.4930279, -0.9545603, 0.9880955, 0.1686275, 0, 1, 1,
0.494044, 0.8628673, 0.6248426, 0.1764706, 0, 1, 1,
0.494519, 0.6358817, 1.253081, 0.1803922, 0, 1, 1,
0.4971817, 0.9118859, 0.2332845, 0.1882353, 0, 1, 1,
0.5004538, -0.1680412, 2.235399, 0.1921569, 0, 1, 1,
0.5011135, -1.147695, 4.489468, 0.2, 0, 1, 1,
0.5013049, -0.8183623, 1.952463, 0.2078431, 0, 1, 1,
0.5079586, -0.992285, 2.608347, 0.2117647, 0, 1, 1,
0.5137999, 1.270686, 1.733499, 0.2196078, 0, 1, 1,
0.5202035, -0.5404788, 0.5539072, 0.2235294, 0, 1, 1,
0.5220807, -0.7653402, 0.47645, 0.2313726, 0, 1, 1,
0.5221331, 0.2959571, -0.3560688, 0.2352941, 0, 1, 1,
0.5227583, 0.9841147, 1.846374, 0.2431373, 0, 1, 1,
0.5244364, -1.419492, 1.762924, 0.2470588, 0, 1, 1,
0.524922, -0.8914342, 3.102695, 0.254902, 0, 1, 1,
0.5316677, -0.1015675, 0.6110227, 0.2588235, 0, 1, 1,
0.5385156, -0.8439291, 3.431748, 0.2666667, 0, 1, 1,
0.5392312, -1.131399, 2.693312, 0.2705882, 0, 1, 1,
0.5401325, 0.9211917, -0.308541, 0.2784314, 0, 1, 1,
0.5420897, 0.005324643, 0.97159, 0.282353, 0, 1, 1,
0.5448614, 0.5637479, 1.104451, 0.2901961, 0, 1, 1,
0.5454845, 1.029197, -0.06156828, 0.2941177, 0, 1, 1,
0.5462277, 0.3628195, 0.2187199, 0.3019608, 0, 1, 1,
0.5519636, 1.088814, -0.5349156, 0.3098039, 0, 1, 1,
0.5665447, 1.537146, -0.8180367, 0.3137255, 0, 1, 1,
0.570133, 0.4086094, 2.236776, 0.3215686, 0, 1, 1,
0.5714441, 0.07831551, 1.025313, 0.3254902, 0, 1, 1,
0.5719278, 0.01658492, 0.5531175, 0.3333333, 0, 1, 1,
0.5747522, -0.1980896, 4.30638, 0.3372549, 0, 1, 1,
0.577641, -2.158079, 1.062506, 0.345098, 0, 1, 1,
0.5793641, 0.1001503, 1.245763, 0.3490196, 0, 1, 1,
0.583514, -0.4511314, 1.968265, 0.3568628, 0, 1, 1,
0.5865808, 0.172995, 2.188654, 0.3607843, 0, 1, 1,
0.5907947, 0.6652164, 0.9388589, 0.3686275, 0, 1, 1,
0.5918829, -0.01842204, 4.413902, 0.372549, 0, 1, 1,
0.593281, 0.1086093, 0.4258478, 0.3803922, 0, 1, 1,
0.6031594, -0.8313365, 3.106105, 0.3843137, 0, 1, 1,
0.6048807, -0.1659337, 1.890286, 0.3921569, 0, 1, 1,
0.608052, 0.3252869, 0.3314952, 0.3960784, 0, 1, 1,
0.6099631, -0.4242088, 2.157614, 0.4039216, 0, 1, 1,
0.6103035, 1.534877, 1.728642, 0.4117647, 0, 1, 1,
0.6106455, -0.345264, 1.825241, 0.4156863, 0, 1, 1,
0.6158821, -0.9245455, 1.708922, 0.4235294, 0, 1, 1,
0.6187018, 0.8102067, 1.328148, 0.427451, 0, 1, 1,
0.6204771, 0.9295898, 0.7315514, 0.4352941, 0, 1, 1,
0.6235397, -0.7500919, 3.147811, 0.4392157, 0, 1, 1,
0.6306765, -0.07713473, 1.002724, 0.4470588, 0, 1, 1,
0.6310468, -1.214583, 2.311759, 0.4509804, 0, 1, 1,
0.6311038, 0.5437523, 0.1449325, 0.4588235, 0, 1, 1,
0.633484, 0.5532615, -1.850119, 0.4627451, 0, 1, 1,
0.6376992, -0.2700578, 2.299677, 0.4705882, 0, 1, 1,
0.6391398, 0.03384009, 0.8450872, 0.4745098, 0, 1, 1,
0.6416689, -0.6846589, 1.917699, 0.4823529, 0, 1, 1,
0.647718, 0.1452375, 4.554712, 0.4862745, 0, 1, 1,
0.6520814, 1.781632, 1.604073, 0.4941176, 0, 1, 1,
0.6527576, -0.223916, 1.663447, 0.5019608, 0, 1, 1,
0.6559047, 2.345989, 1.016863, 0.5058824, 0, 1, 1,
0.6662445, 1.500484, 0.3205481, 0.5137255, 0, 1, 1,
0.6673645, -0.9607806, 2.719028, 0.5176471, 0, 1, 1,
0.6696749, -0.1633998, 1.049983, 0.5254902, 0, 1, 1,
0.6710024, -0.7221267, 1.868308, 0.5294118, 0, 1, 1,
0.6720346, -0.3170536, 1.386911, 0.5372549, 0, 1, 1,
0.6743008, -2.022896, 2.156076, 0.5411765, 0, 1, 1,
0.67853, -0.09736685, 2.604592, 0.5490196, 0, 1, 1,
0.6786458, 1.098363, 2.892605, 0.5529412, 0, 1, 1,
0.6790752, -0.2958206, 2.065474, 0.5607843, 0, 1, 1,
0.6836753, -0.1965938, 2.364532, 0.5647059, 0, 1, 1,
0.6881414, 1.018538, 1.478549, 0.572549, 0, 1, 1,
0.6882503, -0.6454736, 2.93287, 0.5764706, 0, 1, 1,
0.6883306, 0.08557898, 0.6700402, 0.5843138, 0, 1, 1,
0.6997981, 1.119957, 1.140226, 0.5882353, 0, 1, 1,
0.7016572, -0.5468756, 2.852834, 0.5960785, 0, 1, 1,
0.7053192, -0.291085, 3.743384, 0.6039216, 0, 1, 1,
0.708562, -0.2631152, 2.161139, 0.6078432, 0, 1, 1,
0.712155, -1.528449, 2.613129, 0.6156863, 0, 1, 1,
0.7143046, -1.643826, 1.629656, 0.6196079, 0, 1, 1,
0.7274145, -0.2754299, 2.490256, 0.627451, 0, 1, 1,
0.7331516, -1.810096, 4.240685, 0.6313726, 0, 1, 1,
0.7404611, -0.3041986, 3.977375, 0.6392157, 0, 1, 1,
0.7409045, 2.61852, 0.7427218, 0.6431373, 0, 1, 1,
0.7423553, -0.5736062, 2.096806, 0.6509804, 0, 1, 1,
0.7451718, -1.752189, 2.085948, 0.654902, 0, 1, 1,
0.7459346, -0.4470342, 0.9792864, 0.6627451, 0, 1, 1,
0.7470676, -0.1074204, 1.794991, 0.6666667, 0, 1, 1,
0.7523422, -1.801715, 2.085001, 0.6745098, 0, 1, 1,
0.7564214, -1.96501, 1.951825, 0.6784314, 0, 1, 1,
0.7566253, 1.117614, 0.2858807, 0.6862745, 0, 1, 1,
0.7597811, -0.3741291, 1.945298, 0.6901961, 0, 1, 1,
0.7602479, 0.3998593, 0.2178197, 0.6980392, 0, 1, 1,
0.7714188, -1.57483, 3.467983, 0.7058824, 0, 1, 1,
0.7721344, 0.781363, 1.352984, 0.7098039, 0, 1, 1,
0.7722061, -0.2924055, 2.738434, 0.7176471, 0, 1, 1,
0.7801136, -1.233206, 1.745732, 0.7215686, 0, 1, 1,
0.7962056, -1.202532, 0.5484686, 0.7294118, 0, 1, 1,
0.8017874, 0.493459, 2.719147, 0.7333333, 0, 1, 1,
0.8050587, 1.562426, -0.116118, 0.7411765, 0, 1, 1,
0.8123193, -0.4863105, 1.124039, 0.7450981, 0, 1, 1,
0.8188499, 0.1504495, 1.122035, 0.7529412, 0, 1, 1,
0.8265439, -1.57328, 2.801151, 0.7568628, 0, 1, 1,
0.8331009, -0.164536, -0.1185565, 0.7647059, 0, 1, 1,
0.8363203, 0.4027732, 0.1227151, 0.7686275, 0, 1, 1,
0.8364196, 0.7895436, -1.236919, 0.7764706, 0, 1, 1,
0.8427498, 1.031274, 1.269707, 0.7803922, 0, 1, 1,
0.8433675, -0.5002099, 2.443698, 0.7882353, 0, 1, 1,
0.843981, 0.7270594, 1.05716, 0.7921569, 0, 1, 1,
0.8473374, -0.005109551, 1.142724, 0.8, 0, 1, 1,
0.852145, 1.129016, 0.4339418, 0.8078431, 0, 1, 1,
0.8538275, 0.7749543, -0.4957862, 0.8117647, 0, 1, 1,
0.8606851, 1.061718, 0.8653438, 0.8196079, 0, 1, 1,
0.8777013, 0.4983568, 0.9003292, 0.8235294, 0, 1, 1,
0.8800395, 0.7891727, 1.195875, 0.8313726, 0, 1, 1,
0.8813075, 1.613591, 0.9267321, 0.8352941, 0, 1, 1,
0.883677, -0.1276256, 1.87243, 0.8431373, 0, 1, 1,
0.8868453, -0.04274189, 2.662277, 0.8470588, 0, 1, 1,
0.8909587, -1.43281, 3.4867, 0.854902, 0, 1, 1,
0.8926882, -0.4148498, 2.394435, 0.8588235, 0, 1, 1,
0.9032022, 1.552012, -1.275842, 0.8666667, 0, 1, 1,
0.9047532, 0.3278972, 2.028168, 0.8705882, 0, 1, 1,
0.9058141, -0.1509249, 2.053884, 0.8784314, 0, 1, 1,
0.9098297, -0.1627333, 4.392715, 0.8823529, 0, 1, 1,
0.911797, 0.2605991, 1.441277, 0.8901961, 0, 1, 1,
0.9150155, 1.094535, 0.4780689, 0.8941177, 0, 1, 1,
0.9217924, -0.9822848, 3.181071, 0.9019608, 0, 1, 1,
0.9239207, -1.012901, 2.593249, 0.9098039, 0, 1, 1,
0.9250729, 0.126906, 1.578403, 0.9137255, 0, 1, 1,
0.9274092, -0.7728407, 2.964266, 0.9215686, 0, 1, 1,
0.9277704, 0.4796937, 1.261024, 0.9254902, 0, 1, 1,
0.9349617, -0.1303093, 1.656573, 0.9333333, 0, 1, 1,
0.9423673, 1.182496, -0.2847252, 0.9372549, 0, 1, 1,
0.9637588, 1.440113, 0.4379728, 0.945098, 0, 1, 1,
0.9637886, -0.5323322, 2.657832, 0.9490196, 0, 1, 1,
0.9670858, 0.743918, -0.6183404, 0.9568627, 0, 1, 1,
0.9672452, -0.8534318, 3.353015, 0.9607843, 0, 1, 1,
0.9757742, -1.2362, 2.68993, 0.9686275, 0, 1, 1,
0.9836175, -0.0835419, 1.623544, 0.972549, 0, 1, 1,
1.004283, 0.4242502, 0.1190137, 0.9803922, 0, 1, 1,
1.005148, 0.1808251, 0.8113261, 0.9843137, 0, 1, 1,
1.006333, -0.3742742, 0.928548, 0.9921569, 0, 1, 1,
1.00944, 1.07967, 0.3837121, 0.9960784, 0, 1, 1,
1.015851, 1.097017, -1.612515, 1, 0, 0.9960784, 1,
1.040312, -0.7874585, 4.045421, 1, 0, 0.9882353, 1,
1.040362, -1.511867, 1.928036, 1, 0, 0.9843137, 1,
1.040981, 1.343547, 0.9983506, 1, 0, 0.9764706, 1,
1.042492, -1.348882, 4.093992, 1, 0, 0.972549, 1,
1.046175, 0.7051485, 1.465423, 1, 0, 0.9647059, 1,
1.049502, 1.373304, -1.299195, 1, 0, 0.9607843, 1,
1.050086, 0.6956978, 1.011859, 1, 0, 0.9529412, 1,
1.056612, 0.3712466, 1.862787, 1, 0, 0.9490196, 1,
1.060856, -1.801817, 2.084296, 1, 0, 0.9411765, 1,
1.062083, 0.7058938, 0.8587731, 1, 0, 0.9372549, 1,
1.069496, -0.1679185, 0.1916205, 1, 0, 0.9294118, 1,
1.0701, 0.9764114, -0.4200766, 1, 0, 0.9254902, 1,
1.072454, 1.376194, 1.664123, 1, 0, 0.9176471, 1,
1.082244, -0.09085748, 2.027754, 1, 0, 0.9137255, 1,
1.087036, -0.5332335, 2.438878, 1, 0, 0.9058824, 1,
1.094987, -1.116552, 0.07189625, 1, 0, 0.9019608, 1,
1.100043, -0.186691, 0.9034373, 1, 0, 0.8941177, 1,
1.100883, 1.69203, 2.434366, 1, 0, 0.8862745, 1,
1.103338, 1.030054, 0.8824762, 1, 0, 0.8823529, 1,
1.114098, 0.1881475, 1.610801, 1, 0, 0.8745098, 1,
1.115338, -0.5153593, 1.566435, 1, 0, 0.8705882, 1,
1.117519, -0.03918864, 1.425089, 1, 0, 0.8627451, 1,
1.119904, 0.1307698, 3.48964, 1, 0, 0.8588235, 1,
1.12057, 1.921364, 0.9092109, 1, 0, 0.8509804, 1,
1.124372, 0.600699, 1.396575, 1, 0, 0.8470588, 1,
1.124779, 0.6965112, 1.81701, 1, 0, 0.8392157, 1,
1.130152, 1.898704, 0.5839261, 1, 0, 0.8352941, 1,
1.130346, 0.8693776, 0.2877392, 1, 0, 0.827451, 1,
1.13914, 1.14358, 2.583998, 1, 0, 0.8235294, 1,
1.141165, 0.3561317, 2.756466, 1, 0, 0.8156863, 1,
1.157087, 0.9193409, -0.4477538, 1, 0, 0.8117647, 1,
1.168112, -1.850347, 2.428439, 1, 0, 0.8039216, 1,
1.172068, -0.3656001, 1.883092, 1, 0, 0.7960784, 1,
1.172662, 1.506889, 0.9304977, 1, 0, 0.7921569, 1,
1.17416, 1.915204, 0.3707228, 1, 0, 0.7843137, 1,
1.180314, 0.1434812, 2.870057, 1, 0, 0.7803922, 1,
1.182055, 0.867613, 1.776282, 1, 0, 0.772549, 1,
1.185618, -0.385544, 2.231169, 1, 0, 0.7686275, 1,
1.186168, -0.6999097, 4.447007, 1, 0, 0.7607843, 1,
1.188613, 2.089318, -0.6775567, 1, 0, 0.7568628, 1,
1.189049, -0.7212012, 2.123469, 1, 0, 0.7490196, 1,
1.195357, -1.051345, 0.5895866, 1, 0, 0.7450981, 1,
1.202813, 0.303355, 1.179124, 1, 0, 0.7372549, 1,
1.207186, -0.2591121, 3.266163, 1, 0, 0.7333333, 1,
1.208921, -0.06709639, 2.818914, 1, 0, 0.7254902, 1,
1.212708, -0.644116, 3.06178, 1, 0, 0.7215686, 1,
1.213357, -1.677653, 2.94891, 1, 0, 0.7137255, 1,
1.215663, 1.499018, -0.248044, 1, 0, 0.7098039, 1,
1.2234, -0.09555912, 1.515813, 1, 0, 0.7019608, 1,
1.224082, 0.2305843, 0.9982114, 1, 0, 0.6941177, 1,
1.226886, 0.2822101, 2.6333, 1, 0, 0.6901961, 1,
1.227669, 0.6894489, 1.316988, 1, 0, 0.682353, 1,
1.233502, 0.5316198, 1.934046, 1, 0, 0.6784314, 1,
1.256229, 0.9443873, 3.539803, 1, 0, 0.6705883, 1,
1.256314, -0.346266, 1.782397, 1, 0, 0.6666667, 1,
1.270626, -0.1940418, 3.000383, 1, 0, 0.6588235, 1,
1.272392, 1.073723, 0.3197983, 1, 0, 0.654902, 1,
1.272586, -0.4017959, 1.503209, 1, 0, 0.6470588, 1,
1.282539, -0.5413333, 1.787022, 1, 0, 0.6431373, 1,
1.288489, 0.219093, 3.134177, 1, 0, 0.6352941, 1,
1.293604, -0.7508987, 1.875295, 1, 0, 0.6313726, 1,
1.323893, -0.1581862, -0.7791768, 1, 0, 0.6235294, 1,
1.33481, -0.5161783, 2.039013, 1, 0, 0.6196079, 1,
1.345121, 0.7402532, 1.937958, 1, 0, 0.6117647, 1,
1.350988, 1.124723, 0.6279918, 1, 0, 0.6078432, 1,
1.353853, -0.1531357, 2.395812, 1, 0, 0.6, 1,
1.35457, -0.1339504, 1.868307, 1, 0, 0.5921569, 1,
1.356284, 0.0008926496, 1.295044, 1, 0, 0.5882353, 1,
1.362392, 0.1736984, 1.167562, 1, 0, 0.5803922, 1,
1.369562, 0.04470904, 1.613201, 1, 0, 0.5764706, 1,
1.370479, -1.476826, 1.993962, 1, 0, 0.5686275, 1,
1.371872, -0.9460215, 1.480507, 1, 0, 0.5647059, 1,
1.38011, -0.1415648, -0.6513454, 1, 0, 0.5568628, 1,
1.38191, 0.9647506, 2.416471, 1, 0, 0.5529412, 1,
1.3892, 0.1761956, 1.050595, 1, 0, 0.5450981, 1,
1.389303, 2.562513, 0.920603, 1, 0, 0.5411765, 1,
1.402496, 1.51689, 1.170182, 1, 0, 0.5333334, 1,
1.407712, -0.1394516, 2.008839, 1, 0, 0.5294118, 1,
1.409699, 0.2907873, 2.651926, 1, 0, 0.5215687, 1,
1.409876, 0.2512754, 3.220812, 1, 0, 0.5176471, 1,
1.413974, -1.165832, 0.8876944, 1, 0, 0.509804, 1,
1.429358, 0.4071136, 1.234778, 1, 0, 0.5058824, 1,
1.437888, -0.8434423, 1.733343, 1, 0, 0.4980392, 1,
1.450402, -0.8993481, 2.208134, 1, 0, 0.4901961, 1,
1.459964, 1.049638, 0.1813213, 1, 0, 0.4862745, 1,
1.467401, -0.241223, 0.0031577, 1, 0, 0.4784314, 1,
1.484457, 1.002066, 0.4932081, 1, 0, 0.4745098, 1,
1.485036, 0.2255448, 0.9737073, 1, 0, 0.4666667, 1,
1.486354, -0.7209069, 0.4350719, 1, 0, 0.4627451, 1,
1.48887, -1.153431, 2.115626, 1, 0, 0.454902, 1,
1.489224, 1.334167, 0.5879735, 1, 0, 0.4509804, 1,
1.489637, -0.3207372, 2.963143, 1, 0, 0.4431373, 1,
1.493751, -0.4157976, 2.555137, 1, 0, 0.4392157, 1,
1.497226, -0.5158577, 0.4359511, 1, 0, 0.4313726, 1,
1.51609, 0.5631465, 1.325886, 1, 0, 0.427451, 1,
1.518005, -1.397187, 3.262327, 1, 0, 0.4196078, 1,
1.524449, 0.6744139, 2.009245, 1, 0, 0.4156863, 1,
1.531525, 0.5674149, 1.319914, 1, 0, 0.4078431, 1,
1.537723, 0.9067229, 0.6130176, 1, 0, 0.4039216, 1,
1.547655, -0.972578, 1.678899, 1, 0, 0.3960784, 1,
1.551373, 0.6219262, 2.387572, 1, 0, 0.3882353, 1,
1.566452, 0.7222028, 0.8690751, 1, 0, 0.3843137, 1,
1.572036, 1.619432, 4.057545, 1, 0, 0.3764706, 1,
1.581333, 0.237175, 3.315205, 1, 0, 0.372549, 1,
1.586236, -1.525957, 1.798885, 1, 0, 0.3647059, 1,
1.588013, 1.433553, 1.633047, 1, 0, 0.3607843, 1,
1.601747, -0.7811095, 2.811499, 1, 0, 0.3529412, 1,
1.619618, -1.338944, 2.235702, 1, 0, 0.3490196, 1,
1.622278, -0.6270584, 0.6993207, 1, 0, 0.3411765, 1,
1.627178, -1.020658, 0.7890972, 1, 0, 0.3372549, 1,
1.632639, 0.3354644, 1.727937, 1, 0, 0.3294118, 1,
1.635677, -1.318749, 3.545049, 1, 0, 0.3254902, 1,
1.648101, -1.808267, 3.989393, 1, 0, 0.3176471, 1,
1.663429, -0.08409325, 0.9848368, 1, 0, 0.3137255, 1,
1.66617, -0.2300966, 1.380924, 1, 0, 0.3058824, 1,
1.677421, -0.1043907, 2.559135, 1, 0, 0.2980392, 1,
1.678195, -2.411798, 2.112151, 1, 0, 0.2941177, 1,
1.698114, -0.5942011, 1.872332, 1, 0, 0.2862745, 1,
1.702167, 0.3492299, 3.140706, 1, 0, 0.282353, 1,
1.716451, 0.4351902, 0.6402503, 1, 0, 0.2745098, 1,
1.719686, 0.06020399, 0.9441629, 1, 0, 0.2705882, 1,
1.741478, -1.58907, 3.360806, 1, 0, 0.2627451, 1,
1.742669, 0.443028, 0.6208671, 1, 0, 0.2588235, 1,
1.748012, -1.988529, 1.63716, 1, 0, 0.2509804, 1,
1.761851, 0.6589491, 0.5751861, 1, 0, 0.2470588, 1,
1.767328, 1.035044, 1.539404, 1, 0, 0.2392157, 1,
1.78011, -2.144464, 2.032669, 1, 0, 0.2352941, 1,
1.782384, -0.1513921, -0.4773891, 1, 0, 0.227451, 1,
1.785977, -0.4455381, 3.021605, 1, 0, 0.2235294, 1,
1.790482, 0.325551, 1.358848, 1, 0, 0.2156863, 1,
1.821639, -0.7213302, 2.993297, 1, 0, 0.2117647, 1,
1.833249, -0.4962994, 0.001579659, 1, 0, 0.2039216, 1,
1.852866, 0.9233118, 0.1482733, 1, 0, 0.1960784, 1,
1.866733, 0.1994482, 1.800727, 1, 0, 0.1921569, 1,
1.879947, -0.4399625, 1.925254, 1, 0, 0.1843137, 1,
1.906066, 0.1873262, 2.325455, 1, 0, 0.1803922, 1,
1.91402, 0.7385745, 0.9058269, 1, 0, 0.172549, 1,
1.914128, 0.806381, 3.323323, 1, 0, 0.1686275, 1,
1.945043, 0.2607955, 1.249144, 1, 0, 0.1607843, 1,
1.957422, -0.9274982, 2.727347, 1, 0, 0.1568628, 1,
1.965293, 1.600054, 1.295948, 1, 0, 0.1490196, 1,
2.068679, 0.8039652, 1.060289, 1, 0, 0.145098, 1,
2.11002, 0.1906635, 0.9792439, 1, 0, 0.1372549, 1,
2.139763, 1.254538, 0.07272444, 1, 0, 0.1333333, 1,
2.148546, 0.2517314, 0.4451777, 1, 0, 0.1254902, 1,
2.173423, -0.4873368, 1.455865, 1, 0, 0.1215686, 1,
2.219285, 0.6906168, 1.465521, 1, 0, 0.1137255, 1,
2.25373, -1.013453, 2.144861, 1, 0, 0.1098039, 1,
2.261612, -1.553921, 1.100111, 1, 0, 0.1019608, 1,
2.26285, 0.9117451, -0.702845, 1, 0, 0.09411765, 1,
2.275503, 0.8189548, 0.8488693, 1, 0, 0.09019608, 1,
2.284452, 0.5288724, 0.7926811, 1, 0, 0.08235294, 1,
2.305655, 1.796247, 1.582527, 1, 0, 0.07843138, 1,
2.318877, 1.035347, -0.2653173, 1, 0, 0.07058824, 1,
2.387686, -0.4924943, 2.395486, 1, 0, 0.06666667, 1,
2.42282, -1.105074, 1.904744, 1, 0, 0.05882353, 1,
2.531062, 1.177451, 2.047932, 1, 0, 0.05490196, 1,
2.643042, 0.7071679, 1.15544, 1, 0, 0.04705882, 1,
2.687638, 1.828445, -0.4745814, 1, 0, 0.04313726, 1,
2.706563, -0.447599, 3.285331, 1, 0, 0.03529412, 1,
2.749182, 1.189347, 1.04907, 1, 0, 0.03137255, 1,
2.832568, 0.01613004, 2.205791, 1, 0, 0.02352941, 1,
2.91253, 0.2256417, -0.3459639, 1, 0, 0.01960784, 1,
2.943586, 0.6196213, 1.852375, 1, 0, 0.01176471, 1,
3.06036, 0.07666482, 1.368204, 1, 0, 0.007843138, 1
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
-0.4327698, -4.45031, -6.598181, 0, -0.5, 0.5, 0.5,
-0.4327698, -4.45031, -6.598181, 1, -0.5, 0.5, 0.5,
-0.4327698, -4.45031, -6.598181, 1, 1.5, 0.5, 0.5,
-0.4327698, -4.45031, -6.598181, 0, 1.5, 0.5, 0.5
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
-5.110071, -0.05394149, -6.598181, 0, -0.5, 0.5, 0.5,
-5.110071, -0.05394149, -6.598181, 1, -0.5, 0.5, 0.5,
-5.110071, -0.05394149, -6.598181, 1, 1.5, 0.5, 0.5,
-5.110071, -0.05394149, -6.598181, 0, 1.5, 0.5, 0.5
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
-5.110071, -4.45031, 0.1717408, 0, -0.5, 0.5, 0.5,
-5.110071, -4.45031, 0.1717408, 1, -0.5, 0.5, 0.5,
-5.110071, -4.45031, 0.1717408, 1, 1.5, 0.5, 0.5,
-5.110071, -4.45031, 0.1717408, 0, 1.5, 0.5, 0.5
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
-3, -3.435764, -5.035892,
3, -3.435764, -5.035892,
-3, -3.435764, -5.035892,
-3, -3.604855, -5.296273,
-2, -3.435764, -5.035892,
-2, -3.604855, -5.296273,
-1, -3.435764, -5.035892,
-1, -3.604855, -5.296273,
0, -3.435764, -5.035892,
0, -3.604855, -5.296273,
1, -3.435764, -5.035892,
1, -3.604855, -5.296273,
2, -3.435764, -5.035892,
2, -3.604855, -5.296273,
3, -3.435764, -5.035892,
3, -3.604855, -5.296273
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
-3, -3.943037, -5.817037, 0, -0.5, 0.5, 0.5,
-3, -3.943037, -5.817037, 1, -0.5, 0.5, 0.5,
-3, -3.943037, -5.817037, 1, 1.5, 0.5, 0.5,
-3, -3.943037, -5.817037, 0, 1.5, 0.5, 0.5,
-2, -3.943037, -5.817037, 0, -0.5, 0.5, 0.5,
-2, -3.943037, -5.817037, 1, -0.5, 0.5, 0.5,
-2, -3.943037, -5.817037, 1, 1.5, 0.5, 0.5,
-2, -3.943037, -5.817037, 0, 1.5, 0.5, 0.5,
-1, -3.943037, -5.817037, 0, -0.5, 0.5, 0.5,
-1, -3.943037, -5.817037, 1, -0.5, 0.5, 0.5,
-1, -3.943037, -5.817037, 1, 1.5, 0.5, 0.5,
-1, -3.943037, -5.817037, 0, 1.5, 0.5, 0.5,
0, -3.943037, -5.817037, 0, -0.5, 0.5, 0.5,
0, -3.943037, -5.817037, 1, -0.5, 0.5, 0.5,
0, -3.943037, -5.817037, 1, 1.5, 0.5, 0.5,
0, -3.943037, -5.817037, 0, 1.5, 0.5, 0.5,
1, -3.943037, -5.817037, 0, -0.5, 0.5, 0.5,
1, -3.943037, -5.817037, 1, -0.5, 0.5, 0.5,
1, -3.943037, -5.817037, 1, 1.5, 0.5, 0.5,
1, -3.943037, -5.817037, 0, 1.5, 0.5, 0.5,
2, -3.943037, -5.817037, 0, -0.5, 0.5, 0.5,
2, -3.943037, -5.817037, 1, -0.5, 0.5, 0.5,
2, -3.943037, -5.817037, 1, 1.5, 0.5, 0.5,
2, -3.943037, -5.817037, 0, 1.5, 0.5, 0.5,
3, -3.943037, -5.817037, 0, -0.5, 0.5, 0.5,
3, -3.943037, -5.817037, 1, -0.5, 0.5, 0.5,
3, -3.943037, -5.817037, 1, 1.5, 0.5, 0.5,
3, -3.943037, -5.817037, 0, 1.5, 0.5, 0.5
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
-4.030694, -3, -5.035892,
-4.030694, 3, -5.035892,
-4.030694, -3, -5.035892,
-4.210589, -3, -5.296273,
-4.030694, -2, -5.035892,
-4.210589, -2, -5.296273,
-4.030694, -1, -5.035892,
-4.210589, -1, -5.296273,
-4.030694, 0, -5.035892,
-4.210589, 0, -5.296273,
-4.030694, 1, -5.035892,
-4.210589, 1, -5.296273,
-4.030694, 2, -5.035892,
-4.210589, 2, -5.296273,
-4.030694, 3, -5.035892,
-4.210589, 3, -5.296273
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
-4.570382, -3, -5.817037, 0, -0.5, 0.5, 0.5,
-4.570382, -3, -5.817037, 1, -0.5, 0.5, 0.5,
-4.570382, -3, -5.817037, 1, 1.5, 0.5, 0.5,
-4.570382, -3, -5.817037, 0, 1.5, 0.5, 0.5,
-4.570382, -2, -5.817037, 0, -0.5, 0.5, 0.5,
-4.570382, -2, -5.817037, 1, -0.5, 0.5, 0.5,
-4.570382, -2, -5.817037, 1, 1.5, 0.5, 0.5,
-4.570382, -2, -5.817037, 0, 1.5, 0.5, 0.5,
-4.570382, -1, -5.817037, 0, -0.5, 0.5, 0.5,
-4.570382, -1, -5.817037, 1, -0.5, 0.5, 0.5,
-4.570382, -1, -5.817037, 1, 1.5, 0.5, 0.5,
-4.570382, -1, -5.817037, 0, 1.5, 0.5, 0.5,
-4.570382, 0, -5.817037, 0, -0.5, 0.5, 0.5,
-4.570382, 0, -5.817037, 1, -0.5, 0.5, 0.5,
-4.570382, 0, -5.817037, 1, 1.5, 0.5, 0.5,
-4.570382, 0, -5.817037, 0, 1.5, 0.5, 0.5,
-4.570382, 1, -5.817037, 0, -0.5, 0.5, 0.5,
-4.570382, 1, -5.817037, 1, -0.5, 0.5, 0.5,
-4.570382, 1, -5.817037, 1, 1.5, 0.5, 0.5,
-4.570382, 1, -5.817037, 0, 1.5, 0.5, 0.5,
-4.570382, 2, -5.817037, 0, -0.5, 0.5, 0.5,
-4.570382, 2, -5.817037, 1, -0.5, 0.5, 0.5,
-4.570382, 2, -5.817037, 1, 1.5, 0.5, 0.5,
-4.570382, 2, -5.817037, 0, 1.5, 0.5, 0.5,
-4.570382, 3, -5.817037, 0, -0.5, 0.5, 0.5,
-4.570382, 3, -5.817037, 1, -0.5, 0.5, 0.5,
-4.570382, 3, -5.817037, 1, 1.5, 0.5, 0.5,
-4.570382, 3, -5.817037, 0, 1.5, 0.5, 0.5
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
-4.030694, -3.435764, -4,
-4.030694, -3.435764, 4,
-4.030694, -3.435764, -4,
-4.210589, -3.604855, -4,
-4.030694, -3.435764, -2,
-4.210589, -3.604855, -2,
-4.030694, -3.435764, 0,
-4.210589, -3.604855, 0,
-4.030694, -3.435764, 2,
-4.210589, -3.604855, 2,
-4.030694, -3.435764, 4,
-4.210589, -3.604855, 4
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
-4.570382, -3.943037, -4, 0, -0.5, 0.5, 0.5,
-4.570382, -3.943037, -4, 1, -0.5, 0.5, 0.5,
-4.570382, -3.943037, -4, 1, 1.5, 0.5, 0.5,
-4.570382, -3.943037, -4, 0, 1.5, 0.5, 0.5,
-4.570382, -3.943037, -2, 0, -0.5, 0.5, 0.5,
-4.570382, -3.943037, -2, 1, -0.5, 0.5, 0.5,
-4.570382, -3.943037, -2, 1, 1.5, 0.5, 0.5,
-4.570382, -3.943037, -2, 0, 1.5, 0.5, 0.5,
-4.570382, -3.943037, 0, 0, -0.5, 0.5, 0.5,
-4.570382, -3.943037, 0, 1, -0.5, 0.5, 0.5,
-4.570382, -3.943037, 0, 1, 1.5, 0.5, 0.5,
-4.570382, -3.943037, 0, 0, 1.5, 0.5, 0.5,
-4.570382, -3.943037, 2, 0, -0.5, 0.5, 0.5,
-4.570382, -3.943037, 2, 1, -0.5, 0.5, 0.5,
-4.570382, -3.943037, 2, 1, 1.5, 0.5, 0.5,
-4.570382, -3.943037, 2, 0, 1.5, 0.5, 0.5,
-4.570382, -3.943037, 4, 0, -0.5, 0.5, 0.5,
-4.570382, -3.943037, 4, 1, -0.5, 0.5, 0.5,
-4.570382, -3.943037, 4, 1, 1.5, 0.5, 0.5,
-4.570382, -3.943037, 4, 0, 1.5, 0.5, 0.5
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
-4.030694, -3.435764, -5.035892,
-4.030694, 3.327881, -5.035892,
-4.030694, -3.435764, 5.379373,
-4.030694, 3.327881, 5.379373,
-4.030694, -3.435764, -5.035892,
-4.030694, -3.435764, 5.379373,
-4.030694, 3.327881, -5.035892,
-4.030694, 3.327881, 5.379373,
-4.030694, -3.435764, -5.035892,
3.165154, -3.435764, -5.035892,
-4.030694, -3.435764, 5.379373,
3.165154, -3.435764, 5.379373,
-4.030694, 3.327881, -5.035892,
3.165154, 3.327881, -5.035892,
-4.030694, 3.327881, 5.379373,
3.165154, 3.327881, 5.379373,
3.165154, -3.435764, -5.035892,
3.165154, 3.327881, -5.035892,
3.165154, -3.435764, 5.379373,
3.165154, 3.327881, 5.379373,
3.165154, -3.435764, -5.035892,
3.165154, -3.435764, 5.379373,
3.165154, 3.327881, -5.035892,
3.165154, 3.327881, 5.379373
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
var radius = 7.664154;
var distance = 34.09869;
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
mvMatrix.translate( 0.4327698, 0.05394149, -0.1717408 );
mvMatrix.scale( 1.151585, 1.225173, 0.7956238 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.09869);
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
urea<-read.table("urea.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-urea$V2
```

```
## Error in eval(expr, envir, enclos): object 'urea' not found
```

```r
y<-urea$V3
```

```
## Error in eval(expr, envir, enclos): object 'urea' not found
```

```r
z<-urea$V4
```

```
## Error in eval(expr, envir, enclos): object 'urea' not found
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
-3.9259, 1.000657, -1.846979, 0, 0, 1, 1, 1,
-2.938686, 0.6585264, -1.984417, 1, 0, 0, 1, 1,
-2.860619, -0.4819066, -0.9474314, 1, 0, 0, 1, 1,
-2.808006, -0.6122974, -3.092153, 1, 0, 0, 1, 1,
-2.672613, -1.727978, -3.457647, 1, 0, 0, 1, 1,
-2.670434, 0.5369651, -0.6156425, 1, 0, 0, 1, 1,
-2.65128, 2.544934, -1.074634, 0, 0, 0, 1, 1,
-2.632395, -0.30775, -2.460171, 0, 0, 0, 1, 1,
-2.541567, 1.537634, -0.6397331, 0, 0, 0, 1, 1,
-2.484697, 0.08537744, -3.51295, 0, 0, 0, 1, 1,
-2.483602, -1.822602, -1.974941, 0, 0, 0, 1, 1,
-2.466109, 0.1711551, -0.6027038, 0, 0, 0, 1, 1,
-2.430362, -0.05093778, -2.930275, 0, 0, 0, 1, 1,
-2.417716, 0.4693086, -3.116799, 1, 1, 1, 1, 1,
-2.415978, 1.626471, -0.6176634, 1, 1, 1, 1, 1,
-2.409835, -0.4192649, -2.709846, 1, 1, 1, 1, 1,
-2.32372, 0.5989162, -4.230232, 1, 1, 1, 1, 1,
-2.291332, -0.9982478, -0.9847153, 1, 1, 1, 1, 1,
-2.280864, -1.173014, -2.480711, 1, 1, 1, 1, 1,
-2.222952, 0.5209872, -1.633969, 1, 1, 1, 1, 1,
-2.114418, -0.2836831, -0.8438128, 1, 1, 1, 1, 1,
-2.113565, 1.029568, -2.373455, 1, 1, 1, 1, 1,
-2.081744, -1.186282, -4.628287, 1, 1, 1, 1, 1,
-2.054799, -0.04969742, -1.614469, 1, 1, 1, 1, 1,
-2.013109, -0.7436439, -0.6002065, 1, 1, 1, 1, 1,
-2.010598, 0.9573323, -1.411414, 1, 1, 1, 1, 1,
-2.006213, 0.6410999, -1.8945, 1, 1, 1, 1, 1,
-1.999286, 0.5013041, -2.230389, 1, 1, 1, 1, 1,
-1.990718, 0.8483732, -1.535848, 0, 0, 1, 1, 1,
-1.982302, -0.4900798, -1.109059, 1, 0, 0, 1, 1,
-1.957573, -0.4599202, -1.229562, 1, 0, 0, 1, 1,
-1.946292, -0.4934021, -1.360734, 1, 0, 0, 1, 1,
-1.918903, -1.256127, -1.838176, 1, 0, 0, 1, 1,
-1.904294, -0.3746308, -3.409734, 1, 0, 0, 1, 1,
-1.897338, 0.0148028, -1.405051, 0, 0, 0, 1, 1,
-1.890714, -0.01235674, -2.876395, 0, 0, 0, 1, 1,
-1.873784, -0.3543147, -1.322613, 0, 0, 0, 1, 1,
-1.866271, -0.3243841, -1.187813, 0, 0, 0, 1, 1,
-1.838982, 0.8870593, -0.7405558, 0, 0, 0, 1, 1,
-1.838978, 1.287529, -0.1094067, 0, 0, 0, 1, 1,
-1.832922, -0.4746878, -1.017269, 0, 0, 0, 1, 1,
-1.826212, 0.6813809, -0.9310389, 1, 1, 1, 1, 1,
-1.818749, 0.1204126, -2.413531, 1, 1, 1, 1, 1,
-1.804359, -0.5289353, -3.623538, 1, 1, 1, 1, 1,
-1.801943, 0.07457125, -2.18882, 1, 1, 1, 1, 1,
-1.73989, 0.2121507, -1.39353, 1, 1, 1, 1, 1,
-1.724914, -0.2191668, -2.100258, 1, 1, 1, 1, 1,
-1.710857, 1.585277, -0.6587921, 1, 1, 1, 1, 1,
-1.680835, 0.4247345, -0.9269485, 1, 1, 1, 1, 1,
-1.676654, 0.9425654, 0.8283166, 1, 1, 1, 1, 1,
-1.671877, 2.025457, 0.3221846, 1, 1, 1, 1, 1,
-1.667893, -0.2190332, -1.783208, 1, 1, 1, 1, 1,
-1.664376, -0.4451174, -2.321169, 1, 1, 1, 1, 1,
-1.655663, 0.01802455, -0.9650595, 1, 1, 1, 1, 1,
-1.654798, -0.437324, -2.403032, 1, 1, 1, 1, 1,
-1.649137, 0.1390256, -1.681094, 1, 1, 1, 1, 1,
-1.646551, 0.5014909, -0.1766692, 0, 0, 1, 1, 1,
-1.640395, 2.303531, -0.4326859, 1, 0, 0, 1, 1,
-1.625583, 0.9278968, -0.9254063, 1, 0, 0, 1, 1,
-1.61088, 0.1303383, -3.547945, 1, 0, 0, 1, 1,
-1.607048, -2.358691, -1.485411, 1, 0, 0, 1, 1,
-1.606395, -0.05144479, -2.230003, 1, 0, 0, 1, 1,
-1.602909, 0.8116981, -1.613273, 0, 0, 0, 1, 1,
-1.599874, -0.7717947, -1.480312, 0, 0, 0, 1, 1,
-1.593515, 0.6816384, -1.701728, 0, 0, 0, 1, 1,
-1.58814, -1.237425, -3.055106, 0, 0, 0, 1, 1,
-1.584229, -0.9905004, -4.062009, 0, 0, 0, 1, 1,
-1.572396, -0.7976471, -2.226594, 0, 0, 0, 1, 1,
-1.565854, 0.2197776, 0.4082401, 0, 0, 0, 1, 1,
-1.558148, -2.161678, -2.162627, 1, 1, 1, 1, 1,
-1.545046, 1.164827, -1.567909, 1, 1, 1, 1, 1,
-1.541782, -1.610185, -2.457963, 1, 1, 1, 1, 1,
-1.538529, 1.748015, -1.71836, 1, 1, 1, 1, 1,
-1.535393, -0.5949374, -3.448944, 1, 1, 1, 1, 1,
-1.528795, -0.02890507, -1.267233, 1, 1, 1, 1, 1,
-1.528331, -0.8613913, -1.152615, 1, 1, 1, 1, 1,
-1.520426, 0.3031673, -0.8640242, 1, 1, 1, 1, 1,
-1.515332, 1.029356, -1.373692, 1, 1, 1, 1, 1,
-1.513484, 1.095581, 0.3571117, 1, 1, 1, 1, 1,
-1.478484, -1.493252, -2.540205, 1, 1, 1, 1, 1,
-1.478408, 0.2134635, -1.807047, 1, 1, 1, 1, 1,
-1.473918, -0.4537332, -0.6708559, 1, 1, 1, 1, 1,
-1.47009, -1.449618, -3.755429, 1, 1, 1, 1, 1,
-1.456743, 0.447733, -2.264539, 1, 1, 1, 1, 1,
-1.450576, 0.8206689, -0.8550819, 0, 0, 1, 1, 1,
-1.436921, -0.7863699, -3.006466, 1, 0, 0, 1, 1,
-1.415366, -0.872909, -2.299984, 1, 0, 0, 1, 1,
-1.397969, -1.15935, -1.74473, 1, 0, 0, 1, 1,
-1.374958, 1.015301, 0.4549115, 1, 0, 0, 1, 1,
-1.373881, -0.5632562, -2.264672, 1, 0, 0, 1, 1,
-1.369207, 0.1737476, -0.4277687, 0, 0, 0, 1, 1,
-1.368236, 1.232401, -0.3460275, 0, 0, 0, 1, 1,
-1.366351, 0.9418622, -2.045516, 0, 0, 0, 1, 1,
-1.360919, 0.1098562, -1.290998, 0, 0, 0, 1, 1,
-1.35744, -0.07629508, -0.4121067, 0, 0, 0, 1, 1,
-1.35648, 0.01313435, -1.552856, 0, 0, 0, 1, 1,
-1.356415, 0.4371934, -0.03693558, 0, 0, 0, 1, 1,
-1.348855, 0.3521484, -0.3978899, 1, 1, 1, 1, 1,
-1.348614, 0.4754024, -0.6418509, 1, 1, 1, 1, 1,
-1.345506, 0.09555832, -2.210144, 1, 1, 1, 1, 1,
-1.340375, -0.7161509, -0.864763, 1, 1, 1, 1, 1,
-1.335948, -1.114754, -3.88486, 1, 1, 1, 1, 1,
-1.330626, -0.712912, -1.543043, 1, 1, 1, 1, 1,
-1.328983, 0.2007268, -1.841409, 1, 1, 1, 1, 1,
-1.318241, -0.2669335, -3.361858, 1, 1, 1, 1, 1,
-1.302755, -2.379189, -2.889578, 1, 1, 1, 1, 1,
-1.301984, 0.1728196, -2.579684, 1, 1, 1, 1, 1,
-1.300959, -0.3588524, -1.466187, 1, 1, 1, 1, 1,
-1.299336, -0.6486256, -3.004977, 1, 1, 1, 1, 1,
-1.294912, -0.7847641, -3.210371, 1, 1, 1, 1, 1,
-1.276116, -0.5189245, -1.130713, 1, 1, 1, 1, 1,
-1.267581, -0.7383655, -0.8417162, 1, 1, 1, 1, 1,
-1.264265, 1.532092, -0.1714455, 0, 0, 1, 1, 1,
-1.263774, -0.5871537, -1.918333, 1, 0, 0, 1, 1,
-1.26272, -0.2844723, -0.4888106, 1, 0, 0, 1, 1,
-1.262174, -0.5624078, -2.621316, 1, 0, 0, 1, 1,
-1.258939, -1.236344, -1.838334, 1, 0, 0, 1, 1,
-1.252334, 0.8590505, -1.369221, 1, 0, 0, 1, 1,
-1.250732, -0.9235626, -4.181206, 0, 0, 0, 1, 1,
-1.248743, -0.4621297, -1.300012, 0, 0, 0, 1, 1,
-1.247176, -0.3213632, -1.681387, 0, 0, 0, 1, 1,
-1.239054, 3.081199, -1.182931, 0, 0, 0, 1, 1,
-1.234932, 0.009362056, -1.931412, 0, 0, 0, 1, 1,
-1.23256, -0.8111997, -3.163746, 0, 0, 0, 1, 1,
-1.227659, 0.3738334, -2.102957, 0, 0, 0, 1, 1,
-1.22353, 0.03381484, -0.5791888, 1, 1, 1, 1, 1,
-1.218626, -0.8305629, -2.548085, 1, 1, 1, 1, 1,
-1.215759, 0.2569118, -0.4971245, 1, 1, 1, 1, 1,
-1.195095, -0.2289528, -1.075074, 1, 1, 1, 1, 1,
-1.182185, -0.1899987, -2.761708, 1, 1, 1, 1, 1,
-1.165488, -0.4262288, -0.3576889, 1, 1, 1, 1, 1,
-1.163054, 0.9971548, -0.5686991, 1, 1, 1, 1, 1,
-1.161814, -0.1306048, -1.2166, 1, 1, 1, 1, 1,
-1.156716, 0.8562968, -0.5276294, 1, 1, 1, 1, 1,
-1.146942, 1.910686, -1.556822, 1, 1, 1, 1, 1,
-1.145336, 1.104439, -0.6658829, 1, 1, 1, 1, 1,
-1.129826, -0.136617, -2.377213, 1, 1, 1, 1, 1,
-1.127163, -0.7257947, -1.322814, 1, 1, 1, 1, 1,
-1.125311, 0.07274619, -3.785517, 1, 1, 1, 1, 1,
-1.112891, 0.5928572, -1.650972, 1, 1, 1, 1, 1,
-1.112462, -0.6118752, -0.9608358, 0, 0, 1, 1, 1,
-1.11242, 0.01371669, -0.5064839, 1, 0, 0, 1, 1,
-1.109252, -0.4654143, -0.9528345, 1, 0, 0, 1, 1,
-1.095541, 1.735151, -1.800005, 1, 0, 0, 1, 1,
-1.091381, -1.174984, -2.274915, 1, 0, 0, 1, 1,
-1.081823, 0.9244776, -1.26003, 1, 0, 0, 1, 1,
-1.077543, 1.756195, 0.9380918, 0, 0, 0, 1, 1,
-1.076334, 0.9025916, 0.5750784, 0, 0, 0, 1, 1,
-1.072323, -0.2749999, 0.02004233, 0, 0, 0, 1, 1,
-1.067455, -0.9273673, -1.769358, 0, 0, 0, 1, 1,
-1.067163, 1.518306, -0.7409122, 0, 0, 0, 1, 1,
-1.065615, -0.06932645, -2.52693, 0, 0, 0, 1, 1,
-1.059653, -0.1547596, -3.409288, 0, 0, 0, 1, 1,
-1.056393, 1.152456, -0.2536193, 1, 1, 1, 1, 1,
-1.050732, 0.4093941, -3.414943, 1, 1, 1, 1, 1,
-1.044905, 1.215699, 0.5529221, 1, 1, 1, 1, 1,
-1.030574, 1.290483, 0.6254146, 1, 1, 1, 1, 1,
-1.026639, -1.065514, -2.67183, 1, 1, 1, 1, 1,
-1.023418, -0.1565374, -2.671006, 1, 1, 1, 1, 1,
-1.019303, -1.772528, -1.983767, 1, 1, 1, 1, 1,
-1.004869, -0.4351656, -1.703152, 1, 1, 1, 1, 1,
-0.9995903, 1.245244, -1.050564, 1, 1, 1, 1, 1,
-0.9932951, 1.23392, -1.18718, 1, 1, 1, 1, 1,
-0.9915232, -2.358979, -2.097085, 1, 1, 1, 1, 1,
-0.9861336, -0.1751488, -0.8316341, 1, 1, 1, 1, 1,
-0.9811319, -1.394183, -2.900639, 1, 1, 1, 1, 1,
-0.9810261, -0.2900093, 0.08799677, 1, 1, 1, 1, 1,
-0.9767689, 0.4097613, -1.236864, 1, 1, 1, 1, 1,
-0.9707211, 0.5416311, -2.062563, 0, 0, 1, 1, 1,
-0.9706578, -1.467475, -0.5558991, 1, 0, 0, 1, 1,
-0.9703712, 1.889251, -0.8141719, 1, 0, 0, 1, 1,
-0.968711, -0.3968961, -3.468934, 1, 0, 0, 1, 1,
-0.966502, 0.4109888, -2.534305, 1, 0, 0, 1, 1,
-0.9653453, 0.4297969, -0.5327823, 1, 0, 0, 1, 1,
-0.9629362, -1.516523, -3.502914, 0, 0, 0, 1, 1,
-0.956336, -1.1395, -1.680412, 0, 0, 0, 1, 1,
-0.9280905, 0.7753343, 0.1787978, 0, 0, 0, 1, 1,
-0.923725, 0.4446891, -1.894819, 0, 0, 0, 1, 1,
-0.9231546, -2.870811, -2.318404, 0, 0, 0, 1, 1,
-0.9180127, 0.09865355, -0.8101037, 0, 0, 0, 1, 1,
-0.9126617, 0.5696631, -0.7563804, 0, 0, 0, 1, 1,
-0.9029022, 1.414613, -0.2104293, 1, 1, 1, 1, 1,
-0.9021711, -0.3469765, -2.103482, 1, 1, 1, 1, 1,
-0.9006365, 0.4988168, 0.5686452, 1, 1, 1, 1, 1,
-0.8929263, -0.4232312, -2.412394, 1, 1, 1, 1, 1,
-0.8856432, -0.0458387, -2.816861, 1, 1, 1, 1, 1,
-0.8614031, 0.1559398, -3.474596, 1, 1, 1, 1, 1,
-0.8593951, -0.2874002, -0.2592108, 1, 1, 1, 1, 1,
-0.8563154, 0.4808823, -1.338743, 1, 1, 1, 1, 1,
-0.8521753, 0.1081475, -1.419567, 1, 1, 1, 1, 1,
-0.8512435, -0.5428479, -1.206604, 1, 1, 1, 1, 1,
-0.8458137, -0.4578237, -1.040378, 1, 1, 1, 1, 1,
-0.84275, 0.860278, -0.3942845, 1, 1, 1, 1, 1,
-0.8420477, -0.5747939, -2.072999, 1, 1, 1, 1, 1,
-0.8388394, -0.6656938, -3.018174, 1, 1, 1, 1, 1,
-0.8351435, -0.6000361, -0.722378, 1, 1, 1, 1, 1,
-0.8326304, 0.301191, -2.071599, 0, 0, 1, 1, 1,
-0.8323153, -1.193211, -1.732673, 1, 0, 0, 1, 1,
-0.8271807, 0.2238573, -0.8975798, 1, 0, 0, 1, 1,
-0.8217663, 1.821803, -1.084335, 1, 0, 0, 1, 1,
-0.8188614, -1.225035, -3.323225, 1, 0, 0, 1, 1,
-0.8188263, -2.549031, -0.9837115, 1, 0, 0, 1, 1,
-0.8170086, 0.4252058, -1.863646, 0, 0, 0, 1, 1,
-0.816833, 1.270929, 0.5608932, 0, 0, 0, 1, 1,
-0.8100755, -0.2819225, -3.070495, 0, 0, 0, 1, 1,
-0.8079419, -2.391469, -3.601285, 0, 0, 0, 1, 1,
-0.8070664, 0.9239451, -0.6040254, 0, 0, 0, 1, 1,
-0.8017823, -0.7935902, -2.777967, 0, 0, 0, 1, 1,
-0.8003759, 0.4599286, -1.766313, 0, 0, 0, 1, 1,
-0.7959186, 1.115283, -2.859264, 1, 1, 1, 1, 1,
-0.7950091, -2.115811, -1.039124, 1, 1, 1, 1, 1,
-0.7890528, 1.702984, -1.510304, 1, 1, 1, 1, 1,
-0.7853568, 0.1456719, -0.532871, 1, 1, 1, 1, 1,
-0.7846397, -2.163845, -2.156958, 1, 1, 1, 1, 1,
-0.7827323, 0.3184965, -0.1307319, 1, 1, 1, 1, 1,
-0.7786931, 0.311622, -1.087189, 1, 1, 1, 1, 1,
-0.777043, -0.2635455, -1.711172, 1, 1, 1, 1, 1,
-0.7768552, 1.127875, -0.837816, 1, 1, 1, 1, 1,
-0.7766224, -0.5560427, -3.236712, 1, 1, 1, 1, 1,
-0.7756668, 0.5046266, -0.3890118, 1, 1, 1, 1, 1,
-0.7714524, 1.744417, 0.4798416, 1, 1, 1, 1, 1,
-0.7580543, -0.1462914, -2.340175, 1, 1, 1, 1, 1,
-0.7569431, 0.7766983, -0.4787773, 1, 1, 1, 1, 1,
-0.7568405, -0.2557873, -1.79346, 1, 1, 1, 1, 1,
-0.7544023, -0.8014207, -1.105971, 0, 0, 1, 1, 1,
-0.7522507, -1.386819, -2.618561, 1, 0, 0, 1, 1,
-0.7507424, -0.9655603, -3.602235, 1, 0, 0, 1, 1,
-0.7448699, 0.1419294, 0.4537529, 1, 0, 0, 1, 1,
-0.7438158, 0.2465955, -0.5972587, 1, 0, 0, 1, 1,
-0.7410736, -0.3810633, -2.468889, 1, 0, 0, 1, 1,
-0.7382331, 0.5784748, -2.619708, 0, 0, 0, 1, 1,
-0.7319703, 0.1141283, 0.2804185, 0, 0, 0, 1, 1,
-0.7282375, -0.6886112, -2.003698, 0, 0, 0, 1, 1,
-0.7276701, 0.08584067, -0.8681107, 0, 0, 0, 1, 1,
-0.7235367, 0.1853207, -0.2762446, 0, 0, 0, 1, 1,
-0.7224338, -0.1280614, -3.701736, 0, 0, 0, 1, 1,
-0.7213473, -1.336444, -1.661373, 0, 0, 0, 1, 1,
-0.7172818, -0.07950845, -0.5442606, 1, 1, 1, 1, 1,
-0.7158768, 0.9562749, -0.7463, 1, 1, 1, 1, 1,
-0.7150156, 0.365984, -0.9866614, 1, 1, 1, 1, 1,
-0.711143, 0.195969, -0.1228111, 1, 1, 1, 1, 1,
-0.7007388, 0.005635911, -2.102422, 1, 1, 1, 1, 1,
-0.695185, 0.1883312, -1.77786, 1, 1, 1, 1, 1,
-0.6939227, -0.3844309, -2.723392, 1, 1, 1, 1, 1,
-0.6880208, 1.141586, -1.268394, 1, 1, 1, 1, 1,
-0.6874095, 0.6103972, -0.4043371, 1, 1, 1, 1, 1,
-0.6829634, -0.4459498, -3.505389, 1, 1, 1, 1, 1,
-0.6808294, 0.9027523, -0.6350679, 1, 1, 1, 1, 1,
-0.6733929, 0.0517568, -2.263049, 1, 1, 1, 1, 1,
-0.6732674, 1.39389, -2.217084, 1, 1, 1, 1, 1,
-0.6634749, 0.3501192, 0.6779825, 1, 1, 1, 1, 1,
-0.6585453, 2.802028, -1.068291, 1, 1, 1, 1, 1,
-0.6527824, 0.8803061, 0.1033088, 0, 0, 1, 1, 1,
-0.6512472, -0.08577578, -1.343474, 1, 0, 0, 1, 1,
-0.6476833, -0.09835854, -4.105346, 1, 0, 0, 1, 1,
-0.6404862, 1.121692, -0.7774702, 1, 0, 0, 1, 1,
-0.638047, -1.486245, -3.664141, 1, 0, 0, 1, 1,
-0.6316882, -1.813925, -1.148585, 1, 0, 0, 1, 1,
-0.6310706, -0.9363063, -2.264754, 0, 0, 0, 1, 1,
-0.6277199, -0.06881668, -3.223289, 0, 0, 0, 1, 1,
-0.6245671, -0.09700047, -1.398791, 0, 0, 0, 1, 1,
-0.6237484, -0.6788399, -3.705459, 0, 0, 0, 1, 1,
-0.6186977, 0.2667966, -1.523754, 0, 0, 0, 1, 1,
-0.6186356, 0.2847551, -2.098556, 0, 0, 0, 1, 1,
-0.6182728, 0.1821504, -0.6171157, 0, 0, 0, 1, 1,
-0.6167455, -1.416182, -3.545957, 1, 1, 1, 1, 1,
-0.6127412, -1.326719, -1.998266, 1, 1, 1, 1, 1,
-0.6127089, 0.7403264, -0.7686382, 1, 1, 1, 1, 1,
-0.6116818, -1.92773, -2.469347, 1, 1, 1, 1, 1,
-0.6104713, -2.02628, -4.884213, 1, 1, 1, 1, 1,
-0.6067076, -0.4346718, -0.2904778, 1, 1, 1, 1, 1,
-0.6058763, -0.1284875, -2.516331, 1, 1, 1, 1, 1,
-0.6045687, -0.1922909, -1.998998, 1, 1, 1, 1, 1,
-0.6014651, 1.212929, 0.8796642, 1, 1, 1, 1, 1,
-0.5957643, 0.4757811, -1.328377, 1, 1, 1, 1, 1,
-0.5950056, -0.8136625, -1.252721, 1, 1, 1, 1, 1,
-0.5945342, 0.1761748, -1.143298, 1, 1, 1, 1, 1,
-0.5892475, 0.770848, -0.1747255, 1, 1, 1, 1, 1,
-0.5827928, -0.4266527, 0.1456344, 1, 1, 1, 1, 1,
-0.5778674, 0.02100085, -1.595844, 1, 1, 1, 1, 1,
-0.5778589, 0.2155325, -2.42285, 0, 0, 1, 1, 1,
-0.5758812, -0.8096316, -2.926005, 1, 0, 0, 1, 1,
-0.5756835, -1.191244, -2.215763, 1, 0, 0, 1, 1,
-0.5744447, -0.3409449, -3.807676, 1, 0, 0, 1, 1,
-0.5717145, 0.01808369, -2.11884, 1, 0, 0, 1, 1,
-0.5713795, -0.658349, -2.815967, 1, 0, 0, 1, 1,
-0.5673566, -1.067618, -4.064445, 0, 0, 0, 1, 1,
-0.566447, -0.232841, -3.098061, 0, 0, 0, 1, 1,
-0.5655702, 0.8754644, -0.1701464, 0, 0, 0, 1, 1,
-0.5633118, -0.1680965, -3.939381, 0, 0, 0, 1, 1,
-0.5602381, 0.07872519, -0.4042396, 0, 0, 0, 1, 1,
-0.5544223, -0.6368619, -1.229216, 0, 0, 0, 1, 1,
-0.5531415, -0.3251663, -1.609274, 0, 0, 0, 1, 1,
-0.5485445, -1.000957, -1.533729, 1, 1, 1, 1, 1,
-0.5389431, 2.259353, -0.005196234, 1, 1, 1, 1, 1,
-0.5387572, -0.539209, -3.064964, 1, 1, 1, 1, 1,
-0.5363278, -0.02300181, -1.833794, 1, 1, 1, 1, 1,
-0.5355282, 0.8710393, -2.972946, 1, 1, 1, 1, 1,
-0.5313148, 0.9758993, -0.6545933, 1, 1, 1, 1, 1,
-0.5311202, -0.05086084, -3.200595, 1, 1, 1, 1, 1,
-0.5267306, 0.7679821, -0.9091909, 1, 1, 1, 1, 1,
-0.5256706, 1.028097, -0.1392381, 1, 1, 1, 1, 1,
-0.5211626, 1.626611, 0.3949668, 1, 1, 1, 1, 1,
-0.5150107, 0.9039632, -0.9587341, 1, 1, 1, 1, 1,
-0.5139782, -0.2146098, -2.377692, 1, 1, 1, 1, 1,
-0.5121304, -0.2073842, -1.4495, 1, 1, 1, 1, 1,
-0.511417, 0.3276896, -1.185945, 1, 1, 1, 1, 1,
-0.5062028, 1.019125, -1.417553, 1, 1, 1, 1, 1,
-0.4964842, -1.192058, -4.691826, 0, 0, 1, 1, 1,
-0.4783652, 1.25037, 0.2667421, 1, 0, 0, 1, 1,
-0.4713862, -0.5993675, -3.797092, 1, 0, 0, 1, 1,
-0.4694943, 0.7046511, -1.382236, 1, 0, 0, 1, 1,
-0.4611331, -1.034552, -3.102921, 1, 0, 0, 1, 1,
-0.457913, -0.1687256, -1.169464, 1, 0, 0, 1, 1,
-0.454661, -0.424071, -1.841708, 0, 0, 0, 1, 1,
-0.4516609, -0.2347608, -0.7272556, 0, 0, 0, 1, 1,
-0.4484197, -1.255094, -3.090171, 0, 0, 0, 1, 1,
-0.4333813, -0.3553302, -0.8671265, 0, 0, 0, 1, 1,
-0.4324222, 0.8087714, -2.187066, 0, 0, 0, 1, 1,
-0.4283261, 0.3888036, -1.014606, 0, 0, 0, 1, 1,
-0.4273056, -1.064788, -2.004412, 0, 0, 0, 1, 1,
-0.419934, -0.2041146, -1.083326, 1, 1, 1, 1, 1,
-0.4174685, -0.9051697, -0.7565346, 1, 1, 1, 1, 1,
-0.4166576, -0.5138745, -0.8749031, 1, 1, 1, 1, 1,
-0.4158328, 1.332595, -0.422577, 1, 1, 1, 1, 1,
-0.4130034, 0.3193168, 0.7763466, 1, 1, 1, 1, 1,
-0.4124896, -0.0171922, 0.3559819, 1, 1, 1, 1, 1,
-0.4117006, 0.8399909, -0.7614162, 1, 1, 1, 1, 1,
-0.4084586, 2.332348, -0.2858355, 1, 1, 1, 1, 1,
-0.4074842, -0.1857258, -1.13908, 1, 1, 1, 1, 1,
-0.4052598, -0.4218039, -3.3027, 1, 1, 1, 1, 1,
-0.4034525, -0.1004999, -1.47984, 1, 1, 1, 1, 1,
-0.3969301, -0.3706613, -2.048717, 1, 1, 1, 1, 1,
-0.3907901, -1.335245, -3.076308, 1, 1, 1, 1, 1,
-0.3906839, -0.1346231, -1.987699, 1, 1, 1, 1, 1,
-0.3885985, 0.7998351, -1.56058, 1, 1, 1, 1, 1,
-0.3878036, -0.8516612, -1.851225, 0, 0, 1, 1, 1,
-0.3873517, 0.3310364, -0.5592843, 1, 0, 0, 1, 1,
-0.3833088, 0.7329051, 0.8368505, 1, 0, 0, 1, 1,
-0.3793729, -0.19865, -2.983003, 1, 0, 0, 1, 1,
-0.3778921, -1.45861, -3.44021, 1, 0, 0, 1, 1,
-0.376779, -0.4010213, -1.85483, 1, 0, 0, 1, 1,
-0.3726148, -0.4071536, -3.846603, 0, 0, 0, 1, 1,
-0.3715661, 1.153438, -0.2728574, 0, 0, 0, 1, 1,
-0.3708451, 1.137394, -0.4750172, 0, 0, 0, 1, 1,
-0.3703527, 0.304189, -0.1950909, 0, 0, 0, 1, 1,
-0.3652948, 0.6036556, -0.6274428, 0, 0, 0, 1, 1,
-0.3642623, 0.9984299, -0.3909255, 0, 0, 0, 1, 1,
-0.3540623, 0.2555874, -1.418459, 0, 0, 0, 1, 1,
-0.3496614, 0.0448008, -0.4347042, 1, 1, 1, 1, 1,
-0.3451254, -0.7093662, -2.694592, 1, 1, 1, 1, 1,
-0.344613, -1.605258, -2.852793, 1, 1, 1, 1, 1,
-0.3441029, 0.2064106, -0.9078124, 1, 1, 1, 1, 1,
-0.3434476, 0.4388895, -0.7482749, 1, 1, 1, 1, 1,
-0.3422156, 0.5843858, -0.7064745, 1, 1, 1, 1, 1,
-0.3408744, 0.269309, -0.96751, 1, 1, 1, 1, 1,
-0.3395742, 1.201013, -0.06042035, 1, 1, 1, 1, 1,
-0.3374198, 1.065532, 1.379348, 1, 1, 1, 1, 1,
-0.3365929, -0.05051666, -2.285074, 1, 1, 1, 1, 1,
-0.3289661, -2.287344, -2.231284, 1, 1, 1, 1, 1,
-0.3262967, -0.1119718, -0.1359791, 1, 1, 1, 1, 1,
-0.3251098, 0.7528243, -1.008772, 1, 1, 1, 1, 1,
-0.323381, 0.7258244, 0.5211062, 1, 1, 1, 1, 1,
-0.3197807, 0.2016557, -2.082766, 1, 1, 1, 1, 1,
-0.3161682, -1.302236, -4.224821, 0, 0, 1, 1, 1,
-0.3122848, -1.580949, -2.597602, 1, 0, 0, 1, 1,
-0.306751, 0.6833799, -1.526138, 1, 0, 0, 1, 1,
-0.3012464, 1.394739, 0.1524251, 1, 0, 0, 1, 1,
-0.3008434, -0.3572953, -1.43747, 1, 0, 0, 1, 1,
-0.2992374, -1.453607, -0.8001041, 1, 0, 0, 1, 1,
-0.298755, 1.132364, 0.6953496, 0, 0, 0, 1, 1,
-0.2954081, -1.762465, -2.919567, 0, 0, 0, 1, 1,
-0.2942531, -0.3943358, -1.901044, 0, 0, 0, 1, 1,
-0.2924621, 0.2823378, -0.9389002, 0, 0, 0, 1, 1,
-0.2910643, -0.09321196, -2.38411, 0, 0, 0, 1, 1,
-0.2812676, 3.131649, -1.005058, 0, 0, 0, 1, 1,
-0.2733722, 1.937287, -0.1268221, 0, 0, 0, 1, 1,
-0.272727, -0.8210204, -3.641201, 1, 1, 1, 1, 1,
-0.2699138, -0.8895236, -2.191839, 1, 1, 1, 1, 1,
-0.2681492, -0.1743192, -0.9361008, 1, 1, 1, 1, 1,
-0.2674178, 1.010197, -1.316113, 1, 1, 1, 1, 1,
-0.2595564, 1.297441, 0.1136662, 1, 1, 1, 1, 1,
-0.2539733, 0.7509489, -0.6072487, 1, 1, 1, 1, 1,
-0.2497277, 3.229381, 1.166775, 1, 1, 1, 1, 1,
-0.2469717, -1.162657, -3.809986, 1, 1, 1, 1, 1,
-0.2461842, 0.9430504, -0.6741833, 1, 1, 1, 1, 1,
-0.2447409, -0.02367743, -1.714324, 1, 1, 1, 1, 1,
-0.2430143, -0.6612806, -0.6018265, 1, 1, 1, 1, 1,
-0.2423182, 0.5155366, -0.03301353, 1, 1, 1, 1, 1,
-0.2374927, -0.6741354, -2.392509, 1, 1, 1, 1, 1,
-0.2339676, -0.3139048, -0.8264439, 1, 1, 1, 1, 1,
-0.2312389, 0.01746333, -2.243213, 1, 1, 1, 1, 1,
-0.227343, -1.398761, -2.50325, 0, 0, 1, 1, 1,
-0.2255425, -0.01771064, -0.2983145, 1, 0, 0, 1, 1,
-0.2243143, -1.178665, -4.045871, 1, 0, 0, 1, 1,
-0.2235689, -1.51019, -4.71738, 1, 0, 0, 1, 1,
-0.2219202, 1.093391, 0.5494263, 1, 0, 0, 1, 1,
-0.2218089, 0.8454286, 0.2472441, 1, 0, 0, 1, 1,
-0.2203545, -0.4219893, -1.781292, 0, 0, 0, 1, 1,
-0.2164563, -0.01170137, -2.312338, 0, 0, 0, 1, 1,
-0.2162776, -0.257832, -2.864689, 0, 0, 0, 1, 1,
-0.2145935, 0.7476516, -0.9276125, 0, 0, 0, 1, 1,
-0.2131212, 0.3150125, 0.6911966, 0, 0, 0, 1, 1,
-0.2125663, -1.037061, -4.837681, 0, 0, 0, 1, 1,
-0.2030936, -0.04976787, -3.270692, 0, 0, 0, 1, 1,
-0.2018818, -0.2326132, -3.213315, 1, 1, 1, 1, 1,
-0.2005972, 0.1303051, -0.3028366, 1, 1, 1, 1, 1,
-0.1870096, -1.659546, -1.251398, 1, 1, 1, 1, 1,
-0.1864337, 1.319165, 0.8440158, 1, 1, 1, 1, 1,
-0.183189, 1.532301, -0.8806182, 1, 1, 1, 1, 1,
-0.1822703, 0.7062676, 0.3972811, 1, 1, 1, 1, 1,
-0.1764354, 0.4235606, -1.305507, 1, 1, 1, 1, 1,
-0.1760016, 1.544953, -0.6906446, 1, 1, 1, 1, 1,
-0.1759792, -0.01694313, -1.728631, 1, 1, 1, 1, 1,
-0.1734748, -1.033422, -2.160604, 1, 1, 1, 1, 1,
-0.1698152, 1.285076, -0.3326644, 1, 1, 1, 1, 1,
-0.1667705, 0.1005792, -0.4803112, 1, 1, 1, 1, 1,
-0.1651234, 1.154344, -0.932354, 1, 1, 1, 1, 1,
-0.1607005, -0.4295264, -2.341286, 1, 1, 1, 1, 1,
-0.1598416, -0.01754972, -0.2814705, 1, 1, 1, 1, 1,
-0.158871, -1.307962, -2.865095, 0, 0, 1, 1, 1,
-0.1583792, -0.2806416, -3.040936, 1, 0, 0, 1, 1,
-0.153901, -1.230291, -3.097239, 1, 0, 0, 1, 1,
-0.1523871, -0.7629737, -3.05003, 1, 0, 0, 1, 1,
-0.1510451, -0.6685999, -0.9639334, 1, 0, 0, 1, 1,
-0.1495086, -0.4252971, -1.837713, 1, 0, 0, 1, 1,
-0.1492009, -1.354333, -1.71595, 0, 0, 0, 1, 1,
-0.1474356, -1.07182, -3.161906, 0, 0, 0, 1, 1,
-0.1442506, -1.731016, -4.161361, 0, 0, 0, 1, 1,
-0.143608, 0.7882166, -1.649043, 0, 0, 0, 1, 1,
-0.142932, 0.8099136, -0.5367323, 0, 0, 0, 1, 1,
-0.14125, 0.63564, -1.918252, 0, 0, 0, 1, 1,
-0.1387616, -0.2255997, -1.969982, 0, 0, 0, 1, 1,
-0.1350246, 0.8276502, 1.887818, 1, 1, 1, 1, 1,
-0.1318292, 0.1655994, -0.1031091, 1, 1, 1, 1, 1,
-0.1312203, -1.848309, -2.213422, 1, 1, 1, 1, 1,
-0.129622, -0.3464693, -2.777244, 1, 1, 1, 1, 1,
-0.1249999, -0.05117935, -2.22907, 1, 1, 1, 1, 1,
-0.1249135, -0.6001198, -3.566118, 1, 1, 1, 1, 1,
-0.1234636, -1.49656, -2.769109, 1, 1, 1, 1, 1,
-0.1211481, 0.2834771, -1.205187, 1, 1, 1, 1, 1,
-0.1198083, -1.345154, -2.07315, 1, 1, 1, 1, 1,
-0.1171635, 0.07082234, -0.922227, 1, 1, 1, 1, 1,
-0.1151917, 0.03405899, -2.816422, 1, 1, 1, 1, 1,
-0.1106393, 1.71114, -0.1560419, 1, 1, 1, 1, 1,
-0.1095824, -0.5151073, -2.174377, 1, 1, 1, 1, 1,
-0.1069146, -0.8659118, -3.039113, 1, 1, 1, 1, 1,
-0.1052874, -1.702158, -4.203763, 1, 1, 1, 1, 1,
-0.1035957, 1.645215, 0.0003635879, 0, 0, 1, 1, 1,
-0.1013399, 1.26301, -0.8640848, 1, 0, 0, 1, 1,
-0.1006655, 1.919675, 0.7984385, 1, 0, 0, 1, 1,
-0.100519, -1.323574, -4.759975, 1, 0, 0, 1, 1,
-0.09794027, -1.423796, -1.460273, 1, 0, 0, 1, 1,
-0.0969847, 0.3763053, -0.8507022, 1, 0, 0, 1, 1,
-0.09694834, -0.3485644, -3.355967, 0, 0, 0, 1, 1,
-0.09285492, 0.5759693, -0.2366283, 0, 0, 0, 1, 1,
-0.09254993, 0.4556428, -0.2201682, 0, 0, 0, 1, 1,
-0.08962337, -1.052131, -2.429609, 0, 0, 0, 1, 1,
-0.08687209, 1.069412, -0.5116355, 0, 0, 0, 1, 1,
-0.08650093, -1.150588, -2.585994, 0, 0, 0, 1, 1,
-0.08566269, -0.3939698, -2.165593, 0, 0, 0, 1, 1,
-0.08107368, -0.3984292, -2.288883, 1, 1, 1, 1, 1,
-0.07155462, 1.077367, 1.386603, 1, 1, 1, 1, 1,
-0.06950407, 0.5333802, -0.7614352, 1, 1, 1, 1, 1,
-0.06851801, -1.827783, -3.477069, 1, 1, 1, 1, 1,
-0.06571779, 0.8683968, -0.5008965, 1, 1, 1, 1, 1,
-0.0648733, 1.083651, -1.212587, 1, 1, 1, 1, 1,
-0.06428988, 0.01759013, -0.8580039, 1, 1, 1, 1, 1,
-0.06316983, -0.6924596, -2.671184, 1, 1, 1, 1, 1,
-0.06161229, -1.09164, -3.262973, 1, 1, 1, 1, 1,
-0.06004847, 0.3481984, -0.5125047, 1, 1, 1, 1, 1,
-0.05966647, -0.3546098, -1.787657, 1, 1, 1, 1, 1,
-0.0577696, -0.9310716, -4.529022, 1, 1, 1, 1, 1,
-0.05523666, 0.1287029, -0.984309, 1, 1, 1, 1, 1,
-0.05245079, -0.243306, -2.803599, 1, 1, 1, 1, 1,
-0.04860266, 0.6106619, -1.464963, 1, 1, 1, 1, 1,
-0.04356354, -0.2535687, -1.762993, 0, 0, 1, 1, 1,
-0.04300175, -1.230388, -2.211982, 1, 0, 0, 1, 1,
-0.03457609, -1.601758, -3.782753, 1, 0, 0, 1, 1,
-0.03451455, 0.547721, 0.9775529, 1, 0, 0, 1, 1,
-0.02476192, -0.3929779, -1.895367, 1, 0, 0, 1, 1,
-0.02454234, 0.1853112, 0.5032235, 1, 0, 0, 1, 1,
-0.02396787, -1.266451, -2.583978, 0, 0, 0, 1, 1,
-0.02212035, -0.239671, -4.203325, 0, 0, 0, 1, 1,
-0.02117203, 0.4233897, 0.6236195, 0, 0, 0, 1, 1,
-0.02070588, -1.066102, -4.344365, 0, 0, 0, 1, 1,
-0.01368475, -1.153342, -3.643557, 0, 0, 0, 1, 1,
-0.01267822, -1.280661, -3.785972, 0, 0, 0, 1, 1,
-0.007808216, 0.5623412, 0.4662862, 0, 0, 0, 1, 1,
0.0007932425, 0.03178166, 0.7349761, 1, 1, 1, 1, 1,
0.001810846, 0.1366937, -1.090877, 1, 1, 1, 1, 1,
0.002947463, 0.4792628, -0.6618306, 1, 1, 1, 1, 1,
0.007052806, -0.8025486, 3.190649, 1, 1, 1, 1, 1,
0.007186981, -0.6656789, 2.747753, 1, 1, 1, 1, 1,
0.009772005, -0.2034629, 3.481802, 1, 1, 1, 1, 1,
0.0117239, 0.9559367, 1.164445, 1, 1, 1, 1, 1,
0.01333849, 0.85259, -0.7413641, 1, 1, 1, 1, 1,
0.01754677, 1.090358, 0.188553, 1, 1, 1, 1, 1,
0.02364069, -1.252901, 3.671768, 1, 1, 1, 1, 1,
0.02376183, 0.1278596, -0.5649635, 1, 1, 1, 1, 1,
0.02478796, 0.862987, 1.059372, 1, 1, 1, 1, 1,
0.025034, -1.762114, 1.008355, 1, 1, 1, 1, 1,
0.02564577, 0.0421233, 2.032407, 1, 1, 1, 1, 1,
0.02651488, 1.236098, 0.619198, 1, 1, 1, 1, 1,
0.0277925, 1.063312, -0.08087508, 0, 0, 1, 1, 1,
0.02915412, 0.8489634, 0.1977274, 1, 0, 0, 1, 1,
0.03498309, -1.888072, 2.397178, 1, 0, 0, 1, 1,
0.03568489, -1.825143, 2.306183, 1, 0, 0, 1, 1,
0.03639687, -1.438204, 4.382983, 1, 0, 0, 1, 1,
0.03948554, -0.3152629, 3.092692, 1, 0, 0, 1, 1,
0.04069803, 0.3938498, 1.426121, 0, 0, 0, 1, 1,
0.04105461, -1.247039, 3.077271, 0, 0, 0, 1, 1,
0.04133892, -0.07783303, 4.166299, 0, 0, 0, 1, 1,
0.04273501, 1.415846, -0.7237585, 0, 0, 0, 1, 1,
0.04398141, 0.4207506, 0.1661409, 0, 0, 0, 1, 1,
0.04414431, -1.413819, 4.763513, 0, 0, 0, 1, 1,
0.04439728, 0.2914009, -0.383317, 0, 0, 0, 1, 1,
0.04622554, 1.372235, -0.7511386, 1, 1, 1, 1, 1,
0.04626269, -2.389508, 2.324286, 1, 1, 1, 1, 1,
0.04784189, 0.2480053, 0.4357229, 1, 1, 1, 1, 1,
0.04992188, 1.17548, -1.569822, 1, 1, 1, 1, 1,
0.05308957, -0.641193, 4.03775, 1, 1, 1, 1, 1,
0.05781503, -1.208259, 2.622413, 1, 1, 1, 1, 1,
0.05823981, -1.616473, 3.031132, 1, 1, 1, 1, 1,
0.06119112, 1.471636, 0.8509392, 1, 1, 1, 1, 1,
0.06500135, -0.9918818, 3.693259, 1, 1, 1, 1, 1,
0.06527388, 1.806138, 0.9442312, 1, 1, 1, 1, 1,
0.07811583, -1.038995, 1.422515, 1, 1, 1, 1, 1,
0.07896723, 0.8449059, 0.5649453, 1, 1, 1, 1, 1,
0.08441477, 0.6725156, -1.594932, 1, 1, 1, 1, 1,
0.08461402, -1.140958, 4.195587, 1, 1, 1, 1, 1,
0.08597337, 1.636553, 0.9861334, 1, 1, 1, 1, 1,
0.08902869, 0.466222, -0.4386398, 0, 0, 1, 1, 1,
0.08927046, 0.01378857, 1.910107, 1, 0, 0, 1, 1,
0.09236804, -0.8339737, 0.3560408, 1, 0, 0, 1, 1,
0.09478459, -0.9438118, 3.635887, 1, 0, 0, 1, 1,
0.1024909, -1.079417, 2.563276, 1, 0, 0, 1, 1,
0.1064828, 0.6481453, -0.8494493, 1, 0, 0, 1, 1,
0.1067763, 0.4818726, 0.6598727, 0, 0, 0, 1, 1,
0.1110225, -0.346254, 4.40406, 0, 0, 0, 1, 1,
0.1120814, 2.353947, 0.6436706, 0, 0, 0, 1, 1,
0.1178714, -0.6301014, 1.859976, 0, 0, 0, 1, 1,
0.1183455, 2.067062, 0.06742583, 0, 0, 0, 1, 1,
0.1191452, 1.383527, -0.4891256, 0, 0, 0, 1, 1,
0.1196582, 1.267742, -1.824868, 0, 0, 0, 1, 1,
0.1202507, 0.1007285, 0.1168451, 1, 1, 1, 1, 1,
0.1223489, -0.04398645, 1.469875, 1, 1, 1, 1, 1,
0.1231308, 0.1480107, 0.6410999, 1, 1, 1, 1, 1,
0.1238094, -0.1920739, 3.728569, 1, 1, 1, 1, 1,
0.1243897, 0.3124, 1.548741, 1, 1, 1, 1, 1,
0.1253767, 0.3143, 2.003806, 1, 1, 1, 1, 1,
0.1258851, -0.3403101, 1.516637, 1, 1, 1, 1, 1,
0.1281367, -0.9547331, 2.423611, 1, 1, 1, 1, 1,
0.1298318, 0.03940527, 1.594825, 1, 1, 1, 1, 1,
0.1298648, -0.5957782, 2.499096, 1, 1, 1, 1, 1,
0.1309856, 0.5937079, 0.2958407, 1, 1, 1, 1, 1,
0.1314291, 0.7040972, -0.5788063, 1, 1, 1, 1, 1,
0.1328188, -1.197519, 5.227695, 1, 1, 1, 1, 1,
0.1410016, -0.405207, 3.215572, 1, 1, 1, 1, 1,
0.1413609, -0.1125113, 2.526794, 1, 1, 1, 1, 1,
0.1414551, -1.67387, 3.153878, 0, 0, 1, 1, 1,
0.143969, 0.196029, -0.9929704, 1, 0, 0, 1, 1,
0.1499712, -0.7921781, 4.597166, 1, 0, 0, 1, 1,
0.1563996, -1.719795, 2.855269, 1, 0, 0, 1, 1,
0.157712, -0.1924435, 1.678889, 1, 0, 0, 1, 1,
0.1589121, -0.8884324, 3.363664, 1, 0, 0, 1, 1,
0.1611124, 2.218826, -0.5138625, 0, 0, 0, 1, 1,
0.1680606, -0.2858644, 2.413596, 0, 0, 0, 1, 1,
0.1712754, 1.482918, -1.646523, 0, 0, 0, 1, 1,
0.171601, 0.2540301, 1.111525, 0, 0, 0, 1, 1,
0.1717863, -1.947972, 2.176735, 0, 0, 0, 1, 1,
0.1722956, -1.185801, 1.837432, 0, 0, 0, 1, 1,
0.1781069, 0.1993173, 2.06114, 0, 0, 0, 1, 1,
0.1781414, 1.260947, 0.1135567, 1, 1, 1, 1, 1,
0.1783669, 0.6422564, 0.1710261, 1, 1, 1, 1, 1,
0.1799119, -2.433731, 2.784703, 1, 1, 1, 1, 1,
0.1805474, -2.303485, 3.806579, 1, 1, 1, 1, 1,
0.1825708, 0.5111651, 1.00375, 1, 1, 1, 1, 1,
0.183599, -1.825688, 4.846119, 1, 1, 1, 1, 1,
0.1880584, 0.7140973, 0.7784145, 1, 1, 1, 1, 1,
0.1883346, -2.570931, 1.352236, 1, 1, 1, 1, 1,
0.1984985, -1.130588, 2.972648, 1, 1, 1, 1, 1,
0.2071947, 0.4780616, 2.013436, 1, 1, 1, 1, 1,
0.2082118, -1.960007, 2.667385, 1, 1, 1, 1, 1,
0.2092182, -0.8907092, 0.8392048, 1, 1, 1, 1, 1,
0.2124069, 0.181451, 4.34001, 1, 1, 1, 1, 1,
0.2161066, 1.155139, -2.256977, 1, 1, 1, 1, 1,
0.2177719, 1.147518, 0.9544501, 1, 1, 1, 1, 1,
0.22447, 1.619229, -0.1915117, 0, 0, 1, 1, 1,
0.228201, 1.875652, -0.4121443, 1, 0, 0, 1, 1,
0.2286894, 0.2850724, 0.05618779, 1, 0, 0, 1, 1,
0.2293878, 0.6172133, 1.85544, 1, 0, 0, 1, 1,
0.2297481, -0.220584, 2.24649, 1, 0, 0, 1, 1,
0.2365254, -3.337264, 3.514766, 1, 0, 0, 1, 1,
0.2388396, -2.268603, 1.479231, 0, 0, 0, 1, 1,
0.2389966, 0.6996692, 0.3443817, 0, 0, 0, 1, 1,
0.2390518, 0.9808104, 1.298284, 0, 0, 0, 1, 1,
0.2392371, 0.8797065, -0.60264, 0, 0, 0, 1, 1,
0.2404863, -0.991699, 2.303113, 0, 0, 0, 1, 1,
0.2420069, -1.289093, 3.36738, 0, 0, 0, 1, 1,
0.2431162, 0.3550075, 0.8915393, 0, 0, 0, 1, 1,
0.2437361, 1.13121, 0.1725999, 1, 1, 1, 1, 1,
0.2460628, -1.808418, 3.694992, 1, 1, 1, 1, 1,
0.2464467, -0.9910516, 2.04462, 1, 1, 1, 1, 1,
0.2484055, 1.457471, 1.170645, 1, 1, 1, 1, 1,
0.2489074, 0.1230069, 0.8709396, 1, 1, 1, 1, 1,
0.2519807, 0.5310331, 1.531693, 1, 1, 1, 1, 1,
0.265296, 0.8883616, 0.8967922, 1, 1, 1, 1, 1,
0.2724643, -2.052183, 2.182468, 1, 1, 1, 1, 1,
0.2759688, 1.235082, -1.046616, 1, 1, 1, 1, 1,
0.2765962, -0.7169362, 2.565459, 1, 1, 1, 1, 1,
0.2768572, 0.9271339, -0.1956625, 1, 1, 1, 1, 1,
0.2777273, -0.1626916, 0.4929405, 1, 1, 1, 1, 1,
0.2796258, -0.05133506, 1.572735, 1, 1, 1, 1, 1,
0.2829331, -0.6910918, 3.072361, 1, 1, 1, 1, 1,
0.2900675, -0.4282082, 1.172842, 1, 1, 1, 1, 1,
0.2906663, 0.8454565, -0.55034, 0, 0, 1, 1, 1,
0.291751, 0.9329322, 0.1322717, 1, 0, 0, 1, 1,
0.2942175, 0.2221119, 1.369943, 1, 0, 0, 1, 1,
0.2958355, -0.6252415, 3.497605, 1, 0, 0, 1, 1,
0.2998442, 1.424318, 1.68828, 1, 0, 0, 1, 1,
0.3005328, 0.08861756, 2.523698, 1, 0, 0, 1, 1,
0.3016086, -0.4704365, 2.349108, 0, 0, 0, 1, 1,
0.3134606, -0.08248812, 1.00947, 0, 0, 0, 1, 1,
0.3137976, 1.721403, -0.664916, 0, 0, 0, 1, 1,
0.3223504, 0.630031, 0.6318799, 0, 0, 0, 1, 1,
0.3225349, -1.122523, 4.700658, 0, 0, 0, 1, 1,
0.3229559, -0.8823869, 2.183699, 0, 0, 0, 1, 1,
0.3233381, 0.8497246, 0.7596201, 0, 0, 0, 1, 1,
0.3279109, -0.7231576, 4.936394, 1, 1, 1, 1, 1,
0.3290325, -0.1519187, 1.050886, 1, 1, 1, 1, 1,
0.3334346, 0.7362106, -0.6989026, 1, 1, 1, 1, 1,
0.3353355, -0.3092379, 1.557618, 1, 1, 1, 1, 1,
0.3374594, 0.199029, 1.131012, 1, 1, 1, 1, 1,
0.3452809, -0.4024273, 1.354227, 1, 1, 1, 1, 1,
0.3470702, -1.517071, 3.683656, 1, 1, 1, 1, 1,
0.3490474, -0.7038106, 2.703347, 1, 1, 1, 1, 1,
0.3492864, -1.822559, 3.026694, 1, 1, 1, 1, 1,
0.3499115, 0.6334284, -0.476165, 1, 1, 1, 1, 1,
0.3504941, -0.1573163, 3.708493, 1, 1, 1, 1, 1,
0.353996, -0.5461929, 3.378843, 1, 1, 1, 1, 1,
0.3546987, -1.125774, 2.570703, 1, 1, 1, 1, 1,
0.3558027, 1.005197, 1.226323, 1, 1, 1, 1, 1,
0.3559539, 0.1568343, -0.129107, 1, 1, 1, 1, 1,
0.3576851, -0.8106982, 2.221364, 0, 0, 1, 1, 1,
0.3585182, -0.3060001, 1.078118, 1, 0, 0, 1, 1,
0.3612374, -1.247595, 2.154199, 1, 0, 0, 1, 1,
0.362669, -0.2159683, 3.201418, 1, 0, 0, 1, 1,
0.3642402, -2.559372, 2.766654, 1, 0, 0, 1, 1,
0.3652295, -1.380237, 4.084118, 1, 0, 0, 1, 1,
0.3677758, 0.3921717, 0.1864492, 0, 0, 0, 1, 1,
0.3695325, 1.981908, 0.5051185, 0, 0, 0, 1, 1,
0.370035, 0.6291252, 0.8995011, 0, 0, 0, 1, 1,
0.3735448, 0.4129833, 1.320362, 0, 0, 0, 1, 1,
0.3742864, -2.554785, 2.944935, 0, 0, 0, 1, 1,
0.3747623, -0.408089, 2.680674, 0, 0, 0, 1, 1,
0.375626, 0.08741234, 0.8658059, 0, 0, 0, 1, 1,
0.3776754, 1.31058, -0.5321484, 1, 1, 1, 1, 1,
0.3801192, 1.594297, 1.174792, 1, 1, 1, 1, 1,
0.3812991, 0.2344242, -0.3060275, 1, 1, 1, 1, 1,
0.3861628, -0.494019, 2.059318, 1, 1, 1, 1, 1,
0.3923537, 0.598601, 0.4339959, 1, 1, 1, 1, 1,
0.3938647, -0.9282891, 2.328499, 1, 1, 1, 1, 1,
0.3954408, 0.2203809, 0.04071231, 1, 1, 1, 1, 1,
0.3958937, -0.6327454, 2.236061, 1, 1, 1, 1, 1,
0.3965935, 0.2449723, 3.037302, 1, 1, 1, 1, 1,
0.4022631, 0.4497704, 0.7689, 1, 1, 1, 1, 1,
0.4081896, -0.6109709, 2.592025, 1, 1, 1, 1, 1,
0.409479, 0.6690682, 2.368734, 1, 1, 1, 1, 1,
0.4097778, -0.1138375, 2.979719, 1, 1, 1, 1, 1,
0.4102288, -1.918818, 2.422711, 1, 1, 1, 1, 1,
0.4118336, 0.01243945, 0.4334429, 1, 1, 1, 1, 1,
0.4145559, 0.189614, 0.6207254, 0, 0, 1, 1, 1,
0.414826, -0.01529243, 2.153497, 1, 0, 0, 1, 1,
0.4209631, -0.5836299, 1.778152, 1, 0, 0, 1, 1,
0.4256193, -0.07219015, 2.704654, 1, 0, 0, 1, 1,
0.4272827, 0.2722726, 0.9841523, 1, 0, 0, 1, 1,
0.4286871, -0.7946125, 1.839174, 1, 0, 0, 1, 1,
0.4312109, 2.013339, 2.067436, 0, 0, 0, 1, 1,
0.4317788, 0.6846554, 0.06748158, 0, 0, 0, 1, 1,
0.4319136, 0.2995664, 0.002686232, 0, 0, 0, 1, 1,
0.4319164, 2.297042, -0.6476678, 0, 0, 0, 1, 1,
0.4394305, -0.325936, 2.309522, 0, 0, 0, 1, 1,
0.439469, -0.145891, 1.957933, 0, 0, 0, 1, 1,
0.4460258, 1.202633, 0.6841966, 0, 0, 0, 1, 1,
0.4462077, 1.665023, -0.1201189, 1, 1, 1, 1, 1,
0.4498764, -0.8362925, 3.815994, 1, 1, 1, 1, 1,
0.4505081, -0.1031826, 1.240874, 1, 1, 1, 1, 1,
0.4581539, 0.1518879, 2.362864, 1, 1, 1, 1, 1,
0.4602759, -1.355295, 1.148659, 1, 1, 1, 1, 1,
0.4604796, 0.05796449, 2.111366, 1, 1, 1, 1, 1,
0.4636698, 1.342555, -0.3735377, 1, 1, 1, 1, 1,
0.4774905, -0.3169942, 0.7908933, 1, 1, 1, 1, 1,
0.4836557, 0.2329309, 2.804922, 1, 1, 1, 1, 1,
0.4850467, -0.1040272, 1.178653, 1, 1, 1, 1, 1,
0.4930279, -0.9545603, 0.9880955, 1, 1, 1, 1, 1,
0.494044, 0.8628673, 0.6248426, 1, 1, 1, 1, 1,
0.494519, 0.6358817, 1.253081, 1, 1, 1, 1, 1,
0.4971817, 0.9118859, 0.2332845, 1, 1, 1, 1, 1,
0.5004538, -0.1680412, 2.235399, 1, 1, 1, 1, 1,
0.5011135, -1.147695, 4.489468, 0, 0, 1, 1, 1,
0.5013049, -0.8183623, 1.952463, 1, 0, 0, 1, 1,
0.5079586, -0.992285, 2.608347, 1, 0, 0, 1, 1,
0.5137999, 1.270686, 1.733499, 1, 0, 0, 1, 1,
0.5202035, -0.5404788, 0.5539072, 1, 0, 0, 1, 1,
0.5220807, -0.7653402, 0.47645, 1, 0, 0, 1, 1,
0.5221331, 0.2959571, -0.3560688, 0, 0, 0, 1, 1,
0.5227583, 0.9841147, 1.846374, 0, 0, 0, 1, 1,
0.5244364, -1.419492, 1.762924, 0, 0, 0, 1, 1,
0.524922, -0.8914342, 3.102695, 0, 0, 0, 1, 1,
0.5316677, -0.1015675, 0.6110227, 0, 0, 0, 1, 1,
0.5385156, -0.8439291, 3.431748, 0, 0, 0, 1, 1,
0.5392312, -1.131399, 2.693312, 0, 0, 0, 1, 1,
0.5401325, 0.9211917, -0.308541, 1, 1, 1, 1, 1,
0.5420897, 0.005324643, 0.97159, 1, 1, 1, 1, 1,
0.5448614, 0.5637479, 1.104451, 1, 1, 1, 1, 1,
0.5454845, 1.029197, -0.06156828, 1, 1, 1, 1, 1,
0.5462277, 0.3628195, 0.2187199, 1, 1, 1, 1, 1,
0.5519636, 1.088814, -0.5349156, 1, 1, 1, 1, 1,
0.5665447, 1.537146, -0.8180367, 1, 1, 1, 1, 1,
0.570133, 0.4086094, 2.236776, 1, 1, 1, 1, 1,
0.5714441, 0.07831551, 1.025313, 1, 1, 1, 1, 1,
0.5719278, 0.01658492, 0.5531175, 1, 1, 1, 1, 1,
0.5747522, -0.1980896, 4.30638, 1, 1, 1, 1, 1,
0.577641, -2.158079, 1.062506, 1, 1, 1, 1, 1,
0.5793641, 0.1001503, 1.245763, 1, 1, 1, 1, 1,
0.583514, -0.4511314, 1.968265, 1, 1, 1, 1, 1,
0.5865808, 0.172995, 2.188654, 1, 1, 1, 1, 1,
0.5907947, 0.6652164, 0.9388589, 0, 0, 1, 1, 1,
0.5918829, -0.01842204, 4.413902, 1, 0, 0, 1, 1,
0.593281, 0.1086093, 0.4258478, 1, 0, 0, 1, 1,
0.6031594, -0.8313365, 3.106105, 1, 0, 0, 1, 1,
0.6048807, -0.1659337, 1.890286, 1, 0, 0, 1, 1,
0.608052, 0.3252869, 0.3314952, 1, 0, 0, 1, 1,
0.6099631, -0.4242088, 2.157614, 0, 0, 0, 1, 1,
0.6103035, 1.534877, 1.728642, 0, 0, 0, 1, 1,
0.6106455, -0.345264, 1.825241, 0, 0, 0, 1, 1,
0.6158821, -0.9245455, 1.708922, 0, 0, 0, 1, 1,
0.6187018, 0.8102067, 1.328148, 0, 0, 0, 1, 1,
0.6204771, 0.9295898, 0.7315514, 0, 0, 0, 1, 1,
0.6235397, -0.7500919, 3.147811, 0, 0, 0, 1, 1,
0.6306765, -0.07713473, 1.002724, 1, 1, 1, 1, 1,
0.6310468, -1.214583, 2.311759, 1, 1, 1, 1, 1,
0.6311038, 0.5437523, 0.1449325, 1, 1, 1, 1, 1,
0.633484, 0.5532615, -1.850119, 1, 1, 1, 1, 1,
0.6376992, -0.2700578, 2.299677, 1, 1, 1, 1, 1,
0.6391398, 0.03384009, 0.8450872, 1, 1, 1, 1, 1,
0.6416689, -0.6846589, 1.917699, 1, 1, 1, 1, 1,
0.647718, 0.1452375, 4.554712, 1, 1, 1, 1, 1,
0.6520814, 1.781632, 1.604073, 1, 1, 1, 1, 1,
0.6527576, -0.223916, 1.663447, 1, 1, 1, 1, 1,
0.6559047, 2.345989, 1.016863, 1, 1, 1, 1, 1,
0.6662445, 1.500484, 0.3205481, 1, 1, 1, 1, 1,
0.6673645, -0.9607806, 2.719028, 1, 1, 1, 1, 1,
0.6696749, -0.1633998, 1.049983, 1, 1, 1, 1, 1,
0.6710024, -0.7221267, 1.868308, 1, 1, 1, 1, 1,
0.6720346, -0.3170536, 1.386911, 0, 0, 1, 1, 1,
0.6743008, -2.022896, 2.156076, 1, 0, 0, 1, 1,
0.67853, -0.09736685, 2.604592, 1, 0, 0, 1, 1,
0.6786458, 1.098363, 2.892605, 1, 0, 0, 1, 1,
0.6790752, -0.2958206, 2.065474, 1, 0, 0, 1, 1,
0.6836753, -0.1965938, 2.364532, 1, 0, 0, 1, 1,
0.6881414, 1.018538, 1.478549, 0, 0, 0, 1, 1,
0.6882503, -0.6454736, 2.93287, 0, 0, 0, 1, 1,
0.6883306, 0.08557898, 0.6700402, 0, 0, 0, 1, 1,
0.6997981, 1.119957, 1.140226, 0, 0, 0, 1, 1,
0.7016572, -0.5468756, 2.852834, 0, 0, 0, 1, 1,
0.7053192, -0.291085, 3.743384, 0, 0, 0, 1, 1,
0.708562, -0.2631152, 2.161139, 0, 0, 0, 1, 1,
0.712155, -1.528449, 2.613129, 1, 1, 1, 1, 1,
0.7143046, -1.643826, 1.629656, 1, 1, 1, 1, 1,
0.7274145, -0.2754299, 2.490256, 1, 1, 1, 1, 1,
0.7331516, -1.810096, 4.240685, 1, 1, 1, 1, 1,
0.7404611, -0.3041986, 3.977375, 1, 1, 1, 1, 1,
0.7409045, 2.61852, 0.7427218, 1, 1, 1, 1, 1,
0.7423553, -0.5736062, 2.096806, 1, 1, 1, 1, 1,
0.7451718, -1.752189, 2.085948, 1, 1, 1, 1, 1,
0.7459346, -0.4470342, 0.9792864, 1, 1, 1, 1, 1,
0.7470676, -0.1074204, 1.794991, 1, 1, 1, 1, 1,
0.7523422, -1.801715, 2.085001, 1, 1, 1, 1, 1,
0.7564214, -1.96501, 1.951825, 1, 1, 1, 1, 1,
0.7566253, 1.117614, 0.2858807, 1, 1, 1, 1, 1,
0.7597811, -0.3741291, 1.945298, 1, 1, 1, 1, 1,
0.7602479, 0.3998593, 0.2178197, 1, 1, 1, 1, 1,
0.7714188, -1.57483, 3.467983, 0, 0, 1, 1, 1,
0.7721344, 0.781363, 1.352984, 1, 0, 0, 1, 1,
0.7722061, -0.2924055, 2.738434, 1, 0, 0, 1, 1,
0.7801136, -1.233206, 1.745732, 1, 0, 0, 1, 1,
0.7962056, -1.202532, 0.5484686, 1, 0, 0, 1, 1,
0.8017874, 0.493459, 2.719147, 1, 0, 0, 1, 1,
0.8050587, 1.562426, -0.116118, 0, 0, 0, 1, 1,
0.8123193, -0.4863105, 1.124039, 0, 0, 0, 1, 1,
0.8188499, 0.1504495, 1.122035, 0, 0, 0, 1, 1,
0.8265439, -1.57328, 2.801151, 0, 0, 0, 1, 1,
0.8331009, -0.164536, -0.1185565, 0, 0, 0, 1, 1,
0.8363203, 0.4027732, 0.1227151, 0, 0, 0, 1, 1,
0.8364196, 0.7895436, -1.236919, 0, 0, 0, 1, 1,
0.8427498, 1.031274, 1.269707, 1, 1, 1, 1, 1,
0.8433675, -0.5002099, 2.443698, 1, 1, 1, 1, 1,
0.843981, 0.7270594, 1.05716, 1, 1, 1, 1, 1,
0.8473374, -0.005109551, 1.142724, 1, 1, 1, 1, 1,
0.852145, 1.129016, 0.4339418, 1, 1, 1, 1, 1,
0.8538275, 0.7749543, -0.4957862, 1, 1, 1, 1, 1,
0.8606851, 1.061718, 0.8653438, 1, 1, 1, 1, 1,
0.8777013, 0.4983568, 0.9003292, 1, 1, 1, 1, 1,
0.8800395, 0.7891727, 1.195875, 1, 1, 1, 1, 1,
0.8813075, 1.613591, 0.9267321, 1, 1, 1, 1, 1,
0.883677, -0.1276256, 1.87243, 1, 1, 1, 1, 1,
0.8868453, -0.04274189, 2.662277, 1, 1, 1, 1, 1,
0.8909587, -1.43281, 3.4867, 1, 1, 1, 1, 1,
0.8926882, -0.4148498, 2.394435, 1, 1, 1, 1, 1,
0.9032022, 1.552012, -1.275842, 1, 1, 1, 1, 1,
0.9047532, 0.3278972, 2.028168, 0, 0, 1, 1, 1,
0.9058141, -0.1509249, 2.053884, 1, 0, 0, 1, 1,
0.9098297, -0.1627333, 4.392715, 1, 0, 0, 1, 1,
0.911797, 0.2605991, 1.441277, 1, 0, 0, 1, 1,
0.9150155, 1.094535, 0.4780689, 1, 0, 0, 1, 1,
0.9217924, -0.9822848, 3.181071, 1, 0, 0, 1, 1,
0.9239207, -1.012901, 2.593249, 0, 0, 0, 1, 1,
0.9250729, 0.126906, 1.578403, 0, 0, 0, 1, 1,
0.9274092, -0.7728407, 2.964266, 0, 0, 0, 1, 1,
0.9277704, 0.4796937, 1.261024, 0, 0, 0, 1, 1,
0.9349617, -0.1303093, 1.656573, 0, 0, 0, 1, 1,
0.9423673, 1.182496, -0.2847252, 0, 0, 0, 1, 1,
0.9637588, 1.440113, 0.4379728, 0, 0, 0, 1, 1,
0.9637886, -0.5323322, 2.657832, 1, 1, 1, 1, 1,
0.9670858, 0.743918, -0.6183404, 1, 1, 1, 1, 1,
0.9672452, -0.8534318, 3.353015, 1, 1, 1, 1, 1,
0.9757742, -1.2362, 2.68993, 1, 1, 1, 1, 1,
0.9836175, -0.0835419, 1.623544, 1, 1, 1, 1, 1,
1.004283, 0.4242502, 0.1190137, 1, 1, 1, 1, 1,
1.005148, 0.1808251, 0.8113261, 1, 1, 1, 1, 1,
1.006333, -0.3742742, 0.928548, 1, 1, 1, 1, 1,
1.00944, 1.07967, 0.3837121, 1, 1, 1, 1, 1,
1.015851, 1.097017, -1.612515, 1, 1, 1, 1, 1,
1.040312, -0.7874585, 4.045421, 1, 1, 1, 1, 1,
1.040362, -1.511867, 1.928036, 1, 1, 1, 1, 1,
1.040981, 1.343547, 0.9983506, 1, 1, 1, 1, 1,
1.042492, -1.348882, 4.093992, 1, 1, 1, 1, 1,
1.046175, 0.7051485, 1.465423, 1, 1, 1, 1, 1,
1.049502, 1.373304, -1.299195, 0, 0, 1, 1, 1,
1.050086, 0.6956978, 1.011859, 1, 0, 0, 1, 1,
1.056612, 0.3712466, 1.862787, 1, 0, 0, 1, 1,
1.060856, -1.801817, 2.084296, 1, 0, 0, 1, 1,
1.062083, 0.7058938, 0.8587731, 1, 0, 0, 1, 1,
1.069496, -0.1679185, 0.1916205, 1, 0, 0, 1, 1,
1.0701, 0.9764114, -0.4200766, 0, 0, 0, 1, 1,
1.072454, 1.376194, 1.664123, 0, 0, 0, 1, 1,
1.082244, -0.09085748, 2.027754, 0, 0, 0, 1, 1,
1.087036, -0.5332335, 2.438878, 0, 0, 0, 1, 1,
1.094987, -1.116552, 0.07189625, 0, 0, 0, 1, 1,
1.100043, -0.186691, 0.9034373, 0, 0, 0, 1, 1,
1.100883, 1.69203, 2.434366, 0, 0, 0, 1, 1,
1.103338, 1.030054, 0.8824762, 1, 1, 1, 1, 1,
1.114098, 0.1881475, 1.610801, 1, 1, 1, 1, 1,
1.115338, -0.5153593, 1.566435, 1, 1, 1, 1, 1,
1.117519, -0.03918864, 1.425089, 1, 1, 1, 1, 1,
1.119904, 0.1307698, 3.48964, 1, 1, 1, 1, 1,
1.12057, 1.921364, 0.9092109, 1, 1, 1, 1, 1,
1.124372, 0.600699, 1.396575, 1, 1, 1, 1, 1,
1.124779, 0.6965112, 1.81701, 1, 1, 1, 1, 1,
1.130152, 1.898704, 0.5839261, 1, 1, 1, 1, 1,
1.130346, 0.8693776, 0.2877392, 1, 1, 1, 1, 1,
1.13914, 1.14358, 2.583998, 1, 1, 1, 1, 1,
1.141165, 0.3561317, 2.756466, 1, 1, 1, 1, 1,
1.157087, 0.9193409, -0.4477538, 1, 1, 1, 1, 1,
1.168112, -1.850347, 2.428439, 1, 1, 1, 1, 1,
1.172068, -0.3656001, 1.883092, 1, 1, 1, 1, 1,
1.172662, 1.506889, 0.9304977, 0, 0, 1, 1, 1,
1.17416, 1.915204, 0.3707228, 1, 0, 0, 1, 1,
1.180314, 0.1434812, 2.870057, 1, 0, 0, 1, 1,
1.182055, 0.867613, 1.776282, 1, 0, 0, 1, 1,
1.185618, -0.385544, 2.231169, 1, 0, 0, 1, 1,
1.186168, -0.6999097, 4.447007, 1, 0, 0, 1, 1,
1.188613, 2.089318, -0.6775567, 0, 0, 0, 1, 1,
1.189049, -0.7212012, 2.123469, 0, 0, 0, 1, 1,
1.195357, -1.051345, 0.5895866, 0, 0, 0, 1, 1,
1.202813, 0.303355, 1.179124, 0, 0, 0, 1, 1,
1.207186, -0.2591121, 3.266163, 0, 0, 0, 1, 1,
1.208921, -0.06709639, 2.818914, 0, 0, 0, 1, 1,
1.212708, -0.644116, 3.06178, 0, 0, 0, 1, 1,
1.213357, -1.677653, 2.94891, 1, 1, 1, 1, 1,
1.215663, 1.499018, -0.248044, 1, 1, 1, 1, 1,
1.2234, -0.09555912, 1.515813, 1, 1, 1, 1, 1,
1.224082, 0.2305843, 0.9982114, 1, 1, 1, 1, 1,
1.226886, 0.2822101, 2.6333, 1, 1, 1, 1, 1,
1.227669, 0.6894489, 1.316988, 1, 1, 1, 1, 1,
1.233502, 0.5316198, 1.934046, 1, 1, 1, 1, 1,
1.256229, 0.9443873, 3.539803, 1, 1, 1, 1, 1,
1.256314, -0.346266, 1.782397, 1, 1, 1, 1, 1,
1.270626, -0.1940418, 3.000383, 1, 1, 1, 1, 1,
1.272392, 1.073723, 0.3197983, 1, 1, 1, 1, 1,
1.272586, -0.4017959, 1.503209, 1, 1, 1, 1, 1,
1.282539, -0.5413333, 1.787022, 1, 1, 1, 1, 1,
1.288489, 0.219093, 3.134177, 1, 1, 1, 1, 1,
1.293604, -0.7508987, 1.875295, 1, 1, 1, 1, 1,
1.323893, -0.1581862, -0.7791768, 0, 0, 1, 1, 1,
1.33481, -0.5161783, 2.039013, 1, 0, 0, 1, 1,
1.345121, 0.7402532, 1.937958, 1, 0, 0, 1, 1,
1.350988, 1.124723, 0.6279918, 1, 0, 0, 1, 1,
1.353853, -0.1531357, 2.395812, 1, 0, 0, 1, 1,
1.35457, -0.1339504, 1.868307, 1, 0, 0, 1, 1,
1.356284, 0.0008926496, 1.295044, 0, 0, 0, 1, 1,
1.362392, 0.1736984, 1.167562, 0, 0, 0, 1, 1,
1.369562, 0.04470904, 1.613201, 0, 0, 0, 1, 1,
1.370479, -1.476826, 1.993962, 0, 0, 0, 1, 1,
1.371872, -0.9460215, 1.480507, 0, 0, 0, 1, 1,
1.38011, -0.1415648, -0.6513454, 0, 0, 0, 1, 1,
1.38191, 0.9647506, 2.416471, 0, 0, 0, 1, 1,
1.3892, 0.1761956, 1.050595, 1, 1, 1, 1, 1,
1.389303, 2.562513, 0.920603, 1, 1, 1, 1, 1,
1.402496, 1.51689, 1.170182, 1, 1, 1, 1, 1,
1.407712, -0.1394516, 2.008839, 1, 1, 1, 1, 1,
1.409699, 0.2907873, 2.651926, 1, 1, 1, 1, 1,
1.409876, 0.2512754, 3.220812, 1, 1, 1, 1, 1,
1.413974, -1.165832, 0.8876944, 1, 1, 1, 1, 1,
1.429358, 0.4071136, 1.234778, 1, 1, 1, 1, 1,
1.437888, -0.8434423, 1.733343, 1, 1, 1, 1, 1,
1.450402, -0.8993481, 2.208134, 1, 1, 1, 1, 1,
1.459964, 1.049638, 0.1813213, 1, 1, 1, 1, 1,
1.467401, -0.241223, 0.0031577, 1, 1, 1, 1, 1,
1.484457, 1.002066, 0.4932081, 1, 1, 1, 1, 1,
1.485036, 0.2255448, 0.9737073, 1, 1, 1, 1, 1,
1.486354, -0.7209069, 0.4350719, 1, 1, 1, 1, 1,
1.48887, -1.153431, 2.115626, 0, 0, 1, 1, 1,
1.489224, 1.334167, 0.5879735, 1, 0, 0, 1, 1,
1.489637, -0.3207372, 2.963143, 1, 0, 0, 1, 1,
1.493751, -0.4157976, 2.555137, 1, 0, 0, 1, 1,
1.497226, -0.5158577, 0.4359511, 1, 0, 0, 1, 1,
1.51609, 0.5631465, 1.325886, 1, 0, 0, 1, 1,
1.518005, -1.397187, 3.262327, 0, 0, 0, 1, 1,
1.524449, 0.6744139, 2.009245, 0, 0, 0, 1, 1,
1.531525, 0.5674149, 1.319914, 0, 0, 0, 1, 1,
1.537723, 0.9067229, 0.6130176, 0, 0, 0, 1, 1,
1.547655, -0.972578, 1.678899, 0, 0, 0, 1, 1,
1.551373, 0.6219262, 2.387572, 0, 0, 0, 1, 1,
1.566452, 0.7222028, 0.8690751, 0, 0, 0, 1, 1,
1.572036, 1.619432, 4.057545, 1, 1, 1, 1, 1,
1.581333, 0.237175, 3.315205, 1, 1, 1, 1, 1,
1.586236, -1.525957, 1.798885, 1, 1, 1, 1, 1,
1.588013, 1.433553, 1.633047, 1, 1, 1, 1, 1,
1.601747, -0.7811095, 2.811499, 1, 1, 1, 1, 1,
1.619618, -1.338944, 2.235702, 1, 1, 1, 1, 1,
1.622278, -0.6270584, 0.6993207, 1, 1, 1, 1, 1,
1.627178, -1.020658, 0.7890972, 1, 1, 1, 1, 1,
1.632639, 0.3354644, 1.727937, 1, 1, 1, 1, 1,
1.635677, -1.318749, 3.545049, 1, 1, 1, 1, 1,
1.648101, -1.808267, 3.989393, 1, 1, 1, 1, 1,
1.663429, -0.08409325, 0.9848368, 1, 1, 1, 1, 1,
1.66617, -0.2300966, 1.380924, 1, 1, 1, 1, 1,
1.677421, -0.1043907, 2.559135, 1, 1, 1, 1, 1,
1.678195, -2.411798, 2.112151, 1, 1, 1, 1, 1,
1.698114, -0.5942011, 1.872332, 0, 0, 1, 1, 1,
1.702167, 0.3492299, 3.140706, 1, 0, 0, 1, 1,
1.716451, 0.4351902, 0.6402503, 1, 0, 0, 1, 1,
1.719686, 0.06020399, 0.9441629, 1, 0, 0, 1, 1,
1.741478, -1.58907, 3.360806, 1, 0, 0, 1, 1,
1.742669, 0.443028, 0.6208671, 1, 0, 0, 1, 1,
1.748012, -1.988529, 1.63716, 0, 0, 0, 1, 1,
1.761851, 0.6589491, 0.5751861, 0, 0, 0, 1, 1,
1.767328, 1.035044, 1.539404, 0, 0, 0, 1, 1,
1.78011, -2.144464, 2.032669, 0, 0, 0, 1, 1,
1.782384, -0.1513921, -0.4773891, 0, 0, 0, 1, 1,
1.785977, -0.4455381, 3.021605, 0, 0, 0, 1, 1,
1.790482, 0.325551, 1.358848, 0, 0, 0, 1, 1,
1.821639, -0.7213302, 2.993297, 1, 1, 1, 1, 1,
1.833249, -0.4962994, 0.001579659, 1, 1, 1, 1, 1,
1.852866, 0.9233118, 0.1482733, 1, 1, 1, 1, 1,
1.866733, 0.1994482, 1.800727, 1, 1, 1, 1, 1,
1.879947, -0.4399625, 1.925254, 1, 1, 1, 1, 1,
1.906066, 0.1873262, 2.325455, 1, 1, 1, 1, 1,
1.91402, 0.7385745, 0.9058269, 1, 1, 1, 1, 1,
1.914128, 0.806381, 3.323323, 1, 1, 1, 1, 1,
1.945043, 0.2607955, 1.249144, 1, 1, 1, 1, 1,
1.957422, -0.9274982, 2.727347, 1, 1, 1, 1, 1,
1.965293, 1.600054, 1.295948, 1, 1, 1, 1, 1,
2.068679, 0.8039652, 1.060289, 1, 1, 1, 1, 1,
2.11002, 0.1906635, 0.9792439, 1, 1, 1, 1, 1,
2.139763, 1.254538, 0.07272444, 1, 1, 1, 1, 1,
2.148546, 0.2517314, 0.4451777, 1, 1, 1, 1, 1,
2.173423, -0.4873368, 1.455865, 0, 0, 1, 1, 1,
2.219285, 0.6906168, 1.465521, 1, 0, 0, 1, 1,
2.25373, -1.013453, 2.144861, 1, 0, 0, 1, 1,
2.261612, -1.553921, 1.100111, 1, 0, 0, 1, 1,
2.26285, 0.9117451, -0.702845, 1, 0, 0, 1, 1,
2.275503, 0.8189548, 0.8488693, 1, 0, 0, 1, 1,
2.284452, 0.5288724, 0.7926811, 0, 0, 0, 1, 1,
2.305655, 1.796247, 1.582527, 0, 0, 0, 1, 1,
2.318877, 1.035347, -0.2653173, 0, 0, 0, 1, 1,
2.387686, -0.4924943, 2.395486, 0, 0, 0, 1, 1,
2.42282, -1.105074, 1.904744, 0, 0, 0, 1, 1,
2.531062, 1.177451, 2.047932, 0, 0, 0, 1, 1,
2.643042, 0.7071679, 1.15544, 0, 0, 0, 1, 1,
2.687638, 1.828445, -0.4745814, 1, 1, 1, 1, 1,
2.706563, -0.447599, 3.285331, 1, 1, 1, 1, 1,
2.749182, 1.189347, 1.04907, 1, 1, 1, 1, 1,
2.832568, 0.01613004, 2.205791, 1, 1, 1, 1, 1,
2.91253, 0.2256417, -0.3459639, 1, 1, 1, 1, 1,
2.943586, 0.6196213, 1.852375, 1, 1, 1, 1, 1,
3.06036, 0.07666482, 1.368204, 1, 1, 1, 1, 1
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
var radius = 9.539584;
var distance = 33.50739;
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
mvMatrix.translate( 0.4327698, 0.05394149, -0.1717408 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.50739);
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
